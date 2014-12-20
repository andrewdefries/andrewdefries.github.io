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
-3.233632, -0.7383027, -1.103516, 1, 0, 0, 1,
-2.641118, 0.758149, -2.434932, 1, 0.007843138, 0, 1,
-2.598673, -1.228857, -1.234893, 1, 0.01176471, 0, 1,
-2.527529, 0.5581883, -0.7876384, 1, 0.01960784, 0, 1,
-2.409141, 1.471424, -2.4696, 1, 0.02352941, 0, 1,
-2.401961, 0.6810288, -0.8938122, 1, 0.03137255, 0, 1,
-2.342709, 1.155025, 0.2829341, 1, 0.03529412, 0, 1,
-2.295124, 1.08452, -0.229405, 1, 0.04313726, 0, 1,
-2.289442, -1.224475, -1.116802, 1, 0.04705882, 0, 1,
-2.259784, -0.1641271, -1.850745, 1, 0.05490196, 0, 1,
-2.243667, 0.4644577, -2.421156, 1, 0.05882353, 0, 1,
-2.210268, 0.9155586, -0.2524132, 1, 0.06666667, 0, 1,
-2.206177, -0.05373087, 0.9516186, 1, 0.07058824, 0, 1,
-2.144301, -1.54386, -1.468777, 1, 0.07843138, 0, 1,
-2.134575, 0.2688193, -2.343288, 1, 0.08235294, 0, 1,
-2.133635, -1.165919, -3.747797, 1, 0.09019608, 0, 1,
-2.122403, -1.262837, -3.420265, 1, 0.09411765, 0, 1,
-2.110149, -0.8292332, -1.10606, 1, 0.1019608, 0, 1,
-1.997096, -0.7424918, -2.894154, 1, 0.1098039, 0, 1,
-1.973767, 1.697838, -0.1528905, 1, 0.1137255, 0, 1,
-1.961045, -1.39786, -1.959926, 1, 0.1215686, 0, 1,
-1.937593, -1.026654, -1.474971, 1, 0.1254902, 0, 1,
-1.92765, -0.3106463, -2.501614, 1, 0.1333333, 0, 1,
-1.926826, 0.154125, -2.432988, 1, 0.1372549, 0, 1,
-1.917677, -1.115884, -3.756566, 1, 0.145098, 0, 1,
-1.907869, -1.399618, -2.89924, 1, 0.1490196, 0, 1,
-1.90629, -0.6176468, -2.019938, 1, 0.1568628, 0, 1,
-1.905497, -0.4544959, -1.287546, 1, 0.1607843, 0, 1,
-1.904767, 2.104057, -0.1067343, 1, 0.1686275, 0, 1,
-1.903371, 1.615815, -0.008092746, 1, 0.172549, 0, 1,
-1.883697, -0.2936585, -0.9809644, 1, 0.1803922, 0, 1,
-1.864749, -0.1791892, -1.050153, 1, 0.1843137, 0, 1,
-1.814323, -1.14439, -1.855743, 1, 0.1921569, 0, 1,
-1.804915, 1.254894, -0.09580332, 1, 0.1960784, 0, 1,
-1.801591, 1.357589, -0.818154, 1, 0.2039216, 0, 1,
-1.796806, 0.357002, -2.45976, 1, 0.2117647, 0, 1,
-1.783243, 0.9222728, -1.034468, 1, 0.2156863, 0, 1,
-1.751577, -0.6740216, -1.616551, 1, 0.2235294, 0, 1,
-1.72452, 1.430581, 0.4542866, 1, 0.227451, 0, 1,
-1.718057, 0.6653613, -0.2274411, 1, 0.2352941, 0, 1,
-1.703821, -0.1612626, -2.330706, 1, 0.2392157, 0, 1,
-1.697618, 0.5370866, -1.095805, 1, 0.2470588, 0, 1,
-1.697527, 2.374712, -0.774544, 1, 0.2509804, 0, 1,
-1.695408, 0.7317545, -2.615795, 1, 0.2588235, 0, 1,
-1.691259, 0.05913923, -2.194996, 1, 0.2627451, 0, 1,
-1.681689, -2.526288, -3.634558, 1, 0.2705882, 0, 1,
-1.679731, -0.4378391, -0.7552636, 1, 0.2745098, 0, 1,
-1.660896, -0.5024455, -1.857122, 1, 0.282353, 0, 1,
-1.63985, 0.9157578, -1.316246, 1, 0.2862745, 0, 1,
-1.623629, -0.245474, -0.006332528, 1, 0.2941177, 0, 1,
-1.610695, -0.07776903, -0.3974853, 1, 0.3019608, 0, 1,
-1.606419, 0.7547691, -0.202673, 1, 0.3058824, 0, 1,
-1.603304, -0.1400206, -2.225866, 1, 0.3137255, 0, 1,
-1.580929, -1.300401, -2.496536, 1, 0.3176471, 0, 1,
-1.578267, -1.185039, -1.517574, 1, 0.3254902, 0, 1,
-1.572757, 0.3969604, -1.736052, 1, 0.3294118, 0, 1,
-1.570474, -1.378037, -2.524812, 1, 0.3372549, 0, 1,
-1.523558, 1.220589, 0.2455537, 1, 0.3411765, 0, 1,
-1.520369, 1.825333, 0.3390401, 1, 0.3490196, 0, 1,
-1.515609, 0.6821473, -0.02588246, 1, 0.3529412, 0, 1,
-1.506286, -0.8937602, -2.205658, 1, 0.3607843, 0, 1,
-1.506123, -0.4234496, -0.05181872, 1, 0.3647059, 0, 1,
-1.49876, -0.1572989, -0.02050729, 1, 0.372549, 0, 1,
-1.492612, -0.7604368, -2.428012, 1, 0.3764706, 0, 1,
-1.491476, -0.1387058, -1.842465, 1, 0.3843137, 0, 1,
-1.49068, -0.04183452, -1.043387, 1, 0.3882353, 0, 1,
-1.486944, -0.9648864, -2.545734, 1, 0.3960784, 0, 1,
-1.485234, -0.05444813, -1.740095, 1, 0.4039216, 0, 1,
-1.476855, 1.912198, -0.6632499, 1, 0.4078431, 0, 1,
-1.470117, -0.1942501, -1.699941, 1, 0.4156863, 0, 1,
-1.469161, 0.7345536, -0.8675061, 1, 0.4196078, 0, 1,
-1.467965, -0.3349613, -2.087049, 1, 0.427451, 0, 1,
-1.467905, 0.6121227, 0.1610704, 1, 0.4313726, 0, 1,
-1.45495, -0.9361485, -3.011824, 1, 0.4392157, 0, 1,
-1.438186, -1.084634, -1.323436, 1, 0.4431373, 0, 1,
-1.437147, 1.542722, -1.699628, 1, 0.4509804, 0, 1,
-1.432178, -1.452493, -1.728393, 1, 0.454902, 0, 1,
-1.401963, -0.06471232, -0.7331828, 1, 0.4627451, 0, 1,
-1.398767, 1.495268, 0.3879557, 1, 0.4666667, 0, 1,
-1.39719, -0.2508545, -2.058801, 1, 0.4745098, 0, 1,
-1.393722, -0.2676357, -1.602322, 1, 0.4784314, 0, 1,
-1.38733, 1.569373, 0.03523523, 1, 0.4862745, 0, 1,
-1.385426, 0.5875372, -0.8353099, 1, 0.4901961, 0, 1,
-1.375217, -0.2418537, -2.57489, 1, 0.4980392, 0, 1,
-1.355147, 2.074157, 0.1675078, 1, 0.5058824, 0, 1,
-1.351243, 0.4102006, -1.169945, 1, 0.509804, 0, 1,
-1.349606, -0.3802654, -1.509122, 1, 0.5176471, 0, 1,
-1.329445, 0.4108245, -1.046337, 1, 0.5215687, 0, 1,
-1.323853, -1.469122, -1.869649, 1, 0.5294118, 0, 1,
-1.31973, 1.656372, 0.3529581, 1, 0.5333334, 0, 1,
-1.288194, 0.8988885, -0.8495143, 1, 0.5411765, 0, 1,
-1.282396, -1.069513, -2.410059, 1, 0.5450981, 0, 1,
-1.276647, -0.05872935, -4.202077, 1, 0.5529412, 0, 1,
-1.266537, 0.1261172, -1.935109, 1, 0.5568628, 0, 1,
-1.265858, 0.7625595, -3.367841, 1, 0.5647059, 0, 1,
-1.264437, -2.314387, -2.773371, 1, 0.5686275, 0, 1,
-1.255204, 0.4703433, -1.121857, 1, 0.5764706, 0, 1,
-1.248798, -0.6960986, -1.723155, 1, 0.5803922, 0, 1,
-1.245906, 1.932794, 0.09714595, 1, 0.5882353, 0, 1,
-1.243486, 0.7657037, -0.6230136, 1, 0.5921569, 0, 1,
-1.235311, 1.033002, -1.813705, 1, 0.6, 0, 1,
-1.233957, 0.6308449, 0.6964434, 1, 0.6078432, 0, 1,
-1.224768, -1.076612, -3.183903, 1, 0.6117647, 0, 1,
-1.210985, 0.3934718, -0.833207, 1, 0.6196079, 0, 1,
-1.208032, 0.874371, -0.6163368, 1, 0.6235294, 0, 1,
-1.207573, 0.1798308, -1.45345, 1, 0.6313726, 0, 1,
-1.205239, -0.5378683, -1.367519, 1, 0.6352941, 0, 1,
-1.189136, 0.4595211, -1.503643, 1, 0.6431373, 0, 1,
-1.189075, -2.384569, -4.525248, 1, 0.6470588, 0, 1,
-1.188257, 0.361901, -0.5133489, 1, 0.654902, 0, 1,
-1.176441, -0.9138773, -2.105527, 1, 0.6588235, 0, 1,
-1.176278, -0.633226, -0.8321391, 1, 0.6666667, 0, 1,
-1.170359, 0.5932957, -1.289309, 1, 0.6705883, 0, 1,
-1.170202, 0.3025424, -3.613954, 1, 0.6784314, 0, 1,
-1.168224, 1.909289, -1.791201, 1, 0.682353, 0, 1,
-1.166486, 0.912289, -1.834869, 1, 0.6901961, 0, 1,
-1.165628, -0.4196081, -2.289339, 1, 0.6941177, 0, 1,
-1.156898, -1.098775, -3.287578, 1, 0.7019608, 0, 1,
-1.15649, -0.7891338, -2.036579, 1, 0.7098039, 0, 1,
-1.152383, 0.6267036, -1.552942, 1, 0.7137255, 0, 1,
-1.151043, -2.449311, -3.257525, 1, 0.7215686, 0, 1,
-1.150406, -0.2245442, -0.3021483, 1, 0.7254902, 0, 1,
-1.148109, 0.2099354, -1.171962, 1, 0.7333333, 0, 1,
-1.148078, -0.08562548, -1.231055, 1, 0.7372549, 0, 1,
-1.142418, 0.2096273, -3.042565, 1, 0.7450981, 0, 1,
-1.138883, -2.803669, -3.35854, 1, 0.7490196, 0, 1,
-1.138869, 0.5588961, -1.4356, 1, 0.7568628, 0, 1,
-1.13788, 0.2206665, -2.068347, 1, 0.7607843, 0, 1,
-1.13729, 1.007966, -2.171496, 1, 0.7686275, 0, 1,
-1.136533, 0.6884777, -1.63539, 1, 0.772549, 0, 1,
-1.133395, 1.609876, -0.4062867, 1, 0.7803922, 0, 1,
-1.131499, -0.06953479, -3.317705, 1, 0.7843137, 0, 1,
-1.127094, 2.475743, -1.342909, 1, 0.7921569, 0, 1,
-1.125982, 0.3172297, -1.78883, 1, 0.7960784, 0, 1,
-1.121574, 1.244234, 0.4491789, 1, 0.8039216, 0, 1,
-1.12049, -0.4700399, -0.7314287, 1, 0.8117647, 0, 1,
-1.116895, 0.08872726, 0.313588, 1, 0.8156863, 0, 1,
-1.109646, 0.9069608, 0.021493, 1, 0.8235294, 0, 1,
-1.107934, -2.388042, -2.393116, 1, 0.827451, 0, 1,
-1.101194, -1.35306, -2.995041, 1, 0.8352941, 0, 1,
-1.100507, -0.1590045, -1.452995, 1, 0.8392157, 0, 1,
-1.082874, -0.4045784, -3.539201, 1, 0.8470588, 0, 1,
-1.078403, 0.5979539, -0.9414026, 1, 0.8509804, 0, 1,
-1.073786, -0.5317581, -3.427461, 1, 0.8588235, 0, 1,
-1.067788, 2.135856, 0.9770731, 1, 0.8627451, 0, 1,
-1.059578, 0.9076371, -1.589409, 1, 0.8705882, 0, 1,
-1.050528, -1.619789, -3.922049, 1, 0.8745098, 0, 1,
-1.037098, 1.066662, 0.7610078, 1, 0.8823529, 0, 1,
-1.02607, 0.06789532, -0.4494231, 1, 0.8862745, 0, 1,
-1.024771, -0.5148068, -2.935014, 1, 0.8941177, 0, 1,
-1.008088, -0.309477, -2.227474, 1, 0.8980392, 0, 1,
-0.9907931, -0.3415196, -2.159082, 1, 0.9058824, 0, 1,
-0.9885843, -0.5164738, -2.083425, 1, 0.9137255, 0, 1,
-0.9880248, 0.9644528, -3.146223, 1, 0.9176471, 0, 1,
-0.9871905, -0.673632, -2.512582, 1, 0.9254902, 0, 1,
-0.9845178, -0.7176996, -2.898608, 1, 0.9294118, 0, 1,
-0.9703617, 0.4399519, -0.2224559, 1, 0.9372549, 0, 1,
-0.9689257, 0.08520858, -1.633463, 1, 0.9411765, 0, 1,
-0.9684696, -1.481127, -3.282362, 1, 0.9490196, 0, 1,
-0.966362, -0.193399, -2.824068, 1, 0.9529412, 0, 1,
-0.9654863, 0.1300009, 0.2107027, 1, 0.9607843, 0, 1,
-0.960743, -0.2385455, -1.503537, 1, 0.9647059, 0, 1,
-0.9587654, 0.5222773, -0.9210326, 1, 0.972549, 0, 1,
-0.9535376, -0.07619066, -3.418058, 1, 0.9764706, 0, 1,
-0.9513845, 1.916198, -3.019617, 1, 0.9843137, 0, 1,
-0.9399737, -0.7636638, -1.817845, 1, 0.9882353, 0, 1,
-0.9337195, 0.389117, -0.3121778, 1, 0.9960784, 0, 1,
-0.9229383, -0.5558345, -2.465823, 0.9960784, 1, 0, 1,
-0.9160774, -2.119772, -3.09477, 0.9921569, 1, 0, 1,
-0.9098155, 0.4450378, -3.227925, 0.9843137, 1, 0, 1,
-0.9091729, 1.559993, 0.6151087, 0.9803922, 1, 0, 1,
-0.9075555, 0.3571364, -0.4954423, 0.972549, 1, 0, 1,
-0.900367, -1.296476, -2.885923, 0.9686275, 1, 0, 1,
-0.8983567, 1.750749, -1.057301, 0.9607843, 1, 0, 1,
-0.8978789, -0.226108, -4.246166, 0.9568627, 1, 0, 1,
-0.8966305, -1.740935, -4.088881, 0.9490196, 1, 0, 1,
-0.892576, -0.8078668, -1.499017, 0.945098, 1, 0, 1,
-0.892183, -0.1535576, -0.7590375, 0.9372549, 1, 0, 1,
-0.8885463, -0.2149708, -1.320184, 0.9333333, 1, 0, 1,
-0.8880309, 0.5746595, -0.333862, 0.9254902, 1, 0, 1,
-0.88432, 0.0369124, -0.7166516, 0.9215686, 1, 0, 1,
-0.8807611, -1.029195, -3.145047, 0.9137255, 1, 0, 1,
-0.8597342, 0.03150877, -2.427141, 0.9098039, 1, 0, 1,
-0.8546634, -1.2676, -3.880528, 0.9019608, 1, 0, 1,
-0.8479454, 0.9519732, -1.743112, 0.8941177, 1, 0, 1,
-0.8478416, 0.8011046, -1.377034, 0.8901961, 1, 0, 1,
-0.8469942, -0.6202283, -3.045125, 0.8823529, 1, 0, 1,
-0.840516, -0.3319134, -2.037677, 0.8784314, 1, 0, 1,
-0.8403776, 0.5675132, -0.8623807, 0.8705882, 1, 0, 1,
-0.8363296, -0.4260523, -2.45064, 0.8666667, 1, 0, 1,
-0.8335923, 1.318303, -1.004998, 0.8588235, 1, 0, 1,
-0.8330244, 1.42899, 0.06355149, 0.854902, 1, 0, 1,
-0.8303593, -1.839641, -1.75731, 0.8470588, 1, 0, 1,
-0.8269829, -0.5369579, -2.814738, 0.8431373, 1, 0, 1,
-0.8265468, 1.715961, -0.5501684, 0.8352941, 1, 0, 1,
-0.8216729, 0.4413448, -0.3759356, 0.8313726, 1, 0, 1,
-0.8201053, -1.52213, -1.658517, 0.8235294, 1, 0, 1,
-0.8197787, 1.565445, -1.528303, 0.8196079, 1, 0, 1,
-0.8185462, 0.01512983, -2.112976, 0.8117647, 1, 0, 1,
-0.8182524, 1.083373, 1.100391, 0.8078431, 1, 0, 1,
-0.8153118, -1.300667, -1.540626, 0.8, 1, 0, 1,
-0.8099332, 0.1290229, -2.169884, 0.7921569, 1, 0, 1,
-0.8082586, -0.1449275, -2.139497, 0.7882353, 1, 0, 1,
-0.8010114, -0.625774, -2.848606, 0.7803922, 1, 0, 1,
-0.800531, 1.359962, 1.070094, 0.7764706, 1, 0, 1,
-0.7997835, 1.519221, 0.05273432, 0.7686275, 1, 0, 1,
-0.790691, -1.215976, -3.52444, 0.7647059, 1, 0, 1,
-0.7881534, -2.359837, -2.596484, 0.7568628, 1, 0, 1,
-0.78461, -0.09704223, -2.605019, 0.7529412, 1, 0, 1,
-0.7841784, 0.2946976, -1.8548, 0.7450981, 1, 0, 1,
-0.7819816, 0.6856946, -0.7533606, 0.7411765, 1, 0, 1,
-0.7734674, -1.163934, -0.8659908, 0.7333333, 1, 0, 1,
-0.7687567, 0.5963089, -0.1305083, 0.7294118, 1, 0, 1,
-0.7686331, -1.52784, -2.09995, 0.7215686, 1, 0, 1,
-0.7682558, -0.9822162, -2.285611, 0.7176471, 1, 0, 1,
-0.76283, 0.8917437, -0.816135, 0.7098039, 1, 0, 1,
-0.7498601, -0.8742315, -2.257053, 0.7058824, 1, 0, 1,
-0.7485328, -0.6957493, -3.242674, 0.6980392, 1, 0, 1,
-0.745845, -1.12139, -2.507917, 0.6901961, 1, 0, 1,
-0.7420186, 0.2361528, -0.5453717, 0.6862745, 1, 0, 1,
-0.740113, -0.6954675, -0.848513, 0.6784314, 1, 0, 1,
-0.7361189, -1.664762, -1.346321, 0.6745098, 1, 0, 1,
-0.730127, -0.4271502, -2.272257, 0.6666667, 1, 0, 1,
-0.7273999, 1.000054, 0.349897, 0.6627451, 1, 0, 1,
-0.7236553, -0.4952125, -3.69875, 0.654902, 1, 0, 1,
-0.7220119, -0.84974, -3.892112, 0.6509804, 1, 0, 1,
-0.7210517, -0.5076312, -1.991894, 0.6431373, 1, 0, 1,
-0.719066, 1.580004, 0.006269227, 0.6392157, 1, 0, 1,
-0.7176909, -0.430293, -1.675738, 0.6313726, 1, 0, 1,
-0.7152291, -0.1323817, -1.099773, 0.627451, 1, 0, 1,
-0.7126722, -0.6122063, -1.550211, 0.6196079, 1, 0, 1,
-0.7121819, 1.652504, -1.597127, 0.6156863, 1, 0, 1,
-0.7046527, 0.9047244, -1.147054, 0.6078432, 1, 0, 1,
-0.7027039, 0.361272, -2.117508, 0.6039216, 1, 0, 1,
-0.7000633, -0.6350291, -1.325448, 0.5960785, 1, 0, 1,
-0.6981163, -0.5345099, -1.879557, 0.5882353, 1, 0, 1,
-0.6921617, 0.1890817, -3.292078, 0.5843138, 1, 0, 1,
-0.6910222, 0.608, -2.085117, 0.5764706, 1, 0, 1,
-0.688064, -0.00876763, -1.664704, 0.572549, 1, 0, 1,
-0.6846183, -0.5453968, -2.927176, 0.5647059, 1, 0, 1,
-0.6845697, 0.358136, -0.02834119, 0.5607843, 1, 0, 1,
-0.6841484, -0.07708608, -2.763235, 0.5529412, 1, 0, 1,
-0.682083, -0.7388345, -1.877885, 0.5490196, 1, 0, 1,
-0.6814413, -0.3462842, -2.849949, 0.5411765, 1, 0, 1,
-0.6782186, -0.2038322, -1.76201, 0.5372549, 1, 0, 1,
-0.6778527, 1.274858, -0.7558833, 0.5294118, 1, 0, 1,
-0.677555, 0.751569, -2.159041, 0.5254902, 1, 0, 1,
-0.6738472, 1.646027, -0.530291, 0.5176471, 1, 0, 1,
-0.6657608, -0.2778423, -2.644789, 0.5137255, 1, 0, 1,
-0.6653563, 1.554625, -0.05924524, 0.5058824, 1, 0, 1,
-0.6610218, -1.523947, -1.886973, 0.5019608, 1, 0, 1,
-0.6556082, -0.2999673, -2.3371, 0.4941176, 1, 0, 1,
-0.6534314, -1.437048, -2.614887, 0.4862745, 1, 0, 1,
-0.6526083, 0.2128233, 0.6713325, 0.4823529, 1, 0, 1,
-0.6524047, 0.4880102, -1.093739, 0.4745098, 1, 0, 1,
-0.6487847, 1.642218, 1.063533, 0.4705882, 1, 0, 1,
-0.6447834, 0.2958904, -0.4776761, 0.4627451, 1, 0, 1,
-0.6384987, 0.292854, -0.1386691, 0.4588235, 1, 0, 1,
-0.6366028, 0.5198592, -3.236861, 0.4509804, 1, 0, 1,
-0.6355524, -0.3491281, -1.393137, 0.4470588, 1, 0, 1,
-0.6335235, -0.4711203, -3.197349, 0.4392157, 1, 0, 1,
-0.6333603, 0.2932118, -0.9804815, 0.4352941, 1, 0, 1,
-0.6289539, 0.9975685, 0.6120718, 0.427451, 1, 0, 1,
-0.628575, -0.1650316, -2.298762, 0.4235294, 1, 0, 1,
-0.6268664, 0.2290277, 0.4076268, 0.4156863, 1, 0, 1,
-0.6263103, 0.06061024, -1.787784, 0.4117647, 1, 0, 1,
-0.6253045, 0.4964267, -0.4508129, 0.4039216, 1, 0, 1,
-0.6153671, 0.01060028, -1.561718, 0.3960784, 1, 0, 1,
-0.6152709, -0.8806707, -1.550375, 0.3921569, 1, 0, 1,
-0.6135369, -0.1484674, -2.268173, 0.3843137, 1, 0, 1,
-0.6103619, -0.2059184, -2.363259, 0.3803922, 1, 0, 1,
-0.6093006, 1.269299, 0.3149231, 0.372549, 1, 0, 1,
-0.6084613, 0.8671491, -1.433114, 0.3686275, 1, 0, 1,
-0.6055629, 0.1370214, -0.8327925, 0.3607843, 1, 0, 1,
-0.604607, 0.8541512, -0.7775521, 0.3568628, 1, 0, 1,
-0.6019892, -1.649339, -3.075641, 0.3490196, 1, 0, 1,
-0.5991745, 0.3520514, -1.480004, 0.345098, 1, 0, 1,
-0.598599, -1.672826, -2.459416, 0.3372549, 1, 0, 1,
-0.5953568, -0.09412469, -1.183001, 0.3333333, 1, 0, 1,
-0.5931367, -0.3352632, -1.049526, 0.3254902, 1, 0, 1,
-0.585896, 0.9319131, 1.065966, 0.3215686, 1, 0, 1,
-0.5850957, -1.023233, -3.131986, 0.3137255, 1, 0, 1,
-0.5845578, 1.766194, -0.07433201, 0.3098039, 1, 0, 1,
-0.5822539, 0.09892096, -1.993997, 0.3019608, 1, 0, 1,
-0.5803401, -0.9477196, -5.161811, 0.2941177, 1, 0, 1,
-0.5798711, 0.6435797, 0.05074083, 0.2901961, 1, 0, 1,
-0.579453, 2.353997, -0.1899956, 0.282353, 1, 0, 1,
-0.5769126, 0.05967748, -2.041689, 0.2784314, 1, 0, 1,
-0.5742952, 0.05456791, -1.848287, 0.2705882, 1, 0, 1,
-0.5666926, 0.2068622, -1.237374, 0.2666667, 1, 0, 1,
-0.5643405, -0.09515008, -1.829765, 0.2588235, 1, 0, 1,
-0.5628271, 0.6563503, -2.071267, 0.254902, 1, 0, 1,
-0.5613083, 0.6013906, -1.431003, 0.2470588, 1, 0, 1,
-0.5600207, 0.4395297, -0.1540668, 0.2431373, 1, 0, 1,
-0.5596123, 1.587273, -0.6399578, 0.2352941, 1, 0, 1,
-0.555322, 0.1534942, 0.250957, 0.2313726, 1, 0, 1,
-0.5536497, -0.7962347, -1.71489, 0.2235294, 1, 0, 1,
-0.548398, -0.1979035, -1.862304, 0.2196078, 1, 0, 1,
-0.546789, -0.5339996, -0.7848841, 0.2117647, 1, 0, 1,
-0.5404406, -1.776836, -1.61757, 0.2078431, 1, 0, 1,
-0.5401211, -1.199117, -2.799413, 0.2, 1, 0, 1,
-0.5358766, -1.900844, -2.408511, 0.1921569, 1, 0, 1,
-0.5354596, 1.315692, 0.1390493, 0.1882353, 1, 0, 1,
-0.5338953, -0.281106, -2.140531, 0.1803922, 1, 0, 1,
-0.5256495, 0.948885, -0.9410958, 0.1764706, 1, 0, 1,
-0.5229784, -0.4693352, -1.827598, 0.1686275, 1, 0, 1,
-0.5224956, 0.613184, -2.293165, 0.1647059, 1, 0, 1,
-0.5205216, -0.3748408, -2.137048, 0.1568628, 1, 0, 1,
-0.5176845, 0.9363049, -0.03389699, 0.1529412, 1, 0, 1,
-0.5158002, 0.6261861, -1.971917, 0.145098, 1, 0, 1,
-0.5108805, 0.6566588, -1.022229, 0.1411765, 1, 0, 1,
-0.5102156, -0.5492986, -2.183235, 0.1333333, 1, 0, 1,
-0.5101569, -1.022272, -2.4587, 0.1294118, 1, 0, 1,
-0.5074961, -0.8619394, -3.483902, 0.1215686, 1, 0, 1,
-0.5040506, 1.965128, -2.485068, 0.1176471, 1, 0, 1,
-0.5040349, -0.1346305, -2.422012, 0.1098039, 1, 0, 1,
-0.5028628, 0.6329444, -0.9047998, 0.1058824, 1, 0, 1,
-0.4984308, -1.914759, -1.577082, 0.09803922, 1, 0, 1,
-0.4949605, 1.688805, -0.830925, 0.09019608, 1, 0, 1,
-0.4858077, 0.109089, -1.930576, 0.08627451, 1, 0, 1,
-0.4761396, -0.7263694, -1.947166, 0.07843138, 1, 0, 1,
-0.4759064, -0.301966, -2.292905, 0.07450981, 1, 0, 1,
-0.4744841, -0.2925674, -1.635179, 0.06666667, 1, 0, 1,
-0.472598, 0.01631767, -3.746504, 0.0627451, 1, 0, 1,
-0.4695435, 0.5493492, 0.3547777, 0.05490196, 1, 0, 1,
-0.467437, -0.287432, -1.905201, 0.05098039, 1, 0, 1,
-0.4638382, -0.8278342, -4.311959, 0.04313726, 1, 0, 1,
-0.4588089, 0.7275351, 1.32817, 0.03921569, 1, 0, 1,
-0.4581411, -0.3890984, -1.13589, 0.03137255, 1, 0, 1,
-0.4550785, -0.237033, -2.404315, 0.02745098, 1, 0, 1,
-0.4492883, 0.7127234, -1.497478, 0.01960784, 1, 0, 1,
-0.4426349, 0.4698015, -0.5535939, 0.01568628, 1, 0, 1,
-0.4314432, 1.240901, 0.5062144, 0.007843138, 1, 0, 1,
-0.4299855, 1.01171, -0.04445436, 0.003921569, 1, 0, 1,
-0.425764, 2.176533, -0.4802076, 0, 1, 0.003921569, 1,
-0.4233741, 0.9529399, -1.470656, 0, 1, 0.01176471, 1,
-0.4230733, -0.3301031, -2.761229, 0, 1, 0.01568628, 1,
-0.4187882, -2.199749, -2.899517, 0, 1, 0.02352941, 1,
-0.4185071, -0.7174909, -2.977166, 0, 1, 0.02745098, 1,
-0.4165107, 0.6680598, -1.088784, 0, 1, 0.03529412, 1,
-0.4161622, -0.7962831, -3.553583, 0, 1, 0.03921569, 1,
-0.4153632, -0.09975475, -2.382587, 0, 1, 0.04705882, 1,
-0.414144, -0.6924434, -2.467221, 0, 1, 0.05098039, 1,
-0.4117703, -0.5669278, -3.968482, 0, 1, 0.05882353, 1,
-0.4048809, 2.015616, 0.6410704, 0, 1, 0.0627451, 1,
-0.3989315, 0.3414186, -0.8951322, 0, 1, 0.07058824, 1,
-0.3975384, -1.045733, -4.404439, 0, 1, 0.07450981, 1,
-0.3935663, 0.1990936, -0.3041876, 0, 1, 0.08235294, 1,
-0.3933108, 1.209613, 1.056528, 0, 1, 0.08627451, 1,
-0.3924062, 0.6041679, -0.7319137, 0, 1, 0.09411765, 1,
-0.386106, -0.5727183, -2.002457, 0, 1, 0.1019608, 1,
-0.3840803, 0.5772755, -1.189178, 0, 1, 0.1058824, 1,
-0.3798667, 0.7592577, 0.700598, 0, 1, 0.1137255, 1,
-0.378634, -2.483886, -2.648019, 0, 1, 0.1176471, 1,
-0.3754193, 0.7658423, -1.251799, 0, 1, 0.1254902, 1,
-0.3716205, 0.8632942, -0.8864945, 0, 1, 0.1294118, 1,
-0.3707239, 0.5953346, -0.8113377, 0, 1, 0.1372549, 1,
-0.36603, 0.5960255, -1.759125, 0, 1, 0.1411765, 1,
-0.3651385, 0.7458814, -0.6845405, 0, 1, 0.1490196, 1,
-0.3647422, 0.3569008, 1.787096, 0, 1, 0.1529412, 1,
-0.3618596, 0.4183872, -1.796899, 0, 1, 0.1607843, 1,
-0.3608715, -1.221198, -3.821635, 0, 1, 0.1647059, 1,
-0.3601249, 0.2251822, -1.423101, 0, 1, 0.172549, 1,
-0.3565454, 0.7377432, -0.5755599, 0, 1, 0.1764706, 1,
-0.3542233, -1.144623, -2.707536, 0, 1, 0.1843137, 1,
-0.3468928, -0.9586788, -2.836928, 0, 1, 0.1882353, 1,
-0.3446229, -0.3792713, -2.364632, 0, 1, 0.1960784, 1,
-0.3403241, -0.3680689, -1.659916, 0, 1, 0.2039216, 1,
-0.3394097, -0.76285, -2.087399, 0, 1, 0.2078431, 1,
-0.3342289, 1.822398, -0.2961535, 0, 1, 0.2156863, 1,
-0.3325495, -0.2535173, -2.333713, 0, 1, 0.2196078, 1,
-0.3263638, -0.2378368, -3.378452, 0, 1, 0.227451, 1,
-0.326068, -0.05928233, -2.945477, 0, 1, 0.2313726, 1,
-0.3249447, 0.3226862, -0.4613725, 0, 1, 0.2392157, 1,
-0.3198986, 1.718857, -1.614905, 0, 1, 0.2431373, 1,
-0.3192917, -0.4344896, -2.373512, 0, 1, 0.2509804, 1,
-0.3150538, -1.905044, -2.278602, 0, 1, 0.254902, 1,
-0.3127273, -2.501182, -3.752858, 0, 1, 0.2627451, 1,
-0.3116759, -0.1790529, -0.7033015, 0, 1, 0.2666667, 1,
-0.302534, 1.65616, -0.8400946, 0, 1, 0.2745098, 1,
-0.3006635, 0.5471819, -0.5580462, 0, 1, 0.2784314, 1,
-0.3005973, 0.8191663, -2.057009, 0, 1, 0.2862745, 1,
-0.3005511, 0.8230605, 0.7744445, 0, 1, 0.2901961, 1,
-0.2977594, 0.09051936, -1.597985, 0, 1, 0.2980392, 1,
-0.2974308, -1.655971, -3.766593, 0, 1, 0.3058824, 1,
-0.2968015, -0.08986655, -3.834324, 0, 1, 0.3098039, 1,
-0.2914202, 0.7997312, -0.4361911, 0, 1, 0.3176471, 1,
-0.2897562, 1.318797, -1.204346, 0, 1, 0.3215686, 1,
-0.2897509, -1.181527, -2.180594, 0, 1, 0.3294118, 1,
-0.2894414, -0.6635996, -0.7821601, 0, 1, 0.3333333, 1,
-0.2859871, 0.9815195, 0.1869516, 0, 1, 0.3411765, 1,
-0.2848235, -0.3063917, -2.230726, 0, 1, 0.345098, 1,
-0.2826307, -2.56622, -2.223259, 0, 1, 0.3529412, 1,
-0.2724887, -0.1335535, -1.508079, 0, 1, 0.3568628, 1,
-0.2652268, -0.3410118, -2.751601, 0, 1, 0.3647059, 1,
-0.2627746, -0.01127361, -2.727065, 0, 1, 0.3686275, 1,
-0.2617705, -1.037476, -2.004328, 0, 1, 0.3764706, 1,
-0.2582701, 1.995336, 0.09474641, 0, 1, 0.3803922, 1,
-0.2576842, -1.183524, -1.944399, 0, 1, 0.3882353, 1,
-0.2559071, 0.3922261, -1.216233, 0, 1, 0.3921569, 1,
-0.2551332, -0.3005081, -3.962749, 0, 1, 0.4, 1,
-0.2533675, 1.594633, -0.3932786, 0, 1, 0.4078431, 1,
-0.2523111, -0.08470725, -1.461539, 0, 1, 0.4117647, 1,
-0.2518909, -1.897191, -3.995076, 0, 1, 0.4196078, 1,
-0.2510839, 0.7616803, 1.339222, 0, 1, 0.4235294, 1,
-0.2494924, -0.9125972, -2.904289, 0, 1, 0.4313726, 1,
-0.2436672, 0.1369024, -0.8168989, 0, 1, 0.4352941, 1,
-0.2417462, 0.4272433, -1.889873, 0, 1, 0.4431373, 1,
-0.2326386, 1.067164, 1.79441, 0, 1, 0.4470588, 1,
-0.2319682, -0.7760024, -3.609129, 0, 1, 0.454902, 1,
-0.230479, 0.3882027, -1.075055, 0, 1, 0.4588235, 1,
-0.2303449, -0.1172092, -2.624943, 0, 1, 0.4666667, 1,
-0.2261603, -0.5202906, -0.1555869, 0, 1, 0.4705882, 1,
-0.224929, 0.6956246, -0.8700718, 0, 1, 0.4784314, 1,
-0.2235371, 0.5708454, -0.1375854, 0, 1, 0.4823529, 1,
-0.2212178, 1.357295, -0.8767954, 0, 1, 0.4901961, 1,
-0.2145045, -1.454248, -3.883689, 0, 1, 0.4941176, 1,
-0.2137231, 1.733607, -0.4137799, 0, 1, 0.5019608, 1,
-0.2114954, 0.6667469, 0.2464826, 0, 1, 0.509804, 1,
-0.2108212, -0.8733487, -2.942744, 0, 1, 0.5137255, 1,
-0.2036033, -0.244543, -3.570254, 0, 1, 0.5215687, 1,
-0.2032733, -1.787887, -3.680697, 0, 1, 0.5254902, 1,
-0.198779, 0.7212227, -0.6565413, 0, 1, 0.5333334, 1,
-0.1960336, -0.06723041, -2.544972, 0, 1, 0.5372549, 1,
-0.19184, 0.1542243, -2.509463, 0, 1, 0.5450981, 1,
-0.1909486, 0.890697, -1.471678, 0, 1, 0.5490196, 1,
-0.1903132, -0.2428183, -2.489119, 0, 1, 0.5568628, 1,
-0.1901458, 1.860558, -0.1317051, 0, 1, 0.5607843, 1,
-0.1896369, -1.479783, -4.177314, 0, 1, 0.5686275, 1,
-0.1893371, -0.2788812, -2.206809, 0, 1, 0.572549, 1,
-0.1883061, -2.918598, -1.539059, 0, 1, 0.5803922, 1,
-0.1875903, -0.9775138, -2.865156, 0, 1, 0.5843138, 1,
-0.1860763, 0.4022427, 0.005381764, 0, 1, 0.5921569, 1,
-0.1834638, 0.3023943, -1.821159, 0, 1, 0.5960785, 1,
-0.1794501, -1.137808, -1.495412, 0, 1, 0.6039216, 1,
-0.1758077, -0.197924, -5.35409, 0, 1, 0.6117647, 1,
-0.174336, -0.3071818, -2.237745, 0, 1, 0.6156863, 1,
-0.1740686, 1.342196, -1.474405, 0, 1, 0.6235294, 1,
-0.1726952, 2.74927, -0.2383105, 0, 1, 0.627451, 1,
-0.1682431, 0.3472395, -0.1086564, 0, 1, 0.6352941, 1,
-0.165403, 1.217786, -1.104868, 0, 1, 0.6392157, 1,
-0.1615243, 0.0509281, -0.5570269, 0, 1, 0.6470588, 1,
-0.1597217, 1.612199, 0.8053792, 0, 1, 0.6509804, 1,
-0.1594069, 1.632031, 0.3013232, 0, 1, 0.6588235, 1,
-0.1491071, 1.081442, 1.863557, 0, 1, 0.6627451, 1,
-0.1467435, -0.1587729, -1.728146, 0, 1, 0.6705883, 1,
-0.141895, 1.416906, 3.600044, 0, 1, 0.6745098, 1,
-0.1359077, 1.142874, -1.329567, 0, 1, 0.682353, 1,
-0.1347631, 0.379064, 0.44762, 0, 1, 0.6862745, 1,
-0.1314552, 1.232839, 0.09491207, 0, 1, 0.6941177, 1,
-0.1299025, 0.7782413, 0.02266004, 0, 1, 0.7019608, 1,
-0.124249, -0.259506, -3.94636, 0, 1, 0.7058824, 1,
-0.1211716, 0.3120766, 1.548626, 0, 1, 0.7137255, 1,
-0.1210694, 0.3310231, -1.191144, 0, 1, 0.7176471, 1,
-0.1166521, -1.946019, -3.814802, 0, 1, 0.7254902, 1,
-0.1148054, -0.6349573, -1.779767, 0, 1, 0.7294118, 1,
-0.1131834, 0.7097288, 0.6939514, 0, 1, 0.7372549, 1,
-0.1115724, -1.482135, -3.579591, 0, 1, 0.7411765, 1,
-0.1099973, -1.5192, -3.950819, 0, 1, 0.7490196, 1,
-0.1075928, -0.01177426, -3.601673, 0, 1, 0.7529412, 1,
-0.1063659, -0.9786442, -3.569241, 0, 1, 0.7607843, 1,
-0.1063204, 0.432727, -0.3313994, 0, 1, 0.7647059, 1,
-0.1060583, -1.55465, -2.918605, 0, 1, 0.772549, 1,
-0.1029853, 1.490288, -1.610754, 0, 1, 0.7764706, 1,
-0.1026838, -1.950528, -2.661021, 0, 1, 0.7843137, 1,
-0.09809745, -0.4760878, -2.128906, 0, 1, 0.7882353, 1,
-0.09337393, -0.5656161, -2.429454, 0, 1, 0.7960784, 1,
-0.09151525, 1.18314, -0.6195031, 0, 1, 0.8039216, 1,
-0.08840818, 0.6954747, 0.09122156, 0, 1, 0.8078431, 1,
-0.08481443, 0.7203653, -0.1865757, 0, 1, 0.8156863, 1,
-0.08009538, -0.8109435, -3.154721, 0, 1, 0.8196079, 1,
-0.0794219, 1.034, 0.9179513, 0, 1, 0.827451, 1,
-0.07595631, -0.1304977, -2.983637, 0, 1, 0.8313726, 1,
-0.07557627, 0.7548635, 2.118648, 0, 1, 0.8392157, 1,
-0.07442344, 0.2761421, 0.2961508, 0, 1, 0.8431373, 1,
-0.07322364, 1.106071, 0.4807748, 0, 1, 0.8509804, 1,
-0.07138228, 1.136867, -1.036664, 0, 1, 0.854902, 1,
-0.06619301, -0.9265174, -2.324377, 0, 1, 0.8627451, 1,
-0.06427508, -0.09425346, -2.130837, 0, 1, 0.8666667, 1,
-0.06115583, -0.06389517, -0.7982508, 0, 1, 0.8745098, 1,
-0.05803564, 0.5798239, -0.6519314, 0, 1, 0.8784314, 1,
-0.05670676, 0.7466376, 0.5907692, 0, 1, 0.8862745, 1,
-0.05443202, 0.3670371, -1.581451, 0, 1, 0.8901961, 1,
-0.04888835, -0.4201319, -3.794811, 0, 1, 0.8980392, 1,
-0.04809162, 0.8320567, 0.07303299, 0, 1, 0.9058824, 1,
-0.04546059, -2.352095, -5.173084, 0, 1, 0.9098039, 1,
-0.04381665, -0.2988298, -2.297827, 0, 1, 0.9176471, 1,
-0.0432483, -0.5506663, -2.406842, 0, 1, 0.9215686, 1,
-0.03512344, -1.654194, -3.559643, 0, 1, 0.9294118, 1,
-0.03433263, -0.5680928, -4.692389, 0, 1, 0.9333333, 1,
-0.03099517, -0.5746439, -2.518167, 0, 1, 0.9411765, 1,
-0.03095459, 0.1115453, -1.953904, 0, 1, 0.945098, 1,
-0.03001897, -0.6882616, -2.518755, 0, 1, 0.9529412, 1,
-0.0235181, -1.156971, -4.644126, 0, 1, 0.9568627, 1,
-0.02167766, -0.557465, -3.87107, 0, 1, 0.9647059, 1,
-0.0155155, -0.3529313, -3.913172, 0, 1, 0.9686275, 1,
-0.01056611, -0.6741483, -2.160488, 0, 1, 0.9764706, 1,
-0.00751397, 1.441365, -0.6771119, 0, 1, 0.9803922, 1,
-0.006694177, -1.082598, -2.701742, 0, 1, 0.9882353, 1,
-0.0006086462, 0.7160398, 1.610469, 0, 1, 0.9921569, 1,
0.00535807, 0.3946258, 0.4621906, 0, 1, 1, 1,
0.005663788, 3.245082, -0.4002288, 0, 0.9921569, 1, 1,
0.01021307, 0.6146926, -0.6846712, 0, 0.9882353, 1, 1,
0.01245862, 0.4459798, -0.09431183, 0, 0.9803922, 1, 1,
0.01277675, 0.4498344, 0.2890067, 0, 0.9764706, 1, 1,
0.0135149, -0.3145705, 2.424628, 0, 0.9686275, 1, 1,
0.01447258, 0.6500943, 0.3519737, 0, 0.9647059, 1, 1,
0.01706409, -0.3251659, 2.0681, 0, 0.9568627, 1, 1,
0.02193765, 0.6326727, -1.931648, 0, 0.9529412, 1, 1,
0.02913223, -0.06469512, 1.272335, 0, 0.945098, 1, 1,
0.03094143, -0.1906022, 2.645573, 0, 0.9411765, 1, 1,
0.0346083, -1.062058, 4.675477, 0, 0.9333333, 1, 1,
0.03516623, 0.8818814, 1.608595, 0, 0.9294118, 1, 1,
0.03705921, -0.2025157, 1.961548, 0, 0.9215686, 1, 1,
0.03779219, 1.832806, 0.2710855, 0, 0.9176471, 1, 1,
0.04139179, 0.1734523, 0.114251, 0, 0.9098039, 1, 1,
0.04273243, -1.513595, 2.887059, 0, 0.9058824, 1, 1,
0.04339617, 0.2172704, -1.294132, 0, 0.8980392, 1, 1,
0.05002852, 0.2824616, -0.6286115, 0, 0.8901961, 1, 1,
0.050752, -1.056953, 2.209069, 0, 0.8862745, 1, 1,
0.05453308, -0.3845113, 2.172243, 0, 0.8784314, 1, 1,
0.05615783, -0.5183539, 2.930176, 0, 0.8745098, 1, 1,
0.05788456, -1.617426, 3.857823, 0, 0.8666667, 1, 1,
0.05887443, -0.6483626, 1.590237, 0, 0.8627451, 1, 1,
0.0596083, -0.3984548, 3.752345, 0, 0.854902, 1, 1,
0.06024396, 1.201658, -0.5959069, 0, 0.8509804, 1, 1,
0.06083986, -0.5129236, 2.148894, 0, 0.8431373, 1, 1,
0.06106398, 0.1334852, 2.088428, 0, 0.8392157, 1, 1,
0.06136385, 0.08995908, 0.9438546, 0, 0.8313726, 1, 1,
0.06787647, -1.163855, 3.867596, 0, 0.827451, 1, 1,
0.06867953, 0.05585307, 0.0940927, 0, 0.8196079, 1, 1,
0.06970776, 0.3973499, 0.8940212, 0, 0.8156863, 1, 1,
0.07206736, -1.031813, 3.480892, 0, 0.8078431, 1, 1,
0.07407933, 0.7110361, -0.4608958, 0, 0.8039216, 1, 1,
0.07866456, 1.207789, -1.230532, 0, 0.7960784, 1, 1,
0.08352407, 1.463757, 0.5561935, 0, 0.7882353, 1, 1,
0.08764532, -1.204137, 3.021081, 0, 0.7843137, 1, 1,
0.08778471, -2.444424, 4.816434, 0, 0.7764706, 1, 1,
0.0884102, 0.2226446, 1.987454, 0, 0.772549, 1, 1,
0.09028617, -0.09001769, 3.571683, 0, 0.7647059, 1, 1,
0.09046718, -0.1500362, 2.467991, 0, 0.7607843, 1, 1,
0.09073962, 0.9844694, 0.4153285, 0, 0.7529412, 1, 1,
0.09637582, 1.417044, 2.148104, 0, 0.7490196, 1, 1,
0.09727275, 1.071031, -0.1244703, 0, 0.7411765, 1, 1,
0.09954348, -0.2917301, 2.893052, 0, 0.7372549, 1, 1,
0.1024668, 1.456453, -0.490049, 0, 0.7294118, 1, 1,
0.1028937, 2.257475, -0.5371867, 0, 0.7254902, 1, 1,
0.1052945, 0.4829054, 1.204442, 0, 0.7176471, 1, 1,
0.1089301, 1.412121, 0.01500119, 0, 0.7137255, 1, 1,
0.1197974, 0.4945094, 0.7119824, 0, 0.7058824, 1, 1,
0.1219069, 0.3185447, 0.7551025, 0, 0.6980392, 1, 1,
0.1227598, 1.097242, -1.33757, 0, 0.6941177, 1, 1,
0.1354605, 0.3408177, -0.5531917, 0, 0.6862745, 1, 1,
0.1361067, -1.306494, 5.628888, 0, 0.682353, 1, 1,
0.143788, -2.006874, 1.851016, 0, 0.6745098, 1, 1,
0.1474524, -0.4834834, 3.039464, 0, 0.6705883, 1, 1,
0.1477991, -0.6483901, 1.776629, 0, 0.6627451, 1, 1,
0.1522459, 0.4420241, -0.8269984, 0, 0.6588235, 1, 1,
0.1546501, 0.2375944, 0.1689683, 0, 0.6509804, 1, 1,
0.1624536, 1.374516, 0.07698531, 0, 0.6470588, 1, 1,
0.162495, 1.195737, 0.4383402, 0, 0.6392157, 1, 1,
0.1625404, 0.9994602, 1.710369, 0, 0.6352941, 1, 1,
0.1641714, -1.307067, 2.53652, 0, 0.627451, 1, 1,
0.1647356, -0.8040695, 2.128363, 0, 0.6235294, 1, 1,
0.1649295, -0.3724617, 3.684354, 0, 0.6156863, 1, 1,
0.1650444, 0.02996436, 2.578714, 0, 0.6117647, 1, 1,
0.1675112, -0.7281106, 1.342465, 0, 0.6039216, 1, 1,
0.1675346, 1.237106, 0.2844721, 0, 0.5960785, 1, 1,
0.1679904, 0.9702076, -1.181014, 0, 0.5921569, 1, 1,
0.1682971, -0.8018101, 2.331781, 0, 0.5843138, 1, 1,
0.1690717, 1.375688, 0.3827241, 0, 0.5803922, 1, 1,
0.1701433, 0.2686697, 1.366452, 0, 0.572549, 1, 1,
0.1728383, 1.095505, 1.62921, 0, 0.5686275, 1, 1,
0.190333, 1.693067, 0.6993855, 0, 0.5607843, 1, 1,
0.1919514, 0.4034426, 0.6773218, 0, 0.5568628, 1, 1,
0.1926271, 0.8798816, -0.05564314, 0, 0.5490196, 1, 1,
0.1951554, -0.7534276, 2.372917, 0, 0.5450981, 1, 1,
0.1982134, -1.252287, 1.717868, 0, 0.5372549, 1, 1,
0.2027579, -0.5973269, 4.336888, 0, 0.5333334, 1, 1,
0.204647, 1.50583, -1.986844, 0, 0.5254902, 1, 1,
0.2054134, 1.162371, 0.7672917, 0, 0.5215687, 1, 1,
0.2071764, -1.166807, 2.244214, 0, 0.5137255, 1, 1,
0.2077211, -0.763418, 1.780827, 0, 0.509804, 1, 1,
0.208485, 0.3235832, 1.652223, 0, 0.5019608, 1, 1,
0.2095439, 1.35587, -0.9295508, 0, 0.4941176, 1, 1,
0.2103032, 1.173974, 0.328495, 0, 0.4901961, 1, 1,
0.2110822, 1.46718, 0.2384294, 0, 0.4823529, 1, 1,
0.2116045, -0.4624532, 0.4167583, 0, 0.4784314, 1, 1,
0.2122235, 0.4999678, 0.8297361, 0, 0.4705882, 1, 1,
0.2171081, -0.7995762, 0.4927469, 0, 0.4666667, 1, 1,
0.2187432, -0.9752308, 3.10894, 0, 0.4588235, 1, 1,
0.2221763, -1.085514, 4.13268, 0, 0.454902, 1, 1,
0.222357, -0.463382, 1.745815, 0, 0.4470588, 1, 1,
0.226563, 0.8753158, 1.357783, 0, 0.4431373, 1, 1,
0.2283078, 0.7539094, -0.504243, 0, 0.4352941, 1, 1,
0.2294866, 0.3140553, 1.408342, 0, 0.4313726, 1, 1,
0.2305465, -0.5110812, 1.870223, 0, 0.4235294, 1, 1,
0.2309653, -1.537047, 2.198679, 0, 0.4196078, 1, 1,
0.2406262, 0.2074988, 2.695982, 0, 0.4117647, 1, 1,
0.2453824, -0.4129843, 1.927813, 0, 0.4078431, 1, 1,
0.2467171, -0.00717557, 2.296037, 0, 0.4, 1, 1,
0.2469793, 0.4544866, -0.5864581, 0, 0.3921569, 1, 1,
0.2513833, -0.225915, 1.811975, 0, 0.3882353, 1, 1,
0.2530416, -1.118676, 2.71102, 0, 0.3803922, 1, 1,
0.2555149, 1.32495, 1.533491, 0, 0.3764706, 1, 1,
0.2558354, -0.3098532, 2.041657, 0, 0.3686275, 1, 1,
0.2655345, 0.04554453, 0.5022008, 0, 0.3647059, 1, 1,
0.2659156, 0.8661309, 1.490237, 0, 0.3568628, 1, 1,
0.2699645, -1.886607, 4.005559, 0, 0.3529412, 1, 1,
0.2707829, 1.75637, 2.114743, 0, 0.345098, 1, 1,
0.2799276, -0.2132431, 2.846323, 0, 0.3411765, 1, 1,
0.2812485, 1.065735, 1.326829, 0, 0.3333333, 1, 1,
0.2890826, -1.813877, 3.280576, 0, 0.3294118, 1, 1,
0.3025091, -0.1750903, 0.7611676, 0, 0.3215686, 1, 1,
0.315116, -0.2217526, 2.034804, 0, 0.3176471, 1, 1,
0.3168529, 0.05284054, 1.558499, 0, 0.3098039, 1, 1,
0.317511, -1.010358, 1.470568, 0, 0.3058824, 1, 1,
0.319193, 1.135762, 1.630491, 0, 0.2980392, 1, 1,
0.3198723, 0.8809084, 0.8890743, 0, 0.2901961, 1, 1,
0.320052, 1.064779, 0.5292011, 0, 0.2862745, 1, 1,
0.321377, 1.26764, 2.01917, 0, 0.2784314, 1, 1,
0.3245986, 0.5444084, 2.86028, 0, 0.2745098, 1, 1,
0.3261144, 1.308773, 0.6584883, 0, 0.2666667, 1, 1,
0.3279247, -0.7569104, 1.105158, 0, 0.2627451, 1, 1,
0.3294546, 0.374982, 1.16902, 0, 0.254902, 1, 1,
0.3338617, -0.131649, 2.73913, 0, 0.2509804, 1, 1,
0.3348322, 0.3913293, 1.791324, 0, 0.2431373, 1, 1,
0.3355509, 0.360063, 0.08560048, 0, 0.2392157, 1, 1,
0.3361513, -0.7678303, 2.1447, 0, 0.2313726, 1, 1,
0.340114, 0.3603003, 0.2226719, 0, 0.227451, 1, 1,
0.3416401, -1.935391, 1.027082, 0, 0.2196078, 1, 1,
0.3439448, 2.177734, -0.5957462, 0, 0.2156863, 1, 1,
0.3443241, -1.015923, 2.773759, 0, 0.2078431, 1, 1,
0.3456532, 0.8764652, 1.876833, 0, 0.2039216, 1, 1,
0.3466373, -1.151388, 1.185959, 0, 0.1960784, 1, 1,
0.3469441, -0.7279558, 3.140023, 0, 0.1882353, 1, 1,
0.3480965, 0.2045498, -1.486054, 0, 0.1843137, 1, 1,
0.3484246, 0.7166275, 2.633245, 0, 0.1764706, 1, 1,
0.3552564, -0.8045863, 2.575997, 0, 0.172549, 1, 1,
0.360797, -0.841618, 3.333103, 0, 0.1647059, 1, 1,
0.361584, -0.2014042, 2.367172, 0, 0.1607843, 1, 1,
0.3677179, 0.1168929, 0.4088867, 0, 0.1529412, 1, 1,
0.3727446, 0.1286192, -1.215525, 0, 0.1490196, 1, 1,
0.3735703, 0.6498796, 1.594979, 0, 0.1411765, 1, 1,
0.3764623, 1.001717, -0.02687006, 0, 0.1372549, 1, 1,
0.3810034, 0.327171, -0.8090885, 0, 0.1294118, 1, 1,
0.3819166, 1.412431, -0.3937342, 0, 0.1254902, 1, 1,
0.3878356, -1.600997, 2.913135, 0, 0.1176471, 1, 1,
0.3929862, -0.01514217, 2.283769, 0, 0.1137255, 1, 1,
0.3953978, -0.7833935, 2.686413, 0, 0.1058824, 1, 1,
0.3955244, -0.4632274, 1.944867, 0, 0.09803922, 1, 1,
0.4047003, 1.126957, 0.9131221, 0, 0.09411765, 1, 1,
0.4050682, -0.3477207, -0.00386875, 0, 0.08627451, 1, 1,
0.4089589, -4.757092, 3.538583, 0, 0.08235294, 1, 1,
0.417991, -0.9093733, 4.559452, 0, 0.07450981, 1, 1,
0.4207832, 0.7320151, -0.7087335, 0, 0.07058824, 1, 1,
0.4224409, -0.9406771, 4.133471, 0, 0.0627451, 1, 1,
0.4272327, 0.962936, 0.3038288, 0, 0.05882353, 1, 1,
0.4273126, -0.2796036, 1.57574, 0, 0.05098039, 1, 1,
0.4317597, 0.5630804, 1.485489, 0, 0.04705882, 1, 1,
0.4327253, -1.258846, 1.753878, 0, 0.03921569, 1, 1,
0.4386215, -0.3714008, 2.857843, 0, 0.03529412, 1, 1,
0.439508, -0.2636414, 2.559795, 0, 0.02745098, 1, 1,
0.4491342, -0.9356089, 1.609666, 0, 0.02352941, 1, 1,
0.449543, 1.928062, -0.2701837, 0, 0.01568628, 1, 1,
0.4507779, -2.143926, 3.747083, 0, 0.01176471, 1, 1,
0.4533277, 0.2467885, 3.403058, 0, 0.003921569, 1, 1,
0.4626457, 0.7979893, 0.3134295, 0.003921569, 0, 1, 1,
0.4645792, 0.03427208, 1.826459, 0.007843138, 0, 1, 1,
0.4658431, -0.5344672, 6.050144, 0.01568628, 0, 1, 1,
0.4681247, -0.3209293, 1.578635, 0.01960784, 0, 1, 1,
0.4692471, -0.5057788, 2.29195, 0.02745098, 0, 1, 1,
0.469802, -1.131932, 2.868079, 0.03137255, 0, 1, 1,
0.4726065, 1.007065, 0.2071891, 0.03921569, 0, 1, 1,
0.4754833, -0.8040475, 1.591311, 0.04313726, 0, 1, 1,
0.4830756, 1.434813, 0.3446332, 0.05098039, 0, 1, 1,
0.4832286, 0.8302969, 1.581345, 0.05490196, 0, 1, 1,
0.4859982, 0.9371957, 1.035307, 0.0627451, 0, 1, 1,
0.4875949, -1.124686, 3.30051, 0.06666667, 0, 1, 1,
0.4895996, 0.2737552, 0.6192599, 0.07450981, 0, 1, 1,
0.4898961, -1.083998, 3.465818, 0.07843138, 0, 1, 1,
0.490392, 0.6409168, 0.9549134, 0.08627451, 0, 1, 1,
0.494789, -0.6539496, 3.070643, 0.09019608, 0, 1, 1,
0.4950325, -0.8132679, 3.608395, 0.09803922, 0, 1, 1,
0.4951155, 0.6264601, 0.4325836, 0.1058824, 0, 1, 1,
0.4996774, -0.1860567, 0.9335725, 0.1098039, 0, 1, 1,
0.5001898, 2.26127, 1.529374, 0.1176471, 0, 1, 1,
0.5058776, 1.191496, 0.1863759, 0.1215686, 0, 1, 1,
0.5071789, 0.4737122, 1.264631, 0.1294118, 0, 1, 1,
0.5125222, 1.071578, 0.4945046, 0.1333333, 0, 1, 1,
0.5166886, 1.17929, 1.822719, 0.1411765, 0, 1, 1,
0.5185708, 0.950153, 1.130017, 0.145098, 0, 1, 1,
0.5209936, 1.294468, -1.865472, 0.1529412, 0, 1, 1,
0.5247009, -0.5373631, 1.245559, 0.1568628, 0, 1, 1,
0.5262204, -1.106468, 3.431295, 0.1647059, 0, 1, 1,
0.52798, -2.974938, 1.699587, 0.1686275, 0, 1, 1,
0.5295488, -1.213217, 3.423589, 0.1764706, 0, 1, 1,
0.5344357, 1.018864, 2.090279, 0.1803922, 0, 1, 1,
0.534583, 1.788286, 0.5504318, 0.1882353, 0, 1, 1,
0.5439568, 0.5387303, 1.001207, 0.1921569, 0, 1, 1,
0.547574, -0.2732743, 3.24883, 0.2, 0, 1, 1,
0.5515708, 1.280656, -0.07512268, 0.2078431, 0, 1, 1,
0.5517155, 0.6474383, -0.3454816, 0.2117647, 0, 1, 1,
0.5532305, -1.462541, 2.032344, 0.2196078, 0, 1, 1,
0.5535127, -0.5987689, 1.692721, 0.2235294, 0, 1, 1,
0.5547405, -1.274339, 3.243165, 0.2313726, 0, 1, 1,
0.5554722, 0.9127114, 1.301514, 0.2352941, 0, 1, 1,
0.5558646, 0.6112289, 0.7444454, 0.2431373, 0, 1, 1,
0.5589809, 0.320496, -0.05531238, 0.2470588, 0, 1, 1,
0.560793, -0.0005287959, 3.046271, 0.254902, 0, 1, 1,
0.5652358, -0.7651272, 1.676543, 0.2588235, 0, 1, 1,
0.5685161, 0.6035185, -0.4280447, 0.2666667, 0, 1, 1,
0.569643, -0.6700813, 0.7245752, 0.2705882, 0, 1, 1,
0.5752447, 0.6845073, 0.5199406, 0.2784314, 0, 1, 1,
0.5758412, -0.1621416, 0.1488656, 0.282353, 0, 1, 1,
0.57618, -0.3128928, 1.384079, 0.2901961, 0, 1, 1,
0.5768641, 0.2326356, 1.505731, 0.2941177, 0, 1, 1,
0.580274, -0.2554725, 1.686378, 0.3019608, 0, 1, 1,
0.5831339, 0.2620392, 1.869591, 0.3098039, 0, 1, 1,
0.5841452, -0.797964, 2.553595, 0.3137255, 0, 1, 1,
0.5858065, -0.2288764, 2.065752, 0.3215686, 0, 1, 1,
0.5905859, -0.008637062, 2.395418, 0.3254902, 0, 1, 1,
0.594853, -0.3155947, 3.27413, 0.3333333, 0, 1, 1,
0.5970728, 0.4490228, 1.039885, 0.3372549, 0, 1, 1,
0.5988114, 0.5049356, -1.636905, 0.345098, 0, 1, 1,
0.605126, 0.3052657, -1.458014, 0.3490196, 0, 1, 1,
0.6059653, -0.2160469, 0.7738068, 0.3568628, 0, 1, 1,
0.606594, 1.598241, 1.354091, 0.3607843, 0, 1, 1,
0.6067173, 0.7874453, -0.1498228, 0.3686275, 0, 1, 1,
0.6107871, 0.08110356, 1.812814, 0.372549, 0, 1, 1,
0.6143264, 0.5231492, 0.7323312, 0.3803922, 0, 1, 1,
0.6196024, 0.02576446, 1.361449, 0.3843137, 0, 1, 1,
0.6249799, 0.2969534, 0.9134343, 0.3921569, 0, 1, 1,
0.625997, 0.2627887, 1.843402, 0.3960784, 0, 1, 1,
0.6277505, -0.949213, 1.051058, 0.4039216, 0, 1, 1,
0.6299731, -1.926614, 3.490045, 0.4117647, 0, 1, 1,
0.64337, 0.4928945, 1.939606, 0.4156863, 0, 1, 1,
0.6484775, 1.238348, -1.433194, 0.4235294, 0, 1, 1,
0.6533434, -0.7872611, 1.599312, 0.427451, 0, 1, 1,
0.655973, 0.6673459, -0.7364308, 0.4352941, 0, 1, 1,
0.6584961, 1.16908, -1.121001, 0.4392157, 0, 1, 1,
0.6591474, -0.4773587, 2.506777, 0.4470588, 0, 1, 1,
0.6612688, -0.4291007, 1.432271, 0.4509804, 0, 1, 1,
0.6640368, 0.1249811, 1.774229, 0.4588235, 0, 1, 1,
0.66484, -0.6217281, 2.99851, 0.4627451, 0, 1, 1,
0.6670126, -0.2707041, 2.709082, 0.4705882, 0, 1, 1,
0.6715401, 1.473157, 2.312036, 0.4745098, 0, 1, 1,
0.6760058, -0.5103093, 2.143423, 0.4823529, 0, 1, 1,
0.677289, 0.2468068, 0.7667502, 0.4862745, 0, 1, 1,
0.6808284, 1.343681, 1.446958, 0.4941176, 0, 1, 1,
0.6813183, 2.004885, 0.6709826, 0.5019608, 0, 1, 1,
0.6830286, 0.1148506, 2.399162, 0.5058824, 0, 1, 1,
0.6865534, 2.356182, 0.2494689, 0.5137255, 0, 1, 1,
0.6881324, 1.234684, 1.279621, 0.5176471, 0, 1, 1,
0.6887607, -0.3858763, 2.439834, 0.5254902, 0, 1, 1,
0.689846, -2.030659, 3.110863, 0.5294118, 0, 1, 1,
0.6902012, 1.326945, 1.246937, 0.5372549, 0, 1, 1,
0.69261, -0.4972737, 3.40677, 0.5411765, 0, 1, 1,
0.6958978, -1.933745, 1.485026, 0.5490196, 0, 1, 1,
0.6978247, -1.781228, 3.49438, 0.5529412, 0, 1, 1,
0.6997308, -0.06414302, 1.914742, 0.5607843, 0, 1, 1,
0.7089234, -0.9320608, 1.937482, 0.5647059, 0, 1, 1,
0.7102585, 0.3087608, 2.697337, 0.572549, 0, 1, 1,
0.719007, 0.6875991, -0.01363557, 0.5764706, 0, 1, 1,
0.7219377, -0.6057993, 1.388429, 0.5843138, 0, 1, 1,
0.7226689, 0.04250594, 2.69037, 0.5882353, 0, 1, 1,
0.7320261, 1.308728, 1.636748, 0.5960785, 0, 1, 1,
0.7345337, 1.124204, 0.7791837, 0.6039216, 0, 1, 1,
0.7354798, 0.08330319, 2.314319, 0.6078432, 0, 1, 1,
0.7367823, 0.4704295, 1.027103, 0.6156863, 0, 1, 1,
0.7379232, -1.953727, 1.85521, 0.6196079, 0, 1, 1,
0.7425936, -0.8571192, 3.827498, 0.627451, 0, 1, 1,
0.7465178, -0.5482893, 1.206262, 0.6313726, 0, 1, 1,
0.7474717, -0.3240465, 1.546651, 0.6392157, 0, 1, 1,
0.7478563, 0.7718025, -0.4613492, 0.6431373, 0, 1, 1,
0.7492329, 1.511811, 0.2465759, 0.6509804, 0, 1, 1,
0.7525663, 0.516988, 1.90735, 0.654902, 0, 1, 1,
0.762684, 0.7506002, 0.6823529, 0.6627451, 0, 1, 1,
0.7683654, 0.2869165, 0.1707621, 0.6666667, 0, 1, 1,
0.7712978, -0.1716448, 1.991479, 0.6745098, 0, 1, 1,
0.7716053, 0.8599867, 0.227092, 0.6784314, 0, 1, 1,
0.7783997, -0.4130595, 1.453513, 0.6862745, 0, 1, 1,
0.7863566, 0.5885965, 0.9631471, 0.6901961, 0, 1, 1,
0.7878333, 1.192109, 1.030821, 0.6980392, 0, 1, 1,
0.7947054, -0.07336137, 1.489795, 0.7058824, 0, 1, 1,
0.7957965, -1.207794, 2.11627, 0.7098039, 0, 1, 1,
0.79721, -0.7209266, 2.382437, 0.7176471, 0, 1, 1,
0.7983866, -1.212972, 2.233287, 0.7215686, 0, 1, 1,
0.8045769, 0.1976811, 2.318639, 0.7294118, 0, 1, 1,
0.8096055, 0.9271304, 1.410902, 0.7333333, 0, 1, 1,
0.8189679, -0.9611965, 0.9523087, 0.7411765, 0, 1, 1,
0.8223129, 0.1173121, 0.7376254, 0.7450981, 0, 1, 1,
0.8258392, -0.9835723, 2.168453, 0.7529412, 0, 1, 1,
0.8274056, 0.3731989, 2.529299, 0.7568628, 0, 1, 1,
0.8278772, -0.2749651, 3.442536, 0.7647059, 0, 1, 1,
0.8285176, -0.1135825, 1.605756, 0.7686275, 0, 1, 1,
0.8315929, 1.072762, -0.2511751, 0.7764706, 0, 1, 1,
0.8320135, -0.841916, 2.587596, 0.7803922, 0, 1, 1,
0.8345464, 0.6017476, 1.642111, 0.7882353, 0, 1, 1,
0.845116, 0.8298176, 1.779116, 0.7921569, 0, 1, 1,
0.8524246, -0.172901, 1.685528, 0.8, 0, 1, 1,
0.8561855, -0.8341774, 3.586647, 0.8078431, 0, 1, 1,
0.8582841, 1.587387, 0.7760585, 0.8117647, 0, 1, 1,
0.8584924, 1.139647, 0.4393088, 0.8196079, 0, 1, 1,
0.8587426, -0.3937713, 3.082563, 0.8235294, 0, 1, 1,
0.8624856, -2.605272, 3.216714, 0.8313726, 0, 1, 1,
0.8706089, -1.124514, 3.849832, 0.8352941, 0, 1, 1,
0.8719376, 2.021803, 0.1437163, 0.8431373, 0, 1, 1,
0.8743682, -0.6355433, 3.789045, 0.8470588, 0, 1, 1,
0.8751056, -2.245723, 2.063026, 0.854902, 0, 1, 1,
0.8763862, 0.4397773, 0.7790875, 0.8588235, 0, 1, 1,
0.8835526, -1.411934, 3.785837, 0.8666667, 0, 1, 1,
0.8854028, -0.6734865, 1.692138, 0.8705882, 0, 1, 1,
0.8911523, -1.142629, 1.031275, 0.8784314, 0, 1, 1,
0.894931, -0.9231976, 2.752723, 0.8823529, 0, 1, 1,
0.9011746, -0.4075269, 2.593322, 0.8901961, 0, 1, 1,
0.9013476, -0.8543305, 3.28389, 0.8941177, 0, 1, 1,
0.904969, 0.1546269, 2.228546, 0.9019608, 0, 1, 1,
0.9067078, -0.7020974, 2.467112, 0.9098039, 0, 1, 1,
0.9070746, -0.9008829, 2.702016, 0.9137255, 0, 1, 1,
0.9072138, -0.06774839, 1.676154, 0.9215686, 0, 1, 1,
0.9078695, 0.6454999, -0.6463634, 0.9254902, 0, 1, 1,
0.9209718, 0.5487711, 0.8330069, 0.9333333, 0, 1, 1,
0.9265084, -0.351632, 2.915823, 0.9372549, 0, 1, 1,
0.9308814, 2.10865, -0.6438756, 0.945098, 0, 1, 1,
0.9337255, 0.4560892, 0.9597117, 0.9490196, 0, 1, 1,
0.9383226, 1.206558, 0.06363579, 0.9568627, 0, 1, 1,
0.9447497, 0.473168, 3.196052, 0.9607843, 0, 1, 1,
0.945042, -0.3102122, 3.166692, 0.9686275, 0, 1, 1,
0.9457106, 0.02987735, 0.6898953, 0.972549, 0, 1, 1,
0.9561559, -0.5402305, 1.747177, 0.9803922, 0, 1, 1,
0.9618131, 1.335501, 0.5518517, 0.9843137, 0, 1, 1,
0.9625527, -0.4661081, 2.000417, 0.9921569, 0, 1, 1,
0.9664392, 2.247934, -0.5472783, 0.9960784, 0, 1, 1,
0.9666791, 0.09218717, 1.729488, 1, 0, 0.9960784, 1,
0.9725199, -0.54658, 2.883503, 1, 0, 0.9882353, 1,
0.9750748, 1.403732, 0.6684924, 1, 0, 0.9843137, 1,
0.9798765, 0.4664203, 1.257724, 1, 0, 0.9764706, 1,
0.9845962, 0.7279942, -0.7493299, 1, 0, 0.972549, 1,
0.9848055, 1.666395, 0.1421709, 1, 0, 0.9647059, 1,
0.9882639, -1.442549, 3.265194, 1, 0, 0.9607843, 1,
0.997608, -0.1039064, 2.461245, 1, 0, 0.9529412, 1,
1.000308, -0.8313956, 2.28716, 1, 0, 0.9490196, 1,
1.008249, -1.302054, 2.300142, 1, 0, 0.9411765, 1,
1.012755, -1.023571, 3.28492, 1, 0, 0.9372549, 1,
1.0147, -1.051502, 4.400839, 1, 0, 0.9294118, 1,
1.02247, 1.63551, 0.606463, 1, 0, 0.9254902, 1,
1.023169, -1.133543, 2.896922, 1, 0, 0.9176471, 1,
1.025029, -0.1921691, 0.9931167, 1, 0, 0.9137255, 1,
1.031061, 1.549139, 0.3067975, 1, 0, 0.9058824, 1,
1.034881, 0.4674174, -0.4469392, 1, 0, 0.9019608, 1,
1.0361, 1.756955, -0.1031213, 1, 0, 0.8941177, 1,
1.036863, 0.06402067, -0.1855572, 1, 0, 0.8862745, 1,
1.03817, 0.9988976, -0.2899734, 1, 0, 0.8823529, 1,
1.038523, 0.2533611, 1.666221, 1, 0, 0.8745098, 1,
1.039061, -0.4442609, 0.7574252, 1, 0, 0.8705882, 1,
1.039186, 0.7211915, 2.27501, 1, 0, 0.8627451, 1,
1.039465, -2.138133, 2.630771, 1, 0, 0.8588235, 1,
1.041633, 0.2235772, 2.031446, 1, 0, 0.8509804, 1,
1.043313, 0.5438462, 0.1811547, 1, 0, 0.8470588, 1,
1.062518, -1.942298, 3.847378, 1, 0, 0.8392157, 1,
1.06544, -1.34486, 2.378344, 1, 0, 0.8352941, 1,
1.067579, -0.6347548, 2.544246, 1, 0, 0.827451, 1,
1.069098, 0.4336453, -1.211841, 1, 0, 0.8235294, 1,
1.074219, -0.5659997, 1.317626, 1, 0, 0.8156863, 1,
1.080813, -0.6204979, 2.764032, 1, 0, 0.8117647, 1,
1.086524, -1.452851, 2.444921, 1, 0, 0.8039216, 1,
1.094979, 2.624444, 0.1836403, 1, 0, 0.7960784, 1,
1.09677, -0.4433818, 3.337547, 1, 0, 0.7921569, 1,
1.103173, -0.8009275, 2.927064, 1, 0, 0.7843137, 1,
1.106944, -0.9235137, 3.183266, 1, 0, 0.7803922, 1,
1.114004, 0.6067562, 3.400762, 1, 0, 0.772549, 1,
1.11562, 0.7330627, -0.0990326, 1, 0, 0.7686275, 1,
1.116419, 1.948968, -0.7090703, 1, 0, 0.7607843, 1,
1.122935, -1.516541, 1.650335, 1, 0, 0.7568628, 1,
1.125907, 0.3229252, 1.585201, 1, 0, 0.7490196, 1,
1.12956, -0.5985719, -1.3957, 1, 0, 0.7450981, 1,
1.130271, -0.3904, 1.450206, 1, 0, 0.7372549, 1,
1.142596, -0.2037807, 1.339975, 1, 0, 0.7333333, 1,
1.152768, -1.246876, 2.449776, 1, 0, 0.7254902, 1,
1.153746, 0.928309, 2.742769, 1, 0, 0.7215686, 1,
1.154124, 0.8274643, 1.368539, 1, 0, 0.7137255, 1,
1.154353, 0.6368678, 1.152158, 1, 0, 0.7098039, 1,
1.160461, 1.136733, 0.9864086, 1, 0, 0.7019608, 1,
1.163828, 0.2559817, 0.576857, 1, 0, 0.6941177, 1,
1.16432, -0.3628135, 1.795305, 1, 0, 0.6901961, 1,
1.164909, 0.1345918, 0.8324279, 1, 0, 0.682353, 1,
1.167569, 0.4466361, 0.6913342, 1, 0, 0.6784314, 1,
1.168674, 0.6596848, 0.3704163, 1, 0, 0.6705883, 1,
1.176184, -2.397771, 1.720297, 1, 0, 0.6666667, 1,
1.181264, 0.802881, 2.738261, 1, 0, 0.6588235, 1,
1.202673, 0.2204429, 3.155604, 1, 0, 0.654902, 1,
1.210135, 1.117131, 0.2425611, 1, 0, 0.6470588, 1,
1.211984, 1.599067, 0.008184321, 1, 0, 0.6431373, 1,
1.213633, -0.2215826, 3.282795, 1, 0, 0.6352941, 1,
1.222291, -0.9442912, 2.585807, 1, 0, 0.6313726, 1,
1.230042, 1.219309, 0.5930969, 1, 0, 0.6235294, 1,
1.232548, 1.186567, 0.3208612, 1, 0, 0.6196079, 1,
1.235838, -0.3696001, 3.984661, 1, 0, 0.6117647, 1,
1.249149, -1.951924, 3.898435, 1, 0, 0.6078432, 1,
1.253718, 0.9522784, 0.3529148, 1, 0, 0.6, 1,
1.267036, 0.280403, 1.521648, 1, 0, 0.5921569, 1,
1.270397, -0.2704602, 1.943426, 1, 0, 0.5882353, 1,
1.274534, -1.343433, 1.65575, 1, 0, 0.5803922, 1,
1.27594, -0.628737, 3.401725, 1, 0, 0.5764706, 1,
1.287617, -0.1199887, 0.5036922, 1, 0, 0.5686275, 1,
1.287724, 0.2134335, 0.2178731, 1, 0, 0.5647059, 1,
1.290638, 1.261227, 3.549354, 1, 0, 0.5568628, 1,
1.299208, 0.8942873, 0.456913, 1, 0, 0.5529412, 1,
1.305312, -0.8661038, 1.381177, 1, 0, 0.5450981, 1,
1.329457, 0.2952201, 1.211333, 1, 0, 0.5411765, 1,
1.333734, -1.622301, 2.683383, 1, 0, 0.5333334, 1,
1.344983, -0.5948011, 2.854328, 1, 0, 0.5294118, 1,
1.347691, -0.2501976, 1.307192, 1, 0, 0.5215687, 1,
1.350921, 0.07110187, 1.000058, 1, 0, 0.5176471, 1,
1.351579, 0.6466475, 2.275703, 1, 0, 0.509804, 1,
1.360315, -0.6034873, 1.637584, 1, 0, 0.5058824, 1,
1.366673, 0.2363152, 0.8578166, 1, 0, 0.4980392, 1,
1.374628, 2.323252, 1.131029, 1, 0, 0.4901961, 1,
1.376617, 0.1750828, 2.804252, 1, 0, 0.4862745, 1,
1.376727, -1.925732, 0.7122837, 1, 0, 0.4784314, 1,
1.390665, -0.4682078, 2.609637, 1, 0, 0.4745098, 1,
1.396277, 0.7173187, 0.3165893, 1, 0, 0.4666667, 1,
1.402126, 0.2615051, 0.9639502, 1, 0, 0.4627451, 1,
1.402779, 0.5670029, 2.736527, 1, 0, 0.454902, 1,
1.412712, -0.04429366, 2.002248, 1, 0, 0.4509804, 1,
1.413932, -0.8234918, 4.815449, 1, 0, 0.4431373, 1,
1.423, -0.1468773, 1.284013, 1, 0, 0.4392157, 1,
1.435293, 0.6098493, 2.452698, 1, 0, 0.4313726, 1,
1.450364, -0.4462947, 1.912637, 1, 0, 0.427451, 1,
1.454769, 2.326962, -0.2745831, 1, 0, 0.4196078, 1,
1.457098, -0.2376311, 2.59154, 1, 0, 0.4156863, 1,
1.457253, 0.3763769, 1.263542, 1, 0, 0.4078431, 1,
1.487031, -1.086255, 1.726206, 1, 0, 0.4039216, 1,
1.491328, 0.2797777, 1.918807, 1, 0, 0.3960784, 1,
1.493801, 0.7037246, -0.3385273, 1, 0, 0.3882353, 1,
1.527956, 0.1708463, 1.777671, 1, 0, 0.3843137, 1,
1.54538, 0.09823588, 0.398586, 1, 0, 0.3764706, 1,
1.555927, -1.510737, 3.212944, 1, 0, 0.372549, 1,
1.56189, 0.5725017, -0.5177395, 1, 0, 0.3647059, 1,
1.564632, -0.416274, 2.442338, 1, 0, 0.3607843, 1,
1.612788, -0.01647014, 1.190155, 1, 0, 0.3529412, 1,
1.625304, -1.149726, 2.566395, 1, 0, 0.3490196, 1,
1.632353, -1.146075, 2.399576, 1, 0, 0.3411765, 1,
1.649041, -0.1911605, 2.267019, 1, 0, 0.3372549, 1,
1.654889, 0.4521634, 3.16096, 1, 0, 0.3294118, 1,
1.677434, -0.4323276, 0.08469462, 1, 0, 0.3254902, 1,
1.680243, -0.1903571, 2.627032, 1, 0, 0.3176471, 1,
1.689224, -0.4592611, 2.482495, 1, 0, 0.3137255, 1,
1.689555, 1.04616, 2.108841, 1, 0, 0.3058824, 1,
1.695961, -1.053199, 2.406108, 1, 0, 0.2980392, 1,
1.696526, -1.34481, 2.703266, 1, 0, 0.2941177, 1,
1.7075, 0.2985893, 3.306468, 1, 0, 0.2862745, 1,
1.721757, -0.41255, 2.522671, 1, 0, 0.282353, 1,
1.724637, -0.382129, 2.377365, 1, 0, 0.2745098, 1,
1.75414, 1.6397, 0.4361772, 1, 0, 0.2705882, 1,
1.75947, -1.832599, 1.7327, 1, 0, 0.2627451, 1,
1.762961, -1.101284, 1.512395, 1, 0, 0.2588235, 1,
1.764923, -0.3420162, 1.771815, 1, 0, 0.2509804, 1,
1.768034, 0.2476453, -0.4436365, 1, 0, 0.2470588, 1,
1.770743, -0.2258336, 1.814479, 1, 0, 0.2392157, 1,
1.779457, -0.3374072, 2.069022, 1, 0, 0.2352941, 1,
1.786385, -3.029353, 3.991775, 1, 0, 0.227451, 1,
1.794541, -0.6328287, 1.759295, 1, 0, 0.2235294, 1,
1.808004, 0.724178, 1.67345, 1, 0, 0.2156863, 1,
1.811507, 0.4092411, 1.024262, 1, 0, 0.2117647, 1,
1.872164, 0.5316904, 0.4830686, 1, 0, 0.2039216, 1,
1.922211, 0.7924818, 1.469816, 1, 0, 0.1960784, 1,
1.924626, -0.4307473, 3.151653, 1, 0, 0.1921569, 1,
1.925876, -1.461046, 2.55785, 1, 0, 0.1843137, 1,
1.92689, 1.25107, -0.1564977, 1, 0, 0.1803922, 1,
1.929384, -1.686376, 2.947532, 1, 0, 0.172549, 1,
1.938304, 1.200477, 0.9034805, 1, 0, 0.1686275, 1,
1.940018, -0.4957094, 1.926222, 1, 0, 0.1607843, 1,
1.979423, 0.4033186, 0.9436324, 1, 0, 0.1568628, 1,
1.983328, 0.2060942, 0.6300988, 1, 0, 0.1490196, 1,
2.061899, -1.441408, 2.3938, 1, 0, 0.145098, 1,
2.069142, 1.151301, 0.8664431, 1, 0, 0.1372549, 1,
2.073346, 1.874686, 1.700352, 1, 0, 0.1333333, 1,
2.093759, -0.4600059, 3.197732, 1, 0, 0.1254902, 1,
2.095516, -1.756991, 3.359914, 1, 0, 0.1215686, 1,
2.11366, -1.701115, 2.33423, 1, 0, 0.1137255, 1,
2.11382, -0.7149699, 1.551729, 1, 0, 0.1098039, 1,
2.128858, 1.361866, 1.391476, 1, 0, 0.1019608, 1,
2.186664, 0.7536842, 2.19412, 1, 0, 0.09411765, 1,
2.216177, -0.9592549, 3.157362, 1, 0, 0.09019608, 1,
2.217385, -0.04182889, 0.5709131, 1, 0, 0.08235294, 1,
2.246697, -0.7770613, 1.728296, 1, 0, 0.07843138, 1,
2.267313, 0.341547, 2.164659, 1, 0, 0.07058824, 1,
2.304066, 1.679903, 0.2213428, 1, 0, 0.06666667, 1,
2.314747, -0.5947728, 1.954693, 1, 0, 0.05882353, 1,
2.319081, 0.6495772, 0.4981712, 1, 0, 0.05490196, 1,
2.461037, 2.518988, 2.684678, 1, 0, 0.04705882, 1,
2.461141, -0.3373281, 0.8301215, 1, 0, 0.04313726, 1,
2.488817, -1.649479, 2.912196, 1, 0, 0.03529412, 1,
2.620216, -0.8567902, 2.778407, 1, 0, 0.03137255, 1,
2.665351, 0.8504851, 1.744019, 1, 0, 0.02352941, 1,
2.884649, -0.8422313, 2.250166, 1, 0, 0.01960784, 1,
2.899828, 0.5218013, 1.606172, 1, 0, 0.01176471, 1,
3.063504, -0.3652989, 1.392718, 1, 0, 0.007843138, 1
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
-0.08506405, -6.113461, -7.287107, 0, -0.5, 0.5, 0.5,
-0.08506405, -6.113461, -7.287107, 1, -0.5, 0.5, 0.5,
-0.08506405, -6.113461, -7.287107, 1, 1.5, 0.5, 0.5,
-0.08506405, -6.113461, -7.287107, 0, 1.5, 0.5, 0.5
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
-4.300996, -0.756005, -7.287107, 0, -0.5, 0.5, 0.5,
-4.300996, -0.756005, -7.287107, 1, -0.5, 0.5, 0.5,
-4.300996, -0.756005, -7.287107, 1, 1.5, 0.5, 0.5,
-4.300996, -0.756005, -7.287107, 0, 1.5, 0.5, 0.5
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
-4.300996, -6.113461, 0.3480272, 0, -0.5, 0.5, 0.5,
-4.300996, -6.113461, 0.3480272, 1, -0.5, 0.5, 0.5,
-4.300996, -6.113461, 0.3480272, 1, 1.5, 0.5, 0.5,
-4.300996, -6.113461, 0.3480272, 0, 1.5, 0.5, 0.5
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
-3, -4.877125, -5.525153,
3, -4.877125, -5.525153,
-3, -4.877125, -5.525153,
-3, -5.083181, -5.818812,
-2, -4.877125, -5.525153,
-2, -5.083181, -5.818812,
-1, -4.877125, -5.525153,
-1, -5.083181, -5.818812,
0, -4.877125, -5.525153,
0, -5.083181, -5.818812,
1, -4.877125, -5.525153,
1, -5.083181, -5.818812,
2, -4.877125, -5.525153,
2, -5.083181, -5.818812,
3, -4.877125, -5.525153,
3, -5.083181, -5.818812
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
-3, -5.495293, -6.40613, 0, -0.5, 0.5, 0.5,
-3, -5.495293, -6.40613, 1, -0.5, 0.5, 0.5,
-3, -5.495293, -6.40613, 1, 1.5, 0.5, 0.5,
-3, -5.495293, -6.40613, 0, 1.5, 0.5, 0.5,
-2, -5.495293, -6.40613, 0, -0.5, 0.5, 0.5,
-2, -5.495293, -6.40613, 1, -0.5, 0.5, 0.5,
-2, -5.495293, -6.40613, 1, 1.5, 0.5, 0.5,
-2, -5.495293, -6.40613, 0, 1.5, 0.5, 0.5,
-1, -5.495293, -6.40613, 0, -0.5, 0.5, 0.5,
-1, -5.495293, -6.40613, 1, -0.5, 0.5, 0.5,
-1, -5.495293, -6.40613, 1, 1.5, 0.5, 0.5,
-1, -5.495293, -6.40613, 0, 1.5, 0.5, 0.5,
0, -5.495293, -6.40613, 0, -0.5, 0.5, 0.5,
0, -5.495293, -6.40613, 1, -0.5, 0.5, 0.5,
0, -5.495293, -6.40613, 1, 1.5, 0.5, 0.5,
0, -5.495293, -6.40613, 0, 1.5, 0.5, 0.5,
1, -5.495293, -6.40613, 0, -0.5, 0.5, 0.5,
1, -5.495293, -6.40613, 1, -0.5, 0.5, 0.5,
1, -5.495293, -6.40613, 1, 1.5, 0.5, 0.5,
1, -5.495293, -6.40613, 0, 1.5, 0.5, 0.5,
2, -5.495293, -6.40613, 0, -0.5, 0.5, 0.5,
2, -5.495293, -6.40613, 1, -0.5, 0.5, 0.5,
2, -5.495293, -6.40613, 1, 1.5, 0.5, 0.5,
2, -5.495293, -6.40613, 0, 1.5, 0.5, 0.5,
3, -5.495293, -6.40613, 0, -0.5, 0.5, 0.5,
3, -5.495293, -6.40613, 1, -0.5, 0.5, 0.5,
3, -5.495293, -6.40613, 1, 1.5, 0.5, 0.5,
3, -5.495293, -6.40613, 0, 1.5, 0.5, 0.5
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
-3.328089, -4, -5.525153,
-3.328089, 2, -5.525153,
-3.328089, -4, -5.525153,
-3.49024, -4, -5.818812,
-3.328089, -2, -5.525153,
-3.49024, -2, -5.818812,
-3.328089, 0, -5.525153,
-3.49024, 0, -5.818812,
-3.328089, 2, -5.525153,
-3.49024, 2, -5.818812
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
"-4",
"-2",
"0",
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
-3.814542, -4, -6.40613, 0, -0.5, 0.5, 0.5,
-3.814542, -4, -6.40613, 1, -0.5, 0.5, 0.5,
-3.814542, -4, -6.40613, 1, 1.5, 0.5, 0.5,
-3.814542, -4, -6.40613, 0, 1.5, 0.5, 0.5,
-3.814542, -2, -6.40613, 0, -0.5, 0.5, 0.5,
-3.814542, -2, -6.40613, 1, -0.5, 0.5, 0.5,
-3.814542, -2, -6.40613, 1, 1.5, 0.5, 0.5,
-3.814542, -2, -6.40613, 0, 1.5, 0.5, 0.5,
-3.814542, 0, -6.40613, 0, -0.5, 0.5, 0.5,
-3.814542, 0, -6.40613, 1, -0.5, 0.5, 0.5,
-3.814542, 0, -6.40613, 1, 1.5, 0.5, 0.5,
-3.814542, 0, -6.40613, 0, 1.5, 0.5, 0.5,
-3.814542, 2, -6.40613, 0, -0.5, 0.5, 0.5,
-3.814542, 2, -6.40613, 1, -0.5, 0.5, 0.5,
-3.814542, 2, -6.40613, 1, 1.5, 0.5, 0.5,
-3.814542, 2, -6.40613, 0, 1.5, 0.5, 0.5
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
-3.328089, -4.877125, -4,
-3.328089, -4.877125, 6,
-3.328089, -4.877125, -4,
-3.49024, -5.083181, -4,
-3.328089, -4.877125, -2,
-3.49024, -5.083181, -2,
-3.328089, -4.877125, 0,
-3.49024, -5.083181, 0,
-3.328089, -4.877125, 2,
-3.49024, -5.083181, 2,
-3.328089, -4.877125, 4,
-3.49024, -5.083181, 4,
-3.328089, -4.877125, 6,
-3.49024, -5.083181, 6
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
"4",
"6"
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
-3.814542, -5.495293, -4, 0, -0.5, 0.5, 0.5,
-3.814542, -5.495293, -4, 1, -0.5, 0.5, 0.5,
-3.814542, -5.495293, -4, 1, 1.5, 0.5, 0.5,
-3.814542, -5.495293, -4, 0, 1.5, 0.5, 0.5,
-3.814542, -5.495293, -2, 0, -0.5, 0.5, 0.5,
-3.814542, -5.495293, -2, 1, -0.5, 0.5, 0.5,
-3.814542, -5.495293, -2, 1, 1.5, 0.5, 0.5,
-3.814542, -5.495293, -2, 0, 1.5, 0.5, 0.5,
-3.814542, -5.495293, 0, 0, -0.5, 0.5, 0.5,
-3.814542, -5.495293, 0, 1, -0.5, 0.5, 0.5,
-3.814542, -5.495293, 0, 1, 1.5, 0.5, 0.5,
-3.814542, -5.495293, 0, 0, 1.5, 0.5, 0.5,
-3.814542, -5.495293, 2, 0, -0.5, 0.5, 0.5,
-3.814542, -5.495293, 2, 1, -0.5, 0.5, 0.5,
-3.814542, -5.495293, 2, 1, 1.5, 0.5, 0.5,
-3.814542, -5.495293, 2, 0, 1.5, 0.5, 0.5,
-3.814542, -5.495293, 4, 0, -0.5, 0.5, 0.5,
-3.814542, -5.495293, 4, 1, -0.5, 0.5, 0.5,
-3.814542, -5.495293, 4, 1, 1.5, 0.5, 0.5,
-3.814542, -5.495293, 4, 0, 1.5, 0.5, 0.5,
-3.814542, -5.495293, 6, 0, -0.5, 0.5, 0.5,
-3.814542, -5.495293, 6, 1, -0.5, 0.5, 0.5,
-3.814542, -5.495293, 6, 1, 1.5, 0.5, 0.5,
-3.814542, -5.495293, 6, 0, 1.5, 0.5, 0.5
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
-3.328089, -4.877125, -5.525153,
-3.328089, 3.365115, -5.525153,
-3.328089, -4.877125, 6.221208,
-3.328089, 3.365115, 6.221208,
-3.328089, -4.877125, -5.525153,
-3.328089, -4.877125, 6.221208,
-3.328089, 3.365115, -5.525153,
-3.328089, 3.365115, 6.221208,
-3.328089, -4.877125, -5.525153,
3.15796, -4.877125, -5.525153,
-3.328089, -4.877125, 6.221208,
3.15796, -4.877125, 6.221208,
-3.328089, 3.365115, -5.525153,
3.15796, 3.365115, -5.525153,
-3.328089, 3.365115, 6.221208,
3.15796, 3.365115, 6.221208,
3.15796, -4.877125, -5.525153,
3.15796, 3.365115, -5.525153,
3.15796, -4.877125, 6.221208,
3.15796, 3.365115, 6.221208,
3.15796, -4.877125, -5.525153,
3.15796, -4.877125, 6.221208,
3.15796, 3.365115, -5.525153,
3.15796, 3.365115, 6.221208
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
var radius = 8.408802;
var distance = 37.41171;
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
mvMatrix.translate( 0.08506405, 0.756005, -0.3480272 );
mvMatrix.scale( 1.401741, 1.103069, 0.7740066 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.41171);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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


