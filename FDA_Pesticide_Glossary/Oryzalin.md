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
-2.943847, -0.5911755, 0.3239342, 1, 0, 0, 1,
-2.921479, -0.734638, -1.591701, 1, 0.007843138, 0, 1,
-2.768269, -0.06905588, -1.641591, 1, 0.01176471, 0, 1,
-2.476809, -0.2534048, -0.2578321, 1, 0.01960784, 0, 1,
-2.433214, -0.7601647, -3.060459, 1, 0.02352941, 0, 1,
-2.40641, 0.07085015, -3.411217, 1, 0.03137255, 0, 1,
-2.34259, 0.5405511, -1.189548, 1, 0.03529412, 0, 1,
-2.287052, -0.3625794, -1.287462, 1, 0.04313726, 0, 1,
-2.283416, -0.3205057, -3.154171, 1, 0.04705882, 0, 1,
-2.268477, -1.511603, -0.8415634, 1, 0.05490196, 0, 1,
-2.260003, -0.08962042, -2.078824, 1, 0.05882353, 0, 1,
-2.20127, 0.711046, -2.290577, 1, 0.06666667, 0, 1,
-2.18711, 0.2662216, -1.680598, 1, 0.07058824, 0, 1,
-2.186547, 0.5866832, -1.450197, 1, 0.07843138, 0, 1,
-2.182575, -1.093765, -2.330346, 1, 0.08235294, 0, 1,
-2.174553, 0.08613662, -2.161072, 1, 0.09019608, 0, 1,
-2.124457, 0.4259115, -1.027306, 1, 0.09411765, 0, 1,
-2.109114, 0.8855561, -1.474868, 1, 0.1019608, 0, 1,
-2.061338, -0.9641873, -2.7069, 1, 0.1098039, 0, 1,
-2.011822, -0.1240921, -1.029581, 1, 0.1137255, 0, 1,
-2.008081, 0.624608, -3.740925, 1, 0.1215686, 0, 1,
-2.001159, -1.377162, -2.283483, 1, 0.1254902, 0, 1,
-1.992953, 1.368417, -1.701988, 1, 0.1333333, 0, 1,
-1.974407, 0.7210795, -2.50558, 1, 0.1372549, 0, 1,
-1.965551, 1.26881, -2.442354, 1, 0.145098, 0, 1,
-1.932939, -1.185245, -1.778904, 1, 0.1490196, 0, 1,
-1.906603, 0.006355465, -1.939227, 1, 0.1568628, 0, 1,
-1.898854, 2.171932, 0.6721411, 1, 0.1607843, 0, 1,
-1.874984, -0.1562186, -2.630107, 1, 0.1686275, 0, 1,
-1.847966, 0.9683499, -1.361245, 1, 0.172549, 0, 1,
-1.807531, 1.095234, 0.02126213, 1, 0.1803922, 0, 1,
-1.806228, 1.794782, -1.39903, 1, 0.1843137, 0, 1,
-1.799164, 0.9178455, -0.7151407, 1, 0.1921569, 0, 1,
-1.795428, 0.06559731, -2.602237, 1, 0.1960784, 0, 1,
-1.776781, 1.247007, -0.8474756, 1, 0.2039216, 0, 1,
-1.774185, 0.7586861, -0.1490509, 1, 0.2117647, 0, 1,
-1.7732, -0.1393103, -1.988344, 1, 0.2156863, 0, 1,
-1.765168, 0.587136, -1.642232, 1, 0.2235294, 0, 1,
-1.758849, -0.3642085, -1.656325, 1, 0.227451, 0, 1,
-1.755673, 0.8120603, -1.69855, 1, 0.2352941, 0, 1,
-1.744676, 0.1558344, -1.052769, 1, 0.2392157, 0, 1,
-1.737632, -0.01825797, -1.366787, 1, 0.2470588, 0, 1,
-1.733613, 0.9906448, -1.128811, 1, 0.2509804, 0, 1,
-1.708282, -0.09394922, -0.5536028, 1, 0.2588235, 0, 1,
-1.706285, 0.639747, 0.09515807, 1, 0.2627451, 0, 1,
-1.696866, 0.5930326, -1.317013, 1, 0.2705882, 0, 1,
-1.695897, -0.3873124, -0.9652985, 1, 0.2745098, 0, 1,
-1.687776, 0.7341444, -1.724333, 1, 0.282353, 0, 1,
-1.651885, -1.191539, -2.426094, 1, 0.2862745, 0, 1,
-1.651272, -1.059847, -2.544806, 1, 0.2941177, 0, 1,
-1.639464, 1.235585, -1.952377, 1, 0.3019608, 0, 1,
-1.636735, -0.9436464, -3.246346, 1, 0.3058824, 0, 1,
-1.625889, 1.124236, -0.9031241, 1, 0.3137255, 0, 1,
-1.618274, -0.3408715, -1.46345, 1, 0.3176471, 0, 1,
-1.612692, 0.08172861, -2.499278, 1, 0.3254902, 0, 1,
-1.605513, -0.5932745, -2.134429, 1, 0.3294118, 0, 1,
-1.59043, -0.2111505, -1.556206, 1, 0.3372549, 0, 1,
-1.587776, -0.007822169, -0.5254714, 1, 0.3411765, 0, 1,
-1.554702, 0.1046946, -2.294132, 1, 0.3490196, 0, 1,
-1.534469, 0.2901203, -0.3304377, 1, 0.3529412, 0, 1,
-1.526022, 1.182902, -0.1791261, 1, 0.3607843, 0, 1,
-1.518183, -0.3753091, -1.51374, 1, 0.3647059, 0, 1,
-1.504505, -0.08670123, -3.171394, 1, 0.372549, 0, 1,
-1.493493, -0.09060255, -2.499961, 1, 0.3764706, 0, 1,
-1.488125, -0.485261, -0.5299708, 1, 0.3843137, 0, 1,
-1.477225, 0.3120683, -1.50271, 1, 0.3882353, 0, 1,
-1.476688, 1.298113, -1.757782, 1, 0.3960784, 0, 1,
-1.469293, 0.6601521, -0.7830982, 1, 0.4039216, 0, 1,
-1.462911, -0.4681679, -1.746398, 1, 0.4078431, 0, 1,
-1.456132, 0.8353454, -0.9512526, 1, 0.4156863, 0, 1,
-1.455461, -1.817536, -2.198359, 1, 0.4196078, 0, 1,
-1.446936, -1.585381, -2.233903, 1, 0.427451, 0, 1,
-1.441834, 0.04396559, -2.008191, 1, 0.4313726, 0, 1,
-1.425344, 0.5562902, -0.09057099, 1, 0.4392157, 0, 1,
-1.423961, 0.08826519, -0.4609737, 1, 0.4431373, 0, 1,
-1.418326, 1.29302, -0.8363805, 1, 0.4509804, 0, 1,
-1.415905, 0.2961655, -2.039351, 1, 0.454902, 0, 1,
-1.412049, 0.1345829, -1.533402, 1, 0.4627451, 0, 1,
-1.405709, 0.1588123, -3.467075, 1, 0.4666667, 0, 1,
-1.401642, 0.665094, -1.03022, 1, 0.4745098, 0, 1,
-1.390081, 0.07116733, -1.078753, 1, 0.4784314, 0, 1,
-1.388018, 0.1117575, -0.1649332, 1, 0.4862745, 0, 1,
-1.384986, -0.5424035, -3.104934, 1, 0.4901961, 0, 1,
-1.383114, 0.7675421, -0.1719285, 1, 0.4980392, 0, 1,
-1.378178, -0.946826, -3.680081, 1, 0.5058824, 0, 1,
-1.351641, -0.3470542, -3.277292, 1, 0.509804, 0, 1,
-1.351157, 1.177521, -1.019971, 1, 0.5176471, 0, 1,
-1.347948, 1.353812, 0.5759361, 1, 0.5215687, 0, 1,
-1.334028, -0.9762425, -4.061283, 1, 0.5294118, 0, 1,
-1.330353, -0.03590304, -0.9174122, 1, 0.5333334, 0, 1,
-1.329255, -2.056633, -2.458264, 1, 0.5411765, 0, 1,
-1.313508, -0.1242276, -1.662029, 1, 0.5450981, 0, 1,
-1.313281, 0.4356749, -1.250807, 1, 0.5529412, 0, 1,
-1.309747, 0.6340802, 0.3188239, 1, 0.5568628, 0, 1,
-1.309194, -0.07750268, -1.343031, 1, 0.5647059, 0, 1,
-1.308128, 0.02050907, -1.81435, 1, 0.5686275, 0, 1,
-1.304105, 0.3986998, -3.205164, 1, 0.5764706, 0, 1,
-1.291919, 0.4943651, -0.2260611, 1, 0.5803922, 0, 1,
-1.290084, -0.6844723, -0.7165459, 1, 0.5882353, 0, 1,
-1.280874, 1.682827, -0.2371476, 1, 0.5921569, 0, 1,
-1.280823, 0.4230301, -1.121658, 1, 0.6, 0, 1,
-1.275134, 1.62068, -1.582406, 1, 0.6078432, 0, 1,
-1.263489, -0.3049717, -1.136024, 1, 0.6117647, 0, 1,
-1.261848, 0.6448023, -2.443499, 1, 0.6196079, 0, 1,
-1.259735, -0.06630095, -2.397323, 1, 0.6235294, 0, 1,
-1.251515, -1.601387, -1.455792, 1, 0.6313726, 0, 1,
-1.250996, 0.5157639, -1.353497, 1, 0.6352941, 0, 1,
-1.250982, 0.9308587, -0.5987563, 1, 0.6431373, 0, 1,
-1.248855, 0.08036079, -0.8649061, 1, 0.6470588, 0, 1,
-1.247364, 0.5007247, -2.30661, 1, 0.654902, 0, 1,
-1.246311, 0.4916054, -2.776097, 1, 0.6588235, 0, 1,
-1.243031, 0.2020083, -1.719462, 1, 0.6666667, 0, 1,
-1.242615, -1.318646, -2.891146, 1, 0.6705883, 0, 1,
-1.237641, -1.006589, -2.554027, 1, 0.6784314, 0, 1,
-1.22953, -0.1077001, -1.954034, 1, 0.682353, 0, 1,
-1.228432, 0.6390162, -1.148995, 1, 0.6901961, 0, 1,
-1.223754, 1.781924, -0.26965, 1, 0.6941177, 0, 1,
-1.218734, 0.4996906, -2.104595, 1, 0.7019608, 0, 1,
-1.2105, 0.8833642, -0.2981843, 1, 0.7098039, 0, 1,
-1.20383, 0.1867717, 0.679851, 1, 0.7137255, 0, 1,
-1.202207, 0.7640942, -2.184857, 1, 0.7215686, 0, 1,
-1.193957, -0.2926284, -1.377857, 1, 0.7254902, 0, 1,
-1.189768, 1.561441, 0.7959396, 1, 0.7333333, 0, 1,
-1.186302, 0.8748781, -1.004832, 1, 0.7372549, 0, 1,
-1.184968, 2.274836, -1.139358, 1, 0.7450981, 0, 1,
-1.181423, -0.8003167, -2.151068, 1, 0.7490196, 0, 1,
-1.181295, 0.1429488, -1.23779, 1, 0.7568628, 0, 1,
-1.178593, 0.6961355, -1.198583, 1, 0.7607843, 0, 1,
-1.177907, 0.2214216, -1.800545, 1, 0.7686275, 0, 1,
-1.177819, 0.2304207, -0.6169699, 1, 0.772549, 0, 1,
-1.174985, -0.8278919, -1.237559, 1, 0.7803922, 0, 1,
-1.168654, -1.237167, -3.748803, 1, 0.7843137, 0, 1,
-1.152436, 1.007557, -0.8827231, 1, 0.7921569, 0, 1,
-1.141663, -0.5702574, -2.810899, 1, 0.7960784, 0, 1,
-1.140509, -1.009175, -3.063113, 1, 0.8039216, 0, 1,
-1.135545, -0.4681256, -2.818946, 1, 0.8117647, 0, 1,
-1.132855, -0.1985081, -0.5795079, 1, 0.8156863, 0, 1,
-1.13241, -1.780389, -3.51617, 1, 0.8235294, 0, 1,
-1.130298, 0.9083437, 0.1944719, 1, 0.827451, 0, 1,
-1.129731, 0.7567886, 0.3087261, 1, 0.8352941, 0, 1,
-1.126579, 1.524633, -1.096417, 1, 0.8392157, 0, 1,
-1.125987, -0.4824789, -3.090079, 1, 0.8470588, 0, 1,
-1.124539, 0.1170225, -0.37958, 1, 0.8509804, 0, 1,
-1.124321, -0.1109213, -1.955044, 1, 0.8588235, 0, 1,
-1.118951, 1.548981, -1.33508, 1, 0.8627451, 0, 1,
-1.112669, 0.7100828, -1.044375, 1, 0.8705882, 0, 1,
-1.108396, 0.9553407, -0.5718651, 1, 0.8745098, 0, 1,
-1.09981, -0.3845029, -2.075155, 1, 0.8823529, 0, 1,
-1.086117, 0.5548275, -1.761343, 1, 0.8862745, 0, 1,
-1.083063, -1.699304, -3.87501, 1, 0.8941177, 0, 1,
-1.082922, 0.974419, -0.8675714, 1, 0.8980392, 0, 1,
-1.080847, 0.3913103, -1.379143, 1, 0.9058824, 0, 1,
-1.075622, -0.5942428, -2.025184, 1, 0.9137255, 0, 1,
-1.073727, 0.1398483, -2.08301, 1, 0.9176471, 0, 1,
-1.071754, 0.9686949, -1.238148, 1, 0.9254902, 0, 1,
-1.06262, -0.7622818, -1.052283, 1, 0.9294118, 0, 1,
-1.059368, -0.05247112, -1.545684, 1, 0.9372549, 0, 1,
-1.059031, 0.3831937, -3.805408, 1, 0.9411765, 0, 1,
-1.057131, -0.4503168, -2.266632, 1, 0.9490196, 0, 1,
-1.056222, 0.6637435, -1.429382, 1, 0.9529412, 0, 1,
-1.051999, 1.850533, 0.1126224, 1, 0.9607843, 0, 1,
-1.051852, 0.2398708, -2.73763, 1, 0.9647059, 0, 1,
-1.050048, -1.19894, -3.949329, 1, 0.972549, 0, 1,
-1.041591, 0.4274523, -1.366361, 1, 0.9764706, 0, 1,
-1.041513, -0.1979588, -3.309346, 1, 0.9843137, 0, 1,
-1.036054, 2.029611, -0.2881709, 1, 0.9882353, 0, 1,
-1.030345, 1.559398, -0.2637602, 1, 0.9960784, 0, 1,
-1.012982, 0.611747, 0.4973286, 0.9960784, 1, 0, 1,
-1.008586, 1.491537, 1.310719, 0.9921569, 1, 0, 1,
-1.006543, 0.3343189, -2.815498, 0.9843137, 1, 0, 1,
-1.003849, 0.767319, -0.0274327, 0.9803922, 1, 0, 1,
-1.001458, -1.075966, -1.919557, 0.972549, 1, 0, 1,
-0.9959445, 1.668183, -1.086259, 0.9686275, 1, 0, 1,
-0.9904477, 0.9687852, 0.1948271, 0.9607843, 1, 0, 1,
-0.9893659, 0.007818332, -2.736799, 0.9568627, 1, 0, 1,
-0.9877697, 1.740522, -1.29072, 0.9490196, 1, 0, 1,
-0.9875634, -1.086943, -3.428224, 0.945098, 1, 0, 1,
-0.9815412, -0.3567082, -2.399585, 0.9372549, 1, 0, 1,
-0.9749992, -0.8642613, -1.047124, 0.9333333, 1, 0, 1,
-0.9588961, -0.9311257, -1.483419, 0.9254902, 1, 0, 1,
-0.9555689, -0.7805939, -0.9030926, 0.9215686, 1, 0, 1,
-0.9466643, 1.115029, -1.11657, 0.9137255, 1, 0, 1,
-0.9330513, 0.6798248, -1.250446, 0.9098039, 1, 0, 1,
-0.9308633, 0.5829092, -0.3953465, 0.9019608, 1, 0, 1,
-0.9295126, -1.990148, -3.161343, 0.8941177, 1, 0, 1,
-0.9281471, 1.89384, -0.5368456, 0.8901961, 1, 0, 1,
-0.9258974, 1.692538, -0.1057001, 0.8823529, 1, 0, 1,
-0.9251406, 0.1365612, -1.780307, 0.8784314, 1, 0, 1,
-0.92473, -0.2110349, -1.249715, 0.8705882, 1, 0, 1,
-0.9154826, 1.064763, -1.220186, 0.8666667, 1, 0, 1,
-0.9073485, -0.8881226, -3.0483, 0.8588235, 1, 0, 1,
-0.9067845, 0.1023923, -0.4435352, 0.854902, 1, 0, 1,
-0.905269, -0.9771468, -2.085369, 0.8470588, 1, 0, 1,
-0.8807796, 1.337881, -0.3212792, 0.8431373, 1, 0, 1,
-0.8790243, -0.8620116, -2.648701, 0.8352941, 1, 0, 1,
-0.8712451, 0.4932747, -3.272515, 0.8313726, 1, 0, 1,
-0.8709663, -0.3217326, -1.777219, 0.8235294, 1, 0, 1,
-0.8648093, -2.4107, -3.19259, 0.8196079, 1, 0, 1,
-0.8548219, 0.07067864, -1.691154, 0.8117647, 1, 0, 1,
-0.853522, -0.1575168, -3.242054, 0.8078431, 1, 0, 1,
-0.8496599, 0.9712111, -1.10648, 0.8, 1, 0, 1,
-0.8422337, 0.7606161, -2.739254, 0.7921569, 1, 0, 1,
-0.8408831, 0.6323239, -1.075915, 0.7882353, 1, 0, 1,
-0.8385342, -0.3912448, -2.803464, 0.7803922, 1, 0, 1,
-0.8382998, -1.080196, -2.275218, 0.7764706, 1, 0, 1,
-0.8314089, -0.38827, -2.28975, 0.7686275, 1, 0, 1,
-0.8304853, -0.238441, -2.818189, 0.7647059, 1, 0, 1,
-0.8286211, 0.1619511, -0.2451372, 0.7568628, 1, 0, 1,
-0.8208277, 0.5301546, -0.782032, 0.7529412, 1, 0, 1,
-0.8191949, 0.1309341, -3.17029, 0.7450981, 1, 0, 1,
-0.8188288, -0.8295662, -1.093705, 0.7411765, 1, 0, 1,
-0.8178613, 0.1104271, -0.8723627, 0.7333333, 1, 0, 1,
-0.8160804, -0.715721, -1.474426, 0.7294118, 1, 0, 1,
-0.8091623, -0.6542726, -2.904588, 0.7215686, 1, 0, 1,
-0.8065649, 1.473147, -0.4207982, 0.7176471, 1, 0, 1,
-0.8057494, -2.356421, -3.561014, 0.7098039, 1, 0, 1,
-0.8010823, -0.6672915, -2.242087, 0.7058824, 1, 0, 1,
-0.799225, -0.8113761, -1.75558, 0.6980392, 1, 0, 1,
-0.7983484, -0.65026, -2.82281, 0.6901961, 1, 0, 1,
-0.7936932, 0.1556975, 0.6051863, 0.6862745, 1, 0, 1,
-0.7932611, -0.2383898, -3.290894, 0.6784314, 1, 0, 1,
-0.7898898, -1.726304, -0.3938897, 0.6745098, 1, 0, 1,
-0.7851641, -1.330072, -3.361274, 0.6666667, 1, 0, 1,
-0.7838458, -1.382717, -0.7809783, 0.6627451, 1, 0, 1,
-0.7789379, 0.7296527, -0.09894992, 0.654902, 1, 0, 1,
-0.7710826, -0.9399799, -3.885321, 0.6509804, 1, 0, 1,
-0.7700832, -0.545514, -2.012992, 0.6431373, 1, 0, 1,
-0.7700117, 0.05897485, -0.3643781, 0.6392157, 1, 0, 1,
-0.7676941, 0.4442509, 0.0573148, 0.6313726, 1, 0, 1,
-0.7587891, -0.5059285, -2.516918, 0.627451, 1, 0, 1,
-0.7438807, -1.985169, -3.901622, 0.6196079, 1, 0, 1,
-0.7432501, 0.1292164, -1.767967, 0.6156863, 1, 0, 1,
-0.7365321, -0.5179602, -0.8236461, 0.6078432, 1, 0, 1,
-0.7348168, -0.9941515, -1.798924, 0.6039216, 1, 0, 1,
-0.734495, 0.256759, -0.02360071, 0.5960785, 1, 0, 1,
-0.7280083, -0.5318611, -2.679196, 0.5882353, 1, 0, 1,
-0.7262058, 0.7132864, -2.18702, 0.5843138, 1, 0, 1,
-0.7255114, 0.8051949, 1.068305, 0.5764706, 1, 0, 1,
-0.718941, 0.9429783, -0.2726919, 0.572549, 1, 0, 1,
-0.7182877, -0.6441082, -0.7787305, 0.5647059, 1, 0, 1,
-0.711606, -0.9166766, -2.270379, 0.5607843, 1, 0, 1,
-0.711024, 0.6555442, -1.204904, 0.5529412, 1, 0, 1,
-0.7027376, -1.150235, -2.978969, 0.5490196, 1, 0, 1,
-0.6985757, -0.08249956, -0.4339229, 0.5411765, 1, 0, 1,
-0.6974975, 0.6992707, 0.5582902, 0.5372549, 1, 0, 1,
-0.696362, 0.8026656, 1.113819, 0.5294118, 1, 0, 1,
-0.6921241, -0.2948188, -3.1561, 0.5254902, 1, 0, 1,
-0.6884884, 0.5698711, 0.6747234, 0.5176471, 1, 0, 1,
-0.6793988, 0.4645452, -2.41778, 0.5137255, 1, 0, 1,
-0.6777625, 0.9052745, -1.197744, 0.5058824, 1, 0, 1,
-0.6753713, 0.4015113, -0.7891046, 0.5019608, 1, 0, 1,
-0.6742067, 0.03637409, -1.325296, 0.4941176, 1, 0, 1,
-0.6665365, -0.06635121, -3.724941, 0.4862745, 1, 0, 1,
-0.6603565, 0.2345633, 1.064376, 0.4823529, 1, 0, 1,
-0.6596294, 0.7560914, -2.520954, 0.4745098, 1, 0, 1,
-0.6516513, -1.304031, -3.753796, 0.4705882, 1, 0, 1,
-0.6431676, -0.3267125, -2.278894, 0.4627451, 1, 0, 1,
-0.6417413, -0.5312669, -1.226335, 0.4588235, 1, 0, 1,
-0.6404887, -1.953356, -3.441492, 0.4509804, 1, 0, 1,
-0.640259, -0.07799044, -1.648232, 0.4470588, 1, 0, 1,
-0.6368902, 0.09216808, -0.2627483, 0.4392157, 1, 0, 1,
-0.6311854, 0.4872265, -0.9276688, 0.4352941, 1, 0, 1,
-0.6259153, -0.7716129, -2.6232, 0.427451, 1, 0, 1,
-0.6250022, -0.4290049, -0.3642732, 0.4235294, 1, 0, 1,
-0.6240919, -1.582295, -3.753374, 0.4156863, 1, 0, 1,
-0.623108, 0.2962221, -1.99274, 0.4117647, 1, 0, 1,
-0.6200812, 0.7459443, 0.7137153, 0.4039216, 1, 0, 1,
-0.619706, -0.4173651, -0.7318523, 0.3960784, 1, 0, 1,
-0.6179243, -0.2022934, -2.969163, 0.3921569, 1, 0, 1,
-0.6154552, 0.5809972, -1.990126, 0.3843137, 1, 0, 1,
-0.6128206, -0.571379, -1.194605, 0.3803922, 1, 0, 1,
-0.6117348, -0.341971, -4.016404, 0.372549, 1, 0, 1,
-0.6087688, -0.3404932, -3.174012, 0.3686275, 1, 0, 1,
-0.6077023, 0.5892529, -0.6735288, 0.3607843, 1, 0, 1,
-0.6067771, -0.261007, -2.358283, 0.3568628, 1, 0, 1,
-0.6023123, 0.8243562, -2.058331, 0.3490196, 1, 0, 1,
-0.5999808, 0.5930052, 0.2013693, 0.345098, 1, 0, 1,
-0.5979725, 0.6915348, 0.6773852, 0.3372549, 1, 0, 1,
-0.5962573, 0.5392051, -1.507223, 0.3333333, 1, 0, 1,
-0.591364, 1.410896, 0.02179551, 0.3254902, 1, 0, 1,
-0.5897822, -2.27178, -1.768417, 0.3215686, 1, 0, 1,
-0.5887099, -1.098181, -3.56517, 0.3137255, 1, 0, 1,
-0.5873708, 0.6114661, -0.03827788, 0.3098039, 1, 0, 1,
-0.5871481, 1.126812, 0.2939762, 0.3019608, 1, 0, 1,
-0.5852469, 0.7009702, -1.110885, 0.2941177, 1, 0, 1,
-0.5824109, -2.084984, -4.345916, 0.2901961, 1, 0, 1,
-0.5821509, -2.391106, -1.889636, 0.282353, 1, 0, 1,
-0.5805016, -1.521284, -2.684188, 0.2784314, 1, 0, 1,
-0.5802805, 0.07402014, -1.162463, 0.2705882, 1, 0, 1,
-0.5788656, -0.7651758, -2.524236, 0.2666667, 1, 0, 1,
-0.5766034, -1.81367, -3.908426, 0.2588235, 1, 0, 1,
-0.5755429, -2.103619, -3.434361, 0.254902, 1, 0, 1,
-0.5740387, 1.967264, -0.6442617, 0.2470588, 1, 0, 1,
-0.5629873, -0.9945145, -2.026202, 0.2431373, 1, 0, 1,
-0.5562978, -0.1866141, -3.695219, 0.2352941, 1, 0, 1,
-0.5523145, 0.4995368, -0.6830191, 0.2313726, 1, 0, 1,
-0.5515726, -2.916245, -0.7682466, 0.2235294, 1, 0, 1,
-0.5513961, -1.696352, -2.371902, 0.2196078, 1, 0, 1,
-0.5512697, 1.453754, -2.268447, 0.2117647, 1, 0, 1,
-0.5478241, 0.8251767, -0.8188877, 0.2078431, 1, 0, 1,
-0.5437791, -1.636243, -1.540369, 0.2, 1, 0, 1,
-0.53711, -0.4642569, -1.901754, 0.1921569, 1, 0, 1,
-0.5342352, 0.4349863, -1.308154, 0.1882353, 1, 0, 1,
-0.5329335, -2.203984, -3.690986, 0.1803922, 1, 0, 1,
-0.5325911, -0.2149016, -2.139287, 0.1764706, 1, 0, 1,
-0.5317891, 0.4278641, -0.6194125, 0.1686275, 1, 0, 1,
-0.5316492, 0.4913982, -1.075573, 0.1647059, 1, 0, 1,
-0.5280784, 0.3448426, -0.6911095, 0.1568628, 1, 0, 1,
-0.5263119, 0.9706566, -0.1897542, 0.1529412, 1, 0, 1,
-0.525386, -0.9138948, -2.917945, 0.145098, 1, 0, 1,
-0.5210856, -0.08632313, -1.986151, 0.1411765, 1, 0, 1,
-0.5198541, -0.405046, -2.140477, 0.1333333, 1, 0, 1,
-0.513835, -0.4636134, -1.407477, 0.1294118, 1, 0, 1,
-0.5135016, -0.1820913, -2.29954, 0.1215686, 1, 0, 1,
-0.507958, -1.947447, -3.263294, 0.1176471, 1, 0, 1,
-0.5039009, 0.842239, -0.7779444, 0.1098039, 1, 0, 1,
-0.5030336, 0.2297862, -1.097303, 0.1058824, 1, 0, 1,
-0.4997209, 0.1280701, -1.396888, 0.09803922, 1, 0, 1,
-0.4970631, 0.3504084, -0.6720281, 0.09019608, 1, 0, 1,
-0.4943648, -0.8405069, -3.748734, 0.08627451, 1, 0, 1,
-0.4889214, -0.9912202, -0.8970165, 0.07843138, 1, 0, 1,
-0.4860678, 0.9952247, -1.018587, 0.07450981, 1, 0, 1,
-0.4844726, 0.2034866, 0.2858866, 0.06666667, 1, 0, 1,
-0.4750987, 0.4056949, 0.03613941, 0.0627451, 1, 0, 1,
-0.4733169, -0.9644544, -3.930161, 0.05490196, 1, 0, 1,
-0.4703061, 0.4024343, -0.03669607, 0.05098039, 1, 0, 1,
-0.4674481, -1.447698, -1.739116, 0.04313726, 1, 0, 1,
-0.4666627, 0.8932949, 0.7900949, 0.03921569, 1, 0, 1,
-0.4664678, 1.08307, -2.296005, 0.03137255, 1, 0, 1,
-0.4647094, -1.117305, -2.688578, 0.02745098, 1, 0, 1,
-0.4557268, 1.698195, -0.4844008, 0.01960784, 1, 0, 1,
-0.4511422, -1.59709, -2.762377, 0.01568628, 1, 0, 1,
-0.4486341, 0.764373, -2.184628, 0.007843138, 1, 0, 1,
-0.4485682, -0.7433209, -2.883913, 0.003921569, 1, 0, 1,
-0.4390311, -2.111283, -1.575394, 0, 1, 0.003921569, 1,
-0.433988, 0.6515836, 0.5872981, 0, 1, 0.01176471, 1,
-0.4226233, -0.2994567, -2.287894, 0, 1, 0.01568628, 1,
-0.4198662, 0.8339015, -0.08747256, 0, 1, 0.02352941, 1,
-0.4174503, -0.7862881, -0.3689995, 0, 1, 0.02745098, 1,
-0.4157105, 0.05021755, 0.3533577, 0, 1, 0.03529412, 1,
-0.4149973, -1.218543, -2.115857, 0, 1, 0.03921569, 1,
-0.4140166, 0.1490896, -0.132934, 0, 1, 0.04705882, 1,
-0.411917, -0.607163, -2.417666, 0, 1, 0.05098039, 1,
-0.4117962, -0.7794381, -2.132675, 0, 1, 0.05882353, 1,
-0.4109964, -0.6687139, -2.013643, 0, 1, 0.0627451, 1,
-0.4104286, -0.7343336, -2.754748, 0, 1, 0.07058824, 1,
-0.4100145, 0.6268139, -1.033389, 0, 1, 0.07450981, 1,
-0.4072573, 0.8568898, 0.7728307, 0, 1, 0.08235294, 1,
-0.4071954, -0.1095303, -2.236272, 0, 1, 0.08627451, 1,
-0.4067361, 1.002534, -0.09466456, 0, 1, 0.09411765, 1,
-0.4058363, -1.164282, -3.869563, 0, 1, 0.1019608, 1,
-0.4024069, -1.376839, -3.514719, 0, 1, 0.1058824, 1,
-0.3996162, -1.057021, -3.177465, 0, 1, 0.1137255, 1,
-0.3981856, 1.362281, -0.2364643, 0, 1, 0.1176471, 1,
-0.3894635, 2.14453, 0.3671978, 0, 1, 0.1254902, 1,
-0.3860962, -0.7170133, -3.524654, 0, 1, 0.1294118, 1,
-0.3853728, -1.031346, -1.875608, 0, 1, 0.1372549, 1,
-0.3842467, 1.44801, -0.4359726, 0, 1, 0.1411765, 1,
-0.3805788, 0.9283833, 0.01525685, 0, 1, 0.1490196, 1,
-0.3800243, -1.498984, -3.243537, 0, 1, 0.1529412, 1,
-0.3793816, 0.2767681, -1.668411, 0, 1, 0.1607843, 1,
-0.3788218, -2.404484, -1.525745, 0, 1, 0.1647059, 1,
-0.3782234, 1.000411, -0.3051303, 0, 1, 0.172549, 1,
-0.3666745, 1.193551, 0.1633573, 0, 1, 0.1764706, 1,
-0.3660861, 0.2766908, -0.4216505, 0, 1, 0.1843137, 1,
-0.3646133, 0.4402412, -0.3400405, 0, 1, 0.1882353, 1,
-0.3643094, -1.02713, -2.801191, 0, 1, 0.1960784, 1,
-0.360565, 0.5376404, 0.379251, 0, 1, 0.2039216, 1,
-0.3597479, 1.486095, 2.817236, 0, 1, 0.2078431, 1,
-0.3515803, 0.4526805, -0.5232283, 0, 1, 0.2156863, 1,
-0.3435979, 0.7405726, -0.3009914, 0, 1, 0.2196078, 1,
-0.3428774, 0.330513, 0.4487776, 0, 1, 0.227451, 1,
-0.3401965, -0.1009321, -0.1562149, 0, 1, 0.2313726, 1,
-0.3399212, 1.754536, 0.09691164, 0, 1, 0.2392157, 1,
-0.337749, 0.1100128, -1.834876, 0, 1, 0.2431373, 1,
-0.3365106, -0.4018048, -3.488954, 0, 1, 0.2509804, 1,
-0.3324802, 2.031492, -1.084599, 0, 1, 0.254902, 1,
-0.3322159, -0.74643, -2.737155, 0, 1, 0.2627451, 1,
-0.3289286, 0.5924627, -2.410667, 0, 1, 0.2666667, 1,
-0.3287322, 1.854357, -1.123352, 0, 1, 0.2745098, 1,
-0.3281686, -0.4375004, -3.381252, 0, 1, 0.2784314, 1,
-0.3260889, -0.3557568, -2.085608, 0, 1, 0.2862745, 1,
-0.3258678, -0.1318184, -3.549865, 0, 1, 0.2901961, 1,
-0.3258174, 0.02931613, -1.311732, 0, 1, 0.2980392, 1,
-0.3232428, -0.5555693, -3.953765, 0, 1, 0.3058824, 1,
-0.3053479, 0.4874053, -1.200659, 0, 1, 0.3098039, 1,
-0.3018134, -1.373824, -4.286348, 0, 1, 0.3176471, 1,
-0.2993034, 1.636865, 1.44815, 0, 1, 0.3215686, 1,
-0.29553, -0.5312682, -2.351351, 0, 1, 0.3294118, 1,
-0.28995, -0.8072858, -1.657432, 0, 1, 0.3333333, 1,
-0.2859997, 0.9887645, -1.276855, 0, 1, 0.3411765, 1,
-0.2855457, 0.8394205, -0.00771981, 0, 1, 0.345098, 1,
-0.2851006, -0.0004120532, -1.615737, 0, 1, 0.3529412, 1,
-0.2825921, -1.155641, -0.7636952, 0, 1, 0.3568628, 1,
-0.2822842, 0.3147703, -2.114035, 0, 1, 0.3647059, 1,
-0.282061, -0.6678506, -2.611961, 0, 1, 0.3686275, 1,
-0.2819025, -0.1589789, -0.9805009, 0, 1, 0.3764706, 1,
-0.2783764, -1.439319, -3.511212, 0, 1, 0.3803922, 1,
-0.2754534, 0.06379887, -1.248289, 0, 1, 0.3882353, 1,
-0.274219, -1.251243, -2.601343, 0, 1, 0.3921569, 1,
-0.2701121, 1.338931, -0.2320871, 0, 1, 0.4, 1,
-0.269358, -0.1198815, -2.079704, 0, 1, 0.4078431, 1,
-0.2665376, 0.08636206, -2.822624, 0, 1, 0.4117647, 1,
-0.2651197, -1.175575, -3.12066, 0, 1, 0.4196078, 1,
-0.2649218, -0.7070078, -1.254447, 0, 1, 0.4235294, 1,
-0.2603154, -0.9869365, -2.931853, 0, 1, 0.4313726, 1,
-0.2599514, 0.01352088, -2.585804, 0, 1, 0.4352941, 1,
-0.2580878, 0.5409783, -0.9118495, 0, 1, 0.4431373, 1,
-0.2560955, 0.7153221, 0.009347526, 0, 1, 0.4470588, 1,
-0.2554815, 0.09626212, -0.5980121, 0, 1, 0.454902, 1,
-0.244851, 2.571624, 0.7057766, 0, 1, 0.4588235, 1,
-0.2443963, -0.30174, -2.31479, 0, 1, 0.4666667, 1,
-0.2390384, -1.794805, -3.367777, 0, 1, 0.4705882, 1,
-0.2379917, -0.05414908, -0.4995636, 0, 1, 0.4784314, 1,
-0.2371837, 0.06722955, -1.210049, 0, 1, 0.4823529, 1,
-0.2335191, -3.060444, -3.806583, 0, 1, 0.4901961, 1,
-0.231688, 0.8319186, 0.6815612, 0, 1, 0.4941176, 1,
-0.2296776, -0.1101137, -3.252745, 0, 1, 0.5019608, 1,
-0.2247261, -0.211846, -1.222746, 0, 1, 0.509804, 1,
-0.2246098, 0.1025309, 0.6408105, 0, 1, 0.5137255, 1,
-0.2234697, -2.665218, -3.294203, 0, 1, 0.5215687, 1,
-0.2227293, -0.4494704, -3.364947, 0, 1, 0.5254902, 1,
-0.2206941, 0.1269716, -1.562788, 0, 1, 0.5333334, 1,
-0.2204337, -0.3744043, -3.5977, 0, 1, 0.5372549, 1,
-0.2189714, 0.05661222, -0.6296323, 0, 1, 0.5450981, 1,
-0.2155863, -2.564684, -5.165835, 0, 1, 0.5490196, 1,
-0.2137701, 0.4778327, -0.866729, 0, 1, 0.5568628, 1,
-0.2101587, 0.7297806, -1.075749, 0, 1, 0.5607843, 1,
-0.2076743, 0.4310258, -0.7968592, 0, 1, 0.5686275, 1,
-0.2076293, -0.6140759, -2.38166, 0, 1, 0.572549, 1,
-0.2048215, 0.4050975, -1.121803, 0, 1, 0.5803922, 1,
-0.2021704, -1.527596, -3.168472, 0, 1, 0.5843138, 1,
-0.1976784, -0.8089245, -2.84413, 0, 1, 0.5921569, 1,
-0.193674, -1.26241, -1.574148, 0, 1, 0.5960785, 1,
-0.1885281, -0.5560241, -0.9272184, 0, 1, 0.6039216, 1,
-0.1819221, 0.6250777, 0.379678, 0, 1, 0.6117647, 1,
-0.1809701, 1.911908, 1.528954, 0, 1, 0.6156863, 1,
-0.1772343, -0.3989097, -3.934762, 0, 1, 0.6235294, 1,
-0.176376, -0.3889159, -4.328819, 0, 1, 0.627451, 1,
-0.1729342, 0.3485784, -1.369061, 0, 1, 0.6352941, 1,
-0.1709192, 0.1685212, -1.258296, 0, 1, 0.6392157, 1,
-0.1670357, 1.895578, -1.066591, 0, 1, 0.6470588, 1,
-0.1633528, 0.2114989, -1.240436, 0, 1, 0.6509804, 1,
-0.1631438, 0.1765979, -1.084332, 0, 1, 0.6588235, 1,
-0.162047, 0.7481199, 1.542546, 0, 1, 0.6627451, 1,
-0.1614448, 0.5383115, -1.381272, 0, 1, 0.6705883, 1,
-0.1589257, 1.019531, -0.6018409, 0, 1, 0.6745098, 1,
-0.1532783, -0.396114, -1.294095, 0, 1, 0.682353, 1,
-0.1451243, 1.282198, 0.5849209, 0, 1, 0.6862745, 1,
-0.1450576, 0.1299651, -1.004592, 0, 1, 0.6941177, 1,
-0.1370923, 0.5115553, 0.09068473, 0, 1, 0.7019608, 1,
-0.1364019, -0.06990422, -2.235585, 0, 1, 0.7058824, 1,
-0.1359239, 0.0507003, -1.239978, 0, 1, 0.7137255, 1,
-0.1350364, 0.02825573, 0.2112484, 0, 1, 0.7176471, 1,
-0.126145, -2.894878, -3.735368, 0, 1, 0.7254902, 1,
-0.1244455, 0.2132149, 1.206533, 0, 1, 0.7294118, 1,
-0.1243527, 0.4561739, 0.2586643, 0, 1, 0.7372549, 1,
-0.1232436, 0.5938441, 0.6258888, 0, 1, 0.7411765, 1,
-0.1214835, 0.2894531, 1.00105, 0, 1, 0.7490196, 1,
-0.1210959, 0.6778586, -0.734019, 0, 1, 0.7529412, 1,
-0.1127469, -1.357399, -2.418193, 0, 1, 0.7607843, 1,
-0.1110306, 2.172248, -0.5328321, 0, 1, 0.7647059, 1,
-0.1070112, -0.1316989, -1.242607, 0, 1, 0.772549, 1,
-0.1053384, -0.6892179, -4.311652, 0, 1, 0.7764706, 1,
-0.1024042, -0.7364282, -4.832632, 0, 1, 0.7843137, 1,
-0.1020459, -0.5479109, -3.280819, 0, 1, 0.7882353, 1,
-0.09900299, 0.4035916, -1.633018, 0, 1, 0.7960784, 1,
-0.09892116, 0.3526055, 1.13786, 0, 1, 0.8039216, 1,
-0.09817852, -0.9680912, -2.987943, 0, 1, 0.8078431, 1,
-0.09323709, -1.04695, -3.015749, 0, 1, 0.8156863, 1,
-0.09297767, -1.496769, -5.089446, 0, 1, 0.8196079, 1,
-0.08871356, 1.15824, 0.185205, 0, 1, 0.827451, 1,
-0.08670781, 1.750721, -1.957619, 0, 1, 0.8313726, 1,
-0.08040465, 1.289785, 0.7828252, 0, 1, 0.8392157, 1,
-0.08003066, -0.2018238, -3.218069, 0, 1, 0.8431373, 1,
-0.07972229, -2.356115, -3.805562, 0, 1, 0.8509804, 1,
-0.07066581, -1.026618, -3.641783, 0, 1, 0.854902, 1,
-0.06940959, 1.015409, -1.124024, 0, 1, 0.8627451, 1,
-0.06733505, -0.0476871, -1.851824, 0, 1, 0.8666667, 1,
-0.06576922, -0.9445899, -2.891555, 0, 1, 0.8745098, 1,
-0.06566461, -1.209466, -2.72295, 0, 1, 0.8784314, 1,
-0.06242772, 1.238628, -0.3027386, 0, 1, 0.8862745, 1,
-0.06121504, -0.4008874, -2.70479, 0, 1, 0.8901961, 1,
-0.05809671, -0.9048103, -2.470688, 0, 1, 0.8980392, 1,
-0.0573133, -0.4319283, -5.876358, 0, 1, 0.9058824, 1,
-0.05715622, -0.3545927, -3.743445, 0, 1, 0.9098039, 1,
-0.05528024, 1.8545, -0.7386318, 0, 1, 0.9176471, 1,
-0.05427914, -0.5174496, -3.353616, 0, 1, 0.9215686, 1,
-0.05394762, -0.4448834, -3.8338, 0, 1, 0.9294118, 1,
-0.04515699, 0.3974705, -1.801924, 0, 1, 0.9333333, 1,
-0.0403368, -1.77657, -2.877123, 0, 1, 0.9411765, 1,
-0.03647625, 0.1779584, 0.1658219, 0, 1, 0.945098, 1,
-0.03552276, 0.5191534, 2.176795, 0, 1, 0.9529412, 1,
-0.03386481, 1.322828, 0.7481262, 0, 1, 0.9568627, 1,
-0.03063844, -1.330103, -4.895703, 0, 1, 0.9647059, 1,
-0.02881114, -0.62707, -4.159443, 0, 1, 0.9686275, 1,
-0.02774926, 1.567482, 0.6608064, 0, 1, 0.9764706, 1,
-0.02751629, -0.06698236, -3.321588, 0, 1, 0.9803922, 1,
-0.02134498, 0.1692336, -1.994772, 0, 1, 0.9882353, 1,
-0.02110542, 1.390903, -1.506195, 0, 1, 0.9921569, 1,
-0.02056087, 1.448871, 0.2700161, 0, 1, 1, 1,
-0.0168153, 0.9658496, -0.4572285, 0, 0.9921569, 1, 1,
-0.01522032, -0.9758345, -2.483568, 0, 0.9882353, 1, 1,
-0.01269833, 0.2389506, -1.01264, 0, 0.9803922, 1, 1,
-0.007899158, -0.09619872, -3.324911, 0, 0.9764706, 1, 1,
-0.002664875, 0.6110088, -0.0951214, 0, 0.9686275, 1, 1,
0.001076014, -0.7744628, 3.705271, 0, 0.9647059, 1, 1,
0.001274724, 1.11198, -0.3470175, 0, 0.9568627, 1, 1,
0.005897165, -2.635179, 3.739106, 0, 0.9529412, 1, 1,
0.005978674, -0.3448682, 4.00844, 0, 0.945098, 1, 1,
0.009518205, -1.816542, 4.571128, 0, 0.9411765, 1, 1,
0.01197898, 0.1654562, 1.391571, 0, 0.9333333, 1, 1,
0.01496796, 0.1270006, 1.985654, 0, 0.9294118, 1, 1,
0.01885846, 1.629715, -2.333764, 0, 0.9215686, 1, 1,
0.02165756, 0.04003348, 2.748981, 0, 0.9176471, 1, 1,
0.03714149, -0.8213096, 2.860695, 0, 0.9098039, 1, 1,
0.0386176, 0.7046543, 0.4171237, 0, 0.9058824, 1, 1,
0.03918697, -1.335185, 3.282143, 0, 0.8980392, 1, 1,
0.04046765, -0.6867987, 2.973268, 0, 0.8901961, 1, 1,
0.04125177, 0.06569849, 2.53377, 0, 0.8862745, 1, 1,
0.04654782, -1.976511, 1.34057, 0, 0.8784314, 1, 1,
0.04751011, 0.7162496, -0.4201297, 0, 0.8745098, 1, 1,
0.04854403, 1.120005, -0.6791646, 0, 0.8666667, 1, 1,
0.05396471, 0.1280062, 0.6296681, 0, 0.8627451, 1, 1,
0.06306338, -0.4865062, 3.946807, 0, 0.854902, 1, 1,
0.06785038, -0.379054, 3.506802, 0, 0.8509804, 1, 1,
0.06996197, 0.224634, 1.016464, 0, 0.8431373, 1, 1,
0.0702199, -0.1850251, 0.6968561, 0, 0.8392157, 1, 1,
0.07122779, 0.5142547, -0.2363841, 0, 0.8313726, 1, 1,
0.07987141, -1.156746, 4.696479, 0, 0.827451, 1, 1,
0.09106402, -0.9488593, 2.293665, 0, 0.8196079, 1, 1,
0.09121902, -1.203323, 2.080372, 0, 0.8156863, 1, 1,
0.0962765, -0.3937961, 3.156231, 0, 0.8078431, 1, 1,
0.09747689, 1.017911, 0.3256081, 0, 0.8039216, 1, 1,
0.09781975, 0.7554202, 0.8789263, 0, 0.7960784, 1, 1,
0.1003087, 0.4666244, 1.095929, 0, 0.7882353, 1, 1,
0.1054783, -1.054571, 3.564296, 0, 0.7843137, 1, 1,
0.1084928, -1.143239, 4.965222, 0, 0.7764706, 1, 1,
0.1188312, 1.521535, -0.08358543, 0, 0.772549, 1, 1,
0.1193886, 0.6278393, 0.1303803, 0, 0.7647059, 1, 1,
0.122904, -0.8420827, 2.269872, 0, 0.7607843, 1, 1,
0.124764, -1.290792, 3.244905, 0, 0.7529412, 1, 1,
0.1256887, 0.09008127, 1.470272, 0, 0.7490196, 1, 1,
0.1286304, -1.445137, 1.503824, 0, 0.7411765, 1, 1,
0.1329673, -0.01538956, 0.5092285, 0, 0.7372549, 1, 1,
0.1364017, -0.01745269, 0.7604541, 0, 0.7294118, 1, 1,
0.1369297, -0.2829087, 4.429909, 0, 0.7254902, 1, 1,
0.1383259, -0.6929621, 1.17486, 0, 0.7176471, 1, 1,
0.1403615, -0.1282037, 2.158784, 0, 0.7137255, 1, 1,
0.1412664, -0.7771048, 2.322914, 0, 0.7058824, 1, 1,
0.1430659, -1.286592, 3.045016, 0, 0.6980392, 1, 1,
0.1463718, -0.6753409, 2.225439, 0, 0.6941177, 1, 1,
0.1510978, -0.5911927, 2.682705, 0, 0.6862745, 1, 1,
0.1534703, -0.9348409, 3.707336, 0, 0.682353, 1, 1,
0.154516, 1.956892, -1.336523, 0, 0.6745098, 1, 1,
0.1605851, 0.1300476, 3.040673, 0, 0.6705883, 1, 1,
0.1610424, 0.6233425, -1.92408, 0, 0.6627451, 1, 1,
0.1622063, 1.118941, 1.379787, 0, 0.6588235, 1, 1,
0.1662484, 0.7149166, 0.8321289, 0, 0.6509804, 1, 1,
0.1738585, -0.8999574, 3.756803, 0, 0.6470588, 1, 1,
0.1746458, 1.095605, 1.459094, 0, 0.6392157, 1, 1,
0.1757469, 0.5708374, 0.4578499, 0, 0.6352941, 1, 1,
0.1786219, 0.5297682, 0.8343887, 0, 0.627451, 1, 1,
0.1916997, -1.700437, 2.200958, 0, 0.6235294, 1, 1,
0.1929312, 0.3371853, 2.46594, 0, 0.6156863, 1, 1,
0.1967656, -0.7880989, 3.352787, 0, 0.6117647, 1, 1,
0.2009094, -0.2166103, 3.626889, 0, 0.6039216, 1, 1,
0.2035688, 1.399271, 0.2105554, 0, 0.5960785, 1, 1,
0.2036915, -1.373049, 2.427285, 0, 0.5921569, 1, 1,
0.2069963, -1.05472, 4.421111, 0, 0.5843138, 1, 1,
0.208725, 0.5329961, 0.7209835, 0, 0.5803922, 1, 1,
0.2100736, 0.7695836, -0.8323624, 0, 0.572549, 1, 1,
0.2137153, -0.4689565, 4.014894, 0, 0.5686275, 1, 1,
0.2139041, 0.7404316, 1.036789, 0, 0.5607843, 1, 1,
0.2169833, -0.2567736, 2.244728, 0, 0.5568628, 1, 1,
0.2182373, -0.2187318, 2.186788, 0, 0.5490196, 1, 1,
0.218303, -1.013967, 2.921464, 0, 0.5450981, 1, 1,
0.2206201, -0.6989715, 1.68423, 0, 0.5372549, 1, 1,
0.2281413, -0.0110697, 2.522226, 0, 0.5333334, 1, 1,
0.228277, -0.4976744, 2.387477, 0, 0.5254902, 1, 1,
0.2314546, -0.05589105, 0.5925925, 0, 0.5215687, 1, 1,
0.2353405, 0.2145231, -0.3395444, 0, 0.5137255, 1, 1,
0.2381899, 1.264028, -1.06412, 0, 0.509804, 1, 1,
0.2500719, 0.1696483, 0.9301878, 0, 0.5019608, 1, 1,
0.253186, 0.3927135, 1.680051, 0, 0.4941176, 1, 1,
0.2533002, -0.1863831, 2.921946, 0, 0.4901961, 1, 1,
0.2552605, 0.2354679, 1.219688, 0, 0.4823529, 1, 1,
0.2556611, 0.9548375, -0.4428169, 0, 0.4784314, 1, 1,
0.2557192, -1.235775, 2.665275, 0, 0.4705882, 1, 1,
0.2565135, -0.8769606, 2.906068, 0, 0.4666667, 1, 1,
0.258254, -0.5328201, 4.347007, 0, 0.4588235, 1, 1,
0.2611279, 1.427468, 2.187001, 0, 0.454902, 1, 1,
0.2633123, -0.7230643, 4.593124, 0, 0.4470588, 1, 1,
0.2640142, 0.0544846, 1.033255, 0, 0.4431373, 1, 1,
0.2661258, 1.173396, 0.4604042, 0, 0.4352941, 1, 1,
0.2662734, 0.7588832, -0.1629494, 0, 0.4313726, 1, 1,
0.2667103, -1.815337, 4.213806, 0, 0.4235294, 1, 1,
0.2714026, -0.02946969, 2.903674, 0, 0.4196078, 1, 1,
0.2736404, 1.586895, -0.05690161, 0, 0.4117647, 1, 1,
0.2800261, 0.370682, 0.1410251, 0, 0.4078431, 1, 1,
0.2807912, 0.4621926, 0.1020685, 0, 0.4, 1, 1,
0.2890898, 0.8482252, 0.2520136, 0, 0.3921569, 1, 1,
0.2899683, 0.7343857, 0.5757639, 0, 0.3882353, 1, 1,
0.2905776, -0.3387866, 2.898821, 0, 0.3803922, 1, 1,
0.2918596, 1.764052, 0.4090962, 0, 0.3764706, 1, 1,
0.2943962, -0.04621428, 2.416854, 0, 0.3686275, 1, 1,
0.2958521, -2.128111, 3.183381, 0, 0.3647059, 1, 1,
0.3003154, -0.4441151, 0.2091778, 0, 0.3568628, 1, 1,
0.300469, 0.3079242, -0.5376614, 0, 0.3529412, 1, 1,
0.3013411, -1.792007, 2.586161, 0, 0.345098, 1, 1,
0.3028429, 0.2902007, 1.161135, 0, 0.3411765, 1, 1,
0.3138803, -0.003408419, 1.917877, 0, 0.3333333, 1, 1,
0.3168302, 0.05171064, 1.5083, 0, 0.3294118, 1, 1,
0.3223089, 0.9715231, -0.1795013, 0, 0.3215686, 1, 1,
0.326401, 0.1912657, 1.051239, 0, 0.3176471, 1, 1,
0.3273602, 0.8388854, 1.400327, 0, 0.3098039, 1, 1,
0.3304379, 0.3419908, 1.694889, 0, 0.3058824, 1, 1,
0.3329673, 1.706948, -0.8112071, 0, 0.2980392, 1, 1,
0.3338442, 0.9342689, -1.903888, 0, 0.2901961, 1, 1,
0.334567, 1.402429, 0.7713208, 0, 0.2862745, 1, 1,
0.3380356, -0.7810427, 3.471531, 0, 0.2784314, 1, 1,
0.3418553, 1.811511, 1.085782, 0, 0.2745098, 1, 1,
0.3427065, -1.254919, 2.864035, 0, 0.2666667, 1, 1,
0.3438176, 1.433584, 1.374725, 0, 0.2627451, 1, 1,
0.347705, 0.08300919, 1.180598, 0, 0.254902, 1, 1,
0.353377, -0.1781931, 1.338394, 0, 0.2509804, 1, 1,
0.362386, 0.8139897, 0.8625912, 0, 0.2431373, 1, 1,
0.3683311, -0.2013131, 0.5622103, 0, 0.2392157, 1, 1,
0.3700986, 1.1756, 1.39342, 0, 0.2313726, 1, 1,
0.3752071, -1.086019, 2.083064, 0, 0.227451, 1, 1,
0.3764378, -0.9374639, 3.745161, 0, 0.2196078, 1, 1,
0.3772044, 0.3544736, 0.08502822, 0, 0.2156863, 1, 1,
0.3801946, 2.237241, -0.1482499, 0, 0.2078431, 1, 1,
0.3804366, 0.5645292, -0.217707, 0, 0.2039216, 1, 1,
0.381775, 0.08422211, 2.11854, 0, 0.1960784, 1, 1,
0.3835921, -0.0914463, 2.470033, 0, 0.1882353, 1, 1,
0.3847786, 1.609757, 0.2215753, 0, 0.1843137, 1, 1,
0.3853947, 1.537961, 1.341812, 0, 0.1764706, 1, 1,
0.3856309, 2.052619, -0.7036615, 0, 0.172549, 1, 1,
0.3941323, -0.197556, 0.4240761, 0, 0.1647059, 1, 1,
0.3948748, 0.1662677, 1.478804, 0, 0.1607843, 1, 1,
0.3949654, 0.3155745, 3.183377, 0, 0.1529412, 1, 1,
0.3974878, -0.004655073, 0.6231545, 0, 0.1490196, 1, 1,
0.3995012, 0.7886891, 0.1450164, 0, 0.1411765, 1, 1,
0.4036333, -1.189505, 1.679308, 0, 0.1372549, 1, 1,
0.4071157, -0.6379026, 2.536038, 0, 0.1294118, 1, 1,
0.4097063, 0.04953688, 0.02455261, 0, 0.1254902, 1, 1,
0.4100156, 0.7889575, 1.139395, 0, 0.1176471, 1, 1,
0.413356, -0.4953296, 1.809638, 0, 0.1137255, 1, 1,
0.4173625, -0.3323244, 0.864993, 0, 0.1058824, 1, 1,
0.4276142, -0.5989625, 1.594059, 0, 0.09803922, 1, 1,
0.4285895, -0.3728347, 2.532621, 0, 0.09411765, 1, 1,
0.4302782, 1.463172, 0.1737278, 0, 0.08627451, 1, 1,
0.4350991, 0.2574354, 2.436207, 0, 0.08235294, 1, 1,
0.43539, -0.2511471, 2.041747, 0, 0.07450981, 1, 1,
0.4369246, 1.038924, 1.042109, 0, 0.07058824, 1, 1,
0.4421229, -0.8280998, 3.750862, 0, 0.0627451, 1, 1,
0.4457109, 2.245415, 1.435436, 0, 0.05882353, 1, 1,
0.4496251, 0.8765266, 1.473317, 0, 0.05098039, 1, 1,
0.451019, -0.8952652, 3.452812, 0, 0.04705882, 1, 1,
0.4537669, 0.04968294, 2.177918, 0, 0.03921569, 1, 1,
0.4547842, 0.3506334, -0.1028364, 0, 0.03529412, 1, 1,
0.4549094, -0.5672407, 0.63284, 0, 0.02745098, 1, 1,
0.4551913, -2.2432, 3.826287, 0, 0.02352941, 1, 1,
0.4615571, -0.8358047, 0.9660735, 0, 0.01568628, 1, 1,
0.4619281, -0.8342174, 3.632569, 0, 0.01176471, 1, 1,
0.4619915, -0.199317, 0.4408026, 0, 0.003921569, 1, 1,
0.4663397, 0.02311118, 0.4551826, 0.003921569, 0, 1, 1,
0.4738084, 0.3635983, -0.01890894, 0.007843138, 0, 1, 1,
0.4748544, -0.1866456, 0.8167801, 0.01568628, 0, 1, 1,
0.4829763, 0.910099, 0.8316607, 0.01960784, 0, 1, 1,
0.4870293, 0.6672211, -0.7542688, 0.02745098, 0, 1, 1,
0.4889584, 0.6865746, 2.669329, 0.03137255, 0, 1, 1,
0.4908086, -0.3664036, 2.718492, 0.03921569, 0, 1, 1,
0.4923543, 1.545078, 1.52985, 0.04313726, 0, 1, 1,
0.4938563, 0.4150472, 1.980975, 0.05098039, 0, 1, 1,
0.4959162, 0.352581, 1.881768, 0.05490196, 0, 1, 1,
0.5000407, 1.84291, 1.250158, 0.0627451, 0, 1, 1,
0.5044035, 0.1726377, 1.900339, 0.06666667, 0, 1, 1,
0.506453, -0.7149375, 3.01882, 0.07450981, 0, 1, 1,
0.5110129, 0.3309968, 0.7699402, 0.07843138, 0, 1, 1,
0.5117257, 1.016441, 0.9483138, 0.08627451, 0, 1, 1,
0.5178609, -0.007060836, 2.552975, 0.09019608, 0, 1, 1,
0.5197091, 0.1467976, 2.439707, 0.09803922, 0, 1, 1,
0.5230376, 1.545038, -0.7175814, 0.1058824, 0, 1, 1,
0.5232912, -0.8667314, 3.645931, 0.1098039, 0, 1, 1,
0.523447, -1.500535, 2.418113, 0.1176471, 0, 1, 1,
0.5242019, -0.3532447, 3.477968, 0.1215686, 0, 1, 1,
0.5273365, 0.7543774, 1.640761, 0.1294118, 0, 1, 1,
0.5292905, 0.3935735, 0.8141591, 0.1333333, 0, 1, 1,
0.5296443, 1.128589, -0.2563015, 0.1411765, 0, 1, 1,
0.5351887, 1.51071, 2.122492, 0.145098, 0, 1, 1,
0.5390506, 0.4554683, -0.4827425, 0.1529412, 0, 1, 1,
0.5398617, -2.273164, 3.88827, 0.1568628, 0, 1, 1,
0.5483807, 0.2273627, 3.643533, 0.1647059, 0, 1, 1,
0.5504726, 0.6077216, 0.2086845, 0.1686275, 0, 1, 1,
0.5592502, 1.282743, 0.2848787, 0.1764706, 0, 1, 1,
0.5606658, 0.5314941, 1.745462, 0.1803922, 0, 1, 1,
0.5644097, -0.4550107, 1.350706, 0.1882353, 0, 1, 1,
0.5658652, -0.08321738, 2.683465, 0.1921569, 0, 1, 1,
0.5747389, 1.394626, -1.51972, 0.2, 0, 1, 1,
0.5787745, -1.228715, 3.618258, 0.2078431, 0, 1, 1,
0.5847743, -0.2352538, 1.656745, 0.2117647, 0, 1, 1,
0.5868353, 1.883978, 0.3279423, 0.2196078, 0, 1, 1,
0.588483, -1.692921, 3.398445, 0.2235294, 0, 1, 1,
0.5891736, -0.8714071, 2.962775, 0.2313726, 0, 1, 1,
0.5923139, -0.07594745, 2.290983, 0.2352941, 0, 1, 1,
0.592509, -0.2217214, 3.205227, 0.2431373, 0, 1, 1,
0.5927537, -0.2660352, 1.009726, 0.2470588, 0, 1, 1,
0.596095, -0.09893014, 1.524529, 0.254902, 0, 1, 1,
0.5994067, -1.638647, 2.003919, 0.2588235, 0, 1, 1,
0.6003448, 0.9862072, -0.3773282, 0.2666667, 0, 1, 1,
0.601285, -0.1147603, 1.048769, 0.2705882, 0, 1, 1,
0.6036953, 0.5019463, 0.8785951, 0.2784314, 0, 1, 1,
0.6051349, -0.5945691, 2.319765, 0.282353, 0, 1, 1,
0.6104032, 0.1441546, 3.082214, 0.2901961, 0, 1, 1,
0.6120782, 1.894665, 0.5748133, 0.2941177, 0, 1, 1,
0.6195263, -0.2624289, 4.516431, 0.3019608, 0, 1, 1,
0.6199338, -0.03748548, 1.415706, 0.3098039, 0, 1, 1,
0.6214574, 0.6170465, 0.280564, 0.3137255, 0, 1, 1,
0.6215644, -0.03406567, 2.832446, 0.3215686, 0, 1, 1,
0.6235661, 0.6967691, 1.452946, 0.3254902, 0, 1, 1,
0.6263159, 0.4470927, -0.07365532, 0.3333333, 0, 1, 1,
0.62888, -0.03303243, 1.336342, 0.3372549, 0, 1, 1,
0.6322939, -0.01112236, 1.163801, 0.345098, 0, 1, 1,
0.6328217, -0.3921458, 1.993605, 0.3490196, 0, 1, 1,
0.6331955, -0.2871175, 2.768135, 0.3568628, 0, 1, 1,
0.6351441, 0.9719995, 1.592378, 0.3607843, 0, 1, 1,
0.6365709, -1.264285, 0.2331495, 0.3686275, 0, 1, 1,
0.6417922, 0.207354, 0.04752925, 0.372549, 0, 1, 1,
0.6439505, -1.511253, 1.312161, 0.3803922, 0, 1, 1,
0.6444864, 0.7372964, 0.7604318, 0.3843137, 0, 1, 1,
0.6446215, -1.191003, 4.150567, 0.3921569, 0, 1, 1,
0.6473087, -0.03823635, 0.01410977, 0.3960784, 0, 1, 1,
0.6474181, -0.1792888, 3.483798, 0.4039216, 0, 1, 1,
0.6476179, -0.09703189, 0.8255952, 0.4117647, 0, 1, 1,
0.6487667, 0.4589816, -0.4924512, 0.4156863, 0, 1, 1,
0.6494457, -0.002253272, -0.2129143, 0.4235294, 0, 1, 1,
0.6499066, -0.4315045, 3.480613, 0.427451, 0, 1, 1,
0.6518545, 0.1899809, 1.427539, 0.4352941, 0, 1, 1,
0.655184, 0.4590721, 0.3332939, 0.4392157, 0, 1, 1,
0.6666738, -0.9996888, 0.3369068, 0.4470588, 0, 1, 1,
0.6677203, 0.3550038, 0.5791712, 0.4509804, 0, 1, 1,
0.6787726, -0.1039454, 2.194297, 0.4588235, 0, 1, 1,
0.6793569, -1.467028, 3.034083, 0.4627451, 0, 1, 1,
0.6890724, -0.4423399, 3.843853, 0.4705882, 0, 1, 1,
0.6986871, 0.8089234, 1.618507, 0.4745098, 0, 1, 1,
0.7006534, 1.742055, 3.218741, 0.4823529, 0, 1, 1,
0.7027333, -1.290176, 2.979138, 0.4862745, 0, 1, 1,
0.7034216, -0.7703655, 1.935527, 0.4941176, 0, 1, 1,
0.7066029, 1.168326, -0.1310642, 0.5019608, 0, 1, 1,
0.7086182, 0.2202733, 0.9400657, 0.5058824, 0, 1, 1,
0.7112578, 1.869133, 0.8900735, 0.5137255, 0, 1, 1,
0.7119063, 0.7415884, 2.302132, 0.5176471, 0, 1, 1,
0.7129813, -0.8911176, 2.572926, 0.5254902, 0, 1, 1,
0.7212789, -0.6728033, 0.5177387, 0.5294118, 0, 1, 1,
0.7260901, 0.5797705, 1.00403, 0.5372549, 0, 1, 1,
0.7289807, -0.8539632, 2.43275, 0.5411765, 0, 1, 1,
0.7298044, -0.4560941, 3.61213, 0.5490196, 0, 1, 1,
0.7319098, -0.02498695, 1.825467, 0.5529412, 0, 1, 1,
0.7335835, 0.02209125, 2.533962, 0.5607843, 0, 1, 1,
0.7338167, 1.344414, 0.1581708, 0.5647059, 0, 1, 1,
0.7386982, 1.546783, -0.05913148, 0.572549, 0, 1, 1,
0.7387851, 0.1662627, 0.1960422, 0.5764706, 0, 1, 1,
0.7420427, -0.3146671, 1.239374, 0.5843138, 0, 1, 1,
0.7435567, 0.1574808, 1.887213, 0.5882353, 0, 1, 1,
0.7449435, 0.9661219, 0.1020056, 0.5960785, 0, 1, 1,
0.748769, -0.8072618, 2.260668, 0.6039216, 0, 1, 1,
0.7516687, 0.2602135, 1.12934, 0.6078432, 0, 1, 1,
0.7543429, -0.08310548, 0.9621913, 0.6156863, 0, 1, 1,
0.7546561, 0.03652597, 1.197316, 0.6196079, 0, 1, 1,
0.7559972, 1.824487, 0.7422711, 0.627451, 0, 1, 1,
0.7591059, 0.7105188, 1.342663, 0.6313726, 0, 1, 1,
0.7635816, -0.09494464, 0.7724174, 0.6392157, 0, 1, 1,
0.7683005, -1.098914, 1.231874, 0.6431373, 0, 1, 1,
0.7706443, -1.504255, 3.755768, 0.6509804, 0, 1, 1,
0.7764035, -0.147472, 2.140223, 0.654902, 0, 1, 1,
0.7849219, -1.451869, 2.559788, 0.6627451, 0, 1, 1,
0.7863235, -1.144648, 1.631746, 0.6666667, 0, 1, 1,
0.786938, -1.497598, 1.331564, 0.6745098, 0, 1, 1,
0.787822, 0.2408752, -0.9279191, 0.6784314, 0, 1, 1,
0.7935659, -0.6599153, 2.138126, 0.6862745, 0, 1, 1,
0.7941194, -0.356055, 3.238096, 0.6901961, 0, 1, 1,
0.799164, -0.1912089, 1.441963, 0.6980392, 0, 1, 1,
0.8032051, 0.09799334, 1.388787, 0.7058824, 0, 1, 1,
0.803854, -0.7196369, 2.458567, 0.7098039, 0, 1, 1,
0.8072743, 0.7340871, 1.579792, 0.7176471, 0, 1, 1,
0.8174115, 1.718934, 1.888514, 0.7215686, 0, 1, 1,
0.822734, 0.2575757, 1.627415, 0.7294118, 0, 1, 1,
0.8256097, 0.2355852, 0.8138824, 0.7333333, 0, 1, 1,
0.8308399, -0.8062397, 1.688977, 0.7411765, 0, 1, 1,
0.843511, 2.472959, 1.215906, 0.7450981, 0, 1, 1,
0.8449505, -0.03216011, 0.3650693, 0.7529412, 0, 1, 1,
0.8548558, 1.001655, 1.261523, 0.7568628, 0, 1, 1,
0.8666028, -0.06653243, 1.371144, 0.7647059, 0, 1, 1,
0.8807377, 0.423363, 2.557804, 0.7686275, 0, 1, 1,
0.8807949, 1.047636, -0.9835861, 0.7764706, 0, 1, 1,
0.8841037, -1.914283, 2.461916, 0.7803922, 0, 1, 1,
0.8851458, 0.30925, 2.559428, 0.7882353, 0, 1, 1,
0.8869815, 0.977347, 2.245449, 0.7921569, 0, 1, 1,
0.8960437, 1.522757, 0.4556881, 0.8, 0, 1, 1,
0.899649, 1.143905, -0.04128582, 0.8078431, 0, 1, 1,
0.9037999, 0.8398076, 0.3618645, 0.8117647, 0, 1, 1,
0.9039295, -0.3162894, 2.94571, 0.8196079, 0, 1, 1,
0.9071072, 2.036382, -1.400569, 0.8235294, 0, 1, 1,
0.9072151, -0.1135938, 1.708061, 0.8313726, 0, 1, 1,
0.907474, 0.5092768, -0.7369903, 0.8352941, 0, 1, 1,
0.9109552, -0.07435869, 2.29295, 0.8431373, 0, 1, 1,
0.9129801, 1.520487, 0.7380549, 0.8470588, 0, 1, 1,
0.9182886, -0.2074969, 1.432581, 0.854902, 0, 1, 1,
0.9188687, 1.058848, 0.8408113, 0.8588235, 0, 1, 1,
0.9238496, 1.02345, -0.7492999, 0.8666667, 0, 1, 1,
0.9250559, -0.4841352, 2.036436, 0.8705882, 0, 1, 1,
0.9266595, 0.4111134, 0.3508486, 0.8784314, 0, 1, 1,
0.9301286, 0.1052828, 0.684624, 0.8823529, 0, 1, 1,
0.9328056, -2.170652, 2.46059, 0.8901961, 0, 1, 1,
0.9340793, 0.5754094, 0.8249823, 0.8941177, 0, 1, 1,
0.9400134, 0.2684569, -0.3021213, 0.9019608, 0, 1, 1,
0.94144, -1.115631, 3.003565, 0.9098039, 0, 1, 1,
0.9577919, -0.4383228, 1.570963, 0.9137255, 0, 1, 1,
0.9656306, -0.8965671, 1.689318, 0.9215686, 0, 1, 1,
0.9701024, -0.2216265, 2.795714, 0.9254902, 0, 1, 1,
0.9740195, -0.1908164, 1.985178, 0.9333333, 0, 1, 1,
0.9753505, -0.8503078, 1.342664, 0.9372549, 0, 1, 1,
0.9775658, -1.197089, 2.142246, 0.945098, 0, 1, 1,
0.9804779, -1.423598, 2.601765, 0.9490196, 0, 1, 1,
0.9808345, -0.6406225, 3.207823, 0.9568627, 0, 1, 1,
0.9828995, 0.9559307, 1.415285, 0.9607843, 0, 1, 1,
0.9833697, 0.6266094, 0.09887651, 0.9686275, 0, 1, 1,
0.9871948, 0.7726786, -0.2165022, 0.972549, 0, 1, 1,
1.001162, 2.267671, 0.2809603, 0.9803922, 0, 1, 1,
1.002072, -1.067418, 3.496493, 0.9843137, 0, 1, 1,
1.003944, -0.6235048, 0.6615841, 0.9921569, 0, 1, 1,
1.004217, 1.531408, -0.504234, 0.9960784, 0, 1, 1,
1.011148, 1.056255, 1.626841, 1, 0, 0.9960784, 1,
1.02183, 0.6473123, 2.210235, 1, 0, 0.9882353, 1,
1.032509, -1.724577, 1.515611, 1, 0, 0.9843137, 1,
1.03287, -0.361156, 1.042768, 1, 0, 0.9764706, 1,
1.033798, -0.232137, 1.210052, 1, 0, 0.972549, 1,
1.034603, -1.131284, 2.448568, 1, 0, 0.9647059, 1,
1.046819, 0.2421629, 2.367316, 1, 0, 0.9607843, 1,
1.050819, 0.398806, 1.633449, 1, 0, 0.9529412, 1,
1.05916, -0.8583741, 1.117069, 1, 0, 0.9490196, 1,
1.059232, 0.1254837, 3.932544, 1, 0, 0.9411765, 1,
1.061941, -0.7810311, 1.583647, 1, 0, 0.9372549, 1,
1.072506, -1.088151, 2.557612, 1, 0, 0.9294118, 1,
1.081499, -0.2246059, 2.568128, 1, 0, 0.9254902, 1,
1.082952, 1.534013, 1.421367, 1, 0, 0.9176471, 1,
1.085148, 0.9933678, 1.073405, 1, 0, 0.9137255, 1,
1.086036, -1.180139, 2.337945, 1, 0, 0.9058824, 1,
1.088483, 0.5042178, -0.1439684, 1, 0, 0.9019608, 1,
1.089769, 1.489048, 1.328368, 1, 0, 0.8941177, 1,
1.098786, -0.1956135, 1.591117, 1, 0, 0.8862745, 1,
1.102427, 0.6580802, 0.7675135, 1, 0, 0.8823529, 1,
1.1095, 0.3948452, 0.2479592, 1, 0, 0.8745098, 1,
1.119304, -1.207675, 2.383657, 1, 0, 0.8705882, 1,
1.119457, -0.5249183, 1.562708, 1, 0, 0.8627451, 1,
1.138741, -0.4904414, 1.987361, 1, 0, 0.8588235, 1,
1.148886, 0.04389533, 1.859267, 1, 0, 0.8509804, 1,
1.15372, 1.85417, 1.072966, 1, 0, 0.8470588, 1,
1.154924, 0.09460817, 1.531086, 1, 0, 0.8392157, 1,
1.156408, -0.6374766, 1.754585, 1, 0, 0.8352941, 1,
1.166544, 0.72839, 0.3888944, 1, 0, 0.827451, 1,
1.172216, -0.205927, 3.290099, 1, 0, 0.8235294, 1,
1.172753, 0.6797441, 1.149932, 1, 0, 0.8156863, 1,
1.176261, 0.6532494, -0.3266906, 1, 0, 0.8117647, 1,
1.178248, -1.549834, 3.016321, 1, 0, 0.8039216, 1,
1.179592, 1.629463, 2.054822, 1, 0, 0.7960784, 1,
1.185232, -0.1431059, 1.15285, 1, 0, 0.7921569, 1,
1.185483, 1.441375, 2.051802, 1, 0, 0.7843137, 1,
1.185572, 0.8999204, 0.5163571, 1, 0, 0.7803922, 1,
1.188204, 0.8207828, 1.789687, 1, 0, 0.772549, 1,
1.193263, -0.1935886, 2.424265, 1, 0, 0.7686275, 1,
1.201861, 1.073653, -0.6188077, 1, 0, 0.7607843, 1,
1.21196, 1.338172, 0.05342738, 1, 0, 0.7568628, 1,
1.213956, -2.151715, 1.321484, 1, 0, 0.7490196, 1,
1.2142, 1.363191, 0.8883837, 1, 0, 0.7450981, 1,
1.217924, -0.7521358, -0.5069008, 1, 0, 0.7372549, 1,
1.221957, 1.303045, 0.08474386, 1, 0, 0.7333333, 1,
1.236207, 0.7692859, 1.449032, 1, 0, 0.7254902, 1,
1.236572, 1.26414, -0.3052949, 1, 0, 0.7215686, 1,
1.237396, -0.01223142, 1.861118, 1, 0, 0.7137255, 1,
1.237597, 0.1169768, 0.2938609, 1, 0, 0.7098039, 1,
1.243061, 0.3577045, 0.3663681, 1, 0, 0.7019608, 1,
1.249804, -0.04365923, 0.7337373, 1, 0, 0.6941177, 1,
1.254897, -0.3999827, 2.179486, 1, 0, 0.6901961, 1,
1.257098, 0.05446284, 1.444878, 1, 0, 0.682353, 1,
1.26686, 0.2883014, 1.636897, 1, 0, 0.6784314, 1,
1.277186, 1.185998, 1.785559, 1, 0, 0.6705883, 1,
1.27995, -0.5172673, 1.519315, 1, 0, 0.6666667, 1,
1.27999, 0.9723692, 0.7556936, 1, 0, 0.6588235, 1,
1.287973, 3.056958, -0.9275318, 1, 0, 0.654902, 1,
1.296781, -1.132977, 3.434437, 1, 0, 0.6470588, 1,
1.303488, -0.5261537, 1.2111, 1, 0, 0.6431373, 1,
1.304729, -0.4335617, 1.302853, 1, 0, 0.6352941, 1,
1.304901, -0.6069879, 2.932983, 1, 0, 0.6313726, 1,
1.312037, -0.1701584, 1.413474, 1, 0, 0.6235294, 1,
1.313808, -0.005453143, 0.8357862, 1, 0, 0.6196079, 1,
1.315992, 0.8243127, 1.46956, 1, 0, 0.6117647, 1,
1.319307, -1.735205, 3.525564, 1, 0, 0.6078432, 1,
1.323957, 2.183383, -0.1736532, 1, 0, 0.6, 1,
1.326374, 1.140551, 1.31792, 1, 0, 0.5921569, 1,
1.346742, 0.2281139, 1.939826, 1, 0, 0.5882353, 1,
1.35153, 0.1788661, -0.07199719, 1, 0, 0.5803922, 1,
1.354946, 1.242133, 1.819549, 1, 0, 0.5764706, 1,
1.355488, 0.3020872, 1.418345, 1, 0, 0.5686275, 1,
1.361507, 0.6819382, 0.1383659, 1, 0, 0.5647059, 1,
1.364469, 2.027156, 1.269054, 1, 0, 0.5568628, 1,
1.372618, 0.4438938, 1.069845, 1, 0, 0.5529412, 1,
1.372945, 1.016429, 1.850768, 1, 0, 0.5450981, 1,
1.380466, 0.3029956, 1.394977, 1, 0, 0.5411765, 1,
1.383722, 0.1955922, 1.375417, 1, 0, 0.5333334, 1,
1.385299, 0.7190149, -0.5952338, 1, 0, 0.5294118, 1,
1.390532, 0.8293447, 2.359979, 1, 0, 0.5215687, 1,
1.396399, -0.1804379, 1.624713, 1, 0, 0.5176471, 1,
1.39893, 0.3497419, 0.8490883, 1, 0, 0.509804, 1,
1.39932, 0.2227508, 2.102129, 1, 0, 0.5058824, 1,
1.407268, 0.04022911, -0.1978215, 1, 0, 0.4980392, 1,
1.412853, -0.1301723, 2.732863, 1, 0, 0.4901961, 1,
1.418332, 0.4417419, 0.7795817, 1, 0, 0.4862745, 1,
1.421539, -1.507832, 2.679431, 1, 0, 0.4784314, 1,
1.424054, 0.1502424, 1.093076, 1, 0, 0.4745098, 1,
1.428844, -2.07237, 2.954576, 1, 0, 0.4666667, 1,
1.4311, 1.782263, 2.196231, 1, 0, 0.4627451, 1,
1.436714, 0.2315841, 3.691592, 1, 0, 0.454902, 1,
1.437111, 1.896673, 0.5928746, 1, 0, 0.4509804, 1,
1.448177, -2.073221, 3.983984, 1, 0, 0.4431373, 1,
1.448315, -0.786458, 2.235277, 1, 0, 0.4392157, 1,
1.450681, -0.860033, 3.416007, 1, 0, 0.4313726, 1,
1.464338, 0.209438, 3.785318, 1, 0, 0.427451, 1,
1.481779, -1.734666, 1.164061, 1, 0, 0.4196078, 1,
1.511439, -0.5752444, 2.340715, 1, 0, 0.4156863, 1,
1.518662, 0.1004862, 1.160032, 1, 0, 0.4078431, 1,
1.531171, 0.0943353, 1.367396, 1, 0, 0.4039216, 1,
1.534135, 0.1156663, 0.9082025, 1, 0, 0.3960784, 1,
1.547815, 0.797616, 2.621824, 1, 0, 0.3882353, 1,
1.549097, 1.085036, 0.7545027, 1, 0, 0.3843137, 1,
1.554166, -1.542445, 1.96392, 1, 0, 0.3764706, 1,
1.570425, -0.4073098, 2.177761, 1, 0, 0.372549, 1,
1.573613, -0.998451, 3.169957, 1, 0, 0.3647059, 1,
1.58059, -0.1904854, 1.002541, 1, 0, 0.3607843, 1,
1.581183, 1.258494, 1.808716, 1, 0, 0.3529412, 1,
1.58873, 0.4960566, 0.8247032, 1, 0, 0.3490196, 1,
1.598516, 0.9246471, 1.773651, 1, 0, 0.3411765, 1,
1.598521, -1.486852, 2.336324, 1, 0, 0.3372549, 1,
1.605418, -1.095439, 2.012459, 1, 0, 0.3294118, 1,
1.605561, -1.067446, 2.052132, 1, 0, 0.3254902, 1,
1.611472, 2.43528, -0.3744457, 1, 0, 0.3176471, 1,
1.61171, 0.01531687, 2.671748, 1, 0, 0.3137255, 1,
1.638022, 0.5957492, 1.485769, 1, 0, 0.3058824, 1,
1.644439, -1.324024, 2.606685, 1, 0, 0.2980392, 1,
1.65086, 0.07510451, 1.501682, 1, 0, 0.2941177, 1,
1.651127, 0.8434216, 1.764071, 1, 0, 0.2862745, 1,
1.660578, 0.6980165, 1.021691, 1, 0, 0.282353, 1,
1.665118, 0.2581695, 1.148244, 1, 0, 0.2745098, 1,
1.674111, -0.2806809, 2.236746, 1, 0, 0.2705882, 1,
1.696619, -1.704291, 3.186384, 1, 0, 0.2627451, 1,
1.714477, 0.7033477, 1.988627, 1, 0, 0.2588235, 1,
1.717004, -0.06673764, -0.9548267, 1, 0, 0.2509804, 1,
1.718484, -1.371272, 2.761741, 1, 0, 0.2470588, 1,
1.7186, -0.8964866, 2.091971, 1, 0, 0.2392157, 1,
1.726005, -0.5447605, 2.632685, 1, 0, 0.2352941, 1,
1.733625, 1.147996, 1.662263, 1, 0, 0.227451, 1,
1.733756, 1.164225, 2.539853, 1, 0, 0.2235294, 1,
1.784525, -0.4497891, 1.597515, 1, 0, 0.2156863, 1,
1.786043, -0.7860044, 1.068695, 1, 0, 0.2117647, 1,
1.816141, 1.947041, 0.2502868, 1, 0, 0.2039216, 1,
1.835253, 1.176185, 2.522704, 1, 0, 0.1960784, 1,
1.861617, -1.667579, 3.438382, 1, 0, 0.1921569, 1,
1.898055, -2.379062, 1.854682, 1, 0, 0.1843137, 1,
1.905318, -0.2762625, 0.8918416, 1, 0, 0.1803922, 1,
1.930579, -0.6479797, 1.647207, 1, 0, 0.172549, 1,
1.972229, -2.174518, 2.466666, 1, 0, 0.1686275, 1,
1.981144, 0.2857322, 0.05044212, 1, 0, 0.1607843, 1,
1.995425, -1.561905, 1.617633, 1, 0, 0.1568628, 1,
2.005267, 0.4195664, 1.432904, 1, 0, 0.1490196, 1,
2.025367, -0.4605296, 1.504587, 1, 0, 0.145098, 1,
2.03619, 0.7437893, -0.01622949, 1, 0, 0.1372549, 1,
2.08259, -0.7956331, 1.169295, 1, 0, 0.1333333, 1,
2.085988, 0.7495092, 2.011745, 1, 0, 0.1254902, 1,
2.091868, -1.643349, 2.753515, 1, 0, 0.1215686, 1,
2.107064, 0.8178946, 1.694151, 1, 0, 0.1137255, 1,
2.127557, 0.2495997, 3.270665, 1, 0, 0.1098039, 1,
2.143834, -0.9660577, 1.730922, 1, 0, 0.1019608, 1,
2.146468, -0.7784224, 1.822319, 1, 0, 0.09411765, 1,
2.179839, 1.030993, 2.391796, 1, 0, 0.09019608, 1,
2.188497, 0.01818629, 2.363515, 1, 0, 0.08235294, 1,
2.213332, 0.8298576, 0.76985, 1, 0, 0.07843138, 1,
2.226671, -0.4559826, 0.9059642, 1, 0, 0.07058824, 1,
2.254179, 0.689614, -0.1727373, 1, 0, 0.06666667, 1,
2.258844, 0.9516416, 1.073254, 1, 0, 0.05882353, 1,
2.344101, 1.196465, -0.4223603, 1, 0, 0.05490196, 1,
2.360311, -0.4134727, 1.262727, 1, 0, 0.04705882, 1,
2.391132, -0.2010395, 3.239735, 1, 0, 0.04313726, 1,
2.561963, -1.390825, 1.089736, 1, 0, 0.03529412, 1,
2.601723, -0.4719802, 1.018666, 1, 0, 0.03137255, 1,
2.635452, 0.9139695, 1.040949, 1, 0, 0.02352941, 1,
2.703496, -0.7786667, 1.964743, 1, 0, 0.01960784, 1,
2.822503, 0.6934121, 1.574469, 1, 0, 0.01176471, 1,
2.912551, -0.1905795, 2.727882, 1, 0, 0.007843138, 1
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
-0.01564813, -4.097343, -7.714005, 0, -0.5, 0.5, 0.5,
-0.01564813, -4.097343, -7.714005, 1, -0.5, 0.5, 0.5,
-0.01564813, -4.097343, -7.714005, 1, 1.5, 0.5, 0.5,
-0.01564813, -4.097343, -7.714005, 0, 1.5, 0.5, 0.5
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
-3.936507, -0.001742601, -7.714005, 0, -0.5, 0.5, 0.5,
-3.936507, -0.001742601, -7.714005, 1, -0.5, 0.5, 0.5,
-3.936507, -0.001742601, -7.714005, 1, 1.5, 0.5, 0.5,
-3.936507, -0.001742601, -7.714005, 0, 1.5, 0.5, 0.5
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
-3.936507, -4.097343, -0.4555676, 0, -0.5, 0.5, 0.5,
-3.936507, -4.097343, -0.4555676, 1, -0.5, 0.5, 0.5,
-3.936507, -4.097343, -0.4555676, 1, 1.5, 0.5, 0.5,
-3.936507, -4.097343, -0.4555676, 0, 1.5, 0.5, 0.5
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
-2, -3.152205, -6.038981,
2, -3.152205, -6.038981,
-2, -3.152205, -6.038981,
-2, -3.309728, -6.318152,
-1, -3.152205, -6.038981,
-1, -3.309728, -6.318152,
0, -3.152205, -6.038981,
0, -3.309728, -6.318152,
1, -3.152205, -6.038981,
1, -3.309728, -6.318152,
2, -3.152205, -6.038981,
2, -3.309728, -6.318152
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
-2, -3.624774, -6.876493, 0, -0.5, 0.5, 0.5,
-2, -3.624774, -6.876493, 1, -0.5, 0.5, 0.5,
-2, -3.624774, -6.876493, 1, 1.5, 0.5, 0.5,
-2, -3.624774, -6.876493, 0, 1.5, 0.5, 0.5,
-1, -3.624774, -6.876493, 0, -0.5, 0.5, 0.5,
-1, -3.624774, -6.876493, 1, -0.5, 0.5, 0.5,
-1, -3.624774, -6.876493, 1, 1.5, 0.5, 0.5,
-1, -3.624774, -6.876493, 0, 1.5, 0.5, 0.5,
0, -3.624774, -6.876493, 0, -0.5, 0.5, 0.5,
0, -3.624774, -6.876493, 1, -0.5, 0.5, 0.5,
0, -3.624774, -6.876493, 1, 1.5, 0.5, 0.5,
0, -3.624774, -6.876493, 0, 1.5, 0.5, 0.5,
1, -3.624774, -6.876493, 0, -0.5, 0.5, 0.5,
1, -3.624774, -6.876493, 1, -0.5, 0.5, 0.5,
1, -3.624774, -6.876493, 1, 1.5, 0.5, 0.5,
1, -3.624774, -6.876493, 0, 1.5, 0.5, 0.5,
2, -3.624774, -6.876493, 0, -0.5, 0.5, 0.5,
2, -3.624774, -6.876493, 1, -0.5, 0.5, 0.5,
2, -3.624774, -6.876493, 1, 1.5, 0.5, 0.5,
2, -3.624774, -6.876493, 0, 1.5, 0.5, 0.5
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
-3.031693, -3, -6.038981,
-3.031693, 3, -6.038981,
-3.031693, -3, -6.038981,
-3.182495, -3, -6.318152,
-3.031693, -2, -6.038981,
-3.182495, -2, -6.318152,
-3.031693, -1, -6.038981,
-3.182495, -1, -6.318152,
-3.031693, 0, -6.038981,
-3.182495, 0, -6.318152,
-3.031693, 1, -6.038981,
-3.182495, 1, -6.318152,
-3.031693, 2, -6.038981,
-3.182495, 2, -6.318152,
-3.031693, 3, -6.038981,
-3.182495, 3, -6.318152
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
-3.4841, -3, -6.876493, 0, -0.5, 0.5, 0.5,
-3.4841, -3, -6.876493, 1, -0.5, 0.5, 0.5,
-3.4841, -3, -6.876493, 1, 1.5, 0.5, 0.5,
-3.4841, -3, -6.876493, 0, 1.5, 0.5, 0.5,
-3.4841, -2, -6.876493, 0, -0.5, 0.5, 0.5,
-3.4841, -2, -6.876493, 1, -0.5, 0.5, 0.5,
-3.4841, -2, -6.876493, 1, 1.5, 0.5, 0.5,
-3.4841, -2, -6.876493, 0, 1.5, 0.5, 0.5,
-3.4841, -1, -6.876493, 0, -0.5, 0.5, 0.5,
-3.4841, -1, -6.876493, 1, -0.5, 0.5, 0.5,
-3.4841, -1, -6.876493, 1, 1.5, 0.5, 0.5,
-3.4841, -1, -6.876493, 0, 1.5, 0.5, 0.5,
-3.4841, 0, -6.876493, 0, -0.5, 0.5, 0.5,
-3.4841, 0, -6.876493, 1, -0.5, 0.5, 0.5,
-3.4841, 0, -6.876493, 1, 1.5, 0.5, 0.5,
-3.4841, 0, -6.876493, 0, 1.5, 0.5, 0.5,
-3.4841, 1, -6.876493, 0, -0.5, 0.5, 0.5,
-3.4841, 1, -6.876493, 1, -0.5, 0.5, 0.5,
-3.4841, 1, -6.876493, 1, 1.5, 0.5, 0.5,
-3.4841, 1, -6.876493, 0, 1.5, 0.5, 0.5,
-3.4841, 2, -6.876493, 0, -0.5, 0.5, 0.5,
-3.4841, 2, -6.876493, 1, -0.5, 0.5, 0.5,
-3.4841, 2, -6.876493, 1, 1.5, 0.5, 0.5,
-3.4841, 2, -6.876493, 0, 1.5, 0.5, 0.5,
-3.4841, 3, -6.876493, 0, -0.5, 0.5, 0.5,
-3.4841, 3, -6.876493, 1, -0.5, 0.5, 0.5,
-3.4841, 3, -6.876493, 1, 1.5, 0.5, 0.5,
-3.4841, 3, -6.876493, 0, 1.5, 0.5, 0.5
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
-3.031693, -3.152205, -4,
-3.031693, -3.152205, 4,
-3.031693, -3.152205, -4,
-3.182495, -3.309728, -4,
-3.031693, -3.152205, -2,
-3.182495, -3.309728, -2,
-3.031693, -3.152205, 0,
-3.182495, -3.309728, 0,
-3.031693, -3.152205, 2,
-3.182495, -3.309728, 2,
-3.031693, -3.152205, 4,
-3.182495, -3.309728, 4
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
-3.4841, -3.624774, -4, 0, -0.5, 0.5, 0.5,
-3.4841, -3.624774, -4, 1, -0.5, 0.5, 0.5,
-3.4841, -3.624774, -4, 1, 1.5, 0.5, 0.5,
-3.4841, -3.624774, -4, 0, 1.5, 0.5, 0.5,
-3.4841, -3.624774, -2, 0, -0.5, 0.5, 0.5,
-3.4841, -3.624774, -2, 1, -0.5, 0.5, 0.5,
-3.4841, -3.624774, -2, 1, 1.5, 0.5, 0.5,
-3.4841, -3.624774, -2, 0, 1.5, 0.5, 0.5,
-3.4841, -3.624774, 0, 0, -0.5, 0.5, 0.5,
-3.4841, -3.624774, 0, 1, -0.5, 0.5, 0.5,
-3.4841, -3.624774, 0, 1, 1.5, 0.5, 0.5,
-3.4841, -3.624774, 0, 0, 1.5, 0.5, 0.5,
-3.4841, -3.624774, 2, 0, -0.5, 0.5, 0.5,
-3.4841, -3.624774, 2, 1, -0.5, 0.5, 0.5,
-3.4841, -3.624774, 2, 1, 1.5, 0.5, 0.5,
-3.4841, -3.624774, 2, 0, 1.5, 0.5, 0.5,
-3.4841, -3.624774, 4, 0, -0.5, 0.5, 0.5,
-3.4841, -3.624774, 4, 1, -0.5, 0.5, 0.5,
-3.4841, -3.624774, 4, 1, 1.5, 0.5, 0.5,
-3.4841, -3.624774, 4, 0, 1.5, 0.5, 0.5
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
-3.031693, -3.152205, -6.038981,
-3.031693, 3.14872, -6.038981,
-3.031693, -3.152205, 5.127846,
-3.031693, 3.14872, 5.127846,
-3.031693, -3.152205, -6.038981,
-3.031693, -3.152205, 5.127846,
-3.031693, 3.14872, -6.038981,
-3.031693, 3.14872, 5.127846,
-3.031693, -3.152205, -6.038981,
3.000397, -3.152205, -6.038981,
-3.031693, -3.152205, 5.127846,
3.000397, -3.152205, 5.127846,
-3.031693, 3.14872, -6.038981,
3.000397, 3.14872, -6.038981,
-3.031693, 3.14872, 5.127846,
3.000397, 3.14872, 5.127846,
3.000397, -3.152205, -6.038981,
3.000397, 3.14872, -6.038981,
3.000397, -3.152205, 5.127846,
3.000397, 3.14872, 5.127846,
3.000397, -3.152205, -6.038981,
3.000397, -3.152205, 5.127846,
3.000397, 3.14872, -6.038981,
3.000397, 3.14872, 5.127846
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
var radius = 7.566446;
var distance = 33.66397;
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
mvMatrix.translate( 0.01564813, 0.001742601, 0.4555676 );
mvMatrix.scale( 1.356245, 1.298379, 0.7326154 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.66397);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Oryzalin<-read.table("Oryzalin.xyz")
```

```
## Error in read.table("Oryzalin.xyz"): no lines available in input
```

```r
x<-Oryzalin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Oryzalin' not found
```

```r
y<-Oryzalin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Oryzalin' not found
```

```r
z<-Oryzalin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Oryzalin' not found
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
-2.943847, -0.5911755, 0.3239342, 0, 0, 1, 1, 1,
-2.921479, -0.734638, -1.591701, 1, 0, 0, 1, 1,
-2.768269, -0.06905588, -1.641591, 1, 0, 0, 1, 1,
-2.476809, -0.2534048, -0.2578321, 1, 0, 0, 1, 1,
-2.433214, -0.7601647, -3.060459, 1, 0, 0, 1, 1,
-2.40641, 0.07085015, -3.411217, 1, 0, 0, 1, 1,
-2.34259, 0.5405511, -1.189548, 0, 0, 0, 1, 1,
-2.287052, -0.3625794, -1.287462, 0, 0, 0, 1, 1,
-2.283416, -0.3205057, -3.154171, 0, 0, 0, 1, 1,
-2.268477, -1.511603, -0.8415634, 0, 0, 0, 1, 1,
-2.260003, -0.08962042, -2.078824, 0, 0, 0, 1, 1,
-2.20127, 0.711046, -2.290577, 0, 0, 0, 1, 1,
-2.18711, 0.2662216, -1.680598, 0, 0, 0, 1, 1,
-2.186547, 0.5866832, -1.450197, 1, 1, 1, 1, 1,
-2.182575, -1.093765, -2.330346, 1, 1, 1, 1, 1,
-2.174553, 0.08613662, -2.161072, 1, 1, 1, 1, 1,
-2.124457, 0.4259115, -1.027306, 1, 1, 1, 1, 1,
-2.109114, 0.8855561, -1.474868, 1, 1, 1, 1, 1,
-2.061338, -0.9641873, -2.7069, 1, 1, 1, 1, 1,
-2.011822, -0.1240921, -1.029581, 1, 1, 1, 1, 1,
-2.008081, 0.624608, -3.740925, 1, 1, 1, 1, 1,
-2.001159, -1.377162, -2.283483, 1, 1, 1, 1, 1,
-1.992953, 1.368417, -1.701988, 1, 1, 1, 1, 1,
-1.974407, 0.7210795, -2.50558, 1, 1, 1, 1, 1,
-1.965551, 1.26881, -2.442354, 1, 1, 1, 1, 1,
-1.932939, -1.185245, -1.778904, 1, 1, 1, 1, 1,
-1.906603, 0.006355465, -1.939227, 1, 1, 1, 1, 1,
-1.898854, 2.171932, 0.6721411, 1, 1, 1, 1, 1,
-1.874984, -0.1562186, -2.630107, 0, 0, 1, 1, 1,
-1.847966, 0.9683499, -1.361245, 1, 0, 0, 1, 1,
-1.807531, 1.095234, 0.02126213, 1, 0, 0, 1, 1,
-1.806228, 1.794782, -1.39903, 1, 0, 0, 1, 1,
-1.799164, 0.9178455, -0.7151407, 1, 0, 0, 1, 1,
-1.795428, 0.06559731, -2.602237, 1, 0, 0, 1, 1,
-1.776781, 1.247007, -0.8474756, 0, 0, 0, 1, 1,
-1.774185, 0.7586861, -0.1490509, 0, 0, 0, 1, 1,
-1.7732, -0.1393103, -1.988344, 0, 0, 0, 1, 1,
-1.765168, 0.587136, -1.642232, 0, 0, 0, 1, 1,
-1.758849, -0.3642085, -1.656325, 0, 0, 0, 1, 1,
-1.755673, 0.8120603, -1.69855, 0, 0, 0, 1, 1,
-1.744676, 0.1558344, -1.052769, 0, 0, 0, 1, 1,
-1.737632, -0.01825797, -1.366787, 1, 1, 1, 1, 1,
-1.733613, 0.9906448, -1.128811, 1, 1, 1, 1, 1,
-1.708282, -0.09394922, -0.5536028, 1, 1, 1, 1, 1,
-1.706285, 0.639747, 0.09515807, 1, 1, 1, 1, 1,
-1.696866, 0.5930326, -1.317013, 1, 1, 1, 1, 1,
-1.695897, -0.3873124, -0.9652985, 1, 1, 1, 1, 1,
-1.687776, 0.7341444, -1.724333, 1, 1, 1, 1, 1,
-1.651885, -1.191539, -2.426094, 1, 1, 1, 1, 1,
-1.651272, -1.059847, -2.544806, 1, 1, 1, 1, 1,
-1.639464, 1.235585, -1.952377, 1, 1, 1, 1, 1,
-1.636735, -0.9436464, -3.246346, 1, 1, 1, 1, 1,
-1.625889, 1.124236, -0.9031241, 1, 1, 1, 1, 1,
-1.618274, -0.3408715, -1.46345, 1, 1, 1, 1, 1,
-1.612692, 0.08172861, -2.499278, 1, 1, 1, 1, 1,
-1.605513, -0.5932745, -2.134429, 1, 1, 1, 1, 1,
-1.59043, -0.2111505, -1.556206, 0, 0, 1, 1, 1,
-1.587776, -0.007822169, -0.5254714, 1, 0, 0, 1, 1,
-1.554702, 0.1046946, -2.294132, 1, 0, 0, 1, 1,
-1.534469, 0.2901203, -0.3304377, 1, 0, 0, 1, 1,
-1.526022, 1.182902, -0.1791261, 1, 0, 0, 1, 1,
-1.518183, -0.3753091, -1.51374, 1, 0, 0, 1, 1,
-1.504505, -0.08670123, -3.171394, 0, 0, 0, 1, 1,
-1.493493, -0.09060255, -2.499961, 0, 0, 0, 1, 1,
-1.488125, -0.485261, -0.5299708, 0, 0, 0, 1, 1,
-1.477225, 0.3120683, -1.50271, 0, 0, 0, 1, 1,
-1.476688, 1.298113, -1.757782, 0, 0, 0, 1, 1,
-1.469293, 0.6601521, -0.7830982, 0, 0, 0, 1, 1,
-1.462911, -0.4681679, -1.746398, 0, 0, 0, 1, 1,
-1.456132, 0.8353454, -0.9512526, 1, 1, 1, 1, 1,
-1.455461, -1.817536, -2.198359, 1, 1, 1, 1, 1,
-1.446936, -1.585381, -2.233903, 1, 1, 1, 1, 1,
-1.441834, 0.04396559, -2.008191, 1, 1, 1, 1, 1,
-1.425344, 0.5562902, -0.09057099, 1, 1, 1, 1, 1,
-1.423961, 0.08826519, -0.4609737, 1, 1, 1, 1, 1,
-1.418326, 1.29302, -0.8363805, 1, 1, 1, 1, 1,
-1.415905, 0.2961655, -2.039351, 1, 1, 1, 1, 1,
-1.412049, 0.1345829, -1.533402, 1, 1, 1, 1, 1,
-1.405709, 0.1588123, -3.467075, 1, 1, 1, 1, 1,
-1.401642, 0.665094, -1.03022, 1, 1, 1, 1, 1,
-1.390081, 0.07116733, -1.078753, 1, 1, 1, 1, 1,
-1.388018, 0.1117575, -0.1649332, 1, 1, 1, 1, 1,
-1.384986, -0.5424035, -3.104934, 1, 1, 1, 1, 1,
-1.383114, 0.7675421, -0.1719285, 1, 1, 1, 1, 1,
-1.378178, -0.946826, -3.680081, 0, 0, 1, 1, 1,
-1.351641, -0.3470542, -3.277292, 1, 0, 0, 1, 1,
-1.351157, 1.177521, -1.019971, 1, 0, 0, 1, 1,
-1.347948, 1.353812, 0.5759361, 1, 0, 0, 1, 1,
-1.334028, -0.9762425, -4.061283, 1, 0, 0, 1, 1,
-1.330353, -0.03590304, -0.9174122, 1, 0, 0, 1, 1,
-1.329255, -2.056633, -2.458264, 0, 0, 0, 1, 1,
-1.313508, -0.1242276, -1.662029, 0, 0, 0, 1, 1,
-1.313281, 0.4356749, -1.250807, 0, 0, 0, 1, 1,
-1.309747, 0.6340802, 0.3188239, 0, 0, 0, 1, 1,
-1.309194, -0.07750268, -1.343031, 0, 0, 0, 1, 1,
-1.308128, 0.02050907, -1.81435, 0, 0, 0, 1, 1,
-1.304105, 0.3986998, -3.205164, 0, 0, 0, 1, 1,
-1.291919, 0.4943651, -0.2260611, 1, 1, 1, 1, 1,
-1.290084, -0.6844723, -0.7165459, 1, 1, 1, 1, 1,
-1.280874, 1.682827, -0.2371476, 1, 1, 1, 1, 1,
-1.280823, 0.4230301, -1.121658, 1, 1, 1, 1, 1,
-1.275134, 1.62068, -1.582406, 1, 1, 1, 1, 1,
-1.263489, -0.3049717, -1.136024, 1, 1, 1, 1, 1,
-1.261848, 0.6448023, -2.443499, 1, 1, 1, 1, 1,
-1.259735, -0.06630095, -2.397323, 1, 1, 1, 1, 1,
-1.251515, -1.601387, -1.455792, 1, 1, 1, 1, 1,
-1.250996, 0.5157639, -1.353497, 1, 1, 1, 1, 1,
-1.250982, 0.9308587, -0.5987563, 1, 1, 1, 1, 1,
-1.248855, 0.08036079, -0.8649061, 1, 1, 1, 1, 1,
-1.247364, 0.5007247, -2.30661, 1, 1, 1, 1, 1,
-1.246311, 0.4916054, -2.776097, 1, 1, 1, 1, 1,
-1.243031, 0.2020083, -1.719462, 1, 1, 1, 1, 1,
-1.242615, -1.318646, -2.891146, 0, 0, 1, 1, 1,
-1.237641, -1.006589, -2.554027, 1, 0, 0, 1, 1,
-1.22953, -0.1077001, -1.954034, 1, 0, 0, 1, 1,
-1.228432, 0.6390162, -1.148995, 1, 0, 0, 1, 1,
-1.223754, 1.781924, -0.26965, 1, 0, 0, 1, 1,
-1.218734, 0.4996906, -2.104595, 1, 0, 0, 1, 1,
-1.2105, 0.8833642, -0.2981843, 0, 0, 0, 1, 1,
-1.20383, 0.1867717, 0.679851, 0, 0, 0, 1, 1,
-1.202207, 0.7640942, -2.184857, 0, 0, 0, 1, 1,
-1.193957, -0.2926284, -1.377857, 0, 0, 0, 1, 1,
-1.189768, 1.561441, 0.7959396, 0, 0, 0, 1, 1,
-1.186302, 0.8748781, -1.004832, 0, 0, 0, 1, 1,
-1.184968, 2.274836, -1.139358, 0, 0, 0, 1, 1,
-1.181423, -0.8003167, -2.151068, 1, 1, 1, 1, 1,
-1.181295, 0.1429488, -1.23779, 1, 1, 1, 1, 1,
-1.178593, 0.6961355, -1.198583, 1, 1, 1, 1, 1,
-1.177907, 0.2214216, -1.800545, 1, 1, 1, 1, 1,
-1.177819, 0.2304207, -0.6169699, 1, 1, 1, 1, 1,
-1.174985, -0.8278919, -1.237559, 1, 1, 1, 1, 1,
-1.168654, -1.237167, -3.748803, 1, 1, 1, 1, 1,
-1.152436, 1.007557, -0.8827231, 1, 1, 1, 1, 1,
-1.141663, -0.5702574, -2.810899, 1, 1, 1, 1, 1,
-1.140509, -1.009175, -3.063113, 1, 1, 1, 1, 1,
-1.135545, -0.4681256, -2.818946, 1, 1, 1, 1, 1,
-1.132855, -0.1985081, -0.5795079, 1, 1, 1, 1, 1,
-1.13241, -1.780389, -3.51617, 1, 1, 1, 1, 1,
-1.130298, 0.9083437, 0.1944719, 1, 1, 1, 1, 1,
-1.129731, 0.7567886, 0.3087261, 1, 1, 1, 1, 1,
-1.126579, 1.524633, -1.096417, 0, 0, 1, 1, 1,
-1.125987, -0.4824789, -3.090079, 1, 0, 0, 1, 1,
-1.124539, 0.1170225, -0.37958, 1, 0, 0, 1, 1,
-1.124321, -0.1109213, -1.955044, 1, 0, 0, 1, 1,
-1.118951, 1.548981, -1.33508, 1, 0, 0, 1, 1,
-1.112669, 0.7100828, -1.044375, 1, 0, 0, 1, 1,
-1.108396, 0.9553407, -0.5718651, 0, 0, 0, 1, 1,
-1.09981, -0.3845029, -2.075155, 0, 0, 0, 1, 1,
-1.086117, 0.5548275, -1.761343, 0, 0, 0, 1, 1,
-1.083063, -1.699304, -3.87501, 0, 0, 0, 1, 1,
-1.082922, 0.974419, -0.8675714, 0, 0, 0, 1, 1,
-1.080847, 0.3913103, -1.379143, 0, 0, 0, 1, 1,
-1.075622, -0.5942428, -2.025184, 0, 0, 0, 1, 1,
-1.073727, 0.1398483, -2.08301, 1, 1, 1, 1, 1,
-1.071754, 0.9686949, -1.238148, 1, 1, 1, 1, 1,
-1.06262, -0.7622818, -1.052283, 1, 1, 1, 1, 1,
-1.059368, -0.05247112, -1.545684, 1, 1, 1, 1, 1,
-1.059031, 0.3831937, -3.805408, 1, 1, 1, 1, 1,
-1.057131, -0.4503168, -2.266632, 1, 1, 1, 1, 1,
-1.056222, 0.6637435, -1.429382, 1, 1, 1, 1, 1,
-1.051999, 1.850533, 0.1126224, 1, 1, 1, 1, 1,
-1.051852, 0.2398708, -2.73763, 1, 1, 1, 1, 1,
-1.050048, -1.19894, -3.949329, 1, 1, 1, 1, 1,
-1.041591, 0.4274523, -1.366361, 1, 1, 1, 1, 1,
-1.041513, -0.1979588, -3.309346, 1, 1, 1, 1, 1,
-1.036054, 2.029611, -0.2881709, 1, 1, 1, 1, 1,
-1.030345, 1.559398, -0.2637602, 1, 1, 1, 1, 1,
-1.012982, 0.611747, 0.4973286, 1, 1, 1, 1, 1,
-1.008586, 1.491537, 1.310719, 0, 0, 1, 1, 1,
-1.006543, 0.3343189, -2.815498, 1, 0, 0, 1, 1,
-1.003849, 0.767319, -0.0274327, 1, 0, 0, 1, 1,
-1.001458, -1.075966, -1.919557, 1, 0, 0, 1, 1,
-0.9959445, 1.668183, -1.086259, 1, 0, 0, 1, 1,
-0.9904477, 0.9687852, 0.1948271, 1, 0, 0, 1, 1,
-0.9893659, 0.007818332, -2.736799, 0, 0, 0, 1, 1,
-0.9877697, 1.740522, -1.29072, 0, 0, 0, 1, 1,
-0.9875634, -1.086943, -3.428224, 0, 0, 0, 1, 1,
-0.9815412, -0.3567082, -2.399585, 0, 0, 0, 1, 1,
-0.9749992, -0.8642613, -1.047124, 0, 0, 0, 1, 1,
-0.9588961, -0.9311257, -1.483419, 0, 0, 0, 1, 1,
-0.9555689, -0.7805939, -0.9030926, 0, 0, 0, 1, 1,
-0.9466643, 1.115029, -1.11657, 1, 1, 1, 1, 1,
-0.9330513, 0.6798248, -1.250446, 1, 1, 1, 1, 1,
-0.9308633, 0.5829092, -0.3953465, 1, 1, 1, 1, 1,
-0.9295126, -1.990148, -3.161343, 1, 1, 1, 1, 1,
-0.9281471, 1.89384, -0.5368456, 1, 1, 1, 1, 1,
-0.9258974, 1.692538, -0.1057001, 1, 1, 1, 1, 1,
-0.9251406, 0.1365612, -1.780307, 1, 1, 1, 1, 1,
-0.92473, -0.2110349, -1.249715, 1, 1, 1, 1, 1,
-0.9154826, 1.064763, -1.220186, 1, 1, 1, 1, 1,
-0.9073485, -0.8881226, -3.0483, 1, 1, 1, 1, 1,
-0.9067845, 0.1023923, -0.4435352, 1, 1, 1, 1, 1,
-0.905269, -0.9771468, -2.085369, 1, 1, 1, 1, 1,
-0.8807796, 1.337881, -0.3212792, 1, 1, 1, 1, 1,
-0.8790243, -0.8620116, -2.648701, 1, 1, 1, 1, 1,
-0.8712451, 0.4932747, -3.272515, 1, 1, 1, 1, 1,
-0.8709663, -0.3217326, -1.777219, 0, 0, 1, 1, 1,
-0.8648093, -2.4107, -3.19259, 1, 0, 0, 1, 1,
-0.8548219, 0.07067864, -1.691154, 1, 0, 0, 1, 1,
-0.853522, -0.1575168, -3.242054, 1, 0, 0, 1, 1,
-0.8496599, 0.9712111, -1.10648, 1, 0, 0, 1, 1,
-0.8422337, 0.7606161, -2.739254, 1, 0, 0, 1, 1,
-0.8408831, 0.6323239, -1.075915, 0, 0, 0, 1, 1,
-0.8385342, -0.3912448, -2.803464, 0, 0, 0, 1, 1,
-0.8382998, -1.080196, -2.275218, 0, 0, 0, 1, 1,
-0.8314089, -0.38827, -2.28975, 0, 0, 0, 1, 1,
-0.8304853, -0.238441, -2.818189, 0, 0, 0, 1, 1,
-0.8286211, 0.1619511, -0.2451372, 0, 0, 0, 1, 1,
-0.8208277, 0.5301546, -0.782032, 0, 0, 0, 1, 1,
-0.8191949, 0.1309341, -3.17029, 1, 1, 1, 1, 1,
-0.8188288, -0.8295662, -1.093705, 1, 1, 1, 1, 1,
-0.8178613, 0.1104271, -0.8723627, 1, 1, 1, 1, 1,
-0.8160804, -0.715721, -1.474426, 1, 1, 1, 1, 1,
-0.8091623, -0.6542726, -2.904588, 1, 1, 1, 1, 1,
-0.8065649, 1.473147, -0.4207982, 1, 1, 1, 1, 1,
-0.8057494, -2.356421, -3.561014, 1, 1, 1, 1, 1,
-0.8010823, -0.6672915, -2.242087, 1, 1, 1, 1, 1,
-0.799225, -0.8113761, -1.75558, 1, 1, 1, 1, 1,
-0.7983484, -0.65026, -2.82281, 1, 1, 1, 1, 1,
-0.7936932, 0.1556975, 0.6051863, 1, 1, 1, 1, 1,
-0.7932611, -0.2383898, -3.290894, 1, 1, 1, 1, 1,
-0.7898898, -1.726304, -0.3938897, 1, 1, 1, 1, 1,
-0.7851641, -1.330072, -3.361274, 1, 1, 1, 1, 1,
-0.7838458, -1.382717, -0.7809783, 1, 1, 1, 1, 1,
-0.7789379, 0.7296527, -0.09894992, 0, 0, 1, 1, 1,
-0.7710826, -0.9399799, -3.885321, 1, 0, 0, 1, 1,
-0.7700832, -0.545514, -2.012992, 1, 0, 0, 1, 1,
-0.7700117, 0.05897485, -0.3643781, 1, 0, 0, 1, 1,
-0.7676941, 0.4442509, 0.0573148, 1, 0, 0, 1, 1,
-0.7587891, -0.5059285, -2.516918, 1, 0, 0, 1, 1,
-0.7438807, -1.985169, -3.901622, 0, 0, 0, 1, 1,
-0.7432501, 0.1292164, -1.767967, 0, 0, 0, 1, 1,
-0.7365321, -0.5179602, -0.8236461, 0, 0, 0, 1, 1,
-0.7348168, -0.9941515, -1.798924, 0, 0, 0, 1, 1,
-0.734495, 0.256759, -0.02360071, 0, 0, 0, 1, 1,
-0.7280083, -0.5318611, -2.679196, 0, 0, 0, 1, 1,
-0.7262058, 0.7132864, -2.18702, 0, 0, 0, 1, 1,
-0.7255114, 0.8051949, 1.068305, 1, 1, 1, 1, 1,
-0.718941, 0.9429783, -0.2726919, 1, 1, 1, 1, 1,
-0.7182877, -0.6441082, -0.7787305, 1, 1, 1, 1, 1,
-0.711606, -0.9166766, -2.270379, 1, 1, 1, 1, 1,
-0.711024, 0.6555442, -1.204904, 1, 1, 1, 1, 1,
-0.7027376, -1.150235, -2.978969, 1, 1, 1, 1, 1,
-0.6985757, -0.08249956, -0.4339229, 1, 1, 1, 1, 1,
-0.6974975, 0.6992707, 0.5582902, 1, 1, 1, 1, 1,
-0.696362, 0.8026656, 1.113819, 1, 1, 1, 1, 1,
-0.6921241, -0.2948188, -3.1561, 1, 1, 1, 1, 1,
-0.6884884, 0.5698711, 0.6747234, 1, 1, 1, 1, 1,
-0.6793988, 0.4645452, -2.41778, 1, 1, 1, 1, 1,
-0.6777625, 0.9052745, -1.197744, 1, 1, 1, 1, 1,
-0.6753713, 0.4015113, -0.7891046, 1, 1, 1, 1, 1,
-0.6742067, 0.03637409, -1.325296, 1, 1, 1, 1, 1,
-0.6665365, -0.06635121, -3.724941, 0, 0, 1, 1, 1,
-0.6603565, 0.2345633, 1.064376, 1, 0, 0, 1, 1,
-0.6596294, 0.7560914, -2.520954, 1, 0, 0, 1, 1,
-0.6516513, -1.304031, -3.753796, 1, 0, 0, 1, 1,
-0.6431676, -0.3267125, -2.278894, 1, 0, 0, 1, 1,
-0.6417413, -0.5312669, -1.226335, 1, 0, 0, 1, 1,
-0.6404887, -1.953356, -3.441492, 0, 0, 0, 1, 1,
-0.640259, -0.07799044, -1.648232, 0, 0, 0, 1, 1,
-0.6368902, 0.09216808, -0.2627483, 0, 0, 0, 1, 1,
-0.6311854, 0.4872265, -0.9276688, 0, 0, 0, 1, 1,
-0.6259153, -0.7716129, -2.6232, 0, 0, 0, 1, 1,
-0.6250022, -0.4290049, -0.3642732, 0, 0, 0, 1, 1,
-0.6240919, -1.582295, -3.753374, 0, 0, 0, 1, 1,
-0.623108, 0.2962221, -1.99274, 1, 1, 1, 1, 1,
-0.6200812, 0.7459443, 0.7137153, 1, 1, 1, 1, 1,
-0.619706, -0.4173651, -0.7318523, 1, 1, 1, 1, 1,
-0.6179243, -0.2022934, -2.969163, 1, 1, 1, 1, 1,
-0.6154552, 0.5809972, -1.990126, 1, 1, 1, 1, 1,
-0.6128206, -0.571379, -1.194605, 1, 1, 1, 1, 1,
-0.6117348, -0.341971, -4.016404, 1, 1, 1, 1, 1,
-0.6087688, -0.3404932, -3.174012, 1, 1, 1, 1, 1,
-0.6077023, 0.5892529, -0.6735288, 1, 1, 1, 1, 1,
-0.6067771, -0.261007, -2.358283, 1, 1, 1, 1, 1,
-0.6023123, 0.8243562, -2.058331, 1, 1, 1, 1, 1,
-0.5999808, 0.5930052, 0.2013693, 1, 1, 1, 1, 1,
-0.5979725, 0.6915348, 0.6773852, 1, 1, 1, 1, 1,
-0.5962573, 0.5392051, -1.507223, 1, 1, 1, 1, 1,
-0.591364, 1.410896, 0.02179551, 1, 1, 1, 1, 1,
-0.5897822, -2.27178, -1.768417, 0, 0, 1, 1, 1,
-0.5887099, -1.098181, -3.56517, 1, 0, 0, 1, 1,
-0.5873708, 0.6114661, -0.03827788, 1, 0, 0, 1, 1,
-0.5871481, 1.126812, 0.2939762, 1, 0, 0, 1, 1,
-0.5852469, 0.7009702, -1.110885, 1, 0, 0, 1, 1,
-0.5824109, -2.084984, -4.345916, 1, 0, 0, 1, 1,
-0.5821509, -2.391106, -1.889636, 0, 0, 0, 1, 1,
-0.5805016, -1.521284, -2.684188, 0, 0, 0, 1, 1,
-0.5802805, 0.07402014, -1.162463, 0, 0, 0, 1, 1,
-0.5788656, -0.7651758, -2.524236, 0, 0, 0, 1, 1,
-0.5766034, -1.81367, -3.908426, 0, 0, 0, 1, 1,
-0.5755429, -2.103619, -3.434361, 0, 0, 0, 1, 1,
-0.5740387, 1.967264, -0.6442617, 0, 0, 0, 1, 1,
-0.5629873, -0.9945145, -2.026202, 1, 1, 1, 1, 1,
-0.5562978, -0.1866141, -3.695219, 1, 1, 1, 1, 1,
-0.5523145, 0.4995368, -0.6830191, 1, 1, 1, 1, 1,
-0.5515726, -2.916245, -0.7682466, 1, 1, 1, 1, 1,
-0.5513961, -1.696352, -2.371902, 1, 1, 1, 1, 1,
-0.5512697, 1.453754, -2.268447, 1, 1, 1, 1, 1,
-0.5478241, 0.8251767, -0.8188877, 1, 1, 1, 1, 1,
-0.5437791, -1.636243, -1.540369, 1, 1, 1, 1, 1,
-0.53711, -0.4642569, -1.901754, 1, 1, 1, 1, 1,
-0.5342352, 0.4349863, -1.308154, 1, 1, 1, 1, 1,
-0.5329335, -2.203984, -3.690986, 1, 1, 1, 1, 1,
-0.5325911, -0.2149016, -2.139287, 1, 1, 1, 1, 1,
-0.5317891, 0.4278641, -0.6194125, 1, 1, 1, 1, 1,
-0.5316492, 0.4913982, -1.075573, 1, 1, 1, 1, 1,
-0.5280784, 0.3448426, -0.6911095, 1, 1, 1, 1, 1,
-0.5263119, 0.9706566, -0.1897542, 0, 0, 1, 1, 1,
-0.525386, -0.9138948, -2.917945, 1, 0, 0, 1, 1,
-0.5210856, -0.08632313, -1.986151, 1, 0, 0, 1, 1,
-0.5198541, -0.405046, -2.140477, 1, 0, 0, 1, 1,
-0.513835, -0.4636134, -1.407477, 1, 0, 0, 1, 1,
-0.5135016, -0.1820913, -2.29954, 1, 0, 0, 1, 1,
-0.507958, -1.947447, -3.263294, 0, 0, 0, 1, 1,
-0.5039009, 0.842239, -0.7779444, 0, 0, 0, 1, 1,
-0.5030336, 0.2297862, -1.097303, 0, 0, 0, 1, 1,
-0.4997209, 0.1280701, -1.396888, 0, 0, 0, 1, 1,
-0.4970631, 0.3504084, -0.6720281, 0, 0, 0, 1, 1,
-0.4943648, -0.8405069, -3.748734, 0, 0, 0, 1, 1,
-0.4889214, -0.9912202, -0.8970165, 0, 0, 0, 1, 1,
-0.4860678, 0.9952247, -1.018587, 1, 1, 1, 1, 1,
-0.4844726, 0.2034866, 0.2858866, 1, 1, 1, 1, 1,
-0.4750987, 0.4056949, 0.03613941, 1, 1, 1, 1, 1,
-0.4733169, -0.9644544, -3.930161, 1, 1, 1, 1, 1,
-0.4703061, 0.4024343, -0.03669607, 1, 1, 1, 1, 1,
-0.4674481, -1.447698, -1.739116, 1, 1, 1, 1, 1,
-0.4666627, 0.8932949, 0.7900949, 1, 1, 1, 1, 1,
-0.4664678, 1.08307, -2.296005, 1, 1, 1, 1, 1,
-0.4647094, -1.117305, -2.688578, 1, 1, 1, 1, 1,
-0.4557268, 1.698195, -0.4844008, 1, 1, 1, 1, 1,
-0.4511422, -1.59709, -2.762377, 1, 1, 1, 1, 1,
-0.4486341, 0.764373, -2.184628, 1, 1, 1, 1, 1,
-0.4485682, -0.7433209, -2.883913, 1, 1, 1, 1, 1,
-0.4390311, -2.111283, -1.575394, 1, 1, 1, 1, 1,
-0.433988, 0.6515836, 0.5872981, 1, 1, 1, 1, 1,
-0.4226233, -0.2994567, -2.287894, 0, 0, 1, 1, 1,
-0.4198662, 0.8339015, -0.08747256, 1, 0, 0, 1, 1,
-0.4174503, -0.7862881, -0.3689995, 1, 0, 0, 1, 1,
-0.4157105, 0.05021755, 0.3533577, 1, 0, 0, 1, 1,
-0.4149973, -1.218543, -2.115857, 1, 0, 0, 1, 1,
-0.4140166, 0.1490896, -0.132934, 1, 0, 0, 1, 1,
-0.411917, -0.607163, -2.417666, 0, 0, 0, 1, 1,
-0.4117962, -0.7794381, -2.132675, 0, 0, 0, 1, 1,
-0.4109964, -0.6687139, -2.013643, 0, 0, 0, 1, 1,
-0.4104286, -0.7343336, -2.754748, 0, 0, 0, 1, 1,
-0.4100145, 0.6268139, -1.033389, 0, 0, 0, 1, 1,
-0.4072573, 0.8568898, 0.7728307, 0, 0, 0, 1, 1,
-0.4071954, -0.1095303, -2.236272, 0, 0, 0, 1, 1,
-0.4067361, 1.002534, -0.09466456, 1, 1, 1, 1, 1,
-0.4058363, -1.164282, -3.869563, 1, 1, 1, 1, 1,
-0.4024069, -1.376839, -3.514719, 1, 1, 1, 1, 1,
-0.3996162, -1.057021, -3.177465, 1, 1, 1, 1, 1,
-0.3981856, 1.362281, -0.2364643, 1, 1, 1, 1, 1,
-0.3894635, 2.14453, 0.3671978, 1, 1, 1, 1, 1,
-0.3860962, -0.7170133, -3.524654, 1, 1, 1, 1, 1,
-0.3853728, -1.031346, -1.875608, 1, 1, 1, 1, 1,
-0.3842467, 1.44801, -0.4359726, 1, 1, 1, 1, 1,
-0.3805788, 0.9283833, 0.01525685, 1, 1, 1, 1, 1,
-0.3800243, -1.498984, -3.243537, 1, 1, 1, 1, 1,
-0.3793816, 0.2767681, -1.668411, 1, 1, 1, 1, 1,
-0.3788218, -2.404484, -1.525745, 1, 1, 1, 1, 1,
-0.3782234, 1.000411, -0.3051303, 1, 1, 1, 1, 1,
-0.3666745, 1.193551, 0.1633573, 1, 1, 1, 1, 1,
-0.3660861, 0.2766908, -0.4216505, 0, 0, 1, 1, 1,
-0.3646133, 0.4402412, -0.3400405, 1, 0, 0, 1, 1,
-0.3643094, -1.02713, -2.801191, 1, 0, 0, 1, 1,
-0.360565, 0.5376404, 0.379251, 1, 0, 0, 1, 1,
-0.3597479, 1.486095, 2.817236, 1, 0, 0, 1, 1,
-0.3515803, 0.4526805, -0.5232283, 1, 0, 0, 1, 1,
-0.3435979, 0.7405726, -0.3009914, 0, 0, 0, 1, 1,
-0.3428774, 0.330513, 0.4487776, 0, 0, 0, 1, 1,
-0.3401965, -0.1009321, -0.1562149, 0, 0, 0, 1, 1,
-0.3399212, 1.754536, 0.09691164, 0, 0, 0, 1, 1,
-0.337749, 0.1100128, -1.834876, 0, 0, 0, 1, 1,
-0.3365106, -0.4018048, -3.488954, 0, 0, 0, 1, 1,
-0.3324802, 2.031492, -1.084599, 0, 0, 0, 1, 1,
-0.3322159, -0.74643, -2.737155, 1, 1, 1, 1, 1,
-0.3289286, 0.5924627, -2.410667, 1, 1, 1, 1, 1,
-0.3287322, 1.854357, -1.123352, 1, 1, 1, 1, 1,
-0.3281686, -0.4375004, -3.381252, 1, 1, 1, 1, 1,
-0.3260889, -0.3557568, -2.085608, 1, 1, 1, 1, 1,
-0.3258678, -0.1318184, -3.549865, 1, 1, 1, 1, 1,
-0.3258174, 0.02931613, -1.311732, 1, 1, 1, 1, 1,
-0.3232428, -0.5555693, -3.953765, 1, 1, 1, 1, 1,
-0.3053479, 0.4874053, -1.200659, 1, 1, 1, 1, 1,
-0.3018134, -1.373824, -4.286348, 1, 1, 1, 1, 1,
-0.2993034, 1.636865, 1.44815, 1, 1, 1, 1, 1,
-0.29553, -0.5312682, -2.351351, 1, 1, 1, 1, 1,
-0.28995, -0.8072858, -1.657432, 1, 1, 1, 1, 1,
-0.2859997, 0.9887645, -1.276855, 1, 1, 1, 1, 1,
-0.2855457, 0.8394205, -0.00771981, 1, 1, 1, 1, 1,
-0.2851006, -0.0004120532, -1.615737, 0, 0, 1, 1, 1,
-0.2825921, -1.155641, -0.7636952, 1, 0, 0, 1, 1,
-0.2822842, 0.3147703, -2.114035, 1, 0, 0, 1, 1,
-0.282061, -0.6678506, -2.611961, 1, 0, 0, 1, 1,
-0.2819025, -0.1589789, -0.9805009, 1, 0, 0, 1, 1,
-0.2783764, -1.439319, -3.511212, 1, 0, 0, 1, 1,
-0.2754534, 0.06379887, -1.248289, 0, 0, 0, 1, 1,
-0.274219, -1.251243, -2.601343, 0, 0, 0, 1, 1,
-0.2701121, 1.338931, -0.2320871, 0, 0, 0, 1, 1,
-0.269358, -0.1198815, -2.079704, 0, 0, 0, 1, 1,
-0.2665376, 0.08636206, -2.822624, 0, 0, 0, 1, 1,
-0.2651197, -1.175575, -3.12066, 0, 0, 0, 1, 1,
-0.2649218, -0.7070078, -1.254447, 0, 0, 0, 1, 1,
-0.2603154, -0.9869365, -2.931853, 1, 1, 1, 1, 1,
-0.2599514, 0.01352088, -2.585804, 1, 1, 1, 1, 1,
-0.2580878, 0.5409783, -0.9118495, 1, 1, 1, 1, 1,
-0.2560955, 0.7153221, 0.009347526, 1, 1, 1, 1, 1,
-0.2554815, 0.09626212, -0.5980121, 1, 1, 1, 1, 1,
-0.244851, 2.571624, 0.7057766, 1, 1, 1, 1, 1,
-0.2443963, -0.30174, -2.31479, 1, 1, 1, 1, 1,
-0.2390384, -1.794805, -3.367777, 1, 1, 1, 1, 1,
-0.2379917, -0.05414908, -0.4995636, 1, 1, 1, 1, 1,
-0.2371837, 0.06722955, -1.210049, 1, 1, 1, 1, 1,
-0.2335191, -3.060444, -3.806583, 1, 1, 1, 1, 1,
-0.231688, 0.8319186, 0.6815612, 1, 1, 1, 1, 1,
-0.2296776, -0.1101137, -3.252745, 1, 1, 1, 1, 1,
-0.2247261, -0.211846, -1.222746, 1, 1, 1, 1, 1,
-0.2246098, 0.1025309, 0.6408105, 1, 1, 1, 1, 1,
-0.2234697, -2.665218, -3.294203, 0, 0, 1, 1, 1,
-0.2227293, -0.4494704, -3.364947, 1, 0, 0, 1, 1,
-0.2206941, 0.1269716, -1.562788, 1, 0, 0, 1, 1,
-0.2204337, -0.3744043, -3.5977, 1, 0, 0, 1, 1,
-0.2189714, 0.05661222, -0.6296323, 1, 0, 0, 1, 1,
-0.2155863, -2.564684, -5.165835, 1, 0, 0, 1, 1,
-0.2137701, 0.4778327, -0.866729, 0, 0, 0, 1, 1,
-0.2101587, 0.7297806, -1.075749, 0, 0, 0, 1, 1,
-0.2076743, 0.4310258, -0.7968592, 0, 0, 0, 1, 1,
-0.2076293, -0.6140759, -2.38166, 0, 0, 0, 1, 1,
-0.2048215, 0.4050975, -1.121803, 0, 0, 0, 1, 1,
-0.2021704, -1.527596, -3.168472, 0, 0, 0, 1, 1,
-0.1976784, -0.8089245, -2.84413, 0, 0, 0, 1, 1,
-0.193674, -1.26241, -1.574148, 1, 1, 1, 1, 1,
-0.1885281, -0.5560241, -0.9272184, 1, 1, 1, 1, 1,
-0.1819221, 0.6250777, 0.379678, 1, 1, 1, 1, 1,
-0.1809701, 1.911908, 1.528954, 1, 1, 1, 1, 1,
-0.1772343, -0.3989097, -3.934762, 1, 1, 1, 1, 1,
-0.176376, -0.3889159, -4.328819, 1, 1, 1, 1, 1,
-0.1729342, 0.3485784, -1.369061, 1, 1, 1, 1, 1,
-0.1709192, 0.1685212, -1.258296, 1, 1, 1, 1, 1,
-0.1670357, 1.895578, -1.066591, 1, 1, 1, 1, 1,
-0.1633528, 0.2114989, -1.240436, 1, 1, 1, 1, 1,
-0.1631438, 0.1765979, -1.084332, 1, 1, 1, 1, 1,
-0.162047, 0.7481199, 1.542546, 1, 1, 1, 1, 1,
-0.1614448, 0.5383115, -1.381272, 1, 1, 1, 1, 1,
-0.1589257, 1.019531, -0.6018409, 1, 1, 1, 1, 1,
-0.1532783, -0.396114, -1.294095, 1, 1, 1, 1, 1,
-0.1451243, 1.282198, 0.5849209, 0, 0, 1, 1, 1,
-0.1450576, 0.1299651, -1.004592, 1, 0, 0, 1, 1,
-0.1370923, 0.5115553, 0.09068473, 1, 0, 0, 1, 1,
-0.1364019, -0.06990422, -2.235585, 1, 0, 0, 1, 1,
-0.1359239, 0.0507003, -1.239978, 1, 0, 0, 1, 1,
-0.1350364, 0.02825573, 0.2112484, 1, 0, 0, 1, 1,
-0.126145, -2.894878, -3.735368, 0, 0, 0, 1, 1,
-0.1244455, 0.2132149, 1.206533, 0, 0, 0, 1, 1,
-0.1243527, 0.4561739, 0.2586643, 0, 0, 0, 1, 1,
-0.1232436, 0.5938441, 0.6258888, 0, 0, 0, 1, 1,
-0.1214835, 0.2894531, 1.00105, 0, 0, 0, 1, 1,
-0.1210959, 0.6778586, -0.734019, 0, 0, 0, 1, 1,
-0.1127469, -1.357399, -2.418193, 0, 0, 0, 1, 1,
-0.1110306, 2.172248, -0.5328321, 1, 1, 1, 1, 1,
-0.1070112, -0.1316989, -1.242607, 1, 1, 1, 1, 1,
-0.1053384, -0.6892179, -4.311652, 1, 1, 1, 1, 1,
-0.1024042, -0.7364282, -4.832632, 1, 1, 1, 1, 1,
-0.1020459, -0.5479109, -3.280819, 1, 1, 1, 1, 1,
-0.09900299, 0.4035916, -1.633018, 1, 1, 1, 1, 1,
-0.09892116, 0.3526055, 1.13786, 1, 1, 1, 1, 1,
-0.09817852, -0.9680912, -2.987943, 1, 1, 1, 1, 1,
-0.09323709, -1.04695, -3.015749, 1, 1, 1, 1, 1,
-0.09297767, -1.496769, -5.089446, 1, 1, 1, 1, 1,
-0.08871356, 1.15824, 0.185205, 1, 1, 1, 1, 1,
-0.08670781, 1.750721, -1.957619, 1, 1, 1, 1, 1,
-0.08040465, 1.289785, 0.7828252, 1, 1, 1, 1, 1,
-0.08003066, -0.2018238, -3.218069, 1, 1, 1, 1, 1,
-0.07972229, -2.356115, -3.805562, 1, 1, 1, 1, 1,
-0.07066581, -1.026618, -3.641783, 0, 0, 1, 1, 1,
-0.06940959, 1.015409, -1.124024, 1, 0, 0, 1, 1,
-0.06733505, -0.0476871, -1.851824, 1, 0, 0, 1, 1,
-0.06576922, -0.9445899, -2.891555, 1, 0, 0, 1, 1,
-0.06566461, -1.209466, -2.72295, 1, 0, 0, 1, 1,
-0.06242772, 1.238628, -0.3027386, 1, 0, 0, 1, 1,
-0.06121504, -0.4008874, -2.70479, 0, 0, 0, 1, 1,
-0.05809671, -0.9048103, -2.470688, 0, 0, 0, 1, 1,
-0.0573133, -0.4319283, -5.876358, 0, 0, 0, 1, 1,
-0.05715622, -0.3545927, -3.743445, 0, 0, 0, 1, 1,
-0.05528024, 1.8545, -0.7386318, 0, 0, 0, 1, 1,
-0.05427914, -0.5174496, -3.353616, 0, 0, 0, 1, 1,
-0.05394762, -0.4448834, -3.8338, 0, 0, 0, 1, 1,
-0.04515699, 0.3974705, -1.801924, 1, 1, 1, 1, 1,
-0.0403368, -1.77657, -2.877123, 1, 1, 1, 1, 1,
-0.03647625, 0.1779584, 0.1658219, 1, 1, 1, 1, 1,
-0.03552276, 0.5191534, 2.176795, 1, 1, 1, 1, 1,
-0.03386481, 1.322828, 0.7481262, 1, 1, 1, 1, 1,
-0.03063844, -1.330103, -4.895703, 1, 1, 1, 1, 1,
-0.02881114, -0.62707, -4.159443, 1, 1, 1, 1, 1,
-0.02774926, 1.567482, 0.6608064, 1, 1, 1, 1, 1,
-0.02751629, -0.06698236, -3.321588, 1, 1, 1, 1, 1,
-0.02134498, 0.1692336, -1.994772, 1, 1, 1, 1, 1,
-0.02110542, 1.390903, -1.506195, 1, 1, 1, 1, 1,
-0.02056087, 1.448871, 0.2700161, 1, 1, 1, 1, 1,
-0.0168153, 0.9658496, -0.4572285, 1, 1, 1, 1, 1,
-0.01522032, -0.9758345, -2.483568, 1, 1, 1, 1, 1,
-0.01269833, 0.2389506, -1.01264, 1, 1, 1, 1, 1,
-0.007899158, -0.09619872, -3.324911, 0, 0, 1, 1, 1,
-0.002664875, 0.6110088, -0.0951214, 1, 0, 0, 1, 1,
0.001076014, -0.7744628, 3.705271, 1, 0, 0, 1, 1,
0.001274724, 1.11198, -0.3470175, 1, 0, 0, 1, 1,
0.005897165, -2.635179, 3.739106, 1, 0, 0, 1, 1,
0.005978674, -0.3448682, 4.00844, 1, 0, 0, 1, 1,
0.009518205, -1.816542, 4.571128, 0, 0, 0, 1, 1,
0.01197898, 0.1654562, 1.391571, 0, 0, 0, 1, 1,
0.01496796, 0.1270006, 1.985654, 0, 0, 0, 1, 1,
0.01885846, 1.629715, -2.333764, 0, 0, 0, 1, 1,
0.02165756, 0.04003348, 2.748981, 0, 0, 0, 1, 1,
0.03714149, -0.8213096, 2.860695, 0, 0, 0, 1, 1,
0.0386176, 0.7046543, 0.4171237, 0, 0, 0, 1, 1,
0.03918697, -1.335185, 3.282143, 1, 1, 1, 1, 1,
0.04046765, -0.6867987, 2.973268, 1, 1, 1, 1, 1,
0.04125177, 0.06569849, 2.53377, 1, 1, 1, 1, 1,
0.04654782, -1.976511, 1.34057, 1, 1, 1, 1, 1,
0.04751011, 0.7162496, -0.4201297, 1, 1, 1, 1, 1,
0.04854403, 1.120005, -0.6791646, 1, 1, 1, 1, 1,
0.05396471, 0.1280062, 0.6296681, 1, 1, 1, 1, 1,
0.06306338, -0.4865062, 3.946807, 1, 1, 1, 1, 1,
0.06785038, -0.379054, 3.506802, 1, 1, 1, 1, 1,
0.06996197, 0.224634, 1.016464, 1, 1, 1, 1, 1,
0.0702199, -0.1850251, 0.6968561, 1, 1, 1, 1, 1,
0.07122779, 0.5142547, -0.2363841, 1, 1, 1, 1, 1,
0.07987141, -1.156746, 4.696479, 1, 1, 1, 1, 1,
0.09106402, -0.9488593, 2.293665, 1, 1, 1, 1, 1,
0.09121902, -1.203323, 2.080372, 1, 1, 1, 1, 1,
0.0962765, -0.3937961, 3.156231, 0, 0, 1, 1, 1,
0.09747689, 1.017911, 0.3256081, 1, 0, 0, 1, 1,
0.09781975, 0.7554202, 0.8789263, 1, 0, 0, 1, 1,
0.1003087, 0.4666244, 1.095929, 1, 0, 0, 1, 1,
0.1054783, -1.054571, 3.564296, 1, 0, 0, 1, 1,
0.1084928, -1.143239, 4.965222, 1, 0, 0, 1, 1,
0.1188312, 1.521535, -0.08358543, 0, 0, 0, 1, 1,
0.1193886, 0.6278393, 0.1303803, 0, 0, 0, 1, 1,
0.122904, -0.8420827, 2.269872, 0, 0, 0, 1, 1,
0.124764, -1.290792, 3.244905, 0, 0, 0, 1, 1,
0.1256887, 0.09008127, 1.470272, 0, 0, 0, 1, 1,
0.1286304, -1.445137, 1.503824, 0, 0, 0, 1, 1,
0.1329673, -0.01538956, 0.5092285, 0, 0, 0, 1, 1,
0.1364017, -0.01745269, 0.7604541, 1, 1, 1, 1, 1,
0.1369297, -0.2829087, 4.429909, 1, 1, 1, 1, 1,
0.1383259, -0.6929621, 1.17486, 1, 1, 1, 1, 1,
0.1403615, -0.1282037, 2.158784, 1, 1, 1, 1, 1,
0.1412664, -0.7771048, 2.322914, 1, 1, 1, 1, 1,
0.1430659, -1.286592, 3.045016, 1, 1, 1, 1, 1,
0.1463718, -0.6753409, 2.225439, 1, 1, 1, 1, 1,
0.1510978, -0.5911927, 2.682705, 1, 1, 1, 1, 1,
0.1534703, -0.9348409, 3.707336, 1, 1, 1, 1, 1,
0.154516, 1.956892, -1.336523, 1, 1, 1, 1, 1,
0.1605851, 0.1300476, 3.040673, 1, 1, 1, 1, 1,
0.1610424, 0.6233425, -1.92408, 1, 1, 1, 1, 1,
0.1622063, 1.118941, 1.379787, 1, 1, 1, 1, 1,
0.1662484, 0.7149166, 0.8321289, 1, 1, 1, 1, 1,
0.1738585, -0.8999574, 3.756803, 1, 1, 1, 1, 1,
0.1746458, 1.095605, 1.459094, 0, 0, 1, 1, 1,
0.1757469, 0.5708374, 0.4578499, 1, 0, 0, 1, 1,
0.1786219, 0.5297682, 0.8343887, 1, 0, 0, 1, 1,
0.1916997, -1.700437, 2.200958, 1, 0, 0, 1, 1,
0.1929312, 0.3371853, 2.46594, 1, 0, 0, 1, 1,
0.1967656, -0.7880989, 3.352787, 1, 0, 0, 1, 1,
0.2009094, -0.2166103, 3.626889, 0, 0, 0, 1, 1,
0.2035688, 1.399271, 0.2105554, 0, 0, 0, 1, 1,
0.2036915, -1.373049, 2.427285, 0, 0, 0, 1, 1,
0.2069963, -1.05472, 4.421111, 0, 0, 0, 1, 1,
0.208725, 0.5329961, 0.7209835, 0, 0, 0, 1, 1,
0.2100736, 0.7695836, -0.8323624, 0, 0, 0, 1, 1,
0.2137153, -0.4689565, 4.014894, 0, 0, 0, 1, 1,
0.2139041, 0.7404316, 1.036789, 1, 1, 1, 1, 1,
0.2169833, -0.2567736, 2.244728, 1, 1, 1, 1, 1,
0.2182373, -0.2187318, 2.186788, 1, 1, 1, 1, 1,
0.218303, -1.013967, 2.921464, 1, 1, 1, 1, 1,
0.2206201, -0.6989715, 1.68423, 1, 1, 1, 1, 1,
0.2281413, -0.0110697, 2.522226, 1, 1, 1, 1, 1,
0.228277, -0.4976744, 2.387477, 1, 1, 1, 1, 1,
0.2314546, -0.05589105, 0.5925925, 1, 1, 1, 1, 1,
0.2353405, 0.2145231, -0.3395444, 1, 1, 1, 1, 1,
0.2381899, 1.264028, -1.06412, 1, 1, 1, 1, 1,
0.2500719, 0.1696483, 0.9301878, 1, 1, 1, 1, 1,
0.253186, 0.3927135, 1.680051, 1, 1, 1, 1, 1,
0.2533002, -0.1863831, 2.921946, 1, 1, 1, 1, 1,
0.2552605, 0.2354679, 1.219688, 1, 1, 1, 1, 1,
0.2556611, 0.9548375, -0.4428169, 1, 1, 1, 1, 1,
0.2557192, -1.235775, 2.665275, 0, 0, 1, 1, 1,
0.2565135, -0.8769606, 2.906068, 1, 0, 0, 1, 1,
0.258254, -0.5328201, 4.347007, 1, 0, 0, 1, 1,
0.2611279, 1.427468, 2.187001, 1, 0, 0, 1, 1,
0.2633123, -0.7230643, 4.593124, 1, 0, 0, 1, 1,
0.2640142, 0.0544846, 1.033255, 1, 0, 0, 1, 1,
0.2661258, 1.173396, 0.4604042, 0, 0, 0, 1, 1,
0.2662734, 0.7588832, -0.1629494, 0, 0, 0, 1, 1,
0.2667103, -1.815337, 4.213806, 0, 0, 0, 1, 1,
0.2714026, -0.02946969, 2.903674, 0, 0, 0, 1, 1,
0.2736404, 1.586895, -0.05690161, 0, 0, 0, 1, 1,
0.2800261, 0.370682, 0.1410251, 0, 0, 0, 1, 1,
0.2807912, 0.4621926, 0.1020685, 0, 0, 0, 1, 1,
0.2890898, 0.8482252, 0.2520136, 1, 1, 1, 1, 1,
0.2899683, 0.7343857, 0.5757639, 1, 1, 1, 1, 1,
0.2905776, -0.3387866, 2.898821, 1, 1, 1, 1, 1,
0.2918596, 1.764052, 0.4090962, 1, 1, 1, 1, 1,
0.2943962, -0.04621428, 2.416854, 1, 1, 1, 1, 1,
0.2958521, -2.128111, 3.183381, 1, 1, 1, 1, 1,
0.3003154, -0.4441151, 0.2091778, 1, 1, 1, 1, 1,
0.300469, 0.3079242, -0.5376614, 1, 1, 1, 1, 1,
0.3013411, -1.792007, 2.586161, 1, 1, 1, 1, 1,
0.3028429, 0.2902007, 1.161135, 1, 1, 1, 1, 1,
0.3138803, -0.003408419, 1.917877, 1, 1, 1, 1, 1,
0.3168302, 0.05171064, 1.5083, 1, 1, 1, 1, 1,
0.3223089, 0.9715231, -0.1795013, 1, 1, 1, 1, 1,
0.326401, 0.1912657, 1.051239, 1, 1, 1, 1, 1,
0.3273602, 0.8388854, 1.400327, 1, 1, 1, 1, 1,
0.3304379, 0.3419908, 1.694889, 0, 0, 1, 1, 1,
0.3329673, 1.706948, -0.8112071, 1, 0, 0, 1, 1,
0.3338442, 0.9342689, -1.903888, 1, 0, 0, 1, 1,
0.334567, 1.402429, 0.7713208, 1, 0, 0, 1, 1,
0.3380356, -0.7810427, 3.471531, 1, 0, 0, 1, 1,
0.3418553, 1.811511, 1.085782, 1, 0, 0, 1, 1,
0.3427065, -1.254919, 2.864035, 0, 0, 0, 1, 1,
0.3438176, 1.433584, 1.374725, 0, 0, 0, 1, 1,
0.347705, 0.08300919, 1.180598, 0, 0, 0, 1, 1,
0.353377, -0.1781931, 1.338394, 0, 0, 0, 1, 1,
0.362386, 0.8139897, 0.8625912, 0, 0, 0, 1, 1,
0.3683311, -0.2013131, 0.5622103, 0, 0, 0, 1, 1,
0.3700986, 1.1756, 1.39342, 0, 0, 0, 1, 1,
0.3752071, -1.086019, 2.083064, 1, 1, 1, 1, 1,
0.3764378, -0.9374639, 3.745161, 1, 1, 1, 1, 1,
0.3772044, 0.3544736, 0.08502822, 1, 1, 1, 1, 1,
0.3801946, 2.237241, -0.1482499, 1, 1, 1, 1, 1,
0.3804366, 0.5645292, -0.217707, 1, 1, 1, 1, 1,
0.381775, 0.08422211, 2.11854, 1, 1, 1, 1, 1,
0.3835921, -0.0914463, 2.470033, 1, 1, 1, 1, 1,
0.3847786, 1.609757, 0.2215753, 1, 1, 1, 1, 1,
0.3853947, 1.537961, 1.341812, 1, 1, 1, 1, 1,
0.3856309, 2.052619, -0.7036615, 1, 1, 1, 1, 1,
0.3941323, -0.197556, 0.4240761, 1, 1, 1, 1, 1,
0.3948748, 0.1662677, 1.478804, 1, 1, 1, 1, 1,
0.3949654, 0.3155745, 3.183377, 1, 1, 1, 1, 1,
0.3974878, -0.004655073, 0.6231545, 1, 1, 1, 1, 1,
0.3995012, 0.7886891, 0.1450164, 1, 1, 1, 1, 1,
0.4036333, -1.189505, 1.679308, 0, 0, 1, 1, 1,
0.4071157, -0.6379026, 2.536038, 1, 0, 0, 1, 1,
0.4097063, 0.04953688, 0.02455261, 1, 0, 0, 1, 1,
0.4100156, 0.7889575, 1.139395, 1, 0, 0, 1, 1,
0.413356, -0.4953296, 1.809638, 1, 0, 0, 1, 1,
0.4173625, -0.3323244, 0.864993, 1, 0, 0, 1, 1,
0.4276142, -0.5989625, 1.594059, 0, 0, 0, 1, 1,
0.4285895, -0.3728347, 2.532621, 0, 0, 0, 1, 1,
0.4302782, 1.463172, 0.1737278, 0, 0, 0, 1, 1,
0.4350991, 0.2574354, 2.436207, 0, 0, 0, 1, 1,
0.43539, -0.2511471, 2.041747, 0, 0, 0, 1, 1,
0.4369246, 1.038924, 1.042109, 0, 0, 0, 1, 1,
0.4421229, -0.8280998, 3.750862, 0, 0, 0, 1, 1,
0.4457109, 2.245415, 1.435436, 1, 1, 1, 1, 1,
0.4496251, 0.8765266, 1.473317, 1, 1, 1, 1, 1,
0.451019, -0.8952652, 3.452812, 1, 1, 1, 1, 1,
0.4537669, 0.04968294, 2.177918, 1, 1, 1, 1, 1,
0.4547842, 0.3506334, -0.1028364, 1, 1, 1, 1, 1,
0.4549094, -0.5672407, 0.63284, 1, 1, 1, 1, 1,
0.4551913, -2.2432, 3.826287, 1, 1, 1, 1, 1,
0.4615571, -0.8358047, 0.9660735, 1, 1, 1, 1, 1,
0.4619281, -0.8342174, 3.632569, 1, 1, 1, 1, 1,
0.4619915, -0.199317, 0.4408026, 1, 1, 1, 1, 1,
0.4663397, 0.02311118, 0.4551826, 1, 1, 1, 1, 1,
0.4738084, 0.3635983, -0.01890894, 1, 1, 1, 1, 1,
0.4748544, -0.1866456, 0.8167801, 1, 1, 1, 1, 1,
0.4829763, 0.910099, 0.8316607, 1, 1, 1, 1, 1,
0.4870293, 0.6672211, -0.7542688, 1, 1, 1, 1, 1,
0.4889584, 0.6865746, 2.669329, 0, 0, 1, 1, 1,
0.4908086, -0.3664036, 2.718492, 1, 0, 0, 1, 1,
0.4923543, 1.545078, 1.52985, 1, 0, 0, 1, 1,
0.4938563, 0.4150472, 1.980975, 1, 0, 0, 1, 1,
0.4959162, 0.352581, 1.881768, 1, 0, 0, 1, 1,
0.5000407, 1.84291, 1.250158, 1, 0, 0, 1, 1,
0.5044035, 0.1726377, 1.900339, 0, 0, 0, 1, 1,
0.506453, -0.7149375, 3.01882, 0, 0, 0, 1, 1,
0.5110129, 0.3309968, 0.7699402, 0, 0, 0, 1, 1,
0.5117257, 1.016441, 0.9483138, 0, 0, 0, 1, 1,
0.5178609, -0.007060836, 2.552975, 0, 0, 0, 1, 1,
0.5197091, 0.1467976, 2.439707, 0, 0, 0, 1, 1,
0.5230376, 1.545038, -0.7175814, 0, 0, 0, 1, 1,
0.5232912, -0.8667314, 3.645931, 1, 1, 1, 1, 1,
0.523447, -1.500535, 2.418113, 1, 1, 1, 1, 1,
0.5242019, -0.3532447, 3.477968, 1, 1, 1, 1, 1,
0.5273365, 0.7543774, 1.640761, 1, 1, 1, 1, 1,
0.5292905, 0.3935735, 0.8141591, 1, 1, 1, 1, 1,
0.5296443, 1.128589, -0.2563015, 1, 1, 1, 1, 1,
0.5351887, 1.51071, 2.122492, 1, 1, 1, 1, 1,
0.5390506, 0.4554683, -0.4827425, 1, 1, 1, 1, 1,
0.5398617, -2.273164, 3.88827, 1, 1, 1, 1, 1,
0.5483807, 0.2273627, 3.643533, 1, 1, 1, 1, 1,
0.5504726, 0.6077216, 0.2086845, 1, 1, 1, 1, 1,
0.5592502, 1.282743, 0.2848787, 1, 1, 1, 1, 1,
0.5606658, 0.5314941, 1.745462, 1, 1, 1, 1, 1,
0.5644097, -0.4550107, 1.350706, 1, 1, 1, 1, 1,
0.5658652, -0.08321738, 2.683465, 1, 1, 1, 1, 1,
0.5747389, 1.394626, -1.51972, 0, 0, 1, 1, 1,
0.5787745, -1.228715, 3.618258, 1, 0, 0, 1, 1,
0.5847743, -0.2352538, 1.656745, 1, 0, 0, 1, 1,
0.5868353, 1.883978, 0.3279423, 1, 0, 0, 1, 1,
0.588483, -1.692921, 3.398445, 1, 0, 0, 1, 1,
0.5891736, -0.8714071, 2.962775, 1, 0, 0, 1, 1,
0.5923139, -0.07594745, 2.290983, 0, 0, 0, 1, 1,
0.592509, -0.2217214, 3.205227, 0, 0, 0, 1, 1,
0.5927537, -0.2660352, 1.009726, 0, 0, 0, 1, 1,
0.596095, -0.09893014, 1.524529, 0, 0, 0, 1, 1,
0.5994067, -1.638647, 2.003919, 0, 0, 0, 1, 1,
0.6003448, 0.9862072, -0.3773282, 0, 0, 0, 1, 1,
0.601285, -0.1147603, 1.048769, 0, 0, 0, 1, 1,
0.6036953, 0.5019463, 0.8785951, 1, 1, 1, 1, 1,
0.6051349, -0.5945691, 2.319765, 1, 1, 1, 1, 1,
0.6104032, 0.1441546, 3.082214, 1, 1, 1, 1, 1,
0.6120782, 1.894665, 0.5748133, 1, 1, 1, 1, 1,
0.6195263, -0.2624289, 4.516431, 1, 1, 1, 1, 1,
0.6199338, -0.03748548, 1.415706, 1, 1, 1, 1, 1,
0.6214574, 0.6170465, 0.280564, 1, 1, 1, 1, 1,
0.6215644, -0.03406567, 2.832446, 1, 1, 1, 1, 1,
0.6235661, 0.6967691, 1.452946, 1, 1, 1, 1, 1,
0.6263159, 0.4470927, -0.07365532, 1, 1, 1, 1, 1,
0.62888, -0.03303243, 1.336342, 1, 1, 1, 1, 1,
0.6322939, -0.01112236, 1.163801, 1, 1, 1, 1, 1,
0.6328217, -0.3921458, 1.993605, 1, 1, 1, 1, 1,
0.6331955, -0.2871175, 2.768135, 1, 1, 1, 1, 1,
0.6351441, 0.9719995, 1.592378, 1, 1, 1, 1, 1,
0.6365709, -1.264285, 0.2331495, 0, 0, 1, 1, 1,
0.6417922, 0.207354, 0.04752925, 1, 0, 0, 1, 1,
0.6439505, -1.511253, 1.312161, 1, 0, 0, 1, 1,
0.6444864, 0.7372964, 0.7604318, 1, 0, 0, 1, 1,
0.6446215, -1.191003, 4.150567, 1, 0, 0, 1, 1,
0.6473087, -0.03823635, 0.01410977, 1, 0, 0, 1, 1,
0.6474181, -0.1792888, 3.483798, 0, 0, 0, 1, 1,
0.6476179, -0.09703189, 0.8255952, 0, 0, 0, 1, 1,
0.6487667, 0.4589816, -0.4924512, 0, 0, 0, 1, 1,
0.6494457, -0.002253272, -0.2129143, 0, 0, 0, 1, 1,
0.6499066, -0.4315045, 3.480613, 0, 0, 0, 1, 1,
0.6518545, 0.1899809, 1.427539, 0, 0, 0, 1, 1,
0.655184, 0.4590721, 0.3332939, 0, 0, 0, 1, 1,
0.6666738, -0.9996888, 0.3369068, 1, 1, 1, 1, 1,
0.6677203, 0.3550038, 0.5791712, 1, 1, 1, 1, 1,
0.6787726, -0.1039454, 2.194297, 1, 1, 1, 1, 1,
0.6793569, -1.467028, 3.034083, 1, 1, 1, 1, 1,
0.6890724, -0.4423399, 3.843853, 1, 1, 1, 1, 1,
0.6986871, 0.8089234, 1.618507, 1, 1, 1, 1, 1,
0.7006534, 1.742055, 3.218741, 1, 1, 1, 1, 1,
0.7027333, -1.290176, 2.979138, 1, 1, 1, 1, 1,
0.7034216, -0.7703655, 1.935527, 1, 1, 1, 1, 1,
0.7066029, 1.168326, -0.1310642, 1, 1, 1, 1, 1,
0.7086182, 0.2202733, 0.9400657, 1, 1, 1, 1, 1,
0.7112578, 1.869133, 0.8900735, 1, 1, 1, 1, 1,
0.7119063, 0.7415884, 2.302132, 1, 1, 1, 1, 1,
0.7129813, -0.8911176, 2.572926, 1, 1, 1, 1, 1,
0.7212789, -0.6728033, 0.5177387, 1, 1, 1, 1, 1,
0.7260901, 0.5797705, 1.00403, 0, 0, 1, 1, 1,
0.7289807, -0.8539632, 2.43275, 1, 0, 0, 1, 1,
0.7298044, -0.4560941, 3.61213, 1, 0, 0, 1, 1,
0.7319098, -0.02498695, 1.825467, 1, 0, 0, 1, 1,
0.7335835, 0.02209125, 2.533962, 1, 0, 0, 1, 1,
0.7338167, 1.344414, 0.1581708, 1, 0, 0, 1, 1,
0.7386982, 1.546783, -0.05913148, 0, 0, 0, 1, 1,
0.7387851, 0.1662627, 0.1960422, 0, 0, 0, 1, 1,
0.7420427, -0.3146671, 1.239374, 0, 0, 0, 1, 1,
0.7435567, 0.1574808, 1.887213, 0, 0, 0, 1, 1,
0.7449435, 0.9661219, 0.1020056, 0, 0, 0, 1, 1,
0.748769, -0.8072618, 2.260668, 0, 0, 0, 1, 1,
0.7516687, 0.2602135, 1.12934, 0, 0, 0, 1, 1,
0.7543429, -0.08310548, 0.9621913, 1, 1, 1, 1, 1,
0.7546561, 0.03652597, 1.197316, 1, 1, 1, 1, 1,
0.7559972, 1.824487, 0.7422711, 1, 1, 1, 1, 1,
0.7591059, 0.7105188, 1.342663, 1, 1, 1, 1, 1,
0.7635816, -0.09494464, 0.7724174, 1, 1, 1, 1, 1,
0.7683005, -1.098914, 1.231874, 1, 1, 1, 1, 1,
0.7706443, -1.504255, 3.755768, 1, 1, 1, 1, 1,
0.7764035, -0.147472, 2.140223, 1, 1, 1, 1, 1,
0.7849219, -1.451869, 2.559788, 1, 1, 1, 1, 1,
0.7863235, -1.144648, 1.631746, 1, 1, 1, 1, 1,
0.786938, -1.497598, 1.331564, 1, 1, 1, 1, 1,
0.787822, 0.2408752, -0.9279191, 1, 1, 1, 1, 1,
0.7935659, -0.6599153, 2.138126, 1, 1, 1, 1, 1,
0.7941194, -0.356055, 3.238096, 1, 1, 1, 1, 1,
0.799164, -0.1912089, 1.441963, 1, 1, 1, 1, 1,
0.8032051, 0.09799334, 1.388787, 0, 0, 1, 1, 1,
0.803854, -0.7196369, 2.458567, 1, 0, 0, 1, 1,
0.8072743, 0.7340871, 1.579792, 1, 0, 0, 1, 1,
0.8174115, 1.718934, 1.888514, 1, 0, 0, 1, 1,
0.822734, 0.2575757, 1.627415, 1, 0, 0, 1, 1,
0.8256097, 0.2355852, 0.8138824, 1, 0, 0, 1, 1,
0.8308399, -0.8062397, 1.688977, 0, 0, 0, 1, 1,
0.843511, 2.472959, 1.215906, 0, 0, 0, 1, 1,
0.8449505, -0.03216011, 0.3650693, 0, 0, 0, 1, 1,
0.8548558, 1.001655, 1.261523, 0, 0, 0, 1, 1,
0.8666028, -0.06653243, 1.371144, 0, 0, 0, 1, 1,
0.8807377, 0.423363, 2.557804, 0, 0, 0, 1, 1,
0.8807949, 1.047636, -0.9835861, 0, 0, 0, 1, 1,
0.8841037, -1.914283, 2.461916, 1, 1, 1, 1, 1,
0.8851458, 0.30925, 2.559428, 1, 1, 1, 1, 1,
0.8869815, 0.977347, 2.245449, 1, 1, 1, 1, 1,
0.8960437, 1.522757, 0.4556881, 1, 1, 1, 1, 1,
0.899649, 1.143905, -0.04128582, 1, 1, 1, 1, 1,
0.9037999, 0.8398076, 0.3618645, 1, 1, 1, 1, 1,
0.9039295, -0.3162894, 2.94571, 1, 1, 1, 1, 1,
0.9071072, 2.036382, -1.400569, 1, 1, 1, 1, 1,
0.9072151, -0.1135938, 1.708061, 1, 1, 1, 1, 1,
0.907474, 0.5092768, -0.7369903, 1, 1, 1, 1, 1,
0.9109552, -0.07435869, 2.29295, 1, 1, 1, 1, 1,
0.9129801, 1.520487, 0.7380549, 1, 1, 1, 1, 1,
0.9182886, -0.2074969, 1.432581, 1, 1, 1, 1, 1,
0.9188687, 1.058848, 0.8408113, 1, 1, 1, 1, 1,
0.9238496, 1.02345, -0.7492999, 1, 1, 1, 1, 1,
0.9250559, -0.4841352, 2.036436, 0, 0, 1, 1, 1,
0.9266595, 0.4111134, 0.3508486, 1, 0, 0, 1, 1,
0.9301286, 0.1052828, 0.684624, 1, 0, 0, 1, 1,
0.9328056, -2.170652, 2.46059, 1, 0, 0, 1, 1,
0.9340793, 0.5754094, 0.8249823, 1, 0, 0, 1, 1,
0.9400134, 0.2684569, -0.3021213, 1, 0, 0, 1, 1,
0.94144, -1.115631, 3.003565, 0, 0, 0, 1, 1,
0.9577919, -0.4383228, 1.570963, 0, 0, 0, 1, 1,
0.9656306, -0.8965671, 1.689318, 0, 0, 0, 1, 1,
0.9701024, -0.2216265, 2.795714, 0, 0, 0, 1, 1,
0.9740195, -0.1908164, 1.985178, 0, 0, 0, 1, 1,
0.9753505, -0.8503078, 1.342664, 0, 0, 0, 1, 1,
0.9775658, -1.197089, 2.142246, 0, 0, 0, 1, 1,
0.9804779, -1.423598, 2.601765, 1, 1, 1, 1, 1,
0.9808345, -0.6406225, 3.207823, 1, 1, 1, 1, 1,
0.9828995, 0.9559307, 1.415285, 1, 1, 1, 1, 1,
0.9833697, 0.6266094, 0.09887651, 1, 1, 1, 1, 1,
0.9871948, 0.7726786, -0.2165022, 1, 1, 1, 1, 1,
1.001162, 2.267671, 0.2809603, 1, 1, 1, 1, 1,
1.002072, -1.067418, 3.496493, 1, 1, 1, 1, 1,
1.003944, -0.6235048, 0.6615841, 1, 1, 1, 1, 1,
1.004217, 1.531408, -0.504234, 1, 1, 1, 1, 1,
1.011148, 1.056255, 1.626841, 1, 1, 1, 1, 1,
1.02183, 0.6473123, 2.210235, 1, 1, 1, 1, 1,
1.032509, -1.724577, 1.515611, 1, 1, 1, 1, 1,
1.03287, -0.361156, 1.042768, 1, 1, 1, 1, 1,
1.033798, -0.232137, 1.210052, 1, 1, 1, 1, 1,
1.034603, -1.131284, 2.448568, 1, 1, 1, 1, 1,
1.046819, 0.2421629, 2.367316, 0, 0, 1, 1, 1,
1.050819, 0.398806, 1.633449, 1, 0, 0, 1, 1,
1.05916, -0.8583741, 1.117069, 1, 0, 0, 1, 1,
1.059232, 0.1254837, 3.932544, 1, 0, 0, 1, 1,
1.061941, -0.7810311, 1.583647, 1, 0, 0, 1, 1,
1.072506, -1.088151, 2.557612, 1, 0, 0, 1, 1,
1.081499, -0.2246059, 2.568128, 0, 0, 0, 1, 1,
1.082952, 1.534013, 1.421367, 0, 0, 0, 1, 1,
1.085148, 0.9933678, 1.073405, 0, 0, 0, 1, 1,
1.086036, -1.180139, 2.337945, 0, 0, 0, 1, 1,
1.088483, 0.5042178, -0.1439684, 0, 0, 0, 1, 1,
1.089769, 1.489048, 1.328368, 0, 0, 0, 1, 1,
1.098786, -0.1956135, 1.591117, 0, 0, 0, 1, 1,
1.102427, 0.6580802, 0.7675135, 1, 1, 1, 1, 1,
1.1095, 0.3948452, 0.2479592, 1, 1, 1, 1, 1,
1.119304, -1.207675, 2.383657, 1, 1, 1, 1, 1,
1.119457, -0.5249183, 1.562708, 1, 1, 1, 1, 1,
1.138741, -0.4904414, 1.987361, 1, 1, 1, 1, 1,
1.148886, 0.04389533, 1.859267, 1, 1, 1, 1, 1,
1.15372, 1.85417, 1.072966, 1, 1, 1, 1, 1,
1.154924, 0.09460817, 1.531086, 1, 1, 1, 1, 1,
1.156408, -0.6374766, 1.754585, 1, 1, 1, 1, 1,
1.166544, 0.72839, 0.3888944, 1, 1, 1, 1, 1,
1.172216, -0.205927, 3.290099, 1, 1, 1, 1, 1,
1.172753, 0.6797441, 1.149932, 1, 1, 1, 1, 1,
1.176261, 0.6532494, -0.3266906, 1, 1, 1, 1, 1,
1.178248, -1.549834, 3.016321, 1, 1, 1, 1, 1,
1.179592, 1.629463, 2.054822, 1, 1, 1, 1, 1,
1.185232, -0.1431059, 1.15285, 0, 0, 1, 1, 1,
1.185483, 1.441375, 2.051802, 1, 0, 0, 1, 1,
1.185572, 0.8999204, 0.5163571, 1, 0, 0, 1, 1,
1.188204, 0.8207828, 1.789687, 1, 0, 0, 1, 1,
1.193263, -0.1935886, 2.424265, 1, 0, 0, 1, 1,
1.201861, 1.073653, -0.6188077, 1, 0, 0, 1, 1,
1.21196, 1.338172, 0.05342738, 0, 0, 0, 1, 1,
1.213956, -2.151715, 1.321484, 0, 0, 0, 1, 1,
1.2142, 1.363191, 0.8883837, 0, 0, 0, 1, 1,
1.217924, -0.7521358, -0.5069008, 0, 0, 0, 1, 1,
1.221957, 1.303045, 0.08474386, 0, 0, 0, 1, 1,
1.236207, 0.7692859, 1.449032, 0, 0, 0, 1, 1,
1.236572, 1.26414, -0.3052949, 0, 0, 0, 1, 1,
1.237396, -0.01223142, 1.861118, 1, 1, 1, 1, 1,
1.237597, 0.1169768, 0.2938609, 1, 1, 1, 1, 1,
1.243061, 0.3577045, 0.3663681, 1, 1, 1, 1, 1,
1.249804, -0.04365923, 0.7337373, 1, 1, 1, 1, 1,
1.254897, -0.3999827, 2.179486, 1, 1, 1, 1, 1,
1.257098, 0.05446284, 1.444878, 1, 1, 1, 1, 1,
1.26686, 0.2883014, 1.636897, 1, 1, 1, 1, 1,
1.277186, 1.185998, 1.785559, 1, 1, 1, 1, 1,
1.27995, -0.5172673, 1.519315, 1, 1, 1, 1, 1,
1.27999, 0.9723692, 0.7556936, 1, 1, 1, 1, 1,
1.287973, 3.056958, -0.9275318, 1, 1, 1, 1, 1,
1.296781, -1.132977, 3.434437, 1, 1, 1, 1, 1,
1.303488, -0.5261537, 1.2111, 1, 1, 1, 1, 1,
1.304729, -0.4335617, 1.302853, 1, 1, 1, 1, 1,
1.304901, -0.6069879, 2.932983, 1, 1, 1, 1, 1,
1.312037, -0.1701584, 1.413474, 0, 0, 1, 1, 1,
1.313808, -0.005453143, 0.8357862, 1, 0, 0, 1, 1,
1.315992, 0.8243127, 1.46956, 1, 0, 0, 1, 1,
1.319307, -1.735205, 3.525564, 1, 0, 0, 1, 1,
1.323957, 2.183383, -0.1736532, 1, 0, 0, 1, 1,
1.326374, 1.140551, 1.31792, 1, 0, 0, 1, 1,
1.346742, 0.2281139, 1.939826, 0, 0, 0, 1, 1,
1.35153, 0.1788661, -0.07199719, 0, 0, 0, 1, 1,
1.354946, 1.242133, 1.819549, 0, 0, 0, 1, 1,
1.355488, 0.3020872, 1.418345, 0, 0, 0, 1, 1,
1.361507, 0.6819382, 0.1383659, 0, 0, 0, 1, 1,
1.364469, 2.027156, 1.269054, 0, 0, 0, 1, 1,
1.372618, 0.4438938, 1.069845, 0, 0, 0, 1, 1,
1.372945, 1.016429, 1.850768, 1, 1, 1, 1, 1,
1.380466, 0.3029956, 1.394977, 1, 1, 1, 1, 1,
1.383722, 0.1955922, 1.375417, 1, 1, 1, 1, 1,
1.385299, 0.7190149, -0.5952338, 1, 1, 1, 1, 1,
1.390532, 0.8293447, 2.359979, 1, 1, 1, 1, 1,
1.396399, -0.1804379, 1.624713, 1, 1, 1, 1, 1,
1.39893, 0.3497419, 0.8490883, 1, 1, 1, 1, 1,
1.39932, 0.2227508, 2.102129, 1, 1, 1, 1, 1,
1.407268, 0.04022911, -0.1978215, 1, 1, 1, 1, 1,
1.412853, -0.1301723, 2.732863, 1, 1, 1, 1, 1,
1.418332, 0.4417419, 0.7795817, 1, 1, 1, 1, 1,
1.421539, -1.507832, 2.679431, 1, 1, 1, 1, 1,
1.424054, 0.1502424, 1.093076, 1, 1, 1, 1, 1,
1.428844, -2.07237, 2.954576, 1, 1, 1, 1, 1,
1.4311, 1.782263, 2.196231, 1, 1, 1, 1, 1,
1.436714, 0.2315841, 3.691592, 0, 0, 1, 1, 1,
1.437111, 1.896673, 0.5928746, 1, 0, 0, 1, 1,
1.448177, -2.073221, 3.983984, 1, 0, 0, 1, 1,
1.448315, -0.786458, 2.235277, 1, 0, 0, 1, 1,
1.450681, -0.860033, 3.416007, 1, 0, 0, 1, 1,
1.464338, 0.209438, 3.785318, 1, 0, 0, 1, 1,
1.481779, -1.734666, 1.164061, 0, 0, 0, 1, 1,
1.511439, -0.5752444, 2.340715, 0, 0, 0, 1, 1,
1.518662, 0.1004862, 1.160032, 0, 0, 0, 1, 1,
1.531171, 0.0943353, 1.367396, 0, 0, 0, 1, 1,
1.534135, 0.1156663, 0.9082025, 0, 0, 0, 1, 1,
1.547815, 0.797616, 2.621824, 0, 0, 0, 1, 1,
1.549097, 1.085036, 0.7545027, 0, 0, 0, 1, 1,
1.554166, -1.542445, 1.96392, 1, 1, 1, 1, 1,
1.570425, -0.4073098, 2.177761, 1, 1, 1, 1, 1,
1.573613, -0.998451, 3.169957, 1, 1, 1, 1, 1,
1.58059, -0.1904854, 1.002541, 1, 1, 1, 1, 1,
1.581183, 1.258494, 1.808716, 1, 1, 1, 1, 1,
1.58873, 0.4960566, 0.8247032, 1, 1, 1, 1, 1,
1.598516, 0.9246471, 1.773651, 1, 1, 1, 1, 1,
1.598521, -1.486852, 2.336324, 1, 1, 1, 1, 1,
1.605418, -1.095439, 2.012459, 1, 1, 1, 1, 1,
1.605561, -1.067446, 2.052132, 1, 1, 1, 1, 1,
1.611472, 2.43528, -0.3744457, 1, 1, 1, 1, 1,
1.61171, 0.01531687, 2.671748, 1, 1, 1, 1, 1,
1.638022, 0.5957492, 1.485769, 1, 1, 1, 1, 1,
1.644439, -1.324024, 2.606685, 1, 1, 1, 1, 1,
1.65086, 0.07510451, 1.501682, 1, 1, 1, 1, 1,
1.651127, 0.8434216, 1.764071, 0, 0, 1, 1, 1,
1.660578, 0.6980165, 1.021691, 1, 0, 0, 1, 1,
1.665118, 0.2581695, 1.148244, 1, 0, 0, 1, 1,
1.674111, -0.2806809, 2.236746, 1, 0, 0, 1, 1,
1.696619, -1.704291, 3.186384, 1, 0, 0, 1, 1,
1.714477, 0.7033477, 1.988627, 1, 0, 0, 1, 1,
1.717004, -0.06673764, -0.9548267, 0, 0, 0, 1, 1,
1.718484, -1.371272, 2.761741, 0, 0, 0, 1, 1,
1.7186, -0.8964866, 2.091971, 0, 0, 0, 1, 1,
1.726005, -0.5447605, 2.632685, 0, 0, 0, 1, 1,
1.733625, 1.147996, 1.662263, 0, 0, 0, 1, 1,
1.733756, 1.164225, 2.539853, 0, 0, 0, 1, 1,
1.784525, -0.4497891, 1.597515, 0, 0, 0, 1, 1,
1.786043, -0.7860044, 1.068695, 1, 1, 1, 1, 1,
1.816141, 1.947041, 0.2502868, 1, 1, 1, 1, 1,
1.835253, 1.176185, 2.522704, 1, 1, 1, 1, 1,
1.861617, -1.667579, 3.438382, 1, 1, 1, 1, 1,
1.898055, -2.379062, 1.854682, 1, 1, 1, 1, 1,
1.905318, -0.2762625, 0.8918416, 1, 1, 1, 1, 1,
1.930579, -0.6479797, 1.647207, 1, 1, 1, 1, 1,
1.972229, -2.174518, 2.466666, 1, 1, 1, 1, 1,
1.981144, 0.2857322, 0.05044212, 1, 1, 1, 1, 1,
1.995425, -1.561905, 1.617633, 1, 1, 1, 1, 1,
2.005267, 0.4195664, 1.432904, 1, 1, 1, 1, 1,
2.025367, -0.4605296, 1.504587, 1, 1, 1, 1, 1,
2.03619, 0.7437893, -0.01622949, 1, 1, 1, 1, 1,
2.08259, -0.7956331, 1.169295, 1, 1, 1, 1, 1,
2.085988, 0.7495092, 2.011745, 1, 1, 1, 1, 1,
2.091868, -1.643349, 2.753515, 0, 0, 1, 1, 1,
2.107064, 0.8178946, 1.694151, 1, 0, 0, 1, 1,
2.127557, 0.2495997, 3.270665, 1, 0, 0, 1, 1,
2.143834, -0.9660577, 1.730922, 1, 0, 0, 1, 1,
2.146468, -0.7784224, 1.822319, 1, 0, 0, 1, 1,
2.179839, 1.030993, 2.391796, 1, 0, 0, 1, 1,
2.188497, 0.01818629, 2.363515, 0, 0, 0, 1, 1,
2.213332, 0.8298576, 0.76985, 0, 0, 0, 1, 1,
2.226671, -0.4559826, 0.9059642, 0, 0, 0, 1, 1,
2.254179, 0.689614, -0.1727373, 0, 0, 0, 1, 1,
2.258844, 0.9516416, 1.073254, 0, 0, 0, 1, 1,
2.344101, 1.196465, -0.4223603, 0, 0, 0, 1, 1,
2.360311, -0.4134727, 1.262727, 0, 0, 0, 1, 1,
2.391132, -0.2010395, 3.239735, 1, 1, 1, 1, 1,
2.561963, -1.390825, 1.089736, 1, 1, 1, 1, 1,
2.601723, -0.4719802, 1.018666, 1, 1, 1, 1, 1,
2.635452, 0.9139695, 1.040949, 1, 1, 1, 1, 1,
2.703496, -0.7786667, 1.964743, 1, 1, 1, 1, 1,
2.822503, 0.6934121, 1.574469, 1, 1, 1, 1, 1,
2.912551, -0.1905795, 2.727882, 1, 1, 1, 1, 1
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
var radius = 9.406791;
var distance = 33.04095;
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
mvMatrix.translate( 0.01564813, 0.00174284, 0.4555676 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.04095);
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
