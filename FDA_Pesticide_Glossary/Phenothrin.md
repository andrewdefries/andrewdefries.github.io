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
-3.795463, -1.193748, -3.165287, 1, 0, 0, 1,
-3.436976, -0.319078, -1.158229, 1, 0.007843138, 0, 1,
-3.025488, 0.1748281, -1.639072, 1, 0.01176471, 0, 1,
-2.884822, -0.8421435, -2.624188, 1, 0.01960784, 0, 1,
-2.813083, 1.543941, -0.9178412, 1, 0.02352941, 0, 1,
-2.555817, -0.2150246, -0.1225955, 1, 0.03137255, 0, 1,
-2.447003, 0.8018088, -2.531695, 1, 0.03529412, 0, 1,
-2.386377, -1.177955, -1.260257, 1, 0.04313726, 0, 1,
-2.377024, 0.1111762, -0.7663506, 1, 0.04705882, 0, 1,
-2.349877, -1.222468, -2.373839, 1, 0.05490196, 0, 1,
-2.34099, 0.7285308, -0.9343303, 1, 0.05882353, 0, 1,
-2.32164, -0.4234522, -1.314115, 1, 0.06666667, 0, 1,
-2.227012, 0.1729175, 0.5383414, 1, 0.07058824, 0, 1,
-2.223919, -0.7618981, -3.11066, 1, 0.07843138, 0, 1,
-2.181927, 0.2864451, 0.1801372, 1, 0.08235294, 0, 1,
-2.160941, -2.498305, -1.340879, 1, 0.09019608, 0, 1,
-2.156018, -0.4240245, -1.534218, 1, 0.09411765, 0, 1,
-2.143962, 0.1955413, -2.176669, 1, 0.1019608, 0, 1,
-2.130827, -0.5777425, -1.558711, 1, 0.1098039, 0, 1,
-2.100533, 0.005748165, -0.7750596, 1, 0.1137255, 0, 1,
-2.097917, -1.657951, -3.048614, 1, 0.1215686, 0, 1,
-2.059664, 1.472944, -0.8168687, 1, 0.1254902, 0, 1,
-2.004872, -0.298179, -1.052503, 1, 0.1333333, 0, 1,
-1.982566, 3.141238, -1.893725, 1, 0.1372549, 0, 1,
-1.967779, 2.070188, 1.076277, 1, 0.145098, 0, 1,
-1.868491, -0.8095371, -2.472078, 1, 0.1490196, 0, 1,
-1.865731, -0.7393888, -2.883679, 1, 0.1568628, 0, 1,
-1.843866, -0.4307891, -1.782089, 1, 0.1607843, 0, 1,
-1.835553, 0.7433571, 0.2364676, 1, 0.1686275, 0, 1,
-1.834146, -0.4834097, -2.371965, 1, 0.172549, 0, 1,
-1.82739, -2.101251, -4.046299, 1, 0.1803922, 0, 1,
-1.801446, 2.457112, -1.134557, 1, 0.1843137, 0, 1,
-1.796636, -0.3373497, -4.952256, 1, 0.1921569, 0, 1,
-1.776387, -0.9479404, -2.478637, 1, 0.1960784, 0, 1,
-1.776267, -1.338382, -2.339671, 1, 0.2039216, 0, 1,
-1.746795, -0.2782509, -2.965829, 1, 0.2117647, 0, 1,
-1.7448, 0.4764589, -1.283615, 1, 0.2156863, 0, 1,
-1.731357, 0.2443935, -1.414643, 1, 0.2235294, 0, 1,
-1.722705, -2.063866, -2.753816, 1, 0.227451, 0, 1,
-1.711705, 0.2665758, -2.531838, 1, 0.2352941, 0, 1,
-1.711531, -0.8993456, -2.384113, 1, 0.2392157, 0, 1,
-1.683745, -0.1158316, -0.8984184, 1, 0.2470588, 0, 1,
-1.674098, 0.8406307, -3.56429, 1, 0.2509804, 0, 1,
-1.669013, 0.4313959, -1.815143, 1, 0.2588235, 0, 1,
-1.663917, 0.5184731, -2.141907, 1, 0.2627451, 0, 1,
-1.660629, -0.5595579, -2.329924, 1, 0.2705882, 0, 1,
-1.637882, 2.181133, -2.434288, 1, 0.2745098, 0, 1,
-1.633609, -0.2970514, -2.319777, 1, 0.282353, 0, 1,
-1.616127, 1.617638, -1.478164, 1, 0.2862745, 0, 1,
-1.610902, -0.2060071, -1.732078, 1, 0.2941177, 0, 1,
-1.598561, -0.3805659, -0.9012944, 1, 0.3019608, 0, 1,
-1.582579, 0.7663624, -1.314924, 1, 0.3058824, 0, 1,
-1.577717, -0.9551197, -2.368796, 1, 0.3137255, 0, 1,
-1.573456, -0.8197214, -2.120193, 1, 0.3176471, 0, 1,
-1.567406, -1.170725, -2.086033, 1, 0.3254902, 0, 1,
-1.565284, -2.468002, -2.882309, 1, 0.3294118, 0, 1,
-1.552872, 0.1879761, -1.003754, 1, 0.3372549, 0, 1,
-1.532312, 1.839689, -0.2302718, 1, 0.3411765, 0, 1,
-1.528987, 0.2748476, -0.05924688, 1, 0.3490196, 0, 1,
-1.528515, -0.1235935, -2.709574, 1, 0.3529412, 0, 1,
-1.522237, 0.4331012, -1.602798, 1, 0.3607843, 0, 1,
-1.518051, -0.7795033, -0.277071, 1, 0.3647059, 0, 1,
-1.512506, -1.307145, -2.375628, 1, 0.372549, 0, 1,
-1.5042, 0.6679981, 0.6433094, 1, 0.3764706, 0, 1,
-1.478416, 0.09901816, -1.478571, 1, 0.3843137, 0, 1,
-1.470067, 0.7658959, -0.6287048, 1, 0.3882353, 0, 1,
-1.446481, 0.3610438, -0.3432935, 1, 0.3960784, 0, 1,
-1.436996, -0.6715446, -1.572341, 1, 0.4039216, 0, 1,
-1.424144, 0.995934, -0.9639133, 1, 0.4078431, 0, 1,
-1.413069, -0.6021054, -0.8630464, 1, 0.4156863, 0, 1,
-1.407894, 1.371848, 2.661237, 1, 0.4196078, 0, 1,
-1.406293, 0.9647949, 0.7460873, 1, 0.427451, 0, 1,
-1.402121, -0.2953808, -2.131552, 1, 0.4313726, 0, 1,
-1.399119, -0.9051528, -3.191835, 1, 0.4392157, 0, 1,
-1.389166, -2.026653, -2.186647, 1, 0.4431373, 0, 1,
-1.381205, -0.8056079, -3.071136, 1, 0.4509804, 0, 1,
-1.379699, 1.051293, -0.3529521, 1, 0.454902, 0, 1,
-1.375192, 0.1136217, -2.538801, 1, 0.4627451, 0, 1,
-1.366198, 0.7404673, -0.731939, 1, 0.4666667, 0, 1,
-1.363541, -0.6978905, -1.768711, 1, 0.4745098, 0, 1,
-1.352886, 0.8906761, -1.168216, 1, 0.4784314, 0, 1,
-1.352113, 0.4117908, -0.1288371, 1, 0.4862745, 0, 1,
-1.349725, -1.03588, -4.634942, 1, 0.4901961, 0, 1,
-1.344325, -0.9285616, -4.438143, 1, 0.4980392, 0, 1,
-1.329675, -1.511409, -2.363776, 1, 0.5058824, 0, 1,
-1.329462, -0.3352343, -1.026308, 1, 0.509804, 0, 1,
-1.325724, -0.1241234, -0.7643844, 1, 0.5176471, 0, 1,
-1.322738, -0.05294089, -1.229967, 1, 0.5215687, 0, 1,
-1.32102, 0.9427952, -1.172432, 1, 0.5294118, 0, 1,
-1.318439, -0.03015462, -0.4012522, 1, 0.5333334, 0, 1,
-1.315174, -0.8477131, -1.789007, 1, 0.5411765, 0, 1,
-1.306492, 1.298313, -0.4872383, 1, 0.5450981, 0, 1,
-1.295056, -1.289677, -1.62618, 1, 0.5529412, 0, 1,
-1.294663, 0.3059922, -0.6958836, 1, 0.5568628, 0, 1,
-1.292962, 0.7287245, -1.053122, 1, 0.5647059, 0, 1,
-1.284747, 0.6800606, -1.677111, 1, 0.5686275, 0, 1,
-1.281849, 1.339361, -0.7212597, 1, 0.5764706, 0, 1,
-1.272938, 0.2017849, -2.801164, 1, 0.5803922, 0, 1,
-1.271679, -0.791715, -2.408636, 1, 0.5882353, 0, 1,
-1.263732, 0.6186641, 0.0009819585, 1, 0.5921569, 0, 1,
-1.245126, 0.2103451, 0.752426, 1, 0.6, 0, 1,
-1.232258, -1.655649, -4.256117, 1, 0.6078432, 0, 1,
-1.218952, 0.774965, 2.103066, 1, 0.6117647, 0, 1,
-1.215825, -0.5160903, -2.109944, 1, 0.6196079, 0, 1,
-1.21441, -1.10525, -2.502542, 1, 0.6235294, 0, 1,
-1.214258, -0.2206809, -0.0658002, 1, 0.6313726, 0, 1,
-1.214139, 1.607498, -1.384007, 1, 0.6352941, 0, 1,
-1.204046, -1.016658, -3.165396, 1, 0.6431373, 0, 1,
-1.201891, -0.1949219, -0.9375577, 1, 0.6470588, 0, 1,
-1.196826, 0.7705737, -2.526944, 1, 0.654902, 0, 1,
-1.193582, 1.313052, 0.4010867, 1, 0.6588235, 0, 1,
-1.186846, 0.5838107, -1.696962, 1, 0.6666667, 0, 1,
-1.17551, 0.766593, -2.087785, 1, 0.6705883, 0, 1,
-1.173571, 1.958911, 0.2733871, 1, 0.6784314, 0, 1,
-1.148852, -0.7693203, -1.844723, 1, 0.682353, 0, 1,
-1.139294, 1.407496, -0.2282697, 1, 0.6901961, 0, 1,
-1.135984, 0.1097007, -1.454924, 1, 0.6941177, 0, 1,
-1.131726, 0.02889672, -1.353738, 1, 0.7019608, 0, 1,
-1.131656, 1.207043, -1.309303, 1, 0.7098039, 0, 1,
-1.124367, -0.3950591, -3.430695, 1, 0.7137255, 0, 1,
-1.112131, 0.2373199, -1.74296, 1, 0.7215686, 0, 1,
-1.104759, 0.5448375, -0.08121002, 1, 0.7254902, 0, 1,
-1.102456, 0.1437691, -0.9586826, 1, 0.7333333, 0, 1,
-1.097937, -1.265104, -4.285576, 1, 0.7372549, 0, 1,
-1.093254, -2.097466, -3.968933, 1, 0.7450981, 0, 1,
-1.088158, 2.64368, -1.395475, 1, 0.7490196, 0, 1,
-1.058113, 0.7058163, -0.2251458, 1, 0.7568628, 0, 1,
-1.056516, 0.7949786, -0.5794885, 1, 0.7607843, 0, 1,
-1.051316, -1.121574, -2.623032, 1, 0.7686275, 0, 1,
-1.049102, 1.376907, -0.06256651, 1, 0.772549, 0, 1,
-1.045393, 0.8792459, -1.539856, 1, 0.7803922, 0, 1,
-1.04489, -0.1685353, -2.247465, 1, 0.7843137, 0, 1,
-1.042286, -1.023039, -1.437394, 1, 0.7921569, 0, 1,
-1.03614, 0.2791233, -1.778749, 1, 0.7960784, 0, 1,
-1.036029, 0.4210396, -0.02798479, 1, 0.8039216, 0, 1,
-1.034111, -0.04750356, -0.7985072, 1, 0.8117647, 0, 1,
-1.026535, -2.011568, -3.828593, 1, 0.8156863, 0, 1,
-1.025646, -2.070375, -0.5176416, 1, 0.8235294, 0, 1,
-1.021439, 1.036185, -2.337364, 1, 0.827451, 0, 1,
-1.019277, 1.470379, -1.540673, 1, 0.8352941, 0, 1,
-1.015199, 1.11361, -0.7189351, 1, 0.8392157, 0, 1,
-1.014316, -0.7423282, 0.6249474, 1, 0.8470588, 0, 1,
-1.013409, 2.085043, -1.498137, 1, 0.8509804, 0, 1,
-1.012693, 1.708208, -1.372606, 1, 0.8588235, 0, 1,
-1.00788, -0.3442221, -3.437737, 1, 0.8627451, 0, 1,
-1.006112, 0.09496681, -0.2962443, 1, 0.8705882, 0, 1,
-0.9970992, -0.9374962, -2.877402, 1, 0.8745098, 0, 1,
-0.9941735, 0.01727555, -1.839354, 1, 0.8823529, 0, 1,
-0.9889256, 0.5580952, -0.1873469, 1, 0.8862745, 0, 1,
-0.9836253, 0.4019089, -2.250407, 1, 0.8941177, 0, 1,
-0.9772753, -1.043092, -3.852427, 1, 0.8980392, 0, 1,
-0.9742525, 0.1116017, -1.157742, 1, 0.9058824, 0, 1,
-0.9724598, 0.02158878, -3.282816, 1, 0.9137255, 0, 1,
-0.9660378, 0.7055851, -0.2390879, 1, 0.9176471, 0, 1,
-0.9653486, 1.147022, -1.781002, 1, 0.9254902, 0, 1,
-0.9624904, -0.03264097, -2.360003, 1, 0.9294118, 0, 1,
-0.9591575, 0.6238578, -1.743055, 1, 0.9372549, 0, 1,
-0.956873, 0.2180729, -0.07156995, 1, 0.9411765, 0, 1,
-0.9460719, -0.2125064, -0.05167092, 1, 0.9490196, 0, 1,
-0.9432393, -0.8878089, -2.114822, 1, 0.9529412, 0, 1,
-0.9429014, -0.8900264, -1.548406, 1, 0.9607843, 0, 1,
-0.9419985, -1.02531, -1.059216, 1, 0.9647059, 0, 1,
-0.9402882, -0.2442544, -1.166856, 1, 0.972549, 0, 1,
-0.9375728, -1.2312, -3.644612, 1, 0.9764706, 0, 1,
-0.9313039, 1.207336, -0.01737047, 1, 0.9843137, 0, 1,
-0.9306675, 0.9452718, 0.5932706, 1, 0.9882353, 0, 1,
-0.9294927, 0.1791536, -0.9916587, 1, 0.9960784, 0, 1,
-0.9274796, -1.431784, -3.281464, 0.9960784, 1, 0, 1,
-0.9224763, 1.599125, 0.006374715, 0.9921569, 1, 0, 1,
-0.9201679, 0.3146149, -1.667692, 0.9843137, 1, 0, 1,
-0.9177548, 0.5338663, -0.7757905, 0.9803922, 1, 0, 1,
-0.9137203, 2.09609, 0.4640254, 0.972549, 1, 0, 1,
-0.9116646, -0.8062302, -0.04551453, 0.9686275, 1, 0, 1,
-0.9079765, -1.096875, -0.763316, 0.9607843, 1, 0, 1,
-0.9006306, -0.2808767, -2.042089, 0.9568627, 1, 0, 1,
-0.8936971, 0.7483595, -1.069896, 0.9490196, 1, 0, 1,
-0.893461, -1.189149, -4.392251, 0.945098, 1, 0, 1,
-0.8872828, -2.68803, -2.376302, 0.9372549, 1, 0, 1,
-0.8870714, -0.05359153, -1.375504, 0.9333333, 1, 0, 1,
-0.8869351, 0.03416473, -0.8012478, 0.9254902, 1, 0, 1,
-0.8860583, -1.946181, -3.046423, 0.9215686, 1, 0, 1,
-0.8854854, 0.07578798, -2.538268, 0.9137255, 1, 0, 1,
-0.8839941, -0.621661, -0.4517845, 0.9098039, 1, 0, 1,
-0.8805887, -0.2202209, -0.7065272, 0.9019608, 1, 0, 1,
-0.8789576, 0.8774199, -0.2852375, 0.8941177, 1, 0, 1,
-0.8714638, 0.9648767, -2.433286, 0.8901961, 1, 0, 1,
-0.8638415, -1.723173, -2.888071, 0.8823529, 1, 0, 1,
-0.8631035, 0.1558018, -1.001617, 0.8784314, 1, 0, 1,
-0.8571604, 0.08227056, -0.9065729, 0.8705882, 1, 0, 1,
-0.8566033, -0.5441328, -3.415729, 0.8666667, 1, 0, 1,
-0.8497274, -0.451981, -3.043453, 0.8588235, 1, 0, 1,
-0.8493984, 0.1398308, -0.6204726, 0.854902, 1, 0, 1,
-0.8470575, -0.0401285, -0.7862254, 0.8470588, 1, 0, 1,
-0.8448799, -1.020508, -3.549455, 0.8431373, 1, 0, 1,
-0.8437278, 0.07300351, -1.988049, 0.8352941, 1, 0, 1,
-0.8402188, -0.5516686, -3.818361, 0.8313726, 1, 0, 1,
-0.8387866, 1.678246, -0.4757117, 0.8235294, 1, 0, 1,
-0.8383791, -1.313187, -2.480522, 0.8196079, 1, 0, 1,
-0.8320996, -0.4739726, -3.260242, 0.8117647, 1, 0, 1,
-0.8270768, 0.7871451, -0.1121718, 0.8078431, 1, 0, 1,
-0.826001, -0.2403153, -2.821242, 0.8, 1, 0, 1,
-0.8211419, -0.3025931, -2.332609, 0.7921569, 1, 0, 1,
-0.8187101, -0.1757788, -2.668143, 0.7882353, 1, 0, 1,
-0.8186143, 0.3010345, -0.3391978, 0.7803922, 1, 0, 1,
-0.8174093, -0.1470346, -2.161559, 0.7764706, 1, 0, 1,
-0.8168276, -1.448565, -3.952341, 0.7686275, 1, 0, 1,
-0.8161307, 0.4838328, -0.04081791, 0.7647059, 1, 0, 1,
-0.8143914, -0.5454044, -2.075191, 0.7568628, 1, 0, 1,
-0.8028662, -0.6635479, -0.5811484, 0.7529412, 1, 0, 1,
-0.8028007, -0.3716989, -2.797099, 0.7450981, 1, 0, 1,
-0.8019674, 1.227801, -0.6952004, 0.7411765, 1, 0, 1,
-0.8019601, -0.4355837, -1.9694, 0.7333333, 1, 0, 1,
-0.8003138, 1.360574, 0.2363376, 0.7294118, 1, 0, 1,
-0.7980394, -1.33413, -1.85248, 0.7215686, 1, 0, 1,
-0.7885184, -0.214314, -2.308073, 0.7176471, 1, 0, 1,
-0.7867026, 0.5717131, -1.196528, 0.7098039, 1, 0, 1,
-0.7747508, 2.264153, -0.01013894, 0.7058824, 1, 0, 1,
-0.7718852, 0.5524269, 0.2823986, 0.6980392, 1, 0, 1,
-0.7714801, -1.924366, -2.118622, 0.6901961, 1, 0, 1,
-0.7700444, -1.955784, -3.20041, 0.6862745, 1, 0, 1,
-0.7633814, 0.1782837, -0.3493653, 0.6784314, 1, 0, 1,
-0.7572635, -0.4818749, -2.302979, 0.6745098, 1, 0, 1,
-0.7557275, 1.210803, -1.263137, 0.6666667, 1, 0, 1,
-0.755013, -0.670593, -3.097019, 0.6627451, 1, 0, 1,
-0.7535229, -1.031289, -3.273147, 0.654902, 1, 0, 1,
-0.7530643, -0.3838111, -0.7901627, 0.6509804, 1, 0, 1,
-0.7512776, 0.4744703, -0.6522279, 0.6431373, 1, 0, 1,
-0.7508574, -1.201863, -4.053303, 0.6392157, 1, 0, 1,
-0.7506705, -1.371218, -4.040794, 0.6313726, 1, 0, 1,
-0.7473738, -0.8586182, -3.970884, 0.627451, 1, 0, 1,
-0.7448691, 0.990563, -0.4362392, 0.6196079, 1, 0, 1,
-0.7417527, 1.172813, 0.9499542, 0.6156863, 1, 0, 1,
-0.7327201, 2.29265, 1.201609, 0.6078432, 1, 0, 1,
-0.7243595, 0.8680283, 0.3213523, 0.6039216, 1, 0, 1,
-0.7226636, 1.018579, -1.648627, 0.5960785, 1, 0, 1,
-0.7219364, -1.669869, -2.185014, 0.5882353, 1, 0, 1,
-0.721684, -0.5612313, -1.021852, 0.5843138, 1, 0, 1,
-0.7197932, 1.267542, 0.9901576, 0.5764706, 1, 0, 1,
-0.7128229, -1.210718, -3.182134, 0.572549, 1, 0, 1,
-0.7120755, 0.03998153, -0.856747, 0.5647059, 1, 0, 1,
-0.7094582, 0.9305083, -0.9607286, 0.5607843, 1, 0, 1,
-0.6971835, 0.6761632, -2.583918, 0.5529412, 1, 0, 1,
-0.6870429, 1.113071, 1.139614, 0.5490196, 1, 0, 1,
-0.6692768, 0.7247863, -0.4256912, 0.5411765, 1, 0, 1,
-0.6664623, 2.221641, 0.6672643, 0.5372549, 1, 0, 1,
-0.6603774, 0.807917, -0.3109598, 0.5294118, 1, 0, 1,
-0.6589251, 0.8138652, -1.696695, 0.5254902, 1, 0, 1,
-0.6561723, 1.76099, -0.6213651, 0.5176471, 1, 0, 1,
-0.6549656, 2.04612, -1.59156, 0.5137255, 1, 0, 1,
-0.6502247, 0.4334383, -1.701407, 0.5058824, 1, 0, 1,
-0.6487598, 1.184649, -0.9652196, 0.5019608, 1, 0, 1,
-0.6486437, 0.1995368, -2.697284, 0.4941176, 1, 0, 1,
-0.6486309, 0.07924348, -0.4136001, 0.4862745, 1, 0, 1,
-0.6466588, -2.269813, -3.792017, 0.4823529, 1, 0, 1,
-0.6457571, -0.1452648, -1.87202, 0.4745098, 1, 0, 1,
-0.6392131, -0.8398056, -2.137955, 0.4705882, 1, 0, 1,
-0.6384898, -0.8415353, -1.053354, 0.4627451, 1, 0, 1,
-0.633727, 0.4149561, 0.004343821, 0.4588235, 1, 0, 1,
-0.6317868, -1.60304, -3.885092, 0.4509804, 1, 0, 1,
-0.6289502, -0.7289951, -2.794631, 0.4470588, 1, 0, 1,
-0.6284957, -1.217626, -3.232718, 0.4392157, 1, 0, 1,
-0.6123895, 0.6205535, -0.04926121, 0.4352941, 1, 0, 1,
-0.6116795, 1.185035, 0.1497319, 0.427451, 1, 0, 1,
-0.6109494, 0.1526386, -0.7607819, 0.4235294, 1, 0, 1,
-0.6039635, -0.3696022, -2.638418, 0.4156863, 1, 0, 1,
-0.6039039, 1.825142, 1.246398, 0.4117647, 1, 0, 1,
-0.6018001, 0.004840988, -1.185877, 0.4039216, 1, 0, 1,
-0.6001563, -0.4817044, -3.08325, 0.3960784, 1, 0, 1,
-0.5930051, -0.6609028, -2.868849, 0.3921569, 1, 0, 1,
-0.5911009, -0.1289869, -1.422959, 0.3843137, 1, 0, 1,
-0.58957, 0.1722957, -0.3417027, 0.3803922, 1, 0, 1,
-0.5880259, 0.009982697, -2.721832, 0.372549, 1, 0, 1,
-0.5825524, -1.176804, -2.165514, 0.3686275, 1, 0, 1,
-0.5816684, 1.010325, -0.9119576, 0.3607843, 1, 0, 1,
-0.5777347, -0.6423143, -2.187845, 0.3568628, 1, 0, 1,
-0.5755841, -1.185722, -2.324994, 0.3490196, 1, 0, 1,
-0.5716097, 0.4445851, -1.221163, 0.345098, 1, 0, 1,
-0.5701029, 0.3642482, -1.48903, 0.3372549, 1, 0, 1,
-0.5682104, 1.027924, -0.4899703, 0.3333333, 1, 0, 1,
-0.5587199, -0.3507997, -1.670424, 0.3254902, 1, 0, 1,
-0.5581627, 0.530163, -1.528392, 0.3215686, 1, 0, 1,
-0.5577596, 0.8577315, 0.2243648, 0.3137255, 1, 0, 1,
-0.5549256, 1.617458, -0.3814356, 0.3098039, 1, 0, 1,
-0.5523411, -0.6539942, -1.081873, 0.3019608, 1, 0, 1,
-0.549529, 0.8043284, -0.508401, 0.2941177, 1, 0, 1,
-0.5425012, -0.5963513, -3.997938, 0.2901961, 1, 0, 1,
-0.5403268, 0.3217911, -0.7058094, 0.282353, 1, 0, 1,
-0.5300677, 0.9840447, 0.7727615, 0.2784314, 1, 0, 1,
-0.5169634, -0.1999751, -2.160442, 0.2705882, 1, 0, 1,
-0.5137961, 0.4557568, -0.7259344, 0.2666667, 1, 0, 1,
-0.5090411, -0.9228316, -0.2767428, 0.2588235, 1, 0, 1,
-0.5088538, -0.7824899, -0.591465, 0.254902, 1, 0, 1,
-0.5076547, 1.316334, -2.779277, 0.2470588, 1, 0, 1,
-0.5054077, 1.393367, -0.4427912, 0.2431373, 1, 0, 1,
-0.4956821, 0.292832, -0.5987517, 0.2352941, 1, 0, 1,
-0.4924378, -1.723864, -1.701787, 0.2313726, 1, 0, 1,
-0.4881191, 0.5700454, -0.04434265, 0.2235294, 1, 0, 1,
-0.487588, -0.4931307, -2.583395, 0.2196078, 1, 0, 1,
-0.4848765, 0.3491401, -0.4231554, 0.2117647, 1, 0, 1,
-0.4820106, 0.2638105, -1.298345, 0.2078431, 1, 0, 1,
-0.4792886, 0.5529889, -0.796204, 0.2, 1, 0, 1,
-0.4764805, -1.679106, -1.14555, 0.1921569, 1, 0, 1,
-0.4717655, -1.297559, -5.048768, 0.1882353, 1, 0, 1,
-0.4713169, 0.6112816, -1.037176, 0.1803922, 1, 0, 1,
-0.4693494, -1.758837, -2.583786, 0.1764706, 1, 0, 1,
-0.4667585, -0.5557295, -2.531013, 0.1686275, 1, 0, 1,
-0.4658022, 1.90256, -0.1672886, 0.1647059, 1, 0, 1,
-0.4622101, -0.9837907, -6.05026, 0.1568628, 1, 0, 1,
-0.4565276, 0.0648064, -0.8071045, 0.1529412, 1, 0, 1,
-0.4536539, 0.3072593, -1.258147, 0.145098, 1, 0, 1,
-0.451585, 1.187758, 1.022351, 0.1411765, 1, 0, 1,
-0.4512909, -0.6984018, -2.005116, 0.1333333, 1, 0, 1,
-0.4499733, 1.286416, -0.1704539, 0.1294118, 1, 0, 1,
-0.4482729, -0.739607, -3.726537, 0.1215686, 1, 0, 1,
-0.4482062, 0.06243968, -2.808923, 0.1176471, 1, 0, 1,
-0.4457539, 0.3366704, -1.077141, 0.1098039, 1, 0, 1,
-0.4433943, -0.3550457, -2.309797, 0.1058824, 1, 0, 1,
-0.4433405, 0.3430443, 0.5158, 0.09803922, 1, 0, 1,
-0.4413428, 0.6908054, -0.8190264, 0.09019608, 1, 0, 1,
-0.440785, -2.16857, -3.315717, 0.08627451, 1, 0, 1,
-0.439368, -0.248064, -0.1643094, 0.07843138, 1, 0, 1,
-0.4348183, 2.069794, -0.4754035, 0.07450981, 1, 0, 1,
-0.4320101, -1.141322, -2.801262, 0.06666667, 1, 0, 1,
-0.4289588, -0.1053483, -3.155543, 0.0627451, 1, 0, 1,
-0.4273246, -1.603331, -3.616072, 0.05490196, 1, 0, 1,
-0.4269482, -0.3758295, -3.17213, 0.05098039, 1, 0, 1,
-0.4268681, -0.3309519, -3.797012, 0.04313726, 1, 0, 1,
-0.4229208, -1.320233, -2.143962, 0.03921569, 1, 0, 1,
-0.4207413, 1.487451, 0.5138147, 0.03137255, 1, 0, 1,
-0.4192828, 0.144479, -1.814497, 0.02745098, 1, 0, 1,
-0.417657, -0.4907728, -2.760131, 0.01960784, 1, 0, 1,
-0.413308, -0.4756994, -4.033983, 0.01568628, 1, 0, 1,
-0.411238, 0.364051, -1.675372, 0.007843138, 1, 0, 1,
-0.4077088, -1.236493, -2.228674, 0.003921569, 1, 0, 1,
-0.4040634, -0.9368691, -2.297227, 0, 1, 0.003921569, 1,
-0.4033992, -1.25687, -4.354347, 0, 1, 0.01176471, 1,
-0.400788, -0.8117731, -3.692485, 0, 1, 0.01568628, 1,
-0.4003353, -0.955997, -1.902113, 0, 1, 0.02352941, 1,
-0.3996099, 0.5371869, -0.166583, 0, 1, 0.02745098, 1,
-0.3942432, 0.7197534, -0.2619743, 0, 1, 0.03529412, 1,
-0.3888936, 0.6897097, -0.2719784, 0, 1, 0.03921569, 1,
-0.3887897, -0.6585293, -3.949188, 0, 1, 0.04705882, 1,
-0.3830022, 2.314314, 0.2906524, 0, 1, 0.05098039, 1,
-0.378259, -0.2086326, -1.393983, 0, 1, 0.05882353, 1,
-0.3779648, 1.662656, 0.482114, 0, 1, 0.0627451, 1,
-0.3715599, -0.5456868, -4.553076, 0, 1, 0.07058824, 1,
-0.3706112, 1.840773, 0.2571732, 0, 1, 0.07450981, 1,
-0.3705334, -0.8258781, -2.474022, 0, 1, 0.08235294, 1,
-0.365438, -0.6903654, -2.077269, 0, 1, 0.08627451, 1,
-0.3620533, 0.1879763, -0.1387753, 0, 1, 0.09411765, 1,
-0.3585455, 0.7375192, -1.552364, 0, 1, 0.1019608, 1,
-0.3565302, -0.4599033, -2.337634, 0, 1, 0.1058824, 1,
-0.355168, -2.029577, -2.89985, 0, 1, 0.1137255, 1,
-0.3542979, 1.639852, 0.8791506, 0, 1, 0.1176471, 1,
-0.3529594, -0.4327351, -0.6773735, 0, 1, 0.1254902, 1,
-0.3461298, -0.6738605, -2.026839, 0, 1, 0.1294118, 1,
-0.344556, -0.1352317, -2.398915, 0, 1, 0.1372549, 1,
-0.340114, 2.237391, -2.001618, 0, 1, 0.1411765, 1,
-0.3390244, 0.3832553, -1.088736, 0, 1, 0.1490196, 1,
-0.337134, 0.5723876, 1.023034, 0, 1, 0.1529412, 1,
-0.3337727, 1.412613, -0.1072695, 0, 1, 0.1607843, 1,
-0.3323415, -1.831731, -2.98928, 0, 1, 0.1647059, 1,
-0.3285434, -0.6070905, -3.146049, 0, 1, 0.172549, 1,
-0.3281413, -0.9713861, -3.292952, 0, 1, 0.1764706, 1,
-0.3243349, -0.2605033, -2.623048, 0, 1, 0.1843137, 1,
-0.322974, -0.3629466, -2.261401, 0, 1, 0.1882353, 1,
-0.3214473, 1.757315, -1.404094, 0, 1, 0.1960784, 1,
-0.3182201, -0.2543921, -3.01078, 0, 1, 0.2039216, 1,
-0.317376, 0.1957536, -1.584596, 0, 1, 0.2078431, 1,
-0.3162389, -0.1078556, -2.519931, 0, 1, 0.2156863, 1,
-0.3153172, -1.002309, -2.739133, 0, 1, 0.2196078, 1,
-0.3118486, -0.6920903, -3.570666, 0, 1, 0.227451, 1,
-0.3100195, -0.8821382, -4.030178, 0, 1, 0.2313726, 1,
-0.3073286, -0.6202327, -1.894534, 0, 1, 0.2392157, 1,
-0.3062721, 0.4617082, -0.6321079, 0, 1, 0.2431373, 1,
-0.3060057, -0.9077222, -3.274689, 0, 1, 0.2509804, 1,
-0.303731, -1.098188, -2.293704, 0, 1, 0.254902, 1,
-0.3003793, -0.9991961, -3.420954, 0, 1, 0.2627451, 1,
-0.2970421, -0.1733585, -1.009689, 0, 1, 0.2666667, 1,
-0.2925077, -0.3354174, -1.533764, 0, 1, 0.2745098, 1,
-0.2885261, 0.1773674, -2.048626, 0, 1, 0.2784314, 1,
-0.2871341, -0.1962526, -2.103439, 0, 1, 0.2862745, 1,
-0.2774417, -0.2741768, -2.736997, 0, 1, 0.2901961, 1,
-0.2650694, -0.547637, -0.2808362, 0, 1, 0.2980392, 1,
-0.2646841, -1.236336, -3.739884, 0, 1, 0.3058824, 1,
-0.2636415, 0.7776352, -1.019017, 0, 1, 0.3098039, 1,
-0.2623555, -0.1880101, -0.8086837, 0, 1, 0.3176471, 1,
-0.2596323, -0.8323812, -3.954016, 0, 1, 0.3215686, 1,
-0.2595548, 0.07081851, -1.279748, 0, 1, 0.3294118, 1,
-0.2583784, 1.498251, 0.7260469, 0, 1, 0.3333333, 1,
-0.2583404, -0.3737206, -1.796398, 0, 1, 0.3411765, 1,
-0.2576114, 1.393891, 0.6014387, 0, 1, 0.345098, 1,
-0.2562566, 0.8214578, -0.8595115, 0, 1, 0.3529412, 1,
-0.2540984, 0.3753799, -1.034004, 0, 1, 0.3568628, 1,
-0.2449765, -0.06083916, -1.977704, 0, 1, 0.3647059, 1,
-0.2440771, 1.196985, 0.1459362, 0, 1, 0.3686275, 1,
-0.2432229, 1.562634, 0.1881535, 0, 1, 0.3764706, 1,
-0.2366398, -0.5888979, -3.436579, 0, 1, 0.3803922, 1,
-0.2366225, 0.7017705, -0.780145, 0, 1, 0.3882353, 1,
-0.2362749, -1.262478, -3.925221, 0, 1, 0.3921569, 1,
-0.2360018, -0.8535258, -1.695613, 0, 1, 0.4, 1,
-0.2356868, -1.503016, -3.652862, 0, 1, 0.4078431, 1,
-0.2345862, 0.04800604, -1.84533, 0, 1, 0.4117647, 1,
-0.234511, 0.4135819, -1.402742, 0, 1, 0.4196078, 1,
-0.2324155, -0.691147, -2.811874, 0, 1, 0.4235294, 1,
-0.2253016, -0.8543678, -1.212096, 0, 1, 0.4313726, 1,
-0.2250714, -0.4949165, -2.285172, 0, 1, 0.4352941, 1,
-0.2197605, -0.6688635, -3.373386, 0, 1, 0.4431373, 1,
-0.218392, -1.419194, -3.196182, 0, 1, 0.4470588, 1,
-0.2096758, 1.322662, -0.622116, 0, 1, 0.454902, 1,
-0.2072007, -0.7708771, -2.544937, 0, 1, 0.4588235, 1,
-0.2061644, 1.678805, -0.2416155, 0, 1, 0.4666667, 1,
-0.2047509, -1.963207, -2.881592, 0, 1, 0.4705882, 1,
-0.2035996, -1.66026, -2.227329, 0, 1, 0.4784314, 1,
-0.199583, -1.407335, -2.488195, 0, 1, 0.4823529, 1,
-0.1984096, 0.05200049, -0.3904317, 0, 1, 0.4901961, 1,
-0.1908108, -0.5468802, -1.932559, 0, 1, 0.4941176, 1,
-0.1900657, -1.517696, -3.256362, 0, 1, 0.5019608, 1,
-0.1882335, 0.08979169, -0.4490307, 0, 1, 0.509804, 1,
-0.1873071, -1.71476, -3.201969, 0, 1, 0.5137255, 1,
-0.1848344, 0.4268724, 0.6975287, 0, 1, 0.5215687, 1,
-0.1816826, 1.639045, -0.9457557, 0, 1, 0.5254902, 1,
-0.1808126, -0.8097435, -3.222315, 0, 1, 0.5333334, 1,
-0.1762731, 1.935145, -1.065059, 0, 1, 0.5372549, 1,
-0.1727585, -0.5532949, -1.869095, 0, 1, 0.5450981, 1,
-0.1712339, 0.4360659, -0.8021255, 0, 1, 0.5490196, 1,
-0.1697769, -1.020408, -3.135324, 0, 1, 0.5568628, 1,
-0.1665897, 0.09722823, -2.337284, 0, 1, 0.5607843, 1,
-0.156596, -1.733155, -3.480305, 0, 1, 0.5686275, 1,
-0.1562207, 0.7961097, 1.540167, 0, 1, 0.572549, 1,
-0.1548136, -0.1063948, -3.428262, 0, 1, 0.5803922, 1,
-0.1498267, 0.2503766, 0.9012766, 0, 1, 0.5843138, 1,
-0.1462919, 0.9036599, 0.879108, 0, 1, 0.5921569, 1,
-0.14617, -0.5487634, -3.949903, 0, 1, 0.5960785, 1,
-0.1458476, -0.4843118, -1.442559, 0, 1, 0.6039216, 1,
-0.1451777, -1.43607, -3.298908, 0, 1, 0.6117647, 1,
-0.1441803, -0.8511914, -3.6989, 0, 1, 0.6156863, 1,
-0.1361247, -1.0862, -3.034815, 0, 1, 0.6235294, 1,
-0.132627, -0.04633329, -1.443761, 0, 1, 0.627451, 1,
-0.1325637, 0.0713435, -2.184001, 0, 1, 0.6352941, 1,
-0.1322292, 0.2422205, -0.2560936, 0, 1, 0.6392157, 1,
-0.1319763, 0.1623513, -1.506885, 0, 1, 0.6470588, 1,
-0.1312767, 0.2840836, -0.927891, 0, 1, 0.6509804, 1,
-0.1288533, 0.3717147, -1.872432, 0, 1, 0.6588235, 1,
-0.1275313, -0.767831, -3.103402, 0, 1, 0.6627451, 1,
-0.1255254, -0.2785224, -2.855126, 0, 1, 0.6705883, 1,
-0.1250113, 0.06913852, -0.9519813, 0, 1, 0.6745098, 1,
-0.1243566, -0.6785986, -5.47147, 0, 1, 0.682353, 1,
-0.1238335, 0.5503082, -0.5731334, 0, 1, 0.6862745, 1,
-0.1203944, -1.335179, -2.779546, 0, 1, 0.6941177, 1,
-0.1203401, -0.2001248, -2.397973, 0, 1, 0.7019608, 1,
-0.1159949, -0.3594005, -3.547673, 0, 1, 0.7058824, 1,
-0.1152346, -0.1370909, -4.169535, 0, 1, 0.7137255, 1,
-0.1122545, -0.8950011, -2.705558, 0, 1, 0.7176471, 1,
-0.1118694, 0.5633155, -0.2106713, 0, 1, 0.7254902, 1,
-0.1101867, -1.459723, -0.1647975, 0, 1, 0.7294118, 1,
-0.1085338, 0.9311746, 0.5304854, 0, 1, 0.7372549, 1,
-0.1065924, -1.20506, -4.18594, 0, 1, 0.7411765, 1,
-0.1030387, 0.8454758, 0.5133736, 0, 1, 0.7490196, 1,
-0.1026107, 0.9599607, 1.587578, 0, 1, 0.7529412, 1,
-0.102433, -1.243252, -1.758742, 0, 1, 0.7607843, 1,
-0.102353, 1.211161, 0.4793011, 0, 1, 0.7647059, 1,
-0.1001523, -0.5374617, -2.026034, 0, 1, 0.772549, 1,
-0.09958533, 2.342923, -0.4466908, 0, 1, 0.7764706, 1,
-0.09675918, 0.729384, -0.4545449, 0, 1, 0.7843137, 1,
-0.09225416, 0.3669652, 0.5102564, 0, 1, 0.7882353, 1,
-0.085662, 0.4779801, -0.4923307, 0, 1, 0.7960784, 1,
-0.08097816, 0.05997146, -1.964815, 0, 1, 0.8039216, 1,
-0.07849722, -1.182398, -2.854573, 0, 1, 0.8078431, 1,
-0.07203536, 0.4923727, -0.1554753, 0, 1, 0.8156863, 1,
-0.06903438, 0.7327928, 0.7831693, 0, 1, 0.8196079, 1,
-0.06894971, -0.3105449, -3.189151, 0, 1, 0.827451, 1,
-0.0637927, -1.647188, -3.831212, 0, 1, 0.8313726, 1,
-0.06369111, 0.246144, 0.7838348, 0, 1, 0.8392157, 1,
-0.05728225, -0.4972138, -3.835949, 0, 1, 0.8431373, 1,
-0.0554499, 1.084838, 0.6824536, 0, 1, 0.8509804, 1,
-0.05392271, -0.4821016, -4.075201, 0, 1, 0.854902, 1,
-0.05336902, -2.067859, -2.849653, 0, 1, 0.8627451, 1,
-0.05281892, 1.421658, 0.5713002, 0, 1, 0.8666667, 1,
-0.05233652, 0.8181957, 0.8693026, 0, 1, 0.8745098, 1,
-0.0511838, 0.06030678, -0.3675404, 0, 1, 0.8784314, 1,
-0.04949274, -0.9967461, -3.45628, 0, 1, 0.8862745, 1,
-0.04800472, -0.6333939, -1.719231, 0, 1, 0.8901961, 1,
-0.04322235, -1.132592, -1.886509, 0, 1, 0.8980392, 1,
-0.04137974, -1.28863, -2.348714, 0, 1, 0.9058824, 1,
-0.03784787, 0.8455238, -0.7699278, 0, 1, 0.9098039, 1,
-0.03632009, -1.066591, -2.368612, 0, 1, 0.9176471, 1,
-0.03420174, 1.070328, -1.739274, 0, 1, 0.9215686, 1,
-0.03329659, 0.4797847, 0.846887, 0, 1, 0.9294118, 1,
-0.03159476, 0.533272, 0.3658099, 0, 1, 0.9333333, 1,
-0.03145391, -0.09080853, -2.484983, 0, 1, 0.9411765, 1,
-0.02922994, 0.2696467, 0.6888145, 0, 1, 0.945098, 1,
-0.02518994, -2.127209, -5.304798, 0, 1, 0.9529412, 1,
-0.02094879, 2.242904, -0.22141, 0, 1, 0.9568627, 1,
-0.01895576, -1.174352, -1.829774, 0, 1, 0.9647059, 1,
-0.01828621, -1.123491, -1.657221, 0, 1, 0.9686275, 1,
-0.01780148, 0.2696368, 0.2546375, 0, 1, 0.9764706, 1,
-0.01773422, 0.2385557, 0.6779833, 0, 1, 0.9803922, 1,
-0.01441946, 0.7357617, -0.9668759, 0, 1, 0.9882353, 1,
-0.0138514, 0.6244736, -0.8541059, 0, 1, 0.9921569, 1,
-0.01126178, 0.9273198, -0.8997418, 0, 1, 1, 1,
-0.006235364, -0.6199191, -3.228682, 0, 0.9921569, 1, 1,
-0.003906579, 0.3470816, -0.7037773, 0, 0.9882353, 1, 1,
-0.003787414, 0.7492447, -0.3607805, 0, 0.9803922, 1, 1,
-0.003724152, -0.04895974, -1.355494, 0, 0.9764706, 1, 1,
-0.002863732, -0.640491, -3.547275, 0, 0.9686275, 1, 1,
0.006954639, 1.221242, -1.249894, 0, 0.9647059, 1, 1,
0.008730279, -0.4301383, 0.6180469, 0, 0.9568627, 1, 1,
0.008958821, -0.4893605, 4.214551, 0, 0.9529412, 1, 1,
0.009592233, -0.8009794, 2.75993, 0, 0.945098, 1, 1,
0.01145666, 1.393614, -0.5406977, 0, 0.9411765, 1, 1,
0.01256103, 0.7021422, 0.6475555, 0, 0.9333333, 1, 1,
0.0127025, -1.924707, 3.687299, 0, 0.9294118, 1, 1,
0.0138264, -1.730709, 1.924464, 0, 0.9215686, 1, 1,
0.01561258, -1.632647, 2.784697, 0, 0.9176471, 1, 1,
0.01726181, 0.6868494, -0.3406934, 0, 0.9098039, 1, 1,
0.01731654, 1.028987, -0.4053271, 0, 0.9058824, 1, 1,
0.02080364, 0.296854, 0.09404296, 0, 0.8980392, 1, 1,
0.03095493, -0.4751872, 3.129686, 0, 0.8901961, 1, 1,
0.03153288, -0.9485878, 2.103475, 0, 0.8862745, 1, 1,
0.03400875, 0.3026627, 0.1213039, 0, 0.8784314, 1, 1,
0.03450975, 0.6945173, -0.06662808, 0, 0.8745098, 1, 1,
0.03592028, -0.4363465, 2.83377, 0, 0.8666667, 1, 1,
0.0366638, -0.9296386, 2.639915, 0, 0.8627451, 1, 1,
0.03887874, -0.04802815, 1.295081, 0, 0.854902, 1, 1,
0.0393096, 0.5068646, 0.2517632, 0, 0.8509804, 1, 1,
0.04021392, 0.1799513, 0.5084351, 0, 0.8431373, 1, 1,
0.04184383, -1.836671, 2.83568, 0, 0.8392157, 1, 1,
0.04574378, 0.2196484, 1.594797, 0, 0.8313726, 1, 1,
0.05089884, 1.749964, -1.013638, 0, 0.827451, 1, 1,
0.05417645, -1.098357, 2.08144, 0, 0.8196079, 1, 1,
0.05687604, 0.5372686, -0.3556947, 0, 0.8156863, 1, 1,
0.0587182, 0.08685908, 0.2779429, 0, 0.8078431, 1, 1,
0.06544186, -0.2605702, 1.840494, 0, 0.8039216, 1, 1,
0.06665281, -0.2385169, 2.743991, 0, 0.7960784, 1, 1,
0.06665898, -1.454339, 2.273462, 0, 0.7882353, 1, 1,
0.07365706, -0.5820811, 4.967769, 0, 0.7843137, 1, 1,
0.07654841, 0.1217526, 1.093261, 0, 0.7764706, 1, 1,
0.08071574, 0.1696107, -0.2566749, 0, 0.772549, 1, 1,
0.08893491, 0.2721362, -1.191294, 0, 0.7647059, 1, 1,
0.09020043, -0.6119252, 2.449417, 0, 0.7607843, 1, 1,
0.09110805, -0.6834131, 2.471637, 0, 0.7529412, 1, 1,
0.09787745, 0.4339997, 0.5567059, 0, 0.7490196, 1, 1,
0.09806236, -2.250892, 1.957624, 0, 0.7411765, 1, 1,
0.09847963, 0.5835373, 0.3319888, 0, 0.7372549, 1, 1,
0.09978238, -1.140191, 3.653734, 0, 0.7294118, 1, 1,
0.1009107, -1.227576, 2.883077, 0, 0.7254902, 1, 1,
0.1028835, -0.8773899, 2.428238, 0, 0.7176471, 1, 1,
0.1036116, -0.152049, 1.501254, 0, 0.7137255, 1, 1,
0.1042033, 2.451035, -0.5788587, 0, 0.7058824, 1, 1,
0.1053396, -1.355374, 4.047668, 0, 0.6980392, 1, 1,
0.1056388, -0.2003695, 1.625038, 0, 0.6941177, 1, 1,
0.1075879, -0.6179738, 2.056523, 0, 0.6862745, 1, 1,
0.1126147, -0.9914075, 2.991784, 0, 0.682353, 1, 1,
0.1139242, 0.5609316, 0.9991224, 0, 0.6745098, 1, 1,
0.1159731, 0.7498617, -0.7106448, 0, 0.6705883, 1, 1,
0.1168335, -1.358596, 1.764749, 0, 0.6627451, 1, 1,
0.1200522, 0.2048173, 0.5153808, 0, 0.6588235, 1, 1,
0.1213664, -1.335002, 2.82402, 0, 0.6509804, 1, 1,
0.1254637, -0.9129989, 3.325936, 0, 0.6470588, 1, 1,
0.1265687, 1.925455, 0.2240885, 0, 0.6392157, 1, 1,
0.1275457, -0.7997177, 1.588616, 0, 0.6352941, 1, 1,
0.128035, 0.2022309, 0.1256673, 0, 0.627451, 1, 1,
0.1292614, -0.05086031, 2.732874, 0, 0.6235294, 1, 1,
0.1310478, 0.6073164, 1.264084, 0, 0.6156863, 1, 1,
0.1331572, 0.4373006, -0.3920603, 0, 0.6117647, 1, 1,
0.1362675, -2.051574, 3.109759, 0, 0.6039216, 1, 1,
0.1410357, -1.217657, 4.182381, 0, 0.5960785, 1, 1,
0.1411285, 0.813265, -0.9165747, 0, 0.5921569, 1, 1,
0.1455146, -0.779946, 1.992689, 0, 0.5843138, 1, 1,
0.1472621, -3.007307, 2.363315, 0, 0.5803922, 1, 1,
0.1509475, -0.6338959, 4.383796, 0, 0.572549, 1, 1,
0.151127, -1.49364, 4.187906, 0, 0.5686275, 1, 1,
0.1579436, 1.076703, -0.3528683, 0, 0.5607843, 1, 1,
0.1643441, -0.4457656, 3.784106, 0, 0.5568628, 1, 1,
0.1659161, -1.657313, 3.114263, 0, 0.5490196, 1, 1,
0.167007, -0.6993513, 3.616947, 0, 0.5450981, 1, 1,
0.167297, 1.048367, -0.2652181, 0, 0.5372549, 1, 1,
0.1689989, 0.7914036, -0.8758399, 0, 0.5333334, 1, 1,
0.17143, -0.6968443, 3.339629, 0, 0.5254902, 1, 1,
0.1728646, -0.7878104, 2.002843, 0, 0.5215687, 1, 1,
0.1759497, -0.7726765, 3.047057, 0, 0.5137255, 1, 1,
0.1778268, 0.9402454, 1.310608, 0, 0.509804, 1, 1,
0.1790229, -0.292865, 0.89353, 0, 0.5019608, 1, 1,
0.1808992, -0.9205814, 4.734723, 0, 0.4941176, 1, 1,
0.1812532, -0.7561942, 3.141399, 0, 0.4901961, 1, 1,
0.1813266, -2.954447, 3.034119, 0, 0.4823529, 1, 1,
0.1889435, -0.6842731, 3.074794, 0, 0.4784314, 1, 1,
0.1898184, 0.04721388, 1.205509, 0, 0.4705882, 1, 1,
0.1930266, 1.332388, 0.3336306, 0, 0.4666667, 1, 1,
0.2004814, 0.1073868, 1.323033, 0, 0.4588235, 1, 1,
0.2018261, -0.1708262, 1.490089, 0, 0.454902, 1, 1,
0.2052415, 0.7133303, 1.776692, 0, 0.4470588, 1, 1,
0.2062972, 1.976911, 0.6304396, 0, 0.4431373, 1, 1,
0.2071062, -0.2931716, 3.704048, 0, 0.4352941, 1, 1,
0.2102713, -0.03189141, 2.710623, 0, 0.4313726, 1, 1,
0.2114114, -0.6916966, 3.289052, 0, 0.4235294, 1, 1,
0.2168972, 1.016367, 0.5040815, 0, 0.4196078, 1, 1,
0.2185365, -0.2750816, 2.759935, 0, 0.4117647, 1, 1,
0.2221145, -0.9910095, 3.357918, 0, 0.4078431, 1, 1,
0.2247828, -1.275058, 2.615708, 0, 0.4, 1, 1,
0.2248204, 0.4565209, 0.9573817, 0, 0.3921569, 1, 1,
0.228091, 1.426851, 0.6201061, 0, 0.3882353, 1, 1,
0.2285595, -2.028, 1.702874, 0, 0.3803922, 1, 1,
0.2312659, -0.1516506, 2.851322, 0, 0.3764706, 1, 1,
0.2313296, -0.6968826, 2.714504, 0, 0.3686275, 1, 1,
0.2313387, 2.105817, -0.4759044, 0, 0.3647059, 1, 1,
0.2318403, -1.001132, 1.818316, 0, 0.3568628, 1, 1,
0.2357221, 1.066195, 0.7156659, 0, 0.3529412, 1, 1,
0.2382926, -0.3897231, 1.968869, 0, 0.345098, 1, 1,
0.2418522, -0.6061868, 3.088132, 0, 0.3411765, 1, 1,
0.2430126, 0.2788955, 1.213084, 0, 0.3333333, 1, 1,
0.2450213, 0.9694275, 2.766089, 0, 0.3294118, 1, 1,
0.2466683, -0.274854, 1.57915, 0, 0.3215686, 1, 1,
0.2487345, 1.072213, 0.1856076, 0, 0.3176471, 1, 1,
0.2535994, -0.5722104, 3.927503, 0, 0.3098039, 1, 1,
0.2575788, -0.09778448, 1.31363, 0, 0.3058824, 1, 1,
0.260951, -1.36192, 1.749574, 0, 0.2980392, 1, 1,
0.263575, -0.8386716, 4.400195, 0, 0.2901961, 1, 1,
0.2654096, 0.7887267, 0.6892664, 0, 0.2862745, 1, 1,
0.2687413, 0.2066162, -0.2379007, 0, 0.2784314, 1, 1,
0.2721947, -1.367605, 1.101841, 0, 0.2745098, 1, 1,
0.2746126, -0.421961, 1.2023, 0, 0.2666667, 1, 1,
0.2749528, 0.1586322, 0.8456504, 0, 0.2627451, 1, 1,
0.2751349, -0.1176942, 0.4124428, 0, 0.254902, 1, 1,
0.2781722, 1.646168, -0.1034896, 0, 0.2509804, 1, 1,
0.2806851, -0.02174575, -0.06692384, 0, 0.2431373, 1, 1,
0.2807285, -1.681638, 1.953063, 0, 0.2392157, 1, 1,
0.2812104, 1.313999, 1.587348, 0, 0.2313726, 1, 1,
0.2812838, -2.022225, 2.536969, 0, 0.227451, 1, 1,
0.2830355, 0.224858, 0.9158784, 0, 0.2196078, 1, 1,
0.287577, 0.8467861, -0.1106024, 0, 0.2156863, 1, 1,
0.291647, 0.796286, 1.276043, 0, 0.2078431, 1, 1,
0.2950477, -0.03119017, 2.147094, 0, 0.2039216, 1, 1,
0.2958032, 1.288085, -0.359648, 0, 0.1960784, 1, 1,
0.3026082, 0.4659887, 0.1979424, 0, 0.1882353, 1, 1,
0.3062092, 0.523321, 0.6777475, 0, 0.1843137, 1, 1,
0.3091447, 0.1269503, -0.01423058, 0, 0.1764706, 1, 1,
0.3102555, 0.5659821, -0.5653939, 0, 0.172549, 1, 1,
0.3125612, 1.08722, 1.387188, 0, 0.1647059, 1, 1,
0.3156298, -0.2257538, 1.699019, 0, 0.1607843, 1, 1,
0.316475, -1.580442, 2.215908, 0, 0.1529412, 1, 1,
0.3172343, 0.5843947, 1.237893, 0, 0.1490196, 1, 1,
0.3173957, 0.1008773, 2.559227, 0, 0.1411765, 1, 1,
0.3182692, -1.048075, 3.350069, 0, 0.1372549, 1, 1,
0.3240358, -0.4149998, 3.116721, 0, 0.1294118, 1, 1,
0.3266952, -0.1586898, 2.665677, 0, 0.1254902, 1, 1,
0.3321503, 1.461824, -0.7839309, 0, 0.1176471, 1, 1,
0.3360923, -0.8072008, 1.084729, 0, 0.1137255, 1, 1,
0.33799, 0.6381777, 0.1519076, 0, 0.1058824, 1, 1,
0.3390725, 2.246025, 0.022236, 0, 0.09803922, 1, 1,
0.3401654, -1.611759, 3.761808, 0, 0.09411765, 1, 1,
0.3438657, -1.39553, 2.423269, 0, 0.08627451, 1, 1,
0.3440035, -1.772865, 3.222113, 0, 0.08235294, 1, 1,
0.3465059, 1.535095, 1.413256, 0, 0.07450981, 1, 1,
0.3488677, -0.5644492, 1.093733, 0, 0.07058824, 1, 1,
0.3508529, -0.2182605, 1.942517, 0, 0.0627451, 1, 1,
0.3566439, 0.2974955, 0.5188237, 0, 0.05882353, 1, 1,
0.3570387, -1.491366, 2.693947, 0, 0.05098039, 1, 1,
0.3622017, 0.8516442, 0.364734, 0, 0.04705882, 1, 1,
0.3653491, -1.163828, 3.028399, 0, 0.03921569, 1, 1,
0.3723084, 0.07517009, 0.9974302, 0, 0.03529412, 1, 1,
0.3778437, -0.3836968, 0.4724774, 0, 0.02745098, 1, 1,
0.3799763, -0.7677797, 2.879532, 0, 0.02352941, 1, 1,
0.3808445, -0.006049749, 1.358458, 0, 0.01568628, 1, 1,
0.382511, 1.239266, 1.939819, 0, 0.01176471, 1, 1,
0.3825488, -1.474893, 1.557482, 0, 0.003921569, 1, 1,
0.3833992, -1.456524, 2.958059, 0.003921569, 0, 1, 1,
0.3834619, -0.3386162, 2.695828, 0.007843138, 0, 1, 1,
0.3842746, -0.05151423, 2.036396, 0.01568628, 0, 1, 1,
0.3879248, -0.5368891, 1.061099, 0.01960784, 0, 1, 1,
0.3900703, -0.870911, 3.326524, 0.02745098, 0, 1, 1,
0.3901082, -0.5926334, 2.527701, 0.03137255, 0, 1, 1,
0.3938131, 1.581433, 1.08453, 0.03921569, 0, 1, 1,
0.3954584, 0.3074447, 0.8747252, 0.04313726, 0, 1, 1,
0.3972764, 2.258755, -1.786532, 0.05098039, 0, 1, 1,
0.3975517, -1.268722, 1.788221, 0.05490196, 0, 1, 1,
0.4029163, -1.708852, 3.129701, 0.0627451, 0, 1, 1,
0.4060532, 0.8405896, 2.945653, 0.06666667, 0, 1, 1,
0.4083311, 0.4153682, 0.1705827, 0.07450981, 0, 1, 1,
0.4115026, 0.9082271, -0.3202228, 0.07843138, 0, 1, 1,
0.4117354, 1.021634, -0.286452, 0.08627451, 0, 1, 1,
0.4141697, -0.3630407, 0.2087879, 0.09019608, 0, 1, 1,
0.4227816, 0.04331969, 1.360531, 0.09803922, 0, 1, 1,
0.4258031, -0.54013, 2.36662, 0.1058824, 0, 1, 1,
0.4286419, 0.6135606, 1.924136, 0.1098039, 0, 1, 1,
0.4300054, 0.9078203, 2.353239, 0.1176471, 0, 1, 1,
0.4309439, 0.572484, 0.7250671, 0.1215686, 0, 1, 1,
0.431354, 1.046117, -0.1574065, 0.1294118, 0, 1, 1,
0.4334874, 0.5144264, 2.420779, 0.1333333, 0, 1, 1,
0.4345809, -1.263981, 4.198087, 0.1411765, 0, 1, 1,
0.4359474, 0.1151986, 2.230177, 0.145098, 0, 1, 1,
0.4362249, -1.465771, 3.13672, 0.1529412, 0, 1, 1,
0.4372773, -0.4390522, 2.610462, 0.1568628, 0, 1, 1,
0.4381524, 0.1355275, 0.8302279, 0.1647059, 0, 1, 1,
0.4392136, 0.5288907, -0.6799256, 0.1686275, 0, 1, 1,
0.4394605, 0.2482111, 1.79338, 0.1764706, 0, 1, 1,
0.4405929, 2.740927, -2.100468, 0.1803922, 0, 1, 1,
0.4416904, 0.4739802, -0.4263505, 0.1882353, 0, 1, 1,
0.4423082, -0.9528678, 3.06794, 0.1921569, 0, 1, 1,
0.4471181, -1.764582, 3.064667, 0.2, 0, 1, 1,
0.4633189, -0.07728658, 0.04474786, 0.2078431, 0, 1, 1,
0.4637291, -2.786887, 2.105437, 0.2117647, 0, 1, 1,
0.4651155, -0.3087052, 3.394146, 0.2196078, 0, 1, 1,
0.4665329, -0.5492994, 2.305514, 0.2235294, 0, 1, 1,
0.469505, -0.8367338, 2.271744, 0.2313726, 0, 1, 1,
0.4731913, -0.4808802, -0.4155791, 0.2352941, 0, 1, 1,
0.4790366, 0.1136115, 1.301735, 0.2431373, 0, 1, 1,
0.4810698, -0.9133808, 0.9376433, 0.2470588, 0, 1, 1,
0.484081, 0.1582648, 0.8548864, 0.254902, 0, 1, 1,
0.4859626, 0.5993739, 1.489969, 0.2588235, 0, 1, 1,
0.4874109, -0.214324, 2.446913, 0.2666667, 0, 1, 1,
0.4900623, 2.424855, 0.191253, 0.2705882, 0, 1, 1,
0.4911782, -0.4862814, 0.742553, 0.2784314, 0, 1, 1,
0.4950282, 0.934503, 2.817962, 0.282353, 0, 1, 1,
0.4964238, 1.134272, 0.1293101, 0.2901961, 0, 1, 1,
0.504308, 0.2139947, -0.3102352, 0.2941177, 0, 1, 1,
0.5084543, -1.022748, 2.596418, 0.3019608, 0, 1, 1,
0.5086636, -1.034389, 2.392628, 0.3098039, 0, 1, 1,
0.5128354, -1.321609, 1.16421, 0.3137255, 0, 1, 1,
0.5143832, 0.2241007, 3.519729, 0.3215686, 0, 1, 1,
0.5190666, 1.194569, 2.30308, 0.3254902, 0, 1, 1,
0.5227233, -0.2178472, 2.832571, 0.3333333, 0, 1, 1,
0.5235717, 0.07165121, 2.076437, 0.3372549, 0, 1, 1,
0.5324512, 0.4780488, -0.8890014, 0.345098, 0, 1, 1,
0.5336061, 0.1235947, 0.5431477, 0.3490196, 0, 1, 1,
0.5336869, -0.2454387, 1.245826, 0.3568628, 0, 1, 1,
0.536, -0.7029108, 2.613286, 0.3607843, 0, 1, 1,
0.5383008, 0.1155875, 0.138887, 0.3686275, 0, 1, 1,
0.5398778, 0.1358103, 0.01755933, 0.372549, 0, 1, 1,
0.5485851, 0.7982424, -0.470033, 0.3803922, 0, 1, 1,
0.5514961, -0.4907801, 4.703834, 0.3843137, 0, 1, 1,
0.5516656, 0.8130495, 1.479674, 0.3921569, 0, 1, 1,
0.5544555, 1.943918, 0.6759806, 0.3960784, 0, 1, 1,
0.5636615, 0.1609894, 1.475959, 0.4039216, 0, 1, 1,
0.5646846, -1.30169, 3.811207, 0.4117647, 0, 1, 1,
0.569541, -0.5204604, 2.673069, 0.4156863, 0, 1, 1,
0.5710162, 1.826454, -0.2568635, 0.4235294, 0, 1, 1,
0.5718672, 0.461354, 0.2945704, 0.427451, 0, 1, 1,
0.5723279, 0.9848937, -1.748651, 0.4352941, 0, 1, 1,
0.5733346, -0.2027032, 1.801216, 0.4392157, 0, 1, 1,
0.5748215, -0.7773953, 3.268422, 0.4470588, 0, 1, 1,
0.5849345, -0.3458384, 1.556703, 0.4509804, 0, 1, 1,
0.5859331, 0.4897469, -0.1220833, 0.4588235, 0, 1, 1,
0.5873522, -0.7313069, 1.179313, 0.4627451, 0, 1, 1,
0.5885765, 0.4981963, 1.091305, 0.4705882, 0, 1, 1,
0.5895888, -0.5958381, 3.041267, 0.4745098, 0, 1, 1,
0.5997425, 1.580927, 1.014666, 0.4823529, 0, 1, 1,
0.6017307, 1.384796, 0.2491125, 0.4862745, 0, 1, 1,
0.6023511, 0.3670542, 0.6503813, 0.4941176, 0, 1, 1,
0.6029013, -0.08981409, 0.8578975, 0.5019608, 0, 1, 1,
0.6046416, 0.2766015, -1.132673, 0.5058824, 0, 1, 1,
0.6101192, 1.283551, -0.176272, 0.5137255, 0, 1, 1,
0.6129696, 1.378693, -0.0917987, 0.5176471, 0, 1, 1,
0.6137121, -1.181677, 1.828038, 0.5254902, 0, 1, 1,
0.6187439, 0.4601159, 0.3538586, 0.5294118, 0, 1, 1,
0.6256207, -0.7191018, 3.310261, 0.5372549, 0, 1, 1,
0.6287358, 0.3667186, 1.105724, 0.5411765, 0, 1, 1,
0.6297649, 0.6514008, 0.9207802, 0.5490196, 0, 1, 1,
0.6389308, -0.5381795, 1.962202, 0.5529412, 0, 1, 1,
0.6423934, 0.8913025, -0.2894486, 0.5607843, 0, 1, 1,
0.643186, 0.3700578, 1.247373, 0.5647059, 0, 1, 1,
0.6437395, -2.91867, 2.237223, 0.572549, 0, 1, 1,
0.6439173, -0.4264267, 1.987179, 0.5764706, 0, 1, 1,
0.6441064, 0.1900424, 2.517228, 0.5843138, 0, 1, 1,
0.6455098, -0.77347, 3.621792, 0.5882353, 0, 1, 1,
0.6465046, 0.6583391, 0.03093, 0.5960785, 0, 1, 1,
0.6549285, 3.136135, -0.7135046, 0.6039216, 0, 1, 1,
0.6570174, -0.09476853, 2.636215, 0.6078432, 0, 1, 1,
0.6584134, 0.1280488, 0.5737141, 0.6156863, 0, 1, 1,
0.6628282, -1.431788, 1.953395, 0.6196079, 0, 1, 1,
0.6635023, -1.597106, 1.761767, 0.627451, 0, 1, 1,
0.6643266, 0.3508003, 2.04472, 0.6313726, 0, 1, 1,
0.6679453, 0.8975971, 0.600083, 0.6392157, 0, 1, 1,
0.6686345, -1.356503, 1.750811, 0.6431373, 0, 1, 1,
0.6741094, -0.6420012, 1.695383, 0.6509804, 0, 1, 1,
0.674437, -1.442526, 3.660705, 0.654902, 0, 1, 1,
0.6760045, 0.3442115, 1.901249, 0.6627451, 0, 1, 1,
0.67612, -0.3658482, 1.61016, 0.6666667, 0, 1, 1,
0.6772413, 0.02395878, 0.2260834, 0.6745098, 0, 1, 1,
0.6775956, 0.7355571, 0.9860249, 0.6784314, 0, 1, 1,
0.6788071, -1.082432, 2.906907, 0.6862745, 0, 1, 1,
0.6800275, -1.49824, 3.517558, 0.6901961, 0, 1, 1,
0.6836791, -0.3504996, 0.8174993, 0.6980392, 0, 1, 1,
0.6861604, 0.8692753, -1.091038, 0.7058824, 0, 1, 1,
0.6909624, 0.2104796, 1.154164, 0.7098039, 0, 1, 1,
0.6912698, -0.025925, 2.646179, 0.7176471, 0, 1, 1,
0.6915119, 0.2231926, 1.862175, 0.7215686, 0, 1, 1,
0.6915572, 0.7486352, 0.6346432, 0.7294118, 0, 1, 1,
0.7033924, -0.1212481, -0.2350636, 0.7333333, 0, 1, 1,
0.704236, -1.286459, 2.028563, 0.7411765, 0, 1, 1,
0.7067499, -0.5681261, 2.713851, 0.7450981, 0, 1, 1,
0.7236516, -0.7256821, 2.845261, 0.7529412, 0, 1, 1,
0.7295742, 1.893637, -0.4847043, 0.7568628, 0, 1, 1,
0.7334792, 1.695278, 0.8252024, 0.7647059, 0, 1, 1,
0.7337829, -0.003599298, 1.191077, 0.7686275, 0, 1, 1,
0.7380971, 1.628356, 0.3135845, 0.7764706, 0, 1, 1,
0.7391893, -0.6225707, 2.735445, 0.7803922, 0, 1, 1,
0.7420174, -0.8120204, 2.962563, 0.7882353, 0, 1, 1,
0.7422585, -0.5792737, 1.350013, 0.7921569, 0, 1, 1,
0.7502921, -0.7738756, 3.058336, 0.8, 0, 1, 1,
0.7569704, -0.06756809, 3.259051, 0.8078431, 0, 1, 1,
0.7574497, -1.220505, 3.096315, 0.8117647, 0, 1, 1,
0.764558, -0.4487958, 3.470931, 0.8196079, 0, 1, 1,
0.7696226, 1.064616, 0.6988616, 0.8235294, 0, 1, 1,
0.7718472, 0.2842519, 1.793786, 0.8313726, 0, 1, 1,
0.7725241, -0.7740165, 2.705667, 0.8352941, 0, 1, 1,
0.7774063, -0.67498, 3.184912, 0.8431373, 0, 1, 1,
0.7847348, 0.07978751, 2.337316, 0.8470588, 0, 1, 1,
0.7853808, 0.6821842, 0.3434833, 0.854902, 0, 1, 1,
0.785435, 0.612496, 1.01468, 0.8588235, 0, 1, 1,
0.7858597, -0.4984625, 0.9381496, 0.8666667, 0, 1, 1,
0.7916687, -0.006062621, 1.969331, 0.8705882, 0, 1, 1,
0.7991896, -2.083639, 3.593638, 0.8784314, 0, 1, 1,
0.8091003, -0.6079062, 2.699639, 0.8823529, 0, 1, 1,
0.8103867, 1.525212, 0.2627709, 0.8901961, 0, 1, 1,
0.8138387, -1.358139, 2.647906, 0.8941177, 0, 1, 1,
0.8168151, -1.281673, 2.901432, 0.9019608, 0, 1, 1,
0.8217405, 2.842464, -0.3892274, 0.9098039, 0, 1, 1,
0.8259965, -0.6373783, 2.934158, 0.9137255, 0, 1, 1,
0.8316431, -0.2965427, 1.979606, 0.9215686, 0, 1, 1,
0.8371853, -0.8208158, 1.185943, 0.9254902, 0, 1, 1,
0.8415503, -0.2483637, 1.431351, 0.9333333, 0, 1, 1,
0.8415814, -0.4292411, 2.855438, 0.9372549, 0, 1, 1,
0.8431289, 0.09281425, 1.262648, 0.945098, 0, 1, 1,
0.8432258, -0.3795419, 2.082615, 0.9490196, 0, 1, 1,
0.8435903, 0.3639129, 0.8642958, 0.9568627, 0, 1, 1,
0.8449303, -0.0159531, 1.006606, 0.9607843, 0, 1, 1,
0.8458271, 0.6643767, 1.589961, 0.9686275, 0, 1, 1,
0.8475991, 0.4306688, 1.407815, 0.972549, 0, 1, 1,
0.8495868, 0.4604589, 1.95383, 0.9803922, 0, 1, 1,
0.8499161, -1.659566, 3.331434, 0.9843137, 0, 1, 1,
0.8512631, 1.232991, 0.2833558, 0.9921569, 0, 1, 1,
0.8577481, 1.271826, -0.3050057, 0.9960784, 0, 1, 1,
0.8588749, -0.1721845, 0.7207654, 1, 0, 0.9960784, 1,
0.8596362, 1.027175, -1.346998, 1, 0, 0.9882353, 1,
0.861768, 0.06489476, 3.391453, 1, 0, 0.9843137, 1,
0.8728551, 0.252936, 0.2368858, 1, 0, 0.9764706, 1,
0.8740575, -0.2132272, 2.41146, 1, 0, 0.972549, 1,
0.8810505, -2.22998, 3.244625, 1, 0, 0.9647059, 1,
0.8820981, -0.2843259, 1.360294, 1, 0, 0.9607843, 1,
0.8881294, 0.7755569, 0.7106408, 1, 0, 0.9529412, 1,
0.8903993, 0.1735457, 1.051181, 1, 0, 0.9490196, 1,
0.8942851, 0.2223556, 0.9966721, 1, 0, 0.9411765, 1,
0.8962533, -1.145458, 3.140504, 1, 0, 0.9372549, 1,
0.8966454, -0.478, 3.341456, 1, 0, 0.9294118, 1,
0.9059878, 0.6908635, 0.8219219, 1, 0, 0.9254902, 1,
0.9081374, 0.1201887, 1.917003, 1, 0, 0.9176471, 1,
0.9168412, -1.352009, 2.2966, 1, 0, 0.9137255, 1,
0.9180502, 0.4146864, -0.4673097, 1, 0, 0.9058824, 1,
0.923929, -0.3154517, 3.778768, 1, 0, 0.9019608, 1,
0.9241243, 0.5298381, -1.296058, 1, 0, 0.8941177, 1,
0.9326752, -0.02616233, 2.160774, 1, 0, 0.8862745, 1,
0.9347053, -1.721417, 2.615279, 1, 0, 0.8823529, 1,
0.9381328, 1.244697, 1.478061, 1, 0, 0.8745098, 1,
0.9493706, 0.2039325, 2.062017, 1, 0, 0.8705882, 1,
0.9599667, 0.1160281, 0.8721455, 1, 0, 0.8627451, 1,
0.9629732, 1.243508, -0.2966245, 1, 0, 0.8588235, 1,
0.9671956, 0.5161833, 2.04465, 1, 0, 0.8509804, 1,
0.9673923, 0.4570206, 0.4622797, 1, 0, 0.8470588, 1,
0.968307, 1.511288, -0.2093083, 1, 0, 0.8392157, 1,
0.9735103, -0.6757774, 2.220148, 1, 0, 0.8352941, 1,
0.9749128, -0.4655541, 1.46418, 1, 0, 0.827451, 1,
0.9854244, -0.1437048, 1.87531, 1, 0, 0.8235294, 1,
0.985789, 0.2605496, 1.781952, 1, 0, 0.8156863, 1,
0.9927002, -0.1779048, 2.674314, 1, 0, 0.8117647, 1,
0.9958476, 1.122383, 1.170658, 1, 0, 0.8039216, 1,
0.9988356, 0.3563469, 1.199169, 1, 0, 0.7960784, 1,
1.00123, 0.5452753, 1.829782, 1, 0, 0.7921569, 1,
1.006696, -0.9335749, 1.779484, 1, 0, 0.7843137, 1,
1.008622, -0.5482842, 3.858403, 1, 0, 0.7803922, 1,
1.011152, 1.416239, 2.322406, 1, 0, 0.772549, 1,
1.031628, -1.256312, 2.556855, 1, 0, 0.7686275, 1,
1.031787, -0.1668784, 1.929276, 1, 0, 0.7607843, 1,
1.032068, 1.799905, 0.3987758, 1, 0, 0.7568628, 1,
1.033312, -0.5375044, 2.302646, 1, 0, 0.7490196, 1,
1.036004, 1.664672, 0.04256003, 1, 0, 0.7450981, 1,
1.03759, 0.2130864, 2.552267, 1, 0, 0.7372549, 1,
1.040364, 0.4278458, 0.8323676, 1, 0, 0.7333333, 1,
1.042069, -0.180055, 1.613251, 1, 0, 0.7254902, 1,
1.043517, -0.4607254, 3.193945, 1, 0, 0.7215686, 1,
1.052877, 2.21598, 0.03486282, 1, 0, 0.7137255, 1,
1.061731, -1.427619, 4.214043, 1, 0, 0.7098039, 1,
1.071055, -1.024587, 0.8754026, 1, 0, 0.7019608, 1,
1.073122, 1.453238, 1.300783, 1, 0, 0.6941177, 1,
1.095567, -0.08267646, 3.591617, 1, 0, 0.6901961, 1,
1.095669, 1.297626, 0.3669066, 1, 0, 0.682353, 1,
1.097933, -0.3623323, 0.6794472, 1, 0, 0.6784314, 1,
1.130107, 0.222787, 1.681469, 1, 0, 0.6705883, 1,
1.132959, 1.470594, -0.05601133, 1, 0, 0.6666667, 1,
1.132998, -0.2052861, 0.5927358, 1, 0, 0.6588235, 1,
1.163142, -1.007138, 1.584205, 1, 0, 0.654902, 1,
1.16926, -0.9887471, 4.955178, 1, 0, 0.6470588, 1,
1.173559, -0.9637814, 2.574857, 1, 0, 0.6431373, 1,
1.175779, -2.228003, 2.109369, 1, 0, 0.6352941, 1,
1.1824, 1.248966, 0.6393829, 1, 0, 0.6313726, 1,
1.18915, -0.3553455, 1.752991, 1, 0, 0.6235294, 1,
1.193588, -0.4208279, 4.207466, 1, 0, 0.6196079, 1,
1.199879, -0.009126442, 1.907683, 1, 0, 0.6117647, 1,
1.208033, -0.620058, 4.561738, 1, 0, 0.6078432, 1,
1.213344, 1.497212, 1.329558, 1, 0, 0.6, 1,
1.214225, -0.5039479, 1.989451, 1, 0, 0.5921569, 1,
1.219635, 0.409805, 2.257484, 1, 0, 0.5882353, 1,
1.224275, -0.2925422, 2.881887, 1, 0, 0.5803922, 1,
1.23105, -0.9224418, 3.218721, 1, 0, 0.5764706, 1,
1.233978, 0.4497328, 0.8021489, 1, 0, 0.5686275, 1,
1.234362, -0.1885562, 0.8473104, 1, 0, 0.5647059, 1,
1.255435, -0.1154266, 2.018768, 1, 0, 0.5568628, 1,
1.264681, 0.4141363, -0.3877837, 1, 0, 0.5529412, 1,
1.269579, -0.7766694, 1.732551, 1, 0, 0.5450981, 1,
1.285885, 0.02086243, 1.865332, 1, 0, 0.5411765, 1,
1.290765, -0.188466, 2.654137, 1, 0, 0.5333334, 1,
1.295158, 0.4094904, 0.2037188, 1, 0, 0.5294118, 1,
1.300307, 0.2401097, 1.390551, 1, 0, 0.5215687, 1,
1.301276, 0.9995429, 0.8338772, 1, 0, 0.5176471, 1,
1.311779, 1.210468, -1.260842, 1, 0, 0.509804, 1,
1.312318, 0.5599599, 1.546402, 1, 0, 0.5058824, 1,
1.323171, 0.820726, 0.6598262, 1, 0, 0.4980392, 1,
1.325428, -0.6122931, 3.263447, 1, 0, 0.4901961, 1,
1.373702, 1.612318, 1.26087, 1, 0, 0.4862745, 1,
1.374449, 1.027986, 1.824437, 1, 0, 0.4784314, 1,
1.37531, 0.5815219, 1.706759, 1, 0, 0.4745098, 1,
1.381941, 0.1019317, 3.571077, 1, 0, 0.4666667, 1,
1.38535, -1.280263, 1.438685, 1, 0, 0.4627451, 1,
1.386733, -0.1444893, 0.09572037, 1, 0, 0.454902, 1,
1.397, 0.3177612, -0.7842402, 1, 0, 0.4509804, 1,
1.406362, -0.2831831, 1.598777, 1, 0, 0.4431373, 1,
1.407582, -0.1982353, 1.713507, 1, 0, 0.4392157, 1,
1.410539, 0.7014959, 0.4901586, 1, 0, 0.4313726, 1,
1.417577, 2.226782, 1.340941, 1, 0, 0.427451, 1,
1.420428, 1.752407, 1.83804, 1, 0, 0.4196078, 1,
1.423338, -1.448318, 3.332637, 1, 0, 0.4156863, 1,
1.423859, -0.03605083, 0.120585, 1, 0, 0.4078431, 1,
1.427306, 0.2661125, 1.615045, 1, 0, 0.4039216, 1,
1.437068, 0.388409, 1.184316, 1, 0, 0.3960784, 1,
1.448966, -1.750122, 1.789668, 1, 0, 0.3882353, 1,
1.451546, -1.797527, 1.037105, 1, 0, 0.3843137, 1,
1.451882, -0.1385304, 0.08358731, 1, 0, 0.3764706, 1,
1.453103, 0.9150791, 1.069147, 1, 0, 0.372549, 1,
1.476327, -0.5258886, 1.270812, 1, 0, 0.3647059, 1,
1.491545, 0.08924035, 1.098464, 1, 0, 0.3607843, 1,
1.506265, -0.1442006, 2.859559, 1, 0, 0.3529412, 1,
1.506428, -1.124924, 4.972126, 1, 0, 0.3490196, 1,
1.512327, 0.06011934, 1.29324, 1, 0, 0.3411765, 1,
1.527029, 0.6210006, 2.541125, 1, 0, 0.3372549, 1,
1.542747, 0.8731892, 1.314063, 1, 0, 0.3294118, 1,
1.548262, -0.09525476, 0.4479043, 1, 0, 0.3254902, 1,
1.555822, 0.6898352, 1.64514, 1, 0, 0.3176471, 1,
1.582119, 0.8546698, 0.708599, 1, 0, 0.3137255, 1,
1.586425, 0.5791458, -1.42005, 1, 0, 0.3058824, 1,
1.619065, -1.225291, 3.558056, 1, 0, 0.2980392, 1,
1.635885, 1.454502, 1.806472, 1, 0, 0.2941177, 1,
1.639825, -0.7361731, 1.43959, 1, 0, 0.2862745, 1,
1.655509, -0.06416852, 2.661726, 1, 0, 0.282353, 1,
1.658745, -0.07946578, 1.909338, 1, 0, 0.2745098, 1,
1.665265, -1.856814, 2.822512, 1, 0, 0.2705882, 1,
1.666222, -1.106014, 1.008499, 1, 0, 0.2627451, 1,
1.675286, 0.734506, -0.5865852, 1, 0, 0.2588235, 1,
1.685566, 0.6330876, 2.003334, 1, 0, 0.2509804, 1,
1.693598, 1.612957, 1.295033, 1, 0, 0.2470588, 1,
1.695682, 0.4838278, 0.2411117, 1, 0, 0.2392157, 1,
1.716712, 1.130679, 1.87811, 1, 0, 0.2352941, 1,
1.743499, 0.122647, 1.635208, 1, 0, 0.227451, 1,
1.744614, -0.7563162, 2.443658, 1, 0, 0.2235294, 1,
1.766057, -1.242826, 3.858522, 1, 0, 0.2156863, 1,
1.773246, -0.7317612, 1.945541, 1, 0, 0.2117647, 1,
1.805992, -1.666932, 2.796157, 1, 0, 0.2039216, 1,
1.824122, 1.536692, 0.7712649, 1, 0, 0.1960784, 1,
1.854425, 0.2889425, 1.442203, 1, 0, 0.1921569, 1,
1.877534, -0.9183519, 2.231048, 1, 0, 0.1843137, 1,
1.881049, -0.6350418, 2.458346, 1, 0, 0.1803922, 1,
1.916311, 1.100632, -1.895979, 1, 0, 0.172549, 1,
1.927036, 2.058401, 3.388711, 1, 0, 0.1686275, 1,
1.948373, 0.09362663, 0.1895067, 1, 0, 0.1607843, 1,
1.95827, -0.3341649, 1.088035, 1, 0, 0.1568628, 1,
1.97631, 0.5419104, 1.554763, 1, 0, 0.1490196, 1,
1.983663, -0.8957944, 1.667941, 1, 0, 0.145098, 1,
2.018916, 0.4925283, 1.416844, 1, 0, 0.1372549, 1,
2.033693, 0.2713992, 1.062584, 1, 0, 0.1333333, 1,
2.062393, -0.6994084, 0.8080225, 1, 0, 0.1254902, 1,
2.065297, 0.235738, 1.285981, 1, 0, 0.1215686, 1,
2.06846, 0.1623103, 3.400411, 1, 0, 0.1137255, 1,
2.073773, -0.09409934, 1.622564, 1, 0, 0.1098039, 1,
2.111741, -1.423909, 4.735938, 1, 0, 0.1019608, 1,
2.113438, -0.5322993, -0.1315066, 1, 0, 0.09411765, 1,
2.147968, 1.036513, 1.121454, 1, 0, 0.09019608, 1,
2.15608, 0.8426805, 1.641987, 1, 0, 0.08235294, 1,
2.176531, 0.4228413, 0.7670744, 1, 0, 0.07843138, 1,
2.239601, 0.8394837, 2.564917, 1, 0, 0.07058824, 1,
2.250641, 0.06282455, 0.726173, 1, 0, 0.06666667, 1,
2.263056, 0.4326291, 2.168639, 1, 0, 0.05882353, 1,
2.293314, -0.7830555, 1.170069, 1, 0, 0.05490196, 1,
2.294373, 1.188192, 1.288483, 1, 0, 0.04705882, 1,
2.297629, 0.1249877, 1.352577, 1, 0, 0.04313726, 1,
2.421865, -0.9886782, 2.609611, 1, 0, 0.03529412, 1,
2.489013, -1.454173, 4.490537, 1, 0, 0.03137255, 1,
2.628659, 0.4320109, 1.929973, 1, 0, 0.02352941, 1,
2.787317, 0.3242152, 1.106219, 1, 0, 0.01960784, 1,
3.004887, 1.173911, 0.8393342, 1, 0, 0.01176471, 1,
3.240346, -0.02961476, 1.218296, 1, 0, 0.007843138, 1
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
-0.2775584, -4.049485, -7.918554, 0, -0.5, 0.5, 0.5,
-0.2775584, -4.049485, -7.918554, 1, -0.5, 0.5, 0.5,
-0.2775584, -4.049485, -7.918554, 1, 1.5, 0.5, 0.5,
-0.2775584, -4.049485, -7.918554, 0, 1.5, 0.5, 0.5
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
-4.988033, 0.06696582, -7.918554, 0, -0.5, 0.5, 0.5,
-4.988033, 0.06696582, -7.918554, 1, -0.5, 0.5, 0.5,
-4.988033, 0.06696582, -7.918554, 1, 1.5, 0.5, 0.5,
-4.988033, 0.06696582, -7.918554, 0, 1.5, 0.5, 0.5
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
-4.988033, -4.049485, -0.5390666, 0, -0.5, 0.5, 0.5,
-4.988033, -4.049485, -0.5390666, 1, -0.5, 0.5, 0.5,
-4.988033, -4.049485, -0.5390666, 1, 1.5, 0.5, 0.5,
-4.988033, -4.049485, -0.5390666, 0, 1.5, 0.5, 0.5
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
-2, -3.099535, -6.215595,
2, -3.099535, -6.215595,
-2, -3.099535, -6.215595,
-2, -3.25786, -6.499422,
0, -3.099535, -6.215595,
0, -3.25786, -6.499422,
2, -3.099535, -6.215595,
2, -3.25786, -6.499422
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
-2, -3.57451, -7.067075, 0, -0.5, 0.5, 0.5,
-2, -3.57451, -7.067075, 1, -0.5, 0.5, 0.5,
-2, -3.57451, -7.067075, 1, 1.5, 0.5, 0.5,
-2, -3.57451, -7.067075, 0, 1.5, 0.5, 0.5,
0, -3.57451, -7.067075, 0, -0.5, 0.5, 0.5,
0, -3.57451, -7.067075, 1, -0.5, 0.5, 0.5,
0, -3.57451, -7.067075, 1, 1.5, 0.5, 0.5,
0, -3.57451, -7.067075, 0, 1.5, 0.5, 0.5,
2, -3.57451, -7.067075, 0, -0.5, 0.5, 0.5,
2, -3.57451, -7.067075, 1, -0.5, 0.5, 0.5,
2, -3.57451, -7.067075, 1, 1.5, 0.5, 0.5,
2, -3.57451, -7.067075, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.901, -3, -6.215595,
-3.901, 3, -6.215595,
-3.901, -3, -6.215595,
-4.082172, -3, -6.499422,
-3.901, -2, -6.215595,
-4.082172, -2, -6.499422,
-3.901, -1, -6.215595,
-4.082172, -1, -6.499422,
-3.901, 0, -6.215595,
-4.082172, 0, -6.499422,
-3.901, 1, -6.215595,
-4.082172, 1, -6.499422,
-3.901, 2, -6.215595,
-4.082172, 2, -6.499422,
-3.901, 3, -6.215595,
-4.082172, 3, -6.499422
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
-4.444517, -3, -7.067075, 0, -0.5, 0.5, 0.5,
-4.444517, -3, -7.067075, 1, -0.5, 0.5, 0.5,
-4.444517, -3, -7.067075, 1, 1.5, 0.5, 0.5,
-4.444517, -3, -7.067075, 0, 1.5, 0.5, 0.5,
-4.444517, -2, -7.067075, 0, -0.5, 0.5, 0.5,
-4.444517, -2, -7.067075, 1, -0.5, 0.5, 0.5,
-4.444517, -2, -7.067075, 1, 1.5, 0.5, 0.5,
-4.444517, -2, -7.067075, 0, 1.5, 0.5, 0.5,
-4.444517, -1, -7.067075, 0, -0.5, 0.5, 0.5,
-4.444517, -1, -7.067075, 1, -0.5, 0.5, 0.5,
-4.444517, -1, -7.067075, 1, 1.5, 0.5, 0.5,
-4.444517, -1, -7.067075, 0, 1.5, 0.5, 0.5,
-4.444517, 0, -7.067075, 0, -0.5, 0.5, 0.5,
-4.444517, 0, -7.067075, 1, -0.5, 0.5, 0.5,
-4.444517, 0, -7.067075, 1, 1.5, 0.5, 0.5,
-4.444517, 0, -7.067075, 0, 1.5, 0.5, 0.5,
-4.444517, 1, -7.067075, 0, -0.5, 0.5, 0.5,
-4.444517, 1, -7.067075, 1, -0.5, 0.5, 0.5,
-4.444517, 1, -7.067075, 1, 1.5, 0.5, 0.5,
-4.444517, 1, -7.067075, 0, 1.5, 0.5, 0.5,
-4.444517, 2, -7.067075, 0, -0.5, 0.5, 0.5,
-4.444517, 2, -7.067075, 1, -0.5, 0.5, 0.5,
-4.444517, 2, -7.067075, 1, 1.5, 0.5, 0.5,
-4.444517, 2, -7.067075, 0, 1.5, 0.5, 0.5,
-4.444517, 3, -7.067075, 0, -0.5, 0.5, 0.5,
-4.444517, 3, -7.067075, 1, -0.5, 0.5, 0.5,
-4.444517, 3, -7.067075, 1, 1.5, 0.5, 0.5,
-4.444517, 3, -7.067075, 0, 1.5, 0.5, 0.5
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
-3.901, -3.099535, -6,
-3.901, -3.099535, 4,
-3.901, -3.099535, -6,
-4.082172, -3.25786, -6,
-3.901, -3.099535, -4,
-4.082172, -3.25786, -4,
-3.901, -3.099535, -2,
-4.082172, -3.25786, -2,
-3.901, -3.099535, 0,
-4.082172, -3.25786, 0,
-3.901, -3.099535, 2,
-4.082172, -3.25786, 2,
-3.901, -3.099535, 4,
-4.082172, -3.25786, 4
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
-4.444517, -3.57451, -6, 0, -0.5, 0.5, 0.5,
-4.444517, -3.57451, -6, 1, -0.5, 0.5, 0.5,
-4.444517, -3.57451, -6, 1, 1.5, 0.5, 0.5,
-4.444517, -3.57451, -6, 0, 1.5, 0.5, 0.5,
-4.444517, -3.57451, -4, 0, -0.5, 0.5, 0.5,
-4.444517, -3.57451, -4, 1, -0.5, 0.5, 0.5,
-4.444517, -3.57451, -4, 1, 1.5, 0.5, 0.5,
-4.444517, -3.57451, -4, 0, 1.5, 0.5, 0.5,
-4.444517, -3.57451, -2, 0, -0.5, 0.5, 0.5,
-4.444517, -3.57451, -2, 1, -0.5, 0.5, 0.5,
-4.444517, -3.57451, -2, 1, 1.5, 0.5, 0.5,
-4.444517, -3.57451, -2, 0, 1.5, 0.5, 0.5,
-4.444517, -3.57451, 0, 0, -0.5, 0.5, 0.5,
-4.444517, -3.57451, 0, 1, -0.5, 0.5, 0.5,
-4.444517, -3.57451, 0, 1, 1.5, 0.5, 0.5,
-4.444517, -3.57451, 0, 0, 1.5, 0.5, 0.5,
-4.444517, -3.57451, 2, 0, -0.5, 0.5, 0.5,
-4.444517, -3.57451, 2, 1, -0.5, 0.5, 0.5,
-4.444517, -3.57451, 2, 1, 1.5, 0.5, 0.5,
-4.444517, -3.57451, 2, 0, 1.5, 0.5, 0.5,
-4.444517, -3.57451, 4, 0, -0.5, 0.5, 0.5,
-4.444517, -3.57451, 4, 1, -0.5, 0.5, 0.5,
-4.444517, -3.57451, 4, 1, 1.5, 0.5, 0.5,
-4.444517, -3.57451, 4, 0, 1.5, 0.5, 0.5
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
-3.901, -3.099535, -6.215595,
-3.901, 3.233467, -6.215595,
-3.901, -3.099535, 5.137462,
-3.901, 3.233467, 5.137462,
-3.901, -3.099535, -6.215595,
-3.901, -3.099535, 5.137462,
-3.901, 3.233467, -6.215595,
-3.901, 3.233467, 5.137462,
-3.901, -3.099535, -6.215595,
3.345884, -3.099535, -6.215595,
-3.901, -3.099535, 5.137462,
3.345884, -3.099535, 5.137462,
-3.901, 3.233467, -6.215595,
3.345884, 3.233467, -6.215595,
-3.901, 3.233467, 5.137462,
3.345884, 3.233467, 5.137462,
3.345884, -3.099535, -6.215595,
3.345884, 3.233467, -6.215595,
3.345884, -3.099535, 5.137462,
3.345884, 3.233467, 5.137462,
3.345884, -3.099535, -6.215595,
3.345884, -3.099535, 5.137462,
3.345884, 3.233467, -6.215595,
3.345884, 3.233467, 5.137462
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
var radius = 7.947457;
var distance = 35.35913;
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
mvMatrix.translate( 0.2775584, -0.06696582, 0.5390666 );
mvMatrix.scale( 1.185744, 1.356852, 0.7568839 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.35913);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Phenothrin<-read.table("Phenothrin.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Phenothrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Phenothrin' not found
```

```r
y<-Phenothrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Phenothrin' not found
```

```r
z<-Phenothrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Phenothrin' not found
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
-3.795463, -1.193748, -3.165287, 0, 0, 1, 1, 1,
-3.436976, -0.319078, -1.158229, 1, 0, 0, 1, 1,
-3.025488, 0.1748281, -1.639072, 1, 0, 0, 1, 1,
-2.884822, -0.8421435, -2.624188, 1, 0, 0, 1, 1,
-2.813083, 1.543941, -0.9178412, 1, 0, 0, 1, 1,
-2.555817, -0.2150246, -0.1225955, 1, 0, 0, 1, 1,
-2.447003, 0.8018088, -2.531695, 0, 0, 0, 1, 1,
-2.386377, -1.177955, -1.260257, 0, 0, 0, 1, 1,
-2.377024, 0.1111762, -0.7663506, 0, 0, 0, 1, 1,
-2.349877, -1.222468, -2.373839, 0, 0, 0, 1, 1,
-2.34099, 0.7285308, -0.9343303, 0, 0, 0, 1, 1,
-2.32164, -0.4234522, -1.314115, 0, 0, 0, 1, 1,
-2.227012, 0.1729175, 0.5383414, 0, 0, 0, 1, 1,
-2.223919, -0.7618981, -3.11066, 1, 1, 1, 1, 1,
-2.181927, 0.2864451, 0.1801372, 1, 1, 1, 1, 1,
-2.160941, -2.498305, -1.340879, 1, 1, 1, 1, 1,
-2.156018, -0.4240245, -1.534218, 1, 1, 1, 1, 1,
-2.143962, 0.1955413, -2.176669, 1, 1, 1, 1, 1,
-2.130827, -0.5777425, -1.558711, 1, 1, 1, 1, 1,
-2.100533, 0.005748165, -0.7750596, 1, 1, 1, 1, 1,
-2.097917, -1.657951, -3.048614, 1, 1, 1, 1, 1,
-2.059664, 1.472944, -0.8168687, 1, 1, 1, 1, 1,
-2.004872, -0.298179, -1.052503, 1, 1, 1, 1, 1,
-1.982566, 3.141238, -1.893725, 1, 1, 1, 1, 1,
-1.967779, 2.070188, 1.076277, 1, 1, 1, 1, 1,
-1.868491, -0.8095371, -2.472078, 1, 1, 1, 1, 1,
-1.865731, -0.7393888, -2.883679, 1, 1, 1, 1, 1,
-1.843866, -0.4307891, -1.782089, 1, 1, 1, 1, 1,
-1.835553, 0.7433571, 0.2364676, 0, 0, 1, 1, 1,
-1.834146, -0.4834097, -2.371965, 1, 0, 0, 1, 1,
-1.82739, -2.101251, -4.046299, 1, 0, 0, 1, 1,
-1.801446, 2.457112, -1.134557, 1, 0, 0, 1, 1,
-1.796636, -0.3373497, -4.952256, 1, 0, 0, 1, 1,
-1.776387, -0.9479404, -2.478637, 1, 0, 0, 1, 1,
-1.776267, -1.338382, -2.339671, 0, 0, 0, 1, 1,
-1.746795, -0.2782509, -2.965829, 0, 0, 0, 1, 1,
-1.7448, 0.4764589, -1.283615, 0, 0, 0, 1, 1,
-1.731357, 0.2443935, -1.414643, 0, 0, 0, 1, 1,
-1.722705, -2.063866, -2.753816, 0, 0, 0, 1, 1,
-1.711705, 0.2665758, -2.531838, 0, 0, 0, 1, 1,
-1.711531, -0.8993456, -2.384113, 0, 0, 0, 1, 1,
-1.683745, -0.1158316, -0.8984184, 1, 1, 1, 1, 1,
-1.674098, 0.8406307, -3.56429, 1, 1, 1, 1, 1,
-1.669013, 0.4313959, -1.815143, 1, 1, 1, 1, 1,
-1.663917, 0.5184731, -2.141907, 1, 1, 1, 1, 1,
-1.660629, -0.5595579, -2.329924, 1, 1, 1, 1, 1,
-1.637882, 2.181133, -2.434288, 1, 1, 1, 1, 1,
-1.633609, -0.2970514, -2.319777, 1, 1, 1, 1, 1,
-1.616127, 1.617638, -1.478164, 1, 1, 1, 1, 1,
-1.610902, -0.2060071, -1.732078, 1, 1, 1, 1, 1,
-1.598561, -0.3805659, -0.9012944, 1, 1, 1, 1, 1,
-1.582579, 0.7663624, -1.314924, 1, 1, 1, 1, 1,
-1.577717, -0.9551197, -2.368796, 1, 1, 1, 1, 1,
-1.573456, -0.8197214, -2.120193, 1, 1, 1, 1, 1,
-1.567406, -1.170725, -2.086033, 1, 1, 1, 1, 1,
-1.565284, -2.468002, -2.882309, 1, 1, 1, 1, 1,
-1.552872, 0.1879761, -1.003754, 0, 0, 1, 1, 1,
-1.532312, 1.839689, -0.2302718, 1, 0, 0, 1, 1,
-1.528987, 0.2748476, -0.05924688, 1, 0, 0, 1, 1,
-1.528515, -0.1235935, -2.709574, 1, 0, 0, 1, 1,
-1.522237, 0.4331012, -1.602798, 1, 0, 0, 1, 1,
-1.518051, -0.7795033, -0.277071, 1, 0, 0, 1, 1,
-1.512506, -1.307145, -2.375628, 0, 0, 0, 1, 1,
-1.5042, 0.6679981, 0.6433094, 0, 0, 0, 1, 1,
-1.478416, 0.09901816, -1.478571, 0, 0, 0, 1, 1,
-1.470067, 0.7658959, -0.6287048, 0, 0, 0, 1, 1,
-1.446481, 0.3610438, -0.3432935, 0, 0, 0, 1, 1,
-1.436996, -0.6715446, -1.572341, 0, 0, 0, 1, 1,
-1.424144, 0.995934, -0.9639133, 0, 0, 0, 1, 1,
-1.413069, -0.6021054, -0.8630464, 1, 1, 1, 1, 1,
-1.407894, 1.371848, 2.661237, 1, 1, 1, 1, 1,
-1.406293, 0.9647949, 0.7460873, 1, 1, 1, 1, 1,
-1.402121, -0.2953808, -2.131552, 1, 1, 1, 1, 1,
-1.399119, -0.9051528, -3.191835, 1, 1, 1, 1, 1,
-1.389166, -2.026653, -2.186647, 1, 1, 1, 1, 1,
-1.381205, -0.8056079, -3.071136, 1, 1, 1, 1, 1,
-1.379699, 1.051293, -0.3529521, 1, 1, 1, 1, 1,
-1.375192, 0.1136217, -2.538801, 1, 1, 1, 1, 1,
-1.366198, 0.7404673, -0.731939, 1, 1, 1, 1, 1,
-1.363541, -0.6978905, -1.768711, 1, 1, 1, 1, 1,
-1.352886, 0.8906761, -1.168216, 1, 1, 1, 1, 1,
-1.352113, 0.4117908, -0.1288371, 1, 1, 1, 1, 1,
-1.349725, -1.03588, -4.634942, 1, 1, 1, 1, 1,
-1.344325, -0.9285616, -4.438143, 1, 1, 1, 1, 1,
-1.329675, -1.511409, -2.363776, 0, 0, 1, 1, 1,
-1.329462, -0.3352343, -1.026308, 1, 0, 0, 1, 1,
-1.325724, -0.1241234, -0.7643844, 1, 0, 0, 1, 1,
-1.322738, -0.05294089, -1.229967, 1, 0, 0, 1, 1,
-1.32102, 0.9427952, -1.172432, 1, 0, 0, 1, 1,
-1.318439, -0.03015462, -0.4012522, 1, 0, 0, 1, 1,
-1.315174, -0.8477131, -1.789007, 0, 0, 0, 1, 1,
-1.306492, 1.298313, -0.4872383, 0, 0, 0, 1, 1,
-1.295056, -1.289677, -1.62618, 0, 0, 0, 1, 1,
-1.294663, 0.3059922, -0.6958836, 0, 0, 0, 1, 1,
-1.292962, 0.7287245, -1.053122, 0, 0, 0, 1, 1,
-1.284747, 0.6800606, -1.677111, 0, 0, 0, 1, 1,
-1.281849, 1.339361, -0.7212597, 0, 0, 0, 1, 1,
-1.272938, 0.2017849, -2.801164, 1, 1, 1, 1, 1,
-1.271679, -0.791715, -2.408636, 1, 1, 1, 1, 1,
-1.263732, 0.6186641, 0.0009819585, 1, 1, 1, 1, 1,
-1.245126, 0.2103451, 0.752426, 1, 1, 1, 1, 1,
-1.232258, -1.655649, -4.256117, 1, 1, 1, 1, 1,
-1.218952, 0.774965, 2.103066, 1, 1, 1, 1, 1,
-1.215825, -0.5160903, -2.109944, 1, 1, 1, 1, 1,
-1.21441, -1.10525, -2.502542, 1, 1, 1, 1, 1,
-1.214258, -0.2206809, -0.0658002, 1, 1, 1, 1, 1,
-1.214139, 1.607498, -1.384007, 1, 1, 1, 1, 1,
-1.204046, -1.016658, -3.165396, 1, 1, 1, 1, 1,
-1.201891, -0.1949219, -0.9375577, 1, 1, 1, 1, 1,
-1.196826, 0.7705737, -2.526944, 1, 1, 1, 1, 1,
-1.193582, 1.313052, 0.4010867, 1, 1, 1, 1, 1,
-1.186846, 0.5838107, -1.696962, 1, 1, 1, 1, 1,
-1.17551, 0.766593, -2.087785, 0, 0, 1, 1, 1,
-1.173571, 1.958911, 0.2733871, 1, 0, 0, 1, 1,
-1.148852, -0.7693203, -1.844723, 1, 0, 0, 1, 1,
-1.139294, 1.407496, -0.2282697, 1, 0, 0, 1, 1,
-1.135984, 0.1097007, -1.454924, 1, 0, 0, 1, 1,
-1.131726, 0.02889672, -1.353738, 1, 0, 0, 1, 1,
-1.131656, 1.207043, -1.309303, 0, 0, 0, 1, 1,
-1.124367, -0.3950591, -3.430695, 0, 0, 0, 1, 1,
-1.112131, 0.2373199, -1.74296, 0, 0, 0, 1, 1,
-1.104759, 0.5448375, -0.08121002, 0, 0, 0, 1, 1,
-1.102456, 0.1437691, -0.9586826, 0, 0, 0, 1, 1,
-1.097937, -1.265104, -4.285576, 0, 0, 0, 1, 1,
-1.093254, -2.097466, -3.968933, 0, 0, 0, 1, 1,
-1.088158, 2.64368, -1.395475, 1, 1, 1, 1, 1,
-1.058113, 0.7058163, -0.2251458, 1, 1, 1, 1, 1,
-1.056516, 0.7949786, -0.5794885, 1, 1, 1, 1, 1,
-1.051316, -1.121574, -2.623032, 1, 1, 1, 1, 1,
-1.049102, 1.376907, -0.06256651, 1, 1, 1, 1, 1,
-1.045393, 0.8792459, -1.539856, 1, 1, 1, 1, 1,
-1.04489, -0.1685353, -2.247465, 1, 1, 1, 1, 1,
-1.042286, -1.023039, -1.437394, 1, 1, 1, 1, 1,
-1.03614, 0.2791233, -1.778749, 1, 1, 1, 1, 1,
-1.036029, 0.4210396, -0.02798479, 1, 1, 1, 1, 1,
-1.034111, -0.04750356, -0.7985072, 1, 1, 1, 1, 1,
-1.026535, -2.011568, -3.828593, 1, 1, 1, 1, 1,
-1.025646, -2.070375, -0.5176416, 1, 1, 1, 1, 1,
-1.021439, 1.036185, -2.337364, 1, 1, 1, 1, 1,
-1.019277, 1.470379, -1.540673, 1, 1, 1, 1, 1,
-1.015199, 1.11361, -0.7189351, 0, 0, 1, 1, 1,
-1.014316, -0.7423282, 0.6249474, 1, 0, 0, 1, 1,
-1.013409, 2.085043, -1.498137, 1, 0, 0, 1, 1,
-1.012693, 1.708208, -1.372606, 1, 0, 0, 1, 1,
-1.00788, -0.3442221, -3.437737, 1, 0, 0, 1, 1,
-1.006112, 0.09496681, -0.2962443, 1, 0, 0, 1, 1,
-0.9970992, -0.9374962, -2.877402, 0, 0, 0, 1, 1,
-0.9941735, 0.01727555, -1.839354, 0, 0, 0, 1, 1,
-0.9889256, 0.5580952, -0.1873469, 0, 0, 0, 1, 1,
-0.9836253, 0.4019089, -2.250407, 0, 0, 0, 1, 1,
-0.9772753, -1.043092, -3.852427, 0, 0, 0, 1, 1,
-0.9742525, 0.1116017, -1.157742, 0, 0, 0, 1, 1,
-0.9724598, 0.02158878, -3.282816, 0, 0, 0, 1, 1,
-0.9660378, 0.7055851, -0.2390879, 1, 1, 1, 1, 1,
-0.9653486, 1.147022, -1.781002, 1, 1, 1, 1, 1,
-0.9624904, -0.03264097, -2.360003, 1, 1, 1, 1, 1,
-0.9591575, 0.6238578, -1.743055, 1, 1, 1, 1, 1,
-0.956873, 0.2180729, -0.07156995, 1, 1, 1, 1, 1,
-0.9460719, -0.2125064, -0.05167092, 1, 1, 1, 1, 1,
-0.9432393, -0.8878089, -2.114822, 1, 1, 1, 1, 1,
-0.9429014, -0.8900264, -1.548406, 1, 1, 1, 1, 1,
-0.9419985, -1.02531, -1.059216, 1, 1, 1, 1, 1,
-0.9402882, -0.2442544, -1.166856, 1, 1, 1, 1, 1,
-0.9375728, -1.2312, -3.644612, 1, 1, 1, 1, 1,
-0.9313039, 1.207336, -0.01737047, 1, 1, 1, 1, 1,
-0.9306675, 0.9452718, 0.5932706, 1, 1, 1, 1, 1,
-0.9294927, 0.1791536, -0.9916587, 1, 1, 1, 1, 1,
-0.9274796, -1.431784, -3.281464, 1, 1, 1, 1, 1,
-0.9224763, 1.599125, 0.006374715, 0, 0, 1, 1, 1,
-0.9201679, 0.3146149, -1.667692, 1, 0, 0, 1, 1,
-0.9177548, 0.5338663, -0.7757905, 1, 0, 0, 1, 1,
-0.9137203, 2.09609, 0.4640254, 1, 0, 0, 1, 1,
-0.9116646, -0.8062302, -0.04551453, 1, 0, 0, 1, 1,
-0.9079765, -1.096875, -0.763316, 1, 0, 0, 1, 1,
-0.9006306, -0.2808767, -2.042089, 0, 0, 0, 1, 1,
-0.8936971, 0.7483595, -1.069896, 0, 0, 0, 1, 1,
-0.893461, -1.189149, -4.392251, 0, 0, 0, 1, 1,
-0.8872828, -2.68803, -2.376302, 0, 0, 0, 1, 1,
-0.8870714, -0.05359153, -1.375504, 0, 0, 0, 1, 1,
-0.8869351, 0.03416473, -0.8012478, 0, 0, 0, 1, 1,
-0.8860583, -1.946181, -3.046423, 0, 0, 0, 1, 1,
-0.8854854, 0.07578798, -2.538268, 1, 1, 1, 1, 1,
-0.8839941, -0.621661, -0.4517845, 1, 1, 1, 1, 1,
-0.8805887, -0.2202209, -0.7065272, 1, 1, 1, 1, 1,
-0.8789576, 0.8774199, -0.2852375, 1, 1, 1, 1, 1,
-0.8714638, 0.9648767, -2.433286, 1, 1, 1, 1, 1,
-0.8638415, -1.723173, -2.888071, 1, 1, 1, 1, 1,
-0.8631035, 0.1558018, -1.001617, 1, 1, 1, 1, 1,
-0.8571604, 0.08227056, -0.9065729, 1, 1, 1, 1, 1,
-0.8566033, -0.5441328, -3.415729, 1, 1, 1, 1, 1,
-0.8497274, -0.451981, -3.043453, 1, 1, 1, 1, 1,
-0.8493984, 0.1398308, -0.6204726, 1, 1, 1, 1, 1,
-0.8470575, -0.0401285, -0.7862254, 1, 1, 1, 1, 1,
-0.8448799, -1.020508, -3.549455, 1, 1, 1, 1, 1,
-0.8437278, 0.07300351, -1.988049, 1, 1, 1, 1, 1,
-0.8402188, -0.5516686, -3.818361, 1, 1, 1, 1, 1,
-0.8387866, 1.678246, -0.4757117, 0, 0, 1, 1, 1,
-0.8383791, -1.313187, -2.480522, 1, 0, 0, 1, 1,
-0.8320996, -0.4739726, -3.260242, 1, 0, 0, 1, 1,
-0.8270768, 0.7871451, -0.1121718, 1, 0, 0, 1, 1,
-0.826001, -0.2403153, -2.821242, 1, 0, 0, 1, 1,
-0.8211419, -0.3025931, -2.332609, 1, 0, 0, 1, 1,
-0.8187101, -0.1757788, -2.668143, 0, 0, 0, 1, 1,
-0.8186143, 0.3010345, -0.3391978, 0, 0, 0, 1, 1,
-0.8174093, -0.1470346, -2.161559, 0, 0, 0, 1, 1,
-0.8168276, -1.448565, -3.952341, 0, 0, 0, 1, 1,
-0.8161307, 0.4838328, -0.04081791, 0, 0, 0, 1, 1,
-0.8143914, -0.5454044, -2.075191, 0, 0, 0, 1, 1,
-0.8028662, -0.6635479, -0.5811484, 0, 0, 0, 1, 1,
-0.8028007, -0.3716989, -2.797099, 1, 1, 1, 1, 1,
-0.8019674, 1.227801, -0.6952004, 1, 1, 1, 1, 1,
-0.8019601, -0.4355837, -1.9694, 1, 1, 1, 1, 1,
-0.8003138, 1.360574, 0.2363376, 1, 1, 1, 1, 1,
-0.7980394, -1.33413, -1.85248, 1, 1, 1, 1, 1,
-0.7885184, -0.214314, -2.308073, 1, 1, 1, 1, 1,
-0.7867026, 0.5717131, -1.196528, 1, 1, 1, 1, 1,
-0.7747508, 2.264153, -0.01013894, 1, 1, 1, 1, 1,
-0.7718852, 0.5524269, 0.2823986, 1, 1, 1, 1, 1,
-0.7714801, -1.924366, -2.118622, 1, 1, 1, 1, 1,
-0.7700444, -1.955784, -3.20041, 1, 1, 1, 1, 1,
-0.7633814, 0.1782837, -0.3493653, 1, 1, 1, 1, 1,
-0.7572635, -0.4818749, -2.302979, 1, 1, 1, 1, 1,
-0.7557275, 1.210803, -1.263137, 1, 1, 1, 1, 1,
-0.755013, -0.670593, -3.097019, 1, 1, 1, 1, 1,
-0.7535229, -1.031289, -3.273147, 0, 0, 1, 1, 1,
-0.7530643, -0.3838111, -0.7901627, 1, 0, 0, 1, 1,
-0.7512776, 0.4744703, -0.6522279, 1, 0, 0, 1, 1,
-0.7508574, -1.201863, -4.053303, 1, 0, 0, 1, 1,
-0.7506705, -1.371218, -4.040794, 1, 0, 0, 1, 1,
-0.7473738, -0.8586182, -3.970884, 1, 0, 0, 1, 1,
-0.7448691, 0.990563, -0.4362392, 0, 0, 0, 1, 1,
-0.7417527, 1.172813, 0.9499542, 0, 0, 0, 1, 1,
-0.7327201, 2.29265, 1.201609, 0, 0, 0, 1, 1,
-0.7243595, 0.8680283, 0.3213523, 0, 0, 0, 1, 1,
-0.7226636, 1.018579, -1.648627, 0, 0, 0, 1, 1,
-0.7219364, -1.669869, -2.185014, 0, 0, 0, 1, 1,
-0.721684, -0.5612313, -1.021852, 0, 0, 0, 1, 1,
-0.7197932, 1.267542, 0.9901576, 1, 1, 1, 1, 1,
-0.7128229, -1.210718, -3.182134, 1, 1, 1, 1, 1,
-0.7120755, 0.03998153, -0.856747, 1, 1, 1, 1, 1,
-0.7094582, 0.9305083, -0.9607286, 1, 1, 1, 1, 1,
-0.6971835, 0.6761632, -2.583918, 1, 1, 1, 1, 1,
-0.6870429, 1.113071, 1.139614, 1, 1, 1, 1, 1,
-0.6692768, 0.7247863, -0.4256912, 1, 1, 1, 1, 1,
-0.6664623, 2.221641, 0.6672643, 1, 1, 1, 1, 1,
-0.6603774, 0.807917, -0.3109598, 1, 1, 1, 1, 1,
-0.6589251, 0.8138652, -1.696695, 1, 1, 1, 1, 1,
-0.6561723, 1.76099, -0.6213651, 1, 1, 1, 1, 1,
-0.6549656, 2.04612, -1.59156, 1, 1, 1, 1, 1,
-0.6502247, 0.4334383, -1.701407, 1, 1, 1, 1, 1,
-0.6487598, 1.184649, -0.9652196, 1, 1, 1, 1, 1,
-0.6486437, 0.1995368, -2.697284, 1, 1, 1, 1, 1,
-0.6486309, 0.07924348, -0.4136001, 0, 0, 1, 1, 1,
-0.6466588, -2.269813, -3.792017, 1, 0, 0, 1, 1,
-0.6457571, -0.1452648, -1.87202, 1, 0, 0, 1, 1,
-0.6392131, -0.8398056, -2.137955, 1, 0, 0, 1, 1,
-0.6384898, -0.8415353, -1.053354, 1, 0, 0, 1, 1,
-0.633727, 0.4149561, 0.004343821, 1, 0, 0, 1, 1,
-0.6317868, -1.60304, -3.885092, 0, 0, 0, 1, 1,
-0.6289502, -0.7289951, -2.794631, 0, 0, 0, 1, 1,
-0.6284957, -1.217626, -3.232718, 0, 0, 0, 1, 1,
-0.6123895, 0.6205535, -0.04926121, 0, 0, 0, 1, 1,
-0.6116795, 1.185035, 0.1497319, 0, 0, 0, 1, 1,
-0.6109494, 0.1526386, -0.7607819, 0, 0, 0, 1, 1,
-0.6039635, -0.3696022, -2.638418, 0, 0, 0, 1, 1,
-0.6039039, 1.825142, 1.246398, 1, 1, 1, 1, 1,
-0.6018001, 0.004840988, -1.185877, 1, 1, 1, 1, 1,
-0.6001563, -0.4817044, -3.08325, 1, 1, 1, 1, 1,
-0.5930051, -0.6609028, -2.868849, 1, 1, 1, 1, 1,
-0.5911009, -0.1289869, -1.422959, 1, 1, 1, 1, 1,
-0.58957, 0.1722957, -0.3417027, 1, 1, 1, 1, 1,
-0.5880259, 0.009982697, -2.721832, 1, 1, 1, 1, 1,
-0.5825524, -1.176804, -2.165514, 1, 1, 1, 1, 1,
-0.5816684, 1.010325, -0.9119576, 1, 1, 1, 1, 1,
-0.5777347, -0.6423143, -2.187845, 1, 1, 1, 1, 1,
-0.5755841, -1.185722, -2.324994, 1, 1, 1, 1, 1,
-0.5716097, 0.4445851, -1.221163, 1, 1, 1, 1, 1,
-0.5701029, 0.3642482, -1.48903, 1, 1, 1, 1, 1,
-0.5682104, 1.027924, -0.4899703, 1, 1, 1, 1, 1,
-0.5587199, -0.3507997, -1.670424, 1, 1, 1, 1, 1,
-0.5581627, 0.530163, -1.528392, 0, 0, 1, 1, 1,
-0.5577596, 0.8577315, 0.2243648, 1, 0, 0, 1, 1,
-0.5549256, 1.617458, -0.3814356, 1, 0, 0, 1, 1,
-0.5523411, -0.6539942, -1.081873, 1, 0, 0, 1, 1,
-0.549529, 0.8043284, -0.508401, 1, 0, 0, 1, 1,
-0.5425012, -0.5963513, -3.997938, 1, 0, 0, 1, 1,
-0.5403268, 0.3217911, -0.7058094, 0, 0, 0, 1, 1,
-0.5300677, 0.9840447, 0.7727615, 0, 0, 0, 1, 1,
-0.5169634, -0.1999751, -2.160442, 0, 0, 0, 1, 1,
-0.5137961, 0.4557568, -0.7259344, 0, 0, 0, 1, 1,
-0.5090411, -0.9228316, -0.2767428, 0, 0, 0, 1, 1,
-0.5088538, -0.7824899, -0.591465, 0, 0, 0, 1, 1,
-0.5076547, 1.316334, -2.779277, 0, 0, 0, 1, 1,
-0.5054077, 1.393367, -0.4427912, 1, 1, 1, 1, 1,
-0.4956821, 0.292832, -0.5987517, 1, 1, 1, 1, 1,
-0.4924378, -1.723864, -1.701787, 1, 1, 1, 1, 1,
-0.4881191, 0.5700454, -0.04434265, 1, 1, 1, 1, 1,
-0.487588, -0.4931307, -2.583395, 1, 1, 1, 1, 1,
-0.4848765, 0.3491401, -0.4231554, 1, 1, 1, 1, 1,
-0.4820106, 0.2638105, -1.298345, 1, 1, 1, 1, 1,
-0.4792886, 0.5529889, -0.796204, 1, 1, 1, 1, 1,
-0.4764805, -1.679106, -1.14555, 1, 1, 1, 1, 1,
-0.4717655, -1.297559, -5.048768, 1, 1, 1, 1, 1,
-0.4713169, 0.6112816, -1.037176, 1, 1, 1, 1, 1,
-0.4693494, -1.758837, -2.583786, 1, 1, 1, 1, 1,
-0.4667585, -0.5557295, -2.531013, 1, 1, 1, 1, 1,
-0.4658022, 1.90256, -0.1672886, 1, 1, 1, 1, 1,
-0.4622101, -0.9837907, -6.05026, 1, 1, 1, 1, 1,
-0.4565276, 0.0648064, -0.8071045, 0, 0, 1, 1, 1,
-0.4536539, 0.3072593, -1.258147, 1, 0, 0, 1, 1,
-0.451585, 1.187758, 1.022351, 1, 0, 0, 1, 1,
-0.4512909, -0.6984018, -2.005116, 1, 0, 0, 1, 1,
-0.4499733, 1.286416, -0.1704539, 1, 0, 0, 1, 1,
-0.4482729, -0.739607, -3.726537, 1, 0, 0, 1, 1,
-0.4482062, 0.06243968, -2.808923, 0, 0, 0, 1, 1,
-0.4457539, 0.3366704, -1.077141, 0, 0, 0, 1, 1,
-0.4433943, -0.3550457, -2.309797, 0, 0, 0, 1, 1,
-0.4433405, 0.3430443, 0.5158, 0, 0, 0, 1, 1,
-0.4413428, 0.6908054, -0.8190264, 0, 0, 0, 1, 1,
-0.440785, -2.16857, -3.315717, 0, 0, 0, 1, 1,
-0.439368, -0.248064, -0.1643094, 0, 0, 0, 1, 1,
-0.4348183, 2.069794, -0.4754035, 1, 1, 1, 1, 1,
-0.4320101, -1.141322, -2.801262, 1, 1, 1, 1, 1,
-0.4289588, -0.1053483, -3.155543, 1, 1, 1, 1, 1,
-0.4273246, -1.603331, -3.616072, 1, 1, 1, 1, 1,
-0.4269482, -0.3758295, -3.17213, 1, 1, 1, 1, 1,
-0.4268681, -0.3309519, -3.797012, 1, 1, 1, 1, 1,
-0.4229208, -1.320233, -2.143962, 1, 1, 1, 1, 1,
-0.4207413, 1.487451, 0.5138147, 1, 1, 1, 1, 1,
-0.4192828, 0.144479, -1.814497, 1, 1, 1, 1, 1,
-0.417657, -0.4907728, -2.760131, 1, 1, 1, 1, 1,
-0.413308, -0.4756994, -4.033983, 1, 1, 1, 1, 1,
-0.411238, 0.364051, -1.675372, 1, 1, 1, 1, 1,
-0.4077088, -1.236493, -2.228674, 1, 1, 1, 1, 1,
-0.4040634, -0.9368691, -2.297227, 1, 1, 1, 1, 1,
-0.4033992, -1.25687, -4.354347, 1, 1, 1, 1, 1,
-0.400788, -0.8117731, -3.692485, 0, 0, 1, 1, 1,
-0.4003353, -0.955997, -1.902113, 1, 0, 0, 1, 1,
-0.3996099, 0.5371869, -0.166583, 1, 0, 0, 1, 1,
-0.3942432, 0.7197534, -0.2619743, 1, 0, 0, 1, 1,
-0.3888936, 0.6897097, -0.2719784, 1, 0, 0, 1, 1,
-0.3887897, -0.6585293, -3.949188, 1, 0, 0, 1, 1,
-0.3830022, 2.314314, 0.2906524, 0, 0, 0, 1, 1,
-0.378259, -0.2086326, -1.393983, 0, 0, 0, 1, 1,
-0.3779648, 1.662656, 0.482114, 0, 0, 0, 1, 1,
-0.3715599, -0.5456868, -4.553076, 0, 0, 0, 1, 1,
-0.3706112, 1.840773, 0.2571732, 0, 0, 0, 1, 1,
-0.3705334, -0.8258781, -2.474022, 0, 0, 0, 1, 1,
-0.365438, -0.6903654, -2.077269, 0, 0, 0, 1, 1,
-0.3620533, 0.1879763, -0.1387753, 1, 1, 1, 1, 1,
-0.3585455, 0.7375192, -1.552364, 1, 1, 1, 1, 1,
-0.3565302, -0.4599033, -2.337634, 1, 1, 1, 1, 1,
-0.355168, -2.029577, -2.89985, 1, 1, 1, 1, 1,
-0.3542979, 1.639852, 0.8791506, 1, 1, 1, 1, 1,
-0.3529594, -0.4327351, -0.6773735, 1, 1, 1, 1, 1,
-0.3461298, -0.6738605, -2.026839, 1, 1, 1, 1, 1,
-0.344556, -0.1352317, -2.398915, 1, 1, 1, 1, 1,
-0.340114, 2.237391, -2.001618, 1, 1, 1, 1, 1,
-0.3390244, 0.3832553, -1.088736, 1, 1, 1, 1, 1,
-0.337134, 0.5723876, 1.023034, 1, 1, 1, 1, 1,
-0.3337727, 1.412613, -0.1072695, 1, 1, 1, 1, 1,
-0.3323415, -1.831731, -2.98928, 1, 1, 1, 1, 1,
-0.3285434, -0.6070905, -3.146049, 1, 1, 1, 1, 1,
-0.3281413, -0.9713861, -3.292952, 1, 1, 1, 1, 1,
-0.3243349, -0.2605033, -2.623048, 0, 0, 1, 1, 1,
-0.322974, -0.3629466, -2.261401, 1, 0, 0, 1, 1,
-0.3214473, 1.757315, -1.404094, 1, 0, 0, 1, 1,
-0.3182201, -0.2543921, -3.01078, 1, 0, 0, 1, 1,
-0.317376, 0.1957536, -1.584596, 1, 0, 0, 1, 1,
-0.3162389, -0.1078556, -2.519931, 1, 0, 0, 1, 1,
-0.3153172, -1.002309, -2.739133, 0, 0, 0, 1, 1,
-0.3118486, -0.6920903, -3.570666, 0, 0, 0, 1, 1,
-0.3100195, -0.8821382, -4.030178, 0, 0, 0, 1, 1,
-0.3073286, -0.6202327, -1.894534, 0, 0, 0, 1, 1,
-0.3062721, 0.4617082, -0.6321079, 0, 0, 0, 1, 1,
-0.3060057, -0.9077222, -3.274689, 0, 0, 0, 1, 1,
-0.303731, -1.098188, -2.293704, 0, 0, 0, 1, 1,
-0.3003793, -0.9991961, -3.420954, 1, 1, 1, 1, 1,
-0.2970421, -0.1733585, -1.009689, 1, 1, 1, 1, 1,
-0.2925077, -0.3354174, -1.533764, 1, 1, 1, 1, 1,
-0.2885261, 0.1773674, -2.048626, 1, 1, 1, 1, 1,
-0.2871341, -0.1962526, -2.103439, 1, 1, 1, 1, 1,
-0.2774417, -0.2741768, -2.736997, 1, 1, 1, 1, 1,
-0.2650694, -0.547637, -0.2808362, 1, 1, 1, 1, 1,
-0.2646841, -1.236336, -3.739884, 1, 1, 1, 1, 1,
-0.2636415, 0.7776352, -1.019017, 1, 1, 1, 1, 1,
-0.2623555, -0.1880101, -0.8086837, 1, 1, 1, 1, 1,
-0.2596323, -0.8323812, -3.954016, 1, 1, 1, 1, 1,
-0.2595548, 0.07081851, -1.279748, 1, 1, 1, 1, 1,
-0.2583784, 1.498251, 0.7260469, 1, 1, 1, 1, 1,
-0.2583404, -0.3737206, -1.796398, 1, 1, 1, 1, 1,
-0.2576114, 1.393891, 0.6014387, 1, 1, 1, 1, 1,
-0.2562566, 0.8214578, -0.8595115, 0, 0, 1, 1, 1,
-0.2540984, 0.3753799, -1.034004, 1, 0, 0, 1, 1,
-0.2449765, -0.06083916, -1.977704, 1, 0, 0, 1, 1,
-0.2440771, 1.196985, 0.1459362, 1, 0, 0, 1, 1,
-0.2432229, 1.562634, 0.1881535, 1, 0, 0, 1, 1,
-0.2366398, -0.5888979, -3.436579, 1, 0, 0, 1, 1,
-0.2366225, 0.7017705, -0.780145, 0, 0, 0, 1, 1,
-0.2362749, -1.262478, -3.925221, 0, 0, 0, 1, 1,
-0.2360018, -0.8535258, -1.695613, 0, 0, 0, 1, 1,
-0.2356868, -1.503016, -3.652862, 0, 0, 0, 1, 1,
-0.2345862, 0.04800604, -1.84533, 0, 0, 0, 1, 1,
-0.234511, 0.4135819, -1.402742, 0, 0, 0, 1, 1,
-0.2324155, -0.691147, -2.811874, 0, 0, 0, 1, 1,
-0.2253016, -0.8543678, -1.212096, 1, 1, 1, 1, 1,
-0.2250714, -0.4949165, -2.285172, 1, 1, 1, 1, 1,
-0.2197605, -0.6688635, -3.373386, 1, 1, 1, 1, 1,
-0.218392, -1.419194, -3.196182, 1, 1, 1, 1, 1,
-0.2096758, 1.322662, -0.622116, 1, 1, 1, 1, 1,
-0.2072007, -0.7708771, -2.544937, 1, 1, 1, 1, 1,
-0.2061644, 1.678805, -0.2416155, 1, 1, 1, 1, 1,
-0.2047509, -1.963207, -2.881592, 1, 1, 1, 1, 1,
-0.2035996, -1.66026, -2.227329, 1, 1, 1, 1, 1,
-0.199583, -1.407335, -2.488195, 1, 1, 1, 1, 1,
-0.1984096, 0.05200049, -0.3904317, 1, 1, 1, 1, 1,
-0.1908108, -0.5468802, -1.932559, 1, 1, 1, 1, 1,
-0.1900657, -1.517696, -3.256362, 1, 1, 1, 1, 1,
-0.1882335, 0.08979169, -0.4490307, 1, 1, 1, 1, 1,
-0.1873071, -1.71476, -3.201969, 1, 1, 1, 1, 1,
-0.1848344, 0.4268724, 0.6975287, 0, 0, 1, 1, 1,
-0.1816826, 1.639045, -0.9457557, 1, 0, 0, 1, 1,
-0.1808126, -0.8097435, -3.222315, 1, 0, 0, 1, 1,
-0.1762731, 1.935145, -1.065059, 1, 0, 0, 1, 1,
-0.1727585, -0.5532949, -1.869095, 1, 0, 0, 1, 1,
-0.1712339, 0.4360659, -0.8021255, 1, 0, 0, 1, 1,
-0.1697769, -1.020408, -3.135324, 0, 0, 0, 1, 1,
-0.1665897, 0.09722823, -2.337284, 0, 0, 0, 1, 1,
-0.156596, -1.733155, -3.480305, 0, 0, 0, 1, 1,
-0.1562207, 0.7961097, 1.540167, 0, 0, 0, 1, 1,
-0.1548136, -0.1063948, -3.428262, 0, 0, 0, 1, 1,
-0.1498267, 0.2503766, 0.9012766, 0, 0, 0, 1, 1,
-0.1462919, 0.9036599, 0.879108, 0, 0, 0, 1, 1,
-0.14617, -0.5487634, -3.949903, 1, 1, 1, 1, 1,
-0.1458476, -0.4843118, -1.442559, 1, 1, 1, 1, 1,
-0.1451777, -1.43607, -3.298908, 1, 1, 1, 1, 1,
-0.1441803, -0.8511914, -3.6989, 1, 1, 1, 1, 1,
-0.1361247, -1.0862, -3.034815, 1, 1, 1, 1, 1,
-0.132627, -0.04633329, -1.443761, 1, 1, 1, 1, 1,
-0.1325637, 0.0713435, -2.184001, 1, 1, 1, 1, 1,
-0.1322292, 0.2422205, -0.2560936, 1, 1, 1, 1, 1,
-0.1319763, 0.1623513, -1.506885, 1, 1, 1, 1, 1,
-0.1312767, 0.2840836, -0.927891, 1, 1, 1, 1, 1,
-0.1288533, 0.3717147, -1.872432, 1, 1, 1, 1, 1,
-0.1275313, -0.767831, -3.103402, 1, 1, 1, 1, 1,
-0.1255254, -0.2785224, -2.855126, 1, 1, 1, 1, 1,
-0.1250113, 0.06913852, -0.9519813, 1, 1, 1, 1, 1,
-0.1243566, -0.6785986, -5.47147, 1, 1, 1, 1, 1,
-0.1238335, 0.5503082, -0.5731334, 0, 0, 1, 1, 1,
-0.1203944, -1.335179, -2.779546, 1, 0, 0, 1, 1,
-0.1203401, -0.2001248, -2.397973, 1, 0, 0, 1, 1,
-0.1159949, -0.3594005, -3.547673, 1, 0, 0, 1, 1,
-0.1152346, -0.1370909, -4.169535, 1, 0, 0, 1, 1,
-0.1122545, -0.8950011, -2.705558, 1, 0, 0, 1, 1,
-0.1118694, 0.5633155, -0.2106713, 0, 0, 0, 1, 1,
-0.1101867, -1.459723, -0.1647975, 0, 0, 0, 1, 1,
-0.1085338, 0.9311746, 0.5304854, 0, 0, 0, 1, 1,
-0.1065924, -1.20506, -4.18594, 0, 0, 0, 1, 1,
-0.1030387, 0.8454758, 0.5133736, 0, 0, 0, 1, 1,
-0.1026107, 0.9599607, 1.587578, 0, 0, 0, 1, 1,
-0.102433, -1.243252, -1.758742, 0, 0, 0, 1, 1,
-0.102353, 1.211161, 0.4793011, 1, 1, 1, 1, 1,
-0.1001523, -0.5374617, -2.026034, 1, 1, 1, 1, 1,
-0.09958533, 2.342923, -0.4466908, 1, 1, 1, 1, 1,
-0.09675918, 0.729384, -0.4545449, 1, 1, 1, 1, 1,
-0.09225416, 0.3669652, 0.5102564, 1, 1, 1, 1, 1,
-0.085662, 0.4779801, -0.4923307, 1, 1, 1, 1, 1,
-0.08097816, 0.05997146, -1.964815, 1, 1, 1, 1, 1,
-0.07849722, -1.182398, -2.854573, 1, 1, 1, 1, 1,
-0.07203536, 0.4923727, -0.1554753, 1, 1, 1, 1, 1,
-0.06903438, 0.7327928, 0.7831693, 1, 1, 1, 1, 1,
-0.06894971, -0.3105449, -3.189151, 1, 1, 1, 1, 1,
-0.0637927, -1.647188, -3.831212, 1, 1, 1, 1, 1,
-0.06369111, 0.246144, 0.7838348, 1, 1, 1, 1, 1,
-0.05728225, -0.4972138, -3.835949, 1, 1, 1, 1, 1,
-0.0554499, 1.084838, 0.6824536, 1, 1, 1, 1, 1,
-0.05392271, -0.4821016, -4.075201, 0, 0, 1, 1, 1,
-0.05336902, -2.067859, -2.849653, 1, 0, 0, 1, 1,
-0.05281892, 1.421658, 0.5713002, 1, 0, 0, 1, 1,
-0.05233652, 0.8181957, 0.8693026, 1, 0, 0, 1, 1,
-0.0511838, 0.06030678, -0.3675404, 1, 0, 0, 1, 1,
-0.04949274, -0.9967461, -3.45628, 1, 0, 0, 1, 1,
-0.04800472, -0.6333939, -1.719231, 0, 0, 0, 1, 1,
-0.04322235, -1.132592, -1.886509, 0, 0, 0, 1, 1,
-0.04137974, -1.28863, -2.348714, 0, 0, 0, 1, 1,
-0.03784787, 0.8455238, -0.7699278, 0, 0, 0, 1, 1,
-0.03632009, -1.066591, -2.368612, 0, 0, 0, 1, 1,
-0.03420174, 1.070328, -1.739274, 0, 0, 0, 1, 1,
-0.03329659, 0.4797847, 0.846887, 0, 0, 0, 1, 1,
-0.03159476, 0.533272, 0.3658099, 1, 1, 1, 1, 1,
-0.03145391, -0.09080853, -2.484983, 1, 1, 1, 1, 1,
-0.02922994, 0.2696467, 0.6888145, 1, 1, 1, 1, 1,
-0.02518994, -2.127209, -5.304798, 1, 1, 1, 1, 1,
-0.02094879, 2.242904, -0.22141, 1, 1, 1, 1, 1,
-0.01895576, -1.174352, -1.829774, 1, 1, 1, 1, 1,
-0.01828621, -1.123491, -1.657221, 1, 1, 1, 1, 1,
-0.01780148, 0.2696368, 0.2546375, 1, 1, 1, 1, 1,
-0.01773422, 0.2385557, 0.6779833, 1, 1, 1, 1, 1,
-0.01441946, 0.7357617, -0.9668759, 1, 1, 1, 1, 1,
-0.0138514, 0.6244736, -0.8541059, 1, 1, 1, 1, 1,
-0.01126178, 0.9273198, -0.8997418, 1, 1, 1, 1, 1,
-0.006235364, -0.6199191, -3.228682, 1, 1, 1, 1, 1,
-0.003906579, 0.3470816, -0.7037773, 1, 1, 1, 1, 1,
-0.003787414, 0.7492447, -0.3607805, 1, 1, 1, 1, 1,
-0.003724152, -0.04895974, -1.355494, 0, 0, 1, 1, 1,
-0.002863732, -0.640491, -3.547275, 1, 0, 0, 1, 1,
0.006954639, 1.221242, -1.249894, 1, 0, 0, 1, 1,
0.008730279, -0.4301383, 0.6180469, 1, 0, 0, 1, 1,
0.008958821, -0.4893605, 4.214551, 1, 0, 0, 1, 1,
0.009592233, -0.8009794, 2.75993, 1, 0, 0, 1, 1,
0.01145666, 1.393614, -0.5406977, 0, 0, 0, 1, 1,
0.01256103, 0.7021422, 0.6475555, 0, 0, 0, 1, 1,
0.0127025, -1.924707, 3.687299, 0, 0, 0, 1, 1,
0.0138264, -1.730709, 1.924464, 0, 0, 0, 1, 1,
0.01561258, -1.632647, 2.784697, 0, 0, 0, 1, 1,
0.01726181, 0.6868494, -0.3406934, 0, 0, 0, 1, 1,
0.01731654, 1.028987, -0.4053271, 0, 0, 0, 1, 1,
0.02080364, 0.296854, 0.09404296, 1, 1, 1, 1, 1,
0.03095493, -0.4751872, 3.129686, 1, 1, 1, 1, 1,
0.03153288, -0.9485878, 2.103475, 1, 1, 1, 1, 1,
0.03400875, 0.3026627, 0.1213039, 1, 1, 1, 1, 1,
0.03450975, 0.6945173, -0.06662808, 1, 1, 1, 1, 1,
0.03592028, -0.4363465, 2.83377, 1, 1, 1, 1, 1,
0.0366638, -0.9296386, 2.639915, 1, 1, 1, 1, 1,
0.03887874, -0.04802815, 1.295081, 1, 1, 1, 1, 1,
0.0393096, 0.5068646, 0.2517632, 1, 1, 1, 1, 1,
0.04021392, 0.1799513, 0.5084351, 1, 1, 1, 1, 1,
0.04184383, -1.836671, 2.83568, 1, 1, 1, 1, 1,
0.04574378, 0.2196484, 1.594797, 1, 1, 1, 1, 1,
0.05089884, 1.749964, -1.013638, 1, 1, 1, 1, 1,
0.05417645, -1.098357, 2.08144, 1, 1, 1, 1, 1,
0.05687604, 0.5372686, -0.3556947, 1, 1, 1, 1, 1,
0.0587182, 0.08685908, 0.2779429, 0, 0, 1, 1, 1,
0.06544186, -0.2605702, 1.840494, 1, 0, 0, 1, 1,
0.06665281, -0.2385169, 2.743991, 1, 0, 0, 1, 1,
0.06665898, -1.454339, 2.273462, 1, 0, 0, 1, 1,
0.07365706, -0.5820811, 4.967769, 1, 0, 0, 1, 1,
0.07654841, 0.1217526, 1.093261, 1, 0, 0, 1, 1,
0.08071574, 0.1696107, -0.2566749, 0, 0, 0, 1, 1,
0.08893491, 0.2721362, -1.191294, 0, 0, 0, 1, 1,
0.09020043, -0.6119252, 2.449417, 0, 0, 0, 1, 1,
0.09110805, -0.6834131, 2.471637, 0, 0, 0, 1, 1,
0.09787745, 0.4339997, 0.5567059, 0, 0, 0, 1, 1,
0.09806236, -2.250892, 1.957624, 0, 0, 0, 1, 1,
0.09847963, 0.5835373, 0.3319888, 0, 0, 0, 1, 1,
0.09978238, -1.140191, 3.653734, 1, 1, 1, 1, 1,
0.1009107, -1.227576, 2.883077, 1, 1, 1, 1, 1,
0.1028835, -0.8773899, 2.428238, 1, 1, 1, 1, 1,
0.1036116, -0.152049, 1.501254, 1, 1, 1, 1, 1,
0.1042033, 2.451035, -0.5788587, 1, 1, 1, 1, 1,
0.1053396, -1.355374, 4.047668, 1, 1, 1, 1, 1,
0.1056388, -0.2003695, 1.625038, 1, 1, 1, 1, 1,
0.1075879, -0.6179738, 2.056523, 1, 1, 1, 1, 1,
0.1126147, -0.9914075, 2.991784, 1, 1, 1, 1, 1,
0.1139242, 0.5609316, 0.9991224, 1, 1, 1, 1, 1,
0.1159731, 0.7498617, -0.7106448, 1, 1, 1, 1, 1,
0.1168335, -1.358596, 1.764749, 1, 1, 1, 1, 1,
0.1200522, 0.2048173, 0.5153808, 1, 1, 1, 1, 1,
0.1213664, -1.335002, 2.82402, 1, 1, 1, 1, 1,
0.1254637, -0.9129989, 3.325936, 1, 1, 1, 1, 1,
0.1265687, 1.925455, 0.2240885, 0, 0, 1, 1, 1,
0.1275457, -0.7997177, 1.588616, 1, 0, 0, 1, 1,
0.128035, 0.2022309, 0.1256673, 1, 0, 0, 1, 1,
0.1292614, -0.05086031, 2.732874, 1, 0, 0, 1, 1,
0.1310478, 0.6073164, 1.264084, 1, 0, 0, 1, 1,
0.1331572, 0.4373006, -0.3920603, 1, 0, 0, 1, 1,
0.1362675, -2.051574, 3.109759, 0, 0, 0, 1, 1,
0.1410357, -1.217657, 4.182381, 0, 0, 0, 1, 1,
0.1411285, 0.813265, -0.9165747, 0, 0, 0, 1, 1,
0.1455146, -0.779946, 1.992689, 0, 0, 0, 1, 1,
0.1472621, -3.007307, 2.363315, 0, 0, 0, 1, 1,
0.1509475, -0.6338959, 4.383796, 0, 0, 0, 1, 1,
0.151127, -1.49364, 4.187906, 0, 0, 0, 1, 1,
0.1579436, 1.076703, -0.3528683, 1, 1, 1, 1, 1,
0.1643441, -0.4457656, 3.784106, 1, 1, 1, 1, 1,
0.1659161, -1.657313, 3.114263, 1, 1, 1, 1, 1,
0.167007, -0.6993513, 3.616947, 1, 1, 1, 1, 1,
0.167297, 1.048367, -0.2652181, 1, 1, 1, 1, 1,
0.1689989, 0.7914036, -0.8758399, 1, 1, 1, 1, 1,
0.17143, -0.6968443, 3.339629, 1, 1, 1, 1, 1,
0.1728646, -0.7878104, 2.002843, 1, 1, 1, 1, 1,
0.1759497, -0.7726765, 3.047057, 1, 1, 1, 1, 1,
0.1778268, 0.9402454, 1.310608, 1, 1, 1, 1, 1,
0.1790229, -0.292865, 0.89353, 1, 1, 1, 1, 1,
0.1808992, -0.9205814, 4.734723, 1, 1, 1, 1, 1,
0.1812532, -0.7561942, 3.141399, 1, 1, 1, 1, 1,
0.1813266, -2.954447, 3.034119, 1, 1, 1, 1, 1,
0.1889435, -0.6842731, 3.074794, 1, 1, 1, 1, 1,
0.1898184, 0.04721388, 1.205509, 0, 0, 1, 1, 1,
0.1930266, 1.332388, 0.3336306, 1, 0, 0, 1, 1,
0.2004814, 0.1073868, 1.323033, 1, 0, 0, 1, 1,
0.2018261, -0.1708262, 1.490089, 1, 0, 0, 1, 1,
0.2052415, 0.7133303, 1.776692, 1, 0, 0, 1, 1,
0.2062972, 1.976911, 0.6304396, 1, 0, 0, 1, 1,
0.2071062, -0.2931716, 3.704048, 0, 0, 0, 1, 1,
0.2102713, -0.03189141, 2.710623, 0, 0, 0, 1, 1,
0.2114114, -0.6916966, 3.289052, 0, 0, 0, 1, 1,
0.2168972, 1.016367, 0.5040815, 0, 0, 0, 1, 1,
0.2185365, -0.2750816, 2.759935, 0, 0, 0, 1, 1,
0.2221145, -0.9910095, 3.357918, 0, 0, 0, 1, 1,
0.2247828, -1.275058, 2.615708, 0, 0, 0, 1, 1,
0.2248204, 0.4565209, 0.9573817, 1, 1, 1, 1, 1,
0.228091, 1.426851, 0.6201061, 1, 1, 1, 1, 1,
0.2285595, -2.028, 1.702874, 1, 1, 1, 1, 1,
0.2312659, -0.1516506, 2.851322, 1, 1, 1, 1, 1,
0.2313296, -0.6968826, 2.714504, 1, 1, 1, 1, 1,
0.2313387, 2.105817, -0.4759044, 1, 1, 1, 1, 1,
0.2318403, -1.001132, 1.818316, 1, 1, 1, 1, 1,
0.2357221, 1.066195, 0.7156659, 1, 1, 1, 1, 1,
0.2382926, -0.3897231, 1.968869, 1, 1, 1, 1, 1,
0.2418522, -0.6061868, 3.088132, 1, 1, 1, 1, 1,
0.2430126, 0.2788955, 1.213084, 1, 1, 1, 1, 1,
0.2450213, 0.9694275, 2.766089, 1, 1, 1, 1, 1,
0.2466683, -0.274854, 1.57915, 1, 1, 1, 1, 1,
0.2487345, 1.072213, 0.1856076, 1, 1, 1, 1, 1,
0.2535994, -0.5722104, 3.927503, 1, 1, 1, 1, 1,
0.2575788, -0.09778448, 1.31363, 0, 0, 1, 1, 1,
0.260951, -1.36192, 1.749574, 1, 0, 0, 1, 1,
0.263575, -0.8386716, 4.400195, 1, 0, 0, 1, 1,
0.2654096, 0.7887267, 0.6892664, 1, 0, 0, 1, 1,
0.2687413, 0.2066162, -0.2379007, 1, 0, 0, 1, 1,
0.2721947, -1.367605, 1.101841, 1, 0, 0, 1, 1,
0.2746126, -0.421961, 1.2023, 0, 0, 0, 1, 1,
0.2749528, 0.1586322, 0.8456504, 0, 0, 0, 1, 1,
0.2751349, -0.1176942, 0.4124428, 0, 0, 0, 1, 1,
0.2781722, 1.646168, -0.1034896, 0, 0, 0, 1, 1,
0.2806851, -0.02174575, -0.06692384, 0, 0, 0, 1, 1,
0.2807285, -1.681638, 1.953063, 0, 0, 0, 1, 1,
0.2812104, 1.313999, 1.587348, 0, 0, 0, 1, 1,
0.2812838, -2.022225, 2.536969, 1, 1, 1, 1, 1,
0.2830355, 0.224858, 0.9158784, 1, 1, 1, 1, 1,
0.287577, 0.8467861, -0.1106024, 1, 1, 1, 1, 1,
0.291647, 0.796286, 1.276043, 1, 1, 1, 1, 1,
0.2950477, -0.03119017, 2.147094, 1, 1, 1, 1, 1,
0.2958032, 1.288085, -0.359648, 1, 1, 1, 1, 1,
0.3026082, 0.4659887, 0.1979424, 1, 1, 1, 1, 1,
0.3062092, 0.523321, 0.6777475, 1, 1, 1, 1, 1,
0.3091447, 0.1269503, -0.01423058, 1, 1, 1, 1, 1,
0.3102555, 0.5659821, -0.5653939, 1, 1, 1, 1, 1,
0.3125612, 1.08722, 1.387188, 1, 1, 1, 1, 1,
0.3156298, -0.2257538, 1.699019, 1, 1, 1, 1, 1,
0.316475, -1.580442, 2.215908, 1, 1, 1, 1, 1,
0.3172343, 0.5843947, 1.237893, 1, 1, 1, 1, 1,
0.3173957, 0.1008773, 2.559227, 1, 1, 1, 1, 1,
0.3182692, -1.048075, 3.350069, 0, 0, 1, 1, 1,
0.3240358, -0.4149998, 3.116721, 1, 0, 0, 1, 1,
0.3266952, -0.1586898, 2.665677, 1, 0, 0, 1, 1,
0.3321503, 1.461824, -0.7839309, 1, 0, 0, 1, 1,
0.3360923, -0.8072008, 1.084729, 1, 0, 0, 1, 1,
0.33799, 0.6381777, 0.1519076, 1, 0, 0, 1, 1,
0.3390725, 2.246025, 0.022236, 0, 0, 0, 1, 1,
0.3401654, -1.611759, 3.761808, 0, 0, 0, 1, 1,
0.3438657, -1.39553, 2.423269, 0, 0, 0, 1, 1,
0.3440035, -1.772865, 3.222113, 0, 0, 0, 1, 1,
0.3465059, 1.535095, 1.413256, 0, 0, 0, 1, 1,
0.3488677, -0.5644492, 1.093733, 0, 0, 0, 1, 1,
0.3508529, -0.2182605, 1.942517, 0, 0, 0, 1, 1,
0.3566439, 0.2974955, 0.5188237, 1, 1, 1, 1, 1,
0.3570387, -1.491366, 2.693947, 1, 1, 1, 1, 1,
0.3622017, 0.8516442, 0.364734, 1, 1, 1, 1, 1,
0.3653491, -1.163828, 3.028399, 1, 1, 1, 1, 1,
0.3723084, 0.07517009, 0.9974302, 1, 1, 1, 1, 1,
0.3778437, -0.3836968, 0.4724774, 1, 1, 1, 1, 1,
0.3799763, -0.7677797, 2.879532, 1, 1, 1, 1, 1,
0.3808445, -0.006049749, 1.358458, 1, 1, 1, 1, 1,
0.382511, 1.239266, 1.939819, 1, 1, 1, 1, 1,
0.3825488, -1.474893, 1.557482, 1, 1, 1, 1, 1,
0.3833992, -1.456524, 2.958059, 1, 1, 1, 1, 1,
0.3834619, -0.3386162, 2.695828, 1, 1, 1, 1, 1,
0.3842746, -0.05151423, 2.036396, 1, 1, 1, 1, 1,
0.3879248, -0.5368891, 1.061099, 1, 1, 1, 1, 1,
0.3900703, -0.870911, 3.326524, 1, 1, 1, 1, 1,
0.3901082, -0.5926334, 2.527701, 0, 0, 1, 1, 1,
0.3938131, 1.581433, 1.08453, 1, 0, 0, 1, 1,
0.3954584, 0.3074447, 0.8747252, 1, 0, 0, 1, 1,
0.3972764, 2.258755, -1.786532, 1, 0, 0, 1, 1,
0.3975517, -1.268722, 1.788221, 1, 0, 0, 1, 1,
0.4029163, -1.708852, 3.129701, 1, 0, 0, 1, 1,
0.4060532, 0.8405896, 2.945653, 0, 0, 0, 1, 1,
0.4083311, 0.4153682, 0.1705827, 0, 0, 0, 1, 1,
0.4115026, 0.9082271, -0.3202228, 0, 0, 0, 1, 1,
0.4117354, 1.021634, -0.286452, 0, 0, 0, 1, 1,
0.4141697, -0.3630407, 0.2087879, 0, 0, 0, 1, 1,
0.4227816, 0.04331969, 1.360531, 0, 0, 0, 1, 1,
0.4258031, -0.54013, 2.36662, 0, 0, 0, 1, 1,
0.4286419, 0.6135606, 1.924136, 1, 1, 1, 1, 1,
0.4300054, 0.9078203, 2.353239, 1, 1, 1, 1, 1,
0.4309439, 0.572484, 0.7250671, 1, 1, 1, 1, 1,
0.431354, 1.046117, -0.1574065, 1, 1, 1, 1, 1,
0.4334874, 0.5144264, 2.420779, 1, 1, 1, 1, 1,
0.4345809, -1.263981, 4.198087, 1, 1, 1, 1, 1,
0.4359474, 0.1151986, 2.230177, 1, 1, 1, 1, 1,
0.4362249, -1.465771, 3.13672, 1, 1, 1, 1, 1,
0.4372773, -0.4390522, 2.610462, 1, 1, 1, 1, 1,
0.4381524, 0.1355275, 0.8302279, 1, 1, 1, 1, 1,
0.4392136, 0.5288907, -0.6799256, 1, 1, 1, 1, 1,
0.4394605, 0.2482111, 1.79338, 1, 1, 1, 1, 1,
0.4405929, 2.740927, -2.100468, 1, 1, 1, 1, 1,
0.4416904, 0.4739802, -0.4263505, 1, 1, 1, 1, 1,
0.4423082, -0.9528678, 3.06794, 1, 1, 1, 1, 1,
0.4471181, -1.764582, 3.064667, 0, 0, 1, 1, 1,
0.4633189, -0.07728658, 0.04474786, 1, 0, 0, 1, 1,
0.4637291, -2.786887, 2.105437, 1, 0, 0, 1, 1,
0.4651155, -0.3087052, 3.394146, 1, 0, 0, 1, 1,
0.4665329, -0.5492994, 2.305514, 1, 0, 0, 1, 1,
0.469505, -0.8367338, 2.271744, 1, 0, 0, 1, 1,
0.4731913, -0.4808802, -0.4155791, 0, 0, 0, 1, 1,
0.4790366, 0.1136115, 1.301735, 0, 0, 0, 1, 1,
0.4810698, -0.9133808, 0.9376433, 0, 0, 0, 1, 1,
0.484081, 0.1582648, 0.8548864, 0, 0, 0, 1, 1,
0.4859626, 0.5993739, 1.489969, 0, 0, 0, 1, 1,
0.4874109, -0.214324, 2.446913, 0, 0, 0, 1, 1,
0.4900623, 2.424855, 0.191253, 0, 0, 0, 1, 1,
0.4911782, -0.4862814, 0.742553, 1, 1, 1, 1, 1,
0.4950282, 0.934503, 2.817962, 1, 1, 1, 1, 1,
0.4964238, 1.134272, 0.1293101, 1, 1, 1, 1, 1,
0.504308, 0.2139947, -0.3102352, 1, 1, 1, 1, 1,
0.5084543, -1.022748, 2.596418, 1, 1, 1, 1, 1,
0.5086636, -1.034389, 2.392628, 1, 1, 1, 1, 1,
0.5128354, -1.321609, 1.16421, 1, 1, 1, 1, 1,
0.5143832, 0.2241007, 3.519729, 1, 1, 1, 1, 1,
0.5190666, 1.194569, 2.30308, 1, 1, 1, 1, 1,
0.5227233, -0.2178472, 2.832571, 1, 1, 1, 1, 1,
0.5235717, 0.07165121, 2.076437, 1, 1, 1, 1, 1,
0.5324512, 0.4780488, -0.8890014, 1, 1, 1, 1, 1,
0.5336061, 0.1235947, 0.5431477, 1, 1, 1, 1, 1,
0.5336869, -0.2454387, 1.245826, 1, 1, 1, 1, 1,
0.536, -0.7029108, 2.613286, 1, 1, 1, 1, 1,
0.5383008, 0.1155875, 0.138887, 0, 0, 1, 1, 1,
0.5398778, 0.1358103, 0.01755933, 1, 0, 0, 1, 1,
0.5485851, 0.7982424, -0.470033, 1, 0, 0, 1, 1,
0.5514961, -0.4907801, 4.703834, 1, 0, 0, 1, 1,
0.5516656, 0.8130495, 1.479674, 1, 0, 0, 1, 1,
0.5544555, 1.943918, 0.6759806, 1, 0, 0, 1, 1,
0.5636615, 0.1609894, 1.475959, 0, 0, 0, 1, 1,
0.5646846, -1.30169, 3.811207, 0, 0, 0, 1, 1,
0.569541, -0.5204604, 2.673069, 0, 0, 0, 1, 1,
0.5710162, 1.826454, -0.2568635, 0, 0, 0, 1, 1,
0.5718672, 0.461354, 0.2945704, 0, 0, 0, 1, 1,
0.5723279, 0.9848937, -1.748651, 0, 0, 0, 1, 1,
0.5733346, -0.2027032, 1.801216, 0, 0, 0, 1, 1,
0.5748215, -0.7773953, 3.268422, 1, 1, 1, 1, 1,
0.5849345, -0.3458384, 1.556703, 1, 1, 1, 1, 1,
0.5859331, 0.4897469, -0.1220833, 1, 1, 1, 1, 1,
0.5873522, -0.7313069, 1.179313, 1, 1, 1, 1, 1,
0.5885765, 0.4981963, 1.091305, 1, 1, 1, 1, 1,
0.5895888, -0.5958381, 3.041267, 1, 1, 1, 1, 1,
0.5997425, 1.580927, 1.014666, 1, 1, 1, 1, 1,
0.6017307, 1.384796, 0.2491125, 1, 1, 1, 1, 1,
0.6023511, 0.3670542, 0.6503813, 1, 1, 1, 1, 1,
0.6029013, -0.08981409, 0.8578975, 1, 1, 1, 1, 1,
0.6046416, 0.2766015, -1.132673, 1, 1, 1, 1, 1,
0.6101192, 1.283551, -0.176272, 1, 1, 1, 1, 1,
0.6129696, 1.378693, -0.0917987, 1, 1, 1, 1, 1,
0.6137121, -1.181677, 1.828038, 1, 1, 1, 1, 1,
0.6187439, 0.4601159, 0.3538586, 1, 1, 1, 1, 1,
0.6256207, -0.7191018, 3.310261, 0, 0, 1, 1, 1,
0.6287358, 0.3667186, 1.105724, 1, 0, 0, 1, 1,
0.6297649, 0.6514008, 0.9207802, 1, 0, 0, 1, 1,
0.6389308, -0.5381795, 1.962202, 1, 0, 0, 1, 1,
0.6423934, 0.8913025, -0.2894486, 1, 0, 0, 1, 1,
0.643186, 0.3700578, 1.247373, 1, 0, 0, 1, 1,
0.6437395, -2.91867, 2.237223, 0, 0, 0, 1, 1,
0.6439173, -0.4264267, 1.987179, 0, 0, 0, 1, 1,
0.6441064, 0.1900424, 2.517228, 0, 0, 0, 1, 1,
0.6455098, -0.77347, 3.621792, 0, 0, 0, 1, 1,
0.6465046, 0.6583391, 0.03093, 0, 0, 0, 1, 1,
0.6549285, 3.136135, -0.7135046, 0, 0, 0, 1, 1,
0.6570174, -0.09476853, 2.636215, 0, 0, 0, 1, 1,
0.6584134, 0.1280488, 0.5737141, 1, 1, 1, 1, 1,
0.6628282, -1.431788, 1.953395, 1, 1, 1, 1, 1,
0.6635023, -1.597106, 1.761767, 1, 1, 1, 1, 1,
0.6643266, 0.3508003, 2.04472, 1, 1, 1, 1, 1,
0.6679453, 0.8975971, 0.600083, 1, 1, 1, 1, 1,
0.6686345, -1.356503, 1.750811, 1, 1, 1, 1, 1,
0.6741094, -0.6420012, 1.695383, 1, 1, 1, 1, 1,
0.674437, -1.442526, 3.660705, 1, 1, 1, 1, 1,
0.6760045, 0.3442115, 1.901249, 1, 1, 1, 1, 1,
0.67612, -0.3658482, 1.61016, 1, 1, 1, 1, 1,
0.6772413, 0.02395878, 0.2260834, 1, 1, 1, 1, 1,
0.6775956, 0.7355571, 0.9860249, 1, 1, 1, 1, 1,
0.6788071, -1.082432, 2.906907, 1, 1, 1, 1, 1,
0.6800275, -1.49824, 3.517558, 1, 1, 1, 1, 1,
0.6836791, -0.3504996, 0.8174993, 1, 1, 1, 1, 1,
0.6861604, 0.8692753, -1.091038, 0, 0, 1, 1, 1,
0.6909624, 0.2104796, 1.154164, 1, 0, 0, 1, 1,
0.6912698, -0.025925, 2.646179, 1, 0, 0, 1, 1,
0.6915119, 0.2231926, 1.862175, 1, 0, 0, 1, 1,
0.6915572, 0.7486352, 0.6346432, 1, 0, 0, 1, 1,
0.7033924, -0.1212481, -0.2350636, 1, 0, 0, 1, 1,
0.704236, -1.286459, 2.028563, 0, 0, 0, 1, 1,
0.7067499, -0.5681261, 2.713851, 0, 0, 0, 1, 1,
0.7236516, -0.7256821, 2.845261, 0, 0, 0, 1, 1,
0.7295742, 1.893637, -0.4847043, 0, 0, 0, 1, 1,
0.7334792, 1.695278, 0.8252024, 0, 0, 0, 1, 1,
0.7337829, -0.003599298, 1.191077, 0, 0, 0, 1, 1,
0.7380971, 1.628356, 0.3135845, 0, 0, 0, 1, 1,
0.7391893, -0.6225707, 2.735445, 1, 1, 1, 1, 1,
0.7420174, -0.8120204, 2.962563, 1, 1, 1, 1, 1,
0.7422585, -0.5792737, 1.350013, 1, 1, 1, 1, 1,
0.7502921, -0.7738756, 3.058336, 1, 1, 1, 1, 1,
0.7569704, -0.06756809, 3.259051, 1, 1, 1, 1, 1,
0.7574497, -1.220505, 3.096315, 1, 1, 1, 1, 1,
0.764558, -0.4487958, 3.470931, 1, 1, 1, 1, 1,
0.7696226, 1.064616, 0.6988616, 1, 1, 1, 1, 1,
0.7718472, 0.2842519, 1.793786, 1, 1, 1, 1, 1,
0.7725241, -0.7740165, 2.705667, 1, 1, 1, 1, 1,
0.7774063, -0.67498, 3.184912, 1, 1, 1, 1, 1,
0.7847348, 0.07978751, 2.337316, 1, 1, 1, 1, 1,
0.7853808, 0.6821842, 0.3434833, 1, 1, 1, 1, 1,
0.785435, 0.612496, 1.01468, 1, 1, 1, 1, 1,
0.7858597, -0.4984625, 0.9381496, 1, 1, 1, 1, 1,
0.7916687, -0.006062621, 1.969331, 0, 0, 1, 1, 1,
0.7991896, -2.083639, 3.593638, 1, 0, 0, 1, 1,
0.8091003, -0.6079062, 2.699639, 1, 0, 0, 1, 1,
0.8103867, 1.525212, 0.2627709, 1, 0, 0, 1, 1,
0.8138387, -1.358139, 2.647906, 1, 0, 0, 1, 1,
0.8168151, -1.281673, 2.901432, 1, 0, 0, 1, 1,
0.8217405, 2.842464, -0.3892274, 0, 0, 0, 1, 1,
0.8259965, -0.6373783, 2.934158, 0, 0, 0, 1, 1,
0.8316431, -0.2965427, 1.979606, 0, 0, 0, 1, 1,
0.8371853, -0.8208158, 1.185943, 0, 0, 0, 1, 1,
0.8415503, -0.2483637, 1.431351, 0, 0, 0, 1, 1,
0.8415814, -0.4292411, 2.855438, 0, 0, 0, 1, 1,
0.8431289, 0.09281425, 1.262648, 0, 0, 0, 1, 1,
0.8432258, -0.3795419, 2.082615, 1, 1, 1, 1, 1,
0.8435903, 0.3639129, 0.8642958, 1, 1, 1, 1, 1,
0.8449303, -0.0159531, 1.006606, 1, 1, 1, 1, 1,
0.8458271, 0.6643767, 1.589961, 1, 1, 1, 1, 1,
0.8475991, 0.4306688, 1.407815, 1, 1, 1, 1, 1,
0.8495868, 0.4604589, 1.95383, 1, 1, 1, 1, 1,
0.8499161, -1.659566, 3.331434, 1, 1, 1, 1, 1,
0.8512631, 1.232991, 0.2833558, 1, 1, 1, 1, 1,
0.8577481, 1.271826, -0.3050057, 1, 1, 1, 1, 1,
0.8588749, -0.1721845, 0.7207654, 1, 1, 1, 1, 1,
0.8596362, 1.027175, -1.346998, 1, 1, 1, 1, 1,
0.861768, 0.06489476, 3.391453, 1, 1, 1, 1, 1,
0.8728551, 0.252936, 0.2368858, 1, 1, 1, 1, 1,
0.8740575, -0.2132272, 2.41146, 1, 1, 1, 1, 1,
0.8810505, -2.22998, 3.244625, 1, 1, 1, 1, 1,
0.8820981, -0.2843259, 1.360294, 0, 0, 1, 1, 1,
0.8881294, 0.7755569, 0.7106408, 1, 0, 0, 1, 1,
0.8903993, 0.1735457, 1.051181, 1, 0, 0, 1, 1,
0.8942851, 0.2223556, 0.9966721, 1, 0, 0, 1, 1,
0.8962533, -1.145458, 3.140504, 1, 0, 0, 1, 1,
0.8966454, -0.478, 3.341456, 1, 0, 0, 1, 1,
0.9059878, 0.6908635, 0.8219219, 0, 0, 0, 1, 1,
0.9081374, 0.1201887, 1.917003, 0, 0, 0, 1, 1,
0.9168412, -1.352009, 2.2966, 0, 0, 0, 1, 1,
0.9180502, 0.4146864, -0.4673097, 0, 0, 0, 1, 1,
0.923929, -0.3154517, 3.778768, 0, 0, 0, 1, 1,
0.9241243, 0.5298381, -1.296058, 0, 0, 0, 1, 1,
0.9326752, -0.02616233, 2.160774, 0, 0, 0, 1, 1,
0.9347053, -1.721417, 2.615279, 1, 1, 1, 1, 1,
0.9381328, 1.244697, 1.478061, 1, 1, 1, 1, 1,
0.9493706, 0.2039325, 2.062017, 1, 1, 1, 1, 1,
0.9599667, 0.1160281, 0.8721455, 1, 1, 1, 1, 1,
0.9629732, 1.243508, -0.2966245, 1, 1, 1, 1, 1,
0.9671956, 0.5161833, 2.04465, 1, 1, 1, 1, 1,
0.9673923, 0.4570206, 0.4622797, 1, 1, 1, 1, 1,
0.968307, 1.511288, -0.2093083, 1, 1, 1, 1, 1,
0.9735103, -0.6757774, 2.220148, 1, 1, 1, 1, 1,
0.9749128, -0.4655541, 1.46418, 1, 1, 1, 1, 1,
0.9854244, -0.1437048, 1.87531, 1, 1, 1, 1, 1,
0.985789, 0.2605496, 1.781952, 1, 1, 1, 1, 1,
0.9927002, -0.1779048, 2.674314, 1, 1, 1, 1, 1,
0.9958476, 1.122383, 1.170658, 1, 1, 1, 1, 1,
0.9988356, 0.3563469, 1.199169, 1, 1, 1, 1, 1,
1.00123, 0.5452753, 1.829782, 0, 0, 1, 1, 1,
1.006696, -0.9335749, 1.779484, 1, 0, 0, 1, 1,
1.008622, -0.5482842, 3.858403, 1, 0, 0, 1, 1,
1.011152, 1.416239, 2.322406, 1, 0, 0, 1, 1,
1.031628, -1.256312, 2.556855, 1, 0, 0, 1, 1,
1.031787, -0.1668784, 1.929276, 1, 0, 0, 1, 1,
1.032068, 1.799905, 0.3987758, 0, 0, 0, 1, 1,
1.033312, -0.5375044, 2.302646, 0, 0, 0, 1, 1,
1.036004, 1.664672, 0.04256003, 0, 0, 0, 1, 1,
1.03759, 0.2130864, 2.552267, 0, 0, 0, 1, 1,
1.040364, 0.4278458, 0.8323676, 0, 0, 0, 1, 1,
1.042069, -0.180055, 1.613251, 0, 0, 0, 1, 1,
1.043517, -0.4607254, 3.193945, 0, 0, 0, 1, 1,
1.052877, 2.21598, 0.03486282, 1, 1, 1, 1, 1,
1.061731, -1.427619, 4.214043, 1, 1, 1, 1, 1,
1.071055, -1.024587, 0.8754026, 1, 1, 1, 1, 1,
1.073122, 1.453238, 1.300783, 1, 1, 1, 1, 1,
1.095567, -0.08267646, 3.591617, 1, 1, 1, 1, 1,
1.095669, 1.297626, 0.3669066, 1, 1, 1, 1, 1,
1.097933, -0.3623323, 0.6794472, 1, 1, 1, 1, 1,
1.130107, 0.222787, 1.681469, 1, 1, 1, 1, 1,
1.132959, 1.470594, -0.05601133, 1, 1, 1, 1, 1,
1.132998, -0.2052861, 0.5927358, 1, 1, 1, 1, 1,
1.163142, -1.007138, 1.584205, 1, 1, 1, 1, 1,
1.16926, -0.9887471, 4.955178, 1, 1, 1, 1, 1,
1.173559, -0.9637814, 2.574857, 1, 1, 1, 1, 1,
1.175779, -2.228003, 2.109369, 1, 1, 1, 1, 1,
1.1824, 1.248966, 0.6393829, 1, 1, 1, 1, 1,
1.18915, -0.3553455, 1.752991, 0, 0, 1, 1, 1,
1.193588, -0.4208279, 4.207466, 1, 0, 0, 1, 1,
1.199879, -0.009126442, 1.907683, 1, 0, 0, 1, 1,
1.208033, -0.620058, 4.561738, 1, 0, 0, 1, 1,
1.213344, 1.497212, 1.329558, 1, 0, 0, 1, 1,
1.214225, -0.5039479, 1.989451, 1, 0, 0, 1, 1,
1.219635, 0.409805, 2.257484, 0, 0, 0, 1, 1,
1.224275, -0.2925422, 2.881887, 0, 0, 0, 1, 1,
1.23105, -0.9224418, 3.218721, 0, 0, 0, 1, 1,
1.233978, 0.4497328, 0.8021489, 0, 0, 0, 1, 1,
1.234362, -0.1885562, 0.8473104, 0, 0, 0, 1, 1,
1.255435, -0.1154266, 2.018768, 0, 0, 0, 1, 1,
1.264681, 0.4141363, -0.3877837, 0, 0, 0, 1, 1,
1.269579, -0.7766694, 1.732551, 1, 1, 1, 1, 1,
1.285885, 0.02086243, 1.865332, 1, 1, 1, 1, 1,
1.290765, -0.188466, 2.654137, 1, 1, 1, 1, 1,
1.295158, 0.4094904, 0.2037188, 1, 1, 1, 1, 1,
1.300307, 0.2401097, 1.390551, 1, 1, 1, 1, 1,
1.301276, 0.9995429, 0.8338772, 1, 1, 1, 1, 1,
1.311779, 1.210468, -1.260842, 1, 1, 1, 1, 1,
1.312318, 0.5599599, 1.546402, 1, 1, 1, 1, 1,
1.323171, 0.820726, 0.6598262, 1, 1, 1, 1, 1,
1.325428, -0.6122931, 3.263447, 1, 1, 1, 1, 1,
1.373702, 1.612318, 1.26087, 1, 1, 1, 1, 1,
1.374449, 1.027986, 1.824437, 1, 1, 1, 1, 1,
1.37531, 0.5815219, 1.706759, 1, 1, 1, 1, 1,
1.381941, 0.1019317, 3.571077, 1, 1, 1, 1, 1,
1.38535, -1.280263, 1.438685, 1, 1, 1, 1, 1,
1.386733, -0.1444893, 0.09572037, 0, 0, 1, 1, 1,
1.397, 0.3177612, -0.7842402, 1, 0, 0, 1, 1,
1.406362, -0.2831831, 1.598777, 1, 0, 0, 1, 1,
1.407582, -0.1982353, 1.713507, 1, 0, 0, 1, 1,
1.410539, 0.7014959, 0.4901586, 1, 0, 0, 1, 1,
1.417577, 2.226782, 1.340941, 1, 0, 0, 1, 1,
1.420428, 1.752407, 1.83804, 0, 0, 0, 1, 1,
1.423338, -1.448318, 3.332637, 0, 0, 0, 1, 1,
1.423859, -0.03605083, 0.120585, 0, 0, 0, 1, 1,
1.427306, 0.2661125, 1.615045, 0, 0, 0, 1, 1,
1.437068, 0.388409, 1.184316, 0, 0, 0, 1, 1,
1.448966, -1.750122, 1.789668, 0, 0, 0, 1, 1,
1.451546, -1.797527, 1.037105, 0, 0, 0, 1, 1,
1.451882, -0.1385304, 0.08358731, 1, 1, 1, 1, 1,
1.453103, 0.9150791, 1.069147, 1, 1, 1, 1, 1,
1.476327, -0.5258886, 1.270812, 1, 1, 1, 1, 1,
1.491545, 0.08924035, 1.098464, 1, 1, 1, 1, 1,
1.506265, -0.1442006, 2.859559, 1, 1, 1, 1, 1,
1.506428, -1.124924, 4.972126, 1, 1, 1, 1, 1,
1.512327, 0.06011934, 1.29324, 1, 1, 1, 1, 1,
1.527029, 0.6210006, 2.541125, 1, 1, 1, 1, 1,
1.542747, 0.8731892, 1.314063, 1, 1, 1, 1, 1,
1.548262, -0.09525476, 0.4479043, 1, 1, 1, 1, 1,
1.555822, 0.6898352, 1.64514, 1, 1, 1, 1, 1,
1.582119, 0.8546698, 0.708599, 1, 1, 1, 1, 1,
1.586425, 0.5791458, -1.42005, 1, 1, 1, 1, 1,
1.619065, -1.225291, 3.558056, 1, 1, 1, 1, 1,
1.635885, 1.454502, 1.806472, 1, 1, 1, 1, 1,
1.639825, -0.7361731, 1.43959, 0, 0, 1, 1, 1,
1.655509, -0.06416852, 2.661726, 1, 0, 0, 1, 1,
1.658745, -0.07946578, 1.909338, 1, 0, 0, 1, 1,
1.665265, -1.856814, 2.822512, 1, 0, 0, 1, 1,
1.666222, -1.106014, 1.008499, 1, 0, 0, 1, 1,
1.675286, 0.734506, -0.5865852, 1, 0, 0, 1, 1,
1.685566, 0.6330876, 2.003334, 0, 0, 0, 1, 1,
1.693598, 1.612957, 1.295033, 0, 0, 0, 1, 1,
1.695682, 0.4838278, 0.2411117, 0, 0, 0, 1, 1,
1.716712, 1.130679, 1.87811, 0, 0, 0, 1, 1,
1.743499, 0.122647, 1.635208, 0, 0, 0, 1, 1,
1.744614, -0.7563162, 2.443658, 0, 0, 0, 1, 1,
1.766057, -1.242826, 3.858522, 0, 0, 0, 1, 1,
1.773246, -0.7317612, 1.945541, 1, 1, 1, 1, 1,
1.805992, -1.666932, 2.796157, 1, 1, 1, 1, 1,
1.824122, 1.536692, 0.7712649, 1, 1, 1, 1, 1,
1.854425, 0.2889425, 1.442203, 1, 1, 1, 1, 1,
1.877534, -0.9183519, 2.231048, 1, 1, 1, 1, 1,
1.881049, -0.6350418, 2.458346, 1, 1, 1, 1, 1,
1.916311, 1.100632, -1.895979, 1, 1, 1, 1, 1,
1.927036, 2.058401, 3.388711, 1, 1, 1, 1, 1,
1.948373, 0.09362663, 0.1895067, 1, 1, 1, 1, 1,
1.95827, -0.3341649, 1.088035, 1, 1, 1, 1, 1,
1.97631, 0.5419104, 1.554763, 1, 1, 1, 1, 1,
1.983663, -0.8957944, 1.667941, 1, 1, 1, 1, 1,
2.018916, 0.4925283, 1.416844, 1, 1, 1, 1, 1,
2.033693, 0.2713992, 1.062584, 1, 1, 1, 1, 1,
2.062393, -0.6994084, 0.8080225, 1, 1, 1, 1, 1,
2.065297, 0.235738, 1.285981, 0, 0, 1, 1, 1,
2.06846, 0.1623103, 3.400411, 1, 0, 0, 1, 1,
2.073773, -0.09409934, 1.622564, 1, 0, 0, 1, 1,
2.111741, -1.423909, 4.735938, 1, 0, 0, 1, 1,
2.113438, -0.5322993, -0.1315066, 1, 0, 0, 1, 1,
2.147968, 1.036513, 1.121454, 1, 0, 0, 1, 1,
2.15608, 0.8426805, 1.641987, 0, 0, 0, 1, 1,
2.176531, 0.4228413, 0.7670744, 0, 0, 0, 1, 1,
2.239601, 0.8394837, 2.564917, 0, 0, 0, 1, 1,
2.250641, 0.06282455, 0.726173, 0, 0, 0, 1, 1,
2.263056, 0.4326291, 2.168639, 0, 0, 0, 1, 1,
2.293314, -0.7830555, 1.170069, 0, 0, 0, 1, 1,
2.294373, 1.188192, 1.288483, 0, 0, 0, 1, 1,
2.297629, 0.1249877, 1.352577, 1, 1, 1, 1, 1,
2.421865, -0.9886782, 2.609611, 1, 1, 1, 1, 1,
2.489013, -1.454173, 4.490537, 1, 1, 1, 1, 1,
2.628659, 0.4320109, 1.929973, 1, 1, 1, 1, 1,
2.787317, 0.3242152, 1.106219, 1, 1, 1, 1, 1,
3.004887, 1.173911, 0.8393342, 1, 1, 1, 1, 1,
3.240346, -0.02961476, 1.218296, 1, 1, 1, 1, 1
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
var radius = 9.802154;
var distance = 34.42965;
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
mvMatrix.translate( 0.2775586, -0.06696558, 0.5390666 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.42965);
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
