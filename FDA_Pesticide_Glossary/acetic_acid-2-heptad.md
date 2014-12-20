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
-3.382154, 2.010484, -1.224255, 1, 0, 0, 1,
-3.206616, -0.9769499, -3.573398, 1, 0.007843138, 0, 1,
-3.103857, 0.8511556, -2.617675, 1, 0.01176471, 0, 1,
-2.938219, -1.026268, -1.897094, 1, 0.01960784, 0, 1,
-2.881144, 1.371949, 0.8540523, 1, 0.02352941, 0, 1,
-2.843326, -0.2453794, -2.359961, 1, 0.03137255, 0, 1,
-2.748117, 0.1841961, -2.055172, 1, 0.03529412, 0, 1,
-2.563661, 0.5284903, -0.8858137, 1, 0.04313726, 0, 1,
-2.521042, -0.8990307, -2.24863, 1, 0.04705882, 0, 1,
-2.447731, -0.1761449, -3.365422, 1, 0.05490196, 0, 1,
-2.443034, 0.9400655, -1.825411, 1, 0.05882353, 0, 1,
-2.432715, -1.344164, -1.251423, 1, 0.06666667, 0, 1,
-2.428128, -0.3516364, -3.812565, 1, 0.07058824, 0, 1,
-2.423077, 0.7592843, 0.310169, 1, 0.07843138, 0, 1,
-2.416843, -1.503246, -1.871946, 1, 0.08235294, 0, 1,
-2.281685, 0.3064507, -2.015889, 1, 0.09019608, 0, 1,
-2.259257, -2.296095, -1.838576, 1, 0.09411765, 0, 1,
-2.247986, -0.10523, -2.61506, 1, 0.1019608, 0, 1,
-2.230011, 0.7835656, -1.916613, 1, 0.1098039, 0, 1,
-2.227192, 0.2433712, -1.220285, 1, 0.1137255, 0, 1,
-2.224082, -1.756283, -3.383183, 1, 0.1215686, 0, 1,
-2.207842, 0.4738115, -0.7030133, 1, 0.1254902, 0, 1,
-2.164891, 0.2809846, -1.852259, 1, 0.1333333, 0, 1,
-2.100444, 0.1646634, -0.8144535, 1, 0.1372549, 0, 1,
-2.091249, 2.374013, 1.084238, 1, 0.145098, 0, 1,
-2.075232, 1.808723, 1.040094, 1, 0.1490196, 0, 1,
-2.058697, -0.2580253, -1.846693, 1, 0.1568628, 0, 1,
-2.030751, 2.662774, -2.626526, 1, 0.1607843, 0, 1,
-1.995426, -0.02104201, -0.9830956, 1, 0.1686275, 0, 1,
-1.991723, 1.661818, -1.539457, 1, 0.172549, 0, 1,
-1.98065, 0.7830526, -1.402374, 1, 0.1803922, 0, 1,
-1.980534, 0.6522958, -2.112873, 1, 0.1843137, 0, 1,
-1.935273, -1.35701, -2.204495, 1, 0.1921569, 0, 1,
-1.9344, -0.2105843, -0.4208911, 1, 0.1960784, 0, 1,
-1.917628, -1.593402, -1.845245, 1, 0.2039216, 0, 1,
-1.912693, -1.543693, -4.723021, 1, 0.2117647, 0, 1,
-1.910914, -0.9996373, -2.307391, 1, 0.2156863, 0, 1,
-1.902609, -1.645144, -2.535626, 1, 0.2235294, 0, 1,
-1.902054, -0.3829804, -2.129229, 1, 0.227451, 0, 1,
-1.882273, 0.4133926, -1.545338, 1, 0.2352941, 0, 1,
-1.880956, -0.06220366, -1.389037, 1, 0.2392157, 0, 1,
-1.862234, 1.722551, -0.3427731, 1, 0.2470588, 0, 1,
-1.842726, 1.78499, -0.2006613, 1, 0.2509804, 0, 1,
-1.836029, -0.2452887, -3.4207, 1, 0.2588235, 0, 1,
-1.831911, -0.9985971, -3.528595, 1, 0.2627451, 0, 1,
-1.822237, 1.369585, -0.3171303, 1, 0.2705882, 0, 1,
-1.792049, 0.2785787, -1.14689, 1, 0.2745098, 0, 1,
-1.779024, -0.02230222, 0.383453, 1, 0.282353, 0, 1,
-1.778613, 0.2581443, -2.162763, 1, 0.2862745, 0, 1,
-1.763676, -1.070441, -2.51492, 1, 0.2941177, 0, 1,
-1.74062, -0.2034416, -2.035289, 1, 0.3019608, 0, 1,
-1.730642, 2.131776, -0.6820166, 1, 0.3058824, 0, 1,
-1.710732, -0.4729956, -1.21496, 1, 0.3137255, 0, 1,
-1.698952, -2.713234, -3.532177, 1, 0.3176471, 0, 1,
-1.685259, -2.168164, -3.215835, 1, 0.3254902, 0, 1,
-1.673321, 0.7289652, -1.936183, 1, 0.3294118, 0, 1,
-1.670681, 1.051556, -1.510137, 1, 0.3372549, 0, 1,
-1.66558, 0.4792374, -2.679485, 1, 0.3411765, 0, 1,
-1.656952, -0.5182737, -2.494821, 1, 0.3490196, 0, 1,
-1.655108, 1.859096, -2.54557, 1, 0.3529412, 0, 1,
-1.651212, -0.2248603, -1.032206, 1, 0.3607843, 0, 1,
-1.647031, 0.3846457, -1.068694, 1, 0.3647059, 0, 1,
-1.627873, -0.4354368, -4.267722, 1, 0.372549, 0, 1,
-1.618944, 0.1767223, -0.6391038, 1, 0.3764706, 0, 1,
-1.616845, 1.004144, -0.3748858, 1, 0.3843137, 0, 1,
-1.615309, -0.2928987, -2.818289, 1, 0.3882353, 0, 1,
-1.614842, -0.1780521, -1.051338, 1, 0.3960784, 0, 1,
-1.607453, -1.624121, -2.28459, 1, 0.4039216, 0, 1,
-1.600372, -0.1986541, -1.254517, 1, 0.4078431, 0, 1,
-1.579999, -0.8945612, -1.047503, 1, 0.4156863, 0, 1,
-1.572659, -0.04534301, -1.549125, 1, 0.4196078, 0, 1,
-1.560248, 1.107421, 0.6814218, 1, 0.427451, 0, 1,
-1.559615, 1.15892, -1.979033, 1, 0.4313726, 0, 1,
-1.542585, -1.990647, -3.085634, 1, 0.4392157, 0, 1,
-1.535586, 0.2289907, -0.7658094, 1, 0.4431373, 0, 1,
-1.532235, 1.36371, -0.5967151, 1, 0.4509804, 0, 1,
-1.524639, -0.2024126, -2.094196, 1, 0.454902, 0, 1,
-1.519786, -0.5485778, -2.136665, 1, 0.4627451, 0, 1,
-1.512991, 0.8401545, 0.1387838, 1, 0.4666667, 0, 1,
-1.507357, -1.134182, -1.321463, 1, 0.4745098, 0, 1,
-1.503094, 0.3961438, -1.037776, 1, 0.4784314, 0, 1,
-1.495114, -0.5696322, -2.307005, 1, 0.4862745, 0, 1,
-1.487599, 0.6637086, -0.8874272, 1, 0.4901961, 0, 1,
-1.48442, -1.350555, -2.487323, 1, 0.4980392, 0, 1,
-1.470457, 0.7269669, -1.85191, 1, 0.5058824, 0, 1,
-1.463292, -0.9863752, -0.7645448, 1, 0.509804, 0, 1,
-1.452614, 0.982013, 0.1437699, 1, 0.5176471, 0, 1,
-1.452276, 0.5020866, -0.7663869, 1, 0.5215687, 0, 1,
-1.445651, -1.09086, -2.838126, 1, 0.5294118, 0, 1,
-1.421842, 0.3451612, -1.024783, 1, 0.5333334, 0, 1,
-1.417061, 1.107394, -2.242762, 1, 0.5411765, 0, 1,
-1.407434, 0.663823, -0.2014079, 1, 0.5450981, 0, 1,
-1.400551, 0.02165907, -0.4157075, 1, 0.5529412, 0, 1,
-1.396552, 0.5166281, 0.06059492, 1, 0.5568628, 0, 1,
-1.38783, -0.09311597, -3.047422, 1, 0.5647059, 0, 1,
-1.368059, -0.8113558, -2.947676, 1, 0.5686275, 0, 1,
-1.367045, -0.554177, -2.591815, 1, 0.5764706, 0, 1,
-1.353545, -0.4323196, -1.692955, 1, 0.5803922, 0, 1,
-1.351964, 0.1371961, -1.375566, 1, 0.5882353, 0, 1,
-1.342802, 1.507587, -0.9240577, 1, 0.5921569, 0, 1,
-1.336774, -1.740127, -2.802048, 1, 0.6, 0, 1,
-1.336643, 0.4325745, -1.291245, 1, 0.6078432, 0, 1,
-1.334643, -1.498817, -2.448771, 1, 0.6117647, 0, 1,
-1.313089, 1.543175, 0.132913, 1, 0.6196079, 0, 1,
-1.295546, 0.04929012, -2.33327, 1, 0.6235294, 0, 1,
-1.294397, 0.4080093, -3.700154, 1, 0.6313726, 0, 1,
-1.289344, -1.266442, -2.485854, 1, 0.6352941, 0, 1,
-1.281754, -0.3232588, -1.656012, 1, 0.6431373, 0, 1,
-1.275589, -0.3238933, -0.5673858, 1, 0.6470588, 0, 1,
-1.26418, -0.3007101, -2.324103, 1, 0.654902, 0, 1,
-1.26147, -1.527554, -0.6961647, 1, 0.6588235, 0, 1,
-1.249336, -1.320893, -1.448255, 1, 0.6666667, 0, 1,
-1.247214, 0.5966924, -0.3285852, 1, 0.6705883, 0, 1,
-1.232372, 1.243836, -0.9364367, 1, 0.6784314, 0, 1,
-1.218966, -2.452794, -2.975479, 1, 0.682353, 0, 1,
-1.217852, 0.4061235, -0.6276948, 1, 0.6901961, 0, 1,
-1.217394, 1.302926, 0.1089939, 1, 0.6941177, 0, 1,
-1.217152, 1.948362, 0.02799493, 1, 0.7019608, 0, 1,
-1.214056, 0.3235728, -1.060266, 1, 0.7098039, 0, 1,
-1.212648, -0.05806271, -0.7916391, 1, 0.7137255, 0, 1,
-1.206899, -0.3439004, -1.540361, 1, 0.7215686, 0, 1,
-1.204955, 0.5402943, -3.211237, 1, 0.7254902, 0, 1,
-1.192449, 1.443028, 0.7500321, 1, 0.7333333, 0, 1,
-1.192071, 0.4149365, -2.55794, 1, 0.7372549, 0, 1,
-1.190144, -0.7256633, -3.360744, 1, 0.7450981, 0, 1,
-1.189762, -0.5614862, -2.094004, 1, 0.7490196, 0, 1,
-1.187389, 0.9584279, -1.429714, 1, 0.7568628, 0, 1,
-1.179992, 0.245696, -1.057931, 1, 0.7607843, 0, 1,
-1.178976, -0.7738555, -0.02096123, 1, 0.7686275, 0, 1,
-1.178335, -1.238344, -3.206325, 1, 0.772549, 0, 1,
-1.172081, -2.529001, -2.963473, 1, 0.7803922, 0, 1,
-1.165413, 1.821583, -0.2561997, 1, 0.7843137, 0, 1,
-1.164968, -1.79032, -1.841832, 1, 0.7921569, 0, 1,
-1.162841, -0.2437128, -1.474953, 1, 0.7960784, 0, 1,
-1.161598, 0.1586568, -2.624002, 1, 0.8039216, 0, 1,
-1.160687, -0.8002492, -0.75528, 1, 0.8117647, 0, 1,
-1.157339, -0.93705, -1.011632, 1, 0.8156863, 0, 1,
-1.152151, 0.3090895, 0.04696134, 1, 0.8235294, 0, 1,
-1.149527, -0.6490784, -0.7644367, 1, 0.827451, 0, 1,
-1.137309, 1.13706, -1.058487, 1, 0.8352941, 0, 1,
-1.133872, -2.062852, -3.17641, 1, 0.8392157, 0, 1,
-1.133255, -2.475523, -1.86582, 1, 0.8470588, 0, 1,
-1.122509, -1.36588, -2.776329, 1, 0.8509804, 0, 1,
-1.117524, -0.2145252, -0.6554564, 1, 0.8588235, 0, 1,
-1.112752, -1.886721, -2.887437, 1, 0.8627451, 0, 1,
-1.111824, 1.700464, -1.374965, 1, 0.8705882, 0, 1,
-1.111307, -0.2077895, 0.1358498, 1, 0.8745098, 0, 1,
-1.104453, -0.9432238, -2.617572, 1, 0.8823529, 0, 1,
-1.098033, -0.3378185, -1.731718, 1, 0.8862745, 0, 1,
-1.088721, 0.07615708, -0.01846297, 1, 0.8941177, 0, 1,
-1.086862, -0.3039185, -1.422368, 1, 0.8980392, 0, 1,
-1.083723, 0.1820709, -1.179011, 1, 0.9058824, 0, 1,
-1.081459, 0.6283971, 0.3028464, 1, 0.9137255, 0, 1,
-1.07565, -0.9182636, -2.318148, 1, 0.9176471, 0, 1,
-1.070957, 0.3962854, -1.492586, 1, 0.9254902, 0, 1,
-1.070166, -0.5076599, -1.173499, 1, 0.9294118, 0, 1,
-1.06163, -1.435653, -4.206975, 1, 0.9372549, 0, 1,
-1.060721, -0.05535443, -2.005768, 1, 0.9411765, 0, 1,
-1.058084, 0.08698032, -1.038362, 1, 0.9490196, 0, 1,
-1.053489, -0.124645, -0.2530837, 1, 0.9529412, 0, 1,
-1.036373, 1.228084, -3.726844, 1, 0.9607843, 0, 1,
-1.034909, 2.570194, 0.5198304, 1, 0.9647059, 0, 1,
-1.034217, 0.3308484, -0.3556502, 1, 0.972549, 0, 1,
-1.030994, 1.272408, -0.974994, 1, 0.9764706, 0, 1,
-1.029287, 0.9776306, -2.49064, 1, 0.9843137, 0, 1,
-1.025027, -0.8657975, -3.318092, 1, 0.9882353, 0, 1,
-1.020407, 0.3815496, -0.3522899, 1, 0.9960784, 0, 1,
-1.019171, 0.3204399, -2.210672, 0.9960784, 1, 0, 1,
-1.016568, 0.8297029, -0.372093, 0.9921569, 1, 0, 1,
-1.015674, 0.0509681, -1.708891, 0.9843137, 1, 0, 1,
-1.01067, -0.0760373, -2.241724, 0.9803922, 1, 0, 1,
-1.007611, 0.5712851, -1.367671, 0.972549, 1, 0, 1,
-1.00677, 0.322837, -2.40148, 0.9686275, 1, 0, 1,
-1.005697, -0.008916883, -1.351914, 0.9607843, 1, 0, 1,
-1.003711, 0.00995768, -0.03855573, 0.9568627, 1, 0, 1,
-0.999554, -0.6589514, -2.877369, 0.9490196, 1, 0, 1,
-0.9959524, 0.3716416, -1.19425, 0.945098, 1, 0, 1,
-0.9957371, -0.1187241, -1.249283, 0.9372549, 1, 0, 1,
-0.9816503, -0.8635501, -3.706577, 0.9333333, 1, 0, 1,
-0.9779961, 0.2752889, 0.6168257, 0.9254902, 1, 0, 1,
-0.9754605, 0.2406281, -0.9215877, 0.9215686, 1, 0, 1,
-0.972609, 0.9357754, -0.4162116, 0.9137255, 1, 0, 1,
-0.9695703, 0.1906302, -1.03111, 0.9098039, 1, 0, 1,
-0.9670386, 0.9519132, -1.621563, 0.9019608, 1, 0, 1,
-0.9615626, -0.1268119, -1.884503, 0.8941177, 1, 0, 1,
-0.9597299, -1.616094, -2.643641, 0.8901961, 1, 0, 1,
-0.9582505, 0.1545527, -3.372874, 0.8823529, 1, 0, 1,
-0.9525717, 0.253752, -1.55928, 0.8784314, 1, 0, 1,
-0.952267, 0.02685095, -2.926724, 0.8705882, 1, 0, 1,
-0.9495751, -0.9517463, -1.48387, 0.8666667, 1, 0, 1,
-0.9442862, 0.8394367, -1.834377, 0.8588235, 1, 0, 1,
-0.9403597, 0.4256683, -0.8693342, 0.854902, 1, 0, 1,
-0.9389675, 0.751402, -1.073938, 0.8470588, 1, 0, 1,
-0.9367975, -0.4632675, -3.743829, 0.8431373, 1, 0, 1,
-0.9347348, -1.265081, -2.693783, 0.8352941, 1, 0, 1,
-0.9308283, 0.9546944, -1.069605, 0.8313726, 1, 0, 1,
-0.9306373, 0.680226, -0.6156523, 0.8235294, 1, 0, 1,
-0.9303872, 1.170742, -2.50712, 0.8196079, 1, 0, 1,
-0.9296862, 1.451061, -1.869163, 0.8117647, 1, 0, 1,
-0.9228363, 1.573446, -0.3820814, 0.8078431, 1, 0, 1,
-0.9225784, 0.4843891, -1.491437, 0.8, 1, 0, 1,
-0.914113, -0.9786084, -3.779808, 0.7921569, 1, 0, 1,
-0.911069, -1.126026, -2.230429, 0.7882353, 1, 0, 1,
-0.9104527, -0.3708881, -1.745448, 0.7803922, 1, 0, 1,
-0.9031815, 0.5354784, -0.1536144, 0.7764706, 1, 0, 1,
-0.8976552, -0.1358771, -4.045069, 0.7686275, 1, 0, 1,
-0.89012, -0.2761189, -2.973904, 0.7647059, 1, 0, 1,
-0.8829042, 1.04432, 0.09031238, 0.7568628, 1, 0, 1,
-0.8811527, -0.351815, -2.241584, 0.7529412, 1, 0, 1,
-0.8786547, 0.2708231, -0.154467, 0.7450981, 1, 0, 1,
-0.8781932, 0.5796598, -1.839181, 0.7411765, 1, 0, 1,
-0.875545, 0.8935218, -1.360573, 0.7333333, 1, 0, 1,
-0.8734319, 0.8643261, -1.505407, 0.7294118, 1, 0, 1,
-0.8669209, -0.7041416, -1.953516, 0.7215686, 1, 0, 1,
-0.8631681, 0.3329072, -3.67787, 0.7176471, 1, 0, 1,
-0.8600836, -1.386912, -3.909917, 0.7098039, 1, 0, 1,
-0.8586937, -0.6870469, -4.128601, 0.7058824, 1, 0, 1,
-0.8586026, 0.4785096, -0.1876908, 0.6980392, 1, 0, 1,
-0.8513454, -0.6628263, -2.720344, 0.6901961, 1, 0, 1,
-0.8509927, 0.2599439, -2.2481, 0.6862745, 1, 0, 1,
-0.8496208, 0.08372157, -1.5342, 0.6784314, 1, 0, 1,
-0.8446816, -1.705894, -2.690293, 0.6745098, 1, 0, 1,
-0.8426514, 0.8790478, -0.3004219, 0.6666667, 1, 0, 1,
-0.8358324, 0.7464864, -0.7906184, 0.6627451, 1, 0, 1,
-0.8324312, -0.5435907, -2.093866, 0.654902, 1, 0, 1,
-0.8212001, 0.1651209, -1.494062, 0.6509804, 1, 0, 1,
-0.8205401, -1.477312, -2.829756, 0.6431373, 1, 0, 1,
-0.8174428, -2.096824, -1.010284, 0.6392157, 1, 0, 1,
-0.8156682, 1.118806, -0.7294555, 0.6313726, 1, 0, 1,
-0.8117908, -0.1891854, -2.278761, 0.627451, 1, 0, 1,
-0.8101813, -0.08415428, -1.471166, 0.6196079, 1, 0, 1,
-0.8085898, -0.4993345, -0.2497797, 0.6156863, 1, 0, 1,
-0.8060776, 0.3622557, -0.7461852, 0.6078432, 1, 0, 1,
-0.7994859, -0.08538247, 0.03735469, 0.6039216, 1, 0, 1,
-0.7934759, 0.2825415, -0.9023426, 0.5960785, 1, 0, 1,
-0.7913939, 1.129938, 1.029971, 0.5882353, 1, 0, 1,
-0.7905621, -0.1063039, -0.1840656, 0.5843138, 1, 0, 1,
-0.7902693, 0.1412956, -0.8369415, 0.5764706, 1, 0, 1,
-0.7891343, -0.2947589, -1.681658, 0.572549, 1, 0, 1,
-0.7865671, -1.334025, -3.121207, 0.5647059, 1, 0, 1,
-0.7757583, -1.800398, -3.596267, 0.5607843, 1, 0, 1,
-0.7653249, -0.96946, -2.923918, 0.5529412, 1, 0, 1,
-0.7632445, 1.267756, -0.519175, 0.5490196, 1, 0, 1,
-0.7621207, -1.130686, -2.80258, 0.5411765, 1, 0, 1,
-0.7585035, -2.078999, -1.95918, 0.5372549, 1, 0, 1,
-0.7513514, 0.1349437, -1.517405, 0.5294118, 1, 0, 1,
-0.7467394, 0.7783824, -1.323826, 0.5254902, 1, 0, 1,
-0.7433262, 0.5543389, -0.9472536, 0.5176471, 1, 0, 1,
-0.7418133, -0.5546967, -1.946324, 0.5137255, 1, 0, 1,
-0.741243, -0.5132935, -0.9242641, 0.5058824, 1, 0, 1,
-0.7396855, 0.8434131, -1.177284, 0.5019608, 1, 0, 1,
-0.7360749, 0.4375989, -1.137183, 0.4941176, 1, 0, 1,
-0.7339626, 1.608006, 0.108606, 0.4862745, 1, 0, 1,
-0.7327577, -1.179562, -3.661849, 0.4823529, 1, 0, 1,
-0.7322111, -1.606468, -3.007396, 0.4745098, 1, 0, 1,
-0.7210816, -0.2352547, -3.375926, 0.4705882, 1, 0, 1,
-0.7185169, 1.267775, -1.070004, 0.4627451, 1, 0, 1,
-0.7068648, 0.5852976, -1.186982, 0.4588235, 1, 0, 1,
-0.7049438, 0.9990306, -1.025659, 0.4509804, 1, 0, 1,
-0.6963504, 2.71782, -1.506345, 0.4470588, 1, 0, 1,
-0.6884935, 1.073587, -0.3388751, 0.4392157, 1, 0, 1,
-0.6866376, 1.476613, 0.1555275, 0.4352941, 1, 0, 1,
-0.6847722, -0.4778176, -1.998155, 0.427451, 1, 0, 1,
-0.6756577, -1.183936, -1.108527, 0.4235294, 1, 0, 1,
-0.6681805, -0.7625472, 0.05955209, 0.4156863, 1, 0, 1,
-0.6617368, -0.8467001, -2.067655, 0.4117647, 1, 0, 1,
-0.6592151, -0.7725233, -2.249887, 0.4039216, 1, 0, 1,
-0.6591625, 0.4067936, -0.3012723, 0.3960784, 1, 0, 1,
-0.6492646, -0.3879498, -2.31137, 0.3921569, 1, 0, 1,
-0.644062, -1.133268, -3.687008, 0.3843137, 1, 0, 1,
-0.6388832, -0.5291076, -1.929379, 0.3803922, 1, 0, 1,
-0.6376699, 2.256281, -1.269124, 0.372549, 1, 0, 1,
-0.636003, 1.717178, -0.09094688, 0.3686275, 1, 0, 1,
-0.6322829, -1.486433, -0.9650727, 0.3607843, 1, 0, 1,
-0.6284211, 0.5434883, -0.6383545, 0.3568628, 1, 0, 1,
-0.6276024, -1.560942, -0.9873624, 0.3490196, 1, 0, 1,
-0.6262811, 0.009358635, -3.182392, 0.345098, 1, 0, 1,
-0.6225678, -0.06851535, -0.0472695, 0.3372549, 1, 0, 1,
-0.6175483, 1.355438, -1.088613, 0.3333333, 1, 0, 1,
-0.6162924, -0.64263, -5.381013, 0.3254902, 1, 0, 1,
-0.6162423, 2.834702, -0.1727475, 0.3215686, 1, 0, 1,
-0.6156702, -1.002746, -1.458028, 0.3137255, 1, 0, 1,
-0.6145799, 0.09162509, 0.6361223, 0.3098039, 1, 0, 1,
-0.6126751, -0.2224382, -2.614801, 0.3019608, 1, 0, 1,
-0.6077296, 0.0666441, -0.7144395, 0.2941177, 1, 0, 1,
-0.6059082, -1.088634, -3.462294, 0.2901961, 1, 0, 1,
-0.6024487, 0.4568943, 0.1928379, 0.282353, 1, 0, 1,
-0.6002416, 2.022407, -0.6807506, 0.2784314, 1, 0, 1,
-0.5926386, 0.1683121, -0.910956, 0.2705882, 1, 0, 1,
-0.5844699, -0.3905481, -2.709485, 0.2666667, 1, 0, 1,
-0.5817979, 0.2997413, -0.6134142, 0.2588235, 1, 0, 1,
-0.5776724, -0.05576336, -2.209415, 0.254902, 1, 0, 1,
-0.5771452, 1.516287, -0.690769, 0.2470588, 1, 0, 1,
-0.5701888, 2.014076, -0.7011935, 0.2431373, 1, 0, 1,
-0.567688, -1.347063, -3.173828, 0.2352941, 1, 0, 1,
-0.5666501, 0.6589044, -2.02795, 0.2313726, 1, 0, 1,
-0.56378, -0.3992275, -2.352073, 0.2235294, 1, 0, 1,
-0.5629562, 0.2263125, -0.9883371, 0.2196078, 1, 0, 1,
-0.5619962, 1.604412, -2.178326, 0.2117647, 1, 0, 1,
-0.5595995, -1.156689, -3.102485, 0.2078431, 1, 0, 1,
-0.5584117, -0.7823457, -3.948121, 0.2, 1, 0, 1,
-0.5522966, -1.664952, -2.16181, 0.1921569, 1, 0, 1,
-0.5490153, 0.4381381, 0.5570617, 0.1882353, 1, 0, 1,
-0.5474939, -0.84698, -4.80465, 0.1803922, 1, 0, 1,
-0.5472984, -1.059724, -2.414252, 0.1764706, 1, 0, 1,
-0.5462428, 0.3727856, -1.294679, 0.1686275, 1, 0, 1,
-0.5460154, -0.1285716, 0.1345834, 0.1647059, 1, 0, 1,
-0.5431278, 1.065261, -2.219945, 0.1568628, 1, 0, 1,
-0.5413179, -0.6656619, -3.036302, 0.1529412, 1, 0, 1,
-0.5407304, 1.379902, 0.1228992, 0.145098, 1, 0, 1,
-0.5273674, 0.7699099, -0.6935101, 0.1411765, 1, 0, 1,
-0.5257794, 0.2826833, -2.039034, 0.1333333, 1, 0, 1,
-0.5247732, -0.1305291, -2.190432, 0.1294118, 1, 0, 1,
-0.521417, -0.3086356, -3.791175, 0.1215686, 1, 0, 1,
-0.5092072, -0.2678209, -2.171387, 0.1176471, 1, 0, 1,
-0.5059863, 0.8400846, 0.9392595, 0.1098039, 1, 0, 1,
-0.5014709, 1.017179, 0.795215, 0.1058824, 1, 0, 1,
-0.4960508, -0.3080484, -2.545262, 0.09803922, 1, 0, 1,
-0.4938046, 1.318125, 0.5608605, 0.09019608, 1, 0, 1,
-0.4932651, 0.8268172, -0.07351501, 0.08627451, 1, 0, 1,
-0.4904824, 0.9239152, 0.572191, 0.07843138, 1, 0, 1,
-0.4894825, -0.6664988, -2.842858, 0.07450981, 1, 0, 1,
-0.4892584, -1.783144, -3.601109, 0.06666667, 1, 0, 1,
-0.4862323, 1.292085, 1.461005, 0.0627451, 1, 0, 1,
-0.4792496, -0.8350518, -1.744873, 0.05490196, 1, 0, 1,
-0.4772988, 0.02741653, -0.2569391, 0.05098039, 1, 0, 1,
-0.476744, 1.508768, -1.981547, 0.04313726, 1, 0, 1,
-0.4755818, 0.4559185, -0.8931451, 0.03921569, 1, 0, 1,
-0.4750235, -1.190499, -2.629515, 0.03137255, 1, 0, 1,
-0.4748073, 0.7987462, -0.6545193, 0.02745098, 1, 0, 1,
-0.4743497, 0.01185744, -2.404018, 0.01960784, 1, 0, 1,
-0.47306, -0.8275171, -2.802735, 0.01568628, 1, 0, 1,
-0.4724669, 1.312579, -0.8687722, 0.007843138, 1, 0, 1,
-0.4671174, -1.303096, -3.37718, 0.003921569, 1, 0, 1,
-0.4655248, 1.230572, 0.5194537, 0, 1, 0.003921569, 1,
-0.464748, 0.5178334, -0.7551075, 0, 1, 0.01176471, 1,
-0.4643937, 0.1695443, -2.263483, 0, 1, 0.01568628, 1,
-0.4643661, -0.5018217, -2.308125, 0, 1, 0.02352941, 1,
-0.4642937, 1.127047, -1.381573, 0, 1, 0.02745098, 1,
-0.4589134, 0.8178808, -1.551519, 0, 1, 0.03529412, 1,
-0.4504819, 0.7508498, -0.8787382, 0, 1, 0.03921569, 1,
-0.448816, 0.2308772, -2.16162, 0, 1, 0.04705882, 1,
-0.446274, -0.8450224, -1.170509, 0, 1, 0.05098039, 1,
-0.4426392, -0.7526771, -1.604504, 0, 1, 0.05882353, 1,
-0.4394998, -0.4515336, -1.844081, 0, 1, 0.0627451, 1,
-0.4366028, -0.2933525, -2.167272, 0, 1, 0.07058824, 1,
-0.4335265, -0.5968448, -2.442675, 0, 1, 0.07450981, 1,
-0.4331432, 0.515435, -0.2602768, 0, 1, 0.08235294, 1,
-0.4308369, 0.9627715, -1.09809, 0, 1, 0.08627451, 1,
-0.4267249, 0.9683183, -0.6525517, 0, 1, 0.09411765, 1,
-0.4229771, -0.2357912, -1.557623, 0, 1, 0.1019608, 1,
-0.4219812, 0.2788079, -0.2368267, 0, 1, 0.1058824, 1,
-0.4209342, 1.587842, -0.9391175, 0, 1, 0.1137255, 1,
-0.4203344, 1.969424, -2.95675, 0, 1, 0.1176471, 1,
-0.4180217, 1.061361, -2.540215, 0, 1, 0.1254902, 1,
-0.4138584, 1.046186, 0.01089507, 0, 1, 0.1294118, 1,
-0.4122462, -2.43426, -3.653656, 0, 1, 0.1372549, 1,
-0.4117652, 0.1175571, -1.316425, 0, 1, 0.1411765, 1,
-0.4025129, -1.160649, -0.3270085, 0, 1, 0.1490196, 1,
-0.3923259, 0.34816, -2.086947, 0, 1, 0.1529412, 1,
-0.3907637, 1.449333, 0.402478, 0, 1, 0.1607843, 1,
-0.3900549, 0.7300423, -0.3636284, 0, 1, 0.1647059, 1,
-0.3879443, -0.09127872, -3.192883, 0, 1, 0.172549, 1,
-0.3858218, -1.983378, -3.132231, 0, 1, 0.1764706, 1,
-0.3850226, 0.3141982, -1.977386, 0, 1, 0.1843137, 1,
-0.3846906, -0.5061995, -2.098514, 0, 1, 0.1882353, 1,
-0.3844857, 1.403835, 0.3846211, 0, 1, 0.1960784, 1,
-0.384063, -0.06194452, -1.403944, 0, 1, 0.2039216, 1,
-0.382356, -0.282521, -1.137003, 0, 1, 0.2078431, 1,
-0.3784674, 0.2531508, 0.123741, 0, 1, 0.2156863, 1,
-0.3779584, 0.6079916, -1.409977, 0, 1, 0.2196078, 1,
-0.3774936, 1.136716, 0.767316, 0, 1, 0.227451, 1,
-0.3747774, -0.9028451, -1.924109, 0, 1, 0.2313726, 1,
-0.3745228, -0.5831529, -2.58507, 0, 1, 0.2392157, 1,
-0.3726307, -0.07757291, -1.620475, 0, 1, 0.2431373, 1,
-0.3668749, 2.211079, 0.03838124, 0, 1, 0.2509804, 1,
-0.3661697, -0.8371087, -3.341181, 0, 1, 0.254902, 1,
-0.3602051, -2.356112, -3.160916, 0, 1, 0.2627451, 1,
-0.3569403, -0.2059377, -2.961021, 0, 1, 0.2666667, 1,
-0.3544926, 0.6835797, -1.095901, 0, 1, 0.2745098, 1,
-0.3534245, -0.8842274, -2.906037, 0, 1, 0.2784314, 1,
-0.3527441, 0.008995279, -2.669046, 0, 1, 0.2862745, 1,
-0.350478, 1.322789, -1.963959, 0, 1, 0.2901961, 1,
-0.3485432, 1.043976, -1.757664, 0, 1, 0.2980392, 1,
-0.3453147, -0.1426827, -0.3947817, 0, 1, 0.3058824, 1,
-0.341214, -1.135126, -2.262754, 0, 1, 0.3098039, 1,
-0.3392037, -0.09397385, -0.004276397, 0, 1, 0.3176471, 1,
-0.3367306, 0.4411394, -1.033334, 0, 1, 0.3215686, 1,
-0.3359739, -0.3327216, -0.9698706, 0, 1, 0.3294118, 1,
-0.3349316, 0.6343705, -0.2642679, 0, 1, 0.3333333, 1,
-0.3326743, -1.232012, -2.925926, 0, 1, 0.3411765, 1,
-0.3229485, 0.2169306, -0.739954, 0, 1, 0.345098, 1,
-0.3199541, -0.03912516, -3.197657, 0, 1, 0.3529412, 1,
-0.3180813, -0.04829062, -3.086613, 0, 1, 0.3568628, 1,
-0.3176887, 0.3999619, -1.174945, 0, 1, 0.3647059, 1,
-0.3174051, -0.5169574, -3.186624, 0, 1, 0.3686275, 1,
-0.3170551, -0.169759, -3.082615, 0, 1, 0.3764706, 1,
-0.3160697, -1.302555, -2.916459, 0, 1, 0.3803922, 1,
-0.3107207, -0.4249405, -2.12885, 0, 1, 0.3882353, 1,
-0.3066093, -0.9660144, -1.927484, 0, 1, 0.3921569, 1,
-0.3058317, 0.5200464, -0.4866256, 0, 1, 0.4, 1,
-0.296517, -1.00669, -2.540189, 0, 1, 0.4078431, 1,
-0.2960842, -0.1160033, -3.614709, 0, 1, 0.4117647, 1,
-0.295387, -0.2665721, -2.197193, 0, 1, 0.4196078, 1,
-0.2914742, 1.108645, -0.6023232, 0, 1, 0.4235294, 1,
-0.2911638, 0.630796, -0.1173847, 0, 1, 0.4313726, 1,
-0.2901082, -0.1293571, -3.635598, 0, 1, 0.4352941, 1,
-0.284918, -0.2632058, -3.061962, 0, 1, 0.4431373, 1,
-0.2839649, 0.5844446, 0.005359122, 0, 1, 0.4470588, 1,
-0.2817208, -0.4688484, -3.748119, 0, 1, 0.454902, 1,
-0.2792291, -0.9979168, -4.186929, 0, 1, 0.4588235, 1,
-0.2790326, -0.6865082, -1.307275, 0, 1, 0.4666667, 1,
-0.2777512, -0.7494699, -3.433893, 0, 1, 0.4705882, 1,
-0.2755934, 2.656107, -1.107241, 0, 1, 0.4784314, 1,
-0.2673525, -0.911308, -2.454149, 0, 1, 0.4823529, 1,
-0.2642155, -0.2564963, -2.519712, 0, 1, 0.4901961, 1,
-0.2641248, -1.584197, -2.215822, 0, 1, 0.4941176, 1,
-0.2631887, 1.604695, -0.04675462, 0, 1, 0.5019608, 1,
-0.260065, 0.5914925, -2.13434, 0, 1, 0.509804, 1,
-0.246241, 0.4472409, 0.7387348, 0, 1, 0.5137255, 1,
-0.2453377, -1.066881, -1.974573, 0, 1, 0.5215687, 1,
-0.2350549, 1.075341, 0.07174612, 0, 1, 0.5254902, 1,
-0.2345901, -0.3356657, -3.344037, 0, 1, 0.5333334, 1,
-0.2270257, -0.8785709, -4.246763, 0, 1, 0.5372549, 1,
-0.2254742, 1.313096, -1.486936, 0, 1, 0.5450981, 1,
-0.2251887, -0.125614, -1.150782, 0, 1, 0.5490196, 1,
-0.2240675, -1.427854, -2.073826, 0, 1, 0.5568628, 1,
-0.2221007, -0.679056, -2.027755, 0, 1, 0.5607843, 1,
-0.2185052, 0.1553238, 0.4924287, 0, 1, 0.5686275, 1,
-0.2156166, 2.051396, -1.873802, 0, 1, 0.572549, 1,
-0.2131743, -0.9909883, -4.450996, 0, 1, 0.5803922, 1,
-0.2110071, -0.5530639, -2.580978, 0, 1, 0.5843138, 1,
-0.2045816, -1.391346, -2.141689, 0, 1, 0.5921569, 1,
-0.2024537, 1.700852, -0.9999542, 0, 1, 0.5960785, 1,
-0.201625, 0.6830202, -0.5642549, 0, 1, 0.6039216, 1,
-0.1992009, -0.8876817, -3.086268, 0, 1, 0.6117647, 1,
-0.1970229, 0.309002, -0.5762691, 0, 1, 0.6156863, 1,
-0.1925636, 0.05962715, -1.078284, 0, 1, 0.6235294, 1,
-0.18454, 1.087766, -0.1988469, 0, 1, 0.627451, 1,
-0.1840843, 0.3093526, -0.2242242, 0, 1, 0.6352941, 1,
-0.1836474, 0.1169112, -1.454172, 0, 1, 0.6392157, 1,
-0.1829033, -0.7660031, -1.454438, 0, 1, 0.6470588, 1,
-0.1699486, 1.148156, -0.576918, 0, 1, 0.6509804, 1,
-0.1678546, 0.5623006, -0.3521846, 0, 1, 0.6588235, 1,
-0.1676725, -0.2847986, -0.6031362, 0, 1, 0.6627451, 1,
-0.1676502, 0.4779894, -0.09382411, 0, 1, 0.6705883, 1,
-0.164759, -1.323361, -3.366366, 0, 1, 0.6745098, 1,
-0.1620187, -0.3345141, -2.559677, 0, 1, 0.682353, 1,
-0.1588314, 1.555918, -0.2019318, 0, 1, 0.6862745, 1,
-0.1572604, 0.08816905, -0.6265525, 0, 1, 0.6941177, 1,
-0.1526501, -2.520758, -4.510567, 0, 1, 0.7019608, 1,
-0.1513413, 1.345219, -0.01258063, 0, 1, 0.7058824, 1,
-0.1464488, 1.134802, -0.5374181, 0, 1, 0.7137255, 1,
-0.1451854, -0.9452296, -1.492036, 0, 1, 0.7176471, 1,
-0.1401004, -0.5543343, -2.640144, 0, 1, 0.7254902, 1,
-0.1370557, 0.9278662, -1.999319, 0, 1, 0.7294118, 1,
-0.1360584, 0.5125973, -2.816644, 0, 1, 0.7372549, 1,
-0.132696, -0.6006318, -4.152187, 0, 1, 0.7411765, 1,
-0.1285718, 0.5777717, -3.509137, 0, 1, 0.7490196, 1,
-0.1266268, -1.184627, -3.587632, 0, 1, 0.7529412, 1,
-0.1264511, 0.2938179, -0.253862, 0, 1, 0.7607843, 1,
-0.126295, -0.1285186, -2.333419, 0, 1, 0.7647059, 1,
-0.1261533, 1.13925, -0.619735, 0, 1, 0.772549, 1,
-0.1255392, -0.6021976, -2.704037, 0, 1, 0.7764706, 1,
-0.1253316, -0.434285, -2.875565, 0, 1, 0.7843137, 1,
-0.1250801, 0.4947264, 1.299783, 0, 1, 0.7882353, 1,
-0.1233493, 0.8532501, 0.7785592, 0, 1, 0.7960784, 1,
-0.1204924, 0.6444021, -0.4558341, 0, 1, 0.8039216, 1,
-0.1192151, -0.1735407, -2.124427, 0, 1, 0.8078431, 1,
-0.1149342, -1.061036, -5.18535, 0, 1, 0.8156863, 1,
-0.1146994, 1.236886, 1.670999, 0, 1, 0.8196079, 1,
-0.1114281, 1.376728, 0.2172245, 0, 1, 0.827451, 1,
-0.1098511, -0.2800008, -2.155708, 0, 1, 0.8313726, 1,
-0.1078328, 0.634452, -0.7353204, 0, 1, 0.8392157, 1,
-0.1027155, 0.2657681, -2.024749, 0, 1, 0.8431373, 1,
-0.1026222, -0.3324668, -2.744713, 0, 1, 0.8509804, 1,
-0.09120107, -0.62229, -2.698712, 0, 1, 0.854902, 1,
-0.08952007, 0.1112802, -1.256623, 0, 1, 0.8627451, 1,
-0.08891819, -1.112906, -3.413042, 0, 1, 0.8666667, 1,
-0.0852204, -0.0893018, -2.199517, 0, 1, 0.8745098, 1,
-0.08217664, 1.135678, 1.088779, 0, 1, 0.8784314, 1,
-0.0805998, 1.611629, -0.08334183, 0, 1, 0.8862745, 1,
-0.07945465, 0.06591339, -0.8228455, 0, 1, 0.8901961, 1,
-0.0764913, 1.531407, 0.4477048, 0, 1, 0.8980392, 1,
-0.07336098, -2.037209, -1.715369, 0, 1, 0.9058824, 1,
-0.07228942, 0.2530668, -0.6377103, 0, 1, 0.9098039, 1,
-0.07047914, 0.2757809, -0.04891511, 0, 1, 0.9176471, 1,
-0.0676465, -0.4981455, -2.470147, 0, 1, 0.9215686, 1,
-0.0601638, 0.7205835, -1.19908, 0, 1, 0.9294118, 1,
-0.05682021, -0.8102413, -2.887514, 0, 1, 0.9333333, 1,
-0.05327491, 0.5122235, -1.696205, 0, 1, 0.9411765, 1,
-0.04925147, -0.5277184, -2.634069, 0, 1, 0.945098, 1,
-0.04491409, 1.077354, -1.02737, 0, 1, 0.9529412, 1,
-0.04348517, 1.574968, 0.4217618, 0, 1, 0.9568627, 1,
-0.04339579, 0.2886753, 0.004701979, 0, 1, 0.9647059, 1,
-0.04106715, -0.1025888, -3.071691, 0, 1, 0.9686275, 1,
-0.03858425, 0.913502, -0.4434963, 0, 1, 0.9764706, 1,
-0.03840601, 0.5702433, -0.6258314, 0, 1, 0.9803922, 1,
-0.03738388, 0.4860193, -0.07742503, 0, 1, 0.9882353, 1,
-0.0372896, 2.166479, -0.6907468, 0, 1, 0.9921569, 1,
-0.03551785, 0.1870036, -0.1344097, 0, 1, 1, 1,
-0.03523915, -1.070633, -4.795899, 0, 0.9921569, 1, 1,
-0.03373779, -0.8510653, -4.008378, 0, 0.9882353, 1, 1,
-0.033042, 0.1303915, -0.7419033, 0, 0.9803922, 1, 1,
-0.0315461, -0.9676853, -4.84411, 0, 0.9764706, 1, 1,
-0.03108538, -0.07566711, -3.326151, 0, 0.9686275, 1, 1,
-0.03047679, -1.828156, -3.957219, 0, 0.9647059, 1, 1,
-0.02689511, -0.1320004, -2.457792, 0, 0.9568627, 1, 1,
-0.02374667, -1.153525, -2.933624, 0, 0.9529412, 1, 1,
-0.0205335, -2.114546, -5.081517, 0, 0.945098, 1, 1,
-0.01517571, -0.6966507, -3.716373, 0, 0.9411765, 1, 1,
-0.01505758, 0.298179, 1.033931, 0, 0.9333333, 1, 1,
-0.01478883, 0.4394775, -1.224115, 0, 0.9294118, 1, 1,
-0.007776797, -0.9253441, -1.843985, 0, 0.9215686, 1, 1,
-0.006048538, 1.032091, 0.07608349, 0, 0.9176471, 1, 1,
-0.005955924, -0.1113276, -1.786897, 0, 0.9098039, 1, 1,
-0.005307002, 0.323857, 1.366498, 0, 0.9058824, 1, 1,
-0.004288493, 1.201441, -0.792604, 0, 0.8980392, 1, 1,
-0.003274386, -1.445219, -2.945637, 0, 0.8901961, 1, 1,
-0.001541572, -0.5099019, -2.743209, 0, 0.8862745, 1, 1,
0.00407353, 0.2443154, -0.493827, 0, 0.8784314, 1, 1,
0.0172039, -1.298894, 1.701598, 0, 0.8745098, 1, 1,
0.01930696, -0.5817481, 3.998404, 0, 0.8666667, 1, 1,
0.02421225, -0.5981029, 2.533908, 0, 0.8627451, 1, 1,
0.02712231, 0.07566363, 0.8356618, 0, 0.854902, 1, 1,
0.02748368, 0.5655724, 1.155744, 0, 0.8509804, 1, 1,
0.03008529, -1.344894, 3.019, 0, 0.8431373, 1, 1,
0.03701857, -0.2309617, 4.481896, 0, 0.8392157, 1, 1,
0.03814057, 0.01476096, -0.6810105, 0, 0.8313726, 1, 1,
0.04166442, 1.272776, 0.1876817, 0, 0.827451, 1, 1,
0.04600064, -1.545334, 3.766662, 0, 0.8196079, 1, 1,
0.04669325, 3.092032, 1.405509, 0, 0.8156863, 1, 1,
0.04693772, -0.09716634, 1.027375, 0, 0.8078431, 1, 1,
0.04790863, 1.493689, -0.0549887, 0, 0.8039216, 1, 1,
0.04974269, 0.1476949, 0.06591918, 0, 0.7960784, 1, 1,
0.05198654, 0.1621735, 1.364278, 0, 0.7882353, 1, 1,
0.05478551, -0.863654, 1.661503, 0, 0.7843137, 1, 1,
0.05622898, -1.020517, 1.231349, 0, 0.7764706, 1, 1,
0.0608068, 0.2154227, -0.2561657, 0, 0.772549, 1, 1,
0.06333993, 0.8671773, -0.226864, 0, 0.7647059, 1, 1,
0.06474275, -0.4786884, 3.133919, 0, 0.7607843, 1, 1,
0.07190874, 0.09297117, -0.9834222, 0, 0.7529412, 1, 1,
0.07951932, -0.8610358, 1.955706, 0, 0.7490196, 1, 1,
0.07954247, -1.598402, 2.023103, 0, 0.7411765, 1, 1,
0.0851007, 0.4021189, 0.08988581, 0, 0.7372549, 1, 1,
0.08711676, -1.055666, 3.578272, 0, 0.7294118, 1, 1,
0.0883914, 0.9990806, 2.364318, 0, 0.7254902, 1, 1,
0.0906845, -0.8202323, 2.279012, 0, 0.7176471, 1, 1,
0.09566596, -0.1432246, 4.029047, 0, 0.7137255, 1, 1,
0.09766012, -0.01424834, 1.470201, 0, 0.7058824, 1, 1,
0.09913356, -1.110193, 4.775639, 0, 0.6980392, 1, 1,
0.1005716, -0.9325509, 1.530156, 0, 0.6941177, 1, 1,
0.1006536, -0.03633719, 1.57479, 0, 0.6862745, 1, 1,
0.101109, -0.1937914, 2.140288, 0, 0.682353, 1, 1,
0.1015765, 0.9430749, 0.08035905, 0, 0.6745098, 1, 1,
0.1023595, 0.1335797, 0.6126623, 0, 0.6705883, 1, 1,
0.1024085, 0.2552138, 0.5406172, 0, 0.6627451, 1, 1,
0.1045283, 3.275836, 0.5146968, 0, 0.6588235, 1, 1,
0.1046448, -0.04255948, 3.548799, 0, 0.6509804, 1, 1,
0.1057255, 1.262553, 0.7510546, 0, 0.6470588, 1, 1,
0.1064045, -0.4752414, 3.153751, 0, 0.6392157, 1, 1,
0.1078983, 0.9177719, 0.5662494, 0, 0.6352941, 1, 1,
0.1115981, -0.2167638, 3.495254, 0, 0.627451, 1, 1,
0.112376, -0.2542106, 2.572355, 0, 0.6235294, 1, 1,
0.1164729, 0.7883342, -1.614811, 0, 0.6156863, 1, 1,
0.1165138, 0.007241461, 2.674672, 0, 0.6117647, 1, 1,
0.1182727, 0.1407197, -2.636366, 0, 0.6039216, 1, 1,
0.1189949, -1.09895, 3.332317, 0, 0.5960785, 1, 1,
0.1242453, -0.3262985, 3.980116, 0, 0.5921569, 1, 1,
0.128194, 1.135631, -0.02914278, 0, 0.5843138, 1, 1,
0.1287013, 0.72758, -0.9857354, 0, 0.5803922, 1, 1,
0.1349581, 0.8867871, 0.6965075, 0, 0.572549, 1, 1,
0.1354184, -0.2920582, 3.688028, 0, 0.5686275, 1, 1,
0.1395683, -0.9971085, 3.787945, 0, 0.5607843, 1, 1,
0.1446061, -0.4385592, 2.189018, 0, 0.5568628, 1, 1,
0.1460105, 1.157686, 0.9184529, 0, 0.5490196, 1, 1,
0.1511096, 0.9670232, -1.173533, 0, 0.5450981, 1, 1,
0.1539245, 0.4834349, 0.1461346, 0, 0.5372549, 1, 1,
0.1541355, -0.5539452, 3.164886, 0, 0.5333334, 1, 1,
0.1584038, -0.4664885, 1.825251, 0, 0.5254902, 1, 1,
0.1616504, 0.5149891, 1.824614, 0, 0.5215687, 1, 1,
0.1622596, -2.458423, 4.051901, 0, 0.5137255, 1, 1,
0.1636594, -1.060445, 3.49343, 0, 0.509804, 1, 1,
0.1686192, 0.1146385, 0.7577556, 0, 0.5019608, 1, 1,
0.1699228, 0.7139709, 1.648562, 0, 0.4941176, 1, 1,
0.1723689, -0.3526546, 2.73952, 0, 0.4901961, 1, 1,
0.1735219, -0.1095714, 1.303118, 0, 0.4823529, 1, 1,
0.1744997, -0.7719907, 3.616973, 0, 0.4784314, 1, 1,
0.1761518, -3.154991, 2.624694, 0, 0.4705882, 1, 1,
0.1773001, 2.248928, 1.075487, 0, 0.4666667, 1, 1,
0.1773472, 1.487327, 2.278497, 0, 0.4588235, 1, 1,
0.1783727, -0.4216123, 1.527637, 0, 0.454902, 1, 1,
0.1815115, 1.428221, 1.189409, 0, 0.4470588, 1, 1,
0.1868123, 0.7857937, 0.5832509, 0, 0.4431373, 1, 1,
0.1878739, -1.365844, 2.898063, 0, 0.4352941, 1, 1,
0.1884763, -1.035179, 2.097985, 0, 0.4313726, 1, 1,
0.1931534, -0.4210581, 3.213732, 0, 0.4235294, 1, 1,
0.1956995, 0.2730435, 0.2468929, 0, 0.4196078, 1, 1,
0.1993363, 1.780238, -1.268796, 0, 0.4117647, 1, 1,
0.2041729, 1.053704, 0.5880336, 0, 0.4078431, 1, 1,
0.2046057, -0.8040193, 0.9343113, 0, 0.4, 1, 1,
0.2109521, -1.401048, 3.851213, 0, 0.3921569, 1, 1,
0.2112941, 0.3989579, 0.8680899, 0, 0.3882353, 1, 1,
0.2152992, 0.6386261, 0.6904197, 0, 0.3803922, 1, 1,
0.216118, -0.6922004, 2.372696, 0, 0.3764706, 1, 1,
0.2165897, -0.1335051, 3.851187, 0, 0.3686275, 1, 1,
0.2197646, -0.1105637, 2.646556, 0, 0.3647059, 1, 1,
0.2267576, -0.6638659, 1.924394, 0, 0.3568628, 1, 1,
0.2328399, -0.9800372, 1.471199, 0, 0.3529412, 1, 1,
0.2334692, -0.6832463, 2.033834, 0, 0.345098, 1, 1,
0.2342656, 1.229502, 0.5166294, 0, 0.3411765, 1, 1,
0.2367469, -0.222584, 2.091949, 0, 0.3333333, 1, 1,
0.2433462, -1.446079, 2.229419, 0, 0.3294118, 1, 1,
0.2468936, -0.3822589, 4.278755, 0, 0.3215686, 1, 1,
0.2490821, -0.4798653, 2.470898, 0, 0.3176471, 1, 1,
0.2500824, -0.5581741, 2.358844, 0, 0.3098039, 1, 1,
0.2542344, 0.3538655, 0.3175625, 0, 0.3058824, 1, 1,
0.2584009, 0.5615671, 0.3859876, 0, 0.2980392, 1, 1,
0.2589742, -2.729312, 2.760252, 0, 0.2901961, 1, 1,
0.2612184, -0.6744029, 1.560354, 0, 0.2862745, 1, 1,
0.2629586, -0.3516873, 1.483161, 0, 0.2784314, 1, 1,
0.2634818, -1.746843, 2.725936, 0, 0.2745098, 1, 1,
0.2642063, 0.1700047, 1.85807, 0, 0.2666667, 1, 1,
0.2661839, 1.123098, -0.3635985, 0, 0.2627451, 1, 1,
0.2704805, -0.03330042, 1.367166, 0, 0.254902, 1, 1,
0.2712538, 0.2604823, 0.5153373, 0, 0.2509804, 1, 1,
0.2791367, -0.2321785, 2.952769, 0, 0.2431373, 1, 1,
0.2792921, -0.9348686, 1.370923, 0, 0.2392157, 1, 1,
0.2801681, 0.2896291, 1.131688, 0, 0.2313726, 1, 1,
0.2842356, 1.235463, 0.7268757, 0, 0.227451, 1, 1,
0.2846591, -0.3239843, 1.863401, 0, 0.2196078, 1, 1,
0.2881159, 3.01253, 0.6438498, 0, 0.2156863, 1, 1,
0.2885818, 0.02371913, 2.192132, 0, 0.2078431, 1, 1,
0.288919, -1.305993, 1.944112, 0, 0.2039216, 1, 1,
0.2898434, 0.3943309, 0.1299559, 0, 0.1960784, 1, 1,
0.2912264, 0.8703533, -0.4740795, 0, 0.1882353, 1, 1,
0.2915442, -0.05870165, 1.269761, 0, 0.1843137, 1, 1,
0.2976295, 1.312239, 1.495191, 0, 0.1764706, 1, 1,
0.2993025, -0.6429009, 3.15905, 0, 0.172549, 1, 1,
0.3001182, -1.291916, 3.712604, 0, 0.1647059, 1, 1,
0.3031394, 0.1487908, 0.6145225, 0, 0.1607843, 1, 1,
0.3109408, -1.265351, 2.610348, 0, 0.1529412, 1, 1,
0.315784, -0.3808753, 4.55939, 0, 0.1490196, 1, 1,
0.31597, -2.461583, 2.296547, 0, 0.1411765, 1, 1,
0.3170195, -1.472851, 3.210795, 0, 0.1372549, 1, 1,
0.3220883, 0.3943929, 0.7723819, 0, 0.1294118, 1, 1,
0.3263149, 1.131467, 1.365706, 0, 0.1254902, 1, 1,
0.3339042, -0.2160809, 2.140926, 0, 0.1176471, 1, 1,
0.3355751, -1.006138, 2.315497, 0, 0.1137255, 1, 1,
0.337215, 1.478465, 0.1673198, 0, 0.1058824, 1, 1,
0.3379477, -2.540187, 2.561212, 0, 0.09803922, 1, 1,
0.3385559, -0.1857444, 1.365222, 0, 0.09411765, 1, 1,
0.3390058, 1.634742, -0.5082191, 0, 0.08627451, 1, 1,
0.3392914, -0.8042103, 3.105114, 0, 0.08235294, 1, 1,
0.3415976, 1.290011, 0.3412888, 0, 0.07450981, 1, 1,
0.3474243, -0.677565, 0.2297081, 0, 0.07058824, 1, 1,
0.3477326, -0.807335, 4.198215, 0, 0.0627451, 1, 1,
0.3493754, -1.482205, 3.293566, 0, 0.05882353, 1, 1,
0.3554313, -0.7898577, 0.52785, 0, 0.05098039, 1, 1,
0.3569792, 1.507212, 0.1734703, 0, 0.04705882, 1, 1,
0.3579084, -1.716591, 1.864399, 0, 0.03921569, 1, 1,
0.3589256, 1.582171, 0.8518713, 0, 0.03529412, 1, 1,
0.3589841, -0.8716334, 3.310341, 0, 0.02745098, 1, 1,
0.3626952, 1.076324, -0.4450957, 0, 0.02352941, 1, 1,
0.3626984, -2.148241, 3.120755, 0, 0.01568628, 1, 1,
0.3666599, 0.7271402, 1.366341, 0, 0.01176471, 1, 1,
0.3685883, -1.562184, 1.511262, 0, 0.003921569, 1, 1,
0.3729117, -2.244253, 3.266768, 0.003921569, 0, 1, 1,
0.3764364, 1.529835, -1.185442, 0.007843138, 0, 1, 1,
0.3765677, -0.07996836, 0.08131042, 0.01568628, 0, 1, 1,
0.3770819, -1.184041, 2.996843, 0.01960784, 0, 1, 1,
0.3825796, 1.65671, 0.3543324, 0.02745098, 0, 1, 1,
0.3832775, -1.201721, 3.762352, 0.03137255, 0, 1, 1,
0.3845069, 1.058067, 1.35654, 0.03921569, 0, 1, 1,
0.3946534, -0.02793743, 2.07058, 0.04313726, 0, 1, 1,
0.4021376, 0.498916, 0.4106958, 0.05098039, 0, 1, 1,
0.4030702, -0.3857117, 2.731637, 0.05490196, 0, 1, 1,
0.4076858, -0.4796661, 3.419777, 0.0627451, 0, 1, 1,
0.4102226, -1.102232, 3.112013, 0.06666667, 0, 1, 1,
0.4176422, -0.3390938, 2.617826, 0.07450981, 0, 1, 1,
0.418743, 0.8072212, 2.092506, 0.07843138, 0, 1, 1,
0.425999, 1.537125, -0.886419, 0.08627451, 0, 1, 1,
0.430045, -0.5458133, 3.059599, 0.09019608, 0, 1, 1,
0.4308689, 0.6027082, -0.5975181, 0.09803922, 0, 1, 1,
0.4311362, 0.1982236, 1.025873, 0.1058824, 0, 1, 1,
0.435084, -0.1336312, 3.68595, 0.1098039, 0, 1, 1,
0.4359239, -0.5378392, 3.395951, 0.1176471, 0, 1, 1,
0.4415021, -0.0903366, 2.832803, 0.1215686, 0, 1, 1,
0.4422002, 0.1990295, 1.842807, 0.1294118, 0, 1, 1,
0.4456781, -0.2840114, 2.182723, 0.1333333, 0, 1, 1,
0.4503931, 0.8181447, -0.2098161, 0.1411765, 0, 1, 1,
0.4515415, 2.663945, -1.472326, 0.145098, 0, 1, 1,
0.4582756, -0.04633309, 1.227867, 0.1529412, 0, 1, 1,
0.459738, -0.2359995, 2.596356, 0.1568628, 0, 1, 1,
0.4640983, -0.7210577, 1.700207, 0.1647059, 0, 1, 1,
0.4667753, -0.4106773, 1.974693, 0.1686275, 0, 1, 1,
0.4704675, 0.1341043, 1.520803, 0.1764706, 0, 1, 1,
0.4717415, -0.4276382, 1.857952, 0.1803922, 0, 1, 1,
0.4727168, -0.6082212, 1.573044, 0.1882353, 0, 1, 1,
0.4778331, 0.8854609, 1.187565, 0.1921569, 0, 1, 1,
0.4804434, -0.009094626, 2.275081, 0.2, 0, 1, 1,
0.4814589, 0.4906589, 1.444092, 0.2078431, 0, 1, 1,
0.4869068, 0.8057426, 0.678368, 0.2117647, 0, 1, 1,
0.4871571, -0.8810343, 3.908343, 0.2196078, 0, 1, 1,
0.4874597, -0.3749582, -0.009058225, 0.2235294, 0, 1, 1,
0.4888912, -1.688869, 3.426653, 0.2313726, 0, 1, 1,
0.4889583, -0.06248339, 1.015945, 0.2352941, 0, 1, 1,
0.4920048, 0.6006151, 1.046293, 0.2431373, 0, 1, 1,
0.494745, 0.8748237, 0.6401058, 0.2470588, 0, 1, 1,
0.4961881, 1.382071, -0.1593201, 0.254902, 0, 1, 1,
0.499608, 0.6621607, -1.411857, 0.2588235, 0, 1, 1,
0.5167539, -0.9923858, 3.749995, 0.2666667, 0, 1, 1,
0.5186841, -0.6327924, 2.638705, 0.2705882, 0, 1, 1,
0.5205402, -1.460722, 1.709385, 0.2784314, 0, 1, 1,
0.521579, -0.7945824, 2.694288, 0.282353, 0, 1, 1,
0.5247017, 0.8788223, -1.81892, 0.2901961, 0, 1, 1,
0.5281795, -0.643753, 1.462271, 0.2941177, 0, 1, 1,
0.5290475, -0.3934496, 0.6249374, 0.3019608, 0, 1, 1,
0.5299044, -1.202678, 1.453129, 0.3098039, 0, 1, 1,
0.5311366, -1.135363, 2.644194, 0.3137255, 0, 1, 1,
0.5311693, -0.6115136, 2.924155, 0.3215686, 0, 1, 1,
0.5339286, 0.0394459, 2.678038, 0.3254902, 0, 1, 1,
0.5375946, -0.5474989, 3.692608, 0.3333333, 0, 1, 1,
0.5385577, 1.217613, 0.5955427, 0.3372549, 0, 1, 1,
0.5402973, 1.320783, -2.220273, 0.345098, 0, 1, 1,
0.5440082, -0.2378865, 1.903576, 0.3490196, 0, 1, 1,
0.544925, 0.3887726, 1.344025, 0.3568628, 0, 1, 1,
0.545378, 0.03033158, 1.432338, 0.3607843, 0, 1, 1,
0.5480961, 0.8819336, 1.648176, 0.3686275, 0, 1, 1,
0.550845, -0.3791295, 2.292031, 0.372549, 0, 1, 1,
0.5511923, -0.5048165, 3.183323, 0.3803922, 0, 1, 1,
0.5560033, -0.8038219, 2.766053, 0.3843137, 0, 1, 1,
0.5564546, 0.932304, 1.305716, 0.3921569, 0, 1, 1,
0.5576423, 0.06331538, -0.3304915, 0.3960784, 0, 1, 1,
0.5603947, 0.2484289, 0.5958753, 0.4039216, 0, 1, 1,
0.5619676, 0.7321475, -0.5658663, 0.4117647, 0, 1, 1,
0.5709376, -0.3687788, 1.729681, 0.4156863, 0, 1, 1,
0.5734732, 0.2454563, -0.2359852, 0.4235294, 0, 1, 1,
0.5743726, -1.128603, 2.076241, 0.427451, 0, 1, 1,
0.579938, -0.8763248, 1.775462, 0.4352941, 0, 1, 1,
0.5812744, 0.5280667, 0.4424298, 0.4392157, 0, 1, 1,
0.5820614, -0.03670495, 1.970983, 0.4470588, 0, 1, 1,
0.583257, 0.8856934, 2.043574, 0.4509804, 0, 1, 1,
0.5872266, -1.323267, 4.917131, 0.4588235, 0, 1, 1,
0.5890306, 0.3218477, 0.3665102, 0.4627451, 0, 1, 1,
0.5895336, -1.040922, 1.909951, 0.4705882, 0, 1, 1,
0.5921365, 1.449242, -0.2988516, 0.4745098, 0, 1, 1,
0.5952137, 0.175543, 1.376485, 0.4823529, 0, 1, 1,
0.6015608, -1.368826, 3.453389, 0.4862745, 0, 1, 1,
0.6031644, -0.2786767, 1.094998, 0.4941176, 0, 1, 1,
0.6072708, -1.181629, 1.623468, 0.5019608, 0, 1, 1,
0.6109302, -1.40305, 2.936833, 0.5058824, 0, 1, 1,
0.6133726, -0.6291993, 1.545925, 0.5137255, 0, 1, 1,
0.6149945, 0.02272325, 3.334633, 0.5176471, 0, 1, 1,
0.6178582, -0.8487203, 2.550425, 0.5254902, 0, 1, 1,
0.6184324, 1.300858, -0.4841408, 0.5294118, 0, 1, 1,
0.6229444, 1.43612, 0.9595249, 0.5372549, 0, 1, 1,
0.6242485, 0.2714836, 0.9490922, 0.5411765, 0, 1, 1,
0.6249666, 0.2690763, 3.934106, 0.5490196, 0, 1, 1,
0.6257885, -0.1498373, 2.418068, 0.5529412, 0, 1, 1,
0.6286208, -0.9716367, 0.3660347, 0.5607843, 0, 1, 1,
0.6333032, 0.8209198, -0.5835794, 0.5647059, 0, 1, 1,
0.6372764, 0.4951332, 0.8682239, 0.572549, 0, 1, 1,
0.6383338, 1.469574, 0.9055111, 0.5764706, 0, 1, 1,
0.6405423, -0.2332145, -0.6153334, 0.5843138, 0, 1, 1,
0.6445289, -0.5732124, 1.954393, 0.5882353, 0, 1, 1,
0.6457385, 1.17193, -0.1195609, 0.5960785, 0, 1, 1,
0.6479508, -0.378646, 0.9074432, 0.6039216, 0, 1, 1,
0.6536201, 0.5660719, 0.5580183, 0.6078432, 0, 1, 1,
0.6553266, -0.901986, 2.911936, 0.6156863, 0, 1, 1,
0.6556574, 0.4559849, 1.791878, 0.6196079, 0, 1, 1,
0.6566545, 0.2190942, 2.150637, 0.627451, 0, 1, 1,
0.6592091, -1.031842, 2.967978, 0.6313726, 0, 1, 1,
0.6671669, -2.57918, 3.960424, 0.6392157, 0, 1, 1,
0.671513, 1.127344, -0.8594572, 0.6431373, 0, 1, 1,
0.6724278, -0.01834362, 2.249918, 0.6509804, 0, 1, 1,
0.6736943, -0.5391601, 1.823066, 0.654902, 0, 1, 1,
0.6740675, -0.7627144, 2.355733, 0.6627451, 0, 1, 1,
0.683993, -0.4289831, 2.584492, 0.6666667, 0, 1, 1,
0.6876693, -1.364434, 2.894403, 0.6745098, 0, 1, 1,
0.6882808, -0.2168813, 2.383755, 0.6784314, 0, 1, 1,
0.6911417, -1.554949, 0.7681309, 0.6862745, 0, 1, 1,
0.6943992, 1.424751, 0.1837116, 0.6901961, 0, 1, 1,
0.7028473, -0.03697035, 1.529409, 0.6980392, 0, 1, 1,
0.7032224, -0.1871064, 1.903561, 0.7058824, 0, 1, 1,
0.7055504, 0.8507157, 2.692759, 0.7098039, 0, 1, 1,
0.7071747, -1.046153, 2.455321, 0.7176471, 0, 1, 1,
0.7077047, 2.30741, -0.3180969, 0.7215686, 0, 1, 1,
0.7212976, 0.09870959, -0.4094576, 0.7294118, 0, 1, 1,
0.7223353, -1.381169, 2.57745, 0.7333333, 0, 1, 1,
0.7224646, -0.3399516, 1.886301, 0.7411765, 0, 1, 1,
0.7252561, 0.2368622, 0.7621541, 0.7450981, 0, 1, 1,
0.7269555, 0.5214625, -0.0733215, 0.7529412, 0, 1, 1,
0.7328722, -0.6954747, 3.301545, 0.7568628, 0, 1, 1,
0.73361, 0.6306148, -1.005655, 0.7647059, 0, 1, 1,
0.736748, 1.471884, 1.323202, 0.7686275, 0, 1, 1,
0.7497534, 0.7710798, 0.9579029, 0.7764706, 0, 1, 1,
0.750265, -0.208131, 2.515057, 0.7803922, 0, 1, 1,
0.7537013, 0.543489, 0.5880976, 0.7882353, 0, 1, 1,
0.7569419, -1.533531, 2.048448, 0.7921569, 0, 1, 1,
0.7588263, -1.038767, 2.102129, 0.8, 0, 1, 1,
0.7646325, -1.301601, 1.434648, 0.8078431, 0, 1, 1,
0.7664896, 0.1859758, 1.112405, 0.8117647, 0, 1, 1,
0.7734762, 2.64335, -0.3006775, 0.8196079, 0, 1, 1,
0.7736351, 0.6249215, 0.4346826, 0.8235294, 0, 1, 1,
0.782593, 0.3078921, 1.960984, 0.8313726, 0, 1, 1,
0.7938599, -1.112964, 2.387192, 0.8352941, 0, 1, 1,
0.7945295, -0.3842627, 2.024829, 0.8431373, 0, 1, 1,
0.8091364, -0.03965913, -0.6810293, 0.8470588, 0, 1, 1,
0.8136574, -0.3780534, 2.298025, 0.854902, 0, 1, 1,
0.8153598, -0.9460554, 4.486598, 0.8588235, 0, 1, 1,
0.8159624, -0.211006, 0.3992488, 0.8666667, 0, 1, 1,
0.8212467, 0.9694526, 0.21519, 0.8705882, 0, 1, 1,
0.8324838, -1.651435, 2.982914, 0.8784314, 0, 1, 1,
0.8363567, 1.827549, 0.1397649, 0.8823529, 0, 1, 1,
0.8391677, 2.927384, -1.830235, 0.8901961, 0, 1, 1,
0.842568, -0.3186982, 2.087925, 0.8941177, 0, 1, 1,
0.8429233, 0.6614874, 0.5067217, 0.9019608, 0, 1, 1,
0.8455975, 0.0334501, 1.422676, 0.9098039, 0, 1, 1,
0.85194, -0.3469424, 2.985337, 0.9137255, 0, 1, 1,
0.8541636, -0.7066493, 2.693422, 0.9215686, 0, 1, 1,
0.8550127, -0.3401605, 3.178539, 0.9254902, 0, 1, 1,
0.8562428, -0.4096869, 2.006933, 0.9333333, 0, 1, 1,
0.8705924, 1.38813, 2.130948, 0.9372549, 0, 1, 1,
0.8706847, -0.3603564, 3.27973, 0.945098, 0, 1, 1,
0.8750057, 0.6249747, 2.121449, 0.9490196, 0, 1, 1,
0.8774151, -0.690203, 0.6928318, 0.9568627, 0, 1, 1,
0.881232, 0.7966119, 0.4937426, 0.9607843, 0, 1, 1,
0.8832694, -0.7596928, 1.508602, 0.9686275, 0, 1, 1,
0.8953259, -1.667579, 2.516819, 0.972549, 0, 1, 1,
0.895758, 1.439428, -0.006012578, 0.9803922, 0, 1, 1,
0.9055133, 0.2635622, 1.400691, 0.9843137, 0, 1, 1,
0.9109922, -2.432183, 2.957884, 0.9921569, 0, 1, 1,
0.9130305, 0.4178276, 3.207017, 0.9960784, 0, 1, 1,
0.9155601, -1.106887, 2.506011, 1, 0, 0.9960784, 1,
0.9169849, 0.7912672, 0.3767788, 1, 0, 0.9882353, 1,
0.9172716, -0.1274699, 2.674837, 1, 0, 0.9843137, 1,
0.9243672, -0.3042774, 3.437946, 1, 0, 0.9764706, 1,
0.9287467, 0.1575823, 0.9515426, 1, 0, 0.972549, 1,
0.9292224, -1.179688, 1.36391, 1, 0, 0.9647059, 1,
0.9335936, 1.407146, 1.009871, 1, 0, 0.9607843, 1,
0.9401912, 1.28771, -0.2463859, 1, 0, 0.9529412, 1,
0.9428141, 1.752455, -0.3147679, 1, 0, 0.9490196, 1,
0.9449819, -0.9092664, 1.310296, 1, 0, 0.9411765, 1,
0.9452223, 0.07718232, 3.057159, 1, 0, 0.9372549, 1,
0.9518194, -0.02823717, 1.99656, 1, 0, 0.9294118, 1,
0.9596896, -0.3128689, 1.598873, 1, 0, 0.9254902, 1,
0.9598158, 0.3531276, -1.072197, 1, 0, 0.9176471, 1,
0.9622034, -0.04834214, 2.525548, 1, 0, 0.9137255, 1,
0.9636959, 0.6921778, -0.1334615, 1, 0, 0.9058824, 1,
0.9637783, 2.77243, 0.2052232, 1, 0, 0.9019608, 1,
0.9717088, 0.3824452, 0.9931648, 1, 0, 0.8941177, 1,
0.9732731, -0.9228106, 2.56341, 1, 0, 0.8862745, 1,
0.9766843, -1.035098, 2.179693, 1, 0, 0.8823529, 1,
0.9823515, -0.4119155, 1.522704, 1, 0, 0.8745098, 1,
0.9870037, 0.005443479, 0.5261412, 1, 0, 0.8705882, 1,
0.9881027, -0.3666296, 2.52787, 1, 0, 0.8627451, 1,
0.994222, 0.4013523, -2.067595, 1, 0, 0.8588235, 1,
0.994612, -0.1504823, 0.4360049, 1, 0, 0.8509804, 1,
0.9950602, -0.9330934, 3.473889, 1, 0, 0.8470588, 1,
0.9996799, -0.2842389, 2.218441, 1, 0, 0.8392157, 1,
1.005808, -1.673587, 4.158166, 1, 0, 0.8352941, 1,
1.011032, -1.687864, 1.602772, 1, 0, 0.827451, 1,
1.011918, -0.8655881, 2.834642, 1, 0, 0.8235294, 1,
1.0142, -0.6416109, 1.176527, 1, 0, 0.8156863, 1,
1.014905, -0.5648252, 3.736107, 1, 0, 0.8117647, 1,
1.015366, 0.007586573, 2.574301, 1, 0, 0.8039216, 1,
1.028149, -0.4742992, 1.892738, 1, 0, 0.7960784, 1,
1.029066, 0.4407353, 0.2685487, 1, 0, 0.7921569, 1,
1.034817, 0.8034903, 1.637877, 1, 0, 0.7843137, 1,
1.03599, -0.6428733, 0.4070457, 1, 0, 0.7803922, 1,
1.037989, -0.008759596, 1.248829, 1, 0, 0.772549, 1,
1.03882, -0.02487666, -0.5068593, 1, 0, 0.7686275, 1,
1.042195, 0.7541124, 1.18446, 1, 0, 0.7607843, 1,
1.045848, 1.169162, -0.6589952, 1, 0, 0.7568628, 1,
1.048241, 0.06840554, 1.601297, 1, 0, 0.7490196, 1,
1.070941, -1.626208, 2.614222, 1, 0, 0.7450981, 1,
1.098804, 0.3628462, 1.118307, 1, 0, 0.7372549, 1,
1.105746, 0.5423246, 1.579829, 1, 0, 0.7333333, 1,
1.110948, 0.829213, 2.666227, 1, 0, 0.7254902, 1,
1.113864, 0.9652888, -0.7569171, 1, 0, 0.7215686, 1,
1.114677, -1.465087, 1.749672, 1, 0, 0.7137255, 1,
1.122027, -1.959445, 2.011982, 1, 0, 0.7098039, 1,
1.122935, -1.158855, 2.344018, 1, 0, 0.7019608, 1,
1.124934, -0.7344635, 1.588733, 1, 0, 0.6941177, 1,
1.130228, 1.106943, 0.1851464, 1, 0, 0.6901961, 1,
1.135899, -2.006022, 2.799719, 1, 0, 0.682353, 1,
1.136551, 0.3734889, 1.624303, 1, 0, 0.6784314, 1,
1.136613, -0.3103782, 2.110439, 1, 0, 0.6705883, 1,
1.137938, -1.0768, 3.342355, 1, 0, 0.6666667, 1,
1.139616, -0.2239287, 1.360376, 1, 0, 0.6588235, 1,
1.145219, -0.3238284, 1.763274, 1, 0, 0.654902, 1,
1.148776, 2.406435, 1.198874, 1, 0, 0.6470588, 1,
1.151219, 1.205692, 0.200387, 1, 0, 0.6431373, 1,
1.154626, -1.184194, 2.108904, 1, 0, 0.6352941, 1,
1.165089, 0.113196, 2.021955, 1, 0, 0.6313726, 1,
1.167019, 0.8714881, 2.437165, 1, 0, 0.6235294, 1,
1.168142, -0.5534543, 2.103363, 1, 0, 0.6196079, 1,
1.168378, 1.027732, 0.7548947, 1, 0, 0.6117647, 1,
1.174684, -1.371215, 2.449991, 1, 0, 0.6078432, 1,
1.17889, -0.7204528, 2.868991, 1, 0, 0.6, 1,
1.181965, 0.7134987, 2.357896, 1, 0, 0.5921569, 1,
1.182332, 0.9745879, -0.2849448, 1, 0, 0.5882353, 1,
1.183872, 0.1757174, 1.687118, 1, 0, 0.5803922, 1,
1.184107, 1.011488, 1.359988, 1, 0, 0.5764706, 1,
1.184703, -0.7098534, 0.9148925, 1, 0, 0.5686275, 1,
1.190518, -0.9903705, 3.136596, 1, 0, 0.5647059, 1,
1.195245, -0.437172, 1.544389, 1, 0, 0.5568628, 1,
1.195423, -1.270401, 3.174644, 1, 0, 0.5529412, 1,
1.202666, 1.293539, -0.5308936, 1, 0, 0.5450981, 1,
1.204219, -1.100848, 2.775158, 1, 0, 0.5411765, 1,
1.211208, -0.3883814, 0.5633388, 1, 0, 0.5333334, 1,
1.218714, -1.35688, 1.869187, 1, 0, 0.5294118, 1,
1.224758, -2.189758, 1.604323, 1, 0, 0.5215687, 1,
1.226746, 1.635664, 0.08105563, 1, 0, 0.5176471, 1,
1.237788, -0.7264034, 1.420407, 1, 0, 0.509804, 1,
1.237851, -1.050005, 0.6029328, 1, 0, 0.5058824, 1,
1.249794, 1.149319, 1.425577, 1, 0, 0.4980392, 1,
1.256238, -0.3018477, -0.6190275, 1, 0, 0.4901961, 1,
1.256978, 0.2356197, 0.0333041, 1, 0, 0.4862745, 1,
1.260294, 0.3263862, 0.9219365, 1, 0, 0.4784314, 1,
1.266442, -0.9358972, 0.6507767, 1, 0, 0.4745098, 1,
1.283785, -0.1982472, 1.074711, 1, 0, 0.4666667, 1,
1.286009, 0.3307478, 2.499095, 1, 0, 0.4627451, 1,
1.287683, -0.2005076, 2.162245, 1, 0, 0.454902, 1,
1.294538, -0.320576, -0.1747543, 1, 0, 0.4509804, 1,
1.294541, -0.8777872, 1.109991, 1, 0, 0.4431373, 1,
1.297912, 1.247726, 1.354459, 1, 0, 0.4392157, 1,
1.303725, -1.089518, 4.209938, 1, 0, 0.4313726, 1,
1.305446, 1.082632, 1.425654, 1, 0, 0.427451, 1,
1.308528, -0.6239657, 1.545698, 1, 0, 0.4196078, 1,
1.308964, -0.584695, 3.954847, 1, 0, 0.4156863, 1,
1.336653, 0.3476261, 2.615776, 1, 0, 0.4078431, 1,
1.341919, -0.7772585, -0.359921, 1, 0, 0.4039216, 1,
1.345073, 0.9847918, 1.835313, 1, 0, 0.3960784, 1,
1.375528, 0.09920812, 1.720449, 1, 0, 0.3882353, 1,
1.376816, -0.5030614, 4.666193, 1, 0, 0.3843137, 1,
1.38269, -0.299453, 2.367014, 1, 0, 0.3764706, 1,
1.392825, -0.2644303, 0.1676806, 1, 0, 0.372549, 1,
1.40098, -0.7998639, 3.873331, 1, 0, 0.3647059, 1,
1.402443, 0.7841008, 0.1515563, 1, 0, 0.3607843, 1,
1.404175, 2.319478, -0.603122, 1, 0, 0.3529412, 1,
1.404502, 0.3296046, 0.2251476, 1, 0, 0.3490196, 1,
1.407003, -0.04906896, 2.493057, 1, 0, 0.3411765, 1,
1.439765, 0.6433867, 0.7004515, 1, 0, 0.3372549, 1,
1.447385, 1.092821, -0.5296251, 1, 0, 0.3294118, 1,
1.459323, 0.02427932, 0.9509225, 1, 0, 0.3254902, 1,
1.459391, 0.3737749, 3.075785, 1, 0, 0.3176471, 1,
1.466133, 0.3829951, 1.46727, 1, 0, 0.3137255, 1,
1.473348, -0.9437441, 2.466767, 1, 0, 0.3058824, 1,
1.495827, 0.06721213, 0.5489892, 1, 0, 0.2980392, 1,
1.504659, -1.564502, 0.8956128, 1, 0, 0.2941177, 1,
1.517905, -0.8835188, 0.7400864, 1, 0, 0.2862745, 1,
1.532594, -1.104512, 3.881852, 1, 0, 0.282353, 1,
1.537561, 1.063414, 2.124733, 1, 0, 0.2745098, 1,
1.541696, -0.4012589, 2.610066, 1, 0, 0.2705882, 1,
1.554247, 1.103297, 1.414331, 1, 0, 0.2627451, 1,
1.561485, -0.4500771, 1.783362, 1, 0, 0.2588235, 1,
1.585201, 0.8301775, 1.264323, 1, 0, 0.2509804, 1,
1.604254, 0.6855218, 2.959892, 1, 0, 0.2470588, 1,
1.641927, -0.4941438, 1.870742, 1, 0, 0.2392157, 1,
1.648695, 2.873928, -0.5249736, 1, 0, 0.2352941, 1,
1.65671, -0.1093365, 1.048268, 1, 0, 0.227451, 1,
1.658149, 0.6865057, 0.6632384, 1, 0, 0.2235294, 1,
1.680299, -1.534564, 1.783869, 1, 0, 0.2156863, 1,
1.680835, -0.5954285, 2.185294, 1, 0, 0.2117647, 1,
1.688951, 1.094936, -0.6002279, 1, 0, 0.2039216, 1,
1.698648, -0.7347846, 1.925231, 1, 0, 0.1960784, 1,
1.729115, -1.558599, 2.759429, 1, 0, 0.1921569, 1,
1.785874, 0.518841, 1.881162, 1, 0, 0.1843137, 1,
1.789451, 2.037919, -0.4035168, 1, 0, 0.1803922, 1,
1.794028, -0.1125883, 0.880301, 1, 0, 0.172549, 1,
1.834787, -1.934664, 1.932586, 1, 0, 0.1686275, 1,
1.845254, -0.5751523, 2.557101, 1, 0, 0.1607843, 1,
1.889807, -0.820582, 0.6861607, 1, 0, 0.1568628, 1,
1.904006, 0.5284861, 1.472416, 1, 0, 0.1490196, 1,
1.909961, -0.5699073, 2.540897, 1, 0, 0.145098, 1,
1.91032, 0.4780631, 1.159848, 1, 0, 0.1372549, 1,
1.934927, -0.04934266, 1.216711, 1, 0, 0.1333333, 1,
1.94859, -0.3739347, 2.632028, 1, 0, 0.1254902, 1,
1.957455, 0.9486309, 0.9072968, 1, 0, 0.1215686, 1,
1.961847, -0.4095522, 2.685109, 1, 0, 0.1137255, 1,
2.004797, 1.906761, 1.058407, 1, 0, 0.1098039, 1,
2.040653, -0.2989936, 2.293997, 1, 0, 0.1019608, 1,
2.076779, -0.4132235, 0.9601757, 1, 0, 0.09411765, 1,
2.077364, -1.2068, 2.888772, 1, 0, 0.09019608, 1,
2.080948, -0.4748493, 2.037497, 1, 0, 0.08235294, 1,
2.091463, -0.5163587, 1.422702, 1, 0, 0.07843138, 1,
2.134212, -1.089606, 1.005901, 1, 0, 0.07058824, 1,
2.137621, -0.007758196, 0.3551138, 1, 0, 0.06666667, 1,
2.138565, 2.707122, 0.0315271, 1, 0, 0.05882353, 1,
2.289389, -1.135738, 2.048106, 1, 0, 0.05490196, 1,
2.315923, -0.3846077, 1.237825, 1, 0, 0.04705882, 1,
2.360125, -0.9747503, 3.254866, 1, 0, 0.04313726, 1,
2.505832, 0.5734693, -0.06082343, 1, 0, 0.03529412, 1,
2.533092, 0.37332, 1.275089, 1, 0, 0.03137255, 1,
2.613462, -0.169873, 1.266773, 1, 0, 0.02352941, 1,
2.880829, 2.186869, 0.3338648, 1, 0, 0.01960784, 1,
2.90577, 1.153895, 1.321069, 1, 0, 0.01176471, 1,
3.010067, 0.2625909, 1.166884, 1, 0, 0.007843138, 1
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
-0.1860436, -4.245017, -7.126548, 0, -0.5, 0.5, 0.5,
-0.1860436, -4.245017, -7.126548, 1, -0.5, 0.5, 0.5,
-0.1860436, -4.245017, -7.126548, 1, 1.5, 0.5, 0.5,
-0.1860436, -4.245017, -7.126548, 0, 1.5, 0.5, 0.5
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
-4.465636, 0.0604223, -7.126548, 0, -0.5, 0.5, 0.5,
-4.465636, 0.0604223, -7.126548, 1, -0.5, 0.5, 0.5,
-4.465636, 0.0604223, -7.126548, 1, 1.5, 0.5, 0.5,
-4.465636, 0.0604223, -7.126548, 0, 1.5, 0.5, 0.5
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
-4.465636, -4.245017, -0.2319407, 0, -0.5, 0.5, 0.5,
-4.465636, -4.245017, -0.2319407, 1, -0.5, 0.5, 0.5,
-4.465636, -4.245017, -0.2319407, 1, 1.5, 0.5, 0.5,
-4.465636, -4.245017, -0.2319407, 0, 1.5, 0.5, 0.5
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
-3, -3.251454, -5.535485,
3, -3.251454, -5.535485,
-3, -3.251454, -5.535485,
-3, -3.417048, -5.800663,
-2, -3.251454, -5.535485,
-2, -3.417048, -5.800663,
-1, -3.251454, -5.535485,
-1, -3.417048, -5.800663,
0, -3.251454, -5.535485,
0, -3.417048, -5.800663,
1, -3.251454, -5.535485,
1, -3.417048, -5.800663,
2, -3.251454, -5.535485,
2, -3.417048, -5.800663,
3, -3.251454, -5.535485,
3, -3.417048, -5.800663
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
-3, -3.748235, -6.331017, 0, -0.5, 0.5, 0.5,
-3, -3.748235, -6.331017, 1, -0.5, 0.5, 0.5,
-3, -3.748235, -6.331017, 1, 1.5, 0.5, 0.5,
-3, -3.748235, -6.331017, 0, 1.5, 0.5, 0.5,
-2, -3.748235, -6.331017, 0, -0.5, 0.5, 0.5,
-2, -3.748235, -6.331017, 1, -0.5, 0.5, 0.5,
-2, -3.748235, -6.331017, 1, 1.5, 0.5, 0.5,
-2, -3.748235, -6.331017, 0, 1.5, 0.5, 0.5,
-1, -3.748235, -6.331017, 0, -0.5, 0.5, 0.5,
-1, -3.748235, -6.331017, 1, -0.5, 0.5, 0.5,
-1, -3.748235, -6.331017, 1, 1.5, 0.5, 0.5,
-1, -3.748235, -6.331017, 0, 1.5, 0.5, 0.5,
0, -3.748235, -6.331017, 0, -0.5, 0.5, 0.5,
0, -3.748235, -6.331017, 1, -0.5, 0.5, 0.5,
0, -3.748235, -6.331017, 1, 1.5, 0.5, 0.5,
0, -3.748235, -6.331017, 0, 1.5, 0.5, 0.5,
1, -3.748235, -6.331017, 0, -0.5, 0.5, 0.5,
1, -3.748235, -6.331017, 1, -0.5, 0.5, 0.5,
1, -3.748235, -6.331017, 1, 1.5, 0.5, 0.5,
1, -3.748235, -6.331017, 0, 1.5, 0.5, 0.5,
2, -3.748235, -6.331017, 0, -0.5, 0.5, 0.5,
2, -3.748235, -6.331017, 1, -0.5, 0.5, 0.5,
2, -3.748235, -6.331017, 1, 1.5, 0.5, 0.5,
2, -3.748235, -6.331017, 0, 1.5, 0.5, 0.5,
3, -3.748235, -6.331017, 0, -0.5, 0.5, 0.5,
3, -3.748235, -6.331017, 1, -0.5, 0.5, 0.5,
3, -3.748235, -6.331017, 1, 1.5, 0.5, 0.5,
3, -3.748235, -6.331017, 0, 1.5, 0.5, 0.5
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
-3.478038, -3, -5.535485,
-3.478038, 3, -5.535485,
-3.478038, -3, -5.535485,
-3.642637, -3, -5.800663,
-3.478038, -2, -5.535485,
-3.642637, -2, -5.800663,
-3.478038, -1, -5.535485,
-3.642637, -1, -5.800663,
-3.478038, 0, -5.535485,
-3.642637, 0, -5.800663,
-3.478038, 1, -5.535485,
-3.642637, 1, -5.800663,
-3.478038, 2, -5.535485,
-3.642637, 2, -5.800663,
-3.478038, 3, -5.535485,
-3.642637, 3, -5.800663
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
-3.971837, -3, -6.331017, 0, -0.5, 0.5, 0.5,
-3.971837, -3, -6.331017, 1, -0.5, 0.5, 0.5,
-3.971837, -3, -6.331017, 1, 1.5, 0.5, 0.5,
-3.971837, -3, -6.331017, 0, 1.5, 0.5, 0.5,
-3.971837, -2, -6.331017, 0, -0.5, 0.5, 0.5,
-3.971837, -2, -6.331017, 1, -0.5, 0.5, 0.5,
-3.971837, -2, -6.331017, 1, 1.5, 0.5, 0.5,
-3.971837, -2, -6.331017, 0, 1.5, 0.5, 0.5,
-3.971837, -1, -6.331017, 0, -0.5, 0.5, 0.5,
-3.971837, -1, -6.331017, 1, -0.5, 0.5, 0.5,
-3.971837, -1, -6.331017, 1, 1.5, 0.5, 0.5,
-3.971837, -1, -6.331017, 0, 1.5, 0.5, 0.5,
-3.971837, 0, -6.331017, 0, -0.5, 0.5, 0.5,
-3.971837, 0, -6.331017, 1, -0.5, 0.5, 0.5,
-3.971837, 0, -6.331017, 1, 1.5, 0.5, 0.5,
-3.971837, 0, -6.331017, 0, 1.5, 0.5, 0.5,
-3.971837, 1, -6.331017, 0, -0.5, 0.5, 0.5,
-3.971837, 1, -6.331017, 1, -0.5, 0.5, 0.5,
-3.971837, 1, -6.331017, 1, 1.5, 0.5, 0.5,
-3.971837, 1, -6.331017, 0, 1.5, 0.5, 0.5,
-3.971837, 2, -6.331017, 0, -0.5, 0.5, 0.5,
-3.971837, 2, -6.331017, 1, -0.5, 0.5, 0.5,
-3.971837, 2, -6.331017, 1, 1.5, 0.5, 0.5,
-3.971837, 2, -6.331017, 0, 1.5, 0.5, 0.5,
-3.971837, 3, -6.331017, 0, -0.5, 0.5, 0.5,
-3.971837, 3, -6.331017, 1, -0.5, 0.5, 0.5,
-3.971837, 3, -6.331017, 1, 1.5, 0.5, 0.5,
-3.971837, 3, -6.331017, 0, 1.5, 0.5, 0.5
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
-3.478038, -3.251454, -4,
-3.478038, -3.251454, 4,
-3.478038, -3.251454, -4,
-3.642637, -3.417048, -4,
-3.478038, -3.251454, -2,
-3.642637, -3.417048, -2,
-3.478038, -3.251454, 0,
-3.642637, -3.417048, 0,
-3.478038, -3.251454, 2,
-3.642637, -3.417048, 2,
-3.478038, -3.251454, 4,
-3.642637, -3.417048, 4
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
-3.971837, -3.748235, -4, 0, -0.5, 0.5, 0.5,
-3.971837, -3.748235, -4, 1, -0.5, 0.5, 0.5,
-3.971837, -3.748235, -4, 1, 1.5, 0.5, 0.5,
-3.971837, -3.748235, -4, 0, 1.5, 0.5, 0.5,
-3.971837, -3.748235, -2, 0, -0.5, 0.5, 0.5,
-3.971837, -3.748235, -2, 1, -0.5, 0.5, 0.5,
-3.971837, -3.748235, -2, 1, 1.5, 0.5, 0.5,
-3.971837, -3.748235, -2, 0, 1.5, 0.5, 0.5,
-3.971837, -3.748235, 0, 0, -0.5, 0.5, 0.5,
-3.971837, -3.748235, 0, 1, -0.5, 0.5, 0.5,
-3.971837, -3.748235, 0, 1, 1.5, 0.5, 0.5,
-3.971837, -3.748235, 0, 0, 1.5, 0.5, 0.5,
-3.971837, -3.748235, 2, 0, -0.5, 0.5, 0.5,
-3.971837, -3.748235, 2, 1, -0.5, 0.5, 0.5,
-3.971837, -3.748235, 2, 1, 1.5, 0.5, 0.5,
-3.971837, -3.748235, 2, 0, 1.5, 0.5, 0.5,
-3.971837, -3.748235, 4, 0, -0.5, 0.5, 0.5,
-3.971837, -3.748235, 4, 1, -0.5, 0.5, 0.5,
-3.971837, -3.748235, 4, 1, 1.5, 0.5, 0.5,
-3.971837, -3.748235, 4, 0, 1.5, 0.5, 0.5
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
-3.478038, -3.251454, -5.535485,
-3.478038, 3.372298, -5.535485,
-3.478038, -3.251454, 5.071604,
-3.478038, 3.372298, 5.071604,
-3.478038, -3.251454, -5.535485,
-3.478038, -3.251454, 5.071604,
-3.478038, 3.372298, -5.535485,
-3.478038, 3.372298, 5.071604,
-3.478038, -3.251454, -5.535485,
3.105951, -3.251454, -5.535485,
-3.478038, -3.251454, 5.071604,
3.105951, -3.251454, 5.071604,
-3.478038, 3.372298, -5.535485,
3.105951, 3.372298, -5.535485,
-3.478038, 3.372298, 5.071604,
3.105951, 3.372298, 5.071604,
3.105951, -3.251454, -5.535485,
3.105951, 3.372298, -5.535485,
3.105951, -3.251454, 5.071604,
3.105951, 3.372298, 5.071604,
3.105951, -3.251454, -5.535485,
3.105951, -3.251454, 5.071604,
3.105951, 3.372298, -5.535485,
3.105951, 3.372298, 5.071604
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
var radius = 7.54659;
var distance = 33.57563;
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
mvMatrix.translate( 0.1860436, -0.0604223, 0.2319407 );
mvMatrix.scale( 1.239298, 1.231858, 0.7692516 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.57563);
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
acetic_acid-2-heptad<-read.table("acetic_acid-2-heptad.xyz")
```

```
## Error in read.table("acetic_acid-2-heptad.xyz"): no lines available in input
```

```r
x<-acetic_acid-2-heptad$V2
```

```
## Error in eval(expr, envir, enclos): object 'acetic_acid' not found
```

```r
y<-acetic_acid-2-heptad$V3
```

```
## Error in eval(expr, envir, enclos): object 'acetic_acid' not found
```

```r
z<-acetic_acid-2-heptad$V4
```

```
## Error in eval(expr, envir, enclos): object 'acetic_acid' not found
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
-3.382154, 2.010484, -1.224255, 0, 0, 1, 1, 1,
-3.206616, -0.9769499, -3.573398, 1, 0, 0, 1, 1,
-3.103857, 0.8511556, -2.617675, 1, 0, 0, 1, 1,
-2.938219, -1.026268, -1.897094, 1, 0, 0, 1, 1,
-2.881144, 1.371949, 0.8540523, 1, 0, 0, 1, 1,
-2.843326, -0.2453794, -2.359961, 1, 0, 0, 1, 1,
-2.748117, 0.1841961, -2.055172, 0, 0, 0, 1, 1,
-2.563661, 0.5284903, -0.8858137, 0, 0, 0, 1, 1,
-2.521042, -0.8990307, -2.24863, 0, 0, 0, 1, 1,
-2.447731, -0.1761449, -3.365422, 0, 0, 0, 1, 1,
-2.443034, 0.9400655, -1.825411, 0, 0, 0, 1, 1,
-2.432715, -1.344164, -1.251423, 0, 0, 0, 1, 1,
-2.428128, -0.3516364, -3.812565, 0, 0, 0, 1, 1,
-2.423077, 0.7592843, 0.310169, 1, 1, 1, 1, 1,
-2.416843, -1.503246, -1.871946, 1, 1, 1, 1, 1,
-2.281685, 0.3064507, -2.015889, 1, 1, 1, 1, 1,
-2.259257, -2.296095, -1.838576, 1, 1, 1, 1, 1,
-2.247986, -0.10523, -2.61506, 1, 1, 1, 1, 1,
-2.230011, 0.7835656, -1.916613, 1, 1, 1, 1, 1,
-2.227192, 0.2433712, -1.220285, 1, 1, 1, 1, 1,
-2.224082, -1.756283, -3.383183, 1, 1, 1, 1, 1,
-2.207842, 0.4738115, -0.7030133, 1, 1, 1, 1, 1,
-2.164891, 0.2809846, -1.852259, 1, 1, 1, 1, 1,
-2.100444, 0.1646634, -0.8144535, 1, 1, 1, 1, 1,
-2.091249, 2.374013, 1.084238, 1, 1, 1, 1, 1,
-2.075232, 1.808723, 1.040094, 1, 1, 1, 1, 1,
-2.058697, -0.2580253, -1.846693, 1, 1, 1, 1, 1,
-2.030751, 2.662774, -2.626526, 1, 1, 1, 1, 1,
-1.995426, -0.02104201, -0.9830956, 0, 0, 1, 1, 1,
-1.991723, 1.661818, -1.539457, 1, 0, 0, 1, 1,
-1.98065, 0.7830526, -1.402374, 1, 0, 0, 1, 1,
-1.980534, 0.6522958, -2.112873, 1, 0, 0, 1, 1,
-1.935273, -1.35701, -2.204495, 1, 0, 0, 1, 1,
-1.9344, -0.2105843, -0.4208911, 1, 0, 0, 1, 1,
-1.917628, -1.593402, -1.845245, 0, 0, 0, 1, 1,
-1.912693, -1.543693, -4.723021, 0, 0, 0, 1, 1,
-1.910914, -0.9996373, -2.307391, 0, 0, 0, 1, 1,
-1.902609, -1.645144, -2.535626, 0, 0, 0, 1, 1,
-1.902054, -0.3829804, -2.129229, 0, 0, 0, 1, 1,
-1.882273, 0.4133926, -1.545338, 0, 0, 0, 1, 1,
-1.880956, -0.06220366, -1.389037, 0, 0, 0, 1, 1,
-1.862234, 1.722551, -0.3427731, 1, 1, 1, 1, 1,
-1.842726, 1.78499, -0.2006613, 1, 1, 1, 1, 1,
-1.836029, -0.2452887, -3.4207, 1, 1, 1, 1, 1,
-1.831911, -0.9985971, -3.528595, 1, 1, 1, 1, 1,
-1.822237, 1.369585, -0.3171303, 1, 1, 1, 1, 1,
-1.792049, 0.2785787, -1.14689, 1, 1, 1, 1, 1,
-1.779024, -0.02230222, 0.383453, 1, 1, 1, 1, 1,
-1.778613, 0.2581443, -2.162763, 1, 1, 1, 1, 1,
-1.763676, -1.070441, -2.51492, 1, 1, 1, 1, 1,
-1.74062, -0.2034416, -2.035289, 1, 1, 1, 1, 1,
-1.730642, 2.131776, -0.6820166, 1, 1, 1, 1, 1,
-1.710732, -0.4729956, -1.21496, 1, 1, 1, 1, 1,
-1.698952, -2.713234, -3.532177, 1, 1, 1, 1, 1,
-1.685259, -2.168164, -3.215835, 1, 1, 1, 1, 1,
-1.673321, 0.7289652, -1.936183, 1, 1, 1, 1, 1,
-1.670681, 1.051556, -1.510137, 0, 0, 1, 1, 1,
-1.66558, 0.4792374, -2.679485, 1, 0, 0, 1, 1,
-1.656952, -0.5182737, -2.494821, 1, 0, 0, 1, 1,
-1.655108, 1.859096, -2.54557, 1, 0, 0, 1, 1,
-1.651212, -0.2248603, -1.032206, 1, 0, 0, 1, 1,
-1.647031, 0.3846457, -1.068694, 1, 0, 0, 1, 1,
-1.627873, -0.4354368, -4.267722, 0, 0, 0, 1, 1,
-1.618944, 0.1767223, -0.6391038, 0, 0, 0, 1, 1,
-1.616845, 1.004144, -0.3748858, 0, 0, 0, 1, 1,
-1.615309, -0.2928987, -2.818289, 0, 0, 0, 1, 1,
-1.614842, -0.1780521, -1.051338, 0, 0, 0, 1, 1,
-1.607453, -1.624121, -2.28459, 0, 0, 0, 1, 1,
-1.600372, -0.1986541, -1.254517, 0, 0, 0, 1, 1,
-1.579999, -0.8945612, -1.047503, 1, 1, 1, 1, 1,
-1.572659, -0.04534301, -1.549125, 1, 1, 1, 1, 1,
-1.560248, 1.107421, 0.6814218, 1, 1, 1, 1, 1,
-1.559615, 1.15892, -1.979033, 1, 1, 1, 1, 1,
-1.542585, -1.990647, -3.085634, 1, 1, 1, 1, 1,
-1.535586, 0.2289907, -0.7658094, 1, 1, 1, 1, 1,
-1.532235, 1.36371, -0.5967151, 1, 1, 1, 1, 1,
-1.524639, -0.2024126, -2.094196, 1, 1, 1, 1, 1,
-1.519786, -0.5485778, -2.136665, 1, 1, 1, 1, 1,
-1.512991, 0.8401545, 0.1387838, 1, 1, 1, 1, 1,
-1.507357, -1.134182, -1.321463, 1, 1, 1, 1, 1,
-1.503094, 0.3961438, -1.037776, 1, 1, 1, 1, 1,
-1.495114, -0.5696322, -2.307005, 1, 1, 1, 1, 1,
-1.487599, 0.6637086, -0.8874272, 1, 1, 1, 1, 1,
-1.48442, -1.350555, -2.487323, 1, 1, 1, 1, 1,
-1.470457, 0.7269669, -1.85191, 0, 0, 1, 1, 1,
-1.463292, -0.9863752, -0.7645448, 1, 0, 0, 1, 1,
-1.452614, 0.982013, 0.1437699, 1, 0, 0, 1, 1,
-1.452276, 0.5020866, -0.7663869, 1, 0, 0, 1, 1,
-1.445651, -1.09086, -2.838126, 1, 0, 0, 1, 1,
-1.421842, 0.3451612, -1.024783, 1, 0, 0, 1, 1,
-1.417061, 1.107394, -2.242762, 0, 0, 0, 1, 1,
-1.407434, 0.663823, -0.2014079, 0, 0, 0, 1, 1,
-1.400551, 0.02165907, -0.4157075, 0, 0, 0, 1, 1,
-1.396552, 0.5166281, 0.06059492, 0, 0, 0, 1, 1,
-1.38783, -0.09311597, -3.047422, 0, 0, 0, 1, 1,
-1.368059, -0.8113558, -2.947676, 0, 0, 0, 1, 1,
-1.367045, -0.554177, -2.591815, 0, 0, 0, 1, 1,
-1.353545, -0.4323196, -1.692955, 1, 1, 1, 1, 1,
-1.351964, 0.1371961, -1.375566, 1, 1, 1, 1, 1,
-1.342802, 1.507587, -0.9240577, 1, 1, 1, 1, 1,
-1.336774, -1.740127, -2.802048, 1, 1, 1, 1, 1,
-1.336643, 0.4325745, -1.291245, 1, 1, 1, 1, 1,
-1.334643, -1.498817, -2.448771, 1, 1, 1, 1, 1,
-1.313089, 1.543175, 0.132913, 1, 1, 1, 1, 1,
-1.295546, 0.04929012, -2.33327, 1, 1, 1, 1, 1,
-1.294397, 0.4080093, -3.700154, 1, 1, 1, 1, 1,
-1.289344, -1.266442, -2.485854, 1, 1, 1, 1, 1,
-1.281754, -0.3232588, -1.656012, 1, 1, 1, 1, 1,
-1.275589, -0.3238933, -0.5673858, 1, 1, 1, 1, 1,
-1.26418, -0.3007101, -2.324103, 1, 1, 1, 1, 1,
-1.26147, -1.527554, -0.6961647, 1, 1, 1, 1, 1,
-1.249336, -1.320893, -1.448255, 1, 1, 1, 1, 1,
-1.247214, 0.5966924, -0.3285852, 0, 0, 1, 1, 1,
-1.232372, 1.243836, -0.9364367, 1, 0, 0, 1, 1,
-1.218966, -2.452794, -2.975479, 1, 0, 0, 1, 1,
-1.217852, 0.4061235, -0.6276948, 1, 0, 0, 1, 1,
-1.217394, 1.302926, 0.1089939, 1, 0, 0, 1, 1,
-1.217152, 1.948362, 0.02799493, 1, 0, 0, 1, 1,
-1.214056, 0.3235728, -1.060266, 0, 0, 0, 1, 1,
-1.212648, -0.05806271, -0.7916391, 0, 0, 0, 1, 1,
-1.206899, -0.3439004, -1.540361, 0, 0, 0, 1, 1,
-1.204955, 0.5402943, -3.211237, 0, 0, 0, 1, 1,
-1.192449, 1.443028, 0.7500321, 0, 0, 0, 1, 1,
-1.192071, 0.4149365, -2.55794, 0, 0, 0, 1, 1,
-1.190144, -0.7256633, -3.360744, 0, 0, 0, 1, 1,
-1.189762, -0.5614862, -2.094004, 1, 1, 1, 1, 1,
-1.187389, 0.9584279, -1.429714, 1, 1, 1, 1, 1,
-1.179992, 0.245696, -1.057931, 1, 1, 1, 1, 1,
-1.178976, -0.7738555, -0.02096123, 1, 1, 1, 1, 1,
-1.178335, -1.238344, -3.206325, 1, 1, 1, 1, 1,
-1.172081, -2.529001, -2.963473, 1, 1, 1, 1, 1,
-1.165413, 1.821583, -0.2561997, 1, 1, 1, 1, 1,
-1.164968, -1.79032, -1.841832, 1, 1, 1, 1, 1,
-1.162841, -0.2437128, -1.474953, 1, 1, 1, 1, 1,
-1.161598, 0.1586568, -2.624002, 1, 1, 1, 1, 1,
-1.160687, -0.8002492, -0.75528, 1, 1, 1, 1, 1,
-1.157339, -0.93705, -1.011632, 1, 1, 1, 1, 1,
-1.152151, 0.3090895, 0.04696134, 1, 1, 1, 1, 1,
-1.149527, -0.6490784, -0.7644367, 1, 1, 1, 1, 1,
-1.137309, 1.13706, -1.058487, 1, 1, 1, 1, 1,
-1.133872, -2.062852, -3.17641, 0, 0, 1, 1, 1,
-1.133255, -2.475523, -1.86582, 1, 0, 0, 1, 1,
-1.122509, -1.36588, -2.776329, 1, 0, 0, 1, 1,
-1.117524, -0.2145252, -0.6554564, 1, 0, 0, 1, 1,
-1.112752, -1.886721, -2.887437, 1, 0, 0, 1, 1,
-1.111824, 1.700464, -1.374965, 1, 0, 0, 1, 1,
-1.111307, -0.2077895, 0.1358498, 0, 0, 0, 1, 1,
-1.104453, -0.9432238, -2.617572, 0, 0, 0, 1, 1,
-1.098033, -0.3378185, -1.731718, 0, 0, 0, 1, 1,
-1.088721, 0.07615708, -0.01846297, 0, 0, 0, 1, 1,
-1.086862, -0.3039185, -1.422368, 0, 0, 0, 1, 1,
-1.083723, 0.1820709, -1.179011, 0, 0, 0, 1, 1,
-1.081459, 0.6283971, 0.3028464, 0, 0, 0, 1, 1,
-1.07565, -0.9182636, -2.318148, 1, 1, 1, 1, 1,
-1.070957, 0.3962854, -1.492586, 1, 1, 1, 1, 1,
-1.070166, -0.5076599, -1.173499, 1, 1, 1, 1, 1,
-1.06163, -1.435653, -4.206975, 1, 1, 1, 1, 1,
-1.060721, -0.05535443, -2.005768, 1, 1, 1, 1, 1,
-1.058084, 0.08698032, -1.038362, 1, 1, 1, 1, 1,
-1.053489, -0.124645, -0.2530837, 1, 1, 1, 1, 1,
-1.036373, 1.228084, -3.726844, 1, 1, 1, 1, 1,
-1.034909, 2.570194, 0.5198304, 1, 1, 1, 1, 1,
-1.034217, 0.3308484, -0.3556502, 1, 1, 1, 1, 1,
-1.030994, 1.272408, -0.974994, 1, 1, 1, 1, 1,
-1.029287, 0.9776306, -2.49064, 1, 1, 1, 1, 1,
-1.025027, -0.8657975, -3.318092, 1, 1, 1, 1, 1,
-1.020407, 0.3815496, -0.3522899, 1, 1, 1, 1, 1,
-1.019171, 0.3204399, -2.210672, 1, 1, 1, 1, 1,
-1.016568, 0.8297029, -0.372093, 0, 0, 1, 1, 1,
-1.015674, 0.0509681, -1.708891, 1, 0, 0, 1, 1,
-1.01067, -0.0760373, -2.241724, 1, 0, 0, 1, 1,
-1.007611, 0.5712851, -1.367671, 1, 0, 0, 1, 1,
-1.00677, 0.322837, -2.40148, 1, 0, 0, 1, 1,
-1.005697, -0.008916883, -1.351914, 1, 0, 0, 1, 1,
-1.003711, 0.00995768, -0.03855573, 0, 0, 0, 1, 1,
-0.999554, -0.6589514, -2.877369, 0, 0, 0, 1, 1,
-0.9959524, 0.3716416, -1.19425, 0, 0, 0, 1, 1,
-0.9957371, -0.1187241, -1.249283, 0, 0, 0, 1, 1,
-0.9816503, -0.8635501, -3.706577, 0, 0, 0, 1, 1,
-0.9779961, 0.2752889, 0.6168257, 0, 0, 0, 1, 1,
-0.9754605, 0.2406281, -0.9215877, 0, 0, 0, 1, 1,
-0.972609, 0.9357754, -0.4162116, 1, 1, 1, 1, 1,
-0.9695703, 0.1906302, -1.03111, 1, 1, 1, 1, 1,
-0.9670386, 0.9519132, -1.621563, 1, 1, 1, 1, 1,
-0.9615626, -0.1268119, -1.884503, 1, 1, 1, 1, 1,
-0.9597299, -1.616094, -2.643641, 1, 1, 1, 1, 1,
-0.9582505, 0.1545527, -3.372874, 1, 1, 1, 1, 1,
-0.9525717, 0.253752, -1.55928, 1, 1, 1, 1, 1,
-0.952267, 0.02685095, -2.926724, 1, 1, 1, 1, 1,
-0.9495751, -0.9517463, -1.48387, 1, 1, 1, 1, 1,
-0.9442862, 0.8394367, -1.834377, 1, 1, 1, 1, 1,
-0.9403597, 0.4256683, -0.8693342, 1, 1, 1, 1, 1,
-0.9389675, 0.751402, -1.073938, 1, 1, 1, 1, 1,
-0.9367975, -0.4632675, -3.743829, 1, 1, 1, 1, 1,
-0.9347348, -1.265081, -2.693783, 1, 1, 1, 1, 1,
-0.9308283, 0.9546944, -1.069605, 1, 1, 1, 1, 1,
-0.9306373, 0.680226, -0.6156523, 0, 0, 1, 1, 1,
-0.9303872, 1.170742, -2.50712, 1, 0, 0, 1, 1,
-0.9296862, 1.451061, -1.869163, 1, 0, 0, 1, 1,
-0.9228363, 1.573446, -0.3820814, 1, 0, 0, 1, 1,
-0.9225784, 0.4843891, -1.491437, 1, 0, 0, 1, 1,
-0.914113, -0.9786084, -3.779808, 1, 0, 0, 1, 1,
-0.911069, -1.126026, -2.230429, 0, 0, 0, 1, 1,
-0.9104527, -0.3708881, -1.745448, 0, 0, 0, 1, 1,
-0.9031815, 0.5354784, -0.1536144, 0, 0, 0, 1, 1,
-0.8976552, -0.1358771, -4.045069, 0, 0, 0, 1, 1,
-0.89012, -0.2761189, -2.973904, 0, 0, 0, 1, 1,
-0.8829042, 1.04432, 0.09031238, 0, 0, 0, 1, 1,
-0.8811527, -0.351815, -2.241584, 0, 0, 0, 1, 1,
-0.8786547, 0.2708231, -0.154467, 1, 1, 1, 1, 1,
-0.8781932, 0.5796598, -1.839181, 1, 1, 1, 1, 1,
-0.875545, 0.8935218, -1.360573, 1, 1, 1, 1, 1,
-0.8734319, 0.8643261, -1.505407, 1, 1, 1, 1, 1,
-0.8669209, -0.7041416, -1.953516, 1, 1, 1, 1, 1,
-0.8631681, 0.3329072, -3.67787, 1, 1, 1, 1, 1,
-0.8600836, -1.386912, -3.909917, 1, 1, 1, 1, 1,
-0.8586937, -0.6870469, -4.128601, 1, 1, 1, 1, 1,
-0.8586026, 0.4785096, -0.1876908, 1, 1, 1, 1, 1,
-0.8513454, -0.6628263, -2.720344, 1, 1, 1, 1, 1,
-0.8509927, 0.2599439, -2.2481, 1, 1, 1, 1, 1,
-0.8496208, 0.08372157, -1.5342, 1, 1, 1, 1, 1,
-0.8446816, -1.705894, -2.690293, 1, 1, 1, 1, 1,
-0.8426514, 0.8790478, -0.3004219, 1, 1, 1, 1, 1,
-0.8358324, 0.7464864, -0.7906184, 1, 1, 1, 1, 1,
-0.8324312, -0.5435907, -2.093866, 0, 0, 1, 1, 1,
-0.8212001, 0.1651209, -1.494062, 1, 0, 0, 1, 1,
-0.8205401, -1.477312, -2.829756, 1, 0, 0, 1, 1,
-0.8174428, -2.096824, -1.010284, 1, 0, 0, 1, 1,
-0.8156682, 1.118806, -0.7294555, 1, 0, 0, 1, 1,
-0.8117908, -0.1891854, -2.278761, 1, 0, 0, 1, 1,
-0.8101813, -0.08415428, -1.471166, 0, 0, 0, 1, 1,
-0.8085898, -0.4993345, -0.2497797, 0, 0, 0, 1, 1,
-0.8060776, 0.3622557, -0.7461852, 0, 0, 0, 1, 1,
-0.7994859, -0.08538247, 0.03735469, 0, 0, 0, 1, 1,
-0.7934759, 0.2825415, -0.9023426, 0, 0, 0, 1, 1,
-0.7913939, 1.129938, 1.029971, 0, 0, 0, 1, 1,
-0.7905621, -0.1063039, -0.1840656, 0, 0, 0, 1, 1,
-0.7902693, 0.1412956, -0.8369415, 1, 1, 1, 1, 1,
-0.7891343, -0.2947589, -1.681658, 1, 1, 1, 1, 1,
-0.7865671, -1.334025, -3.121207, 1, 1, 1, 1, 1,
-0.7757583, -1.800398, -3.596267, 1, 1, 1, 1, 1,
-0.7653249, -0.96946, -2.923918, 1, 1, 1, 1, 1,
-0.7632445, 1.267756, -0.519175, 1, 1, 1, 1, 1,
-0.7621207, -1.130686, -2.80258, 1, 1, 1, 1, 1,
-0.7585035, -2.078999, -1.95918, 1, 1, 1, 1, 1,
-0.7513514, 0.1349437, -1.517405, 1, 1, 1, 1, 1,
-0.7467394, 0.7783824, -1.323826, 1, 1, 1, 1, 1,
-0.7433262, 0.5543389, -0.9472536, 1, 1, 1, 1, 1,
-0.7418133, -0.5546967, -1.946324, 1, 1, 1, 1, 1,
-0.741243, -0.5132935, -0.9242641, 1, 1, 1, 1, 1,
-0.7396855, 0.8434131, -1.177284, 1, 1, 1, 1, 1,
-0.7360749, 0.4375989, -1.137183, 1, 1, 1, 1, 1,
-0.7339626, 1.608006, 0.108606, 0, 0, 1, 1, 1,
-0.7327577, -1.179562, -3.661849, 1, 0, 0, 1, 1,
-0.7322111, -1.606468, -3.007396, 1, 0, 0, 1, 1,
-0.7210816, -0.2352547, -3.375926, 1, 0, 0, 1, 1,
-0.7185169, 1.267775, -1.070004, 1, 0, 0, 1, 1,
-0.7068648, 0.5852976, -1.186982, 1, 0, 0, 1, 1,
-0.7049438, 0.9990306, -1.025659, 0, 0, 0, 1, 1,
-0.6963504, 2.71782, -1.506345, 0, 0, 0, 1, 1,
-0.6884935, 1.073587, -0.3388751, 0, 0, 0, 1, 1,
-0.6866376, 1.476613, 0.1555275, 0, 0, 0, 1, 1,
-0.6847722, -0.4778176, -1.998155, 0, 0, 0, 1, 1,
-0.6756577, -1.183936, -1.108527, 0, 0, 0, 1, 1,
-0.6681805, -0.7625472, 0.05955209, 0, 0, 0, 1, 1,
-0.6617368, -0.8467001, -2.067655, 1, 1, 1, 1, 1,
-0.6592151, -0.7725233, -2.249887, 1, 1, 1, 1, 1,
-0.6591625, 0.4067936, -0.3012723, 1, 1, 1, 1, 1,
-0.6492646, -0.3879498, -2.31137, 1, 1, 1, 1, 1,
-0.644062, -1.133268, -3.687008, 1, 1, 1, 1, 1,
-0.6388832, -0.5291076, -1.929379, 1, 1, 1, 1, 1,
-0.6376699, 2.256281, -1.269124, 1, 1, 1, 1, 1,
-0.636003, 1.717178, -0.09094688, 1, 1, 1, 1, 1,
-0.6322829, -1.486433, -0.9650727, 1, 1, 1, 1, 1,
-0.6284211, 0.5434883, -0.6383545, 1, 1, 1, 1, 1,
-0.6276024, -1.560942, -0.9873624, 1, 1, 1, 1, 1,
-0.6262811, 0.009358635, -3.182392, 1, 1, 1, 1, 1,
-0.6225678, -0.06851535, -0.0472695, 1, 1, 1, 1, 1,
-0.6175483, 1.355438, -1.088613, 1, 1, 1, 1, 1,
-0.6162924, -0.64263, -5.381013, 1, 1, 1, 1, 1,
-0.6162423, 2.834702, -0.1727475, 0, 0, 1, 1, 1,
-0.6156702, -1.002746, -1.458028, 1, 0, 0, 1, 1,
-0.6145799, 0.09162509, 0.6361223, 1, 0, 0, 1, 1,
-0.6126751, -0.2224382, -2.614801, 1, 0, 0, 1, 1,
-0.6077296, 0.0666441, -0.7144395, 1, 0, 0, 1, 1,
-0.6059082, -1.088634, -3.462294, 1, 0, 0, 1, 1,
-0.6024487, 0.4568943, 0.1928379, 0, 0, 0, 1, 1,
-0.6002416, 2.022407, -0.6807506, 0, 0, 0, 1, 1,
-0.5926386, 0.1683121, -0.910956, 0, 0, 0, 1, 1,
-0.5844699, -0.3905481, -2.709485, 0, 0, 0, 1, 1,
-0.5817979, 0.2997413, -0.6134142, 0, 0, 0, 1, 1,
-0.5776724, -0.05576336, -2.209415, 0, 0, 0, 1, 1,
-0.5771452, 1.516287, -0.690769, 0, 0, 0, 1, 1,
-0.5701888, 2.014076, -0.7011935, 1, 1, 1, 1, 1,
-0.567688, -1.347063, -3.173828, 1, 1, 1, 1, 1,
-0.5666501, 0.6589044, -2.02795, 1, 1, 1, 1, 1,
-0.56378, -0.3992275, -2.352073, 1, 1, 1, 1, 1,
-0.5629562, 0.2263125, -0.9883371, 1, 1, 1, 1, 1,
-0.5619962, 1.604412, -2.178326, 1, 1, 1, 1, 1,
-0.5595995, -1.156689, -3.102485, 1, 1, 1, 1, 1,
-0.5584117, -0.7823457, -3.948121, 1, 1, 1, 1, 1,
-0.5522966, -1.664952, -2.16181, 1, 1, 1, 1, 1,
-0.5490153, 0.4381381, 0.5570617, 1, 1, 1, 1, 1,
-0.5474939, -0.84698, -4.80465, 1, 1, 1, 1, 1,
-0.5472984, -1.059724, -2.414252, 1, 1, 1, 1, 1,
-0.5462428, 0.3727856, -1.294679, 1, 1, 1, 1, 1,
-0.5460154, -0.1285716, 0.1345834, 1, 1, 1, 1, 1,
-0.5431278, 1.065261, -2.219945, 1, 1, 1, 1, 1,
-0.5413179, -0.6656619, -3.036302, 0, 0, 1, 1, 1,
-0.5407304, 1.379902, 0.1228992, 1, 0, 0, 1, 1,
-0.5273674, 0.7699099, -0.6935101, 1, 0, 0, 1, 1,
-0.5257794, 0.2826833, -2.039034, 1, 0, 0, 1, 1,
-0.5247732, -0.1305291, -2.190432, 1, 0, 0, 1, 1,
-0.521417, -0.3086356, -3.791175, 1, 0, 0, 1, 1,
-0.5092072, -0.2678209, -2.171387, 0, 0, 0, 1, 1,
-0.5059863, 0.8400846, 0.9392595, 0, 0, 0, 1, 1,
-0.5014709, 1.017179, 0.795215, 0, 0, 0, 1, 1,
-0.4960508, -0.3080484, -2.545262, 0, 0, 0, 1, 1,
-0.4938046, 1.318125, 0.5608605, 0, 0, 0, 1, 1,
-0.4932651, 0.8268172, -0.07351501, 0, 0, 0, 1, 1,
-0.4904824, 0.9239152, 0.572191, 0, 0, 0, 1, 1,
-0.4894825, -0.6664988, -2.842858, 1, 1, 1, 1, 1,
-0.4892584, -1.783144, -3.601109, 1, 1, 1, 1, 1,
-0.4862323, 1.292085, 1.461005, 1, 1, 1, 1, 1,
-0.4792496, -0.8350518, -1.744873, 1, 1, 1, 1, 1,
-0.4772988, 0.02741653, -0.2569391, 1, 1, 1, 1, 1,
-0.476744, 1.508768, -1.981547, 1, 1, 1, 1, 1,
-0.4755818, 0.4559185, -0.8931451, 1, 1, 1, 1, 1,
-0.4750235, -1.190499, -2.629515, 1, 1, 1, 1, 1,
-0.4748073, 0.7987462, -0.6545193, 1, 1, 1, 1, 1,
-0.4743497, 0.01185744, -2.404018, 1, 1, 1, 1, 1,
-0.47306, -0.8275171, -2.802735, 1, 1, 1, 1, 1,
-0.4724669, 1.312579, -0.8687722, 1, 1, 1, 1, 1,
-0.4671174, -1.303096, -3.37718, 1, 1, 1, 1, 1,
-0.4655248, 1.230572, 0.5194537, 1, 1, 1, 1, 1,
-0.464748, 0.5178334, -0.7551075, 1, 1, 1, 1, 1,
-0.4643937, 0.1695443, -2.263483, 0, 0, 1, 1, 1,
-0.4643661, -0.5018217, -2.308125, 1, 0, 0, 1, 1,
-0.4642937, 1.127047, -1.381573, 1, 0, 0, 1, 1,
-0.4589134, 0.8178808, -1.551519, 1, 0, 0, 1, 1,
-0.4504819, 0.7508498, -0.8787382, 1, 0, 0, 1, 1,
-0.448816, 0.2308772, -2.16162, 1, 0, 0, 1, 1,
-0.446274, -0.8450224, -1.170509, 0, 0, 0, 1, 1,
-0.4426392, -0.7526771, -1.604504, 0, 0, 0, 1, 1,
-0.4394998, -0.4515336, -1.844081, 0, 0, 0, 1, 1,
-0.4366028, -0.2933525, -2.167272, 0, 0, 0, 1, 1,
-0.4335265, -0.5968448, -2.442675, 0, 0, 0, 1, 1,
-0.4331432, 0.515435, -0.2602768, 0, 0, 0, 1, 1,
-0.4308369, 0.9627715, -1.09809, 0, 0, 0, 1, 1,
-0.4267249, 0.9683183, -0.6525517, 1, 1, 1, 1, 1,
-0.4229771, -0.2357912, -1.557623, 1, 1, 1, 1, 1,
-0.4219812, 0.2788079, -0.2368267, 1, 1, 1, 1, 1,
-0.4209342, 1.587842, -0.9391175, 1, 1, 1, 1, 1,
-0.4203344, 1.969424, -2.95675, 1, 1, 1, 1, 1,
-0.4180217, 1.061361, -2.540215, 1, 1, 1, 1, 1,
-0.4138584, 1.046186, 0.01089507, 1, 1, 1, 1, 1,
-0.4122462, -2.43426, -3.653656, 1, 1, 1, 1, 1,
-0.4117652, 0.1175571, -1.316425, 1, 1, 1, 1, 1,
-0.4025129, -1.160649, -0.3270085, 1, 1, 1, 1, 1,
-0.3923259, 0.34816, -2.086947, 1, 1, 1, 1, 1,
-0.3907637, 1.449333, 0.402478, 1, 1, 1, 1, 1,
-0.3900549, 0.7300423, -0.3636284, 1, 1, 1, 1, 1,
-0.3879443, -0.09127872, -3.192883, 1, 1, 1, 1, 1,
-0.3858218, -1.983378, -3.132231, 1, 1, 1, 1, 1,
-0.3850226, 0.3141982, -1.977386, 0, 0, 1, 1, 1,
-0.3846906, -0.5061995, -2.098514, 1, 0, 0, 1, 1,
-0.3844857, 1.403835, 0.3846211, 1, 0, 0, 1, 1,
-0.384063, -0.06194452, -1.403944, 1, 0, 0, 1, 1,
-0.382356, -0.282521, -1.137003, 1, 0, 0, 1, 1,
-0.3784674, 0.2531508, 0.123741, 1, 0, 0, 1, 1,
-0.3779584, 0.6079916, -1.409977, 0, 0, 0, 1, 1,
-0.3774936, 1.136716, 0.767316, 0, 0, 0, 1, 1,
-0.3747774, -0.9028451, -1.924109, 0, 0, 0, 1, 1,
-0.3745228, -0.5831529, -2.58507, 0, 0, 0, 1, 1,
-0.3726307, -0.07757291, -1.620475, 0, 0, 0, 1, 1,
-0.3668749, 2.211079, 0.03838124, 0, 0, 0, 1, 1,
-0.3661697, -0.8371087, -3.341181, 0, 0, 0, 1, 1,
-0.3602051, -2.356112, -3.160916, 1, 1, 1, 1, 1,
-0.3569403, -0.2059377, -2.961021, 1, 1, 1, 1, 1,
-0.3544926, 0.6835797, -1.095901, 1, 1, 1, 1, 1,
-0.3534245, -0.8842274, -2.906037, 1, 1, 1, 1, 1,
-0.3527441, 0.008995279, -2.669046, 1, 1, 1, 1, 1,
-0.350478, 1.322789, -1.963959, 1, 1, 1, 1, 1,
-0.3485432, 1.043976, -1.757664, 1, 1, 1, 1, 1,
-0.3453147, -0.1426827, -0.3947817, 1, 1, 1, 1, 1,
-0.341214, -1.135126, -2.262754, 1, 1, 1, 1, 1,
-0.3392037, -0.09397385, -0.004276397, 1, 1, 1, 1, 1,
-0.3367306, 0.4411394, -1.033334, 1, 1, 1, 1, 1,
-0.3359739, -0.3327216, -0.9698706, 1, 1, 1, 1, 1,
-0.3349316, 0.6343705, -0.2642679, 1, 1, 1, 1, 1,
-0.3326743, -1.232012, -2.925926, 1, 1, 1, 1, 1,
-0.3229485, 0.2169306, -0.739954, 1, 1, 1, 1, 1,
-0.3199541, -0.03912516, -3.197657, 0, 0, 1, 1, 1,
-0.3180813, -0.04829062, -3.086613, 1, 0, 0, 1, 1,
-0.3176887, 0.3999619, -1.174945, 1, 0, 0, 1, 1,
-0.3174051, -0.5169574, -3.186624, 1, 0, 0, 1, 1,
-0.3170551, -0.169759, -3.082615, 1, 0, 0, 1, 1,
-0.3160697, -1.302555, -2.916459, 1, 0, 0, 1, 1,
-0.3107207, -0.4249405, -2.12885, 0, 0, 0, 1, 1,
-0.3066093, -0.9660144, -1.927484, 0, 0, 0, 1, 1,
-0.3058317, 0.5200464, -0.4866256, 0, 0, 0, 1, 1,
-0.296517, -1.00669, -2.540189, 0, 0, 0, 1, 1,
-0.2960842, -0.1160033, -3.614709, 0, 0, 0, 1, 1,
-0.295387, -0.2665721, -2.197193, 0, 0, 0, 1, 1,
-0.2914742, 1.108645, -0.6023232, 0, 0, 0, 1, 1,
-0.2911638, 0.630796, -0.1173847, 1, 1, 1, 1, 1,
-0.2901082, -0.1293571, -3.635598, 1, 1, 1, 1, 1,
-0.284918, -0.2632058, -3.061962, 1, 1, 1, 1, 1,
-0.2839649, 0.5844446, 0.005359122, 1, 1, 1, 1, 1,
-0.2817208, -0.4688484, -3.748119, 1, 1, 1, 1, 1,
-0.2792291, -0.9979168, -4.186929, 1, 1, 1, 1, 1,
-0.2790326, -0.6865082, -1.307275, 1, 1, 1, 1, 1,
-0.2777512, -0.7494699, -3.433893, 1, 1, 1, 1, 1,
-0.2755934, 2.656107, -1.107241, 1, 1, 1, 1, 1,
-0.2673525, -0.911308, -2.454149, 1, 1, 1, 1, 1,
-0.2642155, -0.2564963, -2.519712, 1, 1, 1, 1, 1,
-0.2641248, -1.584197, -2.215822, 1, 1, 1, 1, 1,
-0.2631887, 1.604695, -0.04675462, 1, 1, 1, 1, 1,
-0.260065, 0.5914925, -2.13434, 1, 1, 1, 1, 1,
-0.246241, 0.4472409, 0.7387348, 1, 1, 1, 1, 1,
-0.2453377, -1.066881, -1.974573, 0, 0, 1, 1, 1,
-0.2350549, 1.075341, 0.07174612, 1, 0, 0, 1, 1,
-0.2345901, -0.3356657, -3.344037, 1, 0, 0, 1, 1,
-0.2270257, -0.8785709, -4.246763, 1, 0, 0, 1, 1,
-0.2254742, 1.313096, -1.486936, 1, 0, 0, 1, 1,
-0.2251887, -0.125614, -1.150782, 1, 0, 0, 1, 1,
-0.2240675, -1.427854, -2.073826, 0, 0, 0, 1, 1,
-0.2221007, -0.679056, -2.027755, 0, 0, 0, 1, 1,
-0.2185052, 0.1553238, 0.4924287, 0, 0, 0, 1, 1,
-0.2156166, 2.051396, -1.873802, 0, 0, 0, 1, 1,
-0.2131743, -0.9909883, -4.450996, 0, 0, 0, 1, 1,
-0.2110071, -0.5530639, -2.580978, 0, 0, 0, 1, 1,
-0.2045816, -1.391346, -2.141689, 0, 0, 0, 1, 1,
-0.2024537, 1.700852, -0.9999542, 1, 1, 1, 1, 1,
-0.201625, 0.6830202, -0.5642549, 1, 1, 1, 1, 1,
-0.1992009, -0.8876817, -3.086268, 1, 1, 1, 1, 1,
-0.1970229, 0.309002, -0.5762691, 1, 1, 1, 1, 1,
-0.1925636, 0.05962715, -1.078284, 1, 1, 1, 1, 1,
-0.18454, 1.087766, -0.1988469, 1, 1, 1, 1, 1,
-0.1840843, 0.3093526, -0.2242242, 1, 1, 1, 1, 1,
-0.1836474, 0.1169112, -1.454172, 1, 1, 1, 1, 1,
-0.1829033, -0.7660031, -1.454438, 1, 1, 1, 1, 1,
-0.1699486, 1.148156, -0.576918, 1, 1, 1, 1, 1,
-0.1678546, 0.5623006, -0.3521846, 1, 1, 1, 1, 1,
-0.1676725, -0.2847986, -0.6031362, 1, 1, 1, 1, 1,
-0.1676502, 0.4779894, -0.09382411, 1, 1, 1, 1, 1,
-0.164759, -1.323361, -3.366366, 1, 1, 1, 1, 1,
-0.1620187, -0.3345141, -2.559677, 1, 1, 1, 1, 1,
-0.1588314, 1.555918, -0.2019318, 0, 0, 1, 1, 1,
-0.1572604, 0.08816905, -0.6265525, 1, 0, 0, 1, 1,
-0.1526501, -2.520758, -4.510567, 1, 0, 0, 1, 1,
-0.1513413, 1.345219, -0.01258063, 1, 0, 0, 1, 1,
-0.1464488, 1.134802, -0.5374181, 1, 0, 0, 1, 1,
-0.1451854, -0.9452296, -1.492036, 1, 0, 0, 1, 1,
-0.1401004, -0.5543343, -2.640144, 0, 0, 0, 1, 1,
-0.1370557, 0.9278662, -1.999319, 0, 0, 0, 1, 1,
-0.1360584, 0.5125973, -2.816644, 0, 0, 0, 1, 1,
-0.132696, -0.6006318, -4.152187, 0, 0, 0, 1, 1,
-0.1285718, 0.5777717, -3.509137, 0, 0, 0, 1, 1,
-0.1266268, -1.184627, -3.587632, 0, 0, 0, 1, 1,
-0.1264511, 0.2938179, -0.253862, 0, 0, 0, 1, 1,
-0.126295, -0.1285186, -2.333419, 1, 1, 1, 1, 1,
-0.1261533, 1.13925, -0.619735, 1, 1, 1, 1, 1,
-0.1255392, -0.6021976, -2.704037, 1, 1, 1, 1, 1,
-0.1253316, -0.434285, -2.875565, 1, 1, 1, 1, 1,
-0.1250801, 0.4947264, 1.299783, 1, 1, 1, 1, 1,
-0.1233493, 0.8532501, 0.7785592, 1, 1, 1, 1, 1,
-0.1204924, 0.6444021, -0.4558341, 1, 1, 1, 1, 1,
-0.1192151, -0.1735407, -2.124427, 1, 1, 1, 1, 1,
-0.1149342, -1.061036, -5.18535, 1, 1, 1, 1, 1,
-0.1146994, 1.236886, 1.670999, 1, 1, 1, 1, 1,
-0.1114281, 1.376728, 0.2172245, 1, 1, 1, 1, 1,
-0.1098511, -0.2800008, -2.155708, 1, 1, 1, 1, 1,
-0.1078328, 0.634452, -0.7353204, 1, 1, 1, 1, 1,
-0.1027155, 0.2657681, -2.024749, 1, 1, 1, 1, 1,
-0.1026222, -0.3324668, -2.744713, 1, 1, 1, 1, 1,
-0.09120107, -0.62229, -2.698712, 0, 0, 1, 1, 1,
-0.08952007, 0.1112802, -1.256623, 1, 0, 0, 1, 1,
-0.08891819, -1.112906, -3.413042, 1, 0, 0, 1, 1,
-0.0852204, -0.0893018, -2.199517, 1, 0, 0, 1, 1,
-0.08217664, 1.135678, 1.088779, 1, 0, 0, 1, 1,
-0.0805998, 1.611629, -0.08334183, 1, 0, 0, 1, 1,
-0.07945465, 0.06591339, -0.8228455, 0, 0, 0, 1, 1,
-0.0764913, 1.531407, 0.4477048, 0, 0, 0, 1, 1,
-0.07336098, -2.037209, -1.715369, 0, 0, 0, 1, 1,
-0.07228942, 0.2530668, -0.6377103, 0, 0, 0, 1, 1,
-0.07047914, 0.2757809, -0.04891511, 0, 0, 0, 1, 1,
-0.0676465, -0.4981455, -2.470147, 0, 0, 0, 1, 1,
-0.0601638, 0.7205835, -1.19908, 0, 0, 0, 1, 1,
-0.05682021, -0.8102413, -2.887514, 1, 1, 1, 1, 1,
-0.05327491, 0.5122235, -1.696205, 1, 1, 1, 1, 1,
-0.04925147, -0.5277184, -2.634069, 1, 1, 1, 1, 1,
-0.04491409, 1.077354, -1.02737, 1, 1, 1, 1, 1,
-0.04348517, 1.574968, 0.4217618, 1, 1, 1, 1, 1,
-0.04339579, 0.2886753, 0.004701979, 1, 1, 1, 1, 1,
-0.04106715, -0.1025888, -3.071691, 1, 1, 1, 1, 1,
-0.03858425, 0.913502, -0.4434963, 1, 1, 1, 1, 1,
-0.03840601, 0.5702433, -0.6258314, 1, 1, 1, 1, 1,
-0.03738388, 0.4860193, -0.07742503, 1, 1, 1, 1, 1,
-0.0372896, 2.166479, -0.6907468, 1, 1, 1, 1, 1,
-0.03551785, 0.1870036, -0.1344097, 1, 1, 1, 1, 1,
-0.03523915, -1.070633, -4.795899, 1, 1, 1, 1, 1,
-0.03373779, -0.8510653, -4.008378, 1, 1, 1, 1, 1,
-0.033042, 0.1303915, -0.7419033, 1, 1, 1, 1, 1,
-0.0315461, -0.9676853, -4.84411, 0, 0, 1, 1, 1,
-0.03108538, -0.07566711, -3.326151, 1, 0, 0, 1, 1,
-0.03047679, -1.828156, -3.957219, 1, 0, 0, 1, 1,
-0.02689511, -0.1320004, -2.457792, 1, 0, 0, 1, 1,
-0.02374667, -1.153525, -2.933624, 1, 0, 0, 1, 1,
-0.0205335, -2.114546, -5.081517, 1, 0, 0, 1, 1,
-0.01517571, -0.6966507, -3.716373, 0, 0, 0, 1, 1,
-0.01505758, 0.298179, 1.033931, 0, 0, 0, 1, 1,
-0.01478883, 0.4394775, -1.224115, 0, 0, 0, 1, 1,
-0.007776797, -0.9253441, -1.843985, 0, 0, 0, 1, 1,
-0.006048538, 1.032091, 0.07608349, 0, 0, 0, 1, 1,
-0.005955924, -0.1113276, -1.786897, 0, 0, 0, 1, 1,
-0.005307002, 0.323857, 1.366498, 0, 0, 0, 1, 1,
-0.004288493, 1.201441, -0.792604, 1, 1, 1, 1, 1,
-0.003274386, -1.445219, -2.945637, 1, 1, 1, 1, 1,
-0.001541572, -0.5099019, -2.743209, 1, 1, 1, 1, 1,
0.00407353, 0.2443154, -0.493827, 1, 1, 1, 1, 1,
0.0172039, -1.298894, 1.701598, 1, 1, 1, 1, 1,
0.01930696, -0.5817481, 3.998404, 1, 1, 1, 1, 1,
0.02421225, -0.5981029, 2.533908, 1, 1, 1, 1, 1,
0.02712231, 0.07566363, 0.8356618, 1, 1, 1, 1, 1,
0.02748368, 0.5655724, 1.155744, 1, 1, 1, 1, 1,
0.03008529, -1.344894, 3.019, 1, 1, 1, 1, 1,
0.03701857, -0.2309617, 4.481896, 1, 1, 1, 1, 1,
0.03814057, 0.01476096, -0.6810105, 1, 1, 1, 1, 1,
0.04166442, 1.272776, 0.1876817, 1, 1, 1, 1, 1,
0.04600064, -1.545334, 3.766662, 1, 1, 1, 1, 1,
0.04669325, 3.092032, 1.405509, 1, 1, 1, 1, 1,
0.04693772, -0.09716634, 1.027375, 0, 0, 1, 1, 1,
0.04790863, 1.493689, -0.0549887, 1, 0, 0, 1, 1,
0.04974269, 0.1476949, 0.06591918, 1, 0, 0, 1, 1,
0.05198654, 0.1621735, 1.364278, 1, 0, 0, 1, 1,
0.05478551, -0.863654, 1.661503, 1, 0, 0, 1, 1,
0.05622898, -1.020517, 1.231349, 1, 0, 0, 1, 1,
0.0608068, 0.2154227, -0.2561657, 0, 0, 0, 1, 1,
0.06333993, 0.8671773, -0.226864, 0, 0, 0, 1, 1,
0.06474275, -0.4786884, 3.133919, 0, 0, 0, 1, 1,
0.07190874, 0.09297117, -0.9834222, 0, 0, 0, 1, 1,
0.07951932, -0.8610358, 1.955706, 0, 0, 0, 1, 1,
0.07954247, -1.598402, 2.023103, 0, 0, 0, 1, 1,
0.0851007, 0.4021189, 0.08988581, 0, 0, 0, 1, 1,
0.08711676, -1.055666, 3.578272, 1, 1, 1, 1, 1,
0.0883914, 0.9990806, 2.364318, 1, 1, 1, 1, 1,
0.0906845, -0.8202323, 2.279012, 1, 1, 1, 1, 1,
0.09566596, -0.1432246, 4.029047, 1, 1, 1, 1, 1,
0.09766012, -0.01424834, 1.470201, 1, 1, 1, 1, 1,
0.09913356, -1.110193, 4.775639, 1, 1, 1, 1, 1,
0.1005716, -0.9325509, 1.530156, 1, 1, 1, 1, 1,
0.1006536, -0.03633719, 1.57479, 1, 1, 1, 1, 1,
0.101109, -0.1937914, 2.140288, 1, 1, 1, 1, 1,
0.1015765, 0.9430749, 0.08035905, 1, 1, 1, 1, 1,
0.1023595, 0.1335797, 0.6126623, 1, 1, 1, 1, 1,
0.1024085, 0.2552138, 0.5406172, 1, 1, 1, 1, 1,
0.1045283, 3.275836, 0.5146968, 1, 1, 1, 1, 1,
0.1046448, -0.04255948, 3.548799, 1, 1, 1, 1, 1,
0.1057255, 1.262553, 0.7510546, 1, 1, 1, 1, 1,
0.1064045, -0.4752414, 3.153751, 0, 0, 1, 1, 1,
0.1078983, 0.9177719, 0.5662494, 1, 0, 0, 1, 1,
0.1115981, -0.2167638, 3.495254, 1, 0, 0, 1, 1,
0.112376, -0.2542106, 2.572355, 1, 0, 0, 1, 1,
0.1164729, 0.7883342, -1.614811, 1, 0, 0, 1, 1,
0.1165138, 0.007241461, 2.674672, 1, 0, 0, 1, 1,
0.1182727, 0.1407197, -2.636366, 0, 0, 0, 1, 1,
0.1189949, -1.09895, 3.332317, 0, 0, 0, 1, 1,
0.1242453, -0.3262985, 3.980116, 0, 0, 0, 1, 1,
0.128194, 1.135631, -0.02914278, 0, 0, 0, 1, 1,
0.1287013, 0.72758, -0.9857354, 0, 0, 0, 1, 1,
0.1349581, 0.8867871, 0.6965075, 0, 0, 0, 1, 1,
0.1354184, -0.2920582, 3.688028, 0, 0, 0, 1, 1,
0.1395683, -0.9971085, 3.787945, 1, 1, 1, 1, 1,
0.1446061, -0.4385592, 2.189018, 1, 1, 1, 1, 1,
0.1460105, 1.157686, 0.9184529, 1, 1, 1, 1, 1,
0.1511096, 0.9670232, -1.173533, 1, 1, 1, 1, 1,
0.1539245, 0.4834349, 0.1461346, 1, 1, 1, 1, 1,
0.1541355, -0.5539452, 3.164886, 1, 1, 1, 1, 1,
0.1584038, -0.4664885, 1.825251, 1, 1, 1, 1, 1,
0.1616504, 0.5149891, 1.824614, 1, 1, 1, 1, 1,
0.1622596, -2.458423, 4.051901, 1, 1, 1, 1, 1,
0.1636594, -1.060445, 3.49343, 1, 1, 1, 1, 1,
0.1686192, 0.1146385, 0.7577556, 1, 1, 1, 1, 1,
0.1699228, 0.7139709, 1.648562, 1, 1, 1, 1, 1,
0.1723689, -0.3526546, 2.73952, 1, 1, 1, 1, 1,
0.1735219, -0.1095714, 1.303118, 1, 1, 1, 1, 1,
0.1744997, -0.7719907, 3.616973, 1, 1, 1, 1, 1,
0.1761518, -3.154991, 2.624694, 0, 0, 1, 1, 1,
0.1773001, 2.248928, 1.075487, 1, 0, 0, 1, 1,
0.1773472, 1.487327, 2.278497, 1, 0, 0, 1, 1,
0.1783727, -0.4216123, 1.527637, 1, 0, 0, 1, 1,
0.1815115, 1.428221, 1.189409, 1, 0, 0, 1, 1,
0.1868123, 0.7857937, 0.5832509, 1, 0, 0, 1, 1,
0.1878739, -1.365844, 2.898063, 0, 0, 0, 1, 1,
0.1884763, -1.035179, 2.097985, 0, 0, 0, 1, 1,
0.1931534, -0.4210581, 3.213732, 0, 0, 0, 1, 1,
0.1956995, 0.2730435, 0.2468929, 0, 0, 0, 1, 1,
0.1993363, 1.780238, -1.268796, 0, 0, 0, 1, 1,
0.2041729, 1.053704, 0.5880336, 0, 0, 0, 1, 1,
0.2046057, -0.8040193, 0.9343113, 0, 0, 0, 1, 1,
0.2109521, -1.401048, 3.851213, 1, 1, 1, 1, 1,
0.2112941, 0.3989579, 0.8680899, 1, 1, 1, 1, 1,
0.2152992, 0.6386261, 0.6904197, 1, 1, 1, 1, 1,
0.216118, -0.6922004, 2.372696, 1, 1, 1, 1, 1,
0.2165897, -0.1335051, 3.851187, 1, 1, 1, 1, 1,
0.2197646, -0.1105637, 2.646556, 1, 1, 1, 1, 1,
0.2267576, -0.6638659, 1.924394, 1, 1, 1, 1, 1,
0.2328399, -0.9800372, 1.471199, 1, 1, 1, 1, 1,
0.2334692, -0.6832463, 2.033834, 1, 1, 1, 1, 1,
0.2342656, 1.229502, 0.5166294, 1, 1, 1, 1, 1,
0.2367469, -0.222584, 2.091949, 1, 1, 1, 1, 1,
0.2433462, -1.446079, 2.229419, 1, 1, 1, 1, 1,
0.2468936, -0.3822589, 4.278755, 1, 1, 1, 1, 1,
0.2490821, -0.4798653, 2.470898, 1, 1, 1, 1, 1,
0.2500824, -0.5581741, 2.358844, 1, 1, 1, 1, 1,
0.2542344, 0.3538655, 0.3175625, 0, 0, 1, 1, 1,
0.2584009, 0.5615671, 0.3859876, 1, 0, 0, 1, 1,
0.2589742, -2.729312, 2.760252, 1, 0, 0, 1, 1,
0.2612184, -0.6744029, 1.560354, 1, 0, 0, 1, 1,
0.2629586, -0.3516873, 1.483161, 1, 0, 0, 1, 1,
0.2634818, -1.746843, 2.725936, 1, 0, 0, 1, 1,
0.2642063, 0.1700047, 1.85807, 0, 0, 0, 1, 1,
0.2661839, 1.123098, -0.3635985, 0, 0, 0, 1, 1,
0.2704805, -0.03330042, 1.367166, 0, 0, 0, 1, 1,
0.2712538, 0.2604823, 0.5153373, 0, 0, 0, 1, 1,
0.2791367, -0.2321785, 2.952769, 0, 0, 0, 1, 1,
0.2792921, -0.9348686, 1.370923, 0, 0, 0, 1, 1,
0.2801681, 0.2896291, 1.131688, 0, 0, 0, 1, 1,
0.2842356, 1.235463, 0.7268757, 1, 1, 1, 1, 1,
0.2846591, -0.3239843, 1.863401, 1, 1, 1, 1, 1,
0.2881159, 3.01253, 0.6438498, 1, 1, 1, 1, 1,
0.2885818, 0.02371913, 2.192132, 1, 1, 1, 1, 1,
0.288919, -1.305993, 1.944112, 1, 1, 1, 1, 1,
0.2898434, 0.3943309, 0.1299559, 1, 1, 1, 1, 1,
0.2912264, 0.8703533, -0.4740795, 1, 1, 1, 1, 1,
0.2915442, -0.05870165, 1.269761, 1, 1, 1, 1, 1,
0.2976295, 1.312239, 1.495191, 1, 1, 1, 1, 1,
0.2993025, -0.6429009, 3.15905, 1, 1, 1, 1, 1,
0.3001182, -1.291916, 3.712604, 1, 1, 1, 1, 1,
0.3031394, 0.1487908, 0.6145225, 1, 1, 1, 1, 1,
0.3109408, -1.265351, 2.610348, 1, 1, 1, 1, 1,
0.315784, -0.3808753, 4.55939, 1, 1, 1, 1, 1,
0.31597, -2.461583, 2.296547, 1, 1, 1, 1, 1,
0.3170195, -1.472851, 3.210795, 0, 0, 1, 1, 1,
0.3220883, 0.3943929, 0.7723819, 1, 0, 0, 1, 1,
0.3263149, 1.131467, 1.365706, 1, 0, 0, 1, 1,
0.3339042, -0.2160809, 2.140926, 1, 0, 0, 1, 1,
0.3355751, -1.006138, 2.315497, 1, 0, 0, 1, 1,
0.337215, 1.478465, 0.1673198, 1, 0, 0, 1, 1,
0.3379477, -2.540187, 2.561212, 0, 0, 0, 1, 1,
0.3385559, -0.1857444, 1.365222, 0, 0, 0, 1, 1,
0.3390058, 1.634742, -0.5082191, 0, 0, 0, 1, 1,
0.3392914, -0.8042103, 3.105114, 0, 0, 0, 1, 1,
0.3415976, 1.290011, 0.3412888, 0, 0, 0, 1, 1,
0.3474243, -0.677565, 0.2297081, 0, 0, 0, 1, 1,
0.3477326, -0.807335, 4.198215, 0, 0, 0, 1, 1,
0.3493754, -1.482205, 3.293566, 1, 1, 1, 1, 1,
0.3554313, -0.7898577, 0.52785, 1, 1, 1, 1, 1,
0.3569792, 1.507212, 0.1734703, 1, 1, 1, 1, 1,
0.3579084, -1.716591, 1.864399, 1, 1, 1, 1, 1,
0.3589256, 1.582171, 0.8518713, 1, 1, 1, 1, 1,
0.3589841, -0.8716334, 3.310341, 1, 1, 1, 1, 1,
0.3626952, 1.076324, -0.4450957, 1, 1, 1, 1, 1,
0.3626984, -2.148241, 3.120755, 1, 1, 1, 1, 1,
0.3666599, 0.7271402, 1.366341, 1, 1, 1, 1, 1,
0.3685883, -1.562184, 1.511262, 1, 1, 1, 1, 1,
0.3729117, -2.244253, 3.266768, 1, 1, 1, 1, 1,
0.3764364, 1.529835, -1.185442, 1, 1, 1, 1, 1,
0.3765677, -0.07996836, 0.08131042, 1, 1, 1, 1, 1,
0.3770819, -1.184041, 2.996843, 1, 1, 1, 1, 1,
0.3825796, 1.65671, 0.3543324, 1, 1, 1, 1, 1,
0.3832775, -1.201721, 3.762352, 0, 0, 1, 1, 1,
0.3845069, 1.058067, 1.35654, 1, 0, 0, 1, 1,
0.3946534, -0.02793743, 2.07058, 1, 0, 0, 1, 1,
0.4021376, 0.498916, 0.4106958, 1, 0, 0, 1, 1,
0.4030702, -0.3857117, 2.731637, 1, 0, 0, 1, 1,
0.4076858, -0.4796661, 3.419777, 1, 0, 0, 1, 1,
0.4102226, -1.102232, 3.112013, 0, 0, 0, 1, 1,
0.4176422, -0.3390938, 2.617826, 0, 0, 0, 1, 1,
0.418743, 0.8072212, 2.092506, 0, 0, 0, 1, 1,
0.425999, 1.537125, -0.886419, 0, 0, 0, 1, 1,
0.430045, -0.5458133, 3.059599, 0, 0, 0, 1, 1,
0.4308689, 0.6027082, -0.5975181, 0, 0, 0, 1, 1,
0.4311362, 0.1982236, 1.025873, 0, 0, 0, 1, 1,
0.435084, -0.1336312, 3.68595, 1, 1, 1, 1, 1,
0.4359239, -0.5378392, 3.395951, 1, 1, 1, 1, 1,
0.4415021, -0.0903366, 2.832803, 1, 1, 1, 1, 1,
0.4422002, 0.1990295, 1.842807, 1, 1, 1, 1, 1,
0.4456781, -0.2840114, 2.182723, 1, 1, 1, 1, 1,
0.4503931, 0.8181447, -0.2098161, 1, 1, 1, 1, 1,
0.4515415, 2.663945, -1.472326, 1, 1, 1, 1, 1,
0.4582756, -0.04633309, 1.227867, 1, 1, 1, 1, 1,
0.459738, -0.2359995, 2.596356, 1, 1, 1, 1, 1,
0.4640983, -0.7210577, 1.700207, 1, 1, 1, 1, 1,
0.4667753, -0.4106773, 1.974693, 1, 1, 1, 1, 1,
0.4704675, 0.1341043, 1.520803, 1, 1, 1, 1, 1,
0.4717415, -0.4276382, 1.857952, 1, 1, 1, 1, 1,
0.4727168, -0.6082212, 1.573044, 1, 1, 1, 1, 1,
0.4778331, 0.8854609, 1.187565, 1, 1, 1, 1, 1,
0.4804434, -0.009094626, 2.275081, 0, 0, 1, 1, 1,
0.4814589, 0.4906589, 1.444092, 1, 0, 0, 1, 1,
0.4869068, 0.8057426, 0.678368, 1, 0, 0, 1, 1,
0.4871571, -0.8810343, 3.908343, 1, 0, 0, 1, 1,
0.4874597, -0.3749582, -0.009058225, 1, 0, 0, 1, 1,
0.4888912, -1.688869, 3.426653, 1, 0, 0, 1, 1,
0.4889583, -0.06248339, 1.015945, 0, 0, 0, 1, 1,
0.4920048, 0.6006151, 1.046293, 0, 0, 0, 1, 1,
0.494745, 0.8748237, 0.6401058, 0, 0, 0, 1, 1,
0.4961881, 1.382071, -0.1593201, 0, 0, 0, 1, 1,
0.499608, 0.6621607, -1.411857, 0, 0, 0, 1, 1,
0.5167539, -0.9923858, 3.749995, 0, 0, 0, 1, 1,
0.5186841, -0.6327924, 2.638705, 0, 0, 0, 1, 1,
0.5205402, -1.460722, 1.709385, 1, 1, 1, 1, 1,
0.521579, -0.7945824, 2.694288, 1, 1, 1, 1, 1,
0.5247017, 0.8788223, -1.81892, 1, 1, 1, 1, 1,
0.5281795, -0.643753, 1.462271, 1, 1, 1, 1, 1,
0.5290475, -0.3934496, 0.6249374, 1, 1, 1, 1, 1,
0.5299044, -1.202678, 1.453129, 1, 1, 1, 1, 1,
0.5311366, -1.135363, 2.644194, 1, 1, 1, 1, 1,
0.5311693, -0.6115136, 2.924155, 1, 1, 1, 1, 1,
0.5339286, 0.0394459, 2.678038, 1, 1, 1, 1, 1,
0.5375946, -0.5474989, 3.692608, 1, 1, 1, 1, 1,
0.5385577, 1.217613, 0.5955427, 1, 1, 1, 1, 1,
0.5402973, 1.320783, -2.220273, 1, 1, 1, 1, 1,
0.5440082, -0.2378865, 1.903576, 1, 1, 1, 1, 1,
0.544925, 0.3887726, 1.344025, 1, 1, 1, 1, 1,
0.545378, 0.03033158, 1.432338, 1, 1, 1, 1, 1,
0.5480961, 0.8819336, 1.648176, 0, 0, 1, 1, 1,
0.550845, -0.3791295, 2.292031, 1, 0, 0, 1, 1,
0.5511923, -0.5048165, 3.183323, 1, 0, 0, 1, 1,
0.5560033, -0.8038219, 2.766053, 1, 0, 0, 1, 1,
0.5564546, 0.932304, 1.305716, 1, 0, 0, 1, 1,
0.5576423, 0.06331538, -0.3304915, 1, 0, 0, 1, 1,
0.5603947, 0.2484289, 0.5958753, 0, 0, 0, 1, 1,
0.5619676, 0.7321475, -0.5658663, 0, 0, 0, 1, 1,
0.5709376, -0.3687788, 1.729681, 0, 0, 0, 1, 1,
0.5734732, 0.2454563, -0.2359852, 0, 0, 0, 1, 1,
0.5743726, -1.128603, 2.076241, 0, 0, 0, 1, 1,
0.579938, -0.8763248, 1.775462, 0, 0, 0, 1, 1,
0.5812744, 0.5280667, 0.4424298, 0, 0, 0, 1, 1,
0.5820614, -0.03670495, 1.970983, 1, 1, 1, 1, 1,
0.583257, 0.8856934, 2.043574, 1, 1, 1, 1, 1,
0.5872266, -1.323267, 4.917131, 1, 1, 1, 1, 1,
0.5890306, 0.3218477, 0.3665102, 1, 1, 1, 1, 1,
0.5895336, -1.040922, 1.909951, 1, 1, 1, 1, 1,
0.5921365, 1.449242, -0.2988516, 1, 1, 1, 1, 1,
0.5952137, 0.175543, 1.376485, 1, 1, 1, 1, 1,
0.6015608, -1.368826, 3.453389, 1, 1, 1, 1, 1,
0.6031644, -0.2786767, 1.094998, 1, 1, 1, 1, 1,
0.6072708, -1.181629, 1.623468, 1, 1, 1, 1, 1,
0.6109302, -1.40305, 2.936833, 1, 1, 1, 1, 1,
0.6133726, -0.6291993, 1.545925, 1, 1, 1, 1, 1,
0.6149945, 0.02272325, 3.334633, 1, 1, 1, 1, 1,
0.6178582, -0.8487203, 2.550425, 1, 1, 1, 1, 1,
0.6184324, 1.300858, -0.4841408, 1, 1, 1, 1, 1,
0.6229444, 1.43612, 0.9595249, 0, 0, 1, 1, 1,
0.6242485, 0.2714836, 0.9490922, 1, 0, 0, 1, 1,
0.6249666, 0.2690763, 3.934106, 1, 0, 0, 1, 1,
0.6257885, -0.1498373, 2.418068, 1, 0, 0, 1, 1,
0.6286208, -0.9716367, 0.3660347, 1, 0, 0, 1, 1,
0.6333032, 0.8209198, -0.5835794, 1, 0, 0, 1, 1,
0.6372764, 0.4951332, 0.8682239, 0, 0, 0, 1, 1,
0.6383338, 1.469574, 0.9055111, 0, 0, 0, 1, 1,
0.6405423, -0.2332145, -0.6153334, 0, 0, 0, 1, 1,
0.6445289, -0.5732124, 1.954393, 0, 0, 0, 1, 1,
0.6457385, 1.17193, -0.1195609, 0, 0, 0, 1, 1,
0.6479508, -0.378646, 0.9074432, 0, 0, 0, 1, 1,
0.6536201, 0.5660719, 0.5580183, 0, 0, 0, 1, 1,
0.6553266, -0.901986, 2.911936, 1, 1, 1, 1, 1,
0.6556574, 0.4559849, 1.791878, 1, 1, 1, 1, 1,
0.6566545, 0.2190942, 2.150637, 1, 1, 1, 1, 1,
0.6592091, -1.031842, 2.967978, 1, 1, 1, 1, 1,
0.6671669, -2.57918, 3.960424, 1, 1, 1, 1, 1,
0.671513, 1.127344, -0.8594572, 1, 1, 1, 1, 1,
0.6724278, -0.01834362, 2.249918, 1, 1, 1, 1, 1,
0.6736943, -0.5391601, 1.823066, 1, 1, 1, 1, 1,
0.6740675, -0.7627144, 2.355733, 1, 1, 1, 1, 1,
0.683993, -0.4289831, 2.584492, 1, 1, 1, 1, 1,
0.6876693, -1.364434, 2.894403, 1, 1, 1, 1, 1,
0.6882808, -0.2168813, 2.383755, 1, 1, 1, 1, 1,
0.6911417, -1.554949, 0.7681309, 1, 1, 1, 1, 1,
0.6943992, 1.424751, 0.1837116, 1, 1, 1, 1, 1,
0.7028473, -0.03697035, 1.529409, 1, 1, 1, 1, 1,
0.7032224, -0.1871064, 1.903561, 0, 0, 1, 1, 1,
0.7055504, 0.8507157, 2.692759, 1, 0, 0, 1, 1,
0.7071747, -1.046153, 2.455321, 1, 0, 0, 1, 1,
0.7077047, 2.30741, -0.3180969, 1, 0, 0, 1, 1,
0.7212976, 0.09870959, -0.4094576, 1, 0, 0, 1, 1,
0.7223353, -1.381169, 2.57745, 1, 0, 0, 1, 1,
0.7224646, -0.3399516, 1.886301, 0, 0, 0, 1, 1,
0.7252561, 0.2368622, 0.7621541, 0, 0, 0, 1, 1,
0.7269555, 0.5214625, -0.0733215, 0, 0, 0, 1, 1,
0.7328722, -0.6954747, 3.301545, 0, 0, 0, 1, 1,
0.73361, 0.6306148, -1.005655, 0, 0, 0, 1, 1,
0.736748, 1.471884, 1.323202, 0, 0, 0, 1, 1,
0.7497534, 0.7710798, 0.9579029, 0, 0, 0, 1, 1,
0.750265, -0.208131, 2.515057, 1, 1, 1, 1, 1,
0.7537013, 0.543489, 0.5880976, 1, 1, 1, 1, 1,
0.7569419, -1.533531, 2.048448, 1, 1, 1, 1, 1,
0.7588263, -1.038767, 2.102129, 1, 1, 1, 1, 1,
0.7646325, -1.301601, 1.434648, 1, 1, 1, 1, 1,
0.7664896, 0.1859758, 1.112405, 1, 1, 1, 1, 1,
0.7734762, 2.64335, -0.3006775, 1, 1, 1, 1, 1,
0.7736351, 0.6249215, 0.4346826, 1, 1, 1, 1, 1,
0.782593, 0.3078921, 1.960984, 1, 1, 1, 1, 1,
0.7938599, -1.112964, 2.387192, 1, 1, 1, 1, 1,
0.7945295, -0.3842627, 2.024829, 1, 1, 1, 1, 1,
0.8091364, -0.03965913, -0.6810293, 1, 1, 1, 1, 1,
0.8136574, -0.3780534, 2.298025, 1, 1, 1, 1, 1,
0.8153598, -0.9460554, 4.486598, 1, 1, 1, 1, 1,
0.8159624, -0.211006, 0.3992488, 1, 1, 1, 1, 1,
0.8212467, 0.9694526, 0.21519, 0, 0, 1, 1, 1,
0.8324838, -1.651435, 2.982914, 1, 0, 0, 1, 1,
0.8363567, 1.827549, 0.1397649, 1, 0, 0, 1, 1,
0.8391677, 2.927384, -1.830235, 1, 0, 0, 1, 1,
0.842568, -0.3186982, 2.087925, 1, 0, 0, 1, 1,
0.8429233, 0.6614874, 0.5067217, 1, 0, 0, 1, 1,
0.8455975, 0.0334501, 1.422676, 0, 0, 0, 1, 1,
0.85194, -0.3469424, 2.985337, 0, 0, 0, 1, 1,
0.8541636, -0.7066493, 2.693422, 0, 0, 0, 1, 1,
0.8550127, -0.3401605, 3.178539, 0, 0, 0, 1, 1,
0.8562428, -0.4096869, 2.006933, 0, 0, 0, 1, 1,
0.8705924, 1.38813, 2.130948, 0, 0, 0, 1, 1,
0.8706847, -0.3603564, 3.27973, 0, 0, 0, 1, 1,
0.8750057, 0.6249747, 2.121449, 1, 1, 1, 1, 1,
0.8774151, -0.690203, 0.6928318, 1, 1, 1, 1, 1,
0.881232, 0.7966119, 0.4937426, 1, 1, 1, 1, 1,
0.8832694, -0.7596928, 1.508602, 1, 1, 1, 1, 1,
0.8953259, -1.667579, 2.516819, 1, 1, 1, 1, 1,
0.895758, 1.439428, -0.006012578, 1, 1, 1, 1, 1,
0.9055133, 0.2635622, 1.400691, 1, 1, 1, 1, 1,
0.9109922, -2.432183, 2.957884, 1, 1, 1, 1, 1,
0.9130305, 0.4178276, 3.207017, 1, 1, 1, 1, 1,
0.9155601, -1.106887, 2.506011, 1, 1, 1, 1, 1,
0.9169849, 0.7912672, 0.3767788, 1, 1, 1, 1, 1,
0.9172716, -0.1274699, 2.674837, 1, 1, 1, 1, 1,
0.9243672, -0.3042774, 3.437946, 1, 1, 1, 1, 1,
0.9287467, 0.1575823, 0.9515426, 1, 1, 1, 1, 1,
0.9292224, -1.179688, 1.36391, 1, 1, 1, 1, 1,
0.9335936, 1.407146, 1.009871, 0, 0, 1, 1, 1,
0.9401912, 1.28771, -0.2463859, 1, 0, 0, 1, 1,
0.9428141, 1.752455, -0.3147679, 1, 0, 0, 1, 1,
0.9449819, -0.9092664, 1.310296, 1, 0, 0, 1, 1,
0.9452223, 0.07718232, 3.057159, 1, 0, 0, 1, 1,
0.9518194, -0.02823717, 1.99656, 1, 0, 0, 1, 1,
0.9596896, -0.3128689, 1.598873, 0, 0, 0, 1, 1,
0.9598158, 0.3531276, -1.072197, 0, 0, 0, 1, 1,
0.9622034, -0.04834214, 2.525548, 0, 0, 0, 1, 1,
0.9636959, 0.6921778, -0.1334615, 0, 0, 0, 1, 1,
0.9637783, 2.77243, 0.2052232, 0, 0, 0, 1, 1,
0.9717088, 0.3824452, 0.9931648, 0, 0, 0, 1, 1,
0.9732731, -0.9228106, 2.56341, 0, 0, 0, 1, 1,
0.9766843, -1.035098, 2.179693, 1, 1, 1, 1, 1,
0.9823515, -0.4119155, 1.522704, 1, 1, 1, 1, 1,
0.9870037, 0.005443479, 0.5261412, 1, 1, 1, 1, 1,
0.9881027, -0.3666296, 2.52787, 1, 1, 1, 1, 1,
0.994222, 0.4013523, -2.067595, 1, 1, 1, 1, 1,
0.994612, -0.1504823, 0.4360049, 1, 1, 1, 1, 1,
0.9950602, -0.9330934, 3.473889, 1, 1, 1, 1, 1,
0.9996799, -0.2842389, 2.218441, 1, 1, 1, 1, 1,
1.005808, -1.673587, 4.158166, 1, 1, 1, 1, 1,
1.011032, -1.687864, 1.602772, 1, 1, 1, 1, 1,
1.011918, -0.8655881, 2.834642, 1, 1, 1, 1, 1,
1.0142, -0.6416109, 1.176527, 1, 1, 1, 1, 1,
1.014905, -0.5648252, 3.736107, 1, 1, 1, 1, 1,
1.015366, 0.007586573, 2.574301, 1, 1, 1, 1, 1,
1.028149, -0.4742992, 1.892738, 1, 1, 1, 1, 1,
1.029066, 0.4407353, 0.2685487, 0, 0, 1, 1, 1,
1.034817, 0.8034903, 1.637877, 1, 0, 0, 1, 1,
1.03599, -0.6428733, 0.4070457, 1, 0, 0, 1, 1,
1.037989, -0.008759596, 1.248829, 1, 0, 0, 1, 1,
1.03882, -0.02487666, -0.5068593, 1, 0, 0, 1, 1,
1.042195, 0.7541124, 1.18446, 1, 0, 0, 1, 1,
1.045848, 1.169162, -0.6589952, 0, 0, 0, 1, 1,
1.048241, 0.06840554, 1.601297, 0, 0, 0, 1, 1,
1.070941, -1.626208, 2.614222, 0, 0, 0, 1, 1,
1.098804, 0.3628462, 1.118307, 0, 0, 0, 1, 1,
1.105746, 0.5423246, 1.579829, 0, 0, 0, 1, 1,
1.110948, 0.829213, 2.666227, 0, 0, 0, 1, 1,
1.113864, 0.9652888, -0.7569171, 0, 0, 0, 1, 1,
1.114677, -1.465087, 1.749672, 1, 1, 1, 1, 1,
1.122027, -1.959445, 2.011982, 1, 1, 1, 1, 1,
1.122935, -1.158855, 2.344018, 1, 1, 1, 1, 1,
1.124934, -0.7344635, 1.588733, 1, 1, 1, 1, 1,
1.130228, 1.106943, 0.1851464, 1, 1, 1, 1, 1,
1.135899, -2.006022, 2.799719, 1, 1, 1, 1, 1,
1.136551, 0.3734889, 1.624303, 1, 1, 1, 1, 1,
1.136613, -0.3103782, 2.110439, 1, 1, 1, 1, 1,
1.137938, -1.0768, 3.342355, 1, 1, 1, 1, 1,
1.139616, -0.2239287, 1.360376, 1, 1, 1, 1, 1,
1.145219, -0.3238284, 1.763274, 1, 1, 1, 1, 1,
1.148776, 2.406435, 1.198874, 1, 1, 1, 1, 1,
1.151219, 1.205692, 0.200387, 1, 1, 1, 1, 1,
1.154626, -1.184194, 2.108904, 1, 1, 1, 1, 1,
1.165089, 0.113196, 2.021955, 1, 1, 1, 1, 1,
1.167019, 0.8714881, 2.437165, 0, 0, 1, 1, 1,
1.168142, -0.5534543, 2.103363, 1, 0, 0, 1, 1,
1.168378, 1.027732, 0.7548947, 1, 0, 0, 1, 1,
1.174684, -1.371215, 2.449991, 1, 0, 0, 1, 1,
1.17889, -0.7204528, 2.868991, 1, 0, 0, 1, 1,
1.181965, 0.7134987, 2.357896, 1, 0, 0, 1, 1,
1.182332, 0.9745879, -0.2849448, 0, 0, 0, 1, 1,
1.183872, 0.1757174, 1.687118, 0, 0, 0, 1, 1,
1.184107, 1.011488, 1.359988, 0, 0, 0, 1, 1,
1.184703, -0.7098534, 0.9148925, 0, 0, 0, 1, 1,
1.190518, -0.9903705, 3.136596, 0, 0, 0, 1, 1,
1.195245, -0.437172, 1.544389, 0, 0, 0, 1, 1,
1.195423, -1.270401, 3.174644, 0, 0, 0, 1, 1,
1.202666, 1.293539, -0.5308936, 1, 1, 1, 1, 1,
1.204219, -1.100848, 2.775158, 1, 1, 1, 1, 1,
1.211208, -0.3883814, 0.5633388, 1, 1, 1, 1, 1,
1.218714, -1.35688, 1.869187, 1, 1, 1, 1, 1,
1.224758, -2.189758, 1.604323, 1, 1, 1, 1, 1,
1.226746, 1.635664, 0.08105563, 1, 1, 1, 1, 1,
1.237788, -0.7264034, 1.420407, 1, 1, 1, 1, 1,
1.237851, -1.050005, 0.6029328, 1, 1, 1, 1, 1,
1.249794, 1.149319, 1.425577, 1, 1, 1, 1, 1,
1.256238, -0.3018477, -0.6190275, 1, 1, 1, 1, 1,
1.256978, 0.2356197, 0.0333041, 1, 1, 1, 1, 1,
1.260294, 0.3263862, 0.9219365, 1, 1, 1, 1, 1,
1.266442, -0.9358972, 0.6507767, 1, 1, 1, 1, 1,
1.283785, -0.1982472, 1.074711, 1, 1, 1, 1, 1,
1.286009, 0.3307478, 2.499095, 1, 1, 1, 1, 1,
1.287683, -0.2005076, 2.162245, 0, 0, 1, 1, 1,
1.294538, -0.320576, -0.1747543, 1, 0, 0, 1, 1,
1.294541, -0.8777872, 1.109991, 1, 0, 0, 1, 1,
1.297912, 1.247726, 1.354459, 1, 0, 0, 1, 1,
1.303725, -1.089518, 4.209938, 1, 0, 0, 1, 1,
1.305446, 1.082632, 1.425654, 1, 0, 0, 1, 1,
1.308528, -0.6239657, 1.545698, 0, 0, 0, 1, 1,
1.308964, -0.584695, 3.954847, 0, 0, 0, 1, 1,
1.336653, 0.3476261, 2.615776, 0, 0, 0, 1, 1,
1.341919, -0.7772585, -0.359921, 0, 0, 0, 1, 1,
1.345073, 0.9847918, 1.835313, 0, 0, 0, 1, 1,
1.375528, 0.09920812, 1.720449, 0, 0, 0, 1, 1,
1.376816, -0.5030614, 4.666193, 0, 0, 0, 1, 1,
1.38269, -0.299453, 2.367014, 1, 1, 1, 1, 1,
1.392825, -0.2644303, 0.1676806, 1, 1, 1, 1, 1,
1.40098, -0.7998639, 3.873331, 1, 1, 1, 1, 1,
1.402443, 0.7841008, 0.1515563, 1, 1, 1, 1, 1,
1.404175, 2.319478, -0.603122, 1, 1, 1, 1, 1,
1.404502, 0.3296046, 0.2251476, 1, 1, 1, 1, 1,
1.407003, -0.04906896, 2.493057, 1, 1, 1, 1, 1,
1.439765, 0.6433867, 0.7004515, 1, 1, 1, 1, 1,
1.447385, 1.092821, -0.5296251, 1, 1, 1, 1, 1,
1.459323, 0.02427932, 0.9509225, 1, 1, 1, 1, 1,
1.459391, 0.3737749, 3.075785, 1, 1, 1, 1, 1,
1.466133, 0.3829951, 1.46727, 1, 1, 1, 1, 1,
1.473348, -0.9437441, 2.466767, 1, 1, 1, 1, 1,
1.495827, 0.06721213, 0.5489892, 1, 1, 1, 1, 1,
1.504659, -1.564502, 0.8956128, 1, 1, 1, 1, 1,
1.517905, -0.8835188, 0.7400864, 0, 0, 1, 1, 1,
1.532594, -1.104512, 3.881852, 1, 0, 0, 1, 1,
1.537561, 1.063414, 2.124733, 1, 0, 0, 1, 1,
1.541696, -0.4012589, 2.610066, 1, 0, 0, 1, 1,
1.554247, 1.103297, 1.414331, 1, 0, 0, 1, 1,
1.561485, -0.4500771, 1.783362, 1, 0, 0, 1, 1,
1.585201, 0.8301775, 1.264323, 0, 0, 0, 1, 1,
1.604254, 0.6855218, 2.959892, 0, 0, 0, 1, 1,
1.641927, -0.4941438, 1.870742, 0, 0, 0, 1, 1,
1.648695, 2.873928, -0.5249736, 0, 0, 0, 1, 1,
1.65671, -0.1093365, 1.048268, 0, 0, 0, 1, 1,
1.658149, 0.6865057, 0.6632384, 0, 0, 0, 1, 1,
1.680299, -1.534564, 1.783869, 0, 0, 0, 1, 1,
1.680835, -0.5954285, 2.185294, 1, 1, 1, 1, 1,
1.688951, 1.094936, -0.6002279, 1, 1, 1, 1, 1,
1.698648, -0.7347846, 1.925231, 1, 1, 1, 1, 1,
1.729115, -1.558599, 2.759429, 1, 1, 1, 1, 1,
1.785874, 0.518841, 1.881162, 1, 1, 1, 1, 1,
1.789451, 2.037919, -0.4035168, 1, 1, 1, 1, 1,
1.794028, -0.1125883, 0.880301, 1, 1, 1, 1, 1,
1.834787, -1.934664, 1.932586, 1, 1, 1, 1, 1,
1.845254, -0.5751523, 2.557101, 1, 1, 1, 1, 1,
1.889807, -0.820582, 0.6861607, 1, 1, 1, 1, 1,
1.904006, 0.5284861, 1.472416, 1, 1, 1, 1, 1,
1.909961, -0.5699073, 2.540897, 1, 1, 1, 1, 1,
1.91032, 0.4780631, 1.159848, 1, 1, 1, 1, 1,
1.934927, -0.04934266, 1.216711, 1, 1, 1, 1, 1,
1.94859, -0.3739347, 2.632028, 1, 1, 1, 1, 1,
1.957455, 0.9486309, 0.9072968, 0, 0, 1, 1, 1,
1.961847, -0.4095522, 2.685109, 1, 0, 0, 1, 1,
2.004797, 1.906761, 1.058407, 1, 0, 0, 1, 1,
2.040653, -0.2989936, 2.293997, 1, 0, 0, 1, 1,
2.076779, -0.4132235, 0.9601757, 1, 0, 0, 1, 1,
2.077364, -1.2068, 2.888772, 1, 0, 0, 1, 1,
2.080948, -0.4748493, 2.037497, 0, 0, 0, 1, 1,
2.091463, -0.5163587, 1.422702, 0, 0, 0, 1, 1,
2.134212, -1.089606, 1.005901, 0, 0, 0, 1, 1,
2.137621, -0.007758196, 0.3551138, 0, 0, 0, 1, 1,
2.138565, 2.707122, 0.0315271, 0, 0, 0, 1, 1,
2.289389, -1.135738, 2.048106, 0, 0, 0, 1, 1,
2.315923, -0.3846077, 1.237825, 0, 0, 0, 1, 1,
2.360125, -0.9747503, 3.254866, 1, 1, 1, 1, 1,
2.505832, 0.5734693, -0.06082343, 1, 1, 1, 1, 1,
2.533092, 0.37332, 1.275089, 1, 1, 1, 1, 1,
2.613462, -0.169873, 1.266773, 1, 1, 1, 1, 1,
2.880829, 2.186869, 0.3338648, 1, 1, 1, 1, 1,
2.90577, 1.153895, 1.321069, 1, 1, 1, 1, 1,
3.010067, 0.2625909, 1.166884, 1, 1, 1, 1, 1
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
var radius = 9.410508;
var distance = 33.05401;
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
mvMatrix.translate( 0.1860437, -0.06042242, 0.2319407 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.05401);
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
