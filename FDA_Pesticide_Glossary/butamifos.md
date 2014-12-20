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
-2.869289, 0.3332478, -2.235171, 1, 0, 0, 1,
-2.778567, -0.2306388, -2.026689, 1, 0.007843138, 0, 1,
-2.639934, 0.7124062, -1.74897, 1, 0.01176471, 0, 1,
-2.566353, -0.5271075, -3.620759, 1, 0.01960784, 0, 1,
-2.55709, 1.501626, -1.785794, 1, 0.02352941, 0, 1,
-2.542271, -0.3733621, -2.772082, 1, 0.03137255, 0, 1,
-2.504095, 0.1340466, -2.036188, 1, 0.03529412, 0, 1,
-2.478032, -1.160362, -2.976442, 1, 0.04313726, 0, 1,
-2.472442, -1.855097, -2.280031, 1, 0.04705882, 0, 1,
-2.429969, -1.654013, -1.690588, 1, 0.05490196, 0, 1,
-2.421998, 1.471808, -2.197433, 1, 0.05882353, 0, 1,
-2.415738, -0.09824159, -0.6098523, 1, 0.06666667, 0, 1,
-2.38456, 0.321846, -0.4414324, 1, 0.07058824, 0, 1,
-2.320039, -0.5503133, -1.974289, 1, 0.07843138, 0, 1,
-2.275409, 1.471723, -0.2973431, 1, 0.08235294, 0, 1,
-2.251418, 0.04490976, -1.263219, 1, 0.09019608, 0, 1,
-2.233899, 1.415764, -0.6885738, 1, 0.09411765, 0, 1,
-2.173962, 0.468991, -1.363783, 1, 0.1019608, 0, 1,
-2.141951, -1.095007, -1.925237, 1, 0.1098039, 0, 1,
-2.075727, 1.785903, -1.18775, 1, 0.1137255, 0, 1,
-2.065449, 0.09206093, -2.814808, 1, 0.1215686, 0, 1,
-2.047944, 0.1291547, -0.4488998, 1, 0.1254902, 0, 1,
-2.034391, 0.6731153, -2.66686, 1, 0.1333333, 0, 1,
-2.01102, 0.5698316, -0.3234696, 1, 0.1372549, 0, 1,
-2.009841, -0.7553015, -0.4264029, 1, 0.145098, 0, 1,
-1.999995, 0.6676282, -1.814724, 1, 0.1490196, 0, 1,
-1.993452, -0.8131334, -1.85102, 1, 0.1568628, 0, 1,
-1.936792, 1.507369, -0.4543144, 1, 0.1607843, 0, 1,
-1.921351, -0.2659134, -1.142979, 1, 0.1686275, 0, 1,
-1.919426, -0.4477679, -0.6864606, 1, 0.172549, 0, 1,
-1.860995, -1.751199, -3.254665, 1, 0.1803922, 0, 1,
-1.858805, 2.575336, -0.5742481, 1, 0.1843137, 0, 1,
-1.85727, 0.82952, -0.7285616, 1, 0.1921569, 0, 1,
-1.823716, -1.579754, -2.428904, 1, 0.1960784, 0, 1,
-1.814458, 1.708206, -0.8817786, 1, 0.2039216, 0, 1,
-1.808312, -0.4556981, -2.840636, 1, 0.2117647, 0, 1,
-1.788614, -1.162124, -1.514967, 1, 0.2156863, 0, 1,
-1.786567, -0.1576003, -0.207992, 1, 0.2235294, 0, 1,
-1.773209, -1.257074, -2.708546, 1, 0.227451, 0, 1,
-1.762725, 0.9302407, -2.364652, 1, 0.2352941, 0, 1,
-1.761812, 0.3906223, -2.087625, 1, 0.2392157, 0, 1,
-1.746798, -0.03062066, -2.957856, 1, 0.2470588, 0, 1,
-1.744951, 1.417033, -1.715213, 1, 0.2509804, 0, 1,
-1.730243, -0.3735218, -2.063767, 1, 0.2588235, 0, 1,
-1.728023, 1.186721, -1.757641, 1, 0.2627451, 0, 1,
-1.726562, -0.7163056, -1.331858, 1, 0.2705882, 0, 1,
-1.71902, -0.5893326, -1.34909, 1, 0.2745098, 0, 1,
-1.712707, -1.075345, -3.607351, 1, 0.282353, 0, 1,
-1.710319, -1.427031, -4.073892, 1, 0.2862745, 0, 1,
-1.688768, -0.4460669, -0.2316755, 1, 0.2941177, 0, 1,
-1.688313, 0.7367306, -0.4440791, 1, 0.3019608, 0, 1,
-1.670134, -0.1190036, -3.023853, 1, 0.3058824, 0, 1,
-1.664962, -0.4885517, -2.219688, 1, 0.3137255, 0, 1,
-1.656945, -0.008372619, -2.107363, 1, 0.3176471, 0, 1,
-1.647034, 0.5776578, -1.840757, 1, 0.3254902, 0, 1,
-1.643214, -0.7908007, -2.555866, 1, 0.3294118, 0, 1,
-1.641656, -0.800993, -1.285263, 1, 0.3372549, 0, 1,
-1.6342, -1.093931, -2.823591, 1, 0.3411765, 0, 1,
-1.616787, 0.6712601, -0.5328448, 1, 0.3490196, 0, 1,
-1.608135, -1.367401, -3.284321, 1, 0.3529412, 0, 1,
-1.59538, -0.4915579, -1.127993, 1, 0.3607843, 0, 1,
-1.592078, 1.540405, -0.7563085, 1, 0.3647059, 0, 1,
-1.568519, 0.6947111, -1.372629, 1, 0.372549, 0, 1,
-1.565466, -2.029822, -2.793794, 1, 0.3764706, 0, 1,
-1.549315, -1.209455, -1.057566, 1, 0.3843137, 0, 1,
-1.543678, 1.356953, -0.8033574, 1, 0.3882353, 0, 1,
-1.541958, 0.07270314, -1.76982, 1, 0.3960784, 0, 1,
-1.53858, -0.6346028, -3.121014, 1, 0.4039216, 0, 1,
-1.531832, -1.223493, -3.356687, 1, 0.4078431, 0, 1,
-1.52195, -1.064278, -1.4937, 1, 0.4156863, 0, 1,
-1.513303, -1.700247, -1.499259, 1, 0.4196078, 0, 1,
-1.48456, -1.116632, -3.799103, 1, 0.427451, 0, 1,
-1.469653, 0.6847412, -1.531092, 1, 0.4313726, 0, 1,
-1.464161, 0.9222989, -1.717704, 1, 0.4392157, 0, 1,
-1.457603, 0.4911145, -2.705782, 1, 0.4431373, 0, 1,
-1.456891, -1.014672, -3.428388, 1, 0.4509804, 0, 1,
-1.449768, -0.5085947, -0.9910117, 1, 0.454902, 0, 1,
-1.438461, -1.850739, -1.780255, 1, 0.4627451, 0, 1,
-1.43826, -0.3297654, -2.121363, 1, 0.4666667, 0, 1,
-1.413657, -0.4485134, -2.332998, 1, 0.4745098, 0, 1,
-1.410068, -0.516899, -2.040497, 1, 0.4784314, 0, 1,
-1.408309, 0.6338907, -0.4342397, 1, 0.4862745, 0, 1,
-1.403264, 1.385614, 0.369462, 1, 0.4901961, 0, 1,
-1.387696, -0.4453904, -2.060799, 1, 0.4980392, 0, 1,
-1.386083, -0.3255134, -3.215867, 1, 0.5058824, 0, 1,
-1.384374, -0.5013906, -2.093792, 1, 0.509804, 0, 1,
-1.378143, 0.1763659, -2.484676, 1, 0.5176471, 0, 1,
-1.373871, -0.8464696, -2.871629, 1, 0.5215687, 0, 1,
-1.367859, -1.266461, -3.521226, 1, 0.5294118, 0, 1,
-1.358121, 0.05737498, -3.881572, 1, 0.5333334, 0, 1,
-1.357466, 0.3838728, -1.379467, 1, 0.5411765, 0, 1,
-1.345595, -1.211293, -1.309892, 1, 0.5450981, 0, 1,
-1.334197, -0.8926469, -1.467726, 1, 0.5529412, 0, 1,
-1.333232, -0.5636846, -1.100121, 1, 0.5568628, 0, 1,
-1.329812, 1.163601, -2.794129, 1, 0.5647059, 0, 1,
-1.328522, 1.378401, 0.06109999, 1, 0.5686275, 0, 1,
-1.314693, 0.089471, -4.564078, 1, 0.5764706, 0, 1,
-1.313735, -0.2532926, -3.998944, 1, 0.5803922, 0, 1,
-1.311327, -1.301561, -3.19806, 1, 0.5882353, 0, 1,
-1.310084, 1.163682, 1.3246, 1, 0.5921569, 0, 1,
-1.308759, 0.2929582, 0.03535432, 1, 0.6, 0, 1,
-1.307137, 0.9315085, -0.1647709, 1, 0.6078432, 0, 1,
-1.300751, -1.109589, -3.797582, 1, 0.6117647, 0, 1,
-1.281652, 0.6151035, -0.1300739, 1, 0.6196079, 0, 1,
-1.280781, -0.2316015, -0.7826445, 1, 0.6235294, 0, 1,
-1.280275, -0.12767, -3.839506, 1, 0.6313726, 0, 1,
-1.276722, 0.1006625, -0.08475552, 1, 0.6352941, 0, 1,
-1.272161, 1.649694, -0.9836449, 1, 0.6431373, 0, 1,
-1.271108, 1.111216, 0.7641277, 1, 0.6470588, 0, 1,
-1.268399, 0.1269322, -0.9182751, 1, 0.654902, 0, 1,
-1.268238, -0.6432747, -2.519195, 1, 0.6588235, 0, 1,
-1.266472, 0.8885829, -3.210737, 1, 0.6666667, 0, 1,
-1.262861, 1.415593, 0.08762176, 1, 0.6705883, 0, 1,
-1.25868, -0.5728066, -2.693082, 1, 0.6784314, 0, 1,
-1.255877, 1.181097, -0.264403, 1, 0.682353, 0, 1,
-1.250639, 0.6872646, -1.69112, 1, 0.6901961, 0, 1,
-1.250194, -1.703348, -2.741917, 1, 0.6941177, 0, 1,
-1.244164, 1.104527, 0.3090988, 1, 0.7019608, 0, 1,
-1.234746, -1.493237, -2.48482, 1, 0.7098039, 0, 1,
-1.232797, 0.3788226, -1.841013, 1, 0.7137255, 0, 1,
-1.230931, 0.4410602, -2.282825, 1, 0.7215686, 0, 1,
-1.22449, -0.6597284, -1.387486, 1, 0.7254902, 0, 1,
-1.223939, 0.6482612, -0.9447056, 1, 0.7333333, 0, 1,
-1.214124, -0.1988713, -2.039668, 1, 0.7372549, 0, 1,
-1.212506, -0.8571395, -2.576957, 1, 0.7450981, 0, 1,
-1.211171, -1.553666, -1.889965, 1, 0.7490196, 0, 1,
-1.210702, 0.5129147, -0.9900575, 1, 0.7568628, 0, 1,
-1.202753, -0.6272483, -2.154803, 1, 0.7607843, 0, 1,
-1.197124, -1.169088, -2.839686, 1, 0.7686275, 0, 1,
-1.19634, -0.1119684, -3.54615, 1, 0.772549, 0, 1,
-1.193314, -1.569057, -1.08772, 1, 0.7803922, 0, 1,
-1.186821, 0.9667745, -0.339369, 1, 0.7843137, 0, 1,
-1.168916, -1.051637, -2.090432, 1, 0.7921569, 0, 1,
-1.155326, -1.115857, -2.578065, 1, 0.7960784, 0, 1,
-1.151971, 0.5747457, 0.3450547, 1, 0.8039216, 0, 1,
-1.148821, -1.18488, -0.2601207, 1, 0.8117647, 0, 1,
-1.147799, -0.5783819, -2.979806, 1, 0.8156863, 0, 1,
-1.145782, 0.03715444, -2.500726, 1, 0.8235294, 0, 1,
-1.143358, 1.130896, -0.7667745, 1, 0.827451, 0, 1,
-1.134919, -1.533542, -2.142306, 1, 0.8352941, 0, 1,
-1.133092, -0.1456786, -1.337833, 1, 0.8392157, 0, 1,
-1.13287, 0.2922699, -0.07042222, 1, 0.8470588, 0, 1,
-1.130755, 0.2543337, -2.343258, 1, 0.8509804, 0, 1,
-1.13072, -0.003555849, -3.957856, 1, 0.8588235, 0, 1,
-1.121692, -0.1871843, -0.814494, 1, 0.8627451, 0, 1,
-1.120273, 0.2675281, -0.6242358, 1, 0.8705882, 0, 1,
-1.119642, -0.6350431, -2.261902, 1, 0.8745098, 0, 1,
-1.116091, -0.7781969, -3.912937, 1, 0.8823529, 0, 1,
-1.113271, 0.03241748, -1.358211, 1, 0.8862745, 0, 1,
-1.110584, 0.4315301, -1.43609, 1, 0.8941177, 0, 1,
-1.108128, -1.116134, -1.048444, 1, 0.8980392, 0, 1,
-1.104448, -0.6970224, -0.5280349, 1, 0.9058824, 0, 1,
-1.095882, -0.1148566, -1.483113, 1, 0.9137255, 0, 1,
-1.091008, -0.192791, -0.9595846, 1, 0.9176471, 0, 1,
-1.087103, -1.909222, -3.858111, 1, 0.9254902, 0, 1,
-1.086065, -0.6959679, -2.182158, 1, 0.9294118, 0, 1,
-1.08224, 2.26196, -1.098464, 1, 0.9372549, 0, 1,
-1.073997, -0.09817164, -0.9465476, 1, 0.9411765, 0, 1,
-1.071897, -1.800336, -2.598104, 1, 0.9490196, 0, 1,
-1.063791, -0.1250931, -1.585569, 1, 0.9529412, 0, 1,
-1.05651, 3.393028, 1.002724, 1, 0.9607843, 0, 1,
-1.053164, -2.485829, -2.711818, 1, 0.9647059, 0, 1,
-1.04783, 0.8734021, 0.6772271, 1, 0.972549, 0, 1,
-1.040945, -0.5730838, -5.876083, 1, 0.9764706, 0, 1,
-1.03884, 0.8888716, -2.282141, 1, 0.9843137, 0, 1,
-1.036821, -0.4616991, -1.750239, 1, 0.9882353, 0, 1,
-1.012783, -2.542285, -1.706222, 1, 0.9960784, 0, 1,
-1.0101, 0.1098886, -2.620664, 0.9960784, 1, 0, 1,
-1.009262, -1.180432, -3.283776, 0.9921569, 1, 0, 1,
-1.009027, 0.8912577, -1.433252, 0.9843137, 1, 0, 1,
-0.9980014, 0.09646376, -1.310633, 0.9803922, 1, 0, 1,
-0.9852183, 0.2406289, -2.041576, 0.972549, 1, 0, 1,
-0.9825455, 0.5030707, -1.165744, 0.9686275, 1, 0, 1,
-0.9707698, 0.09480865, -1.69028, 0.9607843, 1, 0, 1,
-0.9648646, 0.4213173, 0.1236074, 0.9568627, 1, 0, 1,
-0.9629079, 0.1708419, -2.169885, 0.9490196, 1, 0, 1,
-0.961288, 0.2057532, -0.8758533, 0.945098, 1, 0, 1,
-0.9575531, -0.1270969, -0.7850468, 0.9372549, 1, 0, 1,
-0.9502313, -0.5639608, -2.775207, 0.9333333, 1, 0, 1,
-0.9408595, -1.613372, -3.037144, 0.9254902, 1, 0, 1,
-0.9360295, 0.6888728, -0.6467497, 0.9215686, 1, 0, 1,
-0.9303047, -1.329054, -2.282463, 0.9137255, 1, 0, 1,
-0.924877, 1.200972, -0.3323289, 0.9098039, 1, 0, 1,
-0.9205406, 2.034656, -0.5667804, 0.9019608, 1, 0, 1,
-0.9165532, 0.3750768, -0.08925692, 0.8941177, 1, 0, 1,
-0.9155052, -1.023833, -1.874024, 0.8901961, 1, 0, 1,
-0.9143537, 1.124706, 0.1508065, 0.8823529, 1, 0, 1,
-0.8954981, -0.7675171, -1.319058, 0.8784314, 1, 0, 1,
-0.8901402, -0.1827506, -1.955003, 0.8705882, 1, 0, 1,
-0.8900492, 0.6250333, -0.997851, 0.8666667, 1, 0, 1,
-0.8800974, 0.1880201, 1.730654, 0.8588235, 1, 0, 1,
-0.8772525, 0.3658512, -0.3999927, 0.854902, 1, 0, 1,
-0.8753387, 2.084048, -1.046438, 0.8470588, 1, 0, 1,
-0.8738258, -0.04276849, -0.7014338, 0.8431373, 1, 0, 1,
-0.869318, 2.290322, -0.4559111, 0.8352941, 1, 0, 1,
-0.8548725, -2.001056, -2.237086, 0.8313726, 1, 0, 1,
-0.8530463, 1.080046, -0.6706789, 0.8235294, 1, 0, 1,
-0.8399099, 1.36121, -0.171287, 0.8196079, 1, 0, 1,
-0.8390391, 2.204902, -0.09749129, 0.8117647, 1, 0, 1,
-0.8337336, 0.227544, -3.322505, 0.8078431, 1, 0, 1,
-0.8333091, 0.6682474, -0.5629873, 0.8, 1, 0, 1,
-0.8284335, 0.0279777, -0.5224121, 0.7921569, 1, 0, 1,
-0.8262615, -0.6187502, -3.365119, 0.7882353, 1, 0, 1,
-0.8256112, 0.7607855, -0.8543715, 0.7803922, 1, 0, 1,
-0.8188709, -0.5650939, -1.75509, 0.7764706, 1, 0, 1,
-0.8175907, 1.122932, -0.6934233, 0.7686275, 1, 0, 1,
-0.8126563, 0.6386275, 0.7661986, 0.7647059, 1, 0, 1,
-0.8104833, 1.784992, 2.299619, 0.7568628, 1, 0, 1,
-0.8098193, 0.8471224, -0.2072289, 0.7529412, 1, 0, 1,
-0.8083978, -0.6108754, -3.290798, 0.7450981, 1, 0, 1,
-0.8000538, 0.9708611, 0.2283932, 0.7411765, 1, 0, 1,
-0.7994593, -0.07762255, -0.04088378, 0.7333333, 1, 0, 1,
-0.7970086, 0.5758851, -1.90891, 0.7294118, 1, 0, 1,
-0.7965081, 1.638616, -1.3641, 0.7215686, 1, 0, 1,
-0.7951472, -0.9756194, -4.634436, 0.7176471, 1, 0, 1,
-0.7893526, 0.3141581, 0.1052173, 0.7098039, 1, 0, 1,
-0.7885218, -0.7154475, -1.61912, 0.7058824, 1, 0, 1,
-0.7837885, 0.7376881, -1.043068, 0.6980392, 1, 0, 1,
-0.7796599, -0.5015268, -3.224459, 0.6901961, 1, 0, 1,
-0.771762, 1.105969, -2.180638, 0.6862745, 1, 0, 1,
-0.7679111, -0.7171032, -3.204184, 0.6784314, 1, 0, 1,
-0.76077, 0.90064, -0.01389419, 0.6745098, 1, 0, 1,
-0.756397, -0.5134662, -2.114786, 0.6666667, 1, 0, 1,
-0.7555858, 0.832622, -0.8409882, 0.6627451, 1, 0, 1,
-0.7526765, 0.975281, -1.50579, 0.654902, 1, 0, 1,
-0.741429, 0.09856679, -2.252544, 0.6509804, 1, 0, 1,
-0.7365252, 1.184543, 1.13867, 0.6431373, 1, 0, 1,
-0.727621, -0.420386, -1.873388, 0.6392157, 1, 0, 1,
-0.7274629, 0.5116211, -0.4927792, 0.6313726, 1, 0, 1,
-0.7257468, -0.2753473, -1.255652, 0.627451, 1, 0, 1,
-0.7235013, 2.166873, 0.1077694, 0.6196079, 1, 0, 1,
-0.7216482, 0.6684198, -0.8597673, 0.6156863, 1, 0, 1,
-0.7176417, -0.2603406, -2.153963, 0.6078432, 1, 0, 1,
-0.7172139, -0.1504508, -2.756655, 0.6039216, 1, 0, 1,
-0.7127181, 1.784595, -2.510172, 0.5960785, 1, 0, 1,
-0.7124723, 1.10831, -0.9229965, 0.5882353, 1, 0, 1,
-0.7119997, -0.2147746, -2.934902, 0.5843138, 1, 0, 1,
-0.7079467, -0.2192873, -1.322744, 0.5764706, 1, 0, 1,
-0.7076505, -0.3486046, -2.287138, 0.572549, 1, 0, 1,
-0.7025793, 0.3287155, -2.589045, 0.5647059, 1, 0, 1,
-0.7008737, 0.4476269, -1.547123, 0.5607843, 1, 0, 1,
-0.6965464, -0.5212473, -2.2844, 0.5529412, 1, 0, 1,
-0.692799, -0.97639, -3.0759, 0.5490196, 1, 0, 1,
-0.6772427, 1.760373, -0.7388229, 0.5411765, 1, 0, 1,
-0.6695022, 0.3183246, -1.791362, 0.5372549, 1, 0, 1,
-0.6663313, -0.875714, -1.720664, 0.5294118, 1, 0, 1,
-0.6649153, 0.5903726, -1.498395, 0.5254902, 1, 0, 1,
-0.6632394, 0.07097156, -0.4292125, 0.5176471, 1, 0, 1,
-0.6605585, -2.391464, -2.354818, 0.5137255, 1, 0, 1,
-0.6597973, 0.5253912, -1.307857, 0.5058824, 1, 0, 1,
-0.6563253, 0.1257405, -0.5815465, 0.5019608, 1, 0, 1,
-0.6523191, 1.473691, 0.9104862, 0.4941176, 1, 0, 1,
-0.6468289, -0.6089651, -3.821386, 0.4862745, 1, 0, 1,
-0.643873, -1.051671, -1.747806, 0.4823529, 1, 0, 1,
-0.6430469, 0.547906, -1.257719, 0.4745098, 1, 0, 1,
-0.6422445, -0.1870015, -2.601627, 0.4705882, 1, 0, 1,
-0.6417524, 0.9817988, 0.8201076, 0.4627451, 1, 0, 1,
-0.6412534, 1.78812, -1.658343, 0.4588235, 1, 0, 1,
-0.6395605, 0.0620687, -0.5902681, 0.4509804, 1, 0, 1,
-0.6384673, 1.327739, 0.7317654, 0.4470588, 1, 0, 1,
-0.6336772, -0.444284, -1.414757, 0.4392157, 1, 0, 1,
-0.6334421, 0.04186788, -2.529875, 0.4352941, 1, 0, 1,
-0.6326756, -2.03618, -3.525973, 0.427451, 1, 0, 1,
-0.6298911, 0.4997993, -0.1936825, 0.4235294, 1, 0, 1,
-0.6253468, -0.1730748, -0.3931128, 0.4156863, 1, 0, 1,
-0.6208208, -2.036761, -3.343095, 0.4117647, 1, 0, 1,
-0.619423, -1.055058, -4.552948, 0.4039216, 1, 0, 1,
-0.6179198, -0.7673189, -0.8650517, 0.3960784, 1, 0, 1,
-0.6162828, -0.2840777, -1.35537, 0.3921569, 1, 0, 1,
-0.6035249, 0.3800586, -1.495524, 0.3843137, 1, 0, 1,
-0.6026359, 0.7641461, 0.9241344, 0.3803922, 1, 0, 1,
-0.6019411, -0.8167332, -1.647804, 0.372549, 1, 0, 1,
-0.6008183, -1.329946, -2.990272, 0.3686275, 1, 0, 1,
-0.597582, -0.453527, -3.155719, 0.3607843, 1, 0, 1,
-0.5919572, -1.122936, -3.347481, 0.3568628, 1, 0, 1,
-0.5854101, 0.1549255, -0.3783018, 0.3490196, 1, 0, 1,
-0.5810885, -0.627416, -2.125298, 0.345098, 1, 0, 1,
-0.5791696, 0.6833867, -0.8840102, 0.3372549, 1, 0, 1,
-0.5777586, 0.6150752, -1.609621, 0.3333333, 1, 0, 1,
-0.5758347, 0.7511525, -0.2334162, 0.3254902, 1, 0, 1,
-0.5721723, 0.2388818, -2.014687, 0.3215686, 1, 0, 1,
-0.5712891, 0.2818334, -1.522221, 0.3137255, 1, 0, 1,
-0.5693719, 0.8566958, -1.113282, 0.3098039, 1, 0, 1,
-0.5660395, -1.526502, -1.748231, 0.3019608, 1, 0, 1,
-0.5646188, -1.766405, -2.911546, 0.2941177, 1, 0, 1,
-0.5603767, 1.611262, -0.01541473, 0.2901961, 1, 0, 1,
-0.5590304, -0.6303829, -2.697917, 0.282353, 1, 0, 1,
-0.5577028, 0.04127326, 0.3555194, 0.2784314, 1, 0, 1,
-0.5555451, -0.2309322, -2.505711, 0.2705882, 1, 0, 1,
-0.5545754, -0.1828196, -2.962735, 0.2666667, 1, 0, 1,
-0.5516227, 0.6501517, -0.1640542, 0.2588235, 1, 0, 1,
-0.5512879, -0.7615508, -2.81187, 0.254902, 1, 0, 1,
-0.5433346, -0.7774802, -3.264395, 0.2470588, 1, 0, 1,
-0.5407282, -0.1314715, -2.184026, 0.2431373, 1, 0, 1,
-0.540052, 0.4664438, -2.125128, 0.2352941, 1, 0, 1,
-0.5346188, 1.140579, -0.7435198, 0.2313726, 1, 0, 1,
-0.5329266, 0.8587834, -1.252322, 0.2235294, 1, 0, 1,
-0.5291021, -0.5308599, -2.905158, 0.2196078, 1, 0, 1,
-0.5258458, 1.228174, -0.6601129, 0.2117647, 1, 0, 1,
-0.523642, -0.6028338, -1.444118, 0.2078431, 1, 0, 1,
-0.5227962, 0.6083622, 1.037301, 0.2, 1, 0, 1,
-0.5200706, -1.968829, -2.886412, 0.1921569, 1, 0, 1,
-0.5180967, 0.7914416, -0.1745529, 0.1882353, 1, 0, 1,
-0.5154986, -1.830996, -2.26314, 0.1803922, 1, 0, 1,
-0.5124559, -1.180997, -2.224802, 0.1764706, 1, 0, 1,
-0.5001658, 0.1778918, -0.612761, 0.1686275, 1, 0, 1,
-0.4940138, 1.475554, -1.19937, 0.1647059, 1, 0, 1,
-0.4893681, 1.139354, -1.33163, 0.1568628, 1, 0, 1,
-0.4874204, 1.03169, 1.174599, 0.1529412, 1, 0, 1,
-0.4798804, 0.7408589, -0.3390262, 0.145098, 1, 0, 1,
-0.4786056, 0.3813151, -0.5577076, 0.1411765, 1, 0, 1,
-0.477201, -0.0408882, -1.415899, 0.1333333, 1, 0, 1,
-0.4767997, 0.56221, -2.542111, 0.1294118, 1, 0, 1,
-0.4764028, -0.6479142, -1.438923, 0.1215686, 1, 0, 1,
-0.4736402, -1.357536, -3.435058, 0.1176471, 1, 0, 1,
-0.4686016, -0.3479683, -1.713561, 0.1098039, 1, 0, 1,
-0.4641511, 2.393128, 0.01885439, 0.1058824, 1, 0, 1,
-0.458352, -0.7283581, -3.045387, 0.09803922, 1, 0, 1,
-0.4550384, -2.265613, -3.994448, 0.09019608, 1, 0, 1,
-0.4527463, -1.172959, -2.484219, 0.08627451, 1, 0, 1,
-0.4513696, 0.7896724, -0.410608, 0.07843138, 1, 0, 1,
-0.4487033, -3.106792, -4.733559, 0.07450981, 1, 0, 1,
-0.44842, 0.6926046, -0.4921682, 0.06666667, 1, 0, 1,
-0.445928, -0.8585177, -4.241429, 0.0627451, 1, 0, 1,
-0.445349, -0.5652239, -1.554766, 0.05490196, 1, 0, 1,
-0.4452602, -0.8809199, -2.966914, 0.05098039, 1, 0, 1,
-0.443246, -0.3908845, -1.736337, 0.04313726, 1, 0, 1,
-0.4419844, 0.9303628, -0.78983, 0.03921569, 1, 0, 1,
-0.4418413, -0.2989717, 0.134617, 0.03137255, 1, 0, 1,
-0.4396868, -0.4350692, -1.540084, 0.02745098, 1, 0, 1,
-0.4366345, 0.4672447, -1.681911, 0.01960784, 1, 0, 1,
-0.4282106, 0.3222117, -1.781213, 0.01568628, 1, 0, 1,
-0.4224125, -1.349767, -2.286158, 0.007843138, 1, 0, 1,
-0.4203545, -0.1597115, -1.885026, 0.003921569, 1, 0, 1,
-0.4164224, -1.831655, -0.758216, 0, 1, 0.003921569, 1,
-0.4143499, 0.7647902, -0.9537385, 0, 1, 0.01176471, 1,
-0.4143395, 0.4956071, -1.383921, 0, 1, 0.01568628, 1,
-0.4142408, 0.2880885, -0.7686024, 0, 1, 0.02352941, 1,
-0.4127554, 0.4509498, 2.000271, 0, 1, 0.02745098, 1,
-0.4112282, 0.9244035, -1.271212, 0, 1, 0.03529412, 1,
-0.4076871, -0.02979784, -3.064509, 0, 1, 0.03921569, 1,
-0.4020599, 0.8284644, -1.714112, 0, 1, 0.04705882, 1,
-0.3947175, -1.104434, -2.451284, 0, 1, 0.05098039, 1,
-0.3922658, -1.09868, -2.272916, 0, 1, 0.05882353, 1,
-0.3892858, -0.8092408, -3.030424, 0, 1, 0.0627451, 1,
-0.386907, -0.6571088, -2.232737, 0, 1, 0.07058824, 1,
-0.3868414, 1.606721, -0.3927681, 0, 1, 0.07450981, 1,
-0.3863166, -0.5564169, -2.513061, 0, 1, 0.08235294, 1,
-0.3862407, 1.210494, 0.2212724, 0, 1, 0.08627451, 1,
-0.3862265, 0.4260485, -0.9873258, 0, 1, 0.09411765, 1,
-0.3777772, 1.070876, -0.6614103, 0, 1, 0.1019608, 1,
-0.3768671, -0.8254724, -1.907403, 0, 1, 0.1058824, 1,
-0.3748812, 1.249626, -0.5485151, 0, 1, 0.1137255, 1,
-0.372947, -1.390156, -2.318619, 0, 1, 0.1176471, 1,
-0.3702302, 0.02470067, -1.857689, 0, 1, 0.1254902, 1,
-0.365007, 1.681688, -0.7238985, 0, 1, 0.1294118, 1,
-0.3615697, -0.5724563, -1.356825, 0, 1, 0.1372549, 1,
-0.3615625, 2.003111, -0.9175658, 0, 1, 0.1411765, 1,
-0.3576761, 0.8786083, 1.094236, 0, 1, 0.1490196, 1,
-0.3518053, -1.510336, -3.908436, 0, 1, 0.1529412, 1,
-0.3497742, -0.07226354, -2.236917, 0, 1, 0.1607843, 1,
-0.3435915, -0.5848691, -2.133779, 0, 1, 0.1647059, 1,
-0.3411292, 0.06259286, -0.0349697, 0, 1, 0.172549, 1,
-0.3372785, 0.8266549, -0.9439739, 0, 1, 0.1764706, 1,
-0.3324985, 0.677357, -1.133666, 0, 1, 0.1843137, 1,
-0.3314239, -1.070843, -3.62065, 0, 1, 0.1882353, 1,
-0.3296375, 0.04081732, -2.244366, 0, 1, 0.1960784, 1,
-0.3291496, 0.337341, -1.215937, 0, 1, 0.2039216, 1,
-0.3289831, -0.5757208, -1.724481, 0, 1, 0.2078431, 1,
-0.3267272, 1.131773, 1.539111, 0, 1, 0.2156863, 1,
-0.3159243, -0.6298637, -3.409513, 0, 1, 0.2196078, 1,
-0.3150586, 0.784547, 1.084077, 0, 1, 0.227451, 1,
-0.2998103, -0.9976274, -2.138234, 0, 1, 0.2313726, 1,
-0.292643, 0.08849506, 0.3023994, 0, 1, 0.2392157, 1,
-0.2908071, 0.3308029, -0.9889415, 0, 1, 0.2431373, 1,
-0.2884778, 0.3639577, -0.4023678, 0, 1, 0.2509804, 1,
-0.2884405, 0.09807319, -1.296865, 0, 1, 0.254902, 1,
-0.2856675, 0.8843355, -0.9458779, 0, 1, 0.2627451, 1,
-0.2846991, -0.9425212, -2.074919, 0, 1, 0.2666667, 1,
-0.2837098, 1.158534, 0.2709398, 0, 1, 0.2745098, 1,
-0.2794933, 0.8697646, 0.5695028, 0, 1, 0.2784314, 1,
-0.2782681, 0.6742944, 0.5786886, 0, 1, 0.2862745, 1,
-0.2723278, -0.6994975, -1.488338, 0, 1, 0.2901961, 1,
-0.2699427, 0.2737299, 1.299157, 0, 1, 0.2980392, 1,
-0.2642946, -1.184766, -4.181854, 0, 1, 0.3058824, 1,
-0.2636386, -0.2912487, -2.329886, 0, 1, 0.3098039, 1,
-0.261655, 0.1024839, -0.8542079, 0, 1, 0.3176471, 1,
-0.26162, 0.2691026, -1.003737, 0, 1, 0.3215686, 1,
-0.256531, 0.3514257, -0.1978459, 0, 1, 0.3294118, 1,
-0.2427935, -0.6191837, -2.169341, 0, 1, 0.3333333, 1,
-0.2398737, 1.414877, -0.9503375, 0, 1, 0.3411765, 1,
-0.2374958, -1.146176, -2.861246, 0, 1, 0.345098, 1,
-0.2366813, 1.164528, 0.2567319, 0, 1, 0.3529412, 1,
-0.2361082, 0.82988, -0.7373505, 0, 1, 0.3568628, 1,
-0.2355968, 0.03154324, -0.3153094, 0, 1, 0.3647059, 1,
-0.2338857, 0.7528991, -0.5163659, 0, 1, 0.3686275, 1,
-0.2305107, -2.171215, -1.782989, 0, 1, 0.3764706, 1,
-0.2282938, 0.6000036, -1.900188, 0, 1, 0.3803922, 1,
-0.2267181, 0.5895206, 0.2269473, 0, 1, 0.3882353, 1,
-0.2209702, -1.168825, -3.339567, 0, 1, 0.3921569, 1,
-0.2191412, 0.8560968, -0.6912926, 0, 1, 0.4, 1,
-0.2111199, -0.3986898, -4.118387, 0, 1, 0.4078431, 1,
-0.207165, -0.8404225, -1.765006, 0, 1, 0.4117647, 1,
-0.2070816, 1.620951, -1.358408, 0, 1, 0.4196078, 1,
-0.2030086, 0.1611364, -3.257899, 0, 1, 0.4235294, 1,
-0.1999175, -0.416489, -1.902402, 0, 1, 0.4313726, 1,
-0.1906877, -0.4524407, -2.546457, 0, 1, 0.4352941, 1,
-0.1876468, -0.4782814, -0.7216526, 0, 1, 0.4431373, 1,
-0.1829491, 1.562123, 0.9547296, 0, 1, 0.4470588, 1,
-0.1812364, -0.4288951, -0.08745113, 0, 1, 0.454902, 1,
-0.1789563, -0.8786801, -2.884322, 0, 1, 0.4588235, 1,
-0.177073, 0.2210022, 0.07670391, 0, 1, 0.4666667, 1,
-0.1769415, -2.400913, -3.345761, 0, 1, 0.4705882, 1,
-0.1762242, 0.8670177, -1.261338, 0, 1, 0.4784314, 1,
-0.1756296, 0.6392911, -0.9298798, 0, 1, 0.4823529, 1,
-0.1731667, -1.525727, -4.202549, 0, 1, 0.4901961, 1,
-0.1712257, 1.848913, -0.3285232, 0, 1, 0.4941176, 1,
-0.1692458, 0.2572085, -1.623065, 0, 1, 0.5019608, 1,
-0.1692113, -0.5436291, -3.66271, 0, 1, 0.509804, 1,
-0.1666316, -1.51576, -3.116204, 0, 1, 0.5137255, 1,
-0.1663132, -0.3434016, -2.428889, 0, 1, 0.5215687, 1,
-0.1635585, -0.09493301, -3.71135, 0, 1, 0.5254902, 1,
-0.1573945, 0.6472582, 1.474778, 0, 1, 0.5333334, 1,
-0.1568705, -1.508858, -2.86447, 0, 1, 0.5372549, 1,
-0.1557065, -0.1787261, -3.392928, 0, 1, 0.5450981, 1,
-0.1530639, -0.2064421, -5.066803, 0, 1, 0.5490196, 1,
-0.1480209, -0.4511057, -4.128368, 0, 1, 0.5568628, 1,
-0.1464091, -1.123484, -5.032245, 0, 1, 0.5607843, 1,
-0.1454241, 1.186577, 0.04074322, 0, 1, 0.5686275, 1,
-0.143115, 0.6591241, 0.7922003, 0, 1, 0.572549, 1,
-0.1427861, -0.7805943, -2.96014, 0, 1, 0.5803922, 1,
-0.1427339, 1.460002, -0.2250078, 0, 1, 0.5843138, 1,
-0.1388577, 0.1755039, -0.7624368, 0, 1, 0.5921569, 1,
-0.1361653, -1.719442, -2.020644, 0, 1, 0.5960785, 1,
-0.1354863, 0.5718916, -0.9252908, 0, 1, 0.6039216, 1,
-0.1353309, -0.3538572, -2.309686, 0, 1, 0.6117647, 1,
-0.1340427, -0.8192418, -3.683644, 0, 1, 0.6156863, 1,
-0.130812, 0.08828581, -2.00663, 0, 1, 0.6235294, 1,
-0.1276868, 0.1048667, -0.8953593, 0, 1, 0.627451, 1,
-0.1272111, 0.9235035, 0.8349658, 0, 1, 0.6352941, 1,
-0.1215583, -0.541473, -3.022442, 0, 1, 0.6392157, 1,
-0.1215105, -0.5706894, -2.353441, 0, 1, 0.6470588, 1,
-0.1183555, 1.18238, 0.09887997, 0, 1, 0.6509804, 1,
-0.1078002, -0.01687436, -1.353401, 0, 1, 0.6588235, 1,
-0.1070198, -0.8108551, -3.44104, 0, 1, 0.6627451, 1,
-0.1020117, 2.315837, -0.9402709, 0, 1, 0.6705883, 1,
-0.09447732, -0.22899, -3.039745, 0, 1, 0.6745098, 1,
-0.09307957, -0.01091595, -1.314683, 0, 1, 0.682353, 1,
-0.08864666, 1.47373, 0.8660124, 0, 1, 0.6862745, 1,
-0.08691677, 1.445824, -2.190684, 0, 1, 0.6941177, 1,
-0.08327137, -1.115239, -1.480633, 0, 1, 0.7019608, 1,
-0.08172446, 1.935427, -1.034159, 0, 1, 0.7058824, 1,
-0.07916112, 0.1374025, 1.44435, 0, 1, 0.7137255, 1,
-0.07816811, 0.6345549, 0.6342639, 0, 1, 0.7176471, 1,
-0.07715148, -0.3053922, -2.454184, 0, 1, 0.7254902, 1,
-0.0733954, 0.3892436, 1.224412, 0, 1, 0.7294118, 1,
-0.07126366, -0.08494234, -2.934249, 0, 1, 0.7372549, 1,
-0.06929571, 0.5807671, 0.6573811, 0, 1, 0.7411765, 1,
-0.06638927, -0.400244, -3.17397, 0, 1, 0.7490196, 1,
-0.06098303, -0.4163528, -4.530541, 0, 1, 0.7529412, 1,
-0.0592059, -0.4733298, -3.503874, 0, 1, 0.7607843, 1,
-0.05863164, -0.2687643, -4.773838, 0, 1, 0.7647059, 1,
-0.053594, 0.6543382, 0.2545529, 0, 1, 0.772549, 1,
-0.05358528, 0.1768719, 1.146909, 0, 1, 0.7764706, 1,
-0.05125961, -0.797298, -4.493854, 0, 1, 0.7843137, 1,
-0.05039012, 1.59577, -0.4088244, 0, 1, 0.7882353, 1,
-0.04551202, -1.06678, -3.662794, 0, 1, 0.7960784, 1,
-0.04325449, -0.7370737, -3.821377, 0, 1, 0.8039216, 1,
-0.04299266, 0.3150181, -0.3117167, 0, 1, 0.8078431, 1,
-0.04172566, -0.5930273, -3.43448, 0, 1, 0.8156863, 1,
-0.03997887, 0.5956973, -1.045034, 0, 1, 0.8196079, 1,
-0.03918625, -0.02722485, -1.545048, 0, 1, 0.827451, 1,
-0.03902525, -1.667752, -3.637303, 0, 1, 0.8313726, 1,
-0.03497816, -0.4965855, -3.076101, 0, 1, 0.8392157, 1,
-0.03126701, 0.1001464, -0.9958495, 0, 1, 0.8431373, 1,
-0.02246883, 1.031922, 1.175834, 0, 1, 0.8509804, 1,
-0.01992557, 1.869038, -0.5897054, 0, 1, 0.854902, 1,
-0.01800052, 1.671044, -0.6658268, 0, 1, 0.8627451, 1,
-0.007549657, -0.926505, -3.27292, 0, 1, 0.8666667, 1,
-0.006157197, -0.4584053, -3.866656, 0, 1, 0.8745098, 1,
-0.005770192, 0.9044415, 1.398067, 0, 1, 0.8784314, 1,
-0.005724058, -1.462175, -0.6104234, 0, 1, 0.8862745, 1,
-0.005659683, 1.532078, -1.039071, 0, 1, 0.8901961, 1,
-0.0004918181, 0.7081345, -0.3838413, 0, 1, 0.8980392, 1,
0.003727556, 1.103792, 0.8784367, 0, 1, 0.9058824, 1,
0.006349663, -0.6722023, 5.206773, 0, 1, 0.9098039, 1,
0.008413089, -0.2250045, 3.569138, 0, 1, 0.9176471, 1,
0.01527986, 1.094922, -0.8042114, 0, 1, 0.9215686, 1,
0.01720048, -1.204877, 3.62623, 0, 1, 0.9294118, 1,
0.01799887, -0.1343786, 1.674886, 0, 1, 0.9333333, 1,
0.02270017, -0.5515859, 3.595647, 0, 1, 0.9411765, 1,
0.0234919, -0.1741005, 2.106517, 0, 1, 0.945098, 1,
0.02354136, 1.288373, -2.647951, 0, 1, 0.9529412, 1,
0.0308149, -0.108758, 0.708647, 0, 1, 0.9568627, 1,
0.03387332, -0.300409, 1.103436, 0, 1, 0.9647059, 1,
0.03392461, 0.8061131, -0.8426514, 0, 1, 0.9686275, 1,
0.03403183, 0.5102485, -3.07302, 0, 1, 0.9764706, 1,
0.03483164, -1.624891, 1.83788, 0, 1, 0.9803922, 1,
0.04811468, 0.1638298, -1.37829, 0, 1, 0.9882353, 1,
0.04909885, 0.9418459, -1.987902, 0, 1, 0.9921569, 1,
0.05354664, 0.9912272, -0.1895368, 0, 1, 1, 1,
0.05380659, -0.1037517, 3.054791, 0, 0.9921569, 1, 1,
0.05686546, -0.1203424, 3.803781, 0, 0.9882353, 1, 1,
0.05732052, 0.2018531, 0.9396577, 0, 0.9803922, 1, 1,
0.05736728, 0.540239, 0.2216213, 0, 0.9764706, 1, 1,
0.0575166, -1.607462, 2.478207, 0, 0.9686275, 1, 1,
0.06381345, -0.6814217, 3.047923, 0, 0.9647059, 1, 1,
0.06441058, -1.301708, 2.021037, 0, 0.9568627, 1, 1,
0.06583789, 0.6679244, -1.07921, 0, 0.9529412, 1, 1,
0.06796164, 0.06664524, 0.1740291, 0, 0.945098, 1, 1,
0.06883997, 0.4577118, -0.6922399, 0, 0.9411765, 1, 1,
0.06950738, 0.2361574, 0.2149358, 0, 0.9333333, 1, 1,
0.07095651, -0.2065324, 3.736151, 0, 0.9294118, 1, 1,
0.07715639, 0.3364589, 0.2805621, 0, 0.9215686, 1, 1,
0.07998076, 0.3979741, 0.6902121, 0, 0.9176471, 1, 1,
0.08474876, -0.3323986, 2.630545, 0, 0.9098039, 1, 1,
0.08781444, -0.5774151, 3.550902, 0, 0.9058824, 1, 1,
0.09108049, -1.533823, 2.951172, 0, 0.8980392, 1, 1,
0.09884773, -0.5824533, 3.402299, 0, 0.8901961, 1, 1,
0.1079821, 1.317548, -0.3814683, 0, 0.8862745, 1, 1,
0.1156484, -0.3484089, 3.976529, 0, 0.8784314, 1, 1,
0.1163727, 0.6282052, 1.388044, 0, 0.8745098, 1, 1,
0.1250379, 0.04462402, 3.860318, 0, 0.8666667, 1, 1,
0.1252864, 0.2411975, 1.424824, 0, 0.8627451, 1, 1,
0.1277679, 0.1331176, 2.150055, 0, 0.854902, 1, 1,
0.1295308, 0.3785498, -1.276359, 0, 0.8509804, 1, 1,
0.1351715, -2.033539, 3.562977, 0, 0.8431373, 1, 1,
0.1363157, 0.7529605, -0.2958829, 0, 0.8392157, 1, 1,
0.1377186, 0.186718, 1.671438, 0, 0.8313726, 1, 1,
0.1409191, -1.94733, 4.222837, 0, 0.827451, 1, 1,
0.1414287, -1.220475, 3.817586, 0, 0.8196079, 1, 1,
0.1423068, -0.5750056, 3.529213, 0, 0.8156863, 1, 1,
0.1429754, 0.5410048, 0.6173749, 0, 0.8078431, 1, 1,
0.1472862, 0.2022187, -0.4818667, 0, 0.8039216, 1, 1,
0.1495512, -2.35145, 3.050773, 0, 0.7960784, 1, 1,
0.1502611, -0.7668284, 2.130843, 0, 0.7882353, 1, 1,
0.1503375, 0.7786167, -2.072293, 0, 0.7843137, 1, 1,
0.1506441, -0.1083226, 0.6083961, 0, 0.7764706, 1, 1,
0.1516277, 1.115349, 2.676407, 0, 0.772549, 1, 1,
0.1538272, 1.061446, -0.4252138, 0, 0.7647059, 1, 1,
0.1612229, -0.1641255, 3.412207, 0, 0.7607843, 1, 1,
0.161551, 2.058034, -0.6864956, 0, 0.7529412, 1, 1,
0.1637075, 0.01546207, -0.482025, 0, 0.7490196, 1, 1,
0.1651383, -2.16372, 3.85736, 0, 0.7411765, 1, 1,
0.1660523, -1.498145, 2.489339, 0, 0.7372549, 1, 1,
0.1679786, -1.556134, 1.916068, 0, 0.7294118, 1, 1,
0.1713308, 0.5679806, 1.432353, 0, 0.7254902, 1, 1,
0.1715931, 0.4795799, -2.323305, 0, 0.7176471, 1, 1,
0.1716819, -0.3749667, 2.425177, 0, 0.7137255, 1, 1,
0.1761058, -0.7754672, 1.345911, 0, 0.7058824, 1, 1,
0.1769177, 1.269761, -1.232542, 0, 0.6980392, 1, 1,
0.1773851, -1.781898, 3.117481, 0, 0.6941177, 1, 1,
0.1810532, 0.1599473, 1.572489, 0, 0.6862745, 1, 1,
0.1814213, -0.1649246, 2.399929, 0, 0.682353, 1, 1,
0.183984, 1.719731, 0.8648918, 0, 0.6745098, 1, 1,
0.1853344, 0.04954056, 0.345952, 0, 0.6705883, 1, 1,
0.1874859, -0.01064304, 2.165301, 0, 0.6627451, 1, 1,
0.1889314, -0.1826889, 3.321827, 0, 0.6588235, 1, 1,
0.189544, -1.058479, 2.99464, 0, 0.6509804, 1, 1,
0.1930646, -0.01636313, 0.06537596, 0, 0.6470588, 1, 1,
0.1968835, 0.9756975, 0.4798129, 0, 0.6392157, 1, 1,
0.1970039, -1.131611, 3.172013, 0, 0.6352941, 1, 1,
0.2000441, 2.042282, -1.103964, 0, 0.627451, 1, 1,
0.200209, -0.9434632, 2.333129, 0, 0.6235294, 1, 1,
0.2018246, -0.8677026, 4.897638, 0, 0.6156863, 1, 1,
0.2067905, -1.587746, 2.339676, 0, 0.6117647, 1, 1,
0.2070003, -1.046935, 4.226812, 0, 0.6039216, 1, 1,
0.2076973, 0.3386382, 0.7544187, 0, 0.5960785, 1, 1,
0.2099913, -0.1662992, 1.750139, 0, 0.5921569, 1, 1,
0.2157508, -1.154317, 2.852359, 0, 0.5843138, 1, 1,
0.2168964, 0.484363, 0.4978827, 0, 0.5803922, 1, 1,
0.217048, -0.5592877, 1.540149, 0, 0.572549, 1, 1,
0.2208016, 0.1960396, 2.51029, 0, 0.5686275, 1, 1,
0.2210656, 0.2950542, 1.296052, 0, 0.5607843, 1, 1,
0.2239195, 1.067938, 0.3183744, 0, 0.5568628, 1, 1,
0.2257214, -0.06229019, 2.792392, 0, 0.5490196, 1, 1,
0.2257347, 0.8516903, -0.9426377, 0, 0.5450981, 1, 1,
0.2284865, 0.1548181, 0.48419, 0, 0.5372549, 1, 1,
0.2286709, 0.3428575, -0.3688437, 0, 0.5333334, 1, 1,
0.2296778, 0.4282655, -0.4403814, 0, 0.5254902, 1, 1,
0.2317781, -0.5642909, 1.254876, 0, 0.5215687, 1, 1,
0.233206, -0.3280966, 3.915185, 0, 0.5137255, 1, 1,
0.2402509, -1.775027, 2.737222, 0, 0.509804, 1, 1,
0.2417222, 0.1408, 2.132605, 0, 0.5019608, 1, 1,
0.2424133, 0.8787138, 1.18288, 0, 0.4941176, 1, 1,
0.2474694, 0.9187762, -0.03944182, 0, 0.4901961, 1, 1,
0.2488598, 0.8905926, -0.9275607, 0, 0.4823529, 1, 1,
0.2513258, 0.2800197, -0.1791234, 0, 0.4784314, 1, 1,
0.2518828, 0.1390555, 0.3674361, 0, 0.4705882, 1, 1,
0.2536473, -0.04928389, 0.7050618, 0, 0.4666667, 1, 1,
0.2557905, -1.665819, 3.607368, 0, 0.4588235, 1, 1,
0.2562237, 0.2557271, -0.05586981, 0, 0.454902, 1, 1,
0.2565552, -1.888437, 3.994646, 0, 0.4470588, 1, 1,
0.2583533, -1.487003, 2.999654, 0, 0.4431373, 1, 1,
0.2592451, -0.002215454, 2.602457, 0, 0.4352941, 1, 1,
0.2599143, 0.02705664, 0.7372584, 0, 0.4313726, 1, 1,
0.2601705, -2.731657, 2.462439, 0, 0.4235294, 1, 1,
0.2601807, -0.3583993, 4.387682, 0, 0.4196078, 1, 1,
0.2648415, -0.2312963, 1.487348, 0, 0.4117647, 1, 1,
0.2723421, 1.572825, -1.752473, 0, 0.4078431, 1, 1,
0.2725874, -0.01247462, 3.661624, 0, 0.4, 1, 1,
0.2893954, 0.5707091, 0.6796747, 0, 0.3921569, 1, 1,
0.2906475, -0.4454645, 2.187996, 0, 0.3882353, 1, 1,
0.2913057, -0.5787635, 1.780576, 0, 0.3803922, 1, 1,
0.296822, -1.07811, 4.042712, 0, 0.3764706, 1, 1,
0.2978224, 1.840484, 0.2450286, 0, 0.3686275, 1, 1,
0.3022242, 0.3149224, 1.523992, 0, 0.3647059, 1, 1,
0.3047485, 1.311807, -0.3947906, 0, 0.3568628, 1, 1,
0.3050998, 0.2884454, 0.7756171, 0, 0.3529412, 1, 1,
0.3069133, 0.01538475, 0.2097088, 0, 0.345098, 1, 1,
0.3209668, 0.9843065, 0.8101867, 0, 0.3411765, 1, 1,
0.3212679, -1.524752, 3.437488, 0, 0.3333333, 1, 1,
0.3221255, 0.1475479, 2.343831, 0, 0.3294118, 1, 1,
0.3240469, -2.694879, 3.274644, 0, 0.3215686, 1, 1,
0.3247812, 1.806334, 0.1305106, 0, 0.3176471, 1, 1,
0.3250076, -0.9848824, 3.868191, 0, 0.3098039, 1, 1,
0.3264346, 0.2607493, 0.8766147, 0, 0.3058824, 1, 1,
0.3267949, -1.874108, 2.241425, 0, 0.2980392, 1, 1,
0.3332693, 1.123676, -0.7689622, 0, 0.2901961, 1, 1,
0.3375085, 0.4281909, 0.259027, 0, 0.2862745, 1, 1,
0.3426848, -1.126551, 2.422684, 0, 0.2784314, 1, 1,
0.3429093, 0.5606039, 1.072901, 0, 0.2745098, 1, 1,
0.3462188, -0.9171342, 3.017289, 0, 0.2666667, 1, 1,
0.3488327, 0.1790021, 0.2884826, 0, 0.2627451, 1, 1,
0.3489965, -0.5152876, 2.065677, 0, 0.254902, 1, 1,
0.3531701, -0.3478803, 4.530227, 0, 0.2509804, 1, 1,
0.3600191, -1.183336, 1.657902, 0, 0.2431373, 1, 1,
0.361805, -1.590717, 2.26286, 0, 0.2392157, 1, 1,
0.3625348, 0.02735749, 2.17, 0, 0.2313726, 1, 1,
0.3626155, 0.6305174, -1.588236, 0, 0.227451, 1, 1,
0.3691567, -1.757897, 4.367722, 0, 0.2196078, 1, 1,
0.3725152, 0.03440154, 1.268993, 0, 0.2156863, 1, 1,
0.3734575, -0.6268444, 2.791553, 0, 0.2078431, 1, 1,
0.3807499, -1.517352, 2.771942, 0, 0.2039216, 1, 1,
0.3819505, 0.7574828, 1.910164, 0, 0.1960784, 1, 1,
0.3852371, -1.903454, 2.263402, 0, 0.1882353, 1, 1,
0.3879453, -1.672557, 3.997967, 0, 0.1843137, 1, 1,
0.3879687, -0.4989939, 3.255496, 0, 0.1764706, 1, 1,
0.3948733, -1.059327, 0.9866214, 0, 0.172549, 1, 1,
0.4107292, -0.04537749, 2.042193, 0, 0.1647059, 1, 1,
0.4141142, -0.2217689, 2.42425, 0, 0.1607843, 1, 1,
0.4175581, 0.8787651, -0.2779514, 0, 0.1529412, 1, 1,
0.4198748, 0.7035328, 0.6327981, 0, 0.1490196, 1, 1,
0.4257762, -0.4742078, 0.8745992, 0, 0.1411765, 1, 1,
0.4262783, 0.3785608, 1.482996, 0, 0.1372549, 1, 1,
0.4291033, 0.156227, 0.9642737, 0, 0.1294118, 1, 1,
0.4383059, -0.3395986, 2.79644, 0, 0.1254902, 1, 1,
0.4386231, 0.723856, 1.406775, 0, 0.1176471, 1, 1,
0.4403624, 1.089931, -0.4445298, 0, 0.1137255, 1, 1,
0.4414364, -2.105924, 2.565567, 0, 0.1058824, 1, 1,
0.4416856, -1.224522, 3.135715, 0, 0.09803922, 1, 1,
0.4442885, 0.5512198, 0.6206127, 0, 0.09411765, 1, 1,
0.4506818, -0.264512, 1.498457, 0, 0.08627451, 1, 1,
0.4615756, 0.6208261, 1.698202, 0, 0.08235294, 1, 1,
0.4623677, 0.2620839, 1.310945, 0, 0.07450981, 1, 1,
0.4636942, 1.855513, -0.3848046, 0, 0.07058824, 1, 1,
0.4646904, -1.128712, 1.68991, 0, 0.0627451, 1, 1,
0.4652998, 0.886069, 2.324313, 0, 0.05882353, 1, 1,
0.4679983, 0.4023861, 0.5928762, 0, 0.05098039, 1, 1,
0.4684637, 0.1257559, 0.58452, 0, 0.04705882, 1, 1,
0.4686055, -2.118773, 3.35666, 0, 0.03921569, 1, 1,
0.4693672, -0.08831962, 1.357291, 0, 0.03529412, 1, 1,
0.4710019, -1.427645, 3.373618, 0, 0.02745098, 1, 1,
0.4716342, 0.3943501, 1.32281, 0, 0.02352941, 1, 1,
0.4717394, 0.1483637, 0.4608283, 0, 0.01568628, 1, 1,
0.4717767, -0.4755976, 2.337823, 0, 0.01176471, 1, 1,
0.4728914, 2.360894, 0.5271601, 0, 0.003921569, 1, 1,
0.4735841, -1.309963, 3.320812, 0.003921569, 0, 1, 1,
0.4774306, -1.162238, 2.415732, 0.007843138, 0, 1, 1,
0.4781886, 0.347353, -0.3183874, 0.01568628, 0, 1, 1,
0.482577, 1.235714, -0.6147224, 0.01960784, 0, 1, 1,
0.4837137, -0.5369323, 2.277832, 0.02745098, 0, 1, 1,
0.4862688, 0.4918758, 1.589562, 0.03137255, 0, 1, 1,
0.4877874, 0.08303469, 0.8467057, 0.03921569, 0, 1, 1,
0.4903034, 2.463647, 1.638843, 0.04313726, 0, 1, 1,
0.4935629, -0.1191991, 1.160903, 0.05098039, 0, 1, 1,
0.4980565, 1.835971, 1.760572, 0.05490196, 0, 1, 1,
0.4982597, 0.9831995, -0.516035, 0.0627451, 0, 1, 1,
0.5007001, -0.3466995, 3.244357, 0.06666667, 0, 1, 1,
0.5072801, 0.4211602, 1.173182, 0.07450981, 0, 1, 1,
0.5114616, 1.154958, 1.489485, 0.07843138, 0, 1, 1,
0.5146422, 1.705111, -0.04637339, 0.08627451, 0, 1, 1,
0.5164343, 0.5561342, 0.9353504, 0.09019608, 0, 1, 1,
0.518218, 1.7663, -0.2230248, 0.09803922, 0, 1, 1,
0.5220668, -0.8096396, 3.305861, 0.1058824, 0, 1, 1,
0.5227699, 0.7878658, 2.950766, 0.1098039, 0, 1, 1,
0.5272893, 0.2659817, 1.455678, 0.1176471, 0, 1, 1,
0.5328997, -0.4152531, 4.241517, 0.1215686, 0, 1, 1,
0.5343487, -1.948045, 2.357949, 0.1294118, 0, 1, 1,
0.5365661, 0.4855951, 1.661466, 0.1333333, 0, 1, 1,
0.5410435, 0.3586776, 1.669845, 0.1411765, 0, 1, 1,
0.5424123, -0.7738729, 1.694479, 0.145098, 0, 1, 1,
0.5426679, -0.01347706, 1.068561, 0.1529412, 0, 1, 1,
0.5435002, -0.9421719, 2.559206, 0.1568628, 0, 1, 1,
0.5515352, 0.3356196, 0.6952746, 0.1647059, 0, 1, 1,
0.5517771, 0.2168738, 3.013505, 0.1686275, 0, 1, 1,
0.5524463, -1.09264, 2.0962, 0.1764706, 0, 1, 1,
0.5556276, 0.07129734, 1.187135, 0.1803922, 0, 1, 1,
0.5559675, -0.4725054, 2.593675, 0.1882353, 0, 1, 1,
0.5561152, 1.16782, 1.021392, 0.1921569, 0, 1, 1,
0.5587744, 0.6160184, 2.919549, 0.2, 0, 1, 1,
0.5647014, 0.9511768, 2.519966, 0.2078431, 0, 1, 1,
0.566345, -1.023813, 3.630439, 0.2117647, 0, 1, 1,
0.5682733, -1.172933, 2.655589, 0.2196078, 0, 1, 1,
0.5721167, 2.566553, 2.388482, 0.2235294, 0, 1, 1,
0.5729022, -0.3728169, 1.661473, 0.2313726, 0, 1, 1,
0.5756393, 0.7570865, 0.3662009, 0.2352941, 0, 1, 1,
0.5765806, 1.202353, 1.975884, 0.2431373, 0, 1, 1,
0.5769558, 0.6600065, -0.6436949, 0.2470588, 0, 1, 1,
0.5778161, 0.3360771, 0.7284012, 0.254902, 0, 1, 1,
0.582421, 1.555261, -0.5476121, 0.2588235, 0, 1, 1,
0.583347, 0.3240863, 2.729214, 0.2666667, 0, 1, 1,
0.5841971, -0.495956, 1.462405, 0.2705882, 0, 1, 1,
0.585651, -0.9897448, 1.596914, 0.2784314, 0, 1, 1,
0.588771, 1.687667, 0.863972, 0.282353, 0, 1, 1,
0.5907613, -0.06834418, 0.9532889, 0.2901961, 0, 1, 1,
0.5910259, 1.108823, 1.17307, 0.2941177, 0, 1, 1,
0.5913866, 0.9206064, 1.126679, 0.3019608, 0, 1, 1,
0.5980399, 0.5016392, 2.827628, 0.3098039, 0, 1, 1,
0.6001039, -0.308518, 1.989929, 0.3137255, 0, 1, 1,
0.6014184, -1.041418, 2.764207, 0.3215686, 0, 1, 1,
0.6058761, 0.9203449, 0.3928128, 0.3254902, 0, 1, 1,
0.6155536, 1.148906, 0.5121764, 0.3333333, 0, 1, 1,
0.6199363, 0.1261807, -0.434234, 0.3372549, 0, 1, 1,
0.6298009, -2.415262, 2.164979, 0.345098, 0, 1, 1,
0.6300175, 0.9482142, 0.525777, 0.3490196, 0, 1, 1,
0.6311512, 0.5631804, 0.7299072, 0.3568628, 0, 1, 1,
0.6324163, -1.08308, 3.275472, 0.3607843, 0, 1, 1,
0.637147, 0.08384033, -0.4900823, 0.3686275, 0, 1, 1,
0.6447657, 0.5038135, 0.8178365, 0.372549, 0, 1, 1,
0.6448343, -0.4205623, 2.208489, 0.3803922, 0, 1, 1,
0.6467987, -2.134478, 1.164314, 0.3843137, 0, 1, 1,
0.6473781, -0.0343704, 1.56746, 0.3921569, 0, 1, 1,
0.6476579, -0.1193086, 1.113759, 0.3960784, 0, 1, 1,
0.651766, 0.8916909, 1.093939, 0.4039216, 0, 1, 1,
0.65702, -0.04349526, 1.084848, 0.4117647, 0, 1, 1,
0.6625314, -1.638345, 3.437898, 0.4156863, 0, 1, 1,
0.6641599, 0.2252492, 0.3450539, 0.4235294, 0, 1, 1,
0.671265, -0.3856485, 1.913404, 0.427451, 0, 1, 1,
0.6722368, -1.73151, 2.317058, 0.4352941, 0, 1, 1,
0.6745546, -1.084899, 2.455909, 0.4392157, 0, 1, 1,
0.6752394, 1.523287, 0.07987137, 0.4470588, 0, 1, 1,
0.6816509, 1.605872, 0.1104538, 0.4509804, 0, 1, 1,
0.681846, -1.244166, 2.859215, 0.4588235, 0, 1, 1,
0.6822522, 0.05172254, 1.172072, 0.4627451, 0, 1, 1,
0.6823923, 0.2484661, 2.136853, 0.4705882, 0, 1, 1,
0.6841697, 0.01646106, 2.384133, 0.4745098, 0, 1, 1,
0.69057, -0.08869734, 1.508535, 0.4823529, 0, 1, 1,
0.695516, 1.402433, 1.574133, 0.4862745, 0, 1, 1,
0.6961793, -0.8858989, 3.914424, 0.4941176, 0, 1, 1,
0.6983591, -0.4157479, 1.25051, 0.5019608, 0, 1, 1,
0.7033556, -1.695292, 2.96541, 0.5058824, 0, 1, 1,
0.7056664, 1.978787, -0.8648839, 0.5137255, 0, 1, 1,
0.7064719, 0.7619857, 1.637001, 0.5176471, 0, 1, 1,
0.709774, 1.285935, 1.116285, 0.5254902, 0, 1, 1,
0.7130271, 0.1950285, 2.198666, 0.5294118, 0, 1, 1,
0.7145867, 2.049488, 0.5407215, 0.5372549, 0, 1, 1,
0.7150407, -0.7832542, 3.499694, 0.5411765, 0, 1, 1,
0.7188521, -0.03587262, 1.53718, 0.5490196, 0, 1, 1,
0.72141, 1.238401, -0.6556808, 0.5529412, 0, 1, 1,
0.7238975, 0.09437159, 1.458475, 0.5607843, 0, 1, 1,
0.7268703, 0.1815065, 1.264508, 0.5647059, 0, 1, 1,
0.7298018, 1.065909, -0.535489, 0.572549, 0, 1, 1,
0.73265, 0.6111421, 1.906542, 0.5764706, 0, 1, 1,
0.7469549, 0.7095181, 1.164885, 0.5843138, 0, 1, 1,
0.7500716, 0.3436264, 2.278163, 0.5882353, 0, 1, 1,
0.7508056, -1.421346, 0.8054454, 0.5960785, 0, 1, 1,
0.7514051, 0.1592253, -0.5071355, 0.6039216, 0, 1, 1,
0.756095, 1.405483, -0.709935, 0.6078432, 0, 1, 1,
0.7602766, -1.297564, 2.602044, 0.6156863, 0, 1, 1,
0.7651561, 0.8729777, 2.359943, 0.6196079, 0, 1, 1,
0.7658373, 1.30177, 0.368691, 0.627451, 0, 1, 1,
0.7659081, -2.143975, 3.906385, 0.6313726, 0, 1, 1,
0.7703722, -0.3174245, 2.967949, 0.6392157, 0, 1, 1,
0.7710544, 0.3698886, 0.1700338, 0.6431373, 0, 1, 1,
0.775377, -0.7867467, 1.462168, 0.6509804, 0, 1, 1,
0.7767951, 0.1033445, 2.296698, 0.654902, 0, 1, 1,
0.7787257, 1.280493, -0.8157919, 0.6627451, 0, 1, 1,
0.7794278, -0.670232, 2.176232, 0.6666667, 0, 1, 1,
0.7825287, 0.9560336, 0.8033614, 0.6745098, 0, 1, 1,
0.7864335, -0.7817311, 3.432666, 0.6784314, 0, 1, 1,
0.7888825, -1.219519, 2.906486, 0.6862745, 0, 1, 1,
0.790183, 0.04264401, 1.222035, 0.6901961, 0, 1, 1,
0.7922414, -0.4341444, 2.13161, 0.6980392, 0, 1, 1,
0.7937111, 1.133157, 1.506343, 0.7058824, 0, 1, 1,
0.7946749, 0.3272066, 2.129789, 0.7098039, 0, 1, 1,
0.7956178, -0.5565563, 1.54924, 0.7176471, 0, 1, 1,
0.796544, 1.067208, -0.4195589, 0.7215686, 0, 1, 1,
0.8016499, 1.56518, -1.016276, 0.7294118, 0, 1, 1,
0.8129064, 2.021159, 1.667848, 0.7333333, 0, 1, 1,
0.8166686, -0.04209462, 1.604679, 0.7411765, 0, 1, 1,
0.8174666, -0.6098195, 1.788022, 0.7450981, 0, 1, 1,
0.8231975, -0.6149319, -0.04919541, 0.7529412, 0, 1, 1,
0.8261045, -1.177067, 3.661836, 0.7568628, 0, 1, 1,
0.8296175, -0.7942259, 1.759443, 0.7647059, 0, 1, 1,
0.8309793, -0.1020299, 1.49621, 0.7686275, 0, 1, 1,
0.8333198, 0.4536638, 0.6817409, 0.7764706, 0, 1, 1,
0.8337584, 0.8000777, -0.4220501, 0.7803922, 0, 1, 1,
0.8418752, -1.430054, 2.040163, 0.7882353, 0, 1, 1,
0.8444157, -0.1165362, 3.179741, 0.7921569, 0, 1, 1,
0.8467789, -0.0860232, 2.450954, 0.8, 0, 1, 1,
0.8489594, -0.2122563, 1.459753, 0.8078431, 0, 1, 1,
0.8519013, -0.6969538, 3.131841, 0.8117647, 0, 1, 1,
0.8557236, 0.5986046, 0.4184482, 0.8196079, 0, 1, 1,
0.8594263, 0.9700708, 1.042945, 0.8235294, 0, 1, 1,
0.8629075, 1.966547, 2.083251, 0.8313726, 0, 1, 1,
0.8656, 1.177683, 0.4023973, 0.8352941, 0, 1, 1,
0.8689988, -0.9764748, 2.379119, 0.8431373, 0, 1, 1,
0.8712332, 0.5668941, -0.1581161, 0.8470588, 0, 1, 1,
0.8750999, 0.01406694, 2.015494, 0.854902, 0, 1, 1,
0.8756123, -1.41917, 2.143025, 0.8588235, 0, 1, 1,
0.8772898, -0.4012398, 0.6477912, 0.8666667, 0, 1, 1,
0.8792405, -0.7500036, 0.2284633, 0.8705882, 0, 1, 1,
0.8837995, -2.133422, 2.611118, 0.8784314, 0, 1, 1,
0.8888131, -1.429156, 3.678837, 0.8823529, 0, 1, 1,
0.8902343, 0.7859046, 1.407507, 0.8901961, 0, 1, 1,
0.8908815, -1.234607, 2.278192, 0.8941177, 0, 1, 1,
0.8924524, 1.03647, 1.183624, 0.9019608, 0, 1, 1,
0.8929973, -0.4717062, 3.227772, 0.9098039, 0, 1, 1,
0.8963907, 0.4868015, 2.03456, 0.9137255, 0, 1, 1,
0.8991516, 1.173608, -0.3250013, 0.9215686, 0, 1, 1,
0.9015663, 1.63404, 0.4434288, 0.9254902, 0, 1, 1,
0.9041629, -1.416156, 2.150277, 0.9333333, 0, 1, 1,
0.9068569, -0.8138143, 3.598433, 0.9372549, 0, 1, 1,
0.9238018, -0.4925625, 3.259946, 0.945098, 0, 1, 1,
0.9342112, 0.8579337, 1.995242, 0.9490196, 0, 1, 1,
0.9358146, 0.8248242, -0.3142904, 0.9568627, 0, 1, 1,
0.9382533, 1.625352, 0.7460101, 0.9607843, 0, 1, 1,
0.9413481, -0.09774875, 2.755137, 0.9686275, 0, 1, 1,
0.9417119, 1.329306, 2.039226, 0.972549, 0, 1, 1,
0.9420524, 1.539686, 0.68177, 0.9803922, 0, 1, 1,
0.9459012, 1.159244, 1.36435, 0.9843137, 0, 1, 1,
0.9650798, -2.067108, 2.812335, 0.9921569, 0, 1, 1,
0.9656106, -0.4385282, 0.997754, 0.9960784, 0, 1, 1,
0.9661421, 0.3813013, 0.5380321, 1, 0, 0.9960784, 1,
0.9690705, -0.8547279, 3.268416, 1, 0, 0.9882353, 1,
0.9699345, -1.744961, 0.9666096, 1, 0, 0.9843137, 1,
0.9871684, -0.9991381, 2.990747, 1, 0, 0.9764706, 1,
0.988043, -1.804385, 2.373168, 1, 0, 0.972549, 1,
0.9980912, 0.872354, 2.743674, 1, 0, 0.9647059, 1,
1.001341, -0.1985993, 1.15094, 1, 0, 0.9607843, 1,
1.001441, 1.278967, 0.06066743, 1, 0, 0.9529412, 1,
1.002157, -2.503858, 2.792487, 1, 0, 0.9490196, 1,
1.006514, 0.5414874, 0.09543256, 1, 0, 0.9411765, 1,
1.008149, -0.4788055, 1.470101, 1, 0, 0.9372549, 1,
1.008694, -0.4433537, 3.086443, 1, 0, 0.9294118, 1,
1.01669, 0.4344863, 0.3737902, 1, 0, 0.9254902, 1,
1.018721, 2.440301, 2.168992, 1, 0, 0.9176471, 1,
1.019465, -0.04671006, 1.798695, 1, 0, 0.9137255, 1,
1.021868, 1.415755, 0.9714212, 1, 0, 0.9058824, 1,
1.023611, -1.225409, 2.750829, 1, 0, 0.9019608, 1,
1.038877, 2.896515, -1.29937, 1, 0, 0.8941177, 1,
1.045833, -0.1138549, -0.5339572, 1, 0, 0.8862745, 1,
1.051119, -0.5782797, 2.343729, 1, 0, 0.8823529, 1,
1.053648, 0.12876, 1.163047, 1, 0, 0.8745098, 1,
1.059696, 1.759267, 1.15103, 1, 0, 0.8705882, 1,
1.066242, 0.5388989, 2.446929, 1, 0, 0.8627451, 1,
1.06683, 1.224022, 0.3487675, 1, 0, 0.8588235, 1,
1.069832, 0.2185095, -0.5196111, 1, 0, 0.8509804, 1,
1.072263, -0.9120977, 2.045213, 1, 0, 0.8470588, 1,
1.072369, -1.462829, 1.27748, 1, 0, 0.8392157, 1,
1.077185, -1.273343, 2.039324, 1, 0, 0.8352941, 1,
1.081199, 1.00544, 0.8545778, 1, 0, 0.827451, 1,
1.08336, -1.848987, 5.165543, 1, 0, 0.8235294, 1,
1.08572, -0.2569916, 1.293726, 1, 0, 0.8156863, 1,
1.092587, -0.2397449, 3.315477, 1, 0, 0.8117647, 1,
1.095522, 0.5262914, 1.810831, 1, 0, 0.8039216, 1,
1.097403, 0.7128351, 0.2475441, 1, 0, 0.7960784, 1,
1.09824, -0.1372422, 3.531337, 1, 0, 0.7921569, 1,
1.10162, -1.097018, 1.39041, 1, 0, 0.7843137, 1,
1.104501, -0.1487882, 1.876909, 1, 0, 0.7803922, 1,
1.107874, -0.3450148, 0.7257656, 1, 0, 0.772549, 1,
1.126408, 0.3212719, -0.2101258, 1, 0, 0.7686275, 1,
1.127517, -0.2458126, 2.496199, 1, 0, 0.7607843, 1,
1.130406, -0.7135391, 3.683106, 1, 0, 0.7568628, 1,
1.139201, 1.14466, 1.211684, 1, 0, 0.7490196, 1,
1.139435, -1.088603, 0.6863316, 1, 0, 0.7450981, 1,
1.152709, -0.1333072, 2.534274, 1, 0, 0.7372549, 1,
1.153551, 0.2034072, 1.347485, 1, 0, 0.7333333, 1,
1.167844, 0.0285543, 1.299192, 1, 0, 0.7254902, 1,
1.169799, 0.240675, 1.481249, 1, 0, 0.7215686, 1,
1.176012, -0.3080625, 0.8908769, 1, 0, 0.7137255, 1,
1.180516, 0.2914097, 1.79133, 1, 0, 0.7098039, 1,
1.18548, 1.089843, 0.1736717, 1, 0, 0.7019608, 1,
1.186244, -1.689597, 3.374942, 1, 0, 0.6941177, 1,
1.189528, -0.5882985, 2.734766, 1, 0, 0.6901961, 1,
1.195278, -0.5086258, 4.092155, 1, 0, 0.682353, 1,
1.197692, 1.440455, -0.8294987, 1, 0, 0.6784314, 1,
1.200212, 0.08845965, 2.328295, 1, 0, 0.6705883, 1,
1.206662, -0.6088561, 2.038612, 1, 0, 0.6666667, 1,
1.206803, 0.5855823, 1.984284, 1, 0, 0.6588235, 1,
1.21015, -0.7180585, 2.456669, 1, 0, 0.654902, 1,
1.213451, -0.1223615, 1.04275, 1, 0, 0.6470588, 1,
1.214978, -0.4253669, 1.249283, 1, 0, 0.6431373, 1,
1.218716, -1.508422, 3.926488, 1, 0, 0.6352941, 1,
1.220454, 0.3793114, 1.139838, 1, 0, 0.6313726, 1,
1.224183, -0.7061509, 2.716476, 1, 0, 0.6235294, 1,
1.229116, 0.7916313, 0.1055539, 1, 0, 0.6196079, 1,
1.231076, -0.2950251, 2.533341, 1, 0, 0.6117647, 1,
1.239909, 1.55478, 0.305985, 1, 0, 0.6078432, 1,
1.260038, -0.5765368, 2.911376, 1, 0, 0.6, 1,
1.260138, 0.05464996, 0.87593, 1, 0, 0.5921569, 1,
1.260771, 0.2376381, 1.115615, 1, 0, 0.5882353, 1,
1.269265, -0.005115856, 0.5191393, 1, 0, 0.5803922, 1,
1.270224, 0.2905496, 2.006654, 1, 0, 0.5764706, 1,
1.270272, -0.8518896, 0.9933486, 1, 0, 0.5686275, 1,
1.279889, 1.352003, 1.457756, 1, 0, 0.5647059, 1,
1.280676, 1.776531, 1.061731, 1, 0, 0.5568628, 1,
1.280848, 0.6903401, 2.554098, 1, 0, 0.5529412, 1,
1.289262, 1.265038, 0.08085319, 1, 0, 0.5450981, 1,
1.291013, -0.05357217, 2.532359, 1, 0, 0.5411765, 1,
1.292294, -0.5702774, 2.430368, 1, 0, 0.5333334, 1,
1.306094, -0.1228323, 1.577405, 1, 0, 0.5294118, 1,
1.306939, -0.193051, 2.489191, 1, 0, 0.5215687, 1,
1.307928, -2.982099, 3.614588, 1, 0, 0.5176471, 1,
1.324899, -0.4310994, 1.75825, 1, 0, 0.509804, 1,
1.327127, -1.828617, 4.825587, 1, 0, 0.5058824, 1,
1.333758, 0.1286649, 2.715654, 1, 0, 0.4980392, 1,
1.339446, 0.000177701, 1.76811, 1, 0, 0.4901961, 1,
1.354167, 0.9303718, 0.05115399, 1, 0, 0.4862745, 1,
1.364395, -0.422309, 2.048154, 1, 0, 0.4784314, 1,
1.366636, 0.8399074, 1.968757, 1, 0, 0.4745098, 1,
1.367599, -0.9232975, 2.514854, 1, 0, 0.4666667, 1,
1.368388, 0.3339828, 2.089813, 1, 0, 0.4627451, 1,
1.383291, -0.7822909, 1.204783, 1, 0, 0.454902, 1,
1.393945, -0.1853697, 3.604813, 1, 0, 0.4509804, 1,
1.396494, 1.913237, -1.003942, 1, 0, 0.4431373, 1,
1.412101, -0.7803982, 1.585145, 1, 0, 0.4392157, 1,
1.416641, -0.2431014, 0.6965479, 1, 0, 0.4313726, 1,
1.435829, 0.3478104, 2.306693, 1, 0, 0.427451, 1,
1.444376, 1.254185, 1.69193, 1, 0, 0.4196078, 1,
1.444989, -0.08635722, 2.123977, 1, 0, 0.4156863, 1,
1.457123, 0.1982022, 0.4211234, 1, 0, 0.4078431, 1,
1.464918, 0.2652947, 1.762132, 1, 0, 0.4039216, 1,
1.469596, 0.9998448, -0.0294405, 1, 0, 0.3960784, 1,
1.471817, -0.600153, 1.31118, 1, 0, 0.3882353, 1,
1.472707, 0.3137578, 0.8525975, 1, 0, 0.3843137, 1,
1.478391, -1.697607, 1.396968, 1, 0, 0.3764706, 1,
1.482708, -0.403269, 0.8516722, 1, 0, 0.372549, 1,
1.506209, -1.026474, 2.354626, 1, 0, 0.3647059, 1,
1.512405, -0.5058214, 3.305789, 1, 0, 0.3607843, 1,
1.519179, -0.8477177, 2.679404, 1, 0, 0.3529412, 1,
1.538379, 0.2330761, 1.227832, 1, 0, 0.3490196, 1,
1.53895, 1.481556, 0.8287181, 1, 0, 0.3411765, 1,
1.551631, 0.44478, 3.213819, 1, 0, 0.3372549, 1,
1.556054, 0.1861531, 1.124623, 1, 0, 0.3294118, 1,
1.562747, 1.006493, 1.428165, 1, 0, 0.3254902, 1,
1.57132, -0.5191516, 0.6935385, 1, 0, 0.3176471, 1,
1.585985, 0.4361668, 2.71653, 1, 0, 0.3137255, 1,
1.619946, 1.06706, 0.7897553, 1, 0, 0.3058824, 1,
1.622931, 1.384543, 0.3309183, 1, 0, 0.2980392, 1,
1.63213, -0.3250681, 1.194337, 1, 0, 0.2941177, 1,
1.638665, -1.154662, 1.211306, 1, 0, 0.2862745, 1,
1.642932, 0.20471, 2.142557, 1, 0, 0.282353, 1,
1.66399, 1.003774, 0.6986786, 1, 0, 0.2745098, 1,
1.666162, -0.5646333, 2.992585, 1, 0, 0.2705882, 1,
1.669799, -0.9262797, 2.48406, 1, 0, 0.2627451, 1,
1.676935, -0.2259881, 1.098119, 1, 0, 0.2588235, 1,
1.683605, -0.1145186, 1.521089, 1, 0, 0.2509804, 1,
1.705411, -1.452466, -0.2462857, 1, 0, 0.2470588, 1,
1.705861, 1.024872, 1.717275, 1, 0, 0.2392157, 1,
1.713921, 0.7164793, 1.516018, 1, 0, 0.2352941, 1,
1.74773, 0.01798825, 1.9306, 1, 0, 0.227451, 1,
1.750048, -0.07712658, 0.2961544, 1, 0, 0.2235294, 1,
1.759219, 1.475699, 1.964894, 1, 0, 0.2156863, 1,
1.760195, 0.8884786, 0.9274301, 1, 0, 0.2117647, 1,
1.77686, 1.400892, -0.6462029, 1, 0, 0.2039216, 1,
1.830728, 0.1214217, 1.833246, 1, 0, 0.1960784, 1,
1.845243, -0.2537646, 1.413294, 1, 0, 0.1921569, 1,
1.8544, -0.5245199, 1.437662, 1, 0, 0.1843137, 1,
1.886259, 1.011925, 1.989979, 1, 0, 0.1803922, 1,
1.899118, -1.51192, 2.606767, 1, 0, 0.172549, 1,
1.909858, -0.07795738, 1.946611, 1, 0, 0.1686275, 1,
1.926279, -0.4703744, 2.86184, 1, 0, 0.1607843, 1,
1.937633, 0.1568655, 0.8511357, 1, 0, 0.1568628, 1,
1.941304, 0.9489532, 1.591984, 1, 0, 0.1490196, 1,
1.9479, -0.5856247, 2.957782, 1, 0, 0.145098, 1,
1.959405, -0.04021839, 2.120131, 1, 0, 0.1372549, 1,
1.972696, 0.04424018, 1.05022, 1, 0, 0.1333333, 1,
2.007661, -2.716072, 3.183401, 1, 0, 0.1254902, 1,
2.047283, 1.70987, 2.267948, 1, 0, 0.1215686, 1,
2.066433, 0.7340592, 0.2787366, 1, 0, 0.1137255, 1,
2.072726, -0.6903722, 1.938583, 1, 0, 0.1098039, 1,
2.084105, 0.6462089, 0.5151848, 1, 0, 0.1019608, 1,
2.086615, 0.4452883, 1.477806, 1, 0, 0.09411765, 1,
2.100895, 1.933292, 1.463191, 1, 0, 0.09019608, 1,
2.111029, 1.353549, 1.175106, 1, 0, 0.08235294, 1,
2.128866, 1.433767, 0.1332579, 1, 0, 0.07843138, 1,
2.18224, 1.399405, 1.793962, 1, 0, 0.07058824, 1,
2.190881, -3.26835, 3.016718, 1, 0, 0.06666667, 1,
2.253781, 1.747775, 1.423247, 1, 0, 0.05882353, 1,
2.291315, -0.1413213, 0.7972002, 1, 0, 0.05490196, 1,
2.37015, -0.8013786, 1.275678, 1, 0, 0.04705882, 1,
2.462883, 0.3482323, 0.0514702, 1, 0, 0.04313726, 1,
2.478517, -1.121179, 1.892067, 1, 0, 0.03529412, 1,
2.533783, -1.546444, 2.690262, 1, 0, 0.03137255, 1,
2.69109, -1.622992, 2.583847, 1, 0, 0.02352941, 1,
2.693594, 1.128824, 0.1436386, 1, 0, 0.01960784, 1,
2.827212, 0.4374357, 2.214184, 1, 0, 0.01176471, 1,
3.16573, -0.25538, 2.357637, 1, 0, 0.007843138, 1
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
0.1482209, -4.397454, -7.754628, 0, -0.5, 0.5, 0.5,
0.1482209, -4.397454, -7.754628, 1, -0.5, 0.5, 0.5,
0.1482209, -4.397454, -7.754628, 1, 1.5, 0.5, 0.5,
0.1482209, -4.397454, -7.754628, 0, 1.5, 0.5, 0.5
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
-3.892224, 0.06233871, -7.754628, 0, -0.5, 0.5, 0.5,
-3.892224, 0.06233871, -7.754628, 1, -0.5, 0.5, 0.5,
-3.892224, 0.06233871, -7.754628, 1, 1.5, 0.5, 0.5,
-3.892224, 0.06233871, -7.754628, 0, 1.5, 0.5, 0.5
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
-3.892224, -4.397454, -0.334655, 0, -0.5, 0.5, 0.5,
-3.892224, -4.397454, -0.334655, 1, -0.5, 0.5, 0.5,
-3.892224, -4.397454, -0.334655, 1, 1.5, 0.5, 0.5,
-3.892224, -4.397454, -0.334655, 0, 1.5, 0.5, 0.5
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
-2, -3.368271, -6.042326,
3, -3.368271, -6.042326,
-2, -3.368271, -6.042326,
-2, -3.539802, -6.32771,
-1, -3.368271, -6.042326,
-1, -3.539802, -6.32771,
0, -3.368271, -6.042326,
0, -3.539802, -6.32771,
1, -3.368271, -6.042326,
1, -3.539802, -6.32771,
2, -3.368271, -6.042326,
2, -3.539802, -6.32771,
3, -3.368271, -6.042326,
3, -3.539802, -6.32771
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
-2, -3.882863, -6.898477, 0, -0.5, 0.5, 0.5,
-2, -3.882863, -6.898477, 1, -0.5, 0.5, 0.5,
-2, -3.882863, -6.898477, 1, 1.5, 0.5, 0.5,
-2, -3.882863, -6.898477, 0, 1.5, 0.5, 0.5,
-1, -3.882863, -6.898477, 0, -0.5, 0.5, 0.5,
-1, -3.882863, -6.898477, 1, -0.5, 0.5, 0.5,
-1, -3.882863, -6.898477, 1, 1.5, 0.5, 0.5,
-1, -3.882863, -6.898477, 0, 1.5, 0.5, 0.5,
0, -3.882863, -6.898477, 0, -0.5, 0.5, 0.5,
0, -3.882863, -6.898477, 1, -0.5, 0.5, 0.5,
0, -3.882863, -6.898477, 1, 1.5, 0.5, 0.5,
0, -3.882863, -6.898477, 0, 1.5, 0.5, 0.5,
1, -3.882863, -6.898477, 0, -0.5, 0.5, 0.5,
1, -3.882863, -6.898477, 1, -0.5, 0.5, 0.5,
1, -3.882863, -6.898477, 1, 1.5, 0.5, 0.5,
1, -3.882863, -6.898477, 0, 1.5, 0.5, 0.5,
2, -3.882863, -6.898477, 0, -0.5, 0.5, 0.5,
2, -3.882863, -6.898477, 1, -0.5, 0.5, 0.5,
2, -3.882863, -6.898477, 1, 1.5, 0.5, 0.5,
2, -3.882863, -6.898477, 0, 1.5, 0.5, 0.5,
3, -3.882863, -6.898477, 0, -0.5, 0.5, 0.5,
3, -3.882863, -6.898477, 1, -0.5, 0.5, 0.5,
3, -3.882863, -6.898477, 1, 1.5, 0.5, 0.5,
3, -3.882863, -6.898477, 0, 1.5, 0.5, 0.5
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
-2.959814, -3, -6.042326,
-2.959814, 3, -6.042326,
-2.959814, -3, -6.042326,
-3.115216, -3, -6.32771,
-2.959814, -2, -6.042326,
-3.115216, -2, -6.32771,
-2.959814, -1, -6.042326,
-3.115216, -1, -6.32771,
-2.959814, 0, -6.042326,
-3.115216, 0, -6.32771,
-2.959814, 1, -6.042326,
-3.115216, 1, -6.32771,
-2.959814, 2, -6.042326,
-3.115216, 2, -6.32771,
-2.959814, 3, -6.042326,
-3.115216, 3, -6.32771
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
-3.426019, -3, -6.898477, 0, -0.5, 0.5, 0.5,
-3.426019, -3, -6.898477, 1, -0.5, 0.5, 0.5,
-3.426019, -3, -6.898477, 1, 1.5, 0.5, 0.5,
-3.426019, -3, -6.898477, 0, 1.5, 0.5, 0.5,
-3.426019, -2, -6.898477, 0, -0.5, 0.5, 0.5,
-3.426019, -2, -6.898477, 1, -0.5, 0.5, 0.5,
-3.426019, -2, -6.898477, 1, 1.5, 0.5, 0.5,
-3.426019, -2, -6.898477, 0, 1.5, 0.5, 0.5,
-3.426019, -1, -6.898477, 0, -0.5, 0.5, 0.5,
-3.426019, -1, -6.898477, 1, -0.5, 0.5, 0.5,
-3.426019, -1, -6.898477, 1, 1.5, 0.5, 0.5,
-3.426019, -1, -6.898477, 0, 1.5, 0.5, 0.5,
-3.426019, 0, -6.898477, 0, -0.5, 0.5, 0.5,
-3.426019, 0, -6.898477, 1, -0.5, 0.5, 0.5,
-3.426019, 0, -6.898477, 1, 1.5, 0.5, 0.5,
-3.426019, 0, -6.898477, 0, 1.5, 0.5, 0.5,
-3.426019, 1, -6.898477, 0, -0.5, 0.5, 0.5,
-3.426019, 1, -6.898477, 1, -0.5, 0.5, 0.5,
-3.426019, 1, -6.898477, 1, 1.5, 0.5, 0.5,
-3.426019, 1, -6.898477, 0, 1.5, 0.5, 0.5,
-3.426019, 2, -6.898477, 0, -0.5, 0.5, 0.5,
-3.426019, 2, -6.898477, 1, -0.5, 0.5, 0.5,
-3.426019, 2, -6.898477, 1, 1.5, 0.5, 0.5,
-3.426019, 2, -6.898477, 0, 1.5, 0.5, 0.5,
-3.426019, 3, -6.898477, 0, -0.5, 0.5, 0.5,
-3.426019, 3, -6.898477, 1, -0.5, 0.5, 0.5,
-3.426019, 3, -6.898477, 1, 1.5, 0.5, 0.5,
-3.426019, 3, -6.898477, 0, 1.5, 0.5, 0.5
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
-2.959814, -3.368271, -4,
-2.959814, -3.368271, 4,
-2.959814, -3.368271, -4,
-3.115216, -3.539802, -4,
-2.959814, -3.368271, -2,
-3.115216, -3.539802, -2,
-2.959814, -3.368271, 0,
-3.115216, -3.539802, 0,
-2.959814, -3.368271, 2,
-3.115216, -3.539802, 2,
-2.959814, -3.368271, 4,
-3.115216, -3.539802, 4
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
-3.426019, -3.882863, -4, 0, -0.5, 0.5, 0.5,
-3.426019, -3.882863, -4, 1, -0.5, 0.5, 0.5,
-3.426019, -3.882863, -4, 1, 1.5, 0.5, 0.5,
-3.426019, -3.882863, -4, 0, 1.5, 0.5, 0.5,
-3.426019, -3.882863, -2, 0, -0.5, 0.5, 0.5,
-3.426019, -3.882863, -2, 1, -0.5, 0.5, 0.5,
-3.426019, -3.882863, -2, 1, 1.5, 0.5, 0.5,
-3.426019, -3.882863, -2, 0, 1.5, 0.5, 0.5,
-3.426019, -3.882863, 0, 0, -0.5, 0.5, 0.5,
-3.426019, -3.882863, 0, 1, -0.5, 0.5, 0.5,
-3.426019, -3.882863, 0, 1, 1.5, 0.5, 0.5,
-3.426019, -3.882863, 0, 0, 1.5, 0.5, 0.5,
-3.426019, -3.882863, 2, 0, -0.5, 0.5, 0.5,
-3.426019, -3.882863, 2, 1, -0.5, 0.5, 0.5,
-3.426019, -3.882863, 2, 1, 1.5, 0.5, 0.5,
-3.426019, -3.882863, 2, 0, 1.5, 0.5, 0.5,
-3.426019, -3.882863, 4, 0, -0.5, 0.5, 0.5,
-3.426019, -3.882863, 4, 1, -0.5, 0.5, 0.5,
-3.426019, -3.882863, 4, 1, 1.5, 0.5, 0.5,
-3.426019, -3.882863, 4, 0, 1.5, 0.5, 0.5
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
-2.959814, -3.368271, -6.042326,
-2.959814, 3.492949, -6.042326,
-2.959814, -3.368271, 5.373016,
-2.959814, 3.492949, 5.373016,
-2.959814, -3.368271, -6.042326,
-2.959814, -3.368271, 5.373016,
-2.959814, 3.492949, -6.042326,
-2.959814, 3.492949, 5.373016,
-2.959814, -3.368271, -6.042326,
3.256256, -3.368271, -6.042326,
-2.959814, -3.368271, 5.373016,
3.256256, -3.368271, 5.373016,
-2.959814, 3.492949, -6.042326,
3.256256, 3.492949, -6.042326,
-2.959814, 3.492949, 5.373016,
3.256256, 3.492949, 5.373016,
3.256256, -3.368271, -6.042326,
3.256256, 3.492949, -6.042326,
3.256256, -3.368271, 5.373016,
3.256256, 3.492949, 5.373016,
3.256256, -3.368271, -6.042326,
3.256256, -3.368271, 5.373016,
3.256256, 3.492949, -6.042326,
3.256256, 3.492949, 5.373016
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
var radius = 7.84835;
var distance = 34.9182;
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
mvMatrix.translate( -0.1482209, -0.06233871, 0.334655 );
mvMatrix.scale( 1.365138, 1.236776, 0.7433671 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.9182);
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
butamifos<-read.table("butamifos.xyz")
```

```
## Error in read.table("butamifos.xyz"): no lines available in input
```

```r
x<-butamifos$V2
```

```
## Error in eval(expr, envir, enclos): object 'butamifos' not found
```

```r
y<-butamifos$V3
```

```
## Error in eval(expr, envir, enclos): object 'butamifos' not found
```

```r
z<-butamifos$V4
```

```
## Error in eval(expr, envir, enclos): object 'butamifos' not found
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
-2.869289, 0.3332478, -2.235171, 0, 0, 1, 1, 1,
-2.778567, -0.2306388, -2.026689, 1, 0, 0, 1, 1,
-2.639934, 0.7124062, -1.74897, 1, 0, 0, 1, 1,
-2.566353, -0.5271075, -3.620759, 1, 0, 0, 1, 1,
-2.55709, 1.501626, -1.785794, 1, 0, 0, 1, 1,
-2.542271, -0.3733621, -2.772082, 1, 0, 0, 1, 1,
-2.504095, 0.1340466, -2.036188, 0, 0, 0, 1, 1,
-2.478032, -1.160362, -2.976442, 0, 0, 0, 1, 1,
-2.472442, -1.855097, -2.280031, 0, 0, 0, 1, 1,
-2.429969, -1.654013, -1.690588, 0, 0, 0, 1, 1,
-2.421998, 1.471808, -2.197433, 0, 0, 0, 1, 1,
-2.415738, -0.09824159, -0.6098523, 0, 0, 0, 1, 1,
-2.38456, 0.321846, -0.4414324, 0, 0, 0, 1, 1,
-2.320039, -0.5503133, -1.974289, 1, 1, 1, 1, 1,
-2.275409, 1.471723, -0.2973431, 1, 1, 1, 1, 1,
-2.251418, 0.04490976, -1.263219, 1, 1, 1, 1, 1,
-2.233899, 1.415764, -0.6885738, 1, 1, 1, 1, 1,
-2.173962, 0.468991, -1.363783, 1, 1, 1, 1, 1,
-2.141951, -1.095007, -1.925237, 1, 1, 1, 1, 1,
-2.075727, 1.785903, -1.18775, 1, 1, 1, 1, 1,
-2.065449, 0.09206093, -2.814808, 1, 1, 1, 1, 1,
-2.047944, 0.1291547, -0.4488998, 1, 1, 1, 1, 1,
-2.034391, 0.6731153, -2.66686, 1, 1, 1, 1, 1,
-2.01102, 0.5698316, -0.3234696, 1, 1, 1, 1, 1,
-2.009841, -0.7553015, -0.4264029, 1, 1, 1, 1, 1,
-1.999995, 0.6676282, -1.814724, 1, 1, 1, 1, 1,
-1.993452, -0.8131334, -1.85102, 1, 1, 1, 1, 1,
-1.936792, 1.507369, -0.4543144, 1, 1, 1, 1, 1,
-1.921351, -0.2659134, -1.142979, 0, 0, 1, 1, 1,
-1.919426, -0.4477679, -0.6864606, 1, 0, 0, 1, 1,
-1.860995, -1.751199, -3.254665, 1, 0, 0, 1, 1,
-1.858805, 2.575336, -0.5742481, 1, 0, 0, 1, 1,
-1.85727, 0.82952, -0.7285616, 1, 0, 0, 1, 1,
-1.823716, -1.579754, -2.428904, 1, 0, 0, 1, 1,
-1.814458, 1.708206, -0.8817786, 0, 0, 0, 1, 1,
-1.808312, -0.4556981, -2.840636, 0, 0, 0, 1, 1,
-1.788614, -1.162124, -1.514967, 0, 0, 0, 1, 1,
-1.786567, -0.1576003, -0.207992, 0, 0, 0, 1, 1,
-1.773209, -1.257074, -2.708546, 0, 0, 0, 1, 1,
-1.762725, 0.9302407, -2.364652, 0, 0, 0, 1, 1,
-1.761812, 0.3906223, -2.087625, 0, 0, 0, 1, 1,
-1.746798, -0.03062066, -2.957856, 1, 1, 1, 1, 1,
-1.744951, 1.417033, -1.715213, 1, 1, 1, 1, 1,
-1.730243, -0.3735218, -2.063767, 1, 1, 1, 1, 1,
-1.728023, 1.186721, -1.757641, 1, 1, 1, 1, 1,
-1.726562, -0.7163056, -1.331858, 1, 1, 1, 1, 1,
-1.71902, -0.5893326, -1.34909, 1, 1, 1, 1, 1,
-1.712707, -1.075345, -3.607351, 1, 1, 1, 1, 1,
-1.710319, -1.427031, -4.073892, 1, 1, 1, 1, 1,
-1.688768, -0.4460669, -0.2316755, 1, 1, 1, 1, 1,
-1.688313, 0.7367306, -0.4440791, 1, 1, 1, 1, 1,
-1.670134, -0.1190036, -3.023853, 1, 1, 1, 1, 1,
-1.664962, -0.4885517, -2.219688, 1, 1, 1, 1, 1,
-1.656945, -0.008372619, -2.107363, 1, 1, 1, 1, 1,
-1.647034, 0.5776578, -1.840757, 1, 1, 1, 1, 1,
-1.643214, -0.7908007, -2.555866, 1, 1, 1, 1, 1,
-1.641656, -0.800993, -1.285263, 0, 0, 1, 1, 1,
-1.6342, -1.093931, -2.823591, 1, 0, 0, 1, 1,
-1.616787, 0.6712601, -0.5328448, 1, 0, 0, 1, 1,
-1.608135, -1.367401, -3.284321, 1, 0, 0, 1, 1,
-1.59538, -0.4915579, -1.127993, 1, 0, 0, 1, 1,
-1.592078, 1.540405, -0.7563085, 1, 0, 0, 1, 1,
-1.568519, 0.6947111, -1.372629, 0, 0, 0, 1, 1,
-1.565466, -2.029822, -2.793794, 0, 0, 0, 1, 1,
-1.549315, -1.209455, -1.057566, 0, 0, 0, 1, 1,
-1.543678, 1.356953, -0.8033574, 0, 0, 0, 1, 1,
-1.541958, 0.07270314, -1.76982, 0, 0, 0, 1, 1,
-1.53858, -0.6346028, -3.121014, 0, 0, 0, 1, 1,
-1.531832, -1.223493, -3.356687, 0, 0, 0, 1, 1,
-1.52195, -1.064278, -1.4937, 1, 1, 1, 1, 1,
-1.513303, -1.700247, -1.499259, 1, 1, 1, 1, 1,
-1.48456, -1.116632, -3.799103, 1, 1, 1, 1, 1,
-1.469653, 0.6847412, -1.531092, 1, 1, 1, 1, 1,
-1.464161, 0.9222989, -1.717704, 1, 1, 1, 1, 1,
-1.457603, 0.4911145, -2.705782, 1, 1, 1, 1, 1,
-1.456891, -1.014672, -3.428388, 1, 1, 1, 1, 1,
-1.449768, -0.5085947, -0.9910117, 1, 1, 1, 1, 1,
-1.438461, -1.850739, -1.780255, 1, 1, 1, 1, 1,
-1.43826, -0.3297654, -2.121363, 1, 1, 1, 1, 1,
-1.413657, -0.4485134, -2.332998, 1, 1, 1, 1, 1,
-1.410068, -0.516899, -2.040497, 1, 1, 1, 1, 1,
-1.408309, 0.6338907, -0.4342397, 1, 1, 1, 1, 1,
-1.403264, 1.385614, 0.369462, 1, 1, 1, 1, 1,
-1.387696, -0.4453904, -2.060799, 1, 1, 1, 1, 1,
-1.386083, -0.3255134, -3.215867, 0, 0, 1, 1, 1,
-1.384374, -0.5013906, -2.093792, 1, 0, 0, 1, 1,
-1.378143, 0.1763659, -2.484676, 1, 0, 0, 1, 1,
-1.373871, -0.8464696, -2.871629, 1, 0, 0, 1, 1,
-1.367859, -1.266461, -3.521226, 1, 0, 0, 1, 1,
-1.358121, 0.05737498, -3.881572, 1, 0, 0, 1, 1,
-1.357466, 0.3838728, -1.379467, 0, 0, 0, 1, 1,
-1.345595, -1.211293, -1.309892, 0, 0, 0, 1, 1,
-1.334197, -0.8926469, -1.467726, 0, 0, 0, 1, 1,
-1.333232, -0.5636846, -1.100121, 0, 0, 0, 1, 1,
-1.329812, 1.163601, -2.794129, 0, 0, 0, 1, 1,
-1.328522, 1.378401, 0.06109999, 0, 0, 0, 1, 1,
-1.314693, 0.089471, -4.564078, 0, 0, 0, 1, 1,
-1.313735, -0.2532926, -3.998944, 1, 1, 1, 1, 1,
-1.311327, -1.301561, -3.19806, 1, 1, 1, 1, 1,
-1.310084, 1.163682, 1.3246, 1, 1, 1, 1, 1,
-1.308759, 0.2929582, 0.03535432, 1, 1, 1, 1, 1,
-1.307137, 0.9315085, -0.1647709, 1, 1, 1, 1, 1,
-1.300751, -1.109589, -3.797582, 1, 1, 1, 1, 1,
-1.281652, 0.6151035, -0.1300739, 1, 1, 1, 1, 1,
-1.280781, -0.2316015, -0.7826445, 1, 1, 1, 1, 1,
-1.280275, -0.12767, -3.839506, 1, 1, 1, 1, 1,
-1.276722, 0.1006625, -0.08475552, 1, 1, 1, 1, 1,
-1.272161, 1.649694, -0.9836449, 1, 1, 1, 1, 1,
-1.271108, 1.111216, 0.7641277, 1, 1, 1, 1, 1,
-1.268399, 0.1269322, -0.9182751, 1, 1, 1, 1, 1,
-1.268238, -0.6432747, -2.519195, 1, 1, 1, 1, 1,
-1.266472, 0.8885829, -3.210737, 1, 1, 1, 1, 1,
-1.262861, 1.415593, 0.08762176, 0, 0, 1, 1, 1,
-1.25868, -0.5728066, -2.693082, 1, 0, 0, 1, 1,
-1.255877, 1.181097, -0.264403, 1, 0, 0, 1, 1,
-1.250639, 0.6872646, -1.69112, 1, 0, 0, 1, 1,
-1.250194, -1.703348, -2.741917, 1, 0, 0, 1, 1,
-1.244164, 1.104527, 0.3090988, 1, 0, 0, 1, 1,
-1.234746, -1.493237, -2.48482, 0, 0, 0, 1, 1,
-1.232797, 0.3788226, -1.841013, 0, 0, 0, 1, 1,
-1.230931, 0.4410602, -2.282825, 0, 0, 0, 1, 1,
-1.22449, -0.6597284, -1.387486, 0, 0, 0, 1, 1,
-1.223939, 0.6482612, -0.9447056, 0, 0, 0, 1, 1,
-1.214124, -0.1988713, -2.039668, 0, 0, 0, 1, 1,
-1.212506, -0.8571395, -2.576957, 0, 0, 0, 1, 1,
-1.211171, -1.553666, -1.889965, 1, 1, 1, 1, 1,
-1.210702, 0.5129147, -0.9900575, 1, 1, 1, 1, 1,
-1.202753, -0.6272483, -2.154803, 1, 1, 1, 1, 1,
-1.197124, -1.169088, -2.839686, 1, 1, 1, 1, 1,
-1.19634, -0.1119684, -3.54615, 1, 1, 1, 1, 1,
-1.193314, -1.569057, -1.08772, 1, 1, 1, 1, 1,
-1.186821, 0.9667745, -0.339369, 1, 1, 1, 1, 1,
-1.168916, -1.051637, -2.090432, 1, 1, 1, 1, 1,
-1.155326, -1.115857, -2.578065, 1, 1, 1, 1, 1,
-1.151971, 0.5747457, 0.3450547, 1, 1, 1, 1, 1,
-1.148821, -1.18488, -0.2601207, 1, 1, 1, 1, 1,
-1.147799, -0.5783819, -2.979806, 1, 1, 1, 1, 1,
-1.145782, 0.03715444, -2.500726, 1, 1, 1, 1, 1,
-1.143358, 1.130896, -0.7667745, 1, 1, 1, 1, 1,
-1.134919, -1.533542, -2.142306, 1, 1, 1, 1, 1,
-1.133092, -0.1456786, -1.337833, 0, 0, 1, 1, 1,
-1.13287, 0.2922699, -0.07042222, 1, 0, 0, 1, 1,
-1.130755, 0.2543337, -2.343258, 1, 0, 0, 1, 1,
-1.13072, -0.003555849, -3.957856, 1, 0, 0, 1, 1,
-1.121692, -0.1871843, -0.814494, 1, 0, 0, 1, 1,
-1.120273, 0.2675281, -0.6242358, 1, 0, 0, 1, 1,
-1.119642, -0.6350431, -2.261902, 0, 0, 0, 1, 1,
-1.116091, -0.7781969, -3.912937, 0, 0, 0, 1, 1,
-1.113271, 0.03241748, -1.358211, 0, 0, 0, 1, 1,
-1.110584, 0.4315301, -1.43609, 0, 0, 0, 1, 1,
-1.108128, -1.116134, -1.048444, 0, 0, 0, 1, 1,
-1.104448, -0.6970224, -0.5280349, 0, 0, 0, 1, 1,
-1.095882, -0.1148566, -1.483113, 0, 0, 0, 1, 1,
-1.091008, -0.192791, -0.9595846, 1, 1, 1, 1, 1,
-1.087103, -1.909222, -3.858111, 1, 1, 1, 1, 1,
-1.086065, -0.6959679, -2.182158, 1, 1, 1, 1, 1,
-1.08224, 2.26196, -1.098464, 1, 1, 1, 1, 1,
-1.073997, -0.09817164, -0.9465476, 1, 1, 1, 1, 1,
-1.071897, -1.800336, -2.598104, 1, 1, 1, 1, 1,
-1.063791, -0.1250931, -1.585569, 1, 1, 1, 1, 1,
-1.05651, 3.393028, 1.002724, 1, 1, 1, 1, 1,
-1.053164, -2.485829, -2.711818, 1, 1, 1, 1, 1,
-1.04783, 0.8734021, 0.6772271, 1, 1, 1, 1, 1,
-1.040945, -0.5730838, -5.876083, 1, 1, 1, 1, 1,
-1.03884, 0.8888716, -2.282141, 1, 1, 1, 1, 1,
-1.036821, -0.4616991, -1.750239, 1, 1, 1, 1, 1,
-1.012783, -2.542285, -1.706222, 1, 1, 1, 1, 1,
-1.0101, 0.1098886, -2.620664, 1, 1, 1, 1, 1,
-1.009262, -1.180432, -3.283776, 0, 0, 1, 1, 1,
-1.009027, 0.8912577, -1.433252, 1, 0, 0, 1, 1,
-0.9980014, 0.09646376, -1.310633, 1, 0, 0, 1, 1,
-0.9852183, 0.2406289, -2.041576, 1, 0, 0, 1, 1,
-0.9825455, 0.5030707, -1.165744, 1, 0, 0, 1, 1,
-0.9707698, 0.09480865, -1.69028, 1, 0, 0, 1, 1,
-0.9648646, 0.4213173, 0.1236074, 0, 0, 0, 1, 1,
-0.9629079, 0.1708419, -2.169885, 0, 0, 0, 1, 1,
-0.961288, 0.2057532, -0.8758533, 0, 0, 0, 1, 1,
-0.9575531, -0.1270969, -0.7850468, 0, 0, 0, 1, 1,
-0.9502313, -0.5639608, -2.775207, 0, 0, 0, 1, 1,
-0.9408595, -1.613372, -3.037144, 0, 0, 0, 1, 1,
-0.9360295, 0.6888728, -0.6467497, 0, 0, 0, 1, 1,
-0.9303047, -1.329054, -2.282463, 1, 1, 1, 1, 1,
-0.924877, 1.200972, -0.3323289, 1, 1, 1, 1, 1,
-0.9205406, 2.034656, -0.5667804, 1, 1, 1, 1, 1,
-0.9165532, 0.3750768, -0.08925692, 1, 1, 1, 1, 1,
-0.9155052, -1.023833, -1.874024, 1, 1, 1, 1, 1,
-0.9143537, 1.124706, 0.1508065, 1, 1, 1, 1, 1,
-0.8954981, -0.7675171, -1.319058, 1, 1, 1, 1, 1,
-0.8901402, -0.1827506, -1.955003, 1, 1, 1, 1, 1,
-0.8900492, 0.6250333, -0.997851, 1, 1, 1, 1, 1,
-0.8800974, 0.1880201, 1.730654, 1, 1, 1, 1, 1,
-0.8772525, 0.3658512, -0.3999927, 1, 1, 1, 1, 1,
-0.8753387, 2.084048, -1.046438, 1, 1, 1, 1, 1,
-0.8738258, -0.04276849, -0.7014338, 1, 1, 1, 1, 1,
-0.869318, 2.290322, -0.4559111, 1, 1, 1, 1, 1,
-0.8548725, -2.001056, -2.237086, 1, 1, 1, 1, 1,
-0.8530463, 1.080046, -0.6706789, 0, 0, 1, 1, 1,
-0.8399099, 1.36121, -0.171287, 1, 0, 0, 1, 1,
-0.8390391, 2.204902, -0.09749129, 1, 0, 0, 1, 1,
-0.8337336, 0.227544, -3.322505, 1, 0, 0, 1, 1,
-0.8333091, 0.6682474, -0.5629873, 1, 0, 0, 1, 1,
-0.8284335, 0.0279777, -0.5224121, 1, 0, 0, 1, 1,
-0.8262615, -0.6187502, -3.365119, 0, 0, 0, 1, 1,
-0.8256112, 0.7607855, -0.8543715, 0, 0, 0, 1, 1,
-0.8188709, -0.5650939, -1.75509, 0, 0, 0, 1, 1,
-0.8175907, 1.122932, -0.6934233, 0, 0, 0, 1, 1,
-0.8126563, 0.6386275, 0.7661986, 0, 0, 0, 1, 1,
-0.8104833, 1.784992, 2.299619, 0, 0, 0, 1, 1,
-0.8098193, 0.8471224, -0.2072289, 0, 0, 0, 1, 1,
-0.8083978, -0.6108754, -3.290798, 1, 1, 1, 1, 1,
-0.8000538, 0.9708611, 0.2283932, 1, 1, 1, 1, 1,
-0.7994593, -0.07762255, -0.04088378, 1, 1, 1, 1, 1,
-0.7970086, 0.5758851, -1.90891, 1, 1, 1, 1, 1,
-0.7965081, 1.638616, -1.3641, 1, 1, 1, 1, 1,
-0.7951472, -0.9756194, -4.634436, 1, 1, 1, 1, 1,
-0.7893526, 0.3141581, 0.1052173, 1, 1, 1, 1, 1,
-0.7885218, -0.7154475, -1.61912, 1, 1, 1, 1, 1,
-0.7837885, 0.7376881, -1.043068, 1, 1, 1, 1, 1,
-0.7796599, -0.5015268, -3.224459, 1, 1, 1, 1, 1,
-0.771762, 1.105969, -2.180638, 1, 1, 1, 1, 1,
-0.7679111, -0.7171032, -3.204184, 1, 1, 1, 1, 1,
-0.76077, 0.90064, -0.01389419, 1, 1, 1, 1, 1,
-0.756397, -0.5134662, -2.114786, 1, 1, 1, 1, 1,
-0.7555858, 0.832622, -0.8409882, 1, 1, 1, 1, 1,
-0.7526765, 0.975281, -1.50579, 0, 0, 1, 1, 1,
-0.741429, 0.09856679, -2.252544, 1, 0, 0, 1, 1,
-0.7365252, 1.184543, 1.13867, 1, 0, 0, 1, 1,
-0.727621, -0.420386, -1.873388, 1, 0, 0, 1, 1,
-0.7274629, 0.5116211, -0.4927792, 1, 0, 0, 1, 1,
-0.7257468, -0.2753473, -1.255652, 1, 0, 0, 1, 1,
-0.7235013, 2.166873, 0.1077694, 0, 0, 0, 1, 1,
-0.7216482, 0.6684198, -0.8597673, 0, 0, 0, 1, 1,
-0.7176417, -0.2603406, -2.153963, 0, 0, 0, 1, 1,
-0.7172139, -0.1504508, -2.756655, 0, 0, 0, 1, 1,
-0.7127181, 1.784595, -2.510172, 0, 0, 0, 1, 1,
-0.7124723, 1.10831, -0.9229965, 0, 0, 0, 1, 1,
-0.7119997, -0.2147746, -2.934902, 0, 0, 0, 1, 1,
-0.7079467, -0.2192873, -1.322744, 1, 1, 1, 1, 1,
-0.7076505, -0.3486046, -2.287138, 1, 1, 1, 1, 1,
-0.7025793, 0.3287155, -2.589045, 1, 1, 1, 1, 1,
-0.7008737, 0.4476269, -1.547123, 1, 1, 1, 1, 1,
-0.6965464, -0.5212473, -2.2844, 1, 1, 1, 1, 1,
-0.692799, -0.97639, -3.0759, 1, 1, 1, 1, 1,
-0.6772427, 1.760373, -0.7388229, 1, 1, 1, 1, 1,
-0.6695022, 0.3183246, -1.791362, 1, 1, 1, 1, 1,
-0.6663313, -0.875714, -1.720664, 1, 1, 1, 1, 1,
-0.6649153, 0.5903726, -1.498395, 1, 1, 1, 1, 1,
-0.6632394, 0.07097156, -0.4292125, 1, 1, 1, 1, 1,
-0.6605585, -2.391464, -2.354818, 1, 1, 1, 1, 1,
-0.6597973, 0.5253912, -1.307857, 1, 1, 1, 1, 1,
-0.6563253, 0.1257405, -0.5815465, 1, 1, 1, 1, 1,
-0.6523191, 1.473691, 0.9104862, 1, 1, 1, 1, 1,
-0.6468289, -0.6089651, -3.821386, 0, 0, 1, 1, 1,
-0.643873, -1.051671, -1.747806, 1, 0, 0, 1, 1,
-0.6430469, 0.547906, -1.257719, 1, 0, 0, 1, 1,
-0.6422445, -0.1870015, -2.601627, 1, 0, 0, 1, 1,
-0.6417524, 0.9817988, 0.8201076, 1, 0, 0, 1, 1,
-0.6412534, 1.78812, -1.658343, 1, 0, 0, 1, 1,
-0.6395605, 0.0620687, -0.5902681, 0, 0, 0, 1, 1,
-0.6384673, 1.327739, 0.7317654, 0, 0, 0, 1, 1,
-0.6336772, -0.444284, -1.414757, 0, 0, 0, 1, 1,
-0.6334421, 0.04186788, -2.529875, 0, 0, 0, 1, 1,
-0.6326756, -2.03618, -3.525973, 0, 0, 0, 1, 1,
-0.6298911, 0.4997993, -0.1936825, 0, 0, 0, 1, 1,
-0.6253468, -0.1730748, -0.3931128, 0, 0, 0, 1, 1,
-0.6208208, -2.036761, -3.343095, 1, 1, 1, 1, 1,
-0.619423, -1.055058, -4.552948, 1, 1, 1, 1, 1,
-0.6179198, -0.7673189, -0.8650517, 1, 1, 1, 1, 1,
-0.6162828, -0.2840777, -1.35537, 1, 1, 1, 1, 1,
-0.6035249, 0.3800586, -1.495524, 1, 1, 1, 1, 1,
-0.6026359, 0.7641461, 0.9241344, 1, 1, 1, 1, 1,
-0.6019411, -0.8167332, -1.647804, 1, 1, 1, 1, 1,
-0.6008183, -1.329946, -2.990272, 1, 1, 1, 1, 1,
-0.597582, -0.453527, -3.155719, 1, 1, 1, 1, 1,
-0.5919572, -1.122936, -3.347481, 1, 1, 1, 1, 1,
-0.5854101, 0.1549255, -0.3783018, 1, 1, 1, 1, 1,
-0.5810885, -0.627416, -2.125298, 1, 1, 1, 1, 1,
-0.5791696, 0.6833867, -0.8840102, 1, 1, 1, 1, 1,
-0.5777586, 0.6150752, -1.609621, 1, 1, 1, 1, 1,
-0.5758347, 0.7511525, -0.2334162, 1, 1, 1, 1, 1,
-0.5721723, 0.2388818, -2.014687, 0, 0, 1, 1, 1,
-0.5712891, 0.2818334, -1.522221, 1, 0, 0, 1, 1,
-0.5693719, 0.8566958, -1.113282, 1, 0, 0, 1, 1,
-0.5660395, -1.526502, -1.748231, 1, 0, 0, 1, 1,
-0.5646188, -1.766405, -2.911546, 1, 0, 0, 1, 1,
-0.5603767, 1.611262, -0.01541473, 1, 0, 0, 1, 1,
-0.5590304, -0.6303829, -2.697917, 0, 0, 0, 1, 1,
-0.5577028, 0.04127326, 0.3555194, 0, 0, 0, 1, 1,
-0.5555451, -0.2309322, -2.505711, 0, 0, 0, 1, 1,
-0.5545754, -0.1828196, -2.962735, 0, 0, 0, 1, 1,
-0.5516227, 0.6501517, -0.1640542, 0, 0, 0, 1, 1,
-0.5512879, -0.7615508, -2.81187, 0, 0, 0, 1, 1,
-0.5433346, -0.7774802, -3.264395, 0, 0, 0, 1, 1,
-0.5407282, -0.1314715, -2.184026, 1, 1, 1, 1, 1,
-0.540052, 0.4664438, -2.125128, 1, 1, 1, 1, 1,
-0.5346188, 1.140579, -0.7435198, 1, 1, 1, 1, 1,
-0.5329266, 0.8587834, -1.252322, 1, 1, 1, 1, 1,
-0.5291021, -0.5308599, -2.905158, 1, 1, 1, 1, 1,
-0.5258458, 1.228174, -0.6601129, 1, 1, 1, 1, 1,
-0.523642, -0.6028338, -1.444118, 1, 1, 1, 1, 1,
-0.5227962, 0.6083622, 1.037301, 1, 1, 1, 1, 1,
-0.5200706, -1.968829, -2.886412, 1, 1, 1, 1, 1,
-0.5180967, 0.7914416, -0.1745529, 1, 1, 1, 1, 1,
-0.5154986, -1.830996, -2.26314, 1, 1, 1, 1, 1,
-0.5124559, -1.180997, -2.224802, 1, 1, 1, 1, 1,
-0.5001658, 0.1778918, -0.612761, 1, 1, 1, 1, 1,
-0.4940138, 1.475554, -1.19937, 1, 1, 1, 1, 1,
-0.4893681, 1.139354, -1.33163, 1, 1, 1, 1, 1,
-0.4874204, 1.03169, 1.174599, 0, 0, 1, 1, 1,
-0.4798804, 0.7408589, -0.3390262, 1, 0, 0, 1, 1,
-0.4786056, 0.3813151, -0.5577076, 1, 0, 0, 1, 1,
-0.477201, -0.0408882, -1.415899, 1, 0, 0, 1, 1,
-0.4767997, 0.56221, -2.542111, 1, 0, 0, 1, 1,
-0.4764028, -0.6479142, -1.438923, 1, 0, 0, 1, 1,
-0.4736402, -1.357536, -3.435058, 0, 0, 0, 1, 1,
-0.4686016, -0.3479683, -1.713561, 0, 0, 0, 1, 1,
-0.4641511, 2.393128, 0.01885439, 0, 0, 0, 1, 1,
-0.458352, -0.7283581, -3.045387, 0, 0, 0, 1, 1,
-0.4550384, -2.265613, -3.994448, 0, 0, 0, 1, 1,
-0.4527463, -1.172959, -2.484219, 0, 0, 0, 1, 1,
-0.4513696, 0.7896724, -0.410608, 0, 0, 0, 1, 1,
-0.4487033, -3.106792, -4.733559, 1, 1, 1, 1, 1,
-0.44842, 0.6926046, -0.4921682, 1, 1, 1, 1, 1,
-0.445928, -0.8585177, -4.241429, 1, 1, 1, 1, 1,
-0.445349, -0.5652239, -1.554766, 1, 1, 1, 1, 1,
-0.4452602, -0.8809199, -2.966914, 1, 1, 1, 1, 1,
-0.443246, -0.3908845, -1.736337, 1, 1, 1, 1, 1,
-0.4419844, 0.9303628, -0.78983, 1, 1, 1, 1, 1,
-0.4418413, -0.2989717, 0.134617, 1, 1, 1, 1, 1,
-0.4396868, -0.4350692, -1.540084, 1, 1, 1, 1, 1,
-0.4366345, 0.4672447, -1.681911, 1, 1, 1, 1, 1,
-0.4282106, 0.3222117, -1.781213, 1, 1, 1, 1, 1,
-0.4224125, -1.349767, -2.286158, 1, 1, 1, 1, 1,
-0.4203545, -0.1597115, -1.885026, 1, 1, 1, 1, 1,
-0.4164224, -1.831655, -0.758216, 1, 1, 1, 1, 1,
-0.4143499, 0.7647902, -0.9537385, 1, 1, 1, 1, 1,
-0.4143395, 0.4956071, -1.383921, 0, 0, 1, 1, 1,
-0.4142408, 0.2880885, -0.7686024, 1, 0, 0, 1, 1,
-0.4127554, 0.4509498, 2.000271, 1, 0, 0, 1, 1,
-0.4112282, 0.9244035, -1.271212, 1, 0, 0, 1, 1,
-0.4076871, -0.02979784, -3.064509, 1, 0, 0, 1, 1,
-0.4020599, 0.8284644, -1.714112, 1, 0, 0, 1, 1,
-0.3947175, -1.104434, -2.451284, 0, 0, 0, 1, 1,
-0.3922658, -1.09868, -2.272916, 0, 0, 0, 1, 1,
-0.3892858, -0.8092408, -3.030424, 0, 0, 0, 1, 1,
-0.386907, -0.6571088, -2.232737, 0, 0, 0, 1, 1,
-0.3868414, 1.606721, -0.3927681, 0, 0, 0, 1, 1,
-0.3863166, -0.5564169, -2.513061, 0, 0, 0, 1, 1,
-0.3862407, 1.210494, 0.2212724, 0, 0, 0, 1, 1,
-0.3862265, 0.4260485, -0.9873258, 1, 1, 1, 1, 1,
-0.3777772, 1.070876, -0.6614103, 1, 1, 1, 1, 1,
-0.3768671, -0.8254724, -1.907403, 1, 1, 1, 1, 1,
-0.3748812, 1.249626, -0.5485151, 1, 1, 1, 1, 1,
-0.372947, -1.390156, -2.318619, 1, 1, 1, 1, 1,
-0.3702302, 0.02470067, -1.857689, 1, 1, 1, 1, 1,
-0.365007, 1.681688, -0.7238985, 1, 1, 1, 1, 1,
-0.3615697, -0.5724563, -1.356825, 1, 1, 1, 1, 1,
-0.3615625, 2.003111, -0.9175658, 1, 1, 1, 1, 1,
-0.3576761, 0.8786083, 1.094236, 1, 1, 1, 1, 1,
-0.3518053, -1.510336, -3.908436, 1, 1, 1, 1, 1,
-0.3497742, -0.07226354, -2.236917, 1, 1, 1, 1, 1,
-0.3435915, -0.5848691, -2.133779, 1, 1, 1, 1, 1,
-0.3411292, 0.06259286, -0.0349697, 1, 1, 1, 1, 1,
-0.3372785, 0.8266549, -0.9439739, 1, 1, 1, 1, 1,
-0.3324985, 0.677357, -1.133666, 0, 0, 1, 1, 1,
-0.3314239, -1.070843, -3.62065, 1, 0, 0, 1, 1,
-0.3296375, 0.04081732, -2.244366, 1, 0, 0, 1, 1,
-0.3291496, 0.337341, -1.215937, 1, 0, 0, 1, 1,
-0.3289831, -0.5757208, -1.724481, 1, 0, 0, 1, 1,
-0.3267272, 1.131773, 1.539111, 1, 0, 0, 1, 1,
-0.3159243, -0.6298637, -3.409513, 0, 0, 0, 1, 1,
-0.3150586, 0.784547, 1.084077, 0, 0, 0, 1, 1,
-0.2998103, -0.9976274, -2.138234, 0, 0, 0, 1, 1,
-0.292643, 0.08849506, 0.3023994, 0, 0, 0, 1, 1,
-0.2908071, 0.3308029, -0.9889415, 0, 0, 0, 1, 1,
-0.2884778, 0.3639577, -0.4023678, 0, 0, 0, 1, 1,
-0.2884405, 0.09807319, -1.296865, 0, 0, 0, 1, 1,
-0.2856675, 0.8843355, -0.9458779, 1, 1, 1, 1, 1,
-0.2846991, -0.9425212, -2.074919, 1, 1, 1, 1, 1,
-0.2837098, 1.158534, 0.2709398, 1, 1, 1, 1, 1,
-0.2794933, 0.8697646, 0.5695028, 1, 1, 1, 1, 1,
-0.2782681, 0.6742944, 0.5786886, 1, 1, 1, 1, 1,
-0.2723278, -0.6994975, -1.488338, 1, 1, 1, 1, 1,
-0.2699427, 0.2737299, 1.299157, 1, 1, 1, 1, 1,
-0.2642946, -1.184766, -4.181854, 1, 1, 1, 1, 1,
-0.2636386, -0.2912487, -2.329886, 1, 1, 1, 1, 1,
-0.261655, 0.1024839, -0.8542079, 1, 1, 1, 1, 1,
-0.26162, 0.2691026, -1.003737, 1, 1, 1, 1, 1,
-0.256531, 0.3514257, -0.1978459, 1, 1, 1, 1, 1,
-0.2427935, -0.6191837, -2.169341, 1, 1, 1, 1, 1,
-0.2398737, 1.414877, -0.9503375, 1, 1, 1, 1, 1,
-0.2374958, -1.146176, -2.861246, 1, 1, 1, 1, 1,
-0.2366813, 1.164528, 0.2567319, 0, 0, 1, 1, 1,
-0.2361082, 0.82988, -0.7373505, 1, 0, 0, 1, 1,
-0.2355968, 0.03154324, -0.3153094, 1, 0, 0, 1, 1,
-0.2338857, 0.7528991, -0.5163659, 1, 0, 0, 1, 1,
-0.2305107, -2.171215, -1.782989, 1, 0, 0, 1, 1,
-0.2282938, 0.6000036, -1.900188, 1, 0, 0, 1, 1,
-0.2267181, 0.5895206, 0.2269473, 0, 0, 0, 1, 1,
-0.2209702, -1.168825, -3.339567, 0, 0, 0, 1, 1,
-0.2191412, 0.8560968, -0.6912926, 0, 0, 0, 1, 1,
-0.2111199, -0.3986898, -4.118387, 0, 0, 0, 1, 1,
-0.207165, -0.8404225, -1.765006, 0, 0, 0, 1, 1,
-0.2070816, 1.620951, -1.358408, 0, 0, 0, 1, 1,
-0.2030086, 0.1611364, -3.257899, 0, 0, 0, 1, 1,
-0.1999175, -0.416489, -1.902402, 1, 1, 1, 1, 1,
-0.1906877, -0.4524407, -2.546457, 1, 1, 1, 1, 1,
-0.1876468, -0.4782814, -0.7216526, 1, 1, 1, 1, 1,
-0.1829491, 1.562123, 0.9547296, 1, 1, 1, 1, 1,
-0.1812364, -0.4288951, -0.08745113, 1, 1, 1, 1, 1,
-0.1789563, -0.8786801, -2.884322, 1, 1, 1, 1, 1,
-0.177073, 0.2210022, 0.07670391, 1, 1, 1, 1, 1,
-0.1769415, -2.400913, -3.345761, 1, 1, 1, 1, 1,
-0.1762242, 0.8670177, -1.261338, 1, 1, 1, 1, 1,
-0.1756296, 0.6392911, -0.9298798, 1, 1, 1, 1, 1,
-0.1731667, -1.525727, -4.202549, 1, 1, 1, 1, 1,
-0.1712257, 1.848913, -0.3285232, 1, 1, 1, 1, 1,
-0.1692458, 0.2572085, -1.623065, 1, 1, 1, 1, 1,
-0.1692113, -0.5436291, -3.66271, 1, 1, 1, 1, 1,
-0.1666316, -1.51576, -3.116204, 1, 1, 1, 1, 1,
-0.1663132, -0.3434016, -2.428889, 0, 0, 1, 1, 1,
-0.1635585, -0.09493301, -3.71135, 1, 0, 0, 1, 1,
-0.1573945, 0.6472582, 1.474778, 1, 0, 0, 1, 1,
-0.1568705, -1.508858, -2.86447, 1, 0, 0, 1, 1,
-0.1557065, -0.1787261, -3.392928, 1, 0, 0, 1, 1,
-0.1530639, -0.2064421, -5.066803, 1, 0, 0, 1, 1,
-0.1480209, -0.4511057, -4.128368, 0, 0, 0, 1, 1,
-0.1464091, -1.123484, -5.032245, 0, 0, 0, 1, 1,
-0.1454241, 1.186577, 0.04074322, 0, 0, 0, 1, 1,
-0.143115, 0.6591241, 0.7922003, 0, 0, 0, 1, 1,
-0.1427861, -0.7805943, -2.96014, 0, 0, 0, 1, 1,
-0.1427339, 1.460002, -0.2250078, 0, 0, 0, 1, 1,
-0.1388577, 0.1755039, -0.7624368, 0, 0, 0, 1, 1,
-0.1361653, -1.719442, -2.020644, 1, 1, 1, 1, 1,
-0.1354863, 0.5718916, -0.9252908, 1, 1, 1, 1, 1,
-0.1353309, -0.3538572, -2.309686, 1, 1, 1, 1, 1,
-0.1340427, -0.8192418, -3.683644, 1, 1, 1, 1, 1,
-0.130812, 0.08828581, -2.00663, 1, 1, 1, 1, 1,
-0.1276868, 0.1048667, -0.8953593, 1, 1, 1, 1, 1,
-0.1272111, 0.9235035, 0.8349658, 1, 1, 1, 1, 1,
-0.1215583, -0.541473, -3.022442, 1, 1, 1, 1, 1,
-0.1215105, -0.5706894, -2.353441, 1, 1, 1, 1, 1,
-0.1183555, 1.18238, 0.09887997, 1, 1, 1, 1, 1,
-0.1078002, -0.01687436, -1.353401, 1, 1, 1, 1, 1,
-0.1070198, -0.8108551, -3.44104, 1, 1, 1, 1, 1,
-0.1020117, 2.315837, -0.9402709, 1, 1, 1, 1, 1,
-0.09447732, -0.22899, -3.039745, 1, 1, 1, 1, 1,
-0.09307957, -0.01091595, -1.314683, 1, 1, 1, 1, 1,
-0.08864666, 1.47373, 0.8660124, 0, 0, 1, 1, 1,
-0.08691677, 1.445824, -2.190684, 1, 0, 0, 1, 1,
-0.08327137, -1.115239, -1.480633, 1, 0, 0, 1, 1,
-0.08172446, 1.935427, -1.034159, 1, 0, 0, 1, 1,
-0.07916112, 0.1374025, 1.44435, 1, 0, 0, 1, 1,
-0.07816811, 0.6345549, 0.6342639, 1, 0, 0, 1, 1,
-0.07715148, -0.3053922, -2.454184, 0, 0, 0, 1, 1,
-0.0733954, 0.3892436, 1.224412, 0, 0, 0, 1, 1,
-0.07126366, -0.08494234, -2.934249, 0, 0, 0, 1, 1,
-0.06929571, 0.5807671, 0.6573811, 0, 0, 0, 1, 1,
-0.06638927, -0.400244, -3.17397, 0, 0, 0, 1, 1,
-0.06098303, -0.4163528, -4.530541, 0, 0, 0, 1, 1,
-0.0592059, -0.4733298, -3.503874, 0, 0, 0, 1, 1,
-0.05863164, -0.2687643, -4.773838, 1, 1, 1, 1, 1,
-0.053594, 0.6543382, 0.2545529, 1, 1, 1, 1, 1,
-0.05358528, 0.1768719, 1.146909, 1, 1, 1, 1, 1,
-0.05125961, -0.797298, -4.493854, 1, 1, 1, 1, 1,
-0.05039012, 1.59577, -0.4088244, 1, 1, 1, 1, 1,
-0.04551202, -1.06678, -3.662794, 1, 1, 1, 1, 1,
-0.04325449, -0.7370737, -3.821377, 1, 1, 1, 1, 1,
-0.04299266, 0.3150181, -0.3117167, 1, 1, 1, 1, 1,
-0.04172566, -0.5930273, -3.43448, 1, 1, 1, 1, 1,
-0.03997887, 0.5956973, -1.045034, 1, 1, 1, 1, 1,
-0.03918625, -0.02722485, -1.545048, 1, 1, 1, 1, 1,
-0.03902525, -1.667752, -3.637303, 1, 1, 1, 1, 1,
-0.03497816, -0.4965855, -3.076101, 1, 1, 1, 1, 1,
-0.03126701, 0.1001464, -0.9958495, 1, 1, 1, 1, 1,
-0.02246883, 1.031922, 1.175834, 1, 1, 1, 1, 1,
-0.01992557, 1.869038, -0.5897054, 0, 0, 1, 1, 1,
-0.01800052, 1.671044, -0.6658268, 1, 0, 0, 1, 1,
-0.007549657, -0.926505, -3.27292, 1, 0, 0, 1, 1,
-0.006157197, -0.4584053, -3.866656, 1, 0, 0, 1, 1,
-0.005770192, 0.9044415, 1.398067, 1, 0, 0, 1, 1,
-0.005724058, -1.462175, -0.6104234, 1, 0, 0, 1, 1,
-0.005659683, 1.532078, -1.039071, 0, 0, 0, 1, 1,
-0.0004918181, 0.7081345, -0.3838413, 0, 0, 0, 1, 1,
0.003727556, 1.103792, 0.8784367, 0, 0, 0, 1, 1,
0.006349663, -0.6722023, 5.206773, 0, 0, 0, 1, 1,
0.008413089, -0.2250045, 3.569138, 0, 0, 0, 1, 1,
0.01527986, 1.094922, -0.8042114, 0, 0, 0, 1, 1,
0.01720048, -1.204877, 3.62623, 0, 0, 0, 1, 1,
0.01799887, -0.1343786, 1.674886, 1, 1, 1, 1, 1,
0.02270017, -0.5515859, 3.595647, 1, 1, 1, 1, 1,
0.0234919, -0.1741005, 2.106517, 1, 1, 1, 1, 1,
0.02354136, 1.288373, -2.647951, 1, 1, 1, 1, 1,
0.0308149, -0.108758, 0.708647, 1, 1, 1, 1, 1,
0.03387332, -0.300409, 1.103436, 1, 1, 1, 1, 1,
0.03392461, 0.8061131, -0.8426514, 1, 1, 1, 1, 1,
0.03403183, 0.5102485, -3.07302, 1, 1, 1, 1, 1,
0.03483164, -1.624891, 1.83788, 1, 1, 1, 1, 1,
0.04811468, 0.1638298, -1.37829, 1, 1, 1, 1, 1,
0.04909885, 0.9418459, -1.987902, 1, 1, 1, 1, 1,
0.05354664, 0.9912272, -0.1895368, 1, 1, 1, 1, 1,
0.05380659, -0.1037517, 3.054791, 1, 1, 1, 1, 1,
0.05686546, -0.1203424, 3.803781, 1, 1, 1, 1, 1,
0.05732052, 0.2018531, 0.9396577, 1, 1, 1, 1, 1,
0.05736728, 0.540239, 0.2216213, 0, 0, 1, 1, 1,
0.0575166, -1.607462, 2.478207, 1, 0, 0, 1, 1,
0.06381345, -0.6814217, 3.047923, 1, 0, 0, 1, 1,
0.06441058, -1.301708, 2.021037, 1, 0, 0, 1, 1,
0.06583789, 0.6679244, -1.07921, 1, 0, 0, 1, 1,
0.06796164, 0.06664524, 0.1740291, 1, 0, 0, 1, 1,
0.06883997, 0.4577118, -0.6922399, 0, 0, 0, 1, 1,
0.06950738, 0.2361574, 0.2149358, 0, 0, 0, 1, 1,
0.07095651, -0.2065324, 3.736151, 0, 0, 0, 1, 1,
0.07715639, 0.3364589, 0.2805621, 0, 0, 0, 1, 1,
0.07998076, 0.3979741, 0.6902121, 0, 0, 0, 1, 1,
0.08474876, -0.3323986, 2.630545, 0, 0, 0, 1, 1,
0.08781444, -0.5774151, 3.550902, 0, 0, 0, 1, 1,
0.09108049, -1.533823, 2.951172, 1, 1, 1, 1, 1,
0.09884773, -0.5824533, 3.402299, 1, 1, 1, 1, 1,
0.1079821, 1.317548, -0.3814683, 1, 1, 1, 1, 1,
0.1156484, -0.3484089, 3.976529, 1, 1, 1, 1, 1,
0.1163727, 0.6282052, 1.388044, 1, 1, 1, 1, 1,
0.1250379, 0.04462402, 3.860318, 1, 1, 1, 1, 1,
0.1252864, 0.2411975, 1.424824, 1, 1, 1, 1, 1,
0.1277679, 0.1331176, 2.150055, 1, 1, 1, 1, 1,
0.1295308, 0.3785498, -1.276359, 1, 1, 1, 1, 1,
0.1351715, -2.033539, 3.562977, 1, 1, 1, 1, 1,
0.1363157, 0.7529605, -0.2958829, 1, 1, 1, 1, 1,
0.1377186, 0.186718, 1.671438, 1, 1, 1, 1, 1,
0.1409191, -1.94733, 4.222837, 1, 1, 1, 1, 1,
0.1414287, -1.220475, 3.817586, 1, 1, 1, 1, 1,
0.1423068, -0.5750056, 3.529213, 1, 1, 1, 1, 1,
0.1429754, 0.5410048, 0.6173749, 0, 0, 1, 1, 1,
0.1472862, 0.2022187, -0.4818667, 1, 0, 0, 1, 1,
0.1495512, -2.35145, 3.050773, 1, 0, 0, 1, 1,
0.1502611, -0.7668284, 2.130843, 1, 0, 0, 1, 1,
0.1503375, 0.7786167, -2.072293, 1, 0, 0, 1, 1,
0.1506441, -0.1083226, 0.6083961, 1, 0, 0, 1, 1,
0.1516277, 1.115349, 2.676407, 0, 0, 0, 1, 1,
0.1538272, 1.061446, -0.4252138, 0, 0, 0, 1, 1,
0.1612229, -0.1641255, 3.412207, 0, 0, 0, 1, 1,
0.161551, 2.058034, -0.6864956, 0, 0, 0, 1, 1,
0.1637075, 0.01546207, -0.482025, 0, 0, 0, 1, 1,
0.1651383, -2.16372, 3.85736, 0, 0, 0, 1, 1,
0.1660523, -1.498145, 2.489339, 0, 0, 0, 1, 1,
0.1679786, -1.556134, 1.916068, 1, 1, 1, 1, 1,
0.1713308, 0.5679806, 1.432353, 1, 1, 1, 1, 1,
0.1715931, 0.4795799, -2.323305, 1, 1, 1, 1, 1,
0.1716819, -0.3749667, 2.425177, 1, 1, 1, 1, 1,
0.1761058, -0.7754672, 1.345911, 1, 1, 1, 1, 1,
0.1769177, 1.269761, -1.232542, 1, 1, 1, 1, 1,
0.1773851, -1.781898, 3.117481, 1, 1, 1, 1, 1,
0.1810532, 0.1599473, 1.572489, 1, 1, 1, 1, 1,
0.1814213, -0.1649246, 2.399929, 1, 1, 1, 1, 1,
0.183984, 1.719731, 0.8648918, 1, 1, 1, 1, 1,
0.1853344, 0.04954056, 0.345952, 1, 1, 1, 1, 1,
0.1874859, -0.01064304, 2.165301, 1, 1, 1, 1, 1,
0.1889314, -0.1826889, 3.321827, 1, 1, 1, 1, 1,
0.189544, -1.058479, 2.99464, 1, 1, 1, 1, 1,
0.1930646, -0.01636313, 0.06537596, 1, 1, 1, 1, 1,
0.1968835, 0.9756975, 0.4798129, 0, 0, 1, 1, 1,
0.1970039, -1.131611, 3.172013, 1, 0, 0, 1, 1,
0.2000441, 2.042282, -1.103964, 1, 0, 0, 1, 1,
0.200209, -0.9434632, 2.333129, 1, 0, 0, 1, 1,
0.2018246, -0.8677026, 4.897638, 1, 0, 0, 1, 1,
0.2067905, -1.587746, 2.339676, 1, 0, 0, 1, 1,
0.2070003, -1.046935, 4.226812, 0, 0, 0, 1, 1,
0.2076973, 0.3386382, 0.7544187, 0, 0, 0, 1, 1,
0.2099913, -0.1662992, 1.750139, 0, 0, 0, 1, 1,
0.2157508, -1.154317, 2.852359, 0, 0, 0, 1, 1,
0.2168964, 0.484363, 0.4978827, 0, 0, 0, 1, 1,
0.217048, -0.5592877, 1.540149, 0, 0, 0, 1, 1,
0.2208016, 0.1960396, 2.51029, 0, 0, 0, 1, 1,
0.2210656, 0.2950542, 1.296052, 1, 1, 1, 1, 1,
0.2239195, 1.067938, 0.3183744, 1, 1, 1, 1, 1,
0.2257214, -0.06229019, 2.792392, 1, 1, 1, 1, 1,
0.2257347, 0.8516903, -0.9426377, 1, 1, 1, 1, 1,
0.2284865, 0.1548181, 0.48419, 1, 1, 1, 1, 1,
0.2286709, 0.3428575, -0.3688437, 1, 1, 1, 1, 1,
0.2296778, 0.4282655, -0.4403814, 1, 1, 1, 1, 1,
0.2317781, -0.5642909, 1.254876, 1, 1, 1, 1, 1,
0.233206, -0.3280966, 3.915185, 1, 1, 1, 1, 1,
0.2402509, -1.775027, 2.737222, 1, 1, 1, 1, 1,
0.2417222, 0.1408, 2.132605, 1, 1, 1, 1, 1,
0.2424133, 0.8787138, 1.18288, 1, 1, 1, 1, 1,
0.2474694, 0.9187762, -0.03944182, 1, 1, 1, 1, 1,
0.2488598, 0.8905926, -0.9275607, 1, 1, 1, 1, 1,
0.2513258, 0.2800197, -0.1791234, 1, 1, 1, 1, 1,
0.2518828, 0.1390555, 0.3674361, 0, 0, 1, 1, 1,
0.2536473, -0.04928389, 0.7050618, 1, 0, 0, 1, 1,
0.2557905, -1.665819, 3.607368, 1, 0, 0, 1, 1,
0.2562237, 0.2557271, -0.05586981, 1, 0, 0, 1, 1,
0.2565552, -1.888437, 3.994646, 1, 0, 0, 1, 1,
0.2583533, -1.487003, 2.999654, 1, 0, 0, 1, 1,
0.2592451, -0.002215454, 2.602457, 0, 0, 0, 1, 1,
0.2599143, 0.02705664, 0.7372584, 0, 0, 0, 1, 1,
0.2601705, -2.731657, 2.462439, 0, 0, 0, 1, 1,
0.2601807, -0.3583993, 4.387682, 0, 0, 0, 1, 1,
0.2648415, -0.2312963, 1.487348, 0, 0, 0, 1, 1,
0.2723421, 1.572825, -1.752473, 0, 0, 0, 1, 1,
0.2725874, -0.01247462, 3.661624, 0, 0, 0, 1, 1,
0.2893954, 0.5707091, 0.6796747, 1, 1, 1, 1, 1,
0.2906475, -0.4454645, 2.187996, 1, 1, 1, 1, 1,
0.2913057, -0.5787635, 1.780576, 1, 1, 1, 1, 1,
0.296822, -1.07811, 4.042712, 1, 1, 1, 1, 1,
0.2978224, 1.840484, 0.2450286, 1, 1, 1, 1, 1,
0.3022242, 0.3149224, 1.523992, 1, 1, 1, 1, 1,
0.3047485, 1.311807, -0.3947906, 1, 1, 1, 1, 1,
0.3050998, 0.2884454, 0.7756171, 1, 1, 1, 1, 1,
0.3069133, 0.01538475, 0.2097088, 1, 1, 1, 1, 1,
0.3209668, 0.9843065, 0.8101867, 1, 1, 1, 1, 1,
0.3212679, -1.524752, 3.437488, 1, 1, 1, 1, 1,
0.3221255, 0.1475479, 2.343831, 1, 1, 1, 1, 1,
0.3240469, -2.694879, 3.274644, 1, 1, 1, 1, 1,
0.3247812, 1.806334, 0.1305106, 1, 1, 1, 1, 1,
0.3250076, -0.9848824, 3.868191, 1, 1, 1, 1, 1,
0.3264346, 0.2607493, 0.8766147, 0, 0, 1, 1, 1,
0.3267949, -1.874108, 2.241425, 1, 0, 0, 1, 1,
0.3332693, 1.123676, -0.7689622, 1, 0, 0, 1, 1,
0.3375085, 0.4281909, 0.259027, 1, 0, 0, 1, 1,
0.3426848, -1.126551, 2.422684, 1, 0, 0, 1, 1,
0.3429093, 0.5606039, 1.072901, 1, 0, 0, 1, 1,
0.3462188, -0.9171342, 3.017289, 0, 0, 0, 1, 1,
0.3488327, 0.1790021, 0.2884826, 0, 0, 0, 1, 1,
0.3489965, -0.5152876, 2.065677, 0, 0, 0, 1, 1,
0.3531701, -0.3478803, 4.530227, 0, 0, 0, 1, 1,
0.3600191, -1.183336, 1.657902, 0, 0, 0, 1, 1,
0.361805, -1.590717, 2.26286, 0, 0, 0, 1, 1,
0.3625348, 0.02735749, 2.17, 0, 0, 0, 1, 1,
0.3626155, 0.6305174, -1.588236, 1, 1, 1, 1, 1,
0.3691567, -1.757897, 4.367722, 1, 1, 1, 1, 1,
0.3725152, 0.03440154, 1.268993, 1, 1, 1, 1, 1,
0.3734575, -0.6268444, 2.791553, 1, 1, 1, 1, 1,
0.3807499, -1.517352, 2.771942, 1, 1, 1, 1, 1,
0.3819505, 0.7574828, 1.910164, 1, 1, 1, 1, 1,
0.3852371, -1.903454, 2.263402, 1, 1, 1, 1, 1,
0.3879453, -1.672557, 3.997967, 1, 1, 1, 1, 1,
0.3879687, -0.4989939, 3.255496, 1, 1, 1, 1, 1,
0.3948733, -1.059327, 0.9866214, 1, 1, 1, 1, 1,
0.4107292, -0.04537749, 2.042193, 1, 1, 1, 1, 1,
0.4141142, -0.2217689, 2.42425, 1, 1, 1, 1, 1,
0.4175581, 0.8787651, -0.2779514, 1, 1, 1, 1, 1,
0.4198748, 0.7035328, 0.6327981, 1, 1, 1, 1, 1,
0.4257762, -0.4742078, 0.8745992, 1, 1, 1, 1, 1,
0.4262783, 0.3785608, 1.482996, 0, 0, 1, 1, 1,
0.4291033, 0.156227, 0.9642737, 1, 0, 0, 1, 1,
0.4383059, -0.3395986, 2.79644, 1, 0, 0, 1, 1,
0.4386231, 0.723856, 1.406775, 1, 0, 0, 1, 1,
0.4403624, 1.089931, -0.4445298, 1, 0, 0, 1, 1,
0.4414364, -2.105924, 2.565567, 1, 0, 0, 1, 1,
0.4416856, -1.224522, 3.135715, 0, 0, 0, 1, 1,
0.4442885, 0.5512198, 0.6206127, 0, 0, 0, 1, 1,
0.4506818, -0.264512, 1.498457, 0, 0, 0, 1, 1,
0.4615756, 0.6208261, 1.698202, 0, 0, 0, 1, 1,
0.4623677, 0.2620839, 1.310945, 0, 0, 0, 1, 1,
0.4636942, 1.855513, -0.3848046, 0, 0, 0, 1, 1,
0.4646904, -1.128712, 1.68991, 0, 0, 0, 1, 1,
0.4652998, 0.886069, 2.324313, 1, 1, 1, 1, 1,
0.4679983, 0.4023861, 0.5928762, 1, 1, 1, 1, 1,
0.4684637, 0.1257559, 0.58452, 1, 1, 1, 1, 1,
0.4686055, -2.118773, 3.35666, 1, 1, 1, 1, 1,
0.4693672, -0.08831962, 1.357291, 1, 1, 1, 1, 1,
0.4710019, -1.427645, 3.373618, 1, 1, 1, 1, 1,
0.4716342, 0.3943501, 1.32281, 1, 1, 1, 1, 1,
0.4717394, 0.1483637, 0.4608283, 1, 1, 1, 1, 1,
0.4717767, -0.4755976, 2.337823, 1, 1, 1, 1, 1,
0.4728914, 2.360894, 0.5271601, 1, 1, 1, 1, 1,
0.4735841, -1.309963, 3.320812, 1, 1, 1, 1, 1,
0.4774306, -1.162238, 2.415732, 1, 1, 1, 1, 1,
0.4781886, 0.347353, -0.3183874, 1, 1, 1, 1, 1,
0.482577, 1.235714, -0.6147224, 1, 1, 1, 1, 1,
0.4837137, -0.5369323, 2.277832, 1, 1, 1, 1, 1,
0.4862688, 0.4918758, 1.589562, 0, 0, 1, 1, 1,
0.4877874, 0.08303469, 0.8467057, 1, 0, 0, 1, 1,
0.4903034, 2.463647, 1.638843, 1, 0, 0, 1, 1,
0.4935629, -0.1191991, 1.160903, 1, 0, 0, 1, 1,
0.4980565, 1.835971, 1.760572, 1, 0, 0, 1, 1,
0.4982597, 0.9831995, -0.516035, 1, 0, 0, 1, 1,
0.5007001, -0.3466995, 3.244357, 0, 0, 0, 1, 1,
0.5072801, 0.4211602, 1.173182, 0, 0, 0, 1, 1,
0.5114616, 1.154958, 1.489485, 0, 0, 0, 1, 1,
0.5146422, 1.705111, -0.04637339, 0, 0, 0, 1, 1,
0.5164343, 0.5561342, 0.9353504, 0, 0, 0, 1, 1,
0.518218, 1.7663, -0.2230248, 0, 0, 0, 1, 1,
0.5220668, -0.8096396, 3.305861, 0, 0, 0, 1, 1,
0.5227699, 0.7878658, 2.950766, 1, 1, 1, 1, 1,
0.5272893, 0.2659817, 1.455678, 1, 1, 1, 1, 1,
0.5328997, -0.4152531, 4.241517, 1, 1, 1, 1, 1,
0.5343487, -1.948045, 2.357949, 1, 1, 1, 1, 1,
0.5365661, 0.4855951, 1.661466, 1, 1, 1, 1, 1,
0.5410435, 0.3586776, 1.669845, 1, 1, 1, 1, 1,
0.5424123, -0.7738729, 1.694479, 1, 1, 1, 1, 1,
0.5426679, -0.01347706, 1.068561, 1, 1, 1, 1, 1,
0.5435002, -0.9421719, 2.559206, 1, 1, 1, 1, 1,
0.5515352, 0.3356196, 0.6952746, 1, 1, 1, 1, 1,
0.5517771, 0.2168738, 3.013505, 1, 1, 1, 1, 1,
0.5524463, -1.09264, 2.0962, 1, 1, 1, 1, 1,
0.5556276, 0.07129734, 1.187135, 1, 1, 1, 1, 1,
0.5559675, -0.4725054, 2.593675, 1, 1, 1, 1, 1,
0.5561152, 1.16782, 1.021392, 1, 1, 1, 1, 1,
0.5587744, 0.6160184, 2.919549, 0, 0, 1, 1, 1,
0.5647014, 0.9511768, 2.519966, 1, 0, 0, 1, 1,
0.566345, -1.023813, 3.630439, 1, 0, 0, 1, 1,
0.5682733, -1.172933, 2.655589, 1, 0, 0, 1, 1,
0.5721167, 2.566553, 2.388482, 1, 0, 0, 1, 1,
0.5729022, -0.3728169, 1.661473, 1, 0, 0, 1, 1,
0.5756393, 0.7570865, 0.3662009, 0, 0, 0, 1, 1,
0.5765806, 1.202353, 1.975884, 0, 0, 0, 1, 1,
0.5769558, 0.6600065, -0.6436949, 0, 0, 0, 1, 1,
0.5778161, 0.3360771, 0.7284012, 0, 0, 0, 1, 1,
0.582421, 1.555261, -0.5476121, 0, 0, 0, 1, 1,
0.583347, 0.3240863, 2.729214, 0, 0, 0, 1, 1,
0.5841971, -0.495956, 1.462405, 0, 0, 0, 1, 1,
0.585651, -0.9897448, 1.596914, 1, 1, 1, 1, 1,
0.588771, 1.687667, 0.863972, 1, 1, 1, 1, 1,
0.5907613, -0.06834418, 0.9532889, 1, 1, 1, 1, 1,
0.5910259, 1.108823, 1.17307, 1, 1, 1, 1, 1,
0.5913866, 0.9206064, 1.126679, 1, 1, 1, 1, 1,
0.5980399, 0.5016392, 2.827628, 1, 1, 1, 1, 1,
0.6001039, -0.308518, 1.989929, 1, 1, 1, 1, 1,
0.6014184, -1.041418, 2.764207, 1, 1, 1, 1, 1,
0.6058761, 0.9203449, 0.3928128, 1, 1, 1, 1, 1,
0.6155536, 1.148906, 0.5121764, 1, 1, 1, 1, 1,
0.6199363, 0.1261807, -0.434234, 1, 1, 1, 1, 1,
0.6298009, -2.415262, 2.164979, 1, 1, 1, 1, 1,
0.6300175, 0.9482142, 0.525777, 1, 1, 1, 1, 1,
0.6311512, 0.5631804, 0.7299072, 1, 1, 1, 1, 1,
0.6324163, -1.08308, 3.275472, 1, 1, 1, 1, 1,
0.637147, 0.08384033, -0.4900823, 0, 0, 1, 1, 1,
0.6447657, 0.5038135, 0.8178365, 1, 0, 0, 1, 1,
0.6448343, -0.4205623, 2.208489, 1, 0, 0, 1, 1,
0.6467987, -2.134478, 1.164314, 1, 0, 0, 1, 1,
0.6473781, -0.0343704, 1.56746, 1, 0, 0, 1, 1,
0.6476579, -0.1193086, 1.113759, 1, 0, 0, 1, 1,
0.651766, 0.8916909, 1.093939, 0, 0, 0, 1, 1,
0.65702, -0.04349526, 1.084848, 0, 0, 0, 1, 1,
0.6625314, -1.638345, 3.437898, 0, 0, 0, 1, 1,
0.6641599, 0.2252492, 0.3450539, 0, 0, 0, 1, 1,
0.671265, -0.3856485, 1.913404, 0, 0, 0, 1, 1,
0.6722368, -1.73151, 2.317058, 0, 0, 0, 1, 1,
0.6745546, -1.084899, 2.455909, 0, 0, 0, 1, 1,
0.6752394, 1.523287, 0.07987137, 1, 1, 1, 1, 1,
0.6816509, 1.605872, 0.1104538, 1, 1, 1, 1, 1,
0.681846, -1.244166, 2.859215, 1, 1, 1, 1, 1,
0.6822522, 0.05172254, 1.172072, 1, 1, 1, 1, 1,
0.6823923, 0.2484661, 2.136853, 1, 1, 1, 1, 1,
0.6841697, 0.01646106, 2.384133, 1, 1, 1, 1, 1,
0.69057, -0.08869734, 1.508535, 1, 1, 1, 1, 1,
0.695516, 1.402433, 1.574133, 1, 1, 1, 1, 1,
0.6961793, -0.8858989, 3.914424, 1, 1, 1, 1, 1,
0.6983591, -0.4157479, 1.25051, 1, 1, 1, 1, 1,
0.7033556, -1.695292, 2.96541, 1, 1, 1, 1, 1,
0.7056664, 1.978787, -0.8648839, 1, 1, 1, 1, 1,
0.7064719, 0.7619857, 1.637001, 1, 1, 1, 1, 1,
0.709774, 1.285935, 1.116285, 1, 1, 1, 1, 1,
0.7130271, 0.1950285, 2.198666, 1, 1, 1, 1, 1,
0.7145867, 2.049488, 0.5407215, 0, 0, 1, 1, 1,
0.7150407, -0.7832542, 3.499694, 1, 0, 0, 1, 1,
0.7188521, -0.03587262, 1.53718, 1, 0, 0, 1, 1,
0.72141, 1.238401, -0.6556808, 1, 0, 0, 1, 1,
0.7238975, 0.09437159, 1.458475, 1, 0, 0, 1, 1,
0.7268703, 0.1815065, 1.264508, 1, 0, 0, 1, 1,
0.7298018, 1.065909, -0.535489, 0, 0, 0, 1, 1,
0.73265, 0.6111421, 1.906542, 0, 0, 0, 1, 1,
0.7469549, 0.7095181, 1.164885, 0, 0, 0, 1, 1,
0.7500716, 0.3436264, 2.278163, 0, 0, 0, 1, 1,
0.7508056, -1.421346, 0.8054454, 0, 0, 0, 1, 1,
0.7514051, 0.1592253, -0.5071355, 0, 0, 0, 1, 1,
0.756095, 1.405483, -0.709935, 0, 0, 0, 1, 1,
0.7602766, -1.297564, 2.602044, 1, 1, 1, 1, 1,
0.7651561, 0.8729777, 2.359943, 1, 1, 1, 1, 1,
0.7658373, 1.30177, 0.368691, 1, 1, 1, 1, 1,
0.7659081, -2.143975, 3.906385, 1, 1, 1, 1, 1,
0.7703722, -0.3174245, 2.967949, 1, 1, 1, 1, 1,
0.7710544, 0.3698886, 0.1700338, 1, 1, 1, 1, 1,
0.775377, -0.7867467, 1.462168, 1, 1, 1, 1, 1,
0.7767951, 0.1033445, 2.296698, 1, 1, 1, 1, 1,
0.7787257, 1.280493, -0.8157919, 1, 1, 1, 1, 1,
0.7794278, -0.670232, 2.176232, 1, 1, 1, 1, 1,
0.7825287, 0.9560336, 0.8033614, 1, 1, 1, 1, 1,
0.7864335, -0.7817311, 3.432666, 1, 1, 1, 1, 1,
0.7888825, -1.219519, 2.906486, 1, 1, 1, 1, 1,
0.790183, 0.04264401, 1.222035, 1, 1, 1, 1, 1,
0.7922414, -0.4341444, 2.13161, 1, 1, 1, 1, 1,
0.7937111, 1.133157, 1.506343, 0, 0, 1, 1, 1,
0.7946749, 0.3272066, 2.129789, 1, 0, 0, 1, 1,
0.7956178, -0.5565563, 1.54924, 1, 0, 0, 1, 1,
0.796544, 1.067208, -0.4195589, 1, 0, 0, 1, 1,
0.8016499, 1.56518, -1.016276, 1, 0, 0, 1, 1,
0.8129064, 2.021159, 1.667848, 1, 0, 0, 1, 1,
0.8166686, -0.04209462, 1.604679, 0, 0, 0, 1, 1,
0.8174666, -0.6098195, 1.788022, 0, 0, 0, 1, 1,
0.8231975, -0.6149319, -0.04919541, 0, 0, 0, 1, 1,
0.8261045, -1.177067, 3.661836, 0, 0, 0, 1, 1,
0.8296175, -0.7942259, 1.759443, 0, 0, 0, 1, 1,
0.8309793, -0.1020299, 1.49621, 0, 0, 0, 1, 1,
0.8333198, 0.4536638, 0.6817409, 0, 0, 0, 1, 1,
0.8337584, 0.8000777, -0.4220501, 1, 1, 1, 1, 1,
0.8418752, -1.430054, 2.040163, 1, 1, 1, 1, 1,
0.8444157, -0.1165362, 3.179741, 1, 1, 1, 1, 1,
0.8467789, -0.0860232, 2.450954, 1, 1, 1, 1, 1,
0.8489594, -0.2122563, 1.459753, 1, 1, 1, 1, 1,
0.8519013, -0.6969538, 3.131841, 1, 1, 1, 1, 1,
0.8557236, 0.5986046, 0.4184482, 1, 1, 1, 1, 1,
0.8594263, 0.9700708, 1.042945, 1, 1, 1, 1, 1,
0.8629075, 1.966547, 2.083251, 1, 1, 1, 1, 1,
0.8656, 1.177683, 0.4023973, 1, 1, 1, 1, 1,
0.8689988, -0.9764748, 2.379119, 1, 1, 1, 1, 1,
0.8712332, 0.5668941, -0.1581161, 1, 1, 1, 1, 1,
0.8750999, 0.01406694, 2.015494, 1, 1, 1, 1, 1,
0.8756123, -1.41917, 2.143025, 1, 1, 1, 1, 1,
0.8772898, -0.4012398, 0.6477912, 1, 1, 1, 1, 1,
0.8792405, -0.7500036, 0.2284633, 0, 0, 1, 1, 1,
0.8837995, -2.133422, 2.611118, 1, 0, 0, 1, 1,
0.8888131, -1.429156, 3.678837, 1, 0, 0, 1, 1,
0.8902343, 0.7859046, 1.407507, 1, 0, 0, 1, 1,
0.8908815, -1.234607, 2.278192, 1, 0, 0, 1, 1,
0.8924524, 1.03647, 1.183624, 1, 0, 0, 1, 1,
0.8929973, -0.4717062, 3.227772, 0, 0, 0, 1, 1,
0.8963907, 0.4868015, 2.03456, 0, 0, 0, 1, 1,
0.8991516, 1.173608, -0.3250013, 0, 0, 0, 1, 1,
0.9015663, 1.63404, 0.4434288, 0, 0, 0, 1, 1,
0.9041629, -1.416156, 2.150277, 0, 0, 0, 1, 1,
0.9068569, -0.8138143, 3.598433, 0, 0, 0, 1, 1,
0.9238018, -0.4925625, 3.259946, 0, 0, 0, 1, 1,
0.9342112, 0.8579337, 1.995242, 1, 1, 1, 1, 1,
0.9358146, 0.8248242, -0.3142904, 1, 1, 1, 1, 1,
0.9382533, 1.625352, 0.7460101, 1, 1, 1, 1, 1,
0.9413481, -0.09774875, 2.755137, 1, 1, 1, 1, 1,
0.9417119, 1.329306, 2.039226, 1, 1, 1, 1, 1,
0.9420524, 1.539686, 0.68177, 1, 1, 1, 1, 1,
0.9459012, 1.159244, 1.36435, 1, 1, 1, 1, 1,
0.9650798, -2.067108, 2.812335, 1, 1, 1, 1, 1,
0.9656106, -0.4385282, 0.997754, 1, 1, 1, 1, 1,
0.9661421, 0.3813013, 0.5380321, 1, 1, 1, 1, 1,
0.9690705, -0.8547279, 3.268416, 1, 1, 1, 1, 1,
0.9699345, -1.744961, 0.9666096, 1, 1, 1, 1, 1,
0.9871684, -0.9991381, 2.990747, 1, 1, 1, 1, 1,
0.988043, -1.804385, 2.373168, 1, 1, 1, 1, 1,
0.9980912, 0.872354, 2.743674, 1, 1, 1, 1, 1,
1.001341, -0.1985993, 1.15094, 0, 0, 1, 1, 1,
1.001441, 1.278967, 0.06066743, 1, 0, 0, 1, 1,
1.002157, -2.503858, 2.792487, 1, 0, 0, 1, 1,
1.006514, 0.5414874, 0.09543256, 1, 0, 0, 1, 1,
1.008149, -0.4788055, 1.470101, 1, 0, 0, 1, 1,
1.008694, -0.4433537, 3.086443, 1, 0, 0, 1, 1,
1.01669, 0.4344863, 0.3737902, 0, 0, 0, 1, 1,
1.018721, 2.440301, 2.168992, 0, 0, 0, 1, 1,
1.019465, -0.04671006, 1.798695, 0, 0, 0, 1, 1,
1.021868, 1.415755, 0.9714212, 0, 0, 0, 1, 1,
1.023611, -1.225409, 2.750829, 0, 0, 0, 1, 1,
1.038877, 2.896515, -1.29937, 0, 0, 0, 1, 1,
1.045833, -0.1138549, -0.5339572, 0, 0, 0, 1, 1,
1.051119, -0.5782797, 2.343729, 1, 1, 1, 1, 1,
1.053648, 0.12876, 1.163047, 1, 1, 1, 1, 1,
1.059696, 1.759267, 1.15103, 1, 1, 1, 1, 1,
1.066242, 0.5388989, 2.446929, 1, 1, 1, 1, 1,
1.06683, 1.224022, 0.3487675, 1, 1, 1, 1, 1,
1.069832, 0.2185095, -0.5196111, 1, 1, 1, 1, 1,
1.072263, -0.9120977, 2.045213, 1, 1, 1, 1, 1,
1.072369, -1.462829, 1.27748, 1, 1, 1, 1, 1,
1.077185, -1.273343, 2.039324, 1, 1, 1, 1, 1,
1.081199, 1.00544, 0.8545778, 1, 1, 1, 1, 1,
1.08336, -1.848987, 5.165543, 1, 1, 1, 1, 1,
1.08572, -0.2569916, 1.293726, 1, 1, 1, 1, 1,
1.092587, -0.2397449, 3.315477, 1, 1, 1, 1, 1,
1.095522, 0.5262914, 1.810831, 1, 1, 1, 1, 1,
1.097403, 0.7128351, 0.2475441, 1, 1, 1, 1, 1,
1.09824, -0.1372422, 3.531337, 0, 0, 1, 1, 1,
1.10162, -1.097018, 1.39041, 1, 0, 0, 1, 1,
1.104501, -0.1487882, 1.876909, 1, 0, 0, 1, 1,
1.107874, -0.3450148, 0.7257656, 1, 0, 0, 1, 1,
1.126408, 0.3212719, -0.2101258, 1, 0, 0, 1, 1,
1.127517, -0.2458126, 2.496199, 1, 0, 0, 1, 1,
1.130406, -0.7135391, 3.683106, 0, 0, 0, 1, 1,
1.139201, 1.14466, 1.211684, 0, 0, 0, 1, 1,
1.139435, -1.088603, 0.6863316, 0, 0, 0, 1, 1,
1.152709, -0.1333072, 2.534274, 0, 0, 0, 1, 1,
1.153551, 0.2034072, 1.347485, 0, 0, 0, 1, 1,
1.167844, 0.0285543, 1.299192, 0, 0, 0, 1, 1,
1.169799, 0.240675, 1.481249, 0, 0, 0, 1, 1,
1.176012, -0.3080625, 0.8908769, 1, 1, 1, 1, 1,
1.180516, 0.2914097, 1.79133, 1, 1, 1, 1, 1,
1.18548, 1.089843, 0.1736717, 1, 1, 1, 1, 1,
1.186244, -1.689597, 3.374942, 1, 1, 1, 1, 1,
1.189528, -0.5882985, 2.734766, 1, 1, 1, 1, 1,
1.195278, -0.5086258, 4.092155, 1, 1, 1, 1, 1,
1.197692, 1.440455, -0.8294987, 1, 1, 1, 1, 1,
1.200212, 0.08845965, 2.328295, 1, 1, 1, 1, 1,
1.206662, -0.6088561, 2.038612, 1, 1, 1, 1, 1,
1.206803, 0.5855823, 1.984284, 1, 1, 1, 1, 1,
1.21015, -0.7180585, 2.456669, 1, 1, 1, 1, 1,
1.213451, -0.1223615, 1.04275, 1, 1, 1, 1, 1,
1.214978, -0.4253669, 1.249283, 1, 1, 1, 1, 1,
1.218716, -1.508422, 3.926488, 1, 1, 1, 1, 1,
1.220454, 0.3793114, 1.139838, 1, 1, 1, 1, 1,
1.224183, -0.7061509, 2.716476, 0, 0, 1, 1, 1,
1.229116, 0.7916313, 0.1055539, 1, 0, 0, 1, 1,
1.231076, -0.2950251, 2.533341, 1, 0, 0, 1, 1,
1.239909, 1.55478, 0.305985, 1, 0, 0, 1, 1,
1.260038, -0.5765368, 2.911376, 1, 0, 0, 1, 1,
1.260138, 0.05464996, 0.87593, 1, 0, 0, 1, 1,
1.260771, 0.2376381, 1.115615, 0, 0, 0, 1, 1,
1.269265, -0.005115856, 0.5191393, 0, 0, 0, 1, 1,
1.270224, 0.2905496, 2.006654, 0, 0, 0, 1, 1,
1.270272, -0.8518896, 0.9933486, 0, 0, 0, 1, 1,
1.279889, 1.352003, 1.457756, 0, 0, 0, 1, 1,
1.280676, 1.776531, 1.061731, 0, 0, 0, 1, 1,
1.280848, 0.6903401, 2.554098, 0, 0, 0, 1, 1,
1.289262, 1.265038, 0.08085319, 1, 1, 1, 1, 1,
1.291013, -0.05357217, 2.532359, 1, 1, 1, 1, 1,
1.292294, -0.5702774, 2.430368, 1, 1, 1, 1, 1,
1.306094, -0.1228323, 1.577405, 1, 1, 1, 1, 1,
1.306939, -0.193051, 2.489191, 1, 1, 1, 1, 1,
1.307928, -2.982099, 3.614588, 1, 1, 1, 1, 1,
1.324899, -0.4310994, 1.75825, 1, 1, 1, 1, 1,
1.327127, -1.828617, 4.825587, 1, 1, 1, 1, 1,
1.333758, 0.1286649, 2.715654, 1, 1, 1, 1, 1,
1.339446, 0.000177701, 1.76811, 1, 1, 1, 1, 1,
1.354167, 0.9303718, 0.05115399, 1, 1, 1, 1, 1,
1.364395, -0.422309, 2.048154, 1, 1, 1, 1, 1,
1.366636, 0.8399074, 1.968757, 1, 1, 1, 1, 1,
1.367599, -0.9232975, 2.514854, 1, 1, 1, 1, 1,
1.368388, 0.3339828, 2.089813, 1, 1, 1, 1, 1,
1.383291, -0.7822909, 1.204783, 0, 0, 1, 1, 1,
1.393945, -0.1853697, 3.604813, 1, 0, 0, 1, 1,
1.396494, 1.913237, -1.003942, 1, 0, 0, 1, 1,
1.412101, -0.7803982, 1.585145, 1, 0, 0, 1, 1,
1.416641, -0.2431014, 0.6965479, 1, 0, 0, 1, 1,
1.435829, 0.3478104, 2.306693, 1, 0, 0, 1, 1,
1.444376, 1.254185, 1.69193, 0, 0, 0, 1, 1,
1.444989, -0.08635722, 2.123977, 0, 0, 0, 1, 1,
1.457123, 0.1982022, 0.4211234, 0, 0, 0, 1, 1,
1.464918, 0.2652947, 1.762132, 0, 0, 0, 1, 1,
1.469596, 0.9998448, -0.0294405, 0, 0, 0, 1, 1,
1.471817, -0.600153, 1.31118, 0, 0, 0, 1, 1,
1.472707, 0.3137578, 0.8525975, 0, 0, 0, 1, 1,
1.478391, -1.697607, 1.396968, 1, 1, 1, 1, 1,
1.482708, -0.403269, 0.8516722, 1, 1, 1, 1, 1,
1.506209, -1.026474, 2.354626, 1, 1, 1, 1, 1,
1.512405, -0.5058214, 3.305789, 1, 1, 1, 1, 1,
1.519179, -0.8477177, 2.679404, 1, 1, 1, 1, 1,
1.538379, 0.2330761, 1.227832, 1, 1, 1, 1, 1,
1.53895, 1.481556, 0.8287181, 1, 1, 1, 1, 1,
1.551631, 0.44478, 3.213819, 1, 1, 1, 1, 1,
1.556054, 0.1861531, 1.124623, 1, 1, 1, 1, 1,
1.562747, 1.006493, 1.428165, 1, 1, 1, 1, 1,
1.57132, -0.5191516, 0.6935385, 1, 1, 1, 1, 1,
1.585985, 0.4361668, 2.71653, 1, 1, 1, 1, 1,
1.619946, 1.06706, 0.7897553, 1, 1, 1, 1, 1,
1.622931, 1.384543, 0.3309183, 1, 1, 1, 1, 1,
1.63213, -0.3250681, 1.194337, 1, 1, 1, 1, 1,
1.638665, -1.154662, 1.211306, 0, 0, 1, 1, 1,
1.642932, 0.20471, 2.142557, 1, 0, 0, 1, 1,
1.66399, 1.003774, 0.6986786, 1, 0, 0, 1, 1,
1.666162, -0.5646333, 2.992585, 1, 0, 0, 1, 1,
1.669799, -0.9262797, 2.48406, 1, 0, 0, 1, 1,
1.676935, -0.2259881, 1.098119, 1, 0, 0, 1, 1,
1.683605, -0.1145186, 1.521089, 0, 0, 0, 1, 1,
1.705411, -1.452466, -0.2462857, 0, 0, 0, 1, 1,
1.705861, 1.024872, 1.717275, 0, 0, 0, 1, 1,
1.713921, 0.7164793, 1.516018, 0, 0, 0, 1, 1,
1.74773, 0.01798825, 1.9306, 0, 0, 0, 1, 1,
1.750048, -0.07712658, 0.2961544, 0, 0, 0, 1, 1,
1.759219, 1.475699, 1.964894, 0, 0, 0, 1, 1,
1.760195, 0.8884786, 0.9274301, 1, 1, 1, 1, 1,
1.77686, 1.400892, -0.6462029, 1, 1, 1, 1, 1,
1.830728, 0.1214217, 1.833246, 1, 1, 1, 1, 1,
1.845243, -0.2537646, 1.413294, 1, 1, 1, 1, 1,
1.8544, -0.5245199, 1.437662, 1, 1, 1, 1, 1,
1.886259, 1.011925, 1.989979, 1, 1, 1, 1, 1,
1.899118, -1.51192, 2.606767, 1, 1, 1, 1, 1,
1.909858, -0.07795738, 1.946611, 1, 1, 1, 1, 1,
1.926279, -0.4703744, 2.86184, 1, 1, 1, 1, 1,
1.937633, 0.1568655, 0.8511357, 1, 1, 1, 1, 1,
1.941304, 0.9489532, 1.591984, 1, 1, 1, 1, 1,
1.9479, -0.5856247, 2.957782, 1, 1, 1, 1, 1,
1.959405, -0.04021839, 2.120131, 1, 1, 1, 1, 1,
1.972696, 0.04424018, 1.05022, 1, 1, 1, 1, 1,
2.007661, -2.716072, 3.183401, 1, 1, 1, 1, 1,
2.047283, 1.70987, 2.267948, 0, 0, 1, 1, 1,
2.066433, 0.7340592, 0.2787366, 1, 0, 0, 1, 1,
2.072726, -0.6903722, 1.938583, 1, 0, 0, 1, 1,
2.084105, 0.6462089, 0.5151848, 1, 0, 0, 1, 1,
2.086615, 0.4452883, 1.477806, 1, 0, 0, 1, 1,
2.100895, 1.933292, 1.463191, 1, 0, 0, 1, 1,
2.111029, 1.353549, 1.175106, 0, 0, 0, 1, 1,
2.128866, 1.433767, 0.1332579, 0, 0, 0, 1, 1,
2.18224, 1.399405, 1.793962, 0, 0, 0, 1, 1,
2.190881, -3.26835, 3.016718, 0, 0, 0, 1, 1,
2.253781, 1.747775, 1.423247, 0, 0, 0, 1, 1,
2.291315, -0.1413213, 0.7972002, 0, 0, 0, 1, 1,
2.37015, -0.8013786, 1.275678, 0, 0, 0, 1, 1,
2.462883, 0.3482323, 0.0514702, 1, 1, 1, 1, 1,
2.478517, -1.121179, 1.892067, 1, 1, 1, 1, 1,
2.533783, -1.546444, 2.690262, 1, 1, 1, 1, 1,
2.69109, -1.622992, 2.583847, 1, 1, 1, 1, 1,
2.693594, 1.128824, 0.1436386, 1, 1, 1, 1, 1,
2.827212, 0.4374357, 2.214184, 1, 1, 1, 1, 1,
3.16573, -0.25538, 2.357637, 1, 1, 1, 1, 1
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
var radius = 9.695334;
var distance = 34.05445;
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
mvMatrix.translate( -0.1482209, -0.06233859, 0.334655 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.05445);
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
