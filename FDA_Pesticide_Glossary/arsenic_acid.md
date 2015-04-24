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
-3.289799, -0.05015194, -1.311663, 1, 0, 0, 1,
-2.957534, 0.2849079, -0.9123552, 1, 0.007843138, 0, 1,
-2.627678, 0.4405115, -1.385914, 1, 0.01176471, 0, 1,
-2.608068, 0.1777041, -2.594601, 1, 0.01960784, 0, 1,
-2.532753, -2.225524, -1.96497, 1, 0.02352941, 0, 1,
-2.495846, -2.000429, -2.263757, 1, 0.03137255, 0, 1,
-2.446209, 0.6296839, -0.8214132, 1, 0.03529412, 0, 1,
-2.44343, 0.2161284, -1.398439, 1, 0.04313726, 0, 1,
-2.361164, 0.1120156, -0.8548992, 1, 0.04705882, 0, 1,
-2.30114, -0.2981633, -2.677044, 1, 0.05490196, 0, 1,
-2.291099, -1.093631, -2.596263, 1, 0.05882353, 0, 1,
-2.253488, -0.573066, -0.6407953, 1, 0.06666667, 0, 1,
-2.21844, 0.2349963, 0.3103726, 1, 0.07058824, 0, 1,
-2.217027, 1.628701, -2.064726, 1, 0.07843138, 0, 1,
-2.21604, -1.078993, -1.220524, 1, 0.08235294, 0, 1,
-2.200588, -0.04779749, -1.539533, 1, 0.09019608, 0, 1,
-2.179083, -0.5826428, -2.050483, 1, 0.09411765, 0, 1,
-2.167776, 1.198964, 0.5219713, 1, 0.1019608, 0, 1,
-2.160991, 0.4261762, -0.6077392, 1, 0.1098039, 0, 1,
-2.15053, -0.5915322, -3.051614, 1, 0.1137255, 0, 1,
-2.146478, -2.812257, -2.297218, 1, 0.1215686, 0, 1,
-2.134129, 0.006552258, -2.115699, 1, 0.1254902, 0, 1,
-2.120703, -0.3057319, -1.730737, 1, 0.1333333, 0, 1,
-2.100542, -0.3474953, -1.966354, 1, 0.1372549, 0, 1,
-2.093147, 0.2962824, -1.62403, 1, 0.145098, 0, 1,
-2.079921, 0.1273936, -0.350444, 1, 0.1490196, 0, 1,
-2.04447, -0.3112387, -1.176233, 1, 0.1568628, 0, 1,
-2.026835, 0.6616294, -1.538569, 1, 0.1607843, 0, 1,
-2.019841, -0.9898666, -0.07406294, 1, 0.1686275, 0, 1,
-2.019592, 0.484099, -2.510442, 1, 0.172549, 0, 1,
-2.013049, -1.05036, -0.260507, 1, 0.1803922, 0, 1,
-2.00341, -0.07445703, -1.519824, 1, 0.1843137, 0, 1,
-1.945739, 1.058292, 0.18827, 1, 0.1921569, 0, 1,
-1.936989, 1.420425, 0.1904745, 1, 0.1960784, 0, 1,
-1.932375, -1.836491, -1.062407, 1, 0.2039216, 0, 1,
-1.898999, 0.02089029, -3.825469, 1, 0.2117647, 0, 1,
-1.869557, 1.555139, -2.094669, 1, 0.2156863, 0, 1,
-1.859907, -1.338119, -3.834794, 1, 0.2235294, 0, 1,
-1.854631, -0.09075579, -0.5763059, 1, 0.227451, 0, 1,
-1.821725, 0.8153107, -0.6062249, 1, 0.2352941, 0, 1,
-1.789034, -0.02648159, -1.816905, 1, 0.2392157, 0, 1,
-1.770721, 0.5406075, -1.831375, 1, 0.2470588, 0, 1,
-1.762211, -1.423994, -1.407907, 1, 0.2509804, 0, 1,
-1.74376, 0.3034202, -2.7695, 1, 0.2588235, 0, 1,
-1.73326, 1.664907, -1.424712, 1, 0.2627451, 0, 1,
-1.72148, -0.9409, -1.069782, 1, 0.2705882, 0, 1,
-1.718951, 0.7304905, -1.512409, 1, 0.2745098, 0, 1,
-1.716972, -0.2378365, -2.58035, 1, 0.282353, 0, 1,
-1.701122, -0.2116024, -0.6619837, 1, 0.2862745, 0, 1,
-1.673872, 1.256697, -2.583355, 1, 0.2941177, 0, 1,
-1.652671, 0.8303452, -1.13001, 1, 0.3019608, 0, 1,
-1.647875, 2.032294, -2.16141, 1, 0.3058824, 0, 1,
-1.646345, 1.903949, -1.498284, 1, 0.3137255, 0, 1,
-1.642332, 0.1785256, -0.9251373, 1, 0.3176471, 0, 1,
-1.634452, -0.6739134, -1.446954, 1, 0.3254902, 0, 1,
-1.621635, 0.8494806, -1.823553, 1, 0.3294118, 0, 1,
-1.617233, 1.264653, 0.01439898, 1, 0.3372549, 0, 1,
-1.613534, -0.9940985, -1.338659, 1, 0.3411765, 0, 1,
-1.60693, -0.2262651, -0.9318153, 1, 0.3490196, 0, 1,
-1.602866, -0.3051469, 0.5723158, 1, 0.3529412, 0, 1,
-1.600392, 0.5722479, -2.314786, 1, 0.3607843, 0, 1,
-1.594003, -0.3688097, -3.238445, 1, 0.3647059, 0, 1,
-1.591149, 0.5515055, -0.3781819, 1, 0.372549, 0, 1,
-1.584242, -1.091793, -0.01449719, 1, 0.3764706, 0, 1,
-1.550814, 1.186131, -1.65203, 1, 0.3843137, 0, 1,
-1.509553, -1.313722, -1.803554, 1, 0.3882353, 0, 1,
-1.5062, 2.33459, 0.1577858, 1, 0.3960784, 0, 1,
-1.496242, 0.414696, 0.2753652, 1, 0.4039216, 0, 1,
-1.492601, 0.1849046, -2.10058, 1, 0.4078431, 0, 1,
-1.489747, -0.4825388, -2.315978, 1, 0.4156863, 0, 1,
-1.476961, -0.6161893, -3.65645, 1, 0.4196078, 0, 1,
-1.469442, 0.1463904, -1.894596, 1, 0.427451, 0, 1,
-1.458794, 0.4146992, -1.922829, 1, 0.4313726, 0, 1,
-1.437178, -0.5208351, -2.025738, 1, 0.4392157, 0, 1,
-1.436507, -1.329117, -0.8118144, 1, 0.4431373, 0, 1,
-1.4334, 0.1440918, 0.3560672, 1, 0.4509804, 0, 1,
-1.42855, 0.03068869, -2.525188, 1, 0.454902, 0, 1,
-1.425729, -1.847149, -1.899007, 1, 0.4627451, 0, 1,
-1.405156, -0.9224383, -2.173373, 1, 0.4666667, 0, 1,
-1.40011, 0.1428851, -1.29956, 1, 0.4745098, 0, 1,
-1.395286, -0.2319317, -2.841939, 1, 0.4784314, 0, 1,
-1.391391, 0.1822246, -0.1580967, 1, 0.4862745, 0, 1,
-1.389346, 0.1938147, -1.974562, 1, 0.4901961, 0, 1,
-1.38474, 1.203741, 0.2138716, 1, 0.4980392, 0, 1,
-1.382967, -1.478525, -2.915568, 1, 0.5058824, 0, 1,
-1.382621, 0.6324797, -0.3316079, 1, 0.509804, 0, 1,
-1.379914, -0.4824969, -2.709422, 1, 0.5176471, 0, 1,
-1.374169, -0.0006887892, -0.6448348, 1, 0.5215687, 0, 1,
-1.365744, 0.4364972, -0.2225615, 1, 0.5294118, 0, 1,
-1.365608, 0.3047414, -0.7735567, 1, 0.5333334, 0, 1,
-1.363705, 0.6487349, -2.264596, 1, 0.5411765, 0, 1,
-1.35669, -3.673122, -1.499205, 1, 0.5450981, 0, 1,
-1.353711, 2.649439, 0.5932476, 1, 0.5529412, 0, 1,
-1.352192, 0.6395326, -1.846758, 1, 0.5568628, 0, 1,
-1.337828, -2.316225, -3.380183, 1, 0.5647059, 0, 1,
-1.337677, 1.308486, -1.762329, 1, 0.5686275, 0, 1,
-1.30655, -0.6692588, -2.054077, 1, 0.5764706, 0, 1,
-1.306073, -1.115058, -2.723045, 1, 0.5803922, 0, 1,
-1.300276, -0.4354801, -1.595599, 1, 0.5882353, 0, 1,
-1.294565, -1.229112, -2.482626, 1, 0.5921569, 0, 1,
-1.278054, -0.5384005, -1.379782, 1, 0.6, 0, 1,
-1.275146, 1.533395, -1.183588, 1, 0.6078432, 0, 1,
-1.271708, 1.661345, -0.7870126, 1, 0.6117647, 0, 1,
-1.268883, -0.8196275, -2.663495, 1, 0.6196079, 0, 1,
-1.26743, 0.2073344, -3.391944, 1, 0.6235294, 0, 1,
-1.264995, 0.2661793, -2.035133, 1, 0.6313726, 0, 1,
-1.26217, -0.1982862, -1.689303, 1, 0.6352941, 0, 1,
-1.257224, -0.6462104, 0.06223192, 1, 0.6431373, 0, 1,
-1.249588, 0.2580156, -0.7896563, 1, 0.6470588, 0, 1,
-1.248893, 0.2825359, -1.765702, 1, 0.654902, 0, 1,
-1.239583, 0.9560662, -0.4787765, 1, 0.6588235, 0, 1,
-1.235374, 0.8345268, -1.507094, 1, 0.6666667, 0, 1,
-1.235145, -0.2353664, -1.652362, 1, 0.6705883, 0, 1,
-1.22038, -0.914178, -3.04392, 1, 0.6784314, 0, 1,
-1.208665, -0.5950491, -1.833537, 1, 0.682353, 0, 1,
-1.20077, -0.6152259, -2.675411, 1, 0.6901961, 0, 1,
-1.19963, -0.4287578, -1.637675, 1, 0.6941177, 0, 1,
-1.199162, -0.1024709, -3.14073, 1, 0.7019608, 0, 1,
-1.19236, -0.7862881, -2.424891, 1, 0.7098039, 0, 1,
-1.186689, 0.1222586, -1.600477, 1, 0.7137255, 0, 1,
-1.184454, 1.158417, -0.5736006, 1, 0.7215686, 0, 1,
-1.184293, -0.5510094, -2.129396, 1, 0.7254902, 0, 1,
-1.183428, -1.372551, -3.103463, 1, 0.7333333, 0, 1,
-1.179175, -0.4731555, -2.772398, 1, 0.7372549, 0, 1,
-1.177857, 0.6443141, 0.3031358, 1, 0.7450981, 0, 1,
-1.168397, 1.171663, -0.7452031, 1, 0.7490196, 0, 1,
-1.16799, -2.317627, -3.056506, 1, 0.7568628, 0, 1,
-1.162103, -0.1856785, -2.076703, 1, 0.7607843, 0, 1,
-1.155068, -0.1777839, -2.467804, 1, 0.7686275, 0, 1,
-1.141438, 1.757915, -0.4539308, 1, 0.772549, 0, 1,
-1.141022, -1.204703, -0.945235, 1, 0.7803922, 0, 1,
-1.135059, 1.399684, -1.611783, 1, 0.7843137, 0, 1,
-1.12799, -0.4668152, -1.34102, 1, 0.7921569, 0, 1,
-1.126526, 0.4127899, -1.371612, 1, 0.7960784, 0, 1,
-1.114643, -0.2308507, -1.867531, 1, 0.8039216, 0, 1,
-1.107724, 1.09443, -0.7254771, 1, 0.8117647, 0, 1,
-1.103562, 1.628302, -0.2798263, 1, 0.8156863, 0, 1,
-1.094888, 0.5802761, -1.713584, 1, 0.8235294, 0, 1,
-1.075459, 1.010133, -0.479055, 1, 0.827451, 0, 1,
-1.07459, 0.7671116, -0.34908, 1, 0.8352941, 0, 1,
-1.073498, -0.6521482, -2.376158, 1, 0.8392157, 0, 1,
-1.073147, 1.86227, -2.142285, 1, 0.8470588, 0, 1,
-1.071692, -0.6211836, -2.883028, 1, 0.8509804, 0, 1,
-1.070958, -0.4424773, -1.250545, 1, 0.8588235, 0, 1,
-1.066404, -1.439144, -2.211444, 1, 0.8627451, 0, 1,
-1.055583, 0.7474657, 0.3002685, 1, 0.8705882, 0, 1,
-1.047544, -0.07610031, -1.229084, 1, 0.8745098, 0, 1,
-1.047317, -0.1546433, -1.67733, 1, 0.8823529, 0, 1,
-1.04729, -0.9330302, -1.289536, 1, 0.8862745, 0, 1,
-1.046421, 0.6813974, -1.511901, 1, 0.8941177, 0, 1,
-1.046091, 1.26011, 0.03560987, 1, 0.8980392, 0, 1,
-1.039263, -1.349261, -2.702596, 1, 0.9058824, 0, 1,
-1.038653, 0.6258488, -1.635523, 1, 0.9137255, 0, 1,
-1.027337, -0.7106237, -3.358377, 1, 0.9176471, 0, 1,
-1.024643, 0.9628568, -2.391191, 1, 0.9254902, 0, 1,
-1.019602, -0.5224412, -2.084751, 1, 0.9294118, 0, 1,
-1.010035, -0.4897562, -2.360232, 1, 0.9372549, 0, 1,
-1.008934, 0.1039544, -1.896503, 1, 0.9411765, 0, 1,
-1.00848, 0.1515924, -0.994074, 1, 0.9490196, 0, 1,
-1.006155, -0.3580165, -2.801547, 1, 0.9529412, 0, 1,
-0.9910327, -0.9252587, -3.665374, 1, 0.9607843, 0, 1,
-0.9884352, -0.18922, -4.288624, 1, 0.9647059, 0, 1,
-0.986442, 1.146875, -1.614802, 1, 0.972549, 0, 1,
-0.9797737, -0.6546503, -2.965011, 1, 0.9764706, 0, 1,
-0.9780393, -0.2558082, -0.7889426, 1, 0.9843137, 0, 1,
-0.9748151, -1.533221, -4.087542, 1, 0.9882353, 0, 1,
-0.9734031, -1.806508, -0.9126869, 1, 0.9960784, 0, 1,
-0.9727415, 0.7886899, 0.01752712, 0.9960784, 1, 0, 1,
-0.9698927, -2.11087, -1.578677, 0.9921569, 1, 0, 1,
-0.9689806, -0.9725792, -3.342612, 0.9843137, 1, 0, 1,
-0.9683554, -0.810059, -3.855398, 0.9803922, 1, 0, 1,
-0.9653376, 0.2403232, 0.8066412, 0.972549, 1, 0, 1,
-0.9652519, 0.1625126, -0.1815785, 0.9686275, 1, 0, 1,
-0.9576163, 1.161756, -0.6754506, 0.9607843, 1, 0, 1,
-0.9470685, 0.4222493, 0.3858972, 0.9568627, 1, 0, 1,
-0.9470261, 0.5767077, 0.990145, 0.9490196, 1, 0, 1,
-0.9455636, 0.3247301, -0.1780494, 0.945098, 1, 0, 1,
-0.9408926, 0.5884776, -0.1610477, 0.9372549, 1, 0, 1,
-0.9372457, -0.8956006, -0.5928546, 0.9333333, 1, 0, 1,
-0.9258455, -1.451166, -2.801442, 0.9254902, 1, 0, 1,
-0.9178098, -0.3338943, -1.86931, 0.9215686, 1, 0, 1,
-0.9165793, 0.2724357, -1.923291, 0.9137255, 1, 0, 1,
-0.9150189, -1.252731, -2.838166, 0.9098039, 1, 0, 1,
-0.9148312, -2.532253, -2.816961, 0.9019608, 1, 0, 1,
-0.9107253, 0.3991981, -1.607807, 0.8941177, 1, 0, 1,
-0.9068711, -0.8399234, -3.887962, 0.8901961, 1, 0, 1,
-0.9036499, 0.6358368, -1.383792, 0.8823529, 1, 0, 1,
-0.9023488, -0.3595002, -1.541024, 0.8784314, 1, 0, 1,
-0.8950368, -1.034037, -2.278799, 0.8705882, 1, 0, 1,
-0.8950215, -0.7857324, -1.803961, 0.8666667, 1, 0, 1,
-0.8867644, -1.061291, -1.156484, 0.8588235, 1, 0, 1,
-0.8843122, 0.7888294, 0.1137509, 0.854902, 1, 0, 1,
-0.8832266, 0.2501363, -0.4235159, 0.8470588, 1, 0, 1,
-0.8816136, -0.7740886, -1.80173, 0.8431373, 1, 0, 1,
-0.8782684, 1.056362, -1.234609, 0.8352941, 1, 0, 1,
-0.874052, 0.3103096, -1.175925, 0.8313726, 1, 0, 1,
-0.8732752, 0.06482565, -1.255687, 0.8235294, 1, 0, 1,
-0.8725802, -0.03339128, -0.3386598, 0.8196079, 1, 0, 1,
-0.8682436, 0.2912206, 0.2077544, 0.8117647, 1, 0, 1,
-0.8680096, 0.5896165, 0.3624316, 0.8078431, 1, 0, 1,
-0.8678706, -0.1438926, -1.276174, 0.8, 1, 0, 1,
-0.8645743, -0.08255565, -0.3112154, 0.7921569, 1, 0, 1,
-0.8642112, 1.001397, -0.1524834, 0.7882353, 1, 0, 1,
-0.8614399, 0.1660212, -0.4057875, 0.7803922, 1, 0, 1,
-0.854414, 2.488344, -0.003468137, 0.7764706, 1, 0, 1,
-0.8514543, 1.268626, -2.297988, 0.7686275, 1, 0, 1,
-0.8502029, -0.749366, -4.120921, 0.7647059, 1, 0, 1,
-0.8420218, 0.1461972, -0.5948141, 0.7568628, 1, 0, 1,
-0.8342372, 0.6176788, -0.4367029, 0.7529412, 1, 0, 1,
-0.8293115, 0.001985722, -2.669885, 0.7450981, 1, 0, 1,
-0.8248559, 0.3164428, -1.761635, 0.7411765, 1, 0, 1,
-0.8227491, 1.237901, -0.9919325, 0.7333333, 1, 0, 1,
-0.8222117, 0.3359505, -2.079806, 0.7294118, 1, 0, 1,
-0.8137221, -0.6508625, -2.600456, 0.7215686, 1, 0, 1,
-0.8135878, 0.4296025, -1.349745, 0.7176471, 1, 0, 1,
-0.8100337, -0.3251042, -1.626672, 0.7098039, 1, 0, 1,
-0.8073344, -0.1992441, -3.00359, 0.7058824, 1, 0, 1,
-0.8020353, -1.175911, -3.22247, 0.6980392, 1, 0, 1,
-0.7993911, 0.3305238, 0.0003333557, 0.6901961, 1, 0, 1,
-0.7943743, 0.3825479, -2.373233, 0.6862745, 1, 0, 1,
-0.7923021, -2.027144, -2.768261, 0.6784314, 1, 0, 1,
-0.7872195, -1.692322, -4.822233, 0.6745098, 1, 0, 1,
-0.78426, -0.3324994, -3.248657, 0.6666667, 1, 0, 1,
-0.7781125, -1.83013, -2.479873, 0.6627451, 1, 0, 1,
-0.7734372, 2.06293, -0.7461576, 0.654902, 1, 0, 1,
-0.7676215, 0.4269065, -0.1023251, 0.6509804, 1, 0, 1,
-0.7619539, -0.3833848, -1.914919, 0.6431373, 1, 0, 1,
-0.7612453, -1.019909, -2.40836, 0.6392157, 1, 0, 1,
-0.7600169, 2.817039, 0.6748868, 0.6313726, 1, 0, 1,
-0.7571811, 0.2889714, 1.103239, 0.627451, 1, 0, 1,
-0.7528576, -0.04483785, -1.036945, 0.6196079, 1, 0, 1,
-0.7524892, 0.7533684, -1.409776, 0.6156863, 1, 0, 1,
-0.7510659, 0.8729033, -3.007506, 0.6078432, 1, 0, 1,
-0.7500656, -0.2589664, -1.673482, 0.6039216, 1, 0, 1,
-0.7436513, -1.288462, -2.292983, 0.5960785, 1, 0, 1,
-0.7411282, -2.44731, -3.184962, 0.5882353, 1, 0, 1,
-0.7406959, -1.6807, -3.15605, 0.5843138, 1, 0, 1,
-0.7391277, 0.2016821, -1.039738, 0.5764706, 1, 0, 1,
-0.735717, 0.4894992, -0.5573502, 0.572549, 1, 0, 1,
-0.7334905, -0.9086745, -3.511263, 0.5647059, 1, 0, 1,
-0.730144, 0.7270191, -2.230248, 0.5607843, 1, 0, 1,
-0.7282555, -1.655696, -1.030789, 0.5529412, 1, 0, 1,
-0.7271074, 0.2299566, 0.2720212, 0.5490196, 1, 0, 1,
-0.7257661, -0.4361724, -2.738614, 0.5411765, 1, 0, 1,
-0.7254082, -1.030612, -4.535488, 0.5372549, 1, 0, 1,
-0.7169664, -0.5236609, -2.593349, 0.5294118, 1, 0, 1,
-0.71403, 1.605652, 0.5000165, 0.5254902, 1, 0, 1,
-0.7137126, -0.3843097, -2.660237, 0.5176471, 1, 0, 1,
-0.7106377, -0.4067757, -2.97997, 0.5137255, 1, 0, 1,
-0.7053238, -0.4048335, -3.674304, 0.5058824, 1, 0, 1,
-0.7043949, -0.123927, -2.463025, 0.5019608, 1, 0, 1,
-0.7043868, 1.329582, -1.148181, 0.4941176, 1, 0, 1,
-0.7004893, -2.242299, -4.040443, 0.4862745, 1, 0, 1,
-0.6893966, 0.2610711, -0.2901562, 0.4823529, 1, 0, 1,
-0.6850131, -0.1298098, -1.260504, 0.4745098, 1, 0, 1,
-0.6737183, -1.403121, -2.872799, 0.4705882, 1, 0, 1,
-0.6683093, 0.214903, -0.09023084, 0.4627451, 1, 0, 1,
-0.6666173, 0.6363085, -1.321981, 0.4588235, 1, 0, 1,
-0.6616603, 0.2904534, -3.753666, 0.4509804, 1, 0, 1,
-0.6615124, -0.1429674, -3.953987, 0.4470588, 1, 0, 1,
-0.6609722, 0.3424072, -0.7834384, 0.4392157, 1, 0, 1,
-0.6608977, 0.2940934, -0.1255324, 0.4352941, 1, 0, 1,
-0.6482, -0.02225786, -0.5597493, 0.427451, 1, 0, 1,
-0.6377653, -0.9819788, -3.852828, 0.4235294, 1, 0, 1,
-0.6302612, 1.065632, -0.689842, 0.4156863, 1, 0, 1,
-0.6232604, -0.7375818, -3.638325, 0.4117647, 1, 0, 1,
-0.6203511, -0.2898385, -1.958753, 0.4039216, 1, 0, 1,
-0.6097279, -0.9682946, -4.249567, 0.3960784, 1, 0, 1,
-0.608462, -2.280744, -3.093941, 0.3921569, 1, 0, 1,
-0.6054758, 1.075672, 1.582401, 0.3843137, 1, 0, 1,
-0.5982055, 0.90471, 0.5030943, 0.3803922, 1, 0, 1,
-0.5960823, -0.1267648, 0.1423977, 0.372549, 1, 0, 1,
-0.5935253, 0.9979948, -0.679224, 0.3686275, 1, 0, 1,
-0.5911036, 0.6477296, -4.065818, 0.3607843, 1, 0, 1,
-0.5783223, 0.464914, 0.8751515, 0.3568628, 1, 0, 1,
-0.5782191, -0.7045998, -2.742874, 0.3490196, 1, 0, 1,
-0.5742711, 0.1675705, -0.6340306, 0.345098, 1, 0, 1,
-0.5730797, 0.6465533, 0.02928943, 0.3372549, 1, 0, 1,
-0.5725365, 2.279771, -0.8621337, 0.3333333, 1, 0, 1,
-0.5710737, -0.01615585, -1.895831, 0.3254902, 1, 0, 1,
-0.5675519, -0.7442034, -1.397735, 0.3215686, 1, 0, 1,
-0.5630813, -1.20555, -1.891614, 0.3137255, 1, 0, 1,
-0.562804, 0.7661842, -0.8864064, 0.3098039, 1, 0, 1,
-0.5562631, 0.927093, -1.216285, 0.3019608, 1, 0, 1,
-0.5559564, -1.226413, -3.255047, 0.2941177, 1, 0, 1,
-0.5539465, -0.9540827, -2.755085, 0.2901961, 1, 0, 1,
-0.5506227, -1.110215, -0.9002998, 0.282353, 1, 0, 1,
-0.5448475, -0.02863339, -1.431655, 0.2784314, 1, 0, 1,
-0.5425011, -0.8780711, -2.677764, 0.2705882, 1, 0, 1,
-0.5400341, -0.06839011, -1.250525, 0.2666667, 1, 0, 1,
-0.5366991, -0.8412719, -1.717993, 0.2588235, 1, 0, 1,
-0.5366355, -0.9834211, -2.956215, 0.254902, 1, 0, 1,
-0.5296385, -1.712589, -2.304759, 0.2470588, 1, 0, 1,
-0.5278746, 0.5235977, -0.5214302, 0.2431373, 1, 0, 1,
-0.5263943, 0.8599496, -1.170984, 0.2352941, 1, 0, 1,
-0.5207741, -1.301479, -1.433759, 0.2313726, 1, 0, 1,
-0.5200717, -0.1393691, -1.469412, 0.2235294, 1, 0, 1,
-0.5185523, -1.136137, -3.09419, 0.2196078, 1, 0, 1,
-0.517884, -0.7918828, -0.8956369, 0.2117647, 1, 0, 1,
-0.5173135, -0.4942437, -2.785647, 0.2078431, 1, 0, 1,
-0.5136202, -0.4238787, -2.380729, 0.2, 1, 0, 1,
-0.5125087, -0.09635707, -1.050789, 0.1921569, 1, 0, 1,
-0.5106593, 0.3978212, 0.8794302, 0.1882353, 1, 0, 1,
-0.5066982, -0.5970396, -4.59542, 0.1803922, 1, 0, 1,
-0.5012895, 0.2663544, -2.935722, 0.1764706, 1, 0, 1,
-0.4984867, -0.07111552, -2.192886, 0.1686275, 1, 0, 1,
-0.4950539, -0.2197987, -1.139362, 0.1647059, 1, 0, 1,
-0.4840703, 0.09166505, 0.5999161, 0.1568628, 1, 0, 1,
-0.4835379, -0.6056089, -0.3474833, 0.1529412, 1, 0, 1,
-0.4816407, -2.071415, -2.548563, 0.145098, 1, 0, 1,
-0.4812738, 2.42049, -0.3084452, 0.1411765, 1, 0, 1,
-0.4808619, 1.719933, -0.009482277, 0.1333333, 1, 0, 1,
-0.4739728, 0.8590966, -1.39481, 0.1294118, 1, 0, 1,
-0.4704838, -1.039675, -0.9507548, 0.1215686, 1, 0, 1,
-0.470461, 1.486583, -0.3829938, 0.1176471, 1, 0, 1,
-0.4701171, -1.870931, -2.485706, 0.1098039, 1, 0, 1,
-0.4690775, 0.948497, -1.213359, 0.1058824, 1, 0, 1,
-0.4677776, 0.1081003, -2.288303, 0.09803922, 1, 0, 1,
-0.4627948, -0.201702, -2.497267, 0.09019608, 1, 0, 1,
-0.4576525, -0.05983511, -2.157351, 0.08627451, 1, 0, 1,
-0.4560152, 0.03256563, -0.9413205, 0.07843138, 1, 0, 1,
-0.4535407, -0.5951626, -2.963007, 0.07450981, 1, 0, 1,
-0.4494596, 0.8118054, -1.306159, 0.06666667, 1, 0, 1,
-0.4429219, -0.7307246, -2.552658, 0.0627451, 1, 0, 1,
-0.4377303, -0.08107793, -1.488353, 0.05490196, 1, 0, 1,
-0.4357198, -2.231109, -5.407623, 0.05098039, 1, 0, 1,
-0.4353911, 1.19329, 0.3382701, 0.04313726, 1, 0, 1,
-0.4298542, -1.340924, -4.918522, 0.03921569, 1, 0, 1,
-0.4284277, -0.0483326, -2.766215, 0.03137255, 1, 0, 1,
-0.4281965, -1.32297, -3.555868, 0.02745098, 1, 0, 1,
-0.4255681, -0.5832955, -3.574791, 0.01960784, 1, 0, 1,
-0.4146003, -0.190881, -1.689631, 0.01568628, 1, 0, 1,
-0.4089967, 0.8803403, -2.018983, 0.007843138, 1, 0, 1,
-0.4070959, -0.1348843, -2.026681, 0.003921569, 1, 0, 1,
-0.4017174, -0.7526265, -2.553758, 0, 1, 0.003921569, 1,
-0.3966542, 0.617794, 1.714961, 0, 1, 0.01176471, 1,
-0.3900446, -0.935423, -2.56309, 0, 1, 0.01568628, 1,
-0.3891026, 0.9151284, 1.367654, 0, 1, 0.02352941, 1,
-0.3852818, 0.4413055, -1.303574, 0, 1, 0.02745098, 1,
-0.3834095, 2.670813, 0.7931012, 0, 1, 0.03529412, 1,
-0.3830522, 0.8947749, -0.7317131, 0, 1, 0.03921569, 1,
-0.3808261, -0.8030513, -2.649295, 0, 1, 0.04705882, 1,
-0.3797321, -0.9360293, -2.501222, 0, 1, 0.05098039, 1,
-0.3786635, 0.6594853, -2.062738, 0, 1, 0.05882353, 1,
-0.3785858, -0.5334691, -2.54916, 0, 1, 0.0627451, 1,
-0.3768972, -0.9315297, -2.146211, 0, 1, 0.07058824, 1,
-0.3764266, -1.824499, -2.379168, 0, 1, 0.07450981, 1,
-0.3753553, -1.663703, -2.890372, 0, 1, 0.08235294, 1,
-0.3751203, -0.897785, -4.073862, 0, 1, 0.08627451, 1,
-0.3677976, 0.4808219, 0.3123467, 0, 1, 0.09411765, 1,
-0.366807, -1.392846, -0.8723439, 0, 1, 0.1019608, 1,
-0.3663315, -1.506474, -3.469733, 0, 1, 0.1058824, 1,
-0.3655456, 0.9948718, -1.268472, 0, 1, 0.1137255, 1,
-0.3653959, -0.92064, -2.442062, 0, 1, 0.1176471, 1,
-0.3640945, -1.180443, -2.657089, 0, 1, 0.1254902, 1,
-0.359926, -0.07658079, -1.024877, 0, 1, 0.1294118, 1,
-0.3591879, -0.3100353, -2.077203, 0, 1, 0.1372549, 1,
-0.3488244, -0.06973975, -1.274226, 0, 1, 0.1411765, 1,
-0.3411139, -0.38344, -2.258286, 0, 1, 0.1490196, 1,
-0.3373943, 1.771547, -1.425411, 0, 1, 0.1529412, 1,
-0.3330179, -1.114251, -2.91192, 0, 1, 0.1607843, 1,
-0.3327135, 1.236544, -0.7751799, 0, 1, 0.1647059, 1,
-0.3301821, 1.481622, 0.2888536, 0, 1, 0.172549, 1,
-0.3293498, -1.153335, -3.205178, 0, 1, 0.1764706, 1,
-0.3263103, -1.546013, -2.358817, 0, 1, 0.1843137, 1,
-0.3258974, -1.759491, -2.114161, 0, 1, 0.1882353, 1,
-0.3228114, 0.9937202, 0.3452308, 0, 1, 0.1960784, 1,
-0.3221408, -0.3973068, -3.096622, 0, 1, 0.2039216, 1,
-0.3190177, -1.764734, -3.72921, 0, 1, 0.2078431, 1,
-0.3087778, -0.928782, -1.587858, 0, 1, 0.2156863, 1,
-0.3043735, -1.046255, -2.39732, 0, 1, 0.2196078, 1,
-0.2987893, -0.860887, -1.900985, 0, 1, 0.227451, 1,
-0.2965918, -2.009637, -3.831373, 0, 1, 0.2313726, 1,
-0.293895, 0.01530495, -1.880111, 0, 1, 0.2392157, 1,
-0.2883996, -0.794738, -2.403942, 0, 1, 0.2431373, 1,
-0.2839416, 1.105617, -0.08369635, 0, 1, 0.2509804, 1,
-0.2815479, 1.015572, 0.6212845, 0, 1, 0.254902, 1,
-0.2688437, 1.547648, 1.990933, 0, 1, 0.2627451, 1,
-0.2653672, 0.4579757, -0.3909363, 0, 1, 0.2666667, 1,
-0.2651851, 0.7932884, -0.5348682, 0, 1, 0.2745098, 1,
-0.2614033, 1.155699, 2.491804, 0, 1, 0.2784314, 1,
-0.261117, 0.2519725, -1.038917, 0, 1, 0.2862745, 1,
-0.2602691, -1.103559, -3.35908, 0, 1, 0.2901961, 1,
-0.2562428, -0.3387702, -1.510825, 0, 1, 0.2980392, 1,
-0.2534834, 1.058406, -1.076342, 0, 1, 0.3058824, 1,
-0.2437811, -0.2230629, -2.275837, 0, 1, 0.3098039, 1,
-0.2417097, 1.113483, -1.653458, 0, 1, 0.3176471, 1,
-0.2410761, -0.5497509, -1.341331, 0, 1, 0.3215686, 1,
-0.2396996, -0.3739634, -0.3516585, 0, 1, 0.3294118, 1,
-0.2388072, -1.076555, -2.103292, 0, 1, 0.3333333, 1,
-0.2355716, -0.06370068, -0.3311821, 0, 1, 0.3411765, 1,
-0.230923, -0.6600667, -3.718583, 0, 1, 0.345098, 1,
-0.2293214, -0.09822001, -2.355774, 0, 1, 0.3529412, 1,
-0.2292734, 0.1278077, 0.5132405, 0, 1, 0.3568628, 1,
-0.2263755, -0.7168999, -1.776988, 0, 1, 0.3647059, 1,
-0.2223072, 0.5274661, 0.6409982, 0, 1, 0.3686275, 1,
-0.2205512, -1.705944, -4.685322, 0, 1, 0.3764706, 1,
-0.2187734, 1.008879, -0.1272823, 0, 1, 0.3803922, 1,
-0.2167667, 0.2807359, -1.574038, 0, 1, 0.3882353, 1,
-0.2145624, -0.8657859, -3.283837, 0, 1, 0.3921569, 1,
-0.2109842, -1.836223, -0.721207, 0, 1, 0.4, 1,
-0.2084835, 0.8158027, 0.856823, 0, 1, 0.4078431, 1,
-0.2074056, 0.9287227, 0.7633957, 0, 1, 0.4117647, 1,
-0.2066447, 0.4770827, 1.120935, 0, 1, 0.4196078, 1,
-0.2052898, 0.1617851, -1.587524, 0, 1, 0.4235294, 1,
-0.2041573, -0.01863602, 0.7981718, 0, 1, 0.4313726, 1,
-0.2041473, -0.5261268, -3.241327, 0, 1, 0.4352941, 1,
-0.2030836, -0.1977473, -1.491239, 0, 1, 0.4431373, 1,
-0.2030589, -1.185575, -5.979356, 0, 1, 0.4470588, 1,
-0.1996268, 1.441359, 0.2365465, 0, 1, 0.454902, 1,
-0.1975086, 0.355531, -1.835921, 0, 1, 0.4588235, 1,
-0.1972536, -0.05611303, -0.435675, 0, 1, 0.4666667, 1,
-0.1939483, 0.9775111, -0.8818647, 0, 1, 0.4705882, 1,
-0.1935556, -0.2062117, -1.532068, 0, 1, 0.4784314, 1,
-0.1857294, 0.7107063, -1.785556, 0, 1, 0.4823529, 1,
-0.1788987, -0.4913242, -4.311188, 0, 1, 0.4901961, 1,
-0.178309, 0.001938946, -0.2669606, 0, 1, 0.4941176, 1,
-0.1754357, -0.3029499, -1.438721, 0, 1, 0.5019608, 1,
-0.1719989, -0.7100626, -1.630661, 0, 1, 0.509804, 1,
-0.171514, -0.1744984, -2.164256, 0, 1, 0.5137255, 1,
-0.1630418, -0.7440097, -3.490265, 0, 1, 0.5215687, 1,
-0.1616934, 1.238004, -0.2847959, 0, 1, 0.5254902, 1,
-0.1549934, 1.76087, 1.106778, 0, 1, 0.5333334, 1,
-0.1548348, 0.1501635, -0.135318, 0, 1, 0.5372549, 1,
-0.1482612, 0.2911017, -1.253243, 0, 1, 0.5450981, 1,
-0.1445884, 1.551704, 0.929193, 0, 1, 0.5490196, 1,
-0.143548, -1.222673, -2.465377, 0, 1, 0.5568628, 1,
-0.1427813, 0.5543954, 0.9425437, 0, 1, 0.5607843, 1,
-0.1358555, 1.427637, -0.9893832, 0, 1, 0.5686275, 1,
-0.1313731, -0.6556727, -3.912087, 0, 1, 0.572549, 1,
-0.1291407, -0.6821048, -3.545509, 0, 1, 0.5803922, 1,
-0.124142, -1.201977, -2.447679, 0, 1, 0.5843138, 1,
-0.1136164, 0.37403, -1.127669, 0, 1, 0.5921569, 1,
-0.1118583, 0.1394383, -0.8054777, 0, 1, 0.5960785, 1,
-0.1045364, -1.942181, -3.705647, 0, 1, 0.6039216, 1,
-0.09762184, -0.05462256, -3.355464, 0, 1, 0.6117647, 1,
-0.0972102, 1.247485, 0.9616459, 0, 1, 0.6156863, 1,
-0.09555198, -0.1386205, -2.193273, 0, 1, 0.6235294, 1,
-0.09502302, -0.3869708, -4.676476, 0, 1, 0.627451, 1,
-0.09390429, -2.799131, -3.606223, 0, 1, 0.6352941, 1,
-0.08930385, -0.693422, -1.782504, 0, 1, 0.6392157, 1,
-0.08538593, -0.6051808, -2.485588, 0, 1, 0.6470588, 1,
-0.06687131, -0.1323913, -3.608051, 0, 1, 0.6509804, 1,
-0.06538855, 0.5707861, -1.926539, 0, 1, 0.6588235, 1,
-0.06147124, -0.672415, -4.209331, 0, 1, 0.6627451, 1,
-0.05426272, 0.950143, 0.4291981, 0, 1, 0.6705883, 1,
-0.05365545, -1.468578, -1.345334, 0, 1, 0.6745098, 1,
-0.05125317, 0.4808093, -0.5116805, 0, 1, 0.682353, 1,
-0.04482583, -1.954089, -2.780474, 0, 1, 0.6862745, 1,
-0.04286369, 0.01287572, -2.498452, 0, 1, 0.6941177, 1,
-0.04132583, -0.5904243, -3.68035, 0, 1, 0.7019608, 1,
-0.03966793, 0.3234229, 0.2191906, 0, 1, 0.7058824, 1,
-0.03661519, 0.9920728, -0.7230037, 0, 1, 0.7137255, 1,
-0.03213327, -0.01861065, -2.267502, 0, 1, 0.7176471, 1,
-0.02661643, -0.5365071, -2.52, 0, 1, 0.7254902, 1,
-0.02419481, -0.5559959, -2.741489, 0, 1, 0.7294118, 1,
-0.02305566, 0.5498314, 0.0317725, 0, 1, 0.7372549, 1,
-0.01560868, -1.064254, -2.772302, 0, 1, 0.7411765, 1,
-0.01395319, -0.7437464, -4.221908, 0, 1, 0.7490196, 1,
-0.01378262, 0.5167731, 0.7514952, 0, 1, 0.7529412, 1,
-0.01121183, -0.7520006, -2.603482, 0, 1, 0.7607843, 1,
-0.01064255, -0.4689023, -2.442894, 0, 1, 0.7647059, 1,
-0.01058269, 0.6945395, 1.049963, 0, 1, 0.772549, 1,
-0.008759498, 0.307135, 0.5175267, 0, 1, 0.7764706, 1,
0.002459333, -0.3511309, 3.913226, 0, 1, 0.7843137, 1,
0.002732765, -1.421466, 2.636631, 0, 1, 0.7882353, 1,
0.006142313, 1.600582, -0.6478058, 0, 1, 0.7960784, 1,
0.007272062, -0.1503483, 1.230687, 0, 1, 0.8039216, 1,
0.007472252, -1.261473, 2.933436, 0, 1, 0.8078431, 1,
0.007844897, 0.09340817, 2.78606, 0, 1, 0.8156863, 1,
0.0080329, -0.4402255, 4.056552, 0, 1, 0.8196079, 1,
0.00917073, -0.5466215, 3.776073, 0, 1, 0.827451, 1,
0.009371368, 0.2690295, 1.147188, 0, 1, 0.8313726, 1,
0.0156514, 0.7319766, -0.7123669, 0, 1, 0.8392157, 1,
0.01662777, 1.124244, -0.8698587, 0, 1, 0.8431373, 1,
0.0167491, 1.426174, 2.683837, 0, 1, 0.8509804, 1,
0.01691462, -0.885023, 3.793387, 0, 1, 0.854902, 1,
0.01691783, -0.3011613, 3.582481, 0, 1, 0.8627451, 1,
0.02149617, 0.7648575, -0.3797791, 0, 1, 0.8666667, 1,
0.02351166, -1.834422, 1.938876, 0, 1, 0.8745098, 1,
0.02735011, -0.8934045, 2.764994, 0, 1, 0.8784314, 1,
0.0296946, -0.06042021, 2.239191, 0, 1, 0.8862745, 1,
0.03017769, -0.3452854, 3.953652, 0, 1, 0.8901961, 1,
0.03425919, -0.1395587, 2.443566, 0, 1, 0.8980392, 1,
0.03571365, 1.596087, -1.427361, 0, 1, 0.9058824, 1,
0.0361069, 2.17686, -0.1350252, 0, 1, 0.9098039, 1,
0.03684971, -1.298255, 3.572352, 0, 1, 0.9176471, 1,
0.03785278, 0.8998988, -0.0330941, 0, 1, 0.9215686, 1,
0.03825513, 0.9998723, 1.822087, 0, 1, 0.9294118, 1,
0.0383392, -0.5207289, 4.452934, 0, 1, 0.9333333, 1,
0.03854464, -0.2664999, 3.979513, 0, 1, 0.9411765, 1,
0.04094587, -0.3474178, 4.837062, 0, 1, 0.945098, 1,
0.04212942, -1.105369, 3.334603, 0, 1, 0.9529412, 1,
0.04349365, 0.8537719, -0.341445, 0, 1, 0.9568627, 1,
0.04687529, 1.044108, -0.003181831, 0, 1, 0.9647059, 1,
0.04752258, -0.2325748, 3.925052, 0, 1, 0.9686275, 1,
0.04842069, 0.8869671, -0.1861182, 0, 1, 0.9764706, 1,
0.04845721, -0.912514, 2.809973, 0, 1, 0.9803922, 1,
0.04885875, 0.4356733, -0.1237157, 0, 1, 0.9882353, 1,
0.04937534, -0.4946443, 1.242361, 0, 1, 0.9921569, 1,
0.05230696, 0.4988419, -0.4124666, 0, 1, 1, 1,
0.05418276, 1.229492, -0.9196981, 0, 0.9921569, 1, 1,
0.05593542, 0.6233103, -1.287741, 0, 0.9882353, 1, 1,
0.05676354, -0.526526, 2.652828, 0, 0.9803922, 1, 1,
0.05974128, -0.1452193, 2.990281, 0, 0.9764706, 1, 1,
0.06214712, -0.2738319, 2.555721, 0, 0.9686275, 1, 1,
0.06441852, 0.2504384, 0.7903762, 0, 0.9647059, 1, 1,
0.0650828, 0.7940487, 0.273646, 0, 0.9568627, 1, 1,
0.0673264, -0.5253032, 3.969929, 0, 0.9529412, 1, 1,
0.06742034, -1.778156, 3.08979, 0, 0.945098, 1, 1,
0.07138593, 0.5933048, 1.058495, 0, 0.9411765, 1, 1,
0.07337439, -1.517217, 3.026306, 0, 0.9333333, 1, 1,
0.07706083, -0.7686867, 3.535881, 0, 0.9294118, 1, 1,
0.07721774, 1.301339, 0.3284444, 0, 0.9215686, 1, 1,
0.08605564, 0.3688343, 0.5322443, 0, 0.9176471, 1, 1,
0.08633941, -0.5270659, 2.672948, 0, 0.9098039, 1, 1,
0.08744616, -1.722501, 2.58195, 0, 0.9058824, 1, 1,
0.08744903, -1.244587, 3.189635, 0, 0.8980392, 1, 1,
0.09001953, 0.7071978, 1.337784, 0, 0.8901961, 1, 1,
0.09359308, 0.5601994, -1.065392, 0, 0.8862745, 1, 1,
0.09376437, 1.368566, -2.545011, 0, 0.8784314, 1, 1,
0.0960312, -1.282443, 2.526558, 0, 0.8745098, 1, 1,
0.09951609, -1.731413, 2.461405, 0, 0.8666667, 1, 1,
0.1050792, 0.5203403, 0.744161, 0, 0.8627451, 1, 1,
0.1074519, 0.367359, -0.5175624, 0, 0.854902, 1, 1,
0.1076831, 0.4846467, -0.7340448, 0, 0.8509804, 1, 1,
0.1081583, 0.2130179, 0.1632696, 0, 0.8431373, 1, 1,
0.1127061, 1.295496, 1.483097, 0, 0.8392157, 1, 1,
0.1180861, 0.7673375, 0.7158771, 0, 0.8313726, 1, 1,
0.11843, 0.01525929, 2.143554, 0, 0.827451, 1, 1,
0.1247879, -1.074869, 4.379555, 0, 0.8196079, 1, 1,
0.1251832, 0.2657858, 1.869109, 0, 0.8156863, 1, 1,
0.1272238, -1.191739, 1.382392, 0, 0.8078431, 1, 1,
0.1285519, -0.02893155, 1.112512, 0, 0.8039216, 1, 1,
0.1316098, 0.4588603, -1.540273, 0, 0.7960784, 1, 1,
0.1330941, -0.1490205, 4.301257, 0, 0.7882353, 1, 1,
0.1374346, 0.6908233, -0.9945152, 0, 0.7843137, 1, 1,
0.137942, -0.1215553, 1.802622, 0, 0.7764706, 1, 1,
0.138509, 1.034546, -0.5812219, 0, 0.772549, 1, 1,
0.1428366, -0.7649035, 3.456626, 0, 0.7647059, 1, 1,
0.1446208, -0.1063087, 3.608297, 0, 0.7607843, 1, 1,
0.1452075, -1.106073, 3.374635, 0, 0.7529412, 1, 1,
0.1471519, 0.4017416, 0.4494861, 0, 0.7490196, 1, 1,
0.1485731, 0.2759068, 0.6665184, 0, 0.7411765, 1, 1,
0.1491702, 0.1799683, 1.874584, 0, 0.7372549, 1, 1,
0.1510389, -0.8578994, 3.803205, 0, 0.7294118, 1, 1,
0.151942, -1.891513, 3.723811, 0, 0.7254902, 1, 1,
0.1529286, -0.6220908, 0.2424502, 0, 0.7176471, 1, 1,
0.1530284, 0.7226999, -0.2170201, 0, 0.7137255, 1, 1,
0.1576279, 1.511732, 0.7868435, 0, 0.7058824, 1, 1,
0.1579178, -0.7683473, 2.691185, 0, 0.6980392, 1, 1,
0.1585535, 0.04497186, 0.7272202, 0, 0.6941177, 1, 1,
0.1605668, 0.3372057, -0.7103309, 0, 0.6862745, 1, 1,
0.1612763, -0.8148522, 3.380174, 0, 0.682353, 1, 1,
0.1628906, -0.4690485, 3.364889, 0, 0.6745098, 1, 1,
0.1630603, 0.582705, 2.580322, 0, 0.6705883, 1, 1,
0.1701221, -0.5943394, 2.959307, 0, 0.6627451, 1, 1,
0.1710884, 0.5322102, 0.7236218, 0, 0.6588235, 1, 1,
0.1713771, 0.7111841, 0.3311006, 0, 0.6509804, 1, 1,
0.1742057, -1.949217, 3.083274, 0, 0.6470588, 1, 1,
0.1842715, 0.3347442, 1.029292, 0, 0.6392157, 1, 1,
0.1846438, -0.07535624, 2.480502, 0, 0.6352941, 1, 1,
0.1856345, 2.06288, 1.5903, 0, 0.627451, 1, 1,
0.1857357, 1.612083, -0.8396062, 0, 0.6235294, 1, 1,
0.1866965, 0.2295548, 0.9605784, 0, 0.6156863, 1, 1,
0.1874662, 1.689739, -1.001768, 0, 0.6117647, 1, 1,
0.1941584, -1.801498, 2.545235, 0, 0.6039216, 1, 1,
0.1966483, 0.6181859, 0.5220888, 0, 0.5960785, 1, 1,
0.1973125, -0.4707171, 3.242089, 0, 0.5921569, 1, 1,
0.2009105, 0.09529235, 1.503623, 0, 0.5843138, 1, 1,
0.2023493, 0.07426585, 2.573375, 0, 0.5803922, 1, 1,
0.203872, -0.7440671, 2.429184, 0, 0.572549, 1, 1,
0.2046987, 0.09095787, 0.6110454, 0, 0.5686275, 1, 1,
0.2073652, 1.677768, -0.8278955, 0, 0.5607843, 1, 1,
0.207579, -1.230695, 2.594626, 0, 0.5568628, 1, 1,
0.2094365, 0.1276342, 1.708644, 0, 0.5490196, 1, 1,
0.2143345, 0.04439598, 2.012438, 0, 0.5450981, 1, 1,
0.215506, 0.9411455, 0.7262438, 0, 0.5372549, 1, 1,
0.2191704, 0.8421965, -0.02418229, 0, 0.5333334, 1, 1,
0.2241008, -1.263612, 2.487848, 0, 0.5254902, 1, 1,
0.2292207, -1.433535, 4.845584, 0, 0.5215687, 1, 1,
0.2294725, 0.3692188, -0.3504724, 0, 0.5137255, 1, 1,
0.234561, -0.1097874, 1.850035, 0, 0.509804, 1, 1,
0.2362992, 0.1843581, 1.739225, 0, 0.5019608, 1, 1,
0.2365559, -0.517024, 4.52861, 0, 0.4941176, 1, 1,
0.2381852, 0.1265986, 2.671493, 0, 0.4901961, 1, 1,
0.2466256, 0.4341591, 1.135266, 0, 0.4823529, 1, 1,
0.2484738, -0.8112122, 3.90391, 0, 0.4784314, 1, 1,
0.2502351, -0.01946688, 1.226867, 0, 0.4705882, 1, 1,
0.2503085, 1.284808, -0.08406901, 0, 0.4666667, 1, 1,
0.2509667, 1.757813, 0.2650457, 0, 0.4588235, 1, 1,
0.2514586, -1.191745, 3.962455, 0, 0.454902, 1, 1,
0.2525267, -1.444459, 2.402673, 0, 0.4470588, 1, 1,
0.2534454, -1.161749, 2.092645, 0, 0.4431373, 1, 1,
0.2560514, 1.789351, 1.046306, 0, 0.4352941, 1, 1,
0.2581349, -0.7933089, 2.748959, 0, 0.4313726, 1, 1,
0.25906, 0.6576319, -0.1209965, 0, 0.4235294, 1, 1,
0.2600254, 0.1885111, 1.525639, 0, 0.4196078, 1, 1,
0.261279, -0.2042733, 3.523431, 0, 0.4117647, 1, 1,
0.272283, -0.05042791, 1.403162, 0, 0.4078431, 1, 1,
0.2763421, 0.2965387, 1.836583, 0, 0.4, 1, 1,
0.2783062, 2.320007, 0.5757248, 0, 0.3921569, 1, 1,
0.2830805, -0.9318764, 4.295875, 0, 0.3882353, 1, 1,
0.2849342, -0.2046264, 1.604537, 0, 0.3803922, 1, 1,
0.2876285, 0.02776563, 0.5164246, 0, 0.3764706, 1, 1,
0.2899193, 0.4385905, 0.2482716, 0, 0.3686275, 1, 1,
0.2903264, 1.072149, 2.769491, 0, 0.3647059, 1, 1,
0.2921999, -0.9621694, 3.45822, 0, 0.3568628, 1, 1,
0.2932208, 1.218121, -0.4839982, 0, 0.3529412, 1, 1,
0.2933601, -2.969789, 3.892744, 0, 0.345098, 1, 1,
0.2942164, 0.7368819, 1.582443, 0, 0.3411765, 1, 1,
0.2949758, -0.4888669, 4.386566, 0, 0.3333333, 1, 1,
0.296317, -0.6045328, 1.657603, 0, 0.3294118, 1, 1,
0.3030744, -1.416748, 3.808888, 0, 0.3215686, 1, 1,
0.3047359, -0.3981994, 1.54609, 0, 0.3176471, 1, 1,
0.3121613, 0.8408886, 0.8422318, 0, 0.3098039, 1, 1,
0.3169166, -1.201741, 1.363711, 0, 0.3058824, 1, 1,
0.3177064, -2.232758, 4.323037, 0, 0.2980392, 1, 1,
0.3179039, 0.4193301, 0.7366344, 0, 0.2901961, 1, 1,
0.3264079, -0.008415055, 1.81879, 0, 0.2862745, 1, 1,
0.3275435, -0.007559545, 2.0674, 0, 0.2784314, 1, 1,
0.3342543, -0.3407558, 2.73969, 0, 0.2745098, 1, 1,
0.3344644, -0.6126962, 1.903243, 0, 0.2666667, 1, 1,
0.3389287, -1.642111, 3.287864, 0, 0.2627451, 1, 1,
0.3393142, 0.6301079, 0.6515531, 0, 0.254902, 1, 1,
0.3400381, -1.501365, 3.305943, 0, 0.2509804, 1, 1,
0.3404192, 0.9502321, 0.4645401, 0, 0.2431373, 1, 1,
0.3410737, -1.490438, 1.553724, 0, 0.2392157, 1, 1,
0.3460428, 0.3859583, 0.9930844, 0, 0.2313726, 1, 1,
0.3476529, 0.7353793, -0.5371751, 0, 0.227451, 1, 1,
0.3509078, 0.6385926, 1.134426, 0, 0.2196078, 1, 1,
0.3525126, 1.802504, -0.2700449, 0, 0.2156863, 1, 1,
0.3567765, 0.2859163, 0.5105174, 0, 0.2078431, 1, 1,
0.3571754, 0.5028697, -0.0528901, 0, 0.2039216, 1, 1,
0.3593193, 0.0634052, 1.258742, 0, 0.1960784, 1, 1,
0.3625143, -0.1554028, 3.35372, 0, 0.1882353, 1, 1,
0.3625317, 0.855826, 1.788363, 0, 0.1843137, 1, 1,
0.3632988, -0.5471594, 3.78796, 0, 0.1764706, 1, 1,
0.3662197, -0.03931496, 1.288804, 0, 0.172549, 1, 1,
0.3669423, 0.5885183, 0.5490944, 0, 0.1647059, 1, 1,
0.3710547, 0.221683, 0.6547335, 0, 0.1607843, 1, 1,
0.3747068, 1.467618, 0.4839888, 0, 0.1529412, 1, 1,
0.3783354, 0.2293872, 0.512045, 0, 0.1490196, 1, 1,
0.3794504, -0.5187258, 3.863302, 0, 0.1411765, 1, 1,
0.3796561, 0.3411857, 0.6428376, 0, 0.1372549, 1, 1,
0.3821099, 0.8948757, -0.4047574, 0, 0.1294118, 1, 1,
0.3823886, -1.364377, 4.582079, 0, 0.1254902, 1, 1,
0.3887715, 1.601803, 0.3767059, 0, 0.1176471, 1, 1,
0.3897345, -0.5492997, 3.282999, 0, 0.1137255, 1, 1,
0.4000051, -0.4109248, 1.559199, 0, 0.1058824, 1, 1,
0.4038841, -0.05429203, 1.507958, 0, 0.09803922, 1, 1,
0.4053373, 0.1942618, 0.373062, 0, 0.09411765, 1, 1,
0.4066342, -0.07713944, 3.498174, 0, 0.08627451, 1, 1,
0.407934, -1.873163, 3.63507, 0, 0.08235294, 1, 1,
0.4096943, 0.5504293, 0.04483495, 0, 0.07450981, 1, 1,
0.4138271, 1.48705, 0.4052597, 0, 0.07058824, 1, 1,
0.4174495, -0.05459503, 3.731425, 0, 0.0627451, 1, 1,
0.4186214, 0.3503612, 0.6242082, 0, 0.05882353, 1, 1,
0.4188968, -0.007454573, 0.6872545, 0, 0.05098039, 1, 1,
0.4235577, 0.1448827, 2.375547, 0, 0.04705882, 1, 1,
0.4247756, -1.29624, 1.175042, 0, 0.03921569, 1, 1,
0.424888, 0.8358146, 1.282127, 0, 0.03529412, 1, 1,
0.4262361, -0.003415405, 1.035273, 0, 0.02745098, 1, 1,
0.4279264, -1.514536, 4.396346, 0, 0.02352941, 1, 1,
0.4303724, 0.05000195, 2.10659, 0, 0.01568628, 1, 1,
0.4347199, 0.3264591, 1.107777, 0, 0.01176471, 1, 1,
0.4368933, -0.1370281, 1.273517, 0, 0.003921569, 1, 1,
0.4370993, -1.373299, 3.550171, 0.003921569, 0, 1, 1,
0.4371983, 1.00968, -0.5293863, 0.007843138, 0, 1, 1,
0.4376194, -0.2597653, 2.185809, 0.01568628, 0, 1, 1,
0.443296, -1.174285, 2.384253, 0.01960784, 0, 1, 1,
0.4438276, -0.1171219, 0.7398347, 0.02745098, 0, 1, 1,
0.4453495, 1.66275, 0.4650111, 0.03137255, 0, 1, 1,
0.4472305, -0.7170015, 1.461916, 0.03921569, 0, 1, 1,
0.4507442, 0.1971647, 1.450308, 0.04313726, 0, 1, 1,
0.4578794, -0.4828313, 2.064787, 0.05098039, 0, 1, 1,
0.4579659, -1.053903, 1.799285, 0.05490196, 0, 1, 1,
0.4588466, 1.559074, 3.343698, 0.0627451, 0, 1, 1,
0.4601907, 0.3050068, 1.211124, 0.06666667, 0, 1, 1,
0.460343, -0.3614095, 1.149587, 0.07450981, 0, 1, 1,
0.4647511, 0.1228021, 2.097316, 0.07843138, 0, 1, 1,
0.4648076, -0.3874043, 2.171834, 0.08627451, 0, 1, 1,
0.4650129, -0.8128348, 3.854404, 0.09019608, 0, 1, 1,
0.4667774, 0.3191544, 1.915542, 0.09803922, 0, 1, 1,
0.4671661, -0.1587514, 5.25508, 0.1058824, 0, 1, 1,
0.4722361, -1.766847, 3.729291, 0.1098039, 0, 1, 1,
0.4736275, -0.3532171, 2.901652, 0.1176471, 0, 1, 1,
0.4758332, -1.675602, 2.937628, 0.1215686, 0, 1, 1,
0.4882788, -0.1902009, 1.440696, 0.1294118, 0, 1, 1,
0.4912375, 0.8110425, -0.3251055, 0.1333333, 0, 1, 1,
0.4954129, 0.7524505, 0.1576375, 0.1411765, 0, 1, 1,
0.4991144, 0.8989332, -0.301598, 0.145098, 0, 1, 1,
0.5010103, 1.120986, 0.07442256, 0.1529412, 0, 1, 1,
0.5013098, 0.3340622, 1.699351, 0.1568628, 0, 1, 1,
0.5029452, 0.4148262, 0.8350106, 0.1647059, 0, 1, 1,
0.5170048, 1.368238, 0.502449, 0.1686275, 0, 1, 1,
0.5177784, -0.9310063, 1.827458, 0.1764706, 0, 1, 1,
0.5184397, 0.6058939, 0.1709332, 0.1803922, 0, 1, 1,
0.5201519, 1.312701, -0.4796079, 0.1882353, 0, 1, 1,
0.5211195, 0.03904275, 2.082509, 0.1921569, 0, 1, 1,
0.5224721, 0.4740358, 0.7225624, 0.2, 0, 1, 1,
0.5293003, 0.2473558, 0.4043619, 0.2078431, 0, 1, 1,
0.5373298, -0.04482248, 2.810837, 0.2117647, 0, 1, 1,
0.5381613, 0.6851434, 0.6666274, 0.2196078, 0, 1, 1,
0.5409787, -0.5926822, 3.157218, 0.2235294, 0, 1, 1,
0.541442, -1.056147, 3.064436, 0.2313726, 0, 1, 1,
0.5421908, 0.5195216, 2.214265, 0.2352941, 0, 1, 1,
0.5425895, 0.3541875, 2.505645, 0.2431373, 0, 1, 1,
0.5594013, -0.08110904, 1.809236, 0.2470588, 0, 1, 1,
0.5611444, -0.2423383, 0.8005412, 0.254902, 0, 1, 1,
0.5611854, -0.637294, 3.774129, 0.2588235, 0, 1, 1,
0.5632095, -1.126441, 2.51588, 0.2666667, 0, 1, 1,
0.5634964, -0.3933131, 2.397543, 0.2705882, 0, 1, 1,
0.5701799, -0.3099264, -0.00514317, 0.2784314, 0, 1, 1,
0.5714053, -1.869826, 2.731848, 0.282353, 0, 1, 1,
0.5721795, 0.6628526, 1.010508, 0.2901961, 0, 1, 1,
0.5743204, 0.3736266, -0.9436731, 0.2941177, 0, 1, 1,
0.5768059, 2.282933, -0.6566881, 0.3019608, 0, 1, 1,
0.5790063, -0.5051536, 1.097496, 0.3098039, 0, 1, 1,
0.5811806, -1.487359, 2.599637, 0.3137255, 0, 1, 1,
0.5828098, -0.957009, 3.302711, 0.3215686, 0, 1, 1,
0.5901374, 0.5896794, 0.3519899, 0.3254902, 0, 1, 1,
0.5902039, 0.2821569, 1.695908, 0.3333333, 0, 1, 1,
0.5994959, -0.8078527, 2.464154, 0.3372549, 0, 1, 1,
0.6019161, 0.03945005, 2.447175, 0.345098, 0, 1, 1,
0.6049044, -1.533005, 2.749426, 0.3490196, 0, 1, 1,
0.6097412, -0.6101935, 1.563516, 0.3568628, 0, 1, 1,
0.6132383, 0.9040502, 0.06615832, 0.3607843, 0, 1, 1,
0.6153028, -0.1206313, 1.946104, 0.3686275, 0, 1, 1,
0.6160125, 0.1921484, -0.4382993, 0.372549, 0, 1, 1,
0.6169015, -2.479165, 1.228043, 0.3803922, 0, 1, 1,
0.6227999, -0.08091864, 0.2389638, 0.3843137, 0, 1, 1,
0.6270577, 0.1600358, -0.6252395, 0.3921569, 0, 1, 1,
0.6361755, -0.4280734, 3.756296, 0.3960784, 0, 1, 1,
0.6415791, 0.5004262, -0.3285411, 0.4039216, 0, 1, 1,
0.6444064, -0.2387168, 3.615553, 0.4117647, 0, 1, 1,
0.6484866, -0.5705143, 2.80605, 0.4156863, 0, 1, 1,
0.6501319, -0.3067473, 1.69187, 0.4235294, 0, 1, 1,
0.6557171, -0.351498, 1.219892, 0.427451, 0, 1, 1,
0.6565359, -0.3368289, 1.288901, 0.4352941, 0, 1, 1,
0.6572911, 1.28378, -0.05704795, 0.4392157, 0, 1, 1,
0.6591473, -0.7157442, 2.723114, 0.4470588, 0, 1, 1,
0.6640288, -1.049413, 3.89713, 0.4509804, 0, 1, 1,
0.6644725, -0.9610679, 2.090083, 0.4588235, 0, 1, 1,
0.6688262, 0.7838218, 0.4751968, 0.4627451, 0, 1, 1,
0.6720948, 1.822895, -1.147959, 0.4705882, 0, 1, 1,
0.6740145, 0.3263655, 1.456053, 0.4745098, 0, 1, 1,
0.6769703, -1.88711, 4.676985, 0.4823529, 0, 1, 1,
0.6824711, -0.1697217, 0.6733087, 0.4862745, 0, 1, 1,
0.691249, -0.1746701, 2.875905, 0.4941176, 0, 1, 1,
0.7005973, -0.3947974, 1.880463, 0.5019608, 0, 1, 1,
0.7057648, 0.4843692, 1.122674, 0.5058824, 0, 1, 1,
0.7077425, -1.067782, 3.331789, 0.5137255, 0, 1, 1,
0.7078673, 1.512415, -0.2007781, 0.5176471, 0, 1, 1,
0.7126467, 0.08235901, 1.058164, 0.5254902, 0, 1, 1,
0.7126922, -0.1150255, 1.661946, 0.5294118, 0, 1, 1,
0.7162608, -0.108324, 0.7820776, 0.5372549, 0, 1, 1,
0.7176583, -0.05262549, 1.25, 0.5411765, 0, 1, 1,
0.7184018, -1.162504, 4.28383, 0.5490196, 0, 1, 1,
0.7204729, 0.8088893, 2.007247, 0.5529412, 0, 1, 1,
0.7218839, 1.040401, 0.8279855, 0.5607843, 0, 1, 1,
0.7247838, -0.6862984, 2.122506, 0.5647059, 0, 1, 1,
0.7258553, 0.725314, 1.802166, 0.572549, 0, 1, 1,
0.7300223, 1.102138, 4.139316, 0.5764706, 0, 1, 1,
0.7300966, 0.9646833, 1.242519, 0.5843138, 0, 1, 1,
0.7375731, -0.06043427, 4.44857, 0.5882353, 0, 1, 1,
0.7437729, -0.5637167, 1.874934, 0.5960785, 0, 1, 1,
0.7477428, -1.315746, 3.057694, 0.6039216, 0, 1, 1,
0.7509108, -0.1482694, 1.880501, 0.6078432, 0, 1, 1,
0.751412, -0.1996247, 1.60949, 0.6156863, 0, 1, 1,
0.7525641, -0.3560203, 2.061018, 0.6196079, 0, 1, 1,
0.7569845, -0.4793964, 0.9222774, 0.627451, 0, 1, 1,
0.7616972, 0.09793779, 2.495393, 0.6313726, 0, 1, 1,
0.769254, 0.2987787, 0.740095, 0.6392157, 0, 1, 1,
0.7774705, -0.3059458, 0.6625315, 0.6431373, 0, 1, 1,
0.7815789, 0.08794233, -0.1294214, 0.6509804, 0, 1, 1,
0.7912113, -0.4916592, 1.841902, 0.654902, 0, 1, 1,
0.7922125, 1.918404, -0.4852181, 0.6627451, 0, 1, 1,
0.8049871, 0.05717336, 0.6683195, 0.6666667, 0, 1, 1,
0.8081156, -0.8722276, 3.215258, 0.6745098, 0, 1, 1,
0.8112559, 0.172276, 1.410545, 0.6784314, 0, 1, 1,
0.8144626, -0.4788157, 1.050796, 0.6862745, 0, 1, 1,
0.8145705, 0.1565469, 0.9317969, 0.6901961, 0, 1, 1,
0.8155305, 0.3382335, 0.7527806, 0.6980392, 0, 1, 1,
0.8174649, 1.337173, -0.854351, 0.7058824, 0, 1, 1,
0.829687, -0.5967141, 1.480742, 0.7098039, 0, 1, 1,
0.8298234, -0.4504299, 2.419897, 0.7176471, 0, 1, 1,
0.837779, 0.08836234, 1.186449, 0.7215686, 0, 1, 1,
0.8414476, -0.02514221, 2.738545, 0.7294118, 0, 1, 1,
0.8431308, 0.4380296, 0.5194187, 0.7333333, 0, 1, 1,
0.8433904, 1.576017, 0.8448552, 0.7411765, 0, 1, 1,
0.84622, 1.541893, 0.1512485, 0.7450981, 0, 1, 1,
0.8544608, 0.4813482, 0.9805942, 0.7529412, 0, 1, 1,
0.8571084, -0.4868592, 2.626522, 0.7568628, 0, 1, 1,
0.8578477, -1.115265, 2.991626, 0.7647059, 0, 1, 1,
0.8615177, 1.85748, -1.612188, 0.7686275, 0, 1, 1,
0.8627816, 0.7610719, -0.1976881, 0.7764706, 0, 1, 1,
0.8636285, -1.241236, 0.3008431, 0.7803922, 0, 1, 1,
0.8661284, -0.09735923, 3.309821, 0.7882353, 0, 1, 1,
0.8673654, 0.5581806, 1.241424, 0.7921569, 0, 1, 1,
0.8777307, 0.08977885, 3.821146, 0.8, 0, 1, 1,
0.8825958, -0.8822007, 2.209572, 0.8078431, 0, 1, 1,
0.8868588, 0.248093, 1.813431, 0.8117647, 0, 1, 1,
0.8898988, -0.2339273, 3.233199, 0.8196079, 0, 1, 1,
0.8972367, 0.4061169, -1.160489, 0.8235294, 0, 1, 1,
0.901453, 0.4749251, 1.972686, 0.8313726, 0, 1, 1,
0.9028293, -1.424881, 3.279862, 0.8352941, 0, 1, 1,
0.9096171, -0.2537928, 1.783233, 0.8431373, 0, 1, 1,
0.918162, -1.850994, 3.774313, 0.8470588, 0, 1, 1,
0.9247989, 0.3210383, 1.738903, 0.854902, 0, 1, 1,
0.9285336, 1.106462, 0.05902523, 0.8588235, 0, 1, 1,
0.9305317, -0.7511572, 2.108383, 0.8666667, 0, 1, 1,
0.9306426, -2.650524, 2.808265, 0.8705882, 0, 1, 1,
0.9316902, -0.9421324, 4.203806, 0.8784314, 0, 1, 1,
0.9333664, 1.290474, 1.281887, 0.8823529, 0, 1, 1,
0.9374292, -0.7883125, 2.515306, 0.8901961, 0, 1, 1,
0.9424672, 2.56547, -2.399791, 0.8941177, 0, 1, 1,
0.9452422, 0.2824801, -0.8401712, 0.9019608, 0, 1, 1,
0.9523095, -2.039869, 2.934282, 0.9098039, 0, 1, 1,
0.960507, 0.6482826, -0.9019705, 0.9137255, 0, 1, 1,
0.9612316, 0.5000688, 0.6532258, 0.9215686, 0, 1, 1,
0.9621873, 2.449592, -0.3590315, 0.9254902, 0, 1, 1,
0.9678549, 0.9395761, 0.238062, 0.9333333, 0, 1, 1,
0.9705309, 0.5824655, 1.470231, 0.9372549, 0, 1, 1,
0.9716232, 1.116245, 0.3023339, 0.945098, 0, 1, 1,
0.9766795, 0.7741688, 2.075611, 0.9490196, 0, 1, 1,
0.9815583, -0.485515, 3.508857, 0.9568627, 0, 1, 1,
0.9888716, -0.03651465, 2.05214, 0.9607843, 0, 1, 1,
0.9896785, -0.9473819, 2.151519, 0.9686275, 0, 1, 1,
0.9907402, -0.0009141716, 1.863462, 0.972549, 0, 1, 1,
0.9949537, 0.2733979, 1.757126, 0.9803922, 0, 1, 1,
0.997722, 0.459977, 1.514765, 0.9843137, 0, 1, 1,
1.001467, -0.8294214, 1.681896, 0.9921569, 0, 1, 1,
1.004961, -0.5001643, 1.086342, 0.9960784, 0, 1, 1,
1.005887, -0.9411859, 4.389949, 1, 0, 0.9960784, 1,
1.011139, -0.07871066, 1.650515, 1, 0, 0.9882353, 1,
1.012771, -0.04797823, -0.01649985, 1, 0, 0.9843137, 1,
1.013593, -0.08776704, -0.4174292, 1, 0, 0.9764706, 1,
1.018111, 0.6571913, -0.1164383, 1, 0, 0.972549, 1,
1.018719, -1.443355, 3.282196, 1, 0, 0.9647059, 1,
1.020974, 0.9020405, 2.147592, 1, 0, 0.9607843, 1,
1.025213, -1.063643, 3.884511, 1, 0, 0.9529412, 1,
1.034117, 1.826477, -1.323415, 1, 0, 0.9490196, 1,
1.047575, -0.1177022, 3.03095, 1, 0, 0.9411765, 1,
1.053827, 0.6904626, -0.8199416, 1, 0, 0.9372549, 1,
1.059027, -0.547707, 3.125418, 1, 0, 0.9294118, 1,
1.059069, 1.477541, 0.1458804, 1, 0, 0.9254902, 1,
1.062379, -0.4806569, 3.451236, 1, 0, 0.9176471, 1,
1.063582, 1.266882, 1.216589, 1, 0, 0.9137255, 1,
1.07181, 0.1223493, 0.868651, 1, 0, 0.9058824, 1,
1.110138, -0.7450317, 1.845125, 1, 0, 0.9019608, 1,
1.112509, 1.522818, 2.089663, 1, 0, 0.8941177, 1,
1.114108, -0.7649053, 2.95493, 1, 0, 0.8862745, 1,
1.115528, 1.400438, 1.719524, 1, 0, 0.8823529, 1,
1.118242, -1.462002, 2.545344, 1, 0, 0.8745098, 1,
1.119428, -0.3910015, 2.983314, 1, 0, 0.8705882, 1,
1.132064, -0.7090724, 1.397268, 1, 0, 0.8627451, 1,
1.133378, -1.646218, 0.7055146, 1, 0, 0.8588235, 1,
1.136846, 1.599744, 0.3361489, 1, 0, 0.8509804, 1,
1.138831, 0.3286284, 1.368616, 1, 0, 0.8470588, 1,
1.141775, -2.042622, 2.535002, 1, 0, 0.8392157, 1,
1.146941, -0.5948312, 1.211648, 1, 0, 0.8352941, 1,
1.147977, 1.002063, 0.9603454, 1, 0, 0.827451, 1,
1.151314, -0.6384351, 2.952883, 1, 0, 0.8235294, 1,
1.15541, -1.252518, 2.473464, 1, 0, 0.8156863, 1,
1.155977, -0.3578874, 2.767608, 1, 0, 0.8117647, 1,
1.160256, 1.801993, 0.4869764, 1, 0, 0.8039216, 1,
1.161849, 0.6531142, 1.887164, 1, 0, 0.7960784, 1,
1.16387, 0.7256892, 0.1862912, 1, 0, 0.7921569, 1,
1.16457, 0.3226359, 0.7092276, 1, 0, 0.7843137, 1,
1.166765, 0.4412865, 2.447299, 1, 0, 0.7803922, 1,
1.170809, -0.01496912, 1.132416, 1, 0, 0.772549, 1,
1.173881, -2.187943, 0.7770987, 1, 0, 0.7686275, 1,
1.176297, -0.5734416, 1.093184, 1, 0, 0.7607843, 1,
1.181128, -0.007227594, 1.928253, 1, 0, 0.7568628, 1,
1.182547, 0.956996, -1.975983, 1, 0, 0.7490196, 1,
1.189713, 0.4123571, 2.011657, 1, 0, 0.7450981, 1,
1.198161, -0.9557231, 2.541071, 1, 0, 0.7372549, 1,
1.201823, -0.3083781, 1.446237, 1, 0, 0.7333333, 1,
1.204802, 1.46639, 2.0934, 1, 0, 0.7254902, 1,
1.21092, -0.3646262, 0.9886488, 1, 0, 0.7215686, 1,
1.212327, 0.9165992, 0.2860386, 1, 0, 0.7137255, 1,
1.218514, 1.149004, 0.2001237, 1, 0, 0.7098039, 1,
1.224004, 0.5638658, 1.161532, 1, 0, 0.7019608, 1,
1.226492, -0.1165586, 1.191019, 1, 0, 0.6941177, 1,
1.238393, 0.4589058, 0.3087907, 1, 0, 0.6901961, 1,
1.247002, 1.456263, 1.650989, 1, 0, 0.682353, 1,
1.249753, 0.1775883, 1.437345, 1, 0, 0.6784314, 1,
1.257536, 0.3606548, 1.548111, 1, 0, 0.6705883, 1,
1.25888, -0.7701505, 1.2066, 1, 0, 0.6666667, 1,
1.263688, -0.1882976, 2.649119, 1, 0, 0.6588235, 1,
1.26375, 0.6642519, 1.176598, 1, 0, 0.654902, 1,
1.266366, -1.974815, 3.539059, 1, 0, 0.6470588, 1,
1.267744, 0.539127, 1.638278, 1, 0, 0.6431373, 1,
1.277296, 0.1185181, 1.985038, 1, 0, 0.6352941, 1,
1.27822, -1.035108, 0.9765811, 1, 0, 0.6313726, 1,
1.294293, 0.2932591, 2.063339, 1, 0, 0.6235294, 1,
1.300302, 1.933158, 1.040619, 1, 0, 0.6196079, 1,
1.303378, -1.182805, 1.830133, 1, 0, 0.6117647, 1,
1.311158, -0.02505666, 0.5640994, 1, 0, 0.6078432, 1,
1.319703, -1.354935, 1.658935, 1, 0, 0.6, 1,
1.325722, -1.186223, 1.723692, 1, 0, 0.5921569, 1,
1.32618, -0.6457617, 2.84162, 1, 0, 0.5882353, 1,
1.330436, -0.0913161, 3.489823, 1, 0, 0.5803922, 1,
1.339798, 1.912029, 1.283788, 1, 0, 0.5764706, 1,
1.345798, 1.278065, 1.492012, 1, 0, 0.5686275, 1,
1.350569, 0.4305995, 0.1401713, 1, 0, 0.5647059, 1,
1.355163, -0.2488433, 1.142479, 1, 0, 0.5568628, 1,
1.363157, 0.691643, 0.422292, 1, 0, 0.5529412, 1,
1.364737, 0.2190162, -0.1141823, 1, 0, 0.5450981, 1,
1.364858, 0.05453494, 2.660492, 1, 0, 0.5411765, 1,
1.365486, -0.2307972, 0.7535113, 1, 0, 0.5333334, 1,
1.365669, -0.2108694, 1.551808, 1, 0, 0.5294118, 1,
1.367254, 0.5421645, 2.18387, 1, 0, 0.5215687, 1,
1.37503, -0.1771768, 1.277586, 1, 0, 0.5176471, 1,
1.379396, 0.3997883, 1.627905, 1, 0, 0.509804, 1,
1.386765, -0.4862862, 1.745146, 1, 0, 0.5058824, 1,
1.393806, -0.09148592, 1.114938, 1, 0, 0.4980392, 1,
1.422517, -0.995825, 2.154146, 1, 0, 0.4901961, 1,
1.442022, -0.9921901, 0.8935626, 1, 0, 0.4862745, 1,
1.443106, 0.07407843, 2.813669, 1, 0, 0.4784314, 1,
1.470706, -0.2380329, 2.506345, 1, 0, 0.4745098, 1,
1.474679, -0.1651562, 0.8467926, 1, 0, 0.4666667, 1,
1.479006, 1.012999, 1.162978, 1, 0, 0.4627451, 1,
1.491393, 1.044674, 2.522992, 1, 0, 0.454902, 1,
1.492287, -0.1880152, 0.8731534, 1, 0, 0.4509804, 1,
1.496499, 1.35181, 1.293998, 1, 0, 0.4431373, 1,
1.501572, -1.760153, 2.347393, 1, 0, 0.4392157, 1,
1.510792, 0.7703917, 2.783561, 1, 0, 0.4313726, 1,
1.514561, 2.029887, 0.7096093, 1, 0, 0.427451, 1,
1.518321, 2.237672, 2.48402, 1, 0, 0.4196078, 1,
1.522677, 1.001474, 0.4781699, 1, 0, 0.4156863, 1,
1.542571, 0.5922127, 0.9828789, 1, 0, 0.4078431, 1,
1.546298, -0.9957235, 1.592806, 1, 0, 0.4039216, 1,
1.55297, 0.2665856, 1.95562, 1, 0, 0.3960784, 1,
1.554489, -0.5120821, 1.699171, 1, 0, 0.3882353, 1,
1.560444, -2.619595, 3.549215, 1, 0, 0.3843137, 1,
1.566784, -0.2975697, 2.578198, 1, 0, 0.3764706, 1,
1.579456, 0.3154538, 2.856688, 1, 0, 0.372549, 1,
1.59005, -1.469628, 2.710669, 1, 0, 0.3647059, 1,
1.591811, -0.2793028, 3.830898, 1, 0, 0.3607843, 1,
1.593992, 0.5255924, -0.3704403, 1, 0, 0.3529412, 1,
1.599929, 0.08650077, 1.76964, 1, 0, 0.3490196, 1,
1.606547, 1.126078, 0.6562229, 1, 0, 0.3411765, 1,
1.626587, 0.8101945, 2.368805, 1, 0, 0.3372549, 1,
1.626972, 0.1832092, 1.245133, 1, 0, 0.3294118, 1,
1.631326, 0.01465711, 0.09426948, 1, 0, 0.3254902, 1,
1.645969, -0.4290633, 2.840893, 1, 0, 0.3176471, 1,
1.655178, -0.3924595, 1.813996, 1, 0, 0.3137255, 1,
1.679985, 0.3730713, 2.107626, 1, 0, 0.3058824, 1,
1.699083, 0.4609329, 0.6119128, 1, 0, 0.2980392, 1,
1.699898, -0.9576152, 4.032433, 1, 0, 0.2941177, 1,
1.710607, 0.2978341, 2.28673, 1, 0, 0.2862745, 1,
1.720641, -0.4385808, 2.446523, 1, 0, 0.282353, 1,
1.763736, -0.2817, 0.9319037, 1, 0, 0.2745098, 1,
1.780108, 0.3049748, -0.4250275, 1, 0, 0.2705882, 1,
1.78091, 1.091338, -0.06579491, 1, 0, 0.2627451, 1,
1.79336, -0.3160951, 1.554543, 1, 0, 0.2588235, 1,
1.832945, 0.87907, 1.639534, 1, 0, 0.2509804, 1,
1.834916, -0.2765961, 1.219481, 1, 0, 0.2470588, 1,
1.853463, -1.641159, 2.172417, 1, 0, 0.2392157, 1,
1.870763, -0.6147181, 2.552774, 1, 0, 0.2352941, 1,
1.874087, -0.8796403, 2.986904, 1, 0, 0.227451, 1,
1.886688, 0.5831482, 2.215338, 1, 0, 0.2235294, 1,
1.899763, -0.1953434, 2.58917, 1, 0, 0.2156863, 1,
1.925744, -1.170879, 2.461167, 1, 0, 0.2117647, 1,
1.927545, -1.178221, 3.916016, 1, 0, 0.2039216, 1,
1.934392, -0.3966084, 1.329909, 1, 0, 0.1960784, 1,
1.947878, -1.496997, 2.476609, 1, 0, 0.1921569, 1,
1.949437, -0.6746314, 0.3309075, 1, 0, 0.1843137, 1,
1.952592, -0.4513932, 0.1991134, 1, 0, 0.1803922, 1,
2.014943, -0.5296632, 2.42275, 1, 0, 0.172549, 1,
2.03539, 1.118067, -0.08555162, 1, 0, 0.1686275, 1,
2.045424, -0.4251804, 2.057062, 1, 0, 0.1607843, 1,
2.051699, 1.749439, 2.161818, 1, 0, 0.1568628, 1,
2.090231, 0.0737526, 2.877086, 1, 0, 0.1490196, 1,
2.103452, -2.702648, 1.259134, 1, 0, 0.145098, 1,
2.103456, -0.5196257, 2.304655, 1, 0, 0.1372549, 1,
2.110894, -0.2355612, 3.357922, 1, 0, 0.1333333, 1,
2.149875, -0.2870373, 2.27607, 1, 0, 0.1254902, 1,
2.158609, -0.07930019, 1.362931, 1, 0, 0.1215686, 1,
2.165329, -0.7318196, 2.92911, 1, 0, 0.1137255, 1,
2.206372, -0.2504174, 1.917732, 1, 0, 0.1098039, 1,
2.206748, 0.4517278, 0.6735474, 1, 0, 0.1019608, 1,
2.218424, -1.787477, 2.028416, 1, 0, 0.09411765, 1,
2.227762, -0.1356567, 1.630121, 1, 0, 0.09019608, 1,
2.231781, -1.76111, 2.727971, 1, 0, 0.08235294, 1,
2.232723, -0.1522049, 0.673711, 1, 0, 0.07843138, 1,
2.236386, 0.5104408, 2.370655, 1, 0, 0.07058824, 1,
2.253761, 1.085155, 0.1518035, 1, 0, 0.06666667, 1,
2.284971, 0.495583, 2.497277, 1, 0, 0.05882353, 1,
2.325648, 1.281116, 2.410121, 1, 0, 0.05490196, 1,
2.393661, -0.6075278, 0.745419, 1, 0, 0.04705882, 1,
2.438553, -0.06312883, 0.9532822, 1, 0, 0.04313726, 1,
2.489548, -0.8855263, 0.4754703, 1, 0, 0.03529412, 1,
2.50563, -0.5580599, 1.37519, 1, 0, 0.03137255, 1,
2.513959, -0.594431, 2.929908, 1, 0, 0.02352941, 1,
2.530552, 0.7722871, 1.37522, 1, 0, 0.01960784, 1,
2.595124, -1.060613, 2.28704, 1, 0, 0.01176471, 1,
2.616657, 0.7889705, 2.673044, 1, 0, 0.007843138, 1
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
-0.3365709, -4.773205, -7.883593, 0, -0.5, 0.5, 0.5,
-0.3365709, -4.773205, -7.883593, 1, -0.5, 0.5, 0.5,
-0.3365709, -4.773205, -7.883593, 1, 1.5, 0.5, 0.5,
-0.3365709, -4.773205, -7.883593, 0, 1.5, 0.5, 0.5
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
-4.290944, -0.4280418, -7.883593, 0, -0.5, 0.5, 0.5,
-4.290944, -0.4280418, -7.883593, 1, -0.5, 0.5, 0.5,
-4.290944, -0.4280418, -7.883593, 1, 1.5, 0.5, 0.5,
-4.290944, -0.4280418, -7.883593, 0, 1.5, 0.5, 0.5
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
-4.290944, -4.773205, -0.362138, 0, -0.5, 0.5, 0.5,
-4.290944, -4.773205, -0.362138, 1, -0.5, 0.5, 0.5,
-4.290944, -4.773205, -0.362138, 1, 1.5, 0.5, 0.5,
-4.290944, -4.773205, -0.362138, 0, 1.5, 0.5, 0.5
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
-3, -3.770475, -6.147873,
2, -3.770475, -6.147873,
-3, -3.770475, -6.147873,
-3, -3.937597, -6.43716,
-2, -3.770475, -6.147873,
-2, -3.937597, -6.43716,
-1, -3.770475, -6.147873,
-1, -3.937597, -6.43716,
0, -3.770475, -6.147873,
0, -3.937597, -6.43716,
1, -3.770475, -6.147873,
1, -3.937597, -6.43716,
2, -3.770475, -6.147873,
2, -3.937597, -6.43716
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
-3, -4.27184, -7.015733, 0, -0.5, 0.5, 0.5,
-3, -4.27184, -7.015733, 1, -0.5, 0.5, 0.5,
-3, -4.27184, -7.015733, 1, 1.5, 0.5, 0.5,
-3, -4.27184, -7.015733, 0, 1.5, 0.5, 0.5,
-2, -4.27184, -7.015733, 0, -0.5, 0.5, 0.5,
-2, -4.27184, -7.015733, 1, -0.5, 0.5, 0.5,
-2, -4.27184, -7.015733, 1, 1.5, 0.5, 0.5,
-2, -4.27184, -7.015733, 0, 1.5, 0.5, 0.5,
-1, -4.27184, -7.015733, 0, -0.5, 0.5, 0.5,
-1, -4.27184, -7.015733, 1, -0.5, 0.5, 0.5,
-1, -4.27184, -7.015733, 1, 1.5, 0.5, 0.5,
-1, -4.27184, -7.015733, 0, 1.5, 0.5, 0.5,
0, -4.27184, -7.015733, 0, -0.5, 0.5, 0.5,
0, -4.27184, -7.015733, 1, -0.5, 0.5, 0.5,
0, -4.27184, -7.015733, 1, 1.5, 0.5, 0.5,
0, -4.27184, -7.015733, 0, 1.5, 0.5, 0.5,
1, -4.27184, -7.015733, 0, -0.5, 0.5, 0.5,
1, -4.27184, -7.015733, 1, -0.5, 0.5, 0.5,
1, -4.27184, -7.015733, 1, 1.5, 0.5, 0.5,
1, -4.27184, -7.015733, 0, 1.5, 0.5, 0.5,
2, -4.27184, -7.015733, 0, -0.5, 0.5, 0.5,
2, -4.27184, -7.015733, 1, -0.5, 0.5, 0.5,
2, -4.27184, -7.015733, 1, 1.5, 0.5, 0.5,
2, -4.27184, -7.015733, 0, 1.5, 0.5, 0.5
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
-3.378396, -3, -6.147873,
-3.378396, 2, -6.147873,
-3.378396, -3, -6.147873,
-3.530487, -3, -6.43716,
-3.378396, -2, -6.147873,
-3.530487, -2, -6.43716,
-3.378396, -1, -6.147873,
-3.530487, -1, -6.43716,
-3.378396, 0, -6.147873,
-3.530487, 0, -6.43716,
-3.378396, 1, -6.147873,
-3.530487, 1, -6.43716,
-3.378396, 2, -6.147873,
-3.530487, 2, -6.43716
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
-3.83467, -3, -7.015733, 0, -0.5, 0.5, 0.5,
-3.83467, -3, -7.015733, 1, -0.5, 0.5, 0.5,
-3.83467, -3, -7.015733, 1, 1.5, 0.5, 0.5,
-3.83467, -3, -7.015733, 0, 1.5, 0.5, 0.5,
-3.83467, -2, -7.015733, 0, -0.5, 0.5, 0.5,
-3.83467, -2, -7.015733, 1, -0.5, 0.5, 0.5,
-3.83467, -2, -7.015733, 1, 1.5, 0.5, 0.5,
-3.83467, -2, -7.015733, 0, 1.5, 0.5, 0.5,
-3.83467, -1, -7.015733, 0, -0.5, 0.5, 0.5,
-3.83467, -1, -7.015733, 1, -0.5, 0.5, 0.5,
-3.83467, -1, -7.015733, 1, 1.5, 0.5, 0.5,
-3.83467, -1, -7.015733, 0, 1.5, 0.5, 0.5,
-3.83467, 0, -7.015733, 0, -0.5, 0.5, 0.5,
-3.83467, 0, -7.015733, 1, -0.5, 0.5, 0.5,
-3.83467, 0, -7.015733, 1, 1.5, 0.5, 0.5,
-3.83467, 0, -7.015733, 0, 1.5, 0.5, 0.5,
-3.83467, 1, -7.015733, 0, -0.5, 0.5, 0.5,
-3.83467, 1, -7.015733, 1, -0.5, 0.5, 0.5,
-3.83467, 1, -7.015733, 1, 1.5, 0.5, 0.5,
-3.83467, 1, -7.015733, 0, 1.5, 0.5, 0.5,
-3.83467, 2, -7.015733, 0, -0.5, 0.5, 0.5,
-3.83467, 2, -7.015733, 1, -0.5, 0.5, 0.5,
-3.83467, 2, -7.015733, 1, 1.5, 0.5, 0.5,
-3.83467, 2, -7.015733, 0, 1.5, 0.5, 0.5
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
-3.378396, -3.770475, -4,
-3.378396, -3.770475, 4,
-3.378396, -3.770475, -4,
-3.530487, -3.937597, -4,
-3.378396, -3.770475, -2,
-3.530487, -3.937597, -2,
-3.378396, -3.770475, 0,
-3.530487, -3.937597, 0,
-3.378396, -3.770475, 2,
-3.530487, -3.937597, 2,
-3.378396, -3.770475, 4,
-3.530487, -3.937597, 4
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
-3.83467, -4.27184, -4, 0, -0.5, 0.5, 0.5,
-3.83467, -4.27184, -4, 1, -0.5, 0.5, 0.5,
-3.83467, -4.27184, -4, 1, 1.5, 0.5, 0.5,
-3.83467, -4.27184, -4, 0, 1.5, 0.5, 0.5,
-3.83467, -4.27184, -2, 0, -0.5, 0.5, 0.5,
-3.83467, -4.27184, -2, 1, -0.5, 0.5, 0.5,
-3.83467, -4.27184, -2, 1, 1.5, 0.5, 0.5,
-3.83467, -4.27184, -2, 0, 1.5, 0.5, 0.5,
-3.83467, -4.27184, 0, 0, -0.5, 0.5, 0.5,
-3.83467, -4.27184, 0, 1, -0.5, 0.5, 0.5,
-3.83467, -4.27184, 0, 1, 1.5, 0.5, 0.5,
-3.83467, -4.27184, 0, 0, 1.5, 0.5, 0.5,
-3.83467, -4.27184, 2, 0, -0.5, 0.5, 0.5,
-3.83467, -4.27184, 2, 1, -0.5, 0.5, 0.5,
-3.83467, -4.27184, 2, 1, 1.5, 0.5, 0.5,
-3.83467, -4.27184, 2, 0, 1.5, 0.5, 0.5,
-3.83467, -4.27184, 4, 0, -0.5, 0.5, 0.5,
-3.83467, -4.27184, 4, 1, -0.5, 0.5, 0.5,
-3.83467, -4.27184, 4, 1, 1.5, 0.5, 0.5,
-3.83467, -4.27184, 4, 0, 1.5, 0.5, 0.5
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
-3.378396, -3.770475, -6.147873,
-3.378396, 2.914391, -6.147873,
-3.378396, -3.770475, 5.423597,
-3.378396, 2.914391, 5.423597,
-3.378396, -3.770475, -6.147873,
-3.378396, -3.770475, 5.423597,
-3.378396, 2.914391, -6.147873,
-3.378396, 2.914391, 5.423597,
-3.378396, -3.770475, -6.147873,
2.705254, -3.770475, -6.147873,
-3.378396, -3.770475, 5.423597,
2.705254, -3.770475, 5.423597,
-3.378396, 2.914391, -6.147873,
2.705254, 2.914391, -6.147873,
-3.378396, 2.914391, 5.423597,
2.705254, 2.914391, 5.423597,
2.705254, -3.770475, -6.147873,
2.705254, 2.914391, -6.147873,
2.705254, -3.770475, 5.423597,
2.705254, 2.914391, 5.423597,
2.705254, -3.770475, -6.147873,
2.705254, -3.770475, 5.423597,
2.705254, 2.914391, -6.147873,
2.705254, 2.914391, 5.423597
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
var radius = 7.840558;
var distance = 34.88353;
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
mvMatrix.translate( 0.3365709, 0.4280418, 0.362138 );
mvMatrix.scale( 1.393467, 1.268143, 0.7326092 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.88353);
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
arsenic_acid<-read.table("arsenic_acid.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-arsenic_acid$V2
```

```
## Error in eval(expr, envir, enclos): object 'arsenic_acid' not found
```

```r
y<-arsenic_acid$V3
```

```
## Error in eval(expr, envir, enclos): object 'arsenic_acid' not found
```

```r
z<-arsenic_acid$V4
```

```
## Error in eval(expr, envir, enclos): object 'arsenic_acid' not found
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
-3.289799, -0.05015194, -1.311663, 0, 0, 1, 1, 1,
-2.957534, 0.2849079, -0.9123552, 1, 0, 0, 1, 1,
-2.627678, 0.4405115, -1.385914, 1, 0, 0, 1, 1,
-2.608068, 0.1777041, -2.594601, 1, 0, 0, 1, 1,
-2.532753, -2.225524, -1.96497, 1, 0, 0, 1, 1,
-2.495846, -2.000429, -2.263757, 1, 0, 0, 1, 1,
-2.446209, 0.6296839, -0.8214132, 0, 0, 0, 1, 1,
-2.44343, 0.2161284, -1.398439, 0, 0, 0, 1, 1,
-2.361164, 0.1120156, -0.8548992, 0, 0, 0, 1, 1,
-2.30114, -0.2981633, -2.677044, 0, 0, 0, 1, 1,
-2.291099, -1.093631, -2.596263, 0, 0, 0, 1, 1,
-2.253488, -0.573066, -0.6407953, 0, 0, 0, 1, 1,
-2.21844, 0.2349963, 0.3103726, 0, 0, 0, 1, 1,
-2.217027, 1.628701, -2.064726, 1, 1, 1, 1, 1,
-2.21604, -1.078993, -1.220524, 1, 1, 1, 1, 1,
-2.200588, -0.04779749, -1.539533, 1, 1, 1, 1, 1,
-2.179083, -0.5826428, -2.050483, 1, 1, 1, 1, 1,
-2.167776, 1.198964, 0.5219713, 1, 1, 1, 1, 1,
-2.160991, 0.4261762, -0.6077392, 1, 1, 1, 1, 1,
-2.15053, -0.5915322, -3.051614, 1, 1, 1, 1, 1,
-2.146478, -2.812257, -2.297218, 1, 1, 1, 1, 1,
-2.134129, 0.006552258, -2.115699, 1, 1, 1, 1, 1,
-2.120703, -0.3057319, -1.730737, 1, 1, 1, 1, 1,
-2.100542, -0.3474953, -1.966354, 1, 1, 1, 1, 1,
-2.093147, 0.2962824, -1.62403, 1, 1, 1, 1, 1,
-2.079921, 0.1273936, -0.350444, 1, 1, 1, 1, 1,
-2.04447, -0.3112387, -1.176233, 1, 1, 1, 1, 1,
-2.026835, 0.6616294, -1.538569, 1, 1, 1, 1, 1,
-2.019841, -0.9898666, -0.07406294, 0, 0, 1, 1, 1,
-2.019592, 0.484099, -2.510442, 1, 0, 0, 1, 1,
-2.013049, -1.05036, -0.260507, 1, 0, 0, 1, 1,
-2.00341, -0.07445703, -1.519824, 1, 0, 0, 1, 1,
-1.945739, 1.058292, 0.18827, 1, 0, 0, 1, 1,
-1.936989, 1.420425, 0.1904745, 1, 0, 0, 1, 1,
-1.932375, -1.836491, -1.062407, 0, 0, 0, 1, 1,
-1.898999, 0.02089029, -3.825469, 0, 0, 0, 1, 1,
-1.869557, 1.555139, -2.094669, 0, 0, 0, 1, 1,
-1.859907, -1.338119, -3.834794, 0, 0, 0, 1, 1,
-1.854631, -0.09075579, -0.5763059, 0, 0, 0, 1, 1,
-1.821725, 0.8153107, -0.6062249, 0, 0, 0, 1, 1,
-1.789034, -0.02648159, -1.816905, 0, 0, 0, 1, 1,
-1.770721, 0.5406075, -1.831375, 1, 1, 1, 1, 1,
-1.762211, -1.423994, -1.407907, 1, 1, 1, 1, 1,
-1.74376, 0.3034202, -2.7695, 1, 1, 1, 1, 1,
-1.73326, 1.664907, -1.424712, 1, 1, 1, 1, 1,
-1.72148, -0.9409, -1.069782, 1, 1, 1, 1, 1,
-1.718951, 0.7304905, -1.512409, 1, 1, 1, 1, 1,
-1.716972, -0.2378365, -2.58035, 1, 1, 1, 1, 1,
-1.701122, -0.2116024, -0.6619837, 1, 1, 1, 1, 1,
-1.673872, 1.256697, -2.583355, 1, 1, 1, 1, 1,
-1.652671, 0.8303452, -1.13001, 1, 1, 1, 1, 1,
-1.647875, 2.032294, -2.16141, 1, 1, 1, 1, 1,
-1.646345, 1.903949, -1.498284, 1, 1, 1, 1, 1,
-1.642332, 0.1785256, -0.9251373, 1, 1, 1, 1, 1,
-1.634452, -0.6739134, -1.446954, 1, 1, 1, 1, 1,
-1.621635, 0.8494806, -1.823553, 1, 1, 1, 1, 1,
-1.617233, 1.264653, 0.01439898, 0, 0, 1, 1, 1,
-1.613534, -0.9940985, -1.338659, 1, 0, 0, 1, 1,
-1.60693, -0.2262651, -0.9318153, 1, 0, 0, 1, 1,
-1.602866, -0.3051469, 0.5723158, 1, 0, 0, 1, 1,
-1.600392, 0.5722479, -2.314786, 1, 0, 0, 1, 1,
-1.594003, -0.3688097, -3.238445, 1, 0, 0, 1, 1,
-1.591149, 0.5515055, -0.3781819, 0, 0, 0, 1, 1,
-1.584242, -1.091793, -0.01449719, 0, 0, 0, 1, 1,
-1.550814, 1.186131, -1.65203, 0, 0, 0, 1, 1,
-1.509553, -1.313722, -1.803554, 0, 0, 0, 1, 1,
-1.5062, 2.33459, 0.1577858, 0, 0, 0, 1, 1,
-1.496242, 0.414696, 0.2753652, 0, 0, 0, 1, 1,
-1.492601, 0.1849046, -2.10058, 0, 0, 0, 1, 1,
-1.489747, -0.4825388, -2.315978, 1, 1, 1, 1, 1,
-1.476961, -0.6161893, -3.65645, 1, 1, 1, 1, 1,
-1.469442, 0.1463904, -1.894596, 1, 1, 1, 1, 1,
-1.458794, 0.4146992, -1.922829, 1, 1, 1, 1, 1,
-1.437178, -0.5208351, -2.025738, 1, 1, 1, 1, 1,
-1.436507, -1.329117, -0.8118144, 1, 1, 1, 1, 1,
-1.4334, 0.1440918, 0.3560672, 1, 1, 1, 1, 1,
-1.42855, 0.03068869, -2.525188, 1, 1, 1, 1, 1,
-1.425729, -1.847149, -1.899007, 1, 1, 1, 1, 1,
-1.405156, -0.9224383, -2.173373, 1, 1, 1, 1, 1,
-1.40011, 0.1428851, -1.29956, 1, 1, 1, 1, 1,
-1.395286, -0.2319317, -2.841939, 1, 1, 1, 1, 1,
-1.391391, 0.1822246, -0.1580967, 1, 1, 1, 1, 1,
-1.389346, 0.1938147, -1.974562, 1, 1, 1, 1, 1,
-1.38474, 1.203741, 0.2138716, 1, 1, 1, 1, 1,
-1.382967, -1.478525, -2.915568, 0, 0, 1, 1, 1,
-1.382621, 0.6324797, -0.3316079, 1, 0, 0, 1, 1,
-1.379914, -0.4824969, -2.709422, 1, 0, 0, 1, 1,
-1.374169, -0.0006887892, -0.6448348, 1, 0, 0, 1, 1,
-1.365744, 0.4364972, -0.2225615, 1, 0, 0, 1, 1,
-1.365608, 0.3047414, -0.7735567, 1, 0, 0, 1, 1,
-1.363705, 0.6487349, -2.264596, 0, 0, 0, 1, 1,
-1.35669, -3.673122, -1.499205, 0, 0, 0, 1, 1,
-1.353711, 2.649439, 0.5932476, 0, 0, 0, 1, 1,
-1.352192, 0.6395326, -1.846758, 0, 0, 0, 1, 1,
-1.337828, -2.316225, -3.380183, 0, 0, 0, 1, 1,
-1.337677, 1.308486, -1.762329, 0, 0, 0, 1, 1,
-1.30655, -0.6692588, -2.054077, 0, 0, 0, 1, 1,
-1.306073, -1.115058, -2.723045, 1, 1, 1, 1, 1,
-1.300276, -0.4354801, -1.595599, 1, 1, 1, 1, 1,
-1.294565, -1.229112, -2.482626, 1, 1, 1, 1, 1,
-1.278054, -0.5384005, -1.379782, 1, 1, 1, 1, 1,
-1.275146, 1.533395, -1.183588, 1, 1, 1, 1, 1,
-1.271708, 1.661345, -0.7870126, 1, 1, 1, 1, 1,
-1.268883, -0.8196275, -2.663495, 1, 1, 1, 1, 1,
-1.26743, 0.2073344, -3.391944, 1, 1, 1, 1, 1,
-1.264995, 0.2661793, -2.035133, 1, 1, 1, 1, 1,
-1.26217, -0.1982862, -1.689303, 1, 1, 1, 1, 1,
-1.257224, -0.6462104, 0.06223192, 1, 1, 1, 1, 1,
-1.249588, 0.2580156, -0.7896563, 1, 1, 1, 1, 1,
-1.248893, 0.2825359, -1.765702, 1, 1, 1, 1, 1,
-1.239583, 0.9560662, -0.4787765, 1, 1, 1, 1, 1,
-1.235374, 0.8345268, -1.507094, 1, 1, 1, 1, 1,
-1.235145, -0.2353664, -1.652362, 0, 0, 1, 1, 1,
-1.22038, -0.914178, -3.04392, 1, 0, 0, 1, 1,
-1.208665, -0.5950491, -1.833537, 1, 0, 0, 1, 1,
-1.20077, -0.6152259, -2.675411, 1, 0, 0, 1, 1,
-1.19963, -0.4287578, -1.637675, 1, 0, 0, 1, 1,
-1.199162, -0.1024709, -3.14073, 1, 0, 0, 1, 1,
-1.19236, -0.7862881, -2.424891, 0, 0, 0, 1, 1,
-1.186689, 0.1222586, -1.600477, 0, 0, 0, 1, 1,
-1.184454, 1.158417, -0.5736006, 0, 0, 0, 1, 1,
-1.184293, -0.5510094, -2.129396, 0, 0, 0, 1, 1,
-1.183428, -1.372551, -3.103463, 0, 0, 0, 1, 1,
-1.179175, -0.4731555, -2.772398, 0, 0, 0, 1, 1,
-1.177857, 0.6443141, 0.3031358, 0, 0, 0, 1, 1,
-1.168397, 1.171663, -0.7452031, 1, 1, 1, 1, 1,
-1.16799, -2.317627, -3.056506, 1, 1, 1, 1, 1,
-1.162103, -0.1856785, -2.076703, 1, 1, 1, 1, 1,
-1.155068, -0.1777839, -2.467804, 1, 1, 1, 1, 1,
-1.141438, 1.757915, -0.4539308, 1, 1, 1, 1, 1,
-1.141022, -1.204703, -0.945235, 1, 1, 1, 1, 1,
-1.135059, 1.399684, -1.611783, 1, 1, 1, 1, 1,
-1.12799, -0.4668152, -1.34102, 1, 1, 1, 1, 1,
-1.126526, 0.4127899, -1.371612, 1, 1, 1, 1, 1,
-1.114643, -0.2308507, -1.867531, 1, 1, 1, 1, 1,
-1.107724, 1.09443, -0.7254771, 1, 1, 1, 1, 1,
-1.103562, 1.628302, -0.2798263, 1, 1, 1, 1, 1,
-1.094888, 0.5802761, -1.713584, 1, 1, 1, 1, 1,
-1.075459, 1.010133, -0.479055, 1, 1, 1, 1, 1,
-1.07459, 0.7671116, -0.34908, 1, 1, 1, 1, 1,
-1.073498, -0.6521482, -2.376158, 0, 0, 1, 1, 1,
-1.073147, 1.86227, -2.142285, 1, 0, 0, 1, 1,
-1.071692, -0.6211836, -2.883028, 1, 0, 0, 1, 1,
-1.070958, -0.4424773, -1.250545, 1, 0, 0, 1, 1,
-1.066404, -1.439144, -2.211444, 1, 0, 0, 1, 1,
-1.055583, 0.7474657, 0.3002685, 1, 0, 0, 1, 1,
-1.047544, -0.07610031, -1.229084, 0, 0, 0, 1, 1,
-1.047317, -0.1546433, -1.67733, 0, 0, 0, 1, 1,
-1.04729, -0.9330302, -1.289536, 0, 0, 0, 1, 1,
-1.046421, 0.6813974, -1.511901, 0, 0, 0, 1, 1,
-1.046091, 1.26011, 0.03560987, 0, 0, 0, 1, 1,
-1.039263, -1.349261, -2.702596, 0, 0, 0, 1, 1,
-1.038653, 0.6258488, -1.635523, 0, 0, 0, 1, 1,
-1.027337, -0.7106237, -3.358377, 1, 1, 1, 1, 1,
-1.024643, 0.9628568, -2.391191, 1, 1, 1, 1, 1,
-1.019602, -0.5224412, -2.084751, 1, 1, 1, 1, 1,
-1.010035, -0.4897562, -2.360232, 1, 1, 1, 1, 1,
-1.008934, 0.1039544, -1.896503, 1, 1, 1, 1, 1,
-1.00848, 0.1515924, -0.994074, 1, 1, 1, 1, 1,
-1.006155, -0.3580165, -2.801547, 1, 1, 1, 1, 1,
-0.9910327, -0.9252587, -3.665374, 1, 1, 1, 1, 1,
-0.9884352, -0.18922, -4.288624, 1, 1, 1, 1, 1,
-0.986442, 1.146875, -1.614802, 1, 1, 1, 1, 1,
-0.9797737, -0.6546503, -2.965011, 1, 1, 1, 1, 1,
-0.9780393, -0.2558082, -0.7889426, 1, 1, 1, 1, 1,
-0.9748151, -1.533221, -4.087542, 1, 1, 1, 1, 1,
-0.9734031, -1.806508, -0.9126869, 1, 1, 1, 1, 1,
-0.9727415, 0.7886899, 0.01752712, 1, 1, 1, 1, 1,
-0.9698927, -2.11087, -1.578677, 0, 0, 1, 1, 1,
-0.9689806, -0.9725792, -3.342612, 1, 0, 0, 1, 1,
-0.9683554, -0.810059, -3.855398, 1, 0, 0, 1, 1,
-0.9653376, 0.2403232, 0.8066412, 1, 0, 0, 1, 1,
-0.9652519, 0.1625126, -0.1815785, 1, 0, 0, 1, 1,
-0.9576163, 1.161756, -0.6754506, 1, 0, 0, 1, 1,
-0.9470685, 0.4222493, 0.3858972, 0, 0, 0, 1, 1,
-0.9470261, 0.5767077, 0.990145, 0, 0, 0, 1, 1,
-0.9455636, 0.3247301, -0.1780494, 0, 0, 0, 1, 1,
-0.9408926, 0.5884776, -0.1610477, 0, 0, 0, 1, 1,
-0.9372457, -0.8956006, -0.5928546, 0, 0, 0, 1, 1,
-0.9258455, -1.451166, -2.801442, 0, 0, 0, 1, 1,
-0.9178098, -0.3338943, -1.86931, 0, 0, 0, 1, 1,
-0.9165793, 0.2724357, -1.923291, 1, 1, 1, 1, 1,
-0.9150189, -1.252731, -2.838166, 1, 1, 1, 1, 1,
-0.9148312, -2.532253, -2.816961, 1, 1, 1, 1, 1,
-0.9107253, 0.3991981, -1.607807, 1, 1, 1, 1, 1,
-0.9068711, -0.8399234, -3.887962, 1, 1, 1, 1, 1,
-0.9036499, 0.6358368, -1.383792, 1, 1, 1, 1, 1,
-0.9023488, -0.3595002, -1.541024, 1, 1, 1, 1, 1,
-0.8950368, -1.034037, -2.278799, 1, 1, 1, 1, 1,
-0.8950215, -0.7857324, -1.803961, 1, 1, 1, 1, 1,
-0.8867644, -1.061291, -1.156484, 1, 1, 1, 1, 1,
-0.8843122, 0.7888294, 0.1137509, 1, 1, 1, 1, 1,
-0.8832266, 0.2501363, -0.4235159, 1, 1, 1, 1, 1,
-0.8816136, -0.7740886, -1.80173, 1, 1, 1, 1, 1,
-0.8782684, 1.056362, -1.234609, 1, 1, 1, 1, 1,
-0.874052, 0.3103096, -1.175925, 1, 1, 1, 1, 1,
-0.8732752, 0.06482565, -1.255687, 0, 0, 1, 1, 1,
-0.8725802, -0.03339128, -0.3386598, 1, 0, 0, 1, 1,
-0.8682436, 0.2912206, 0.2077544, 1, 0, 0, 1, 1,
-0.8680096, 0.5896165, 0.3624316, 1, 0, 0, 1, 1,
-0.8678706, -0.1438926, -1.276174, 1, 0, 0, 1, 1,
-0.8645743, -0.08255565, -0.3112154, 1, 0, 0, 1, 1,
-0.8642112, 1.001397, -0.1524834, 0, 0, 0, 1, 1,
-0.8614399, 0.1660212, -0.4057875, 0, 0, 0, 1, 1,
-0.854414, 2.488344, -0.003468137, 0, 0, 0, 1, 1,
-0.8514543, 1.268626, -2.297988, 0, 0, 0, 1, 1,
-0.8502029, -0.749366, -4.120921, 0, 0, 0, 1, 1,
-0.8420218, 0.1461972, -0.5948141, 0, 0, 0, 1, 1,
-0.8342372, 0.6176788, -0.4367029, 0, 0, 0, 1, 1,
-0.8293115, 0.001985722, -2.669885, 1, 1, 1, 1, 1,
-0.8248559, 0.3164428, -1.761635, 1, 1, 1, 1, 1,
-0.8227491, 1.237901, -0.9919325, 1, 1, 1, 1, 1,
-0.8222117, 0.3359505, -2.079806, 1, 1, 1, 1, 1,
-0.8137221, -0.6508625, -2.600456, 1, 1, 1, 1, 1,
-0.8135878, 0.4296025, -1.349745, 1, 1, 1, 1, 1,
-0.8100337, -0.3251042, -1.626672, 1, 1, 1, 1, 1,
-0.8073344, -0.1992441, -3.00359, 1, 1, 1, 1, 1,
-0.8020353, -1.175911, -3.22247, 1, 1, 1, 1, 1,
-0.7993911, 0.3305238, 0.0003333557, 1, 1, 1, 1, 1,
-0.7943743, 0.3825479, -2.373233, 1, 1, 1, 1, 1,
-0.7923021, -2.027144, -2.768261, 1, 1, 1, 1, 1,
-0.7872195, -1.692322, -4.822233, 1, 1, 1, 1, 1,
-0.78426, -0.3324994, -3.248657, 1, 1, 1, 1, 1,
-0.7781125, -1.83013, -2.479873, 1, 1, 1, 1, 1,
-0.7734372, 2.06293, -0.7461576, 0, 0, 1, 1, 1,
-0.7676215, 0.4269065, -0.1023251, 1, 0, 0, 1, 1,
-0.7619539, -0.3833848, -1.914919, 1, 0, 0, 1, 1,
-0.7612453, -1.019909, -2.40836, 1, 0, 0, 1, 1,
-0.7600169, 2.817039, 0.6748868, 1, 0, 0, 1, 1,
-0.7571811, 0.2889714, 1.103239, 1, 0, 0, 1, 1,
-0.7528576, -0.04483785, -1.036945, 0, 0, 0, 1, 1,
-0.7524892, 0.7533684, -1.409776, 0, 0, 0, 1, 1,
-0.7510659, 0.8729033, -3.007506, 0, 0, 0, 1, 1,
-0.7500656, -0.2589664, -1.673482, 0, 0, 0, 1, 1,
-0.7436513, -1.288462, -2.292983, 0, 0, 0, 1, 1,
-0.7411282, -2.44731, -3.184962, 0, 0, 0, 1, 1,
-0.7406959, -1.6807, -3.15605, 0, 0, 0, 1, 1,
-0.7391277, 0.2016821, -1.039738, 1, 1, 1, 1, 1,
-0.735717, 0.4894992, -0.5573502, 1, 1, 1, 1, 1,
-0.7334905, -0.9086745, -3.511263, 1, 1, 1, 1, 1,
-0.730144, 0.7270191, -2.230248, 1, 1, 1, 1, 1,
-0.7282555, -1.655696, -1.030789, 1, 1, 1, 1, 1,
-0.7271074, 0.2299566, 0.2720212, 1, 1, 1, 1, 1,
-0.7257661, -0.4361724, -2.738614, 1, 1, 1, 1, 1,
-0.7254082, -1.030612, -4.535488, 1, 1, 1, 1, 1,
-0.7169664, -0.5236609, -2.593349, 1, 1, 1, 1, 1,
-0.71403, 1.605652, 0.5000165, 1, 1, 1, 1, 1,
-0.7137126, -0.3843097, -2.660237, 1, 1, 1, 1, 1,
-0.7106377, -0.4067757, -2.97997, 1, 1, 1, 1, 1,
-0.7053238, -0.4048335, -3.674304, 1, 1, 1, 1, 1,
-0.7043949, -0.123927, -2.463025, 1, 1, 1, 1, 1,
-0.7043868, 1.329582, -1.148181, 1, 1, 1, 1, 1,
-0.7004893, -2.242299, -4.040443, 0, 0, 1, 1, 1,
-0.6893966, 0.2610711, -0.2901562, 1, 0, 0, 1, 1,
-0.6850131, -0.1298098, -1.260504, 1, 0, 0, 1, 1,
-0.6737183, -1.403121, -2.872799, 1, 0, 0, 1, 1,
-0.6683093, 0.214903, -0.09023084, 1, 0, 0, 1, 1,
-0.6666173, 0.6363085, -1.321981, 1, 0, 0, 1, 1,
-0.6616603, 0.2904534, -3.753666, 0, 0, 0, 1, 1,
-0.6615124, -0.1429674, -3.953987, 0, 0, 0, 1, 1,
-0.6609722, 0.3424072, -0.7834384, 0, 0, 0, 1, 1,
-0.6608977, 0.2940934, -0.1255324, 0, 0, 0, 1, 1,
-0.6482, -0.02225786, -0.5597493, 0, 0, 0, 1, 1,
-0.6377653, -0.9819788, -3.852828, 0, 0, 0, 1, 1,
-0.6302612, 1.065632, -0.689842, 0, 0, 0, 1, 1,
-0.6232604, -0.7375818, -3.638325, 1, 1, 1, 1, 1,
-0.6203511, -0.2898385, -1.958753, 1, 1, 1, 1, 1,
-0.6097279, -0.9682946, -4.249567, 1, 1, 1, 1, 1,
-0.608462, -2.280744, -3.093941, 1, 1, 1, 1, 1,
-0.6054758, 1.075672, 1.582401, 1, 1, 1, 1, 1,
-0.5982055, 0.90471, 0.5030943, 1, 1, 1, 1, 1,
-0.5960823, -0.1267648, 0.1423977, 1, 1, 1, 1, 1,
-0.5935253, 0.9979948, -0.679224, 1, 1, 1, 1, 1,
-0.5911036, 0.6477296, -4.065818, 1, 1, 1, 1, 1,
-0.5783223, 0.464914, 0.8751515, 1, 1, 1, 1, 1,
-0.5782191, -0.7045998, -2.742874, 1, 1, 1, 1, 1,
-0.5742711, 0.1675705, -0.6340306, 1, 1, 1, 1, 1,
-0.5730797, 0.6465533, 0.02928943, 1, 1, 1, 1, 1,
-0.5725365, 2.279771, -0.8621337, 1, 1, 1, 1, 1,
-0.5710737, -0.01615585, -1.895831, 1, 1, 1, 1, 1,
-0.5675519, -0.7442034, -1.397735, 0, 0, 1, 1, 1,
-0.5630813, -1.20555, -1.891614, 1, 0, 0, 1, 1,
-0.562804, 0.7661842, -0.8864064, 1, 0, 0, 1, 1,
-0.5562631, 0.927093, -1.216285, 1, 0, 0, 1, 1,
-0.5559564, -1.226413, -3.255047, 1, 0, 0, 1, 1,
-0.5539465, -0.9540827, -2.755085, 1, 0, 0, 1, 1,
-0.5506227, -1.110215, -0.9002998, 0, 0, 0, 1, 1,
-0.5448475, -0.02863339, -1.431655, 0, 0, 0, 1, 1,
-0.5425011, -0.8780711, -2.677764, 0, 0, 0, 1, 1,
-0.5400341, -0.06839011, -1.250525, 0, 0, 0, 1, 1,
-0.5366991, -0.8412719, -1.717993, 0, 0, 0, 1, 1,
-0.5366355, -0.9834211, -2.956215, 0, 0, 0, 1, 1,
-0.5296385, -1.712589, -2.304759, 0, 0, 0, 1, 1,
-0.5278746, 0.5235977, -0.5214302, 1, 1, 1, 1, 1,
-0.5263943, 0.8599496, -1.170984, 1, 1, 1, 1, 1,
-0.5207741, -1.301479, -1.433759, 1, 1, 1, 1, 1,
-0.5200717, -0.1393691, -1.469412, 1, 1, 1, 1, 1,
-0.5185523, -1.136137, -3.09419, 1, 1, 1, 1, 1,
-0.517884, -0.7918828, -0.8956369, 1, 1, 1, 1, 1,
-0.5173135, -0.4942437, -2.785647, 1, 1, 1, 1, 1,
-0.5136202, -0.4238787, -2.380729, 1, 1, 1, 1, 1,
-0.5125087, -0.09635707, -1.050789, 1, 1, 1, 1, 1,
-0.5106593, 0.3978212, 0.8794302, 1, 1, 1, 1, 1,
-0.5066982, -0.5970396, -4.59542, 1, 1, 1, 1, 1,
-0.5012895, 0.2663544, -2.935722, 1, 1, 1, 1, 1,
-0.4984867, -0.07111552, -2.192886, 1, 1, 1, 1, 1,
-0.4950539, -0.2197987, -1.139362, 1, 1, 1, 1, 1,
-0.4840703, 0.09166505, 0.5999161, 1, 1, 1, 1, 1,
-0.4835379, -0.6056089, -0.3474833, 0, 0, 1, 1, 1,
-0.4816407, -2.071415, -2.548563, 1, 0, 0, 1, 1,
-0.4812738, 2.42049, -0.3084452, 1, 0, 0, 1, 1,
-0.4808619, 1.719933, -0.009482277, 1, 0, 0, 1, 1,
-0.4739728, 0.8590966, -1.39481, 1, 0, 0, 1, 1,
-0.4704838, -1.039675, -0.9507548, 1, 0, 0, 1, 1,
-0.470461, 1.486583, -0.3829938, 0, 0, 0, 1, 1,
-0.4701171, -1.870931, -2.485706, 0, 0, 0, 1, 1,
-0.4690775, 0.948497, -1.213359, 0, 0, 0, 1, 1,
-0.4677776, 0.1081003, -2.288303, 0, 0, 0, 1, 1,
-0.4627948, -0.201702, -2.497267, 0, 0, 0, 1, 1,
-0.4576525, -0.05983511, -2.157351, 0, 0, 0, 1, 1,
-0.4560152, 0.03256563, -0.9413205, 0, 0, 0, 1, 1,
-0.4535407, -0.5951626, -2.963007, 1, 1, 1, 1, 1,
-0.4494596, 0.8118054, -1.306159, 1, 1, 1, 1, 1,
-0.4429219, -0.7307246, -2.552658, 1, 1, 1, 1, 1,
-0.4377303, -0.08107793, -1.488353, 1, 1, 1, 1, 1,
-0.4357198, -2.231109, -5.407623, 1, 1, 1, 1, 1,
-0.4353911, 1.19329, 0.3382701, 1, 1, 1, 1, 1,
-0.4298542, -1.340924, -4.918522, 1, 1, 1, 1, 1,
-0.4284277, -0.0483326, -2.766215, 1, 1, 1, 1, 1,
-0.4281965, -1.32297, -3.555868, 1, 1, 1, 1, 1,
-0.4255681, -0.5832955, -3.574791, 1, 1, 1, 1, 1,
-0.4146003, -0.190881, -1.689631, 1, 1, 1, 1, 1,
-0.4089967, 0.8803403, -2.018983, 1, 1, 1, 1, 1,
-0.4070959, -0.1348843, -2.026681, 1, 1, 1, 1, 1,
-0.4017174, -0.7526265, -2.553758, 1, 1, 1, 1, 1,
-0.3966542, 0.617794, 1.714961, 1, 1, 1, 1, 1,
-0.3900446, -0.935423, -2.56309, 0, 0, 1, 1, 1,
-0.3891026, 0.9151284, 1.367654, 1, 0, 0, 1, 1,
-0.3852818, 0.4413055, -1.303574, 1, 0, 0, 1, 1,
-0.3834095, 2.670813, 0.7931012, 1, 0, 0, 1, 1,
-0.3830522, 0.8947749, -0.7317131, 1, 0, 0, 1, 1,
-0.3808261, -0.8030513, -2.649295, 1, 0, 0, 1, 1,
-0.3797321, -0.9360293, -2.501222, 0, 0, 0, 1, 1,
-0.3786635, 0.6594853, -2.062738, 0, 0, 0, 1, 1,
-0.3785858, -0.5334691, -2.54916, 0, 0, 0, 1, 1,
-0.3768972, -0.9315297, -2.146211, 0, 0, 0, 1, 1,
-0.3764266, -1.824499, -2.379168, 0, 0, 0, 1, 1,
-0.3753553, -1.663703, -2.890372, 0, 0, 0, 1, 1,
-0.3751203, -0.897785, -4.073862, 0, 0, 0, 1, 1,
-0.3677976, 0.4808219, 0.3123467, 1, 1, 1, 1, 1,
-0.366807, -1.392846, -0.8723439, 1, 1, 1, 1, 1,
-0.3663315, -1.506474, -3.469733, 1, 1, 1, 1, 1,
-0.3655456, 0.9948718, -1.268472, 1, 1, 1, 1, 1,
-0.3653959, -0.92064, -2.442062, 1, 1, 1, 1, 1,
-0.3640945, -1.180443, -2.657089, 1, 1, 1, 1, 1,
-0.359926, -0.07658079, -1.024877, 1, 1, 1, 1, 1,
-0.3591879, -0.3100353, -2.077203, 1, 1, 1, 1, 1,
-0.3488244, -0.06973975, -1.274226, 1, 1, 1, 1, 1,
-0.3411139, -0.38344, -2.258286, 1, 1, 1, 1, 1,
-0.3373943, 1.771547, -1.425411, 1, 1, 1, 1, 1,
-0.3330179, -1.114251, -2.91192, 1, 1, 1, 1, 1,
-0.3327135, 1.236544, -0.7751799, 1, 1, 1, 1, 1,
-0.3301821, 1.481622, 0.2888536, 1, 1, 1, 1, 1,
-0.3293498, -1.153335, -3.205178, 1, 1, 1, 1, 1,
-0.3263103, -1.546013, -2.358817, 0, 0, 1, 1, 1,
-0.3258974, -1.759491, -2.114161, 1, 0, 0, 1, 1,
-0.3228114, 0.9937202, 0.3452308, 1, 0, 0, 1, 1,
-0.3221408, -0.3973068, -3.096622, 1, 0, 0, 1, 1,
-0.3190177, -1.764734, -3.72921, 1, 0, 0, 1, 1,
-0.3087778, -0.928782, -1.587858, 1, 0, 0, 1, 1,
-0.3043735, -1.046255, -2.39732, 0, 0, 0, 1, 1,
-0.2987893, -0.860887, -1.900985, 0, 0, 0, 1, 1,
-0.2965918, -2.009637, -3.831373, 0, 0, 0, 1, 1,
-0.293895, 0.01530495, -1.880111, 0, 0, 0, 1, 1,
-0.2883996, -0.794738, -2.403942, 0, 0, 0, 1, 1,
-0.2839416, 1.105617, -0.08369635, 0, 0, 0, 1, 1,
-0.2815479, 1.015572, 0.6212845, 0, 0, 0, 1, 1,
-0.2688437, 1.547648, 1.990933, 1, 1, 1, 1, 1,
-0.2653672, 0.4579757, -0.3909363, 1, 1, 1, 1, 1,
-0.2651851, 0.7932884, -0.5348682, 1, 1, 1, 1, 1,
-0.2614033, 1.155699, 2.491804, 1, 1, 1, 1, 1,
-0.261117, 0.2519725, -1.038917, 1, 1, 1, 1, 1,
-0.2602691, -1.103559, -3.35908, 1, 1, 1, 1, 1,
-0.2562428, -0.3387702, -1.510825, 1, 1, 1, 1, 1,
-0.2534834, 1.058406, -1.076342, 1, 1, 1, 1, 1,
-0.2437811, -0.2230629, -2.275837, 1, 1, 1, 1, 1,
-0.2417097, 1.113483, -1.653458, 1, 1, 1, 1, 1,
-0.2410761, -0.5497509, -1.341331, 1, 1, 1, 1, 1,
-0.2396996, -0.3739634, -0.3516585, 1, 1, 1, 1, 1,
-0.2388072, -1.076555, -2.103292, 1, 1, 1, 1, 1,
-0.2355716, -0.06370068, -0.3311821, 1, 1, 1, 1, 1,
-0.230923, -0.6600667, -3.718583, 1, 1, 1, 1, 1,
-0.2293214, -0.09822001, -2.355774, 0, 0, 1, 1, 1,
-0.2292734, 0.1278077, 0.5132405, 1, 0, 0, 1, 1,
-0.2263755, -0.7168999, -1.776988, 1, 0, 0, 1, 1,
-0.2223072, 0.5274661, 0.6409982, 1, 0, 0, 1, 1,
-0.2205512, -1.705944, -4.685322, 1, 0, 0, 1, 1,
-0.2187734, 1.008879, -0.1272823, 1, 0, 0, 1, 1,
-0.2167667, 0.2807359, -1.574038, 0, 0, 0, 1, 1,
-0.2145624, -0.8657859, -3.283837, 0, 0, 0, 1, 1,
-0.2109842, -1.836223, -0.721207, 0, 0, 0, 1, 1,
-0.2084835, 0.8158027, 0.856823, 0, 0, 0, 1, 1,
-0.2074056, 0.9287227, 0.7633957, 0, 0, 0, 1, 1,
-0.2066447, 0.4770827, 1.120935, 0, 0, 0, 1, 1,
-0.2052898, 0.1617851, -1.587524, 0, 0, 0, 1, 1,
-0.2041573, -0.01863602, 0.7981718, 1, 1, 1, 1, 1,
-0.2041473, -0.5261268, -3.241327, 1, 1, 1, 1, 1,
-0.2030836, -0.1977473, -1.491239, 1, 1, 1, 1, 1,
-0.2030589, -1.185575, -5.979356, 1, 1, 1, 1, 1,
-0.1996268, 1.441359, 0.2365465, 1, 1, 1, 1, 1,
-0.1975086, 0.355531, -1.835921, 1, 1, 1, 1, 1,
-0.1972536, -0.05611303, -0.435675, 1, 1, 1, 1, 1,
-0.1939483, 0.9775111, -0.8818647, 1, 1, 1, 1, 1,
-0.1935556, -0.2062117, -1.532068, 1, 1, 1, 1, 1,
-0.1857294, 0.7107063, -1.785556, 1, 1, 1, 1, 1,
-0.1788987, -0.4913242, -4.311188, 1, 1, 1, 1, 1,
-0.178309, 0.001938946, -0.2669606, 1, 1, 1, 1, 1,
-0.1754357, -0.3029499, -1.438721, 1, 1, 1, 1, 1,
-0.1719989, -0.7100626, -1.630661, 1, 1, 1, 1, 1,
-0.171514, -0.1744984, -2.164256, 1, 1, 1, 1, 1,
-0.1630418, -0.7440097, -3.490265, 0, 0, 1, 1, 1,
-0.1616934, 1.238004, -0.2847959, 1, 0, 0, 1, 1,
-0.1549934, 1.76087, 1.106778, 1, 0, 0, 1, 1,
-0.1548348, 0.1501635, -0.135318, 1, 0, 0, 1, 1,
-0.1482612, 0.2911017, -1.253243, 1, 0, 0, 1, 1,
-0.1445884, 1.551704, 0.929193, 1, 0, 0, 1, 1,
-0.143548, -1.222673, -2.465377, 0, 0, 0, 1, 1,
-0.1427813, 0.5543954, 0.9425437, 0, 0, 0, 1, 1,
-0.1358555, 1.427637, -0.9893832, 0, 0, 0, 1, 1,
-0.1313731, -0.6556727, -3.912087, 0, 0, 0, 1, 1,
-0.1291407, -0.6821048, -3.545509, 0, 0, 0, 1, 1,
-0.124142, -1.201977, -2.447679, 0, 0, 0, 1, 1,
-0.1136164, 0.37403, -1.127669, 0, 0, 0, 1, 1,
-0.1118583, 0.1394383, -0.8054777, 1, 1, 1, 1, 1,
-0.1045364, -1.942181, -3.705647, 1, 1, 1, 1, 1,
-0.09762184, -0.05462256, -3.355464, 1, 1, 1, 1, 1,
-0.0972102, 1.247485, 0.9616459, 1, 1, 1, 1, 1,
-0.09555198, -0.1386205, -2.193273, 1, 1, 1, 1, 1,
-0.09502302, -0.3869708, -4.676476, 1, 1, 1, 1, 1,
-0.09390429, -2.799131, -3.606223, 1, 1, 1, 1, 1,
-0.08930385, -0.693422, -1.782504, 1, 1, 1, 1, 1,
-0.08538593, -0.6051808, -2.485588, 1, 1, 1, 1, 1,
-0.06687131, -0.1323913, -3.608051, 1, 1, 1, 1, 1,
-0.06538855, 0.5707861, -1.926539, 1, 1, 1, 1, 1,
-0.06147124, -0.672415, -4.209331, 1, 1, 1, 1, 1,
-0.05426272, 0.950143, 0.4291981, 1, 1, 1, 1, 1,
-0.05365545, -1.468578, -1.345334, 1, 1, 1, 1, 1,
-0.05125317, 0.4808093, -0.5116805, 1, 1, 1, 1, 1,
-0.04482583, -1.954089, -2.780474, 0, 0, 1, 1, 1,
-0.04286369, 0.01287572, -2.498452, 1, 0, 0, 1, 1,
-0.04132583, -0.5904243, -3.68035, 1, 0, 0, 1, 1,
-0.03966793, 0.3234229, 0.2191906, 1, 0, 0, 1, 1,
-0.03661519, 0.9920728, -0.7230037, 1, 0, 0, 1, 1,
-0.03213327, -0.01861065, -2.267502, 1, 0, 0, 1, 1,
-0.02661643, -0.5365071, -2.52, 0, 0, 0, 1, 1,
-0.02419481, -0.5559959, -2.741489, 0, 0, 0, 1, 1,
-0.02305566, 0.5498314, 0.0317725, 0, 0, 0, 1, 1,
-0.01560868, -1.064254, -2.772302, 0, 0, 0, 1, 1,
-0.01395319, -0.7437464, -4.221908, 0, 0, 0, 1, 1,
-0.01378262, 0.5167731, 0.7514952, 0, 0, 0, 1, 1,
-0.01121183, -0.7520006, -2.603482, 0, 0, 0, 1, 1,
-0.01064255, -0.4689023, -2.442894, 1, 1, 1, 1, 1,
-0.01058269, 0.6945395, 1.049963, 1, 1, 1, 1, 1,
-0.008759498, 0.307135, 0.5175267, 1, 1, 1, 1, 1,
0.002459333, -0.3511309, 3.913226, 1, 1, 1, 1, 1,
0.002732765, -1.421466, 2.636631, 1, 1, 1, 1, 1,
0.006142313, 1.600582, -0.6478058, 1, 1, 1, 1, 1,
0.007272062, -0.1503483, 1.230687, 1, 1, 1, 1, 1,
0.007472252, -1.261473, 2.933436, 1, 1, 1, 1, 1,
0.007844897, 0.09340817, 2.78606, 1, 1, 1, 1, 1,
0.0080329, -0.4402255, 4.056552, 1, 1, 1, 1, 1,
0.00917073, -0.5466215, 3.776073, 1, 1, 1, 1, 1,
0.009371368, 0.2690295, 1.147188, 1, 1, 1, 1, 1,
0.0156514, 0.7319766, -0.7123669, 1, 1, 1, 1, 1,
0.01662777, 1.124244, -0.8698587, 1, 1, 1, 1, 1,
0.0167491, 1.426174, 2.683837, 1, 1, 1, 1, 1,
0.01691462, -0.885023, 3.793387, 0, 0, 1, 1, 1,
0.01691783, -0.3011613, 3.582481, 1, 0, 0, 1, 1,
0.02149617, 0.7648575, -0.3797791, 1, 0, 0, 1, 1,
0.02351166, -1.834422, 1.938876, 1, 0, 0, 1, 1,
0.02735011, -0.8934045, 2.764994, 1, 0, 0, 1, 1,
0.0296946, -0.06042021, 2.239191, 1, 0, 0, 1, 1,
0.03017769, -0.3452854, 3.953652, 0, 0, 0, 1, 1,
0.03425919, -0.1395587, 2.443566, 0, 0, 0, 1, 1,
0.03571365, 1.596087, -1.427361, 0, 0, 0, 1, 1,
0.0361069, 2.17686, -0.1350252, 0, 0, 0, 1, 1,
0.03684971, -1.298255, 3.572352, 0, 0, 0, 1, 1,
0.03785278, 0.8998988, -0.0330941, 0, 0, 0, 1, 1,
0.03825513, 0.9998723, 1.822087, 0, 0, 0, 1, 1,
0.0383392, -0.5207289, 4.452934, 1, 1, 1, 1, 1,
0.03854464, -0.2664999, 3.979513, 1, 1, 1, 1, 1,
0.04094587, -0.3474178, 4.837062, 1, 1, 1, 1, 1,
0.04212942, -1.105369, 3.334603, 1, 1, 1, 1, 1,
0.04349365, 0.8537719, -0.341445, 1, 1, 1, 1, 1,
0.04687529, 1.044108, -0.003181831, 1, 1, 1, 1, 1,
0.04752258, -0.2325748, 3.925052, 1, 1, 1, 1, 1,
0.04842069, 0.8869671, -0.1861182, 1, 1, 1, 1, 1,
0.04845721, -0.912514, 2.809973, 1, 1, 1, 1, 1,
0.04885875, 0.4356733, -0.1237157, 1, 1, 1, 1, 1,
0.04937534, -0.4946443, 1.242361, 1, 1, 1, 1, 1,
0.05230696, 0.4988419, -0.4124666, 1, 1, 1, 1, 1,
0.05418276, 1.229492, -0.9196981, 1, 1, 1, 1, 1,
0.05593542, 0.6233103, -1.287741, 1, 1, 1, 1, 1,
0.05676354, -0.526526, 2.652828, 1, 1, 1, 1, 1,
0.05974128, -0.1452193, 2.990281, 0, 0, 1, 1, 1,
0.06214712, -0.2738319, 2.555721, 1, 0, 0, 1, 1,
0.06441852, 0.2504384, 0.7903762, 1, 0, 0, 1, 1,
0.0650828, 0.7940487, 0.273646, 1, 0, 0, 1, 1,
0.0673264, -0.5253032, 3.969929, 1, 0, 0, 1, 1,
0.06742034, -1.778156, 3.08979, 1, 0, 0, 1, 1,
0.07138593, 0.5933048, 1.058495, 0, 0, 0, 1, 1,
0.07337439, -1.517217, 3.026306, 0, 0, 0, 1, 1,
0.07706083, -0.7686867, 3.535881, 0, 0, 0, 1, 1,
0.07721774, 1.301339, 0.3284444, 0, 0, 0, 1, 1,
0.08605564, 0.3688343, 0.5322443, 0, 0, 0, 1, 1,
0.08633941, -0.5270659, 2.672948, 0, 0, 0, 1, 1,
0.08744616, -1.722501, 2.58195, 0, 0, 0, 1, 1,
0.08744903, -1.244587, 3.189635, 1, 1, 1, 1, 1,
0.09001953, 0.7071978, 1.337784, 1, 1, 1, 1, 1,
0.09359308, 0.5601994, -1.065392, 1, 1, 1, 1, 1,
0.09376437, 1.368566, -2.545011, 1, 1, 1, 1, 1,
0.0960312, -1.282443, 2.526558, 1, 1, 1, 1, 1,
0.09951609, -1.731413, 2.461405, 1, 1, 1, 1, 1,
0.1050792, 0.5203403, 0.744161, 1, 1, 1, 1, 1,
0.1074519, 0.367359, -0.5175624, 1, 1, 1, 1, 1,
0.1076831, 0.4846467, -0.7340448, 1, 1, 1, 1, 1,
0.1081583, 0.2130179, 0.1632696, 1, 1, 1, 1, 1,
0.1127061, 1.295496, 1.483097, 1, 1, 1, 1, 1,
0.1180861, 0.7673375, 0.7158771, 1, 1, 1, 1, 1,
0.11843, 0.01525929, 2.143554, 1, 1, 1, 1, 1,
0.1247879, -1.074869, 4.379555, 1, 1, 1, 1, 1,
0.1251832, 0.2657858, 1.869109, 1, 1, 1, 1, 1,
0.1272238, -1.191739, 1.382392, 0, 0, 1, 1, 1,
0.1285519, -0.02893155, 1.112512, 1, 0, 0, 1, 1,
0.1316098, 0.4588603, -1.540273, 1, 0, 0, 1, 1,
0.1330941, -0.1490205, 4.301257, 1, 0, 0, 1, 1,
0.1374346, 0.6908233, -0.9945152, 1, 0, 0, 1, 1,
0.137942, -0.1215553, 1.802622, 1, 0, 0, 1, 1,
0.138509, 1.034546, -0.5812219, 0, 0, 0, 1, 1,
0.1428366, -0.7649035, 3.456626, 0, 0, 0, 1, 1,
0.1446208, -0.1063087, 3.608297, 0, 0, 0, 1, 1,
0.1452075, -1.106073, 3.374635, 0, 0, 0, 1, 1,
0.1471519, 0.4017416, 0.4494861, 0, 0, 0, 1, 1,
0.1485731, 0.2759068, 0.6665184, 0, 0, 0, 1, 1,
0.1491702, 0.1799683, 1.874584, 0, 0, 0, 1, 1,
0.1510389, -0.8578994, 3.803205, 1, 1, 1, 1, 1,
0.151942, -1.891513, 3.723811, 1, 1, 1, 1, 1,
0.1529286, -0.6220908, 0.2424502, 1, 1, 1, 1, 1,
0.1530284, 0.7226999, -0.2170201, 1, 1, 1, 1, 1,
0.1576279, 1.511732, 0.7868435, 1, 1, 1, 1, 1,
0.1579178, -0.7683473, 2.691185, 1, 1, 1, 1, 1,
0.1585535, 0.04497186, 0.7272202, 1, 1, 1, 1, 1,
0.1605668, 0.3372057, -0.7103309, 1, 1, 1, 1, 1,
0.1612763, -0.8148522, 3.380174, 1, 1, 1, 1, 1,
0.1628906, -0.4690485, 3.364889, 1, 1, 1, 1, 1,
0.1630603, 0.582705, 2.580322, 1, 1, 1, 1, 1,
0.1701221, -0.5943394, 2.959307, 1, 1, 1, 1, 1,
0.1710884, 0.5322102, 0.7236218, 1, 1, 1, 1, 1,
0.1713771, 0.7111841, 0.3311006, 1, 1, 1, 1, 1,
0.1742057, -1.949217, 3.083274, 1, 1, 1, 1, 1,
0.1842715, 0.3347442, 1.029292, 0, 0, 1, 1, 1,
0.1846438, -0.07535624, 2.480502, 1, 0, 0, 1, 1,
0.1856345, 2.06288, 1.5903, 1, 0, 0, 1, 1,
0.1857357, 1.612083, -0.8396062, 1, 0, 0, 1, 1,
0.1866965, 0.2295548, 0.9605784, 1, 0, 0, 1, 1,
0.1874662, 1.689739, -1.001768, 1, 0, 0, 1, 1,
0.1941584, -1.801498, 2.545235, 0, 0, 0, 1, 1,
0.1966483, 0.6181859, 0.5220888, 0, 0, 0, 1, 1,
0.1973125, -0.4707171, 3.242089, 0, 0, 0, 1, 1,
0.2009105, 0.09529235, 1.503623, 0, 0, 0, 1, 1,
0.2023493, 0.07426585, 2.573375, 0, 0, 0, 1, 1,
0.203872, -0.7440671, 2.429184, 0, 0, 0, 1, 1,
0.2046987, 0.09095787, 0.6110454, 0, 0, 0, 1, 1,
0.2073652, 1.677768, -0.8278955, 1, 1, 1, 1, 1,
0.207579, -1.230695, 2.594626, 1, 1, 1, 1, 1,
0.2094365, 0.1276342, 1.708644, 1, 1, 1, 1, 1,
0.2143345, 0.04439598, 2.012438, 1, 1, 1, 1, 1,
0.215506, 0.9411455, 0.7262438, 1, 1, 1, 1, 1,
0.2191704, 0.8421965, -0.02418229, 1, 1, 1, 1, 1,
0.2241008, -1.263612, 2.487848, 1, 1, 1, 1, 1,
0.2292207, -1.433535, 4.845584, 1, 1, 1, 1, 1,
0.2294725, 0.3692188, -0.3504724, 1, 1, 1, 1, 1,
0.234561, -0.1097874, 1.850035, 1, 1, 1, 1, 1,
0.2362992, 0.1843581, 1.739225, 1, 1, 1, 1, 1,
0.2365559, -0.517024, 4.52861, 1, 1, 1, 1, 1,
0.2381852, 0.1265986, 2.671493, 1, 1, 1, 1, 1,
0.2466256, 0.4341591, 1.135266, 1, 1, 1, 1, 1,
0.2484738, -0.8112122, 3.90391, 1, 1, 1, 1, 1,
0.2502351, -0.01946688, 1.226867, 0, 0, 1, 1, 1,
0.2503085, 1.284808, -0.08406901, 1, 0, 0, 1, 1,
0.2509667, 1.757813, 0.2650457, 1, 0, 0, 1, 1,
0.2514586, -1.191745, 3.962455, 1, 0, 0, 1, 1,
0.2525267, -1.444459, 2.402673, 1, 0, 0, 1, 1,
0.2534454, -1.161749, 2.092645, 1, 0, 0, 1, 1,
0.2560514, 1.789351, 1.046306, 0, 0, 0, 1, 1,
0.2581349, -0.7933089, 2.748959, 0, 0, 0, 1, 1,
0.25906, 0.6576319, -0.1209965, 0, 0, 0, 1, 1,
0.2600254, 0.1885111, 1.525639, 0, 0, 0, 1, 1,
0.261279, -0.2042733, 3.523431, 0, 0, 0, 1, 1,
0.272283, -0.05042791, 1.403162, 0, 0, 0, 1, 1,
0.2763421, 0.2965387, 1.836583, 0, 0, 0, 1, 1,
0.2783062, 2.320007, 0.5757248, 1, 1, 1, 1, 1,
0.2830805, -0.9318764, 4.295875, 1, 1, 1, 1, 1,
0.2849342, -0.2046264, 1.604537, 1, 1, 1, 1, 1,
0.2876285, 0.02776563, 0.5164246, 1, 1, 1, 1, 1,
0.2899193, 0.4385905, 0.2482716, 1, 1, 1, 1, 1,
0.2903264, 1.072149, 2.769491, 1, 1, 1, 1, 1,
0.2921999, -0.9621694, 3.45822, 1, 1, 1, 1, 1,
0.2932208, 1.218121, -0.4839982, 1, 1, 1, 1, 1,
0.2933601, -2.969789, 3.892744, 1, 1, 1, 1, 1,
0.2942164, 0.7368819, 1.582443, 1, 1, 1, 1, 1,
0.2949758, -0.4888669, 4.386566, 1, 1, 1, 1, 1,
0.296317, -0.6045328, 1.657603, 1, 1, 1, 1, 1,
0.3030744, -1.416748, 3.808888, 1, 1, 1, 1, 1,
0.3047359, -0.3981994, 1.54609, 1, 1, 1, 1, 1,
0.3121613, 0.8408886, 0.8422318, 1, 1, 1, 1, 1,
0.3169166, -1.201741, 1.363711, 0, 0, 1, 1, 1,
0.3177064, -2.232758, 4.323037, 1, 0, 0, 1, 1,
0.3179039, 0.4193301, 0.7366344, 1, 0, 0, 1, 1,
0.3264079, -0.008415055, 1.81879, 1, 0, 0, 1, 1,
0.3275435, -0.007559545, 2.0674, 1, 0, 0, 1, 1,
0.3342543, -0.3407558, 2.73969, 1, 0, 0, 1, 1,
0.3344644, -0.6126962, 1.903243, 0, 0, 0, 1, 1,
0.3389287, -1.642111, 3.287864, 0, 0, 0, 1, 1,
0.3393142, 0.6301079, 0.6515531, 0, 0, 0, 1, 1,
0.3400381, -1.501365, 3.305943, 0, 0, 0, 1, 1,
0.3404192, 0.9502321, 0.4645401, 0, 0, 0, 1, 1,
0.3410737, -1.490438, 1.553724, 0, 0, 0, 1, 1,
0.3460428, 0.3859583, 0.9930844, 0, 0, 0, 1, 1,
0.3476529, 0.7353793, -0.5371751, 1, 1, 1, 1, 1,
0.3509078, 0.6385926, 1.134426, 1, 1, 1, 1, 1,
0.3525126, 1.802504, -0.2700449, 1, 1, 1, 1, 1,
0.3567765, 0.2859163, 0.5105174, 1, 1, 1, 1, 1,
0.3571754, 0.5028697, -0.0528901, 1, 1, 1, 1, 1,
0.3593193, 0.0634052, 1.258742, 1, 1, 1, 1, 1,
0.3625143, -0.1554028, 3.35372, 1, 1, 1, 1, 1,
0.3625317, 0.855826, 1.788363, 1, 1, 1, 1, 1,
0.3632988, -0.5471594, 3.78796, 1, 1, 1, 1, 1,
0.3662197, -0.03931496, 1.288804, 1, 1, 1, 1, 1,
0.3669423, 0.5885183, 0.5490944, 1, 1, 1, 1, 1,
0.3710547, 0.221683, 0.6547335, 1, 1, 1, 1, 1,
0.3747068, 1.467618, 0.4839888, 1, 1, 1, 1, 1,
0.3783354, 0.2293872, 0.512045, 1, 1, 1, 1, 1,
0.3794504, -0.5187258, 3.863302, 1, 1, 1, 1, 1,
0.3796561, 0.3411857, 0.6428376, 0, 0, 1, 1, 1,
0.3821099, 0.8948757, -0.4047574, 1, 0, 0, 1, 1,
0.3823886, -1.364377, 4.582079, 1, 0, 0, 1, 1,
0.3887715, 1.601803, 0.3767059, 1, 0, 0, 1, 1,
0.3897345, -0.5492997, 3.282999, 1, 0, 0, 1, 1,
0.4000051, -0.4109248, 1.559199, 1, 0, 0, 1, 1,
0.4038841, -0.05429203, 1.507958, 0, 0, 0, 1, 1,
0.4053373, 0.1942618, 0.373062, 0, 0, 0, 1, 1,
0.4066342, -0.07713944, 3.498174, 0, 0, 0, 1, 1,
0.407934, -1.873163, 3.63507, 0, 0, 0, 1, 1,
0.4096943, 0.5504293, 0.04483495, 0, 0, 0, 1, 1,
0.4138271, 1.48705, 0.4052597, 0, 0, 0, 1, 1,
0.4174495, -0.05459503, 3.731425, 0, 0, 0, 1, 1,
0.4186214, 0.3503612, 0.6242082, 1, 1, 1, 1, 1,
0.4188968, -0.007454573, 0.6872545, 1, 1, 1, 1, 1,
0.4235577, 0.1448827, 2.375547, 1, 1, 1, 1, 1,
0.4247756, -1.29624, 1.175042, 1, 1, 1, 1, 1,
0.424888, 0.8358146, 1.282127, 1, 1, 1, 1, 1,
0.4262361, -0.003415405, 1.035273, 1, 1, 1, 1, 1,
0.4279264, -1.514536, 4.396346, 1, 1, 1, 1, 1,
0.4303724, 0.05000195, 2.10659, 1, 1, 1, 1, 1,
0.4347199, 0.3264591, 1.107777, 1, 1, 1, 1, 1,
0.4368933, -0.1370281, 1.273517, 1, 1, 1, 1, 1,
0.4370993, -1.373299, 3.550171, 1, 1, 1, 1, 1,
0.4371983, 1.00968, -0.5293863, 1, 1, 1, 1, 1,
0.4376194, -0.2597653, 2.185809, 1, 1, 1, 1, 1,
0.443296, -1.174285, 2.384253, 1, 1, 1, 1, 1,
0.4438276, -0.1171219, 0.7398347, 1, 1, 1, 1, 1,
0.4453495, 1.66275, 0.4650111, 0, 0, 1, 1, 1,
0.4472305, -0.7170015, 1.461916, 1, 0, 0, 1, 1,
0.4507442, 0.1971647, 1.450308, 1, 0, 0, 1, 1,
0.4578794, -0.4828313, 2.064787, 1, 0, 0, 1, 1,
0.4579659, -1.053903, 1.799285, 1, 0, 0, 1, 1,
0.4588466, 1.559074, 3.343698, 1, 0, 0, 1, 1,
0.4601907, 0.3050068, 1.211124, 0, 0, 0, 1, 1,
0.460343, -0.3614095, 1.149587, 0, 0, 0, 1, 1,
0.4647511, 0.1228021, 2.097316, 0, 0, 0, 1, 1,
0.4648076, -0.3874043, 2.171834, 0, 0, 0, 1, 1,
0.4650129, -0.8128348, 3.854404, 0, 0, 0, 1, 1,
0.4667774, 0.3191544, 1.915542, 0, 0, 0, 1, 1,
0.4671661, -0.1587514, 5.25508, 0, 0, 0, 1, 1,
0.4722361, -1.766847, 3.729291, 1, 1, 1, 1, 1,
0.4736275, -0.3532171, 2.901652, 1, 1, 1, 1, 1,
0.4758332, -1.675602, 2.937628, 1, 1, 1, 1, 1,
0.4882788, -0.1902009, 1.440696, 1, 1, 1, 1, 1,
0.4912375, 0.8110425, -0.3251055, 1, 1, 1, 1, 1,
0.4954129, 0.7524505, 0.1576375, 1, 1, 1, 1, 1,
0.4991144, 0.8989332, -0.301598, 1, 1, 1, 1, 1,
0.5010103, 1.120986, 0.07442256, 1, 1, 1, 1, 1,
0.5013098, 0.3340622, 1.699351, 1, 1, 1, 1, 1,
0.5029452, 0.4148262, 0.8350106, 1, 1, 1, 1, 1,
0.5170048, 1.368238, 0.502449, 1, 1, 1, 1, 1,
0.5177784, -0.9310063, 1.827458, 1, 1, 1, 1, 1,
0.5184397, 0.6058939, 0.1709332, 1, 1, 1, 1, 1,
0.5201519, 1.312701, -0.4796079, 1, 1, 1, 1, 1,
0.5211195, 0.03904275, 2.082509, 1, 1, 1, 1, 1,
0.5224721, 0.4740358, 0.7225624, 0, 0, 1, 1, 1,
0.5293003, 0.2473558, 0.4043619, 1, 0, 0, 1, 1,
0.5373298, -0.04482248, 2.810837, 1, 0, 0, 1, 1,
0.5381613, 0.6851434, 0.6666274, 1, 0, 0, 1, 1,
0.5409787, -0.5926822, 3.157218, 1, 0, 0, 1, 1,
0.541442, -1.056147, 3.064436, 1, 0, 0, 1, 1,
0.5421908, 0.5195216, 2.214265, 0, 0, 0, 1, 1,
0.5425895, 0.3541875, 2.505645, 0, 0, 0, 1, 1,
0.5594013, -0.08110904, 1.809236, 0, 0, 0, 1, 1,
0.5611444, -0.2423383, 0.8005412, 0, 0, 0, 1, 1,
0.5611854, -0.637294, 3.774129, 0, 0, 0, 1, 1,
0.5632095, -1.126441, 2.51588, 0, 0, 0, 1, 1,
0.5634964, -0.3933131, 2.397543, 0, 0, 0, 1, 1,
0.5701799, -0.3099264, -0.00514317, 1, 1, 1, 1, 1,
0.5714053, -1.869826, 2.731848, 1, 1, 1, 1, 1,
0.5721795, 0.6628526, 1.010508, 1, 1, 1, 1, 1,
0.5743204, 0.3736266, -0.9436731, 1, 1, 1, 1, 1,
0.5768059, 2.282933, -0.6566881, 1, 1, 1, 1, 1,
0.5790063, -0.5051536, 1.097496, 1, 1, 1, 1, 1,
0.5811806, -1.487359, 2.599637, 1, 1, 1, 1, 1,
0.5828098, -0.957009, 3.302711, 1, 1, 1, 1, 1,
0.5901374, 0.5896794, 0.3519899, 1, 1, 1, 1, 1,
0.5902039, 0.2821569, 1.695908, 1, 1, 1, 1, 1,
0.5994959, -0.8078527, 2.464154, 1, 1, 1, 1, 1,
0.6019161, 0.03945005, 2.447175, 1, 1, 1, 1, 1,
0.6049044, -1.533005, 2.749426, 1, 1, 1, 1, 1,
0.6097412, -0.6101935, 1.563516, 1, 1, 1, 1, 1,
0.6132383, 0.9040502, 0.06615832, 1, 1, 1, 1, 1,
0.6153028, -0.1206313, 1.946104, 0, 0, 1, 1, 1,
0.6160125, 0.1921484, -0.4382993, 1, 0, 0, 1, 1,
0.6169015, -2.479165, 1.228043, 1, 0, 0, 1, 1,
0.6227999, -0.08091864, 0.2389638, 1, 0, 0, 1, 1,
0.6270577, 0.1600358, -0.6252395, 1, 0, 0, 1, 1,
0.6361755, -0.4280734, 3.756296, 1, 0, 0, 1, 1,
0.6415791, 0.5004262, -0.3285411, 0, 0, 0, 1, 1,
0.6444064, -0.2387168, 3.615553, 0, 0, 0, 1, 1,
0.6484866, -0.5705143, 2.80605, 0, 0, 0, 1, 1,
0.6501319, -0.3067473, 1.69187, 0, 0, 0, 1, 1,
0.6557171, -0.351498, 1.219892, 0, 0, 0, 1, 1,
0.6565359, -0.3368289, 1.288901, 0, 0, 0, 1, 1,
0.6572911, 1.28378, -0.05704795, 0, 0, 0, 1, 1,
0.6591473, -0.7157442, 2.723114, 1, 1, 1, 1, 1,
0.6640288, -1.049413, 3.89713, 1, 1, 1, 1, 1,
0.6644725, -0.9610679, 2.090083, 1, 1, 1, 1, 1,
0.6688262, 0.7838218, 0.4751968, 1, 1, 1, 1, 1,
0.6720948, 1.822895, -1.147959, 1, 1, 1, 1, 1,
0.6740145, 0.3263655, 1.456053, 1, 1, 1, 1, 1,
0.6769703, -1.88711, 4.676985, 1, 1, 1, 1, 1,
0.6824711, -0.1697217, 0.6733087, 1, 1, 1, 1, 1,
0.691249, -0.1746701, 2.875905, 1, 1, 1, 1, 1,
0.7005973, -0.3947974, 1.880463, 1, 1, 1, 1, 1,
0.7057648, 0.4843692, 1.122674, 1, 1, 1, 1, 1,
0.7077425, -1.067782, 3.331789, 1, 1, 1, 1, 1,
0.7078673, 1.512415, -0.2007781, 1, 1, 1, 1, 1,
0.7126467, 0.08235901, 1.058164, 1, 1, 1, 1, 1,
0.7126922, -0.1150255, 1.661946, 1, 1, 1, 1, 1,
0.7162608, -0.108324, 0.7820776, 0, 0, 1, 1, 1,
0.7176583, -0.05262549, 1.25, 1, 0, 0, 1, 1,
0.7184018, -1.162504, 4.28383, 1, 0, 0, 1, 1,
0.7204729, 0.8088893, 2.007247, 1, 0, 0, 1, 1,
0.7218839, 1.040401, 0.8279855, 1, 0, 0, 1, 1,
0.7247838, -0.6862984, 2.122506, 1, 0, 0, 1, 1,
0.7258553, 0.725314, 1.802166, 0, 0, 0, 1, 1,
0.7300223, 1.102138, 4.139316, 0, 0, 0, 1, 1,
0.7300966, 0.9646833, 1.242519, 0, 0, 0, 1, 1,
0.7375731, -0.06043427, 4.44857, 0, 0, 0, 1, 1,
0.7437729, -0.5637167, 1.874934, 0, 0, 0, 1, 1,
0.7477428, -1.315746, 3.057694, 0, 0, 0, 1, 1,
0.7509108, -0.1482694, 1.880501, 0, 0, 0, 1, 1,
0.751412, -0.1996247, 1.60949, 1, 1, 1, 1, 1,
0.7525641, -0.3560203, 2.061018, 1, 1, 1, 1, 1,
0.7569845, -0.4793964, 0.9222774, 1, 1, 1, 1, 1,
0.7616972, 0.09793779, 2.495393, 1, 1, 1, 1, 1,
0.769254, 0.2987787, 0.740095, 1, 1, 1, 1, 1,
0.7774705, -0.3059458, 0.6625315, 1, 1, 1, 1, 1,
0.7815789, 0.08794233, -0.1294214, 1, 1, 1, 1, 1,
0.7912113, -0.4916592, 1.841902, 1, 1, 1, 1, 1,
0.7922125, 1.918404, -0.4852181, 1, 1, 1, 1, 1,
0.8049871, 0.05717336, 0.6683195, 1, 1, 1, 1, 1,
0.8081156, -0.8722276, 3.215258, 1, 1, 1, 1, 1,
0.8112559, 0.172276, 1.410545, 1, 1, 1, 1, 1,
0.8144626, -0.4788157, 1.050796, 1, 1, 1, 1, 1,
0.8145705, 0.1565469, 0.9317969, 1, 1, 1, 1, 1,
0.8155305, 0.3382335, 0.7527806, 1, 1, 1, 1, 1,
0.8174649, 1.337173, -0.854351, 0, 0, 1, 1, 1,
0.829687, -0.5967141, 1.480742, 1, 0, 0, 1, 1,
0.8298234, -0.4504299, 2.419897, 1, 0, 0, 1, 1,
0.837779, 0.08836234, 1.186449, 1, 0, 0, 1, 1,
0.8414476, -0.02514221, 2.738545, 1, 0, 0, 1, 1,
0.8431308, 0.4380296, 0.5194187, 1, 0, 0, 1, 1,
0.8433904, 1.576017, 0.8448552, 0, 0, 0, 1, 1,
0.84622, 1.541893, 0.1512485, 0, 0, 0, 1, 1,
0.8544608, 0.4813482, 0.9805942, 0, 0, 0, 1, 1,
0.8571084, -0.4868592, 2.626522, 0, 0, 0, 1, 1,
0.8578477, -1.115265, 2.991626, 0, 0, 0, 1, 1,
0.8615177, 1.85748, -1.612188, 0, 0, 0, 1, 1,
0.8627816, 0.7610719, -0.1976881, 0, 0, 0, 1, 1,
0.8636285, -1.241236, 0.3008431, 1, 1, 1, 1, 1,
0.8661284, -0.09735923, 3.309821, 1, 1, 1, 1, 1,
0.8673654, 0.5581806, 1.241424, 1, 1, 1, 1, 1,
0.8777307, 0.08977885, 3.821146, 1, 1, 1, 1, 1,
0.8825958, -0.8822007, 2.209572, 1, 1, 1, 1, 1,
0.8868588, 0.248093, 1.813431, 1, 1, 1, 1, 1,
0.8898988, -0.2339273, 3.233199, 1, 1, 1, 1, 1,
0.8972367, 0.4061169, -1.160489, 1, 1, 1, 1, 1,
0.901453, 0.4749251, 1.972686, 1, 1, 1, 1, 1,
0.9028293, -1.424881, 3.279862, 1, 1, 1, 1, 1,
0.9096171, -0.2537928, 1.783233, 1, 1, 1, 1, 1,
0.918162, -1.850994, 3.774313, 1, 1, 1, 1, 1,
0.9247989, 0.3210383, 1.738903, 1, 1, 1, 1, 1,
0.9285336, 1.106462, 0.05902523, 1, 1, 1, 1, 1,
0.9305317, -0.7511572, 2.108383, 1, 1, 1, 1, 1,
0.9306426, -2.650524, 2.808265, 0, 0, 1, 1, 1,
0.9316902, -0.9421324, 4.203806, 1, 0, 0, 1, 1,
0.9333664, 1.290474, 1.281887, 1, 0, 0, 1, 1,
0.9374292, -0.7883125, 2.515306, 1, 0, 0, 1, 1,
0.9424672, 2.56547, -2.399791, 1, 0, 0, 1, 1,
0.9452422, 0.2824801, -0.8401712, 1, 0, 0, 1, 1,
0.9523095, -2.039869, 2.934282, 0, 0, 0, 1, 1,
0.960507, 0.6482826, -0.9019705, 0, 0, 0, 1, 1,
0.9612316, 0.5000688, 0.6532258, 0, 0, 0, 1, 1,
0.9621873, 2.449592, -0.3590315, 0, 0, 0, 1, 1,
0.9678549, 0.9395761, 0.238062, 0, 0, 0, 1, 1,
0.9705309, 0.5824655, 1.470231, 0, 0, 0, 1, 1,
0.9716232, 1.116245, 0.3023339, 0, 0, 0, 1, 1,
0.9766795, 0.7741688, 2.075611, 1, 1, 1, 1, 1,
0.9815583, -0.485515, 3.508857, 1, 1, 1, 1, 1,
0.9888716, -0.03651465, 2.05214, 1, 1, 1, 1, 1,
0.9896785, -0.9473819, 2.151519, 1, 1, 1, 1, 1,
0.9907402, -0.0009141716, 1.863462, 1, 1, 1, 1, 1,
0.9949537, 0.2733979, 1.757126, 1, 1, 1, 1, 1,
0.997722, 0.459977, 1.514765, 1, 1, 1, 1, 1,
1.001467, -0.8294214, 1.681896, 1, 1, 1, 1, 1,
1.004961, -0.5001643, 1.086342, 1, 1, 1, 1, 1,
1.005887, -0.9411859, 4.389949, 1, 1, 1, 1, 1,
1.011139, -0.07871066, 1.650515, 1, 1, 1, 1, 1,
1.012771, -0.04797823, -0.01649985, 1, 1, 1, 1, 1,
1.013593, -0.08776704, -0.4174292, 1, 1, 1, 1, 1,
1.018111, 0.6571913, -0.1164383, 1, 1, 1, 1, 1,
1.018719, -1.443355, 3.282196, 1, 1, 1, 1, 1,
1.020974, 0.9020405, 2.147592, 0, 0, 1, 1, 1,
1.025213, -1.063643, 3.884511, 1, 0, 0, 1, 1,
1.034117, 1.826477, -1.323415, 1, 0, 0, 1, 1,
1.047575, -0.1177022, 3.03095, 1, 0, 0, 1, 1,
1.053827, 0.6904626, -0.8199416, 1, 0, 0, 1, 1,
1.059027, -0.547707, 3.125418, 1, 0, 0, 1, 1,
1.059069, 1.477541, 0.1458804, 0, 0, 0, 1, 1,
1.062379, -0.4806569, 3.451236, 0, 0, 0, 1, 1,
1.063582, 1.266882, 1.216589, 0, 0, 0, 1, 1,
1.07181, 0.1223493, 0.868651, 0, 0, 0, 1, 1,
1.110138, -0.7450317, 1.845125, 0, 0, 0, 1, 1,
1.112509, 1.522818, 2.089663, 0, 0, 0, 1, 1,
1.114108, -0.7649053, 2.95493, 0, 0, 0, 1, 1,
1.115528, 1.400438, 1.719524, 1, 1, 1, 1, 1,
1.118242, -1.462002, 2.545344, 1, 1, 1, 1, 1,
1.119428, -0.3910015, 2.983314, 1, 1, 1, 1, 1,
1.132064, -0.7090724, 1.397268, 1, 1, 1, 1, 1,
1.133378, -1.646218, 0.7055146, 1, 1, 1, 1, 1,
1.136846, 1.599744, 0.3361489, 1, 1, 1, 1, 1,
1.138831, 0.3286284, 1.368616, 1, 1, 1, 1, 1,
1.141775, -2.042622, 2.535002, 1, 1, 1, 1, 1,
1.146941, -0.5948312, 1.211648, 1, 1, 1, 1, 1,
1.147977, 1.002063, 0.9603454, 1, 1, 1, 1, 1,
1.151314, -0.6384351, 2.952883, 1, 1, 1, 1, 1,
1.15541, -1.252518, 2.473464, 1, 1, 1, 1, 1,
1.155977, -0.3578874, 2.767608, 1, 1, 1, 1, 1,
1.160256, 1.801993, 0.4869764, 1, 1, 1, 1, 1,
1.161849, 0.6531142, 1.887164, 1, 1, 1, 1, 1,
1.16387, 0.7256892, 0.1862912, 0, 0, 1, 1, 1,
1.16457, 0.3226359, 0.7092276, 1, 0, 0, 1, 1,
1.166765, 0.4412865, 2.447299, 1, 0, 0, 1, 1,
1.170809, -0.01496912, 1.132416, 1, 0, 0, 1, 1,
1.173881, -2.187943, 0.7770987, 1, 0, 0, 1, 1,
1.176297, -0.5734416, 1.093184, 1, 0, 0, 1, 1,
1.181128, -0.007227594, 1.928253, 0, 0, 0, 1, 1,
1.182547, 0.956996, -1.975983, 0, 0, 0, 1, 1,
1.189713, 0.4123571, 2.011657, 0, 0, 0, 1, 1,
1.198161, -0.9557231, 2.541071, 0, 0, 0, 1, 1,
1.201823, -0.3083781, 1.446237, 0, 0, 0, 1, 1,
1.204802, 1.46639, 2.0934, 0, 0, 0, 1, 1,
1.21092, -0.3646262, 0.9886488, 0, 0, 0, 1, 1,
1.212327, 0.9165992, 0.2860386, 1, 1, 1, 1, 1,
1.218514, 1.149004, 0.2001237, 1, 1, 1, 1, 1,
1.224004, 0.5638658, 1.161532, 1, 1, 1, 1, 1,
1.226492, -0.1165586, 1.191019, 1, 1, 1, 1, 1,
1.238393, 0.4589058, 0.3087907, 1, 1, 1, 1, 1,
1.247002, 1.456263, 1.650989, 1, 1, 1, 1, 1,
1.249753, 0.1775883, 1.437345, 1, 1, 1, 1, 1,
1.257536, 0.3606548, 1.548111, 1, 1, 1, 1, 1,
1.25888, -0.7701505, 1.2066, 1, 1, 1, 1, 1,
1.263688, -0.1882976, 2.649119, 1, 1, 1, 1, 1,
1.26375, 0.6642519, 1.176598, 1, 1, 1, 1, 1,
1.266366, -1.974815, 3.539059, 1, 1, 1, 1, 1,
1.267744, 0.539127, 1.638278, 1, 1, 1, 1, 1,
1.277296, 0.1185181, 1.985038, 1, 1, 1, 1, 1,
1.27822, -1.035108, 0.9765811, 1, 1, 1, 1, 1,
1.294293, 0.2932591, 2.063339, 0, 0, 1, 1, 1,
1.300302, 1.933158, 1.040619, 1, 0, 0, 1, 1,
1.303378, -1.182805, 1.830133, 1, 0, 0, 1, 1,
1.311158, -0.02505666, 0.5640994, 1, 0, 0, 1, 1,
1.319703, -1.354935, 1.658935, 1, 0, 0, 1, 1,
1.325722, -1.186223, 1.723692, 1, 0, 0, 1, 1,
1.32618, -0.6457617, 2.84162, 0, 0, 0, 1, 1,
1.330436, -0.0913161, 3.489823, 0, 0, 0, 1, 1,
1.339798, 1.912029, 1.283788, 0, 0, 0, 1, 1,
1.345798, 1.278065, 1.492012, 0, 0, 0, 1, 1,
1.350569, 0.4305995, 0.1401713, 0, 0, 0, 1, 1,
1.355163, -0.2488433, 1.142479, 0, 0, 0, 1, 1,
1.363157, 0.691643, 0.422292, 0, 0, 0, 1, 1,
1.364737, 0.2190162, -0.1141823, 1, 1, 1, 1, 1,
1.364858, 0.05453494, 2.660492, 1, 1, 1, 1, 1,
1.365486, -0.2307972, 0.7535113, 1, 1, 1, 1, 1,
1.365669, -0.2108694, 1.551808, 1, 1, 1, 1, 1,
1.367254, 0.5421645, 2.18387, 1, 1, 1, 1, 1,
1.37503, -0.1771768, 1.277586, 1, 1, 1, 1, 1,
1.379396, 0.3997883, 1.627905, 1, 1, 1, 1, 1,
1.386765, -0.4862862, 1.745146, 1, 1, 1, 1, 1,
1.393806, -0.09148592, 1.114938, 1, 1, 1, 1, 1,
1.422517, -0.995825, 2.154146, 1, 1, 1, 1, 1,
1.442022, -0.9921901, 0.8935626, 1, 1, 1, 1, 1,
1.443106, 0.07407843, 2.813669, 1, 1, 1, 1, 1,
1.470706, -0.2380329, 2.506345, 1, 1, 1, 1, 1,
1.474679, -0.1651562, 0.8467926, 1, 1, 1, 1, 1,
1.479006, 1.012999, 1.162978, 1, 1, 1, 1, 1,
1.491393, 1.044674, 2.522992, 0, 0, 1, 1, 1,
1.492287, -0.1880152, 0.8731534, 1, 0, 0, 1, 1,
1.496499, 1.35181, 1.293998, 1, 0, 0, 1, 1,
1.501572, -1.760153, 2.347393, 1, 0, 0, 1, 1,
1.510792, 0.7703917, 2.783561, 1, 0, 0, 1, 1,
1.514561, 2.029887, 0.7096093, 1, 0, 0, 1, 1,
1.518321, 2.237672, 2.48402, 0, 0, 0, 1, 1,
1.522677, 1.001474, 0.4781699, 0, 0, 0, 1, 1,
1.542571, 0.5922127, 0.9828789, 0, 0, 0, 1, 1,
1.546298, -0.9957235, 1.592806, 0, 0, 0, 1, 1,
1.55297, 0.2665856, 1.95562, 0, 0, 0, 1, 1,
1.554489, -0.5120821, 1.699171, 0, 0, 0, 1, 1,
1.560444, -2.619595, 3.549215, 0, 0, 0, 1, 1,
1.566784, -0.2975697, 2.578198, 1, 1, 1, 1, 1,
1.579456, 0.3154538, 2.856688, 1, 1, 1, 1, 1,
1.59005, -1.469628, 2.710669, 1, 1, 1, 1, 1,
1.591811, -0.2793028, 3.830898, 1, 1, 1, 1, 1,
1.593992, 0.5255924, -0.3704403, 1, 1, 1, 1, 1,
1.599929, 0.08650077, 1.76964, 1, 1, 1, 1, 1,
1.606547, 1.126078, 0.6562229, 1, 1, 1, 1, 1,
1.626587, 0.8101945, 2.368805, 1, 1, 1, 1, 1,
1.626972, 0.1832092, 1.245133, 1, 1, 1, 1, 1,
1.631326, 0.01465711, 0.09426948, 1, 1, 1, 1, 1,
1.645969, -0.4290633, 2.840893, 1, 1, 1, 1, 1,
1.655178, -0.3924595, 1.813996, 1, 1, 1, 1, 1,
1.679985, 0.3730713, 2.107626, 1, 1, 1, 1, 1,
1.699083, 0.4609329, 0.6119128, 1, 1, 1, 1, 1,
1.699898, -0.9576152, 4.032433, 1, 1, 1, 1, 1,
1.710607, 0.2978341, 2.28673, 0, 0, 1, 1, 1,
1.720641, -0.4385808, 2.446523, 1, 0, 0, 1, 1,
1.763736, -0.2817, 0.9319037, 1, 0, 0, 1, 1,
1.780108, 0.3049748, -0.4250275, 1, 0, 0, 1, 1,
1.78091, 1.091338, -0.06579491, 1, 0, 0, 1, 1,
1.79336, -0.3160951, 1.554543, 1, 0, 0, 1, 1,
1.832945, 0.87907, 1.639534, 0, 0, 0, 1, 1,
1.834916, -0.2765961, 1.219481, 0, 0, 0, 1, 1,
1.853463, -1.641159, 2.172417, 0, 0, 0, 1, 1,
1.870763, -0.6147181, 2.552774, 0, 0, 0, 1, 1,
1.874087, -0.8796403, 2.986904, 0, 0, 0, 1, 1,
1.886688, 0.5831482, 2.215338, 0, 0, 0, 1, 1,
1.899763, -0.1953434, 2.58917, 0, 0, 0, 1, 1,
1.925744, -1.170879, 2.461167, 1, 1, 1, 1, 1,
1.927545, -1.178221, 3.916016, 1, 1, 1, 1, 1,
1.934392, -0.3966084, 1.329909, 1, 1, 1, 1, 1,
1.947878, -1.496997, 2.476609, 1, 1, 1, 1, 1,
1.949437, -0.6746314, 0.3309075, 1, 1, 1, 1, 1,
1.952592, -0.4513932, 0.1991134, 1, 1, 1, 1, 1,
2.014943, -0.5296632, 2.42275, 1, 1, 1, 1, 1,
2.03539, 1.118067, -0.08555162, 1, 1, 1, 1, 1,
2.045424, -0.4251804, 2.057062, 1, 1, 1, 1, 1,
2.051699, 1.749439, 2.161818, 1, 1, 1, 1, 1,
2.090231, 0.0737526, 2.877086, 1, 1, 1, 1, 1,
2.103452, -2.702648, 1.259134, 1, 1, 1, 1, 1,
2.103456, -0.5196257, 2.304655, 1, 1, 1, 1, 1,
2.110894, -0.2355612, 3.357922, 1, 1, 1, 1, 1,
2.149875, -0.2870373, 2.27607, 1, 1, 1, 1, 1,
2.158609, -0.07930019, 1.362931, 0, 0, 1, 1, 1,
2.165329, -0.7318196, 2.92911, 1, 0, 0, 1, 1,
2.206372, -0.2504174, 1.917732, 1, 0, 0, 1, 1,
2.206748, 0.4517278, 0.6735474, 1, 0, 0, 1, 1,
2.218424, -1.787477, 2.028416, 1, 0, 0, 1, 1,
2.227762, -0.1356567, 1.630121, 1, 0, 0, 1, 1,
2.231781, -1.76111, 2.727971, 0, 0, 0, 1, 1,
2.232723, -0.1522049, 0.673711, 0, 0, 0, 1, 1,
2.236386, 0.5104408, 2.370655, 0, 0, 0, 1, 1,
2.253761, 1.085155, 0.1518035, 0, 0, 0, 1, 1,
2.284971, 0.495583, 2.497277, 0, 0, 0, 1, 1,
2.325648, 1.281116, 2.410121, 0, 0, 0, 1, 1,
2.393661, -0.6075278, 0.745419, 0, 0, 0, 1, 1,
2.438553, -0.06312883, 0.9532822, 1, 1, 1, 1, 1,
2.489548, -0.8855263, 0.4754703, 1, 1, 1, 1, 1,
2.50563, -0.5580599, 1.37519, 1, 1, 1, 1, 1,
2.513959, -0.594431, 2.929908, 1, 1, 1, 1, 1,
2.530552, 0.7722871, 1.37522, 1, 1, 1, 1, 1,
2.595124, -1.060613, 2.28704, 1, 1, 1, 1, 1,
2.616657, 0.7889705, 2.673044, 1, 1, 1, 1, 1
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
var radius = 9.679769;
var distance = 33.99977;
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
mvMatrix.translate( 0.3365709, 0.4280418, 0.362138 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.99977);
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