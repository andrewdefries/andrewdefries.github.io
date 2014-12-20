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
-3.258372, 0.2967333, -1.79492, 1, 0, 0, 1,
-2.844387, -0.8514197, -2.507101, 1, 0.007843138, 0, 1,
-2.832558, 0.2898031, -1.735284, 1, 0.01176471, 0, 1,
-2.705739, -0.7824779, -2.875194, 1, 0.01960784, 0, 1,
-2.537642, -0.4826233, -1.440174, 1, 0.02352941, 0, 1,
-2.533811, -1.870442, -1.451007, 1, 0.03137255, 0, 1,
-2.489402, 0.2342237, -1.791355, 1, 0.03529412, 0, 1,
-2.418565, -2.258134, -0.9331647, 1, 0.04313726, 0, 1,
-2.416463, 1.694808, 1.639837, 1, 0.04705882, 0, 1,
-2.355066, 1.393737, -1.930079, 1, 0.05490196, 0, 1,
-2.353444, 0.2878694, -1.072315, 1, 0.05882353, 0, 1,
-2.280097, 0.8647736, -1.428007, 1, 0.06666667, 0, 1,
-2.250649, -0.4075307, -1.446516, 1, 0.07058824, 0, 1,
-2.181958, 0.9435512, -0.8539161, 1, 0.07843138, 0, 1,
-2.163484, -1.896168, 0.3379248, 1, 0.08235294, 0, 1,
-2.14745, -0.4046589, -0.5747945, 1, 0.09019608, 0, 1,
-2.116756, -0.3274394, -0.8270921, 1, 0.09411765, 0, 1,
-2.11095, 1.201332, -3.807487, 1, 0.1019608, 0, 1,
-2.093851, -0.5262698, -2.778465, 1, 0.1098039, 0, 1,
-2.091764, -1.621654, -1.109777, 1, 0.1137255, 0, 1,
-2.057004, -0.718179, -1.805801, 1, 0.1215686, 0, 1,
-2.015893, 1.719584, -0.5866332, 1, 0.1254902, 0, 1,
-1.999713, -1.350036, -1.970769, 1, 0.1333333, 0, 1,
-1.996887, -0.9563212, -3.687355, 1, 0.1372549, 0, 1,
-1.985798, -1.122565, -2.157689, 1, 0.145098, 0, 1,
-1.972095, -1.394523, -1.793661, 1, 0.1490196, 0, 1,
-1.965086, 0.4193507, -3.629422, 1, 0.1568628, 0, 1,
-1.959687, 0.1717776, -1.770786, 1, 0.1607843, 0, 1,
-1.956377, 0.07433706, -2.334223, 1, 0.1686275, 0, 1,
-1.938023, -0.3477034, -2.093893, 1, 0.172549, 0, 1,
-1.91508, -0.4128297, -1.087525, 1, 0.1803922, 0, 1,
-1.911137, 0.6848072, -1.897382, 1, 0.1843137, 0, 1,
-1.898101, 0.1626551, -1.710208, 1, 0.1921569, 0, 1,
-1.890618, 0.2964481, -1.537593, 1, 0.1960784, 0, 1,
-1.886917, 1.023944, -0.2048321, 1, 0.2039216, 0, 1,
-1.874803, 0.0482389, -1.582658, 1, 0.2117647, 0, 1,
-1.852674, 0.8101394, -2.420168, 1, 0.2156863, 0, 1,
-1.849784, -0.3750248, -1.299063, 1, 0.2235294, 0, 1,
-1.778238, 1.191056, -0.03970395, 1, 0.227451, 0, 1,
-1.768278, -1.355659, -1.882577, 1, 0.2352941, 0, 1,
-1.763649, 1.113214, 0.4569167, 1, 0.2392157, 0, 1,
-1.75852, 0.02352971, -3.284705, 1, 0.2470588, 0, 1,
-1.750954, 0.7287396, -1.057889, 1, 0.2509804, 0, 1,
-1.685976, -0.09038815, -2.366686, 1, 0.2588235, 0, 1,
-1.681695, -0.4085937, 0.09211629, 1, 0.2627451, 0, 1,
-1.66275, -0.521931, -2.531934, 1, 0.2705882, 0, 1,
-1.659084, 0.3826115, -1.916047, 1, 0.2745098, 0, 1,
-1.655785, -1.724361, -1.262195, 1, 0.282353, 0, 1,
-1.655719, -0.7446637, -3.170996, 1, 0.2862745, 0, 1,
-1.655169, -0.8593788, -1.045076, 1, 0.2941177, 0, 1,
-1.647697, -0.8188756, -2.358707, 1, 0.3019608, 0, 1,
-1.646329, 0.2258057, -1.196073, 1, 0.3058824, 0, 1,
-1.645846, -1.179358, -3.187826, 1, 0.3137255, 0, 1,
-1.645042, -0.5243147, -1.36018, 1, 0.3176471, 0, 1,
-1.639217, 0.1620923, -1.85275, 1, 0.3254902, 0, 1,
-1.638686, 0.285281, -0.4787173, 1, 0.3294118, 0, 1,
-1.611302, -0.7472614, 0.05218077, 1, 0.3372549, 0, 1,
-1.605361, -0.789605, -2.750922, 1, 0.3411765, 0, 1,
-1.604983, -0.443553, -2.770873, 1, 0.3490196, 0, 1,
-1.604655, 1.618801, 0.09596277, 1, 0.3529412, 0, 1,
-1.602771, 1.960586, -1.232424, 1, 0.3607843, 0, 1,
-1.601161, 1.058174, -1.82341, 1, 0.3647059, 0, 1,
-1.600512, -0.2593862, -3.081095, 1, 0.372549, 0, 1,
-1.594129, -0.5899796, -2.93174, 1, 0.3764706, 0, 1,
-1.570353, 0.1630733, -2.174215, 1, 0.3843137, 0, 1,
-1.570094, 0.7423868, -0.540462, 1, 0.3882353, 0, 1,
-1.562478, 1.787993, -1.22977, 1, 0.3960784, 0, 1,
-1.558179, 0.4921187, -0.02462603, 1, 0.4039216, 0, 1,
-1.546664, -1.101691, -3.508935, 1, 0.4078431, 0, 1,
-1.54367, -1.816565, -2.117066, 1, 0.4156863, 0, 1,
-1.538134, -0.5191864, -1.344728, 1, 0.4196078, 0, 1,
-1.535722, -0.2178249, -1.11498, 1, 0.427451, 0, 1,
-1.53143, 0.5981047, 1.280302, 1, 0.4313726, 0, 1,
-1.530421, 0.3351732, 0.4567797, 1, 0.4392157, 0, 1,
-1.526832, 0.7352819, -1.223491, 1, 0.4431373, 0, 1,
-1.521816, 0.4601279, -1.981164, 1, 0.4509804, 0, 1,
-1.515808, -0.3032483, -3.0516, 1, 0.454902, 0, 1,
-1.513082, 0.9668719, -0.7612087, 1, 0.4627451, 0, 1,
-1.507084, -0.6738059, -0.9454106, 1, 0.4666667, 0, 1,
-1.505162, 0.4590438, -0.8317654, 1, 0.4745098, 0, 1,
-1.499557, -1.664264, -1.942397, 1, 0.4784314, 0, 1,
-1.495859, -0.7065526, -1.149353, 1, 0.4862745, 0, 1,
-1.494934, 2.099734, -0.6298178, 1, 0.4901961, 0, 1,
-1.475813, 0.1154921, -1.238029, 1, 0.4980392, 0, 1,
-1.474521, 0.2523772, -0.7021381, 1, 0.5058824, 0, 1,
-1.472765, -1.343073, -1.089868, 1, 0.509804, 0, 1,
-1.461713, -1.23664, -1.553759, 1, 0.5176471, 0, 1,
-1.438571, -1.223326, -1.045582, 1, 0.5215687, 0, 1,
-1.436448, -1.519136, -3.814162, 1, 0.5294118, 0, 1,
-1.43107, -2.865972, -0.759769, 1, 0.5333334, 0, 1,
-1.42865, 0.517368, -1.919105, 1, 0.5411765, 0, 1,
-1.417946, -0.4359589, -1.517092, 1, 0.5450981, 0, 1,
-1.398662, -1.641964, -3.250701, 1, 0.5529412, 0, 1,
-1.395583, 1.189123, -1.823866, 1, 0.5568628, 0, 1,
-1.393407, 1.264736, -0.1292123, 1, 0.5647059, 0, 1,
-1.39005, -0.1541806, -1.165677, 1, 0.5686275, 0, 1,
-1.38893, 1.148717, -1.609456, 1, 0.5764706, 0, 1,
-1.387299, 0.5819243, -1.645825, 1, 0.5803922, 0, 1,
-1.381715, 1.220221, -1.668497, 1, 0.5882353, 0, 1,
-1.370482, -0.4899077, -1.864073, 1, 0.5921569, 0, 1,
-1.367206, 1.120824, -2.692396, 1, 0.6, 0, 1,
-1.350074, -0.06630734, -2.287803, 1, 0.6078432, 0, 1,
-1.349728, -0.2235916, -1.266506, 1, 0.6117647, 0, 1,
-1.347992, -1.912748, -2.022762, 1, 0.6196079, 0, 1,
-1.347037, 0.8151299, -1.251971, 1, 0.6235294, 0, 1,
-1.346929, 1.524409, -1.062337, 1, 0.6313726, 0, 1,
-1.312055, 0.4807498, -0.4785419, 1, 0.6352941, 0, 1,
-1.304914, 1.368153, -1.295246, 1, 0.6431373, 0, 1,
-1.289, 0.2536298, -0.5192927, 1, 0.6470588, 0, 1,
-1.285828, 0.1785499, -1.459963, 1, 0.654902, 0, 1,
-1.276743, -0.7597541, -1.476224, 1, 0.6588235, 0, 1,
-1.266222, 0.5754852, -1.125402, 1, 0.6666667, 0, 1,
-1.25873, 0.3977085, -2.457965, 1, 0.6705883, 0, 1,
-1.250466, 0.2380383, -2.885236, 1, 0.6784314, 0, 1,
-1.249529, 0.9595692, -0.8088267, 1, 0.682353, 0, 1,
-1.244909, -0.07555363, -2.003216, 1, 0.6901961, 0, 1,
-1.243019, 1.660147, -1.240709, 1, 0.6941177, 0, 1,
-1.237914, -0.843785, -2.708436, 1, 0.7019608, 0, 1,
-1.235864, 0.2595853, -1.449039, 1, 0.7098039, 0, 1,
-1.226478, -0.3821095, -1.79071, 1, 0.7137255, 0, 1,
-1.225002, -0.08933722, -0.6345363, 1, 0.7215686, 0, 1,
-1.224703, -1.424665, -3.256183, 1, 0.7254902, 0, 1,
-1.219168, -1.31443, -2.028841, 1, 0.7333333, 0, 1,
-1.217485, -0.5185217, -1.369419, 1, 0.7372549, 0, 1,
-1.214312, 0.3715995, -3.144869, 1, 0.7450981, 0, 1,
-1.209041, -0.2332646, -1.633447, 1, 0.7490196, 0, 1,
-1.208941, -0.3953317, -3.055195, 1, 0.7568628, 0, 1,
-1.208312, 1.052816, -1.127717, 1, 0.7607843, 0, 1,
-1.207936, -0.1548043, -0.1735075, 1, 0.7686275, 0, 1,
-1.202993, 2.040066, -0.5470707, 1, 0.772549, 0, 1,
-1.2014, -1.463199, -3.380168, 1, 0.7803922, 0, 1,
-1.188408, -0.7566593, -1.669583, 1, 0.7843137, 0, 1,
-1.186078, 0.8262058, -0.1629452, 1, 0.7921569, 0, 1,
-1.18376, -1.005023, -2.214094, 1, 0.7960784, 0, 1,
-1.169427, -1.307401, -2.567871, 1, 0.8039216, 0, 1,
-1.163787, 0.8702605, -0.6992188, 1, 0.8117647, 0, 1,
-1.153407, 0.60746, -0.401763, 1, 0.8156863, 0, 1,
-1.152617, 1.163654, -1.378029, 1, 0.8235294, 0, 1,
-1.144698, 1.258876, -0.9306946, 1, 0.827451, 0, 1,
-1.141289, 1.802298, -0.3464857, 1, 0.8352941, 0, 1,
-1.138187, -1.947885, -3.384511, 1, 0.8392157, 0, 1,
-1.133032, 0.7325748, -0.7432455, 1, 0.8470588, 0, 1,
-1.132255, 2.184252, 0.9672394, 1, 0.8509804, 0, 1,
-1.12646, -0.3596543, -2.671062, 1, 0.8588235, 0, 1,
-1.12031, -0.4423301, -1.687962, 1, 0.8627451, 0, 1,
-1.120208, 0.4709994, -0.9988481, 1, 0.8705882, 0, 1,
-1.114622, 0.9822354, -1.476989, 1, 0.8745098, 0, 1,
-1.108066, -1.070665, -2.365057, 1, 0.8823529, 0, 1,
-1.107652, 0.2302924, -2.677132, 1, 0.8862745, 0, 1,
-1.105733, -0.8534036, -1.228687, 1, 0.8941177, 0, 1,
-1.103772, 1.428691, 0.4410998, 1, 0.8980392, 0, 1,
-1.100953, 1.138806, -0.2538825, 1, 0.9058824, 0, 1,
-1.100921, -0.2541017, -1.964483, 1, 0.9137255, 0, 1,
-1.094413, 0.5071714, 0.02901378, 1, 0.9176471, 0, 1,
-1.090466, -0.9691855, -0.6156814, 1, 0.9254902, 0, 1,
-1.087664, 0.2287441, -2.26577, 1, 0.9294118, 0, 1,
-1.086578, 0.8611807, -0.9205282, 1, 0.9372549, 0, 1,
-1.07974, 0.554095, -0.2607041, 1, 0.9411765, 0, 1,
-1.077263, 0.2267773, -2.362453, 1, 0.9490196, 0, 1,
-1.070539, -0.2484903, -2.052199, 1, 0.9529412, 0, 1,
-1.068215, 1.366916, -1.327477, 1, 0.9607843, 0, 1,
-1.067105, 0.08158732, -4.151027, 1, 0.9647059, 0, 1,
-1.051682, 1.037995, -1.2421, 1, 0.972549, 0, 1,
-1.044371, -0.8703465, -0.8948722, 1, 0.9764706, 0, 1,
-1.042623, -2.056287, -3.987257, 1, 0.9843137, 0, 1,
-1.03782, -0.6294751, -3.493444, 1, 0.9882353, 0, 1,
-1.029753, -0.5981888, -2.699008, 1, 0.9960784, 0, 1,
-1.027969, -0.4778197, -2.682428, 0.9960784, 1, 0, 1,
-1.027372, 0.2206856, -0.3861455, 0.9921569, 1, 0, 1,
-1.026128, 2.333302, -0.6617797, 0.9843137, 1, 0, 1,
-1.025877, -0.6239042, -3.059392, 0.9803922, 1, 0, 1,
-1.021787, 2.077744, -0.04018819, 0.972549, 1, 0, 1,
-1.018928, 0.3120707, -1.518819, 0.9686275, 1, 0, 1,
-1.013093, -0.1646585, -1.295436, 0.9607843, 1, 0, 1,
-1.011658, 0.6305863, -0.7889455, 0.9568627, 1, 0, 1,
-1.005418, -0.2441299, -2.424379, 0.9490196, 1, 0, 1,
-1.004897, 0.7087636, -0.2979081, 0.945098, 1, 0, 1,
-0.9991013, 0.53102, -1.598934, 0.9372549, 1, 0, 1,
-0.9977474, -1.406019, -2.612552, 0.9333333, 1, 0, 1,
-0.9968535, 0.9598856, -0.9012443, 0.9254902, 1, 0, 1,
-0.9912027, -0.9318442, -2.972414, 0.9215686, 1, 0, 1,
-0.9903477, 0.7362757, 0.4135478, 0.9137255, 1, 0, 1,
-0.9898693, -1.40089, -2.272331, 0.9098039, 1, 0, 1,
-0.982381, 0.5559978, -0.01135768, 0.9019608, 1, 0, 1,
-0.978035, -0.3936048, -2.255921, 0.8941177, 1, 0, 1,
-0.9741888, 1.349754, -1.048899, 0.8901961, 1, 0, 1,
-0.9737105, 0.5895455, -0.5394344, 0.8823529, 1, 0, 1,
-0.9650698, 0.5003764, -0.9964504, 0.8784314, 1, 0, 1,
-0.9579837, 0.296432, -1.435229, 0.8705882, 1, 0, 1,
-0.9541603, 0.2065009, -0.8307406, 0.8666667, 1, 0, 1,
-0.951346, -0.7254897, -1.979459, 0.8588235, 1, 0, 1,
-0.9483731, -0.5407655, -0.9276024, 0.854902, 1, 0, 1,
-0.9446484, -1.28774, -3.062799, 0.8470588, 1, 0, 1,
-0.9445123, -1.047072, -2.500497, 0.8431373, 1, 0, 1,
-0.9438947, 0.4598592, -1.872377, 0.8352941, 1, 0, 1,
-0.9437389, -1.888694, -3.859568, 0.8313726, 1, 0, 1,
-0.9401021, 0.8171856, -1.563169, 0.8235294, 1, 0, 1,
-0.9345131, -0.900825, -1.43397, 0.8196079, 1, 0, 1,
-0.9317272, 0.1982498, -2.488037, 0.8117647, 1, 0, 1,
-0.9313554, -0.3115058, -2.509826, 0.8078431, 1, 0, 1,
-0.9185567, 0.1483487, -1.825986, 0.8, 1, 0, 1,
-0.9166603, 0.1917891, -1.540171, 0.7921569, 1, 0, 1,
-0.9152113, 1.005522, -0.3943923, 0.7882353, 1, 0, 1,
-0.9128442, -2.267395, -3.895846, 0.7803922, 1, 0, 1,
-0.9058207, 0.1851894, -0.3194918, 0.7764706, 1, 0, 1,
-0.9057964, 0.1880029, -2.087408, 0.7686275, 1, 0, 1,
-0.9041353, -0.4364219, -4.092565, 0.7647059, 1, 0, 1,
-0.8997399, 0.526556, -1.666504, 0.7568628, 1, 0, 1,
-0.8981672, -0.3310236, -1.4729, 0.7529412, 1, 0, 1,
-0.8911062, 1.164116, -1.596713, 0.7450981, 1, 0, 1,
-0.8869399, -0.2401324, -0.2570697, 0.7411765, 1, 0, 1,
-0.8831756, -1.872553, -3.693588, 0.7333333, 1, 0, 1,
-0.8726622, 0.3344191, -2.807093, 0.7294118, 1, 0, 1,
-0.8656579, 0.7640431, 0.1922061, 0.7215686, 1, 0, 1,
-0.862978, 2.465661, -0.2143192, 0.7176471, 1, 0, 1,
-0.8621299, -1.155008, -3.306023, 0.7098039, 1, 0, 1,
-0.8534901, -0.4138261, -3.173775, 0.7058824, 1, 0, 1,
-0.8510331, -1.376623, -4.080997, 0.6980392, 1, 0, 1,
-0.8506441, 0.04530634, -2.339201, 0.6901961, 1, 0, 1,
-0.8399007, 0.8742537, 0.3991107, 0.6862745, 1, 0, 1,
-0.8265838, 1.812759, -2.114047, 0.6784314, 1, 0, 1,
-0.8249875, -0.1088104, 0.03814048, 0.6745098, 1, 0, 1,
-0.8178455, -1.41739, -1.124331, 0.6666667, 1, 0, 1,
-0.8177312, -0.6871428, -2.23848, 0.6627451, 1, 0, 1,
-0.8100529, -0.2227058, -0.3291448, 0.654902, 1, 0, 1,
-0.8082684, 0.4666488, -1.132061, 0.6509804, 1, 0, 1,
-0.794216, 0.0646612, -1.78473, 0.6431373, 1, 0, 1,
-0.7934604, -1.996846, -3.747731, 0.6392157, 1, 0, 1,
-0.7920903, 1.262648, -1.453437, 0.6313726, 1, 0, 1,
-0.7904823, -1.29098, -0.8219587, 0.627451, 1, 0, 1,
-0.7880329, -0.4132681, -1.021816, 0.6196079, 1, 0, 1,
-0.7862807, -0.2695581, -0.9476002, 0.6156863, 1, 0, 1,
-0.7815626, 0.4405489, -1.230444, 0.6078432, 1, 0, 1,
-0.7765191, 0.0009785275, -0.4594619, 0.6039216, 1, 0, 1,
-0.7708837, -0.03887545, -1.493624, 0.5960785, 1, 0, 1,
-0.7694959, -1.376309, -1.993775, 0.5882353, 1, 0, 1,
-0.767689, 0.2464347, -2.204844, 0.5843138, 1, 0, 1,
-0.7637431, 0.9646839, -0.8857458, 0.5764706, 1, 0, 1,
-0.7619964, 1.091241, -1.239538, 0.572549, 1, 0, 1,
-0.7615868, 0.9078643, -0.1171411, 0.5647059, 1, 0, 1,
-0.7522011, -1.046898, -2.050701, 0.5607843, 1, 0, 1,
-0.7518893, 0.2186922, -1.847011, 0.5529412, 1, 0, 1,
-0.750935, 0.5143734, -0.7937508, 0.5490196, 1, 0, 1,
-0.7384772, -0.1666936, -2.298441, 0.5411765, 1, 0, 1,
-0.7365072, -1.602808, -2.608734, 0.5372549, 1, 0, 1,
-0.7301473, -1.844212, -3.076807, 0.5294118, 1, 0, 1,
-0.7101918, -0.0004835427, -0.664575, 0.5254902, 1, 0, 1,
-0.7096835, 0.6495904, -0.9336902, 0.5176471, 1, 0, 1,
-0.7034882, -0.8612432, -2.564943, 0.5137255, 1, 0, 1,
-0.7015773, -1.749424, -1.569806, 0.5058824, 1, 0, 1,
-0.7011873, -2.650774, -1.742772, 0.5019608, 1, 0, 1,
-0.7008263, 1.024822, -0.3033431, 0.4941176, 1, 0, 1,
-0.6994879, -0.7775978, -1.902478, 0.4862745, 1, 0, 1,
-0.6982843, -0.6401507, -0.9193417, 0.4823529, 1, 0, 1,
-0.6949109, 2.175196, 1.861583, 0.4745098, 1, 0, 1,
-0.6901442, -2.780997, -3.14401, 0.4705882, 1, 0, 1,
-0.6849185, 0.5321574, -1.309265, 0.4627451, 1, 0, 1,
-0.6848172, 0.08496975, -2.682825, 0.4588235, 1, 0, 1,
-0.681506, -2.041774, -2.172499, 0.4509804, 1, 0, 1,
-0.6796463, -0.8956094, -3.917608, 0.4470588, 1, 0, 1,
-0.6754565, -1.475302, -4.787635, 0.4392157, 1, 0, 1,
-0.6710637, 1.161433, 0.3943983, 0.4352941, 1, 0, 1,
-0.6696717, -1.954648, -2.947563, 0.427451, 1, 0, 1,
-0.668899, 0.4510618, -2.077114, 0.4235294, 1, 0, 1,
-0.6641805, 0.5987184, -0.8227907, 0.4156863, 1, 0, 1,
-0.6626906, 1.135262, -1.311442, 0.4117647, 1, 0, 1,
-0.6599675, 0.1224063, 1.334953, 0.4039216, 1, 0, 1,
-0.6583475, -0.9480301, -3.40348, 0.3960784, 1, 0, 1,
-0.6438076, 0.446003, -0.8363831, 0.3921569, 1, 0, 1,
-0.6438014, 0.8645427, -2.370136, 0.3843137, 1, 0, 1,
-0.6390873, 1.956336, -0.6326362, 0.3803922, 1, 0, 1,
-0.6330071, -0.6765082, -2.566506, 0.372549, 1, 0, 1,
-0.6266722, -0.4346052, -2.992553, 0.3686275, 1, 0, 1,
-0.621168, -0.8808509, -3.555797, 0.3607843, 1, 0, 1,
-0.6167108, -0.39331, -2.62114, 0.3568628, 1, 0, 1,
-0.6166783, 0.4786752, -0.7014414, 0.3490196, 1, 0, 1,
-0.6125435, 0.3633326, -0.2137114, 0.345098, 1, 0, 1,
-0.6109267, 0.5652353, -1.338728, 0.3372549, 1, 0, 1,
-0.6098815, 0.3361052, -1.251763, 0.3333333, 1, 0, 1,
-0.6046383, 1.373057, -0.617335, 0.3254902, 1, 0, 1,
-0.6025522, -1.292411, -2.202144, 0.3215686, 1, 0, 1,
-0.5960687, 1.439655, -0.5308539, 0.3137255, 1, 0, 1,
-0.5922706, 0.2233306, 0.3002412, 0.3098039, 1, 0, 1,
-0.5896686, 0.4813555, -0.1779511, 0.3019608, 1, 0, 1,
-0.5868847, -1.504276, -2.405647, 0.2941177, 1, 0, 1,
-0.5851164, 1.006217, -0.365808, 0.2901961, 1, 0, 1,
-0.5812294, 1.101427, 1.117983, 0.282353, 1, 0, 1,
-0.5786873, -1.227455, -3.68557, 0.2784314, 1, 0, 1,
-0.5785376, -1.375135, -2.888797, 0.2705882, 1, 0, 1,
-0.5769624, -1.03518, -1.530903, 0.2666667, 1, 0, 1,
-0.5766245, -0.5798571, -3.344952, 0.2588235, 1, 0, 1,
-0.5741292, 0.5891687, -0.6403088, 0.254902, 1, 0, 1,
-0.5676106, -0.7617525, -2.558228, 0.2470588, 1, 0, 1,
-0.5644293, -0.7020004, -3.098311, 0.2431373, 1, 0, 1,
-0.5607344, -3.142903, -2.814362, 0.2352941, 1, 0, 1,
-0.5578672, 1.007132, 0.2634007, 0.2313726, 1, 0, 1,
-0.5570263, 0.5012912, -1.427993, 0.2235294, 1, 0, 1,
-0.5554612, -0.007522613, -1.03202, 0.2196078, 1, 0, 1,
-0.5527795, -0.5431231, -2.402787, 0.2117647, 1, 0, 1,
-0.550017, -0.9656905, -2.273684, 0.2078431, 1, 0, 1,
-0.5465791, -0.2204383, -2.794693, 0.2, 1, 0, 1,
-0.5386288, -0.5684621, -3.348226, 0.1921569, 1, 0, 1,
-0.5364518, -1.257308, -2.617183, 0.1882353, 1, 0, 1,
-0.5352639, -0.2071193, -1.896873, 0.1803922, 1, 0, 1,
-0.5327451, 1.065813, -0.2564628, 0.1764706, 1, 0, 1,
-0.5306102, -0.1442758, 0.2336899, 0.1686275, 1, 0, 1,
-0.5273046, -1.097406, -2.421026, 0.1647059, 1, 0, 1,
-0.5251174, -0.2107273, -3.542584, 0.1568628, 1, 0, 1,
-0.5179358, 0.4731071, -2.191567, 0.1529412, 1, 0, 1,
-0.517156, 0.328036, -3.08692, 0.145098, 1, 0, 1,
-0.5136355, 0.2982804, -1.006139, 0.1411765, 1, 0, 1,
-0.5116635, 0.01132352, -0.7156453, 0.1333333, 1, 0, 1,
-0.5116216, -1.5847, -2.695314, 0.1294118, 1, 0, 1,
-0.5097541, 0.5569261, 0.91869, 0.1215686, 1, 0, 1,
-0.5080105, -0.2779491, -3.12913, 0.1176471, 1, 0, 1,
-0.5069708, 0.9048415, -0.4914278, 0.1098039, 1, 0, 1,
-0.5036799, 0.9397687, -0.645812, 0.1058824, 1, 0, 1,
-0.5007787, 0.9459794, -1.626345, 0.09803922, 1, 0, 1,
-0.4998976, 0.6437095, -0.08249951, 0.09019608, 1, 0, 1,
-0.4953196, 2.710891, 0.1180334, 0.08627451, 1, 0, 1,
-0.4949283, -0.2765667, -3.361139, 0.07843138, 1, 0, 1,
-0.494102, -0.3358028, -2.419271, 0.07450981, 1, 0, 1,
-0.492297, 1.092126, 0.9452608, 0.06666667, 1, 0, 1,
-0.4916874, -0.8387516, -1.289668, 0.0627451, 1, 0, 1,
-0.4914448, 0.330832, -0.7285572, 0.05490196, 1, 0, 1,
-0.4848418, 0.07651865, -2.699255, 0.05098039, 1, 0, 1,
-0.4791226, -2.165012, -3.37956, 0.04313726, 1, 0, 1,
-0.4754994, 1.004983, -1.450928, 0.03921569, 1, 0, 1,
-0.4720294, -1.24354, -3.909697, 0.03137255, 1, 0, 1,
-0.4688773, 1.401415, -0.3997821, 0.02745098, 1, 0, 1,
-0.4667322, 0.8027639, -0.2217547, 0.01960784, 1, 0, 1,
-0.4652155, -0.9556063, -1.518451, 0.01568628, 1, 0, 1,
-0.4651836, -0.05408764, -3.629385, 0.007843138, 1, 0, 1,
-0.4624738, -0.6665103, -3.890997, 0.003921569, 1, 0, 1,
-0.4605959, -1.28625, -2.359383, 0, 1, 0.003921569, 1,
-0.4605583, -1.529256, -2.884333, 0, 1, 0.01176471, 1,
-0.4561576, 0.3685082, -0.605653, 0, 1, 0.01568628, 1,
-0.4505959, 0.3545155, -1.569401, 0, 1, 0.02352941, 1,
-0.4458744, -0.3792325, -2.614453, 0, 1, 0.02745098, 1,
-0.4415664, 1.721608, -0.2259403, 0, 1, 0.03529412, 1,
-0.43944, -0.1694881, -0.05723349, 0, 1, 0.03921569, 1,
-0.4384845, -0.33361, -3.087037, 0, 1, 0.04705882, 1,
-0.4379372, 0.3964852, -0.4841672, 0, 1, 0.05098039, 1,
-0.4370081, 0.8718112, 0.5102385, 0, 1, 0.05882353, 1,
-0.427082, 1.435906, 1.940322, 0, 1, 0.0627451, 1,
-0.4256512, 0.1775112, -0.617198, 0, 1, 0.07058824, 1,
-0.4187934, 0.05091011, 0.3875965, 0, 1, 0.07450981, 1,
-0.4059539, -0.8436478, -1.24079, 0, 1, 0.08235294, 1,
-0.4049189, 1.450603, -0.8385358, 0, 1, 0.08627451, 1,
-0.4040345, 0.3366182, -2.965524, 0, 1, 0.09411765, 1,
-0.402923, 0.1590797, 0.04103027, 0, 1, 0.1019608, 1,
-0.4006088, 0.5058203, -1.328137, 0, 1, 0.1058824, 1,
-0.400013, 0.004713083, -1.849197, 0, 1, 0.1137255, 1,
-0.3985273, -1.350372, -1.081082, 0, 1, 0.1176471, 1,
-0.3984835, 0.9303379, -0.9543979, 0, 1, 0.1254902, 1,
-0.3983012, -0.7532567, -0.5922555, 0, 1, 0.1294118, 1,
-0.3909574, 1.034871, -1.127781, 0, 1, 0.1372549, 1,
-0.3900143, 1.704944, -0.2182395, 0, 1, 0.1411765, 1,
-0.386525, -0.8817732, -4.515346, 0, 1, 0.1490196, 1,
-0.3862503, -1.937414, -3.547331, 0, 1, 0.1529412, 1,
-0.3843816, -1.867448, -1.836907, 0, 1, 0.1607843, 1,
-0.3799099, 1.372613, -0.5722051, 0, 1, 0.1647059, 1,
-0.3761217, 0.7545686, 1.088369, 0, 1, 0.172549, 1,
-0.3720655, -0.7676997, -2.788155, 0, 1, 0.1764706, 1,
-0.3718037, -0.1519659, -2.80846, 0, 1, 0.1843137, 1,
-0.3709936, -0.3151867, -1.858406, 0, 1, 0.1882353, 1,
-0.3707448, 0.7129931, 1.058921, 0, 1, 0.1960784, 1,
-0.3642316, 0.9995784, 0.8637815, 0, 1, 0.2039216, 1,
-0.3632733, 1.953209, -0.01488504, 0, 1, 0.2078431, 1,
-0.3618653, 0.7336261, -1.477716, 0, 1, 0.2156863, 1,
-0.3603849, -0.1520186, -3.622418, 0, 1, 0.2196078, 1,
-0.3599331, -0.779507, -2.557522, 0, 1, 0.227451, 1,
-0.3589592, 1.798157, 0.2712582, 0, 1, 0.2313726, 1,
-0.3586006, -0.4547631, -0.2086852, 0, 1, 0.2392157, 1,
-0.3577202, -1.569336, -0.9878814, 0, 1, 0.2431373, 1,
-0.3543792, -0.6174085, -2.309022, 0, 1, 0.2509804, 1,
-0.3530217, 0.1991817, 0.4379021, 0, 1, 0.254902, 1,
-0.3501695, -0.2985829, -3.704023, 0, 1, 0.2627451, 1,
-0.342842, 0.3621119, 1.046294, 0, 1, 0.2666667, 1,
-0.3376758, -1.201466, -2.721466, 0, 1, 0.2745098, 1,
-0.3287702, 0.3621703, -2.175005, 0, 1, 0.2784314, 1,
-0.3280539, -0.451524, -2.492914, 0, 1, 0.2862745, 1,
-0.3239904, 1.06505, -1.453781, 0, 1, 0.2901961, 1,
-0.3190244, -0.3439153, -2.952876, 0, 1, 0.2980392, 1,
-0.3184702, 1.541775, -1.572683, 0, 1, 0.3058824, 1,
-0.3178856, -0.9839951, -2.394642, 0, 1, 0.3098039, 1,
-0.3073218, 1.265702, -0.7575728, 0, 1, 0.3176471, 1,
-0.3027185, 0.7499321, 0.1802134, 0, 1, 0.3215686, 1,
-0.302651, -0.7683127, -3.946832, 0, 1, 0.3294118, 1,
-0.3007463, -0.7061813, -2.048784, 0, 1, 0.3333333, 1,
-0.2968588, 0.8215725, -1.580128, 0, 1, 0.3411765, 1,
-0.2958985, 0.3502154, 0.7387236, 0, 1, 0.345098, 1,
-0.2944087, -2.02041, -0.7795448, 0, 1, 0.3529412, 1,
-0.2923607, 2.32914, 0.1040233, 0, 1, 0.3568628, 1,
-0.291723, -1.812728, -1.344897, 0, 1, 0.3647059, 1,
-0.2906768, -0.3904921, -2.354208, 0, 1, 0.3686275, 1,
-0.2879066, -2.672189, -2.721964, 0, 1, 0.3764706, 1,
-0.283648, 0.08977014, -0.8315063, 0, 1, 0.3803922, 1,
-0.2797485, 0.9703311, -0.991496, 0, 1, 0.3882353, 1,
-0.2759045, 1.259172, -2.036909, 0, 1, 0.3921569, 1,
-0.2743402, 0.8672625, -1.680469, 0, 1, 0.4, 1,
-0.2724778, -0.4059352, -2.312114, 0, 1, 0.4078431, 1,
-0.2707937, -0.2484714, -2.786415, 0, 1, 0.4117647, 1,
-0.269576, 0.05179864, -1.460701, 0, 1, 0.4196078, 1,
-0.2679316, 0.2351054, -0.01535891, 0, 1, 0.4235294, 1,
-0.2629535, -0.7727135, -3.528422, 0, 1, 0.4313726, 1,
-0.2628673, 0.8186734, -0.3318604, 0, 1, 0.4352941, 1,
-0.2622133, -1.15911, -2.402523, 0, 1, 0.4431373, 1,
-0.2596275, 1.147479, -0.6379862, 0, 1, 0.4470588, 1,
-0.2481318, -1.40903, -3.282134, 0, 1, 0.454902, 1,
-0.2441634, -0.7991235, -0.9104667, 0, 1, 0.4588235, 1,
-0.239503, -0.71839, -3.249349, 0, 1, 0.4666667, 1,
-0.2392363, 1.527952, 0.5112003, 0, 1, 0.4705882, 1,
-0.2383859, 1.71782, 0.5929895, 0, 1, 0.4784314, 1,
-0.2296883, 1.863382, -1.039079, 0, 1, 0.4823529, 1,
-0.2286608, -0.2070734, -2.073379, 0, 1, 0.4901961, 1,
-0.2247619, 0.07126472, -1.383818, 0, 1, 0.4941176, 1,
-0.2246568, -1.53577, -3.56824, 0, 1, 0.5019608, 1,
-0.2239871, 0.1446328, -0.2687123, 0, 1, 0.509804, 1,
-0.2238632, 0.4176029, -0.3720779, 0, 1, 0.5137255, 1,
-0.2238573, 0.5912121, -1.139609, 0, 1, 0.5215687, 1,
-0.2224021, -2.349372, -4.16184, 0, 1, 0.5254902, 1,
-0.2209759, -0.3562354, -3.254543, 0, 1, 0.5333334, 1,
-0.2187026, -1.291868, -2.62404, 0, 1, 0.5372549, 1,
-0.214685, 0.2314784, -2.090074, 0, 1, 0.5450981, 1,
-0.2137398, -1.598717, -4.707336, 0, 1, 0.5490196, 1,
-0.2099857, -0.2157981, -4.07876, 0, 1, 0.5568628, 1,
-0.1986463, -0.2525992, -1.528043, 0, 1, 0.5607843, 1,
-0.1974227, -0.8981224, -2.941285, 0, 1, 0.5686275, 1,
-0.1912531, -0.8543568, -2.007335, 0, 1, 0.572549, 1,
-0.1883942, 0.11516, -2.219052, 0, 1, 0.5803922, 1,
-0.1818444, -0.7241893, -4.604819, 0, 1, 0.5843138, 1,
-0.1774238, -1.472352, -1.213239, 0, 1, 0.5921569, 1,
-0.1729046, -0.1113718, -1.89939, 0, 1, 0.5960785, 1,
-0.171949, -0.7890558, -2.656904, 0, 1, 0.6039216, 1,
-0.1705955, -1.083631, -1.200998, 0, 1, 0.6117647, 1,
-0.16991, -1.766726, -5.010392, 0, 1, 0.6156863, 1,
-0.16955, 1.342998, 0.126346, 0, 1, 0.6235294, 1,
-0.1623648, -0.3017697, -1.88892, 0, 1, 0.627451, 1,
-0.1620283, 1.645241, -1.258282, 0, 1, 0.6352941, 1,
-0.1614504, -0.1929128, 0.1131924, 0, 1, 0.6392157, 1,
-0.1603891, -0.5738124, -1.14651, 0, 1, 0.6470588, 1,
-0.1568558, 0.9316002, -0.2666951, 0, 1, 0.6509804, 1,
-0.1546137, -1.783285, -3.880911, 0, 1, 0.6588235, 1,
-0.1529095, 2.005005, -0.2539732, 0, 1, 0.6627451, 1,
-0.1521531, -0.01052322, -2.086155, 0, 1, 0.6705883, 1,
-0.1519775, 0.7546769, -0.04520853, 0, 1, 0.6745098, 1,
-0.1506265, -1.959094, -3.392778, 0, 1, 0.682353, 1,
-0.1505119, 0.8740967, -0.007580178, 0, 1, 0.6862745, 1,
-0.146588, 0.6002792, -0.7951067, 0, 1, 0.6941177, 1,
-0.1462989, -1.354467, -4.070604, 0, 1, 0.7019608, 1,
-0.1391178, -1.501362, -4.54346, 0, 1, 0.7058824, 1,
-0.1387692, 1.131246, 0.2320696, 0, 1, 0.7137255, 1,
-0.1382689, -0.7276745, -2.291824, 0, 1, 0.7176471, 1,
-0.1315977, -0.1997904, -3.272001, 0, 1, 0.7254902, 1,
-0.1311358, -0.3327219, -2.563652, 0, 1, 0.7294118, 1,
-0.1297144, 0.6392449, 0.04801836, 0, 1, 0.7372549, 1,
-0.1278934, 0.7552143, -0.8306348, 0, 1, 0.7411765, 1,
-0.1205029, -2.572063, -3.089516, 0, 1, 0.7490196, 1,
-0.1150182, 1.432411, 0.6523411, 0, 1, 0.7529412, 1,
-0.1113596, -1.723115, -3.693921, 0, 1, 0.7607843, 1,
-0.1072902, -1.194033, -3.934567, 0, 1, 0.7647059, 1,
-0.1072606, 2.19624, 0.6193705, 0, 1, 0.772549, 1,
-0.1059178, -0.7904971, -3.783426, 0, 1, 0.7764706, 1,
-0.1050119, -0.2923752, -1.001057, 0, 1, 0.7843137, 1,
-0.09333731, -1.003568, -0.966356, 0, 1, 0.7882353, 1,
-0.09058248, -0.5902306, -2.849098, 0, 1, 0.7960784, 1,
-0.09022143, -0.8484448, -5.123201, 0, 1, 0.8039216, 1,
-0.0893548, 0.4913904, -0.4370464, 0, 1, 0.8078431, 1,
-0.08663992, 1.261225, -0.5182325, 0, 1, 0.8156863, 1,
-0.08301637, 0.2372395, -0.3036886, 0, 1, 0.8196079, 1,
-0.08140875, -0.2846144, -2.882762, 0, 1, 0.827451, 1,
-0.07841726, -0.9146768, -3.469923, 0, 1, 0.8313726, 1,
-0.07757214, -0.5560225, -4.443681, 0, 1, 0.8392157, 1,
-0.07689883, -0.3538313, -2.477183, 0, 1, 0.8431373, 1,
-0.07596295, 0.1639069, -0.4076939, 0, 1, 0.8509804, 1,
-0.07306974, 0.5573049, -0.7262785, 0, 1, 0.854902, 1,
-0.07249118, 0.2128842, 0.1189841, 0, 1, 0.8627451, 1,
-0.0723547, 0.7933671, 1.370314, 0, 1, 0.8666667, 1,
-0.06948027, 0.1785592, 1.023471, 0, 1, 0.8745098, 1,
-0.06804246, 0.8515342, -1.510378, 0, 1, 0.8784314, 1,
-0.06604412, 0.626992, -1.420088, 0, 1, 0.8862745, 1,
-0.06439331, 0.3884873, 1.472062, 0, 1, 0.8901961, 1,
-0.06040604, 1.270429, -0.9237929, 0, 1, 0.8980392, 1,
-0.05950874, -1.113351, -2.825752, 0, 1, 0.9058824, 1,
-0.05776, -1.748958, -3.555681, 0, 1, 0.9098039, 1,
-0.05232349, -0.9266093, -1.57988, 0, 1, 0.9176471, 1,
-0.048825, 0.17799, -0.8944022, 0, 1, 0.9215686, 1,
-0.0486645, 0.6491942, -0.2155594, 0, 1, 0.9294118, 1,
-0.0484953, -0.3489603, -2.223132, 0, 1, 0.9333333, 1,
-0.04847254, 1.626039, -0.0496995, 0, 1, 0.9411765, 1,
-0.04846865, -0.4266372, -2.555043, 0, 1, 0.945098, 1,
-0.04517586, 0.1344446, -1.021071, 0, 1, 0.9529412, 1,
-0.04251849, -0.4590152, -3.29695, 0, 1, 0.9568627, 1,
-0.03835168, 0.8465163, 0.573672, 0, 1, 0.9647059, 1,
-0.03700429, 0.6870933, 0.4816657, 0, 1, 0.9686275, 1,
-0.03665138, -0.2799316, -4.559444, 0, 1, 0.9764706, 1,
-0.0361245, 0.07592412, -0.2934057, 0, 1, 0.9803922, 1,
-0.03572916, 0.8790639, 0.5753174, 0, 1, 0.9882353, 1,
-0.03529584, 1.393559, -0.2244892, 0, 1, 0.9921569, 1,
-0.03476238, -1.147336, -3.561786, 0, 1, 1, 1,
-0.03344698, 0.002753062, -1.335596, 0, 0.9921569, 1, 1,
-0.02476082, 1.54866, 1.455829, 0, 0.9882353, 1, 1,
-0.02394, -1.856051, -4.493361, 0, 0.9803922, 1, 1,
-0.02146436, 0.4738547, -0.1134792, 0, 0.9764706, 1, 1,
-0.01979397, -0.167275, -4.098645, 0, 0.9686275, 1, 1,
-0.01615355, -0.3415568, -4.363176, 0, 0.9647059, 1, 1,
-0.01225123, -1.801636, -1.303615, 0, 0.9568627, 1, 1,
-0.007662866, 0.01640064, 0.3115787, 0, 0.9529412, 1, 1,
-0.006161341, 0.7836412, 0.4983115, 0, 0.945098, 1, 1,
-0.002297603, 0.1464682, -2.162928, 0, 0.9411765, 1, 1,
-0.000565486, -0.4971945, -2.482448, 0, 0.9333333, 1, 1,
0.0002475238, 0.430998, 1.756319, 0, 0.9294118, 1, 1,
0.00144902, 0.7134436, -0.8830394, 0, 0.9215686, 1, 1,
0.002645095, 0.5694473, 0.1680524, 0, 0.9176471, 1, 1,
0.003439672, 1.187186, 0.955012, 0, 0.9098039, 1, 1,
0.005573801, -1.089569, 3.445276, 0, 0.9058824, 1, 1,
0.008055098, 1.203068, 1.024429, 0, 0.8980392, 1, 1,
0.008505037, -0.2514188, 4.469782, 0, 0.8901961, 1, 1,
0.009926355, -1.027821, 4.359354, 0, 0.8862745, 1, 1,
0.01080893, 1.413021, -4.453378, 0, 0.8784314, 1, 1,
0.0137296, -0.237261, 2.63684, 0, 0.8745098, 1, 1,
0.0149684, -0.7637247, 4.341169, 0, 0.8666667, 1, 1,
0.02159717, -1.178258, 3.007144, 0, 0.8627451, 1, 1,
0.02217961, -0.03465478, 3.380934, 0, 0.854902, 1, 1,
0.02333814, 0.5533254, 1.484423, 0, 0.8509804, 1, 1,
0.02670824, -0.370996, 3.393558, 0, 0.8431373, 1, 1,
0.03372799, -0.01473398, 3.267281, 0, 0.8392157, 1, 1,
0.04358311, 0.6858316, 0.5780455, 0, 0.8313726, 1, 1,
0.04607837, -0.1304547, 2.842319, 0, 0.827451, 1, 1,
0.04797458, -0.7491751, 3.007697, 0, 0.8196079, 1, 1,
0.05265506, 2.122354, 0.3743024, 0, 0.8156863, 1, 1,
0.05321766, 1.177405, 0.2668395, 0, 0.8078431, 1, 1,
0.05400537, 0.2543763, 1.623886, 0, 0.8039216, 1, 1,
0.05492764, -0.1516659, 5.03973, 0, 0.7960784, 1, 1,
0.05713522, 1.056986, -0.3761827, 0, 0.7882353, 1, 1,
0.06003515, -0.1421807, 0.8170906, 0, 0.7843137, 1, 1,
0.06267907, 0.5275341, -0.5557179, 0, 0.7764706, 1, 1,
0.0628516, -0.191888, 2.356007, 0, 0.772549, 1, 1,
0.06547532, 0.8483888, 0.4460445, 0, 0.7647059, 1, 1,
0.06909081, 0.6444916, 0.9606425, 0, 0.7607843, 1, 1,
0.07366464, -0.4717407, 2.055022, 0, 0.7529412, 1, 1,
0.07376786, 0.6019181, 1.276398, 0, 0.7490196, 1, 1,
0.07527569, 0.463981, -0.9802063, 0, 0.7411765, 1, 1,
0.07546942, 0.6697855, 0.5360711, 0, 0.7372549, 1, 1,
0.07719134, -1.013111, 3.72559, 0, 0.7294118, 1, 1,
0.07816108, 1.178487, -0.1517815, 0, 0.7254902, 1, 1,
0.07857145, -0.7178876, 2.601128, 0, 0.7176471, 1, 1,
0.08485062, -0.4269382, 4.116735, 0, 0.7137255, 1, 1,
0.08665881, -0.7898769, 3.58334, 0, 0.7058824, 1, 1,
0.08920375, 1.721665, 0.5754882, 0, 0.6980392, 1, 1,
0.09597699, 0.8165235, -0.4239613, 0, 0.6941177, 1, 1,
0.09732601, -0.4262019, 3.523908, 0, 0.6862745, 1, 1,
0.1008379, 0.1515819, 0.1941535, 0, 0.682353, 1, 1,
0.1009476, -0.6348752, 2.748564, 0, 0.6745098, 1, 1,
0.1041846, 1.001235, 0.3226467, 0, 0.6705883, 1, 1,
0.1049986, 1.533734, -0.3272856, 0, 0.6627451, 1, 1,
0.1075615, -0.3942606, 2.244328, 0, 0.6588235, 1, 1,
0.1080407, 0.04573822, 0.9152139, 0, 0.6509804, 1, 1,
0.1088444, -0.8333939, 3.888618, 0, 0.6470588, 1, 1,
0.1088472, 1.097204, -0.06819452, 0, 0.6392157, 1, 1,
0.1100832, 0.8744447, 1.178014, 0, 0.6352941, 1, 1,
0.1156236, 0.1102188, 1.432083, 0, 0.627451, 1, 1,
0.1179161, -0.9001865, 2.068896, 0, 0.6235294, 1, 1,
0.1194174, 0.03764108, 0.6395683, 0, 0.6156863, 1, 1,
0.1215992, 1.403126, 2.20276, 0, 0.6117647, 1, 1,
0.1229952, -1.159577, 2.421073, 0, 0.6039216, 1, 1,
0.1304635, 0.5551788, 0.4833099, 0, 0.5960785, 1, 1,
0.1336342, -1.822066, 1.938048, 0, 0.5921569, 1, 1,
0.1352037, 0.5932409, 0.7972373, 0, 0.5843138, 1, 1,
0.1374901, 0.501934, -2.259459, 0, 0.5803922, 1, 1,
0.1417645, 1.247541, 0.8487268, 0, 0.572549, 1, 1,
0.1442619, -0.9052006, 2.144872, 0, 0.5686275, 1, 1,
0.1444723, -1.084799, 2.997235, 0, 0.5607843, 1, 1,
0.1518738, 1.373789, 1.083924, 0, 0.5568628, 1, 1,
0.1527527, 0.8717609, 0.0002444259, 0, 0.5490196, 1, 1,
0.153141, 1.267373, 0.1373463, 0, 0.5450981, 1, 1,
0.1546579, -1.194647, 3.845477, 0, 0.5372549, 1, 1,
0.1546866, 0.4634918, -0.09305269, 0, 0.5333334, 1, 1,
0.1565205, -1.12895, 3.154337, 0, 0.5254902, 1, 1,
0.1596876, 0.3584845, -0.5475529, 0, 0.5215687, 1, 1,
0.1600235, 0.7965518, 0.6536127, 0, 0.5137255, 1, 1,
0.1668312, -0.9220072, 1.393649, 0, 0.509804, 1, 1,
0.1685694, 0.4353369, 1.949886, 0, 0.5019608, 1, 1,
0.1687097, -2.691619, 3.259859, 0, 0.4941176, 1, 1,
0.1696202, 1.309948, 0.3154319, 0, 0.4901961, 1, 1,
0.1716119, -0.6045207, 3.672074, 0, 0.4823529, 1, 1,
0.1720908, -0.8309618, 2.626692, 0, 0.4784314, 1, 1,
0.1725572, 1.947576, 1.717035, 0, 0.4705882, 1, 1,
0.1733473, 0.6047357, 1.105777, 0, 0.4666667, 1, 1,
0.1743513, 2.201447, 1.000714, 0, 0.4588235, 1, 1,
0.1759626, 0.9100363, 0.5438101, 0, 0.454902, 1, 1,
0.1767998, 0.8310006, -0.2832575, 0, 0.4470588, 1, 1,
0.1770074, 0.5720707, 1.903296, 0, 0.4431373, 1, 1,
0.1770504, -0.2759028, 1.855403, 0, 0.4352941, 1, 1,
0.1783213, -0.5269485, 3.472947, 0, 0.4313726, 1, 1,
0.1801548, -0.002068319, 1.876957, 0, 0.4235294, 1, 1,
0.1865305, 0.9891033, -1.137626, 0, 0.4196078, 1, 1,
0.1907781, 0.2212276, 1.050779, 0, 0.4117647, 1, 1,
0.1924408, -0.3623592, 1.856875, 0, 0.4078431, 1, 1,
0.1964099, -0.3372162, 2.615275, 0, 0.4, 1, 1,
0.1992153, -0.8016412, 2.523449, 0, 0.3921569, 1, 1,
0.199674, 1.31538, -1.042521, 0, 0.3882353, 1, 1,
0.2059201, -0.9681465, 2.812474, 0, 0.3803922, 1, 1,
0.2122842, 1.776785, -0.06294473, 0, 0.3764706, 1, 1,
0.2129289, 0.8511362, -1.589746, 0, 0.3686275, 1, 1,
0.2166895, -0.0204632, 1.609185, 0, 0.3647059, 1, 1,
0.2184504, 0.6031016, 1.079335, 0, 0.3568628, 1, 1,
0.224126, 0.2085015, -0.405807, 0, 0.3529412, 1, 1,
0.2246535, -0.6940601, 1.886381, 0, 0.345098, 1, 1,
0.2285066, -1.30112, 3.11145, 0, 0.3411765, 1, 1,
0.230363, 1.638458, 0.4264826, 0, 0.3333333, 1, 1,
0.2306007, 1.200319, 0.4713137, 0, 0.3294118, 1, 1,
0.2323378, 0.2408171, -0.5406138, 0, 0.3215686, 1, 1,
0.2337626, -0.7262927, 2.668014, 0, 0.3176471, 1, 1,
0.2354606, -0.3881743, 1.964836, 0, 0.3098039, 1, 1,
0.2383386, -0.5766264, 1.107131, 0, 0.3058824, 1, 1,
0.2453777, 1.89815, 0.5045638, 0, 0.2980392, 1, 1,
0.2460223, 1.444633, 0.5557621, 0, 0.2901961, 1, 1,
0.2467218, 0.8500033, 0.5165921, 0, 0.2862745, 1, 1,
0.2483127, -0.9176058, 2.718493, 0, 0.2784314, 1, 1,
0.2495244, -0.8716422, 3.047342, 0, 0.2745098, 1, 1,
0.2553019, -0.9190186, 4.501113, 0, 0.2666667, 1, 1,
0.2569401, -1.392214, 3.25797, 0, 0.2627451, 1, 1,
0.2598616, -0.02350286, 3.49791, 0, 0.254902, 1, 1,
0.2676472, -1.441221, 1.129499, 0, 0.2509804, 1, 1,
0.2725999, 0.3127324, 0.794426, 0, 0.2431373, 1, 1,
0.2761758, -0.1114194, 1.272066, 0, 0.2392157, 1, 1,
0.2776625, -0.4377813, 3.374181, 0, 0.2313726, 1, 1,
0.2802019, 1.033846, 0.6268665, 0, 0.227451, 1, 1,
0.2825617, -0.06040661, 1.934901, 0, 0.2196078, 1, 1,
0.2878092, -0.7397995, 4.61919, 0, 0.2156863, 1, 1,
0.2885801, 0.02217799, 1.670228, 0, 0.2078431, 1, 1,
0.2976859, 0.7255232, 2.095733, 0, 0.2039216, 1, 1,
0.3008772, 1.481536, 0.8195398, 0, 0.1960784, 1, 1,
0.3031904, -1.204753, 1.365758, 0, 0.1882353, 1, 1,
0.3047116, 1.412194, -0.3687186, 0, 0.1843137, 1, 1,
0.3072216, -0.296348, 2.72525, 0, 0.1764706, 1, 1,
0.3079054, 0.657147, 0.2604393, 0, 0.172549, 1, 1,
0.3099451, -0.2389587, 1.622579, 0, 0.1647059, 1, 1,
0.3123074, -0.9918102, 1.157383, 0, 0.1607843, 1, 1,
0.3123228, -0.1994273, 2.742395, 0, 0.1529412, 1, 1,
0.3128485, -0.4836085, 3.855797, 0, 0.1490196, 1, 1,
0.3143376, -0.3084289, 1.618663, 0, 0.1411765, 1, 1,
0.3156101, -0.5067331, 3.611954, 0, 0.1372549, 1, 1,
0.3161967, -0.03230056, 0.3694433, 0, 0.1294118, 1, 1,
0.3171355, -0.5504012, 2.364268, 0, 0.1254902, 1, 1,
0.330642, -0.4490833, 1.335985, 0, 0.1176471, 1, 1,
0.3335423, -1.817674, 1.623709, 0, 0.1137255, 1, 1,
0.3346836, -0.8772081, 1.614614, 0, 0.1058824, 1, 1,
0.3356299, -1.001136, 2.859164, 0, 0.09803922, 1, 1,
0.3444526, 0.3204113, -1.291029, 0, 0.09411765, 1, 1,
0.3446264, 0.53646, -0.9726874, 0, 0.08627451, 1, 1,
0.3456883, 0.0313231, 0.7682098, 0, 0.08235294, 1, 1,
0.3482201, 0.530156, -0.4153146, 0, 0.07450981, 1, 1,
0.34916, -1.514447, 2.616485, 0, 0.07058824, 1, 1,
0.3551097, -0.8438283, 2.113341, 0, 0.0627451, 1, 1,
0.3591174, -0.02231402, 1.989671, 0, 0.05882353, 1, 1,
0.3603264, 1.827187, -2.161931, 0, 0.05098039, 1, 1,
0.3675319, 1.75171, 0.8376474, 0, 0.04705882, 1, 1,
0.3699506, -0.5781605, 3.442748, 0, 0.03921569, 1, 1,
0.3752274, 0.4019494, 2.289045, 0, 0.03529412, 1, 1,
0.3786485, 2.29783, -1.641928, 0, 0.02745098, 1, 1,
0.3844647, 1.14659, 1.440302, 0, 0.02352941, 1, 1,
0.3850101, -1.079791, 3.06479, 0, 0.01568628, 1, 1,
0.396506, 0.6215036, -0.2297461, 0, 0.01176471, 1, 1,
0.396546, 1.509713, -1.397252, 0, 0.003921569, 1, 1,
0.3987001, -0.323405, 2.848818, 0.003921569, 0, 1, 1,
0.4019896, 0.5695665, 0.2728855, 0.007843138, 0, 1, 1,
0.4049364, 1.297571, 0.4821308, 0.01568628, 0, 1, 1,
0.4110017, 1.421728, 1.338261, 0.01960784, 0, 1, 1,
0.4145991, 0.3635218, 1.384334, 0.02745098, 0, 1, 1,
0.4155797, 0.1198114, 1.921449, 0.03137255, 0, 1, 1,
0.4182579, 0.3304259, 3.120683, 0.03921569, 0, 1, 1,
0.4188294, 1.23533, 1.283673, 0.04313726, 0, 1, 1,
0.4188322, -0.7605001, 1.475186, 0.05098039, 0, 1, 1,
0.4213776, -0.06626686, 0.757994, 0.05490196, 0, 1, 1,
0.4235095, 0.02310479, 1.853246, 0.0627451, 0, 1, 1,
0.4260896, -1.70359, 3.817616, 0.06666667, 0, 1, 1,
0.430014, -0.6518741, 0.5316885, 0.07450981, 0, 1, 1,
0.4307098, -1.002765, 2.717858, 0.07843138, 0, 1, 1,
0.4315874, -0.0394537, 3.797942, 0.08627451, 0, 1, 1,
0.4374953, -0.779384, 1.483277, 0.09019608, 0, 1, 1,
0.4387916, 0.9537172, 1.105621, 0.09803922, 0, 1, 1,
0.4391173, 1.137541, 0.3597218, 0.1058824, 0, 1, 1,
0.4395009, -1.357654, 2.144417, 0.1098039, 0, 1, 1,
0.4399078, -1.19329, 1.178132, 0.1176471, 0, 1, 1,
0.4410297, 0.1825725, 0.7126378, 0.1215686, 0, 1, 1,
0.4411258, -1.224366, 1.247978, 0.1294118, 0, 1, 1,
0.4421831, -0.09636457, 2.356274, 0.1333333, 0, 1, 1,
0.4428789, -0.383807, 1.050508, 0.1411765, 0, 1, 1,
0.4434842, 0.06688854, 1.41394, 0.145098, 0, 1, 1,
0.447699, 0.5090628, 1.568197, 0.1529412, 0, 1, 1,
0.4490716, -0.2733566, 1.765954, 0.1568628, 0, 1, 1,
0.4594814, 0.8285603, 0.8279063, 0.1647059, 0, 1, 1,
0.463018, 0.4943258, 1.686128, 0.1686275, 0, 1, 1,
0.4658702, -0.4099612, 2.578492, 0.1764706, 0, 1, 1,
0.4664097, -1.084807, 1.270872, 0.1803922, 0, 1, 1,
0.4664433, -0.7505152, 1.809323, 0.1882353, 0, 1, 1,
0.4677289, -2.37338, 1.96429, 0.1921569, 0, 1, 1,
0.4917449, -0.7739751, 1.667984, 0.2, 0, 1, 1,
0.4926598, -1.186895, 3.320268, 0.2078431, 0, 1, 1,
0.4938521, -1.388413, 2.82545, 0.2117647, 0, 1, 1,
0.4941105, -0.2605394, 2.786261, 0.2196078, 0, 1, 1,
0.4979843, 0.171031, 1.550517, 0.2235294, 0, 1, 1,
0.4983947, -1.444209, 2.373616, 0.2313726, 0, 1, 1,
0.5042368, -1.331598, 3.633718, 0.2352941, 0, 1, 1,
0.5072138, 1.071808, -0.8068597, 0.2431373, 0, 1, 1,
0.5110359, -0.2621046, 2.088768, 0.2470588, 0, 1, 1,
0.5170452, 0.5432878, 0.219118, 0.254902, 0, 1, 1,
0.5198122, -0.6437539, 2.593748, 0.2588235, 0, 1, 1,
0.521166, 0.8256732, 0.8695282, 0.2666667, 0, 1, 1,
0.5281842, -0.6505889, 1.349527, 0.2705882, 0, 1, 1,
0.5316058, 0.3597368, -0.4097665, 0.2784314, 0, 1, 1,
0.5355853, 1.148825, 1.220804, 0.282353, 0, 1, 1,
0.53646, 1.778095, 2.464501, 0.2901961, 0, 1, 1,
0.5380561, -0.5373089, 1.833113, 0.2941177, 0, 1, 1,
0.5382649, -0.4325002, 2.900309, 0.3019608, 0, 1, 1,
0.5384856, 1.100905, -1.214467, 0.3098039, 0, 1, 1,
0.5385829, -0.3693638, 3.600073, 0.3137255, 0, 1, 1,
0.5422269, 0.07963712, 1.659531, 0.3215686, 0, 1, 1,
0.5451969, -2.799767, 4.032981, 0.3254902, 0, 1, 1,
0.5474135, -0.7623655, 5.261063, 0.3333333, 0, 1, 1,
0.5476373, -0.7166625, 2.982182, 0.3372549, 0, 1, 1,
0.5478292, -0.5848524, 4.925926, 0.345098, 0, 1, 1,
0.5506142, 0.9715027, 0.01267597, 0.3490196, 0, 1, 1,
0.5556822, -0.5154546, 2.289257, 0.3568628, 0, 1, 1,
0.5669664, 1.482593, 0.5155029, 0.3607843, 0, 1, 1,
0.5765378, 0.9730293, -0.3969542, 0.3686275, 0, 1, 1,
0.5775657, -0.1586933, -0.1806392, 0.372549, 0, 1, 1,
0.5879272, -0.1455475, 0.2921532, 0.3803922, 0, 1, 1,
0.589937, 1.33578, 0.01799994, 0.3843137, 0, 1, 1,
0.590915, 0.08659198, 2.157782, 0.3921569, 0, 1, 1,
0.5911949, -0.2723633, 2.364322, 0.3960784, 0, 1, 1,
0.5913466, -0.3854763, 2.058162, 0.4039216, 0, 1, 1,
0.592421, -1.364145, 2.940493, 0.4117647, 0, 1, 1,
0.5927319, -0.06678019, 0.7541512, 0.4156863, 0, 1, 1,
0.5951462, 1.014816, 1.127337, 0.4235294, 0, 1, 1,
0.5953543, -0.1144201, 1.838963, 0.427451, 0, 1, 1,
0.5999131, -0.7237736, 3.369268, 0.4352941, 0, 1, 1,
0.6016988, -0.3569506, 3.590083, 0.4392157, 0, 1, 1,
0.6085933, 0.2483446, 1.120625, 0.4470588, 0, 1, 1,
0.6090572, 1.22479, 1.887597, 0.4509804, 0, 1, 1,
0.6115823, 1.27368, 0.6926271, 0.4588235, 0, 1, 1,
0.6116729, -0.7111005, 4.377422, 0.4627451, 0, 1, 1,
0.6129342, -1.996634, 3.780853, 0.4705882, 0, 1, 1,
0.616228, -0.1295547, 1.637715, 0.4745098, 0, 1, 1,
0.6186584, 0.9180092, -0.03405291, 0.4823529, 0, 1, 1,
0.6197749, 0.06622614, 2.335337, 0.4862745, 0, 1, 1,
0.6265643, -0.01838788, 0.1881606, 0.4941176, 0, 1, 1,
0.6274924, 0.0275557, 1.14626, 0.5019608, 0, 1, 1,
0.6284842, -0.1743536, 0.8770584, 0.5058824, 0, 1, 1,
0.6298773, -1.632003, 4.815557, 0.5137255, 0, 1, 1,
0.6336798, 1.529535, -0.6471857, 0.5176471, 0, 1, 1,
0.6355007, -0.3834801, 2.714798, 0.5254902, 0, 1, 1,
0.6358565, -0.8012746, 3.006508, 0.5294118, 0, 1, 1,
0.6397035, 0.4948098, 3.233257, 0.5372549, 0, 1, 1,
0.6400278, -2.039832, 4.06115, 0.5411765, 0, 1, 1,
0.6420552, 1.342051, 0.5274957, 0.5490196, 0, 1, 1,
0.6444918, 0.9656985, 0.6567152, 0.5529412, 0, 1, 1,
0.646639, 0.06119366, 0.2022617, 0.5607843, 0, 1, 1,
0.6537498, 1.926126, 0.7118016, 0.5647059, 0, 1, 1,
0.65469, 0.8237409, 1.87148, 0.572549, 0, 1, 1,
0.6559134, -0.38303, 1.777761, 0.5764706, 0, 1, 1,
0.6593294, 1.450086, 0.17339, 0.5843138, 0, 1, 1,
0.6595302, 1.076981, 2.874301, 0.5882353, 0, 1, 1,
0.6597851, 0.7144287, 1.638976, 0.5960785, 0, 1, 1,
0.6621143, 2.007277, -0.05035906, 0.6039216, 0, 1, 1,
0.6623339, 1.446092, 1.662968, 0.6078432, 0, 1, 1,
0.672974, -1.528854, 2.321383, 0.6156863, 0, 1, 1,
0.675101, 0.1289255, -0.5381497, 0.6196079, 0, 1, 1,
0.685042, 1.440406, 0.3261552, 0.627451, 0, 1, 1,
0.6894893, 1.121092, -0.3696165, 0.6313726, 0, 1, 1,
0.6910961, -0.5622273, -0.002897265, 0.6392157, 0, 1, 1,
0.69179, -0.8464059, 1.645839, 0.6431373, 0, 1, 1,
0.6965257, -1.313695, 3.044771, 0.6509804, 0, 1, 1,
0.6976089, 0.008606343, 0.6041316, 0.654902, 0, 1, 1,
0.6978337, -0.5961576, -0.8629279, 0.6627451, 0, 1, 1,
0.7020209, 1.44413, 1.713246, 0.6666667, 0, 1, 1,
0.7084579, 0.06508199, 0.2390276, 0.6745098, 0, 1, 1,
0.7104157, -0.8647755, 2.174747, 0.6784314, 0, 1, 1,
0.7114586, -0.4256789, 2.328862, 0.6862745, 0, 1, 1,
0.7162129, 1.391008, 0.3733779, 0.6901961, 0, 1, 1,
0.7208574, 1.630523, 1.3731, 0.6980392, 0, 1, 1,
0.7319238, 0.2678734, 2.628087, 0.7058824, 0, 1, 1,
0.7370535, 0.5097638, 0.01526321, 0.7098039, 0, 1, 1,
0.7389301, 0.02423167, 1.745379, 0.7176471, 0, 1, 1,
0.7425927, 0.6855625, 4.227361, 0.7215686, 0, 1, 1,
0.7438455, -1.295208, 4.268085, 0.7294118, 0, 1, 1,
0.7448991, 2.14878, 0.4521169, 0.7333333, 0, 1, 1,
0.7466245, -0.2914029, 0.2612773, 0.7411765, 0, 1, 1,
0.7482118, -3.006791, 3.557884, 0.7450981, 0, 1, 1,
0.7503507, -1.98986, 2.86316, 0.7529412, 0, 1, 1,
0.7504848, -2.302932, 3.737758, 0.7568628, 0, 1, 1,
0.7509608, -0.6308159, 2.183861, 0.7647059, 0, 1, 1,
0.7548306, -1.688785, 0.3755166, 0.7686275, 0, 1, 1,
0.7614948, -0.9064558, 2.668031, 0.7764706, 0, 1, 1,
0.7629294, 0.2648774, 2.814243, 0.7803922, 0, 1, 1,
0.7644235, 0.5858157, 1.095283, 0.7882353, 0, 1, 1,
0.772964, -0.7208101, 4.291807, 0.7921569, 0, 1, 1,
0.7764112, -0.1789875, 1.166755, 0.8, 0, 1, 1,
0.7864778, -0.1622375, 1.628182, 0.8078431, 0, 1, 1,
0.7886485, 1.014624, 0.7497838, 0.8117647, 0, 1, 1,
0.7892382, 0.6734986, 0.577675, 0.8196079, 0, 1, 1,
0.7897525, 1.077345, 1.480236, 0.8235294, 0, 1, 1,
0.7935188, -0.9469741, 0.7257786, 0.8313726, 0, 1, 1,
0.7950429, 0.8734383, 0.8696679, 0.8352941, 0, 1, 1,
0.7966411, -0.1966738, 4.63177, 0.8431373, 0, 1, 1,
0.7970957, -0.7056829, 2.445066, 0.8470588, 0, 1, 1,
0.798166, -0.5917457, 0.9629841, 0.854902, 0, 1, 1,
0.7982042, -0.0251123, -1.892181, 0.8588235, 0, 1, 1,
0.808391, -1.175272, 2.154888, 0.8666667, 0, 1, 1,
0.81108, 0.833713, 1.795123, 0.8705882, 0, 1, 1,
0.8117266, -0.1862686, 0.2001001, 0.8784314, 0, 1, 1,
0.8145567, 1.415107, 0.8056616, 0.8823529, 0, 1, 1,
0.8204696, 0.05975864, 1.813726, 0.8901961, 0, 1, 1,
0.8298008, -1.640679, 3.572791, 0.8941177, 0, 1, 1,
0.8360599, -0.5050101, 1.820379, 0.9019608, 0, 1, 1,
0.8379647, -1.036311, 4.090821, 0.9098039, 0, 1, 1,
0.8399629, -1.317616, 3.560192, 0.9137255, 0, 1, 1,
0.8432596, -0.8782557, 2.433809, 0.9215686, 0, 1, 1,
0.844889, -1.735418, 2.460747, 0.9254902, 0, 1, 1,
0.8493334, 0.03911735, 1.123432, 0.9333333, 0, 1, 1,
0.8539568, -0.1157517, 2.357223, 0.9372549, 0, 1, 1,
0.8594217, 0.8257971, -0.4467148, 0.945098, 0, 1, 1,
0.8641716, 0.560599, -0.3926773, 0.9490196, 0, 1, 1,
0.8733382, -0.9793748, 4.423867, 0.9568627, 0, 1, 1,
0.877827, 0.2198219, 1.584235, 0.9607843, 0, 1, 1,
0.877828, -0.5703145, 4.329225, 0.9686275, 0, 1, 1,
0.8822598, -0.08789961, 2.185032, 0.972549, 0, 1, 1,
0.8861045, 0.1228049, 1.062672, 0.9803922, 0, 1, 1,
0.8868324, 2.270955, -0.3835787, 0.9843137, 0, 1, 1,
0.8900542, 0.2527686, 0.07681855, 0.9921569, 0, 1, 1,
0.8906654, 0.05667756, 0.9862563, 0.9960784, 0, 1, 1,
0.8982531, 0.3491277, 0.3260556, 1, 0, 0.9960784, 1,
0.9085745, 1.003598, -1.009588, 1, 0, 0.9882353, 1,
0.909115, -0.403745, 1.597578, 1, 0, 0.9843137, 1,
0.9117793, 0.05237108, 2.043884, 1, 0, 0.9764706, 1,
0.9126013, 1.454335, 1.293013, 1, 0, 0.972549, 1,
0.9157493, 0.9360844, 0.2806197, 1, 0, 0.9647059, 1,
0.9158888, 1.414198, -0.2896636, 1, 0, 0.9607843, 1,
0.9184521, -0.6900039, 2.36323, 1, 0, 0.9529412, 1,
0.920676, -0.386546, 1.095082, 1, 0, 0.9490196, 1,
0.9206864, -2.378731, 4.119682, 1, 0, 0.9411765, 1,
0.9234211, 0.3626389, 1.703084, 1, 0, 0.9372549, 1,
0.933382, -1.338464, 1.873598, 1, 0, 0.9294118, 1,
0.9389688, -0.1761079, 3.145313, 1, 0, 0.9254902, 1,
0.9411272, -1.116797, 3.08573, 1, 0, 0.9176471, 1,
0.9447551, 0.3565526, 2.485761, 1, 0, 0.9137255, 1,
0.9464507, 0.9434749, 0.538616, 1, 0, 0.9058824, 1,
0.9509813, -0.003658219, 1.943638, 1, 0, 0.9019608, 1,
0.9551304, -1.870133, 3.041226, 1, 0, 0.8941177, 1,
0.9624982, -0.7058458, 3.753794, 1, 0, 0.8862745, 1,
0.9713076, -0.6577607, 1.485265, 1, 0, 0.8823529, 1,
0.97172, 0.2917302, 0.9904941, 1, 0, 0.8745098, 1,
0.9758807, 0.940748, 2.022629, 1, 0, 0.8705882, 1,
0.9781603, 1.271299, 2.628271, 1, 0, 0.8627451, 1,
0.9799436, 0.1058605, -0.4702446, 1, 0, 0.8588235, 1,
0.9836521, -0.2426586, 1.757502, 1, 0, 0.8509804, 1,
0.9850764, -1.013869, 3.410239, 1, 0, 0.8470588, 1,
0.9889046, -1.069474, 1.874306, 1, 0, 0.8392157, 1,
0.9894858, -1.156525, 1.091507, 1, 0, 0.8352941, 1,
0.9931375, -1.008305, 1.732703, 1, 0, 0.827451, 1,
0.994342, -1.098963, 2.563171, 1, 0, 0.8235294, 1,
1.006103, -0.5847207, 1.472207, 1, 0, 0.8156863, 1,
1.006312, -0.06731675, 1.796216, 1, 0, 0.8117647, 1,
1.013004, -0.1872556, 2.234816, 1, 0, 0.8039216, 1,
1.017876, 0.2818308, 0.6408478, 1, 0, 0.7960784, 1,
1.024295, 1.871331, 0.1604946, 1, 0, 0.7921569, 1,
1.037651, -0.1599147, 1.744228, 1, 0, 0.7843137, 1,
1.05082, 0.313386, 0.5214393, 1, 0, 0.7803922, 1,
1.051468, -0.2796036, 2.280892, 1, 0, 0.772549, 1,
1.057368, 1.004397, 0.9233684, 1, 0, 0.7686275, 1,
1.064485, 0.06575139, 2.989041, 1, 0, 0.7607843, 1,
1.074492, 0.8348394, -0.2363188, 1, 0, 0.7568628, 1,
1.076928, 0.7696069, 1.134094, 1, 0, 0.7490196, 1,
1.080753, 0.724111, 2.436741, 1, 0, 0.7450981, 1,
1.081398, 0.8479142, 0.9406431, 1, 0, 0.7372549, 1,
1.087238, -0.3227016, 2.174492, 1, 0, 0.7333333, 1,
1.089202, -1.005807, 1.252991, 1, 0, 0.7254902, 1,
1.09474, 0.1821445, 0.8610727, 1, 0, 0.7215686, 1,
1.095216, -1.541718, 2.666508, 1, 0, 0.7137255, 1,
1.096285, 0.009265845, 2.248882, 1, 0, 0.7098039, 1,
1.105912, -0.144647, 1.729058, 1, 0, 0.7019608, 1,
1.108107, -0.6657601, 3.021338, 1, 0, 0.6941177, 1,
1.113045, -1.790063, 3.642888, 1, 0, 0.6901961, 1,
1.121587, -0.1117474, 3.317952, 1, 0, 0.682353, 1,
1.122798, 0.2158512, 1.670745, 1, 0, 0.6784314, 1,
1.128257, -1.20152, 2.404841, 1, 0, 0.6705883, 1,
1.131771, 1.036273, -0.7535247, 1, 0, 0.6666667, 1,
1.158282, -0.03558441, 2.443117, 1, 0, 0.6588235, 1,
1.163922, 0.3971989, 1.552247, 1, 0, 0.654902, 1,
1.17319, 0.857868, 1.080153, 1, 0, 0.6470588, 1,
1.183901, 0.07980176, 2.668198, 1, 0, 0.6431373, 1,
1.18662, -2.06334, 1.21431, 1, 0, 0.6352941, 1,
1.188257, 1.097407, 0.4895872, 1, 0, 0.6313726, 1,
1.190377, 1.661251, 0.2837145, 1, 0, 0.6235294, 1,
1.192833, -0.2278001, 2.707722, 1, 0, 0.6196079, 1,
1.194703, 1.521073, -0.7295555, 1, 0, 0.6117647, 1,
1.198351, 1.101937, -0.3926313, 1, 0, 0.6078432, 1,
1.201509, 0.3419051, 0.2555244, 1, 0, 0.6, 1,
1.220515, 2.37994, -0.4404152, 1, 0, 0.5921569, 1,
1.222407, -0.06922334, 0.9312761, 1, 0, 0.5882353, 1,
1.231202, -0.3680753, 1.783267, 1, 0, 0.5803922, 1,
1.236192, 0.7672999, 0.2413313, 1, 0, 0.5764706, 1,
1.246736, -0.8030316, 0.2574925, 1, 0, 0.5686275, 1,
1.260936, 0.5070736, 0.6185772, 1, 0, 0.5647059, 1,
1.262708, 0.3133287, 2.705746, 1, 0, 0.5568628, 1,
1.268734, -0.3370207, 1.387233, 1, 0, 0.5529412, 1,
1.271828, 1.550375, 0.05722852, 1, 0, 0.5450981, 1,
1.279324, -0.5160841, 0.6824852, 1, 0, 0.5411765, 1,
1.281899, 0.346076, 1.332674, 1, 0, 0.5333334, 1,
1.283768, -0.2504671, 0.5837881, 1, 0, 0.5294118, 1,
1.289647, -0.270322, 3.497912, 1, 0, 0.5215687, 1,
1.289773, -1.582059, 2.093939, 1, 0, 0.5176471, 1,
1.292634, -0.1333489, 0.6957119, 1, 0, 0.509804, 1,
1.293746, 0.8055012, -1.262457, 1, 0, 0.5058824, 1,
1.294072, -0.3837402, 2.19183, 1, 0, 0.4980392, 1,
1.294343, 0.04597429, 1.734294, 1, 0, 0.4901961, 1,
1.297569, 0.09644024, 0.4448919, 1, 0, 0.4862745, 1,
1.304243, 0.7917755, -1.033139, 1, 0, 0.4784314, 1,
1.306581, 0.7731608, 2.568264, 1, 0, 0.4745098, 1,
1.307595, 0.05233081, 1.524456, 1, 0, 0.4666667, 1,
1.334352, -0.9368737, 1.768634, 1, 0, 0.4627451, 1,
1.338951, -0.2615258, 1.508699, 1, 0, 0.454902, 1,
1.34193, 0.1676412, 2.353021, 1, 0, 0.4509804, 1,
1.342813, -1.234302, 2.371826, 1, 0, 0.4431373, 1,
1.348556, -0.810248, 2.528666, 1, 0, 0.4392157, 1,
1.348871, -0.456032, 3.784373, 1, 0, 0.4313726, 1,
1.357197, -1.15559, 2.883164, 1, 0, 0.427451, 1,
1.359638, -0.7602011, 2.588513, 1, 0, 0.4196078, 1,
1.367527, -0.4224947, 1.590392, 1, 0, 0.4156863, 1,
1.368898, -2.117954, 0.6132066, 1, 0, 0.4078431, 1,
1.380536, 0.5506843, 1.630615, 1, 0, 0.4039216, 1,
1.389104, 0.2717385, 1.901864, 1, 0, 0.3960784, 1,
1.410197, 0.6273556, 1.070068, 1, 0, 0.3882353, 1,
1.418534, 0.3985557, -0.1371324, 1, 0, 0.3843137, 1,
1.432134, 1.357024, -0.3308341, 1, 0, 0.3764706, 1,
1.443276, 0.1488491, 1.162674, 1, 0, 0.372549, 1,
1.455424, -0.7781858, 2.87688, 1, 0, 0.3647059, 1,
1.46077, 0.9161314, 1.143062, 1, 0, 0.3607843, 1,
1.461616, 1.036652, -0.3179902, 1, 0, 0.3529412, 1,
1.490989, -0.1542478, 0.9388234, 1, 0, 0.3490196, 1,
1.500991, 0.2557757, 1.58574, 1, 0, 0.3411765, 1,
1.518186, -0.05031109, 1.709478, 1, 0, 0.3372549, 1,
1.550255, 0.07517792, 1.822602, 1, 0, 0.3294118, 1,
1.559691, 1.086515, -0.3107314, 1, 0, 0.3254902, 1,
1.568174, -0.8137215, 2.928268, 1, 0, 0.3176471, 1,
1.578649, 0.3475508, 1.33165, 1, 0, 0.3137255, 1,
1.585477, 1.524918, 0.9554037, 1, 0, 0.3058824, 1,
1.588062, 0.4391177, 0.9060444, 1, 0, 0.2980392, 1,
1.601869, 0.1823956, 1.66417, 1, 0, 0.2941177, 1,
1.602245, 1.407786, 0.3474825, 1, 0, 0.2862745, 1,
1.611236, 1.116626, 0.0587372, 1, 0, 0.282353, 1,
1.618554, -0.8089316, 2.991449, 1, 0, 0.2745098, 1,
1.625105, -0.7506111, 2.520281, 1, 0, 0.2705882, 1,
1.625767, -1.179428, 0.4474096, 1, 0, 0.2627451, 1,
1.632146, -1.370015, 4.454768, 1, 0, 0.2588235, 1,
1.656697, -0.7221618, 2.70504, 1, 0, 0.2509804, 1,
1.680665, -0.7665208, 3.548614, 1, 0, 0.2470588, 1,
1.682095, -1.828239, 3.528533, 1, 0, 0.2392157, 1,
1.687302, -0.1189837, 1.662196, 1, 0, 0.2352941, 1,
1.695956, -1.055398, 2.093801, 1, 0, 0.227451, 1,
1.696374, 0.1027951, 1.580276, 1, 0, 0.2235294, 1,
1.711189, -1.402743, 2.357651, 1, 0, 0.2156863, 1,
1.715575, 1.356005, 1.608074, 1, 0, 0.2117647, 1,
1.718842, 0.8107993, 0.4914294, 1, 0, 0.2039216, 1,
1.74446, 1.522202, 2.807719, 1, 0, 0.1960784, 1,
1.745843, -0.4917514, 2.409973, 1, 0, 0.1921569, 1,
1.76214, 0.3603673, 0.335096, 1, 0, 0.1843137, 1,
1.78065, 0.5022448, 0.623118, 1, 0, 0.1803922, 1,
1.801209, -0.2026901, 2.632527, 1, 0, 0.172549, 1,
1.824553, 0.9091908, 0.4005376, 1, 0, 0.1686275, 1,
1.83028, 1.35906, 0.6727316, 1, 0, 0.1607843, 1,
1.87748, -0.0689714, 3.121274, 1, 0, 0.1568628, 1,
1.883919, -1.301998, 1.931016, 1, 0, 0.1490196, 1,
1.895623, 0.9335897, 0.7576236, 1, 0, 0.145098, 1,
1.900416, 0.3467263, 1.757789, 1, 0, 0.1372549, 1,
1.900446, 1.380363, 1.558819, 1, 0, 0.1333333, 1,
1.915837, 1.019067, 0.317646, 1, 0, 0.1254902, 1,
1.960557, 0.3951711, 1.398783, 1, 0, 0.1215686, 1,
1.995377, -1.145058, 2.310914, 1, 0, 0.1137255, 1,
2.017405, -0.8846797, 3.135907, 1, 0, 0.1098039, 1,
2.024313, 1.355618, 0.5934914, 1, 0, 0.1019608, 1,
2.069582, 0.432121, 1.9289, 1, 0, 0.09411765, 1,
2.155246, -0.7192615, 3.206514, 1, 0, 0.09019608, 1,
2.172294, 0.5948707, 1.384031, 1, 0, 0.08235294, 1,
2.190713, 1.592882, -0.03999164, 1, 0, 0.07843138, 1,
2.257623, 0.3889166, 1.305912, 1, 0, 0.07058824, 1,
2.300241, 0.1990703, 0.08538364, 1, 0, 0.06666667, 1,
2.346264, -0.2407032, 2.417953, 1, 0, 0.05882353, 1,
2.419425, -0.7806848, 0.6116399, 1, 0, 0.05490196, 1,
2.456019, -1.751221, 0.9408234, 1, 0, 0.04705882, 1,
2.582643, 0.1546018, 2.439047, 1, 0, 0.04313726, 1,
2.609195, 0.197297, 1.563814, 1, 0, 0.03529412, 1,
2.733434, 2.200342, 0.8171894, 1, 0, 0.03137255, 1,
2.777944, -0.2323987, 0.6899403, 1, 0, 0.02352941, 1,
2.814201, 0.8769057, 2.919856, 1, 0, 0.01960784, 1,
2.914765, 0.7057675, 1.033469, 1, 0, 0.01176471, 1,
4.221685, -0.5646481, 1.748971, 1, 0, 0.007843138, 1
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
0.4816568, -4.135121, -6.883334, 0, -0.5, 0.5, 0.5,
0.4816568, -4.135121, -6.883334, 1, -0.5, 0.5, 0.5,
0.4816568, -4.135121, -6.883334, 1, 1.5, 0.5, 0.5,
0.4816568, -4.135121, -6.883334, 0, 1.5, 0.5, 0.5
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
-4.526241, -0.2160059, -6.883334, 0, -0.5, 0.5, 0.5,
-4.526241, -0.2160059, -6.883334, 1, -0.5, 0.5, 0.5,
-4.526241, -0.2160059, -6.883334, 1, 1.5, 0.5, 0.5,
-4.526241, -0.2160059, -6.883334, 0, 1.5, 0.5, 0.5
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
-4.526241, -4.135121, 0.06893063, 0, -0.5, 0.5, 0.5,
-4.526241, -4.135121, 0.06893063, 1, -0.5, 0.5, 0.5,
-4.526241, -4.135121, 0.06893063, 1, 1.5, 0.5, 0.5,
-4.526241, -4.135121, 0.06893063, 0, 1.5, 0.5, 0.5
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
-2, -3.23071, -5.278965,
4, -3.23071, -5.278965,
-2, -3.23071, -5.278965,
-2, -3.381445, -5.54636,
0, -3.23071, -5.278965,
0, -3.381445, -5.54636,
2, -3.23071, -5.278965,
2, -3.381445, -5.54636,
4, -3.23071, -5.278965,
4, -3.381445, -5.54636
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
"2",
"4"
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
-2, -3.682916, -6.08115, 0, -0.5, 0.5, 0.5,
-2, -3.682916, -6.08115, 1, -0.5, 0.5, 0.5,
-2, -3.682916, -6.08115, 1, 1.5, 0.5, 0.5,
-2, -3.682916, -6.08115, 0, 1.5, 0.5, 0.5,
0, -3.682916, -6.08115, 0, -0.5, 0.5, 0.5,
0, -3.682916, -6.08115, 1, -0.5, 0.5, 0.5,
0, -3.682916, -6.08115, 1, 1.5, 0.5, 0.5,
0, -3.682916, -6.08115, 0, 1.5, 0.5, 0.5,
2, -3.682916, -6.08115, 0, -0.5, 0.5, 0.5,
2, -3.682916, -6.08115, 1, -0.5, 0.5, 0.5,
2, -3.682916, -6.08115, 1, 1.5, 0.5, 0.5,
2, -3.682916, -6.08115, 0, 1.5, 0.5, 0.5,
4, -3.682916, -6.08115, 0, -0.5, 0.5, 0.5,
4, -3.682916, -6.08115, 1, -0.5, 0.5, 0.5,
4, -3.682916, -6.08115, 1, 1.5, 0.5, 0.5,
4, -3.682916, -6.08115, 0, 1.5, 0.5, 0.5
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
-3.370573, -3, -5.278965,
-3.370573, 2, -5.278965,
-3.370573, -3, -5.278965,
-3.563184, -3, -5.54636,
-3.370573, -2, -5.278965,
-3.563184, -2, -5.54636,
-3.370573, -1, -5.278965,
-3.563184, -1, -5.54636,
-3.370573, 0, -5.278965,
-3.563184, 0, -5.54636,
-3.370573, 1, -5.278965,
-3.563184, 1, -5.54636,
-3.370573, 2, -5.278965,
-3.563184, 2, -5.54636
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
-3.948407, -3, -6.08115, 0, -0.5, 0.5, 0.5,
-3.948407, -3, -6.08115, 1, -0.5, 0.5, 0.5,
-3.948407, -3, -6.08115, 1, 1.5, 0.5, 0.5,
-3.948407, -3, -6.08115, 0, 1.5, 0.5, 0.5,
-3.948407, -2, -6.08115, 0, -0.5, 0.5, 0.5,
-3.948407, -2, -6.08115, 1, -0.5, 0.5, 0.5,
-3.948407, -2, -6.08115, 1, 1.5, 0.5, 0.5,
-3.948407, -2, -6.08115, 0, 1.5, 0.5, 0.5,
-3.948407, -1, -6.08115, 0, -0.5, 0.5, 0.5,
-3.948407, -1, -6.08115, 1, -0.5, 0.5, 0.5,
-3.948407, -1, -6.08115, 1, 1.5, 0.5, 0.5,
-3.948407, -1, -6.08115, 0, 1.5, 0.5, 0.5,
-3.948407, 0, -6.08115, 0, -0.5, 0.5, 0.5,
-3.948407, 0, -6.08115, 1, -0.5, 0.5, 0.5,
-3.948407, 0, -6.08115, 1, 1.5, 0.5, 0.5,
-3.948407, 0, -6.08115, 0, 1.5, 0.5, 0.5,
-3.948407, 1, -6.08115, 0, -0.5, 0.5, 0.5,
-3.948407, 1, -6.08115, 1, -0.5, 0.5, 0.5,
-3.948407, 1, -6.08115, 1, 1.5, 0.5, 0.5,
-3.948407, 1, -6.08115, 0, 1.5, 0.5, 0.5,
-3.948407, 2, -6.08115, 0, -0.5, 0.5, 0.5,
-3.948407, 2, -6.08115, 1, -0.5, 0.5, 0.5,
-3.948407, 2, -6.08115, 1, 1.5, 0.5, 0.5,
-3.948407, 2, -6.08115, 0, 1.5, 0.5, 0.5
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
-3.370573, -3.23071, -4,
-3.370573, -3.23071, 4,
-3.370573, -3.23071, -4,
-3.563184, -3.381445, -4,
-3.370573, -3.23071, -2,
-3.563184, -3.381445, -2,
-3.370573, -3.23071, 0,
-3.563184, -3.381445, 0,
-3.370573, -3.23071, 2,
-3.563184, -3.381445, 2,
-3.370573, -3.23071, 4,
-3.563184, -3.381445, 4
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
-3.948407, -3.682916, -4, 0, -0.5, 0.5, 0.5,
-3.948407, -3.682916, -4, 1, -0.5, 0.5, 0.5,
-3.948407, -3.682916, -4, 1, 1.5, 0.5, 0.5,
-3.948407, -3.682916, -4, 0, 1.5, 0.5, 0.5,
-3.948407, -3.682916, -2, 0, -0.5, 0.5, 0.5,
-3.948407, -3.682916, -2, 1, -0.5, 0.5, 0.5,
-3.948407, -3.682916, -2, 1, 1.5, 0.5, 0.5,
-3.948407, -3.682916, -2, 0, 1.5, 0.5, 0.5,
-3.948407, -3.682916, 0, 0, -0.5, 0.5, 0.5,
-3.948407, -3.682916, 0, 1, -0.5, 0.5, 0.5,
-3.948407, -3.682916, 0, 1, 1.5, 0.5, 0.5,
-3.948407, -3.682916, 0, 0, 1.5, 0.5, 0.5,
-3.948407, -3.682916, 2, 0, -0.5, 0.5, 0.5,
-3.948407, -3.682916, 2, 1, -0.5, 0.5, 0.5,
-3.948407, -3.682916, 2, 1, 1.5, 0.5, 0.5,
-3.948407, -3.682916, 2, 0, 1.5, 0.5, 0.5,
-3.948407, -3.682916, 4, 0, -0.5, 0.5, 0.5,
-3.948407, -3.682916, 4, 1, -0.5, 0.5, 0.5,
-3.948407, -3.682916, 4, 1, 1.5, 0.5, 0.5,
-3.948407, -3.682916, 4, 0, 1.5, 0.5, 0.5
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
-3.370573, -3.23071, -5.278965,
-3.370573, 2.798698, -5.278965,
-3.370573, -3.23071, 5.416827,
-3.370573, 2.798698, 5.416827,
-3.370573, -3.23071, -5.278965,
-3.370573, -3.23071, 5.416827,
-3.370573, 2.798698, -5.278965,
-3.370573, 2.798698, 5.416827,
-3.370573, -3.23071, -5.278965,
4.333886, -3.23071, -5.278965,
-3.370573, -3.23071, 5.416827,
4.333886, -3.23071, 5.416827,
-3.370573, 2.798698, -5.278965,
4.333886, 2.798698, -5.278965,
-3.370573, 2.798698, 5.416827,
4.333886, 2.798698, 5.416827,
4.333886, -3.23071, -5.278965,
4.333886, 2.798698, -5.278965,
4.333886, -3.23071, 5.416827,
4.333886, 2.798698, 5.416827,
4.333886, -3.23071, -5.278965,
4.333886, -3.23071, 5.416827,
4.333886, 2.798698, -5.278965,
4.333886, 2.798698, 5.416827
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
var radius = 7.740185;
var distance = 34.43695;
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
mvMatrix.translate( -0.4816568, 0.2160059, -0.06893063 );
mvMatrix.scale( 1.086233, 1.388003, 0.7824423 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.43695);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
carboxin<-read.table("carboxin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-carboxin$V2
```

```
## Error in eval(expr, envir, enclos): object 'carboxin' not found
```

```r
y<-carboxin$V3
```

```
## Error in eval(expr, envir, enclos): object 'carboxin' not found
```

```r
z<-carboxin$V4
```

```
## Error in eval(expr, envir, enclos): object 'carboxin' not found
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
-3.258372, 0.2967333, -1.79492, 0, 0, 1, 1, 1,
-2.844387, -0.8514197, -2.507101, 1, 0, 0, 1, 1,
-2.832558, 0.2898031, -1.735284, 1, 0, 0, 1, 1,
-2.705739, -0.7824779, -2.875194, 1, 0, 0, 1, 1,
-2.537642, -0.4826233, -1.440174, 1, 0, 0, 1, 1,
-2.533811, -1.870442, -1.451007, 1, 0, 0, 1, 1,
-2.489402, 0.2342237, -1.791355, 0, 0, 0, 1, 1,
-2.418565, -2.258134, -0.9331647, 0, 0, 0, 1, 1,
-2.416463, 1.694808, 1.639837, 0, 0, 0, 1, 1,
-2.355066, 1.393737, -1.930079, 0, 0, 0, 1, 1,
-2.353444, 0.2878694, -1.072315, 0, 0, 0, 1, 1,
-2.280097, 0.8647736, -1.428007, 0, 0, 0, 1, 1,
-2.250649, -0.4075307, -1.446516, 0, 0, 0, 1, 1,
-2.181958, 0.9435512, -0.8539161, 1, 1, 1, 1, 1,
-2.163484, -1.896168, 0.3379248, 1, 1, 1, 1, 1,
-2.14745, -0.4046589, -0.5747945, 1, 1, 1, 1, 1,
-2.116756, -0.3274394, -0.8270921, 1, 1, 1, 1, 1,
-2.11095, 1.201332, -3.807487, 1, 1, 1, 1, 1,
-2.093851, -0.5262698, -2.778465, 1, 1, 1, 1, 1,
-2.091764, -1.621654, -1.109777, 1, 1, 1, 1, 1,
-2.057004, -0.718179, -1.805801, 1, 1, 1, 1, 1,
-2.015893, 1.719584, -0.5866332, 1, 1, 1, 1, 1,
-1.999713, -1.350036, -1.970769, 1, 1, 1, 1, 1,
-1.996887, -0.9563212, -3.687355, 1, 1, 1, 1, 1,
-1.985798, -1.122565, -2.157689, 1, 1, 1, 1, 1,
-1.972095, -1.394523, -1.793661, 1, 1, 1, 1, 1,
-1.965086, 0.4193507, -3.629422, 1, 1, 1, 1, 1,
-1.959687, 0.1717776, -1.770786, 1, 1, 1, 1, 1,
-1.956377, 0.07433706, -2.334223, 0, 0, 1, 1, 1,
-1.938023, -0.3477034, -2.093893, 1, 0, 0, 1, 1,
-1.91508, -0.4128297, -1.087525, 1, 0, 0, 1, 1,
-1.911137, 0.6848072, -1.897382, 1, 0, 0, 1, 1,
-1.898101, 0.1626551, -1.710208, 1, 0, 0, 1, 1,
-1.890618, 0.2964481, -1.537593, 1, 0, 0, 1, 1,
-1.886917, 1.023944, -0.2048321, 0, 0, 0, 1, 1,
-1.874803, 0.0482389, -1.582658, 0, 0, 0, 1, 1,
-1.852674, 0.8101394, -2.420168, 0, 0, 0, 1, 1,
-1.849784, -0.3750248, -1.299063, 0, 0, 0, 1, 1,
-1.778238, 1.191056, -0.03970395, 0, 0, 0, 1, 1,
-1.768278, -1.355659, -1.882577, 0, 0, 0, 1, 1,
-1.763649, 1.113214, 0.4569167, 0, 0, 0, 1, 1,
-1.75852, 0.02352971, -3.284705, 1, 1, 1, 1, 1,
-1.750954, 0.7287396, -1.057889, 1, 1, 1, 1, 1,
-1.685976, -0.09038815, -2.366686, 1, 1, 1, 1, 1,
-1.681695, -0.4085937, 0.09211629, 1, 1, 1, 1, 1,
-1.66275, -0.521931, -2.531934, 1, 1, 1, 1, 1,
-1.659084, 0.3826115, -1.916047, 1, 1, 1, 1, 1,
-1.655785, -1.724361, -1.262195, 1, 1, 1, 1, 1,
-1.655719, -0.7446637, -3.170996, 1, 1, 1, 1, 1,
-1.655169, -0.8593788, -1.045076, 1, 1, 1, 1, 1,
-1.647697, -0.8188756, -2.358707, 1, 1, 1, 1, 1,
-1.646329, 0.2258057, -1.196073, 1, 1, 1, 1, 1,
-1.645846, -1.179358, -3.187826, 1, 1, 1, 1, 1,
-1.645042, -0.5243147, -1.36018, 1, 1, 1, 1, 1,
-1.639217, 0.1620923, -1.85275, 1, 1, 1, 1, 1,
-1.638686, 0.285281, -0.4787173, 1, 1, 1, 1, 1,
-1.611302, -0.7472614, 0.05218077, 0, 0, 1, 1, 1,
-1.605361, -0.789605, -2.750922, 1, 0, 0, 1, 1,
-1.604983, -0.443553, -2.770873, 1, 0, 0, 1, 1,
-1.604655, 1.618801, 0.09596277, 1, 0, 0, 1, 1,
-1.602771, 1.960586, -1.232424, 1, 0, 0, 1, 1,
-1.601161, 1.058174, -1.82341, 1, 0, 0, 1, 1,
-1.600512, -0.2593862, -3.081095, 0, 0, 0, 1, 1,
-1.594129, -0.5899796, -2.93174, 0, 0, 0, 1, 1,
-1.570353, 0.1630733, -2.174215, 0, 0, 0, 1, 1,
-1.570094, 0.7423868, -0.540462, 0, 0, 0, 1, 1,
-1.562478, 1.787993, -1.22977, 0, 0, 0, 1, 1,
-1.558179, 0.4921187, -0.02462603, 0, 0, 0, 1, 1,
-1.546664, -1.101691, -3.508935, 0, 0, 0, 1, 1,
-1.54367, -1.816565, -2.117066, 1, 1, 1, 1, 1,
-1.538134, -0.5191864, -1.344728, 1, 1, 1, 1, 1,
-1.535722, -0.2178249, -1.11498, 1, 1, 1, 1, 1,
-1.53143, 0.5981047, 1.280302, 1, 1, 1, 1, 1,
-1.530421, 0.3351732, 0.4567797, 1, 1, 1, 1, 1,
-1.526832, 0.7352819, -1.223491, 1, 1, 1, 1, 1,
-1.521816, 0.4601279, -1.981164, 1, 1, 1, 1, 1,
-1.515808, -0.3032483, -3.0516, 1, 1, 1, 1, 1,
-1.513082, 0.9668719, -0.7612087, 1, 1, 1, 1, 1,
-1.507084, -0.6738059, -0.9454106, 1, 1, 1, 1, 1,
-1.505162, 0.4590438, -0.8317654, 1, 1, 1, 1, 1,
-1.499557, -1.664264, -1.942397, 1, 1, 1, 1, 1,
-1.495859, -0.7065526, -1.149353, 1, 1, 1, 1, 1,
-1.494934, 2.099734, -0.6298178, 1, 1, 1, 1, 1,
-1.475813, 0.1154921, -1.238029, 1, 1, 1, 1, 1,
-1.474521, 0.2523772, -0.7021381, 0, 0, 1, 1, 1,
-1.472765, -1.343073, -1.089868, 1, 0, 0, 1, 1,
-1.461713, -1.23664, -1.553759, 1, 0, 0, 1, 1,
-1.438571, -1.223326, -1.045582, 1, 0, 0, 1, 1,
-1.436448, -1.519136, -3.814162, 1, 0, 0, 1, 1,
-1.43107, -2.865972, -0.759769, 1, 0, 0, 1, 1,
-1.42865, 0.517368, -1.919105, 0, 0, 0, 1, 1,
-1.417946, -0.4359589, -1.517092, 0, 0, 0, 1, 1,
-1.398662, -1.641964, -3.250701, 0, 0, 0, 1, 1,
-1.395583, 1.189123, -1.823866, 0, 0, 0, 1, 1,
-1.393407, 1.264736, -0.1292123, 0, 0, 0, 1, 1,
-1.39005, -0.1541806, -1.165677, 0, 0, 0, 1, 1,
-1.38893, 1.148717, -1.609456, 0, 0, 0, 1, 1,
-1.387299, 0.5819243, -1.645825, 1, 1, 1, 1, 1,
-1.381715, 1.220221, -1.668497, 1, 1, 1, 1, 1,
-1.370482, -0.4899077, -1.864073, 1, 1, 1, 1, 1,
-1.367206, 1.120824, -2.692396, 1, 1, 1, 1, 1,
-1.350074, -0.06630734, -2.287803, 1, 1, 1, 1, 1,
-1.349728, -0.2235916, -1.266506, 1, 1, 1, 1, 1,
-1.347992, -1.912748, -2.022762, 1, 1, 1, 1, 1,
-1.347037, 0.8151299, -1.251971, 1, 1, 1, 1, 1,
-1.346929, 1.524409, -1.062337, 1, 1, 1, 1, 1,
-1.312055, 0.4807498, -0.4785419, 1, 1, 1, 1, 1,
-1.304914, 1.368153, -1.295246, 1, 1, 1, 1, 1,
-1.289, 0.2536298, -0.5192927, 1, 1, 1, 1, 1,
-1.285828, 0.1785499, -1.459963, 1, 1, 1, 1, 1,
-1.276743, -0.7597541, -1.476224, 1, 1, 1, 1, 1,
-1.266222, 0.5754852, -1.125402, 1, 1, 1, 1, 1,
-1.25873, 0.3977085, -2.457965, 0, 0, 1, 1, 1,
-1.250466, 0.2380383, -2.885236, 1, 0, 0, 1, 1,
-1.249529, 0.9595692, -0.8088267, 1, 0, 0, 1, 1,
-1.244909, -0.07555363, -2.003216, 1, 0, 0, 1, 1,
-1.243019, 1.660147, -1.240709, 1, 0, 0, 1, 1,
-1.237914, -0.843785, -2.708436, 1, 0, 0, 1, 1,
-1.235864, 0.2595853, -1.449039, 0, 0, 0, 1, 1,
-1.226478, -0.3821095, -1.79071, 0, 0, 0, 1, 1,
-1.225002, -0.08933722, -0.6345363, 0, 0, 0, 1, 1,
-1.224703, -1.424665, -3.256183, 0, 0, 0, 1, 1,
-1.219168, -1.31443, -2.028841, 0, 0, 0, 1, 1,
-1.217485, -0.5185217, -1.369419, 0, 0, 0, 1, 1,
-1.214312, 0.3715995, -3.144869, 0, 0, 0, 1, 1,
-1.209041, -0.2332646, -1.633447, 1, 1, 1, 1, 1,
-1.208941, -0.3953317, -3.055195, 1, 1, 1, 1, 1,
-1.208312, 1.052816, -1.127717, 1, 1, 1, 1, 1,
-1.207936, -0.1548043, -0.1735075, 1, 1, 1, 1, 1,
-1.202993, 2.040066, -0.5470707, 1, 1, 1, 1, 1,
-1.2014, -1.463199, -3.380168, 1, 1, 1, 1, 1,
-1.188408, -0.7566593, -1.669583, 1, 1, 1, 1, 1,
-1.186078, 0.8262058, -0.1629452, 1, 1, 1, 1, 1,
-1.18376, -1.005023, -2.214094, 1, 1, 1, 1, 1,
-1.169427, -1.307401, -2.567871, 1, 1, 1, 1, 1,
-1.163787, 0.8702605, -0.6992188, 1, 1, 1, 1, 1,
-1.153407, 0.60746, -0.401763, 1, 1, 1, 1, 1,
-1.152617, 1.163654, -1.378029, 1, 1, 1, 1, 1,
-1.144698, 1.258876, -0.9306946, 1, 1, 1, 1, 1,
-1.141289, 1.802298, -0.3464857, 1, 1, 1, 1, 1,
-1.138187, -1.947885, -3.384511, 0, 0, 1, 1, 1,
-1.133032, 0.7325748, -0.7432455, 1, 0, 0, 1, 1,
-1.132255, 2.184252, 0.9672394, 1, 0, 0, 1, 1,
-1.12646, -0.3596543, -2.671062, 1, 0, 0, 1, 1,
-1.12031, -0.4423301, -1.687962, 1, 0, 0, 1, 1,
-1.120208, 0.4709994, -0.9988481, 1, 0, 0, 1, 1,
-1.114622, 0.9822354, -1.476989, 0, 0, 0, 1, 1,
-1.108066, -1.070665, -2.365057, 0, 0, 0, 1, 1,
-1.107652, 0.2302924, -2.677132, 0, 0, 0, 1, 1,
-1.105733, -0.8534036, -1.228687, 0, 0, 0, 1, 1,
-1.103772, 1.428691, 0.4410998, 0, 0, 0, 1, 1,
-1.100953, 1.138806, -0.2538825, 0, 0, 0, 1, 1,
-1.100921, -0.2541017, -1.964483, 0, 0, 0, 1, 1,
-1.094413, 0.5071714, 0.02901378, 1, 1, 1, 1, 1,
-1.090466, -0.9691855, -0.6156814, 1, 1, 1, 1, 1,
-1.087664, 0.2287441, -2.26577, 1, 1, 1, 1, 1,
-1.086578, 0.8611807, -0.9205282, 1, 1, 1, 1, 1,
-1.07974, 0.554095, -0.2607041, 1, 1, 1, 1, 1,
-1.077263, 0.2267773, -2.362453, 1, 1, 1, 1, 1,
-1.070539, -0.2484903, -2.052199, 1, 1, 1, 1, 1,
-1.068215, 1.366916, -1.327477, 1, 1, 1, 1, 1,
-1.067105, 0.08158732, -4.151027, 1, 1, 1, 1, 1,
-1.051682, 1.037995, -1.2421, 1, 1, 1, 1, 1,
-1.044371, -0.8703465, -0.8948722, 1, 1, 1, 1, 1,
-1.042623, -2.056287, -3.987257, 1, 1, 1, 1, 1,
-1.03782, -0.6294751, -3.493444, 1, 1, 1, 1, 1,
-1.029753, -0.5981888, -2.699008, 1, 1, 1, 1, 1,
-1.027969, -0.4778197, -2.682428, 1, 1, 1, 1, 1,
-1.027372, 0.2206856, -0.3861455, 0, 0, 1, 1, 1,
-1.026128, 2.333302, -0.6617797, 1, 0, 0, 1, 1,
-1.025877, -0.6239042, -3.059392, 1, 0, 0, 1, 1,
-1.021787, 2.077744, -0.04018819, 1, 0, 0, 1, 1,
-1.018928, 0.3120707, -1.518819, 1, 0, 0, 1, 1,
-1.013093, -0.1646585, -1.295436, 1, 0, 0, 1, 1,
-1.011658, 0.6305863, -0.7889455, 0, 0, 0, 1, 1,
-1.005418, -0.2441299, -2.424379, 0, 0, 0, 1, 1,
-1.004897, 0.7087636, -0.2979081, 0, 0, 0, 1, 1,
-0.9991013, 0.53102, -1.598934, 0, 0, 0, 1, 1,
-0.9977474, -1.406019, -2.612552, 0, 0, 0, 1, 1,
-0.9968535, 0.9598856, -0.9012443, 0, 0, 0, 1, 1,
-0.9912027, -0.9318442, -2.972414, 0, 0, 0, 1, 1,
-0.9903477, 0.7362757, 0.4135478, 1, 1, 1, 1, 1,
-0.9898693, -1.40089, -2.272331, 1, 1, 1, 1, 1,
-0.982381, 0.5559978, -0.01135768, 1, 1, 1, 1, 1,
-0.978035, -0.3936048, -2.255921, 1, 1, 1, 1, 1,
-0.9741888, 1.349754, -1.048899, 1, 1, 1, 1, 1,
-0.9737105, 0.5895455, -0.5394344, 1, 1, 1, 1, 1,
-0.9650698, 0.5003764, -0.9964504, 1, 1, 1, 1, 1,
-0.9579837, 0.296432, -1.435229, 1, 1, 1, 1, 1,
-0.9541603, 0.2065009, -0.8307406, 1, 1, 1, 1, 1,
-0.951346, -0.7254897, -1.979459, 1, 1, 1, 1, 1,
-0.9483731, -0.5407655, -0.9276024, 1, 1, 1, 1, 1,
-0.9446484, -1.28774, -3.062799, 1, 1, 1, 1, 1,
-0.9445123, -1.047072, -2.500497, 1, 1, 1, 1, 1,
-0.9438947, 0.4598592, -1.872377, 1, 1, 1, 1, 1,
-0.9437389, -1.888694, -3.859568, 1, 1, 1, 1, 1,
-0.9401021, 0.8171856, -1.563169, 0, 0, 1, 1, 1,
-0.9345131, -0.900825, -1.43397, 1, 0, 0, 1, 1,
-0.9317272, 0.1982498, -2.488037, 1, 0, 0, 1, 1,
-0.9313554, -0.3115058, -2.509826, 1, 0, 0, 1, 1,
-0.9185567, 0.1483487, -1.825986, 1, 0, 0, 1, 1,
-0.9166603, 0.1917891, -1.540171, 1, 0, 0, 1, 1,
-0.9152113, 1.005522, -0.3943923, 0, 0, 0, 1, 1,
-0.9128442, -2.267395, -3.895846, 0, 0, 0, 1, 1,
-0.9058207, 0.1851894, -0.3194918, 0, 0, 0, 1, 1,
-0.9057964, 0.1880029, -2.087408, 0, 0, 0, 1, 1,
-0.9041353, -0.4364219, -4.092565, 0, 0, 0, 1, 1,
-0.8997399, 0.526556, -1.666504, 0, 0, 0, 1, 1,
-0.8981672, -0.3310236, -1.4729, 0, 0, 0, 1, 1,
-0.8911062, 1.164116, -1.596713, 1, 1, 1, 1, 1,
-0.8869399, -0.2401324, -0.2570697, 1, 1, 1, 1, 1,
-0.8831756, -1.872553, -3.693588, 1, 1, 1, 1, 1,
-0.8726622, 0.3344191, -2.807093, 1, 1, 1, 1, 1,
-0.8656579, 0.7640431, 0.1922061, 1, 1, 1, 1, 1,
-0.862978, 2.465661, -0.2143192, 1, 1, 1, 1, 1,
-0.8621299, -1.155008, -3.306023, 1, 1, 1, 1, 1,
-0.8534901, -0.4138261, -3.173775, 1, 1, 1, 1, 1,
-0.8510331, -1.376623, -4.080997, 1, 1, 1, 1, 1,
-0.8506441, 0.04530634, -2.339201, 1, 1, 1, 1, 1,
-0.8399007, 0.8742537, 0.3991107, 1, 1, 1, 1, 1,
-0.8265838, 1.812759, -2.114047, 1, 1, 1, 1, 1,
-0.8249875, -0.1088104, 0.03814048, 1, 1, 1, 1, 1,
-0.8178455, -1.41739, -1.124331, 1, 1, 1, 1, 1,
-0.8177312, -0.6871428, -2.23848, 1, 1, 1, 1, 1,
-0.8100529, -0.2227058, -0.3291448, 0, 0, 1, 1, 1,
-0.8082684, 0.4666488, -1.132061, 1, 0, 0, 1, 1,
-0.794216, 0.0646612, -1.78473, 1, 0, 0, 1, 1,
-0.7934604, -1.996846, -3.747731, 1, 0, 0, 1, 1,
-0.7920903, 1.262648, -1.453437, 1, 0, 0, 1, 1,
-0.7904823, -1.29098, -0.8219587, 1, 0, 0, 1, 1,
-0.7880329, -0.4132681, -1.021816, 0, 0, 0, 1, 1,
-0.7862807, -0.2695581, -0.9476002, 0, 0, 0, 1, 1,
-0.7815626, 0.4405489, -1.230444, 0, 0, 0, 1, 1,
-0.7765191, 0.0009785275, -0.4594619, 0, 0, 0, 1, 1,
-0.7708837, -0.03887545, -1.493624, 0, 0, 0, 1, 1,
-0.7694959, -1.376309, -1.993775, 0, 0, 0, 1, 1,
-0.767689, 0.2464347, -2.204844, 0, 0, 0, 1, 1,
-0.7637431, 0.9646839, -0.8857458, 1, 1, 1, 1, 1,
-0.7619964, 1.091241, -1.239538, 1, 1, 1, 1, 1,
-0.7615868, 0.9078643, -0.1171411, 1, 1, 1, 1, 1,
-0.7522011, -1.046898, -2.050701, 1, 1, 1, 1, 1,
-0.7518893, 0.2186922, -1.847011, 1, 1, 1, 1, 1,
-0.750935, 0.5143734, -0.7937508, 1, 1, 1, 1, 1,
-0.7384772, -0.1666936, -2.298441, 1, 1, 1, 1, 1,
-0.7365072, -1.602808, -2.608734, 1, 1, 1, 1, 1,
-0.7301473, -1.844212, -3.076807, 1, 1, 1, 1, 1,
-0.7101918, -0.0004835427, -0.664575, 1, 1, 1, 1, 1,
-0.7096835, 0.6495904, -0.9336902, 1, 1, 1, 1, 1,
-0.7034882, -0.8612432, -2.564943, 1, 1, 1, 1, 1,
-0.7015773, -1.749424, -1.569806, 1, 1, 1, 1, 1,
-0.7011873, -2.650774, -1.742772, 1, 1, 1, 1, 1,
-0.7008263, 1.024822, -0.3033431, 1, 1, 1, 1, 1,
-0.6994879, -0.7775978, -1.902478, 0, 0, 1, 1, 1,
-0.6982843, -0.6401507, -0.9193417, 1, 0, 0, 1, 1,
-0.6949109, 2.175196, 1.861583, 1, 0, 0, 1, 1,
-0.6901442, -2.780997, -3.14401, 1, 0, 0, 1, 1,
-0.6849185, 0.5321574, -1.309265, 1, 0, 0, 1, 1,
-0.6848172, 0.08496975, -2.682825, 1, 0, 0, 1, 1,
-0.681506, -2.041774, -2.172499, 0, 0, 0, 1, 1,
-0.6796463, -0.8956094, -3.917608, 0, 0, 0, 1, 1,
-0.6754565, -1.475302, -4.787635, 0, 0, 0, 1, 1,
-0.6710637, 1.161433, 0.3943983, 0, 0, 0, 1, 1,
-0.6696717, -1.954648, -2.947563, 0, 0, 0, 1, 1,
-0.668899, 0.4510618, -2.077114, 0, 0, 0, 1, 1,
-0.6641805, 0.5987184, -0.8227907, 0, 0, 0, 1, 1,
-0.6626906, 1.135262, -1.311442, 1, 1, 1, 1, 1,
-0.6599675, 0.1224063, 1.334953, 1, 1, 1, 1, 1,
-0.6583475, -0.9480301, -3.40348, 1, 1, 1, 1, 1,
-0.6438076, 0.446003, -0.8363831, 1, 1, 1, 1, 1,
-0.6438014, 0.8645427, -2.370136, 1, 1, 1, 1, 1,
-0.6390873, 1.956336, -0.6326362, 1, 1, 1, 1, 1,
-0.6330071, -0.6765082, -2.566506, 1, 1, 1, 1, 1,
-0.6266722, -0.4346052, -2.992553, 1, 1, 1, 1, 1,
-0.621168, -0.8808509, -3.555797, 1, 1, 1, 1, 1,
-0.6167108, -0.39331, -2.62114, 1, 1, 1, 1, 1,
-0.6166783, 0.4786752, -0.7014414, 1, 1, 1, 1, 1,
-0.6125435, 0.3633326, -0.2137114, 1, 1, 1, 1, 1,
-0.6109267, 0.5652353, -1.338728, 1, 1, 1, 1, 1,
-0.6098815, 0.3361052, -1.251763, 1, 1, 1, 1, 1,
-0.6046383, 1.373057, -0.617335, 1, 1, 1, 1, 1,
-0.6025522, -1.292411, -2.202144, 0, 0, 1, 1, 1,
-0.5960687, 1.439655, -0.5308539, 1, 0, 0, 1, 1,
-0.5922706, 0.2233306, 0.3002412, 1, 0, 0, 1, 1,
-0.5896686, 0.4813555, -0.1779511, 1, 0, 0, 1, 1,
-0.5868847, -1.504276, -2.405647, 1, 0, 0, 1, 1,
-0.5851164, 1.006217, -0.365808, 1, 0, 0, 1, 1,
-0.5812294, 1.101427, 1.117983, 0, 0, 0, 1, 1,
-0.5786873, -1.227455, -3.68557, 0, 0, 0, 1, 1,
-0.5785376, -1.375135, -2.888797, 0, 0, 0, 1, 1,
-0.5769624, -1.03518, -1.530903, 0, 0, 0, 1, 1,
-0.5766245, -0.5798571, -3.344952, 0, 0, 0, 1, 1,
-0.5741292, 0.5891687, -0.6403088, 0, 0, 0, 1, 1,
-0.5676106, -0.7617525, -2.558228, 0, 0, 0, 1, 1,
-0.5644293, -0.7020004, -3.098311, 1, 1, 1, 1, 1,
-0.5607344, -3.142903, -2.814362, 1, 1, 1, 1, 1,
-0.5578672, 1.007132, 0.2634007, 1, 1, 1, 1, 1,
-0.5570263, 0.5012912, -1.427993, 1, 1, 1, 1, 1,
-0.5554612, -0.007522613, -1.03202, 1, 1, 1, 1, 1,
-0.5527795, -0.5431231, -2.402787, 1, 1, 1, 1, 1,
-0.550017, -0.9656905, -2.273684, 1, 1, 1, 1, 1,
-0.5465791, -0.2204383, -2.794693, 1, 1, 1, 1, 1,
-0.5386288, -0.5684621, -3.348226, 1, 1, 1, 1, 1,
-0.5364518, -1.257308, -2.617183, 1, 1, 1, 1, 1,
-0.5352639, -0.2071193, -1.896873, 1, 1, 1, 1, 1,
-0.5327451, 1.065813, -0.2564628, 1, 1, 1, 1, 1,
-0.5306102, -0.1442758, 0.2336899, 1, 1, 1, 1, 1,
-0.5273046, -1.097406, -2.421026, 1, 1, 1, 1, 1,
-0.5251174, -0.2107273, -3.542584, 1, 1, 1, 1, 1,
-0.5179358, 0.4731071, -2.191567, 0, 0, 1, 1, 1,
-0.517156, 0.328036, -3.08692, 1, 0, 0, 1, 1,
-0.5136355, 0.2982804, -1.006139, 1, 0, 0, 1, 1,
-0.5116635, 0.01132352, -0.7156453, 1, 0, 0, 1, 1,
-0.5116216, -1.5847, -2.695314, 1, 0, 0, 1, 1,
-0.5097541, 0.5569261, 0.91869, 1, 0, 0, 1, 1,
-0.5080105, -0.2779491, -3.12913, 0, 0, 0, 1, 1,
-0.5069708, 0.9048415, -0.4914278, 0, 0, 0, 1, 1,
-0.5036799, 0.9397687, -0.645812, 0, 0, 0, 1, 1,
-0.5007787, 0.9459794, -1.626345, 0, 0, 0, 1, 1,
-0.4998976, 0.6437095, -0.08249951, 0, 0, 0, 1, 1,
-0.4953196, 2.710891, 0.1180334, 0, 0, 0, 1, 1,
-0.4949283, -0.2765667, -3.361139, 0, 0, 0, 1, 1,
-0.494102, -0.3358028, -2.419271, 1, 1, 1, 1, 1,
-0.492297, 1.092126, 0.9452608, 1, 1, 1, 1, 1,
-0.4916874, -0.8387516, -1.289668, 1, 1, 1, 1, 1,
-0.4914448, 0.330832, -0.7285572, 1, 1, 1, 1, 1,
-0.4848418, 0.07651865, -2.699255, 1, 1, 1, 1, 1,
-0.4791226, -2.165012, -3.37956, 1, 1, 1, 1, 1,
-0.4754994, 1.004983, -1.450928, 1, 1, 1, 1, 1,
-0.4720294, -1.24354, -3.909697, 1, 1, 1, 1, 1,
-0.4688773, 1.401415, -0.3997821, 1, 1, 1, 1, 1,
-0.4667322, 0.8027639, -0.2217547, 1, 1, 1, 1, 1,
-0.4652155, -0.9556063, -1.518451, 1, 1, 1, 1, 1,
-0.4651836, -0.05408764, -3.629385, 1, 1, 1, 1, 1,
-0.4624738, -0.6665103, -3.890997, 1, 1, 1, 1, 1,
-0.4605959, -1.28625, -2.359383, 1, 1, 1, 1, 1,
-0.4605583, -1.529256, -2.884333, 1, 1, 1, 1, 1,
-0.4561576, 0.3685082, -0.605653, 0, 0, 1, 1, 1,
-0.4505959, 0.3545155, -1.569401, 1, 0, 0, 1, 1,
-0.4458744, -0.3792325, -2.614453, 1, 0, 0, 1, 1,
-0.4415664, 1.721608, -0.2259403, 1, 0, 0, 1, 1,
-0.43944, -0.1694881, -0.05723349, 1, 0, 0, 1, 1,
-0.4384845, -0.33361, -3.087037, 1, 0, 0, 1, 1,
-0.4379372, 0.3964852, -0.4841672, 0, 0, 0, 1, 1,
-0.4370081, 0.8718112, 0.5102385, 0, 0, 0, 1, 1,
-0.427082, 1.435906, 1.940322, 0, 0, 0, 1, 1,
-0.4256512, 0.1775112, -0.617198, 0, 0, 0, 1, 1,
-0.4187934, 0.05091011, 0.3875965, 0, 0, 0, 1, 1,
-0.4059539, -0.8436478, -1.24079, 0, 0, 0, 1, 1,
-0.4049189, 1.450603, -0.8385358, 0, 0, 0, 1, 1,
-0.4040345, 0.3366182, -2.965524, 1, 1, 1, 1, 1,
-0.402923, 0.1590797, 0.04103027, 1, 1, 1, 1, 1,
-0.4006088, 0.5058203, -1.328137, 1, 1, 1, 1, 1,
-0.400013, 0.004713083, -1.849197, 1, 1, 1, 1, 1,
-0.3985273, -1.350372, -1.081082, 1, 1, 1, 1, 1,
-0.3984835, 0.9303379, -0.9543979, 1, 1, 1, 1, 1,
-0.3983012, -0.7532567, -0.5922555, 1, 1, 1, 1, 1,
-0.3909574, 1.034871, -1.127781, 1, 1, 1, 1, 1,
-0.3900143, 1.704944, -0.2182395, 1, 1, 1, 1, 1,
-0.386525, -0.8817732, -4.515346, 1, 1, 1, 1, 1,
-0.3862503, -1.937414, -3.547331, 1, 1, 1, 1, 1,
-0.3843816, -1.867448, -1.836907, 1, 1, 1, 1, 1,
-0.3799099, 1.372613, -0.5722051, 1, 1, 1, 1, 1,
-0.3761217, 0.7545686, 1.088369, 1, 1, 1, 1, 1,
-0.3720655, -0.7676997, -2.788155, 1, 1, 1, 1, 1,
-0.3718037, -0.1519659, -2.80846, 0, 0, 1, 1, 1,
-0.3709936, -0.3151867, -1.858406, 1, 0, 0, 1, 1,
-0.3707448, 0.7129931, 1.058921, 1, 0, 0, 1, 1,
-0.3642316, 0.9995784, 0.8637815, 1, 0, 0, 1, 1,
-0.3632733, 1.953209, -0.01488504, 1, 0, 0, 1, 1,
-0.3618653, 0.7336261, -1.477716, 1, 0, 0, 1, 1,
-0.3603849, -0.1520186, -3.622418, 0, 0, 0, 1, 1,
-0.3599331, -0.779507, -2.557522, 0, 0, 0, 1, 1,
-0.3589592, 1.798157, 0.2712582, 0, 0, 0, 1, 1,
-0.3586006, -0.4547631, -0.2086852, 0, 0, 0, 1, 1,
-0.3577202, -1.569336, -0.9878814, 0, 0, 0, 1, 1,
-0.3543792, -0.6174085, -2.309022, 0, 0, 0, 1, 1,
-0.3530217, 0.1991817, 0.4379021, 0, 0, 0, 1, 1,
-0.3501695, -0.2985829, -3.704023, 1, 1, 1, 1, 1,
-0.342842, 0.3621119, 1.046294, 1, 1, 1, 1, 1,
-0.3376758, -1.201466, -2.721466, 1, 1, 1, 1, 1,
-0.3287702, 0.3621703, -2.175005, 1, 1, 1, 1, 1,
-0.3280539, -0.451524, -2.492914, 1, 1, 1, 1, 1,
-0.3239904, 1.06505, -1.453781, 1, 1, 1, 1, 1,
-0.3190244, -0.3439153, -2.952876, 1, 1, 1, 1, 1,
-0.3184702, 1.541775, -1.572683, 1, 1, 1, 1, 1,
-0.3178856, -0.9839951, -2.394642, 1, 1, 1, 1, 1,
-0.3073218, 1.265702, -0.7575728, 1, 1, 1, 1, 1,
-0.3027185, 0.7499321, 0.1802134, 1, 1, 1, 1, 1,
-0.302651, -0.7683127, -3.946832, 1, 1, 1, 1, 1,
-0.3007463, -0.7061813, -2.048784, 1, 1, 1, 1, 1,
-0.2968588, 0.8215725, -1.580128, 1, 1, 1, 1, 1,
-0.2958985, 0.3502154, 0.7387236, 1, 1, 1, 1, 1,
-0.2944087, -2.02041, -0.7795448, 0, 0, 1, 1, 1,
-0.2923607, 2.32914, 0.1040233, 1, 0, 0, 1, 1,
-0.291723, -1.812728, -1.344897, 1, 0, 0, 1, 1,
-0.2906768, -0.3904921, -2.354208, 1, 0, 0, 1, 1,
-0.2879066, -2.672189, -2.721964, 1, 0, 0, 1, 1,
-0.283648, 0.08977014, -0.8315063, 1, 0, 0, 1, 1,
-0.2797485, 0.9703311, -0.991496, 0, 0, 0, 1, 1,
-0.2759045, 1.259172, -2.036909, 0, 0, 0, 1, 1,
-0.2743402, 0.8672625, -1.680469, 0, 0, 0, 1, 1,
-0.2724778, -0.4059352, -2.312114, 0, 0, 0, 1, 1,
-0.2707937, -0.2484714, -2.786415, 0, 0, 0, 1, 1,
-0.269576, 0.05179864, -1.460701, 0, 0, 0, 1, 1,
-0.2679316, 0.2351054, -0.01535891, 0, 0, 0, 1, 1,
-0.2629535, -0.7727135, -3.528422, 1, 1, 1, 1, 1,
-0.2628673, 0.8186734, -0.3318604, 1, 1, 1, 1, 1,
-0.2622133, -1.15911, -2.402523, 1, 1, 1, 1, 1,
-0.2596275, 1.147479, -0.6379862, 1, 1, 1, 1, 1,
-0.2481318, -1.40903, -3.282134, 1, 1, 1, 1, 1,
-0.2441634, -0.7991235, -0.9104667, 1, 1, 1, 1, 1,
-0.239503, -0.71839, -3.249349, 1, 1, 1, 1, 1,
-0.2392363, 1.527952, 0.5112003, 1, 1, 1, 1, 1,
-0.2383859, 1.71782, 0.5929895, 1, 1, 1, 1, 1,
-0.2296883, 1.863382, -1.039079, 1, 1, 1, 1, 1,
-0.2286608, -0.2070734, -2.073379, 1, 1, 1, 1, 1,
-0.2247619, 0.07126472, -1.383818, 1, 1, 1, 1, 1,
-0.2246568, -1.53577, -3.56824, 1, 1, 1, 1, 1,
-0.2239871, 0.1446328, -0.2687123, 1, 1, 1, 1, 1,
-0.2238632, 0.4176029, -0.3720779, 1, 1, 1, 1, 1,
-0.2238573, 0.5912121, -1.139609, 0, 0, 1, 1, 1,
-0.2224021, -2.349372, -4.16184, 1, 0, 0, 1, 1,
-0.2209759, -0.3562354, -3.254543, 1, 0, 0, 1, 1,
-0.2187026, -1.291868, -2.62404, 1, 0, 0, 1, 1,
-0.214685, 0.2314784, -2.090074, 1, 0, 0, 1, 1,
-0.2137398, -1.598717, -4.707336, 1, 0, 0, 1, 1,
-0.2099857, -0.2157981, -4.07876, 0, 0, 0, 1, 1,
-0.1986463, -0.2525992, -1.528043, 0, 0, 0, 1, 1,
-0.1974227, -0.8981224, -2.941285, 0, 0, 0, 1, 1,
-0.1912531, -0.8543568, -2.007335, 0, 0, 0, 1, 1,
-0.1883942, 0.11516, -2.219052, 0, 0, 0, 1, 1,
-0.1818444, -0.7241893, -4.604819, 0, 0, 0, 1, 1,
-0.1774238, -1.472352, -1.213239, 0, 0, 0, 1, 1,
-0.1729046, -0.1113718, -1.89939, 1, 1, 1, 1, 1,
-0.171949, -0.7890558, -2.656904, 1, 1, 1, 1, 1,
-0.1705955, -1.083631, -1.200998, 1, 1, 1, 1, 1,
-0.16991, -1.766726, -5.010392, 1, 1, 1, 1, 1,
-0.16955, 1.342998, 0.126346, 1, 1, 1, 1, 1,
-0.1623648, -0.3017697, -1.88892, 1, 1, 1, 1, 1,
-0.1620283, 1.645241, -1.258282, 1, 1, 1, 1, 1,
-0.1614504, -0.1929128, 0.1131924, 1, 1, 1, 1, 1,
-0.1603891, -0.5738124, -1.14651, 1, 1, 1, 1, 1,
-0.1568558, 0.9316002, -0.2666951, 1, 1, 1, 1, 1,
-0.1546137, -1.783285, -3.880911, 1, 1, 1, 1, 1,
-0.1529095, 2.005005, -0.2539732, 1, 1, 1, 1, 1,
-0.1521531, -0.01052322, -2.086155, 1, 1, 1, 1, 1,
-0.1519775, 0.7546769, -0.04520853, 1, 1, 1, 1, 1,
-0.1506265, -1.959094, -3.392778, 1, 1, 1, 1, 1,
-0.1505119, 0.8740967, -0.007580178, 0, 0, 1, 1, 1,
-0.146588, 0.6002792, -0.7951067, 1, 0, 0, 1, 1,
-0.1462989, -1.354467, -4.070604, 1, 0, 0, 1, 1,
-0.1391178, -1.501362, -4.54346, 1, 0, 0, 1, 1,
-0.1387692, 1.131246, 0.2320696, 1, 0, 0, 1, 1,
-0.1382689, -0.7276745, -2.291824, 1, 0, 0, 1, 1,
-0.1315977, -0.1997904, -3.272001, 0, 0, 0, 1, 1,
-0.1311358, -0.3327219, -2.563652, 0, 0, 0, 1, 1,
-0.1297144, 0.6392449, 0.04801836, 0, 0, 0, 1, 1,
-0.1278934, 0.7552143, -0.8306348, 0, 0, 0, 1, 1,
-0.1205029, -2.572063, -3.089516, 0, 0, 0, 1, 1,
-0.1150182, 1.432411, 0.6523411, 0, 0, 0, 1, 1,
-0.1113596, -1.723115, -3.693921, 0, 0, 0, 1, 1,
-0.1072902, -1.194033, -3.934567, 1, 1, 1, 1, 1,
-0.1072606, 2.19624, 0.6193705, 1, 1, 1, 1, 1,
-0.1059178, -0.7904971, -3.783426, 1, 1, 1, 1, 1,
-0.1050119, -0.2923752, -1.001057, 1, 1, 1, 1, 1,
-0.09333731, -1.003568, -0.966356, 1, 1, 1, 1, 1,
-0.09058248, -0.5902306, -2.849098, 1, 1, 1, 1, 1,
-0.09022143, -0.8484448, -5.123201, 1, 1, 1, 1, 1,
-0.0893548, 0.4913904, -0.4370464, 1, 1, 1, 1, 1,
-0.08663992, 1.261225, -0.5182325, 1, 1, 1, 1, 1,
-0.08301637, 0.2372395, -0.3036886, 1, 1, 1, 1, 1,
-0.08140875, -0.2846144, -2.882762, 1, 1, 1, 1, 1,
-0.07841726, -0.9146768, -3.469923, 1, 1, 1, 1, 1,
-0.07757214, -0.5560225, -4.443681, 1, 1, 1, 1, 1,
-0.07689883, -0.3538313, -2.477183, 1, 1, 1, 1, 1,
-0.07596295, 0.1639069, -0.4076939, 1, 1, 1, 1, 1,
-0.07306974, 0.5573049, -0.7262785, 0, 0, 1, 1, 1,
-0.07249118, 0.2128842, 0.1189841, 1, 0, 0, 1, 1,
-0.0723547, 0.7933671, 1.370314, 1, 0, 0, 1, 1,
-0.06948027, 0.1785592, 1.023471, 1, 0, 0, 1, 1,
-0.06804246, 0.8515342, -1.510378, 1, 0, 0, 1, 1,
-0.06604412, 0.626992, -1.420088, 1, 0, 0, 1, 1,
-0.06439331, 0.3884873, 1.472062, 0, 0, 0, 1, 1,
-0.06040604, 1.270429, -0.9237929, 0, 0, 0, 1, 1,
-0.05950874, -1.113351, -2.825752, 0, 0, 0, 1, 1,
-0.05776, -1.748958, -3.555681, 0, 0, 0, 1, 1,
-0.05232349, -0.9266093, -1.57988, 0, 0, 0, 1, 1,
-0.048825, 0.17799, -0.8944022, 0, 0, 0, 1, 1,
-0.0486645, 0.6491942, -0.2155594, 0, 0, 0, 1, 1,
-0.0484953, -0.3489603, -2.223132, 1, 1, 1, 1, 1,
-0.04847254, 1.626039, -0.0496995, 1, 1, 1, 1, 1,
-0.04846865, -0.4266372, -2.555043, 1, 1, 1, 1, 1,
-0.04517586, 0.1344446, -1.021071, 1, 1, 1, 1, 1,
-0.04251849, -0.4590152, -3.29695, 1, 1, 1, 1, 1,
-0.03835168, 0.8465163, 0.573672, 1, 1, 1, 1, 1,
-0.03700429, 0.6870933, 0.4816657, 1, 1, 1, 1, 1,
-0.03665138, -0.2799316, -4.559444, 1, 1, 1, 1, 1,
-0.0361245, 0.07592412, -0.2934057, 1, 1, 1, 1, 1,
-0.03572916, 0.8790639, 0.5753174, 1, 1, 1, 1, 1,
-0.03529584, 1.393559, -0.2244892, 1, 1, 1, 1, 1,
-0.03476238, -1.147336, -3.561786, 1, 1, 1, 1, 1,
-0.03344698, 0.002753062, -1.335596, 1, 1, 1, 1, 1,
-0.02476082, 1.54866, 1.455829, 1, 1, 1, 1, 1,
-0.02394, -1.856051, -4.493361, 1, 1, 1, 1, 1,
-0.02146436, 0.4738547, -0.1134792, 0, 0, 1, 1, 1,
-0.01979397, -0.167275, -4.098645, 1, 0, 0, 1, 1,
-0.01615355, -0.3415568, -4.363176, 1, 0, 0, 1, 1,
-0.01225123, -1.801636, -1.303615, 1, 0, 0, 1, 1,
-0.007662866, 0.01640064, 0.3115787, 1, 0, 0, 1, 1,
-0.006161341, 0.7836412, 0.4983115, 1, 0, 0, 1, 1,
-0.002297603, 0.1464682, -2.162928, 0, 0, 0, 1, 1,
-0.000565486, -0.4971945, -2.482448, 0, 0, 0, 1, 1,
0.0002475238, 0.430998, 1.756319, 0, 0, 0, 1, 1,
0.00144902, 0.7134436, -0.8830394, 0, 0, 0, 1, 1,
0.002645095, 0.5694473, 0.1680524, 0, 0, 0, 1, 1,
0.003439672, 1.187186, 0.955012, 0, 0, 0, 1, 1,
0.005573801, -1.089569, 3.445276, 0, 0, 0, 1, 1,
0.008055098, 1.203068, 1.024429, 1, 1, 1, 1, 1,
0.008505037, -0.2514188, 4.469782, 1, 1, 1, 1, 1,
0.009926355, -1.027821, 4.359354, 1, 1, 1, 1, 1,
0.01080893, 1.413021, -4.453378, 1, 1, 1, 1, 1,
0.0137296, -0.237261, 2.63684, 1, 1, 1, 1, 1,
0.0149684, -0.7637247, 4.341169, 1, 1, 1, 1, 1,
0.02159717, -1.178258, 3.007144, 1, 1, 1, 1, 1,
0.02217961, -0.03465478, 3.380934, 1, 1, 1, 1, 1,
0.02333814, 0.5533254, 1.484423, 1, 1, 1, 1, 1,
0.02670824, -0.370996, 3.393558, 1, 1, 1, 1, 1,
0.03372799, -0.01473398, 3.267281, 1, 1, 1, 1, 1,
0.04358311, 0.6858316, 0.5780455, 1, 1, 1, 1, 1,
0.04607837, -0.1304547, 2.842319, 1, 1, 1, 1, 1,
0.04797458, -0.7491751, 3.007697, 1, 1, 1, 1, 1,
0.05265506, 2.122354, 0.3743024, 1, 1, 1, 1, 1,
0.05321766, 1.177405, 0.2668395, 0, 0, 1, 1, 1,
0.05400537, 0.2543763, 1.623886, 1, 0, 0, 1, 1,
0.05492764, -0.1516659, 5.03973, 1, 0, 0, 1, 1,
0.05713522, 1.056986, -0.3761827, 1, 0, 0, 1, 1,
0.06003515, -0.1421807, 0.8170906, 1, 0, 0, 1, 1,
0.06267907, 0.5275341, -0.5557179, 1, 0, 0, 1, 1,
0.0628516, -0.191888, 2.356007, 0, 0, 0, 1, 1,
0.06547532, 0.8483888, 0.4460445, 0, 0, 0, 1, 1,
0.06909081, 0.6444916, 0.9606425, 0, 0, 0, 1, 1,
0.07366464, -0.4717407, 2.055022, 0, 0, 0, 1, 1,
0.07376786, 0.6019181, 1.276398, 0, 0, 0, 1, 1,
0.07527569, 0.463981, -0.9802063, 0, 0, 0, 1, 1,
0.07546942, 0.6697855, 0.5360711, 0, 0, 0, 1, 1,
0.07719134, -1.013111, 3.72559, 1, 1, 1, 1, 1,
0.07816108, 1.178487, -0.1517815, 1, 1, 1, 1, 1,
0.07857145, -0.7178876, 2.601128, 1, 1, 1, 1, 1,
0.08485062, -0.4269382, 4.116735, 1, 1, 1, 1, 1,
0.08665881, -0.7898769, 3.58334, 1, 1, 1, 1, 1,
0.08920375, 1.721665, 0.5754882, 1, 1, 1, 1, 1,
0.09597699, 0.8165235, -0.4239613, 1, 1, 1, 1, 1,
0.09732601, -0.4262019, 3.523908, 1, 1, 1, 1, 1,
0.1008379, 0.1515819, 0.1941535, 1, 1, 1, 1, 1,
0.1009476, -0.6348752, 2.748564, 1, 1, 1, 1, 1,
0.1041846, 1.001235, 0.3226467, 1, 1, 1, 1, 1,
0.1049986, 1.533734, -0.3272856, 1, 1, 1, 1, 1,
0.1075615, -0.3942606, 2.244328, 1, 1, 1, 1, 1,
0.1080407, 0.04573822, 0.9152139, 1, 1, 1, 1, 1,
0.1088444, -0.8333939, 3.888618, 1, 1, 1, 1, 1,
0.1088472, 1.097204, -0.06819452, 0, 0, 1, 1, 1,
0.1100832, 0.8744447, 1.178014, 1, 0, 0, 1, 1,
0.1156236, 0.1102188, 1.432083, 1, 0, 0, 1, 1,
0.1179161, -0.9001865, 2.068896, 1, 0, 0, 1, 1,
0.1194174, 0.03764108, 0.6395683, 1, 0, 0, 1, 1,
0.1215992, 1.403126, 2.20276, 1, 0, 0, 1, 1,
0.1229952, -1.159577, 2.421073, 0, 0, 0, 1, 1,
0.1304635, 0.5551788, 0.4833099, 0, 0, 0, 1, 1,
0.1336342, -1.822066, 1.938048, 0, 0, 0, 1, 1,
0.1352037, 0.5932409, 0.7972373, 0, 0, 0, 1, 1,
0.1374901, 0.501934, -2.259459, 0, 0, 0, 1, 1,
0.1417645, 1.247541, 0.8487268, 0, 0, 0, 1, 1,
0.1442619, -0.9052006, 2.144872, 0, 0, 0, 1, 1,
0.1444723, -1.084799, 2.997235, 1, 1, 1, 1, 1,
0.1518738, 1.373789, 1.083924, 1, 1, 1, 1, 1,
0.1527527, 0.8717609, 0.0002444259, 1, 1, 1, 1, 1,
0.153141, 1.267373, 0.1373463, 1, 1, 1, 1, 1,
0.1546579, -1.194647, 3.845477, 1, 1, 1, 1, 1,
0.1546866, 0.4634918, -0.09305269, 1, 1, 1, 1, 1,
0.1565205, -1.12895, 3.154337, 1, 1, 1, 1, 1,
0.1596876, 0.3584845, -0.5475529, 1, 1, 1, 1, 1,
0.1600235, 0.7965518, 0.6536127, 1, 1, 1, 1, 1,
0.1668312, -0.9220072, 1.393649, 1, 1, 1, 1, 1,
0.1685694, 0.4353369, 1.949886, 1, 1, 1, 1, 1,
0.1687097, -2.691619, 3.259859, 1, 1, 1, 1, 1,
0.1696202, 1.309948, 0.3154319, 1, 1, 1, 1, 1,
0.1716119, -0.6045207, 3.672074, 1, 1, 1, 1, 1,
0.1720908, -0.8309618, 2.626692, 1, 1, 1, 1, 1,
0.1725572, 1.947576, 1.717035, 0, 0, 1, 1, 1,
0.1733473, 0.6047357, 1.105777, 1, 0, 0, 1, 1,
0.1743513, 2.201447, 1.000714, 1, 0, 0, 1, 1,
0.1759626, 0.9100363, 0.5438101, 1, 0, 0, 1, 1,
0.1767998, 0.8310006, -0.2832575, 1, 0, 0, 1, 1,
0.1770074, 0.5720707, 1.903296, 1, 0, 0, 1, 1,
0.1770504, -0.2759028, 1.855403, 0, 0, 0, 1, 1,
0.1783213, -0.5269485, 3.472947, 0, 0, 0, 1, 1,
0.1801548, -0.002068319, 1.876957, 0, 0, 0, 1, 1,
0.1865305, 0.9891033, -1.137626, 0, 0, 0, 1, 1,
0.1907781, 0.2212276, 1.050779, 0, 0, 0, 1, 1,
0.1924408, -0.3623592, 1.856875, 0, 0, 0, 1, 1,
0.1964099, -0.3372162, 2.615275, 0, 0, 0, 1, 1,
0.1992153, -0.8016412, 2.523449, 1, 1, 1, 1, 1,
0.199674, 1.31538, -1.042521, 1, 1, 1, 1, 1,
0.2059201, -0.9681465, 2.812474, 1, 1, 1, 1, 1,
0.2122842, 1.776785, -0.06294473, 1, 1, 1, 1, 1,
0.2129289, 0.8511362, -1.589746, 1, 1, 1, 1, 1,
0.2166895, -0.0204632, 1.609185, 1, 1, 1, 1, 1,
0.2184504, 0.6031016, 1.079335, 1, 1, 1, 1, 1,
0.224126, 0.2085015, -0.405807, 1, 1, 1, 1, 1,
0.2246535, -0.6940601, 1.886381, 1, 1, 1, 1, 1,
0.2285066, -1.30112, 3.11145, 1, 1, 1, 1, 1,
0.230363, 1.638458, 0.4264826, 1, 1, 1, 1, 1,
0.2306007, 1.200319, 0.4713137, 1, 1, 1, 1, 1,
0.2323378, 0.2408171, -0.5406138, 1, 1, 1, 1, 1,
0.2337626, -0.7262927, 2.668014, 1, 1, 1, 1, 1,
0.2354606, -0.3881743, 1.964836, 1, 1, 1, 1, 1,
0.2383386, -0.5766264, 1.107131, 0, 0, 1, 1, 1,
0.2453777, 1.89815, 0.5045638, 1, 0, 0, 1, 1,
0.2460223, 1.444633, 0.5557621, 1, 0, 0, 1, 1,
0.2467218, 0.8500033, 0.5165921, 1, 0, 0, 1, 1,
0.2483127, -0.9176058, 2.718493, 1, 0, 0, 1, 1,
0.2495244, -0.8716422, 3.047342, 1, 0, 0, 1, 1,
0.2553019, -0.9190186, 4.501113, 0, 0, 0, 1, 1,
0.2569401, -1.392214, 3.25797, 0, 0, 0, 1, 1,
0.2598616, -0.02350286, 3.49791, 0, 0, 0, 1, 1,
0.2676472, -1.441221, 1.129499, 0, 0, 0, 1, 1,
0.2725999, 0.3127324, 0.794426, 0, 0, 0, 1, 1,
0.2761758, -0.1114194, 1.272066, 0, 0, 0, 1, 1,
0.2776625, -0.4377813, 3.374181, 0, 0, 0, 1, 1,
0.2802019, 1.033846, 0.6268665, 1, 1, 1, 1, 1,
0.2825617, -0.06040661, 1.934901, 1, 1, 1, 1, 1,
0.2878092, -0.7397995, 4.61919, 1, 1, 1, 1, 1,
0.2885801, 0.02217799, 1.670228, 1, 1, 1, 1, 1,
0.2976859, 0.7255232, 2.095733, 1, 1, 1, 1, 1,
0.3008772, 1.481536, 0.8195398, 1, 1, 1, 1, 1,
0.3031904, -1.204753, 1.365758, 1, 1, 1, 1, 1,
0.3047116, 1.412194, -0.3687186, 1, 1, 1, 1, 1,
0.3072216, -0.296348, 2.72525, 1, 1, 1, 1, 1,
0.3079054, 0.657147, 0.2604393, 1, 1, 1, 1, 1,
0.3099451, -0.2389587, 1.622579, 1, 1, 1, 1, 1,
0.3123074, -0.9918102, 1.157383, 1, 1, 1, 1, 1,
0.3123228, -0.1994273, 2.742395, 1, 1, 1, 1, 1,
0.3128485, -0.4836085, 3.855797, 1, 1, 1, 1, 1,
0.3143376, -0.3084289, 1.618663, 1, 1, 1, 1, 1,
0.3156101, -0.5067331, 3.611954, 0, 0, 1, 1, 1,
0.3161967, -0.03230056, 0.3694433, 1, 0, 0, 1, 1,
0.3171355, -0.5504012, 2.364268, 1, 0, 0, 1, 1,
0.330642, -0.4490833, 1.335985, 1, 0, 0, 1, 1,
0.3335423, -1.817674, 1.623709, 1, 0, 0, 1, 1,
0.3346836, -0.8772081, 1.614614, 1, 0, 0, 1, 1,
0.3356299, -1.001136, 2.859164, 0, 0, 0, 1, 1,
0.3444526, 0.3204113, -1.291029, 0, 0, 0, 1, 1,
0.3446264, 0.53646, -0.9726874, 0, 0, 0, 1, 1,
0.3456883, 0.0313231, 0.7682098, 0, 0, 0, 1, 1,
0.3482201, 0.530156, -0.4153146, 0, 0, 0, 1, 1,
0.34916, -1.514447, 2.616485, 0, 0, 0, 1, 1,
0.3551097, -0.8438283, 2.113341, 0, 0, 0, 1, 1,
0.3591174, -0.02231402, 1.989671, 1, 1, 1, 1, 1,
0.3603264, 1.827187, -2.161931, 1, 1, 1, 1, 1,
0.3675319, 1.75171, 0.8376474, 1, 1, 1, 1, 1,
0.3699506, -0.5781605, 3.442748, 1, 1, 1, 1, 1,
0.3752274, 0.4019494, 2.289045, 1, 1, 1, 1, 1,
0.3786485, 2.29783, -1.641928, 1, 1, 1, 1, 1,
0.3844647, 1.14659, 1.440302, 1, 1, 1, 1, 1,
0.3850101, -1.079791, 3.06479, 1, 1, 1, 1, 1,
0.396506, 0.6215036, -0.2297461, 1, 1, 1, 1, 1,
0.396546, 1.509713, -1.397252, 1, 1, 1, 1, 1,
0.3987001, -0.323405, 2.848818, 1, 1, 1, 1, 1,
0.4019896, 0.5695665, 0.2728855, 1, 1, 1, 1, 1,
0.4049364, 1.297571, 0.4821308, 1, 1, 1, 1, 1,
0.4110017, 1.421728, 1.338261, 1, 1, 1, 1, 1,
0.4145991, 0.3635218, 1.384334, 1, 1, 1, 1, 1,
0.4155797, 0.1198114, 1.921449, 0, 0, 1, 1, 1,
0.4182579, 0.3304259, 3.120683, 1, 0, 0, 1, 1,
0.4188294, 1.23533, 1.283673, 1, 0, 0, 1, 1,
0.4188322, -0.7605001, 1.475186, 1, 0, 0, 1, 1,
0.4213776, -0.06626686, 0.757994, 1, 0, 0, 1, 1,
0.4235095, 0.02310479, 1.853246, 1, 0, 0, 1, 1,
0.4260896, -1.70359, 3.817616, 0, 0, 0, 1, 1,
0.430014, -0.6518741, 0.5316885, 0, 0, 0, 1, 1,
0.4307098, -1.002765, 2.717858, 0, 0, 0, 1, 1,
0.4315874, -0.0394537, 3.797942, 0, 0, 0, 1, 1,
0.4374953, -0.779384, 1.483277, 0, 0, 0, 1, 1,
0.4387916, 0.9537172, 1.105621, 0, 0, 0, 1, 1,
0.4391173, 1.137541, 0.3597218, 0, 0, 0, 1, 1,
0.4395009, -1.357654, 2.144417, 1, 1, 1, 1, 1,
0.4399078, -1.19329, 1.178132, 1, 1, 1, 1, 1,
0.4410297, 0.1825725, 0.7126378, 1, 1, 1, 1, 1,
0.4411258, -1.224366, 1.247978, 1, 1, 1, 1, 1,
0.4421831, -0.09636457, 2.356274, 1, 1, 1, 1, 1,
0.4428789, -0.383807, 1.050508, 1, 1, 1, 1, 1,
0.4434842, 0.06688854, 1.41394, 1, 1, 1, 1, 1,
0.447699, 0.5090628, 1.568197, 1, 1, 1, 1, 1,
0.4490716, -0.2733566, 1.765954, 1, 1, 1, 1, 1,
0.4594814, 0.8285603, 0.8279063, 1, 1, 1, 1, 1,
0.463018, 0.4943258, 1.686128, 1, 1, 1, 1, 1,
0.4658702, -0.4099612, 2.578492, 1, 1, 1, 1, 1,
0.4664097, -1.084807, 1.270872, 1, 1, 1, 1, 1,
0.4664433, -0.7505152, 1.809323, 1, 1, 1, 1, 1,
0.4677289, -2.37338, 1.96429, 1, 1, 1, 1, 1,
0.4917449, -0.7739751, 1.667984, 0, 0, 1, 1, 1,
0.4926598, -1.186895, 3.320268, 1, 0, 0, 1, 1,
0.4938521, -1.388413, 2.82545, 1, 0, 0, 1, 1,
0.4941105, -0.2605394, 2.786261, 1, 0, 0, 1, 1,
0.4979843, 0.171031, 1.550517, 1, 0, 0, 1, 1,
0.4983947, -1.444209, 2.373616, 1, 0, 0, 1, 1,
0.5042368, -1.331598, 3.633718, 0, 0, 0, 1, 1,
0.5072138, 1.071808, -0.8068597, 0, 0, 0, 1, 1,
0.5110359, -0.2621046, 2.088768, 0, 0, 0, 1, 1,
0.5170452, 0.5432878, 0.219118, 0, 0, 0, 1, 1,
0.5198122, -0.6437539, 2.593748, 0, 0, 0, 1, 1,
0.521166, 0.8256732, 0.8695282, 0, 0, 0, 1, 1,
0.5281842, -0.6505889, 1.349527, 0, 0, 0, 1, 1,
0.5316058, 0.3597368, -0.4097665, 1, 1, 1, 1, 1,
0.5355853, 1.148825, 1.220804, 1, 1, 1, 1, 1,
0.53646, 1.778095, 2.464501, 1, 1, 1, 1, 1,
0.5380561, -0.5373089, 1.833113, 1, 1, 1, 1, 1,
0.5382649, -0.4325002, 2.900309, 1, 1, 1, 1, 1,
0.5384856, 1.100905, -1.214467, 1, 1, 1, 1, 1,
0.5385829, -0.3693638, 3.600073, 1, 1, 1, 1, 1,
0.5422269, 0.07963712, 1.659531, 1, 1, 1, 1, 1,
0.5451969, -2.799767, 4.032981, 1, 1, 1, 1, 1,
0.5474135, -0.7623655, 5.261063, 1, 1, 1, 1, 1,
0.5476373, -0.7166625, 2.982182, 1, 1, 1, 1, 1,
0.5478292, -0.5848524, 4.925926, 1, 1, 1, 1, 1,
0.5506142, 0.9715027, 0.01267597, 1, 1, 1, 1, 1,
0.5556822, -0.5154546, 2.289257, 1, 1, 1, 1, 1,
0.5669664, 1.482593, 0.5155029, 1, 1, 1, 1, 1,
0.5765378, 0.9730293, -0.3969542, 0, 0, 1, 1, 1,
0.5775657, -0.1586933, -0.1806392, 1, 0, 0, 1, 1,
0.5879272, -0.1455475, 0.2921532, 1, 0, 0, 1, 1,
0.589937, 1.33578, 0.01799994, 1, 0, 0, 1, 1,
0.590915, 0.08659198, 2.157782, 1, 0, 0, 1, 1,
0.5911949, -0.2723633, 2.364322, 1, 0, 0, 1, 1,
0.5913466, -0.3854763, 2.058162, 0, 0, 0, 1, 1,
0.592421, -1.364145, 2.940493, 0, 0, 0, 1, 1,
0.5927319, -0.06678019, 0.7541512, 0, 0, 0, 1, 1,
0.5951462, 1.014816, 1.127337, 0, 0, 0, 1, 1,
0.5953543, -0.1144201, 1.838963, 0, 0, 0, 1, 1,
0.5999131, -0.7237736, 3.369268, 0, 0, 0, 1, 1,
0.6016988, -0.3569506, 3.590083, 0, 0, 0, 1, 1,
0.6085933, 0.2483446, 1.120625, 1, 1, 1, 1, 1,
0.6090572, 1.22479, 1.887597, 1, 1, 1, 1, 1,
0.6115823, 1.27368, 0.6926271, 1, 1, 1, 1, 1,
0.6116729, -0.7111005, 4.377422, 1, 1, 1, 1, 1,
0.6129342, -1.996634, 3.780853, 1, 1, 1, 1, 1,
0.616228, -0.1295547, 1.637715, 1, 1, 1, 1, 1,
0.6186584, 0.9180092, -0.03405291, 1, 1, 1, 1, 1,
0.6197749, 0.06622614, 2.335337, 1, 1, 1, 1, 1,
0.6265643, -0.01838788, 0.1881606, 1, 1, 1, 1, 1,
0.6274924, 0.0275557, 1.14626, 1, 1, 1, 1, 1,
0.6284842, -0.1743536, 0.8770584, 1, 1, 1, 1, 1,
0.6298773, -1.632003, 4.815557, 1, 1, 1, 1, 1,
0.6336798, 1.529535, -0.6471857, 1, 1, 1, 1, 1,
0.6355007, -0.3834801, 2.714798, 1, 1, 1, 1, 1,
0.6358565, -0.8012746, 3.006508, 1, 1, 1, 1, 1,
0.6397035, 0.4948098, 3.233257, 0, 0, 1, 1, 1,
0.6400278, -2.039832, 4.06115, 1, 0, 0, 1, 1,
0.6420552, 1.342051, 0.5274957, 1, 0, 0, 1, 1,
0.6444918, 0.9656985, 0.6567152, 1, 0, 0, 1, 1,
0.646639, 0.06119366, 0.2022617, 1, 0, 0, 1, 1,
0.6537498, 1.926126, 0.7118016, 1, 0, 0, 1, 1,
0.65469, 0.8237409, 1.87148, 0, 0, 0, 1, 1,
0.6559134, -0.38303, 1.777761, 0, 0, 0, 1, 1,
0.6593294, 1.450086, 0.17339, 0, 0, 0, 1, 1,
0.6595302, 1.076981, 2.874301, 0, 0, 0, 1, 1,
0.6597851, 0.7144287, 1.638976, 0, 0, 0, 1, 1,
0.6621143, 2.007277, -0.05035906, 0, 0, 0, 1, 1,
0.6623339, 1.446092, 1.662968, 0, 0, 0, 1, 1,
0.672974, -1.528854, 2.321383, 1, 1, 1, 1, 1,
0.675101, 0.1289255, -0.5381497, 1, 1, 1, 1, 1,
0.685042, 1.440406, 0.3261552, 1, 1, 1, 1, 1,
0.6894893, 1.121092, -0.3696165, 1, 1, 1, 1, 1,
0.6910961, -0.5622273, -0.002897265, 1, 1, 1, 1, 1,
0.69179, -0.8464059, 1.645839, 1, 1, 1, 1, 1,
0.6965257, -1.313695, 3.044771, 1, 1, 1, 1, 1,
0.6976089, 0.008606343, 0.6041316, 1, 1, 1, 1, 1,
0.6978337, -0.5961576, -0.8629279, 1, 1, 1, 1, 1,
0.7020209, 1.44413, 1.713246, 1, 1, 1, 1, 1,
0.7084579, 0.06508199, 0.2390276, 1, 1, 1, 1, 1,
0.7104157, -0.8647755, 2.174747, 1, 1, 1, 1, 1,
0.7114586, -0.4256789, 2.328862, 1, 1, 1, 1, 1,
0.7162129, 1.391008, 0.3733779, 1, 1, 1, 1, 1,
0.7208574, 1.630523, 1.3731, 1, 1, 1, 1, 1,
0.7319238, 0.2678734, 2.628087, 0, 0, 1, 1, 1,
0.7370535, 0.5097638, 0.01526321, 1, 0, 0, 1, 1,
0.7389301, 0.02423167, 1.745379, 1, 0, 0, 1, 1,
0.7425927, 0.6855625, 4.227361, 1, 0, 0, 1, 1,
0.7438455, -1.295208, 4.268085, 1, 0, 0, 1, 1,
0.7448991, 2.14878, 0.4521169, 1, 0, 0, 1, 1,
0.7466245, -0.2914029, 0.2612773, 0, 0, 0, 1, 1,
0.7482118, -3.006791, 3.557884, 0, 0, 0, 1, 1,
0.7503507, -1.98986, 2.86316, 0, 0, 0, 1, 1,
0.7504848, -2.302932, 3.737758, 0, 0, 0, 1, 1,
0.7509608, -0.6308159, 2.183861, 0, 0, 0, 1, 1,
0.7548306, -1.688785, 0.3755166, 0, 0, 0, 1, 1,
0.7614948, -0.9064558, 2.668031, 0, 0, 0, 1, 1,
0.7629294, 0.2648774, 2.814243, 1, 1, 1, 1, 1,
0.7644235, 0.5858157, 1.095283, 1, 1, 1, 1, 1,
0.772964, -0.7208101, 4.291807, 1, 1, 1, 1, 1,
0.7764112, -0.1789875, 1.166755, 1, 1, 1, 1, 1,
0.7864778, -0.1622375, 1.628182, 1, 1, 1, 1, 1,
0.7886485, 1.014624, 0.7497838, 1, 1, 1, 1, 1,
0.7892382, 0.6734986, 0.577675, 1, 1, 1, 1, 1,
0.7897525, 1.077345, 1.480236, 1, 1, 1, 1, 1,
0.7935188, -0.9469741, 0.7257786, 1, 1, 1, 1, 1,
0.7950429, 0.8734383, 0.8696679, 1, 1, 1, 1, 1,
0.7966411, -0.1966738, 4.63177, 1, 1, 1, 1, 1,
0.7970957, -0.7056829, 2.445066, 1, 1, 1, 1, 1,
0.798166, -0.5917457, 0.9629841, 1, 1, 1, 1, 1,
0.7982042, -0.0251123, -1.892181, 1, 1, 1, 1, 1,
0.808391, -1.175272, 2.154888, 1, 1, 1, 1, 1,
0.81108, 0.833713, 1.795123, 0, 0, 1, 1, 1,
0.8117266, -0.1862686, 0.2001001, 1, 0, 0, 1, 1,
0.8145567, 1.415107, 0.8056616, 1, 0, 0, 1, 1,
0.8204696, 0.05975864, 1.813726, 1, 0, 0, 1, 1,
0.8298008, -1.640679, 3.572791, 1, 0, 0, 1, 1,
0.8360599, -0.5050101, 1.820379, 1, 0, 0, 1, 1,
0.8379647, -1.036311, 4.090821, 0, 0, 0, 1, 1,
0.8399629, -1.317616, 3.560192, 0, 0, 0, 1, 1,
0.8432596, -0.8782557, 2.433809, 0, 0, 0, 1, 1,
0.844889, -1.735418, 2.460747, 0, 0, 0, 1, 1,
0.8493334, 0.03911735, 1.123432, 0, 0, 0, 1, 1,
0.8539568, -0.1157517, 2.357223, 0, 0, 0, 1, 1,
0.8594217, 0.8257971, -0.4467148, 0, 0, 0, 1, 1,
0.8641716, 0.560599, -0.3926773, 1, 1, 1, 1, 1,
0.8733382, -0.9793748, 4.423867, 1, 1, 1, 1, 1,
0.877827, 0.2198219, 1.584235, 1, 1, 1, 1, 1,
0.877828, -0.5703145, 4.329225, 1, 1, 1, 1, 1,
0.8822598, -0.08789961, 2.185032, 1, 1, 1, 1, 1,
0.8861045, 0.1228049, 1.062672, 1, 1, 1, 1, 1,
0.8868324, 2.270955, -0.3835787, 1, 1, 1, 1, 1,
0.8900542, 0.2527686, 0.07681855, 1, 1, 1, 1, 1,
0.8906654, 0.05667756, 0.9862563, 1, 1, 1, 1, 1,
0.8982531, 0.3491277, 0.3260556, 1, 1, 1, 1, 1,
0.9085745, 1.003598, -1.009588, 1, 1, 1, 1, 1,
0.909115, -0.403745, 1.597578, 1, 1, 1, 1, 1,
0.9117793, 0.05237108, 2.043884, 1, 1, 1, 1, 1,
0.9126013, 1.454335, 1.293013, 1, 1, 1, 1, 1,
0.9157493, 0.9360844, 0.2806197, 1, 1, 1, 1, 1,
0.9158888, 1.414198, -0.2896636, 0, 0, 1, 1, 1,
0.9184521, -0.6900039, 2.36323, 1, 0, 0, 1, 1,
0.920676, -0.386546, 1.095082, 1, 0, 0, 1, 1,
0.9206864, -2.378731, 4.119682, 1, 0, 0, 1, 1,
0.9234211, 0.3626389, 1.703084, 1, 0, 0, 1, 1,
0.933382, -1.338464, 1.873598, 1, 0, 0, 1, 1,
0.9389688, -0.1761079, 3.145313, 0, 0, 0, 1, 1,
0.9411272, -1.116797, 3.08573, 0, 0, 0, 1, 1,
0.9447551, 0.3565526, 2.485761, 0, 0, 0, 1, 1,
0.9464507, 0.9434749, 0.538616, 0, 0, 0, 1, 1,
0.9509813, -0.003658219, 1.943638, 0, 0, 0, 1, 1,
0.9551304, -1.870133, 3.041226, 0, 0, 0, 1, 1,
0.9624982, -0.7058458, 3.753794, 0, 0, 0, 1, 1,
0.9713076, -0.6577607, 1.485265, 1, 1, 1, 1, 1,
0.97172, 0.2917302, 0.9904941, 1, 1, 1, 1, 1,
0.9758807, 0.940748, 2.022629, 1, 1, 1, 1, 1,
0.9781603, 1.271299, 2.628271, 1, 1, 1, 1, 1,
0.9799436, 0.1058605, -0.4702446, 1, 1, 1, 1, 1,
0.9836521, -0.2426586, 1.757502, 1, 1, 1, 1, 1,
0.9850764, -1.013869, 3.410239, 1, 1, 1, 1, 1,
0.9889046, -1.069474, 1.874306, 1, 1, 1, 1, 1,
0.9894858, -1.156525, 1.091507, 1, 1, 1, 1, 1,
0.9931375, -1.008305, 1.732703, 1, 1, 1, 1, 1,
0.994342, -1.098963, 2.563171, 1, 1, 1, 1, 1,
1.006103, -0.5847207, 1.472207, 1, 1, 1, 1, 1,
1.006312, -0.06731675, 1.796216, 1, 1, 1, 1, 1,
1.013004, -0.1872556, 2.234816, 1, 1, 1, 1, 1,
1.017876, 0.2818308, 0.6408478, 1, 1, 1, 1, 1,
1.024295, 1.871331, 0.1604946, 0, 0, 1, 1, 1,
1.037651, -0.1599147, 1.744228, 1, 0, 0, 1, 1,
1.05082, 0.313386, 0.5214393, 1, 0, 0, 1, 1,
1.051468, -0.2796036, 2.280892, 1, 0, 0, 1, 1,
1.057368, 1.004397, 0.9233684, 1, 0, 0, 1, 1,
1.064485, 0.06575139, 2.989041, 1, 0, 0, 1, 1,
1.074492, 0.8348394, -0.2363188, 0, 0, 0, 1, 1,
1.076928, 0.7696069, 1.134094, 0, 0, 0, 1, 1,
1.080753, 0.724111, 2.436741, 0, 0, 0, 1, 1,
1.081398, 0.8479142, 0.9406431, 0, 0, 0, 1, 1,
1.087238, -0.3227016, 2.174492, 0, 0, 0, 1, 1,
1.089202, -1.005807, 1.252991, 0, 0, 0, 1, 1,
1.09474, 0.1821445, 0.8610727, 0, 0, 0, 1, 1,
1.095216, -1.541718, 2.666508, 1, 1, 1, 1, 1,
1.096285, 0.009265845, 2.248882, 1, 1, 1, 1, 1,
1.105912, -0.144647, 1.729058, 1, 1, 1, 1, 1,
1.108107, -0.6657601, 3.021338, 1, 1, 1, 1, 1,
1.113045, -1.790063, 3.642888, 1, 1, 1, 1, 1,
1.121587, -0.1117474, 3.317952, 1, 1, 1, 1, 1,
1.122798, 0.2158512, 1.670745, 1, 1, 1, 1, 1,
1.128257, -1.20152, 2.404841, 1, 1, 1, 1, 1,
1.131771, 1.036273, -0.7535247, 1, 1, 1, 1, 1,
1.158282, -0.03558441, 2.443117, 1, 1, 1, 1, 1,
1.163922, 0.3971989, 1.552247, 1, 1, 1, 1, 1,
1.17319, 0.857868, 1.080153, 1, 1, 1, 1, 1,
1.183901, 0.07980176, 2.668198, 1, 1, 1, 1, 1,
1.18662, -2.06334, 1.21431, 1, 1, 1, 1, 1,
1.188257, 1.097407, 0.4895872, 1, 1, 1, 1, 1,
1.190377, 1.661251, 0.2837145, 0, 0, 1, 1, 1,
1.192833, -0.2278001, 2.707722, 1, 0, 0, 1, 1,
1.194703, 1.521073, -0.7295555, 1, 0, 0, 1, 1,
1.198351, 1.101937, -0.3926313, 1, 0, 0, 1, 1,
1.201509, 0.3419051, 0.2555244, 1, 0, 0, 1, 1,
1.220515, 2.37994, -0.4404152, 1, 0, 0, 1, 1,
1.222407, -0.06922334, 0.9312761, 0, 0, 0, 1, 1,
1.231202, -0.3680753, 1.783267, 0, 0, 0, 1, 1,
1.236192, 0.7672999, 0.2413313, 0, 0, 0, 1, 1,
1.246736, -0.8030316, 0.2574925, 0, 0, 0, 1, 1,
1.260936, 0.5070736, 0.6185772, 0, 0, 0, 1, 1,
1.262708, 0.3133287, 2.705746, 0, 0, 0, 1, 1,
1.268734, -0.3370207, 1.387233, 0, 0, 0, 1, 1,
1.271828, 1.550375, 0.05722852, 1, 1, 1, 1, 1,
1.279324, -0.5160841, 0.6824852, 1, 1, 1, 1, 1,
1.281899, 0.346076, 1.332674, 1, 1, 1, 1, 1,
1.283768, -0.2504671, 0.5837881, 1, 1, 1, 1, 1,
1.289647, -0.270322, 3.497912, 1, 1, 1, 1, 1,
1.289773, -1.582059, 2.093939, 1, 1, 1, 1, 1,
1.292634, -0.1333489, 0.6957119, 1, 1, 1, 1, 1,
1.293746, 0.8055012, -1.262457, 1, 1, 1, 1, 1,
1.294072, -0.3837402, 2.19183, 1, 1, 1, 1, 1,
1.294343, 0.04597429, 1.734294, 1, 1, 1, 1, 1,
1.297569, 0.09644024, 0.4448919, 1, 1, 1, 1, 1,
1.304243, 0.7917755, -1.033139, 1, 1, 1, 1, 1,
1.306581, 0.7731608, 2.568264, 1, 1, 1, 1, 1,
1.307595, 0.05233081, 1.524456, 1, 1, 1, 1, 1,
1.334352, -0.9368737, 1.768634, 1, 1, 1, 1, 1,
1.338951, -0.2615258, 1.508699, 0, 0, 1, 1, 1,
1.34193, 0.1676412, 2.353021, 1, 0, 0, 1, 1,
1.342813, -1.234302, 2.371826, 1, 0, 0, 1, 1,
1.348556, -0.810248, 2.528666, 1, 0, 0, 1, 1,
1.348871, -0.456032, 3.784373, 1, 0, 0, 1, 1,
1.357197, -1.15559, 2.883164, 1, 0, 0, 1, 1,
1.359638, -0.7602011, 2.588513, 0, 0, 0, 1, 1,
1.367527, -0.4224947, 1.590392, 0, 0, 0, 1, 1,
1.368898, -2.117954, 0.6132066, 0, 0, 0, 1, 1,
1.380536, 0.5506843, 1.630615, 0, 0, 0, 1, 1,
1.389104, 0.2717385, 1.901864, 0, 0, 0, 1, 1,
1.410197, 0.6273556, 1.070068, 0, 0, 0, 1, 1,
1.418534, 0.3985557, -0.1371324, 0, 0, 0, 1, 1,
1.432134, 1.357024, -0.3308341, 1, 1, 1, 1, 1,
1.443276, 0.1488491, 1.162674, 1, 1, 1, 1, 1,
1.455424, -0.7781858, 2.87688, 1, 1, 1, 1, 1,
1.46077, 0.9161314, 1.143062, 1, 1, 1, 1, 1,
1.461616, 1.036652, -0.3179902, 1, 1, 1, 1, 1,
1.490989, -0.1542478, 0.9388234, 1, 1, 1, 1, 1,
1.500991, 0.2557757, 1.58574, 1, 1, 1, 1, 1,
1.518186, -0.05031109, 1.709478, 1, 1, 1, 1, 1,
1.550255, 0.07517792, 1.822602, 1, 1, 1, 1, 1,
1.559691, 1.086515, -0.3107314, 1, 1, 1, 1, 1,
1.568174, -0.8137215, 2.928268, 1, 1, 1, 1, 1,
1.578649, 0.3475508, 1.33165, 1, 1, 1, 1, 1,
1.585477, 1.524918, 0.9554037, 1, 1, 1, 1, 1,
1.588062, 0.4391177, 0.9060444, 1, 1, 1, 1, 1,
1.601869, 0.1823956, 1.66417, 1, 1, 1, 1, 1,
1.602245, 1.407786, 0.3474825, 0, 0, 1, 1, 1,
1.611236, 1.116626, 0.0587372, 1, 0, 0, 1, 1,
1.618554, -0.8089316, 2.991449, 1, 0, 0, 1, 1,
1.625105, -0.7506111, 2.520281, 1, 0, 0, 1, 1,
1.625767, -1.179428, 0.4474096, 1, 0, 0, 1, 1,
1.632146, -1.370015, 4.454768, 1, 0, 0, 1, 1,
1.656697, -0.7221618, 2.70504, 0, 0, 0, 1, 1,
1.680665, -0.7665208, 3.548614, 0, 0, 0, 1, 1,
1.682095, -1.828239, 3.528533, 0, 0, 0, 1, 1,
1.687302, -0.1189837, 1.662196, 0, 0, 0, 1, 1,
1.695956, -1.055398, 2.093801, 0, 0, 0, 1, 1,
1.696374, 0.1027951, 1.580276, 0, 0, 0, 1, 1,
1.711189, -1.402743, 2.357651, 0, 0, 0, 1, 1,
1.715575, 1.356005, 1.608074, 1, 1, 1, 1, 1,
1.718842, 0.8107993, 0.4914294, 1, 1, 1, 1, 1,
1.74446, 1.522202, 2.807719, 1, 1, 1, 1, 1,
1.745843, -0.4917514, 2.409973, 1, 1, 1, 1, 1,
1.76214, 0.3603673, 0.335096, 1, 1, 1, 1, 1,
1.78065, 0.5022448, 0.623118, 1, 1, 1, 1, 1,
1.801209, -0.2026901, 2.632527, 1, 1, 1, 1, 1,
1.824553, 0.9091908, 0.4005376, 1, 1, 1, 1, 1,
1.83028, 1.35906, 0.6727316, 1, 1, 1, 1, 1,
1.87748, -0.0689714, 3.121274, 1, 1, 1, 1, 1,
1.883919, -1.301998, 1.931016, 1, 1, 1, 1, 1,
1.895623, 0.9335897, 0.7576236, 1, 1, 1, 1, 1,
1.900416, 0.3467263, 1.757789, 1, 1, 1, 1, 1,
1.900446, 1.380363, 1.558819, 1, 1, 1, 1, 1,
1.915837, 1.019067, 0.317646, 1, 1, 1, 1, 1,
1.960557, 0.3951711, 1.398783, 0, 0, 1, 1, 1,
1.995377, -1.145058, 2.310914, 1, 0, 0, 1, 1,
2.017405, -0.8846797, 3.135907, 1, 0, 0, 1, 1,
2.024313, 1.355618, 0.5934914, 1, 0, 0, 1, 1,
2.069582, 0.432121, 1.9289, 1, 0, 0, 1, 1,
2.155246, -0.7192615, 3.206514, 1, 0, 0, 1, 1,
2.172294, 0.5948707, 1.384031, 0, 0, 0, 1, 1,
2.190713, 1.592882, -0.03999164, 0, 0, 0, 1, 1,
2.257623, 0.3889166, 1.305912, 0, 0, 0, 1, 1,
2.300241, 0.1990703, 0.08538364, 0, 0, 0, 1, 1,
2.346264, -0.2407032, 2.417953, 0, 0, 0, 1, 1,
2.419425, -0.7806848, 0.6116399, 0, 0, 0, 1, 1,
2.456019, -1.751221, 0.9408234, 0, 0, 0, 1, 1,
2.582643, 0.1546018, 2.439047, 1, 1, 1, 1, 1,
2.609195, 0.197297, 1.563814, 1, 1, 1, 1, 1,
2.733434, 2.200342, 0.8171894, 1, 1, 1, 1, 1,
2.777944, -0.2323987, 0.6899403, 1, 1, 1, 1, 1,
2.814201, 0.8769057, 2.919856, 1, 1, 1, 1, 1,
2.914765, 0.7057675, 1.033469, 1, 1, 1, 1, 1,
4.221685, -0.5646481, 1.748971, 1, 1, 1, 1, 1
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
var radius = 9.604134;
var distance = 33.73411;
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
mvMatrix.translate( -0.4816568, 0.2160059, -0.06893063 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.73411);
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
