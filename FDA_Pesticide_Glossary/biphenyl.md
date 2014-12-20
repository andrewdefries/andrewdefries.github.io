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
-3.47997, -1.059801, -0.4597456, 1, 0, 0, 1,
-3.389912, -0.7325238, -1.914334, 1, 0.007843138, 0, 1,
-2.992423, -0.1320095, -3.236572, 1, 0.01176471, 0, 1,
-2.876646, 0.5909486, -1.033319, 1, 0.01960784, 0, 1,
-2.693955, 0.743587, -0.8809892, 1, 0.02352941, 0, 1,
-2.691567, 1.447964, 0.4454024, 1, 0.03137255, 0, 1,
-2.684164, -0.6589476, -2.860137, 1, 0.03529412, 0, 1,
-2.648104, -0.9316404, -1.561547, 1, 0.04313726, 0, 1,
-2.576193, -1.868801, -3.006846, 1, 0.04705882, 0, 1,
-2.514011, 0.3153848, -0.9329565, 1, 0.05490196, 0, 1,
-2.390739, -0.1309918, -2.368113, 1, 0.05882353, 0, 1,
-2.351061, -1.628414, -1.775246, 1, 0.06666667, 0, 1,
-2.295506, 0.1613315, -0.9219402, 1, 0.07058824, 0, 1,
-2.293503, 0.9137502, -2.017122, 1, 0.07843138, 0, 1,
-2.242271, -0.07262099, -1.398261, 1, 0.08235294, 0, 1,
-2.230085, 0.7283329, -0.7593441, 1, 0.09019608, 0, 1,
-2.215514, 0.6070382, -1.383483, 1, 0.09411765, 0, 1,
-2.209962, -1.083408, -2.749862, 1, 0.1019608, 0, 1,
-2.170397, -0.4452226, -2.777439, 1, 0.1098039, 0, 1,
-2.138549, 1.317729, -2.757952, 1, 0.1137255, 0, 1,
-2.137255, 1.475919, -2.019056, 1, 0.1215686, 0, 1,
-2.073148, 1.079387, -0.7712169, 1, 0.1254902, 0, 1,
-2.060717, 0.7905343, -0.1406701, 1, 0.1333333, 0, 1,
-2.04632, 0.17581, -2.118429, 1, 0.1372549, 0, 1,
-2.0431, 0.04046909, -1.33835, 1, 0.145098, 0, 1,
-2.031159, -0.3212757, -0.5238863, 1, 0.1490196, 0, 1,
-1.992682, 0.05863545, -0.4233199, 1, 0.1568628, 0, 1,
-1.984927, -0.6979176, -2.194192, 1, 0.1607843, 0, 1,
-1.965528, 0.1692896, -0.7714196, 1, 0.1686275, 0, 1,
-1.961007, -0.780924, -2.467486, 1, 0.172549, 0, 1,
-1.913892, 1.257069, -1.214535, 1, 0.1803922, 0, 1,
-1.901013, 0.6530262, -2.600638, 1, 0.1843137, 0, 1,
-1.885514, 2.214598, -0.2653685, 1, 0.1921569, 0, 1,
-1.862788, -1.685528, -2.154613, 1, 0.1960784, 0, 1,
-1.771781, 0.3269462, -2.863683, 1, 0.2039216, 0, 1,
-1.765749, -0.2059369, -2.754345, 1, 0.2117647, 0, 1,
-1.752711, 0.4707952, 0.4397919, 1, 0.2156863, 0, 1,
-1.750747, 0.5192406, -2.138353, 1, 0.2235294, 0, 1,
-1.74788, -0.05968782, -0.02345198, 1, 0.227451, 0, 1,
-1.744363, 0.9885644, -0.7386518, 1, 0.2352941, 0, 1,
-1.735315, 0.3301446, -3.849371, 1, 0.2392157, 0, 1,
-1.727149, 0.8091756, -1.712121, 1, 0.2470588, 0, 1,
-1.716454, -0.5080501, -0.9388124, 1, 0.2509804, 0, 1,
-1.715828, -0.6560967, -2.975173, 1, 0.2588235, 0, 1,
-1.709178, 1.114726, -0.4051549, 1, 0.2627451, 0, 1,
-1.678013, 1.125423, 0.524101, 1, 0.2705882, 0, 1,
-1.652506, -2.024915, -3.469525, 1, 0.2745098, 0, 1,
-1.636852, -1.976953, -2.556313, 1, 0.282353, 0, 1,
-1.63098, 1.974745, 0.05291112, 1, 0.2862745, 0, 1,
-1.625921, -0.5748944, -1.594103, 1, 0.2941177, 0, 1,
-1.610666, -0.02379017, -2.383687, 1, 0.3019608, 0, 1,
-1.609219, 0.550788, -1.322388, 1, 0.3058824, 0, 1,
-1.594575, -1.466268, -3.559786, 1, 0.3137255, 0, 1,
-1.583393, -1.989625, -1.103776, 1, 0.3176471, 0, 1,
-1.582944, 1.113997, -1.104892, 1, 0.3254902, 0, 1,
-1.575828, -0.3385748, -1.103433, 1, 0.3294118, 0, 1,
-1.563159, 0.8265964, -3.182009, 1, 0.3372549, 0, 1,
-1.560131, 1.401308, -1.298457, 1, 0.3411765, 0, 1,
-1.550786, 0.5304366, -0.7289749, 1, 0.3490196, 0, 1,
-1.550553, 0.847725, -1.591409, 1, 0.3529412, 0, 1,
-1.539371, -0.6279867, -1.359473, 1, 0.3607843, 0, 1,
-1.537202, -0.8060758, -1.111698, 1, 0.3647059, 0, 1,
-1.512344, 1.643953, -1.353854, 1, 0.372549, 0, 1,
-1.489914, 0.7283551, -1.911324, 1, 0.3764706, 0, 1,
-1.477577, -1.180403, -3.358252, 1, 0.3843137, 0, 1,
-1.476416, 0.24584, -0.7149025, 1, 0.3882353, 0, 1,
-1.473675, 0.3545047, -2.68714, 1, 0.3960784, 0, 1,
-1.472176, -0.7262456, -1.492337, 1, 0.4039216, 0, 1,
-1.46617, 1.745948, -2.379396, 1, 0.4078431, 0, 1,
-1.460121, 0.4909946, 0.163795, 1, 0.4156863, 0, 1,
-1.458403, 0.03100946, -1.455328, 1, 0.4196078, 0, 1,
-1.448557, 0.8559321, 0.909584, 1, 0.427451, 0, 1,
-1.44398, 0.8944103, 0.2990628, 1, 0.4313726, 0, 1,
-1.441097, 0.4426814, -0.7163815, 1, 0.4392157, 0, 1,
-1.43562, 0.8284925, 0.5855936, 1, 0.4431373, 0, 1,
-1.42267, -1.435649, -2.634599, 1, 0.4509804, 0, 1,
-1.422577, 0.2622321, -0.3485457, 1, 0.454902, 0, 1,
-1.41148, 0.9264302, -1.136853, 1, 0.4627451, 0, 1,
-1.389009, 1.295387, 1.171552, 1, 0.4666667, 0, 1,
-1.386817, -0.4251864, 1.24031, 1, 0.4745098, 0, 1,
-1.386494, -0.004037914, -2.055974, 1, 0.4784314, 0, 1,
-1.383715, -0.4988107, -0.5122858, 1, 0.4862745, 0, 1,
-1.378851, 0.52285, 0.7203052, 1, 0.4901961, 0, 1,
-1.378767, 0.4252059, -2.490465, 1, 0.4980392, 0, 1,
-1.377919, -0.6820183, -1.283072, 1, 0.5058824, 0, 1,
-1.370866, -1.173002, -3.318102, 1, 0.509804, 0, 1,
-1.367975, 2.266845, -0.8032692, 1, 0.5176471, 0, 1,
-1.365698, 0.5701398, -1.564304, 1, 0.5215687, 0, 1,
-1.365611, -0.1982735, -2.9881, 1, 0.5294118, 0, 1,
-1.360126, 0.3316148, -1.139364, 1, 0.5333334, 0, 1,
-1.355421, 1.870509, 0.670703, 1, 0.5411765, 0, 1,
-1.345688, 0.127044, -2.071939, 1, 0.5450981, 0, 1,
-1.332056, -0.6272861, -2.58078, 1, 0.5529412, 0, 1,
-1.31263, -0.198536, -1.720748, 1, 0.5568628, 0, 1,
-1.312241, -1.590897, -2.942682, 1, 0.5647059, 0, 1,
-1.307019, -1.801708, -1.398036, 1, 0.5686275, 0, 1,
-1.305728, -0.1473276, -0.9970865, 1, 0.5764706, 0, 1,
-1.304359, -0.9610255, -2.451298, 1, 0.5803922, 0, 1,
-1.294749, -0.04474889, -2.44739, 1, 0.5882353, 0, 1,
-1.286304, 1.570927, 0.2658899, 1, 0.5921569, 0, 1,
-1.283723, -1.720819, -1.876527, 1, 0.6, 0, 1,
-1.273896, -0.9867891, -0.9012844, 1, 0.6078432, 0, 1,
-1.267236, -0.1986348, -0.9409701, 1, 0.6117647, 0, 1,
-1.259134, 0.4603561, -1.362636, 1, 0.6196079, 0, 1,
-1.246782, 1.577066, -0.07754382, 1, 0.6235294, 0, 1,
-1.239868, 0.2301171, -1.457768, 1, 0.6313726, 0, 1,
-1.227862, 0.3328257, -2.125444, 1, 0.6352941, 0, 1,
-1.217099, -0.9912025, -2.393674, 1, 0.6431373, 0, 1,
-1.211064, -1.296386, -2.273834, 1, 0.6470588, 0, 1,
-1.209239, 1.528912, -1.854533, 1, 0.654902, 0, 1,
-1.203029, -0.5759494, -0.8708194, 1, 0.6588235, 0, 1,
-1.202559, -1.28109, -2.429723, 1, 0.6666667, 0, 1,
-1.199483, 1.850322, -0.7959039, 1, 0.6705883, 0, 1,
-1.197111, 0.3340938, -0.1012307, 1, 0.6784314, 0, 1,
-1.192115, 0.5518337, 0.147278, 1, 0.682353, 0, 1,
-1.19021, 0.4439308, 0.02023477, 1, 0.6901961, 0, 1,
-1.186333, 0.8009997, -0.9670053, 1, 0.6941177, 0, 1,
-1.186146, 0.6945919, -0.8083043, 1, 0.7019608, 0, 1,
-1.186002, 0.2762198, -1.710778, 1, 0.7098039, 0, 1,
-1.183663, -0.1116255, -1.027067, 1, 0.7137255, 0, 1,
-1.177867, -1.830597, -2.935968, 1, 0.7215686, 0, 1,
-1.175976, -0.5880883, -1.377437, 1, 0.7254902, 0, 1,
-1.163001, -0.3290465, -1.78929, 1, 0.7333333, 0, 1,
-1.160999, -1.23796, -3.211944, 1, 0.7372549, 0, 1,
-1.153998, 0.7679074, -0.2197754, 1, 0.7450981, 0, 1,
-1.150972, -0.5619594, -1.493118, 1, 0.7490196, 0, 1,
-1.149791, -1.512454, -3.580732, 1, 0.7568628, 0, 1,
-1.140892, 0.7887917, -0.4946616, 1, 0.7607843, 0, 1,
-1.13647, -1.136071, -2.422793, 1, 0.7686275, 0, 1,
-1.136045, -2.221051, -4.076064, 1, 0.772549, 0, 1,
-1.135074, -2.843574, -3.403214, 1, 0.7803922, 0, 1,
-1.131123, 1.335578, -0.2957239, 1, 0.7843137, 0, 1,
-1.127465, -0.9366767, -4.230985, 1, 0.7921569, 0, 1,
-1.122207, 1.086806, -0.7697404, 1, 0.7960784, 0, 1,
-1.121799, -0.9714687, -3.5687, 1, 0.8039216, 0, 1,
-1.106648, -0.03733909, -0.561823, 1, 0.8117647, 0, 1,
-1.105705, -0.9316546, -1.954808, 1, 0.8156863, 0, 1,
-1.104735, 0.4217306, -0.4918416, 1, 0.8235294, 0, 1,
-1.102671, -0.3375476, -1.677381, 1, 0.827451, 0, 1,
-1.100331, -0.7094948, -3.34488, 1, 0.8352941, 0, 1,
-1.094044, -1.029351, -2.758478, 1, 0.8392157, 0, 1,
-1.087781, -0.07300179, -3.095391, 1, 0.8470588, 0, 1,
-1.08347, 0.3872041, -0.9407023, 1, 0.8509804, 0, 1,
-1.083126, -1.546028, -2.578394, 1, 0.8588235, 0, 1,
-1.072669, -0.345408, -2.757828, 1, 0.8627451, 0, 1,
-1.067809, 0.01184326, -2.043377, 1, 0.8705882, 0, 1,
-1.055713, -0.7782085, -2.325636, 1, 0.8745098, 0, 1,
-1.053002, -0.2534713, -0.5107169, 1, 0.8823529, 0, 1,
-1.050725, -1.077393, -2.353888, 1, 0.8862745, 0, 1,
-1.046918, -0.3784361, -2.552903, 1, 0.8941177, 0, 1,
-1.042796, 0.5825343, -3.641667, 1, 0.8980392, 0, 1,
-1.039442, 0.4110115, -0.7955714, 1, 0.9058824, 0, 1,
-1.036871, 0.4456511, -2.0669, 1, 0.9137255, 0, 1,
-1.035045, -3.434377, -0.096265, 1, 0.9176471, 0, 1,
-1.029406, -0.9593201, -2.02356, 1, 0.9254902, 0, 1,
-1.027906, 1.319648, 0.01165683, 1, 0.9294118, 0, 1,
-1.027343, -0.3127403, -1.743797, 1, 0.9372549, 0, 1,
-1.027058, 0.8792757, -0.7071683, 1, 0.9411765, 0, 1,
-1.026975, 1.732154, -0.8873329, 1, 0.9490196, 0, 1,
-1.025789, 0.5845888, -0.4352582, 1, 0.9529412, 0, 1,
-1.019886, 0.087859, -2.762715, 1, 0.9607843, 0, 1,
-1.017831, 1.646713, -0.5482566, 1, 0.9647059, 0, 1,
-1.016098, 0.8268256, -1.119212, 1, 0.972549, 0, 1,
-1.006596, -1.296046, -2.142138, 1, 0.9764706, 0, 1,
-0.9983914, 1.6268, -2.535131, 1, 0.9843137, 0, 1,
-0.9907049, 0.3400837, -0.3372157, 1, 0.9882353, 0, 1,
-0.987658, -0.8332804, -1.962288, 1, 0.9960784, 0, 1,
-0.9835629, -0.2153903, -0.5373861, 0.9960784, 1, 0, 1,
-0.9822628, -0.5594358, -3.866542, 0.9921569, 1, 0, 1,
-0.9724326, 0.2192542, -1.573718, 0.9843137, 1, 0, 1,
-0.969751, 0.09607945, -1.141548, 0.9803922, 1, 0, 1,
-0.9667862, -0.09462259, -1.71894, 0.972549, 1, 0, 1,
-0.9388821, 0.06448117, -3.004068, 0.9686275, 1, 0, 1,
-0.9388394, -0.4891084, -0.4673226, 0.9607843, 1, 0, 1,
-0.935211, 1.050585, -1.493873, 0.9568627, 1, 0, 1,
-0.9309217, 0.3657123, -0.9063076, 0.9490196, 1, 0, 1,
-0.9269442, 1.589532, -1.351954, 0.945098, 1, 0, 1,
-0.9048064, 0.920862, -0.8924665, 0.9372549, 1, 0, 1,
-0.9034342, 0.7656757, -0.4421352, 0.9333333, 1, 0, 1,
-0.9014819, -0.8686212, -2.451466, 0.9254902, 1, 0, 1,
-0.8942884, -1.695655, -3.273582, 0.9215686, 1, 0, 1,
-0.8917438, 0.9550307, -2.140878, 0.9137255, 1, 0, 1,
-0.8887411, 0.3123509, -2.177584, 0.9098039, 1, 0, 1,
-0.8855472, 0.3767343, -2.459335, 0.9019608, 1, 0, 1,
-0.8721727, 0.3995108, -0.4754545, 0.8941177, 1, 0, 1,
-0.8715823, -1.934236, -2.572268, 0.8901961, 1, 0, 1,
-0.8684491, -0.6638361, -2.826365, 0.8823529, 1, 0, 1,
-0.8656337, 0.7641955, -1.401655, 0.8784314, 1, 0, 1,
-0.8655173, -1.300731, -1.448456, 0.8705882, 1, 0, 1,
-0.8608816, 1.96835, -1.986955, 0.8666667, 1, 0, 1,
-0.8550692, 0.2772567, -1.341329, 0.8588235, 1, 0, 1,
-0.8445596, -0.1826298, -3.260808, 0.854902, 1, 0, 1,
-0.841823, 1.026842, -0.3235213, 0.8470588, 1, 0, 1,
-0.8417844, 0.9357127, -0.985997, 0.8431373, 1, 0, 1,
-0.8357846, 1.810846, -2.6235, 0.8352941, 1, 0, 1,
-0.8355023, -0.5894973, -2.271621, 0.8313726, 1, 0, 1,
-0.8110755, 1.623863, -2.386773, 0.8235294, 1, 0, 1,
-0.8077292, -0.2795198, -0.8752581, 0.8196079, 1, 0, 1,
-0.7984565, -0.4561122, -1.955001, 0.8117647, 1, 0, 1,
-0.7963705, -0.1836412, 0.1825353, 0.8078431, 1, 0, 1,
-0.7953697, -0.2585834, -3.139253, 0.8, 1, 0, 1,
-0.7941346, -0.7176834, -3.3789, 0.7921569, 1, 0, 1,
-0.7892463, 0.009852411, -3.099916, 0.7882353, 1, 0, 1,
-0.7859899, -2.482799, -3.003999, 0.7803922, 1, 0, 1,
-0.7741402, -1.543172, -2.695474, 0.7764706, 1, 0, 1,
-0.7678379, -0.9093897, -1.911014, 0.7686275, 1, 0, 1,
-0.7675065, 2.258373, 1.378401, 0.7647059, 1, 0, 1,
-0.7628809, 0.3385129, -0.4443187, 0.7568628, 1, 0, 1,
-0.7623493, -1.387998, -2.967946, 0.7529412, 1, 0, 1,
-0.760837, 0.2455895, -1.98159, 0.7450981, 1, 0, 1,
-0.7591587, 0.06523444, -1.61409, 0.7411765, 1, 0, 1,
-0.7580591, 0.9322214, -1.556094, 0.7333333, 1, 0, 1,
-0.748701, 1.465615, -0.9779885, 0.7294118, 1, 0, 1,
-0.740464, 1.166444, -0.2996169, 0.7215686, 1, 0, 1,
-0.7386291, -0.4156604, -1.02642, 0.7176471, 1, 0, 1,
-0.7315266, -0.9512253, -3.746231, 0.7098039, 1, 0, 1,
-0.7294294, 0.4602701, -1.316664, 0.7058824, 1, 0, 1,
-0.7284691, -0.05293119, -1.672235, 0.6980392, 1, 0, 1,
-0.7264553, -1.076682, -2.509476, 0.6901961, 1, 0, 1,
-0.724798, -0.5790224, -1.440322, 0.6862745, 1, 0, 1,
-0.7203068, 0.09212069, -0.3537469, 0.6784314, 1, 0, 1,
-0.7186745, 0.7359225, -0.8158604, 0.6745098, 1, 0, 1,
-0.7154982, -0.6835787, -2.814893, 0.6666667, 1, 0, 1,
-0.7084793, 0.1463603, -1.660187, 0.6627451, 1, 0, 1,
-0.7077515, 0.3572346, -2.525463, 0.654902, 1, 0, 1,
-0.7051609, -0.4819404, -1.87859, 0.6509804, 1, 0, 1,
-0.7025555, -2.037429, -3.295674, 0.6431373, 1, 0, 1,
-0.7011704, -1.616101, -3.961488, 0.6392157, 1, 0, 1,
-0.7000694, -2.38041, -3.052521, 0.6313726, 1, 0, 1,
-0.6972206, -0.844367, -3.136455, 0.627451, 1, 0, 1,
-0.6953843, -1.576592, -2.547614, 0.6196079, 1, 0, 1,
-0.6949988, 1.065614, -2.511232, 0.6156863, 1, 0, 1,
-0.6918172, -0.6639242, -2.459648, 0.6078432, 1, 0, 1,
-0.6912337, -0.5238682, -1.320832, 0.6039216, 1, 0, 1,
-0.6852475, 1.162608, -0.6735548, 0.5960785, 1, 0, 1,
-0.678361, 0.4608404, 0.06221386, 0.5882353, 1, 0, 1,
-0.6767419, -0.02279726, -1.685383, 0.5843138, 1, 0, 1,
-0.6724405, 0.4780991, -1.129106, 0.5764706, 1, 0, 1,
-0.6716268, 1.106187, -0.2290268, 0.572549, 1, 0, 1,
-0.6709055, -0.5493665, -0.324487, 0.5647059, 1, 0, 1,
-0.669273, 1.13142, 0.20184, 0.5607843, 1, 0, 1,
-0.6633987, 0.5558532, -0.9024979, 0.5529412, 1, 0, 1,
-0.6618285, -1.234233, -3.613696, 0.5490196, 1, 0, 1,
-0.6597713, -0.4813173, -1.584935, 0.5411765, 1, 0, 1,
-0.65867, -1.088288, -3.61539, 0.5372549, 1, 0, 1,
-0.6567907, 0.4768488, -1.484034, 0.5294118, 1, 0, 1,
-0.6544268, 1.817335, -1.698655, 0.5254902, 1, 0, 1,
-0.6543139, -1.371564, -3.974162, 0.5176471, 1, 0, 1,
-0.6521527, 0.7820253, -0.09354351, 0.5137255, 1, 0, 1,
-0.6384214, -0.1502857, -2.315445, 0.5058824, 1, 0, 1,
-0.6369019, -0.0889181, -2.530239, 0.5019608, 1, 0, 1,
-0.6364377, -0.2066086, -1.519899, 0.4941176, 1, 0, 1,
-0.6329876, 0.4084549, -1.38693, 0.4862745, 1, 0, 1,
-0.6307915, 0.2315884, 0.2703058, 0.4823529, 1, 0, 1,
-0.6307219, 0.6181568, -1.403259, 0.4745098, 1, 0, 1,
-0.6287261, 0.2435523, -0.9462618, 0.4705882, 1, 0, 1,
-0.6238705, -1.392092, -2.167666, 0.4627451, 1, 0, 1,
-0.6156795, 0.2055468, -1.537133, 0.4588235, 1, 0, 1,
-0.6128519, 0.32303, -1.369619, 0.4509804, 1, 0, 1,
-0.6117385, -1.318298, -3.286398, 0.4470588, 1, 0, 1,
-0.6110283, 0.6509619, 0.7998913, 0.4392157, 1, 0, 1,
-0.6073729, 0.4007549, -0.5801083, 0.4352941, 1, 0, 1,
-0.6062753, 0.140933, -0.376527, 0.427451, 1, 0, 1,
-0.6021232, 0.4766431, 0.45646, 0.4235294, 1, 0, 1,
-0.5986867, -0.8860676, -4.553123, 0.4156863, 1, 0, 1,
-0.5976362, -2.961654, -4.560797, 0.4117647, 1, 0, 1,
-0.5975136, 1.273376, -0.7292566, 0.4039216, 1, 0, 1,
-0.5913316, 0.1316846, -0.8593499, 0.3960784, 1, 0, 1,
-0.5896178, 0.2153151, -1.083487, 0.3921569, 1, 0, 1,
-0.5828196, -1.200077, -5.024519, 0.3843137, 1, 0, 1,
-0.5814925, -0.01832624, -1.099989, 0.3803922, 1, 0, 1,
-0.5809831, 0.130256, -0.698038, 0.372549, 1, 0, 1,
-0.580211, -0.5250388, -1.178613, 0.3686275, 1, 0, 1,
-0.5769553, -1.014283, -4.320051, 0.3607843, 1, 0, 1,
-0.5760206, 0.6705779, -0.2320717, 0.3568628, 1, 0, 1,
-0.5752734, 0.6866929, -0.2037317, 0.3490196, 1, 0, 1,
-0.572146, 0.8139724, -1.461648, 0.345098, 1, 0, 1,
-0.571685, 0.2202826, -2.863147, 0.3372549, 1, 0, 1,
-0.5708646, -0.7044654, -2.553137, 0.3333333, 1, 0, 1,
-0.566809, 0.2147404, -1.995679, 0.3254902, 1, 0, 1,
-0.5631579, -2.390528, -2.359275, 0.3215686, 1, 0, 1,
-0.5607468, -0.6382889, -2.874078, 0.3137255, 1, 0, 1,
-0.5601032, -0.5494353, -2.02866, 0.3098039, 1, 0, 1,
-0.5583736, -0.3819375, -1.729134, 0.3019608, 1, 0, 1,
-0.5572244, -0.3905079, -2.884233, 0.2941177, 1, 0, 1,
-0.5523754, -1.206949, -2.202201, 0.2901961, 1, 0, 1,
-0.5514073, -0.1126231, -1.903274, 0.282353, 1, 0, 1,
-0.5445898, -1.686424, -3.759395, 0.2784314, 1, 0, 1,
-0.5439733, -0.3821547, -5.20032, 0.2705882, 1, 0, 1,
-0.5438064, 1.614155, -1.440813, 0.2666667, 1, 0, 1,
-0.5430291, -0.4415413, -2.030047, 0.2588235, 1, 0, 1,
-0.5402289, 0.9405766, 1.478071, 0.254902, 1, 0, 1,
-0.5367057, -0.7551892, -2.667512, 0.2470588, 1, 0, 1,
-0.5358442, 0.3893197, -0.1984993, 0.2431373, 1, 0, 1,
-0.5350141, -0.362593, 0.2250629, 0.2352941, 1, 0, 1,
-0.5318493, 1.477874, -0.08425669, 0.2313726, 1, 0, 1,
-0.5318052, 0.1034653, -0.4121006, 0.2235294, 1, 0, 1,
-0.52975, 0.5145548, -2.496693, 0.2196078, 1, 0, 1,
-0.5293611, 0.6561965, -2.517275, 0.2117647, 1, 0, 1,
-0.5264928, 0.002488114, 0.3684223, 0.2078431, 1, 0, 1,
-0.52447, 0.288483, -1.176889, 0.2, 1, 0, 1,
-0.5229296, 2.407068, 0.3876649, 0.1921569, 1, 0, 1,
-0.5222063, -0.5067918, -1.414034, 0.1882353, 1, 0, 1,
-0.5175079, 2.263115, 0.3948804, 0.1803922, 1, 0, 1,
-0.515753, -0.1083314, -1.10498, 0.1764706, 1, 0, 1,
-0.510604, 1.661018, -1.062865, 0.1686275, 1, 0, 1,
-0.5015784, 0.5443793, 1.081546, 0.1647059, 1, 0, 1,
-0.5008919, -0.8712781, -2.502321, 0.1568628, 1, 0, 1,
-0.5001611, -1.221151, -2.627153, 0.1529412, 1, 0, 1,
-0.4990023, -1.275972, -2.600646, 0.145098, 1, 0, 1,
-0.4972695, -0.6096914, -3.902165, 0.1411765, 1, 0, 1,
-0.4894409, -0.6310669, -3.502395, 0.1333333, 1, 0, 1,
-0.486887, 0.9005258, -0.2645254, 0.1294118, 1, 0, 1,
-0.4861521, 1.948925, 0.0306216, 0.1215686, 1, 0, 1,
-0.4840358, -3.114873, -1.546499, 0.1176471, 1, 0, 1,
-0.4823431, -0.1175978, -0.6990514, 0.1098039, 1, 0, 1,
-0.4797978, -1.946474, -3.407574, 0.1058824, 1, 0, 1,
-0.4792083, -0.9986736, -3.191886, 0.09803922, 1, 0, 1,
-0.4752652, 0.4119844, -0.7135206, 0.09019608, 1, 0, 1,
-0.4735527, 1.996914, 0.2445666, 0.08627451, 1, 0, 1,
-0.4707363, -0.1106359, -0.3516636, 0.07843138, 1, 0, 1,
-0.469073, -0.5983518, -1.072183, 0.07450981, 1, 0, 1,
-0.4673349, 0.2424649, -1.616658, 0.06666667, 1, 0, 1,
-0.4619755, -0.7826086, 0.1605962, 0.0627451, 1, 0, 1,
-0.4616322, 0.1314264, -1.132352, 0.05490196, 1, 0, 1,
-0.4591949, 0.5575677, -0.8299349, 0.05098039, 1, 0, 1,
-0.45884, -1.220473, -1.146402, 0.04313726, 1, 0, 1,
-0.4576539, -0.3917031, -3.168633, 0.03921569, 1, 0, 1,
-0.4567417, -0.2219994, -0.671294, 0.03137255, 1, 0, 1,
-0.4556104, 0.01918405, -0.9053728, 0.02745098, 1, 0, 1,
-0.4529476, -0.004176397, -0.4223755, 0.01960784, 1, 0, 1,
-0.4523636, 0.1899621, -2.13906, 0.01568628, 1, 0, 1,
-0.4520285, 1.118503, -0.5136597, 0.007843138, 1, 0, 1,
-0.450696, 0.796164, -2.195824, 0.003921569, 1, 0, 1,
-0.4505295, 2.893783, 1.079602, 0, 1, 0.003921569, 1,
-0.4482336, 0.2972319, -3.00894, 0, 1, 0.01176471, 1,
-0.4402743, -1.16666, -1.314068, 0, 1, 0.01568628, 1,
-0.4379999, -1.444496, -3.14519, 0, 1, 0.02352941, 1,
-0.4368301, 0.06644554, -0.7116593, 0, 1, 0.02745098, 1,
-0.4342954, 0.715009, -1.740738, 0, 1, 0.03529412, 1,
-0.4288771, -0.7786617, -3.552354, 0, 1, 0.03921569, 1,
-0.4277028, 0.4123885, -3.210929, 0, 1, 0.04705882, 1,
-0.4276418, -1.028594, -2.028048, 0, 1, 0.05098039, 1,
-0.4202171, 0.1645603, 0.4793408, 0, 1, 0.05882353, 1,
-0.4189053, 1.469122, -2.18161, 0, 1, 0.0627451, 1,
-0.4170029, 1.391665, -1.844543, 0, 1, 0.07058824, 1,
-0.4105156, -0.5713803, -2.28207, 0, 1, 0.07450981, 1,
-0.408922, -0.7488033, -1.93543, 0, 1, 0.08235294, 1,
-0.4083365, -0.6169407, -4.693521, 0, 1, 0.08627451, 1,
-0.405949, 1.105673, 0.6633133, 0, 1, 0.09411765, 1,
-0.4054275, 0.6294357, -0.351931, 0, 1, 0.1019608, 1,
-0.4050433, 1.721825, -0.1623144, 0, 1, 0.1058824, 1,
-0.4041229, -2.409148, -3.943976, 0, 1, 0.1137255, 1,
-0.4034265, -0.4820205, -2.512777, 0, 1, 0.1176471, 1,
-0.4026862, 0.7149399, -1.935585, 0, 1, 0.1254902, 1,
-0.3947877, -0.1065196, -3.582103, 0, 1, 0.1294118, 1,
-0.3938706, 0.4468361, -2.136183, 0, 1, 0.1372549, 1,
-0.3924307, -2.276841, -1.983229, 0, 1, 0.1411765, 1,
-0.3911594, 0.7625718, -2.113052, 0, 1, 0.1490196, 1,
-0.3894138, 0.7473787, 0.1112878, 0, 1, 0.1529412, 1,
-0.3854592, 0.2080121, -0.833679, 0, 1, 0.1607843, 1,
-0.384247, 0.2324755, -1.441451, 0, 1, 0.1647059, 1,
-0.3841164, -0.2917128, -3.707283, 0, 1, 0.172549, 1,
-0.3839377, -0.2548698, -2.094707, 0, 1, 0.1764706, 1,
-0.3824696, 0.002616972, -1.366136, 0, 1, 0.1843137, 1,
-0.3811846, 0.1785667, -0.2637466, 0, 1, 0.1882353, 1,
-0.3797602, 1.204668, -0.6238716, 0, 1, 0.1960784, 1,
-0.379746, -0.001820077, -0.4370418, 0, 1, 0.2039216, 1,
-0.3783303, 2.120453, 1.820546, 0, 1, 0.2078431, 1,
-0.3780899, -2.517601, -2.838483, 0, 1, 0.2156863, 1,
-0.3771444, 0.1025376, -2.464203, 0, 1, 0.2196078, 1,
-0.3749981, -0.4981537, -3.01786, 0, 1, 0.227451, 1,
-0.3692534, 0.3670726, 0.5715458, 0, 1, 0.2313726, 1,
-0.3673075, -1.398396, -2.119593, 0, 1, 0.2392157, 1,
-0.3657382, -0.9826572, -1.017334, 0, 1, 0.2431373, 1,
-0.3655981, -0.7219396, -2.735996, 0, 1, 0.2509804, 1,
-0.3653384, -0.4861995, -3.115143, 0, 1, 0.254902, 1,
-0.3624389, -0.7738169, -1.479295, 0, 1, 0.2627451, 1,
-0.3589627, -0.3215293, -1.17847, 0, 1, 0.2666667, 1,
-0.3480601, -0.490467, -1.844545, 0, 1, 0.2745098, 1,
-0.3472353, 0.2666842, -1.902004, 0, 1, 0.2784314, 1,
-0.3472174, 0.03053819, -3.453124, 0, 1, 0.2862745, 1,
-0.3471015, -0.1735158, -1.945873, 0, 1, 0.2901961, 1,
-0.3356492, 1.552008, 0.2599752, 0, 1, 0.2980392, 1,
-0.3341632, -1.649052, -2.365147, 0, 1, 0.3058824, 1,
-0.3333953, -1.092833, -0.987812, 0, 1, 0.3098039, 1,
-0.3323348, -0.5202626, -1.747711, 0, 1, 0.3176471, 1,
-0.3303711, -2.015654, -2.546298, 0, 1, 0.3215686, 1,
-0.3272713, 0.5345638, -0.8887892, 0, 1, 0.3294118, 1,
-0.3255424, -0.6518153, -3.414103, 0, 1, 0.3333333, 1,
-0.3230862, 1.916283, -0.09416746, 0, 1, 0.3411765, 1,
-0.3168144, -0.4933359, -1.74491, 0, 1, 0.345098, 1,
-0.3149921, -0.1379126, -1.267982, 0, 1, 0.3529412, 1,
-0.3125193, -1.503153, -3.655825, 0, 1, 0.3568628, 1,
-0.311844, -1.091127, -4.185221, 0, 1, 0.3647059, 1,
-0.3099829, -0.7750999, -2.025802, 0, 1, 0.3686275, 1,
-0.2910326, 0.4781953, -0.6908412, 0, 1, 0.3764706, 1,
-0.2863751, 0.311974, -1.905011, 0, 1, 0.3803922, 1,
-0.2857778, 0.7202703, 0.06316414, 0, 1, 0.3882353, 1,
-0.2857226, 0.6884539, -1.285773, 0, 1, 0.3921569, 1,
-0.2820652, -0.08539912, -1.106623, 0, 1, 0.4, 1,
-0.2813272, 2.51997, 0.7843288, 0, 1, 0.4078431, 1,
-0.2789923, -1.404352, -1.778016, 0, 1, 0.4117647, 1,
-0.2726932, -1.052979, -3.649805, 0, 1, 0.4196078, 1,
-0.2690402, 0.4600382, 1.123223, 0, 1, 0.4235294, 1,
-0.258044, -0.2590362, -1.019653, 0, 1, 0.4313726, 1,
-0.2544187, -1.088271, -3.426284, 0, 1, 0.4352941, 1,
-0.2504724, -0.6357884, -3.160265, 0, 1, 0.4431373, 1,
-0.2445624, -0.7283899, -2.803569, 0, 1, 0.4470588, 1,
-0.243437, 0.008365708, -0.07640596, 0, 1, 0.454902, 1,
-0.2417443, 0.2274374, 1.637621, 0, 1, 0.4588235, 1,
-0.2392811, 0.6222258, 0.1843667, 0, 1, 0.4666667, 1,
-0.2386126, -1.15571, -1.645903, 0, 1, 0.4705882, 1,
-0.2380863, 0.327364, -0.4755692, 0, 1, 0.4784314, 1,
-0.2375761, -0.1290802, -2.566031, 0, 1, 0.4823529, 1,
-0.2363255, 1.507094, -0.005797513, 0, 1, 0.4901961, 1,
-0.2362345, 0.4238834, 0.3887277, 0, 1, 0.4941176, 1,
-0.2354531, -0.8509412, -5.290512, 0, 1, 0.5019608, 1,
-0.2309997, -0.1208836, -4.099314, 0, 1, 0.509804, 1,
-0.2273204, 0.9214808, -1.173923, 0, 1, 0.5137255, 1,
-0.2210848, -0.4483615, -4.472331, 0, 1, 0.5215687, 1,
-0.2192509, -0.05246165, -3.135353, 0, 1, 0.5254902, 1,
-0.2151553, 0.6980432, -0.004394707, 0, 1, 0.5333334, 1,
-0.2134237, -0.8754145, -2.084588, 0, 1, 0.5372549, 1,
-0.2120618, 1.388561, 1.165799, 0, 1, 0.5450981, 1,
-0.2105916, 0.4517848, 0.5897608, 0, 1, 0.5490196, 1,
-0.2095717, 0.314827, -2.108465, 0, 1, 0.5568628, 1,
-0.2037577, -0.7138961, -4.247787, 0, 1, 0.5607843, 1,
-0.2030708, -3.042857, -3.134176, 0, 1, 0.5686275, 1,
-0.2015503, -0.1757664, -3.504857, 0, 1, 0.572549, 1,
-0.200789, 0.1927816, 1.3742, 0, 1, 0.5803922, 1,
-0.1971474, 1.288383, 0.1927086, 0, 1, 0.5843138, 1,
-0.1970325, -0.2048056, -1.956014, 0, 1, 0.5921569, 1,
-0.1968918, -0.4159653, -2.008549, 0, 1, 0.5960785, 1,
-0.1937864, 0.9772922, -1.877082, 0, 1, 0.6039216, 1,
-0.1935759, -2.314512, -2.039552, 0, 1, 0.6117647, 1,
-0.1910591, -0.7185686, -3.287052, 0, 1, 0.6156863, 1,
-0.1889076, 0.168751, -1.454263, 0, 1, 0.6235294, 1,
-0.1855149, 0.1534094, -1.283142, 0, 1, 0.627451, 1,
-0.1832902, 1.026525, 0.1623731, 0, 1, 0.6352941, 1,
-0.1799941, 0.9907621, 0.7473812, 0, 1, 0.6392157, 1,
-0.1747151, -0.444102, -1.290427, 0, 1, 0.6470588, 1,
-0.1716521, 0.236092, 0.35047, 0, 1, 0.6509804, 1,
-0.1695395, 0.5677257, -1.229645, 0, 1, 0.6588235, 1,
-0.1678912, 0.08816851, -1.519634, 0, 1, 0.6627451, 1,
-0.1678149, 1.185002, 2.158641, 0, 1, 0.6705883, 1,
-0.1656405, -2.01257, -2.546861, 0, 1, 0.6745098, 1,
-0.1633376, -0.558927, -2.923936, 0, 1, 0.682353, 1,
-0.1629418, -0.1570786, -2.531625, 0, 1, 0.6862745, 1,
-0.1604887, -0.2749834, -1.599359, 0, 1, 0.6941177, 1,
-0.1604361, -1.041906, -3.965269, 0, 1, 0.7019608, 1,
-0.154709, 2.564958, -0.3622421, 0, 1, 0.7058824, 1,
-0.1535072, 0.9466921, -0.8210521, 0, 1, 0.7137255, 1,
-0.1515405, 1.289564, 0.0645979, 0, 1, 0.7176471, 1,
-0.1503487, -1.501042, -4.66455, 0, 1, 0.7254902, 1,
-0.1454596, 0.07543554, -1.418395, 0, 1, 0.7294118, 1,
-0.1454121, -0.7181175, -3.01427, 0, 1, 0.7372549, 1,
-0.1433729, -1.521966, -4.044825, 0, 1, 0.7411765, 1,
-0.1428214, 0.0556606, 0.09119858, 0, 1, 0.7490196, 1,
-0.1415874, -0.2677155, -3.201322, 0, 1, 0.7529412, 1,
-0.1382213, -0.06137884, -1.329644, 0, 1, 0.7607843, 1,
-0.1374932, -1.278819, -3.642601, 0, 1, 0.7647059, 1,
-0.1371306, -0.8111001, -2.28186, 0, 1, 0.772549, 1,
-0.1282313, 1.355895, 1.484273, 0, 1, 0.7764706, 1,
-0.1231364, 1.362472, 0.7599618, 0, 1, 0.7843137, 1,
-0.1213669, 0.6486796, -0.4434322, 0, 1, 0.7882353, 1,
-0.1184665, 0.2101516, -0.6623111, 0, 1, 0.7960784, 1,
-0.1110987, 0.235208, -0.3489831, 0, 1, 0.8039216, 1,
-0.1110829, -0.9464585, -3.044637, 0, 1, 0.8078431, 1,
-0.1077561, 0.8559372, 0.703905, 0, 1, 0.8156863, 1,
-0.1049891, 0.6468577, -0.8747634, 0, 1, 0.8196079, 1,
-0.1046639, 1.590109, 0.7649622, 0, 1, 0.827451, 1,
-0.1013426, 0.557705, -0.2129908, 0, 1, 0.8313726, 1,
-0.09763542, -0.4753886, -1.507728, 0, 1, 0.8392157, 1,
-0.09555322, -0.5574304, -1.190591, 0, 1, 0.8431373, 1,
-0.09211681, -2.22545, -2.637871, 0, 1, 0.8509804, 1,
-0.09123696, -1.37994, -2.694407, 0, 1, 0.854902, 1,
-0.09057523, -1.226147, -5.335334, 0, 1, 0.8627451, 1,
-0.08769879, -1.396166, -3.554914, 0, 1, 0.8666667, 1,
-0.0852517, 0.3843317, -0.3410582, 0, 1, 0.8745098, 1,
-0.08465765, -1.846908, -2.138866, 0, 1, 0.8784314, 1,
-0.08370191, -0.6010174, -2.969802, 0, 1, 0.8862745, 1,
-0.08253013, -0.5502313, -3.132504, 0, 1, 0.8901961, 1,
-0.08130608, -0.8623207, -4.188862, 0, 1, 0.8980392, 1,
-0.08094242, -1.596485, -2.688226, 0, 1, 0.9058824, 1,
-0.08060703, -1.293782, -3.594202, 0, 1, 0.9098039, 1,
-0.07683391, 1.772078, -0.1609379, 0, 1, 0.9176471, 1,
-0.07548682, 3.122061, 0.3511607, 0, 1, 0.9215686, 1,
-0.07050206, 0.5541927, -1.187744, 0, 1, 0.9294118, 1,
-0.06907175, 2.010047, -0.3661452, 0, 1, 0.9333333, 1,
-0.0669072, 0.1092677, 0.2351791, 0, 1, 0.9411765, 1,
-0.06292802, 0.3931675, -1.571097, 0, 1, 0.945098, 1,
-0.06274505, 1.630894, -0.3142228, 0, 1, 0.9529412, 1,
-0.06149405, 0.6098911, 2.547101, 0, 1, 0.9568627, 1,
-0.06134299, 1.705805, -0.6446431, 0, 1, 0.9647059, 1,
-0.06077911, -0.9968013, -3.040587, 0, 1, 0.9686275, 1,
-0.05774091, 0.0276031, 0.2925681, 0, 1, 0.9764706, 1,
-0.0569726, -0.13698, -2.657616, 0, 1, 0.9803922, 1,
-0.05366633, -0.4907873, -3.714396, 0, 1, 0.9882353, 1,
-0.0515736, -1.616276, -3.835091, 0, 1, 0.9921569, 1,
-0.04705265, -2.110812, -3.189023, 0, 1, 1, 1,
-0.04692508, 0.6312064, -0.5390359, 0, 0.9921569, 1, 1,
-0.04679498, 0.7460608, 0.4425773, 0, 0.9882353, 1, 1,
-0.04507078, -0.03773756, -2.838464, 0, 0.9803922, 1, 1,
-0.0342182, 0.2975659, 1.197034, 0, 0.9764706, 1, 1,
-0.03190285, 0.03316121, -0.03518282, 0, 0.9686275, 1, 1,
-0.02858364, -1.188102, -3.959748, 0, 0.9647059, 1, 1,
-0.02663957, 1.615741, -1.235525, 0, 0.9568627, 1, 1,
-0.02535491, 1.657905, -0.01358701, 0, 0.9529412, 1, 1,
-0.02505086, -0.0468832, -3.028087, 0, 0.945098, 1, 1,
-0.02297502, 0.2967067, -0.03942958, 0, 0.9411765, 1, 1,
-0.02128213, -1.122346, -3.542785, 0, 0.9333333, 1, 1,
-0.01825255, 1.025643, -2.072849, 0, 0.9294118, 1, 1,
-0.01823153, -0.9018559, -3.926458, 0, 0.9215686, 1, 1,
-0.01462825, -0.5511799, -4.248981, 0, 0.9176471, 1, 1,
-0.009037853, 0.8414848, 0.6650237, 0, 0.9098039, 1, 1,
-0.007775558, 0.5848134, 0.02616579, 0, 0.9058824, 1, 1,
-0.006837956, -0.9947349, -2.668232, 0, 0.8980392, 1, 1,
-0.00671916, -0.5766812, -3.947808, 0, 0.8901961, 1, 1,
-0.003431934, 0.7977781, -0.2996299, 0, 0.8862745, 1, 1,
0.003354966, -1.171809, 3.102173, 0, 0.8784314, 1, 1,
0.006148205, 1.511205, 0.1743695, 0, 0.8745098, 1, 1,
0.01020168, 1.654345, 1.392364, 0, 0.8666667, 1, 1,
0.01384486, 0.2570162, 1.308042, 0, 0.8627451, 1, 1,
0.01895309, 1.303117, -0.482787, 0, 0.854902, 1, 1,
0.02546586, 1.296253, 0.2702304, 0, 0.8509804, 1, 1,
0.0261436, -0.5448076, 2.965574, 0, 0.8431373, 1, 1,
0.03221779, -0.1746286, 3.617873, 0, 0.8392157, 1, 1,
0.03528353, -0.3072718, 3.106982, 0, 0.8313726, 1, 1,
0.03912051, -0.2819581, 2.670413, 0, 0.827451, 1, 1,
0.04633097, 0.5334769, -0.674205, 0, 0.8196079, 1, 1,
0.04937945, 1.189444, 1.60498, 0, 0.8156863, 1, 1,
0.05107391, -0.5071396, 2.307489, 0, 0.8078431, 1, 1,
0.05302801, -0.5519816, 3.075716, 0, 0.8039216, 1, 1,
0.05633167, 1.434896, -0.2667053, 0, 0.7960784, 1, 1,
0.05771881, 1.14468, 1.97276, 0, 0.7882353, 1, 1,
0.0600134, 2.319798, -1.127343, 0, 0.7843137, 1, 1,
0.06186649, 0.7304705, 0.463074, 0, 0.7764706, 1, 1,
0.06201237, -0.5318038, 2.103326, 0, 0.772549, 1, 1,
0.06423153, -1.062239, 2.816766, 0, 0.7647059, 1, 1,
0.06555418, -0.325358, 3.361372, 0, 0.7607843, 1, 1,
0.07162216, -1.997231, 1.862338, 0, 0.7529412, 1, 1,
0.07380209, 0.7789906, 0.4726259, 0, 0.7490196, 1, 1,
0.07725099, -1.345626, 3.32463, 0, 0.7411765, 1, 1,
0.07837345, 1.292015, 1.278219, 0, 0.7372549, 1, 1,
0.07873237, -0.0440363, 3.257585, 0, 0.7294118, 1, 1,
0.09549978, -1.780794, 1.289893, 0, 0.7254902, 1, 1,
0.09601574, -0.5964548, 2.276581, 0, 0.7176471, 1, 1,
0.1031918, -1.088449, 4.334403, 0, 0.7137255, 1, 1,
0.1156358, -1.782376, 1.699041, 0, 0.7058824, 1, 1,
0.1157702, -0.2357318, 1.936579, 0, 0.6980392, 1, 1,
0.1165301, 0.6715292, 0.4624701, 0, 0.6941177, 1, 1,
0.1173716, -0.3077842, 4.195035, 0, 0.6862745, 1, 1,
0.1221699, -1.756866, 3.615263, 0, 0.682353, 1, 1,
0.124755, 0.9199702, -0.8986562, 0, 0.6745098, 1, 1,
0.1289074, -0.3949952, 2.890895, 0, 0.6705883, 1, 1,
0.1307566, -1.138074, 4.155132, 0, 0.6627451, 1, 1,
0.1310041, 0.3843103, -1.074593, 0, 0.6588235, 1, 1,
0.1314831, -1.102315, 2.764907, 0, 0.6509804, 1, 1,
0.1354653, -0.5420642, 3.295451, 0, 0.6470588, 1, 1,
0.1366972, 0.6446794, 1.718933, 0, 0.6392157, 1, 1,
0.1368786, 0.9002647, -0.4449226, 0, 0.6352941, 1, 1,
0.1417613, -2.612098, 2.737892, 0, 0.627451, 1, 1,
0.1427444, 0.1775334, 0.2681467, 0, 0.6235294, 1, 1,
0.1450679, -0.3727666, 3.47764, 0, 0.6156863, 1, 1,
0.1485336, 0.1920427, 0.08662801, 0, 0.6117647, 1, 1,
0.1491447, 1.018785, 2.020833, 0, 0.6039216, 1, 1,
0.1502391, -1.739431, 4.495648, 0, 0.5960785, 1, 1,
0.1532002, -0.5099155, 0.7874908, 0, 0.5921569, 1, 1,
0.154371, -0.195359, 2.314493, 0, 0.5843138, 1, 1,
0.1545682, 0.7221646, -0.4086332, 0, 0.5803922, 1, 1,
0.1565, -0.02954519, 2.31672, 0, 0.572549, 1, 1,
0.1575734, 0.6291983, -1.87463, 0, 0.5686275, 1, 1,
0.1615498, -0.6772715, 1.551036, 0, 0.5607843, 1, 1,
0.1659057, 0.9347111, -0.4341369, 0, 0.5568628, 1, 1,
0.1699947, 1.139128, 0.8787515, 0, 0.5490196, 1, 1,
0.1727458, 0.64217, -0.1555007, 0, 0.5450981, 1, 1,
0.1732928, 2.040746, 0.305339, 0, 0.5372549, 1, 1,
0.1798601, 2.590142, -0.1850208, 0, 0.5333334, 1, 1,
0.1813358, 0.9097572, 0.4377449, 0, 0.5254902, 1, 1,
0.1878503, 0.4870371, 1.114814, 0, 0.5215687, 1, 1,
0.1893073, -0.6208917, 1.908642, 0, 0.5137255, 1, 1,
0.1929234, -0.09154443, 1.738996, 0, 0.509804, 1, 1,
0.1935094, 0.8375165, 1.307417, 0, 0.5019608, 1, 1,
0.194243, -0.6286144, 4.097874, 0, 0.4941176, 1, 1,
0.1976027, 0.3340865, 0.08290967, 0, 0.4901961, 1, 1,
0.2124904, -0.6571684, 1.059234, 0, 0.4823529, 1, 1,
0.2136016, -1.979367, 2.587288, 0, 0.4784314, 1, 1,
0.2147429, 0.7485507, 0.9246491, 0, 0.4705882, 1, 1,
0.2218739, -0.3942877, 1.916564, 0, 0.4666667, 1, 1,
0.2239694, 0.1419165, 0.6630233, 0, 0.4588235, 1, 1,
0.2289666, -1.21821, 2.487041, 0, 0.454902, 1, 1,
0.2302824, -1.106691, 1.908139, 0, 0.4470588, 1, 1,
0.2321048, -0.7793842, 4.1484, 0, 0.4431373, 1, 1,
0.2331759, -0.3421784, 3.771505, 0, 0.4352941, 1, 1,
0.2339496, 0.4122756, 2.048614, 0, 0.4313726, 1, 1,
0.246319, 0.1526491, 1.78547, 0, 0.4235294, 1, 1,
0.2572227, 1.068229, 1.802979, 0, 0.4196078, 1, 1,
0.259001, -1.137529, 2.327864, 0, 0.4117647, 1, 1,
0.2594383, 0.1321694, 2.982245, 0, 0.4078431, 1, 1,
0.2604098, -1.96168, 4.243485, 0, 0.4, 1, 1,
0.2643583, -1.256033, 2.445287, 0, 0.3921569, 1, 1,
0.2645057, 0.2136305, 1.780947, 0, 0.3882353, 1, 1,
0.2653443, -0.3363629, 4.049456, 0, 0.3803922, 1, 1,
0.2676643, -0.9496603, 2.681942, 0, 0.3764706, 1, 1,
0.2677879, 0.1142448, 1.366721, 0, 0.3686275, 1, 1,
0.269815, -1.819976, 3.441261, 0, 0.3647059, 1, 1,
0.2706419, -1.029463, 4.519658, 0, 0.3568628, 1, 1,
0.2745006, 1.021625, 0.2684871, 0, 0.3529412, 1, 1,
0.2745297, -0.3684766, 3.930634, 0, 0.345098, 1, 1,
0.2762876, -1.631424, 3.73234, 0, 0.3411765, 1, 1,
0.2816723, -1.228114, 3.438061, 0, 0.3333333, 1, 1,
0.2836488, -0.2584749, 2.022395, 0, 0.3294118, 1, 1,
0.288341, -0.04725942, 1.507048, 0, 0.3215686, 1, 1,
0.2952586, 0.7756882, -1.669804, 0, 0.3176471, 1, 1,
0.3113557, 0.4462998, -0.3652928, 0, 0.3098039, 1, 1,
0.3122815, 1.092311, 1.119565, 0, 0.3058824, 1, 1,
0.3154089, 1.187703, -0.3082, 0, 0.2980392, 1, 1,
0.33, -0.2734861, 1.959543, 0, 0.2901961, 1, 1,
0.3396457, -1.846719, 3.166777, 0, 0.2862745, 1, 1,
0.3423821, -0.6238723, 2.789439, 0, 0.2784314, 1, 1,
0.3444213, 0.1061224, 0.8714797, 0, 0.2745098, 1, 1,
0.3482563, -1.048593, 3.16418, 0, 0.2666667, 1, 1,
0.3488473, -1.480292, 3.176111, 0, 0.2627451, 1, 1,
0.3535278, -2.443693, 2.767065, 0, 0.254902, 1, 1,
0.3538336, 0.7160612, 1.640899, 0, 0.2509804, 1, 1,
0.3543802, 0.3916236, 2.333315, 0, 0.2431373, 1, 1,
0.3594074, 1.614476, 0.4154038, 0, 0.2392157, 1, 1,
0.3625991, 1.827051, 0.5024098, 0, 0.2313726, 1, 1,
0.3656455, 0.4352595, 0.631826, 0, 0.227451, 1, 1,
0.3687744, 0.9410201, 0.5351581, 0, 0.2196078, 1, 1,
0.3705712, -0.39387, 3.166973, 0, 0.2156863, 1, 1,
0.3711418, 1.678995, -0.309748, 0, 0.2078431, 1, 1,
0.3713212, 0.9930378, 0.6092108, 0, 0.2039216, 1, 1,
0.372456, -0.4551436, 3.305337, 0, 0.1960784, 1, 1,
0.3732729, 1.225866, 0.3923099, 0, 0.1882353, 1, 1,
0.3737496, 0.1060233, 0.610018, 0, 0.1843137, 1, 1,
0.3753197, 0.2143498, -0.1348517, 0, 0.1764706, 1, 1,
0.3753365, 0.8728277, 1.054593, 0, 0.172549, 1, 1,
0.377864, 0.2218859, 1.850805, 0, 0.1647059, 1, 1,
0.3802919, 1.135072, 0.6736749, 0, 0.1607843, 1, 1,
0.3828788, 1.351702, 1.662621, 0, 0.1529412, 1, 1,
0.3836142, -1.882246, 3.895459, 0, 0.1490196, 1, 1,
0.3860556, 0.3040355, 1.05543, 0, 0.1411765, 1, 1,
0.3866894, -1.396412, 5.964012, 0, 0.1372549, 1, 1,
0.3896328, -0.2076919, 1.750345, 0, 0.1294118, 1, 1,
0.3905486, 0.475683, 0.8124669, 0, 0.1254902, 1, 1,
0.40231, 0.07347018, 1.588438, 0, 0.1176471, 1, 1,
0.4040573, -1.107353, 3.757077, 0, 0.1137255, 1, 1,
0.4041333, 1.036284, 1.304786, 0, 0.1058824, 1, 1,
0.4043048, -0.3357915, 0.8677104, 0, 0.09803922, 1, 1,
0.4126334, -1.156386, 2.51674, 0, 0.09411765, 1, 1,
0.4136761, -1.073576, 2.911154, 0, 0.08627451, 1, 1,
0.4137285, -0.9663156, 2.046005, 0, 0.08235294, 1, 1,
0.4150585, -1.258007, 4.408268, 0, 0.07450981, 1, 1,
0.4201175, 1.749425, 0.1259485, 0, 0.07058824, 1, 1,
0.42101, -1.496771, 3.439054, 0, 0.0627451, 1, 1,
0.4254933, 0.03559656, 1.083673, 0, 0.05882353, 1, 1,
0.426848, 0.5887141, 0.3542024, 0, 0.05098039, 1, 1,
0.4289524, 0.8487304, 0.3166659, 0, 0.04705882, 1, 1,
0.4358454, -1.378246, 2.572213, 0, 0.03921569, 1, 1,
0.4376082, -0.7922477, 2.679568, 0, 0.03529412, 1, 1,
0.4435171, -0.677738, 3.555115, 0, 0.02745098, 1, 1,
0.4454499, 0.2982588, 0.8900845, 0, 0.02352941, 1, 1,
0.4505968, -0.2417758, 1.513689, 0, 0.01568628, 1, 1,
0.4515514, -0.462682, 3.444953, 0, 0.01176471, 1, 1,
0.4516006, 1.148713, 1.058508, 0, 0.003921569, 1, 1,
0.4531836, -0.09506813, 2.161849, 0.003921569, 0, 1, 1,
0.4570125, -1.90827, 2.824403, 0.007843138, 0, 1, 1,
0.4573599, 0.868933, 0.06099989, 0.01568628, 0, 1, 1,
0.4636727, 0.009801018, 1.147147, 0.01960784, 0, 1, 1,
0.4657913, -1.179002, 5.112498, 0.02745098, 0, 1, 1,
0.4675769, 0.4192628, 2.302019, 0.03137255, 0, 1, 1,
0.4690697, -0.3413269, 3.545622, 0.03921569, 0, 1, 1,
0.4694971, 0.7685425, 1.761699, 0.04313726, 0, 1, 1,
0.4723839, 1.407807, -1.268526, 0.05098039, 0, 1, 1,
0.4794954, -0.427319, 2.143824, 0.05490196, 0, 1, 1,
0.4797024, -0.3898696, 2.099067, 0.0627451, 0, 1, 1,
0.4843237, -0.1970546, 2.487205, 0.06666667, 0, 1, 1,
0.48503, 2.03507, 0.9048472, 0.07450981, 0, 1, 1,
0.487734, -0.06696631, 2.203986, 0.07843138, 0, 1, 1,
0.4892953, 0.1337862, 1.259569, 0.08627451, 0, 1, 1,
0.4955049, 1.129495, -1.276616, 0.09019608, 0, 1, 1,
0.4961901, 0.9269882, 0.8955195, 0.09803922, 0, 1, 1,
0.4985634, 1.466706, 0.5675274, 0.1058824, 0, 1, 1,
0.4990796, 1.159847, 0.2961586, 0.1098039, 0, 1, 1,
0.5008395, -0.2270803, 1.576537, 0.1176471, 0, 1, 1,
0.5048435, -0.1383384, 2.446674, 0.1215686, 0, 1, 1,
0.5157788, -0.2235414, 3.430475, 0.1294118, 0, 1, 1,
0.5169701, -0.05610707, 2.372002, 0.1333333, 0, 1, 1,
0.5179738, -0.7497487, 0.7847478, 0.1411765, 0, 1, 1,
0.5281861, 1.523924, 2.532297, 0.145098, 0, 1, 1,
0.5287852, -1.506011, 1.600629, 0.1529412, 0, 1, 1,
0.535845, -1.013608, 3.749086, 0.1568628, 0, 1, 1,
0.5375637, 0.4718593, 2.522023, 0.1647059, 0, 1, 1,
0.5390612, 0.5613444, 0.08215021, 0.1686275, 0, 1, 1,
0.5404264, -1.113697, 2.015442, 0.1764706, 0, 1, 1,
0.5429963, -1.015587, 1.770411, 0.1803922, 0, 1, 1,
0.5451245, -0.4654801, 2.074064, 0.1882353, 0, 1, 1,
0.5509962, -2.684183, 3.00536, 0.1921569, 0, 1, 1,
0.5558304, 0.3099733, 0.4489821, 0.2, 0, 1, 1,
0.5584515, -1.535017, 3.033965, 0.2078431, 0, 1, 1,
0.5656232, -1.464267, 2.180632, 0.2117647, 0, 1, 1,
0.5662376, 1.094598, 0.3599327, 0.2196078, 0, 1, 1,
0.5671418, 0.3521424, 0.2513972, 0.2235294, 0, 1, 1,
0.567364, 1.656459, -0.4919257, 0.2313726, 0, 1, 1,
0.5685346, 0.3024852, 2.0019, 0.2352941, 0, 1, 1,
0.5713235, -1.197063, 3.524378, 0.2431373, 0, 1, 1,
0.5748199, 1.001226, 1.059799, 0.2470588, 0, 1, 1,
0.5749122, 0.4988875, 1.607538, 0.254902, 0, 1, 1,
0.5760095, -0.0751126, 3.282738, 0.2588235, 0, 1, 1,
0.5766148, -1.077087, 2.544115, 0.2666667, 0, 1, 1,
0.5766435, -2.516238, 3.556224, 0.2705882, 0, 1, 1,
0.5771179, 1.307383, -0.3664772, 0.2784314, 0, 1, 1,
0.5779321, -0.9890642, 2.190137, 0.282353, 0, 1, 1,
0.5801678, -0.2564425, 1.524116, 0.2901961, 0, 1, 1,
0.5857063, 0.3639464, 0.9811527, 0.2941177, 0, 1, 1,
0.586652, 1.923599, -1.319051, 0.3019608, 0, 1, 1,
0.5909557, 0.6767102, 1.469132, 0.3098039, 0, 1, 1,
0.5928709, -0.3566727, 3.464191, 0.3137255, 0, 1, 1,
0.6026614, 0.2877223, 1.025961, 0.3215686, 0, 1, 1,
0.6052933, 1.055527, 0.4811248, 0.3254902, 0, 1, 1,
0.6133191, -0.625008, 3.339143, 0.3333333, 0, 1, 1,
0.6161649, 0.2139918, 0.7910944, 0.3372549, 0, 1, 1,
0.6284819, 1.600645, -0.01917106, 0.345098, 0, 1, 1,
0.63332, -0.3298476, 2.827667, 0.3490196, 0, 1, 1,
0.6377327, -0.06723034, 2.130121, 0.3568628, 0, 1, 1,
0.6460261, -0.5520446, 2.320149, 0.3607843, 0, 1, 1,
0.6461962, -0.6133167, 2.547175, 0.3686275, 0, 1, 1,
0.6466543, -0.1267418, 1.166934, 0.372549, 0, 1, 1,
0.6503403, -1.761773, 1.604566, 0.3803922, 0, 1, 1,
0.6544479, -0.4884312, 2.193736, 0.3843137, 0, 1, 1,
0.6577501, -2.144532, 2.5264, 0.3921569, 0, 1, 1,
0.6579226, 1.144317, 0.1548354, 0.3960784, 0, 1, 1,
0.6588403, -1.433495, 2.117724, 0.4039216, 0, 1, 1,
0.6608073, 0.1500801, 1.022728, 0.4117647, 0, 1, 1,
0.6620491, 0.9832812, -0.01472701, 0.4156863, 0, 1, 1,
0.6641638, -1.594971, 4.102451, 0.4235294, 0, 1, 1,
0.6760538, -0.2418567, 1.388963, 0.427451, 0, 1, 1,
0.6783547, -1.758199, 2.303483, 0.4352941, 0, 1, 1,
0.6823611, -0.6018158, 2.520447, 0.4392157, 0, 1, 1,
0.6891483, -3.124455, 3.915718, 0.4470588, 0, 1, 1,
0.6912208, 1.633899, -0.4044155, 0.4509804, 0, 1, 1,
0.6932924, 0.5932373, -0.08608868, 0.4588235, 0, 1, 1,
0.7002373, -1.430398, 2.550811, 0.4627451, 0, 1, 1,
0.7020635, -0.7997302, 2.549564, 0.4705882, 0, 1, 1,
0.7146088, 0.7362806, -0.6185865, 0.4745098, 0, 1, 1,
0.7166217, -0.3036782, 1.237999, 0.4823529, 0, 1, 1,
0.7194429, 0.329964, 2.326392, 0.4862745, 0, 1, 1,
0.7223875, -0.08861847, 1.440813, 0.4941176, 0, 1, 1,
0.7235329, 0.249708, 1.294628, 0.5019608, 0, 1, 1,
0.723592, 0.8010383, 1.490969, 0.5058824, 0, 1, 1,
0.7242952, 0.5200154, 1.638096, 0.5137255, 0, 1, 1,
0.7271249, -1.080834, 3.569913, 0.5176471, 0, 1, 1,
0.7286611, -0.05322872, 2.190718, 0.5254902, 0, 1, 1,
0.7289592, 2.126403, -0.7389159, 0.5294118, 0, 1, 1,
0.7337881, -0.558516, 1.995066, 0.5372549, 0, 1, 1,
0.7339293, 0.2779082, 2.723868, 0.5411765, 0, 1, 1,
0.7354437, -0.0682677, 1.602093, 0.5490196, 0, 1, 1,
0.7357512, 0.1096508, 2.017021, 0.5529412, 0, 1, 1,
0.7375048, -0.2993986, 2.069132, 0.5607843, 0, 1, 1,
0.7378471, -0.3503672, 0.8111928, 0.5647059, 0, 1, 1,
0.7498213, 0.3679222, -1.326401, 0.572549, 0, 1, 1,
0.7512229, -0.5596901, 0.7129956, 0.5764706, 0, 1, 1,
0.7537763, 0.536513, -0.5349694, 0.5843138, 0, 1, 1,
0.755272, 0.1910404, -0.4648602, 0.5882353, 0, 1, 1,
0.7586952, -0.3883063, 2.411268, 0.5960785, 0, 1, 1,
0.7649611, -0.09131509, 2.027763, 0.6039216, 0, 1, 1,
0.7698643, -1.114191, 2.719311, 0.6078432, 0, 1, 1,
0.7699524, 1.449064, -0.4360645, 0.6156863, 0, 1, 1,
0.7720695, 0.3563945, 0.4610402, 0.6196079, 0, 1, 1,
0.7733576, 3.262016, 0.0128271, 0.627451, 0, 1, 1,
0.7738585, -0.4079727, 2.714153, 0.6313726, 0, 1, 1,
0.7743624, 0.4781107, 2.092962, 0.6392157, 0, 1, 1,
0.7797529, 0.7099463, 1.039516, 0.6431373, 0, 1, 1,
0.7930601, -0.3804911, 0.9990109, 0.6509804, 0, 1, 1,
0.799575, 0.4276311, 0.9788339, 0.654902, 0, 1, 1,
0.8063153, -0.2021584, 4.369214, 0.6627451, 0, 1, 1,
0.8155242, -0.6022418, 1.269093, 0.6666667, 0, 1, 1,
0.8279424, -0.6563392, 1.49704, 0.6745098, 0, 1, 1,
0.8327934, -0.1053354, 1.719731, 0.6784314, 0, 1, 1,
0.8343723, 1.550741, 3.205744, 0.6862745, 0, 1, 1,
0.8386807, 0.07285155, 1.36551, 0.6901961, 0, 1, 1,
0.8428729, 0.8816702, 1.458917, 0.6980392, 0, 1, 1,
0.8431888, 0.7287167, 0.0724213, 0.7058824, 0, 1, 1,
0.8454587, -1.906855, 2.672266, 0.7098039, 0, 1, 1,
0.8473033, 0.2950869, 1.89707, 0.7176471, 0, 1, 1,
0.8501129, -1.273658, 3.216376, 0.7215686, 0, 1, 1,
0.8511859, -1.669394, 2.275093, 0.7294118, 0, 1, 1,
0.8521783, -0.02309634, 2.059556, 0.7333333, 0, 1, 1,
0.8555338, -0.755038, 1.480664, 0.7411765, 0, 1, 1,
0.8566061, -0.1380764, 0.6249167, 0.7450981, 0, 1, 1,
0.8586609, 0.7675963, 0.3231967, 0.7529412, 0, 1, 1,
0.8644093, -0.1279335, 3.427325, 0.7568628, 0, 1, 1,
0.8720726, 0.320628, 2.617779, 0.7647059, 0, 1, 1,
0.8757216, -1.02201, 2.134354, 0.7686275, 0, 1, 1,
0.8805545, 0.7207296, 1.427252, 0.7764706, 0, 1, 1,
0.8829821, -1.001522, 1.772719, 0.7803922, 0, 1, 1,
0.886871, 1.120131, 0.549822, 0.7882353, 0, 1, 1,
0.8902087, -0.5156553, 1.569417, 0.7921569, 0, 1, 1,
0.9033443, -0.2503357, 0.3486354, 0.8, 0, 1, 1,
0.9094297, -0.6533592, 3.271544, 0.8078431, 0, 1, 1,
0.9143341, -1.992482, 3.439123, 0.8117647, 0, 1, 1,
0.9144036, -0.3183921, 1.375316, 0.8196079, 0, 1, 1,
0.9165782, -0.4790556, 3.020124, 0.8235294, 0, 1, 1,
0.9180578, -0.3152831, 2.194702, 0.8313726, 0, 1, 1,
0.9189564, -0.5357685, 1.858803, 0.8352941, 0, 1, 1,
0.9202229, 1.801269, 0.6057802, 0.8431373, 0, 1, 1,
0.9210218, 1.067585, 0.460367, 0.8470588, 0, 1, 1,
0.9296663, -0.3186575, 2.419025, 0.854902, 0, 1, 1,
0.9308777, -0.5811476, 0.7267646, 0.8588235, 0, 1, 1,
0.9330382, -0.5830124, 3.607689, 0.8666667, 0, 1, 1,
0.9382566, -0.3565808, 2.531883, 0.8705882, 0, 1, 1,
0.9429284, -0.2061503, 1.10424, 0.8784314, 0, 1, 1,
0.9518695, -0.1946412, 0.5305166, 0.8823529, 0, 1, 1,
0.955142, 0.5541257, 0.7366267, 0.8901961, 0, 1, 1,
0.956692, 1.288827, -0.1322861, 0.8941177, 0, 1, 1,
0.9639605, -1.042036, 2.15612, 0.9019608, 0, 1, 1,
0.9719523, 0.5927896, 2.173496, 0.9098039, 0, 1, 1,
0.9766325, 1.514187, -0.1536691, 0.9137255, 0, 1, 1,
0.9770624, 0.4400803, 1.25781, 0.9215686, 0, 1, 1,
0.9873166, -0.8756882, 3.869157, 0.9254902, 0, 1, 1,
0.9929907, 0.0896285, 1.014642, 0.9333333, 0, 1, 1,
0.9955344, 0.2786706, 0.6079323, 0.9372549, 0, 1, 1,
0.9969009, 0.2155829, 1.955778, 0.945098, 0, 1, 1,
1.001972, 1.286788, 0.8798267, 0.9490196, 0, 1, 1,
1.002251, 0.978716, -0.8380117, 0.9568627, 0, 1, 1,
1.006966, -0.2002214, 2.687673, 0.9607843, 0, 1, 1,
1.022231, -0.6679958, 1.444329, 0.9686275, 0, 1, 1,
1.022791, 0.65034, 1.949093, 0.972549, 0, 1, 1,
1.02441, 0.02717483, 1.629585, 0.9803922, 0, 1, 1,
1.024457, -1.330405, 3.043411, 0.9843137, 0, 1, 1,
1.030863, -1.19579, 3.203723, 0.9921569, 0, 1, 1,
1.031583, 0.3570745, 0.8558037, 0.9960784, 0, 1, 1,
1.035699, 1.56229, 0.5766718, 1, 0, 0.9960784, 1,
1.038937, 1.028593, 1.326192, 1, 0, 0.9882353, 1,
1.041068, -0.1194021, 1.174538, 1, 0, 0.9843137, 1,
1.042688, 0.1217192, 1.6006, 1, 0, 0.9764706, 1,
1.044842, 0.7192131, 2.483209, 1, 0, 0.972549, 1,
1.052981, -0.4769396, 1.568039, 1, 0, 0.9647059, 1,
1.056207, -2.479266, 2.701127, 1, 0, 0.9607843, 1,
1.069021, 0.6681898, 0.9179783, 1, 0, 0.9529412, 1,
1.075398, -0.1160174, 0.8722076, 1, 0, 0.9490196, 1,
1.079586, -1.525789, 3.018054, 1, 0, 0.9411765, 1,
1.080186, -0.1385818, 2.780727, 1, 0, 0.9372549, 1,
1.082185, -1.116193, 2.679034, 1, 0, 0.9294118, 1,
1.085787, 1.268786, 1.930276, 1, 0, 0.9254902, 1,
1.089727, 1.265901, 1.696766, 1, 0, 0.9176471, 1,
1.091253, -1.14924, 3.317148, 1, 0, 0.9137255, 1,
1.094386, 0.381198, 0.675082, 1, 0, 0.9058824, 1,
1.095824, -1.220006, 2.838321, 1, 0, 0.9019608, 1,
1.10322, -0.9596287, 2.566611, 1, 0, 0.8941177, 1,
1.105638, -1.023749, 3.230345, 1, 0, 0.8862745, 1,
1.108406, 2.180542, 0.9896366, 1, 0, 0.8823529, 1,
1.116536, -0.5604872, 2.704105, 1, 0, 0.8745098, 1,
1.131029, 1.688684, -0.87348, 1, 0, 0.8705882, 1,
1.131592, -1.079018, 1.115703, 1, 0, 0.8627451, 1,
1.137041, 0.3973453, 1.931529, 1, 0, 0.8588235, 1,
1.145308, 1.147097, 2.034824, 1, 0, 0.8509804, 1,
1.153621, -0.7793723, 2.76432, 1, 0, 0.8470588, 1,
1.154345, -0.6259216, 2.63871, 1, 0, 0.8392157, 1,
1.15651, -0.2031132, 1.274039, 1, 0, 0.8352941, 1,
1.156781, -1.049261, 3.096358, 1, 0, 0.827451, 1,
1.158769, 2.180767, 0.06350518, 1, 0, 0.8235294, 1,
1.158802, -1.295548, 2.005265, 1, 0, 0.8156863, 1,
1.162204, 0.4452692, 0.8528029, 1, 0, 0.8117647, 1,
1.179236, 1.336021, -0.5570154, 1, 0, 0.8039216, 1,
1.183855, -0.2627791, 3.059712, 1, 0, 0.7960784, 1,
1.18394, -2.31426, 3.626806, 1, 0, 0.7921569, 1,
1.186223, 1.14387, 0.1640243, 1, 0, 0.7843137, 1,
1.190776, 1.189778, 1.415011, 1, 0, 0.7803922, 1,
1.202971, -0.6650066, 1.337236, 1, 0, 0.772549, 1,
1.205248, -0.1554022, 1.195252, 1, 0, 0.7686275, 1,
1.214515, 0.8780184, 2.128015, 1, 0, 0.7607843, 1,
1.2164, -0.6260049, 2.1449, 1, 0, 0.7568628, 1,
1.216832, -0.5915487, 0.9706343, 1, 0, 0.7490196, 1,
1.222756, 0.07399172, -0.402194, 1, 0, 0.7450981, 1,
1.224, 0.9693995, 0.5749646, 1, 0, 0.7372549, 1,
1.228779, -0.5193381, 2.279448, 1, 0, 0.7333333, 1,
1.230659, 0.5262027, 2.292088, 1, 0, 0.7254902, 1,
1.23556, -0.4417933, 0.8065844, 1, 0, 0.7215686, 1,
1.240096, -0.4208627, 1.793383, 1, 0, 0.7137255, 1,
1.246305, 0.4039516, 3.148633, 1, 0, 0.7098039, 1,
1.246691, 1.468783, -1.008377, 1, 0, 0.7019608, 1,
1.252718, 2.026794, 0.1099894, 1, 0, 0.6941177, 1,
1.255182, -0.1298893, 3.315126, 1, 0, 0.6901961, 1,
1.257445, 0.3435579, 1.374049, 1, 0, 0.682353, 1,
1.259262, -1.161487, 2.209698, 1, 0, 0.6784314, 1,
1.260908, -0.6514139, -0.008347563, 1, 0, 0.6705883, 1,
1.262035, -0.06186314, 2.626107, 1, 0, 0.6666667, 1,
1.265637, 0.5922126, 1.393927, 1, 0, 0.6588235, 1,
1.274833, -0.08640445, 2.535499, 1, 0, 0.654902, 1,
1.278223, 0.7731461, 0.8034276, 1, 0, 0.6470588, 1,
1.279205, -0.01127776, 1.278466, 1, 0, 0.6431373, 1,
1.295101, -0.479078, 1.845011, 1, 0, 0.6352941, 1,
1.300952, 0.5273818, 1.354956, 1, 0, 0.6313726, 1,
1.306504, 1.404684, 2.189896, 1, 0, 0.6235294, 1,
1.310867, -0.8192323, 1.086233, 1, 0, 0.6196079, 1,
1.312092, 1.067041, 2.254435, 1, 0, 0.6117647, 1,
1.315551, 0.512839, 1.070875, 1, 0, 0.6078432, 1,
1.318055, 1.082243, -0.5943814, 1, 0, 0.6, 1,
1.318386, -0.4806104, 2.723045, 1, 0, 0.5921569, 1,
1.324577, -1.212407, 3.661072, 1, 0, 0.5882353, 1,
1.334279, 0.5592859, 1.194695, 1, 0, 0.5803922, 1,
1.336579, 1.062473, 1.394773, 1, 0, 0.5764706, 1,
1.336637, -0.523092, 1.748484, 1, 0, 0.5686275, 1,
1.338504, -0.07219594, 2.315712, 1, 0, 0.5647059, 1,
1.339825, -0.6989232, 0.2337888, 1, 0, 0.5568628, 1,
1.343113, -1.850759, 2.013085, 1, 0, 0.5529412, 1,
1.347783, -0.4499673, 1.199262, 1, 0, 0.5450981, 1,
1.358116, 0.4484162, 0.7278247, 1, 0, 0.5411765, 1,
1.361306, 1.415149, 1.435089, 1, 0, 0.5333334, 1,
1.369036, 0.9188855, 0.8268747, 1, 0, 0.5294118, 1,
1.377787, -0.05971693, 2.096056, 1, 0, 0.5215687, 1,
1.382336, -0.3360566, 3.491009, 1, 0, 0.5176471, 1,
1.386293, 0.5387297, -0.4836389, 1, 0, 0.509804, 1,
1.389478, 0.7150313, 2.031756, 1, 0, 0.5058824, 1,
1.394178, -0.07868942, 2.331121, 1, 0, 0.4980392, 1,
1.418253, -0.3747398, 0.2241925, 1, 0, 0.4901961, 1,
1.436235, -0.07025515, 2.82801, 1, 0, 0.4862745, 1,
1.448889, -0.229213, 1.588666, 1, 0, 0.4784314, 1,
1.450277, 0.1994124, 0.3053609, 1, 0, 0.4745098, 1,
1.45342, 0.5358763, 0.5207738, 1, 0, 0.4666667, 1,
1.459094, 0.2204106, 0.7081518, 1, 0, 0.4627451, 1,
1.469512, 0.2958963, 2.370288, 1, 0, 0.454902, 1,
1.469736, 0.9479204, 0.3151799, 1, 0, 0.4509804, 1,
1.470544, -0.8432671, 0.6664403, 1, 0, 0.4431373, 1,
1.479435, 1.14033, 2.260975, 1, 0, 0.4392157, 1,
1.494733, -0.2589342, 0.9985569, 1, 0, 0.4313726, 1,
1.496429, 0.791056, 0.2821678, 1, 0, 0.427451, 1,
1.497449, -0.4576161, 2.425622, 1, 0, 0.4196078, 1,
1.520178, -0.5644778, 2.357777, 1, 0, 0.4156863, 1,
1.52451, 0.06780912, 3.866249, 1, 0, 0.4078431, 1,
1.524682, -0.6341003, 2.390328, 1, 0, 0.4039216, 1,
1.525846, -1.436678, 1.912777, 1, 0, 0.3960784, 1,
1.534692, -1.477215, 3.739022, 1, 0, 0.3882353, 1,
1.53591, 0.8274722, 0.8986992, 1, 0, 0.3843137, 1,
1.538326, 1.563029, 0.4658448, 1, 0, 0.3764706, 1,
1.546446, -1.582309, 4.414775, 1, 0, 0.372549, 1,
1.552049, 0.6107211, -0.9135233, 1, 0, 0.3647059, 1,
1.554126, -0.4551013, 2.407323, 1, 0, 0.3607843, 1,
1.55675, 0.1625643, 1.716971, 1, 0, 0.3529412, 1,
1.557392, 0.1676673, 1.508045, 1, 0, 0.3490196, 1,
1.568587, -3.039091, 4.166011, 1, 0, 0.3411765, 1,
1.581739, -0.1669162, -0.4340928, 1, 0, 0.3372549, 1,
1.581838, 0.01962628, 1.840112, 1, 0, 0.3294118, 1,
1.586505, 0.2268908, 2.806081, 1, 0, 0.3254902, 1,
1.586726, 0.2595331, 2.447842, 1, 0, 0.3176471, 1,
1.593927, -0.4023533, 0.9205958, 1, 0, 0.3137255, 1,
1.603518, 0.9108373, -0.2619416, 1, 0, 0.3058824, 1,
1.608028, -0.5881117, -0.7262225, 1, 0, 0.2980392, 1,
1.609897, -2.265636, 2.040359, 1, 0, 0.2941177, 1,
1.610456, -0.1928875, 2.539261, 1, 0, 0.2862745, 1,
1.620213, -0.1737358, 3.886327, 1, 0, 0.282353, 1,
1.635904, 0.8774952, 0.2778758, 1, 0, 0.2745098, 1,
1.648325, 0.869939, -0.08981591, 1, 0, 0.2705882, 1,
1.652919, 0.3950116, 0.5772544, 1, 0, 0.2627451, 1,
1.6651, 0.310946, 1.503881, 1, 0, 0.2588235, 1,
1.682492, 0.02725204, 1.084449, 1, 0, 0.2509804, 1,
1.683987, 1.932662, 1.945063, 1, 0, 0.2470588, 1,
1.706394, -0.02891428, 0.7667257, 1, 0, 0.2392157, 1,
1.718451, -1.943472, 0.7692686, 1, 0, 0.2352941, 1,
1.733965, 0.9695522, 1.116719, 1, 0, 0.227451, 1,
1.742726, 0.6969249, 1.472694, 1, 0, 0.2235294, 1,
1.747831, -0.5126129, 1.984875, 1, 0, 0.2156863, 1,
1.763001, 1.322281, 2.885578, 1, 0, 0.2117647, 1,
1.763273, 0.7027132, 0.4682025, 1, 0, 0.2039216, 1,
1.768032, 0.1096206, 1.886954, 1, 0, 0.1960784, 1,
1.768352, 1.048608, 0.2519839, 1, 0, 0.1921569, 1,
1.769683, 1.025404, 2.240132, 1, 0, 0.1843137, 1,
1.799379, 1.12489, -0.06704173, 1, 0, 0.1803922, 1,
1.820786, 0.2720837, 1.877293, 1, 0, 0.172549, 1,
1.830764, -0.2037448, 1.597409, 1, 0, 0.1686275, 1,
1.833557, 0.9067156, 0.5922312, 1, 0, 0.1607843, 1,
1.8386, 0.7586974, 1.649141, 1, 0, 0.1568628, 1,
1.87015, 0.2846478, 1.367903, 1, 0, 0.1490196, 1,
1.893149, -2.596244, 3.593474, 1, 0, 0.145098, 1,
1.898659, -0.7738289, 3.627094, 1, 0, 0.1372549, 1,
1.967789, 1.096008, -0.9009005, 1, 0, 0.1333333, 1,
1.978523, 1.154261, 1.321484, 1, 0, 0.1254902, 1,
2.018316, -0.5335013, 2.454179, 1, 0, 0.1215686, 1,
2.021104, 0.659119, 1.582893, 1, 0, 0.1137255, 1,
2.136987, 0.1521691, 0.2993844, 1, 0, 0.1098039, 1,
2.149726, -1.025006, 1.992314, 1, 0, 0.1019608, 1,
2.224063, -0.8345408, 0.6715328, 1, 0, 0.09411765, 1,
2.237164, -0.2852823, 1.881227, 1, 0, 0.09019608, 1,
2.262014, 0.1091436, 1.809405, 1, 0, 0.08235294, 1,
2.264576, 1.684434, 2.474174, 1, 0, 0.07843138, 1,
2.318694, -0.8568355, 0.7265801, 1, 0, 0.07058824, 1,
2.324335, -0.5027012, 2.260941, 1, 0, 0.06666667, 1,
2.342627, -0.8571354, 2.386974, 1, 0, 0.05882353, 1,
2.359564, 0.8800346, 0.8708478, 1, 0, 0.05490196, 1,
2.494283, 0.125093, 0.6356947, 1, 0, 0.04705882, 1,
2.499747, -0.04443169, 0.6981375, 1, 0, 0.04313726, 1,
2.542485, -0.5892157, 2.373546, 1, 0, 0.03529412, 1,
2.635428, -1.186721, 2.632534, 1, 0, 0.03137255, 1,
2.651395, 1.376013, 1.321772, 1, 0, 0.02352941, 1,
2.716937, 1.627324, 0.609382, 1, 0, 0.01960784, 1,
3.263607, 0.1647103, 1.044717, 1, 0, 0.01176471, 1,
3.376295, 0.5731139, 3.150101, 1, 0, 0.007843138, 1
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
-0.05183744, -4.569416, -7.250573, 0, -0.5, 0.5, 0.5,
-0.05183744, -4.569416, -7.250573, 1, -0.5, 0.5, 0.5,
-0.05183744, -4.569416, -7.250573, 1, 1.5, 0.5, 0.5,
-0.05183744, -4.569416, -7.250573, 0, 1.5, 0.5, 0.5
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
-4.642106, -0.08618021, -7.250573, 0, -0.5, 0.5, 0.5,
-4.642106, -0.08618021, -7.250573, 1, -0.5, 0.5, 0.5,
-4.642106, -0.08618021, -7.250573, 1, 1.5, 0.5, 0.5,
-4.642106, -0.08618021, -7.250573, 0, 1.5, 0.5, 0.5
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
-4.642106, -4.569416, 0.3143392, 0, -0.5, 0.5, 0.5,
-4.642106, -4.569416, 0.3143392, 1, -0.5, 0.5, 0.5,
-4.642106, -4.569416, 0.3143392, 1, 1.5, 0.5, 0.5,
-4.642106, -4.569416, 0.3143392, 0, 1.5, 0.5, 0.5
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
-3, -3.534823, -5.504824,
3, -3.534823, -5.504824,
-3, -3.534823, -5.504824,
-3, -3.707255, -5.795782,
-2, -3.534823, -5.504824,
-2, -3.707255, -5.795782,
-1, -3.534823, -5.504824,
-1, -3.707255, -5.795782,
0, -3.534823, -5.504824,
0, -3.707255, -5.795782,
1, -3.534823, -5.504824,
1, -3.707255, -5.795782,
2, -3.534823, -5.504824,
2, -3.707255, -5.795782,
3, -3.534823, -5.504824,
3, -3.707255, -5.795782
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
-3, -4.052119, -6.377698, 0, -0.5, 0.5, 0.5,
-3, -4.052119, -6.377698, 1, -0.5, 0.5, 0.5,
-3, -4.052119, -6.377698, 1, 1.5, 0.5, 0.5,
-3, -4.052119, -6.377698, 0, 1.5, 0.5, 0.5,
-2, -4.052119, -6.377698, 0, -0.5, 0.5, 0.5,
-2, -4.052119, -6.377698, 1, -0.5, 0.5, 0.5,
-2, -4.052119, -6.377698, 1, 1.5, 0.5, 0.5,
-2, -4.052119, -6.377698, 0, 1.5, 0.5, 0.5,
-1, -4.052119, -6.377698, 0, -0.5, 0.5, 0.5,
-1, -4.052119, -6.377698, 1, -0.5, 0.5, 0.5,
-1, -4.052119, -6.377698, 1, 1.5, 0.5, 0.5,
-1, -4.052119, -6.377698, 0, 1.5, 0.5, 0.5,
0, -4.052119, -6.377698, 0, -0.5, 0.5, 0.5,
0, -4.052119, -6.377698, 1, -0.5, 0.5, 0.5,
0, -4.052119, -6.377698, 1, 1.5, 0.5, 0.5,
0, -4.052119, -6.377698, 0, 1.5, 0.5, 0.5,
1, -4.052119, -6.377698, 0, -0.5, 0.5, 0.5,
1, -4.052119, -6.377698, 1, -0.5, 0.5, 0.5,
1, -4.052119, -6.377698, 1, 1.5, 0.5, 0.5,
1, -4.052119, -6.377698, 0, 1.5, 0.5, 0.5,
2, -4.052119, -6.377698, 0, -0.5, 0.5, 0.5,
2, -4.052119, -6.377698, 1, -0.5, 0.5, 0.5,
2, -4.052119, -6.377698, 1, 1.5, 0.5, 0.5,
2, -4.052119, -6.377698, 0, 1.5, 0.5, 0.5,
3, -4.052119, -6.377698, 0, -0.5, 0.5, 0.5,
3, -4.052119, -6.377698, 1, -0.5, 0.5, 0.5,
3, -4.052119, -6.377698, 1, 1.5, 0.5, 0.5,
3, -4.052119, -6.377698, 0, 1.5, 0.5, 0.5
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
-3.582814, -3, -5.504824,
-3.582814, 3, -5.504824,
-3.582814, -3, -5.504824,
-3.759362, -3, -5.795782,
-3.582814, -2, -5.504824,
-3.759362, -2, -5.795782,
-3.582814, -1, -5.504824,
-3.759362, -1, -5.795782,
-3.582814, 0, -5.504824,
-3.759362, 0, -5.795782,
-3.582814, 1, -5.504824,
-3.759362, 1, -5.795782,
-3.582814, 2, -5.504824,
-3.759362, 2, -5.795782,
-3.582814, 3, -5.504824,
-3.759362, 3, -5.795782
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
-4.11246, -3, -6.377698, 0, -0.5, 0.5, 0.5,
-4.11246, -3, -6.377698, 1, -0.5, 0.5, 0.5,
-4.11246, -3, -6.377698, 1, 1.5, 0.5, 0.5,
-4.11246, -3, -6.377698, 0, 1.5, 0.5, 0.5,
-4.11246, -2, -6.377698, 0, -0.5, 0.5, 0.5,
-4.11246, -2, -6.377698, 1, -0.5, 0.5, 0.5,
-4.11246, -2, -6.377698, 1, 1.5, 0.5, 0.5,
-4.11246, -2, -6.377698, 0, 1.5, 0.5, 0.5,
-4.11246, -1, -6.377698, 0, -0.5, 0.5, 0.5,
-4.11246, -1, -6.377698, 1, -0.5, 0.5, 0.5,
-4.11246, -1, -6.377698, 1, 1.5, 0.5, 0.5,
-4.11246, -1, -6.377698, 0, 1.5, 0.5, 0.5,
-4.11246, 0, -6.377698, 0, -0.5, 0.5, 0.5,
-4.11246, 0, -6.377698, 1, -0.5, 0.5, 0.5,
-4.11246, 0, -6.377698, 1, 1.5, 0.5, 0.5,
-4.11246, 0, -6.377698, 0, 1.5, 0.5, 0.5,
-4.11246, 1, -6.377698, 0, -0.5, 0.5, 0.5,
-4.11246, 1, -6.377698, 1, -0.5, 0.5, 0.5,
-4.11246, 1, -6.377698, 1, 1.5, 0.5, 0.5,
-4.11246, 1, -6.377698, 0, 1.5, 0.5, 0.5,
-4.11246, 2, -6.377698, 0, -0.5, 0.5, 0.5,
-4.11246, 2, -6.377698, 1, -0.5, 0.5, 0.5,
-4.11246, 2, -6.377698, 1, 1.5, 0.5, 0.5,
-4.11246, 2, -6.377698, 0, 1.5, 0.5, 0.5,
-4.11246, 3, -6.377698, 0, -0.5, 0.5, 0.5,
-4.11246, 3, -6.377698, 1, -0.5, 0.5, 0.5,
-4.11246, 3, -6.377698, 1, 1.5, 0.5, 0.5,
-4.11246, 3, -6.377698, 0, 1.5, 0.5, 0.5
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
-3.582814, -3.534823, -4,
-3.582814, -3.534823, 4,
-3.582814, -3.534823, -4,
-3.759362, -3.707255, -4,
-3.582814, -3.534823, -2,
-3.759362, -3.707255, -2,
-3.582814, -3.534823, 0,
-3.759362, -3.707255, 0,
-3.582814, -3.534823, 2,
-3.759362, -3.707255, 2,
-3.582814, -3.534823, 4,
-3.759362, -3.707255, 4
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
-4.11246, -4.052119, -4, 0, -0.5, 0.5, 0.5,
-4.11246, -4.052119, -4, 1, -0.5, 0.5, 0.5,
-4.11246, -4.052119, -4, 1, 1.5, 0.5, 0.5,
-4.11246, -4.052119, -4, 0, 1.5, 0.5, 0.5,
-4.11246, -4.052119, -2, 0, -0.5, 0.5, 0.5,
-4.11246, -4.052119, -2, 1, -0.5, 0.5, 0.5,
-4.11246, -4.052119, -2, 1, 1.5, 0.5, 0.5,
-4.11246, -4.052119, -2, 0, 1.5, 0.5, 0.5,
-4.11246, -4.052119, 0, 0, -0.5, 0.5, 0.5,
-4.11246, -4.052119, 0, 1, -0.5, 0.5, 0.5,
-4.11246, -4.052119, 0, 1, 1.5, 0.5, 0.5,
-4.11246, -4.052119, 0, 0, 1.5, 0.5, 0.5,
-4.11246, -4.052119, 2, 0, -0.5, 0.5, 0.5,
-4.11246, -4.052119, 2, 1, -0.5, 0.5, 0.5,
-4.11246, -4.052119, 2, 1, 1.5, 0.5, 0.5,
-4.11246, -4.052119, 2, 0, 1.5, 0.5, 0.5,
-4.11246, -4.052119, 4, 0, -0.5, 0.5, 0.5,
-4.11246, -4.052119, 4, 1, -0.5, 0.5, 0.5,
-4.11246, -4.052119, 4, 1, 1.5, 0.5, 0.5,
-4.11246, -4.052119, 4, 0, 1.5, 0.5, 0.5
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
-3.582814, -3.534823, -5.504824,
-3.582814, 3.362462, -5.504824,
-3.582814, -3.534823, 6.133502,
-3.582814, 3.362462, 6.133502,
-3.582814, -3.534823, -5.504824,
-3.582814, -3.534823, 6.133502,
-3.582814, 3.362462, -5.504824,
-3.582814, 3.362462, 6.133502,
-3.582814, -3.534823, -5.504824,
3.479139, -3.534823, -5.504824,
-3.582814, -3.534823, 6.133502,
3.479139, -3.534823, 6.133502,
-3.582814, 3.362462, -5.504824,
3.479139, 3.362462, -5.504824,
-3.582814, 3.362462, 6.133502,
3.479139, 3.362462, 6.133502,
3.479139, -3.534823, -5.504824,
3.479139, 3.362462, -5.504824,
3.479139, -3.534823, 6.133502,
3.479139, 3.362462, 6.133502,
3.479139, -3.534823, -5.504824,
3.479139, -3.534823, 6.133502,
3.479139, 3.362462, -5.504824,
3.479139, 3.362462, 6.133502
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
var radius = 8.149012;
var distance = 36.25587;
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
mvMatrix.translate( 0.05183744, 0.08618021, -0.3143392 );
mvMatrix.scale( 1.247654, 1.277441, 0.7570565 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.25587);
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
biphenyl<-read.table("biphenyl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-biphenyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'biphenyl' not found
```

```r
y<-biphenyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'biphenyl' not found
```

```r
z<-biphenyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'biphenyl' not found
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
-3.47997, -1.059801, -0.4597456, 0, 0, 1, 1, 1,
-3.389912, -0.7325238, -1.914334, 1, 0, 0, 1, 1,
-2.992423, -0.1320095, -3.236572, 1, 0, 0, 1, 1,
-2.876646, 0.5909486, -1.033319, 1, 0, 0, 1, 1,
-2.693955, 0.743587, -0.8809892, 1, 0, 0, 1, 1,
-2.691567, 1.447964, 0.4454024, 1, 0, 0, 1, 1,
-2.684164, -0.6589476, -2.860137, 0, 0, 0, 1, 1,
-2.648104, -0.9316404, -1.561547, 0, 0, 0, 1, 1,
-2.576193, -1.868801, -3.006846, 0, 0, 0, 1, 1,
-2.514011, 0.3153848, -0.9329565, 0, 0, 0, 1, 1,
-2.390739, -0.1309918, -2.368113, 0, 0, 0, 1, 1,
-2.351061, -1.628414, -1.775246, 0, 0, 0, 1, 1,
-2.295506, 0.1613315, -0.9219402, 0, 0, 0, 1, 1,
-2.293503, 0.9137502, -2.017122, 1, 1, 1, 1, 1,
-2.242271, -0.07262099, -1.398261, 1, 1, 1, 1, 1,
-2.230085, 0.7283329, -0.7593441, 1, 1, 1, 1, 1,
-2.215514, 0.6070382, -1.383483, 1, 1, 1, 1, 1,
-2.209962, -1.083408, -2.749862, 1, 1, 1, 1, 1,
-2.170397, -0.4452226, -2.777439, 1, 1, 1, 1, 1,
-2.138549, 1.317729, -2.757952, 1, 1, 1, 1, 1,
-2.137255, 1.475919, -2.019056, 1, 1, 1, 1, 1,
-2.073148, 1.079387, -0.7712169, 1, 1, 1, 1, 1,
-2.060717, 0.7905343, -0.1406701, 1, 1, 1, 1, 1,
-2.04632, 0.17581, -2.118429, 1, 1, 1, 1, 1,
-2.0431, 0.04046909, -1.33835, 1, 1, 1, 1, 1,
-2.031159, -0.3212757, -0.5238863, 1, 1, 1, 1, 1,
-1.992682, 0.05863545, -0.4233199, 1, 1, 1, 1, 1,
-1.984927, -0.6979176, -2.194192, 1, 1, 1, 1, 1,
-1.965528, 0.1692896, -0.7714196, 0, 0, 1, 1, 1,
-1.961007, -0.780924, -2.467486, 1, 0, 0, 1, 1,
-1.913892, 1.257069, -1.214535, 1, 0, 0, 1, 1,
-1.901013, 0.6530262, -2.600638, 1, 0, 0, 1, 1,
-1.885514, 2.214598, -0.2653685, 1, 0, 0, 1, 1,
-1.862788, -1.685528, -2.154613, 1, 0, 0, 1, 1,
-1.771781, 0.3269462, -2.863683, 0, 0, 0, 1, 1,
-1.765749, -0.2059369, -2.754345, 0, 0, 0, 1, 1,
-1.752711, 0.4707952, 0.4397919, 0, 0, 0, 1, 1,
-1.750747, 0.5192406, -2.138353, 0, 0, 0, 1, 1,
-1.74788, -0.05968782, -0.02345198, 0, 0, 0, 1, 1,
-1.744363, 0.9885644, -0.7386518, 0, 0, 0, 1, 1,
-1.735315, 0.3301446, -3.849371, 0, 0, 0, 1, 1,
-1.727149, 0.8091756, -1.712121, 1, 1, 1, 1, 1,
-1.716454, -0.5080501, -0.9388124, 1, 1, 1, 1, 1,
-1.715828, -0.6560967, -2.975173, 1, 1, 1, 1, 1,
-1.709178, 1.114726, -0.4051549, 1, 1, 1, 1, 1,
-1.678013, 1.125423, 0.524101, 1, 1, 1, 1, 1,
-1.652506, -2.024915, -3.469525, 1, 1, 1, 1, 1,
-1.636852, -1.976953, -2.556313, 1, 1, 1, 1, 1,
-1.63098, 1.974745, 0.05291112, 1, 1, 1, 1, 1,
-1.625921, -0.5748944, -1.594103, 1, 1, 1, 1, 1,
-1.610666, -0.02379017, -2.383687, 1, 1, 1, 1, 1,
-1.609219, 0.550788, -1.322388, 1, 1, 1, 1, 1,
-1.594575, -1.466268, -3.559786, 1, 1, 1, 1, 1,
-1.583393, -1.989625, -1.103776, 1, 1, 1, 1, 1,
-1.582944, 1.113997, -1.104892, 1, 1, 1, 1, 1,
-1.575828, -0.3385748, -1.103433, 1, 1, 1, 1, 1,
-1.563159, 0.8265964, -3.182009, 0, 0, 1, 1, 1,
-1.560131, 1.401308, -1.298457, 1, 0, 0, 1, 1,
-1.550786, 0.5304366, -0.7289749, 1, 0, 0, 1, 1,
-1.550553, 0.847725, -1.591409, 1, 0, 0, 1, 1,
-1.539371, -0.6279867, -1.359473, 1, 0, 0, 1, 1,
-1.537202, -0.8060758, -1.111698, 1, 0, 0, 1, 1,
-1.512344, 1.643953, -1.353854, 0, 0, 0, 1, 1,
-1.489914, 0.7283551, -1.911324, 0, 0, 0, 1, 1,
-1.477577, -1.180403, -3.358252, 0, 0, 0, 1, 1,
-1.476416, 0.24584, -0.7149025, 0, 0, 0, 1, 1,
-1.473675, 0.3545047, -2.68714, 0, 0, 0, 1, 1,
-1.472176, -0.7262456, -1.492337, 0, 0, 0, 1, 1,
-1.46617, 1.745948, -2.379396, 0, 0, 0, 1, 1,
-1.460121, 0.4909946, 0.163795, 1, 1, 1, 1, 1,
-1.458403, 0.03100946, -1.455328, 1, 1, 1, 1, 1,
-1.448557, 0.8559321, 0.909584, 1, 1, 1, 1, 1,
-1.44398, 0.8944103, 0.2990628, 1, 1, 1, 1, 1,
-1.441097, 0.4426814, -0.7163815, 1, 1, 1, 1, 1,
-1.43562, 0.8284925, 0.5855936, 1, 1, 1, 1, 1,
-1.42267, -1.435649, -2.634599, 1, 1, 1, 1, 1,
-1.422577, 0.2622321, -0.3485457, 1, 1, 1, 1, 1,
-1.41148, 0.9264302, -1.136853, 1, 1, 1, 1, 1,
-1.389009, 1.295387, 1.171552, 1, 1, 1, 1, 1,
-1.386817, -0.4251864, 1.24031, 1, 1, 1, 1, 1,
-1.386494, -0.004037914, -2.055974, 1, 1, 1, 1, 1,
-1.383715, -0.4988107, -0.5122858, 1, 1, 1, 1, 1,
-1.378851, 0.52285, 0.7203052, 1, 1, 1, 1, 1,
-1.378767, 0.4252059, -2.490465, 1, 1, 1, 1, 1,
-1.377919, -0.6820183, -1.283072, 0, 0, 1, 1, 1,
-1.370866, -1.173002, -3.318102, 1, 0, 0, 1, 1,
-1.367975, 2.266845, -0.8032692, 1, 0, 0, 1, 1,
-1.365698, 0.5701398, -1.564304, 1, 0, 0, 1, 1,
-1.365611, -0.1982735, -2.9881, 1, 0, 0, 1, 1,
-1.360126, 0.3316148, -1.139364, 1, 0, 0, 1, 1,
-1.355421, 1.870509, 0.670703, 0, 0, 0, 1, 1,
-1.345688, 0.127044, -2.071939, 0, 0, 0, 1, 1,
-1.332056, -0.6272861, -2.58078, 0, 0, 0, 1, 1,
-1.31263, -0.198536, -1.720748, 0, 0, 0, 1, 1,
-1.312241, -1.590897, -2.942682, 0, 0, 0, 1, 1,
-1.307019, -1.801708, -1.398036, 0, 0, 0, 1, 1,
-1.305728, -0.1473276, -0.9970865, 0, 0, 0, 1, 1,
-1.304359, -0.9610255, -2.451298, 1, 1, 1, 1, 1,
-1.294749, -0.04474889, -2.44739, 1, 1, 1, 1, 1,
-1.286304, 1.570927, 0.2658899, 1, 1, 1, 1, 1,
-1.283723, -1.720819, -1.876527, 1, 1, 1, 1, 1,
-1.273896, -0.9867891, -0.9012844, 1, 1, 1, 1, 1,
-1.267236, -0.1986348, -0.9409701, 1, 1, 1, 1, 1,
-1.259134, 0.4603561, -1.362636, 1, 1, 1, 1, 1,
-1.246782, 1.577066, -0.07754382, 1, 1, 1, 1, 1,
-1.239868, 0.2301171, -1.457768, 1, 1, 1, 1, 1,
-1.227862, 0.3328257, -2.125444, 1, 1, 1, 1, 1,
-1.217099, -0.9912025, -2.393674, 1, 1, 1, 1, 1,
-1.211064, -1.296386, -2.273834, 1, 1, 1, 1, 1,
-1.209239, 1.528912, -1.854533, 1, 1, 1, 1, 1,
-1.203029, -0.5759494, -0.8708194, 1, 1, 1, 1, 1,
-1.202559, -1.28109, -2.429723, 1, 1, 1, 1, 1,
-1.199483, 1.850322, -0.7959039, 0, 0, 1, 1, 1,
-1.197111, 0.3340938, -0.1012307, 1, 0, 0, 1, 1,
-1.192115, 0.5518337, 0.147278, 1, 0, 0, 1, 1,
-1.19021, 0.4439308, 0.02023477, 1, 0, 0, 1, 1,
-1.186333, 0.8009997, -0.9670053, 1, 0, 0, 1, 1,
-1.186146, 0.6945919, -0.8083043, 1, 0, 0, 1, 1,
-1.186002, 0.2762198, -1.710778, 0, 0, 0, 1, 1,
-1.183663, -0.1116255, -1.027067, 0, 0, 0, 1, 1,
-1.177867, -1.830597, -2.935968, 0, 0, 0, 1, 1,
-1.175976, -0.5880883, -1.377437, 0, 0, 0, 1, 1,
-1.163001, -0.3290465, -1.78929, 0, 0, 0, 1, 1,
-1.160999, -1.23796, -3.211944, 0, 0, 0, 1, 1,
-1.153998, 0.7679074, -0.2197754, 0, 0, 0, 1, 1,
-1.150972, -0.5619594, -1.493118, 1, 1, 1, 1, 1,
-1.149791, -1.512454, -3.580732, 1, 1, 1, 1, 1,
-1.140892, 0.7887917, -0.4946616, 1, 1, 1, 1, 1,
-1.13647, -1.136071, -2.422793, 1, 1, 1, 1, 1,
-1.136045, -2.221051, -4.076064, 1, 1, 1, 1, 1,
-1.135074, -2.843574, -3.403214, 1, 1, 1, 1, 1,
-1.131123, 1.335578, -0.2957239, 1, 1, 1, 1, 1,
-1.127465, -0.9366767, -4.230985, 1, 1, 1, 1, 1,
-1.122207, 1.086806, -0.7697404, 1, 1, 1, 1, 1,
-1.121799, -0.9714687, -3.5687, 1, 1, 1, 1, 1,
-1.106648, -0.03733909, -0.561823, 1, 1, 1, 1, 1,
-1.105705, -0.9316546, -1.954808, 1, 1, 1, 1, 1,
-1.104735, 0.4217306, -0.4918416, 1, 1, 1, 1, 1,
-1.102671, -0.3375476, -1.677381, 1, 1, 1, 1, 1,
-1.100331, -0.7094948, -3.34488, 1, 1, 1, 1, 1,
-1.094044, -1.029351, -2.758478, 0, 0, 1, 1, 1,
-1.087781, -0.07300179, -3.095391, 1, 0, 0, 1, 1,
-1.08347, 0.3872041, -0.9407023, 1, 0, 0, 1, 1,
-1.083126, -1.546028, -2.578394, 1, 0, 0, 1, 1,
-1.072669, -0.345408, -2.757828, 1, 0, 0, 1, 1,
-1.067809, 0.01184326, -2.043377, 1, 0, 0, 1, 1,
-1.055713, -0.7782085, -2.325636, 0, 0, 0, 1, 1,
-1.053002, -0.2534713, -0.5107169, 0, 0, 0, 1, 1,
-1.050725, -1.077393, -2.353888, 0, 0, 0, 1, 1,
-1.046918, -0.3784361, -2.552903, 0, 0, 0, 1, 1,
-1.042796, 0.5825343, -3.641667, 0, 0, 0, 1, 1,
-1.039442, 0.4110115, -0.7955714, 0, 0, 0, 1, 1,
-1.036871, 0.4456511, -2.0669, 0, 0, 0, 1, 1,
-1.035045, -3.434377, -0.096265, 1, 1, 1, 1, 1,
-1.029406, -0.9593201, -2.02356, 1, 1, 1, 1, 1,
-1.027906, 1.319648, 0.01165683, 1, 1, 1, 1, 1,
-1.027343, -0.3127403, -1.743797, 1, 1, 1, 1, 1,
-1.027058, 0.8792757, -0.7071683, 1, 1, 1, 1, 1,
-1.026975, 1.732154, -0.8873329, 1, 1, 1, 1, 1,
-1.025789, 0.5845888, -0.4352582, 1, 1, 1, 1, 1,
-1.019886, 0.087859, -2.762715, 1, 1, 1, 1, 1,
-1.017831, 1.646713, -0.5482566, 1, 1, 1, 1, 1,
-1.016098, 0.8268256, -1.119212, 1, 1, 1, 1, 1,
-1.006596, -1.296046, -2.142138, 1, 1, 1, 1, 1,
-0.9983914, 1.6268, -2.535131, 1, 1, 1, 1, 1,
-0.9907049, 0.3400837, -0.3372157, 1, 1, 1, 1, 1,
-0.987658, -0.8332804, -1.962288, 1, 1, 1, 1, 1,
-0.9835629, -0.2153903, -0.5373861, 1, 1, 1, 1, 1,
-0.9822628, -0.5594358, -3.866542, 0, 0, 1, 1, 1,
-0.9724326, 0.2192542, -1.573718, 1, 0, 0, 1, 1,
-0.969751, 0.09607945, -1.141548, 1, 0, 0, 1, 1,
-0.9667862, -0.09462259, -1.71894, 1, 0, 0, 1, 1,
-0.9388821, 0.06448117, -3.004068, 1, 0, 0, 1, 1,
-0.9388394, -0.4891084, -0.4673226, 1, 0, 0, 1, 1,
-0.935211, 1.050585, -1.493873, 0, 0, 0, 1, 1,
-0.9309217, 0.3657123, -0.9063076, 0, 0, 0, 1, 1,
-0.9269442, 1.589532, -1.351954, 0, 0, 0, 1, 1,
-0.9048064, 0.920862, -0.8924665, 0, 0, 0, 1, 1,
-0.9034342, 0.7656757, -0.4421352, 0, 0, 0, 1, 1,
-0.9014819, -0.8686212, -2.451466, 0, 0, 0, 1, 1,
-0.8942884, -1.695655, -3.273582, 0, 0, 0, 1, 1,
-0.8917438, 0.9550307, -2.140878, 1, 1, 1, 1, 1,
-0.8887411, 0.3123509, -2.177584, 1, 1, 1, 1, 1,
-0.8855472, 0.3767343, -2.459335, 1, 1, 1, 1, 1,
-0.8721727, 0.3995108, -0.4754545, 1, 1, 1, 1, 1,
-0.8715823, -1.934236, -2.572268, 1, 1, 1, 1, 1,
-0.8684491, -0.6638361, -2.826365, 1, 1, 1, 1, 1,
-0.8656337, 0.7641955, -1.401655, 1, 1, 1, 1, 1,
-0.8655173, -1.300731, -1.448456, 1, 1, 1, 1, 1,
-0.8608816, 1.96835, -1.986955, 1, 1, 1, 1, 1,
-0.8550692, 0.2772567, -1.341329, 1, 1, 1, 1, 1,
-0.8445596, -0.1826298, -3.260808, 1, 1, 1, 1, 1,
-0.841823, 1.026842, -0.3235213, 1, 1, 1, 1, 1,
-0.8417844, 0.9357127, -0.985997, 1, 1, 1, 1, 1,
-0.8357846, 1.810846, -2.6235, 1, 1, 1, 1, 1,
-0.8355023, -0.5894973, -2.271621, 1, 1, 1, 1, 1,
-0.8110755, 1.623863, -2.386773, 0, 0, 1, 1, 1,
-0.8077292, -0.2795198, -0.8752581, 1, 0, 0, 1, 1,
-0.7984565, -0.4561122, -1.955001, 1, 0, 0, 1, 1,
-0.7963705, -0.1836412, 0.1825353, 1, 0, 0, 1, 1,
-0.7953697, -0.2585834, -3.139253, 1, 0, 0, 1, 1,
-0.7941346, -0.7176834, -3.3789, 1, 0, 0, 1, 1,
-0.7892463, 0.009852411, -3.099916, 0, 0, 0, 1, 1,
-0.7859899, -2.482799, -3.003999, 0, 0, 0, 1, 1,
-0.7741402, -1.543172, -2.695474, 0, 0, 0, 1, 1,
-0.7678379, -0.9093897, -1.911014, 0, 0, 0, 1, 1,
-0.7675065, 2.258373, 1.378401, 0, 0, 0, 1, 1,
-0.7628809, 0.3385129, -0.4443187, 0, 0, 0, 1, 1,
-0.7623493, -1.387998, -2.967946, 0, 0, 0, 1, 1,
-0.760837, 0.2455895, -1.98159, 1, 1, 1, 1, 1,
-0.7591587, 0.06523444, -1.61409, 1, 1, 1, 1, 1,
-0.7580591, 0.9322214, -1.556094, 1, 1, 1, 1, 1,
-0.748701, 1.465615, -0.9779885, 1, 1, 1, 1, 1,
-0.740464, 1.166444, -0.2996169, 1, 1, 1, 1, 1,
-0.7386291, -0.4156604, -1.02642, 1, 1, 1, 1, 1,
-0.7315266, -0.9512253, -3.746231, 1, 1, 1, 1, 1,
-0.7294294, 0.4602701, -1.316664, 1, 1, 1, 1, 1,
-0.7284691, -0.05293119, -1.672235, 1, 1, 1, 1, 1,
-0.7264553, -1.076682, -2.509476, 1, 1, 1, 1, 1,
-0.724798, -0.5790224, -1.440322, 1, 1, 1, 1, 1,
-0.7203068, 0.09212069, -0.3537469, 1, 1, 1, 1, 1,
-0.7186745, 0.7359225, -0.8158604, 1, 1, 1, 1, 1,
-0.7154982, -0.6835787, -2.814893, 1, 1, 1, 1, 1,
-0.7084793, 0.1463603, -1.660187, 1, 1, 1, 1, 1,
-0.7077515, 0.3572346, -2.525463, 0, 0, 1, 1, 1,
-0.7051609, -0.4819404, -1.87859, 1, 0, 0, 1, 1,
-0.7025555, -2.037429, -3.295674, 1, 0, 0, 1, 1,
-0.7011704, -1.616101, -3.961488, 1, 0, 0, 1, 1,
-0.7000694, -2.38041, -3.052521, 1, 0, 0, 1, 1,
-0.6972206, -0.844367, -3.136455, 1, 0, 0, 1, 1,
-0.6953843, -1.576592, -2.547614, 0, 0, 0, 1, 1,
-0.6949988, 1.065614, -2.511232, 0, 0, 0, 1, 1,
-0.6918172, -0.6639242, -2.459648, 0, 0, 0, 1, 1,
-0.6912337, -0.5238682, -1.320832, 0, 0, 0, 1, 1,
-0.6852475, 1.162608, -0.6735548, 0, 0, 0, 1, 1,
-0.678361, 0.4608404, 0.06221386, 0, 0, 0, 1, 1,
-0.6767419, -0.02279726, -1.685383, 0, 0, 0, 1, 1,
-0.6724405, 0.4780991, -1.129106, 1, 1, 1, 1, 1,
-0.6716268, 1.106187, -0.2290268, 1, 1, 1, 1, 1,
-0.6709055, -0.5493665, -0.324487, 1, 1, 1, 1, 1,
-0.669273, 1.13142, 0.20184, 1, 1, 1, 1, 1,
-0.6633987, 0.5558532, -0.9024979, 1, 1, 1, 1, 1,
-0.6618285, -1.234233, -3.613696, 1, 1, 1, 1, 1,
-0.6597713, -0.4813173, -1.584935, 1, 1, 1, 1, 1,
-0.65867, -1.088288, -3.61539, 1, 1, 1, 1, 1,
-0.6567907, 0.4768488, -1.484034, 1, 1, 1, 1, 1,
-0.6544268, 1.817335, -1.698655, 1, 1, 1, 1, 1,
-0.6543139, -1.371564, -3.974162, 1, 1, 1, 1, 1,
-0.6521527, 0.7820253, -0.09354351, 1, 1, 1, 1, 1,
-0.6384214, -0.1502857, -2.315445, 1, 1, 1, 1, 1,
-0.6369019, -0.0889181, -2.530239, 1, 1, 1, 1, 1,
-0.6364377, -0.2066086, -1.519899, 1, 1, 1, 1, 1,
-0.6329876, 0.4084549, -1.38693, 0, 0, 1, 1, 1,
-0.6307915, 0.2315884, 0.2703058, 1, 0, 0, 1, 1,
-0.6307219, 0.6181568, -1.403259, 1, 0, 0, 1, 1,
-0.6287261, 0.2435523, -0.9462618, 1, 0, 0, 1, 1,
-0.6238705, -1.392092, -2.167666, 1, 0, 0, 1, 1,
-0.6156795, 0.2055468, -1.537133, 1, 0, 0, 1, 1,
-0.6128519, 0.32303, -1.369619, 0, 0, 0, 1, 1,
-0.6117385, -1.318298, -3.286398, 0, 0, 0, 1, 1,
-0.6110283, 0.6509619, 0.7998913, 0, 0, 0, 1, 1,
-0.6073729, 0.4007549, -0.5801083, 0, 0, 0, 1, 1,
-0.6062753, 0.140933, -0.376527, 0, 0, 0, 1, 1,
-0.6021232, 0.4766431, 0.45646, 0, 0, 0, 1, 1,
-0.5986867, -0.8860676, -4.553123, 0, 0, 0, 1, 1,
-0.5976362, -2.961654, -4.560797, 1, 1, 1, 1, 1,
-0.5975136, 1.273376, -0.7292566, 1, 1, 1, 1, 1,
-0.5913316, 0.1316846, -0.8593499, 1, 1, 1, 1, 1,
-0.5896178, 0.2153151, -1.083487, 1, 1, 1, 1, 1,
-0.5828196, -1.200077, -5.024519, 1, 1, 1, 1, 1,
-0.5814925, -0.01832624, -1.099989, 1, 1, 1, 1, 1,
-0.5809831, 0.130256, -0.698038, 1, 1, 1, 1, 1,
-0.580211, -0.5250388, -1.178613, 1, 1, 1, 1, 1,
-0.5769553, -1.014283, -4.320051, 1, 1, 1, 1, 1,
-0.5760206, 0.6705779, -0.2320717, 1, 1, 1, 1, 1,
-0.5752734, 0.6866929, -0.2037317, 1, 1, 1, 1, 1,
-0.572146, 0.8139724, -1.461648, 1, 1, 1, 1, 1,
-0.571685, 0.2202826, -2.863147, 1, 1, 1, 1, 1,
-0.5708646, -0.7044654, -2.553137, 1, 1, 1, 1, 1,
-0.566809, 0.2147404, -1.995679, 1, 1, 1, 1, 1,
-0.5631579, -2.390528, -2.359275, 0, 0, 1, 1, 1,
-0.5607468, -0.6382889, -2.874078, 1, 0, 0, 1, 1,
-0.5601032, -0.5494353, -2.02866, 1, 0, 0, 1, 1,
-0.5583736, -0.3819375, -1.729134, 1, 0, 0, 1, 1,
-0.5572244, -0.3905079, -2.884233, 1, 0, 0, 1, 1,
-0.5523754, -1.206949, -2.202201, 1, 0, 0, 1, 1,
-0.5514073, -0.1126231, -1.903274, 0, 0, 0, 1, 1,
-0.5445898, -1.686424, -3.759395, 0, 0, 0, 1, 1,
-0.5439733, -0.3821547, -5.20032, 0, 0, 0, 1, 1,
-0.5438064, 1.614155, -1.440813, 0, 0, 0, 1, 1,
-0.5430291, -0.4415413, -2.030047, 0, 0, 0, 1, 1,
-0.5402289, 0.9405766, 1.478071, 0, 0, 0, 1, 1,
-0.5367057, -0.7551892, -2.667512, 0, 0, 0, 1, 1,
-0.5358442, 0.3893197, -0.1984993, 1, 1, 1, 1, 1,
-0.5350141, -0.362593, 0.2250629, 1, 1, 1, 1, 1,
-0.5318493, 1.477874, -0.08425669, 1, 1, 1, 1, 1,
-0.5318052, 0.1034653, -0.4121006, 1, 1, 1, 1, 1,
-0.52975, 0.5145548, -2.496693, 1, 1, 1, 1, 1,
-0.5293611, 0.6561965, -2.517275, 1, 1, 1, 1, 1,
-0.5264928, 0.002488114, 0.3684223, 1, 1, 1, 1, 1,
-0.52447, 0.288483, -1.176889, 1, 1, 1, 1, 1,
-0.5229296, 2.407068, 0.3876649, 1, 1, 1, 1, 1,
-0.5222063, -0.5067918, -1.414034, 1, 1, 1, 1, 1,
-0.5175079, 2.263115, 0.3948804, 1, 1, 1, 1, 1,
-0.515753, -0.1083314, -1.10498, 1, 1, 1, 1, 1,
-0.510604, 1.661018, -1.062865, 1, 1, 1, 1, 1,
-0.5015784, 0.5443793, 1.081546, 1, 1, 1, 1, 1,
-0.5008919, -0.8712781, -2.502321, 1, 1, 1, 1, 1,
-0.5001611, -1.221151, -2.627153, 0, 0, 1, 1, 1,
-0.4990023, -1.275972, -2.600646, 1, 0, 0, 1, 1,
-0.4972695, -0.6096914, -3.902165, 1, 0, 0, 1, 1,
-0.4894409, -0.6310669, -3.502395, 1, 0, 0, 1, 1,
-0.486887, 0.9005258, -0.2645254, 1, 0, 0, 1, 1,
-0.4861521, 1.948925, 0.0306216, 1, 0, 0, 1, 1,
-0.4840358, -3.114873, -1.546499, 0, 0, 0, 1, 1,
-0.4823431, -0.1175978, -0.6990514, 0, 0, 0, 1, 1,
-0.4797978, -1.946474, -3.407574, 0, 0, 0, 1, 1,
-0.4792083, -0.9986736, -3.191886, 0, 0, 0, 1, 1,
-0.4752652, 0.4119844, -0.7135206, 0, 0, 0, 1, 1,
-0.4735527, 1.996914, 0.2445666, 0, 0, 0, 1, 1,
-0.4707363, -0.1106359, -0.3516636, 0, 0, 0, 1, 1,
-0.469073, -0.5983518, -1.072183, 1, 1, 1, 1, 1,
-0.4673349, 0.2424649, -1.616658, 1, 1, 1, 1, 1,
-0.4619755, -0.7826086, 0.1605962, 1, 1, 1, 1, 1,
-0.4616322, 0.1314264, -1.132352, 1, 1, 1, 1, 1,
-0.4591949, 0.5575677, -0.8299349, 1, 1, 1, 1, 1,
-0.45884, -1.220473, -1.146402, 1, 1, 1, 1, 1,
-0.4576539, -0.3917031, -3.168633, 1, 1, 1, 1, 1,
-0.4567417, -0.2219994, -0.671294, 1, 1, 1, 1, 1,
-0.4556104, 0.01918405, -0.9053728, 1, 1, 1, 1, 1,
-0.4529476, -0.004176397, -0.4223755, 1, 1, 1, 1, 1,
-0.4523636, 0.1899621, -2.13906, 1, 1, 1, 1, 1,
-0.4520285, 1.118503, -0.5136597, 1, 1, 1, 1, 1,
-0.450696, 0.796164, -2.195824, 1, 1, 1, 1, 1,
-0.4505295, 2.893783, 1.079602, 1, 1, 1, 1, 1,
-0.4482336, 0.2972319, -3.00894, 1, 1, 1, 1, 1,
-0.4402743, -1.16666, -1.314068, 0, 0, 1, 1, 1,
-0.4379999, -1.444496, -3.14519, 1, 0, 0, 1, 1,
-0.4368301, 0.06644554, -0.7116593, 1, 0, 0, 1, 1,
-0.4342954, 0.715009, -1.740738, 1, 0, 0, 1, 1,
-0.4288771, -0.7786617, -3.552354, 1, 0, 0, 1, 1,
-0.4277028, 0.4123885, -3.210929, 1, 0, 0, 1, 1,
-0.4276418, -1.028594, -2.028048, 0, 0, 0, 1, 1,
-0.4202171, 0.1645603, 0.4793408, 0, 0, 0, 1, 1,
-0.4189053, 1.469122, -2.18161, 0, 0, 0, 1, 1,
-0.4170029, 1.391665, -1.844543, 0, 0, 0, 1, 1,
-0.4105156, -0.5713803, -2.28207, 0, 0, 0, 1, 1,
-0.408922, -0.7488033, -1.93543, 0, 0, 0, 1, 1,
-0.4083365, -0.6169407, -4.693521, 0, 0, 0, 1, 1,
-0.405949, 1.105673, 0.6633133, 1, 1, 1, 1, 1,
-0.4054275, 0.6294357, -0.351931, 1, 1, 1, 1, 1,
-0.4050433, 1.721825, -0.1623144, 1, 1, 1, 1, 1,
-0.4041229, -2.409148, -3.943976, 1, 1, 1, 1, 1,
-0.4034265, -0.4820205, -2.512777, 1, 1, 1, 1, 1,
-0.4026862, 0.7149399, -1.935585, 1, 1, 1, 1, 1,
-0.3947877, -0.1065196, -3.582103, 1, 1, 1, 1, 1,
-0.3938706, 0.4468361, -2.136183, 1, 1, 1, 1, 1,
-0.3924307, -2.276841, -1.983229, 1, 1, 1, 1, 1,
-0.3911594, 0.7625718, -2.113052, 1, 1, 1, 1, 1,
-0.3894138, 0.7473787, 0.1112878, 1, 1, 1, 1, 1,
-0.3854592, 0.2080121, -0.833679, 1, 1, 1, 1, 1,
-0.384247, 0.2324755, -1.441451, 1, 1, 1, 1, 1,
-0.3841164, -0.2917128, -3.707283, 1, 1, 1, 1, 1,
-0.3839377, -0.2548698, -2.094707, 1, 1, 1, 1, 1,
-0.3824696, 0.002616972, -1.366136, 0, 0, 1, 1, 1,
-0.3811846, 0.1785667, -0.2637466, 1, 0, 0, 1, 1,
-0.3797602, 1.204668, -0.6238716, 1, 0, 0, 1, 1,
-0.379746, -0.001820077, -0.4370418, 1, 0, 0, 1, 1,
-0.3783303, 2.120453, 1.820546, 1, 0, 0, 1, 1,
-0.3780899, -2.517601, -2.838483, 1, 0, 0, 1, 1,
-0.3771444, 0.1025376, -2.464203, 0, 0, 0, 1, 1,
-0.3749981, -0.4981537, -3.01786, 0, 0, 0, 1, 1,
-0.3692534, 0.3670726, 0.5715458, 0, 0, 0, 1, 1,
-0.3673075, -1.398396, -2.119593, 0, 0, 0, 1, 1,
-0.3657382, -0.9826572, -1.017334, 0, 0, 0, 1, 1,
-0.3655981, -0.7219396, -2.735996, 0, 0, 0, 1, 1,
-0.3653384, -0.4861995, -3.115143, 0, 0, 0, 1, 1,
-0.3624389, -0.7738169, -1.479295, 1, 1, 1, 1, 1,
-0.3589627, -0.3215293, -1.17847, 1, 1, 1, 1, 1,
-0.3480601, -0.490467, -1.844545, 1, 1, 1, 1, 1,
-0.3472353, 0.2666842, -1.902004, 1, 1, 1, 1, 1,
-0.3472174, 0.03053819, -3.453124, 1, 1, 1, 1, 1,
-0.3471015, -0.1735158, -1.945873, 1, 1, 1, 1, 1,
-0.3356492, 1.552008, 0.2599752, 1, 1, 1, 1, 1,
-0.3341632, -1.649052, -2.365147, 1, 1, 1, 1, 1,
-0.3333953, -1.092833, -0.987812, 1, 1, 1, 1, 1,
-0.3323348, -0.5202626, -1.747711, 1, 1, 1, 1, 1,
-0.3303711, -2.015654, -2.546298, 1, 1, 1, 1, 1,
-0.3272713, 0.5345638, -0.8887892, 1, 1, 1, 1, 1,
-0.3255424, -0.6518153, -3.414103, 1, 1, 1, 1, 1,
-0.3230862, 1.916283, -0.09416746, 1, 1, 1, 1, 1,
-0.3168144, -0.4933359, -1.74491, 1, 1, 1, 1, 1,
-0.3149921, -0.1379126, -1.267982, 0, 0, 1, 1, 1,
-0.3125193, -1.503153, -3.655825, 1, 0, 0, 1, 1,
-0.311844, -1.091127, -4.185221, 1, 0, 0, 1, 1,
-0.3099829, -0.7750999, -2.025802, 1, 0, 0, 1, 1,
-0.2910326, 0.4781953, -0.6908412, 1, 0, 0, 1, 1,
-0.2863751, 0.311974, -1.905011, 1, 0, 0, 1, 1,
-0.2857778, 0.7202703, 0.06316414, 0, 0, 0, 1, 1,
-0.2857226, 0.6884539, -1.285773, 0, 0, 0, 1, 1,
-0.2820652, -0.08539912, -1.106623, 0, 0, 0, 1, 1,
-0.2813272, 2.51997, 0.7843288, 0, 0, 0, 1, 1,
-0.2789923, -1.404352, -1.778016, 0, 0, 0, 1, 1,
-0.2726932, -1.052979, -3.649805, 0, 0, 0, 1, 1,
-0.2690402, 0.4600382, 1.123223, 0, 0, 0, 1, 1,
-0.258044, -0.2590362, -1.019653, 1, 1, 1, 1, 1,
-0.2544187, -1.088271, -3.426284, 1, 1, 1, 1, 1,
-0.2504724, -0.6357884, -3.160265, 1, 1, 1, 1, 1,
-0.2445624, -0.7283899, -2.803569, 1, 1, 1, 1, 1,
-0.243437, 0.008365708, -0.07640596, 1, 1, 1, 1, 1,
-0.2417443, 0.2274374, 1.637621, 1, 1, 1, 1, 1,
-0.2392811, 0.6222258, 0.1843667, 1, 1, 1, 1, 1,
-0.2386126, -1.15571, -1.645903, 1, 1, 1, 1, 1,
-0.2380863, 0.327364, -0.4755692, 1, 1, 1, 1, 1,
-0.2375761, -0.1290802, -2.566031, 1, 1, 1, 1, 1,
-0.2363255, 1.507094, -0.005797513, 1, 1, 1, 1, 1,
-0.2362345, 0.4238834, 0.3887277, 1, 1, 1, 1, 1,
-0.2354531, -0.8509412, -5.290512, 1, 1, 1, 1, 1,
-0.2309997, -0.1208836, -4.099314, 1, 1, 1, 1, 1,
-0.2273204, 0.9214808, -1.173923, 1, 1, 1, 1, 1,
-0.2210848, -0.4483615, -4.472331, 0, 0, 1, 1, 1,
-0.2192509, -0.05246165, -3.135353, 1, 0, 0, 1, 1,
-0.2151553, 0.6980432, -0.004394707, 1, 0, 0, 1, 1,
-0.2134237, -0.8754145, -2.084588, 1, 0, 0, 1, 1,
-0.2120618, 1.388561, 1.165799, 1, 0, 0, 1, 1,
-0.2105916, 0.4517848, 0.5897608, 1, 0, 0, 1, 1,
-0.2095717, 0.314827, -2.108465, 0, 0, 0, 1, 1,
-0.2037577, -0.7138961, -4.247787, 0, 0, 0, 1, 1,
-0.2030708, -3.042857, -3.134176, 0, 0, 0, 1, 1,
-0.2015503, -0.1757664, -3.504857, 0, 0, 0, 1, 1,
-0.200789, 0.1927816, 1.3742, 0, 0, 0, 1, 1,
-0.1971474, 1.288383, 0.1927086, 0, 0, 0, 1, 1,
-0.1970325, -0.2048056, -1.956014, 0, 0, 0, 1, 1,
-0.1968918, -0.4159653, -2.008549, 1, 1, 1, 1, 1,
-0.1937864, 0.9772922, -1.877082, 1, 1, 1, 1, 1,
-0.1935759, -2.314512, -2.039552, 1, 1, 1, 1, 1,
-0.1910591, -0.7185686, -3.287052, 1, 1, 1, 1, 1,
-0.1889076, 0.168751, -1.454263, 1, 1, 1, 1, 1,
-0.1855149, 0.1534094, -1.283142, 1, 1, 1, 1, 1,
-0.1832902, 1.026525, 0.1623731, 1, 1, 1, 1, 1,
-0.1799941, 0.9907621, 0.7473812, 1, 1, 1, 1, 1,
-0.1747151, -0.444102, -1.290427, 1, 1, 1, 1, 1,
-0.1716521, 0.236092, 0.35047, 1, 1, 1, 1, 1,
-0.1695395, 0.5677257, -1.229645, 1, 1, 1, 1, 1,
-0.1678912, 0.08816851, -1.519634, 1, 1, 1, 1, 1,
-0.1678149, 1.185002, 2.158641, 1, 1, 1, 1, 1,
-0.1656405, -2.01257, -2.546861, 1, 1, 1, 1, 1,
-0.1633376, -0.558927, -2.923936, 1, 1, 1, 1, 1,
-0.1629418, -0.1570786, -2.531625, 0, 0, 1, 1, 1,
-0.1604887, -0.2749834, -1.599359, 1, 0, 0, 1, 1,
-0.1604361, -1.041906, -3.965269, 1, 0, 0, 1, 1,
-0.154709, 2.564958, -0.3622421, 1, 0, 0, 1, 1,
-0.1535072, 0.9466921, -0.8210521, 1, 0, 0, 1, 1,
-0.1515405, 1.289564, 0.0645979, 1, 0, 0, 1, 1,
-0.1503487, -1.501042, -4.66455, 0, 0, 0, 1, 1,
-0.1454596, 0.07543554, -1.418395, 0, 0, 0, 1, 1,
-0.1454121, -0.7181175, -3.01427, 0, 0, 0, 1, 1,
-0.1433729, -1.521966, -4.044825, 0, 0, 0, 1, 1,
-0.1428214, 0.0556606, 0.09119858, 0, 0, 0, 1, 1,
-0.1415874, -0.2677155, -3.201322, 0, 0, 0, 1, 1,
-0.1382213, -0.06137884, -1.329644, 0, 0, 0, 1, 1,
-0.1374932, -1.278819, -3.642601, 1, 1, 1, 1, 1,
-0.1371306, -0.8111001, -2.28186, 1, 1, 1, 1, 1,
-0.1282313, 1.355895, 1.484273, 1, 1, 1, 1, 1,
-0.1231364, 1.362472, 0.7599618, 1, 1, 1, 1, 1,
-0.1213669, 0.6486796, -0.4434322, 1, 1, 1, 1, 1,
-0.1184665, 0.2101516, -0.6623111, 1, 1, 1, 1, 1,
-0.1110987, 0.235208, -0.3489831, 1, 1, 1, 1, 1,
-0.1110829, -0.9464585, -3.044637, 1, 1, 1, 1, 1,
-0.1077561, 0.8559372, 0.703905, 1, 1, 1, 1, 1,
-0.1049891, 0.6468577, -0.8747634, 1, 1, 1, 1, 1,
-0.1046639, 1.590109, 0.7649622, 1, 1, 1, 1, 1,
-0.1013426, 0.557705, -0.2129908, 1, 1, 1, 1, 1,
-0.09763542, -0.4753886, -1.507728, 1, 1, 1, 1, 1,
-0.09555322, -0.5574304, -1.190591, 1, 1, 1, 1, 1,
-0.09211681, -2.22545, -2.637871, 1, 1, 1, 1, 1,
-0.09123696, -1.37994, -2.694407, 0, 0, 1, 1, 1,
-0.09057523, -1.226147, -5.335334, 1, 0, 0, 1, 1,
-0.08769879, -1.396166, -3.554914, 1, 0, 0, 1, 1,
-0.0852517, 0.3843317, -0.3410582, 1, 0, 0, 1, 1,
-0.08465765, -1.846908, -2.138866, 1, 0, 0, 1, 1,
-0.08370191, -0.6010174, -2.969802, 1, 0, 0, 1, 1,
-0.08253013, -0.5502313, -3.132504, 0, 0, 0, 1, 1,
-0.08130608, -0.8623207, -4.188862, 0, 0, 0, 1, 1,
-0.08094242, -1.596485, -2.688226, 0, 0, 0, 1, 1,
-0.08060703, -1.293782, -3.594202, 0, 0, 0, 1, 1,
-0.07683391, 1.772078, -0.1609379, 0, 0, 0, 1, 1,
-0.07548682, 3.122061, 0.3511607, 0, 0, 0, 1, 1,
-0.07050206, 0.5541927, -1.187744, 0, 0, 0, 1, 1,
-0.06907175, 2.010047, -0.3661452, 1, 1, 1, 1, 1,
-0.0669072, 0.1092677, 0.2351791, 1, 1, 1, 1, 1,
-0.06292802, 0.3931675, -1.571097, 1, 1, 1, 1, 1,
-0.06274505, 1.630894, -0.3142228, 1, 1, 1, 1, 1,
-0.06149405, 0.6098911, 2.547101, 1, 1, 1, 1, 1,
-0.06134299, 1.705805, -0.6446431, 1, 1, 1, 1, 1,
-0.06077911, -0.9968013, -3.040587, 1, 1, 1, 1, 1,
-0.05774091, 0.0276031, 0.2925681, 1, 1, 1, 1, 1,
-0.0569726, -0.13698, -2.657616, 1, 1, 1, 1, 1,
-0.05366633, -0.4907873, -3.714396, 1, 1, 1, 1, 1,
-0.0515736, -1.616276, -3.835091, 1, 1, 1, 1, 1,
-0.04705265, -2.110812, -3.189023, 1, 1, 1, 1, 1,
-0.04692508, 0.6312064, -0.5390359, 1, 1, 1, 1, 1,
-0.04679498, 0.7460608, 0.4425773, 1, 1, 1, 1, 1,
-0.04507078, -0.03773756, -2.838464, 1, 1, 1, 1, 1,
-0.0342182, 0.2975659, 1.197034, 0, 0, 1, 1, 1,
-0.03190285, 0.03316121, -0.03518282, 1, 0, 0, 1, 1,
-0.02858364, -1.188102, -3.959748, 1, 0, 0, 1, 1,
-0.02663957, 1.615741, -1.235525, 1, 0, 0, 1, 1,
-0.02535491, 1.657905, -0.01358701, 1, 0, 0, 1, 1,
-0.02505086, -0.0468832, -3.028087, 1, 0, 0, 1, 1,
-0.02297502, 0.2967067, -0.03942958, 0, 0, 0, 1, 1,
-0.02128213, -1.122346, -3.542785, 0, 0, 0, 1, 1,
-0.01825255, 1.025643, -2.072849, 0, 0, 0, 1, 1,
-0.01823153, -0.9018559, -3.926458, 0, 0, 0, 1, 1,
-0.01462825, -0.5511799, -4.248981, 0, 0, 0, 1, 1,
-0.009037853, 0.8414848, 0.6650237, 0, 0, 0, 1, 1,
-0.007775558, 0.5848134, 0.02616579, 0, 0, 0, 1, 1,
-0.006837956, -0.9947349, -2.668232, 1, 1, 1, 1, 1,
-0.00671916, -0.5766812, -3.947808, 1, 1, 1, 1, 1,
-0.003431934, 0.7977781, -0.2996299, 1, 1, 1, 1, 1,
0.003354966, -1.171809, 3.102173, 1, 1, 1, 1, 1,
0.006148205, 1.511205, 0.1743695, 1, 1, 1, 1, 1,
0.01020168, 1.654345, 1.392364, 1, 1, 1, 1, 1,
0.01384486, 0.2570162, 1.308042, 1, 1, 1, 1, 1,
0.01895309, 1.303117, -0.482787, 1, 1, 1, 1, 1,
0.02546586, 1.296253, 0.2702304, 1, 1, 1, 1, 1,
0.0261436, -0.5448076, 2.965574, 1, 1, 1, 1, 1,
0.03221779, -0.1746286, 3.617873, 1, 1, 1, 1, 1,
0.03528353, -0.3072718, 3.106982, 1, 1, 1, 1, 1,
0.03912051, -0.2819581, 2.670413, 1, 1, 1, 1, 1,
0.04633097, 0.5334769, -0.674205, 1, 1, 1, 1, 1,
0.04937945, 1.189444, 1.60498, 1, 1, 1, 1, 1,
0.05107391, -0.5071396, 2.307489, 0, 0, 1, 1, 1,
0.05302801, -0.5519816, 3.075716, 1, 0, 0, 1, 1,
0.05633167, 1.434896, -0.2667053, 1, 0, 0, 1, 1,
0.05771881, 1.14468, 1.97276, 1, 0, 0, 1, 1,
0.0600134, 2.319798, -1.127343, 1, 0, 0, 1, 1,
0.06186649, 0.7304705, 0.463074, 1, 0, 0, 1, 1,
0.06201237, -0.5318038, 2.103326, 0, 0, 0, 1, 1,
0.06423153, -1.062239, 2.816766, 0, 0, 0, 1, 1,
0.06555418, -0.325358, 3.361372, 0, 0, 0, 1, 1,
0.07162216, -1.997231, 1.862338, 0, 0, 0, 1, 1,
0.07380209, 0.7789906, 0.4726259, 0, 0, 0, 1, 1,
0.07725099, -1.345626, 3.32463, 0, 0, 0, 1, 1,
0.07837345, 1.292015, 1.278219, 0, 0, 0, 1, 1,
0.07873237, -0.0440363, 3.257585, 1, 1, 1, 1, 1,
0.09549978, -1.780794, 1.289893, 1, 1, 1, 1, 1,
0.09601574, -0.5964548, 2.276581, 1, 1, 1, 1, 1,
0.1031918, -1.088449, 4.334403, 1, 1, 1, 1, 1,
0.1156358, -1.782376, 1.699041, 1, 1, 1, 1, 1,
0.1157702, -0.2357318, 1.936579, 1, 1, 1, 1, 1,
0.1165301, 0.6715292, 0.4624701, 1, 1, 1, 1, 1,
0.1173716, -0.3077842, 4.195035, 1, 1, 1, 1, 1,
0.1221699, -1.756866, 3.615263, 1, 1, 1, 1, 1,
0.124755, 0.9199702, -0.8986562, 1, 1, 1, 1, 1,
0.1289074, -0.3949952, 2.890895, 1, 1, 1, 1, 1,
0.1307566, -1.138074, 4.155132, 1, 1, 1, 1, 1,
0.1310041, 0.3843103, -1.074593, 1, 1, 1, 1, 1,
0.1314831, -1.102315, 2.764907, 1, 1, 1, 1, 1,
0.1354653, -0.5420642, 3.295451, 1, 1, 1, 1, 1,
0.1366972, 0.6446794, 1.718933, 0, 0, 1, 1, 1,
0.1368786, 0.9002647, -0.4449226, 1, 0, 0, 1, 1,
0.1417613, -2.612098, 2.737892, 1, 0, 0, 1, 1,
0.1427444, 0.1775334, 0.2681467, 1, 0, 0, 1, 1,
0.1450679, -0.3727666, 3.47764, 1, 0, 0, 1, 1,
0.1485336, 0.1920427, 0.08662801, 1, 0, 0, 1, 1,
0.1491447, 1.018785, 2.020833, 0, 0, 0, 1, 1,
0.1502391, -1.739431, 4.495648, 0, 0, 0, 1, 1,
0.1532002, -0.5099155, 0.7874908, 0, 0, 0, 1, 1,
0.154371, -0.195359, 2.314493, 0, 0, 0, 1, 1,
0.1545682, 0.7221646, -0.4086332, 0, 0, 0, 1, 1,
0.1565, -0.02954519, 2.31672, 0, 0, 0, 1, 1,
0.1575734, 0.6291983, -1.87463, 0, 0, 0, 1, 1,
0.1615498, -0.6772715, 1.551036, 1, 1, 1, 1, 1,
0.1659057, 0.9347111, -0.4341369, 1, 1, 1, 1, 1,
0.1699947, 1.139128, 0.8787515, 1, 1, 1, 1, 1,
0.1727458, 0.64217, -0.1555007, 1, 1, 1, 1, 1,
0.1732928, 2.040746, 0.305339, 1, 1, 1, 1, 1,
0.1798601, 2.590142, -0.1850208, 1, 1, 1, 1, 1,
0.1813358, 0.9097572, 0.4377449, 1, 1, 1, 1, 1,
0.1878503, 0.4870371, 1.114814, 1, 1, 1, 1, 1,
0.1893073, -0.6208917, 1.908642, 1, 1, 1, 1, 1,
0.1929234, -0.09154443, 1.738996, 1, 1, 1, 1, 1,
0.1935094, 0.8375165, 1.307417, 1, 1, 1, 1, 1,
0.194243, -0.6286144, 4.097874, 1, 1, 1, 1, 1,
0.1976027, 0.3340865, 0.08290967, 1, 1, 1, 1, 1,
0.2124904, -0.6571684, 1.059234, 1, 1, 1, 1, 1,
0.2136016, -1.979367, 2.587288, 1, 1, 1, 1, 1,
0.2147429, 0.7485507, 0.9246491, 0, 0, 1, 1, 1,
0.2218739, -0.3942877, 1.916564, 1, 0, 0, 1, 1,
0.2239694, 0.1419165, 0.6630233, 1, 0, 0, 1, 1,
0.2289666, -1.21821, 2.487041, 1, 0, 0, 1, 1,
0.2302824, -1.106691, 1.908139, 1, 0, 0, 1, 1,
0.2321048, -0.7793842, 4.1484, 1, 0, 0, 1, 1,
0.2331759, -0.3421784, 3.771505, 0, 0, 0, 1, 1,
0.2339496, 0.4122756, 2.048614, 0, 0, 0, 1, 1,
0.246319, 0.1526491, 1.78547, 0, 0, 0, 1, 1,
0.2572227, 1.068229, 1.802979, 0, 0, 0, 1, 1,
0.259001, -1.137529, 2.327864, 0, 0, 0, 1, 1,
0.2594383, 0.1321694, 2.982245, 0, 0, 0, 1, 1,
0.2604098, -1.96168, 4.243485, 0, 0, 0, 1, 1,
0.2643583, -1.256033, 2.445287, 1, 1, 1, 1, 1,
0.2645057, 0.2136305, 1.780947, 1, 1, 1, 1, 1,
0.2653443, -0.3363629, 4.049456, 1, 1, 1, 1, 1,
0.2676643, -0.9496603, 2.681942, 1, 1, 1, 1, 1,
0.2677879, 0.1142448, 1.366721, 1, 1, 1, 1, 1,
0.269815, -1.819976, 3.441261, 1, 1, 1, 1, 1,
0.2706419, -1.029463, 4.519658, 1, 1, 1, 1, 1,
0.2745006, 1.021625, 0.2684871, 1, 1, 1, 1, 1,
0.2745297, -0.3684766, 3.930634, 1, 1, 1, 1, 1,
0.2762876, -1.631424, 3.73234, 1, 1, 1, 1, 1,
0.2816723, -1.228114, 3.438061, 1, 1, 1, 1, 1,
0.2836488, -0.2584749, 2.022395, 1, 1, 1, 1, 1,
0.288341, -0.04725942, 1.507048, 1, 1, 1, 1, 1,
0.2952586, 0.7756882, -1.669804, 1, 1, 1, 1, 1,
0.3113557, 0.4462998, -0.3652928, 1, 1, 1, 1, 1,
0.3122815, 1.092311, 1.119565, 0, 0, 1, 1, 1,
0.3154089, 1.187703, -0.3082, 1, 0, 0, 1, 1,
0.33, -0.2734861, 1.959543, 1, 0, 0, 1, 1,
0.3396457, -1.846719, 3.166777, 1, 0, 0, 1, 1,
0.3423821, -0.6238723, 2.789439, 1, 0, 0, 1, 1,
0.3444213, 0.1061224, 0.8714797, 1, 0, 0, 1, 1,
0.3482563, -1.048593, 3.16418, 0, 0, 0, 1, 1,
0.3488473, -1.480292, 3.176111, 0, 0, 0, 1, 1,
0.3535278, -2.443693, 2.767065, 0, 0, 0, 1, 1,
0.3538336, 0.7160612, 1.640899, 0, 0, 0, 1, 1,
0.3543802, 0.3916236, 2.333315, 0, 0, 0, 1, 1,
0.3594074, 1.614476, 0.4154038, 0, 0, 0, 1, 1,
0.3625991, 1.827051, 0.5024098, 0, 0, 0, 1, 1,
0.3656455, 0.4352595, 0.631826, 1, 1, 1, 1, 1,
0.3687744, 0.9410201, 0.5351581, 1, 1, 1, 1, 1,
0.3705712, -0.39387, 3.166973, 1, 1, 1, 1, 1,
0.3711418, 1.678995, -0.309748, 1, 1, 1, 1, 1,
0.3713212, 0.9930378, 0.6092108, 1, 1, 1, 1, 1,
0.372456, -0.4551436, 3.305337, 1, 1, 1, 1, 1,
0.3732729, 1.225866, 0.3923099, 1, 1, 1, 1, 1,
0.3737496, 0.1060233, 0.610018, 1, 1, 1, 1, 1,
0.3753197, 0.2143498, -0.1348517, 1, 1, 1, 1, 1,
0.3753365, 0.8728277, 1.054593, 1, 1, 1, 1, 1,
0.377864, 0.2218859, 1.850805, 1, 1, 1, 1, 1,
0.3802919, 1.135072, 0.6736749, 1, 1, 1, 1, 1,
0.3828788, 1.351702, 1.662621, 1, 1, 1, 1, 1,
0.3836142, -1.882246, 3.895459, 1, 1, 1, 1, 1,
0.3860556, 0.3040355, 1.05543, 1, 1, 1, 1, 1,
0.3866894, -1.396412, 5.964012, 0, 0, 1, 1, 1,
0.3896328, -0.2076919, 1.750345, 1, 0, 0, 1, 1,
0.3905486, 0.475683, 0.8124669, 1, 0, 0, 1, 1,
0.40231, 0.07347018, 1.588438, 1, 0, 0, 1, 1,
0.4040573, -1.107353, 3.757077, 1, 0, 0, 1, 1,
0.4041333, 1.036284, 1.304786, 1, 0, 0, 1, 1,
0.4043048, -0.3357915, 0.8677104, 0, 0, 0, 1, 1,
0.4126334, -1.156386, 2.51674, 0, 0, 0, 1, 1,
0.4136761, -1.073576, 2.911154, 0, 0, 0, 1, 1,
0.4137285, -0.9663156, 2.046005, 0, 0, 0, 1, 1,
0.4150585, -1.258007, 4.408268, 0, 0, 0, 1, 1,
0.4201175, 1.749425, 0.1259485, 0, 0, 0, 1, 1,
0.42101, -1.496771, 3.439054, 0, 0, 0, 1, 1,
0.4254933, 0.03559656, 1.083673, 1, 1, 1, 1, 1,
0.426848, 0.5887141, 0.3542024, 1, 1, 1, 1, 1,
0.4289524, 0.8487304, 0.3166659, 1, 1, 1, 1, 1,
0.4358454, -1.378246, 2.572213, 1, 1, 1, 1, 1,
0.4376082, -0.7922477, 2.679568, 1, 1, 1, 1, 1,
0.4435171, -0.677738, 3.555115, 1, 1, 1, 1, 1,
0.4454499, 0.2982588, 0.8900845, 1, 1, 1, 1, 1,
0.4505968, -0.2417758, 1.513689, 1, 1, 1, 1, 1,
0.4515514, -0.462682, 3.444953, 1, 1, 1, 1, 1,
0.4516006, 1.148713, 1.058508, 1, 1, 1, 1, 1,
0.4531836, -0.09506813, 2.161849, 1, 1, 1, 1, 1,
0.4570125, -1.90827, 2.824403, 1, 1, 1, 1, 1,
0.4573599, 0.868933, 0.06099989, 1, 1, 1, 1, 1,
0.4636727, 0.009801018, 1.147147, 1, 1, 1, 1, 1,
0.4657913, -1.179002, 5.112498, 1, 1, 1, 1, 1,
0.4675769, 0.4192628, 2.302019, 0, 0, 1, 1, 1,
0.4690697, -0.3413269, 3.545622, 1, 0, 0, 1, 1,
0.4694971, 0.7685425, 1.761699, 1, 0, 0, 1, 1,
0.4723839, 1.407807, -1.268526, 1, 0, 0, 1, 1,
0.4794954, -0.427319, 2.143824, 1, 0, 0, 1, 1,
0.4797024, -0.3898696, 2.099067, 1, 0, 0, 1, 1,
0.4843237, -0.1970546, 2.487205, 0, 0, 0, 1, 1,
0.48503, 2.03507, 0.9048472, 0, 0, 0, 1, 1,
0.487734, -0.06696631, 2.203986, 0, 0, 0, 1, 1,
0.4892953, 0.1337862, 1.259569, 0, 0, 0, 1, 1,
0.4955049, 1.129495, -1.276616, 0, 0, 0, 1, 1,
0.4961901, 0.9269882, 0.8955195, 0, 0, 0, 1, 1,
0.4985634, 1.466706, 0.5675274, 0, 0, 0, 1, 1,
0.4990796, 1.159847, 0.2961586, 1, 1, 1, 1, 1,
0.5008395, -0.2270803, 1.576537, 1, 1, 1, 1, 1,
0.5048435, -0.1383384, 2.446674, 1, 1, 1, 1, 1,
0.5157788, -0.2235414, 3.430475, 1, 1, 1, 1, 1,
0.5169701, -0.05610707, 2.372002, 1, 1, 1, 1, 1,
0.5179738, -0.7497487, 0.7847478, 1, 1, 1, 1, 1,
0.5281861, 1.523924, 2.532297, 1, 1, 1, 1, 1,
0.5287852, -1.506011, 1.600629, 1, 1, 1, 1, 1,
0.535845, -1.013608, 3.749086, 1, 1, 1, 1, 1,
0.5375637, 0.4718593, 2.522023, 1, 1, 1, 1, 1,
0.5390612, 0.5613444, 0.08215021, 1, 1, 1, 1, 1,
0.5404264, -1.113697, 2.015442, 1, 1, 1, 1, 1,
0.5429963, -1.015587, 1.770411, 1, 1, 1, 1, 1,
0.5451245, -0.4654801, 2.074064, 1, 1, 1, 1, 1,
0.5509962, -2.684183, 3.00536, 1, 1, 1, 1, 1,
0.5558304, 0.3099733, 0.4489821, 0, 0, 1, 1, 1,
0.5584515, -1.535017, 3.033965, 1, 0, 0, 1, 1,
0.5656232, -1.464267, 2.180632, 1, 0, 0, 1, 1,
0.5662376, 1.094598, 0.3599327, 1, 0, 0, 1, 1,
0.5671418, 0.3521424, 0.2513972, 1, 0, 0, 1, 1,
0.567364, 1.656459, -0.4919257, 1, 0, 0, 1, 1,
0.5685346, 0.3024852, 2.0019, 0, 0, 0, 1, 1,
0.5713235, -1.197063, 3.524378, 0, 0, 0, 1, 1,
0.5748199, 1.001226, 1.059799, 0, 0, 0, 1, 1,
0.5749122, 0.4988875, 1.607538, 0, 0, 0, 1, 1,
0.5760095, -0.0751126, 3.282738, 0, 0, 0, 1, 1,
0.5766148, -1.077087, 2.544115, 0, 0, 0, 1, 1,
0.5766435, -2.516238, 3.556224, 0, 0, 0, 1, 1,
0.5771179, 1.307383, -0.3664772, 1, 1, 1, 1, 1,
0.5779321, -0.9890642, 2.190137, 1, 1, 1, 1, 1,
0.5801678, -0.2564425, 1.524116, 1, 1, 1, 1, 1,
0.5857063, 0.3639464, 0.9811527, 1, 1, 1, 1, 1,
0.586652, 1.923599, -1.319051, 1, 1, 1, 1, 1,
0.5909557, 0.6767102, 1.469132, 1, 1, 1, 1, 1,
0.5928709, -0.3566727, 3.464191, 1, 1, 1, 1, 1,
0.6026614, 0.2877223, 1.025961, 1, 1, 1, 1, 1,
0.6052933, 1.055527, 0.4811248, 1, 1, 1, 1, 1,
0.6133191, -0.625008, 3.339143, 1, 1, 1, 1, 1,
0.6161649, 0.2139918, 0.7910944, 1, 1, 1, 1, 1,
0.6284819, 1.600645, -0.01917106, 1, 1, 1, 1, 1,
0.63332, -0.3298476, 2.827667, 1, 1, 1, 1, 1,
0.6377327, -0.06723034, 2.130121, 1, 1, 1, 1, 1,
0.6460261, -0.5520446, 2.320149, 1, 1, 1, 1, 1,
0.6461962, -0.6133167, 2.547175, 0, 0, 1, 1, 1,
0.6466543, -0.1267418, 1.166934, 1, 0, 0, 1, 1,
0.6503403, -1.761773, 1.604566, 1, 0, 0, 1, 1,
0.6544479, -0.4884312, 2.193736, 1, 0, 0, 1, 1,
0.6577501, -2.144532, 2.5264, 1, 0, 0, 1, 1,
0.6579226, 1.144317, 0.1548354, 1, 0, 0, 1, 1,
0.6588403, -1.433495, 2.117724, 0, 0, 0, 1, 1,
0.6608073, 0.1500801, 1.022728, 0, 0, 0, 1, 1,
0.6620491, 0.9832812, -0.01472701, 0, 0, 0, 1, 1,
0.6641638, -1.594971, 4.102451, 0, 0, 0, 1, 1,
0.6760538, -0.2418567, 1.388963, 0, 0, 0, 1, 1,
0.6783547, -1.758199, 2.303483, 0, 0, 0, 1, 1,
0.6823611, -0.6018158, 2.520447, 0, 0, 0, 1, 1,
0.6891483, -3.124455, 3.915718, 1, 1, 1, 1, 1,
0.6912208, 1.633899, -0.4044155, 1, 1, 1, 1, 1,
0.6932924, 0.5932373, -0.08608868, 1, 1, 1, 1, 1,
0.7002373, -1.430398, 2.550811, 1, 1, 1, 1, 1,
0.7020635, -0.7997302, 2.549564, 1, 1, 1, 1, 1,
0.7146088, 0.7362806, -0.6185865, 1, 1, 1, 1, 1,
0.7166217, -0.3036782, 1.237999, 1, 1, 1, 1, 1,
0.7194429, 0.329964, 2.326392, 1, 1, 1, 1, 1,
0.7223875, -0.08861847, 1.440813, 1, 1, 1, 1, 1,
0.7235329, 0.249708, 1.294628, 1, 1, 1, 1, 1,
0.723592, 0.8010383, 1.490969, 1, 1, 1, 1, 1,
0.7242952, 0.5200154, 1.638096, 1, 1, 1, 1, 1,
0.7271249, -1.080834, 3.569913, 1, 1, 1, 1, 1,
0.7286611, -0.05322872, 2.190718, 1, 1, 1, 1, 1,
0.7289592, 2.126403, -0.7389159, 1, 1, 1, 1, 1,
0.7337881, -0.558516, 1.995066, 0, 0, 1, 1, 1,
0.7339293, 0.2779082, 2.723868, 1, 0, 0, 1, 1,
0.7354437, -0.0682677, 1.602093, 1, 0, 0, 1, 1,
0.7357512, 0.1096508, 2.017021, 1, 0, 0, 1, 1,
0.7375048, -0.2993986, 2.069132, 1, 0, 0, 1, 1,
0.7378471, -0.3503672, 0.8111928, 1, 0, 0, 1, 1,
0.7498213, 0.3679222, -1.326401, 0, 0, 0, 1, 1,
0.7512229, -0.5596901, 0.7129956, 0, 0, 0, 1, 1,
0.7537763, 0.536513, -0.5349694, 0, 0, 0, 1, 1,
0.755272, 0.1910404, -0.4648602, 0, 0, 0, 1, 1,
0.7586952, -0.3883063, 2.411268, 0, 0, 0, 1, 1,
0.7649611, -0.09131509, 2.027763, 0, 0, 0, 1, 1,
0.7698643, -1.114191, 2.719311, 0, 0, 0, 1, 1,
0.7699524, 1.449064, -0.4360645, 1, 1, 1, 1, 1,
0.7720695, 0.3563945, 0.4610402, 1, 1, 1, 1, 1,
0.7733576, 3.262016, 0.0128271, 1, 1, 1, 1, 1,
0.7738585, -0.4079727, 2.714153, 1, 1, 1, 1, 1,
0.7743624, 0.4781107, 2.092962, 1, 1, 1, 1, 1,
0.7797529, 0.7099463, 1.039516, 1, 1, 1, 1, 1,
0.7930601, -0.3804911, 0.9990109, 1, 1, 1, 1, 1,
0.799575, 0.4276311, 0.9788339, 1, 1, 1, 1, 1,
0.8063153, -0.2021584, 4.369214, 1, 1, 1, 1, 1,
0.8155242, -0.6022418, 1.269093, 1, 1, 1, 1, 1,
0.8279424, -0.6563392, 1.49704, 1, 1, 1, 1, 1,
0.8327934, -0.1053354, 1.719731, 1, 1, 1, 1, 1,
0.8343723, 1.550741, 3.205744, 1, 1, 1, 1, 1,
0.8386807, 0.07285155, 1.36551, 1, 1, 1, 1, 1,
0.8428729, 0.8816702, 1.458917, 1, 1, 1, 1, 1,
0.8431888, 0.7287167, 0.0724213, 0, 0, 1, 1, 1,
0.8454587, -1.906855, 2.672266, 1, 0, 0, 1, 1,
0.8473033, 0.2950869, 1.89707, 1, 0, 0, 1, 1,
0.8501129, -1.273658, 3.216376, 1, 0, 0, 1, 1,
0.8511859, -1.669394, 2.275093, 1, 0, 0, 1, 1,
0.8521783, -0.02309634, 2.059556, 1, 0, 0, 1, 1,
0.8555338, -0.755038, 1.480664, 0, 0, 0, 1, 1,
0.8566061, -0.1380764, 0.6249167, 0, 0, 0, 1, 1,
0.8586609, 0.7675963, 0.3231967, 0, 0, 0, 1, 1,
0.8644093, -0.1279335, 3.427325, 0, 0, 0, 1, 1,
0.8720726, 0.320628, 2.617779, 0, 0, 0, 1, 1,
0.8757216, -1.02201, 2.134354, 0, 0, 0, 1, 1,
0.8805545, 0.7207296, 1.427252, 0, 0, 0, 1, 1,
0.8829821, -1.001522, 1.772719, 1, 1, 1, 1, 1,
0.886871, 1.120131, 0.549822, 1, 1, 1, 1, 1,
0.8902087, -0.5156553, 1.569417, 1, 1, 1, 1, 1,
0.9033443, -0.2503357, 0.3486354, 1, 1, 1, 1, 1,
0.9094297, -0.6533592, 3.271544, 1, 1, 1, 1, 1,
0.9143341, -1.992482, 3.439123, 1, 1, 1, 1, 1,
0.9144036, -0.3183921, 1.375316, 1, 1, 1, 1, 1,
0.9165782, -0.4790556, 3.020124, 1, 1, 1, 1, 1,
0.9180578, -0.3152831, 2.194702, 1, 1, 1, 1, 1,
0.9189564, -0.5357685, 1.858803, 1, 1, 1, 1, 1,
0.9202229, 1.801269, 0.6057802, 1, 1, 1, 1, 1,
0.9210218, 1.067585, 0.460367, 1, 1, 1, 1, 1,
0.9296663, -0.3186575, 2.419025, 1, 1, 1, 1, 1,
0.9308777, -0.5811476, 0.7267646, 1, 1, 1, 1, 1,
0.9330382, -0.5830124, 3.607689, 1, 1, 1, 1, 1,
0.9382566, -0.3565808, 2.531883, 0, 0, 1, 1, 1,
0.9429284, -0.2061503, 1.10424, 1, 0, 0, 1, 1,
0.9518695, -0.1946412, 0.5305166, 1, 0, 0, 1, 1,
0.955142, 0.5541257, 0.7366267, 1, 0, 0, 1, 1,
0.956692, 1.288827, -0.1322861, 1, 0, 0, 1, 1,
0.9639605, -1.042036, 2.15612, 1, 0, 0, 1, 1,
0.9719523, 0.5927896, 2.173496, 0, 0, 0, 1, 1,
0.9766325, 1.514187, -0.1536691, 0, 0, 0, 1, 1,
0.9770624, 0.4400803, 1.25781, 0, 0, 0, 1, 1,
0.9873166, -0.8756882, 3.869157, 0, 0, 0, 1, 1,
0.9929907, 0.0896285, 1.014642, 0, 0, 0, 1, 1,
0.9955344, 0.2786706, 0.6079323, 0, 0, 0, 1, 1,
0.9969009, 0.2155829, 1.955778, 0, 0, 0, 1, 1,
1.001972, 1.286788, 0.8798267, 1, 1, 1, 1, 1,
1.002251, 0.978716, -0.8380117, 1, 1, 1, 1, 1,
1.006966, -0.2002214, 2.687673, 1, 1, 1, 1, 1,
1.022231, -0.6679958, 1.444329, 1, 1, 1, 1, 1,
1.022791, 0.65034, 1.949093, 1, 1, 1, 1, 1,
1.02441, 0.02717483, 1.629585, 1, 1, 1, 1, 1,
1.024457, -1.330405, 3.043411, 1, 1, 1, 1, 1,
1.030863, -1.19579, 3.203723, 1, 1, 1, 1, 1,
1.031583, 0.3570745, 0.8558037, 1, 1, 1, 1, 1,
1.035699, 1.56229, 0.5766718, 1, 1, 1, 1, 1,
1.038937, 1.028593, 1.326192, 1, 1, 1, 1, 1,
1.041068, -0.1194021, 1.174538, 1, 1, 1, 1, 1,
1.042688, 0.1217192, 1.6006, 1, 1, 1, 1, 1,
1.044842, 0.7192131, 2.483209, 1, 1, 1, 1, 1,
1.052981, -0.4769396, 1.568039, 1, 1, 1, 1, 1,
1.056207, -2.479266, 2.701127, 0, 0, 1, 1, 1,
1.069021, 0.6681898, 0.9179783, 1, 0, 0, 1, 1,
1.075398, -0.1160174, 0.8722076, 1, 0, 0, 1, 1,
1.079586, -1.525789, 3.018054, 1, 0, 0, 1, 1,
1.080186, -0.1385818, 2.780727, 1, 0, 0, 1, 1,
1.082185, -1.116193, 2.679034, 1, 0, 0, 1, 1,
1.085787, 1.268786, 1.930276, 0, 0, 0, 1, 1,
1.089727, 1.265901, 1.696766, 0, 0, 0, 1, 1,
1.091253, -1.14924, 3.317148, 0, 0, 0, 1, 1,
1.094386, 0.381198, 0.675082, 0, 0, 0, 1, 1,
1.095824, -1.220006, 2.838321, 0, 0, 0, 1, 1,
1.10322, -0.9596287, 2.566611, 0, 0, 0, 1, 1,
1.105638, -1.023749, 3.230345, 0, 0, 0, 1, 1,
1.108406, 2.180542, 0.9896366, 1, 1, 1, 1, 1,
1.116536, -0.5604872, 2.704105, 1, 1, 1, 1, 1,
1.131029, 1.688684, -0.87348, 1, 1, 1, 1, 1,
1.131592, -1.079018, 1.115703, 1, 1, 1, 1, 1,
1.137041, 0.3973453, 1.931529, 1, 1, 1, 1, 1,
1.145308, 1.147097, 2.034824, 1, 1, 1, 1, 1,
1.153621, -0.7793723, 2.76432, 1, 1, 1, 1, 1,
1.154345, -0.6259216, 2.63871, 1, 1, 1, 1, 1,
1.15651, -0.2031132, 1.274039, 1, 1, 1, 1, 1,
1.156781, -1.049261, 3.096358, 1, 1, 1, 1, 1,
1.158769, 2.180767, 0.06350518, 1, 1, 1, 1, 1,
1.158802, -1.295548, 2.005265, 1, 1, 1, 1, 1,
1.162204, 0.4452692, 0.8528029, 1, 1, 1, 1, 1,
1.179236, 1.336021, -0.5570154, 1, 1, 1, 1, 1,
1.183855, -0.2627791, 3.059712, 1, 1, 1, 1, 1,
1.18394, -2.31426, 3.626806, 0, 0, 1, 1, 1,
1.186223, 1.14387, 0.1640243, 1, 0, 0, 1, 1,
1.190776, 1.189778, 1.415011, 1, 0, 0, 1, 1,
1.202971, -0.6650066, 1.337236, 1, 0, 0, 1, 1,
1.205248, -0.1554022, 1.195252, 1, 0, 0, 1, 1,
1.214515, 0.8780184, 2.128015, 1, 0, 0, 1, 1,
1.2164, -0.6260049, 2.1449, 0, 0, 0, 1, 1,
1.216832, -0.5915487, 0.9706343, 0, 0, 0, 1, 1,
1.222756, 0.07399172, -0.402194, 0, 0, 0, 1, 1,
1.224, 0.9693995, 0.5749646, 0, 0, 0, 1, 1,
1.228779, -0.5193381, 2.279448, 0, 0, 0, 1, 1,
1.230659, 0.5262027, 2.292088, 0, 0, 0, 1, 1,
1.23556, -0.4417933, 0.8065844, 0, 0, 0, 1, 1,
1.240096, -0.4208627, 1.793383, 1, 1, 1, 1, 1,
1.246305, 0.4039516, 3.148633, 1, 1, 1, 1, 1,
1.246691, 1.468783, -1.008377, 1, 1, 1, 1, 1,
1.252718, 2.026794, 0.1099894, 1, 1, 1, 1, 1,
1.255182, -0.1298893, 3.315126, 1, 1, 1, 1, 1,
1.257445, 0.3435579, 1.374049, 1, 1, 1, 1, 1,
1.259262, -1.161487, 2.209698, 1, 1, 1, 1, 1,
1.260908, -0.6514139, -0.008347563, 1, 1, 1, 1, 1,
1.262035, -0.06186314, 2.626107, 1, 1, 1, 1, 1,
1.265637, 0.5922126, 1.393927, 1, 1, 1, 1, 1,
1.274833, -0.08640445, 2.535499, 1, 1, 1, 1, 1,
1.278223, 0.7731461, 0.8034276, 1, 1, 1, 1, 1,
1.279205, -0.01127776, 1.278466, 1, 1, 1, 1, 1,
1.295101, -0.479078, 1.845011, 1, 1, 1, 1, 1,
1.300952, 0.5273818, 1.354956, 1, 1, 1, 1, 1,
1.306504, 1.404684, 2.189896, 0, 0, 1, 1, 1,
1.310867, -0.8192323, 1.086233, 1, 0, 0, 1, 1,
1.312092, 1.067041, 2.254435, 1, 0, 0, 1, 1,
1.315551, 0.512839, 1.070875, 1, 0, 0, 1, 1,
1.318055, 1.082243, -0.5943814, 1, 0, 0, 1, 1,
1.318386, -0.4806104, 2.723045, 1, 0, 0, 1, 1,
1.324577, -1.212407, 3.661072, 0, 0, 0, 1, 1,
1.334279, 0.5592859, 1.194695, 0, 0, 0, 1, 1,
1.336579, 1.062473, 1.394773, 0, 0, 0, 1, 1,
1.336637, -0.523092, 1.748484, 0, 0, 0, 1, 1,
1.338504, -0.07219594, 2.315712, 0, 0, 0, 1, 1,
1.339825, -0.6989232, 0.2337888, 0, 0, 0, 1, 1,
1.343113, -1.850759, 2.013085, 0, 0, 0, 1, 1,
1.347783, -0.4499673, 1.199262, 1, 1, 1, 1, 1,
1.358116, 0.4484162, 0.7278247, 1, 1, 1, 1, 1,
1.361306, 1.415149, 1.435089, 1, 1, 1, 1, 1,
1.369036, 0.9188855, 0.8268747, 1, 1, 1, 1, 1,
1.377787, -0.05971693, 2.096056, 1, 1, 1, 1, 1,
1.382336, -0.3360566, 3.491009, 1, 1, 1, 1, 1,
1.386293, 0.5387297, -0.4836389, 1, 1, 1, 1, 1,
1.389478, 0.7150313, 2.031756, 1, 1, 1, 1, 1,
1.394178, -0.07868942, 2.331121, 1, 1, 1, 1, 1,
1.418253, -0.3747398, 0.2241925, 1, 1, 1, 1, 1,
1.436235, -0.07025515, 2.82801, 1, 1, 1, 1, 1,
1.448889, -0.229213, 1.588666, 1, 1, 1, 1, 1,
1.450277, 0.1994124, 0.3053609, 1, 1, 1, 1, 1,
1.45342, 0.5358763, 0.5207738, 1, 1, 1, 1, 1,
1.459094, 0.2204106, 0.7081518, 1, 1, 1, 1, 1,
1.469512, 0.2958963, 2.370288, 0, 0, 1, 1, 1,
1.469736, 0.9479204, 0.3151799, 1, 0, 0, 1, 1,
1.470544, -0.8432671, 0.6664403, 1, 0, 0, 1, 1,
1.479435, 1.14033, 2.260975, 1, 0, 0, 1, 1,
1.494733, -0.2589342, 0.9985569, 1, 0, 0, 1, 1,
1.496429, 0.791056, 0.2821678, 1, 0, 0, 1, 1,
1.497449, -0.4576161, 2.425622, 0, 0, 0, 1, 1,
1.520178, -0.5644778, 2.357777, 0, 0, 0, 1, 1,
1.52451, 0.06780912, 3.866249, 0, 0, 0, 1, 1,
1.524682, -0.6341003, 2.390328, 0, 0, 0, 1, 1,
1.525846, -1.436678, 1.912777, 0, 0, 0, 1, 1,
1.534692, -1.477215, 3.739022, 0, 0, 0, 1, 1,
1.53591, 0.8274722, 0.8986992, 0, 0, 0, 1, 1,
1.538326, 1.563029, 0.4658448, 1, 1, 1, 1, 1,
1.546446, -1.582309, 4.414775, 1, 1, 1, 1, 1,
1.552049, 0.6107211, -0.9135233, 1, 1, 1, 1, 1,
1.554126, -0.4551013, 2.407323, 1, 1, 1, 1, 1,
1.55675, 0.1625643, 1.716971, 1, 1, 1, 1, 1,
1.557392, 0.1676673, 1.508045, 1, 1, 1, 1, 1,
1.568587, -3.039091, 4.166011, 1, 1, 1, 1, 1,
1.581739, -0.1669162, -0.4340928, 1, 1, 1, 1, 1,
1.581838, 0.01962628, 1.840112, 1, 1, 1, 1, 1,
1.586505, 0.2268908, 2.806081, 1, 1, 1, 1, 1,
1.586726, 0.2595331, 2.447842, 1, 1, 1, 1, 1,
1.593927, -0.4023533, 0.9205958, 1, 1, 1, 1, 1,
1.603518, 0.9108373, -0.2619416, 1, 1, 1, 1, 1,
1.608028, -0.5881117, -0.7262225, 1, 1, 1, 1, 1,
1.609897, -2.265636, 2.040359, 1, 1, 1, 1, 1,
1.610456, -0.1928875, 2.539261, 0, 0, 1, 1, 1,
1.620213, -0.1737358, 3.886327, 1, 0, 0, 1, 1,
1.635904, 0.8774952, 0.2778758, 1, 0, 0, 1, 1,
1.648325, 0.869939, -0.08981591, 1, 0, 0, 1, 1,
1.652919, 0.3950116, 0.5772544, 1, 0, 0, 1, 1,
1.6651, 0.310946, 1.503881, 1, 0, 0, 1, 1,
1.682492, 0.02725204, 1.084449, 0, 0, 0, 1, 1,
1.683987, 1.932662, 1.945063, 0, 0, 0, 1, 1,
1.706394, -0.02891428, 0.7667257, 0, 0, 0, 1, 1,
1.718451, -1.943472, 0.7692686, 0, 0, 0, 1, 1,
1.733965, 0.9695522, 1.116719, 0, 0, 0, 1, 1,
1.742726, 0.6969249, 1.472694, 0, 0, 0, 1, 1,
1.747831, -0.5126129, 1.984875, 0, 0, 0, 1, 1,
1.763001, 1.322281, 2.885578, 1, 1, 1, 1, 1,
1.763273, 0.7027132, 0.4682025, 1, 1, 1, 1, 1,
1.768032, 0.1096206, 1.886954, 1, 1, 1, 1, 1,
1.768352, 1.048608, 0.2519839, 1, 1, 1, 1, 1,
1.769683, 1.025404, 2.240132, 1, 1, 1, 1, 1,
1.799379, 1.12489, -0.06704173, 1, 1, 1, 1, 1,
1.820786, 0.2720837, 1.877293, 1, 1, 1, 1, 1,
1.830764, -0.2037448, 1.597409, 1, 1, 1, 1, 1,
1.833557, 0.9067156, 0.5922312, 1, 1, 1, 1, 1,
1.8386, 0.7586974, 1.649141, 1, 1, 1, 1, 1,
1.87015, 0.2846478, 1.367903, 1, 1, 1, 1, 1,
1.893149, -2.596244, 3.593474, 1, 1, 1, 1, 1,
1.898659, -0.7738289, 3.627094, 1, 1, 1, 1, 1,
1.967789, 1.096008, -0.9009005, 1, 1, 1, 1, 1,
1.978523, 1.154261, 1.321484, 1, 1, 1, 1, 1,
2.018316, -0.5335013, 2.454179, 0, 0, 1, 1, 1,
2.021104, 0.659119, 1.582893, 1, 0, 0, 1, 1,
2.136987, 0.1521691, 0.2993844, 1, 0, 0, 1, 1,
2.149726, -1.025006, 1.992314, 1, 0, 0, 1, 1,
2.224063, -0.8345408, 0.6715328, 1, 0, 0, 1, 1,
2.237164, -0.2852823, 1.881227, 1, 0, 0, 1, 1,
2.262014, 0.1091436, 1.809405, 0, 0, 0, 1, 1,
2.264576, 1.684434, 2.474174, 0, 0, 0, 1, 1,
2.318694, -0.8568355, 0.7265801, 0, 0, 0, 1, 1,
2.324335, -0.5027012, 2.260941, 0, 0, 0, 1, 1,
2.342627, -0.8571354, 2.386974, 0, 0, 0, 1, 1,
2.359564, 0.8800346, 0.8708478, 0, 0, 0, 1, 1,
2.494283, 0.125093, 0.6356947, 0, 0, 0, 1, 1,
2.499747, -0.04443169, 0.6981375, 1, 1, 1, 1, 1,
2.542485, -0.5892157, 2.373546, 1, 1, 1, 1, 1,
2.635428, -1.186721, 2.632534, 1, 1, 1, 1, 1,
2.651395, 1.376013, 1.321772, 1, 1, 1, 1, 1,
2.716937, 1.627324, 0.609382, 1, 1, 1, 1, 1,
3.263607, 0.1647103, 1.044717, 1, 1, 1, 1, 1,
3.376295, 0.5731139, 3.150101, 1, 1, 1, 1, 1
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
var radius = 10.00536;
var distance = 35.14342;
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
mvMatrix.translate( 0.05183744, 0.08618021, -0.3143392 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.14342);
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
