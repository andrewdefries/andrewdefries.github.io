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
-3.197126, -1.791115, -3.584554, 1, 0, 0, 1,
-3.044027, 0.7026017, -2.018832, 1, 0.007843138, 0, 1,
-2.963716, 0.7481987, -0.9461071, 1, 0.01176471, 0, 1,
-2.865925, -1.081905, -2.952792, 1, 0.01960784, 0, 1,
-2.717458, 0.7872419, -0.7398355, 1, 0.02352941, 0, 1,
-2.573077, -0.9439402, -2.03856, 1, 0.03137255, 0, 1,
-2.542449, 1.339393, -0.8697771, 1, 0.03529412, 0, 1,
-2.522768, 1.417798, -0.2948143, 1, 0.04313726, 0, 1,
-2.515582, 0.4526533, -0.1742914, 1, 0.04705882, 0, 1,
-2.453715, -1.531114, -3.657963, 1, 0.05490196, 0, 1,
-2.422938, 0.3885267, -1.750846, 1, 0.05882353, 0, 1,
-2.412567, -1.754304, -3.54218, 1, 0.06666667, 0, 1,
-2.380948, 0.8779492, -0.6207049, 1, 0.07058824, 0, 1,
-2.365705, 0.0874332, -2.336203, 1, 0.07843138, 0, 1,
-2.348135, -1.53179, -1.183265, 1, 0.08235294, 0, 1,
-2.326991, -0.4898281, -3.52836, 1, 0.09019608, 0, 1,
-2.249358, -2.052902, -0.8223522, 1, 0.09411765, 0, 1,
-2.245404, -0.2914423, -1.141312, 1, 0.1019608, 0, 1,
-2.234228, 0.7718478, -0.3698926, 1, 0.1098039, 0, 1,
-2.211169, 0.6468822, -2.688214, 1, 0.1137255, 0, 1,
-2.165794, 0.09649868, -1.491458, 1, 0.1215686, 0, 1,
-2.13515, 0.4365967, -3.294699, 1, 0.1254902, 0, 1,
-2.105767, 0.860114, -1.033895, 1, 0.1333333, 0, 1,
-2.055607, -1.047469, -1.856562, 1, 0.1372549, 0, 1,
-2.054269, -1.062478, -0.8121912, 1, 0.145098, 0, 1,
-2.021367, 0.5078347, -1.830709, 1, 0.1490196, 0, 1,
-2.004609, -0.8856519, -1.380863, 1, 0.1568628, 0, 1,
-1.990557, -0.68604, -1.836378, 1, 0.1607843, 0, 1,
-1.9862, -0.1233157, -2.556318, 1, 0.1686275, 0, 1,
-1.977222, -1.386331, -1.498563, 1, 0.172549, 0, 1,
-1.917962, -1.658425, -3.202262, 1, 0.1803922, 0, 1,
-1.911777, -1.010691, -2.344463, 1, 0.1843137, 0, 1,
-1.897195, 1.516376, -1.235524, 1, 0.1921569, 0, 1,
-1.874143, -0.4155039, -0.8479269, 1, 0.1960784, 0, 1,
-1.847929, 2.353689, 1.517832, 1, 0.2039216, 0, 1,
-1.832399, -0.4346049, -0.5418906, 1, 0.2117647, 0, 1,
-1.807888, 1.175259, -1.202624, 1, 0.2156863, 0, 1,
-1.807528, 0.4396771, -1.184264, 1, 0.2235294, 0, 1,
-1.784217, -1.384629, -3.529738, 1, 0.227451, 0, 1,
-1.781802, -0.2438997, -1.03586, 1, 0.2352941, 0, 1,
-1.778037, 1.218243, -1.905389, 1, 0.2392157, 0, 1,
-1.763344, -0.3661976, -4.404306, 1, 0.2470588, 0, 1,
-1.755915, 0.1484781, -1.36952, 1, 0.2509804, 0, 1,
-1.750845, -1.581929, -2.668079, 1, 0.2588235, 0, 1,
-1.744795, -1.647992, -2.537002, 1, 0.2627451, 0, 1,
-1.733129, -2.23713, -2.629391, 1, 0.2705882, 0, 1,
-1.726359, -0.8333281, -3.239348, 1, 0.2745098, 0, 1,
-1.724799, -0.5428818, -1.084611, 1, 0.282353, 0, 1,
-1.724684, -0.3310898, -2.203818, 1, 0.2862745, 0, 1,
-1.721182, -0.8101134, -1.326483, 1, 0.2941177, 0, 1,
-1.716229, -1.486059, -2.468701, 1, 0.3019608, 0, 1,
-1.704916, 1.589338, -1.20806, 1, 0.3058824, 0, 1,
-1.698051, -0.8180667, -2.961648, 1, 0.3137255, 0, 1,
-1.682451, 0.2571675, -2.460549, 1, 0.3176471, 0, 1,
-1.680529, 0.3997757, -3.747389, 1, 0.3254902, 0, 1,
-1.667261, -0.1254698, -1.462441, 1, 0.3294118, 0, 1,
-1.661019, -0.4632641, -3.422228, 1, 0.3372549, 0, 1,
-1.654839, -0.722344, -3.12929, 1, 0.3411765, 0, 1,
-1.639428, 1.095759, 1.004375, 1, 0.3490196, 0, 1,
-1.635032, 1.361881, -1.524037, 1, 0.3529412, 0, 1,
-1.632004, -1.489758, -2.186777, 1, 0.3607843, 0, 1,
-1.629003, 0.4571191, -0.2679331, 1, 0.3647059, 0, 1,
-1.624979, 1.524251, -0.4126254, 1, 0.372549, 0, 1,
-1.616784, 0.4133526, -1.491669, 1, 0.3764706, 0, 1,
-1.596296, 0.07266347, -0.7247736, 1, 0.3843137, 0, 1,
-1.583504, 1.309819, 0.3502014, 1, 0.3882353, 0, 1,
-1.574585, -0.8348756, -0.7970602, 1, 0.3960784, 0, 1,
-1.570194, -1.364009, -1.437221, 1, 0.4039216, 0, 1,
-1.563065, 0.918561, -0.3617699, 1, 0.4078431, 0, 1,
-1.557161, -0.2288684, -3.218735, 1, 0.4156863, 0, 1,
-1.555913, 0.4754405, -1.325194, 1, 0.4196078, 0, 1,
-1.554612, -0.03321806, -1.334267, 1, 0.427451, 0, 1,
-1.54139, 0.2810987, -1.861567, 1, 0.4313726, 0, 1,
-1.528883, -0.3073118, -2.841565, 1, 0.4392157, 0, 1,
-1.505594, 0.07295053, -1.851467, 1, 0.4431373, 0, 1,
-1.504551, -0.4908949, -2.988557, 1, 0.4509804, 0, 1,
-1.503738, -0.3756792, -1.177077, 1, 0.454902, 0, 1,
-1.463419, -1.037371, -0.6936809, 1, 0.4627451, 0, 1,
-1.453285, 0.68071, -1.95162, 1, 0.4666667, 0, 1,
-1.452398, 1.011707, -2.406807, 1, 0.4745098, 0, 1,
-1.433332, 0.8231201, -0.2253832, 1, 0.4784314, 0, 1,
-1.433005, -1.59504, -2.423877, 1, 0.4862745, 0, 1,
-1.42932, -0.8507958, -2.326031, 1, 0.4901961, 0, 1,
-1.414829, -0.8564793, -1.535578, 1, 0.4980392, 0, 1,
-1.414648, 0.1026371, -0.3770404, 1, 0.5058824, 0, 1,
-1.413172, -0.525162, -4.48063, 1, 0.509804, 0, 1,
-1.412708, -0.6157621, -2.228732, 1, 0.5176471, 0, 1,
-1.408598, -1.180044, -4.383892, 1, 0.5215687, 0, 1,
-1.403068, 1.21738, -2.013204, 1, 0.5294118, 0, 1,
-1.399464, -0.2276345, -2.015178, 1, 0.5333334, 0, 1,
-1.395328, 0.145676, -0.3733167, 1, 0.5411765, 0, 1,
-1.390297, -0.4368828, -1.365033, 1, 0.5450981, 0, 1,
-1.383138, -0.03670869, -0.8028858, 1, 0.5529412, 0, 1,
-1.379926, -0.1278545, -1.494794, 1, 0.5568628, 0, 1,
-1.363285, 0.7713301, -0.5051452, 1, 0.5647059, 0, 1,
-1.361631, -0.246993, -2.751345, 1, 0.5686275, 0, 1,
-1.361206, 0.4461489, -2.163268, 1, 0.5764706, 0, 1,
-1.361035, 0.4678334, -1.624087, 1, 0.5803922, 0, 1,
-1.344806, 0.1007511, -0.3334364, 1, 0.5882353, 0, 1,
-1.341947, 1.73546, -1.511683, 1, 0.5921569, 0, 1,
-1.340266, -0.906624, -3.365631, 1, 0.6, 0, 1,
-1.338216, -2.108169, -3.803374, 1, 0.6078432, 0, 1,
-1.325743, 0.1718146, -2.535018, 1, 0.6117647, 0, 1,
-1.325006, 0.8684341, 0.008317295, 1, 0.6196079, 0, 1,
-1.322439, -0.4001367, -2.8568, 1, 0.6235294, 0, 1,
-1.320497, 0.6433213, 0.0590713, 1, 0.6313726, 0, 1,
-1.319431, 0.07692029, -1.086022, 1, 0.6352941, 0, 1,
-1.309589, -1.033988, -1.75436, 1, 0.6431373, 0, 1,
-1.309122, -1.138921, -1.895187, 1, 0.6470588, 0, 1,
-1.308486, -1.587196, -1.241346, 1, 0.654902, 0, 1,
-1.30167, -0.6121945, -2.814525, 1, 0.6588235, 0, 1,
-1.29425, -0.2717388, -0.3578394, 1, 0.6666667, 0, 1,
-1.289186, 0.9386256, -1.187364, 1, 0.6705883, 0, 1,
-1.27767, -1.193991, -1.865489, 1, 0.6784314, 0, 1,
-1.277599, 0.243338, -2.168393, 1, 0.682353, 0, 1,
-1.274865, 1.367646, -0.09470243, 1, 0.6901961, 0, 1,
-1.259647, 0.4590303, -0.9395185, 1, 0.6941177, 0, 1,
-1.253802, -2.089511, -2.314617, 1, 0.7019608, 0, 1,
-1.252428, 0.1811085, -1.695754, 1, 0.7098039, 0, 1,
-1.248337, 1.152695, -2.215693, 1, 0.7137255, 0, 1,
-1.246907, -0.7964974, -1.286369, 1, 0.7215686, 0, 1,
-1.242819, -0.2681268, -2.433774, 1, 0.7254902, 0, 1,
-1.230147, 0.2171155, -2.500537, 1, 0.7333333, 0, 1,
-1.2258, -1.660409, -2.335935, 1, 0.7372549, 0, 1,
-1.22, 0.8361014, -0.5431525, 1, 0.7450981, 0, 1,
-1.218817, 1.162148, 0.4532614, 1, 0.7490196, 0, 1,
-1.217584, 0.5558643, -0.14212, 1, 0.7568628, 0, 1,
-1.209115, 0.1225591, -2.523477, 1, 0.7607843, 0, 1,
-1.203794, -0.6957586, -2.845194, 1, 0.7686275, 0, 1,
-1.202846, 0.4544044, -0.8996174, 1, 0.772549, 0, 1,
-1.202698, 1.305997, 0.2123149, 1, 0.7803922, 0, 1,
-1.190948, 1.597391, -1.332338, 1, 0.7843137, 0, 1,
-1.190529, -0.1361904, -1.205917, 1, 0.7921569, 0, 1,
-1.190513, 0.8629434, -1.042705, 1, 0.7960784, 0, 1,
-1.184657, 2.171261, -0.1589941, 1, 0.8039216, 0, 1,
-1.179579, 0.2620673, -0.452479, 1, 0.8117647, 0, 1,
-1.17606, 0.573002, -0.8168165, 1, 0.8156863, 0, 1,
-1.172017, -1.761965, -3.266691, 1, 0.8235294, 0, 1,
-1.161568, 0.239521, -1.004743, 1, 0.827451, 0, 1,
-1.158553, -0.3584871, -1.651893, 1, 0.8352941, 0, 1,
-1.157619, -1.071172, -4.232326, 1, 0.8392157, 0, 1,
-1.154228, -0.2799901, -1.062407, 1, 0.8470588, 0, 1,
-1.150406, -0.6387265, -1.363192, 1, 0.8509804, 0, 1,
-1.143271, -0.1236877, -0.9403099, 1, 0.8588235, 0, 1,
-1.138088, 1.429555, -0.9824291, 1, 0.8627451, 0, 1,
-1.125667, -0.7507169, -2.844054, 1, 0.8705882, 0, 1,
-1.124736, -2.439251, -1.996053, 1, 0.8745098, 0, 1,
-1.119259, -1.098772, -4.300699, 1, 0.8823529, 0, 1,
-1.116965, 0.7705825, -0.3042212, 1, 0.8862745, 0, 1,
-1.115154, 2.112659, 0.8425854, 1, 0.8941177, 0, 1,
-1.106313, -0.47117, -3.162164, 1, 0.8980392, 0, 1,
-1.095749, -1.691793, -3.058227, 1, 0.9058824, 0, 1,
-1.092594, 0.5402505, -1.286755, 1, 0.9137255, 0, 1,
-1.092186, 0.09377212, -2.401684, 1, 0.9176471, 0, 1,
-1.088434, -0.8111145, -2.753092, 1, 0.9254902, 0, 1,
-1.088105, -1.638072, -3.108502, 1, 0.9294118, 0, 1,
-1.086476, -1.228183, -2.46932, 1, 0.9372549, 0, 1,
-1.081895, 3.419843, 0.414332, 1, 0.9411765, 0, 1,
-1.075392, 0.6145749, -0.1989514, 1, 0.9490196, 0, 1,
-1.074524, 0.8539808, -1.173171, 1, 0.9529412, 0, 1,
-1.06824, 0.04765546, -1.795468, 1, 0.9607843, 0, 1,
-1.061914, 1.371603, 1.543028, 1, 0.9647059, 0, 1,
-1.061845, 1.034911, -2.58779, 1, 0.972549, 0, 1,
-1.054812, -0.3768246, -1.86899, 1, 0.9764706, 0, 1,
-1.048476, -0.5937278, -2.946072, 1, 0.9843137, 0, 1,
-1.045542, 0.5488419, -3.292479, 1, 0.9882353, 0, 1,
-1.044056, -0.2155934, -1.122496, 1, 0.9960784, 0, 1,
-1.042061, -0.4029315, -0.7378144, 0.9960784, 1, 0, 1,
-1.040146, 0.2814884, -2.101247, 0.9921569, 1, 0, 1,
-1.037454, 0.3779098, -0.8723626, 0.9843137, 1, 0, 1,
-1.034218, 1.351467, -0.1917569, 0.9803922, 1, 0, 1,
-1.030272, 0.07779144, -1.350696, 0.972549, 1, 0, 1,
-1.025541, -0.5863584, -1.110239, 0.9686275, 1, 0, 1,
-1.023757, -1.070873, -3.104309, 0.9607843, 1, 0, 1,
-1.018852, 1.607055, -2.410473, 0.9568627, 1, 0, 1,
-1.01646, 0.3898847, -1.095177, 0.9490196, 1, 0, 1,
-1.015613, 0.5671558, -0.8634819, 0.945098, 1, 0, 1,
-1.014499, 1.49965, -1.163138, 0.9372549, 1, 0, 1,
-1.004905, 1.152597, 0.9943905, 0.9333333, 1, 0, 1,
-1.003955, -0.04380505, -2.096582, 0.9254902, 1, 0, 1,
-0.9917423, 0.559379, -1.406278, 0.9215686, 1, 0, 1,
-0.9911699, 0.2594483, -2.262323, 0.9137255, 1, 0, 1,
-0.9895672, -0.1809276, -1.962397, 0.9098039, 1, 0, 1,
-0.9859181, 1.57525, -0.748424, 0.9019608, 1, 0, 1,
-0.9852509, -0.3004964, -1.630206, 0.8941177, 1, 0, 1,
-0.9847041, -1.485942, -3.874143, 0.8901961, 1, 0, 1,
-0.9842911, 1.02165, -1.996475, 0.8823529, 1, 0, 1,
-0.9762388, -0.4206882, -2.812246, 0.8784314, 1, 0, 1,
-0.9759108, 0.2196231, -0.5027721, 0.8705882, 1, 0, 1,
-0.9713763, 1.682598, -2.535088, 0.8666667, 1, 0, 1,
-0.9627072, -0.6628615, -1.673838, 0.8588235, 1, 0, 1,
-0.9625412, -0.5646466, -0.8006085, 0.854902, 1, 0, 1,
-0.9615614, 0.5091131, -2.008948, 0.8470588, 1, 0, 1,
-0.9588251, 1.262368, 0.1859641, 0.8431373, 1, 0, 1,
-0.9577342, -1.112708, -3.079289, 0.8352941, 1, 0, 1,
-0.9466057, 0.9011423, 0.6490817, 0.8313726, 1, 0, 1,
-0.9465691, -1.184753, -2.134518, 0.8235294, 1, 0, 1,
-0.9448969, 0.1905827, 0.02115732, 0.8196079, 1, 0, 1,
-0.9407536, -0.9470476, -0.6298333, 0.8117647, 1, 0, 1,
-0.932898, -0.6684954, -2.152942, 0.8078431, 1, 0, 1,
-0.9246774, 1.366651, -0.7384624, 0.8, 1, 0, 1,
-0.9203855, 1.642793, 0.1291299, 0.7921569, 1, 0, 1,
-0.914855, 1.991225, 0.7155971, 0.7882353, 1, 0, 1,
-0.9101511, 0.4488184, 0.1251325, 0.7803922, 1, 0, 1,
-0.8989502, 0.7412713, 1.464383, 0.7764706, 1, 0, 1,
-0.8951837, 1.294192, -1.695086, 0.7686275, 1, 0, 1,
-0.8923581, -1.685345, -1.993624, 0.7647059, 1, 0, 1,
-0.8744671, -0.04662672, -1.725145, 0.7568628, 1, 0, 1,
-0.871416, 0.0867867, -2.50144, 0.7529412, 1, 0, 1,
-0.8648493, -1.650196, -2.281529, 0.7450981, 1, 0, 1,
-0.8639739, 0.8057976, -1.440176, 0.7411765, 1, 0, 1,
-0.8612992, -0.3408981, -0.9769778, 0.7333333, 1, 0, 1,
-0.857516, 0.04717181, -1.060496, 0.7294118, 1, 0, 1,
-0.8556246, -0.7773985, -1.782758, 0.7215686, 1, 0, 1,
-0.84383, 1.195515, -1.289446, 0.7176471, 1, 0, 1,
-0.8415501, -2.728272, -4.546422, 0.7098039, 1, 0, 1,
-0.8414019, -1.275291, -2.878832, 0.7058824, 1, 0, 1,
-0.8398389, 0.7312959, 1.44076, 0.6980392, 1, 0, 1,
-0.8384421, 0.01401445, -1.830831, 0.6901961, 1, 0, 1,
-0.8351618, -1.440642, -2.156995, 0.6862745, 1, 0, 1,
-0.8318626, 1.561459, -0.6180751, 0.6784314, 1, 0, 1,
-0.8308571, -1.211877, -3.457896, 0.6745098, 1, 0, 1,
-0.8235405, 0.8368654, -1.644001, 0.6666667, 1, 0, 1,
-0.8229945, 0.9774689, -1.821766, 0.6627451, 1, 0, 1,
-0.8216461, -3.121435, -1.699267, 0.654902, 1, 0, 1,
-0.8165652, -0.2109793, 0.3915537, 0.6509804, 1, 0, 1,
-0.8140883, -0.7423608, -4.778027, 0.6431373, 1, 0, 1,
-0.8111863, 0.7260795, -1.386033, 0.6392157, 1, 0, 1,
-0.8071904, -0.5163417, -0.1020781, 0.6313726, 1, 0, 1,
-0.8048015, 0.6913835, 1.474757, 0.627451, 1, 0, 1,
-0.8002381, -1.355598, -3.333343, 0.6196079, 1, 0, 1,
-0.8001274, 0.1651697, -1.865049, 0.6156863, 1, 0, 1,
-0.7993482, 0.2983959, 0.6008922, 0.6078432, 1, 0, 1,
-0.7950111, -0.237012, -2.524143, 0.6039216, 1, 0, 1,
-0.7945401, -1.1382, -3.739301, 0.5960785, 1, 0, 1,
-0.7933645, -0.5708621, 0.208608, 0.5882353, 1, 0, 1,
-0.7888077, 1.443844, -1.003298, 0.5843138, 1, 0, 1,
-0.7852898, -1.267767, -1.100189, 0.5764706, 1, 0, 1,
-0.7814799, 0.6253182, -1.78635, 0.572549, 1, 0, 1,
-0.7804693, -0.3743957, -1.58417, 0.5647059, 1, 0, 1,
-0.7771575, -0.6213061, -1.729986, 0.5607843, 1, 0, 1,
-0.7729398, 0.3299085, -0.2220015, 0.5529412, 1, 0, 1,
-0.7584026, 0.5988575, -0.5971083, 0.5490196, 1, 0, 1,
-0.7369116, -1.038275, 0.2016841, 0.5411765, 1, 0, 1,
-0.7355222, -0.3244321, -2.231479, 0.5372549, 1, 0, 1,
-0.7346477, -1.854289, -1.906142, 0.5294118, 1, 0, 1,
-0.73317, 0.3224271, -0.640511, 0.5254902, 1, 0, 1,
-0.7308561, -0.2370359, -3.082737, 0.5176471, 1, 0, 1,
-0.7289169, 0.4714748, -1.605866, 0.5137255, 1, 0, 1,
-0.7285919, -1.134745, -2.596645, 0.5058824, 1, 0, 1,
-0.7193918, 0.4751118, -1.057847, 0.5019608, 1, 0, 1,
-0.7083499, -0.4005696, -4.211931, 0.4941176, 1, 0, 1,
-0.6971007, 0.04306735, -1.951541, 0.4862745, 1, 0, 1,
-0.6926131, 1.478881, 0.1271919, 0.4823529, 1, 0, 1,
-0.682458, -2.013302, -2.129471, 0.4745098, 1, 0, 1,
-0.6742005, -1.259186, -2.648262, 0.4705882, 1, 0, 1,
-0.6692973, 0.1778493, -2.381742, 0.4627451, 1, 0, 1,
-0.6596494, -1.026199, -1.763988, 0.4588235, 1, 0, 1,
-0.6589388, 0.07079082, -2.797585, 0.4509804, 1, 0, 1,
-0.6575412, 0.5700559, 0.01157267, 0.4470588, 1, 0, 1,
-0.6556029, -0.3259739, -2.816979, 0.4392157, 1, 0, 1,
-0.6490667, 0.1644758, -2.3657, 0.4352941, 1, 0, 1,
-0.6420106, 0.2362729, 0.7754062, 0.427451, 1, 0, 1,
-0.638699, -1.056983, -2.234503, 0.4235294, 1, 0, 1,
-0.6334208, -0.3818976, -1.698583, 0.4156863, 1, 0, 1,
-0.6332925, -0.5360522, -2.230628, 0.4117647, 1, 0, 1,
-0.631627, 1.690901, -0.663176, 0.4039216, 1, 0, 1,
-0.6287199, -0.2914469, -0.3558393, 0.3960784, 1, 0, 1,
-0.6251658, 0.3660817, -0.7506279, 0.3921569, 1, 0, 1,
-0.6222034, 1.572607, -0.9155471, 0.3843137, 1, 0, 1,
-0.6210328, 1.341995, -1.305568, 0.3803922, 1, 0, 1,
-0.6208097, -1.501828, -3.050263, 0.372549, 1, 0, 1,
-0.6195079, 0.1651832, -1.584514, 0.3686275, 1, 0, 1,
-0.6117936, -0.3976805, -1.638605, 0.3607843, 1, 0, 1,
-0.609825, -1.696087, -1.782461, 0.3568628, 1, 0, 1,
-0.6076875, -0.2980414, -3.551118, 0.3490196, 1, 0, 1,
-0.6054463, -1.598231, -3.471042, 0.345098, 1, 0, 1,
-0.5932285, 1.500581, 0.6136832, 0.3372549, 1, 0, 1,
-0.5889558, 0.3805041, -1.254516, 0.3333333, 1, 0, 1,
-0.5790932, 1.071987, -1.224453, 0.3254902, 1, 0, 1,
-0.5783845, 0.2827875, -1.880001, 0.3215686, 1, 0, 1,
-0.5730193, -1.698633, -1.275096, 0.3137255, 1, 0, 1,
-0.5729986, -1.521393, -1.433389, 0.3098039, 1, 0, 1,
-0.5636244, 1.086932, 0.6599194, 0.3019608, 1, 0, 1,
-0.556962, 0.02999306, -2.403167, 0.2941177, 1, 0, 1,
-0.5568631, 0.5611504, -2.503313, 0.2901961, 1, 0, 1,
-0.5567641, -0.8430988, -2.438437, 0.282353, 1, 0, 1,
-0.5555273, 1.02231, -0.5658681, 0.2784314, 1, 0, 1,
-0.5537274, 0.3128141, -0.6476289, 0.2705882, 1, 0, 1,
-0.5472031, -0.7888916, -2.17483, 0.2666667, 1, 0, 1,
-0.5457623, -0.6674231, -1.810517, 0.2588235, 1, 0, 1,
-0.5436733, 0.09625765, -1.302987, 0.254902, 1, 0, 1,
-0.5363383, 0.1694675, -1.614779, 0.2470588, 1, 0, 1,
-0.5361159, 1.266877, -0.4894206, 0.2431373, 1, 0, 1,
-0.5312232, -0.6416075, -0.5325769, 0.2352941, 1, 0, 1,
-0.5307934, -0.3151197, -3.268227, 0.2313726, 1, 0, 1,
-0.5286857, -1.859475, -2.782559, 0.2235294, 1, 0, 1,
-0.5269918, -0.9086972, -1.834218, 0.2196078, 1, 0, 1,
-0.5180789, -0.4918925, -0.5239753, 0.2117647, 1, 0, 1,
-0.5157815, -0.4037635, -4.203954, 0.2078431, 1, 0, 1,
-0.5149409, -0.09791103, -2.837839, 0.2, 1, 0, 1,
-0.5132201, -0.08783633, -0.4116268, 0.1921569, 1, 0, 1,
-0.5120991, -0.475129, -1.515395, 0.1882353, 1, 0, 1,
-0.508499, -0.786006, -1.647499, 0.1803922, 1, 0, 1,
-0.5037321, -1.071027, -2.924647, 0.1764706, 1, 0, 1,
-0.4982284, -1.799515, -2.944789, 0.1686275, 1, 0, 1,
-0.4949473, 0.4535556, -1.51036, 0.1647059, 1, 0, 1,
-0.4944566, -1.019334, -3.730237, 0.1568628, 1, 0, 1,
-0.4910223, -2.265391, -1.91168, 0.1529412, 1, 0, 1,
-0.4850054, -0.6808382, -4.446675, 0.145098, 1, 0, 1,
-0.4842465, 0.7491435, 0.1127737, 0.1411765, 1, 0, 1,
-0.4752046, 2.234006, 0.6228127, 0.1333333, 1, 0, 1,
-0.4737996, -1.240248, -2.872298, 0.1294118, 1, 0, 1,
-0.4717678, -0.4865369, -3.105844, 0.1215686, 1, 0, 1,
-0.4661605, 1.773641, -0.201131, 0.1176471, 1, 0, 1,
-0.4660252, 1.396445, 0.8519111, 0.1098039, 1, 0, 1,
-0.4642766, 1.066582, -1.614974, 0.1058824, 1, 0, 1,
-0.459789, -0.01303557, -2.592907, 0.09803922, 1, 0, 1,
-0.4584291, -0.0303985, -1.475686, 0.09019608, 1, 0, 1,
-0.4576608, 1.272232, -0.1323518, 0.08627451, 1, 0, 1,
-0.4416862, 1.326154, -1.977314, 0.07843138, 1, 0, 1,
-0.4408573, -2.194972, -1.502773, 0.07450981, 1, 0, 1,
-0.4288219, 1.932979, 0.01287079, 0.06666667, 1, 0, 1,
-0.4230986, 0.7817666, -0.2334576, 0.0627451, 1, 0, 1,
-0.4207858, -0.9924016, -1.931334, 0.05490196, 1, 0, 1,
-0.4159451, 0.09705307, -0.5342909, 0.05098039, 1, 0, 1,
-0.4150358, 0.8869078, 1.183204, 0.04313726, 1, 0, 1,
-0.4143487, 2.128331, 0.3889063, 0.03921569, 1, 0, 1,
-0.4094931, 0.4905842, 0.1162545, 0.03137255, 1, 0, 1,
-0.4058473, 0.2236734, -1.36322, 0.02745098, 1, 0, 1,
-0.4038391, -0.5236674, -3.469559, 0.01960784, 1, 0, 1,
-0.3855952, 1.072047, 1.010533, 0.01568628, 1, 0, 1,
-0.3838212, -0.5606219, -2.529833, 0.007843138, 1, 0, 1,
-0.3837883, 0.825009, 1.112653, 0.003921569, 1, 0, 1,
-0.3837814, 0.7245478, -0.6651246, 0, 1, 0.003921569, 1,
-0.3820997, -1.200082, -1.96144, 0, 1, 0.01176471, 1,
-0.381614, -1.011998, -2.029063, 0, 1, 0.01568628, 1,
-0.3784695, 1.656044, 0.4836593, 0, 1, 0.02352941, 1,
-0.3774466, -0.01527138, -1.692292, 0, 1, 0.02745098, 1,
-0.376169, -1.082202, -1.979787, 0, 1, 0.03529412, 1,
-0.3741392, 0.8380079, 0.05107873, 0, 1, 0.03921569, 1,
-0.3728606, 0.3854027, -1.312333, 0, 1, 0.04705882, 1,
-0.3718097, -0.1385606, -1.155906, 0, 1, 0.05098039, 1,
-0.3655611, -1.724086, -1.993895, 0, 1, 0.05882353, 1,
-0.3642359, 0.2014505, -0.7167214, 0, 1, 0.0627451, 1,
-0.3611933, -1.200077, -4.294285, 0, 1, 0.07058824, 1,
-0.3605849, -1.162825, -2.399552, 0, 1, 0.07450981, 1,
-0.3591009, -0.6213244, -3.883021, 0, 1, 0.08235294, 1,
-0.3578328, 0.6036329, -1.56058, 0, 1, 0.08627451, 1,
-0.3564014, 0.2701753, -2.519568, 0, 1, 0.09411765, 1,
-0.3517644, 0.1839118, -3.502448, 0, 1, 0.1019608, 1,
-0.3459193, 1.146381, 0.6263142, 0, 1, 0.1058824, 1,
-0.3439427, -0.4945882, 0.1279803, 0, 1, 0.1137255, 1,
-0.342067, 0.4951942, -1.409736, 0, 1, 0.1176471, 1,
-0.3320001, 1.17845, -0.6423556, 0, 1, 0.1254902, 1,
-0.3318113, -1.701446, -2.685107, 0, 1, 0.1294118, 1,
-0.3311392, 0.07814214, -1.243741, 0, 1, 0.1372549, 1,
-0.3304996, 0.5765432, 0.004402208, 0, 1, 0.1411765, 1,
-0.3297034, -0.04596932, -2.628203, 0, 1, 0.1490196, 1,
-0.3258626, 1.306083, -0.2566806, 0, 1, 0.1529412, 1,
-0.3251342, -1.159141, -2.824664, 0, 1, 0.1607843, 1,
-0.3191511, -0.446055, -2.44852, 0, 1, 0.1647059, 1,
-0.3168178, -0.5502102, -2.744254, 0, 1, 0.172549, 1,
-0.3123904, -1.613599, -3.744555, 0, 1, 0.1764706, 1,
-0.309802, -1.391314, -2.538804, 0, 1, 0.1843137, 1,
-0.3079821, -1.911503, -3.188513, 0, 1, 0.1882353, 1,
-0.3070295, 0.2987891, 0.4047299, 0, 1, 0.1960784, 1,
-0.3049515, 0.4898938, -0.31145, 0, 1, 0.2039216, 1,
-0.3025494, -2.593828, -3.515511, 0, 1, 0.2078431, 1,
-0.3000923, 0.1400543, -1.369216, 0, 1, 0.2156863, 1,
-0.298028, 0.6700118, -0.1241959, 0, 1, 0.2196078, 1,
-0.2967011, -1.041202, -2.776048, 0, 1, 0.227451, 1,
-0.2951996, -0.08155011, -1.413456, 0, 1, 0.2313726, 1,
-0.2926637, 2.095646, 0.344402, 0, 1, 0.2392157, 1,
-0.2924268, 0.0529876, -2.602562, 0, 1, 0.2431373, 1,
-0.2920799, -0.2980367, -3.620663, 0, 1, 0.2509804, 1,
-0.2893105, 0.7502827, 1.434267, 0, 1, 0.254902, 1,
-0.2883773, -0.677474, -3.073797, 0, 1, 0.2627451, 1,
-0.2880706, -1.654296, -2.467543, 0, 1, 0.2666667, 1,
-0.2797821, -1.098325, -4.033504, 0, 1, 0.2745098, 1,
-0.2742172, 0.7870231, -1.853972, 0, 1, 0.2784314, 1,
-0.2710907, -0.2755588, -2.963733, 0, 1, 0.2862745, 1,
-0.2688405, -0.7232231, -2.759304, 0, 1, 0.2901961, 1,
-0.2686772, 0.2916414, -0.1615134, 0, 1, 0.2980392, 1,
-0.2686265, -1.263257, -2.251424, 0, 1, 0.3058824, 1,
-0.2645633, -0.3975952, -3.547241, 0, 1, 0.3098039, 1,
-0.2640878, 2.193143, 0.9322694, 0, 1, 0.3176471, 1,
-0.2632301, 0.8801855, 0.9152414, 0, 1, 0.3215686, 1,
-0.2598802, 0.5027748, -0.7685963, 0, 1, 0.3294118, 1,
-0.2591882, -1.454981, -4.465735, 0, 1, 0.3333333, 1,
-0.2583894, 0.09766749, -0.7697217, 0, 1, 0.3411765, 1,
-0.2495736, 1.478053, 0.3828643, 0, 1, 0.345098, 1,
-0.2478649, -0.8977739, -0.8384513, 0, 1, 0.3529412, 1,
-0.2461832, -0.3997371, -3.505075, 0, 1, 0.3568628, 1,
-0.2457014, -0.03004126, -3.056355, 0, 1, 0.3647059, 1,
-0.2447173, -0.8489048, -2.992372, 0, 1, 0.3686275, 1,
-0.2444311, 1.139151, -0.05843193, 0, 1, 0.3764706, 1,
-0.2436469, -0.1348573, -2.656539, 0, 1, 0.3803922, 1,
-0.2434599, -1.125071, -3.357078, 0, 1, 0.3882353, 1,
-0.242709, -0.1235668, -3.210548, 0, 1, 0.3921569, 1,
-0.2425, 0.07541671, -1.854212, 0, 1, 0.4, 1,
-0.2404396, 0.5214345, 0.1039541, 0, 1, 0.4078431, 1,
-0.2382789, -2.075719, -6.90923, 0, 1, 0.4117647, 1,
-0.2277288, 0.01008152, -1.081493, 0, 1, 0.4196078, 1,
-0.2267134, 0.6358034, -1.475574, 0, 1, 0.4235294, 1,
-0.2255237, 0.7700865, -0.3411412, 0, 1, 0.4313726, 1,
-0.2241967, 0.5334976, -0.6178532, 0, 1, 0.4352941, 1,
-0.2191538, -0.1277217, -2.194189, 0, 1, 0.4431373, 1,
-0.2171884, 0.8964449, -2.640705, 0, 1, 0.4470588, 1,
-0.2167553, 0.4350519, -0.7213057, 0, 1, 0.454902, 1,
-0.2110192, -0.7802269, -3.87909, 0, 1, 0.4588235, 1,
-0.2045881, -0.7798387, -3.011546, 0, 1, 0.4666667, 1,
-0.2007978, -0.4341367, -1.463448, 0, 1, 0.4705882, 1,
-0.1989907, 0.7998585, -1.028241, 0, 1, 0.4784314, 1,
-0.1977155, -0.9058682, -2.921645, 0, 1, 0.4823529, 1,
-0.1925468, -2.580346, -2.60137, 0, 1, 0.4901961, 1,
-0.1918923, -0.4035645, -1.314389, 0, 1, 0.4941176, 1,
-0.1896189, 0.7958155, 1.008571, 0, 1, 0.5019608, 1,
-0.1861869, -0.5641773, -1.898411, 0, 1, 0.509804, 1,
-0.1851103, 0.7507902, -0.5778016, 0, 1, 0.5137255, 1,
-0.1829464, 1.171973, 0.2169017, 0, 1, 0.5215687, 1,
-0.1802403, -0.7007629, -3.399988, 0, 1, 0.5254902, 1,
-0.1790395, -0.3136216, -1.980088, 0, 1, 0.5333334, 1,
-0.178477, 0.1371203, -1.620104, 0, 1, 0.5372549, 1,
-0.1759984, 2.199178, -0.8518391, 0, 1, 0.5450981, 1,
-0.170967, -1.270734, -3.56799, 0, 1, 0.5490196, 1,
-0.1703122, -0.791383, -3.112776, 0, 1, 0.5568628, 1,
-0.1692715, -0.7196379, -2.141745, 0, 1, 0.5607843, 1,
-0.1679139, 0.7843317, -1.843613, 0, 1, 0.5686275, 1,
-0.1677245, 0.006729426, -0.9376633, 0, 1, 0.572549, 1,
-0.1671951, -0.8113576, -3.274314, 0, 1, 0.5803922, 1,
-0.1661091, -0.1423141, -1.223486, 0, 1, 0.5843138, 1,
-0.1647221, -0.316711, -3.025157, 0, 1, 0.5921569, 1,
-0.1606588, -1.214028, -4.163664, 0, 1, 0.5960785, 1,
-0.1599104, -1.226669, -4.658032, 0, 1, 0.6039216, 1,
-0.1550062, -1.226168, -2.725394, 0, 1, 0.6117647, 1,
-0.1516237, -1.198335, -2.932122, 0, 1, 0.6156863, 1,
-0.1512275, -1.193903, -3.954314, 0, 1, 0.6235294, 1,
-0.1280286, -1.034713, -0.9860507, 0, 1, 0.627451, 1,
-0.1264933, -0.1218498, -1.725217, 0, 1, 0.6352941, 1,
-0.1258351, 0.8461177, -0.1402843, 0, 1, 0.6392157, 1,
-0.1245106, -0.2491059, -3.387024, 0, 1, 0.6470588, 1,
-0.1232016, -0.06854384, -2.43947, 0, 1, 0.6509804, 1,
-0.1181486, 0.4348664, 0.1026495, 0, 1, 0.6588235, 1,
-0.1175065, -0.8983272, -1.068208, 0, 1, 0.6627451, 1,
-0.1161519, 0.1468856, -0.2624615, 0, 1, 0.6705883, 1,
-0.112665, -0.5268963, -2.373315, 0, 1, 0.6745098, 1,
-0.1118566, 1.597098, 0.7619452, 0, 1, 0.682353, 1,
-0.1118232, -0.009889018, -0.597828, 0, 1, 0.6862745, 1,
-0.1107555, 0.9183031, 0.04354211, 0, 1, 0.6941177, 1,
-0.1099462, 0.02506764, -1.646178, 0, 1, 0.7019608, 1,
-0.1081135, 0.2143019, 1.826484, 0, 1, 0.7058824, 1,
-0.1068892, 0.4623498, 0.4726599, 0, 1, 0.7137255, 1,
-0.09958817, 1.066189, -1.480574, 0, 1, 0.7176471, 1,
-0.09625155, 1.563922, 1.280129, 0, 1, 0.7254902, 1,
-0.09422187, -0.2849044, -1.508082, 0, 1, 0.7294118, 1,
-0.09367626, -1.065962, -3.497668, 0, 1, 0.7372549, 1,
-0.091792, -1.295336, -2.71476, 0, 1, 0.7411765, 1,
-0.08972847, -1.338229, -3.195749, 0, 1, 0.7490196, 1,
-0.08189265, 0.7932037, 0.0204248, 0, 1, 0.7529412, 1,
-0.08114001, 0.1761815, 0.5410807, 0, 1, 0.7607843, 1,
-0.07890619, 0.8525748, 0.4318017, 0, 1, 0.7647059, 1,
-0.07620907, -0.1417558, -2.000108, 0, 1, 0.772549, 1,
-0.07067199, 0.4361375, -2.387562, 0, 1, 0.7764706, 1,
-0.07058892, 0.4249884, -0.9098936, 0, 1, 0.7843137, 1,
-0.06740952, -0.9894219, -2.207632, 0, 1, 0.7882353, 1,
-0.06356604, -0.2377247, -0.1515959, 0, 1, 0.7960784, 1,
-0.06039998, -0.9928446, -2.578295, 0, 1, 0.8039216, 1,
-0.05952643, -0.4367982, -3.081376, 0, 1, 0.8078431, 1,
-0.05659386, -1.294855, -3.239436, 0, 1, 0.8156863, 1,
-0.05125536, -1.478375, -3.811672, 0, 1, 0.8196079, 1,
-0.05091412, -0.4357675, -1.04663, 0, 1, 0.827451, 1,
-0.04930404, -0.0007183166, 0.3566507, 0, 1, 0.8313726, 1,
-0.04811723, -1.866171, -1.784865, 0, 1, 0.8392157, 1,
-0.04700571, -0.07946216, -1.387862, 0, 1, 0.8431373, 1,
-0.04658275, 0.05846325, -1.584764, 0, 1, 0.8509804, 1,
-0.04645638, -1.148384, -2.923413, 0, 1, 0.854902, 1,
-0.04014339, -0.4589219, -2.371284, 0, 1, 0.8627451, 1,
-0.02819897, -0.06226186, -2.251425, 0, 1, 0.8666667, 1,
-0.02712103, 2.02059, -1.283634, 0, 1, 0.8745098, 1,
-0.0230159, -0.438636, -3.395884, 0, 1, 0.8784314, 1,
-0.01718787, -0.1334829, -3.453767, 0, 1, 0.8862745, 1,
-0.01709018, -0.9021542, -1.90768, 0, 1, 0.8901961, 1,
-0.01695929, -0.05948625, -1.193081, 0, 1, 0.8980392, 1,
-0.01607136, 1.029319, -0.5543121, 0, 1, 0.9058824, 1,
-0.01257476, -0.06596628, -3.615005, 0, 1, 0.9098039, 1,
-0.007271694, 1.337498, 0.1034, 0, 1, 0.9176471, 1,
-0.00397362, -1.944492, -2.730414, 0, 1, 0.9215686, 1,
-0.00301719, -0.1673398, -2.179356, 0, 1, 0.9294118, 1,
0.002744239, 0.1589869, 0.3534359, 0, 1, 0.9333333, 1,
0.003232219, -1.418481, 3.998226, 0, 1, 0.9411765, 1,
0.004098604, -1.3937, 0.6203127, 0, 1, 0.945098, 1,
0.009436726, -0.07835363, 0.6066985, 0, 1, 0.9529412, 1,
0.01163929, -0.5382217, 3.867689, 0, 1, 0.9568627, 1,
0.01185466, 0.4821549, -0.8548471, 0, 1, 0.9647059, 1,
0.01337918, 0.2035202, -0.9983293, 0, 1, 0.9686275, 1,
0.01722117, 1.738439, 0.8210077, 0, 1, 0.9764706, 1,
0.01732256, -1.291702, 1.579301, 0, 1, 0.9803922, 1,
0.0197407, 0.6198934, 0.1145143, 0, 1, 0.9882353, 1,
0.02378258, -0.5311041, 3.24666, 0, 1, 0.9921569, 1,
0.02625768, -2.204192, 3.954374, 0, 1, 1, 1,
0.02760272, -1.217752, 2.798974, 0, 0.9921569, 1, 1,
0.02763263, -0.04548616, 4.507715, 0, 0.9882353, 1, 1,
0.02915872, 0.5554921, -0.556467, 0, 0.9803922, 1, 1,
0.0316324, 1.252949, 0.2180419, 0, 0.9764706, 1, 1,
0.03282414, 0.6874621, 0.6782101, 0, 0.9686275, 1, 1,
0.03397841, -1.3143, 2.010482, 0, 0.9647059, 1, 1,
0.0358367, 1.621704, 0.838079, 0, 0.9568627, 1, 1,
0.04804283, -0.09214808, 1.858911, 0, 0.9529412, 1, 1,
0.04926374, 0.1372147, -0.4183477, 0, 0.945098, 1, 1,
0.05342861, -1.405102, 1.597538, 0, 0.9411765, 1, 1,
0.05637952, 0.09291571, -0.1548674, 0, 0.9333333, 1, 1,
0.05955419, -1.625904, 3.817157, 0, 0.9294118, 1, 1,
0.05976356, 0.9388558, 0.3414181, 0, 0.9215686, 1, 1,
0.06951693, -1.825408, 2.661103, 0, 0.9176471, 1, 1,
0.07963457, -0.5929244, 2.99161, 0, 0.9098039, 1, 1,
0.0836725, 1.075509, 0.2698402, 0, 0.9058824, 1, 1,
0.08441373, 0.5560708, 0.1566305, 0, 0.8980392, 1, 1,
0.08567333, -0.207459, 2.687774, 0, 0.8901961, 1, 1,
0.08607084, 0.8444279, 0.2779678, 0, 0.8862745, 1, 1,
0.0881711, 0.8469296, 1.127414, 0, 0.8784314, 1, 1,
0.09476808, 0.2892507, -0.7771192, 0, 0.8745098, 1, 1,
0.09729651, -0.07485583, 2.216805, 0, 0.8666667, 1, 1,
0.09954456, 0.6915524, 0.8178974, 0, 0.8627451, 1, 1,
0.1079995, -0.4945378, 2.599742, 0, 0.854902, 1, 1,
0.1084904, -0.7476341, 2.870308, 0, 0.8509804, 1, 1,
0.1119149, 1.761155, -0.07601862, 0, 0.8431373, 1, 1,
0.1147584, 0.2744482, 1.398383, 0, 0.8392157, 1, 1,
0.1173118, -0.2438719, -0.7984968, 0, 0.8313726, 1, 1,
0.1182605, 0.3798376, 1.155517, 0, 0.827451, 1, 1,
0.1226744, 1.506358, -0.7744437, 0, 0.8196079, 1, 1,
0.1242858, -0.499, 1.355734, 0, 0.8156863, 1, 1,
0.1265967, 1.661433, -0.5648626, 0, 0.8078431, 1, 1,
0.1286123, 0.04619138, 0.5413828, 0, 0.8039216, 1, 1,
0.1300109, 0.3294369, -0.3700644, 0, 0.7960784, 1, 1,
0.1301614, -0.7636997, 4.019989, 0, 0.7882353, 1, 1,
0.1335542, 0.9072016, 0.1482514, 0, 0.7843137, 1, 1,
0.1342229, 0.1624659, 0.2445069, 0, 0.7764706, 1, 1,
0.1361688, 0.8578485, -0.194482, 0, 0.772549, 1, 1,
0.1361891, 2.596927, -0.3407965, 0, 0.7647059, 1, 1,
0.1379038, -0.7336103, 3.286533, 0, 0.7607843, 1, 1,
0.1423508, 0.09676281, 2.440261, 0, 0.7529412, 1, 1,
0.1425598, -0.7498782, 3.078536, 0, 0.7490196, 1, 1,
0.1432895, 0.4437224, 1.717669, 0, 0.7411765, 1, 1,
0.1499059, 0.3288658, 1.464773, 0, 0.7372549, 1, 1,
0.1500569, -0.2928981, 3.915404, 0, 0.7294118, 1, 1,
0.1534753, 0.5136088, 1.105971, 0, 0.7254902, 1, 1,
0.1537163, -0.7735391, 3.148477, 0, 0.7176471, 1, 1,
0.1548937, -0.8654838, 4.429863, 0, 0.7137255, 1, 1,
0.1557011, -2.195597, 3.667627, 0, 0.7058824, 1, 1,
0.1589197, -0.08826806, 0.2610239, 0, 0.6980392, 1, 1,
0.1595677, 0.8363171, 0.4523283, 0, 0.6941177, 1, 1,
0.1771559, 0.7823313, 2.581803, 0, 0.6862745, 1, 1,
0.1805578, -1.694137, 3.444503, 0, 0.682353, 1, 1,
0.1810492, 0.08185697, 2.27073, 0, 0.6745098, 1, 1,
0.1848675, -0.1684394, 2.190295, 0, 0.6705883, 1, 1,
0.1853308, -0.1981419, 2.819843, 0, 0.6627451, 1, 1,
0.1907175, 0.2514668, 1.200216, 0, 0.6588235, 1, 1,
0.1913468, -0.4656764, 3.61427, 0, 0.6509804, 1, 1,
0.1944363, -0.6637439, 2.771477, 0, 0.6470588, 1, 1,
0.1946923, 0.3962375, -0.8941186, 0, 0.6392157, 1, 1,
0.1953548, -0.9250664, 2.643742, 0, 0.6352941, 1, 1,
0.1960628, 0.4971677, 2.252702, 0, 0.627451, 1, 1,
0.197942, -1.365715, 3.433927, 0, 0.6235294, 1, 1,
0.2010433, 0.6251986, -1.42678, 0, 0.6156863, 1, 1,
0.202254, -1.326676, 1.437626, 0, 0.6117647, 1, 1,
0.2049368, -1.397249, 2.773709, 0, 0.6039216, 1, 1,
0.2053416, -1.213843, 3.657628, 0, 0.5960785, 1, 1,
0.2112609, -0.6405208, 4.192513, 0, 0.5921569, 1, 1,
0.2117554, 0.5816281, 0.1978386, 0, 0.5843138, 1, 1,
0.2140801, 0.7438439, 0.4751496, 0, 0.5803922, 1, 1,
0.2158027, -1.082702, 2.696162, 0, 0.572549, 1, 1,
0.2163767, -0.38921, 1.162693, 0, 0.5686275, 1, 1,
0.2200049, -0.6606466, 1.830655, 0, 0.5607843, 1, 1,
0.2203302, -0.1137168, 2.55996, 0, 0.5568628, 1, 1,
0.2221738, -0.942181, 1.75879, 0, 0.5490196, 1, 1,
0.2232352, -0.6679555, 2.515844, 0, 0.5450981, 1, 1,
0.230736, -0.7991152, 3.105325, 0, 0.5372549, 1, 1,
0.2324965, 1.060317, 1.099337, 0, 0.5333334, 1, 1,
0.2337121, -0.09004468, 1.670865, 0, 0.5254902, 1, 1,
0.2347484, -1.646105, 1.995952, 0, 0.5215687, 1, 1,
0.2391363, 1.323312, -1.913685, 0, 0.5137255, 1, 1,
0.2419305, 0.3844807, 2.462527, 0, 0.509804, 1, 1,
0.2421068, 0.1823954, -1.127218, 0, 0.5019608, 1, 1,
0.2427826, 1.004083, 1.189877, 0, 0.4941176, 1, 1,
0.2436416, 0.5983603, -1.631244, 0, 0.4901961, 1, 1,
0.2448118, 0.585568, 0.6842152, 0, 0.4823529, 1, 1,
0.2453969, 0.002249437, 1.280951, 0, 0.4784314, 1, 1,
0.2456274, -1.070816, 3.964912, 0, 0.4705882, 1, 1,
0.2479701, 0.7038429, 2.199983, 0, 0.4666667, 1, 1,
0.2488404, -1.03284, 4.988676, 0, 0.4588235, 1, 1,
0.2495684, 2.108969, 0.1267582, 0, 0.454902, 1, 1,
0.2505692, -0.7697787, 3.864131, 0, 0.4470588, 1, 1,
0.2509112, -0.5488731, 2.138432, 0, 0.4431373, 1, 1,
0.2551338, -1.07848, 1.097228, 0, 0.4352941, 1, 1,
0.2592963, 0.2715774, 0.03479018, 0, 0.4313726, 1, 1,
0.2625269, -0.092277, 2.062821, 0, 0.4235294, 1, 1,
0.2639074, -0.9780463, 1.935518, 0, 0.4196078, 1, 1,
0.2665791, 0.3784624, 0.8996326, 0, 0.4117647, 1, 1,
0.2676407, 0.8935504, 0.9780916, 0, 0.4078431, 1, 1,
0.2695786, -0.4616555, 2.920479, 0, 0.4, 1, 1,
0.2727181, -0.1497384, 1.114466, 0, 0.3921569, 1, 1,
0.2742141, 0.1038646, 1.27285, 0, 0.3882353, 1, 1,
0.2749992, 1.13661, -0.2316113, 0, 0.3803922, 1, 1,
0.2752421, 0.7639843, 0.1778429, 0, 0.3764706, 1, 1,
0.2783568, 0.6089039, -0.6180487, 0, 0.3686275, 1, 1,
0.2812904, 1.248509, 1.158578, 0, 0.3647059, 1, 1,
0.2824103, -0.7426556, 2.403019, 0, 0.3568628, 1, 1,
0.2852968, 0.07079242, 1.108448, 0, 0.3529412, 1, 1,
0.2869616, 0.5586301, 0.02065717, 0, 0.345098, 1, 1,
0.2886503, 0.1058097, 0.3504399, 0, 0.3411765, 1, 1,
0.2887295, 1.039334, -1.608845, 0, 0.3333333, 1, 1,
0.2895352, -1.542599, 2.5765, 0, 0.3294118, 1, 1,
0.2922532, -2.557079, 3.321619, 0, 0.3215686, 1, 1,
0.2931132, -0.6870105, 0.622317, 0, 0.3176471, 1, 1,
0.2943732, -2.332697, 3.332785, 0, 0.3098039, 1, 1,
0.295038, 0.3322275, 0.3497409, 0, 0.3058824, 1, 1,
0.3044857, -0.4056623, 2.145666, 0, 0.2980392, 1, 1,
0.3050846, -0.9872593, 3.05828, 0, 0.2901961, 1, 1,
0.3093418, -0.1662348, 2.195633, 0, 0.2862745, 1, 1,
0.3094716, -0.4406402, 1.341803, 0, 0.2784314, 1, 1,
0.3170869, -2.156995, 3.753483, 0, 0.2745098, 1, 1,
0.3173155, 0.7045562, 0.6321543, 0, 0.2666667, 1, 1,
0.3219711, 0.1943775, 2.538482, 0, 0.2627451, 1, 1,
0.3241101, 2.788645, -0.5598271, 0, 0.254902, 1, 1,
0.3247702, 0.9719484, -0.6725121, 0, 0.2509804, 1, 1,
0.3248832, -0.1983224, 3.925355, 0, 0.2431373, 1, 1,
0.3249153, -1.462903, 3.325322, 0, 0.2392157, 1, 1,
0.3251963, -0.420143, 2.472877, 0, 0.2313726, 1, 1,
0.3276395, -0.744154, 1.641576, 0, 0.227451, 1, 1,
0.3293369, -0.8678667, 2.491142, 0, 0.2196078, 1, 1,
0.3299211, 0.9470849, 1.171499, 0, 0.2156863, 1, 1,
0.3387127, 1.797516, 0.9165918, 0, 0.2078431, 1, 1,
0.340108, 0.5574542, 1.050951, 0, 0.2039216, 1, 1,
0.3429919, -0.6506339, 2.104888, 0, 0.1960784, 1, 1,
0.3439174, 1.852107, -0.03764691, 0, 0.1882353, 1, 1,
0.3449721, 0.1612621, -1.126766, 0, 0.1843137, 1, 1,
0.3491343, 1.141078, -1.393162, 0, 0.1764706, 1, 1,
0.3515625, -1.02693, 2.57489, 0, 0.172549, 1, 1,
0.352529, 0.2301898, 1.379084, 0, 0.1647059, 1, 1,
0.354039, -2.435599, 5.250268, 0, 0.1607843, 1, 1,
0.3541386, 0.09402455, 2.657738, 0, 0.1529412, 1, 1,
0.3546453, -0.9478549, 2.599085, 0, 0.1490196, 1, 1,
0.3552284, 0.89698, 0.2945139, 0, 0.1411765, 1, 1,
0.3599665, -0.202865, 2.114221, 0, 0.1372549, 1, 1,
0.369523, -1.093925, 2.113139, 0, 0.1294118, 1, 1,
0.3781937, -0.4727929, 2.438542, 0, 0.1254902, 1, 1,
0.3783776, 0.6689539, -0.2005324, 0, 0.1176471, 1, 1,
0.379041, 1.605783, 0.6794791, 0, 0.1137255, 1, 1,
0.3821975, 0.4247261, 0.8050733, 0, 0.1058824, 1, 1,
0.3840028, -0.6925992, 3.890204, 0, 0.09803922, 1, 1,
0.3849383, 1.140583, -0.256563, 0, 0.09411765, 1, 1,
0.3877792, 0.7929926, 1.027886, 0, 0.08627451, 1, 1,
0.3895249, 0.1638372, 2.323193, 0, 0.08235294, 1, 1,
0.3905709, -0.1386999, 3.273258, 0, 0.07450981, 1, 1,
0.3934484, 0.6519044, -0.3366483, 0, 0.07058824, 1, 1,
0.3943775, -0.254566, 0.8846609, 0, 0.0627451, 1, 1,
0.397878, 0.419836, 0.2098269, 0, 0.05882353, 1, 1,
0.4007956, -1.072833, 3.107723, 0, 0.05098039, 1, 1,
0.4024753, -0.6955175, 4.242801, 0, 0.04705882, 1, 1,
0.4084622, 0.3133501, 1.797341, 0, 0.03921569, 1, 1,
0.41124, -0.1059246, 1.887411, 0, 0.03529412, 1, 1,
0.4161984, 1.69248, 0.4471561, 0, 0.02745098, 1, 1,
0.4223472, 0.9001334, 1.651421, 0, 0.02352941, 1, 1,
0.4253505, -0.6786565, 1.33465, 0, 0.01568628, 1, 1,
0.4261796, 0.6891056, 1.152919, 0, 0.01176471, 1, 1,
0.4309791, -2.359164, 2.724683, 0, 0.003921569, 1, 1,
0.4314125, -0.001559889, 0.8312652, 0.003921569, 0, 1, 1,
0.4327166, 1.503744, -0.7171, 0.007843138, 0, 1, 1,
0.4341854, 0.2347092, 1.26428, 0.01568628, 0, 1, 1,
0.4381235, 0.3804522, 2.182714, 0.01960784, 0, 1, 1,
0.4421032, 0.4626365, -0.2592578, 0.02745098, 0, 1, 1,
0.4428557, 0.4668326, 0.190208, 0.03137255, 0, 1, 1,
0.4437702, 0.155876, 0.439503, 0.03921569, 0, 1, 1,
0.4484659, 0.06485621, 0.101083, 0.04313726, 0, 1, 1,
0.4521118, 0.516473, 2.041673, 0.05098039, 0, 1, 1,
0.452734, 0.4969794, 2.092921, 0.05490196, 0, 1, 1,
0.4578926, 0.9734235, -0.4502186, 0.0627451, 0, 1, 1,
0.4586576, -0.5264902, 2.989726, 0.06666667, 0, 1, 1,
0.4590411, -1.331889, 3.398389, 0.07450981, 0, 1, 1,
0.4622551, 0.193218, 1.889453, 0.07843138, 0, 1, 1,
0.4625705, -1.264646, 2.123441, 0.08627451, 0, 1, 1,
0.4627085, -0.3399745, 3.589872, 0.09019608, 0, 1, 1,
0.4639625, 0.9881142, 1.487859, 0.09803922, 0, 1, 1,
0.4727682, 0.3689041, 1.044521, 0.1058824, 0, 1, 1,
0.4777099, 0.3153566, 0.05621771, 0.1098039, 0, 1, 1,
0.4813129, 0.7806775, 2.321477, 0.1176471, 0, 1, 1,
0.4850521, -1.510695, 3.444734, 0.1215686, 0, 1, 1,
0.4858629, -0.8005965, 3.072732, 0.1294118, 0, 1, 1,
0.4860969, -0.5536203, 1.915999, 0.1333333, 0, 1, 1,
0.4882782, -1.218411, 3.322045, 0.1411765, 0, 1, 1,
0.4935193, 0.498453, 1.000755, 0.145098, 0, 1, 1,
0.4941859, 0.9400048, 0.4597423, 0.1529412, 0, 1, 1,
0.4953945, 0.6303822, -0.4602107, 0.1568628, 0, 1, 1,
0.5008398, -0.596024, 2.046304, 0.1647059, 0, 1, 1,
0.5051351, 0.1556597, 2.621665, 0.1686275, 0, 1, 1,
0.5089176, 0.5031522, 0.3922267, 0.1764706, 0, 1, 1,
0.5106382, -1.947015, 4.181455, 0.1803922, 0, 1, 1,
0.5123104, 0.2064688, 0.3776956, 0.1882353, 0, 1, 1,
0.5127403, -0.05119981, 2.527189, 0.1921569, 0, 1, 1,
0.5159686, -0.9821636, 3.337435, 0.2, 0, 1, 1,
0.5165699, 1.076616, 1.74111, 0.2078431, 0, 1, 1,
0.5175156, -0.8069597, 1.252428, 0.2117647, 0, 1, 1,
0.5187505, -0.3022937, 1.4605, 0.2196078, 0, 1, 1,
0.5257811, -1.104457, 3.069292, 0.2235294, 0, 1, 1,
0.5291613, -1.006027, 1.368755, 0.2313726, 0, 1, 1,
0.5301905, -1.263956, 2.00454, 0.2352941, 0, 1, 1,
0.5303969, -1.252722, 5.692664, 0.2431373, 0, 1, 1,
0.5439731, -0.5236484, 2.067902, 0.2470588, 0, 1, 1,
0.5440724, 1.509558, 0.6087683, 0.254902, 0, 1, 1,
0.5588498, 1.846822, 0.3252996, 0.2588235, 0, 1, 1,
0.5596671, 0.9474329, 0.7889919, 0.2666667, 0, 1, 1,
0.5600497, 1.53254, -0.9404277, 0.2705882, 0, 1, 1,
0.5623707, 0.5266583, 0.4327002, 0.2784314, 0, 1, 1,
0.5654181, 1.812431, 1.100321, 0.282353, 0, 1, 1,
0.5672657, 0.6519642, 0.01888263, 0.2901961, 0, 1, 1,
0.5723686, -0.1634356, 1.178286, 0.2941177, 0, 1, 1,
0.5727883, 0.3495124, 0.8859595, 0.3019608, 0, 1, 1,
0.5739765, 0.3025035, -1.098253, 0.3098039, 0, 1, 1,
0.574793, 0.9170817, 0.04919157, 0.3137255, 0, 1, 1,
0.5778915, 0.9517676, 0.9204184, 0.3215686, 0, 1, 1,
0.5796319, 0.3010917, 0.0437096, 0.3254902, 0, 1, 1,
0.5806863, 0.02778428, 0.5130426, 0.3333333, 0, 1, 1,
0.5838046, 1.465357, 1.918721, 0.3372549, 0, 1, 1,
0.585786, -1.548218, 3.406011, 0.345098, 0, 1, 1,
0.5870947, -0.9042133, 4.107963, 0.3490196, 0, 1, 1,
0.5956569, 0.3412119, 0.09987758, 0.3568628, 0, 1, 1,
0.6065706, -0.562341, 2.93861, 0.3607843, 0, 1, 1,
0.6084798, 0.6898886, 0.4840511, 0.3686275, 0, 1, 1,
0.6129529, -0.9244051, 3.256278, 0.372549, 0, 1, 1,
0.614086, -0.1493059, 1.232374, 0.3803922, 0, 1, 1,
0.6194077, 0.3774806, 2.107397, 0.3843137, 0, 1, 1,
0.6205084, 0.4377259, 0.5419457, 0.3921569, 0, 1, 1,
0.6209198, -0.07534903, 0.9664378, 0.3960784, 0, 1, 1,
0.6250666, -1.059192, 2.697043, 0.4039216, 0, 1, 1,
0.6277488, 0.009497407, 1.620716, 0.4117647, 0, 1, 1,
0.6316613, 1.151217, -0.3894353, 0.4156863, 0, 1, 1,
0.6331904, -1.333903, 3.901709, 0.4235294, 0, 1, 1,
0.6401012, -1.425778, 4.11966, 0.427451, 0, 1, 1,
0.6426628, -1.077359, 4.290111, 0.4352941, 0, 1, 1,
0.6471027, 0.2475866, 1.278484, 0.4392157, 0, 1, 1,
0.6474089, 1.818532, -0.5543837, 0.4470588, 0, 1, 1,
0.6625527, 0.8233254, -0.3777237, 0.4509804, 0, 1, 1,
0.6661605, 0.6665952, 1.024373, 0.4588235, 0, 1, 1,
0.6675326, -0.6230291, 1.521848, 0.4627451, 0, 1, 1,
0.6680214, -1.386826, 1.658142, 0.4705882, 0, 1, 1,
0.6693007, 1.173525, 0.01419672, 0.4745098, 0, 1, 1,
0.6735981, -2.008798, 2.478051, 0.4823529, 0, 1, 1,
0.6739311, -0.976824, 1.90909, 0.4862745, 0, 1, 1,
0.6786154, -0.627757, 1.194659, 0.4941176, 0, 1, 1,
0.6792259, -0.4312787, 1.910984, 0.5019608, 0, 1, 1,
0.6796132, 0.3179638, -0.1750515, 0.5058824, 0, 1, 1,
0.6825756, 1.388561, 0.131727, 0.5137255, 0, 1, 1,
0.6844301, -1.393546, 2.800055, 0.5176471, 0, 1, 1,
0.6872384, -0.2606688, 2.070014, 0.5254902, 0, 1, 1,
0.6916778, 1.611696, 1.404821, 0.5294118, 0, 1, 1,
0.7012588, -1.019684, 4.192273, 0.5372549, 0, 1, 1,
0.7042169, -0.354902, 1.005692, 0.5411765, 0, 1, 1,
0.7070698, -0.7089893, 2.232291, 0.5490196, 0, 1, 1,
0.7200444, -2.085109, 3.412811, 0.5529412, 0, 1, 1,
0.7201283, 0.9160417, 2.291225, 0.5607843, 0, 1, 1,
0.7213129, -1.462588, 2.661479, 0.5647059, 0, 1, 1,
0.7219806, -1.192285, 2.221201, 0.572549, 0, 1, 1,
0.7394981, -0.4137244, 2.596773, 0.5764706, 0, 1, 1,
0.7420637, -1.379726, 2.364283, 0.5843138, 0, 1, 1,
0.7432353, 0.8828213, 0.3791563, 0.5882353, 0, 1, 1,
0.743821, 0.8078855, 1.402649, 0.5960785, 0, 1, 1,
0.7439073, 1.71814, 0.9138756, 0.6039216, 0, 1, 1,
0.7519175, -0.08975463, 1.419964, 0.6078432, 0, 1, 1,
0.7535067, -0.9976367, 1.870528, 0.6156863, 0, 1, 1,
0.7554069, 0.6519265, 1.549553, 0.6196079, 0, 1, 1,
0.7593202, -0.8750688, 2.67011, 0.627451, 0, 1, 1,
0.7618051, -0.7820408, 2.722955, 0.6313726, 0, 1, 1,
0.7636673, 0.0913013, 3.392697, 0.6392157, 0, 1, 1,
0.7641369, -0.8281122, 2.340305, 0.6431373, 0, 1, 1,
0.7660751, -0.5459995, 0.6368857, 0.6509804, 0, 1, 1,
0.7675152, 0.6473426, -1.107419, 0.654902, 0, 1, 1,
0.7704127, 1.323272, -0.2536901, 0.6627451, 0, 1, 1,
0.7761757, 1.595271, 2.624431, 0.6666667, 0, 1, 1,
0.7796384, 0.6448524, 0.3914328, 0.6745098, 0, 1, 1,
0.7809582, 1.362795, 0.9750038, 0.6784314, 0, 1, 1,
0.7847105, 0.5052449, 1.738206, 0.6862745, 0, 1, 1,
0.7876202, 0.09962311, 0.2138153, 0.6901961, 0, 1, 1,
0.7919633, 1.274612, -0.8929911, 0.6980392, 0, 1, 1,
0.792125, -0.8352842, 2.292238, 0.7058824, 0, 1, 1,
0.7954381, -0.1230698, 2.189967, 0.7098039, 0, 1, 1,
0.7967882, -1.93646, 2.691394, 0.7176471, 0, 1, 1,
0.8033245, -0.6560522, 3.848752, 0.7215686, 0, 1, 1,
0.8035172, 0.926348, 1.144019, 0.7294118, 0, 1, 1,
0.8045713, 0.9089518, -0.5733043, 0.7333333, 0, 1, 1,
0.8066826, 1.662784, -0.5248584, 0.7411765, 0, 1, 1,
0.8071936, 0.6674796, 1.398262, 0.7450981, 0, 1, 1,
0.8075676, 0.1340626, 1.191671, 0.7529412, 0, 1, 1,
0.808136, 0.3712652, 2.103658, 0.7568628, 0, 1, 1,
0.808731, 1.459439, 0.2175858, 0.7647059, 0, 1, 1,
0.8229909, 0.004253264, 1.121505, 0.7686275, 0, 1, 1,
0.8237305, -0.003252123, 1.914059, 0.7764706, 0, 1, 1,
0.8325417, -0.08836643, 0.8241879, 0.7803922, 0, 1, 1,
0.8330004, 0.09306412, 1.032751, 0.7882353, 0, 1, 1,
0.8468405, -0.08829284, 1.600259, 0.7921569, 0, 1, 1,
0.8482612, 0.7291452, 1.052779, 0.8, 0, 1, 1,
0.8484706, -0.2503681, 3.029362, 0.8078431, 0, 1, 1,
0.8543159, -0.2085164, 2.473535, 0.8117647, 0, 1, 1,
0.8585349, 0.3222924, 2.655067, 0.8196079, 0, 1, 1,
0.8618456, 1.044311, 1.477715, 0.8235294, 0, 1, 1,
0.8631573, 0.3498997, 0.9862329, 0.8313726, 0, 1, 1,
0.8706685, -0.1263368, 2.441764, 0.8352941, 0, 1, 1,
0.8709751, -0.5680056, 1.668745, 0.8431373, 0, 1, 1,
0.873659, -1.673305, 2.922432, 0.8470588, 0, 1, 1,
0.877733, 0.2717482, -0.1153542, 0.854902, 0, 1, 1,
0.8782819, 1.735066, -0.6407871, 0.8588235, 0, 1, 1,
0.8897513, -0.3838896, 1.904357, 0.8666667, 0, 1, 1,
0.8919368, -0.8316664, 3.746595, 0.8705882, 0, 1, 1,
0.8973412, -0.06558631, 1.524111, 0.8784314, 0, 1, 1,
0.8989931, 0.3730029, 1.279174, 0.8823529, 0, 1, 1,
0.9010929, 0.8532383, 1.309224, 0.8901961, 0, 1, 1,
0.9050534, 0.9300292, 1.735851, 0.8941177, 0, 1, 1,
0.9050692, 0.8040836, 2.895328, 0.9019608, 0, 1, 1,
0.9062945, -1.577455, 2.154067, 0.9098039, 0, 1, 1,
0.9128949, -0.5795119, 2.987564, 0.9137255, 0, 1, 1,
0.9153398, -0.1620859, 1.354087, 0.9215686, 0, 1, 1,
0.9216965, -0.5252118, 2.419917, 0.9254902, 0, 1, 1,
0.9259711, -0.4483755, 2.031494, 0.9333333, 0, 1, 1,
0.9262612, 1.444242, 1.699072, 0.9372549, 0, 1, 1,
0.9283603, 0.6820943, -0.225859, 0.945098, 0, 1, 1,
0.9306788, -0.002997272, 2.661467, 0.9490196, 0, 1, 1,
0.9336092, -0.4827054, 2.749851, 0.9568627, 0, 1, 1,
0.9350869, 1.396323, 0.1356576, 0.9607843, 0, 1, 1,
0.9353756, -0.5967471, 1.288212, 0.9686275, 0, 1, 1,
0.935621, 0.8270426, 1.703951, 0.972549, 0, 1, 1,
0.9359185, 0.4609639, 0.8250547, 0.9803922, 0, 1, 1,
0.9512489, -0.4972216, 1.907741, 0.9843137, 0, 1, 1,
0.9512765, 0.05237615, 1.370717, 0.9921569, 0, 1, 1,
0.9635799, -0.005439152, 1.984109, 0.9960784, 0, 1, 1,
0.9643925, -0.7846171, 2.125932, 1, 0, 0.9960784, 1,
0.9652678, -0.8242216, 5.207832, 1, 0, 0.9882353, 1,
0.9676391, 0.2886809, 2.787645, 1, 0, 0.9843137, 1,
0.9711293, 0.8545946, -0.9782033, 1, 0, 0.9764706, 1,
0.9750919, 0.1565737, 1.719942, 1, 0, 0.972549, 1,
0.978359, -0.8423834, 3.231773, 1, 0, 0.9647059, 1,
0.9859153, -0.1069751, 1.809434, 1, 0, 0.9607843, 1,
0.989046, 1.752568, 0.8031591, 1, 0, 0.9529412, 1,
0.9935528, 0.9823078, 0.8709616, 1, 0, 0.9490196, 1,
0.9967616, 0.3883254, 2.279606, 1, 0, 0.9411765, 1,
0.9976887, -1.086113, 3.748072, 1, 0, 0.9372549, 1,
1.009809, -0.5834851, 2.694924, 1, 0, 0.9294118, 1,
1.015801, -0.01482382, 4.234421, 1, 0, 0.9254902, 1,
1.016696, 0.4595957, -0.2275488, 1, 0, 0.9176471, 1,
1.020871, -1.050601, 2.517469, 1, 0, 0.9137255, 1,
1.021602, -0.6013725, 1.639508, 1, 0, 0.9058824, 1,
1.021706, -0.4336263, 1.746752, 1, 0, 0.9019608, 1,
1.022423, -0.7858918, 1.652753, 1, 0, 0.8941177, 1,
1.023924, -0.3050042, 1.654002, 1, 0, 0.8862745, 1,
1.024995, 0.07079645, 1.919093, 1, 0, 0.8823529, 1,
1.027197, 1.034979, -0.7808642, 1, 0, 0.8745098, 1,
1.033287, 1.037762, 2.401378, 1, 0, 0.8705882, 1,
1.033488, -0.6975321, 4.394663, 1, 0, 0.8627451, 1,
1.038024, -1.158027, 2.118232, 1, 0, 0.8588235, 1,
1.057279, -0.2522616, 2.775799, 1, 0, 0.8509804, 1,
1.05788, -1.548182, 4.031644, 1, 0, 0.8470588, 1,
1.062372, 0.6291648, 2.68584, 1, 0, 0.8392157, 1,
1.067202, -0.2336418, 2.039623, 1, 0, 0.8352941, 1,
1.069566, 0.5069759, 2.859417, 1, 0, 0.827451, 1,
1.07704, 0.4613024, 1.317772, 1, 0, 0.8235294, 1,
1.079027, -1.1633, 2.144874, 1, 0, 0.8156863, 1,
1.09181, -1.107905, 2.362353, 1, 0, 0.8117647, 1,
1.092586, -0.6831154, 3.568625, 1, 0, 0.8039216, 1,
1.096118, 0.07630416, 0.9336169, 1, 0, 0.7960784, 1,
1.099658, -0.9359397, 3.028545, 1, 0, 0.7921569, 1,
1.105284, -0.8368826, 1.734383, 1, 0, 0.7843137, 1,
1.107921, -0.5626298, 2.434855, 1, 0, 0.7803922, 1,
1.108699, -0.3484885, 0.6565819, 1, 0, 0.772549, 1,
1.110251, -0.5590264, 1.216577, 1, 0, 0.7686275, 1,
1.111016, 1.464949, 1.473102, 1, 0, 0.7607843, 1,
1.113282, -0.9052535, 1.028229, 1, 0, 0.7568628, 1,
1.127707, 1.77431, 1.120927, 1, 0, 0.7490196, 1,
1.132856, 1.542, 1.625393, 1, 0, 0.7450981, 1,
1.13687, 0.9447727, 1.774017, 1, 0, 0.7372549, 1,
1.139777, -1.316541, 3.081526, 1, 0, 0.7333333, 1,
1.141638, -1.51294, 1.8438, 1, 0, 0.7254902, 1,
1.14756, -0.2643515, 2.404917, 1, 0, 0.7215686, 1,
1.154836, -1.119075, 3.697706, 1, 0, 0.7137255, 1,
1.154901, -0.3603031, -0.0251719, 1, 0, 0.7098039, 1,
1.161363, -0.5453664, 2.18265, 1, 0, 0.7019608, 1,
1.173325, 0.9535647, 1.014621, 1, 0, 0.6941177, 1,
1.178804, 0.226388, 3.172555, 1, 0, 0.6901961, 1,
1.181579, -0.6647707, 2.735718, 1, 0, 0.682353, 1,
1.191361, -0.6050339, 1.962548, 1, 0, 0.6784314, 1,
1.193965, 0.1070594, 1.194176, 1, 0, 0.6705883, 1,
1.201819, -0.2214992, 2.998121, 1, 0, 0.6666667, 1,
1.203562, -0.6193533, 3.342813, 1, 0, 0.6588235, 1,
1.206241, 0.1963627, -0.2849546, 1, 0, 0.654902, 1,
1.207041, -1.014087, 2.233469, 1, 0, 0.6470588, 1,
1.217098, -1.39448, 0.5153194, 1, 0, 0.6431373, 1,
1.219039, 0.2422091, 1.331658, 1, 0, 0.6352941, 1,
1.220646, 0.6234951, 1.623896, 1, 0, 0.6313726, 1,
1.23206, 0.9583869, 0.2776299, 1, 0, 0.6235294, 1,
1.23735, -0.5615078, 3.124274, 1, 0, 0.6196079, 1,
1.239451, -0.6613446, 2.922517, 1, 0, 0.6117647, 1,
1.252769, -1.439843, 2.472634, 1, 0, 0.6078432, 1,
1.278279, -1.170884, 2.744333, 1, 0, 0.6, 1,
1.281311, 0.4047762, 0.2463239, 1, 0, 0.5921569, 1,
1.289754, -1.305878, 1.917077, 1, 0, 0.5882353, 1,
1.301937, -0.6429595, 1.556191, 1, 0, 0.5803922, 1,
1.303368, -0.5499574, 1.434803, 1, 0, 0.5764706, 1,
1.316398, 0.8372071, 0.732823, 1, 0, 0.5686275, 1,
1.316843, 0.005002731, 1.489759, 1, 0, 0.5647059, 1,
1.328244, 1.124818, 1.076919, 1, 0, 0.5568628, 1,
1.343851, -0.128022, 0.9560715, 1, 0, 0.5529412, 1,
1.349463, 1.483397, 1.430897, 1, 0, 0.5450981, 1,
1.350269, 0.4732348, 4.157959, 1, 0, 0.5411765, 1,
1.357671, 0.9404379, 1.521144, 1, 0, 0.5333334, 1,
1.366074, -0.9980621, 2.307864, 1, 0, 0.5294118, 1,
1.367341, 0.9788115, 0.5406023, 1, 0, 0.5215687, 1,
1.37554, 0.6390967, 1.470087, 1, 0, 0.5176471, 1,
1.378733, -0.3441578, 1.517174, 1, 0, 0.509804, 1,
1.379724, -0.2266476, 2.812734, 1, 0, 0.5058824, 1,
1.387948, 0.2602642, 2.142799, 1, 0, 0.4980392, 1,
1.389441, 0.9822642, 0.6544173, 1, 0, 0.4901961, 1,
1.39587, -0.2926856, 2.695818, 1, 0, 0.4862745, 1,
1.400529, -0.945848, 2.064432, 1, 0, 0.4784314, 1,
1.401212, -1.350748, 2.384583, 1, 0, 0.4745098, 1,
1.402769, -0.1198484, 1.951242, 1, 0, 0.4666667, 1,
1.40876, 0.3088078, 1.305254, 1, 0, 0.4627451, 1,
1.410146, -1.301359, 3.080235, 1, 0, 0.454902, 1,
1.417717, 0.07444118, 0.9822459, 1, 0, 0.4509804, 1,
1.423587, -0.9825894, 3.094363, 1, 0, 0.4431373, 1,
1.426903, 1.474358, -0.6839401, 1, 0, 0.4392157, 1,
1.434134, -0.7204587, 2.337769, 1, 0, 0.4313726, 1,
1.445888, -1.668384, 1.960736, 1, 0, 0.427451, 1,
1.450488, -0.852495, 3.259629, 1, 0, 0.4196078, 1,
1.459579, 1.314944, 2.571357, 1, 0, 0.4156863, 1,
1.468723, 1.077627, 1.958867, 1, 0, 0.4078431, 1,
1.470069, -0.8157702, 1.600552, 1, 0, 0.4039216, 1,
1.475281, -0.4471906, 2.669963, 1, 0, 0.3960784, 1,
1.476685, -0.8526721, 4.087976, 1, 0, 0.3882353, 1,
1.480252, 0.3355953, 1.524097, 1, 0, 0.3843137, 1,
1.484585, 1.26281, 0.7231173, 1, 0, 0.3764706, 1,
1.484996, 0.7932674, 2.248123, 1, 0, 0.372549, 1,
1.498536, -1.131462, 2.080966, 1, 0, 0.3647059, 1,
1.510451, -0.2386412, 1.877704, 1, 0, 0.3607843, 1,
1.513116, -0.6413203, 1.984102, 1, 0, 0.3529412, 1,
1.520711, 0.804249, 0.2444957, 1, 0, 0.3490196, 1,
1.54312, -0.03949931, 1.347495, 1, 0, 0.3411765, 1,
1.544921, -1.635243, 3.40788, 1, 0, 0.3372549, 1,
1.567257, -0.04041985, 2.844883, 1, 0, 0.3294118, 1,
1.574337, -0.7507787, 2.095997, 1, 0, 0.3254902, 1,
1.589061, 1.21448, 2.083375, 1, 0, 0.3176471, 1,
1.593761, -0.2538918, 0.9230903, 1, 0, 0.3137255, 1,
1.59804, 1.659683, 0.6218339, 1, 0, 0.3058824, 1,
1.607731, 1.10062, -0.2644267, 1, 0, 0.2980392, 1,
1.615149, 0.6857592, 2.480719, 1, 0, 0.2941177, 1,
1.619585, -1.397755, 0.9278388, 1, 0, 0.2862745, 1,
1.628148, 0.8740484, 0.8585476, 1, 0, 0.282353, 1,
1.630912, 1.320167, 1.438341, 1, 0, 0.2745098, 1,
1.641493, 0.5047921, 1.353839, 1, 0, 0.2705882, 1,
1.653669, -1.296145, 1.293696, 1, 0, 0.2627451, 1,
1.657222, -0.03966786, -0.0315248, 1, 0, 0.2588235, 1,
1.671596, 1.49018, -0.436812, 1, 0, 0.2509804, 1,
1.681028, 0.1944616, 3.105028, 1, 0, 0.2470588, 1,
1.686888, -0.4377137, 2.540236, 1, 0, 0.2392157, 1,
1.688022, -0.03059321, 2.606492, 1, 0, 0.2352941, 1,
1.697504, -0.1494408, 2.263271, 1, 0, 0.227451, 1,
1.700367, -2.365959, 4.214617, 1, 0, 0.2235294, 1,
1.702512, 1.240708, 1.843914, 1, 0, 0.2156863, 1,
1.713497, 1.994525, -0.7729263, 1, 0, 0.2117647, 1,
1.723517, -0.8895685, 1.892793, 1, 0, 0.2039216, 1,
1.72384, -1.553016, 2.292555, 1, 0, 0.1960784, 1,
1.743727, -0.8541957, 0.5390797, 1, 0, 0.1921569, 1,
1.744379, 0.1964029, 2.248507, 1, 0, 0.1843137, 1,
1.744708, -1.935309, 1.577564, 1, 0, 0.1803922, 1,
1.753049, -0.2203628, 2.838889, 1, 0, 0.172549, 1,
1.804573, -0.4287469, 0.3344409, 1, 0, 0.1686275, 1,
1.835356, 1.178454, 0.08451928, 1, 0, 0.1607843, 1,
1.848696, -1.802254, 3.749491, 1, 0, 0.1568628, 1,
1.867702, -0.5280507, 2.968921, 1, 0, 0.1490196, 1,
1.877068, -1.135849, 2.467598, 1, 0, 0.145098, 1,
1.882133, 0.3260095, 0.9387705, 1, 0, 0.1372549, 1,
1.886505, -0.8553124, 1.417942, 1, 0, 0.1333333, 1,
1.908571, 0.1479756, 1.487245, 1, 0, 0.1254902, 1,
1.908601, 1.373054, 0.6201056, 1, 0, 0.1215686, 1,
1.962877, -0.04490716, 1.692585, 1, 0, 0.1137255, 1,
1.968504, 1.111786, 2.644819, 1, 0, 0.1098039, 1,
1.973107, -0.4761129, 1.631353, 1, 0, 0.1019608, 1,
1.991873, 0.795226, -0.6971183, 1, 0, 0.09411765, 1,
2.004824, 1.352521, 0.6024156, 1, 0, 0.09019608, 1,
2.022688, 0.8659497, 2.327487, 1, 0, 0.08235294, 1,
2.068887, 0.2499928, 1.158596, 1, 0, 0.07843138, 1,
2.142101, -0.4918926, 0.8511599, 1, 0, 0.07058824, 1,
2.206945, 0.3328619, 1.381276, 1, 0, 0.06666667, 1,
2.255165, -0.7562456, 1.82882, 1, 0, 0.05882353, 1,
2.358299, -0.2018502, 2.301098, 1, 0, 0.05490196, 1,
2.421278, -1.525981, 2.760392, 1, 0, 0.04705882, 1,
2.445881, -0.7318906, 2.065105, 1, 0, 0.04313726, 1,
2.45405, -0.3059101, 4.05158, 1, 0, 0.03529412, 1,
2.497162, 1.205016, -0.5295684, 1, 0, 0.03137255, 1,
2.788403, 0.7995704, 1.635419, 1, 0, 0.02352941, 1,
2.833644, 0.9143173, 1.55096, 1, 0, 0.01960784, 1,
2.878323, 0.02957541, 1.712705, 1, 0, 0.01176471, 1,
3.297738, 0.00111607, 1.807453, 1, 0, 0.007843138, 1
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
0.05030584, -4.230182, -9.045251, 0, -0.5, 0.5, 0.5,
0.05030584, -4.230182, -9.045251, 1, -0.5, 0.5, 0.5,
0.05030584, -4.230182, -9.045251, 1, 1.5, 0.5, 0.5,
0.05030584, -4.230182, -9.045251, 0, 1.5, 0.5, 0.5
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
-4.298006, 0.1492043, -9.045251, 0, -0.5, 0.5, 0.5,
-4.298006, 0.1492043, -9.045251, 1, -0.5, 0.5, 0.5,
-4.298006, 0.1492043, -9.045251, 1, 1.5, 0.5, 0.5,
-4.298006, 0.1492043, -9.045251, 0, 1.5, 0.5, 0.5
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
-4.298006, -4.230182, -0.6082828, 0, -0.5, 0.5, 0.5,
-4.298006, -4.230182, -0.6082828, 1, -0.5, 0.5, 0.5,
-4.298006, -4.230182, -0.6082828, 1, 1.5, 0.5, 0.5,
-4.298006, -4.230182, -0.6082828, 0, 1.5, 0.5, 0.5
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
-3, -3.219554, -7.098258,
3, -3.219554, -7.098258,
-3, -3.219554, -7.098258,
-3, -3.387992, -7.422757,
-2, -3.219554, -7.098258,
-2, -3.387992, -7.422757,
-1, -3.219554, -7.098258,
-1, -3.387992, -7.422757,
0, -3.219554, -7.098258,
0, -3.387992, -7.422757,
1, -3.219554, -7.098258,
1, -3.387992, -7.422757,
2, -3.219554, -7.098258,
2, -3.387992, -7.422757,
3, -3.219554, -7.098258,
3, -3.387992, -7.422757
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
"-3",
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
-3, -3.724868, -8.071754, 0, -0.5, 0.5, 0.5,
-3, -3.724868, -8.071754, 1, -0.5, 0.5, 0.5,
-3, -3.724868, -8.071754, 1, 1.5, 0.5, 0.5,
-3, -3.724868, -8.071754, 0, 1.5, 0.5, 0.5,
-2, -3.724868, -8.071754, 0, -0.5, 0.5, 0.5,
-2, -3.724868, -8.071754, 1, -0.5, 0.5, 0.5,
-2, -3.724868, -8.071754, 1, 1.5, 0.5, 0.5,
-2, -3.724868, -8.071754, 0, 1.5, 0.5, 0.5,
-1, -3.724868, -8.071754, 0, -0.5, 0.5, 0.5,
-1, -3.724868, -8.071754, 1, -0.5, 0.5, 0.5,
-1, -3.724868, -8.071754, 1, 1.5, 0.5, 0.5,
-1, -3.724868, -8.071754, 0, 1.5, 0.5, 0.5,
0, -3.724868, -8.071754, 0, -0.5, 0.5, 0.5,
0, -3.724868, -8.071754, 1, -0.5, 0.5, 0.5,
0, -3.724868, -8.071754, 1, 1.5, 0.5, 0.5,
0, -3.724868, -8.071754, 0, 1.5, 0.5, 0.5,
1, -3.724868, -8.071754, 0, -0.5, 0.5, 0.5,
1, -3.724868, -8.071754, 1, -0.5, 0.5, 0.5,
1, -3.724868, -8.071754, 1, 1.5, 0.5, 0.5,
1, -3.724868, -8.071754, 0, 1.5, 0.5, 0.5,
2, -3.724868, -8.071754, 0, -0.5, 0.5, 0.5,
2, -3.724868, -8.071754, 1, -0.5, 0.5, 0.5,
2, -3.724868, -8.071754, 1, 1.5, 0.5, 0.5,
2, -3.724868, -8.071754, 0, 1.5, 0.5, 0.5,
3, -3.724868, -8.071754, 0, -0.5, 0.5, 0.5,
3, -3.724868, -8.071754, 1, -0.5, 0.5, 0.5,
3, -3.724868, -8.071754, 1, 1.5, 0.5, 0.5,
3, -3.724868, -8.071754, 0, 1.5, 0.5, 0.5
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
-3.294549, -3, -7.098258,
-3.294549, 3, -7.098258,
-3.294549, -3, -7.098258,
-3.461792, -3, -7.422757,
-3.294549, -2, -7.098258,
-3.461792, -2, -7.422757,
-3.294549, -1, -7.098258,
-3.461792, -1, -7.422757,
-3.294549, 0, -7.098258,
-3.461792, 0, -7.422757,
-3.294549, 1, -7.098258,
-3.461792, 1, -7.422757,
-3.294549, 2, -7.098258,
-3.461792, 2, -7.422757,
-3.294549, 3, -7.098258,
-3.461792, 3, -7.422757
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
-3.796278, -3, -8.071754, 0, -0.5, 0.5, 0.5,
-3.796278, -3, -8.071754, 1, -0.5, 0.5, 0.5,
-3.796278, -3, -8.071754, 1, 1.5, 0.5, 0.5,
-3.796278, -3, -8.071754, 0, 1.5, 0.5, 0.5,
-3.796278, -2, -8.071754, 0, -0.5, 0.5, 0.5,
-3.796278, -2, -8.071754, 1, -0.5, 0.5, 0.5,
-3.796278, -2, -8.071754, 1, 1.5, 0.5, 0.5,
-3.796278, -2, -8.071754, 0, 1.5, 0.5, 0.5,
-3.796278, -1, -8.071754, 0, -0.5, 0.5, 0.5,
-3.796278, -1, -8.071754, 1, -0.5, 0.5, 0.5,
-3.796278, -1, -8.071754, 1, 1.5, 0.5, 0.5,
-3.796278, -1, -8.071754, 0, 1.5, 0.5, 0.5,
-3.796278, 0, -8.071754, 0, -0.5, 0.5, 0.5,
-3.796278, 0, -8.071754, 1, -0.5, 0.5, 0.5,
-3.796278, 0, -8.071754, 1, 1.5, 0.5, 0.5,
-3.796278, 0, -8.071754, 0, 1.5, 0.5, 0.5,
-3.796278, 1, -8.071754, 0, -0.5, 0.5, 0.5,
-3.796278, 1, -8.071754, 1, -0.5, 0.5, 0.5,
-3.796278, 1, -8.071754, 1, 1.5, 0.5, 0.5,
-3.796278, 1, -8.071754, 0, 1.5, 0.5, 0.5,
-3.796278, 2, -8.071754, 0, -0.5, 0.5, 0.5,
-3.796278, 2, -8.071754, 1, -0.5, 0.5, 0.5,
-3.796278, 2, -8.071754, 1, 1.5, 0.5, 0.5,
-3.796278, 2, -8.071754, 0, 1.5, 0.5, 0.5,
-3.796278, 3, -8.071754, 0, -0.5, 0.5, 0.5,
-3.796278, 3, -8.071754, 1, -0.5, 0.5, 0.5,
-3.796278, 3, -8.071754, 1, 1.5, 0.5, 0.5,
-3.796278, 3, -8.071754, 0, 1.5, 0.5, 0.5
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
-3.294549, -3.219554, -6,
-3.294549, -3.219554, 4,
-3.294549, -3.219554, -6,
-3.461792, -3.387992, -6,
-3.294549, -3.219554, -4,
-3.461792, -3.387992, -4,
-3.294549, -3.219554, -2,
-3.461792, -3.387992, -2,
-3.294549, -3.219554, 0,
-3.461792, -3.387992, 0,
-3.294549, -3.219554, 2,
-3.461792, -3.387992, 2,
-3.294549, -3.219554, 4,
-3.461792, -3.387992, 4
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
-3.796278, -3.724868, -6, 0, -0.5, 0.5, 0.5,
-3.796278, -3.724868, -6, 1, -0.5, 0.5, 0.5,
-3.796278, -3.724868, -6, 1, 1.5, 0.5, 0.5,
-3.796278, -3.724868, -6, 0, 1.5, 0.5, 0.5,
-3.796278, -3.724868, -4, 0, -0.5, 0.5, 0.5,
-3.796278, -3.724868, -4, 1, -0.5, 0.5, 0.5,
-3.796278, -3.724868, -4, 1, 1.5, 0.5, 0.5,
-3.796278, -3.724868, -4, 0, 1.5, 0.5, 0.5,
-3.796278, -3.724868, -2, 0, -0.5, 0.5, 0.5,
-3.796278, -3.724868, -2, 1, -0.5, 0.5, 0.5,
-3.796278, -3.724868, -2, 1, 1.5, 0.5, 0.5,
-3.796278, -3.724868, -2, 0, 1.5, 0.5, 0.5,
-3.796278, -3.724868, 0, 0, -0.5, 0.5, 0.5,
-3.796278, -3.724868, 0, 1, -0.5, 0.5, 0.5,
-3.796278, -3.724868, 0, 1, 1.5, 0.5, 0.5,
-3.796278, -3.724868, 0, 0, 1.5, 0.5, 0.5,
-3.796278, -3.724868, 2, 0, -0.5, 0.5, 0.5,
-3.796278, -3.724868, 2, 1, -0.5, 0.5, 0.5,
-3.796278, -3.724868, 2, 1, 1.5, 0.5, 0.5,
-3.796278, -3.724868, 2, 0, 1.5, 0.5, 0.5,
-3.796278, -3.724868, 4, 0, -0.5, 0.5, 0.5,
-3.796278, -3.724868, 4, 1, -0.5, 0.5, 0.5,
-3.796278, -3.724868, 4, 1, 1.5, 0.5, 0.5,
-3.796278, -3.724868, 4, 0, 1.5, 0.5, 0.5
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
-3.294549, -3.219554, -7.098258,
-3.294549, 3.517963, -7.098258,
-3.294549, -3.219554, 5.881692,
-3.294549, 3.517963, 5.881692,
-3.294549, -3.219554, -7.098258,
-3.294549, -3.219554, 5.881692,
-3.294549, 3.517963, -7.098258,
-3.294549, 3.517963, 5.881692,
-3.294549, -3.219554, -7.098258,
3.395161, -3.219554, -7.098258,
-3.294549, -3.219554, 5.881692,
3.395161, -3.219554, 5.881692,
-3.294549, 3.517963, -7.098258,
3.395161, 3.517963, -7.098258,
-3.294549, 3.517963, 5.881692,
3.395161, 3.517963, 5.881692,
3.395161, -3.219554, -7.098258,
3.395161, 3.517963, -7.098258,
3.395161, -3.219554, 5.881692,
3.395161, 3.517963, 5.881692,
3.395161, -3.219554, -7.098258,
3.395161, -3.219554, 5.881692,
3.395161, 3.517963, -7.098258,
3.395161, 3.517963, 5.881692
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
var radius = 8.587389;
var distance = 38.20626;
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
mvMatrix.translate( -0.05030584, -0.1492043, 0.6082828 );
mvMatrix.scale( 1.387931, 1.378082, 0.7153227 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -38.20626);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
Stirofos<-read.table("Stirofos.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Stirofos$V2
```

```
## Error in eval(expr, envir, enclos): object 'Stirofos' not found
```

```r
y<-Stirofos$V3
```

```
## Error in eval(expr, envir, enclos): object 'Stirofos' not found
```

```r
z<-Stirofos$V4
```

```
## Error in eval(expr, envir, enclos): object 'Stirofos' not found
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
-3.197126, -1.791115, -3.584554, 0, 0, 1, 1, 1,
-3.044027, 0.7026017, -2.018832, 1, 0, 0, 1, 1,
-2.963716, 0.7481987, -0.9461071, 1, 0, 0, 1, 1,
-2.865925, -1.081905, -2.952792, 1, 0, 0, 1, 1,
-2.717458, 0.7872419, -0.7398355, 1, 0, 0, 1, 1,
-2.573077, -0.9439402, -2.03856, 1, 0, 0, 1, 1,
-2.542449, 1.339393, -0.8697771, 0, 0, 0, 1, 1,
-2.522768, 1.417798, -0.2948143, 0, 0, 0, 1, 1,
-2.515582, 0.4526533, -0.1742914, 0, 0, 0, 1, 1,
-2.453715, -1.531114, -3.657963, 0, 0, 0, 1, 1,
-2.422938, 0.3885267, -1.750846, 0, 0, 0, 1, 1,
-2.412567, -1.754304, -3.54218, 0, 0, 0, 1, 1,
-2.380948, 0.8779492, -0.6207049, 0, 0, 0, 1, 1,
-2.365705, 0.0874332, -2.336203, 1, 1, 1, 1, 1,
-2.348135, -1.53179, -1.183265, 1, 1, 1, 1, 1,
-2.326991, -0.4898281, -3.52836, 1, 1, 1, 1, 1,
-2.249358, -2.052902, -0.8223522, 1, 1, 1, 1, 1,
-2.245404, -0.2914423, -1.141312, 1, 1, 1, 1, 1,
-2.234228, 0.7718478, -0.3698926, 1, 1, 1, 1, 1,
-2.211169, 0.6468822, -2.688214, 1, 1, 1, 1, 1,
-2.165794, 0.09649868, -1.491458, 1, 1, 1, 1, 1,
-2.13515, 0.4365967, -3.294699, 1, 1, 1, 1, 1,
-2.105767, 0.860114, -1.033895, 1, 1, 1, 1, 1,
-2.055607, -1.047469, -1.856562, 1, 1, 1, 1, 1,
-2.054269, -1.062478, -0.8121912, 1, 1, 1, 1, 1,
-2.021367, 0.5078347, -1.830709, 1, 1, 1, 1, 1,
-2.004609, -0.8856519, -1.380863, 1, 1, 1, 1, 1,
-1.990557, -0.68604, -1.836378, 1, 1, 1, 1, 1,
-1.9862, -0.1233157, -2.556318, 0, 0, 1, 1, 1,
-1.977222, -1.386331, -1.498563, 1, 0, 0, 1, 1,
-1.917962, -1.658425, -3.202262, 1, 0, 0, 1, 1,
-1.911777, -1.010691, -2.344463, 1, 0, 0, 1, 1,
-1.897195, 1.516376, -1.235524, 1, 0, 0, 1, 1,
-1.874143, -0.4155039, -0.8479269, 1, 0, 0, 1, 1,
-1.847929, 2.353689, 1.517832, 0, 0, 0, 1, 1,
-1.832399, -0.4346049, -0.5418906, 0, 0, 0, 1, 1,
-1.807888, 1.175259, -1.202624, 0, 0, 0, 1, 1,
-1.807528, 0.4396771, -1.184264, 0, 0, 0, 1, 1,
-1.784217, -1.384629, -3.529738, 0, 0, 0, 1, 1,
-1.781802, -0.2438997, -1.03586, 0, 0, 0, 1, 1,
-1.778037, 1.218243, -1.905389, 0, 0, 0, 1, 1,
-1.763344, -0.3661976, -4.404306, 1, 1, 1, 1, 1,
-1.755915, 0.1484781, -1.36952, 1, 1, 1, 1, 1,
-1.750845, -1.581929, -2.668079, 1, 1, 1, 1, 1,
-1.744795, -1.647992, -2.537002, 1, 1, 1, 1, 1,
-1.733129, -2.23713, -2.629391, 1, 1, 1, 1, 1,
-1.726359, -0.8333281, -3.239348, 1, 1, 1, 1, 1,
-1.724799, -0.5428818, -1.084611, 1, 1, 1, 1, 1,
-1.724684, -0.3310898, -2.203818, 1, 1, 1, 1, 1,
-1.721182, -0.8101134, -1.326483, 1, 1, 1, 1, 1,
-1.716229, -1.486059, -2.468701, 1, 1, 1, 1, 1,
-1.704916, 1.589338, -1.20806, 1, 1, 1, 1, 1,
-1.698051, -0.8180667, -2.961648, 1, 1, 1, 1, 1,
-1.682451, 0.2571675, -2.460549, 1, 1, 1, 1, 1,
-1.680529, 0.3997757, -3.747389, 1, 1, 1, 1, 1,
-1.667261, -0.1254698, -1.462441, 1, 1, 1, 1, 1,
-1.661019, -0.4632641, -3.422228, 0, 0, 1, 1, 1,
-1.654839, -0.722344, -3.12929, 1, 0, 0, 1, 1,
-1.639428, 1.095759, 1.004375, 1, 0, 0, 1, 1,
-1.635032, 1.361881, -1.524037, 1, 0, 0, 1, 1,
-1.632004, -1.489758, -2.186777, 1, 0, 0, 1, 1,
-1.629003, 0.4571191, -0.2679331, 1, 0, 0, 1, 1,
-1.624979, 1.524251, -0.4126254, 0, 0, 0, 1, 1,
-1.616784, 0.4133526, -1.491669, 0, 0, 0, 1, 1,
-1.596296, 0.07266347, -0.7247736, 0, 0, 0, 1, 1,
-1.583504, 1.309819, 0.3502014, 0, 0, 0, 1, 1,
-1.574585, -0.8348756, -0.7970602, 0, 0, 0, 1, 1,
-1.570194, -1.364009, -1.437221, 0, 0, 0, 1, 1,
-1.563065, 0.918561, -0.3617699, 0, 0, 0, 1, 1,
-1.557161, -0.2288684, -3.218735, 1, 1, 1, 1, 1,
-1.555913, 0.4754405, -1.325194, 1, 1, 1, 1, 1,
-1.554612, -0.03321806, -1.334267, 1, 1, 1, 1, 1,
-1.54139, 0.2810987, -1.861567, 1, 1, 1, 1, 1,
-1.528883, -0.3073118, -2.841565, 1, 1, 1, 1, 1,
-1.505594, 0.07295053, -1.851467, 1, 1, 1, 1, 1,
-1.504551, -0.4908949, -2.988557, 1, 1, 1, 1, 1,
-1.503738, -0.3756792, -1.177077, 1, 1, 1, 1, 1,
-1.463419, -1.037371, -0.6936809, 1, 1, 1, 1, 1,
-1.453285, 0.68071, -1.95162, 1, 1, 1, 1, 1,
-1.452398, 1.011707, -2.406807, 1, 1, 1, 1, 1,
-1.433332, 0.8231201, -0.2253832, 1, 1, 1, 1, 1,
-1.433005, -1.59504, -2.423877, 1, 1, 1, 1, 1,
-1.42932, -0.8507958, -2.326031, 1, 1, 1, 1, 1,
-1.414829, -0.8564793, -1.535578, 1, 1, 1, 1, 1,
-1.414648, 0.1026371, -0.3770404, 0, 0, 1, 1, 1,
-1.413172, -0.525162, -4.48063, 1, 0, 0, 1, 1,
-1.412708, -0.6157621, -2.228732, 1, 0, 0, 1, 1,
-1.408598, -1.180044, -4.383892, 1, 0, 0, 1, 1,
-1.403068, 1.21738, -2.013204, 1, 0, 0, 1, 1,
-1.399464, -0.2276345, -2.015178, 1, 0, 0, 1, 1,
-1.395328, 0.145676, -0.3733167, 0, 0, 0, 1, 1,
-1.390297, -0.4368828, -1.365033, 0, 0, 0, 1, 1,
-1.383138, -0.03670869, -0.8028858, 0, 0, 0, 1, 1,
-1.379926, -0.1278545, -1.494794, 0, 0, 0, 1, 1,
-1.363285, 0.7713301, -0.5051452, 0, 0, 0, 1, 1,
-1.361631, -0.246993, -2.751345, 0, 0, 0, 1, 1,
-1.361206, 0.4461489, -2.163268, 0, 0, 0, 1, 1,
-1.361035, 0.4678334, -1.624087, 1, 1, 1, 1, 1,
-1.344806, 0.1007511, -0.3334364, 1, 1, 1, 1, 1,
-1.341947, 1.73546, -1.511683, 1, 1, 1, 1, 1,
-1.340266, -0.906624, -3.365631, 1, 1, 1, 1, 1,
-1.338216, -2.108169, -3.803374, 1, 1, 1, 1, 1,
-1.325743, 0.1718146, -2.535018, 1, 1, 1, 1, 1,
-1.325006, 0.8684341, 0.008317295, 1, 1, 1, 1, 1,
-1.322439, -0.4001367, -2.8568, 1, 1, 1, 1, 1,
-1.320497, 0.6433213, 0.0590713, 1, 1, 1, 1, 1,
-1.319431, 0.07692029, -1.086022, 1, 1, 1, 1, 1,
-1.309589, -1.033988, -1.75436, 1, 1, 1, 1, 1,
-1.309122, -1.138921, -1.895187, 1, 1, 1, 1, 1,
-1.308486, -1.587196, -1.241346, 1, 1, 1, 1, 1,
-1.30167, -0.6121945, -2.814525, 1, 1, 1, 1, 1,
-1.29425, -0.2717388, -0.3578394, 1, 1, 1, 1, 1,
-1.289186, 0.9386256, -1.187364, 0, 0, 1, 1, 1,
-1.27767, -1.193991, -1.865489, 1, 0, 0, 1, 1,
-1.277599, 0.243338, -2.168393, 1, 0, 0, 1, 1,
-1.274865, 1.367646, -0.09470243, 1, 0, 0, 1, 1,
-1.259647, 0.4590303, -0.9395185, 1, 0, 0, 1, 1,
-1.253802, -2.089511, -2.314617, 1, 0, 0, 1, 1,
-1.252428, 0.1811085, -1.695754, 0, 0, 0, 1, 1,
-1.248337, 1.152695, -2.215693, 0, 0, 0, 1, 1,
-1.246907, -0.7964974, -1.286369, 0, 0, 0, 1, 1,
-1.242819, -0.2681268, -2.433774, 0, 0, 0, 1, 1,
-1.230147, 0.2171155, -2.500537, 0, 0, 0, 1, 1,
-1.2258, -1.660409, -2.335935, 0, 0, 0, 1, 1,
-1.22, 0.8361014, -0.5431525, 0, 0, 0, 1, 1,
-1.218817, 1.162148, 0.4532614, 1, 1, 1, 1, 1,
-1.217584, 0.5558643, -0.14212, 1, 1, 1, 1, 1,
-1.209115, 0.1225591, -2.523477, 1, 1, 1, 1, 1,
-1.203794, -0.6957586, -2.845194, 1, 1, 1, 1, 1,
-1.202846, 0.4544044, -0.8996174, 1, 1, 1, 1, 1,
-1.202698, 1.305997, 0.2123149, 1, 1, 1, 1, 1,
-1.190948, 1.597391, -1.332338, 1, 1, 1, 1, 1,
-1.190529, -0.1361904, -1.205917, 1, 1, 1, 1, 1,
-1.190513, 0.8629434, -1.042705, 1, 1, 1, 1, 1,
-1.184657, 2.171261, -0.1589941, 1, 1, 1, 1, 1,
-1.179579, 0.2620673, -0.452479, 1, 1, 1, 1, 1,
-1.17606, 0.573002, -0.8168165, 1, 1, 1, 1, 1,
-1.172017, -1.761965, -3.266691, 1, 1, 1, 1, 1,
-1.161568, 0.239521, -1.004743, 1, 1, 1, 1, 1,
-1.158553, -0.3584871, -1.651893, 1, 1, 1, 1, 1,
-1.157619, -1.071172, -4.232326, 0, 0, 1, 1, 1,
-1.154228, -0.2799901, -1.062407, 1, 0, 0, 1, 1,
-1.150406, -0.6387265, -1.363192, 1, 0, 0, 1, 1,
-1.143271, -0.1236877, -0.9403099, 1, 0, 0, 1, 1,
-1.138088, 1.429555, -0.9824291, 1, 0, 0, 1, 1,
-1.125667, -0.7507169, -2.844054, 1, 0, 0, 1, 1,
-1.124736, -2.439251, -1.996053, 0, 0, 0, 1, 1,
-1.119259, -1.098772, -4.300699, 0, 0, 0, 1, 1,
-1.116965, 0.7705825, -0.3042212, 0, 0, 0, 1, 1,
-1.115154, 2.112659, 0.8425854, 0, 0, 0, 1, 1,
-1.106313, -0.47117, -3.162164, 0, 0, 0, 1, 1,
-1.095749, -1.691793, -3.058227, 0, 0, 0, 1, 1,
-1.092594, 0.5402505, -1.286755, 0, 0, 0, 1, 1,
-1.092186, 0.09377212, -2.401684, 1, 1, 1, 1, 1,
-1.088434, -0.8111145, -2.753092, 1, 1, 1, 1, 1,
-1.088105, -1.638072, -3.108502, 1, 1, 1, 1, 1,
-1.086476, -1.228183, -2.46932, 1, 1, 1, 1, 1,
-1.081895, 3.419843, 0.414332, 1, 1, 1, 1, 1,
-1.075392, 0.6145749, -0.1989514, 1, 1, 1, 1, 1,
-1.074524, 0.8539808, -1.173171, 1, 1, 1, 1, 1,
-1.06824, 0.04765546, -1.795468, 1, 1, 1, 1, 1,
-1.061914, 1.371603, 1.543028, 1, 1, 1, 1, 1,
-1.061845, 1.034911, -2.58779, 1, 1, 1, 1, 1,
-1.054812, -0.3768246, -1.86899, 1, 1, 1, 1, 1,
-1.048476, -0.5937278, -2.946072, 1, 1, 1, 1, 1,
-1.045542, 0.5488419, -3.292479, 1, 1, 1, 1, 1,
-1.044056, -0.2155934, -1.122496, 1, 1, 1, 1, 1,
-1.042061, -0.4029315, -0.7378144, 1, 1, 1, 1, 1,
-1.040146, 0.2814884, -2.101247, 0, 0, 1, 1, 1,
-1.037454, 0.3779098, -0.8723626, 1, 0, 0, 1, 1,
-1.034218, 1.351467, -0.1917569, 1, 0, 0, 1, 1,
-1.030272, 0.07779144, -1.350696, 1, 0, 0, 1, 1,
-1.025541, -0.5863584, -1.110239, 1, 0, 0, 1, 1,
-1.023757, -1.070873, -3.104309, 1, 0, 0, 1, 1,
-1.018852, 1.607055, -2.410473, 0, 0, 0, 1, 1,
-1.01646, 0.3898847, -1.095177, 0, 0, 0, 1, 1,
-1.015613, 0.5671558, -0.8634819, 0, 0, 0, 1, 1,
-1.014499, 1.49965, -1.163138, 0, 0, 0, 1, 1,
-1.004905, 1.152597, 0.9943905, 0, 0, 0, 1, 1,
-1.003955, -0.04380505, -2.096582, 0, 0, 0, 1, 1,
-0.9917423, 0.559379, -1.406278, 0, 0, 0, 1, 1,
-0.9911699, 0.2594483, -2.262323, 1, 1, 1, 1, 1,
-0.9895672, -0.1809276, -1.962397, 1, 1, 1, 1, 1,
-0.9859181, 1.57525, -0.748424, 1, 1, 1, 1, 1,
-0.9852509, -0.3004964, -1.630206, 1, 1, 1, 1, 1,
-0.9847041, -1.485942, -3.874143, 1, 1, 1, 1, 1,
-0.9842911, 1.02165, -1.996475, 1, 1, 1, 1, 1,
-0.9762388, -0.4206882, -2.812246, 1, 1, 1, 1, 1,
-0.9759108, 0.2196231, -0.5027721, 1, 1, 1, 1, 1,
-0.9713763, 1.682598, -2.535088, 1, 1, 1, 1, 1,
-0.9627072, -0.6628615, -1.673838, 1, 1, 1, 1, 1,
-0.9625412, -0.5646466, -0.8006085, 1, 1, 1, 1, 1,
-0.9615614, 0.5091131, -2.008948, 1, 1, 1, 1, 1,
-0.9588251, 1.262368, 0.1859641, 1, 1, 1, 1, 1,
-0.9577342, -1.112708, -3.079289, 1, 1, 1, 1, 1,
-0.9466057, 0.9011423, 0.6490817, 1, 1, 1, 1, 1,
-0.9465691, -1.184753, -2.134518, 0, 0, 1, 1, 1,
-0.9448969, 0.1905827, 0.02115732, 1, 0, 0, 1, 1,
-0.9407536, -0.9470476, -0.6298333, 1, 0, 0, 1, 1,
-0.932898, -0.6684954, -2.152942, 1, 0, 0, 1, 1,
-0.9246774, 1.366651, -0.7384624, 1, 0, 0, 1, 1,
-0.9203855, 1.642793, 0.1291299, 1, 0, 0, 1, 1,
-0.914855, 1.991225, 0.7155971, 0, 0, 0, 1, 1,
-0.9101511, 0.4488184, 0.1251325, 0, 0, 0, 1, 1,
-0.8989502, 0.7412713, 1.464383, 0, 0, 0, 1, 1,
-0.8951837, 1.294192, -1.695086, 0, 0, 0, 1, 1,
-0.8923581, -1.685345, -1.993624, 0, 0, 0, 1, 1,
-0.8744671, -0.04662672, -1.725145, 0, 0, 0, 1, 1,
-0.871416, 0.0867867, -2.50144, 0, 0, 0, 1, 1,
-0.8648493, -1.650196, -2.281529, 1, 1, 1, 1, 1,
-0.8639739, 0.8057976, -1.440176, 1, 1, 1, 1, 1,
-0.8612992, -0.3408981, -0.9769778, 1, 1, 1, 1, 1,
-0.857516, 0.04717181, -1.060496, 1, 1, 1, 1, 1,
-0.8556246, -0.7773985, -1.782758, 1, 1, 1, 1, 1,
-0.84383, 1.195515, -1.289446, 1, 1, 1, 1, 1,
-0.8415501, -2.728272, -4.546422, 1, 1, 1, 1, 1,
-0.8414019, -1.275291, -2.878832, 1, 1, 1, 1, 1,
-0.8398389, 0.7312959, 1.44076, 1, 1, 1, 1, 1,
-0.8384421, 0.01401445, -1.830831, 1, 1, 1, 1, 1,
-0.8351618, -1.440642, -2.156995, 1, 1, 1, 1, 1,
-0.8318626, 1.561459, -0.6180751, 1, 1, 1, 1, 1,
-0.8308571, -1.211877, -3.457896, 1, 1, 1, 1, 1,
-0.8235405, 0.8368654, -1.644001, 1, 1, 1, 1, 1,
-0.8229945, 0.9774689, -1.821766, 1, 1, 1, 1, 1,
-0.8216461, -3.121435, -1.699267, 0, 0, 1, 1, 1,
-0.8165652, -0.2109793, 0.3915537, 1, 0, 0, 1, 1,
-0.8140883, -0.7423608, -4.778027, 1, 0, 0, 1, 1,
-0.8111863, 0.7260795, -1.386033, 1, 0, 0, 1, 1,
-0.8071904, -0.5163417, -0.1020781, 1, 0, 0, 1, 1,
-0.8048015, 0.6913835, 1.474757, 1, 0, 0, 1, 1,
-0.8002381, -1.355598, -3.333343, 0, 0, 0, 1, 1,
-0.8001274, 0.1651697, -1.865049, 0, 0, 0, 1, 1,
-0.7993482, 0.2983959, 0.6008922, 0, 0, 0, 1, 1,
-0.7950111, -0.237012, -2.524143, 0, 0, 0, 1, 1,
-0.7945401, -1.1382, -3.739301, 0, 0, 0, 1, 1,
-0.7933645, -0.5708621, 0.208608, 0, 0, 0, 1, 1,
-0.7888077, 1.443844, -1.003298, 0, 0, 0, 1, 1,
-0.7852898, -1.267767, -1.100189, 1, 1, 1, 1, 1,
-0.7814799, 0.6253182, -1.78635, 1, 1, 1, 1, 1,
-0.7804693, -0.3743957, -1.58417, 1, 1, 1, 1, 1,
-0.7771575, -0.6213061, -1.729986, 1, 1, 1, 1, 1,
-0.7729398, 0.3299085, -0.2220015, 1, 1, 1, 1, 1,
-0.7584026, 0.5988575, -0.5971083, 1, 1, 1, 1, 1,
-0.7369116, -1.038275, 0.2016841, 1, 1, 1, 1, 1,
-0.7355222, -0.3244321, -2.231479, 1, 1, 1, 1, 1,
-0.7346477, -1.854289, -1.906142, 1, 1, 1, 1, 1,
-0.73317, 0.3224271, -0.640511, 1, 1, 1, 1, 1,
-0.7308561, -0.2370359, -3.082737, 1, 1, 1, 1, 1,
-0.7289169, 0.4714748, -1.605866, 1, 1, 1, 1, 1,
-0.7285919, -1.134745, -2.596645, 1, 1, 1, 1, 1,
-0.7193918, 0.4751118, -1.057847, 1, 1, 1, 1, 1,
-0.7083499, -0.4005696, -4.211931, 1, 1, 1, 1, 1,
-0.6971007, 0.04306735, -1.951541, 0, 0, 1, 1, 1,
-0.6926131, 1.478881, 0.1271919, 1, 0, 0, 1, 1,
-0.682458, -2.013302, -2.129471, 1, 0, 0, 1, 1,
-0.6742005, -1.259186, -2.648262, 1, 0, 0, 1, 1,
-0.6692973, 0.1778493, -2.381742, 1, 0, 0, 1, 1,
-0.6596494, -1.026199, -1.763988, 1, 0, 0, 1, 1,
-0.6589388, 0.07079082, -2.797585, 0, 0, 0, 1, 1,
-0.6575412, 0.5700559, 0.01157267, 0, 0, 0, 1, 1,
-0.6556029, -0.3259739, -2.816979, 0, 0, 0, 1, 1,
-0.6490667, 0.1644758, -2.3657, 0, 0, 0, 1, 1,
-0.6420106, 0.2362729, 0.7754062, 0, 0, 0, 1, 1,
-0.638699, -1.056983, -2.234503, 0, 0, 0, 1, 1,
-0.6334208, -0.3818976, -1.698583, 0, 0, 0, 1, 1,
-0.6332925, -0.5360522, -2.230628, 1, 1, 1, 1, 1,
-0.631627, 1.690901, -0.663176, 1, 1, 1, 1, 1,
-0.6287199, -0.2914469, -0.3558393, 1, 1, 1, 1, 1,
-0.6251658, 0.3660817, -0.7506279, 1, 1, 1, 1, 1,
-0.6222034, 1.572607, -0.9155471, 1, 1, 1, 1, 1,
-0.6210328, 1.341995, -1.305568, 1, 1, 1, 1, 1,
-0.6208097, -1.501828, -3.050263, 1, 1, 1, 1, 1,
-0.6195079, 0.1651832, -1.584514, 1, 1, 1, 1, 1,
-0.6117936, -0.3976805, -1.638605, 1, 1, 1, 1, 1,
-0.609825, -1.696087, -1.782461, 1, 1, 1, 1, 1,
-0.6076875, -0.2980414, -3.551118, 1, 1, 1, 1, 1,
-0.6054463, -1.598231, -3.471042, 1, 1, 1, 1, 1,
-0.5932285, 1.500581, 0.6136832, 1, 1, 1, 1, 1,
-0.5889558, 0.3805041, -1.254516, 1, 1, 1, 1, 1,
-0.5790932, 1.071987, -1.224453, 1, 1, 1, 1, 1,
-0.5783845, 0.2827875, -1.880001, 0, 0, 1, 1, 1,
-0.5730193, -1.698633, -1.275096, 1, 0, 0, 1, 1,
-0.5729986, -1.521393, -1.433389, 1, 0, 0, 1, 1,
-0.5636244, 1.086932, 0.6599194, 1, 0, 0, 1, 1,
-0.556962, 0.02999306, -2.403167, 1, 0, 0, 1, 1,
-0.5568631, 0.5611504, -2.503313, 1, 0, 0, 1, 1,
-0.5567641, -0.8430988, -2.438437, 0, 0, 0, 1, 1,
-0.5555273, 1.02231, -0.5658681, 0, 0, 0, 1, 1,
-0.5537274, 0.3128141, -0.6476289, 0, 0, 0, 1, 1,
-0.5472031, -0.7888916, -2.17483, 0, 0, 0, 1, 1,
-0.5457623, -0.6674231, -1.810517, 0, 0, 0, 1, 1,
-0.5436733, 0.09625765, -1.302987, 0, 0, 0, 1, 1,
-0.5363383, 0.1694675, -1.614779, 0, 0, 0, 1, 1,
-0.5361159, 1.266877, -0.4894206, 1, 1, 1, 1, 1,
-0.5312232, -0.6416075, -0.5325769, 1, 1, 1, 1, 1,
-0.5307934, -0.3151197, -3.268227, 1, 1, 1, 1, 1,
-0.5286857, -1.859475, -2.782559, 1, 1, 1, 1, 1,
-0.5269918, -0.9086972, -1.834218, 1, 1, 1, 1, 1,
-0.5180789, -0.4918925, -0.5239753, 1, 1, 1, 1, 1,
-0.5157815, -0.4037635, -4.203954, 1, 1, 1, 1, 1,
-0.5149409, -0.09791103, -2.837839, 1, 1, 1, 1, 1,
-0.5132201, -0.08783633, -0.4116268, 1, 1, 1, 1, 1,
-0.5120991, -0.475129, -1.515395, 1, 1, 1, 1, 1,
-0.508499, -0.786006, -1.647499, 1, 1, 1, 1, 1,
-0.5037321, -1.071027, -2.924647, 1, 1, 1, 1, 1,
-0.4982284, -1.799515, -2.944789, 1, 1, 1, 1, 1,
-0.4949473, 0.4535556, -1.51036, 1, 1, 1, 1, 1,
-0.4944566, -1.019334, -3.730237, 1, 1, 1, 1, 1,
-0.4910223, -2.265391, -1.91168, 0, 0, 1, 1, 1,
-0.4850054, -0.6808382, -4.446675, 1, 0, 0, 1, 1,
-0.4842465, 0.7491435, 0.1127737, 1, 0, 0, 1, 1,
-0.4752046, 2.234006, 0.6228127, 1, 0, 0, 1, 1,
-0.4737996, -1.240248, -2.872298, 1, 0, 0, 1, 1,
-0.4717678, -0.4865369, -3.105844, 1, 0, 0, 1, 1,
-0.4661605, 1.773641, -0.201131, 0, 0, 0, 1, 1,
-0.4660252, 1.396445, 0.8519111, 0, 0, 0, 1, 1,
-0.4642766, 1.066582, -1.614974, 0, 0, 0, 1, 1,
-0.459789, -0.01303557, -2.592907, 0, 0, 0, 1, 1,
-0.4584291, -0.0303985, -1.475686, 0, 0, 0, 1, 1,
-0.4576608, 1.272232, -0.1323518, 0, 0, 0, 1, 1,
-0.4416862, 1.326154, -1.977314, 0, 0, 0, 1, 1,
-0.4408573, -2.194972, -1.502773, 1, 1, 1, 1, 1,
-0.4288219, 1.932979, 0.01287079, 1, 1, 1, 1, 1,
-0.4230986, 0.7817666, -0.2334576, 1, 1, 1, 1, 1,
-0.4207858, -0.9924016, -1.931334, 1, 1, 1, 1, 1,
-0.4159451, 0.09705307, -0.5342909, 1, 1, 1, 1, 1,
-0.4150358, 0.8869078, 1.183204, 1, 1, 1, 1, 1,
-0.4143487, 2.128331, 0.3889063, 1, 1, 1, 1, 1,
-0.4094931, 0.4905842, 0.1162545, 1, 1, 1, 1, 1,
-0.4058473, 0.2236734, -1.36322, 1, 1, 1, 1, 1,
-0.4038391, -0.5236674, -3.469559, 1, 1, 1, 1, 1,
-0.3855952, 1.072047, 1.010533, 1, 1, 1, 1, 1,
-0.3838212, -0.5606219, -2.529833, 1, 1, 1, 1, 1,
-0.3837883, 0.825009, 1.112653, 1, 1, 1, 1, 1,
-0.3837814, 0.7245478, -0.6651246, 1, 1, 1, 1, 1,
-0.3820997, -1.200082, -1.96144, 1, 1, 1, 1, 1,
-0.381614, -1.011998, -2.029063, 0, 0, 1, 1, 1,
-0.3784695, 1.656044, 0.4836593, 1, 0, 0, 1, 1,
-0.3774466, -0.01527138, -1.692292, 1, 0, 0, 1, 1,
-0.376169, -1.082202, -1.979787, 1, 0, 0, 1, 1,
-0.3741392, 0.8380079, 0.05107873, 1, 0, 0, 1, 1,
-0.3728606, 0.3854027, -1.312333, 1, 0, 0, 1, 1,
-0.3718097, -0.1385606, -1.155906, 0, 0, 0, 1, 1,
-0.3655611, -1.724086, -1.993895, 0, 0, 0, 1, 1,
-0.3642359, 0.2014505, -0.7167214, 0, 0, 0, 1, 1,
-0.3611933, -1.200077, -4.294285, 0, 0, 0, 1, 1,
-0.3605849, -1.162825, -2.399552, 0, 0, 0, 1, 1,
-0.3591009, -0.6213244, -3.883021, 0, 0, 0, 1, 1,
-0.3578328, 0.6036329, -1.56058, 0, 0, 0, 1, 1,
-0.3564014, 0.2701753, -2.519568, 1, 1, 1, 1, 1,
-0.3517644, 0.1839118, -3.502448, 1, 1, 1, 1, 1,
-0.3459193, 1.146381, 0.6263142, 1, 1, 1, 1, 1,
-0.3439427, -0.4945882, 0.1279803, 1, 1, 1, 1, 1,
-0.342067, 0.4951942, -1.409736, 1, 1, 1, 1, 1,
-0.3320001, 1.17845, -0.6423556, 1, 1, 1, 1, 1,
-0.3318113, -1.701446, -2.685107, 1, 1, 1, 1, 1,
-0.3311392, 0.07814214, -1.243741, 1, 1, 1, 1, 1,
-0.3304996, 0.5765432, 0.004402208, 1, 1, 1, 1, 1,
-0.3297034, -0.04596932, -2.628203, 1, 1, 1, 1, 1,
-0.3258626, 1.306083, -0.2566806, 1, 1, 1, 1, 1,
-0.3251342, -1.159141, -2.824664, 1, 1, 1, 1, 1,
-0.3191511, -0.446055, -2.44852, 1, 1, 1, 1, 1,
-0.3168178, -0.5502102, -2.744254, 1, 1, 1, 1, 1,
-0.3123904, -1.613599, -3.744555, 1, 1, 1, 1, 1,
-0.309802, -1.391314, -2.538804, 0, 0, 1, 1, 1,
-0.3079821, -1.911503, -3.188513, 1, 0, 0, 1, 1,
-0.3070295, 0.2987891, 0.4047299, 1, 0, 0, 1, 1,
-0.3049515, 0.4898938, -0.31145, 1, 0, 0, 1, 1,
-0.3025494, -2.593828, -3.515511, 1, 0, 0, 1, 1,
-0.3000923, 0.1400543, -1.369216, 1, 0, 0, 1, 1,
-0.298028, 0.6700118, -0.1241959, 0, 0, 0, 1, 1,
-0.2967011, -1.041202, -2.776048, 0, 0, 0, 1, 1,
-0.2951996, -0.08155011, -1.413456, 0, 0, 0, 1, 1,
-0.2926637, 2.095646, 0.344402, 0, 0, 0, 1, 1,
-0.2924268, 0.0529876, -2.602562, 0, 0, 0, 1, 1,
-0.2920799, -0.2980367, -3.620663, 0, 0, 0, 1, 1,
-0.2893105, 0.7502827, 1.434267, 0, 0, 0, 1, 1,
-0.2883773, -0.677474, -3.073797, 1, 1, 1, 1, 1,
-0.2880706, -1.654296, -2.467543, 1, 1, 1, 1, 1,
-0.2797821, -1.098325, -4.033504, 1, 1, 1, 1, 1,
-0.2742172, 0.7870231, -1.853972, 1, 1, 1, 1, 1,
-0.2710907, -0.2755588, -2.963733, 1, 1, 1, 1, 1,
-0.2688405, -0.7232231, -2.759304, 1, 1, 1, 1, 1,
-0.2686772, 0.2916414, -0.1615134, 1, 1, 1, 1, 1,
-0.2686265, -1.263257, -2.251424, 1, 1, 1, 1, 1,
-0.2645633, -0.3975952, -3.547241, 1, 1, 1, 1, 1,
-0.2640878, 2.193143, 0.9322694, 1, 1, 1, 1, 1,
-0.2632301, 0.8801855, 0.9152414, 1, 1, 1, 1, 1,
-0.2598802, 0.5027748, -0.7685963, 1, 1, 1, 1, 1,
-0.2591882, -1.454981, -4.465735, 1, 1, 1, 1, 1,
-0.2583894, 0.09766749, -0.7697217, 1, 1, 1, 1, 1,
-0.2495736, 1.478053, 0.3828643, 1, 1, 1, 1, 1,
-0.2478649, -0.8977739, -0.8384513, 0, 0, 1, 1, 1,
-0.2461832, -0.3997371, -3.505075, 1, 0, 0, 1, 1,
-0.2457014, -0.03004126, -3.056355, 1, 0, 0, 1, 1,
-0.2447173, -0.8489048, -2.992372, 1, 0, 0, 1, 1,
-0.2444311, 1.139151, -0.05843193, 1, 0, 0, 1, 1,
-0.2436469, -0.1348573, -2.656539, 1, 0, 0, 1, 1,
-0.2434599, -1.125071, -3.357078, 0, 0, 0, 1, 1,
-0.242709, -0.1235668, -3.210548, 0, 0, 0, 1, 1,
-0.2425, 0.07541671, -1.854212, 0, 0, 0, 1, 1,
-0.2404396, 0.5214345, 0.1039541, 0, 0, 0, 1, 1,
-0.2382789, -2.075719, -6.90923, 0, 0, 0, 1, 1,
-0.2277288, 0.01008152, -1.081493, 0, 0, 0, 1, 1,
-0.2267134, 0.6358034, -1.475574, 0, 0, 0, 1, 1,
-0.2255237, 0.7700865, -0.3411412, 1, 1, 1, 1, 1,
-0.2241967, 0.5334976, -0.6178532, 1, 1, 1, 1, 1,
-0.2191538, -0.1277217, -2.194189, 1, 1, 1, 1, 1,
-0.2171884, 0.8964449, -2.640705, 1, 1, 1, 1, 1,
-0.2167553, 0.4350519, -0.7213057, 1, 1, 1, 1, 1,
-0.2110192, -0.7802269, -3.87909, 1, 1, 1, 1, 1,
-0.2045881, -0.7798387, -3.011546, 1, 1, 1, 1, 1,
-0.2007978, -0.4341367, -1.463448, 1, 1, 1, 1, 1,
-0.1989907, 0.7998585, -1.028241, 1, 1, 1, 1, 1,
-0.1977155, -0.9058682, -2.921645, 1, 1, 1, 1, 1,
-0.1925468, -2.580346, -2.60137, 1, 1, 1, 1, 1,
-0.1918923, -0.4035645, -1.314389, 1, 1, 1, 1, 1,
-0.1896189, 0.7958155, 1.008571, 1, 1, 1, 1, 1,
-0.1861869, -0.5641773, -1.898411, 1, 1, 1, 1, 1,
-0.1851103, 0.7507902, -0.5778016, 1, 1, 1, 1, 1,
-0.1829464, 1.171973, 0.2169017, 0, 0, 1, 1, 1,
-0.1802403, -0.7007629, -3.399988, 1, 0, 0, 1, 1,
-0.1790395, -0.3136216, -1.980088, 1, 0, 0, 1, 1,
-0.178477, 0.1371203, -1.620104, 1, 0, 0, 1, 1,
-0.1759984, 2.199178, -0.8518391, 1, 0, 0, 1, 1,
-0.170967, -1.270734, -3.56799, 1, 0, 0, 1, 1,
-0.1703122, -0.791383, -3.112776, 0, 0, 0, 1, 1,
-0.1692715, -0.7196379, -2.141745, 0, 0, 0, 1, 1,
-0.1679139, 0.7843317, -1.843613, 0, 0, 0, 1, 1,
-0.1677245, 0.006729426, -0.9376633, 0, 0, 0, 1, 1,
-0.1671951, -0.8113576, -3.274314, 0, 0, 0, 1, 1,
-0.1661091, -0.1423141, -1.223486, 0, 0, 0, 1, 1,
-0.1647221, -0.316711, -3.025157, 0, 0, 0, 1, 1,
-0.1606588, -1.214028, -4.163664, 1, 1, 1, 1, 1,
-0.1599104, -1.226669, -4.658032, 1, 1, 1, 1, 1,
-0.1550062, -1.226168, -2.725394, 1, 1, 1, 1, 1,
-0.1516237, -1.198335, -2.932122, 1, 1, 1, 1, 1,
-0.1512275, -1.193903, -3.954314, 1, 1, 1, 1, 1,
-0.1280286, -1.034713, -0.9860507, 1, 1, 1, 1, 1,
-0.1264933, -0.1218498, -1.725217, 1, 1, 1, 1, 1,
-0.1258351, 0.8461177, -0.1402843, 1, 1, 1, 1, 1,
-0.1245106, -0.2491059, -3.387024, 1, 1, 1, 1, 1,
-0.1232016, -0.06854384, -2.43947, 1, 1, 1, 1, 1,
-0.1181486, 0.4348664, 0.1026495, 1, 1, 1, 1, 1,
-0.1175065, -0.8983272, -1.068208, 1, 1, 1, 1, 1,
-0.1161519, 0.1468856, -0.2624615, 1, 1, 1, 1, 1,
-0.112665, -0.5268963, -2.373315, 1, 1, 1, 1, 1,
-0.1118566, 1.597098, 0.7619452, 1, 1, 1, 1, 1,
-0.1118232, -0.009889018, -0.597828, 0, 0, 1, 1, 1,
-0.1107555, 0.9183031, 0.04354211, 1, 0, 0, 1, 1,
-0.1099462, 0.02506764, -1.646178, 1, 0, 0, 1, 1,
-0.1081135, 0.2143019, 1.826484, 1, 0, 0, 1, 1,
-0.1068892, 0.4623498, 0.4726599, 1, 0, 0, 1, 1,
-0.09958817, 1.066189, -1.480574, 1, 0, 0, 1, 1,
-0.09625155, 1.563922, 1.280129, 0, 0, 0, 1, 1,
-0.09422187, -0.2849044, -1.508082, 0, 0, 0, 1, 1,
-0.09367626, -1.065962, -3.497668, 0, 0, 0, 1, 1,
-0.091792, -1.295336, -2.71476, 0, 0, 0, 1, 1,
-0.08972847, -1.338229, -3.195749, 0, 0, 0, 1, 1,
-0.08189265, 0.7932037, 0.0204248, 0, 0, 0, 1, 1,
-0.08114001, 0.1761815, 0.5410807, 0, 0, 0, 1, 1,
-0.07890619, 0.8525748, 0.4318017, 1, 1, 1, 1, 1,
-0.07620907, -0.1417558, -2.000108, 1, 1, 1, 1, 1,
-0.07067199, 0.4361375, -2.387562, 1, 1, 1, 1, 1,
-0.07058892, 0.4249884, -0.9098936, 1, 1, 1, 1, 1,
-0.06740952, -0.9894219, -2.207632, 1, 1, 1, 1, 1,
-0.06356604, -0.2377247, -0.1515959, 1, 1, 1, 1, 1,
-0.06039998, -0.9928446, -2.578295, 1, 1, 1, 1, 1,
-0.05952643, -0.4367982, -3.081376, 1, 1, 1, 1, 1,
-0.05659386, -1.294855, -3.239436, 1, 1, 1, 1, 1,
-0.05125536, -1.478375, -3.811672, 1, 1, 1, 1, 1,
-0.05091412, -0.4357675, -1.04663, 1, 1, 1, 1, 1,
-0.04930404, -0.0007183166, 0.3566507, 1, 1, 1, 1, 1,
-0.04811723, -1.866171, -1.784865, 1, 1, 1, 1, 1,
-0.04700571, -0.07946216, -1.387862, 1, 1, 1, 1, 1,
-0.04658275, 0.05846325, -1.584764, 1, 1, 1, 1, 1,
-0.04645638, -1.148384, -2.923413, 0, 0, 1, 1, 1,
-0.04014339, -0.4589219, -2.371284, 1, 0, 0, 1, 1,
-0.02819897, -0.06226186, -2.251425, 1, 0, 0, 1, 1,
-0.02712103, 2.02059, -1.283634, 1, 0, 0, 1, 1,
-0.0230159, -0.438636, -3.395884, 1, 0, 0, 1, 1,
-0.01718787, -0.1334829, -3.453767, 1, 0, 0, 1, 1,
-0.01709018, -0.9021542, -1.90768, 0, 0, 0, 1, 1,
-0.01695929, -0.05948625, -1.193081, 0, 0, 0, 1, 1,
-0.01607136, 1.029319, -0.5543121, 0, 0, 0, 1, 1,
-0.01257476, -0.06596628, -3.615005, 0, 0, 0, 1, 1,
-0.007271694, 1.337498, 0.1034, 0, 0, 0, 1, 1,
-0.00397362, -1.944492, -2.730414, 0, 0, 0, 1, 1,
-0.00301719, -0.1673398, -2.179356, 0, 0, 0, 1, 1,
0.002744239, 0.1589869, 0.3534359, 1, 1, 1, 1, 1,
0.003232219, -1.418481, 3.998226, 1, 1, 1, 1, 1,
0.004098604, -1.3937, 0.6203127, 1, 1, 1, 1, 1,
0.009436726, -0.07835363, 0.6066985, 1, 1, 1, 1, 1,
0.01163929, -0.5382217, 3.867689, 1, 1, 1, 1, 1,
0.01185466, 0.4821549, -0.8548471, 1, 1, 1, 1, 1,
0.01337918, 0.2035202, -0.9983293, 1, 1, 1, 1, 1,
0.01722117, 1.738439, 0.8210077, 1, 1, 1, 1, 1,
0.01732256, -1.291702, 1.579301, 1, 1, 1, 1, 1,
0.0197407, 0.6198934, 0.1145143, 1, 1, 1, 1, 1,
0.02378258, -0.5311041, 3.24666, 1, 1, 1, 1, 1,
0.02625768, -2.204192, 3.954374, 1, 1, 1, 1, 1,
0.02760272, -1.217752, 2.798974, 1, 1, 1, 1, 1,
0.02763263, -0.04548616, 4.507715, 1, 1, 1, 1, 1,
0.02915872, 0.5554921, -0.556467, 1, 1, 1, 1, 1,
0.0316324, 1.252949, 0.2180419, 0, 0, 1, 1, 1,
0.03282414, 0.6874621, 0.6782101, 1, 0, 0, 1, 1,
0.03397841, -1.3143, 2.010482, 1, 0, 0, 1, 1,
0.0358367, 1.621704, 0.838079, 1, 0, 0, 1, 1,
0.04804283, -0.09214808, 1.858911, 1, 0, 0, 1, 1,
0.04926374, 0.1372147, -0.4183477, 1, 0, 0, 1, 1,
0.05342861, -1.405102, 1.597538, 0, 0, 0, 1, 1,
0.05637952, 0.09291571, -0.1548674, 0, 0, 0, 1, 1,
0.05955419, -1.625904, 3.817157, 0, 0, 0, 1, 1,
0.05976356, 0.9388558, 0.3414181, 0, 0, 0, 1, 1,
0.06951693, -1.825408, 2.661103, 0, 0, 0, 1, 1,
0.07963457, -0.5929244, 2.99161, 0, 0, 0, 1, 1,
0.0836725, 1.075509, 0.2698402, 0, 0, 0, 1, 1,
0.08441373, 0.5560708, 0.1566305, 1, 1, 1, 1, 1,
0.08567333, -0.207459, 2.687774, 1, 1, 1, 1, 1,
0.08607084, 0.8444279, 0.2779678, 1, 1, 1, 1, 1,
0.0881711, 0.8469296, 1.127414, 1, 1, 1, 1, 1,
0.09476808, 0.2892507, -0.7771192, 1, 1, 1, 1, 1,
0.09729651, -0.07485583, 2.216805, 1, 1, 1, 1, 1,
0.09954456, 0.6915524, 0.8178974, 1, 1, 1, 1, 1,
0.1079995, -0.4945378, 2.599742, 1, 1, 1, 1, 1,
0.1084904, -0.7476341, 2.870308, 1, 1, 1, 1, 1,
0.1119149, 1.761155, -0.07601862, 1, 1, 1, 1, 1,
0.1147584, 0.2744482, 1.398383, 1, 1, 1, 1, 1,
0.1173118, -0.2438719, -0.7984968, 1, 1, 1, 1, 1,
0.1182605, 0.3798376, 1.155517, 1, 1, 1, 1, 1,
0.1226744, 1.506358, -0.7744437, 1, 1, 1, 1, 1,
0.1242858, -0.499, 1.355734, 1, 1, 1, 1, 1,
0.1265967, 1.661433, -0.5648626, 0, 0, 1, 1, 1,
0.1286123, 0.04619138, 0.5413828, 1, 0, 0, 1, 1,
0.1300109, 0.3294369, -0.3700644, 1, 0, 0, 1, 1,
0.1301614, -0.7636997, 4.019989, 1, 0, 0, 1, 1,
0.1335542, 0.9072016, 0.1482514, 1, 0, 0, 1, 1,
0.1342229, 0.1624659, 0.2445069, 1, 0, 0, 1, 1,
0.1361688, 0.8578485, -0.194482, 0, 0, 0, 1, 1,
0.1361891, 2.596927, -0.3407965, 0, 0, 0, 1, 1,
0.1379038, -0.7336103, 3.286533, 0, 0, 0, 1, 1,
0.1423508, 0.09676281, 2.440261, 0, 0, 0, 1, 1,
0.1425598, -0.7498782, 3.078536, 0, 0, 0, 1, 1,
0.1432895, 0.4437224, 1.717669, 0, 0, 0, 1, 1,
0.1499059, 0.3288658, 1.464773, 0, 0, 0, 1, 1,
0.1500569, -0.2928981, 3.915404, 1, 1, 1, 1, 1,
0.1534753, 0.5136088, 1.105971, 1, 1, 1, 1, 1,
0.1537163, -0.7735391, 3.148477, 1, 1, 1, 1, 1,
0.1548937, -0.8654838, 4.429863, 1, 1, 1, 1, 1,
0.1557011, -2.195597, 3.667627, 1, 1, 1, 1, 1,
0.1589197, -0.08826806, 0.2610239, 1, 1, 1, 1, 1,
0.1595677, 0.8363171, 0.4523283, 1, 1, 1, 1, 1,
0.1771559, 0.7823313, 2.581803, 1, 1, 1, 1, 1,
0.1805578, -1.694137, 3.444503, 1, 1, 1, 1, 1,
0.1810492, 0.08185697, 2.27073, 1, 1, 1, 1, 1,
0.1848675, -0.1684394, 2.190295, 1, 1, 1, 1, 1,
0.1853308, -0.1981419, 2.819843, 1, 1, 1, 1, 1,
0.1907175, 0.2514668, 1.200216, 1, 1, 1, 1, 1,
0.1913468, -0.4656764, 3.61427, 1, 1, 1, 1, 1,
0.1944363, -0.6637439, 2.771477, 1, 1, 1, 1, 1,
0.1946923, 0.3962375, -0.8941186, 0, 0, 1, 1, 1,
0.1953548, -0.9250664, 2.643742, 1, 0, 0, 1, 1,
0.1960628, 0.4971677, 2.252702, 1, 0, 0, 1, 1,
0.197942, -1.365715, 3.433927, 1, 0, 0, 1, 1,
0.2010433, 0.6251986, -1.42678, 1, 0, 0, 1, 1,
0.202254, -1.326676, 1.437626, 1, 0, 0, 1, 1,
0.2049368, -1.397249, 2.773709, 0, 0, 0, 1, 1,
0.2053416, -1.213843, 3.657628, 0, 0, 0, 1, 1,
0.2112609, -0.6405208, 4.192513, 0, 0, 0, 1, 1,
0.2117554, 0.5816281, 0.1978386, 0, 0, 0, 1, 1,
0.2140801, 0.7438439, 0.4751496, 0, 0, 0, 1, 1,
0.2158027, -1.082702, 2.696162, 0, 0, 0, 1, 1,
0.2163767, -0.38921, 1.162693, 0, 0, 0, 1, 1,
0.2200049, -0.6606466, 1.830655, 1, 1, 1, 1, 1,
0.2203302, -0.1137168, 2.55996, 1, 1, 1, 1, 1,
0.2221738, -0.942181, 1.75879, 1, 1, 1, 1, 1,
0.2232352, -0.6679555, 2.515844, 1, 1, 1, 1, 1,
0.230736, -0.7991152, 3.105325, 1, 1, 1, 1, 1,
0.2324965, 1.060317, 1.099337, 1, 1, 1, 1, 1,
0.2337121, -0.09004468, 1.670865, 1, 1, 1, 1, 1,
0.2347484, -1.646105, 1.995952, 1, 1, 1, 1, 1,
0.2391363, 1.323312, -1.913685, 1, 1, 1, 1, 1,
0.2419305, 0.3844807, 2.462527, 1, 1, 1, 1, 1,
0.2421068, 0.1823954, -1.127218, 1, 1, 1, 1, 1,
0.2427826, 1.004083, 1.189877, 1, 1, 1, 1, 1,
0.2436416, 0.5983603, -1.631244, 1, 1, 1, 1, 1,
0.2448118, 0.585568, 0.6842152, 1, 1, 1, 1, 1,
0.2453969, 0.002249437, 1.280951, 1, 1, 1, 1, 1,
0.2456274, -1.070816, 3.964912, 0, 0, 1, 1, 1,
0.2479701, 0.7038429, 2.199983, 1, 0, 0, 1, 1,
0.2488404, -1.03284, 4.988676, 1, 0, 0, 1, 1,
0.2495684, 2.108969, 0.1267582, 1, 0, 0, 1, 1,
0.2505692, -0.7697787, 3.864131, 1, 0, 0, 1, 1,
0.2509112, -0.5488731, 2.138432, 1, 0, 0, 1, 1,
0.2551338, -1.07848, 1.097228, 0, 0, 0, 1, 1,
0.2592963, 0.2715774, 0.03479018, 0, 0, 0, 1, 1,
0.2625269, -0.092277, 2.062821, 0, 0, 0, 1, 1,
0.2639074, -0.9780463, 1.935518, 0, 0, 0, 1, 1,
0.2665791, 0.3784624, 0.8996326, 0, 0, 0, 1, 1,
0.2676407, 0.8935504, 0.9780916, 0, 0, 0, 1, 1,
0.2695786, -0.4616555, 2.920479, 0, 0, 0, 1, 1,
0.2727181, -0.1497384, 1.114466, 1, 1, 1, 1, 1,
0.2742141, 0.1038646, 1.27285, 1, 1, 1, 1, 1,
0.2749992, 1.13661, -0.2316113, 1, 1, 1, 1, 1,
0.2752421, 0.7639843, 0.1778429, 1, 1, 1, 1, 1,
0.2783568, 0.6089039, -0.6180487, 1, 1, 1, 1, 1,
0.2812904, 1.248509, 1.158578, 1, 1, 1, 1, 1,
0.2824103, -0.7426556, 2.403019, 1, 1, 1, 1, 1,
0.2852968, 0.07079242, 1.108448, 1, 1, 1, 1, 1,
0.2869616, 0.5586301, 0.02065717, 1, 1, 1, 1, 1,
0.2886503, 0.1058097, 0.3504399, 1, 1, 1, 1, 1,
0.2887295, 1.039334, -1.608845, 1, 1, 1, 1, 1,
0.2895352, -1.542599, 2.5765, 1, 1, 1, 1, 1,
0.2922532, -2.557079, 3.321619, 1, 1, 1, 1, 1,
0.2931132, -0.6870105, 0.622317, 1, 1, 1, 1, 1,
0.2943732, -2.332697, 3.332785, 1, 1, 1, 1, 1,
0.295038, 0.3322275, 0.3497409, 0, 0, 1, 1, 1,
0.3044857, -0.4056623, 2.145666, 1, 0, 0, 1, 1,
0.3050846, -0.9872593, 3.05828, 1, 0, 0, 1, 1,
0.3093418, -0.1662348, 2.195633, 1, 0, 0, 1, 1,
0.3094716, -0.4406402, 1.341803, 1, 0, 0, 1, 1,
0.3170869, -2.156995, 3.753483, 1, 0, 0, 1, 1,
0.3173155, 0.7045562, 0.6321543, 0, 0, 0, 1, 1,
0.3219711, 0.1943775, 2.538482, 0, 0, 0, 1, 1,
0.3241101, 2.788645, -0.5598271, 0, 0, 0, 1, 1,
0.3247702, 0.9719484, -0.6725121, 0, 0, 0, 1, 1,
0.3248832, -0.1983224, 3.925355, 0, 0, 0, 1, 1,
0.3249153, -1.462903, 3.325322, 0, 0, 0, 1, 1,
0.3251963, -0.420143, 2.472877, 0, 0, 0, 1, 1,
0.3276395, -0.744154, 1.641576, 1, 1, 1, 1, 1,
0.3293369, -0.8678667, 2.491142, 1, 1, 1, 1, 1,
0.3299211, 0.9470849, 1.171499, 1, 1, 1, 1, 1,
0.3387127, 1.797516, 0.9165918, 1, 1, 1, 1, 1,
0.340108, 0.5574542, 1.050951, 1, 1, 1, 1, 1,
0.3429919, -0.6506339, 2.104888, 1, 1, 1, 1, 1,
0.3439174, 1.852107, -0.03764691, 1, 1, 1, 1, 1,
0.3449721, 0.1612621, -1.126766, 1, 1, 1, 1, 1,
0.3491343, 1.141078, -1.393162, 1, 1, 1, 1, 1,
0.3515625, -1.02693, 2.57489, 1, 1, 1, 1, 1,
0.352529, 0.2301898, 1.379084, 1, 1, 1, 1, 1,
0.354039, -2.435599, 5.250268, 1, 1, 1, 1, 1,
0.3541386, 0.09402455, 2.657738, 1, 1, 1, 1, 1,
0.3546453, -0.9478549, 2.599085, 1, 1, 1, 1, 1,
0.3552284, 0.89698, 0.2945139, 1, 1, 1, 1, 1,
0.3599665, -0.202865, 2.114221, 0, 0, 1, 1, 1,
0.369523, -1.093925, 2.113139, 1, 0, 0, 1, 1,
0.3781937, -0.4727929, 2.438542, 1, 0, 0, 1, 1,
0.3783776, 0.6689539, -0.2005324, 1, 0, 0, 1, 1,
0.379041, 1.605783, 0.6794791, 1, 0, 0, 1, 1,
0.3821975, 0.4247261, 0.8050733, 1, 0, 0, 1, 1,
0.3840028, -0.6925992, 3.890204, 0, 0, 0, 1, 1,
0.3849383, 1.140583, -0.256563, 0, 0, 0, 1, 1,
0.3877792, 0.7929926, 1.027886, 0, 0, 0, 1, 1,
0.3895249, 0.1638372, 2.323193, 0, 0, 0, 1, 1,
0.3905709, -0.1386999, 3.273258, 0, 0, 0, 1, 1,
0.3934484, 0.6519044, -0.3366483, 0, 0, 0, 1, 1,
0.3943775, -0.254566, 0.8846609, 0, 0, 0, 1, 1,
0.397878, 0.419836, 0.2098269, 1, 1, 1, 1, 1,
0.4007956, -1.072833, 3.107723, 1, 1, 1, 1, 1,
0.4024753, -0.6955175, 4.242801, 1, 1, 1, 1, 1,
0.4084622, 0.3133501, 1.797341, 1, 1, 1, 1, 1,
0.41124, -0.1059246, 1.887411, 1, 1, 1, 1, 1,
0.4161984, 1.69248, 0.4471561, 1, 1, 1, 1, 1,
0.4223472, 0.9001334, 1.651421, 1, 1, 1, 1, 1,
0.4253505, -0.6786565, 1.33465, 1, 1, 1, 1, 1,
0.4261796, 0.6891056, 1.152919, 1, 1, 1, 1, 1,
0.4309791, -2.359164, 2.724683, 1, 1, 1, 1, 1,
0.4314125, -0.001559889, 0.8312652, 1, 1, 1, 1, 1,
0.4327166, 1.503744, -0.7171, 1, 1, 1, 1, 1,
0.4341854, 0.2347092, 1.26428, 1, 1, 1, 1, 1,
0.4381235, 0.3804522, 2.182714, 1, 1, 1, 1, 1,
0.4421032, 0.4626365, -0.2592578, 1, 1, 1, 1, 1,
0.4428557, 0.4668326, 0.190208, 0, 0, 1, 1, 1,
0.4437702, 0.155876, 0.439503, 1, 0, 0, 1, 1,
0.4484659, 0.06485621, 0.101083, 1, 0, 0, 1, 1,
0.4521118, 0.516473, 2.041673, 1, 0, 0, 1, 1,
0.452734, 0.4969794, 2.092921, 1, 0, 0, 1, 1,
0.4578926, 0.9734235, -0.4502186, 1, 0, 0, 1, 1,
0.4586576, -0.5264902, 2.989726, 0, 0, 0, 1, 1,
0.4590411, -1.331889, 3.398389, 0, 0, 0, 1, 1,
0.4622551, 0.193218, 1.889453, 0, 0, 0, 1, 1,
0.4625705, -1.264646, 2.123441, 0, 0, 0, 1, 1,
0.4627085, -0.3399745, 3.589872, 0, 0, 0, 1, 1,
0.4639625, 0.9881142, 1.487859, 0, 0, 0, 1, 1,
0.4727682, 0.3689041, 1.044521, 0, 0, 0, 1, 1,
0.4777099, 0.3153566, 0.05621771, 1, 1, 1, 1, 1,
0.4813129, 0.7806775, 2.321477, 1, 1, 1, 1, 1,
0.4850521, -1.510695, 3.444734, 1, 1, 1, 1, 1,
0.4858629, -0.8005965, 3.072732, 1, 1, 1, 1, 1,
0.4860969, -0.5536203, 1.915999, 1, 1, 1, 1, 1,
0.4882782, -1.218411, 3.322045, 1, 1, 1, 1, 1,
0.4935193, 0.498453, 1.000755, 1, 1, 1, 1, 1,
0.4941859, 0.9400048, 0.4597423, 1, 1, 1, 1, 1,
0.4953945, 0.6303822, -0.4602107, 1, 1, 1, 1, 1,
0.5008398, -0.596024, 2.046304, 1, 1, 1, 1, 1,
0.5051351, 0.1556597, 2.621665, 1, 1, 1, 1, 1,
0.5089176, 0.5031522, 0.3922267, 1, 1, 1, 1, 1,
0.5106382, -1.947015, 4.181455, 1, 1, 1, 1, 1,
0.5123104, 0.2064688, 0.3776956, 1, 1, 1, 1, 1,
0.5127403, -0.05119981, 2.527189, 1, 1, 1, 1, 1,
0.5159686, -0.9821636, 3.337435, 0, 0, 1, 1, 1,
0.5165699, 1.076616, 1.74111, 1, 0, 0, 1, 1,
0.5175156, -0.8069597, 1.252428, 1, 0, 0, 1, 1,
0.5187505, -0.3022937, 1.4605, 1, 0, 0, 1, 1,
0.5257811, -1.104457, 3.069292, 1, 0, 0, 1, 1,
0.5291613, -1.006027, 1.368755, 1, 0, 0, 1, 1,
0.5301905, -1.263956, 2.00454, 0, 0, 0, 1, 1,
0.5303969, -1.252722, 5.692664, 0, 0, 0, 1, 1,
0.5439731, -0.5236484, 2.067902, 0, 0, 0, 1, 1,
0.5440724, 1.509558, 0.6087683, 0, 0, 0, 1, 1,
0.5588498, 1.846822, 0.3252996, 0, 0, 0, 1, 1,
0.5596671, 0.9474329, 0.7889919, 0, 0, 0, 1, 1,
0.5600497, 1.53254, -0.9404277, 0, 0, 0, 1, 1,
0.5623707, 0.5266583, 0.4327002, 1, 1, 1, 1, 1,
0.5654181, 1.812431, 1.100321, 1, 1, 1, 1, 1,
0.5672657, 0.6519642, 0.01888263, 1, 1, 1, 1, 1,
0.5723686, -0.1634356, 1.178286, 1, 1, 1, 1, 1,
0.5727883, 0.3495124, 0.8859595, 1, 1, 1, 1, 1,
0.5739765, 0.3025035, -1.098253, 1, 1, 1, 1, 1,
0.574793, 0.9170817, 0.04919157, 1, 1, 1, 1, 1,
0.5778915, 0.9517676, 0.9204184, 1, 1, 1, 1, 1,
0.5796319, 0.3010917, 0.0437096, 1, 1, 1, 1, 1,
0.5806863, 0.02778428, 0.5130426, 1, 1, 1, 1, 1,
0.5838046, 1.465357, 1.918721, 1, 1, 1, 1, 1,
0.585786, -1.548218, 3.406011, 1, 1, 1, 1, 1,
0.5870947, -0.9042133, 4.107963, 1, 1, 1, 1, 1,
0.5956569, 0.3412119, 0.09987758, 1, 1, 1, 1, 1,
0.6065706, -0.562341, 2.93861, 1, 1, 1, 1, 1,
0.6084798, 0.6898886, 0.4840511, 0, 0, 1, 1, 1,
0.6129529, -0.9244051, 3.256278, 1, 0, 0, 1, 1,
0.614086, -0.1493059, 1.232374, 1, 0, 0, 1, 1,
0.6194077, 0.3774806, 2.107397, 1, 0, 0, 1, 1,
0.6205084, 0.4377259, 0.5419457, 1, 0, 0, 1, 1,
0.6209198, -0.07534903, 0.9664378, 1, 0, 0, 1, 1,
0.6250666, -1.059192, 2.697043, 0, 0, 0, 1, 1,
0.6277488, 0.009497407, 1.620716, 0, 0, 0, 1, 1,
0.6316613, 1.151217, -0.3894353, 0, 0, 0, 1, 1,
0.6331904, -1.333903, 3.901709, 0, 0, 0, 1, 1,
0.6401012, -1.425778, 4.11966, 0, 0, 0, 1, 1,
0.6426628, -1.077359, 4.290111, 0, 0, 0, 1, 1,
0.6471027, 0.2475866, 1.278484, 0, 0, 0, 1, 1,
0.6474089, 1.818532, -0.5543837, 1, 1, 1, 1, 1,
0.6625527, 0.8233254, -0.3777237, 1, 1, 1, 1, 1,
0.6661605, 0.6665952, 1.024373, 1, 1, 1, 1, 1,
0.6675326, -0.6230291, 1.521848, 1, 1, 1, 1, 1,
0.6680214, -1.386826, 1.658142, 1, 1, 1, 1, 1,
0.6693007, 1.173525, 0.01419672, 1, 1, 1, 1, 1,
0.6735981, -2.008798, 2.478051, 1, 1, 1, 1, 1,
0.6739311, -0.976824, 1.90909, 1, 1, 1, 1, 1,
0.6786154, -0.627757, 1.194659, 1, 1, 1, 1, 1,
0.6792259, -0.4312787, 1.910984, 1, 1, 1, 1, 1,
0.6796132, 0.3179638, -0.1750515, 1, 1, 1, 1, 1,
0.6825756, 1.388561, 0.131727, 1, 1, 1, 1, 1,
0.6844301, -1.393546, 2.800055, 1, 1, 1, 1, 1,
0.6872384, -0.2606688, 2.070014, 1, 1, 1, 1, 1,
0.6916778, 1.611696, 1.404821, 1, 1, 1, 1, 1,
0.7012588, -1.019684, 4.192273, 0, 0, 1, 1, 1,
0.7042169, -0.354902, 1.005692, 1, 0, 0, 1, 1,
0.7070698, -0.7089893, 2.232291, 1, 0, 0, 1, 1,
0.7200444, -2.085109, 3.412811, 1, 0, 0, 1, 1,
0.7201283, 0.9160417, 2.291225, 1, 0, 0, 1, 1,
0.7213129, -1.462588, 2.661479, 1, 0, 0, 1, 1,
0.7219806, -1.192285, 2.221201, 0, 0, 0, 1, 1,
0.7394981, -0.4137244, 2.596773, 0, 0, 0, 1, 1,
0.7420637, -1.379726, 2.364283, 0, 0, 0, 1, 1,
0.7432353, 0.8828213, 0.3791563, 0, 0, 0, 1, 1,
0.743821, 0.8078855, 1.402649, 0, 0, 0, 1, 1,
0.7439073, 1.71814, 0.9138756, 0, 0, 0, 1, 1,
0.7519175, -0.08975463, 1.419964, 0, 0, 0, 1, 1,
0.7535067, -0.9976367, 1.870528, 1, 1, 1, 1, 1,
0.7554069, 0.6519265, 1.549553, 1, 1, 1, 1, 1,
0.7593202, -0.8750688, 2.67011, 1, 1, 1, 1, 1,
0.7618051, -0.7820408, 2.722955, 1, 1, 1, 1, 1,
0.7636673, 0.0913013, 3.392697, 1, 1, 1, 1, 1,
0.7641369, -0.8281122, 2.340305, 1, 1, 1, 1, 1,
0.7660751, -0.5459995, 0.6368857, 1, 1, 1, 1, 1,
0.7675152, 0.6473426, -1.107419, 1, 1, 1, 1, 1,
0.7704127, 1.323272, -0.2536901, 1, 1, 1, 1, 1,
0.7761757, 1.595271, 2.624431, 1, 1, 1, 1, 1,
0.7796384, 0.6448524, 0.3914328, 1, 1, 1, 1, 1,
0.7809582, 1.362795, 0.9750038, 1, 1, 1, 1, 1,
0.7847105, 0.5052449, 1.738206, 1, 1, 1, 1, 1,
0.7876202, 0.09962311, 0.2138153, 1, 1, 1, 1, 1,
0.7919633, 1.274612, -0.8929911, 1, 1, 1, 1, 1,
0.792125, -0.8352842, 2.292238, 0, 0, 1, 1, 1,
0.7954381, -0.1230698, 2.189967, 1, 0, 0, 1, 1,
0.7967882, -1.93646, 2.691394, 1, 0, 0, 1, 1,
0.8033245, -0.6560522, 3.848752, 1, 0, 0, 1, 1,
0.8035172, 0.926348, 1.144019, 1, 0, 0, 1, 1,
0.8045713, 0.9089518, -0.5733043, 1, 0, 0, 1, 1,
0.8066826, 1.662784, -0.5248584, 0, 0, 0, 1, 1,
0.8071936, 0.6674796, 1.398262, 0, 0, 0, 1, 1,
0.8075676, 0.1340626, 1.191671, 0, 0, 0, 1, 1,
0.808136, 0.3712652, 2.103658, 0, 0, 0, 1, 1,
0.808731, 1.459439, 0.2175858, 0, 0, 0, 1, 1,
0.8229909, 0.004253264, 1.121505, 0, 0, 0, 1, 1,
0.8237305, -0.003252123, 1.914059, 0, 0, 0, 1, 1,
0.8325417, -0.08836643, 0.8241879, 1, 1, 1, 1, 1,
0.8330004, 0.09306412, 1.032751, 1, 1, 1, 1, 1,
0.8468405, -0.08829284, 1.600259, 1, 1, 1, 1, 1,
0.8482612, 0.7291452, 1.052779, 1, 1, 1, 1, 1,
0.8484706, -0.2503681, 3.029362, 1, 1, 1, 1, 1,
0.8543159, -0.2085164, 2.473535, 1, 1, 1, 1, 1,
0.8585349, 0.3222924, 2.655067, 1, 1, 1, 1, 1,
0.8618456, 1.044311, 1.477715, 1, 1, 1, 1, 1,
0.8631573, 0.3498997, 0.9862329, 1, 1, 1, 1, 1,
0.8706685, -0.1263368, 2.441764, 1, 1, 1, 1, 1,
0.8709751, -0.5680056, 1.668745, 1, 1, 1, 1, 1,
0.873659, -1.673305, 2.922432, 1, 1, 1, 1, 1,
0.877733, 0.2717482, -0.1153542, 1, 1, 1, 1, 1,
0.8782819, 1.735066, -0.6407871, 1, 1, 1, 1, 1,
0.8897513, -0.3838896, 1.904357, 1, 1, 1, 1, 1,
0.8919368, -0.8316664, 3.746595, 0, 0, 1, 1, 1,
0.8973412, -0.06558631, 1.524111, 1, 0, 0, 1, 1,
0.8989931, 0.3730029, 1.279174, 1, 0, 0, 1, 1,
0.9010929, 0.8532383, 1.309224, 1, 0, 0, 1, 1,
0.9050534, 0.9300292, 1.735851, 1, 0, 0, 1, 1,
0.9050692, 0.8040836, 2.895328, 1, 0, 0, 1, 1,
0.9062945, -1.577455, 2.154067, 0, 0, 0, 1, 1,
0.9128949, -0.5795119, 2.987564, 0, 0, 0, 1, 1,
0.9153398, -0.1620859, 1.354087, 0, 0, 0, 1, 1,
0.9216965, -0.5252118, 2.419917, 0, 0, 0, 1, 1,
0.9259711, -0.4483755, 2.031494, 0, 0, 0, 1, 1,
0.9262612, 1.444242, 1.699072, 0, 0, 0, 1, 1,
0.9283603, 0.6820943, -0.225859, 0, 0, 0, 1, 1,
0.9306788, -0.002997272, 2.661467, 1, 1, 1, 1, 1,
0.9336092, -0.4827054, 2.749851, 1, 1, 1, 1, 1,
0.9350869, 1.396323, 0.1356576, 1, 1, 1, 1, 1,
0.9353756, -0.5967471, 1.288212, 1, 1, 1, 1, 1,
0.935621, 0.8270426, 1.703951, 1, 1, 1, 1, 1,
0.9359185, 0.4609639, 0.8250547, 1, 1, 1, 1, 1,
0.9512489, -0.4972216, 1.907741, 1, 1, 1, 1, 1,
0.9512765, 0.05237615, 1.370717, 1, 1, 1, 1, 1,
0.9635799, -0.005439152, 1.984109, 1, 1, 1, 1, 1,
0.9643925, -0.7846171, 2.125932, 1, 1, 1, 1, 1,
0.9652678, -0.8242216, 5.207832, 1, 1, 1, 1, 1,
0.9676391, 0.2886809, 2.787645, 1, 1, 1, 1, 1,
0.9711293, 0.8545946, -0.9782033, 1, 1, 1, 1, 1,
0.9750919, 0.1565737, 1.719942, 1, 1, 1, 1, 1,
0.978359, -0.8423834, 3.231773, 1, 1, 1, 1, 1,
0.9859153, -0.1069751, 1.809434, 0, 0, 1, 1, 1,
0.989046, 1.752568, 0.8031591, 1, 0, 0, 1, 1,
0.9935528, 0.9823078, 0.8709616, 1, 0, 0, 1, 1,
0.9967616, 0.3883254, 2.279606, 1, 0, 0, 1, 1,
0.9976887, -1.086113, 3.748072, 1, 0, 0, 1, 1,
1.009809, -0.5834851, 2.694924, 1, 0, 0, 1, 1,
1.015801, -0.01482382, 4.234421, 0, 0, 0, 1, 1,
1.016696, 0.4595957, -0.2275488, 0, 0, 0, 1, 1,
1.020871, -1.050601, 2.517469, 0, 0, 0, 1, 1,
1.021602, -0.6013725, 1.639508, 0, 0, 0, 1, 1,
1.021706, -0.4336263, 1.746752, 0, 0, 0, 1, 1,
1.022423, -0.7858918, 1.652753, 0, 0, 0, 1, 1,
1.023924, -0.3050042, 1.654002, 0, 0, 0, 1, 1,
1.024995, 0.07079645, 1.919093, 1, 1, 1, 1, 1,
1.027197, 1.034979, -0.7808642, 1, 1, 1, 1, 1,
1.033287, 1.037762, 2.401378, 1, 1, 1, 1, 1,
1.033488, -0.6975321, 4.394663, 1, 1, 1, 1, 1,
1.038024, -1.158027, 2.118232, 1, 1, 1, 1, 1,
1.057279, -0.2522616, 2.775799, 1, 1, 1, 1, 1,
1.05788, -1.548182, 4.031644, 1, 1, 1, 1, 1,
1.062372, 0.6291648, 2.68584, 1, 1, 1, 1, 1,
1.067202, -0.2336418, 2.039623, 1, 1, 1, 1, 1,
1.069566, 0.5069759, 2.859417, 1, 1, 1, 1, 1,
1.07704, 0.4613024, 1.317772, 1, 1, 1, 1, 1,
1.079027, -1.1633, 2.144874, 1, 1, 1, 1, 1,
1.09181, -1.107905, 2.362353, 1, 1, 1, 1, 1,
1.092586, -0.6831154, 3.568625, 1, 1, 1, 1, 1,
1.096118, 0.07630416, 0.9336169, 1, 1, 1, 1, 1,
1.099658, -0.9359397, 3.028545, 0, 0, 1, 1, 1,
1.105284, -0.8368826, 1.734383, 1, 0, 0, 1, 1,
1.107921, -0.5626298, 2.434855, 1, 0, 0, 1, 1,
1.108699, -0.3484885, 0.6565819, 1, 0, 0, 1, 1,
1.110251, -0.5590264, 1.216577, 1, 0, 0, 1, 1,
1.111016, 1.464949, 1.473102, 1, 0, 0, 1, 1,
1.113282, -0.9052535, 1.028229, 0, 0, 0, 1, 1,
1.127707, 1.77431, 1.120927, 0, 0, 0, 1, 1,
1.132856, 1.542, 1.625393, 0, 0, 0, 1, 1,
1.13687, 0.9447727, 1.774017, 0, 0, 0, 1, 1,
1.139777, -1.316541, 3.081526, 0, 0, 0, 1, 1,
1.141638, -1.51294, 1.8438, 0, 0, 0, 1, 1,
1.14756, -0.2643515, 2.404917, 0, 0, 0, 1, 1,
1.154836, -1.119075, 3.697706, 1, 1, 1, 1, 1,
1.154901, -0.3603031, -0.0251719, 1, 1, 1, 1, 1,
1.161363, -0.5453664, 2.18265, 1, 1, 1, 1, 1,
1.173325, 0.9535647, 1.014621, 1, 1, 1, 1, 1,
1.178804, 0.226388, 3.172555, 1, 1, 1, 1, 1,
1.181579, -0.6647707, 2.735718, 1, 1, 1, 1, 1,
1.191361, -0.6050339, 1.962548, 1, 1, 1, 1, 1,
1.193965, 0.1070594, 1.194176, 1, 1, 1, 1, 1,
1.201819, -0.2214992, 2.998121, 1, 1, 1, 1, 1,
1.203562, -0.6193533, 3.342813, 1, 1, 1, 1, 1,
1.206241, 0.1963627, -0.2849546, 1, 1, 1, 1, 1,
1.207041, -1.014087, 2.233469, 1, 1, 1, 1, 1,
1.217098, -1.39448, 0.5153194, 1, 1, 1, 1, 1,
1.219039, 0.2422091, 1.331658, 1, 1, 1, 1, 1,
1.220646, 0.6234951, 1.623896, 1, 1, 1, 1, 1,
1.23206, 0.9583869, 0.2776299, 0, 0, 1, 1, 1,
1.23735, -0.5615078, 3.124274, 1, 0, 0, 1, 1,
1.239451, -0.6613446, 2.922517, 1, 0, 0, 1, 1,
1.252769, -1.439843, 2.472634, 1, 0, 0, 1, 1,
1.278279, -1.170884, 2.744333, 1, 0, 0, 1, 1,
1.281311, 0.4047762, 0.2463239, 1, 0, 0, 1, 1,
1.289754, -1.305878, 1.917077, 0, 0, 0, 1, 1,
1.301937, -0.6429595, 1.556191, 0, 0, 0, 1, 1,
1.303368, -0.5499574, 1.434803, 0, 0, 0, 1, 1,
1.316398, 0.8372071, 0.732823, 0, 0, 0, 1, 1,
1.316843, 0.005002731, 1.489759, 0, 0, 0, 1, 1,
1.328244, 1.124818, 1.076919, 0, 0, 0, 1, 1,
1.343851, -0.128022, 0.9560715, 0, 0, 0, 1, 1,
1.349463, 1.483397, 1.430897, 1, 1, 1, 1, 1,
1.350269, 0.4732348, 4.157959, 1, 1, 1, 1, 1,
1.357671, 0.9404379, 1.521144, 1, 1, 1, 1, 1,
1.366074, -0.9980621, 2.307864, 1, 1, 1, 1, 1,
1.367341, 0.9788115, 0.5406023, 1, 1, 1, 1, 1,
1.37554, 0.6390967, 1.470087, 1, 1, 1, 1, 1,
1.378733, -0.3441578, 1.517174, 1, 1, 1, 1, 1,
1.379724, -0.2266476, 2.812734, 1, 1, 1, 1, 1,
1.387948, 0.2602642, 2.142799, 1, 1, 1, 1, 1,
1.389441, 0.9822642, 0.6544173, 1, 1, 1, 1, 1,
1.39587, -0.2926856, 2.695818, 1, 1, 1, 1, 1,
1.400529, -0.945848, 2.064432, 1, 1, 1, 1, 1,
1.401212, -1.350748, 2.384583, 1, 1, 1, 1, 1,
1.402769, -0.1198484, 1.951242, 1, 1, 1, 1, 1,
1.40876, 0.3088078, 1.305254, 1, 1, 1, 1, 1,
1.410146, -1.301359, 3.080235, 0, 0, 1, 1, 1,
1.417717, 0.07444118, 0.9822459, 1, 0, 0, 1, 1,
1.423587, -0.9825894, 3.094363, 1, 0, 0, 1, 1,
1.426903, 1.474358, -0.6839401, 1, 0, 0, 1, 1,
1.434134, -0.7204587, 2.337769, 1, 0, 0, 1, 1,
1.445888, -1.668384, 1.960736, 1, 0, 0, 1, 1,
1.450488, -0.852495, 3.259629, 0, 0, 0, 1, 1,
1.459579, 1.314944, 2.571357, 0, 0, 0, 1, 1,
1.468723, 1.077627, 1.958867, 0, 0, 0, 1, 1,
1.470069, -0.8157702, 1.600552, 0, 0, 0, 1, 1,
1.475281, -0.4471906, 2.669963, 0, 0, 0, 1, 1,
1.476685, -0.8526721, 4.087976, 0, 0, 0, 1, 1,
1.480252, 0.3355953, 1.524097, 0, 0, 0, 1, 1,
1.484585, 1.26281, 0.7231173, 1, 1, 1, 1, 1,
1.484996, 0.7932674, 2.248123, 1, 1, 1, 1, 1,
1.498536, -1.131462, 2.080966, 1, 1, 1, 1, 1,
1.510451, -0.2386412, 1.877704, 1, 1, 1, 1, 1,
1.513116, -0.6413203, 1.984102, 1, 1, 1, 1, 1,
1.520711, 0.804249, 0.2444957, 1, 1, 1, 1, 1,
1.54312, -0.03949931, 1.347495, 1, 1, 1, 1, 1,
1.544921, -1.635243, 3.40788, 1, 1, 1, 1, 1,
1.567257, -0.04041985, 2.844883, 1, 1, 1, 1, 1,
1.574337, -0.7507787, 2.095997, 1, 1, 1, 1, 1,
1.589061, 1.21448, 2.083375, 1, 1, 1, 1, 1,
1.593761, -0.2538918, 0.9230903, 1, 1, 1, 1, 1,
1.59804, 1.659683, 0.6218339, 1, 1, 1, 1, 1,
1.607731, 1.10062, -0.2644267, 1, 1, 1, 1, 1,
1.615149, 0.6857592, 2.480719, 1, 1, 1, 1, 1,
1.619585, -1.397755, 0.9278388, 0, 0, 1, 1, 1,
1.628148, 0.8740484, 0.8585476, 1, 0, 0, 1, 1,
1.630912, 1.320167, 1.438341, 1, 0, 0, 1, 1,
1.641493, 0.5047921, 1.353839, 1, 0, 0, 1, 1,
1.653669, -1.296145, 1.293696, 1, 0, 0, 1, 1,
1.657222, -0.03966786, -0.0315248, 1, 0, 0, 1, 1,
1.671596, 1.49018, -0.436812, 0, 0, 0, 1, 1,
1.681028, 0.1944616, 3.105028, 0, 0, 0, 1, 1,
1.686888, -0.4377137, 2.540236, 0, 0, 0, 1, 1,
1.688022, -0.03059321, 2.606492, 0, 0, 0, 1, 1,
1.697504, -0.1494408, 2.263271, 0, 0, 0, 1, 1,
1.700367, -2.365959, 4.214617, 0, 0, 0, 1, 1,
1.702512, 1.240708, 1.843914, 0, 0, 0, 1, 1,
1.713497, 1.994525, -0.7729263, 1, 1, 1, 1, 1,
1.723517, -0.8895685, 1.892793, 1, 1, 1, 1, 1,
1.72384, -1.553016, 2.292555, 1, 1, 1, 1, 1,
1.743727, -0.8541957, 0.5390797, 1, 1, 1, 1, 1,
1.744379, 0.1964029, 2.248507, 1, 1, 1, 1, 1,
1.744708, -1.935309, 1.577564, 1, 1, 1, 1, 1,
1.753049, -0.2203628, 2.838889, 1, 1, 1, 1, 1,
1.804573, -0.4287469, 0.3344409, 1, 1, 1, 1, 1,
1.835356, 1.178454, 0.08451928, 1, 1, 1, 1, 1,
1.848696, -1.802254, 3.749491, 1, 1, 1, 1, 1,
1.867702, -0.5280507, 2.968921, 1, 1, 1, 1, 1,
1.877068, -1.135849, 2.467598, 1, 1, 1, 1, 1,
1.882133, 0.3260095, 0.9387705, 1, 1, 1, 1, 1,
1.886505, -0.8553124, 1.417942, 1, 1, 1, 1, 1,
1.908571, 0.1479756, 1.487245, 1, 1, 1, 1, 1,
1.908601, 1.373054, 0.6201056, 0, 0, 1, 1, 1,
1.962877, -0.04490716, 1.692585, 1, 0, 0, 1, 1,
1.968504, 1.111786, 2.644819, 1, 0, 0, 1, 1,
1.973107, -0.4761129, 1.631353, 1, 0, 0, 1, 1,
1.991873, 0.795226, -0.6971183, 1, 0, 0, 1, 1,
2.004824, 1.352521, 0.6024156, 1, 0, 0, 1, 1,
2.022688, 0.8659497, 2.327487, 0, 0, 0, 1, 1,
2.068887, 0.2499928, 1.158596, 0, 0, 0, 1, 1,
2.142101, -0.4918926, 0.8511599, 0, 0, 0, 1, 1,
2.206945, 0.3328619, 1.381276, 0, 0, 0, 1, 1,
2.255165, -0.7562456, 1.82882, 0, 0, 0, 1, 1,
2.358299, -0.2018502, 2.301098, 0, 0, 0, 1, 1,
2.421278, -1.525981, 2.760392, 0, 0, 0, 1, 1,
2.445881, -0.7318906, 2.065105, 1, 1, 1, 1, 1,
2.45405, -0.3059101, 4.05158, 1, 1, 1, 1, 1,
2.497162, 1.205016, -0.5295684, 1, 1, 1, 1, 1,
2.788403, 0.7995704, 1.635419, 1, 1, 1, 1, 1,
2.833644, 0.9143173, 1.55096, 1, 1, 1, 1, 1,
2.878323, 0.02957541, 1.712705, 1, 1, 1, 1, 1,
3.297738, 0.00111607, 1.807453, 1, 1, 1, 1, 1
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
var radius = 10.4113;
var distance = 36.56927;
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
mvMatrix.translate( -0.05030584, -0.1492043, 0.6082828 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.56927);
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
