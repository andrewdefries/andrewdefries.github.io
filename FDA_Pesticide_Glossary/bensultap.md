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
-2.90453, 1.179457, -0.5012901, 1, 0, 0, 1,
-2.737125, 0.04205887, -1.437787, 1, 0.007843138, 0, 1,
-2.713125, 1.153641, -3.108114, 1, 0.01176471, 0, 1,
-2.663928, 1.055385, 0.6063938, 1, 0.01960784, 0, 1,
-2.58154, -1.189006, -3.133288, 1, 0.02352941, 0, 1,
-2.496053, 0.2379628, 0.231922, 1, 0.03137255, 0, 1,
-2.473625, 1.272302, -1.981299, 1, 0.03529412, 0, 1,
-2.465583, 0.5490346, -1.989277, 1, 0.04313726, 0, 1,
-2.41823, -0.1348153, -0.7164128, 1, 0.04705882, 0, 1,
-2.362352, -1.161868, -1.785414, 1, 0.05490196, 0, 1,
-2.341523, 1.913213, -1.547426, 1, 0.05882353, 0, 1,
-2.268162, 0.7394098, -1.447923, 1, 0.06666667, 0, 1,
-2.245505, 0.6939929, -3.411159, 1, 0.07058824, 0, 1,
-2.23146, 0.1382312, -1.849863, 1, 0.07843138, 0, 1,
-2.210176, 1.153707, 0.4333531, 1, 0.08235294, 0, 1,
-2.200435, -0.1316102, -2.154362, 1, 0.09019608, 0, 1,
-2.168255, 0.3952346, -0.3595816, 1, 0.09411765, 0, 1,
-2.111131, 0.9757159, 0.03216232, 1, 0.1019608, 0, 1,
-2.090514, -0.01073515, -1.870404, 1, 0.1098039, 0, 1,
-2.088653, -1.89681, -2.508201, 1, 0.1137255, 0, 1,
-2.085547, -0.1486794, -1.90482, 1, 0.1215686, 0, 1,
-2.073686, -1.847122, -1.377214, 1, 0.1254902, 0, 1,
-2.034563, -0.1845228, -1.249229, 1, 0.1333333, 0, 1,
-2.031707, 2.205811, -0.8056, 1, 0.1372549, 0, 1,
-2.030532, -0.1551507, -2.287627, 1, 0.145098, 0, 1,
-2.025967, -0.1875487, -2.435117, 1, 0.1490196, 0, 1,
-2.025105, 0.9846866, -1.372472, 1, 0.1568628, 0, 1,
-1.962175, 0.5306404, -1.674814, 1, 0.1607843, 0, 1,
-1.961431, 0.8138655, 0.2266569, 1, 0.1686275, 0, 1,
-1.960162, 1.717074, 0.05302639, 1, 0.172549, 0, 1,
-1.945047, 0.4543824, -3.352992, 1, 0.1803922, 0, 1,
-1.933251, -0.984271, -2.902562, 1, 0.1843137, 0, 1,
-1.926454, 0.6396564, 0.2623708, 1, 0.1921569, 0, 1,
-1.911737, 0.1117402, -0.6177409, 1, 0.1960784, 0, 1,
-1.90577, -0.2492309, -2.017575, 1, 0.2039216, 0, 1,
-1.890511, -0.4907426, -0.5142172, 1, 0.2117647, 0, 1,
-1.872385, -0.5688888, -3.307199, 1, 0.2156863, 0, 1,
-1.859533, 0.1846552, -1.577679, 1, 0.2235294, 0, 1,
-1.808512, -0.08701049, -0.796079, 1, 0.227451, 0, 1,
-1.800324, -0.4366941, -0.2203909, 1, 0.2352941, 0, 1,
-1.789714, 0.5767639, -1.335932, 1, 0.2392157, 0, 1,
-1.784415, -0.6275946, -0.7399238, 1, 0.2470588, 0, 1,
-1.761838, 1.57775, -1.371433, 1, 0.2509804, 0, 1,
-1.742795, 0.009521383, -1.228133, 1, 0.2588235, 0, 1,
-1.688447, 1.199185, 0.1100486, 1, 0.2627451, 0, 1,
-1.682638, -0.1501638, -2.253503, 1, 0.2705882, 0, 1,
-1.682482, 1.536222, -0.004720916, 1, 0.2745098, 0, 1,
-1.667903, -0.1612751, -0.9364039, 1, 0.282353, 0, 1,
-1.66746, 0.8572552, -1.100172, 1, 0.2862745, 0, 1,
-1.66729, 0.734001, -0.775851, 1, 0.2941177, 0, 1,
-1.648448, -0.1542461, -0.9270173, 1, 0.3019608, 0, 1,
-1.648248, -0.2541405, -1.050307, 1, 0.3058824, 0, 1,
-1.646689, 1.015693, -1.604745, 1, 0.3137255, 0, 1,
-1.632313, -1.205291, -3.014536, 1, 0.3176471, 0, 1,
-1.632147, 0.7109879, -0.2622283, 1, 0.3254902, 0, 1,
-1.619415, 1.917424, -0.6379842, 1, 0.3294118, 0, 1,
-1.618302, 0.4059451, 0.4747266, 1, 0.3372549, 0, 1,
-1.607299, 0.8406861, -2.101465, 1, 0.3411765, 0, 1,
-1.600126, -0.629316, -2.861676, 1, 0.3490196, 0, 1,
-1.565069, -1.183823, -2.76032, 1, 0.3529412, 0, 1,
-1.554778, 0.8285004, 0.559375, 1, 0.3607843, 0, 1,
-1.550854, -0.6018243, -3.455572, 1, 0.3647059, 0, 1,
-1.549349, -0.7279444, -1.850334, 1, 0.372549, 0, 1,
-1.533985, 0.6809796, -0.3818742, 1, 0.3764706, 0, 1,
-1.526832, 0.2490863, -1.835048, 1, 0.3843137, 0, 1,
-1.526416, 0.006945312, -2.075799, 1, 0.3882353, 0, 1,
-1.521021, -1.045216, -1.405434, 1, 0.3960784, 0, 1,
-1.504444, 0.04310852, -0.9626147, 1, 0.4039216, 0, 1,
-1.502309, -1.266587, -1.683967, 1, 0.4078431, 0, 1,
-1.493543, 0.7361053, -0.739355, 1, 0.4156863, 0, 1,
-1.472652, -0.4256542, -4.810544, 1, 0.4196078, 0, 1,
-1.469468, -0.6608845, -0.8549804, 1, 0.427451, 0, 1,
-1.461638, -0.4564537, 0.2764525, 1, 0.4313726, 0, 1,
-1.452587, 0.2786396, -0.3592105, 1, 0.4392157, 0, 1,
-1.443906, 0.4638767, -3.14047, 1, 0.4431373, 0, 1,
-1.443814, 0.4352151, -1.484642, 1, 0.4509804, 0, 1,
-1.442584, -1.166366, -2.701216, 1, 0.454902, 0, 1,
-1.423145, 0.2015758, -2.039654, 1, 0.4627451, 0, 1,
-1.420391, -0.3138423, -0.3798606, 1, 0.4666667, 0, 1,
-1.406303, 0.2230146, -1.63859, 1, 0.4745098, 0, 1,
-1.404801, 0.6631413, -3.789564, 1, 0.4784314, 0, 1,
-1.403094, 1.206746, -1.279027, 1, 0.4862745, 0, 1,
-1.398662, 0.7558372, -0.1794249, 1, 0.4901961, 0, 1,
-1.389216, 1.954427, -2.060661, 1, 0.4980392, 0, 1,
-1.386066, 0.263175, -3.387712, 1, 0.5058824, 0, 1,
-1.380969, 0.1513438, -0.5254439, 1, 0.509804, 0, 1,
-1.372579, -1.309963, -3.374067, 1, 0.5176471, 0, 1,
-1.366936, -0.4188253, -2.373718, 1, 0.5215687, 0, 1,
-1.354571, 0.4708018, -1.911157, 1, 0.5294118, 0, 1,
-1.352688, 0.9295933, -0.5485189, 1, 0.5333334, 0, 1,
-1.346129, 1.346882, -0.1454934, 1, 0.5411765, 0, 1,
-1.339366, -0.2603406, -1.54219, 1, 0.5450981, 0, 1,
-1.337913, -0.9991009, -1.036686, 1, 0.5529412, 0, 1,
-1.321537, -1.869277, -3.424798, 1, 0.5568628, 0, 1,
-1.314948, -1.022673, -1.481035, 1, 0.5647059, 0, 1,
-1.302603, -0.1008694, -0.2808794, 1, 0.5686275, 0, 1,
-1.292918, 1.007517, -0.09689105, 1, 0.5764706, 0, 1,
-1.292802, -0.9105282, -1.899105, 1, 0.5803922, 0, 1,
-1.282083, 0.7954732, -0.03891485, 1, 0.5882353, 0, 1,
-1.282005, 2.547469, -0.2400423, 1, 0.5921569, 0, 1,
-1.277353, -2.598622, -2.946367, 1, 0.6, 0, 1,
-1.26626, -0.6621462, -1.102363, 1, 0.6078432, 0, 1,
-1.261129, 1.384743, -0.4385986, 1, 0.6117647, 0, 1,
-1.241678, -0.8995013, -3.85317, 1, 0.6196079, 0, 1,
-1.234179, 0.1147023, -1.79804, 1, 0.6235294, 0, 1,
-1.233669, -0.3584543, -3.815365, 1, 0.6313726, 0, 1,
-1.233009, 0.1509268, -0.4586992, 1, 0.6352941, 0, 1,
-1.225803, -0.07292404, -0.2143517, 1, 0.6431373, 0, 1,
-1.224366, 0.4984615, -1.839554, 1, 0.6470588, 0, 1,
-1.215625, 1.318494, -1.897937, 1, 0.654902, 0, 1,
-1.207723, 0.2318105, 0.7853596, 1, 0.6588235, 0, 1,
-1.198177, -2.327417, -2.397277, 1, 0.6666667, 0, 1,
-1.197779, -0.3076789, 0.3268946, 1, 0.6705883, 0, 1,
-1.192874, -0.6417076, -3.144735, 1, 0.6784314, 0, 1,
-1.189819, -0.2830415, -2.755513, 1, 0.682353, 0, 1,
-1.180328, 1.140147, -0.5893385, 1, 0.6901961, 0, 1,
-1.175406, -0.6510121, -1.499309, 1, 0.6941177, 0, 1,
-1.174322, 0.01038395, -1.304453, 1, 0.7019608, 0, 1,
-1.156674, 0.07844875, -1.510582, 1, 0.7098039, 0, 1,
-1.151014, -2.45425, -1.191221, 1, 0.7137255, 0, 1,
-1.149528, 0.1512761, -2.017075, 1, 0.7215686, 0, 1,
-1.146566, -1.235207, -2.637248, 1, 0.7254902, 0, 1,
-1.143451, -0.08767808, -1.295429, 1, 0.7333333, 0, 1,
-1.138976, 0.7912565, -1.475089, 1, 0.7372549, 0, 1,
-1.136922, -0.5893741, -1.799803, 1, 0.7450981, 0, 1,
-1.135661, -1.3085, -3.791246, 1, 0.7490196, 0, 1,
-1.101062, -0.9468392, -2.871845, 1, 0.7568628, 0, 1,
-1.098567, 0.238079, -1.305236, 1, 0.7607843, 0, 1,
-1.087082, -1.250987, -2.114172, 1, 0.7686275, 0, 1,
-1.0859, -1.799955, -4.192549, 1, 0.772549, 0, 1,
-1.083119, -0.5765492, -2.380863, 1, 0.7803922, 0, 1,
-1.07712, -0.3609508, -1.801347, 1, 0.7843137, 0, 1,
-1.070496, 1.371703, -0.6269141, 1, 0.7921569, 0, 1,
-1.069798, -0.2165088, -2.578959, 1, 0.7960784, 0, 1,
-1.066247, 0.3947597, -1.732032, 1, 0.8039216, 0, 1,
-1.065607, -0.5200914, -2.143152, 1, 0.8117647, 0, 1,
-1.064051, -1.485638, -3.667383, 1, 0.8156863, 0, 1,
-1.059756, -0.4834525, -0.3804848, 1, 0.8235294, 0, 1,
-1.059686, 0.7773655, -0.07898922, 1, 0.827451, 0, 1,
-1.052087, 0.07253291, -0.7811162, 1, 0.8352941, 0, 1,
-1.049314, 1.142866, -1.5344, 1, 0.8392157, 0, 1,
-1.040107, 1.762439, 0.3569002, 1, 0.8470588, 0, 1,
-1.039586, 1.997496, -0.4005332, 1, 0.8509804, 0, 1,
-1.033629, 0.4818391, -0.8242405, 1, 0.8588235, 0, 1,
-1.027874, -0.9389344, -0.8499752, 1, 0.8627451, 0, 1,
-1.022701, 0.6483439, -1.086526, 1, 0.8705882, 0, 1,
-1.019559, 0.6473239, -0.5353234, 1, 0.8745098, 0, 1,
-1.017472, -0.7387195, -1.732703, 1, 0.8823529, 0, 1,
-1.001823, 0.6326938, -0.6270623, 1, 0.8862745, 0, 1,
-0.9970631, -0.7585207, -3.003585, 1, 0.8941177, 0, 1,
-0.9965202, 0.756465, -1.506405, 1, 0.8980392, 0, 1,
-0.9957076, -0.2475394, -3.220904, 1, 0.9058824, 0, 1,
-0.9905104, -0.6640696, -1.083464, 1, 0.9137255, 0, 1,
-0.9862323, -0.7083117, -2.367122, 1, 0.9176471, 0, 1,
-0.9829333, 0.2087425, -1.890678, 1, 0.9254902, 0, 1,
-0.9712225, -0.5016118, -0.6448378, 1, 0.9294118, 0, 1,
-0.970518, 0.2181047, -2.074167, 1, 0.9372549, 0, 1,
-0.9703121, -1.127131, -4.142205, 1, 0.9411765, 0, 1,
-0.9699731, -0.3536787, -1.660375, 1, 0.9490196, 0, 1,
-0.9578835, -0.43906, -1.288857, 1, 0.9529412, 0, 1,
-0.9561951, -1.234196, -4.04635, 1, 0.9607843, 0, 1,
-0.9513658, 0.8036155, -1.585486, 1, 0.9647059, 0, 1,
-0.9491467, -1.076537, -2.455921, 1, 0.972549, 0, 1,
-0.9486588, 1.350149, -0.3512631, 1, 0.9764706, 0, 1,
-0.9442816, 1.248344, -2.532533, 1, 0.9843137, 0, 1,
-0.9427906, -0.4702556, -0.2837405, 1, 0.9882353, 0, 1,
-0.9262483, 1.445196, -1.87687, 1, 0.9960784, 0, 1,
-0.9160978, 0.3580975, -3.200121, 0.9960784, 1, 0, 1,
-0.914855, -1.369462, -2.645286, 0.9921569, 1, 0, 1,
-0.9132549, -0.552282, -3.132072, 0.9843137, 1, 0, 1,
-0.9110266, 0.2169415, -0.04740195, 0.9803922, 1, 0, 1,
-0.9045111, 0.4118656, -2.203446, 0.972549, 1, 0, 1,
-0.9008678, -0.2220665, -1.969249, 0.9686275, 1, 0, 1,
-0.8964912, -1.149217, -0.6689399, 0.9607843, 1, 0, 1,
-0.8803248, 0.1440919, -2.019114, 0.9568627, 1, 0, 1,
-0.8789912, 1.366474, -1.617083, 0.9490196, 1, 0, 1,
-0.8783059, 0.7669234, -1.119649, 0.945098, 1, 0, 1,
-0.8777094, 1.325224, -0.7855229, 0.9372549, 1, 0, 1,
-0.8732008, -0.3825354, -1.531445, 0.9333333, 1, 0, 1,
-0.8682473, 0.8074713, -0.6628985, 0.9254902, 1, 0, 1,
-0.8679546, -0.1324872, -2.314555, 0.9215686, 1, 0, 1,
-0.8673782, -0.4300078, -0.6969189, 0.9137255, 1, 0, 1,
-0.8614521, 1.341261, -0.1675087, 0.9098039, 1, 0, 1,
-0.8613255, 0.7780495, -2.411294, 0.9019608, 1, 0, 1,
-0.8575486, 0.1360299, -1.91596, 0.8941177, 1, 0, 1,
-0.856042, 0.91752, 0.8142426, 0.8901961, 1, 0, 1,
-0.8550265, 0.8338287, -1.256202, 0.8823529, 1, 0, 1,
-0.8535979, -0.2033733, -0.9963099, 0.8784314, 1, 0, 1,
-0.852041, 2.201087, -0.3407731, 0.8705882, 1, 0, 1,
-0.8460296, 0.1068721, -4.304207, 0.8666667, 1, 0, 1,
-0.8431913, -0.6266688, -2.865129, 0.8588235, 1, 0, 1,
-0.8417398, -0.6824392, -2.783234, 0.854902, 1, 0, 1,
-0.8375434, -0.03642417, -1.557525, 0.8470588, 1, 0, 1,
-0.8359204, 1.40195, 0.07154228, 0.8431373, 1, 0, 1,
-0.8356404, 0.8426741, -1.338738, 0.8352941, 1, 0, 1,
-0.8345938, -0.1018457, -1.292267, 0.8313726, 1, 0, 1,
-0.827666, 0.3176327, -1.232118, 0.8235294, 1, 0, 1,
-0.8262514, -0.4372371, -1.321032, 0.8196079, 1, 0, 1,
-0.8183744, -0.658683, -2.254069, 0.8117647, 1, 0, 1,
-0.8113992, -0.2335179, -1.944437, 0.8078431, 1, 0, 1,
-0.8102266, -0.1822151, -3.88091, 0.8, 1, 0, 1,
-0.8099377, -1.037151, -3.017504, 0.7921569, 1, 0, 1,
-0.8082335, 0.5744959, -0.7654181, 0.7882353, 1, 0, 1,
-0.8074586, -0.1673998, -2.259742, 0.7803922, 1, 0, 1,
-0.8032771, 0.417633, -0.5205033, 0.7764706, 1, 0, 1,
-0.8008991, 0.1261392, -1.473133, 0.7686275, 1, 0, 1,
-0.7969891, -0.1288457, -0.4799443, 0.7647059, 1, 0, 1,
-0.7966326, 1.220985, -0.7975385, 0.7568628, 1, 0, 1,
-0.7965258, 0.8308476, -0.8775255, 0.7529412, 1, 0, 1,
-0.7961389, 1.41329, -1.347086, 0.7450981, 1, 0, 1,
-0.7832246, -0.9773427, -2.041204, 0.7411765, 1, 0, 1,
-0.7752321, 0.4764323, 0.8299584, 0.7333333, 1, 0, 1,
-0.7657712, 0.3232181, -1.407253, 0.7294118, 1, 0, 1,
-0.7598459, -0.08021837, -0.5309462, 0.7215686, 1, 0, 1,
-0.7596802, -0.1817315, -4.032389, 0.7176471, 1, 0, 1,
-0.7558092, -1.477409, -2.158798, 0.7098039, 1, 0, 1,
-0.7412333, 0.1968648, -0.7867451, 0.7058824, 1, 0, 1,
-0.7378273, 0.6164742, -0.5765963, 0.6980392, 1, 0, 1,
-0.7345197, -2.209894, -2.212758, 0.6901961, 1, 0, 1,
-0.7317556, -0.5135677, -1.75124, 0.6862745, 1, 0, 1,
-0.7244933, 2.132537, -1.043802, 0.6784314, 1, 0, 1,
-0.7233538, -1.082369, -2.086754, 0.6745098, 1, 0, 1,
-0.7202585, -0.8407614, -3.447649, 0.6666667, 1, 0, 1,
-0.7177266, 1.507628, -0.6313385, 0.6627451, 1, 0, 1,
-0.7121411, 1.246781, -2.480402, 0.654902, 1, 0, 1,
-0.7080415, -1.092071, -3.819375, 0.6509804, 1, 0, 1,
-0.7059293, -0.9510067, -1.641705, 0.6431373, 1, 0, 1,
-0.705564, -0.62938, -1.655234, 0.6392157, 1, 0, 1,
-0.7010453, -0.4086904, -0.9363261, 0.6313726, 1, 0, 1,
-0.696641, 0.1130921, 0.1439147, 0.627451, 1, 0, 1,
-0.6960412, -0.1325233, -2.966878, 0.6196079, 1, 0, 1,
-0.6932794, -0.6879225, -3.421835, 0.6156863, 1, 0, 1,
-0.6887577, -0.8851648, -2.474433, 0.6078432, 1, 0, 1,
-0.688184, 0.07988504, -2.233242, 0.6039216, 1, 0, 1,
-0.6859297, -0.7121849, -3.161114, 0.5960785, 1, 0, 1,
-0.6859074, 0.5719261, -1.351987, 0.5882353, 1, 0, 1,
-0.6804868, 0.6855575, -0.2729412, 0.5843138, 1, 0, 1,
-0.6730784, 0.5353706, -2.485383, 0.5764706, 1, 0, 1,
-0.6696277, 0.5580072, -1.04614, 0.572549, 1, 0, 1,
-0.6608695, -0.1274728, -1.845972, 0.5647059, 1, 0, 1,
-0.6590114, -0.4062443, -2.699422, 0.5607843, 1, 0, 1,
-0.658523, 0.1373947, -1.55749, 0.5529412, 1, 0, 1,
-0.6583744, -0.4079926, -2.315595, 0.5490196, 1, 0, 1,
-0.6573768, 1.053899, -0.06075656, 0.5411765, 1, 0, 1,
-0.6552871, 1.317868, -1.278372, 0.5372549, 1, 0, 1,
-0.6521708, 1.521369, -1.084776, 0.5294118, 1, 0, 1,
-0.6453903, -0.8405896, -1.701483, 0.5254902, 1, 0, 1,
-0.6427702, 0.3194493, -1.661809, 0.5176471, 1, 0, 1,
-0.6328623, -0.7270284, -1.455581, 0.5137255, 1, 0, 1,
-0.6299654, 0.8399024, 1.230351, 0.5058824, 1, 0, 1,
-0.625905, -1.701422, -3.716958, 0.5019608, 1, 0, 1,
-0.6228542, -0.4960442, -1.974545, 0.4941176, 1, 0, 1,
-0.62213, 1.484982, -0.2062691, 0.4862745, 1, 0, 1,
-0.6209921, -1.103804, -1.071394, 0.4823529, 1, 0, 1,
-0.6170545, 1.51188, 0.4394285, 0.4745098, 1, 0, 1,
-0.6166418, -0.3139932, -2.878429, 0.4705882, 1, 0, 1,
-0.6163377, -0.7594932, -3.678846, 0.4627451, 1, 0, 1,
-0.616317, 0.01817393, -1.504565, 0.4588235, 1, 0, 1,
-0.6130415, -0.6432968, -1.752128, 0.4509804, 1, 0, 1,
-0.6099367, -1.400823, -0.6833031, 0.4470588, 1, 0, 1,
-0.6045038, 0.3183464, -1.903023, 0.4392157, 1, 0, 1,
-0.6029848, 0.5835833, -1.206719, 0.4352941, 1, 0, 1,
-0.5968179, -2.313746, -3.379159, 0.427451, 1, 0, 1,
-0.5960352, -0.5464119, -1.438923, 0.4235294, 1, 0, 1,
-0.5936188, -1.259586, -2.357894, 0.4156863, 1, 0, 1,
-0.58734, -1.269776, -2.750219, 0.4117647, 1, 0, 1,
-0.5845547, -0.9016351, -1.427509, 0.4039216, 1, 0, 1,
-0.5828815, -0.9951221, -2.391575, 0.3960784, 1, 0, 1,
-0.5817168, 0.8323223, -1.51351, 0.3921569, 1, 0, 1,
-0.5779138, 0.1941698, -2.705963, 0.3843137, 1, 0, 1,
-0.5777631, -0.3027641, -2.730075, 0.3803922, 1, 0, 1,
-0.5768162, -0.3087798, -2.72564, 0.372549, 1, 0, 1,
-0.5717883, 0.1192298, -2.542565, 0.3686275, 1, 0, 1,
-0.570317, 1.206288, -0.8337604, 0.3607843, 1, 0, 1,
-0.5698313, 0.6761944, -1.799274, 0.3568628, 1, 0, 1,
-0.5676277, 0.01602358, -1.202804, 0.3490196, 1, 0, 1,
-0.5673743, 1.353978, 0.9398167, 0.345098, 1, 0, 1,
-0.5630081, -1.19953, -1.661325, 0.3372549, 1, 0, 1,
-0.5605662, 0.07396889, -0.6500793, 0.3333333, 1, 0, 1,
-0.5555037, 0.4085447, -0.7390822, 0.3254902, 1, 0, 1,
-0.5540076, -0.3658102, -3.577478, 0.3215686, 1, 0, 1,
-0.5539898, 0.3039235, -2.428298, 0.3137255, 1, 0, 1,
-0.55356, -0.364304, -2.029253, 0.3098039, 1, 0, 1,
-0.5526941, -1.148348, -3.803618, 0.3019608, 1, 0, 1,
-0.5513489, 0.525804, -2.036188, 0.2941177, 1, 0, 1,
-0.550899, 0.02478972, -0.2093114, 0.2901961, 1, 0, 1,
-0.550276, 0.3362738, -1.847328, 0.282353, 1, 0, 1,
-0.5486535, 1.54968, 0.5313089, 0.2784314, 1, 0, 1,
-0.5444015, 1.483325, 0.7387187, 0.2705882, 1, 0, 1,
-0.5425839, -0.08156418, -1.133876, 0.2666667, 1, 0, 1,
-0.533471, -1.659607, -2.629145, 0.2588235, 1, 0, 1,
-0.5252414, 0.9751536, -0.3921525, 0.254902, 1, 0, 1,
-0.5233809, -3.630955, -2.357463, 0.2470588, 1, 0, 1,
-0.5191956, -0.8996509, -1.154444, 0.2431373, 1, 0, 1,
-0.5161506, -1.401222, -4.238492, 0.2352941, 1, 0, 1,
-0.5146442, -0.2502648, -2.958501, 0.2313726, 1, 0, 1,
-0.5138631, -0.1892612, -2.488829, 0.2235294, 1, 0, 1,
-0.5121462, 0.4263407, -2.658894, 0.2196078, 1, 0, 1,
-0.5121342, 0.7909684, -0.4676009, 0.2117647, 1, 0, 1,
-0.5120255, -1.352361, -1.982729, 0.2078431, 1, 0, 1,
-0.5110487, -0.206799, -1.749492, 0.2, 1, 0, 1,
-0.5058638, 1.389457, 0.6103719, 0.1921569, 1, 0, 1,
-0.4977668, -1.027844, -1.332808, 0.1882353, 1, 0, 1,
-0.4966792, -0.9541397, -0.6233667, 0.1803922, 1, 0, 1,
-0.4951869, 0.3048845, 0.02888534, 0.1764706, 1, 0, 1,
-0.4924985, -0.4690055, -2.589659, 0.1686275, 1, 0, 1,
-0.4912817, -1.483299, -3.259971, 0.1647059, 1, 0, 1,
-0.4889164, 1.217146, 0.8623126, 0.1568628, 1, 0, 1,
-0.4881483, 1.191687, 0.1896368, 0.1529412, 1, 0, 1,
-0.4869081, -1.333387, -2.356041, 0.145098, 1, 0, 1,
-0.484753, 0.151624, -1.987998, 0.1411765, 1, 0, 1,
-0.4845232, -1.01223, -1.602181, 0.1333333, 1, 0, 1,
-0.4722946, -0.3375325, -2.72864, 0.1294118, 1, 0, 1,
-0.4704496, 1.549797, 0.5968718, 0.1215686, 1, 0, 1,
-0.4694365, -1.349679, -2.612822, 0.1176471, 1, 0, 1,
-0.4685131, 0.4001383, -0.4239435, 0.1098039, 1, 0, 1,
-0.4644341, -0.1012167, -0.6198553, 0.1058824, 1, 0, 1,
-0.4639779, -1.146554, -2.454065, 0.09803922, 1, 0, 1,
-0.4585035, -0.5138746, -4.15036, 0.09019608, 1, 0, 1,
-0.4575737, -0.9166387, -1.898656, 0.08627451, 1, 0, 1,
-0.4547968, -0.8067339, -1.390545, 0.07843138, 1, 0, 1,
-0.4467572, -1.183136, -2.383549, 0.07450981, 1, 0, 1,
-0.4465281, 0.7977841, 0.07220467, 0.06666667, 1, 0, 1,
-0.4393451, 1.086173, -0.6575704, 0.0627451, 1, 0, 1,
-0.4291562, 0.5038478, -1.263396, 0.05490196, 1, 0, 1,
-0.4268152, 1.696102, 1.40519, 0.05098039, 1, 0, 1,
-0.4258176, -0.5540497, -2.061565, 0.04313726, 1, 0, 1,
-0.4233474, -0.3501609, 0.2217005, 0.03921569, 1, 0, 1,
-0.4233019, -1.44597, -1.516266, 0.03137255, 1, 0, 1,
-0.4118079, 0.2982831, 0.1475389, 0.02745098, 1, 0, 1,
-0.4117915, -0.007094266, -1.554064, 0.01960784, 1, 0, 1,
-0.4084143, 0.279588, -0.7763746, 0.01568628, 1, 0, 1,
-0.4055294, -0.4847243, -0.4753686, 0.007843138, 1, 0, 1,
-0.4036651, -0.1465604, -3.060349, 0.003921569, 1, 0, 1,
-0.393209, 0.517276, -0.05653934, 0, 1, 0.003921569, 1,
-0.3917503, -0.1338387, -3.10355, 0, 1, 0.01176471, 1,
-0.3910336, 2.118061, -0.1510142, 0, 1, 0.01568628, 1,
-0.3889108, 1.635796, 1.20884, 0, 1, 0.02352941, 1,
-0.3885519, -0.6906243, -5.631855, 0, 1, 0.02745098, 1,
-0.3846716, -1.38746, -2.139373, 0, 1, 0.03529412, 1,
-0.3804627, -0.4484581, -3.121828, 0, 1, 0.03921569, 1,
-0.3761593, 1.334829, 0.1377343, 0, 1, 0.04705882, 1,
-0.3742823, -0.2808483, -2.294878, 0, 1, 0.05098039, 1,
-0.3729207, -0.6571853, -1.963383, 0, 1, 0.05882353, 1,
-0.3720768, -0.7668517, -2.676712, 0, 1, 0.0627451, 1,
-0.3719895, -1.310527, -3.37993, 0, 1, 0.07058824, 1,
-0.3702777, -2.030977, -3.156352, 0, 1, 0.07450981, 1,
-0.3625762, -1.023387, -3.537191, 0, 1, 0.08235294, 1,
-0.3576412, 0.8904949, 0.437483, 0, 1, 0.08627451, 1,
-0.3561396, 0.6901067, -0.6518895, 0, 1, 0.09411765, 1,
-0.3538439, -0.7477579, -3.738565, 0, 1, 0.1019608, 1,
-0.3430272, 0.7681642, -2.060965, 0, 1, 0.1058824, 1,
-0.3370196, -1.637667, -4.794963, 0, 1, 0.1137255, 1,
-0.3364702, 0.9389091, 1.220965, 0, 1, 0.1176471, 1,
-0.3352649, 1.916843, -0.3221874, 0, 1, 0.1254902, 1,
-0.3332451, 1.951979, -1.43923, 0, 1, 0.1294118, 1,
-0.3321607, 1.324288, -2.182272, 0, 1, 0.1372549, 1,
-0.3316696, 0.5483313, 1.034681, 0, 1, 0.1411765, 1,
-0.3295381, 0.6420198, -0.4114923, 0, 1, 0.1490196, 1,
-0.3288138, -2.15012, -0.783203, 0, 1, 0.1529412, 1,
-0.3221751, 2.022121, -1.03916, 0, 1, 0.1607843, 1,
-0.318405, -1.681671, -1.838892, 0, 1, 0.1647059, 1,
-0.3170198, -0.5366949, -3.695653, 0, 1, 0.172549, 1,
-0.3164356, -1.232455, -3.37817, 0, 1, 0.1764706, 1,
-0.3160354, 0.1887745, -1.264394, 0, 1, 0.1843137, 1,
-0.3156531, 1.72878, -0.8644351, 0, 1, 0.1882353, 1,
-0.3141593, -0.0161659, -1.553686, 0, 1, 0.1960784, 1,
-0.310795, 0.1987013, 0.08982208, 0, 1, 0.2039216, 1,
-0.3084647, 0.07503696, -1.760952, 0, 1, 0.2078431, 1,
-0.3053227, -1.733941, -5.082973, 0, 1, 0.2156863, 1,
-0.3034754, -1.563875, -1.245247, 0, 1, 0.2196078, 1,
-0.301895, 1.795766, -0.09153011, 0, 1, 0.227451, 1,
-0.3012314, 0.9455944, -0.8388554, 0, 1, 0.2313726, 1,
-0.3007176, 0.3385039, -0.736391, 0, 1, 0.2392157, 1,
-0.2922263, 0.47555, -2.738718, 0, 1, 0.2431373, 1,
-0.290247, 1.083038, -0.2233767, 0, 1, 0.2509804, 1,
-0.2817582, -1.92923, -1.993311, 0, 1, 0.254902, 1,
-0.2791086, 0.3774558, 0.3301322, 0, 1, 0.2627451, 1,
-0.2719935, -1.082017, -4.874068, 0, 1, 0.2666667, 1,
-0.2703172, 0.7036663, -1.557581, 0, 1, 0.2745098, 1,
-0.2697234, -0.6737887, -0.5453269, 0, 1, 0.2784314, 1,
-0.267745, 1.547891, 0.05006953, 0, 1, 0.2862745, 1,
-0.2645748, 0.7451385, -0.3502159, 0, 1, 0.2901961, 1,
-0.2630956, 0.008236305, -2.673161, 0, 1, 0.2980392, 1,
-0.262962, 1.064652, 1.044465, 0, 1, 0.3058824, 1,
-0.2590333, -0.1038001, -1.353248, 0, 1, 0.3098039, 1,
-0.2569399, 0.7131096, -2.220778, 0, 1, 0.3176471, 1,
-0.2565294, -0.1173908, -2.859998, 0, 1, 0.3215686, 1,
-0.2554484, -0.8320479, -1.377279, 0, 1, 0.3294118, 1,
-0.255255, -0.1898894, -3.107422, 0, 1, 0.3333333, 1,
-0.253345, 1.932595, -1.225347, 0, 1, 0.3411765, 1,
-0.2527731, 0.6544359, 0.4695377, 0, 1, 0.345098, 1,
-0.252713, 1.516819, -0.9861206, 0, 1, 0.3529412, 1,
-0.252045, 1.304048, 0.2040938, 0, 1, 0.3568628, 1,
-0.2464481, 1.822314, 0.6850378, 0, 1, 0.3647059, 1,
-0.2443209, 0.1982454, -0.6443651, 0, 1, 0.3686275, 1,
-0.238336, 0.8183206, 0.2047481, 0, 1, 0.3764706, 1,
-0.232801, -0.4736616, -3.918661, 0, 1, 0.3803922, 1,
-0.2293714, 0.01976957, -0.784796, 0, 1, 0.3882353, 1,
-0.2260528, 0.9029909, -1.237586, 0, 1, 0.3921569, 1,
-0.2243482, 0.2164836, -0.4092039, 0, 1, 0.4, 1,
-0.2182955, 0.114071, 1.042286, 0, 1, 0.4078431, 1,
-0.2164806, 1.186992, -1.176714, 0, 1, 0.4117647, 1,
-0.216276, -1.088898, -4.677481, 0, 1, 0.4196078, 1,
-0.2093578, 0.3127351, -3.691089, 0, 1, 0.4235294, 1,
-0.2081826, -2.137122, -2.223531, 0, 1, 0.4313726, 1,
-0.2078936, 1.609685, -0.8965216, 0, 1, 0.4352941, 1,
-0.2019804, 1.266319, -0.4554464, 0, 1, 0.4431373, 1,
-0.2013004, 1.738725, -0.1285832, 0, 1, 0.4470588, 1,
-0.200956, -1.32269, -3.208862, 0, 1, 0.454902, 1,
-0.1926023, -0.1160883, -1.186765, 0, 1, 0.4588235, 1,
-0.1922838, 0.06583422, -1.060909, 0, 1, 0.4666667, 1,
-0.185271, -0.2494656, -2.458811, 0, 1, 0.4705882, 1,
-0.1823224, 0.1573023, -0.09987714, 0, 1, 0.4784314, 1,
-0.1805461, 0.3055662, -1.660878, 0, 1, 0.4823529, 1,
-0.1710531, -1.097289, -3.30293, 0, 1, 0.4901961, 1,
-0.1656879, 0.2665702, -1.259791, 0, 1, 0.4941176, 1,
-0.1633828, -0.5358125, -2.06961, 0, 1, 0.5019608, 1,
-0.1585633, -1.261879, -3.165313, 0, 1, 0.509804, 1,
-0.1574027, 0.3012431, 0.4148841, 0, 1, 0.5137255, 1,
-0.156896, -0.2396877, -2.972586, 0, 1, 0.5215687, 1,
-0.1517101, 0.6829206, 1.722465, 0, 1, 0.5254902, 1,
-0.1436372, 1.218761, -0.6934444, 0, 1, 0.5333334, 1,
-0.1419259, 1.958081, 0.2452458, 0, 1, 0.5372549, 1,
-0.1414469, -0.7373155, -2.345279, 0, 1, 0.5450981, 1,
-0.1404622, -0.4963636, -2.480649, 0, 1, 0.5490196, 1,
-0.1397835, -1.194119, -1.981595, 0, 1, 0.5568628, 1,
-0.1392783, -0.5170764, -2.667373, 0, 1, 0.5607843, 1,
-0.139171, -0.1192295, -3.149381, 0, 1, 0.5686275, 1,
-0.1388864, 0.1246809, -1.382698, 0, 1, 0.572549, 1,
-0.1363511, -1.331374, -1.163677, 0, 1, 0.5803922, 1,
-0.1342017, 1.581463, -0.6711719, 0, 1, 0.5843138, 1,
-0.1324951, 1.085861, 0.259857, 0, 1, 0.5921569, 1,
-0.1181361, -0.6013612, -2.244287, 0, 1, 0.5960785, 1,
-0.1155753, 0.6908706, -0.6837696, 0, 1, 0.6039216, 1,
-0.1129941, -0.02713644, -1.816135, 0, 1, 0.6117647, 1,
-0.1125322, -1.066035, -2.164224, 0, 1, 0.6156863, 1,
-0.1048798, -0.6815155, -3.043945, 0, 1, 0.6235294, 1,
-0.102377, 0.3777818, 0.1550551, 0, 1, 0.627451, 1,
-0.101061, -0.6549689, -4.787336, 0, 1, 0.6352941, 1,
-0.09996729, 0.06181181, 0.4039153, 0, 1, 0.6392157, 1,
-0.09563009, 1.324124, -0.6823071, 0, 1, 0.6470588, 1,
-0.09532482, -0.6151835, -3.178907, 0, 1, 0.6509804, 1,
-0.09502789, -0.01482945, -1.961314, 0, 1, 0.6588235, 1,
-0.09464513, 0.5518998, 1.584673, 0, 1, 0.6627451, 1,
-0.0931835, -1.543308, -2.189995, 0, 1, 0.6705883, 1,
-0.09116244, -0.9079129, -3.875108, 0, 1, 0.6745098, 1,
-0.08820847, 0.8483468, 0.2879311, 0, 1, 0.682353, 1,
-0.08807983, 0.7646498, 2.051881, 0, 1, 0.6862745, 1,
-0.08806563, 2.476666, 0.6817429, 0, 1, 0.6941177, 1,
-0.08638842, -0.2891364, -4.068994, 0, 1, 0.7019608, 1,
-0.08572664, -0.2006904, -3.442709, 0, 1, 0.7058824, 1,
-0.07229815, -1.742288, -2.463366, 0, 1, 0.7137255, 1,
-0.07015093, 1.122876, 0.308895, 0, 1, 0.7176471, 1,
-0.07011349, 2.159687, 0.1179321, 0, 1, 0.7254902, 1,
-0.06900394, -0.3614298, -1.85518, 0, 1, 0.7294118, 1,
-0.06624992, 1.812248, -2.199319, 0, 1, 0.7372549, 1,
-0.06354724, -0.6716538, -2.304346, 0, 1, 0.7411765, 1,
-0.0615255, 0.3585964, 1.848155, 0, 1, 0.7490196, 1,
-0.05486964, -1.195615, -2.497617, 0, 1, 0.7529412, 1,
-0.05377569, 1.016685, -0.4336052, 0, 1, 0.7607843, 1,
-0.04768776, 0.3848451, -0.7361911, 0, 1, 0.7647059, 1,
-0.04724594, 0.5509211, 0.1220612, 0, 1, 0.772549, 1,
-0.04313444, 0.4135646, 0.2761162, 0, 1, 0.7764706, 1,
-0.03779621, 0.6065956, -0.1118415, 0, 1, 0.7843137, 1,
-0.03638829, 1.044032, -2.303782, 0, 1, 0.7882353, 1,
-0.03426572, -0.9494152, -2.040339, 0, 1, 0.7960784, 1,
-0.03327602, -0.6958948, -2.488059, 0, 1, 0.8039216, 1,
-0.03126962, 0.2413247, 1.629114, 0, 1, 0.8078431, 1,
-0.03062395, -0.5062706, -4.715549, 0, 1, 0.8156863, 1,
-0.02585398, -0.03858675, -1.747658, 0, 1, 0.8196079, 1,
-0.0232235, 2.577448, -0.9149562, 0, 1, 0.827451, 1,
-0.02276887, 0.3864736, 0.101543, 0, 1, 0.8313726, 1,
-0.007515949, 0.1740948, 2.080514, 0, 1, 0.8392157, 1,
-0.00036559, 0.3763806, 0.1592074, 0, 1, 0.8431373, 1,
-0.0001584441, 0.1375061, 0.9617138, 0, 1, 0.8509804, 1,
-2.648614e-05, 1.296035, 0.4960481, 0, 1, 0.854902, 1,
0.0003040951, -1.035045, 3.182196, 0, 1, 0.8627451, 1,
0.002478565, 0.1902588, -1.288599, 0, 1, 0.8666667, 1,
0.01192438, 0.8637236, 0.5863822, 0, 1, 0.8745098, 1,
0.01241574, 1.31427, 0.6435432, 0, 1, 0.8784314, 1,
0.01251112, 1.567768, -1.819819, 0, 1, 0.8862745, 1,
0.0131904, 0.07376316, 0.6769044, 0, 1, 0.8901961, 1,
0.01328035, -0.380061, 2.732439, 0, 1, 0.8980392, 1,
0.01433049, 1.544171, 0.1724488, 0, 1, 0.9058824, 1,
0.01742316, -0.6459608, 2.110604, 0, 1, 0.9098039, 1,
0.02800718, 0.02545329, 1.036521, 0, 1, 0.9176471, 1,
0.02828456, 1.294815, 0.09782278, 0, 1, 0.9215686, 1,
0.02879339, 0.4392533, -0.3016866, 0, 1, 0.9294118, 1,
0.03613873, -0.5642917, 3.496648, 0, 1, 0.9333333, 1,
0.03682733, 1.192594, -2.358914, 0, 1, 0.9411765, 1,
0.03780597, -1.147909, 3.688938, 0, 1, 0.945098, 1,
0.0419458, 0.03582652, -1.542326, 0, 1, 0.9529412, 1,
0.0472711, 0.9110212, 1.176307, 0, 1, 0.9568627, 1,
0.04758505, -0.3170023, 4.430656, 0, 1, 0.9647059, 1,
0.04808307, 0.3723229, -0.8899749, 0, 1, 0.9686275, 1,
0.04809669, 0.15267, 0.5967593, 0, 1, 0.9764706, 1,
0.05074986, -0.9979744, 2.297442, 0, 1, 0.9803922, 1,
0.05273866, -1.136614, 2.934905, 0, 1, 0.9882353, 1,
0.06888796, 0.3341132, -0.660064, 0, 1, 0.9921569, 1,
0.06944563, -1.80438, 3.636381, 0, 1, 1, 1,
0.07077046, 1.762788, 0.1486356, 0, 0.9921569, 1, 1,
0.07406579, 1.302355, -0.5827888, 0, 0.9882353, 1, 1,
0.07528926, 0.696689, 1.288576, 0, 0.9803922, 1, 1,
0.07692458, 0.2501013, 1.565636, 0, 0.9764706, 1, 1,
0.08741957, -2.069586, 2.744644, 0, 0.9686275, 1, 1,
0.08831976, 0.9036471, -0.03834539, 0, 0.9647059, 1, 1,
0.09317631, -1.15759, 3.469108, 0, 0.9568627, 1, 1,
0.09477546, -1.450102, 1.862707, 0, 0.9529412, 1, 1,
0.09663071, 0.8354834, -1.101739, 0, 0.945098, 1, 1,
0.09829797, 0.7622099, -0.5112262, 0, 0.9411765, 1, 1,
0.1041751, 0.1233621, 0.02970891, 0, 0.9333333, 1, 1,
0.1058194, 0.8124486, -0.1453396, 0, 0.9294118, 1, 1,
0.1060791, -0.5696247, 3.027704, 0, 0.9215686, 1, 1,
0.1109885, 1.130164, 0.1652253, 0, 0.9176471, 1, 1,
0.112767, -0.9713302, 2.081025, 0, 0.9098039, 1, 1,
0.1175167, 0.2233219, -0.9575171, 0, 0.9058824, 1, 1,
0.119331, -2.029789, 4.196317, 0, 0.8980392, 1, 1,
0.1205336, -1.801107, 5.355931, 0, 0.8901961, 1, 1,
0.121825, 0.5313622, -1.25257, 0, 0.8862745, 1, 1,
0.1235562, -0.4261553, 3.078243, 0, 0.8784314, 1, 1,
0.1258221, 0.1984081, 0.81455, 0, 0.8745098, 1, 1,
0.1274684, -0.8699967, 3.666597, 0, 0.8666667, 1, 1,
0.1280773, 3.463866, 0.230195, 0, 0.8627451, 1, 1,
0.1301022, 1.026734, -1.105402, 0, 0.854902, 1, 1,
0.1311483, -0.003716744, 2.186784, 0, 0.8509804, 1, 1,
0.1313758, 0.3625324, 0.2669633, 0, 0.8431373, 1, 1,
0.133605, -0.4367519, 3.617137, 0, 0.8392157, 1, 1,
0.1367322, 2.430702, 1.397888, 0, 0.8313726, 1, 1,
0.1396421, -1.100531, 3.505141, 0, 0.827451, 1, 1,
0.1430652, 1.569976, 0.1461053, 0, 0.8196079, 1, 1,
0.1453105, -1.954703, 0.9498937, 0, 0.8156863, 1, 1,
0.1486279, -0.4425885, 3.246619, 0, 0.8078431, 1, 1,
0.1524045, 2.18293, -0.9110144, 0, 0.8039216, 1, 1,
0.155805, -0.311687, 3.316292, 0, 0.7960784, 1, 1,
0.1569149, -0.6209845, 1.156386, 0, 0.7882353, 1, 1,
0.1640912, 1.110037, 1.018378, 0, 0.7843137, 1, 1,
0.1671108, 1.641363, 0.6326588, 0, 0.7764706, 1, 1,
0.169862, 0.3504915, 0.5181476, 0, 0.772549, 1, 1,
0.1701287, -1.536686, 3.668188, 0, 0.7647059, 1, 1,
0.1737283, -0.5507496, 2.988176, 0, 0.7607843, 1, 1,
0.1743727, 1.22096, -0.7749454, 0, 0.7529412, 1, 1,
0.174607, -0.6028562, 4.277217, 0, 0.7490196, 1, 1,
0.1755688, -1.257931, 3.794696, 0, 0.7411765, 1, 1,
0.1785514, -0.3047219, 1.582874, 0, 0.7372549, 1, 1,
0.1789663, -1.284839, 3.650389, 0, 0.7294118, 1, 1,
0.179414, -1.754403, 2.837526, 0, 0.7254902, 1, 1,
0.1807569, -0.4433152, 5.516169, 0, 0.7176471, 1, 1,
0.1813862, -0.148849, 1.661853, 0, 0.7137255, 1, 1,
0.1841689, 1.399582, 1.31448, 0, 0.7058824, 1, 1,
0.1855982, 0.09462918, 2.597776, 0, 0.6980392, 1, 1,
0.1918367, 0.1233431, 1.360536, 0, 0.6941177, 1, 1,
0.1920475, -1.408818, 2.72811, 0, 0.6862745, 1, 1,
0.1937269, -1.839133, 3.392187, 0, 0.682353, 1, 1,
0.1973648, 0.8833026, 1.359365, 0, 0.6745098, 1, 1,
0.1993641, 0.5145719, -1.091555, 0, 0.6705883, 1, 1,
0.2008756, -0.4750931, 3.143582, 0, 0.6627451, 1, 1,
0.2016623, 0.8184971, -0.07828495, 0, 0.6588235, 1, 1,
0.204337, 0.3969898, 0.02292135, 0, 0.6509804, 1, 1,
0.2090085, 0.2771636, 0.7200813, 0, 0.6470588, 1, 1,
0.2094762, 0.7371653, -0.916846, 0, 0.6392157, 1, 1,
0.2098403, -0.1842461, 1.382405, 0, 0.6352941, 1, 1,
0.2098533, 0.2971596, 0.2583909, 0, 0.627451, 1, 1,
0.2154019, -0.5524423, 3.957938, 0, 0.6235294, 1, 1,
0.2159353, -1.699435, 3.616239, 0, 0.6156863, 1, 1,
0.218094, 0.3562296, 0.129246, 0, 0.6117647, 1, 1,
0.2190487, 0.7914156, -0.3343584, 0, 0.6039216, 1, 1,
0.2204817, -0.2352612, 4.60239, 0, 0.5960785, 1, 1,
0.2205374, -0.5309238, 1.385951, 0, 0.5921569, 1, 1,
0.2218411, 1.275076, -0.2394308, 0, 0.5843138, 1, 1,
0.223134, 0.6742237, 0.1548585, 0, 0.5803922, 1, 1,
0.2343635, 0.03800989, 1.760175, 0, 0.572549, 1, 1,
0.2351059, 1.998979, 0.7452896, 0, 0.5686275, 1, 1,
0.2369286, 0.02924293, 2.24383, 0, 0.5607843, 1, 1,
0.2401329, -0.5649147, 5.434258, 0, 0.5568628, 1, 1,
0.2402779, 0.6475495, 0.2595543, 0, 0.5490196, 1, 1,
0.2428763, 0.6052331, -0.5575393, 0, 0.5450981, 1, 1,
0.2432662, -0.292722, 3.090528, 0, 0.5372549, 1, 1,
0.2449125, -0.1938042, 2.997277, 0, 0.5333334, 1, 1,
0.2469661, -0.5021233, 2.747186, 0, 0.5254902, 1, 1,
0.2543111, -0.4815817, 3.595145, 0, 0.5215687, 1, 1,
0.2547806, 1.102105, 1.124442, 0, 0.5137255, 1, 1,
0.2579738, -0.7266105, 2.350632, 0, 0.509804, 1, 1,
0.2584705, 0.6693149, 0.1104248, 0, 0.5019608, 1, 1,
0.2592992, 2.5463, -0.5197122, 0, 0.4941176, 1, 1,
0.2593982, -1.967111, 2.775722, 0, 0.4901961, 1, 1,
0.2606183, 0.1770606, -0.3845381, 0, 0.4823529, 1, 1,
0.2616048, -0.1784724, 1.088864, 0, 0.4784314, 1, 1,
0.2643399, 0.05332574, 2.332669, 0, 0.4705882, 1, 1,
0.2671725, -2.684241, 3.015466, 0, 0.4666667, 1, 1,
0.2672854, -0.2524013, 2.596238, 0, 0.4588235, 1, 1,
0.2697624, -1.71053, 3.160467, 0, 0.454902, 1, 1,
0.2718362, 1.224891, 0.8411074, 0, 0.4470588, 1, 1,
0.2744103, 0.1518897, 1.583628, 0, 0.4431373, 1, 1,
0.2750315, 0.4623697, -2.762552, 0, 0.4352941, 1, 1,
0.2810643, -1.613749, 3.490446, 0, 0.4313726, 1, 1,
0.282888, 1.065966, -1.424071, 0, 0.4235294, 1, 1,
0.2916353, 1.802876, 1.78896, 0, 0.4196078, 1, 1,
0.3026046, -0.8986157, 2.14322, 0, 0.4117647, 1, 1,
0.3036366, -0.2744991, 1.491543, 0, 0.4078431, 1, 1,
0.3044325, 0.8342117, 0.3821668, 0, 0.4, 1, 1,
0.3075653, -1.01856, 4.009084, 0, 0.3921569, 1, 1,
0.3112163, -0.2922859, 2.476318, 0, 0.3882353, 1, 1,
0.3121198, 1.960611, 1.379828, 0, 0.3803922, 1, 1,
0.312375, 0.08190276, 3.243912, 0, 0.3764706, 1, 1,
0.3127973, 2.461689, -1.069974, 0, 0.3686275, 1, 1,
0.3164564, 0.1563162, 1.185096, 0, 0.3647059, 1, 1,
0.3187798, -1.742929, 3.632172, 0, 0.3568628, 1, 1,
0.3277579, -0.2026126, 1.908659, 0, 0.3529412, 1, 1,
0.3294062, -0.04070739, 1.346245, 0, 0.345098, 1, 1,
0.3296126, -1.12148, 2.983329, 0, 0.3411765, 1, 1,
0.3296624, 1.009454, 0.6601042, 0, 0.3333333, 1, 1,
0.3298943, 1.47704, 0.306226, 0, 0.3294118, 1, 1,
0.3300069, 2.068081, -0.3840752, 0, 0.3215686, 1, 1,
0.3301212, 0.4818769, 2.645686, 0, 0.3176471, 1, 1,
0.3330576, -0.4359773, 2.077193, 0, 0.3098039, 1, 1,
0.3371532, -0.2529364, 1.526336, 0, 0.3058824, 1, 1,
0.3388702, 0.4835244, 1.403405, 0, 0.2980392, 1, 1,
0.3432817, -0.3052158, 3.089803, 0, 0.2901961, 1, 1,
0.3459618, -1.490484, 2.473927, 0, 0.2862745, 1, 1,
0.3464107, 0.1001552, 1.097659, 0, 0.2784314, 1, 1,
0.3480377, 0.4961469, 1.198474, 0, 0.2745098, 1, 1,
0.3480407, 2.471393, 0.4025159, 0, 0.2666667, 1, 1,
0.3487056, -0.032702, 2.380083, 0, 0.2627451, 1, 1,
0.3516461, 0.3612041, 1.273054, 0, 0.254902, 1, 1,
0.3523612, -0.3651143, 3.156952, 0, 0.2509804, 1, 1,
0.3627845, 0.55748, -0.529671, 0, 0.2431373, 1, 1,
0.3629309, -1.402868, 2.524267, 0, 0.2392157, 1, 1,
0.3643999, -0.5695002, 2.299984, 0, 0.2313726, 1, 1,
0.3683092, -0.8374945, 4.349952, 0, 0.227451, 1, 1,
0.3703895, 1.745632, 1.210304, 0, 0.2196078, 1, 1,
0.3728815, 0.8541256, 0.7164059, 0, 0.2156863, 1, 1,
0.3764547, -0.4582734, 1.870343, 0, 0.2078431, 1, 1,
0.3768696, 0.3307391, 1.628783, 0, 0.2039216, 1, 1,
0.3775765, 1.052451, -0.217575, 0, 0.1960784, 1, 1,
0.3827095, 0.1503346, -0.09239979, 0, 0.1882353, 1, 1,
0.3828931, 0.7841877, -0.1950967, 0, 0.1843137, 1, 1,
0.3830104, 0.5023491, 1.23963, 0, 0.1764706, 1, 1,
0.3835142, -0.685665, 1.285008, 0, 0.172549, 1, 1,
0.383808, -0.287124, 4.098355, 0, 0.1647059, 1, 1,
0.3871988, -0.3853933, 2.96678, 0, 0.1607843, 1, 1,
0.3901231, -0.1979946, 2.240516, 0, 0.1529412, 1, 1,
0.3903475, -1.273326, 2.333291, 0, 0.1490196, 1, 1,
0.3911336, 0.5862029, -0.3546703, 0, 0.1411765, 1, 1,
0.3917954, 0.3299842, 1.633415, 0, 0.1372549, 1, 1,
0.39771, -1.43175, 1.226755, 0, 0.1294118, 1, 1,
0.4018479, 1.36787, 1.151942, 0, 0.1254902, 1, 1,
0.4046375, 0.173174, 1.20772, 0, 0.1176471, 1, 1,
0.4063561, -0.1418209, 1.449309, 0, 0.1137255, 1, 1,
0.4071081, 0.4628512, 0.249617, 0, 0.1058824, 1, 1,
0.4072369, 1.664533, 0.863378, 0, 0.09803922, 1, 1,
0.4101558, 1.309656, 1.889394, 0, 0.09411765, 1, 1,
0.4102959, 0.0872172, 1.020313, 0, 0.08627451, 1, 1,
0.4117084, 0.3641922, 1.449582, 0, 0.08235294, 1, 1,
0.4147401, 0.2804615, 0.8680376, 0, 0.07450981, 1, 1,
0.4178618, 1.433799, 1.525364, 0, 0.07058824, 1, 1,
0.4195263, 1.447151, 0.8651389, 0, 0.0627451, 1, 1,
0.4212752, -1.244784, 3.396229, 0, 0.05882353, 1, 1,
0.4233963, -0.8195838, 1.477638, 0, 0.05098039, 1, 1,
0.4244858, 1.155927, 0.6143569, 0, 0.04705882, 1, 1,
0.4244911, 1.048326, 0.8117785, 0, 0.03921569, 1, 1,
0.4261922, 0.2991197, 2.121695, 0, 0.03529412, 1, 1,
0.4272043, -0.7585016, 1.648674, 0, 0.02745098, 1, 1,
0.4288661, 0.141445, -0.3381215, 0, 0.02352941, 1, 1,
0.4304863, 0.7420238, 0.758084, 0, 0.01568628, 1, 1,
0.4311422, -0.1718255, 4.206373, 0, 0.01176471, 1, 1,
0.4329118, 1.956656, 2.155522, 0, 0.003921569, 1, 1,
0.4359303, -0.2603437, 2.194859, 0.003921569, 0, 1, 1,
0.4434281, 2.296514, -0.5080699, 0.007843138, 0, 1, 1,
0.4444038, -0.1539487, 3.662496, 0.01568628, 0, 1, 1,
0.4472766, -0.5928598, 1.085841, 0.01960784, 0, 1, 1,
0.4476693, -1.390089, 2.73695, 0.02745098, 0, 1, 1,
0.4518803, -1.047058, 1.841874, 0.03137255, 0, 1, 1,
0.4554993, 0.01776609, 1.489585, 0.03921569, 0, 1, 1,
0.4582906, 1.278553, 0.1192723, 0.04313726, 0, 1, 1,
0.4625488, -0.2180315, 1.018047, 0.05098039, 0, 1, 1,
0.4631868, 1.53757, -0.5623952, 0.05490196, 0, 1, 1,
0.4686928, 1.816696, 0.2945528, 0.0627451, 0, 1, 1,
0.4701844, 0.5070865, 0.7960914, 0.06666667, 0, 1, 1,
0.4762265, -1.407042, 2.757419, 0.07450981, 0, 1, 1,
0.4898131, -0.9911439, 3.531565, 0.07843138, 0, 1, 1,
0.4917423, 1.562191, 0.06179418, 0.08627451, 0, 1, 1,
0.4940276, -2.446921, 1.614673, 0.09019608, 0, 1, 1,
0.4967714, 0.1715433, 1.670572, 0.09803922, 0, 1, 1,
0.4970186, 0.8276181, -0.03936572, 0.1058824, 0, 1, 1,
0.5001187, -1.54371, 1.812018, 0.1098039, 0, 1, 1,
0.5063635, -0.1820188, 1.210498, 0.1176471, 0, 1, 1,
0.5116064, 1.263903, 0.4611957, 0.1215686, 0, 1, 1,
0.512414, -0.7239656, 2.467101, 0.1294118, 0, 1, 1,
0.5145078, -0.2463373, 0.3354704, 0.1333333, 0, 1, 1,
0.5210357, -0.6824582, 3.095073, 0.1411765, 0, 1, 1,
0.5232734, -1.138358, 1.706116, 0.145098, 0, 1, 1,
0.523739, 0.3704943, 0.113204, 0.1529412, 0, 1, 1,
0.5252183, 1.588814, 0.325308, 0.1568628, 0, 1, 1,
0.5274398, 1.416063, -0.09803675, 0.1647059, 0, 1, 1,
0.527593, 0.7244459, 0.01772802, 0.1686275, 0, 1, 1,
0.5286169, -0.9295744, 0.2089254, 0.1764706, 0, 1, 1,
0.5310948, -0.1186334, 0.4575861, 0.1803922, 0, 1, 1,
0.5319426, -0.589698, 4.731979, 0.1882353, 0, 1, 1,
0.5328516, 0.07134973, 2.416554, 0.1921569, 0, 1, 1,
0.5486576, 1.026963, 0.2902364, 0.2, 0, 1, 1,
0.550148, 0.9754387, 0.8261178, 0.2078431, 0, 1, 1,
0.5522739, 0.77206, 1.789632, 0.2117647, 0, 1, 1,
0.5573761, -2.056669, 2.336158, 0.2196078, 0, 1, 1,
0.5588512, 0.3816963, 1.220083, 0.2235294, 0, 1, 1,
0.5596642, -0.2440434, 1.240711, 0.2313726, 0, 1, 1,
0.5598456, -0.8553652, 2.585922, 0.2352941, 0, 1, 1,
0.5628912, 0.06948747, 1.564759, 0.2431373, 0, 1, 1,
0.5649638, 0.1598158, 2.64925, 0.2470588, 0, 1, 1,
0.5699274, 0.3318247, 1.659383, 0.254902, 0, 1, 1,
0.5714327, 0.3227437, 1.665088, 0.2588235, 0, 1, 1,
0.5739151, -0.7296942, 2.35378, 0.2666667, 0, 1, 1,
0.5742233, 0.1402305, 1.125936, 0.2705882, 0, 1, 1,
0.5755574, 1.344392, 1.644342, 0.2784314, 0, 1, 1,
0.5764307, 0.1532169, 2.076483, 0.282353, 0, 1, 1,
0.5788616, -1.570135, 3.349852, 0.2901961, 0, 1, 1,
0.5809211, -0.741908, 1.518983, 0.2941177, 0, 1, 1,
0.5815195, -1.031102, 5.118237, 0.3019608, 0, 1, 1,
0.5929351, -1.208012, 3.752794, 0.3098039, 0, 1, 1,
0.5978712, 0.002875635, 0.7553321, 0.3137255, 0, 1, 1,
0.6045322, -1.023265, 2.729426, 0.3215686, 0, 1, 1,
0.6079905, 1.078809, 2.473182, 0.3254902, 0, 1, 1,
0.6084529, -0.0549057, -0.6826491, 0.3333333, 0, 1, 1,
0.6092454, 1.224187, 1.248197, 0.3372549, 0, 1, 1,
0.6129929, -1.12925, 1.052408, 0.345098, 0, 1, 1,
0.6131102, -0.8725791, 3.128476, 0.3490196, 0, 1, 1,
0.6135573, -1.212467, 3.91669, 0.3568628, 0, 1, 1,
0.6139489, 1.911837, 0.3665557, 0.3607843, 0, 1, 1,
0.6269043, 0.469427, 2.101812, 0.3686275, 0, 1, 1,
0.6285223, -0.1594095, 1.616239, 0.372549, 0, 1, 1,
0.6357962, -2.133441, 5.391026, 0.3803922, 0, 1, 1,
0.6368162, 0.7823012, 1.005027, 0.3843137, 0, 1, 1,
0.6370898, -1.157138, 2.907506, 0.3921569, 0, 1, 1,
0.6375013, 0.8406435, -0.07812964, 0.3960784, 0, 1, 1,
0.638002, -1.4986, 2.801502, 0.4039216, 0, 1, 1,
0.6393741, -1.712236, 3.731911, 0.4117647, 0, 1, 1,
0.6407442, 1.156184, -0.2948739, 0.4156863, 0, 1, 1,
0.6427778, 0.5570782, 1.776553, 0.4235294, 0, 1, 1,
0.6494306, -0.03203136, 1.547, 0.427451, 0, 1, 1,
0.6514171, -0.9620661, 1.39426, 0.4352941, 0, 1, 1,
0.6519225, -0.225187, 0.9766765, 0.4392157, 0, 1, 1,
0.6599582, 0.185809, 0.4972819, 0.4470588, 0, 1, 1,
0.6635562, -0.2283335, 1.137441, 0.4509804, 0, 1, 1,
0.6637015, 0.8624353, 2.084542, 0.4588235, 0, 1, 1,
0.6651762, -2.187214, 3.299086, 0.4627451, 0, 1, 1,
0.6734594, -0.8420967, 1.572906, 0.4705882, 0, 1, 1,
0.6772667, 0.1618637, 0.994585, 0.4745098, 0, 1, 1,
0.6830489, -0.2163962, 3.488662, 0.4823529, 0, 1, 1,
0.691622, 0.9168263, 0.9019132, 0.4862745, 0, 1, 1,
0.6930629, 0.6240298, -0.1515037, 0.4941176, 0, 1, 1,
0.6937845, 0.4330861, 1.016295, 0.5019608, 0, 1, 1,
0.6971005, 0.473981, 2.813006, 0.5058824, 0, 1, 1,
0.6979852, -0.5736586, 1.343876, 0.5137255, 0, 1, 1,
0.6981121, 0.50642, 0.2279303, 0.5176471, 0, 1, 1,
0.7067362, -0.5635743, 3.130009, 0.5254902, 0, 1, 1,
0.7072736, 1.453423, 0.2949906, 0.5294118, 0, 1, 1,
0.707866, -1.529522, 2.291513, 0.5372549, 0, 1, 1,
0.714757, 0.7124551, -0.1045643, 0.5411765, 0, 1, 1,
0.7162629, 0.5956911, 1.699777, 0.5490196, 0, 1, 1,
0.7171612, -0.0934174, 1.364789, 0.5529412, 0, 1, 1,
0.719722, -0.979569, 3.258039, 0.5607843, 0, 1, 1,
0.7225986, 0.6137605, 0.6562567, 0.5647059, 0, 1, 1,
0.723371, -0.5944014, 1.308452, 0.572549, 0, 1, 1,
0.7244868, 1.943719, 0.9131926, 0.5764706, 0, 1, 1,
0.7255775, 0.8267242, -0.9269927, 0.5843138, 0, 1, 1,
0.7266189, 1.110405, 0.844704, 0.5882353, 0, 1, 1,
0.7296625, -2.030147, 3.622369, 0.5960785, 0, 1, 1,
0.7368444, 1.231329, -0.8504331, 0.6039216, 0, 1, 1,
0.7374791, -0.3447486, 3.083529, 0.6078432, 0, 1, 1,
0.7408301, 0.09927788, 2.405341, 0.6156863, 0, 1, 1,
0.7417334, -0.7237062, 3.429222, 0.6196079, 0, 1, 1,
0.7440099, -0.3568651, -0.1578114, 0.627451, 0, 1, 1,
0.7454994, -0.02391986, 0.3297367, 0.6313726, 0, 1, 1,
0.754914, -1.685224, 5.15841, 0.6392157, 0, 1, 1,
0.7554498, -0.02391441, 2.072339, 0.6431373, 0, 1, 1,
0.7617178, 0.292166, 2.015378, 0.6509804, 0, 1, 1,
0.762312, 0.8367132, 0.5653387, 0.654902, 0, 1, 1,
0.7626357, -0.1104258, 0.9523135, 0.6627451, 0, 1, 1,
0.7652117, -0.1547842, 4.068408, 0.6666667, 0, 1, 1,
0.771973, -0.8158875, 2.955028, 0.6745098, 0, 1, 1,
0.7726172, 0.7857605, 0.4716827, 0.6784314, 0, 1, 1,
0.781929, 0.008846033, 2.183111, 0.6862745, 0, 1, 1,
0.788891, -2.212818, 3.093395, 0.6901961, 0, 1, 1,
0.7892062, -0.7416535, 1.574033, 0.6980392, 0, 1, 1,
0.795883, 1.109568, 1.690119, 0.7058824, 0, 1, 1,
0.7959584, -0.5972897, 2.966761, 0.7098039, 0, 1, 1,
0.80515, 1.370882, 0.9162177, 0.7176471, 0, 1, 1,
0.805563, 1.142487, -1.168829, 0.7215686, 0, 1, 1,
0.8179724, 2.337405, 1.440077, 0.7294118, 0, 1, 1,
0.823669, 0.8418751, 1.609645, 0.7333333, 0, 1, 1,
0.8256955, 0.9347963, 0.9054865, 0.7411765, 0, 1, 1,
0.828501, 0.2082446, 1.398168, 0.7450981, 0, 1, 1,
0.8296381, 0.8061503, 0.5618623, 0.7529412, 0, 1, 1,
0.831986, -0.2182205, 3.120667, 0.7568628, 0, 1, 1,
0.8327376, 0.7767668, 2.358135, 0.7647059, 0, 1, 1,
0.838922, 2.056268, 1.986833, 0.7686275, 0, 1, 1,
0.841428, -0.6692681, 0.9520904, 0.7764706, 0, 1, 1,
0.8431608, -0.8616905, 1.921833, 0.7803922, 0, 1, 1,
0.8486074, 0.2741103, 2.369806, 0.7882353, 0, 1, 1,
0.8573709, -1.014095, 1.270083, 0.7921569, 0, 1, 1,
0.857609, -1.309448, 1.785858, 0.8, 0, 1, 1,
0.86169, 0.7089076, 1.647047, 0.8078431, 0, 1, 1,
0.8668864, 1.715387, 1.253372, 0.8117647, 0, 1, 1,
0.8672605, -1.203497, 2.47625, 0.8196079, 0, 1, 1,
0.8715944, -1.028467, 2.373663, 0.8235294, 0, 1, 1,
0.8908449, -0.0533879, 0.01276817, 0.8313726, 0, 1, 1,
0.8916975, 0.9178356, 0.8576533, 0.8352941, 0, 1, 1,
0.8984402, -2.165065, 4.209974, 0.8431373, 0, 1, 1,
0.9010534, -1.114152, 2.546077, 0.8470588, 0, 1, 1,
0.909879, -0.07379033, 0.6625784, 0.854902, 0, 1, 1,
0.9124489, -0.9314333, 1.916342, 0.8588235, 0, 1, 1,
0.9178901, 1.701065, 0.5766437, 0.8666667, 0, 1, 1,
0.919017, -0.5111794, 2.327877, 0.8705882, 0, 1, 1,
0.9192404, -0.003350444, 3.469527, 0.8784314, 0, 1, 1,
0.921219, 2.287422, -0.5929279, 0.8823529, 0, 1, 1,
0.9235969, -0.8850179, 2.366912, 0.8901961, 0, 1, 1,
0.9395246, -0.8486277, 1.780395, 0.8941177, 0, 1, 1,
0.9449217, -0.3660203, 1.331099, 0.9019608, 0, 1, 1,
0.9503992, 0.1774833, 0.8276497, 0.9098039, 0, 1, 1,
0.9514363, -0.6513675, 3.115603, 0.9137255, 0, 1, 1,
0.9550158, 1.088474, 1.885555, 0.9215686, 0, 1, 1,
0.9581556, -0.4893481, 2.235615, 0.9254902, 0, 1, 1,
0.9591392, 0.7635567, 1.106783, 0.9333333, 0, 1, 1,
0.9676318, -1.269287, 2.976906, 0.9372549, 0, 1, 1,
0.971008, 0.253354, -2.30199, 0.945098, 0, 1, 1,
0.9714198, -2.493762, 1.965138, 0.9490196, 0, 1, 1,
0.9744365, -0.2286979, 2.017638, 0.9568627, 0, 1, 1,
0.9744872, 1.44407, 0.3894494, 0.9607843, 0, 1, 1,
1.006955, 0.4657153, 1.364727, 0.9686275, 0, 1, 1,
1.007038, -1.278727, 2.972007, 0.972549, 0, 1, 1,
1.018776, 1.97058, -0.8857573, 0.9803922, 0, 1, 1,
1.022219, 1.431103, 0.4820287, 0.9843137, 0, 1, 1,
1.024154, -0.4659593, 2.328416, 0.9921569, 0, 1, 1,
1.026505, -0.2300558, 0.1346678, 0.9960784, 0, 1, 1,
1.031344, 0.1335399, 0.5064976, 1, 0, 0.9960784, 1,
1.042777, 0.6849412, 0.3471309, 1, 0, 0.9882353, 1,
1.050728, 0.2145578, 1.591692, 1, 0, 0.9843137, 1,
1.058142, -0.8505496, 1.456836, 1, 0, 0.9764706, 1,
1.061117, -0.8941169, 0.9053473, 1, 0, 0.972549, 1,
1.065046, -1.533172, 2.105149, 1, 0, 0.9647059, 1,
1.075394, -0.438125, 2.695306, 1, 0, 0.9607843, 1,
1.081243, -1.637609, 3.134431, 1, 0, 0.9529412, 1,
1.083619, 0.5856415, -0.2902858, 1, 0, 0.9490196, 1,
1.086275, 0.8630197, 0.6512025, 1, 0, 0.9411765, 1,
1.087459, 0.03318438, 1.513049, 1, 0, 0.9372549, 1,
1.089231, 0.9195617, -0.7446777, 1, 0, 0.9294118, 1,
1.093198, 0.6817119, 0.8742732, 1, 0, 0.9254902, 1,
1.105735, -0.5715621, 2.770194, 1, 0, 0.9176471, 1,
1.107437, -0.2145824, 1.625836, 1, 0, 0.9137255, 1,
1.11071, -1.606828, 2.375966, 1, 0, 0.9058824, 1,
1.130129, -1.673758, 3.816427, 1, 0, 0.9019608, 1,
1.131018, -0.5569602, 2.323396, 1, 0, 0.8941177, 1,
1.133993, 1.213297, -0.1033716, 1, 0, 0.8862745, 1,
1.138454, 0.1212798, 2.738929, 1, 0, 0.8823529, 1,
1.138495, -0.5521321, 2.674274, 1, 0, 0.8745098, 1,
1.139898, 1.016672, -0.2430504, 1, 0, 0.8705882, 1,
1.144804, -0.9878008, 1.953222, 1, 0, 0.8627451, 1,
1.146355, 0.8413159, 0.2366144, 1, 0, 0.8588235, 1,
1.14863, 1.761319, 0.946758, 1, 0, 0.8509804, 1,
1.150293, 0.9450843, 0.07510222, 1, 0, 0.8470588, 1,
1.153051, -1.227074, 2.301329, 1, 0, 0.8392157, 1,
1.15891, -0.1213454, 2.227824, 1, 0, 0.8352941, 1,
1.16502, -1.017152, 1.700883, 1, 0, 0.827451, 1,
1.169633, 1.260263, 1.962037, 1, 0, 0.8235294, 1,
1.170671, -1.065003, 3.368592, 1, 0, 0.8156863, 1,
1.172449, 0.6682072, 1.743637, 1, 0, 0.8117647, 1,
1.1726, -0.07782557, 3.063304, 1, 0, 0.8039216, 1,
1.181213, -0.3236692, 1.847292, 1, 0, 0.7960784, 1,
1.186694, -0.355225, 0.6824723, 1, 0, 0.7921569, 1,
1.186722, 1.197942, 2.262675, 1, 0, 0.7843137, 1,
1.194021, -0.8604141, 1.981253, 1, 0, 0.7803922, 1,
1.196246, -1.377367, 1.172996, 1, 0, 0.772549, 1,
1.196628, 0.251385, 2.55453, 1, 0, 0.7686275, 1,
1.198288, -0.3082329, 1.29556, 1, 0, 0.7607843, 1,
1.201552, 1.503237, -1.341108, 1, 0, 0.7568628, 1,
1.209182, -2.072589, 3.524683, 1, 0, 0.7490196, 1,
1.214831, 1.008564, -0.9779302, 1, 0, 0.7450981, 1,
1.223034, 1.400548, 0.9156027, 1, 0, 0.7372549, 1,
1.22423, -1.08222, 2.50333, 1, 0, 0.7333333, 1,
1.229644, 0.445034, 2.975796, 1, 0, 0.7254902, 1,
1.231711, -0.401271, 0.9356666, 1, 0, 0.7215686, 1,
1.235942, -0.1305943, 0.1932219, 1, 0, 0.7137255, 1,
1.239571, 0.6227943, 3.512372, 1, 0, 0.7098039, 1,
1.244512, 0.7246474, 0.927898, 1, 0, 0.7019608, 1,
1.252841, -0.6904811, 2.502348, 1, 0, 0.6941177, 1,
1.25943, 2.249277, 0.7993422, 1, 0, 0.6901961, 1,
1.28425, -0.05766645, 2.547484, 1, 0, 0.682353, 1,
1.291515, 0.8904445, 1.689544, 1, 0, 0.6784314, 1,
1.31643, 0.3129798, 2.098292, 1, 0, 0.6705883, 1,
1.327603, -0.3491401, 2.871014, 1, 0, 0.6666667, 1,
1.328919, 0.06539668, 1.995447, 1, 0, 0.6588235, 1,
1.329184, 1.014938, -0.7171016, 1, 0, 0.654902, 1,
1.33577, 0.7002415, 1.713033, 1, 0, 0.6470588, 1,
1.340279, 1.638782, 0.2147351, 1, 0, 0.6431373, 1,
1.342398, -0.1628621, 0.02979091, 1, 0, 0.6352941, 1,
1.345132, -0.8634498, 0.6532144, 1, 0, 0.6313726, 1,
1.373186, 0.4930959, 1.657497, 1, 0, 0.6235294, 1,
1.376805, -0.2731924, 0.576473, 1, 0, 0.6196079, 1,
1.377888, -0.7490358, 2.799049, 1, 0, 0.6117647, 1,
1.402844, 0.2512243, 2.513093, 1, 0, 0.6078432, 1,
1.406874, 2.15589, 2.872997, 1, 0, 0.6, 1,
1.40716, -0.6712888, 3.220672, 1, 0, 0.5921569, 1,
1.407265, -0.2046302, 1.294281, 1, 0, 0.5882353, 1,
1.407358, -0.89617, 1.278779, 1, 0, 0.5803922, 1,
1.413267, 1.011619, -0.3160444, 1, 0, 0.5764706, 1,
1.420904, -0.2074772, 0.8712732, 1, 0, 0.5686275, 1,
1.426626, 0.9717177, 2.033305, 1, 0, 0.5647059, 1,
1.432156, 0.4139568, 1.502901, 1, 0, 0.5568628, 1,
1.436812, -1.003683, 0.3861172, 1, 0, 0.5529412, 1,
1.442192, -0.6587125, 0.5821319, 1, 0, 0.5450981, 1,
1.452959, -0.4783483, 1.965943, 1, 0, 0.5411765, 1,
1.465432, 1.230844, 1.280982, 1, 0, 0.5333334, 1,
1.467805, 0.1121601, 0.4282517, 1, 0, 0.5294118, 1,
1.468011, -1.012126, 2.940728, 1, 0, 0.5215687, 1,
1.477881, 0.141378, 1.326245, 1, 0, 0.5176471, 1,
1.478923, 0.1156992, 0.6830243, 1, 0, 0.509804, 1,
1.494459, 0.1675374, 1.684429, 1, 0, 0.5058824, 1,
1.516543, -0.3987811, 2.95102, 1, 0, 0.4980392, 1,
1.531438, -1.056888, 1.786107, 1, 0, 0.4901961, 1,
1.535825, 0.4287466, 3.544465, 1, 0, 0.4862745, 1,
1.568157, -0.266329, 1.535959, 1, 0, 0.4784314, 1,
1.572123, 0.4811856, 1.063332, 1, 0, 0.4745098, 1,
1.590348, 0.292128, 2.260311, 1, 0, 0.4666667, 1,
1.594933, -1.008662, 3.686557, 1, 0, 0.4627451, 1,
1.599701, -0.6654838, 3.411255, 1, 0, 0.454902, 1,
1.605686, -1.416458, 2.293892, 1, 0, 0.4509804, 1,
1.609953, 0.1391898, 1.277945, 1, 0, 0.4431373, 1,
1.614991, 2.134318, 0.8443283, 1, 0, 0.4392157, 1,
1.617685, -0.8240066, 2.101056, 1, 0, 0.4313726, 1,
1.62197, -0.1285806, 1.133576, 1, 0, 0.427451, 1,
1.625035, -0.4031268, 1.458186, 1, 0, 0.4196078, 1,
1.657019, -0.08989982, 0.6654258, 1, 0, 0.4156863, 1,
1.669282, 0.7068131, 0.1573257, 1, 0, 0.4078431, 1,
1.688651, 1.039953, 0.2725198, 1, 0, 0.4039216, 1,
1.694062, 0.1000494, 2.795268, 1, 0, 0.3960784, 1,
1.705655, 0.01354067, 0.01776434, 1, 0, 0.3882353, 1,
1.724358, -1.36151, 2.313569, 1, 0, 0.3843137, 1,
1.725843, -0.3433191, -0.231406, 1, 0, 0.3764706, 1,
1.733073, 1.176822, -0.7692978, 1, 0, 0.372549, 1,
1.745368, 1.191653, -0.2035243, 1, 0, 0.3647059, 1,
1.768473, -1.685217, 1.121468, 1, 0, 0.3607843, 1,
1.778993, 0.8332911, 1.599528, 1, 0, 0.3529412, 1,
1.784011, -1.387894, 3.509973, 1, 0, 0.3490196, 1,
1.794564, -0.3945265, 2.616887, 1, 0, 0.3411765, 1,
1.795179, -1.206069, 2.329244, 1, 0, 0.3372549, 1,
1.797507, -0.3478194, 0.2333801, 1, 0, 0.3294118, 1,
1.803543, 0.3369411, 2.618705, 1, 0, 0.3254902, 1,
1.814472, -0.2110835, 2.390625, 1, 0, 0.3176471, 1,
1.820984, -0.05123231, 3.143897, 1, 0, 0.3137255, 1,
1.82143, -1.39292, 2.964472, 1, 0, 0.3058824, 1,
1.828371, 0.1289026, 1.375577, 1, 0, 0.2980392, 1,
1.840554, 0.2596488, 2.153805, 1, 0, 0.2941177, 1,
1.862273, -0.9323958, 0.03243555, 1, 0, 0.2862745, 1,
1.862686, -0.1230441, 1.935998, 1, 0, 0.282353, 1,
1.882712, 0.5619799, 1.671044, 1, 0, 0.2745098, 1,
1.884181, -0.04071342, 2.37805, 1, 0, 0.2705882, 1,
1.890546, -1.547003, 1.567472, 1, 0, 0.2627451, 1,
1.897, 0.398341, 0.199481, 1, 0, 0.2588235, 1,
1.90418, -0.4793233, 2.393987, 1, 0, 0.2509804, 1,
1.904403, 2.052139, 1.126334, 1, 0, 0.2470588, 1,
1.909911, 0.225396, 0.753459, 1, 0, 0.2392157, 1,
1.909975, 1.180628, -0.8296865, 1, 0, 0.2352941, 1,
1.932166, 1.099302, 2.128025, 1, 0, 0.227451, 1,
1.934886, -0.7806673, 2.602086, 1, 0, 0.2235294, 1,
1.950359, 0.4803935, 3.217035, 1, 0, 0.2156863, 1,
1.970112, -0.8291869, 2.856539, 1, 0, 0.2117647, 1,
1.980664, -1.0286, 2.376176, 1, 0, 0.2039216, 1,
1.986187, 0.5248324, 1.49473, 1, 0, 0.1960784, 1,
1.988213, 1.665125, 1.866266, 1, 0, 0.1921569, 1,
1.990161, 1.122732, 0.9557803, 1, 0, 0.1843137, 1,
1.991539, -0.1114207, 3.775902, 1, 0, 0.1803922, 1,
2.017545, 0.7341352, 2.027858, 1, 0, 0.172549, 1,
2.056565, 0.7167868, 0.8697324, 1, 0, 0.1686275, 1,
2.065169, -0.8263733, 1.747826, 1, 0, 0.1607843, 1,
2.070105, 0.6021383, -0.5367653, 1, 0, 0.1568628, 1,
2.087084, 0.6545671, 2.670355, 1, 0, 0.1490196, 1,
2.091079, 1.717976, 0.009319577, 1, 0, 0.145098, 1,
2.099658, 0.7121643, 2.824661, 1, 0, 0.1372549, 1,
2.164608, -1.19033, 1.56007, 1, 0, 0.1333333, 1,
2.177369, 1.181319, 0.8305864, 1, 0, 0.1254902, 1,
2.195776, 0.6829565, 0.5373238, 1, 0, 0.1215686, 1,
2.204806, -0.2127409, 1.694926, 1, 0, 0.1137255, 1,
2.205114, -1.467324, 2.627671, 1, 0, 0.1098039, 1,
2.24854, -1.641194, 1.213767, 1, 0, 0.1019608, 1,
2.288961, 0.3615637, 2.223295, 1, 0, 0.09411765, 1,
2.291219, 0.401773, 1.67855, 1, 0, 0.09019608, 1,
2.308451, 0.8532083, 2.045108, 1, 0, 0.08235294, 1,
2.309475, -0.5951973, 2.044084, 1, 0, 0.07843138, 1,
2.323831, 1.591079, 0.3954453, 1, 0, 0.07058824, 1,
2.417346, 0.5091599, 0.645131, 1, 0, 0.06666667, 1,
2.449023, -1.468463, 3.520699, 1, 0, 0.05882353, 1,
2.462157, -1.107674, 2.867408, 1, 0, 0.05490196, 1,
2.539662, 0.8228256, 1.952896, 1, 0, 0.04705882, 1,
2.544789, 1.588925, 1.236145, 1, 0, 0.04313726, 1,
2.587197, 0.5708566, -1.006571, 1, 0, 0.03529412, 1,
2.635712, -0.8093162, 0.9725972, 1, 0, 0.03137255, 1,
2.665277, 0.3845671, 0.5380414, 1, 0, 0.02352941, 1,
2.77315, -2.13128, 2.163403, 1, 0, 0.01960784, 1,
2.89232, 2.071064, 1.284009, 1, 0, 0.01176471, 1,
3.190096, 0.2190511, 3.371604, 1, 0, 0.007843138, 1
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
0.142783, -4.833527, -7.521444, 0, -0.5, 0.5, 0.5,
0.142783, -4.833527, -7.521444, 1, -0.5, 0.5, 0.5,
0.142783, -4.833527, -7.521444, 1, 1.5, 0.5, 0.5,
0.142783, -4.833527, -7.521444, 0, 1.5, 0.5, 0.5
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
-3.93757, -0.08354425, -7.521444, 0, -0.5, 0.5, 0.5,
-3.93757, -0.08354425, -7.521444, 1, -0.5, 0.5, 0.5,
-3.93757, -0.08354425, -7.521444, 1, 1.5, 0.5, 0.5,
-3.93757, -0.08354425, -7.521444, 0, 1.5, 0.5, 0.5
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
-3.93757, -4.833527, -0.05784273, 0, -0.5, 0.5, 0.5,
-3.93757, -4.833527, -0.05784273, 1, -0.5, 0.5, 0.5,
-3.93757, -4.833527, -0.05784273, 1, 1.5, 0.5, 0.5,
-3.93757, -4.833527, -0.05784273, 0, 1.5, 0.5, 0.5
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
-2, -3.737377, -5.799075,
3, -3.737377, -5.799075,
-2, -3.737377, -5.799075,
-2, -3.920069, -6.086136,
-1, -3.737377, -5.799075,
-1, -3.920069, -6.086136,
0, -3.737377, -5.799075,
0, -3.920069, -6.086136,
1, -3.737377, -5.799075,
1, -3.920069, -6.086136,
2, -3.737377, -5.799075,
2, -3.920069, -6.086136,
3, -3.737377, -5.799075,
3, -3.920069, -6.086136
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
-2, -4.285452, -6.66026, 0, -0.5, 0.5, 0.5,
-2, -4.285452, -6.66026, 1, -0.5, 0.5, 0.5,
-2, -4.285452, -6.66026, 1, 1.5, 0.5, 0.5,
-2, -4.285452, -6.66026, 0, 1.5, 0.5, 0.5,
-1, -4.285452, -6.66026, 0, -0.5, 0.5, 0.5,
-1, -4.285452, -6.66026, 1, -0.5, 0.5, 0.5,
-1, -4.285452, -6.66026, 1, 1.5, 0.5, 0.5,
-1, -4.285452, -6.66026, 0, 1.5, 0.5, 0.5,
0, -4.285452, -6.66026, 0, -0.5, 0.5, 0.5,
0, -4.285452, -6.66026, 1, -0.5, 0.5, 0.5,
0, -4.285452, -6.66026, 1, 1.5, 0.5, 0.5,
0, -4.285452, -6.66026, 0, 1.5, 0.5, 0.5,
1, -4.285452, -6.66026, 0, -0.5, 0.5, 0.5,
1, -4.285452, -6.66026, 1, -0.5, 0.5, 0.5,
1, -4.285452, -6.66026, 1, 1.5, 0.5, 0.5,
1, -4.285452, -6.66026, 0, 1.5, 0.5, 0.5,
2, -4.285452, -6.66026, 0, -0.5, 0.5, 0.5,
2, -4.285452, -6.66026, 1, -0.5, 0.5, 0.5,
2, -4.285452, -6.66026, 1, 1.5, 0.5, 0.5,
2, -4.285452, -6.66026, 0, 1.5, 0.5, 0.5,
3, -4.285452, -6.66026, 0, -0.5, 0.5, 0.5,
3, -4.285452, -6.66026, 1, -0.5, 0.5, 0.5,
3, -4.285452, -6.66026, 1, 1.5, 0.5, 0.5,
3, -4.285452, -6.66026, 0, 1.5, 0.5, 0.5
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
-2.99595, -2, -5.799075,
-2.99595, 2, -5.799075,
-2.99595, -2, -5.799075,
-3.152886, -2, -6.086136,
-2.99595, 0, -5.799075,
-3.152886, 0, -6.086136,
-2.99595, 2, -5.799075,
-3.152886, 2, -6.086136
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
-3.46676, -2, -6.66026, 0, -0.5, 0.5, 0.5,
-3.46676, -2, -6.66026, 1, -0.5, 0.5, 0.5,
-3.46676, -2, -6.66026, 1, 1.5, 0.5, 0.5,
-3.46676, -2, -6.66026, 0, 1.5, 0.5, 0.5,
-3.46676, 0, -6.66026, 0, -0.5, 0.5, 0.5,
-3.46676, 0, -6.66026, 1, -0.5, 0.5, 0.5,
-3.46676, 0, -6.66026, 1, 1.5, 0.5, 0.5,
-3.46676, 0, -6.66026, 0, 1.5, 0.5, 0.5,
-3.46676, 2, -6.66026, 0, -0.5, 0.5, 0.5,
-3.46676, 2, -6.66026, 1, -0.5, 0.5, 0.5,
-3.46676, 2, -6.66026, 1, 1.5, 0.5, 0.5,
-3.46676, 2, -6.66026, 0, 1.5, 0.5, 0.5
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
-2.99595, -3.737377, -4,
-2.99595, -3.737377, 4,
-2.99595, -3.737377, -4,
-3.152886, -3.920069, -4,
-2.99595, -3.737377, -2,
-3.152886, -3.920069, -2,
-2.99595, -3.737377, 0,
-3.152886, -3.920069, 0,
-2.99595, -3.737377, 2,
-3.152886, -3.920069, 2,
-2.99595, -3.737377, 4,
-3.152886, -3.920069, 4
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
-3.46676, -4.285452, -4, 0, -0.5, 0.5, 0.5,
-3.46676, -4.285452, -4, 1, -0.5, 0.5, 0.5,
-3.46676, -4.285452, -4, 1, 1.5, 0.5, 0.5,
-3.46676, -4.285452, -4, 0, 1.5, 0.5, 0.5,
-3.46676, -4.285452, -2, 0, -0.5, 0.5, 0.5,
-3.46676, -4.285452, -2, 1, -0.5, 0.5, 0.5,
-3.46676, -4.285452, -2, 1, 1.5, 0.5, 0.5,
-3.46676, -4.285452, -2, 0, 1.5, 0.5, 0.5,
-3.46676, -4.285452, 0, 0, -0.5, 0.5, 0.5,
-3.46676, -4.285452, 0, 1, -0.5, 0.5, 0.5,
-3.46676, -4.285452, 0, 1, 1.5, 0.5, 0.5,
-3.46676, -4.285452, 0, 0, 1.5, 0.5, 0.5,
-3.46676, -4.285452, 2, 0, -0.5, 0.5, 0.5,
-3.46676, -4.285452, 2, 1, -0.5, 0.5, 0.5,
-3.46676, -4.285452, 2, 1, 1.5, 0.5, 0.5,
-3.46676, -4.285452, 2, 0, 1.5, 0.5, 0.5,
-3.46676, -4.285452, 4, 0, -0.5, 0.5, 0.5,
-3.46676, -4.285452, 4, 1, -0.5, 0.5, 0.5,
-3.46676, -4.285452, 4, 1, 1.5, 0.5, 0.5,
-3.46676, -4.285452, 4, 0, 1.5, 0.5, 0.5
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
-2.99595, -3.737377, -5.799075,
-2.99595, 3.570289, -5.799075,
-2.99595, -3.737377, 5.68339,
-2.99595, 3.570289, 5.68339,
-2.99595, -3.737377, -5.799075,
-2.99595, -3.737377, 5.68339,
-2.99595, 3.570289, -5.799075,
-2.99595, 3.570289, 5.68339,
-2.99595, -3.737377, -5.799075,
3.281516, -3.737377, -5.799075,
-2.99595, -3.737377, 5.68339,
3.281516, -3.737377, 5.68339,
-2.99595, 3.570289, -5.799075,
3.281516, 3.570289, -5.799075,
-2.99595, 3.570289, 5.68339,
3.281516, 3.570289, 5.68339,
3.281516, -3.737377, -5.799075,
3.281516, 3.570289, -5.799075,
3.281516, -3.737377, 5.68339,
3.281516, 3.570289, 5.68339,
3.281516, -3.737377, -5.799075,
3.281516, -3.737377, 5.68339,
3.281516, 3.570289, -5.799075,
3.281516, 3.570289, 5.68339
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
var radius = 8.003575;
var distance = 35.60881;
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
mvMatrix.translate( -0.142783, 0.08354425, 0.05784273 );
mvMatrix.scale( 1.378522, 1.184184, 0.7536381 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.60881);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
bensultap<-read.table("bensultap.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-bensultap$V2
```

```
## Error in eval(expr, envir, enclos): object 'bensultap' not found
```

```r
y<-bensultap$V3
```

```
## Error in eval(expr, envir, enclos): object 'bensultap' not found
```

```r
z<-bensultap$V4
```

```
## Error in eval(expr, envir, enclos): object 'bensultap' not found
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
-2.90453, 1.179457, -0.5012901, 0, 0, 1, 1, 1,
-2.737125, 0.04205887, -1.437787, 1, 0, 0, 1, 1,
-2.713125, 1.153641, -3.108114, 1, 0, 0, 1, 1,
-2.663928, 1.055385, 0.6063938, 1, 0, 0, 1, 1,
-2.58154, -1.189006, -3.133288, 1, 0, 0, 1, 1,
-2.496053, 0.2379628, 0.231922, 1, 0, 0, 1, 1,
-2.473625, 1.272302, -1.981299, 0, 0, 0, 1, 1,
-2.465583, 0.5490346, -1.989277, 0, 0, 0, 1, 1,
-2.41823, -0.1348153, -0.7164128, 0, 0, 0, 1, 1,
-2.362352, -1.161868, -1.785414, 0, 0, 0, 1, 1,
-2.341523, 1.913213, -1.547426, 0, 0, 0, 1, 1,
-2.268162, 0.7394098, -1.447923, 0, 0, 0, 1, 1,
-2.245505, 0.6939929, -3.411159, 0, 0, 0, 1, 1,
-2.23146, 0.1382312, -1.849863, 1, 1, 1, 1, 1,
-2.210176, 1.153707, 0.4333531, 1, 1, 1, 1, 1,
-2.200435, -0.1316102, -2.154362, 1, 1, 1, 1, 1,
-2.168255, 0.3952346, -0.3595816, 1, 1, 1, 1, 1,
-2.111131, 0.9757159, 0.03216232, 1, 1, 1, 1, 1,
-2.090514, -0.01073515, -1.870404, 1, 1, 1, 1, 1,
-2.088653, -1.89681, -2.508201, 1, 1, 1, 1, 1,
-2.085547, -0.1486794, -1.90482, 1, 1, 1, 1, 1,
-2.073686, -1.847122, -1.377214, 1, 1, 1, 1, 1,
-2.034563, -0.1845228, -1.249229, 1, 1, 1, 1, 1,
-2.031707, 2.205811, -0.8056, 1, 1, 1, 1, 1,
-2.030532, -0.1551507, -2.287627, 1, 1, 1, 1, 1,
-2.025967, -0.1875487, -2.435117, 1, 1, 1, 1, 1,
-2.025105, 0.9846866, -1.372472, 1, 1, 1, 1, 1,
-1.962175, 0.5306404, -1.674814, 1, 1, 1, 1, 1,
-1.961431, 0.8138655, 0.2266569, 0, 0, 1, 1, 1,
-1.960162, 1.717074, 0.05302639, 1, 0, 0, 1, 1,
-1.945047, 0.4543824, -3.352992, 1, 0, 0, 1, 1,
-1.933251, -0.984271, -2.902562, 1, 0, 0, 1, 1,
-1.926454, 0.6396564, 0.2623708, 1, 0, 0, 1, 1,
-1.911737, 0.1117402, -0.6177409, 1, 0, 0, 1, 1,
-1.90577, -0.2492309, -2.017575, 0, 0, 0, 1, 1,
-1.890511, -0.4907426, -0.5142172, 0, 0, 0, 1, 1,
-1.872385, -0.5688888, -3.307199, 0, 0, 0, 1, 1,
-1.859533, 0.1846552, -1.577679, 0, 0, 0, 1, 1,
-1.808512, -0.08701049, -0.796079, 0, 0, 0, 1, 1,
-1.800324, -0.4366941, -0.2203909, 0, 0, 0, 1, 1,
-1.789714, 0.5767639, -1.335932, 0, 0, 0, 1, 1,
-1.784415, -0.6275946, -0.7399238, 1, 1, 1, 1, 1,
-1.761838, 1.57775, -1.371433, 1, 1, 1, 1, 1,
-1.742795, 0.009521383, -1.228133, 1, 1, 1, 1, 1,
-1.688447, 1.199185, 0.1100486, 1, 1, 1, 1, 1,
-1.682638, -0.1501638, -2.253503, 1, 1, 1, 1, 1,
-1.682482, 1.536222, -0.004720916, 1, 1, 1, 1, 1,
-1.667903, -0.1612751, -0.9364039, 1, 1, 1, 1, 1,
-1.66746, 0.8572552, -1.100172, 1, 1, 1, 1, 1,
-1.66729, 0.734001, -0.775851, 1, 1, 1, 1, 1,
-1.648448, -0.1542461, -0.9270173, 1, 1, 1, 1, 1,
-1.648248, -0.2541405, -1.050307, 1, 1, 1, 1, 1,
-1.646689, 1.015693, -1.604745, 1, 1, 1, 1, 1,
-1.632313, -1.205291, -3.014536, 1, 1, 1, 1, 1,
-1.632147, 0.7109879, -0.2622283, 1, 1, 1, 1, 1,
-1.619415, 1.917424, -0.6379842, 1, 1, 1, 1, 1,
-1.618302, 0.4059451, 0.4747266, 0, 0, 1, 1, 1,
-1.607299, 0.8406861, -2.101465, 1, 0, 0, 1, 1,
-1.600126, -0.629316, -2.861676, 1, 0, 0, 1, 1,
-1.565069, -1.183823, -2.76032, 1, 0, 0, 1, 1,
-1.554778, 0.8285004, 0.559375, 1, 0, 0, 1, 1,
-1.550854, -0.6018243, -3.455572, 1, 0, 0, 1, 1,
-1.549349, -0.7279444, -1.850334, 0, 0, 0, 1, 1,
-1.533985, 0.6809796, -0.3818742, 0, 0, 0, 1, 1,
-1.526832, 0.2490863, -1.835048, 0, 0, 0, 1, 1,
-1.526416, 0.006945312, -2.075799, 0, 0, 0, 1, 1,
-1.521021, -1.045216, -1.405434, 0, 0, 0, 1, 1,
-1.504444, 0.04310852, -0.9626147, 0, 0, 0, 1, 1,
-1.502309, -1.266587, -1.683967, 0, 0, 0, 1, 1,
-1.493543, 0.7361053, -0.739355, 1, 1, 1, 1, 1,
-1.472652, -0.4256542, -4.810544, 1, 1, 1, 1, 1,
-1.469468, -0.6608845, -0.8549804, 1, 1, 1, 1, 1,
-1.461638, -0.4564537, 0.2764525, 1, 1, 1, 1, 1,
-1.452587, 0.2786396, -0.3592105, 1, 1, 1, 1, 1,
-1.443906, 0.4638767, -3.14047, 1, 1, 1, 1, 1,
-1.443814, 0.4352151, -1.484642, 1, 1, 1, 1, 1,
-1.442584, -1.166366, -2.701216, 1, 1, 1, 1, 1,
-1.423145, 0.2015758, -2.039654, 1, 1, 1, 1, 1,
-1.420391, -0.3138423, -0.3798606, 1, 1, 1, 1, 1,
-1.406303, 0.2230146, -1.63859, 1, 1, 1, 1, 1,
-1.404801, 0.6631413, -3.789564, 1, 1, 1, 1, 1,
-1.403094, 1.206746, -1.279027, 1, 1, 1, 1, 1,
-1.398662, 0.7558372, -0.1794249, 1, 1, 1, 1, 1,
-1.389216, 1.954427, -2.060661, 1, 1, 1, 1, 1,
-1.386066, 0.263175, -3.387712, 0, 0, 1, 1, 1,
-1.380969, 0.1513438, -0.5254439, 1, 0, 0, 1, 1,
-1.372579, -1.309963, -3.374067, 1, 0, 0, 1, 1,
-1.366936, -0.4188253, -2.373718, 1, 0, 0, 1, 1,
-1.354571, 0.4708018, -1.911157, 1, 0, 0, 1, 1,
-1.352688, 0.9295933, -0.5485189, 1, 0, 0, 1, 1,
-1.346129, 1.346882, -0.1454934, 0, 0, 0, 1, 1,
-1.339366, -0.2603406, -1.54219, 0, 0, 0, 1, 1,
-1.337913, -0.9991009, -1.036686, 0, 0, 0, 1, 1,
-1.321537, -1.869277, -3.424798, 0, 0, 0, 1, 1,
-1.314948, -1.022673, -1.481035, 0, 0, 0, 1, 1,
-1.302603, -0.1008694, -0.2808794, 0, 0, 0, 1, 1,
-1.292918, 1.007517, -0.09689105, 0, 0, 0, 1, 1,
-1.292802, -0.9105282, -1.899105, 1, 1, 1, 1, 1,
-1.282083, 0.7954732, -0.03891485, 1, 1, 1, 1, 1,
-1.282005, 2.547469, -0.2400423, 1, 1, 1, 1, 1,
-1.277353, -2.598622, -2.946367, 1, 1, 1, 1, 1,
-1.26626, -0.6621462, -1.102363, 1, 1, 1, 1, 1,
-1.261129, 1.384743, -0.4385986, 1, 1, 1, 1, 1,
-1.241678, -0.8995013, -3.85317, 1, 1, 1, 1, 1,
-1.234179, 0.1147023, -1.79804, 1, 1, 1, 1, 1,
-1.233669, -0.3584543, -3.815365, 1, 1, 1, 1, 1,
-1.233009, 0.1509268, -0.4586992, 1, 1, 1, 1, 1,
-1.225803, -0.07292404, -0.2143517, 1, 1, 1, 1, 1,
-1.224366, 0.4984615, -1.839554, 1, 1, 1, 1, 1,
-1.215625, 1.318494, -1.897937, 1, 1, 1, 1, 1,
-1.207723, 0.2318105, 0.7853596, 1, 1, 1, 1, 1,
-1.198177, -2.327417, -2.397277, 1, 1, 1, 1, 1,
-1.197779, -0.3076789, 0.3268946, 0, 0, 1, 1, 1,
-1.192874, -0.6417076, -3.144735, 1, 0, 0, 1, 1,
-1.189819, -0.2830415, -2.755513, 1, 0, 0, 1, 1,
-1.180328, 1.140147, -0.5893385, 1, 0, 0, 1, 1,
-1.175406, -0.6510121, -1.499309, 1, 0, 0, 1, 1,
-1.174322, 0.01038395, -1.304453, 1, 0, 0, 1, 1,
-1.156674, 0.07844875, -1.510582, 0, 0, 0, 1, 1,
-1.151014, -2.45425, -1.191221, 0, 0, 0, 1, 1,
-1.149528, 0.1512761, -2.017075, 0, 0, 0, 1, 1,
-1.146566, -1.235207, -2.637248, 0, 0, 0, 1, 1,
-1.143451, -0.08767808, -1.295429, 0, 0, 0, 1, 1,
-1.138976, 0.7912565, -1.475089, 0, 0, 0, 1, 1,
-1.136922, -0.5893741, -1.799803, 0, 0, 0, 1, 1,
-1.135661, -1.3085, -3.791246, 1, 1, 1, 1, 1,
-1.101062, -0.9468392, -2.871845, 1, 1, 1, 1, 1,
-1.098567, 0.238079, -1.305236, 1, 1, 1, 1, 1,
-1.087082, -1.250987, -2.114172, 1, 1, 1, 1, 1,
-1.0859, -1.799955, -4.192549, 1, 1, 1, 1, 1,
-1.083119, -0.5765492, -2.380863, 1, 1, 1, 1, 1,
-1.07712, -0.3609508, -1.801347, 1, 1, 1, 1, 1,
-1.070496, 1.371703, -0.6269141, 1, 1, 1, 1, 1,
-1.069798, -0.2165088, -2.578959, 1, 1, 1, 1, 1,
-1.066247, 0.3947597, -1.732032, 1, 1, 1, 1, 1,
-1.065607, -0.5200914, -2.143152, 1, 1, 1, 1, 1,
-1.064051, -1.485638, -3.667383, 1, 1, 1, 1, 1,
-1.059756, -0.4834525, -0.3804848, 1, 1, 1, 1, 1,
-1.059686, 0.7773655, -0.07898922, 1, 1, 1, 1, 1,
-1.052087, 0.07253291, -0.7811162, 1, 1, 1, 1, 1,
-1.049314, 1.142866, -1.5344, 0, 0, 1, 1, 1,
-1.040107, 1.762439, 0.3569002, 1, 0, 0, 1, 1,
-1.039586, 1.997496, -0.4005332, 1, 0, 0, 1, 1,
-1.033629, 0.4818391, -0.8242405, 1, 0, 0, 1, 1,
-1.027874, -0.9389344, -0.8499752, 1, 0, 0, 1, 1,
-1.022701, 0.6483439, -1.086526, 1, 0, 0, 1, 1,
-1.019559, 0.6473239, -0.5353234, 0, 0, 0, 1, 1,
-1.017472, -0.7387195, -1.732703, 0, 0, 0, 1, 1,
-1.001823, 0.6326938, -0.6270623, 0, 0, 0, 1, 1,
-0.9970631, -0.7585207, -3.003585, 0, 0, 0, 1, 1,
-0.9965202, 0.756465, -1.506405, 0, 0, 0, 1, 1,
-0.9957076, -0.2475394, -3.220904, 0, 0, 0, 1, 1,
-0.9905104, -0.6640696, -1.083464, 0, 0, 0, 1, 1,
-0.9862323, -0.7083117, -2.367122, 1, 1, 1, 1, 1,
-0.9829333, 0.2087425, -1.890678, 1, 1, 1, 1, 1,
-0.9712225, -0.5016118, -0.6448378, 1, 1, 1, 1, 1,
-0.970518, 0.2181047, -2.074167, 1, 1, 1, 1, 1,
-0.9703121, -1.127131, -4.142205, 1, 1, 1, 1, 1,
-0.9699731, -0.3536787, -1.660375, 1, 1, 1, 1, 1,
-0.9578835, -0.43906, -1.288857, 1, 1, 1, 1, 1,
-0.9561951, -1.234196, -4.04635, 1, 1, 1, 1, 1,
-0.9513658, 0.8036155, -1.585486, 1, 1, 1, 1, 1,
-0.9491467, -1.076537, -2.455921, 1, 1, 1, 1, 1,
-0.9486588, 1.350149, -0.3512631, 1, 1, 1, 1, 1,
-0.9442816, 1.248344, -2.532533, 1, 1, 1, 1, 1,
-0.9427906, -0.4702556, -0.2837405, 1, 1, 1, 1, 1,
-0.9262483, 1.445196, -1.87687, 1, 1, 1, 1, 1,
-0.9160978, 0.3580975, -3.200121, 1, 1, 1, 1, 1,
-0.914855, -1.369462, -2.645286, 0, 0, 1, 1, 1,
-0.9132549, -0.552282, -3.132072, 1, 0, 0, 1, 1,
-0.9110266, 0.2169415, -0.04740195, 1, 0, 0, 1, 1,
-0.9045111, 0.4118656, -2.203446, 1, 0, 0, 1, 1,
-0.9008678, -0.2220665, -1.969249, 1, 0, 0, 1, 1,
-0.8964912, -1.149217, -0.6689399, 1, 0, 0, 1, 1,
-0.8803248, 0.1440919, -2.019114, 0, 0, 0, 1, 1,
-0.8789912, 1.366474, -1.617083, 0, 0, 0, 1, 1,
-0.8783059, 0.7669234, -1.119649, 0, 0, 0, 1, 1,
-0.8777094, 1.325224, -0.7855229, 0, 0, 0, 1, 1,
-0.8732008, -0.3825354, -1.531445, 0, 0, 0, 1, 1,
-0.8682473, 0.8074713, -0.6628985, 0, 0, 0, 1, 1,
-0.8679546, -0.1324872, -2.314555, 0, 0, 0, 1, 1,
-0.8673782, -0.4300078, -0.6969189, 1, 1, 1, 1, 1,
-0.8614521, 1.341261, -0.1675087, 1, 1, 1, 1, 1,
-0.8613255, 0.7780495, -2.411294, 1, 1, 1, 1, 1,
-0.8575486, 0.1360299, -1.91596, 1, 1, 1, 1, 1,
-0.856042, 0.91752, 0.8142426, 1, 1, 1, 1, 1,
-0.8550265, 0.8338287, -1.256202, 1, 1, 1, 1, 1,
-0.8535979, -0.2033733, -0.9963099, 1, 1, 1, 1, 1,
-0.852041, 2.201087, -0.3407731, 1, 1, 1, 1, 1,
-0.8460296, 0.1068721, -4.304207, 1, 1, 1, 1, 1,
-0.8431913, -0.6266688, -2.865129, 1, 1, 1, 1, 1,
-0.8417398, -0.6824392, -2.783234, 1, 1, 1, 1, 1,
-0.8375434, -0.03642417, -1.557525, 1, 1, 1, 1, 1,
-0.8359204, 1.40195, 0.07154228, 1, 1, 1, 1, 1,
-0.8356404, 0.8426741, -1.338738, 1, 1, 1, 1, 1,
-0.8345938, -0.1018457, -1.292267, 1, 1, 1, 1, 1,
-0.827666, 0.3176327, -1.232118, 0, 0, 1, 1, 1,
-0.8262514, -0.4372371, -1.321032, 1, 0, 0, 1, 1,
-0.8183744, -0.658683, -2.254069, 1, 0, 0, 1, 1,
-0.8113992, -0.2335179, -1.944437, 1, 0, 0, 1, 1,
-0.8102266, -0.1822151, -3.88091, 1, 0, 0, 1, 1,
-0.8099377, -1.037151, -3.017504, 1, 0, 0, 1, 1,
-0.8082335, 0.5744959, -0.7654181, 0, 0, 0, 1, 1,
-0.8074586, -0.1673998, -2.259742, 0, 0, 0, 1, 1,
-0.8032771, 0.417633, -0.5205033, 0, 0, 0, 1, 1,
-0.8008991, 0.1261392, -1.473133, 0, 0, 0, 1, 1,
-0.7969891, -0.1288457, -0.4799443, 0, 0, 0, 1, 1,
-0.7966326, 1.220985, -0.7975385, 0, 0, 0, 1, 1,
-0.7965258, 0.8308476, -0.8775255, 0, 0, 0, 1, 1,
-0.7961389, 1.41329, -1.347086, 1, 1, 1, 1, 1,
-0.7832246, -0.9773427, -2.041204, 1, 1, 1, 1, 1,
-0.7752321, 0.4764323, 0.8299584, 1, 1, 1, 1, 1,
-0.7657712, 0.3232181, -1.407253, 1, 1, 1, 1, 1,
-0.7598459, -0.08021837, -0.5309462, 1, 1, 1, 1, 1,
-0.7596802, -0.1817315, -4.032389, 1, 1, 1, 1, 1,
-0.7558092, -1.477409, -2.158798, 1, 1, 1, 1, 1,
-0.7412333, 0.1968648, -0.7867451, 1, 1, 1, 1, 1,
-0.7378273, 0.6164742, -0.5765963, 1, 1, 1, 1, 1,
-0.7345197, -2.209894, -2.212758, 1, 1, 1, 1, 1,
-0.7317556, -0.5135677, -1.75124, 1, 1, 1, 1, 1,
-0.7244933, 2.132537, -1.043802, 1, 1, 1, 1, 1,
-0.7233538, -1.082369, -2.086754, 1, 1, 1, 1, 1,
-0.7202585, -0.8407614, -3.447649, 1, 1, 1, 1, 1,
-0.7177266, 1.507628, -0.6313385, 1, 1, 1, 1, 1,
-0.7121411, 1.246781, -2.480402, 0, 0, 1, 1, 1,
-0.7080415, -1.092071, -3.819375, 1, 0, 0, 1, 1,
-0.7059293, -0.9510067, -1.641705, 1, 0, 0, 1, 1,
-0.705564, -0.62938, -1.655234, 1, 0, 0, 1, 1,
-0.7010453, -0.4086904, -0.9363261, 1, 0, 0, 1, 1,
-0.696641, 0.1130921, 0.1439147, 1, 0, 0, 1, 1,
-0.6960412, -0.1325233, -2.966878, 0, 0, 0, 1, 1,
-0.6932794, -0.6879225, -3.421835, 0, 0, 0, 1, 1,
-0.6887577, -0.8851648, -2.474433, 0, 0, 0, 1, 1,
-0.688184, 0.07988504, -2.233242, 0, 0, 0, 1, 1,
-0.6859297, -0.7121849, -3.161114, 0, 0, 0, 1, 1,
-0.6859074, 0.5719261, -1.351987, 0, 0, 0, 1, 1,
-0.6804868, 0.6855575, -0.2729412, 0, 0, 0, 1, 1,
-0.6730784, 0.5353706, -2.485383, 1, 1, 1, 1, 1,
-0.6696277, 0.5580072, -1.04614, 1, 1, 1, 1, 1,
-0.6608695, -0.1274728, -1.845972, 1, 1, 1, 1, 1,
-0.6590114, -0.4062443, -2.699422, 1, 1, 1, 1, 1,
-0.658523, 0.1373947, -1.55749, 1, 1, 1, 1, 1,
-0.6583744, -0.4079926, -2.315595, 1, 1, 1, 1, 1,
-0.6573768, 1.053899, -0.06075656, 1, 1, 1, 1, 1,
-0.6552871, 1.317868, -1.278372, 1, 1, 1, 1, 1,
-0.6521708, 1.521369, -1.084776, 1, 1, 1, 1, 1,
-0.6453903, -0.8405896, -1.701483, 1, 1, 1, 1, 1,
-0.6427702, 0.3194493, -1.661809, 1, 1, 1, 1, 1,
-0.6328623, -0.7270284, -1.455581, 1, 1, 1, 1, 1,
-0.6299654, 0.8399024, 1.230351, 1, 1, 1, 1, 1,
-0.625905, -1.701422, -3.716958, 1, 1, 1, 1, 1,
-0.6228542, -0.4960442, -1.974545, 1, 1, 1, 1, 1,
-0.62213, 1.484982, -0.2062691, 0, 0, 1, 1, 1,
-0.6209921, -1.103804, -1.071394, 1, 0, 0, 1, 1,
-0.6170545, 1.51188, 0.4394285, 1, 0, 0, 1, 1,
-0.6166418, -0.3139932, -2.878429, 1, 0, 0, 1, 1,
-0.6163377, -0.7594932, -3.678846, 1, 0, 0, 1, 1,
-0.616317, 0.01817393, -1.504565, 1, 0, 0, 1, 1,
-0.6130415, -0.6432968, -1.752128, 0, 0, 0, 1, 1,
-0.6099367, -1.400823, -0.6833031, 0, 0, 0, 1, 1,
-0.6045038, 0.3183464, -1.903023, 0, 0, 0, 1, 1,
-0.6029848, 0.5835833, -1.206719, 0, 0, 0, 1, 1,
-0.5968179, -2.313746, -3.379159, 0, 0, 0, 1, 1,
-0.5960352, -0.5464119, -1.438923, 0, 0, 0, 1, 1,
-0.5936188, -1.259586, -2.357894, 0, 0, 0, 1, 1,
-0.58734, -1.269776, -2.750219, 1, 1, 1, 1, 1,
-0.5845547, -0.9016351, -1.427509, 1, 1, 1, 1, 1,
-0.5828815, -0.9951221, -2.391575, 1, 1, 1, 1, 1,
-0.5817168, 0.8323223, -1.51351, 1, 1, 1, 1, 1,
-0.5779138, 0.1941698, -2.705963, 1, 1, 1, 1, 1,
-0.5777631, -0.3027641, -2.730075, 1, 1, 1, 1, 1,
-0.5768162, -0.3087798, -2.72564, 1, 1, 1, 1, 1,
-0.5717883, 0.1192298, -2.542565, 1, 1, 1, 1, 1,
-0.570317, 1.206288, -0.8337604, 1, 1, 1, 1, 1,
-0.5698313, 0.6761944, -1.799274, 1, 1, 1, 1, 1,
-0.5676277, 0.01602358, -1.202804, 1, 1, 1, 1, 1,
-0.5673743, 1.353978, 0.9398167, 1, 1, 1, 1, 1,
-0.5630081, -1.19953, -1.661325, 1, 1, 1, 1, 1,
-0.5605662, 0.07396889, -0.6500793, 1, 1, 1, 1, 1,
-0.5555037, 0.4085447, -0.7390822, 1, 1, 1, 1, 1,
-0.5540076, -0.3658102, -3.577478, 0, 0, 1, 1, 1,
-0.5539898, 0.3039235, -2.428298, 1, 0, 0, 1, 1,
-0.55356, -0.364304, -2.029253, 1, 0, 0, 1, 1,
-0.5526941, -1.148348, -3.803618, 1, 0, 0, 1, 1,
-0.5513489, 0.525804, -2.036188, 1, 0, 0, 1, 1,
-0.550899, 0.02478972, -0.2093114, 1, 0, 0, 1, 1,
-0.550276, 0.3362738, -1.847328, 0, 0, 0, 1, 1,
-0.5486535, 1.54968, 0.5313089, 0, 0, 0, 1, 1,
-0.5444015, 1.483325, 0.7387187, 0, 0, 0, 1, 1,
-0.5425839, -0.08156418, -1.133876, 0, 0, 0, 1, 1,
-0.533471, -1.659607, -2.629145, 0, 0, 0, 1, 1,
-0.5252414, 0.9751536, -0.3921525, 0, 0, 0, 1, 1,
-0.5233809, -3.630955, -2.357463, 0, 0, 0, 1, 1,
-0.5191956, -0.8996509, -1.154444, 1, 1, 1, 1, 1,
-0.5161506, -1.401222, -4.238492, 1, 1, 1, 1, 1,
-0.5146442, -0.2502648, -2.958501, 1, 1, 1, 1, 1,
-0.5138631, -0.1892612, -2.488829, 1, 1, 1, 1, 1,
-0.5121462, 0.4263407, -2.658894, 1, 1, 1, 1, 1,
-0.5121342, 0.7909684, -0.4676009, 1, 1, 1, 1, 1,
-0.5120255, -1.352361, -1.982729, 1, 1, 1, 1, 1,
-0.5110487, -0.206799, -1.749492, 1, 1, 1, 1, 1,
-0.5058638, 1.389457, 0.6103719, 1, 1, 1, 1, 1,
-0.4977668, -1.027844, -1.332808, 1, 1, 1, 1, 1,
-0.4966792, -0.9541397, -0.6233667, 1, 1, 1, 1, 1,
-0.4951869, 0.3048845, 0.02888534, 1, 1, 1, 1, 1,
-0.4924985, -0.4690055, -2.589659, 1, 1, 1, 1, 1,
-0.4912817, -1.483299, -3.259971, 1, 1, 1, 1, 1,
-0.4889164, 1.217146, 0.8623126, 1, 1, 1, 1, 1,
-0.4881483, 1.191687, 0.1896368, 0, 0, 1, 1, 1,
-0.4869081, -1.333387, -2.356041, 1, 0, 0, 1, 1,
-0.484753, 0.151624, -1.987998, 1, 0, 0, 1, 1,
-0.4845232, -1.01223, -1.602181, 1, 0, 0, 1, 1,
-0.4722946, -0.3375325, -2.72864, 1, 0, 0, 1, 1,
-0.4704496, 1.549797, 0.5968718, 1, 0, 0, 1, 1,
-0.4694365, -1.349679, -2.612822, 0, 0, 0, 1, 1,
-0.4685131, 0.4001383, -0.4239435, 0, 0, 0, 1, 1,
-0.4644341, -0.1012167, -0.6198553, 0, 0, 0, 1, 1,
-0.4639779, -1.146554, -2.454065, 0, 0, 0, 1, 1,
-0.4585035, -0.5138746, -4.15036, 0, 0, 0, 1, 1,
-0.4575737, -0.9166387, -1.898656, 0, 0, 0, 1, 1,
-0.4547968, -0.8067339, -1.390545, 0, 0, 0, 1, 1,
-0.4467572, -1.183136, -2.383549, 1, 1, 1, 1, 1,
-0.4465281, 0.7977841, 0.07220467, 1, 1, 1, 1, 1,
-0.4393451, 1.086173, -0.6575704, 1, 1, 1, 1, 1,
-0.4291562, 0.5038478, -1.263396, 1, 1, 1, 1, 1,
-0.4268152, 1.696102, 1.40519, 1, 1, 1, 1, 1,
-0.4258176, -0.5540497, -2.061565, 1, 1, 1, 1, 1,
-0.4233474, -0.3501609, 0.2217005, 1, 1, 1, 1, 1,
-0.4233019, -1.44597, -1.516266, 1, 1, 1, 1, 1,
-0.4118079, 0.2982831, 0.1475389, 1, 1, 1, 1, 1,
-0.4117915, -0.007094266, -1.554064, 1, 1, 1, 1, 1,
-0.4084143, 0.279588, -0.7763746, 1, 1, 1, 1, 1,
-0.4055294, -0.4847243, -0.4753686, 1, 1, 1, 1, 1,
-0.4036651, -0.1465604, -3.060349, 1, 1, 1, 1, 1,
-0.393209, 0.517276, -0.05653934, 1, 1, 1, 1, 1,
-0.3917503, -0.1338387, -3.10355, 1, 1, 1, 1, 1,
-0.3910336, 2.118061, -0.1510142, 0, 0, 1, 1, 1,
-0.3889108, 1.635796, 1.20884, 1, 0, 0, 1, 1,
-0.3885519, -0.6906243, -5.631855, 1, 0, 0, 1, 1,
-0.3846716, -1.38746, -2.139373, 1, 0, 0, 1, 1,
-0.3804627, -0.4484581, -3.121828, 1, 0, 0, 1, 1,
-0.3761593, 1.334829, 0.1377343, 1, 0, 0, 1, 1,
-0.3742823, -0.2808483, -2.294878, 0, 0, 0, 1, 1,
-0.3729207, -0.6571853, -1.963383, 0, 0, 0, 1, 1,
-0.3720768, -0.7668517, -2.676712, 0, 0, 0, 1, 1,
-0.3719895, -1.310527, -3.37993, 0, 0, 0, 1, 1,
-0.3702777, -2.030977, -3.156352, 0, 0, 0, 1, 1,
-0.3625762, -1.023387, -3.537191, 0, 0, 0, 1, 1,
-0.3576412, 0.8904949, 0.437483, 0, 0, 0, 1, 1,
-0.3561396, 0.6901067, -0.6518895, 1, 1, 1, 1, 1,
-0.3538439, -0.7477579, -3.738565, 1, 1, 1, 1, 1,
-0.3430272, 0.7681642, -2.060965, 1, 1, 1, 1, 1,
-0.3370196, -1.637667, -4.794963, 1, 1, 1, 1, 1,
-0.3364702, 0.9389091, 1.220965, 1, 1, 1, 1, 1,
-0.3352649, 1.916843, -0.3221874, 1, 1, 1, 1, 1,
-0.3332451, 1.951979, -1.43923, 1, 1, 1, 1, 1,
-0.3321607, 1.324288, -2.182272, 1, 1, 1, 1, 1,
-0.3316696, 0.5483313, 1.034681, 1, 1, 1, 1, 1,
-0.3295381, 0.6420198, -0.4114923, 1, 1, 1, 1, 1,
-0.3288138, -2.15012, -0.783203, 1, 1, 1, 1, 1,
-0.3221751, 2.022121, -1.03916, 1, 1, 1, 1, 1,
-0.318405, -1.681671, -1.838892, 1, 1, 1, 1, 1,
-0.3170198, -0.5366949, -3.695653, 1, 1, 1, 1, 1,
-0.3164356, -1.232455, -3.37817, 1, 1, 1, 1, 1,
-0.3160354, 0.1887745, -1.264394, 0, 0, 1, 1, 1,
-0.3156531, 1.72878, -0.8644351, 1, 0, 0, 1, 1,
-0.3141593, -0.0161659, -1.553686, 1, 0, 0, 1, 1,
-0.310795, 0.1987013, 0.08982208, 1, 0, 0, 1, 1,
-0.3084647, 0.07503696, -1.760952, 1, 0, 0, 1, 1,
-0.3053227, -1.733941, -5.082973, 1, 0, 0, 1, 1,
-0.3034754, -1.563875, -1.245247, 0, 0, 0, 1, 1,
-0.301895, 1.795766, -0.09153011, 0, 0, 0, 1, 1,
-0.3012314, 0.9455944, -0.8388554, 0, 0, 0, 1, 1,
-0.3007176, 0.3385039, -0.736391, 0, 0, 0, 1, 1,
-0.2922263, 0.47555, -2.738718, 0, 0, 0, 1, 1,
-0.290247, 1.083038, -0.2233767, 0, 0, 0, 1, 1,
-0.2817582, -1.92923, -1.993311, 0, 0, 0, 1, 1,
-0.2791086, 0.3774558, 0.3301322, 1, 1, 1, 1, 1,
-0.2719935, -1.082017, -4.874068, 1, 1, 1, 1, 1,
-0.2703172, 0.7036663, -1.557581, 1, 1, 1, 1, 1,
-0.2697234, -0.6737887, -0.5453269, 1, 1, 1, 1, 1,
-0.267745, 1.547891, 0.05006953, 1, 1, 1, 1, 1,
-0.2645748, 0.7451385, -0.3502159, 1, 1, 1, 1, 1,
-0.2630956, 0.008236305, -2.673161, 1, 1, 1, 1, 1,
-0.262962, 1.064652, 1.044465, 1, 1, 1, 1, 1,
-0.2590333, -0.1038001, -1.353248, 1, 1, 1, 1, 1,
-0.2569399, 0.7131096, -2.220778, 1, 1, 1, 1, 1,
-0.2565294, -0.1173908, -2.859998, 1, 1, 1, 1, 1,
-0.2554484, -0.8320479, -1.377279, 1, 1, 1, 1, 1,
-0.255255, -0.1898894, -3.107422, 1, 1, 1, 1, 1,
-0.253345, 1.932595, -1.225347, 1, 1, 1, 1, 1,
-0.2527731, 0.6544359, 0.4695377, 1, 1, 1, 1, 1,
-0.252713, 1.516819, -0.9861206, 0, 0, 1, 1, 1,
-0.252045, 1.304048, 0.2040938, 1, 0, 0, 1, 1,
-0.2464481, 1.822314, 0.6850378, 1, 0, 0, 1, 1,
-0.2443209, 0.1982454, -0.6443651, 1, 0, 0, 1, 1,
-0.238336, 0.8183206, 0.2047481, 1, 0, 0, 1, 1,
-0.232801, -0.4736616, -3.918661, 1, 0, 0, 1, 1,
-0.2293714, 0.01976957, -0.784796, 0, 0, 0, 1, 1,
-0.2260528, 0.9029909, -1.237586, 0, 0, 0, 1, 1,
-0.2243482, 0.2164836, -0.4092039, 0, 0, 0, 1, 1,
-0.2182955, 0.114071, 1.042286, 0, 0, 0, 1, 1,
-0.2164806, 1.186992, -1.176714, 0, 0, 0, 1, 1,
-0.216276, -1.088898, -4.677481, 0, 0, 0, 1, 1,
-0.2093578, 0.3127351, -3.691089, 0, 0, 0, 1, 1,
-0.2081826, -2.137122, -2.223531, 1, 1, 1, 1, 1,
-0.2078936, 1.609685, -0.8965216, 1, 1, 1, 1, 1,
-0.2019804, 1.266319, -0.4554464, 1, 1, 1, 1, 1,
-0.2013004, 1.738725, -0.1285832, 1, 1, 1, 1, 1,
-0.200956, -1.32269, -3.208862, 1, 1, 1, 1, 1,
-0.1926023, -0.1160883, -1.186765, 1, 1, 1, 1, 1,
-0.1922838, 0.06583422, -1.060909, 1, 1, 1, 1, 1,
-0.185271, -0.2494656, -2.458811, 1, 1, 1, 1, 1,
-0.1823224, 0.1573023, -0.09987714, 1, 1, 1, 1, 1,
-0.1805461, 0.3055662, -1.660878, 1, 1, 1, 1, 1,
-0.1710531, -1.097289, -3.30293, 1, 1, 1, 1, 1,
-0.1656879, 0.2665702, -1.259791, 1, 1, 1, 1, 1,
-0.1633828, -0.5358125, -2.06961, 1, 1, 1, 1, 1,
-0.1585633, -1.261879, -3.165313, 1, 1, 1, 1, 1,
-0.1574027, 0.3012431, 0.4148841, 1, 1, 1, 1, 1,
-0.156896, -0.2396877, -2.972586, 0, 0, 1, 1, 1,
-0.1517101, 0.6829206, 1.722465, 1, 0, 0, 1, 1,
-0.1436372, 1.218761, -0.6934444, 1, 0, 0, 1, 1,
-0.1419259, 1.958081, 0.2452458, 1, 0, 0, 1, 1,
-0.1414469, -0.7373155, -2.345279, 1, 0, 0, 1, 1,
-0.1404622, -0.4963636, -2.480649, 1, 0, 0, 1, 1,
-0.1397835, -1.194119, -1.981595, 0, 0, 0, 1, 1,
-0.1392783, -0.5170764, -2.667373, 0, 0, 0, 1, 1,
-0.139171, -0.1192295, -3.149381, 0, 0, 0, 1, 1,
-0.1388864, 0.1246809, -1.382698, 0, 0, 0, 1, 1,
-0.1363511, -1.331374, -1.163677, 0, 0, 0, 1, 1,
-0.1342017, 1.581463, -0.6711719, 0, 0, 0, 1, 1,
-0.1324951, 1.085861, 0.259857, 0, 0, 0, 1, 1,
-0.1181361, -0.6013612, -2.244287, 1, 1, 1, 1, 1,
-0.1155753, 0.6908706, -0.6837696, 1, 1, 1, 1, 1,
-0.1129941, -0.02713644, -1.816135, 1, 1, 1, 1, 1,
-0.1125322, -1.066035, -2.164224, 1, 1, 1, 1, 1,
-0.1048798, -0.6815155, -3.043945, 1, 1, 1, 1, 1,
-0.102377, 0.3777818, 0.1550551, 1, 1, 1, 1, 1,
-0.101061, -0.6549689, -4.787336, 1, 1, 1, 1, 1,
-0.09996729, 0.06181181, 0.4039153, 1, 1, 1, 1, 1,
-0.09563009, 1.324124, -0.6823071, 1, 1, 1, 1, 1,
-0.09532482, -0.6151835, -3.178907, 1, 1, 1, 1, 1,
-0.09502789, -0.01482945, -1.961314, 1, 1, 1, 1, 1,
-0.09464513, 0.5518998, 1.584673, 1, 1, 1, 1, 1,
-0.0931835, -1.543308, -2.189995, 1, 1, 1, 1, 1,
-0.09116244, -0.9079129, -3.875108, 1, 1, 1, 1, 1,
-0.08820847, 0.8483468, 0.2879311, 1, 1, 1, 1, 1,
-0.08807983, 0.7646498, 2.051881, 0, 0, 1, 1, 1,
-0.08806563, 2.476666, 0.6817429, 1, 0, 0, 1, 1,
-0.08638842, -0.2891364, -4.068994, 1, 0, 0, 1, 1,
-0.08572664, -0.2006904, -3.442709, 1, 0, 0, 1, 1,
-0.07229815, -1.742288, -2.463366, 1, 0, 0, 1, 1,
-0.07015093, 1.122876, 0.308895, 1, 0, 0, 1, 1,
-0.07011349, 2.159687, 0.1179321, 0, 0, 0, 1, 1,
-0.06900394, -0.3614298, -1.85518, 0, 0, 0, 1, 1,
-0.06624992, 1.812248, -2.199319, 0, 0, 0, 1, 1,
-0.06354724, -0.6716538, -2.304346, 0, 0, 0, 1, 1,
-0.0615255, 0.3585964, 1.848155, 0, 0, 0, 1, 1,
-0.05486964, -1.195615, -2.497617, 0, 0, 0, 1, 1,
-0.05377569, 1.016685, -0.4336052, 0, 0, 0, 1, 1,
-0.04768776, 0.3848451, -0.7361911, 1, 1, 1, 1, 1,
-0.04724594, 0.5509211, 0.1220612, 1, 1, 1, 1, 1,
-0.04313444, 0.4135646, 0.2761162, 1, 1, 1, 1, 1,
-0.03779621, 0.6065956, -0.1118415, 1, 1, 1, 1, 1,
-0.03638829, 1.044032, -2.303782, 1, 1, 1, 1, 1,
-0.03426572, -0.9494152, -2.040339, 1, 1, 1, 1, 1,
-0.03327602, -0.6958948, -2.488059, 1, 1, 1, 1, 1,
-0.03126962, 0.2413247, 1.629114, 1, 1, 1, 1, 1,
-0.03062395, -0.5062706, -4.715549, 1, 1, 1, 1, 1,
-0.02585398, -0.03858675, -1.747658, 1, 1, 1, 1, 1,
-0.0232235, 2.577448, -0.9149562, 1, 1, 1, 1, 1,
-0.02276887, 0.3864736, 0.101543, 1, 1, 1, 1, 1,
-0.007515949, 0.1740948, 2.080514, 1, 1, 1, 1, 1,
-0.00036559, 0.3763806, 0.1592074, 1, 1, 1, 1, 1,
-0.0001584441, 0.1375061, 0.9617138, 1, 1, 1, 1, 1,
-2.648614e-05, 1.296035, 0.4960481, 0, 0, 1, 1, 1,
0.0003040951, -1.035045, 3.182196, 1, 0, 0, 1, 1,
0.002478565, 0.1902588, -1.288599, 1, 0, 0, 1, 1,
0.01192438, 0.8637236, 0.5863822, 1, 0, 0, 1, 1,
0.01241574, 1.31427, 0.6435432, 1, 0, 0, 1, 1,
0.01251112, 1.567768, -1.819819, 1, 0, 0, 1, 1,
0.0131904, 0.07376316, 0.6769044, 0, 0, 0, 1, 1,
0.01328035, -0.380061, 2.732439, 0, 0, 0, 1, 1,
0.01433049, 1.544171, 0.1724488, 0, 0, 0, 1, 1,
0.01742316, -0.6459608, 2.110604, 0, 0, 0, 1, 1,
0.02800718, 0.02545329, 1.036521, 0, 0, 0, 1, 1,
0.02828456, 1.294815, 0.09782278, 0, 0, 0, 1, 1,
0.02879339, 0.4392533, -0.3016866, 0, 0, 0, 1, 1,
0.03613873, -0.5642917, 3.496648, 1, 1, 1, 1, 1,
0.03682733, 1.192594, -2.358914, 1, 1, 1, 1, 1,
0.03780597, -1.147909, 3.688938, 1, 1, 1, 1, 1,
0.0419458, 0.03582652, -1.542326, 1, 1, 1, 1, 1,
0.0472711, 0.9110212, 1.176307, 1, 1, 1, 1, 1,
0.04758505, -0.3170023, 4.430656, 1, 1, 1, 1, 1,
0.04808307, 0.3723229, -0.8899749, 1, 1, 1, 1, 1,
0.04809669, 0.15267, 0.5967593, 1, 1, 1, 1, 1,
0.05074986, -0.9979744, 2.297442, 1, 1, 1, 1, 1,
0.05273866, -1.136614, 2.934905, 1, 1, 1, 1, 1,
0.06888796, 0.3341132, -0.660064, 1, 1, 1, 1, 1,
0.06944563, -1.80438, 3.636381, 1, 1, 1, 1, 1,
0.07077046, 1.762788, 0.1486356, 1, 1, 1, 1, 1,
0.07406579, 1.302355, -0.5827888, 1, 1, 1, 1, 1,
0.07528926, 0.696689, 1.288576, 1, 1, 1, 1, 1,
0.07692458, 0.2501013, 1.565636, 0, 0, 1, 1, 1,
0.08741957, -2.069586, 2.744644, 1, 0, 0, 1, 1,
0.08831976, 0.9036471, -0.03834539, 1, 0, 0, 1, 1,
0.09317631, -1.15759, 3.469108, 1, 0, 0, 1, 1,
0.09477546, -1.450102, 1.862707, 1, 0, 0, 1, 1,
0.09663071, 0.8354834, -1.101739, 1, 0, 0, 1, 1,
0.09829797, 0.7622099, -0.5112262, 0, 0, 0, 1, 1,
0.1041751, 0.1233621, 0.02970891, 0, 0, 0, 1, 1,
0.1058194, 0.8124486, -0.1453396, 0, 0, 0, 1, 1,
0.1060791, -0.5696247, 3.027704, 0, 0, 0, 1, 1,
0.1109885, 1.130164, 0.1652253, 0, 0, 0, 1, 1,
0.112767, -0.9713302, 2.081025, 0, 0, 0, 1, 1,
0.1175167, 0.2233219, -0.9575171, 0, 0, 0, 1, 1,
0.119331, -2.029789, 4.196317, 1, 1, 1, 1, 1,
0.1205336, -1.801107, 5.355931, 1, 1, 1, 1, 1,
0.121825, 0.5313622, -1.25257, 1, 1, 1, 1, 1,
0.1235562, -0.4261553, 3.078243, 1, 1, 1, 1, 1,
0.1258221, 0.1984081, 0.81455, 1, 1, 1, 1, 1,
0.1274684, -0.8699967, 3.666597, 1, 1, 1, 1, 1,
0.1280773, 3.463866, 0.230195, 1, 1, 1, 1, 1,
0.1301022, 1.026734, -1.105402, 1, 1, 1, 1, 1,
0.1311483, -0.003716744, 2.186784, 1, 1, 1, 1, 1,
0.1313758, 0.3625324, 0.2669633, 1, 1, 1, 1, 1,
0.133605, -0.4367519, 3.617137, 1, 1, 1, 1, 1,
0.1367322, 2.430702, 1.397888, 1, 1, 1, 1, 1,
0.1396421, -1.100531, 3.505141, 1, 1, 1, 1, 1,
0.1430652, 1.569976, 0.1461053, 1, 1, 1, 1, 1,
0.1453105, -1.954703, 0.9498937, 1, 1, 1, 1, 1,
0.1486279, -0.4425885, 3.246619, 0, 0, 1, 1, 1,
0.1524045, 2.18293, -0.9110144, 1, 0, 0, 1, 1,
0.155805, -0.311687, 3.316292, 1, 0, 0, 1, 1,
0.1569149, -0.6209845, 1.156386, 1, 0, 0, 1, 1,
0.1640912, 1.110037, 1.018378, 1, 0, 0, 1, 1,
0.1671108, 1.641363, 0.6326588, 1, 0, 0, 1, 1,
0.169862, 0.3504915, 0.5181476, 0, 0, 0, 1, 1,
0.1701287, -1.536686, 3.668188, 0, 0, 0, 1, 1,
0.1737283, -0.5507496, 2.988176, 0, 0, 0, 1, 1,
0.1743727, 1.22096, -0.7749454, 0, 0, 0, 1, 1,
0.174607, -0.6028562, 4.277217, 0, 0, 0, 1, 1,
0.1755688, -1.257931, 3.794696, 0, 0, 0, 1, 1,
0.1785514, -0.3047219, 1.582874, 0, 0, 0, 1, 1,
0.1789663, -1.284839, 3.650389, 1, 1, 1, 1, 1,
0.179414, -1.754403, 2.837526, 1, 1, 1, 1, 1,
0.1807569, -0.4433152, 5.516169, 1, 1, 1, 1, 1,
0.1813862, -0.148849, 1.661853, 1, 1, 1, 1, 1,
0.1841689, 1.399582, 1.31448, 1, 1, 1, 1, 1,
0.1855982, 0.09462918, 2.597776, 1, 1, 1, 1, 1,
0.1918367, 0.1233431, 1.360536, 1, 1, 1, 1, 1,
0.1920475, -1.408818, 2.72811, 1, 1, 1, 1, 1,
0.1937269, -1.839133, 3.392187, 1, 1, 1, 1, 1,
0.1973648, 0.8833026, 1.359365, 1, 1, 1, 1, 1,
0.1993641, 0.5145719, -1.091555, 1, 1, 1, 1, 1,
0.2008756, -0.4750931, 3.143582, 1, 1, 1, 1, 1,
0.2016623, 0.8184971, -0.07828495, 1, 1, 1, 1, 1,
0.204337, 0.3969898, 0.02292135, 1, 1, 1, 1, 1,
0.2090085, 0.2771636, 0.7200813, 1, 1, 1, 1, 1,
0.2094762, 0.7371653, -0.916846, 0, 0, 1, 1, 1,
0.2098403, -0.1842461, 1.382405, 1, 0, 0, 1, 1,
0.2098533, 0.2971596, 0.2583909, 1, 0, 0, 1, 1,
0.2154019, -0.5524423, 3.957938, 1, 0, 0, 1, 1,
0.2159353, -1.699435, 3.616239, 1, 0, 0, 1, 1,
0.218094, 0.3562296, 0.129246, 1, 0, 0, 1, 1,
0.2190487, 0.7914156, -0.3343584, 0, 0, 0, 1, 1,
0.2204817, -0.2352612, 4.60239, 0, 0, 0, 1, 1,
0.2205374, -0.5309238, 1.385951, 0, 0, 0, 1, 1,
0.2218411, 1.275076, -0.2394308, 0, 0, 0, 1, 1,
0.223134, 0.6742237, 0.1548585, 0, 0, 0, 1, 1,
0.2343635, 0.03800989, 1.760175, 0, 0, 0, 1, 1,
0.2351059, 1.998979, 0.7452896, 0, 0, 0, 1, 1,
0.2369286, 0.02924293, 2.24383, 1, 1, 1, 1, 1,
0.2401329, -0.5649147, 5.434258, 1, 1, 1, 1, 1,
0.2402779, 0.6475495, 0.2595543, 1, 1, 1, 1, 1,
0.2428763, 0.6052331, -0.5575393, 1, 1, 1, 1, 1,
0.2432662, -0.292722, 3.090528, 1, 1, 1, 1, 1,
0.2449125, -0.1938042, 2.997277, 1, 1, 1, 1, 1,
0.2469661, -0.5021233, 2.747186, 1, 1, 1, 1, 1,
0.2543111, -0.4815817, 3.595145, 1, 1, 1, 1, 1,
0.2547806, 1.102105, 1.124442, 1, 1, 1, 1, 1,
0.2579738, -0.7266105, 2.350632, 1, 1, 1, 1, 1,
0.2584705, 0.6693149, 0.1104248, 1, 1, 1, 1, 1,
0.2592992, 2.5463, -0.5197122, 1, 1, 1, 1, 1,
0.2593982, -1.967111, 2.775722, 1, 1, 1, 1, 1,
0.2606183, 0.1770606, -0.3845381, 1, 1, 1, 1, 1,
0.2616048, -0.1784724, 1.088864, 1, 1, 1, 1, 1,
0.2643399, 0.05332574, 2.332669, 0, 0, 1, 1, 1,
0.2671725, -2.684241, 3.015466, 1, 0, 0, 1, 1,
0.2672854, -0.2524013, 2.596238, 1, 0, 0, 1, 1,
0.2697624, -1.71053, 3.160467, 1, 0, 0, 1, 1,
0.2718362, 1.224891, 0.8411074, 1, 0, 0, 1, 1,
0.2744103, 0.1518897, 1.583628, 1, 0, 0, 1, 1,
0.2750315, 0.4623697, -2.762552, 0, 0, 0, 1, 1,
0.2810643, -1.613749, 3.490446, 0, 0, 0, 1, 1,
0.282888, 1.065966, -1.424071, 0, 0, 0, 1, 1,
0.2916353, 1.802876, 1.78896, 0, 0, 0, 1, 1,
0.3026046, -0.8986157, 2.14322, 0, 0, 0, 1, 1,
0.3036366, -0.2744991, 1.491543, 0, 0, 0, 1, 1,
0.3044325, 0.8342117, 0.3821668, 0, 0, 0, 1, 1,
0.3075653, -1.01856, 4.009084, 1, 1, 1, 1, 1,
0.3112163, -0.2922859, 2.476318, 1, 1, 1, 1, 1,
0.3121198, 1.960611, 1.379828, 1, 1, 1, 1, 1,
0.312375, 0.08190276, 3.243912, 1, 1, 1, 1, 1,
0.3127973, 2.461689, -1.069974, 1, 1, 1, 1, 1,
0.3164564, 0.1563162, 1.185096, 1, 1, 1, 1, 1,
0.3187798, -1.742929, 3.632172, 1, 1, 1, 1, 1,
0.3277579, -0.2026126, 1.908659, 1, 1, 1, 1, 1,
0.3294062, -0.04070739, 1.346245, 1, 1, 1, 1, 1,
0.3296126, -1.12148, 2.983329, 1, 1, 1, 1, 1,
0.3296624, 1.009454, 0.6601042, 1, 1, 1, 1, 1,
0.3298943, 1.47704, 0.306226, 1, 1, 1, 1, 1,
0.3300069, 2.068081, -0.3840752, 1, 1, 1, 1, 1,
0.3301212, 0.4818769, 2.645686, 1, 1, 1, 1, 1,
0.3330576, -0.4359773, 2.077193, 1, 1, 1, 1, 1,
0.3371532, -0.2529364, 1.526336, 0, 0, 1, 1, 1,
0.3388702, 0.4835244, 1.403405, 1, 0, 0, 1, 1,
0.3432817, -0.3052158, 3.089803, 1, 0, 0, 1, 1,
0.3459618, -1.490484, 2.473927, 1, 0, 0, 1, 1,
0.3464107, 0.1001552, 1.097659, 1, 0, 0, 1, 1,
0.3480377, 0.4961469, 1.198474, 1, 0, 0, 1, 1,
0.3480407, 2.471393, 0.4025159, 0, 0, 0, 1, 1,
0.3487056, -0.032702, 2.380083, 0, 0, 0, 1, 1,
0.3516461, 0.3612041, 1.273054, 0, 0, 0, 1, 1,
0.3523612, -0.3651143, 3.156952, 0, 0, 0, 1, 1,
0.3627845, 0.55748, -0.529671, 0, 0, 0, 1, 1,
0.3629309, -1.402868, 2.524267, 0, 0, 0, 1, 1,
0.3643999, -0.5695002, 2.299984, 0, 0, 0, 1, 1,
0.3683092, -0.8374945, 4.349952, 1, 1, 1, 1, 1,
0.3703895, 1.745632, 1.210304, 1, 1, 1, 1, 1,
0.3728815, 0.8541256, 0.7164059, 1, 1, 1, 1, 1,
0.3764547, -0.4582734, 1.870343, 1, 1, 1, 1, 1,
0.3768696, 0.3307391, 1.628783, 1, 1, 1, 1, 1,
0.3775765, 1.052451, -0.217575, 1, 1, 1, 1, 1,
0.3827095, 0.1503346, -0.09239979, 1, 1, 1, 1, 1,
0.3828931, 0.7841877, -0.1950967, 1, 1, 1, 1, 1,
0.3830104, 0.5023491, 1.23963, 1, 1, 1, 1, 1,
0.3835142, -0.685665, 1.285008, 1, 1, 1, 1, 1,
0.383808, -0.287124, 4.098355, 1, 1, 1, 1, 1,
0.3871988, -0.3853933, 2.96678, 1, 1, 1, 1, 1,
0.3901231, -0.1979946, 2.240516, 1, 1, 1, 1, 1,
0.3903475, -1.273326, 2.333291, 1, 1, 1, 1, 1,
0.3911336, 0.5862029, -0.3546703, 1, 1, 1, 1, 1,
0.3917954, 0.3299842, 1.633415, 0, 0, 1, 1, 1,
0.39771, -1.43175, 1.226755, 1, 0, 0, 1, 1,
0.4018479, 1.36787, 1.151942, 1, 0, 0, 1, 1,
0.4046375, 0.173174, 1.20772, 1, 0, 0, 1, 1,
0.4063561, -0.1418209, 1.449309, 1, 0, 0, 1, 1,
0.4071081, 0.4628512, 0.249617, 1, 0, 0, 1, 1,
0.4072369, 1.664533, 0.863378, 0, 0, 0, 1, 1,
0.4101558, 1.309656, 1.889394, 0, 0, 0, 1, 1,
0.4102959, 0.0872172, 1.020313, 0, 0, 0, 1, 1,
0.4117084, 0.3641922, 1.449582, 0, 0, 0, 1, 1,
0.4147401, 0.2804615, 0.8680376, 0, 0, 0, 1, 1,
0.4178618, 1.433799, 1.525364, 0, 0, 0, 1, 1,
0.4195263, 1.447151, 0.8651389, 0, 0, 0, 1, 1,
0.4212752, -1.244784, 3.396229, 1, 1, 1, 1, 1,
0.4233963, -0.8195838, 1.477638, 1, 1, 1, 1, 1,
0.4244858, 1.155927, 0.6143569, 1, 1, 1, 1, 1,
0.4244911, 1.048326, 0.8117785, 1, 1, 1, 1, 1,
0.4261922, 0.2991197, 2.121695, 1, 1, 1, 1, 1,
0.4272043, -0.7585016, 1.648674, 1, 1, 1, 1, 1,
0.4288661, 0.141445, -0.3381215, 1, 1, 1, 1, 1,
0.4304863, 0.7420238, 0.758084, 1, 1, 1, 1, 1,
0.4311422, -0.1718255, 4.206373, 1, 1, 1, 1, 1,
0.4329118, 1.956656, 2.155522, 1, 1, 1, 1, 1,
0.4359303, -0.2603437, 2.194859, 1, 1, 1, 1, 1,
0.4434281, 2.296514, -0.5080699, 1, 1, 1, 1, 1,
0.4444038, -0.1539487, 3.662496, 1, 1, 1, 1, 1,
0.4472766, -0.5928598, 1.085841, 1, 1, 1, 1, 1,
0.4476693, -1.390089, 2.73695, 1, 1, 1, 1, 1,
0.4518803, -1.047058, 1.841874, 0, 0, 1, 1, 1,
0.4554993, 0.01776609, 1.489585, 1, 0, 0, 1, 1,
0.4582906, 1.278553, 0.1192723, 1, 0, 0, 1, 1,
0.4625488, -0.2180315, 1.018047, 1, 0, 0, 1, 1,
0.4631868, 1.53757, -0.5623952, 1, 0, 0, 1, 1,
0.4686928, 1.816696, 0.2945528, 1, 0, 0, 1, 1,
0.4701844, 0.5070865, 0.7960914, 0, 0, 0, 1, 1,
0.4762265, -1.407042, 2.757419, 0, 0, 0, 1, 1,
0.4898131, -0.9911439, 3.531565, 0, 0, 0, 1, 1,
0.4917423, 1.562191, 0.06179418, 0, 0, 0, 1, 1,
0.4940276, -2.446921, 1.614673, 0, 0, 0, 1, 1,
0.4967714, 0.1715433, 1.670572, 0, 0, 0, 1, 1,
0.4970186, 0.8276181, -0.03936572, 0, 0, 0, 1, 1,
0.5001187, -1.54371, 1.812018, 1, 1, 1, 1, 1,
0.5063635, -0.1820188, 1.210498, 1, 1, 1, 1, 1,
0.5116064, 1.263903, 0.4611957, 1, 1, 1, 1, 1,
0.512414, -0.7239656, 2.467101, 1, 1, 1, 1, 1,
0.5145078, -0.2463373, 0.3354704, 1, 1, 1, 1, 1,
0.5210357, -0.6824582, 3.095073, 1, 1, 1, 1, 1,
0.5232734, -1.138358, 1.706116, 1, 1, 1, 1, 1,
0.523739, 0.3704943, 0.113204, 1, 1, 1, 1, 1,
0.5252183, 1.588814, 0.325308, 1, 1, 1, 1, 1,
0.5274398, 1.416063, -0.09803675, 1, 1, 1, 1, 1,
0.527593, 0.7244459, 0.01772802, 1, 1, 1, 1, 1,
0.5286169, -0.9295744, 0.2089254, 1, 1, 1, 1, 1,
0.5310948, -0.1186334, 0.4575861, 1, 1, 1, 1, 1,
0.5319426, -0.589698, 4.731979, 1, 1, 1, 1, 1,
0.5328516, 0.07134973, 2.416554, 1, 1, 1, 1, 1,
0.5486576, 1.026963, 0.2902364, 0, 0, 1, 1, 1,
0.550148, 0.9754387, 0.8261178, 1, 0, 0, 1, 1,
0.5522739, 0.77206, 1.789632, 1, 0, 0, 1, 1,
0.5573761, -2.056669, 2.336158, 1, 0, 0, 1, 1,
0.5588512, 0.3816963, 1.220083, 1, 0, 0, 1, 1,
0.5596642, -0.2440434, 1.240711, 1, 0, 0, 1, 1,
0.5598456, -0.8553652, 2.585922, 0, 0, 0, 1, 1,
0.5628912, 0.06948747, 1.564759, 0, 0, 0, 1, 1,
0.5649638, 0.1598158, 2.64925, 0, 0, 0, 1, 1,
0.5699274, 0.3318247, 1.659383, 0, 0, 0, 1, 1,
0.5714327, 0.3227437, 1.665088, 0, 0, 0, 1, 1,
0.5739151, -0.7296942, 2.35378, 0, 0, 0, 1, 1,
0.5742233, 0.1402305, 1.125936, 0, 0, 0, 1, 1,
0.5755574, 1.344392, 1.644342, 1, 1, 1, 1, 1,
0.5764307, 0.1532169, 2.076483, 1, 1, 1, 1, 1,
0.5788616, -1.570135, 3.349852, 1, 1, 1, 1, 1,
0.5809211, -0.741908, 1.518983, 1, 1, 1, 1, 1,
0.5815195, -1.031102, 5.118237, 1, 1, 1, 1, 1,
0.5929351, -1.208012, 3.752794, 1, 1, 1, 1, 1,
0.5978712, 0.002875635, 0.7553321, 1, 1, 1, 1, 1,
0.6045322, -1.023265, 2.729426, 1, 1, 1, 1, 1,
0.6079905, 1.078809, 2.473182, 1, 1, 1, 1, 1,
0.6084529, -0.0549057, -0.6826491, 1, 1, 1, 1, 1,
0.6092454, 1.224187, 1.248197, 1, 1, 1, 1, 1,
0.6129929, -1.12925, 1.052408, 1, 1, 1, 1, 1,
0.6131102, -0.8725791, 3.128476, 1, 1, 1, 1, 1,
0.6135573, -1.212467, 3.91669, 1, 1, 1, 1, 1,
0.6139489, 1.911837, 0.3665557, 1, 1, 1, 1, 1,
0.6269043, 0.469427, 2.101812, 0, 0, 1, 1, 1,
0.6285223, -0.1594095, 1.616239, 1, 0, 0, 1, 1,
0.6357962, -2.133441, 5.391026, 1, 0, 0, 1, 1,
0.6368162, 0.7823012, 1.005027, 1, 0, 0, 1, 1,
0.6370898, -1.157138, 2.907506, 1, 0, 0, 1, 1,
0.6375013, 0.8406435, -0.07812964, 1, 0, 0, 1, 1,
0.638002, -1.4986, 2.801502, 0, 0, 0, 1, 1,
0.6393741, -1.712236, 3.731911, 0, 0, 0, 1, 1,
0.6407442, 1.156184, -0.2948739, 0, 0, 0, 1, 1,
0.6427778, 0.5570782, 1.776553, 0, 0, 0, 1, 1,
0.6494306, -0.03203136, 1.547, 0, 0, 0, 1, 1,
0.6514171, -0.9620661, 1.39426, 0, 0, 0, 1, 1,
0.6519225, -0.225187, 0.9766765, 0, 0, 0, 1, 1,
0.6599582, 0.185809, 0.4972819, 1, 1, 1, 1, 1,
0.6635562, -0.2283335, 1.137441, 1, 1, 1, 1, 1,
0.6637015, 0.8624353, 2.084542, 1, 1, 1, 1, 1,
0.6651762, -2.187214, 3.299086, 1, 1, 1, 1, 1,
0.6734594, -0.8420967, 1.572906, 1, 1, 1, 1, 1,
0.6772667, 0.1618637, 0.994585, 1, 1, 1, 1, 1,
0.6830489, -0.2163962, 3.488662, 1, 1, 1, 1, 1,
0.691622, 0.9168263, 0.9019132, 1, 1, 1, 1, 1,
0.6930629, 0.6240298, -0.1515037, 1, 1, 1, 1, 1,
0.6937845, 0.4330861, 1.016295, 1, 1, 1, 1, 1,
0.6971005, 0.473981, 2.813006, 1, 1, 1, 1, 1,
0.6979852, -0.5736586, 1.343876, 1, 1, 1, 1, 1,
0.6981121, 0.50642, 0.2279303, 1, 1, 1, 1, 1,
0.7067362, -0.5635743, 3.130009, 1, 1, 1, 1, 1,
0.7072736, 1.453423, 0.2949906, 1, 1, 1, 1, 1,
0.707866, -1.529522, 2.291513, 0, 0, 1, 1, 1,
0.714757, 0.7124551, -0.1045643, 1, 0, 0, 1, 1,
0.7162629, 0.5956911, 1.699777, 1, 0, 0, 1, 1,
0.7171612, -0.0934174, 1.364789, 1, 0, 0, 1, 1,
0.719722, -0.979569, 3.258039, 1, 0, 0, 1, 1,
0.7225986, 0.6137605, 0.6562567, 1, 0, 0, 1, 1,
0.723371, -0.5944014, 1.308452, 0, 0, 0, 1, 1,
0.7244868, 1.943719, 0.9131926, 0, 0, 0, 1, 1,
0.7255775, 0.8267242, -0.9269927, 0, 0, 0, 1, 1,
0.7266189, 1.110405, 0.844704, 0, 0, 0, 1, 1,
0.7296625, -2.030147, 3.622369, 0, 0, 0, 1, 1,
0.7368444, 1.231329, -0.8504331, 0, 0, 0, 1, 1,
0.7374791, -0.3447486, 3.083529, 0, 0, 0, 1, 1,
0.7408301, 0.09927788, 2.405341, 1, 1, 1, 1, 1,
0.7417334, -0.7237062, 3.429222, 1, 1, 1, 1, 1,
0.7440099, -0.3568651, -0.1578114, 1, 1, 1, 1, 1,
0.7454994, -0.02391986, 0.3297367, 1, 1, 1, 1, 1,
0.754914, -1.685224, 5.15841, 1, 1, 1, 1, 1,
0.7554498, -0.02391441, 2.072339, 1, 1, 1, 1, 1,
0.7617178, 0.292166, 2.015378, 1, 1, 1, 1, 1,
0.762312, 0.8367132, 0.5653387, 1, 1, 1, 1, 1,
0.7626357, -0.1104258, 0.9523135, 1, 1, 1, 1, 1,
0.7652117, -0.1547842, 4.068408, 1, 1, 1, 1, 1,
0.771973, -0.8158875, 2.955028, 1, 1, 1, 1, 1,
0.7726172, 0.7857605, 0.4716827, 1, 1, 1, 1, 1,
0.781929, 0.008846033, 2.183111, 1, 1, 1, 1, 1,
0.788891, -2.212818, 3.093395, 1, 1, 1, 1, 1,
0.7892062, -0.7416535, 1.574033, 1, 1, 1, 1, 1,
0.795883, 1.109568, 1.690119, 0, 0, 1, 1, 1,
0.7959584, -0.5972897, 2.966761, 1, 0, 0, 1, 1,
0.80515, 1.370882, 0.9162177, 1, 0, 0, 1, 1,
0.805563, 1.142487, -1.168829, 1, 0, 0, 1, 1,
0.8179724, 2.337405, 1.440077, 1, 0, 0, 1, 1,
0.823669, 0.8418751, 1.609645, 1, 0, 0, 1, 1,
0.8256955, 0.9347963, 0.9054865, 0, 0, 0, 1, 1,
0.828501, 0.2082446, 1.398168, 0, 0, 0, 1, 1,
0.8296381, 0.8061503, 0.5618623, 0, 0, 0, 1, 1,
0.831986, -0.2182205, 3.120667, 0, 0, 0, 1, 1,
0.8327376, 0.7767668, 2.358135, 0, 0, 0, 1, 1,
0.838922, 2.056268, 1.986833, 0, 0, 0, 1, 1,
0.841428, -0.6692681, 0.9520904, 0, 0, 0, 1, 1,
0.8431608, -0.8616905, 1.921833, 1, 1, 1, 1, 1,
0.8486074, 0.2741103, 2.369806, 1, 1, 1, 1, 1,
0.8573709, -1.014095, 1.270083, 1, 1, 1, 1, 1,
0.857609, -1.309448, 1.785858, 1, 1, 1, 1, 1,
0.86169, 0.7089076, 1.647047, 1, 1, 1, 1, 1,
0.8668864, 1.715387, 1.253372, 1, 1, 1, 1, 1,
0.8672605, -1.203497, 2.47625, 1, 1, 1, 1, 1,
0.8715944, -1.028467, 2.373663, 1, 1, 1, 1, 1,
0.8908449, -0.0533879, 0.01276817, 1, 1, 1, 1, 1,
0.8916975, 0.9178356, 0.8576533, 1, 1, 1, 1, 1,
0.8984402, -2.165065, 4.209974, 1, 1, 1, 1, 1,
0.9010534, -1.114152, 2.546077, 1, 1, 1, 1, 1,
0.909879, -0.07379033, 0.6625784, 1, 1, 1, 1, 1,
0.9124489, -0.9314333, 1.916342, 1, 1, 1, 1, 1,
0.9178901, 1.701065, 0.5766437, 1, 1, 1, 1, 1,
0.919017, -0.5111794, 2.327877, 0, 0, 1, 1, 1,
0.9192404, -0.003350444, 3.469527, 1, 0, 0, 1, 1,
0.921219, 2.287422, -0.5929279, 1, 0, 0, 1, 1,
0.9235969, -0.8850179, 2.366912, 1, 0, 0, 1, 1,
0.9395246, -0.8486277, 1.780395, 1, 0, 0, 1, 1,
0.9449217, -0.3660203, 1.331099, 1, 0, 0, 1, 1,
0.9503992, 0.1774833, 0.8276497, 0, 0, 0, 1, 1,
0.9514363, -0.6513675, 3.115603, 0, 0, 0, 1, 1,
0.9550158, 1.088474, 1.885555, 0, 0, 0, 1, 1,
0.9581556, -0.4893481, 2.235615, 0, 0, 0, 1, 1,
0.9591392, 0.7635567, 1.106783, 0, 0, 0, 1, 1,
0.9676318, -1.269287, 2.976906, 0, 0, 0, 1, 1,
0.971008, 0.253354, -2.30199, 0, 0, 0, 1, 1,
0.9714198, -2.493762, 1.965138, 1, 1, 1, 1, 1,
0.9744365, -0.2286979, 2.017638, 1, 1, 1, 1, 1,
0.9744872, 1.44407, 0.3894494, 1, 1, 1, 1, 1,
1.006955, 0.4657153, 1.364727, 1, 1, 1, 1, 1,
1.007038, -1.278727, 2.972007, 1, 1, 1, 1, 1,
1.018776, 1.97058, -0.8857573, 1, 1, 1, 1, 1,
1.022219, 1.431103, 0.4820287, 1, 1, 1, 1, 1,
1.024154, -0.4659593, 2.328416, 1, 1, 1, 1, 1,
1.026505, -0.2300558, 0.1346678, 1, 1, 1, 1, 1,
1.031344, 0.1335399, 0.5064976, 1, 1, 1, 1, 1,
1.042777, 0.6849412, 0.3471309, 1, 1, 1, 1, 1,
1.050728, 0.2145578, 1.591692, 1, 1, 1, 1, 1,
1.058142, -0.8505496, 1.456836, 1, 1, 1, 1, 1,
1.061117, -0.8941169, 0.9053473, 1, 1, 1, 1, 1,
1.065046, -1.533172, 2.105149, 1, 1, 1, 1, 1,
1.075394, -0.438125, 2.695306, 0, 0, 1, 1, 1,
1.081243, -1.637609, 3.134431, 1, 0, 0, 1, 1,
1.083619, 0.5856415, -0.2902858, 1, 0, 0, 1, 1,
1.086275, 0.8630197, 0.6512025, 1, 0, 0, 1, 1,
1.087459, 0.03318438, 1.513049, 1, 0, 0, 1, 1,
1.089231, 0.9195617, -0.7446777, 1, 0, 0, 1, 1,
1.093198, 0.6817119, 0.8742732, 0, 0, 0, 1, 1,
1.105735, -0.5715621, 2.770194, 0, 0, 0, 1, 1,
1.107437, -0.2145824, 1.625836, 0, 0, 0, 1, 1,
1.11071, -1.606828, 2.375966, 0, 0, 0, 1, 1,
1.130129, -1.673758, 3.816427, 0, 0, 0, 1, 1,
1.131018, -0.5569602, 2.323396, 0, 0, 0, 1, 1,
1.133993, 1.213297, -0.1033716, 0, 0, 0, 1, 1,
1.138454, 0.1212798, 2.738929, 1, 1, 1, 1, 1,
1.138495, -0.5521321, 2.674274, 1, 1, 1, 1, 1,
1.139898, 1.016672, -0.2430504, 1, 1, 1, 1, 1,
1.144804, -0.9878008, 1.953222, 1, 1, 1, 1, 1,
1.146355, 0.8413159, 0.2366144, 1, 1, 1, 1, 1,
1.14863, 1.761319, 0.946758, 1, 1, 1, 1, 1,
1.150293, 0.9450843, 0.07510222, 1, 1, 1, 1, 1,
1.153051, -1.227074, 2.301329, 1, 1, 1, 1, 1,
1.15891, -0.1213454, 2.227824, 1, 1, 1, 1, 1,
1.16502, -1.017152, 1.700883, 1, 1, 1, 1, 1,
1.169633, 1.260263, 1.962037, 1, 1, 1, 1, 1,
1.170671, -1.065003, 3.368592, 1, 1, 1, 1, 1,
1.172449, 0.6682072, 1.743637, 1, 1, 1, 1, 1,
1.1726, -0.07782557, 3.063304, 1, 1, 1, 1, 1,
1.181213, -0.3236692, 1.847292, 1, 1, 1, 1, 1,
1.186694, -0.355225, 0.6824723, 0, 0, 1, 1, 1,
1.186722, 1.197942, 2.262675, 1, 0, 0, 1, 1,
1.194021, -0.8604141, 1.981253, 1, 0, 0, 1, 1,
1.196246, -1.377367, 1.172996, 1, 0, 0, 1, 1,
1.196628, 0.251385, 2.55453, 1, 0, 0, 1, 1,
1.198288, -0.3082329, 1.29556, 1, 0, 0, 1, 1,
1.201552, 1.503237, -1.341108, 0, 0, 0, 1, 1,
1.209182, -2.072589, 3.524683, 0, 0, 0, 1, 1,
1.214831, 1.008564, -0.9779302, 0, 0, 0, 1, 1,
1.223034, 1.400548, 0.9156027, 0, 0, 0, 1, 1,
1.22423, -1.08222, 2.50333, 0, 0, 0, 1, 1,
1.229644, 0.445034, 2.975796, 0, 0, 0, 1, 1,
1.231711, -0.401271, 0.9356666, 0, 0, 0, 1, 1,
1.235942, -0.1305943, 0.1932219, 1, 1, 1, 1, 1,
1.239571, 0.6227943, 3.512372, 1, 1, 1, 1, 1,
1.244512, 0.7246474, 0.927898, 1, 1, 1, 1, 1,
1.252841, -0.6904811, 2.502348, 1, 1, 1, 1, 1,
1.25943, 2.249277, 0.7993422, 1, 1, 1, 1, 1,
1.28425, -0.05766645, 2.547484, 1, 1, 1, 1, 1,
1.291515, 0.8904445, 1.689544, 1, 1, 1, 1, 1,
1.31643, 0.3129798, 2.098292, 1, 1, 1, 1, 1,
1.327603, -0.3491401, 2.871014, 1, 1, 1, 1, 1,
1.328919, 0.06539668, 1.995447, 1, 1, 1, 1, 1,
1.329184, 1.014938, -0.7171016, 1, 1, 1, 1, 1,
1.33577, 0.7002415, 1.713033, 1, 1, 1, 1, 1,
1.340279, 1.638782, 0.2147351, 1, 1, 1, 1, 1,
1.342398, -0.1628621, 0.02979091, 1, 1, 1, 1, 1,
1.345132, -0.8634498, 0.6532144, 1, 1, 1, 1, 1,
1.373186, 0.4930959, 1.657497, 0, 0, 1, 1, 1,
1.376805, -0.2731924, 0.576473, 1, 0, 0, 1, 1,
1.377888, -0.7490358, 2.799049, 1, 0, 0, 1, 1,
1.402844, 0.2512243, 2.513093, 1, 0, 0, 1, 1,
1.406874, 2.15589, 2.872997, 1, 0, 0, 1, 1,
1.40716, -0.6712888, 3.220672, 1, 0, 0, 1, 1,
1.407265, -0.2046302, 1.294281, 0, 0, 0, 1, 1,
1.407358, -0.89617, 1.278779, 0, 0, 0, 1, 1,
1.413267, 1.011619, -0.3160444, 0, 0, 0, 1, 1,
1.420904, -0.2074772, 0.8712732, 0, 0, 0, 1, 1,
1.426626, 0.9717177, 2.033305, 0, 0, 0, 1, 1,
1.432156, 0.4139568, 1.502901, 0, 0, 0, 1, 1,
1.436812, -1.003683, 0.3861172, 0, 0, 0, 1, 1,
1.442192, -0.6587125, 0.5821319, 1, 1, 1, 1, 1,
1.452959, -0.4783483, 1.965943, 1, 1, 1, 1, 1,
1.465432, 1.230844, 1.280982, 1, 1, 1, 1, 1,
1.467805, 0.1121601, 0.4282517, 1, 1, 1, 1, 1,
1.468011, -1.012126, 2.940728, 1, 1, 1, 1, 1,
1.477881, 0.141378, 1.326245, 1, 1, 1, 1, 1,
1.478923, 0.1156992, 0.6830243, 1, 1, 1, 1, 1,
1.494459, 0.1675374, 1.684429, 1, 1, 1, 1, 1,
1.516543, -0.3987811, 2.95102, 1, 1, 1, 1, 1,
1.531438, -1.056888, 1.786107, 1, 1, 1, 1, 1,
1.535825, 0.4287466, 3.544465, 1, 1, 1, 1, 1,
1.568157, -0.266329, 1.535959, 1, 1, 1, 1, 1,
1.572123, 0.4811856, 1.063332, 1, 1, 1, 1, 1,
1.590348, 0.292128, 2.260311, 1, 1, 1, 1, 1,
1.594933, -1.008662, 3.686557, 1, 1, 1, 1, 1,
1.599701, -0.6654838, 3.411255, 0, 0, 1, 1, 1,
1.605686, -1.416458, 2.293892, 1, 0, 0, 1, 1,
1.609953, 0.1391898, 1.277945, 1, 0, 0, 1, 1,
1.614991, 2.134318, 0.8443283, 1, 0, 0, 1, 1,
1.617685, -0.8240066, 2.101056, 1, 0, 0, 1, 1,
1.62197, -0.1285806, 1.133576, 1, 0, 0, 1, 1,
1.625035, -0.4031268, 1.458186, 0, 0, 0, 1, 1,
1.657019, -0.08989982, 0.6654258, 0, 0, 0, 1, 1,
1.669282, 0.7068131, 0.1573257, 0, 0, 0, 1, 1,
1.688651, 1.039953, 0.2725198, 0, 0, 0, 1, 1,
1.694062, 0.1000494, 2.795268, 0, 0, 0, 1, 1,
1.705655, 0.01354067, 0.01776434, 0, 0, 0, 1, 1,
1.724358, -1.36151, 2.313569, 0, 0, 0, 1, 1,
1.725843, -0.3433191, -0.231406, 1, 1, 1, 1, 1,
1.733073, 1.176822, -0.7692978, 1, 1, 1, 1, 1,
1.745368, 1.191653, -0.2035243, 1, 1, 1, 1, 1,
1.768473, -1.685217, 1.121468, 1, 1, 1, 1, 1,
1.778993, 0.8332911, 1.599528, 1, 1, 1, 1, 1,
1.784011, -1.387894, 3.509973, 1, 1, 1, 1, 1,
1.794564, -0.3945265, 2.616887, 1, 1, 1, 1, 1,
1.795179, -1.206069, 2.329244, 1, 1, 1, 1, 1,
1.797507, -0.3478194, 0.2333801, 1, 1, 1, 1, 1,
1.803543, 0.3369411, 2.618705, 1, 1, 1, 1, 1,
1.814472, -0.2110835, 2.390625, 1, 1, 1, 1, 1,
1.820984, -0.05123231, 3.143897, 1, 1, 1, 1, 1,
1.82143, -1.39292, 2.964472, 1, 1, 1, 1, 1,
1.828371, 0.1289026, 1.375577, 1, 1, 1, 1, 1,
1.840554, 0.2596488, 2.153805, 1, 1, 1, 1, 1,
1.862273, -0.9323958, 0.03243555, 0, 0, 1, 1, 1,
1.862686, -0.1230441, 1.935998, 1, 0, 0, 1, 1,
1.882712, 0.5619799, 1.671044, 1, 0, 0, 1, 1,
1.884181, -0.04071342, 2.37805, 1, 0, 0, 1, 1,
1.890546, -1.547003, 1.567472, 1, 0, 0, 1, 1,
1.897, 0.398341, 0.199481, 1, 0, 0, 1, 1,
1.90418, -0.4793233, 2.393987, 0, 0, 0, 1, 1,
1.904403, 2.052139, 1.126334, 0, 0, 0, 1, 1,
1.909911, 0.225396, 0.753459, 0, 0, 0, 1, 1,
1.909975, 1.180628, -0.8296865, 0, 0, 0, 1, 1,
1.932166, 1.099302, 2.128025, 0, 0, 0, 1, 1,
1.934886, -0.7806673, 2.602086, 0, 0, 0, 1, 1,
1.950359, 0.4803935, 3.217035, 0, 0, 0, 1, 1,
1.970112, -0.8291869, 2.856539, 1, 1, 1, 1, 1,
1.980664, -1.0286, 2.376176, 1, 1, 1, 1, 1,
1.986187, 0.5248324, 1.49473, 1, 1, 1, 1, 1,
1.988213, 1.665125, 1.866266, 1, 1, 1, 1, 1,
1.990161, 1.122732, 0.9557803, 1, 1, 1, 1, 1,
1.991539, -0.1114207, 3.775902, 1, 1, 1, 1, 1,
2.017545, 0.7341352, 2.027858, 1, 1, 1, 1, 1,
2.056565, 0.7167868, 0.8697324, 1, 1, 1, 1, 1,
2.065169, -0.8263733, 1.747826, 1, 1, 1, 1, 1,
2.070105, 0.6021383, -0.5367653, 1, 1, 1, 1, 1,
2.087084, 0.6545671, 2.670355, 1, 1, 1, 1, 1,
2.091079, 1.717976, 0.009319577, 1, 1, 1, 1, 1,
2.099658, 0.7121643, 2.824661, 1, 1, 1, 1, 1,
2.164608, -1.19033, 1.56007, 1, 1, 1, 1, 1,
2.177369, 1.181319, 0.8305864, 1, 1, 1, 1, 1,
2.195776, 0.6829565, 0.5373238, 0, 0, 1, 1, 1,
2.204806, -0.2127409, 1.694926, 1, 0, 0, 1, 1,
2.205114, -1.467324, 2.627671, 1, 0, 0, 1, 1,
2.24854, -1.641194, 1.213767, 1, 0, 0, 1, 1,
2.288961, 0.3615637, 2.223295, 1, 0, 0, 1, 1,
2.291219, 0.401773, 1.67855, 1, 0, 0, 1, 1,
2.308451, 0.8532083, 2.045108, 0, 0, 0, 1, 1,
2.309475, -0.5951973, 2.044084, 0, 0, 0, 1, 1,
2.323831, 1.591079, 0.3954453, 0, 0, 0, 1, 1,
2.417346, 0.5091599, 0.645131, 0, 0, 0, 1, 1,
2.449023, -1.468463, 3.520699, 0, 0, 0, 1, 1,
2.462157, -1.107674, 2.867408, 0, 0, 0, 1, 1,
2.539662, 0.8228256, 1.952896, 0, 0, 0, 1, 1,
2.544789, 1.588925, 1.236145, 1, 1, 1, 1, 1,
2.587197, 0.5708566, -1.006571, 1, 1, 1, 1, 1,
2.635712, -0.8093162, 0.9725972, 1, 1, 1, 1, 1,
2.665277, 0.3845671, 0.5380414, 1, 1, 1, 1, 1,
2.77315, -2.13128, 2.163403, 1, 1, 1, 1, 1,
2.89232, 2.071064, 1.284009, 1, 1, 1, 1, 1,
3.190096, 0.2190511, 3.371604, 1, 1, 1, 1, 1
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
var radius = 9.855737;
var distance = 34.61786;
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
mvMatrix.translate( -0.142783, 0.08354425, 0.05784273 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.61786);
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
