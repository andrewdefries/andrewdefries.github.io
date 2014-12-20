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
-3.177296, 0.4314306, -1.912634, 1, 0, 0, 1,
-2.624752, 0.1494251, -3.014265, 1, 0.007843138, 0, 1,
-2.575224, -2.136597, -3.079776, 1, 0.01176471, 0, 1,
-2.542809, 0.03907872, -2.231869, 1, 0.01960784, 0, 1,
-2.440339, -0.9322215, -1.469576, 1, 0.02352941, 0, 1,
-2.379563, -0.6183986, -3.552317, 1, 0.03137255, 0, 1,
-2.36077, 0.4733301, -1.210106, 1, 0.03529412, 0, 1,
-2.312877, 1.744603, -0.5676228, 1, 0.04313726, 0, 1,
-2.301157, -0.3916912, -1.431726, 1, 0.04705882, 0, 1,
-2.284504, 1.293997, -1.734858, 1, 0.05490196, 0, 1,
-2.254066, -0.4049141, -2.058479, 1, 0.05882353, 0, 1,
-2.247416, 1.597066, -1.877515, 1, 0.06666667, 0, 1,
-2.237097, -0.8020158, -1.097776, 1, 0.07058824, 0, 1,
-2.218687, 0.121462, -2.687027, 1, 0.07843138, 0, 1,
-2.159849, 0.6044255, -1.205818, 1, 0.08235294, 0, 1,
-2.155192, 0.5876544, -1.206322, 1, 0.09019608, 0, 1,
-2.127528, -1.456329, 0.04908187, 1, 0.09411765, 0, 1,
-2.09784, -1.753914, -3.150526, 1, 0.1019608, 0, 1,
-2.063146, -0.9725875, -1.629574, 1, 0.1098039, 0, 1,
-1.990131, 0.4124764, -2.156367, 1, 0.1137255, 0, 1,
-1.972528, 0.7664345, -0.5163835, 1, 0.1215686, 0, 1,
-1.919975, -0.9377453, -3.733006, 1, 0.1254902, 0, 1,
-1.912226, 2.302332, -0.6469411, 1, 0.1333333, 0, 1,
-1.89112, 1.094798, -2.019508, 1, 0.1372549, 0, 1,
-1.887501, 0.1637748, -1.814971, 1, 0.145098, 0, 1,
-1.865734, 1.652467, -1.308903, 1, 0.1490196, 0, 1,
-1.857782, -0.7847343, -2.539795, 1, 0.1568628, 0, 1,
-1.840999, -1.33994, -2.215978, 1, 0.1607843, 0, 1,
-1.794675, -0.3204253, -1.514099, 1, 0.1686275, 0, 1,
-1.792713, 1.587622, -0.4060376, 1, 0.172549, 0, 1,
-1.766792, 0.3377617, -1.398827, 1, 0.1803922, 0, 1,
-1.761137, -0.04426396, -0.2558389, 1, 0.1843137, 0, 1,
-1.748088, -1.771645, -2.681511, 1, 0.1921569, 0, 1,
-1.728604, 0.3319714, -0.5265638, 1, 0.1960784, 0, 1,
-1.722761, -0.618582, -2.531419, 1, 0.2039216, 0, 1,
-1.713559, 0.5649245, -1.048306, 1, 0.2117647, 0, 1,
-1.694095, -1.401644, -2.511802, 1, 0.2156863, 0, 1,
-1.676135, -0.2789602, -1.87459, 1, 0.2235294, 0, 1,
-1.669516, -1.522559, -3.30522, 1, 0.227451, 0, 1,
-1.662464, -0.1985005, -3.164364, 1, 0.2352941, 0, 1,
-1.649234, 0.4006686, -1.93812, 1, 0.2392157, 0, 1,
-1.631638, -0.3145964, -3.094714, 1, 0.2470588, 0, 1,
-1.611806, -0.7685323, -2.349296, 1, 0.2509804, 0, 1,
-1.577618, -0.7184175, -1.804442, 1, 0.2588235, 0, 1,
-1.575072, 0.6115622, -1.492404, 1, 0.2627451, 0, 1,
-1.570197, -0.8993854, -1.857554, 1, 0.2705882, 0, 1,
-1.558484, 0.01876388, -0.5586226, 1, 0.2745098, 0, 1,
-1.553786, -0.6311768, -3.797168, 1, 0.282353, 0, 1,
-1.553532, -1.32585, -2.017198, 1, 0.2862745, 0, 1,
-1.548757, -0.2009044, -2.488684, 1, 0.2941177, 0, 1,
-1.540549, 0.5545174, -2.095361, 1, 0.3019608, 0, 1,
-1.522878, -0.729529, -2.621016, 1, 0.3058824, 0, 1,
-1.514787, 1.352738, -1.905026, 1, 0.3137255, 0, 1,
-1.514068, 1.078779, -2.161978, 1, 0.3176471, 0, 1,
-1.510945, -0.8983381, -0.8687537, 1, 0.3254902, 0, 1,
-1.502195, -0.1990028, -0.4418183, 1, 0.3294118, 0, 1,
-1.490577, -1.91897, -2.550701, 1, 0.3372549, 0, 1,
-1.483466, -1.075107, -3.522324, 1, 0.3411765, 0, 1,
-1.476915, -2.192653, -2.677014, 1, 0.3490196, 0, 1,
-1.461315, -1.534675, -3.640371, 1, 0.3529412, 0, 1,
-1.44725, -0.6360256, -1.334754, 1, 0.3607843, 0, 1,
-1.444946, -0.2863223, -1.351589, 1, 0.3647059, 0, 1,
-1.443069, -0.4294402, -2.916883, 1, 0.372549, 0, 1,
-1.439685, 1.177303, -1.612985, 1, 0.3764706, 0, 1,
-1.422297, -0.351455, -3.632087, 1, 0.3843137, 0, 1,
-1.415543, 0.6925424, -0.4674997, 1, 0.3882353, 0, 1,
-1.407383, -0.7481881, -1.264587, 1, 0.3960784, 0, 1,
-1.397325, -0.006988295, -1.281226, 1, 0.4039216, 0, 1,
-1.390122, -0.4003898, -1.997837, 1, 0.4078431, 0, 1,
-1.385112, -0.5018743, -2.330059, 1, 0.4156863, 0, 1,
-1.380045, -1.643903, -1.733056, 1, 0.4196078, 0, 1,
-1.37386, -0.6150388, -2.862119, 1, 0.427451, 0, 1,
-1.37284, 0.5837705, -2.12384, 1, 0.4313726, 0, 1,
-1.372302, 1.300108, 0.7330202, 1, 0.4392157, 0, 1,
-1.365324, -1.043736, -1.408985, 1, 0.4431373, 0, 1,
-1.359662, -0.792079, -1.61927, 1, 0.4509804, 0, 1,
-1.357825, -1.471303, -3.035038, 1, 0.454902, 0, 1,
-1.356714, 1.750215, -1.47254, 1, 0.4627451, 0, 1,
-1.353258, 0.9409044, -0.4853118, 1, 0.4666667, 0, 1,
-1.350971, 0.9271022, 0.714335, 1, 0.4745098, 0, 1,
-1.348935, -0.1933871, -2.465673, 1, 0.4784314, 0, 1,
-1.348866, 0.3255914, -1.477607, 1, 0.4862745, 0, 1,
-1.347065, 1.372673, -2.211236, 1, 0.4901961, 0, 1,
-1.337619, -1.421716, -1.732482, 1, 0.4980392, 0, 1,
-1.330544, 1.380307, -2.514004, 1, 0.5058824, 0, 1,
-1.323947, -0.6216441, -4.396975, 1, 0.509804, 0, 1,
-1.32213, -1.425378, -3.200949, 1, 0.5176471, 0, 1,
-1.318773, -0.4758652, -2.050757, 1, 0.5215687, 0, 1,
-1.316533, 1.033687, 0.1442089, 1, 0.5294118, 0, 1,
-1.305874, 0.6332255, 0.8206987, 1, 0.5333334, 0, 1,
-1.297072, -1.706429, -2.440135, 1, 0.5411765, 0, 1,
-1.289091, -0.5766771, -2.756784, 1, 0.5450981, 0, 1,
-1.280241, 1.075431, -2.46375, 1, 0.5529412, 0, 1,
-1.277948, -0.959141, -2.773295, 1, 0.5568628, 0, 1,
-1.261669, 0.5170712, -0.6547045, 1, 0.5647059, 0, 1,
-1.24813, 0.02003794, -2.010989, 1, 0.5686275, 0, 1,
-1.23101, -1.054016, -1.964242, 1, 0.5764706, 0, 1,
-1.229174, 0.1148328, -1.059977, 1, 0.5803922, 0, 1,
-1.224046, -0.1751343, -2.756711, 1, 0.5882353, 0, 1,
-1.223505, 0.2237182, -1.055614, 1, 0.5921569, 0, 1,
-1.220541, 0.2470513, -1.631104, 1, 0.6, 0, 1,
-1.219863, 1.090782, -0.2182698, 1, 0.6078432, 0, 1,
-1.214333, -0.5511522, -2.466376, 1, 0.6117647, 0, 1,
-1.211182, 0.2346138, -1.496057, 1, 0.6196079, 0, 1,
-1.21116, 1.018921, -0.1112454, 1, 0.6235294, 0, 1,
-1.205098, -1.350271, -2.141878, 1, 0.6313726, 0, 1,
-1.204018, 0.5867622, -0.7193163, 1, 0.6352941, 0, 1,
-1.203372, 1.723342, -0.1535024, 1, 0.6431373, 0, 1,
-1.19637, -0.4965997, -2.292131, 1, 0.6470588, 0, 1,
-1.18101, -0.437689, -1.749151, 1, 0.654902, 0, 1,
-1.179665, -0.317112, -3.130425, 1, 0.6588235, 0, 1,
-1.173268, 0.1036223, -1.801925, 1, 0.6666667, 0, 1,
-1.173147, -1.513279, -1.247355, 1, 0.6705883, 0, 1,
-1.167231, 0.04104683, -0.4739763, 1, 0.6784314, 0, 1,
-1.163022, -0.7749735, -2.808091, 1, 0.682353, 0, 1,
-1.156553, 0.359217, -0.4951097, 1, 0.6901961, 0, 1,
-1.156325, 1.424302, -0.4925161, 1, 0.6941177, 0, 1,
-1.154704, 2.185402, -0.9729548, 1, 0.7019608, 0, 1,
-1.152823, 2.322922, 0.7939136, 1, 0.7098039, 0, 1,
-1.151731, 0.6612548, -0.8482321, 1, 0.7137255, 0, 1,
-1.150188, -1.068291, -2.036712, 1, 0.7215686, 0, 1,
-1.138307, 0.4564167, 0.7492566, 1, 0.7254902, 0, 1,
-1.136505, -1.165235, -3.309403, 1, 0.7333333, 0, 1,
-1.134293, 0.01083011, -2.24596, 1, 0.7372549, 0, 1,
-1.128474, -0.7615596, -0.2239072, 1, 0.7450981, 0, 1,
-1.12712, -0.8750578, -1.603468, 1, 0.7490196, 0, 1,
-1.125948, -2.261498, -2.228208, 1, 0.7568628, 0, 1,
-1.125794, -1.243174, -2.199321, 1, 0.7607843, 0, 1,
-1.124157, -1.137346, -2.206591, 1, 0.7686275, 0, 1,
-1.117469, 0.2568862, -2.370343, 1, 0.772549, 0, 1,
-1.115291, 0.9428417, -1.038546, 1, 0.7803922, 0, 1,
-1.114195, 0.5502264, -0.711216, 1, 0.7843137, 0, 1,
-1.113088, -1.531348, -3.145437, 1, 0.7921569, 0, 1,
-1.107101, 0.4106125, -0.9436247, 1, 0.7960784, 0, 1,
-1.101694, -0.6114097, -2.648557, 1, 0.8039216, 0, 1,
-1.101512, -0.3850058, -2.700186, 1, 0.8117647, 0, 1,
-1.099312, 0.3641183, -0.4196791, 1, 0.8156863, 0, 1,
-1.099075, -2.343248, -1.981543, 1, 0.8235294, 0, 1,
-1.090719, 0.2931388, -2.791274, 1, 0.827451, 0, 1,
-1.088966, -0.9991383, -4.014318, 1, 0.8352941, 0, 1,
-1.081916, -0.8600045, -3.887522, 1, 0.8392157, 0, 1,
-1.076867, 0.1426413, -0.4672561, 1, 0.8470588, 0, 1,
-1.075626, -0.5432645, -1.821396, 1, 0.8509804, 0, 1,
-1.074401, -0.4080297, -2.843348, 1, 0.8588235, 0, 1,
-1.069194, 0.2025354, -0.5719577, 1, 0.8627451, 0, 1,
-1.057941, -1.049553, -1.686342, 1, 0.8705882, 0, 1,
-1.0574, -1.821349, -2.627343, 1, 0.8745098, 0, 1,
-1.055388, 0.08676373, -1.116828, 1, 0.8823529, 0, 1,
-1.053361, -0.005791572, -1.295138, 1, 0.8862745, 0, 1,
-1.049753, 0.5002137, 0.09506588, 1, 0.8941177, 0, 1,
-1.045014, 1.173145, 0.5266665, 1, 0.8980392, 0, 1,
-1.036938, -1.176473, -2.133284, 1, 0.9058824, 0, 1,
-1.03358, -1.138977, -3.860025, 1, 0.9137255, 0, 1,
-1.032414, 0.03443239, -2.239142, 1, 0.9176471, 0, 1,
-1.030901, 0.3400762, -0.9694337, 1, 0.9254902, 0, 1,
-1.028617, -0.3980133, -1.504577, 1, 0.9294118, 0, 1,
-1.027835, 0.4506002, -1.232191, 1, 0.9372549, 0, 1,
-1.022269, 1.370457, 0.4912836, 1, 0.9411765, 0, 1,
-1.020224, -2.293447, -2.705658, 1, 0.9490196, 0, 1,
-1.019288, 2.098115, -2.019283, 1, 0.9529412, 0, 1,
-1.016872, -1.49475, -3.07853, 1, 0.9607843, 0, 1,
-1.016748, 0.7237331, -2.060588, 1, 0.9647059, 0, 1,
-1.014691, -0.547505, -1.821615, 1, 0.972549, 0, 1,
-1.013518, -1.053354, -1.03355, 1, 0.9764706, 0, 1,
-1.006801, 0.8348618, -1.45605, 1, 0.9843137, 0, 1,
-1.006744, 0.4437017, -2.391095, 1, 0.9882353, 0, 1,
-1.005817, 0.12024, -0.2412315, 1, 0.9960784, 0, 1,
-0.9900949, -0.3505297, -3.182758, 0.9960784, 1, 0, 1,
-0.9807624, 1.262076, -0.5568989, 0.9921569, 1, 0, 1,
-0.9800645, 0.2221951, -1.519121, 0.9843137, 1, 0, 1,
-0.9767832, -1.916579, -2.6234, 0.9803922, 1, 0, 1,
-0.9738835, 0.7903852, -1.266408, 0.972549, 1, 0, 1,
-0.971715, 0.05135038, -1.668447, 0.9686275, 1, 0, 1,
-0.9716691, -0.734336, -0.05784206, 0.9607843, 1, 0, 1,
-0.969841, -0.8472558, -3.228022, 0.9568627, 1, 0, 1,
-0.9688023, -0.5777901, -0.7268188, 0.9490196, 1, 0, 1,
-0.9677856, -1.91484, -2.311493, 0.945098, 1, 0, 1,
-0.967194, -0.08203971, -1.651876, 0.9372549, 1, 0, 1,
-0.9588719, -0.509643, -2.545965, 0.9333333, 1, 0, 1,
-0.9569132, -0.1429258, -3.017757, 0.9254902, 1, 0, 1,
-0.9552295, 1.328328, 0.9207345, 0.9215686, 1, 0, 1,
-0.9537882, -1.162379, -2.589467, 0.9137255, 1, 0, 1,
-0.9454522, 1.718392, -1.017267, 0.9098039, 1, 0, 1,
-0.9439764, 0.3298415, -2.34524, 0.9019608, 1, 0, 1,
-0.9439602, -1.17128, -4.822958, 0.8941177, 1, 0, 1,
-0.9427922, 1.298645, -0.1755915, 0.8901961, 1, 0, 1,
-0.9383054, -1.241116, -2.506141, 0.8823529, 1, 0, 1,
-0.9381832, -1.788034, -3.106617, 0.8784314, 1, 0, 1,
-0.935756, -1.013907, -3.232491, 0.8705882, 1, 0, 1,
-0.9320111, -1.371876, -1.911865, 0.8666667, 1, 0, 1,
-0.9286602, -1.071946, -2.898869, 0.8588235, 1, 0, 1,
-0.9277363, -0.6526367, -2.200716, 0.854902, 1, 0, 1,
-0.9225355, 1.104205, -1.21093, 0.8470588, 1, 0, 1,
-0.9186661, -1.025405, -2.260455, 0.8431373, 1, 0, 1,
-0.9156728, -1.534494, -1.785282, 0.8352941, 1, 0, 1,
-0.913448, 1.259542, -0.2844235, 0.8313726, 1, 0, 1,
-0.9127682, 2.102816, -0.04617438, 0.8235294, 1, 0, 1,
-0.9100437, 0.4274648, -0.3316687, 0.8196079, 1, 0, 1,
-0.9097173, 0.945223, -0.1011114, 0.8117647, 1, 0, 1,
-0.9094151, 0.5300598, -2.491139, 0.8078431, 1, 0, 1,
-0.9084197, 1.451952, -1.854173, 0.8, 1, 0, 1,
-0.9044731, 1.416318, -0.7554181, 0.7921569, 1, 0, 1,
-0.9017368, -1.590322, -2.697141, 0.7882353, 1, 0, 1,
-0.9012095, 3.110767, -0.3435349, 0.7803922, 1, 0, 1,
-0.891575, -0.1267502, -1.083519, 0.7764706, 1, 0, 1,
-0.8908011, 0.03186923, -1.215876, 0.7686275, 1, 0, 1,
-0.8903547, -1.196506, -2.129254, 0.7647059, 1, 0, 1,
-0.8812333, 0.1760256, -3.35393, 0.7568628, 1, 0, 1,
-0.8811173, -0.6232623, -1.292029, 0.7529412, 1, 0, 1,
-0.8806332, 0.384781, -1.656515, 0.7450981, 1, 0, 1,
-0.873311, -0.4985299, -2.403213, 0.7411765, 1, 0, 1,
-0.872068, -1.223777, -2.451123, 0.7333333, 1, 0, 1,
-0.8680642, 0.2845515, 1.459906, 0.7294118, 1, 0, 1,
-0.8656428, 0.3033691, 1.762914, 0.7215686, 1, 0, 1,
-0.8609344, 0.002505747, -1.898615, 0.7176471, 1, 0, 1,
-0.855983, 1.119658, -1.172535, 0.7098039, 1, 0, 1,
-0.851051, -0.9809323, -2.815315, 0.7058824, 1, 0, 1,
-0.8502452, -0.6478747, -2.234052, 0.6980392, 1, 0, 1,
-0.8500783, -0.01242505, -0.5570053, 0.6901961, 1, 0, 1,
-0.8449586, 1.045228, -0.6898332, 0.6862745, 1, 0, 1,
-0.8448755, 1.91265, -2.63251, 0.6784314, 1, 0, 1,
-0.8440965, 0.4220638, -0.1942468, 0.6745098, 1, 0, 1,
-0.8339508, -0.7406193, -1.778345, 0.6666667, 1, 0, 1,
-0.8313974, 0.1130093, -1.59553, 0.6627451, 1, 0, 1,
-0.8312852, 0.02506873, -1.111842, 0.654902, 1, 0, 1,
-0.8282391, -0.6490532, -1.861136, 0.6509804, 1, 0, 1,
-0.8275739, 1.047457, 0.9835837, 0.6431373, 1, 0, 1,
-0.8268106, -0.8216519, -0.5965657, 0.6392157, 1, 0, 1,
-0.8257302, -1.031616, -4.603479, 0.6313726, 1, 0, 1,
-0.8254634, -0.447841, -1.853368, 0.627451, 1, 0, 1,
-0.8224299, 1.525618, -1.051728, 0.6196079, 1, 0, 1,
-0.8195283, 0.2466675, -0.9431167, 0.6156863, 1, 0, 1,
-0.8183733, -0.1968224, -1.050787, 0.6078432, 1, 0, 1,
-0.810888, -1.667887, -0.2436067, 0.6039216, 1, 0, 1,
-0.804801, -1.458298, -3.764524, 0.5960785, 1, 0, 1,
-0.8036428, -1.743166, -2.799727, 0.5882353, 1, 0, 1,
-0.8021206, 1.088256, -0.2368975, 0.5843138, 1, 0, 1,
-0.7979857, 0.6366802, 1.260199, 0.5764706, 1, 0, 1,
-0.7851704, 1.1684, -0.01761589, 0.572549, 1, 0, 1,
-0.7728893, -0.07841111, -0.9571914, 0.5647059, 1, 0, 1,
-0.7710379, 2.499384, -0.1654636, 0.5607843, 1, 0, 1,
-0.7628996, 0.2759846, 0.5001879, 0.5529412, 1, 0, 1,
-0.7626547, 0.1535004, -1.452588, 0.5490196, 1, 0, 1,
-0.7620467, -0.8818249, 0.2297842, 0.5411765, 1, 0, 1,
-0.7574449, -0.07058994, 0.2736754, 0.5372549, 1, 0, 1,
-0.7533256, 0.3865166, 0.1620301, 0.5294118, 1, 0, 1,
-0.7513019, 2.264683, -2.735321, 0.5254902, 1, 0, 1,
-0.7511873, -0.5272576, -2.92966, 0.5176471, 1, 0, 1,
-0.7498291, -1.534295, -2.414575, 0.5137255, 1, 0, 1,
-0.7411022, 0.4552061, -2.091939, 0.5058824, 1, 0, 1,
-0.7391785, -0.8625281, -2.845709, 0.5019608, 1, 0, 1,
-0.7331282, -1.466577, -3.474729, 0.4941176, 1, 0, 1,
-0.7304249, -0.2493066, -1.09156, 0.4862745, 1, 0, 1,
-0.7286373, -0.1924469, 0.2216095, 0.4823529, 1, 0, 1,
-0.7275046, -0.4196855, -0.7322461, 0.4745098, 1, 0, 1,
-0.7263891, 0.2330594, -1.491494, 0.4705882, 1, 0, 1,
-0.7235073, -0.8193994, -2.526433, 0.4627451, 1, 0, 1,
-0.7198886, -0.8870191, -1.063744, 0.4588235, 1, 0, 1,
-0.7191023, 0.3544243, -0.2447646, 0.4509804, 1, 0, 1,
-0.7172945, 0.2866245, -1.063414, 0.4470588, 1, 0, 1,
-0.7151519, -0.1619611, -1.986507, 0.4392157, 1, 0, 1,
-0.7144526, 0.5019336, 0.01602001, 0.4352941, 1, 0, 1,
-0.7111232, -0.09250611, -1.617367, 0.427451, 1, 0, 1,
-0.7110951, 1.853469, -0.2615769, 0.4235294, 1, 0, 1,
-0.7102978, 0.4787936, 0.1707981, 0.4156863, 1, 0, 1,
-0.7067593, -0.03889544, -4.322902, 0.4117647, 1, 0, 1,
-0.7014593, -0.4130018, -4.111539, 0.4039216, 1, 0, 1,
-0.6947801, 0.5054334, -0.7073582, 0.3960784, 1, 0, 1,
-0.6945434, 0.903034, -1.167086, 0.3921569, 1, 0, 1,
-0.6885129, 1.651674, -1.178516, 0.3843137, 1, 0, 1,
-0.686998, 1.87263, 1.453362, 0.3803922, 1, 0, 1,
-0.6829994, 0.3613403, 0.2624043, 0.372549, 1, 0, 1,
-0.6819066, -1.123195, -1.485224, 0.3686275, 1, 0, 1,
-0.6770868, 0.5931066, -0.4425051, 0.3607843, 1, 0, 1,
-0.6743892, -1.16404, -5.216157, 0.3568628, 1, 0, 1,
-0.6687092, -0.028545, -0.9137545, 0.3490196, 1, 0, 1,
-0.6676143, 0.2660145, -2.151302, 0.345098, 1, 0, 1,
-0.6658898, 1.563796, -1.239957, 0.3372549, 1, 0, 1,
-0.6641313, 0.2926531, -0.2072789, 0.3333333, 1, 0, 1,
-0.656821, -0.2255855, -2.39484, 0.3254902, 1, 0, 1,
-0.6557109, -0.5806543, -3.719618, 0.3215686, 1, 0, 1,
-0.6544972, -0.4551435, -1.360737, 0.3137255, 1, 0, 1,
-0.6465573, 0.2288262, -1.958827, 0.3098039, 1, 0, 1,
-0.646036, -2.047779, -1.719047, 0.3019608, 1, 0, 1,
-0.6454086, 0.08488605, -0.3562114, 0.2941177, 1, 0, 1,
-0.6393954, 0.1425863, -0.6375996, 0.2901961, 1, 0, 1,
-0.6355637, -0.1312677, -1.711116, 0.282353, 1, 0, 1,
-0.6320908, 0.6724818, -2.503363, 0.2784314, 1, 0, 1,
-0.6261455, 1.370614, 0.1818651, 0.2705882, 1, 0, 1,
-0.6251937, 0.4329096, -0.4640701, 0.2666667, 1, 0, 1,
-0.6177022, 1.36409, -0.8033435, 0.2588235, 1, 0, 1,
-0.6176961, 1.487523, 0.2178866, 0.254902, 1, 0, 1,
-0.6167585, 0.4050947, -1.49615, 0.2470588, 1, 0, 1,
-0.6164077, -0.4983909, -3.676587, 0.2431373, 1, 0, 1,
-0.6151359, 0.7168187, 0.2722247, 0.2352941, 1, 0, 1,
-0.6139794, 0.1285005, -1.889232, 0.2313726, 1, 0, 1,
-0.6081105, -0.3413185, -3.239929, 0.2235294, 1, 0, 1,
-0.6037683, -0.3099907, -3.836613, 0.2196078, 1, 0, 1,
-0.6027494, -0.663525, -0.9783565, 0.2117647, 1, 0, 1,
-0.6023766, -0.0771588, -1.156808, 0.2078431, 1, 0, 1,
-0.6019017, -0.7194623, -1.598747, 0.2, 1, 0, 1,
-0.5907486, -0.1087992, -1.094519, 0.1921569, 1, 0, 1,
-0.5797749, -1.304174, -1.882797, 0.1882353, 1, 0, 1,
-0.579322, 1.019458, -2.003008, 0.1803922, 1, 0, 1,
-0.576774, -0.3053775, -1.41255, 0.1764706, 1, 0, 1,
-0.5765186, 0.1049387, 0.8037908, 0.1686275, 1, 0, 1,
-0.5764483, 2.517161, 0.5318177, 0.1647059, 1, 0, 1,
-0.5752069, 0.01015377, -0.6533216, 0.1568628, 1, 0, 1,
-0.5746865, 1.098485, -0.7852041, 0.1529412, 1, 0, 1,
-0.5707222, 0.5741283, 1.150647, 0.145098, 1, 0, 1,
-0.5706527, -0.04657952, 0.1996435, 0.1411765, 1, 0, 1,
-0.5705448, -0.956619, -2.687408, 0.1333333, 1, 0, 1,
-0.5671569, -0.5528419, -0.5651983, 0.1294118, 1, 0, 1,
-0.5596805, 1.866914, 1.426799, 0.1215686, 1, 0, 1,
-0.5558938, -1.077765, -2.231983, 0.1176471, 1, 0, 1,
-0.5544653, -1.94336, -3.739676, 0.1098039, 1, 0, 1,
-0.5535902, 1.048899, -1.363619, 0.1058824, 1, 0, 1,
-0.5520006, -0.01470004, 0.4518836, 0.09803922, 1, 0, 1,
-0.5482115, 0.3839091, -0.5614346, 0.09019608, 1, 0, 1,
-0.5464025, 0.9115828, -0.7631235, 0.08627451, 1, 0, 1,
-0.5451024, 2.203334, 0.6432144, 0.07843138, 1, 0, 1,
-0.5441505, 0.7315726, -1.987074, 0.07450981, 1, 0, 1,
-0.5381985, -0.2529002, -3.116819, 0.06666667, 1, 0, 1,
-0.5379884, -1.296293, -3.333736, 0.0627451, 1, 0, 1,
-0.5378494, 0.5508921, 0.05703433, 0.05490196, 1, 0, 1,
-0.5357137, -0.02090312, -1.881567, 0.05098039, 1, 0, 1,
-0.5293565, 0.8617796, 0.1096459, 0.04313726, 1, 0, 1,
-0.52934, 0.2009177, -1.454176, 0.03921569, 1, 0, 1,
-0.5290373, -1.48342, -2.143978, 0.03137255, 1, 0, 1,
-0.5275337, 2.166702, -2.312876, 0.02745098, 1, 0, 1,
-0.527011, 0.6139313, -0.05246445, 0.01960784, 1, 0, 1,
-0.5190722, 1.298248, 0.3173168, 0.01568628, 1, 0, 1,
-0.5139244, 0.1310974, -1.796356, 0.007843138, 1, 0, 1,
-0.5119727, -1.608614, -3.890138, 0.003921569, 1, 0, 1,
-0.5117732, 1.022371, -0.997065, 0, 1, 0.003921569, 1,
-0.5087744, 0.9291737, 0.8764274, 0, 1, 0.01176471, 1,
-0.508587, -0.5466502, -2.459551, 0, 1, 0.01568628, 1,
-0.507441, 0.1670282, -2.026134, 0, 1, 0.02352941, 1,
-0.5047868, 0.1588413, -1.920491, 0, 1, 0.02745098, 1,
-0.5047798, -0.7103598, -2.103207, 0, 1, 0.03529412, 1,
-0.4981143, 0.3542628, -0.7333345, 0, 1, 0.03921569, 1,
-0.4974711, -0.3217835, -3.809059, 0, 1, 0.04705882, 1,
-0.4962944, -0.8247175, -2.473212, 0, 1, 0.05098039, 1,
-0.4945285, 1.433636, 0.7160155, 0, 1, 0.05882353, 1,
-0.4933367, -0.4773418, -2.701613, 0, 1, 0.0627451, 1,
-0.4930784, 1.442243, -1.005086, 0, 1, 0.07058824, 1,
-0.4910049, -0.5581456, -3.157432, 0, 1, 0.07450981, 1,
-0.4878281, -0.2147419, -0.9983779, 0, 1, 0.08235294, 1,
-0.4874732, 0.229186, -0.4915601, 0, 1, 0.08627451, 1,
-0.4789485, -1.861101, -4.260686, 0, 1, 0.09411765, 1,
-0.4781596, 1.371956, 1.431414, 0, 1, 0.1019608, 1,
-0.4772499, -0.6225114, -3.734426, 0, 1, 0.1058824, 1,
-0.4732344, -0.7276521, -3.688965, 0, 1, 0.1137255, 1,
-0.470643, -0.03220504, -0.7269557, 0, 1, 0.1176471, 1,
-0.4698769, 1.482776, -0.1795983, 0, 1, 0.1254902, 1,
-0.4668094, 0.5091968, 0.732738, 0, 1, 0.1294118, 1,
-0.4660149, -0.8165595, -3.473138, 0, 1, 0.1372549, 1,
-0.465098, 1.034413, -0.1033191, 0, 1, 0.1411765, 1,
-0.4571402, 0.9574879, 0.322283, 0, 1, 0.1490196, 1,
-0.4527773, -1.183425, -3.187269, 0, 1, 0.1529412, 1,
-0.4501484, -0.3326427, -0.7145885, 0, 1, 0.1607843, 1,
-0.4422648, 0.6565236, 0.1068142, 0, 1, 0.1647059, 1,
-0.4405118, -0.2236844, -1.625628, 0, 1, 0.172549, 1,
-0.4402151, -0.2142495, -2.73392, 0, 1, 0.1764706, 1,
-0.4344868, 0.1303692, -1.044569, 0, 1, 0.1843137, 1,
-0.4316968, 0.9063427, -0.7151954, 0, 1, 0.1882353, 1,
-0.4276778, 0.8888354, -0.8284098, 0, 1, 0.1960784, 1,
-0.4244721, 0.1744812, -1.157006, 0, 1, 0.2039216, 1,
-0.4215023, -0.6210405, -2.278887, 0, 1, 0.2078431, 1,
-0.419656, -1.618404, -2.33512, 0, 1, 0.2156863, 1,
-0.4192754, -2.538077, -4.414567, 0, 1, 0.2196078, 1,
-0.4165691, 0.9122639, -0.2867247, 0, 1, 0.227451, 1,
-0.4163999, 0.2827747, -0.2473846, 0, 1, 0.2313726, 1,
-0.4150653, -1.140568, -3.508067, 0, 1, 0.2392157, 1,
-0.4070578, 0.2730981, -1.873652, 0, 1, 0.2431373, 1,
-0.4056864, 0.2418729, -1.241685, 0, 1, 0.2509804, 1,
-0.4035731, 1.086344, -1.687005, 0, 1, 0.254902, 1,
-0.4032073, 0.9835315, -1.155954, 0, 1, 0.2627451, 1,
-0.4019234, -1.070574, -2.916138, 0, 1, 0.2666667, 1,
-0.4008118, -0.7288155, -3.208636, 0, 1, 0.2745098, 1,
-0.4001056, -0.3551541, -3.577327, 0, 1, 0.2784314, 1,
-0.3996152, -0.05260599, -1.748211, 0, 1, 0.2862745, 1,
-0.3993509, 0.380052, -0.8680323, 0, 1, 0.2901961, 1,
-0.399118, -0.06381891, -1.458773, 0, 1, 0.2980392, 1,
-0.3962136, 0.1168366, -0.3138922, 0, 1, 0.3058824, 1,
-0.3940187, -0.7207501, -1.694221, 0, 1, 0.3098039, 1,
-0.3914321, -1.387928, -3.170289, 0, 1, 0.3176471, 1,
-0.3910247, 1.262149, -0.151697, 0, 1, 0.3215686, 1,
-0.389323, 0.2465764, -1.070741, 0, 1, 0.3294118, 1,
-0.3851756, 1.035387, 0.009695943, 0, 1, 0.3333333, 1,
-0.3834185, 0.6203777, -1.232487, 0, 1, 0.3411765, 1,
-0.3822349, -1.423713, -1.909948, 0, 1, 0.345098, 1,
-0.3773785, 0.9879645, 1.182495, 0, 1, 0.3529412, 1,
-0.3719145, 0.4027097, -0.09666269, 0, 1, 0.3568628, 1,
-0.3715926, 1.019798, -1.004712, 0, 1, 0.3647059, 1,
-0.3676671, -1.316738, -2.209906, 0, 1, 0.3686275, 1,
-0.361973, 0.09360293, -0.9727264, 0, 1, 0.3764706, 1,
-0.3600726, -1.137412, -2.7375, 0, 1, 0.3803922, 1,
-0.3595567, -0.9297529, -2.470277, 0, 1, 0.3882353, 1,
-0.3571231, -1.144122, -1.852588, 0, 1, 0.3921569, 1,
-0.3564109, 0.1054746, -1.669288, 0, 1, 0.4, 1,
-0.3552734, -0.3225903, -2.19532, 0, 1, 0.4078431, 1,
-0.3551933, -2.243773, -3.788123, 0, 1, 0.4117647, 1,
-0.346716, -1.398262, -3.13642, 0, 1, 0.4196078, 1,
-0.3459798, -0.2302944, -2.288906, 0, 1, 0.4235294, 1,
-0.3446029, 0.03576079, -1.818775, 0, 1, 0.4313726, 1,
-0.3434067, -0.9484389, -2.962467, 0, 1, 0.4352941, 1,
-0.339416, -1.912845, -2.023369, 0, 1, 0.4431373, 1,
-0.3366669, -0.8164055, -2.940289, 0, 1, 0.4470588, 1,
-0.3272918, -0.8448211, -1.386122, 0, 1, 0.454902, 1,
-0.3266882, 0.2388646, 0.1552458, 0, 1, 0.4588235, 1,
-0.3218617, 0.1239076, -1.308432, 0, 1, 0.4666667, 1,
-0.3194862, 0.6280222, 0.4370754, 0, 1, 0.4705882, 1,
-0.3106193, -0.1563579, -2.926112, 0, 1, 0.4784314, 1,
-0.3047783, -0.0886649, -0.7306588, 0, 1, 0.4823529, 1,
-0.3010739, 0.4693381, -0.9659986, 0, 1, 0.4901961, 1,
-0.2951802, 0.1374797, -2.469792, 0, 1, 0.4941176, 1,
-0.2944269, -0.4054891, -0.9732143, 0, 1, 0.5019608, 1,
-0.2932754, 0.1006586, -1.862567, 0, 1, 0.509804, 1,
-0.2931604, -0.07612737, -3.098264, 0, 1, 0.5137255, 1,
-0.2925558, 0.003598014, -0.2285416, 0, 1, 0.5215687, 1,
-0.2869719, 1.564434, 0.4421916, 0, 1, 0.5254902, 1,
-0.2790161, 0.9928221, 0.2684381, 0, 1, 0.5333334, 1,
-0.2782622, -0.5664902, -3.24202, 0, 1, 0.5372549, 1,
-0.2767845, -0.1810082, -0.8098412, 0, 1, 0.5450981, 1,
-0.2761306, -0.63302, -2.644722, 0, 1, 0.5490196, 1,
-0.2680693, 0.9220816, -0.8149014, 0, 1, 0.5568628, 1,
-0.2670971, -0.4750714, -2.101681, 0, 1, 0.5607843, 1,
-0.2644587, -0.1642071, -2.73926, 0, 1, 0.5686275, 1,
-0.2572156, -0.8610099, -1.979927, 0, 1, 0.572549, 1,
-0.2552864, 1.086319, 1.076395, 0, 1, 0.5803922, 1,
-0.2541835, -2.624449, -0.1713273, 0, 1, 0.5843138, 1,
-0.249812, -0.3046849, -3.103615, 0, 1, 0.5921569, 1,
-0.2494315, 0.4835904, -0.5873659, 0, 1, 0.5960785, 1,
-0.2464109, -1.356258, -2.354525, 0, 1, 0.6039216, 1,
-0.2436781, -1.106667, -4.307237, 0, 1, 0.6117647, 1,
-0.2412412, -1.327381, -2.126719, 0, 1, 0.6156863, 1,
-0.2407016, -0.2632891, -3.005201, 0, 1, 0.6235294, 1,
-0.2405286, -0.7010906, -3.73172, 0, 1, 0.627451, 1,
-0.2381594, -1.211696, -4.44293, 0, 1, 0.6352941, 1,
-0.2376269, -0.9405742, -2.444199, 0, 1, 0.6392157, 1,
-0.2349674, 1.141767, -1.531988, 0, 1, 0.6470588, 1,
-0.2293568, -0.2137698, -3.66714, 0, 1, 0.6509804, 1,
-0.2289034, -0.737728, -3.404664, 0, 1, 0.6588235, 1,
-0.2257784, 0.4230227, -0.3551333, 0, 1, 0.6627451, 1,
-0.2144103, 0.6327763, -0.3489607, 0, 1, 0.6705883, 1,
-0.214115, 2.898418, -0.9574413, 0, 1, 0.6745098, 1,
-0.2099665, 0.3734548, -0.2222586, 0, 1, 0.682353, 1,
-0.2091182, -0.4960569, 0.5017679, 0, 1, 0.6862745, 1,
-0.2027, 1.113559, -0.01067615, 0, 1, 0.6941177, 1,
-0.2015763, -0.7611922, -2.629912, 0, 1, 0.7019608, 1,
-0.1966339, -1.68603, -2.850766, 0, 1, 0.7058824, 1,
-0.1959786, 0.1894143, -0.1342916, 0, 1, 0.7137255, 1,
-0.1905466, -0.2134359, -1.701387, 0, 1, 0.7176471, 1,
-0.1892947, -0.8579474, -1.898873, 0, 1, 0.7254902, 1,
-0.18653, 0.09754193, -2.636427, 0, 1, 0.7294118, 1,
-0.1819328, 0.4093818, 0.1314296, 0, 1, 0.7372549, 1,
-0.1801018, 0.2126982, -0.1337526, 0, 1, 0.7411765, 1,
-0.1714924, 0.1496181, -0.6276426, 0, 1, 0.7490196, 1,
-0.1696759, 0.08702516, -1.223974, 0, 1, 0.7529412, 1,
-0.1636231, 2.588003, 1.588367, 0, 1, 0.7607843, 1,
-0.1607324, -0.4959401, -2.497838, 0, 1, 0.7647059, 1,
-0.1603094, -0.76623, -1.636327, 0, 1, 0.772549, 1,
-0.1599036, -1.454879, -3.028936, 0, 1, 0.7764706, 1,
-0.1593758, -2.055831, -1.287553, 0, 1, 0.7843137, 1,
-0.1589283, -0.4820673, -0.5588409, 0, 1, 0.7882353, 1,
-0.1582048, 0.4812284, -0.3072382, 0, 1, 0.7960784, 1,
-0.1565707, -2.052971, -3.363973, 0, 1, 0.8039216, 1,
-0.1474579, 0.6852717, 0.6467565, 0, 1, 0.8078431, 1,
-0.1381604, 0.001593642, -1.395443, 0, 1, 0.8156863, 1,
-0.1373492, -0.04787545, -1.37674, 0, 1, 0.8196079, 1,
-0.1360853, -0.7152765, -3.063734, 0, 1, 0.827451, 1,
-0.1343273, -1.803564, -1.906346, 0, 1, 0.8313726, 1,
-0.1313258, 0.8109809, 0.6330976, 0, 1, 0.8392157, 1,
-0.1272683, -1.638749, -5.988927, 0, 1, 0.8431373, 1,
-0.125175, -0.9561432, -3.948189, 0, 1, 0.8509804, 1,
-0.1220163, -0.09009028, -3.410693, 0, 1, 0.854902, 1,
-0.1206166, 0.2050728, -0.7197368, 0, 1, 0.8627451, 1,
-0.1197029, -0.2602305, -2.931298, 0, 1, 0.8666667, 1,
-0.1155629, 0.3153734, 0.736809, 0, 1, 0.8745098, 1,
-0.1148712, 0.2404001, 0.008345132, 0, 1, 0.8784314, 1,
-0.1140629, -1.55792, -4.027005, 0, 1, 0.8862745, 1,
-0.1102517, -0.4835838, -2.817882, 0, 1, 0.8901961, 1,
-0.1086138, 2.227945, -0.7440178, 0, 1, 0.8980392, 1,
-0.1084138, 0.941088, -1.151359, 0, 1, 0.9058824, 1,
-0.1076944, -0.07972056, -2.780825, 0, 1, 0.9098039, 1,
-0.1036853, -1.658646, -4.550871, 0, 1, 0.9176471, 1,
-0.1033406, 0.09960754, -0.6190243, 0, 1, 0.9215686, 1,
-0.1024112, 0.1348755, 0.4309967, 0, 1, 0.9294118, 1,
-0.09992553, -1.658759, -3.555807, 0, 1, 0.9333333, 1,
-0.09987152, 0.06655053, -0.349565, 0, 1, 0.9411765, 1,
-0.09616526, 1.709572, -0.4924733, 0, 1, 0.945098, 1,
-0.09052034, 0.7344094, 0.05547231, 0, 1, 0.9529412, 1,
-0.08788368, -0.2414724, -1.813027, 0, 1, 0.9568627, 1,
-0.08429566, -1.05122, -1.470734, 0, 1, 0.9647059, 1,
-0.08349054, -1.060931, -2.362365, 0, 1, 0.9686275, 1,
-0.08348002, -1.525318, -2.668377, 0, 1, 0.9764706, 1,
-0.08198106, -0.7676833, -4.1486, 0, 1, 0.9803922, 1,
-0.07362755, 0.1093655, -1.391253, 0, 1, 0.9882353, 1,
-0.07268286, 0.8363, -1.319494, 0, 1, 0.9921569, 1,
-0.07204597, -0.3199001, -0.942776, 0, 1, 1, 1,
-0.0719296, 1.455179, -1.318907, 0, 0.9921569, 1, 1,
-0.07188617, 2.210705, -1.138183, 0, 0.9882353, 1, 1,
-0.06835173, 0.30442, 0.7353203, 0, 0.9803922, 1, 1,
-0.06535515, 0.3402215, -0.8428339, 0, 0.9764706, 1, 1,
-0.06411787, 0.8886492, -0.2551418, 0, 0.9686275, 1, 1,
-0.06050382, 0.02490936, 0.1412449, 0, 0.9647059, 1, 1,
-0.05654036, 1.074294, -1.151716, 0, 0.9568627, 1, 1,
-0.05029696, 0.4491283, -0.2273924, 0, 0.9529412, 1, 1,
-0.04758628, 0.2978524, 0.4600415, 0, 0.945098, 1, 1,
-0.04543853, -1.149265, -3.326098, 0, 0.9411765, 1, 1,
-0.0406804, -1.039547, -4.772911, 0, 0.9333333, 1, 1,
-0.03956823, 0.5124735, -1.965527, 0, 0.9294118, 1, 1,
-0.03809399, -0.4918661, -4.130699, 0, 0.9215686, 1, 1,
-0.03527154, -1.657727, -4.354434, 0, 0.9176471, 1, 1,
-0.03120521, 0.2753909, 0.2425638, 0, 0.9098039, 1, 1,
-0.03119585, -1.166019, -2.040559, 0, 0.9058824, 1, 1,
-0.02592563, -0.6202621, -3.285632, 0, 0.8980392, 1, 1,
-0.02543116, 1.175794, -0.5683616, 0, 0.8901961, 1, 1,
-0.02323869, 0.1219033, 0.859966, 0, 0.8862745, 1, 1,
-0.02171225, -0.5993986, -3.724003, 0, 0.8784314, 1, 1,
-0.02003831, -0.2543918, -1.420466, 0, 0.8745098, 1, 1,
-0.01810224, -1.195714, -2.846071, 0, 0.8666667, 1, 1,
-0.01793833, -2.252344, -1.856535, 0, 0.8627451, 1, 1,
-0.0140198, 0.6692296, 0.6387331, 0, 0.854902, 1, 1,
-0.006113293, -0.6010728, -2.590559, 0, 0.8509804, 1, 1,
-0.005448375, -0.3636066, -2.806632, 0, 0.8431373, 1, 1,
-0.005034068, -0.5864852, -3.938265, 0, 0.8392157, 1, 1,
-0.002802446, -1.085257, -5.483044, 0, 0.8313726, 1, 1,
0.00543639, 1.383618, -0.71599, 0, 0.827451, 1, 1,
0.007077334, 0.8287701, 1.791075, 0, 0.8196079, 1, 1,
0.008943993, 1.072381, 0.1379102, 0, 0.8156863, 1, 1,
0.009207859, -0.3288462, 3.814347, 0, 0.8078431, 1, 1,
0.01596323, -0.2397279, 2.808117, 0, 0.8039216, 1, 1,
0.01655974, 0.01885488, -1.277356, 0, 0.7960784, 1, 1,
0.02000833, -0.1178211, 4.94389, 0, 0.7882353, 1, 1,
0.02170897, -1.045022, 2.591887, 0, 0.7843137, 1, 1,
0.02806239, -0.0718788, 1.438285, 0, 0.7764706, 1, 1,
0.0378274, 1.111458, 0.9677399, 0, 0.772549, 1, 1,
0.04231741, 0.2806904, -0.3576631, 0, 0.7647059, 1, 1,
0.05392013, 1.430014, -1.210241, 0, 0.7607843, 1, 1,
0.0540724, 0.3590996, 0.305935, 0, 0.7529412, 1, 1,
0.05787626, -2.215955, 3.154594, 0, 0.7490196, 1, 1,
0.06077165, 2.620797, 1.436865, 0, 0.7411765, 1, 1,
0.06270717, -1.609206, 2.830579, 0, 0.7372549, 1, 1,
0.0647516, -1.243703, 3.66089, 0, 0.7294118, 1, 1,
0.06693061, 0.02218322, -0.7998668, 0, 0.7254902, 1, 1,
0.07045885, -0.7297235, 4.003997, 0, 0.7176471, 1, 1,
0.07175835, 1.323159, 0.2505508, 0, 0.7137255, 1, 1,
0.07294272, 0.3371772, -0.2418771, 0, 0.7058824, 1, 1,
0.07748421, -1.32465, 2.964399, 0, 0.6980392, 1, 1,
0.08422718, -1.539542, 2.785055, 0, 0.6941177, 1, 1,
0.08430257, -1.406646, 4.118762, 0, 0.6862745, 1, 1,
0.08623847, 0.2470739, -0.5310721, 0, 0.682353, 1, 1,
0.08836707, -0.7521449, 2.375345, 0, 0.6745098, 1, 1,
0.09685337, 0.977814, -0.2181203, 0, 0.6705883, 1, 1,
0.09815218, -0.5292503, -0.4235697, 0, 0.6627451, 1, 1,
0.0995171, 1.575704, 1.672299, 0, 0.6588235, 1, 1,
0.09971032, -0.3428283, 3.356659, 0, 0.6509804, 1, 1,
0.1002736, -1.154283, 2.632961, 0, 0.6470588, 1, 1,
0.1016216, 0.08125884, 0.7828686, 0, 0.6392157, 1, 1,
0.1020728, -1.521484, 4.296283, 0, 0.6352941, 1, 1,
0.1024837, -0.5981925, 3.021074, 0, 0.627451, 1, 1,
0.1050251, -0.5028933, 2.622249, 0, 0.6235294, 1, 1,
0.1075846, -0.4753004, 3.451988, 0, 0.6156863, 1, 1,
0.1096444, 0.5050176, -0.3710769, 0, 0.6117647, 1, 1,
0.1096949, -0.2306965, 2.928318, 0, 0.6039216, 1, 1,
0.1135785, -0.422375, 2.785022, 0, 0.5960785, 1, 1,
0.1141051, -1.661247, 1.953358, 0, 0.5921569, 1, 1,
0.1203461, 0.7412969, 0.03467914, 0, 0.5843138, 1, 1,
0.1205484, 0.9751378, 0.3400878, 0, 0.5803922, 1, 1,
0.1222279, -0.8729218, 4.836614, 0, 0.572549, 1, 1,
0.1228402, -1.061931, 2.925392, 0, 0.5686275, 1, 1,
0.1263705, -0.465343, 3.165628, 0, 0.5607843, 1, 1,
0.1313963, 0.1489685, 0.2508185, 0, 0.5568628, 1, 1,
0.1327153, -0.6518335, 4.925874, 0, 0.5490196, 1, 1,
0.1332366, 0.3229881, 1.368668, 0, 0.5450981, 1, 1,
0.1335569, -2.138566, 2.483823, 0, 0.5372549, 1, 1,
0.138009, -1.180487, 2.605917, 0, 0.5333334, 1, 1,
0.1391019, 0.2616029, 3.07294, 0, 0.5254902, 1, 1,
0.1419444, -0.6413292, 0.6049187, 0, 0.5215687, 1, 1,
0.1450542, -0.3637978, 1.831689, 0, 0.5137255, 1, 1,
0.1481237, -2.78141, 2.997673, 0, 0.509804, 1, 1,
0.1493326, -0.9545887, 2.767676, 0, 0.5019608, 1, 1,
0.1503279, -1.685227, 3.883006, 0, 0.4941176, 1, 1,
0.1556205, 1.854166, -0.5094485, 0, 0.4901961, 1, 1,
0.1578794, 0.1040464, 0.9516992, 0, 0.4823529, 1, 1,
0.1589839, 0.2081884, 1.49941, 0, 0.4784314, 1, 1,
0.1647921, 0.3268044, -0.3805082, 0, 0.4705882, 1, 1,
0.1651048, -0.519203, 2.673947, 0, 0.4666667, 1, 1,
0.168038, -0.5196248, 3.117261, 0, 0.4588235, 1, 1,
0.1687618, 0.4635644, 1.662047, 0, 0.454902, 1, 1,
0.1798639, 0.7787858, 1.63934, 0, 0.4470588, 1, 1,
0.1833527, -2.185889, 1.075787, 0, 0.4431373, 1, 1,
0.1850691, -1.894173, 2.419709, 0, 0.4352941, 1, 1,
0.1857264, -0.1189997, 3.238911, 0, 0.4313726, 1, 1,
0.1870013, -0.8018528, 1.111313, 0, 0.4235294, 1, 1,
0.1992401, 0.60343, 1.954133, 0, 0.4196078, 1, 1,
0.2012162, -1.520647, 1.329269, 0, 0.4117647, 1, 1,
0.2061261, 1.877919, -0.9659979, 0, 0.4078431, 1, 1,
0.2070891, 0.5299617, -0.8147053, 0, 0.4, 1, 1,
0.2104364, 1.229864, -0.5879965, 0, 0.3921569, 1, 1,
0.2114338, 0.4312261, 0.9830181, 0, 0.3882353, 1, 1,
0.2120197, -1.082468, 3.66541, 0, 0.3803922, 1, 1,
0.2126404, -0.9706522, 1.708268, 0, 0.3764706, 1, 1,
0.2162429, 0.5953245, 0.5291851, 0, 0.3686275, 1, 1,
0.2178568, -0.2151076, 1.96084, 0, 0.3647059, 1, 1,
0.2185924, 1.230102, -0.1104893, 0, 0.3568628, 1, 1,
0.2197946, -0.5273122, 2.902245, 0, 0.3529412, 1, 1,
0.2237841, 0.2963891, -1.630701, 0, 0.345098, 1, 1,
0.2313609, 0.5436155, 0.2481099, 0, 0.3411765, 1, 1,
0.2346421, -0.4005864, 2.945166, 0, 0.3333333, 1, 1,
0.2434757, 0.5628417, 0.09016236, 0, 0.3294118, 1, 1,
0.247301, 0.980481, -0.3423312, 0, 0.3215686, 1, 1,
0.2594953, 0.9794174, -0.2107274, 0, 0.3176471, 1, 1,
0.2617859, -0.3278418, 2.932369, 0, 0.3098039, 1, 1,
0.2625072, 0.9332314, -0.7250124, 0, 0.3058824, 1, 1,
0.2641244, -1.054521, 4.601414, 0, 0.2980392, 1, 1,
0.2677788, -0.7451025, 1.603468, 0, 0.2901961, 1, 1,
0.2683001, 1.287129, 0.6218233, 0, 0.2862745, 1, 1,
0.2702847, 0.9863851, -2.128393, 0, 0.2784314, 1, 1,
0.2704963, -0.8176943, 3.42828, 0, 0.2745098, 1, 1,
0.2709598, 1.349693, -0.9309545, 0, 0.2666667, 1, 1,
0.2740124, -0.02208593, 1.545841, 0, 0.2627451, 1, 1,
0.2750348, 2.608679, -0.3521003, 0, 0.254902, 1, 1,
0.2772627, 0.1053425, 1.074263, 0, 0.2509804, 1, 1,
0.2774808, 0.05366429, 0.9491256, 0, 0.2431373, 1, 1,
0.279349, 0.3328559, -0.5811331, 0, 0.2392157, 1, 1,
0.2829163, -0.3016124, 1.874321, 0, 0.2313726, 1, 1,
0.2855827, 1.557441, 0.03213827, 0, 0.227451, 1, 1,
0.2930304, 0.9154469, 1.041516, 0, 0.2196078, 1, 1,
0.2978354, -0.4546001, 1.238481, 0, 0.2156863, 1, 1,
0.2989233, 0.3740549, 1.845183, 0, 0.2078431, 1, 1,
0.3080859, -1.159612, 2.205142, 0, 0.2039216, 1, 1,
0.315125, 0.135228, 1.58173, 0, 0.1960784, 1, 1,
0.3237785, -2.909103, 2.454369, 0, 0.1882353, 1, 1,
0.3253396, 0.1465482, -2.190581, 0, 0.1843137, 1, 1,
0.333011, 0.3680209, 0.5781811, 0, 0.1764706, 1, 1,
0.3332205, 0.5246983, -0.4189165, 0, 0.172549, 1, 1,
0.3349656, -0.2424096, 3.833752, 0, 0.1647059, 1, 1,
0.3376419, -0.1630022, 0.3253081, 0, 0.1607843, 1, 1,
0.3419997, -0.3629687, 3.783716, 0, 0.1529412, 1, 1,
0.3433415, 0.3688763, 0.7542575, 0, 0.1490196, 1, 1,
0.3446736, 0.2683297, 1.131686, 0, 0.1411765, 1, 1,
0.3455382, -0.4232605, 2.872535, 0, 0.1372549, 1, 1,
0.3482771, -0.8851604, 3.144451, 0, 0.1294118, 1, 1,
0.349694, 0.2233781, -0.8912533, 0, 0.1254902, 1, 1,
0.3507604, -1.790358, 1.133034, 0, 0.1176471, 1, 1,
0.3526751, 1.294128, 1.007704, 0, 0.1137255, 1, 1,
0.3543323, -0.2799894, 3.062756, 0, 0.1058824, 1, 1,
0.3558103, -0.1074166, 1.56999, 0, 0.09803922, 1, 1,
0.357461, -1.912936, 3.006797, 0, 0.09411765, 1, 1,
0.3715092, -1.022674, 3.664392, 0, 0.08627451, 1, 1,
0.371568, -0.4718671, 3.371493, 0, 0.08235294, 1, 1,
0.3775041, 0.870527, 1.20172, 0, 0.07450981, 1, 1,
0.3793193, 0.3726254, 1.035095, 0, 0.07058824, 1, 1,
0.3807494, 2.488247, -0.3492781, 0, 0.0627451, 1, 1,
0.38436, -1.373904, 3.568398, 0, 0.05882353, 1, 1,
0.3859478, -1.372082, 3.958053, 0, 0.05098039, 1, 1,
0.3901865, 1.173938, -1.664862, 0, 0.04705882, 1, 1,
0.3968486, 0.580345, 1.38517, 0, 0.03921569, 1, 1,
0.3990082, 0.4624834, 1.273744, 0, 0.03529412, 1, 1,
0.4015, 0.4556805, 0.5294135, 0, 0.02745098, 1, 1,
0.4050953, -0.6980319, 3.572187, 0, 0.02352941, 1, 1,
0.4057043, -1.727666, 4.360025, 0, 0.01568628, 1, 1,
0.4091233, -1.750096, 3.436121, 0, 0.01176471, 1, 1,
0.4097478, 0.949537, -0.6980036, 0, 0.003921569, 1, 1,
0.4113287, -0.3186802, 3.641968, 0.003921569, 0, 1, 1,
0.4117619, 1.237874, 1.052655, 0.007843138, 0, 1, 1,
0.4160539, 0.3734847, 0.6892043, 0.01568628, 0, 1, 1,
0.4160573, -0.6241203, 3.276998, 0.01960784, 0, 1, 1,
0.4205004, 0.02105233, 1.059252, 0.02745098, 0, 1, 1,
0.4211675, 1.028244, 1.618551, 0.03137255, 0, 1, 1,
0.42295, -0.05412472, 2.244914, 0.03921569, 0, 1, 1,
0.4243128, 2.551354, -0.2909891, 0.04313726, 0, 1, 1,
0.4284177, 1.429531, -0.6497501, 0.05098039, 0, 1, 1,
0.4286622, -0.9068151, 2.28118, 0.05490196, 0, 1, 1,
0.4315492, 0.1494955, 2.428969, 0.0627451, 0, 1, 1,
0.4414427, -0.2027531, 1.508528, 0.06666667, 0, 1, 1,
0.4437234, -1.562263, 1.595537, 0.07450981, 0, 1, 1,
0.4465475, 0.2369932, 0.9046839, 0.07843138, 0, 1, 1,
0.4538601, 0.04338927, 2.627687, 0.08627451, 0, 1, 1,
0.4544805, -0.4986406, 0.4447733, 0.09019608, 0, 1, 1,
0.4556895, -0.9382942, 0.3084125, 0.09803922, 0, 1, 1,
0.4560232, 0.6718801, 0.5106323, 0.1058824, 0, 1, 1,
0.4592328, 0.1163812, -0.6203727, 0.1098039, 0, 1, 1,
0.4680134, 0.03457691, 0.2552835, 0.1176471, 0, 1, 1,
0.4688165, 1.109246, -0.5467913, 0.1215686, 0, 1, 1,
0.4714526, -0.8269152, 0.9961252, 0.1294118, 0, 1, 1,
0.4790457, 0.6682542, -0.122451, 0.1333333, 0, 1, 1,
0.4798659, -0.8695401, 2.93592, 0.1411765, 0, 1, 1,
0.4809347, 0.3793564, -1.055545, 0.145098, 0, 1, 1,
0.4822985, -1.98047, 2.45929, 0.1529412, 0, 1, 1,
0.4838032, -0.1506292, 2.629663, 0.1568628, 0, 1, 1,
0.4915867, 0.9114011, 1.966419, 0.1647059, 0, 1, 1,
0.5002334, 0.101752, 0.5312209, 0.1686275, 0, 1, 1,
0.5043941, 0.1413258, 1.940268, 0.1764706, 0, 1, 1,
0.5080267, -0.4875115, 1.651231, 0.1803922, 0, 1, 1,
0.5099748, 0.3857886, 2.145174, 0.1882353, 0, 1, 1,
0.5188821, 1.055946, 1.415188, 0.1921569, 0, 1, 1,
0.5199103, 1.801993, -0.9417076, 0.2, 0, 1, 1,
0.52123, 0.2075564, 1.686546, 0.2078431, 0, 1, 1,
0.5214003, -0.6654173, 1.852873, 0.2117647, 0, 1, 1,
0.5222192, 0.9082175, 0.8680806, 0.2196078, 0, 1, 1,
0.5352209, 0.1057869, 0.6298945, 0.2235294, 0, 1, 1,
0.5369225, -1.137417, 2.53706, 0.2313726, 0, 1, 1,
0.537056, -1.13183, 2.175325, 0.2352941, 0, 1, 1,
0.5392403, -1.392064, 3.51598, 0.2431373, 0, 1, 1,
0.5406283, 0.4938206, 2.264118, 0.2470588, 0, 1, 1,
0.5412975, 1.980229, 0.4001454, 0.254902, 0, 1, 1,
0.543014, 0.06976381, 3.24482, 0.2588235, 0, 1, 1,
0.5561528, -0.5466194, 2.95728, 0.2666667, 0, 1, 1,
0.5571624, 0.277318, 1.101084, 0.2705882, 0, 1, 1,
0.5591331, -1.172159, 2.823687, 0.2784314, 0, 1, 1,
0.5648815, 1.44989, 2.041608, 0.282353, 0, 1, 1,
0.5759841, -0.673824, 1.563044, 0.2901961, 0, 1, 1,
0.5825854, 1.248419, 0.1832872, 0.2941177, 0, 1, 1,
0.5903111, 0.4898453, 0.7389659, 0.3019608, 0, 1, 1,
0.5904603, -0.9050048, 4.589266, 0.3098039, 0, 1, 1,
0.5927827, 0.04498835, 2.788949, 0.3137255, 0, 1, 1,
0.5950648, -1.706183, 1.593053, 0.3215686, 0, 1, 1,
0.6130099, 0.6787481, 1.789671, 0.3254902, 0, 1, 1,
0.6166063, 1.314853, 1.305058, 0.3333333, 0, 1, 1,
0.6166483, -2.350763, 3.028409, 0.3372549, 0, 1, 1,
0.6237934, 1.171362, 0.447275, 0.345098, 0, 1, 1,
0.6255596, 0.9632279, -0.7915632, 0.3490196, 0, 1, 1,
0.6396655, -0.6785006, 4.505251, 0.3568628, 0, 1, 1,
0.6422292, 0.9916971, 1.44343, 0.3607843, 0, 1, 1,
0.6479609, -0.9414654, 3.578252, 0.3686275, 0, 1, 1,
0.6532261, 0.2349574, 2.210622, 0.372549, 0, 1, 1,
0.6532372, -0.1512768, 2.226889, 0.3803922, 0, 1, 1,
0.6544044, -1.545607, 3.026233, 0.3843137, 0, 1, 1,
0.6564287, 0.09098412, 1.615845, 0.3921569, 0, 1, 1,
0.6594123, 0.6012152, -0.2104756, 0.3960784, 0, 1, 1,
0.6717947, 0.3658009, -0.6108675, 0.4039216, 0, 1, 1,
0.6733779, -0.342314, 0.2613802, 0.4117647, 0, 1, 1,
0.6750985, 1.529242, 0.2881314, 0.4156863, 0, 1, 1,
0.6754098, 0.3832586, 0.3511235, 0.4235294, 0, 1, 1,
0.6757085, -0.5944269, 3.361298, 0.427451, 0, 1, 1,
0.6811746, 0.3297742, -0.4611244, 0.4352941, 0, 1, 1,
0.684608, 0.8206784, 0.7161511, 0.4392157, 0, 1, 1,
0.6847438, 1.032782, 1.28038, 0.4470588, 0, 1, 1,
0.6959562, 0.3397629, 2.12283, 0.4509804, 0, 1, 1,
0.6993634, 0.5815905, 1.97657, 0.4588235, 0, 1, 1,
0.7051536, -1.137897, 1.896409, 0.4627451, 0, 1, 1,
0.7055284, 0.03271619, 2.17475, 0.4705882, 0, 1, 1,
0.7081779, -1.492624, 0.7041921, 0.4745098, 0, 1, 1,
0.7101651, -0.5432081, 1.252272, 0.4823529, 0, 1, 1,
0.7177171, -0.9634283, 2.579423, 0.4862745, 0, 1, 1,
0.7200971, 0.6732005, 0.464845, 0.4941176, 0, 1, 1,
0.7260524, 2.036785, 0.3994682, 0.5019608, 0, 1, 1,
0.7264789, 0.5972396, -0.3286982, 0.5058824, 0, 1, 1,
0.742091, -0.4509594, 3.753952, 0.5137255, 0, 1, 1,
0.7430965, 0.3808143, 1.994713, 0.5176471, 0, 1, 1,
0.7466569, -1.681934, 2.746112, 0.5254902, 0, 1, 1,
0.7497491, 0.3949205, -0.1254339, 0.5294118, 0, 1, 1,
0.7498769, 0.3701259, 1.941018, 0.5372549, 0, 1, 1,
0.7499651, -1.441249, 2.659781, 0.5411765, 0, 1, 1,
0.7518098, -0.1200285, 2.394725, 0.5490196, 0, 1, 1,
0.7529026, -1.427273, 3.250262, 0.5529412, 0, 1, 1,
0.753228, 0.05115794, 1.742485, 0.5607843, 0, 1, 1,
0.7558407, -0.01866968, 2.589111, 0.5647059, 0, 1, 1,
0.7563645, -0.3472059, 0.6281319, 0.572549, 0, 1, 1,
0.7637239, -1.148212, 0.7138117, 0.5764706, 0, 1, 1,
0.7658362, -0.5953918, 4.052288, 0.5843138, 0, 1, 1,
0.7693419, 2.284709, -1.823395, 0.5882353, 0, 1, 1,
0.7733939, 1.478729, 3.324009, 0.5960785, 0, 1, 1,
0.7754378, -1.23067, 2.353688, 0.6039216, 0, 1, 1,
0.7754678, 0.1255975, 1.185075, 0.6078432, 0, 1, 1,
0.7810207, -0.5606223, 3.159807, 0.6156863, 0, 1, 1,
0.7816271, -0.5583021, 0.5874759, 0.6196079, 0, 1, 1,
0.7852209, -1.605879, 2.460865, 0.627451, 0, 1, 1,
0.7887611, 1.630933, 0.2491917, 0.6313726, 0, 1, 1,
0.7938958, 0.04979425, 1.692238, 0.6392157, 0, 1, 1,
0.7964292, -1.548069, 3.007082, 0.6431373, 0, 1, 1,
0.7969435, -0.7917178, 3.648087, 0.6509804, 0, 1, 1,
0.7994237, 0.56919, 2.88875, 0.654902, 0, 1, 1,
0.800927, 0.2647825, 1.221597, 0.6627451, 0, 1, 1,
0.801074, 0.943825, 0.1267648, 0.6666667, 0, 1, 1,
0.804904, -1.091766, 2.328853, 0.6745098, 0, 1, 1,
0.8056044, -0.1276388, 0.5054997, 0.6784314, 0, 1, 1,
0.808075, 1.468561, 2.501792, 0.6862745, 0, 1, 1,
0.8115868, -0.8967542, 2.632473, 0.6901961, 0, 1, 1,
0.8146465, 0.533545, 1.228657, 0.6980392, 0, 1, 1,
0.8161964, 0.001618001, 1.8705, 0.7058824, 0, 1, 1,
0.8179834, 0.1313427, 1.440887, 0.7098039, 0, 1, 1,
0.8230978, 0.3605261, 1.988941, 0.7176471, 0, 1, 1,
0.8232883, -1.216702, 3.889868, 0.7215686, 0, 1, 1,
0.8334216, -0.2778117, 2.623286, 0.7294118, 0, 1, 1,
0.8360539, -0.2970248, 2.085273, 0.7333333, 0, 1, 1,
0.8417045, -0.04564828, 1.870795, 0.7411765, 0, 1, 1,
0.8431088, 0.1987056, 0.6937025, 0.7450981, 0, 1, 1,
0.8512998, -0.1827923, 1.84697, 0.7529412, 0, 1, 1,
0.8590317, -1.317066, 1.607255, 0.7568628, 0, 1, 1,
0.8617971, -1.963642, 2.770098, 0.7647059, 0, 1, 1,
0.8634845, 1.483045, 1.068776, 0.7686275, 0, 1, 1,
0.8642221, 0.3506749, 2.114091, 0.7764706, 0, 1, 1,
0.8807545, -0.7409167, 2.469997, 0.7803922, 0, 1, 1,
0.8811654, -0.2414953, 1.678052, 0.7882353, 0, 1, 1,
0.8837562, 1.281518, 1.067792, 0.7921569, 0, 1, 1,
0.8859317, -0.2764741, 0.2317749, 0.8, 0, 1, 1,
0.8860487, -1.432197, 3.78759, 0.8078431, 0, 1, 1,
0.8868757, 0.153294, 1.759822, 0.8117647, 0, 1, 1,
0.8886304, 1.622835, -1.826313, 0.8196079, 0, 1, 1,
0.9051928, -1.090407, 2.982662, 0.8235294, 0, 1, 1,
0.9058077, -0.4509818, 3.24297, 0.8313726, 0, 1, 1,
0.9071429, -0.7750568, 2.072888, 0.8352941, 0, 1, 1,
0.9143241, -1.921538, 2.886625, 0.8431373, 0, 1, 1,
0.9211857, 0.05934349, 1.137321, 0.8470588, 0, 1, 1,
0.9252151, 0.6146503, 1.258094, 0.854902, 0, 1, 1,
0.9281045, -1.011164, 3.056065, 0.8588235, 0, 1, 1,
0.9295397, 0.2184211, 1.00205, 0.8666667, 0, 1, 1,
0.9359116, 0.8749727, 2.427724, 0.8705882, 0, 1, 1,
0.9380915, 0.7083877, 1.678483, 0.8784314, 0, 1, 1,
0.9440899, 0.8050917, 2.422792, 0.8823529, 0, 1, 1,
0.945715, 0.6827899, 0.365148, 0.8901961, 0, 1, 1,
0.9503054, 0.6140088, 1.396651, 0.8941177, 0, 1, 1,
0.9548858, 1.400465, 1.98102, 0.9019608, 0, 1, 1,
0.9558325, 0.220545, 0.4852421, 0.9098039, 0, 1, 1,
0.9561279, -0.8126861, 0.3146463, 0.9137255, 0, 1, 1,
0.9569899, -0.5782335, 2.343345, 0.9215686, 0, 1, 1,
0.961005, 0.6969606, 0.9373296, 0.9254902, 0, 1, 1,
0.9616019, 0.1681251, 1.172126, 0.9333333, 0, 1, 1,
0.9644901, 0.3698539, 1.183818, 0.9372549, 0, 1, 1,
0.9652301, -1.623222, 3.46351, 0.945098, 0, 1, 1,
0.9709122, 0.8142858, 0.9038169, 0.9490196, 0, 1, 1,
0.9722367, -0.3129467, 1.717881, 0.9568627, 0, 1, 1,
0.9730771, 0.393218, 0.6832391, 0.9607843, 0, 1, 1,
0.9756242, -0.4445187, 3.089684, 0.9686275, 0, 1, 1,
0.9770474, 0.471755, 0.2450694, 0.972549, 0, 1, 1,
0.9785696, 0.4281685, 0.6058259, 0.9803922, 0, 1, 1,
0.9823425, 0.7488806, 1.646113, 0.9843137, 0, 1, 1,
0.9832379, 0.9208179, 0.3525649, 0.9921569, 0, 1, 1,
1.005019, -0.6904432, 4.024418, 0.9960784, 0, 1, 1,
1.013152, -0.381476, 2.22859, 1, 0, 0.9960784, 1,
1.017793, 1.137048, 1.679974, 1, 0, 0.9882353, 1,
1.019575, -0.7199998, 2.36508, 1, 0, 0.9843137, 1,
1.01964, 0.2952322, 2.542806, 1, 0, 0.9764706, 1,
1.020133, -0.1400137, 1.472214, 1, 0, 0.972549, 1,
1.021401, 0.2889102, 2.26373, 1, 0, 0.9647059, 1,
1.025595, 1.800149, 1.605938, 1, 0, 0.9607843, 1,
1.026057, -2.11403, 1.860702, 1, 0, 0.9529412, 1,
1.029834, 0.09641277, 2.643144, 1, 0, 0.9490196, 1,
1.029856, -0.1211536, 1.558559, 1, 0, 0.9411765, 1,
1.033957, -0.2560741, 3.648668, 1, 0, 0.9372549, 1,
1.036506, 1.389975, 0.08990435, 1, 0, 0.9294118, 1,
1.036901, 0.0001838999, 2.633592, 1, 0, 0.9254902, 1,
1.042431, -0.4000091, 4.682733, 1, 0, 0.9176471, 1,
1.044146, -0.1976897, -0.02591915, 1, 0, 0.9137255, 1,
1.048044, -0.9843198, 3.362481, 1, 0, 0.9058824, 1,
1.050735, -0.2044117, 2.668123, 1, 0, 0.9019608, 1,
1.054832, 0.9975502, -0.45231, 1, 0, 0.8941177, 1,
1.072801, -0.8563218, 1.771137, 1, 0, 0.8862745, 1,
1.08447, 0.1261591, 0.6375017, 1, 0, 0.8823529, 1,
1.08529, 0.6269664, -0.8180279, 1, 0, 0.8745098, 1,
1.091406, -2.168285, 2.432134, 1, 0, 0.8705882, 1,
1.09288, 0.7482057, 0.5554158, 1, 0, 0.8627451, 1,
1.09299, 0.731016, -0.05082387, 1, 0, 0.8588235, 1,
1.093559, 1.049641, 0.1506446, 1, 0, 0.8509804, 1,
1.098698, -0.1031386, 1.482246, 1, 0, 0.8470588, 1,
1.107214, -0.1335951, 2.633412, 1, 0, 0.8392157, 1,
1.107707, -0.8772768, 3.848429, 1, 0, 0.8352941, 1,
1.110594, -0.5209777, 3.347873, 1, 0, 0.827451, 1,
1.113267, 0.07653445, 3.684381, 1, 0, 0.8235294, 1,
1.11612, 1.343986, 0.8443487, 1, 0, 0.8156863, 1,
1.116584, -0.7371442, 4.477215, 1, 0, 0.8117647, 1,
1.123396, 0.0198754, 1.239701, 1, 0, 0.8039216, 1,
1.123736, 0.3226768, 0.5358084, 1, 0, 0.7960784, 1,
1.137926, 0.7500763, -0.06833211, 1, 0, 0.7921569, 1,
1.141304, -1.142181, 1.392609, 1, 0, 0.7843137, 1,
1.143651, -0.5705396, 1.503189, 1, 0, 0.7803922, 1,
1.144254, -2.459061, 2.356405, 1, 0, 0.772549, 1,
1.149499, 0.4794896, 0.07076744, 1, 0, 0.7686275, 1,
1.153303, 0.006873026, 0.8394408, 1, 0, 0.7607843, 1,
1.164524, -0.7804199, 1.583103, 1, 0, 0.7568628, 1,
1.16476, -0.04299659, 1.550181, 1, 0, 0.7490196, 1,
1.174592, -1.557567, 3.792294, 1, 0, 0.7450981, 1,
1.174616, -0.1560552, 1.442807, 1, 0, 0.7372549, 1,
1.177327, -0.3499274, 2.983947, 1, 0, 0.7333333, 1,
1.178131, -1.596888, 2.280832, 1, 0, 0.7254902, 1,
1.181889, 0.04976423, -0.2673781, 1, 0, 0.7215686, 1,
1.182588, -1.417916, 1.485424, 1, 0, 0.7137255, 1,
1.21544, -1.1813, 3.967272, 1, 0, 0.7098039, 1,
1.217453, 0.6276934, 1.577837, 1, 0, 0.7019608, 1,
1.220213, -1.181963, 0.8755949, 1, 0, 0.6941177, 1,
1.220674, 1.379191, 0.3337358, 1, 0, 0.6901961, 1,
1.226716, 0.08180148, 1.771433, 1, 0, 0.682353, 1,
1.234581, 1.727593, 0.04492606, 1, 0, 0.6784314, 1,
1.245136, 0.4896213, 2.754656, 1, 0, 0.6705883, 1,
1.278731, -1.254912, 0.6402133, 1, 0, 0.6666667, 1,
1.28968, 0.6075339, 1.199565, 1, 0, 0.6588235, 1,
1.290999, -0.5272019, 1.725492, 1, 0, 0.654902, 1,
1.294236, 1.375349, 0.3229781, 1, 0, 0.6470588, 1,
1.301111, 0.5039609, 2.537495, 1, 0, 0.6431373, 1,
1.306198, -0.592923, 2.417265, 1, 0, 0.6352941, 1,
1.310313, -0.6894478, 1.850563, 1, 0, 0.6313726, 1,
1.311355, -1.573221, 1.823753, 1, 0, 0.6235294, 1,
1.314063, -1.052882, 1.140778, 1, 0, 0.6196079, 1,
1.319094, 1.256123, 1.516509, 1, 0, 0.6117647, 1,
1.321891, 0.1447008, 0.05101026, 1, 0, 0.6078432, 1,
1.322095, 2.911222, 1.22334, 1, 0, 0.6, 1,
1.325032, 0.4055525, -0.5638235, 1, 0, 0.5921569, 1,
1.331921, -0.9378056, 2.236832, 1, 0, 0.5882353, 1,
1.344129, -0.1990549, 3.145756, 1, 0, 0.5803922, 1,
1.363139, -0.5312257, 1.255286, 1, 0, 0.5764706, 1,
1.363276, 0.9579656, 0.3606893, 1, 0, 0.5686275, 1,
1.375061, -1.306076, 1.751283, 1, 0, 0.5647059, 1,
1.380293, -1.201063, 2.306452, 1, 0, 0.5568628, 1,
1.390191, -1.697286, 1.362301, 1, 0, 0.5529412, 1,
1.393709, 0.7066765, 0.8203894, 1, 0, 0.5450981, 1,
1.401255, -0.5930507, 3.508753, 1, 0, 0.5411765, 1,
1.404825, 0.7150648, 1.3356, 1, 0, 0.5333334, 1,
1.416528, 1.379979, 0.3312042, 1, 0, 0.5294118, 1,
1.424999, 0.2246232, 2.709129, 1, 0, 0.5215687, 1,
1.428163, 0.335544, 1.512748, 1, 0, 0.5176471, 1,
1.430381, 0.5315912, 3.38286, 1, 0, 0.509804, 1,
1.445252, 0.6053084, 0.7292712, 1, 0, 0.5058824, 1,
1.448215, 0.4250395, 1.828486, 1, 0, 0.4980392, 1,
1.449952, -1.884071, 2.158914, 1, 0, 0.4901961, 1,
1.454283, 0.5135407, 0.8644356, 1, 0, 0.4862745, 1,
1.459517, 0.01580112, 0.2607382, 1, 0, 0.4784314, 1,
1.462118, 0.9131228, 0.25804, 1, 0, 0.4745098, 1,
1.463929, -0.145272, 0.6073133, 1, 0, 0.4666667, 1,
1.470385, -0.08039962, 2.46343, 1, 0, 0.4627451, 1,
1.47104, 1.978402, 0.4377344, 1, 0, 0.454902, 1,
1.471197, -1.280851, 1.138333, 1, 0, 0.4509804, 1,
1.472931, -2.154792, 1.403521, 1, 0, 0.4431373, 1,
1.476744, 1.984896, -0.1951666, 1, 0, 0.4392157, 1,
1.487122, 0.2063286, 0.9280748, 1, 0, 0.4313726, 1,
1.499647, -2.545966, 3.146066, 1, 0, 0.427451, 1,
1.503389, 0.2656057, -1.11628, 1, 0, 0.4196078, 1,
1.511284, -0.3545601, 3.672377, 1, 0, 0.4156863, 1,
1.529027, -0.7690065, 1.857053, 1, 0, 0.4078431, 1,
1.531546, 0.1122938, 1.441241, 1, 0, 0.4039216, 1,
1.53588, 0.6798394, 0.5571914, 1, 0, 0.3960784, 1,
1.537489, -0.6655878, 1.934396, 1, 0, 0.3882353, 1,
1.539716, 0.4582796, 2.058229, 1, 0, 0.3843137, 1,
1.54478, 0.7230764, 0.205109, 1, 0, 0.3764706, 1,
1.546771, -0.4748708, 3.12467, 1, 0, 0.372549, 1,
1.57369, 0.2559724, 0.8668542, 1, 0, 0.3647059, 1,
1.585299, -0.7079788, 2.409618, 1, 0, 0.3607843, 1,
1.586904, -0.7911874, 2.961906, 1, 0, 0.3529412, 1,
1.593078, -1.513718, 2.312956, 1, 0, 0.3490196, 1,
1.604086, -0.1829911, 2.575473, 1, 0, 0.3411765, 1,
1.621258, 3.303745, 1.716921, 1, 0, 0.3372549, 1,
1.631613, -0.275063, 2.28466, 1, 0, 0.3294118, 1,
1.632917, 0.3990649, 0.8696495, 1, 0, 0.3254902, 1,
1.643402, 0.07934841, 0.9442759, 1, 0, 0.3176471, 1,
1.650784, 0.5128903, 2.538895, 1, 0, 0.3137255, 1,
1.650929, -0.4322373, 0.2659515, 1, 0, 0.3058824, 1,
1.654447, 0.3204907, 2.349427, 1, 0, 0.2980392, 1,
1.66183, -0.1145316, 2.994413, 1, 0, 0.2941177, 1,
1.675726, 0.5861346, 2.842939, 1, 0, 0.2862745, 1,
1.732672, 1.202836, 1.942484, 1, 0, 0.282353, 1,
1.7369, 0.6839898, 0.8903735, 1, 0, 0.2745098, 1,
1.744126, -0.5269659, 2.564999, 1, 0, 0.2705882, 1,
1.782066, 0.3251224, 2.585222, 1, 0, 0.2627451, 1,
1.784026, -0.4049903, 0.3572192, 1, 0, 0.2588235, 1,
1.789887, -1.24726, 2.021426, 1, 0, 0.2509804, 1,
1.795504, -2.339934, 3.883793, 1, 0, 0.2470588, 1,
1.806462, -0.6817438, 1.906735, 1, 0, 0.2392157, 1,
1.835479, -1.243934, 1.696055, 1, 0, 0.2352941, 1,
1.83962, -0.1167118, 1.890437, 1, 0, 0.227451, 1,
1.859479, -0.7598211, 1.377261, 1, 0, 0.2235294, 1,
1.860525, 1.654703, 0.762525, 1, 0, 0.2156863, 1,
1.872087, -1.636598, 2.706567, 1, 0, 0.2117647, 1,
1.87286, 0.6216169, -0.012251, 1, 0, 0.2039216, 1,
1.873673, -1.439228, 0.9161285, 1, 0, 0.1960784, 1,
1.894763, 0.1418614, 1.225887, 1, 0, 0.1921569, 1,
1.91079, 0.7668049, 2.834076, 1, 0, 0.1843137, 1,
1.915105, -1.079764, 1.79515, 1, 0, 0.1803922, 1,
1.926479, 0.7343249, 1.669428, 1, 0, 0.172549, 1,
1.965713, -1.375905, 0.2662465, 1, 0, 0.1686275, 1,
1.968667, 0.03239207, 1.848912, 1, 0, 0.1607843, 1,
1.973211, -1.020905, 3.614462, 1, 0, 0.1568628, 1,
2.005535, 0.1559634, 2.944716, 1, 0, 0.1490196, 1,
2.043359, -0.3984957, 2.266484, 1, 0, 0.145098, 1,
2.074402, 0.3184548, 1.009379, 1, 0, 0.1372549, 1,
2.11555, 1.39017, 1.759416, 1, 0, 0.1333333, 1,
2.166143, -0.9683061, 1.672683, 1, 0, 0.1254902, 1,
2.174417, -1.55378, 2.809608, 1, 0, 0.1215686, 1,
2.212676, -1.220411, 0.8228709, 1, 0, 0.1137255, 1,
2.259317, -0.6749386, 1.645672, 1, 0, 0.1098039, 1,
2.266825, 0.9523559, -0.2552847, 1, 0, 0.1019608, 1,
2.274738, -0.02898069, 0.4784955, 1, 0, 0.09411765, 1,
2.284129, 1.945777, 0.6065961, 1, 0, 0.09019608, 1,
2.290129, 0.08633536, 1.724513, 1, 0, 0.08235294, 1,
2.297784, 1.375773, 0.6840686, 1, 0, 0.07843138, 1,
2.399405, -0.3529337, 3.666523, 1, 0, 0.07058824, 1,
2.430631, 0.9223163, -0.3962544, 1, 0, 0.06666667, 1,
2.486466, -1.363736, 2.11113, 1, 0, 0.05882353, 1,
2.576385, -1.749775, 2.761695, 1, 0, 0.05490196, 1,
2.637456, -0.6266355, 3.043516, 1, 0, 0.04705882, 1,
2.772063, -0.2549057, 1.071377, 1, 0, 0.04313726, 1,
2.828742, 0.2201301, 0.7430283, 1, 0, 0.03529412, 1,
2.894577, -1.569578, 3.254668, 1, 0, 0.03137255, 1,
2.902654, 0.9505279, 0.6531829, 1, 0, 0.02352941, 1,
2.910732, 0.121562, 0.4763206, 1, 0, 0.01960784, 1,
3.023601, 0.4987515, 2.162385, 1, 0, 0.01176471, 1,
3.152229, 1.840101, 0.6936896, 1, 0, 0.007843138, 1
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
-0.01253355, -3.962181, -7.842039, 0, -0.5, 0.5, 0.5,
-0.01253355, -3.962181, -7.842039, 1, -0.5, 0.5, 0.5,
-0.01253355, -3.962181, -7.842039, 1, 1.5, 0.5, 0.5,
-0.01253355, -3.962181, -7.842039, 0, 1.5, 0.5, 0.5
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
-4.25015, 0.1973211, -7.842039, 0, -0.5, 0.5, 0.5,
-4.25015, 0.1973211, -7.842039, 1, -0.5, 0.5, 0.5,
-4.25015, 0.1973211, -7.842039, 1, 1.5, 0.5, 0.5,
-4.25015, 0.1973211, -7.842039, 0, 1.5, 0.5, 0.5
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
-4.25015, -3.962181, -0.5225186, 0, -0.5, 0.5, 0.5,
-4.25015, -3.962181, -0.5225186, 1, -0.5, 0.5, 0.5,
-4.25015, -3.962181, -0.5225186, 1, 1.5, 0.5, 0.5,
-4.25015, -3.962181, -0.5225186, 0, 1.5, 0.5, 0.5
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
-3, -3.002296, -6.152919,
3, -3.002296, -6.152919,
-3, -3.002296, -6.152919,
-3, -3.162277, -6.434439,
-2, -3.002296, -6.152919,
-2, -3.162277, -6.434439,
-1, -3.002296, -6.152919,
-1, -3.162277, -6.434439,
0, -3.002296, -6.152919,
0, -3.162277, -6.434439,
1, -3.002296, -6.152919,
1, -3.162277, -6.434439,
2, -3.002296, -6.152919,
2, -3.162277, -6.434439,
3, -3.002296, -6.152919,
3, -3.162277, -6.434439
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
-3, -3.482238, -6.997479, 0, -0.5, 0.5, 0.5,
-3, -3.482238, -6.997479, 1, -0.5, 0.5, 0.5,
-3, -3.482238, -6.997479, 1, 1.5, 0.5, 0.5,
-3, -3.482238, -6.997479, 0, 1.5, 0.5, 0.5,
-2, -3.482238, -6.997479, 0, -0.5, 0.5, 0.5,
-2, -3.482238, -6.997479, 1, -0.5, 0.5, 0.5,
-2, -3.482238, -6.997479, 1, 1.5, 0.5, 0.5,
-2, -3.482238, -6.997479, 0, 1.5, 0.5, 0.5,
-1, -3.482238, -6.997479, 0, -0.5, 0.5, 0.5,
-1, -3.482238, -6.997479, 1, -0.5, 0.5, 0.5,
-1, -3.482238, -6.997479, 1, 1.5, 0.5, 0.5,
-1, -3.482238, -6.997479, 0, 1.5, 0.5, 0.5,
0, -3.482238, -6.997479, 0, -0.5, 0.5, 0.5,
0, -3.482238, -6.997479, 1, -0.5, 0.5, 0.5,
0, -3.482238, -6.997479, 1, 1.5, 0.5, 0.5,
0, -3.482238, -6.997479, 0, 1.5, 0.5, 0.5,
1, -3.482238, -6.997479, 0, -0.5, 0.5, 0.5,
1, -3.482238, -6.997479, 1, -0.5, 0.5, 0.5,
1, -3.482238, -6.997479, 1, 1.5, 0.5, 0.5,
1, -3.482238, -6.997479, 0, 1.5, 0.5, 0.5,
2, -3.482238, -6.997479, 0, -0.5, 0.5, 0.5,
2, -3.482238, -6.997479, 1, -0.5, 0.5, 0.5,
2, -3.482238, -6.997479, 1, 1.5, 0.5, 0.5,
2, -3.482238, -6.997479, 0, 1.5, 0.5, 0.5,
3, -3.482238, -6.997479, 0, -0.5, 0.5, 0.5,
3, -3.482238, -6.997479, 1, -0.5, 0.5, 0.5,
3, -3.482238, -6.997479, 1, 1.5, 0.5, 0.5,
3, -3.482238, -6.997479, 0, 1.5, 0.5, 0.5
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
-3.272238, -2, -6.152919,
-3.272238, 3, -6.152919,
-3.272238, -2, -6.152919,
-3.435224, -2, -6.434439,
-3.272238, -1, -6.152919,
-3.435224, -1, -6.434439,
-3.272238, 0, -6.152919,
-3.435224, 0, -6.434439,
-3.272238, 1, -6.152919,
-3.435224, 1, -6.434439,
-3.272238, 2, -6.152919,
-3.435224, 2, -6.434439,
-3.272238, 3, -6.152919,
-3.435224, 3, -6.434439
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
-3.761194, -2, -6.997479, 0, -0.5, 0.5, 0.5,
-3.761194, -2, -6.997479, 1, -0.5, 0.5, 0.5,
-3.761194, -2, -6.997479, 1, 1.5, 0.5, 0.5,
-3.761194, -2, -6.997479, 0, 1.5, 0.5, 0.5,
-3.761194, -1, -6.997479, 0, -0.5, 0.5, 0.5,
-3.761194, -1, -6.997479, 1, -0.5, 0.5, 0.5,
-3.761194, -1, -6.997479, 1, 1.5, 0.5, 0.5,
-3.761194, -1, -6.997479, 0, 1.5, 0.5, 0.5,
-3.761194, 0, -6.997479, 0, -0.5, 0.5, 0.5,
-3.761194, 0, -6.997479, 1, -0.5, 0.5, 0.5,
-3.761194, 0, -6.997479, 1, 1.5, 0.5, 0.5,
-3.761194, 0, -6.997479, 0, 1.5, 0.5, 0.5,
-3.761194, 1, -6.997479, 0, -0.5, 0.5, 0.5,
-3.761194, 1, -6.997479, 1, -0.5, 0.5, 0.5,
-3.761194, 1, -6.997479, 1, 1.5, 0.5, 0.5,
-3.761194, 1, -6.997479, 0, 1.5, 0.5, 0.5,
-3.761194, 2, -6.997479, 0, -0.5, 0.5, 0.5,
-3.761194, 2, -6.997479, 1, -0.5, 0.5, 0.5,
-3.761194, 2, -6.997479, 1, 1.5, 0.5, 0.5,
-3.761194, 2, -6.997479, 0, 1.5, 0.5, 0.5,
-3.761194, 3, -6.997479, 0, -0.5, 0.5, 0.5,
-3.761194, 3, -6.997479, 1, -0.5, 0.5, 0.5,
-3.761194, 3, -6.997479, 1, 1.5, 0.5, 0.5,
-3.761194, 3, -6.997479, 0, 1.5, 0.5, 0.5
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
-3.272238, -3.002296, -4,
-3.272238, -3.002296, 4,
-3.272238, -3.002296, -4,
-3.435224, -3.162277, -4,
-3.272238, -3.002296, -2,
-3.435224, -3.162277, -2,
-3.272238, -3.002296, 0,
-3.435224, -3.162277, 0,
-3.272238, -3.002296, 2,
-3.435224, -3.162277, 2,
-3.272238, -3.002296, 4,
-3.435224, -3.162277, 4
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
-3.761194, -3.482238, -4, 0, -0.5, 0.5, 0.5,
-3.761194, -3.482238, -4, 1, -0.5, 0.5, 0.5,
-3.761194, -3.482238, -4, 1, 1.5, 0.5, 0.5,
-3.761194, -3.482238, -4, 0, 1.5, 0.5, 0.5,
-3.761194, -3.482238, -2, 0, -0.5, 0.5, 0.5,
-3.761194, -3.482238, -2, 1, -0.5, 0.5, 0.5,
-3.761194, -3.482238, -2, 1, 1.5, 0.5, 0.5,
-3.761194, -3.482238, -2, 0, 1.5, 0.5, 0.5,
-3.761194, -3.482238, 0, 0, -0.5, 0.5, 0.5,
-3.761194, -3.482238, 0, 1, -0.5, 0.5, 0.5,
-3.761194, -3.482238, 0, 1, 1.5, 0.5, 0.5,
-3.761194, -3.482238, 0, 0, 1.5, 0.5, 0.5,
-3.761194, -3.482238, 2, 0, -0.5, 0.5, 0.5,
-3.761194, -3.482238, 2, 1, -0.5, 0.5, 0.5,
-3.761194, -3.482238, 2, 1, 1.5, 0.5, 0.5,
-3.761194, -3.482238, 2, 0, 1.5, 0.5, 0.5,
-3.761194, -3.482238, 4, 0, -0.5, 0.5, 0.5,
-3.761194, -3.482238, 4, 1, -0.5, 0.5, 0.5,
-3.761194, -3.482238, 4, 1, 1.5, 0.5, 0.5,
-3.761194, -3.482238, 4, 0, 1.5, 0.5, 0.5
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
-3.272238, -3.002296, -6.152919,
-3.272238, 3.396938, -6.152919,
-3.272238, -3.002296, 5.107882,
-3.272238, 3.396938, 5.107882,
-3.272238, -3.002296, -6.152919,
-3.272238, -3.002296, 5.107882,
-3.272238, 3.396938, -6.152919,
-3.272238, 3.396938, 5.107882,
-3.272238, -3.002296, -6.152919,
3.247171, -3.002296, -6.152919,
-3.272238, -3.002296, 5.107882,
3.247171, -3.002296, 5.107882,
-3.272238, 3.396938, -6.152919,
3.247171, 3.396938, -6.152919,
-3.272238, 3.396938, 5.107882,
3.247171, 3.396938, 5.107882,
3.247171, -3.002296, -6.152919,
3.247171, 3.396938, -6.152919,
3.247171, -3.002296, 5.107882,
3.247171, 3.396938, 5.107882,
3.247171, -3.002296, -6.152919,
3.247171, -3.002296, 5.107882,
3.247171, 3.396938, -6.152919,
3.247171, 3.396938, 5.107882
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
var radius = 7.742876;
var distance = 34.44893;
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
mvMatrix.translate( 0.01253355, -0.1973211, 0.5225186 );
mvMatrix.scale( 1.284127, 1.308242, 0.7434417 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.44893);
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
chlorphonium_chlorid<-read.table("chlorphonium_chlorid.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-chlorphonium_chlorid$V2
```

```
## Error in eval(expr, envir, enclos): object 'chlorphonium_chlorid' not found
```

```r
y<-chlorphonium_chlorid$V3
```

```
## Error in eval(expr, envir, enclos): object 'chlorphonium_chlorid' not found
```

```r
z<-chlorphonium_chlorid$V4
```

```
## Error in eval(expr, envir, enclos): object 'chlorphonium_chlorid' not found
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
-3.177296, 0.4314306, -1.912634, 0, 0, 1, 1, 1,
-2.624752, 0.1494251, -3.014265, 1, 0, 0, 1, 1,
-2.575224, -2.136597, -3.079776, 1, 0, 0, 1, 1,
-2.542809, 0.03907872, -2.231869, 1, 0, 0, 1, 1,
-2.440339, -0.9322215, -1.469576, 1, 0, 0, 1, 1,
-2.379563, -0.6183986, -3.552317, 1, 0, 0, 1, 1,
-2.36077, 0.4733301, -1.210106, 0, 0, 0, 1, 1,
-2.312877, 1.744603, -0.5676228, 0, 0, 0, 1, 1,
-2.301157, -0.3916912, -1.431726, 0, 0, 0, 1, 1,
-2.284504, 1.293997, -1.734858, 0, 0, 0, 1, 1,
-2.254066, -0.4049141, -2.058479, 0, 0, 0, 1, 1,
-2.247416, 1.597066, -1.877515, 0, 0, 0, 1, 1,
-2.237097, -0.8020158, -1.097776, 0, 0, 0, 1, 1,
-2.218687, 0.121462, -2.687027, 1, 1, 1, 1, 1,
-2.159849, 0.6044255, -1.205818, 1, 1, 1, 1, 1,
-2.155192, 0.5876544, -1.206322, 1, 1, 1, 1, 1,
-2.127528, -1.456329, 0.04908187, 1, 1, 1, 1, 1,
-2.09784, -1.753914, -3.150526, 1, 1, 1, 1, 1,
-2.063146, -0.9725875, -1.629574, 1, 1, 1, 1, 1,
-1.990131, 0.4124764, -2.156367, 1, 1, 1, 1, 1,
-1.972528, 0.7664345, -0.5163835, 1, 1, 1, 1, 1,
-1.919975, -0.9377453, -3.733006, 1, 1, 1, 1, 1,
-1.912226, 2.302332, -0.6469411, 1, 1, 1, 1, 1,
-1.89112, 1.094798, -2.019508, 1, 1, 1, 1, 1,
-1.887501, 0.1637748, -1.814971, 1, 1, 1, 1, 1,
-1.865734, 1.652467, -1.308903, 1, 1, 1, 1, 1,
-1.857782, -0.7847343, -2.539795, 1, 1, 1, 1, 1,
-1.840999, -1.33994, -2.215978, 1, 1, 1, 1, 1,
-1.794675, -0.3204253, -1.514099, 0, 0, 1, 1, 1,
-1.792713, 1.587622, -0.4060376, 1, 0, 0, 1, 1,
-1.766792, 0.3377617, -1.398827, 1, 0, 0, 1, 1,
-1.761137, -0.04426396, -0.2558389, 1, 0, 0, 1, 1,
-1.748088, -1.771645, -2.681511, 1, 0, 0, 1, 1,
-1.728604, 0.3319714, -0.5265638, 1, 0, 0, 1, 1,
-1.722761, -0.618582, -2.531419, 0, 0, 0, 1, 1,
-1.713559, 0.5649245, -1.048306, 0, 0, 0, 1, 1,
-1.694095, -1.401644, -2.511802, 0, 0, 0, 1, 1,
-1.676135, -0.2789602, -1.87459, 0, 0, 0, 1, 1,
-1.669516, -1.522559, -3.30522, 0, 0, 0, 1, 1,
-1.662464, -0.1985005, -3.164364, 0, 0, 0, 1, 1,
-1.649234, 0.4006686, -1.93812, 0, 0, 0, 1, 1,
-1.631638, -0.3145964, -3.094714, 1, 1, 1, 1, 1,
-1.611806, -0.7685323, -2.349296, 1, 1, 1, 1, 1,
-1.577618, -0.7184175, -1.804442, 1, 1, 1, 1, 1,
-1.575072, 0.6115622, -1.492404, 1, 1, 1, 1, 1,
-1.570197, -0.8993854, -1.857554, 1, 1, 1, 1, 1,
-1.558484, 0.01876388, -0.5586226, 1, 1, 1, 1, 1,
-1.553786, -0.6311768, -3.797168, 1, 1, 1, 1, 1,
-1.553532, -1.32585, -2.017198, 1, 1, 1, 1, 1,
-1.548757, -0.2009044, -2.488684, 1, 1, 1, 1, 1,
-1.540549, 0.5545174, -2.095361, 1, 1, 1, 1, 1,
-1.522878, -0.729529, -2.621016, 1, 1, 1, 1, 1,
-1.514787, 1.352738, -1.905026, 1, 1, 1, 1, 1,
-1.514068, 1.078779, -2.161978, 1, 1, 1, 1, 1,
-1.510945, -0.8983381, -0.8687537, 1, 1, 1, 1, 1,
-1.502195, -0.1990028, -0.4418183, 1, 1, 1, 1, 1,
-1.490577, -1.91897, -2.550701, 0, 0, 1, 1, 1,
-1.483466, -1.075107, -3.522324, 1, 0, 0, 1, 1,
-1.476915, -2.192653, -2.677014, 1, 0, 0, 1, 1,
-1.461315, -1.534675, -3.640371, 1, 0, 0, 1, 1,
-1.44725, -0.6360256, -1.334754, 1, 0, 0, 1, 1,
-1.444946, -0.2863223, -1.351589, 1, 0, 0, 1, 1,
-1.443069, -0.4294402, -2.916883, 0, 0, 0, 1, 1,
-1.439685, 1.177303, -1.612985, 0, 0, 0, 1, 1,
-1.422297, -0.351455, -3.632087, 0, 0, 0, 1, 1,
-1.415543, 0.6925424, -0.4674997, 0, 0, 0, 1, 1,
-1.407383, -0.7481881, -1.264587, 0, 0, 0, 1, 1,
-1.397325, -0.006988295, -1.281226, 0, 0, 0, 1, 1,
-1.390122, -0.4003898, -1.997837, 0, 0, 0, 1, 1,
-1.385112, -0.5018743, -2.330059, 1, 1, 1, 1, 1,
-1.380045, -1.643903, -1.733056, 1, 1, 1, 1, 1,
-1.37386, -0.6150388, -2.862119, 1, 1, 1, 1, 1,
-1.37284, 0.5837705, -2.12384, 1, 1, 1, 1, 1,
-1.372302, 1.300108, 0.7330202, 1, 1, 1, 1, 1,
-1.365324, -1.043736, -1.408985, 1, 1, 1, 1, 1,
-1.359662, -0.792079, -1.61927, 1, 1, 1, 1, 1,
-1.357825, -1.471303, -3.035038, 1, 1, 1, 1, 1,
-1.356714, 1.750215, -1.47254, 1, 1, 1, 1, 1,
-1.353258, 0.9409044, -0.4853118, 1, 1, 1, 1, 1,
-1.350971, 0.9271022, 0.714335, 1, 1, 1, 1, 1,
-1.348935, -0.1933871, -2.465673, 1, 1, 1, 1, 1,
-1.348866, 0.3255914, -1.477607, 1, 1, 1, 1, 1,
-1.347065, 1.372673, -2.211236, 1, 1, 1, 1, 1,
-1.337619, -1.421716, -1.732482, 1, 1, 1, 1, 1,
-1.330544, 1.380307, -2.514004, 0, 0, 1, 1, 1,
-1.323947, -0.6216441, -4.396975, 1, 0, 0, 1, 1,
-1.32213, -1.425378, -3.200949, 1, 0, 0, 1, 1,
-1.318773, -0.4758652, -2.050757, 1, 0, 0, 1, 1,
-1.316533, 1.033687, 0.1442089, 1, 0, 0, 1, 1,
-1.305874, 0.6332255, 0.8206987, 1, 0, 0, 1, 1,
-1.297072, -1.706429, -2.440135, 0, 0, 0, 1, 1,
-1.289091, -0.5766771, -2.756784, 0, 0, 0, 1, 1,
-1.280241, 1.075431, -2.46375, 0, 0, 0, 1, 1,
-1.277948, -0.959141, -2.773295, 0, 0, 0, 1, 1,
-1.261669, 0.5170712, -0.6547045, 0, 0, 0, 1, 1,
-1.24813, 0.02003794, -2.010989, 0, 0, 0, 1, 1,
-1.23101, -1.054016, -1.964242, 0, 0, 0, 1, 1,
-1.229174, 0.1148328, -1.059977, 1, 1, 1, 1, 1,
-1.224046, -0.1751343, -2.756711, 1, 1, 1, 1, 1,
-1.223505, 0.2237182, -1.055614, 1, 1, 1, 1, 1,
-1.220541, 0.2470513, -1.631104, 1, 1, 1, 1, 1,
-1.219863, 1.090782, -0.2182698, 1, 1, 1, 1, 1,
-1.214333, -0.5511522, -2.466376, 1, 1, 1, 1, 1,
-1.211182, 0.2346138, -1.496057, 1, 1, 1, 1, 1,
-1.21116, 1.018921, -0.1112454, 1, 1, 1, 1, 1,
-1.205098, -1.350271, -2.141878, 1, 1, 1, 1, 1,
-1.204018, 0.5867622, -0.7193163, 1, 1, 1, 1, 1,
-1.203372, 1.723342, -0.1535024, 1, 1, 1, 1, 1,
-1.19637, -0.4965997, -2.292131, 1, 1, 1, 1, 1,
-1.18101, -0.437689, -1.749151, 1, 1, 1, 1, 1,
-1.179665, -0.317112, -3.130425, 1, 1, 1, 1, 1,
-1.173268, 0.1036223, -1.801925, 1, 1, 1, 1, 1,
-1.173147, -1.513279, -1.247355, 0, 0, 1, 1, 1,
-1.167231, 0.04104683, -0.4739763, 1, 0, 0, 1, 1,
-1.163022, -0.7749735, -2.808091, 1, 0, 0, 1, 1,
-1.156553, 0.359217, -0.4951097, 1, 0, 0, 1, 1,
-1.156325, 1.424302, -0.4925161, 1, 0, 0, 1, 1,
-1.154704, 2.185402, -0.9729548, 1, 0, 0, 1, 1,
-1.152823, 2.322922, 0.7939136, 0, 0, 0, 1, 1,
-1.151731, 0.6612548, -0.8482321, 0, 0, 0, 1, 1,
-1.150188, -1.068291, -2.036712, 0, 0, 0, 1, 1,
-1.138307, 0.4564167, 0.7492566, 0, 0, 0, 1, 1,
-1.136505, -1.165235, -3.309403, 0, 0, 0, 1, 1,
-1.134293, 0.01083011, -2.24596, 0, 0, 0, 1, 1,
-1.128474, -0.7615596, -0.2239072, 0, 0, 0, 1, 1,
-1.12712, -0.8750578, -1.603468, 1, 1, 1, 1, 1,
-1.125948, -2.261498, -2.228208, 1, 1, 1, 1, 1,
-1.125794, -1.243174, -2.199321, 1, 1, 1, 1, 1,
-1.124157, -1.137346, -2.206591, 1, 1, 1, 1, 1,
-1.117469, 0.2568862, -2.370343, 1, 1, 1, 1, 1,
-1.115291, 0.9428417, -1.038546, 1, 1, 1, 1, 1,
-1.114195, 0.5502264, -0.711216, 1, 1, 1, 1, 1,
-1.113088, -1.531348, -3.145437, 1, 1, 1, 1, 1,
-1.107101, 0.4106125, -0.9436247, 1, 1, 1, 1, 1,
-1.101694, -0.6114097, -2.648557, 1, 1, 1, 1, 1,
-1.101512, -0.3850058, -2.700186, 1, 1, 1, 1, 1,
-1.099312, 0.3641183, -0.4196791, 1, 1, 1, 1, 1,
-1.099075, -2.343248, -1.981543, 1, 1, 1, 1, 1,
-1.090719, 0.2931388, -2.791274, 1, 1, 1, 1, 1,
-1.088966, -0.9991383, -4.014318, 1, 1, 1, 1, 1,
-1.081916, -0.8600045, -3.887522, 0, 0, 1, 1, 1,
-1.076867, 0.1426413, -0.4672561, 1, 0, 0, 1, 1,
-1.075626, -0.5432645, -1.821396, 1, 0, 0, 1, 1,
-1.074401, -0.4080297, -2.843348, 1, 0, 0, 1, 1,
-1.069194, 0.2025354, -0.5719577, 1, 0, 0, 1, 1,
-1.057941, -1.049553, -1.686342, 1, 0, 0, 1, 1,
-1.0574, -1.821349, -2.627343, 0, 0, 0, 1, 1,
-1.055388, 0.08676373, -1.116828, 0, 0, 0, 1, 1,
-1.053361, -0.005791572, -1.295138, 0, 0, 0, 1, 1,
-1.049753, 0.5002137, 0.09506588, 0, 0, 0, 1, 1,
-1.045014, 1.173145, 0.5266665, 0, 0, 0, 1, 1,
-1.036938, -1.176473, -2.133284, 0, 0, 0, 1, 1,
-1.03358, -1.138977, -3.860025, 0, 0, 0, 1, 1,
-1.032414, 0.03443239, -2.239142, 1, 1, 1, 1, 1,
-1.030901, 0.3400762, -0.9694337, 1, 1, 1, 1, 1,
-1.028617, -0.3980133, -1.504577, 1, 1, 1, 1, 1,
-1.027835, 0.4506002, -1.232191, 1, 1, 1, 1, 1,
-1.022269, 1.370457, 0.4912836, 1, 1, 1, 1, 1,
-1.020224, -2.293447, -2.705658, 1, 1, 1, 1, 1,
-1.019288, 2.098115, -2.019283, 1, 1, 1, 1, 1,
-1.016872, -1.49475, -3.07853, 1, 1, 1, 1, 1,
-1.016748, 0.7237331, -2.060588, 1, 1, 1, 1, 1,
-1.014691, -0.547505, -1.821615, 1, 1, 1, 1, 1,
-1.013518, -1.053354, -1.03355, 1, 1, 1, 1, 1,
-1.006801, 0.8348618, -1.45605, 1, 1, 1, 1, 1,
-1.006744, 0.4437017, -2.391095, 1, 1, 1, 1, 1,
-1.005817, 0.12024, -0.2412315, 1, 1, 1, 1, 1,
-0.9900949, -0.3505297, -3.182758, 1, 1, 1, 1, 1,
-0.9807624, 1.262076, -0.5568989, 0, 0, 1, 1, 1,
-0.9800645, 0.2221951, -1.519121, 1, 0, 0, 1, 1,
-0.9767832, -1.916579, -2.6234, 1, 0, 0, 1, 1,
-0.9738835, 0.7903852, -1.266408, 1, 0, 0, 1, 1,
-0.971715, 0.05135038, -1.668447, 1, 0, 0, 1, 1,
-0.9716691, -0.734336, -0.05784206, 1, 0, 0, 1, 1,
-0.969841, -0.8472558, -3.228022, 0, 0, 0, 1, 1,
-0.9688023, -0.5777901, -0.7268188, 0, 0, 0, 1, 1,
-0.9677856, -1.91484, -2.311493, 0, 0, 0, 1, 1,
-0.967194, -0.08203971, -1.651876, 0, 0, 0, 1, 1,
-0.9588719, -0.509643, -2.545965, 0, 0, 0, 1, 1,
-0.9569132, -0.1429258, -3.017757, 0, 0, 0, 1, 1,
-0.9552295, 1.328328, 0.9207345, 0, 0, 0, 1, 1,
-0.9537882, -1.162379, -2.589467, 1, 1, 1, 1, 1,
-0.9454522, 1.718392, -1.017267, 1, 1, 1, 1, 1,
-0.9439764, 0.3298415, -2.34524, 1, 1, 1, 1, 1,
-0.9439602, -1.17128, -4.822958, 1, 1, 1, 1, 1,
-0.9427922, 1.298645, -0.1755915, 1, 1, 1, 1, 1,
-0.9383054, -1.241116, -2.506141, 1, 1, 1, 1, 1,
-0.9381832, -1.788034, -3.106617, 1, 1, 1, 1, 1,
-0.935756, -1.013907, -3.232491, 1, 1, 1, 1, 1,
-0.9320111, -1.371876, -1.911865, 1, 1, 1, 1, 1,
-0.9286602, -1.071946, -2.898869, 1, 1, 1, 1, 1,
-0.9277363, -0.6526367, -2.200716, 1, 1, 1, 1, 1,
-0.9225355, 1.104205, -1.21093, 1, 1, 1, 1, 1,
-0.9186661, -1.025405, -2.260455, 1, 1, 1, 1, 1,
-0.9156728, -1.534494, -1.785282, 1, 1, 1, 1, 1,
-0.913448, 1.259542, -0.2844235, 1, 1, 1, 1, 1,
-0.9127682, 2.102816, -0.04617438, 0, 0, 1, 1, 1,
-0.9100437, 0.4274648, -0.3316687, 1, 0, 0, 1, 1,
-0.9097173, 0.945223, -0.1011114, 1, 0, 0, 1, 1,
-0.9094151, 0.5300598, -2.491139, 1, 0, 0, 1, 1,
-0.9084197, 1.451952, -1.854173, 1, 0, 0, 1, 1,
-0.9044731, 1.416318, -0.7554181, 1, 0, 0, 1, 1,
-0.9017368, -1.590322, -2.697141, 0, 0, 0, 1, 1,
-0.9012095, 3.110767, -0.3435349, 0, 0, 0, 1, 1,
-0.891575, -0.1267502, -1.083519, 0, 0, 0, 1, 1,
-0.8908011, 0.03186923, -1.215876, 0, 0, 0, 1, 1,
-0.8903547, -1.196506, -2.129254, 0, 0, 0, 1, 1,
-0.8812333, 0.1760256, -3.35393, 0, 0, 0, 1, 1,
-0.8811173, -0.6232623, -1.292029, 0, 0, 0, 1, 1,
-0.8806332, 0.384781, -1.656515, 1, 1, 1, 1, 1,
-0.873311, -0.4985299, -2.403213, 1, 1, 1, 1, 1,
-0.872068, -1.223777, -2.451123, 1, 1, 1, 1, 1,
-0.8680642, 0.2845515, 1.459906, 1, 1, 1, 1, 1,
-0.8656428, 0.3033691, 1.762914, 1, 1, 1, 1, 1,
-0.8609344, 0.002505747, -1.898615, 1, 1, 1, 1, 1,
-0.855983, 1.119658, -1.172535, 1, 1, 1, 1, 1,
-0.851051, -0.9809323, -2.815315, 1, 1, 1, 1, 1,
-0.8502452, -0.6478747, -2.234052, 1, 1, 1, 1, 1,
-0.8500783, -0.01242505, -0.5570053, 1, 1, 1, 1, 1,
-0.8449586, 1.045228, -0.6898332, 1, 1, 1, 1, 1,
-0.8448755, 1.91265, -2.63251, 1, 1, 1, 1, 1,
-0.8440965, 0.4220638, -0.1942468, 1, 1, 1, 1, 1,
-0.8339508, -0.7406193, -1.778345, 1, 1, 1, 1, 1,
-0.8313974, 0.1130093, -1.59553, 1, 1, 1, 1, 1,
-0.8312852, 0.02506873, -1.111842, 0, 0, 1, 1, 1,
-0.8282391, -0.6490532, -1.861136, 1, 0, 0, 1, 1,
-0.8275739, 1.047457, 0.9835837, 1, 0, 0, 1, 1,
-0.8268106, -0.8216519, -0.5965657, 1, 0, 0, 1, 1,
-0.8257302, -1.031616, -4.603479, 1, 0, 0, 1, 1,
-0.8254634, -0.447841, -1.853368, 1, 0, 0, 1, 1,
-0.8224299, 1.525618, -1.051728, 0, 0, 0, 1, 1,
-0.8195283, 0.2466675, -0.9431167, 0, 0, 0, 1, 1,
-0.8183733, -0.1968224, -1.050787, 0, 0, 0, 1, 1,
-0.810888, -1.667887, -0.2436067, 0, 0, 0, 1, 1,
-0.804801, -1.458298, -3.764524, 0, 0, 0, 1, 1,
-0.8036428, -1.743166, -2.799727, 0, 0, 0, 1, 1,
-0.8021206, 1.088256, -0.2368975, 0, 0, 0, 1, 1,
-0.7979857, 0.6366802, 1.260199, 1, 1, 1, 1, 1,
-0.7851704, 1.1684, -0.01761589, 1, 1, 1, 1, 1,
-0.7728893, -0.07841111, -0.9571914, 1, 1, 1, 1, 1,
-0.7710379, 2.499384, -0.1654636, 1, 1, 1, 1, 1,
-0.7628996, 0.2759846, 0.5001879, 1, 1, 1, 1, 1,
-0.7626547, 0.1535004, -1.452588, 1, 1, 1, 1, 1,
-0.7620467, -0.8818249, 0.2297842, 1, 1, 1, 1, 1,
-0.7574449, -0.07058994, 0.2736754, 1, 1, 1, 1, 1,
-0.7533256, 0.3865166, 0.1620301, 1, 1, 1, 1, 1,
-0.7513019, 2.264683, -2.735321, 1, 1, 1, 1, 1,
-0.7511873, -0.5272576, -2.92966, 1, 1, 1, 1, 1,
-0.7498291, -1.534295, -2.414575, 1, 1, 1, 1, 1,
-0.7411022, 0.4552061, -2.091939, 1, 1, 1, 1, 1,
-0.7391785, -0.8625281, -2.845709, 1, 1, 1, 1, 1,
-0.7331282, -1.466577, -3.474729, 1, 1, 1, 1, 1,
-0.7304249, -0.2493066, -1.09156, 0, 0, 1, 1, 1,
-0.7286373, -0.1924469, 0.2216095, 1, 0, 0, 1, 1,
-0.7275046, -0.4196855, -0.7322461, 1, 0, 0, 1, 1,
-0.7263891, 0.2330594, -1.491494, 1, 0, 0, 1, 1,
-0.7235073, -0.8193994, -2.526433, 1, 0, 0, 1, 1,
-0.7198886, -0.8870191, -1.063744, 1, 0, 0, 1, 1,
-0.7191023, 0.3544243, -0.2447646, 0, 0, 0, 1, 1,
-0.7172945, 0.2866245, -1.063414, 0, 0, 0, 1, 1,
-0.7151519, -0.1619611, -1.986507, 0, 0, 0, 1, 1,
-0.7144526, 0.5019336, 0.01602001, 0, 0, 0, 1, 1,
-0.7111232, -0.09250611, -1.617367, 0, 0, 0, 1, 1,
-0.7110951, 1.853469, -0.2615769, 0, 0, 0, 1, 1,
-0.7102978, 0.4787936, 0.1707981, 0, 0, 0, 1, 1,
-0.7067593, -0.03889544, -4.322902, 1, 1, 1, 1, 1,
-0.7014593, -0.4130018, -4.111539, 1, 1, 1, 1, 1,
-0.6947801, 0.5054334, -0.7073582, 1, 1, 1, 1, 1,
-0.6945434, 0.903034, -1.167086, 1, 1, 1, 1, 1,
-0.6885129, 1.651674, -1.178516, 1, 1, 1, 1, 1,
-0.686998, 1.87263, 1.453362, 1, 1, 1, 1, 1,
-0.6829994, 0.3613403, 0.2624043, 1, 1, 1, 1, 1,
-0.6819066, -1.123195, -1.485224, 1, 1, 1, 1, 1,
-0.6770868, 0.5931066, -0.4425051, 1, 1, 1, 1, 1,
-0.6743892, -1.16404, -5.216157, 1, 1, 1, 1, 1,
-0.6687092, -0.028545, -0.9137545, 1, 1, 1, 1, 1,
-0.6676143, 0.2660145, -2.151302, 1, 1, 1, 1, 1,
-0.6658898, 1.563796, -1.239957, 1, 1, 1, 1, 1,
-0.6641313, 0.2926531, -0.2072789, 1, 1, 1, 1, 1,
-0.656821, -0.2255855, -2.39484, 1, 1, 1, 1, 1,
-0.6557109, -0.5806543, -3.719618, 0, 0, 1, 1, 1,
-0.6544972, -0.4551435, -1.360737, 1, 0, 0, 1, 1,
-0.6465573, 0.2288262, -1.958827, 1, 0, 0, 1, 1,
-0.646036, -2.047779, -1.719047, 1, 0, 0, 1, 1,
-0.6454086, 0.08488605, -0.3562114, 1, 0, 0, 1, 1,
-0.6393954, 0.1425863, -0.6375996, 1, 0, 0, 1, 1,
-0.6355637, -0.1312677, -1.711116, 0, 0, 0, 1, 1,
-0.6320908, 0.6724818, -2.503363, 0, 0, 0, 1, 1,
-0.6261455, 1.370614, 0.1818651, 0, 0, 0, 1, 1,
-0.6251937, 0.4329096, -0.4640701, 0, 0, 0, 1, 1,
-0.6177022, 1.36409, -0.8033435, 0, 0, 0, 1, 1,
-0.6176961, 1.487523, 0.2178866, 0, 0, 0, 1, 1,
-0.6167585, 0.4050947, -1.49615, 0, 0, 0, 1, 1,
-0.6164077, -0.4983909, -3.676587, 1, 1, 1, 1, 1,
-0.6151359, 0.7168187, 0.2722247, 1, 1, 1, 1, 1,
-0.6139794, 0.1285005, -1.889232, 1, 1, 1, 1, 1,
-0.6081105, -0.3413185, -3.239929, 1, 1, 1, 1, 1,
-0.6037683, -0.3099907, -3.836613, 1, 1, 1, 1, 1,
-0.6027494, -0.663525, -0.9783565, 1, 1, 1, 1, 1,
-0.6023766, -0.0771588, -1.156808, 1, 1, 1, 1, 1,
-0.6019017, -0.7194623, -1.598747, 1, 1, 1, 1, 1,
-0.5907486, -0.1087992, -1.094519, 1, 1, 1, 1, 1,
-0.5797749, -1.304174, -1.882797, 1, 1, 1, 1, 1,
-0.579322, 1.019458, -2.003008, 1, 1, 1, 1, 1,
-0.576774, -0.3053775, -1.41255, 1, 1, 1, 1, 1,
-0.5765186, 0.1049387, 0.8037908, 1, 1, 1, 1, 1,
-0.5764483, 2.517161, 0.5318177, 1, 1, 1, 1, 1,
-0.5752069, 0.01015377, -0.6533216, 1, 1, 1, 1, 1,
-0.5746865, 1.098485, -0.7852041, 0, 0, 1, 1, 1,
-0.5707222, 0.5741283, 1.150647, 1, 0, 0, 1, 1,
-0.5706527, -0.04657952, 0.1996435, 1, 0, 0, 1, 1,
-0.5705448, -0.956619, -2.687408, 1, 0, 0, 1, 1,
-0.5671569, -0.5528419, -0.5651983, 1, 0, 0, 1, 1,
-0.5596805, 1.866914, 1.426799, 1, 0, 0, 1, 1,
-0.5558938, -1.077765, -2.231983, 0, 0, 0, 1, 1,
-0.5544653, -1.94336, -3.739676, 0, 0, 0, 1, 1,
-0.5535902, 1.048899, -1.363619, 0, 0, 0, 1, 1,
-0.5520006, -0.01470004, 0.4518836, 0, 0, 0, 1, 1,
-0.5482115, 0.3839091, -0.5614346, 0, 0, 0, 1, 1,
-0.5464025, 0.9115828, -0.7631235, 0, 0, 0, 1, 1,
-0.5451024, 2.203334, 0.6432144, 0, 0, 0, 1, 1,
-0.5441505, 0.7315726, -1.987074, 1, 1, 1, 1, 1,
-0.5381985, -0.2529002, -3.116819, 1, 1, 1, 1, 1,
-0.5379884, -1.296293, -3.333736, 1, 1, 1, 1, 1,
-0.5378494, 0.5508921, 0.05703433, 1, 1, 1, 1, 1,
-0.5357137, -0.02090312, -1.881567, 1, 1, 1, 1, 1,
-0.5293565, 0.8617796, 0.1096459, 1, 1, 1, 1, 1,
-0.52934, 0.2009177, -1.454176, 1, 1, 1, 1, 1,
-0.5290373, -1.48342, -2.143978, 1, 1, 1, 1, 1,
-0.5275337, 2.166702, -2.312876, 1, 1, 1, 1, 1,
-0.527011, 0.6139313, -0.05246445, 1, 1, 1, 1, 1,
-0.5190722, 1.298248, 0.3173168, 1, 1, 1, 1, 1,
-0.5139244, 0.1310974, -1.796356, 1, 1, 1, 1, 1,
-0.5119727, -1.608614, -3.890138, 1, 1, 1, 1, 1,
-0.5117732, 1.022371, -0.997065, 1, 1, 1, 1, 1,
-0.5087744, 0.9291737, 0.8764274, 1, 1, 1, 1, 1,
-0.508587, -0.5466502, -2.459551, 0, 0, 1, 1, 1,
-0.507441, 0.1670282, -2.026134, 1, 0, 0, 1, 1,
-0.5047868, 0.1588413, -1.920491, 1, 0, 0, 1, 1,
-0.5047798, -0.7103598, -2.103207, 1, 0, 0, 1, 1,
-0.4981143, 0.3542628, -0.7333345, 1, 0, 0, 1, 1,
-0.4974711, -0.3217835, -3.809059, 1, 0, 0, 1, 1,
-0.4962944, -0.8247175, -2.473212, 0, 0, 0, 1, 1,
-0.4945285, 1.433636, 0.7160155, 0, 0, 0, 1, 1,
-0.4933367, -0.4773418, -2.701613, 0, 0, 0, 1, 1,
-0.4930784, 1.442243, -1.005086, 0, 0, 0, 1, 1,
-0.4910049, -0.5581456, -3.157432, 0, 0, 0, 1, 1,
-0.4878281, -0.2147419, -0.9983779, 0, 0, 0, 1, 1,
-0.4874732, 0.229186, -0.4915601, 0, 0, 0, 1, 1,
-0.4789485, -1.861101, -4.260686, 1, 1, 1, 1, 1,
-0.4781596, 1.371956, 1.431414, 1, 1, 1, 1, 1,
-0.4772499, -0.6225114, -3.734426, 1, 1, 1, 1, 1,
-0.4732344, -0.7276521, -3.688965, 1, 1, 1, 1, 1,
-0.470643, -0.03220504, -0.7269557, 1, 1, 1, 1, 1,
-0.4698769, 1.482776, -0.1795983, 1, 1, 1, 1, 1,
-0.4668094, 0.5091968, 0.732738, 1, 1, 1, 1, 1,
-0.4660149, -0.8165595, -3.473138, 1, 1, 1, 1, 1,
-0.465098, 1.034413, -0.1033191, 1, 1, 1, 1, 1,
-0.4571402, 0.9574879, 0.322283, 1, 1, 1, 1, 1,
-0.4527773, -1.183425, -3.187269, 1, 1, 1, 1, 1,
-0.4501484, -0.3326427, -0.7145885, 1, 1, 1, 1, 1,
-0.4422648, 0.6565236, 0.1068142, 1, 1, 1, 1, 1,
-0.4405118, -0.2236844, -1.625628, 1, 1, 1, 1, 1,
-0.4402151, -0.2142495, -2.73392, 1, 1, 1, 1, 1,
-0.4344868, 0.1303692, -1.044569, 0, 0, 1, 1, 1,
-0.4316968, 0.9063427, -0.7151954, 1, 0, 0, 1, 1,
-0.4276778, 0.8888354, -0.8284098, 1, 0, 0, 1, 1,
-0.4244721, 0.1744812, -1.157006, 1, 0, 0, 1, 1,
-0.4215023, -0.6210405, -2.278887, 1, 0, 0, 1, 1,
-0.419656, -1.618404, -2.33512, 1, 0, 0, 1, 1,
-0.4192754, -2.538077, -4.414567, 0, 0, 0, 1, 1,
-0.4165691, 0.9122639, -0.2867247, 0, 0, 0, 1, 1,
-0.4163999, 0.2827747, -0.2473846, 0, 0, 0, 1, 1,
-0.4150653, -1.140568, -3.508067, 0, 0, 0, 1, 1,
-0.4070578, 0.2730981, -1.873652, 0, 0, 0, 1, 1,
-0.4056864, 0.2418729, -1.241685, 0, 0, 0, 1, 1,
-0.4035731, 1.086344, -1.687005, 0, 0, 0, 1, 1,
-0.4032073, 0.9835315, -1.155954, 1, 1, 1, 1, 1,
-0.4019234, -1.070574, -2.916138, 1, 1, 1, 1, 1,
-0.4008118, -0.7288155, -3.208636, 1, 1, 1, 1, 1,
-0.4001056, -0.3551541, -3.577327, 1, 1, 1, 1, 1,
-0.3996152, -0.05260599, -1.748211, 1, 1, 1, 1, 1,
-0.3993509, 0.380052, -0.8680323, 1, 1, 1, 1, 1,
-0.399118, -0.06381891, -1.458773, 1, 1, 1, 1, 1,
-0.3962136, 0.1168366, -0.3138922, 1, 1, 1, 1, 1,
-0.3940187, -0.7207501, -1.694221, 1, 1, 1, 1, 1,
-0.3914321, -1.387928, -3.170289, 1, 1, 1, 1, 1,
-0.3910247, 1.262149, -0.151697, 1, 1, 1, 1, 1,
-0.389323, 0.2465764, -1.070741, 1, 1, 1, 1, 1,
-0.3851756, 1.035387, 0.009695943, 1, 1, 1, 1, 1,
-0.3834185, 0.6203777, -1.232487, 1, 1, 1, 1, 1,
-0.3822349, -1.423713, -1.909948, 1, 1, 1, 1, 1,
-0.3773785, 0.9879645, 1.182495, 0, 0, 1, 1, 1,
-0.3719145, 0.4027097, -0.09666269, 1, 0, 0, 1, 1,
-0.3715926, 1.019798, -1.004712, 1, 0, 0, 1, 1,
-0.3676671, -1.316738, -2.209906, 1, 0, 0, 1, 1,
-0.361973, 0.09360293, -0.9727264, 1, 0, 0, 1, 1,
-0.3600726, -1.137412, -2.7375, 1, 0, 0, 1, 1,
-0.3595567, -0.9297529, -2.470277, 0, 0, 0, 1, 1,
-0.3571231, -1.144122, -1.852588, 0, 0, 0, 1, 1,
-0.3564109, 0.1054746, -1.669288, 0, 0, 0, 1, 1,
-0.3552734, -0.3225903, -2.19532, 0, 0, 0, 1, 1,
-0.3551933, -2.243773, -3.788123, 0, 0, 0, 1, 1,
-0.346716, -1.398262, -3.13642, 0, 0, 0, 1, 1,
-0.3459798, -0.2302944, -2.288906, 0, 0, 0, 1, 1,
-0.3446029, 0.03576079, -1.818775, 1, 1, 1, 1, 1,
-0.3434067, -0.9484389, -2.962467, 1, 1, 1, 1, 1,
-0.339416, -1.912845, -2.023369, 1, 1, 1, 1, 1,
-0.3366669, -0.8164055, -2.940289, 1, 1, 1, 1, 1,
-0.3272918, -0.8448211, -1.386122, 1, 1, 1, 1, 1,
-0.3266882, 0.2388646, 0.1552458, 1, 1, 1, 1, 1,
-0.3218617, 0.1239076, -1.308432, 1, 1, 1, 1, 1,
-0.3194862, 0.6280222, 0.4370754, 1, 1, 1, 1, 1,
-0.3106193, -0.1563579, -2.926112, 1, 1, 1, 1, 1,
-0.3047783, -0.0886649, -0.7306588, 1, 1, 1, 1, 1,
-0.3010739, 0.4693381, -0.9659986, 1, 1, 1, 1, 1,
-0.2951802, 0.1374797, -2.469792, 1, 1, 1, 1, 1,
-0.2944269, -0.4054891, -0.9732143, 1, 1, 1, 1, 1,
-0.2932754, 0.1006586, -1.862567, 1, 1, 1, 1, 1,
-0.2931604, -0.07612737, -3.098264, 1, 1, 1, 1, 1,
-0.2925558, 0.003598014, -0.2285416, 0, 0, 1, 1, 1,
-0.2869719, 1.564434, 0.4421916, 1, 0, 0, 1, 1,
-0.2790161, 0.9928221, 0.2684381, 1, 0, 0, 1, 1,
-0.2782622, -0.5664902, -3.24202, 1, 0, 0, 1, 1,
-0.2767845, -0.1810082, -0.8098412, 1, 0, 0, 1, 1,
-0.2761306, -0.63302, -2.644722, 1, 0, 0, 1, 1,
-0.2680693, 0.9220816, -0.8149014, 0, 0, 0, 1, 1,
-0.2670971, -0.4750714, -2.101681, 0, 0, 0, 1, 1,
-0.2644587, -0.1642071, -2.73926, 0, 0, 0, 1, 1,
-0.2572156, -0.8610099, -1.979927, 0, 0, 0, 1, 1,
-0.2552864, 1.086319, 1.076395, 0, 0, 0, 1, 1,
-0.2541835, -2.624449, -0.1713273, 0, 0, 0, 1, 1,
-0.249812, -0.3046849, -3.103615, 0, 0, 0, 1, 1,
-0.2494315, 0.4835904, -0.5873659, 1, 1, 1, 1, 1,
-0.2464109, -1.356258, -2.354525, 1, 1, 1, 1, 1,
-0.2436781, -1.106667, -4.307237, 1, 1, 1, 1, 1,
-0.2412412, -1.327381, -2.126719, 1, 1, 1, 1, 1,
-0.2407016, -0.2632891, -3.005201, 1, 1, 1, 1, 1,
-0.2405286, -0.7010906, -3.73172, 1, 1, 1, 1, 1,
-0.2381594, -1.211696, -4.44293, 1, 1, 1, 1, 1,
-0.2376269, -0.9405742, -2.444199, 1, 1, 1, 1, 1,
-0.2349674, 1.141767, -1.531988, 1, 1, 1, 1, 1,
-0.2293568, -0.2137698, -3.66714, 1, 1, 1, 1, 1,
-0.2289034, -0.737728, -3.404664, 1, 1, 1, 1, 1,
-0.2257784, 0.4230227, -0.3551333, 1, 1, 1, 1, 1,
-0.2144103, 0.6327763, -0.3489607, 1, 1, 1, 1, 1,
-0.214115, 2.898418, -0.9574413, 1, 1, 1, 1, 1,
-0.2099665, 0.3734548, -0.2222586, 1, 1, 1, 1, 1,
-0.2091182, -0.4960569, 0.5017679, 0, 0, 1, 1, 1,
-0.2027, 1.113559, -0.01067615, 1, 0, 0, 1, 1,
-0.2015763, -0.7611922, -2.629912, 1, 0, 0, 1, 1,
-0.1966339, -1.68603, -2.850766, 1, 0, 0, 1, 1,
-0.1959786, 0.1894143, -0.1342916, 1, 0, 0, 1, 1,
-0.1905466, -0.2134359, -1.701387, 1, 0, 0, 1, 1,
-0.1892947, -0.8579474, -1.898873, 0, 0, 0, 1, 1,
-0.18653, 0.09754193, -2.636427, 0, 0, 0, 1, 1,
-0.1819328, 0.4093818, 0.1314296, 0, 0, 0, 1, 1,
-0.1801018, 0.2126982, -0.1337526, 0, 0, 0, 1, 1,
-0.1714924, 0.1496181, -0.6276426, 0, 0, 0, 1, 1,
-0.1696759, 0.08702516, -1.223974, 0, 0, 0, 1, 1,
-0.1636231, 2.588003, 1.588367, 0, 0, 0, 1, 1,
-0.1607324, -0.4959401, -2.497838, 1, 1, 1, 1, 1,
-0.1603094, -0.76623, -1.636327, 1, 1, 1, 1, 1,
-0.1599036, -1.454879, -3.028936, 1, 1, 1, 1, 1,
-0.1593758, -2.055831, -1.287553, 1, 1, 1, 1, 1,
-0.1589283, -0.4820673, -0.5588409, 1, 1, 1, 1, 1,
-0.1582048, 0.4812284, -0.3072382, 1, 1, 1, 1, 1,
-0.1565707, -2.052971, -3.363973, 1, 1, 1, 1, 1,
-0.1474579, 0.6852717, 0.6467565, 1, 1, 1, 1, 1,
-0.1381604, 0.001593642, -1.395443, 1, 1, 1, 1, 1,
-0.1373492, -0.04787545, -1.37674, 1, 1, 1, 1, 1,
-0.1360853, -0.7152765, -3.063734, 1, 1, 1, 1, 1,
-0.1343273, -1.803564, -1.906346, 1, 1, 1, 1, 1,
-0.1313258, 0.8109809, 0.6330976, 1, 1, 1, 1, 1,
-0.1272683, -1.638749, -5.988927, 1, 1, 1, 1, 1,
-0.125175, -0.9561432, -3.948189, 1, 1, 1, 1, 1,
-0.1220163, -0.09009028, -3.410693, 0, 0, 1, 1, 1,
-0.1206166, 0.2050728, -0.7197368, 1, 0, 0, 1, 1,
-0.1197029, -0.2602305, -2.931298, 1, 0, 0, 1, 1,
-0.1155629, 0.3153734, 0.736809, 1, 0, 0, 1, 1,
-0.1148712, 0.2404001, 0.008345132, 1, 0, 0, 1, 1,
-0.1140629, -1.55792, -4.027005, 1, 0, 0, 1, 1,
-0.1102517, -0.4835838, -2.817882, 0, 0, 0, 1, 1,
-0.1086138, 2.227945, -0.7440178, 0, 0, 0, 1, 1,
-0.1084138, 0.941088, -1.151359, 0, 0, 0, 1, 1,
-0.1076944, -0.07972056, -2.780825, 0, 0, 0, 1, 1,
-0.1036853, -1.658646, -4.550871, 0, 0, 0, 1, 1,
-0.1033406, 0.09960754, -0.6190243, 0, 0, 0, 1, 1,
-0.1024112, 0.1348755, 0.4309967, 0, 0, 0, 1, 1,
-0.09992553, -1.658759, -3.555807, 1, 1, 1, 1, 1,
-0.09987152, 0.06655053, -0.349565, 1, 1, 1, 1, 1,
-0.09616526, 1.709572, -0.4924733, 1, 1, 1, 1, 1,
-0.09052034, 0.7344094, 0.05547231, 1, 1, 1, 1, 1,
-0.08788368, -0.2414724, -1.813027, 1, 1, 1, 1, 1,
-0.08429566, -1.05122, -1.470734, 1, 1, 1, 1, 1,
-0.08349054, -1.060931, -2.362365, 1, 1, 1, 1, 1,
-0.08348002, -1.525318, -2.668377, 1, 1, 1, 1, 1,
-0.08198106, -0.7676833, -4.1486, 1, 1, 1, 1, 1,
-0.07362755, 0.1093655, -1.391253, 1, 1, 1, 1, 1,
-0.07268286, 0.8363, -1.319494, 1, 1, 1, 1, 1,
-0.07204597, -0.3199001, -0.942776, 1, 1, 1, 1, 1,
-0.0719296, 1.455179, -1.318907, 1, 1, 1, 1, 1,
-0.07188617, 2.210705, -1.138183, 1, 1, 1, 1, 1,
-0.06835173, 0.30442, 0.7353203, 1, 1, 1, 1, 1,
-0.06535515, 0.3402215, -0.8428339, 0, 0, 1, 1, 1,
-0.06411787, 0.8886492, -0.2551418, 1, 0, 0, 1, 1,
-0.06050382, 0.02490936, 0.1412449, 1, 0, 0, 1, 1,
-0.05654036, 1.074294, -1.151716, 1, 0, 0, 1, 1,
-0.05029696, 0.4491283, -0.2273924, 1, 0, 0, 1, 1,
-0.04758628, 0.2978524, 0.4600415, 1, 0, 0, 1, 1,
-0.04543853, -1.149265, -3.326098, 0, 0, 0, 1, 1,
-0.0406804, -1.039547, -4.772911, 0, 0, 0, 1, 1,
-0.03956823, 0.5124735, -1.965527, 0, 0, 0, 1, 1,
-0.03809399, -0.4918661, -4.130699, 0, 0, 0, 1, 1,
-0.03527154, -1.657727, -4.354434, 0, 0, 0, 1, 1,
-0.03120521, 0.2753909, 0.2425638, 0, 0, 0, 1, 1,
-0.03119585, -1.166019, -2.040559, 0, 0, 0, 1, 1,
-0.02592563, -0.6202621, -3.285632, 1, 1, 1, 1, 1,
-0.02543116, 1.175794, -0.5683616, 1, 1, 1, 1, 1,
-0.02323869, 0.1219033, 0.859966, 1, 1, 1, 1, 1,
-0.02171225, -0.5993986, -3.724003, 1, 1, 1, 1, 1,
-0.02003831, -0.2543918, -1.420466, 1, 1, 1, 1, 1,
-0.01810224, -1.195714, -2.846071, 1, 1, 1, 1, 1,
-0.01793833, -2.252344, -1.856535, 1, 1, 1, 1, 1,
-0.0140198, 0.6692296, 0.6387331, 1, 1, 1, 1, 1,
-0.006113293, -0.6010728, -2.590559, 1, 1, 1, 1, 1,
-0.005448375, -0.3636066, -2.806632, 1, 1, 1, 1, 1,
-0.005034068, -0.5864852, -3.938265, 1, 1, 1, 1, 1,
-0.002802446, -1.085257, -5.483044, 1, 1, 1, 1, 1,
0.00543639, 1.383618, -0.71599, 1, 1, 1, 1, 1,
0.007077334, 0.8287701, 1.791075, 1, 1, 1, 1, 1,
0.008943993, 1.072381, 0.1379102, 1, 1, 1, 1, 1,
0.009207859, -0.3288462, 3.814347, 0, 0, 1, 1, 1,
0.01596323, -0.2397279, 2.808117, 1, 0, 0, 1, 1,
0.01655974, 0.01885488, -1.277356, 1, 0, 0, 1, 1,
0.02000833, -0.1178211, 4.94389, 1, 0, 0, 1, 1,
0.02170897, -1.045022, 2.591887, 1, 0, 0, 1, 1,
0.02806239, -0.0718788, 1.438285, 1, 0, 0, 1, 1,
0.0378274, 1.111458, 0.9677399, 0, 0, 0, 1, 1,
0.04231741, 0.2806904, -0.3576631, 0, 0, 0, 1, 1,
0.05392013, 1.430014, -1.210241, 0, 0, 0, 1, 1,
0.0540724, 0.3590996, 0.305935, 0, 0, 0, 1, 1,
0.05787626, -2.215955, 3.154594, 0, 0, 0, 1, 1,
0.06077165, 2.620797, 1.436865, 0, 0, 0, 1, 1,
0.06270717, -1.609206, 2.830579, 0, 0, 0, 1, 1,
0.0647516, -1.243703, 3.66089, 1, 1, 1, 1, 1,
0.06693061, 0.02218322, -0.7998668, 1, 1, 1, 1, 1,
0.07045885, -0.7297235, 4.003997, 1, 1, 1, 1, 1,
0.07175835, 1.323159, 0.2505508, 1, 1, 1, 1, 1,
0.07294272, 0.3371772, -0.2418771, 1, 1, 1, 1, 1,
0.07748421, -1.32465, 2.964399, 1, 1, 1, 1, 1,
0.08422718, -1.539542, 2.785055, 1, 1, 1, 1, 1,
0.08430257, -1.406646, 4.118762, 1, 1, 1, 1, 1,
0.08623847, 0.2470739, -0.5310721, 1, 1, 1, 1, 1,
0.08836707, -0.7521449, 2.375345, 1, 1, 1, 1, 1,
0.09685337, 0.977814, -0.2181203, 1, 1, 1, 1, 1,
0.09815218, -0.5292503, -0.4235697, 1, 1, 1, 1, 1,
0.0995171, 1.575704, 1.672299, 1, 1, 1, 1, 1,
0.09971032, -0.3428283, 3.356659, 1, 1, 1, 1, 1,
0.1002736, -1.154283, 2.632961, 1, 1, 1, 1, 1,
0.1016216, 0.08125884, 0.7828686, 0, 0, 1, 1, 1,
0.1020728, -1.521484, 4.296283, 1, 0, 0, 1, 1,
0.1024837, -0.5981925, 3.021074, 1, 0, 0, 1, 1,
0.1050251, -0.5028933, 2.622249, 1, 0, 0, 1, 1,
0.1075846, -0.4753004, 3.451988, 1, 0, 0, 1, 1,
0.1096444, 0.5050176, -0.3710769, 1, 0, 0, 1, 1,
0.1096949, -0.2306965, 2.928318, 0, 0, 0, 1, 1,
0.1135785, -0.422375, 2.785022, 0, 0, 0, 1, 1,
0.1141051, -1.661247, 1.953358, 0, 0, 0, 1, 1,
0.1203461, 0.7412969, 0.03467914, 0, 0, 0, 1, 1,
0.1205484, 0.9751378, 0.3400878, 0, 0, 0, 1, 1,
0.1222279, -0.8729218, 4.836614, 0, 0, 0, 1, 1,
0.1228402, -1.061931, 2.925392, 0, 0, 0, 1, 1,
0.1263705, -0.465343, 3.165628, 1, 1, 1, 1, 1,
0.1313963, 0.1489685, 0.2508185, 1, 1, 1, 1, 1,
0.1327153, -0.6518335, 4.925874, 1, 1, 1, 1, 1,
0.1332366, 0.3229881, 1.368668, 1, 1, 1, 1, 1,
0.1335569, -2.138566, 2.483823, 1, 1, 1, 1, 1,
0.138009, -1.180487, 2.605917, 1, 1, 1, 1, 1,
0.1391019, 0.2616029, 3.07294, 1, 1, 1, 1, 1,
0.1419444, -0.6413292, 0.6049187, 1, 1, 1, 1, 1,
0.1450542, -0.3637978, 1.831689, 1, 1, 1, 1, 1,
0.1481237, -2.78141, 2.997673, 1, 1, 1, 1, 1,
0.1493326, -0.9545887, 2.767676, 1, 1, 1, 1, 1,
0.1503279, -1.685227, 3.883006, 1, 1, 1, 1, 1,
0.1556205, 1.854166, -0.5094485, 1, 1, 1, 1, 1,
0.1578794, 0.1040464, 0.9516992, 1, 1, 1, 1, 1,
0.1589839, 0.2081884, 1.49941, 1, 1, 1, 1, 1,
0.1647921, 0.3268044, -0.3805082, 0, 0, 1, 1, 1,
0.1651048, -0.519203, 2.673947, 1, 0, 0, 1, 1,
0.168038, -0.5196248, 3.117261, 1, 0, 0, 1, 1,
0.1687618, 0.4635644, 1.662047, 1, 0, 0, 1, 1,
0.1798639, 0.7787858, 1.63934, 1, 0, 0, 1, 1,
0.1833527, -2.185889, 1.075787, 1, 0, 0, 1, 1,
0.1850691, -1.894173, 2.419709, 0, 0, 0, 1, 1,
0.1857264, -0.1189997, 3.238911, 0, 0, 0, 1, 1,
0.1870013, -0.8018528, 1.111313, 0, 0, 0, 1, 1,
0.1992401, 0.60343, 1.954133, 0, 0, 0, 1, 1,
0.2012162, -1.520647, 1.329269, 0, 0, 0, 1, 1,
0.2061261, 1.877919, -0.9659979, 0, 0, 0, 1, 1,
0.2070891, 0.5299617, -0.8147053, 0, 0, 0, 1, 1,
0.2104364, 1.229864, -0.5879965, 1, 1, 1, 1, 1,
0.2114338, 0.4312261, 0.9830181, 1, 1, 1, 1, 1,
0.2120197, -1.082468, 3.66541, 1, 1, 1, 1, 1,
0.2126404, -0.9706522, 1.708268, 1, 1, 1, 1, 1,
0.2162429, 0.5953245, 0.5291851, 1, 1, 1, 1, 1,
0.2178568, -0.2151076, 1.96084, 1, 1, 1, 1, 1,
0.2185924, 1.230102, -0.1104893, 1, 1, 1, 1, 1,
0.2197946, -0.5273122, 2.902245, 1, 1, 1, 1, 1,
0.2237841, 0.2963891, -1.630701, 1, 1, 1, 1, 1,
0.2313609, 0.5436155, 0.2481099, 1, 1, 1, 1, 1,
0.2346421, -0.4005864, 2.945166, 1, 1, 1, 1, 1,
0.2434757, 0.5628417, 0.09016236, 1, 1, 1, 1, 1,
0.247301, 0.980481, -0.3423312, 1, 1, 1, 1, 1,
0.2594953, 0.9794174, -0.2107274, 1, 1, 1, 1, 1,
0.2617859, -0.3278418, 2.932369, 1, 1, 1, 1, 1,
0.2625072, 0.9332314, -0.7250124, 0, 0, 1, 1, 1,
0.2641244, -1.054521, 4.601414, 1, 0, 0, 1, 1,
0.2677788, -0.7451025, 1.603468, 1, 0, 0, 1, 1,
0.2683001, 1.287129, 0.6218233, 1, 0, 0, 1, 1,
0.2702847, 0.9863851, -2.128393, 1, 0, 0, 1, 1,
0.2704963, -0.8176943, 3.42828, 1, 0, 0, 1, 1,
0.2709598, 1.349693, -0.9309545, 0, 0, 0, 1, 1,
0.2740124, -0.02208593, 1.545841, 0, 0, 0, 1, 1,
0.2750348, 2.608679, -0.3521003, 0, 0, 0, 1, 1,
0.2772627, 0.1053425, 1.074263, 0, 0, 0, 1, 1,
0.2774808, 0.05366429, 0.9491256, 0, 0, 0, 1, 1,
0.279349, 0.3328559, -0.5811331, 0, 0, 0, 1, 1,
0.2829163, -0.3016124, 1.874321, 0, 0, 0, 1, 1,
0.2855827, 1.557441, 0.03213827, 1, 1, 1, 1, 1,
0.2930304, 0.9154469, 1.041516, 1, 1, 1, 1, 1,
0.2978354, -0.4546001, 1.238481, 1, 1, 1, 1, 1,
0.2989233, 0.3740549, 1.845183, 1, 1, 1, 1, 1,
0.3080859, -1.159612, 2.205142, 1, 1, 1, 1, 1,
0.315125, 0.135228, 1.58173, 1, 1, 1, 1, 1,
0.3237785, -2.909103, 2.454369, 1, 1, 1, 1, 1,
0.3253396, 0.1465482, -2.190581, 1, 1, 1, 1, 1,
0.333011, 0.3680209, 0.5781811, 1, 1, 1, 1, 1,
0.3332205, 0.5246983, -0.4189165, 1, 1, 1, 1, 1,
0.3349656, -0.2424096, 3.833752, 1, 1, 1, 1, 1,
0.3376419, -0.1630022, 0.3253081, 1, 1, 1, 1, 1,
0.3419997, -0.3629687, 3.783716, 1, 1, 1, 1, 1,
0.3433415, 0.3688763, 0.7542575, 1, 1, 1, 1, 1,
0.3446736, 0.2683297, 1.131686, 1, 1, 1, 1, 1,
0.3455382, -0.4232605, 2.872535, 0, 0, 1, 1, 1,
0.3482771, -0.8851604, 3.144451, 1, 0, 0, 1, 1,
0.349694, 0.2233781, -0.8912533, 1, 0, 0, 1, 1,
0.3507604, -1.790358, 1.133034, 1, 0, 0, 1, 1,
0.3526751, 1.294128, 1.007704, 1, 0, 0, 1, 1,
0.3543323, -0.2799894, 3.062756, 1, 0, 0, 1, 1,
0.3558103, -0.1074166, 1.56999, 0, 0, 0, 1, 1,
0.357461, -1.912936, 3.006797, 0, 0, 0, 1, 1,
0.3715092, -1.022674, 3.664392, 0, 0, 0, 1, 1,
0.371568, -0.4718671, 3.371493, 0, 0, 0, 1, 1,
0.3775041, 0.870527, 1.20172, 0, 0, 0, 1, 1,
0.3793193, 0.3726254, 1.035095, 0, 0, 0, 1, 1,
0.3807494, 2.488247, -0.3492781, 0, 0, 0, 1, 1,
0.38436, -1.373904, 3.568398, 1, 1, 1, 1, 1,
0.3859478, -1.372082, 3.958053, 1, 1, 1, 1, 1,
0.3901865, 1.173938, -1.664862, 1, 1, 1, 1, 1,
0.3968486, 0.580345, 1.38517, 1, 1, 1, 1, 1,
0.3990082, 0.4624834, 1.273744, 1, 1, 1, 1, 1,
0.4015, 0.4556805, 0.5294135, 1, 1, 1, 1, 1,
0.4050953, -0.6980319, 3.572187, 1, 1, 1, 1, 1,
0.4057043, -1.727666, 4.360025, 1, 1, 1, 1, 1,
0.4091233, -1.750096, 3.436121, 1, 1, 1, 1, 1,
0.4097478, 0.949537, -0.6980036, 1, 1, 1, 1, 1,
0.4113287, -0.3186802, 3.641968, 1, 1, 1, 1, 1,
0.4117619, 1.237874, 1.052655, 1, 1, 1, 1, 1,
0.4160539, 0.3734847, 0.6892043, 1, 1, 1, 1, 1,
0.4160573, -0.6241203, 3.276998, 1, 1, 1, 1, 1,
0.4205004, 0.02105233, 1.059252, 1, 1, 1, 1, 1,
0.4211675, 1.028244, 1.618551, 0, 0, 1, 1, 1,
0.42295, -0.05412472, 2.244914, 1, 0, 0, 1, 1,
0.4243128, 2.551354, -0.2909891, 1, 0, 0, 1, 1,
0.4284177, 1.429531, -0.6497501, 1, 0, 0, 1, 1,
0.4286622, -0.9068151, 2.28118, 1, 0, 0, 1, 1,
0.4315492, 0.1494955, 2.428969, 1, 0, 0, 1, 1,
0.4414427, -0.2027531, 1.508528, 0, 0, 0, 1, 1,
0.4437234, -1.562263, 1.595537, 0, 0, 0, 1, 1,
0.4465475, 0.2369932, 0.9046839, 0, 0, 0, 1, 1,
0.4538601, 0.04338927, 2.627687, 0, 0, 0, 1, 1,
0.4544805, -0.4986406, 0.4447733, 0, 0, 0, 1, 1,
0.4556895, -0.9382942, 0.3084125, 0, 0, 0, 1, 1,
0.4560232, 0.6718801, 0.5106323, 0, 0, 0, 1, 1,
0.4592328, 0.1163812, -0.6203727, 1, 1, 1, 1, 1,
0.4680134, 0.03457691, 0.2552835, 1, 1, 1, 1, 1,
0.4688165, 1.109246, -0.5467913, 1, 1, 1, 1, 1,
0.4714526, -0.8269152, 0.9961252, 1, 1, 1, 1, 1,
0.4790457, 0.6682542, -0.122451, 1, 1, 1, 1, 1,
0.4798659, -0.8695401, 2.93592, 1, 1, 1, 1, 1,
0.4809347, 0.3793564, -1.055545, 1, 1, 1, 1, 1,
0.4822985, -1.98047, 2.45929, 1, 1, 1, 1, 1,
0.4838032, -0.1506292, 2.629663, 1, 1, 1, 1, 1,
0.4915867, 0.9114011, 1.966419, 1, 1, 1, 1, 1,
0.5002334, 0.101752, 0.5312209, 1, 1, 1, 1, 1,
0.5043941, 0.1413258, 1.940268, 1, 1, 1, 1, 1,
0.5080267, -0.4875115, 1.651231, 1, 1, 1, 1, 1,
0.5099748, 0.3857886, 2.145174, 1, 1, 1, 1, 1,
0.5188821, 1.055946, 1.415188, 1, 1, 1, 1, 1,
0.5199103, 1.801993, -0.9417076, 0, 0, 1, 1, 1,
0.52123, 0.2075564, 1.686546, 1, 0, 0, 1, 1,
0.5214003, -0.6654173, 1.852873, 1, 0, 0, 1, 1,
0.5222192, 0.9082175, 0.8680806, 1, 0, 0, 1, 1,
0.5352209, 0.1057869, 0.6298945, 1, 0, 0, 1, 1,
0.5369225, -1.137417, 2.53706, 1, 0, 0, 1, 1,
0.537056, -1.13183, 2.175325, 0, 0, 0, 1, 1,
0.5392403, -1.392064, 3.51598, 0, 0, 0, 1, 1,
0.5406283, 0.4938206, 2.264118, 0, 0, 0, 1, 1,
0.5412975, 1.980229, 0.4001454, 0, 0, 0, 1, 1,
0.543014, 0.06976381, 3.24482, 0, 0, 0, 1, 1,
0.5561528, -0.5466194, 2.95728, 0, 0, 0, 1, 1,
0.5571624, 0.277318, 1.101084, 0, 0, 0, 1, 1,
0.5591331, -1.172159, 2.823687, 1, 1, 1, 1, 1,
0.5648815, 1.44989, 2.041608, 1, 1, 1, 1, 1,
0.5759841, -0.673824, 1.563044, 1, 1, 1, 1, 1,
0.5825854, 1.248419, 0.1832872, 1, 1, 1, 1, 1,
0.5903111, 0.4898453, 0.7389659, 1, 1, 1, 1, 1,
0.5904603, -0.9050048, 4.589266, 1, 1, 1, 1, 1,
0.5927827, 0.04498835, 2.788949, 1, 1, 1, 1, 1,
0.5950648, -1.706183, 1.593053, 1, 1, 1, 1, 1,
0.6130099, 0.6787481, 1.789671, 1, 1, 1, 1, 1,
0.6166063, 1.314853, 1.305058, 1, 1, 1, 1, 1,
0.6166483, -2.350763, 3.028409, 1, 1, 1, 1, 1,
0.6237934, 1.171362, 0.447275, 1, 1, 1, 1, 1,
0.6255596, 0.9632279, -0.7915632, 1, 1, 1, 1, 1,
0.6396655, -0.6785006, 4.505251, 1, 1, 1, 1, 1,
0.6422292, 0.9916971, 1.44343, 1, 1, 1, 1, 1,
0.6479609, -0.9414654, 3.578252, 0, 0, 1, 1, 1,
0.6532261, 0.2349574, 2.210622, 1, 0, 0, 1, 1,
0.6532372, -0.1512768, 2.226889, 1, 0, 0, 1, 1,
0.6544044, -1.545607, 3.026233, 1, 0, 0, 1, 1,
0.6564287, 0.09098412, 1.615845, 1, 0, 0, 1, 1,
0.6594123, 0.6012152, -0.2104756, 1, 0, 0, 1, 1,
0.6717947, 0.3658009, -0.6108675, 0, 0, 0, 1, 1,
0.6733779, -0.342314, 0.2613802, 0, 0, 0, 1, 1,
0.6750985, 1.529242, 0.2881314, 0, 0, 0, 1, 1,
0.6754098, 0.3832586, 0.3511235, 0, 0, 0, 1, 1,
0.6757085, -0.5944269, 3.361298, 0, 0, 0, 1, 1,
0.6811746, 0.3297742, -0.4611244, 0, 0, 0, 1, 1,
0.684608, 0.8206784, 0.7161511, 0, 0, 0, 1, 1,
0.6847438, 1.032782, 1.28038, 1, 1, 1, 1, 1,
0.6959562, 0.3397629, 2.12283, 1, 1, 1, 1, 1,
0.6993634, 0.5815905, 1.97657, 1, 1, 1, 1, 1,
0.7051536, -1.137897, 1.896409, 1, 1, 1, 1, 1,
0.7055284, 0.03271619, 2.17475, 1, 1, 1, 1, 1,
0.7081779, -1.492624, 0.7041921, 1, 1, 1, 1, 1,
0.7101651, -0.5432081, 1.252272, 1, 1, 1, 1, 1,
0.7177171, -0.9634283, 2.579423, 1, 1, 1, 1, 1,
0.7200971, 0.6732005, 0.464845, 1, 1, 1, 1, 1,
0.7260524, 2.036785, 0.3994682, 1, 1, 1, 1, 1,
0.7264789, 0.5972396, -0.3286982, 1, 1, 1, 1, 1,
0.742091, -0.4509594, 3.753952, 1, 1, 1, 1, 1,
0.7430965, 0.3808143, 1.994713, 1, 1, 1, 1, 1,
0.7466569, -1.681934, 2.746112, 1, 1, 1, 1, 1,
0.7497491, 0.3949205, -0.1254339, 1, 1, 1, 1, 1,
0.7498769, 0.3701259, 1.941018, 0, 0, 1, 1, 1,
0.7499651, -1.441249, 2.659781, 1, 0, 0, 1, 1,
0.7518098, -0.1200285, 2.394725, 1, 0, 0, 1, 1,
0.7529026, -1.427273, 3.250262, 1, 0, 0, 1, 1,
0.753228, 0.05115794, 1.742485, 1, 0, 0, 1, 1,
0.7558407, -0.01866968, 2.589111, 1, 0, 0, 1, 1,
0.7563645, -0.3472059, 0.6281319, 0, 0, 0, 1, 1,
0.7637239, -1.148212, 0.7138117, 0, 0, 0, 1, 1,
0.7658362, -0.5953918, 4.052288, 0, 0, 0, 1, 1,
0.7693419, 2.284709, -1.823395, 0, 0, 0, 1, 1,
0.7733939, 1.478729, 3.324009, 0, 0, 0, 1, 1,
0.7754378, -1.23067, 2.353688, 0, 0, 0, 1, 1,
0.7754678, 0.1255975, 1.185075, 0, 0, 0, 1, 1,
0.7810207, -0.5606223, 3.159807, 1, 1, 1, 1, 1,
0.7816271, -0.5583021, 0.5874759, 1, 1, 1, 1, 1,
0.7852209, -1.605879, 2.460865, 1, 1, 1, 1, 1,
0.7887611, 1.630933, 0.2491917, 1, 1, 1, 1, 1,
0.7938958, 0.04979425, 1.692238, 1, 1, 1, 1, 1,
0.7964292, -1.548069, 3.007082, 1, 1, 1, 1, 1,
0.7969435, -0.7917178, 3.648087, 1, 1, 1, 1, 1,
0.7994237, 0.56919, 2.88875, 1, 1, 1, 1, 1,
0.800927, 0.2647825, 1.221597, 1, 1, 1, 1, 1,
0.801074, 0.943825, 0.1267648, 1, 1, 1, 1, 1,
0.804904, -1.091766, 2.328853, 1, 1, 1, 1, 1,
0.8056044, -0.1276388, 0.5054997, 1, 1, 1, 1, 1,
0.808075, 1.468561, 2.501792, 1, 1, 1, 1, 1,
0.8115868, -0.8967542, 2.632473, 1, 1, 1, 1, 1,
0.8146465, 0.533545, 1.228657, 1, 1, 1, 1, 1,
0.8161964, 0.001618001, 1.8705, 0, 0, 1, 1, 1,
0.8179834, 0.1313427, 1.440887, 1, 0, 0, 1, 1,
0.8230978, 0.3605261, 1.988941, 1, 0, 0, 1, 1,
0.8232883, -1.216702, 3.889868, 1, 0, 0, 1, 1,
0.8334216, -0.2778117, 2.623286, 1, 0, 0, 1, 1,
0.8360539, -0.2970248, 2.085273, 1, 0, 0, 1, 1,
0.8417045, -0.04564828, 1.870795, 0, 0, 0, 1, 1,
0.8431088, 0.1987056, 0.6937025, 0, 0, 0, 1, 1,
0.8512998, -0.1827923, 1.84697, 0, 0, 0, 1, 1,
0.8590317, -1.317066, 1.607255, 0, 0, 0, 1, 1,
0.8617971, -1.963642, 2.770098, 0, 0, 0, 1, 1,
0.8634845, 1.483045, 1.068776, 0, 0, 0, 1, 1,
0.8642221, 0.3506749, 2.114091, 0, 0, 0, 1, 1,
0.8807545, -0.7409167, 2.469997, 1, 1, 1, 1, 1,
0.8811654, -0.2414953, 1.678052, 1, 1, 1, 1, 1,
0.8837562, 1.281518, 1.067792, 1, 1, 1, 1, 1,
0.8859317, -0.2764741, 0.2317749, 1, 1, 1, 1, 1,
0.8860487, -1.432197, 3.78759, 1, 1, 1, 1, 1,
0.8868757, 0.153294, 1.759822, 1, 1, 1, 1, 1,
0.8886304, 1.622835, -1.826313, 1, 1, 1, 1, 1,
0.9051928, -1.090407, 2.982662, 1, 1, 1, 1, 1,
0.9058077, -0.4509818, 3.24297, 1, 1, 1, 1, 1,
0.9071429, -0.7750568, 2.072888, 1, 1, 1, 1, 1,
0.9143241, -1.921538, 2.886625, 1, 1, 1, 1, 1,
0.9211857, 0.05934349, 1.137321, 1, 1, 1, 1, 1,
0.9252151, 0.6146503, 1.258094, 1, 1, 1, 1, 1,
0.9281045, -1.011164, 3.056065, 1, 1, 1, 1, 1,
0.9295397, 0.2184211, 1.00205, 1, 1, 1, 1, 1,
0.9359116, 0.8749727, 2.427724, 0, 0, 1, 1, 1,
0.9380915, 0.7083877, 1.678483, 1, 0, 0, 1, 1,
0.9440899, 0.8050917, 2.422792, 1, 0, 0, 1, 1,
0.945715, 0.6827899, 0.365148, 1, 0, 0, 1, 1,
0.9503054, 0.6140088, 1.396651, 1, 0, 0, 1, 1,
0.9548858, 1.400465, 1.98102, 1, 0, 0, 1, 1,
0.9558325, 0.220545, 0.4852421, 0, 0, 0, 1, 1,
0.9561279, -0.8126861, 0.3146463, 0, 0, 0, 1, 1,
0.9569899, -0.5782335, 2.343345, 0, 0, 0, 1, 1,
0.961005, 0.6969606, 0.9373296, 0, 0, 0, 1, 1,
0.9616019, 0.1681251, 1.172126, 0, 0, 0, 1, 1,
0.9644901, 0.3698539, 1.183818, 0, 0, 0, 1, 1,
0.9652301, -1.623222, 3.46351, 0, 0, 0, 1, 1,
0.9709122, 0.8142858, 0.9038169, 1, 1, 1, 1, 1,
0.9722367, -0.3129467, 1.717881, 1, 1, 1, 1, 1,
0.9730771, 0.393218, 0.6832391, 1, 1, 1, 1, 1,
0.9756242, -0.4445187, 3.089684, 1, 1, 1, 1, 1,
0.9770474, 0.471755, 0.2450694, 1, 1, 1, 1, 1,
0.9785696, 0.4281685, 0.6058259, 1, 1, 1, 1, 1,
0.9823425, 0.7488806, 1.646113, 1, 1, 1, 1, 1,
0.9832379, 0.9208179, 0.3525649, 1, 1, 1, 1, 1,
1.005019, -0.6904432, 4.024418, 1, 1, 1, 1, 1,
1.013152, -0.381476, 2.22859, 1, 1, 1, 1, 1,
1.017793, 1.137048, 1.679974, 1, 1, 1, 1, 1,
1.019575, -0.7199998, 2.36508, 1, 1, 1, 1, 1,
1.01964, 0.2952322, 2.542806, 1, 1, 1, 1, 1,
1.020133, -0.1400137, 1.472214, 1, 1, 1, 1, 1,
1.021401, 0.2889102, 2.26373, 1, 1, 1, 1, 1,
1.025595, 1.800149, 1.605938, 0, 0, 1, 1, 1,
1.026057, -2.11403, 1.860702, 1, 0, 0, 1, 1,
1.029834, 0.09641277, 2.643144, 1, 0, 0, 1, 1,
1.029856, -0.1211536, 1.558559, 1, 0, 0, 1, 1,
1.033957, -0.2560741, 3.648668, 1, 0, 0, 1, 1,
1.036506, 1.389975, 0.08990435, 1, 0, 0, 1, 1,
1.036901, 0.0001838999, 2.633592, 0, 0, 0, 1, 1,
1.042431, -0.4000091, 4.682733, 0, 0, 0, 1, 1,
1.044146, -0.1976897, -0.02591915, 0, 0, 0, 1, 1,
1.048044, -0.9843198, 3.362481, 0, 0, 0, 1, 1,
1.050735, -0.2044117, 2.668123, 0, 0, 0, 1, 1,
1.054832, 0.9975502, -0.45231, 0, 0, 0, 1, 1,
1.072801, -0.8563218, 1.771137, 0, 0, 0, 1, 1,
1.08447, 0.1261591, 0.6375017, 1, 1, 1, 1, 1,
1.08529, 0.6269664, -0.8180279, 1, 1, 1, 1, 1,
1.091406, -2.168285, 2.432134, 1, 1, 1, 1, 1,
1.09288, 0.7482057, 0.5554158, 1, 1, 1, 1, 1,
1.09299, 0.731016, -0.05082387, 1, 1, 1, 1, 1,
1.093559, 1.049641, 0.1506446, 1, 1, 1, 1, 1,
1.098698, -0.1031386, 1.482246, 1, 1, 1, 1, 1,
1.107214, -0.1335951, 2.633412, 1, 1, 1, 1, 1,
1.107707, -0.8772768, 3.848429, 1, 1, 1, 1, 1,
1.110594, -0.5209777, 3.347873, 1, 1, 1, 1, 1,
1.113267, 0.07653445, 3.684381, 1, 1, 1, 1, 1,
1.11612, 1.343986, 0.8443487, 1, 1, 1, 1, 1,
1.116584, -0.7371442, 4.477215, 1, 1, 1, 1, 1,
1.123396, 0.0198754, 1.239701, 1, 1, 1, 1, 1,
1.123736, 0.3226768, 0.5358084, 1, 1, 1, 1, 1,
1.137926, 0.7500763, -0.06833211, 0, 0, 1, 1, 1,
1.141304, -1.142181, 1.392609, 1, 0, 0, 1, 1,
1.143651, -0.5705396, 1.503189, 1, 0, 0, 1, 1,
1.144254, -2.459061, 2.356405, 1, 0, 0, 1, 1,
1.149499, 0.4794896, 0.07076744, 1, 0, 0, 1, 1,
1.153303, 0.006873026, 0.8394408, 1, 0, 0, 1, 1,
1.164524, -0.7804199, 1.583103, 0, 0, 0, 1, 1,
1.16476, -0.04299659, 1.550181, 0, 0, 0, 1, 1,
1.174592, -1.557567, 3.792294, 0, 0, 0, 1, 1,
1.174616, -0.1560552, 1.442807, 0, 0, 0, 1, 1,
1.177327, -0.3499274, 2.983947, 0, 0, 0, 1, 1,
1.178131, -1.596888, 2.280832, 0, 0, 0, 1, 1,
1.181889, 0.04976423, -0.2673781, 0, 0, 0, 1, 1,
1.182588, -1.417916, 1.485424, 1, 1, 1, 1, 1,
1.21544, -1.1813, 3.967272, 1, 1, 1, 1, 1,
1.217453, 0.6276934, 1.577837, 1, 1, 1, 1, 1,
1.220213, -1.181963, 0.8755949, 1, 1, 1, 1, 1,
1.220674, 1.379191, 0.3337358, 1, 1, 1, 1, 1,
1.226716, 0.08180148, 1.771433, 1, 1, 1, 1, 1,
1.234581, 1.727593, 0.04492606, 1, 1, 1, 1, 1,
1.245136, 0.4896213, 2.754656, 1, 1, 1, 1, 1,
1.278731, -1.254912, 0.6402133, 1, 1, 1, 1, 1,
1.28968, 0.6075339, 1.199565, 1, 1, 1, 1, 1,
1.290999, -0.5272019, 1.725492, 1, 1, 1, 1, 1,
1.294236, 1.375349, 0.3229781, 1, 1, 1, 1, 1,
1.301111, 0.5039609, 2.537495, 1, 1, 1, 1, 1,
1.306198, -0.592923, 2.417265, 1, 1, 1, 1, 1,
1.310313, -0.6894478, 1.850563, 1, 1, 1, 1, 1,
1.311355, -1.573221, 1.823753, 0, 0, 1, 1, 1,
1.314063, -1.052882, 1.140778, 1, 0, 0, 1, 1,
1.319094, 1.256123, 1.516509, 1, 0, 0, 1, 1,
1.321891, 0.1447008, 0.05101026, 1, 0, 0, 1, 1,
1.322095, 2.911222, 1.22334, 1, 0, 0, 1, 1,
1.325032, 0.4055525, -0.5638235, 1, 0, 0, 1, 1,
1.331921, -0.9378056, 2.236832, 0, 0, 0, 1, 1,
1.344129, -0.1990549, 3.145756, 0, 0, 0, 1, 1,
1.363139, -0.5312257, 1.255286, 0, 0, 0, 1, 1,
1.363276, 0.9579656, 0.3606893, 0, 0, 0, 1, 1,
1.375061, -1.306076, 1.751283, 0, 0, 0, 1, 1,
1.380293, -1.201063, 2.306452, 0, 0, 0, 1, 1,
1.390191, -1.697286, 1.362301, 0, 0, 0, 1, 1,
1.393709, 0.7066765, 0.8203894, 1, 1, 1, 1, 1,
1.401255, -0.5930507, 3.508753, 1, 1, 1, 1, 1,
1.404825, 0.7150648, 1.3356, 1, 1, 1, 1, 1,
1.416528, 1.379979, 0.3312042, 1, 1, 1, 1, 1,
1.424999, 0.2246232, 2.709129, 1, 1, 1, 1, 1,
1.428163, 0.335544, 1.512748, 1, 1, 1, 1, 1,
1.430381, 0.5315912, 3.38286, 1, 1, 1, 1, 1,
1.445252, 0.6053084, 0.7292712, 1, 1, 1, 1, 1,
1.448215, 0.4250395, 1.828486, 1, 1, 1, 1, 1,
1.449952, -1.884071, 2.158914, 1, 1, 1, 1, 1,
1.454283, 0.5135407, 0.8644356, 1, 1, 1, 1, 1,
1.459517, 0.01580112, 0.2607382, 1, 1, 1, 1, 1,
1.462118, 0.9131228, 0.25804, 1, 1, 1, 1, 1,
1.463929, -0.145272, 0.6073133, 1, 1, 1, 1, 1,
1.470385, -0.08039962, 2.46343, 1, 1, 1, 1, 1,
1.47104, 1.978402, 0.4377344, 0, 0, 1, 1, 1,
1.471197, -1.280851, 1.138333, 1, 0, 0, 1, 1,
1.472931, -2.154792, 1.403521, 1, 0, 0, 1, 1,
1.476744, 1.984896, -0.1951666, 1, 0, 0, 1, 1,
1.487122, 0.2063286, 0.9280748, 1, 0, 0, 1, 1,
1.499647, -2.545966, 3.146066, 1, 0, 0, 1, 1,
1.503389, 0.2656057, -1.11628, 0, 0, 0, 1, 1,
1.511284, -0.3545601, 3.672377, 0, 0, 0, 1, 1,
1.529027, -0.7690065, 1.857053, 0, 0, 0, 1, 1,
1.531546, 0.1122938, 1.441241, 0, 0, 0, 1, 1,
1.53588, 0.6798394, 0.5571914, 0, 0, 0, 1, 1,
1.537489, -0.6655878, 1.934396, 0, 0, 0, 1, 1,
1.539716, 0.4582796, 2.058229, 0, 0, 0, 1, 1,
1.54478, 0.7230764, 0.205109, 1, 1, 1, 1, 1,
1.546771, -0.4748708, 3.12467, 1, 1, 1, 1, 1,
1.57369, 0.2559724, 0.8668542, 1, 1, 1, 1, 1,
1.585299, -0.7079788, 2.409618, 1, 1, 1, 1, 1,
1.586904, -0.7911874, 2.961906, 1, 1, 1, 1, 1,
1.593078, -1.513718, 2.312956, 1, 1, 1, 1, 1,
1.604086, -0.1829911, 2.575473, 1, 1, 1, 1, 1,
1.621258, 3.303745, 1.716921, 1, 1, 1, 1, 1,
1.631613, -0.275063, 2.28466, 1, 1, 1, 1, 1,
1.632917, 0.3990649, 0.8696495, 1, 1, 1, 1, 1,
1.643402, 0.07934841, 0.9442759, 1, 1, 1, 1, 1,
1.650784, 0.5128903, 2.538895, 1, 1, 1, 1, 1,
1.650929, -0.4322373, 0.2659515, 1, 1, 1, 1, 1,
1.654447, 0.3204907, 2.349427, 1, 1, 1, 1, 1,
1.66183, -0.1145316, 2.994413, 1, 1, 1, 1, 1,
1.675726, 0.5861346, 2.842939, 0, 0, 1, 1, 1,
1.732672, 1.202836, 1.942484, 1, 0, 0, 1, 1,
1.7369, 0.6839898, 0.8903735, 1, 0, 0, 1, 1,
1.744126, -0.5269659, 2.564999, 1, 0, 0, 1, 1,
1.782066, 0.3251224, 2.585222, 1, 0, 0, 1, 1,
1.784026, -0.4049903, 0.3572192, 1, 0, 0, 1, 1,
1.789887, -1.24726, 2.021426, 0, 0, 0, 1, 1,
1.795504, -2.339934, 3.883793, 0, 0, 0, 1, 1,
1.806462, -0.6817438, 1.906735, 0, 0, 0, 1, 1,
1.835479, -1.243934, 1.696055, 0, 0, 0, 1, 1,
1.83962, -0.1167118, 1.890437, 0, 0, 0, 1, 1,
1.859479, -0.7598211, 1.377261, 0, 0, 0, 1, 1,
1.860525, 1.654703, 0.762525, 0, 0, 0, 1, 1,
1.872087, -1.636598, 2.706567, 1, 1, 1, 1, 1,
1.87286, 0.6216169, -0.012251, 1, 1, 1, 1, 1,
1.873673, -1.439228, 0.9161285, 1, 1, 1, 1, 1,
1.894763, 0.1418614, 1.225887, 1, 1, 1, 1, 1,
1.91079, 0.7668049, 2.834076, 1, 1, 1, 1, 1,
1.915105, -1.079764, 1.79515, 1, 1, 1, 1, 1,
1.926479, 0.7343249, 1.669428, 1, 1, 1, 1, 1,
1.965713, -1.375905, 0.2662465, 1, 1, 1, 1, 1,
1.968667, 0.03239207, 1.848912, 1, 1, 1, 1, 1,
1.973211, -1.020905, 3.614462, 1, 1, 1, 1, 1,
2.005535, 0.1559634, 2.944716, 1, 1, 1, 1, 1,
2.043359, -0.3984957, 2.266484, 1, 1, 1, 1, 1,
2.074402, 0.3184548, 1.009379, 1, 1, 1, 1, 1,
2.11555, 1.39017, 1.759416, 1, 1, 1, 1, 1,
2.166143, -0.9683061, 1.672683, 1, 1, 1, 1, 1,
2.174417, -1.55378, 2.809608, 0, 0, 1, 1, 1,
2.212676, -1.220411, 0.8228709, 1, 0, 0, 1, 1,
2.259317, -0.6749386, 1.645672, 1, 0, 0, 1, 1,
2.266825, 0.9523559, -0.2552847, 1, 0, 0, 1, 1,
2.274738, -0.02898069, 0.4784955, 1, 0, 0, 1, 1,
2.284129, 1.945777, 0.6065961, 1, 0, 0, 1, 1,
2.290129, 0.08633536, 1.724513, 0, 0, 0, 1, 1,
2.297784, 1.375773, 0.6840686, 0, 0, 0, 1, 1,
2.399405, -0.3529337, 3.666523, 0, 0, 0, 1, 1,
2.430631, 0.9223163, -0.3962544, 0, 0, 0, 1, 1,
2.486466, -1.363736, 2.11113, 0, 0, 0, 1, 1,
2.576385, -1.749775, 2.761695, 0, 0, 0, 1, 1,
2.637456, -0.6266355, 3.043516, 0, 0, 0, 1, 1,
2.772063, -0.2549057, 1.071377, 1, 1, 1, 1, 1,
2.828742, 0.2201301, 0.7430283, 1, 1, 1, 1, 1,
2.894577, -1.569578, 3.254668, 1, 1, 1, 1, 1,
2.902654, 0.9505279, 0.6531829, 1, 1, 1, 1, 1,
2.910732, 0.121562, 0.4763206, 1, 1, 1, 1, 1,
3.023601, 0.4987515, 2.162385, 1, 1, 1, 1, 1,
3.152229, 1.840101, 0.6936896, 1, 1, 1, 1, 1
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
var radius = 9.590991;
var distance = 33.68795;
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
mvMatrix.translate( 0.01253366, -0.1973212, 0.5225186 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.68795);
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
