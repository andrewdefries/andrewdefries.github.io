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
-2.96195, -0.3498105, -1.584437, 1, 0, 0, 1,
-2.884291, -0.1276697, -1.064466, 1, 0.007843138, 0, 1,
-2.847574, 0.3092379, -0.7439278, 1, 0.01176471, 0, 1,
-2.828793, 0.5480331, -1.706175, 1, 0.01960784, 0, 1,
-2.805081, 1.263311, -1.020197, 1, 0.02352941, 0, 1,
-2.791854, 1.000718, -1.194362, 1, 0.03137255, 0, 1,
-2.77211, 0.6463481, -1.398425, 1, 0.03529412, 0, 1,
-2.719227, -0.6467813, -2.014957, 1, 0.04313726, 0, 1,
-2.708583, 0.06318171, -0.5104752, 1, 0.04705882, 0, 1,
-2.484853, 0.8029616, -0.7771712, 1, 0.05490196, 0, 1,
-2.358159, 0.3558284, -0.4395059, 1, 0.05882353, 0, 1,
-2.275486, -0.5668923, -0.8061452, 1, 0.06666667, 0, 1,
-2.260842, -1.259605, -1.959921, 1, 0.07058824, 0, 1,
-2.214695, 1.333775, -1.071998, 1, 0.07843138, 0, 1,
-2.149452, -2.614295, -1.870373, 1, 0.08235294, 0, 1,
-2.147339, 1.377592, -1.616672, 1, 0.09019608, 0, 1,
-2.117102, 1.134453, -1.399767, 1, 0.09411765, 0, 1,
-2.112636, -2.475469, -2.761566, 1, 0.1019608, 0, 1,
-2.107456, -0.2196663, -1.184695, 1, 0.1098039, 0, 1,
-2.102698, -1.591366, -0.8851073, 1, 0.1137255, 0, 1,
-2.088202, 1.122608, -1.80505, 1, 0.1215686, 0, 1,
-2.062861, 0.1250912, -0.02747276, 1, 0.1254902, 0, 1,
-2.055028, 1.122677, -3.048399, 1, 0.1333333, 0, 1,
-2.036696, 0.6590096, -0.8058546, 1, 0.1372549, 0, 1,
-2.034476, -0.7582335, -0.3574536, 1, 0.145098, 0, 1,
-2.021601, -1.265903, -1.153502, 1, 0.1490196, 0, 1,
-2.010741, 0.8690377, -0.6639812, 1, 0.1568628, 0, 1,
-1.973784, 0.4166454, -2.843555, 1, 0.1607843, 0, 1,
-1.911675, 0.6645086, -1.882451, 1, 0.1686275, 0, 1,
-1.882899, 0.7736933, -0.5035251, 1, 0.172549, 0, 1,
-1.874423, 2.035936, -0.1030063, 1, 0.1803922, 0, 1,
-1.842691, 0.3459136, -1.958912, 1, 0.1843137, 0, 1,
-1.840665, 1.209658, -1.100892, 1, 0.1921569, 0, 1,
-1.840439, 1.13023, -0.1027928, 1, 0.1960784, 0, 1,
-1.831381, -1.014159, -2.920937, 1, 0.2039216, 0, 1,
-1.825477, 0.2216769, -1.089491, 1, 0.2117647, 0, 1,
-1.811674, 0.4444608, -1.571997, 1, 0.2156863, 0, 1,
-1.794565, -0.8570677, -1.908355, 1, 0.2235294, 0, 1,
-1.786325, -1.256417, -3.266788, 1, 0.227451, 0, 1,
-1.786249, 1.10144, -2.879363, 1, 0.2352941, 0, 1,
-1.7732, -0.3762034, -2.653529, 1, 0.2392157, 0, 1,
-1.767038, -0.1312301, -1.219016, 1, 0.2470588, 0, 1,
-1.764203, -0.1514139, -0.9297362, 1, 0.2509804, 0, 1,
-1.749053, 0.6132851, -0.4475275, 1, 0.2588235, 0, 1,
-1.744992, 0.0132683, -1.176426, 1, 0.2627451, 0, 1,
-1.731874, 0.08540072, -2.291271, 1, 0.2705882, 0, 1,
-1.722473, 0.48877, 0.1035415, 1, 0.2745098, 0, 1,
-1.718342, -0.3078989, 0.08583296, 1, 0.282353, 0, 1,
-1.70763, -0.96548, -0.7181997, 1, 0.2862745, 0, 1,
-1.696385, 0.3167886, -0.8401902, 1, 0.2941177, 0, 1,
-1.683902, 0.5008382, -3.603658, 1, 0.3019608, 0, 1,
-1.679114, 1.090016, -0.1872991, 1, 0.3058824, 0, 1,
-1.648256, 0.3412539, -1.520535, 1, 0.3137255, 0, 1,
-1.639455, 0.5193562, -1.5257, 1, 0.3176471, 0, 1,
-1.634145, 0.5044831, 0.3117263, 1, 0.3254902, 0, 1,
-1.627295, 2.474013, -1.739248, 1, 0.3294118, 0, 1,
-1.615156, -3.240491, -1.993318, 1, 0.3372549, 0, 1,
-1.610214, -0.5220469, -2.29476, 1, 0.3411765, 0, 1,
-1.605489, -0.3408657, -2.33221, 1, 0.3490196, 0, 1,
-1.60448, 1.533926, -2.412279, 1, 0.3529412, 0, 1,
-1.588341, -1.124953, -2.600102, 1, 0.3607843, 0, 1,
-1.574759, 0.01179886, -2.063545, 1, 0.3647059, 0, 1,
-1.559729, 1.414795, 1.605809, 1, 0.372549, 0, 1,
-1.554415, -1.089267, -1.23681, 1, 0.3764706, 0, 1,
-1.549344, -0.05851689, -0.1699181, 1, 0.3843137, 0, 1,
-1.529533, -1.37184, -3.170391, 1, 0.3882353, 0, 1,
-1.50213, 0.9348432, -1.435544, 1, 0.3960784, 0, 1,
-1.498388, -0.4686226, -1.61006, 1, 0.4039216, 0, 1,
-1.486604, -0.4273637, -1.861906, 1, 0.4078431, 0, 1,
-1.476536, 0.7997266, -0.3822554, 1, 0.4156863, 0, 1,
-1.471009, 2.018851, -1.127889, 1, 0.4196078, 0, 1,
-1.464154, 1.633119, 0.6545975, 1, 0.427451, 0, 1,
-1.461951, -0.7793481, -2.480758, 1, 0.4313726, 0, 1,
-1.457752, -0.009575522, -2.536494, 1, 0.4392157, 0, 1,
-1.456036, 0.3592877, -3.055946, 1, 0.4431373, 0, 1,
-1.455601, 0.9435221, -1.055583, 1, 0.4509804, 0, 1,
-1.449481, 0.3861669, -0.1069634, 1, 0.454902, 0, 1,
-1.447018, -1.113115, -2.593685, 1, 0.4627451, 0, 1,
-1.443432, -0.6274118, -3.859088, 1, 0.4666667, 0, 1,
-1.442811, 1.676755, -0.6355419, 1, 0.4745098, 0, 1,
-1.430322, -1.191873, -2.717767, 1, 0.4784314, 0, 1,
-1.421584, 0.7487796, -1.176009, 1, 0.4862745, 0, 1,
-1.410049, 0.1324243, -1.49352, 1, 0.4901961, 0, 1,
-1.404613, -0.1024848, -1.730447, 1, 0.4980392, 0, 1,
-1.404367, 0.0266232, -0.9157112, 1, 0.5058824, 0, 1,
-1.39905, -0.7372677, -1.790923, 1, 0.509804, 0, 1,
-1.399036, 3.638232, -0.7933527, 1, 0.5176471, 0, 1,
-1.392531, 0.09948677, -0.9030814, 1, 0.5215687, 0, 1,
-1.374162, 0.1462442, -1.33908, 1, 0.5294118, 0, 1,
-1.373794, -0.5185067, -0.6615128, 1, 0.5333334, 0, 1,
-1.356875, -1.539157, -2.108531, 1, 0.5411765, 0, 1,
-1.356698, -1.382763, -2.667995, 1, 0.5450981, 0, 1,
-1.351538, 1.83342, 0.5072645, 1, 0.5529412, 0, 1,
-1.344589, 1.697843, -0.7835712, 1, 0.5568628, 0, 1,
-1.339628, 0.9250156, -1.035622, 1, 0.5647059, 0, 1,
-1.338693, 1.253096, -0.9581714, 1, 0.5686275, 0, 1,
-1.336894, -0.1744619, -3.008462, 1, 0.5764706, 0, 1,
-1.332168, -0.1602459, -2.651423, 1, 0.5803922, 0, 1,
-1.31893, -0.3243452, -2.067463, 1, 0.5882353, 0, 1,
-1.318693, 0.04202196, -2.74036, 1, 0.5921569, 0, 1,
-1.314858, -0.7143985, -1.175053, 1, 0.6, 0, 1,
-1.309474, 0.05915387, -1.44975, 1, 0.6078432, 0, 1,
-1.305467, 1.071158, -0.7106353, 1, 0.6117647, 0, 1,
-1.280044, 0.05219553, -2.924806, 1, 0.6196079, 0, 1,
-1.277873, -0.6514844, -1.735516, 1, 0.6235294, 0, 1,
-1.268445, 0.1203392, -1.111244, 1, 0.6313726, 0, 1,
-1.252878, -1.366317, -1.740433, 1, 0.6352941, 0, 1,
-1.25191, -0.4444726, -1.147426, 1, 0.6431373, 0, 1,
-1.249762, 1.152241, 0.1302972, 1, 0.6470588, 0, 1,
-1.248259, 0.8696444, -0.9946664, 1, 0.654902, 0, 1,
-1.248239, 1.206532, -0.6184399, 1, 0.6588235, 0, 1,
-1.247954, -0.5729941, -0.2682308, 1, 0.6666667, 0, 1,
-1.244592, 1.098385, -0.5774815, 1, 0.6705883, 0, 1,
-1.240045, 2.242866, -2.354992, 1, 0.6784314, 0, 1,
-1.232558, 1.321876, -0.5546162, 1, 0.682353, 0, 1,
-1.221098, -1.540088, -2.750698, 1, 0.6901961, 0, 1,
-1.21637, 0.2624515, -3.100551, 1, 0.6941177, 0, 1,
-1.214852, -1.893731, -3.139937, 1, 0.7019608, 0, 1,
-1.214591, -0.633822, -0.8571309, 1, 0.7098039, 0, 1,
-1.21418, 0.1889477, -2.630964, 1, 0.7137255, 0, 1,
-1.213351, -1.212226, -2.517452, 1, 0.7215686, 0, 1,
-1.2054, 0.7684283, 0.05505202, 1, 0.7254902, 0, 1,
-1.202413, -1.303158, -0.7167641, 1, 0.7333333, 0, 1,
-1.194668, 1.589118, -1.369219, 1, 0.7372549, 0, 1,
-1.191063, 0.4275171, -0.7588056, 1, 0.7450981, 0, 1,
-1.190999, -0.1030831, -2.019889, 1, 0.7490196, 0, 1,
-1.190759, 0.1780419, -0.7287508, 1, 0.7568628, 0, 1,
-1.189395, -0.09428379, -2.097103, 1, 0.7607843, 0, 1,
-1.186818, 1.755487, 0.8772024, 1, 0.7686275, 0, 1,
-1.185966, 1.165212, -1.619992, 1, 0.772549, 0, 1,
-1.181606, -0.6645734, -1.079883, 1, 0.7803922, 0, 1,
-1.179501, 0.03442651, -2.083375, 1, 0.7843137, 0, 1,
-1.179404, -0.586009, -1.272163, 1, 0.7921569, 0, 1,
-1.164814, -0.7006404, -2.399051, 1, 0.7960784, 0, 1,
-1.162467, 0.04878566, -0.8148537, 1, 0.8039216, 0, 1,
-1.155868, -0.3808181, -1.102102, 1, 0.8117647, 0, 1,
-1.155557, -1.549087, -3.168943, 1, 0.8156863, 0, 1,
-1.144771, 0.3009403, -0.6756256, 1, 0.8235294, 0, 1,
-1.144301, -0.2459103, -3.910686, 1, 0.827451, 0, 1,
-1.132784, 1.10103, 0.1767851, 1, 0.8352941, 0, 1,
-1.125464, 0.3827229, -2.834723, 1, 0.8392157, 0, 1,
-1.1077, -0.3291799, -0.4610316, 1, 0.8470588, 0, 1,
-1.096918, -0.3709002, -1.58231, 1, 0.8509804, 0, 1,
-1.090364, -0.4963058, -2.840538, 1, 0.8588235, 0, 1,
-1.075727, 0.5040353, -1.840682, 1, 0.8627451, 0, 1,
-1.073468, 0.5761827, 0.3951232, 1, 0.8705882, 0, 1,
-1.07278, -0.8997794, -1.239024, 1, 0.8745098, 0, 1,
-1.070196, -1.498802, -1.550958, 1, 0.8823529, 0, 1,
-1.061738, 1.569338, -2.723039, 1, 0.8862745, 0, 1,
-1.061606, 0.3971169, -1.227042, 1, 0.8941177, 0, 1,
-1.054071, -0.3124876, -0.7803447, 1, 0.8980392, 0, 1,
-1.048204, 0.3032691, -1.605015, 1, 0.9058824, 0, 1,
-1.04814, 0.1955825, -0.8978274, 1, 0.9137255, 0, 1,
-1.039065, -0.07600108, -2.365461, 1, 0.9176471, 0, 1,
-1.038543, -0.3854716, -0.8006773, 1, 0.9254902, 0, 1,
-1.028621, 2.348594, -0.2717707, 1, 0.9294118, 0, 1,
-1.024016, 0.5198106, -2.661791, 1, 0.9372549, 0, 1,
-1.017351, -1.841272, -4.409708, 1, 0.9411765, 0, 1,
-1.013594, 0.0595924, -1.449668, 1, 0.9490196, 0, 1,
-1.013343, 0.6287171, -0.8979152, 1, 0.9529412, 0, 1,
-1.011927, 0.3529635, -1.950567, 1, 0.9607843, 0, 1,
-1.004039, -0.7214608, -1.715446, 1, 0.9647059, 0, 1,
-1.000542, -0.2202986, -2.247818, 1, 0.972549, 0, 1,
-0.9954563, 0.9797136, -1.432577, 1, 0.9764706, 0, 1,
-0.9905309, -1.105181, -1.496728, 1, 0.9843137, 0, 1,
-0.9884353, 0.07298645, -3.745878, 1, 0.9882353, 0, 1,
-0.9816547, -0.4718736, -2.375049, 1, 0.9960784, 0, 1,
-0.9805496, 1.094807, -1.853356, 0.9960784, 1, 0, 1,
-0.9762079, 0.5276906, 0.5897259, 0.9921569, 1, 0, 1,
-0.9740967, 0.6677415, -2.21003, 0.9843137, 1, 0, 1,
-0.9718432, -0.0712387, -2.100704, 0.9803922, 1, 0, 1,
-0.9708139, -1.69749, -3.250117, 0.972549, 1, 0, 1,
-0.9692506, 0.03052506, 0.04568358, 0.9686275, 1, 0, 1,
-0.9611068, 0.4145938, -0.9879382, 0.9607843, 1, 0, 1,
-0.9538735, 0.2410249, -2.875505, 0.9568627, 1, 0, 1,
-0.9513741, -0.06319915, -0.2966328, 0.9490196, 1, 0, 1,
-0.949544, 0.1888781, -1.749641, 0.945098, 1, 0, 1,
-0.9449654, 0.2863642, -1.312287, 0.9372549, 1, 0, 1,
-0.9389737, 0.3577477, -0.9825901, 0.9333333, 1, 0, 1,
-0.9371301, -0.02051705, -3.179048, 0.9254902, 1, 0, 1,
-0.935811, 0.2664438, -0.3837663, 0.9215686, 1, 0, 1,
-0.9354019, -1.252001, -0.2900383, 0.9137255, 1, 0, 1,
-0.9350768, 0.4639364, 0.6221863, 0.9098039, 1, 0, 1,
-0.9350302, -1.134404, -3.635786, 0.9019608, 1, 0, 1,
-0.9322256, -1.210427, -1.080851, 0.8941177, 1, 0, 1,
-0.9298378, -1.690027, -3.14955, 0.8901961, 1, 0, 1,
-0.9238994, 1.074332, 0.1203356, 0.8823529, 1, 0, 1,
-0.9202198, 1.679361, -0.551295, 0.8784314, 1, 0, 1,
-0.9187716, -0.6867206, -2.549311, 0.8705882, 1, 0, 1,
-0.9184232, 0.7714775, -0.738139, 0.8666667, 1, 0, 1,
-0.902857, 0.4769266, -0.1856299, 0.8588235, 1, 0, 1,
-0.9028504, 0.2940714, -0.2036758, 0.854902, 1, 0, 1,
-0.8963796, 0.08779974, -0.3067577, 0.8470588, 1, 0, 1,
-0.893617, 1.667384, -1.269162, 0.8431373, 1, 0, 1,
-0.892971, 2.972006, 0.3575658, 0.8352941, 1, 0, 1,
-0.892372, -0.237063, -1.757728, 0.8313726, 1, 0, 1,
-0.8905469, 0.1928325, -1.17772, 0.8235294, 1, 0, 1,
-0.8903821, -2.132623, -1.4886, 0.8196079, 1, 0, 1,
-0.8778292, -1.357634, -2.508905, 0.8117647, 1, 0, 1,
-0.8671265, -0.785129, -2.994246, 0.8078431, 1, 0, 1,
-0.8661881, 0.04498868, 0.5288759, 0.8, 1, 0, 1,
-0.8609822, -1.670924, -2.073129, 0.7921569, 1, 0, 1,
-0.853691, 1.428195, -0.9202891, 0.7882353, 1, 0, 1,
-0.8476712, -0.9452694, -3.396218, 0.7803922, 1, 0, 1,
-0.8447175, -3.007396, -3.01085, 0.7764706, 1, 0, 1,
-0.8429686, -0.2257589, -0.7548766, 0.7686275, 1, 0, 1,
-0.8410941, 0.3285804, -0.7753706, 0.7647059, 1, 0, 1,
-0.8375548, -0.9867825, -2.488497, 0.7568628, 1, 0, 1,
-0.8330498, -1.001125, -1.399645, 0.7529412, 1, 0, 1,
-0.8325369, -0.139251, -3.344724, 0.7450981, 1, 0, 1,
-0.8291681, 0.4599757, -1.797632, 0.7411765, 1, 0, 1,
-0.8285936, -1.569991, -3.38806, 0.7333333, 1, 0, 1,
-0.8259436, -1.088694, -3.192273, 0.7294118, 1, 0, 1,
-0.8236721, 0.6540056, -2.275505, 0.7215686, 1, 0, 1,
-0.8211917, 0.3312503, -1.53326, 0.7176471, 1, 0, 1,
-0.8099563, -2.73184, -3.313441, 0.7098039, 1, 0, 1,
-0.8067112, -0.08682479, -2.194892, 0.7058824, 1, 0, 1,
-0.8054716, 0.4217702, 0.8062202, 0.6980392, 1, 0, 1,
-0.7970441, -0.3668711, -0.6681137, 0.6901961, 1, 0, 1,
-0.7967457, 0.3486007, -1.198849, 0.6862745, 1, 0, 1,
-0.7908983, 0.5329767, -0.7016741, 0.6784314, 1, 0, 1,
-0.7906904, -0.650175, -1.771512, 0.6745098, 1, 0, 1,
-0.7853655, -0.6191114, -1.440171, 0.6666667, 1, 0, 1,
-0.7821705, -0.4463096, -1.650678, 0.6627451, 1, 0, 1,
-0.7774937, 2.100813, -1.30645, 0.654902, 1, 0, 1,
-0.7770641, 1.3763, -1.597646, 0.6509804, 1, 0, 1,
-0.7708541, 1.839669, 0.2832223, 0.6431373, 1, 0, 1,
-0.7510631, -1.078787, -4.176751, 0.6392157, 1, 0, 1,
-0.7489904, 1.261188, -0.3360188, 0.6313726, 1, 0, 1,
-0.7479858, 0.1644315, 0.4527308, 0.627451, 1, 0, 1,
-0.746444, -0.7102984, -1.351915, 0.6196079, 1, 0, 1,
-0.7458399, -2.56711, -1.60079, 0.6156863, 1, 0, 1,
-0.7397885, 0.1155278, -0.6658502, 0.6078432, 1, 0, 1,
-0.7349733, -2.269549, -2.218228, 0.6039216, 1, 0, 1,
-0.7327096, 2.253376, -2.923442, 0.5960785, 1, 0, 1,
-0.7323758, -0.01700644, -3.805209, 0.5882353, 1, 0, 1,
-0.7305841, 0.6477472, -0.7147695, 0.5843138, 1, 0, 1,
-0.7303205, 0.5010294, -2.73654, 0.5764706, 1, 0, 1,
-0.727447, -1.233918, -2.264472, 0.572549, 1, 0, 1,
-0.7219617, -0.738958, -2.937733, 0.5647059, 1, 0, 1,
-0.7211166, -0.5263358, -0.3919883, 0.5607843, 1, 0, 1,
-0.7206012, 1.238193, -1.067919, 0.5529412, 1, 0, 1,
-0.717467, -0.7927421, -2.082267, 0.5490196, 1, 0, 1,
-0.7171183, 0.919669, -0.9957933, 0.5411765, 1, 0, 1,
-0.7079061, 1.64773, 0.8918536, 0.5372549, 1, 0, 1,
-0.7077917, 0.7120936, -1.442011, 0.5294118, 1, 0, 1,
-0.7064411, 0.8504432, -2.106723, 0.5254902, 1, 0, 1,
-0.7049525, -1.361689, -2.522677, 0.5176471, 1, 0, 1,
-0.6969619, 1.234256, 0.8992745, 0.5137255, 1, 0, 1,
-0.6956648, 0.9935451, -1.970858, 0.5058824, 1, 0, 1,
-0.6901175, -1.765832, -4.942816, 0.5019608, 1, 0, 1,
-0.6853754, 0.8955404, -1.250523, 0.4941176, 1, 0, 1,
-0.6830938, -0.9327937, -2.887236, 0.4862745, 1, 0, 1,
-0.6827878, -1.917972, -2.528245, 0.4823529, 1, 0, 1,
-0.6777263, 0.9419687, -1.921862, 0.4745098, 1, 0, 1,
-0.6761193, -0.5381818, -2.894648, 0.4705882, 1, 0, 1,
-0.6757541, 0.03851939, -1.150993, 0.4627451, 1, 0, 1,
-0.6717272, 0.4445341, -1.718575, 0.4588235, 1, 0, 1,
-0.6713377, -1.989298, -1.97251, 0.4509804, 1, 0, 1,
-0.6709862, -1.280003, -2.237019, 0.4470588, 1, 0, 1,
-0.6694713, 0.0102573, -2.766597, 0.4392157, 1, 0, 1,
-0.664462, -0.4154551, -2.095988, 0.4352941, 1, 0, 1,
-0.6588626, 2.013054, -1.574479, 0.427451, 1, 0, 1,
-0.6533478, 1.30473, -0.1453403, 0.4235294, 1, 0, 1,
-0.6476726, -0.3155558, -1.62063, 0.4156863, 1, 0, 1,
-0.6445073, 0.5304718, 0.1776542, 0.4117647, 1, 0, 1,
-0.6294056, 0.8038847, -2.377113, 0.4039216, 1, 0, 1,
-0.6281666, 0.5673157, -0.8007215, 0.3960784, 1, 0, 1,
-0.6227568, -0.03406126, -2.49787, 0.3921569, 1, 0, 1,
-0.6164135, 0.4457536, -2.103869, 0.3843137, 1, 0, 1,
-0.613253, -1.054469, -2.406421, 0.3803922, 1, 0, 1,
-0.6069967, -1.211079, -3.492643, 0.372549, 1, 0, 1,
-0.6054185, -0.1163183, -2.674575, 0.3686275, 1, 0, 1,
-0.6053523, 1.695349, -1.360401, 0.3607843, 1, 0, 1,
-0.6026233, -1.686234, -2.843071, 0.3568628, 1, 0, 1,
-0.6011736, 0.5473157, -0.4870031, 0.3490196, 1, 0, 1,
-0.5985408, -1.811754, -1.480847, 0.345098, 1, 0, 1,
-0.5980853, -0.5623279, -3.537529, 0.3372549, 1, 0, 1,
-0.5978308, 0.07101679, -1.056784, 0.3333333, 1, 0, 1,
-0.5975586, 0.9081171, -0.5416151, 0.3254902, 1, 0, 1,
-0.5957338, -0.6480179, -3.36639, 0.3215686, 1, 0, 1,
-0.5950341, -0.04141431, -3.273212, 0.3137255, 1, 0, 1,
-0.5928308, 0.7642853, -0.8108348, 0.3098039, 1, 0, 1,
-0.5925568, -0.5255406, -2.081798, 0.3019608, 1, 0, 1,
-0.5920275, 2.830325, -0.8596609, 0.2941177, 1, 0, 1,
-0.5871964, 1.964481, -0.9417299, 0.2901961, 1, 0, 1,
-0.5845272, -0.1874218, -4.441038, 0.282353, 1, 0, 1,
-0.5839589, -0.7673365, -2.913874, 0.2784314, 1, 0, 1,
-0.5791961, -0.1874051, -1.419355, 0.2705882, 1, 0, 1,
-0.5731862, 1.314181, -1.350171, 0.2666667, 1, 0, 1,
-0.5678278, 0.208989, -1.314349, 0.2588235, 1, 0, 1,
-0.5667375, -0.3398216, -1.4654, 0.254902, 1, 0, 1,
-0.5656609, 1.352367, 0.0480277, 0.2470588, 1, 0, 1,
-0.565169, 0.1159365, -1.170693, 0.2431373, 1, 0, 1,
-0.5636914, 0.7564623, -0.3004665, 0.2352941, 1, 0, 1,
-0.5631132, -0.812232, -2.468811, 0.2313726, 1, 0, 1,
-0.5630153, -0.2390057, -1.013234, 0.2235294, 1, 0, 1,
-0.5610813, -0.409503, -1.241645, 0.2196078, 1, 0, 1,
-0.5574368, -2.10248, -2.703572, 0.2117647, 1, 0, 1,
-0.5536132, -0.5807545, -3.263148, 0.2078431, 1, 0, 1,
-0.5533867, -0.1489934, -2.337735, 0.2, 1, 0, 1,
-0.5530175, -1.139481, -4.124958, 0.1921569, 1, 0, 1,
-0.5498207, 1.069886, -0.4965335, 0.1882353, 1, 0, 1,
-0.5490423, 0.4279863, -0.09908522, 0.1803922, 1, 0, 1,
-0.5480232, 0.1518894, -2.183638, 0.1764706, 1, 0, 1,
-0.5399584, -0.9094253, -4.456485, 0.1686275, 1, 0, 1,
-0.5390238, 0.1983227, -2.531089, 0.1647059, 1, 0, 1,
-0.5389554, -0.4752215, -3.730494, 0.1568628, 1, 0, 1,
-0.5364605, 0.9695709, -0.5635501, 0.1529412, 1, 0, 1,
-0.5332198, -0.01961946, -3.444324, 0.145098, 1, 0, 1,
-0.5276113, -0.2449986, -1.82903, 0.1411765, 1, 0, 1,
-0.5252569, -0.8957597, -1.8481, 0.1333333, 1, 0, 1,
-0.5216131, -0.1415233, -1.880203, 0.1294118, 1, 0, 1,
-0.5214115, 0.07362069, -0.7249231, 0.1215686, 1, 0, 1,
-0.5194191, 0.9658506, -0.8560812, 0.1176471, 1, 0, 1,
-0.5194119, -0.1009343, -3.333392, 0.1098039, 1, 0, 1,
-0.5153584, 0.2216803, -1.247157, 0.1058824, 1, 0, 1,
-0.5145186, 0.0672003, -1.906475, 0.09803922, 1, 0, 1,
-0.5131571, -0.990809, -3.085675, 0.09019608, 1, 0, 1,
-0.5094839, 0.4763971, -2.455108, 0.08627451, 1, 0, 1,
-0.5093172, 1.456828, -0.4455703, 0.07843138, 1, 0, 1,
-0.5088919, -2.044034, -2.604813, 0.07450981, 1, 0, 1,
-0.5083912, 0.5063751, -2.109608, 0.06666667, 1, 0, 1,
-0.5076164, 0.2096105, 0.0895397, 0.0627451, 1, 0, 1,
-0.5045739, 0.9823151, 1.707656, 0.05490196, 1, 0, 1,
-0.5025449, -0.3044955, -1.639363, 0.05098039, 1, 0, 1,
-0.501738, 0.1604931, -1.655114, 0.04313726, 1, 0, 1,
-0.5014092, -2.039746, -2.146936, 0.03921569, 1, 0, 1,
-0.497931, -0.2248065, -1.887588, 0.03137255, 1, 0, 1,
-0.4877113, -0.4042382, -1.899241, 0.02745098, 1, 0, 1,
-0.486982, -0.9007872, -4.132782, 0.01960784, 1, 0, 1,
-0.4819084, -0.3096403, -2.917301, 0.01568628, 1, 0, 1,
-0.4817649, -0.6978693, -1.590892, 0.007843138, 1, 0, 1,
-0.4778793, -0.3005588, -2.546848, 0.003921569, 1, 0, 1,
-0.4755667, 0.3034172, -1.11114, 0, 1, 0.003921569, 1,
-0.4739517, 0.8261662, -2.169843, 0, 1, 0.01176471, 1,
-0.4676971, 0.4443075, -0.4390063, 0, 1, 0.01568628, 1,
-0.450259, 1.357428, -1.554428, 0, 1, 0.02352941, 1,
-0.446683, -0.8395176, -4.520418, 0, 1, 0.02745098, 1,
-0.4447055, 0.5001373, 0.2066607, 0, 1, 0.03529412, 1,
-0.4424362, 0.04711366, -1.452963, 0, 1, 0.03921569, 1,
-0.4350884, -1.584687, -1.714748, 0, 1, 0.04705882, 1,
-0.4337728, 1.509972, -1.335692, 0, 1, 0.05098039, 1,
-0.4207022, -1.445633, -3.008507, 0, 1, 0.05882353, 1,
-0.4202438, -0.2145591, -3.128484, 0, 1, 0.0627451, 1,
-0.4148339, -0.2171797, -1.012611, 0, 1, 0.07058824, 1,
-0.4096262, 1.173207, -1.941905, 0, 1, 0.07450981, 1,
-0.4064555, 0.9732392, -0.5662792, 0, 1, 0.08235294, 1,
-0.3987852, 0.5677339, 2.517097, 0, 1, 0.08627451, 1,
-0.3947426, -0.6555873, -3.051764, 0, 1, 0.09411765, 1,
-0.387632, 0.5584468, -0.6477394, 0, 1, 0.1019608, 1,
-0.3738949, -1.017469, -2.793876, 0, 1, 0.1058824, 1,
-0.3727619, 0.8761146, -0.6218857, 0, 1, 0.1137255, 1,
-0.3707648, -0.1155039, -1.544946, 0, 1, 0.1176471, 1,
-0.3705212, 0.6689065, 1.436645, 0, 1, 0.1254902, 1,
-0.3677955, -0.1242082, -2.694779, 0, 1, 0.1294118, 1,
-0.3598746, 0.4217624, 0.498699, 0, 1, 0.1372549, 1,
-0.3560451, 2.379808, -1.24395, 0, 1, 0.1411765, 1,
-0.3504407, 1.171827, -0.2700989, 0, 1, 0.1490196, 1,
-0.3485956, 1.098193, -0.9573533, 0, 1, 0.1529412, 1,
-0.3485312, 1.615829, -0.1076422, 0, 1, 0.1607843, 1,
-0.3480644, -0.2556512, -2.013385, 0, 1, 0.1647059, 1,
-0.3451251, 0.3189466, -0.5357668, 0, 1, 0.172549, 1,
-0.34409, 0.5166659, -1.805456, 0, 1, 0.1764706, 1,
-0.3438889, 0.914026, -0.3933817, 0, 1, 0.1843137, 1,
-0.3424476, 1.0969, -1.15613, 0, 1, 0.1882353, 1,
-0.3377692, 0.2434402, -1.713688, 0, 1, 0.1960784, 1,
-0.3334622, 2.046609, -0.1765836, 0, 1, 0.2039216, 1,
-0.3329847, -0.4667036, -2.6987, 0, 1, 0.2078431, 1,
-0.3327298, 0.4490631, -1.685426, 0, 1, 0.2156863, 1,
-0.3323174, 0.05776361, -1.737608, 0, 1, 0.2196078, 1,
-0.3320953, -1.182693, -2.510331, 0, 1, 0.227451, 1,
-0.3128482, -0.4371496, -2.986817, 0, 1, 0.2313726, 1,
-0.3101943, -1.726118, -2.429668, 0, 1, 0.2392157, 1,
-0.3075818, 1.354167, 0.1112946, 0, 1, 0.2431373, 1,
-0.306405, -0.3795891, -2.453634, 0, 1, 0.2509804, 1,
-0.3063065, -0.6071548, -1.794168, 0, 1, 0.254902, 1,
-0.2972079, 1.440939, -0.6928368, 0, 1, 0.2627451, 1,
-0.2964092, -0.3508967, -3.02965, 0, 1, 0.2666667, 1,
-0.2952483, -1.758006, -3.040271, 0, 1, 0.2745098, 1,
-0.2942668, -0.4554884, -2.149088, 0, 1, 0.2784314, 1,
-0.290674, 0.6900437, -0.6070104, 0, 1, 0.2862745, 1,
-0.2905395, -0.1970322, -2.61567, 0, 1, 0.2901961, 1,
-0.2843827, 0.7775204, -0.7116807, 0, 1, 0.2980392, 1,
-0.2784688, -0.2986812, -2.77172, 0, 1, 0.3058824, 1,
-0.2780929, -0.4418978, -3.266649, 0, 1, 0.3098039, 1,
-0.275055, -0.4382619, -2.306694, 0, 1, 0.3176471, 1,
-0.2741716, -1.494207, -1.031758, 0, 1, 0.3215686, 1,
-0.2724107, -1.036619, -2.209049, 0, 1, 0.3294118, 1,
-0.2692337, -1.660398, -2.010232, 0, 1, 0.3333333, 1,
-0.2679387, -1.097791, -4.649316, 0, 1, 0.3411765, 1,
-0.2648373, -0.4180654, -3.04703, 0, 1, 0.345098, 1,
-0.2570049, -0.4380834, -4.600013, 0, 1, 0.3529412, 1,
-0.2540905, -0.8683692, -2.715738, 0, 1, 0.3568628, 1,
-0.2540355, 0.08484242, -1.218736, 0, 1, 0.3647059, 1,
-0.2445848, 0.1561383, -0.6608422, 0, 1, 0.3686275, 1,
-0.2433922, 0.9740031, -0.9460776, 0, 1, 0.3764706, 1,
-0.2393444, 0.840188, -1.134085, 0, 1, 0.3803922, 1,
-0.2372656, 0.2659526, -1.571927, 0, 1, 0.3882353, 1,
-0.2331095, -0.3901507, -3.638678, 0, 1, 0.3921569, 1,
-0.2299463, -0.5537152, -3.282799, 0, 1, 0.4, 1,
-0.2298738, 1.289121, -1.89264, 0, 1, 0.4078431, 1,
-0.2271867, -1.68962, -2.6501, 0, 1, 0.4117647, 1,
-0.2267023, 0.2275253, -0.9313273, 0, 1, 0.4196078, 1,
-0.2216152, -1.245871, -0.4543135, 0, 1, 0.4235294, 1,
-0.2172887, -2.053667, -4.820527, 0, 1, 0.4313726, 1,
-0.2128588, -0.7016156, -2.880706, 0, 1, 0.4352941, 1,
-0.210608, 1.481582, 0.4142585, 0, 1, 0.4431373, 1,
-0.2092838, -1.144605, -3.263371, 0, 1, 0.4470588, 1,
-0.2057542, 0.3817403, 0.6422655, 0, 1, 0.454902, 1,
-0.2043294, -0.5413744, -1.241387, 0, 1, 0.4588235, 1,
-0.2034027, 0.4226888, 0.3555822, 0, 1, 0.4666667, 1,
-0.200166, 0.5976151, -1.375678, 0, 1, 0.4705882, 1,
-0.1981221, -1.075825, -2.357878, 0, 1, 0.4784314, 1,
-0.1975418, -0.8273873, -2.981179, 0, 1, 0.4823529, 1,
-0.197462, 0.5817181, -0.3973809, 0, 1, 0.4901961, 1,
-0.1973495, 1.115315, 1.138028, 0, 1, 0.4941176, 1,
-0.1956253, 1.731526, -0.8229043, 0, 1, 0.5019608, 1,
-0.1939631, 0.2188498, 0.4800565, 0, 1, 0.509804, 1,
-0.1913272, -0.9221829, -4.183746, 0, 1, 0.5137255, 1,
-0.1827404, 0.1196205, -1.55297, 0, 1, 0.5215687, 1,
-0.1814769, -0.7240852, -4.388656, 0, 1, 0.5254902, 1,
-0.1807626, 0.1289036, -1.130358, 0, 1, 0.5333334, 1,
-0.176354, -0.2405926, -3.678616, 0, 1, 0.5372549, 1,
-0.1761495, -0.1987727, -4.037593, 0, 1, 0.5450981, 1,
-0.1712592, 0.8424936, 0.3235687, 0, 1, 0.5490196, 1,
-0.1697329, -0.5012669, -3.237187, 0, 1, 0.5568628, 1,
-0.1686045, -1.394349, -2.777225, 0, 1, 0.5607843, 1,
-0.1682551, -0.274212, -2.373977, 0, 1, 0.5686275, 1,
-0.1654726, -0.5110483, -2.607697, 0, 1, 0.572549, 1,
-0.1654495, -0.8710051, -2.525114, 0, 1, 0.5803922, 1,
-0.1612776, -0.6640568, -1.765077, 0, 1, 0.5843138, 1,
-0.1517202, -0.3057704, -1.484882, 0, 1, 0.5921569, 1,
-0.1450845, 0.5135151, -0.8536977, 0, 1, 0.5960785, 1,
-0.1439807, 0.08037066, -1.996216, 0, 1, 0.6039216, 1,
-0.141943, -0.9308501, -2.427549, 0, 1, 0.6117647, 1,
-0.140816, 0.4848986, -1.652309, 0, 1, 0.6156863, 1,
-0.1407562, 0.6006736, -1.512985, 0, 1, 0.6235294, 1,
-0.1381686, -1.431791, -3.868258, 0, 1, 0.627451, 1,
-0.1377188, -2.031447, -2.288906, 0, 1, 0.6352941, 1,
-0.1346532, -0.4367858, -3.715657, 0, 1, 0.6392157, 1,
-0.12453, -0.2538691, -0.8111711, 0, 1, 0.6470588, 1,
-0.1213531, 0.268087, -0.4187987, 0, 1, 0.6509804, 1,
-0.1180222, 1.030108, -1.247285, 0, 1, 0.6588235, 1,
-0.1158815, 0.4085405, 0.1996864, 0, 1, 0.6627451, 1,
-0.1141815, -0.6418617, -2.505591, 0, 1, 0.6705883, 1,
-0.1117357, -0.3670156, -1.890736, 0, 1, 0.6745098, 1,
-0.1095239, -0.9455453, -3.310696, 0, 1, 0.682353, 1,
-0.1033109, 0.2756796, -2.320789, 0, 1, 0.6862745, 1,
-0.1011776, -1.169416, -2.833998, 0, 1, 0.6941177, 1,
-0.1002665, -0.5115083, -0.9725831, 0, 1, 0.7019608, 1,
-0.09845831, -0.4743607, -2.034468, 0, 1, 0.7058824, 1,
-0.09463391, -2.027387, -1.960463, 0, 1, 0.7137255, 1,
-0.0940503, -0.4638672, -2.517548, 0, 1, 0.7176471, 1,
-0.092404, -1.108726, -3.329671, 0, 1, 0.7254902, 1,
-0.09193905, -0.8938027, -3.726835, 0, 1, 0.7294118, 1,
-0.09003339, 0.8774769, 0.2863553, 0, 1, 0.7372549, 1,
-0.08662651, 0.9932532, -0.9156131, 0, 1, 0.7411765, 1,
-0.08635246, 0.2062535, -1.049681, 0, 1, 0.7490196, 1,
-0.08422759, -0.2338897, -2.793252, 0, 1, 0.7529412, 1,
-0.08250452, 0.7160636, -0.8158023, 0, 1, 0.7607843, 1,
-0.08220843, 1.468223, 2.70048, 0, 1, 0.7647059, 1,
-0.07981646, -0.707653, -4.243631, 0, 1, 0.772549, 1,
-0.07802693, -1.470183, -3.552148, 0, 1, 0.7764706, 1,
-0.07309646, 0.180823, -0.4560782, 0, 1, 0.7843137, 1,
-0.07284497, 0.06028561, -1.888219, 0, 1, 0.7882353, 1,
-0.0682296, -0.2241741, -4.110604, 0, 1, 0.7960784, 1,
-0.06740031, 1.507412, 1.243141, 0, 1, 0.8039216, 1,
-0.06323588, 1.343016, 0.06439385, 0, 1, 0.8078431, 1,
-0.05627497, 0.4721479, 1.407588, 0, 1, 0.8156863, 1,
-0.04747244, 0.07698827, 0.8729802, 0, 1, 0.8196079, 1,
-0.04251929, -0.3734857, -1.590949, 0, 1, 0.827451, 1,
-0.03767989, 1.07651, -1.066801, 0, 1, 0.8313726, 1,
-0.03178258, 0.4025841, 1.760321, 0, 1, 0.8392157, 1,
-0.02956223, 0.01105113, -2.434222, 0, 1, 0.8431373, 1,
-0.02687319, 1.034205, 0.2591471, 0, 1, 0.8509804, 1,
-0.02580385, -0.8358695, -1.746233, 0, 1, 0.854902, 1,
-0.01766341, 1.154662, -0.4697809, 0, 1, 0.8627451, 1,
-0.01584337, 1.116294, -0.3640268, 0, 1, 0.8666667, 1,
-0.01578284, 1.38774, 0.2399349, 0, 1, 0.8745098, 1,
-0.01259964, -0.2036197, -3.020936, 0, 1, 0.8784314, 1,
-0.01145597, -0.6755187, -3.134842, 0, 1, 0.8862745, 1,
-0.007709225, -1.410709, -1.987216, 0, 1, 0.8901961, 1,
-0.005980149, 0.6941234, -0.9627354, 0, 1, 0.8980392, 1,
-0.001491505, 1.673852, 0.6683747, 0, 1, 0.9058824, 1,
0.0001486492, -1.730424, 5.298678, 0, 1, 0.9098039, 1,
0.001386809, 0.2511627, 0.6397099, 0, 1, 0.9176471, 1,
0.002376404, -0.5994394, 2.987036, 0, 1, 0.9215686, 1,
0.007866936, 0.5081024, 0.1581249, 0, 1, 0.9294118, 1,
0.00915634, 2.456219, -0.4323918, 0, 1, 0.9333333, 1,
0.01131568, -0.5306464, 2.520026, 0, 1, 0.9411765, 1,
0.01238031, -2.170007, 4.098419, 0, 1, 0.945098, 1,
0.01593689, -1.44401, 4.169881, 0, 1, 0.9529412, 1,
0.01735027, -1.441741, 3.002294, 0, 1, 0.9568627, 1,
0.01865203, -0.7027427, 3.171743, 0, 1, 0.9647059, 1,
0.02000286, 0.03417414, 0.3785473, 0, 1, 0.9686275, 1,
0.02189351, 0.5268921, -0.3617062, 0, 1, 0.9764706, 1,
0.02510936, -0.2478468, 2.964641, 0, 1, 0.9803922, 1,
0.02528918, 1.653944, 0.4789374, 0, 1, 0.9882353, 1,
0.02794077, -0.7791767, 2.532913, 0, 1, 0.9921569, 1,
0.02994561, 0.3484524, -0.06129807, 0, 1, 1, 1,
0.02995908, -1.456072, 3.416548, 0, 0.9921569, 1, 1,
0.03357713, -0.3202671, 3.537477, 0, 0.9882353, 1, 1,
0.03708751, -0.6350698, 2.230245, 0, 0.9803922, 1, 1,
0.03820484, -0.280019, 2.215961, 0, 0.9764706, 1, 1,
0.0421225, -1.55747, 3.599679, 0, 0.9686275, 1, 1,
0.0427516, -0.7085623, 5.983854, 0, 0.9647059, 1, 1,
0.04280788, -0.9372679, 2.809505, 0, 0.9568627, 1, 1,
0.04450804, 0.3973115, -0.4330729, 0, 0.9529412, 1, 1,
0.04477172, -0.3756535, 2.84052, 0, 0.945098, 1, 1,
0.04519895, -1.598036, 2.480224, 0, 0.9411765, 1, 1,
0.04557909, 1.229774, 1.17821, 0, 0.9333333, 1, 1,
0.04926756, -1.027659, 3.345086, 0, 0.9294118, 1, 1,
0.05266298, -0.05038605, 2.187757, 0, 0.9215686, 1, 1,
0.05457743, 0.4855949, 1.138518, 0, 0.9176471, 1, 1,
0.05962016, -0.4522742, 2.449847, 0, 0.9098039, 1, 1,
0.05983723, 0.2420202, -0.9394838, 0, 0.9058824, 1, 1,
0.06624696, 0.1968067, 0.015767, 0, 0.8980392, 1, 1,
0.06944343, -0.3057656, 4.592559, 0, 0.8901961, 1, 1,
0.07028382, 1.324773, -1.265634, 0, 0.8862745, 1, 1,
0.07155799, -0.6145937, 2.050168, 0, 0.8784314, 1, 1,
0.07293605, 1.119998, 1.569454, 0, 0.8745098, 1, 1,
0.07359553, 0.6752297, 0.09006751, 0, 0.8666667, 1, 1,
0.07442401, 0.5487524, 0.07469998, 0, 0.8627451, 1, 1,
0.07540799, -0.366183, 2.927453, 0, 0.854902, 1, 1,
0.07911216, 0.2242966, -0.2968606, 0, 0.8509804, 1, 1,
0.07943626, -0.7139515, 3.249372, 0, 0.8431373, 1, 1,
0.07962359, 0.05152212, 2.149397, 0, 0.8392157, 1, 1,
0.07995906, -0.7819394, 1.815203, 0, 0.8313726, 1, 1,
0.08467104, -1.34608, 4.775953, 0, 0.827451, 1, 1,
0.08546703, 0.08270781, 1.361176, 0, 0.8196079, 1, 1,
0.0902139, 1.320456, 0.3917145, 0, 0.8156863, 1, 1,
0.09209677, -0.1442707, 2.439386, 0, 0.8078431, 1, 1,
0.09545311, 0.03237727, 0.9989721, 0, 0.8039216, 1, 1,
0.09564785, 0.7358988, 0.1812437, 0, 0.7960784, 1, 1,
0.09728412, -2.273229, 4.252584, 0, 0.7882353, 1, 1,
0.1026357, -0.4347677, 2.997153, 0, 0.7843137, 1, 1,
0.1039005, -0.598731, 2.65692, 0, 0.7764706, 1, 1,
0.1040752, -0.6375145, 3.645088, 0, 0.772549, 1, 1,
0.1051969, -0.6580492, 3.024865, 0, 0.7647059, 1, 1,
0.1055021, 2.156663, 1.445586, 0, 0.7607843, 1, 1,
0.1056469, 0.05720054, 1.006697, 0, 0.7529412, 1, 1,
0.1080509, 0.01462342, 2.201406, 0, 0.7490196, 1, 1,
0.1087383, -0.2959381, 1.930067, 0, 0.7411765, 1, 1,
0.1150892, -0.5074183, 2.552679, 0, 0.7372549, 1, 1,
0.1163434, -2.254796, 3.389577, 0, 0.7294118, 1, 1,
0.1187489, -0.4963177, 2.310431, 0, 0.7254902, 1, 1,
0.1192973, -0.5451751, 3.245421, 0, 0.7176471, 1, 1,
0.1213599, 0.3204204, 1.44737, 0, 0.7137255, 1, 1,
0.1230869, 0.4005468, 1.747005, 0, 0.7058824, 1, 1,
0.1241347, 1.017648, -0.5978219, 0, 0.6980392, 1, 1,
0.1256539, -0.3894095, 2.20267, 0, 0.6941177, 1, 1,
0.1270103, -1.082284, 3.669407, 0, 0.6862745, 1, 1,
0.132386, 0.2556822, 1.958758, 0, 0.682353, 1, 1,
0.1376, -0.2701574, 2.089214, 0, 0.6745098, 1, 1,
0.1390751, -0.01851229, 1.325135, 0, 0.6705883, 1, 1,
0.139487, 0.7154375, 1.007568, 0, 0.6627451, 1, 1,
0.1438553, -1.023524, 4.213481, 0, 0.6588235, 1, 1,
0.1470908, 0.313377, -0.3614307, 0, 0.6509804, 1, 1,
0.1480886, -0.7127292, 3.307009, 0, 0.6470588, 1, 1,
0.1505193, 0.1667605, -0.1486024, 0, 0.6392157, 1, 1,
0.1506046, 1.564943, 0.9298385, 0, 0.6352941, 1, 1,
0.1508641, -1.825224, 2.854479, 0, 0.627451, 1, 1,
0.1517174, -0.2275424, 3.445745, 0, 0.6235294, 1, 1,
0.1519397, -0.4799708, 2.083994, 0, 0.6156863, 1, 1,
0.1557384, 0.7947079, 0.4395125, 0, 0.6117647, 1, 1,
0.158995, 0.9550118, -0.8311595, 0, 0.6039216, 1, 1,
0.1592389, -0.06877191, 3.034503, 0, 0.5960785, 1, 1,
0.1665456, -1.3493, 3.737977, 0, 0.5921569, 1, 1,
0.1703629, 0.5054995, -0.08122113, 0, 0.5843138, 1, 1,
0.1719766, 0.4582261, 1.018494, 0, 0.5803922, 1, 1,
0.1745403, 1.456292, -1.211224, 0, 0.572549, 1, 1,
0.1749041, 0.5237361, -0.7273074, 0, 0.5686275, 1, 1,
0.1771714, 0.2478425, 1.449183, 0, 0.5607843, 1, 1,
0.17816, -0.625712, 4.887705, 0, 0.5568628, 1, 1,
0.1830234, -0.001977478, 1.909914, 0, 0.5490196, 1, 1,
0.1864975, -0.1151381, 1.300744, 0, 0.5450981, 1, 1,
0.187409, -1.604242, 3.441041, 0, 0.5372549, 1, 1,
0.1904168, 0.7013742, -0.4433624, 0, 0.5333334, 1, 1,
0.1923201, -0.8188052, 2.166542, 0, 0.5254902, 1, 1,
0.1927023, -1.600433, 2.317776, 0, 0.5215687, 1, 1,
0.1935523, -0.3074826, 3.145544, 0, 0.5137255, 1, 1,
0.1953048, -0.5986465, 3.111099, 0, 0.509804, 1, 1,
0.1991926, 0.4672688, -2.152063, 0, 0.5019608, 1, 1,
0.201573, 0.5522921, 0.9983523, 0, 0.4941176, 1, 1,
0.2039832, -1.42253, 3.901288, 0, 0.4901961, 1, 1,
0.2042302, -1.265728, 4.251666, 0, 0.4823529, 1, 1,
0.2069456, 0.223577, 2.254336, 0, 0.4784314, 1, 1,
0.2135224, 1.338757, 1.353892, 0, 0.4705882, 1, 1,
0.2137201, 1.460227, -1.087106, 0, 0.4666667, 1, 1,
0.2140412, 1.362161, -2.359375, 0, 0.4588235, 1, 1,
0.2175663, -1.836051, 2.553717, 0, 0.454902, 1, 1,
0.2182218, -0.6471822, 3.339988, 0, 0.4470588, 1, 1,
0.2206336, 0.6512948, 0.2102325, 0, 0.4431373, 1, 1,
0.2206952, -0.4781616, 2.27825, 0, 0.4352941, 1, 1,
0.2238617, -0.4800165, 2.303365, 0, 0.4313726, 1, 1,
0.2330154, -1.0315, 2.257037, 0, 0.4235294, 1, 1,
0.233634, -0.761586, 1.904722, 0, 0.4196078, 1, 1,
0.2353764, -0.9397861, 3.082806, 0, 0.4117647, 1, 1,
0.2369826, -0.8104903, 3.044418, 0, 0.4078431, 1, 1,
0.2399699, 0.3863284, 0.4096449, 0, 0.4, 1, 1,
0.2438657, -0.9754813, 3.615289, 0, 0.3921569, 1, 1,
0.2443075, -0.847205, 2.093056, 0, 0.3882353, 1, 1,
0.2446594, -0.03811901, 0.3072465, 0, 0.3803922, 1, 1,
0.2460546, -0.435451, 2.856632, 0, 0.3764706, 1, 1,
0.2480174, -0.4198648, 3.235418, 0, 0.3686275, 1, 1,
0.2530117, 0.5644513, 0.5328333, 0, 0.3647059, 1, 1,
0.2531269, 1.295364, 1.195397, 0, 0.3568628, 1, 1,
0.2570203, 0.4093869, 0.3071349, 0, 0.3529412, 1, 1,
0.2585007, -0.9633416, 3.5236, 0, 0.345098, 1, 1,
0.2621552, -0.004706396, 0.6323285, 0, 0.3411765, 1, 1,
0.2625096, -0.2531559, 1.400213, 0, 0.3333333, 1, 1,
0.2662549, -1.447944, 3.326443, 0, 0.3294118, 1, 1,
0.2678382, 0.1095939, 2.016303, 0, 0.3215686, 1, 1,
0.2690162, -0.4918988, 1.992701, 0, 0.3176471, 1, 1,
0.2709438, -0.7582319, 3.2828, 0, 0.3098039, 1, 1,
0.271014, 0.1008498, 2.05925, 0, 0.3058824, 1, 1,
0.2733744, -0.1527374, 3.938618, 0, 0.2980392, 1, 1,
0.2753649, -0.4645865, 2.309318, 0, 0.2901961, 1, 1,
0.2771095, -0.3190287, 1.438756, 0, 0.2862745, 1, 1,
0.2777284, -0.495845, 1.129789, 0, 0.2784314, 1, 1,
0.2829945, -0.9152142, 3.194161, 0, 0.2745098, 1, 1,
0.2837559, 1.07725, -1.061167, 0, 0.2666667, 1, 1,
0.2847854, 0.4905904, 0.2070511, 0, 0.2627451, 1, 1,
0.2919746, -1.077617, 3.802095, 0, 0.254902, 1, 1,
0.2932796, 0.242978, -1.292369, 0, 0.2509804, 1, 1,
0.2947162, -0.09663384, 1.561784, 0, 0.2431373, 1, 1,
0.2964655, -0.9773216, 3.08263, 0, 0.2392157, 1, 1,
0.2997794, 1.041621, 0.7766222, 0, 0.2313726, 1, 1,
0.2999362, -1.498804, 1.289096, 0, 0.227451, 1, 1,
0.3039936, -0.8706555, 1.005922, 0, 0.2196078, 1, 1,
0.305577, 0.4988385, 1.119006, 0, 0.2156863, 1, 1,
0.3072067, 1.213863, -0.3826377, 0, 0.2078431, 1, 1,
0.3095821, 0.4080436, 1.282667, 0, 0.2039216, 1, 1,
0.3125034, 0.02049757, 1.583649, 0, 0.1960784, 1, 1,
0.3126462, 0.9129397, 0.0549071, 0, 0.1882353, 1, 1,
0.3141797, -0.5413162, 3.207366, 0, 0.1843137, 1, 1,
0.3161126, 1.15658, -1.199556, 0, 0.1764706, 1, 1,
0.3229877, -2.101602, 2.159196, 0, 0.172549, 1, 1,
0.3243929, -1.074549, 2.982774, 0, 0.1647059, 1, 1,
0.3263551, -0.5527539, 0.1896615, 0, 0.1607843, 1, 1,
0.3321855, 0.3476464, 1.639218, 0, 0.1529412, 1, 1,
0.3350459, -0.3333022, 1.366533, 0, 0.1490196, 1, 1,
0.3350903, 0.5779516, 0.07696338, 0, 0.1411765, 1, 1,
0.3364621, 0.8660749, 0.3501056, 0, 0.1372549, 1, 1,
0.3407857, 1.05105, 0.6226434, 0, 0.1294118, 1, 1,
0.3442328, 2.270491, 0.9867961, 0, 0.1254902, 1, 1,
0.3465561, -0.3741654, 2.151092, 0, 0.1176471, 1, 1,
0.3468142, 1.269055, -0.51851, 0, 0.1137255, 1, 1,
0.3493304, 0.08873423, 0.6969153, 0, 0.1058824, 1, 1,
0.3493822, -1.200695, 3.393284, 0, 0.09803922, 1, 1,
0.349501, 1.048206, -1.211483, 0, 0.09411765, 1, 1,
0.3532629, -1.246055, 2.508721, 0, 0.08627451, 1, 1,
0.3535646, -0.2127331, 0.9243508, 0, 0.08235294, 1, 1,
0.3539117, 0.4053701, 0.2750068, 0, 0.07450981, 1, 1,
0.3550674, 0.1639265, -0.1261745, 0, 0.07058824, 1, 1,
0.3582502, -0.5827747, 1.119637, 0, 0.0627451, 1, 1,
0.359232, -1.046631, 1.514142, 0, 0.05882353, 1, 1,
0.3628888, -0.2478319, 1.669358, 0, 0.05098039, 1, 1,
0.3660183, 0.5514523, 0.378368, 0, 0.04705882, 1, 1,
0.3666144, -0.02251347, 2.203288, 0, 0.03921569, 1, 1,
0.3709854, -1.944658, 2.126784, 0, 0.03529412, 1, 1,
0.3723159, 0.07805271, 2.737927, 0, 0.02745098, 1, 1,
0.3727233, -1.998407, 2.674778, 0, 0.02352941, 1, 1,
0.3781123, -1.314235, 2.626574, 0, 0.01568628, 1, 1,
0.378896, 0.339687, -1.182038, 0, 0.01176471, 1, 1,
0.3850801, -0.9254531, 1.877643, 0, 0.003921569, 1, 1,
0.3869325, 1.494066, 1.945652, 0.003921569, 0, 1, 1,
0.3918052, 2.530356, 1.037933, 0.007843138, 0, 1, 1,
0.3948894, 1.167566, 0.9979115, 0.01568628, 0, 1, 1,
0.3961115, 0.83924, 0.3957055, 0.01960784, 0, 1, 1,
0.3995227, 0.6640301, 0.1413312, 0.02745098, 0, 1, 1,
0.4023456, 0.0918277, 0.7539945, 0.03137255, 0, 1, 1,
0.4069803, 0.004354774, 2.538825, 0.03921569, 0, 1, 1,
0.40951, -2.247655, 4.081961, 0.04313726, 0, 1, 1,
0.410691, -0.7219108, 0.4608275, 0.05098039, 0, 1, 1,
0.4145994, 1.638625, 0.223564, 0.05490196, 0, 1, 1,
0.4146439, -0.8627719, 1.514417, 0.0627451, 0, 1, 1,
0.4170553, 0.2601536, 0.4511603, 0.06666667, 0, 1, 1,
0.4185219, 0.06324153, 2.86737, 0.07450981, 0, 1, 1,
0.4215126, -0.2518332, 2.281154, 0.07843138, 0, 1, 1,
0.4224371, 0.8640832, 1.916493, 0.08627451, 0, 1, 1,
0.4281305, 1.575758, -0.5975568, 0.09019608, 0, 1, 1,
0.4304478, 0.1703781, 1.191688, 0.09803922, 0, 1, 1,
0.4353622, -0.1953681, 2.817884, 0.1058824, 0, 1, 1,
0.4379444, -1.361391, 2.282387, 0.1098039, 0, 1, 1,
0.4390264, -1.537896, 2.551594, 0.1176471, 0, 1, 1,
0.4408048, 0.7652326, 0.0192564, 0.1215686, 0, 1, 1,
0.442939, 2.073684, 0.8529508, 0.1294118, 0, 1, 1,
0.4434685, 0.7941279, 0.005758154, 0.1333333, 0, 1, 1,
0.444557, -0.5356723, 2.028347, 0.1411765, 0, 1, 1,
0.44491, -0.2738895, 1.916221, 0.145098, 0, 1, 1,
0.4457582, 0.07769576, 3.184625, 0.1529412, 0, 1, 1,
0.4502005, 0.4607944, 1.71966, 0.1568628, 0, 1, 1,
0.4534814, 0.415468, -0.5569021, 0.1647059, 0, 1, 1,
0.4570565, -0.9398199, 2.346887, 0.1686275, 0, 1, 1,
0.45824, -0.9713792, 2.508803, 0.1764706, 0, 1, 1,
0.458293, 1.156221, -0.7640259, 0.1803922, 0, 1, 1,
0.4647327, -2.740517, 2.49858, 0.1882353, 0, 1, 1,
0.4694267, -1.146148, 0.51539, 0.1921569, 0, 1, 1,
0.4717668, 0.978752, 3.033736, 0.2, 0, 1, 1,
0.4739766, -0.9054416, 1.46824, 0.2078431, 0, 1, 1,
0.474372, 0.2465584, 1.646379, 0.2117647, 0, 1, 1,
0.476749, 1.129823, 1.141394, 0.2196078, 0, 1, 1,
0.4774906, 0.03539537, 2.16687, 0.2235294, 0, 1, 1,
0.4781631, 0.9522065, 0.6370648, 0.2313726, 0, 1, 1,
0.4808771, -1.748552, 1.565712, 0.2352941, 0, 1, 1,
0.4825112, 1.033959, 0.1218337, 0.2431373, 0, 1, 1,
0.4847779, 0.03239269, 0.840665, 0.2470588, 0, 1, 1,
0.4872008, -1.229095, 4.242424, 0.254902, 0, 1, 1,
0.4883847, -1.11778, 4.516453, 0.2588235, 0, 1, 1,
0.4919132, -1.515497, 2.287211, 0.2666667, 0, 1, 1,
0.4966307, -0.249465, 4.365893, 0.2705882, 0, 1, 1,
0.498973, -1.358456, 2.411253, 0.2784314, 0, 1, 1,
0.4998965, 0.4905398, 1.530063, 0.282353, 0, 1, 1,
0.5075775, 1.332562, -1.009318, 0.2901961, 0, 1, 1,
0.5086929, -1.027336, 1.180195, 0.2941177, 0, 1, 1,
0.5321657, -0.8401597, -0.00663726, 0.3019608, 0, 1, 1,
0.5373836, -2.093567, 2.891135, 0.3098039, 0, 1, 1,
0.539448, 0.7783257, 1.593165, 0.3137255, 0, 1, 1,
0.5398982, -0.3973435, 3.14431, 0.3215686, 0, 1, 1,
0.550787, 1.150794, 1.500765, 0.3254902, 0, 1, 1,
0.5515404, 0.3012263, 1.061999, 0.3333333, 0, 1, 1,
0.5527976, 0.8569227, 0.8619718, 0.3372549, 0, 1, 1,
0.5529662, -0.5370657, 2.091856, 0.345098, 0, 1, 1,
0.560181, 0.04896972, 1.996649, 0.3490196, 0, 1, 1,
0.5608062, 0.2533983, -0.324801, 0.3568628, 0, 1, 1,
0.5609308, 0.05324558, 1.485192, 0.3607843, 0, 1, 1,
0.564062, 0.9383454, -0.4856904, 0.3686275, 0, 1, 1,
0.566694, 0.8561847, 1.286678, 0.372549, 0, 1, 1,
0.5744676, 0.02524211, 1.239184, 0.3803922, 0, 1, 1,
0.5776271, 0.7932996, -0.3701884, 0.3843137, 0, 1, 1,
0.5799125, -0.1293479, 2.50413, 0.3921569, 0, 1, 1,
0.584748, 0.5265834, 1.547375, 0.3960784, 0, 1, 1,
0.5862017, -2.309752, 1.973473, 0.4039216, 0, 1, 1,
0.5872715, 0.870389, 0.2834142, 0.4117647, 0, 1, 1,
0.5880933, 1.251152, 2.137995, 0.4156863, 0, 1, 1,
0.5899231, 0.02517154, 1.539331, 0.4235294, 0, 1, 1,
0.5928014, 0.2769138, 0.6914999, 0.427451, 0, 1, 1,
0.6001409, 0.6439555, -0.5379793, 0.4352941, 0, 1, 1,
0.6055219, -0.5608982, 2.072604, 0.4392157, 0, 1, 1,
0.6060113, 0.3528728, -0.02067038, 0.4470588, 0, 1, 1,
0.6117899, -1.104656, 2.048171, 0.4509804, 0, 1, 1,
0.6153634, 1.437484, 0.8959141, 0.4588235, 0, 1, 1,
0.6183932, 1.562265, 1.248675, 0.4627451, 0, 1, 1,
0.625915, 0.3041882, 1.533544, 0.4705882, 0, 1, 1,
0.6275284, -0.2274043, 1.911876, 0.4745098, 0, 1, 1,
0.6289516, -0.9819346, 1.944766, 0.4823529, 0, 1, 1,
0.6297176, 0.1733042, 0.04700552, 0.4862745, 0, 1, 1,
0.6309647, 0.188572, 0.7322103, 0.4941176, 0, 1, 1,
0.6419759, -1.032294, 1.167628, 0.5019608, 0, 1, 1,
0.6436766, -0.4869399, 3.384503, 0.5058824, 0, 1, 1,
0.6446931, 0.9966629, -0.001937896, 0.5137255, 0, 1, 1,
0.6462992, 1.085983, 0.6941097, 0.5176471, 0, 1, 1,
0.6475497, 0.1063112, 1.290338, 0.5254902, 0, 1, 1,
0.6525306, -1.138945, 1.417484, 0.5294118, 0, 1, 1,
0.6529397, 0.1016845, 2.205107, 0.5372549, 0, 1, 1,
0.6576924, -1.726679, 3.290351, 0.5411765, 0, 1, 1,
0.6579552, -0.4243035, 1.249508, 0.5490196, 0, 1, 1,
0.6616464, 1.139194, 1.2812, 0.5529412, 0, 1, 1,
0.6623352, 0.882801, 0.3264821, 0.5607843, 0, 1, 1,
0.6626903, 0.7165732, 0.3243144, 0.5647059, 0, 1, 1,
0.6660959, -1.234031, 0.8613585, 0.572549, 0, 1, 1,
0.6667985, -0.04577088, 1.882083, 0.5764706, 0, 1, 1,
0.6668938, 0.8587558, 1.755248, 0.5843138, 0, 1, 1,
0.6700382, 0.07612406, 0.1778546, 0.5882353, 0, 1, 1,
0.6881043, -1.062672, 1.936196, 0.5960785, 0, 1, 1,
0.6888502, 0.9947168, 0.4050852, 0.6039216, 0, 1, 1,
0.6896471, -1.824956, 2.896164, 0.6078432, 0, 1, 1,
0.7039903, -0.893273, 3.290591, 0.6156863, 0, 1, 1,
0.7057655, 0.3637895, 0.8339486, 0.6196079, 0, 1, 1,
0.7146707, 1.848793, 0.3364403, 0.627451, 0, 1, 1,
0.714819, 0.2529686, 0.7436478, 0.6313726, 0, 1, 1,
0.7231404, 1.319171, 0.02414451, 0.6392157, 0, 1, 1,
0.724131, -1.825759, 3.719566, 0.6431373, 0, 1, 1,
0.7253479, -0.389664, 3.437556, 0.6509804, 0, 1, 1,
0.7302994, 1.150554, -0.02927828, 0.654902, 0, 1, 1,
0.7397899, 0.1801194, 1.579472, 0.6627451, 0, 1, 1,
0.7423779, 0.4077188, -0.1123977, 0.6666667, 0, 1, 1,
0.7451493, 0.3160368, -0.2495624, 0.6745098, 0, 1, 1,
0.7459565, 0.2098821, -0.06427704, 0.6784314, 0, 1, 1,
0.7514403, 1.125494, 2.89082, 0.6862745, 0, 1, 1,
0.7515215, 1.081911, -1.390461, 0.6901961, 0, 1, 1,
0.7554201, -0.517715, 0.2846701, 0.6980392, 0, 1, 1,
0.7559457, -0.06715729, 1.727229, 0.7058824, 0, 1, 1,
0.7561314, 0.4575975, 0.6916257, 0.7098039, 0, 1, 1,
0.765835, 0.9332733, 0.9654821, 0.7176471, 0, 1, 1,
0.7691799, 0.4776361, -0.1743829, 0.7215686, 0, 1, 1,
0.7708152, 1.017001, -0.4433727, 0.7294118, 0, 1, 1,
0.7810599, 0.02582585, 3.904423, 0.7333333, 0, 1, 1,
0.7813737, -2.701873, 4.10429, 0.7411765, 0, 1, 1,
0.7846479, -0.9563199, 3.024737, 0.7450981, 0, 1, 1,
0.7868239, -0.7148715, 2.853342, 0.7529412, 0, 1, 1,
0.7893361, -0.06830622, 3.090197, 0.7568628, 0, 1, 1,
0.7929914, 0.4648164, 1.279655, 0.7647059, 0, 1, 1,
0.7943789, -0.7293098, 2.081089, 0.7686275, 0, 1, 1,
0.7945719, 1.892905, 0.08239642, 0.7764706, 0, 1, 1,
0.7998353, -0.515229, 2.000233, 0.7803922, 0, 1, 1,
0.8030646, -0.2685811, 2.123282, 0.7882353, 0, 1, 1,
0.8045855, 0.7789233, 0.9596686, 0.7921569, 0, 1, 1,
0.80567, -0.4479399, 0.334417, 0.8, 0, 1, 1,
0.8059866, -0.4467998, -0.2026259, 0.8078431, 0, 1, 1,
0.8078912, 0.3592853, 1.020873, 0.8117647, 0, 1, 1,
0.8145407, 1.68285, -0.545185, 0.8196079, 0, 1, 1,
0.8193321, -1.776411, 4.5849, 0.8235294, 0, 1, 1,
0.8270583, 1.815292, -1.179906, 0.8313726, 0, 1, 1,
0.82868, 1.24308, 1.877572, 0.8352941, 0, 1, 1,
0.8347005, -0.810142, 1.820688, 0.8431373, 0, 1, 1,
0.8404201, -1.256296, 4.284148, 0.8470588, 0, 1, 1,
0.8482657, 0.2921657, 1.310515, 0.854902, 0, 1, 1,
0.8485624, 0.7722806, 0.985949, 0.8588235, 0, 1, 1,
0.8528844, 1.305271, 1.025043, 0.8666667, 0, 1, 1,
0.8581256, 0.1631678, 3.124082, 0.8705882, 0, 1, 1,
0.86132, -2.254184, 3.014889, 0.8784314, 0, 1, 1,
0.8679422, -0.3398084, 0.2896072, 0.8823529, 0, 1, 1,
0.8686509, 2.196272, -0.2848631, 0.8901961, 0, 1, 1,
0.8735548, 1.165649, 0.9406117, 0.8941177, 0, 1, 1,
0.8738167, -0.4200996, 1.95089, 0.9019608, 0, 1, 1,
0.8743315, -1.649823, 3.731962, 0.9098039, 0, 1, 1,
0.875583, 1.255626, 2.585725, 0.9137255, 0, 1, 1,
0.8761288, -2.259816, 3.062549, 0.9215686, 0, 1, 1,
0.8799239, -0.8189383, 1.726637, 0.9254902, 0, 1, 1,
0.8913972, -0.686749, 2.789709, 0.9333333, 0, 1, 1,
0.8942171, -0.5457612, 3.270196, 0.9372549, 0, 1, 1,
0.8975829, -1.012604, 2.224359, 0.945098, 0, 1, 1,
0.9017046, 0.2511911, 2.119818, 0.9490196, 0, 1, 1,
0.9101376, 2.011776, -1.330498, 0.9568627, 0, 1, 1,
0.9186707, 0.4764125, 0.08848903, 0.9607843, 0, 1, 1,
0.9216132, 1.858308, 1.294105, 0.9686275, 0, 1, 1,
0.9217767, 1.586095, 0.6561387, 0.972549, 0, 1, 1,
0.9257908, 0.1670287, 0.9382933, 0.9803922, 0, 1, 1,
0.939594, -1.375913, 2.845014, 0.9843137, 0, 1, 1,
0.9468908, -0.06152015, 1.228544, 0.9921569, 0, 1, 1,
0.953783, 0.9863755, -0.1966121, 0.9960784, 0, 1, 1,
0.9628125, -0.3055856, 2.74807, 1, 0, 0.9960784, 1,
0.9728028, 1.016076, 3.006498, 1, 0, 0.9882353, 1,
0.9792033, -1.139989, 1.30727, 1, 0, 0.9843137, 1,
0.9810717, -0.2137303, 2.4445, 1, 0, 0.9764706, 1,
0.9858493, 1.33755, 0.7279303, 1, 0, 0.972549, 1,
0.993071, 0.160831, 2.16596, 1, 0, 0.9647059, 1,
1.007053, -0.08163121, 2.014344, 1, 0, 0.9607843, 1,
1.01132, 1.065967, 1.472116, 1, 0, 0.9529412, 1,
1.014626, -0.2149781, 1.209553, 1, 0, 0.9490196, 1,
1.016558, -0.5707657, 1.507933, 1, 0, 0.9411765, 1,
1.029792, -0.9776236, 2.985568, 1, 0, 0.9372549, 1,
1.034419, -0.5911624, 2.331086, 1, 0, 0.9294118, 1,
1.03491, 1.469418, 1.818454, 1, 0, 0.9254902, 1,
1.038509, 0.7271531, 2.245766, 1, 0, 0.9176471, 1,
1.039838, 0.577433, 2.638474, 1, 0, 0.9137255, 1,
1.042382, 0.422845, 1.332928, 1, 0, 0.9058824, 1,
1.051283, -0.2563196, 1.700912, 1, 0, 0.9019608, 1,
1.054289, -0.316885, 1.951121, 1, 0, 0.8941177, 1,
1.058267, 1.108447, 1.675097, 1, 0, 0.8862745, 1,
1.06392, -1.738718, 2.814449, 1, 0, 0.8823529, 1,
1.066668, -1.488314, 3.349946, 1, 0, 0.8745098, 1,
1.067067, -0.7966859, 2.060467, 1, 0, 0.8705882, 1,
1.067487, 1.434271, -0.715843, 1, 0, 0.8627451, 1,
1.075497, -0.2182372, 0.7536836, 1, 0, 0.8588235, 1,
1.087686, -0.5790617, 1.664052, 1, 0, 0.8509804, 1,
1.089181, -0.2725875, 1.0641, 1, 0, 0.8470588, 1,
1.099006, -0.7203218, 4.21736, 1, 0, 0.8392157, 1,
1.106342, 0.5174084, 2.318415, 1, 0, 0.8352941, 1,
1.115769, -0.295954, 2.393585, 1, 0, 0.827451, 1,
1.12131, 0.6337258, -0.2864268, 1, 0, 0.8235294, 1,
1.124727, 1.517151, 0.2831076, 1, 0, 0.8156863, 1,
1.128356, 0.6099334, 1.104376, 1, 0, 0.8117647, 1,
1.135358, -0.5466467, 0.6716532, 1, 0, 0.8039216, 1,
1.142467, -0.01158369, 0.3985195, 1, 0, 0.7960784, 1,
1.143584, -1.241055, 2.575301, 1, 0, 0.7921569, 1,
1.143764, -0.1300687, 3.274872, 1, 0, 0.7843137, 1,
1.146454, -1.480166, 3.305195, 1, 0, 0.7803922, 1,
1.152609, 1.061869, 0.5832337, 1, 0, 0.772549, 1,
1.153409, -2.059117, 3.428514, 1, 0, 0.7686275, 1,
1.153824, 1.180946, 0.680609, 1, 0, 0.7607843, 1,
1.173866, 0.7019819, 0.8656954, 1, 0, 0.7568628, 1,
1.175944, 1.417566, 1.969586, 1, 0, 0.7490196, 1,
1.176285, 0.6907982, 0.0124216, 1, 0, 0.7450981, 1,
1.176489, -1.239295, 2.266145, 1, 0, 0.7372549, 1,
1.180916, -0.176686, 1.780808, 1, 0, 0.7333333, 1,
1.189027, 0.598977, 1.196621, 1, 0, 0.7254902, 1,
1.191149, 0.7118897, 0.4515789, 1, 0, 0.7215686, 1,
1.191419, 0.5473496, 0.3583313, 1, 0, 0.7137255, 1,
1.19264, 0.3814473, 1.714149, 1, 0, 0.7098039, 1,
1.201879, 1.013867, 3.174994, 1, 0, 0.7019608, 1,
1.20298, -1.589557, 0.6210784, 1, 0, 0.6941177, 1,
1.206534, -0.003881948, 2.223112, 1, 0, 0.6901961, 1,
1.207728, 1.112305, 1.678152, 1, 0, 0.682353, 1,
1.218634, 1.53068, -1.951332, 1, 0, 0.6784314, 1,
1.218805, 0.1463225, 1.227863, 1, 0, 0.6705883, 1,
1.22187, -0.7305106, 1.812702, 1, 0, 0.6666667, 1,
1.223835, -0.6283358, 3.633315, 1, 0, 0.6588235, 1,
1.224186, 0.06744622, 1.541098, 1, 0, 0.654902, 1,
1.226097, -0.6989606, 4.385535, 1, 0, 0.6470588, 1,
1.239374, 1.447403, 1.184813, 1, 0, 0.6431373, 1,
1.242334, 0.2162442, 0.5023164, 1, 0, 0.6352941, 1,
1.255306, -0.8577322, 2.593691, 1, 0, 0.6313726, 1,
1.257442, 0.2730133, 1.202682, 1, 0, 0.6235294, 1,
1.266989, -1.237211, 2.649845, 1, 0, 0.6196079, 1,
1.270017, 0.4747929, 0.6394883, 1, 0, 0.6117647, 1,
1.275931, -0.6091971, 1.930674, 1, 0, 0.6078432, 1,
1.276861, -0.5034208, 1.676857, 1, 0, 0.6, 1,
1.283574, -0.7029743, 1.91205, 1, 0, 0.5921569, 1,
1.283971, 0.1751621, 3.087105, 1, 0, 0.5882353, 1,
1.286213, -0.644958, 2.802515, 1, 0, 0.5803922, 1,
1.295218, -0.04541884, 0.753625, 1, 0, 0.5764706, 1,
1.308333, 0.6864105, 0.9963819, 1, 0, 0.5686275, 1,
1.313823, -1.091807, 1.904228, 1, 0, 0.5647059, 1,
1.315066, 0.06680043, 0.6340807, 1, 0, 0.5568628, 1,
1.337741, 2.938668, 0.714548, 1, 0, 0.5529412, 1,
1.353141, 1.536454, -0.04871653, 1, 0, 0.5450981, 1,
1.365608, -1.092372, 2.732917, 1, 0, 0.5411765, 1,
1.368696, 0.2444949, 2.121136, 1, 0, 0.5333334, 1,
1.376474, -0.7859656, 3.109991, 1, 0, 0.5294118, 1,
1.385087, 0.6237618, 1.587364, 1, 0, 0.5215687, 1,
1.390711, -1.09736, 0.5906825, 1, 0, 0.5176471, 1,
1.393531, -0.6236728, 1.816976, 1, 0, 0.509804, 1,
1.403288, 1.083952, -0.3705532, 1, 0, 0.5058824, 1,
1.403369, -0.3622488, 3.468532, 1, 0, 0.4980392, 1,
1.403482, 0.6410146, 0.5533783, 1, 0, 0.4901961, 1,
1.404905, -0.01776029, 2.110104, 1, 0, 0.4862745, 1,
1.406152, 2.010808, 0.7872409, 1, 0, 0.4784314, 1,
1.409301, -0.0114534, 2.339785, 1, 0, 0.4745098, 1,
1.421042, 1.243587, 2.691033, 1, 0, 0.4666667, 1,
1.423856, -1.049307, 1.456021, 1, 0, 0.4627451, 1,
1.431286, -1.069183, 0.8458141, 1, 0, 0.454902, 1,
1.433308, -1.724471, 3.612936, 1, 0, 0.4509804, 1,
1.447025, 0.8649406, 1.840302, 1, 0, 0.4431373, 1,
1.456341, 0.887197, 2.233708, 1, 0, 0.4392157, 1,
1.459305, -0.5571276, 1.238176, 1, 0, 0.4313726, 1,
1.468339, -0.2359143, 0.5748304, 1, 0, 0.427451, 1,
1.480467, -0.4966102, 1.76666, 1, 0, 0.4196078, 1,
1.493117, -0.107076, 1.773623, 1, 0, 0.4156863, 1,
1.498536, 0.7789112, 1.650198, 1, 0, 0.4078431, 1,
1.508317, -0.2276093, 2.129383, 1, 0, 0.4039216, 1,
1.513459, -0.2327997, 2.516938, 1, 0, 0.3960784, 1,
1.528043, 0.3402057, 1.66404, 1, 0, 0.3882353, 1,
1.530283, 1.012581, 0.06641854, 1, 0, 0.3843137, 1,
1.530883, 0.6459352, 0.5736798, 1, 0, 0.3764706, 1,
1.531561, 0.3450617, 2.803267, 1, 0, 0.372549, 1,
1.543187, -1.237922, 0.7733068, 1, 0, 0.3647059, 1,
1.549919, 0.4534741, 0.4997046, 1, 0, 0.3607843, 1,
1.550826, 0.509136, 0.8766131, 1, 0, 0.3529412, 1,
1.554443, 0.1339776, 0.5535448, 1, 0, 0.3490196, 1,
1.575353, -2.127918, 2.861597, 1, 0, 0.3411765, 1,
1.590602, 0.05669637, 1.247916, 1, 0, 0.3372549, 1,
1.595179, 0.1132515, 2.410774, 1, 0, 0.3294118, 1,
1.595897, -0.346868, 1.531673, 1, 0, 0.3254902, 1,
1.629361, -2.373976, 3.334719, 1, 0, 0.3176471, 1,
1.632367, 0.6674078, 1.857298, 1, 0, 0.3137255, 1,
1.640039, 0.3660442, 0.3272206, 1, 0, 0.3058824, 1,
1.643411, -0.6280088, 2.086784, 1, 0, 0.2980392, 1,
1.656994, 1.744805, 1.250307, 1, 0, 0.2941177, 1,
1.665903, -0.5160959, 1.23277, 1, 0, 0.2862745, 1,
1.670372, -0.9465872, 1.625892, 1, 0, 0.282353, 1,
1.692817, 1.370842, 0.542343, 1, 0, 0.2745098, 1,
1.708152, 0.7572355, 1.351376, 1, 0, 0.2705882, 1,
1.716672, 0.9442357, 0.4708927, 1, 0, 0.2627451, 1,
1.722116, 0.3072633, 4.557621, 1, 0, 0.2588235, 1,
1.736179, 1.342339, 1.988146, 1, 0, 0.2509804, 1,
1.739831, 0.5183988, 2.553729, 1, 0, 0.2470588, 1,
1.753526, 1.186395, -1.791341, 1, 0, 0.2392157, 1,
1.771474, -0.2029897, 2.707607, 1, 0, 0.2352941, 1,
1.804228, -0.1017657, 1.364271, 1, 0, 0.227451, 1,
1.813113, -1.58106, 1.921945, 1, 0, 0.2235294, 1,
1.819861, 0.1500651, 1.614087, 1, 0, 0.2156863, 1,
1.827239, 1.287389, 1.483248, 1, 0, 0.2117647, 1,
1.831501, 2.069754, 0.649215, 1, 0, 0.2039216, 1,
1.858201, 0.7854385, -0.7498048, 1, 0, 0.1960784, 1,
1.871068, -0.1504169, 0.9401381, 1, 0, 0.1921569, 1,
1.877889, 1.160555, -0.3181277, 1, 0, 0.1843137, 1,
1.90624, -0.8989304, 2.480388, 1, 0, 0.1803922, 1,
1.939463, -0.309467, 2.097594, 1, 0, 0.172549, 1,
1.940397, 1.036281, -0.4187331, 1, 0, 0.1686275, 1,
1.977602, -0.3262786, -1.04557, 1, 0, 0.1607843, 1,
1.994752, -1.122363, 2.881936, 1, 0, 0.1568628, 1,
2.007754, -1.683977, 1.516221, 1, 0, 0.1490196, 1,
2.008754, -0.4305022, 3.629375, 1, 0, 0.145098, 1,
2.014112, -0.3322838, 1.664813, 1, 0, 0.1372549, 1,
2.045879, 0.03532615, 2.108521, 1, 0, 0.1333333, 1,
2.063247, -0.9221568, 2.124432, 1, 0, 0.1254902, 1,
2.187909, -3.021597, 2.850092, 1, 0, 0.1215686, 1,
2.21644, 0.6531335, 3.65429, 1, 0, 0.1137255, 1,
2.223139, -0.01819547, 2.08232, 1, 0, 0.1098039, 1,
2.256193, 0.9269345, 1.198987, 1, 0, 0.1019608, 1,
2.284877, 0.9263834, 0.4330291, 1, 0, 0.09411765, 1,
2.309418, -0.3113076, 0.7031904, 1, 0, 0.09019608, 1,
2.314332, -0.2494715, 2.123505, 1, 0, 0.08235294, 1,
2.346691, -0.6935886, 3.336286, 1, 0, 0.07843138, 1,
2.365389, 0.5497831, 2.731302, 1, 0, 0.07058824, 1,
2.482123, -0.7917296, 2.658448, 1, 0, 0.06666667, 1,
2.684389, -0.7452976, 3.111782, 1, 0, 0.05882353, 1,
2.731606, 0.0134169, 2.913772, 1, 0, 0.05490196, 1,
2.746132, 1.152238, 1.724022, 1, 0, 0.04705882, 1,
2.794209, 1.223934, 0.9921513, 1, 0, 0.04313726, 1,
2.802767, -3.0834, 3.850967, 1, 0, 0.03529412, 1,
2.814228, -1.275857, 0.8638688, 1, 0, 0.03137255, 1,
2.818131, -1.443909, 3.455883, 1, 0, 0.02352941, 1,
2.823517, 0.07026435, 2.615002, 1, 0, 0.01960784, 1,
2.920576, -1.695246, 3.112007, 1, 0, 0.01176471, 1,
3.446986, 0.3094268, 0.8135125, 1, 0, 0.007843138, 1
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
0.2425181, -4.406435, -6.794887, 0, -0.5, 0.5, 0.5,
0.2425181, -4.406435, -6.794887, 1, -0.5, 0.5, 0.5,
0.2425181, -4.406435, -6.794887, 1, 1.5, 0.5, 0.5,
0.2425181, -4.406435, -6.794887, 0, 1.5, 0.5, 0.5
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
-4.048265, 0.1988704, -6.794887, 0, -0.5, 0.5, 0.5,
-4.048265, 0.1988704, -6.794887, 1, -0.5, 0.5, 0.5,
-4.048265, 0.1988704, -6.794887, 1, 1.5, 0.5, 0.5,
-4.048265, 0.1988704, -6.794887, 0, 1.5, 0.5, 0.5
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
-4.048265, -4.406435, 0.5205193, 0, -0.5, 0.5, 0.5,
-4.048265, -4.406435, 0.5205193, 1, -0.5, 0.5, 0.5,
-4.048265, -4.406435, 0.5205193, 1, 1.5, 0.5, 0.5,
-4.048265, -4.406435, 0.5205193, 0, 1.5, 0.5, 0.5
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
-2, -3.343672, -5.106716,
3, -3.343672, -5.106716,
-2, -3.343672, -5.106716,
-2, -3.520799, -5.388078,
-1, -3.343672, -5.106716,
-1, -3.520799, -5.388078,
0, -3.343672, -5.106716,
0, -3.520799, -5.388078,
1, -3.343672, -5.106716,
1, -3.520799, -5.388078,
2, -3.343672, -5.106716,
2, -3.520799, -5.388078,
3, -3.343672, -5.106716,
3, -3.520799, -5.388078
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
-2, -3.875053, -5.950801, 0, -0.5, 0.5, 0.5,
-2, -3.875053, -5.950801, 1, -0.5, 0.5, 0.5,
-2, -3.875053, -5.950801, 1, 1.5, 0.5, 0.5,
-2, -3.875053, -5.950801, 0, 1.5, 0.5, 0.5,
-1, -3.875053, -5.950801, 0, -0.5, 0.5, 0.5,
-1, -3.875053, -5.950801, 1, -0.5, 0.5, 0.5,
-1, -3.875053, -5.950801, 1, 1.5, 0.5, 0.5,
-1, -3.875053, -5.950801, 0, 1.5, 0.5, 0.5,
0, -3.875053, -5.950801, 0, -0.5, 0.5, 0.5,
0, -3.875053, -5.950801, 1, -0.5, 0.5, 0.5,
0, -3.875053, -5.950801, 1, 1.5, 0.5, 0.5,
0, -3.875053, -5.950801, 0, 1.5, 0.5, 0.5,
1, -3.875053, -5.950801, 0, -0.5, 0.5, 0.5,
1, -3.875053, -5.950801, 1, -0.5, 0.5, 0.5,
1, -3.875053, -5.950801, 1, 1.5, 0.5, 0.5,
1, -3.875053, -5.950801, 0, 1.5, 0.5, 0.5,
2, -3.875053, -5.950801, 0, -0.5, 0.5, 0.5,
2, -3.875053, -5.950801, 1, -0.5, 0.5, 0.5,
2, -3.875053, -5.950801, 1, 1.5, 0.5, 0.5,
2, -3.875053, -5.950801, 0, 1.5, 0.5, 0.5,
3, -3.875053, -5.950801, 0, -0.5, 0.5, 0.5,
3, -3.875053, -5.950801, 1, -0.5, 0.5, 0.5,
3, -3.875053, -5.950801, 1, 1.5, 0.5, 0.5,
3, -3.875053, -5.950801, 0, 1.5, 0.5, 0.5
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
-3.058084, -3, -5.106716,
-3.058084, 3, -5.106716,
-3.058084, -3, -5.106716,
-3.223114, -3, -5.388078,
-3.058084, -2, -5.106716,
-3.223114, -2, -5.388078,
-3.058084, -1, -5.106716,
-3.223114, -1, -5.388078,
-3.058084, 0, -5.106716,
-3.223114, 0, -5.388078,
-3.058084, 1, -5.106716,
-3.223114, 1, -5.388078,
-3.058084, 2, -5.106716,
-3.223114, 2, -5.388078,
-3.058084, 3, -5.106716,
-3.223114, 3, -5.388078
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
-3.553175, -3, -5.950801, 0, -0.5, 0.5, 0.5,
-3.553175, -3, -5.950801, 1, -0.5, 0.5, 0.5,
-3.553175, -3, -5.950801, 1, 1.5, 0.5, 0.5,
-3.553175, -3, -5.950801, 0, 1.5, 0.5, 0.5,
-3.553175, -2, -5.950801, 0, -0.5, 0.5, 0.5,
-3.553175, -2, -5.950801, 1, -0.5, 0.5, 0.5,
-3.553175, -2, -5.950801, 1, 1.5, 0.5, 0.5,
-3.553175, -2, -5.950801, 0, 1.5, 0.5, 0.5,
-3.553175, -1, -5.950801, 0, -0.5, 0.5, 0.5,
-3.553175, -1, -5.950801, 1, -0.5, 0.5, 0.5,
-3.553175, -1, -5.950801, 1, 1.5, 0.5, 0.5,
-3.553175, -1, -5.950801, 0, 1.5, 0.5, 0.5,
-3.553175, 0, -5.950801, 0, -0.5, 0.5, 0.5,
-3.553175, 0, -5.950801, 1, -0.5, 0.5, 0.5,
-3.553175, 0, -5.950801, 1, 1.5, 0.5, 0.5,
-3.553175, 0, -5.950801, 0, 1.5, 0.5, 0.5,
-3.553175, 1, -5.950801, 0, -0.5, 0.5, 0.5,
-3.553175, 1, -5.950801, 1, -0.5, 0.5, 0.5,
-3.553175, 1, -5.950801, 1, 1.5, 0.5, 0.5,
-3.553175, 1, -5.950801, 0, 1.5, 0.5, 0.5,
-3.553175, 2, -5.950801, 0, -0.5, 0.5, 0.5,
-3.553175, 2, -5.950801, 1, -0.5, 0.5, 0.5,
-3.553175, 2, -5.950801, 1, 1.5, 0.5, 0.5,
-3.553175, 2, -5.950801, 0, 1.5, 0.5, 0.5,
-3.553175, 3, -5.950801, 0, -0.5, 0.5, 0.5,
-3.553175, 3, -5.950801, 1, -0.5, 0.5, 0.5,
-3.553175, 3, -5.950801, 1, 1.5, 0.5, 0.5,
-3.553175, 3, -5.950801, 0, 1.5, 0.5, 0.5
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
-3.058084, -3.343672, -4,
-3.058084, -3.343672, 4,
-3.058084, -3.343672, -4,
-3.223114, -3.520799, -4,
-3.058084, -3.343672, -2,
-3.223114, -3.520799, -2,
-3.058084, -3.343672, 0,
-3.223114, -3.520799, 0,
-3.058084, -3.343672, 2,
-3.223114, -3.520799, 2,
-3.058084, -3.343672, 4,
-3.223114, -3.520799, 4
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
-3.553175, -3.875053, -4, 0, -0.5, 0.5, 0.5,
-3.553175, -3.875053, -4, 1, -0.5, 0.5, 0.5,
-3.553175, -3.875053, -4, 1, 1.5, 0.5, 0.5,
-3.553175, -3.875053, -4, 0, 1.5, 0.5, 0.5,
-3.553175, -3.875053, -2, 0, -0.5, 0.5, 0.5,
-3.553175, -3.875053, -2, 1, -0.5, 0.5, 0.5,
-3.553175, -3.875053, -2, 1, 1.5, 0.5, 0.5,
-3.553175, -3.875053, -2, 0, 1.5, 0.5, 0.5,
-3.553175, -3.875053, 0, 0, -0.5, 0.5, 0.5,
-3.553175, -3.875053, 0, 1, -0.5, 0.5, 0.5,
-3.553175, -3.875053, 0, 1, 1.5, 0.5, 0.5,
-3.553175, -3.875053, 0, 0, 1.5, 0.5, 0.5,
-3.553175, -3.875053, 2, 0, -0.5, 0.5, 0.5,
-3.553175, -3.875053, 2, 1, -0.5, 0.5, 0.5,
-3.553175, -3.875053, 2, 1, 1.5, 0.5, 0.5,
-3.553175, -3.875053, 2, 0, 1.5, 0.5, 0.5,
-3.553175, -3.875053, 4, 0, -0.5, 0.5, 0.5,
-3.553175, -3.875053, 4, 1, -0.5, 0.5, 0.5,
-3.553175, -3.875053, 4, 1, 1.5, 0.5, 0.5,
-3.553175, -3.875053, 4, 0, 1.5, 0.5, 0.5
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
-3.058084, -3.343672, -5.106716,
-3.058084, 3.741413, -5.106716,
-3.058084, -3.343672, 6.147754,
-3.058084, 3.741413, 6.147754,
-3.058084, -3.343672, -5.106716,
-3.058084, -3.343672, 6.147754,
-3.058084, 3.741413, -5.106716,
-3.058084, 3.741413, 6.147754,
-3.058084, -3.343672, -5.106716,
3.54312, -3.343672, -5.106716,
-3.058084, -3.343672, 6.147754,
3.54312, -3.343672, 6.147754,
-3.058084, 3.741413, -5.106716,
3.54312, 3.741413, -5.106716,
-3.058084, 3.741413, 6.147754,
3.54312, 3.741413, 6.147754,
3.54312, -3.343672, -5.106716,
3.54312, 3.741413, -5.106716,
3.54312, -3.343672, 6.147754,
3.54312, 3.741413, 6.147754,
3.54312, -3.343672, -5.106716,
3.54312, -3.343672, 6.147754,
3.54312, 3.741413, -5.106716,
3.54312, 3.741413, 6.147754
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
var radius = 7.928082;
var distance = 35.27293;
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
mvMatrix.translate( -0.2425181, -0.1988704, -0.5205193 );
mvMatrix.scale( 1.29855, 1.209865, 0.7616527 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.27293);
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
Vinclozolin<-read.table("Vinclozolin.xyz")
```

```
## Error in read.table("Vinclozolin.xyz"): no lines available in input
```

```r
x<-Vinclozolin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Vinclozolin' not found
```

```r
y<-Vinclozolin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Vinclozolin' not found
```

```r
z<-Vinclozolin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Vinclozolin' not found
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
-2.96195, -0.3498105, -1.584437, 0, 0, 1, 1, 1,
-2.884291, -0.1276697, -1.064466, 1, 0, 0, 1, 1,
-2.847574, 0.3092379, -0.7439278, 1, 0, 0, 1, 1,
-2.828793, 0.5480331, -1.706175, 1, 0, 0, 1, 1,
-2.805081, 1.263311, -1.020197, 1, 0, 0, 1, 1,
-2.791854, 1.000718, -1.194362, 1, 0, 0, 1, 1,
-2.77211, 0.6463481, -1.398425, 0, 0, 0, 1, 1,
-2.719227, -0.6467813, -2.014957, 0, 0, 0, 1, 1,
-2.708583, 0.06318171, -0.5104752, 0, 0, 0, 1, 1,
-2.484853, 0.8029616, -0.7771712, 0, 0, 0, 1, 1,
-2.358159, 0.3558284, -0.4395059, 0, 0, 0, 1, 1,
-2.275486, -0.5668923, -0.8061452, 0, 0, 0, 1, 1,
-2.260842, -1.259605, -1.959921, 0, 0, 0, 1, 1,
-2.214695, 1.333775, -1.071998, 1, 1, 1, 1, 1,
-2.149452, -2.614295, -1.870373, 1, 1, 1, 1, 1,
-2.147339, 1.377592, -1.616672, 1, 1, 1, 1, 1,
-2.117102, 1.134453, -1.399767, 1, 1, 1, 1, 1,
-2.112636, -2.475469, -2.761566, 1, 1, 1, 1, 1,
-2.107456, -0.2196663, -1.184695, 1, 1, 1, 1, 1,
-2.102698, -1.591366, -0.8851073, 1, 1, 1, 1, 1,
-2.088202, 1.122608, -1.80505, 1, 1, 1, 1, 1,
-2.062861, 0.1250912, -0.02747276, 1, 1, 1, 1, 1,
-2.055028, 1.122677, -3.048399, 1, 1, 1, 1, 1,
-2.036696, 0.6590096, -0.8058546, 1, 1, 1, 1, 1,
-2.034476, -0.7582335, -0.3574536, 1, 1, 1, 1, 1,
-2.021601, -1.265903, -1.153502, 1, 1, 1, 1, 1,
-2.010741, 0.8690377, -0.6639812, 1, 1, 1, 1, 1,
-1.973784, 0.4166454, -2.843555, 1, 1, 1, 1, 1,
-1.911675, 0.6645086, -1.882451, 0, 0, 1, 1, 1,
-1.882899, 0.7736933, -0.5035251, 1, 0, 0, 1, 1,
-1.874423, 2.035936, -0.1030063, 1, 0, 0, 1, 1,
-1.842691, 0.3459136, -1.958912, 1, 0, 0, 1, 1,
-1.840665, 1.209658, -1.100892, 1, 0, 0, 1, 1,
-1.840439, 1.13023, -0.1027928, 1, 0, 0, 1, 1,
-1.831381, -1.014159, -2.920937, 0, 0, 0, 1, 1,
-1.825477, 0.2216769, -1.089491, 0, 0, 0, 1, 1,
-1.811674, 0.4444608, -1.571997, 0, 0, 0, 1, 1,
-1.794565, -0.8570677, -1.908355, 0, 0, 0, 1, 1,
-1.786325, -1.256417, -3.266788, 0, 0, 0, 1, 1,
-1.786249, 1.10144, -2.879363, 0, 0, 0, 1, 1,
-1.7732, -0.3762034, -2.653529, 0, 0, 0, 1, 1,
-1.767038, -0.1312301, -1.219016, 1, 1, 1, 1, 1,
-1.764203, -0.1514139, -0.9297362, 1, 1, 1, 1, 1,
-1.749053, 0.6132851, -0.4475275, 1, 1, 1, 1, 1,
-1.744992, 0.0132683, -1.176426, 1, 1, 1, 1, 1,
-1.731874, 0.08540072, -2.291271, 1, 1, 1, 1, 1,
-1.722473, 0.48877, 0.1035415, 1, 1, 1, 1, 1,
-1.718342, -0.3078989, 0.08583296, 1, 1, 1, 1, 1,
-1.70763, -0.96548, -0.7181997, 1, 1, 1, 1, 1,
-1.696385, 0.3167886, -0.8401902, 1, 1, 1, 1, 1,
-1.683902, 0.5008382, -3.603658, 1, 1, 1, 1, 1,
-1.679114, 1.090016, -0.1872991, 1, 1, 1, 1, 1,
-1.648256, 0.3412539, -1.520535, 1, 1, 1, 1, 1,
-1.639455, 0.5193562, -1.5257, 1, 1, 1, 1, 1,
-1.634145, 0.5044831, 0.3117263, 1, 1, 1, 1, 1,
-1.627295, 2.474013, -1.739248, 1, 1, 1, 1, 1,
-1.615156, -3.240491, -1.993318, 0, 0, 1, 1, 1,
-1.610214, -0.5220469, -2.29476, 1, 0, 0, 1, 1,
-1.605489, -0.3408657, -2.33221, 1, 0, 0, 1, 1,
-1.60448, 1.533926, -2.412279, 1, 0, 0, 1, 1,
-1.588341, -1.124953, -2.600102, 1, 0, 0, 1, 1,
-1.574759, 0.01179886, -2.063545, 1, 0, 0, 1, 1,
-1.559729, 1.414795, 1.605809, 0, 0, 0, 1, 1,
-1.554415, -1.089267, -1.23681, 0, 0, 0, 1, 1,
-1.549344, -0.05851689, -0.1699181, 0, 0, 0, 1, 1,
-1.529533, -1.37184, -3.170391, 0, 0, 0, 1, 1,
-1.50213, 0.9348432, -1.435544, 0, 0, 0, 1, 1,
-1.498388, -0.4686226, -1.61006, 0, 0, 0, 1, 1,
-1.486604, -0.4273637, -1.861906, 0, 0, 0, 1, 1,
-1.476536, 0.7997266, -0.3822554, 1, 1, 1, 1, 1,
-1.471009, 2.018851, -1.127889, 1, 1, 1, 1, 1,
-1.464154, 1.633119, 0.6545975, 1, 1, 1, 1, 1,
-1.461951, -0.7793481, -2.480758, 1, 1, 1, 1, 1,
-1.457752, -0.009575522, -2.536494, 1, 1, 1, 1, 1,
-1.456036, 0.3592877, -3.055946, 1, 1, 1, 1, 1,
-1.455601, 0.9435221, -1.055583, 1, 1, 1, 1, 1,
-1.449481, 0.3861669, -0.1069634, 1, 1, 1, 1, 1,
-1.447018, -1.113115, -2.593685, 1, 1, 1, 1, 1,
-1.443432, -0.6274118, -3.859088, 1, 1, 1, 1, 1,
-1.442811, 1.676755, -0.6355419, 1, 1, 1, 1, 1,
-1.430322, -1.191873, -2.717767, 1, 1, 1, 1, 1,
-1.421584, 0.7487796, -1.176009, 1, 1, 1, 1, 1,
-1.410049, 0.1324243, -1.49352, 1, 1, 1, 1, 1,
-1.404613, -0.1024848, -1.730447, 1, 1, 1, 1, 1,
-1.404367, 0.0266232, -0.9157112, 0, 0, 1, 1, 1,
-1.39905, -0.7372677, -1.790923, 1, 0, 0, 1, 1,
-1.399036, 3.638232, -0.7933527, 1, 0, 0, 1, 1,
-1.392531, 0.09948677, -0.9030814, 1, 0, 0, 1, 1,
-1.374162, 0.1462442, -1.33908, 1, 0, 0, 1, 1,
-1.373794, -0.5185067, -0.6615128, 1, 0, 0, 1, 1,
-1.356875, -1.539157, -2.108531, 0, 0, 0, 1, 1,
-1.356698, -1.382763, -2.667995, 0, 0, 0, 1, 1,
-1.351538, 1.83342, 0.5072645, 0, 0, 0, 1, 1,
-1.344589, 1.697843, -0.7835712, 0, 0, 0, 1, 1,
-1.339628, 0.9250156, -1.035622, 0, 0, 0, 1, 1,
-1.338693, 1.253096, -0.9581714, 0, 0, 0, 1, 1,
-1.336894, -0.1744619, -3.008462, 0, 0, 0, 1, 1,
-1.332168, -0.1602459, -2.651423, 1, 1, 1, 1, 1,
-1.31893, -0.3243452, -2.067463, 1, 1, 1, 1, 1,
-1.318693, 0.04202196, -2.74036, 1, 1, 1, 1, 1,
-1.314858, -0.7143985, -1.175053, 1, 1, 1, 1, 1,
-1.309474, 0.05915387, -1.44975, 1, 1, 1, 1, 1,
-1.305467, 1.071158, -0.7106353, 1, 1, 1, 1, 1,
-1.280044, 0.05219553, -2.924806, 1, 1, 1, 1, 1,
-1.277873, -0.6514844, -1.735516, 1, 1, 1, 1, 1,
-1.268445, 0.1203392, -1.111244, 1, 1, 1, 1, 1,
-1.252878, -1.366317, -1.740433, 1, 1, 1, 1, 1,
-1.25191, -0.4444726, -1.147426, 1, 1, 1, 1, 1,
-1.249762, 1.152241, 0.1302972, 1, 1, 1, 1, 1,
-1.248259, 0.8696444, -0.9946664, 1, 1, 1, 1, 1,
-1.248239, 1.206532, -0.6184399, 1, 1, 1, 1, 1,
-1.247954, -0.5729941, -0.2682308, 1, 1, 1, 1, 1,
-1.244592, 1.098385, -0.5774815, 0, 0, 1, 1, 1,
-1.240045, 2.242866, -2.354992, 1, 0, 0, 1, 1,
-1.232558, 1.321876, -0.5546162, 1, 0, 0, 1, 1,
-1.221098, -1.540088, -2.750698, 1, 0, 0, 1, 1,
-1.21637, 0.2624515, -3.100551, 1, 0, 0, 1, 1,
-1.214852, -1.893731, -3.139937, 1, 0, 0, 1, 1,
-1.214591, -0.633822, -0.8571309, 0, 0, 0, 1, 1,
-1.21418, 0.1889477, -2.630964, 0, 0, 0, 1, 1,
-1.213351, -1.212226, -2.517452, 0, 0, 0, 1, 1,
-1.2054, 0.7684283, 0.05505202, 0, 0, 0, 1, 1,
-1.202413, -1.303158, -0.7167641, 0, 0, 0, 1, 1,
-1.194668, 1.589118, -1.369219, 0, 0, 0, 1, 1,
-1.191063, 0.4275171, -0.7588056, 0, 0, 0, 1, 1,
-1.190999, -0.1030831, -2.019889, 1, 1, 1, 1, 1,
-1.190759, 0.1780419, -0.7287508, 1, 1, 1, 1, 1,
-1.189395, -0.09428379, -2.097103, 1, 1, 1, 1, 1,
-1.186818, 1.755487, 0.8772024, 1, 1, 1, 1, 1,
-1.185966, 1.165212, -1.619992, 1, 1, 1, 1, 1,
-1.181606, -0.6645734, -1.079883, 1, 1, 1, 1, 1,
-1.179501, 0.03442651, -2.083375, 1, 1, 1, 1, 1,
-1.179404, -0.586009, -1.272163, 1, 1, 1, 1, 1,
-1.164814, -0.7006404, -2.399051, 1, 1, 1, 1, 1,
-1.162467, 0.04878566, -0.8148537, 1, 1, 1, 1, 1,
-1.155868, -0.3808181, -1.102102, 1, 1, 1, 1, 1,
-1.155557, -1.549087, -3.168943, 1, 1, 1, 1, 1,
-1.144771, 0.3009403, -0.6756256, 1, 1, 1, 1, 1,
-1.144301, -0.2459103, -3.910686, 1, 1, 1, 1, 1,
-1.132784, 1.10103, 0.1767851, 1, 1, 1, 1, 1,
-1.125464, 0.3827229, -2.834723, 0, 0, 1, 1, 1,
-1.1077, -0.3291799, -0.4610316, 1, 0, 0, 1, 1,
-1.096918, -0.3709002, -1.58231, 1, 0, 0, 1, 1,
-1.090364, -0.4963058, -2.840538, 1, 0, 0, 1, 1,
-1.075727, 0.5040353, -1.840682, 1, 0, 0, 1, 1,
-1.073468, 0.5761827, 0.3951232, 1, 0, 0, 1, 1,
-1.07278, -0.8997794, -1.239024, 0, 0, 0, 1, 1,
-1.070196, -1.498802, -1.550958, 0, 0, 0, 1, 1,
-1.061738, 1.569338, -2.723039, 0, 0, 0, 1, 1,
-1.061606, 0.3971169, -1.227042, 0, 0, 0, 1, 1,
-1.054071, -0.3124876, -0.7803447, 0, 0, 0, 1, 1,
-1.048204, 0.3032691, -1.605015, 0, 0, 0, 1, 1,
-1.04814, 0.1955825, -0.8978274, 0, 0, 0, 1, 1,
-1.039065, -0.07600108, -2.365461, 1, 1, 1, 1, 1,
-1.038543, -0.3854716, -0.8006773, 1, 1, 1, 1, 1,
-1.028621, 2.348594, -0.2717707, 1, 1, 1, 1, 1,
-1.024016, 0.5198106, -2.661791, 1, 1, 1, 1, 1,
-1.017351, -1.841272, -4.409708, 1, 1, 1, 1, 1,
-1.013594, 0.0595924, -1.449668, 1, 1, 1, 1, 1,
-1.013343, 0.6287171, -0.8979152, 1, 1, 1, 1, 1,
-1.011927, 0.3529635, -1.950567, 1, 1, 1, 1, 1,
-1.004039, -0.7214608, -1.715446, 1, 1, 1, 1, 1,
-1.000542, -0.2202986, -2.247818, 1, 1, 1, 1, 1,
-0.9954563, 0.9797136, -1.432577, 1, 1, 1, 1, 1,
-0.9905309, -1.105181, -1.496728, 1, 1, 1, 1, 1,
-0.9884353, 0.07298645, -3.745878, 1, 1, 1, 1, 1,
-0.9816547, -0.4718736, -2.375049, 1, 1, 1, 1, 1,
-0.9805496, 1.094807, -1.853356, 1, 1, 1, 1, 1,
-0.9762079, 0.5276906, 0.5897259, 0, 0, 1, 1, 1,
-0.9740967, 0.6677415, -2.21003, 1, 0, 0, 1, 1,
-0.9718432, -0.0712387, -2.100704, 1, 0, 0, 1, 1,
-0.9708139, -1.69749, -3.250117, 1, 0, 0, 1, 1,
-0.9692506, 0.03052506, 0.04568358, 1, 0, 0, 1, 1,
-0.9611068, 0.4145938, -0.9879382, 1, 0, 0, 1, 1,
-0.9538735, 0.2410249, -2.875505, 0, 0, 0, 1, 1,
-0.9513741, -0.06319915, -0.2966328, 0, 0, 0, 1, 1,
-0.949544, 0.1888781, -1.749641, 0, 0, 0, 1, 1,
-0.9449654, 0.2863642, -1.312287, 0, 0, 0, 1, 1,
-0.9389737, 0.3577477, -0.9825901, 0, 0, 0, 1, 1,
-0.9371301, -0.02051705, -3.179048, 0, 0, 0, 1, 1,
-0.935811, 0.2664438, -0.3837663, 0, 0, 0, 1, 1,
-0.9354019, -1.252001, -0.2900383, 1, 1, 1, 1, 1,
-0.9350768, 0.4639364, 0.6221863, 1, 1, 1, 1, 1,
-0.9350302, -1.134404, -3.635786, 1, 1, 1, 1, 1,
-0.9322256, -1.210427, -1.080851, 1, 1, 1, 1, 1,
-0.9298378, -1.690027, -3.14955, 1, 1, 1, 1, 1,
-0.9238994, 1.074332, 0.1203356, 1, 1, 1, 1, 1,
-0.9202198, 1.679361, -0.551295, 1, 1, 1, 1, 1,
-0.9187716, -0.6867206, -2.549311, 1, 1, 1, 1, 1,
-0.9184232, 0.7714775, -0.738139, 1, 1, 1, 1, 1,
-0.902857, 0.4769266, -0.1856299, 1, 1, 1, 1, 1,
-0.9028504, 0.2940714, -0.2036758, 1, 1, 1, 1, 1,
-0.8963796, 0.08779974, -0.3067577, 1, 1, 1, 1, 1,
-0.893617, 1.667384, -1.269162, 1, 1, 1, 1, 1,
-0.892971, 2.972006, 0.3575658, 1, 1, 1, 1, 1,
-0.892372, -0.237063, -1.757728, 1, 1, 1, 1, 1,
-0.8905469, 0.1928325, -1.17772, 0, 0, 1, 1, 1,
-0.8903821, -2.132623, -1.4886, 1, 0, 0, 1, 1,
-0.8778292, -1.357634, -2.508905, 1, 0, 0, 1, 1,
-0.8671265, -0.785129, -2.994246, 1, 0, 0, 1, 1,
-0.8661881, 0.04498868, 0.5288759, 1, 0, 0, 1, 1,
-0.8609822, -1.670924, -2.073129, 1, 0, 0, 1, 1,
-0.853691, 1.428195, -0.9202891, 0, 0, 0, 1, 1,
-0.8476712, -0.9452694, -3.396218, 0, 0, 0, 1, 1,
-0.8447175, -3.007396, -3.01085, 0, 0, 0, 1, 1,
-0.8429686, -0.2257589, -0.7548766, 0, 0, 0, 1, 1,
-0.8410941, 0.3285804, -0.7753706, 0, 0, 0, 1, 1,
-0.8375548, -0.9867825, -2.488497, 0, 0, 0, 1, 1,
-0.8330498, -1.001125, -1.399645, 0, 0, 0, 1, 1,
-0.8325369, -0.139251, -3.344724, 1, 1, 1, 1, 1,
-0.8291681, 0.4599757, -1.797632, 1, 1, 1, 1, 1,
-0.8285936, -1.569991, -3.38806, 1, 1, 1, 1, 1,
-0.8259436, -1.088694, -3.192273, 1, 1, 1, 1, 1,
-0.8236721, 0.6540056, -2.275505, 1, 1, 1, 1, 1,
-0.8211917, 0.3312503, -1.53326, 1, 1, 1, 1, 1,
-0.8099563, -2.73184, -3.313441, 1, 1, 1, 1, 1,
-0.8067112, -0.08682479, -2.194892, 1, 1, 1, 1, 1,
-0.8054716, 0.4217702, 0.8062202, 1, 1, 1, 1, 1,
-0.7970441, -0.3668711, -0.6681137, 1, 1, 1, 1, 1,
-0.7967457, 0.3486007, -1.198849, 1, 1, 1, 1, 1,
-0.7908983, 0.5329767, -0.7016741, 1, 1, 1, 1, 1,
-0.7906904, -0.650175, -1.771512, 1, 1, 1, 1, 1,
-0.7853655, -0.6191114, -1.440171, 1, 1, 1, 1, 1,
-0.7821705, -0.4463096, -1.650678, 1, 1, 1, 1, 1,
-0.7774937, 2.100813, -1.30645, 0, 0, 1, 1, 1,
-0.7770641, 1.3763, -1.597646, 1, 0, 0, 1, 1,
-0.7708541, 1.839669, 0.2832223, 1, 0, 0, 1, 1,
-0.7510631, -1.078787, -4.176751, 1, 0, 0, 1, 1,
-0.7489904, 1.261188, -0.3360188, 1, 0, 0, 1, 1,
-0.7479858, 0.1644315, 0.4527308, 1, 0, 0, 1, 1,
-0.746444, -0.7102984, -1.351915, 0, 0, 0, 1, 1,
-0.7458399, -2.56711, -1.60079, 0, 0, 0, 1, 1,
-0.7397885, 0.1155278, -0.6658502, 0, 0, 0, 1, 1,
-0.7349733, -2.269549, -2.218228, 0, 0, 0, 1, 1,
-0.7327096, 2.253376, -2.923442, 0, 0, 0, 1, 1,
-0.7323758, -0.01700644, -3.805209, 0, 0, 0, 1, 1,
-0.7305841, 0.6477472, -0.7147695, 0, 0, 0, 1, 1,
-0.7303205, 0.5010294, -2.73654, 1, 1, 1, 1, 1,
-0.727447, -1.233918, -2.264472, 1, 1, 1, 1, 1,
-0.7219617, -0.738958, -2.937733, 1, 1, 1, 1, 1,
-0.7211166, -0.5263358, -0.3919883, 1, 1, 1, 1, 1,
-0.7206012, 1.238193, -1.067919, 1, 1, 1, 1, 1,
-0.717467, -0.7927421, -2.082267, 1, 1, 1, 1, 1,
-0.7171183, 0.919669, -0.9957933, 1, 1, 1, 1, 1,
-0.7079061, 1.64773, 0.8918536, 1, 1, 1, 1, 1,
-0.7077917, 0.7120936, -1.442011, 1, 1, 1, 1, 1,
-0.7064411, 0.8504432, -2.106723, 1, 1, 1, 1, 1,
-0.7049525, -1.361689, -2.522677, 1, 1, 1, 1, 1,
-0.6969619, 1.234256, 0.8992745, 1, 1, 1, 1, 1,
-0.6956648, 0.9935451, -1.970858, 1, 1, 1, 1, 1,
-0.6901175, -1.765832, -4.942816, 1, 1, 1, 1, 1,
-0.6853754, 0.8955404, -1.250523, 1, 1, 1, 1, 1,
-0.6830938, -0.9327937, -2.887236, 0, 0, 1, 1, 1,
-0.6827878, -1.917972, -2.528245, 1, 0, 0, 1, 1,
-0.6777263, 0.9419687, -1.921862, 1, 0, 0, 1, 1,
-0.6761193, -0.5381818, -2.894648, 1, 0, 0, 1, 1,
-0.6757541, 0.03851939, -1.150993, 1, 0, 0, 1, 1,
-0.6717272, 0.4445341, -1.718575, 1, 0, 0, 1, 1,
-0.6713377, -1.989298, -1.97251, 0, 0, 0, 1, 1,
-0.6709862, -1.280003, -2.237019, 0, 0, 0, 1, 1,
-0.6694713, 0.0102573, -2.766597, 0, 0, 0, 1, 1,
-0.664462, -0.4154551, -2.095988, 0, 0, 0, 1, 1,
-0.6588626, 2.013054, -1.574479, 0, 0, 0, 1, 1,
-0.6533478, 1.30473, -0.1453403, 0, 0, 0, 1, 1,
-0.6476726, -0.3155558, -1.62063, 0, 0, 0, 1, 1,
-0.6445073, 0.5304718, 0.1776542, 1, 1, 1, 1, 1,
-0.6294056, 0.8038847, -2.377113, 1, 1, 1, 1, 1,
-0.6281666, 0.5673157, -0.8007215, 1, 1, 1, 1, 1,
-0.6227568, -0.03406126, -2.49787, 1, 1, 1, 1, 1,
-0.6164135, 0.4457536, -2.103869, 1, 1, 1, 1, 1,
-0.613253, -1.054469, -2.406421, 1, 1, 1, 1, 1,
-0.6069967, -1.211079, -3.492643, 1, 1, 1, 1, 1,
-0.6054185, -0.1163183, -2.674575, 1, 1, 1, 1, 1,
-0.6053523, 1.695349, -1.360401, 1, 1, 1, 1, 1,
-0.6026233, -1.686234, -2.843071, 1, 1, 1, 1, 1,
-0.6011736, 0.5473157, -0.4870031, 1, 1, 1, 1, 1,
-0.5985408, -1.811754, -1.480847, 1, 1, 1, 1, 1,
-0.5980853, -0.5623279, -3.537529, 1, 1, 1, 1, 1,
-0.5978308, 0.07101679, -1.056784, 1, 1, 1, 1, 1,
-0.5975586, 0.9081171, -0.5416151, 1, 1, 1, 1, 1,
-0.5957338, -0.6480179, -3.36639, 0, 0, 1, 1, 1,
-0.5950341, -0.04141431, -3.273212, 1, 0, 0, 1, 1,
-0.5928308, 0.7642853, -0.8108348, 1, 0, 0, 1, 1,
-0.5925568, -0.5255406, -2.081798, 1, 0, 0, 1, 1,
-0.5920275, 2.830325, -0.8596609, 1, 0, 0, 1, 1,
-0.5871964, 1.964481, -0.9417299, 1, 0, 0, 1, 1,
-0.5845272, -0.1874218, -4.441038, 0, 0, 0, 1, 1,
-0.5839589, -0.7673365, -2.913874, 0, 0, 0, 1, 1,
-0.5791961, -0.1874051, -1.419355, 0, 0, 0, 1, 1,
-0.5731862, 1.314181, -1.350171, 0, 0, 0, 1, 1,
-0.5678278, 0.208989, -1.314349, 0, 0, 0, 1, 1,
-0.5667375, -0.3398216, -1.4654, 0, 0, 0, 1, 1,
-0.5656609, 1.352367, 0.0480277, 0, 0, 0, 1, 1,
-0.565169, 0.1159365, -1.170693, 1, 1, 1, 1, 1,
-0.5636914, 0.7564623, -0.3004665, 1, 1, 1, 1, 1,
-0.5631132, -0.812232, -2.468811, 1, 1, 1, 1, 1,
-0.5630153, -0.2390057, -1.013234, 1, 1, 1, 1, 1,
-0.5610813, -0.409503, -1.241645, 1, 1, 1, 1, 1,
-0.5574368, -2.10248, -2.703572, 1, 1, 1, 1, 1,
-0.5536132, -0.5807545, -3.263148, 1, 1, 1, 1, 1,
-0.5533867, -0.1489934, -2.337735, 1, 1, 1, 1, 1,
-0.5530175, -1.139481, -4.124958, 1, 1, 1, 1, 1,
-0.5498207, 1.069886, -0.4965335, 1, 1, 1, 1, 1,
-0.5490423, 0.4279863, -0.09908522, 1, 1, 1, 1, 1,
-0.5480232, 0.1518894, -2.183638, 1, 1, 1, 1, 1,
-0.5399584, -0.9094253, -4.456485, 1, 1, 1, 1, 1,
-0.5390238, 0.1983227, -2.531089, 1, 1, 1, 1, 1,
-0.5389554, -0.4752215, -3.730494, 1, 1, 1, 1, 1,
-0.5364605, 0.9695709, -0.5635501, 0, 0, 1, 1, 1,
-0.5332198, -0.01961946, -3.444324, 1, 0, 0, 1, 1,
-0.5276113, -0.2449986, -1.82903, 1, 0, 0, 1, 1,
-0.5252569, -0.8957597, -1.8481, 1, 0, 0, 1, 1,
-0.5216131, -0.1415233, -1.880203, 1, 0, 0, 1, 1,
-0.5214115, 0.07362069, -0.7249231, 1, 0, 0, 1, 1,
-0.5194191, 0.9658506, -0.8560812, 0, 0, 0, 1, 1,
-0.5194119, -0.1009343, -3.333392, 0, 0, 0, 1, 1,
-0.5153584, 0.2216803, -1.247157, 0, 0, 0, 1, 1,
-0.5145186, 0.0672003, -1.906475, 0, 0, 0, 1, 1,
-0.5131571, -0.990809, -3.085675, 0, 0, 0, 1, 1,
-0.5094839, 0.4763971, -2.455108, 0, 0, 0, 1, 1,
-0.5093172, 1.456828, -0.4455703, 0, 0, 0, 1, 1,
-0.5088919, -2.044034, -2.604813, 1, 1, 1, 1, 1,
-0.5083912, 0.5063751, -2.109608, 1, 1, 1, 1, 1,
-0.5076164, 0.2096105, 0.0895397, 1, 1, 1, 1, 1,
-0.5045739, 0.9823151, 1.707656, 1, 1, 1, 1, 1,
-0.5025449, -0.3044955, -1.639363, 1, 1, 1, 1, 1,
-0.501738, 0.1604931, -1.655114, 1, 1, 1, 1, 1,
-0.5014092, -2.039746, -2.146936, 1, 1, 1, 1, 1,
-0.497931, -0.2248065, -1.887588, 1, 1, 1, 1, 1,
-0.4877113, -0.4042382, -1.899241, 1, 1, 1, 1, 1,
-0.486982, -0.9007872, -4.132782, 1, 1, 1, 1, 1,
-0.4819084, -0.3096403, -2.917301, 1, 1, 1, 1, 1,
-0.4817649, -0.6978693, -1.590892, 1, 1, 1, 1, 1,
-0.4778793, -0.3005588, -2.546848, 1, 1, 1, 1, 1,
-0.4755667, 0.3034172, -1.11114, 1, 1, 1, 1, 1,
-0.4739517, 0.8261662, -2.169843, 1, 1, 1, 1, 1,
-0.4676971, 0.4443075, -0.4390063, 0, 0, 1, 1, 1,
-0.450259, 1.357428, -1.554428, 1, 0, 0, 1, 1,
-0.446683, -0.8395176, -4.520418, 1, 0, 0, 1, 1,
-0.4447055, 0.5001373, 0.2066607, 1, 0, 0, 1, 1,
-0.4424362, 0.04711366, -1.452963, 1, 0, 0, 1, 1,
-0.4350884, -1.584687, -1.714748, 1, 0, 0, 1, 1,
-0.4337728, 1.509972, -1.335692, 0, 0, 0, 1, 1,
-0.4207022, -1.445633, -3.008507, 0, 0, 0, 1, 1,
-0.4202438, -0.2145591, -3.128484, 0, 0, 0, 1, 1,
-0.4148339, -0.2171797, -1.012611, 0, 0, 0, 1, 1,
-0.4096262, 1.173207, -1.941905, 0, 0, 0, 1, 1,
-0.4064555, 0.9732392, -0.5662792, 0, 0, 0, 1, 1,
-0.3987852, 0.5677339, 2.517097, 0, 0, 0, 1, 1,
-0.3947426, -0.6555873, -3.051764, 1, 1, 1, 1, 1,
-0.387632, 0.5584468, -0.6477394, 1, 1, 1, 1, 1,
-0.3738949, -1.017469, -2.793876, 1, 1, 1, 1, 1,
-0.3727619, 0.8761146, -0.6218857, 1, 1, 1, 1, 1,
-0.3707648, -0.1155039, -1.544946, 1, 1, 1, 1, 1,
-0.3705212, 0.6689065, 1.436645, 1, 1, 1, 1, 1,
-0.3677955, -0.1242082, -2.694779, 1, 1, 1, 1, 1,
-0.3598746, 0.4217624, 0.498699, 1, 1, 1, 1, 1,
-0.3560451, 2.379808, -1.24395, 1, 1, 1, 1, 1,
-0.3504407, 1.171827, -0.2700989, 1, 1, 1, 1, 1,
-0.3485956, 1.098193, -0.9573533, 1, 1, 1, 1, 1,
-0.3485312, 1.615829, -0.1076422, 1, 1, 1, 1, 1,
-0.3480644, -0.2556512, -2.013385, 1, 1, 1, 1, 1,
-0.3451251, 0.3189466, -0.5357668, 1, 1, 1, 1, 1,
-0.34409, 0.5166659, -1.805456, 1, 1, 1, 1, 1,
-0.3438889, 0.914026, -0.3933817, 0, 0, 1, 1, 1,
-0.3424476, 1.0969, -1.15613, 1, 0, 0, 1, 1,
-0.3377692, 0.2434402, -1.713688, 1, 0, 0, 1, 1,
-0.3334622, 2.046609, -0.1765836, 1, 0, 0, 1, 1,
-0.3329847, -0.4667036, -2.6987, 1, 0, 0, 1, 1,
-0.3327298, 0.4490631, -1.685426, 1, 0, 0, 1, 1,
-0.3323174, 0.05776361, -1.737608, 0, 0, 0, 1, 1,
-0.3320953, -1.182693, -2.510331, 0, 0, 0, 1, 1,
-0.3128482, -0.4371496, -2.986817, 0, 0, 0, 1, 1,
-0.3101943, -1.726118, -2.429668, 0, 0, 0, 1, 1,
-0.3075818, 1.354167, 0.1112946, 0, 0, 0, 1, 1,
-0.306405, -0.3795891, -2.453634, 0, 0, 0, 1, 1,
-0.3063065, -0.6071548, -1.794168, 0, 0, 0, 1, 1,
-0.2972079, 1.440939, -0.6928368, 1, 1, 1, 1, 1,
-0.2964092, -0.3508967, -3.02965, 1, 1, 1, 1, 1,
-0.2952483, -1.758006, -3.040271, 1, 1, 1, 1, 1,
-0.2942668, -0.4554884, -2.149088, 1, 1, 1, 1, 1,
-0.290674, 0.6900437, -0.6070104, 1, 1, 1, 1, 1,
-0.2905395, -0.1970322, -2.61567, 1, 1, 1, 1, 1,
-0.2843827, 0.7775204, -0.7116807, 1, 1, 1, 1, 1,
-0.2784688, -0.2986812, -2.77172, 1, 1, 1, 1, 1,
-0.2780929, -0.4418978, -3.266649, 1, 1, 1, 1, 1,
-0.275055, -0.4382619, -2.306694, 1, 1, 1, 1, 1,
-0.2741716, -1.494207, -1.031758, 1, 1, 1, 1, 1,
-0.2724107, -1.036619, -2.209049, 1, 1, 1, 1, 1,
-0.2692337, -1.660398, -2.010232, 1, 1, 1, 1, 1,
-0.2679387, -1.097791, -4.649316, 1, 1, 1, 1, 1,
-0.2648373, -0.4180654, -3.04703, 1, 1, 1, 1, 1,
-0.2570049, -0.4380834, -4.600013, 0, 0, 1, 1, 1,
-0.2540905, -0.8683692, -2.715738, 1, 0, 0, 1, 1,
-0.2540355, 0.08484242, -1.218736, 1, 0, 0, 1, 1,
-0.2445848, 0.1561383, -0.6608422, 1, 0, 0, 1, 1,
-0.2433922, 0.9740031, -0.9460776, 1, 0, 0, 1, 1,
-0.2393444, 0.840188, -1.134085, 1, 0, 0, 1, 1,
-0.2372656, 0.2659526, -1.571927, 0, 0, 0, 1, 1,
-0.2331095, -0.3901507, -3.638678, 0, 0, 0, 1, 1,
-0.2299463, -0.5537152, -3.282799, 0, 0, 0, 1, 1,
-0.2298738, 1.289121, -1.89264, 0, 0, 0, 1, 1,
-0.2271867, -1.68962, -2.6501, 0, 0, 0, 1, 1,
-0.2267023, 0.2275253, -0.9313273, 0, 0, 0, 1, 1,
-0.2216152, -1.245871, -0.4543135, 0, 0, 0, 1, 1,
-0.2172887, -2.053667, -4.820527, 1, 1, 1, 1, 1,
-0.2128588, -0.7016156, -2.880706, 1, 1, 1, 1, 1,
-0.210608, 1.481582, 0.4142585, 1, 1, 1, 1, 1,
-0.2092838, -1.144605, -3.263371, 1, 1, 1, 1, 1,
-0.2057542, 0.3817403, 0.6422655, 1, 1, 1, 1, 1,
-0.2043294, -0.5413744, -1.241387, 1, 1, 1, 1, 1,
-0.2034027, 0.4226888, 0.3555822, 1, 1, 1, 1, 1,
-0.200166, 0.5976151, -1.375678, 1, 1, 1, 1, 1,
-0.1981221, -1.075825, -2.357878, 1, 1, 1, 1, 1,
-0.1975418, -0.8273873, -2.981179, 1, 1, 1, 1, 1,
-0.197462, 0.5817181, -0.3973809, 1, 1, 1, 1, 1,
-0.1973495, 1.115315, 1.138028, 1, 1, 1, 1, 1,
-0.1956253, 1.731526, -0.8229043, 1, 1, 1, 1, 1,
-0.1939631, 0.2188498, 0.4800565, 1, 1, 1, 1, 1,
-0.1913272, -0.9221829, -4.183746, 1, 1, 1, 1, 1,
-0.1827404, 0.1196205, -1.55297, 0, 0, 1, 1, 1,
-0.1814769, -0.7240852, -4.388656, 1, 0, 0, 1, 1,
-0.1807626, 0.1289036, -1.130358, 1, 0, 0, 1, 1,
-0.176354, -0.2405926, -3.678616, 1, 0, 0, 1, 1,
-0.1761495, -0.1987727, -4.037593, 1, 0, 0, 1, 1,
-0.1712592, 0.8424936, 0.3235687, 1, 0, 0, 1, 1,
-0.1697329, -0.5012669, -3.237187, 0, 0, 0, 1, 1,
-0.1686045, -1.394349, -2.777225, 0, 0, 0, 1, 1,
-0.1682551, -0.274212, -2.373977, 0, 0, 0, 1, 1,
-0.1654726, -0.5110483, -2.607697, 0, 0, 0, 1, 1,
-0.1654495, -0.8710051, -2.525114, 0, 0, 0, 1, 1,
-0.1612776, -0.6640568, -1.765077, 0, 0, 0, 1, 1,
-0.1517202, -0.3057704, -1.484882, 0, 0, 0, 1, 1,
-0.1450845, 0.5135151, -0.8536977, 1, 1, 1, 1, 1,
-0.1439807, 0.08037066, -1.996216, 1, 1, 1, 1, 1,
-0.141943, -0.9308501, -2.427549, 1, 1, 1, 1, 1,
-0.140816, 0.4848986, -1.652309, 1, 1, 1, 1, 1,
-0.1407562, 0.6006736, -1.512985, 1, 1, 1, 1, 1,
-0.1381686, -1.431791, -3.868258, 1, 1, 1, 1, 1,
-0.1377188, -2.031447, -2.288906, 1, 1, 1, 1, 1,
-0.1346532, -0.4367858, -3.715657, 1, 1, 1, 1, 1,
-0.12453, -0.2538691, -0.8111711, 1, 1, 1, 1, 1,
-0.1213531, 0.268087, -0.4187987, 1, 1, 1, 1, 1,
-0.1180222, 1.030108, -1.247285, 1, 1, 1, 1, 1,
-0.1158815, 0.4085405, 0.1996864, 1, 1, 1, 1, 1,
-0.1141815, -0.6418617, -2.505591, 1, 1, 1, 1, 1,
-0.1117357, -0.3670156, -1.890736, 1, 1, 1, 1, 1,
-0.1095239, -0.9455453, -3.310696, 1, 1, 1, 1, 1,
-0.1033109, 0.2756796, -2.320789, 0, 0, 1, 1, 1,
-0.1011776, -1.169416, -2.833998, 1, 0, 0, 1, 1,
-0.1002665, -0.5115083, -0.9725831, 1, 0, 0, 1, 1,
-0.09845831, -0.4743607, -2.034468, 1, 0, 0, 1, 1,
-0.09463391, -2.027387, -1.960463, 1, 0, 0, 1, 1,
-0.0940503, -0.4638672, -2.517548, 1, 0, 0, 1, 1,
-0.092404, -1.108726, -3.329671, 0, 0, 0, 1, 1,
-0.09193905, -0.8938027, -3.726835, 0, 0, 0, 1, 1,
-0.09003339, 0.8774769, 0.2863553, 0, 0, 0, 1, 1,
-0.08662651, 0.9932532, -0.9156131, 0, 0, 0, 1, 1,
-0.08635246, 0.2062535, -1.049681, 0, 0, 0, 1, 1,
-0.08422759, -0.2338897, -2.793252, 0, 0, 0, 1, 1,
-0.08250452, 0.7160636, -0.8158023, 0, 0, 0, 1, 1,
-0.08220843, 1.468223, 2.70048, 1, 1, 1, 1, 1,
-0.07981646, -0.707653, -4.243631, 1, 1, 1, 1, 1,
-0.07802693, -1.470183, -3.552148, 1, 1, 1, 1, 1,
-0.07309646, 0.180823, -0.4560782, 1, 1, 1, 1, 1,
-0.07284497, 0.06028561, -1.888219, 1, 1, 1, 1, 1,
-0.0682296, -0.2241741, -4.110604, 1, 1, 1, 1, 1,
-0.06740031, 1.507412, 1.243141, 1, 1, 1, 1, 1,
-0.06323588, 1.343016, 0.06439385, 1, 1, 1, 1, 1,
-0.05627497, 0.4721479, 1.407588, 1, 1, 1, 1, 1,
-0.04747244, 0.07698827, 0.8729802, 1, 1, 1, 1, 1,
-0.04251929, -0.3734857, -1.590949, 1, 1, 1, 1, 1,
-0.03767989, 1.07651, -1.066801, 1, 1, 1, 1, 1,
-0.03178258, 0.4025841, 1.760321, 1, 1, 1, 1, 1,
-0.02956223, 0.01105113, -2.434222, 1, 1, 1, 1, 1,
-0.02687319, 1.034205, 0.2591471, 1, 1, 1, 1, 1,
-0.02580385, -0.8358695, -1.746233, 0, 0, 1, 1, 1,
-0.01766341, 1.154662, -0.4697809, 1, 0, 0, 1, 1,
-0.01584337, 1.116294, -0.3640268, 1, 0, 0, 1, 1,
-0.01578284, 1.38774, 0.2399349, 1, 0, 0, 1, 1,
-0.01259964, -0.2036197, -3.020936, 1, 0, 0, 1, 1,
-0.01145597, -0.6755187, -3.134842, 1, 0, 0, 1, 1,
-0.007709225, -1.410709, -1.987216, 0, 0, 0, 1, 1,
-0.005980149, 0.6941234, -0.9627354, 0, 0, 0, 1, 1,
-0.001491505, 1.673852, 0.6683747, 0, 0, 0, 1, 1,
0.0001486492, -1.730424, 5.298678, 0, 0, 0, 1, 1,
0.001386809, 0.2511627, 0.6397099, 0, 0, 0, 1, 1,
0.002376404, -0.5994394, 2.987036, 0, 0, 0, 1, 1,
0.007866936, 0.5081024, 0.1581249, 0, 0, 0, 1, 1,
0.00915634, 2.456219, -0.4323918, 1, 1, 1, 1, 1,
0.01131568, -0.5306464, 2.520026, 1, 1, 1, 1, 1,
0.01238031, -2.170007, 4.098419, 1, 1, 1, 1, 1,
0.01593689, -1.44401, 4.169881, 1, 1, 1, 1, 1,
0.01735027, -1.441741, 3.002294, 1, 1, 1, 1, 1,
0.01865203, -0.7027427, 3.171743, 1, 1, 1, 1, 1,
0.02000286, 0.03417414, 0.3785473, 1, 1, 1, 1, 1,
0.02189351, 0.5268921, -0.3617062, 1, 1, 1, 1, 1,
0.02510936, -0.2478468, 2.964641, 1, 1, 1, 1, 1,
0.02528918, 1.653944, 0.4789374, 1, 1, 1, 1, 1,
0.02794077, -0.7791767, 2.532913, 1, 1, 1, 1, 1,
0.02994561, 0.3484524, -0.06129807, 1, 1, 1, 1, 1,
0.02995908, -1.456072, 3.416548, 1, 1, 1, 1, 1,
0.03357713, -0.3202671, 3.537477, 1, 1, 1, 1, 1,
0.03708751, -0.6350698, 2.230245, 1, 1, 1, 1, 1,
0.03820484, -0.280019, 2.215961, 0, 0, 1, 1, 1,
0.0421225, -1.55747, 3.599679, 1, 0, 0, 1, 1,
0.0427516, -0.7085623, 5.983854, 1, 0, 0, 1, 1,
0.04280788, -0.9372679, 2.809505, 1, 0, 0, 1, 1,
0.04450804, 0.3973115, -0.4330729, 1, 0, 0, 1, 1,
0.04477172, -0.3756535, 2.84052, 1, 0, 0, 1, 1,
0.04519895, -1.598036, 2.480224, 0, 0, 0, 1, 1,
0.04557909, 1.229774, 1.17821, 0, 0, 0, 1, 1,
0.04926756, -1.027659, 3.345086, 0, 0, 0, 1, 1,
0.05266298, -0.05038605, 2.187757, 0, 0, 0, 1, 1,
0.05457743, 0.4855949, 1.138518, 0, 0, 0, 1, 1,
0.05962016, -0.4522742, 2.449847, 0, 0, 0, 1, 1,
0.05983723, 0.2420202, -0.9394838, 0, 0, 0, 1, 1,
0.06624696, 0.1968067, 0.015767, 1, 1, 1, 1, 1,
0.06944343, -0.3057656, 4.592559, 1, 1, 1, 1, 1,
0.07028382, 1.324773, -1.265634, 1, 1, 1, 1, 1,
0.07155799, -0.6145937, 2.050168, 1, 1, 1, 1, 1,
0.07293605, 1.119998, 1.569454, 1, 1, 1, 1, 1,
0.07359553, 0.6752297, 0.09006751, 1, 1, 1, 1, 1,
0.07442401, 0.5487524, 0.07469998, 1, 1, 1, 1, 1,
0.07540799, -0.366183, 2.927453, 1, 1, 1, 1, 1,
0.07911216, 0.2242966, -0.2968606, 1, 1, 1, 1, 1,
0.07943626, -0.7139515, 3.249372, 1, 1, 1, 1, 1,
0.07962359, 0.05152212, 2.149397, 1, 1, 1, 1, 1,
0.07995906, -0.7819394, 1.815203, 1, 1, 1, 1, 1,
0.08467104, -1.34608, 4.775953, 1, 1, 1, 1, 1,
0.08546703, 0.08270781, 1.361176, 1, 1, 1, 1, 1,
0.0902139, 1.320456, 0.3917145, 1, 1, 1, 1, 1,
0.09209677, -0.1442707, 2.439386, 0, 0, 1, 1, 1,
0.09545311, 0.03237727, 0.9989721, 1, 0, 0, 1, 1,
0.09564785, 0.7358988, 0.1812437, 1, 0, 0, 1, 1,
0.09728412, -2.273229, 4.252584, 1, 0, 0, 1, 1,
0.1026357, -0.4347677, 2.997153, 1, 0, 0, 1, 1,
0.1039005, -0.598731, 2.65692, 1, 0, 0, 1, 1,
0.1040752, -0.6375145, 3.645088, 0, 0, 0, 1, 1,
0.1051969, -0.6580492, 3.024865, 0, 0, 0, 1, 1,
0.1055021, 2.156663, 1.445586, 0, 0, 0, 1, 1,
0.1056469, 0.05720054, 1.006697, 0, 0, 0, 1, 1,
0.1080509, 0.01462342, 2.201406, 0, 0, 0, 1, 1,
0.1087383, -0.2959381, 1.930067, 0, 0, 0, 1, 1,
0.1150892, -0.5074183, 2.552679, 0, 0, 0, 1, 1,
0.1163434, -2.254796, 3.389577, 1, 1, 1, 1, 1,
0.1187489, -0.4963177, 2.310431, 1, 1, 1, 1, 1,
0.1192973, -0.5451751, 3.245421, 1, 1, 1, 1, 1,
0.1213599, 0.3204204, 1.44737, 1, 1, 1, 1, 1,
0.1230869, 0.4005468, 1.747005, 1, 1, 1, 1, 1,
0.1241347, 1.017648, -0.5978219, 1, 1, 1, 1, 1,
0.1256539, -0.3894095, 2.20267, 1, 1, 1, 1, 1,
0.1270103, -1.082284, 3.669407, 1, 1, 1, 1, 1,
0.132386, 0.2556822, 1.958758, 1, 1, 1, 1, 1,
0.1376, -0.2701574, 2.089214, 1, 1, 1, 1, 1,
0.1390751, -0.01851229, 1.325135, 1, 1, 1, 1, 1,
0.139487, 0.7154375, 1.007568, 1, 1, 1, 1, 1,
0.1438553, -1.023524, 4.213481, 1, 1, 1, 1, 1,
0.1470908, 0.313377, -0.3614307, 1, 1, 1, 1, 1,
0.1480886, -0.7127292, 3.307009, 1, 1, 1, 1, 1,
0.1505193, 0.1667605, -0.1486024, 0, 0, 1, 1, 1,
0.1506046, 1.564943, 0.9298385, 1, 0, 0, 1, 1,
0.1508641, -1.825224, 2.854479, 1, 0, 0, 1, 1,
0.1517174, -0.2275424, 3.445745, 1, 0, 0, 1, 1,
0.1519397, -0.4799708, 2.083994, 1, 0, 0, 1, 1,
0.1557384, 0.7947079, 0.4395125, 1, 0, 0, 1, 1,
0.158995, 0.9550118, -0.8311595, 0, 0, 0, 1, 1,
0.1592389, -0.06877191, 3.034503, 0, 0, 0, 1, 1,
0.1665456, -1.3493, 3.737977, 0, 0, 0, 1, 1,
0.1703629, 0.5054995, -0.08122113, 0, 0, 0, 1, 1,
0.1719766, 0.4582261, 1.018494, 0, 0, 0, 1, 1,
0.1745403, 1.456292, -1.211224, 0, 0, 0, 1, 1,
0.1749041, 0.5237361, -0.7273074, 0, 0, 0, 1, 1,
0.1771714, 0.2478425, 1.449183, 1, 1, 1, 1, 1,
0.17816, -0.625712, 4.887705, 1, 1, 1, 1, 1,
0.1830234, -0.001977478, 1.909914, 1, 1, 1, 1, 1,
0.1864975, -0.1151381, 1.300744, 1, 1, 1, 1, 1,
0.187409, -1.604242, 3.441041, 1, 1, 1, 1, 1,
0.1904168, 0.7013742, -0.4433624, 1, 1, 1, 1, 1,
0.1923201, -0.8188052, 2.166542, 1, 1, 1, 1, 1,
0.1927023, -1.600433, 2.317776, 1, 1, 1, 1, 1,
0.1935523, -0.3074826, 3.145544, 1, 1, 1, 1, 1,
0.1953048, -0.5986465, 3.111099, 1, 1, 1, 1, 1,
0.1991926, 0.4672688, -2.152063, 1, 1, 1, 1, 1,
0.201573, 0.5522921, 0.9983523, 1, 1, 1, 1, 1,
0.2039832, -1.42253, 3.901288, 1, 1, 1, 1, 1,
0.2042302, -1.265728, 4.251666, 1, 1, 1, 1, 1,
0.2069456, 0.223577, 2.254336, 1, 1, 1, 1, 1,
0.2135224, 1.338757, 1.353892, 0, 0, 1, 1, 1,
0.2137201, 1.460227, -1.087106, 1, 0, 0, 1, 1,
0.2140412, 1.362161, -2.359375, 1, 0, 0, 1, 1,
0.2175663, -1.836051, 2.553717, 1, 0, 0, 1, 1,
0.2182218, -0.6471822, 3.339988, 1, 0, 0, 1, 1,
0.2206336, 0.6512948, 0.2102325, 1, 0, 0, 1, 1,
0.2206952, -0.4781616, 2.27825, 0, 0, 0, 1, 1,
0.2238617, -0.4800165, 2.303365, 0, 0, 0, 1, 1,
0.2330154, -1.0315, 2.257037, 0, 0, 0, 1, 1,
0.233634, -0.761586, 1.904722, 0, 0, 0, 1, 1,
0.2353764, -0.9397861, 3.082806, 0, 0, 0, 1, 1,
0.2369826, -0.8104903, 3.044418, 0, 0, 0, 1, 1,
0.2399699, 0.3863284, 0.4096449, 0, 0, 0, 1, 1,
0.2438657, -0.9754813, 3.615289, 1, 1, 1, 1, 1,
0.2443075, -0.847205, 2.093056, 1, 1, 1, 1, 1,
0.2446594, -0.03811901, 0.3072465, 1, 1, 1, 1, 1,
0.2460546, -0.435451, 2.856632, 1, 1, 1, 1, 1,
0.2480174, -0.4198648, 3.235418, 1, 1, 1, 1, 1,
0.2530117, 0.5644513, 0.5328333, 1, 1, 1, 1, 1,
0.2531269, 1.295364, 1.195397, 1, 1, 1, 1, 1,
0.2570203, 0.4093869, 0.3071349, 1, 1, 1, 1, 1,
0.2585007, -0.9633416, 3.5236, 1, 1, 1, 1, 1,
0.2621552, -0.004706396, 0.6323285, 1, 1, 1, 1, 1,
0.2625096, -0.2531559, 1.400213, 1, 1, 1, 1, 1,
0.2662549, -1.447944, 3.326443, 1, 1, 1, 1, 1,
0.2678382, 0.1095939, 2.016303, 1, 1, 1, 1, 1,
0.2690162, -0.4918988, 1.992701, 1, 1, 1, 1, 1,
0.2709438, -0.7582319, 3.2828, 1, 1, 1, 1, 1,
0.271014, 0.1008498, 2.05925, 0, 0, 1, 1, 1,
0.2733744, -0.1527374, 3.938618, 1, 0, 0, 1, 1,
0.2753649, -0.4645865, 2.309318, 1, 0, 0, 1, 1,
0.2771095, -0.3190287, 1.438756, 1, 0, 0, 1, 1,
0.2777284, -0.495845, 1.129789, 1, 0, 0, 1, 1,
0.2829945, -0.9152142, 3.194161, 1, 0, 0, 1, 1,
0.2837559, 1.07725, -1.061167, 0, 0, 0, 1, 1,
0.2847854, 0.4905904, 0.2070511, 0, 0, 0, 1, 1,
0.2919746, -1.077617, 3.802095, 0, 0, 0, 1, 1,
0.2932796, 0.242978, -1.292369, 0, 0, 0, 1, 1,
0.2947162, -0.09663384, 1.561784, 0, 0, 0, 1, 1,
0.2964655, -0.9773216, 3.08263, 0, 0, 0, 1, 1,
0.2997794, 1.041621, 0.7766222, 0, 0, 0, 1, 1,
0.2999362, -1.498804, 1.289096, 1, 1, 1, 1, 1,
0.3039936, -0.8706555, 1.005922, 1, 1, 1, 1, 1,
0.305577, 0.4988385, 1.119006, 1, 1, 1, 1, 1,
0.3072067, 1.213863, -0.3826377, 1, 1, 1, 1, 1,
0.3095821, 0.4080436, 1.282667, 1, 1, 1, 1, 1,
0.3125034, 0.02049757, 1.583649, 1, 1, 1, 1, 1,
0.3126462, 0.9129397, 0.0549071, 1, 1, 1, 1, 1,
0.3141797, -0.5413162, 3.207366, 1, 1, 1, 1, 1,
0.3161126, 1.15658, -1.199556, 1, 1, 1, 1, 1,
0.3229877, -2.101602, 2.159196, 1, 1, 1, 1, 1,
0.3243929, -1.074549, 2.982774, 1, 1, 1, 1, 1,
0.3263551, -0.5527539, 0.1896615, 1, 1, 1, 1, 1,
0.3321855, 0.3476464, 1.639218, 1, 1, 1, 1, 1,
0.3350459, -0.3333022, 1.366533, 1, 1, 1, 1, 1,
0.3350903, 0.5779516, 0.07696338, 1, 1, 1, 1, 1,
0.3364621, 0.8660749, 0.3501056, 0, 0, 1, 1, 1,
0.3407857, 1.05105, 0.6226434, 1, 0, 0, 1, 1,
0.3442328, 2.270491, 0.9867961, 1, 0, 0, 1, 1,
0.3465561, -0.3741654, 2.151092, 1, 0, 0, 1, 1,
0.3468142, 1.269055, -0.51851, 1, 0, 0, 1, 1,
0.3493304, 0.08873423, 0.6969153, 1, 0, 0, 1, 1,
0.3493822, -1.200695, 3.393284, 0, 0, 0, 1, 1,
0.349501, 1.048206, -1.211483, 0, 0, 0, 1, 1,
0.3532629, -1.246055, 2.508721, 0, 0, 0, 1, 1,
0.3535646, -0.2127331, 0.9243508, 0, 0, 0, 1, 1,
0.3539117, 0.4053701, 0.2750068, 0, 0, 0, 1, 1,
0.3550674, 0.1639265, -0.1261745, 0, 0, 0, 1, 1,
0.3582502, -0.5827747, 1.119637, 0, 0, 0, 1, 1,
0.359232, -1.046631, 1.514142, 1, 1, 1, 1, 1,
0.3628888, -0.2478319, 1.669358, 1, 1, 1, 1, 1,
0.3660183, 0.5514523, 0.378368, 1, 1, 1, 1, 1,
0.3666144, -0.02251347, 2.203288, 1, 1, 1, 1, 1,
0.3709854, -1.944658, 2.126784, 1, 1, 1, 1, 1,
0.3723159, 0.07805271, 2.737927, 1, 1, 1, 1, 1,
0.3727233, -1.998407, 2.674778, 1, 1, 1, 1, 1,
0.3781123, -1.314235, 2.626574, 1, 1, 1, 1, 1,
0.378896, 0.339687, -1.182038, 1, 1, 1, 1, 1,
0.3850801, -0.9254531, 1.877643, 1, 1, 1, 1, 1,
0.3869325, 1.494066, 1.945652, 1, 1, 1, 1, 1,
0.3918052, 2.530356, 1.037933, 1, 1, 1, 1, 1,
0.3948894, 1.167566, 0.9979115, 1, 1, 1, 1, 1,
0.3961115, 0.83924, 0.3957055, 1, 1, 1, 1, 1,
0.3995227, 0.6640301, 0.1413312, 1, 1, 1, 1, 1,
0.4023456, 0.0918277, 0.7539945, 0, 0, 1, 1, 1,
0.4069803, 0.004354774, 2.538825, 1, 0, 0, 1, 1,
0.40951, -2.247655, 4.081961, 1, 0, 0, 1, 1,
0.410691, -0.7219108, 0.4608275, 1, 0, 0, 1, 1,
0.4145994, 1.638625, 0.223564, 1, 0, 0, 1, 1,
0.4146439, -0.8627719, 1.514417, 1, 0, 0, 1, 1,
0.4170553, 0.2601536, 0.4511603, 0, 0, 0, 1, 1,
0.4185219, 0.06324153, 2.86737, 0, 0, 0, 1, 1,
0.4215126, -0.2518332, 2.281154, 0, 0, 0, 1, 1,
0.4224371, 0.8640832, 1.916493, 0, 0, 0, 1, 1,
0.4281305, 1.575758, -0.5975568, 0, 0, 0, 1, 1,
0.4304478, 0.1703781, 1.191688, 0, 0, 0, 1, 1,
0.4353622, -0.1953681, 2.817884, 0, 0, 0, 1, 1,
0.4379444, -1.361391, 2.282387, 1, 1, 1, 1, 1,
0.4390264, -1.537896, 2.551594, 1, 1, 1, 1, 1,
0.4408048, 0.7652326, 0.0192564, 1, 1, 1, 1, 1,
0.442939, 2.073684, 0.8529508, 1, 1, 1, 1, 1,
0.4434685, 0.7941279, 0.005758154, 1, 1, 1, 1, 1,
0.444557, -0.5356723, 2.028347, 1, 1, 1, 1, 1,
0.44491, -0.2738895, 1.916221, 1, 1, 1, 1, 1,
0.4457582, 0.07769576, 3.184625, 1, 1, 1, 1, 1,
0.4502005, 0.4607944, 1.71966, 1, 1, 1, 1, 1,
0.4534814, 0.415468, -0.5569021, 1, 1, 1, 1, 1,
0.4570565, -0.9398199, 2.346887, 1, 1, 1, 1, 1,
0.45824, -0.9713792, 2.508803, 1, 1, 1, 1, 1,
0.458293, 1.156221, -0.7640259, 1, 1, 1, 1, 1,
0.4647327, -2.740517, 2.49858, 1, 1, 1, 1, 1,
0.4694267, -1.146148, 0.51539, 1, 1, 1, 1, 1,
0.4717668, 0.978752, 3.033736, 0, 0, 1, 1, 1,
0.4739766, -0.9054416, 1.46824, 1, 0, 0, 1, 1,
0.474372, 0.2465584, 1.646379, 1, 0, 0, 1, 1,
0.476749, 1.129823, 1.141394, 1, 0, 0, 1, 1,
0.4774906, 0.03539537, 2.16687, 1, 0, 0, 1, 1,
0.4781631, 0.9522065, 0.6370648, 1, 0, 0, 1, 1,
0.4808771, -1.748552, 1.565712, 0, 0, 0, 1, 1,
0.4825112, 1.033959, 0.1218337, 0, 0, 0, 1, 1,
0.4847779, 0.03239269, 0.840665, 0, 0, 0, 1, 1,
0.4872008, -1.229095, 4.242424, 0, 0, 0, 1, 1,
0.4883847, -1.11778, 4.516453, 0, 0, 0, 1, 1,
0.4919132, -1.515497, 2.287211, 0, 0, 0, 1, 1,
0.4966307, -0.249465, 4.365893, 0, 0, 0, 1, 1,
0.498973, -1.358456, 2.411253, 1, 1, 1, 1, 1,
0.4998965, 0.4905398, 1.530063, 1, 1, 1, 1, 1,
0.5075775, 1.332562, -1.009318, 1, 1, 1, 1, 1,
0.5086929, -1.027336, 1.180195, 1, 1, 1, 1, 1,
0.5321657, -0.8401597, -0.00663726, 1, 1, 1, 1, 1,
0.5373836, -2.093567, 2.891135, 1, 1, 1, 1, 1,
0.539448, 0.7783257, 1.593165, 1, 1, 1, 1, 1,
0.5398982, -0.3973435, 3.14431, 1, 1, 1, 1, 1,
0.550787, 1.150794, 1.500765, 1, 1, 1, 1, 1,
0.5515404, 0.3012263, 1.061999, 1, 1, 1, 1, 1,
0.5527976, 0.8569227, 0.8619718, 1, 1, 1, 1, 1,
0.5529662, -0.5370657, 2.091856, 1, 1, 1, 1, 1,
0.560181, 0.04896972, 1.996649, 1, 1, 1, 1, 1,
0.5608062, 0.2533983, -0.324801, 1, 1, 1, 1, 1,
0.5609308, 0.05324558, 1.485192, 1, 1, 1, 1, 1,
0.564062, 0.9383454, -0.4856904, 0, 0, 1, 1, 1,
0.566694, 0.8561847, 1.286678, 1, 0, 0, 1, 1,
0.5744676, 0.02524211, 1.239184, 1, 0, 0, 1, 1,
0.5776271, 0.7932996, -0.3701884, 1, 0, 0, 1, 1,
0.5799125, -0.1293479, 2.50413, 1, 0, 0, 1, 1,
0.584748, 0.5265834, 1.547375, 1, 0, 0, 1, 1,
0.5862017, -2.309752, 1.973473, 0, 0, 0, 1, 1,
0.5872715, 0.870389, 0.2834142, 0, 0, 0, 1, 1,
0.5880933, 1.251152, 2.137995, 0, 0, 0, 1, 1,
0.5899231, 0.02517154, 1.539331, 0, 0, 0, 1, 1,
0.5928014, 0.2769138, 0.6914999, 0, 0, 0, 1, 1,
0.6001409, 0.6439555, -0.5379793, 0, 0, 0, 1, 1,
0.6055219, -0.5608982, 2.072604, 0, 0, 0, 1, 1,
0.6060113, 0.3528728, -0.02067038, 1, 1, 1, 1, 1,
0.6117899, -1.104656, 2.048171, 1, 1, 1, 1, 1,
0.6153634, 1.437484, 0.8959141, 1, 1, 1, 1, 1,
0.6183932, 1.562265, 1.248675, 1, 1, 1, 1, 1,
0.625915, 0.3041882, 1.533544, 1, 1, 1, 1, 1,
0.6275284, -0.2274043, 1.911876, 1, 1, 1, 1, 1,
0.6289516, -0.9819346, 1.944766, 1, 1, 1, 1, 1,
0.6297176, 0.1733042, 0.04700552, 1, 1, 1, 1, 1,
0.6309647, 0.188572, 0.7322103, 1, 1, 1, 1, 1,
0.6419759, -1.032294, 1.167628, 1, 1, 1, 1, 1,
0.6436766, -0.4869399, 3.384503, 1, 1, 1, 1, 1,
0.6446931, 0.9966629, -0.001937896, 1, 1, 1, 1, 1,
0.6462992, 1.085983, 0.6941097, 1, 1, 1, 1, 1,
0.6475497, 0.1063112, 1.290338, 1, 1, 1, 1, 1,
0.6525306, -1.138945, 1.417484, 1, 1, 1, 1, 1,
0.6529397, 0.1016845, 2.205107, 0, 0, 1, 1, 1,
0.6576924, -1.726679, 3.290351, 1, 0, 0, 1, 1,
0.6579552, -0.4243035, 1.249508, 1, 0, 0, 1, 1,
0.6616464, 1.139194, 1.2812, 1, 0, 0, 1, 1,
0.6623352, 0.882801, 0.3264821, 1, 0, 0, 1, 1,
0.6626903, 0.7165732, 0.3243144, 1, 0, 0, 1, 1,
0.6660959, -1.234031, 0.8613585, 0, 0, 0, 1, 1,
0.6667985, -0.04577088, 1.882083, 0, 0, 0, 1, 1,
0.6668938, 0.8587558, 1.755248, 0, 0, 0, 1, 1,
0.6700382, 0.07612406, 0.1778546, 0, 0, 0, 1, 1,
0.6881043, -1.062672, 1.936196, 0, 0, 0, 1, 1,
0.6888502, 0.9947168, 0.4050852, 0, 0, 0, 1, 1,
0.6896471, -1.824956, 2.896164, 0, 0, 0, 1, 1,
0.7039903, -0.893273, 3.290591, 1, 1, 1, 1, 1,
0.7057655, 0.3637895, 0.8339486, 1, 1, 1, 1, 1,
0.7146707, 1.848793, 0.3364403, 1, 1, 1, 1, 1,
0.714819, 0.2529686, 0.7436478, 1, 1, 1, 1, 1,
0.7231404, 1.319171, 0.02414451, 1, 1, 1, 1, 1,
0.724131, -1.825759, 3.719566, 1, 1, 1, 1, 1,
0.7253479, -0.389664, 3.437556, 1, 1, 1, 1, 1,
0.7302994, 1.150554, -0.02927828, 1, 1, 1, 1, 1,
0.7397899, 0.1801194, 1.579472, 1, 1, 1, 1, 1,
0.7423779, 0.4077188, -0.1123977, 1, 1, 1, 1, 1,
0.7451493, 0.3160368, -0.2495624, 1, 1, 1, 1, 1,
0.7459565, 0.2098821, -0.06427704, 1, 1, 1, 1, 1,
0.7514403, 1.125494, 2.89082, 1, 1, 1, 1, 1,
0.7515215, 1.081911, -1.390461, 1, 1, 1, 1, 1,
0.7554201, -0.517715, 0.2846701, 1, 1, 1, 1, 1,
0.7559457, -0.06715729, 1.727229, 0, 0, 1, 1, 1,
0.7561314, 0.4575975, 0.6916257, 1, 0, 0, 1, 1,
0.765835, 0.9332733, 0.9654821, 1, 0, 0, 1, 1,
0.7691799, 0.4776361, -0.1743829, 1, 0, 0, 1, 1,
0.7708152, 1.017001, -0.4433727, 1, 0, 0, 1, 1,
0.7810599, 0.02582585, 3.904423, 1, 0, 0, 1, 1,
0.7813737, -2.701873, 4.10429, 0, 0, 0, 1, 1,
0.7846479, -0.9563199, 3.024737, 0, 0, 0, 1, 1,
0.7868239, -0.7148715, 2.853342, 0, 0, 0, 1, 1,
0.7893361, -0.06830622, 3.090197, 0, 0, 0, 1, 1,
0.7929914, 0.4648164, 1.279655, 0, 0, 0, 1, 1,
0.7943789, -0.7293098, 2.081089, 0, 0, 0, 1, 1,
0.7945719, 1.892905, 0.08239642, 0, 0, 0, 1, 1,
0.7998353, -0.515229, 2.000233, 1, 1, 1, 1, 1,
0.8030646, -0.2685811, 2.123282, 1, 1, 1, 1, 1,
0.8045855, 0.7789233, 0.9596686, 1, 1, 1, 1, 1,
0.80567, -0.4479399, 0.334417, 1, 1, 1, 1, 1,
0.8059866, -0.4467998, -0.2026259, 1, 1, 1, 1, 1,
0.8078912, 0.3592853, 1.020873, 1, 1, 1, 1, 1,
0.8145407, 1.68285, -0.545185, 1, 1, 1, 1, 1,
0.8193321, -1.776411, 4.5849, 1, 1, 1, 1, 1,
0.8270583, 1.815292, -1.179906, 1, 1, 1, 1, 1,
0.82868, 1.24308, 1.877572, 1, 1, 1, 1, 1,
0.8347005, -0.810142, 1.820688, 1, 1, 1, 1, 1,
0.8404201, -1.256296, 4.284148, 1, 1, 1, 1, 1,
0.8482657, 0.2921657, 1.310515, 1, 1, 1, 1, 1,
0.8485624, 0.7722806, 0.985949, 1, 1, 1, 1, 1,
0.8528844, 1.305271, 1.025043, 1, 1, 1, 1, 1,
0.8581256, 0.1631678, 3.124082, 0, 0, 1, 1, 1,
0.86132, -2.254184, 3.014889, 1, 0, 0, 1, 1,
0.8679422, -0.3398084, 0.2896072, 1, 0, 0, 1, 1,
0.8686509, 2.196272, -0.2848631, 1, 0, 0, 1, 1,
0.8735548, 1.165649, 0.9406117, 1, 0, 0, 1, 1,
0.8738167, -0.4200996, 1.95089, 1, 0, 0, 1, 1,
0.8743315, -1.649823, 3.731962, 0, 0, 0, 1, 1,
0.875583, 1.255626, 2.585725, 0, 0, 0, 1, 1,
0.8761288, -2.259816, 3.062549, 0, 0, 0, 1, 1,
0.8799239, -0.8189383, 1.726637, 0, 0, 0, 1, 1,
0.8913972, -0.686749, 2.789709, 0, 0, 0, 1, 1,
0.8942171, -0.5457612, 3.270196, 0, 0, 0, 1, 1,
0.8975829, -1.012604, 2.224359, 0, 0, 0, 1, 1,
0.9017046, 0.2511911, 2.119818, 1, 1, 1, 1, 1,
0.9101376, 2.011776, -1.330498, 1, 1, 1, 1, 1,
0.9186707, 0.4764125, 0.08848903, 1, 1, 1, 1, 1,
0.9216132, 1.858308, 1.294105, 1, 1, 1, 1, 1,
0.9217767, 1.586095, 0.6561387, 1, 1, 1, 1, 1,
0.9257908, 0.1670287, 0.9382933, 1, 1, 1, 1, 1,
0.939594, -1.375913, 2.845014, 1, 1, 1, 1, 1,
0.9468908, -0.06152015, 1.228544, 1, 1, 1, 1, 1,
0.953783, 0.9863755, -0.1966121, 1, 1, 1, 1, 1,
0.9628125, -0.3055856, 2.74807, 1, 1, 1, 1, 1,
0.9728028, 1.016076, 3.006498, 1, 1, 1, 1, 1,
0.9792033, -1.139989, 1.30727, 1, 1, 1, 1, 1,
0.9810717, -0.2137303, 2.4445, 1, 1, 1, 1, 1,
0.9858493, 1.33755, 0.7279303, 1, 1, 1, 1, 1,
0.993071, 0.160831, 2.16596, 1, 1, 1, 1, 1,
1.007053, -0.08163121, 2.014344, 0, 0, 1, 1, 1,
1.01132, 1.065967, 1.472116, 1, 0, 0, 1, 1,
1.014626, -0.2149781, 1.209553, 1, 0, 0, 1, 1,
1.016558, -0.5707657, 1.507933, 1, 0, 0, 1, 1,
1.029792, -0.9776236, 2.985568, 1, 0, 0, 1, 1,
1.034419, -0.5911624, 2.331086, 1, 0, 0, 1, 1,
1.03491, 1.469418, 1.818454, 0, 0, 0, 1, 1,
1.038509, 0.7271531, 2.245766, 0, 0, 0, 1, 1,
1.039838, 0.577433, 2.638474, 0, 0, 0, 1, 1,
1.042382, 0.422845, 1.332928, 0, 0, 0, 1, 1,
1.051283, -0.2563196, 1.700912, 0, 0, 0, 1, 1,
1.054289, -0.316885, 1.951121, 0, 0, 0, 1, 1,
1.058267, 1.108447, 1.675097, 0, 0, 0, 1, 1,
1.06392, -1.738718, 2.814449, 1, 1, 1, 1, 1,
1.066668, -1.488314, 3.349946, 1, 1, 1, 1, 1,
1.067067, -0.7966859, 2.060467, 1, 1, 1, 1, 1,
1.067487, 1.434271, -0.715843, 1, 1, 1, 1, 1,
1.075497, -0.2182372, 0.7536836, 1, 1, 1, 1, 1,
1.087686, -0.5790617, 1.664052, 1, 1, 1, 1, 1,
1.089181, -0.2725875, 1.0641, 1, 1, 1, 1, 1,
1.099006, -0.7203218, 4.21736, 1, 1, 1, 1, 1,
1.106342, 0.5174084, 2.318415, 1, 1, 1, 1, 1,
1.115769, -0.295954, 2.393585, 1, 1, 1, 1, 1,
1.12131, 0.6337258, -0.2864268, 1, 1, 1, 1, 1,
1.124727, 1.517151, 0.2831076, 1, 1, 1, 1, 1,
1.128356, 0.6099334, 1.104376, 1, 1, 1, 1, 1,
1.135358, -0.5466467, 0.6716532, 1, 1, 1, 1, 1,
1.142467, -0.01158369, 0.3985195, 1, 1, 1, 1, 1,
1.143584, -1.241055, 2.575301, 0, 0, 1, 1, 1,
1.143764, -0.1300687, 3.274872, 1, 0, 0, 1, 1,
1.146454, -1.480166, 3.305195, 1, 0, 0, 1, 1,
1.152609, 1.061869, 0.5832337, 1, 0, 0, 1, 1,
1.153409, -2.059117, 3.428514, 1, 0, 0, 1, 1,
1.153824, 1.180946, 0.680609, 1, 0, 0, 1, 1,
1.173866, 0.7019819, 0.8656954, 0, 0, 0, 1, 1,
1.175944, 1.417566, 1.969586, 0, 0, 0, 1, 1,
1.176285, 0.6907982, 0.0124216, 0, 0, 0, 1, 1,
1.176489, -1.239295, 2.266145, 0, 0, 0, 1, 1,
1.180916, -0.176686, 1.780808, 0, 0, 0, 1, 1,
1.189027, 0.598977, 1.196621, 0, 0, 0, 1, 1,
1.191149, 0.7118897, 0.4515789, 0, 0, 0, 1, 1,
1.191419, 0.5473496, 0.3583313, 1, 1, 1, 1, 1,
1.19264, 0.3814473, 1.714149, 1, 1, 1, 1, 1,
1.201879, 1.013867, 3.174994, 1, 1, 1, 1, 1,
1.20298, -1.589557, 0.6210784, 1, 1, 1, 1, 1,
1.206534, -0.003881948, 2.223112, 1, 1, 1, 1, 1,
1.207728, 1.112305, 1.678152, 1, 1, 1, 1, 1,
1.218634, 1.53068, -1.951332, 1, 1, 1, 1, 1,
1.218805, 0.1463225, 1.227863, 1, 1, 1, 1, 1,
1.22187, -0.7305106, 1.812702, 1, 1, 1, 1, 1,
1.223835, -0.6283358, 3.633315, 1, 1, 1, 1, 1,
1.224186, 0.06744622, 1.541098, 1, 1, 1, 1, 1,
1.226097, -0.6989606, 4.385535, 1, 1, 1, 1, 1,
1.239374, 1.447403, 1.184813, 1, 1, 1, 1, 1,
1.242334, 0.2162442, 0.5023164, 1, 1, 1, 1, 1,
1.255306, -0.8577322, 2.593691, 1, 1, 1, 1, 1,
1.257442, 0.2730133, 1.202682, 0, 0, 1, 1, 1,
1.266989, -1.237211, 2.649845, 1, 0, 0, 1, 1,
1.270017, 0.4747929, 0.6394883, 1, 0, 0, 1, 1,
1.275931, -0.6091971, 1.930674, 1, 0, 0, 1, 1,
1.276861, -0.5034208, 1.676857, 1, 0, 0, 1, 1,
1.283574, -0.7029743, 1.91205, 1, 0, 0, 1, 1,
1.283971, 0.1751621, 3.087105, 0, 0, 0, 1, 1,
1.286213, -0.644958, 2.802515, 0, 0, 0, 1, 1,
1.295218, -0.04541884, 0.753625, 0, 0, 0, 1, 1,
1.308333, 0.6864105, 0.9963819, 0, 0, 0, 1, 1,
1.313823, -1.091807, 1.904228, 0, 0, 0, 1, 1,
1.315066, 0.06680043, 0.6340807, 0, 0, 0, 1, 1,
1.337741, 2.938668, 0.714548, 0, 0, 0, 1, 1,
1.353141, 1.536454, -0.04871653, 1, 1, 1, 1, 1,
1.365608, -1.092372, 2.732917, 1, 1, 1, 1, 1,
1.368696, 0.2444949, 2.121136, 1, 1, 1, 1, 1,
1.376474, -0.7859656, 3.109991, 1, 1, 1, 1, 1,
1.385087, 0.6237618, 1.587364, 1, 1, 1, 1, 1,
1.390711, -1.09736, 0.5906825, 1, 1, 1, 1, 1,
1.393531, -0.6236728, 1.816976, 1, 1, 1, 1, 1,
1.403288, 1.083952, -0.3705532, 1, 1, 1, 1, 1,
1.403369, -0.3622488, 3.468532, 1, 1, 1, 1, 1,
1.403482, 0.6410146, 0.5533783, 1, 1, 1, 1, 1,
1.404905, -0.01776029, 2.110104, 1, 1, 1, 1, 1,
1.406152, 2.010808, 0.7872409, 1, 1, 1, 1, 1,
1.409301, -0.0114534, 2.339785, 1, 1, 1, 1, 1,
1.421042, 1.243587, 2.691033, 1, 1, 1, 1, 1,
1.423856, -1.049307, 1.456021, 1, 1, 1, 1, 1,
1.431286, -1.069183, 0.8458141, 0, 0, 1, 1, 1,
1.433308, -1.724471, 3.612936, 1, 0, 0, 1, 1,
1.447025, 0.8649406, 1.840302, 1, 0, 0, 1, 1,
1.456341, 0.887197, 2.233708, 1, 0, 0, 1, 1,
1.459305, -0.5571276, 1.238176, 1, 0, 0, 1, 1,
1.468339, -0.2359143, 0.5748304, 1, 0, 0, 1, 1,
1.480467, -0.4966102, 1.76666, 0, 0, 0, 1, 1,
1.493117, -0.107076, 1.773623, 0, 0, 0, 1, 1,
1.498536, 0.7789112, 1.650198, 0, 0, 0, 1, 1,
1.508317, -0.2276093, 2.129383, 0, 0, 0, 1, 1,
1.513459, -0.2327997, 2.516938, 0, 0, 0, 1, 1,
1.528043, 0.3402057, 1.66404, 0, 0, 0, 1, 1,
1.530283, 1.012581, 0.06641854, 0, 0, 0, 1, 1,
1.530883, 0.6459352, 0.5736798, 1, 1, 1, 1, 1,
1.531561, 0.3450617, 2.803267, 1, 1, 1, 1, 1,
1.543187, -1.237922, 0.7733068, 1, 1, 1, 1, 1,
1.549919, 0.4534741, 0.4997046, 1, 1, 1, 1, 1,
1.550826, 0.509136, 0.8766131, 1, 1, 1, 1, 1,
1.554443, 0.1339776, 0.5535448, 1, 1, 1, 1, 1,
1.575353, -2.127918, 2.861597, 1, 1, 1, 1, 1,
1.590602, 0.05669637, 1.247916, 1, 1, 1, 1, 1,
1.595179, 0.1132515, 2.410774, 1, 1, 1, 1, 1,
1.595897, -0.346868, 1.531673, 1, 1, 1, 1, 1,
1.629361, -2.373976, 3.334719, 1, 1, 1, 1, 1,
1.632367, 0.6674078, 1.857298, 1, 1, 1, 1, 1,
1.640039, 0.3660442, 0.3272206, 1, 1, 1, 1, 1,
1.643411, -0.6280088, 2.086784, 1, 1, 1, 1, 1,
1.656994, 1.744805, 1.250307, 1, 1, 1, 1, 1,
1.665903, -0.5160959, 1.23277, 0, 0, 1, 1, 1,
1.670372, -0.9465872, 1.625892, 1, 0, 0, 1, 1,
1.692817, 1.370842, 0.542343, 1, 0, 0, 1, 1,
1.708152, 0.7572355, 1.351376, 1, 0, 0, 1, 1,
1.716672, 0.9442357, 0.4708927, 1, 0, 0, 1, 1,
1.722116, 0.3072633, 4.557621, 1, 0, 0, 1, 1,
1.736179, 1.342339, 1.988146, 0, 0, 0, 1, 1,
1.739831, 0.5183988, 2.553729, 0, 0, 0, 1, 1,
1.753526, 1.186395, -1.791341, 0, 0, 0, 1, 1,
1.771474, -0.2029897, 2.707607, 0, 0, 0, 1, 1,
1.804228, -0.1017657, 1.364271, 0, 0, 0, 1, 1,
1.813113, -1.58106, 1.921945, 0, 0, 0, 1, 1,
1.819861, 0.1500651, 1.614087, 0, 0, 0, 1, 1,
1.827239, 1.287389, 1.483248, 1, 1, 1, 1, 1,
1.831501, 2.069754, 0.649215, 1, 1, 1, 1, 1,
1.858201, 0.7854385, -0.7498048, 1, 1, 1, 1, 1,
1.871068, -0.1504169, 0.9401381, 1, 1, 1, 1, 1,
1.877889, 1.160555, -0.3181277, 1, 1, 1, 1, 1,
1.90624, -0.8989304, 2.480388, 1, 1, 1, 1, 1,
1.939463, -0.309467, 2.097594, 1, 1, 1, 1, 1,
1.940397, 1.036281, -0.4187331, 1, 1, 1, 1, 1,
1.977602, -0.3262786, -1.04557, 1, 1, 1, 1, 1,
1.994752, -1.122363, 2.881936, 1, 1, 1, 1, 1,
2.007754, -1.683977, 1.516221, 1, 1, 1, 1, 1,
2.008754, -0.4305022, 3.629375, 1, 1, 1, 1, 1,
2.014112, -0.3322838, 1.664813, 1, 1, 1, 1, 1,
2.045879, 0.03532615, 2.108521, 1, 1, 1, 1, 1,
2.063247, -0.9221568, 2.124432, 1, 1, 1, 1, 1,
2.187909, -3.021597, 2.850092, 0, 0, 1, 1, 1,
2.21644, 0.6531335, 3.65429, 1, 0, 0, 1, 1,
2.223139, -0.01819547, 2.08232, 1, 0, 0, 1, 1,
2.256193, 0.9269345, 1.198987, 1, 0, 0, 1, 1,
2.284877, 0.9263834, 0.4330291, 1, 0, 0, 1, 1,
2.309418, -0.3113076, 0.7031904, 1, 0, 0, 1, 1,
2.314332, -0.2494715, 2.123505, 0, 0, 0, 1, 1,
2.346691, -0.6935886, 3.336286, 0, 0, 0, 1, 1,
2.365389, 0.5497831, 2.731302, 0, 0, 0, 1, 1,
2.482123, -0.7917296, 2.658448, 0, 0, 0, 1, 1,
2.684389, -0.7452976, 3.111782, 0, 0, 0, 1, 1,
2.731606, 0.0134169, 2.913772, 0, 0, 0, 1, 1,
2.746132, 1.152238, 1.724022, 0, 0, 0, 1, 1,
2.794209, 1.223934, 0.9921513, 1, 1, 1, 1, 1,
2.802767, -3.0834, 3.850967, 1, 1, 1, 1, 1,
2.814228, -1.275857, 0.8638688, 1, 1, 1, 1, 1,
2.818131, -1.443909, 3.455883, 1, 1, 1, 1, 1,
2.823517, 0.07026435, 2.615002, 1, 1, 1, 1, 1,
2.920576, -1.695246, 3.112007, 1, 1, 1, 1, 1,
3.446986, 0.3094268, 0.8135125, 1, 1, 1, 1, 1
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
var radius = 9.786921;
var distance = 34.37615;
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
mvMatrix.translate( -0.2425179, -0.1988704, -0.5205193 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.37615);
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
