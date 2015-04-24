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
-2.996336, 2.519759, -1.190015, 1, 0, 0, 1,
-2.716669, -0.6997257, -1.601065, 1, 0.007843138, 0, 1,
-2.691484, -0.3905612, -1.282346, 1, 0.01176471, 0, 1,
-2.623645, -1.170999, -0.5552325, 1, 0.01960784, 0, 1,
-2.561854, -1.100867, -3.364155, 1, 0.02352941, 0, 1,
-2.472675, 0.1496629, -0.8846449, 1, 0.03137255, 0, 1,
-2.384674, -0.09689558, -1.126431, 1, 0.03529412, 0, 1,
-2.36097, -0.77082, -0.8587641, 1, 0.04313726, 0, 1,
-2.310615, 0.3210949, -2.190784, 1, 0.04705882, 0, 1,
-2.249102, -0.4873743, -1.007103, 1, 0.05490196, 0, 1,
-2.215318, -0.9175254, -1.678969, 1, 0.05882353, 0, 1,
-2.210749, 0.858977, -1.105598, 1, 0.06666667, 0, 1,
-2.201793, -0.544275, -1.504908, 1, 0.07058824, 0, 1,
-2.198885, -0.09910409, -1.661822, 1, 0.07843138, 0, 1,
-2.195873, -0.2711234, -0.96995, 1, 0.08235294, 0, 1,
-2.186892, 1.435409, -0.8225347, 1, 0.09019608, 0, 1,
-2.173205, -0.5020317, -2.79246, 1, 0.09411765, 0, 1,
-2.127796, -0.1339106, -0.1245271, 1, 0.1019608, 0, 1,
-2.119328, -2.354002, -3.674323, 1, 0.1098039, 0, 1,
-2.072491, 0.5054311, -3.116704, 1, 0.1137255, 0, 1,
-2.063647, 0.7895272, -1.407742, 1, 0.1215686, 0, 1,
-2.06232, -0.2079557, -3.309379, 1, 0.1254902, 0, 1,
-2.057733, 1.010184, -1.359595, 1, 0.1333333, 0, 1,
-2.037674, -1.022673, -0.5669362, 1, 0.1372549, 0, 1,
-2.029431, -2.233315, -2.013899, 1, 0.145098, 0, 1,
-2.023218, 0.6720831, -1.418965, 1, 0.1490196, 0, 1,
-2.010541, 0.5941508, -0.9477731, 1, 0.1568628, 0, 1,
-1.996285, -0.1486663, -0.6193635, 1, 0.1607843, 0, 1,
-1.991535, -0.195458, -2.552272, 1, 0.1686275, 0, 1,
-1.9716, 1.787301, 0.1115747, 1, 0.172549, 0, 1,
-1.966164, 2.008118, -1.070593, 1, 0.1803922, 0, 1,
-1.96358, 1.417976, -2.103794, 1, 0.1843137, 0, 1,
-1.917741, -0.6458973, -3.397586, 1, 0.1921569, 0, 1,
-1.913783, -0.7858605, -2.416498, 1, 0.1960784, 0, 1,
-1.89844, 0.2879001, -1.632888, 1, 0.2039216, 0, 1,
-1.871139, 0.3604789, -2.260812, 1, 0.2117647, 0, 1,
-1.869033, 0.293533, -2.746742, 1, 0.2156863, 0, 1,
-1.841933, 0.4163993, -2.768602, 1, 0.2235294, 0, 1,
-1.821046, -0.94836, -1.468529, 1, 0.227451, 0, 1,
-1.786726, -0.7097479, -2.514699, 1, 0.2352941, 0, 1,
-1.770561, 0.947869, -2.962418, 1, 0.2392157, 0, 1,
-1.759094, 0.8721611, -1.032736, 1, 0.2470588, 0, 1,
-1.756664, -0.2069541, -3.164297, 1, 0.2509804, 0, 1,
-1.739428, -0.6670189, -2.731078, 1, 0.2588235, 0, 1,
-1.737372, 0.3962811, -1.770088, 1, 0.2627451, 0, 1,
-1.7348, 0.5439854, -0.2825256, 1, 0.2705882, 0, 1,
-1.711534, -0.8564672, -0.6763344, 1, 0.2745098, 0, 1,
-1.689255, -0.02919411, -1.043802, 1, 0.282353, 0, 1,
-1.688518, 0.5887413, -1.370947, 1, 0.2862745, 0, 1,
-1.648874, -0.6856758, -2.280663, 1, 0.2941177, 0, 1,
-1.648806, 0.9949584, -1.054872, 1, 0.3019608, 0, 1,
-1.648459, -0.9152033, -1.10492, 1, 0.3058824, 0, 1,
-1.640957, -0.3771573, -1.655554, 1, 0.3137255, 0, 1,
-1.634212, 0.6039537, -0.4054378, 1, 0.3176471, 0, 1,
-1.617108, -1.045547, -0.2499621, 1, 0.3254902, 0, 1,
-1.610727, -1.725516, -2.279548, 1, 0.3294118, 0, 1,
-1.607667, 0.6569934, 0.05630497, 1, 0.3372549, 0, 1,
-1.602546, -0.1642815, -2.959228, 1, 0.3411765, 0, 1,
-1.602042, 0.4731374, -0.8124451, 1, 0.3490196, 0, 1,
-1.594858, -0.2535933, -1.775501, 1, 0.3529412, 0, 1,
-1.588937, -0.2682045, -2.293236, 1, 0.3607843, 0, 1,
-1.58449, 0.3958739, -1.838878, 1, 0.3647059, 0, 1,
-1.574865, -0.4721005, -2.004874, 1, 0.372549, 0, 1,
-1.566465, 1.253199, -1.304783, 1, 0.3764706, 0, 1,
-1.562666, 0.81777, -0.622683, 1, 0.3843137, 0, 1,
-1.558295, -0.1367249, -1.390751, 1, 0.3882353, 0, 1,
-1.555282, 0.2793102, -1.89017, 1, 0.3960784, 0, 1,
-1.544846, 0.2073157, -2.386477, 1, 0.4039216, 0, 1,
-1.544587, -0.6092467, -1.094492, 1, 0.4078431, 0, 1,
-1.526701, -1.605781, -3.20726, 1, 0.4156863, 0, 1,
-1.503961, -0.0367364, -2.388276, 1, 0.4196078, 0, 1,
-1.483936, -1.149271, -3.014232, 1, 0.427451, 0, 1,
-1.483871, -1.002398, -2.281575, 1, 0.4313726, 0, 1,
-1.478004, -2.095642, -3.856648, 1, 0.4392157, 0, 1,
-1.468674, 1.387806, -1.765079, 1, 0.4431373, 0, 1,
-1.468499, -0.9556682, -2.159385, 1, 0.4509804, 0, 1,
-1.468392, -1.074126, -2.171077, 1, 0.454902, 0, 1,
-1.434671, 0.03041167, -2.363266, 1, 0.4627451, 0, 1,
-1.416038, -0.1455934, -3.929423, 1, 0.4666667, 0, 1,
-1.407811, -1.59181, -0.2929778, 1, 0.4745098, 0, 1,
-1.406918, -2.318887, -2.65464, 1, 0.4784314, 0, 1,
-1.396053, 0.03501142, -1.346457, 1, 0.4862745, 0, 1,
-1.388873, -1.012226, -1.65432, 1, 0.4901961, 0, 1,
-1.384069, -0.7229245, -3.062497, 1, 0.4980392, 0, 1,
-1.381549, -1.669311, -2.10064, 1, 0.5058824, 0, 1,
-1.370226, -0.3174725, -0.8194028, 1, 0.509804, 0, 1,
-1.368855, -2.151729, -2.377777, 1, 0.5176471, 0, 1,
-1.360854, 0.01700943, -0.5296462, 1, 0.5215687, 0, 1,
-1.360614, 0.3502679, -1.064288, 1, 0.5294118, 0, 1,
-1.357772, -0.2715908, -2.094451, 1, 0.5333334, 0, 1,
-1.356272, -1.480991, -1.553886, 1, 0.5411765, 0, 1,
-1.345765, 1.277165, 0.3897243, 1, 0.5450981, 0, 1,
-1.344403, 0.5701973, -0.6145405, 1, 0.5529412, 0, 1,
-1.3402, -0.2188401, -1.638648, 1, 0.5568628, 0, 1,
-1.326989, 0.2273082, -1.810308, 1, 0.5647059, 0, 1,
-1.320682, -1.23095, -2.203931, 1, 0.5686275, 0, 1,
-1.319987, 1.827778, -1.368984, 1, 0.5764706, 0, 1,
-1.316829, 1.137066, -1.424341, 1, 0.5803922, 0, 1,
-1.312412, 0.2773498, -3.844981, 1, 0.5882353, 0, 1,
-1.308273, 0.8620042, -1.478599, 1, 0.5921569, 0, 1,
-1.30743, 0.4823879, -0.03571172, 1, 0.6, 0, 1,
-1.292764, -0.6799374, -1.658658, 1, 0.6078432, 0, 1,
-1.275202, -0.2907053, -1.392318, 1, 0.6117647, 0, 1,
-1.270942, 0.158285, -2.290804, 1, 0.6196079, 0, 1,
-1.270248, -0.002378537, -0.8003849, 1, 0.6235294, 0, 1,
-1.270217, 0.336329, -1.353595, 1, 0.6313726, 0, 1,
-1.269822, 0.3076396, -1.637897, 1, 0.6352941, 0, 1,
-1.269221, -2.294878, -0.7158706, 1, 0.6431373, 0, 1,
-1.267827, 0.9543306, -1.957222, 1, 0.6470588, 0, 1,
-1.262034, -0.4288468, -2.44185, 1, 0.654902, 0, 1,
-1.260324, -0.3914146, -3.519488, 1, 0.6588235, 0, 1,
-1.249258, 2.742711, -0.1501676, 1, 0.6666667, 0, 1,
-1.24298, 0.6125196, -1.003537, 1, 0.6705883, 0, 1,
-1.24096, -0.6360617, -0.8068915, 1, 0.6784314, 0, 1,
-1.237555, -0.04659541, -0.578692, 1, 0.682353, 0, 1,
-1.23603, 1.522945, -0.1587295, 1, 0.6901961, 0, 1,
-1.23532, 0.4682325, -1.458584, 1, 0.6941177, 0, 1,
-1.230015, 2.088652, -1.409984, 1, 0.7019608, 0, 1,
-1.229759, 1.32855, -0.5614576, 1, 0.7098039, 0, 1,
-1.223071, -0.8245319, 0.3610168, 1, 0.7137255, 0, 1,
-1.222024, 0.1264992, -1.453784, 1, 0.7215686, 0, 1,
-1.218276, 0.6955252, -1.120005, 1, 0.7254902, 0, 1,
-1.216079, 0.6107867, 0.1003786, 1, 0.7333333, 0, 1,
-1.214409, -1.541863, -4.727626, 1, 0.7372549, 0, 1,
-1.213511, -0.8305821, -1.591583, 1, 0.7450981, 0, 1,
-1.207197, 0.03672019, -1.861476, 1, 0.7490196, 0, 1,
-1.206027, -0.4187315, -0.7796933, 1, 0.7568628, 0, 1,
-1.203375, 0.01117765, -2.489285, 1, 0.7607843, 0, 1,
-1.198764, -1.098704, -1.890567, 1, 0.7686275, 0, 1,
-1.194324, 1.309511, -1.112775, 1, 0.772549, 0, 1,
-1.183415, 0.7850643, 0.02423794, 1, 0.7803922, 0, 1,
-1.181171, 0.01493162, -1.260609, 1, 0.7843137, 0, 1,
-1.174359, -0.3432724, -2.11781, 1, 0.7921569, 0, 1,
-1.17081, -0.2188402, -1.783385, 1, 0.7960784, 0, 1,
-1.168299, -0.2603187, -3.084898, 1, 0.8039216, 0, 1,
-1.147962, -0.7415942, -0.1297223, 1, 0.8117647, 0, 1,
-1.146507, -1.187285, -2.835942, 1, 0.8156863, 0, 1,
-1.145532, -0.5128539, -2.713111, 1, 0.8235294, 0, 1,
-1.145124, -1.309923, -1.999209, 1, 0.827451, 0, 1,
-1.141574, 1.359868, -1.379788, 1, 0.8352941, 0, 1,
-1.141276, -0.7168735, -1.619799, 1, 0.8392157, 0, 1,
-1.140074, 0.06898931, -1.816759, 1, 0.8470588, 0, 1,
-1.132876, 1.364959, 0.4897559, 1, 0.8509804, 0, 1,
-1.114319, 0.9955584, -2.728372, 1, 0.8588235, 0, 1,
-1.088453, -0.0143712, -1.388851, 1, 0.8627451, 0, 1,
-1.083753, 0.9469408, -0.2164969, 1, 0.8705882, 0, 1,
-1.079793, 0.4142711, -0.5904414, 1, 0.8745098, 0, 1,
-1.077651, 0.744954, -2.011759, 1, 0.8823529, 0, 1,
-1.077304, -2.295888, -1.825422, 1, 0.8862745, 0, 1,
-1.070477, 1.726997, -0.9156143, 1, 0.8941177, 0, 1,
-1.069681, -1.900946, -2.238891, 1, 0.8980392, 0, 1,
-1.066624, 0.2605058, -1.915136, 1, 0.9058824, 0, 1,
-1.063896, 0.03760493, -3.162868, 1, 0.9137255, 0, 1,
-1.062853, -0.6269247, -3.106657, 1, 0.9176471, 0, 1,
-1.06256, 2.986617, -0.4639631, 1, 0.9254902, 0, 1,
-1.051331, 0.7651694, -1.85327, 1, 0.9294118, 0, 1,
-1.049185, 0.2343285, -0.1630401, 1, 0.9372549, 0, 1,
-1.04683, -0.1889448, -2.268793, 1, 0.9411765, 0, 1,
-1.042174, 0.7014889, -1.168767, 1, 0.9490196, 0, 1,
-1.040619, -2.552456, -2.996442, 1, 0.9529412, 0, 1,
-1.032116, -0.3513399, -2.673074, 1, 0.9607843, 0, 1,
-1.029942, 0.7649689, -1.003589, 1, 0.9647059, 0, 1,
-1.02841, -1.302046, -1.321181, 1, 0.972549, 0, 1,
-1.025895, 0.6094577, -1.695755, 1, 0.9764706, 0, 1,
-1.024946, 0.6648064, -2.6295, 1, 0.9843137, 0, 1,
-1.022636, -2.241816, -2.795451, 1, 0.9882353, 0, 1,
-1.011096, 1.017876, -0.5547503, 1, 0.9960784, 0, 1,
-1.00705, 1.184572, -1.351219, 0.9960784, 1, 0, 1,
-1.006982, -0.8375568, -1.669625, 0.9921569, 1, 0, 1,
-1.004792, 1.516088, 0.9351143, 0.9843137, 1, 0, 1,
-1.004236, 0.1119266, -0.2184971, 0.9803922, 1, 0, 1,
-1.004166, 0.547394, -1.103248, 0.972549, 1, 0, 1,
-0.9986987, -0.695008, -2.578436, 0.9686275, 1, 0, 1,
-0.9926199, -0.08041795, -2.56159, 0.9607843, 1, 0, 1,
-0.9919183, 1.528966, 1.287615, 0.9568627, 1, 0, 1,
-0.9910466, -1.091389, -3.890197, 0.9490196, 1, 0, 1,
-0.9896349, 0.4101305, -1.077217, 0.945098, 1, 0, 1,
-0.9829456, 1.158783, -0.5707961, 0.9372549, 1, 0, 1,
-0.9827722, -0.5087607, -1.926781, 0.9333333, 1, 0, 1,
-0.9820385, 0.4035345, -0.7106888, 0.9254902, 1, 0, 1,
-0.9783589, 0.1520288, -2.764243, 0.9215686, 1, 0, 1,
-0.9689255, 1.333222, 0.9932483, 0.9137255, 1, 0, 1,
-0.9670715, -0.06889272, -2.081215, 0.9098039, 1, 0, 1,
-0.966133, 0.2804094, -1.647751, 0.9019608, 1, 0, 1,
-0.9589264, 1.020039, -0.02093996, 0.8941177, 1, 0, 1,
-0.9528825, -0.7896783, -2.32147, 0.8901961, 1, 0, 1,
-0.9513363, 1.686037, -1.558106, 0.8823529, 1, 0, 1,
-0.9386241, 0.1157061, -2.28886, 0.8784314, 1, 0, 1,
-0.9329397, 0.482981, -0.6729088, 0.8705882, 1, 0, 1,
-0.9310412, 1.289, -0.7211103, 0.8666667, 1, 0, 1,
-0.9309309, 0.265216, -1.55237, 0.8588235, 1, 0, 1,
-0.9228997, -0.6325215, -0.7490656, 0.854902, 1, 0, 1,
-0.9151558, -0.4502699, -2.147127, 0.8470588, 1, 0, 1,
-0.9147286, 0.6050804, -1.349857, 0.8431373, 1, 0, 1,
-0.8984985, -0.5302565, -1.973869, 0.8352941, 1, 0, 1,
-0.8851584, 0.4642165, -1.203954, 0.8313726, 1, 0, 1,
-0.8833697, -1.668341, -3.842894, 0.8235294, 1, 0, 1,
-0.8823569, 0.08352238, -1.005091, 0.8196079, 1, 0, 1,
-0.8813937, -0.4454923, -3.510118, 0.8117647, 1, 0, 1,
-0.8779681, -0.05943336, -0.723592, 0.8078431, 1, 0, 1,
-0.8740534, -0.9593884, -5.048462, 0.8, 1, 0, 1,
-0.8711693, 0.8011168, -1.153506, 0.7921569, 1, 0, 1,
-0.8694842, 0.9503976, 0.3380414, 0.7882353, 1, 0, 1,
-0.8693931, 1.40705, -0.6248601, 0.7803922, 1, 0, 1,
-0.8657281, -1.840931, -3.922377, 0.7764706, 1, 0, 1,
-0.8633959, 0.87075, -0.6840608, 0.7686275, 1, 0, 1,
-0.8616925, 2.555521, 0.4653067, 0.7647059, 1, 0, 1,
-0.8615129, 1.325677, -1.292788, 0.7568628, 1, 0, 1,
-0.8548371, -0.8965924, -3.616734, 0.7529412, 1, 0, 1,
-0.8520693, 1.164509, -1.249217, 0.7450981, 1, 0, 1,
-0.8498623, 0.789968, 1.405565, 0.7411765, 1, 0, 1,
-0.8471196, 0.8487988, -2.907519, 0.7333333, 1, 0, 1,
-0.8434264, -0.2459204, -3.718747, 0.7294118, 1, 0, 1,
-0.8404124, 0.6548486, -1.664939, 0.7215686, 1, 0, 1,
-0.8382466, 1.035849, 0.05658814, 0.7176471, 1, 0, 1,
-0.8342468, 1.421259, -0.3755521, 0.7098039, 1, 0, 1,
-0.8335181, 0.280219, -1.582605, 0.7058824, 1, 0, 1,
-0.8260262, -0.8783044, -3.10384, 0.6980392, 1, 0, 1,
-0.8253509, -2.151154, -1.009329, 0.6901961, 1, 0, 1,
-0.8195494, 1.648865, -1.0076, 0.6862745, 1, 0, 1,
-0.8164464, 0.9854758, -0.1203515, 0.6784314, 1, 0, 1,
-0.809079, 0.7191791, -2.028706, 0.6745098, 1, 0, 1,
-0.8012153, -1.269019, -3.400477, 0.6666667, 1, 0, 1,
-0.7996578, 0.7214698, -0.1802884, 0.6627451, 1, 0, 1,
-0.7910619, 0.01267211, -1.025473, 0.654902, 1, 0, 1,
-0.7868738, -1.112646, -4.241273, 0.6509804, 1, 0, 1,
-0.7821063, -0.3405001, -1.818138, 0.6431373, 1, 0, 1,
-0.7790571, 1.093671, -1.997318, 0.6392157, 1, 0, 1,
-0.7772628, -1.831169, -1.717764, 0.6313726, 1, 0, 1,
-0.7748136, -0.8526458, -1.091471, 0.627451, 1, 0, 1,
-0.7741006, 0.541206, 0.06380356, 0.6196079, 1, 0, 1,
-0.7688763, -0.5989056, -1.775501, 0.6156863, 1, 0, 1,
-0.7672808, -1.581825, -1.06074, 0.6078432, 1, 0, 1,
-0.7653866, -0.530434, -1.811213, 0.6039216, 1, 0, 1,
-0.764701, -0.6580787, -2.374804, 0.5960785, 1, 0, 1,
-0.7630078, -0.9853507, -1.410295, 0.5882353, 1, 0, 1,
-0.7618824, -2.259188, -2.382201, 0.5843138, 1, 0, 1,
-0.7607865, -0.3222104, -1.072829, 0.5764706, 1, 0, 1,
-0.7523779, -1.105502, -2.528099, 0.572549, 1, 0, 1,
-0.744759, 0.3384675, -1.109531, 0.5647059, 1, 0, 1,
-0.7424852, 0.1643584, -0.8902795, 0.5607843, 1, 0, 1,
-0.7424084, -0.5383703, -2.887666, 0.5529412, 1, 0, 1,
-0.7412526, -0.5663181, -2.686367, 0.5490196, 1, 0, 1,
-0.739481, -0.3124965, -0.93249, 0.5411765, 1, 0, 1,
-0.732466, -0.322029, -4.071971, 0.5372549, 1, 0, 1,
-0.7318937, 0.2834328, -0.7662693, 0.5294118, 1, 0, 1,
-0.7303463, -0.8313453, -1.285957, 0.5254902, 1, 0, 1,
-0.72898, -0.4127695, -2.433758, 0.5176471, 1, 0, 1,
-0.7264359, -0.4784614, -1.145883, 0.5137255, 1, 0, 1,
-0.7260733, -1.466308, -2.025274, 0.5058824, 1, 0, 1,
-0.7229921, 0.769086, -1.332071, 0.5019608, 1, 0, 1,
-0.7192904, -1.19549, -3.027755, 0.4941176, 1, 0, 1,
-0.7155909, 1.054254, 1.309667, 0.4862745, 1, 0, 1,
-0.713986, 1.269143, -1.008406, 0.4823529, 1, 0, 1,
-0.7061186, -0.1858542, -0.3446152, 0.4745098, 1, 0, 1,
-0.7025451, 0.9943364, 0.1847969, 0.4705882, 1, 0, 1,
-0.694558, -0.6500524, -2.569058, 0.4627451, 1, 0, 1,
-0.6778063, 0.4468332, -1.172528, 0.4588235, 1, 0, 1,
-0.6768956, -0.8656467, -1.854523, 0.4509804, 1, 0, 1,
-0.6715918, -1.326742, -3.674193, 0.4470588, 1, 0, 1,
-0.6698124, 0.2810169, -2.692569, 0.4392157, 1, 0, 1,
-0.6675078, -1.172779, -3.321656, 0.4352941, 1, 0, 1,
-0.6651993, 0.1312451, -2.703248, 0.427451, 1, 0, 1,
-0.66421, 0.4393241, -0.1039089, 0.4235294, 1, 0, 1,
-0.6621279, -0.5200073, -2.584569, 0.4156863, 1, 0, 1,
-0.6615921, 1.236079, -0.5736352, 0.4117647, 1, 0, 1,
-0.6555375, -0.8936397, -5.362983, 0.4039216, 1, 0, 1,
-0.6550395, 1.151173, -0.8280182, 0.3960784, 1, 0, 1,
-0.6512697, -0.8803768, -1.671377, 0.3921569, 1, 0, 1,
-0.6499887, -0.2711927, -1.207062, 0.3843137, 1, 0, 1,
-0.6477925, 0.08131861, -2.292567, 0.3803922, 1, 0, 1,
-0.6445332, -0.9502723, -1.755889, 0.372549, 1, 0, 1,
-0.6418323, 0.1501446, -1.641245, 0.3686275, 1, 0, 1,
-0.6398472, -0.08787639, -1.532306, 0.3607843, 1, 0, 1,
-0.6394293, 0.4472208, -1.025355, 0.3568628, 1, 0, 1,
-0.6389362, 0.614108, -0.9956582, 0.3490196, 1, 0, 1,
-0.6351668, 0.3091446, -1.024347, 0.345098, 1, 0, 1,
-0.6345525, 0.3445148, -0.9007222, 0.3372549, 1, 0, 1,
-0.6284571, -0.4141066, -1.515343, 0.3333333, 1, 0, 1,
-0.6247433, 0.2169335, -0.7124258, 0.3254902, 1, 0, 1,
-0.6155702, 0.09395096, -0.1356292, 0.3215686, 1, 0, 1,
-0.6151261, -0.7541982, -0.8348461, 0.3137255, 1, 0, 1,
-0.6138233, -0.06706072, -2.769227, 0.3098039, 1, 0, 1,
-0.6119041, -1.051684, -2.801167, 0.3019608, 1, 0, 1,
-0.6061443, 0.07449103, -0.9905801, 0.2941177, 1, 0, 1,
-0.6060638, -0.9740617, -2.523554, 0.2901961, 1, 0, 1,
-0.6059603, 1.216155, -0.2786035, 0.282353, 1, 0, 1,
-0.5989368, 1.079066, -0.9544013, 0.2784314, 1, 0, 1,
-0.5969328, -0.5328054, -1.531068, 0.2705882, 1, 0, 1,
-0.5965314, 1.502133, -0.8470507, 0.2666667, 1, 0, 1,
-0.5945972, -0.1191812, 0.2722194, 0.2588235, 1, 0, 1,
-0.5945031, 1.798254, 0.8483217, 0.254902, 1, 0, 1,
-0.5863438, 1.916264, -1.483841, 0.2470588, 1, 0, 1,
-0.5837154, 1.854113, 0.8903612, 0.2431373, 1, 0, 1,
-0.5835742, 0.2502277, -0.01514274, 0.2352941, 1, 0, 1,
-0.5803903, 0.3514958, 0.03278792, 0.2313726, 1, 0, 1,
-0.5777919, 2.279296, 0.3341586, 0.2235294, 1, 0, 1,
-0.573483, 1.804531, 0.6748068, 0.2196078, 1, 0, 1,
-0.5669556, 0.4625538, -1.2593, 0.2117647, 1, 0, 1,
-0.5637871, -1.437502, -3.610478, 0.2078431, 1, 0, 1,
-0.5620884, 0.08114466, 0.001128173, 0.2, 1, 0, 1,
-0.5613844, 1.174691, -2.854411, 0.1921569, 1, 0, 1,
-0.5597149, -0.07816627, -3.410082, 0.1882353, 1, 0, 1,
-0.544029, 0.03394099, -0.9410742, 0.1803922, 1, 0, 1,
-0.5419735, 0.4993829, -0.3899023, 0.1764706, 1, 0, 1,
-0.5417644, -0.7967163, -3.030444, 0.1686275, 1, 0, 1,
-0.5361613, 0.8607886, 1.826838, 0.1647059, 1, 0, 1,
-0.5307162, 1.336663, -0.009606117, 0.1568628, 1, 0, 1,
-0.5284447, 1.54106, -0.02698107, 0.1529412, 1, 0, 1,
-0.5274671, -0.7582393, -4.102135, 0.145098, 1, 0, 1,
-0.5272075, 0.7658881, -2.249537, 0.1411765, 1, 0, 1,
-0.5262367, 1.087695, -0.4637302, 0.1333333, 1, 0, 1,
-0.5226609, 0.3701562, -1.174429, 0.1294118, 1, 0, 1,
-0.5210379, -0.2777692, -1.405579, 0.1215686, 1, 0, 1,
-0.5174013, 0.2903573, -2.24584, 0.1176471, 1, 0, 1,
-0.5165252, -1.342822, -2.841824, 0.1098039, 1, 0, 1,
-0.5146269, 0.5101122, -1.198377, 0.1058824, 1, 0, 1,
-0.5099324, 0.5694847, -0.9336981, 0.09803922, 1, 0, 1,
-0.5044447, -0.5385275, -1.715255, 0.09019608, 1, 0, 1,
-0.5029443, 0.9779007, 1.696596, 0.08627451, 1, 0, 1,
-0.4961966, -1.340372, -2.224169, 0.07843138, 1, 0, 1,
-0.4947205, 0.04019911, -2.024477, 0.07450981, 1, 0, 1,
-0.4837817, 0.8335363, -1.613474, 0.06666667, 1, 0, 1,
-0.4798321, 0.2548976, -0.7518466, 0.0627451, 1, 0, 1,
-0.4775346, -1.185974, -3.116032, 0.05490196, 1, 0, 1,
-0.4692608, -0.6573807, -1.842491, 0.05098039, 1, 0, 1,
-0.4597108, 0.3156414, -1.009843, 0.04313726, 1, 0, 1,
-0.4587093, -0.2624823, -2.37552, 0.03921569, 1, 0, 1,
-0.4560152, -0.8228897, -3.635408, 0.03137255, 1, 0, 1,
-0.4559188, 0.6328233, -0.5541376, 0.02745098, 1, 0, 1,
-0.4539587, -0.3312006, -2.884954, 0.01960784, 1, 0, 1,
-0.4529928, 0.3871589, -0.8879748, 0.01568628, 1, 0, 1,
-0.4496141, -0.1207136, -3.941013, 0.007843138, 1, 0, 1,
-0.4477948, -0.04808276, -2.738782, 0.003921569, 1, 0, 1,
-0.4467069, -0.1201658, -1.06041, 0, 1, 0.003921569, 1,
-0.4424425, -0.8844872, -2.115547, 0, 1, 0.01176471, 1,
-0.4381307, 0.05908183, -1.945228, 0, 1, 0.01568628, 1,
-0.4374668, 0.4321238, -0.3263743, 0, 1, 0.02352941, 1,
-0.4364941, -0.03380251, -2.533422, 0, 1, 0.02745098, 1,
-0.4352717, -0.7195576, -1.844042, 0, 1, 0.03529412, 1,
-0.4303858, 1.079561, -0.4008766, 0, 1, 0.03921569, 1,
-0.424994, 0.6903274, -1.311341, 0, 1, 0.04705882, 1,
-0.4173393, -0.3548488, -2.445555, 0, 1, 0.05098039, 1,
-0.4166034, -1.093826, -1.614512, 0, 1, 0.05882353, 1,
-0.4156439, 1.616315, -1.404564, 0, 1, 0.0627451, 1,
-0.4135388, 0.08471987, -2.878227, 0, 1, 0.07058824, 1,
-0.4132328, 0.10465, -1.747192, 0, 1, 0.07450981, 1,
-0.4103568, 0.2672371, 1.073225, 0, 1, 0.08235294, 1,
-0.4096104, -0.2507683, -3.155455, 0, 1, 0.08627451, 1,
-0.4075316, 1.04838, -0.9298757, 0, 1, 0.09411765, 1,
-0.4063955, 0.3920672, -1.168399, 0, 1, 0.1019608, 1,
-0.404059, 1.897699, 0.5977234, 0, 1, 0.1058824, 1,
-0.3994093, 0.8750899, -0.9493986, 0, 1, 0.1137255, 1,
-0.3974626, -0.3988772, -2.836207, 0, 1, 0.1176471, 1,
-0.3971671, -0.6729046, -3.420734, 0, 1, 0.1254902, 1,
-0.3948533, -2.151925, -3.986624, 0, 1, 0.1294118, 1,
-0.3923607, -1.002745, -4.1764, 0, 1, 0.1372549, 1,
-0.3916931, -0.1980621, -3.036411, 0, 1, 0.1411765, 1,
-0.3871424, 0.6171215, 0.5159611, 0, 1, 0.1490196, 1,
-0.3869638, 2.088385, 0.05703636, 0, 1, 0.1529412, 1,
-0.385886, 0.3293957, 0.5552087, 0, 1, 0.1607843, 1,
-0.3826349, -1.799646, -2.154294, 0, 1, 0.1647059, 1,
-0.3812906, -0.02657429, -3.059734, 0, 1, 0.172549, 1,
-0.3793197, 0.6055334, -2.696764, 0, 1, 0.1764706, 1,
-0.3792455, 0.006687264, -0.3595932, 0, 1, 0.1843137, 1,
-0.3778923, 0.6791914, -1.680261, 0, 1, 0.1882353, 1,
-0.37776, 0.7293595, -1.135633, 0, 1, 0.1960784, 1,
-0.3763189, -0.04691012, -3.559199, 0, 1, 0.2039216, 1,
-0.3754433, 0.9861869, -0.3721544, 0, 1, 0.2078431, 1,
-0.373558, 0.1560113, -1.096554, 0, 1, 0.2156863, 1,
-0.3734364, 1.235616, -1.632016, 0, 1, 0.2196078, 1,
-0.363949, -1.921698, -3.942967, 0, 1, 0.227451, 1,
-0.3579034, 0.1788333, -0.1492373, 0, 1, 0.2313726, 1,
-0.3572291, 0.6258537, -0.6424947, 0, 1, 0.2392157, 1,
-0.3532934, -1.965719, -3.550949, 0, 1, 0.2431373, 1,
-0.3485779, 0.02057646, -1.881821, 0, 1, 0.2509804, 1,
-0.3464908, -0.5190843, -1.492469, 0, 1, 0.254902, 1,
-0.342277, -0.7944149, -3.336193, 0, 1, 0.2627451, 1,
-0.3407452, -1.653028, -2.932259, 0, 1, 0.2666667, 1,
-0.3356516, 0.3264872, -0.3623436, 0, 1, 0.2745098, 1,
-0.334843, 1.001098, -0.7222431, 0, 1, 0.2784314, 1,
-0.3323217, 0.0144725, -2.125411, 0, 1, 0.2862745, 1,
-0.3314134, -1.339334, -2.163211, 0, 1, 0.2901961, 1,
-0.3298015, 0.3660461, -0.4642819, 0, 1, 0.2980392, 1,
-0.3296325, -0.5104194, -2.889258, 0, 1, 0.3058824, 1,
-0.3294071, 1.280364, 0.5204124, 0, 1, 0.3098039, 1,
-0.3292967, 0.1613935, -0.8516842, 0, 1, 0.3176471, 1,
-0.3233252, 1.232197, -0.1095626, 0, 1, 0.3215686, 1,
-0.3196079, 0.8931049, -0.1226128, 0, 1, 0.3294118, 1,
-0.3153358, -0.6690199, -4.537334, 0, 1, 0.3333333, 1,
-0.3150772, 1.761757, 0.5944309, 0, 1, 0.3411765, 1,
-0.308859, -0.4027987, -2.676384, 0, 1, 0.345098, 1,
-0.3067642, 1.94291, -1.441795, 0, 1, 0.3529412, 1,
-0.3063092, -0.7364563, -3.025487, 0, 1, 0.3568628, 1,
-0.3061604, 0.7093713, -1.262297, 0, 1, 0.3647059, 1,
-0.3053976, 0.9136989, -0.2114384, 0, 1, 0.3686275, 1,
-0.3052532, 1.055354, -0.8580441, 0, 1, 0.3764706, 1,
-0.2990157, -1.795201, -2.030365, 0, 1, 0.3803922, 1,
-0.2965614, -0.7826785, -1.716266, 0, 1, 0.3882353, 1,
-0.2952489, -0.8647269, -2.245238, 0, 1, 0.3921569, 1,
-0.2937187, -0.4539855, -2.710966, 0, 1, 0.4, 1,
-0.2903715, 1.827898, 0.7499382, 0, 1, 0.4078431, 1,
-0.2889792, -1.445525, -4.615277, 0, 1, 0.4117647, 1,
-0.285092, 0.2422832, -0.5181908, 0, 1, 0.4196078, 1,
-0.2839538, -0.5110809, -2.29045, 0, 1, 0.4235294, 1,
-0.2826793, -1.234855, -2.551798, 0, 1, 0.4313726, 1,
-0.2792252, -0.3967505, -3.238562, 0, 1, 0.4352941, 1,
-0.2742585, 0.08564699, -0.18394, 0, 1, 0.4431373, 1,
-0.2738664, -0.09311879, -1.883401, 0, 1, 0.4470588, 1,
-0.2737901, 0.221834, -2.457903, 0, 1, 0.454902, 1,
-0.26697, 1.2183, 0.4185119, 0, 1, 0.4588235, 1,
-0.2572616, -0.337209, -3.694535, 0, 1, 0.4666667, 1,
-0.2545851, -0.02855493, -3.957342, 0, 1, 0.4705882, 1,
-0.2544514, -0.9646181, -3.739794, 0, 1, 0.4784314, 1,
-0.243433, 0.1867363, 1.153839, 0, 1, 0.4823529, 1,
-0.2412078, -0.0116237, 0.7877254, 0, 1, 0.4901961, 1,
-0.2373794, -0.4924333, -2.666083, 0, 1, 0.4941176, 1,
-0.2347145, -1.588762, -3.638408, 0, 1, 0.5019608, 1,
-0.2301606, -1.052852, -3.752106, 0, 1, 0.509804, 1,
-0.2280834, -0.9938723, -1.533228, 0, 1, 0.5137255, 1,
-0.2258687, -0.6357067, -3.998296, 0, 1, 0.5215687, 1,
-0.225338, 2.003083, 1.383131, 0, 1, 0.5254902, 1,
-0.2222103, -0.8490862, -3.865543, 0, 1, 0.5333334, 1,
-0.2212188, -1.642774, -3.366921, 0, 1, 0.5372549, 1,
-0.2205584, -1.846557, -1.646521, 0, 1, 0.5450981, 1,
-0.2117575, 0.563473, -0.9985479, 0, 1, 0.5490196, 1,
-0.2103796, -0.4590287, -3.211904, 0, 1, 0.5568628, 1,
-0.209535, -0.04995645, -0.1336061, 0, 1, 0.5607843, 1,
-0.2089335, -2.610013, -3.063305, 0, 1, 0.5686275, 1,
-0.2086659, 0.8082626, 0.4176734, 0, 1, 0.572549, 1,
-0.2046832, -2.268393, -2.987852, 0, 1, 0.5803922, 1,
-0.2039604, -1.972075, -3.912264, 0, 1, 0.5843138, 1,
-0.2031631, -0.2072314, -1.240801, 0, 1, 0.5921569, 1,
-0.2007428, -0.3296035, -3.02646, 0, 1, 0.5960785, 1,
-0.1961101, -2.009763, -2.731263, 0, 1, 0.6039216, 1,
-0.1960408, 0.7844147, 0.007534091, 0, 1, 0.6117647, 1,
-0.1956817, -1.498034, -3.794664, 0, 1, 0.6156863, 1,
-0.1945478, 0.3325091, -0.659384, 0, 1, 0.6235294, 1,
-0.1938502, 0.4522043, 0.4144114, 0, 1, 0.627451, 1,
-0.1927353, 0.1326869, 0.03656321, 0, 1, 0.6352941, 1,
-0.1875225, -0.9984407, -2.501383, 0, 1, 0.6392157, 1,
-0.1839231, 0.6214017, 1.642897, 0, 1, 0.6470588, 1,
-0.1838783, 0.8852852, -0.2597998, 0, 1, 0.6509804, 1,
-0.1824716, 1.410142, 0.9509796, 0, 1, 0.6588235, 1,
-0.1797732, 0.04616122, -2.343329, 0, 1, 0.6627451, 1,
-0.1722038, 0.1125805, -2.327058, 0, 1, 0.6705883, 1,
-0.1650113, -2.305201, -4.773499, 0, 1, 0.6745098, 1,
-0.1610773, 1.119518, 1.285406, 0, 1, 0.682353, 1,
-0.1577969, 0.1034945, 0.1163427, 0, 1, 0.6862745, 1,
-0.1565314, -0.5171518, -3.150246, 0, 1, 0.6941177, 1,
-0.1471529, -0.2044967, -2.883481, 0, 1, 0.7019608, 1,
-0.1448648, 0.9853909, 0.3448794, 0, 1, 0.7058824, 1,
-0.1417528, 1.224806, -2.375732, 0, 1, 0.7137255, 1,
-0.1378043, -0.8508801, -3.856843, 0, 1, 0.7176471, 1,
-0.1367353, -0.5337262, -3.138168, 0, 1, 0.7254902, 1,
-0.1366504, 0.6015808, 0.4464658, 0, 1, 0.7294118, 1,
-0.1357709, -0.7074146, -2.957462, 0, 1, 0.7372549, 1,
-0.1350489, -1.161047, -4.451474, 0, 1, 0.7411765, 1,
-0.1343619, 0.8326474, -1.550193, 0, 1, 0.7490196, 1,
-0.1343464, -0.2320807, -2.682305, 0, 1, 0.7529412, 1,
-0.1281733, 1.685139, 0.2069319, 0, 1, 0.7607843, 1,
-0.1235629, -0.09230925, 0.5740173, 0, 1, 0.7647059, 1,
-0.1220936, -0.7610344, -2.794065, 0, 1, 0.772549, 1,
-0.1210912, -1.084546, -2.851416, 0, 1, 0.7764706, 1,
-0.1200526, 0.5964578, 0.3597451, 0, 1, 0.7843137, 1,
-0.1180087, -0.1365178, -1.983221, 0, 1, 0.7882353, 1,
-0.1138896, -0.4377806, -3.071248, 0, 1, 0.7960784, 1,
-0.1137796, -0.2196745, -4.186621, 0, 1, 0.8039216, 1,
-0.1131339, -0.1178218, -3.401549, 0, 1, 0.8078431, 1,
-0.1123645, 0.5610523, 0.806225, 0, 1, 0.8156863, 1,
-0.1095904, 0.5821307, -1.697059, 0, 1, 0.8196079, 1,
-0.1079882, -0.4439519, -0.7533131, 0, 1, 0.827451, 1,
-0.1057224, -1.923214, -3.421546, 0, 1, 0.8313726, 1,
-0.10562, 1.230545, 0.9496104, 0, 1, 0.8392157, 1,
-0.09588405, 0.1065652, -0.04156621, 0, 1, 0.8431373, 1,
-0.09265018, 0.5000147, 1.272132, 0, 1, 0.8509804, 1,
-0.09105711, 0.7763839, 0.2774401, 0, 1, 0.854902, 1,
-0.09045358, 0.04611581, -1.126617, 0, 1, 0.8627451, 1,
-0.08835035, 0.6914799, 0.6400625, 0, 1, 0.8666667, 1,
-0.08812757, -0.5284279, -3.086128, 0, 1, 0.8745098, 1,
-0.08802424, 1.080129, -0.1435674, 0, 1, 0.8784314, 1,
-0.08776905, -1.713414, -2.624752, 0, 1, 0.8862745, 1,
-0.08264722, 0.2408709, -1.527475, 0, 1, 0.8901961, 1,
-0.07983708, -0.3628496, -2.05339, 0, 1, 0.8980392, 1,
-0.0788005, 1.365503, 0.03231991, 0, 1, 0.9058824, 1,
-0.07747202, -0.7070355, -3.083061, 0, 1, 0.9098039, 1,
-0.07651206, 1.075546, -0.15786, 0, 1, 0.9176471, 1,
-0.07411397, 0.7375068, -0.9240845, 0, 1, 0.9215686, 1,
-0.07410154, -0.1828448, -2.304737, 0, 1, 0.9294118, 1,
-0.07403407, -0.9029292, -3.709333, 0, 1, 0.9333333, 1,
-0.07049546, -0.3279841, -2.364276, 0, 1, 0.9411765, 1,
-0.06975332, -0.9127583, -1.994825, 0, 1, 0.945098, 1,
-0.06647048, 0.8003647, -1.582412, 0, 1, 0.9529412, 1,
-0.06060073, -0.1641402, -2.781823, 0, 1, 0.9568627, 1,
-0.05549772, 1.194941, 0.4845066, 0, 1, 0.9647059, 1,
-0.05070981, -0.07465217, -2.734699, 0, 1, 0.9686275, 1,
-0.04648697, 0.9105442, -0.4168175, 0, 1, 0.9764706, 1,
-0.04526338, 0.6539471, 0.2059142, 0, 1, 0.9803922, 1,
-0.04186661, -0.3520178, -3.118675, 0, 1, 0.9882353, 1,
-0.03994339, 0.2549474, -0.3537761, 0, 1, 0.9921569, 1,
-0.03932202, 2.196635, -0.1089615, 0, 1, 1, 1,
-0.03888775, -0.3152999, -2.570298, 0, 0.9921569, 1, 1,
-0.03800789, -1.347533, -5.057034, 0, 0.9882353, 1, 1,
-0.03353718, 0.3039157, 0.2288945, 0, 0.9803922, 1, 1,
-0.03295916, 0.638692, 0.98298, 0, 0.9764706, 1, 1,
-0.0320904, 1.700979, 1.427964, 0, 0.9686275, 1, 1,
-0.03088212, -0.8429468, -2.770331, 0, 0.9647059, 1, 1,
-0.02978353, -0.5543661, -3.091375, 0, 0.9568627, 1, 1,
-0.02964103, -0.9313222, -3.483936, 0, 0.9529412, 1, 1,
-0.02895018, -0.196532, -1.653361, 0, 0.945098, 1, 1,
-0.02848306, -0.05258377, -3.856731, 0, 0.9411765, 1, 1,
-0.02801701, -1.441126, -4.138011, 0, 0.9333333, 1, 1,
-0.02623931, 1.435366, 0.2670274, 0, 0.9294118, 1, 1,
-0.02600545, 1.947636, 0.4163414, 0, 0.9215686, 1, 1,
-0.02445451, 0.3267425, 1.087608, 0, 0.9176471, 1, 1,
-0.02064938, 0.7148969, -0.2322914, 0, 0.9098039, 1, 1,
-0.01461404, 0.3802657, 1.032908, 0, 0.9058824, 1, 1,
0.001200324, -0.4707, 1.851062, 0, 0.8980392, 1, 1,
0.005494621, -1.069581, 3.042715, 0, 0.8901961, 1, 1,
0.00704765, 0.3708683, 0.9434195, 0, 0.8862745, 1, 1,
0.01348727, -0.8800151, 1.422802, 0, 0.8784314, 1, 1,
0.0134926, 1.341912, 0.4421411, 0, 0.8745098, 1, 1,
0.01423798, 1.318684, 0.8626432, 0, 0.8666667, 1, 1,
0.01519495, 0.9406492, -0.6196401, 0, 0.8627451, 1, 1,
0.02141968, -0.2209366, 3.499867, 0, 0.854902, 1, 1,
0.02177499, -0.5995586, 5.136782, 0, 0.8509804, 1, 1,
0.02434484, -0.5508018, 2.283066, 0, 0.8431373, 1, 1,
0.02551067, 2.000746, -0.3070987, 0, 0.8392157, 1, 1,
0.0269078, 0.9497864, -0.3392211, 0, 0.8313726, 1, 1,
0.02772759, -0.5149829, 2.785458, 0, 0.827451, 1, 1,
0.04364011, -0.8544813, 1.885878, 0, 0.8196079, 1, 1,
0.04499688, 1.833682, -0.3319229, 0, 0.8156863, 1, 1,
0.04858523, 0.2798622, -0.3773107, 0, 0.8078431, 1, 1,
0.05042768, -0.717611, 4.42476, 0, 0.8039216, 1, 1,
0.05169006, 0.3089261, -0.9302083, 0, 0.7960784, 1, 1,
0.05418656, -0.1045993, 1.796354, 0, 0.7882353, 1, 1,
0.05874195, -0.7338371, 5.116699, 0, 0.7843137, 1, 1,
0.06302438, 0.2475786, -0.1571316, 0, 0.7764706, 1, 1,
0.06307513, 1.64042, -1.797302, 0, 0.772549, 1, 1,
0.06329945, -0.8571417, 4.012598, 0, 0.7647059, 1, 1,
0.06607991, -1.29992, 2.658515, 0, 0.7607843, 1, 1,
0.06711996, -1.388712, 2.811082, 0, 0.7529412, 1, 1,
0.07078524, -1.105192, 3.574132, 0, 0.7490196, 1, 1,
0.07188541, 0.4080651, -0.5099019, 0, 0.7411765, 1, 1,
0.07240868, 0.9812857, -2.35084, 0, 0.7372549, 1, 1,
0.07597032, 1.612996, -1.574677, 0, 0.7294118, 1, 1,
0.07786714, 1.146653, -1.437307, 0, 0.7254902, 1, 1,
0.07949082, 0.005718781, 2.042945, 0, 0.7176471, 1, 1,
0.08018148, -0.2204236, 3.89761, 0, 0.7137255, 1, 1,
0.08039681, 1.274228, -1.499437, 0, 0.7058824, 1, 1,
0.08538024, 0.2427292, 0.05926831, 0, 0.6980392, 1, 1,
0.08543501, 0.9318273, -0.2094972, 0, 0.6941177, 1, 1,
0.09045295, -0.3040131, 2.220564, 0, 0.6862745, 1, 1,
0.09055287, 1.101911, 0.01808953, 0, 0.682353, 1, 1,
0.09438537, 1.099064, -0.3108603, 0, 0.6745098, 1, 1,
0.09473895, -1.134741, 3.59531, 0, 0.6705883, 1, 1,
0.09711274, -1.683091, 2.491394, 0, 0.6627451, 1, 1,
0.1017225, 0.4020866, 1.347753, 0, 0.6588235, 1, 1,
0.1018833, 0.7959064, -0.3250529, 0, 0.6509804, 1, 1,
0.1027618, -1.02727, 3.38929, 0, 0.6470588, 1, 1,
0.1035759, -0.9849223, 3.568773, 0, 0.6392157, 1, 1,
0.1076289, -0.524893, 3.92493, 0, 0.6352941, 1, 1,
0.1178243, -0.1754493, 4.900155, 0, 0.627451, 1, 1,
0.1223274, 0.3365791, 1.190031, 0, 0.6235294, 1, 1,
0.1259169, -1.561151, 3.254816, 0, 0.6156863, 1, 1,
0.1295596, 0.121321, 1.42601, 0, 0.6117647, 1, 1,
0.1298297, -0.02962193, 1.38163, 0, 0.6039216, 1, 1,
0.1310399, 0.3129229, 1.621138, 0, 0.5960785, 1, 1,
0.131105, -0.7803388, 3.289789, 0, 0.5921569, 1, 1,
0.1343977, 0.9517955, -0.5962294, 0, 0.5843138, 1, 1,
0.1348648, -1.377012, 2.218531, 0, 0.5803922, 1, 1,
0.1378465, 1.34621, 0.2940687, 0, 0.572549, 1, 1,
0.1415891, -0.1721409, 2.550392, 0, 0.5686275, 1, 1,
0.1468721, -0.7388423, 2.657566, 0, 0.5607843, 1, 1,
0.1518662, -0.9034325, 3.674948, 0, 0.5568628, 1, 1,
0.1666115, -0.5553153, 1.164542, 0, 0.5490196, 1, 1,
0.1711093, 0.8656517, -0.5033264, 0, 0.5450981, 1, 1,
0.1713141, -0.7455119, 3.916122, 0, 0.5372549, 1, 1,
0.1713818, -0.4185037, 5.678297, 0, 0.5333334, 1, 1,
0.1721638, -0.26342, 2.272167, 0, 0.5254902, 1, 1,
0.1766034, 0.4271035, 1.57887, 0, 0.5215687, 1, 1,
0.1769561, 0.4753064, -0.9653702, 0, 0.5137255, 1, 1,
0.1776612, -2.276046, 3.79531, 0, 0.509804, 1, 1,
0.1808653, 0.8383682, 0.2871045, 0, 0.5019608, 1, 1,
0.1844078, 0.2590898, -0.2065661, 0, 0.4941176, 1, 1,
0.1869287, -0.9203515, 1.789311, 0, 0.4901961, 1, 1,
0.1883948, -0.6950142, 2.6381, 0, 0.4823529, 1, 1,
0.1890973, -0.5884225, 3.556714, 0, 0.4784314, 1, 1,
0.193188, -0.5881542, 3.707284, 0, 0.4705882, 1, 1,
0.1935218, 0.2193943, 0.74876, 0, 0.4666667, 1, 1,
0.1943932, -0.5235473, 1.203425, 0, 0.4588235, 1, 1,
0.2003701, -1.787801, 2.870595, 0, 0.454902, 1, 1,
0.2033118, 1.088628, -0.154628, 0, 0.4470588, 1, 1,
0.2094506, -0.1892787, 1.91573, 0, 0.4431373, 1, 1,
0.2099285, -1.099258, 2.84918, 0, 0.4352941, 1, 1,
0.2111205, -1.605333, 3.495364, 0, 0.4313726, 1, 1,
0.2117155, -0.34355, 0.8869342, 0, 0.4235294, 1, 1,
0.2125524, -0.002459012, 0.7938956, 0, 0.4196078, 1, 1,
0.2152447, 0.2394634, -1.86122, 0, 0.4117647, 1, 1,
0.219868, 0.2118725, 1.609952, 0, 0.4078431, 1, 1,
0.2211536, 0.04967587, 1.390179, 0, 0.4, 1, 1,
0.2224476, -0.8260006, 2.231804, 0, 0.3921569, 1, 1,
0.2235839, -2.004663, 3.509611, 0, 0.3882353, 1, 1,
0.2252576, 1.960014, 1.516849, 0, 0.3803922, 1, 1,
0.2268118, 0.2646068, 1.414998, 0, 0.3764706, 1, 1,
0.2294077, -0.4107617, 3.964042, 0, 0.3686275, 1, 1,
0.2335591, -1.424828, 2.50258, 0, 0.3647059, 1, 1,
0.2453967, 0.3177536, 1.377492, 0, 0.3568628, 1, 1,
0.2465296, 0.1685175, 2.100646, 0, 0.3529412, 1, 1,
0.2520137, 0.1573271, 2.478019, 0, 0.345098, 1, 1,
0.2534526, -0.8779071, 0.4373205, 0, 0.3411765, 1, 1,
0.2558514, 0.518641, 2.245551, 0, 0.3333333, 1, 1,
0.2563054, 2.650365, 0.1151442, 0, 0.3294118, 1, 1,
0.2591388, -0.2451076, 4.078609, 0, 0.3215686, 1, 1,
0.2625771, -0.1933277, 3.952399, 0, 0.3176471, 1, 1,
0.2626086, 1.359525, 1.660164, 0, 0.3098039, 1, 1,
0.2649205, 0.2796627, 2.295474, 0, 0.3058824, 1, 1,
0.2700315, -0.05168442, 0.1633955, 0, 0.2980392, 1, 1,
0.2702275, 0.3660915, 0.7490622, 0, 0.2901961, 1, 1,
0.2719906, -0.7004067, 2.279503, 0, 0.2862745, 1, 1,
0.2728895, -2.186333, 1.902256, 0, 0.2784314, 1, 1,
0.275259, 1.166569, 0.5666052, 0, 0.2745098, 1, 1,
0.2758046, -0.5664449, 1.562953, 0, 0.2666667, 1, 1,
0.2761579, 0.8374518, 0.2869332, 0, 0.2627451, 1, 1,
0.2765402, -3.236925, 1.862272, 0, 0.254902, 1, 1,
0.2766988, -0.2916325, 2.200106, 0, 0.2509804, 1, 1,
0.2789455, 0.2395605, 0.7923949, 0, 0.2431373, 1, 1,
0.2806715, 0.3857356, 0.4929572, 0, 0.2392157, 1, 1,
0.2827037, 0.9870895, 0.06465744, 0, 0.2313726, 1, 1,
0.2832178, 0.02979476, 2.225251, 0, 0.227451, 1, 1,
0.2883337, -0.6038569, 1.831452, 0, 0.2196078, 1, 1,
0.2888365, -0.4302806, 2.758118, 0, 0.2156863, 1, 1,
0.2942844, -1.330432, 2.831661, 0, 0.2078431, 1, 1,
0.296443, 1.197497, 0.9765822, 0, 0.2039216, 1, 1,
0.3001342, 0.1052889, 1.916676, 0, 0.1960784, 1, 1,
0.3014618, 0.4222295, 1.837624, 0, 0.1882353, 1, 1,
0.3038953, -0.1689646, 2.187694, 0, 0.1843137, 1, 1,
0.3047168, -1.182823, 3.956417, 0, 0.1764706, 1, 1,
0.3055481, 0.4037342, 1.930193, 0, 0.172549, 1, 1,
0.3073348, -0.3840681, 3.866149, 0, 0.1647059, 1, 1,
0.3085904, 1.216308, 1.424331, 0, 0.1607843, 1, 1,
0.3087066, 0.6562553, 1.135995, 0, 0.1529412, 1, 1,
0.3104558, -0.3276488, 4.301853, 0, 0.1490196, 1, 1,
0.31859, 1.819433, -1.498798, 0, 0.1411765, 1, 1,
0.3278196, 0.2143275, 2.130224, 0, 0.1372549, 1, 1,
0.3425559, 0.7230145, 2.212602, 0, 0.1294118, 1, 1,
0.3575331, 0.7193624, -0.2111436, 0, 0.1254902, 1, 1,
0.3590932, 1.478777, 0.2593763, 0, 0.1176471, 1, 1,
0.3643664, 0.8224541, 1.136549, 0, 0.1137255, 1, 1,
0.3647192, 0.2986079, -0.1530133, 0, 0.1058824, 1, 1,
0.3682095, 2.156936, 1.565746, 0, 0.09803922, 1, 1,
0.3741692, -1.413948, 2.618262, 0, 0.09411765, 1, 1,
0.3784609, 0.9675875, 2.404557, 0, 0.08627451, 1, 1,
0.379789, 1.19289, 1.690256, 0, 0.08235294, 1, 1,
0.3850014, 0.1672692, 2.423756, 0, 0.07450981, 1, 1,
0.3882539, 0.4513181, -0.5569283, 0, 0.07058824, 1, 1,
0.3892703, 0.04320154, 0.5997694, 0, 0.0627451, 1, 1,
0.3904717, 1.604885, 1.993109, 0, 0.05882353, 1, 1,
0.3947704, 0.2598658, -0.7060419, 0, 0.05098039, 1, 1,
0.3986025, 0.4544905, 0.06633155, 0, 0.04705882, 1, 1,
0.4033442, 1.050545, 0.04914384, 0, 0.03921569, 1, 1,
0.4045766, 0.2723639, 1.640643, 0, 0.03529412, 1, 1,
0.4066266, -0.2955509, 1.531758, 0, 0.02745098, 1, 1,
0.4090586, -0.4504273, 2.279145, 0, 0.02352941, 1, 1,
0.4114343, -0.453602, 2.389608, 0, 0.01568628, 1, 1,
0.4129397, 0.7827912, 2.49896, 0, 0.01176471, 1, 1,
0.4148177, 1.188997, -1.124541, 0, 0.003921569, 1, 1,
0.4187332, 0.7549238, 2.052937, 0.003921569, 0, 1, 1,
0.4274925, 1.163882, -1.17949, 0.007843138, 0, 1, 1,
0.4309649, -0.2718027, 0.3234681, 0.01568628, 0, 1, 1,
0.4410312, 0.6057522, 0.07471647, 0.01960784, 0, 1, 1,
0.4478677, -2.21923, 2.890233, 0.02745098, 0, 1, 1,
0.4481234, 0.2019889, 0.2009574, 0.03137255, 0, 1, 1,
0.4543, 0.9459317, 0.7268242, 0.03921569, 0, 1, 1,
0.4557052, 1.045631, 0.9524413, 0.04313726, 0, 1, 1,
0.4618098, -0.9889396, 3.044847, 0.05098039, 0, 1, 1,
0.4660879, -0.2859033, 2.875448, 0.05490196, 0, 1, 1,
0.4661568, 0.6006011, 0.7195779, 0.0627451, 0, 1, 1,
0.4706861, -0.648734, 2.367294, 0.06666667, 0, 1, 1,
0.475182, 0.2461056, 3.016685, 0.07450981, 0, 1, 1,
0.4770648, -1.348262, 4.063558, 0.07843138, 0, 1, 1,
0.4905608, 0.4687481, 1.094697, 0.08627451, 0, 1, 1,
0.4981572, -0.5509568, 1.794971, 0.09019608, 0, 1, 1,
0.5004807, 0.405071, 1.338102, 0.09803922, 0, 1, 1,
0.5095108, 0.3757182, 0.14211, 0.1058824, 0, 1, 1,
0.5100282, 0.07077328, 2.526394, 0.1098039, 0, 1, 1,
0.5158073, 0.8270035, 0.9768916, 0.1176471, 0, 1, 1,
0.5187004, 0.2103231, 0.2152332, 0.1215686, 0, 1, 1,
0.5209116, 0.2926026, 0.6373019, 0.1294118, 0, 1, 1,
0.5285541, 1.783511, -0.6841316, 0.1333333, 0, 1, 1,
0.5308173, 1.650255, 1.880751, 0.1411765, 0, 1, 1,
0.5341132, -1.799715, 2.292708, 0.145098, 0, 1, 1,
0.534426, 1.053928, 0.5087675, 0.1529412, 0, 1, 1,
0.5378193, -1.012357, 3.289259, 0.1568628, 0, 1, 1,
0.5387843, 0.5526528, 1.137275, 0.1647059, 0, 1, 1,
0.5425935, -2.214259, 1.115225, 0.1686275, 0, 1, 1,
0.5432295, -0.7807659, 2.758247, 0.1764706, 0, 1, 1,
0.5455995, -1.110538, 2.572376, 0.1803922, 0, 1, 1,
0.5532193, 0.6905612, 0.7119686, 0.1882353, 0, 1, 1,
0.5557485, -1.114958, 2.110716, 0.1921569, 0, 1, 1,
0.5560926, -0.6915055, 3.160746, 0.2, 0, 1, 1,
0.5579311, -0.3518188, 3.641297, 0.2078431, 0, 1, 1,
0.5623581, -0.5635006, 4.236083, 0.2117647, 0, 1, 1,
0.5639604, 0.03407154, 1.079241, 0.2196078, 0, 1, 1,
0.5694004, 0.4498149, 0.2311819, 0.2235294, 0, 1, 1,
0.5716705, -3.665436, 2.731499, 0.2313726, 0, 1, 1,
0.5719174, 1.317644, -0.5142436, 0.2352941, 0, 1, 1,
0.5742005, -1.733122, 2.147559, 0.2431373, 0, 1, 1,
0.5765396, 1.884947, 2.260767, 0.2470588, 0, 1, 1,
0.5770107, 1.851906, -0.7005284, 0.254902, 0, 1, 1,
0.579349, 0.8321318, 0.1272475, 0.2588235, 0, 1, 1,
0.5890253, 0.07451727, 2.757047, 0.2666667, 0, 1, 1,
0.589341, 0.1261482, 1.02303, 0.2705882, 0, 1, 1,
0.5964284, 1.069335, 0.4258028, 0.2784314, 0, 1, 1,
0.5985674, 0.2781548, 0.719554, 0.282353, 0, 1, 1,
0.5991585, -0.2967247, 2.608285, 0.2901961, 0, 1, 1,
0.602942, -0.2700406, 2.73433, 0.2941177, 0, 1, 1,
0.6095436, -1.440678, 0.7848934, 0.3019608, 0, 1, 1,
0.609803, 0.3964346, 0.5673589, 0.3098039, 0, 1, 1,
0.6191356, 0.3787524, 0.3780149, 0.3137255, 0, 1, 1,
0.6200892, 1.280953, -0.4116829, 0.3215686, 0, 1, 1,
0.6207222, 0.1005107, 0.6695024, 0.3254902, 0, 1, 1,
0.6208171, -0.7221476, 1.74737, 0.3333333, 0, 1, 1,
0.6267986, -0.3172553, 1.262885, 0.3372549, 0, 1, 1,
0.6314665, -0.1657221, 3.15771, 0.345098, 0, 1, 1,
0.6336927, -0.3055136, 2.262557, 0.3490196, 0, 1, 1,
0.6401171, -0.9345188, 3.438321, 0.3568628, 0, 1, 1,
0.6507481, -0.4035164, 2.964065, 0.3607843, 0, 1, 1,
0.6529888, -0.2761602, 1.026822, 0.3686275, 0, 1, 1,
0.6540346, -0.1887052, 1.99433, 0.372549, 0, 1, 1,
0.6548841, 0.01015625, 1.878165, 0.3803922, 0, 1, 1,
0.6550942, 0.08223547, 0.0635842, 0.3843137, 0, 1, 1,
0.6571563, -0.1092107, 1.915357, 0.3921569, 0, 1, 1,
0.6636193, -0.4942352, 1.274745, 0.3960784, 0, 1, 1,
0.6643323, -1.868729, 2.611706, 0.4039216, 0, 1, 1,
0.6702616, -0.2796628, 0.4924414, 0.4117647, 0, 1, 1,
0.6776168, 0.3038462, 1.269087, 0.4156863, 0, 1, 1,
0.678631, -0.3603425, 1.538309, 0.4235294, 0, 1, 1,
0.6875236, 1.640405, 0.8668515, 0.427451, 0, 1, 1,
0.6882205, -1.300901, 2.874071, 0.4352941, 0, 1, 1,
0.6892797, -1.584659, 1.974933, 0.4392157, 0, 1, 1,
0.6896719, -0.6831188, 3.115051, 0.4470588, 0, 1, 1,
0.6913123, -0.01005008, 1.872143, 0.4509804, 0, 1, 1,
0.6929441, 1.140446, 0.3801949, 0.4588235, 0, 1, 1,
0.6934474, -1.367777, 3.208709, 0.4627451, 0, 1, 1,
0.6994886, 0.8809274, -0.4801104, 0.4705882, 0, 1, 1,
0.7030709, 0.4919334, 2.351654, 0.4745098, 0, 1, 1,
0.7098715, -0.04466686, 1.1666, 0.4823529, 0, 1, 1,
0.7135464, 1.026981, 1.995852, 0.4862745, 0, 1, 1,
0.7169567, -0.2802952, 3.797069, 0.4941176, 0, 1, 1,
0.7177326, -1.853657, 2.171248, 0.5019608, 0, 1, 1,
0.7207676, -0.9294202, 2.363126, 0.5058824, 0, 1, 1,
0.7268698, 1.498091, 0.9824865, 0.5137255, 0, 1, 1,
0.7269235, -0.1835812, 1.329366, 0.5176471, 0, 1, 1,
0.7310097, -1.324393, 2.380989, 0.5254902, 0, 1, 1,
0.7333444, -0.359684, 2.366308, 0.5294118, 0, 1, 1,
0.7340418, -0.2326974, 2.001198, 0.5372549, 0, 1, 1,
0.7380306, -0.5215581, 1.992382, 0.5411765, 0, 1, 1,
0.7472596, 1.63955, 0.3853206, 0.5490196, 0, 1, 1,
0.749639, -3.847723, 3.143006, 0.5529412, 0, 1, 1,
0.7529322, -1.242352, 1.90839, 0.5607843, 0, 1, 1,
0.767967, 1.515856, 0.3963336, 0.5647059, 0, 1, 1,
0.7717162, -0.08539221, 2.037077, 0.572549, 0, 1, 1,
0.7725022, -1.356303, 1.853621, 0.5764706, 0, 1, 1,
0.7750295, 1.747879, -0.4333399, 0.5843138, 0, 1, 1,
0.7804621, 0.1419262, 0.6730395, 0.5882353, 0, 1, 1,
0.7841876, 0.4852457, -0.05450352, 0.5960785, 0, 1, 1,
0.784421, -0.3969774, 3.39033, 0.6039216, 0, 1, 1,
0.7852799, 1.016674, 1.627371, 0.6078432, 0, 1, 1,
0.7859398, -0.185128, 1.270912, 0.6156863, 0, 1, 1,
0.7889237, 1.405877, 0.4710881, 0.6196079, 0, 1, 1,
0.7893837, -2.885817, 3.834074, 0.627451, 0, 1, 1,
0.7969773, -2.030362, 1.656534, 0.6313726, 0, 1, 1,
0.8022934, -1.771757, 2.890856, 0.6392157, 0, 1, 1,
0.8041709, -0.946161, 1.577373, 0.6431373, 0, 1, 1,
0.8044887, -1.456257, 4.072658, 0.6509804, 0, 1, 1,
0.8053564, -0.7039333, 3.775593, 0.654902, 0, 1, 1,
0.8079809, -0.4944142, 1.204518, 0.6627451, 0, 1, 1,
0.8090909, 2.572335, 0.7807692, 0.6666667, 0, 1, 1,
0.8115842, -0.9663352, 3.098298, 0.6745098, 0, 1, 1,
0.8171234, -2.140919, 2.746138, 0.6784314, 0, 1, 1,
0.8218184, -1.309468, 4.083515, 0.6862745, 0, 1, 1,
0.8219908, -0.3232586, 0.9654936, 0.6901961, 0, 1, 1,
0.8289534, 0.1246416, 1.447765, 0.6980392, 0, 1, 1,
0.8337523, -0.8766627, 3.482979, 0.7058824, 0, 1, 1,
0.8343964, 1.287593, -0.3235459, 0.7098039, 0, 1, 1,
0.8460254, -1.489993, 2.448663, 0.7176471, 0, 1, 1,
0.8460501, 1.386727, -0.05933379, 0.7215686, 0, 1, 1,
0.8463973, -0.1523652, 2.95843, 0.7294118, 0, 1, 1,
0.8525958, -0.08612481, 0.6579938, 0.7333333, 0, 1, 1,
0.8585225, 0.257194, 0.3239836, 0.7411765, 0, 1, 1,
0.8586575, 0.7657047, 0.9740179, 0.7450981, 0, 1, 1,
0.859111, -0.7096926, 2.783291, 0.7529412, 0, 1, 1,
0.8637087, -0.2083665, -0.1375061, 0.7568628, 0, 1, 1,
0.8639509, -0.7608713, 2.125412, 0.7647059, 0, 1, 1,
0.8660355, 0.2988623, 1.38794, 0.7686275, 0, 1, 1,
0.8700781, -0.4985279, 2.117075, 0.7764706, 0, 1, 1,
0.8714385, 0.0555382, 1.82436, 0.7803922, 0, 1, 1,
0.8726045, -0.6125915, 2.42411, 0.7882353, 0, 1, 1,
0.8726526, 0.2862251, 0.9644815, 0.7921569, 0, 1, 1,
0.8779497, 2.00144, 0.5806865, 0.8, 0, 1, 1,
0.8781809, 0.7966312, 1.88748, 0.8078431, 0, 1, 1,
0.8786603, -0.04752087, 1.046521, 0.8117647, 0, 1, 1,
0.8794194, -0.5688095, 0.1670299, 0.8196079, 0, 1, 1,
0.8812972, 1.120281, 2.365748, 0.8235294, 0, 1, 1,
0.8831707, 0.4326811, -0.02150469, 0.8313726, 0, 1, 1,
0.883921, -1.040822, 1.755808, 0.8352941, 0, 1, 1,
0.8884671, -1.619228, 3.179129, 0.8431373, 0, 1, 1,
0.8924868, -1.717286, 3.895382, 0.8470588, 0, 1, 1,
0.9003727, 0.2995617, 2.674884, 0.854902, 0, 1, 1,
0.9010947, 0.08157896, -0.6107986, 0.8588235, 0, 1, 1,
0.9036078, -0.1296118, 0.2277367, 0.8666667, 0, 1, 1,
0.9097586, -1.289308, 2.653026, 0.8705882, 0, 1, 1,
0.9178047, -0.8333008, 5.890996, 0.8784314, 0, 1, 1,
0.9185086, 0.4657699, 2.576804, 0.8823529, 0, 1, 1,
0.9196979, -0.2921532, 3.537967, 0.8901961, 0, 1, 1,
0.9211459, -0.2547605, 0.5885997, 0.8941177, 0, 1, 1,
0.9238468, -0.1745157, 1.766895, 0.9019608, 0, 1, 1,
0.93088, 0.09080576, 1.097148, 0.9098039, 0, 1, 1,
0.938954, -1.466455, 2.327102, 0.9137255, 0, 1, 1,
0.9399288, -0.247495, 3.234479, 0.9215686, 0, 1, 1,
0.940468, -0.634934, 3.481103, 0.9254902, 0, 1, 1,
0.941763, 0.5424656, 0.8222846, 0.9333333, 0, 1, 1,
0.9420532, 0.2385952, 1.480245, 0.9372549, 0, 1, 1,
0.9423279, 0.1458011, -0.3043416, 0.945098, 0, 1, 1,
0.9463826, 1.350365, 2.376343, 0.9490196, 0, 1, 1,
0.9523183, 1.115028, -0.5456445, 0.9568627, 0, 1, 1,
0.9555007, 1.247598, 0.07514833, 0.9607843, 0, 1, 1,
0.9602236, 0.5730137, 1.544323, 0.9686275, 0, 1, 1,
0.9604231, 1.21587, 0.6644105, 0.972549, 0, 1, 1,
0.9619759, -0.7243891, 3.099189, 0.9803922, 0, 1, 1,
0.9697978, -0.01062443, 2.691526, 0.9843137, 0, 1, 1,
0.9723694, -0.117226, 1.815871, 0.9921569, 0, 1, 1,
0.9752377, 0.7450472, 1.919094, 0.9960784, 0, 1, 1,
0.9765337, -0.4674292, 0.6737848, 1, 0, 0.9960784, 1,
0.9860525, -0.4400999, 2.702381, 1, 0, 0.9882353, 1,
0.9860752, 1.030923, 0.870441, 1, 0, 0.9843137, 1,
0.9869644, 0.5724248, -0.744207, 1, 0, 0.9764706, 1,
0.9933578, -0.929399, 4.0973, 1, 0, 0.972549, 1,
0.9948345, -2.464893, 3.645349, 1, 0, 0.9647059, 1,
0.9960346, -0.4962307, 3.280361, 1, 0, 0.9607843, 1,
0.9965329, -0.2681368, 2.95153, 1, 0, 0.9529412, 1,
0.997111, -0.1202666, 3.46065, 1, 0, 0.9490196, 1,
0.9971203, 0.3485761, 0.778589, 1, 0, 0.9411765, 1,
0.9976951, 2.641846, -0.5456784, 1, 0, 0.9372549, 1,
1.002116, 0.9108666, 2.002634, 1, 0, 0.9294118, 1,
1.003497, 1.05435, 1.739658, 1, 0, 0.9254902, 1,
1.008507, -0.933989, 2.731367, 1, 0, 0.9176471, 1,
1.010311, 0.3540326, 1.455313, 1, 0, 0.9137255, 1,
1.011846, 0.6152617, 2.590019, 1, 0, 0.9058824, 1,
1.01318, 0.793659, 1.991291, 1, 0, 0.9019608, 1,
1.016742, -1.057524, 3.030632, 1, 0, 0.8941177, 1,
1.017266, 2.335325, -0.1945906, 1, 0, 0.8862745, 1,
1.017905, -0.5497733, 1.820575, 1, 0, 0.8823529, 1,
1.023393, -0.7128848, 1.775039, 1, 0, 0.8745098, 1,
1.034103, 0.5033877, 2.227771, 1, 0, 0.8705882, 1,
1.034178, -0.663187, 1.810555, 1, 0, 0.8627451, 1,
1.036748, 1.514395, -0.7617451, 1, 0, 0.8588235, 1,
1.047607, 1.693638, -1.405588, 1, 0, 0.8509804, 1,
1.04809, 2.046605, -0.3381689, 1, 0, 0.8470588, 1,
1.0511, -0.1175455, 2.194434, 1, 0, 0.8392157, 1,
1.065091, 0.8107358, 1.44763, 1, 0, 0.8352941, 1,
1.067338, -0.2295222, -0.2388531, 1, 0, 0.827451, 1,
1.073192, 2.22929, 0.7592632, 1, 0, 0.8235294, 1,
1.094766, -1.589484, 4.489616, 1, 0, 0.8156863, 1,
1.106619, 1.510847, -0.2791493, 1, 0, 0.8117647, 1,
1.110524, 0.6327484, 1.385675, 1, 0, 0.8039216, 1,
1.115677, -1.38026, 3.269014, 1, 0, 0.7960784, 1,
1.118256, 0.4577372, 1.431395, 1, 0, 0.7921569, 1,
1.122424, 0.9965442, 1.388188, 1, 0, 0.7843137, 1,
1.123703, -0.1216672, 1.623044, 1, 0, 0.7803922, 1,
1.128358, -1.685472, 3.684711, 1, 0, 0.772549, 1,
1.130739, 0.1444931, 1.180701, 1, 0, 0.7686275, 1,
1.132482, 0.7228133, 1.111709, 1, 0, 0.7607843, 1,
1.134626, 1.670677, 1.297741, 1, 0, 0.7568628, 1,
1.141195, 0.842851, -0.314238, 1, 0, 0.7490196, 1,
1.145085, 0.2422241, 2.056232, 1, 0, 0.7450981, 1,
1.155032, -1.046386, 2.579919, 1, 0, 0.7372549, 1,
1.15837, -0.2235057, 1.442384, 1, 0, 0.7333333, 1,
1.159857, 0.4105185, 1.78636, 1, 0, 0.7254902, 1,
1.167582, -2.625403, 2.565793, 1, 0, 0.7215686, 1,
1.167821, 0.0520901, 1.892294, 1, 0, 0.7137255, 1,
1.169869, 0.6591309, 1.90622, 1, 0, 0.7098039, 1,
1.175993, 0.09173549, 0.9751425, 1, 0, 0.7019608, 1,
1.190307, 0.1733954, 0.8553808, 1, 0, 0.6941177, 1,
1.194013, 0.3183551, 0.9864641, 1, 0, 0.6901961, 1,
1.194788, 0.1380213, 1.673977, 1, 0, 0.682353, 1,
1.208689, 0.1054719, 3.353677, 1, 0, 0.6784314, 1,
1.217625, 1.421854, 1.677191, 1, 0, 0.6705883, 1,
1.224876, -1.238957, 3.057477, 1, 0, 0.6666667, 1,
1.229429, 0.1794446, 1.51098, 1, 0, 0.6588235, 1,
1.229967, 0.69778, 2.088925, 1, 0, 0.654902, 1,
1.243108, -0.5471664, 1.479623, 1, 0, 0.6470588, 1,
1.26517, -1.082291, 2.841924, 1, 0, 0.6431373, 1,
1.270073, 0.6038383, 1.244737, 1, 0, 0.6352941, 1,
1.275458, -1.097821, 0.6179389, 1, 0, 0.6313726, 1,
1.280958, 0.1496501, 1.679607, 1, 0, 0.6235294, 1,
1.281152, 0.152226, 0.3418999, 1, 0, 0.6196079, 1,
1.282823, -0.9813587, 3.07093, 1, 0, 0.6117647, 1,
1.286274, -0.5475159, 1.451718, 1, 0, 0.6078432, 1,
1.290471, -0.6360673, 4.236629, 1, 0, 0.6, 1,
1.295233, -0.06084459, 2.393106, 1, 0, 0.5921569, 1,
1.299268, -0.8571693, 1.679617, 1, 0, 0.5882353, 1,
1.304211, -1.341849, 0.8605835, 1, 0, 0.5803922, 1,
1.310418, -0.6597759, 2.138535, 1, 0, 0.5764706, 1,
1.31239, -0.08406812, 0.02399131, 1, 0, 0.5686275, 1,
1.342674, -0.5185865, 2.409862, 1, 0, 0.5647059, 1,
1.347585, 0.515946, 1.259872, 1, 0, 0.5568628, 1,
1.355511, 0.7839304, 0.3574125, 1, 0, 0.5529412, 1,
1.363098, 0.444243, 0.8643582, 1, 0, 0.5450981, 1,
1.369706, -0.190845, 1.564473, 1, 0, 0.5411765, 1,
1.379731, 1.240277, -0.4500838, 1, 0, 0.5333334, 1,
1.380196, 1.723652, 1.392936, 1, 0, 0.5294118, 1,
1.383084, 1.963005, 0.03813704, 1, 0, 0.5215687, 1,
1.385938, -0.3842608, 0.2333384, 1, 0, 0.5176471, 1,
1.390726, -0.1093484, -0.6843603, 1, 0, 0.509804, 1,
1.403916, 0.4676935, 1.739323, 1, 0, 0.5058824, 1,
1.40482, -1.418573, 3.717206, 1, 0, 0.4980392, 1,
1.40992, 1.398884, -0.5832096, 1, 0, 0.4901961, 1,
1.428724, -0.8112828, 2.684203, 1, 0, 0.4862745, 1,
1.431652, -0.3217669, 1.861891, 1, 0, 0.4784314, 1,
1.445133, 1.925441, 1.324842, 1, 0, 0.4745098, 1,
1.455195, 0.060456, 2.629094, 1, 0, 0.4666667, 1,
1.456863, -0.1371748, 2.030338, 1, 0, 0.4627451, 1,
1.465139, 1.29979, -0.8946729, 1, 0, 0.454902, 1,
1.476671, 0.005535753, 0.5547558, 1, 0, 0.4509804, 1,
1.502743, 1.881053, 0.992419, 1, 0, 0.4431373, 1,
1.505595, 0.3573172, 1.5801, 1, 0, 0.4392157, 1,
1.519171, -0.4462977, 2.874906, 1, 0, 0.4313726, 1,
1.520947, -1.517055, 3.95278, 1, 0, 0.427451, 1,
1.529702, -0.3267154, 1.195839, 1, 0, 0.4196078, 1,
1.539255, 0.3590134, 0.5097483, 1, 0, 0.4156863, 1,
1.541727, 1.139239, 2.023157, 1, 0, 0.4078431, 1,
1.543223, 0.3209232, 0.5263194, 1, 0, 0.4039216, 1,
1.551644, 0.5615715, 1.553753, 1, 0, 0.3960784, 1,
1.560711, 0.1150947, 0.752652, 1, 0, 0.3882353, 1,
1.56597, -0.9990537, 1.241202, 1, 0, 0.3843137, 1,
1.597467, 0.1652831, 3.383594, 1, 0, 0.3764706, 1,
1.609874, 1.655641, -0.02653783, 1, 0, 0.372549, 1,
1.639005, -1.784064, 3.126997, 1, 0, 0.3647059, 1,
1.639995, -0.2287725, 0.7323351, 1, 0, 0.3607843, 1,
1.6431, -2.068338, 3.03907, 1, 0, 0.3529412, 1,
1.644164, 1.960994, 1.233989, 1, 0, 0.3490196, 1,
1.646966, -1.078835, 1.356893, 1, 0, 0.3411765, 1,
1.656996, -1.602362, 2.084497, 1, 0, 0.3372549, 1,
1.658649, -0.3137316, 1.939397, 1, 0, 0.3294118, 1,
1.663117, 1.246964, 1.553726, 1, 0, 0.3254902, 1,
1.66706, -0.8330263, -0.5314487, 1, 0, 0.3176471, 1,
1.6689, 1.222146, -0.06925066, 1, 0, 0.3137255, 1,
1.674804, -0.1633766, 2.070329, 1, 0, 0.3058824, 1,
1.680855, -0.3340096, 3.703701, 1, 0, 0.2980392, 1,
1.698284, 0.6403271, 1.116069, 1, 0, 0.2941177, 1,
1.736802, 0.8236722, 0.955099, 1, 0, 0.2862745, 1,
1.738579, 0.1829733, 2.972409, 1, 0, 0.282353, 1,
1.743052, -1.084292, 1.437195, 1, 0, 0.2745098, 1,
1.757048, -0.01333379, 2.061655, 1, 0, 0.2705882, 1,
1.764436, 0.4468737, 1.03141, 1, 0, 0.2627451, 1,
1.772889, 1.744096, 2.660271, 1, 0, 0.2588235, 1,
1.783115, 0.7470042, 0.06544784, 1, 0, 0.2509804, 1,
1.793338, 1.630895, 2.99518, 1, 0, 0.2470588, 1,
1.805461, -0.1200547, 1.412939, 1, 0, 0.2392157, 1,
1.828311, -1.100317, 1.190291, 1, 0, 0.2352941, 1,
1.830722, -0.384455, 2.060753, 1, 0, 0.227451, 1,
1.854591, -1.190806, 1.71396, 1, 0, 0.2235294, 1,
1.85706, -0.3425508, 2.150268, 1, 0, 0.2156863, 1,
1.858435, -1.180591, 2.029269, 1, 0, 0.2117647, 1,
1.876109, -0.03421866, 0.4481694, 1, 0, 0.2039216, 1,
1.881091, 1.956811, 1.590075, 1, 0, 0.1960784, 1,
1.882487, 0.9425765, 1.336537, 1, 0, 0.1921569, 1,
1.890782, 1.767527, 1.34537, 1, 0, 0.1843137, 1,
1.895735, -2.39108, 2.343791, 1, 0, 0.1803922, 1,
1.908808, 0.3233737, 1.070773, 1, 0, 0.172549, 1,
1.911653, -1.083731, 2.029818, 1, 0, 0.1686275, 1,
1.913049, -0.9426, 0.4987329, 1, 0, 0.1607843, 1,
1.921647, 0.642715, 0.6113491, 1, 0, 0.1568628, 1,
1.92727, 0.5119231, 1.87122, 1, 0, 0.1490196, 1,
1.927395, -0.9366072, 1.461534, 1, 0, 0.145098, 1,
1.943246, 1.245244, -0.1679869, 1, 0, 0.1372549, 1,
1.944314, -0.3756467, 1.741337, 1, 0, 0.1333333, 1,
1.975816, 2.360044, -0.7614201, 1, 0, 0.1254902, 1,
1.991059, 0.9580162, 3.428225, 1, 0, 0.1215686, 1,
1.996793, -1.498566, 1.992973, 1, 0, 0.1137255, 1,
2.000804, -0.8666144, 2.905832, 1, 0, 0.1098039, 1,
2.064929, 1.841137, -0.5280111, 1, 0, 0.1019608, 1,
2.115549, -0.2730141, 2.761335, 1, 0, 0.09411765, 1,
2.162071, 0.7834176, 2.577906, 1, 0, 0.09019608, 1,
2.271767, -1.654931, 0.8569382, 1, 0, 0.08235294, 1,
2.272146, -1.151853, 1.411435, 1, 0, 0.07843138, 1,
2.274741, 1.72068, 1.646244, 1, 0, 0.07058824, 1,
2.339062, -0.4383025, 0.1189998, 1, 0, 0.06666667, 1,
2.35511, 1.018803, 2.144474, 1, 0, 0.05882353, 1,
2.412405, -1.180619, 2.189266, 1, 0, 0.05490196, 1,
2.420427, -1.158284, 3.223012, 1, 0, 0.04705882, 1,
2.572972, 1.409602, 1.535481, 1, 0, 0.04313726, 1,
2.582987, -0.5960076, 2.168719, 1, 0, 0.03529412, 1,
2.788751, 0.4590301, 1.846408, 1, 0, 0.03137255, 1,
2.861719, -0.04504316, -0.3619583, 1, 0, 0.02352941, 1,
3.156416, -0.2042109, 1.722736, 1, 0, 0.01960784, 1,
3.286472, -0.9498662, 2.941576, 1, 0, 0.01176471, 1,
3.522133, -0.3028476, 2.254678, 1, 0, 0.007843138, 1
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
0.2628986, -5.006143, -7.270532, 0, -0.5, 0.5, 0.5,
0.2628986, -5.006143, -7.270532, 1, -0.5, 0.5, 0.5,
0.2628986, -5.006143, -7.270532, 1, 1.5, 0.5, 0.5,
0.2628986, -5.006143, -7.270532, 0, 1.5, 0.5, 0.5
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
-4.101217, -0.4305528, -7.270532, 0, -0.5, 0.5, 0.5,
-4.101217, -0.4305528, -7.270532, 1, -0.5, 0.5, 0.5,
-4.101217, -0.4305528, -7.270532, 1, 1.5, 0.5, 0.5,
-4.101217, -0.4305528, -7.270532, 0, 1.5, 0.5, 0.5
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
-4.101217, -5.006143, 0.2640066, 0, -0.5, 0.5, 0.5,
-4.101217, -5.006143, 0.2640066, 1, -0.5, 0.5, 0.5,
-4.101217, -5.006143, 0.2640066, 1, 1.5, 0.5, 0.5,
-4.101217, -5.006143, 0.2640066, 0, 1.5, 0.5, 0.5
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
-2, -3.950238, -5.531793,
3, -3.950238, -5.531793,
-2, -3.950238, -5.531793,
-2, -4.126222, -5.821582,
-1, -3.950238, -5.531793,
-1, -4.126222, -5.821582,
0, -3.950238, -5.531793,
0, -4.126222, -5.821582,
1, -3.950238, -5.531793,
1, -4.126222, -5.821582,
2, -3.950238, -5.531793,
2, -4.126222, -5.821582,
3, -3.950238, -5.531793,
3, -4.126222, -5.821582
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
-2, -4.47819, -6.401162, 0, -0.5, 0.5, 0.5,
-2, -4.47819, -6.401162, 1, -0.5, 0.5, 0.5,
-2, -4.47819, -6.401162, 1, 1.5, 0.5, 0.5,
-2, -4.47819, -6.401162, 0, 1.5, 0.5, 0.5,
-1, -4.47819, -6.401162, 0, -0.5, 0.5, 0.5,
-1, -4.47819, -6.401162, 1, -0.5, 0.5, 0.5,
-1, -4.47819, -6.401162, 1, 1.5, 0.5, 0.5,
-1, -4.47819, -6.401162, 0, 1.5, 0.5, 0.5,
0, -4.47819, -6.401162, 0, -0.5, 0.5, 0.5,
0, -4.47819, -6.401162, 1, -0.5, 0.5, 0.5,
0, -4.47819, -6.401162, 1, 1.5, 0.5, 0.5,
0, -4.47819, -6.401162, 0, 1.5, 0.5, 0.5,
1, -4.47819, -6.401162, 0, -0.5, 0.5, 0.5,
1, -4.47819, -6.401162, 1, -0.5, 0.5, 0.5,
1, -4.47819, -6.401162, 1, 1.5, 0.5, 0.5,
1, -4.47819, -6.401162, 0, 1.5, 0.5, 0.5,
2, -4.47819, -6.401162, 0, -0.5, 0.5, 0.5,
2, -4.47819, -6.401162, 1, -0.5, 0.5, 0.5,
2, -4.47819, -6.401162, 1, 1.5, 0.5, 0.5,
2, -4.47819, -6.401162, 0, 1.5, 0.5, 0.5,
3, -4.47819, -6.401162, 0, -0.5, 0.5, 0.5,
3, -4.47819, -6.401162, 1, -0.5, 0.5, 0.5,
3, -4.47819, -6.401162, 1, 1.5, 0.5, 0.5,
3, -4.47819, -6.401162, 0, 1.5, 0.5, 0.5
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
-3.094113, -3, -5.531793,
-3.094113, 2, -5.531793,
-3.094113, -3, -5.531793,
-3.261964, -3, -5.821582,
-3.094113, -2, -5.531793,
-3.261964, -2, -5.821582,
-3.094113, -1, -5.531793,
-3.261964, -1, -5.821582,
-3.094113, 0, -5.531793,
-3.261964, 0, -5.821582,
-3.094113, 1, -5.531793,
-3.261964, 1, -5.821582,
-3.094113, 2, -5.531793,
-3.261964, 2, -5.821582
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
-3.597665, -3, -6.401162, 0, -0.5, 0.5, 0.5,
-3.597665, -3, -6.401162, 1, -0.5, 0.5, 0.5,
-3.597665, -3, -6.401162, 1, 1.5, 0.5, 0.5,
-3.597665, -3, -6.401162, 0, 1.5, 0.5, 0.5,
-3.597665, -2, -6.401162, 0, -0.5, 0.5, 0.5,
-3.597665, -2, -6.401162, 1, -0.5, 0.5, 0.5,
-3.597665, -2, -6.401162, 1, 1.5, 0.5, 0.5,
-3.597665, -2, -6.401162, 0, 1.5, 0.5, 0.5,
-3.597665, -1, -6.401162, 0, -0.5, 0.5, 0.5,
-3.597665, -1, -6.401162, 1, -0.5, 0.5, 0.5,
-3.597665, -1, -6.401162, 1, 1.5, 0.5, 0.5,
-3.597665, -1, -6.401162, 0, 1.5, 0.5, 0.5,
-3.597665, 0, -6.401162, 0, -0.5, 0.5, 0.5,
-3.597665, 0, -6.401162, 1, -0.5, 0.5, 0.5,
-3.597665, 0, -6.401162, 1, 1.5, 0.5, 0.5,
-3.597665, 0, -6.401162, 0, 1.5, 0.5, 0.5,
-3.597665, 1, -6.401162, 0, -0.5, 0.5, 0.5,
-3.597665, 1, -6.401162, 1, -0.5, 0.5, 0.5,
-3.597665, 1, -6.401162, 1, 1.5, 0.5, 0.5,
-3.597665, 1, -6.401162, 0, 1.5, 0.5, 0.5,
-3.597665, 2, -6.401162, 0, -0.5, 0.5, 0.5,
-3.597665, 2, -6.401162, 1, -0.5, 0.5, 0.5,
-3.597665, 2, -6.401162, 1, 1.5, 0.5, 0.5,
-3.597665, 2, -6.401162, 0, 1.5, 0.5, 0.5
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
-3.094113, -3.950238, -4,
-3.094113, -3.950238, 4,
-3.094113, -3.950238, -4,
-3.261964, -4.126222, -4,
-3.094113, -3.950238, -2,
-3.261964, -4.126222, -2,
-3.094113, -3.950238, 0,
-3.261964, -4.126222, 0,
-3.094113, -3.950238, 2,
-3.261964, -4.126222, 2,
-3.094113, -3.950238, 4,
-3.261964, -4.126222, 4
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
-3.597665, -4.47819, -4, 0, -0.5, 0.5, 0.5,
-3.597665, -4.47819, -4, 1, -0.5, 0.5, 0.5,
-3.597665, -4.47819, -4, 1, 1.5, 0.5, 0.5,
-3.597665, -4.47819, -4, 0, 1.5, 0.5, 0.5,
-3.597665, -4.47819, -2, 0, -0.5, 0.5, 0.5,
-3.597665, -4.47819, -2, 1, -0.5, 0.5, 0.5,
-3.597665, -4.47819, -2, 1, 1.5, 0.5, 0.5,
-3.597665, -4.47819, -2, 0, 1.5, 0.5, 0.5,
-3.597665, -4.47819, 0, 0, -0.5, 0.5, 0.5,
-3.597665, -4.47819, 0, 1, -0.5, 0.5, 0.5,
-3.597665, -4.47819, 0, 1, 1.5, 0.5, 0.5,
-3.597665, -4.47819, 0, 0, 1.5, 0.5, 0.5,
-3.597665, -4.47819, 2, 0, -0.5, 0.5, 0.5,
-3.597665, -4.47819, 2, 1, -0.5, 0.5, 0.5,
-3.597665, -4.47819, 2, 1, 1.5, 0.5, 0.5,
-3.597665, -4.47819, 2, 0, 1.5, 0.5, 0.5,
-3.597665, -4.47819, 4, 0, -0.5, 0.5, 0.5,
-3.597665, -4.47819, 4, 1, -0.5, 0.5, 0.5,
-3.597665, -4.47819, 4, 1, 1.5, 0.5, 0.5,
-3.597665, -4.47819, 4, 0, 1.5, 0.5, 0.5
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
-3.094113, -3.950238, -5.531793,
-3.094113, 3.089132, -5.531793,
-3.094113, -3.950238, 6.059806,
-3.094113, 3.089132, 6.059806,
-3.094113, -3.950238, -5.531793,
-3.094113, -3.950238, 6.059806,
-3.094113, 3.089132, -5.531793,
-3.094113, 3.089132, 6.059806,
-3.094113, -3.950238, -5.531793,
3.61991, -3.950238, -5.531793,
-3.094113, -3.950238, 6.059806,
3.61991, -3.950238, 6.059806,
-3.094113, 3.089132, -5.531793,
3.61991, 3.089132, -5.531793,
-3.094113, 3.089132, 6.059806,
3.61991, 3.089132, 6.059806,
3.61991, -3.950238, -5.531793,
3.61991, 3.089132, -5.531793,
3.61991, -3.950238, 6.059806,
3.61991, 3.089132, 6.059806,
3.61991, -3.950238, -5.531793,
3.61991, -3.950238, 6.059806,
3.61991, 3.089132, -5.531793,
3.61991, 3.089132, 6.059806
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
var radius = 8.080522;
var distance = 35.95115;
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
mvMatrix.translate( -0.2628986, 0.4305528, -0.2640066 );
mvMatrix.scale( 1.301279, 1.241136, 0.7537199 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.95115);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Pyrethrin<-read.table("Pyrethrin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Pyrethrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Pyrethrin' not found
```

```r
y<-Pyrethrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Pyrethrin' not found
```

```r
z<-Pyrethrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Pyrethrin' not found
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
-2.996336, 2.519759, -1.190015, 0, 0, 1, 1, 1,
-2.716669, -0.6997257, -1.601065, 1, 0, 0, 1, 1,
-2.691484, -0.3905612, -1.282346, 1, 0, 0, 1, 1,
-2.623645, -1.170999, -0.5552325, 1, 0, 0, 1, 1,
-2.561854, -1.100867, -3.364155, 1, 0, 0, 1, 1,
-2.472675, 0.1496629, -0.8846449, 1, 0, 0, 1, 1,
-2.384674, -0.09689558, -1.126431, 0, 0, 0, 1, 1,
-2.36097, -0.77082, -0.8587641, 0, 0, 0, 1, 1,
-2.310615, 0.3210949, -2.190784, 0, 0, 0, 1, 1,
-2.249102, -0.4873743, -1.007103, 0, 0, 0, 1, 1,
-2.215318, -0.9175254, -1.678969, 0, 0, 0, 1, 1,
-2.210749, 0.858977, -1.105598, 0, 0, 0, 1, 1,
-2.201793, -0.544275, -1.504908, 0, 0, 0, 1, 1,
-2.198885, -0.09910409, -1.661822, 1, 1, 1, 1, 1,
-2.195873, -0.2711234, -0.96995, 1, 1, 1, 1, 1,
-2.186892, 1.435409, -0.8225347, 1, 1, 1, 1, 1,
-2.173205, -0.5020317, -2.79246, 1, 1, 1, 1, 1,
-2.127796, -0.1339106, -0.1245271, 1, 1, 1, 1, 1,
-2.119328, -2.354002, -3.674323, 1, 1, 1, 1, 1,
-2.072491, 0.5054311, -3.116704, 1, 1, 1, 1, 1,
-2.063647, 0.7895272, -1.407742, 1, 1, 1, 1, 1,
-2.06232, -0.2079557, -3.309379, 1, 1, 1, 1, 1,
-2.057733, 1.010184, -1.359595, 1, 1, 1, 1, 1,
-2.037674, -1.022673, -0.5669362, 1, 1, 1, 1, 1,
-2.029431, -2.233315, -2.013899, 1, 1, 1, 1, 1,
-2.023218, 0.6720831, -1.418965, 1, 1, 1, 1, 1,
-2.010541, 0.5941508, -0.9477731, 1, 1, 1, 1, 1,
-1.996285, -0.1486663, -0.6193635, 1, 1, 1, 1, 1,
-1.991535, -0.195458, -2.552272, 0, 0, 1, 1, 1,
-1.9716, 1.787301, 0.1115747, 1, 0, 0, 1, 1,
-1.966164, 2.008118, -1.070593, 1, 0, 0, 1, 1,
-1.96358, 1.417976, -2.103794, 1, 0, 0, 1, 1,
-1.917741, -0.6458973, -3.397586, 1, 0, 0, 1, 1,
-1.913783, -0.7858605, -2.416498, 1, 0, 0, 1, 1,
-1.89844, 0.2879001, -1.632888, 0, 0, 0, 1, 1,
-1.871139, 0.3604789, -2.260812, 0, 0, 0, 1, 1,
-1.869033, 0.293533, -2.746742, 0, 0, 0, 1, 1,
-1.841933, 0.4163993, -2.768602, 0, 0, 0, 1, 1,
-1.821046, -0.94836, -1.468529, 0, 0, 0, 1, 1,
-1.786726, -0.7097479, -2.514699, 0, 0, 0, 1, 1,
-1.770561, 0.947869, -2.962418, 0, 0, 0, 1, 1,
-1.759094, 0.8721611, -1.032736, 1, 1, 1, 1, 1,
-1.756664, -0.2069541, -3.164297, 1, 1, 1, 1, 1,
-1.739428, -0.6670189, -2.731078, 1, 1, 1, 1, 1,
-1.737372, 0.3962811, -1.770088, 1, 1, 1, 1, 1,
-1.7348, 0.5439854, -0.2825256, 1, 1, 1, 1, 1,
-1.711534, -0.8564672, -0.6763344, 1, 1, 1, 1, 1,
-1.689255, -0.02919411, -1.043802, 1, 1, 1, 1, 1,
-1.688518, 0.5887413, -1.370947, 1, 1, 1, 1, 1,
-1.648874, -0.6856758, -2.280663, 1, 1, 1, 1, 1,
-1.648806, 0.9949584, -1.054872, 1, 1, 1, 1, 1,
-1.648459, -0.9152033, -1.10492, 1, 1, 1, 1, 1,
-1.640957, -0.3771573, -1.655554, 1, 1, 1, 1, 1,
-1.634212, 0.6039537, -0.4054378, 1, 1, 1, 1, 1,
-1.617108, -1.045547, -0.2499621, 1, 1, 1, 1, 1,
-1.610727, -1.725516, -2.279548, 1, 1, 1, 1, 1,
-1.607667, 0.6569934, 0.05630497, 0, 0, 1, 1, 1,
-1.602546, -0.1642815, -2.959228, 1, 0, 0, 1, 1,
-1.602042, 0.4731374, -0.8124451, 1, 0, 0, 1, 1,
-1.594858, -0.2535933, -1.775501, 1, 0, 0, 1, 1,
-1.588937, -0.2682045, -2.293236, 1, 0, 0, 1, 1,
-1.58449, 0.3958739, -1.838878, 1, 0, 0, 1, 1,
-1.574865, -0.4721005, -2.004874, 0, 0, 0, 1, 1,
-1.566465, 1.253199, -1.304783, 0, 0, 0, 1, 1,
-1.562666, 0.81777, -0.622683, 0, 0, 0, 1, 1,
-1.558295, -0.1367249, -1.390751, 0, 0, 0, 1, 1,
-1.555282, 0.2793102, -1.89017, 0, 0, 0, 1, 1,
-1.544846, 0.2073157, -2.386477, 0, 0, 0, 1, 1,
-1.544587, -0.6092467, -1.094492, 0, 0, 0, 1, 1,
-1.526701, -1.605781, -3.20726, 1, 1, 1, 1, 1,
-1.503961, -0.0367364, -2.388276, 1, 1, 1, 1, 1,
-1.483936, -1.149271, -3.014232, 1, 1, 1, 1, 1,
-1.483871, -1.002398, -2.281575, 1, 1, 1, 1, 1,
-1.478004, -2.095642, -3.856648, 1, 1, 1, 1, 1,
-1.468674, 1.387806, -1.765079, 1, 1, 1, 1, 1,
-1.468499, -0.9556682, -2.159385, 1, 1, 1, 1, 1,
-1.468392, -1.074126, -2.171077, 1, 1, 1, 1, 1,
-1.434671, 0.03041167, -2.363266, 1, 1, 1, 1, 1,
-1.416038, -0.1455934, -3.929423, 1, 1, 1, 1, 1,
-1.407811, -1.59181, -0.2929778, 1, 1, 1, 1, 1,
-1.406918, -2.318887, -2.65464, 1, 1, 1, 1, 1,
-1.396053, 0.03501142, -1.346457, 1, 1, 1, 1, 1,
-1.388873, -1.012226, -1.65432, 1, 1, 1, 1, 1,
-1.384069, -0.7229245, -3.062497, 1, 1, 1, 1, 1,
-1.381549, -1.669311, -2.10064, 0, 0, 1, 1, 1,
-1.370226, -0.3174725, -0.8194028, 1, 0, 0, 1, 1,
-1.368855, -2.151729, -2.377777, 1, 0, 0, 1, 1,
-1.360854, 0.01700943, -0.5296462, 1, 0, 0, 1, 1,
-1.360614, 0.3502679, -1.064288, 1, 0, 0, 1, 1,
-1.357772, -0.2715908, -2.094451, 1, 0, 0, 1, 1,
-1.356272, -1.480991, -1.553886, 0, 0, 0, 1, 1,
-1.345765, 1.277165, 0.3897243, 0, 0, 0, 1, 1,
-1.344403, 0.5701973, -0.6145405, 0, 0, 0, 1, 1,
-1.3402, -0.2188401, -1.638648, 0, 0, 0, 1, 1,
-1.326989, 0.2273082, -1.810308, 0, 0, 0, 1, 1,
-1.320682, -1.23095, -2.203931, 0, 0, 0, 1, 1,
-1.319987, 1.827778, -1.368984, 0, 0, 0, 1, 1,
-1.316829, 1.137066, -1.424341, 1, 1, 1, 1, 1,
-1.312412, 0.2773498, -3.844981, 1, 1, 1, 1, 1,
-1.308273, 0.8620042, -1.478599, 1, 1, 1, 1, 1,
-1.30743, 0.4823879, -0.03571172, 1, 1, 1, 1, 1,
-1.292764, -0.6799374, -1.658658, 1, 1, 1, 1, 1,
-1.275202, -0.2907053, -1.392318, 1, 1, 1, 1, 1,
-1.270942, 0.158285, -2.290804, 1, 1, 1, 1, 1,
-1.270248, -0.002378537, -0.8003849, 1, 1, 1, 1, 1,
-1.270217, 0.336329, -1.353595, 1, 1, 1, 1, 1,
-1.269822, 0.3076396, -1.637897, 1, 1, 1, 1, 1,
-1.269221, -2.294878, -0.7158706, 1, 1, 1, 1, 1,
-1.267827, 0.9543306, -1.957222, 1, 1, 1, 1, 1,
-1.262034, -0.4288468, -2.44185, 1, 1, 1, 1, 1,
-1.260324, -0.3914146, -3.519488, 1, 1, 1, 1, 1,
-1.249258, 2.742711, -0.1501676, 1, 1, 1, 1, 1,
-1.24298, 0.6125196, -1.003537, 0, 0, 1, 1, 1,
-1.24096, -0.6360617, -0.8068915, 1, 0, 0, 1, 1,
-1.237555, -0.04659541, -0.578692, 1, 0, 0, 1, 1,
-1.23603, 1.522945, -0.1587295, 1, 0, 0, 1, 1,
-1.23532, 0.4682325, -1.458584, 1, 0, 0, 1, 1,
-1.230015, 2.088652, -1.409984, 1, 0, 0, 1, 1,
-1.229759, 1.32855, -0.5614576, 0, 0, 0, 1, 1,
-1.223071, -0.8245319, 0.3610168, 0, 0, 0, 1, 1,
-1.222024, 0.1264992, -1.453784, 0, 0, 0, 1, 1,
-1.218276, 0.6955252, -1.120005, 0, 0, 0, 1, 1,
-1.216079, 0.6107867, 0.1003786, 0, 0, 0, 1, 1,
-1.214409, -1.541863, -4.727626, 0, 0, 0, 1, 1,
-1.213511, -0.8305821, -1.591583, 0, 0, 0, 1, 1,
-1.207197, 0.03672019, -1.861476, 1, 1, 1, 1, 1,
-1.206027, -0.4187315, -0.7796933, 1, 1, 1, 1, 1,
-1.203375, 0.01117765, -2.489285, 1, 1, 1, 1, 1,
-1.198764, -1.098704, -1.890567, 1, 1, 1, 1, 1,
-1.194324, 1.309511, -1.112775, 1, 1, 1, 1, 1,
-1.183415, 0.7850643, 0.02423794, 1, 1, 1, 1, 1,
-1.181171, 0.01493162, -1.260609, 1, 1, 1, 1, 1,
-1.174359, -0.3432724, -2.11781, 1, 1, 1, 1, 1,
-1.17081, -0.2188402, -1.783385, 1, 1, 1, 1, 1,
-1.168299, -0.2603187, -3.084898, 1, 1, 1, 1, 1,
-1.147962, -0.7415942, -0.1297223, 1, 1, 1, 1, 1,
-1.146507, -1.187285, -2.835942, 1, 1, 1, 1, 1,
-1.145532, -0.5128539, -2.713111, 1, 1, 1, 1, 1,
-1.145124, -1.309923, -1.999209, 1, 1, 1, 1, 1,
-1.141574, 1.359868, -1.379788, 1, 1, 1, 1, 1,
-1.141276, -0.7168735, -1.619799, 0, 0, 1, 1, 1,
-1.140074, 0.06898931, -1.816759, 1, 0, 0, 1, 1,
-1.132876, 1.364959, 0.4897559, 1, 0, 0, 1, 1,
-1.114319, 0.9955584, -2.728372, 1, 0, 0, 1, 1,
-1.088453, -0.0143712, -1.388851, 1, 0, 0, 1, 1,
-1.083753, 0.9469408, -0.2164969, 1, 0, 0, 1, 1,
-1.079793, 0.4142711, -0.5904414, 0, 0, 0, 1, 1,
-1.077651, 0.744954, -2.011759, 0, 0, 0, 1, 1,
-1.077304, -2.295888, -1.825422, 0, 0, 0, 1, 1,
-1.070477, 1.726997, -0.9156143, 0, 0, 0, 1, 1,
-1.069681, -1.900946, -2.238891, 0, 0, 0, 1, 1,
-1.066624, 0.2605058, -1.915136, 0, 0, 0, 1, 1,
-1.063896, 0.03760493, -3.162868, 0, 0, 0, 1, 1,
-1.062853, -0.6269247, -3.106657, 1, 1, 1, 1, 1,
-1.06256, 2.986617, -0.4639631, 1, 1, 1, 1, 1,
-1.051331, 0.7651694, -1.85327, 1, 1, 1, 1, 1,
-1.049185, 0.2343285, -0.1630401, 1, 1, 1, 1, 1,
-1.04683, -0.1889448, -2.268793, 1, 1, 1, 1, 1,
-1.042174, 0.7014889, -1.168767, 1, 1, 1, 1, 1,
-1.040619, -2.552456, -2.996442, 1, 1, 1, 1, 1,
-1.032116, -0.3513399, -2.673074, 1, 1, 1, 1, 1,
-1.029942, 0.7649689, -1.003589, 1, 1, 1, 1, 1,
-1.02841, -1.302046, -1.321181, 1, 1, 1, 1, 1,
-1.025895, 0.6094577, -1.695755, 1, 1, 1, 1, 1,
-1.024946, 0.6648064, -2.6295, 1, 1, 1, 1, 1,
-1.022636, -2.241816, -2.795451, 1, 1, 1, 1, 1,
-1.011096, 1.017876, -0.5547503, 1, 1, 1, 1, 1,
-1.00705, 1.184572, -1.351219, 1, 1, 1, 1, 1,
-1.006982, -0.8375568, -1.669625, 0, 0, 1, 1, 1,
-1.004792, 1.516088, 0.9351143, 1, 0, 0, 1, 1,
-1.004236, 0.1119266, -0.2184971, 1, 0, 0, 1, 1,
-1.004166, 0.547394, -1.103248, 1, 0, 0, 1, 1,
-0.9986987, -0.695008, -2.578436, 1, 0, 0, 1, 1,
-0.9926199, -0.08041795, -2.56159, 1, 0, 0, 1, 1,
-0.9919183, 1.528966, 1.287615, 0, 0, 0, 1, 1,
-0.9910466, -1.091389, -3.890197, 0, 0, 0, 1, 1,
-0.9896349, 0.4101305, -1.077217, 0, 0, 0, 1, 1,
-0.9829456, 1.158783, -0.5707961, 0, 0, 0, 1, 1,
-0.9827722, -0.5087607, -1.926781, 0, 0, 0, 1, 1,
-0.9820385, 0.4035345, -0.7106888, 0, 0, 0, 1, 1,
-0.9783589, 0.1520288, -2.764243, 0, 0, 0, 1, 1,
-0.9689255, 1.333222, 0.9932483, 1, 1, 1, 1, 1,
-0.9670715, -0.06889272, -2.081215, 1, 1, 1, 1, 1,
-0.966133, 0.2804094, -1.647751, 1, 1, 1, 1, 1,
-0.9589264, 1.020039, -0.02093996, 1, 1, 1, 1, 1,
-0.9528825, -0.7896783, -2.32147, 1, 1, 1, 1, 1,
-0.9513363, 1.686037, -1.558106, 1, 1, 1, 1, 1,
-0.9386241, 0.1157061, -2.28886, 1, 1, 1, 1, 1,
-0.9329397, 0.482981, -0.6729088, 1, 1, 1, 1, 1,
-0.9310412, 1.289, -0.7211103, 1, 1, 1, 1, 1,
-0.9309309, 0.265216, -1.55237, 1, 1, 1, 1, 1,
-0.9228997, -0.6325215, -0.7490656, 1, 1, 1, 1, 1,
-0.9151558, -0.4502699, -2.147127, 1, 1, 1, 1, 1,
-0.9147286, 0.6050804, -1.349857, 1, 1, 1, 1, 1,
-0.8984985, -0.5302565, -1.973869, 1, 1, 1, 1, 1,
-0.8851584, 0.4642165, -1.203954, 1, 1, 1, 1, 1,
-0.8833697, -1.668341, -3.842894, 0, 0, 1, 1, 1,
-0.8823569, 0.08352238, -1.005091, 1, 0, 0, 1, 1,
-0.8813937, -0.4454923, -3.510118, 1, 0, 0, 1, 1,
-0.8779681, -0.05943336, -0.723592, 1, 0, 0, 1, 1,
-0.8740534, -0.9593884, -5.048462, 1, 0, 0, 1, 1,
-0.8711693, 0.8011168, -1.153506, 1, 0, 0, 1, 1,
-0.8694842, 0.9503976, 0.3380414, 0, 0, 0, 1, 1,
-0.8693931, 1.40705, -0.6248601, 0, 0, 0, 1, 1,
-0.8657281, -1.840931, -3.922377, 0, 0, 0, 1, 1,
-0.8633959, 0.87075, -0.6840608, 0, 0, 0, 1, 1,
-0.8616925, 2.555521, 0.4653067, 0, 0, 0, 1, 1,
-0.8615129, 1.325677, -1.292788, 0, 0, 0, 1, 1,
-0.8548371, -0.8965924, -3.616734, 0, 0, 0, 1, 1,
-0.8520693, 1.164509, -1.249217, 1, 1, 1, 1, 1,
-0.8498623, 0.789968, 1.405565, 1, 1, 1, 1, 1,
-0.8471196, 0.8487988, -2.907519, 1, 1, 1, 1, 1,
-0.8434264, -0.2459204, -3.718747, 1, 1, 1, 1, 1,
-0.8404124, 0.6548486, -1.664939, 1, 1, 1, 1, 1,
-0.8382466, 1.035849, 0.05658814, 1, 1, 1, 1, 1,
-0.8342468, 1.421259, -0.3755521, 1, 1, 1, 1, 1,
-0.8335181, 0.280219, -1.582605, 1, 1, 1, 1, 1,
-0.8260262, -0.8783044, -3.10384, 1, 1, 1, 1, 1,
-0.8253509, -2.151154, -1.009329, 1, 1, 1, 1, 1,
-0.8195494, 1.648865, -1.0076, 1, 1, 1, 1, 1,
-0.8164464, 0.9854758, -0.1203515, 1, 1, 1, 1, 1,
-0.809079, 0.7191791, -2.028706, 1, 1, 1, 1, 1,
-0.8012153, -1.269019, -3.400477, 1, 1, 1, 1, 1,
-0.7996578, 0.7214698, -0.1802884, 1, 1, 1, 1, 1,
-0.7910619, 0.01267211, -1.025473, 0, 0, 1, 1, 1,
-0.7868738, -1.112646, -4.241273, 1, 0, 0, 1, 1,
-0.7821063, -0.3405001, -1.818138, 1, 0, 0, 1, 1,
-0.7790571, 1.093671, -1.997318, 1, 0, 0, 1, 1,
-0.7772628, -1.831169, -1.717764, 1, 0, 0, 1, 1,
-0.7748136, -0.8526458, -1.091471, 1, 0, 0, 1, 1,
-0.7741006, 0.541206, 0.06380356, 0, 0, 0, 1, 1,
-0.7688763, -0.5989056, -1.775501, 0, 0, 0, 1, 1,
-0.7672808, -1.581825, -1.06074, 0, 0, 0, 1, 1,
-0.7653866, -0.530434, -1.811213, 0, 0, 0, 1, 1,
-0.764701, -0.6580787, -2.374804, 0, 0, 0, 1, 1,
-0.7630078, -0.9853507, -1.410295, 0, 0, 0, 1, 1,
-0.7618824, -2.259188, -2.382201, 0, 0, 0, 1, 1,
-0.7607865, -0.3222104, -1.072829, 1, 1, 1, 1, 1,
-0.7523779, -1.105502, -2.528099, 1, 1, 1, 1, 1,
-0.744759, 0.3384675, -1.109531, 1, 1, 1, 1, 1,
-0.7424852, 0.1643584, -0.8902795, 1, 1, 1, 1, 1,
-0.7424084, -0.5383703, -2.887666, 1, 1, 1, 1, 1,
-0.7412526, -0.5663181, -2.686367, 1, 1, 1, 1, 1,
-0.739481, -0.3124965, -0.93249, 1, 1, 1, 1, 1,
-0.732466, -0.322029, -4.071971, 1, 1, 1, 1, 1,
-0.7318937, 0.2834328, -0.7662693, 1, 1, 1, 1, 1,
-0.7303463, -0.8313453, -1.285957, 1, 1, 1, 1, 1,
-0.72898, -0.4127695, -2.433758, 1, 1, 1, 1, 1,
-0.7264359, -0.4784614, -1.145883, 1, 1, 1, 1, 1,
-0.7260733, -1.466308, -2.025274, 1, 1, 1, 1, 1,
-0.7229921, 0.769086, -1.332071, 1, 1, 1, 1, 1,
-0.7192904, -1.19549, -3.027755, 1, 1, 1, 1, 1,
-0.7155909, 1.054254, 1.309667, 0, 0, 1, 1, 1,
-0.713986, 1.269143, -1.008406, 1, 0, 0, 1, 1,
-0.7061186, -0.1858542, -0.3446152, 1, 0, 0, 1, 1,
-0.7025451, 0.9943364, 0.1847969, 1, 0, 0, 1, 1,
-0.694558, -0.6500524, -2.569058, 1, 0, 0, 1, 1,
-0.6778063, 0.4468332, -1.172528, 1, 0, 0, 1, 1,
-0.6768956, -0.8656467, -1.854523, 0, 0, 0, 1, 1,
-0.6715918, -1.326742, -3.674193, 0, 0, 0, 1, 1,
-0.6698124, 0.2810169, -2.692569, 0, 0, 0, 1, 1,
-0.6675078, -1.172779, -3.321656, 0, 0, 0, 1, 1,
-0.6651993, 0.1312451, -2.703248, 0, 0, 0, 1, 1,
-0.66421, 0.4393241, -0.1039089, 0, 0, 0, 1, 1,
-0.6621279, -0.5200073, -2.584569, 0, 0, 0, 1, 1,
-0.6615921, 1.236079, -0.5736352, 1, 1, 1, 1, 1,
-0.6555375, -0.8936397, -5.362983, 1, 1, 1, 1, 1,
-0.6550395, 1.151173, -0.8280182, 1, 1, 1, 1, 1,
-0.6512697, -0.8803768, -1.671377, 1, 1, 1, 1, 1,
-0.6499887, -0.2711927, -1.207062, 1, 1, 1, 1, 1,
-0.6477925, 0.08131861, -2.292567, 1, 1, 1, 1, 1,
-0.6445332, -0.9502723, -1.755889, 1, 1, 1, 1, 1,
-0.6418323, 0.1501446, -1.641245, 1, 1, 1, 1, 1,
-0.6398472, -0.08787639, -1.532306, 1, 1, 1, 1, 1,
-0.6394293, 0.4472208, -1.025355, 1, 1, 1, 1, 1,
-0.6389362, 0.614108, -0.9956582, 1, 1, 1, 1, 1,
-0.6351668, 0.3091446, -1.024347, 1, 1, 1, 1, 1,
-0.6345525, 0.3445148, -0.9007222, 1, 1, 1, 1, 1,
-0.6284571, -0.4141066, -1.515343, 1, 1, 1, 1, 1,
-0.6247433, 0.2169335, -0.7124258, 1, 1, 1, 1, 1,
-0.6155702, 0.09395096, -0.1356292, 0, 0, 1, 1, 1,
-0.6151261, -0.7541982, -0.8348461, 1, 0, 0, 1, 1,
-0.6138233, -0.06706072, -2.769227, 1, 0, 0, 1, 1,
-0.6119041, -1.051684, -2.801167, 1, 0, 0, 1, 1,
-0.6061443, 0.07449103, -0.9905801, 1, 0, 0, 1, 1,
-0.6060638, -0.9740617, -2.523554, 1, 0, 0, 1, 1,
-0.6059603, 1.216155, -0.2786035, 0, 0, 0, 1, 1,
-0.5989368, 1.079066, -0.9544013, 0, 0, 0, 1, 1,
-0.5969328, -0.5328054, -1.531068, 0, 0, 0, 1, 1,
-0.5965314, 1.502133, -0.8470507, 0, 0, 0, 1, 1,
-0.5945972, -0.1191812, 0.2722194, 0, 0, 0, 1, 1,
-0.5945031, 1.798254, 0.8483217, 0, 0, 0, 1, 1,
-0.5863438, 1.916264, -1.483841, 0, 0, 0, 1, 1,
-0.5837154, 1.854113, 0.8903612, 1, 1, 1, 1, 1,
-0.5835742, 0.2502277, -0.01514274, 1, 1, 1, 1, 1,
-0.5803903, 0.3514958, 0.03278792, 1, 1, 1, 1, 1,
-0.5777919, 2.279296, 0.3341586, 1, 1, 1, 1, 1,
-0.573483, 1.804531, 0.6748068, 1, 1, 1, 1, 1,
-0.5669556, 0.4625538, -1.2593, 1, 1, 1, 1, 1,
-0.5637871, -1.437502, -3.610478, 1, 1, 1, 1, 1,
-0.5620884, 0.08114466, 0.001128173, 1, 1, 1, 1, 1,
-0.5613844, 1.174691, -2.854411, 1, 1, 1, 1, 1,
-0.5597149, -0.07816627, -3.410082, 1, 1, 1, 1, 1,
-0.544029, 0.03394099, -0.9410742, 1, 1, 1, 1, 1,
-0.5419735, 0.4993829, -0.3899023, 1, 1, 1, 1, 1,
-0.5417644, -0.7967163, -3.030444, 1, 1, 1, 1, 1,
-0.5361613, 0.8607886, 1.826838, 1, 1, 1, 1, 1,
-0.5307162, 1.336663, -0.009606117, 1, 1, 1, 1, 1,
-0.5284447, 1.54106, -0.02698107, 0, 0, 1, 1, 1,
-0.5274671, -0.7582393, -4.102135, 1, 0, 0, 1, 1,
-0.5272075, 0.7658881, -2.249537, 1, 0, 0, 1, 1,
-0.5262367, 1.087695, -0.4637302, 1, 0, 0, 1, 1,
-0.5226609, 0.3701562, -1.174429, 1, 0, 0, 1, 1,
-0.5210379, -0.2777692, -1.405579, 1, 0, 0, 1, 1,
-0.5174013, 0.2903573, -2.24584, 0, 0, 0, 1, 1,
-0.5165252, -1.342822, -2.841824, 0, 0, 0, 1, 1,
-0.5146269, 0.5101122, -1.198377, 0, 0, 0, 1, 1,
-0.5099324, 0.5694847, -0.9336981, 0, 0, 0, 1, 1,
-0.5044447, -0.5385275, -1.715255, 0, 0, 0, 1, 1,
-0.5029443, 0.9779007, 1.696596, 0, 0, 0, 1, 1,
-0.4961966, -1.340372, -2.224169, 0, 0, 0, 1, 1,
-0.4947205, 0.04019911, -2.024477, 1, 1, 1, 1, 1,
-0.4837817, 0.8335363, -1.613474, 1, 1, 1, 1, 1,
-0.4798321, 0.2548976, -0.7518466, 1, 1, 1, 1, 1,
-0.4775346, -1.185974, -3.116032, 1, 1, 1, 1, 1,
-0.4692608, -0.6573807, -1.842491, 1, 1, 1, 1, 1,
-0.4597108, 0.3156414, -1.009843, 1, 1, 1, 1, 1,
-0.4587093, -0.2624823, -2.37552, 1, 1, 1, 1, 1,
-0.4560152, -0.8228897, -3.635408, 1, 1, 1, 1, 1,
-0.4559188, 0.6328233, -0.5541376, 1, 1, 1, 1, 1,
-0.4539587, -0.3312006, -2.884954, 1, 1, 1, 1, 1,
-0.4529928, 0.3871589, -0.8879748, 1, 1, 1, 1, 1,
-0.4496141, -0.1207136, -3.941013, 1, 1, 1, 1, 1,
-0.4477948, -0.04808276, -2.738782, 1, 1, 1, 1, 1,
-0.4467069, -0.1201658, -1.06041, 1, 1, 1, 1, 1,
-0.4424425, -0.8844872, -2.115547, 1, 1, 1, 1, 1,
-0.4381307, 0.05908183, -1.945228, 0, 0, 1, 1, 1,
-0.4374668, 0.4321238, -0.3263743, 1, 0, 0, 1, 1,
-0.4364941, -0.03380251, -2.533422, 1, 0, 0, 1, 1,
-0.4352717, -0.7195576, -1.844042, 1, 0, 0, 1, 1,
-0.4303858, 1.079561, -0.4008766, 1, 0, 0, 1, 1,
-0.424994, 0.6903274, -1.311341, 1, 0, 0, 1, 1,
-0.4173393, -0.3548488, -2.445555, 0, 0, 0, 1, 1,
-0.4166034, -1.093826, -1.614512, 0, 0, 0, 1, 1,
-0.4156439, 1.616315, -1.404564, 0, 0, 0, 1, 1,
-0.4135388, 0.08471987, -2.878227, 0, 0, 0, 1, 1,
-0.4132328, 0.10465, -1.747192, 0, 0, 0, 1, 1,
-0.4103568, 0.2672371, 1.073225, 0, 0, 0, 1, 1,
-0.4096104, -0.2507683, -3.155455, 0, 0, 0, 1, 1,
-0.4075316, 1.04838, -0.9298757, 1, 1, 1, 1, 1,
-0.4063955, 0.3920672, -1.168399, 1, 1, 1, 1, 1,
-0.404059, 1.897699, 0.5977234, 1, 1, 1, 1, 1,
-0.3994093, 0.8750899, -0.9493986, 1, 1, 1, 1, 1,
-0.3974626, -0.3988772, -2.836207, 1, 1, 1, 1, 1,
-0.3971671, -0.6729046, -3.420734, 1, 1, 1, 1, 1,
-0.3948533, -2.151925, -3.986624, 1, 1, 1, 1, 1,
-0.3923607, -1.002745, -4.1764, 1, 1, 1, 1, 1,
-0.3916931, -0.1980621, -3.036411, 1, 1, 1, 1, 1,
-0.3871424, 0.6171215, 0.5159611, 1, 1, 1, 1, 1,
-0.3869638, 2.088385, 0.05703636, 1, 1, 1, 1, 1,
-0.385886, 0.3293957, 0.5552087, 1, 1, 1, 1, 1,
-0.3826349, -1.799646, -2.154294, 1, 1, 1, 1, 1,
-0.3812906, -0.02657429, -3.059734, 1, 1, 1, 1, 1,
-0.3793197, 0.6055334, -2.696764, 1, 1, 1, 1, 1,
-0.3792455, 0.006687264, -0.3595932, 0, 0, 1, 1, 1,
-0.3778923, 0.6791914, -1.680261, 1, 0, 0, 1, 1,
-0.37776, 0.7293595, -1.135633, 1, 0, 0, 1, 1,
-0.3763189, -0.04691012, -3.559199, 1, 0, 0, 1, 1,
-0.3754433, 0.9861869, -0.3721544, 1, 0, 0, 1, 1,
-0.373558, 0.1560113, -1.096554, 1, 0, 0, 1, 1,
-0.3734364, 1.235616, -1.632016, 0, 0, 0, 1, 1,
-0.363949, -1.921698, -3.942967, 0, 0, 0, 1, 1,
-0.3579034, 0.1788333, -0.1492373, 0, 0, 0, 1, 1,
-0.3572291, 0.6258537, -0.6424947, 0, 0, 0, 1, 1,
-0.3532934, -1.965719, -3.550949, 0, 0, 0, 1, 1,
-0.3485779, 0.02057646, -1.881821, 0, 0, 0, 1, 1,
-0.3464908, -0.5190843, -1.492469, 0, 0, 0, 1, 1,
-0.342277, -0.7944149, -3.336193, 1, 1, 1, 1, 1,
-0.3407452, -1.653028, -2.932259, 1, 1, 1, 1, 1,
-0.3356516, 0.3264872, -0.3623436, 1, 1, 1, 1, 1,
-0.334843, 1.001098, -0.7222431, 1, 1, 1, 1, 1,
-0.3323217, 0.0144725, -2.125411, 1, 1, 1, 1, 1,
-0.3314134, -1.339334, -2.163211, 1, 1, 1, 1, 1,
-0.3298015, 0.3660461, -0.4642819, 1, 1, 1, 1, 1,
-0.3296325, -0.5104194, -2.889258, 1, 1, 1, 1, 1,
-0.3294071, 1.280364, 0.5204124, 1, 1, 1, 1, 1,
-0.3292967, 0.1613935, -0.8516842, 1, 1, 1, 1, 1,
-0.3233252, 1.232197, -0.1095626, 1, 1, 1, 1, 1,
-0.3196079, 0.8931049, -0.1226128, 1, 1, 1, 1, 1,
-0.3153358, -0.6690199, -4.537334, 1, 1, 1, 1, 1,
-0.3150772, 1.761757, 0.5944309, 1, 1, 1, 1, 1,
-0.308859, -0.4027987, -2.676384, 1, 1, 1, 1, 1,
-0.3067642, 1.94291, -1.441795, 0, 0, 1, 1, 1,
-0.3063092, -0.7364563, -3.025487, 1, 0, 0, 1, 1,
-0.3061604, 0.7093713, -1.262297, 1, 0, 0, 1, 1,
-0.3053976, 0.9136989, -0.2114384, 1, 0, 0, 1, 1,
-0.3052532, 1.055354, -0.8580441, 1, 0, 0, 1, 1,
-0.2990157, -1.795201, -2.030365, 1, 0, 0, 1, 1,
-0.2965614, -0.7826785, -1.716266, 0, 0, 0, 1, 1,
-0.2952489, -0.8647269, -2.245238, 0, 0, 0, 1, 1,
-0.2937187, -0.4539855, -2.710966, 0, 0, 0, 1, 1,
-0.2903715, 1.827898, 0.7499382, 0, 0, 0, 1, 1,
-0.2889792, -1.445525, -4.615277, 0, 0, 0, 1, 1,
-0.285092, 0.2422832, -0.5181908, 0, 0, 0, 1, 1,
-0.2839538, -0.5110809, -2.29045, 0, 0, 0, 1, 1,
-0.2826793, -1.234855, -2.551798, 1, 1, 1, 1, 1,
-0.2792252, -0.3967505, -3.238562, 1, 1, 1, 1, 1,
-0.2742585, 0.08564699, -0.18394, 1, 1, 1, 1, 1,
-0.2738664, -0.09311879, -1.883401, 1, 1, 1, 1, 1,
-0.2737901, 0.221834, -2.457903, 1, 1, 1, 1, 1,
-0.26697, 1.2183, 0.4185119, 1, 1, 1, 1, 1,
-0.2572616, -0.337209, -3.694535, 1, 1, 1, 1, 1,
-0.2545851, -0.02855493, -3.957342, 1, 1, 1, 1, 1,
-0.2544514, -0.9646181, -3.739794, 1, 1, 1, 1, 1,
-0.243433, 0.1867363, 1.153839, 1, 1, 1, 1, 1,
-0.2412078, -0.0116237, 0.7877254, 1, 1, 1, 1, 1,
-0.2373794, -0.4924333, -2.666083, 1, 1, 1, 1, 1,
-0.2347145, -1.588762, -3.638408, 1, 1, 1, 1, 1,
-0.2301606, -1.052852, -3.752106, 1, 1, 1, 1, 1,
-0.2280834, -0.9938723, -1.533228, 1, 1, 1, 1, 1,
-0.2258687, -0.6357067, -3.998296, 0, 0, 1, 1, 1,
-0.225338, 2.003083, 1.383131, 1, 0, 0, 1, 1,
-0.2222103, -0.8490862, -3.865543, 1, 0, 0, 1, 1,
-0.2212188, -1.642774, -3.366921, 1, 0, 0, 1, 1,
-0.2205584, -1.846557, -1.646521, 1, 0, 0, 1, 1,
-0.2117575, 0.563473, -0.9985479, 1, 0, 0, 1, 1,
-0.2103796, -0.4590287, -3.211904, 0, 0, 0, 1, 1,
-0.209535, -0.04995645, -0.1336061, 0, 0, 0, 1, 1,
-0.2089335, -2.610013, -3.063305, 0, 0, 0, 1, 1,
-0.2086659, 0.8082626, 0.4176734, 0, 0, 0, 1, 1,
-0.2046832, -2.268393, -2.987852, 0, 0, 0, 1, 1,
-0.2039604, -1.972075, -3.912264, 0, 0, 0, 1, 1,
-0.2031631, -0.2072314, -1.240801, 0, 0, 0, 1, 1,
-0.2007428, -0.3296035, -3.02646, 1, 1, 1, 1, 1,
-0.1961101, -2.009763, -2.731263, 1, 1, 1, 1, 1,
-0.1960408, 0.7844147, 0.007534091, 1, 1, 1, 1, 1,
-0.1956817, -1.498034, -3.794664, 1, 1, 1, 1, 1,
-0.1945478, 0.3325091, -0.659384, 1, 1, 1, 1, 1,
-0.1938502, 0.4522043, 0.4144114, 1, 1, 1, 1, 1,
-0.1927353, 0.1326869, 0.03656321, 1, 1, 1, 1, 1,
-0.1875225, -0.9984407, -2.501383, 1, 1, 1, 1, 1,
-0.1839231, 0.6214017, 1.642897, 1, 1, 1, 1, 1,
-0.1838783, 0.8852852, -0.2597998, 1, 1, 1, 1, 1,
-0.1824716, 1.410142, 0.9509796, 1, 1, 1, 1, 1,
-0.1797732, 0.04616122, -2.343329, 1, 1, 1, 1, 1,
-0.1722038, 0.1125805, -2.327058, 1, 1, 1, 1, 1,
-0.1650113, -2.305201, -4.773499, 1, 1, 1, 1, 1,
-0.1610773, 1.119518, 1.285406, 1, 1, 1, 1, 1,
-0.1577969, 0.1034945, 0.1163427, 0, 0, 1, 1, 1,
-0.1565314, -0.5171518, -3.150246, 1, 0, 0, 1, 1,
-0.1471529, -0.2044967, -2.883481, 1, 0, 0, 1, 1,
-0.1448648, 0.9853909, 0.3448794, 1, 0, 0, 1, 1,
-0.1417528, 1.224806, -2.375732, 1, 0, 0, 1, 1,
-0.1378043, -0.8508801, -3.856843, 1, 0, 0, 1, 1,
-0.1367353, -0.5337262, -3.138168, 0, 0, 0, 1, 1,
-0.1366504, 0.6015808, 0.4464658, 0, 0, 0, 1, 1,
-0.1357709, -0.7074146, -2.957462, 0, 0, 0, 1, 1,
-0.1350489, -1.161047, -4.451474, 0, 0, 0, 1, 1,
-0.1343619, 0.8326474, -1.550193, 0, 0, 0, 1, 1,
-0.1343464, -0.2320807, -2.682305, 0, 0, 0, 1, 1,
-0.1281733, 1.685139, 0.2069319, 0, 0, 0, 1, 1,
-0.1235629, -0.09230925, 0.5740173, 1, 1, 1, 1, 1,
-0.1220936, -0.7610344, -2.794065, 1, 1, 1, 1, 1,
-0.1210912, -1.084546, -2.851416, 1, 1, 1, 1, 1,
-0.1200526, 0.5964578, 0.3597451, 1, 1, 1, 1, 1,
-0.1180087, -0.1365178, -1.983221, 1, 1, 1, 1, 1,
-0.1138896, -0.4377806, -3.071248, 1, 1, 1, 1, 1,
-0.1137796, -0.2196745, -4.186621, 1, 1, 1, 1, 1,
-0.1131339, -0.1178218, -3.401549, 1, 1, 1, 1, 1,
-0.1123645, 0.5610523, 0.806225, 1, 1, 1, 1, 1,
-0.1095904, 0.5821307, -1.697059, 1, 1, 1, 1, 1,
-0.1079882, -0.4439519, -0.7533131, 1, 1, 1, 1, 1,
-0.1057224, -1.923214, -3.421546, 1, 1, 1, 1, 1,
-0.10562, 1.230545, 0.9496104, 1, 1, 1, 1, 1,
-0.09588405, 0.1065652, -0.04156621, 1, 1, 1, 1, 1,
-0.09265018, 0.5000147, 1.272132, 1, 1, 1, 1, 1,
-0.09105711, 0.7763839, 0.2774401, 0, 0, 1, 1, 1,
-0.09045358, 0.04611581, -1.126617, 1, 0, 0, 1, 1,
-0.08835035, 0.6914799, 0.6400625, 1, 0, 0, 1, 1,
-0.08812757, -0.5284279, -3.086128, 1, 0, 0, 1, 1,
-0.08802424, 1.080129, -0.1435674, 1, 0, 0, 1, 1,
-0.08776905, -1.713414, -2.624752, 1, 0, 0, 1, 1,
-0.08264722, 0.2408709, -1.527475, 0, 0, 0, 1, 1,
-0.07983708, -0.3628496, -2.05339, 0, 0, 0, 1, 1,
-0.0788005, 1.365503, 0.03231991, 0, 0, 0, 1, 1,
-0.07747202, -0.7070355, -3.083061, 0, 0, 0, 1, 1,
-0.07651206, 1.075546, -0.15786, 0, 0, 0, 1, 1,
-0.07411397, 0.7375068, -0.9240845, 0, 0, 0, 1, 1,
-0.07410154, -0.1828448, -2.304737, 0, 0, 0, 1, 1,
-0.07403407, -0.9029292, -3.709333, 1, 1, 1, 1, 1,
-0.07049546, -0.3279841, -2.364276, 1, 1, 1, 1, 1,
-0.06975332, -0.9127583, -1.994825, 1, 1, 1, 1, 1,
-0.06647048, 0.8003647, -1.582412, 1, 1, 1, 1, 1,
-0.06060073, -0.1641402, -2.781823, 1, 1, 1, 1, 1,
-0.05549772, 1.194941, 0.4845066, 1, 1, 1, 1, 1,
-0.05070981, -0.07465217, -2.734699, 1, 1, 1, 1, 1,
-0.04648697, 0.9105442, -0.4168175, 1, 1, 1, 1, 1,
-0.04526338, 0.6539471, 0.2059142, 1, 1, 1, 1, 1,
-0.04186661, -0.3520178, -3.118675, 1, 1, 1, 1, 1,
-0.03994339, 0.2549474, -0.3537761, 1, 1, 1, 1, 1,
-0.03932202, 2.196635, -0.1089615, 1, 1, 1, 1, 1,
-0.03888775, -0.3152999, -2.570298, 1, 1, 1, 1, 1,
-0.03800789, -1.347533, -5.057034, 1, 1, 1, 1, 1,
-0.03353718, 0.3039157, 0.2288945, 1, 1, 1, 1, 1,
-0.03295916, 0.638692, 0.98298, 0, 0, 1, 1, 1,
-0.0320904, 1.700979, 1.427964, 1, 0, 0, 1, 1,
-0.03088212, -0.8429468, -2.770331, 1, 0, 0, 1, 1,
-0.02978353, -0.5543661, -3.091375, 1, 0, 0, 1, 1,
-0.02964103, -0.9313222, -3.483936, 1, 0, 0, 1, 1,
-0.02895018, -0.196532, -1.653361, 1, 0, 0, 1, 1,
-0.02848306, -0.05258377, -3.856731, 0, 0, 0, 1, 1,
-0.02801701, -1.441126, -4.138011, 0, 0, 0, 1, 1,
-0.02623931, 1.435366, 0.2670274, 0, 0, 0, 1, 1,
-0.02600545, 1.947636, 0.4163414, 0, 0, 0, 1, 1,
-0.02445451, 0.3267425, 1.087608, 0, 0, 0, 1, 1,
-0.02064938, 0.7148969, -0.2322914, 0, 0, 0, 1, 1,
-0.01461404, 0.3802657, 1.032908, 0, 0, 0, 1, 1,
0.001200324, -0.4707, 1.851062, 1, 1, 1, 1, 1,
0.005494621, -1.069581, 3.042715, 1, 1, 1, 1, 1,
0.00704765, 0.3708683, 0.9434195, 1, 1, 1, 1, 1,
0.01348727, -0.8800151, 1.422802, 1, 1, 1, 1, 1,
0.0134926, 1.341912, 0.4421411, 1, 1, 1, 1, 1,
0.01423798, 1.318684, 0.8626432, 1, 1, 1, 1, 1,
0.01519495, 0.9406492, -0.6196401, 1, 1, 1, 1, 1,
0.02141968, -0.2209366, 3.499867, 1, 1, 1, 1, 1,
0.02177499, -0.5995586, 5.136782, 1, 1, 1, 1, 1,
0.02434484, -0.5508018, 2.283066, 1, 1, 1, 1, 1,
0.02551067, 2.000746, -0.3070987, 1, 1, 1, 1, 1,
0.0269078, 0.9497864, -0.3392211, 1, 1, 1, 1, 1,
0.02772759, -0.5149829, 2.785458, 1, 1, 1, 1, 1,
0.04364011, -0.8544813, 1.885878, 1, 1, 1, 1, 1,
0.04499688, 1.833682, -0.3319229, 1, 1, 1, 1, 1,
0.04858523, 0.2798622, -0.3773107, 0, 0, 1, 1, 1,
0.05042768, -0.717611, 4.42476, 1, 0, 0, 1, 1,
0.05169006, 0.3089261, -0.9302083, 1, 0, 0, 1, 1,
0.05418656, -0.1045993, 1.796354, 1, 0, 0, 1, 1,
0.05874195, -0.7338371, 5.116699, 1, 0, 0, 1, 1,
0.06302438, 0.2475786, -0.1571316, 1, 0, 0, 1, 1,
0.06307513, 1.64042, -1.797302, 0, 0, 0, 1, 1,
0.06329945, -0.8571417, 4.012598, 0, 0, 0, 1, 1,
0.06607991, -1.29992, 2.658515, 0, 0, 0, 1, 1,
0.06711996, -1.388712, 2.811082, 0, 0, 0, 1, 1,
0.07078524, -1.105192, 3.574132, 0, 0, 0, 1, 1,
0.07188541, 0.4080651, -0.5099019, 0, 0, 0, 1, 1,
0.07240868, 0.9812857, -2.35084, 0, 0, 0, 1, 1,
0.07597032, 1.612996, -1.574677, 1, 1, 1, 1, 1,
0.07786714, 1.146653, -1.437307, 1, 1, 1, 1, 1,
0.07949082, 0.005718781, 2.042945, 1, 1, 1, 1, 1,
0.08018148, -0.2204236, 3.89761, 1, 1, 1, 1, 1,
0.08039681, 1.274228, -1.499437, 1, 1, 1, 1, 1,
0.08538024, 0.2427292, 0.05926831, 1, 1, 1, 1, 1,
0.08543501, 0.9318273, -0.2094972, 1, 1, 1, 1, 1,
0.09045295, -0.3040131, 2.220564, 1, 1, 1, 1, 1,
0.09055287, 1.101911, 0.01808953, 1, 1, 1, 1, 1,
0.09438537, 1.099064, -0.3108603, 1, 1, 1, 1, 1,
0.09473895, -1.134741, 3.59531, 1, 1, 1, 1, 1,
0.09711274, -1.683091, 2.491394, 1, 1, 1, 1, 1,
0.1017225, 0.4020866, 1.347753, 1, 1, 1, 1, 1,
0.1018833, 0.7959064, -0.3250529, 1, 1, 1, 1, 1,
0.1027618, -1.02727, 3.38929, 1, 1, 1, 1, 1,
0.1035759, -0.9849223, 3.568773, 0, 0, 1, 1, 1,
0.1076289, -0.524893, 3.92493, 1, 0, 0, 1, 1,
0.1178243, -0.1754493, 4.900155, 1, 0, 0, 1, 1,
0.1223274, 0.3365791, 1.190031, 1, 0, 0, 1, 1,
0.1259169, -1.561151, 3.254816, 1, 0, 0, 1, 1,
0.1295596, 0.121321, 1.42601, 1, 0, 0, 1, 1,
0.1298297, -0.02962193, 1.38163, 0, 0, 0, 1, 1,
0.1310399, 0.3129229, 1.621138, 0, 0, 0, 1, 1,
0.131105, -0.7803388, 3.289789, 0, 0, 0, 1, 1,
0.1343977, 0.9517955, -0.5962294, 0, 0, 0, 1, 1,
0.1348648, -1.377012, 2.218531, 0, 0, 0, 1, 1,
0.1378465, 1.34621, 0.2940687, 0, 0, 0, 1, 1,
0.1415891, -0.1721409, 2.550392, 0, 0, 0, 1, 1,
0.1468721, -0.7388423, 2.657566, 1, 1, 1, 1, 1,
0.1518662, -0.9034325, 3.674948, 1, 1, 1, 1, 1,
0.1666115, -0.5553153, 1.164542, 1, 1, 1, 1, 1,
0.1711093, 0.8656517, -0.5033264, 1, 1, 1, 1, 1,
0.1713141, -0.7455119, 3.916122, 1, 1, 1, 1, 1,
0.1713818, -0.4185037, 5.678297, 1, 1, 1, 1, 1,
0.1721638, -0.26342, 2.272167, 1, 1, 1, 1, 1,
0.1766034, 0.4271035, 1.57887, 1, 1, 1, 1, 1,
0.1769561, 0.4753064, -0.9653702, 1, 1, 1, 1, 1,
0.1776612, -2.276046, 3.79531, 1, 1, 1, 1, 1,
0.1808653, 0.8383682, 0.2871045, 1, 1, 1, 1, 1,
0.1844078, 0.2590898, -0.2065661, 1, 1, 1, 1, 1,
0.1869287, -0.9203515, 1.789311, 1, 1, 1, 1, 1,
0.1883948, -0.6950142, 2.6381, 1, 1, 1, 1, 1,
0.1890973, -0.5884225, 3.556714, 1, 1, 1, 1, 1,
0.193188, -0.5881542, 3.707284, 0, 0, 1, 1, 1,
0.1935218, 0.2193943, 0.74876, 1, 0, 0, 1, 1,
0.1943932, -0.5235473, 1.203425, 1, 0, 0, 1, 1,
0.2003701, -1.787801, 2.870595, 1, 0, 0, 1, 1,
0.2033118, 1.088628, -0.154628, 1, 0, 0, 1, 1,
0.2094506, -0.1892787, 1.91573, 1, 0, 0, 1, 1,
0.2099285, -1.099258, 2.84918, 0, 0, 0, 1, 1,
0.2111205, -1.605333, 3.495364, 0, 0, 0, 1, 1,
0.2117155, -0.34355, 0.8869342, 0, 0, 0, 1, 1,
0.2125524, -0.002459012, 0.7938956, 0, 0, 0, 1, 1,
0.2152447, 0.2394634, -1.86122, 0, 0, 0, 1, 1,
0.219868, 0.2118725, 1.609952, 0, 0, 0, 1, 1,
0.2211536, 0.04967587, 1.390179, 0, 0, 0, 1, 1,
0.2224476, -0.8260006, 2.231804, 1, 1, 1, 1, 1,
0.2235839, -2.004663, 3.509611, 1, 1, 1, 1, 1,
0.2252576, 1.960014, 1.516849, 1, 1, 1, 1, 1,
0.2268118, 0.2646068, 1.414998, 1, 1, 1, 1, 1,
0.2294077, -0.4107617, 3.964042, 1, 1, 1, 1, 1,
0.2335591, -1.424828, 2.50258, 1, 1, 1, 1, 1,
0.2453967, 0.3177536, 1.377492, 1, 1, 1, 1, 1,
0.2465296, 0.1685175, 2.100646, 1, 1, 1, 1, 1,
0.2520137, 0.1573271, 2.478019, 1, 1, 1, 1, 1,
0.2534526, -0.8779071, 0.4373205, 1, 1, 1, 1, 1,
0.2558514, 0.518641, 2.245551, 1, 1, 1, 1, 1,
0.2563054, 2.650365, 0.1151442, 1, 1, 1, 1, 1,
0.2591388, -0.2451076, 4.078609, 1, 1, 1, 1, 1,
0.2625771, -0.1933277, 3.952399, 1, 1, 1, 1, 1,
0.2626086, 1.359525, 1.660164, 1, 1, 1, 1, 1,
0.2649205, 0.2796627, 2.295474, 0, 0, 1, 1, 1,
0.2700315, -0.05168442, 0.1633955, 1, 0, 0, 1, 1,
0.2702275, 0.3660915, 0.7490622, 1, 0, 0, 1, 1,
0.2719906, -0.7004067, 2.279503, 1, 0, 0, 1, 1,
0.2728895, -2.186333, 1.902256, 1, 0, 0, 1, 1,
0.275259, 1.166569, 0.5666052, 1, 0, 0, 1, 1,
0.2758046, -0.5664449, 1.562953, 0, 0, 0, 1, 1,
0.2761579, 0.8374518, 0.2869332, 0, 0, 0, 1, 1,
0.2765402, -3.236925, 1.862272, 0, 0, 0, 1, 1,
0.2766988, -0.2916325, 2.200106, 0, 0, 0, 1, 1,
0.2789455, 0.2395605, 0.7923949, 0, 0, 0, 1, 1,
0.2806715, 0.3857356, 0.4929572, 0, 0, 0, 1, 1,
0.2827037, 0.9870895, 0.06465744, 0, 0, 0, 1, 1,
0.2832178, 0.02979476, 2.225251, 1, 1, 1, 1, 1,
0.2883337, -0.6038569, 1.831452, 1, 1, 1, 1, 1,
0.2888365, -0.4302806, 2.758118, 1, 1, 1, 1, 1,
0.2942844, -1.330432, 2.831661, 1, 1, 1, 1, 1,
0.296443, 1.197497, 0.9765822, 1, 1, 1, 1, 1,
0.3001342, 0.1052889, 1.916676, 1, 1, 1, 1, 1,
0.3014618, 0.4222295, 1.837624, 1, 1, 1, 1, 1,
0.3038953, -0.1689646, 2.187694, 1, 1, 1, 1, 1,
0.3047168, -1.182823, 3.956417, 1, 1, 1, 1, 1,
0.3055481, 0.4037342, 1.930193, 1, 1, 1, 1, 1,
0.3073348, -0.3840681, 3.866149, 1, 1, 1, 1, 1,
0.3085904, 1.216308, 1.424331, 1, 1, 1, 1, 1,
0.3087066, 0.6562553, 1.135995, 1, 1, 1, 1, 1,
0.3104558, -0.3276488, 4.301853, 1, 1, 1, 1, 1,
0.31859, 1.819433, -1.498798, 1, 1, 1, 1, 1,
0.3278196, 0.2143275, 2.130224, 0, 0, 1, 1, 1,
0.3425559, 0.7230145, 2.212602, 1, 0, 0, 1, 1,
0.3575331, 0.7193624, -0.2111436, 1, 0, 0, 1, 1,
0.3590932, 1.478777, 0.2593763, 1, 0, 0, 1, 1,
0.3643664, 0.8224541, 1.136549, 1, 0, 0, 1, 1,
0.3647192, 0.2986079, -0.1530133, 1, 0, 0, 1, 1,
0.3682095, 2.156936, 1.565746, 0, 0, 0, 1, 1,
0.3741692, -1.413948, 2.618262, 0, 0, 0, 1, 1,
0.3784609, 0.9675875, 2.404557, 0, 0, 0, 1, 1,
0.379789, 1.19289, 1.690256, 0, 0, 0, 1, 1,
0.3850014, 0.1672692, 2.423756, 0, 0, 0, 1, 1,
0.3882539, 0.4513181, -0.5569283, 0, 0, 0, 1, 1,
0.3892703, 0.04320154, 0.5997694, 0, 0, 0, 1, 1,
0.3904717, 1.604885, 1.993109, 1, 1, 1, 1, 1,
0.3947704, 0.2598658, -0.7060419, 1, 1, 1, 1, 1,
0.3986025, 0.4544905, 0.06633155, 1, 1, 1, 1, 1,
0.4033442, 1.050545, 0.04914384, 1, 1, 1, 1, 1,
0.4045766, 0.2723639, 1.640643, 1, 1, 1, 1, 1,
0.4066266, -0.2955509, 1.531758, 1, 1, 1, 1, 1,
0.4090586, -0.4504273, 2.279145, 1, 1, 1, 1, 1,
0.4114343, -0.453602, 2.389608, 1, 1, 1, 1, 1,
0.4129397, 0.7827912, 2.49896, 1, 1, 1, 1, 1,
0.4148177, 1.188997, -1.124541, 1, 1, 1, 1, 1,
0.4187332, 0.7549238, 2.052937, 1, 1, 1, 1, 1,
0.4274925, 1.163882, -1.17949, 1, 1, 1, 1, 1,
0.4309649, -0.2718027, 0.3234681, 1, 1, 1, 1, 1,
0.4410312, 0.6057522, 0.07471647, 1, 1, 1, 1, 1,
0.4478677, -2.21923, 2.890233, 1, 1, 1, 1, 1,
0.4481234, 0.2019889, 0.2009574, 0, 0, 1, 1, 1,
0.4543, 0.9459317, 0.7268242, 1, 0, 0, 1, 1,
0.4557052, 1.045631, 0.9524413, 1, 0, 0, 1, 1,
0.4618098, -0.9889396, 3.044847, 1, 0, 0, 1, 1,
0.4660879, -0.2859033, 2.875448, 1, 0, 0, 1, 1,
0.4661568, 0.6006011, 0.7195779, 1, 0, 0, 1, 1,
0.4706861, -0.648734, 2.367294, 0, 0, 0, 1, 1,
0.475182, 0.2461056, 3.016685, 0, 0, 0, 1, 1,
0.4770648, -1.348262, 4.063558, 0, 0, 0, 1, 1,
0.4905608, 0.4687481, 1.094697, 0, 0, 0, 1, 1,
0.4981572, -0.5509568, 1.794971, 0, 0, 0, 1, 1,
0.5004807, 0.405071, 1.338102, 0, 0, 0, 1, 1,
0.5095108, 0.3757182, 0.14211, 0, 0, 0, 1, 1,
0.5100282, 0.07077328, 2.526394, 1, 1, 1, 1, 1,
0.5158073, 0.8270035, 0.9768916, 1, 1, 1, 1, 1,
0.5187004, 0.2103231, 0.2152332, 1, 1, 1, 1, 1,
0.5209116, 0.2926026, 0.6373019, 1, 1, 1, 1, 1,
0.5285541, 1.783511, -0.6841316, 1, 1, 1, 1, 1,
0.5308173, 1.650255, 1.880751, 1, 1, 1, 1, 1,
0.5341132, -1.799715, 2.292708, 1, 1, 1, 1, 1,
0.534426, 1.053928, 0.5087675, 1, 1, 1, 1, 1,
0.5378193, -1.012357, 3.289259, 1, 1, 1, 1, 1,
0.5387843, 0.5526528, 1.137275, 1, 1, 1, 1, 1,
0.5425935, -2.214259, 1.115225, 1, 1, 1, 1, 1,
0.5432295, -0.7807659, 2.758247, 1, 1, 1, 1, 1,
0.5455995, -1.110538, 2.572376, 1, 1, 1, 1, 1,
0.5532193, 0.6905612, 0.7119686, 1, 1, 1, 1, 1,
0.5557485, -1.114958, 2.110716, 1, 1, 1, 1, 1,
0.5560926, -0.6915055, 3.160746, 0, 0, 1, 1, 1,
0.5579311, -0.3518188, 3.641297, 1, 0, 0, 1, 1,
0.5623581, -0.5635006, 4.236083, 1, 0, 0, 1, 1,
0.5639604, 0.03407154, 1.079241, 1, 0, 0, 1, 1,
0.5694004, 0.4498149, 0.2311819, 1, 0, 0, 1, 1,
0.5716705, -3.665436, 2.731499, 1, 0, 0, 1, 1,
0.5719174, 1.317644, -0.5142436, 0, 0, 0, 1, 1,
0.5742005, -1.733122, 2.147559, 0, 0, 0, 1, 1,
0.5765396, 1.884947, 2.260767, 0, 0, 0, 1, 1,
0.5770107, 1.851906, -0.7005284, 0, 0, 0, 1, 1,
0.579349, 0.8321318, 0.1272475, 0, 0, 0, 1, 1,
0.5890253, 0.07451727, 2.757047, 0, 0, 0, 1, 1,
0.589341, 0.1261482, 1.02303, 0, 0, 0, 1, 1,
0.5964284, 1.069335, 0.4258028, 1, 1, 1, 1, 1,
0.5985674, 0.2781548, 0.719554, 1, 1, 1, 1, 1,
0.5991585, -0.2967247, 2.608285, 1, 1, 1, 1, 1,
0.602942, -0.2700406, 2.73433, 1, 1, 1, 1, 1,
0.6095436, -1.440678, 0.7848934, 1, 1, 1, 1, 1,
0.609803, 0.3964346, 0.5673589, 1, 1, 1, 1, 1,
0.6191356, 0.3787524, 0.3780149, 1, 1, 1, 1, 1,
0.6200892, 1.280953, -0.4116829, 1, 1, 1, 1, 1,
0.6207222, 0.1005107, 0.6695024, 1, 1, 1, 1, 1,
0.6208171, -0.7221476, 1.74737, 1, 1, 1, 1, 1,
0.6267986, -0.3172553, 1.262885, 1, 1, 1, 1, 1,
0.6314665, -0.1657221, 3.15771, 1, 1, 1, 1, 1,
0.6336927, -0.3055136, 2.262557, 1, 1, 1, 1, 1,
0.6401171, -0.9345188, 3.438321, 1, 1, 1, 1, 1,
0.6507481, -0.4035164, 2.964065, 1, 1, 1, 1, 1,
0.6529888, -0.2761602, 1.026822, 0, 0, 1, 1, 1,
0.6540346, -0.1887052, 1.99433, 1, 0, 0, 1, 1,
0.6548841, 0.01015625, 1.878165, 1, 0, 0, 1, 1,
0.6550942, 0.08223547, 0.0635842, 1, 0, 0, 1, 1,
0.6571563, -0.1092107, 1.915357, 1, 0, 0, 1, 1,
0.6636193, -0.4942352, 1.274745, 1, 0, 0, 1, 1,
0.6643323, -1.868729, 2.611706, 0, 0, 0, 1, 1,
0.6702616, -0.2796628, 0.4924414, 0, 0, 0, 1, 1,
0.6776168, 0.3038462, 1.269087, 0, 0, 0, 1, 1,
0.678631, -0.3603425, 1.538309, 0, 0, 0, 1, 1,
0.6875236, 1.640405, 0.8668515, 0, 0, 0, 1, 1,
0.6882205, -1.300901, 2.874071, 0, 0, 0, 1, 1,
0.6892797, -1.584659, 1.974933, 0, 0, 0, 1, 1,
0.6896719, -0.6831188, 3.115051, 1, 1, 1, 1, 1,
0.6913123, -0.01005008, 1.872143, 1, 1, 1, 1, 1,
0.6929441, 1.140446, 0.3801949, 1, 1, 1, 1, 1,
0.6934474, -1.367777, 3.208709, 1, 1, 1, 1, 1,
0.6994886, 0.8809274, -0.4801104, 1, 1, 1, 1, 1,
0.7030709, 0.4919334, 2.351654, 1, 1, 1, 1, 1,
0.7098715, -0.04466686, 1.1666, 1, 1, 1, 1, 1,
0.7135464, 1.026981, 1.995852, 1, 1, 1, 1, 1,
0.7169567, -0.2802952, 3.797069, 1, 1, 1, 1, 1,
0.7177326, -1.853657, 2.171248, 1, 1, 1, 1, 1,
0.7207676, -0.9294202, 2.363126, 1, 1, 1, 1, 1,
0.7268698, 1.498091, 0.9824865, 1, 1, 1, 1, 1,
0.7269235, -0.1835812, 1.329366, 1, 1, 1, 1, 1,
0.7310097, -1.324393, 2.380989, 1, 1, 1, 1, 1,
0.7333444, -0.359684, 2.366308, 1, 1, 1, 1, 1,
0.7340418, -0.2326974, 2.001198, 0, 0, 1, 1, 1,
0.7380306, -0.5215581, 1.992382, 1, 0, 0, 1, 1,
0.7472596, 1.63955, 0.3853206, 1, 0, 0, 1, 1,
0.749639, -3.847723, 3.143006, 1, 0, 0, 1, 1,
0.7529322, -1.242352, 1.90839, 1, 0, 0, 1, 1,
0.767967, 1.515856, 0.3963336, 1, 0, 0, 1, 1,
0.7717162, -0.08539221, 2.037077, 0, 0, 0, 1, 1,
0.7725022, -1.356303, 1.853621, 0, 0, 0, 1, 1,
0.7750295, 1.747879, -0.4333399, 0, 0, 0, 1, 1,
0.7804621, 0.1419262, 0.6730395, 0, 0, 0, 1, 1,
0.7841876, 0.4852457, -0.05450352, 0, 0, 0, 1, 1,
0.784421, -0.3969774, 3.39033, 0, 0, 0, 1, 1,
0.7852799, 1.016674, 1.627371, 0, 0, 0, 1, 1,
0.7859398, -0.185128, 1.270912, 1, 1, 1, 1, 1,
0.7889237, 1.405877, 0.4710881, 1, 1, 1, 1, 1,
0.7893837, -2.885817, 3.834074, 1, 1, 1, 1, 1,
0.7969773, -2.030362, 1.656534, 1, 1, 1, 1, 1,
0.8022934, -1.771757, 2.890856, 1, 1, 1, 1, 1,
0.8041709, -0.946161, 1.577373, 1, 1, 1, 1, 1,
0.8044887, -1.456257, 4.072658, 1, 1, 1, 1, 1,
0.8053564, -0.7039333, 3.775593, 1, 1, 1, 1, 1,
0.8079809, -0.4944142, 1.204518, 1, 1, 1, 1, 1,
0.8090909, 2.572335, 0.7807692, 1, 1, 1, 1, 1,
0.8115842, -0.9663352, 3.098298, 1, 1, 1, 1, 1,
0.8171234, -2.140919, 2.746138, 1, 1, 1, 1, 1,
0.8218184, -1.309468, 4.083515, 1, 1, 1, 1, 1,
0.8219908, -0.3232586, 0.9654936, 1, 1, 1, 1, 1,
0.8289534, 0.1246416, 1.447765, 1, 1, 1, 1, 1,
0.8337523, -0.8766627, 3.482979, 0, 0, 1, 1, 1,
0.8343964, 1.287593, -0.3235459, 1, 0, 0, 1, 1,
0.8460254, -1.489993, 2.448663, 1, 0, 0, 1, 1,
0.8460501, 1.386727, -0.05933379, 1, 0, 0, 1, 1,
0.8463973, -0.1523652, 2.95843, 1, 0, 0, 1, 1,
0.8525958, -0.08612481, 0.6579938, 1, 0, 0, 1, 1,
0.8585225, 0.257194, 0.3239836, 0, 0, 0, 1, 1,
0.8586575, 0.7657047, 0.9740179, 0, 0, 0, 1, 1,
0.859111, -0.7096926, 2.783291, 0, 0, 0, 1, 1,
0.8637087, -0.2083665, -0.1375061, 0, 0, 0, 1, 1,
0.8639509, -0.7608713, 2.125412, 0, 0, 0, 1, 1,
0.8660355, 0.2988623, 1.38794, 0, 0, 0, 1, 1,
0.8700781, -0.4985279, 2.117075, 0, 0, 0, 1, 1,
0.8714385, 0.0555382, 1.82436, 1, 1, 1, 1, 1,
0.8726045, -0.6125915, 2.42411, 1, 1, 1, 1, 1,
0.8726526, 0.2862251, 0.9644815, 1, 1, 1, 1, 1,
0.8779497, 2.00144, 0.5806865, 1, 1, 1, 1, 1,
0.8781809, 0.7966312, 1.88748, 1, 1, 1, 1, 1,
0.8786603, -0.04752087, 1.046521, 1, 1, 1, 1, 1,
0.8794194, -0.5688095, 0.1670299, 1, 1, 1, 1, 1,
0.8812972, 1.120281, 2.365748, 1, 1, 1, 1, 1,
0.8831707, 0.4326811, -0.02150469, 1, 1, 1, 1, 1,
0.883921, -1.040822, 1.755808, 1, 1, 1, 1, 1,
0.8884671, -1.619228, 3.179129, 1, 1, 1, 1, 1,
0.8924868, -1.717286, 3.895382, 1, 1, 1, 1, 1,
0.9003727, 0.2995617, 2.674884, 1, 1, 1, 1, 1,
0.9010947, 0.08157896, -0.6107986, 1, 1, 1, 1, 1,
0.9036078, -0.1296118, 0.2277367, 1, 1, 1, 1, 1,
0.9097586, -1.289308, 2.653026, 0, 0, 1, 1, 1,
0.9178047, -0.8333008, 5.890996, 1, 0, 0, 1, 1,
0.9185086, 0.4657699, 2.576804, 1, 0, 0, 1, 1,
0.9196979, -0.2921532, 3.537967, 1, 0, 0, 1, 1,
0.9211459, -0.2547605, 0.5885997, 1, 0, 0, 1, 1,
0.9238468, -0.1745157, 1.766895, 1, 0, 0, 1, 1,
0.93088, 0.09080576, 1.097148, 0, 0, 0, 1, 1,
0.938954, -1.466455, 2.327102, 0, 0, 0, 1, 1,
0.9399288, -0.247495, 3.234479, 0, 0, 0, 1, 1,
0.940468, -0.634934, 3.481103, 0, 0, 0, 1, 1,
0.941763, 0.5424656, 0.8222846, 0, 0, 0, 1, 1,
0.9420532, 0.2385952, 1.480245, 0, 0, 0, 1, 1,
0.9423279, 0.1458011, -0.3043416, 0, 0, 0, 1, 1,
0.9463826, 1.350365, 2.376343, 1, 1, 1, 1, 1,
0.9523183, 1.115028, -0.5456445, 1, 1, 1, 1, 1,
0.9555007, 1.247598, 0.07514833, 1, 1, 1, 1, 1,
0.9602236, 0.5730137, 1.544323, 1, 1, 1, 1, 1,
0.9604231, 1.21587, 0.6644105, 1, 1, 1, 1, 1,
0.9619759, -0.7243891, 3.099189, 1, 1, 1, 1, 1,
0.9697978, -0.01062443, 2.691526, 1, 1, 1, 1, 1,
0.9723694, -0.117226, 1.815871, 1, 1, 1, 1, 1,
0.9752377, 0.7450472, 1.919094, 1, 1, 1, 1, 1,
0.9765337, -0.4674292, 0.6737848, 1, 1, 1, 1, 1,
0.9860525, -0.4400999, 2.702381, 1, 1, 1, 1, 1,
0.9860752, 1.030923, 0.870441, 1, 1, 1, 1, 1,
0.9869644, 0.5724248, -0.744207, 1, 1, 1, 1, 1,
0.9933578, -0.929399, 4.0973, 1, 1, 1, 1, 1,
0.9948345, -2.464893, 3.645349, 1, 1, 1, 1, 1,
0.9960346, -0.4962307, 3.280361, 0, 0, 1, 1, 1,
0.9965329, -0.2681368, 2.95153, 1, 0, 0, 1, 1,
0.997111, -0.1202666, 3.46065, 1, 0, 0, 1, 1,
0.9971203, 0.3485761, 0.778589, 1, 0, 0, 1, 1,
0.9976951, 2.641846, -0.5456784, 1, 0, 0, 1, 1,
1.002116, 0.9108666, 2.002634, 1, 0, 0, 1, 1,
1.003497, 1.05435, 1.739658, 0, 0, 0, 1, 1,
1.008507, -0.933989, 2.731367, 0, 0, 0, 1, 1,
1.010311, 0.3540326, 1.455313, 0, 0, 0, 1, 1,
1.011846, 0.6152617, 2.590019, 0, 0, 0, 1, 1,
1.01318, 0.793659, 1.991291, 0, 0, 0, 1, 1,
1.016742, -1.057524, 3.030632, 0, 0, 0, 1, 1,
1.017266, 2.335325, -0.1945906, 0, 0, 0, 1, 1,
1.017905, -0.5497733, 1.820575, 1, 1, 1, 1, 1,
1.023393, -0.7128848, 1.775039, 1, 1, 1, 1, 1,
1.034103, 0.5033877, 2.227771, 1, 1, 1, 1, 1,
1.034178, -0.663187, 1.810555, 1, 1, 1, 1, 1,
1.036748, 1.514395, -0.7617451, 1, 1, 1, 1, 1,
1.047607, 1.693638, -1.405588, 1, 1, 1, 1, 1,
1.04809, 2.046605, -0.3381689, 1, 1, 1, 1, 1,
1.0511, -0.1175455, 2.194434, 1, 1, 1, 1, 1,
1.065091, 0.8107358, 1.44763, 1, 1, 1, 1, 1,
1.067338, -0.2295222, -0.2388531, 1, 1, 1, 1, 1,
1.073192, 2.22929, 0.7592632, 1, 1, 1, 1, 1,
1.094766, -1.589484, 4.489616, 1, 1, 1, 1, 1,
1.106619, 1.510847, -0.2791493, 1, 1, 1, 1, 1,
1.110524, 0.6327484, 1.385675, 1, 1, 1, 1, 1,
1.115677, -1.38026, 3.269014, 1, 1, 1, 1, 1,
1.118256, 0.4577372, 1.431395, 0, 0, 1, 1, 1,
1.122424, 0.9965442, 1.388188, 1, 0, 0, 1, 1,
1.123703, -0.1216672, 1.623044, 1, 0, 0, 1, 1,
1.128358, -1.685472, 3.684711, 1, 0, 0, 1, 1,
1.130739, 0.1444931, 1.180701, 1, 0, 0, 1, 1,
1.132482, 0.7228133, 1.111709, 1, 0, 0, 1, 1,
1.134626, 1.670677, 1.297741, 0, 0, 0, 1, 1,
1.141195, 0.842851, -0.314238, 0, 0, 0, 1, 1,
1.145085, 0.2422241, 2.056232, 0, 0, 0, 1, 1,
1.155032, -1.046386, 2.579919, 0, 0, 0, 1, 1,
1.15837, -0.2235057, 1.442384, 0, 0, 0, 1, 1,
1.159857, 0.4105185, 1.78636, 0, 0, 0, 1, 1,
1.167582, -2.625403, 2.565793, 0, 0, 0, 1, 1,
1.167821, 0.0520901, 1.892294, 1, 1, 1, 1, 1,
1.169869, 0.6591309, 1.90622, 1, 1, 1, 1, 1,
1.175993, 0.09173549, 0.9751425, 1, 1, 1, 1, 1,
1.190307, 0.1733954, 0.8553808, 1, 1, 1, 1, 1,
1.194013, 0.3183551, 0.9864641, 1, 1, 1, 1, 1,
1.194788, 0.1380213, 1.673977, 1, 1, 1, 1, 1,
1.208689, 0.1054719, 3.353677, 1, 1, 1, 1, 1,
1.217625, 1.421854, 1.677191, 1, 1, 1, 1, 1,
1.224876, -1.238957, 3.057477, 1, 1, 1, 1, 1,
1.229429, 0.1794446, 1.51098, 1, 1, 1, 1, 1,
1.229967, 0.69778, 2.088925, 1, 1, 1, 1, 1,
1.243108, -0.5471664, 1.479623, 1, 1, 1, 1, 1,
1.26517, -1.082291, 2.841924, 1, 1, 1, 1, 1,
1.270073, 0.6038383, 1.244737, 1, 1, 1, 1, 1,
1.275458, -1.097821, 0.6179389, 1, 1, 1, 1, 1,
1.280958, 0.1496501, 1.679607, 0, 0, 1, 1, 1,
1.281152, 0.152226, 0.3418999, 1, 0, 0, 1, 1,
1.282823, -0.9813587, 3.07093, 1, 0, 0, 1, 1,
1.286274, -0.5475159, 1.451718, 1, 0, 0, 1, 1,
1.290471, -0.6360673, 4.236629, 1, 0, 0, 1, 1,
1.295233, -0.06084459, 2.393106, 1, 0, 0, 1, 1,
1.299268, -0.8571693, 1.679617, 0, 0, 0, 1, 1,
1.304211, -1.341849, 0.8605835, 0, 0, 0, 1, 1,
1.310418, -0.6597759, 2.138535, 0, 0, 0, 1, 1,
1.31239, -0.08406812, 0.02399131, 0, 0, 0, 1, 1,
1.342674, -0.5185865, 2.409862, 0, 0, 0, 1, 1,
1.347585, 0.515946, 1.259872, 0, 0, 0, 1, 1,
1.355511, 0.7839304, 0.3574125, 0, 0, 0, 1, 1,
1.363098, 0.444243, 0.8643582, 1, 1, 1, 1, 1,
1.369706, -0.190845, 1.564473, 1, 1, 1, 1, 1,
1.379731, 1.240277, -0.4500838, 1, 1, 1, 1, 1,
1.380196, 1.723652, 1.392936, 1, 1, 1, 1, 1,
1.383084, 1.963005, 0.03813704, 1, 1, 1, 1, 1,
1.385938, -0.3842608, 0.2333384, 1, 1, 1, 1, 1,
1.390726, -0.1093484, -0.6843603, 1, 1, 1, 1, 1,
1.403916, 0.4676935, 1.739323, 1, 1, 1, 1, 1,
1.40482, -1.418573, 3.717206, 1, 1, 1, 1, 1,
1.40992, 1.398884, -0.5832096, 1, 1, 1, 1, 1,
1.428724, -0.8112828, 2.684203, 1, 1, 1, 1, 1,
1.431652, -0.3217669, 1.861891, 1, 1, 1, 1, 1,
1.445133, 1.925441, 1.324842, 1, 1, 1, 1, 1,
1.455195, 0.060456, 2.629094, 1, 1, 1, 1, 1,
1.456863, -0.1371748, 2.030338, 1, 1, 1, 1, 1,
1.465139, 1.29979, -0.8946729, 0, 0, 1, 1, 1,
1.476671, 0.005535753, 0.5547558, 1, 0, 0, 1, 1,
1.502743, 1.881053, 0.992419, 1, 0, 0, 1, 1,
1.505595, 0.3573172, 1.5801, 1, 0, 0, 1, 1,
1.519171, -0.4462977, 2.874906, 1, 0, 0, 1, 1,
1.520947, -1.517055, 3.95278, 1, 0, 0, 1, 1,
1.529702, -0.3267154, 1.195839, 0, 0, 0, 1, 1,
1.539255, 0.3590134, 0.5097483, 0, 0, 0, 1, 1,
1.541727, 1.139239, 2.023157, 0, 0, 0, 1, 1,
1.543223, 0.3209232, 0.5263194, 0, 0, 0, 1, 1,
1.551644, 0.5615715, 1.553753, 0, 0, 0, 1, 1,
1.560711, 0.1150947, 0.752652, 0, 0, 0, 1, 1,
1.56597, -0.9990537, 1.241202, 0, 0, 0, 1, 1,
1.597467, 0.1652831, 3.383594, 1, 1, 1, 1, 1,
1.609874, 1.655641, -0.02653783, 1, 1, 1, 1, 1,
1.639005, -1.784064, 3.126997, 1, 1, 1, 1, 1,
1.639995, -0.2287725, 0.7323351, 1, 1, 1, 1, 1,
1.6431, -2.068338, 3.03907, 1, 1, 1, 1, 1,
1.644164, 1.960994, 1.233989, 1, 1, 1, 1, 1,
1.646966, -1.078835, 1.356893, 1, 1, 1, 1, 1,
1.656996, -1.602362, 2.084497, 1, 1, 1, 1, 1,
1.658649, -0.3137316, 1.939397, 1, 1, 1, 1, 1,
1.663117, 1.246964, 1.553726, 1, 1, 1, 1, 1,
1.66706, -0.8330263, -0.5314487, 1, 1, 1, 1, 1,
1.6689, 1.222146, -0.06925066, 1, 1, 1, 1, 1,
1.674804, -0.1633766, 2.070329, 1, 1, 1, 1, 1,
1.680855, -0.3340096, 3.703701, 1, 1, 1, 1, 1,
1.698284, 0.6403271, 1.116069, 1, 1, 1, 1, 1,
1.736802, 0.8236722, 0.955099, 0, 0, 1, 1, 1,
1.738579, 0.1829733, 2.972409, 1, 0, 0, 1, 1,
1.743052, -1.084292, 1.437195, 1, 0, 0, 1, 1,
1.757048, -0.01333379, 2.061655, 1, 0, 0, 1, 1,
1.764436, 0.4468737, 1.03141, 1, 0, 0, 1, 1,
1.772889, 1.744096, 2.660271, 1, 0, 0, 1, 1,
1.783115, 0.7470042, 0.06544784, 0, 0, 0, 1, 1,
1.793338, 1.630895, 2.99518, 0, 0, 0, 1, 1,
1.805461, -0.1200547, 1.412939, 0, 0, 0, 1, 1,
1.828311, -1.100317, 1.190291, 0, 0, 0, 1, 1,
1.830722, -0.384455, 2.060753, 0, 0, 0, 1, 1,
1.854591, -1.190806, 1.71396, 0, 0, 0, 1, 1,
1.85706, -0.3425508, 2.150268, 0, 0, 0, 1, 1,
1.858435, -1.180591, 2.029269, 1, 1, 1, 1, 1,
1.876109, -0.03421866, 0.4481694, 1, 1, 1, 1, 1,
1.881091, 1.956811, 1.590075, 1, 1, 1, 1, 1,
1.882487, 0.9425765, 1.336537, 1, 1, 1, 1, 1,
1.890782, 1.767527, 1.34537, 1, 1, 1, 1, 1,
1.895735, -2.39108, 2.343791, 1, 1, 1, 1, 1,
1.908808, 0.3233737, 1.070773, 1, 1, 1, 1, 1,
1.911653, -1.083731, 2.029818, 1, 1, 1, 1, 1,
1.913049, -0.9426, 0.4987329, 1, 1, 1, 1, 1,
1.921647, 0.642715, 0.6113491, 1, 1, 1, 1, 1,
1.92727, 0.5119231, 1.87122, 1, 1, 1, 1, 1,
1.927395, -0.9366072, 1.461534, 1, 1, 1, 1, 1,
1.943246, 1.245244, -0.1679869, 1, 1, 1, 1, 1,
1.944314, -0.3756467, 1.741337, 1, 1, 1, 1, 1,
1.975816, 2.360044, -0.7614201, 1, 1, 1, 1, 1,
1.991059, 0.9580162, 3.428225, 0, 0, 1, 1, 1,
1.996793, -1.498566, 1.992973, 1, 0, 0, 1, 1,
2.000804, -0.8666144, 2.905832, 1, 0, 0, 1, 1,
2.064929, 1.841137, -0.5280111, 1, 0, 0, 1, 1,
2.115549, -0.2730141, 2.761335, 1, 0, 0, 1, 1,
2.162071, 0.7834176, 2.577906, 1, 0, 0, 1, 1,
2.271767, -1.654931, 0.8569382, 0, 0, 0, 1, 1,
2.272146, -1.151853, 1.411435, 0, 0, 0, 1, 1,
2.274741, 1.72068, 1.646244, 0, 0, 0, 1, 1,
2.339062, -0.4383025, 0.1189998, 0, 0, 0, 1, 1,
2.35511, 1.018803, 2.144474, 0, 0, 0, 1, 1,
2.412405, -1.180619, 2.189266, 0, 0, 0, 1, 1,
2.420427, -1.158284, 3.223012, 0, 0, 0, 1, 1,
2.572972, 1.409602, 1.535481, 1, 1, 1, 1, 1,
2.582987, -0.5960076, 2.168719, 1, 1, 1, 1, 1,
2.788751, 0.4590301, 1.846408, 1, 1, 1, 1, 1,
2.861719, -0.04504316, -0.3619583, 1, 1, 1, 1, 1,
3.156416, -0.2042109, 1.722736, 1, 1, 1, 1, 1,
3.286472, -0.9498662, 2.941576, 1, 1, 1, 1, 1,
3.522133, -0.3028476, 2.254678, 1, 1, 1, 1, 1
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
var radius = 9.934739;
var distance = 34.89535;
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
mvMatrix.translate( -0.2628986, 0.4305528, -0.2640066 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.89535);
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