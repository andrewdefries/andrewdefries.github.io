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
-3.884618, 1.940733, -2.902077, 1, 0, 0, 1,
-3.329194, 0.3703772, -2.197089, 1, 0.007843138, 0, 1,
-3.019211, -1.38445, -1.047088, 1, 0.01176471, 0, 1,
-2.939226, 0.01504137, -4.600961, 1, 0.01960784, 0, 1,
-2.603289, -0.8593022, -2.074105, 1, 0.02352941, 0, 1,
-2.600293, 0.491753, -2.087617, 1, 0.03137255, 0, 1,
-2.581205, -0.9612783, -1.192333, 1, 0.03529412, 0, 1,
-2.550539, 0.2802407, 0.3105661, 1, 0.04313726, 0, 1,
-2.428626, 3.092501, -0.8103328, 1, 0.04705882, 0, 1,
-2.414321, -0.2846993, -1.658676, 1, 0.05490196, 0, 1,
-2.36867, -0.974899, 0.3372948, 1, 0.05882353, 0, 1,
-2.323363, 2.177068, -0.953864, 1, 0.06666667, 0, 1,
-2.307629, -1.633914, -1.732354, 1, 0.07058824, 0, 1,
-2.297343, -1.306837, -2.77686, 1, 0.07843138, 0, 1,
-2.249436, 0.09798017, -1.403989, 1, 0.08235294, 0, 1,
-2.244533, 0.1164007, -0.5123065, 1, 0.09019608, 0, 1,
-2.205084, -0.24261, -1.616614, 1, 0.09411765, 0, 1,
-2.178622, 1.116019, -0.4445482, 1, 0.1019608, 0, 1,
-2.170994, 0.2384714, -1.883422, 1, 0.1098039, 0, 1,
-2.166977, 0.08620328, -1.64826, 1, 0.1137255, 0, 1,
-2.163444, -0.1233881, -1.711386, 1, 0.1215686, 0, 1,
-2.144959, 0.1547566, -2.271788, 1, 0.1254902, 0, 1,
-2.139216, 0.3454352, -2.435796, 1, 0.1333333, 0, 1,
-2.127229, -1.231608, -1.609232, 1, 0.1372549, 0, 1,
-2.086704, 0.1193214, -2.708396, 1, 0.145098, 0, 1,
-2.084478, -2.209827, -0.8306011, 1, 0.1490196, 0, 1,
-2.063969, 0.06489586, -0.03262746, 1, 0.1568628, 0, 1,
-2.063937, 0.4583975, -1.087682, 1, 0.1607843, 0, 1,
-2.05348, -1.943876, -2.568867, 1, 0.1686275, 0, 1,
-2.014431, 0.1153646, 0.7506325, 1, 0.172549, 0, 1,
-2.009619, 2.110405, -1.633062, 1, 0.1803922, 0, 1,
-1.982601, 1.102877, 0.0232389, 1, 0.1843137, 0, 1,
-1.925655, 0.1711015, -2.043977, 1, 0.1921569, 0, 1,
-1.913594, -0.7010869, -0.1897705, 1, 0.1960784, 0, 1,
-1.903198, -1.890267, -1.265834, 1, 0.2039216, 0, 1,
-1.899644, 1.02055, -0.7608873, 1, 0.2117647, 0, 1,
-1.880824, 2.605873, -0.8368479, 1, 0.2156863, 0, 1,
-1.869541, -0.2469487, -0.7192491, 1, 0.2235294, 0, 1,
-1.854991, 0.6369185, -1.125394, 1, 0.227451, 0, 1,
-1.843256, 1.539294, -1.179421, 1, 0.2352941, 0, 1,
-1.841515, 0.2668279, -2.587989, 1, 0.2392157, 0, 1,
-1.828495, 0.4224673, -0.3956575, 1, 0.2470588, 0, 1,
-1.823085, 2.318353, 0.303793, 1, 0.2509804, 0, 1,
-1.821712, 0.02809691, -1.054156, 1, 0.2588235, 0, 1,
-1.813426, 0.03316, -1.141947, 1, 0.2627451, 0, 1,
-1.809279, 0.4165647, -1.518294, 1, 0.2705882, 0, 1,
-1.800521, -0.287131, -1.510227, 1, 0.2745098, 0, 1,
-1.797363, 0.3929316, -3.722715, 1, 0.282353, 0, 1,
-1.763885, -1.674506, -3.66635, 1, 0.2862745, 0, 1,
-1.745067, 0.2978641, -0.8202738, 1, 0.2941177, 0, 1,
-1.735083, 0.5666134, -1.247331, 1, 0.3019608, 0, 1,
-1.725729, -1.849192, -1.898044, 1, 0.3058824, 0, 1,
-1.711449, -0.5155654, -2.396875, 1, 0.3137255, 0, 1,
-1.703505, 0.907419, 0.1023106, 1, 0.3176471, 0, 1,
-1.701099, -0.03442235, 0.501533, 1, 0.3254902, 0, 1,
-1.696357, -0.5230659, 0.03161711, 1, 0.3294118, 0, 1,
-1.693587, -1.141175, -2.390447, 1, 0.3372549, 0, 1,
-1.659111, 0.02570644, -2.818097, 1, 0.3411765, 0, 1,
-1.650702, -1.474582, -2.452905, 1, 0.3490196, 0, 1,
-1.640943, -0.9419098, -1.924731, 1, 0.3529412, 0, 1,
-1.638228, 0.7409477, -0.6665046, 1, 0.3607843, 0, 1,
-1.621717, 0.0361805, -1.970532, 1, 0.3647059, 0, 1,
-1.619374, 0.8300339, -0.8404458, 1, 0.372549, 0, 1,
-1.616658, 0.3671572, -2.876364, 1, 0.3764706, 0, 1,
-1.612478, 0.3203403, -2.830304, 1, 0.3843137, 0, 1,
-1.594225, -1.597434, -2.845841, 1, 0.3882353, 0, 1,
-1.587018, 1.954859, -1.304981, 1, 0.3960784, 0, 1,
-1.586187, 1.182399, -1.057245, 1, 0.4039216, 0, 1,
-1.581021, -1.284934, -2.195532, 1, 0.4078431, 0, 1,
-1.573854, 0.5193049, -2.957339, 1, 0.4156863, 0, 1,
-1.568721, 0.05866878, -0.2997738, 1, 0.4196078, 0, 1,
-1.563734, 1.21084, -1.744251, 1, 0.427451, 0, 1,
-1.562173, -0.06527537, 0.01736652, 1, 0.4313726, 0, 1,
-1.560995, -1.205689, -3.445793, 1, 0.4392157, 0, 1,
-1.542368, 1.083566, -1.504577, 1, 0.4431373, 0, 1,
-1.532389, 0.2470749, 0.9062508, 1, 0.4509804, 0, 1,
-1.527857, -0.9684141, -2.768787, 1, 0.454902, 0, 1,
-1.498974, 0.008839106, -0.4482138, 1, 0.4627451, 0, 1,
-1.498315, 0.509295, -1.318522, 1, 0.4666667, 0, 1,
-1.489021, -1.294591, -0.5459532, 1, 0.4745098, 0, 1,
-1.468605, 0.4364394, -1.657531, 1, 0.4784314, 0, 1,
-1.465192, 0.3567565, -3.824975, 1, 0.4862745, 0, 1,
-1.446503, -0.3556634, -1.939238, 1, 0.4901961, 0, 1,
-1.44285, 1.187526, -1.323109, 1, 0.4980392, 0, 1,
-1.439874, 0.1684401, -1.414797, 1, 0.5058824, 0, 1,
-1.437227, -0.3776255, -1.010093, 1, 0.509804, 0, 1,
-1.433918, -0.2319672, -1.505846, 1, 0.5176471, 0, 1,
-1.430664, 0.4807474, -1.897375, 1, 0.5215687, 0, 1,
-1.420307, -0.5947507, -2.136545, 1, 0.5294118, 0, 1,
-1.406093, -1.68897, -1.920066, 1, 0.5333334, 0, 1,
-1.381534, 0.1908849, -0.3145044, 1, 0.5411765, 0, 1,
-1.37673, -1.200598, -2.944168, 1, 0.5450981, 0, 1,
-1.3549, 0.723541, -0.5000347, 1, 0.5529412, 0, 1,
-1.354641, 1.770831, -0.7461721, 1, 0.5568628, 0, 1,
-1.351259, -1.545453, -1.233298, 1, 0.5647059, 0, 1,
-1.350467, 0.05172012, 0.03078257, 1, 0.5686275, 0, 1,
-1.34834, 0.675532, -1.420328, 1, 0.5764706, 0, 1,
-1.345541, 1.668703, -1.068981, 1, 0.5803922, 0, 1,
-1.336604, 0.2951879, -2.283152, 1, 0.5882353, 0, 1,
-1.323523, -0.02940693, -2.024591, 1, 0.5921569, 0, 1,
-1.306636, 0.8797603, -0.3712764, 1, 0.6, 0, 1,
-1.303374, 0.6444474, 1.016013, 1, 0.6078432, 0, 1,
-1.297586, 0.1468562, -1.276744, 1, 0.6117647, 0, 1,
-1.292055, 1.210338, -1.96179, 1, 0.6196079, 0, 1,
-1.290462, 1.701529, -0.257321, 1, 0.6235294, 0, 1,
-1.284841, -0.092425, -0.538121, 1, 0.6313726, 0, 1,
-1.283406, -0.3105074, -1.224516, 1, 0.6352941, 0, 1,
-1.265343, -0.8487717, -4.879063, 1, 0.6431373, 0, 1,
-1.260335, -0.9034629, -2.523626, 1, 0.6470588, 0, 1,
-1.260225, -2.054893, -2.014904, 1, 0.654902, 0, 1,
-1.259583, 0.7812448, -0.1190102, 1, 0.6588235, 0, 1,
-1.255902, 0.07066353, -1.33203, 1, 0.6666667, 0, 1,
-1.246113, -1.505269, -2.822422, 1, 0.6705883, 0, 1,
-1.231355, -1.955337, -2.204245, 1, 0.6784314, 0, 1,
-1.227928, -0.4730445, -1.913842, 1, 0.682353, 0, 1,
-1.216162, 0.275583, -2.163936, 1, 0.6901961, 0, 1,
-1.210788, 0.3393648, -1.328698, 1, 0.6941177, 0, 1,
-1.210595, -0.7263964, -2.24458, 1, 0.7019608, 0, 1,
-1.194168, 0.7510146, -0.8775072, 1, 0.7098039, 0, 1,
-1.193331, 1.526511, -0.9166712, 1, 0.7137255, 0, 1,
-1.188143, 0.7613589, -2.274632, 1, 0.7215686, 0, 1,
-1.184217, -0.07884352, -1.072098, 1, 0.7254902, 0, 1,
-1.183773, 0.2273825, -0.6121706, 1, 0.7333333, 0, 1,
-1.181481, -0.7697741, -1.029307, 1, 0.7372549, 0, 1,
-1.179626, -1.125729, -3.203537, 1, 0.7450981, 0, 1,
-1.178807, 1.523903, -1.111735, 1, 0.7490196, 0, 1,
-1.176318, -0.886324, -2.580763, 1, 0.7568628, 0, 1,
-1.176216, -2.061746, -2.62219, 1, 0.7607843, 0, 1,
-1.174501, -1.68755, -3.607864, 1, 0.7686275, 0, 1,
-1.173823, -0.2269804, -2.07194, 1, 0.772549, 0, 1,
-1.172536, -1.340848, -2.853449, 1, 0.7803922, 0, 1,
-1.158945, -1.316633, -1.412558, 1, 0.7843137, 0, 1,
-1.158098, -0.4453188, -1.417852, 1, 0.7921569, 0, 1,
-1.1443, -1.43751, -2.205746, 1, 0.7960784, 0, 1,
-1.142534, -0.242577, -3.39061, 1, 0.8039216, 0, 1,
-1.142224, -0.497715, -1.147763, 1, 0.8117647, 0, 1,
-1.13903, 1.240943, -0.2953452, 1, 0.8156863, 0, 1,
-1.128265, -1.411351, -3.594062, 1, 0.8235294, 0, 1,
-1.12384, -0.120023, -0.5896866, 1, 0.827451, 0, 1,
-1.116781, 0.03718528, -1.153695, 1, 0.8352941, 0, 1,
-1.115258, -0.3465475, -1.11545, 1, 0.8392157, 0, 1,
-1.113909, -1.103525, -2.734174, 1, 0.8470588, 0, 1,
-1.109732, 0.2294006, -1.458967, 1, 0.8509804, 0, 1,
-1.108657, 1.155905, -1.543969, 1, 0.8588235, 0, 1,
-1.105689, -0.0852077, -1.664439, 1, 0.8627451, 0, 1,
-1.105635, -0.7576778, -2.414304, 1, 0.8705882, 0, 1,
-1.102997, -0.5149588, -2.881554, 1, 0.8745098, 0, 1,
-1.102309, -1.258601, -2.708843, 1, 0.8823529, 0, 1,
-1.092822, 0.3054299, 0.3092431, 1, 0.8862745, 0, 1,
-1.092499, 0.384697, -2.22465, 1, 0.8941177, 0, 1,
-1.090057, -0.5228384, -2.905077, 1, 0.8980392, 0, 1,
-1.088875, -0.6696389, -2.277525, 1, 0.9058824, 0, 1,
-1.087094, 0.8129974, 0.03707269, 1, 0.9137255, 0, 1,
-1.07945, 1.317312, 0.5299203, 1, 0.9176471, 0, 1,
-1.076622, 0.2804841, 0.3950748, 1, 0.9254902, 0, 1,
-1.075805, 0.3409811, -1.930055, 1, 0.9294118, 0, 1,
-1.053448, 0.6240032, -3.063435, 1, 0.9372549, 0, 1,
-1.050697, -1.635419, -3.120566, 1, 0.9411765, 0, 1,
-1.049453, -0.4278146, -1.506971, 1, 0.9490196, 0, 1,
-1.041162, -0.5286097, -2.690204, 1, 0.9529412, 0, 1,
-1.037686, 1.236138, 0.5068686, 1, 0.9607843, 0, 1,
-1.037227, 0.7616491, -1.716001, 1, 0.9647059, 0, 1,
-1.029598, -0.5658141, -2.396128, 1, 0.972549, 0, 1,
-1.024806, -0.9543734, -3.523055, 1, 0.9764706, 0, 1,
-1.024297, 0.7351928, -2.023055, 1, 0.9843137, 0, 1,
-1.010502, -2.566273, -2.010997, 1, 0.9882353, 0, 1,
-1.007516, 0.4372019, -1.88635, 1, 0.9960784, 0, 1,
-1.007016, 2.049648, 0.9317319, 0.9960784, 1, 0, 1,
-0.993383, -0.8524309, -3.702571, 0.9921569, 1, 0, 1,
-0.9919376, -0.9672813, -0.5317059, 0.9843137, 1, 0, 1,
-0.9912366, 0.1417159, -1.509091, 0.9803922, 1, 0, 1,
-0.9874555, -0.7754577, -2.07147, 0.972549, 1, 0, 1,
-0.9869419, 0.3144338, -1.426228, 0.9686275, 1, 0, 1,
-0.9787869, -0.07442491, -1.602711, 0.9607843, 1, 0, 1,
-0.9772153, 0.09829719, -0.329649, 0.9568627, 1, 0, 1,
-0.9747949, 0.5228046, -0.2829002, 0.9490196, 1, 0, 1,
-0.9731975, 0.409693, -0.5613205, 0.945098, 1, 0, 1,
-0.9704977, 0.004277365, -3.19932, 0.9372549, 1, 0, 1,
-0.9675518, -1.350543, -1.923917, 0.9333333, 1, 0, 1,
-0.9661855, -1.89812, -3.730896, 0.9254902, 1, 0, 1,
-0.9582835, 1.57202, -0.0979981, 0.9215686, 1, 0, 1,
-0.9539607, 0.3965767, 0.3363374, 0.9137255, 1, 0, 1,
-0.951295, -0.8052489, -0.1792656, 0.9098039, 1, 0, 1,
-0.950034, 0.9898285, -0.4923196, 0.9019608, 1, 0, 1,
-0.9343679, -1.143564, -1.972962, 0.8941177, 1, 0, 1,
-0.9331868, -0.7743419, -1.766098, 0.8901961, 1, 0, 1,
-0.9274549, 0.4837692, -2.009876, 0.8823529, 1, 0, 1,
-0.91859, 0.90589, -0.2701842, 0.8784314, 1, 0, 1,
-0.9149184, -0.02968344, -0.6044173, 0.8705882, 1, 0, 1,
-0.9041826, -0.03796297, 0.5111998, 0.8666667, 1, 0, 1,
-0.9035938, -0.3614595, -1.257749, 0.8588235, 1, 0, 1,
-0.8958454, -1.754697, -2.130187, 0.854902, 1, 0, 1,
-0.8951483, -1.1182, -3.056315, 0.8470588, 1, 0, 1,
-0.8878266, -0.06408305, -1.055093, 0.8431373, 1, 0, 1,
-0.8829593, 0.2492984, -0.8341489, 0.8352941, 1, 0, 1,
-0.8823856, 0.7085857, -1.822907, 0.8313726, 1, 0, 1,
-0.881937, -1.787727, -2.77764, 0.8235294, 1, 0, 1,
-0.879907, -1.338968, -0.9664664, 0.8196079, 1, 0, 1,
-0.8795557, -0.360217, -2.345621, 0.8117647, 1, 0, 1,
-0.8793144, -1.621914, -4.203399, 0.8078431, 1, 0, 1,
-0.8583868, -0.0895924, -1.709398, 0.8, 1, 0, 1,
-0.8529679, -0.8638774, -3.30609, 0.7921569, 1, 0, 1,
-0.8520693, -0.544451, -1.706021, 0.7882353, 1, 0, 1,
-0.8428315, -1.630618, -3.018569, 0.7803922, 1, 0, 1,
-0.8420584, 0.3389927, -0.2498006, 0.7764706, 1, 0, 1,
-0.8396949, 1.886088, 0.3755164, 0.7686275, 1, 0, 1,
-0.8372908, 1.193562, -0.42889, 0.7647059, 1, 0, 1,
-0.8360013, 0.8487068, -1.548524, 0.7568628, 1, 0, 1,
-0.8354408, 2.817866, 0.5997103, 0.7529412, 1, 0, 1,
-0.8336213, -1.033194, -3.78716, 0.7450981, 1, 0, 1,
-0.8319236, -0.7137454, -2.625978, 0.7411765, 1, 0, 1,
-0.8291566, 1.67537, 1.173008, 0.7333333, 1, 0, 1,
-0.8267251, 0.9645114, -2.113798, 0.7294118, 1, 0, 1,
-0.8176547, -0.4095, -1.533301, 0.7215686, 1, 0, 1,
-0.814531, 0.2503697, -0.2259963, 0.7176471, 1, 0, 1,
-0.8140934, 1.568005, 2.100416, 0.7098039, 1, 0, 1,
-0.8104377, -0.8135579, -2.374711, 0.7058824, 1, 0, 1,
-0.8065494, 0.3959, -2.037092, 0.6980392, 1, 0, 1,
-0.8018814, -0.06797874, -1.794413, 0.6901961, 1, 0, 1,
-0.7948227, -1.352488, -1.915599, 0.6862745, 1, 0, 1,
-0.7929795, -1.213591, -1.604102, 0.6784314, 1, 0, 1,
-0.791587, 0.8041758, -0.1423595, 0.6745098, 1, 0, 1,
-0.7876444, 1.272244, -1.959055, 0.6666667, 1, 0, 1,
-0.7803713, 0.4154209, -0.8108314, 0.6627451, 1, 0, 1,
-0.778873, -1.116418, -1.765159, 0.654902, 1, 0, 1,
-0.7771451, -1.093351, 0.3417232, 0.6509804, 1, 0, 1,
-0.7759767, -0.2110212, 0.9782424, 0.6431373, 1, 0, 1,
-0.7754041, -0.2546699, -1.16864, 0.6392157, 1, 0, 1,
-0.7651393, 0.6328005, 0.4139162, 0.6313726, 1, 0, 1,
-0.7637554, 1.713467, -1.676917, 0.627451, 1, 0, 1,
-0.7616956, 0.1792499, -2.557102, 0.6196079, 1, 0, 1,
-0.7603496, -1.125307, -3.811071, 0.6156863, 1, 0, 1,
-0.753029, -0.09113477, -1.873841, 0.6078432, 1, 0, 1,
-0.7529496, -0.519314, -2.525005, 0.6039216, 1, 0, 1,
-0.7518685, 0.3214794, -1.085158, 0.5960785, 1, 0, 1,
-0.7494053, 1.245146, -0.1537584, 0.5882353, 1, 0, 1,
-0.7484732, -1.884836, -0.6541083, 0.5843138, 1, 0, 1,
-0.7470055, -1.306087, -0.7269244, 0.5764706, 1, 0, 1,
-0.7447174, 0.6319131, -0.7372266, 0.572549, 1, 0, 1,
-0.7440429, -0.1366896, 0.56854, 0.5647059, 1, 0, 1,
-0.7319354, 0.5297636, -2.335028, 0.5607843, 1, 0, 1,
-0.7260921, 1.19921, 1.208086, 0.5529412, 1, 0, 1,
-0.714106, -1.391006, -2.508346, 0.5490196, 1, 0, 1,
-0.7108711, 0.2642209, 0.6214008, 0.5411765, 1, 0, 1,
-0.7067932, -1.26823, -2.849708, 0.5372549, 1, 0, 1,
-0.7063098, 0.9780046, -0.4475974, 0.5294118, 1, 0, 1,
-0.7026328, -0.1242848, -1.788719, 0.5254902, 1, 0, 1,
-0.6965623, -0.3198461, -0.3658494, 0.5176471, 1, 0, 1,
-0.6948518, 2.330945, 0.411174, 0.5137255, 1, 0, 1,
-0.6906872, 0.6895303, -1.252653, 0.5058824, 1, 0, 1,
-0.6880057, -1.286487, -3.174598, 0.5019608, 1, 0, 1,
-0.6870714, -0.6819607, -1.415897, 0.4941176, 1, 0, 1,
-0.6832892, 0.5818626, -1.74668, 0.4862745, 1, 0, 1,
-0.6832643, 1.058879, -1.305701, 0.4823529, 1, 0, 1,
-0.6780537, -1.081262, -1.063497, 0.4745098, 1, 0, 1,
-0.6754113, -0.4871435, -3.411913, 0.4705882, 1, 0, 1,
-0.672763, 0.2450705, -2.204536, 0.4627451, 1, 0, 1,
-0.6725793, -1.860004, -2.325918, 0.4588235, 1, 0, 1,
-0.6693754, 1.383975, 0.02462957, 0.4509804, 1, 0, 1,
-0.6674387, 0.1097707, -2.38751, 0.4470588, 1, 0, 1,
-0.6621046, 0.5581691, -1.296381, 0.4392157, 1, 0, 1,
-0.6614919, -2.777166, -3.695528, 0.4352941, 1, 0, 1,
-0.6609894, -0.9361176, -2.822155, 0.427451, 1, 0, 1,
-0.6586983, 0.9375308, -1.736931, 0.4235294, 1, 0, 1,
-0.6576147, -1.055482, -3.576563, 0.4156863, 1, 0, 1,
-0.6544675, 0.519026, -0.7790734, 0.4117647, 1, 0, 1,
-0.652958, -0.1636062, -1.385053, 0.4039216, 1, 0, 1,
-0.6517469, 1.063805, -1.265732, 0.3960784, 1, 0, 1,
-0.6489002, 0.2382639, -1.783428, 0.3921569, 1, 0, 1,
-0.6476272, 0.4887886, -0.4147549, 0.3843137, 1, 0, 1,
-0.6432647, -0.8855611, -4.056419, 0.3803922, 1, 0, 1,
-0.6411827, 0.004949661, -2.266351, 0.372549, 1, 0, 1,
-0.6408455, -0.1970511, -1.648703, 0.3686275, 1, 0, 1,
-0.6407999, 0.7389688, -1.723986, 0.3607843, 1, 0, 1,
-0.6407123, 0.6313103, 0.06945787, 0.3568628, 1, 0, 1,
-0.6404957, 0.4251154, -1.20287, 0.3490196, 1, 0, 1,
-0.6338295, 0.5114959, -0.9043258, 0.345098, 1, 0, 1,
-0.6336678, 0.2910324, -2.333495, 0.3372549, 1, 0, 1,
-0.6250615, 0.520004, -1.78455, 0.3333333, 1, 0, 1,
-0.6246044, 0.1786729, -1.582992, 0.3254902, 1, 0, 1,
-0.6209349, -1.56917, -2.042099, 0.3215686, 1, 0, 1,
-0.6174642, -0.0819101, -3.459106, 0.3137255, 1, 0, 1,
-0.6166577, -2.046797, -1.777221, 0.3098039, 1, 0, 1,
-0.6165167, 0.3700701, -1.784675, 0.3019608, 1, 0, 1,
-0.6160514, -1.119915, -1.248377, 0.2941177, 1, 0, 1,
-0.6158841, 1.576974, 1.559439, 0.2901961, 1, 0, 1,
-0.6128519, 0.3794831, -1.300473, 0.282353, 1, 0, 1,
-0.6105241, -0.6193665, -1.741512, 0.2784314, 1, 0, 1,
-0.6099321, -1.502143, -0.77328, 0.2705882, 1, 0, 1,
-0.6095437, -0.6394496, -1.810175, 0.2666667, 1, 0, 1,
-0.603959, -0.8642639, -3.132077, 0.2588235, 1, 0, 1,
-0.598796, -1.78871, -2.497756, 0.254902, 1, 0, 1,
-0.5972909, -0.6973828, -2.518322, 0.2470588, 1, 0, 1,
-0.5948215, -0.2289723, -3.162535, 0.2431373, 1, 0, 1,
-0.5924146, -0.06453589, -0.241043, 0.2352941, 1, 0, 1,
-0.5875486, 0.9408715, -1.84239, 0.2313726, 1, 0, 1,
-0.5866788, 0.04812971, -1.263795, 0.2235294, 1, 0, 1,
-0.5861835, 0.3321846, 0.8707396, 0.2196078, 1, 0, 1,
-0.5797362, 0.4750283, -1.390417, 0.2117647, 1, 0, 1,
-0.57646, 1.644339, -1.49461, 0.2078431, 1, 0, 1,
-0.5730838, 0.7315387, -0.5169091, 0.2, 1, 0, 1,
-0.5678388, 0.1438267, -1.337788, 0.1921569, 1, 0, 1,
-0.5670325, 1.425057, -0.758706, 0.1882353, 1, 0, 1,
-0.5669047, -0.06489014, -0.8598748, 0.1803922, 1, 0, 1,
-0.5668641, -0.3969062, -0.9471114, 0.1764706, 1, 0, 1,
-0.5617859, -0.1258153, -2.723564, 0.1686275, 1, 0, 1,
-0.5580119, 1.425755, 0.4563899, 0.1647059, 1, 0, 1,
-0.5567374, -2.760072, -2.75762, 0.1568628, 1, 0, 1,
-0.5556427, -0.1150583, -1.608185, 0.1529412, 1, 0, 1,
-0.5537466, 0.4631311, -1.019936, 0.145098, 1, 0, 1,
-0.55099, -1.596573, -4.909505, 0.1411765, 1, 0, 1,
-0.5490211, 0.0929466, -2.864873, 0.1333333, 1, 0, 1,
-0.5471882, -0.2283245, -1.805194, 0.1294118, 1, 0, 1,
-0.5468588, 1.725474, 0.2482205, 0.1215686, 1, 0, 1,
-0.5368497, 0.8967894, 0.06980468, 0.1176471, 1, 0, 1,
-0.5343849, 0.8336923, -1.857641, 0.1098039, 1, 0, 1,
-0.5276889, 1.505996, -0.1790874, 0.1058824, 1, 0, 1,
-0.5268822, 0.7416242, -1.621933, 0.09803922, 1, 0, 1,
-0.518805, -0.003063524, -2.587748, 0.09019608, 1, 0, 1,
-0.5178275, -1.992577, -3.687449, 0.08627451, 1, 0, 1,
-0.5159969, 0.6713392, -1.304415, 0.07843138, 1, 0, 1,
-0.511912, -0.8762156, -2.708482, 0.07450981, 1, 0, 1,
-0.5009905, 1.409632, 0.6472653, 0.06666667, 1, 0, 1,
-0.4987575, -1.435497, -2.65452, 0.0627451, 1, 0, 1,
-0.4935775, -0.7062724, -0.5408388, 0.05490196, 1, 0, 1,
-0.4927308, -0.03937621, -0.1569053, 0.05098039, 1, 0, 1,
-0.4888242, -0.6737783, -3.358902, 0.04313726, 1, 0, 1,
-0.4829996, -0.77003, -2.370348, 0.03921569, 1, 0, 1,
-0.4822266, -0.5357458, -2.85007, 0.03137255, 1, 0, 1,
-0.4817809, 0.8288748, -2.798868, 0.02745098, 1, 0, 1,
-0.4758899, -0.6155563, -3.350218, 0.01960784, 1, 0, 1,
-0.4758118, -0.1437178, -0.6666787, 0.01568628, 1, 0, 1,
-0.4743102, 2.299415, 0.7220665, 0.007843138, 1, 0, 1,
-0.4669565, -2.350734, -4.119743, 0.003921569, 1, 0, 1,
-0.4640691, -0.4355227, -2.632417, 0, 1, 0.003921569, 1,
-0.4628734, 1.33478, 0.8443757, 0, 1, 0.01176471, 1,
-0.4628406, 1.24964, 0.2968812, 0, 1, 0.01568628, 1,
-0.45649, 0.4093921, 0.3078856, 0, 1, 0.02352941, 1,
-0.4554685, -3.135477, -1.84909, 0, 1, 0.02745098, 1,
-0.4553513, -0.3095117, -3.616277, 0, 1, 0.03529412, 1,
-0.4543314, -1.819042, -4.428577, 0, 1, 0.03921569, 1,
-0.4542811, 0.6034111, 0.07326193, 0, 1, 0.04705882, 1,
-0.4500986, 1.533277, -1.896954, 0, 1, 0.05098039, 1,
-0.4490301, 0.1509944, -1.307217, 0, 1, 0.05882353, 1,
-0.4488835, -1.393048, -2.613482, 0, 1, 0.0627451, 1,
-0.4436445, 0.6019024, 0.8785492, 0, 1, 0.07058824, 1,
-0.4328288, -1.339745, -2.765347, 0, 1, 0.07450981, 1,
-0.4301079, -0.05243175, -1.725459, 0, 1, 0.08235294, 1,
-0.4275937, -0.003399732, -2.44536, 0, 1, 0.08627451, 1,
-0.425613, 0.5612338, -2.014168, 0, 1, 0.09411765, 1,
-0.4250607, 0.5304437, 1.943471, 0, 1, 0.1019608, 1,
-0.4199351, 0.4717527, -1.470316, 0, 1, 0.1058824, 1,
-0.4181204, -0.1669013, -2.488214, 0, 1, 0.1137255, 1,
-0.40582, -1.301269, -2.483151, 0, 1, 0.1176471, 1,
-0.4031274, -2.057313, -2.88461, 0, 1, 0.1254902, 1,
-0.40162, 0.6933257, 1.190974, 0, 1, 0.1294118, 1,
-0.3971192, 0.4222852, -0.8003645, 0, 1, 0.1372549, 1,
-0.3934473, -2.029884, -3.513146, 0, 1, 0.1411765, 1,
-0.3926905, 0.5568845, -0.0147457, 0, 1, 0.1490196, 1,
-0.389084, -0.03705433, -2.815814, 0, 1, 0.1529412, 1,
-0.3881258, 0.8944517, -0.4068314, 0, 1, 0.1607843, 1,
-0.3847515, -0.2984685, -1.163769, 0, 1, 0.1647059, 1,
-0.3845976, 0.3612871, -1.042839, 0, 1, 0.172549, 1,
-0.3842396, -1.426925, -3.452375, 0, 1, 0.1764706, 1,
-0.3814633, 1.787093, -1.398001, 0, 1, 0.1843137, 1,
-0.3753289, 0.6118717, 0.06685553, 0, 1, 0.1882353, 1,
-0.373974, 2.222232, 1.53779, 0, 1, 0.1960784, 1,
-0.3712226, -0.09647796, -0.8626112, 0, 1, 0.2039216, 1,
-0.3693788, -1.865034, -3.874066, 0, 1, 0.2078431, 1,
-0.3692963, -0.9315085, -2.559179, 0, 1, 0.2156863, 1,
-0.3631017, -0.205248, -2.574223, 0, 1, 0.2196078, 1,
-0.3539299, -0.4847781, -1.181745, 0, 1, 0.227451, 1,
-0.3526991, 1.42893, 0.08764429, 0, 1, 0.2313726, 1,
-0.3518513, 0.142451, -1.262232, 0, 1, 0.2392157, 1,
-0.3485934, 1.404972, 1.399274, 0, 1, 0.2431373, 1,
-0.3458349, -0.08659369, -1.672029, 0, 1, 0.2509804, 1,
-0.3395028, 0.1309596, 1.046741, 0, 1, 0.254902, 1,
-0.3361324, -0.7871957, -5.28407, 0, 1, 0.2627451, 1,
-0.33269, 0.3779228, -0.7441047, 0, 1, 0.2666667, 1,
-0.3256654, -0.1992932, -2.88153, 0, 1, 0.2745098, 1,
-0.3253313, -1.057475, -2.496959, 0, 1, 0.2784314, 1,
-0.3248059, -0.2186127, -2.957628, 0, 1, 0.2862745, 1,
-0.3216173, -1.455576, -2.779262, 0, 1, 0.2901961, 1,
-0.3197361, 0.5101992, -2.435551, 0, 1, 0.2980392, 1,
-0.3141949, 1.148784, 1.330934, 0, 1, 0.3058824, 1,
-0.3065928, 0.4744121, -0.4662732, 0, 1, 0.3098039, 1,
-0.3050381, -0.9350501, -2.074883, 0, 1, 0.3176471, 1,
-0.3023927, 0.5251882, -1.340695, 0, 1, 0.3215686, 1,
-0.2987328, -0.3033182, -1.393086, 0, 1, 0.3294118, 1,
-0.2905392, 1.353212, -0.5362977, 0, 1, 0.3333333, 1,
-0.2806615, 0.6117538, 1.766102, 0, 1, 0.3411765, 1,
-0.2774889, 1.521327, -0.2483571, 0, 1, 0.345098, 1,
-0.2736467, 0.2802362, -0.7839671, 0, 1, 0.3529412, 1,
-0.27239, 0.03637657, -0.4505914, 0, 1, 0.3568628, 1,
-0.2707663, 1.073306, -2.033681, 0, 1, 0.3647059, 1,
-0.2700621, -0.1021412, -1.80256, 0, 1, 0.3686275, 1,
-0.2653477, 0.7924873, -0.8326579, 0, 1, 0.3764706, 1,
-0.2645355, 0.7440385, -0.8946687, 0, 1, 0.3803922, 1,
-0.2629974, -0.3915477, -1.064136, 0, 1, 0.3882353, 1,
-0.2609962, 0.7047334, -0.46665, 0, 1, 0.3921569, 1,
-0.2606381, -0.6565803, -2.429022, 0, 1, 0.4, 1,
-0.2603181, -1.355696, -1.723363, 0, 1, 0.4078431, 1,
-0.2596843, -1.383618, -3.442035, 0, 1, 0.4117647, 1,
-0.2424319, -0.1433983, -2.970692, 0, 1, 0.4196078, 1,
-0.2394454, -0.2206837, -1.292527, 0, 1, 0.4235294, 1,
-0.2370086, 1.274317, -1.03155, 0, 1, 0.4313726, 1,
-0.2318587, 0.7920667, -0.4930117, 0, 1, 0.4352941, 1,
-0.228076, -0.08214203, -3.029816, 0, 1, 0.4431373, 1,
-0.2270641, -0.3457678, -1.997089, 0, 1, 0.4470588, 1,
-0.2248542, -0.3502489, -3.211119, 0, 1, 0.454902, 1,
-0.2197923, 1.580639, -0.0708429, 0, 1, 0.4588235, 1,
-0.2197299, -0.6554594, -3.195772, 0, 1, 0.4666667, 1,
-0.2196301, -0.1761528, -2.040946, 0, 1, 0.4705882, 1,
-0.2186198, 0.9921699, -0.5451376, 0, 1, 0.4784314, 1,
-0.2107915, -0.6613325, -3.279121, 0, 1, 0.4823529, 1,
-0.209591, -1.573394, -1.608107, 0, 1, 0.4901961, 1,
-0.2086588, 0.2201437, -0.7066045, 0, 1, 0.4941176, 1,
-0.2043495, -1.10435, -1.570736, 0, 1, 0.5019608, 1,
-0.2036685, -1.425698, -2.930706, 0, 1, 0.509804, 1,
-0.2012184, -0.2094753, -1.512586, 0, 1, 0.5137255, 1,
-0.1988395, -2.329858, -2.079966, 0, 1, 0.5215687, 1,
-0.1927494, 0.1401071, -0.9544681, 0, 1, 0.5254902, 1,
-0.1920896, 0.1236529, 0.4178223, 0, 1, 0.5333334, 1,
-0.1912872, 0.8813069, -1.052031, 0, 1, 0.5372549, 1,
-0.184282, -0.4564257, -3.672487, 0, 1, 0.5450981, 1,
-0.1839244, -0.7053868, -3.491628, 0, 1, 0.5490196, 1,
-0.1831139, 0.2795717, 0.1774335, 0, 1, 0.5568628, 1,
-0.1802016, -1.068097, -3.955026, 0, 1, 0.5607843, 1,
-0.1794566, -0.4926972, -2.22846, 0, 1, 0.5686275, 1,
-0.178401, -1.720462, -3.284167, 0, 1, 0.572549, 1,
-0.1743958, 0.4993776, -0.5738258, 0, 1, 0.5803922, 1,
-0.1721856, 0.07478526, -2.486093, 0, 1, 0.5843138, 1,
-0.1715892, -0.02020988, -1.855725, 0, 1, 0.5921569, 1,
-0.1672458, -0.4667253, -3.014008, 0, 1, 0.5960785, 1,
-0.1660971, -2.752144, -2.313024, 0, 1, 0.6039216, 1,
-0.1655041, 0.9452661, 1.309845, 0, 1, 0.6117647, 1,
-0.1651739, 0.4526206, 0.5549533, 0, 1, 0.6156863, 1,
-0.1611571, -0.2717876, -3.000499, 0, 1, 0.6235294, 1,
-0.1569674, -0.2260426, -1.622401, 0, 1, 0.627451, 1,
-0.1540836, 0.6839574, -0.831417, 0, 1, 0.6352941, 1,
-0.1536332, 0.7366667, -0.2003341, 0, 1, 0.6392157, 1,
-0.1469628, 1.064936, -0.6566823, 0, 1, 0.6470588, 1,
-0.1448372, -0.6793926, -3.920011, 0, 1, 0.6509804, 1,
-0.1447016, 1.00338, -1.060527, 0, 1, 0.6588235, 1,
-0.143727, -0.4559842, -3.151298, 0, 1, 0.6627451, 1,
-0.1425535, 0.4728399, -1.166089, 0, 1, 0.6705883, 1,
-0.1380298, 0.8423766, -0.9752024, 0, 1, 0.6745098, 1,
-0.1345965, 0.1258217, -1.484074, 0, 1, 0.682353, 1,
-0.1331027, 0.4826971, -0.2186643, 0, 1, 0.6862745, 1,
-0.1319601, -2.027749, -3.063969, 0, 1, 0.6941177, 1,
-0.1299697, 1.722771, -0.2174704, 0, 1, 0.7019608, 1,
-0.1288716, 1.285965, -0.3287594, 0, 1, 0.7058824, 1,
-0.1246525, -0.1596701, -2.598318, 0, 1, 0.7137255, 1,
-0.1237336, 0.8224086, -0.5314126, 0, 1, 0.7176471, 1,
-0.1236319, 0.1718143, -0.8521933, 0, 1, 0.7254902, 1,
-0.1184809, -1.131268, -4.076864, 0, 1, 0.7294118, 1,
-0.1158579, 0.05675887, 1.379307, 0, 1, 0.7372549, 1,
-0.1109573, 0.3363886, 1.114051, 0, 1, 0.7411765, 1,
-0.1098858, 0.0551495, -0.7298391, 0, 1, 0.7490196, 1,
-0.1082832, -0.6724856, -4.565213, 0, 1, 0.7529412, 1,
-0.1080008, -0.01394871, -1.181163, 0, 1, 0.7607843, 1,
-0.1040924, -0.3180289, -4.80804, 0, 1, 0.7647059, 1,
-0.1037383, 0.4122987, -0.540605, 0, 1, 0.772549, 1,
-0.09977607, 1.207429, 1.205878, 0, 1, 0.7764706, 1,
-0.0932532, -0.2383306, -2.603103, 0, 1, 0.7843137, 1,
-0.09000185, 1.0404, 1.44483, 0, 1, 0.7882353, 1,
-0.08663768, 1.965998, -0.2213482, 0, 1, 0.7960784, 1,
-0.08488347, 0.6069404, 0.03673743, 0, 1, 0.8039216, 1,
-0.08449648, 0.2021073, -0.7597827, 0, 1, 0.8078431, 1,
-0.07880399, -1.98193, -2.822612, 0, 1, 0.8156863, 1,
-0.07769699, -2.440857, -4.310588, 0, 1, 0.8196079, 1,
-0.07215258, 0.9927248, 0.3017498, 0, 1, 0.827451, 1,
-0.06851583, 1.729453, -0.3055595, 0, 1, 0.8313726, 1,
-0.06684857, 2.111383, -1.058954, 0, 1, 0.8392157, 1,
-0.06550378, -0.20802, -3.352312, 0, 1, 0.8431373, 1,
-0.06509537, 0.7385858, -0.03164136, 0, 1, 0.8509804, 1,
-0.06048043, 0.05117128, -0.2519851, 0, 1, 0.854902, 1,
-0.05782937, -0.4795828, -4.076249, 0, 1, 0.8627451, 1,
-0.05161483, -0.290433, -3.469981, 0, 1, 0.8666667, 1,
-0.05133051, 1.137685, -0.00835065, 0, 1, 0.8745098, 1,
-0.05007518, 1.200157, -0.8229619, 0, 1, 0.8784314, 1,
-0.04736904, 0.4046471, -0.7145419, 0, 1, 0.8862745, 1,
-0.04729665, 0.7717947, -0.6295575, 0, 1, 0.8901961, 1,
-0.04433721, 0.9818075, -0.1052632, 0, 1, 0.8980392, 1,
-0.04333374, 0.6084611, 0.5162082, 0, 1, 0.9058824, 1,
-0.04327715, -0.7527815, -3.12481, 0, 1, 0.9098039, 1,
-0.04309371, -0.1525359, -4.257081, 0, 1, 0.9176471, 1,
-0.04027058, 0.4702621, 0.1607558, 0, 1, 0.9215686, 1,
-0.03701477, 0.4013388, 0.7471768, 0, 1, 0.9294118, 1,
-0.03453134, -0.7120127, -3.150466, 0, 1, 0.9333333, 1,
-0.03337809, -0.8206007, -2.66455, 0, 1, 0.9411765, 1,
-0.03013416, 0.7444429, 1.092762, 0, 1, 0.945098, 1,
-0.02873148, 0.232877, 1.697566, 0, 1, 0.9529412, 1,
-0.02179738, 0.2124981, 1.917704, 0, 1, 0.9568627, 1,
-0.01849478, -1.938301, -3.619505, 0, 1, 0.9647059, 1,
-0.01727813, -0.2162741, -4.151403, 0, 1, 0.9686275, 1,
-0.01653089, -2.582941, -3.266602, 0, 1, 0.9764706, 1,
-0.01613395, -0.6796389, -3.889824, 0, 1, 0.9803922, 1,
-0.01605692, -1.040613, -4.428481, 0, 1, 0.9882353, 1,
-0.01539805, 0.3974503, -1.329547, 0, 1, 0.9921569, 1,
-0.01390252, -0.1915988, -2.15419, 0, 1, 1, 1,
-0.01261101, 1.512118, 0.0331042, 0, 0.9921569, 1, 1,
0.001742446, -0.7715939, 3.696789, 0, 0.9882353, 1, 1,
0.008539381, 0.9156922, 2.17298, 0, 0.9803922, 1, 1,
0.0110409, -0.5398991, 3.589352, 0, 0.9764706, 1, 1,
0.01113302, 1.562835, 0.2787554, 0, 0.9686275, 1, 1,
0.01352453, 0.5231057, -1.033618, 0, 0.9647059, 1, 1,
0.01479201, 0.2751614, -0.2818187, 0, 0.9568627, 1, 1,
0.01906524, 0.4388754, -0.6331671, 0, 0.9529412, 1, 1,
0.01980292, -0.6857157, 4.122498, 0, 0.945098, 1, 1,
0.02359077, -0.7796926, 3.491972, 0, 0.9411765, 1, 1,
0.02587768, -1.278183, 3.742477, 0, 0.9333333, 1, 1,
0.02741763, -1.726518, 2.02587, 0, 0.9294118, 1, 1,
0.02750163, -0.3772787, 1.577706, 0, 0.9215686, 1, 1,
0.02897874, -0.5629691, 2.452256, 0, 0.9176471, 1, 1,
0.03183247, -0.7157645, 1.304692, 0, 0.9098039, 1, 1,
0.03262486, -0.428966, 2.555986, 0, 0.9058824, 1, 1,
0.03788943, -1.025861, 1.87584, 0, 0.8980392, 1, 1,
0.04103457, -1.074638, 2.634526, 0, 0.8901961, 1, 1,
0.0463643, 0.9798248, -0.03893775, 0, 0.8862745, 1, 1,
0.05275914, -0.6529228, 3.257797, 0, 0.8784314, 1, 1,
0.05463848, -0.08969979, 1.955253, 0, 0.8745098, 1, 1,
0.06302458, -0.9810272, 2.968319, 0, 0.8666667, 1, 1,
0.0639744, 1.363524, 1.738921, 0, 0.8627451, 1, 1,
0.06420506, 1.178412, 1.454531, 0, 0.854902, 1, 1,
0.06431815, -0.02204086, 1.470368, 0, 0.8509804, 1, 1,
0.06482053, -0.6262125, 2.892614, 0, 0.8431373, 1, 1,
0.06654724, 0.3327736, 0.833997, 0, 0.8392157, 1, 1,
0.06783532, 1.412642, -0.4954743, 0, 0.8313726, 1, 1,
0.06785492, 0.2134396, 1.286173, 0, 0.827451, 1, 1,
0.06836891, 1.339799, 0.5572088, 0, 0.8196079, 1, 1,
0.07479956, -1.840391, 2.64267, 0, 0.8156863, 1, 1,
0.07819523, 1.19307, -1.260863, 0, 0.8078431, 1, 1,
0.08026537, -0.9544249, 3.904624, 0, 0.8039216, 1, 1,
0.08308497, 0.3297161, -0.6133472, 0, 0.7960784, 1, 1,
0.08747736, -1.242922, 4.487169, 0, 0.7882353, 1, 1,
0.1001959, -0.7155215, 3.668695, 0, 0.7843137, 1, 1,
0.1033609, -0.1981304, 0.5745707, 0, 0.7764706, 1, 1,
0.1051855, 1.812112, 2.453941, 0, 0.772549, 1, 1,
0.1080053, -1.061526, 3.974085, 0, 0.7647059, 1, 1,
0.1087069, -0.4746119, 2.465257, 0, 0.7607843, 1, 1,
0.1101936, -1.651824, 3.852381, 0, 0.7529412, 1, 1,
0.1190294, -0.6944817, 3.669696, 0, 0.7490196, 1, 1,
0.1201472, -1.426565, 4.381612, 0, 0.7411765, 1, 1,
0.1241011, 0.7594017, 0.3720044, 0, 0.7372549, 1, 1,
0.1249268, 0.8605714, -0.1787589, 0, 0.7294118, 1, 1,
0.127113, -0.6038333, 3.872705, 0, 0.7254902, 1, 1,
0.1321907, -1.883237, 1.959516, 0, 0.7176471, 1, 1,
0.1337551, -0.4840707, 2.177838, 0, 0.7137255, 1, 1,
0.1387886, -0.1773866, 2.553855, 0, 0.7058824, 1, 1,
0.1411765, 0.7652306, 0.4466823, 0, 0.6980392, 1, 1,
0.1418232, -1.63807, 3.234501, 0, 0.6941177, 1, 1,
0.1424265, 0.855577, -1.244859, 0, 0.6862745, 1, 1,
0.1441026, 1.581628, 0.9360073, 0, 0.682353, 1, 1,
0.1465483, -0.9872272, 4.74676, 0, 0.6745098, 1, 1,
0.1496557, 1.784811, -0.9701757, 0, 0.6705883, 1, 1,
0.1509285, 0.7906582, -1.032229, 0, 0.6627451, 1, 1,
0.1510524, -0.4077558, 3.355838, 0, 0.6588235, 1, 1,
0.1576869, 1.226122, -1.900802, 0, 0.6509804, 1, 1,
0.1695989, -0.223525, 2.627292, 0, 0.6470588, 1, 1,
0.1701738, -0.03089836, 0.5096129, 0, 0.6392157, 1, 1,
0.17041, -0.8422522, 1.54859, 0, 0.6352941, 1, 1,
0.1825902, -0.04619158, 2.821149, 0, 0.627451, 1, 1,
0.183197, -0.3705224, 2.535204, 0, 0.6235294, 1, 1,
0.1832378, 1.015735, 1.896169, 0, 0.6156863, 1, 1,
0.1850899, -0.8992305, 3.943509, 0, 0.6117647, 1, 1,
0.1854855, -2.467921, 3.808061, 0, 0.6039216, 1, 1,
0.185708, 0.01252913, 0.9388418, 0, 0.5960785, 1, 1,
0.1867318, 1.33959, -0.4711549, 0, 0.5921569, 1, 1,
0.1948466, 0.5917474, 0.3947524, 0, 0.5843138, 1, 1,
0.1970366, -2.702336, 2.902138, 0, 0.5803922, 1, 1,
0.1973206, 0.8824779, 1.22718, 0, 0.572549, 1, 1,
0.2023351, -1.630119, 2.757484, 0, 0.5686275, 1, 1,
0.2027679, -0.7176424, 2.208554, 0, 0.5607843, 1, 1,
0.2086927, 0.02972385, 2.982248, 0, 0.5568628, 1, 1,
0.2140228, -0.8491672, 3.073243, 0, 0.5490196, 1, 1,
0.2161174, 1.264606, -0.6920162, 0, 0.5450981, 1, 1,
0.2187766, -0.08774361, 1.02712, 0, 0.5372549, 1, 1,
0.222559, -1.286881, 2.723886, 0, 0.5333334, 1, 1,
0.2304059, -1.882993, 2.359493, 0, 0.5254902, 1, 1,
0.231103, 0.1373033, 1.36936, 0, 0.5215687, 1, 1,
0.2320629, -0.5695971, 3.783995, 0, 0.5137255, 1, 1,
0.2357167, 0.6022887, 0.1314866, 0, 0.509804, 1, 1,
0.2383846, -0.2640975, 3.609024, 0, 0.5019608, 1, 1,
0.2426545, 0.01480627, 1.285371, 0, 0.4941176, 1, 1,
0.2439018, -1.382246, 3.420022, 0, 0.4901961, 1, 1,
0.2501189, -0.0216193, 0.8363326, 0, 0.4823529, 1, 1,
0.2505521, -0.3532355, 4.061368, 0, 0.4784314, 1, 1,
0.2543274, 0.1029764, 3.058904, 0, 0.4705882, 1, 1,
0.2567897, -0.956753, 2.239868, 0, 0.4666667, 1, 1,
0.2568366, 0.1364024, 2.358053, 0, 0.4588235, 1, 1,
0.2574589, 0.7150022, 0.0001143943, 0, 0.454902, 1, 1,
0.2597386, 1.400198, 0.1859607, 0, 0.4470588, 1, 1,
0.2600079, 1.584086, -0.05827937, 0, 0.4431373, 1, 1,
0.2606395, 1.426516, 1.059625, 0, 0.4352941, 1, 1,
0.2631099, 0.52113, 0.6882844, 0, 0.4313726, 1, 1,
0.2636926, 1.889771, 0.07460999, 0, 0.4235294, 1, 1,
0.2641787, 0.06876584, 2.026752, 0, 0.4196078, 1, 1,
0.2736748, -0.6712157, 2.769828, 0, 0.4117647, 1, 1,
0.2799549, 0.42315, 2.62475, 0, 0.4078431, 1, 1,
0.2847273, 0.5233694, 1.986037, 0, 0.4, 1, 1,
0.2910085, 0.6385788, 1.532295, 0, 0.3921569, 1, 1,
0.2917138, -1.98379, 1.516697, 0, 0.3882353, 1, 1,
0.295503, -1.380792, 4.615301, 0, 0.3803922, 1, 1,
0.2985185, -0.5430155, 2.83505, 0, 0.3764706, 1, 1,
0.2988266, -0.3952275, 0.8677971, 0, 0.3686275, 1, 1,
0.3064376, 1.930948, -0.4616497, 0, 0.3647059, 1, 1,
0.3073616, 0.6900374, -0.5674343, 0, 0.3568628, 1, 1,
0.3074026, -2.524758, 3.516442, 0, 0.3529412, 1, 1,
0.3074697, 0.6224484, 1.731069, 0, 0.345098, 1, 1,
0.3079623, 0.908492, 1.092602, 0, 0.3411765, 1, 1,
0.3099186, -0.1237737, 0.7288929, 0, 0.3333333, 1, 1,
0.3112122, -1.990103, 3.798173, 0, 0.3294118, 1, 1,
0.3142397, 1.733113, 0.2746047, 0, 0.3215686, 1, 1,
0.3159485, 0.1027183, 1.672652, 0, 0.3176471, 1, 1,
0.3169787, 0.08364904, 1.149171, 0, 0.3098039, 1, 1,
0.3192829, -1.038121, 4.054605, 0, 0.3058824, 1, 1,
0.3193309, -1.551108, 3.34753, 0, 0.2980392, 1, 1,
0.3205154, 1.33408, 0.5160147, 0, 0.2901961, 1, 1,
0.3278429, 0.08289699, 1.486878, 0, 0.2862745, 1, 1,
0.3311313, -0.5534622, 3.168786, 0, 0.2784314, 1, 1,
0.3317637, 1.152719, 1.428665, 0, 0.2745098, 1, 1,
0.3364094, -0.2166654, 3.733818, 0, 0.2666667, 1, 1,
0.3382994, -0.1107396, 2.350121, 0, 0.2627451, 1, 1,
0.339053, 0.987487, 0.398552, 0, 0.254902, 1, 1,
0.3424996, 0.4818962, 1.02466, 0, 0.2509804, 1, 1,
0.3445864, 1.773859, 0.5004252, 0, 0.2431373, 1, 1,
0.3489339, -1.032185, 2.96324, 0, 0.2392157, 1, 1,
0.3516333, -1.120491, 1.094422, 0, 0.2313726, 1, 1,
0.3541724, 0.9538162, 0.5714195, 0, 0.227451, 1, 1,
0.3608866, -0.4298966, 2.721629, 0, 0.2196078, 1, 1,
0.3693923, -1.615328, 2.361654, 0, 0.2156863, 1, 1,
0.3705668, 0.3001117, 1.186483, 0, 0.2078431, 1, 1,
0.3743854, 0.6300674, -0.3528558, 0, 0.2039216, 1, 1,
0.3766417, -0.2444448, 0.9710942, 0, 0.1960784, 1, 1,
0.3767053, 0.2512359, -0.1964464, 0, 0.1882353, 1, 1,
0.3782126, 0.9416378, 0.6375736, 0, 0.1843137, 1, 1,
0.3811982, -0.1286094, 2.473338, 0, 0.1764706, 1, 1,
0.3812513, -0.7187667, 1.720095, 0, 0.172549, 1, 1,
0.3822372, 0.251475, 1.99985, 0, 0.1647059, 1, 1,
0.3840715, 2.049062, 1.323975, 0, 0.1607843, 1, 1,
0.3911327, -0.2104371, 1.697399, 0, 0.1529412, 1, 1,
0.3945518, 0.6338474, 0.7498415, 0, 0.1490196, 1, 1,
0.3947412, -0.402035, 2.969603, 0, 0.1411765, 1, 1,
0.3952792, -0.1092484, 3.21667, 0, 0.1372549, 1, 1,
0.4016505, -0.3975611, 2.797726, 0, 0.1294118, 1, 1,
0.4057815, -0.8697967, 1.408021, 0, 0.1254902, 1, 1,
0.4063006, 0.4790472, -0.1351587, 0, 0.1176471, 1, 1,
0.4089351, -0.4600131, 1.426795, 0, 0.1137255, 1, 1,
0.4098649, -0.843545, 3.299613, 0, 0.1058824, 1, 1,
0.409937, 2.562526, 0.8825582, 0, 0.09803922, 1, 1,
0.4117338, 0.6045388, 0.9913468, 0, 0.09411765, 1, 1,
0.4168389, 0.2715081, 1.824067, 0, 0.08627451, 1, 1,
0.4215043, 0.008604343, 0.02273373, 0, 0.08235294, 1, 1,
0.4247902, -0.2431421, 1.052085, 0, 0.07450981, 1, 1,
0.4272817, 0.3349529, -1.40644, 0, 0.07058824, 1, 1,
0.4275362, -0.06616381, 2.960938, 0, 0.0627451, 1, 1,
0.4278833, 0.7630014, 0.306324, 0, 0.05882353, 1, 1,
0.4363737, -1.407348, 0.7769667, 0, 0.05098039, 1, 1,
0.4389239, -1.584408, 2.040115, 0, 0.04705882, 1, 1,
0.4429192, 0.8135692, -0.4171856, 0, 0.03921569, 1, 1,
0.4441482, -1.161661, 4.449614, 0, 0.03529412, 1, 1,
0.4561529, 1.582323, -0.01886803, 0, 0.02745098, 1, 1,
0.4601688, 0.968488, 0.8164895, 0, 0.02352941, 1, 1,
0.4609957, 0.8971509, 0.8097692, 0, 0.01568628, 1, 1,
0.4617724, -0.714819, 3.859612, 0, 0.01176471, 1, 1,
0.4629693, 0.1590445, 1.211386, 0, 0.003921569, 1, 1,
0.4637528, -0.5289701, 4.09763, 0.003921569, 0, 1, 1,
0.4645848, -1.325351, 2.092926, 0.007843138, 0, 1, 1,
0.4680327, 1.446112, -0.4558291, 0.01568628, 0, 1, 1,
0.4687704, 1.960137, -0.2302304, 0.01960784, 0, 1, 1,
0.4703582, -0.1744014, 1.507579, 0.02745098, 0, 1, 1,
0.4711108, 0.7578012, -0.7760004, 0.03137255, 0, 1, 1,
0.4782255, 0.4590225, 1.088377, 0.03921569, 0, 1, 1,
0.4822313, -1.918498, 1.615654, 0.04313726, 0, 1, 1,
0.4837895, 0.561876, -0.3127131, 0.05098039, 0, 1, 1,
0.4853662, -0.02787697, 2.49024, 0.05490196, 0, 1, 1,
0.4991874, 0.4182378, -0.4627489, 0.0627451, 0, 1, 1,
0.5010639, -0.5554152, 3.91525, 0.06666667, 0, 1, 1,
0.5018656, -0.6823108, 3.537313, 0.07450981, 0, 1, 1,
0.5055284, 0.9543936, 0.4532045, 0.07843138, 0, 1, 1,
0.5069953, 2.018936, 0.06572498, 0.08627451, 0, 1, 1,
0.5076268, 1.915472, 0.549778, 0.09019608, 0, 1, 1,
0.508954, 2.083112, -0.2690224, 0.09803922, 0, 1, 1,
0.5090024, 0.4334588, -0.8678963, 0.1058824, 0, 1, 1,
0.5138668, 0.301449, 1.519603, 0.1098039, 0, 1, 1,
0.5169114, 0.8557396, -2.232592, 0.1176471, 0, 1, 1,
0.5189715, -0.1880591, 1.383473, 0.1215686, 0, 1, 1,
0.5217225, -2.01427, 4.330877, 0.1294118, 0, 1, 1,
0.5224406, -1.031513, 2.200561, 0.1333333, 0, 1, 1,
0.52368, -0.2961127, 2.347754, 0.1411765, 0, 1, 1,
0.5260332, 0.5844935, 0.5609199, 0.145098, 0, 1, 1,
0.5273143, -1.107449, 3.724083, 0.1529412, 0, 1, 1,
0.5309348, 1.038541, -0.5189084, 0.1568628, 0, 1, 1,
0.5350462, 0.06534413, 1.952447, 0.1647059, 0, 1, 1,
0.5356405, 1.282727, 0.1644526, 0.1686275, 0, 1, 1,
0.5372506, -0.1146095, 2.589947, 0.1764706, 0, 1, 1,
0.5405142, -1.315396, 4.407748, 0.1803922, 0, 1, 1,
0.5428245, -0.9901545, 2.56631, 0.1882353, 0, 1, 1,
0.5459027, -1.237692, 2.227655, 0.1921569, 0, 1, 1,
0.5498912, 0.201818, 2.164973, 0.2, 0, 1, 1,
0.5520718, 1.546218, -1.41665, 0.2078431, 0, 1, 1,
0.5546434, -0.05260432, 4.593941, 0.2117647, 0, 1, 1,
0.5553573, -0.01976232, 1.167014, 0.2196078, 0, 1, 1,
0.5560771, 0.4597623, 0.4442547, 0.2235294, 0, 1, 1,
0.5561586, -0.0115545, 0.3676621, 0.2313726, 0, 1, 1,
0.5614763, -0.9287813, 1.559827, 0.2352941, 0, 1, 1,
0.5640567, -0.109996, 1.939617, 0.2431373, 0, 1, 1,
0.5649741, -1.070839, 2.371114, 0.2470588, 0, 1, 1,
0.5654347, 0.7083281, 1.872235, 0.254902, 0, 1, 1,
0.5673814, 0.7895228, 2.466191, 0.2588235, 0, 1, 1,
0.5698609, -1.091101, 3.714666, 0.2666667, 0, 1, 1,
0.5785404, -1.138738, 2.879618, 0.2705882, 0, 1, 1,
0.5799013, 0.9990523, 0.1914706, 0.2784314, 0, 1, 1,
0.5814779, 0.0679711, 1.08174, 0.282353, 0, 1, 1,
0.5825172, 0.5311096, 1.852474, 0.2901961, 0, 1, 1,
0.5849056, 0.158006, 0.6959636, 0.2941177, 0, 1, 1,
0.5939639, 0.1964818, 2.374393, 0.3019608, 0, 1, 1,
0.5958751, 0.1998679, 0.3457931, 0.3098039, 0, 1, 1,
0.5961229, 0.7548085, 2.220282, 0.3137255, 0, 1, 1,
0.596635, 0.3366439, -0.5728435, 0.3215686, 0, 1, 1,
0.5972696, 0.03043283, 0.9730332, 0.3254902, 0, 1, 1,
0.5975332, -0.07422744, 1.063769, 0.3333333, 0, 1, 1,
0.6014372, -1.329604, 3.260445, 0.3372549, 0, 1, 1,
0.6066627, -0.5952678, 3.133824, 0.345098, 0, 1, 1,
0.6102124, 0.2064644, 1.190708, 0.3490196, 0, 1, 1,
0.612069, 0.7967477, 1.375, 0.3568628, 0, 1, 1,
0.6150492, 0.07650692, 1.161242, 0.3607843, 0, 1, 1,
0.6229187, 0.5198489, 0.9674463, 0.3686275, 0, 1, 1,
0.6230242, 0.1769739, 2.31144, 0.372549, 0, 1, 1,
0.6277362, -0.1111058, 2.131504, 0.3803922, 0, 1, 1,
0.6322231, -1.380813, 4.544909, 0.3843137, 0, 1, 1,
0.6335433, -1.06835, 0.2130068, 0.3921569, 0, 1, 1,
0.6339628, -0.08373483, 1.283095, 0.3960784, 0, 1, 1,
0.6367919, 0.08990486, 0.9779109, 0.4039216, 0, 1, 1,
0.6418296, 0.4331069, 1.414094, 0.4117647, 0, 1, 1,
0.6418936, 0.1590206, 0.498233, 0.4156863, 0, 1, 1,
0.6496834, 0.2847397, 2.038225, 0.4235294, 0, 1, 1,
0.650768, -0.6912796, 2.103416, 0.427451, 0, 1, 1,
0.6522592, -1.688491, 2.622456, 0.4352941, 0, 1, 1,
0.6525161, 0.0692938, 1.34584, 0.4392157, 0, 1, 1,
0.6529654, 0.1991194, 2.035076, 0.4470588, 0, 1, 1,
0.6544024, 0.315399, 3.138571, 0.4509804, 0, 1, 1,
0.6547927, -0.05365162, 2.76546, 0.4588235, 0, 1, 1,
0.6563038, 1.290798, 0.5402096, 0.4627451, 0, 1, 1,
0.6571873, 1.144903, 0.4494785, 0.4705882, 0, 1, 1,
0.6632653, 0.655611, 0.2070814, 0.4745098, 0, 1, 1,
0.6636671, -1.412014, 3.110845, 0.4823529, 0, 1, 1,
0.6637569, -0.7830315, 2.266875, 0.4862745, 0, 1, 1,
0.665637, 0.1225591, 1.213965, 0.4941176, 0, 1, 1,
0.669378, 1.093828, 0.6081488, 0.5019608, 0, 1, 1,
0.6698601, 0.781744, 1.181237, 0.5058824, 0, 1, 1,
0.6765702, 1.749118, 0.1831679, 0.5137255, 0, 1, 1,
0.6768378, -0.5569833, 1.871008, 0.5176471, 0, 1, 1,
0.679199, 0.05337911, 1.202728, 0.5254902, 0, 1, 1,
0.6821146, 1.496079, 2.878405, 0.5294118, 0, 1, 1,
0.6986178, -1.571696, 1.967646, 0.5372549, 0, 1, 1,
0.7044163, -0.2608681, 1.860632, 0.5411765, 0, 1, 1,
0.7051243, 0.6372825, 2.143638, 0.5490196, 0, 1, 1,
0.705713, -0.4460036, 1.852269, 0.5529412, 0, 1, 1,
0.7085657, 2.006403, 1.328062, 0.5607843, 0, 1, 1,
0.7139778, -1.084063, 4.109986, 0.5647059, 0, 1, 1,
0.7212611, 1.417844, 1.302416, 0.572549, 0, 1, 1,
0.7255397, 1.529593, 0.4518892, 0.5764706, 0, 1, 1,
0.7271946, -0.6288947, 2.60468, 0.5843138, 0, 1, 1,
0.7286972, -1.077479, 2.820201, 0.5882353, 0, 1, 1,
0.7299541, 0.6030911, 3.978709, 0.5960785, 0, 1, 1,
0.7363752, 1.855539, 1.45014, 0.6039216, 0, 1, 1,
0.7406624, -1.470616, 2.1728, 0.6078432, 0, 1, 1,
0.7424532, 1.880097, 1.584584, 0.6156863, 0, 1, 1,
0.7478702, 0.6618186, 0.8906618, 0.6196079, 0, 1, 1,
0.7537947, 0.3806896, 1.779949, 0.627451, 0, 1, 1,
0.7563022, -0.1221971, 0.6267686, 0.6313726, 0, 1, 1,
0.7582249, 1.494952, 1.916725, 0.6392157, 0, 1, 1,
0.7600529, 1.157872, 2.031287, 0.6431373, 0, 1, 1,
0.7612128, 1.637386, 1.834372, 0.6509804, 0, 1, 1,
0.7663313, -0.2106045, 1.2957, 0.654902, 0, 1, 1,
0.7663831, 0.6373064, 0.8979273, 0.6627451, 0, 1, 1,
0.7676717, 0.9442732, 2.372272, 0.6666667, 0, 1, 1,
0.7723004, -1.596949, 3.285611, 0.6745098, 0, 1, 1,
0.7805814, 1.714762, 1.420465, 0.6784314, 0, 1, 1,
0.782863, -0.9012755, 2.600553, 0.6862745, 0, 1, 1,
0.7889867, -0.3274333, 1.728834, 0.6901961, 0, 1, 1,
0.7908046, -1.043814, 2.47929, 0.6980392, 0, 1, 1,
0.7919936, 1.044015, -0.6796156, 0.7058824, 0, 1, 1,
0.7938866, 0.08746783, 2.550548, 0.7098039, 0, 1, 1,
0.8019431, -1.138803, 4.936661, 0.7176471, 0, 1, 1,
0.8078936, 0.5265896, 0.1464159, 0.7215686, 0, 1, 1,
0.8199336, 0.354188, 3.084345, 0.7294118, 0, 1, 1,
0.8222156, -0.9569641, 5.155814, 0.7333333, 0, 1, 1,
0.8266604, 0.325295, 0.8809315, 0.7411765, 0, 1, 1,
0.8267388, -2.212657, 1.874762, 0.7450981, 0, 1, 1,
0.8289226, -0.3773741, 2.344, 0.7529412, 0, 1, 1,
0.831456, 0.1390219, 2.189137, 0.7568628, 0, 1, 1,
0.8375133, 0.133089, -0.2084334, 0.7647059, 0, 1, 1,
0.8466372, -1.541327, 1.842568, 0.7686275, 0, 1, 1,
0.8467436, -0.9105542, 1.671708, 0.7764706, 0, 1, 1,
0.8546771, 0.1889692, 1.991733, 0.7803922, 0, 1, 1,
0.8594759, -0.5872412, 0.5286285, 0.7882353, 0, 1, 1,
0.8637357, 0.1655017, 1.810743, 0.7921569, 0, 1, 1,
0.8649253, -0.2182274, 1.062708, 0.8, 0, 1, 1,
0.8711079, 0.4640948, 0.2408953, 0.8078431, 0, 1, 1,
0.873566, -0.2649157, 1.065282, 0.8117647, 0, 1, 1,
0.8742276, 0.2489619, 0.9257408, 0.8196079, 0, 1, 1,
0.8771408, -1.173837, 2.632055, 0.8235294, 0, 1, 1,
0.8790103, -0.3582759, 1.220246, 0.8313726, 0, 1, 1,
0.8803402, -0.2264069, 3.659525, 0.8352941, 0, 1, 1,
0.8849046, 0.9832717, 0.7400441, 0.8431373, 0, 1, 1,
0.8892979, -2.271126, 3.176643, 0.8470588, 0, 1, 1,
0.8999699, -0.3834327, 1.58849, 0.854902, 0, 1, 1,
0.9052479, -1.668551, 1.388811, 0.8588235, 0, 1, 1,
0.9052515, -0.2208132, 1.97197, 0.8666667, 0, 1, 1,
0.9069896, -0.4934406, 2.613205, 0.8705882, 0, 1, 1,
0.9106961, 0.2367201, -0.07922957, 0.8784314, 0, 1, 1,
0.9113226, 2.04677, -0.307423, 0.8823529, 0, 1, 1,
0.9158643, -1.77899, 3.927227, 0.8901961, 0, 1, 1,
0.9172659, 0.06218769, 1.707312, 0.8941177, 0, 1, 1,
0.9201464, 0.8053768, -0.02112571, 0.9019608, 0, 1, 1,
0.9212303, 0.7139371, 0.3376361, 0.9098039, 0, 1, 1,
0.922807, 0.8599402, 2.233274, 0.9137255, 0, 1, 1,
0.9270038, -0.7522711, 1.696839, 0.9215686, 0, 1, 1,
0.9385504, -0.7249631, 2.230568, 0.9254902, 0, 1, 1,
0.9420475, -1.518003, 2.395431, 0.9333333, 0, 1, 1,
0.9494386, 1.113578, 2.288879, 0.9372549, 0, 1, 1,
0.9515468, -1.500067, 3.410346, 0.945098, 0, 1, 1,
0.9516581, -0.7377638, 2.86795, 0.9490196, 0, 1, 1,
0.952821, 0.4059665, 0.8511645, 0.9568627, 0, 1, 1,
0.9564544, 0.779135, 0.9216689, 0.9607843, 0, 1, 1,
0.9604496, -0.588702, -0.5161368, 0.9686275, 0, 1, 1,
0.9736976, -0.7413347, 2.778767, 0.972549, 0, 1, 1,
0.9779487, -1.14257, 3.818688, 0.9803922, 0, 1, 1,
0.9844184, 0.5422366, 0.7135322, 0.9843137, 0, 1, 1,
0.9848184, 0.1626295, 1.702963, 0.9921569, 0, 1, 1,
0.98526, 0.4462938, 2.21889, 0.9960784, 0, 1, 1,
0.9880246, 2.322188, 0.2129113, 1, 0, 0.9960784, 1,
0.9911163, 1.113472, 0.04464981, 1, 0, 0.9882353, 1,
0.9939899, -0.7043431, 2.520247, 1, 0, 0.9843137, 1,
0.9958457, 2.172205, 2.669631, 1, 0, 0.9764706, 1,
1.001444, -0.8278329, 1.923189, 1, 0, 0.972549, 1,
1.002387, 0.2798339, 1.483741, 1, 0, 0.9647059, 1,
1.008831, 0.01017306, 1.57146, 1, 0, 0.9607843, 1,
1.015884, -1.115918, 1.328069, 1, 0, 0.9529412, 1,
1.017296, -0.002322096, 2.164595, 1, 0, 0.9490196, 1,
1.017907, 0.3201867, 1.743012, 1, 0, 0.9411765, 1,
1.021297, 0.3359734, 1.455467, 1, 0, 0.9372549, 1,
1.024966, 1.262371, 1.423147, 1, 0, 0.9294118, 1,
1.042702, -0.1982367, 0.473711, 1, 0, 0.9254902, 1,
1.048678, 0.4522976, 0.4387364, 1, 0, 0.9176471, 1,
1.054509, -1.513655, 1.749162, 1, 0, 0.9137255, 1,
1.059491, 0.3381821, 0.8973157, 1, 0, 0.9058824, 1,
1.062358, -0.5491686, 1.139602, 1, 0, 0.9019608, 1,
1.065883, 2.03098, 1.512142, 1, 0, 0.8941177, 1,
1.067744, 0.521336, 0.5563574, 1, 0, 0.8862745, 1,
1.074784, -2.048923, 2.934229, 1, 0, 0.8823529, 1,
1.076647, -1.047484, 1.446748, 1, 0, 0.8745098, 1,
1.077026, -0.9279557, 5.876428, 1, 0, 0.8705882, 1,
1.077333, -0.3222217, 1.629069, 1, 0, 0.8627451, 1,
1.081768, -0.644703, 1.380416, 1, 0, 0.8588235, 1,
1.096481, 0.9288243, 0.529225, 1, 0, 0.8509804, 1,
1.097318, -0.6066359, 2.355136, 1, 0, 0.8470588, 1,
1.10273, -0.1323931, 3.959241, 1, 0, 0.8392157, 1,
1.104502, 0.6144904, 1.965199, 1, 0, 0.8352941, 1,
1.123174, -0.8420358, 1.875451, 1, 0, 0.827451, 1,
1.135, 1.151759, -0.3163143, 1, 0, 0.8235294, 1,
1.136352, 0.4755296, 1.884823, 1, 0, 0.8156863, 1,
1.146876, -1.513653, 2.06445, 1, 0, 0.8117647, 1,
1.148984, 0.5702796, 2.202903, 1, 0, 0.8039216, 1,
1.157655, 0.8633618, 1.056153, 1, 0, 0.7960784, 1,
1.159235, 0.1891176, 2.277426, 1, 0, 0.7921569, 1,
1.165501, 1.27319, 0.2682182, 1, 0, 0.7843137, 1,
1.166586, -0.4863467, 0.7961732, 1, 0, 0.7803922, 1,
1.175936, -0.4595485, 2.883779, 1, 0, 0.772549, 1,
1.182049, -0.5594431, 2.180755, 1, 0, 0.7686275, 1,
1.188284, -1.214072, 1.742055, 1, 0, 0.7607843, 1,
1.193745, 1.018439, 0.07184047, 1, 0, 0.7568628, 1,
1.200491, -0.3892416, 0.2721735, 1, 0, 0.7490196, 1,
1.205572, 0.2914483, 2.37865, 1, 0, 0.7450981, 1,
1.208229, -0.725297, 0.8374755, 1, 0, 0.7372549, 1,
1.210333, 0.8393533, 0.3222128, 1, 0, 0.7333333, 1,
1.212766, 0.2603891, 1.535587, 1, 0, 0.7254902, 1,
1.2164, 0.06902812, 1.209727, 1, 0, 0.7215686, 1,
1.219524, -1.760463, 2.14716, 1, 0, 0.7137255, 1,
1.226224, 1.809063, 2.88223, 1, 0, 0.7098039, 1,
1.231598, -0.862454, 4.051715, 1, 0, 0.7019608, 1,
1.235195, -0.87694, 1.901347, 1, 0, 0.6941177, 1,
1.24287, -1.744195, 3.322017, 1, 0, 0.6901961, 1,
1.249202, -0.3295279, 0.3301111, 1, 0, 0.682353, 1,
1.249202, -1.18239, 3.133248, 1, 0, 0.6784314, 1,
1.249865, -0.3657753, 0.6202419, 1, 0, 0.6705883, 1,
1.254346, -1.26506, 2.603393, 1, 0, 0.6666667, 1,
1.254465, -0.794211, 2.384993, 1, 0, 0.6588235, 1,
1.258371, 0.455864, 1.382765, 1, 0, 0.654902, 1,
1.267548, 0.3909574, 1.805106, 1, 0, 0.6470588, 1,
1.270688, 2.172301, 1.270352, 1, 0, 0.6431373, 1,
1.275703, 0.4838218, 2.710112, 1, 0, 0.6352941, 1,
1.29058, -0.1426002, 1.651519, 1, 0, 0.6313726, 1,
1.294019, -1.373612, 2.60806, 1, 0, 0.6235294, 1,
1.317284, -0.4966556, 4.734461, 1, 0, 0.6196079, 1,
1.317359, 0.3257117, 0.2474576, 1, 0, 0.6117647, 1,
1.317701, -1.177212, 4.386092, 1, 0, 0.6078432, 1,
1.322551, -0.659237, 2.40158, 1, 0, 0.6, 1,
1.330784, -0.3237169, 2.350471, 1, 0, 0.5921569, 1,
1.332532, -0.1436643, 2.325729, 1, 0, 0.5882353, 1,
1.337567, -0.1293809, 2.119623, 1, 0, 0.5803922, 1,
1.344589, 0.05802181, 0.08901203, 1, 0, 0.5764706, 1,
1.350714, 0.9995031, 0.004990068, 1, 0, 0.5686275, 1,
1.353924, 0.09473752, 0.03707472, 1, 0, 0.5647059, 1,
1.359714, 0.4035266, 2.410666, 1, 0, 0.5568628, 1,
1.36374, 1.88385, -0.6498339, 1, 0, 0.5529412, 1,
1.36841, -0.3332475, 1.946699, 1, 0, 0.5450981, 1,
1.370188, 0.9209219, 2.569998, 1, 0, 0.5411765, 1,
1.372867, -1.196308, 3.518739, 1, 0, 0.5333334, 1,
1.403157, 0.900444, 2.163195, 1, 0, 0.5294118, 1,
1.405257, -0.5339558, -0.209935, 1, 0, 0.5215687, 1,
1.41288, -1.680795, 0.3246211, 1, 0, 0.5176471, 1,
1.41979, -0.7260272, 1.634674, 1, 0, 0.509804, 1,
1.42153, 0.5018096, -0.1472674, 1, 0, 0.5058824, 1,
1.433373, 0.584546, 0.3865882, 1, 0, 0.4980392, 1,
1.4438, -0.5269984, 3.466229, 1, 0, 0.4901961, 1,
1.461065, 0.237007, 2.989065, 1, 0, 0.4862745, 1,
1.46373, -0.4469977, 2.765939, 1, 0, 0.4784314, 1,
1.468194, -0.4250733, 0.92773, 1, 0, 0.4745098, 1,
1.474245, 0.2801302, 0.1904526, 1, 0, 0.4666667, 1,
1.475567, -0.3692368, 0.2021721, 1, 0, 0.4627451, 1,
1.479161, -1.487026, 1.931256, 1, 0, 0.454902, 1,
1.482913, -0.4712496, 0.9016674, 1, 0, 0.4509804, 1,
1.484192, 0.01756081, 1.34764, 1, 0, 0.4431373, 1,
1.490796, 0.91435, -0.7315738, 1, 0, 0.4392157, 1,
1.490934, -0.4766627, 0.1449479, 1, 0, 0.4313726, 1,
1.491052, -0.1638884, 1.001939, 1, 0, 0.427451, 1,
1.501435, -1.217138, 1.220337, 1, 0, 0.4196078, 1,
1.510879, 0.1304672, -0.1849382, 1, 0, 0.4156863, 1,
1.511836, 0.2894688, 2.459079, 1, 0, 0.4078431, 1,
1.513666, -1.435368, 0.5958817, 1, 0, 0.4039216, 1,
1.516006, 0.5269825, 0.09536493, 1, 0, 0.3960784, 1,
1.531301, 0.5823705, 3.421305, 1, 0, 0.3882353, 1,
1.53188, 0.565044, 0.7240874, 1, 0, 0.3843137, 1,
1.53908, 0.5764916, -0.2880753, 1, 0, 0.3764706, 1,
1.543767, -1.772638, 1.646424, 1, 0, 0.372549, 1,
1.548655, 2.261165, 1.332978, 1, 0, 0.3647059, 1,
1.550704, 1.13477, -0.8449836, 1, 0, 0.3607843, 1,
1.551582, 0.8626867, 1.163642, 1, 0, 0.3529412, 1,
1.55189, -2.348212, 2.65155, 1, 0, 0.3490196, 1,
1.55997, -1.108653, 2.23451, 1, 0, 0.3411765, 1,
1.585986, -1.472236, 1.891524, 1, 0, 0.3372549, 1,
1.595491, 0.05952048, 0.3940732, 1, 0, 0.3294118, 1,
1.597273, 0.6148213, 1.048719, 1, 0, 0.3254902, 1,
1.608591, -1.966219, 2.586298, 1, 0, 0.3176471, 1,
1.612807, 2.178615, -0.408574, 1, 0, 0.3137255, 1,
1.618201, 0.2957557, 1.768525, 1, 0, 0.3058824, 1,
1.620825, -2.289041, 1.830615, 1, 0, 0.2980392, 1,
1.624394, -0.0009766885, 0.6912087, 1, 0, 0.2941177, 1,
1.636746, 0.2889192, 0.9302295, 1, 0, 0.2862745, 1,
1.64473, 0.6880609, 2.039029, 1, 0, 0.282353, 1,
1.646399, 2.111683, 0.4535547, 1, 0, 0.2745098, 1,
1.647373, 0.6912364, -0.3458542, 1, 0, 0.2705882, 1,
1.670437, -0.09096476, 2.27618, 1, 0, 0.2627451, 1,
1.678064, 0.3254966, 0.4098634, 1, 0, 0.2588235, 1,
1.680002, -0.4668589, 0.6811081, 1, 0, 0.2509804, 1,
1.700632, -2.079155, 1.046648, 1, 0, 0.2470588, 1,
1.726677, 1.035841, 1.717286, 1, 0, 0.2392157, 1,
1.73552, 0.02420009, 0.8886341, 1, 0, 0.2352941, 1,
1.737437, 0.2976027, 0.6571219, 1, 0, 0.227451, 1,
1.739454, 0.4112165, 2.33739, 1, 0, 0.2235294, 1,
1.776577, 0.3509943, 2.936785, 1, 0, 0.2156863, 1,
1.778219, 1.01777, 1.781228, 1, 0, 0.2117647, 1,
1.817511, 0.7332616, 0.8299445, 1, 0, 0.2039216, 1,
1.838523, -1.732883, 1.194576, 1, 0, 0.1960784, 1,
1.84237, 1.400974, 0.6781095, 1, 0, 0.1921569, 1,
1.865792, -0.4728274, 1.666521, 1, 0, 0.1843137, 1,
1.897484, 0.5439988, 2.200598, 1, 0, 0.1803922, 1,
1.936889, 0.6635632, -0.3717891, 1, 0, 0.172549, 1,
1.952368, 0.3419001, 2.123843, 1, 0, 0.1686275, 1,
1.980188, -0.5317339, 1.348605, 1, 0, 0.1607843, 1,
1.99072, 0.7908729, 0.635245, 1, 0, 0.1568628, 1,
1.996463, -0.7766001, 0.7716721, 1, 0, 0.1490196, 1,
1.998728, -0.9819427, 1.958096, 1, 0, 0.145098, 1,
2.005578, 0.9930853, 2.239564, 1, 0, 0.1372549, 1,
2.03128, -0.8620851, 1.013568, 1, 0, 0.1333333, 1,
2.039912, -1.377917, 2.97018, 1, 0, 0.1254902, 1,
2.050657, -0.05723996, 2.630992, 1, 0, 0.1215686, 1,
2.090415, 0.1485367, 0.7651991, 1, 0, 0.1137255, 1,
2.103199, 0.4919906, 1.847062, 1, 0, 0.1098039, 1,
2.129191, -1.155756, -0.07150001, 1, 0, 0.1019608, 1,
2.136396, 0.8503819, 1.911399, 1, 0, 0.09411765, 1,
2.149287, -0.369318, 4.243522, 1, 0, 0.09019608, 1,
2.198935, -0.8097844, 1.96258, 1, 0, 0.08235294, 1,
2.211187, 0.4329237, 0.149675, 1, 0, 0.07843138, 1,
2.250539, -0.05259994, 3.409315, 1, 0, 0.07058824, 1,
2.304006, -0.06387876, 1.342042, 1, 0, 0.06666667, 1,
2.307808, -0.1215153, 1.139246, 1, 0, 0.05882353, 1,
2.335755, 0.5282735, 0.4516146, 1, 0, 0.05490196, 1,
2.387506, -1.436144, 1.732357, 1, 0, 0.04705882, 1,
2.407476, -0.360738, 1.712208, 1, 0, 0.04313726, 1,
2.443489, 0.7953759, 3.440225, 1, 0, 0.03529412, 1,
2.501418, 0.1737313, 2.814739, 1, 0, 0.03137255, 1,
2.601432, 1.181689, 1.612517, 1, 0, 0.02352941, 1,
2.602715, 1.482472, 1.638249, 1, 0, 0.01960784, 1,
2.626277, -0.1863964, 1.243813, 1, 0, 0.01176471, 1,
3.434189, 0.4490998, 0.6090394, 1, 0, 0.007843138, 1
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
-0.2252141, -4.191119, -7.175775, 0, -0.5, 0.5, 0.5,
-0.2252141, -4.191119, -7.175775, 1, -0.5, 0.5, 0.5,
-0.2252141, -4.191119, -7.175775, 1, 1.5, 0.5, 0.5,
-0.2252141, -4.191119, -7.175775, 0, 1.5, 0.5, 0.5
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
-5.125155, -0.02148807, -7.175775, 0, -0.5, 0.5, 0.5,
-5.125155, -0.02148807, -7.175775, 1, -0.5, 0.5, 0.5,
-5.125155, -0.02148807, -7.175775, 1, 1.5, 0.5, 0.5,
-5.125155, -0.02148807, -7.175775, 0, 1.5, 0.5, 0.5
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
-5.125155, -4.191119, 0.2961786, 0, -0.5, 0.5, 0.5,
-5.125155, -4.191119, 0.2961786, 1, -0.5, 0.5, 0.5,
-5.125155, -4.191119, 0.2961786, 1, 1.5, 0.5, 0.5,
-5.125155, -4.191119, 0.2961786, 0, 1.5, 0.5, 0.5
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
-2, -3.228896, -5.451478,
2, -3.228896, -5.451478,
-2, -3.228896, -5.451478,
-2, -3.389267, -5.738861,
0, -3.228896, -5.451478,
0, -3.389267, -5.738861,
2, -3.228896, -5.451478,
2, -3.389267, -5.738861
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
-2, -3.710008, -6.313626, 0, -0.5, 0.5, 0.5,
-2, -3.710008, -6.313626, 1, -0.5, 0.5, 0.5,
-2, -3.710008, -6.313626, 1, 1.5, 0.5, 0.5,
-2, -3.710008, -6.313626, 0, 1.5, 0.5, 0.5,
0, -3.710008, -6.313626, 0, -0.5, 0.5, 0.5,
0, -3.710008, -6.313626, 1, -0.5, 0.5, 0.5,
0, -3.710008, -6.313626, 1, 1.5, 0.5, 0.5,
0, -3.710008, -6.313626, 0, 1.5, 0.5, 0.5,
2, -3.710008, -6.313626, 0, -0.5, 0.5, 0.5,
2, -3.710008, -6.313626, 1, -0.5, 0.5, 0.5,
2, -3.710008, -6.313626, 1, 1.5, 0.5, 0.5,
2, -3.710008, -6.313626, 0, 1.5, 0.5, 0.5
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
-3.9944, -3, -5.451478,
-3.9944, 3, -5.451478,
-3.9944, -3, -5.451478,
-4.182859, -3, -5.738861,
-3.9944, -2, -5.451478,
-4.182859, -2, -5.738861,
-3.9944, -1, -5.451478,
-4.182859, -1, -5.738861,
-3.9944, 0, -5.451478,
-4.182859, 0, -5.738861,
-3.9944, 1, -5.451478,
-4.182859, 1, -5.738861,
-3.9944, 2, -5.451478,
-4.182859, 2, -5.738861,
-3.9944, 3, -5.451478,
-4.182859, 3, -5.738861
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
-4.559778, -3, -6.313626, 0, -0.5, 0.5, 0.5,
-4.559778, -3, -6.313626, 1, -0.5, 0.5, 0.5,
-4.559778, -3, -6.313626, 1, 1.5, 0.5, 0.5,
-4.559778, -3, -6.313626, 0, 1.5, 0.5, 0.5,
-4.559778, -2, -6.313626, 0, -0.5, 0.5, 0.5,
-4.559778, -2, -6.313626, 1, -0.5, 0.5, 0.5,
-4.559778, -2, -6.313626, 1, 1.5, 0.5, 0.5,
-4.559778, -2, -6.313626, 0, 1.5, 0.5, 0.5,
-4.559778, -1, -6.313626, 0, -0.5, 0.5, 0.5,
-4.559778, -1, -6.313626, 1, -0.5, 0.5, 0.5,
-4.559778, -1, -6.313626, 1, 1.5, 0.5, 0.5,
-4.559778, -1, -6.313626, 0, 1.5, 0.5, 0.5,
-4.559778, 0, -6.313626, 0, -0.5, 0.5, 0.5,
-4.559778, 0, -6.313626, 1, -0.5, 0.5, 0.5,
-4.559778, 0, -6.313626, 1, 1.5, 0.5, 0.5,
-4.559778, 0, -6.313626, 0, 1.5, 0.5, 0.5,
-4.559778, 1, -6.313626, 0, -0.5, 0.5, 0.5,
-4.559778, 1, -6.313626, 1, -0.5, 0.5, 0.5,
-4.559778, 1, -6.313626, 1, 1.5, 0.5, 0.5,
-4.559778, 1, -6.313626, 0, 1.5, 0.5, 0.5,
-4.559778, 2, -6.313626, 0, -0.5, 0.5, 0.5,
-4.559778, 2, -6.313626, 1, -0.5, 0.5, 0.5,
-4.559778, 2, -6.313626, 1, 1.5, 0.5, 0.5,
-4.559778, 2, -6.313626, 0, 1.5, 0.5, 0.5,
-4.559778, 3, -6.313626, 0, -0.5, 0.5, 0.5,
-4.559778, 3, -6.313626, 1, -0.5, 0.5, 0.5,
-4.559778, 3, -6.313626, 1, 1.5, 0.5, 0.5,
-4.559778, 3, -6.313626, 0, 1.5, 0.5, 0.5
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
-3.9944, -3.228896, -4,
-3.9944, -3.228896, 4,
-3.9944, -3.228896, -4,
-4.182859, -3.389267, -4,
-3.9944, -3.228896, -2,
-4.182859, -3.389267, -2,
-3.9944, -3.228896, 0,
-4.182859, -3.389267, 0,
-3.9944, -3.228896, 2,
-4.182859, -3.389267, 2,
-3.9944, -3.228896, 4,
-4.182859, -3.389267, 4
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
-4.559778, -3.710008, -4, 0, -0.5, 0.5, 0.5,
-4.559778, -3.710008, -4, 1, -0.5, 0.5, 0.5,
-4.559778, -3.710008, -4, 1, 1.5, 0.5, 0.5,
-4.559778, -3.710008, -4, 0, 1.5, 0.5, 0.5,
-4.559778, -3.710008, -2, 0, -0.5, 0.5, 0.5,
-4.559778, -3.710008, -2, 1, -0.5, 0.5, 0.5,
-4.559778, -3.710008, -2, 1, 1.5, 0.5, 0.5,
-4.559778, -3.710008, -2, 0, 1.5, 0.5, 0.5,
-4.559778, -3.710008, 0, 0, -0.5, 0.5, 0.5,
-4.559778, -3.710008, 0, 1, -0.5, 0.5, 0.5,
-4.559778, -3.710008, 0, 1, 1.5, 0.5, 0.5,
-4.559778, -3.710008, 0, 0, 1.5, 0.5, 0.5,
-4.559778, -3.710008, 2, 0, -0.5, 0.5, 0.5,
-4.559778, -3.710008, 2, 1, -0.5, 0.5, 0.5,
-4.559778, -3.710008, 2, 1, 1.5, 0.5, 0.5,
-4.559778, -3.710008, 2, 0, 1.5, 0.5, 0.5,
-4.559778, -3.710008, 4, 0, -0.5, 0.5, 0.5,
-4.559778, -3.710008, 4, 1, -0.5, 0.5, 0.5,
-4.559778, -3.710008, 4, 1, 1.5, 0.5, 0.5,
-4.559778, -3.710008, 4, 0, 1.5, 0.5, 0.5
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
-3.9944, -3.228896, -5.451478,
-3.9944, 3.18592, -5.451478,
-3.9944, -3.228896, 6.043835,
-3.9944, 3.18592, 6.043835,
-3.9944, -3.228896, -5.451478,
-3.9944, -3.228896, 6.043835,
-3.9944, 3.18592, -5.451478,
-3.9944, 3.18592, 6.043835,
-3.9944, -3.228896, -5.451478,
3.543972, -3.228896, -5.451478,
-3.9944, -3.228896, 6.043835,
3.543972, -3.228896, 6.043835,
-3.9944, 3.18592, -5.451478,
3.543972, 3.18592, -5.451478,
-3.9944, 3.18592, 6.043835,
3.543972, 3.18592, 6.043835,
3.543972, -3.228896, -5.451478,
3.543972, 3.18592, -5.451478,
3.543972, -3.228896, 6.043835,
3.543972, 3.18592, 6.043835,
3.543972, -3.228896, -5.451478,
3.543972, -3.228896, 6.043835,
3.543972, 3.18592, -5.451478,
3.543972, 3.18592, 6.043835
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
var radius = 8.100314;
var distance = 36.03921;
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
mvMatrix.translate( 0.2252141, 0.02148807, -0.2961786 );
mvMatrix.scale( 1.161818, 1.365311, 0.7618946 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.03921);
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


