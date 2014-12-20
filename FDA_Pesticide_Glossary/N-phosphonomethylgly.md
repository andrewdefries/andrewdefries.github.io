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
-2.85525, 0.7317412, -1.109253, 1, 0, 0, 1,
-2.848276, -0.003376027, -0.8741807, 1, 0.007843138, 0, 1,
-2.649473, 0.8839432, 0.7356713, 1, 0.01176471, 0, 1,
-2.638825, 0.395252, 0.1738547, 1, 0.01960784, 0, 1,
-2.431013, -0.2279761, -2.278848, 1, 0.02352941, 0, 1,
-2.38998, -0.5614286, -1.558542, 1, 0.03137255, 0, 1,
-2.366519, 0.4246828, -1.918629, 1, 0.03529412, 0, 1,
-2.339708, 1.84922, 0.3450292, 1, 0.04313726, 0, 1,
-2.33828, 0.6997474, -0.214138, 1, 0.04705882, 0, 1,
-2.226109, -0.3955331, -0.8313743, 1, 0.05490196, 0, 1,
-2.226085, 0.7592208, -2.30489, 1, 0.05882353, 0, 1,
-2.225911, 0.251776, -3.300333, 1, 0.06666667, 0, 1,
-2.205542, 0.5190805, -3.232707, 1, 0.07058824, 0, 1,
-2.203727, 0.9345201, -0.9133397, 1, 0.07843138, 0, 1,
-2.196996, -0.353824, -2.923469, 1, 0.08235294, 0, 1,
-2.150574, 0.1284055, -1.164997, 1, 0.09019608, 0, 1,
-2.143538, 0.8851783, -0.375316, 1, 0.09411765, 0, 1,
-2.058836, -1.308977, -3.099042, 1, 0.1019608, 0, 1,
-2.047935, -2.761158, -2.685704, 1, 0.1098039, 0, 1,
-2.041444, -2.048544, -1.736217, 1, 0.1137255, 0, 1,
-2.040306, -0.6882246, -2.025279, 1, 0.1215686, 0, 1,
-2.031055, 0.5067329, -1.517838, 1, 0.1254902, 0, 1,
-2.017237, 3.095541, -0.2508606, 1, 0.1333333, 0, 1,
-1.987961, 0.7157338, -0.4810513, 1, 0.1372549, 0, 1,
-1.949076, -0.6315328, -2.238197, 1, 0.145098, 0, 1,
-1.941471, 0.40642, -1.695959, 1, 0.1490196, 0, 1,
-1.931272, -0.7813522, -0.997847, 1, 0.1568628, 0, 1,
-1.926124, -1.513415, -1.000715, 1, 0.1607843, 0, 1,
-1.883398, -0.6885421, -1.511124, 1, 0.1686275, 0, 1,
-1.879872, -0.5010827, -2.493767, 1, 0.172549, 0, 1,
-1.85631, -0.6644528, -2.473375, 1, 0.1803922, 0, 1,
-1.851238, -0.05890767, -2.590132, 1, 0.1843137, 0, 1,
-1.838997, -0.2928826, -2.033239, 1, 0.1921569, 0, 1,
-1.813754, 0.5628218, -0.5706851, 1, 0.1960784, 0, 1,
-1.801222, 1.338883, -0.8166776, 1, 0.2039216, 0, 1,
-1.792631, -1.09462, -1.968259, 1, 0.2117647, 0, 1,
-1.78703, 0.1283441, -0.31354, 1, 0.2156863, 0, 1,
-1.778611, -0.6350628, -3.584041, 1, 0.2235294, 0, 1,
-1.76566, 0.4743503, -2.030798, 1, 0.227451, 0, 1,
-1.762136, 0.8053311, -0.05358489, 1, 0.2352941, 0, 1,
-1.760158, -0.2343562, -1.953713, 1, 0.2392157, 0, 1,
-1.738956, 1.927965, -0.9632572, 1, 0.2470588, 0, 1,
-1.717899, -1.490705, -1.152248, 1, 0.2509804, 0, 1,
-1.699788, 0.1185453, -3.030506, 1, 0.2588235, 0, 1,
-1.697124, 0.8097318, -0.6464801, 1, 0.2627451, 0, 1,
-1.670326, -0.2266971, -2.241547, 1, 0.2705882, 0, 1,
-1.65139, -0.9874085, -3.781363, 1, 0.2745098, 0, 1,
-1.640224, -1.741071, -2.753775, 1, 0.282353, 0, 1,
-1.633856, 1.112415, -1.318706, 1, 0.2862745, 0, 1,
-1.630066, 0.668739, -0.42395, 1, 0.2941177, 0, 1,
-1.614938, -0.7508423, -1.894741, 1, 0.3019608, 0, 1,
-1.607796, 0.4824227, -2.284702, 1, 0.3058824, 0, 1,
-1.597696, -0.07596607, -3.36002, 1, 0.3137255, 0, 1,
-1.589628, -0.6514922, -1.605804, 1, 0.3176471, 0, 1,
-1.589481, 0.1262409, -0.7427982, 1, 0.3254902, 0, 1,
-1.574916, -1.14744, -1.725139, 1, 0.3294118, 0, 1,
-1.565022, -0.3141548, -1.826116, 1, 0.3372549, 0, 1,
-1.550406, 0.8608071, -1.257104, 1, 0.3411765, 0, 1,
-1.541092, -0.748882, -2.776326, 1, 0.3490196, 0, 1,
-1.540474, 1.865756, 0.5172362, 1, 0.3529412, 0, 1,
-1.517743, 1.992459, -3.185514, 1, 0.3607843, 0, 1,
-1.485361, 0.01707004, -1.621978, 1, 0.3647059, 0, 1,
-1.465389, 1.506416, 0.4667723, 1, 0.372549, 0, 1,
-1.46291, -0.1604235, -0.6215704, 1, 0.3764706, 0, 1,
-1.462121, 0.08588931, -1.564021, 1, 0.3843137, 0, 1,
-1.449555, -1.087003, -0.7311098, 1, 0.3882353, 0, 1,
-1.440491, -0.0005719182, -3.014984, 1, 0.3960784, 0, 1,
-1.440189, 0.4964336, 0.327002, 1, 0.4039216, 0, 1,
-1.433698, -0.09566578, -3.683291, 1, 0.4078431, 0, 1,
-1.416737, 0.2048174, -2.096982, 1, 0.4156863, 0, 1,
-1.412355, -0.003402635, -2.404958, 1, 0.4196078, 0, 1,
-1.399894, 0.5436462, -2.614774, 1, 0.427451, 0, 1,
-1.392703, 0.2717406, -3.628748, 1, 0.4313726, 0, 1,
-1.385781, 0.8705199, -0.9167588, 1, 0.4392157, 0, 1,
-1.385683, -1.721586, -2.710371, 1, 0.4431373, 0, 1,
-1.380845, 2.598827, 0.02710005, 1, 0.4509804, 0, 1,
-1.368556, -1.245874, -1.773701, 1, 0.454902, 0, 1,
-1.353743, -1.182472, -2.143353, 1, 0.4627451, 0, 1,
-1.353007, 0.0240726, -1.761918, 1, 0.4666667, 0, 1,
-1.349546, 0.2617728, -3.393881, 1, 0.4745098, 0, 1,
-1.348919, -1.6616, -2.554958, 1, 0.4784314, 0, 1,
-1.345785, -1.215485, -3.186857, 1, 0.4862745, 0, 1,
-1.336308, 0.6114061, -1.771364, 1, 0.4901961, 0, 1,
-1.332994, -0.6635841, -0.9228176, 1, 0.4980392, 0, 1,
-1.323782, 0.113828, -2.052877, 1, 0.5058824, 0, 1,
-1.320099, 1.202961, 0.6043839, 1, 0.509804, 0, 1,
-1.319253, 0.6301522, -1.398412, 1, 0.5176471, 0, 1,
-1.315418, -0.07688188, -3.221522, 1, 0.5215687, 0, 1,
-1.312955, -0.9096444, -1.062304, 1, 0.5294118, 0, 1,
-1.309868, 1.247848, -0.9002123, 1, 0.5333334, 0, 1,
-1.308487, 0.06248093, 0.5702478, 1, 0.5411765, 0, 1,
-1.292073, -1.616262, -3.317858, 1, 0.5450981, 0, 1,
-1.285372, -0.7116619, -0.5701328, 1, 0.5529412, 0, 1,
-1.281562, 1.656463, -1.084471, 1, 0.5568628, 0, 1,
-1.280056, -1.332389, -1.359693, 1, 0.5647059, 0, 1,
-1.271943, -0.5207271, -2.254681, 1, 0.5686275, 0, 1,
-1.262365, -0.8594155, -2.57991, 1, 0.5764706, 0, 1,
-1.254355, -0.2616325, -0.3715773, 1, 0.5803922, 0, 1,
-1.253333, -1.168095, -2.616244, 1, 0.5882353, 0, 1,
-1.2407, -0.4472578, -1.450857, 1, 0.5921569, 0, 1,
-1.238135, -1.189192, -2.283163, 1, 0.6, 0, 1,
-1.235767, 0.8315995, -2.397553, 1, 0.6078432, 0, 1,
-1.23212, 0.7784867, -1.094108, 1, 0.6117647, 0, 1,
-1.231984, -0.06683201, -2.15968, 1, 0.6196079, 0, 1,
-1.227057, 0.1346126, -2.74469, 1, 0.6235294, 0, 1,
-1.215228, -0.2054539, -3.218895, 1, 0.6313726, 0, 1,
-1.214998, 0.6283915, 0.7052155, 1, 0.6352941, 0, 1,
-1.214538, 0.385932, -0.7712662, 1, 0.6431373, 0, 1,
-1.214304, -0.661961, -1.597566, 1, 0.6470588, 0, 1,
-1.213653, -0.4150286, -2.767292, 1, 0.654902, 0, 1,
-1.205397, 0.5271633, -0.763717, 1, 0.6588235, 0, 1,
-1.194421, 0.1096641, -1.376405, 1, 0.6666667, 0, 1,
-1.192583, -0.01595872, -0.5435483, 1, 0.6705883, 0, 1,
-1.178485, 0.3625952, 0.4147585, 1, 0.6784314, 0, 1,
-1.168448, -0.6262064, -0.2001299, 1, 0.682353, 0, 1,
-1.167676, -0.6891792, -2.503754, 1, 0.6901961, 0, 1,
-1.166999, -0.5998433, -1.941338, 1, 0.6941177, 0, 1,
-1.16353, -0.2895022, 0.03207619, 1, 0.7019608, 0, 1,
-1.162864, 1.055524, 2.544362, 1, 0.7098039, 0, 1,
-1.160935, -1.135892, -0.1615385, 1, 0.7137255, 0, 1,
-1.1599, 0.7119476, -0.178315, 1, 0.7215686, 0, 1,
-1.15358, 1.204081, -1.219261, 1, 0.7254902, 0, 1,
-1.152342, -1.324185, -2.126426, 1, 0.7333333, 0, 1,
-1.138783, -0.857785, -2.047539, 1, 0.7372549, 0, 1,
-1.138658, -0.9751911, -1.293317, 1, 0.7450981, 0, 1,
-1.136446, 0.464527, -0.5574819, 1, 0.7490196, 0, 1,
-1.122973, -0.6209347, -3.212593, 1, 0.7568628, 0, 1,
-1.122056, 0.3111749, -0.8877915, 1, 0.7607843, 0, 1,
-1.120092, -0.9948007, -2.989008, 1, 0.7686275, 0, 1,
-1.113055, -0.46173, -0.3613409, 1, 0.772549, 0, 1,
-1.111196, 0.7347415, -1.15195, 1, 0.7803922, 0, 1,
-1.110587, -0.17772, -0.7083943, 1, 0.7843137, 0, 1,
-1.105899, -0.825675, -1.758289, 1, 0.7921569, 0, 1,
-1.104203, -1.004308, -2.837401, 1, 0.7960784, 0, 1,
-1.10319, 1.531097, -0.03213248, 1, 0.8039216, 0, 1,
-1.102005, -0.1793869, -2.949535, 1, 0.8117647, 0, 1,
-1.095676, 1.121778, -0.8100047, 1, 0.8156863, 0, 1,
-1.095096, -1.237081, -2.182071, 1, 0.8235294, 0, 1,
-1.092103, -0.050017, -2.938583, 1, 0.827451, 0, 1,
-1.090077, 0.7590998, -0.5665795, 1, 0.8352941, 0, 1,
-1.08863, 0.06608132, -0.9070083, 1, 0.8392157, 0, 1,
-1.083555, 0.546507, -2.127622, 1, 0.8470588, 0, 1,
-1.081931, 0.225188, -2.239112, 1, 0.8509804, 0, 1,
-1.076559, 1.734496, 0.1105877, 1, 0.8588235, 0, 1,
-1.074575, 0.4237284, -2.445866, 1, 0.8627451, 0, 1,
-1.071238, 2.400445, 1.176281, 1, 0.8705882, 0, 1,
-1.069909, -1.161258, -1.85754, 1, 0.8745098, 0, 1,
-1.061481, -0.02363219, -1.498689, 1, 0.8823529, 0, 1,
-1.042379, 0.5066288, -1.671792, 1, 0.8862745, 0, 1,
-1.041669, -2.156162, -1.391954, 1, 0.8941177, 0, 1,
-1.040077, -0.5371863, -2.566899, 1, 0.8980392, 0, 1,
-1.039387, -3.397776, -2.819724, 1, 0.9058824, 0, 1,
-1.036449, 0.3766979, -1.858421, 1, 0.9137255, 0, 1,
-1.031873, 0.8285612, -1.053865, 1, 0.9176471, 0, 1,
-1.026785, -0.980269, -2.328789, 1, 0.9254902, 0, 1,
-1.024498, 1.919055, 0.259861, 1, 0.9294118, 0, 1,
-1.021652, 0.1955387, -0.9694648, 1, 0.9372549, 0, 1,
-1.021359, 1.849259, 0.4303833, 1, 0.9411765, 0, 1,
-1.020855, -0.690044, -1.852095, 1, 0.9490196, 0, 1,
-1.016063, 0.9728221, -1.275249, 1, 0.9529412, 0, 1,
-1.011624, -2.201006, -3.350746, 1, 0.9607843, 0, 1,
-1.001756, 1.103732, -0.4879299, 1, 0.9647059, 0, 1,
-0.9999849, -0.633444, -3.316265, 1, 0.972549, 0, 1,
-0.9952601, 0.4421479, -2.26591, 1, 0.9764706, 0, 1,
-0.9930357, -0.8320664, -1.669257, 1, 0.9843137, 0, 1,
-0.992352, 0.6796446, -1.054212, 1, 0.9882353, 0, 1,
-0.9888582, -0.8889887, -4.847736, 1, 0.9960784, 0, 1,
-0.9786729, -0.6175094, -1.677858, 0.9960784, 1, 0, 1,
-0.9768158, 0.8348861, -2.275065, 0.9921569, 1, 0, 1,
-0.9758164, 1.669744, -1.677426, 0.9843137, 1, 0, 1,
-0.9754866, -1.613828, -3.854454, 0.9803922, 1, 0, 1,
-0.9678345, -0.3059048, -1.743073, 0.972549, 1, 0, 1,
-0.9549174, -0.08509166, -1.916462, 0.9686275, 1, 0, 1,
-0.9525504, -0.5723296, -1.164607, 0.9607843, 1, 0, 1,
-0.9522252, -0.2806367, -2.118857, 0.9568627, 1, 0, 1,
-0.9496379, -0.4863394, -1.951096, 0.9490196, 1, 0, 1,
-0.9436798, -0.3936244, -1.478842, 0.945098, 1, 0, 1,
-0.9422174, -0.8430969, -1.859797, 0.9372549, 1, 0, 1,
-0.9391636, 0.09566085, -2.505346, 0.9333333, 1, 0, 1,
-0.937194, -0.1635039, -1.961756, 0.9254902, 1, 0, 1,
-0.9331672, -0.8308429, -1.767431, 0.9215686, 1, 0, 1,
-0.9304637, 0.7022477, -0.9956867, 0.9137255, 1, 0, 1,
-0.922215, -0.9762859, -2.075814, 0.9098039, 1, 0, 1,
-0.9204035, -0.9435353, -1.95352, 0.9019608, 1, 0, 1,
-0.9187344, -1.615114, -1.951342, 0.8941177, 1, 0, 1,
-0.9126199, 0.1400038, -1.66691, 0.8901961, 1, 0, 1,
-0.9055715, -0.8895118, -1.301706, 0.8823529, 1, 0, 1,
-0.9052376, -0.8764759, -0.8718345, 0.8784314, 1, 0, 1,
-0.9032003, 0.4572215, -2.311633, 0.8705882, 1, 0, 1,
-0.8997704, 0.5287849, 0.4476967, 0.8666667, 1, 0, 1,
-0.8989642, -1.701612, -2.229612, 0.8588235, 1, 0, 1,
-0.8961858, 1.294445, 0.8065796, 0.854902, 1, 0, 1,
-0.8952551, 0.1780011, -0.9516689, 0.8470588, 1, 0, 1,
-0.8908126, -1.143554, -1.055214, 0.8431373, 1, 0, 1,
-0.8902505, 0.3717095, -0.6713023, 0.8352941, 1, 0, 1,
-0.8852454, -1.637686, -0.2324714, 0.8313726, 1, 0, 1,
-0.8845469, 0.04134831, -0.00561812, 0.8235294, 1, 0, 1,
-0.8801336, 1.139653, -0.3244574, 0.8196079, 1, 0, 1,
-0.87935, -0.1970159, -2.329465, 0.8117647, 1, 0, 1,
-0.8715822, 1.151992, -0.8821329, 0.8078431, 1, 0, 1,
-0.8678123, -0.08228596, -1.465614, 0.8, 1, 0, 1,
-0.8656527, -1.283159, -3.006938, 0.7921569, 1, 0, 1,
-0.8633592, -0.07661513, -0.6615242, 0.7882353, 1, 0, 1,
-0.8606206, -0.2766305, -1.632738, 0.7803922, 1, 0, 1,
-0.8501605, -0.6974992, -1.338848, 0.7764706, 1, 0, 1,
-0.8478538, -0.8079755, -2.148203, 0.7686275, 1, 0, 1,
-0.847604, -0.4048073, -2.615799, 0.7647059, 1, 0, 1,
-0.8455986, -0.4377586, -1.072989, 0.7568628, 1, 0, 1,
-0.8385233, 0.5325897, -0.1590629, 0.7529412, 1, 0, 1,
-0.8350928, -1.497792, -2.009542, 0.7450981, 1, 0, 1,
-0.8336987, 0.04187682, -1.344207, 0.7411765, 1, 0, 1,
-0.8324163, 0.5235375, 0.3534776, 0.7333333, 1, 0, 1,
-0.8318789, 1.088869, -1.174875, 0.7294118, 1, 0, 1,
-0.8315183, 1.103314, -0.2528732, 0.7215686, 1, 0, 1,
-0.8236697, -0.8323178, -2.397523, 0.7176471, 1, 0, 1,
-0.8166891, 0.6148201, -1.295864, 0.7098039, 1, 0, 1,
-0.8164542, 0.4045776, -2.212658, 0.7058824, 1, 0, 1,
-0.816013, 1.189376, -1.353714, 0.6980392, 1, 0, 1,
-0.8108264, 1.980118, -0.7693723, 0.6901961, 1, 0, 1,
-0.8084071, -1.252082, -3.4969, 0.6862745, 1, 0, 1,
-0.8081104, 0.5024591, -0.6569023, 0.6784314, 1, 0, 1,
-0.8053489, -0.484697, -2.950718, 0.6745098, 1, 0, 1,
-0.803301, 0.4661705, -1.795205, 0.6666667, 1, 0, 1,
-0.8014581, 1.078067, -1.46525, 0.6627451, 1, 0, 1,
-0.8007577, -0.6946838, -3.104242, 0.654902, 1, 0, 1,
-0.8001645, -1.290656, -3.281191, 0.6509804, 1, 0, 1,
-0.7968047, 0.3577942, -1.813011, 0.6431373, 1, 0, 1,
-0.793839, 2.094839, -1.134268, 0.6392157, 1, 0, 1,
-0.7937526, 1.049714, -1.608716, 0.6313726, 1, 0, 1,
-0.7892249, 0.6135706, -1.620108, 0.627451, 1, 0, 1,
-0.7862549, 0.3297587, -2.831614, 0.6196079, 1, 0, 1,
-0.7820455, 0.06372074, -1.443917, 0.6156863, 1, 0, 1,
-0.781049, -0.7959899, -3.381921, 0.6078432, 1, 0, 1,
-0.7807729, 0.03924821, -1.250887, 0.6039216, 1, 0, 1,
-0.7798559, 1.129021, -1.053764, 0.5960785, 1, 0, 1,
-0.7753167, 0.5303326, -1.173962, 0.5882353, 1, 0, 1,
-0.7704488, -1.138212, -1.809039, 0.5843138, 1, 0, 1,
-0.7685042, 0.7338953, -0.3080734, 0.5764706, 1, 0, 1,
-0.7648048, -1.299818, -2.686936, 0.572549, 1, 0, 1,
-0.7568838, -0.08650301, -2.045565, 0.5647059, 1, 0, 1,
-0.7545414, 1.187356, 0.8690211, 0.5607843, 1, 0, 1,
-0.7516987, -0.2136616, -2.426313, 0.5529412, 1, 0, 1,
-0.7473812, -0.3974232, -3.644576, 0.5490196, 1, 0, 1,
-0.7468457, 0.1169837, -1.509664, 0.5411765, 1, 0, 1,
-0.7413436, 0.02050049, -2.756279, 0.5372549, 1, 0, 1,
-0.7407916, 0.7020069, -0.3955914, 0.5294118, 1, 0, 1,
-0.7407079, 1.057199, 0.03077286, 0.5254902, 1, 0, 1,
-0.7401546, -0.1396573, -1.642701, 0.5176471, 1, 0, 1,
-0.7394548, -0.06515303, -0.2476428, 0.5137255, 1, 0, 1,
-0.7364017, 0.2352144, -0.9266396, 0.5058824, 1, 0, 1,
-0.7350367, -0.3304015, -2.671633, 0.5019608, 1, 0, 1,
-0.7285151, 1.09791, 1.595252, 0.4941176, 1, 0, 1,
-0.7283189, 0.927773, -1.494916, 0.4862745, 1, 0, 1,
-0.7282286, -0.6542982, -2.367832, 0.4823529, 1, 0, 1,
-0.7280577, -0.6974406, -1.350799, 0.4745098, 1, 0, 1,
-0.7232293, 1.322455, -1.14322, 0.4705882, 1, 0, 1,
-0.7231341, -0.6425643, -2.283717, 0.4627451, 1, 0, 1,
-0.721779, -2.01402, -1.780978, 0.4588235, 1, 0, 1,
-0.7190171, -2.354784, -2.198184, 0.4509804, 1, 0, 1,
-0.7115516, 1.261841, -1.21326, 0.4470588, 1, 0, 1,
-0.7095526, -0.8332321, -3.596694, 0.4392157, 1, 0, 1,
-0.7078831, 0.2040813, -2.299942, 0.4352941, 1, 0, 1,
-0.707154, 0.08339062, -1.384529, 0.427451, 1, 0, 1,
-0.7068174, 2.120131, -0.8661086, 0.4235294, 1, 0, 1,
-0.7064923, -0.9986664, -1.308, 0.4156863, 1, 0, 1,
-0.7062374, 1.727303, -1.038007, 0.4117647, 1, 0, 1,
-0.7048844, 0.4698321, -1.09314, 0.4039216, 1, 0, 1,
-0.7025216, 0.3457828, -0.956251, 0.3960784, 1, 0, 1,
-0.7011418, -2.095418, -1.976672, 0.3921569, 1, 0, 1,
-0.7004485, 1.048993, -0.6582022, 0.3843137, 1, 0, 1,
-0.7002396, -1.394313, -4.977865, 0.3803922, 1, 0, 1,
-0.6999726, 0.8857765, -0.2516458, 0.372549, 1, 0, 1,
-0.6992643, -0.277326, -2.144876, 0.3686275, 1, 0, 1,
-0.6982114, 1.165186, -3.306542, 0.3607843, 1, 0, 1,
-0.6959675, 0.2456334, -2.079393, 0.3568628, 1, 0, 1,
-0.695448, 0.1317545, -3.182973, 0.3490196, 1, 0, 1,
-0.6926858, 0.8185689, -1.312121, 0.345098, 1, 0, 1,
-0.6901521, -0.5889353, -1.911628, 0.3372549, 1, 0, 1,
-0.6882498, 0.3970005, -0.4726669, 0.3333333, 1, 0, 1,
-0.6833557, 2.090612, -0.8528754, 0.3254902, 1, 0, 1,
-0.6829156, -1.321028, -2.612041, 0.3215686, 1, 0, 1,
-0.6798779, -1.063049, -2.841203, 0.3137255, 1, 0, 1,
-0.678044, 0.9435645, -1.841348, 0.3098039, 1, 0, 1,
-0.6681955, -0.4994775, -3.27725, 0.3019608, 1, 0, 1,
-0.667778, 0.01512457, -0.8074034, 0.2941177, 1, 0, 1,
-0.6666298, -0.4062319, -1.956467, 0.2901961, 1, 0, 1,
-0.6644976, 0.1762705, -1.239241, 0.282353, 1, 0, 1,
-0.6627691, -0.1668051, -3.023158, 0.2784314, 1, 0, 1,
-0.6584095, -1.566521, -2.135194, 0.2705882, 1, 0, 1,
-0.6576099, -1.802667, -2.126019, 0.2666667, 1, 0, 1,
-0.6576073, 1.109256, 1.06525, 0.2588235, 1, 0, 1,
-0.6556799, 0.7982297, 0.7532343, 0.254902, 1, 0, 1,
-0.6526556, 0.7955774, 1.455606, 0.2470588, 1, 0, 1,
-0.6522554, 1.096212, -1.563871, 0.2431373, 1, 0, 1,
-0.6498625, -1.802336, -3.682224, 0.2352941, 1, 0, 1,
-0.6493471, 0.01062978, -1.768614, 0.2313726, 1, 0, 1,
-0.6456219, -1.230927, -2.766574, 0.2235294, 1, 0, 1,
-0.6322017, -1.051049, -2.16955, 0.2196078, 1, 0, 1,
-0.6304551, -0.08022389, -3.23503, 0.2117647, 1, 0, 1,
-0.6260964, -1.698149, -1.884555, 0.2078431, 1, 0, 1,
-0.617758, -1.084316, -3.581783, 0.2, 1, 0, 1,
-0.6168361, -0.1933556, -0.8741077, 0.1921569, 1, 0, 1,
-0.6148944, 0.0924236, -0.2173442, 0.1882353, 1, 0, 1,
-0.6147005, 0.8367467, -0.1076104, 0.1803922, 1, 0, 1,
-0.6135466, -0.5866126, -2.605919, 0.1764706, 1, 0, 1,
-0.6098272, 0.4188729, -0.303712, 0.1686275, 1, 0, 1,
-0.6035179, -0.2271462, -1.030091, 0.1647059, 1, 0, 1,
-0.6028181, 0.9471841, -0.7274879, 0.1568628, 1, 0, 1,
-0.5972888, -0.1377367, -1.845043, 0.1529412, 1, 0, 1,
-0.5963998, -0.1937742, -1.049265, 0.145098, 1, 0, 1,
-0.594909, 0.02017352, -0.2912278, 0.1411765, 1, 0, 1,
-0.5940694, -0.07642449, -1.955895, 0.1333333, 1, 0, 1,
-0.5910308, -1.184862, -0.7061372, 0.1294118, 1, 0, 1,
-0.5907069, -1.03752, -0.8397159, 0.1215686, 1, 0, 1,
-0.5893849, -1.967289, -3.134638, 0.1176471, 1, 0, 1,
-0.5890826, -0.2285495, -1.580396, 0.1098039, 1, 0, 1,
-0.5872079, -0.5943369, -2.193236, 0.1058824, 1, 0, 1,
-0.586962, -2.256674, -3.256113, 0.09803922, 1, 0, 1,
-0.580868, -0.9220625, -3.52926, 0.09019608, 1, 0, 1,
-0.5791007, -0.574835, -2.750565, 0.08627451, 1, 0, 1,
-0.5790388, -0.765873, -1.571979, 0.07843138, 1, 0, 1,
-0.5773745, -0.7120149, -0.5737146, 0.07450981, 1, 0, 1,
-0.5768195, 0.5737712, -0.1235674, 0.06666667, 1, 0, 1,
-0.5734652, -0.8405018, -3.801888, 0.0627451, 1, 0, 1,
-0.5723417, -0.4031698, -2.415444, 0.05490196, 1, 0, 1,
-0.5720777, 0.03608296, -1.161881, 0.05098039, 1, 0, 1,
-0.5715449, -0.8238262, -2.608159, 0.04313726, 1, 0, 1,
-0.5704495, -0.8820143, -2.546219, 0.03921569, 1, 0, 1,
-0.5658057, -0.7235568, -1.145295, 0.03137255, 1, 0, 1,
-0.5621251, 0.5477595, 0.0230088, 0.02745098, 1, 0, 1,
-0.5588613, 0.3942672, 0.3636335, 0.01960784, 1, 0, 1,
-0.5582278, -0.9568828, -3.939134, 0.01568628, 1, 0, 1,
-0.5522547, -0.770783, -3.692279, 0.007843138, 1, 0, 1,
-0.5493744, -0.3774891, -2.001392, 0.003921569, 1, 0, 1,
-0.5466139, -1.05986, -2.566889, 0, 1, 0.003921569, 1,
-0.5435217, 0.2709323, -1.808258, 0, 1, 0.01176471, 1,
-0.5430897, -0.8107912, -1.201526, 0, 1, 0.01568628, 1,
-0.5423083, 1.029157, -0.6194093, 0, 1, 0.02352941, 1,
-0.5338301, 0.5437284, -0.7586309, 0, 1, 0.02745098, 1,
-0.5321731, 1.046045, 1.129396, 0, 1, 0.03529412, 1,
-0.5275715, 0.2313797, 0.63416, 0, 1, 0.03921569, 1,
-0.5194154, -2.021718, -0.6050528, 0, 1, 0.04705882, 1,
-0.5177546, -0.7217021, -2.500558, 0, 1, 0.05098039, 1,
-0.5155084, -0.6895978, -1.910606, 0, 1, 0.05882353, 1,
-0.513455, 1.118094, -1.678807, 0, 1, 0.0627451, 1,
-0.5092725, 0.8718863, -0.2347596, 0, 1, 0.07058824, 1,
-0.5083366, 0.4811162, -0.269126, 0, 1, 0.07450981, 1,
-0.5068936, 0.7908159, -0.7621723, 0, 1, 0.08235294, 1,
-0.4972157, 0.0688241, 0.2338153, 0, 1, 0.08627451, 1,
-0.4951752, 2.168788, -0.293456, 0, 1, 0.09411765, 1,
-0.4918303, 1.815231, -0.76664, 0, 1, 0.1019608, 1,
-0.4895817, 0.6626086, 0.4307604, 0, 1, 0.1058824, 1,
-0.488546, 0.001730841, -3.046144, 0, 1, 0.1137255, 1,
-0.4818347, -0.4553093, -1.592089, 0, 1, 0.1176471, 1,
-0.4785779, 0.3950972, -0.630293, 0, 1, 0.1254902, 1,
-0.4767257, 0.6687679, -0.2603756, 0, 1, 0.1294118, 1,
-0.4732207, 0.01807556, -2.040845, 0, 1, 0.1372549, 1,
-0.4731452, -0.1092239, -0.3985013, 0, 1, 0.1411765, 1,
-0.4595631, -0.9504576, -1.022569, 0, 1, 0.1490196, 1,
-0.4588222, -0.6804318, -2.46761, 0, 1, 0.1529412, 1,
-0.4576503, 0.2289537, -1.376213, 0, 1, 0.1607843, 1,
-0.4547813, -0.06612634, -0.5603286, 0, 1, 0.1647059, 1,
-0.4507623, 0.1206591, -2.481328, 0, 1, 0.172549, 1,
-0.4475083, 2.262626, 0.9360198, 0, 1, 0.1764706, 1,
-0.4445868, 0.02633201, -1.08514, 0, 1, 0.1843137, 1,
-0.4407545, 0.06516219, -3.003346, 0, 1, 0.1882353, 1,
-0.4344784, 0.3179991, -1.657852, 0, 1, 0.1960784, 1,
-0.4302365, -0.5903585, -1.789317, 0, 1, 0.2039216, 1,
-0.4220264, 0.252956, 0.2712551, 0, 1, 0.2078431, 1,
-0.4189776, -1.167449, -4.018698, 0, 1, 0.2156863, 1,
-0.412832, -0.7499747, -1.432443, 0, 1, 0.2196078, 1,
-0.4063278, 0.2851759, 0.3862014, 0, 1, 0.227451, 1,
-0.4007982, -0.1864154, -1.94827, 0, 1, 0.2313726, 1,
-0.3900048, 0.777244, -0.7421522, 0, 1, 0.2392157, 1,
-0.3887356, 0.2309821, -0.1324531, 0, 1, 0.2431373, 1,
-0.3856141, -1.059148, -3.612224, 0, 1, 0.2509804, 1,
-0.3840158, -0.2055396, -2.101645, 0, 1, 0.254902, 1,
-0.3828851, -1.387444, -3.166423, 0, 1, 0.2627451, 1,
-0.379262, 0.2407111, 0.06257275, 0, 1, 0.2666667, 1,
-0.3790928, 1.206496, -0.6847857, 0, 1, 0.2745098, 1,
-0.3742583, -0.5923706, -2.95043, 0, 1, 0.2784314, 1,
-0.3731806, -0.7828406, -2.681712, 0, 1, 0.2862745, 1,
-0.368764, -0.02107777, -0.08338124, 0, 1, 0.2901961, 1,
-0.3648236, -1.410259, -5.048985, 0, 1, 0.2980392, 1,
-0.3564113, 0.01868662, -1.213024, 0, 1, 0.3058824, 1,
-0.3549825, -1.006954, -1.788896, 0, 1, 0.3098039, 1,
-0.3521656, -1.364632, -2.166217, 0, 1, 0.3176471, 1,
-0.3515415, 1.830765, -0.8692261, 0, 1, 0.3215686, 1,
-0.347316, 0.06776026, -0.6986602, 0, 1, 0.3294118, 1,
-0.3428927, 0.7394695, -0.6412982, 0, 1, 0.3333333, 1,
-0.341076, 0.5230555, 0.1069592, 0, 1, 0.3411765, 1,
-0.3376261, 0.703617, 0.2507943, 0, 1, 0.345098, 1,
-0.3373722, -1.864916, -3.07463, 0, 1, 0.3529412, 1,
-0.3368792, 1.229248, 0.1280823, 0, 1, 0.3568628, 1,
-0.3339621, -0.4954783, -3.030936, 0, 1, 0.3647059, 1,
-0.3322729, 0.01997146, -1.76362, 0, 1, 0.3686275, 1,
-0.3253345, -0.1169296, -0.04549572, 0, 1, 0.3764706, 1,
-0.3240101, 1.564473, 0.9137602, 0, 1, 0.3803922, 1,
-0.3153219, 0.4943342, -1.2844, 0, 1, 0.3882353, 1,
-0.3132002, 0.4429796, -0.8464679, 0, 1, 0.3921569, 1,
-0.3102886, 1.034446, -1.188185, 0, 1, 0.4, 1,
-0.3091405, 2.257484, -0.2327259, 0, 1, 0.4078431, 1,
-0.3069463, 1.189816, -0.9741311, 0, 1, 0.4117647, 1,
-0.3031805, -0.4851635, -1.424914, 0, 1, 0.4196078, 1,
-0.302379, 1.267872, -0.9792637, 0, 1, 0.4235294, 1,
-0.2971286, 1.235705, -0.2983595, 0, 1, 0.4313726, 1,
-0.295904, 0.06615435, -1.902134, 0, 1, 0.4352941, 1,
-0.2952231, 1.290773, 1.29811, 0, 1, 0.4431373, 1,
-0.2917226, 0.09078325, -3.755308, 0, 1, 0.4470588, 1,
-0.2895859, 0.760231, 0.1101825, 0, 1, 0.454902, 1,
-0.2859941, 2.207753, -0.3937536, 0, 1, 0.4588235, 1,
-0.2839554, 0.6482854, -1.378177, 0, 1, 0.4666667, 1,
-0.2812646, 1.619533, -0.4013927, 0, 1, 0.4705882, 1,
-0.2794637, -0.4992954, -2.285794, 0, 1, 0.4784314, 1,
-0.2790549, 0.2164578, -0.4026005, 0, 1, 0.4823529, 1,
-0.277081, -1.009606, -0.3358009, 0, 1, 0.4901961, 1,
-0.2740852, -1.486227, -3.334741, 0, 1, 0.4941176, 1,
-0.2714318, 0.1659015, -3.226021, 0, 1, 0.5019608, 1,
-0.2694508, -2.019201, -3.154219, 0, 1, 0.509804, 1,
-0.2685024, 0.1938449, -1.192245, 0, 1, 0.5137255, 1,
-0.2657441, 1.409491, -0.9527037, 0, 1, 0.5215687, 1,
-0.2632964, 1.961501, -1.631204, 0, 1, 0.5254902, 1,
-0.2548066, 0.247026, -1.131248, 0, 1, 0.5333334, 1,
-0.2380314, -0.5405999, -2.861782, 0, 1, 0.5372549, 1,
-0.2370711, -2.69775, -3.717514, 0, 1, 0.5450981, 1,
-0.2365905, 0.589184, 0.1170937, 0, 1, 0.5490196, 1,
-0.2363184, -1.654071, -3.7974, 0, 1, 0.5568628, 1,
-0.236214, 0.245359, -0.2290522, 0, 1, 0.5607843, 1,
-0.2304215, -0.961118, -0.7848338, 0, 1, 0.5686275, 1,
-0.2285755, 1.380604, 0.149159, 0, 1, 0.572549, 1,
-0.2252336, -0.2930662, -2.460029, 0, 1, 0.5803922, 1,
-0.2195435, -0.4574011, -3.689377, 0, 1, 0.5843138, 1,
-0.2190303, -0.3177004, -2.840135, 0, 1, 0.5921569, 1,
-0.2174484, -0.7907846, -3.77885, 0, 1, 0.5960785, 1,
-0.2036178, 0.04659081, -1.583357, 0, 1, 0.6039216, 1,
-0.1997245, 1.214886, -0.05617838, 0, 1, 0.6117647, 1,
-0.1992767, -1.792826, -2.183448, 0, 1, 0.6156863, 1,
-0.1973442, -0.1097361, -3.362317, 0, 1, 0.6235294, 1,
-0.1914884, 0.5806646, -0.1553392, 0, 1, 0.627451, 1,
-0.189528, -0.04317045, -2.944593, 0, 1, 0.6352941, 1,
-0.1884186, 0.02393075, -0.8497117, 0, 1, 0.6392157, 1,
-0.1880298, 0.937702, -0.9843351, 0, 1, 0.6470588, 1,
-0.1864893, -0.2509784, -2.356808, 0, 1, 0.6509804, 1,
-0.1864043, -0.424982, -2.229284, 0, 1, 0.6588235, 1,
-0.1827713, -1.408961, -3.595938, 0, 1, 0.6627451, 1,
-0.1800132, 1.984617, -0.6829773, 0, 1, 0.6705883, 1,
-0.1761831, 0.3494782, 1.10074, 0, 1, 0.6745098, 1,
-0.1754799, 1.502853, -0.2689638, 0, 1, 0.682353, 1,
-0.1729965, 0.5608068, -1.470729, 0, 1, 0.6862745, 1,
-0.1698749, -0.1258391, -1.738913, 0, 1, 0.6941177, 1,
-0.1691058, 0.1625024, -1.734306, 0, 1, 0.7019608, 1,
-0.1679906, 0.7691357, 1.5575, 0, 1, 0.7058824, 1,
-0.1666433, 0.4268091, -0.8201054, 0, 1, 0.7137255, 1,
-0.1587962, 0.652929, -0.02244108, 0, 1, 0.7176471, 1,
-0.1546683, -0.6749725, -3.658269, 0, 1, 0.7254902, 1,
-0.1543039, -0.1590051, -2.213386, 0, 1, 0.7294118, 1,
-0.1488855, -2.038435, -4.001651, 0, 1, 0.7372549, 1,
-0.146347, 2.097665, -0.3283397, 0, 1, 0.7411765, 1,
-0.1460693, -0.2243182, -1.947962, 0, 1, 0.7490196, 1,
-0.1390037, -0.3120231, -2.913597, 0, 1, 0.7529412, 1,
-0.1383537, -0.8919398, -5.14825, 0, 1, 0.7607843, 1,
-0.1332398, 0.81723, -0.7228876, 0, 1, 0.7647059, 1,
-0.1331985, -0.4341381, -2.159044, 0, 1, 0.772549, 1,
-0.1314705, 0.8848647, 0.2358939, 0, 1, 0.7764706, 1,
-0.1296811, 0.2461316, -1.577355, 0, 1, 0.7843137, 1,
-0.1291896, 0.8284374, 0.2373121, 0, 1, 0.7882353, 1,
-0.1283631, -0.9640203, -1.509927, 0, 1, 0.7960784, 1,
-0.1243696, 0.5238873, -0.04043985, 0, 1, 0.8039216, 1,
-0.1220038, -0.5535138, -2.10956, 0, 1, 0.8078431, 1,
-0.1209812, 0.7374439, -0.5932831, 0, 1, 0.8156863, 1,
-0.1155607, -1.342962, -1.84438, 0, 1, 0.8196079, 1,
-0.1152085, -1.731479, -3.352889, 0, 1, 0.827451, 1,
-0.1077294, 0.682608, -0.6548258, 0, 1, 0.8313726, 1,
-0.106711, 0.6017489, -1.203979, 0, 1, 0.8392157, 1,
-0.1037022, 0.2743748, 0.4385682, 0, 1, 0.8431373, 1,
-0.1032089, -0.9148195, -3.007373, 0, 1, 0.8509804, 1,
-0.09819585, -0.04037547, -1.141609, 0, 1, 0.854902, 1,
-0.09794542, -1.420496, -1.124455, 0, 1, 0.8627451, 1,
-0.09263449, -1.044982, -2.311559, 0, 1, 0.8666667, 1,
-0.08776306, 0.6258179, 0.5851154, 0, 1, 0.8745098, 1,
-0.08456443, -1.710351, -2.514609, 0, 1, 0.8784314, 1,
-0.07765366, -1.963391, -2.24526, 0, 1, 0.8862745, 1,
-0.07738448, 1.142125, 0.4119911, 0, 1, 0.8901961, 1,
-0.07007272, 0.8055417, 0.1724053, 0, 1, 0.8980392, 1,
-0.0700442, -1.061433, -3.075486, 0, 1, 0.9058824, 1,
-0.06941354, 0.4203835, -0.1885125, 0, 1, 0.9098039, 1,
-0.06933773, 0.7658306, -1.057887, 0, 1, 0.9176471, 1,
-0.06136173, -0.514909, -1.678041, 0, 1, 0.9215686, 1,
-0.06015957, 0.03225433, -0.0421866, 0, 1, 0.9294118, 1,
-0.05841353, 0.02604447, -0.7092489, 0, 1, 0.9333333, 1,
-0.057939, -1.266906, -4.092604, 0, 1, 0.9411765, 1,
-0.05774022, 0.8015876, -1.44422, 0, 1, 0.945098, 1,
-0.05737415, 0.2123053, -1.110486, 0, 1, 0.9529412, 1,
-0.05607944, 0.8066405, -0.721874, 0, 1, 0.9568627, 1,
-0.05510908, -0.9767207, -5.134425, 0, 1, 0.9647059, 1,
-0.05403834, -0.1680029, -1.181385, 0, 1, 0.9686275, 1,
-0.05238395, -0.5845695, -3.908839, 0, 1, 0.9764706, 1,
-0.05066873, -1.478964, -3.149461, 0, 1, 0.9803922, 1,
-0.04790071, 0.4286118, -0.1419964, 0, 1, 0.9882353, 1,
-0.04671948, -0.3793129, -3.952146, 0, 1, 0.9921569, 1,
-0.04425245, 0.9338995, 0.5364124, 0, 1, 1, 1,
-0.04378679, 0.2022064, -1.589624, 0, 0.9921569, 1, 1,
-0.03880063, 0.1691966, 0.4809746, 0, 0.9882353, 1, 1,
-0.03805331, 0.1519855, -1.019024, 0, 0.9803922, 1, 1,
-0.03511772, 1.121041, -1.682994, 0, 0.9764706, 1, 1,
-0.03355802, -0.5004893, -3.883842, 0, 0.9686275, 1, 1,
-0.02878766, -1.596501, -3.606906, 0, 0.9647059, 1, 1,
-0.02761364, 1.277354, -0.2653875, 0, 0.9568627, 1, 1,
-0.01834006, 0.1579435, 0.1473921, 0, 0.9529412, 1, 1,
-0.01345367, 1.515256, -0.7547516, 0, 0.945098, 1, 1,
-0.009636311, 0.4538674, -0.3954965, 0, 0.9411765, 1, 1,
-0.003015086, -0.0144433, -3.358542, 0, 0.9333333, 1, 1,
-0.002240107, 0.4260646, 0.7667106, 0, 0.9294118, 1, 1,
-0.001948682, -1.316927, -2.523007, 0, 0.9215686, 1, 1,
0.001865353, -0.2767241, 3.131035, 0, 0.9176471, 1, 1,
0.002478109, -0.6198449, 2.981186, 0, 0.9098039, 1, 1,
0.004370132, 0.02435012, 0.3260911, 0, 0.9058824, 1, 1,
0.007412394, -1.897605, 3.937254, 0, 0.8980392, 1, 1,
0.008182161, -0.07104964, 4.310949, 0, 0.8901961, 1, 1,
0.01030408, -0.1686604, 2.868562, 0, 0.8862745, 1, 1,
0.0125004, 2.091196, -0.9896598, 0, 0.8784314, 1, 1,
0.01457993, 0.300369, 1.162968, 0, 0.8745098, 1, 1,
0.01768885, -1.068999, 2.841681, 0, 0.8666667, 1, 1,
0.01826259, -0.3484268, 2.802164, 0, 0.8627451, 1, 1,
0.02219753, -0.1802911, 2.28442, 0, 0.854902, 1, 1,
0.02270082, 0.8931265, -0.2125884, 0, 0.8509804, 1, 1,
0.02474194, 1.558112, -0.5949428, 0, 0.8431373, 1, 1,
0.02604121, -1.07505, 2.975731, 0, 0.8392157, 1, 1,
0.03046846, 0.9148381, -0.07385197, 0, 0.8313726, 1, 1,
0.03085972, 0.01125181, 1.172354, 0, 0.827451, 1, 1,
0.03151866, 1.405304, -0.8009784, 0, 0.8196079, 1, 1,
0.03398973, -2.139605, 2.321784, 0, 0.8156863, 1, 1,
0.04701147, 0.1085149, 1.262849, 0, 0.8078431, 1, 1,
0.04723619, 0.4679661, -0.2994825, 0, 0.8039216, 1, 1,
0.04847853, -0.5073963, 2.446491, 0, 0.7960784, 1, 1,
0.05403119, -0.1644539, 4.32973, 0, 0.7882353, 1, 1,
0.05566819, -1.831406, 1.694911, 0, 0.7843137, 1, 1,
0.05742171, 1.306661, 0.9571562, 0, 0.7764706, 1, 1,
0.06475986, -0.94306, 2.797137, 0, 0.772549, 1, 1,
0.06662543, -0.09222053, 2.616641, 0, 0.7647059, 1, 1,
0.06980775, 0.2127728, 0.6710964, 0, 0.7607843, 1, 1,
0.07205962, -0.4228648, 5.281991, 0, 0.7529412, 1, 1,
0.07788306, -0.7570988, 2.473278, 0, 0.7490196, 1, 1,
0.07977212, -0.1761273, 3.365419, 0, 0.7411765, 1, 1,
0.08147026, -0.1060297, 1.765862, 0, 0.7372549, 1, 1,
0.08380973, -0.2548642, 2.305952, 0, 0.7294118, 1, 1,
0.08735836, -1.20383, 2.121734, 0, 0.7254902, 1, 1,
0.0885768, -1.450323, 3.855469, 0, 0.7176471, 1, 1,
0.0914849, 0.5575797, 1.34885, 0, 0.7137255, 1, 1,
0.09177681, -1.286379, 2.798357, 0, 0.7058824, 1, 1,
0.09310234, 0.8486975, 0.5478277, 0, 0.6980392, 1, 1,
0.09369438, -0.9131305, 4.020286, 0, 0.6941177, 1, 1,
0.09454788, -2.293292, 2.754949, 0, 0.6862745, 1, 1,
0.1023242, -0.5338723, 2.696682, 0, 0.682353, 1, 1,
0.108456, 1.447954, 1.051004, 0, 0.6745098, 1, 1,
0.1162066, -0.9358795, 3.569045, 0, 0.6705883, 1, 1,
0.1199556, -1.441017, 2.458753, 0, 0.6627451, 1, 1,
0.1223152, -0.8919077, 3.743304, 0, 0.6588235, 1, 1,
0.1271846, -0.9440205, 3.455293, 0, 0.6509804, 1, 1,
0.1284702, -0.8750462, 3.151983, 0, 0.6470588, 1, 1,
0.1286223, 0.2011449, -1.251796, 0, 0.6392157, 1, 1,
0.1432576, -1.101193, 3.277641, 0, 0.6352941, 1, 1,
0.14354, 1.231488, -0.5977811, 0, 0.627451, 1, 1,
0.1453784, -0.5908902, 3.207581, 0, 0.6235294, 1, 1,
0.1498297, 0.9624786, -0.9230762, 0, 0.6156863, 1, 1,
0.1499448, 0.8001767, 1.523711, 0, 0.6117647, 1, 1,
0.1533106, 0.8435427, 0.3244846, 0, 0.6039216, 1, 1,
0.154272, -2.142355, 2.395457, 0, 0.5960785, 1, 1,
0.155636, -0.3266619, 3.173676, 0, 0.5921569, 1, 1,
0.1576431, -2.105281, 2.266056, 0, 0.5843138, 1, 1,
0.1576898, -1.80558, 2.577286, 0, 0.5803922, 1, 1,
0.1584703, -0.2324159, 3.420357, 0, 0.572549, 1, 1,
0.1663852, 0.5629823, -1.239684, 0, 0.5686275, 1, 1,
0.1663993, -0.2099319, 3.512154, 0, 0.5607843, 1, 1,
0.1665819, -0.09070472, 1.220696, 0, 0.5568628, 1, 1,
0.169286, 1.851482, -0.05579235, 0, 0.5490196, 1, 1,
0.171523, -0.3198647, 1.782582, 0, 0.5450981, 1, 1,
0.1727252, 0.08591118, 0.9639987, 0, 0.5372549, 1, 1,
0.1754832, -0.8028816, 3.06798, 0, 0.5333334, 1, 1,
0.1755416, 0.7308661, 1.952714, 0, 0.5254902, 1, 1,
0.1783276, 0.2831516, 0.1457034, 0, 0.5215687, 1, 1,
0.1811213, 1.201193, 0.831705, 0, 0.5137255, 1, 1,
0.1843693, -1.027701, 4.521317, 0, 0.509804, 1, 1,
0.1875116, 0.07741849, 2.204801, 0, 0.5019608, 1, 1,
0.1887728, -0.7711104, 2.763499, 0, 0.4941176, 1, 1,
0.1940265, 0.00274043, -0.1374393, 0, 0.4901961, 1, 1,
0.1942703, -0.1471081, 2.708333, 0, 0.4823529, 1, 1,
0.194748, 0.3816883, 0.5708017, 0, 0.4784314, 1, 1,
0.1950954, 0.5652815, -1.942133, 0, 0.4705882, 1, 1,
0.195499, 0.4763916, -0.6878922, 0, 0.4666667, 1, 1,
0.1977726, -1.112979, 2.780265, 0, 0.4588235, 1, 1,
0.2038852, -1.336452, 4.031297, 0, 0.454902, 1, 1,
0.2054831, 1.079325, 0.8870663, 0, 0.4470588, 1, 1,
0.2088061, 0.1329992, -1.101645, 0, 0.4431373, 1, 1,
0.211006, 0.7161042, -0.1541273, 0, 0.4352941, 1, 1,
0.211898, 1.001255, 0.3438859, 0, 0.4313726, 1, 1,
0.2131202, 0.07707858, -0.8966622, 0, 0.4235294, 1, 1,
0.2150195, 2.294662, -0.6395803, 0, 0.4196078, 1, 1,
0.2169754, -0.06620399, 2.168577, 0, 0.4117647, 1, 1,
0.2174678, 1.284264, 2.370482, 0, 0.4078431, 1, 1,
0.2209017, 1.600853, -0.3104413, 0, 0.4, 1, 1,
0.2218421, 0.09568264, -0.177773, 0, 0.3921569, 1, 1,
0.22281, 0.7025365, -1.123926, 0, 0.3882353, 1, 1,
0.2284282, 0.6735269, 1.394841, 0, 0.3803922, 1, 1,
0.2328117, -0.9084145, 3.337261, 0, 0.3764706, 1, 1,
0.2328502, 1.856888, 0.3174503, 0, 0.3686275, 1, 1,
0.2341318, -0.9410958, 2.431794, 0, 0.3647059, 1, 1,
0.2347518, -0.1295296, 2.174427, 0, 0.3568628, 1, 1,
0.2357633, 1.24213, -0.4131963, 0, 0.3529412, 1, 1,
0.2386249, -0.9365184, 2.716492, 0, 0.345098, 1, 1,
0.2422175, -0.4003995, 2.46964, 0, 0.3411765, 1, 1,
0.2425006, -1.191861, 3.90362, 0, 0.3333333, 1, 1,
0.2436135, -0.78502, 3.327469, 0, 0.3294118, 1, 1,
0.2447108, -1.388234, 2.349196, 0, 0.3215686, 1, 1,
0.2461293, -0.06720001, 2.744255, 0, 0.3176471, 1, 1,
0.2485647, 1.474956, -0.8274932, 0, 0.3098039, 1, 1,
0.2555864, 0.2851053, -1.265513, 0, 0.3058824, 1, 1,
0.2567889, -0.5356443, 3.549974, 0, 0.2980392, 1, 1,
0.2631849, 0.6942212, -0.8943554, 0, 0.2901961, 1, 1,
0.2649338, -0.5895475, 2.961912, 0, 0.2862745, 1, 1,
0.2724401, 0.4152972, -0.2820936, 0, 0.2784314, 1, 1,
0.279709, -0.527442, 1.730007, 0, 0.2745098, 1, 1,
0.281168, 0.3100663, 1.769948, 0, 0.2666667, 1, 1,
0.289759, -0.7413805, 2.745896, 0, 0.2627451, 1, 1,
0.2988499, 0.1526877, 0.3850546, 0, 0.254902, 1, 1,
0.3002697, -0.6794224, 1.693999, 0, 0.2509804, 1, 1,
0.301744, 0.3489136, 0.5002986, 0, 0.2431373, 1, 1,
0.3040877, -0.7562379, 1.836501, 0, 0.2392157, 1, 1,
0.3051478, -0.232052, 2.212054, 0, 0.2313726, 1, 1,
0.3072107, -1.983025, 2.568908, 0, 0.227451, 1, 1,
0.3093098, -0.04462913, 1.147206, 0, 0.2196078, 1, 1,
0.3161748, -1.359481, 3.796997, 0, 0.2156863, 1, 1,
0.322744, 0.5195767, 1.123403, 0, 0.2078431, 1, 1,
0.3230292, 1.199173, 0.8011174, 0, 0.2039216, 1, 1,
0.323323, 1.042297, -0.5811666, 0, 0.1960784, 1, 1,
0.3239858, 0.4676659, 1.709716, 0, 0.1882353, 1, 1,
0.3248308, 2.15386, 1.940101, 0, 0.1843137, 1, 1,
0.3275726, 0.4898772, 0.9798998, 0, 0.1764706, 1, 1,
0.3284524, -0.02950733, 1.335102, 0, 0.172549, 1, 1,
0.3374783, -2.041875, 4.523817, 0, 0.1647059, 1, 1,
0.34053, 1.097666, 1.353985, 0, 0.1607843, 1, 1,
0.3444377, -0.9650549, 2.087388, 0, 0.1529412, 1, 1,
0.3476402, 1.736458, -0.631397, 0, 0.1490196, 1, 1,
0.3486608, -0.1274727, 0.5429636, 0, 0.1411765, 1, 1,
0.3539834, 0.8911678, -0.5327511, 0, 0.1372549, 1, 1,
0.3587661, -0.683922, 3.338218, 0, 0.1294118, 1, 1,
0.3589927, -0.2076556, 2.670621, 0, 0.1254902, 1, 1,
0.3678839, 1.358473, 1.327388, 0, 0.1176471, 1, 1,
0.3688951, -0.9737866, 2.014389, 0, 0.1137255, 1, 1,
0.3720461, -1.46088, 3.029498, 0, 0.1058824, 1, 1,
0.3783796, -0.8601615, 1.72952, 0, 0.09803922, 1, 1,
0.3789679, 0.4051347, 0.8468655, 0, 0.09411765, 1, 1,
0.3800213, -0.2698126, 1.310485, 0, 0.08627451, 1, 1,
0.3824982, 1.565642, 1.045664, 0, 0.08235294, 1, 1,
0.3840193, 0.301513, 0.910678, 0, 0.07450981, 1, 1,
0.3854063, 1.329945, 1.502254, 0, 0.07058824, 1, 1,
0.3923146, 1.242008, 1.579289, 0, 0.0627451, 1, 1,
0.3978336, -0.1004386, 2.83012, 0, 0.05882353, 1, 1,
0.3981113, 1.092841, -1.121836, 0, 0.05098039, 1, 1,
0.4002138, -0.3594843, 2.975061, 0, 0.04705882, 1, 1,
0.4070194, 0.09026624, -0.8341631, 0, 0.03921569, 1, 1,
0.4083866, 1.485746, -0.2614523, 0, 0.03529412, 1, 1,
0.4103926, 1.281463, 0.7827417, 0, 0.02745098, 1, 1,
0.411138, -0.02530161, 2.442459, 0, 0.02352941, 1, 1,
0.4126146, -1.697085, 3.66573, 0, 0.01568628, 1, 1,
0.4142086, 0.514549, 0.2312715, 0, 0.01176471, 1, 1,
0.4178984, 0.4285736, 1.015999, 0, 0.003921569, 1, 1,
0.4188375, -1.578933, 3.529816, 0.003921569, 0, 1, 1,
0.4207982, 0.04016939, 0.8492407, 0.007843138, 0, 1, 1,
0.4268013, -0.1843227, 0.7709044, 0.01568628, 0, 1, 1,
0.429401, 1.21673, 0.5117443, 0.01960784, 0, 1, 1,
0.43315, -0.1043574, 2.872851, 0.02745098, 0, 1, 1,
0.4377007, -0.4252629, 3.81194, 0.03137255, 0, 1, 1,
0.4397817, 1.196998, -1.028455, 0.03921569, 0, 1, 1,
0.4440505, -0.930702, 3.91359, 0.04313726, 0, 1, 1,
0.4452562, 0.4330412, 0.04936153, 0.05098039, 0, 1, 1,
0.4564791, -0.8618343, 0.9901628, 0.05490196, 0, 1, 1,
0.4615709, -1.910838, 2.542138, 0.0627451, 0, 1, 1,
0.4622914, -0.8477044, 2.822063, 0.06666667, 0, 1, 1,
0.4715017, 0.1074671, 1.770984, 0.07450981, 0, 1, 1,
0.4733555, -1.559111, 2.884647, 0.07843138, 0, 1, 1,
0.4752145, 1.34554, -1.733856, 0.08627451, 0, 1, 1,
0.4762054, -1.345906, 3.639483, 0.09019608, 0, 1, 1,
0.4777068, -0.6983404, 4.031444, 0.09803922, 0, 1, 1,
0.4790932, 0.381061, 1.4059, 0.1058824, 0, 1, 1,
0.4806246, -0.9357113, 2.179796, 0.1098039, 0, 1, 1,
0.4811277, -0.178202, -0.8123803, 0.1176471, 0, 1, 1,
0.490165, -0.4739873, 2.255893, 0.1215686, 0, 1, 1,
0.4931661, -1.414307, 2.817281, 0.1294118, 0, 1, 1,
0.4960172, 0.8374781, 1.177504, 0.1333333, 0, 1, 1,
0.5014957, -1.24457, 1.652896, 0.1411765, 0, 1, 1,
0.5019469, -0.7599824, 2.966398, 0.145098, 0, 1, 1,
0.5030727, -0.3524374, 2.094072, 0.1529412, 0, 1, 1,
0.5077195, 0.7284777, 0.9923655, 0.1568628, 0, 1, 1,
0.5139653, -1.053911, 1.454908, 0.1647059, 0, 1, 1,
0.5162252, -0.2062401, 0.5330017, 0.1686275, 0, 1, 1,
0.5163806, -0.1001835, 1.790024, 0.1764706, 0, 1, 1,
0.5164393, 0.05858056, 0.5994132, 0.1803922, 0, 1, 1,
0.5215653, 0.1395311, 2.548369, 0.1882353, 0, 1, 1,
0.5248998, 2.093835, 0.6725795, 0.1921569, 0, 1, 1,
0.5250906, -1.046863, 3.78205, 0.2, 0, 1, 1,
0.5274508, -0.0524146, 1.249495, 0.2078431, 0, 1, 1,
0.5319383, 1.11469, 0.7843009, 0.2117647, 0, 1, 1,
0.532163, 0.8053554, -0.3909952, 0.2196078, 0, 1, 1,
0.5438665, -0.4498505, 0.8777894, 0.2235294, 0, 1, 1,
0.5522128, 1.503881, 0.01958533, 0.2313726, 0, 1, 1,
0.5556824, 0.259613, -0.1277289, 0.2352941, 0, 1, 1,
0.5632031, 1.695688, -0.117906, 0.2431373, 0, 1, 1,
0.5642606, 2.548471, -0.9298787, 0.2470588, 0, 1, 1,
0.5696612, -1.227069, 1.878316, 0.254902, 0, 1, 1,
0.569719, -1.71764, 3.184804, 0.2588235, 0, 1, 1,
0.5700946, 0.4602842, 0.8992354, 0.2666667, 0, 1, 1,
0.570754, -0.957654, 2.713885, 0.2705882, 0, 1, 1,
0.5712909, 1.05244, -0.2085044, 0.2784314, 0, 1, 1,
0.5719271, -1.213405, 0.6968288, 0.282353, 0, 1, 1,
0.5723906, 0.3062844, 1.139145, 0.2901961, 0, 1, 1,
0.5752795, -0.8121798, 2.451613, 0.2941177, 0, 1, 1,
0.5759345, -1.795759, 1.656156, 0.3019608, 0, 1, 1,
0.5866432, 0.2562701, 0.2354623, 0.3098039, 0, 1, 1,
0.5884115, 0.1548551, 1.262323, 0.3137255, 0, 1, 1,
0.5887064, 2.262336, -0.1206884, 0.3215686, 0, 1, 1,
0.5906219, 0.1274311, 0.7120172, 0.3254902, 0, 1, 1,
0.5910695, 0.5641465, -0.8702909, 0.3333333, 0, 1, 1,
0.5917426, -0.09401365, 0.5852008, 0.3372549, 0, 1, 1,
0.5923387, -1.917996, 2.660718, 0.345098, 0, 1, 1,
0.5928498, 0.8423046, 1.098066, 0.3490196, 0, 1, 1,
0.593717, -0.5948579, 1.910411, 0.3568628, 0, 1, 1,
0.5963973, -0.05181017, 1.32597, 0.3607843, 0, 1, 1,
0.5975128, 1.028996, -0.5428908, 0.3686275, 0, 1, 1,
0.5988764, -0.4297639, 3.472763, 0.372549, 0, 1, 1,
0.5997501, 0.4660355, 1.56847, 0.3803922, 0, 1, 1,
0.6020575, -0.0403588, 1.766801, 0.3843137, 0, 1, 1,
0.6021508, -1.175553, 3.534585, 0.3921569, 0, 1, 1,
0.6034046, -0.6328476, 2.384168, 0.3960784, 0, 1, 1,
0.6036568, 1.028712, -0.0681154, 0.4039216, 0, 1, 1,
0.6055298, 0.05389817, 1.023341, 0.4117647, 0, 1, 1,
0.6157169, 0.5253665, -0.3627047, 0.4156863, 0, 1, 1,
0.6164215, -1.573305, 2.779531, 0.4235294, 0, 1, 1,
0.6170484, -1.310224, 2.472269, 0.427451, 0, 1, 1,
0.6249821, 0.1937797, 1.190642, 0.4352941, 0, 1, 1,
0.6256464, 2.062914, 0.297685, 0.4392157, 0, 1, 1,
0.6268803, 0.6519468, 0.2228141, 0.4470588, 0, 1, 1,
0.6293657, 1.018411, 1.823678, 0.4509804, 0, 1, 1,
0.6328406, 0.717823, 1.917593, 0.4588235, 0, 1, 1,
0.6366599, 0.7921746, -1.657899, 0.4627451, 0, 1, 1,
0.6376581, -1.206921, 2.537116, 0.4705882, 0, 1, 1,
0.6405699, -0.5388488, 4.083573, 0.4745098, 0, 1, 1,
0.6418232, -0.6850549, 2.460912, 0.4823529, 0, 1, 1,
0.6423337, 0.1153986, 0.2221406, 0.4862745, 0, 1, 1,
0.6506821, -0.07347593, 2.137451, 0.4941176, 0, 1, 1,
0.6507972, 0.8178858, 1.201594, 0.5019608, 0, 1, 1,
0.6513337, 0.8316359, 0.5427482, 0.5058824, 0, 1, 1,
0.6513405, -1.326446, 2.832929, 0.5137255, 0, 1, 1,
0.6520915, 1.37005, 0.08044953, 0.5176471, 0, 1, 1,
0.6550558, 0.948447, -1.580812, 0.5254902, 0, 1, 1,
0.6604563, 0.2206843, 0.1905955, 0.5294118, 0, 1, 1,
0.6616223, 0.2283063, -0.0955886, 0.5372549, 0, 1, 1,
0.6652745, 1.190202, -1.988389, 0.5411765, 0, 1, 1,
0.6666371, -1.544309, 3.459562, 0.5490196, 0, 1, 1,
0.6679663, 0.4158298, 3.348086, 0.5529412, 0, 1, 1,
0.6726738, -1.787717, 2.980311, 0.5607843, 0, 1, 1,
0.6735752, -0.02910649, 0.1927374, 0.5647059, 0, 1, 1,
0.6755687, -1.617828, 3.08373, 0.572549, 0, 1, 1,
0.6790667, -0.6811616, 3.149656, 0.5764706, 0, 1, 1,
0.6796044, 1.705595, 0.8757619, 0.5843138, 0, 1, 1,
0.683064, 0.6728789, -0.1082103, 0.5882353, 0, 1, 1,
0.686249, 0.4216022, 2.323968, 0.5960785, 0, 1, 1,
0.6878039, -0.7040043, 2.512284, 0.6039216, 0, 1, 1,
0.6949386, -1.729505, 4.625731, 0.6078432, 0, 1, 1,
0.7018267, 1.008037, 0.00322751, 0.6156863, 0, 1, 1,
0.7112216, 1.314704, 0.7827747, 0.6196079, 0, 1, 1,
0.7143674, -0.8012446, 3.870732, 0.627451, 0, 1, 1,
0.7199824, 0.8800145, 0.4542423, 0.6313726, 0, 1, 1,
0.7243003, 0.2640674, 1.849643, 0.6392157, 0, 1, 1,
0.7312166, 0.6285899, 1.880391, 0.6431373, 0, 1, 1,
0.7351609, -1.036911, 4.160352, 0.6509804, 0, 1, 1,
0.7515036, 0.2514878, 2.304333, 0.654902, 0, 1, 1,
0.7544231, -1.51391, 4.122375, 0.6627451, 0, 1, 1,
0.7619328, 1.250627, -0.1893918, 0.6666667, 0, 1, 1,
0.7620112, 1.021272, 2.366169, 0.6745098, 0, 1, 1,
0.7631173, 0.7302401, 1.694338, 0.6784314, 0, 1, 1,
0.7661807, -0.1928988, 0.7143993, 0.6862745, 0, 1, 1,
0.7764358, -0.8352109, 1.185311, 0.6901961, 0, 1, 1,
0.7775869, -0.5495042, 0.3248464, 0.6980392, 0, 1, 1,
0.7825924, -0.9444855, 1.723492, 0.7058824, 0, 1, 1,
0.782859, -1.456876, 3.231343, 0.7098039, 0, 1, 1,
0.7856911, 0.7025957, 1.239844, 0.7176471, 0, 1, 1,
0.7857656, 0.3046734, 1.498812, 0.7215686, 0, 1, 1,
0.7924353, 0.1677401, 3.109373, 0.7294118, 0, 1, 1,
0.7950477, 1.153785, -0.300239, 0.7333333, 0, 1, 1,
0.7968744, -1.435768, 1.621376, 0.7411765, 0, 1, 1,
0.7983769, -0.4626303, -0.1835378, 0.7450981, 0, 1, 1,
0.800015, -2.372576, 3.582184, 0.7529412, 0, 1, 1,
0.803219, 0.3660104, 1.126059, 0.7568628, 0, 1, 1,
0.8075902, -0.5905499, 3.391639, 0.7647059, 0, 1, 1,
0.809278, 0.05630909, -0.04483768, 0.7686275, 0, 1, 1,
0.8119951, -0.2797235, 2.132363, 0.7764706, 0, 1, 1,
0.8156382, -2.469423, 3.310221, 0.7803922, 0, 1, 1,
0.81576, -1.126865, 1.90792, 0.7882353, 0, 1, 1,
0.8189263, -2.47333, 2.56221, 0.7921569, 0, 1, 1,
0.8207853, 0.4538658, 1.788507, 0.8, 0, 1, 1,
0.8264348, -0.4633148, 1.299452, 0.8078431, 0, 1, 1,
0.8276549, -0.5810333, 2.545469, 0.8117647, 0, 1, 1,
0.8309758, -0.1825562, 3.1728, 0.8196079, 0, 1, 1,
0.8624212, -0.921604, 2.534973, 0.8235294, 0, 1, 1,
0.8635517, -1.332995, 3.318563, 0.8313726, 0, 1, 1,
0.8653489, 0.4515198, 1.757995, 0.8352941, 0, 1, 1,
0.8831254, -0.2944845, 1.697338, 0.8431373, 0, 1, 1,
0.8841388, -0.253884, 2.842433, 0.8470588, 0, 1, 1,
0.8861914, 0.4276285, 3.544677, 0.854902, 0, 1, 1,
0.8883759, -0.6030352, 0.5663997, 0.8588235, 0, 1, 1,
0.8913655, 0.15349, 3.468403, 0.8666667, 0, 1, 1,
0.8975778, -0.9441827, 2.94478, 0.8705882, 0, 1, 1,
0.8997465, -1.025553, 1.95841, 0.8784314, 0, 1, 1,
0.9054948, 0.9035501, 1.154037, 0.8823529, 0, 1, 1,
0.9066076, 1.517838, -0.06714426, 0.8901961, 0, 1, 1,
0.9164244, 1.107391, 0.1238581, 0.8941177, 0, 1, 1,
0.9215994, 1.590306, 0.7376179, 0.9019608, 0, 1, 1,
0.9226117, -0.7049685, 1.556857, 0.9098039, 0, 1, 1,
0.9413432, 1.475635, 0.4477598, 0.9137255, 0, 1, 1,
0.9428829, -1.130103, 2.557889, 0.9215686, 0, 1, 1,
0.9433789, -0.4503193, 1.378248, 0.9254902, 0, 1, 1,
0.96685, 0.06897867, 0.6126767, 0.9333333, 0, 1, 1,
0.9669093, 0.6857066, 1.666916, 0.9372549, 0, 1, 1,
0.9718034, 0.4229863, 0.184316, 0.945098, 0, 1, 1,
0.9740348, 0.06824187, 0.6128706, 0.9490196, 0, 1, 1,
0.9782196, -0.4491808, 1.206584, 0.9568627, 0, 1, 1,
0.981941, -0.3962503, 2.942565, 0.9607843, 0, 1, 1,
0.9826137, 0.8932329, 0.5770757, 0.9686275, 0, 1, 1,
0.9836687, 0.006311859, 2.749231, 0.972549, 0, 1, 1,
0.9879532, -0.9735544, 2.902382, 0.9803922, 0, 1, 1,
0.9949986, 1.16089, 0.329272, 0.9843137, 0, 1, 1,
0.9973385, -0.2096426, 0.5009231, 0.9921569, 0, 1, 1,
0.998193, 1.020018, -0.07243401, 0.9960784, 0, 1, 1,
1.004144, -0.2642262, 2.27933, 1, 0, 0.9960784, 1,
1.006679, -0.9852186, 2.791761, 1, 0, 0.9882353, 1,
1.008648, -1.073294, 1.122714, 1, 0, 0.9843137, 1,
1.008972, -1.509632, 3.523419, 1, 0, 0.9764706, 1,
1.014961, -0.3338415, 0.6787655, 1, 0, 0.972549, 1,
1.02569, 0.1399418, 1.590428, 1, 0, 0.9647059, 1,
1.029898, -1.105012, 2.488134, 1, 0, 0.9607843, 1,
1.033698, -1.643078, 0.2792988, 1, 0, 0.9529412, 1,
1.034918, 0.2820394, 1.762534, 1, 0, 0.9490196, 1,
1.035493, 1.294338, 1.091191, 1, 0, 0.9411765, 1,
1.038996, 2.007258, -0.4952341, 1, 0, 0.9372549, 1,
1.044795, -0.5507481, 2.996086, 1, 0, 0.9294118, 1,
1.050081, -0.04606162, 2.237521, 1, 0, 0.9254902, 1,
1.050714, 1.69592, 0.6610761, 1, 0, 0.9176471, 1,
1.053532, -0.4250475, 1.65633, 1, 0, 0.9137255, 1,
1.060863, -1.008417, 1.774971, 1, 0, 0.9058824, 1,
1.063081, -0.3787943, 2.060453, 1, 0, 0.9019608, 1,
1.06584, -1.511716, 0.9073673, 1, 0, 0.8941177, 1,
1.066644, -1.082772, 2.357311, 1, 0, 0.8862745, 1,
1.070729, 0.1654262, 2.021756, 1, 0, 0.8823529, 1,
1.072722, 0.8957651, 0.7102648, 1, 0, 0.8745098, 1,
1.075445, 0.2838773, 2.030877, 1, 0, 0.8705882, 1,
1.078883, 0.7562376, 0.2189056, 1, 0, 0.8627451, 1,
1.091452, -0.09549887, 2.680763, 1, 0, 0.8588235, 1,
1.095487, -0.888199, 3.188366, 1, 0, 0.8509804, 1,
1.096513, -1.689822, 2.241314, 1, 0, 0.8470588, 1,
1.10112, 1.24427, 2.08774, 1, 0, 0.8392157, 1,
1.103059, 0.4661578, -0.9926925, 1, 0, 0.8352941, 1,
1.10743, -1.380309, 2.097083, 1, 0, 0.827451, 1,
1.107989, -0.07192097, 0.9628204, 1, 0, 0.8235294, 1,
1.112038, -0.7016191, 1.798899, 1, 0, 0.8156863, 1,
1.114097, 0.5859045, 2.150947, 1, 0, 0.8117647, 1,
1.124066, -0.594821, 0.9076633, 1, 0, 0.8039216, 1,
1.125274, -0.9404681, 2.817847, 1, 0, 0.7960784, 1,
1.13191, 1.110172, 0.3665984, 1, 0, 0.7921569, 1,
1.149432, 2.147283, 0.2704935, 1, 0, 0.7843137, 1,
1.151033, 0.2115046, 0.950731, 1, 0, 0.7803922, 1,
1.155405, -1.354288, 3.253239, 1, 0, 0.772549, 1,
1.155935, 0.2775848, 2.176868, 1, 0, 0.7686275, 1,
1.15781, 0.5465398, 1.613317, 1, 0, 0.7607843, 1,
1.159431, -0.8634604, 3.207206, 1, 0, 0.7568628, 1,
1.160719, 0.4862919, 1.685892, 1, 0, 0.7490196, 1,
1.167517, -0.5343055, 1.217883, 1, 0, 0.7450981, 1,
1.169476, -2.000269, 1.752044, 1, 0, 0.7372549, 1,
1.171606, -0.7357178, 1.429784, 1, 0, 0.7333333, 1,
1.172548, -0.07489894, 0.5815161, 1, 0, 0.7254902, 1,
1.173234, -0.242416, 1.939752, 1, 0, 0.7215686, 1,
1.180707, 1.059497, 0.2216716, 1, 0, 0.7137255, 1,
1.182744, -0.3354596, 1.700454, 1, 0, 0.7098039, 1,
1.188189, -0.4702623, 1.25885, 1, 0, 0.7019608, 1,
1.190219, 0.01117704, -0.2159929, 1, 0, 0.6941177, 1,
1.195175, -0.795709, 1.712788, 1, 0, 0.6901961, 1,
1.195347, -0.9063379, 3.18257, 1, 0, 0.682353, 1,
1.204008, 0.2166137, 1.365204, 1, 0, 0.6784314, 1,
1.219627, 1.155913, 1.688027, 1, 0, 0.6705883, 1,
1.224091, -1.17843, 2.236783, 1, 0, 0.6666667, 1,
1.246228, -0.1333194, 2.909799, 1, 0, 0.6588235, 1,
1.252567, -0.2544729, 1.295788, 1, 0, 0.654902, 1,
1.272335, -0.3507264, 0.3854586, 1, 0, 0.6470588, 1,
1.280517, 0.566669, 0.9668896, 1, 0, 0.6431373, 1,
1.282939, -0.02545835, 1.460669, 1, 0, 0.6352941, 1,
1.290892, -0.6526547, 3.216876, 1, 0, 0.6313726, 1,
1.295336, -0.4406976, 1.017488, 1, 0, 0.6235294, 1,
1.297873, 0.9970213, -0.2000817, 1, 0, 0.6196079, 1,
1.301773, 0.79208, -0.1828998, 1, 0, 0.6117647, 1,
1.302723, 0.7833767, 1.906521, 1, 0, 0.6078432, 1,
1.305249, -1.822815, 2.235994, 1, 0, 0.6, 1,
1.307911, 1.235553, 0.6208819, 1, 0, 0.5921569, 1,
1.312769, -0.1626823, 0.1238603, 1, 0, 0.5882353, 1,
1.31927, 0.9642737, -0.6421926, 1, 0, 0.5803922, 1,
1.322558, 0.7005771, 1.788142, 1, 0, 0.5764706, 1,
1.326272, 1.469279, 0.8187269, 1, 0, 0.5686275, 1,
1.329538, -0.9099705, 1.37731, 1, 0, 0.5647059, 1,
1.336381, -0.8862892, 2.690712, 1, 0, 0.5568628, 1,
1.339061, -0.2056978, 1.169413, 1, 0, 0.5529412, 1,
1.356068, 1.193188, 0.3693878, 1, 0, 0.5450981, 1,
1.364775, 1.116129, 3.03129, 1, 0, 0.5411765, 1,
1.374272, -1.839442, 2.424456, 1, 0, 0.5333334, 1,
1.375089, 1.290487, 0.5928371, 1, 0, 0.5294118, 1,
1.381922, 1.012597, 2.771108, 1, 0, 0.5215687, 1,
1.391561, -1.348425, 1.558088, 1, 0, 0.5176471, 1,
1.398262, -0.4678237, 0.04472402, 1, 0, 0.509804, 1,
1.406945, 0.2143865, 1.960578, 1, 0, 0.5058824, 1,
1.410156, 2.476578, 2.037058, 1, 0, 0.4980392, 1,
1.427101, -0.2583309, 1.551728, 1, 0, 0.4901961, 1,
1.429097, 0.3333527, 0.3936961, 1, 0, 0.4862745, 1,
1.431914, 2.289234, 1.854522, 1, 0, 0.4784314, 1,
1.438824, -0.569676, 3.676761, 1, 0, 0.4745098, 1,
1.442603, -0.4526362, 3.280319, 1, 0, 0.4666667, 1,
1.445358, 0.6721655, 1.605791, 1, 0, 0.4627451, 1,
1.461736, -1.70761, 1.861295, 1, 0, 0.454902, 1,
1.466224, 1.015228, 1.377006, 1, 0, 0.4509804, 1,
1.475028, -0.7772904, 2.130492, 1, 0, 0.4431373, 1,
1.478015, -0.5575749, 3.784702, 1, 0, 0.4392157, 1,
1.478562, -0.9040729, 2.37967, 1, 0, 0.4313726, 1,
1.485562, -0.6975236, 2.073324, 1, 0, 0.427451, 1,
1.486452, 1.879508, -1.287812, 1, 0, 0.4196078, 1,
1.494731, 0.01053566, 0.3020886, 1, 0, 0.4156863, 1,
1.494758, 0.2825371, 1.775485, 1, 0, 0.4078431, 1,
1.49989, 0.6364176, 1.717211, 1, 0, 0.4039216, 1,
1.509817, -1.162937, 1.741118, 1, 0, 0.3960784, 1,
1.510342, -2.454353, 2.058331, 1, 0, 0.3882353, 1,
1.515335, -0.1509656, 0.5213969, 1, 0, 0.3843137, 1,
1.54134, 0.3382314, 1.34603, 1, 0, 0.3764706, 1,
1.542694, -1.52216, 3.893926, 1, 0, 0.372549, 1,
1.546644, 0.99915, -0.3299504, 1, 0, 0.3647059, 1,
1.55008, -0.04622739, 0.9585382, 1, 0, 0.3607843, 1,
1.555486, 0.8028378, 1.407105, 1, 0, 0.3529412, 1,
1.556581, 0.08379622, 1.490573, 1, 0, 0.3490196, 1,
1.562967, 0.6238678, 0.9061934, 1, 0, 0.3411765, 1,
1.56438, 0.2673086, 1.447797, 1, 0, 0.3372549, 1,
1.56879, 0.1359719, -0.08829159, 1, 0, 0.3294118, 1,
1.580316, 0.1016561, 1.747599, 1, 0, 0.3254902, 1,
1.587905, -1.76386, 2.888784, 1, 0, 0.3176471, 1,
1.593723, -0.4597015, 3.043323, 1, 0, 0.3137255, 1,
1.618042, 0.5736167, 1.538096, 1, 0, 0.3058824, 1,
1.622018, 0.09214787, 0.8376291, 1, 0, 0.2980392, 1,
1.627721, -0.9750027, 2.07623, 1, 0, 0.2941177, 1,
1.644503, 0.04476588, 2.12279, 1, 0, 0.2862745, 1,
1.649579, -0.6145561, 1.06184, 1, 0, 0.282353, 1,
1.659411, -0.5274657, 2.25036, 1, 0, 0.2745098, 1,
1.659725, 0.8541304, -0.9308282, 1, 0, 0.2705882, 1,
1.67296, -0.5862153, 0.07170948, 1, 0, 0.2627451, 1,
1.694768, -2.277737, 3.049324, 1, 0, 0.2588235, 1,
1.697418, -0.350947, 1.23642, 1, 0, 0.2509804, 1,
1.731878, 1.256282, 2.995453, 1, 0, 0.2470588, 1,
1.734303, -0.4309582, 0.0006152716, 1, 0, 0.2392157, 1,
1.766612, -0.383821, 3.506446, 1, 0, 0.2352941, 1,
1.770917, 1.125796, 1.499081, 1, 0, 0.227451, 1,
1.793293, 1.119247, 0.746635, 1, 0, 0.2235294, 1,
1.806895, -1.030916, 0.9056591, 1, 0, 0.2156863, 1,
1.820294, -0.2453254, 1.482825, 1, 0, 0.2117647, 1,
1.833641, 0.2625528, 0.7045403, 1, 0, 0.2039216, 1,
1.862851, 0.5167462, 2.56114, 1, 0, 0.1960784, 1,
1.888614, 0.8358557, 1.360833, 1, 0, 0.1921569, 1,
1.893838, 1.135872, 1.041319, 1, 0, 0.1843137, 1,
1.921417, 1.123138, 1.201582, 1, 0, 0.1803922, 1,
1.950408, -0.2844006, 1.100735, 1, 0, 0.172549, 1,
1.977086, 0.4699965, 2.278454, 1, 0, 0.1686275, 1,
1.982648, -1.162961, -0.030594, 1, 0, 0.1607843, 1,
1.982877, 0.6728631, 2.467129, 1, 0, 0.1568628, 1,
1.9892, 1.226401, 1.86297, 1, 0, 0.1490196, 1,
2.017123, -0.4940522, 2.184669, 1, 0, 0.145098, 1,
2.033902, -1.727464, 3.803389, 1, 0, 0.1372549, 1,
2.035393, -2.268825, 3.235624, 1, 0, 0.1333333, 1,
2.093718, 0.7346449, 2.477828, 1, 0, 0.1254902, 1,
2.101008, -1.702342, 1.390273, 1, 0, 0.1215686, 1,
2.11343, -0.8246354, 2.764227, 1, 0, 0.1137255, 1,
2.135933, -0.6185156, 1.930413, 1, 0, 0.1098039, 1,
2.136655, -0.1678966, 3.697709, 1, 0, 0.1019608, 1,
2.148598, -0.01303527, 2.02684, 1, 0, 0.09411765, 1,
2.198928, -0.3481633, 2.094167, 1, 0, 0.09019608, 1,
2.224866, 0.1247972, 3.621212, 1, 0, 0.08235294, 1,
2.272859, 2.346982, -1.352948, 1, 0, 0.07843138, 1,
2.299159, -0.6506348, 2.212941, 1, 0, 0.07058824, 1,
2.308641, -1.343216, 1.738379, 1, 0, 0.06666667, 1,
2.32068, 0.8250292, 1.615255, 1, 0, 0.05882353, 1,
2.351861, 1.327492, 2.906273, 1, 0, 0.05490196, 1,
2.42883, 1.132906, 1.774253, 1, 0, 0.04705882, 1,
2.488153, -0.296061, 2.921234, 1, 0, 0.04313726, 1,
2.540957, -1.919395, 0.9342499, 1, 0, 0.03529412, 1,
2.569163, 0.2538043, 1.929639, 1, 0, 0.03137255, 1,
2.644347, -1.746071, 2.06952, 1, 0, 0.02352941, 1,
2.670889, -0.3940253, 1.545089, 1, 0, 0.01960784, 1,
2.996041, 1.148715, 2.681318, 1, 0, 0.01176471, 1,
3.296986, -1.534944, 4.102691, 1, 0, 0.007843138, 1
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
0.2208678, -4.498393, -6.916175, 0, -0.5, 0.5, 0.5,
0.2208678, -4.498393, -6.916175, 1, -0.5, 0.5, 0.5,
0.2208678, -4.498393, -6.916175, 1, 1.5, 0.5, 0.5,
0.2208678, -4.498393, -6.916175, 0, 1.5, 0.5, 0.5
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
-3.898054, -0.1511177, -6.916175, 0, -0.5, 0.5, 0.5,
-3.898054, -0.1511177, -6.916175, 1, -0.5, 0.5, 0.5,
-3.898054, -0.1511177, -6.916175, 1, 1.5, 0.5, 0.5,
-3.898054, -0.1511177, -6.916175, 0, 1.5, 0.5, 0.5
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
-3.898054, -4.498393, 0.06687093, 0, -0.5, 0.5, 0.5,
-3.898054, -4.498393, 0.06687093, 1, -0.5, 0.5, 0.5,
-3.898054, -4.498393, 0.06687093, 1, 1.5, 0.5, 0.5,
-3.898054, -4.498393, 0.06687093, 0, 1.5, 0.5, 0.5
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
-2, -3.495176, -5.304703,
3, -3.495176, -5.304703,
-2, -3.495176, -5.304703,
-2, -3.662379, -5.573282,
-1, -3.495176, -5.304703,
-1, -3.662379, -5.573282,
0, -3.495176, -5.304703,
0, -3.662379, -5.573282,
1, -3.495176, -5.304703,
1, -3.662379, -5.573282,
2, -3.495176, -5.304703,
2, -3.662379, -5.573282,
3, -3.495176, -5.304703,
3, -3.662379, -5.573282
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
"-2",
"-1",
"0",
"1",
"2",
"3"
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
-2, -3.996784, -6.110439, 0, -0.5, 0.5, 0.5,
-2, -3.996784, -6.110439, 1, -0.5, 0.5, 0.5,
-2, -3.996784, -6.110439, 1, 1.5, 0.5, 0.5,
-2, -3.996784, -6.110439, 0, 1.5, 0.5, 0.5,
-1, -3.996784, -6.110439, 0, -0.5, 0.5, 0.5,
-1, -3.996784, -6.110439, 1, -0.5, 0.5, 0.5,
-1, -3.996784, -6.110439, 1, 1.5, 0.5, 0.5,
-1, -3.996784, -6.110439, 0, 1.5, 0.5, 0.5,
0, -3.996784, -6.110439, 0, -0.5, 0.5, 0.5,
0, -3.996784, -6.110439, 1, -0.5, 0.5, 0.5,
0, -3.996784, -6.110439, 1, 1.5, 0.5, 0.5,
0, -3.996784, -6.110439, 0, 1.5, 0.5, 0.5,
1, -3.996784, -6.110439, 0, -0.5, 0.5, 0.5,
1, -3.996784, -6.110439, 1, -0.5, 0.5, 0.5,
1, -3.996784, -6.110439, 1, 1.5, 0.5, 0.5,
1, -3.996784, -6.110439, 0, 1.5, 0.5, 0.5,
2, -3.996784, -6.110439, 0, -0.5, 0.5, 0.5,
2, -3.996784, -6.110439, 1, -0.5, 0.5, 0.5,
2, -3.996784, -6.110439, 1, 1.5, 0.5, 0.5,
2, -3.996784, -6.110439, 0, 1.5, 0.5, 0.5,
3, -3.996784, -6.110439, 0, -0.5, 0.5, 0.5,
3, -3.996784, -6.110439, 1, -0.5, 0.5, 0.5,
3, -3.996784, -6.110439, 1, 1.5, 0.5, 0.5,
3, -3.996784, -6.110439, 0, 1.5, 0.5, 0.5
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
-2.947534, -3, -5.304703,
-2.947534, 3, -5.304703,
-2.947534, -3, -5.304703,
-3.105954, -3, -5.573282,
-2.947534, -2, -5.304703,
-3.105954, -2, -5.573282,
-2.947534, -1, -5.304703,
-3.105954, -1, -5.573282,
-2.947534, 0, -5.304703,
-3.105954, 0, -5.573282,
-2.947534, 1, -5.304703,
-3.105954, 1, -5.573282,
-2.947534, 2, -5.304703,
-3.105954, 2, -5.573282,
-2.947534, 3, -5.304703,
-3.105954, 3, -5.573282
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
-3.422794, -3, -6.110439, 0, -0.5, 0.5, 0.5,
-3.422794, -3, -6.110439, 1, -0.5, 0.5, 0.5,
-3.422794, -3, -6.110439, 1, 1.5, 0.5, 0.5,
-3.422794, -3, -6.110439, 0, 1.5, 0.5, 0.5,
-3.422794, -2, -6.110439, 0, -0.5, 0.5, 0.5,
-3.422794, -2, -6.110439, 1, -0.5, 0.5, 0.5,
-3.422794, -2, -6.110439, 1, 1.5, 0.5, 0.5,
-3.422794, -2, -6.110439, 0, 1.5, 0.5, 0.5,
-3.422794, -1, -6.110439, 0, -0.5, 0.5, 0.5,
-3.422794, -1, -6.110439, 1, -0.5, 0.5, 0.5,
-3.422794, -1, -6.110439, 1, 1.5, 0.5, 0.5,
-3.422794, -1, -6.110439, 0, 1.5, 0.5, 0.5,
-3.422794, 0, -6.110439, 0, -0.5, 0.5, 0.5,
-3.422794, 0, -6.110439, 1, -0.5, 0.5, 0.5,
-3.422794, 0, -6.110439, 1, 1.5, 0.5, 0.5,
-3.422794, 0, -6.110439, 0, 1.5, 0.5, 0.5,
-3.422794, 1, -6.110439, 0, -0.5, 0.5, 0.5,
-3.422794, 1, -6.110439, 1, -0.5, 0.5, 0.5,
-3.422794, 1, -6.110439, 1, 1.5, 0.5, 0.5,
-3.422794, 1, -6.110439, 0, 1.5, 0.5, 0.5,
-3.422794, 2, -6.110439, 0, -0.5, 0.5, 0.5,
-3.422794, 2, -6.110439, 1, -0.5, 0.5, 0.5,
-3.422794, 2, -6.110439, 1, 1.5, 0.5, 0.5,
-3.422794, 2, -6.110439, 0, 1.5, 0.5, 0.5,
-3.422794, 3, -6.110439, 0, -0.5, 0.5, 0.5,
-3.422794, 3, -6.110439, 1, -0.5, 0.5, 0.5,
-3.422794, 3, -6.110439, 1, 1.5, 0.5, 0.5,
-3.422794, 3, -6.110439, 0, 1.5, 0.5, 0.5
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
-2.947534, -3.495176, -4,
-2.947534, -3.495176, 4,
-2.947534, -3.495176, -4,
-3.105954, -3.662379, -4,
-2.947534, -3.495176, -2,
-3.105954, -3.662379, -2,
-2.947534, -3.495176, 0,
-3.105954, -3.662379, 0,
-2.947534, -3.495176, 2,
-3.105954, -3.662379, 2,
-2.947534, -3.495176, 4,
-3.105954, -3.662379, 4
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
-3.422794, -3.996784, -4, 0, -0.5, 0.5, 0.5,
-3.422794, -3.996784, -4, 1, -0.5, 0.5, 0.5,
-3.422794, -3.996784, -4, 1, 1.5, 0.5, 0.5,
-3.422794, -3.996784, -4, 0, 1.5, 0.5, 0.5,
-3.422794, -3.996784, -2, 0, -0.5, 0.5, 0.5,
-3.422794, -3.996784, -2, 1, -0.5, 0.5, 0.5,
-3.422794, -3.996784, -2, 1, 1.5, 0.5, 0.5,
-3.422794, -3.996784, -2, 0, 1.5, 0.5, 0.5,
-3.422794, -3.996784, 0, 0, -0.5, 0.5, 0.5,
-3.422794, -3.996784, 0, 1, -0.5, 0.5, 0.5,
-3.422794, -3.996784, 0, 1, 1.5, 0.5, 0.5,
-3.422794, -3.996784, 0, 0, 1.5, 0.5, 0.5,
-3.422794, -3.996784, 2, 0, -0.5, 0.5, 0.5,
-3.422794, -3.996784, 2, 1, -0.5, 0.5, 0.5,
-3.422794, -3.996784, 2, 1, 1.5, 0.5, 0.5,
-3.422794, -3.996784, 2, 0, 1.5, 0.5, 0.5,
-3.422794, -3.996784, 4, 0, -0.5, 0.5, 0.5,
-3.422794, -3.996784, 4, 1, -0.5, 0.5, 0.5,
-3.422794, -3.996784, 4, 1, 1.5, 0.5, 0.5,
-3.422794, -3.996784, 4, 0, 1.5, 0.5, 0.5
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
-2.947534, -3.495176, -5.304703,
-2.947534, 3.19294, -5.304703,
-2.947534, -3.495176, 5.438445,
-2.947534, 3.19294, 5.438445,
-2.947534, -3.495176, -5.304703,
-2.947534, -3.495176, 5.438445,
-2.947534, 3.19294, -5.304703,
-2.947534, 3.19294, 5.438445,
-2.947534, -3.495176, -5.304703,
3.389269, -3.495176, -5.304703,
-2.947534, -3.495176, 5.438445,
3.389269, -3.495176, 5.438445,
-2.947534, 3.19294, -5.304703,
3.389269, 3.19294, -5.304703,
-2.947534, 3.19294, 5.438445,
3.389269, 3.19294, 5.438445,
3.389269, -3.495176, -5.304703,
3.389269, 3.19294, -5.304703,
3.389269, -3.495176, 5.438445,
3.389269, 3.19294, 5.438445,
3.389269, -3.495176, -5.304703,
3.389269, -3.495176, 5.438445,
3.389269, 3.19294, -5.304703,
3.389269, 3.19294, 5.438445
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
var radius = 7.55731;
var distance = 33.62333;
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
mvMatrix.translate( -0.2208678, 0.1511177, -0.06687093 );
mvMatrix.scale( 1.289469, 1.221736, 0.7605882 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.62333);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
N-phosphonomethylgly<-read.table("N-phosphonomethylgly.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-N-phosphonomethylgly$V2
```

```
## Error in eval(expr, envir, enclos): object 'N' not found
```

```r
y<-N-phosphonomethylgly$V3
```

```
## Error in eval(expr, envir, enclos): object 'N' not found
```

```r
z<-N-phosphonomethylgly$V4
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
-2.85525, 0.7317412, -1.109253, 0, 0, 1, 1, 1,
-2.848276, -0.003376027, -0.8741807, 1, 0, 0, 1, 1,
-2.649473, 0.8839432, 0.7356713, 1, 0, 0, 1, 1,
-2.638825, 0.395252, 0.1738547, 1, 0, 0, 1, 1,
-2.431013, -0.2279761, -2.278848, 1, 0, 0, 1, 1,
-2.38998, -0.5614286, -1.558542, 1, 0, 0, 1, 1,
-2.366519, 0.4246828, -1.918629, 0, 0, 0, 1, 1,
-2.339708, 1.84922, 0.3450292, 0, 0, 0, 1, 1,
-2.33828, 0.6997474, -0.214138, 0, 0, 0, 1, 1,
-2.226109, -0.3955331, -0.8313743, 0, 0, 0, 1, 1,
-2.226085, 0.7592208, -2.30489, 0, 0, 0, 1, 1,
-2.225911, 0.251776, -3.300333, 0, 0, 0, 1, 1,
-2.205542, 0.5190805, -3.232707, 0, 0, 0, 1, 1,
-2.203727, 0.9345201, -0.9133397, 1, 1, 1, 1, 1,
-2.196996, -0.353824, -2.923469, 1, 1, 1, 1, 1,
-2.150574, 0.1284055, -1.164997, 1, 1, 1, 1, 1,
-2.143538, 0.8851783, -0.375316, 1, 1, 1, 1, 1,
-2.058836, -1.308977, -3.099042, 1, 1, 1, 1, 1,
-2.047935, -2.761158, -2.685704, 1, 1, 1, 1, 1,
-2.041444, -2.048544, -1.736217, 1, 1, 1, 1, 1,
-2.040306, -0.6882246, -2.025279, 1, 1, 1, 1, 1,
-2.031055, 0.5067329, -1.517838, 1, 1, 1, 1, 1,
-2.017237, 3.095541, -0.2508606, 1, 1, 1, 1, 1,
-1.987961, 0.7157338, -0.4810513, 1, 1, 1, 1, 1,
-1.949076, -0.6315328, -2.238197, 1, 1, 1, 1, 1,
-1.941471, 0.40642, -1.695959, 1, 1, 1, 1, 1,
-1.931272, -0.7813522, -0.997847, 1, 1, 1, 1, 1,
-1.926124, -1.513415, -1.000715, 1, 1, 1, 1, 1,
-1.883398, -0.6885421, -1.511124, 0, 0, 1, 1, 1,
-1.879872, -0.5010827, -2.493767, 1, 0, 0, 1, 1,
-1.85631, -0.6644528, -2.473375, 1, 0, 0, 1, 1,
-1.851238, -0.05890767, -2.590132, 1, 0, 0, 1, 1,
-1.838997, -0.2928826, -2.033239, 1, 0, 0, 1, 1,
-1.813754, 0.5628218, -0.5706851, 1, 0, 0, 1, 1,
-1.801222, 1.338883, -0.8166776, 0, 0, 0, 1, 1,
-1.792631, -1.09462, -1.968259, 0, 0, 0, 1, 1,
-1.78703, 0.1283441, -0.31354, 0, 0, 0, 1, 1,
-1.778611, -0.6350628, -3.584041, 0, 0, 0, 1, 1,
-1.76566, 0.4743503, -2.030798, 0, 0, 0, 1, 1,
-1.762136, 0.8053311, -0.05358489, 0, 0, 0, 1, 1,
-1.760158, -0.2343562, -1.953713, 0, 0, 0, 1, 1,
-1.738956, 1.927965, -0.9632572, 1, 1, 1, 1, 1,
-1.717899, -1.490705, -1.152248, 1, 1, 1, 1, 1,
-1.699788, 0.1185453, -3.030506, 1, 1, 1, 1, 1,
-1.697124, 0.8097318, -0.6464801, 1, 1, 1, 1, 1,
-1.670326, -0.2266971, -2.241547, 1, 1, 1, 1, 1,
-1.65139, -0.9874085, -3.781363, 1, 1, 1, 1, 1,
-1.640224, -1.741071, -2.753775, 1, 1, 1, 1, 1,
-1.633856, 1.112415, -1.318706, 1, 1, 1, 1, 1,
-1.630066, 0.668739, -0.42395, 1, 1, 1, 1, 1,
-1.614938, -0.7508423, -1.894741, 1, 1, 1, 1, 1,
-1.607796, 0.4824227, -2.284702, 1, 1, 1, 1, 1,
-1.597696, -0.07596607, -3.36002, 1, 1, 1, 1, 1,
-1.589628, -0.6514922, -1.605804, 1, 1, 1, 1, 1,
-1.589481, 0.1262409, -0.7427982, 1, 1, 1, 1, 1,
-1.574916, -1.14744, -1.725139, 1, 1, 1, 1, 1,
-1.565022, -0.3141548, -1.826116, 0, 0, 1, 1, 1,
-1.550406, 0.8608071, -1.257104, 1, 0, 0, 1, 1,
-1.541092, -0.748882, -2.776326, 1, 0, 0, 1, 1,
-1.540474, 1.865756, 0.5172362, 1, 0, 0, 1, 1,
-1.517743, 1.992459, -3.185514, 1, 0, 0, 1, 1,
-1.485361, 0.01707004, -1.621978, 1, 0, 0, 1, 1,
-1.465389, 1.506416, 0.4667723, 0, 0, 0, 1, 1,
-1.46291, -0.1604235, -0.6215704, 0, 0, 0, 1, 1,
-1.462121, 0.08588931, -1.564021, 0, 0, 0, 1, 1,
-1.449555, -1.087003, -0.7311098, 0, 0, 0, 1, 1,
-1.440491, -0.0005719182, -3.014984, 0, 0, 0, 1, 1,
-1.440189, 0.4964336, 0.327002, 0, 0, 0, 1, 1,
-1.433698, -0.09566578, -3.683291, 0, 0, 0, 1, 1,
-1.416737, 0.2048174, -2.096982, 1, 1, 1, 1, 1,
-1.412355, -0.003402635, -2.404958, 1, 1, 1, 1, 1,
-1.399894, 0.5436462, -2.614774, 1, 1, 1, 1, 1,
-1.392703, 0.2717406, -3.628748, 1, 1, 1, 1, 1,
-1.385781, 0.8705199, -0.9167588, 1, 1, 1, 1, 1,
-1.385683, -1.721586, -2.710371, 1, 1, 1, 1, 1,
-1.380845, 2.598827, 0.02710005, 1, 1, 1, 1, 1,
-1.368556, -1.245874, -1.773701, 1, 1, 1, 1, 1,
-1.353743, -1.182472, -2.143353, 1, 1, 1, 1, 1,
-1.353007, 0.0240726, -1.761918, 1, 1, 1, 1, 1,
-1.349546, 0.2617728, -3.393881, 1, 1, 1, 1, 1,
-1.348919, -1.6616, -2.554958, 1, 1, 1, 1, 1,
-1.345785, -1.215485, -3.186857, 1, 1, 1, 1, 1,
-1.336308, 0.6114061, -1.771364, 1, 1, 1, 1, 1,
-1.332994, -0.6635841, -0.9228176, 1, 1, 1, 1, 1,
-1.323782, 0.113828, -2.052877, 0, 0, 1, 1, 1,
-1.320099, 1.202961, 0.6043839, 1, 0, 0, 1, 1,
-1.319253, 0.6301522, -1.398412, 1, 0, 0, 1, 1,
-1.315418, -0.07688188, -3.221522, 1, 0, 0, 1, 1,
-1.312955, -0.9096444, -1.062304, 1, 0, 0, 1, 1,
-1.309868, 1.247848, -0.9002123, 1, 0, 0, 1, 1,
-1.308487, 0.06248093, 0.5702478, 0, 0, 0, 1, 1,
-1.292073, -1.616262, -3.317858, 0, 0, 0, 1, 1,
-1.285372, -0.7116619, -0.5701328, 0, 0, 0, 1, 1,
-1.281562, 1.656463, -1.084471, 0, 0, 0, 1, 1,
-1.280056, -1.332389, -1.359693, 0, 0, 0, 1, 1,
-1.271943, -0.5207271, -2.254681, 0, 0, 0, 1, 1,
-1.262365, -0.8594155, -2.57991, 0, 0, 0, 1, 1,
-1.254355, -0.2616325, -0.3715773, 1, 1, 1, 1, 1,
-1.253333, -1.168095, -2.616244, 1, 1, 1, 1, 1,
-1.2407, -0.4472578, -1.450857, 1, 1, 1, 1, 1,
-1.238135, -1.189192, -2.283163, 1, 1, 1, 1, 1,
-1.235767, 0.8315995, -2.397553, 1, 1, 1, 1, 1,
-1.23212, 0.7784867, -1.094108, 1, 1, 1, 1, 1,
-1.231984, -0.06683201, -2.15968, 1, 1, 1, 1, 1,
-1.227057, 0.1346126, -2.74469, 1, 1, 1, 1, 1,
-1.215228, -0.2054539, -3.218895, 1, 1, 1, 1, 1,
-1.214998, 0.6283915, 0.7052155, 1, 1, 1, 1, 1,
-1.214538, 0.385932, -0.7712662, 1, 1, 1, 1, 1,
-1.214304, -0.661961, -1.597566, 1, 1, 1, 1, 1,
-1.213653, -0.4150286, -2.767292, 1, 1, 1, 1, 1,
-1.205397, 0.5271633, -0.763717, 1, 1, 1, 1, 1,
-1.194421, 0.1096641, -1.376405, 1, 1, 1, 1, 1,
-1.192583, -0.01595872, -0.5435483, 0, 0, 1, 1, 1,
-1.178485, 0.3625952, 0.4147585, 1, 0, 0, 1, 1,
-1.168448, -0.6262064, -0.2001299, 1, 0, 0, 1, 1,
-1.167676, -0.6891792, -2.503754, 1, 0, 0, 1, 1,
-1.166999, -0.5998433, -1.941338, 1, 0, 0, 1, 1,
-1.16353, -0.2895022, 0.03207619, 1, 0, 0, 1, 1,
-1.162864, 1.055524, 2.544362, 0, 0, 0, 1, 1,
-1.160935, -1.135892, -0.1615385, 0, 0, 0, 1, 1,
-1.1599, 0.7119476, -0.178315, 0, 0, 0, 1, 1,
-1.15358, 1.204081, -1.219261, 0, 0, 0, 1, 1,
-1.152342, -1.324185, -2.126426, 0, 0, 0, 1, 1,
-1.138783, -0.857785, -2.047539, 0, 0, 0, 1, 1,
-1.138658, -0.9751911, -1.293317, 0, 0, 0, 1, 1,
-1.136446, 0.464527, -0.5574819, 1, 1, 1, 1, 1,
-1.122973, -0.6209347, -3.212593, 1, 1, 1, 1, 1,
-1.122056, 0.3111749, -0.8877915, 1, 1, 1, 1, 1,
-1.120092, -0.9948007, -2.989008, 1, 1, 1, 1, 1,
-1.113055, -0.46173, -0.3613409, 1, 1, 1, 1, 1,
-1.111196, 0.7347415, -1.15195, 1, 1, 1, 1, 1,
-1.110587, -0.17772, -0.7083943, 1, 1, 1, 1, 1,
-1.105899, -0.825675, -1.758289, 1, 1, 1, 1, 1,
-1.104203, -1.004308, -2.837401, 1, 1, 1, 1, 1,
-1.10319, 1.531097, -0.03213248, 1, 1, 1, 1, 1,
-1.102005, -0.1793869, -2.949535, 1, 1, 1, 1, 1,
-1.095676, 1.121778, -0.8100047, 1, 1, 1, 1, 1,
-1.095096, -1.237081, -2.182071, 1, 1, 1, 1, 1,
-1.092103, -0.050017, -2.938583, 1, 1, 1, 1, 1,
-1.090077, 0.7590998, -0.5665795, 1, 1, 1, 1, 1,
-1.08863, 0.06608132, -0.9070083, 0, 0, 1, 1, 1,
-1.083555, 0.546507, -2.127622, 1, 0, 0, 1, 1,
-1.081931, 0.225188, -2.239112, 1, 0, 0, 1, 1,
-1.076559, 1.734496, 0.1105877, 1, 0, 0, 1, 1,
-1.074575, 0.4237284, -2.445866, 1, 0, 0, 1, 1,
-1.071238, 2.400445, 1.176281, 1, 0, 0, 1, 1,
-1.069909, -1.161258, -1.85754, 0, 0, 0, 1, 1,
-1.061481, -0.02363219, -1.498689, 0, 0, 0, 1, 1,
-1.042379, 0.5066288, -1.671792, 0, 0, 0, 1, 1,
-1.041669, -2.156162, -1.391954, 0, 0, 0, 1, 1,
-1.040077, -0.5371863, -2.566899, 0, 0, 0, 1, 1,
-1.039387, -3.397776, -2.819724, 0, 0, 0, 1, 1,
-1.036449, 0.3766979, -1.858421, 0, 0, 0, 1, 1,
-1.031873, 0.8285612, -1.053865, 1, 1, 1, 1, 1,
-1.026785, -0.980269, -2.328789, 1, 1, 1, 1, 1,
-1.024498, 1.919055, 0.259861, 1, 1, 1, 1, 1,
-1.021652, 0.1955387, -0.9694648, 1, 1, 1, 1, 1,
-1.021359, 1.849259, 0.4303833, 1, 1, 1, 1, 1,
-1.020855, -0.690044, -1.852095, 1, 1, 1, 1, 1,
-1.016063, 0.9728221, -1.275249, 1, 1, 1, 1, 1,
-1.011624, -2.201006, -3.350746, 1, 1, 1, 1, 1,
-1.001756, 1.103732, -0.4879299, 1, 1, 1, 1, 1,
-0.9999849, -0.633444, -3.316265, 1, 1, 1, 1, 1,
-0.9952601, 0.4421479, -2.26591, 1, 1, 1, 1, 1,
-0.9930357, -0.8320664, -1.669257, 1, 1, 1, 1, 1,
-0.992352, 0.6796446, -1.054212, 1, 1, 1, 1, 1,
-0.9888582, -0.8889887, -4.847736, 1, 1, 1, 1, 1,
-0.9786729, -0.6175094, -1.677858, 1, 1, 1, 1, 1,
-0.9768158, 0.8348861, -2.275065, 0, 0, 1, 1, 1,
-0.9758164, 1.669744, -1.677426, 1, 0, 0, 1, 1,
-0.9754866, -1.613828, -3.854454, 1, 0, 0, 1, 1,
-0.9678345, -0.3059048, -1.743073, 1, 0, 0, 1, 1,
-0.9549174, -0.08509166, -1.916462, 1, 0, 0, 1, 1,
-0.9525504, -0.5723296, -1.164607, 1, 0, 0, 1, 1,
-0.9522252, -0.2806367, -2.118857, 0, 0, 0, 1, 1,
-0.9496379, -0.4863394, -1.951096, 0, 0, 0, 1, 1,
-0.9436798, -0.3936244, -1.478842, 0, 0, 0, 1, 1,
-0.9422174, -0.8430969, -1.859797, 0, 0, 0, 1, 1,
-0.9391636, 0.09566085, -2.505346, 0, 0, 0, 1, 1,
-0.937194, -0.1635039, -1.961756, 0, 0, 0, 1, 1,
-0.9331672, -0.8308429, -1.767431, 0, 0, 0, 1, 1,
-0.9304637, 0.7022477, -0.9956867, 1, 1, 1, 1, 1,
-0.922215, -0.9762859, -2.075814, 1, 1, 1, 1, 1,
-0.9204035, -0.9435353, -1.95352, 1, 1, 1, 1, 1,
-0.9187344, -1.615114, -1.951342, 1, 1, 1, 1, 1,
-0.9126199, 0.1400038, -1.66691, 1, 1, 1, 1, 1,
-0.9055715, -0.8895118, -1.301706, 1, 1, 1, 1, 1,
-0.9052376, -0.8764759, -0.8718345, 1, 1, 1, 1, 1,
-0.9032003, 0.4572215, -2.311633, 1, 1, 1, 1, 1,
-0.8997704, 0.5287849, 0.4476967, 1, 1, 1, 1, 1,
-0.8989642, -1.701612, -2.229612, 1, 1, 1, 1, 1,
-0.8961858, 1.294445, 0.8065796, 1, 1, 1, 1, 1,
-0.8952551, 0.1780011, -0.9516689, 1, 1, 1, 1, 1,
-0.8908126, -1.143554, -1.055214, 1, 1, 1, 1, 1,
-0.8902505, 0.3717095, -0.6713023, 1, 1, 1, 1, 1,
-0.8852454, -1.637686, -0.2324714, 1, 1, 1, 1, 1,
-0.8845469, 0.04134831, -0.00561812, 0, 0, 1, 1, 1,
-0.8801336, 1.139653, -0.3244574, 1, 0, 0, 1, 1,
-0.87935, -0.1970159, -2.329465, 1, 0, 0, 1, 1,
-0.8715822, 1.151992, -0.8821329, 1, 0, 0, 1, 1,
-0.8678123, -0.08228596, -1.465614, 1, 0, 0, 1, 1,
-0.8656527, -1.283159, -3.006938, 1, 0, 0, 1, 1,
-0.8633592, -0.07661513, -0.6615242, 0, 0, 0, 1, 1,
-0.8606206, -0.2766305, -1.632738, 0, 0, 0, 1, 1,
-0.8501605, -0.6974992, -1.338848, 0, 0, 0, 1, 1,
-0.8478538, -0.8079755, -2.148203, 0, 0, 0, 1, 1,
-0.847604, -0.4048073, -2.615799, 0, 0, 0, 1, 1,
-0.8455986, -0.4377586, -1.072989, 0, 0, 0, 1, 1,
-0.8385233, 0.5325897, -0.1590629, 0, 0, 0, 1, 1,
-0.8350928, -1.497792, -2.009542, 1, 1, 1, 1, 1,
-0.8336987, 0.04187682, -1.344207, 1, 1, 1, 1, 1,
-0.8324163, 0.5235375, 0.3534776, 1, 1, 1, 1, 1,
-0.8318789, 1.088869, -1.174875, 1, 1, 1, 1, 1,
-0.8315183, 1.103314, -0.2528732, 1, 1, 1, 1, 1,
-0.8236697, -0.8323178, -2.397523, 1, 1, 1, 1, 1,
-0.8166891, 0.6148201, -1.295864, 1, 1, 1, 1, 1,
-0.8164542, 0.4045776, -2.212658, 1, 1, 1, 1, 1,
-0.816013, 1.189376, -1.353714, 1, 1, 1, 1, 1,
-0.8108264, 1.980118, -0.7693723, 1, 1, 1, 1, 1,
-0.8084071, -1.252082, -3.4969, 1, 1, 1, 1, 1,
-0.8081104, 0.5024591, -0.6569023, 1, 1, 1, 1, 1,
-0.8053489, -0.484697, -2.950718, 1, 1, 1, 1, 1,
-0.803301, 0.4661705, -1.795205, 1, 1, 1, 1, 1,
-0.8014581, 1.078067, -1.46525, 1, 1, 1, 1, 1,
-0.8007577, -0.6946838, -3.104242, 0, 0, 1, 1, 1,
-0.8001645, -1.290656, -3.281191, 1, 0, 0, 1, 1,
-0.7968047, 0.3577942, -1.813011, 1, 0, 0, 1, 1,
-0.793839, 2.094839, -1.134268, 1, 0, 0, 1, 1,
-0.7937526, 1.049714, -1.608716, 1, 0, 0, 1, 1,
-0.7892249, 0.6135706, -1.620108, 1, 0, 0, 1, 1,
-0.7862549, 0.3297587, -2.831614, 0, 0, 0, 1, 1,
-0.7820455, 0.06372074, -1.443917, 0, 0, 0, 1, 1,
-0.781049, -0.7959899, -3.381921, 0, 0, 0, 1, 1,
-0.7807729, 0.03924821, -1.250887, 0, 0, 0, 1, 1,
-0.7798559, 1.129021, -1.053764, 0, 0, 0, 1, 1,
-0.7753167, 0.5303326, -1.173962, 0, 0, 0, 1, 1,
-0.7704488, -1.138212, -1.809039, 0, 0, 0, 1, 1,
-0.7685042, 0.7338953, -0.3080734, 1, 1, 1, 1, 1,
-0.7648048, -1.299818, -2.686936, 1, 1, 1, 1, 1,
-0.7568838, -0.08650301, -2.045565, 1, 1, 1, 1, 1,
-0.7545414, 1.187356, 0.8690211, 1, 1, 1, 1, 1,
-0.7516987, -0.2136616, -2.426313, 1, 1, 1, 1, 1,
-0.7473812, -0.3974232, -3.644576, 1, 1, 1, 1, 1,
-0.7468457, 0.1169837, -1.509664, 1, 1, 1, 1, 1,
-0.7413436, 0.02050049, -2.756279, 1, 1, 1, 1, 1,
-0.7407916, 0.7020069, -0.3955914, 1, 1, 1, 1, 1,
-0.7407079, 1.057199, 0.03077286, 1, 1, 1, 1, 1,
-0.7401546, -0.1396573, -1.642701, 1, 1, 1, 1, 1,
-0.7394548, -0.06515303, -0.2476428, 1, 1, 1, 1, 1,
-0.7364017, 0.2352144, -0.9266396, 1, 1, 1, 1, 1,
-0.7350367, -0.3304015, -2.671633, 1, 1, 1, 1, 1,
-0.7285151, 1.09791, 1.595252, 1, 1, 1, 1, 1,
-0.7283189, 0.927773, -1.494916, 0, 0, 1, 1, 1,
-0.7282286, -0.6542982, -2.367832, 1, 0, 0, 1, 1,
-0.7280577, -0.6974406, -1.350799, 1, 0, 0, 1, 1,
-0.7232293, 1.322455, -1.14322, 1, 0, 0, 1, 1,
-0.7231341, -0.6425643, -2.283717, 1, 0, 0, 1, 1,
-0.721779, -2.01402, -1.780978, 1, 0, 0, 1, 1,
-0.7190171, -2.354784, -2.198184, 0, 0, 0, 1, 1,
-0.7115516, 1.261841, -1.21326, 0, 0, 0, 1, 1,
-0.7095526, -0.8332321, -3.596694, 0, 0, 0, 1, 1,
-0.7078831, 0.2040813, -2.299942, 0, 0, 0, 1, 1,
-0.707154, 0.08339062, -1.384529, 0, 0, 0, 1, 1,
-0.7068174, 2.120131, -0.8661086, 0, 0, 0, 1, 1,
-0.7064923, -0.9986664, -1.308, 0, 0, 0, 1, 1,
-0.7062374, 1.727303, -1.038007, 1, 1, 1, 1, 1,
-0.7048844, 0.4698321, -1.09314, 1, 1, 1, 1, 1,
-0.7025216, 0.3457828, -0.956251, 1, 1, 1, 1, 1,
-0.7011418, -2.095418, -1.976672, 1, 1, 1, 1, 1,
-0.7004485, 1.048993, -0.6582022, 1, 1, 1, 1, 1,
-0.7002396, -1.394313, -4.977865, 1, 1, 1, 1, 1,
-0.6999726, 0.8857765, -0.2516458, 1, 1, 1, 1, 1,
-0.6992643, -0.277326, -2.144876, 1, 1, 1, 1, 1,
-0.6982114, 1.165186, -3.306542, 1, 1, 1, 1, 1,
-0.6959675, 0.2456334, -2.079393, 1, 1, 1, 1, 1,
-0.695448, 0.1317545, -3.182973, 1, 1, 1, 1, 1,
-0.6926858, 0.8185689, -1.312121, 1, 1, 1, 1, 1,
-0.6901521, -0.5889353, -1.911628, 1, 1, 1, 1, 1,
-0.6882498, 0.3970005, -0.4726669, 1, 1, 1, 1, 1,
-0.6833557, 2.090612, -0.8528754, 1, 1, 1, 1, 1,
-0.6829156, -1.321028, -2.612041, 0, 0, 1, 1, 1,
-0.6798779, -1.063049, -2.841203, 1, 0, 0, 1, 1,
-0.678044, 0.9435645, -1.841348, 1, 0, 0, 1, 1,
-0.6681955, -0.4994775, -3.27725, 1, 0, 0, 1, 1,
-0.667778, 0.01512457, -0.8074034, 1, 0, 0, 1, 1,
-0.6666298, -0.4062319, -1.956467, 1, 0, 0, 1, 1,
-0.6644976, 0.1762705, -1.239241, 0, 0, 0, 1, 1,
-0.6627691, -0.1668051, -3.023158, 0, 0, 0, 1, 1,
-0.6584095, -1.566521, -2.135194, 0, 0, 0, 1, 1,
-0.6576099, -1.802667, -2.126019, 0, 0, 0, 1, 1,
-0.6576073, 1.109256, 1.06525, 0, 0, 0, 1, 1,
-0.6556799, 0.7982297, 0.7532343, 0, 0, 0, 1, 1,
-0.6526556, 0.7955774, 1.455606, 0, 0, 0, 1, 1,
-0.6522554, 1.096212, -1.563871, 1, 1, 1, 1, 1,
-0.6498625, -1.802336, -3.682224, 1, 1, 1, 1, 1,
-0.6493471, 0.01062978, -1.768614, 1, 1, 1, 1, 1,
-0.6456219, -1.230927, -2.766574, 1, 1, 1, 1, 1,
-0.6322017, -1.051049, -2.16955, 1, 1, 1, 1, 1,
-0.6304551, -0.08022389, -3.23503, 1, 1, 1, 1, 1,
-0.6260964, -1.698149, -1.884555, 1, 1, 1, 1, 1,
-0.617758, -1.084316, -3.581783, 1, 1, 1, 1, 1,
-0.6168361, -0.1933556, -0.8741077, 1, 1, 1, 1, 1,
-0.6148944, 0.0924236, -0.2173442, 1, 1, 1, 1, 1,
-0.6147005, 0.8367467, -0.1076104, 1, 1, 1, 1, 1,
-0.6135466, -0.5866126, -2.605919, 1, 1, 1, 1, 1,
-0.6098272, 0.4188729, -0.303712, 1, 1, 1, 1, 1,
-0.6035179, -0.2271462, -1.030091, 1, 1, 1, 1, 1,
-0.6028181, 0.9471841, -0.7274879, 1, 1, 1, 1, 1,
-0.5972888, -0.1377367, -1.845043, 0, 0, 1, 1, 1,
-0.5963998, -0.1937742, -1.049265, 1, 0, 0, 1, 1,
-0.594909, 0.02017352, -0.2912278, 1, 0, 0, 1, 1,
-0.5940694, -0.07642449, -1.955895, 1, 0, 0, 1, 1,
-0.5910308, -1.184862, -0.7061372, 1, 0, 0, 1, 1,
-0.5907069, -1.03752, -0.8397159, 1, 0, 0, 1, 1,
-0.5893849, -1.967289, -3.134638, 0, 0, 0, 1, 1,
-0.5890826, -0.2285495, -1.580396, 0, 0, 0, 1, 1,
-0.5872079, -0.5943369, -2.193236, 0, 0, 0, 1, 1,
-0.586962, -2.256674, -3.256113, 0, 0, 0, 1, 1,
-0.580868, -0.9220625, -3.52926, 0, 0, 0, 1, 1,
-0.5791007, -0.574835, -2.750565, 0, 0, 0, 1, 1,
-0.5790388, -0.765873, -1.571979, 0, 0, 0, 1, 1,
-0.5773745, -0.7120149, -0.5737146, 1, 1, 1, 1, 1,
-0.5768195, 0.5737712, -0.1235674, 1, 1, 1, 1, 1,
-0.5734652, -0.8405018, -3.801888, 1, 1, 1, 1, 1,
-0.5723417, -0.4031698, -2.415444, 1, 1, 1, 1, 1,
-0.5720777, 0.03608296, -1.161881, 1, 1, 1, 1, 1,
-0.5715449, -0.8238262, -2.608159, 1, 1, 1, 1, 1,
-0.5704495, -0.8820143, -2.546219, 1, 1, 1, 1, 1,
-0.5658057, -0.7235568, -1.145295, 1, 1, 1, 1, 1,
-0.5621251, 0.5477595, 0.0230088, 1, 1, 1, 1, 1,
-0.5588613, 0.3942672, 0.3636335, 1, 1, 1, 1, 1,
-0.5582278, -0.9568828, -3.939134, 1, 1, 1, 1, 1,
-0.5522547, -0.770783, -3.692279, 1, 1, 1, 1, 1,
-0.5493744, -0.3774891, -2.001392, 1, 1, 1, 1, 1,
-0.5466139, -1.05986, -2.566889, 1, 1, 1, 1, 1,
-0.5435217, 0.2709323, -1.808258, 1, 1, 1, 1, 1,
-0.5430897, -0.8107912, -1.201526, 0, 0, 1, 1, 1,
-0.5423083, 1.029157, -0.6194093, 1, 0, 0, 1, 1,
-0.5338301, 0.5437284, -0.7586309, 1, 0, 0, 1, 1,
-0.5321731, 1.046045, 1.129396, 1, 0, 0, 1, 1,
-0.5275715, 0.2313797, 0.63416, 1, 0, 0, 1, 1,
-0.5194154, -2.021718, -0.6050528, 1, 0, 0, 1, 1,
-0.5177546, -0.7217021, -2.500558, 0, 0, 0, 1, 1,
-0.5155084, -0.6895978, -1.910606, 0, 0, 0, 1, 1,
-0.513455, 1.118094, -1.678807, 0, 0, 0, 1, 1,
-0.5092725, 0.8718863, -0.2347596, 0, 0, 0, 1, 1,
-0.5083366, 0.4811162, -0.269126, 0, 0, 0, 1, 1,
-0.5068936, 0.7908159, -0.7621723, 0, 0, 0, 1, 1,
-0.4972157, 0.0688241, 0.2338153, 0, 0, 0, 1, 1,
-0.4951752, 2.168788, -0.293456, 1, 1, 1, 1, 1,
-0.4918303, 1.815231, -0.76664, 1, 1, 1, 1, 1,
-0.4895817, 0.6626086, 0.4307604, 1, 1, 1, 1, 1,
-0.488546, 0.001730841, -3.046144, 1, 1, 1, 1, 1,
-0.4818347, -0.4553093, -1.592089, 1, 1, 1, 1, 1,
-0.4785779, 0.3950972, -0.630293, 1, 1, 1, 1, 1,
-0.4767257, 0.6687679, -0.2603756, 1, 1, 1, 1, 1,
-0.4732207, 0.01807556, -2.040845, 1, 1, 1, 1, 1,
-0.4731452, -0.1092239, -0.3985013, 1, 1, 1, 1, 1,
-0.4595631, -0.9504576, -1.022569, 1, 1, 1, 1, 1,
-0.4588222, -0.6804318, -2.46761, 1, 1, 1, 1, 1,
-0.4576503, 0.2289537, -1.376213, 1, 1, 1, 1, 1,
-0.4547813, -0.06612634, -0.5603286, 1, 1, 1, 1, 1,
-0.4507623, 0.1206591, -2.481328, 1, 1, 1, 1, 1,
-0.4475083, 2.262626, 0.9360198, 1, 1, 1, 1, 1,
-0.4445868, 0.02633201, -1.08514, 0, 0, 1, 1, 1,
-0.4407545, 0.06516219, -3.003346, 1, 0, 0, 1, 1,
-0.4344784, 0.3179991, -1.657852, 1, 0, 0, 1, 1,
-0.4302365, -0.5903585, -1.789317, 1, 0, 0, 1, 1,
-0.4220264, 0.252956, 0.2712551, 1, 0, 0, 1, 1,
-0.4189776, -1.167449, -4.018698, 1, 0, 0, 1, 1,
-0.412832, -0.7499747, -1.432443, 0, 0, 0, 1, 1,
-0.4063278, 0.2851759, 0.3862014, 0, 0, 0, 1, 1,
-0.4007982, -0.1864154, -1.94827, 0, 0, 0, 1, 1,
-0.3900048, 0.777244, -0.7421522, 0, 0, 0, 1, 1,
-0.3887356, 0.2309821, -0.1324531, 0, 0, 0, 1, 1,
-0.3856141, -1.059148, -3.612224, 0, 0, 0, 1, 1,
-0.3840158, -0.2055396, -2.101645, 0, 0, 0, 1, 1,
-0.3828851, -1.387444, -3.166423, 1, 1, 1, 1, 1,
-0.379262, 0.2407111, 0.06257275, 1, 1, 1, 1, 1,
-0.3790928, 1.206496, -0.6847857, 1, 1, 1, 1, 1,
-0.3742583, -0.5923706, -2.95043, 1, 1, 1, 1, 1,
-0.3731806, -0.7828406, -2.681712, 1, 1, 1, 1, 1,
-0.368764, -0.02107777, -0.08338124, 1, 1, 1, 1, 1,
-0.3648236, -1.410259, -5.048985, 1, 1, 1, 1, 1,
-0.3564113, 0.01868662, -1.213024, 1, 1, 1, 1, 1,
-0.3549825, -1.006954, -1.788896, 1, 1, 1, 1, 1,
-0.3521656, -1.364632, -2.166217, 1, 1, 1, 1, 1,
-0.3515415, 1.830765, -0.8692261, 1, 1, 1, 1, 1,
-0.347316, 0.06776026, -0.6986602, 1, 1, 1, 1, 1,
-0.3428927, 0.7394695, -0.6412982, 1, 1, 1, 1, 1,
-0.341076, 0.5230555, 0.1069592, 1, 1, 1, 1, 1,
-0.3376261, 0.703617, 0.2507943, 1, 1, 1, 1, 1,
-0.3373722, -1.864916, -3.07463, 0, 0, 1, 1, 1,
-0.3368792, 1.229248, 0.1280823, 1, 0, 0, 1, 1,
-0.3339621, -0.4954783, -3.030936, 1, 0, 0, 1, 1,
-0.3322729, 0.01997146, -1.76362, 1, 0, 0, 1, 1,
-0.3253345, -0.1169296, -0.04549572, 1, 0, 0, 1, 1,
-0.3240101, 1.564473, 0.9137602, 1, 0, 0, 1, 1,
-0.3153219, 0.4943342, -1.2844, 0, 0, 0, 1, 1,
-0.3132002, 0.4429796, -0.8464679, 0, 0, 0, 1, 1,
-0.3102886, 1.034446, -1.188185, 0, 0, 0, 1, 1,
-0.3091405, 2.257484, -0.2327259, 0, 0, 0, 1, 1,
-0.3069463, 1.189816, -0.9741311, 0, 0, 0, 1, 1,
-0.3031805, -0.4851635, -1.424914, 0, 0, 0, 1, 1,
-0.302379, 1.267872, -0.9792637, 0, 0, 0, 1, 1,
-0.2971286, 1.235705, -0.2983595, 1, 1, 1, 1, 1,
-0.295904, 0.06615435, -1.902134, 1, 1, 1, 1, 1,
-0.2952231, 1.290773, 1.29811, 1, 1, 1, 1, 1,
-0.2917226, 0.09078325, -3.755308, 1, 1, 1, 1, 1,
-0.2895859, 0.760231, 0.1101825, 1, 1, 1, 1, 1,
-0.2859941, 2.207753, -0.3937536, 1, 1, 1, 1, 1,
-0.2839554, 0.6482854, -1.378177, 1, 1, 1, 1, 1,
-0.2812646, 1.619533, -0.4013927, 1, 1, 1, 1, 1,
-0.2794637, -0.4992954, -2.285794, 1, 1, 1, 1, 1,
-0.2790549, 0.2164578, -0.4026005, 1, 1, 1, 1, 1,
-0.277081, -1.009606, -0.3358009, 1, 1, 1, 1, 1,
-0.2740852, -1.486227, -3.334741, 1, 1, 1, 1, 1,
-0.2714318, 0.1659015, -3.226021, 1, 1, 1, 1, 1,
-0.2694508, -2.019201, -3.154219, 1, 1, 1, 1, 1,
-0.2685024, 0.1938449, -1.192245, 1, 1, 1, 1, 1,
-0.2657441, 1.409491, -0.9527037, 0, 0, 1, 1, 1,
-0.2632964, 1.961501, -1.631204, 1, 0, 0, 1, 1,
-0.2548066, 0.247026, -1.131248, 1, 0, 0, 1, 1,
-0.2380314, -0.5405999, -2.861782, 1, 0, 0, 1, 1,
-0.2370711, -2.69775, -3.717514, 1, 0, 0, 1, 1,
-0.2365905, 0.589184, 0.1170937, 1, 0, 0, 1, 1,
-0.2363184, -1.654071, -3.7974, 0, 0, 0, 1, 1,
-0.236214, 0.245359, -0.2290522, 0, 0, 0, 1, 1,
-0.2304215, -0.961118, -0.7848338, 0, 0, 0, 1, 1,
-0.2285755, 1.380604, 0.149159, 0, 0, 0, 1, 1,
-0.2252336, -0.2930662, -2.460029, 0, 0, 0, 1, 1,
-0.2195435, -0.4574011, -3.689377, 0, 0, 0, 1, 1,
-0.2190303, -0.3177004, -2.840135, 0, 0, 0, 1, 1,
-0.2174484, -0.7907846, -3.77885, 1, 1, 1, 1, 1,
-0.2036178, 0.04659081, -1.583357, 1, 1, 1, 1, 1,
-0.1997245, 1.214886, -0.05617838, 1, 1, 1, 1, 1,
-0.1992767, -1.792826, -2.183448, 1, 1, 1, 1, 1,
-0.1973442, -0.1097361, -3.362317, 1, 1, 1, 1, 1,
-0.1914884, 0.5806646, -0.1553392, 1, 1, 1, 1, 1,
-0.189528, -0.04317045, -2.944593, 1, 1, 1, 1, 1,
-0.1884186, 0.02393075, -0.8497117, 1, 1, 1, 1, 1,
-0.1880298, 0.937702, -0.9843351, 1, 1, 1, 1, 1,
-0.1864893, -0.2509784, -2.356808, 1, 1, 1, 1, 1,
-0.1864043, -0.424982, -2.229284, 1, 1, 1, 1, 1,
-0.1827713, -1.408961, -3.595938, 1, 1, 1, 1, 1,
-0.1800132, 1.984617, -0.6829773, 1, 1, 1, 1, 1,
-0.1761831, 0.3494782, 1.10074, 1, 1, 1, 1, 1,
-0.1754799, 1.502853, -0.2689638, 1, 1, 1, 1, 1,
-0.1729965, 0.5608068, -1.470729, 0, 0, 1, 1, 1,
-0.1698749, -0.1258391, -1.738913, 1, 0, 0, 1, 1,
-0.1691058, 0.1625024, -1.734306, 1, 0, 0, 1, 1,
-0.1679906, 0.7691357, 1.5575, 1, 0, 0, 1, 1,
-0.1666433, 0.4268091, -0.8201054, 1, 0, 0, 1, 1,
-0.1587962, 0.652929, -0.02244108, 1, 0, 0, 1, 1,
-0.1546683, -0.6749725, -3.658269, 0, 0, 0, 1, 1,
-0.1543039, -0.1590051, -2.213386, 0, 0, 0, 1, 1,
-0.1488855, -2.038435, -4.001651, 0, 0, 0, 1, 1,
-0.146347, 2.097665, -0.3283397, 0, 0, 0, 1, 1,
-0.1460693, -0.2243182, -1.947962, 0, 0, 0, 1, 1,
-0.1390037, -0.3120231, -2.913597, 0, 0, 0, 1, 1,
-0.1383537, -0.8919398, -5.14825, 0, 0, 0, 1, 1,
-0.1332398, 0.81723, -0.7228876, 1, 1, 1, 1, 1,
-0.1331985, -0.4341381, -2.159044, 1, 1, 1, 1, 1,
-0.1314705, 0.8848647, 0.2358939, 1, 1, 1, 1, 1,
-0.1296811, 0.2461316, -1.577355, 1, 1, 1, 1, 1,
-0.1291896, 0.8284374, 0.2373121, 1, 1, 1, 1, 1,
-0.1283631, -0.9640203, -1.509927, 1, 1, 1, 1, 1,
-0.1243696, 0.5238873, -0.04043985, 1, 1, 1, 1, 1,
-0.1220038, -0.5535138, -2.10956, 1, 1, 1, 1, 1,
-0.1209812, 0.7374439, -0.5932831, 1, 1, 1, 1, 1,
-0.1155607, -1.342962, -1.84438, 1, 1, 1, 1, 1,
-0.1152085, -1.731479, -3.352889, 1, 1, 1, 1, 1,
-0.1077294, 0.682608, -0.6548258, 1, 1, 1, 1, 1,
-0.106711, 0.6017489, -1.203979, 1, 1, 1, 1, 1,
-0.1037022, 0.2743748, 0.4385682, 1, 1, 1, 1, 1,
-0.1032089, -0.9148195, -3.007373, 1, 1, 1, 1, 1,
-0.09819585, -0.04037547, -1.141609, 0, 0, 1, 1, 1,
-0.09794542, -1.420496, -1.124455, 1, 0, 0, 1, 1,
-0.09263449, -1.044982, -2.311559, 1, 0, 0, 1, 1,
-0.08776306, 0.6258179, 0.5851154, 1, 0, 0, 1, 1,
-0.08456443, -1.710351, -2.514609, 1, 0, 0, 1, 1,
-0.07765366, -1.963391, -2.24526, 1, 0, 0, 1, 1,
-0.07738448, 1.142125, 0.4119911, 0, 0, 0, 1, 1,
-0.07007272, 0.8055417, 0.1724053, 0, 0, 0, 1, 1,
-0.0700442, -1.061433, -3.075486, 0, 0, 0, 1, 1,
-0.06941354, 0.4203835, -0.1885125, 0, 0, 0, 1, 1,
-0.06933773, 0.7658306, -1.057887, 0, 0, 0, 1, 1,
-0.06136173, -0.514909, -1.678041, 0, 0, 0, 1, 1,
-0.06015957, 0.03225433, -0.0421866, 0, 0, 0, 1, 1,
-0.05841353, 0.02604447, -0.7092489, 1, 1, 1, 1, 1,
-0.057939, -1.266906, -4.092604, 1, 1, 1, 1, 1,
-0.05774022, 0.8015876, -1.44422, 1, 1, 1, 1, 1,
-0.05737415, 0.2123053, -1.110486, 1, 1, 1, 1, 1,
-0.05607944, 0.8066405, -0.721874, 1, 1, 1, 1, 1,
-0.05510908, -0.9767207, -5.134425, 1, 1, 1, 1, 1,
-0.05403834, -0.1680029, -1.181385, 1, 1, 1, 1, 1,
-0.05238395, -0.5845695, -3.908839, 1, 1, 1, 1, 1,
-0.05066873, -1.478964, -3.149461, 1, 1, 1, 1, 1,
-0.04790071, 0.4286118, -0.1419964, 1, 1, 1, 1, 1,
-0.04671948, -0.3793129, -3.952146, 1, 1, 1, 1, 1,
-0.04425245, 0.9338995, 0.5364124, 1, 1, 1, 1, 1,
-0.04378679, 0.2022064, -1.589624, 1, 1, 1, 1, 1,
-0.03880063, 0.1691966, 0.4809746, 1, 1, 1, 1, 1,
-0.03805331, 0.1519855, -1.019024, 1, 1, 1, 1, 1,
-0.03511772, 1.121041, -1.682994, 0, 0, 1, 1, 1,
-0.03355802, -0.5004893, -3.883842, 1, 0, 0, 1, 1,
-0.02878766, -1.596501, -3.606906, 1, 0, 0, 1, 1,
-0.02761364, 1.277354, -0.2653875, 1, 0, 0, 1, 1,
-0.01834006, 0.1579435, 0.1473921, 1, 0, 0, 1, 1,
-0.01345367, 1.515256, -0.7547516, 1, 0, 0, 1, 1,
-0.009636311, 0.4538674, -0.3954965, 0, 0, 0, 1, 1,
-0.003015086, -0.0144433, -3.358542, 0, 0, 0, 1, 1,
-0.002240107, 0.4260646, 0.7667106, 0, 0, 0, 1, 1,
-0.001948682, -1.316927, -2.523007, 0, 0, 0, 1, 1,
0.001865353, -0.2767241, 3.131035, 0, 0, 0, 1, 1,
0.002478109, -0.6198449, 2.981186, 0, 0, 0, 1, 1,
0.004370132, 0.02435012, 0.3260911, 0, 0, 0, 1, 1,
0.007412394, -1.897605, 3.937254, 1, 1, 1, 1, 1,
0.008182161, -0.07104964, 4.310949, 1, 1, 1, 1, 1,
0.01030408, -0.1686604, 2.868562, 1, 1, 1, 1, 1,
0.0125004, 2.091196, -0.9896598, 1, 1, 1, 1, 1,
0.01457993, 0.300369, 1.162968, 1, 1, 1, 1, 1,
0.01768885, -1.068999, 2.841681, 1, 1, 1, 1, 1,
0.01826259, -0.3484268, 2.802164, 1, 1, 1, 1, 1,
0.02219753, -0.1802911, 2.28442, 1, 1, 1, 1, 1,
0.02270082, 0.8931265, -0.2125884, 1, 1, 1, 1, 1,
0.02474194, 1.558112, -0.5949428, 1, 1, 1, 1, 1,
0.02604121, -1.07505, 2.975731, 1, 1, 1, 1, 1,
0.03046846, 0.9148381, -0.07385197, 1, 1, 1, 1, 1,
0.03085972, 0.01125181, 1.172354, 1, 1, 1, 1, 1,
0.03151866, 1.405304, -0.8009784, 1, 1, 1, 1, 1,
0.03398973, -2.139605, 2.321784, 1, 1, 1, 1, 1,
0.04701147, 0.1085149, 1.262849, 0, 0, 1, 1, 1,
0.04723619, 0.4679661, -0.2994825, 1, 0, 0, 1, 1,
0.04847853, -0.5073963, 2.446491, 1, 0, 0, 1, 1,
0.05403119, -0.1644539, 4.32973, 1, 0, 0, 1, 1,
0.05566819, -1.831406, 1.694911, 1, 0, 0, 1, 1,
0.05742171, 1.306661, 0.9571562, 1, 0, 0, 1, 1,
0.06475986, -0.94306, 2.797137, 0, 0, 0, 1, 1,
0.06662543, -0.09222053, 2.616641, 0, 0, 0, 1, 1,
0.06980775, 0.2127728, 0.6710964, 0, 0, 0, 1, 1,
0.07205962, -0.4228648, 5.281991, 0, 0, 0, 1, 1,
0.07788306, -0.7570988, 2.473278, 0, 0, 0, 1, 1,
0.07977212, -0.1761273, 3.365419, 0, 0, 0, 1, 1,
0.08147026, -0.1060297, 1.765862, 0, 0, 0, 1, 1,
0.08380973, -0.2548642, 2.305952, 1, 1, 1, 1, 1,
0.08735836, -1.20383, 2.121734, 1, 1, 1, 1, 1,
0.0885768, -1.450323, 3.855469, 1, 1, 1, 1, 1,
0.0914849, 0.5575797, 1.34885, 1, 1, 1, 1, 1,
0.09177681, -1.286379, 2.798357, 1, 1, 1, 1, 1,
0.09310234, 0.8486975, 0.5478277, 1, 1, 1, 1, 1,
0.09369438, -0.9131305, 4.020286, 1, 1, 1, 1, 1,
0.09454788, -2.293292, 2.754949, 1, 1, 1, 1, 1,
0.1023242, -0.5338723, 2.696682, 1, 1, 1, 1, 1,
0.108456, 1.447954, 1.051004, 1, 1, 1, 1, 1,
0.1162066, -0.9358795, 3.569045, 1, 1, 1, 1, 1,
0.1199556, -1.441017, 2.458753, 1, 1, 1, 1, 1,
0.1223152, -0.8919077, 3.743304, 1, 1, 1, 1, 1,
0.1271846, -0.9440205, 3.455293, 1, 1, 1, 1, 1,
0.1284702, -0.8750462, 3.151983, 1, 1, 1, 1, 1,
0.1286223, 0.2011449, -1.251796, 0, 0, 1, 1, 1,
0.1432576, -1.101193, 3.277641, 1, 0, 0, 1, 1,
0.14354, 1.231488, -0.5977811, 1, 0, 0, 1, 1,
0.1453784, -0.5908902, 3.207581, 1, 0, 0, 1, 1,
0.1498297, 0.9624786, -0.9230762, 1, 0, 0, 1, 1,
0.1499448, 0.8001767, 1.523711, 1, 0, 0, 1, 1,
0.1533106, 0.8435427, 0.3244846, 0, 0, 0, 1, 1,
0.154272, -2.142355, 2.395457, 0, 0, 0, 1, 1,
0.155636, -0.3266619, 3.173676, 0, 0, 0, 1, 1,
0.1576431, -2.105281, 2.266056, 0, 0, 0, 1, 1,
0.1576898, -1.80558, 2.577286, 0, 0, 0, 1, 1,
0.1584703, -0.2324159, 3.420357, 0, 0, 0, 1, 1,
0.1663852, 0.5629823, -1.239684, 0, 0, 0, 1, 1,
0.1663993, -0.2099319, 3.512154, 1, 1, 1, 1, 1,
0.1665819, -0.09070472, 1.220696, 1, 1, 1, 1, 1,
0.169286, 1.851482, -0.05579235, 1, 1, 1, 1, 1,
0.171523, -0.3198647, 1.782582, 1, 1, 1, 1, 1,
0.1727252, 0.08591118, 0.9639987, 1, 1, 1, 1, 1,
0.1754832, -0.8028816, 3.06798, 1, 1, 1, 1, 1,
0.1755416, 0.7308661, 1.952714, 1, 1, 1, 1, 1,
0.1783276, 0.2831516, 0.1457034, 1, 1, 1, 1, 1,
0.1811213, 1.201193, 0.831705, 1, 1, 1, 1, 1,
0.1843693, -1.027701, 4.521317, 1, 1, 1, 1, 1,
0.1875116, 0.07741849, 2.204801, 1, 1, 1, 1, 1,
0.1887728, -0.7711104, 2.763499, 1, 1, 1, 1, 1,
0.1940265, 0.00274043, -0.1374393, 1, 1, 1, 1, 1,
0.1942703, -0.1471081, 2.708333, 1, 1, 1, 1, 1,
0.194748, 0.3816883, 0.5708017, 1, 1, 1, 1, 1,
0.1950954, 0.5652815, -1.942133, 0, 0, 1, 1, 1,
0.195499, 0.4763916, -0.6878922, 1, 0, 0, 1, 1,
0.1977726, -1.112979, 2.780265, 1, 0, 0, 1, 1,
0.2038852, -1.336452, 4.031297, 1, 0, 0, 1, 1,
0.2054831, 1.079325, 0.8870663, 1, 0, 0, 1, 1,
0.2088061, 0.1329992, -1.101645, 1, 0, 0, 1, 1,
0.211006, 0.7161042, -0.1541273, 0, 0, 0, 1, 1,
0.211898, 1.001255, 0.3438859, 0, 0, 0, 1, 1,
0.2131202, 0.07707858, -0.8966622, 0, 0, 0, 1, 1,
0.2150195, 2.294662, -0.6395803, 0, 0, 0, 1, 1,
0.2169754, -0.06620399, 2.168577, 0, 0, 0, 1, 1,
0.2174678, 1.284264, 2.370482, 0, 0, 0, 1, 1,
0.2209017, 1.600853, -0.3104413, 0, 0, 0, 1, 1,
0.2218421, 0.09568264, -0.177773, 1, 1, 1, 1, 1,
0.22281, 0.7025365, -1.123926, 1, 1, 1, 1, 1,
0.2284282, 0.6735269, 1.394841, 1, 1, 1, 1, 1,
0.2328117, -0.9084145, 3.337261, 1, 1, 1, 1, 1,
0.2328502, 1.856888, 0.3174503, 1, 1, 1, 1, 1,
0.2341318, -0.9410958, 2.431794, 1, 1, 1, 1, 1,
0.2347518, -0.1295296, 2.174427, 1, 1, 1, 1, 1,
0.2357633, 1.24213, -0.4131963, 1, 1, 1, 1, 1,
0.2386249, -0.9365184, 2.716492, 1, 1, 1, 1, 1,
0.2422175, -0.4003995, 2.46964, 1, 1, 1, 1, 1,
0.2425006, -1.191861, 3.90362, 1, 1, 1, 1, 1,
0.2436135, -0.78502, 3.327469, 1, 1, 1, 1, 1,
0.2447108, -1.388234, 2.349196, 1, 1, 1, 1, 1,
0.2461293, -0.06720001, 2.744255, 1, 1, 1, 1, 1,
0.2485647, 1.474956, -0.8274932, 1, 1, 1, 1, 1,
0.2555864, 0.2851053, -1.265513, 0, 0, 1, 1, 1,
0.2567889, -0.5356443, 3.549974, 1, 0, 0, 1, 1,
0.2631849, 0.6942212, -0.8943554, 1, 0, 0, 1, 1,
0.2649338, -0.5895475, 2.961912, 1, 0, 0, 1, 1,
0.2724401, 0.4152972, -0.2820936, 1, 0, 0, 1, 1,
0.279709, -0.527442, 1.730007, 1, 0, 0, 1, 1,
0.281168, 0.3100663, 1.769948, 0, 0, 0, 1, 1,
0.289759, -0.7413805, 2.745896, 0, 0, 0, 1, 1,
0.2988499, 0.1526877, 0.3850546, 0, 0, 0, 1, 1,
0.3002697, -0.6794224, 1.693999, 0, 0, 0, 1, 1,
0.301744, 0.3489136, 0.5002986, 0, 0, 0, 1, 1,
0.3040877, -0.7562379, 1.836501, 0, 0, 0, 1, 1,
0.3051478, -0.232052, 2.212054, 0, 0, 0, 1, 1,
0.3072107, -1.983025, 2.568908, 1, 1, 1, 1, 1,
0.3093098, -0.04462913, 1.147206, 1, 1, 1, 1, 1,
0.3161748, -1.359481, 3.796997, 1, 1, 1, 1, 1,
0.322744, 0.5195767, 1.123403, 1, 1, 1, 1, 1,
0.3230292, 1.199173, 0.8011174, 1, 1, 1, 1, 1,
0.323323, 1.042297, -0.5811666, 1, 1, 1, 1, 1,
0.3239858, 0.4676659, 1.709716, 1, 1, 1, 1, 1,
0.3248308, 2.15386, 1.940101, 1, 1, 1, 1, 1,
0.3275726, 0.4898772, 0.9798998, 1, 1, 1, 1, 1,
0.3284524, -0.02950733, 1.335102, 1, 1, 1, 1, 1,
0.3374783, -2.041875, 4.523817, 1, 1, 1, 1, 1,
0.34053, 1.097666, 1.353985, 1, 1, 1, 1, 1,
0.3444377, -0.9650549, 2.087388, 1, 1, 1, 1, 1,
0.3476402, 1.736458, -0.631397, 1, 1, 1, 1, 1,
0.3486608, -0.1274727, 0.5429636, 1, 1, 1, 1, 1,
0.3539834, 0.8911678, -0.5327511, 0, 0, 1, 1, 1,
0.3587661, -0.683922, 3.338218, 1, 0, 0, 1, 1,
0.3589927, -0.2076556, 2.670621, 1, 0, 0, 1, 1,
0.3678839, 1.358473, 1.327388, 1, 0, 0, 1, 1,
0.3688951, -0.9737866, 2.014389, 1, 0, 0, 1, 1,
0.3720461, -1.46088, 3.029498, 1, 0, 0, 1, 1,
0.3783796, -0.8601615, 1.72952, 0, 0, 0, 1, 1,
0.3789679, 0.4051347, 0.8468655, 0, 0, 0, 1, 1,
0.3800213, -0.2698126, 1.310485, 0, 0, 0, 1, 1,
0.3824982, 1.565642, 1.045664, 0, 0, 0, 1, 1,
0.3840193, 0.301513, 0.910678, 0, 0, 0, 1, 1,
0.3854063, 1.329945, 1.502254, 0, 0, 0, 1, 1,
0.3923146, 1.242008, 1.579289, 0, 0, 0, 1, 1,
0.3978336, -0.1004386, 2.83012, 1, 1, 1, 1, 1,
0.3981113, 1.092841, -1.121836, 1, 1, 1, 1, 1,
0.4002138, -0.3594843, 2.975061, 1, 1, 1, 1, 1,
0.4070194, 0.09026624, -0.8341631, 1, 1, 1, 1, 1,
0.4083866, 1.485746, -0.2614523, 1, 1, 1, 1, 1,
0.4103926, 1.281463, 0.7827417, 1, 1, 1, 1, 1,
0.411138, -0.02530161, 2.442459, 1, 1, 1, 1, 1,
0.4126146, -1.697085, 3.66573, 1, 1, 1, 1, 1,
0.4142086, 0.514549, 0.2312715, 1, 1, 1, 1, 1,
0.4178984, 0.4285736, 1.015999, 1, 1, 1, 1, 1,
0.4188375, -1.578933, 3.529816, 1, 1, 1, 1, 1,
0.4207982, 0.04016939, 0.8492407, 1, 1, 1, 1, 1,
0.4268013, -0.1843227, 0.7709044, 1, 1, 1, 1, 1,
0.429401, 1.21673, 0.5117443, 1, 1, 1, 1, 1,
0.43315, -0.1043574, 2.872851, 1, 1, 1, 1, 1,
0.4377007, -0.4252629, 3.81194, 0, 0, 1, 1, 1,
0.4397817, 1.196998, -1.028455, 1, 0, 0, 1, 1,
0.4440505, -0.930702, 3.91359, 1, 0, 0, 1, 1,
0.4452562, 0.4330412, 0.04936153, 1, 0, 0, 1, 1,
0.4564791, -0.8618343, 0.9901628, 1, 0, 0, 1, 1,
0.4615709, -1.910838, 2.542138, 1, 0, 0, 1, 1,
0.4622914, -0.8477044, 2.822063, 0, 0, 0, 1, 1,
0.4715017, 0.1074671, 1.770984, 0, 0, 0, 1, 1,
0.4733555, -1.559111, 2.884647, 0, 0, 0, 1, 1,
0.4752145, 1.34554, -1.733856, 0, 0, 0, 1, 1,
0.4762054, -1.345906, 3.639483, 0, 0, 0, 1, 1,
0.4777068, -0.6983404, 4.031444, 0, 0, 0, 1, 1,
0.4790932, 0.381061, 1.4059, 0, 0, 0, 1, 1,
0.4806246, -0.9357113, 2.179796, 1, 1, 1, 1, 1,
0.4811277, -0.178202, -0.8123803, 1, 1, 1, 1, 1,
0.490165, -0.4739873, 2.255893, 1, 1, 1, 1, 1,
0.4931661, -1.414307, 2.817281, 1, 1, 1, 1, 1,
0.4960172, 0.8374781, 1.177504, 1, 1, 1, 1, 1,
0.5014957, -1.24457, 1.652896, 1, 1, 1, 1, 1,
0.5019469, -0.7599824, 2.966398, 1, 1, 1, 1, 1,
0.5030727, -0.3524374, 2.094072, 1, 1, 1, 1, 1,
0.5077195, 0.7284777, 0.9923655, 1, 1, 1, 1, 1,
0.5139653, -1.053911, 1.454908, 1, 1, 1, 1, 1,
0.5162252, -0.2062401, 0.5330017, 1, 1, 1, 1, 1,
0.5163806, -0.1001835, 1.790024, 1, 1, 1, 1, 1,
0.5164393, 0.05858056, 0.5994132, 1, 1, 1, 1, 1,
0.5215653, 0.1395311, 2.548369, 1, 1, 1, 1, 1,
0.5248998, 2.093835, 0.6725795, 1, 1, 1, 1, 1,
0.5250906, -1.046863, 3.78205, 0, 0, 1, 1, 1,
0.5274508, -0.0524146, 1.249495, 1, 0, 0, 1, 1,
0.5319383, 1.11469, 0.7843009, 1, 0, 0, 1, 1,
0.532163, 0.8053554, -0.3909952, 1, 0, 0, 1, 1,
0.5438665, -0.4498505, 0.8777894, 1, 0, 0, 1, 1,
0.5522128, 1.503881, 0.01958533, 1, 0, 0, 1, 1,
0.5556824, 0.259613, -0.1277289, 0, 0, 0, 1, 1,
0.5632031, 1.695688, -0.117906, 0, 0, 0, 1, 1,
0.5642606, 2.548471, -0.9298787, 0, 0, 0, 1, 1,
0.5696612, -1.227069, 1.878316, 0, 0, 0, 1, 1,
0.569719, -1.71764, 3.184804, 0, 0, 0, 1, 1,
0.5700946, 0.4602842, 0.8992354, 0, 0, 0, 1, 1,
0.570754, -0.957654, 2.713885, 0, 0, 0, 1, 1,
0.5712909, 1.05244, -0.2085044, 1, 1, 1, 1, 1,
0.5719271, -1.213405, 0.6968288, 1, 1, 1, 1, 1,
0.5723906, 0.3062844, 1.139145, 1, 1, 1, 1, 1,
0.5752795, -0.8121798, 2.451613, 1, 1, 1, 1, 1,
0.5759345, -1.795759, 1.656156, 1, 1, 1, 1, 1,
0.5866432, 0.2562701, 0.2354623, 1, 1, 1, 1, 1,
0.5884115, 0.1548551, 1.262323, 1, 1, 1, 1, 1,
0.5887064, 2.262336, -0.1206884, 1, 1, 1, 1, 1,
0.5906219, 0.1274311, 0.7120172, 1, 1, 1, 1, 1,
0.5910695, 0.5641465, -0.8702909, 1, 1, 1, 1, 1,
0.5917426, -0.09401365, 0.5852008, 1, 1, 1, 1, 1,
0.5923387, -1.917996, 2.660718, 1, 1, 1, 1, 1,
0.5928498, 0.8423046, 1.098066, 1, 1, 1, 1, 1,
0.593717, -0.5948579, 1.910411, 1, 1, 1, 1, 1,
0.5963973, -0.05181017, 1.32597, 1, 1, 1, 1, 1,
0.5975128, 1.028996, -0.5428908, 0, 0, 1, 1, 1,
0.5988764, -0.4297639, 3.472763, 1, 0, 0, 1, 1,
0.5997501, 0.4660355, 1.56847, 1, 0, 0, 1, 1,
0.6020575, -0.0403588, 1.766801, 1, 0, 0, 1, 1,
0.6021508, -1.175553, 3.534585, 1, 0, 0, 1, 1,
0.6034046, -0.6328476, 2.384168, 1, 0, 0, 1, 1,
0.6036568, 1.028712, -0.0681154, 0, 0, 0, 1, 1,
0.6055298, 0.05389817, 1.023341, 0, 0, 0, 1, 1,
0.6157169, 0.5253665, -0.3627047, 0, 0, 0, 1, 1,
0.6164215, -1.573305, 2.779531, 0, 0, 0, 1, 1,
0.6170484, -1.310224, 2.472269, 0, 0, 0, 1, 1,
0.6249821, 0.1937797, 1.190642, 0, 0, 0, 1, 1,
0.6256464, 2.062914, 0.297685, 0, 0, 0, 1, 1,
0.6268803, 0.6519468, 0.2228141, 1, 1, 1, 1, 1,
0.6293657, 1.018411, 1.823678, 1, 1, 1, 1, 1,
0.6328406, 0.717823, 1.917593, 1, 1, 1, 1, 1,
0.6366599, 0.7921746, -1.657899, 1, 1, 1, 1, 1,
0.6376581, -1.206921, 2.537116, 1, 1, 1, 1, 1,
0.6405699, -0.5388488, 4.083573, 1, 1, 1, 1, 1,
0.6418232, -0.6850549, 2.460912, 1, 1, 1, 1, 1,
0.6423337, 0.1153986, 0.2221406, 1, 1, 1, 1, 1,
0.6506821, -0.07347593, 2.137451, 1, 1, 1, 1, 1,
0.6507972, 0.8178858, 1.201594, 1, 1, 1, 1, 1,
0.6513337, 0.8316359, 0.5427482, 1, 1, 1, 1, 1,
0.6513405, -1.326446, 2.832929, 1, 1, 1, 1, 1,
0.6520915, 1.37005, 0.08044953, 1, 1, 1, 1, 1,
0.6550558, 0.948447, -1.580812, 1, 1, 1, 1, 1,
0.6604563, 0.2206843, 0.1905955, 1, 1, 1, 1, 1,
0.6616223, 0.2283063, -0.0955886, 0, 0, 1, 1, 1,
0.6652745, 1.190202, -1.988389, 1, 0, 0, 1, 1,
0.6666371, -1.544309, 3.459562, 1, 0, 0, 1, 1,
0.6679663, 0.4158298, 3.348086, 1, 0, 0, 1, 1,
0.6726738, -1.787717, 2.980311, 1, 0, 0, 1, 1,
0.6735752, -0.02910649, 0.1927374, 1, 0, 0, 1, 1,
0.6755687, -1.617828, 3.08373, 0, 0, 0, 1, 1,
0.6790667, -0.6811616, 3.149656, 0, 0, 0, 1, 1,
0.6796044, 1.705595, 0.8757619, 0, 0, 0, 1, 1,
0.683064, 0.6728789, -0.1082103, 0, 0, 0, 1, 1,
0.686249, 0.4216022, 2.323968, 0, 0, 0, 1, 1,
0.6878039, -0.7040043, 2.512284, 0, 0, 0, 1, 1,
0.6949386, -1.729505, 4.625731, 0, 0, 0, 1, 1,
0.7018267, 1.008037, 0.00322751, 1, 1, 1, 1, 1,
0.7112216, 1.314704, 0.7827747, 1, 1, 1, 1, 1,
0.7143674, -0.8012446, 3.870732, 1, 1, 1, 1, 1,
0.7199824, 0.8800145, 0.4542423, 1, 1, 1, 1, 1,
0.7243003, 0.2640674, 1.849643, 1, 1, 1, 1, 1,
0.7312166, 0.6285899, 1.880391, 1, 1, 1, 1, 1,
0.7351609, -1.036911, 4.160352, 1, 1, 1, 1, 1,
0.7515036, 0.2514878, 2.304333, 1, 1, 1, 1, 1,
0.7544231, -1.51391, 4.122375, 1, 1, 1, 1, 1,
0.7619328, 1.250627, -0.1893918, 1, 1, 1, 1, 1,
0.7620112, 1.021272, 2.366169, 1, 1, 1, 1, 1,
0.7631173, 0.7302401, 1.694338, 1, 1, 1, 1, 1,
0.7661807, -0.1928988, 0.7143993, 1, 1, 1, 1, 1,
0.7764358, -0.8352109, 1.185311, 1, 1, 1, 1, 1,
0.7775869, -0.5495042, 0.3248464, 1, 1, 1, 1, 1,
0.7825924, -0.9444855, 1.723492, 0, 0, 1, 1, 1,
0.782859, -1.456876, 3.231343, 1, 0, 0, 1, 1,
0.7856911, 0.7025957, 1.239844, 1, 0, 0, 1, 1,
0.7857656, 0.3046734, 1.498812, 1, 0, 0, 1, 1,
0.7924353, 0.1677401, 3.109373, 1, 0, 0, 1, 1,
0.7950477, 1.153785, -0.300239, 1, 0, 0, 1, 1,
0.7968744, -1.435768, 1.621376, 0, 0, 0, 1, 1,
0.7983769, -0.4626303, -0.1835378, 0, 0, 0, 1, 1,
0.800015, -2.372576, 3.582184, 0, 0, 0, 1, 1,
0.803219, 0.3660104, 1.126059, 0, 0, 0, 1, 1,
0.8075902, -0.5905499, 3.391639, 0, 0, 0, 1, 1,
0.809278, 0.05630909, -0.04483768, 0, 0, 0, 1, 1,
0.8119951, -0.2797235, 2.132363, 0, 0, 0, 1, 1,
0.8156382, -2.469423, 3.310221, 1, 1, 1, 1, 1,
0.81576, -1.126865, 1.90792, 1, 1, 1, 1, 1,
0.8189263, -2.47333, 2.56221, 1, 1, 1, 1, 1,
0.8207853, 0.4538658, 1.788507, 1, 1, 1, 1, 1,
0.8264348, -0.4633148, 1.299452, 1, 1, 1, 1, 1,
0.8276549, -0.5810333, 2.545469, 1, 1, 1, 1, 1,
0.8309758, -0.1825562, 3.1728, 1, 1, 1, 1, 1,
0.8624212, -0.921604, 2.534973, 1, 1, 1, 1, 1,
0.8635517, -1.332995, 3.318563, 1, 1, 1, 1, 1,
0.8653489, 0.4515198, 1.757995, 1, 1, 1, 1, 1,
0.8831254, -0.2944845, 1.697338, 1, 1, 1, 1, 1,
0.8841388, -0.253884, 2.842433, 1, 1, 1, 1, 1,
0.8861914, 0.4276285, 3.544677, 1, 1, 1, 1, 1,
0.8883759, -0.6030352, 0.5663997, 1, 1, 1, 1, 1,
0.8913655, 0.15349, 3.468403, 1, 1, 1, 1, 1,
0.8975778, -0.9441827, 2.94478, 0, 0, 1, 1, 1,
0.8997465, -1.025553, 1.95841, 1, 0, 0, 1, 1,
0.9054948, 0.9035501, 1.154037, 1, 0, 0, 1, 1,
0.9066076, 1.517838, -0.06714426, 1, 0, 0, 1, 1,
0.9164244, 1.107391, 0.1238581, 1, 0, 0, 1, 1,
0.9215994, 1.590306, 0.7376179, 1, 0, 0, 1, 1,
0.9226117, -0.7049685, 1.556857, 0, 0, 0, 1, 1,
0.9413432, 1.475635, 0.4477598, 0, 0, 0, 1, 1,
0.9428829, -1.130103, 2.557889, 0, 0, 0, 1, 1,
0.9433789, -0.4503193, 1.378248, 0, 0, 0, 1, 1,
0.96685, 0.06897867, 0.6126767, 0, 0, 0, 1, 1,
0.9669093, 0.6857066, 1.666916, 0, 0, 0, 1, 1,
0.9718034, 0.4229863, 0.184316, 0, 0, 0, 1, 1,
0.9740348, 0.06824187, 0.6128706, 1, 1, 1, 1, 1,
0.9782196, -0.4491808, 1.206584, 1, 1, 1, 1, 1,
0.981941, -0.3962503, 2.942565, 1, 1, 1, 1, 1,
0.9826137, 0.8932329, 0.5770757, 1, 1, 1, 1, 1,
0.9836687, 0.006311859, 2.749231, 1, 1, 1, 1, 1,
0.9879532, -0.9735544, 2.902382, 1, 1, 1, 1, 1,
0.9949986, 1.16089, 0.329272, 1, 1, 1, 1, 1,
0.9973385, -0.2096426, 0.5009231, 1, 1, 1, 1, 1,
0.998193, 1.020018, -0.07243401, 1, 1, 1, 1, 1,
1.004144, -0.2642262, 2.27933, 1, 1, 1, 1, 1,
1.006679, -0.9852186, 2.791761, 1, 1, 1, 1, 1,
1.008648, -1.073294, 1.122714, 1, 1, 1, 1, 1,
1.008972, -1.509632, 3.523419, 1, 1, 1, 1, 1,
1.014961, -0.3338415, 0.6787655, 1, 1, 1, 1, 1,
1.02569, 0.1399418, 1.590428, 1, 1, 1, 1, 1,
1.029898, -1.105012, 2.488134, 0, 0, 1, 1, 1,
1.033698, -1.643078, 0.2792988, 1, 0, 0, 1, 1,
1.034918, 0.2820394, 1.762534, 1, 0, 0, 1, 1,
1.035493, 1.294338, 1.091191, 1, 0, 0, 1, 1,
1.038996, 2.007258, -0.4952341, 1, 0, 0, 1, 1,
1.044795, -0.5507481, 2.996086, 1, 0, 0, 1, 1,
1.050081, -0.04606162, 2.237521, 0, 0, 0, 1, 1,
1.050714, 1.69592, 0.6610761, 0, 0, 0, 1, 1,
1.053532, -0.4250475, 1.65633, 0, 0, 0, 1, 1,
1.060863, -1.008417, 1.774971, 0, 0, 0, 1, 1,
1.063081, -0.3787943, 2.060453, 0, 0, 0, 1, 1,
1.06584, -1.511716, 0.9073673, 0, 0, 0, 1, 1,
1.066644, -1.082772, 2.357311, 0, 0, 0, 1, 1,
1.070729, 0.1654262, 2.021756, 1, 1, 1, 1, 1,
1.072722, 0.8957651, 0.7102648, 1, 1, 1, 1, 1,
1.075445, 0.2838773, 2.030877, 1, 1, 1, 1, 1,
1.078883, 0.7562376, 0.2189056, 1, 1, 1, 1, 1,
1.091452, -0.09549887, 2.680763, 1, 1, 1, 1, 1,
1.095487, -0.888199, 3.188366, 1, 1, 1, 1, 1,
1.096513, -1.689822, 2.241314, 1, 1, 1, 1, 1,
1.10112, 1.24427, 2.08774, 1, 1, 1, 1, 1,
1.103059, 0.4661578, -0.9926925, 1, 1, 1, 1, 1,
1.10743, -1.380309, 2.097083, 1, 1, 1, 1, 1,
1.107989, -0.07192097, 0.9628204, 1, 1, 1, 1, 1,
1.112038, -0.7016191, 1.798899, 1, 1, 1, 1, 1,
1.114097, 0.5859045, 2.150947, 1, 1, 1, 1, 1,
1.124066, -0.594821, 0.9076633, 1, 1, 1, 1, 1,
1.125274, -0.9404681, 2.817847, 1, 1, 1, 1, 1,
1.13191, 1.110172, 0.3665984, 0, 0, 1, 1, 1,
1.149432, 2.147283, 0.2704935, 1, 0, 0, 1, 1,
1.151033, 0.2115046, 0.950731, 1, 0, 0, 1, 1,
1.155405, -1.354288, 3.253239, 1, 0, 0, 1, 1,
1.155935, 0.2775848, 2.176868, 1, 0, 0, 1, 1,
1.15781, 0.5465398, 1.613317, 1, 0, 0, 1, 1,
1.159431, -0.8634604, 3.207206, 0, 0, 0, 1, 1,
1.160719, 0.4862919, 1.685892, 0, 0, 0, 1, 1,
1.167517, -0.5343055, 1.217883, 0, 0, 0, 1, 1,
1.169476, -2.000269, 1.752044, 0, 0, 0, 1, 1,
1.171606, -0.7357178, 1.429784, 0, 0, 0, 1, 1,
1.172548, -0.07489894, 0.5815161, 0, 0, 0, 1, 1,
1.173234, -0.242416, 1.939752, 0, 0, 0, 1, 1,
1.180707, 1.059497, 0.2216716, 1, 1, 1, 1, 1,
1.182744, -0.3354596, 1.700454, 1, 1, 1, 1, 1,
1.188189, -0.4702623, 1.25885, 1, 1, 1, 1, 1,
1.190219, 0.01117704, -0.2159929, 1, 1, 1, 1, 1,
1.195175, -0.795709, 1.712788, 1, 1, 1, 1, 1,
1.195347, -0.9063379, 3.18257, 1, 1, 1, 1, 1,
1.204008, 0.2166137, 1.365204, 1, 1, 1, 1, 1,
1.219627, 1.155913, 1.688027, 1, 1, 1, 1, 1,
1.224091, -1.17843, 2.236783, 1, 1, 1, 1, 1,
1.246228, -0.1333194, 2.909799, 1, 1, 1, 1, 1,
1.252567, -0.2544729, 1.295788, 1, 1, 1, 1, 1,
1.272335, -0.3507264, 0.3854586, 1, 1, 1, 1, 1,
1.280517, 0.566669, 0.9668896, 1, 1, 1, 1, 1,
1.282939, -0.02545835, 1.460669, 1, 1, 1, 1, 1,
1.290892, -0.6526547, 3.216876, 1, 1, 1, 1, 1,
1.295336, -0.4406976, 1.017488, 0, 0, 1, 1, 1,
1.297873, 0.9970213, -0.2000817, 1, 0, 0, 1, 1,
1.301773, 0.79208, -0.1828998, 1, 0, 0, 1, 1,
1.302723, 0.7833767, 1.906521, 1, 0, 0, 1, 1,
1.305249, -1.822815, 2.235994, 1, 0, 0, 1, 1,
1.307911, 1.235553, 0.6208819, 1, 0, 0, 1, 1,
1.312769, -0.1626823, 0.1238603, 0, 0, 0, 1, 1,
1.31927, 0.9642737, -0.6421926, 0, 0, 0, 1, 1,
1.322558, 0.7005771, 1.788142, 0, 0, 0, 1, 1,
1.326272, 1.469279, 0.8187269, 0, 0, 0, 1, 1,
1.329538, -0.9099705, 1.37731, 0, 0, 0, 1, 1,
1.336381, -0.8862892, 2.690712, 0, 0, 0, 1, 1,
1.339061, -0.2056978, 1.169413, 0, 0, 0, 1, 1,
1.356068, 1.193188, 0.3693878, 1, 1, 1, 1, 1,
1.364775, 1.116129, 3.03129, 1, 1, 1, 1, 1,
1.374272, -1.839442, 2.424456, 1, 1, 1, 1, 1,
1.375089, 1.290487, 0.5928371, 1, 1, 1, 1, 1,
1.381922, 1.012597, 2.771108, 1, 1, 1, 1, 1,
1.391561, -1.348425, 1.558088, 1, 1, 1, 1, 1,
1.398262, -0.4678237, 0.04472402, 1, 1, 1, 1, 1,
1.406945, 0.2143865, 1.960578, 1, 1, 1, 1, 1,
1.410156, 2.476578, 2.037058, 1, 1, 1, 1, 1,
1.427101, -0.2583309, 1.551728, 1, 1, 1, 1, 1,
1.429097, 0.3333527, 0.3936961, 1, 1, 1, 1, 1,
1.431914, 2.289234, 1.854522, 1, 1, 1, 1, 1,
1.438824, -0.569676, 3.676761, 1, 1, 1, 1, 1,
1.442603, -0.4526362, 3.280319, 1, 1, 1, 1, 1,
1.445358, 0.6721655, 1.605791, 1, 1, 1, 1, 1,
1.461736, -1.70761, 1.861295, 0, 0, 1, 1, 1,
1.466224, 1.015228, 1.377006, 1, 0, 0, 1, 1,
1.475028, -0.7772904, 2.130492, 1, 0, 0, 1, 1,
1.478015, -0.5575749, 3.784702, 1, 0, 0, 1, 1,
1.478562, -0.9040729, 2.37967, 1, 0, 0, 1, 1,
1.485562, -0.6975236, 2.073324, 1, 0, 0, 1, 1,
1.486452, 1.879508, -1.287812, 0, 0, 0, 1, 1,
1.494731, 0.01053566, 0.3020886, 0, 0, 0, 1, 1,
1.494758, 0.2825371, 1.775485, 0, 0, 0, 1, 1,
1.49989, 0.6364176, 1.717211, 0, 0, 0, 1, 1,
1.509817, -1.162937, 1.741118, 0, 0, 0, 1, 1,
1.510342, -2.454353, 2.058331, 0, 0, 0, 1, 1,
1.515335, -0.1509656, 0.5213969, 0, 0, 0, 1, 1,
1.54134, 0.3382314, 1.34603, 1, 1, 1, 1, 1,
1.542694, -1.52216, 3.893926, 1, 1, 1, 1, 1,
1.546644, 0.99915, -0.3299504, 1, 1, 1, 1, 1,
1.55008, -0.04622739, 0.9585382, 1, 1, 1, 1, 1,
1.555486, 0.8028378, 1.407105, 1, 1, 1, 1, 1,
1.556581, 0.08379622, 1.490573, 1, 1, 1, 1, 1,
1.562967, 0.6238678, 0.9061934, 1, 1, 1, 1, 1,
1.56438, 0.2673086, 1.447797, 1, 1, 1, 1, 1,
1.56879, 0.1359719, -0.08829159, 1, 1, 1, 1, 1,
1.580316, 0.1016561, 1.747599, 1, 1, 1, 1, 1,
1.587905, -1.76386, 2.888784, 1, 1, 1, 1, 1,
1.593723, -0.4597015, 3.043323, 1, 1, 1, 1, 1,
1.618042, 0.5736167, 1.538096, 1, 1, 1, 1, 1,
1.622018, 0.09214787, 0.8376291, 1, 1, 1, 1, 1,
1.627721, -0.9750027, 2.07623, 1, 1, 1, 1, 1,
1.644503, 0.04476588, 2.12279, 0, 0, 1, 1, 1,
1.649579, -0.6145561, 1.06184, 1, 0, 0, 1, 1,
1.659411, -0.5274657, 2.25036, 1, 0, 0, 1, 1,
1.659725, 0.8541304, -0.9308282, 1, 0, 0, 1, 1,
1.67296, -0.5862153, 0.07170948, 1, 0, 0, 1, 1,
1.694768, -2.277737, 3.049324, 1, 0, 0, 1, 1,
1.697418, -0.350947, 1.23642, 0, 0, 0, 1, 1,
1.731878, 1.256282, 2.995453, 0, 0, 0, 1, 1,
1.734303, -0.4309582, 0.0006152716, 0, 0, 0, 1, 1,
1.766612, -0.383821, 3.506446, 0, 0, 0, 1, 1,
1.770917, 1.125796, 1.499081, 0, 0, 0, 1, 1,
1.793293, 1.119247, 0.746635, 0, 0, 0, 1, 1,
1.806895, -1.030916, 0.9056591, 0, 0, 0, 1, 1,
1.820294, -0.2453254, 1.482825, 1, 1, 1, 1, 1,
1.833641, 0.2625528, 0.7045403, 1, 1, 1, 1, 1,
1.862851, 0.5167462, 2.56114, 1, 1, 1, 1, 1,
1.888614, 0.8358557, 1.360833, 1, 1, 1, 1, 1,
1.893838, 1.135872, 1.041319, 1, 1, 1, 1, 1,
1.921417, 1.123138, 1.201582, 1, 1, 1, 1, 1,
1.950408, -0.2844006, 1.100735, 1, 1, 1, 1, 1,
1.977086, 0.4699965, 2.278454, 1, 1, 1, 1, 1,
1.982648, -1.162961, -0.030594, 1, 1, 1, 1, 1,
1.982877, 0.6728631, 2.467129, 1, 1, 1, 1, 1,
1.9892, 1.226401, 1.86297, 1, 1, 1, 1, 1,
2.017123, -0.4940522, 2.184669, 1, 1, 1, 1, 1,
2.033902, -1.727464, 3.803389, 1, 1, 1, 1, 1,
2.035393, -2.268825, 3.235624, 1, 1, 1, 1, 1,
2.093718, 0.7346449, 2.477828, 1, 1, 1, 1, 1,
2.101008, -1.702342, 1.390273, 0, 0, 1, 1, 1,
2.11343, -0.8246354, 2.764227, 1, 0, 0, 1, 1,
2.135933, -0.6185156, 1.930413, 1, 0, 0, 1, 1,
2.136655, -0.1678966, 3.697709, 1, 0, 0, 1, 1,
2.148598, -0.01303527, 2.02684, 1, 0, 0, 1, 1,
2.198928, -0.3481633, 2.094167, 1, 0, 0, 1, 1,
2.224866, 0.1247972, 3.621212, 0, 0, 0, 1, 1,
2.272859, 2.346982, -1.352948, 0, 0, 0, 1, 1,
2.299159, -0.6506348, 2.212941, 0, 0, 0, 1, 1,
2.308641, -1.343216, 1.738379, 0, 0, 0, 1, 1,
2.32068, 0.8250292, 1.615255, 0, 0, 0, 1, 1,
2.351861, 1.327492, 2.906273, 0, 0, 0, 1, 1,
2.42883, 1.132906, 1.774253, 0, 0, 0, 1, 1,
2.488153, -0.296061, 2.921234, 1, 1, 1, 1, 1,
2.540957, -1.919395, 0.9342499, 1, 1, 1, 1, 1,
2.569163, 0.2538043, 1.929639, 1, 1, 1, 1, 1,
2.644347, -1.746071, 2.06952, 1, 1, 1, 1, 1,
2.670889, -0.3940253, 1.545089, 1, 1, 1, 1, 1,
2.996041, 1.148715, 2.681318, 1, 1, 1, 1, 1,
3.296986, -1.534944, 4.102691, 1, 1, 1, 1, 1
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
var radius = 9.416191;
var distance = 33.07397;
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
mvMatrix.translate( -0.2208676, 0.1511176, -0.06687093 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.07397);
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
