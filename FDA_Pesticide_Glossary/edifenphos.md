---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-4.22518, 0.2575137, -1.592245, 1, 0, 0, 1,
-3.332716, -0.8130559, -1.218625, 1, 0.007843138, 0, 1,
-3.024945, 1.14416, -1.609395, 1, 0.01176471, 0, 1,
-2.84295, 1.144387, -0.2073411, 1, 0.01960784, 0, 1,
-2.754769, 0.02987107, -1.609676, 1, 0.02352941, 0, 1,
-2.436355, -0.780394, -1.780138, 1, 0.03137255, 0, 1,
-2.402498, -1.083837, -1.54403, 1, 0.03529412, 0, 1,
-2.330455, -2.445259, -2.383661, 1, 0.04313726, 0, 1,
-2.32009, 0.6803594, 0.0171892, 1, 0.04705882, 0, 1,
-2.270967, 0.3569006, -3.076355, 1, 0.05490196, 0, 1,
-2.195616, 0.09963923, -1.720978, 1, 0.05882353, 0, 1,
-2.194149, 0.3952967, -1.30855, 1, 0.06666667, 0, 1,
-2.190992, -1.450872, -1.628214, 1, 0.07058824, 0, 1,
-2.144808, -2.325502, -3.045069, 1, 0.07843138, 0, 1,
-2.101675, -0.3709262, -1.502811, 1, 0.08235294, 0, 1,
-2.050957, -1.97741, -3.54225, 1, 0.09019608, 0, 1,
-2.040703, 0.3583211, -1.130018, 1, 0.09411765, 0, 1,
-2.038421, -0.6814015, -1.917957, 1, 0.1019608, 0, 1,
-2.036906, -1.031548, -0.3420599, 1, 0.1098039, 0, 1,
-2.022737, -1.020135, -1.542306, 1, 0.1137255, 0, 1,
-1.996821, -0.05132196, -1.341701, 1, 0.1215686, 0, 1,
-1.989017, 1.102576, -1.18592, 1, 0.1254902, 0, 1,
-1.979674, 0.7993485, -0.7482055, 1, 0.1333333, 0, 1,
-1.945649, -0.9265917, -2.575239, 1, 0.1372549, 0, 1,
-1.931849, 0.2486115, -2.206137, 1, 0.145098, 0, 1,
-1.869772, 0.7752401, -1.478717, 1, 0.1490196, 0, 1,
-1.799692, 1.650703, -1.338304, 1, 0.1568628, 0, 1,
-1.78893, 0.380033, -0.9052942, 1, 0.1607843, 0, 1,
-1.74516, 0.8486422, -2.474284, 1, 0.1686275, 0, 1,
-1.718669, 0.1350112, -0.3989049, 1, 0.172549, 0, 1,
-1.692276, 1.791325, -0.06834673, 1, 0.1803922, 0, 1,
-1.681407, -0.8230592, -1.577006, 1, 0.1843137, 0, 1,
-1.676379, 0.3481671, -2.614625, 1, 0.1921569, 0, 1,
-1.674764, 0.3878352, -1.808868, 1, 0.1960784, 0, 1,
-1.668454, 0.5573324, -1.155395, 1, 0.2039216, 0, 1,
-1.651844, -0.6901633, -0.873997, 1, 0.2117647, 0, 1,
-1.642316, 1.007412, -0.3149663, 1, 0.2156863, 0, 1,
-1.608783, -0.3192964, -2.171051, 1, 0.2235294, 0, 1,
-1.603661, -0.5363002, -0.2178264, 1, 0.227451, 0, 1,
-1.582572, -1.406031, -2.333201, 1, 0.2352941, 0, 1,
-1.57896, 0.4806877, -0.5764761, 1, 0.2392157, 0, 1,
-1.561369, 1.498134, -1.525331, 1, 0.2470588, 0, 1,
-1.552777, -0.4306501, -1.108943, 1, 0.2509804, 0, 1,
-1.549041, 0.6546462, -1.823223, 1, 0.2588235, 0, 1,
-1.538279, 0.9032415, -2.701108, 1, 0.2627451, 0, 1,
-1.536028, -0.7989771, -2.919089, 1, 0.2705882, 0, 1,
-1.53155, 1.431028, -0.04022863, 1, 0.2745098, 0, 1,
-1.526632, 1.636413, -1.481279, 1, 0.282353, 0, 1,
-1.524419, 0.4119609, -1.806968, 1, 0.2862745, 0, 1,
-1.518065, -0.6070446, -0.92587, 1, 0.2941177, 0, 1,
-1.50647, -1.809706, -3.397302, 1, 0.3019608, 0, 1,
-1.504418, 0.8308656, -0.8000939, 1, 0.3058824, 0, 1,
-1.497494, 0.3657094, -0.7280015, 1, 0.3137255, 0, 1,
-1.473193, -0.765949, -1.570366, 1, 0.3176471, 0, 1,
-1.467834, 1.317617, 0.2945926, 1, 0.3254902, 0, 1,
-1.464031, -0.9801766, -1.665552, 1, 0.3294118, 0, 1,
-1.462236, 0.6074337, -2.454087, 1, 0.3372549, 0, 1,
-1.453797, 0.1213377, -0.7989508, 1, 0.3411765, 0, 1,
-1.450091, -0.6098266, -2.873752, 1, 0.3490196, 0, 1,
-1.448813, 0.8491491, -0.1558713, 1, 0.3529412, 0, 1,
-1.44732, 0.5129468, -1.155281, 1, 0.3607843, 0, 1,
-1.430682, 0.08048464, -3.185026, 1, 0.3647059, 0, 1,
-1.419845, 0.1482182, -2.156293, 1, 0.372549, 0, 1,
-1.417453, -0.5586888, -2.171602, 1, 0.3764706, 0, 1,
-1.412642, 0.09492574, -1.005926, 1, 0.3843137, 0, 1,
-1.397689, 1.90243, 1.849862, 1, 0.3882353, 0, 1,
-1.393553, -0.6075608, -2.334759, 1, 0.3960784, 0, 1,
-1.387256, -0.5473554, -1.188729, 1, 0.4039216, 0, 1,
-1.380976, -0.3055449, -2.518545, 1, 0.4078431, 0, 1,
-1.369191, -0.1989206, -0.9428229, 1, 0.4156863, 0, 1,
-1.359143, -0.1037368, -0.8106388, 1, 0.4196078, 0, 1,
-1.358576, 0.3622763, -1.838833, 1, 0.427451, 0, 1,
-1.35597, -0.5324278, -1.235882, 1, 0.4313726, 0, 1,
-1.343984, -1.70666, 0.07440566, 1, 0.4392157, 0, 1,
-1.33938, 0.07543427, -0.1517498, 1, 0.4431373, 0, 1,
-1.331797, -0.6413753, -1.841631, 1, 0.4509804, 0, 1,
-1.31509, 0.936748, -1.069842, 1, 0.454902, 0, 1,
-1.312741, -0.05959541, 0.3898178, 1, 0.4627451, 0, 1,
-1.312484, -0.7613847, -3.300715, 1, 0.4666667, 0, 1,
-1.304254, 1.998986, -1.760392, 1, 0.4745098, 0, 1,
-1.30167, 1.506743, 0.05774837, 1, 0.4784314, 0, 1,
-1.298456, 0.8011202, -1.81382, 1, 0.4862745, 0, 1,
-1.294372, -1.727072, -2.802389, 1, 0.4901961, 0, 1,
-1.288969, -1.226606, -1.996941, 1, 0.4980392, 0, 1,
-1.28736, -0.3512074, -1.680299, 1, 0.5058824, 0, 1,
-1.27256, 1.568627, -0.2434053, 1, 0.509804, 0, 1,
-1.252643, -0.6218671, -2.080376, 1, 0.5176471, 0, 1,
-1.240524, 0.758995, -1.399045, 1, 0.5215687, 0, 1,
-1.236437, -0.1413062, -1.83493, 1, 0.5294118, 0, 1,
-1.236299, 0.7980466, 1.138713, 1, 0.5333334, 0, 1,
-1.235073, 1.686706, -1.300628, 1, 0.5411765, 0, 1,
-1.228621, 0.1399807, -0.5818532, 1, 0.5450981, 0, 1,
-1.222846, -0.6609974, -2.794128, 1, 0.5529412, 0, 1,
-1.220775, 0.2316995, 0.05974641, 1, 0.5568628, 0, 1,
-1.216861, 0.1491652, -2.177329, 1, 0.5647059, 0, 1,
-1.216258, -0.2988669, -0.3094391, 1, 0.5686275, 0, 1,
-1.212947, -1.159536, -3.401603, 1, 0.5764706, 0, 1,
-1.208086, -0.8442451, -1.223369, 1, 0.5803922, 0, 1,
-1.207385, 0.5181202, -0.1501842, 1, 0.5882353, 0, 1,
-1.206984, 0.9896451, -0.9611684, 1, 0.5921569, 0, 1,
-1.200142, 0.5442637, -2.104506, 1, 0.6, 0, 1,
-1.193315, 0.4160701, -1.295215, 1, 0.6078432, 0, 1,
-1.189614, 0.2363481, -3.254189, 1, 0.6117647, 0, 1,
-1.186562, 1.310429, -1.712728, 1, 0.6196079, 0, 1,
-1.185081, -0.17771, -2.382032, 1, 0.6235294, 0, 1,
-1.185032, -1.781194, -4.194468, 1, 0.6313726, 0, 1,
-1.179537, -1.389958, -1.67658, 1, 0.6352941, 0, 1,
-1.17716, 0.04342838, -1.201351, 1, 0.6431373, 0, 1,
-1.177068, 1.179583, -1.068417, 1, 0.6470588, 0, 1,
-1.16176, -1.465494, -3.478128, 1, 0.654902, 0, 1,
-1.156209, 1.874172, 1.301041, 1, 0.6588235, 0, 1,
-1.153922, -0.5488828, -0.9772161, 1, 0.6666667, 0, 1,
-1.14662, -0.5013365, -1.9099, 1, 0.6705883, 0, 1,
-1.145043, -0.04989504, -2.746751, 1, 0.6784314, 0, 1,
-1.137153, 2.415256, -0.8476242, 1, 0.682353, 0, 1,
-1.124747, -0.2198606, -2.09285, 1, 0.6901961, 0, 1,
-1.120769, 0.3143219, -0.8707259, 1, 0.6941177, 0, 1,
-1.119172, 0.7142816, -0.3115215, 1, 0.7019608, 0, 1,
-1.118134, 0.6088107, -2.261747, 1, 0.7098039, 0, 1,
-1.11638, -0.4896251, -0.794305, 1, 0.7137255, 0, 1,
-1.109646, -0.6265399, -3.008876, 1, 0.7215686, 0, 1,
-1.108695, -0.2898807, -1.999907, 1, 0.7254902, 0, 1,
-1.10602, 1.031225, -0.4791731, 1, 0.7333333, 0, 1,
-1.104446, 0.4389273, 1.05494, 1, 0.7372549, 0, 1,
-1.10068, -0.06141378, 0.1367037, 1, 0.7450981, 0, 1,
-1.099692, -0.9347532, -1.80763, 1, 0.7490196, 0, 1,
-1.098709, 0.3412578, -0.03885489, 1, 0.7568628, 0, 1,
-1.093338, -0.1096088, -1.818936, 1, 0.7607843, 0, 1,
-1.088192, -0.7343675, -4.010833, 1, 0.7686275, 0, 1,
-1.084635, -0.1314526, 0.8165964, 1, 0.772549, 0, 1,
-1.084027, 1.315966, -0.4902552, 1, 0.7803922, 0, 1,
-1.082751, -0.8942081, -1.639366, 1, 0.7843137, 0, 1,
-1.081441, 0.4340808, 0.09865232, 1, 0.7921569, 0, 1,
-1.074486, 0.3170215, -1.853369, 1, 0.7960784, 0, 1,
-1.061214, -0.588026, -2.951067, 1, 0.8039216, 0, 1,
-1.060052, 0.03245853, -0.6016598, 1, 0.8117647, 0, 1,
-1.058783, -1.694042, -2.31527, 1, 0.8156863, 0, 1,
-1.058496, 0.6948495, -1.81827, 1, 0.8235294, 0, 1,
-1.045849, 0.02226751, -0.5975921, 1, 0.827451, 0, 1,
-1.042716, 2.195329, 0.9948478, 1, 0.8352941, 0, 1,
-1.0411, -1.641618, -1.856586, 1, 0.8392157, 0, 1,
-1.040143, 0.05021221, -1.051076, 1, 0.8470588, 0, 1,
-1.034401, 1.094795, -0.4643353, 1, 0.8509804, 0, 1,
-1.032996, 0.8913585, -0.9893788, 1, 0.8588235, 0, 1,
-1.031567, 0.5676129, -2.287614, 1, 0.8627451, 0, 1,
-1.023304, 0.1569867, -1.040729, 1, 0.8705882, 0, 1,
-1.012571, 2.621207, 0.7904581, 1, 0.8745098, 0, 1,
-1.009271, -0.1336753, -1.275691, 1, 0.8823529, 0, 1,
-1.003539, 0.02254323, -4.00792, 1, 0.8862745, 0, 1,
-0.9998561, 0.2069762, -1.140187, 1, 0.8941177, 0, 1,
-0.9997077, 1.046229, -0.6121148, 1, 0.8980392, 0, 1,
-0.9956955, 0.05737697, -1.831578, 1, 0.9058824, 0, 1,
-0.9947299, -1.073028, -2.441459, 1, 0.9137255, 0, 1,
-0.9933736, -0.2617946, -0.5420799, 1, 0.9176471, 0, 1,
-0.9925113, 1.111681, -1.527199, 1, 0.9254902, 0, 1,
-0.990438, -0.8205723, -1.774533, 1, 0.9294118, 0, 1,
-0.976075, -0.6926121, -2.885846, 1, 0.9372549, 0, 1,
-0.9754801, 0.4505101, -0.5208861, 1, 0.9411765, 0, 1,
-0.970771, -1.546207, -0.4563472, 1, 0.9490196, 0, 1,
-0.963761, -0.02715888, -2.236688, 1, 0.9529412, 0, 1,
-0.9588675, 0.9731177, 0.5086835, 1, 0.9607843, 0, 1,
-0.9585477, -1.976947, -1.889377, 1, 0.9647059, 0, 1,
-0.9567297, 0.6575691, -1.675587, 1, 0.972549, 0, 1,
-0.9566597, -1.190577, -2.81131, 1, 0.9764706, 0, 1,
-0.956561, -0.2066742, -1.548342, 1, 0.9843137, 0, 1,
-0.9480667, 0.5375923, -2.75414, 1, 0.9882353, 0, 1,
-0.9322608, -0.1395164, -1.580884, 1, 0.9960784, 0, 1,
-0.9212383, 0.001425818, -3.711855, 0.9960784, 1, 0, 1,
-0.9198919, 1.700722, -1.031794, 0.9921569, 1, 0, 1,
-0.9167592, 0.2617387, -1.007509, 0.9843137, 1, 0, 1,
-0.9134987, -0.9307083, -2.188752, 0.9803922, 1, 0, 1,
-0.9113488, -1.365912, -5.133686, 0.972549, 1, 0, 1,
-0.904533, -0.3939416, -0.5657798, 0.9686275, 1, 0, 1,
-0.8995882, -0.206575, -1.75205, 0.9607843, 1, 0, 1,
-0.8953944, -0.7782537, -3.241232, 0.9568627, 1, 0, 1,
-0.8928952, -0.5925666, -2.618911, 0.9490196, 1, 0, 1,
-0.8846102, 0.1347215, -2.718128, 0.945098, 1, 0, 1,
-0.8815676, -2.513627, -4.228908, 0.9372549, 1, 0, 1,
-0.8779912, 0.8411787, -0.4740295, 0.9333333, 1, 0, 1,
-0.8745109, -0.7411172, -2.913529, 0.9254902, 1, 0, 1,
-0.8698279, 0.8535026, -0.5152131, 0.9215686, 1, 0, 1,
-0.8625765, 2.288322, 0.3507305, 0.9137255, 1, 0, 1,
-0.8610588, 0.3624027, -1.749684, 0.9098039, 1, 0, 1,
-0.8575824, 1.816167, 0.307038, 0.9019608, 1, 0, 1,
-0.8575513, 0.2172068, -1.802227, 0.8941177, 1, 0, 1,
-0.8570638, -0.7423388, -1.818496, 0.8901961, 1, 0, 1,
-0.85519, -1.77573, -3.049709, 0.8823529, 1, 0, 1,
-0.8549973, 0.07588913, -0.5495358, 0.8784314, 1, 0, 1,
-0.8545666, 0.4657932, -1.266295, 0.8705882, 1, 0, 1,
-0.8529013, 0.1862483, -1.002961, 0.8666667, 1, 0, 1,
-0.8507653, -0.2448636, 0.002482128, 0.8588235, 1, 0, 1,
-0.8486047, 0.1305733, -2.563536, 0.854902, 1, 0, 1,
-0.8384576, -0.9512821, -2.64464, 0.8470588, 1, 0, 1,
-0.8321683, 1.17606, -0.4316865, 0.8431373, 1, 0, 1,
-0.8314449, 1.515439, 0.4473976, 0.8352941, 1, 0, 1,
-0.8302008, -0.524025, -0.8192633, 0.8313726, 1, 0, 1,
-0.8278642, -1.803655, -3.547511, 0.8235294, 1, 0, 1,
-0.820964, -1.321476, -1.680476, 0.8196079, 1, 0, 1,
-0.8164169, -0.5573369, -2.11235, 0.8117647, 1, 0, 1,
-0.8100659, 0.2898208, -1.931455, 0.8078431, 1, 0, 1,
-0.8003947, -2.896518, -2.106292, 0.8, 1, 0, 1,
-0.7980841, 0.4858574, -1.43339, 0.7921569, 1, 0, 1,
-0.7843899, 0.5379817, -0.2266785, 0.7882353, 1, 0, 1,
-0.7821295, -0.3110089, -2.671692, 0.7803922, 1, 0, 1,
-0.7662084, 0.986083, -2.496587, 0.7764706, 1, 0, 1,
-0.765789, -1.324642, -2.30777, 0.7686275, 1, 0, 1,
-0.7622527, 0.888394, -2.698335, 0.7647059, 1, 0, 1,
-0.7592047, 0.3863035, -2.58632, 0.7568628, 1, 0, 1,
-0.7528066, -0.08031916, -2.132581, 0.7529412, 1, 0, 1,
-0.7511421, 0.1757054, 0.176071, 0.7450981, 1, 0, 1,
-0.7510518, 0.2689526, -0.4996273, 0.7411765, 1, 0, 1,
-0.7490417, -2.05961, -2.643039, 0.7333333, 1, 0, 1,
-0.7450209, 0.01469712, 1.666276, 0.7294118, 1, 0, 1,
-0.7445379, -0.6089353, -4.007951, 0.7215686, 1, 0, 1,
-0.7437381, 1.140541, -1.343698, 0.7176471, 1, 0, 1,
-0.7389119, -2.516418, -4.000359, 0.7098039, 1, 0, 1,
-0.7382454, -0.2029546, -1.679843, 0.7058824, 1, 0, 1,
-0.7339965, 0.4346003, -1.203526, 0.6980392, 1, 0, 1,
-0.7261611, -0.1769347, -1.828, 0.6901961, 1, 0, 1,
-0.7236438, 1.005407, -1.224967, 0.6862745, 1, 0, 1,
-0.7224634, 0.7380332, -1.511117, 0.6784314, 1, 0, 1,
-0.7203911, 0.03945179, -1.628941, 0.6745098, 1, 0, 1,
-0.7200177, 0.2758042, 0.7033681, 0.6666667, 1, 0, 1,
-0.7183484, -0.7458158, -1.578217, 0.6627451, 1, 0, 1,
-0.7163776, -0.509819, -3.017331, 0.654902, 1, 0, 1,
-0.7147614, -1.619189, -2.073847, 0.6509804, 1, 0, 1,
-0.7136225, 0.9468156, -1.351298, 0.6431373, 1, 0, 1,
-0.7083238, -0.9610689, -3.309707, 0.6392157, 1, 0, 1,
-0.7068064, -0.4651398, -2.165454, 0.6313726, 1, 0, 1,
-0.7005072, 0.1856013, -0.5677124, 0.627451, 1, 0, 1,
-0.700426, 0.5369574, 0.29276, 0.6196079, 1, 0, 1,
-0.6971257, 0.7955539, 0.3437494, 0.6156863, 1, 0, 1,
-0.6917999, -0.7030766, -3.435904, 0.6078432, 1, 0, 1,
-0.6869467, -0.8740551, -3.106297, 0.6039216, 1, 0, 1,
-0.6855443, -1.945893, -3.890834, 0.5960785, 1, 0, 1,
-0.683608, -0.5778834, -0.8909005, 0.5882353, 1, 0, 1,
-0.6827865, 0.917828, -0.6150219, 0.5843138, 1, 0, 1,
-0.6790299, -0.3262167, -1.476434, 0.5764706, 1, 0, 1,
-0.6765943, 1.025247, -1.480449, 0.572549, 1, 0, 1,
-0.6724868, 0.3778262, -0.6350995, 0.5647059, 1, 0, 1,
-0.665993, 0.9946321, -1.0989, 0.5607843, 1, 0, 1,
-0.6646702, 0.5700943, 0.5437437, 0.5529412, 1, 0, 1,
-0.6632725, 0.1383694, -1.689175, 0.5490196, 1, 0, 1,
-0.6630893, 1.064382, -0.3440239, 0.5411765, 1, 0, 1,
-0.6582894, 0.5542976, -0.3397618, 0.5372549, 1, 0, 1,
-0.6582457, -1.230813, -3.155895, 0.5294118, 1, 0, 1,
-0.6568397, 1.529258, 1.624342, 0.5254902, 1, 0, 1,
-0.6548083, -0.8761493, -2.584429, 0.5176471, 1, 0, 1,
-0.6527002, 0.08480458, -1.29184, 0.5137255, 1, 0, 1,
-0.6522489, 0.280198, -0.2035905, 0.5058824, 1, 0, 1,
-0.6491135, 0.1887849, -1.166531, 0.5019608, 1, 0, 1,
-0.6457522, 2.990468, 0.5177276, 0.4941176, 1, 0, 1,
-0.6438849, 1.240267, -0.8889524, 0.4862745, 1, 0, 1,
-0.641117, -0.1744065, -0.2576811, 0.4823529, 1, 0, 1,
-0.6400176, 0.7734098, -1.03822, 0.4745098, 1, 0, 1,
-0.6370278, 0.3756946, -2.473084, 0.4705882, 1, 0, 1,
-0.6361403, 0.5831375, -0.4020236, 0.4627451, 1, 0, 1,
-0.6337987, -0.8050193, -1.176049, 0.4588235, 1, 0, 1,
-0.6320212, 1.809781, -0.3575118, 0.4509804, 1, 0, 1,
-0.6267819, -0.3938568, -1.203903, 0.4470588, 1, 0, 1,
-0.6266958, -0.06070155, -2.633499, 0.4392157, 1, 0, 1,
-0.62414, 0.07043757, -0.7316208, 0.4352941, 1, 0, 1,
-0.6194054, -0.973444, -2.643035, 0.427451, 1, 0, 1,
-0.6117824, 0.9109436, -0.04552615, 0.4235294, 1, 0, 1,
-0.6059312, 0.08517385, -1.505286, 0.4156863, 1, 0, 1,
-0.6036729, -1.591721, -3.71771, 0.4117647, 1, 0, 1,
-0.6033865, -0.3290515, -1.817846, 0.4039216, 1, 0, 1,
-0.5985307, -1.304552, -2.251604, 0.3960784, 1, 0, 1,
-0.5974244, 0.4957888, -0.7881213, 0.3921569, 1, 0, 1,
-0.5964841, -0.4527446, -1.412355, 0.3843137, 1, 0, 1,
-0.5867324, 0.09316424, -1.980261, 0.3803922, 1, 0, 1,
-0.5863526, -1.392435, -3.077486, 0.372549, 1, 0, 1,
-0.585388, 1.204209, -1.473584, 0.3686275, 1, 0, 1,
-0.584827, -0.1914651, -1.342349, 0.3607843, 1, 0, 1,
-0.5844117, 0.7928247, 0.2372586, 0.3568628, 1, 0, 1,
-0.582536, 1.546618, -1.38289, 0.3490196, 1, 0, 1,
-0.5784954, 0.2020703, -1.162185, 0.345098, 1, 0, 1,
-0.5783397, 0.5338418, -1.220986, 0.3372549, 1, 0, 1,
-0.5767534, -1.183891, -2.969174, 0.3333333, 1, 0, 1,
-0.5703493, 0.4037865, -1.88069, 0.3254902, 1, 0, 1,
-0.5694689, 1.942251, 0.1467922, 0.3215686, 1, 0, 1,
-0.5684931, 1.326124, 0.4315535, 0.3137255, 1, 0, 1,
-0.5674779, -0.02976975, -1.3829, 0.3098039, 1, 0, 1,
-0.5661551, 0.621681, -0.9280777, 0.3019608, 1, 0, 1,
-0.5649471, 0.666446, 1.423772, 0.2941177, 1, 0, 1,
-0.5612751, 1.052518, -0.3811638, 0.2901961, 1, 0, 1,
-0.5550421, -2.159852, -3.151193, 0.282353, 1, 0, 1,
-0.5535018, 1.139406, -2.799496, 0.2784314, 1, 0, 1,
-0.5500031, 1.086135, -0.2312624, 0.2705882, 1, 0, 1,
-0.546509, -0.7567065, -2.844717, 0.2666667, 1, 0, 1,
-0.5446799, 1.421643, -1.230586, 0.2588235, 1, 0, 1,
-0.5386245, -0.1099837, -1.704454, 0.254902, 1, 0, 1,
-0.5385449, 0.5580863, -1.92513, 0.2470588, 1, 0, 1,
-0.5380957, -0.4535441, -2.110679, 0.2431373, 1, 0, 1,
-0.5373026, 0.3687745, -0.8250315, 0.2352941, 1, 0, 1,
-0.5351772, 1.991463, 1.656617, 0.2313726, 1, 0, 1,
-0.5329138, -0.1896605, -1.377973, 0.2235294, 1, 0, 1,
-0.5317885, -0.6324176, -1.656702, 0.2196078, 1, 0, 1,
-0.5306242, -0.2615729, -1.893787, 0.2117647, 1, 0, 1,
-0.5302868, -1.22967, -2.475558, 0.2078431, 1, 0, 1,
-0.5249041, -0.2408076, -3.788427, 0.2, 1, 0, 1,
-0.5235611, -0.8915789, -1.645716, 0.1921569, 1, 0, 1,
-0.5221817, 0.3015027, 0.06690826, 0.1882353, 1, 0, 1,
-0.5165073, -0.2538006, -2.338107, 0.1803922, 1, 0, 1,
-0.5157387, -0.8524953, -2.917971, 0.1764706, 1, 0, 1,
-0.5153598, -0.9757665, -2.359064, 0.1686275, 1, 0, 1,
-0.5144218, -1.173355, -4.891467, 0.1647059, 1, 0, 1,
-0.5025204, -2.937594, -3.477007, 0.1568628, 1, 0, 1,
-0.4995269, -1.31487, -1.750466, 0.1529412, 1, 0, 1,
-0.4958825, 0.05965503, -1.007848, 0.145098, 1, 0, 1,
-0.4912379, 2.082092, -1.477519, 0.1411765, 1, 0, 1,
-0.4909654, 0.7942348, -0.6135275, 0.1333333, 1, 0, 1,
-0.4832434, -0.948513, -2.912037, 0.1294118, 1, 0, 1,
-0.4816191, -0.8947079, -2.359347, 0.1215686, 1, 0, 1,
-0.4752011, 0.1418014, -1.68058, 0.1176471, 1, 0, 1,
-0.4727392, 0.5517483, -0.8997868, 0.1098039, 1, 0, 1,
-0.47033, 0.3562841, -2.009719, 0.1058824, 1, 0, 1,
-0.4673692, -0.6491818, -3.308203, 0.09803922, 1, 0, 1,
-0.4671253, 1.129136, -0.2213093, 0.09019608, 1, 0, 1,
-0.4645092, -1.977992, -3.441817, 0.08627451, 1, 0, 1,
-0.4637257, -0.3028108, -1.491449, 0.07843138, 1, 0, 1,
-0.4622149, 0.5118383, -0.3908431, 0.07450981, 1, 0, 1,
-0.4618079, -0.5671538, -2.663245, 0.06666667, 1, 0, 1,
-0.4613803, 0.9158674, -0.1672391, 0.0627451, 1, 0, 1,
-0.4518362, 1.008246, -0.3645068, 0.05490196, 1, 0, 1,
-0.4504917, 0.4381771, -0.7753002, 0.05098039, 1, 0, 1,
-0.4500186, 0.6086034, -0.5604591, 0.04313726, 1, 0, 1,
-0.4493379, 1.464108, 0.1340931, 0.03921569, 1, 0, 1,
-0.4467101, 0.7957134, 0.0781036, 0.03137255, 1, 0, 1,
-0.4441513, 0.8634917, -1.040476, 0.02745098, 1, 0, 1,
-0.4354936, -0.3729663, -0.3987698, 0.01960784, 1, 0, 1,
-0.4291001, -1.748979, -2.305289, 0.01568628, 1, 0, 1,
-0.4248315, 2.381476, -0.01688889, 0.007843138, 1, 0, 1,
-0.4228724, 0.4794436, -0.8570185, 0.003921569, 1, 0, 1,
-0.4170845, -1.307018, -2.315302, 0, 1, 0.003921569, 1,
-0.4158982, 0.798591, 0.9704626, 0, 1, 0.01176471, 1,
-0.4114812, 0.6374903, -0.4816556, 0, 1, 0.01568628, 1,
-0.4099135, 1.489862, 1.366491, 0, 1, 0.02352941, 1,
-0.408815, 0.3780437, -0.3710136, 0, 1, 0.02745098, 1,
-0.4070718, -0.7185992, -2.262155, 0, 1, 0.03529412, 1,
-0.4058225, 1.572593, -0.7019384, 0, 1, 0.03921569, 1,
-0.4044334, 0.4170719, -0.7087675, 0, 1, 0.04705882, 1,
-0.4012763, -0.7439429, -1.853834, 0, 1, 0.05098039, 1,
-0.397058, -1.5868, -3.520987, 0, 1, 0.05882353, 1,
-0.3941781, -2.279246, -4.594818, 0, 1, 0.0627451, 1,
-0.3937211, 0.2321093, -2.346055, 0, 1, 0.07058824, 1,
-0.3920285, -2.605958, -1.677552, 0, 1, 0.07450981, 1,
-0.3808239, 0.0109816, -0.7068459, 0, 1, 0.08235294, 1,
-0.375887, 1.599357, -0.7572971, 0, 1, 0.08627451, 1,
-0.3735713, -0.7958304, -2.470264, 0, 1, 0.09411765, 1,
-0.3699828, -0.398837, -1.217791, 0, 1, 0.1019608, 1,
-0.3682539, -1.072043, -1.79973, 0, 1, 0.1058824, 1,
-0.3668751, -0.4426244, -1.70474, 0, 1, 0.1137255, 1,
-0.3662217, -0.1407686, -2.146426, 0, 1, 0.1176471, 1,
-0.3619727, 1.567516, -0.3471185, 0, 1, 0.1254902, 1,
-0.3614683, 1.184568, -1.130632, 0, 1, 0.1294118, 1,
-0.3584871, -0.6637259, -2.975501, 0, 1, 0.1372549, 1,
-0.3570504, -0.7731805, -1.836607, 0, 1, 0.1411765, 1,
-0.3569916, 0.3417592, -1.333527, 0, 1, 0.1490196, 1,
-0.3562693, -1.727662, -3.210347, 0, 1, 0.1529412, 1,
-0.3510508, -0.4015895, -2.996219, 0, 1, 0.1607843, 1,
-0.3471006, 1.75973, 0.9354563, 0, 1, 0.1647059, 1,
-0.3470634, -1.65716, -4.192906, 0, 1, 0.172549, 1,
-0.3466696, -1.581547, -3.515445, 0, 1, 0.1764706, 1,
-0.3428354, 0.4038242, 0.001154833, 0, 1, 0.1843137, 1,
-0.3421565, -0.7940472, -4.300159, 0, 1, 0.1882353, 1,
-0.3410882, -0.6828852, -1.247069, 0, 1, 0.1960784, 1,
-0.336278, -1.003115, -2.433045, 0, 1, 0.2039216, 1,
-0.3330284, 0.8095845, -0.4283746, 0, 1, 0.2078431, 1,
-0.331865, 1.088902, 0.3913606, 0, 1, 0.2156863, 1,
-0.3290074, -1.534401, -2.452543, 0, 1, 0.2196078, 1,
-0.3282905, 0.997889, 0.3816542, 0, 1, 0.227451, 1,
-0.3249687, -0.3639041, -1.008775, 0, 1, 0.2313726, 1,
-0.3185333, -0.6362907, -3.129706, 0, 1, 0.2392157, 1,
-0.3169302, 0.3612961, -0.5644128, 0, 1, 0.2431373, 1,
-0.3156919, -1.773671, -2.438123, 0, 1, 0.2509804, 1,
-0.3148026, 1.386477, -0.2426919, 0, 1, 0.254902, 1,
-0.309773, 1.12309, -0.5725411, 0, 1, 0.2627451, 1,
-0.3075764, 1.205296, -1.46348, 0, 1, 0.2666667, 1,
-0.305333, -0.32116, -1.577457, 0, 1, 0.2745098, 1,
-0.3051374, -0.784786, -3.033441, 0, 1, 0.2784314, 1,
-0.3029961, -0.5101408, -2.168935, 0, 1, 0.2862745, 1,
-0.301657, 0.3403962, -2.404597, 0, 1, 0.2901961, 1,
-0.2985399, 1.656339, 0.6205729, 0, 1, 0.2980392, 1,
-0.2974518, 0.3544015, -0.7908141, 0, 1, 0.3058824, 1,
-0.2958162, 0.3065321, 0.00251577, 0, 1, 0.3098039, 1,
-0.2943701, -0.4788205, -2.929951, 0, 1, 0.3176471, 1,
-0.2941655, 1.146195, 1.467507, 0, 1, 0.3215686, 1,
-0.287834, 0.7370186, -1.411623, 0, 1, 0.3294118, 1,
-0.2871616, -0.03154558, -1.069369, 0, 1, 0.3333333, 1,
-0.2859842, 0.9194635, -0.04683673, 0, 1, 0.3411765, 1,
-0.276347, 0.2375976, -0.7501301, 0, 1, 0.345098, 1,
-0.2748682, 0.2367646, -1.158128, 0, 1, 0.3529412, 1,
-0.2695023, -1.36688, -3.01098, 0, 1, 0.3568628, 1,
-0.2688662, -1.302968, -3.708825, 0, 1, 0.3647059, 1,
-0.2679854, 1.362418, 0.2273294, 0, 1, 0.3686275, 1,
-0.2638159, -1.347703, -0.7494851, 0, 1, 0.3764706, 1,
-0.263775, 2.469684, 0.9981523, 0, 1, 0.3803922, 1,
-0.2529488, 0.198263, -1.46986, 0, 1, 0.3882353, 1,
-0.2491844, -1.34789, -2.058444, 0, 1, 0.3921569, 1,
-0.2480033, 0.113387, -1.186545, 0, 1, 0.4, 1,
-0.2479312, -0.4566067, -3.107521, 0, 1, 0.4078431, 1,
-0.2471962, -1.238053, -3.319647, 0, 1, 0.4117647, 1,
-0.2449687, 0.9525114, 0.1130312, 0, 1, 0.4196078, 1,
-0.2348217, -2.593632, -2.615518, 0, 1, 0.4235294, 1,
-0.234605, -1.372172, -2.442787, 0, 1, 0.4313726, 1,
-0.2310553, -0.04690247, 0.1370718, 0, 1, 0.4352941, 1,
-0.2299265, -0.7085909, -5.700689, 0, 1, 0.4431373, 1,
-0.2260644, -1.520086, -1.969167, 0, 1, 0.4470588, 1,
-0.2176584, -0.6901914, -3.395654, 0, 1, 0.454902, 1,
-0.2129969, 0.7673795, 0.9957359, 0, 1, 0.4588235, 1,
-0.2111641, -0.7155598, -3.021724, 0, 1, 0.4666667, 1,
-0.2107685, 0.8975121, -0.260819, 0, 1, 0.4705882, 1,
-0.2090308, -1.083905, -2.055075, 0, 1, 0.4784314, 1,
-0.2041366, 0.9766936, 0.4521388, 0, 1, 0.4823529, 1,
-0.2009632, -0.9525982, -5.300861, 0, 1, 0.4901961, 1,
-0.1984573, -0.3642871, -1.088913, 0, 1, 0.4941176, 1,
-0.1912258, -0.322042, -1.702475, 0, 1, 0.5019608, 1,
-0.1884002, -0.4350469, -3.62323, 0, 1, 0.509804, 1,
-0.1882967, 0.02075054, -3.633684, 0, 1, 0.5137255, 1,
-0.1882863, 0.1789487, 0.2133611, 0, 1, 0.5215687, 1,
-0.1852203, 1.180731, 0.5708646, 0, 1, 0.5254902, 1,
-0.1841444, -1.069418, -1.715569, 0, 1, 0.5333334, 1,
-0.1839989, 0.4977145, -0.9850172, 0, 1, 0.5372549, 1,
-0.179716, -0.8678226, -2.133145, 0, 1, 0.5450981, 1,
-0.1792246, 0.05340741, -2.038886, 0, 1, 0.5490196, 1,
-0.1783499, -0.9153098, -2.461104, 0, 1, 0.5568628, 1,
-0.1763354, 1.748807, -0.4429709, 0, 1, 0.5607843, 1,
-0.1730617, 1.195173, 1.675739, 0, 1, 0.5686275, 1,
-0.1727068, 1.935384, 0.7154451, 0, 1, 0.572549, 1,
-0.1724944, -0.07609911, -2.896974, 0, 1, 0.5803922, 1,
-0.1668363, 0.6936176, 1.440143, 0, 1, 0.5843138, 1,
-0.166189, 0.4991761, -1.81696, 0, 1, 0.5921569, 1,
-0.1650817, -1.37919, -3.407237, 0, 1, 0.5960785, 1,
-0.16503, 1.412814, 0.489939, 0, 1, 0.6039216, 1,
-0.165005, 0.3575245, -0.4660051, 0, 1, 0.6117647, 1,
-0.1632949, 1.212988, 1.118269, 0, 1, 0.6156863, 1,
-0.1575468, 0.4067463, -1.417894, 0, 1, 0.6235294, 1,
-0.1550801, 0.2522332, -1.750132, 0, 1, 0.627451, 1,
-0.149618, -0.5445872, -2.410082, 0, 1, 0.6352941, 1,
-0.1477831, -0.2880681, -3.604341, 0, 1, 0.6392157, 1,
-0.147613, 0.9564979, 1.189731, 0, 1, 0.6470588, 1,
-0.1404107, 2.614447, 1.195134, 0, 1, 0.6509804, 1,
-0.1349659, -2.194567, -4.529593, 0, 1, 0.6588235, 1,
-0.1333938, 0.3851105, 0.6352213, 0, 1, 0.6627451, 1,
-0.1332738, -0.6257886, -3.201739, 0, 1, 0.6705883, 1,
-0.1327039, -0.0697562, -1.460695, 0, 1, 0.6745098, 1,
-0.1297565, 0.242605, -1.474108, 0, 1, 0.682353, 1,
-0.1287035, -1.656183, -1.768306, 0, 1, 0.6862745, 1,
-0.1272055, -0.5161068, -5.659283, 0, 1, 0.6941177, 1,
-0.1242342, 0.7258827, 0.3979293, 0, 1, 0.7019608, 1,
-0.1236226, 0.365305, -0.3627069, 0, 1, 0.7058824, 1,
-0.1211305, -1.744923, -2.982052, 0, 1, 0.7137255, 1,
-0.1148889, -2.239158, -2.526349, 0, 1, 0.7176471, 1,
-0.1144871, 0.9666754, 0.2381062, 0, 1, 0.7254902, 1,
-0.1136571, -0.3747251, -3.230232, 0, 1, 0.7294118, 1,
-0.1126815, -0.04212697, 0.07343282, 0, 1, 0.7372549, 1,
-0.1116896, -1.475087, -2.298359, 0, 1, 0.7411765, 1,
-0.1083293, 2.125595, 0.4435047, 0, 1, 0.7490196, 1,
-0.1080803, -0.8569072, -3.584282, 0, 1, 0.7529412, 1,
-0.106691, -0.6689036, -3.264384, 0, 1, 0.7607843, 1,
-0.1045776, 0.4523174, -1.440282, 0, 1, 0.7647059, 1,
-0.1041529, -0.1556061, -3.610873, 0, 1, 0.772549, 1,
-0.1037874, -0.3998743, -2.709265, 0, 1, 0.7764706, 1,
-0.1030534, -0.4617847, -2.766611, 0, 1, 0.7843137, 1,
-0.1009113, -0.07024708, -2.02158, 0, 1, 0.7882353, 1,
-0.1000015, 0.04314134, -0.7514068, 0, 1, 0.7960784, 1,
-0.09990181, 1.236998, -1.620659, 0, 1, 0.8039216, 1,
-0.09979619, 0.9099469, 0.71442, 0, 1, 0.8078431, 1,
-0.09466612, -1.262899, -4.220953, 0, 1, 0.8156863, 1,
-0.09316171, 0.3383073, 0.8056699, 0, 1, 0.8196079, 1,
-0.09040376, 1.700323, 0.5509449, 0, 1, 0.827451, 1,
-0.08317693, -0.1423051, -3.627618, 0, 1, 0.8313726, 1,
-0.08077899, 0.8976485, -0.8398618, 0, 1, 0.8392157, 1,
-0.07408979, 1.0388, 1.028796, 0, 1, 0.8431373, 1,
-0.07357214, 0.4066296, 0.1642724, 0, 1, 0.8509804, 1,
-0.07257029, 1.97688, -0.8448222, 0, 1, 0.854902, 1,
-0.07103596, -1.105706, -3.137859, 0, 1, 0.8627451, 1,
-0.06847011, 0.01568585, -0.4675296, 0, 1, 0.8666667, 1,
-0.06710768, -0.1458617, -2.403222, 0, 1, 0.8745098, 1,
-0.06684405, -0.797581, -3.118204, 0, 1, 0.8784314, 1,
-0.06619056, -1.651145, -4.426536, 0, 1, 0.8862745, 1,
-0.0646941, -0.8115005, -3.079778, 0, 1, 0.8901961, 1,
-0.06228457, -0.8569623, -2.787146, 0, 1, 0.8980392, 1,
-0.0567445, -0.9641935, -2.898156, 0, 1, 0.9058824, 1,
-0.05431967, 1.033655, -1.52514, 0, 1, 0.9098039, 1,
-0.05390954, 1.734647, 2.427226, 0, 1, 0.9176471, 1,
-0.05077216, -0.08237872, -3.597088, 0, 1, 0.9215686, 1,
-0.04818665, 0.9966859, -0.9823432, 0, 1, 0.9294118, 1,
-0.04666948, 2.50068, -0.5316524, 0, 1, 0.9333333, 1,
-0.0459247, -1.756077, -4.074988, 0, 1, 0.9411765, 1,
-0.0458345, 0.7504936, 0.8487931, 0, 1, 0.945098, 1,
-0.04532684, -0.6600513, -3.283847, 0, 1, 0.9529412, 1,
-0.03496116, 2.220978, 0.9497044, 0, 1, 0.9568627, 1,
-0.03266355, 0.2838197, 0.9212145, 0, 1, 0.9647059, 1,
-0.02253819, -0.7323748, -4.120126, 0, 1, 0.9686275, 1,
-0.02226899, 0.09313934, -1.223164, 0, 1, 0.9764706, 1,
-0.01774007, 0.6808248, 0.5676817, 0, 1, 0.9803922, 1,
-0.01729184, -1.399921, -1.56082, 0, 1, 0.9882353, 1,
-0.01471569, -0.5125864, -4.962344, 0, 1, 0.9921569, 1,
-0.01369248, -1.309562, -4.471082, 0, 1, 1, 1,
-0.01336611, 0.9970474, -1.569776, 0, 0.9921569, 1, 1,
-0.008110479, 0.7689055, 1.148472, 0, 0.9882353, 1, 1,
-0.000529927, -0.6216173, -3.952619, 0, 0.9803922, 1, 1,
0.001603488, -0.6024628, 3.509041, 0, 0.9764706, 1, 1,
0.002378801, 0.05848984, -1.492138, 0, 0.9686275, 1, 1,
0.00588891, -0.7838302, 2.434792, 0, 0.9647059, 1, 1,
0.01490341, -1.032846, 5.008502, 0, 0.9568627, 1, 1,
0.01504585, 0.3042006, 1.084506, 0, 0.9529412, 1, 1,
0.01671498, 0.4633881, 1.324502, 0, 0.945098, 1, 1,
0.01701016, -0.3914908, 3.728728, 0, 0.9411765, 1, 1,
0.02074072, 0.06055857, -0.2596343, 0, 0.9333333, 1, 1,
0.02190916, 0.4900872, -1.021597, 0, 0.9294118, 1, 1,
0.02407439, -0.2617286, 3.417305, 0, 0.9215686, 1, 1,
0.02680357, 0.3330545, 0.2411617, 0, 0.9176471, 1, 1,
0.03130822, -1.268347, 4.013064, 0, 0.9098039, 1, 1,
0.03238433, 0.2272249, 0.6758778, 0, 0.9058824, 1, 1,
0.03747826, -0.360714, 2.799484, 0, 0.8980392, 1, 1,
0.03894171, 1.620993, -0.6634726, 0, 0.8901961, 1, 1,
0.03980851, 0.5948819, -0.8933269, 0, 0.8862745, 1, 1,
0.04080261, -1.005265, 2.538528, 0, 0.8784314, 1, 1,
0.04173333, 0.3584481, -1.004239, 0, 0.8745098, 1, 1,
0.04189767, -2.507494, 4.758297, 0, 0.8666667, 1, 1,
0.04948759, 0.6546152, 0.503377, 0, 0.8627451, 1, 1,
0.05046171, -0.4756165, 3.234778, 0, 0.854902, 1, 1,
0.05321754, -0.8455834, 3.676894, 0, 0.8509804, 1, 1,
0.05857489, 0.09039182, 1.559717, 0, 0.8431373, 1, 1,
0.05973661, -0.8551181, 2.494297, 0, 0.8392157, 1, 1,
0.06066283, 1.681032, -0.1086566, 0, 0.8313726, 1, 1,
0.06271595, -1.391435, 2.825702, 0, 0.827451, 1, 1,
0.06341864, 0.8164285, -1.705545, 0, 0.8196079, 1, 1,
0.06389032, 0.6892725, 1.078679, 0, 0.8156863, 1, 1,
0.06429615, 0.3127404, 1.187592, 0, 0.8078431, 1, 1,
0.06437114, 1.041563, 1.083002, 0, 0.8039216, 1, 1,
0.06460681, 0.9002901, 1.96264, 0, 0.7960784, 1, 1,
0.06523816, 0.2355516, 0.7186518, 0, 0.7882353, 1, 1,
0.0676899, 0.6179398, -0.4968326, 0, 0.7843137, 1, 1,
0.07065301, 0.4658555, 1.270303, 0, 0.7764706, 1, 1,
0.07463453, 0.01054402, 1.609311, 0, 0.772549, 1, 1,
0.07498947, 0.7363396, 1.433798, 0, 0.7647059, 1, 1,
0.07687716, -1.599931, 3.79878, 0, 0.7607843, 1, 1,
0.07697641, -0.7452816, 3.598556, 0, 0.7529412, 1, 1,
0.0775485, -1.099028, 5.254042, 0, 0.7490196, 1, 1,
0.07860474, 0.254512, 0.6279099, 0, 0.7411765, 1, 1,
0.08019432, 0.2795551, -0.928445, 0, 0.7372549, 1, 1,
0.08129124, 1.036421, -0.1044923, 0, 0.7294118, 1, 1,
0.08276072, -0.3638324, 1.77643, 0, 0.7254902, 1, 1,
0.08344046, -0.2555726, 1.320469, 0, 0.7176471, 1, 1,
0.08479141, -1.000972, 3.249305, 0, 0.7137255, 1, 1,
0.08715475, -0.3656945, 2.482922, 0, 0.7058824, 1, 1,
0.08731734, 0.7419913, 1.119757, 0, 0.6980392, 1, 1,
0.08895715, 0.1376831, 0.8459941, 0, 0.6941177, 1, 1,
0.09116376, 0.2203699, 0.1900315, 0, 0.6862745, 1, 1,
0.09421781, -0.4228722, 2.468857, 0, 0.682353, 1, 1,
0.09756221, 0.3222496, -0.4512029, 0, 0.6745098, 1, 1,
0.09888526, 0.1718087, -0.5583345, 0, 0.6705883, 1, 1,
0.09910483, 1.255119, -0.4153768, 0, 0.6627451, 1, 1,
0.1030008, -0.2139276, 2.453998, 0, 0.6588235, 1, 1,
0.1067838, 0.1845211, -0.5977624, 0, 0.6509804, 1, 1,
0.1079693, -0.3120806, 3.71664, 0, 0.6470588, 1, 1,
0.1091721, -1.568701, 3.51561, 0, 0.6392157, 1, 1,
0.1132615, 0.6306315, -0.07702453, 0, 0.6352941, 1, 1,
0.1136765, -0.3100922, 3.920075, 0, 0.627451, 1, 1,
0.1173019, 2.052951, -0.9160538, 0, 0.6235294, 1, 1,
0.1254528, -0.345084, 3.425495, 0, 0.6156863, 1, 1,
0.1277122, -0.2177633, 1.047472, 0, 0.6117647, 1, 1,
0.1298199, 2.152267, -0.7147372, 0, 0.6039216, 1, 1,
0.1355838, -1.934965, 4.9092, 0, 0.5960785, 1, 1,
0.1362942, 0.4384938, 1.809422, 0, 0.5921569, 1, 1,
0.1385542, 1.197391, -1.06976, 0, 0.5843138, 1, 1,
0.1400805, 0.689913, 2.332407, 0, 0.5803922, 1, 1,
0.1425378, -0.2629102, 3.498809, 0, 0.572549, 1, 1,
0.1431066, -0.5682794, 4.933704, 0, 0.5686275, 1, 1,
0.1482411, -0.9175749, 3.861147, 0, 0.5607843, 1, 1,
0.1528643, -0.2250797, 2.8761, 0, 0.5568628, 1, 1,
0.1610871, 0.5674352, 1.372453, 0, 0.5490196, 1, 1,
0.1623209, -0.2501895, 1.073223, 0, 0.5450981, 1, 1,
0.1633089, 0.668466, -0.5161684, 0, 0.5372549, 1, 1,
0.1643546, -0.6707455, 3.220693, 0, 0.5333334, 1, 1,
0.1668341, 1.681642, 2.932171, 0, 0.5254902, 1, 1,
0.1724896, -0.09944136, 1.805595, 0, 0.5215687, 1, 1,
0.181275, -0.4878955, 2.9226, 0, 0.5137255, 1, 1,
0.184547, 0.2182044, 0.6334094, 0, 0.509804, 1, 1,
0.1867083, 0.9225784, 1.141066, 0, 0.5019608, 1, 1,
0.1888973, 0.500863, -0.6050515, 0, 0.4941176, 1, 1,
0.1920685, -0.02981904, 1.508873, 0, 0.4901961, 1, 1,
0.1924355, -0.8079073, 2.906952, 0, 0.4823529, 1, 1,
0.1933323, 0.5879527, 0.06703994, 0, 0.4784314, 1, 1,
0.1935886, -1.136032, 3.389401, 0, 0.4705882, 1, 1,
0.194704, 0.5084157, 0.7973495, 0, 0.4666667, 1, 1,
0.1969713, 1.331624, 0.1469183, 0, 0.4588235, 1, 1,
0.199443, -0.04987578, 1.452848, 0, 0.454902, 1, 1,
0.2059716, -1.512309, 3.473399, 0, 0.4470588, 1, 1,
0.206661, -0.412514, 2.55698, 0, 0.4431373, 1, 1,
0.2082274, -1.091961, 3.328924, 0, 0.4352941, 1, 1,
0.210493, 1.006087, 1.639478, 0, 0.4313726, 1, 1,
0.2108629, -0.4680741, 4.477881, 0, 0.4235294, 1, 1,
0.2149479, 0.7025538, 1.998781, 0, 0.4196078, 1, 1,
0.2180944, 1.911556, -0.2984866, 0, 0.4117647, 1, 1,
0.2181799, 1.088247, 0.08998133, 0, 0.4078431, 1, 1,
0.219063, 1.092137, -0.03343531, 0, 0.4, 1, 1,
0.2194271, -2.46463, 3.178687, 0, 0.3921569, 1, 1,
0.2237785, -1.335792, 2.863288, 0, 0.3882353, 1, 1,
0.2327382, 0.242091, -0.1241483, 0, 0.3803922, 1, 1,
0.2340631, 0.7498748, 1.697616, 0, 0.3764706, 1, 1,
0.2352985, 2.28506, -0.8616852, 0, 0.3686275, 1, 1,
0.2367771, 0.9889538, -0.09769557, 0, 0.3647059, 1, 1,
0.2420618, -0.5602554, 3.333687, 0, 0.3568628, 1, 1,
0.2430875, 0.07301123, 1.259972, 0, 0.3529412, 1, 1,
0.2460985, 1.026026, 0.768472, 0, 0.345098, 1, 1,
0.2471779, -0.5176911, 1.854687, 0, 0.3411765, 1, 1,
0.2474386, -0.9613816, 3.594813, 0, 0.3333333, 1, 1,
0.248163, -0.7301679, 2.758961, 0, 0.3294118, 1, 1,
0.2516962, -0.5820782, 0.9553872, 0, 0.3215686, 1, 1,
0.2522097, -0.6986761, 3.525098, 0, 0.3176471, 1, 1,
0.2537703, 1.141131, -1.102533, 0, 0.3098039, 1, 1,
0.2555625, -2.166767, 2.364253, 0, 0.3058824, 1, 1,
0.2585948, 0.4239264, -0.7163371, 0, 0.2980392, 1, 1,
0.2623217, -1.475974, 3.547467, 0, 0.2901961, 1, 1,
0.2664465, 0.8625773, -1.176171, 0, 0.2862745, 1, 1,
0.2675807, -1.036934, 1.747164, 0, 0.2784314, 1, 1,
0.2683032, -0.4642172, 2.675857, 0, 0.2745098, 1, 1,
0.2689436, -0.509191, 2.033546, 0, 0.2666667, 1, 1,
0.2718777, -0.7077103, 4.593893, 0, 0.2627451, 1, 1,
0.2736524, -0.1139752, 0.5650462, 0, 0.254902, 1, 1,
0.2782231, 0.115327, 0.1811396, 0, 0.2509804, 1, 1,
0.2784835, -1.396015, 4.037264, 0, 0.2431373, 1, 1,
0.2786202, -0.1071317, 1.870659, 0, 0.2392157, 1, 1,
0.2801945, -0.2458281, 2.501618, 0, 0.2313726, 1, 1,
0.2803182, 0.3274796, -0.2284681, 0, 0.227451, 1, 1,
0.2831143, 1.421253, -1.833836, 0, 0.2196078, 1, 1,
0.2882725, 0.2680232, 0.3121095, 0, 0.2156863, 1, 1,
0.2927565, 0.5864856, 1.949723, 0, 0.2078431, 1, 1,
0.2956449, -2.388877, 3.498292, 0, 0.2039216, 1, 1,
0.2960905, 0.9784668, 1.397326, 0, 0.1960784, 1, 1,
0.2969659, -1.111599, 1.978523, 0, 0.1882353, 1, 1,
0.2970991, -1.977522, 2.339611, 0, 0.1843137, 1, 1,
0.3004372, -0.6845291, 3.395063, 0, 0.1764706, 1, 1,
0.305683, 0.986335, -1.111683, 0, 0.172549, 1, 1,
0.3057356, 0.6212614, -1.035211, 0, 0.1647059, 1, 1,
0.3078875, -0.8306827, 3.293751, 0, 0.1607843, 1, 1,
0.3081531, 1.218228, -0.6505387, 0, 0.1529412, 1, 1,
0.3092249, -0.4361384, 2.961976, 0, 0.1490196, 1, 1,
0.310776, -1.29475, 2.569667, 0, 0.1411765, 1, 1,
0.3116053, 0.4255088, 1.665998, 0, 0.1372549, 1, 1,
0.3150131, -0.376282, 2.831498, 0, 0.1294118, 1, 1,
0.3203668, 1.494944, -0.2422244, 0, 0.1254902, 1, 1,
0.3237039, 0.3067583, -0.2205165, 0, 0.1176471, 1, 1,
0.3256972, 0.829183, 0.2782333, 0, 0.1137255, 1, 1,
0.3302853, -0.1773813, 1.808676, 0, 0.1058824, 1, 1,
0.3328904, 0.07314207, 2.534146, 0, 0.09803922, 1, 1,
0.33445, -0.8573905, 1.579734, 0, 0.09411765, 1, 1,
0.3357007, 0.5458853, 1.308002, 0, 0.08627451, 1, 1,
0.338108, -1.05677, 3.644412, 0, 0.08235294, 1, 1,
0.3423943, 0.7088867, -0.3436294, 0, 0.07450981, 1, 1,
0.3481159, 0.02659419, 0.8677332, 0, 0.07058824, 1, 1,
0.3533294, 0.6754711, 1.145716, 0, 0.0627451, 1, 1,
0.3538036, -0.1266996, 1.776713, 0, 0.05882353, 1, 1,
0.3557464, -0.2883613, 3.509609, 0, 0.05098039, 1, 1,
0.3583475, -0.5130678, 1.317586, 0, 0.04705882, 1, 1,
0.3599138, -0.449246, 2.064495, 0, 0.03921569, 1, 1,
0.3613204, -0.3266961, 2.599475, 0, 0.03529412, 1, 1,
0.3629239, 0.3751115, 0.2910219, 0, 0.02745098, 1, 1,
0.3652741, -0.5585581, 1.513807, 0, 0.02352941, 1, 1,
0.3677841, 0.2112522, -1.303733, 0, 0.01568628, 1, 1,
0.3688884, 0.09525635, 1.491399, 0, 0.01176471, 1, 1,
0.3695084, -0.6269872, 2.73571, 0, 0.003921569, 1, 1,
0.3708759, 0.5303087, 1.24124, 0.003921569, 0, 1, 1,
0.3729461, 1.782614, 0.6320385, 0.007843138, 0, 1, 1,
0.3735348, 0.2717006, 0.9864698, 0.01568628, 0, 1, 1,
0.3776397, 1.259504, -1.06781, 0.01960784, 0, 1, 1,
0.3778009, 0.1355632, 1.127086, 0.02745098, 0, 1, 1,
0.3835576, 0.04776811, 1.175996, 0.03137255, 0, 1, 1,
0.3840659, -0.07470655, 0.1462829, 0.03921569, 0, 1, 1,
0.3877508, 0.6629803, 0.6781271, 0.04313726, 0, 1, 1,
0.3991511, 1.579661, -0.6381804, 0.05098039, 0, 1, 1,
0.4037552, 0.4886718, 1.043427, 0.05490196, 0, 1, 1,
0.4088977, -0.6359814, 2.471644, 0.0627451, 0, 1, 1,
0.4109648, 0.8373594, -0.005061634, 0.06666667, 0, 1, 1,
0.415414, 0.0823044, -0.3711596, 0.07450981, 0, 1, 1,
0.4171378, 0.4322206, -0.3247304, 0.07843138, 0, 1, 1,
0.4289631, -1.099046, 0.8783267, 0.08627451, 0, 1, 1,
0.4292885, 0.3080013, 0.8055226, 0.09019608, 0, 1, 1,
0.4323972, 0.9439158, 0.7351345, 0.09803922, 0, 1, 1,
0.4374413, 1.706306, -0.8071988, 0.1058824, 0, 1, 1,
0.4375763, 0.09771065, 2.672143, 0.1098039, 0, 1, 1,
0.4380217, -0.6702757, 0.7088211, 0.1176471, 0, 1, 1,
0.4381501, 0.780511, 0.3846741, 0.1215686, 0, 1, 1,
0.4406471, -0.1184777, 3.259393, 0.1294118, 0, 1, 1,
0.4480737, 0.04419528, 2.798405, 0.1333333, 0, 1, 1,
0.4523365, -1.407585, 2.882915, 0.1411765, 0, 1, 1,
0.4545996, 0.2408397, 0.7937158, 0.145098, 0, 1, 1,
0.4552878, -0.02653982, 1.341245, 0.1529412, 0, 1, 1,
0.4558819, 1.224534, 0.9108168, 0.1568628, 0, 1, 1,
0.4576119, 0.3516344, 0.6359292, 0.1647059, 0, 1, 1,
0.4618874, 0.5323241, 0.5264527, 0.1686275, 0, 1, 1,
0.4620394, 1.004254, 0.4696995, 0.1764706, 0, 1, 1,
0.4641101, -0.402922, 2.166687, 0.1803922, 0, 1, 1,
0.4647699, 2.100814, 1.418355, 0.1882353, 0, 1, 1,
0.4656065, 0.05878945, 2.425404, 0.1921569, 0, 1, 1,
0.4660749, -0.01153602, 1.800671, 0.2, 0, 1, 1,
0.4783553, 0.01795236, 1.162025, 0.2078431, 0, 1, 1,
0.4799092, -0.1385005, 1.392006, 0.2117647, 0, 1, 1,
0.480038, -0.6986706, 2.560409, 0.2196078, 0, 1, 1,
0.4830167, -0.4827044, 2.577626, 0.2235294, 0, 1, 1,
0.4859768, 0.01671161, 2.383238, 0.2313726, 0, 1, 1,
0.4914187, -0.2789544, 2.844528, 0.2352941, 0, 1, 1,
0.5005106, 0.4706457, 0.9065752, 0.2431373, 0, 1, 1,
0.5023701, -1.804095, 3.742321, 0.2470588, 0, 1, 1,
0.5091631, -1.153784, 3.796999, 0.254902, 0, 1, 1,
0.5100688, 0.1455247, 2.241516, 0.2588235, 0, 1, 1,
0.5137404, -1.336892, 1.984559, 0.2666667, 0, 1, 1,
0.5159161, 1.162026, 0.1412372, 0.2705882, 0, 1, 1,
0.5159528, -1.305861, 3.001316, 0.2784314, 0, 1, 1,
0.5237988, -0.05088939, 2.442124, 0.282353, 0, 1, 1,
0.5252188, 0.1611802, 0.7907786, 0.2901961, 0, 1, 1,
0.5300184, -0.3769653, 2.483399, 0.2941177, 0, 1, 1,
0.5321552, 1.099091, -0.5411143, 0.3019608, 0, 1, 1,
0.5322698, -0.8358881, 2.776108, 0.3098039, 0, 1, 1,
0.5333596, 0.5169424, 1.002362, 0.3137255, 0, 1, 1,
0.5370008, -1.083204, 2.644908, 0.3215686, 0, 1, 1,
0.5377379, -0.751153, 1.701767, 0.3254902, 0, 1, 1,
0.5378318, -0.001989022, 2.651285, 0.3333333, 0, 1, 1,
0.5448701, -0.2027599, 2.132744, 0.3372549, 0, 1, 1,
0.5522614, -1.772973, 3.382014, 0.345098, 0, 1, 1,
0.5600287, 0.4099685, 1.678056, 0.3490196, 0, 1, 1,
0.5666977, 0.9287727, 0.5383981, 0.3568628, 0, 1, 1,
0.5673657, -0.03985002, 1.989223, 0.3607843, 0, 1, 1,
0.57132, 0.4236826, 1.123256, 0.3686275, 0, 1, 1,
0.5719728, 1.476993, 0.2614623, 0.372549, 0, 1, 1,
0.5771006, 0.8211429, -0.1697262, 0.3803922, 0, 1, 1,
0.5775307, -1.155698, 3.145943, 0.3843137, 0, 1, 1,
0.580264, 0.2230729, 0.869954, 0.3921569, 0, 1, 1,
0.5816033, 0.271235, 0.2844076, 0.3960784, 0, 1, 1,
0.5838351, 0.7145476, -1.463783, 0.4039216, 0, 1, 1,
0.5864459, -0.3719201, 1.928026, 0.4117647, 0, 1, 1,
0.5865563, 0.01013038, 0.4836064, 0.4156863, 0, 1, 1,
0.5913652, -0.2789626, 2.314722, 0.4235294, 0, 1, 1,
0.5925096, 1.247562, 3.34265, 0.427451, 0, 1, 1,
0.5998166, 0.8018535, -0.4312426, 0.4352941, 0, 1, 1,
0.6027645, -1.253052, 1.93565, 0.4392157, 0, 1, 1,
0.6031243, 1.25581, -0.7686334, 0.4470588, 0, 1, 1,
0.6051867, -0.5777702, 1.340418, 0.4509804, 0, 1, 1,
0.6067965, -0.6765274, 3.534194, 0.4588235, 0, 1, 1,
0.6068817, 0.307459, 0.6229154, 0.4627451, 0, 1, 1,
0.6114767, 0.4141525, 1.347148, 0.4705882, 0, 1, 1,
0.6121015, 0.8020471, 0.0451984, 0.4745098, 0, 1, 1,
0.6124447, 0.1025106, 2.215307, 0.4823529, 0, 1, 1,
0.6132556, -0.319184, 2.798377, 0.4862745, 0, 1, 1,
0.6150638, 1.640992, 2.888315, 0.4941176, 0, 1, 1,
0.630394, -0.4316299, 2.026597, 0.5019608, 0, 1, 1,
0.6321629, 0.5736731, 1.133237, 0.5058824, 0, 1, 1,
0.6364306, -0.8185427, 3.384507, 0.5137255, 0, 1, 1,
0.6369885, -0.1766624, 2.478981, 0.5176471, 0, 1, 1,
0.6377506, -0.02113288, 1.746024, 0.5254902, 0, 1, 1,
0.6390794, -0.08970522, 1.551763, 0.5294118, 0, 1, 1,
0.6400316, -0.4640594, 3.277538, 0.5372549, 0, 1, 1,
0.643892, -1.27833, 2.958481, 0.5411765, 0, 1, 1,
0.6483334, -0.2179044, 1.178274, 0.5490196, 0, 1, 1,
0.6547912, -0.2854682, 2.593153, 0.5529412, 0, 1, 1,
0.6548777, -0.1105073, 0.4493714, 0.5607843, 0, 1, 1,
0.6552348, -0.267149, 4.175275, 0.5647059, 0, 1, 1,
0.6568316, 0.6952692, 1.765115, 0.572549, 0, 1, 1,
0.6612401, 0.2827459, 0.9961403, 0.5764706, 0, 1, 1,
0.6700737, -0.6336331, 3.31734, 0.5843138, 0, 1, 1,
0.6808736, 0.5895865, 1.096413, 0.5882353, 0, 1, 1,
0.6834536, -0.2786646, 1.952199, 0.5960785, 0, 1, 1,
0.6860427, -0.1623166, 1.898813, 0.6039216, 0, 1, 1,
0.6943712, -0.214073, 1.462692, 0.6078432, 0, 1, 1,
0.6951789, -0.4374213, 0.07193024, 0.6156863, 0, 1, 1,
0.6991847, -0.5938994, 2.522218, 0.6196079, 0, 1, 1,
0.7101737, -1.930013, 4.23653, 0.627451, 0, 1, 1,
0.7186909, 0.04927298, 1.116949, 0.6313726, 0, 1, 1,
0.7195232, 0.6128946, 0.1741619, 0.6392157, 0, 1, 1,
0.7220386, -0.5886077, 2.383751, 0.6431373, 0, 1, 1,
0.7258888, 0.2394993, 1.819166, 0.6509804, 0, 1, 1,
0.7405219, -0.2793255, 3.104973, 0.654902, 0, 1, 1,
0.7466687, 0.975189, -0.7460105, 0.6627451, 0, 1, 1,
0.7469429, -0.7347503, 3.20151, 0.6666667, 0, 1, 1,
0.7488151, -1.315118, 3.962888, 0.6745098, 0, 1, 1,
0.7494682, 1.607156, -0.01215325, 0.6784314, 0, 1, 1,
0.7531281, -0.3901357, 0.3144848, 0.6862745, 0, 1, 1,
0.7594575, 0.5843145, -0.1914176, 0.6901961, 0, 1, 1,
0.7606831, 0.03995011, 0.7343532, 0.6980392, 0, 1, 1,
0.7622423, -0.577949, 4.5967, 0.7058824, 0, 1, 1,
0.7686749, -0.5949755, 1.165317, 0.7098039, 0, 1, 1,
0.7689083, 1.370983, 0.4946151, 0.7176471, 0, 1, 1,
0.7696694, 0.8089845, 1.394944, 0.7215686, 0, 1, 1,
0.7798306, 0.8634796, 0.2976049, 0.7294118, 0, 1, 1,
0.780165, -2.275846, 2.555998, 0.7333333, 0, 1, 1,
0.7812623, 0.1445107, 2.221879, 0.7411765, 0, 1, 1,
0.7856137, -2.130524, 1.898189, 0.7450981, 0, 1, 1,
0.7937479, 1.726058, 0.1071159, 0.7529412, 0, 1, 1,
0.7941758, 1.544262, 1.831306, 0.7568628, 0, 1, 1,
0.7943131, -2.697344, 2.722819, 0.7647059, 0, 1, 1,
0.7973689, 0.5318023, 1.155079, 0.7686275, 0, 1, 1,
0.7976475, 0.9890706, 0.6108264, 0.7764706, 0, 1, 1,
0.7995154, -0.02500714, 1.59341, 0.7803922, 0, 1, 1,
0.8021665, 0.29683, 0.8552024, 0.7882353, 0, 1, 1,
0.8029484, 0.01768955, 2.881415, 0.7921569, 0, 1, 1,
0.8107475, -0.6471676, 2.221888, 0.8, 0, 1, 1,
0.815359, -0.3014831, 1.664264, 0.8078431, 0, 1, 1,
0.8334336, -0.5322197, 2.305821, 0.8117647, 0, 1, 1,
0.8396178, 0.6577406, 0.03638516, 0.8196079, 0, 1, 1,
0.8407085, 0.8196582, -1.152569, 0.8235294, 0, 1, 1,
0.8428859, -2.077582, 0.7675671, 0.8313726, 0, 1, 1,
0.8469453, -1.043886, 3.720522, 0.8352941, 0, 1, 1,
0.8483584, 0.1536771, 0.6150751, 0.8431373, 0, 1, 1,
0.8486673, 0.919296, -1.337412, 0.8470588, 0, 1, 1,
0.8535494, 0.268107, 0.7706428, 0.854902, 0, 1, 1,
0.8558119, 0.09683144, 1.21091, 0.8588235, 0, 1, 1,
0.8590786, 1.525643, -0.185538, 0.8666667, 0, 1, 1,
0.8595926, -1.331449, 3.673425, 0.8705882, 0, 1, 1,
0.8670105, -0.3804736, 0.3354761, 0.8784314, 0, 1, 1,
0.8685797, -0.601274, 1.948283, 0.8823529, 0, 1, 1,
0.8701125, 1.704963, -0.5095435, 0.8901961, 0, 1, 1,
0.8705951, 0.5616508, 1.582576, 0.8941177, 0, 1, 1,
0.8729888, 0.5201694, 1.541631, 0.9019608, 0, 1, 1,
0.876098, -0.6630095, 1.814547, 0.9098039, 0, 1, 1,
0.8761587, 1.414806, 0.7168826, 0.9137255, 0, 1, 1,
0.8761731, -0.613914, 1.049017, 0.9215686, 0, 1, 1,
0.8777596, 0.151032, 0.8347614, 0.9254902, 0, 1, 1,
0.8782071, -0.1321566, 0.8661201, 0.9333333, 0, 1, 1,
0.8906332, -2.178435, 2.518917, 0.9372549, 0, 1, 1,
0.8914901, 0.6445001, -0.2083567, 0.945098, 0, 1, 1,
0.894901, -0.1754925, 1.039066, 0.9490196, 0, 1, 1,
0.9005709, 0.02189474, 1.069675, 0.9568627, 0, 1, 1,
0.9110045, -0.3333193, 2.192316, 0.9607843, 0, 1, 1,
0.9174264, 0.3420123, -0.2733396, 0.9686275, 0, 1, 1,
0.921995, 0.5674326, 1.286571, 0.972549, 0, 1, 1,
0.9225748, -0.7567139, 1.281752, 0.9803922, 0, 1, 1,
0.9254989, -2.217863, 2.534605, 0.9843137, 0, 1, 1,
0.9291784, -0.2689548, 3.100698, 0.9921569, 0, 1, 1,
0.9318746, -0.3665897, 0.1801462, 0.9960784, 0, 1, 1,
0.9392907, 0.6644874, 2.367368, 1, 0, 0.9960784, 1,
0.9486353, 0.4576719, 0.8024608, 1, 0, 0.9882353, 1,
0.9521699, -0.8283829, 1.461385, 1, 0, 0.9843137, 1,
0.9557831, -0.8327359, 2.035271, 1, 0, 0.9764706, 1,
0.9593258, -1.604553, 4.992344, 1, 0, 0.972549, 1,
0.9646204, 0.204778, 1.13376, 1, 0, 0.9647059, 1,
0.9669237, 0.3487745, 2.621883, 1, 0, 0.9607843, 1,
0.9699208, 0.4396281, 1.162368, 1, 0, 0.9529412, 1,
0.9701036, -1.540327, 2.236779, 1, 0, 0.9490196, 1,
0.9711835, 0.08136975, 0.1160854, 1, 0, 0.9411765, 1,
0.9733995, 0.3521872, 1.066925, 1, 0, 0.9372549, 1,
0.9756647, 0.2733675, 1.240064, 1, 0, 0.9294118, 1,
0.981936, -0.7332494, 3.151529, 1, 0, 0.9254902, 1,
0.9929269, 1.50467, 1.070183, 1, 0, 0.9176471, 1,
0.9966126, -0.2589031, -0.1532299, 1, 0, 0.9137255, 1,
0.9967912, 0.6734914, 0.2358622, 1, 0, 0.9058824, 1,
0.9998218, -0.0426919, 1.307469, 1, 0, 0.9019608, 1,
1.003964, 1.124463, -0.3087415, 1, 0, 0.8941177, 1,
1.006896, -0.5287585, 1.946759, 1, 0, 0.8862745, 1,
1.010188, 0.4446985, 0.6650064, 1, 0, 0.8823529, 1,
1.022424, -0.6278953, 1.815507, 1, 0, 0.8745098, 1,
1.031419, -0.880073, 1.729375, 1, 0, 0.8705882, 1,
1.038843, -0.1989397, 2.188268, 1, 0, 0.8627451, 1,
1.039886, 0.5769829, 0.3699747, 1, 0, 0.8588235, 1,
1.044367, -0.3779011, 2.785896, 1, 0, 0.8509804, 1,
1.04812, 0.475656, 2.30519, 1, 0, 0.8470588, 1,
1.048764, -2.353484, 2.17255, 1, 0, 0.8392157, 1,
1.052632, -0.4100002, 1.985968, 1, 0, 0.8352941, 1,
1.053874, -0.9647357, 3.819729, 1, 0, 0.827451, 1,
1.058597, 0.1003362, 2.778223, 1, 0, 0.8235294, 1,
1.060299, -0.6844241, 3.297686, 1, 0, 0.8156863, 1,
1.062289, 0.6796955, 0.8797341, 1, 0, 0.8117647, 1,
1.064184, -0.9113394, 1.664142, 1, 0, 0.8039216, 1,
1.070066, 0.2873799, 2.045548, 1, 0, 0.7960784, 1,
1.070289, -0.07073171, 3.154101, 1, 0, 0.7921569, 1,
1.076889, 0.8741885, 0.7440755, 1, 0, 0.7843137, 1,
1.078297, 1.575298, 0.6361293, 1, 0, 0.7803922, 1,
1.085072, -1.039083, 1.348526, 1, 0, 0.772549, 1,
1.088545, 0.7395651, 2.186333, 1, 0, 0.7686275, 1,
1.112343, 0.9450787, 0.1724893, 1, 0, 0.7607843, 1,
1.118833, 0.01676654, 0.6508008, 1, 0, 0.7568628, 1,
1.120742, -0.4930737, 1.880855, 1, 0, 0.7490196, 1,
1.124528, 1.33623, 1.74468, 1, 0, 0.7450981, 1,
1.133778, -0.7804181, 2.859466, 1, 0, 0.7372549, 1,
1.134334, 0.4654576, 2.17011, 1, 0, 0.7333333, 1,
1.134925, -0.3594428, 5.475397, 1, 0, 0.7254902, 1,
1.138387, -0.7651867, 1.297576, 1, 0, 0.7215686, 1,
1.138463, 0.09567801, 1.006968, 1, 0, 0.7137255, 1,
1.141117, 0.1728327, 1.764898, 1, 0, 0.7098039, 1,
1.144182, -0.6275681, 2.290273, 1, 0, 0.7019608, 1,
1.144687, -0.3057962, 2.580088, 1, 0, 0.6941177, 1,
1.147111, 0.1625449, 2.170078, 1, 0, 0.6901961, 1,
1.151961, -0.3374555, 2.984127, 1, 0, 0.682353, 1,
1.172944, 1.303217, 0.6874883, 1, 0, 0.6784314, 1,
1.17631, -0.8597201, 1.702893, 1, 0, 0.6705883, 1,
1.186405, -0.6141598, 1.864404, 1, 0, 0.6666667, 1,
1.20537, 0.4533392, 1.15002, 1, 0, 0.6588235, 1,
1.213643, 1.201129, 0.924109, 1, 0, 0.654902, 1,
1.219452, -0.4664506, 2.276185, 1, 0, 0.6470588, 1,
1.224768, 0.1419091, 1.069168, 1, 0, 0.6431373, 1,
1.233428, 1.834819, 1.767835, 1, 0, 0.6352941, 1,
1.238655, 0.02853606, 1.555729, 1, 0, 0.6313726, 1,
1.241663, -0.9062072, 1.833859, 1, 0, 0.6235294, 1,
1.241985, -1.022031, 1.355062, 1, 0, 0.6196079, 1,
1.243222, -0.3228175, 2.520474, 1, 0, 0.6117647, 1,
1.257564, 0.7855789, 0.555679, 1, 0, 0.6078432, 1,
1.266719, 0.1505887, 1.355675, 1, 0, 0.6, 1,
1.267275, -0.6658562, 0.7350301, 1, 0, 0.5921569, 1,
1.271739, 0.626341, 0.8709936, 1, 0, 0.5882353, 1,
1.271936, 1.893841, 1.427295, 1, 0, 0.5803922, 1,
1.274407, -0.9928205, 2.57529, 1, 0, 0.5764706, 1,
1.281804, 0.221803, 2.377904, 1, 0, 0.5686275, 1,
1.283787, 0.3321126, 0.2290006, 1, 0, 0.5647059, 1,
1.288897, -1.103152, 2.908191, 1, 0, 0.5568628, 1,
1.294636, 0.08308572, 3.545408, 1, 0, 0.5529412, 1,
1.303725, -0.3266687, 2.467723, 1, 0, 0.5450981, 1,
1.304044, -1.268593, 3.803774, 1, 0, 0.5411765, 1,
1.304971, -0.1755188, 1.457081, 1, 0, 0.5333334, 1,
1.306749, 1.649319, 1.865602, 1, 0, 0.5294118, 1,
1.316229, -0.8559785, 2.189355, 1, 0, 0.5215687, 1,
1.319415, -0.4949471, 2.20546, 1, 0, 0.5176471, 1,
1.322042, -1.079998, 1.375829, 1, 0, 0.509804, 1,
1.322127, -0.3256397, 1.428196, 1, 0, 0.5058824, 1,
1.322461, -1.200511, -0.1881514, 1, 0, 0.4980392, 1,
1.337683, 1.321217, 1.07612, 1, 0, 0.4901961, 1,
1.351025, -1.01193, 1.146784, 1, 0, 0.4862745, 1,
1.376206, -0.3689962, 1.469118, 1, 0, 0.4784314, 1,
1.381972, -0.4481549, 1.521136, 1, 0, 0.4745098, 1,
1.383304, 1.365745, -0.3745707, 1, 0, 0.4666667, 1,
1.384101, 0.4196779, 0.2227844, 1, 0, 0.4627451, 1,
1.403612, 1.213206, 0.7899148, 1, 0, 0.454902, 1,
1.410941, -0.5190738, 2.273891, 1, 0, 0.4509804, 1,
1.414804, -1.784471, 3.307275, 1, 0, 0.4431373, 1,
1.42537, 1.253267, -0.0618406, 1, 0, 0.4392157, 1,
1.439139, -0.4001746, 1.048253, 1, 0, 0.4313726, 1,
1.441137, -1.019699, 1.745576, 1, 0, 0.427451, 1,
1.443699, -0.6893504, 1.769293, 1, 0, 0.4196078, 1,
1.46227, 0.8549253, 1.902591, 1, 0, 0.4156863, 1,
1.474827, 0.07072309, 1.399107, 1, 0, 0.4078431, 1,
1.47565, 1.631357, 0.01644707, 1, 0, 0.4039216, 1,
1.483747, 0.8869128, 1.108843, 1, 0, 0.3960784, 1,
1.488929, 0.8430718, -0.5989022, 1, 0, 0.3882353, 1,
1.491948, -0.6800781, 0.8268712, 1, 0, 0.3843137, 1,
1.494755, -0.3164297, 1.847819, 1, 0, 0.3764706, 1,
1.50961, 1.227815, 0.8375658, 1, 0, 0.372549, 1,
1.50961, -0.8654198, 0.6582443, 1, 0, 0.3647059, 1,
1.512923, 1.252378, 0.5959866, 1, 0, 0.3607843, 1,
1.520577, 0.4950865, 0.9448299, 1, 0, 0.3529412, 1,
1.526205, 1.440579, -0.1305859, 1, 0, 0.3490196, 1,
1.526674, -0.2647561, 1.825663, 1, 0, 0.3411765, 1,
1.532097, -1.093472, 2.726365, 1, 0, 0.3372549, 1,
1.545929, 0.6732002, 2.043508, 1, 0, 0.3294118, 1,
1.560297, -0.7669414, 1.08839, 1, 0, 0.3254902, 1,
1.563166, 0.6120752, 1.142764, 1, 0, 0.3176471, 1,
1.566411, 1.628273, 1.881832, 1, 0, 0.3137255, 1,
1.574112, -0.9343687, 0.6723655, 1, 0, 0.3058824, 1,
1.606286, 0.4539921, 0.2248299, 1, 0, 0.2980392, 1,
1.623045, 1.869986, 2.097341, 1, 0, 0.2941177, 1,
1.653904, -0.8472744, 1.642873, 1, 0, 0.2862745, 1,
1.665616, 2.270964, 0.4226128, 1, 0, 0.282353, 1,
1.725723, -0.9620935, 2.609015, 1, 0, 0.2745098, 1,
1.749188, -0.439598, 2.503623, 1, 0, 0.2705882, 1,
1.767991, -0.6357428, 2.656557, 1, 0, 0.2627451, 1,
1.779446, 2.061159, -1.277964, 1, 0, 0.2588235, 1,
1.789978, 1.48696, 1.241073, 1, 0, 0.2509804, 1,
1.796687, 1.696847, 1.224223, 1, 0, 0.2470588, 1,
1.802058, -0.5037878, 1.833162, 1, 0, 0.2392157, 1,
1.84616, 0.3605565, 0.2731553, 1, 0, 0.2352941, 1,
1.846631, -0.2755889, 1.1385, 1, 0, 0.227451, 1,
1.849266, 1.194132, 2.089539, 1, 0, 0.2235294, 1,
1.866779, 0.4875, 3.826097, 1, 0, 0.2156863, 1,
1.902461, 1.476607, 0.5404648, 1, 0, 0.2117647, 1,
1.903651, -0.8770175, 2.121531, 1, 0, 0.2039216, 1,
1.928546, -0.8922672, 0.6856861, 1, 0, 0.1960784, 1,
1.94082, 2.453094, 0.5926651, 1, 0, 0.1921569, 1,
1.942763, 1.063893, 1.073288, 1, 0, 0.1843137, 1,
1.979552, 0.3014189, 1.829578, 1, 0, 0.1803922, 1,
2.00247, 1.352333, -0.1959523, 1, 0, 0.172549, 1,
2.002544, -0.3731591, 3.358588, 1, 0, 0.1686275, 1,
2.011798, -1.144088, 1.959687, 1, 0, 0.1607843, 1,
2.022983, 1.171179, 1.917109, 1, 0, 0.1568628, 1,
2.049088, -0.799292, 3.064031, 1, 0, 0.1490196, 1,
2.051718, 0.8619725, 2.740704, 1, 0, 0.145098, 1,
2.057985, -0.8830957, 2.0029, 1, 0, 0.1372549, 1,
2.058635, -0.3899073, -0.5975631, 1, 0, 0.1333333, 1,
2.063244, -0.9894004, 2.426223, 1, 0, 0.1254902, 1,
2.086392, 1.172693, 1.441542, 1, 0, 0.1215686, 1,
2.137661, 0.9520308, 2.504326, 1, 0, 0.1137255, 1,
2.138984, 1.35723, 1.681742, 1, 0, 0.1098039, 1,
2.144598, 0.8926585, 0.4703017, 1, 0, 0.1019608, 1,
2.16928, 0.2372238, 0.8841509, 1, 0, 0.09411765, 1,
2.184495, -0.7660368, 3.622003, 1, 0, 0.09019608, 1,
2.210074, -1.164184, 3.242856, 1, 0, 0.08235294, 1,
2.214808, -1.514049, 3.582474, 1, 0, 0.07843138, 1,
2.275199, -0.1906374, 1.733504, 1, 0, 0.07058824, 1,
2.285057, -0.8855522, 2.13593, 1, 0, 0.06666667, 1,
2.347158, 0.4023441, 2.331177, 1, 0, 0.05882353, 1,
2.365165, 0.7831122, 0.5103024, 1, 0, 0.05490196, 1,
2.5371, 0.2513333, 2.736752, 1, 0, 0.04705882, 1,
2.538364, 0.3308132, 1.532985, 1, 0, 0.04313726, 1,
2.661393, 0.5978253, 2.497856, 1, 0, 0.03529412, 1,
2.683153, 2.155525, 0.9048955, 1, 0, 0.03137255, 1,
2.713042, -0.142672, 1.979631, 1, 0, 0.02352941, 1,
2.730278, 0.4377475, 1.454826, 1, 0, 0.01960784, 1,
2.789454, 0.8534302, 2.151101, 1, 0, 0.01176471, 1,
2.863389, -0.564047, 0.6910546, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-0.6808954, -3.9424, -7.595036, 0, -0.5, 0.5, 0.5,
-0.6808954, -3.9424, -7.595036, 1, -0.5, 0.5, 0.5,
-0.6808954, -3.9424, -7.595036, 1, 1.5, 0.5, 0.5,
-0.6808954, -3.9424, -7.595036, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-5.426692, 0.02643716, -7.595036, 0, -0.5, 0.5, 0.5,
-5.426692, 0.02643716, -7.595036, 1, -0.5, 0.5, 0.5,
-5.426692, 0.02643716, -7.595036, 1, 1.5, 0.5, 0.5,
-5.426692, 0.02643716, -7.595036, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-5.426692, -3.9424, -0.1126459, 0, -0.5, 0.5, 0.5,
-5.426692, -3.9424, -0.1126459, 1, -0.5, 0.5, 0.5,
-5.426692, -3.9424, -0.1126459, 1, 1.5, 0.5, 0.5,
-5.426692, -3.9424, -0.1126459, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-4, -3.026515, -5.86833,
2, -3.026515, -5.86833,
-4, -3.026515, -5.86833,
-4, -3.179163, -6.156115,
-2, -3.026515, -5.86833,
-2, -3.179163, -6.156115,
0, -3.026515, -5.86833,
0, -3.179163, -6.156115,
2, -3.026515, -5.86833,
2, -3.179163, -6.156115
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-4",
"-2",
"0",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4, -3.484458, -6.731683, 0, -0.5, 0.5, 0.5,
-4, -3.484458, -6.731683, 1, -0.5, 0.5, 0.5,
-4, -3.484458, -6.731683, 1, 1.5, 0.5, 0.5,
-4, -3.484458, -6.731683, 0, 1.5, 0.5, 0.5,
-2, -3.484458, -6.731683, 0, -0.5, 0.5, 0.5,
-2, -3.484458, -6.731683, 1, -0.5, 0.5, 0.5,
-2, -3.484458, -6.731683, 1, 1.5, 0.5, 0.5,
-2, -3.484458, -6.731683, 0, 1.5, 0.5, 0.5,
0, -3.484458, -6.731683, 0, -0.5, 0.5, 0.5,
0, -3.484458, -6.731683, 1, -0.5, 0.5, 0.5,
0, -3.484458, -6.731683, 1, 1.5, 0.5, 0.5,
0, -3.484458, -6.731683, 0, 1.5, 0.5, 0.5,
2, -3.484458, -6.731683, 0, -0.5, 0.5, 0.5,
2, -3.484458, -6.731683, 1, -0.5, 0.5, 0.5,
2, -3.484458, -6.731683, 1, 1.5, 0.5, 0.5,
2, -3.484458, -6.731683, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-4.331509, -2, -5.86833,
-4.331509, 2, -5.86833,
-4.331509, -2, -5.86833,
-4.51404, -2, -6.156115,
-4.331509, -1, -5.86833,
-4.51404, -1, -6.156115,
-4.331509, 0, -5.86833,
-4.51404, 0, -6.156115,
-4.331509, 1, -5.86833,
-4.51404, 1, -6.156115,
-4.331509, 2, -5.86833,
-4.51404, 2, -6.156115
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-2",
"-1",
"0",
"1",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.879101, -2, -6.731683, 0, -0.5, 0.5, 0.5,
-4.879101, -2, -6.731683, 1, -0.5, 0.5, 0.5,
-4.879101, -2, -6.731683, 1, 1.5, 0.5, 0.5,
-4.879101, -2, -6.731683, 0, 1.5, 0.5, 0.5,
-4.879101, -1, -6.731683, 0, -0.5, 0.5, 0.5,
-4.879101, -1, -6.731683, 1, -0.5, 0.5, 0.5,
-4.879101, -1, -6.731683, 1, 1.5, 0.5, 0.5,
-4.879101, -1, -6.731683, 0, 1.5, 0.5, 0.5,
-4.879101, 0, -6.731683, 0, -0.5, 0.5, 0.5,
-4.879101, 0, -6.731683, 1, -0.5, 0.5, 0.5,
-4.879101, 0, -6.731683, 1, 1.5, 0.5, 0.5,
-4.879101, 0, -6.731683, 0, 1.5, 0.5, 0.5,
-4.879101, 1, -6.731683, 0, -0.5, 0.5, 0.5,
-4.879101, 1, -6.731683, 1, -0.5, 0.5, 0.5,
-4.879101, 1, -6.731683, 1, 1.5, 0.5, 0.5,
-4.879101, 1, -6.731683, 0, 1.5, 0.5, 0.5,
-4.879101, 2, -6.731683, 0, -0.5, 0.5, 0.5,
-4.879101, 2, -6.731683, 1, -0.5, 0.5, 0.5,
-4.879101, 2, -6.731683, 1, 1.5, 0.5, 0.5,
-4.879101, 2, -6.731683, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-4.331509, -3.026515, -4,
-4.331509, -3.026515, 4,
-4.331509, -3.026515, -4,
-4.51404, -3.179163, -4,
-4.331509, -3.026515, -2,
-4.51404, -3.179163, -2,
-4.331509, -3.026515, 0,
-4.51404, -3.179163, 0,
-4.331509, -3.026515, 2,
-4.51404, -3.179163, 2,
-4.331509, -3.026515, 4,
-4.51404, -3.179163, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.879101, -3.484458, -4, 0, -0.5, 0.5, 0.5,
-4.879101, -3.484458, -4, 1, -0.5, 0.5, 0.5,
-4.879101, -3.484458, -4, 1, 1.5, 0.5, 0.5,
-4.879101, -3.484458, -4, 0, 1.5, 0.5, 0.5,
-4.879101, -3.484458, -2, 0, -0.5, 0.5, 0.5,
-4.879101, -3.484458, -2, 1, -0.5, 0.5, 0.5,
-4.879101, -3.484458, -2, 1, 1.5, 0.5, 0.5,
-4.879101, -3.484458, -2, 0, 1.5, 0.5, 0.5,
-4.879101, -3.484458, 0, 0, -0.5, 0.5, 0.5,
-4.879101, -3.484458, 0, 1, -0.5, 0.5, 0.5,
-4.879101, -3.484458, 0, 1, 1.5, 0.5, 0.5,
-4.879101, -3.484458, 0, 0, 1.5, 0.5, 0.5,
-4.879101, -3.484458, 2, 0, -0.5, 0.5, 0.5,
-4.879101, -3.484458, 2, 1, -0.5, 0.5, 0.5,
-4.879101, -3.484458, 2, 1, 1.5, 0.5, 0.5,
-4.879101, -3.484458, 2, 0, 1.5, 0.5, 0.5,
-4.879101, -3.484458, 4, 0, -0.5, 0.5, 0.5,
-4.879101, -3.484458, 4, 1, -0.5, 0.5, 0.5,
-4.879101, -3.484458, 4, 1, 1.5, 0.5, 0.5,
-4.879101, -3.484458, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-4.331509, -3.026515, -5.86833,
-4.331509, 3.079389, -5.86833,
-4.331509, -3.026515, 5.643038,
-4.331509, 3.079389, 5.643038,
-4.331509, -3.026515, -5.86833,
-4.331509, -3.026515, 5.643038,
-4.331509, 3.079389, -5.86833,
-4.331509, 3.079389, 5.643038,
-4.331509, -3.026515, -5.86833,
2.969718, -3.026515, -5.86833,
-4.331509, -3.026515, 5.643038,
2.969718, -3.026515, 5.643038,
-4.331509, 3.079389, -5.86833,
2.969718, 3.079389, -5.86833,
-4.331509, 3.079389, 5.643038,
2.969718, 3.079389, 5.643038,
2.969718, -3.026515, -5.86833,
2.969718, 3.079389, -5.86833,
2.969718, -3.026515, 5.643038,
2.969718, 3.079389, 5.643038,
2.969718, -3.026515, -5.86833,
2.969718, -3.026515, 5.643038,
2.969718, 3.079389, -5.86833,
2.969718, 3.079389, 5.643038
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.975846;
var distance = 35.48544;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.6808954, -0.02643716, 0.1126459 );
mvMatrix.scale( 1.181122, 1.412345, 0.7491413 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.48544);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 10);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
edifenphos<-read.table("edifenphos.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-edifenphos$V2
```

```
## Error in eval(expr, envir, enclos): object 'edifenphos' not found
```

```r
y<-edifenphos$V3
```

```
## Error in eval(expr, envir, enclos): object 'edifenphos' not found
```

```r
z<-edifenphos$V4
```

```
## Error in eval(expr, envir, enclos): object 'edifenphos' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-4.22518, 0.2575137, -1.592245, 0, 0, 1, 1, 1,
-3.332716, -0.8130559, -1.218625, 1, 0, 0, 1, 1,
-3.024945, 1.14416, -1.609395, 1, 0, 0, 1, 1,
-2.84295, 1.144387, -0.2073411, 1, 0, 0, 1, 1,
-2.754769, 0.02987107, -1.609676, 1, 0, 0, 1, 1,
-2.436355, -0.780394, -1.780138, 1, 0, 0, 1, 1,
-2.402498, -1.083837, -1.54403, 0, 0, 0, 1, 1,
-2.330455, -2.445259, -2.383661, 0, 0, 0, 1, 1,
-2.32009, 0.6803594, 0.0171892, 0, 0, 0, 1, 1,
-2.270967, 0.3569006, -3.076355, 0, 0, 0, 1, 1,
-2.195616, 0.09963923, -1.720978, 0, 0, 0, 1, 1,
-2.194149, 0.3952967, -1.30855, 0, 0, 0, 1, 1,
-2.190992, -1.450872, -1.628214, 0, 0, 0, 1, 1,
-2.144808, -2.325502, -3.045069, 1, 1, 1, 1, 1,
-2.101675, -0.3709262, -1.502811, 1, 1, 1, 1, 1,
-2.050957, -1.97741, -3.54225, 1, 1, 1, 1, 1,
-2.040703, 0.3583211, -1.130018, 1, 1, 1, 1, 1,
-2.038421, -0.6814015, -1.917957, 1, 1, 1, 1, 1,
-2.036906, -1.031548, -0.3420599, 1, 1, 1, 1, 1,
-2.022737, -1.020135, -1.542306, 1, 1, 1, 1, 1,
-1.996821, -0.05132196, -1.341701, 1, 1, 1, 1, 1,
-1.989017, 1.102576, -1.18592, 1, 1, 1, 1, 1,
-1.979674, 0.7993485, -0.7482055, 1, 1, 1, 1, 1,
-1.945649, -0.9265917, -2.575239, 1, 1, 1, 1, 1,
-1.931849, 0.2486115, -2.206137, 1, 1, 1, 1, 1,
-1.869772, 0.7752401, -1.478717, 1, 1, 1, 1, 1,
-1.799692, 1.650703, -1.338304, 1, 1, 1, 1, 1,
-1.78893, 0.380033, -0.9052942, 1, 1, 1, 1, 1,
-1.74516, 0.8486422, -2.474284, 0, 0, 1, 1, 1,
-1.718669, 0.1350112, -0.3989049, 1, 0, 0, 1, 1,
-1.692276, 1.791325, -0.06834673, 1, 0, 0, 1, 1,
-1.681407, -0.8230592, -1.577006, 1, 0, 0, 1, 1,
-1.676379, 0.3481671, -2.614625, 1, 0, 0, 1, 1,
-1.674764, 0.3878352, -1.808868, 1, 0, 0, 1, 1,
-1.668454, 0.5573324, -1.155395, 0, 0, 0, 1, 1,
-1.651844, -0.6901633, -0.873997, 0, 0, 0, 1, 1,
-1.642316, 1.007412, -0.3149663, 0, 0, 0, 1, 1,
-1.608783, -0.3192964, -2.171051, 0, 0, 0, 1, 1,
-1.603661, -0.5363002, -0.2178264, 0, 0, 0, 1, 1,
-1.582572, -1.406031, -2.333201, 0, 0, 0, 1, 1,
-1.57896, 0.4806877, -0.5764761, 0, 0, 0, 1, 1,
-1.561369, 1.498134, -1.525331, 1, 1, 1, 1, 1,
-1.552777, -0.4306501, -1.108943, 1, 1, 1, 1, 1,
-1.549041, 0.6546462, -1.823223, 1, 1, 1, 1, 1,
-1.538279, 0.9032415, -2.701108, 1, 1, 1, 1, 1,
-1.536028, -0.7989771, -2.919089, 1, 1, 1, 1, 1,
-1.53155, 1.431028, -0.04022863, 1, 1, 1, 1, 1,
-1.526632, 1.636413, -1.481279, 1, 1, 1, 1, 1,
-1.524419, 0.4119609, -1.806968, 1, 1, 1, 1, 1,
-1.518065, -0.6070446, -0.92587, 1, 1, 1, 1, 1,
-1.50647, -1.809706, -3.397302, 1, 1, 1, 1, 1,
-1.504418, 0.8308656, -0.8000939, 1, 1, 1, 1, 1,
-1.497494, 0.3657094, -0.7280015, 1, 1, 1, 1, 1,
-1.473193, -0.765949, -1.570366, 1, 1, 1, 1, 1,
-1.467834, 1.317617, 0.2945926, 1, 1, 1, 1, 1,
-1.464031, -0.9801766, -1.665552, 1, 1, 1, 1, 1,
-1.462236, 0.6074337, -2.454087, 0, 0, 1, 1, 1,
-1.453797, 0.1213377, -0.7989508, 1, 0, 0, 1, 1,
-1.450091, -0.6098266, -2.873752, 1, 0, 0, 1, 1,
-1.448813, 0.8491491, -0.1558713, 1, 0, 0, 1, 1,
-1.44732, 0.5129468, -1.155281, 1, 0, 0, 1, 1,
-1.430682, 0.08048464, -3.185026, 1, 0, 0, 1, 1,
-1.419845, 0.1482182, -2.156293, 0, 0, 0, 1, 1,
-1.417453, -0.5586888, -2.171602, 0, 0, 0, 1, 1,
-1.412642, 0.09492574, -1.005926, 0, 0, 0, 1, 1,
-1.397689, 1.90243, 1.849862, 0, 0, 0, 1, 1,
-1.393553, -0.6075608, -2.334759, 0, 0, 0, 1, 1,
-1.387256, -0.5473554, -1.188729, 0, 0, 0, 1, 1,
-1.380976, -0.3055449, -2.518545, 0, 0, 0, 1, 1,
-1.369191, -0.1989206, -0.9428229, 1, 1, 1, 1, 1,
-1.359143, -0.1037368, -0.8106388, 1, 1, 1, 1, 1,
-1.358576, 0.3622763, -1.838833, 1, 1, 1, 1, 1,
-1.35597, -0.5324278, -1.235882, 1, 1, 1, 1, 1,
-1.343984, -1.70666, 0.07440566, 1, 1, 1, 1, 1,
-1.33938, 0.07543427, -0.1517498, 1, 1, 1, 1, 1,
-1.331797, -0.6413753, -1.841631, 1, 1, 1, 1, 1,
-1.31509, 0.936748, -1.069842, 1, 1, 1, 1, 1,
-1.312741, -0.05959541, 0.3898178, 1, 1, 1, 1, 1,
-1.312484, -0.7613847, -3.300715, 1, 1, 1, 1, 1,
-1.304254, 1.998986, -1.760392, 1, 1, 1, 1, 1,
-1.30167, 1.506743, 0.05774837, 1, 1, 1, 1, 1,
-1.298456, 0.8011202, -1.81382, 1, 1, 1, 1, 1,
-1.294372, -1.727072, -2.802389, 1, 1, 1, 1, 1,
-1.288969, -1.226606, -1.996941, 1, 1, 1, 1, 1,
-1.28736, -0.3512074, -1.680299, 0, 0, 1, 1, 1,
-1.27256, 1.568627, -0.2434053, 1, 0, 0, 1, 1,
-1.252643, -0.6218671, -2.080376, 1, 0, 0, 1, 1,
-1.240524, 0.758995, -1.399045, 1, 0, 0, 1, 1,
-1.236437, -0.1413062, -1.83493, 1, 0, 0, 1, 1,
-1.236299, 0.7980466, 1.138713, 1, 0, 0, 1, 1,
-1.235073, 1.686706, -1.300628, 0, 0, 0, 1, 1,
-1.228621, 0.1399807, -0.5818532, 0, 0, 0, 1, 1,
-1.222846, -0.6609974, -2.794128, 0, 0, 0, 1, 1,
-1.220775, 0.2316995, 0.05974641, 0, 0, 0, 1, 1,
-1.216861, 0.1491652, -2.177329, 0, 0, 0, 1, 1,
-1.216258, -0.2988669, -0.3094391, 0, 0, 0, 1, 1,
-1.212947, -1.159536, -3.401603, 0, 0, 0, 1, 1,
-1.208086, -0.8442451, -1.223369, 1, 1, 1, 1, 1,
-1.207385, 0.5181202, -0.1501842, 1, 1, 1, 1, 1,
-1.206984, 0.9896451, -0.9611684, 1, 1, 1, 1, 1,
-1.200142, 0.5442637, -2.104506, 1, 1, 1, 1, 1,
-1.193315, 0.4160701, -1.295215, 1, 1, 1, 1, 1,
-1.189614, 0.2363481, -3.254189, 1, 1, 1, 1, 1,
-1.186562, 1.310429, -1.712728, 1, 1, 1, 1, 1,
-1.185081, -0.17771, -2.382032, 1, 1, 1, 1, 1,
-1.185032, -1.781194, -4.194468, 1, 1, 1, 1, 1,
-1.179537, -1.389958, -1.67658, 1, 1, 1, 1, 1,
-1.17716, 0.04342838, -1.201351, 1, 1, 1, 1, 1,
-1.177068, 1.179583, -1.068417, 1, 1, 1, 1, 1,
-1.16176, -1.465494, -3.478128, 1, 1, 1, 1, 1,
-1.156209, 1.874172, 1.301041, 1, 1, 1, 1, 1,
-1.153922, -0.5488828, -0.9772161, 1, 1, 1, 1, 1,
-1.14662, -0.5013365, -1.9099, 0, 0, 1, 1, 1,
-1.145043, -0.04989504, -2.746751, 1, 0, 0, 1, 1,
-1.137153, 2.415256, -0.8476242, 1, 0, 0, 1, 1,
-1.124747, -0.2198606, -2.09285, 1, 0, 0, 1, 1,
-1.120769, 0.3143219, -0.8707259, 1, 0, 0, 1, 1,
-1.119172, 0.7142816, -0.3115215, 1, 0, 0, 1, 1,
-1.118134, 0.6088107, -2.261747, 0, 0, 0, 1, 1,
-1.11638, -0.4896251, -0.794305, 0, 0, 0, 1, 1,
-1.109646, -0.6265399, -3.008876, 0, 0, 0, 1, 1,
-1.108695, -0.2898807, -1.999907, 0, 0, 0, 1, 1,
-1.10602, 1.031225, -0.4791731, 0, 0, 0, 1, 1,
-1.104446, 0.4389273, 1.05494, 0, 0, 0, 1, 1,
-1.10068, -0.06141378, 0.1367037, 0, 0, 0, 1, 1,
-1.099692, -0.9347532, -1.80763, 1, 1, 1, 1, 1,
-1.098709, 0.3412578, -0.03885489, 1, 1, 1, 1, 1,
-1.093338, -0.1096088, -1.818936, 1, 1, 1, 1, 1,
-1.088192, -0.7343675, -4.010833, 1, 1, 1, 1, 1,
-1.084635, -0.1314526, 0.8165964, 1, 1, 1, 1, 1,
-1.084027, 1.315966, -0.4902552, 1, 1, 1, 1, 1,
-1.082751, -0.8942081, -1.639366, 1, 1, 1, 1, 1,
-1.081441, 0.4340808, 0.09865232, 1, 1, 1, 1, 1,
-1.074486, 0.3170215, -1.853369, 1, 1, 1, 1, 1,
-1.061214, -0.588026, -2.951067, 1, 1, 1, 1, 1,
-1.060052, 0.03245853, -0.6016598, 1, 1, 1, 1, 1,
-1.058783, -1.694042, -2.31527, 1, 1, 1, 1, 1,
-1.058496, 0.6948495, -1.81827, 1, 1, 1, 1, 1,
-1.045849, 0.02226751, -0.5975921, 1, 1, 1, 1, 1,
-1.042716, 2.195329, 0.9948478, 1, 1, 1, 1, 1,
-1.0411, -1.641618, -1.856586, 0, 0, 1, 1, 1,
-1.040143, 0.05021221, -1.051076, 1, 0, 0, 1, 1,
-1.034401, 1.094795, -0.4643353, 1, 0, 0, 1, 1,
-1.032996, 0.8913585, -0.9893788, 1, 0, 0, 1, 1,
-1.031567, 0.5676129, -2.287614, 1, 0, 0, 1, 1,
-1.023304, 0.1569867, -1.040729, 1, 0, 0, 1, 1,
-1.012571, 2.621207, 0.7904581, 0, 0, 0, 1, 1,
-1.009271, -0.1336753, -1.275691, 0, 0, 0, 1, 1,
-1.003539, 0.02254323, -4.00792, 0, 0, 0, 1, 1,
-0.9998561, 0.2069762, -1.140187, 0, 0, 0, 1, 1,
-0.9997077, 1.046229, -0.6121148, 0, 0, 0, 1, 1,
-0.9956955, 0.05737697, -1.831578, 0, 0, 0, 1, 1,
-0.9947299, -1.073028, -2.441459, 0, 0, 0, 1, 1,
-0.9933736, -0.2617946, -0.5420799, 1, 1, 1, 1, 1,
-0.9925113, 1.111681, -1.527199, 1, 1, 1, 1, 1,
-0.990438, -0.8205723, -1.774533, 1, 1, 1, 1, 1,
-0.976075, -0.6926121, -2.885846, 1, 1, 1, 1, 1,
-0.9754801, 0.4505101, -0.5208861, 1, 1, 1, 1, 1,
-0.970771, -1.546207, -0.4563472, 1, 1, 1, 1, 1,
-0.963761, -0.02715888, -2.236688, 1, 1, 1, 1, 1,
-0.9588675, 0.9731177, 0.5086835, 1, 1, 1, 1, 1,
-0.9585477, -1.976947, -1.889377, 1, 1, 1, 1, 1,
-0.9567297, 0.6575691, -1.675587, 1, 1, 1, 1, 1,
-0.9566597, -1.190577, -2.81131, 1, 1, 1, 1, 1,
-0.956561, -0.2066742, -1.548342, 1, 1, 1, 1, 1,
-0.9480667, 0.5375923, -2.75414, 1, 1, 1, 1, 1,
-0.9322608, -0.1395164, -1.580884, 1, 1, 1, 1, 1,
-0.9212383, 0.001425818, -3.711855, 1, 1, 1, 1, 1,
-0.9198919, 1.700722, -1.031794, 0, 0, 1, 1, 1,
-0.9167592, 0.2617387, -1.007509, 1, 0, 0, 1, 1,
-0.9134987, -0.9307083, -2.188752, 1, 0, 0, 1, 1,
-0.9113488, -1.365912, -5.133686, 1, 0, 0, 1, 1,
-0.904533, -0.3939416, -0.5657798, 1, 0, 0, 1, 1,
-0.8995882, -0.206575, -1.75205, 1, 0, 0, 1, 1,
-0.8953944, -0.7782537, -3.241232, 0, 0, 0, 1, 1,
-0.8928952, -0.5925666, -2.618911, 0, 0, 0, 1, 1,
-0.8846102, 0.1347215, -2.718128, 0, 0, 0, 1, 1,
-0.8815676, -2.513627, -4.228908, 0, 0, 0, 1, 1,
-0.8779912, 0.8411787, -0.4740295, 0, 0, 0, 1, 1,
-0.8745109, -0.7411172, -2.913529, 0, 0, 0, 1, 1,
-0.8698279, 0.8535026, -0.5152131, 0, 0, 0, 1, 1,
-0.8625765, 2.288322, 0.3507305, 1, 1, 1, 1, 1,
-0.8610588, 0.3624027, -1.749684, 1, 1, 1, 1, 1,
-0.8575824, 1.816167, 0.307038, 1, 1, 1, 1, 1,
-0.8575513, 0.2172068, -1.802227, 1, 1, 1, 1, 1,
-0.8570638, -0.7423388, -1.818496, 1, 1, 1, 1, 1,
-0.85519, -1.77573, -3.049709, 1, 1, 1, 1, 1,
-0.8549973, 0.07588913, -0.5495358, 1, 1, 1, 1, 1,
-0.8545666, 0.4657932, -1.266295, 1, 1, 1, 1, 1,
-0.8529013, 0.1862483, -1.002961, 1, 1, 1, 1, 1,
-0.8507653, -0.2448636, 0.002482128, 1, 1, 1, 1, 1,
-0.8486047, 0.1305733, -2.563536, 1, 1, 1, 1, 1,
-0.8384576, -0.9512821, -2.64464, 1, 1, 1, 1, 1,
-0.8321683, 1.17606, -0.4316865, 1, 1, 1, 1, 1,
-0.8314449, 1.515439, 0.4473976, 1, 1, 1, 1, 1,
-0.8302008, -0.524025, -0.8192633, 1, 1, 1, 1, 1,
-0.8278642, -1.803655, -3.547511, 0, 0, 1, 1, 1,
-0.820964, -1.321476, -1.680476, 1, 0, 0, 1, 1,
-0.8164169, -0.5573369, -2.11235, 1, 0, 0, 1, 1,
-0.8100659, 0.2898208, -1.931455, 1, 0, 0, 1, 1,
-0.8003947, -2.896518, -2.106292, 1, 0, 0, 1, 1,
-0.7980841, 0.4858574, -1.43339, 1, 0, 0, 1, 1,
-0.7843899, 0.5379817, -0.2266785, 0, 0, 0, 1, 1,
-0.7821295, -0.3110089, -2.671692, 0, 0, 0, 1, 1,
-0.7662084, 0.986083, -2.496587, 0, 0, 0, 1, 1,
-0.765789, -1.324642, -2.30777, 0, 0, 0, 1, 1,
-0.7622527, 0.888394, -2.698335, 0, 0, 0, 1, 1,
-0.7592047, 0.3863035, -2.58632, 0, 0, 0, 1, 1,
-0.7528066, -0.08031916, -2.132581, 0, 0, 0, 1, 1,
-0.7511421, 0.1757054, 0.176071, 1, 1, 1, 1, 1,
-0.7510518, 0.2689526, -0.4996273, 1, 1, 1, 1, 1,
-0.7490417, -2.05961, -2.643039, 1, 1, 1, 1, 1,
-0.7450209, 0.01469712, 1.666276, 1, 1, 1, 1, 1,
-0.7445379, -0.6089353, -4.007951, 1, 1, 1, 1, 1,
-0.7437381, 1.140541, -1.343698, 1, 1, 1, 1, 1,
-0.7389119, -2.516418, -4.000359, 1, 1, 1, 1, 1,
-0.7382454, -0.2029546, -1.679843, 1, 1, 1, 1, 1,
-0.7339965, 0.4346003, -1.203526, 1, 1, 1, 1, 1,
-0.7261611, -0.1769347, -1.828, 1, 1, 1, 1, 1,
-0.7236438, 1.005407, -1.224967, 1, 1, 1, 1, 1,
-0.7224634, 0.7380332, -1.511117, 1, 1, 1, 1, 1,
-0.7203911, 0.03945179, -1.628941, 1, 1, 1, 1, 1,
-0.7200177, 0.2758042, 0.7033681, 1, 1, 1, 1, 1,
-0.7183484, -0.7458158, -1.578217, 1, 1, 1, 1, 1,
-0.7163776, -0.509819, -3.017331, 0, 0, 1, 1, 1,
-0.7147614, -1.619189, -2.073847, 1, 0, 0, 1, 1,
-0.7136225, 0.9468156, -1.351298, 1, 0, 0, 1, 1,
-0.7083238, -0.9610689, -3.309707, 1, 0, 0, 1, 1,
-0.7068064, -0.4651398, -2.165454, 1, 0, 0, 1, 1,
-0.7005072, 0.1856013, -0.5677124, 1, 0, 0, 1, 1,
-0.700426, 0.5369574, 0.29276, 0, 0, 0, 1, 1,
-0.6971257, 0.7955539, 0.3437494, 0, 0, 0, 1, 1,
-0.6917999, -0.7030766, -3.435904, 0, 0, 0, 1, 1,
-0.6869467, -0.8740551, -3.106297, 0, 0, 0, 1, 1,
-0.6855443, -1.945893, -3.890834, 0, 0, 0, 1, 1,
-0.683608, -0.5778834, -0.8909005, 0, 0, 0, 1, 1,
-0.6827865, 0.917828, -0.6150219, 0, 0, 0, 1, 1,
-0.6790299, -0.3262167, -1.476434, 1, 1, 1, 1, 1,
-0.6765943, 1.025247, -1.480449, 1, 1, 1, 1, 1,
-0.6724868, 0.3778262, -0.6350995, 1, 1, 1, 1, 1,
-0.665993, 0.9946321, -1.0989, 1, 1, 1, 1, 1,
-0.6646702, 0.5700943, 0.5437437, 1, 1, 1, 1, 1,
-0.6632725, 0.1383694, -1.689175, 1, 1, 1, 1, 1,
-0.6630893, 1.064382, -0.3440239, 1, 1, 1, 1, 1,
-0.6582894, 0.5542976, -0.3397618, 1, 1, 1, 1, 1,
-0.6582457, -1.230813, -3.155895, 1, 1, 1, 1, 1,
-0.6568397, 1.529258, 1.624342, 1, 1, 1, 1, 1,
-0.6548083, -0.8761493, -2.584429, 1, 1, 1, 1, 1,
-0.6527002, 0.08480458, -1.29184, 1, 1, 1, 1, 1,
-0.6522489, 0.280198, -0.2035905, 1, 1, 1, 1, 1,
-0.6491135, 0.1887849, -1.166531, 1, 1, 1, 1, 1,
-0.6457522, 2.990468, 0.5177276, 1, 1, 1, 1, 1,
-0.6438849, 1.240267, -0.8889524, 0, 0, 1, 1, 1,
-0.641117, -0.1744065, -0.2576811, 1, 0, 0, 1, 1,
-0.6400176, 0.7734098, -1.03822, 1, 0, 0, 1, 1,
-0.6370278, 0.3756946, -2.473084, 1, 0, 0, 1, 1,
-0.6361403, 0.5831375, -0.4020236, 1, 0, 0, 1, 1,
-0.6337987, -0.8050193, -1.176049, 1, 0, 0, 1, 1,
-0.6320212, 1.809781, -0.3575118, 0, 0, 0, 1, 1,
-0.6267819, -0.3938568, -1.203903, 0, 0, 0, 1, 1,
-0.6266958, -0.06070155, -2.633499, 0, 0, 0, 1, 1,
-0.62414, 0.07043757, -0.7316208, 0, 0, 0, 1, 1,
-0.6194054, -0.973444, -2.643035, 0, 0, 0, 1, 1,
-0.6117824, 0.9109436, -0.04552615, 0, 0, 0, 1, 1,
-0.6059312, 0.08517385, -1.505286, 0, 0, 0, 1, 1,
-0.6036729, -1.591721, -3.71771, 1, 1, 1, 1, 1,
-0.6033865, -0.3290515, -1.817846, 1, 1, 1, 1, 1,
-0.5985307, -1.304552, -2.251604, 1, 1, 1, 1, 1,
-0.5974244, 0.4957888, -0.7881213, 1, 1, 1, 1, 1,
-0.5964841, -0.4527446, -1.412355, 1, 1, 1, 1, 1,
-0.5867324, 0.09316424, -1.980261, 1, 1, 1, 1, 1,
-0.5863526, -1.392435, -3.077486, 1, 1, 1, 1, 1,
-0.585388, 1.204209, -1.473584, 1, 1, 1, 1, 1,
-0.584827, -0.1914651, -1.342349, 1, 1, 1, 1, 1,
-0.5844117, 0.7928247, 0.2372586, 1, 1, 1, 1, 1,
-0.582536, 1.546618, -1.38289, 1, 1, 1, 1, 1,
-0.5784954, 0.2020703, -1.162185, 1, 1, 1, 1, 1,
-0.5783397, 0.5338418, -1.220986, 1, 1, 1, 1, 1,
-0.5767534, -1.183891, -2.969174, 1, 1, 1, 1, 1,
-0.5703493, 0.4037865, -1.88069, 1, 1, 1, 1, 1,
-0.5694689, 1.942251, 0.1467922, 0, 0, 1, 1, 1,
-0.5684931, 1.326124, 0.4315535, 1, 0, 0, 1, 1,
-0.5674779, -0.02976975, -1.3829, 1, 0, 0, 1, 1,
-0.5661551, 0.621681, -0.9280777, 1, 0, 0, 1, 1,
-0.5649471, 0.666446, 1.423772, 1, 0, 0, 1, 1,
-0.5612751, 1.052518, -0.3811638, 1, 0, 0, 1, 1,
-0.5550421, -2.159852, -3.151193, 0, 0, 0, 1, 1,
-0.5535018, 1.139406, -2.799496, 0, 0, 0, 1, 1,
-0.5500031, 1.086135, -0.2312624, 0, 0, 0, 1, 1,
-0.546509, -0.7567065, -2.844717, 0, 0, 0, 1, 1,
-0.5446799, 1.421643, -1.230586, 0, 0, 0, 1, 1,
-0.5386245, -0.1099837, -1.704454, 0, 0, 0, 1, 1,
-0.5385449, 0.5580863, -1.92513, 0, 0, 0, 1, 1,
-0.5380957, -0.4535441, -2.110679, 1, 1, 1, 1, 1,
-0.5373026, 0.3687745, -0.8250315, 1, 1, 1, 1, 1,
-0.5351772, 1.991463, 1.656617, 1, 1, 1, 1, 1,
-0.5329138, -0.1896605, -1.377973, 1, 1, 1, 1, 1,
-0.5317885, -0.6324176, -1.656702, 1, 1, 1, 1, 1,
-0.5306242, -0.2615729, -1.893787, 1, 1, 1, 1, 1,
-0.5302868, -1.22967, -2.475558, 1, 1, 1, 1, 1,
-0.5249041, -0.2408076, -3.788427, 1, 1, 1, 1, 1,
-0.5235611, -0.8915789, -1.645716, 1, 1, 1, 1, 1,
-0.5221817, 0.3015027, 0.06690826, 1, 1, 1, 1, 1,
-0.5165073, -0.2538006, -2.338107, 1, 1, 1, 1, 1,
-0.5157387, -0.8524953, -2.917971, 1, 1, 1, 1, 1,
-0.5153598, -0.9757665, -2.359064, 1, 1, 1, 1, 1,
-0.5144218, -1.173355, -4.891467, 1, 1, 1, 1, 1,
-0.5025204, -2.937594, -3.477007, 1, 1, 1, 1, 1,
-0.4995269, -1.31487, -1.750466, 0, 0, 1, 1, 1,
-0.4958825, 0.05965503, -1.007848, 1, 0, 0, 1, 1,
-0.4912379, 2.082092, -1.477519, 1, 0, 0, 1, 1,
-0.4909654, 0.7942348, -0.6135275, 1, 0, 0, 1, 1,
-0.4832434, -0.948513, -2.912037, 1, 0, 0, 1, 1,
-0.4816191, -0.8947079, -2.359347, 1, 0, 0, 1, 1,
-0.4752011, 0.1418014, -1.68058, 0, 0, 0, 1, 1,
-0.4727392, 0.5517483, -0.8997868, 0, 0, 0, 1, 1,
-0.47033, 0.3562841, -2.009719, 0, 0, 0, 1, 1,
-0.4673692, -0.6491818, -3.308203, 0, 0, 0, 1, 1,
-0.4671253, 1.129136, -0.2213093, 0, 0, 0, 1, 1,
-0.4645092, -1.977992, -3.441817, 0, 0, 0, 1, 1,
-0.4637257, -0.3028108, -1.491449, 0, 0, 0, 1, 1,
-0.4622149, 0.5118383, -0.3908431, 1, 1, 1, 1, 1,
-0.4618079, -0.5671538, -2.663245, 1, 1, 1, 1, 1,
-0.4613803, 0.9158674, -0.1672391, 1, 1, 1, 1, 1,
-0.4518362, 1.008246, -0.3645068, 1, 1, 1, 1, 1,
-0.4504917, 0.4381771, -0.7753002, 1, 1, 1, 1, 1,
-0.4500186, 0.6086034, -0.5604591, 1, 1, 1, 1, 1,
-0.4493379, 1.464108, 0.1340931, 1, 1, 1, 1, 1,
-0.4467101, 0.7957134, 0.0781036, 1, 1, 1, 1, 1,
-0.4441513, 0.8634917, -1.040476, 1, 1, 1, 1, 1,
-0.4354936, -0.3729663, -0.3987698, 1, 1, 1, 1, 1,
-0.4291001, -1.748979, -2.305289, 1, 1, 1, 1, 1,
-0.4248315, 2.381476, -0.01688889, 1, 1, 1, 1, 1,
-0.4228724, 0.4794436, -0.8570185, 1, 1, 1, 1, 1,
-0.4170845, -1.307018, -2.315302, 1, 1, 1, 1, 1,
-0.4158982, 0.798591, 0.9704626, 1, 1, 1, 1, 1,
-0.4114812, 0.6374903, -0.4816556, 0, 0, 1, 1, 1,
-0.4099135, 1.489862, 1.366491, 1, 0, 0, 1, 1,
-0.408815, 0.3780437, -0.3710136, 1, 0, 0, 1, 1,
-0.4070718, -0.7185992, -2.262155, 1, 0, 0, 1, 1,
-0.4058225, 1.572593, -0.7019384, 1, 0, 0, 1, 1,
-0.4044334, 0.4170719, -0.7087675, 1, 0, 0, 1, 1,
-0.4012763, -0.7439429, -1.853834, 0, 0, 0, 1, 1,
-0.397058, -1.5868, -3.520987, 0, 0, 0, 1, 1,
-0.3941781, -2.279246, -4.594818, 0, 0, 0, 1, 1,
-0.3937211, 0.2321093, -2.346055, 0, 0, 0, 1, 1,
-0.3920285, -2.605958, -1.677552, 0, 0, 0, 1, 1,
-0.3808239, 0.0109816, -0.7068459, 0, 0, 0, 1, 1,
-0.375887, 1.599357, -0.7572971, 0, 0, 0, 1, 1,
-0.3735713, -0.7958304, -2.470264, 1, 1, 1, 1, 1,
-0.3699828, -0.398837, -1.217791, 1, 1, 1, 1, 1,
-0.3682539, -1.072043, -1.79973, 1, 1, 1, 1, 1,
-0.3668751, -0.4426244, -1.70474, 1, 1, 1, 1, 1,
-0.3662217, -0.1407686, -2.146426, 1, 1, 1, 1, 1,
-0.3619727, 1.567516, -0.3471185, 1, 1, 1, 1, 1,
-0.3614683, 1.184568, -1.130632, 1, 1, 1, 1, 1,
-0.3584871, -0.6637259, -2.975501, 1, 1, 1, 1, 1,
-0.3570504, -0.7731805, -1.836607, 1, 1, 1, 1, 1,
-0.3569916, 0.3417592, -1.333527, 1, 1, 1, 1, 1,
-0.3562693, -1.727662, -3.210347, 1, 1, 1, 1, 1,
-0.3510508, -0.4015895, -2.996219, 1, 1, 1, 1, 1,
-0.3471006, 1.75973, 0.9354563, 1, 1, 1, 1, 1,
-0.3470634, -1.65716, -4.192906, 1, 1, 1, 1, 1,
-0.3466696, -1.581547, -3.515445, 1, 1, 1, 1, 1,
-0.3428354, 0.4038242, 0.001154833, 0, 0, 1, 1, 1,
-0.3421565, -0.7940472, -4.300159, 1, 0, 0, 1, 1,
-0.3410882, -0.6828852, -1.247069, 1, 0, 0, 1, 1,
-0.336278, -1.003115, -2.433045, 1, 0, 0, 1, 1,
-0.3330284, 0.8095845, -0.4283746, 1, 0, 0, 1, 1,
-0.331865, 1.088902, 0.3913606, 1, 0, 0, 1, 1,
-0.3290074, -1.534401, -2.452543, 0, 0, 0, 1, 1,
-0.3282905, 0.997889, 0.3816542, 0, 0, 0, 1, 1,
-0.3249687, -0.3639041, -1.008775, 0, 0, 0, 1, 1,
-0.3185333, -0.6362907, -3.129706, 0, 0, 0, 1, 1,
-0.3169302, 0.3612961, -0.5644128, 0, 0, 0, 1, 1,
-0.3156919, -1.773671, -2.438123, 0, 0, 0, 1, 1,
-0.3148026, 1.386477, -0.2426919, 0, 0, 0, 1, 1,
-0.309773, 1.12309, -0.5725411, 1, 1, 1, 1, 1,
-0.3075764, 1.205296, -1.46348, 1, 1, 1, 1, 1,
-0.305333, -0.32116, -1.577457, 1, 1, 1, 1, 1,
-0.3051374, -0.784786, -3.033441, 1, 1, 1, 1, 1,
-0.3029961, -0.5101408, -2.168935, 1, 1, 1, 1, 1,
-0.301657, 0.3403962, -2.404597, 1, 1, 1, 1, 1,
-0.2985399, 1.656339, 0.6205729, 1, 1, 1, 1, 1,
-0.2974518, 0.3544015, -0.7908141, 1, 1, 1, 1, 1,
-0.2958162, 0.3065321, 0.00251577, 1, 1, 1, 1, 1,
-0.2943701, -0.4788205, -2.929951, 1, 1, 1, 1, 1,
-0.2941655, 1.146195, 1.467507, 1, 1, 1, 1, 1,
-0.287834, 0.7370186, -1.411623, 1, 1, 1, 1, 1,
-0.2871616, -0.03154558, -1.069369, 1, 1, 1, 1, 1,
-0.2859842, 0.9194635, -0.04683673, 1, 1, 1, 1, 1,
-0.276347, 0.2375976, -0.7501301, 1, 1, 1, 1, 1,
-0.2748682, 0.2367646, -1.158128, 0, 0, 1, 1, 1,
-0.2695023, -1.36688, -3.01098, 1, 0, 0, 1, 1,
-0.2688662, -1.302968, -3.708825, 1, 0, 0, 1, 1,
-0.2679854, 1.362418, 0.2273294, 1, 0, 0, 1, 1,
-0.2638159, -1.347703, -0.7494851, 1, 0, 0, 1, 1,
-0.263775, 2.469684, 0.9981523, 1, 0, 0, 1, 1,
-0.2529488, 0.198263, -1.46986, 0, 0, 0, 1, 1,
-0.2491844, -1.34789, -2.058444, 0, 0, 0, 1, 1,
-0.2480033, 0.113387, -1.186545, 0, 0, 0, 1, 1,
-0.2479312, -0.4566067, -3.107521, 0, 0, 0, 1, 1,
-0.2471962, -1.238053, -3.319647, 0, 0, 0, 1, 1,
-0.2449687, 0.9525114, 0.1130312, 0, 0, 0, 1, 1,
-0.2348217, -2.593632, -2.615518, 0, 0, 0, 1, 1,
-0.234605, -1.372172, -2.442787, 1, 1, 1, 1, 1,
-0.2310553, -0.04690247, 0.1370718, 1, 1, 1, 1, 1,
-0.2299265, -0.7085909, -5.700689, 1, 1, 1, 1, 1,
-0.2260644, -1.520086, -1.969167, 1, 1, 1, 1, 1,
-0.2176584, -0.6901914, -3.395654, 1, 1, 1, 1, 1,
-0.2129969, 0.7673795, 0.9957359, 1, 1, 1, 1, 1,
-0.2111641, -0.7155598, -3.021724, 1, 1, 1, 1, 1,
-0.2107685, 0.8975121, -0.260819, 1, 1, 1, 1, 1,
-0.2090308, -1.083905, -2.055075, 1, 1, 1, 1, 1,
-0.2041366, 0.9766936, 0.4521388, 1, 1, 1, 1, 1,
-0.2009632, -0.9525982, -5.300861, 1, 1, 1, 1, 1,
-0.1984573, -0.3642871, -1.088913, 1, 1, 1, 1, 1,
-0.1912258, -0.322042, -1.702475, 1, 1, 1, 1, 1,
-0.1884002, -0.4350469, -3.62323, 1, 1, 1, 1, 1,
-0.1882967, 0.02075054, -3.633684, 1, 1, 1, 1, 1,
-0.1882863, 0.1789487, 0.2133611, 0, 0, 1, 1, 1,
-0.1852203, 1.180731, 0.5708646, 1, 0, 0, 1, 1,
-0.1841444, -1.069418, -1.715569, 1, 0, 0, 1, 1,
-0.1839989, 0.4977145, -0.9850172, 1, 0, 0, 1, 1,
-0.179716, -0.8678226, -2.133145, 1, 0, 0, 1, 1,
-0.1792246, 0.05340741, -2.038886, 1, 0, 0, 1, 1,
-0.1783499, -0.9153098, -2.461104, 0, 0, 0, 1, 1,
-0.1763354, 1.748807, -0.4429709, 0, 0, 0, 1, 1,
-0.1730617, 1.195173, 1.675739, 0, 0, 0, 1, 1,
-0.1727068, 1.935384, 0.7154451, 0, 0, 0, 1, 1,
-0.1724944, -0.07609911, -2.896974, 0, 0, 0, 1, 1,
-0.1668363, 0.6936176, 1.440143, 0, 0, 0, 1, 1,
-0.166189, 0.4991761, -1.81696, 0, 0, 0, 1, 1,
-0.1650817, -1.37919, -3.407237, 1, 1, 1, 1, 1,
-0.16503, 1.412814, 0.489939, 1, 1, 1, 1, 1,
-0.165005, 0.3575245, -0.4660051, 1, 1, 1, 1, 1,
-0.1632949, 1.212988, 1.118269, 1, 1, 1, 1, 1,
-0.1575468, 0.4067463, -1.417894, 1, 1, 1, 1, 1,
-0.1550801, 0.2522332, -1.750132, 1, 1, 1, 1, 1,
-0.149618, -0.5445872, -2.410082, 1, 1, 1, 1, 1,
-0.1477831, -0.2880681, -3.604341, 1, 1, 1, 1, 1,
-0.147613, 0.9564979, 1.189731, 1, 1, 1, 1, 1,
-0.1404107, 2.614447, 1.195134, 1, 1, 1, 1, 1,
-0.1349659, -2.194567, -4.529593, 1, 1, 1, 1, 1,
-0.1333938, 0.3851105, 0.6352213, 1, 1, 1, 1, 1,
-0.1332738, -0.6257886, -3.201739, 1, 1, 1, 1, 1,
-0.1327039, -0.0697562, -1.460695, 1, 1, 1, 1, 1,
-0.1297565, 0.242605, -1.474108, 1, 1, 1, 1, 1,
-0.1287035, -1.656183, -1.768306, 0, 0, 1, 1, 1,
-0.1272055, -0.5161068, -5.659283, 1, 0, 0, 1, 1,
-0.1242342, 0.7258827, 0.3979293, 1, 0, 0, 1, 1,
-0.1236226, 0.365305, -0.3627069, 1, 0, 0, 1, 1,
-0.1211305, -1.744923, -2.982052, 1, 0, 0, 1, 1,
-0.1148889, -2.239158, -2.526349, 1, 0, 0, 1, 1,
-0.1144871, 0.9666754, 0.2381062, 0, 0, 0, 1, 1,
-0.1136571, -0.3747251, -3.230232, 0, 0, 0, 1, 1,
-0.1126815, -0.04212697, 0.07343282, 0, 0, 0, 1, 1,
-0.1116896, -1.475087, -2.298359, 0, 0, 0, 1, 1,
-0.1083293, 2.125595, 0.4435047, 0, 0, 0, 1, 1,
-0.1080803, -0.8569072, -3.584282, 0, 0, 0, 1, 1,
-0.106691, -0.6689036, -3.264384, 0, 0, 0, 1, 1,
-0.1045776, 0.4523174, -1.440282, 1, 1, 1, 1, 1,
-0.1041529, -0.1556061, -3.610873, 1, 1, 1, 1, 1,
-0.1037874, -0.3998743, -2.709265, 1, 1, 1, 1, 1,
-0.1030534, -0.4617847, -2.766611, 1, 1, 1, 1, 1,
-0.1009113, -0.07024708, -2.02158, 1, 1, 1, 1, 1,
-0.1000015, 0.04314134, -0.7514068, 1, 1, 1, 1, 1,
-0.09990181, 1.236998, -1.620659, 1, 1, 1, 1, 1,
-0.09979619, 0.9099469, 0.71442, 1, 1, 1, 1, 1,
-0.09466612, -1.262899, -4.220953, 1, 1, 1, 1, 1,
-0.09316171, 0.3383073, 0.8056699, 1, 1, 1, 1, 1,
-0.09040376, 1.700323, 0.5509449, 1, 1, 1, 1, 1,
-0.08317693, -0.1423051, -3.627618, 1, 1, 1, 1, 1,
-0.08077899, 0.8976485, -0.8398618, 1, 1, 1, 1, 1,
-0.07408979, 1.0388, 1.028796, 1, 1, 1, 1, 1,
-0.07357214, 0.4066296, 0.1642724, 1, 1, 1, 1, 1,
-0.07257029, 1.97688, -0.8448222, 0, 0, 1, 1, 1,
-0.07103596, -1.105706, -3.137859, 1, 0, 0, 1, 1,
-0.06847011, 0.01568585, -0.4675296, 1, 0, 0, 1, 1,
-0.06710768, -0.1458617, -2.403222, 1, 0, 0, 1, 1,
-0.06684405, -0.797581, -3.118204, 1, 0, 0, 1, 1,
-0.06619056, -1.651145, -4.426536, 1, 0, 0, 1, 1,
-0.0646941, -0.8115005, -3.079778, 0, 0, 0, 1, 1,
-0.06228457, -0.8569623, -2.787146, 0, 0, 0, 1, 1,
-0.0567445, -0.9641935, -2.898156, 0, 0, 0, 1, 1,
-0.05431967, 1.033655, -1.52514, 0, 0, 0, 1, 1,
-0.05390954, 1.734647, 2.427226, 0, 0, 0, 1, 1,
-0.05077216, -0.08237872, -3.597088, 0, 0, 0, 1, 1,
-0.04818665, 0.9966859, -0.9823432, 0, 0, 0, 1, 1,
-0.04666948, 2.50068, -0.5316524, 1, 1, 1, 1, 1,
-0.0459247, -1.756077, -4.074988, 1, 1, 1, 1, 1,
-0.0458345, 0.7504936, 0.8487931, 1, 1, 1, 1, 1,
-0.04532684, -0.6600513, -3.283847, 1, 1, 1, 1, 1,
-0.03496116, 2.220978, 0.9497044, 1, 1, 1, 1, 1,
-0.03266355, 0.2838197, 0.9212145, 1, 1, 1, 1, 1,
-0.02253819, -0.7323748, -4.120126, 1, 1, 1, 1, 1,
-0.02226899, 0.09313934, -1.223164, 1, 1, 1, 1, 1,
-0.01774007, 0.6808248, 0.5676817, 1, 1, 1, 1, 1,
-0.01729184, -1.399921, -1.56082, 1, 1, 1, 1, 1,
-0.01471569, -0.5125864, -4.962344, 1, 1, 1, 1, 1,
-0.01369248, -1.309562, -4.471082, 1, 1, 1, 1, 1,
-0.01336611, 0.9970474, -1.569776, 1, 1, 1, 1, 1,
-0.008110479, 0.7689055, 1.148472, 1, 1, 1, 1, 1,
-0.000529927, -0.6216173, -3.952619, 1, 1, 1, 1, 1,
0.001603488, -0.6024628, 3.509041, 0, 0, 1, 1, 1,
0.002378801, 0.05848984, -1.492138, 1, 0, 0, 1, 1,
0.00588891, -0.7838302, 2.434792, 1, 0, 0, 1, 1,
0.01490341, -1.032846, 5.008502, 1, 0, 0, 1, 1,
0.01504585, 0.3042006, 1.084506, 1, 0, 0, 1, 1,
0.01671498, 0.4633881, 1.324502, 1, 0, 0, 1, 1,
0.01701016, -0.3914908, 3.728728, 0, 0, 0, 1, 1,
0.02074072, 0.06055857, -0.2596343, 0, 0, 0, 1, 1,
0.02190916, 0.4900872, -1.021597, 0, 0, 0, 1, 1,
0.02407439, -0.2617286, 3.417305, 0, 0, 0, 1, 1,
0.02680357, 0.3330545, 0.2411617, 0, 0, 0, 1, 1,
0.03130822, -1.268347, 4.013064, 0, 0, 0, 1, 1,
0.03238433, 0.2272249, 0.6758778, 0, 0, 0, 1, 1,
0.03747826, -0.360714, 2.799484, 1, 1, 1, 1, 1,
0.03894171, 1.620993, -0.6634726, 1, 1, 1, 1, 1,
0.03980851, 0.5948819, -0.8933269, 1, 1, 1, 1, 1,
0.04080261, -1.005265, 2.538528, 1, 1, 1, 1, 1,
0.04173333, 0.3584481, -1.004239, 1, 1, 1, 1, 1,
0.04189767, -2.507494, 4.758297, 1, 1, 1, 1, 1,
0.04948759, 0.6546152, 0.503377, 1, 1, 1, 1, 1,
0.05046171, -0.4756165, 3.234778, 1, 1, 1, 1, 1,
0.05321754, -0.8455834, 3.676894, 1, 1, 1, 1, 1,
0.05857489, 0.09039182, 1.559717, 1, 1, 1, 1, 1,
0.05973661, -0.8551181, 2.494297, 1, 1, 1, 1, 1,
0.06066283, 1.681032, -0.1086566, 1, 1, 1, 1, 1,
0.06271595, -1.391435, 2.825702, 1, 1, 1, 1, 1,
0.06341864, 0.8164285, -1.705545, 1, 1, 1, 1, 1,
0.06389032, 0.6892725, 1.078679, 1, 1, 1, 1, 1,
0.06429615, 0.3127404, 1.187592, 0, 0, 1, 1, 1,
0.06437114, 1.041563, 1.083002, 1, 0, 0, 1, 1,
0.06460681, 0.9002901, 1.96264, 1, 0, 0, 1, 1,
0.06523816, 0.2355516, 0.7186518, 1, 0, 0, 1, 1,
0.0676899, 0.6179398, -0.4968326, 1, 0, 0, 1, 1,
0.07065301, 0.4658555, 1.270303, 1, 0, 0, 1, 1,
0.07463453, 0.01054402, 1.609311, 0, 0, 0, 1, 1,
0.07498947, 0.7363396, 1.433798, 0, 0, 0, 1, 1,
0.07687716, -1.599931, 3.79878, 0, 0, 0, 1, 1,
0.07697641, -0.7452816, 3.598556, 0, 0, 0, 1, 1,
0.0775485, -1.099028, 5.254042, 0, 0, 0, 1, 1,
0.07860474, 0.254512, 0.6279099, 0, 0, 0, 1, 1,
0.08019432, 0.2795551, -0.928445, 0, 0, 0, 1, 1,
0.08129124, 1.036421, -0.1044923, 1, 1, 1, 1, 1,
0.08276072, -0.3638324, 1.77643, 1, 1, 1, 1, 1,
0.08344046, -0.2555726, 1.320469, 1, 1, 1, 1, 1,
0.08479141, -1.000972, 3.249305, 1, 1, 1, 1, 1,
0.08715475, -0.3656945, 2.482922, 1, 1, 1, 1, 1,
0.08731734, 0.7419913, 1.119757, 1, 1, 1, 1, 1,
0.08895715, 0.1376831, 0.8459941, 1, 1, 1, 1, 1,
0.09116376, 0.2203699, 0.1900315, 1, 1, 1, 1, 1,
0.09421781, -0.4228722, 2.468857, 1, 1, 1, 1, 1,
0.09756221, 0.3222496, -0.4512029, 1, 1, 1, 1, 1,
0.09888526, 0.1718087, -0.5583345, 1, 1, 1, 1, 1,
0.09910483, 1.255119, -0.4153768, 1, 1, 1, 1, 1,
0.1030008, -0.2139276, 2.453998, 1, 1, 1, 1, 1,
0.1067838, 0.1845211, -0.5977624, 1, 1, 1, 1, 1,
0.1079693, -0.3120806, 3.71664, 1, 1, 1, 1, 1,
0.1091721, -1.568701, 3.51561, 0, 0, 1, 1, 1,
0.1132615, 0.6306315, -0.07702453, 1, 0, 0, 1, 1,
0.1136765, -0.3100922, 3.920075, 1, 0, 0, 1, 1,
0.1173019, 2.052951, -0.9160538, 1, 0, 0, 1, 1,
0.1254528, -0.345084, 3.425495, 1, 0, 0, 1, 1,
0.1277122, -0.2177633, 1.047472, 1, 0, 0, 1, 1,
0.1298199, 2.152267, -0.7147372, 0, 0, 0, 1, 1,
0.1355838, -1.934965, 4.9092, 0, 0, 0, 1, 1,
0.1362942, 0.4384938, 1.809422, 0, 0, 0, 1, 1,
0.1385542, 1.197391, -1.06976, 0, 0, 0, 1, 1,
0.1400805, 0.689913, 2.332407, 0, 0, 0, 1, 1,
0.1425378, -0.2629102, 3.498809, 0, 0, 0, 1, 1,
0.1431066, -0.5682794, 4.933704, 0, 0, 0, 1, 1,
0.1482411, -0.9175749, 3.861147, 1, 1, 1, 1, 1,
0.1528643, -0.2250797, 2.8761, 1, 1, 1, 1, 1,
0.1610871, 0.5674352, 1.372453, 1, 1, 1, 1, 1,
0.1623209, -0.2501895, 1.073223, 1, 1, 1, 1, 1,
0.1633089, 0.668466, -0.5161684, 1, 1, 1, 1, 1,
0.1643546, -0.6707455, 3.220693, 1, 1, 1, 1, 1,
0.1668341, 1.681642, 2.932171, 1, 1, 1, 1, 1,
0.1724896, -0.09944136, 1.805595, 1, 1, 1, 1, 1,
0.181275, -0.4878955, 2.9226, 1, 1, 1, 1, 1,
0.184547, 0.2182044, 0.6334094, 1, 1, 1, 1, 1,
0.1867083, 0.9225784, 1.141066, 1, 1, 1, 1, 1,
0.1888973, 0.500863, -0.6050515, 1, 1, 1, 1, 1,
0.1920685, -0.02981904, 1.508873, 1, 1, 1, 1, 1,
0.1924355, -0.8079073, 2.906952, 1, 1, 1, 1, 1,
0.1933323, 0.5879527, 0.06703994, 1, 1, 1, 1, 1,
0.1935886, -1.136032, 3.389401, 0, 0, 1, 1, 1,
0.194704, 0.5084157, 0.7973495, 1, 0, 0, 1, 1,
0.1969713, 1.331624, 0.1469183, 1, 0, 0, 1, 1,
0.199443, -0.04987578, 1.452848, 1, 0, 0, 1, 1,
0.2059716, -1.512309, 3.473399, 1, 0, 0, 1, 1,
0.206661, -0.412514, 2.55698, 1, 0, 0, 1, 1,
0.2082274, -1.091961, 3.328924, 0, 0, 0, 1, 1,
0.210493, 1.006087, 1.639478, 0, 0, 0, 1, 1,
0.2108629, -0.4680741, 4.477881, 0, 0, 0, 1, 1,
0.2149479, 0.7025538, 1.998781, 0, 0, 0, 1, 1,
0.2180944, 1.911556, -0.2984866, 0, 0, 0, 1, 1,
0.2181799, 1.088247, 0.08998133, 0, 0, 0, 1, 1,
0.219063, 1.092137, -0.03343531, 0, 0, 0, 1, 1,
0.2194271, -2.46463, 3.178687, 1, 1, 1, 1, 1,
0.2237785, -1.335792, 2.863288, 1, 1, 1, 1, 1,
0.2327382, 0.242091, -0.1241483, 1, 1, 1, 1, 1,
0.2340631, 0.7498748, 1.697616, 1, 1, 1, 1, 1,
0.2352985, 2.28506, -0.8616852, 1, 1, 1, 1, 1,
0.2367771, 0.9889538, -0.09769557, 1, 1, 1, 1, 1,
0.2420618, -0.5602554, 3.333687, 1, 1, 1, 1, 1,
0.2430875, 0.07301123, 1.259972, 1, 1, 1, 1, 1,
0.2460985, 1.026026, 0.768472, 1, 1, 1, 1, 1,
0.2471779, -0.5176911, 1.854687, 1, 1, 1, 1, 1,
0.2474386, -0.9613816, 3.594813, 1, 1, 1, 1, 1,
0.248163, -0.7301679, 2.758961, 1, 1, 1, 1, 1,
0.2516962, -0.5820782, 0.9553872, 1, 1, 1, 1, 1,
0.2522097, -0.6986761, 3.525098, 1, 1, 1, 1, 1,
0.2537703, 1.141131, -1.102533, 1, 1, 1, 1, 1,
0.2555625, -2.166767, 2.364253, 0, 0, 1, 1, 1,
0.2585948, 0.4239264, -0.7163371, 1, 0, 0, 1, 1,
0.2623217, -1.475974, 3.547467, 1, 0, 0, 1, 1,
0.2664465, 0.8625773, -1.176171, 1, 0, 0, 1, 1,
0.2675807, -1.036934, 1.747164, 1, 0, 0, 1, 1,
0.2683032, -0.4642172, 2.675857, 1, 0, 0, 1, 1,
0.2689436, -0.509191, 2.033546, 0, 0, 0, 1, 1,
0.2718777, -0.7077103, 4.593893, 0, 0, 0, 1, 1,
0.2736524, -0.1139752, 0.5650462, 0, 0, 0, 1, 1,
0.2782231, 0.115327, 0.1811396, 0, 0, 0, 1, 1,
0.2784835, -1.396015, 4.037264, 0, 0, 0, 1, 1,
0.2786202, -0.1071317, 1.870659, 0, 0, 0, 1, 1,
0.2801945, -0.2458281, 2.501618, 0, 0, 0, 1, 1,
0.2803182, 0.3274796, -0.2284681, 1, 1, 1, 1, 1,
0.2831143, 1.421253, -1.833836, 1, 1, 1, 1, 1,
0.2882725, 0.2680232, 0.3121095, 1, 1, 1, 1, 1,
0.2927565, 0.5864856, 1.949723, 1, 1, 1, 1, 1,
0.2956449, -2.388877, 3.498292, 1, 1, 1, 1, 1,
0.2960905, 0.9784668, 1.397326, 1, 1, 1, 1, 1,
0.2969659, -1.111599, 1.978523, 1, 1, 1, 1, 1,
0.2970991, -1.977522, 2.339611, 1, 1, 1, 1, 1,
0.3004372, -0.6845291, 3.395063, 1, 1, 1, 1, 1,
0.305683, 0.986335, -1.111683, 1, 1, 1, 1, 1,
0.3057356, 0.6212614, -1.035211, 1, 1, 1, 1, 1,
0.3078875, -0.8306827, 3.293751, 1, 1, 1, 1, 1,
0.3081531, 1.218228, -0.6505387, 1, 1, 1, 1, 1,
0.3092249, -0.4361384, 2.961976, 1, 1, 1, 1, 1,
0.310776, -1.29475, 2.569667, 1, 1, 1, 1, 1,
0.3116053, 0.4255088, 1.665998, 0, 0, 1, 1, 1,
0.3150131, -0.376282, 2.831498, 1, 0, 0, 1, 1,
0.3203668, 1.494944, -0.2422244, 1, 0, 0, 1, 1,
0.3237039, 0.3067583, -0.2205165, 1, 0, 0, 1, 1,
0.3256972, 0.829183, 0.2782333, 1, 0, 0, 1, 1,
0.3302853, -0.1773813, 1.808676, 1, 0, 0, 1, 1,
0.3328904, 0.07314207, 2.534146, 0, 0, 0, 1, 1,
0.33445, -0.8573905, 1.579734, 0, 0, 0, 1, 1,
0.3357007, 0.5458853, 1.308002, 0, 0, 0, 1, 1,
0.338108, -1.05677, 3.644412, 0, 0, 0, 1, 1,
0.3423943, 0.7088867, -0.3436294, 0, 0, 0, 1, 1,
0.3481159, 0.02659419, 0.8677332, 0, 0, 0, 1, 1,
0.3533294, 0.6754711, 1.145716, 0, 0, 0, 1, 1,
0.3538036, -0.1266996, 1.776713, 1, 1, 1, 1, 1,
0.3557464, -0.2883613, 3.509609, 1, 1, 1, 1, 1,
0.3583475, -0.5130678, 1.317586, 1, 1, 1, 1, 1,
0.3599138, -0.449246, 2.064495, 1, 1, 1, 1, 1,
0.3613204, -0.3266961, 2.599475, 1, 1, 1, 1, 1,
0.3629239, 0.3751115, 0.2910219, 1, 1, 1, 1, 1,
0.3652741, -0.5585581, 1.513807, 1, 1, 1, 1, 1,
0.3677841, 0.2112522, -1.303733, 1, 1, 1, 1, 1,
0.3688884, 0.09525635, 1.491399, 1, 1, 1, 1, 1,
0.3695084, -0.6269872, 2.73571, 1, 1, 1, 1, 1,
0.3708759, 0.5303087, 1.24124, 1, 1, 1, 1, 1,
0.3729461, 1.782614, 0.6320385, 1, 1, 1, 1, 1,
0.3735348, 0.2717006, 0.9864698, 1, 1, 1, 1, 1,
0.3776397, 1.259504, -1.06781, 1, 1, 1, 1, 1,
0.3778009, 0.1355632, 1.127086, 1, 1, 1, 1, 1,
0.3835576, 0.04776811, 1.175996, 0, 0, 1, 1, 1,
0.3840659, -0.07470655, 0.1462829, 1, 0, 0, 1, 1,
0.3877508, 0.6629803, 0.6781271, 1, 0, 0, 1, 1,
0.3991511, 1.579661, -0.6381804, 1, 0, 0, 1, 1,
0.4037552, 0.4886718, 1.043427, 1, 0, 0, 1, 1,
0.4088977, -0.6359814, 2.471644, 1, 0, 0, 1, 1,
0.4109648, 0.8373594, -0.005061634, 0, 0, 0, 1, 1,
0.415414, 0.0823044, -0.3711596, 0, 0, 0, 1, 1,
0.4171378, 0.4322206, -0.3247304, 0, 0, 0, 1, 1,
0.4289631, -1.099046, 0.8783267, 0, 0, 0, 1, 1,
0.4292885, 0.3080013, 0.8055226, 0, 0, 0, 1, 1,
0.4323972, 0.9439158, 0.7351345, 0, 0, 0, 1, 1,
0.4374413, 1.706306, -0.8071988, 0, 0, 0, 1, 1,
0.4375763, 0.09771065, 2.672143, 1, 1, 1, 1, 1,
0.4380217, -0.6702757, 0.7088211, 1, 1, 1, 1, 1,
0.4381501, 0.780511, 0.3846741, 1, 1, 1, 1, 1,
0.4406471, -0.1184777, 3.259393, 1, 1, 1, 1, 1,
0.4480737, 0.04419528, 2.798405, 1, 1, 1, 1, 1,
0.4523365, -1.407585, 2.882915, 1, 1, 1, 1, 1,
0.4545996, 0.2408397, 0.7937158, 1, 1, 1, 1, 1,
0.4552878, -0.02653982, 1.341245, 1, 1, 1, 1, 1,
0.4558819, 1.224534, 0.9108168, 1, 1, 1, 1, 1,
0.4576119, 0.3516344, 0.6359292, 1, 1, 1, 1, 1,
0.4618874, 0.5323241, 0.5264527, 1, 1, 1, 1, 1,
0.4620394, 1.004254, 0.4696995, 1, 1, 1, 1, 1,
0.4641101, -0.402922, 2.166687, 1, 1, 1, 1, 1,
0.4647699, 2.100814, 1.418355, 1, 1, 1, 1, 1,
0.4656065, 0.05878945, 2.425404, 1, 1, 1, 1, 1,
0.4660749, -0.01153602, 1.800671, 0, 0, 1, 1, 1,
0.4783553, 0.01795236, 1.162025, 1, 0, 0, 1, 1,
0.4799092, -0.1385005, 1.392006, 1, 0, 0, 1, 1,
0.480038, -0.6986706, 2.560409, 1, 0, 0, 1, 1,
0.4830167, -0.4827044, 2.577626, 1, 0, 0, 1, 1,
0.4859768, 0.01671161, 2.383238, 1, 0, 0, 1, 1,
0.4914187, -0.2789544, 2.844528, 0, 0, 0, 1, 1,
0.5005106, 0.4706457, 0.9065752, 0, 0, 0, 1, 1,
0.5023701, -1.804095, 3.742321, 0, 0, 0, 1, 1,
0.5091631, -1.153784, 3.796999, 0, 0, 0, 1, 1,
0.5100688, 0.1455247, 2.241516, 0, 0, 0, 1, 1,
0.5137404, -1.336892, 1.984559, 0, 0, 0, 1, 1,
0.5159161, 1.162026, 0.1412372, 0, 0, 0, 1, 1,
0.5159528, -1.305861, 3.001316, 1, 1, 1, 1, 1,
0.5237988, -0.05088939, 2.442124, 1, 1, 1, 1, 1,
0.5252188, 0.1611802, 0.7907786, 1, 1, 1, 1, 1,
0.5300184, -0.3769653, 2.483399, 1, 1, 1, 1, 1,
0.5321552, 1.099091, -0.5411143, 1, 1, 1, 1, 1,
0.5322698, -0.8358881, 2.776108, 1, 1, 1, 1, 1,
0.5333596, 0.5169424, 1.002362, 1, 1, 1, 1, 1,
0.5370008, -1.083204, 2.644908, 1, 1, 1, 1, 1,
0.5377379, -0.751153, 1.701767, 1, 1, 1, 1, 1,
0.5378318, -0.001989022, 2.651285, 1, 1, 1, 1, 1,
0.5448701, -0.2027599, 2.132744, 1, 1, 1, 1, 1,
0.5522614, -1.772973, 3.382014, 1, 1, 1, 1, 1,
0.5600287, 0.4099685, 1.678056, 1, 1, 1, 1, 1,
0.5666977, 0.9287727, 0.5383981, 1, 1, 1, 1, 1,
0.5673657, -0.03985002, 1.989223, 1, 1, 1, 1, 1,
0.57132, 0.4236826, 1.123256, 0, 0, 1, 1, 1,
0.5719728, 1.476993, 0.2614623, 1, 0, 0, 1, 1,
0.5771006, 0.8211429, -0.1697262, 1, 0, 0, 1, 1,
0.5775307, -1.155698, 3.145943, 1, 0, 0, 1, 1,
0.580264, 0.2230729, 0.869954, 1, 0, 0, 1, 1,
0.5816033, 0.271235, 0.2844076, 1, 0, 0, 1, 1,
0.5838351, 0.7145476, -1.463783, 0, 0, 0, 1, 1,
0.5864459, -0.3719201, 1.928026, 0, 0, 0, 1, 1,
0.5865563, 0.01013038, 0.4836064, 0, 0, 0, 1, 1,
0.5913652, -0.2789626, 2.314722, 0, 0, 0, 1, 1,
0.5925096, 1.247562, 3.34265, 0, 0, 0, 1, 1,
0.5998166, 0.8018535, -0.4312426, 0, 0, 0, 1, 1,
0.6027645, -1.253052, 1.93565, 0, 0, 0, 1, 1,
0.6031243, 1.25581, -0.7686334, 1, 1, 1, 1, 1,
0.6051867, -0.5777702, 1.340418, 1, 1, 1, 1, 1,
0.6067965, -0.6765274, 3.534194, 1, 1, 1, 1, 1,
0.6068817, 0.307459, 0.6229154, 1, 1, 1, 1, 1,
0.6114767, 0.4141525, 1.347148, 1, 1, 1, 1, 1,
0.6121015, 0.8020471, 0.0451984, 1, 1, 1, 1, 1,
0.6124447, 0.1025106, 2.215307, 1, 1, 1, 1, 1,
0.6132556, -0.319184, 2.798377, 1, 1, 1, 1, 1,
0.6150638, 1.640992, 2.888315, 1, 1, 1, 1, 1,
0.630394, -0.4316299, 2.026597, 1, 1, 1, 1, 1,
0.6321629, 0.5736731, 1.133237, 1, 1, 1, 1, 1,
0.6364306, -0.8185427, 3.384507, 1, 1, 1, 1, 1,
0.6369885, -0.1766624, 2.478981, 1, 1, 1, 1, 1,
0.6377506, -0.02113288, 1.746024, 1, 1, 1, 1, 1,
0.6390794, -0.08970522, 1.551763, 1, 1, 1, 1, 1,
0.6400316, -0.4640594, 3.277538, 0, 0, 1, 1, 1,
0.643892, -1.27833, 2.958481, 1, 0, 0, 1, 1,
0.6483334, -0.2179044, 1.178274, 1, 0, 0, 1, 1,
0.6547912, -0.2854682, 2.593153, 1, 0, 0, 1, 1,
0.6548777, -0.1105073, 0.4493714, 1, 0, 0, 1, 1,
0.6552348, -0.267149, 4.175275, 1, 0, 0, 1, 1,
0.6568316, 0.6952692, 1.765115, 0, 0, 0, 1, 1,
0.6612401, 0.2827459, 0.9961403, 0, 0, 0, 1, 1,
0.6700737, -0.6336331, 3.31734, 0, 0, 0, 1, 1,
0.6808736, 0.5895865, 1.096413, 0, 0, 0, 1, 1,
0.6834536, -0.2786646, 1.952199, 0, 0, 0, 1, 1,
0.6860427, -0.1623166, 1.898813, 0, 0, 0, 1, 1,
0.6943712, -0.214073, 1.462692, 0, 0, 0, 1, 1,
0.6951789, -0.4374213, 0.07193024, 1, 1, 1, 1, 1,
0.6991847, -0.5938994, 2.522218, 1, 1, 1, 1, 1,
0.7101737, -1.930013, 4.23653, 1, 1, 1, 1, 1,
0.7186909, 0.04927298, 1.116949, 1, 1, 1, 1, 1,
0.7195232, 0.6128946, 0.1741619, 1, 1, 1, 1, 1,
0.7220386, -0.5886077, 2.383751, 1, 1, 1, 1, 1,
0.7258888, 0.2394993, 1.819166, 1, 1, 1, 1, 1,
0.7405219, -0.2793255, 3.104973, 1, 1, 1, 1, 1,
0.7466687, 0.975189, -0.7460105, 1, 1, 1, 1, 1,
0.7469429, -0.7347503, 3.20151, 1, 1, 1, 1, 1,
0.7488151, -1.315118, 3.962888, 1, 1, 1, 1, 1,
0.7494682, 1.607156, -0.01215325, 1, 1, 1, 1, 1,
0.7531281, -0.3901357, 0.3144848, 1, 1, 1, 1, 1,
0.7594575, 0.5843145, -0.1914176, 1, 1, 1, 1, 1,
0.7606831, 0.03995011, 0.7343532, 1, 1, 1, 1, 1,
0.7622423, -0.577949, 4.5967, 0, 0, 1, 1, 1,
0.7686749, -0.5949755, 1.165317, 1, 0, 0, 1, 1,
0.7689083, 1.370983, 0.4946151, 1, 0, 0, 1, 1,
0.7696694, 0.8089845, 1.394944, 1, 0, 0, 1, 1,
0.7798306, 0.8634796, 0.2976049, 1, 0, 0, 1, 1,
0.780165, -2.275846, 2.555998, 1, 0, 0, 1, 1,
0.7812623, 0.1445107, 2.221879, 0, 0, 0, 1, 1,
0.7856137, -2.130524, 1.898189, 0, 0, 0, 1, 1,
0.7937479, 1.726058, 0.1071159, 0, 0, 0, 1, 1,
0.7941758, 1.544262, 1.831306, 0, 0, 0, 1, 1,
0.7943131, -2.697344, 2.722819, 0, 0, 0, 1, 1,
0.7973689, 0.5318023, 1.155079, 0, 0, 0, 1, 1,
0.7976475, 0.9890706, 0.6108264, 0, 0, 0, 1, 1,
0.7995154, -0.02500714, 1.59341, 1, 1, 1, 1, 1,
0.8021665, 0.29683, 0.8552024, 1, 1, 1, 1, 1,
0.8029484, 0.01768955, 2.881415, 1, 1, 1, 1, 1,
0.8107475, -0.6471676, 2.221888, 1, 1, 1, 1, 1,
0.815359, -0.3014831, 1.664264, 1, 1, 1, 1, 1,
0.8334336, -0.5322197, 2.305821, 1, 1, 1, 1, 1,
0.8396178, 0.6577406, 0.03638516, 1, 1, 1, 1, 1,
0.8407085, 0.8196582, -1.152569, 1, 1, 1, 1, 1,
0.8428859, -2.077582, 0.7675671, 1, 1, 1, 1, 1,
0.8469453, -1.043886, 3.720522, 1, 1, 1, 1, 1,
0.8483584, 0.1536771, 0.6150751, 1, 1, 1, 1, 1,
0.8486673, 0.919296, -1.337412, 1, 1, 1, 1, 1,
0.8535494, 0.268107, 0.7706428, 1, 1, 1, 1, 1,
0.8558119, 0.09683144, 1.21091, 1, 1, 1, 1, 1,
0.8590786, 1.525643, -0.185538, 1, 1, 1, 1, 1,
0.8595926, -1.331449, 3.673425, 0, 0, 1, 1, 1,
0.8670105, -0.3804736, 0.3354761, 1, 0, 0, 1, 1,
0.8685797, -0.601274, 1.948283, 1, 0, 0, 1, 1,
0.8701125, 1.704963, -0.5095435, 1, 0, 0, 1, 1,
0.8705951, 0.5616508, 1.582576, 1, 0, 0, 1, 1,
0.8729888, 0.5201694, 1.541631, 1, 0, 0, 1, 1,
0.876098, -0.6630095, 1.814547, 0, 0, 0, 1, 1,
0.8761587, 1.414806, 0.7168826, 0, 0, 0, 1, 1,
0.8761731, -0.613914, 1.049017, 0, 0, 0, 1, 1,
0.8777596, 0.151032, 0.8347614, 0, 0, 0, 1, 1,
0.8782071, -0.1321566, 0.8661201, 0, 0, 0, 1, 1,
0.8906332, -2.178435, 2.518917, 0, 0, 0, 1, 1,
0.8914901, 0.6445001, -0.2083567, 0, 0, 0, 1, 1,
0.894901, -0.1754925, 1.039066, 1, 1, 1, 1, 1,
0.9005709, 0.02189474, 1.069675, 1, 1, 1, 1, 1,
0.9110045, -0.3333193, 2.192316, 1, 1, 1, 1, 1,
0.9174264, 0.3420123, -0.2733396, 1, 1, 1, 1, 1,
0.921995, 0.5674326, 1.286571, 1, 1, 1, 1, 1,
0.9225748, -0.7567139, 1.281752, 1, 1, 1, 1, 1,
0.9254989, -2.217863, 2.534605, 1, 1, 1, 1, 1,
0.9291784, -0.2689548, 3.100698, 1, 1, 1, 1, 1,
0.9318746, -0.3665897, 0.1801462, 1, 1, 1, 1, 1,
0.9392907, 0.6644874, 2.367368, 1, 1, 1, 1, 1,
0.9486353, 0.4576719, 0.8024608, 1, 1, 1, 1, 1,
0.9521699, -0.8283829, 1.461385, 1, 1, 1, 1, 1,
0.9557831, -0.8327359, 2.035271, 1, 1, 1, 1, 1,
0.9593258, -1.604553, 4.992344, 1, 1, 1, 1, 1,
0.9646204, 0.204778, 1.13376, 1, 1, 1, 1, 1,
0.9669237, 0.3487745, 2.621883, 0, 0, 1, 1, 1,
0.9699208, 0.4396281, 1.162368, 1, 0, 0, 1, 1,
0.9701036, -1.540327, 2.236779, 1, 0, 0, 1, 1,
0.9711835, 0.08136975, 0.1160854, 1, 0, 0, 1, 1,
0.9733995, 0.3521872, 1.066925, 1, 0, 0, 1, 1,
0.9756647, 0.2733675, 1.240064, 1, 0, 0, 1, 1,
0.981936, -0.7332494, 3.151529, 0, 0, 0, 1, 1,
0.9929269, 1.50467, 1.070183, 0, 0, 0, 1, 1,
0.9966126, -0.2589031, -0.1532299, 0, 0, 0, 1, 1,
0.9967912, 0.6734914, 0.2358622, 0, 0, 0, 1, 1,
0.9998218, -0.0426919, 1.307469, 0, 0, 0, 1, 1,
1.003964, 1.124463, -0.3087415, 0, 0, 0, 1, 1,
1.006896, -0.5287585, 1.946759, 0, 0, 0, 1, 1,
1.010188, 0.4446985, 0.6650064, 1, 1, 1, 1, 1,
1.022424, -0.6278953, 1.815507, 1, 1, 1, 1, 1,
1.031419, -0.880073, 1.729375, 1, 1, 1, 1, 1,
1.038843, -0.1989397, 2.188268, 1, 1, 1, 1, 1,
1.039886, 0.5769829, 0.3699747, 1, 1, 1, 1, 1,
1.044367, -0.3779011, 2.785896, 1, 1, 1, 1, 1,
1.04812, 0.475656, 2.30519, 1, 1, 1, 1, 1,
1.048764, -2.353484, 2.17255, 1, 1, 1, 1, 1,
1.052632, -0.4100002, 1.985968, 1, 1, 1, 1, 1,
1.053874, -0.9647357, 3.819729, 1, 1, 1, 1, 1,
1.058597, 0.1003362, 2.778223, 1, 1, 1, 1, 1,
1.060299, -0.6844241, 3.297686, 1, 1, 1, 1, 1,
1.062289, 0.6796955, 0.8797341, 1, 1, 1, 1, 1,
1.064184, -0.9113394, 1.664142, 1, 1, 1, 1, 1,
1.070066, 0.2873799, 2.045548, 1, 1, 1, 1, 1,
1.070289, -0.07073171, 3.154101, 0, 0, 1, 1, 1,
1.076889, 0.8741885, 0.7440755, 1, 0, 0, 1, 1,
1.078297, 1.575298, 0.6361293, 1, 0, 0, 1, 1,
1.085072, -1.039083, 1.348526, 1, 0, 0, 1, 1,
1.088545, 0.7395651, 2.186333, 1, 0, 0, 1, 1,
1.112343, 0.9450787, 0.1724893, 1, 0, 0, 1, 1,
1.118833, 0.01676654, 0.6508008, 0, 0, 0, 1, 1,
1.120742, -0.4930737, 1.880855, 0, 0, 0, 1, 1,
1.124528, 1.33623, 1.74468, 0, 0, 0, 1, 1,
1.133778, -0.7804181, 2.859466, 0, 0, 0, 1, 1,
1.134334, 0.4654576, 2.17011, 0, 0, 0, 1, 1,
1.134925, -0.3594428, 5.475397, 0, 0, 0, 1, 1,
1.138387, -0.7651867, 1.297576, 0, 0, 0, 1, 1,
1.138463, 0.09567801, 1.006968, 1, 1, 1, 1, 1,
1.141117, 0.1728327, 1.764898, 1, 1, 1, 1, 1,
1.144182, -0.6275681, 2.290273, 1, 1, 1, 1, 1,
1.144687, -0.3057962, 2.580088, 1, 1, 1, 1, 1,
1.147111, 0.1625449, 2.170078, 1, 1, 1, 1, 1,
1.151961, -0.3374555, 2.984127, 1, 1, 1, 1, 1,
1.172944, 1.303217, 0.6874883, 1, 1, 1, 1, 1,
1.17631, -0.8597201, 1.702893, 1, 1, 1, 1, 1,
1.186405, -0.6141598, 1.864404, 1, 1, 1, 1, 1,
1.20537, 0.4533392, 1.15002, 1, 1, 1, 1, 1,
1.213643, 1.201129, 0.924109, 1, 1, 1, 1, 1,
1.219452, -0.4664506, 2.276185, 1, 1, 1, 1, 1,
1.224768, 0.1419091, 1.069168, 1, 1, 1, 1, 1,
1.233428, 1.834819, 1.767835, 1, 1, 1, 1, 1,
1.238655, 0.02853606, 1.555729, 1, 1, 1, 1, 1,
1.241663, -0.9062072, 1.833859, 0, 0, 1, 1, 1,
1.241985, -1.022031, 1.355062, 1, 0, 0, 1, 1,
1.243222, -0.3228175, 2.520474, 1, 0, 0, 1, 1,
1.257564, 0.7855789, 0.555679, 1, 0, 0, 1, 1,
1.266719, 0.1505887, 1.355675, 1, 0, 0, 1, 1,
1.267275, -0.6658562, 0.7350301, 1, 0, 0, 1, 1,
1.271739, 0.626341, 0.8709936, 0, 0, 0, 1, 1,
1.271936, 1.893841, 1.427295, 0, 0, 0, 1, 1,
1.274407, -0.9928205, 2.57529, 0, 0, 0, 1, 1,
1.281804, 0.221803, 2.377904, 0, 0, 0, 1, 1,
1.283787, 0.3321126, 0.2290006, 0, 0, 0, 1, 1,
1.288897, -1.103152, 2.908191, 0, 0, 0, 1, 1,
1.294636, 0.08308572, 3.545408, 0, 0, 0, 1, 1,
1.303725, -0.3266687, 2.467723, 1, 1, 1, 1, 1,
1.304044, -1.268593, 3.803774, 1, 1, 1, 1, 1,
1.304971, -0.1755188, 1.457081, 1, 1, 1, 1, 1,
1.306749, 1.649319, 1.865602, 1, 1, 1, 1, 1,
1.316229, -0.8559785, 2.189355, 1, 1, 1, 1, 1,
1.319415, -0.4949471, 2.20546, 1, 1, 1, 1, 1,
1.322042, -1.079998, 1.375829, 1, 1, 1, 1, 1,
1.322127, -0.3256397, 1.428196, 1, 1, 1, 1, 1,
1.322461, -1.200511, -0.1881514, 1, 1, 1, 1, 1,
1.337683, 1.321217, 1.07612, 1, 1, 1, 1, 1,
1.351025, -1.01193, 1.146784, 1, 1, 1, 1, 1,
1.376206, -0.3689962, 1.469118, 1, 1, 1, 1, 1,
1.381972, -0.4481549, 1.521136, 1, 1, 1, 1, 1,
1.383304, 1.365745, -0.3745707, 1, 1, 1, 1, 1,
1.384101, 0.4196779, 0.2227844, 1, 1, 1, 1, 1,
1.403612, 1.213206, 0.7899148, 0, 0, 1, 1, 1,
1.410941, -0.5190738, 2.273891, 1, 0, 0, 1, 1,
1.414804, -1.784471, 3.307275, 1, 0, 0, 1, 1,
1.42537, 1.253267, -0.0618406, 1, 0, 0, 1, 1,
1.439139, -0.4001746, 1.048253, 1, 0, 0, 1, 1,
1.441137, -1.019699, 1.745576, 1, 0, 0, 1, 1,
1.443699, -0.6893504, 1.769293, 0, 0, 0, 1, 1,
1.46227, 0.8549253, 1.902591, 0, 0, 0, 1, 1,
1.474827, 0.07072309, 1.399107, 0, 0, 0, 1, 1,
1.47565, 1.631357, 0.01644707, 0, 0, 0, 1, 1,
1.483747, 0.8869128, 1.108843, 0, 0, 0, 1, 1,
1.488929, 0.8430718, -0.5989022, 0, 0, 0, 1, 1,
1.491948, -0.6800781, 0.8268712, 0, 0, 0, 1, 1,
1.494755, -0.3164297, 1.847819, 1, 1, 1, 1, 1,
1.50961, 1.227815, 0.8375658, 1, 1, 1, 1, 1,
1.50961, -0.8654198, 0.6582443, 1, 1, 1, 1, 1,
1.512923, 1.252378, 0.5959866, 1, 1, 1, 1, 1,
1.520577, 0.4950865, 0.9448299, 1, 1, 1, 1, 1,
1.526205, 1.440579, -0.1305859, 1, 1, 1, 1, 1,
1.526674, -0.2647561, 1.825663, 1, 1, 1, 1, 1,
1.532097, -1.093472, 2.726365, 1, 1, 1, 1, 1,
1.545929, 0.6732002, 2.043508, 1, 1, 1, 1, 1,
1.560297, -0.7669414, 1.08839, 1, 1, 1, 1, 1,
1.563166, 0.6120752, 1.142764, 1, 1, 1, 1, 1,
1.566411, 1.628273, 1.881832, 1, 1, 1, 1, 1,
1.574112, -0.9343687, 0.6723655, 1, 1, 1, 1, 1,
1.606286, 0.4539921, 0.2248299, 1, 1, 1, 1, 1,
1.623045, 1.869986, 2.097341, 1, 1, 1, 1, 1,
1.653904, -0.8472744, 1.642873, 0, 0, 1, 1, 1,
1.665616, 2.270964, 0.4226128, 1, 0, 0, 1, 1,
1.725723, -0.9620935, 2.609015, 1, 0, 0, 1, 1,
1.749188, -0.439598, 2.503623, 1, 0, 0, 1, 1,
1.767991, -0.6357428, 2.656557, 1, 0, 0, 1, 1,
1.779446, 2.061159, -1.277964, 1, 0, 0, 1, 1,
1.789978, 1.48696, 1.241073, 0, 0, 0, 1, 1,
1.796687, 1.696847, 1.224223, 0, 0, 0, 1, 1,
1.802058, -0.5037878, 1.833162, 0, 0, 0, 1, 1,
1.84616, 0.3605565, 0.2731553, 0, 0, 0, 1, 1,
1.846631, -0.2755889, 1.1385, 0, 0, 0, 1, 1,
1.849266, 1.194132, 2.089539, 0, 0, 0, 1, 1,
1.866779, 0.4875, 3.826097, 0, 0, 0, 1, 1,
1.902461, 1.476607, 0.5404648, 1, 1, 1, 1, 1,
1.903651, -0.8770175, 2.121531, 1, 1, 1, 1, 1,
1.928546, -0.8922672, 0.6856861, 1, 1, 1, 1, 1,
1.94082, 2.453094, 0.5926651, 1, 1, 1, 1, 1,
1.942763, 1.063893, 1.073288, 1, 1, 1, 1, 1,
1.979552, 0.3014189, 1.829578, 1, 1, 1, 1, 1,
2.00247, 1.352333, -0.1959523, 1, 1, 1, 1, 1,
2.002544, -0.3731591, 3.358588, 1, 1, 1, 1, 1,
2.011798, -1.144088, 1.959687, 1, 1, 1, 1, 1,
2.022983, 1.171179, 1.917109, 1, 1, 1, 1, 1,
2.049088, -0.799292, 3.064031, 1, 1, 1, 1, 1,
2.051718, 0.8619725, 2.740704, 1, 1, 1, 1, 1,
2.057985, -0.8830957, 2.0029, 1, 1, 1, 1, 1,
2.058635, -0.3899073, -0.5975631, 1, 1, 1, 1, 1,
2.063244, -0.9894004, 2.426223, 1, 1, 1, 1, 1,
2.086392, 1.172693, 1.441542, 0, 0, 1, 1, 1,
2.137661, 0.9520308, 2.504326, 1, 0, 0, 1, 1,
2.138984, 1.35723, 1.681742, 1, 0, 0, 1, 1,
2.144598, 0.8926585, 0.4703017, 1, 0, 0, 1, 1,
2.16928, 0.2372238, 0.8841509, 1, 0, 0, 1, 1,
2.184495, -0.7660368, 3.622003, 1, 0, 0, 1, 1,
2.210074, -1.164184, 3.242856, 0, 0, 0, 1, 1,
2.214808, -1.514049, 3.582474, 0, 0, 0, 1, 1,
2.275199, -0.1906374, 1.733504, 0, 0, 0, 1, 1,
2.285057, -0.8855522, 2.13593, 0, 0, 0, 1, 1,
2.347158, 0.4023441, 2.331177, 0, 0, 0, 1, 1,
2.365165, 0.7831122, 0.5103024, 0, 0, 0, 1, 1,
2.5371, 0.2513333, 2.736752, 0, 0, 0, 1, 1,
2.538364, 0.3308132, 1.532985, 1, 1, 1, 1, 1,
2.661393, 0.5978253, 2.497856, 1, 1, 1, 1, 1,
2.683153, 2.155525, 0.9048955, 1, 1, 1, 1, 1,
2.713042, -0.142672, 1.979631, 1, 1, 1, 1, 1,
2.730278, 0.4377475, 1.454826, 1, 1, 1, 1, 1,
2.789454, 0.8534302, 2.151101, 1, 1, 1, 1, 1,
2.863389, -0.564047, 0.6910546, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.824323;
var distance = 34.50752;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.6808954, -0.02643716, 0.1126459 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.50752);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>