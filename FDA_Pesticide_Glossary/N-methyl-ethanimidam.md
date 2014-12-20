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
-4.085113, 1.238515, -0.4780933, 1, 0, 0, 1,
-2.638559, 1.009462, -0.9892899, 1, 0.007843138, 0, 1,
-2.537687, -1.127668, -3.478125, 1, 0.01176471, 0, 1,
-2.491172, 0.3267246, 0.0791866, 1, 0.01960784, 0, 1,
-2.37086, -0.8128446, -2.129146, 1, 0.02352941, 0, 1,
-2.355894, 1.459248, -0.6870897, 1, 0.03137255, 0, 1,
-2.34584, -1.327474, -2.937046, 1, 0.03529412, 0, 1,
-2.332441, 0.2108612, -2.509051, 1, 0.04313726, 0, 1,
-2.330851, -1.149034, -2.512464, 1, 0.04705882, 0, 1,
-2.315578, 1.459884, -3.235738, 1, 0.05490196, 0, 1,
-2.30217, -0.3757225, -1.609542, 1, 0.05882353, 0, 1,
-2.275218, -0.9371303, -2.323147, 1, 0.06666667, 0, 1,
-2.218739, 1.555965, 0.2813866, 1, 0.07058824, 0, 1,
-2.207809, -1.051726, -3.712849, 1, 0.07843138, 0, 1,
-2.196032, 0.2148341, -1.268528, 1, 0.08235294, 0, 1,
-2.160277, 0.7494084, -3.645212, 1, 0.09019608, 0, 1,
-2.134234, -0.134949, -2.742377, 1, 0.09411765, 0, 1,
-2.132373, -0.6026338, -2.926766, 1, 0.1019608, 0, 1,
-2.104855, -1.249265, -2.693312, 1, 0.1098039, 0, 1,
-2.088999, 0.5633652, -2.034753, 1, 0.1137255, 0, 1,
-2.08335, -0.03615797, -7.91222e-05, 1, 0.1215686, 0, 1,
-2.081478, -1.648534, -2.109669, 1, 0.1254902, 0, 1,
-2.075908, -0.3233885, -1.049444, 1, 0.1333333, 0, 1,
-2.054311, -0.4531266, -1.850394, 1, 0.1372549, 0, 1,
-2.04085, -0.07502201, 0.2309853, 1, 0.145098, 0, 1,
-2.027067, -0.5473967, -1.228778, 1, 0.1490196, 0, 1,
-2.022737, -0.1590445, -0.799049, 1, 0.1568628, 0, 1,
-1.984435, 0.6029764, 1.090782, 1, 0.1607843, 0, 1,
-1.966896, 0.1407013, -2.196409, 1, 0.1686275, 0, 1,
-1.965138, 0.7165003, -1.532214, 1, 0.172549, 0, 1,
-1.944886, -0.1352037, 0.2757238, 1, 0.1803922, 0, 1,
-1.931232, 0.2347274, -0.8078066, 1, 0.1843137, 0, 1,
-1.912688, -0.3147396, -0.8559059, 1, 0.1921569, 0, 1,
-1.884964, -0.6467828, -2.169061, 1, 0.1960784, 0, 1,
-1.843584, -1.567943, -3.226739, 1, 0.2039216, 0, 1,
-1.839914, -1.592253, -0.7369221, 1, 0.2117647, 0, 1,
-1.838919, -0.8331877, -1.979004, 1, 0.2156863, 0, 1,
-1.835616, -0.8702936, -2.253497, 1, 0.2235294, 0, 1,
-1.819235, -0.4467991, -2.966255, 1, 0.227451, 0, 1,
-1.814685, -0.427584, -1.708829, 1, 0.2352941, 0, 1,
-1.806, -1.599265, -1.937891, 1, 0.2392157, 0, 1,
-1.80331, -0.5190307, -2.565621, 1, 0.2470588, 0, 1,
-1.798717, 0.8211496, -0.2150808, 1, 0.2509804, 0, 1,
-1.792951, 0.4589652, -1.50191, 1, 0.2588235, 0, 1,
-1.788267, -0.2008533, -1.281717, 1, 0.2627451, 0, 1,
-1.771744, -0.009267626, -3.205832, 1, 0.2705882, 0, 1,
-1.764671, -0.4114764, -1.778891, 1, 0.2745098, 0, 1,
-1.753239, -0.1080577, -1.097238, 1, 0.282353, 0, 1,
-1.74997, 0.5351796, -1.549801, 1, 0.2862745, 0, 1,
-1.740038, -0.4215522, -0.5536924, 1, 0.2941177, 0, 1,
-1.738587, 1.254457, 0.2158956, 1, 0.3019608, 0, 1,
-1.728768, 0.1522883, -0.02095406, 1, 0.3058824, 0, 1,
-1.714259, -0.09295443, -2.741219, 1, 0.3137255, 0, 1,
-1.710699, 0.02815478, -0.4360643, 1, 0.3176471, 0, 1,
-1.7073, 0.5780402, -1.27455, 1, 0.3254902, 0, 1,
-1.693437, -0.8441865, -0.4938202, 1, 0.3294118, 0, 1,
-1.692634, 0.4159023, -2.883022, 1, 0.3372549, 0, 1,
-1.670281, -1.318516, -0.5114984, 1, 0.3411765, 0, 1,
-1.661138, -1.015283, -0.8291318, 1, 0.3490196, 0, 1,
-1.657372, 0.8761499, -1.345771, 1, 0.3529412, 0, 1,
-1.655479, -1.024532, -2.040218, 1, 0.3607843, 0, 1,
-1.647938, -0.6143842, -2.078878, 1, 0.3647059, 0, 1,
-1.63175, 0.2387668, -4.440533, 1, 0.372549, 0, 1,
-1.629694, 0.2802842, -3.041391, 1, 0.3764706, 0, 1,
-1.618379, 0.1005458, -2.192746, 1, 0.3843137, 0, 1,
-1.617235, 0.6676322, -0.08199515, 1, 0.3882353, 0, 1,
-1.610776, 0.2282158, -2.529233, 1, 0.3960784, 0, 1,
-1.60385, 0.5181047, -0.4899625, 1, 0.4039216, 0, 1,
-1.598386, 0.7060024, -1.088606, 1, 0.4078431, 0, 1,
-1.570398, -0.06373083, -1.271602, 1, 0.4156863, 0, 1,
-1.561419, 1.292567, -0.3121253, 1, 0.4196078, 0, 1,
-1.560923, -0.3923325, -3.168594, 1, 0.427451, 0, 1,
-1.558307, 0.7861046, -0.619091, 1, 0.4313726, 0, 1,
-1.540526, 0.3395186, -1.041826, 1, 0.4392157, 0, 1,
-1.539768, -1.285571, -2.672196, 1, 0.4431373, 0, 1,
-1.536304, -0.3223633, -2.278216, 1, 0.4509804, 0, 1,
-1.531331, -0.5135112, -3.106437, 1, 0.454902, 0, 1,
-1.519141, 0.679474, -1.544266, 1, 0.4627451, 0, 1,
-1.517091, -1.068288, -3.01303, 1, 0.4666667, 0, 1,
-1.509006, -1.352965, -2.249082, 1, 0.4745098, 0, 1,
-1.508652, -0.6158653, -2.975995, 1, 0.4784314, 0, 1,
-1.508096, -0.7961683, -3.194932, 1, 0.4862745, 0, 1,
-1.497611, 1.138603, -0.4612574, 1, 0.4901961, 0, 1,
-1.495292, -1.127305, -1.617438, 1, 0.4980392, 0, 1,
-1.44674, -1.571982, -3.570514, 1, 0.5058824, 0, 1,
-1.440019, -0.8060733, -0.5182428, 1, 0.509804, 0, 1,
-1.43886, 0.2436692, -1.428852, 1, 0.5176471, 0, 1,
-1.432366, -0.2565637, -2.231085, 1, 0.5215687, 0, 1,
-1.425658, 0.4026208, 0.3317387, 1, 0.5294118, 0, 1,
-1.40862, -0.4762599, -2.4991, 1, 0.5333334, 0, 1,
-1.405127, -1.019895, -3.012538, 1, 0.5411765, 0, 1,
-1.404258, -0.0294446, -3.079353, 1, 0.5450981, 0, 1,
-1.399652, 0.02229389, -2.65941, 1, 0.5529412, 0, 1,
-1.397252, 0.3899421, -1.50648, 1, 0.5568628, 0, 1,
-1.387987, -0.3204817, -2.190233, 1, 0.5647059, 0, 1,
-1.384078, 0.1933885, -0.8155946, 1, 0.5686275, 0, 1,
-1.379498, -0.8154711, -3.555075, 1, 0.5764706, 0, 1,
-1.376031, 2.000924, -0.5931246, 1, 0.5803922, 0, 1,
-1.374081, -1.600687, -1.771776, 1, 0.5882353, 0, 1,
-1.373502, 0.4022543, -0.09793487, 1, 0.5921569, 0, 1,
-1.372033, 0.8710241, -3.409514, 1, 0.6, 0, 1,
-1.369332, -1.190091, -3.123291, 1, 0.6078432, 0, 1,
-1.350969, -1.599005, -1.497507, 1, 0.6117647, 0, 1,
-1.350311, -0.5621417, -1.507382, 1, 0.6196079, 0, 1,
-1.34349, -0.1012222, -1.355226, 1, 0.6235294, 0, 1,
-1.341282, -0.2374332, -2.113866, 1, 0.6313726, 0, 1,
-1.335695, -0.2712343, -1.841282, 1, 0.6352941, 0, 1,
-1.324327, -0.733487, -2.813593, 1, 0.6431373, 0, 1,
-1.321026, -2.019431, -1.047711, 1, 0.6470588, 0, 1,
-1.317854, 0.6819348, -0.8455698, 1, 0.654902, 0, 1,
-1.308716, -0.578867, -3.864252, 1, 0.6588235, 0, 1,
-1.298154, -1.215944, -1.811613, 1, 0.6666667, 0, 1,
-1.297722, -0.1564217, -1.554066, 1, 0.6705883, 0, 1,
-1.29755, 1.029155, -2.56749, 1, 0.6784314, 0, 1,
-1.287454, -0.04029816, -2.551003, 1, 0.682353, 0, 1,
-1.286858, -0.9075611, -1.661355, 1, 0.6901961, 0, 1,
-1.280158, 0.373631, -1.064112, 1, 0.6941177, 0, 1,
-1.266812, 0.3443834, -1.521894, 1, 0.7019608, 0, 1,
-1.256842, -0.2689405, -0.3291956, 1, 0.7098039, 0, 1,
-1.249262, 1.583173, -1.551948, 1, 0.7137255, 0, 1,
-1.245442, 0.5216314, -1.915278, 1, 0.7215686, 0, 1,
-1.243194, -0.8089702, -2.222117, 1, 0.7254902, 0, 1,
-1.239978, -0.4648787, -1.932106, 1, 0.7333333, 0, 1,
-1.236356, -1.941924, -1.513845, 1, 0.7372549, 0, 1,
-1.230391, 0.7147645, -1.072287, 1, 0.7450981, 0, 1,
-1.228465, -0.5939286, -0.9564728, 1, 0.7490196, 0, 1,
-1.22376, -0.08463702, -0.9721518, 1, 0.7568628, 0, 1,
-1.22076, 1.122214, -0.4206037, 1, 0.7607843, 0, 1,
-1.2169, -1.044027, -2.892585, 1, 0.7686275, 0, 1,
-1.214736, -1.25114, -2.225291, 1, 0.772549, 0, 1,
-1.210135, 0.4907583, -1.108526, 1, 0.7803922, 0, 1,
-1.203843, -0.8050037, -0.8045881, 1, 0.7843137, 0, 1,
-1.192545, 0.2586668, -1.072538, 1, 0.7921569, 0, 1,
-1.191088, 0.5286972, -0.9799633, 1, 0.7960784, 0, 1,
-1.184076, 0.4136865, -2.501655, 1, 0.8039216, 0, 1,
-1.182661, 0.6420732, -1.754982, 1, 0.8117647, 0, 1,
-1.177799, 0.3490625, -2.139864, 1, 0.8156863, 0, 1,
-1.155762, 0.7090884, -1.040015, 1, 0.8235294, 0, 1,
-1.15536, -0.1202119, -0.9770728, 1, 0.827451, 0, 1,
-1.148993, -0.2413142, -1.222713, 1, 0.8352941, 0, 1,
-1.14884, 0.2630954, -1.380809, 1, 0.8392157, 0, 1,
-1.139836, -0.3480369, -1.245791, 1, 0.8470588, 0, 1,
-1.135406, 0.1356856, 0.01397969, 1, 0.8509804, 0, 1,
-1.135275, 1.770484, -2.010693, 1, 0.8588235, 0, 1,
-1.132895, -1.834798, -1.954152, 1, 0.8627451, 0, 1,
-1.129391, -0.5183775, -2.574004, 1, 0.8705882, 0, 1,
-1.127726, 1.159024, 0.9786049, 1, 0.8745098, 0, 1,
-1.124962, 0.8701779, -2.337108, 1, 0.8823529, 0, 1,
-1.12031, 0.4877572, -1.656048, 1, 0.8862745, 0, 1,
-1.115434, 0.7111037, -2.809299, 1, 0.8941177, 0, 1,
-1.108856, -0.4027424, -2.105155, 1, 0.8980392, 0, 1,
-1.102251, -1.292674, -2.791859, 1, 0.9058824, 0, 1,
-1.100809, 0.4367091, -1.533335, 1, 0.9137255, 0, 1,
-1.099873, -0.05887906, -0.6976153, 1, 0.9176471, 0, 1,
-1.09777, 0.7919007, -0.6705685, 1, 0.9254902, 0, 1,
-1.088538, 0.931476, -1.635795, 1, 0.9294118, 0, 1,
-1.087713, -1.274038, -2.205194, 1, 0.9372549, 0, 1,
-1.087521, 0.8235475, -0.2947089, 1, 0.9411765, 0, 1,
-1.071457, -0.1176692, -0.8838451, 1, 0.9490196, 0, 1,
-1.062093, 0.7930751, -2.222996, 1, 0.9529412, 0, 1,
-1.054969, -0.8540703, -1.715963, 1, 0.9607843, 0, 1,
-1.046327, 1.652288, -1.415557, 1, 0.9647059, 0, 1,
-1.044998, 0.4123251, -3.118098, 1, 0.972549, 0, 1,
-1.038548, -0.5628322, -0.4881477, 1, 0.9764706, 0, 1,
-1.033035, -1.535894, -4.233176, 1, 0.9843137, 0, 1,
-1.028041, 0.4172254, -0.1834819, 1, 0.9882353, 0, 1,
-1.024981, -2.220924, -1.392093, 1, 0.9960784, 0, 1,
-1.019342, 0.9118452, -0.7179251, 0.9960784, 1, 0, 1,
-1.016899, 0.6927729, 0.002037253, 0.9921569, 1, 0, 1,
-1.01574, 0.8391209, -2.453522, 0.9843137, 1, 0, 1,
-1.014477, -0.8228216, -1.954787, 0.9803922, 1, 0, 1,
-1.008325, 0.07742453, -1.706665, 0.972549, 1, 0, 1,
-1.002812, -0.02614406, -0.5535399, 0.9686275, 1, 0, 1,
-1.002805, 0.1490129, -1.798195, 0.9607843, 1, 0, 1,
-0.995937, -0.7200304, -1.565837, 0.9568627, 1, 0, 1,
-0.9952814, -1.08445, -2.013539, 0.9490196, 1, 0, 1,
-0.9757627, 0.6972942, -1.516786, 0.945098, 1, 0, 1,
-0.9731157, -0.007998209, -1.226312, 0.9372549, 1, 0, 1,
-0.9682807, -1.042224, -3.000961, 0.9333333, 1, 0, 1,
-0.958491, -3.176141, -3.529389, 0.9254902, 1, 0, 1,
-0.958278, 0.9216318, -2.043189, 0.9215686, 1, 0, 1,
-0.9529532, -0.8573189, -1.959444, 0.9137255, 1, 0, 1,
-0.9468387, 1.3642, 0.137013, 0.9098039, 1, 0, 1,
-0.9466068, 1.744515, 0.692508, 0.9019608, 1, 0, 1,
-0.9275656, 1.40501, -0.4766889, 0.8941177, 1, 0, 1,
-0.92667, -1.185701, -1.244209, 0.8901961, 1, 0, 1,
-0.9251935, -0.9660982, -3.164468, 0.8823529, 1, 0, 1,
-0.9210497, 1.924061, -1.33528, 0.8784314, 1, 0, 1,
-0.9082274, 1.647536, 0.5202269, 0.8705882, 1, 0, 1,
-0.9066718, -0.4211956, -0.611194, 0.8666667, 1, 0, 1,
-0.9037471, -1.430354, -1.634074, 0.8588235, 1, 0, 1,
-0.8998291, -0.5541535, -2.779948, 0.854902, 1, 0, 1,
-0.8981159, -0.6424598, -3.376504, 0.8470588, 1, 0, 1,
-0.8931588, -1.862284, -2.508024, 0.8431373, 1, 0, 1,
-0.8891644, -0.0848785, -3.147142, 0.8352941, 1, 0, 1,
-0.882367, -0.406324, -1.089746, 0.8313726, 1, 0, 1,
-0.8815269, 1.272931, 0.7239819, 0.8235294, 1, 0, 1,
-0.8797656, -0.5447758, -1.831689, 0.8196079, 1, 0, 1,
-0.8791664, 0.536893, -1.949399, 0.8117647, 1, 0, 1,
-0.8772018, -0.1217157, -0.6891136, 0.8078431, 1, 0, 1,
-0.8722579, 0.5671694, -0.1320771, 0.8, 1, 0, 1,
-0.8715905, 0.8842061, -0.3190365, 0.7921569, 1, 0, 1,
-0.8715243, -0.4658231, -0.6816873, 0.7882353, 1, 0, 1,
-0.8714715, 0.1155877, -1.733401, 0.7803922, 1, 0, 1,
-0.8633096, 0.003680525, -3.457694, 0.7764706, 1, 0, 1,
-0.8612621, 0.2997842, -1.969142, 0.7686275, 1, 0, 1,
-0.8611798, 0.5571057, -0.688961, 0.7647059, 1, 0, 1,
-0.8609163, 0.7129306, -1.580235, 0.7568628, 1, 0, 1,
-0.8600388, -0.157051, -2.504013, 0.7529412, 1, 0, 1,
-0.8581539, 1.281761, 0.1824267, 0.7450981, 1, 0, 1,
-0.8577151, -0.5173233, -0.8545256, 0.7411765, 1, 0, 1,
-0.8552513, 0.438964, -1.994954, 0.7333333, 1, 0, 1,
-0.852641, 1.09242, -0.1336376, 0.7294118, 1, 0, 1,
-0.8523292, -1.43446, -3.119733, 0.7215686, 1, 0, 1,
-0.8482519, -0.3695002, -3.279088, 0.7176471, 1, 0, 1,
-0.8474831, 0.8881848, -1.357725, 0.7098039, 1, 0, 1,
-0.8438516, 0.8547341, 0.04642262, 0.7058824, 1, 0, 1,
-0.8372598, -0.1106299, -1.129272, 0.6980392, 1, 0, 1,
-0.8296068, 2.820517, -0.8707433, 0.6901961, 1, 0, 1,
-0.8271357, -0.3052854, -2.665519, 0.6862745, 1, 0, 1,
-0.8232277, -0.6711906, -0.6063648, 0.6784314, 1, 0, 1,
-0.8215572, 2.073195, 1.828086, 0.6745098, 1, 0, 1,
-0.8099738, -0.05898685, -2.173893, 0.6666667, 1, 0, 1,
-0.8072516, 0.004650684, -2.034595, 0.6627451, 1, 0, 1,
-0.8019781, 0.3779894, -2.373076, 0.654902, 1, 0, 1,
-0.8012236, -0.7312857, -2.190946, 0.6509804, 1, 0, 1,
-0.7942849, -0.3091303, 0.3006204, 0.6431373, 1, 0, 1,
-0.7931247, 1.62079, -2.237805, 0.6392157, 1, 0, 1,
-0.7872794, 3.547541, -2.062543, 0.6313726, 1, 0, 1,
-0.7867358, -0.4276197, -1.295313, 0.627451, 1, 0, 1,
-0.7774343, 2.125762, 0.4031517, 0.6196079, 1, 0, 1,
-0.7635624, -0.2611972, -1.301723, 0.6156863, 1, 0, 1,
-0.7631426, 1.145867, 0.134328, 0.6078432, 1, 0, 1,
-0.7601517, -1.188224, -2.351358, 0.6039216, 1, 0, 1,
-0.7533101, 0.3548407, 0.5469348, 0.5960785, 1, 0, 1,
-0.7521251, 0.1180455, -2.432161, 0.5882353, 1, 0, 1,
-0.7496802, 1.110149, -0.2195957, 0.5843138, 1, 0, 1,
-0.7429835, 1.224614, -0.2614002, 0.5764706, 1, 0, 1,
-0.741536, -0.06751345, -1.905344, 0.572549, 1, 0, 1,
-0.7352536, -0.1863758, -1.935882, 0.5647059, 1, 0, 1,
-0.7326239, 0.8337793, 1.312195, 0.5607843, 1, 0, 1,
-0.7262731, 1.395973, 0.8319819, 0.5529412, 1, 0, 1,
-0.7225423, 0.1681712, 0.1348598, 0.5490196, 1, 0, 1,
-0.718009, 0.1386855, -1.121474, 0.5411765, 1, 0, 1,
-0.7179671, -1.717634, -1.672373, 0.5372549, 1, 0, 1,
-0.7137655, -0.2464141, -2.045045, 0.5294118, 1, 0, 1,
-0.7128558, 1.001786, -1.143716, 0.5254902, 1, 0, 1,
-0.7124394, -0.4449679, -3.127747, 0.5176471, 1, 0, 1,
-0.7083882, -1.163681, -2.113934, 0.5137255, 1, 0, 1,
-0.7062084, 0.7881178, -0.3221243, 0.5058824, 1, 0, 1,
-0.7021388, -2.14234, -2.601151, 0.5019608, 1, 0, 1,
-0.7008641, 0.8403167, -0.2085103, 0.4941176, 1, 0, 1,
-0.7008137, -0.6434338, -1.857303, 0.4862745, 1, 0, 1,
-0.695147, -0.2940704, -2.247249, 0.4823529, 1, 0, 1,
-0.6922528, -0.668213, 0.05036086, 0.4745098, 1, 0, 1,
-0.6918684, 0.1473263, -0.4330701, 0.4705882, 1, 0, 1,
-0.6913769, -1.464633, -6.519442, 0.4627451, 1, 0, 1,
-0.6898981, -0.4044707, -0.404191, 0.4588235, 1, 0, 1,
-0.6872683, 0.05758634, -2.624919, 0.4509804, 1, 0, 1,
-0.6863818, -0.305414, -0.8851326, 0.4470588, 1, 0, 1,
-0.6863251, 0.3947521, -2.63264, 0.4392157, 1, 0, 1,
-0.6833134, 0.1891826, -1.302865, 0.4352941, 1, 0, 1,
-0.6828286, 0.761046, -0.597847, 0.427451, 1, 0, 1,
-0.6811827, -0.4885979, -2.846156, 0.4235294, 1, 0, 1,
-0.6801911, -1.593507, -2.290403, 0.4156863, 1, 0, 1,
-0.6800719, 0.7835712, -0.5915084, 0.4117647, 1, 0, 1,
-0.6795859, -0.2719555, -1.938542, 0.4039216, 1, 0, 1,
-0.6778162, -1.461968, -1.296932, 0.3960784, 1, 0, 1,
-0.6774173, 0.5284843, -0.5212702, 0.3921569, 1, 0, 1,
-0.6770843, -0.118405, -1.595688, 0.3843137, 1, 0, 1,
-0.6737047, -2.581321, -0.7776293, 0.3803922, 1, 0, 1,
-0.6731432, 1.255428, -0.6409963, 0.372549, 1, 0, 1,
-0.6711465, 1.147593, -1.022998, 0.3686275, 1, 0, 1,
-0.6692165, -0.9756004, -3.029319, 0.3607843, 1, 0, 1,
-0.6687937, -0.2303422, -3.880814, 0.3568628, 1, 0, 1,
-0.6684418, -0.9167044, -3.191148, 0.3490196, 1, 0, 1,
-0.6659314, -0.4108385, -2.286764, 0.345098, 1, 0, 1,
-0.665402, -1.063162, -2.302867, 0.3372549, 1, 0, 1,
-0.6636885, -0.0997469, -2.30964, 0.3333333, 1, 0, 1,
-0.6612067, 0.2216445, -1.92788, 0.3254902, 1, 0, 1,
-0.6589849, 0.194828, -3.114793, 0.3215686, 1, 0, 1,
-0.6550964, 0.6205276, -0.6450114, 0.3137255, 1, 0, 1,
-0.6536024, 1.111255, -1.470026, 0.3098039, 1, 0, 1,
-0.6525728, 0.9391336, 1.014021, 0.3019608, 1, 0, 1,
-0.643081, 0.5604384, -2.3221, 0.2941177, 1, 0, 1,
-0.6397544, 0.7320743, -1.57894, 0.2901961, 1, 0, 1,
-0.6335625, -0.3453932, -2.095721, 0.282353, 1, 0, 1,
-0.6328079, 0.5533804, -0.1128608, 0.2784314, 1, 0, 1,
-0.6325832, 1.267113, -1.272397, 0.2705882, 1, 0, 1,
-0.6319227, 0.9983029, 0.1039904, 0.2666667, 1, 0, 1,
-0.6318406, 1.161816, -1.837506, 0.2588235, 1, 0, 1,
-0.6310638, 0.02827209, -0.6835874, 0.254902, 1, 0, 1,
-0.6306882, -0.3946937, -3.367041, 0.2470588, 1, 0, 1,
-0.6270981, -2.264347, -2.475175, 0.2431373, 1, 0, 1,
-0.6254205, -0.782304, -3.559347, 0.2352941, 1, 0, 1,
-0.623076, 0.01035188, 0.2448989, 0.2313726, 1, 0, 1,
-0.6222852, 0.3666231, -0.9001053, 0.2235294, 1, 0, 1,
-0.6217644, -0.2175057, -2.101458, 0.2196078, 1, 0, 1,
-0.6161069, -0.07575431, -1.943463, 0.2117647, 1, 0, 1,
-0.6147496, 0.1693197, -1.556947, 0.2078431, 1, 0, 1,
-0.6120407, -0.9873598, -2.684016, 0.2, 1, 0, 1,
-0.6119105, -1.484663, -3.155437, 0.1921569, 1, 0, 1,
-0.6049009, -0.3957537, -1.61446, 0.1882353, 1, 0, 1,
-0.6032602, -0.4083579, -2.057525, 0.1803922, 1, 0, 1,
-0.5982571, 1.671637, 0.4676577, 0.1764706, 1, 0, 1,
-0.5894215, 0.7251645, 0.094359, 0.1686275, 1, 0, 1,
-0.5847005, 1.28613, -2.408354, 0.1647059, 1, 0, 1,
-0.5829097, -0.5149894, -3.070678, 0.1568628, 1, 0, 1,
-0.5812402, -0.9651148, -2.630162, 0.1529412, 1, 0, 1,
-0.5796307, 0.7907423, 0.5964334, 0.145098, 1, 0, 1,
-0.5787653, 0.7474376, -0.493432, 0.1411765, 1, 0, 1,
-0.5765837, -0.6892283, -1.946782, 0.1333333, 1, 0, 1,
-0.5760784, -1.001308, -4.188602, 0.1294118, 1, 0, 1,
-0.5699003, 1.47616, 1.649413, 0.1215686, 1, 0, 1,
-0.5683676, -0.6489585, -1.648373, 0.1176471, 1, 0, 1,
-0.560863, 1.891225, -1.902555, 0.1098039, 1, 0, 1,
-0.5585526, -0.702747, -2.783597, 0.1058824, 1, 0, 1,
-0.5541775, -0.6154843, -3.006886, 0.09803922, 1, 0, 1,
-0.544104, 1.097497, 0.7937062, 0.09019608, 1, 0, 1,
-0.5394177, 0.2692575, -2.812653, 0.08627451, 1, 0, 1,
-0.5334702, -0.4944779, -3.158771, 0.07843138, 1, 0, 1,
-0.5270451, -0.8133954, -3.640371, 0.07450981, 1, 0, 1,
-0.5223442, 1.598242, -0.6713313, 0.06666667, 1, 0, 1,
-0.5185494, 0.6274503, 0.6588549, 0.0627451, 1, 0, 1,
-0.5157272, 0.07035676, -2.093321, 0.05490196, 1, 0, 1,
-0.5144662, -0.2277824, -3.058978, 0.05098039, 1, 0, 1,
-0.511824, -0.9876835, -0.550273, 0.04313726, 1, 0, 1,
-0.5114401, 0.03674952, -1.510874, 0.03921569, 1, 0, 1,
-0.5076396, -0.9600863, -1.646011, 0.03137255, 1, 0, 1,
-0.5044957, 0.6722757, -1.209997, 0.02745098, 1, 0, 1,
-0.5031292, -1.244709, -3.067822, 0.01960784, 1, 0, 1,
-0.5029369, 0.2661604, -0.448363, 0.01568628, 1, 0, 1,
-0.5008993, -0.884268, -3.16221, 0.007843138, 1, 0, 1,
-0.4976131, 0.5811397, -0.4441163, 0.003921569, 1, 0, 1,
-0.49737, -0.2874011, -3.200059, 0, 1, 0.003921569, 1,
-0.4919643, -0.4416895, -1.805334, 0, 1, 0.01176471, 1,
-0.4912903, -1.010192, -2.61078, 0, 1, 0.01568628, 1,
-0.4876342, -0.5050745, -2.942477, 0, 1, 0.02352941, 1,
-0.4872399, -1.036, -2.021925, 0, 1, 0.02745098, 1,
-0.4814132, 1.3875, 0.5472325, 0, 1, 0.03529412, 1,
-0.4794009, -1.279161, -1.232454, 0, 1, 0.03921569, 1,
-0.4776539, -1.769262, -2.246496, 0, 1, 0.04705882, 1,
-0.4765859, -0.6497349, -2.928286, 0, 1, 0.05098039, 1,
-0.4721283, 0.8396533, -0.5899689, 0, 1, 0.05882353, 1,
-0.4713026, 0.5924564, -0.2374236, 0, 1, 0.0627451, 1,
-0.4699619, -0.6141244, -2.802743, 0, 1, 0.07058824, 1,
-0.4696617, -1.19043, -1.805914, 0, 1, 0.07450981, 1,
-0.4667612, 1.262275, -0.8118137, 0, 1, 0.08235294, 1,
-0.4660927, -2.152813, -4.944855, 0, 1, 0.08627451, 1,
-0.4654757, -0.8507408, -1.287631, 0, 1, 0.09411765, 1,
-0.4626241, 0.8344252, -0.3200928, 0, 1, 0.1019608, 1,
-0.4612773, -0.2177877, -1.606907, 0, 1, 0.1058824, 1,
-0.4556547, -0.4373343, -2.91181, 0, 1, 0.1137255, 1,
-0.4539992, -0.9991646, -3.254359, 0, 1, 0.1176471, 1,
-0.4535882, -1.659981, -4.109858, 0, 1, 0.1254902, 1,
-0.4506794, 0.04436085, -0.2914508, 0, 1, 0.1294118, 1,
-0.4485354, 0.054176, -3.071497, 0, 1, 0.1372549, 1,
-0.4478533, 0.1371557, -0.8129768, 0, 1, 0.1411765, 1,
-0.4446522, -1.467535, -2.716012, 0, 1, 0.1490196, 1,
-0.4372893, 1.148172, -0.7347059, 0, 1, 0.1529412, 1,
-0.4324635, 0.3963309, -0.9126784, 0, 1, 0.1607843, 1,
-0.431645, -0.349736, -2.429888, 0, 1, 0.1647059, 1,
-0.4277017, 1.187965, 0.2742682, 0, 1, 0.172549, 1,
-0.4268492, -0.7388991, -3.427779, 0, 1, 0.1764706, 1,
-0.4242181, 0.8292405, -2.169848, 0, 1, 0.1843137, 1,
-0.4219243, -0.7580675, -3.008747, 0, 1, 0.1882353, 1,
-0.4200907, 1.226094, 0.5596035, 0, 1, 0.1960784, 1,
-0.41967, -0.6260223, -2.571937, 0, 1, 0.2039216, 1,
-0.4144213, -0.2792269, -2.885684, 0, 1, 0.2078431, 1,
-0.4133506, -0.3398177, -1.552623, 0, 1, 0.2156863, 1,
-0.4130775, -1.400789, -4.233088, 0, 1, 0.2196078, 1,
-0.4124833, 1.460676, -0.9223697, 0, 1, 0.227451, 1,
-0.4083912, -1.038821, -1.724836, 0, 1, 0.2313726, 1,
-0.4062742, -0.3771817, -3.155142, 0, 1, 0.2392157, 1,
-0.4023118, -0.7207204, -3.090012, 0, 1, 0.2431373, 1,
-0.401874, 0.6213987, -1.067714, 0, 1, 0.2509804, 1,
-0.4000393, -0.3397653, -2.351452, 0, 1, 0.254902, 1,
-0.399516, 0.2088221, -0.9743255, 0, 1, 0.2627451, 1,
-0.3979127, 1.507489, -1.136256, 0, 1, 0.2666667, 1,
-0.3978172, 0.2096237, -0.78074, 0, 1, 0.2745098, 1,
-0.3945895, 0.06150032, -2.596067, 0, 1, 0.2784314, 1,
-0.3898114, -0.3938782, -0.8441803, 0, 1, 0.2862745, 1,
-0.385702, 0.2790588, -1.463947, 0, 1, 0.2901961, 1,
-0.3847814, 0.8720781, 1.151594, 0, 1, 0.2980392, 1,
-0.3841788, -0.2181098, -1.955909, 0, 1, 0.3058824, 1,
-0.3840982, -0.2827324, -1.252845, 0, 1, 0.3098039, 1,
-0.3815311, 0.07902904, -3.815399, 0, 1, 0.3176471, 1,
-0.3740025, 0.1021909, -0.294903, 0, 1, 0.3215686, 1,
-0.3725976, -1.302843, -2.837868, 0, 1, 0.3294118, 1,
-0.3706006, 0.08180968, -2.2621, 0, 1, 0.3333333, 1,
-0.3675894, 0.01889926, -0.8815148, 0, 1, 0.3411765, 1,
-0.3652288, 1.452387, 0.8363669, 0, 1, 0.345098, 1,
-0.3632887, 0.2503466, -0.8409235, 0, 1, 0.3529412, 1,
-0.3632058, -0.4332571, -2.796654, 0, 1, 0.3568628, 1,
-0.3605234, 0.681868, 1.790638, 0, 1, 0.3647059, 1,
-0.3601314, 0.4632449, -3.701718, 0, 1, 0.3686275, 1,
-0.3600454, -0.3007915, -4.15003, 0, 1, 0.3764706, 1,
-0.3596847, -0.7304967, -2.26849, 0, 1, 0.3803922, 1,
-0.3474632, 0.06077692, -2.024124, 0, 1, 0.3882353, 1,
-0.3439715, -1.012414, -1.627965, 0, 1, 0.3921569, 1,
-0.343438, 1.360927, -0.04911646, 0, 1, 0.4, 1,
-0.341024, -1.423898, -2.335055, 0, 1, 0.4078431, 1,
-0.3397512, 1.225191, -0.305302, 0, 1, 0.4117647, 1,
-0.3393356, 0.1415164, -1.803357, 0, 1, 0.4196078, 1,
-0.3365905, 0.2549483, -1.293334, 0, 1, 0.4235294, 1,
-0.3351409, -2.203675, -2.55908, 0, 1, 0.4313726, 1,
-0.3339176, -1.016624, -1.908331, 0, 1, 0.4352941, 1,
-0.3334384, 0.4979585, 0.4315805, 0, 1, 0.4431373, 1,
-0.3309636, 1.451505, -1.652548, 0, 1, 0.4470588, 1,
-0.33075, 0.741735, 0.8955457, 0, 1, 0.454902, 1,
-0.330727, -0.5938815, -2.66738, 0, 1, 0.4588235, 1,
-0.3291788, -1.884147, -3.003022, 0, 1, 0.4666667, 1,
-0.3281464, 0.04820146, -1.35506, 0, 1, 0.4705882, 1,
-0.3269049, 0.2735624, -0.307725, 0, 1, 0.4784314, 1,
-0.3244491, 0.265546, -0.7264791, 0, 1, 0.4823529, 1,
-0.3199994, 0.3538614, 0.02883782, 0, 1, 0.4901961, 1,
-0.3164088, -1.101577, -0.1269475, 0, 1, 0.4941176, 1,
-0.3155837, 0.1969205, -0.3853872, 0, 1, 0.5019608, 1,
-0.3146414, -1.669523, -1.285581, 0, 1, 0.509804, 1,
-0.314057, -1.277471, -2.827797, 0, 1, 0.5137255, 1,
-0.3132645, 0.3045398, -0.9854059, 0, 1, 0.5215687, 1,
-0.3029701, -0.4878263, -3.827888, 0, 1, 0.5254902, 1,
-0.3019235, 1.566914, -0.7382939, 0, 1, 0.5333334, 1,
-0.3011816, -0.4899494, -1.842804, 0, 1, 0.5372549, 1,
-0.2979822, 0.3977713, -0.08786521, 0, 1, 0.5450981, 1,
-0.2975352, -0.3324307, -2.201422, 0, 1, 0.5490196, 1,
-0.2968716, -0.1721942, -1.936289, 0, 1, 0.5568628, 1,
-0.2903697, 0.8854735, 1.322692, 0, 1, 0.5607843, 1,
-0.2744106, -2.141957, -3.044427, 0, 1, 0.5686275, 1,
-0.2704572, -1.414638, -1.877735, 0, 1, 0.572549, 1,
-0.2656541, 0.3457771, -2.82526, 0, 1, 0.5803922, 1,
-0.2655018, -0.3802106, -2.720468, 0, 1, 0.5843138, 1,
-0.262812, -0.4148659, -3.025498, 0, 1, 0.5921569, 1,
-0.261924, -0.3367965, -2.57999, 0, 1, 0.5960785, 1,
-0.2606661, 0.9150885, 0.2717132, 0, 1, 0.6039216, 1,
-0.2602722, -0.1169559, -1.02512, 0, 1, 0.6117647, 1,
-0.2596604, 0.7669759, -1.603558, 0, 1, 0.6156863, 1,
-0.2562196, -2.081084, -2.228233, 0, 1, 0.6235294, 1,
-0.2539113, 0.7713265, 0.2440142, 0, 1, 0.627451, 1,
-0.2523445, -0.5452215, -4.61427, 0, 1, 0.6352941, 1,
-0.2494826, -2.018241, -2.189689, 0, 1, 0.6392157, 1,
-0.2486247, -2.176369, -3.455388, 0, 1, 0.6470588, 1,
-0.2452535, 0.3027802, -1.768267, 0, 1, 0.6509804, 1,
-0.2406864, -0.2408207, -2.296753, 0, 1, 0.6588235, 1,
-0.2381348, -0.9072017, -2.228222, 0, 1, 0.6627451, 1,
-0.2349557, 0.8512628, -1.632156, 0, 1, 0.6705883, 1,
-0.2335695, 0.8970501, 0.1524038, 0, 1, 0.6745098, 1,
-0.2335539, 0.4106304, 1.683419, 0, 1, 0.682353, 1,
-0.2258236, 1.378656, 1.480325, 0, 1, 0.6862745, 1,
-0.2241727, 1.051118, -0.239933, 0, 1, 0.6941177, 1,
-0.2211789, 0.7562236, 1.391217, 0, 1, 0.7019608, 1,
-0.2207226, -0.4052308, -1.186935, 0, 1, 0.7058824, 1,
-0.2200034, -0.947523, -5.227739, 0, 1, 0.7137255, 1,
-0.2161461, 0.7578176, 0.8928587, 0, 1, 0.7176471, 1,
-0.2094706, 0.2509679, -1.004791, 0, 1, 0.7254902, 1,
-0.2063101, 0.07772642, -1.162842, 0, 1, 0.7294118, 1,
-0.1999585, 1.653198, 1.611248, 0, 1, 0.7372549, 1,
-0.1997653, 0.4526682, -0.7343296, 0, 1, 0.7411765, 1,
-0.196635, 0.4092308, 1.468211, 0, 1, 0.7490196, 1,
-0.1952797, 0.4653176, -1.39742, 0, 1, 0.7529412, 1,
-0.1930812, -1.156424, -2.31141, 0, 1, 0.7607843, 1,
-0.1909967, -0.5682945, -1.984291, 0, 1, 0.7647059, 1,
-0.1893787, -0.3880152, -2.975567, 0, 1, 0.772549, 1,
-0.1846577, 2.176415, -1.597341, 0, 1, 0.7764706, 1,
-0.1818039, -0.3193325, -2.430867, 0, 1, 0.7843137, 1,
-0.1775982, -2.38559, -2.277547, 0, 1, 0.7882353, 1,
-0.1740519, 0.09773666, -0.8714732, 0, 1, 0.7960784, 1,
-0.1737643, 0.6635631, -0.1294492, 0, 1, 0.8039216, 1,
-0.1734257, 1.13792, -0.5203586, 0, 1, 0.8078431, 1,
-0.1712317, -0.3793407, -3.318302, 0, 1, 0.8156863, 1,
-0.1688083, 0.8833362, 0.3226736, 0, 1, 0.8196079, 1,
-0.1683694, 0.3726897, -1.521874, 0, 1, 0.827451, 1,
-0.1675982, -0.7278516, -2.823394, 0, 1, 0.8313726, 1,
-0.1645507, 0.438921, 0.3643961, 0, 1, 0.8392157, 1,
-0.1641013, -0.373538, -4.137642, 0, 1, 0.8431373, 1,
-0.1575703, -0.7157189, -2.73819, 0, 1, 0.8509804, 1,
-0.1496406, 1.046782, -0.9144084, 0, 1, 0.854902, 1,
-0.1490596, -0.4923572, -2.831428, 0, 1, 0.8627451, 1,
-0.1470413, -2.345585, -1.540035, 0, 1, 0.8666667, 1,
-0.1469539, 0.1227559, -1.139056, 0, 1, 0.8745098, 1,
-0.1459979, 1.320364, 0.482323, 0, 1, 0.8784314, 1,
-0.1436537, 0.5324339, -0.6895377, 0, 1, 0.8862745, 1,
-0.1380027, 0.7614619, 0.2712754, 0, 1, 0.8901961, 1,
-0.1357015, -0.1489988, -1.773516, 0, 1, 0.8980392, 1,
-0.134598, 1.24598, -0.06119435, 0, 1, 0.9058824, 1,
-0.1303407, 0.2447124, 0.4905175, 0, 1, 0.9098039, 1,
-0.1283291, 0.6971428, -1.028731, 0, 1, 0.9176471, 1,
-0.1260402, 0.392684, -2.303012, 0, 1, 0.9215686, 1,
-0.1242482, 1.009377, -1.512302, 0, 1, 0.9294118, 1,
-0.1233067, -0.9511755, -3.254133, 0, 1, 0.9333333, 1,
-0.1225256, -0.3947634, -3.121638, 0, 1, 0.9411765, 1,
-0.119803, -0.1056453, -2.536188, 0, 1, 0.945098, 1,
-0.1182216, 0.2542933, -0.5837908, 0, 1, 0.9529412, 1,
-0.1143492, 0.1773077, -1.124628, 0, 1, 0.9568627, 1,
-0.1132151, 2.835999, 0.7238241, 0, 1, 0.9647059, 1,
-0.1118621, -2.035266, -2.62547, 0, 1, 0.9686275, 1,
-0.1097768, -0.3078618, -3.306767, 0, 1, 0.9764706, 1,
-0.1086408, 0.6597499, -0.3364525, 0, 1, 0.9803922, 1,
-0.1066087, -0.5520163, -4.122363, 0, 1, 0.9882353, 1,
-0.1055608, 1.788128, -0.9017462, 0, 1, 0.9921569, 1,
-0.1044037, 0.8260393, 0.188529, 0, 1, 1, 1,
-0.1024698, -0.734439, -3.088838, 0, 0.9921569, 1, 1,
-0.1013177, 0.8279716, 0.3357932, 0, 0.9882353, 1, 1,
-0.1003652, -1.313728, -3.22409, 0, 0.9803922, 1, 1,
-0.0980469, -0.2098116, -2.85311, 0, 0.9764706, 1, 1,
-0.09779047, 0.7765995, -0.2874392, 0, 0.9686275, 1, 1,
-0.09684132, 0.556486, -0.5232311, 0, 0.9647059, 1, 1,
-0.08994018, 1.237471, -1.563581, 0, 0.9568627, 1, 1,
-0.08178899, -0.06944861, -2.866879, 0, 0.9529412, 1, 1,
-0.08108936, 1.368391, -0.6983454, 0, 0.945098, 1, 1,
-0.07801621, -1.356161, -3.036944, 0, 0.9411765, 1, 1,
-0.07552896, 0.4911353, -0.1966991, 0, 0.9333333, 1, 1,
-0.0664707, 0.9988998, 1.140164, 0, 0.9294118, 1, 1,
-0.06613278, 0.5049361, 0.7631578, 0, 0.9215686, 1, 1,
-0.06538639, 0.6391899, 2.051117, 0, 0.9176471, 1, 1,
-0.06399419, -0.3605865, -4.187543, 0, 0.9098039, 1, 1,
-0.06394126, -1.049823, -1.783007, 0, 0.9058824, 1, 1,
-0.05890628, 1.006634, 0.649743, 0, 0.8980392, 1, 1,
-0.05322945, -1.14048, -2.23956, 0, 0.8901961, 1, 1,
-0.050813, 0.5986416, -0.87081, 0, 0.8862745, 1, 1,
-0.04725316, -0.4058169, -2.727597, 0, 0.8784314, 1, 1,
-0.04418271, -0.1488874, -2.855609, 0, 0.8745098, 1, 1,
-0.04327474, 0.8039135, 0.8936545, 0, 0.8666667, 1, 1,
-0.04258414, -1.965025, -0.8288248, 0, 0.8627451, 1, 1,
-0.04095694, 1.198228, -1.351466, 0, 0.854902, 1, 1,
-0.03905745, -0.9098902, -3.639687, 0, 0.8509804, 1, 1,
-0.03733197, 0.1531584, 0.4577483, 0, 0.8431373, 1, 1,
-0.0358563, 1.315934, -1.165977, 0, 0.8392157, 1, 1,
-0.03543929, -0.4527324, -1.638388, 0, 0.8313726, 1, 1,
-0.03272677, 0.2176408, -0.5539284, 0, 0.827451, 1, 1,
-0.03238469, -0.369684, -3.276649, 0, 0.8196079, 1, 1,
-0.02679289, -0.2477116, -3.08188, 0, 0.8156863, 1, 1,
-0.0239331, -0.5265291, -3.771527, 0, 0.8078431, 1, 1,
-0.02303076, -0.02321582, -1.610812, 0, 0.8039216, 1, 1,
-0.01970464, -0.6836381, -3.817436, 0, 0.7960784, 1, 1,
-0.01851439, -0.3038754, -4.10807, 0, 0.7882353, 1, 1,
-0.01430066, -1.553274, -2.417195, 0, 0.7843137, 1, 1,
-0.01362858, -0.4293451, -2.392879, 0, 0.7764706, 1, 1,
-0.008403209, -0.2933165, -3.759705, 0, 0.772549, 1, 1,
-0.0007471837, -0.2043675, -3.396883, 0, 0.7647059, 1, 1,
0.0003391949, -0.1852826, 3.283174, 0, 0.7607843, 1, 1,
0.003720488, -0.9003516, 3.172743, 0, 0.7529412, 1, 1,
0.006165671, 0.6066113, -0.5398033, 0, 0.7490196, 1, 1,
0.009195179, -0.5457412, 2.937407, 0, 0.7411765, 1, 1,
0.0118463, -0.7707442, 3.156294, 0, 0.7372549, 1, 1,
0.01187107, 0.186481, -0.6118286, 0, 0.7294118, 1, 1,
0.01465737, 0.7242656, -0.03650436, 0, 0.7254902, 1, 1,
0.01591583, 1.201404, -1.44784, 0, 0.7176471, 1, 1,
0.02288572, -0.8952215, 2.319739, 0, 0.7137255, 1, 1,
0.02726973, -1.05749, 1.61099, 0, 0.7058824, 1, 1,
0.02916446, 0.1791583, -0.6636028, 0, 0.6980392, 1, 1,
0.02917494, 0.1112892, 0.1395536, 0, 0.6941177, 1, 1,
0.03305683, -2.537462, 3.158177, 0, 0.6862745, 1, 1,
0.03465451, -0.002197223, 3.00369, 0, 0.682353, 1, 1,
0.03948421, -1.569055, 3.771245, 0, 0.6745098, 1, 1,
0.04242499, -0.5884012, 2.595598, 0, 0.6705883, 1, 1,
0.04397354, -0.1086944, 3.539957, 0, 0.6627451, 1, 1,
0.04477753, 0.2893098, -1.12324, 0, 0.6588235, 1, 1,
0.04484671, -0.1742997, 2.276234, 0, 0.6509804, 1, 1,
0.05025006, -0.7422596, 2.832499, 0, 0.6470588, 1, 1,
0.05591047, -1.972501, 3.793497, 0, 0.6392157, 1, 1,
0.05638609, 0.8975111, -0.4043154, 0, 0.6352941, 1, 1,
0.05811898, -1.144619, 1.988647, 0, 0.627451, 1, 1,
0.07218763, 0.3849678, 2.995466, 0, 0.6235294, 1, 1,
0.07653444, 1.150904, -0.6654419, 0, 0.6156863, 1, 1,
0.07666835, 0.3082707, 0.577038, 0, 0.6117647, 1, 1,
0.07796033, 0.3617709, 0.334848, 0, 0.6039216, 1, 1,
0.07843481, -0.9204978, 3.705767, 0, 0.5960785, 1, 1,
0.08285908, 1.173309, -0.1557789, 0, 0.5921569, 1, 1,
0.08295071, -0.3557172, 2.746938, 0, 0.5843138, 1, 1,
0.08468217, -1.336065, 4.491395, 0, 0.5803922, 1, 1,
0.08592162, -1.560785, 3.249138, 0, 0.572549, 1, 1,
0.08644266, 1.047619, -1.053373, 0, 0.5686275, 1, 1,
0.09129276, 0.3235944, -1.404803, 0, 0.5607843, 1, 1,
0.1006884, 1.105503, 2.009179, 0, 0.5568628, 1, 1,
0.1011356, -1.013927, 3.132944, 0, 0.5490196, 1, 1,
0.1040457, -0.8143886, 4.713042, 0, 0.5450981, 1, 1,
0.1092078, -1.367887, 1.636864, 0, 0.5372549, 1, 1,
0.1093882, -1.379819, 2.921663, 0, 0.5333334, 1, 1,
0.1097487, 0.7719196, -0.1661577, 0, 0.5254902, 1, 1,
0.1119505, -0.6193027, 3.023686, 0, 0.5215687, 1, 1,
0.1124854, -0.03306015, 3.20742, 0, 0.5137255, 1, 1,
0.1127699, 1.336528, 0.06780345, 0, 0.509804, 1, 1,
0.1128094, -1.001925, 4.047029, 0, 0.5019608, 1, 1,
0.114176, 1.578512, -1.590518, 0, 0.4941176, 1, 1,
0.1162319, -0.06871655, 2.468131, 0, 0.4901961, 1, 1,
0.1211785, -0.1535277, 3.228669, 0, 0.4823529, 1, 1,
0.1248975, 1.159042, 0.7711319, 0, 0.4784314, 1, 1,
0.1250484, -0.2680373, 3.508819, 0, 0.4705882, 1, 1,
0.1281715, -2.240132, 1.449508, 0, 0.4666667, 1, 1,
0.1358574, 0.7982147, 0.909591, 0, 0.4588235, 1, 1,
0.1397615, -0.4823618, 2.679934, 0, 0.454902, 1, 1,
0.1437592, -0.5489627, 3.371188, 0, 0.4470588, 1, 1,
0.1461162, 0.6537321, -0.2249834, 0, 0.4431373, 1, 1,
0.1503412, -0.6276322, 1.963418, 0, 0.4352941, 1, 1,
0.1509746, -1.780427, 3.172915, 0, 0.4313726, 1, 1,
0.1519414, 1.413654, 0.2943475, 0, 0.4235294, 1, 1,
0.1544283, -0.3983628, 2.769354, 0, 0.4196078, 1, 1,
0.1601309, -1.715999, 1.958366, 0, 0.4117647, 1, 1,
0.1605312, -0.5436913, 4.407998, 0, 0.4078431, 1, 1,
0.1616787, 0.1581826, 0.9819657, 0, 0.4, 1, 1,
0.1620202, -1.130723, 3.60448, 0, 0.3921569, 1, 1,
0.1623558, 0.4663877, -0.08088563, 0, 0.3882353, 1, 1,
0.1631671, -1.031015, 2.146796, 0, 0.3803922, 1, 1,
0.1696288, -1.156288, 2.738402, 0, 0.3764706, 1, 1,
0.1751439, -0.3588423, 2.901153, 0, 0.3686275, 1, 1,
0.1751594, 0.3860557, 1.118349, 0, 0.3647059, 1, 1,
0.1768199, 1.319593, -0.03707579, 0, 0.3568628, 1, 1,
0.1839804, 0.1220631, 2.351275, 0, 0.3529412, 1, 1,
0.1841696, 0.7381508, 2.301123, 0, 0.345098, 1, 1,
0.1885528, 0.07129258, -0.005759982, 0, 0.3411765, 1, 1,
0.2075377, -0.375017, 3.404914, 0, 0.3333333, 1, 1,
0.2124044, 0.2366066, -1.092134, 0, 0.3294118, 1, 1,
0.2124798, -1.516788, 2.525245, 0, 0.3215686, 1, 1,
0.2154212, -1.003507, 3.960989, 0, 0.3176471, 1, 1,
0.2170251, -1.013019, 3.511028, 0, 0.3098039, 1, 1,
0.2181844, 1.666306, 0.5229678, 0, 0.3058824, 1, 1,
0.2189903, 1.050109, -1.423059, 0, 0.2980392, 1, 1,
0.2198883, 0.4491617, 0.7628114, 0, 0.2901961, 1, 1,
0.2228817, 0.07160553, 1.035285, 0, 0.2862745, 1, 1,
0.2272754, 0.007299203, -0.4583007, 0, 0.2784314, 1, 1,
0.2282553, -0.4439732, 3.91373, 0, 0.2745098, 1, 1,
0.2290585, 0.8801126, 1.515395, 0, 0.2666667, 1, 1,
0.2305588, -0.04678797, 1.314122, 0, 0.2627451, 1, 1,
0.2308677, 1.113672, 0.9668625, 0, 0.254902, 1, 1,
0.2322385, 1.238331, 0.8177152, 0, 0.2509804, 1, 1,
0.2327241, 1.310701, 0.6151319, 0, 0.2431373, 1, 1,
0.2365567, 0.972598, 2.299539, 0, 0.2392157, 1, 1,
0.2424919, -0.9715725, 2.308179, 0, 0.2313726, 1, 1,
0.2468977, 0.04305723, 2.764738, 0, 0.227451, 1, 1,
0.2473927, -0.9854504, 2.609655, 0, 0.2196078, 1, 1,
0.249145, 0.1196325, 2.662451, 0, 0.2156863, 1, 1,
0.2502586, 0.6535172, 0.2739842, 0, 0.2078431, 1, 1,
0.2563154, -0.902723, 3.688994, 0, 0.2039216, 1, 1,
0.2645997, -0.1016635, 0.569394, 0, 0.1960784, 1, 1,
0.2650432, 0.8711553, 0.7457921, 0, 0.1882353, 1, 1,
0.2662726, -1.006624, 1.760276, 0, 0.1843137, 1, 1,
0.2664443, -0.7628711, 2.205437, 0, 0.1764706, 1, 1,
0.2707646, 0.5035836, 0.8123763, 0, 0.172549, 1, 1,
0.2730834, -0.5631243, 2.513474, 0, 0.1647059, 1, 1,
0.2763878, -0.6822596, 3.580315, 0, 0.1607843, 1, 1,
0.2782394, -0.2283707, 1.330414, 0, 0.1529412, 1, 1,
0.2812735, 0.9775004, 0.5008451, 0, 0.1490196, 1, 1,
0.2822461, -1.599057, 2.27879, 0, 0.1411765, 1, 1,
0.2829729, -0.6566516, 3.526074, 0, 0.1372549, 1, 1,
0.2847423, -0.2359376, 0.9680916, 0, 0.1294118, 1, 1,
0.2870033, -0.9541463, 2.436328, 0, 0.1254902, 1, 1,
0.2902281, -1.651895, 1.658538, 0, 0.1176471, 1, 1,
0.2954677, 1.907732, 0.8942799, 0, 0.1137255, 1, 1,
0.2986578, -0.2807984, 4.163027, 0, 0.1058824, 1, 1,
0.2990737, -2.258929, 0.6710383, 0, 0.09803922, 1, 1,
0.2996611, 0.6926978, -0.3430681, 0, 0.09411765, 1, 1,
0.3039369, 0.2427877, 0.2314539, 0, 0.08627451, 1, 1,
0.30873, -0.9961598, 4.086143, 0, 0.08235294, 1, 1,
0.3233968, 0.1930923, 1.73891, 0, 0.07450981, 1, 1,
0.323968, 1.417596, -0.4441225, 0, 0.07058824, 1, 1,
0.324322, -0.5717269, 1.897058, 0, 0.0627451, 1, 1,
0.325913, -0.1565139, 2.469864, 0, 0.05882353, 1, 1,
0.3271216, -0.02359274, 0.7538924, 0, 0.05098039, 1, 1,
0.3317625, -0.836868, 2.569525, 0, 0.04705882, 1, 1,
0.3355675, 0.2030779, 1.20929, 0, 0.03921569, 1, 1,
0.3479722, 1.642902, 0.1608046, 0, 0.03529412, 1, 1,
0.3483641, 1.76675, 0.8799146, 0, 0.02745098, 1, 1,
0.3486681, 0.6211095, 2.787651, 0, 0.02352941, 1, 1,
0.3540663, 0.3935672, 1.088768, 0, 0.01568628, 1, 1,
0.3548035, -0.08350573, 0.7312403, 0, 0.01176471, 1, 1,
0.3555454, -1.064558, 2.459052, 0, 0.003921569, 1, 1,
0.3630252, 0.7325984, -0.8958246, 0.003921569, 0, 1, 1,
0.3641745, 0.05384478, 1.870395, 0.007843138, 0, 1, 1,
0.3698434, -0.1622931, 2.542518, 0.01568628, 0, 1, 1,
0.3701427, 0.9837378, -0.6024237, 0.01960784, 0, 1, 1,
0.3728682, 0.009076248, 0.6371679, 0.02745098, 0, 1, 1,
0.3733409, -0.6603521, 1.167637, 0.03137255, 0, 1, 1,
0.3757859, 0.03857176, 1.536689, 0.03921569, 0, 1, 1,
0.3795531, -0.4894851, 3.927682, 0.04313726, 0, 1, 1,
0.3797522, -0.392967, 2.976414, 0.05098039, 0, 1, 1,
0.3830345, 1.152805, -0.08378839, 0.05490196, 0, 1, 1,
0.3857069, -1.110618, 1.523195, 0.0627451, 0, 1, 1,
0.3861359, -2.151073, 3.570563, 0.06666667, 0, 1, 1,
0.3869338, 0.7680133, 0.3847029, 0.07450981, 0, 1, 1,
0.3881839, 1.716356, 1.444491, 0.07843138, 0, 1, 1,
0.3903041, -0.9970838, 1.372399, 0.08627451, 0, 1, 1,
0.3941617, -0.8946549, 4.282649, 0.09019608, 0, 1, 1,
0.3959247, 0.3007618, 1.826132, 0.09803922, 0, 1, 1,
0.3960038, -0.8042343, 3.424071, 0.1058824, 0, 1, 1,
0.3961418, -0.3731559, 1.083833, 0.1098039, 0, 1, 1,
0.3967711, 0.4327979, -0.8969352, 0.1176471, 0, 1, 1,
0.3975107, 1.566257, -0.2848552, 0.1215686, 0, 1, 1,
0.400593, 1.485389, 0.6085936, 0.1294118, 0, 1, 1,
0.4014485, 1.220303, 1.42126, 0.1333333, 0, 1, 1,
0.4019841, -0.09218142, 1.887786, 0.1411765, 0, 1, 1,
0.4038991, -0.622042, 4.054636, 0.145098, 0, 1, 1,
0.4046534, -0.4198589, 3.057129, 0.1529412, 0, 1, 1,
0.4057689, 0.5398065, -0.5215139, 0.1568628, 0, 1, 1,
0.4108758, -2.081102, 2.473753, 0.1647059, 0, 1, 1,
0.412669, -1.292987, 4.495757, 0.1686275, 0, 1, 1,
0.4167235, 0.05785764, 3.34462, 0.1764706, 0, 1, 1,
0.4169901, -0.7234045, 1.392742, 0.1803922, 0, 1, 1,
0.4201571, -2.207298, 2.506481, 0.1882353, 0, 1, 1,
0.4256878, 0.4204485, 1.149315, 0.1921569, 0, 1, 1,
0.4259866, -0.4017266, 2.298456, 0.2, 0, 1, 1,
0.4295637, 1.075845, 1.953762, 0.2078431, 0, 1, 1,
0.4301164, -0.1614955, 0.1706333, 0.2117647, 0, 1, 1,
0.4306639, -0.7838901, 3.586047, 0.2196078, 0, 1, 1,
0.4326571, -2.953432, 2.182538, 0.2235294, 0, 1, 1,
0.4347093, 1.347569, -0.3610318, 0.2313726, 0, 1, 1,
0.4347268, -0.1395756, 1.197389, 0.2352941, 0, 1, 1,
0.4386828, -0.07252019, 2.742413, 0.2431373, 0, 1, 1,
0.4470818, -0.4837084, 2.699058, 0.2470588, 0, 1, 1,
0.4517819, -1.650728, 3.374922, 0.254902, 0, 1, 1,
0.4563246, -0.2595218, 2.689228, 0.2588235, 0, 1, 1,
0.4619242, 0.6237047, -0.1001587, 0.2666667, 0, 1, 1,
0.462699, -0.5200512, 1.168579, 0.2705882, 0, 1, 1,
0.4646655, -1.205111, 4.132533, 0.2784314, 0, 1, 1,
0.4746053, -1.687324, 2.382041, 0.282353, 0, 1, 1,
0.4746545, 1.11402, -0.1578244, 0.2901961, 0, 1, 1,
0.4748663, -0.0873537, 1.97517, 0.2941177, 0, 1, 1,
0.4827033, 0.3180113, 2.429111, 0.3019608, 0, 1, 1,
0.4849719, 0.2752883, 1.453445, 0.3098039, 0, 1, 1,
0.4925658, 0.2305896, 1.218375, 0.3137255, 0, 1, 1,
0.5038505, -1.184047, 2.124812, 0.3215686, 0, 1, 1,
0.5046355, -2.084983, 1.472454, 0.3254902, 0, 1, 1,
0.5074677, -0.1221725, 1.987904, 0.3333333, 0, 1, 1,
0.5084469, -0.5321755, 1.632821, 0.3372549, 0, 1, 1,
0.51654, -0.09211811, 0.50895, 0.345098, 0, 1, 1,
0.5189199, 0.7702553, 0.5972263, 0.3490196, 0, 1, 1,
0.5252942, 0.2925876, 1.899743, 0.3568628, 0, 1, 1,
0.525941, 2.041066, 2.367592, 0.3607843, 0, 1, 1,
0.5261219, -0.6700228, 2.20819, 0.3686275, 0, 1, 1,
0.5274104, -1.553561, 2.750309, 0.372549, 0, 1, 1,
0.5275608, 0.3155004, 2.303152, 0.3803922, 0, 1, 1,
0.531653, -0.4733805, 2.951234, 0.3843137, 0, 1, 1,
0.5368883, 1.644396, -0.1085647, 0.3921569, 0, 1, 1,
0.538988, -2.13694, 3.810832, 0.3960784, 0, 1, 1,
0.5433276, 1.148257, 1.185266, 0.4039216, 0, 1, 1,
0.5496992, 0.3568439, 1.838658, 0.4117647, 0, 1, 1,
0.5507607, -0.02107104, 1.114109, 0.4156863, 0, 1, 1,
0.5518737, -0.5429429, 2.298767, 0.4235294, 0, 1, 1,
0.5532609, -3.033174, 3.992089, 0.427451, 0, 1, 1,
0.5535212, 1.409789, 1.238434, 0.4352941, 0, 1, 1,
0.5537458, 0.06301463, 2.849244, 0.4392157, 0, 1, 1,
0.5554727, -0.9250885, 1.66817, 0.4470588, 0, 1, 1,
0.5587173, 1.232287, 0.8607073, 0.4509804, 0, 1, 1,
0.5606831, 1.008307, 0.4421093, 0.4588235, 0, 1, 1,
0.5696476, 2.664934, 1.318715, 0.4627451, 0, 1, 1,
0.5705871, -0.4394516, 2.147717, 0.4705882, 0, 1, 1,
0.5723459, -0.4142322, 3.532774, 0.4745098, 0, 1, 1,
0.5741078, -0.5368469, 3.594722, 0.4823529, 0, 1, 1,
0.5843361, -0.4156209, 2.932946, 0.4862745, 0, 1, 1,
0.5876599, 0.4971306, 2.840301, 0.4941176, 0, 1, 1,
0.5976706, 1.349086, 0.3449038, 0.5019608, 0, 1, 1,
0.6053458, 0.1297682, 0.8684334, 0.5058824, 0, 1, 1,
0.6138268, 1.296038, 0.7412173, 0.5137255, 0, 1, 1,
0.6176952, 0.9737304, 2.026771, 0.5176471, 0, 1, 1,
0.6189848, -1.728009, 3.099221, 0.5254902, 0, 1, 1,
0.6235548, 1.440207, 0.7946084, 0.5294118, 0, 1, 1,
0.6246275, 0.7761163, 1.160659, 0.5372549, 0, 1, 1,
0.6271108, -0.6578001, 1.949993, 0.5411765, 0, 1, 1,
0.633196, 1.233181, -0.1095816, 0.5490196, 0, 1, 1,
0.6367567, -0.8469004, 3.613838, 0.5529412, 0, 1, 1,
0.6408484, -0.3753595, 3.661285, 0.5607843, 0, 1, 1,
0.6422375, -1.103849, 2.697768, 0.5647059, 0, 1, 1,
0.6445938, -0.264008, -0.3692746, 0.572549, 0, 1, 1,
0.6451335, 0.5786279, 2.971944, 0.5764706, 0, 1, 1,
0.6491242, -0.133153, 1.074193, 0.5843138, 0, 1, 1,
0.651244, 0.3981413, 1.879494, 0.5882353, 0, 1, 1,
0.6537836, -0.4905851, 1.713439, 0.5960785, 0, 1, 1,
0.654521, -0.07877547, 1.242116, 0.6039216, 0, 1, 1,
0.6557826, 0.3017569, 1.505933, 0.6078432, 0, 1, 1,
0.6648476, 0.1171312, 1.136588, 0.6156863, 0, 1, 1,
0.6655868, -0.0547945, 2.228214, 0.6196079, 0, 1, 1,
0.6658818, -0.2633553, 1.271448, 0.627451, 0, 1, 1,
0.6659191, 0.9061974, -0.03922231, 0.6313726, 0, 1, 1,
0.6672793, -0.0108409, 1.646613, 0.6392157, 0, 1, 1,
0.6688861, 0.662871, -0.6748495, 0.6431373, 0, 1, 1,
0.6695434, -0.08242851, 0.9970641, 0.6509804, 0, 1, 1,
0.6718905, -0.646143, 1.980736, 0.654902, 0, 1, 1,
0.6723018, -0.245336, 1.668795, 0.6627451, 0, 1, 1,
0.676334, -1.447884, 2.608301, 0.6666667, 0, 1, 1,
0.6804335, 0.7521566, -0.04429346, 0.6745098, 0, 1, 1,
0.6829444, 1.650067, -0.5757526, 0.6784314, 0, 1, 1,
0.6882553, 0.7125412, -0.1556307, 0.6862745, 0, 1, 1,
0.6887836, 0.2422408, 1.324705, 0.6901961, 0, 1, 1,
0.6909809, -1.123006, 2.968029, 0.6980392, 0, 1, 1,
0.6916161, 0.1446804, 0.5456313, 0.7058824, 0, 1, 1,
0.7011429, -0.3630092, 0.1057174, 0.7098039, 0, 1, 1,
0.7022517, -0.4960464, 2.544618, 0.7176471, 0, 1, 1,
0.7084343, 1.171278, 1.166303, 0.7215686, 0, 1, 1,
0.7088688, 1.248523, 1.218285, 0.7294118, 0, 1, 1,
0.7202167, 0.5965697, 1.150304, 0.7333333, 0, 1, 1,
0.72502, 2.452172, 0.3070884, 0.7411765, 0, 1, 1,
0.7265193, 0.8613436, 1.13389, 0.7450981, 0, 1, 1,
0.7286588, 0.2250446, 2.694464, 0.7529412, 0, 1, 1,
0.7315593, -1.9618, 3.989901, 0.7568628, 0, 1, 1,
0.7343131, -0.9375605, 1.868972, 0.7647059, 0, 1, 1,
0.7391487, -0.2051046, 2.545994, 0.7686275, 0, 1, 1,
0.7396074, -0.4876648, 0.03110829, 0.7764706, 0, 1, 1,
0.7452979, 0.2259942, 0.09535551, 0.7803922, 0, 1, 1,
0.7477916, 1.119536, 1.039982, 0.7882353, 0, 1, 1,
0.7541232, 0.6280332, 0.9818134, 0.7921569, 0, 1, 1,
0.7561761, -1.212678, 1.242999, 0.8, 0, 1, 1,
0.7687837, 0.3221665, -0.3732948, 0.8078431, 0, 1, 1,
0.7688804, -1.462465, 0.5200486, 0.8117647, 0, 1, 1,
0.7692633, -1.623456, 2.267895, 0.8196079, 0, 1, 1,
0.7728008, 1.40589, 0.5879835, 0.8235294, 0, 1, 1,
0.7756483, 1.017609, 0.2736405, 0.8313726, 0, 1, 1,
0.7816548, 2.58639, -0.6371264, 0.8352941, 0, 1, 1,
0.7832878, -0.5692996, 3.874607, 0.8431373, 0, 1, 1,
0.7968779, -0.5567181, 2.848186, 0.8470588, 0, 1, 1,
0.8034661, 1.195154, 1.384955, 0.854902, 0, 1, 1,
0.8126584, 1.03573, 2.556919, 0.8588235, 0, 1, 1,
0.8130206, 0.1284691, 1.195593, 0.8666667, 0, 1, 1,
0.8178667, 0.4885399, 0.5293167, 0.8705882, 0, 1, 1,
0.8207753, 0.7492622, 1.291947, 0.8784314, 0, 1, 1,
0.8230693, 2.065535, 1.515513, 0.8823529, 0, 1, 1,
0.8236421, 0.07325535, -0.6900246, 0.8901961, 0, 1, 1,
0.8317382, 0.8088682, 0.3737027, 0.8941177, 0, 1, 1,
0.8318387, 0.5341045, 2.219988, 0.9019608, 0, 1, 1,
0.8333101, 1.154158, 0.7757298, 0.9098039, 0, 1, 1,
0.8333993, 1.383604, 1.352754, 0.9137255, 0, 1, 1,
0.835124, -0.323661, 2.05541, 0.9215686, 0, 1, 1,
0.8426681, 1.000442, 0.270403, 0.9254902, 0, 1, 1,
0.8440385, -0.4103762, 1.286295, 0.9333333, 0, 1, 1,
0.8444015, 0.8604259, 1.458843, 0.9372549, 0, 1, 1,
0.845109, -1.687772, 3.06379, 0.945098, 0, 1, 1,
0.8524197, 0.0008472751, 1.283077, 0.9490196, 0, 1, 1,
0.8571005, -0.3064325, 2.645317, 0.9568627, 0, 1, 1,
0.8585054, -0.3832366, 3.367439, 0.9607843, 0, 1, 1,
0.8597609, 0.1209925, 0.1590034, 0.9686275, 0, 1, 1,
0.8616276, 0.100757, 2.016202, 0.972549, 0, 1, 1,
0.8628269, 0.6263129, 0.3732916, 0.9803922, 0, 1, 1,
0.8637749, 0.6685589, 0.1535141, 0.9843137, 0, 1, 1,
0.8656771, -0.7097396, 0.108849, 0.9921569, 0, 1, 1,
0.8668352, -0.7324799, 2.360417, 0.9960784, 0, 1, 1,
0.8688309, -1.4187, 1.425808, 1, 0, 0.9960784, 1,
0.8727272, 1.039369, 0.2973138, 1, 0, 0.9882353, 1,
0.8727295, -1.311596, 2.743983, 1, 0, 0.9843137, 1,
0.8798036, 0.01506623, 3.849728, 1, 0, 0.9764706, 1,
0.8889651, 1.603056, -0.2299416, 1, 0, 0.972549, 1,
0.8937227, 0.9389874, 0.4971099, 1, 0, 0.9647059, 1,
0.8939934, 1.385738, 0.3040322, 1, 0, 0.9607843, 1,
0.8992639, 0.5087448, 2.125427, 1, 0, 0.9529412, 1,
0.910356, -0.5817024, 1.678701, 1, 0, 0.9490196, 1,
0.9132285, 0.5166091, 0.4641163, 1, 0, 0.9411765, 1,
0.927008, 1.222833, -0.09824099, 1, 0, 0.9372549, 1,
0.939119, -0.3256308, 1.967745, 1, 0, 0.9294118, 1,
0.9402395, 0.003709971, 3.243908, 1, 0, 0.9254902, 1,
0.9413847, -1.265343, 3.371237, 1, 0, 0.9176471, 1,
0.9467349, -1.298347, 2.463032, 1, 0, 0.9137255, 1,
0.9471186, 1.249402, 0.03217449, 1, 0, 0.9058824, 1,
0.9510832, 0.6957127, -0.6361963, 1, 0, 0.9019608, 1,
0.9547963, -1.984668, 2.796298, 1, 0, 0.8941177, 1,
0.9735968, -0.3589236, 2.568544, 1, 0, 0.8862745, 1,
0.9781694, 0.4282369, 1.090197, 1, 0, 0.8823529, 1,
0.9816936, 0.9106268, 0.8507288, 1, 0, 0.8745098, 1,
0.9826973, -0.2435987, 2.009807, 1, 0, 0.8705882, 1,
0.9921053, 0.6777428, 0.120048, 1, 0, 0.8627451, 1,
1.000662, -0.3144334, 1.278162, 1, 0, 0.8588235, 1,
1.001485, 0.6885232, 2.192139, 1, 0, 0.8509804, 1,
1.002323, -0.9293495, 1.091397, 1, 0, 0.8470588, 1,
1.005397, 1.876424, 1.019332, 1, 0, 0.8392157, 1,
1.015058, -0.1643997, 1.841969, 1, 0, 0.8352941, 1,
1.015925, -0.4285991, 1.972337, 1, 0, 0.827451, 1,
1.027539, 0.1871683, 1.842019, 1, 0, 0.8235294, 1,
1.030868, -1.158125, 1.201759, 1, 0, 0.8156863, 1,
1.033408, -1.631121, 1.539883, 1, 0, 0.8117647, 1,
1.033465, -0.1644385, 0.6890244, 1, 0, 0.8039216, 1,
1.038292, -1.085399, 3.013818, 1, 0, 0.7960784, 1,
1.042875, 0.3331845, 0.6923669, 1, 0, 0.7921569, 1,
1.055917, -0.2425018, 1.094835, 1, 0, 0.7843137, 1,
1.061185, -0.4742094, 1.813576, 1, 0, 0.7803922, 1,
1.063813, -0.4997729, 2.048593, 1, 0, 0.772549, 1,
1.066507, -1.234374, 1.392327, 1, 0, 0.7686275, 1,
1.06654, -0.7986797, 2.131304, 1, 0, 0.7607843, 1,
1.067939, -0.474749, 0.7761438, 1, 0, 0.7568628, 1,
1.070318, -2.007981, 2.726562, 1, 0, 0.7490196, 1,
1.07192, 0.8523137, -0.03574406, 1, 0, 0.7450981, 1,
1.074871, 0.8560831, 0.8500476, 1, 0, 0.7372549, 1,
1.079782, -0.817057, 3.168993, 1, 0, 0.7333333, 1,
1.080969, -0.1779026, 0.2633701, 1, 0, 0.7254902, 1,
1.081034, 0.4015377, 0.6027738, 1, 0, 0.7215686, 1,
1.083577, 0.2524587, 2.285289, 1, 0, 0.7137255, 1,
1.093949, 0.985318, -1.132833, 1, 0, 0.7098039, 1,
1.094404, -1.301444, 2.223115, 1, 0, 0.7019608, 1,
1.112986, -0.6189992, 3.417305, 1, 0, 0.6941177, 1,
1.116072, 0.1984518, 1.176946, 1, 0, 0.6901961, 1,
1.118962, 1.225586, -0.6417853, 1, 0, 0.682353, 1,
1.127736, 0.003473211, 0.6531098, 1, 0, 0.6784314, 1,
1.133815, 0.1174853, -0.2100163, 1, 0, 0.6705883, 1,
1.140141, -0.5481564, 2.696084, 1, 0, 0.6666667, 1,
1.141394, 0.2311905, 1.872063, 1, 0, 0.6588235, 1,
1.148182, 0.8553515, 2.020939, 1, 0, 0.654902, 1,
1.149831, 0.3471636, 1.64849, 1, 0, 0.6470588, 1,
1.159253, 1.839171, 0.3495839, 1, 0, 0.6431373, 1,
1.160175, -1.422401, 3.12892, 1, 0, 0.6352941, 1,
1.163665, 0.3626683, 0.9134885, 1, 0, 0.6313726, 1,
1.17892, -0.9239237, 2.426682, 1, 0, 0.6235294, 1,
1.200053, -0.5664697, 1.0624, 1, 0, 0.6196079, 1,
1.209024, -0.3309285, 2.51806, 1, 0, 0.6117647, 1,
1.21274, 0.2225613, 0.1324553, 1, 0, 0.6078432, 1,
1.223069, -2.082751, 1.670476, 1, 0, 0.6, 1,
1.226263, 0.8528966, 1.601654, 1, 0, 0.5921569, 1,
1.226391, -0.2985966, 1.4622, 1, 0, 0.5882353, 1,
1.231622, 1.325819, 0.6261901, 1, 0, 0.5803922, 1,
1.235787, -0.3247696, 0.6826493, 1, 0, 0.5764706, 1,
1.242403, 1.444958, 1.064462, 1, 0, 0.5686275, 1,
1.250844, 0.5245838, 1.195317, 1, 0, 0.5647059, 1,
1.251219, 1.252004, -0.1368944, 1, 0, 0.5568628, 1,
1.25812, -1.586461, 1.734662, 1, 0, 0.5529412, 1,
1.263148, -0.5948786, 3.034195, 1, 0, 0.5450981, 1,
1.27741, -0.03975796, 1.486511, 1, 0, 0.5411765, 1,
1.279543, -0.7967939, 1.81322, 1, 0, 0.5333334, 1,
1.283668, -0.8187658, 2.345927, 1, 0, 0.5294118, 1,
1.285206, 2.034088, 0.5298973, 1, 0, 0.5215687, 1,
1.290739, 1.865393, 0.5166075, 1, 0, 0.5176471, 1,
1.312754, -0.7804629, 2.972827, 1, 0, 0.509804, 1,
1.321392, 0.8235201, 2.944764, 1, 0, 0.5058824, 1,
1.325073, 0.6576818, 3.207782, 1, 0, 0.4980392, 1,
1.332655, -0.7307073, 2.589478, 1, 0, 0.4901961, 1,
1.343893, 0.7075571, 0.8802381, 1, 0, 0.4862745, 1,
1.346661, 1.542319, 0.2245819, 1, 0, 0.4784314, 1,
1.368428, 0.2177625, -0.07724132, 1, 0, 0.4745098, 1,
1.372831, -0.07779319, 1.313686, 1, 0, 0.4666667, 1,
1.377503, 1.223431, 2.698789, 1, 0, 0.4627451, 1,
1.379441, -2.001205, 1.651771, 1, 0, 0.454902, 1,
1.381145, 1.766125, 0.2780488, 1, 0, 0.4509804, 1,
1.405237, 1.514147, 1.386066, 1, 0, 0.4431373, 1,
1.406267, 1.075073, -0.8579131, 1, 0, 0.4392157, 1,
1.407344, 1.054445, 0.549894, 1, 0, 0.4313726, 1,
1.410178, 0.6487448, 2.102915, 1, 0, 0.427451, 1,
1.418939, 0.4060351, 0.3082532, 1, 0, 0.4196078, 1,
1.457125, -0.4736627, 1.257517, 1, 0, 0.4156863, 1,
1.459374, 0.1309001, 1.088261, 1, 0, 0.4078431, 1,
1.460608, 0.07404767, 1.700398, 1, 0, 0.4039216, 1,
1.466735, -1.56924, 2.303516, 1, 0, 0.3960784, 1,
1.487714, -0.1687899, 1.746173, 1, 0, 0.3882353, 1,
1.501662, 1.054933, -0.6693788, 1, 0, 0.3843137, 1,
1.503433, 0.8178623, -0.2611139, 1, 0, 0.3764706, 1,
1.508434, 1.451918, 2.133272, 1, 0, 0.372549, 1,
1.522471, -1.38546, 1.49335, 1, 0, 0.3647059, 1,
1.527032, 0.5278007, 0.79706, 1, 0, 0.3607843, 1,
1.536751, -1.393781, 2.763993, 1, 0, 0.3529412, 1,
1.541368, 0.4560805, 1.459516, 1, 0, 0.3490196, 1,
1.552576, -0.4616177, 0.7503349, 1, 0, 0.3411765, 1,
1.578574, -0.1827842, 3.050325, 1, 0, 0.3372549, 1,
1.592976, 0.1547903, 0.2940376, 1, 0, 0.3294118, 1,
1.606161, 1.843636, 2.269915, 1, 0, 0.3254902, 1,
1.611171, -1.914552, 2.302986, 1, 0, 0.3176471, 1,
1.617853, 1.436914, 0.1557562, 1, 0, 0.3137255, 1,
1.661295, 0.04592399, 2.516023, 1, 0, 0.3058824, 1,
1.661607, 0.1222244, 0.7803635, 1, 0, 0.2980392, 1,
1.669117, -0.8579325, 3.330482, 1, 0, 0.2941177, 1,
1.694109, -1.412129, 1.832586, 1, 0, 0.2862745, 1,
1.700513, 0.1697895, 1.961315, 1, 0, 0.282353, 1,
1.71261, -0.6746224, 1.673009, 1, 0, 0.2745098, 1,
1.718389, -0.1472359, 2.504839, 1, 0, 0.2705882, 1,
1.719205, 1.042356, 0.9265497, 1, 0, 0.2627451, 1,
1.720922, 0.3509383, 2.586612, 1, 0, 0.2588235, 1,
1.749292, 0.3908619, 0.7127276, 1, 0, 0.2509804, 1,
1.752687, -0.8648814, 4.795063, 1, 0, 0.2470588, 1,
1.764221, -1.383898, 1.933608, 1, 0, 0.2392157, 1,
1.767319, -0.1924558, 0.1599347, 1, 0, 0.2352941, 1,
1.773533, -0.6370167, 4.422252, 1, 0, 0.227451, 1,
1.791637, 1.133726, -0.3951764, 1, 0, 0.2235294, 1,
1.828298, -0.3913209, 0.9421087, 1, 0, 0.2156863, 1,
1.841088, -1.634716, 2.661646, 1, 0, 0.2117647, 1,
1.854645, 0.1984567, 1.419839, 1, 0, 0.2039216, 1,
1.87262, 1.544845, -0.2991299, 1, 0, 0.1960784, 1,
1.874411, -0.0009547774, 3.248146, 1, 0, 0.1921569, 1,
1.883639, 0.9332448, 1.229267, 1, 0, 0.1843137, 1,
1.884193, -0.3779666, 1.576511, 1, 0, 0.1803922, 1,
1.893762, 0.9613586, 2.083462, 1, 0, 0.172549, 1,
1.894249, -0.05843209, 1.688689, 1, 0, 0.1686275, 1,
1.901915, -1.392464, 2.079046, 1, 0, 0.1607843, 1,
1.922389, -0.0756333, 2.425148, 1, 0, 0.1568628, 1,
1.930096, -0.8463078, 1.593391, 1, 0, 0.1490196, 1,
1.935338, -0.7369189, 2.285595, 1, 0, 0.145098, 1,
1.961496, -1.379734, 3.09612, 1, 0, 0.1372549, 1,
1.984432, 0.4180931, 1.429534, 1, 0, 0.1333333, 1,
1.987455, -0.4610895, 0.2176099, 1, 0, 0.1254902, 1,
1.989597, -0.8329568, 1.346704, 1, 0, 0.1215686, 1,
1.994799, -0.7785973, 3.057882, 1, 0, 0.1137255, 1,
1.999563, -1.086007, 1.863046, 1, 0, 0.1098039, 1,
2.006729, -0.5935096, 1.769989, 1, 0, 0.1019608, 1,
2.032314, -1.736842, 3.65418, 1, 0, 0.09411765, 1,
2.08655, -0.8261232, 1.758125, 1, 0, 0.09019608, 1,
2.093955, 1.380532, 1.725049, 1, 0, 0.08235294, 1,
2.120116, 1.098193, 0.4706495, 1, 0, 0.07843138, 1,
2.133026, 0.108355, 1.138386, 1, 0, 0.07058824, 1,
2.277899, 1.284874, 0.3986934, 1, 0, 0.06666667, 1,
2.278643, -0.751229, 2.550863, 1, 0, 0.05882353, 1,
2.301651, 1.137535, -0.2850895, 1, 0, 0.05490196, 1,
2.308996, 0.5999969, 0.8655251, 1, 0, 0.04705882, 1,
2.315312, -0.3749165, 3.687515, 1, 0, 0.04313726, 1,
2.389554, -0.4745826, 2.717184, 1, 0, 0.03529412, 1,
2.398432, 0.9849166, 1.375171, 1, 0, 0.03137255, 1,
2.614157, -0.8462679, 2.476418, 1, 0, 0.02352941, 1,
2.691841, 0.5767761, 1.261996, 1, 0, 0.01960784, 1,
3.028262, -1.037691, 2.335735, 1, 0, 0.01176471, 1,
3.030666, 0.5113075, 0.8766142, 1, 0, 0.007843138, 1
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
-0.5272235, -4.315804, -8.437251, 0, -0.5, 0.5, 0.5,
-0.5272235, -4.315804, -8.437251, 1, -0.5, 0.5, 0.5,
-0.5272235, -4.315804, -8.437251, 1, 1.5, 0.5, 0.5,
-0.5272235, -4.315804, -8.437251, 0, 1.5, 0.5, 0.5
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
-5.291238, 0.1857002, -8.437251, 0, -0.5, 0.5, 0.5,
-5.291238, 0.1857002, -8.437251, 1, -0.5, 0.5, 0.5,
-5.291238, 0.1857002, -8.437251, 1, 1.5, 0.5, 0.5,
-5.291238, 0.1857002, -8.437251, 0, 1.5, 0.5, 0.5
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
-5.291238, -4.315804, -0.8621895, 0, -0.5, 0.5, 0.5,
-5.291238, -4.315804, -0.8621895, 1, -0.5, 0.5, 0.5,
-5.291238, -4.315804, -0.8621895, 1, 1.5, 0.5, 0.5,
-5.291238, -4.315804, -0.8621895, 0, 1.5, 0.5, 0.5
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
-4, -3.276996, -6.68916,
2, -3.276996, -6.68916,
-4, -3.276996, -6.68916,
-4, -3.45013, -6.980508,
-2, -3.276996, -6.68916,
-2, -3.45013, -6.980508,
0, -3.276996, -6.68916,
0, -3.45013, -6.980508,
2, -3.276996, -6.68916,
2, -3.45013, -6.980508
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
-4, -3.7964, -7.563205, 0, -0.5, 0.5, 0.5,
-4, -3.7964, -7.563205, 1, -0.5, 0.5, 0.5,
-4, -3.7964, -7.563205, 1, 1.5, 0.5, 0.5,
-4, -3.7964, -7.563205, 0, 1.5, 0.5, 0.5,
-2, -3.7964, -7.563205, 0, -0.5, 0.5, 0.5,
-2, -3.7964, -7.563205, 1, -0.5, 0.5, 0.5,
-2, -3.7964, -7.563205, 1, 1.5, 0.5, 0.5,
-2, -3.7964, -7.563205, 0, 1.5, 0.5, 0.5,
0, -3.7964, -7.563205, 0, -0.5, 0.5, 0.5,
0, -3.7964, -7.563205, 1, -0.5, 0.5, 0.5,
0, -3.7964, -7.563205, 1, 1.5, 0.5, 0.5,
0, -3.7964, -7.563205, 0, 1.5, 0.5, 0.5,
2, -3.7964, -7.563205, 0, -0.5, 0.5, 0.5,
2, -3.7964, -7.563205, 1, -0.5, 0.5, 0.5,
2, -3.7964, -7.563205, 1, 1.5, 0.5, 0.5,
2, -3.7964, -7.563205, 0, 1.5, 0.5, 0.5
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
-4.19185, -3, -6.68916,
-4.19185, 3, -6.68916,
-4.19185, -3, -6.68916,
-4.375081, -3, -6.980508,
-4.19185, -2, -6.68916,
-4.375081, -2, -6.980508,
-4.19185, -1, -6.68916,
-4.375081, -1, -6.980508,
-4.19185, 0, -6.68916,
-4.375081, 0, -6.980508,
-4.19185, 1, -6.68916,
-4.375081, 1, -6.980508,
-4.19185, 2, -6.68916,
-4.375081, 2, -6.980508,
-4.19185, 3, -6.68916,
-4.375081, 3, -6.980508
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
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
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
-4.741544, -3, -7.563205, 0, -0.5, 0.5, 0.5,
-4.741544, -3, -7.563205, 1, -0.5, 0.5, 0.5,
-4.741544, -3, -7.563205, 1, 1.5, 0.5, 0.5,
-4.741544, -3, -7.563205, 0, 1.5, 0.5, 0.5,
-4.741544, -2, -7.563205, 0, -0.5, 0.5, 0.5,
-4.741544, -2, -7.563205, 1, -0.5, 0.5, 0.5,
-4.741544, -2, -7.563205, 1, 1.5, 0.5, 0.5,
-4.741544, -2, -7.563205, 0, 1.5, 0.5, 0.5,
-4.741544, -1, -7.563205, 0, -0.5, 0.5, 0.5,
-4.741544, -1, -7.563205, 1, -0.5, 0.5, 0.5,
-4.741544, -1, -7.563205, 1, 1.5, 0.5, 0.5,
-4.741544, -1, -7.563205, 0, 1.5, 0.5, 0.5,
-4.741544, 0, -7.563205, 0, -0.5, 0.5, 0.5,
-4.741544, 0, -7.563205, 1, -0.5, 0.5, 0.5,
-4.741544, 0, -7.563205, 1, 1.5, 0.5, 0.5,
-4.741544, 0, -7.563205, 0, 1.5, 0.5, 0.5,
-4.741544, 1, -7.563205, 0, -0.5, 0.5, 0.5,
-4.741544, 1, -7.563205, 1, -0.5, 0.5, 0.5,
-4.741544, 1, -7.563205, 1, 1.5, 0.5, 0.5,
-4.741544, 1, -7.563205, 0, 1.5, 0.5, 0.5,
-4.741544, 2, -7.563205, 0, -0.5, 0.5, 0.5,
-4.741544, 2, -7.563205, 1, -0.5, 0.5, 0.5,
-4.741544, 2, -7.563205, 1, 1.5, 0.5, 0.5,
-4.741544, 2, -7.563205, 0, 1.5, 0.5, 0.5,
-4.741544, 3, -7.563205, 0, -0.5, 0.5, 0.5,
-4.741544, 3, -7.563205, 1, -0.5, 0.5, 0.5,
-4.741544, 3, -7.563205, 1, 1.5, 0.5, 0.5,
-4.741544, 3, -7.563205, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
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
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
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
-4.19185, -3.276996, -6,
-4.19185, -3.276996, 4,
-4.19185, -3.276996, -6,
-4.375081, -3.45013, -6,
-4.19185, -3.276996, -4,
-4.375081, -3.45013, -4,
-4.19185, -3.276996, -2,
-4.375081, -3.45013, -2,
-4.19185, -3.276996, 0,
-4.375081, -3.45013, 0,
-4.19185, -3.276996, 2,
-4.375081, -3.45013, 2,
-4.19185, -3.276996, 4,
-4.375081, -3.45013, 4
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
"-6",
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
-4.741544, -3.7964, -6, 0, -0.5, 0.5, 0.5,
-4.741544, -3.7964, -6, 1, -0.5, 0.5, 0.5,
-4.741544, -3.7964, -6, 1, 1.5, 0.5, 0.5,
-4.741544, -3.7964, -6, 0, 1.5, 0.5, 0.5,
-4.741544, -3.7964, -4, 0, -0.5, 0.5, 0.5,
-4.741544, -3.7964, -4, 1, -0.5, 0.5, 0.5,
-4.741544, -3.7964, -4, 1, 1.5, 0.5, 0.5,
-4.741544, -3.7964, -4, 0, 1.5, 0.5, 0.5,
-4.741544, -3.7964, -2, 0, -0.5, 0.5, 0.5,
-4.741544, -3.7964, -2, 1, -0.5, 0.5, 0.5,
-4.741544, -3.7964, -2, 1, 1.5, 0.5, 0.5,
-4.741544, -3.7964, -2, 0, 1.5, 0.5, 0.5,
-4.741544, -3.7964, 0, 0, -0.5, 0.5, 0.5,
-4.741544, -3.7964, 0, 1, -0.5, 0.5, 0.5,
-4.741544, -3.7964, 0, 1, 1.5, 0.5, 0.5,
-4.741544, -3.7964, 0, 0, 1.5, 0.5, 0.5,
-4.741544, -3.7964, 2, 0, -0.5, 0.5, 0.5,
-4.741544, -3.7964, 2, 1, -0.5, 0.5, 0.5,
-4.741544, -3.7964, 2, 1, 1.5, 0.5, 0.5,
-4.741544, -3.7964, 2, 0, 1.5, 0.5, 0.5,
-4.741544, -3.7964, 4, 0, -0.5, 0.5, 0.5,
-4.741544, -3.7964, 4, 1, -0.5, 0.5, 0.5,
-4.741544, -3.7964, 4, 1, 1.5, 0.5, 0.5,
-4.741544, -3.7964, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
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
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
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
-4.19185, -3.276996, -6.68916,
-4.19185, 3.648396, -6.68916,
-4.19185, -3.276996, 4.964781,
-4.19185, 3.648396, 4.964781,
-4.19185, -3.276996, -6.68916,
-4.19185, -3.276996, 4.964781,
-4.19185, 3.648396, -6.68916,
-4.19185, 3.648396, 4.964781,
-4.19185, -3.276996, -6.68916,
3.137403, -3.276996, -6.68916,
-4.19185, -3.276996, 4.964781,
3.137403, -3.276996, 4.964781,
-4.19185, 3.648396, -6.68916,
3.137403, 3.648396, -6.68916,
-4.19185, 3.648396, 4.964781,
3.137403, 3.648396, 4.964781,
3.137403, -3.276996, -6.68916,
3.137403, 3.648396, -6.68916,
3.137403, -3.276996, 4.964781,
3.137403, 3.648396, 4.964781,
3.137403, -3.276996, -6.68916,
3.137403, -3.276996, 4.964781,
3.137403, 3.648396, -6.68916,
3.137403, 3.648396, 4.964781
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
var radius = 8.229078;
var distance = 36.6121;
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
mvMatrix.translate( 0.5272235, -0.1857002, 0.8621895 );
mvMatrix.scale( 1.213963, 1.284756, 0.7634705 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.6121);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
N-methyl-ethanimidam<-read.table("N-methyl-ethanimidam.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-N-methyl-ethanimidam$V2
```

```
## Error in eval(expr, envir, enclos): object 'N' not found
```

```r
y<-N-methyl-ethanimidam$V3
```

```
## Error in eval(expr, envir, enclos): object 'N' not found
```

```r
z<-N-methyl-ethanimidam$V4
```

```
## Error in eval(expr, envir, enclos): object 'N' not found
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
-4.085113, 1.238515, -0.4780933, 0, 0, 1, 1, 1,
-2.638559, 1.009462, -0.9892899, 1, 0, 0, 1, 1,
-2.537687, -1.127668, -3.478125, 1, 0, 0, 1, 1,
-2.491172, 0.3267246, 0.0791866, 1, 0, 0, 1, 1,
-2.37086, -0.8128446, -2.129146, 1, 0, 0, 1, 1,
-2.355894, 1.459248, -0.6870897, 1, 0, 0, 1, 1,
-2.34584, -1.327474, -2.937046, 0, 0, 0, 1, 1,
-2.332441, 0.2108612, -2.509051, 0, 0, 0, 1, 1,
-2.330851, -1.149034, -2.512464, 0, 0, 0, 1, 1,
-2.315578, 1.459884, -3.235738, 0, 0, 0, 1, 1,
-2.30217, -0.3757225, -1.609542, 0, 0, 0, 1, 1,
-2.275218, -0.9371303, -2.323147, 0, 0, 0, 1, 1,
-2.218739, 1.555965, 0.2813866, 0, 0, 0, 1, 1,
-2.207809, -1.051726, -3.712849, 1, 1, 1, 1, 1,
-2.196032, 0.2148341, -1.268528, 1, 1, 1, 1, 1,
-2.160277, 0.7494084, -3.645212, 1, 1, 1, 1, 1,
-2.134234, -0.134949, -2.742377, 1, 1, 1, 1, 1,
-2.132373, -0.6026338, -2.926766, 1, 1, 1, 1, 1,
-2.104855, -1.249265, -2.693312, 1, 1, 1, 1, 1,
-2.088999, 0.5633652, -2.034753, 1, 1, 1, 1, 1,
-2.08335, -0.03615797, -7.91222e-05, 1, 1, 1, 1, 1,
-2.081478, -1.648534, -2.109669, 1, 1, 1, 1, 1,
-2.075908, -0.3233885, -1.049444, 1, 1, 1, 1, 1,
-2.054311, -0.4531266, -1.850394, 1, 1, 1, 1, 1,
-2.04085, -0.07502201, 0.2309853, 1, 1, 1, 1, 1,
-2.027067, -0.5473967, -1.228778, 1, 1, 1, 1, 1,
-2.022737, -0.1590445, -0.799049, 1, 1, 1, 1, 1,
-1.984435, 0.6029764, 1.090782, 1, 1, 1, 1, 1,
-1.966896, 0.1407013, -2.196409, 0, 0, 1, 1, 1,
-1.965138, 0.7165003, -1.532214, 1, 0, 0, 1, 1,
-1.944886, -0.1352037, 0.2757238, 1, 0, 0, 1, 1,
-1.931232, 0.2347274, -0.8078066, 1, 0, 0, 1, 1,
-1.912688, -0.3147396, -0.8559059, 1, 0, 0, 1, 1,
-1.884964, -0.6467828, -2.169061, 1, 0, 0, 1, 1,
-1.843584, -1.567943, -3.226739, 0, 0, 0, 1, 1,
-1.839914, -1.592253, -0.7369221, 0, 0, 0, 1, 1,
-1.838919, -0.8331877, -1.979004, 0, 0, 0, 1, 1,
-1.835616, -0.8702936, -2.253497, 0, 0, 0, 1, 1,
-1.819235, -0.4467991, -2.966255, 0, 0, 0, 1, 1,
-1.814685, -0.427584, -1.708829, 0, 0, 0, 1, 1,
-1.806, -1.599265, -1.937891, 0, 0, 0, 1, 1,
-1.80331, -0.5190307, -2.565621, 1, 1, 1, 1, 1,
-1.798717, 0.8211496, -0.2150808, 1, 1, 1, 1, 1,
-1.792951, 0.4589652, -1.50191, 1, 1, 1, 1, 1,
-1.788267, -0.2008533, -1.281717, 1, 1, 1, 1, 1,
-1.771744, -0.009267626, -3.205832, 1, 1, 1, 1, 1,
-1.764671, -0.4114764, -1.778891, 1, 1, 1, 1, 1,
-1.753239, -0.1080577, -1.097238, 1, 1, 1, 1, 1,
-1.74997, 0.5351796, -1.549801, 1, 1, 1, 1, 1,
-1.740038, -0.4215522, -0.5536924, 1, 1, 1, 1, 1,
-1.738587, 1.254457, 0.2158956, 1, 1, 1, 1, 1,
-1.728768, 0.1522883, -0.02095406, 1, 1, 1, 1, 1,
-1.714259, -0.09295443, -2.741219, 1, 1, 1, 1, 1,
-1.710699, 0.02815478, -0.4360643, 1, 1, 1, 1, 1,
-1.7073, 0.5780402, -1.27455, 1, 1, 1, 1, 1,
-1.693437, -0.8441865, -0.4938202, 1, 1, 1, 1, 1,
-1.692634, 0.4159023, -2.883022, 0, 0, 1, 1, 1,
-1.670281, -1.318516, -0.5114984, 1, 0, 0, 1, 1,
-1.661138, -1.015283, -0.8291318, 1, 0, 0, 1, 1,
-1.657372, 0.8761499, -1.345771, 1, 0, 0, 1, 1,
-1.655479, -1.024532, -2.040218, 1, 0, 0, 1, 1,
-1.647938, -0.6143842, -2.078878, 1, 0, 0, 1, 1,
-1.63175, 0.2387668, -4.440533, 0, 0, 0, 1, 1,
-1.629694, 0.2802842, -3.041391, 0, 0, 0, 1, 1,
-1.618379, 0.1005458, -2.192746, 0, 0, 0, 1, 1,
-1.617235, 0.6676322, -0.08199515, 0, 0, 0, 1, 1,
-1.610776, 0.2282158, -2.529233, 0, 0, 0, 1, 1,
-1.60385, 0.5181047, -0.4899625, 0, 0, 0, 1, 1,
-1.598386, 0.7060024, -1.088606, 0, 0, 0, 1, 1,
-1.570398, -0.06373083, -1.271602, 1, 1, 1, 1, 1,
-1.561419, 1.292567, -0.3121253, 1, 1, 1, 1, 1,
-1.560923, -0.3923325, -3.168594, 1, 1, 1, 1, 1,
-1.558307, 0.7861046, -0.619091, 1, 1, 1, 1, 1,
-1.540526, 0.3395186, -1.041826, 1, 1, 1, 1, 1,
-1.539768, -1.285571, -2.672196, 1, 1, 1, 1, 1,
-1.536304, -0.3223633, -2.278216, 1, 1, 1, 1, 1,
-1.531331, -0.5135112, -3.106437, 1, 1, 1, 1, 1,
-1.519141, 0.679474, -1.544266, 1, 1, 1, 1, 1,
-1.517091, -1.068288, -3.01303, 1, 1, 1, 1, 1,
-1.509006, -1.352965, -2.249082, 1, 1, 1, 1, 1,
-1.508652, -0.6158653, -2.975995, 1, 1, 1, 1, 1,
-1.508096, -0.7961683, -3.194932, 1, 1, 1, 1, 1,
-1.497611, 1.138603, -0.4612574, 1, 1, 1, 1, 1,
-1.495292, -1.127305, -1.617438, 1, 1, 1, 1, 1,
-1.44674, -1.571982, -3.570514, 0, 0, 1, 1, 1,
-1.440019, -0.8060733, -0.5182428, 1, 0, 0, 1, 1,
-1.43886, 0.2436692, -1.428852, 1, 0, 0, 1, 1,
-1.432366, -0.2565637, -2.231085, 1, 0, 0, 1, 1,
-1.425658, 0.4026208, 0.3317387, 1, 0, 0, 1, 1,
-1.40862, -0.4762599, -2.4991, 1, 0, 0, 1, 1,
-1.405127, -1.019895, -3.012538, 0, 0, 0, 1, 1,
-1.404258, -0.0294446, -3.079353, 0, 0, 0, 1, 1,
-1.399652, 0.02229389, -2.65941, 0, 0, 0, 1, 1,
-1.397252, 0.3899421, -1.50648, 0, 0, 0, 1, 1,
-1.387987, -0.3204817, -2.190233, 0, 0, 0, 1, 1,
-1.384078, 0.1933885, -0.8155946, 0, 0, 0, 1, 1,
-1.379498, -0.8154711, -3.555075, 0, 0, 0, 1, 1,
-1.376031, 2.000924, -0.5931246, 1, 1, 1, 1, 1,
-1.374081, -1.600687, -1.771776, 1, 1, 1, 1, 1,
-1.373502, 0.4022543, -0.09793487, 1, 1, 1, 1, 1,
-1.372033, 0.8710241, -3.409514, 1, 1, 1, 1, 1,
-1.369332, -1.190091, -3.123291, 1, 1, 1, 1, 1,
-1.350969, -1.599005, -1.497507, 1, 1, 1, 1, 1,
-1.350311, -0.5621417, -1.507382, 1, 1, 1, 1, 1,
-1.34349, -0.1012222, -1.355226, 1, 1, 1, 1, 1,
-1.341282, -0.2374332, -2.113866, 1, 1, 1, 1, 1,
-1.335695, -0.2712343, -1.841282, 1, 1, 1, 1, 1,
-1.324327, -0.733487, -2.813593, 1, 1, 1, 1, 1,
-1.321026, -2.019431, -1.047711, 1, 1, 1, 1, 1,
-1.317854, 0.6819348, -0.8455698, 1, 1, 1, 1, 1,
-1.308716, -0.578867, -3.864252, 1, 1, 1, 1, 1,
-1.298154, -1.215944, -1.811613, 1, 1, 1, 1, 1,
-1.297722, -0.1564217, -1.554066, 0, 0, 1, 1, 1,
-1.29755, 1.029155, -2.56749, 1, 0, 0, 1, 1,
-1.287454, -0.04029816, -2.551003, 1, 0, 0, 1, 1,
-1.286858, -0.9075611, -1.661355, 1, 0, 0, 1, 1,
-1.280158, 0.373631, -1.064112, 1, 0, 0, 1, 1,
-1.266812, 0.3443834, -1.521894, 1, 0, 0, 1, 1,
-1.256842, -0.2689405, -0.3291956, 0, 0, 0, 1, 1,
-1.249262, 1.583173, -1.551948, 0, 0, 0, 1, 1,
-1.245442, 0.5216314, -1.915278, 0, 0, 0, 1, 1,
-1.243194, -0.8089702, -2.222117, 0, 0, 0, 1, 1,
-1.239978, -0.4648787, -1.932106, 0, 0, 0, 1, 1,
-1.236356, -1.941924, -1.513845, 0, 0, 0, 1, 1,
-1.230391, 0.7147645, -1.072287, 0, 0, 0, 1, 1,
-1.228465, -0.5939286, -0.9564728, 1, 1, 1, 1, 1,
-1.22376, -0.08463702, -0.9721518, 1, 1, 1, 1, 1,
-1.22076, 1.122214, -0.4206037, 1, 1, 1, 1, 1,
-1.2169, -1.044027, -2.892585, 1, 1, 1, 1, 1,
-1.214736, -1.25114, -2.225291, 1, 1, 1, 1, 1,
-1.210135, 0.4907583, -1.108526, 1, 1, 1, 1, 1,
-1.203843, -0.8050037, -0.8045881, 1, 1, 1, 1, 1,
-1.192545, 0.2586668, -1.072538, 1, 1, 1, 1, 1,
-1.191088, 0.5286972, -0.9799633, 1, 1, 1, 1, 1,
-1.184076, 0.4136865, -2.501655, 1, 1, 1, 1, 1,
-1.182661, 0.6420732, -1.754982, 1, 1, 1, 1, 1,
-1.177799, 0.3490625, -2.139864, 1, 1, 1, 1, 1,
-1.155762, 0.7090884, -1.040015, 1, 1, 1, 1, 1,
-1.15536, -0.1202119, -0.9770728, 1, 1, 1, 1, 1,
-1.148993, -0.2413142, -1.222713, 1, 1, 1, 1, 1,
-1.14884, 0.2630954, -1.380809, 0, 0, 1, 1, 1,
-1.139836, -0.3480369, -1.245791, 1, 0, 0, 1, 1,
-1.135406, 0.1356856, 0.01397969, 1, 0, 0, 1, 1,
-1.135275, 1.770484, -2.010693, 1, 0, 0, 1, 1,
-1.132895, -1.834798, -1.954152, 1, 0, 0, 1, 1,
-1.129391, -0.5183775, -2.574004, 1, 0, 0, 1, 1,
-1.127726, 1.159024, 0.9786049, 0, 0, 0, 1, 1,
-1.124962, 0.8701779, -2.337108, 0, 0, 0, 1, 1,
-1.12031, 0.4877572, -1.656048, 0, 0, 0, 1, 1,
-1.115434, 0.7111037, -2.809299, 0, 0, 0, 1, 1,
-1.108856, -0.4027424, -2.105155, 0, 0, 0, 1, 1,
-1.102251, -1.292674, -2.791859, 0, 0, 0, 1, 1,
-1.100809, 0.4367091, -1.533335, 0, 0, 0, 1, 1,
-1.099873, -0.05887906, -0.6976153, 1, 1, 1, 1, 1,
-1.09777, 0.7919007, -0.6705685, 1, 1, 1, 1, 1,
-1.088538, 0.931476, -1.635795, 1, 1, 1, 1, 1,
-1.087713, -1.274038, -2.205194, 1, 1, 1, 1, 1,
-1.087521, 0.8235475, -0.2947089, 1, 1, 1, 1, 1,
-1.071457, -0.1176692, -0.8838451, 1, 1, 1, 1, 1,
-1.062093, 0.7930751, -2.222996, 1, 1, 1, 1, 1,
-1.054969, -0.8540703, -1.715963, 1, 1, 1, 1, 1,
-1.046327, 1.652288, -1.415557, 1, 1, 1, 1, 1,
-1.044998, 0.4123251, -3.118098, 1, 1, 1, 1, 1,
-1.038548, -0.5628322, -0.4881477, 1, 1, 1, 1, 1,
-1.033035, -1.535894, -4.233176, 1, 1, 1, 1, 1,
-1.028041, 0.4172254, -0.1834819, 1, 1, 1, 1, 1,
-1.024981, -2.220924, -1.392093, 1, 1, 1, 1, 1,
-1.019342, 0.9118452, -0.7179251, 1, 1, 1, 1, 1,
-1.016899, 0.6927729, 0.002037253, 0, 0, 1, 1, 1,
-1.01574, 0.8391209, -2.453522, 1, 0, 0, 1, 1,
-1.014477, -0.8228216, -1.954787, 1, 0, 0, 1, 1,
-1.008325, 0.07742453, -1.706665, 1, 0, 0, 1, 1,
-1.002812, -0.02614406, -0.5535399, 1, 0, 0, 1, 1,
-1.002805, 0.1490129, -1.798195, 1, 0, 0, 1, 1,
-0.995937, -0.7200304, -1.565837, 0, 0, 0, 1, 1,
-0.9952814, -1.08445, -2.013539, 0, 0, 0, 1, 1,
-0.9757627, 0.6972942, -1.516786, 0, 0, 0, 1, 1,
-0.9731157, -0.007998209, -1.226312, 0, 0, 0, 1, 1,
-0.9682807, -1.042224, -3.000961, 0, 0, 0, 1, 1,
-0.958491, -3.176141, -3.529389, 0, 0, 0, 1, 1,
-0.958278, 0.9216318, -2.043189, 0, 0, 0, 1, 1,
-0.9529532, -0.8573189, -1.959444, 1, 1, 1, 1, 1,
-0.9468387, 1.3642, 0.137013, 1, 1, 1, 1, 1,
-0.9466068, 1.744515, 0.692508, 1, 1, 1, 1, 1,
-0.9275656, 1.40501, -0.4766889, 1, 1, 1, 1, 1,
-0.92667, -1.185701, -1.244209, 1, 1, 1, 1, 1,
-0.9251935, -0.9660982, -3.164468, 1, 1, 1, 1, 1,
-0.9210497, 1.924061, -1.33528, 1, 1, 1, 1, 1,
-0.9082274, 1.647536, 0.5202269, 1, 1, 1, 1, 1,
-0.9066718, -0.4211956, -0.611194, 1, 1, 1, 1, 1,
-0.9037471, -1.430354, -1.634074, 1, 1, 1, 1, 1,
-0.8998291, -0.5541535, -2.779948, 1, 1, 1, 1, 1,
-0.8981159, -0.6424598, -3.376504, 1, 1, 1, 1, 1,
-0.8931588, -1.862284, -2.508024, 1, 1, 1, 1, 1,
-0.8891644, -0.0848785, -3.147142, 1, 1, 1, 1, 1,
-0.882367, -0.406324, -1.089746, 1, 1, 1, 1, 1,
-0.8815269, 1.272931, 0.7239819, 0, 0, 1, 1, 1,
-0.8797656, -0.5447758, -1.831689, 1, 0, 0, 1, 1,
-0.8791664, 0.536893, -1.949399, 1, 0, 0, 1, 1,
-0.8772018, -0.1217157, -0.6891136, 1, 0, 0, 1, 1,
-0.8722579, 0.5671694, -0.1320771, 1, 0, 0, 1, 1,
-0.8715905, 0.8842061, -0.3190365, 1, 0, 0, 1, 1,
-0.8715243, -0.4658231, -0.6816873, 0, 0, 0, 1, 1,
-0.8714715, 0.1155877, -1.733401, 0, 0, 0, 1, 1,
-0.8633096, 0.003680525, -3.457694, 0, 0, 0, 1, 1,
-0.8612621, 0.2997842, -1.969142, 0, 0, 0, 1, 1,
-0.8611798, 0.5571057, -0.688961, 0, 0, 0, 1, 1,
-0.8609163, 0.7129306, -1.580235, 0, 0, 0, 1, 1,
-0.8600388, -0.157051, -2.504013, 0, 0, 0, 1, 1,
-0.8581539, 1.281761, 0.1824267, 1, 1, 1, 1, 1,
-0.8577151, -0.5173233, -0.8545256, 1, 1, 1, 1, 1,
-0.8552513, 0.438964, -1.994954, 1, 1, 1, 1, 1,
-0.852641, 1.09242, -0.1336376, 1, 1, 1, 1, 1,
-0.8523292, -1.43446, -3.119733, 1, 1, 1, 1, 1,
-0.8482519, -0.3695002, -3.279088, 1, 1, 1, 1, 1,
-0.8474831, 0.8881848, -1.357725, 1, 1, 1, 1, 1,
-0.8438516, 0.8547341, 0.04642262, 1, 1, 1, 1, 1,
-0.8372598, -0.1106299, -1.129272, 1, 1, 1, 1, 1,
-0.8296068, 2.820517, -0.8707433, 1, 1, 1, 1, 1,
-0.8271357, -0.3052854, -2.665519, 1, 1, 1, 1, 1,
-0.8232277, -0.6711906, -0.6063648, 1, 1, 1, 1, 1,
-0.8215572, 2.073195, 1.828086, 1, 1, 1, 1, 1,
-0.8099738, -0.05898685, -2.173893, 1, 1, 1, 1, 1,
-0.8072516, 0.004650684, -2.034595, 1, 1, 1, 1, 1,
-0.8019781, 0.3779894, -2.373076, 0, 0, 1, 1, 1,
-0.8012236, -0.7312857, -2.190946, 1, 0, 0, 1, 1,
-0.7942849, -0.3091303, 0.3006204, 1, 0, 0, 1, 1,
-0.7931247, 1.62079, -2.237805, 1, 0, 0, 1, 1,
-0.7872794, 3.547541, -2.062543, 1, 0, 0, 1, 1,
-0.7867358, -0.4276197, -1.295313, 1, 0, 0, 1, 1,
-0.7774343, 2.125762, 0.4031517, 0, 0, 0, 1, 1,
-0.7635624, -0.2611972, -1.301723, 0, 0, 0, 1, 1,
-0.7631426, 1.145867, 0.134328, 0, 0, 0, 1, 1,
-0.7601517, -1.188224, -2.351358, 0, 0, 0, 1, 1,
-0.7533101, 0.3548407, 0.5469348, 0, 0, 0, 1, 1,
-0.7521251, 0.1180455, -2.432161, 0, 0, 0, 1, 1,
-0.7496802, 1.110149, -0.2195957, 0, 0, 0, 1, 1,
-0.7429835, 1.224614, -0.2614002, 1, 1, 1, 1, 1,
-0.741536, -0.06751345, -1.905344, 1, 1, 1, 1, 1,
-0.7352536, -0.1863758, -1.935882, 1, 1, 1, 1, 1,
-0.7326239, 0.8337793, 1.312195, 1, 1, 1, 1, 1,
-0.7262731, 1.395973, 0.8319819, 1, 1, 1, 1, 1,
-0.7225423, 0.1681712, 0.1348598, 1, 1, 1, 1, 1,
-0.718009, 0.1386855, -1.121474, 1, 1, 1, 1, 1,
-0.7179671, -1.717634, -1.672373, 1, 1, 1, 1, 1,
-0.7137655, -0.2464141, -2.045045, 1, 1, 1, 1, 1,
-0.7128558, 1.001786, -1.143716, 1, 1, 1, 1, 1,
-0.7124394, -0.4449679, -3.127747, 1, 1, 1, 1, 1,
-0.7083882, -1.163681, -2.113934, 1, 1, 1, 1, 1,
-0.7062084, 0.7881178, -0.3221243, 1, 1, 1, 1, 1,
-0.7021388, -2.14234, -2.601151, 1, 1, 1, 1, 1,
-0.7008641, 0.8403167, -0.2085103, 1, 1, 1, 1, 1,
-0.7008137, -0.6434338, -1.857303, 0, 0, 1, 1, 1,
-0.695147, -0.2940704, -2.247249, 1, 0, 0, 1, 1,
-0.6922528, -0.668213, 0.05036086, 1, 0, 0, 1, 1,
-0.6918684, 0.1473263, -0.4330701, 1, 0, 0, 1, 1,
-0.6913769, -1.464633, -6.519442, 1, 0, 0, 1, 1,
-0.6898981, -0.4044707, -0.404191, 1, 0, 0, 1, 1,
-0.6872683, 0.05758634, -2.624919, 0, 0, 0, 1, 1,
-0.6863818, -0.305414, -0.8851326, 0, 0, 0, 1, 1,
-0.6863251, 0.3947521, -2.63264, 0, 0, 0, 1, 1,
-0.6833134, 0.1891826, -1.302865, 0, 0, 0, 1, 1,
-0.6828286, 0.761046, -0.597847, 0, 0, 0, 1, 1,
-0.6811827, -0.4885979, -2.846156, 0, 0, 0, 1, 1,
-0.6801911, -1.593507, -2.290403, 0, 0, 0, 1, 1,
-0.6800719, 0.7835712, -0.5915084, 1, 1, 1, 1, 1,
-0.6795859, -0.2719555, -1.938542, 1, 1, 1, 1, 1,
-0.6778162, -1.461968, -1.296932, 1, 1, 1, 1, 1,
-0.6774173, 0.5284843, -0.5212702, 1, 1, 1, 1, 1,
-0.6770843, -0.118405, -1.595688, 1, 1, 1, 1, 1,
-0.6737047, -2.581321, -0.7776293, 1, 1, 1, 1, 1,
-0.6731432, 1.255428, -0.6409963, 1, 1, 1, 1, 1,
-0.6711465, 1.147593, -1.022998, 1, 1, 1, 1, 1,
-0.6692165, -0.9756004, -3.029319, 1, 1, 1, 1, 1,
-0.6687937, -0.2303422, -3.880814, 1, 1, 1, 1, 1,
-0.6684418, -0.9167044, -3.191148, 1, 1, 1, 1, 1,
-0.6659314, -0.4108385, -2.286764, 1, 1, 1, 1, 1,
-0.665402, -1.063162, -2.302867, 1, 1, 1, 1, 1,
-0.6636885, -0.0997469, -2.30964, 1, 1, 1, 1, 1,
-0.6612067, 0.2216445, -1.92788, 1, 1, 1, 1, 1,
-0.6589849, 0.194828, -3.114793, 0, 0, 1, 1, 1,
-0.6550964, 0.6205276, -0.6450114, 1, 0, 0, 1, 1,
-0.6536024, 1.111255, -1.470026, 1, 0, 0, 1, 1,
-0.6525728, 0.9391336, 1.014021, 1, 0, 0, 1, 1,
-0.643081, 0.5604384, -2.3221, 1, 0, 0, 1, 1,
-0.6397544, 0.7320743, -1.57894, 1, 0, 0, 1, 1,
-0.6335625, -0.3453932, -2.095721, 0, 0, 0, 1, 1,
-0.6328079, 0.5533804, -0.1128608, 0, 0, 0, 1, 1,
-0.6325832, 1.267113, -1.272397, 0, 0, 0, 1, 1,
-0.6319227, 0.9983029, 0.1039904, 0, 0, 0, 1, 1,
-0.6318406, 1.161816, -1.837506, 0, 0, 0, 1, 1,
-0.6310638, 0.02827209, -0.6835874, 0, 0, 0, 1, 1,
-0.6306882, -0.3946937, -3.367041, 0, 0, 0, 1, 1,
-0.6270981, -2.264347, -2.475175, 1, 1, 1, 1, 1,
-0.6254205, -0.782304, -3.559347, 1, 1, 1, 1, 1,
-0.623076, 0.01035188, 0.2448989, 1, 1, 1, 1, 1,
-0.6222852, 0.3666231, -0.9001053, 1, 1, 1, 1, 1,
-0.6217644, -0.2175057, -2.101458, 1, 1, 1, 1, 1,
-0.6161069, -0.07575431, -1.943463, 1, 1, 1, 1, 1,
-0.6147496, 0.1693197, -1.556947, 1, 1, 1, 1, 1,
-0.6120407, -0.9873598, -2.684016, 1, 1, 1, 1, 1,
-0.6119105, -1.484663, -3.155437, 1, 1, 1, 1, 1,
-0.6049009, -0.3957537, -1.61446, 1, 1, 1, 1, 1,
-0.6032602, -0.4083579, -2.057525, 1, 1, 1, 1, 1,
-0.5982571, 1.671637, 0.4676577, 1, 1, 1, 1, 1,
-0.5894215, 0.7251645, 0.094359, 1, 1, 1, 1, 1,
-0.5847005, 1.28613, -2.408354, 1, 1, 1, 1, 1,
-0.5829097, -0.5149894, -3.070678, 1, 1, 1, 1, 1,
-0.5812402, -0.9651148, -2.630162, 0, 0, 1, 1, 1,
-0.5796307, 0.7907423, 0.5964334, 1, 0, 0, 1, 1,
-0.5787653, 0.7474376, -0.493432, 1, 0, 0, 1, 1,
-0.5765837, -0.6892283, -1.946782, 1, 0, 0, 1, 1,
-0.5760784, -1.001308, -4.188602, 1, 0, 0, 1, 1,
-0.5699003, 1.47616, 1.649413, 1, 0, 0, 1, 1,
-0.5683676, -0.6489585, -1.648373, 0, 0, 0, 1, 1,
-0.560863, 1.891225, -1.902555, 0, 0, 0, 1, 1,
-0.5585526, -0.702747, -2.783597, 0, 0, 0, 1, 1,
-0.5541775, -0.6154843, -3.006886, 0, 0, 0, 1, 1,
-0.544104, 1.097497, 0.7937062, 0, 0, 0, 1, 1,
-0.5394177, 0.2692575, -2.812653, 0, 0, 0, 1, 1,
-0.5334702, -0.4944779, -3.158771, 0, 0, 0, 1, 1,
-0.5270451, -0.8133954, -3.640371, 1, 1, 1, 1, 1,
-0.5223442, 1.598242, -0.6713313, 1, 1, 1, 1, 1,
-0.5185494, 0.6274503, 0.6588549, 1, 1, 1, 1, 1,
-0.5157272, 0.07035676, -2.093321, 1, 1, 1, 1, 1,
-0.5144662, -0.2277824, -3.058978, 1, 1, 1, 1, 1,
-0.511824, -0.9876835, -0.550273, 1, 1, 1, 1, 1,
-0.5114401, 0.03674952, -1.510874, 1, 1, 1, 1, 1,
-0.5076396, -0.9600863, -1.646011, 1, 1, 1, 1, 1,
-0.5044957, 0.6722757, -1.209997, 1, 1, 1, 1, 1,
-0.5031292, -1.244709, -3.067822, 1, 1, 1, 1, 1,
-0.5029369, 0.2661604, -0.448363, 1, 1, 1, 1, 1,
-0.5008993, -0.884268, -3.16221, 1, 1, 1, 1, 1,
-0.4976131, 0.5811397, -0.4441163, 1, 1, 1, 1, 1,
-0.49737, -0.2874011, -3.200059, 1, 1, 1, 1, 1,
-0.4919643, -0.4416895, -1.805334, 1, 1, 1, 1, 1,
-0.4912903, -1.010192, -2.61078, 0, 0, 1, 1, 1,
-0.4876342, -0.5050745, -2.942477, 1, 0, 0, 1, 1,
-0.4872399, -1.036, -2.021925, 1, 0, 0, 1, 1,
-0.4814132, 1.3875, 0.5472325, 1, 0, 0, 1, 1,
-0.4794009, -1.279161, -1.232454, 1, 0, 0, 1, 1,
-0.4776539, -1.769262, -2.246496, 1, 0, 0, 1, 1,
-0.4765859, -0.6497349, -2.928286, 0, 0, 0, 1, 1,
-0.4721283, 0.8396533, -0.5899689, 0, 0, 0, 1, 1,
-0.4713026, 0.5924564, -0.2374236, 0, 0, 0, 1, 1,
-0.4699619, -0.6141244, -2.802743, 0, 0, 0, 1, 1,
-0.4696617, -1.19043, -1.805914, 0, 0, 0, 1, 1,
-0.4667612, 1.262275, -0.8118137, 0, 0, 0, 1, 1,
-0.4660927, -2.152813, -4.944855, 0, 0, 0, 1, 1,
-0.4654757, -0.8507408, -1.287631, 1, 1, 1, 1, 1,
-0.4626241, 0.8344252, -0.3200928, 1, 1, 1, 1, 1,
-0.4612773, -0.2177877, -1.606907, 1, 1, 1, 1, 1,
-0.4556547, -0.4373343, -2.91181, 1, 1, 1, 1, 1,
-0.4539992, -0.9991646, -3.254359, 1, 1, 1, 1, 1,
-0.4535882, -1.659981, -4.109858, 1, 1, 1, 1, 1,
-0.4506794, 0.04436085, -0.2914508, 1, 1, 1, 1, 1,
-0.4485354, 0.054176, -3.071497, 1, 1, 1, 1, 1,
-0.4478533, 0.1371557, -0.8129768, 1, 1, 1, 1, 1,
-0.4446522, -1.467535, -2.716012, 1, 1, 1, 1, 1,
-0.4372893, 1.148172, -0.7347059, 1, 1, 1, 1, 1,
-0.4324635, 0.3963309, -0.9126784, 1, 1, 1, 1, 1,
-0.431645, -0.349736, -2.429888, 1, 1, 1, 1, 1,
-0.4277017, 1.187965, 0.2742682, 1, 1, 1, 1, 1,
-0.4268492, -0.7388991, -3.427779, 1, 1, 1, 1, 1,
-0.4242181, 0.8292405, -2.169848, 0, 0, 1, 1, 1,
-0.4219243, -0.7580675, -3.008747, 1, 0, 0, 1, 1,
-0.4200907, 1.226094, 0.5596035, 1, 0, 0, 1, 1,
-0.41967, -0.6260223, -2.571937, 1, 0, 0, 1, 1,
-0.4144213, -0.2792269, -2.885684, 1, 0, 0, 1, 1,
-0.4133506, -0.3398177, -1.552623, 1, 0, 0, 1, 1,
-0.4130775, -1.400789, -4.233088, 0, 0, 0, 1, 1,
-0.4124833, 1.460676, -0.9223697, 0, 0, 0, 1, 1,
-0.4083912, -1.038821, -1.724836, 0, 0, 0, 1, 1,
-0.4062742, -0.3771817, -3.155142, 0, 0, 0, 1, 1,
-0.4023118, -0.7207204, -3.090012, 0, 0, 0, 1, 1,
-0.401874, 0.6213987, -1.067714, 0, 0, 0, 1, 1,
-0.4000393, -0.3397653, -2.351452, 0, 0, 0, 1, 1,
-0.399516, 0.2088221, -0.9743255, 1, 1, 1, 1, 1,
-0.3979127, 1.507489, -1.136256, 1, 1, 1, 1, 1,
-0.3978172, 0.2096237, -0.78074, 1, 1, 1, 1, 1,
-0.3945895, 0.06150032, -2.596067, 1, 1, 1, 1, 1,
-0.3898114, -0.3938782, -0.8441803, 1, 1, 1, 1, 1,
-0.385702, 0.2790588, -1.463947, 1, 1, 1, 1, 1,
-0.3847814, 0.8720781, 1.151594, 1, 1, 1, 1, 1,
-0.3841788, -0.2181098, -1.955909, 1, 1, 1, 1, 1,
-0.3840982, -0.2827324, -1.252845, 1, 1, 1, 1, 1,
-0.3815311, 0.07902904, -3.815399, 1, 1, 1, 1, 1,
-0.3740025, 0.1021909, -0.294903, 1, 1, 1, 1, 1,
-0.3725976, -1.302843, -2.837868, 1, 1, 1, 1, 1,
-0.3706006, 0.08180968, -2.2621, 1, 1, 1, 1, 1,
-0.3675894, 0.01889926, -0.8815148, 1, 1, 1, 1, 1,
-0.3652288, 1.452387, 0.8363669, 1, 1, 1, 1, 1,
-0.3632887, 0.2503466, -0.8409235, 0, 0, 1, 1, 1,
-0.3632058, -0.4332571, -2.796654, 1, 0, 0, 1, 1,
-0.3605234, 0.681868, 1.790638, 1, 0, 0, 1, 1,
-0.3601314, 0.4632449, -3.701718, 1, 0, 0, 1, 1,
-0.3600454, -0.3007915, -4.15003, 1, 0, 0, 1, 1,
-0.3596847, -0.7304967, -2.26849, 1, 0, 0, 1, 1,
-0.3474632, 0.06077692, -2.024124, 0, 0, 0, 1, 1,
-0.3439715, -1.012414, -1.627965, 0, 0, 0, 1, 1,
-0.343438, 1.360927, -0.04911646, 0, 0, 0, 1, 1,
-0.341024, -1.423898, -2.335055, 0, 0, 0, 1, 1,
-0.3397512, 1.225191, -0.305302, 0, 0, 0, 1, 1,
-0.3393356, 0.1415164, -1.803357, 0, 0, 0, 1, 1,
-0.3365905, 0.2549483, -1.293334, 0, 0, 0, 1, 1,
-0.3351409, -2.203675, -2.55908, 1, 1, 1, 1, 1,
-0.3339176, -1.016624, -1.908331, 1, 1, 1, 1, 1,
-0.3334384, 0.4979585, 0.4315805, 1, 1, 1, 1, 1,
-0.3309636, 1.451505, -1.652548, 1, 1, 1, 1, 1,
-0.33075, 0.741735, 0.8955457, 1, 1, 1, 1, 1,
-0.330727, -0.5938815, -2.66738, 1, 1, 1, 1, 1,
-0.3291788, -1.884147, -3.003022, 1, 1, 1, 1, 1,
-0.3281464, 0.04820146, -1.35506, 1, 1, 1, 1, 1,
-0.3269049, 0.2735624, -0.307725, 1, 1, 1, 1, 1,
-0.3244491, 0.265546, -0.7264791, 1, 1, 1, 1, 1,
-0.3199994, 0.3538614, 0.02883782, 1, 1, 1, 1, 1,
-0.3164088, -1.101577, -0.1269475, 1, 1, 1, 1, 1,
-0.3155837, 0.1969205, -0.3853872, 1, 1, 1, 1, 1,
-0.3146414, -1.669523, -1.285581, 1, 1, 1, 1, 1,
-0.314057, -1.277471, -2.827797, 1, 1, 1, 1, 1,
-0.3132645, 0.3045398, -0.9854059, 0, 0, 1, 1, 1,
-0.3029701, -0.4878263, -3.827888, 1, 0, 0, 1, 1,
-0.3019235, 1.566914, -0.7382939, 1, 0, 0, 1, 1,
-0.3011816, -0.4899494, -1.842804, 1, 0, 0, 1, 1,
-0.2979822, 0.3977713, -0.08786521, 1, 0, 0, 1, 1,
-0.2975352, -0.3324307, -2.201422, 1, 0, 0, 1, 1,
-0.2968716, -0.1721942, -1.936289, 0, 0, 0, 1, 1,
-0.2903697, 0.8854735, 1.322692, 0, 0, 0, 1, 1,
-0.2744106, -2.141957, -3.044427, 0, 0, 0, 1, 1,
-0.2704572, -1.414638, -1.877735, 0, 0, 0, 1, 1,
-0.2656541, 0.3457771, -2.82526, 0, 0, 0, 1, 1,
-0.2655018, -0.3802106, -2.720468, 0, 0, 0, 1, 1,
-0.262812, -0.4148659, -3.025498, 0, 0, 0, 1, 1,
-0.261924, -0.3367965, -2.57999, 1, 1, 1, 1, 1,
-0.2606661, 0.9150885, 0.2717132, 1, 1, 1, 1, 1,
-0.2602722, -0.1169559, -1.02512, 1, 1, 1, 1, 1,
-0.2596604, 0.7669759, -1.603558, 1, 1, 1, 1, 1,
-0.2562196, -2.081084, -2.228233, 1, 1, 1, 1, 1,
-0.2539113, 0.7713265, 0.2440142, 1, 1, 1, 1, 1,
-0.2523445, -0.5452215, -4.61427, 1, 1, 1, 1, 1,
-0.2494826, -2.018241, -2.189689, 1, 1, 1, 1, 1,
-0.2486247, -2.176369, -3.455388, 1, 1, 1, 1, 1,
-0.2452535, 0.3027802, -1.768267, 1, 1, 1, 1, 1,
-0.2406864, -0.2408207, -2.296753, 1, 1, 1, 1, 1,
-0.2381348, -0.9072017, -2.228222, 1, 1, 1, 1, 1,
-0.2349557, 0.8512628, -1.632156, 1, 1, 1, 1, 1,
-0.2335695, 0.8970501, 0.1524038, 1, 1, 1, 1, 1,
-0.2335539, 0.4106304, 1.683419, 1, 1, 1, 1, 1,
-0.2258236, 1.378656, 1.480325, 0, 0, 1, 1, 1,
-0.2241727, 1.051118, -0.239933, 1, 0, 0, 1, 1,
-0.2211789, 0.7562236, 1.391217, 1, 0, 0, 1, 1,
-0.2207226, -0.4052308, -1.186935, 1, 0, 0, 1, 1,
-0.2200034, -0.947523, -5.227739, 1, 0, 0, 1, 1,
-0.2161461, 0.7578176, 0.8928587, 1, 0, 0, 1, 1,
-0.2094706, 0.2509679, -1.004791, 0, 0, 0, 1, 1,
-0.2063101, 0.07772642, -1.162842, 0, 0, 0, 1, 1,
-0.1999585, 1.653198, 1.611248, 0, 0, 0, 1, 1,
-0.1997653, 0.4526682, -0.7343296, 0, 0, 0, 1, 1,
-0.196635, 0.4092308, 1.468211, 0, 0, 0, 1, 1,
-0.1952797, 0.4653176, -1.39742, 0, 0, 0, 1, 1,
-0.1930812, -1.156424, -2.31141, 0, 0, 0, 1, 1,
-0.1909967, -0.5682945, -1.984291, 1, 1, 1, 1, 1,
-0.1893787, -0.3880152, -2.975567, 1, 1, 1, 1, 1,
-0.1846577, 2.176415, -1.597341, 1, 1, 1, 1, 1,
-0.1818039, -0.3193325, -2.430867, 1, 1, 1, 1, 1,
-0.1775982, -2.38559, -2.277547, 1, 1, 1, 1, 1,
-0.1740519, 0.09773666, -0.8714732, 1, 1, 1, 1, 1,
-0.1737643, 0.6635631, -0.1294492, 1, 1, 1, 1, 1,
-0.1734257, 1.13792, -0.5203586, 1, 1, 1, 1, 1,
-0.1712317, -0.3793407, -3.318302, 1, 1, 1, 1, 1,
-0.1688083, 0.8833362, 0.3226736, 1, 1, 1, 1, 1,
-0.1683694, 0.3726897, -1.521874, 1, 1, 1, 1, 1,
-0.1675982, -0.7278516, -2.823394, 1, 1, 1, 1, 1,
-0.1645507, 0.438921, 0.3643961, 1, 1, 1, 1, 1,
-0.1641013, -0.373538, -4.137642, 1, 1, 1, 1, 1,
-0.1575703, -0.7157189, -2.73819, 1, 1, 1, 1, 1,
-0.1496406, 1.046782, -0.9144084, 0, 0, 1, 1, 1,
-0.1490596, -0.4923572, -2.831428, 1, 0, 0, 1, 1,
-0.1470413, -2.345585, -1.540035, 1, 0, 0, 1, 1,
-0.1469539, 0.1227559, -1.139056, 1, 0, 0, 1, 1,
-0.1459979, 1.320364, 0.482323, 1, 0, 0, 1, 1,
-0.1436537, 0.5324339, -0.6895377, 1, 0, 0, 1, 1,
-0.1380027, 0.7614619, 0.2712754, 0, 0, 0, 1, 1,
-0.1357015, -0.1489988, -1.773516, 0, 0, 0, 1, 1,
-0.134598, 1.24598, -0.06119435, 0, 0, 0, 1, 1,
-0.1303407, 0.2447124, 0.4905175, 0, 0, 0, 1, 1,
-0.1283291, 0.6971428, -1.028731, 0, 0, 0, 1, 1,
-0.1260402, 0.392684, -2.303012, 0, 0, 0, 1, 1,
-0.1242482, 1.009377, -1.512302, 0, 0, 0, 1, 1,
-0.1233067, -0.9511755, -3.254133, 1, 1, 1, 1, 1,
-0.1225256, -0.3947634, -3.121638, 1, 1, 1, 1, 1,
-0.119803, -0.1056453, -2.536188, 1, 1, 1, 1, 1,
-0.1182216, 0.2542933, -0.5837908, 1, 1, 1, 1, 1,
-0.1143492, 0.1773077, -1.124628, 1, 1, 1, 1, 1,
-0.1132151, 2.835999, 0.7238241, 1, 1, 1, 1, 1,
-0.1118621, -2.035266, -2.62547, 1, 1, 1, 1, 1,
-0.1097768, -0.3078618, -3.306767, 1, 1, 1, 1, 1,
-0.1086408, 0.6597499, -0.3364525, 1, 1, 1, 1, 1,
-0.1066087, -0.5520163, -4.122363, 1, 1, 1, 1, 1,
-0.1055608, 1.788128, -0.9017462, 1, 1, 1, 1, 1,
-0.1044037, 0.8260393, 0.188529, 1, 1, 1, 1, 1,
-0.1024698, -0.734439, -3.088838, 1, 1, 1, 1, 1,
-0.1013177, 0.8279716, 0.3357932, 1, 1, 1, 1, 1,
-0.1003652, -1.313728, -3.22409, 1, 1, 1, 1, 1,
-0.0980469, -0.2098116, -2.85311, 0, 0, 1, 1, 1,
-0.09779047, 0.7765995, -0.2874392, 1, 0, 0, 1, 1,
-0.09684132, 0.556486, -0.5232311, 1, 0, 0, 1, 1,
-0.08994018, 1.237471, -1.563581, 1, 0, 0, 1, 1,
-0.08178899, -0.06944861, -2.866879, 1, 0, 0, 1, 1,
-0.08108936, 1.368391, -0.6983454, 1, 0, 0, 1, 1,
-0.07801621, -1.356161, -3.036944, 0, 0, 0, 1, 1,
-0.07552896, 0.4911353, -0.1966991, 0, 0, 0, 1, 1,
-0.0664707, 0.9988998, 1.140164, 0, 0, 0, 1, 1,
-0.06613278, 0.5049361, 0.7631578, 0, 0, 0, 1, 1,
-0.06538639, 0.6391899, 2.051117, 0, 0, 0, 1, 1,
-0.06399419, -0.3605865, -4.187543, 0, 0, 0, 1, 1,
-0.06394126, -1.049823, -1.783007, 0, 0, 0, 1, 1,
-0.05890628, 1.006634, 0.649743, 1, 1, 1, 1, 1,
-0.05322945, -1.14048, -2.23956, 1, 1, 1, 1, 1,
-0.050813, 0.5986416, -0.87081, 1, 1, 1, 1, 1,
-0.04725316, -0.4058169, -2.727597, 1, 1, 1, 1, 1,
-0.04418271, -0.1488874, -2.855609, 1, 1, 1, 1, 1,
-0.04327474, 0.8039135, 0.8936545, 1, 1, 1, 1, 1,
-0.04258414, -1.965025, -0.8288248, 1, 1, 1, 1, 1,
-0.04095694, 1.198228, -1.351466, 1, 1, 1, 1, 1,
-0.03905745, -0.9098902, -3.639687, 1, 1, 1, 1, 1,
-0.03733197, 0.1531584, 0.4577483, 1, 1, 1, 1, 1,
-0.0358563, 1.315934, -1.165977, 1, 1, 1, 1, 1,
-0.03543929, -0.4527324, -1.638388, 1, 1, 1, 1, 1,
-0.03272677, 0.2176408, -0.5539284, 1, 1, 1, 1, 1,
-0.03238469, -0.369684, -3.276649, 1, 1, 1, 1, 1,
-0.02679289, -0.2477116, -3.08188, 1, 1, 1, 1, 1,
-0.0239331, -0.5265291, -3.771527, 0, 0, 1, 1, 1,
-0.02303076, -0.02321582, -1.610812, 1, 0, 0, 1, 1,
-0.01970464, -0.6836381, -3.817436, 1, 0, 0, 1, 1,
-0.01851439, -0.3038754, -4.10807, 1, 0, 0, 1, 1,
-0.01430066, -1.553274, -2.417195, 1, 0, 0, 1, 1,
-0.01362858, -0.4293451, -2.392879, 1, 0, 0, 1, 1,
-0.008403209, -0.2933165, -3.759705, 0, 0, 0, 1, 1,
-0.0007471837, -0.2043675, -3.396883, 0, 0, 0, 1, 1,
0.0003391949, -0.1852826, 3.283174, 0, 0, 0, 1, 1,
0.003720488, -0.9003516, 3.172743, 0, 0, 0, 1, 1,
0.006165671, 0.6066113, -0.5398033, 0, 0, 0, 1, 1,
0.009195179, -0.5457412, 2.937407, 0, 0, 0, 1, 1,
0.0118463, -0.7707442, 3.156294, 0, 0, 0, 1, 1,
0.01187107, 0.186481, -0.6118286, 1, 1, 1, 1, 1,
0.01465737, 0.7242656, -0.03650436, 1, 1, 1, 1, 1,
0.01591583, 1.201404, -1.44784, 1, 1, 1, 1, 1,
0.02288572, -0.8952215, 2.319739, 1, 1, 1, 1, 1,
0.02726973, -1.05749, 1.61099, 1, 1, 1, 1, 1,
0.02916446, 0.1791583, -0.6636028, 1, 1, 1, 1, 1,
0.02917494, 0.1112892, 0.1395536, 1, 1, 1, 1, 1,
0.03305683, -2.537462, 3.158177, 1, 1, 1, 1, 1,
0.03465451, -0.002197223, 3.00369, 1, 1, 1, 1, 1,
0.03948421, -1.569055, 3.771245, 1, 1, 1, 1, 1,
0.04242499, -0.5884012, 2.595598, 1, 1, 1, 1, 1,
0.04397354, -0.1086944, 3.539957, 1, 1, 1, 1, 1,
0.04477753, 0.2893098, -1.12324, 1, 1, 1, 1, 1,
0.04484671, -0.1742997, 2.276234, 1, 1, 1, 1, 1,
0.05025006, -0.7422596, 2.832499, 1, 1, 1, 1, 1,
0.05591047, -1.972501, 3.793497, 0, 0, 1, 1, 1,
0.05638609, 0.8975111, -0.4043154, 1, 0, 0, 1, 1,
0.05811898, -1.144619, 1.988647, 1, 0, 0, 1, 1,
0.07218763, 0.3849678, 2.995466, 1, 0, 0, 1, 1,
0.07653444, 1.150904, -0.6654419, 1, 0, 0, 1, 1,
0.07666835, 0.3082707, 0.577038, 1, 0, 0, 1, 1,
0.07796033, 0.3617709, 0.334848, 0, 0, 0, 1, 1,
0.07843481, -0.9204978, 3.705767, 0, 0, 0, 1, 1,
0.08285908, 1.173309, -0.1557789, 0, 0, 0, 1, 1,
0.08295071, -0.3557172, 2.746938, 0, 0, 0, 1, 1,
0.08468217, -1.336065, 4.491395, 0, 0, 0, 1, 1,
0.08592162, -1.560785, 3.249138, 0, 0, 0, 1, 1,
0.08644266, 1.047619, -1.053373, 0, 0, 0, 1, 1,
0.09129276, 0.3235944, -1.404803, 1, 1, 1, 1, 1,
0.1006884, 1.105503, 2.009179, 1, 1, 1, 1, 1,
0.1011356, -1.013927, 3.132944, 1, 1, 1, 1, 1,
0.1040457, -0.8143886, 4.713042, 1, 1, 1, 1, 1,
0.1092078, -1.367887, 1.636864, 1, 1, 1, 1, 1,
0.1093882, -1.379819, 2.921663, 1, 1, 1, 1, 1,
0.1097487, 0.7719196, -0.1661577, 1, 1, 1, 1, 1,
0.1119505, -0.6193027, 3.023686, 1, 1, 1, 1, 1,
0.1124854, -0.03306015, 3.20742, 1, 1, 1, 1, 1,
0.1127699, 1.336528, 0.06780345, 1, 1, 1, 1, 1,
0.1128094, -1.001925, 4.047029, 1, 1, 1, 1, 1,
0.114176, 1.578512, -1.590518, 1, 1, 1, 1, 1,
0.1162319, -0.06871655, 2.468131, 1, 1, 1, 1, 1,
0.1211785, -0.1535277, 3.228669, 1, 1, 1, 1, 1,
0.1248975, 1.159042, 0.7711319, 1, 1, 1, 1, 1,
0.1250484, -0.2680373, 3.508819, 0, 0, 1, 1, 1,
0.1281715, -2.240132, 1.449508, 1, 0, 0, 1, 1,
0.1358574, 0.7982147, 0.909591, 1, 0, 0, 1, 1,
0.1397615, -0.4823618, 2.679934, 1, 0, 0, 1, 1,
0.1437592, -0.5489627, 3.371188, 1, 0, 0, 1, 1,
0.1461162, 0.6537321, -0.2249834, 1, 0, 0, 1, 1,
0.1503412, -0.6276322, 1.963418, 0, 0, 0, 1, 1,
0.1509746, -1.780427, 3.172915, 0, 0, 0, 1, 1,
0.1519414, 1.413654, 0.2943475, 0, 0, 0, 1, 1,
0.1544283, -0.3983628, 2.769354, 0, 0, 0, 1, 1,
0.1601309, -1.715999, 1.958366, 0, 0, 0, 1, 1,
0.1605312, -0.5436913, 4.407998, 0, 0, 0, 1, 1,
0.1616787, 0.1581826, 0.9819657, 0, 0, 0, 1, 1,
0.1620202, -1.130723, 3.60448, 1, 1, 1, 1, 1,
0.1623558, 0.4663877, -0.08088563, 1, 1, 1, 1, 1,
0.1631671, -1.031015, 2.146796, 1, 1, 1, 1, 1,
0.1696288, -1.156288, 2.738402, 1, 1, 1, 1, 1,
0.1751439, -0.3588423, 2.901153, 1, 1, 1, 1, 1,
0.1751594, 0.3860557, 1.118349, 1, 1, 1, 1, 1,
0.1768199, 1.319593, -0.03707579, 1, 1, 1, 1, 1,
0.1839804, 0.1220631, 2.351275, 1, 1, 1, 1, 1,
0.1841696, 0.7381508, 2.301123, 1, 1, 1, 1, 1,
0.1885528, 0.07129258, -0.005759982, 1, 1, 1, 1, 1,
0.2075377, -0.375017, 3.404914, 1, 1, 1, 1, 1,
0.2124044, 0.2366066, -1.092134, 1, 1, 1, 1, 1,
0.2124798, -1.516788, 2.525245, 1, 1, 1, 1, 1,
0.2154212, -1.003507, 3.960989, 1, 1, 1, 1, 1,
0.2170251, -1.013019, 3.511028, 1, 1, 1, 1, 1,
0.2181844, 1.666306, 0.5229678, 0, 0, 1, 1, 1,
0.2189903, 1.050109, -1.423059, 1, 0, 0, 1, 1,
0.2198883, 0.4491617, 0.7628114, 1, 0, 0, 1, 1,
0.2228817, 0.07160553, 1.035285, 1, 0, 0, 1, 1,
0.2272754, 0.007299203, -0.4583007, 1, 0, 0, 1, 1,
0.2282553, -0.4439732, 3.91373, 1, 0, 0, 1, 1,
0.2290585, 0.8801126, 1.515395, 0, 0, 0, 1, 1,
0.2305588, -0.04678797, 1.314122, 0, 0, 0, 1, 1,
0.2308677, 1.113672, 0.9668625, 0, 0, 0, 1, 1,
0.2322385, 1.238331, 0.8177152, 0, 0, 0, 1, 1,
0.2327241, 1.310701, 0.6151319, 0, 0, 0, 1, 1,
0.2365567, 0.972598, 2.299539, 0, 0, 0, 1, 1,
0.2424919, -0.9715725, 2.308179, 0, 0, 0, 1, 1,
0.2468977, 0.04305723, 2.764738, 1, 1, 1, 1, 1,
0.2473927, -0.9854504, 2.609655, 1, 1, 1, 1, 1,
0.249145, 0.1196325, 2.662451, 1, 1, 1, 1, 1,
0.2502586, 0.6535172, 0.2739842, 1, 1, 1, 1, 1,
0.2563154, -0.902723, 3.688994, 1, 1, 1, 1, 1,
0.2645997, -0.1016635, 0.569394, 1, 1, 1, 1, 1,
0.2650432, 0.8711553, 0.7457921, 1, 1, 1, 1, 1,
0.2662726, -1.006624, 1.760276, 1, 1, 1, 1, 1,
0.2664443, -0.7628711, 2.205437, 1, 1, 1, 1, 1,
0.2707646, 0.5035836, 0.8123763, 1, 1, 1, 1, 1,
0.2730834, -0.5631243, 2.513474, 1, 1, 1, 1, 1,
0.2763878, -0.6822596, 3.580315, 1, 1, 1, 1, 1,
0.2782394, -0.2283707, 1.330414, 1, 1, 1, 1, 1,
0.2812735, 0.9775004, 0.5008451, 1, 1, 1, 1, 1,
0.2822461, -1.599057, 2.27879, 1, 1, 1, 1, 1,
0.2829729, -0.6566516, 3.526074, 0, 0, 1, 1, 1,
0.2847423, -0.2359376, 0.9680916, 1, 0, 0, 1, 1,
0.2870033, -0.9541463, 2.436328, 1, 0, 0, 1, 1,
0.2902281, -1.651895, 1.658538, 1, 0, 0, 1, 1,
0.2954677, 1.907732, 0.8942799, 1, 0, 0, 1, 1,
0.2986578, -0.2807984, 4.163027, 1, 0, 0, 1, 1,
0.2990737, -2.258929, 0.6710383, 0, 0, 0, 1, 1,
0.2996611, 0.6926978, -0.3430681, 0, 0, 0, 1, 1,
0.3039369, 0.2427877, 0.2314539, 0, 0, 0, 1, 1,
0.30873, -0.9961598, 4.086143, 0, 0, 0, 1, 1,
0.3233968, 0.1930923, 1.73891, 0, 0, 0, 1, 1,
0.323968, 1.417596, -0.4441225, 0, 0, 0, 1, 1,
0.324322, -0.5717269, 1.897058, 0, 0, 0, 1, 1,
0.325913, -0.1565139, 2.469864, 1, 1, 1, 1, 1,
0.3271216, -0.02359274, 0.7538924, 1, 1, 1, 1, 1,
0.3317625, -0.836868, 2.569525, 1, 1, 1, 1, 1,
0.3355675, 0.2030779, 1.20929, 1, 1, 1, 1, 1,
0.3479722, 1.642902, 0.1608046, 1, 1, 1, 1, 1,
0.3483641, 1.76675, 0.8799146, 1, 1, 1, 1, 1,
0.3486681, 0.6211095, 2.787651, 1, 1, 1, 1, 1,
0.3540663, 0.3935672, 1.088768, 1, 1, 1, 1, 1,
0.3548035, -0.08350573, 0.7312403, 1, 1, 1, 1, 1,
0.3555454, -1.064558, 2.459052, 1, 1, 1, 1, 1,
0.3630252, 0.7325984, -0.8958246, 1, 1, 1, 1, 1,
0.3641745, 0.05384478, 1.870395, 1, 1, 1, 1, 1,
0.3698434, -0.1622931, 2.542518, 1, 1, 1, 1, 1,
0.3701427, 0.9837378, -0.6024237, 1, 1, 1, 1, 1,
0.3728682, 0.009076248, 0.6371679, 1, 1, 1, 1, 1,
0.3733409, -0.6603521, 1.167637, 0, 0, 1, 1, 1,
0.3757859, 0.03857176, 1.536689, 1, 0, 0, 1, 1,
0.3795531, -0.4894851, 3.927682, 1, 0, 0, 1, 1,
0.3797522, -0.392967, 2.976414, 1, 0, 0, 1, 1,
0.3830345, 1.152805, -0.08378839, 1, 0, 0, 1, 1,
0.3857069, -1.110618, 1.523195, 1, 0, 0, 1, 1,
0.3861359, -2.151073, 3.570563, 0, 0, 0, 1, 1,
0.3869338, 0.7680133, 0.3847029, 0, 0, 0, 1, 1,
0.3881839, 1.716356, 1.444491, 0, 0, 0, 1, 1,
0.3903041, -0.9970838, 1.372399, 0, 0, 0, 1, 1,
0.3941617, -0.8946549, 4.282649, 0, 0, 0, 1, 1,
0.3959247, 0.3007618, 1.826132, 0, 0, 0, 1, 1,
0.3960038, -0.8042343, 3.424071, 0, 0, 0, 1, 1,
0.3961418, -0.3731559, 1.083833, 1, 1, 1, 1, 1,
0.3967711, 0.4327979, -0.8969352, 1, 1, 1, 1, 1,
0.3975107, 1.566257, -0.2848552, 1, 1, 1, 1, 1,
0.400593, 1.485389, 0.6085936, 1, 1, 1, 1, 1,
0.4014485, 1.220303, 1.42126, 1, 1, 1, 1, 1,
0.4019841, -0.09218142, 1.887786, 1, 1, 1, 1, 1,
0.4038991, -0.622042, 4.054636, 1, 1, 1, 1, 1,
0.4046534, -0.4198589, 3.057129, 1, 1, 1, 1, 1,
0.4057689, 0.5398065, -0.5215139, 1, 1, 1, 1, 1,
0.4108758, -2.081102, 2.473753, 1, 1, 1, 1, 1,
0.412669, -1.292987, 4.495757, 1, 1, 1, 1, 1,
0.4167235, 0.05785764, 3.34462, 1, 1, 1, 1, 1,
0.4169901, -0.7234045, 1.392742, 1, 1, 1, 1, 1,
0.4201571, -2.207298, 2.506481, 1, 1, 1, 1, 1,
0.4256878, 0.4204485, 1.149315, 1, 1, 1, 1, 1,
0.4259866, -0.4017266, 2.298456, 0, 0, 1, 1, 1,
0.4295637, 1.075845, 1.953762, 1, 0, 0, 1, 1,
0.4301164, -0.1614955, 0.1706333, 1, 0, 0, 1, 1,
0.4306639, -0.7838901, 3.586047, 1, 0, 0, 1, 1,
0.4326571, -2.953432, 2.182538, 1, 0, 0, 1, 1,
0.4347093, 1.347569, -0.3610318, 1, 0, 0, 1, 1,
0.4347268, -0.1395756, 1.197389, 0, 0, 0, 1, 1,
0.4386828, -0.07252019, 2.742413, 0, 0, 0, 1, 1,
0.4470818, -0.4837084, 2.699058, 0, 0, 0, 1, 1,
0.4517819, -1.650728, 3.374922, 0, 0, 0, 1, 1,
0.4563246, -0.2595218, 2.689228, 0, 0, 0, 1, 1,
0.4619242, 0.6237047, -0.1001587, 0, 0, 0, 1, 1,
0.462699, -0.5200512, 1.168579, 0, 0, 0, 1, 1,
0.4646655, -1.205111, 4.132533, 1, 1, 1, 1, 1,
0.4746053, -1.687324, 2.382041, 1, 1, 1, 1, 1,
0.4746545, 1.11402, -0.1578244, 1, 1, 1, 1, 1,
0.4748663, -0.0873537, 1.97517, 1, 1, 1, 1, 1,
0.4827033, 0.3180113, 2.429111, 1, 1, 1, 1, 1,
0.4849719, 0.2752883, 1.453445, 1, 1, 1, 1, 1,
0.4925658, 0.2305896, 1.218375, 1, 1, 1, 1, 1,
0.5038505, -1.184047, 2.124812, 1, 1, 1, 1, 1,
0.5046355, -2.084983, 1.472454, 1, 1, 1, 1, 1,
0.5074677, -0.1221725, 1.987904, 1, 1, 1, 1, 1,
0.5084469, -0.5321755, 1.632821, 1, 1, 1, 1, 1,
0.51654, -0.09211811, 0.50895, 1, 1, 1, 1, 1,
0.5189199, 0.7702553, 0.5972263, 1, 1, 1, 1, 1,
0.5252942, 0.2925876, 1.899743, 1, 1, 1, 1, 1,
0.525941, 2.041066, 2.367592, 1, 1, 1, 1, 1,
0.5261219, -0.6700228, 2.20819, 0, 0, 1, 1, 1,
0.5274104, -1.553561, 2.750309, 1, 0, 0, 1, 1,
0.5275608, 0.3155004, 2.303152, 1, 0, 0, 1, 1,
0.531653, -0.4733805, 2.951234, 1, 0, 0, 1, 1,
0.5368883, 1.644396, -0.1085647, 1, 0, 0, 1, 1,
0.538988, -2.13694, 3.810832, 1, 0, 0, 1, 1,
0.5433276, 1.148257, 1.185266, 0, 0, 0, 1, 1,
0.5496992, 0.3568439, 1.838658, 0, 0, 0, 1, 1,
0.5507607, -0.02107104, 1.114109, 0, 0, 0, 1, 1,
0.5518737, -0.5429429, 2.298767, 0, 0, 0, 1, 1,
0.5532609, -3.033174, 3.992089, 0, 0, 0, 1, 1,
0.5535212, 1.409789, 1.238434, 0, 0, 0, 1, 1,
0.5537458, 0.06301463, 2.849244, 0, 0, 0, 1, 1,
0.5554727, -0.9250885, 1.66817, 1, 1, 1, 1, 1,
0.5587173, 1.232287, 0.8607073, 1, 1, 1, 1, 1,
0.5606831, 1.008307, 0.4421093, 1, 1, 1, 1, 1,
0.5696476, 2.664934, 1.318715, 1, 1, 1, 1, 1,
0.5705871, -0.4394516, 2.147717, 1, 1, 1, 1, 1,
0.5723459, -0.4142322, 3.532774, 1, 1, 1, 1, 1,
0.5741078, -0.5368469, 3.594722, 1, 1, 1, 1, 1,
0.5843361, -0.4156209, 2.932946, 1, 1, 1, 1, 1,
0.5876599, 0.4971306, 2.840301, 1, 1, 1, 1, 1,
0.5976706, 1.349086, 0.3449038, 1, 1, 1, 1, 1,
0.6053458, 0.1297682, 0.8684334, 1, 1, 1, 1, 1,
0.6138268, 1.296038, 0.7412173, 1, 1, 1, 1, 1,
0.6176952, 0.9737304, 2.026771, 1, 1, 1, 1, 1,
0.6189848, -1.728009, 3.099221, 1, 1, 1, 1, 1,
0.6235548, 1.440207, 0.7946084, 1, 1, 1, 1, 1,
0.6246275, 0.7761163, 1.160659, 0, 0, 1, 1, 1,
0.6271108, -0.6578001, 1.949993, 1, 0, 0, 1, 1,
0.633196, 1.233181, -0.1095816, 1, 0, 0, 1, 1,
0.6367567, -0.8469004, 3.613838, 1, 0, 0, 1, 1,
0.6408484, -0.3753595, 3.661285, 1, 0, 0, 1, 1,
0.6422375, -1.103849, 2.697768, 1, 0, 0, 1, 1,
0.6445938, -0.264008, -0.3692746, 0, 0, 0, 1, 1,
0.6451335, 0.5786279, 2.971944, 0, 0, 0, 1, 1,
0.6491242, -0.133153, 1.074193, 0, 0, 0, 1, 1,
0.651244, 0.3981413, 1.879494, 0, 0, 0, 1, 1,
0.6537836, -0.4905851, 1.713439, 0, 0, 0, 1, 1,
0.654521, -0.07877547, 1.242116, 0, 0, 0, 1, 1,
0.6557826, 0.3017569, 1.505933, 0, 0, 0, 1, 1,
0.6648476, 0.1171312, 1.136588, 1, 1, 1, 1, 1,
0.6655868, -0.0547945, 2.228214, 1, 1, 1, 1, 1,
0.6658818, -0.2633553, 1.271448, 1, 1, 1, 1, 1,
0.6659191, 0.9061974, -0.03922231, 1, 1, 1, 1, 1,
0.6672793, -0.0108409, 1.646613, 1, 1, 1, 1, 1,
0.6688861, 0.662871, -0.6748495, 1, 1, 1, 1, 1,
0.6695434, -0.08242851, 0.9970641, 1, 1, 1, 1, 1,
0.6718905, -0.646143, 1.980736, 1, 1, 1, 1, 1,
0.6723018, -0.245336, 1.668795, 1, 1, 1, 1, 1,
0.676334, -1.447884, 2.608301, 1, 1, 1, 1, 1,
0.6804335, 0.7521566, -0.04429346, 1, 1, 1, 1, 1,
0.6829444, 1.650067, -0.5757526, 1, 1, 1, 1, 1,
0.6882553, 0.7125412, -0.1556307, 1, 1, 1, 1, 1,
0.6887836, 0.2422408, 1.324705, 1, 1, 1, 1, 1,
0.6909809, -1.123006, 2.968029, 1, 1, 1, 1, 1,
0.6916161, 0.1446804, 0.5456313, 0, 0, 1, 1, 1,
0.7011429, -0.3630092, 0.1057174, 1, 0, 0, 1, 1,
0.7022517, -0.4960464, 2.544618, 1, 0, 0, 1, 1,
0.7084343, 1.171278, 1.166303, 1, 0, 0, 1, 1,
0.7088688, 1.248523, 1.218285, 1, 0, 0, 1, 1,
0.7202167, 0.5965697, 1.150304, 1, 0, 0, 1, 1,
0.72502, 2.452172, 0.3070884, 0, 0, 0, 1, 1,
0.7265193, 0.8613436, 1.13389, 0, 0, 0, 1, 1,
0.7286588, 0.2250446, 2.694464, 0, 0, 0, 1, 1,
0.7315593, -1.9618, 3.989901, 0, 0, 0, 1, 1,
0.7343131, -0.9375605, 1.868972, 0, 0, 0, 1, 1,
0.7391487, -0.2051046, 2.545994, 0, 0, 0, 1, 1,
0.7396074, -0.4876648, 0.03110829, 0, 0, 0, 1, 1,
0.7452979, 0.2259942, 0.09535551, 1, 1, 1, 1, 1,
0.7477916, 1.119536, 1.039982, 1, 1, 1, 1, 1,
0.7541232, 0.6280332, 0.9818134, 1, 1, 1, 1, 1,
0.7561761, -1.212678, 1.242999, 1, 1, 1, 1, 1,
0.7687837, 0.3221665, -0.3732948, 1, 1, 1, 1, 1,
0.7688804, -1.462465, 0.5200486, 1, 1, 1, 1, 1,
0.7692633, -1.623456, 2.267895, 1, 1, 1, 1, 1,
0.7728008, 1.40589, 0.5879835, 1, 1, 1, 1, 1,
0.7756483, 1.017609, 0.2736405, 1, 1, 1, 1, 1,
0.7816548, 2.58639, -0.6371264, 1, 1, 1, 1, 1,
0.7832878, -0.5692996, 3.874607, 1, 1, 1, 1, 1,
0.7968779, -0.5567181, 2.848186, 1, 1, 1, 1, 1,
0.8034661, 1.195154, 1.384955, 1, 1, 1, 1, 1,
0.8126584, 1.03573, 2.556919, 1, 1, 1, 1, 1,
0.8130206, 0.1284691, 1.195593, 1, 1, 1, 1, 1,
0.8178667, 0.4885399, 0.5293167, 0, 0, 1, 1, 1,
0.8207753, 0.7492622, 1.291947, 1, 0, 0, 1, 1,
0.8230693, 2.065535, 1.515513, 1, 0, 0, 1, 1,
0.8236421, 0.07325535, -0.6900246, 1, 0, 0, 1, 1,
0.8317382, 0.8088682, 0.3737027, 1, 0, 0, 1, 1,
0.8318387, 0.5341045, 2.219988, 1, 0, 0, 1, 1,
0.8333101, 1.154158, 0.7757298, 0, 0, 0, 1, 1,
0.8333993, 1.383604, 1.352754, 0, 0, 0, 1, 1,
0.835124, -0.323661, 2.05541, 0, 0, 0, 1, 1,
0.8426681, 1.000442, 0.270403, 0, 0, 0, 1, 1,
0.8440385, -0.4103762, 1.286295, 0, 0, 0, 1, 1,
0.8444015, 0.8604259, 1.458843, 0, 0, 0, 1, 1,
0.845109, -1.687772, 3.06379, 0, 0, 0, 1, 1,
0.8524197, 0.0008472751, 1.283077, 1, 1, 1, 1, 1,
0.8571005, -0.3064325, 2.645317, 1, 1, 1, 1, 1,
0.8585054, -0.3832366, 3.367439, 1, 1, 1, 1, 1,
0.8597609, 0.1209925, 0.1590034, 1, 1, 1, 1, 1,
0.8616276, 0.100757, 2.016202, 1, 1, 1, 1, 1,
0.8628269, 0.6263129, 0.3732916, 1, 1, 1, 1, 1,
0.8637749, 0.6685589, 0.1535141, 1, 1, 1, 1, 1,
0.8656771, -0.7097396, 0.108849, 1, 1, 1, 1, 1,
0.8668352, -0.7324799, 2.360417, 1, 1, 1, 1, 1,
0.8688309, -1.4187, 1.425808, 1, 1, 1, 1, 1,
0.8727272, 1.039369, 0.2973138, 1, 1, 1, 1, 1,
0.8727295, -1.311596, 2.743983, 1, 1, 1, 1, 1,
0.8798036, 0.01506623, 3.849728, 1, 1, 1, 1, 1,
0.8889651, 1.603056, -0.2299416, 1, 1, 1, 1, 1,
0.8937227, 0.9389874, 0.4971099, 1, 1, 1, 1, 1,
0.8939934, 1.385738, 0.3040322, 0, 0, 1, 1, 1,
0.8992639, 0.5087448, 2.125427, 1, 0, 0, 1, 1,
0.910356, -0.5817024, 1.678701, 1, 0, 0, 1, 1,
0.9132285, 0.5166091, 0.4641163, 1, 0, 0, 1, 1,
0.927008, 1.222833, -0.09824099, 1, 0, 0, 1, 1,
0.939119, -0.3256308, 1.967745, 1, 0, 0, 1, 1,
0.9402395, 0.003709971, 3.243908, 0, 0, 0, 1, 1,
0.9413847, -1.265343, 3.371237, 0, 0, 0, 1, 1,
0.9467349, -1.298347, 2.463032, 0, 0, 0, 1, 1,
0.9471186, 1.249402, 0.03217449, 0, 0, 0, 1, 1,
0.9510832, 0.6957127, -0.6361963, 0, 0, 0, 1, 1,
0.9547963, -1.984668, 2.796298, 0, 0, 0, 1, 1,
0.9735968, -0.3589236, 2.568544, 0, 0, 0, 1, 1,
0.9781694, 0.4282369, 1.090197, 1, 1, 1, 1, 1,
0.9816936, 0.9106268, 0.8507288, 1, 1, 1, 1, 1,
0.9826973, -0.2435987, 2.009807, 1, 1, 1, 1, 1,
0.9921053, 0.6777428, 0.120048, 1, 1, 1, 1, 1,
1.000662, -0.3144334, 1.278162, 1, 1, 1, 1, 1,
1.001485, 0.6885232, 2.192139, 1, 1, 1, 1, 1,
1.002323, -0.9293495, 1.091397, 1, 1, 1, 1, 1,
1.005397, 1.876424, 1.019332, 1, 1, 1, 1, 1,
1.015058, -0.1643997, 1.841969, 1, 1, 1, 1, 1,
1.015925, -0.4285991, 1.972337, 1, 1, 1, 1, 1,
1.027539, 0.1871683, 1.842019, 1, 1, 1, 1, 1,
1.030868, -1.158125, 1.201759, 1, 1, 1, 1, 1,
1.033408, -1.631121, 1.539883, 1, 1, 1, 1, 1,
1.033465, -0.1644385, 0.6890244, 1, 1, 1, 1, 1,
1.038292, -1.085399, 3.013818, 1, 1, 1, 1, 1,
1.042875, 0.3331845, 0.6923669, 0, 0, 1, 1, 1,
1.055917, -0.2425018, 1.094835, 1, 0, 0, 1, 1,
1.061185, -0.4742094, 1.813576, 1, 0, 0, 1, 1,
1.063813, -0.4997729, 2.048593, 1, 0, 0, 1, 1,
1.066507, -1.234374, 1.392327, 1, 0, 0, 1, 1,
1.06654, -0.7986797, 2.131304, 1, 0, 0, 1, 1,
1.067939, -0.474749, 0.7761438, 0, 0, 0, 1, 1,
1.070318, -2.007981, 2.726562, 0, 0, 0, 1, 1,
1.07192, 0.8523137, -0.03574406, 0, 0, 0, 1, 1,
1.074871, 0.8560831, 0.8500476, 0, 0, 0, 1, 1,
1.079782, -0.817057, 3.168993, 0, 0, 0, 1, 1,
1.080969, -0.1779026, 0.2633701, 0, 0, 0, 1, 1,
1.081034, 0.4015377, 0.6027738, 0, 0, 0, 1, 1,
1.083577, 0.2524587, 2.285289, 1, 1, 1, 1, 1,
1.093949, 0.985318, -1.132833, 1, 1, 1, 1, 1,
1.094404, -1.301444, 2.223115, 1, 1, 1, 1, 1,
1.112986, -0.6189992, 3.417305, 1, 1, 1, 1, 1,
1.116072, 0.1984518, 1.176946, 1, 1, 1, 1, 1,
1.118962, 1.225586, -0.6417853, 1, 1, 1, 1, 1,
1.127736, 0.003473211, 0.6531098, 1, 1, 1, 1, 1,
1.133815, 0.1174853, -0.2100163, 1, 1, 1, 1, 1,
1.140141, -0.5481564, 2.696084, 1, 1, 1, 1, 1,
1.141394, 0.2311905, 1.872063, 1, 1, 1, 1, 1,
1.148182, 0.8553515, 2.020939, 1, 1, 1, 1, 1,
1.149831, 0.3471636, 1.64849, 1, 1, 1, 1, 1,
1.159253, 1.839171, 0.3495839, 1, 1, 1, 1, 1,
1.160175, -1.422401, 3.12892, 1, 1, 1, 1, 1,
1.163665, 0.3626683, 0.9134885, 1, 1, 1, 1, 1,
1.17892, -0.9239237, 2.426682, 0, 0, 1, 1, 1,
1.200053, -0.5664697, 1.0624, 1, 0, 0, 1, 1,
1.209024, -0.3309285, 2.51806, 1, 0, 0, 1, 1,
1.21274, 0.2225613, 0.1324553, 1, 0, 0, 1, 1,
1.223069, -2.082751, 1.670476, 1, 0, 0, 1, 1,
1.226263, 0.8528966, 1.601654, 1, 0, 0, 1, 1,
1.226391, -0.2985966, 1.4622, 0, 0, 0, 1, 1,
1.231622, 1.325819, 0.6261901, 0, 0, 0, 1, 1,
1.235787, -0.3247696, 0.6826493, 0, 0, 0, 1, 1,
1.242403, 1.444958, 1.064462, 0, 0, 0, 1, 1,
1.250844, 0.5245838, 1.195317, 0, 0, 0, 1, 1,
1.251219, 1.252004, -0.1368944, 0, 0, 0, 1, 1,
1.25812, -1.586461, 1.734662, 0, 0, 0, 1, 1,
1.263148, -0.5948786, 3.034195, 1, 1, 1, 1, 1,
1.27741, -0.03975796, 1.486511, 1, 1, 1, 1, 1,
1.279543, -0.7967939, 1.81322, 1, 1, 1, 1, 1,
1.283668, -0.8187658, 2.345927, 1, 1, 1, 1, 1,
1.285206, 2.034088, 0.5298973, 1, 1, 1, 1, 1,
1.290739, 1.865393, 0.5166075, 1, 1, 1, 1, 1,
1.312754, -0.7804629, 2.972827, 1, 1, 1, 1, 1,
1.321392, 0.8235201, 2.944764, 1, 1, 1, 1, 1,
1.325073, 0.6576818, 3.207782, 1, 1, 1, 1, 1,
1.332655, -0.7307073, 2.589478, 1, 1, 1, 1, 1,
1.343893, 0.7075571, 0.8802381, 1, 1, 1, 1, 1,
1.346661, 1.542319, 0.2245819, 1, 1, 1, 1, 1,
1.368428, 0.2177625, -0.07724132, 1, 1, 1, 1, 1,
1.372831, -0.07779319, 1.313686, 1, 1, 1, 1, 1,
1.377503, 1.223431, 2.698789, 1, 1, 1, 1, 1,
1.379441, -2.001205, 1.651771, 0, 0, 1, 1, 1,
1.381145, 1.766125, 0.2780488, 1, 0, 0, 1, 1,
1.405237, 1.514147, 1.386066, 1, 0, 0, 1, 1,
1.406267, 1.075073, -0.8579131, 1, 0, 0, 1, 1,
1.407344, 1.054445, 0.549894, 1, 0, 0, 1, 1,
1.410178, 0.6487448, 2.102915, 1, 0, 0, 1, 1,
1.418939, 0.4060351, 0.3082532, 0, 0, 0, 1, 1,
1.457125, -0.4736627, 1.257517, 0, 0, 0, 1, 1,
1.459374, 0.1309001, 1.088261, 0, 0, 0, 1, 1,
1.460608, 0.07404767, 1.700398, 0, 0, 0, 1, 1,
1.466735, -1.56924, 2.303516, 0, 0, 0, 1, 1,
1.487714, -0.1687899, 1.746173, 0, 0, 0, 1, 1,
1.501662, 1.054933, -0.6693788, 0, 0, 0, 1, 1,
1.503433, 0.8178623, -0.2611139, 1, 1, 1, 1, 1,
1.508434, 1.451918, 2.133272, 1, 1, 1, 1, 1,
1.522471, -1.38546, 1.49335, 1, 1, 1, 1, 1,
1.527032, 0.5278007, 0.79706, 1, 1, 1, 1, 1,
1.536751, -1.393781, 2.763993, 1, 1, 1, 1, 1,
1.541368, 0.4560805, 1.459516, 1, 1, 1, 1, 1,
1.552576, -0.4616177, 0.7503349, 1, 1, 1, 1, 1,
1.578574, -0.1827842, 3.050325, 1, 1, 1, 1, 1,
1.592976, 0.1547903, 0.2940376, 1, 1, 1, 1, 1,
1.606161, 1.843636, 2.269915, 1, 1, 1, 1, 1,
1.611171, -1.914552, 2.302986, 1, 1, 1, 1, 1,
1.617853, 1.436914, 0.1557562, 1, 1, 1, 1, 1,
1.661295, 0.04592399, 2.516023, 1, 1, 1, 1, 1,
1.661607, 0.1222244, 0.7803635, 1, 1, 1, 1, 1,
1.669117, -0.8579325, 3.330482, 1, 1, 1, 1, 1,
1.694109, -1.412129, 1.832586, 0, 0, 1, 1, 1,
1.700513, 0.1697895, 1.961315, 1, 0, 0, 1, 1,
1.71261, -0.6746224, 1.673009, 1, 0, 0, 1, 1,
1.718389, -0.1472359, 2.504839, 1, 0, 0, 1, 1,
1.719205, 1.042356, 0.9265497, 1, 0, 0, 1, 1,
1.720922, 0.3509383, 2.586612, 1, 0, 0, 1, 1,
1.749292, 0.3908619, 0.7127276, 0, 0, 0, 1, 1,
1.752687, -0.8648814, 4.795063, 0, 0, 0, 1, 1,
1.764221, -1.383898, 1.933608, 0, 0, 0, 1, 1,
1.767319, -0.1924558, 0.1599347, 0, 0, 0, 1, 1,
1.773533, -0.6370167, 4.422252, 0, 0, 0, 1, 1,
1.791637, 1.133726, -0.3951764, 0, 0, 0, 1, 1,
1.828298, -0.3913209, 0.9421087, 0, 0, 0, 1, 1,
1.841088, -1.634716, 2.661646, 1, 1, 1, 1, 1,
1.854645, 0.1984567, 1.419839, 1, 1, 1, 1, 1,
1.87262, 1.544845, -0.2991299, 1, 1, 1, 1, 1,
1.874411, -0.0009547774, 3.248146, 1, 1, 1, 1, 1,
1.883639, 0.9332448, 1.229267, 1, 1, 1, 1, 1,
1.884193, -0.3779666, 1.576511, 1, 1, 1, 1, 1,
1.893762, 0.9613586, 2.083462, 1, 1, 1, 1, 1,
1.894249, -0.05843209, 1.688689, 1, 1, 1, 1, 1,
1.901915, -1.392464, 2.079046, 1, 1, 1, 1, 1,
1.922389, -0.0756333, 2.425148, 1, 1, 1, 1, 1,
1.930096, -0.8463078, 1.593391, 1, 1, 1, 1, 1,
1.935338, -0.7369189, 2.285595, 1, 1, 1, 1, 1,
1.961496, -1.379734, 3.09612, 1, 1, 1, 1, 1,
1.984432, 0.4180931, 1.429534, 1, 1, 1, 1, 1,
1.987455, -0.4610895, 0.2176099, 1, 1, 1, 1, 1,
1.989597, -0.8329568, 1.346704, 0, 0, 1, 1, 1,
1.994799, -0.7785973, 3.057882, 1, 0, 0, 1, 1,
1.999563, -1.086007, 1.863046, 1, 0, 0, 1, 1,
2.006729, -0.5935096, 1.769989, 1, 0, 0, 1, 1,
2.032314, -1.736842, 3.65418, 1, 0, 0, 1, 1,
2.08655, -0.8261232, 1.758125, 1, 0, 0, 1, 1,
2.093955, 1.380532, 1.725049, 0, 0, 0, 1, 1,
2.120116, 1.098193, 0.4706495, 0, 0, 0, 1, 1,
2.133026, 0.108355, 1.138386, 0, 0, 0, 1, 1,
2.277899, 1.284874, 0.3986934, 0, 0, 0, 1, 1,
2.278643, -0.751229, 2.550863, 0, 0, 0, 1, 1,
2.301651, 1.137535, -0.2850895, 0, 0, 0, 1, 1,
2.308996, 0.5999969, 0.8655251, 0, 0, 0, 1, 1,
2.315312, -0.3749165, 3.687515, 1, 1, 1, 1, 1,
2.389554, -0.4745826, 2.717184, 1, 1, 1, 1, 1,
2.398432, 0.9849166, 1.375171, 1, 1, 1, 1, 1,
2.614157, -0.8462679, 2.476418, 1, 1, 1, 1, 1,
2.691841, 0.5767761, 1.261996, 1, 1, 1, 1, 1,
3.028262, -1.037691, 2.335735, 1, 1, 1, 1, 1,
3.030666, 0.5113075, 0.8766142, 1, 1, 1, 1, 1
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
var radius = 10.08881;
var distance = 35.4365;
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
mvMatrix.translate( 0.5272233, -0.1856999, 0.8621895 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.4365);
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
