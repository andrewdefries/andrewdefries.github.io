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
-3.929143, -0.8939741, -3.197078, 1, 0, 0, 1,
-2.91531, 0.1548105, -2.585826, 1, 0.007843138, 0, 1,
-2.852946, 0.6801573, 0.06210071, 1, 0.01176471, 0, 1,
-2.752671, 1.660473, -2.745281, 1, 0.01960784, 0, 1,
-2.723609, 0.02725798, -0.3338698, 1, 0.02352941, 0, 1,
-2.707026, 0.07453671, -2.834099, 1, 0.03137255, 0, 1,
-2.528284, 1.213743, -0.6378006, 1, 0.03529412, 0, 1,
-2.502891, -0.1372757, -1.748615, 1, 0.04313726, 0, 1,
-2.483549, 0.6104736, -1.233993, 1, 0.04705882, 0, 1,
-2.427188, -0.2081407, -1.722812, 1, 0.05490196, 0, 1,
-2.407306, 1.09335, -2.042723, 1, 0.05882353, 0, 1,
-2.386153, 1.51861, 0.2259898, 1, 0.06666667, 0, 1,
-2.348504, -0.7358949, -1.551978, 1, 0.07058824, 0, 1,
-2.345296, 0.07804697, -3.344297, 1, 0.07843138, 0, 1,
-2.343392, -1.419965, -1.397713, 1, 0.08235294, 0, 1,
-2.265325, 2.556127, -0.6692752, 1, 0.09019608, 0, 1,
-2.247549, -1.485769, -2.303689, 1, 0.09411765, 0, 1,
-2.242445, -1.767592, -2.784505, 1, 0.1019608, 0, 1,
-2.207674, 1.658886, 0.1209092, 1, 0.1098039, 0, 1,
-2.192079, 1.693137, -1.126876, 1, 0.1137255, 0, 1,
-2.188509, -0.2584982, -0.2033788, 1, 0.1215686, 0, 1,
-2.173088, -1.205609, -1.808392, 1, 0.1254902, 0, 1,
-2.13283, -0.9577643, -1.733302, 1, 0.1333333, 0, 1,
-2.071, -0.6083534, -2.123042, 1, 0.1372549, 0, 1,
-2.068887, 2.510428, -0.09183551, 1, 0.145098, 0, 1,
-2.059837, 0.1973372, -2.110747, 1, 0.1490196, 0, 1,
-2.039819, -1.617964, -2.298111, 1, 0.1568628, 0, 1,
-2.039077, 0.03341394, -1.344333, 1, 0.1607843, 0, 1,
-2.027345, 0.436044, 1.044072, 1, 0.1686275, 0, 1,
-2.023114, -0.7116955, -2.578391, 1, 0.172549, 0, 1,
-2.012701, -0.2994772, -3.141073, 1, 0.1803922, 0, 1,
-1.983339, -0.1686824, -1.287287, 1, 0.1843137, 0, 1,
-1.972976, -2.048094, -3.008582, 1, 0.1921569, 0, 1,
-1.936764, 1.500146, -1.515672, 1, 0.1960784, 0, 1,
-1.914912, 0.9267659, -1.119159, 1, 0.2039216, 0, 1,
-1.907558, -0.1064618, -2.400561, 1, 0.2117647, 0, 1,
-1.902301, 1.072386, -1.878962, 1, 0.2156863, 0, 1,
-1.89941, 0.007632302, -0.04271387, 1, 0.2235294, 0, 1,
-1.874999, -1.127918, -0.6227376, 1, 0.227451, 0, 1,
-1.848302, -1.286778, -0.1229579, 1, 0.2352941, 0, 1,
-1.824778, 1.479124, -3.445156, 1, 0.2392157, 0, 1,
-1.807075, 1.287122, 0.9841111, 1, 0.2470588, 0, 1,
-1.7884, -0.6928656, -0.4836439, 1, 0.2509804, 0, 1,
-1.765713, 0.7221637, -2.952909, 1, 0.2588235, 0, 1,
-1.762005, -2.441107, -3.764637, 1, 0.2627451, 0, 1,
-1.74608, 0.8336661, -2.444964, 1, 0.2705882, 0, 1,
-1.738129, 0.4606693, -0.6525274, 1, 0.2745098, 0, 1,
-1.735846, 1.203251, -0.4251447, 1, 0.282353, 0, 1,
-1.73365, 0.4931446, -0.2073494, 1, 0.2862745, 0, 1,
-1.720197, 2.152554, -0.4757962, 1, 0.2941177, 0, 1,
-1.684236, 1.058971, -0.8661239, 1, 0.3019608, 0, 1,
-1.684055, 0.4917067, -0.7372952, 1, 0.3058824, 0, 1,
-1.664563, -2.426683, -3.125736, 1, 0.3137255, 0, 1,
-1.664194, 0.1878644, -0.02180029, 1, 0.3176471, 0, 1,
-1.663699, 0.6613858, -1.189914, 1, 0.3254902, 0, 1,
-1.655185, -1.352876, -2.430379, 1, 0.3294118, 0, 1,
-1.651423, 1.214578, -0.5531169, 1, 0.3372549, 0, 1,
-1.639422, -0.7533194, -3.083361, 1, 0.3411765, 0, 1,
-1.636317, 0.4434747, -0.6411949, 1, 0.3490196, 0, 1,
-1.635719, 1.683304, -1.897176, 1, 0.3529412, 0, 1,
-1.62943, -1.429238, -2.701385, 1, 0.3607843, 0, 1,
-1.595724, 1.318987, -2.272165, 1, 0.3647059, 0, 1,
-1.582263, 0.5113089, -0.7118734, 1, 0.372549, 0, 1,
-1.551799, -0.5269729, -2.305794, 1, 0.3764706, 0, 1,
-1.536929, 1.299631, -0.3635497, 1, 0.3843137, 0, 1,
-1.533067, 0.6624348, -2.801664, 1, 0.3882353, 0, 1,
-1.505023, -0.06199082, -1.7133, 1, 0.3960784, 0, 1,
-1.474151, -0.729852, -3.547982, 1, 0.4039216, 0, 1,
-1.450284, 0.1893244, -1.100425, 1, 0.4078431, 0, 1,
-1.440999, 0.1149485, 0.8191574, 1, 0.4156863, 0, 1,
-1.439344, 1.066625, -1.41089, 1, 0.4196078, 0, 1,
-1.436396, 2.382245, 0.7324749, 1, 0.427451, 0, 1,
-1.410408, -0.6109743, -0.7462006, 1, 0.4313726, 0, 1,
-1.409884, 0.5534944, -1.311419, 1, 0.4392157, 0, 1,
-1.400371, -1.008011, -2.350531, 1, 0.4431373, 0, 1,
-1.40022, -0.109126, -2.127087, 1, 0.4509804, 0, 1,
-1.393555, -0.2543545, -3.953731, 1, 0.454902, 0, 1,
-1.386302, -2.016233, -1.832281, 1, 0.4627451, 0, 1,
-1.384995, -0.969994, -1.528934, 1, 0.4666667, 0, 1,
-1.382285, 0.5293201, -1.556265, 1, 0.4745098, 0, 1,
-1.373868, -1.603141, -3.955785, 1, 0.4784314, 0, 1,
-1.372161, -0.039909, -0.2035888, 1, 0.4862745, 0, 1,
-1.372009, -0.6069902, -1.199997, 1, 0.4901961, 0, 1,
-1.368193, -1.747673, -2.851298, 1, 0.4980392, 0, 1,
-1.3678, -0.7073243, -3.31297, 1, 0.5058824, 0, 1,
-1.346203, -0.4343928, -3.149722, 1, 0.509804, 0, 1,
-1.340394, -0.22023, -1.573136, 1, 0.5176471, 0, 1,
-1.338132, 0.24781, -2.532051, 1, 0.5215687, 0, 1,
-1.331325, 0.374586, -1.85601, 1, 0.5294118, 0, 1,
-1.321191, -1.635029, -1.565552, 1, 0.5333334, 0, 1,
-1.320384, -0.7674062, -1.305849, 1, 0.5411765, 0, 1,
-1.316042, 1.480185, 2.060251, 1, 0.5450981, 0, 1,
-1.314577, -1.039581, -1.527106, 1, 0.5529412, 0, 1,
-1.296588, -0.4771737, -1.048209, 1, 0.5568628, 0, 1,
-1.292997, -0.6052186, -3.247216, 1, 0.5647059, 0, 1,
-1.290883, 0.07620809, -2.652734, 1, 0.5686275, 0, 1,
-1.290683, -0.3634849, -3.539061, 1, 0.5764706, 0, 1,
-1.282301, -0.6877096, -2.055659, 1, 0.5803922, 0, 1,
-1.27719, -0.7421845, -2.448647, 1, 0.5882353, 0, 1,
-1.271661, 1.726382, -1.50511, 1, 0.5921569, 0, 1,
-1.265945, 2.154251, -0.3385865, 1, 0.6, 0, 1,
-1.261694, 0.8501521, -1.553275, 1, 0.6078432, 0, 1,
-1.258509, -0.1567611, -1.115659, 1, 0.6117647, 0, 1,
-1.250831, -0.2520585, -1.796473, 1, 0.6196079, 0, 1,
-1.249471, -0.5778024, -1.279529, 1, 0.6235294, 0, 1,
-1.249266, -1.570707, -2.23703, 1, 0.6313726, 0, 1,
-1.246064, -1.19486, -2.291137, 1, 0.6352941, 0, 1,
-1.241448, 0.9976624, -0.2078208, 1, 0.6431373, 0, 1,
-1.230128, -0.7821926, -2.088408, 1, 0.6470588, 0, 1,
-1.213667, -1.041019, -2.841798, 1, 0.654902, 0, 1,
-1.205584, 1.61858, -1.48543, 1, 0.6588235, 0, 1,
-1.195868, -0.6634315, -1.140589, 1, 0.6666667, 0, 1,
-1.195102, -1.578247, -0.3980849, 1, 0.6705883, 0, 1,
-1.193864, -1.185647, -1.802281, 1, 0.6784314, 0, 1,
-1.187972, 0.1386237, -0.8426846, 1, 0.682353, 0, 1,
-1.186442, -0.5460552, -1.62514, 1, 0.6901961, 0, 1,
-1.185674, 0.7584633, -0.01984301, 1, 0.6941177, 0, 1,
-1.163347, 0.3198159, -1.795929, 1, 0.7019608, 0, 1,
-1.162855, -0.6998154, -2.801992, 1, 0.7098039, 0, 1,
-1.153726, -2.216763, -2.897727, 1, 0.7137255, 0, 1,
-1.147806, 1.826747, -2.108492, 1, 0.7215686, 0, 1,
-1.14739, 0.2061357, -1.176997, 1, 0.7254902, 0, 1,
-1.139397, -0.8142254, -3.252668, 1, 0.7333333, 0, 1,
-1.137885, 0.7100307, -1.084612, 1, 0.7372549, 0, 1,
-1.127995, 0.324686, -1.214152, 1, 0.7450981, 0, 1,
-1.123968, -0.6973588, -3.681333, 1, 0.7490196, 0, 1,
-1.119644, -0.2072281, -0.7851102, 1, 0.7568628, 0, 1,
-1.109618, 0.6009313, 0.3023645, 1, 0.7607843, 0, 1,
-1.102421, -0.4623685, -1.651635, 1, 0.7686275, 0, 1,
-1.097281, 0.9200441, -0.5989546, 1, 0.772549, 0, 1,
-1.093448, 1.078457, -0.947592, 1, 0.7803922, 0, 1,
-1.083899, -0.5518383, -2.708874, 1, 0.7843137, 0, 1,
-1.083033, -0.3768895, -1.233303, 1, 0.7921569, 0, 1,
-1.077099, 2.068547, 0.04413641, 1, 0.7960784, 0, 1,
-1.070694, -0.3265662, -0.9752164, 1, 0.8039216, 0, 1,
-1.064306, 1.149472, 1.602352, 1, 0.8117647, 0, 1,
-1.060839, -1.555789, -1.168135, 1, 0.8156863, 0, 1,
-1.060557, 0.7729759, -1.27989, 1, 0.8235294, 0, 1,
-1.054356, 0.8840452, -2.077452, 1, 0.827451, 0, 1,
-1.053862, 0.6064068, -0.7185642, 1, 0.8352941, 0, 1,
-1.051685, 0.01269128, -0.7310853, 1, 0.8392157, 0, 1,
-1.042929, 0.4694838, -0.1213598, 1, 0.8470588, 0, 1,
-1.04114, 0.5073075, -2.246552, 1, 0.8509804, 0, 1,
-1.037166, 0.3680396, -1.23911, 1, 0.8588235, 0, 1,
-1.036884, 1.204882, -1.104946, 1, 0.8627451, 0, 1,
-1.031083, 0.4164436, -0.8076453, 1, 0.8705882, 0, 1,
-1.022996, 0.4783075, -2.874375, 1, 0.8745098, 0, 1,
-1.022887, -0.6227279, -2.996885, 1, 0.8823529, 0, 1,
-1.01772, -1.52379, -1.457461, 1, 0.8862745, 0, 1,
-1.016264, 0.1054063, -0.571671, 1, 0.8941177, 0, 1,
-1.015474, -0.6427622, -1.54039, 1, 0.8980392, 0, 1,
-1.010743, -1.460873, -2.941694, 1, 0.9058824, 0, 1,
-1.005374, -0.2182786, -1.352316, 1, 0.9137255, 0, 1,
-1.003021, 0.9202375, -0.008137999, 1, 0.9176471, 0, 1,
-1.000947, 0.153832, -1.517358, 1, 0.9254902, 0, 1,
-1.000713, -0.6825663, -3.085019, 1, 0.9294118, 0, 1,
-0.9935552, -0.3959013, 0.5109582, 1, 0.9372549, 0, 1,
-0.9921905, 1.313478, -1.526622, 1, 0.9411765, 0, 1,
-0.9893542, 0.8422858, -2.229385, 1, 0.9490196, 0, 1,
-0.9885251, -1.100695, -3.281469, 1, 0.9529412, 0, 1,
-0.9831553, 1.255288, -1.236354, 1, 0.9607843, 0, 1,
-0.9804212, -0.03468868, 1.206366, 1, 0.9647059, 0, 1,
-0.9743223, 0.905931, -0.9772276, 1, 0.972549, 0, 1,
-0.9738721, -0.2479678, -3.984712, 1, 0.9764706, 0, 1,
-0.9732309, -0.3869523, -0.5347719, 1, 0.9843137, 0, 1,
-0.9702849, -1.522985, -1.763864, 1, 0.9882353, 0, 1,
-0.9679751, 0.5292727, -1.057921, 1, 0.9960784, 0, 1,
-0.9661826, -1.097369, -1.021143, 0.9960784, 1, 0, 1,
-0.9625494, 0.06966156, -1.04895, 0.9921569, 1, 0, 1,
-0.9613193, 0.667616, -0.4031673, 0.9843137, 1, 0, 1,
-0.9560713, 0.2705248, -1.680868, 0.9803922, 1, 0, 1,
-0.9511673, -0.7140994, -1.912092, 0.972549, 1, 0, 1,
-0.9485718, -0.04803084, -3.367975, 0.9686275, 1, 0, 1,
-0.9390104, 1.034716, -0.7781579, 0.9607843, 1, 0, 1,
-0.9282367, 0.800007, -0.9607944, 0.9568627, 1, 0, 1,
-0.9271049, -1.028971, -2.259928, 0.9490196, 1, 0, 1,
-0.9108966, 0.09416813, -1.65071, 0.945098, 1, 0, 1,
-0.9032531, -0.008292315, -2.044832, 0.9372549, 1, 0, 1,
-0.9000333, -1.405571, -0.334587, 0.9333333, 1, 0, 1,
-0.8993176, 1.617619, 0.1007587, 0.9254902, 1, 0, 1,
-0.898976, 0.428075, -0.5828614, 0.9215686, 1, 0, 1,
-0.8958509, 2.545963, -0.1931373, 0.9137255, 1, 0, 1,
-0.8952586, -0.7871223, -2.131669, 0.9098039, 1, 0, 1,
-0.8931192, -0.4227802, -1.452213, 0.9019608, 1, 0, 1,
-0.8913245, -1.12125, -3.359637, 0.8941177, 1, 0, 1,
-0.8885584, 0.2528987, -1.452037, 0.8901961, 1, 0, 1,
-0.8867214, -1.236335, -3.660458, 0.8823529, 1, 0, 1,
-0.8865005, -1.051895, -2.914185, 0.8784314, 1, 0, 1,
-0.8856434, 2.082108, -0.3758659, 0.8705882, 1, 0, 1,
-0.8824599, -0.09139103, -2.533137, 0.8666667, 1, 0, 1,
-0.8800712, 1.209433, -0.1299438, 0.8588235, 1, 0, 1,
-0.880063, 0.9098284, -1.606532, 0.854902, 1, 0, 1,
-0.8764752, 0.6948375, -3.033229, 0.8470588, 1, 0, 1,
-0.8759608, -2.009834, -2.216052, 0.8431373, 1, 0, 1,
-0.8740046, 0.09113628, -2.69314, 0.8352941, 1, 0, 1,
-0.8684562, -0.3422787, -1.268047, 0.8313726, 1, 0, 1,
-0.8601276, 0.7118362, -1.765664, 0.8235294, 1, 0, 1,
-0.8498027, -0.6241481, -1.920438, 0.8196079, 1, 0, 1,
-0.8464197, 1.236319, 0.1412911, 0.8117647, 1, 0, 1,
-0.8458838, -2.078775, -3.103139, 0.8078431, 1, 0, 1,
-0.8420105, 0.292935, -2.846688, 0.8, 1, 0, 1,
-0.8416193, 0.8736616, -0.39113, 0.7921569, 1, 0, 1,
-0.8413476, 0.2012301, -2.673589, 0.7882353, 1, 0, 1,
-0.8408123, 0.06867824, -0.7182814, 0.7803922, 1, 0, 1,
-0.837365, 0.4232286, -0.8595671, 0.7764706, 1, 0, 1,
-0.8365601, -0.9798561, -3.268908, 0.7686275, 1, 0, 1,
-0.8364083, 0.09656595, -0.5156445, 0.7647059, 1, 0, 1,
-0.8361814, -0.4630977, -0.3754247, 0.7568628, 1, 0, 1,
-0.8360204, 0.2590452, 1.215576, 0.7529412, 1, 0, 1,
-0.8331871, -0.401233, -1.384058, 0.7450981, 1, 0, 1,
-0.8328036, -0.3771282, -1.646541, 0.7411765, 1, 0, 1,
-0.8266791, 0.3266769, -2.614921, 0.7333333, 1, 0, 1,
-0.8261958, 0.785752, 1.255732, 0.7294118, 1, 0, 1,
-0.8251297, 0.4009314, -1.686112, 0.7215686, 1, 0, 1,
-0.824362, 0.8979421, 0.5536311, 0.7176471, 1, 0, 1,
-0.8227936, 1.168913, 0.002876681, 0.7098039, 1, 0, 1,
-0.8205107, 1.796628, -0.8310972, 0.7058824, 1, 0, 1,
-0.8160939, 1.069047, -1.856331, 0.6980392, 1, 0, 1,
-0.8137529, 0.1101833, -2.97663, 0.6901961, 1, 0, 1,
-0.8118023, -0.2828074, -2.318828, 0.6862745, 1, 0, 1,
-0.8102831, -0.4251914, -2.873372, 0.6784314, 1, 0, 1,
-0.8048809, -0.6507688, -2.640238, 0.6745098, 1, 0, 1,
-0.8023807, 0.9012302, -0.1611605, 0.6666667, 1, 0, 1,
-0.7958, 0.4155567, -0.6207238, 0.6627451, 1, 0, 1,
-0.7942368, -1.484614, -2.853337, 0.654902, 1, 0, 1,
-0.7925746, -0.6832886, -1.42849, 0.6509804, 1, 0, 1,
-0.7895505, 2.147466, -0.9510784, 0.6431373, 1, 0, 1,
-0.7880096, 1.07102, -1.228019, 0.6392157, 1, 0, 1,
-0.7765848, -1.004701, -2.988966, 0.6313726, 1, 0, 1,
-0.7765057, 1.161035, 0.857273, 0.627451, 1, 0, 1,
-0.7708745, 2.486185, 0.3173417, 0.6196079, 1, 0, 1,
-0.7633726, 1.444119, 0.4971561, 0.6156863, 1, 0, 1,
-0.758409, -0.6147022, -2.726713, 0.6078432, 1, 0, 1,
-0.7554536, -0.09065873, -0.6159699, 0.6039216, 1, 0, 1,
-0.7540199, -0.7726234, -3.365968, 0.5960785, 1, 0, 1,
-0.7535901, 0.3874627, -0.804733, 0.5882353, 1, 0, 1,
-0.7512847, -1.661367, -3.052056, 0.5843138, 1, 0, 1,
-0.7501112, 1.667878, 0.2487271, 0.5764706, 1, 0, 1,
-0.7443058, -1.111555, -3.345689, 0.572549, 1, 0, 1,
-0.7439074, 1.79588, -0.7897025, 0.5647059, 1, 0, 1,
-0.7420027, -0.06484518, -1.091868, 0.5607843, 1, 0, 1,
-0.7388999, 0.8298472, -0.2577112, 0.5529412, 1, 0, 1,
-0.7339589, -0.519924, -2.682606, 0.5490196, 1, 0, 1,
-0.7328734, -0.945478, -4.462101, 0.5411765, 1, 0, 1,
-0.7327557, -0.9230026, -1.703021, 0.5372549, 1, 0, 1,
-0.7294307, -2.225854, -3.726605, 0.5294118, 1, 0, 1,
-0.717257, 0.8821558, -0.2098315, 0.5254902, 1, 0, 1,
-0.7167529, -0.8890623, -1.37325, 0.5176471, 1, 0, 1,
-0.7114226, -0.4033645, -1.858292, 0.5137255, 1, 0, 1,
-0.710642, 1.591368, -0.3803214, 0.5058824, 1, 0, 1,
-0.7041308, 0.8207552, 0.5461397, 0.5019608, 1, 0, 1,
-0.7034357, 1.411146, -0.06702433, 0.4941176, 1, 0, 1,
-0.6979681, -0.5382222, -0.4484057, 0.4862745, 1, 0, 1,
-0.6956829, 0.6499706, -0.9165431, 0.4823529, 1, 0, 1,
-0.6914684, 1.383191, -0.7934979, 0.4745098, 1, 0, 1,
-0.6725613, 0.4135205, -1.686507, 0.4705882, 1, 0, 1,
-0.6697408, 0.9445972, -0.8768022, 0.4627451, 1, 0, 1,
-0.6683648, -0.4119969, -1.537658, 0.4588235, 1, 0, 1,
-0.6680312, 0.370031, -2.637196, 0.4509804, 1, 0, 1,
-0.6679628, 1.571328, -1.144112, 0.4470588, 1, 0, 1,
-0.6679188, 0.6987849, -0.5094653, 0.4392157, 1, 0, 1,
-0.6663045, 0.9498107, -0.2154678, 0.4352941, 1, 0, 1,
-0.6655513, -0.3967048, -2.685568, 0.427451, 1, 0, 1,
-0.6655247, -1.524552, -3.632421, 0.4235294, 1, 0, 1,
-0.6619356, -0.1310062, -2.741571, 0.4156863, 1, 0, 1,
-0.6592348, 1.093259, -1.298533, 0.4117647, 1, 0, 1,
-0.6577089, -0.3773716, -1.69964, 0.4039216, 1, 0, 1,
-0.6569167, 0.6554105, 0.5327699, 0.3960784, 1, 0, 1,
-0.6503862, -0.7654657, -2.672446, 0.3921569, 1, 0, 1,
-0.6482513, 0.3197643, -1.629639, 0.3843137, 1, 0, 1,
-0.6465324, 0.9572831, -1.396897, 0.3803922, 1, 0, 1,
-0.6441236, -1.007573, -1.70682, 0.372549, 1, 0, 1,
-0.6396679, 0.5733972, -0.4959401, 0.3686275, 1, 0, 1,
-0.6377558, 0.8121569, -1.912813, 0.3607843, 1, 0, 1,
-0.6357853, 2.18821, 0.4591735, 0.3568628, 1, 0, 1,
-0.6350814, -1.081747, -2.482152, 0.3490196, 1, 0, 1,
-0.6349065, -2.255353, -1.850904, 0.345098, 1, 0, 1,
-0.6344323, -0.4720528, -2.294018, 0.3372549, 1, 0, 1,
-0.6245179, 2.788049, 0.904226, 0.3333333, 1, 0, 1,
-0.6244335, 0.5845885, -2.284975, 0.3254902, 1, 0, 1,
-0.6200938, -1.546762, -1.958978, 0.3215686, 1, 0, 1,
-0.6102915, 0.3583681, -2.613664, 0.3137255, 1, 0, 1,
-0.6013878, 1.626546, -1.644282, 0.3098039, 1, 0, 1,
-0.5954328, -1.101085, -4.162308, 0.3019608, 1, 0, 1,
-0.5937968, -0.1094119, -3.156148, 0.2941177, 1, 0, 1,
-0.5842929, -0.3776491, -2.352015, 0.2901961, 1, 0, 1,
-0.5805615, 0.05308511, -1.80122, 0.282353, 1, 0, 1,
-0.5776469, 1.035182, 0.8491784, 0.2784314, 1, 0, 1,
-0.5757638, 0.5653098, -2.066242, 0.2705882, 1, 0, 1,
-0.5737919, 0.03578706, -3.281476, 0.2666667, 1, 0, 1,
-0.5735119, 1.316757, 0.03633934, 0.2588235, 1, 0, 1,
-0.5690317, 0.8422666, -1.216202, 0.254902, 1, 0, 1,
-0.5671856, 0.07506938, -2.395231, 0.2470588, 1, 0, 1,
-0.5661339, -2.359732, -4.283658, 0.2431373, 1, 0, 1,
-0.5647504, 0.1742342, -2.66695, 0.2352941, 1, 0, 1,
-0.5646387, 0.1234124, -0.09564301, 0.2313726, 1, 0, 1,
-0.5579994, 0.9725503, -2.186769, 0.2235294, 1, 0, 1,
-0.5575162, 0.2706515, -1.50267, 0.2196078, 1, 0, 1,
-0.5543286, -0.2612721, 0.001396778, 0.2117647, 1, 0, 1,
-0.5503311, 0.0004342831, -2.220461, 0.2078431, 1, 0, 1,
-0.5503114, -0.50504, -1.459195, 0.2, 1, 0, 1,
-0.5485959, -0.6442612, -0.8701073, 0.1921569, 1, 0, 1,
-0.548076, 0.02289106, -1.576428, 0.1882353, 1, 0, 1,
-0.5462776, 0.5808097, -1.864077, 0.1803922, 1, 0, 1,
-0.5423983, 0.1004605, -1.56405, 0.1764706, 1, 0, 1,
-0.5403227, 1.154437, -1.220687, 0.1686275, 1, 0, 1,
-0.5367403, 1.218236, -1.596086, 0.1647059, 1, 0, 1,
-0.5347522, -0.1011959, -2.286084, 0.1568628, 1, 0, 1,
-0.5317929, 0.3139374, -1.913095, 0.1529412, 1, 0, 1,
-0.5271916, 0.8943452, 0.7158706, 0.145098, 1, 0, 1,
-0.5262381, -1.326886, -2.935341, 0.1411765, 1, 0, 1,
-0.5262157, -0.4038471, -2.069319, 0.1333333, 1, 0, 1,
-0.5251298, -2.006905, -2.542058, 0.1294118, 1, 0, 1,
-0.5235309, -1.788615, -1.868945, 0.1215686, 1, 0, 1,
-0.523173, -1.094611, 0.1578759, 0.1176471, 1, 0, 1,
-0.522993, -0.4202375, -2.371293, 0.1098039, 1, 0, 1,
-0.5201964, -0.8814012, -2.20811, 0.1058824, 1, 0, 1,
-0.516784, -1.304256, -2.605074, 0.09803922, 1, 0, 1,
-0.5148568, -0.7196419, -3.480046, 0.09019608, 1, 0, 1,
-0.5138011, 0.602846, -0.9628646, 0.08627451, 1, 0, 1,
-0.5134724, 1.225803, 1.336259, 0.07843138, 1, 0, 1,
-0.5133885, 0.2617846, -1.1124, 0.07450981, 1, 0, 1,
-0.511795, 1.776914, 0.08748585, 0.06666667, 1, 0, 1,
-0.5115603, -1.177889, -2.340733, 0.0627451, 1, 0, 1,
-0.5003453, 0.3229759, -1.777859, 0.05490196, 1, 0, 1,
-0.4963822, -1.597537, -3.800931, 0.05098039, 1, 0, 1,
-0.4951371, 0.1995518, -2.828802, 0.04313726, 1, 0, 1,
-0.4938901, 1.118052, -1.357209, 0.03921569, 1, 0, 1,
-0.4909893, -2.132359, -3.789796, 0.03137255, 1, 0, 1,
-0.4889707, 0.2654222, -1.060817, 0.02745098, 1, 0, 1,
-0.4889468, -0.7518235, -3.170489, 0.01960784, 1, 0, 1,
-0.4872575, 1.905292, -0.886297, 0.01568628, 1, 0, 1,
-0.485151, -1.480718, -2.023371, 0.007843138, 1, 0, 1,
-0.4827718, 0.7114893, 1.365901, 0.003921569, 1, 0, 1,
-0.4743896, 1.765337, 0.3297636, 0, 1, 0.003921569, 1,
-0.4726649, 0.03451172, -0.7478391, 0, 1, 0.01176471, 1,
-0.4724694, 1.582035, -1.016992, 0, 1, 0.01568628, 1,
-0.4618976, 0.7800979, -0.381255, 0, 1, 0.02352941, 1,
-0.4525628, -0.01534884, -0.9165342, 0, 1, 0.02745098, 1,
-0.4518865, 1.676414, 0.6749489, 0, 1, 0.03529412, 1,
-0.4510235, 0.1842649, -1.151539, 0, 1, 0.03921569, 1,
-0.4497946, 0.6806051, -1.796748, 0, 1, 0.04705882, 1,
-0.4438268, -0.2254268, -1.171632, 0, 1, 0.05098039, 1,
-0.4342594, -0.6784467, -1.160176, 0, 1, 0.05882353, 1,
-0.4342219, -0.9288831, -4.290535, 0, 1, 0.0627451, 1,
-0.4312512, 0.3031491, -0.3175673, 0, 1, 0.07058824, 1,
-0.4310254, 2.050155, 0.2274827, 0, 1, 0.07450981, 1,
-0.4228834, 0.07698017, -0.6895071, 0, 1, 0.08235294, 1,
-0.4193862, -1.061325, -3.494258, 0, 1, 0.08627451, 1,
-0.4184859, 0.6316215, -0.3356268, 0, 1, 0.09411765, 1,
-0.416932, 0.4362821, -2.186051, 0, 1, 0.1019608, 1,
-0.4162678, -0.8983961, -2.022173, 0, 1, 0.1058824, 1,
-0.4128033, -0.9211533, -3.35483, 0, 1, 0.1137255, 1,
-0.4125256, -0.6073444, -2.955423, 0, 1, 0.1176471, 1,
-0.4120966, 0.3450522, -4.198859, 0, 1, 0.1254902, 1,
-0.4120394, -0.05477741, -0.898769, 0, 1, 0.1294118, 1,
-0.4113727, 1.040416, -0.8865204, 0, 1, 0.1372549, 1,
-0.4077177, -0.2968559, -3.516151, 0, 1, 0.1411765, 1,
-0.4030117, 0.7493298, -0.5519707, 0, 1, 0.1490196, 1,
-0.4019934, 0.2273879, -0.8601137, 0, 1, 0.1529412, 1,
-0.3951798, -0.4119531, -2.183372, 0, 1, 0.1607843, 1,
-0.3948338, -0.3587445, -1.801751, 0, 1, 0.1647059, 1,
-0.3948107, -0.6888717, -4.778683, 0, 1, 0.172549, 1,
-0.3867958, -1.351176, -1.280294, 0, 1, 0.1764706, 1,
-0.3830127, -0.9387046, 0.1696672, 0, 1, 0.1843137, 1,
-0.3804897, -0.1393792, -0.9174072, 0, 1, 0.1882353, 1,
-0.3772219, -0.1317369, -1.938824, 0, 1, 0.1960784, 1,
-0.3740764, -0.8605378, -1.156569, 0, 1, 0.2039216, 1,
-0.3736922, 0.6671327, -1.446075, 0, 1, 0.2078431, 1,
-0.3620011, -1.23271, -2.819389, 0, 1, 0.2156863, 1,
-0.358277, 0.5490725, -0.4733753, 0, 1, 0.2196078, 1,
-0.3577951, -0.3530923, -3.791926, 0, 1, 0.227451, 1,
-0.3416134, 0.4775453, 0.4195487, 0, 1, 0.2313726, 1,
-0.3384387, -0.858169, -3.163116, 0, 1, 0.2392157, 1,
-0.3379921, -0.4271124, -1.036577, 0, 1, 0.2431373, 1,
-0.3317652, 0.2387146, 0.3745965, 0, 1, 0.2509804, 1,
-0.3300693, 0.1172843, -0.6900548, 0, 1, 0.254902, 1,
-0.3298496, 0.003140485, -2.526094, 0, 1, 0.2627451, 1,
-0.3263985, 0.5133377, -0.6272888, 0, 1, 0.2666667, 1,
-0.3262109, -1.000645, -3.617418, 0, 1, 0.2745098, 1,
-0.3239479, -1.924218, -4.511507, 0, 1, 0.2784314, 1,
-0.3236248, -0.6428633, -3.141738, 0, 1, 0.2862745, 1,
-0.321206, 0.4795349, -0.6416123, 0, 1, 0.2901961, 1,
-0.3191478, 0.673995, -0.7078047, 0, 1, 0.2980392, 1,
-0.3113663, -0.0597402, -2.07511, 0, 1, 0.3058824, 1,
-0.3095846, 1.034579, -0.5472881, 0, 1, 0.3098039, 1,
-0.305089, -0.4873443, -1.303018, 0, 1, 0.3176471, 1,
-0.3042985, 0.2628104, -0.7036991, 0, 1, 0.3215686, 1,
-0.2938904, 0.6167859, -0.1123265, 0, 1, 0.3294118, 1,
-0.293342, -0.5990667, -3.517725, 0, 1, 0.3333333, 1,
-0.291337, 0.6443713, -0.2890753, 0, 1, 0.3411765, 1,
-0.2908329, -0.07798608, -1.101858, 0, 1, 0.345098, 1,
-0.2892731, 0.2553348, -1.22265, 0, 1, 0.3529412, 1,
-0.2891753, -1.644994, -3.484999, 0, 1, 0.3568628, 1,
-0.2874449, -2.145008, -3.841866, 0, 1, 0.3647059, 1,
-0.2854506, -0.01384487, -2.148674, 0, 1, 0.3686275, 1,
-0.2846425, -0.5505978, -3.098971, 0, 1, 0.3764706, 1,
-0.2809127, -0.9706586, -3.530866, 0, 1, 0.3803922, 1,
-0.2755898, 0.9018584, 0.6551977, 0, 1, 0.3882353, 1,
-0.2744927, -1.697853, -3.436564, 0, 1, 0.3921569, 1,
-0.2718986, -0.2045282, -3.515127, 0, 1, 0.4, 1,
-0.2716139, 0.4130403, 0.9753222, 0, 1, 0.4078431, 1,
-0.2673216, -0.4591764, -2.602048, 0, 1, 0.4117647, 1,
-0.266695, -0.7846769, -3.244341, 0, 1, 0.4196078, 1,
-0.2650324, -0.1047287, -2.570257, 0, 1, 0.4235294, 1,
-0.2642547, -1.320118, -4.044456, 0, 1, 0.4313726, 1,
-0.2632117, -0.7011854, -0.6343219, 0, 1, 0.4352941, 1,
-0.2603062, -0.5610243, -2.198708, 0, 1, 0.4431373, 1,
-0.251849, 1.295864, -0.6947523, 0, 1, 0.4470588, 1,
-0.2489482, 0.2283048, -1.163882, 0, 1, 0.454902, 1,
-0.2462356, 0.1135944, -0.6919522, 0, 1, 0.4588235, 1,
-0.2460963, 0.9421799, 1.130487, 0, 1, 0.4666667, 1,
-0.2446424, 0.5935721, -2.230962, 0, 1, 0.4705882, 1,
-0.244124, 1.459229, 0.3541845, 0, 1, 0.4784314, 1,
-0.2407759, 1.050592, 0.01318381, 0, 1, 0.4823529, 1,
-0.2278902, -1.761525, -2.57441, 0, 1, 0.4901961, 1,
-0.2231781, -1.725981, -3.03977, 0, 1, 0.4941176, 1,
-0.221904, -0.7165922, -3.602566, 0, 1, 0.5019608, 1,
-0.2218844, 0.435763, -0.9803854, 0, 1, 0.509804, 1,
-0.2163258, 0.3810611, -0.3886869, 0, 1, 0.5137255, 1,
-0.2147591, 0.5576449, 0.7520672, 0, 1, 0.5215687, 1,
-0.21425, -0.2307144, -2.833322, 0, 1, 0.5254902, 1,
-0.211459, -0.8804114, -1.581476, 0, 1, 0.5333334, 1,
-0.2096879, -0.6682222, -3.664677, 0, 1, 0.5372549, 1,
-0.2037195, 1.227188, -0.8144937, 0, 1, 0.5450981, 1,
-0.1945307, -0.03850933, -2.459306, 0, 1, 0.5490196, 1,
-0.191884, -1.321982, -2.048411, 0, 1, 0.5568628, 1,
-0.1872045, -0.8746008, -2.060283, 0, 1, 0.5607843, 1,
-0.1863301, 0.6687807, 0.7020135, 0, 1, 0.5686275, 1,
-0.1824439, 0.7646201, -1.353634, 0, 1, 0.572549, 1,
-0.1810406, 1.161397, -1.426735, 0, 1, 0.5803922, 1,
-0.1791113, 0.4771792, 0.8707803, 0, 1, 0.5843138, 1,
-0.1766147, -0.1521502, -1.682078, 0, 1, 0.5921569, 1,
-0.1739235, 0.3408734, -0.6109604, 0, 1, 0.5960785, 1,
-0.1737578, 2.246912, 0.4236262, 0, 1, 0.6039216, 1,
-0.1718616, 0.07907534, -1.621225, 0, 1, 0.6117647, 1,
-0.1682068, 0.5845278, 0.785247, 0, 1, 0.6156863, 1,
-0.1679397, -0.5505823, -4.531324, 0, 1, 0.6235294, 1,
-0.1673185, -0.3907648, -2.057674, 0, 1, 0.627451, 1,
-0.1631745, -0.5221883, -3.909444, 0, 1, 0.6352941, 1,
-0.1575573, -1.649011, -3.709968, 0, 1, 0.6392157, 1,
-0.1562576, 1.252213, -0.6491671, 0, 1, 0.6470588, 1,
-0.1550286, -0.05731585, -0.6547609, 0, 1, 0.6509804, 1,
-0.1520401, 0.3138272, -0.4947156, 0, 1, 0.6588235, 1,
-0.1515608, 0.2781903, -0.07498919, 0, 1, 0.6627451, 1,
-0.1513598, 1.097849, -0.4670566, 0, 1, 0.6705883, 1,
-0.1512243, 1.050257, -1.071633, 0, 1, 0.6745098, 1,
-0.1502716, -0.3290325, -1.306869, 0, 1, 0.682353, 1,
-0.1469999, 1.860288, -1.825395, 0, 1, 0.6862745, 1,
-0.1434052, -0.5980961, -2.544972, 0, 1, 0.6941177, 1,
-0.1425581, 2.30459, 1.698944, 0, 1, 0.7019608, 1,
-0.1421174, 0.5291026, -1.424309, 0, 1, 0.7058824, 1,
-0.1354036, -0.6399227, -2.003424, 0, 1, 0.7137255, 1,
-0.1264497, -1.521252, -3.627556, 0, 1, 0.7176471, 1,
-0.1248835, 0.7022587, 0.5095711, 0, 1, 0.7254902, 1,
-0.1239175, 1.814263, -1.521415, 0, 1, 0.7294118, 1,
-0.1215159, 1.577376, 1.856942, 0, 1, 0.7372549, 1,
-0.1204739, -0.2756764, -3.085815, 0, 1, 0.7411765, 1,
-0.1189087, -0.865123, -2.610932, 0, 1, 0.7490196, 1,
-0.1186084, 0.3978879, -1.731444, 0, 1, 0.7529412, 1,
-0.1177696, 1.058567, 0.1872527, 0, 1, 0.7607843, 1,
-0.116884, 0.8976908, -0.8977848, 0, 1, 0.7647059, 1,
-0.1148481, -0.5242884, -3.154459, 0, 1, 0.772549, 1,
-0.1146829, -1.549489, -3.160372, 0, 1, 0.7764706, 1,
-0.111017, 0.8267775, 0.1457827, 0, 1, 0.7843137, 1,
-0.1063324, 0.09210674, -0.8445706, 0, 1, 0.7882353, 1,
-0.1032427, -1.224624, -2.598579, 0, 1, 0.7960784, 1,
-0.1002427, 1.475152, -0.1885782, 0, 1, 0.8039216, 1,
-0.09653401, -1.841258, -2.838026, 0, 1, 0.8078431, 1,
-0.09651561, 1.526101, 0.3024838, 0, 1, 0.8156863, 1,
-0.09050391, -1.226018, -2.052826, 0, 1, 0.8196079, 1,
-0.08972904, 0.2388063, -1.954631, 0, 1, 0.827451, 1,
-0.08763985, -1.066398, -3.051932, 0, 1, 0.8313726, 1,
-0.08708107, -0.2826836, -3.338649, 0, 1, 0.8392157, 1,
-0.08444713, 0.380538, 0.981039, 0, 1, 0.8431373, 1,
-0.08323158, 0.7886454, -0.6896235, 0, 1, 0.8509804, 1,
-0.08318423, -0.218661, -3.15376, 0, 1, 0.854902, 1,
-0.08280712, -0.1142314, -2.559683, 0, 1, 0.8627451, 1,
-0.07746796, -2.084139, -4.785475, 0, 1, 0.8666667, 1,
-0.07700187, -0.4288109, -3.274955, 0, 1, 0.8745098, 1,
-0.07541814, -0.8661013, -3.92976, 0, 1, 0.8784314, 1,
-0.0746231, -1.372026, -4.11461, 0, 1, 0.8862745, 1,
-0.07083569, -0.2682944, -5.695226, 0, 1, 0.8901961, 1,
-0.06215819, 1.238743, 0.9690945, 0, 1, 0.8980392, 1,
-0.06208839, -1.22552, -3.279299, 0, 1, 0.9058824, 1,
-0.06060008, 1.114912, -0.04965729, 0, 1, 0.9098039, 1,
-0.06023349, -0.6312308, -2.321559, 0, 1, 0.9176471, 1,
-0.0596722, 0.3629275, 0.2361823, 0, 1, 0.9215686, 1,
-0.04257853, 0.2622089, 0.403958, 0, 1, 0.9294118, 1,
-0.04219025, -0.7243608, -3.239982, 0, 1, 0.9333333, 1,
-0.0403625, 0.2063123, -0.08126444, 0, 1, 0.9411765, 1,
-0.03601697, -1.414947, -3.565329, 0, 1, 0.945098, 1,
-0.0311846, -1.166491, -3.297503, 0, 1, 0.9529412, 1,
-0.02993566, -1.467454, -2.095817, 0, 1, 0.9568627, 1,
-0.0296947, -1.196354, -2.537025, 0, 1, 0.9647059, 1,
-0.0236898, -0.8297772, -3.324137, 0, 1, 0.9686275, 1,
-0.01950941, -1.39103, -2.286599, 0, 1, 0.9764706, 1,
-0.018863, 0.244554, -1.561922, 0, 1, 0.9803922, 1,
-0.01813226, -0.3118222, -3.023295, 0, 1, 0.9882353, 1,
-0.01812251, -0.6917444, -4.335419, 0, 1, 0.9921569, 1,
-0.01520307, 0.4198363, -0.075574, 0, 1, 1, 1,
-0.008066076, 0.4788662, 0.8290489, 0, 0.9921569, 1, 1,
-0.005774771, 0.3929915, 0.9669325, 0, 0.9882353, 1, 1,
-0.004984684, -1.746892, -2.899541, 0, 0.9803922, 1, 1,
0.002451646, 0.9162847, 0.1906342, 0, 0.9764706, 1, 1,
0.005087156, -1.077927, 4.466329, 0, 0.9686275, 1, 1,
0.0108866, 2.33615, 0.7001055, 0, 0.9647059, 1, 1,
0.0108922, 1.14503, -1.414965, 0, 0.9568627, 1, 1,
0.01212585, 0.7979137, -0.3316956, 0, 0.9529412, 1, 1,
0.01398445, -0.4231858, 4.82142, 0, 0.945098, 1, 1,
0.02008087, -1.083068, 2.127511, 0, 0.9411765, 1, 1,
0.02189916, -0.5832567, 2.211742, 0, 0.9333333, 1, 1,
0.02313844, -1.553498, 1.950396, 0, 0.9294118, 1, 1,
0.02355334, 0.1780004, 1.447136, 0, 0.9215686, 1, 1,
0.02358256, 0.1480782, 1.653317, 0, 0.9176471, 1, 1,
0.02872383, 0.4820889, -0.5723568, 0, 0.9098039, 1, 1,
0.03195659, 0.05249624, 1.582289, 0, 0.9058824, 1, 1,
0.03434456, 2.081475, 0.0006960061, 0, 0.8980392, 1, 1,
0.03449666, -1.04133, 2.885625, 0, 0.8901961, 1, 1,
0.03483997, -1.252846, 2.305912, 0, 0.8862745, 1, 1,
0.03549546, 1.433468, -0.3366064, 0, 0.8784314, 1, 1,
0.03977158, 0.237192, -1.070552, 0, 0.8745098, 1, 1,
0.04074985, -0.1833577, 1.547211, 0, 0.8666667, 1, 1,
0.04180599, -1.033305, 3.154691, 0, 0.8627451, 1, 1,
0.04309952, -0.9362113, 4.057058, 0, 0.854902, 1, 1,
0.04768211, -0.5463708, 4.141695, 0, 0.8509804, 1, 1,
0.05281518, 1.070818, 1.304346, 0, 0.8431373, 1, 1,
0.05382464, -0.03315574, 1.408309, 0, 0.8392157, 1, 1,
0.0573204, -1.133352, 1.324532, 0, 0.8313726, 1, 1,
0.06118186, -0.9247392, 2.748429, 0, 0.827451, 1, 1,
0.06251467, -0.2537443, 3.5626, 0, 0.8196079, 1, 1,
0.06306344, -0.6186587, 3.948433, 0, 0.8156863, 1, 1,
0.06912053, -0.769887, 3.526855, 0, 0.8078431, 1, 1,
0.07054376, -0.06688471, 2.893783, 0, 0.8039216, 1, 1,
0.07080824, 0.6156983, 0.1782872, 0, 0.7960784, 1, 1,
0.07517186, -0.8874826, 3.815593, 0, 0.7882353, 1, 1,
0.07654183, -0.2708246, 2.391746, 0, 0.7843137, 1, 1,
0.08062773, 0.3106079, 0.452523, 0, 0.7764706, 1, 1,
0.08163348, -1.396799, 2.314183, 0, 0.772549, 1, 1,
0.08712962, -1.435563, 4.405911, 0, 0.7647059, 1, 1,
0.08820584, 1.434025, -0.8076501, 0, 0.7607843, 1, 1,
0.09021313, -0.0816623, 2.921018, 0, 0.7529412, 1, 1,
0.09119374, -1.71288, 1.251438, 0, 0.7490196, 1, 1,
0.09815831, -0.9882437, 2.701045, 0, 0.7411765, 1, 1,
0.1076219, -0.2061775, 3.086614, 0, 0.7372549, 1, 1,
0.1128413, 1.383334, -1.701526, 0, 0.7294118, 1, 1,
0.1174436, 0.2473766, 0.2365209, 0, 0.7254902, 1, 1,
0.1194326, -0.190644, 3.640631, 0, 0.7176471, 1, 1,
0.1267419, 0.0170712, 1.969639, 0, 0.7137255, 1, 1,
0.1274012, 0.03450705, -0.01909084, 0, 0.7058824, 1, 1,
0.1282561, 0.9421178, -0.5989825, 0, 0.6980392, 1, 1,
0.1330628, -0.8713775, 2.09762, 0, 0.6941177, 1, 1,
0.1341072, 0.2166744, -0.08618496, 0, 0.6862745, 1, 1,
0.1358001, 0.2897232, 0.9586123, 0, 0.682353, 1, 1,
0.1365676, 2.591914, 1.982039, 0, 0.6745098, 1, 1,
0.1399738, -0.1882384, 2.702046, 0, 0.6705883, 1, 1,
0.1454768, 0.3530082, -1.2681, 0, 0.6627451, 1, 1,
0.1497928, -0.3354523, 1.936484, 0, 0.6588235, 1, 1,
0.1511493, -0.1717421, 3.569136, 0, 0.6509804, 1, 1,
0.1532269, 0.1178849, 0.6816167, 0, 0.6470588, 1, 1,
0.1628384, 0.2711646, 1.358208, 0, 0.6392157, 1, 1,
0.1642378, 1.596214, -0.2328702, 0, 0.6352941, 1, 1,
0.1644274, -0.2443361, 3.336875, 0, 0.627451, 1, 1,
0.1656747, 0.7986783, 1.354414, 0, 0.6235294, 1, 1,
0.1661284, -0.1244273, 2.48067, 0, 0.6156863, 1, 1,
0.1707985, -0.02185468, 1.998263, 0, 0.6117647, 1, 1,
0.1749568, -0.553884, 2.151604, 0, 0.6039216, 1, 1,
0.1772407, 0.6765743, 1.14241, 0, 0.5960785, 1, 1,
0.1792997, 1.223846, 1.561421, 0, 0.5921569, 1, 1,
0.1816204, -1.184648, 5.520169, 0, 0.5843138, 1, 1,
0.1858189, -0.7710334, 4.063605, 0, 0.5803922, 1, 1,
0.1863865, 0.02741104, -0.2194245, 0, 0.572549, 1, 1,
0.187987, 0.5555487, 1.052719, 0, 0.5686275, 1, 1,
0.1900163, -1.048928, 2.265904, 0, 0.5607843, 1, 1,
0.1902047, 0.8039784, -0.456659, 0, 0.5568628, 1, 1,
0.1917243, 0.1386656, 1.833753, 0, 0.5490196, 1, 1,
0.1979765, 0.7300568, 0.9663876, 0, 0.5450981, 1, 1,
0.2019174, 0.002561031, 1.148211, 0, 0.5372549, 1, 1,
0.2034906, 0.476088, 0.6936262, 0, 0.5333334, 1, 1,
0.2073453, -0.931968, 2.327366, 0, 0.5254902, 1, 1,
0.210409, 0.4136811, 0.8379133, 0, 0.5215687, 1, 1,
0.2135308, 0.5534332, 0.3089026, 0, 0.5137255, 1, 1,
0.2142416, -1.834139, 2.609688, 0, 0.509804, 1, 1,
0.2176232, 0.557748, -0.7651137, 0, 0.5019608, 1, 1,
0.2214335, -1.750441, 2.8898, 0, 0.4941176, 1, 1,
0.2229993, 0.1103113, 1.658598, 0, 0.4901961, 1, 1,
0.2252032, 0.3441829, 1.2715, 0, 0.4823529, 1, 1,
0.2253728, -1.997221, 1.872452, 0, 0.4784314, 1, 1,
0.2272415, 2.151526, 0.3656819, 0, 0.4705882, 1, 1,
0.2288235, -0.5187382, 1.994943, 0, 0.4666667, 1, 1,
0.2317608, -1.243098, 2.596059, 0, 0.4588235, 1, 1,
0.2338813, -0.4668348, 3.973287, 0, 0.454902, 1, 1,
0.2379755, -1.233732, 2.322203, 0, 0.4470588, 1, 1,
0.2430594, -0.3174689, 1.427768, 0, 0.4431373, 1, 1,
0.2436357, -0.7559515, 2.566291, 0, 0.4352941, 1, 1,
0.2446978, 1.220425, -0.04557205, 0, 0.4313726, 1, 1,
0.252973, 1.299447, 1.268354, 0, 0.4235294, 1, 1,
0.2544286, -1.549546, 1.919676, 0, 0.4196078, 1, 1,
0.2552905, -0.7243472, 0.9466349, 0, 0.4117647, 1, 1,
0.2559433, -1.833185, 3.76928, 0, 0.4078431, 1, 1,
0.2576882, 1.241628, -0.5609685, 0, 0.4, 1, 1,
0.2579559, 1.75469, -0.3367182, 0, 0.3921569, 1, 1,
0.2593234, 1.207786, 0.9209908, 0, 0.3882353, 1, 1,
0.2615985, 0.200476, 0.2235778, 0, 0.3803922, 1, 1,
0.2616073, 0.9707689, 1.433288, 0, 0.3764706, 1, 1,
0.2673189, -2.241539, 2.073546, 0, 0.3686275, 1, 1,
0.2685826, 0.3138805, -0.004085064, 0, 0.3647059, 1, 1,
0.2686683, 0.2444484, 1.552552, 0, 0.3568628, 1, 1,
0.2686872, 0.1172673, 0.3235007, 0, 0.3529412, 1, 1,
0.2723013, -0.1950129, 2.379396, 0, 0.345098, 1, 1,
0.2724675, 0.3154258, 0.7736973, 0, 0.3411765, 1, 1,
0.2793744, -1.331635, 0.8872882, 0, 0.3333333, 1, 1,
0.2833967, -0.06311639, 0.9050515, 0, 0.3294118, 1, 1,
0.2867188, 1.315578, -0.04163952, 0, 0.3215686, 1, 1,
0.2907161, -0.5009887, 2.999279, 0, 0.3176471, 1, 1,
0.2931302, 0.3010709, -0.9133972, 0, 0.3098039, 1, 1,
0.2932264, 0.347937, 0.5709128, 0, 0.3058824, 1, 1,
0.2993011, -0.3723104, -0.02274447, 0, 0.2980392, 1, 1,
0.3010058, -0.6334445, 0.5296044, 0, 0.2901961, 1, 1,
0.3060411, -1.33478, 1.963562, 0, 0.2862745, 1, 1,
0.3067726, -0.5758501, 2.729979, 0, 0.2784314, 1, 1,
0.3100333, -0.7098741, 2.499808, 0, 0.2745098, 1, 1,
0.3109817, 0.5863879, 1.800118, 0, 0.2666667, 1, 1,
0.3117654, -0.2566466, 3.841927, 0, 0.2627451, 1, 1,
0.3142634, 2.372681, 0.1457686, 0, 0.254902, 1, 1,
0.3145703, 1.059254, -0.9419248, 0, 0.2509804, 1, 1,
0.316842, -0.5063114, 1.362518, 0, 0.2431373, 1, 1,
0.3170392, -1.274851, 2.134581, 0, 0.2392157, 1, 1,
0.3185764, 2.399077, 0.6247514, 0, 0.2313726, 1, 1,
0.31969, 0.4815936, -0.4286542, 0, 0.227451, 1, 1,
0.3294848, 1.308338, 0.2415424, 0, 0.2196078, 1, 1,
0.3303752, -0.6777042, 3.093448, 0, 0.2156863, 1, 1,
0.3317586, -1.767295, 3.266354, 0, 0.2078431, 1, 1,
0.3396931, 0.397302, 0.6771809, 0, 0.2039216, 1, 1,
0.3434171, -0.4724217, 1.883736, 0, 0.1960784, 1, 1,
0.3441887, 0.8276826, -0.1417515, 0, 0.1882353, 1, 1,
0.3472967, 0.373901, 1.417265, 0, 0.1843137, 1, 1,
0.3494466, -2.071572, 3.359272, 0, 0.1764706, 1, 1,
0.3495527, -0.8725098, 2.780821, 0, 0.172549, 1, 1,
0.3534779, -0.5633165, 1.592459, 0, 0.1647059, 1, 1,
0.3593903, 0.8978821, -0.122122, 0, 0.1607843, 1, 1,
0.3596192, -0.5954126, 0.9669302, 0, 0.1529412, 1, 1,
0.3599641, -1.535343, 5.567474, 0, 0.1490196, 1, 1,
0.3715141, 0.6035131, 1.61193, 0, 0.1411765, 1, 1,
0.3736922, 1.1031, 0.05245637, 0, 0.1372549, 1, 1,
0.3780651, -1.206781, 3.310407, 0, 0.1294118, 1, 1,
0.3781228, 0.5985171, 1.507263, 0, 0.1254902, 1, 1,
0.3797972, -1.389852, 2.704464, 0, 0.1176471, 1, 1,
0.3810108, 0.9123413, -0.4988132, 0, 0.1137255, 1, 1,
0.3888124, 1.228799, -0.3962015, 0, 0.1058824, 1, 1,
0.388821, 1.465048, 0.9281747, 0, 0.09803922, 1, 1,
0.3900523, -0.6843876, 1.394592, 0, 0.09411765, 1, 1,
0.3907865, 1.467687, -0.04524622, 0, 0.08627451, 1, 1,
0.3979716, 1.189329, 3.065264, 0, 0.08235294, 1, 1,
0.3995291, -0.07602909, 3.243787, 0, 0.07450981, 1, 1,
0.4041988, 0.1584439, 0.7953079, 0, 0.07058824, 1, 1,
0.4050037, -0.6392302, 2.173569, 0, 0.0627451, 1, 1,
0.4075117, 0.7786025, 1.729262, 0, 0.05882353, 1, 1,
0.4092407, -0.1190817, 0.8336303, 0, 0.05098039, 1, 1,
0.4095449, -0.1037076, 1.232962, 0, 0.04705882, 1, 1,
0.41139, 0.8510285, 1.159217, 0, 0.03921569, 1, 1,
0.4169199, -0.5145013, 0.7462237, 0, 0.03529412, 1, 1,
0.4200255, 0.2236566, 0.1480728, 0, 0.02745098, 1, 1,
0.4228648, -1.308022, 3.384946, 0, 0.02352941, 1, 1,
0.4251008, -0.6120018, 1.64933, 0, 0.01568628, 1, 1,
0.428258, 0.2791665, 0.7559863, 0, 0.01176471, 1, 1,
0.4416382, -1.14698, 2.897668, 0, 0.003921569, 1, 1,
0.4439416, -0.5406685, 3.030776, 0.003921569, 0, 1, 1,
0.4439627, 0.1851254, 1.733734, 0.007843138, 0, 1, 1,
0.445014, 0.3549719, -0.08549427, 0.01568628, 0, 1, 1,
0.4498226, 0.04835576, 1.013542, 0.01960784, 0, 1, 1,
0.4558812, 0.4612559, 0.3122065, 0.02745098, 0, 1, 1,
0.4596224, 1.281564, -0.06786966, 0.03137255, 0, 1, 1,
0.4616551, -1.087303, 1.647899, 0.03921569, 0, 1, 1,
0.468852, 1.560963, -0.7793444, 0.04313726, 0, 1, 1,
0.4706587, -0.8699982, 1.853347, 0.05098039, 0, 1, 1,
0.47087, -1.048155, 2.014986, 0.05490196, 0, 1, 1,
0.4723017, 0.3186332, 0.6002325, 0.0627451, 0, 1, 1,
0.4789577, -0.1843611, -0.1117001, 0.06666667, 0, 1, 1,
0.4817377, 0.5395479, 1.47915, 0.07450981, 0, 1, 1,
0.4825969, 0.618925, 0.2105432, 0.07843138, 0, 1, 1,
0.4829823, 0.332118, 2.057756, 0.08627451, 0, 1, 1,
0.4847094, 0.9323391, -0.4986813, 0.09019608, 0, 1, 1,
0.4852513, 1.784638, 0.9035029, 0.09803922, 0, 1, 1,
0.492975, 0.3187665, 0.414019, 0.1058824, 0, 1, 1,
0.4955778, 1.678913, 2.237917, 0.1098039, 0, 1, 1,
0.4959847, -1.405927, 2.401696, 0.1176471, 0, 1, 1,
0.4965219, 0.5086581, 0.9159263, 0.1215686, 0, 1, 1,
0.4972001, 0.2022655, 1.783551, 0.1294118, 0, 1, 1,
0.4975112, 2.308839, 2.296877, 0.1333333, 0, 1, 1,
0.5002648, 2.311403, 0.6631751, 0.1411765, 0, 1, 1,
0.5004769, 1.535251, -0.1779284, 0.145098, 0, 1, 1,
0.5004805, -1.573945, 3.668011, 0.1529412, 0, 1, 1,
0.5049699, 1.906295, -1.054754, 0.1568628, 0, 1, 1,
0.5099707, 0.8331242, 0.7491374, 0.1647059, 0, 1, 1,
0.5127813, -0.1430498, 3.835723, 0.1686275, 0, 1, 1,
0.5150802, 0.6056598, 1.090714, 0.1764706, 0, 1, 1,
0.516704, 0.7601525, -0.992371, 0.1803922, 0, 1, 1,
0.5168287, 0.5321711, -0.09023407, 0.1882353, 0, 1, 1,
0.5198333, -0.1291482, 2.75932, 0.1921569, 0, 1, 1,
0.5201786, 0.01389468, 2.259474, 0.2, 0, 1, 1,
0.5292094, -0.1495817, 3.700104, 0.2078431, 0, 1, 1,
0.5316526, 0.9376172, 2.117944, 0.2117647, 0, 1, 1,
0.5324436, 2.032267, 0.4279393, 0.2196078, 0, 1, 1,
0.534169, -1.489993, 2.529635, 0.2235294, 0, 1, 1,
0.5363551, -0.6211637, 2.409502, 0.2313726, 0, 1, 1,
0.5372466, 1.975203, 0.9783705, 0.2352941, 0, 1, 1,
0.5407149, -1.30991, 2.487358, 0.2431373, 0, 1, 1,
0.5476971, 1.301008, 1.378263, 0.2470588, 0, 1, 1,
0.5546953, 0.326368, 1.939641, 0.254902, 0, 1, 1,
0.5561684, 1.977936, -1.370842, 0.2588235, 0, 1, 1,
0.5579937, -0.9294568, 4.371485, 0.2666667, 0, 1, 1,
0.5583657, -0.624579, 3.916758, 0.2705882, 0, 1, 1,
0.5599779, 0.2421301, 2.202747, 0.2784314, 0, 1, 1,
0.5619646, 1.17167, -0.1891607, 0.282353, 0, 1, 1,
0.5643255, 1.077544, -0.2876243, 0.2901961, 0, 1, 1,
0.5695862, 1.4631, 0.1446585, 0.2941177, 0, 1, 1,
0.5718604, -0.2038011, 0.1235647, 0.3019608, 0, 1, 1,
0.5738318, 1.239374, -1.486756, 0.3098039, 0, 1, 1,
0.5744219, 1.661057, 1.497879, 0.3137255, 0, 1, 1,
0.5758646, -0.04571732, 1.081436, 0.3215686, 0, 1, 1,
0.5770617, 1.32329, -0.7143301, 0.3254902, 0, 1, 1,
0.5774224, 2.009085, 0.01095198, 0.3333333, 0, 1, 1,
0.5829939, -1.136253, 1.143921, 0.3372549, 0, 1, 1,
0.5852026, -2.200322, 3.363912, 0.345098, 0, 1, 1,
0.5893755, -1.06532, 0.7212244, 0.3490196, 0, 1, 1,
0.5927393, 0.8698405, 1.567586, 0.3568628, 0, 1, 1,
0.5929732, -0.1781647, 2.970592, 0.3607843, 0, 1, 1,
0.5956485, -0.5438679, 1.701398, 0.3686275, 0, 1, 1,
0.6009128, 1.070495, 1.449856, 0.372549, 0, 1, 1,
0.6048891, -0.02235079, -0.5665065, 0.3803922, 0, 1, 1,
0.6096445, -1.276726, 3.537733, 0.3843137, 0, 1, 1,
0.6108717, -0.2523201, 0.6638634, 0.3921569, 0, 1, 1,
0.6134981, -0.2146578, 2.686383, 0.3960784, 0, 1, 1,
0.617156, 0.5448446, 4.122526, 0.4039216, 0, 1, 1,
0.6244088, 0.06617676, 2.566744, 0.4117647, 0, 1, 1,
0.6269687, -0.4584659, 2.363957, 0.4156863, 0, 1, 1,
0.6276796, -1.919307, 3.650317, 0.4235294, 0, 1, 1,
0.6276889, 1.77604, 1.589358, 0.427451, 0, 1, 1,
0.6344263, 0.6217221, 0.5584893, 0.4352941, 0, 1, 1,
0.6452929, -0.8421903, 2.074105, 0.4392157, 0, 1, 1,
0.6470006, -1.435572, 2.392314, 0.4470588, 0, 1, 1,
0.6476739, -1.608559, 2.680769, 0.4509804, 0, 1, 1,
0.6483366, -0.1225944, 3.058373, 0.4588235, 0, 1, 1,
0.6491658, 0.03355562, 1.569281, 0.4627451, 0, 1, 1,
0.6505803, 1.347624, -0.6564296, 0.4705882, 0, 1, 1,
0.6510116, -0.1462021, 0.06014979, 0.4745098, 0, 1, 1,
0.6549414, 0.9915516, 1.015615, 0.4823529, 0, 1, 1,
0.6644027, 1.882831, -1.660432, 0.4862745, 0, 1, 1,
0.6678285, 1.873248, 1.663936, 0.4941176, 0, 1, 1,
0.6739064, -0.4096682, 1.713559, 0.5019608, 0, 1, 1,
0.6821027, 1.196661, 1.866309, 0.5058824, 0, 1, 1,
0.6854423, 0.02605328, 0.8071187, 0.5137255, 0, 1, 1,
0.6885176, 2.039091, 1.179893, 0.5176471, 0, 1, 1,
0.6929474, 0.08321507, 1.710169, 0.5254902, 0, 1, 1,
0.7003372, -1.534382, 3.0214, 0.5294118, 0, 1, 1,
0.7013679, 0.6577774, -0.1529887, 0.5372549, 0, 1, 1,
0.7037167, -2.340049, 2.4191, 0.5411765, 0, 1, 1,
0.7066476, 0.1036554, 2.1516, 0.5490196, 0, 1, 1,
0.7071888, 0.5961835, 0.5592834, 0.5529412, 0, 1, 1,
0.7106363, 0.5263203, 0.413126, 0.5607843, 0, 1, 1,
0.7149768, 0.1061905, 0.05159928, 0.5647059, 0, 1, 1,
0.727731, -0.4187982, 1.568283, 0.572549, 0, 1, 1,
0.7284105, 1.216942, -0.3327955, 0.5764706, 0, 1, 1,
0.7295116, 0.8083974, 1.699141, 0.5843138, 0, 1, 1,
0.729923, 1.418935, -0.6235889, 0.5882353, 0, 1, 1,
0.7362208, -1.257549, 2.909481, 0.5960785, 0, 1, 1,
0.7408036, 1.398996, 2.838723, 0.6039216, 0, 1, 1,
0.7421329, 0.2921485, 0.3625183, 0.6078432, 0, 1, 1,
0.7440241, 1.33067, 1.212254, 0.6156863, 0, 1, 1,
0.7455018, -0.7313046, 1.859283, 0.6196079, 0, 1, 1,
0.7474942, 0.4230731, 1.077145, 0.627451, 0, 1, 1,
0.7530113, -0.2232453, 1.19351, 0.6313726, 0, 1, 1,
0.7545171, -1.010463, 1.020702, 0.6392157, 0, 1, 1,
0.7611719, 0.6428708, 1.087352, 0.6431373, 0, 1, 1,
0.7637454, 1.235488, 1.469178, 0.6509804, 0, 1, 1,
0.7639667, 0.8524929, -0.753115, 0.654902, 0, 1, 1,
0.7693641, 0.2389427, 3.201561, 0.6627451, 0, 1, 1,
0.7708395, -0.8850612, 1.610488, 0.6666667, 0, 1, 1,
0.7710194, -0.4305925, 1.100397, 0.6745098, 0, 1, 1,
0.7736579, -1.757113, 2.668947, 0.6784314, 0, 1, 1,
0.7822959, 0.3599725, 1.761574, 0.6862745, 0, 1, 1,
0.7873502, -0.3697386, 1.697211, 0.6901961, 0, 1, 1,
0.7883871, -0.6017184, 1.233834, 0.6980392, 0, 1, 1,
0.789839, -2.562171, 1.552015, 0.7058824, 0, 1, 1,
0.7933076, 1.17401, 0.0922416, 0.7098039, 0, 1, 1,
0.8002936, -0.2038937, 3.202987, 0.7176471, 0, 1, 1,
0.8045186, -0.1628484, 0.831122, 0.7215686, 0, 1, 1,
0.8075554, 0.4519251, 0.853659, 0.7294118, 0, 1, 1,
0.8076528, -1.861848, 3.328224, 0.7333333, 0, 1, 1,
0.8122896, 0.5817366, 2.148353, 0.7411765, 0, 1, 1,
0.8133101, 0.733452, 1.474062, 0.7450981, 0, 1, 1,
0.814784, -0.7687657, 1.767126, 0.7529412, 0, 1, 1,
0.8179823, 0.001488061, 1.338043, 0.7568628, 0, 1, 1,
0.8183579, -0.1796328, 4.055707, 0.7647059, 0, 1, 1,
0.8315948, -0.5946174, 2.959533, 0.7686275, 0, 1, 1,
0.8424215, 0.8755192, 0.09002059, 0.7764706, 0, 1, 1,
0.8455121, -0.06115809, 3.151539, 0.7803922, 0, 1, 1,
0.8478588, 0.7612777, 0.4065413, 0.7882353, 0, 1, 1,
0.847999, -0.2628165, 1.355432, 0.7921569, 0, 1, 1,
0.8661246, 0.7865605, 1.737547, 0.8, 0, 1, 1,
0.8661955, -2.59255, 2.072798, 0.8078431, 0, 1, 1,
0.869674, -0.9175413, 2.125149, 0.8117647, 0, 1, 1,
0.882028, -0.780379, 3.033886, 0.8196079, 0, 1, 1,
0.883773, 0.7159936, 0.1905049, 0.8235294, 0, 1, 1,
0.8838661, -1.637084, 3.357625, 0.8313726, 0, 1, 1,
0.8907746, 0.7077396, 0.3387378, 0.8352941, 0, 1, 1,
0.8914481, 0.6789123, 2.448509, 0.8431373, 0, 1, 1,
0.8991352, 0.1740332, 1.724912, 0.8470588, 0, 1, 1,
0.9043342, 1.122373, 1.656854, 0.854902, 0, 1, 1,
0.9052125, -0.6442696, 1.287794, 0.8588235, 0, 1, 1,
0.9088193, -0.5644852, 4.015406, 0.8666667, 0, 1, 1,
0.9096771, 0.04715624, 1.708985, 0.8705882, 0, 1, 1,
0.9120282, 0.1736313, -0.01692258, 0.8784314, 0, 1, 1,
0.9139853, -0.4700887, 0.4351737, 0.8823529, 0, 1, 1,
0.9161775, -0.6253818, 2.919668, 0.8901961, 0, 1, 1,
0.9210664, -0.0765765, 2.057464, 0.8941177, 0, 1, 1,
0.9262813, -1.292562, 2.884665, 0.9019608, 0, 1, 1,
0.9281353, 1.056148, -1.273713, 0.9098039, 0, 1, 1,
0.9307767, -0.7314367, 3.641536, 0.9137255, 0, 1, 1,
0.934847, 0.9015731, 1.991821, 0.9215686, 0, 1, 1,
0.9436615, 0.3242783, 0.7203488, 0.9254902, 0, 1, 1,
0.9443164, 0.3157965, 1.829431, 0.9333333, 0, 1, 1,
0.946314, -0.4613906, 2.517274, 0.9372549, 0, 1, 1,
0.9650373, 1.402818, -0.2579164, 0.945098, 0, 1, 1,
0.9655629, -1.86356, 2.387215, 0.9490196, 0, 1, 1,
0.9668221, 1.47013, 0.4250929, 0.9568627, 0, 1, 1,
0.9697162, 0.1657302, 1.385142, 0.9607843, 0, 1, 1,
0.9720032, -0.4860143, 3.157606, 0.9686275, 0, 1, 1,
0.9723346, -1.517373, 1.734001, 0.972549, 0, 1, 1,
0.9724175, -0.3427699, 1.461469, 0.9803922, 0, 1, 1,
0.9757289, -0.8057491, 1.154638, 0.9843137, 0, 1, 1,
0.9771304, 1.261663, -0.7730979, 0.9921569, 0, 1, 1,
0.9804994, -0.9695151, 1.011635, 0.9960784, 0, 1, 1,
0.9816388, -1.395806, 2.35089, 1, 0, 0.9960784, 1,
0.9871188, -1.99542, 4.557969, 1, 0, 0.9882353, 1,
0.988609, -0.2957924, 2.22249, 1, 0, 0.9843137, 1,
0.9891647, 0.8440676, 0.7734228, 1, 0, 0.9764706, 1,
0.9987698, 1.342046, -1.205016, 1, 0, 0.972549, 1,
1.008083, -1.817713, 1.980619, 1, 0, 0.9647059, 1,
1.013102, -1.11947, 2.030554, 1, 0, 0.9607843, 1,
1.019122, 0.6613454, 2.00308, 1, 0, 0.9529412, 1,
1.023365, 0.9317381, -0.87923, 1, 0, 0.9490196, 1,
1.026658, -0.8483474, 0.4750127, 1, 0, 0.9411765, 1,
1.02713, 0.163558, 0.1948702, 1, 0, 0.9372549, 1,
1.032199, 1.117358, -0.9576539, 1, 0, 0.9294118, 1,
1.036208, -0.9289904, 4.803574, 1, 0, 0.9254902, 1,
1.039665, -0.3250239, 1.535587, 1, 0, 0.9176471, 1,
1.047417, 0.7407243, -0.8955958, 1, 0, 0.9137255, 1,
1.051845, 1.547388, 1.194361, 1, 0, 0.9058824, 1,
1.054304, -0.6832911, 0.1119468, 1, 0, 0.9019608, 1,
1.058731, -0.6248338, 1.047176, 1, 0, 0.8941177, 1,
1.059812, -0.1780036, -0.2977701, 1, 0, 0.8862745, 1,
1.065128, 1.57539, 1.961592, 1, 0, 0.8823529, 1,
1.070914, -1.142594, 3.257618, 1, 0, 0.8745098, 1,
1.076625, -0.2353845, 2.715113, 1, 0, 0.8705882, 1,
1.082015, -0.1426196, -0.6005922, 1, 0, 0.8627451, 1,
1.083819, -0.3641877, 0.5651855, 1, 0, 0.8588235, 1,
1.085659, -0.5774044, 0.7897852, 1, 0, 0.8509804, 1,
1.089719, 0.587077, -0.3572207, 1, 0, 0.8470588, 1,
1.095607, -0.09492812, 1.596936, 1, 0, 0.8392157, 1,
1.10021, 0.04343614, 3.419054, 1, 0, 0.8352941, 1,
1.106361, 1.619323, 0.8719864, 1, 0, 0.827451, 1,
1.10927, 0.02608442, 1.890564, 1, 0, 0.8235294, 1,
1.11054, -0.03072429, 0.5996254, 1, 0, 0.8156863, 1,
1.111608, -1.170656, 1.496148, 1, 0, 0.8117647, 1,
1.135848, 0.03138129, 1.191747, 1, 0, 0.8039216, 1,
1.139421, -0.2941198, 2.765258, 1, 0, 0.7960784, 1,
1.143178, 0.02804212, 2.162809, 1, 0, 0.7921569, 1,
1.144143, -0.1162565, 0.8376158, 1, 0, 0.7843137, 1,
1.14459, 1.464073, -0.03649232, 1, 0, 0.7803922, 1,
1.150887, 0.8010042, 2.784818, 1, 0, 0.772549, 1,
1.158717, 0.9752276, 1.506356, 1, 0, 0.7686275, 1,
1.181487, -0.2191063, 3.096006, 1, 0, 0.7607843, 1,
1.186824, 0.6329391, 1.618552, 1, 0, 0.7568628, 1,
1.191241, -0.03858174, 1.782891, 1, 0, 0.7490196, 1,
1.195211, 0.4366114, 1.887563, 1, 0, 0.7450981, 1,
1.198626, -0.1869837, 1.815186, 1, 0, 0.7372549, 1,
1.20251, 0.6085894, 2.209605, 1, 0, 0.7333333, 1,
1.20676, -0.03490752, 1.156825, 1, 0, 0.7254902, 1,
1.217187, 1.558438, -0.1489643, 1, 0, 0.7215686, 1,
1.218451, -1.655127, 1.596856, 1, 0, 0.7137255, 1,
1.232906, 0.0355922, 1.740568, 1, 0, 0.7098039, 1,
1.237357, -1.454005, 2.235299, 1, 0, 0.7019608, 1,
1.240797, -0.6431534, 2.181348, 1, 0, 0.6941177, 1,
1.242489, -1.545411, 3.766752, 1, 0, 0.6901961, 1,
1.244614, -1.353377, 3.735098, 1, 0, 0.682353, 1,
1.247061, -0.5327297, 1.87362, 1, 0, 0.6784314, 1,
1.25244, 0.6521304, -0.8628825, 1, 0, 0.6705883, 1,
1.254832, -1.103633, 3.930616, 1, 0, 0.6666667, 1,
1.254835, -0.5875832, 2.073647, 1, 0, 0.6588235, 1,
1.268501, -1.032609, 1.799341, 1, 0, 0.654902, 1,
1.268858, -0.9204307, 0.8799114, 1, 0, 0.6470588, 1,
1.292969, -0.4567967, 0.4177586, 1, 0, 0.6431373, 1,
1.302309, 0.7388777, 1.200449, 1, 0, 0.6352941, 1,
1.305347, 0.1290325, 0.3286647, 1, 0, 0.6313726, 1,
1.318254, 0.5199688, 1.71271, 1, 0, 0.6235294, 1,
1.32186, 0.3702906, 1.654137, 1, 0, 0.6196079, 1,
1.327619, -1.716779, 1.631806, 1, 0, 0.6117647, 1,
1.33267, -0.07502017, 2.781924, 1, 0, 0.6078432, 1,
1.339113, 0.03791389, 1.684997, 1, 0, 0.6, 1,
1.343714, 0.3843136, 2.619754, 1, 0, 0.5921569, 1,
1.347122, 0.3657969, 1.678981, 1, 0, 0.5882353, 1,
1.35549, -0.4619804, 2.630418, 1, 0, 0.5803922, 1,
1.357708, 1.274866, -0.3019164, 1, 0, 0.5764706, 1,
1.361148, -0.4031945, 1.704401, 1, 0, 0.5686275, 1,
1.373343, 0.06112422, 2.959704, 1, 0, 0.5647059, 1,
1.380237, -1.260076, 1.50317, 1, 0, 0.5568628, 1,
1.381346, -1.072182, 2.743518, 1, 0, 0.5529412, 1,
1.406747, 0.3092355, 0.8673841, 1, 0, 0.5450981, 1,
1.418496, -0.3745324, 3.322331, 1, 0, 0.5411765, 1,
1.418708, -0.324751, 1.465419, 1, 0, 0.5333334, 1,
1.421462, -2.923337, 1.470992, 1, 0, 0.5294118, 1,
1.424425, 0.8246201, 0.335756, 1, 0, 0.5215687, 1,
1.43259, 0.9826412, 0.8799924, 1, 0, 0.5176471, 1,
1.4338, 0.4636076, 0.005272261, 1, 0, 0.509804, 1,
1.434609, -0.03550973, 2.295863, 1, 0, 0.5058824, 1,
1.44051, 0.8131965, 0.06647872, 1, 0, 0.4980392, 1,
1.454664, 0.3421915, 1.2712, 1, 0, 0.4901961, 1,
1.456904, -0.4095517, 1.928486, 1, 0, 0.4862745, 1,
1.465352, -0.4537334, 1.755187, 1, 0, 0.4784314, 1,
1.482296, 1.720994, -1.385753, 1, 0, 0.4745098, 1,
1.490535, 0.2778912, 3.057662, 1, 0, 0.4666667, 1,
1.502215, 1.797227, 0.2896042, 1, 0, 0.4627451, 1,
1.506222, -0.6525453, 1.116758, 1, 0, 0.454902, 1,
1.516708, 0.1814239, 1.527067, 1, 0, 0.4509804, 1,
1.521698, 2.687338, 1.246963, 1, 0, 0.4431373, 1,
1.531894, 1.181817, 1.67642, 1, 0, 0.4392157, 1,
1.550072, 0.03755358, 1.854535, 1, 0, 0.4313726, 1,
1.557803, -0.353144, 2.886185, 1, 0, 0.427451, 1,
1.573984, -0.4977887, 0.9176247, 1, 0, 0.4196078, 1,
1.577382, 1.361912, -1.144842, 1, 0, 0.4156863, 1,
1.583228, 1.128116, 2.627093, 1, 0, 0.4078431, 1,
1.588075, -0.9149052, 3.202106, 1, 0, 0.4039216, 1,
1.590104, 0.1810883, 1.420805, 1, 0, 0.3960784, 1,
1.597774, -1.558423, 2.848335, 1, 0, 0.3882353, 1,
1.601557, 0.8452247, -0.843266, 1, 0, 0.3843137, 1,
1.605038, 0.2909893, 1.667442, 1, 0, 0.3764706, 1,
1.61517, 0.7660279, 1.947352, 1, 0, 0.372549, 1,
1.624501, -0.07781691, 2.784501, 1, 0, 0.3647059, 1,
1.625822, -2.327105, 3.192092, 1, 0, 0.3607843, 1,
1.648345, -0.5367581, 3.353511, 1, 0, 0.3529412, 1,
1.651436, -1.126045, 0.9786407, 1, 0, 0.3490196, 1,
1.656609, 1.810455, 0.3421588, 1, 0, 0.3411765, 1,
1.663709, -1.343247, 2.9861, 1, 0, 0.3372549, 1,
1.669095, 0.6139222, 1.286867, 1, 0, 0.3294118, 1,
1.676999, -0.897527, 2.029468, 1, 0, 0.3254902, 1,
1.68274, 0.5304877, 1.641341, 1, 0, 0.3176471, 1,
1.685135, 1.499317, 1.126381, 1, 0, 0.3137255, 1,
1.691724, -0.3896951, 2.22243, 1, 0, 0.3058824, 1,
1.694105, 0.5257201, 1.543425, 1, 0, 0.2980392, 1,
1.716009, 0.05793648, 1.147736, 1, 0, 0.2941177, 1,
1.733919, -0.7271289, 1.927493, 1, 0, 0.2862745, 1,
1.756365, 0.09275924, 0.3021182, 1, 0, 0.282353, 1,
1.758068, 0.2110178, 2.558875, 1, 0, 0.2745098, 1,
1.769836, -0.006444949, 2.064712, 1, 0, 0.2705882, 1,
1.771814, -0.04937387, 1.818541, 1, 0, 0.2627451, 1,
1.774785, 0.08143507, 0.7025989, 1, 0, 0.2588235, 1,
1.776354, 0.6422304, 1.838659, 1, 0, 0.2509804, 1,
1.793581, -0.7067683, 2.457032, 1, 0, 0.2470588, 1,
1.804187, -0.7236736, 1.909047, 1, 0, 0.2392157, 1,
1.804828, -1.544184, 2.856313, 1, 0, 0.2352941, 1,
1.806115, -0.4119295, 1.729698, 1, 0, 0.227451, 1,
1.807387, -0.3551525, 0.1907498, 1, 0, 0.2235294, 1,
1.82587, -0.04540877, 1.221979, 1, 0, 0.2156863, 1,
1.828518, 0.8764653, 0.6658064, 1, 0, 0.2117647, 1,
1.838721, -0.2299577, 0.9380105, 1, 0, 0.2039216, 1,
1.844265, 0.2319394, 0.03144746, 1, 0, 0.1960784, 1,
1.858549, 2.106905, -0.04606234, 1, 0, 0.1921569, 1,
1.859622, 0.9859994, 2.035957, 1, 0, 0.1843137, 1,
1.874179, 1.629496, 2.911784, 1, 0, 0.1803922, 1,
1.899627, 2.442298, 0.3568713, 1, 0, 0.172549, 1,
1.906199, 0.2639664, -1.222857, 1, 0, 0.1686275, 1,
1.949689, -2.050385, 4.425503, 1, 0, 0.1607843, 1,
1.950784, 0.4410005, 2.938614, 1, 0, 0.1568628, 1,
1.975485, -0.06448991, 1.252455, 1, 0, 0.1490196, 1,
2.003514, 0.5903651, 0.3322673, 1, 0, 0.145098, 1,
2.01193, 0.9008916, 0.5977605, 1, 0, 0.1372549, 1,
2.026404, -0.9442772, 1.185892, 1, 0, 0.1333333, 1,
2.058707, 0.8440211, 0.6991602, 1, 0, 0.1254902, 1,
2.077009, 0.1452515, 1.155087, 1, 0, 0.1215686, 1,
2.09907, -1.767843, 2.371057, 1, 0, 0.1137255, 1,
2.103009, 0.3684112, 1.320175, 1, 0, 0.1098039, 1,
2.129843, -2.076955, 3.089223, 1, 0, 0.1019608, 1,
2.179413, -0.06191876, 2.354291, 1, 0, 0.09411765, 1,
2.189177, -0.9029788, 1.226268, 1, 0, 0.09019608, 1,
2.207834, 1.033766, 0.5071294, 1, 0, 0.08235294, 1,
2.221566, -0.3093637, 1.467005, 1, 0, 0.07843138, 1,
2.26077, -0.9679274, 2.874135, 1, 0, 0.07058824, 1,
2.298894, -0.2379204, 2.153994, 1, 0, 0.06666667, 1,
2.361441, 0.4724122, 1.823913, 1, 0, 0.05882353, 1,
2.387283, 0.6679689, 2.104686, 1, 0, 0.05490196, 1,
2.444475, -2.322682, 3.561453, 1, 0, 0.04705882, 1,
2.447734, 0.4811897, 0.8935769, 1, 0, 0.04313726, 1,
2.481475, 0.4348833, 1.07733, 1, 0, 0.03529412, 1,
2.706527, -0.007470295, 2.78587, 1, 0, 0.03137255, 1,
2.769509, 0.7778617, 1.490722, 1, 0, 0.02352941, 1,
3.014613, 0.7360932, 3.473169, 1, 0, 0.01960784, 1,
3.411013, 0.2548227, 1.949863, 1, 0, 0.01176471, 1,
3.652959, -0.4709508, 3.618013, 1, 0, 0.007843138, 1
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
-0.1380918, -3.891418, -7.604253, 0, -0.5, 0.5, 0.5,
-0.1380918, -3.891418, -7.604253, 1, -0.5, 0.5, 0.5,
-0.1380918, -3.891418, -7.604253, 1, 1.5, 0.5, 0.5,
-0.1380918, -3.891418, -7.604253, 0, 1.5, 0.5, 0.5
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
-5.214309, -0.067644, -7.604253, 0, -0.5, 0.5, 0.5,
-5.214309, -0.067644, -7.604253, 1, -0.5, 0.5, 0.5,
-5.214309, -0.067644, -7.604253, 1, 1.5, 0.5, 0.5,
-5.214309, -0.067644, -7.604253, 0, 1.5, 0.5, 0.5
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
-5.214309, -3.891418, -0.06387591, 0, -0.5, 0.5, 0.5,
-5.214309, -3.891418, -0.06387591, 1, -0.5, 0.5, 0.5,
-5.214309, -3.891418, -0.06387591, 1, 1.5, 0.5, 0.5,
-5.214309, -3.891418, -0.06387591, 0, 1.5, 0.5, 0.5
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
-2, -3.009008, -5.864166,
2, -3.009008, -5.864166,
-2, -3.009008, -5.864166,
-2, -3.156076, -6.154181,
0, -3.009008, -5.864166,
0, -3.156076, -6.154181,
2, -3.009008, -5.864166,
2, -3.156076, -6.154181
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
-2, -3.450213, -6.73421, 0, -0.5, 0.5, 0.5,
-2, -3.450213, -6.73421, 1, -0.5, 0.5, 0.5,
-2, -3.450213, -6.73421, 1, 1.5, 0.5, 0.5,
-2, -3.450213, -6.73421, 0, 1.5, 0.5, 0.5,
0, -3.450213, -6.73421, 0, -0.5, 0.5, 0.5,
0, -3.450213, -6.73421, 1, -0.5, 0.5, 0.5,
0, -3.450213, -6.73421, 1, 1.5, 0.5, 0.5,
0, -3.450213, -6.73421, 0, 1.5, 0.5, 0.5,
2, -3.450213, -6.73421, 0, -0.5, 0.5, 0.5,
2, -3.450213, -6.73421, 1, -0.5, 0.5, 0.5,
2, -3.450213, -6.73421, 1, 1.5, 0.5, 0.5,
2, -3.450213, -6.73421, 0, 1.5, 0.5, 0.5
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
-4.042874, -2, -5.864166,
-4.042874, 2, -5.864166,
-4.042874, -2, -5.864166,
-4.238113, -2, -6.154181,
-4.042874, -1, -5.864166,
-4.238113, -1, -6.154181,
-4.042874, 0, -5.864166,
-4.238113, 0, -6.154181,
-4.042874, 1, -5.864166,
-4.238113, 1, -6.154181,
-4.042874, 2, -5.864166,
-4.238113, 2, -6.154181
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
-4.628592, -2, -6.73421, 0, -0.5, 0.5, 0.5,
-4.628592, -2, -6.73421, 1, -0.5, 0.5, 0.5,
-4.628592, -2, -6.73421, 1, 1.5, 0.5, 0.5,
-4.628592, -2, -6.73421, 0, 1.5, 0.5, 0.5,
-4.628592, -1, -6.73421, 0, -0.5, 0.5, 0.5,
-4.628592, -1, -6.73421, 1, -0.5, 0.5, 0.5,
-4.628592, -1, -6.73421, 1, 1.5, 0.5, 0.5,
-4.628592, -1, -6.73421, 0, 1.5, 0.5, 0.5,
-4.628592, 0, -6.73421, 0, -0.5, 0.5, 0.5,
-4.628592, 0, -6.73421, 1, -0.5, 0.5, 0.5,
-4.628592, 0, -6.73421, 1, 1.5, 0.5, 0.5,
-4.628592, 0, -6.73421, 0, 1.5, 0.5, 0.5,
-4.628592, 1, -6.73421, 0, -0.5, 0.5, 0.5,
-4.628592, 1, -6.73421, 1, -0.5, 0.5, 0.5,
-4.628592, 1, -6.73421, 1, 1.5, 0.5, 0.5,
-4.628592, 1, -6.73421, 0, 1.5, 0.5, 0.5,
-4.628592, 2, -6.73421, 0, -0.5, 0.5, 0.5,
-4.628592, 2, -6.73421, 1, -0.5, 0.5, 0.5,
-4.628592, 2, -6.73421, 1, 1.5, 0.5, 0.5,
-4.628592, 2, -6.73421, 0, 1.5, 0.5, 0.5
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
-4.042874, -3.009008, -4,
-4.042874, -3.009008, 4,
-4.042874, -3.009008, -4,
-4.238113, -3.156076, -4,
-4.042874, -3.009008, -2,
-4.238113, -3.156076, -2,
-4.042874, -3.009008, 0,
-4.238113, -3.156076, 0,
-4.042874, -3.009008, 2,
-4.238113, -3.156076, 2,
-4.042874, -3.009008, 4,
-4.238113, -3.156076, 4
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
-4.628592, -3.450213, -4, 0, -0.5, 0.5, 0.5,
-4.628592, -3.450213, -4, 1, -0.5, 0.5, 0.5,
-4.628592, -3.450213, -4, 1, 1.5, 0.5, 0.5,
-4.628592, -3.450213, -4, 0, 1.5, 0.5, 0.5,
-4.628592, -3.450213, -2, 0, -0.5, 0.5, 0.5,
-4.628592, -3.450213, -2, 1, -0.5, 0.5, 0.5,
-4.628592, -3.450213, -2, 1, 1.5, 0.5, 0.5,
-4.628592, -3.450213, -2, 0, 1.5, 0.5, 0.5,
-4.628592, -3.450213, 0, 0, -0.5, 0.5, 0.5,
-4.628592, -3.450213, 0, 1, -0.5, 0.5, 0.5,
-4.628592, -3.450213, 0, 1, 1.5, 0.5, 0.5,
-4.628592, -3.450213, 0, 0, 1.5, 0.5, 0.5,
-4.628592, -3.450213, 2, 0, -0.5, 0.5, 0.5,
-4.628592, -3.450213, 2, 1, -0.5, 0.5, 0.5,
-4.628592, -3.450213, 2, 1, 1.5, 0.5, 0.5,
-4.628592, -3.450213, 2, 0, 1.5, 0.5, 0.5,
-4.628592, -3.450213, 4, 0, -0.5, 0.5, 0.5,
-4.628592, -3.450213, 4, 1, -0.5, 0.5, 0.5,
-4.628592, -3.450213, 4, 1, 1.5, 0.5, 0.5,
-4.628592, -3.450213, 4, 0, 1.5, 0.5, 0.5
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
-4.042874, -3.009008, -5.864166,
-4.042874, 2.87372, -5.864166,
-4.042874, -3.009008, 5.736414,
-4.042874, 2.87372, 5.736414,
-4.042874, -3.009008, -5.864166,
-4.042874, -3.009008, 5.736414,
-4.042874, 2.87372, -5.864166,
-4.042874, 2.87372, 5.736414,
-4.042874, -3.009008, -5.864166,
3.766691, -3.009008, -5.864166,
-4.042874, -3.009008, 5.736414,
3.766691, -3.009008, 5.736414,
-4.042874, 2.87372, -5.864166,
3.766691, 2.87372, -5.864166,
-4.042874, 2.87372, 5.736414,
3.766691, 2.87372, 5.736414,
3.766691, -3.009008, -5.864166,
3.766691, 2.87372, -5.864166,
3.766691, -3.009008, 5.736414,
3.766691, 2.87372, 5.736414,
3.766691, -3.009008, -5.864166,
3.766691, -3.009008, 5.736414,
3.766691, 2.87372, -5.864166,
3.766691, 2.87372, 5.736414
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
var radius = 8.101196;
var distance = 36.04314;
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
mvMatrix.translate( 0.1380918, 0.067644, 0.06387591 );
mvMatrix.scale( 1.121595, 1.488964, 0.7550632 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.04314);
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
Polypropylene_glycol<-read.table("Polypropylene_glycol.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Polypropylene_glycol$V2
```

```
## Error in eval(expr, envir, enclos): object 'Polypropylene_glycol' not found
```

```r
y<-Polypropylene_glycol$V3
```

```
## Error in eval(expr, envir, enclos): object 'Polypropylene_glycol' not found
```

```r
z<-Polypropylene_glycol$V4
```

```
## Error in eval(expr, envir, enclos): object 'Polypropylene_glycol' not found
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
-3.929143, -0.8939741, -3.197078, 0, 0, 1, 1, 1,
-2.91531, 0.1548105, -2.585826, 1, 0, 0, 1, 1,
-2.852946, 0.6801573, 0.06210071, 1, 0, 0, 1, 1,
-2.752671, 1.660473, -2.745281, 1, 0, 0, 1, 1,
-2.723609, 0.02725798, -0.3338698, 1, 0, 0, 1, 1,
-2.707026, 0.07453671, -2.834099, 1, 0, 0, 1, 1,
-2.528284, 1.213743, -0.6378006, 0, 0, 0, 1, 1,
-2.502891, -0.1372757, -1.748615, 0, 0, 0, 1, 1,
-2.483549, 0.6104736, -1.233993, 0, 0, 0, 1, 1,
-2.427188, -0.2081407, -1.722812, 0, 0, 0, 1, 1,
-2.407306, 1.09335, -2.042723, 0, 0, 0, 1, 1,
-2.386153, 1.51861, 0.2259898, 0, 0, 0, 1, 1,
-2.348504, -0.7358949, -1.551978, 0, 0, 0, 1, 1,
-2.345296, 0.07804697, -3.344297, 1, 1, 1, 1, 1,
-2.343392, -1.419965, -1.397713, 1, 1, 1, 1, 1,
-2.265325, 2.556127, -0.6692752, 1, 1, 1, 1, 1,
-2.247549, -1.485769, -2.303689, 1, 1, 1, 1, 1,
-2.242445, -1.767592, -2.784505, 1, 1, 1, 1, 1,
-2.207674, 1.658886, 0.1209092, 1, 1, 1, 1, 1,
-2.192079, 1.693137, -1.126876, 1, 1, 1, 1, 1,
-2.188509, -0.2584982, -0.2033788, 1, 1, 1, 1, 1,
-2.173088, -1.205609, -1.808392, 1, 1, 1, 1, 1,
-2.13283, -0.9577643, -1.733302, 1, 1, 1, 1, 1,
-2.071, -0.6083534, -2.123042, 1, 1, 1, 1, 1,
-2.068887, 2.510428, -0.09183551, 1, 1, 1, 1, 1,
-2.059837, 0.1973372, -2.110747, 1, 1, 1, 1, 1,
-2.039819, -1.617964, -2.298111, 1, 1, 1, 1, 1,
-2.039077, 0.03341394, -1.344333, 1, 1, 1, 1, 1,
-2.027345, 0.436044, 1.044072, 0, 0, 1, 1, 1,
-2.023114, -0.7116955, -2.578391, 1, 0, 0, 1, 1,
-2.012701, -0.2994772, -3.141073, 1, 0, 0, 1, 1,
-1.983339, -0.1686824, -1.287287, 1, 0, 0, 1, 1,
-1.972976, -2.048094, -3.008582, 1, 0, 0, 1, 1,
-1.936764, 1.500146, -1.515672, 1, 0, 0, 1, 1,
-1.914912, 0.9267659, -1.119159, 0, 0, 0, 1, 1,
-1.907558, -0.1064618, -2.400561, 0, 0, 0, 1, 1,
-1.902301, 1.072386, -1.878962, 0, 0, 0, 1, 1,
-1.89941, 0.007632302, -0.04271387, 0, 0, 0, 1, 1,
-1.874999, -1.127918, -0.6227376, 0, 0, 0, 1, 1,
-1.848302, -1.286778, -0.1229579, 0, 0, 0, 1, 1,
-1.824778, 1.479124, -3.445156, 0, 0, 0, 1, 1,
-1.807075, 1.287122, 0.9841111, 1, 1, 1, 1, 1,
-1.7884, -0.6928656, -0.4836439, 1, 1, 1, 1, 1,
-1.765713, 0.7221637, -2.952909, 1, 1, 1, 1, 1,
-1.762005, -2.441107, -3.764637, 1, 1, 1, 1, 1,
-1.74608, 0.8336661, -2.444964, 1, 1, 1, 1, 1,
-1.738129, 0.4606693, -0.6525274, 1, 1, 1, 1, 1,
-1.735846, 1.203251, -0.4251447, 1, 1, 1, 1, 1,
-1.73365, 0.4931446, -0.2073494, 1, 1, 1, 1, 1,
-1.720197, 2.152554, -0.4757962, 1, 1, 1, 1, 1,
-1.684236, 1.058971, -0.8661239, 1, 1, 1, 1, 1,
-1.684055, 0.4917067, -0.7372952, 1, 1, 1, 1, 1,
-1.664563, -2.426683, -3.125736, 1, 1, 1, 1, 1,
-1.664194, 0.1878644, -0.02180029, 1, 1, 1, 1, 1,
-1.663699, 0.6613858, -1.189914, 1, 1, 1, 1, 1,
-1.655185, -1.352876, -2.430379, 1, 1, 1, 1, 1,
-1.651423, 1.214578, -0.5531169, 0, 0, 1, 1, 1,
-1.639422, -0.7533194, -3.083361, 1, 0, 0, 1, 1,
-1.636317, 0.4434747, -0.6411949, 1, 0, 0, 1, 1,
-1.635719, 1.683304, -1.897176, 1, 0, 0, 1, 1,
-1.62943, -1.429238, -2.701385, 1, 0, 0, 1, 1,
-1.595724, 1.318987, -2.272165, 1, 0, 0, 1, 1,
-1.582263, 0.5113089, -0.7118734, 0, 0, 0, 1, 1,
-1.551799, -0.5269729, -2.305794, 0, 0, 0, 1, 1,
-1.536929, 1.299631, -0.3635497, 0, 0, 0, 1, 1,
-1.533067, 0.6624348, -2.801664, 0, 0, 0, 1, 1,
-1.505023, -0.06199082, -1.7133, 0, 0, 0, 1, 1,
-1.474151, -0.729852, -3.547982, 0, 0, 0, 1, 1,
-1.450284, 0.1893244, -1.100425, 0, 0, 0, 1, 1,
-1.440999, 0.1149485, 0.8191574, 1, 1, 1, 1, 1,
-1.439344, 1.066625, -1.41089, 1, 1, 1, 1, 1,
-1.436396, 2.382245, 0.7324749, 1, 1, 1, 1, 1,
-1.410408, -0.6109743, -0.7462006, 1, 1, 1, 1, 1,
-1.409884, 0.5534944, -1.311419, 1, 1, 1, 1, 1,
-1.400371, -1.008011, -2.350531, 1, 1, 1, 1, 1,
-1.40022, -0.109126, -2.127087, 1, 1, 1, 1, 1,
-1.393555, -0.2543545, -3.953731, 1, 1, 1, 1, 1,
-1.386302, -2.016233, -1.832281, 1, 1, 1, 1, 1,
-1.384995, -0.969994, -1.528934, 1, 1, 1, 1, 1,
-1.382285, 0.5293201, -1.556265, 1, 1, 1, 1, 1,
-1.373868, -1.603141, -3.955785, 1, 1, 1, 1, 1,
-1.372161, -0.039909, -0.2035888, 1, 1, 1, 1, 1,
-1.372009, -0.6069902, -1.199997, 1, 1, 1, 1, 1,
-1.368193, -1.747673, -2.851298, 1, 1, 1, 1, 1,
-1.3678, -0.7073243, -3.31297, 0, 0, 1, 1, 1,
-1.346203, -0.4343928, -3.149722, 1, 0, 0, 1, 1,
-1.340394, -0.22023, -1.573136, 1, 0, 0, 1, 1,
-1.338132, 0.24781, -2.532051, 1, 0, 0, 1, 1,
-1.331325, 0.374586, -1.85601, 1, 0, 0, 1, 1,
-1.321191, -1.635029, -1.565552, 1, 0, 0, 1, 1,
-1.320384, -0.7674062, -1.305849, 0, 0, 0, 1, 1,
-1.316042, 1.480185, 2.060251, 0, 0, 0, 1, 1,
-1.314577, -1.039581, -1.527106, 0, 0, 0, 1, 1,
-1.296588, -0.4771737, -1.048209, 0, 0, 0, 1, 1,
-1.292997, -0.6052186, -3.247216, 0, 0, 0, 1, 1,
-1.290883, 0.07620809, -2.652734, 0, 0, 0, 1, 1,
-1.290683, -0.3634849, -3.539061, 0, 0, 0, 1, 1,
-1.282301, -0.6877096, -2.055659, 1, 1, 1, 1, 1,
-1.27719, -0.7421845, -2.448647, 1, 1, 1, 1, 1,
-1.271661, 1.726382, -1.50511, 1, 1, 1, 1, 1,
-1.265945, 2.154251, -0.3385865, 1, 1, 1, 1, 1,
-1.261694, 0.8501521, -1.553275, 1, 1, 1, 1, 1,
-1.258509, -0.1567611, -1.115659, 1, 1, 1, 1, 1,
-1.250831, -0.2520585, -1.796473, 1, 1, 1, 1, 1,
-1.249471, -0.5778024, -1.279529, 1, 1, 1, 1, 1,
-1.249266, -1.570707, -2.23703, 1, 1, 1, 1, 1,
-1.246064, -1.19486, -2.291137, 1, 1, 1, 1, 1,
-1.241448, 0.9976624, -0.2078208, 1, 1, 1, 1, 1,
-1.230128, -0.7821926, -2.088408, 1, 1, 1, 1, 1,
-1.213667, -1.041019, -2.841798, 1, 1, 1, 1, 1,
-1.205584, 1.61858, -1.48543, 1, 1, 1, 1, 1,
-1.195868, -0.6634315, -1.140589, 1, 1, 1, 1, 1,
-1.195102, -1.578247, -0.3980849, 0, 0, 1, 1, 1,
-1.193864, -1.185647, -1.802281, 1, 0, 0, 1, 1,
-1.187972, 0.1386237, -0.8426846, 1, 0, 0, 1, 1,
-1.186442, -0.5460552, -1.62514, 1, 0, 0, 1, 1,
-1.185674, 0.7584633, -0.01984301, 1, 0, 0, 1, 1,
-1.163347, 0.3198159, -1.795929, 1, 0, 0, 1, 1,
-1.162855, -0.6998154, -2.801992, 0, 0, 0, 1, 1,
-1.153726, -2.216763, -2.897727, 0, 0, 0, 1, 1,
-1.147806, 1.826747, -2.108492, 0, 0, 0, 1, 1,
-1.14739, 0.2061357, -1.176997, 0, 0, 0, 1, 1,
-1.139397, -0.8142254, -3.252668, 0, 0, 0, 1, 1,
-1.137885, 0.7100307, -1.084612, 0, 0, 0, 1, 1,
-1.127995, 0.324686, -1.214152, 0, 0, 0, 1, 1,
-1.123968, -0.6973588, -3.681333, 1, 1, 1, 1, 1,
-1.119644, -0.2072281, -0.7851102, 1, 1, 1, 1, 1,
-1.109618, 0.6009313, 0.3023645, 1, 1, 1, 1, 1,
-1.102421, -0.4623685, -1.651635, 1, 1, 1, 1, 1,
-1.097281, 0.9200441, -0.5989546, 1, 1, 1, 1, 1,
-1.093448, 1.078457, -0.947592, 1, 1, 1, 1, 1,
-1.083899, -0.5518383, -2.708874, 1, 1, 1, 1, 1,
-1.083033, -0.3768895, -1.233303, 1, 1, 1, 1, 1,
-1.077099, 2.068547, 0.04413641, 1, 1, 1, 1, 1,
-1.070694, -0.3265662, -0.9752164, 1, 1, 1, 1, 1,
-1.064306, 1.149472, 1.602352, 1, 1, 1, 1, 1,
-1.060839, -1.555789, -1.168135, 1, 1, 1, 1, 1,
-1.060557, 0.7729759, -1.27989, 1, 1, 1, 1, 1,
-1.054356, 0.8840452, -2.077452, 1, 1, 1, 1, 1,
-1.053862, 0.6064068, -0.7185642, 1, 1, 1, 1, 1,
-1.051685, 0.01269128, -0.7310853, 0, 0, 1, 1, 1,
-1.042929, 0.4694838, -0.1213598, 1, 0, 0, 1, 1,
-1.04114, 0.5073075, -2.246552, 1, 0, 0, 1, 1,
-1.037166, 0.3680396, -1.23911, 1, 0, 0, 1, 1,
-1.036884, 1.204882, -1.104946, 1, 0, 0, 1, 1,
-1.031083, 0.4164436, -0.8076453, 1, 0, 0, 1, 1,
-1.022996, 0.4783075, -2.874375, 0, 0, 0, 1, 1,
-1.022887, -0.6227279, -2.996885, 0, 0, 0, 1, 1,
-1.01772, -1.52379, -1.457461, 0, 0, 0, 1, 1,
-1.016264, 0.1054063, -0.571671, 0, 0, 0, 1, 1,
-1.015474, -0.6427622, -1.54039, 0, 0, 0, 1, 1,
-1.010743, -1.460873, -2.941694, 0, 0, 0, 1, 1,
-1.005374, -0.2182786, -1.352316, 0, 0, 0, 1, 1,
-1.003021, 0.9202375, -0.008137999, 1, 1, 1, 1, 1,
-1.000947, 0.153832, -1.517358, 1, 1, 1, 1, 1,
-1.000713, -0.6825663, -3.085019, 1, 1, 1, 1, 1,
-0.9935552, -0.3959013, 0.5109582, 1, 1, 1, 1, 1,
-0.9921905, 1.313478, -1.526622, 1, 1, 1, 1, 1,
-0.9893542, 0.8422858, -2.229385, 1, 1, 1, 1, 1,
-0.9885251, -1.100695, -3.281469, 1, 1, 1, 1, 1,
-0.9831553, 1.255288, -1.236354, 1, 1, 1, 1, 1,
-0.9804212, -0.03468868, 1.206366, 1, 1, 1, 1, 1,
-0.9743223, 0.905931, -0.9772276, 1, 1, 1, 1, 1,
-0.9738721, -0.2479678, -3.984712, 1, 1, 1, 1, 1,
-0.9732309, -0.3869523, -0.5347719, 1, 1, 1, 1, 1,
-0.9702849, -1.522985, -1.763864, 1, 1, 1, 1, 1,
-0.9679751, 0.5292727, -1.057921, 1, 1, 1, 1, 1,
-0.9661826, -1.097369, -1.021143, 1, 1, 1, 1, 1,
-0.9625494, 0.06966156, -1.04895, 0, 0, 1, 1, 1,
-0.9613193, 0.667616, -0.4031673, 1, 0, 0, 1, 1,
-0.9560713, 0.2705248, -1.680868, 1, 0, 0, 1, 1,
-0.9511673, -0.7140994, -1.912092, 1, 0, 0, 1, 1,
-0.9485718, -0.04803084, -3.367975, 1, 0, 0, 1, 1,
-0.9390104, 1.034716, -0.7781579, 1, 0, 0, 1, 1,
-0.9282367, 0.800007, -0.9607944, 0, 0, 0, 1, 1,
-0.9271049, -1.028971, -2.259928, 0, 0, 0, 1, 1,
-0.9108966, 0.09416813, -1.65071, 0, 0, 0, 1, 1,
-0.9032531, -0.008292315, -2.044832, 0, 0, 0, 1, 1,
-0.9000333, -1.405571, -0.334587, 0, 0, 0, 1, 1,
-0.8993176, 1.617619, 0.1007587, 0, 0, 0, 1, 1,
-0.898976, 0.428075, -0.5828614, 0, 0, 0, 1, 1,
-0.8958509, 2.545963, -0.1931373, 1, 1, 1, 1, 1,
-0.8952586, -0.7871223, -2.131669, 1, 1, 1, 1, 1,
-0.8931192, -0.4227802, -1.452213, 1, 1, 1, 1, 1,
-0.8913245, -1.12125, -3.359637, 1, 1, 1, 1, 1,
-0.8885584, 0.2528987, -1.452037, 1, 1, 1, 1, 1,
-0.8867214, -1.236335, -3.660458, 1, 1, 1, 1, 1,
-0.8865005, -1.051895, -2.914185, 1, 1, 1, 1, 1,
-0.8856434, 2.082108, -0.3758659, 1, 1, 1, 1, 1,
-0.8824599, -0.09139103, -2.533137, 1, 1, 1, 1, 1,
-0.8800712, 1.209433, -0.1299438, 1, 1, 1, 1, 1,
-0.880063, 0.9098284, -1.606532, 1, 1, 1, 1, 1,
-0.8764752, 0.6948375, -3.033229, 1, 1, 1, 1, 1,
-0.8759608, -2.009834, -2.216052, 1, 1, 1, 1, 1,
-0.8740046, 0.09113628, -2.69314, 1, 1, 1, 1, 1,
-0.8684562, -0.3422787, -1.268047, 1, 1, 1, 1, 1,
-0.8601276, 0.7118362, -1.765664, 0, 0, 1, 1, 1,
-0.8498027, -0.6241481, -1.920438, 1, 0, 0, 1, 1,
-0.8464197, 1.236319, 0.1412911, 1, 0, 0, 1, 1,
-0.8458838, -2.078775, -3.103139, 1, 0, 0, 1, 1,
-0.8420105, 0.292935, -2.846688, 1, 0, 0, 1, 1,
-0.8416193, 0.8736616, -0.39113, 1, 0, 0, 1, 1,
-0.8413476, 0.2012301, -2.673589, 0, 0, 0, 1, 1,
-0.8408123, 0.06867824, -0.7182814, 0, 0, 0, 1, 1,
-0.837365, 0.4232286, -0.8595671, 0, 0, 0, 1, 1,
-0.8365601, -0.9798561, -3.268908, 0, 0, 0, 1, 1,
-0.8364083, 0.09656595, -0.5156445, 0, 0, 0, 1, 1,
-0.8361814, -0.4630977, -0.3754247, 0, 0, 0, 1, 1,
-0.8360204, 0.2590452, 1.215576, 0, 0, 0, 1, 1,
-0.8331871, -0.401233, -1.384058, 1, 1, 1, 1, 1,
-0.8328036, -0.3771282, -1.646541, 1, 1, 1, 1, 1,
-0.8266791, 0.3266769, -2.614921, 1, 1, 1, 1, 1,
-0.8261958, 0.785752, 1.255732, 1, 1, 1, 1, 1,
-0.8251297, 0.4009314, -1.686112, 1, 1, 1, 1, 1,
-0.824362, 0.8979421, 0.5536311, 1, 1, 1, 1, 1,
-0.8227936, 1.168913, 0.002876681, 1, 1, 1, 1, 1,
-0.8205107, 1.796628, -0.8310972, 1, 1, 1, 1, 1,
-0.8160939, 1.069047, -1.856331, 1, 1, 1, 1, 1,
-0.8137529, 0.1101833, -2.97663, 1, 1, 1, 1, 1,
-0.8118023, -0.2828074, -2.318828, 1, 1, 1, 1, 1,
-0.8102831, -0.4251914, -2.873372, 1, 1, 1, 1, 1,
-0.8048809, -0.6507688, -2.640238, 1, 1, 1, 1, 1,
-0.8023807, 0.9012302, -0.1611605, 1, 1, 1, 1, 1,
-0.7958, 0.4155567, -0.6207238, 1, 1, 1, 1, 1,
-0.7942368, -1.484614, -2.853337, 0, 0, 1, 1, 1,
-0.7925746, -0.6832886, -1.42849, 1, 0, 0, 1, 1,
-0.7895505, 2.147466, -0.9510784, 1, 0, 0, 1, 1,
-0.7880096, 1.07102, -1.228019, 1, 0, 0, 1, 1,
-0.7765848, -1.004701, -2.988966, 1, 0, 0, 1, 1,
-0.7765057, 1.161035, 0.857273, 1, 0, 0, 1, 1,
-0.7708745, 2.486185, 0.3173417, 0, 0, 0, 1, 1,
-0.7633726, 1.444119, 0.4971561, 0, 0, 0, 1, 1,
-0.758409, -0.6147022, -2.726713, 0, 0, 0, 1, 1,
-0.7554536, -0.09065873, -0.6159699, 0, 0, 0, 1, 1,
-0.7540199, -0.7726234, -3.365968, 0, 0, 0, 1, 1,
-0.7535901, 0.3874627, -0.804733, 0, 0, 0, 1, 1,
-0.7512847, -1.661367, -3.052056, 0, 0, 0, 1, 1,
-0.7501112, 1.667878, 0.2487271, 1, 1, 1, 1, 1,
-0.7443058, -1.111555, -3.345689, 1, 1, 1, 1, 1,
-0.7439074, 1.79588, -0.7897025, 1, 1, 1, 1, 1,
-0.7420027, -0.06484518, -1.091868, 1, 1, 1, 1, 1,
-0.7388999, 0.8298472, -0.2577112, 1, 1, 1, 1, 1,
-0.7339589, -0.519924, -2.682606, 1, 1, 1, 1, 1,
-0.7328734, -0.945478, -4.462101, 1, 1, 1, 1, 1,
-0.7327557, -0.9230026, -1.703021, 1, 1, 1, 1, 1,
-0.7294307, -2.225854, -3.726605, 1, 1, 1, 1, 1,
-0.717257, 0.8821558, -0.2098315, 1, 1, 1, 1, 1,
-0.7167529, -0.8890623, -1.37325, 1, 1, 1, 1, 1,
-0.7114226, -0.4033645, -1.858292, 1, 1, 1, 1, 1,
-0.710642, 1.591368, -0.3803214, 1, 1, 1, 1, 1,
-0.7041308, 0.8207552, 0.5461397, 1, 1, 1, 1, 1,
-0.7034357, 1.411146, -0.06702433, 1, 1, 1, 1, 1,
-0.6979681, -0.5382222, -0.4484057, 0, 0, 1, 1, 1,
-0.6956829, 0.6499706, -0.9165431, 1, 0, 0, 1, 1,
-0.6914684, 1.383191, -0.7934979, 1, 0, 0, 1, 1,
-0.6725613, 0.4135205, -1.686507, 1, 0, 0, 1, 1,
-0.6697408, 0.9445972, -0.8768022, 1, 0, 0, 1, 1,
-0.6683648, -0.4119969, -1.537658, 1, 0, 0, 1, 1,
-0.6680312, 0.370031, -2.637196, 0, 0, 0, 1, 1,
-0.6679628, 1.571328, -1.144112, 0, 0, 0, 1, 1,
-0.6679188, 0.6987849, -0.5094653, 0, 0, 0, 1, 1,
-0.6663045, 0.9498107, -0.2154678, 0, 0, 0, 1, 1,
-0.6655513, -0.3967048, -2.685568, 0, 0, 0, 1, 1,
-0.6655247, -1.524552, -3.632421, 0, 0, 0, 1, 1,
-0.6619356, -0.1310062, -2.741571, 0, 0, 0, 1, 1,
-0.6592348, 1.093259, -1.298533, 1, 1, 1, 1, 1,
-0.6577089, -0.3773716, -1.69964, 1, 1, 1, 1, 1,
-0.6569167, 0.6554105, 0.5327699, 1, 1, 1, 1, 1,
-0.6503862, -0.7654657, -2.672446, 1, 1, 1, 1, 1,
-0.6482513, 0.3197643, -1.629639, 1, 1, 1, 1, 1,
-0.6465324, 0.9572831, -1.396897, 1, 1, 1, 1, 1,
-0.6441236, -1.007573, -1.70682, 1, 1, 1, 1, 1,
-0.6396679, 0.5733972, -0.4959401, 1, 1, 1, 1, 1,
-0.6377558, 0.8121569, -1.912813, 1, 1, 1, 1, 1,
-0.6357853, 2.18821, 0.4591735, 1, 1, 1, 1, 1,
-0.6350814, -1.081747, -2.482152, 1, 1, 1, 1, 1,
-0.6349065, -2.255353, -1.850904, 1, 1, 1, 1, 1,
-0.6344323, -0.4720528, -2.294018, 1, 1, 1, 1, 1,
-0.6245179, 2.788049, 0.904226, 1, 1, 1, 1, 1,
-0.6244335, 0.5845885, -2.284975, 1, 1, 1, 1, 1,
-0.6200938, -1.546762, -1.958978, 0, 0, 1, 1, 1,
-0.6102915, 0.3583681, -2.613664, 1, 0, 0, 1, 1,
-0.6013878, 1.626546, -1.644282, 1, 0, 0, 1, 1,
-0.5954328, -1.101085, -4.162308, 1, 0, 0, 1, 1,
-0.5937968, -0.1094119, -3.156148, 1, 0, 0, 1, 1,
-0.5842929, -0.3776491, -2.352015, 1, 0, 0, 1, 1,
-0.5805615, 0.05308511, -1.80122, 0, 0, 0, 1, 1,
-0.5776469, 1.035182, 0.8491784, 0, 0, 0, 1, 1,
-0.5757638, 0.5653098, -2.066242, 0, 0, 0, 1, 1,
-0.5737919, 0.03578706, -3.281476, 0, 0, 0, 1, 1,
-0.5735119, 1.316757, 0.03633934, 0, 0, 0, 1, 1,
-0.5690317, 0.8422666, -1.216202, 0, 0, 0, 1, 1,
-0.5671856, 0.07506938, -2.395231, 0, 0, 0, 1, 1,
-0.5661339, -2.359732, -4.283658, 1, 1, 1, 1, 1,
-0.5647504, 0.1742342, -2.66695, 1, 1, 1, 1, 1,
-0.5646387, 0.1234124, -0.09564301, 1, 1, 1, 1, 1,
-0.5579994, 0.9725503, -2.186769, 1, 1, 1, 1, 1,
-0.5575162, 0.2706515, -1.50267, 1, 1, 1, 1, 1,
-0.5543286, -0.2612721, 0.001396778, 1, 1, 1, 1, 1,
-0.5503311, 0.0004342831, -2.220461, 1, 1, 1, 1, 1,
-0.5503114, -0.50504, -1.459195, 1, 1, 1, 1, 1,
-0.5485959, -0.6442612, -0.8701073, 1, 1, 1, 1, 1,
-0.548076, 0.02289106, -1.576428, 1, 1, 1, 1, 1,
-0.5462776, 0.5808097, -1.864077, 1, 1, 1, 1, 1,
-0.5423983, 0.1004605, -1.56405, 1, 1, 1, 1, 1,
-0.5403227, 1.154437, -1.220687, 1, 1, 1, 1, 1,
-0.5367403, 1.218236, -1.596086, 1, 1, 1, 1, 1,
-0.5347522, -0.1011959, -2.286084, 1, 1, 1, 1, 1,
-0.5317929, 0.3139374, -1.913095, 0, 0, 1, 1, 1,
-0.5271916, 0.8943452, 0.7158706, 1, 0, 0, 1, 1,
-0.5262381, -1.326886, -2.935341, 1, 0, 0, 1, 1,
-0.5262157, -0.4038471, -2.069319, 1, 0, 0, 1, 1,
-0.5251298, -2.006905, -2.542058, 1, 0, 0, 1, 1,
-0.5235309, -1.788615, -1.868945, 1, 0, 0, 1, 1,
-0.523173, -1.094611, 0.1578759, 0, 0, 0, 1, 1,
-0.522993, -0.4202375, -2.371293, 0, 0, 0, 1, 1,
-0.5201964, -0.8814012, -2.20811, 0, 0, 0, 1, 1,
-0.516784, -1.304256, -2.605074, 0, 0, 0, 1, 1,
-0.5148568, -0.7196419, -3.480046, 0, 0, 0, 1, 1,
-0.5138011, 0.602846, -0.9628646, 0, 0, 0, 1, 1,
-0.5134724, 1.225803, 1.336259, 0, 0, 0, 1, 1,
-0.5133885, 0.2617846, -1.1124, 1, 1, 1, 1, 1,
-0.511795, 1.776914, 0.08748585, 1, 1, 1, 1, 1,
-0.5115603, -1.177889, -2.340733, 1, 1, 1, 1, 1,
-0.5003453, 0.3229759, -1.777859, 1, 1, 1, 1, 1,
-0.4963822, -1.597537, -3.800931, 1, 1, 1, 1, 1,
-0.4951371, 0.1995518, -2.828802, 1, 1, 1, 1, 1,
-0.4938901, 1.118052, -1.357209, 1, 1, 1, 1, 1,
-0.4909893, -2.132359, -3.789796, 1, 1, 1, 1, 1,
-0.4889707, 0.2654222, -1.060817, 1, 1, 1, 1, 1,
-0.4889468, -0.7518235, -3.170489, 1, 1, 1, 1, 1,
-0.4872575, 1.905292, -0.886297, 1, 1, 1, 1, 1,
-0.485151, -1.480718, -2.023371, 1, 1, 1, 1, 1,
-0.4827718, 0.7114893, 1.365901, 1, 1, 1, 1, 1,
-0.4743896, 1.765337, 0.3297636, 1, 1, 1, 1, 1,
-0.4726649, 0.03451172, -0.7478391, 1, 1, 1, 1, 1,
-0.4724694, 1.582035, -1.016992, 0, 0, 1, 1, 1,
-0.4618976, 0.7800979, -0.381255, 1, 0, 0, 1, 1,
-0.4525628, -0.01534884, -0.9165342, 1, 0, 0, 1, 1,
-0.4518865, 1.676414, 0.6749489, 1, 0, 0, 1, 1,
-0.4510235, 0.1842649, -1.151539, 1, 0, 0, 1, 1,
-0.4497946, 0.6806051, -1.796748, 1, 0, 0, 1, 1,
-0.4438268, -0.2254268, -1.171632, 0, 0, 0, 1, 1,
-0.4342594, -0.6784467, -1.160176, 0, 0, 0, 1, 1,
-0.4342219, -0.9288831, -4.290535, 0, 0, 0, 1, 1,
-0.4312512, 0.3031491, -0.3175673, 0, 0, 0, 1, 1,
-0.4310254, 2.050155, 0.2274827, 0, 0, 0, 1, 1,
-0.4228834, 0.07698017, -0.6895071, 0, 0, 0, 1, 1,
-0.4193862, -1.061325, -3.494258, 0, 0, 0, 1, 1,
-0.4184859, 0.6316215, -0.3356268, 1, 1, 1, 1, 1,
-0.416932, 0.4362821, -2.186051, 1, 1, 1, 1, 1,
-0.4162678, -0.8983961, -2.022173, 1, 1, 1, 1, 1,
-0.4128033, -0.9211533, -3.35483, 1, 1, 1, 1, 1,
-0.4125256, -0.6073444, -2.955423, 1, 1, 1, 1, 1,
-0.4120966, 0.3450522, -4.198859, 1, 1, 1, 1, 1,
-0.4120394, -0.05477741, -0.898769, 1, 1, 1, 1, 1,
-0.4113727, 1.040416, -0.8865204, 1, 1, 1, 1, 1,
-0.4077177, -0.2968559, -3.516151, 1, 1, 1, 1, 1,
-0.4030117, 0.7493298, -0.5519707, 1, 1, 1, 1, 1,
-0.4019934, 0.2273879, -0.8601137, 1, 1, 1, 1, 1,
-0.3951798, -0.4119531, -2.183372, 1, 1, 1, 1, 1,
-0.3948338, -0.3587445, -1.801751, 1, 1, 1, 1, 1,
-0.3948107, -0.6888717, -4.778683, 1, 1, 1, 1, 1,
-0.3867958, -1.351176, -1.280294, 1, 1, 1, 1, 1,
-0.3830127, -0.9387046, 0.1696672, 0, 0, 1, 1, 1,
-0.3804897, -0.1393792, -0.9174072, 1, 0, 0, 1, 1,
-0.3772219, -0.1317369, -1.938824, 1, 0, 0, 1, 1,
-0.3740764, -0.8605378, -1.156569, 1, 0, 0, 1, 1,
-0.3736922, 0.6671327, -1.446075, 1, 0, 0, 1, 1,
-0.3620011, -1.23271, -2.819389, 1, 0, 0, 1, 1,
-0.358277, 0.5490725, -0.4733753, 0, 0, 0, 1, 1,
-0.3577951, -0.3530923, -3.791926, 0, 0, 0, 1, 1,
-0.3416134, 0.4775453, 0.4195487, 0, 0, 0, 1, 1,
-0.3384387, -0.858169, -3.163116, 0, 0, 0, 1, 1,
-0.3379921, -0.4271124, -1.036577, 0, 0, 0, 1, 1,
-0.3317652, 0.2387146, 0.3745965, 0, 0, 0, 1, 1,
-0.3300693, 0.1172843, -0.6900548, 0, 0, 0, 1, 1,
-0.3298496, 0.003140485, -2.526094, 1, 1, 1, 1, 1,
-0.3263985, 0.5133377, -0.6272888, 1, 1, 1, 1, 1,
-0.3262109, -1.000645, -3.617418, 1, 1, 1, 1, 1,
-0.3239479, -1.924218, -4.511507, 1, 1, 1, 1, 1,
-0.3236248, -0.6428633, -3.141738, 1, 1, 1, 1, 1,
-0.321206, 0.4795349, -0.6416123, 1, 1, 1, 1, 1,
-0.3191478, 0.673995, -0.7078047, 1, 1, 1, 1, 1,
-0.3113663, -0.0597402, -2.07511, 1, 1, 1, 1, 1,
-0.3095846, 1.034579, -0.5472881, 1, 1, 1, 1, 1,
-0.305089, -0.4873443, -1.303018, 1, 1, 1, 1, 1,
-0.3042985, 0.2628104, -0.7036991, 1, 1, 1, 1, 1,
-0.2938904, 0.6167859, -0.1123265, 1, 1, 1, 1, 1,
-0.293342, -0.5990667, -3.517725, 1, 1, 1, 1, 1,
-0.291337, 0.6443713, -0.2890753, 1, 1, 1, 1, 1,
-0.2908329, -0.07798608, -1.101858, 1, 1, 1, 1, 1,
-0.2892731, 0.2553348, -1.22265, 0, 0, 1, 1, 1,
-0.2891753, -1.644994, -3.484999, 1, 0, 0, 1, 1,
-0.2874449, -2.145008, -3.841866, 1, 0, 0, 1, 1,
-0.2854506, -0.01384487, -2.148674, 1, 0, 0, 1, 1,
-0.2846425, -0.5505978, -3.098971, 1, 0, 0, 1, 1,
-0.2809127, -0.9706586, -3.530866, 1, 0, 0, 1, 1,
-0.2755898, 0.9018584, 0.6551977, 0, 0, 0, 1, 1,
-0.2744927, -1.697853, -3.436564, 0, 0, 0, 1, 1,
-0.2718986, -0.2045282, -3.515127, 0, 0, 0, 1, 1,
-0.2716139, 0.4130403, 0.9753222, 0, 0, 0, 1, 1,
-0.2673216, -0.4591764, -2.602048, 0, 0, 0, 1, 1,
-0.266695, -0.7846769, -3.244341, 0, 0, 0, 1, 1,
-0.2650324, -0.1047287, -2.570257, 0, 0, 0, 1, 1,
-0.2642547, -1.320118, -4.044456, 1, 1, 1, 1, 1,
-0.2632117, -0.7011854, -0.6343219, 1, 1, 1, 1, 1,
-0.2603062, -0.5610243, -2.198708, 1, 1, 1, 1, 1,
-0.251849, 1.295864, -0.6947523, 1, 1, 1, 1, 1,
-0.2489482, 0.2283048, -1.163882, 1, 1, 1, 1, 1,
-0.2462356, 0.1135944, -0.6919522, 1, 1, 1, 1, 1,
-0.2460963, 0.9421799, 1.130487, 1, 1, 1, 1, 1,
-0.2446424, 0.5935721, -2.230962, 1, 1, 1, 1, 1,
-0.244124, 1.459229, 0.3541845, 1, 1, 1, 1, 1,
-0.2407759, 1.050592, 0.01318381, 1, 1, 1, 1, 1,
-0.2278902, -1.761525, -2.57441, 1, 1, 1, 1, 1,
-0.2231781, -1.725981, -3.03977, 1, 1, 1, 1, 1,
-0.221904, -0.7165922, -3.602566, 1, 1, 1, 1, 1,
-0.2218844, 0.435763, -0.9803854, 1, 1, 1, 1, 1,
-0.2163258, 0.3810611, -0.3886869, 1, 1, 1, 1, 1,
-0.2147591, 0.5576449, 0.7520672, 0, 0, 1, 1, 1,
-0.21425, -0.2307144, -2.833322, 1, 0, 0, 1, 1,
-0.211459, -0.8804114, -1.581476, 1, 0, 0, 1, 1,
-0.2096879, -0.6682222, -3.664677, 1, 0, 0, 1, 1,
-0.2037195, 1.227188, -0.8144937, 1, 0, 0, 1, 1,
-0.1945307, -0.03850933, -2.459306, 1, 0, 0, 1, 1,
-0.191884, -1.321982, -2.048411, 0, 0, 0, 1, 1,
-0.1872045, -0.8746008, -2.060283, 0, 0, 0, 1, 1,
-0.1863301, 0.6687807, 0.7020135, 0, 0, 0, 1, 1,
-0.1824439, 0.7646201, -1.353634, 0, 0, 0, 1, 1,
-0.1810406, 1.161397, -1.426735, 0, 0, 0, 1, 1,
-0.1791113, 0.4771792, 0.8707803, 0, 0, 0, 1, 1,
-0.1766147, -0.1521502, -1.682078, 0, 0, 0, 1, 1,
-0.1739235, 0.3408734, -0.6109604, 1, 1, 1, 1, 1,
-0.1737578, 2.246912, 0.4236262, 1, 1, 1, 1, 1,
-0.1718616, 0.07907534, -1.621225, 1, 1, 1, 1, 1,
-0.1682068, 0.5845278, 0.785247, 1, 1, 1, 1, 1,
-0.1679397, -0.5505823, -4.531324, 1, 1, 1, 1, 1,
-0.1673185, -0.3907648, -2.057674, 1, 1, 1, 1, 1,
-0.1631745, -0.5221883, -3.909444, 1, 1, 1, 1, 1,
-0.1575573, -1.649011, -3.709968, 1, 1, 1, 1, 1,
-0.1562576, 1.252213, -0.6491671, 1, 1, 1, 1, 1,
-0.1550286, -0.05731585, -0.6547609, 1, 1, 1, 1, 1,
-0.1520401, 0.3138272, -0.4947156, 1, 1, 1, 1, 1,
-0.1515608, 0.2781903, -0.07498919, 1, 1, 1, 1, 1,
-0.1513598, 1.097849, -0.4670566, 1, 1, 1, 1, 1,
-0.1512243, 1.050257, -1.071633, 1, 1, 1, 1, 1,
-0.1502716, -0.3290325, -1.306869, 1, 1, 1, 1, 1,
-0.1469999, 1.860288, -1.825395, 0, 0, 1, 1, 1,
-0.1434052, -0.5980961, -2.544972, 1, 0, 0, 1, 1,
-0.1425581, 2.30459, 1.698944, 1, 0, 0, 1, 1,
-0.1421174, 0.5291026, -1.424309, 1, 0, 0, 1, 1,
-0.1354036, -0.6399227, -2.003424, 1, 0, 0, 1, 1,
-0.1264497, -1.521252, -3.627556, 1, 0, 0, 1, 1,
-0.1248835, 0.7022587, 0.5095711, 0, 0, 0, 1, 1,
-0.1239175, 1.814263, -1.521415, 0, 0, 0, 1, 1,
-0.1215159, 1.577376, 1.856942, 0, 0, 0, 1, 1,
-0.1204739, -0.2756764, -3.085815, 0, 0, 0, 1, 1,
-0.1189087, -0.865123, -2.610932, 0, 0, 0, 1, 1,
-0.1186084, 0.3978879, -1.731444, 0, 0, 0, 1, 1,
-0.1177696, 1.058567, 0.1872527, 0, 0, 0, 1, 1,
-0.116884, 0.8976908, -0.8977848, 1, 1, 1, 1, 1,
-0.1148481, -0.5242884, -3.154459, 1, 1, 1, 1, 1,
-0.1146829, -1.549489, -3.160372, 1, 1, 1, 1, 1,
-0.111017, 0.8267775, 0.1457827, 1, 1, 1, 1, 1,
-0.1063324, 0.09210674, -0.8445706, 1, 1, 1, 1, 1,
-0.1032427, -1.224624, -2.598579, 1, 1, 1, 1, 1,
-0.1002427, 1.475152, -0.1885782, 1, 1, 1, 1, 1,
-0.09653401, -1.841258, -2.838026, 1, 1, 1, 1, 1,
-0.09651561, 1.526101, 0.3024838, 1, 1, 1, 1, 1,
-0.09050391, -1.226018, -2.052826, 1, 1, 1, 1, 1,
-0.08972904, 0.2388063, -1.954631, 1, 1, 1, 1, 1,
-0.08763985, -1.066398, -3.051932, 1, 1, 1, 1, 1,
-0.08708107, -0.2826836, -3.338649, 1, 1, 1, 1, 1,
-0.08444713, 0.380538, 0.981039, 1, 1, 1, 1, 1,
-0.08323158, 0.7886454, -0.6896235, 1, 1, 1, 1, 1,
-0.08318423, -0.218661, -3.15376, 0, 0, 1, 1, 1,
-0.08280712, -0.1142314, -2.559683, 1, 0, 0, 1, 1,
-0.07746796, -2.084139, -4.785475, 1, 0, 0, 1, 1,
-0.07700187, -0.4288109, -3.274955, 1, 0, 0, 1, 1,
-0.07541814, -0.8661013, -3.92976, 1, 0, 0, 1, 1,
-0.0746231, -1.372026, -4.11461, 1, 0, 0, 1, 1,
-0.07083569, -0.2682944, -5.695226, 0, 0, 0, 1, 1,
-0.06215819, 1.238743, 0.9690945, 0, 0, 0, 1, 1,
-0.06208839, -1.22552, -3.279299, 0, 0, 0, 1, 1,
-0.06060008, 1.114912, -0.04965729, 0, 0, 0, 1, 1,
-0.06023349, -0.6312308, -2.321559, 0, 0, 0, 1, 1,
-0.0596722, 0.3629275, 0.2361823, 0, 0, 0, 1, 1,
-0.04257853, 0.2622089, 0.403958, 0, 0, 0, 1, 1,
-0.04219025, -0.7243608, -3.239982, 1, 1, 1, 1, 1,
-0.0403625, 0.2063123, -0.08126444, 1, 1, 1, 1, 1,
-0.03601697, -1.414947, -3.565329, 1, 1, 1, 1, 1,
-0.0311846, -1.166491, -3.297503, 1, 1, 1, 1, 1,
-0.02993566, -1.467454, -2.095817, 1, 1, 1, 1, 1,
-0.0296947, -1.196354, -2.537025, 1, 1, 1, 1, 1,
-0.0236898, -0.8297772, -3.324137, 1, 1, 1, 1, 1,
-0.01950941, -1.39103, -2.286599, 1, 1, 1, 1, 1,
-0.018863, 0.244554, -1.561922, 1, 1, 1, 1, 1,
-0.01813226, -0.3118222, -3.023295, 1, 1, 1, 1, 1,
-0.01812251, -0.6917444, -4.335419, 1, 1, 1, 1, 1,
-0.01520307, 0.4198363, -0.075574, 1, 1, 1, 1, 1,
-0.008066076, 0.4788662, 0.8290489, 1, 1, 1, 1, 1,
-0.005774771, 0.3929915, 0.9669325, 1, 1, 1, 1, 1,
-0.004984684, -1.746892, -2.899541, 1, 1, 1, 1, 1,
0.002451646, 0.9162847, 0.1906342, 0, 0, 1, 1, 1,
0.005087156, -1.077927, 4.466329, 1, 0, 0, 1, 1,
0.0108866, 2.33615, 0.7001055, 1, 0, 0, 1, 1,
0.0108922, 1.14503, -1.414965, 1, 0, 0, 1, 1,
0.01212585, 0.7979137, -0.3316956, 1, 0, 0, 1, 1,
0.01398445, -0.4231858, 4.82142, 1, 0, 0, 1, 1,
0.02008087, -1.083068, 2.127511, 0, 0, 0, 1, 1,
0.02189916, -0.5832567, 2.211742, 0, 0, 0, 1, 1,
0.02313844, -1.553498, 1.950396, 0, 0, 0, 1, 1,
0.02355334, 0.1780004, 1.447136, 0, 0, 0, 1, 1,
0.02358256, 0.1480782, 1.653317, 0, 0, 0, 1, 1,
0.02872383, 0.4820889, -0.5723568, 0, 0, 0, 1, 1,
0.03195659, 0.05249624, 1.582289, 0, 0, 0, 1, 1,
0.03434456, 2.081475, 0.0006960061, 1, 1, 1, 1, 1,
0.03449666, -1.04133, 2.885625, 1, 1, 1, 1, 1,
0.03483997, -1.252846, 2.305912, 1, 1, 1, 1, 1,
0.03549546, 1.433468, -0.3366064, 1, 1, 1, 1, 1,
0.03977158, 0.237192, -1.070552, 1, 1, 1, 1, 1,
0.04074985, -0.1833577, 1.547211, 1, 1, 1, 1, 1,
0.04180599, -1.033305, 3.154691, 1, 1, 1, 1, 1,
0.04309952, -0.9362113, 4.057058, 1, 1, 1, 1, 1,
0.04768211, -0.5463708, 4.141695, 1, 1, 1, 1, 1,
0.05281518, 1.070818, 1.304346, 1, 1, 1, 1, 1,
0.05382464, -0.03315574, 1.408309, 1, 1, 1, 1, 1,
0.0573204, -1.133352, 1.324532, 1, 1, 1, 1, 1,
0.06118186, -0.9247392, 2.748429, 1, 1, 1, 1, 1,
0.06251467, -0.2537443, 3.5626, 1, 1, 1, 1, 1,
0.06306344, -0.6186587, 3.948433, 1, 1, 1, 1, 1,
0.06912053, -0.769887, 3.526855, 0, 0, 1, 1, 1,
0.07054376, -0.06688471, 2.893783, 1, 0, 0, 1, 1,
0.07080824, 0.6156983, 0.1782872, 1, 0, 0, 1, 1,
0.07517186, -0.8874826, 3.815593, 1, 0, 0, 1, 1,
0.07654183, -0.2708246, 2.391746, 1, 0, 0, 1, 1,
0.08062773, 0.3106079, 0.452523, 1, 0, 0, 1, 1,
0.08163348, -1.396799, 2.314183, 0, 0, 0, 1, 1,
0.08712962, -1.435563, 4.405911, 0, 0, 0, 1, 1,
0.08820584, 1.434025, -0.8076501, 0, 0, 0, 1, 1,
0.09021313, -0.0816623, 2.921018, 0, 0, 0, 1, 1,
0.09119374, -1.71288, 1.251438, 0, 0, 0, 1, 1,
0.09815831, -0.9882437, 2.701045, 0, 0, 0, 1, 1,
0.1076219, -0.2061775, 3.086614, 0, 0, 0, 1, 1,
0.1128413, 1.383334, -1.701526, 1, 1, 1, 1, 1,
0.1174436, 0.2473766, 0.2365209, 1, 1, 1, 1, 1,
0.1194326, -0.190644, 3.640631, 1, 1, 1, 1, 1,
0.1267419, 0.0170712, 1.969639, 1, 1, 1, 1, 1,
0.1274012, 0.03450705, -0.01909084, 1, 1, 1, 1, 1,
0.1282561, 0.9421178, -0.5989825, 1, 1, 1, 1, 1,
0.1330628, -0.8713775, 2.09762, 1, 1, 1, 1, 1,
0.1341072, 0.2166744, -0.08618496, 1, 1, 1, 1, 1,
0.1358001, 0.2897232, 0.9586123, 1, 1, 1, 1, 1,
0.1365676, 2.591914, 1.982039, 1, 1, 1, 1, 1,
0.1399738, -0.1882384, 2.702046, 1, 1, 1, 1, 1,
0.1454768, 0.3530082, -1.2681, 1, 1, 1, 1, 1,
0.1497928, -0.3354523, 1.936484, 1, 1, 1, 1, 1,
0.1511493, -0.1717421, 3.569136, 1, 1, 1, 1, 1,
0.1532269, 0.1178849, 0.6816167, 1, 1, 1, 1, 1,
0.1628384, 0.2711646, 1.358208, 0, 0, 1, 1, 1,
0.1642378, 1.596214, -0.2328702, 1, 0, 0, 1, 1,
0.1644274, -0.2443361, 3.336875, 1, 0, 0, 1, 1,
0.1656747, 0.7986783, 1.354414, 1, 0, 0, 1, 1,
0.1661284, -0.1244273, 2.48067, 1, 0, 0, 1, 1,
0.1707985, -0.02185468, 1.998263, 1, 0, 0, 1, 1,
0.1749568, -0.553884, 2.151604, 0, 0, 0, 1, 1,
0.1772407, 0.6765743, 1.14241, 0, 0, 0, 1, 1,
0.1792997, 1.223846, 1.561421, 0, 0, 0, 1, 1,
0.1816204, -1.184648, 5.520169, 0, 0, 0, 1, 1,
0.1858189, -0.7710334, 4.063605, 0, 0, 0, 1, 1,
0.1863865, 0.02741104, -0.2194245, 0, 0, 0, 1, 1,
0.187987, 0.5555487, 1.052719, 0, 0, 0, 1, 1,
0.1900163, -1.048928, 2.265904, 1, 1, 1, 1, 1,
0.1902047, 0.8039784, -0.456659, 1, 1, 1, 1, 1,
0.1917243, 0.1386656, 1.833753, 1, 1, 1, 1, 1,
0.1979765, 0.7300568, 0.9663876, 1, 1, 1, 1, 1,
0.2019174, 0.002561031, 1.148211, 1, 1, 1, 1, 1,
0.2034906, 0.476088, 0.6936262, 1, 1, 1, 1, 1,
0.2073453, -0.931968, 2.327366, 1, 1, 1, 1, 1,
0.210409, 0.4136811, 0.8379133, 1, 1, 1, 1, 1,
0.2135308, 0.5534332, 0.3089026, 1, 1, 1, 1, 1,
0.2142416, -1.834139, 2.609688, 1, 1, 1, 1, 1,
0.2176232, 0.557748, -0.7651137, 1, 1, 1, 1, 1,
0.2214335, -1.750441, 2.8898, 1, 1, 1, 1, 1,
0.2229993, 0.1103113, 1.658598, 1, 1, 1, 1, 1,
0.2252032, 0.3441829, 1.2715, 1, 1, 1, 1, 1,
0.2253728, -1.997221, 1.872452, 1, 1, 1, 1, 1,
0.2272415, 2.151526, 0.3656819, 0, 0, 1, 1, 1,
0.2288235, -0.5187382, 1.994943, 1, 0, 0, 1, 1,
0.2317608, -1.243098, 2.596059, 1, 0, 0, 1, 1,
0.2338813, -0.4668348, 3.973287, 1, 0, 0, 1, 1,
0.2379755, -1.233732, 2.322203, 1, 0, 0, 1, 1,
0.2430594, -0.3174689, 1.427768, 1, 0, 0, 1, 1,
0.2436357, -0.7559515, 2.566291, 0, 0, 0, 1, 1,
0.2446978, 1.220425, -0.04557205, 0, 0, 0, 1, 1,
0.252973, 1.299447, 1.268354, 0, 0, 0, 1, 1,
0.2544286, -1.549546, 1.919676, 0, 0, 0, 1, 1,
0.2552905, -0.7243472, 0.9466349, 0, 0, 0, 1, 1,
0.2559433, -1.833185, 3.76928, 0, 0, 0, 1, 1,
0.2576882, 1.241628, -0.5609685, 0, 0, 0, 1, 1,
0.2579559, 1.75469, -0.3367182, 1, 1, 1, 1, 1,
0.2593234, 1.207786, 0.9209908, 1, 1, 1, 1, 1,
0.2615985, 0.200476, 0.2235778, 1, 1, 1, 1, 1,
0.2616073, 0.9707689, 1.433288, 1, 1, 1, 1, 1,
0.2673189, -2.241539, 2.073546, 1, 1, 1, 1, 1,
0.2685826, 0.3138805, -0.004085064, 1, 1, 1, 1, 1,
0.2686683, 0.2444484, 1.552552, 1, 1, 1, 1, 1,
0.2686872, 0.1172673, 0.3235007, 1, 1, 1, 1, 1,
0.2723013, -0.1950129, 2.379396, 1, 1, 1, 1, 1,
0.2724675, 0.3154258, 0.7736973, 1, 1, 1, 1, 1,
0.2793744, -1.331635, 0.8872882, 1, 1, 1, 1, 1,
0.2833967, -0.06311639, 0.9050515, 1, 1, 1, 1, 1,
0.2867188, 1.315578, -0.04163952, 1, 1, 1, 1, 1,
0.2907161, -0.5009887, 2.999279, 1, 1, 1, 1, 1,
0.2931302, 0.3010709, -0.9133972, 1, 1, 1, 1, 1,
0.2932264, 0.347937, 0.5709128, 0, 0, 1, 1, 1,
0.2993011, -0.3723104, -0.02274447, 1, 0, 0, 1, 1,
0.3010058, -0.6334445, 0.5296044, 1, 0, 0, 1, 1,
0.3060411, -1.33478, 1.963562, 1, 0, 0, 1, 1,
0.3067726, -0.5758501, 2.729979, 1, 0, 0, 1, 1,
0.3100333, -0.7098741, 2.499808, 1, 0, 0, 1, 1,
0.3109817, 0.5863879, 1.800118, 0, 0, 0, 1, 1,
0.3117654, -0.2566466, 3.841927, 0, 0, 0, 1, 1,
0.3142634, 2.372681, 0.1457686, 0, 0, 0, 1, 1,
0.3145703, 1.059254, -0.9419248, 0, 0, 0, 1, 1,
0.316842, -0.5063114, 1.362518, 0, 0, 0, 1, 1,
0.3170392, -1.274851, 2.134581, 0, 0, 0, 1, 1,
0.3185764, 2.399077, 0.6247514, 0, 0, 0, 1, 1,
0.31969, 0.4815936, -0.4286542, 1, 1, 1, 1, 1,
0.3294848, 1.308338, 0.2415424, 1, 1, 1, 1, 1,
0.3303752, -0.6777042, 3.093448, 1, 1, 1, 1, 1,
0.3317586, -1.767295, 3.266354, 1, 1, 1, 1, 1,
0.3396931, 0.397302, 0.6771809, 1, 1, 1, 1, 1,
0.3434171, -0.4724217, 1.883736, 1, 1, 1, 1, 1,
0.3441887, 0.8276826, -0.1417515, 1, 1, 1, 1, 1,
0.3472967, 0.373901, 1.417265, 1, 1, 1, 1, 1,
0.3494466, -2.071572, 3.359272, 1, 1, 1, 1, 1,
0.3495527, -0.8725098, 2.780821, 1, 1, 1, 1, 1,
0.3534779, -0.5633165, 1.592459, 1, 1, 1, 1, 1,
0.3593903, 0.8978821, -0.122122, 1, 1, 1, 1, 1,
0.3596192, -0.5954126, 0.9669302, 1, 1, 1, 1, 1,
0.3599641, -1.535343, 5.567474, 1, 1, 1, 1, 1,
0.3715141, 0.6035131, 1.61193, 1, 1, 1, 1, 1,
0.3736922, 1.1031, 0.05245637, 0, 0, 1, 1, 1,
0.3780651, -1.206781, 3.310407, 1, 0, 0, 1, 1,
0.3781228, 0.5985171, 1.507263, 1, 0, 0, 1, 1,
0.3797972, -1.389852, 2.704464, 1, 0, 0, 1, 1,
0.3810108, 0.9123413, -0.4988132, 1, 0, 0, 1, 1,
0.3888124, 1.228799, -0.3962015, 1, 0, 0, 1, 1,
0.388821, 1.465048, 0.9281747, 0, 0, 0, 1, 1,
0.3900523, -0.6843876, 1.394592, 0, 0, 0, 1, 1,
0.3907865, 1.467687, -0.04524622, 0, 0, 0, 1, 1,
0.3979716, 1.189329, 3.065264, 0, 0, 0, 1, 1,
0.3995291, -0.07602909, 3.243787, 0, 0, 0, 1, 1,
0.4041988, 0.1584439, 0.7953079, 0, 0, 0, 1, 1,
0.4050037, -0.6392302, 2.173569, 0, 0, 0, 1, 1,
0.4075117, 0.7786025, 1.729262, 1, 1, 1, 1, 1,
0.4092407, -0.1190817, 0.8336303, 1, 1, 1, 1, 1,
0.4095449, -0.1037076, 1.232962, 1, 1, 1, 1, 1,
0.41139, 0.8510285, 1.159217, 1, 1, 1, 1, 1,
0.4169199, -0.5145013, 0.7462237, 1, 1, 1, 1, 1,
0.4200255, 0.2236566, 0.1480728, 1, 1, 1, 1, 1,
0.4228648, -1.308022, 3.384946, 1, 1, 1, 1, 1,
0.4251008, -0.6120018, 1.64933, 1, 1, 1, 1, 1,
0.428258, 0.2791665, 0.7559863, 1, 1, 1, 1, 1,
0.4416382, -1.14698, 2.897668, 1, 1, 1, 1, 1,
0.4439416, -0.5406685, 3.030776, 1, 1, 1, 1, 1,
0.4439627, 0.1851254, 1.733734, 1, 1, 1, 1, 1,
0.445014, 0.3549719, -0.08549427, 1, 1, 1, 1, 1,
0.4498226, 0.04835576, 1.013542, 1, 1, 1, 1, 1,
0.4558812, 0.4612559, 0.3122065, 1, 1, 1, 1, 1,
0.4596224, 1.281564, -0.06786966, 0, 0, 1, 1, 1,
0.4616551, -1.087303, 1.647899, 1, 0, 0, 1, 1,
0.468852, 1.560963, -0.7793444, 1, 0, 0, 1, 1,
0.4706587, -0.8699982, 1.853347, 1, 0, 0, 1, 1,
0.47087, -1.048155, 2.014986, 1, 0, 0, 1, 1,
0.4723017, 0.3186332, 0.6002325, 1, 0, 0, 1, 1,
0.4789577, -0.1843611, -0.1117001, 0, 0, 0, 1, 1,
0.4817377, 0.5395479, 1.47915, 0, 0, 0, 1, 1,
0.4825969, 0.618925, 0.2105432, 0, 0, 0, 1, 1,
0.4829823, 0.332118, 2.057756, 0, 0, 0, 1, 1,
0.4847094, 0.9323391, -0.4986813, 0, 0, 0, 1, 1,
0.4852513, 1.784638, 0.9035029, 0, 0, 0, 1, 1,
0.492975, 0.3187665, 0.414019, 0, 0, 0, 1, 1,
0.4955778, 1.678913, 2.237917, 1, 1, 1, 1, 1,
0.4959847, -1.405927, 2.401696, 1, 1, 1, 1, 1,
0.4965219, 0.5086581, 0.9159263, 1, 1, 1, 1, 1,
0.4972001, 0.2022655, 1.783551, 1, 1, 1, 1, 1,
0.4975112, 2.308839, 2.296877, 1, 1, 1, 1, 1,
0.5002648, 2.311403, 0.6631751, 1, 1, 1, 1, 1,
0.5004769, 1.535251, -0.1779284, 1, 1, 1, 1, 1,
0.5004805, -1.573945, 3.668011, 1, 1, 1, 1, 1,
0.5049699, 1.906295, -1.054754, 1, 1, 1, 1, 1,
0.5099707, 0.8331242, 0.7491374, 1, 1, 1, 1, 1,
0.5127813, -0.1430498, 3.835723, 1, 1, 1, 1, 1,
0.5150802, 0.6056598, 1.090714, 1, 1, 1, 1, 1,
0.516704, 0.7601525, -0.992371, 1, 1, 1, 1, 1,
0.5168287, 0.5321711, -0.09023407, 1, 1, 1, 1, 1,
0.5198333, -0.1291482, 2.75932, 1, 1, 1, 1, 1,
0.5201786, 0.01389468, 2.259474, 0, 0, 1, 1, 1,
0.5292094, -0.1495817, 3.700104, 1, 0, 0, 1, 1,
0.5316526, 0.9376172, 2.117944, 1, 0, 0, 1, 1,
0.5324436, 2.032267, 0.4279393, 1, 0, 0, 1, 1,
0.534169, -1.489993, 2.529635, 1, 0, 0, 1, 1,
0.5363551, -0.6211637, 2.409502, 1, 0, 0, 1, 1,
0.5372466, 1.975203, 0.9783705, 0, 0, 0, 1, 1,
0.5407149, -1.30991, 2.487358, 0, 0, 0, 1, 1,
0.5476971, 1.301008, 1.378263, 0, 0, 0, 1, 1,
0.5546953, 0.326368, 1.939641, 0, 0, 0, 1, 1,
0.5561684, 1.977936, -1.370842, 0, 0, 0, 1, 1,
0.5579937, -0.9294568, 4.371485, 0, 0, 0, 1, 1,
0.5583657, -0.624579, 3.916758, 0, 0, 0, 1, 1,
0.5599779, 0.2421301, 2.202747, 1, 1, 1, 1, 1,
0.5619646, 1.17167, -0.1891607, 1, 1, 1, 1, 1,
0.5643255, 1.077544, -0.2876243, 1, 1, 1, 1, 1,
0.5695862, 1.4631, 0.1446585, 1, 1, 1, 1, 1,
0.5718604, -0.2038011, 0.1235647, 1, 1, 1, 1, 1,
0.5738318, 1.239374, -1.486756, 1, 1, 1, 1, 1,
0.5744219, 1.661057, 1.497879, 1, 1, 1, 1, 1,
0.5758646, -0.04571732, 1.081436, 1, 1, 1, 1, 1,
0.5770617, 1.32329, -0.7143301, 1, 1, 1, 1, 1,
0.5774224, 2.009085, 0.01095198, 1, 1, 1, 1, 1,
0.5829939, -1.136253, 1.143921, 1, 1, 1, 1, 1,
0.5852026, -2.200322, 3.363912, 1, 1, 1, 1, 1,
0.5893755, -1.06532, 0.7212244, 1, 1, 1, 1, 1,
0.5927393, 0.8698405, 1.567586, 1, 1, 1, 1, 1,
0.5929732, -0.1781647, 2.970592, 1, 1, 1, 1, 1,
0.5956485, -0.5438679, 1.701398, 0, 0, 1, 1, 1,
0.6009128, 1.070495, 1.449856, 1, 0, 0, 1, 1,
0.6048891, -0.02235079, -0.5665065, 1, 0, 0, 1, 1,
0.6096445, -1.276726, 3.537733, 1, 0, 0, 1, 1,
0.6108717, -0.2523201, 0.6638634, 1, 0, 0, 1, 1,
0.6134981, -0.2146578, 2.686383, 1, 0, 0, 1, 1,
0.617156, 0.5448446, 4.122526, 0, 0, 0, 1, 1,
0.6244088, 0.06617676, 2.566744, 0, 0, 0, 1, 1,
0.6269687, -0.4584659, 2.363957, 0, 0, 0, 1, 1,
0.6276796, -1.919307, 3.650317, 0, 0, 0, 1, 1,
0.6276889, 1.77604, 1.589358, 0, 0, 0, 1, 1,
0.6344263, 0.6217221, 0.5584893, 0, 0, 0, 1, 1,
0.6452929, -0.8421903, 2.074105, 0, 0, 0, 1, 1,
0.6470006, -1.435572, 2.392314, 1, 1, 1, 1, 1,
0.6476739, -1.608559, 2.680769, 1, 1, 1, 1, 1,
0.6483366, -0.1225944, 3.058373, 1, 1, 1, 1, 1,
0.6491658, 0.03355562, 1.569281, 1, 1, 1, 1, 1,
0.6505803, 1.347624, -0.6564296, 1, 1, 1, 1, 1,
0.6510116, -0.1462021, 0.06014979, 1, 1, 1, 1, 1,
0.6549414, 0.9915516, 1.015615, 1, 1, 1, 1, 1,
0.6644027, 1.882831, -1.660432, 1, 1, 1, 1, 1,
0.6678285, 1.873248, 1.663936, 1, 1, 1, 1, 1,
0.6739064, -0.4096682, 1.713559, 1, 1, 1, 1, 1,
0.6821027, 1.196661, 1.866309, 1, 1, 1, 1, 1,
0.6854423, 0.02605328, 0.8071187, 1, 1, 1, 1, 1,
0.6885176, 2.039091, 1.179893, 1, 1, 1, 1, 1,
0.6929474, 0.08321507, 1.710169, 1, 1, 1, 1, 1,
0.7003372, -1.534382, 3.0214, 1, 1, 1, 1, 1,
0.7013679, 0.6577774, -0.1529887, 0, 0, 1, 1, 1,
0.7037167, -2.340049, 2.4191, 1, 0, 0, 1, 1,
0.7066476, 0.1036554, 2.1516, 1, 0, 0, 1, 1,
0.7071888, 0.5961835, 0.5592834, 1, 0, 0, 1, 1,
0.7106363, 0.5263203, 0.413126, 1, 0, 0, 1, 1,
0.7149768, 0.1061905, 0.05159928, 1, 0, 0, 1, 1,
0.727731, -0.4187982, 1.568283, 0, 0, 0, 1, 1,
0.7284105, 1.216942, -0.3327955, 0, 0, 0, 1, 1,
0.7295116, 0.8083974, 1.699141, 0, 0, 0, 1, 1,
0.729923, 1.418935, -0.6235889, 0, 0, 0, 1, 1,
0.7362208, -1.257549, 2.909481, 0, 0, 0, 1, 1,
0.7408036, 1.398996, 2.838723, 0, 0, 0, 1, 1,
0.7421329, 0.2921485, 0.3625183, 0, 0, 0, 1, 1,
0.7440241, 1.33067, 1.212254, 1, 1, 1, 1, 1,
0.7455018, -0.7313046, 1.859283, 1, 1, 1, 1, 1,
0.7474942, 0.4230731, 1.077145, 1, 1, 1, 1, 1,
0.7530113, -0.2232453, 1.19351, 1, 1, 1, 1, 1,
0.7545171, -1.010463, 1.020702, 1, 1, 1, 1, 1,
0.7611719, 0.6428708, 1.087352, 1, 1, 1, 1, 1,
0.7637454, 1.235488, 1.469178, 1, 1, 1, 1, 1,
0.7639667, 0.8524929, -0.753115, 1, 1, 1, 1, 1,
0.7693641, 0.2389427, 3.201561, 1, 1, 1, 1, 1,
0.7708395, -0.8850612, 1.610488, 1, 1, 1, 1, 1,
0.7710194, -0.4305925, 1.100397, 1, 1, 1, 1, 1,
0.7736579, -1.757113, 2.668947, 1, 1, 1, 1, 1,
0.7822959, 0.3599725, 1.761574, 1, 1, 1, 1, 1,
0.7873502, -0.3697386, 1.697211, 1, 1, 1, 1, 1,
0.7883871, -0.6017184, 1.233834, 1, 1, 1, 1, 1,
0.789839, -2.562171, 1.552015, 0, 0, 1, 1, 1,
0.7933076, 1.17401, 0.0922416, 1, 0, 0, 1, 1,
0.8002936, -0.2038937, 3.202987, 1, 0, 0, 1, 1,
0.8045186, -0.1628484, 0.831122, 1, 0, 0, 1, 1,
0.8075554, 0.4519251, 0.853659, 1, 0, 0, 1, 1,
0.8076528, -1.861848, 3.328224, 1, 0, 0, 1, 1,
0.8122896, 0.5817366, 2.148353, 0, 0, 0, 1, 1,
0.8133101, 0.733452, 1.474062, 0, 0, 0, 1, 1,
0.814784, -0.7687657, 1.767126, 0, 0, 0, 1, 1,
0.8179823, 0.001488061, 1.338043, 0, 0, 0, 1, 1,
0.8183579, -0.1796328, 4.055707, 0, 0, 0, 1, 1,
0.8315948, -0.5946174, 2.959533, 0, 0, 0, 1, 1,
0.8424215, 0.8755192, 0.09002059, 0, 0, 0, 1, 1,
0.8455121, -0.06115809, 3.151539, 1, 1, 1, 1, 1,
0.8478588, 0.7612777, 0.4065413, 1, 1, 1, 1, 1,
0.847999, -0.2628165, 1.355432, 1, 1, 1, 1, 1,
0.8661246, 0.7865605, 1.737547, 1, 1, 1, 1, 1,
0.8661955, -2.59255, 2.072798, 1, 1, 1, 1, 1,
0.869674, -0.9175413, 2.125149, 1, 1, 1, 1, 1,
0.882028, -0.780379, 3.033886, 1, 1, 1, 1, 1,
0.883773, 0.7159936, 0.1905049, 1, 1, 1, 1, 1,
0.8838661, -1.637084, 3.357625, 1, 1, 1, 1, 1,
0.8907746, 0.7077396, 0.3387378, 1, 1, 1, 1, 1,
0.8914481, 0.6789123, 2.448509, 1, 1, 1, 1, 1,
0.8991352, 0.1740332, 1.724912, 1, 1, 1, 1, 1,
0.9043342, 1.122373, 1.656854, 1, 1, 1, 1, 1,
0.9052125, -0.6442696, 1.287794, 1, 1, 1, 1, 1,
0.9088193, -0.5644852, 4.015406, 1, 1, 1, 1, 1,
0.9096771, 0.04715624, 1.708985, 0, 0, 1, 1, 1,
0.9120282, 0.1736313, -0.01692258, 1, 0, 0, 1, 1,
0.9139853, -0.4700887, 0.4351737, 1, 0, 0, 1, 1,
0.9161775, -0.6253818, 2.919668, 1, 0, 0, 1, 1,
0.9210664, -0.0765765, 2.057464, 1, 0, 0, 1, 1,
0.9262813, -1.292562, 2.884665, 1, 0, 0, 1, 1,
0.9281353, 1.056148, -1.273713, 0, 0, 0, 1, 1,
0.9307767, -0.7314367, 3.641536, 0, 0, 0, 1, 1,
0.934847, 0.9015731, 1.991821, 0, 0, 0, 1, 1,
0.9436615, 0.3242783, 0.7203488, 0, 0, 0, 1, 1,
0.9443164, 0.3157965, 1.829431, 0, 0, 0, 1, 1,
0.946314, -0.4613906, 2.517274, 0, 0, 0, 1, 1,
0.9650373, 1.402818, -0.2579164, 0, 0, 0, 1, 1,
0.9655629, -1.86356, 2.387215, 1, 1, 1, 1, 1,
0.9668221, 1.47013, 0.4250929, 1, 1, 1, 1, 1,
0.9697162, 0.1657302, 1.385142, 1, 1, 1, 1, 1,
0.9720032, -0.4860143, 3.157606, 1, 1, 1, 1, 1,
0.9723346, -1.517373, 1.734001, 1, 1, 1, 1, 1,
0.9724175, -0.3427699, 1.461469, 1, 1, 1, 1, 1,
0.9757289, -0.8057491, 1.154638, 1, 1, 1, 1, 1,
0.9771304, 1.261663, -0.7730979, 1, 1, 1, 1, 1,
0.9804994, -0.9695151, 1.011635, 1, 1, 1, 1, 1,
0.9816388, -1.395806, 2.35089, 1, 1, 1, 1, 1,
0.9871188, -1.99542, 4.557969, 1, 1, 1, 1, 1,
0.988609, -0.2957924, 2.22249, 1, 1, 1, 1, 1,
0.9891647, 0.8440676, 0.7734228, 1, 1, 1, 1, 1,
0.9987698, 1.342046, -1.205016, 1, 1, 1, 1, 1,
1.008083, -1.817713, 1.980619, 1, 1, 1, 1, 1,
1.013102, -1.11947, 2.030554, 0, 0, 1, 1, 1,
1.019122, 0.6613454, 2.00308, 1, 0, 0, 1, 1,
1.023365, 0.9317381, -0.87923, 1, 0, 0, 1, 1,
1.026658, -0.8483474, 0.4750127, 1, 0, 0, 1, 1,
1.02713, 0.163558, 0.1948702, 1, 0, 0, 1, 1,
1.032199, 1.117358, -0.9576539, 1, 0, 0, 1, 1,
1.036208, -0.9289904, 4.803574, 0, 0, 0, 1, 1,
1.039665, -0.3250239, 1.535587, 0, 0, 0, 1, 1,
1.047417, 0.7407243, -0.8955958, 0, 0, 0, 1, 1,
1.051845, 1.547388, 1.194361, 0, 0, 0, 1, 1,
1.054304, -0.6832911, 0.1119468, 0, 0, 0, 1, 1,
1.058731, -0.6248338, 1.047176, 0, 0, 0, 1, 1,
1.059812, -0.1780036, -0.2977701, 0, 0, 0, 1, 1,
1.065128, 1.57539, 1.961592, 1, 1, 1, 1, 1,
1.070914, -1.142594, 3.257618, 1, 1, 1, 1, 1,
1.076625, -0.2353845, 2.715113, 1, 1, 1, 1, 1,
1.082015, -0.1426196, -0.6005922, 1, 1, 1, 1, 1,
1.083819, -0.3641877, 0.5651855, 1, 1, 1, 1, 1,
1.085659, -0.5774044, 0.7897852, 1, 1, 1, 1, 1,
1.089719, 0.587077, -0.3572207, 1, 1, 1, 1, 1,
1.095607, -0.09492812, 1.596936, 1, 1, 1, 1, 1,
1.10021, 0.04343614, 3.419054, 1, 1, 1, 1, 1,
1.106361, 1.619323, 0.8719864, 1, 1, 1, 1, 1,
1.10927, 0.02608442, 1.890564, 1, 1, 1, 1, 1,
1.11054, -0.03072429, 0.5996254, 1, 1, 1, 1, 1,
1.111608, -1.170656, 1.496148, 1, 1, 1, 1, 1,
1.135848, 0.03138129, 1.191747, 1, 1, 1, 1, 1,
1.139421, -0.2941198, 2.765258, 1, 1, 1, 1, 1,
1.143178, 0.02804212, 2.162809, 0, 0, 1, 1, 1,
1.144143, -0.1162565, 0.8376158, 1, 0, 0, 1, 1,
1.14459, 1.464073, -0.03649232, 1, 0, 0, 1, 1,
1.150887, 0.8010042, 2.784818, 1, 0, 0, 1, 1,
1.158717, 0.9752276, 1.506356, 1, 0, 0, 1, 1,
1.181487, -0.2191063, 3.096006, 1, 0, 0, 1, 1,
1.186824, 0.6329391, 1.618552, 0, 0, 0, 1, 1,
1.191241, -0.03858174, 1.782891, 0, 0, 0, 1, 1,
1.195211, 0.4366114, 1.887563, 0, 0, 0, 1, 1,
1.198626, -0.1869837, 1.815186, 0, 0, 0, 1, 1,
1.20251, 0.6085894, 2.209605, 0, 0, 0, 1, 1,
1.20676, -0.03490752, 1.156825, 0, 0, 0, 1, 1,
1.217187, 1.558438, -0.1489643, 0, 0, 0, 1, 1,
1.218451, -1.655127, 1.596856, 1, 1, 1, 1, 1,
1.232906, 0.0355922, 1.740568, 1, 1, 1, 1, 1,
1.237357, -1.454005, 2.235299, 1, 1, 1, 1, 1,
1.240797, -0.6431534, 2.181348, 1, 1, 1, 1, 1,
1.242489, -1.545411, 3.766752, 1, 1, 1, 1, 1,
1.244614, -1.353377, 3.735098, 1, 1, 1, 1, 1,
1.247061, -0.5327297, 1.87362, 1, 1, 1, 1, 1,
1.25244, 0.6521304, -0.8628825, 1, 1, 1, 1, 1,
1.254832, -1.103633, 3.930616, 1, 1, 1, 1, 1,
1.254835, -0.5875832, 2.073647, 1, 1, 1, 1, 1,
1.268501, -1.032609, 1.799341, 1, 1, 1, 1, 1,
1.268858, -0.9204307, 0.8799114, 1, 1, 1, 1, 1,
1.292969, -0.4567967, 0.4177586, 1, 1, 1, 1, 1,
1.302309, 0.7388777, 1.200449, 1, 1, 1, 1, 1,
1.305347, 0.1290325, 0.3286647, 1, 1, 1, 1, 1,
1.318254, 0.5199688, 1.71271, 0, 0, 1, 1, 1,
1.32186, 0.3702906, 1.654137, 1, 0, 0, 1, 1,
1.327619, -1.716779, 1.631806, 1, 0, 0, 1, 1,
1.33267, -0.07502017, 2.781924, 1, 0, 0, 1, 1,
1.339113, 0.03791389, 1.684997, 1, 0, 0, 1, 1,
1.343714, 0.3843136, 2.619754, 1, 0, 0, 1, 1,
1.347122, 0.3657969, 1.678981, 0, 0, 0, 1, 1,
1.35549, -0.4619804, 2.630418, 0, 0, 0, 1, 1,
1.357708, 1.274866, -0.3019164, 0, 0, 0, 1, 1,
1.361148, -0.4031945, 1.704401, 0, 0, 0, 1, 1,
1.373343, 0.06112422, 2.959704, 0, 0, 0, 1, 1,
1.380237, -1.260076, 1.50317, 0, 0, 0, 1, 1,
1.381346, -1.072182, 2.743518, 0, 0, 0, 1, 1,
1.406747, 0.3092355, 0.8673841, 1, 1, 1, 1, 1,
1.418496, -0.3745324, 3.322331, 1, 1, 1, 1, 1,
1.418708, -0.324751, 1.465419, 1, 1, 1, 1, 1,
1.421462, -2.923337, 1.470992, 1, 1, 1, 1, 1,
1.424425, 0.8246201, 0.335756, 1, 1, 1, 1, 1,
1.43259, 0.9826412, 0.8799924, 1, 1, 1, 1, 1,
1.4338, 0.4636076, 0.005272261, 1, 1, 1, 1, 1,
1.434609, -0.03550973, 2.295863, 1, 1, 1, 1, 1,
1.44051, 0.8131965, 0.06647872, 1, 1, 1, 1, 1,
1.454664, 0.3421915, 1.2712, 1, 1, 1, 1, 1,
1.456904, -0.4095517, 1.928486, 1, 1, 1, 1, 1,
1.465352, -0.4537334, 1.755187, 1, 1, 1, 1, 1,
1.482296, 1.720994, -1.385753, 1, 1, 1, 1, 1,
1.490535, 0.2778912, 3.057662, 1, 1, 1, 1, 1,
1.502215, 1.797227, 0.2896042, 1, 1, 1, 1, 1,
1.506222, -0.6525453, 1.116758, 0, 0, 1, 1, 1,
1.516708, 0.1814239, 1.527067, 1, 0, 0, 1, 1,
1.521698, 2.687338, 1.246963, 1, 0, 0, 1, 1,
1.531894, 1.181817, 1.67642, 1, 0, 0, 1, 1,
1.550072, 0.03755358, 1.854535, 1, 0, 0, 1, 1,
1.557803, -0.353144, 2.886185, 1, 0, 0, 1, 1,
1.573984, -0.4977887, 0.9176247, 0, 0, 0, 1, 1,
1.577382, 1.361912, -1.144842, 0, 0, 0, 1, 1,
1.583228, 1.128116, 2.627093, 0, 0, 0, 1, 1,
1.588075, -0.9149052, 3.202106, 0, 0, 0, 1, 1,
1.590104, 0.1810883, 1.420805, 0, 0, 0, 1, 1,
1.597774, -1.558423, 2.848335, 0, 0, 0, 1, 1,
1.601557, 0.8452247, -0.843266, 0, 0, 0, 1, 1,
1.605038, 0.2909893, 1.667442, 1, 1, 1, 1, 1,
1.61517, 0.7660279, 1.947352, 1, 1, 1, 1, 1,
1.624501, -0.07781691, 2.784501, 1, 1, 1, 1, 1,
1.625822, -2.327105, 3.192092, 1, 1, 1, 1, 1,
1.648345, -0.5367581, 3.353511, 1, 1, 1, 1, 1,
1.651436, -1.126045, 0.9786407, 1, 1, 1, 1, 1,
1.656609, 1.810455, 0.3421588, 1, 1, 1, 1, 1,
1.663709, -1.343247, 2.9861, 1, 1, 1, 1, 1,
1.669095, 0.6139222, 1.286867, 1, 1, 1, 1, 1,
1.676999, -0.897527, 2.029468, 1, 1, 1, 1, 1,
1.68274, 0.5304877, 1.641341, 1, 1, 1, 1, 1,
1.685135, 1.499317, 1.126381, 1, 1, 1, 1, 1,
1.691724, -0.3896951, 2.22243, 1, 1, 1, 1, 1,
1.694105, 0.5257201, 1.543425, 1, 1, 1, 1, 1,
1.716009, 0.05793648, 1.147736, 1, 1, 1, 1, 1,
1.733919, -0.7271289, 1.927493, 0, 0, 1, 1, 1,
1.756365, 0.09275924, 0.3021182, 1, 0, 0, 1, 1,
1.758068, 0.2110178, 2.558875, 1, 0, 0, 1, 1,
1.769836, -0.006444949, 2.064712, 1, 0, 0, 1, 1,
1.771814, -0.04937387, 1.818541, 1, 0, 0, 1, 1,
1.774785, 0.08143507, 0.7025989, 1, 0, 0, 1, 1,
1.776354, 0.6422304, 1.838659, 0, 0, 0, 1, 1,
1.793581, -0.7067683, 2.457032, 0, 0, 0, 1, 1,
1.804187, -0.7236736, 1.909047, 0, 0, 0, 1, 1,
1.804828, -1.544184, 2.856313, 0, 0, 0, 1, 1,
1.806115, -0.4119295, 1.729698, 0, 0, 0, 1, 1,
1.807387, -0.3551525, 0.1907498, 0, 0, 0, 1, 1,
1.82587, -0.04540877, 1.221979, 0, 0, 0, 1, 1,
1.828518, 0.8764653, 0.6658064, 1, 1, 1, 1, 1,
1.838721, -0.2299577, 0.9380105, 1, 1, 1, 1, 1,
1.844265, 0.2319394, 0.03144746, 1, 1, 1, 1, 1,
1.858549, 2.106905, -0.04606234, 1, 1, 1, 1, 1,
1.859622, 0.9859994, 2.035957, 1, 1, 1, 1, 1,
1.874179, 1.629496, 2.911784, 1, 1, 1, 1, 1,
1.899627, 2.442298, 0.3568713, 1, 1, 1, 1, 1,
1.906199, 0.2639664, -1.222857, 1, 1, 1, 1, 1,
1.949689, -2.050385, 4.425503, 1, 1, 1, 1, 1,
1.950784, 0.4410005, 2.938614, 1, 1, 1, 1, 1,
1.975485, -0.06448991, 1.252455, 1, 1, 1, 1, 1,
2.003514, 0.5903651, 0.3322673, 1, 1, 1, 1, 1,
2.01193, 0.9008916, 0.5977605, 1, 1, 1, 1, 1,
2.026404, -0.9442772, 1.185892, 1, 1, 1, 1, 1,
2.058707, 0.8440211, 0.6991602, 1, 1, 1, 1, 1,
2.077009, 0.1452515, 1.155087, 0, 0, 1, 1, 1,
2.09907, -1.767843, 2.371057, 1, 0, 0, 1, 1,
2.103009, 0.3684112, 1.320175, 1, 0, 0, 1, 1,
2.129843, -2.076955, 3.089223, 1, 0, 0, 1, 1,
2.179413, -0.06191876, 2.354291, 1, 0, 0, 1, 1,
2.189177, -0.9029788, 1.226268, 1, 0, 0, 1, 1,
2.207834, 1.033766, 0.5071294, 0, 0, 0, 1, 1,
2.221566, -0.3093637, 1.467005, 0, 0, 0, 1, 1,
2.26077, -0.9679274, 2.874135, 0, 0, 0, 1, 1,
2.298894, -0.2379204, 2.153994, 0, 0, 0, 1, 1,
2.361441, 0.4724122, 1.823913, 0, 0, 0, 1, 1,
2.387283, 0.6679689, 2.104686, 0, 0, 0, 1, 1,
2.444475, -2.322682, 3.561453, 0, 0, 0, 1, 1,
2.447734, 0.4811897, 0.8935769, 1, 1, 1, 1, 1,
2.481475, 0.4348833, 1.07733, 1, 1, 1, 1, 1,
2.706527, -0.007470295, 2.78587, 1, 1, 1, 1, 1,
2.769509, 0.7778617, 1.490722, 1, 1, 1, 1, 1,
3.014613, 0.7360932, 3.473169, 1, 1, 1, 1, 1,
3.411013, 0.2548227, 1.949863, 1, 1, 1, 1, 1,
3.652959, -0.4709508, 3.618013, 1, 1, 1, 1, 1
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
var radius = 9.948485;
var distance = 34.94363;
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
mvMatrix.translate( 0.138092, 0.067644, 0.06387591 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.94363);
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