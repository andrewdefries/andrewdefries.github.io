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
-2.960939, 1.013544, -2.380421, 1, 0, 0, 1,
-2.914185, -2.003169, -1.891076, 1, 0.007843138, 0, 1,
-2.710716, -0.1644724, -1.540208, 1, 0.01176471, 0, 1,
-2.575288, 0.3322628, -4.196981, 1, 0.01960784, 0, 1,
-2.536224, -0.4488877, -0.9576414, 1, 0.02352941, 0, 1,
-2.532673, -0.165137, -1.466632, 1, 0.03137255, 0, 1,
-2.426025, -0.2432793, -1.07706, 1, 0.03529412, 0, 1,
-2.399665, 1.819018, -0.5482557, 1, 0.04313726, 0, 1,
-2.377236, -0.3691258, -1.415536, 1, 0.04705882, 0, 1,
-2.302742, 0.7577199, 0.06842511, 1, 0.05490196, 0, 1,
-2.285379, 0.4787537, -2.841517, 1, 0.05882353, 0, 1,
-2.28266, -0.06485182, -2.093295, 1, 0.06666667, 0, 1,
-2.271583, -1.002648, 0.8949667, 1, 0.07058824, 0, 1,
-2.244048, 0.3232329, -1.376085, 1, 0.07843138, 0, 1,
-2.208586, 0.7873368, -0.4640489, 1, 0.08235294, 0, 1,
-2.191225, 1.378899, -0.7830103, 1, 0.09019608, 0, 1,
-2.18508, -0.3632833, -2.644423, 1, 0.09411765, 0, 1,
-2.158941, -0.3295819, -0.9206843, 1, 0.1019608, 0, 1,
-2.029938, 2.8055, -1.488426, 1, 0.1098039, 0, 1,
-2.013336, -1.192941, -1.832014, 1, 0.1137255, 0, 1,
-2.009993, -2.119599, -3.694149, 1, 0.1215686, 0, 1,
-2.004004, -1.052639, -1.382076, 1, 0.1254902, 0, 1,
-1.989449, 0.56457, -0.4024871, 1, 0.1333333, 0, 1,
-1.984152, -1.088639, -2.037228, 1, 0.1372549, 0, 1,
-1.974943, -0.2889262, -1.689529, 1, 0.145098, 0, 1,
-1.971007, 0.2393489, -2.205482, 1, 0.1490196, 0, 1,
-1.963955, -0.132806, -3.018717, 1, 0.1568628, 0, 1,
-1.960328, -1.914179, -2.305165, 1, 0.1607843, 0, 1,
-1.957503, 0.5425737, -2.452701, 1, 0.1686275, 0, 1,
-1.940526, 0.3481541, -2.28662, 1, 0.172549, 0, 1,
-1.921659, -1.621132, -2.360424, 1, 0.1803922, 0, 1,
-1.918458, 0.3637155, -1.582361, 1, 0.1843137, 0, 1,
-1.913813, 0.7591394, -1.385312, 1, 0.1921569, 0, 1,
-1.885122, -0.7261736, -1.760403, 1, 0.1960784, 0, 1,
-1.871846, 0.08935808, -2.077916, 1, 0.2039216, 0, 1,
-1.855234, -0.2711116, -1.383283, 1, 0.2117647, 0, 1,
-1.828793, -0.3623192, -2.221889, 1, 0.2156863, 0, 1,
-1.802004, -0.2545412, -2.685941, 1, 0.2235294, 0, 1,
-1.78235, 1.012139, 0.5247258, 1, 0.227451, 0, 1,
-1.782176, 0.994413, -2.183012, 1, 0.2352941, 0, 1,
-1.776419, 1.395019, -0.8358878, 1, 0.2392157, 0, 1,
-1.76675, -0.3348199, -2.020526, 1, 0.2470588, 0, 1,
-1.737349, 0.6886614, -2.913053, 1, 0.2509804, 0, 1,
-1.730648, -0.4604347, -1.347945, 1, 0.2588235, 0, 1,
-1.718221, 0.5012146, -1.033167, 1, 0.2627451, 0, 1,
-1.696682, -1.79838, -2.047386, 1, 0.2705882, 0, 1,
-1.691817, 0.6600393, -1.864182, 1, 0.2745098, 0, 1,
-1.685074, -2.069475, -2.297746, 1, 0.282353, 0, 1,
-1.67062, -1.233235, -2.27513, 1, 0.2862745, 0, 1,
-1.66934, -0.1526064, 1.325171, 1, 0.2941177, 0, 1,
-1.616636, -0.3753946, -2.362864, 1, 0.3019608, 0, 1,
-1.615968, -1.820341, -2.67865, 1, 0.3058824, 0, 1,
-1.606137, -0.1727926, -1.272773, 1, 0.3137255, 0, 1,
-1.594767, 0.4632507, -1.697906, 1, 0.3176471, 0, 1,
-1.587099, 1.214128, -0.3486121, 1, 0.3254902, 0, 1,
-1.582564, 1.053693, -0.6047533, 1, 0.3294118, 0, 1,
-1.577504, 0.5931075, 0.1196885, 1, 0.3372549, 0, 1,
-1.553507, -1.92444, -2.281895, 1, 0.3411765, 0, 1,
-1.546009, 0.4729162, -2.174411, 1, 0.3490196, 0, 1,
-1.540218, 1.666508, -1.839974, 1, 0.3529412, 0, 1,
-1.522326, 0.4027632, -1.238879, 1, 0.3607843, 0, 1,
-1.520513, 1.786845, -1.877119, 1, 0.3647059, 0, 1,
-1.518861, 0.1014396, -0.8018969, 1, 0.372549, 0, 1,
-1.512535, -0.04377864, -1.036495, 1, 0.3764706, 0, 1,
-1.512477, 0.07710469, -1.672913, 1, 0.3843137, 0, 1,
-1.50265, 1.220429, -1.832155, 1, 0.3882353, 0, 1,
-1.486054, 1.076253, -2.353025, 1, 0.3960784, 0, 1,
-1.484511, -0.07942444, -2.643049, 1, 0.4039216, 0, 1,
-1.481482, -0.103097, -2.552329, 1, 0.4078431, 0, 1,
-1.480369, -0.07616102, -2.350986, 1, 0.4156863, 0, 1,
-1.462149, -1.698148, -2.57223, 1, 0.4196078, 0, 1,
-1.461594, 0.2589451, -1.434236, 1, 0.427451, 0, 1,
-1.447595, -1.189824, -1.653899, 1, 0.4313726, 0, 1,
-1.446291, 0.5174755, -2.222412, 1, 0.4392157, 0, 1,
-1.444091, 0.786286, -0.2548365, 1, 0.4431373, 0, 1,
-1.433766, -0.3195239, -1.813378, 1, 0.4509804, 0, 1,
-1.431012, -0.3633636, -1.981758, 1, 0.454902, 0, 1,
-1.430066, -0.3763041, -2.968119, 1, 0.4627451, 0, 1,
-1.425948, -1.415662, -1.228438, 1, 0.4666667, 0, 1,
-1.424608, -0.6333169, -1.902172, 1, 0.4745098, 0, 1,
-1.41885, 0.05149516, -2.381062, 1, 0.4784314, 0, 1,
-1.416358, -0.4469032, -2.044463, 1, 0.4862745, 0, 1,
-1.413584, 0.4728527, -0.9134685, 1, 0.4901961, 0, 1,
-1.398681, 1.400226, -0.3702585, 1, 0.4980392, 0, 1,
-1.394333, 0.7138981, -0.8315481, 1, 0.5058824, 0, 1,
-1.376642, 0.9479645, -1.116125, 1, 0.509804, 0, 1,
-1.374925, 0.6096289, -1.854494, 1, 0.5176471, 0, 1,
-1.362253, 0.3545103, -0.1473763, 1, 0.5215687, 0, 1,
-1.341729, -0.2656175, -0.9584922, 1, 0.5294118, 0, 1,
-1.341471, -0.7672643, -2.389622, 1, 0.5333334, 0, 1,
-1.338188, -0.4227998, -1.807343, 1, 0.5411765, 0, 1,
-1.336225, 1.495383, 0.7093271, 1, 0.5450981, 0, 1,
-1.331978, -0.3305368, -2.183394, 1, 0.5529412, 0, 1,
-1.312951, 0.7571582, -1.978083, 1, 0.5568628, 0, 1,
-1.312506, -0.3583695, -2.035714, 1, 0.5647059, 0, 1,
-1.306579, -0.3439789, -0.2903188, 1, 0.5686275, 0, 1,
-1.292575, -0.7687463, -0.727789, 1, 0.5764706, 0, 1,
-1.28777, -0.9505402, -2.907853, 1, 0.5803922, 0, 1,
-1.285851, 0.4319057, -1.175042, 1, 0.5882353, 0, 1,
-1.284629, 0.1852131, -1.245877, 1, 0.5921569, 0, 1,
-1.279483, -1.589913, -3.702373, 1, 0.6, 0, 1,
-1.277162, -0.1769036, -1.767305, 1, 0.6078432, 0, 1,
-1.272003, -1.248288, -2.007223, 1, 0.6117647, 0, 1,
-1.266633, 0.06530029, -0.4339997, 1, 0.6196079, 0, 1,
-1.266543, -2.317251, -3.062414, 1, 0.6235294, 0, 1,
-1.253779, -0.3289146, -1.211743, 1, 0.6313726, 0, 1,
-1.2437, 0.9040591, -1.278858, 1, 0.6352941, 0, 1,
-1.238062, -0.2376099, -0.9976351, 1, 0.6431373, 0, 1,
-1.222102, 0.04262087, -0.9007162, 1, 0.6470588, 0, 1,
-1.215487, -0.5825894, -1.415857, 1, 0.654902, 0, 1,
-1.214073, -0.8308328, -3.38905, 1, 0.6588235, 0, 1,
-1.201965, -0.2095404, -2.910355, 1, 0.6666667, 0, 1,
-1.19553, 1.008915, -0.03884843, 1, 0.6705883, 0, 1,
-1.195347, 0.2537564, -0.2791285, 1, 0.6784314, 0, 1,
-1.193999, -1.320743, -0.6280215, 1, 0.682353, 0, 1,
-1.186702, -0.9796196, -0.08226822, 1, 0.6901961, 0, 1,
-1.184829, 0.9175084, -1.246109, 1, 0.6941177, 0, 1,
-1.181376, -0.3882753, -3.077146, 1, 0.7019608, 0, 1,
-1.176896, 0.8995887, -0.4698374, 1, 0.7098039, 0, 1,
-1.176586, -1.607009, -1.852677, 1, 0.7137255, 0, 1,
-1.175888, -0.138633, -1.333841, 1, 0.7215686, 0, 1,
-1.175441, -0.1894615, -1.519376, 1, 0.7254902, 0, 1,
-1.170387, 0.7785963, -1.254036, 1, 0.7333333, 0, 1,
-1.16165, -0.9313158, -2.401063, 1, 0.7372549, 0, 1,
-1.156846, 1.49137, -0.6806561, 1, 0.7450981, 0, 1,
-1.147692, -0.3255182, -3.724846, 1, 0.7490196, 0, 1,
-1.144214, 0.8559504, -2.433291, 1, 0.7568628, 0, 1,
-1.142326, 0.4617665, 0.270845, 1, 0.7607843, 0, 1,
-1.138414, -0.06864876, -1.751559, 1, 0.7686275, 0, 1,
-1.134856, -0.9786921, -3.374895, 1, 0.772549, 0, 1,
-1.130719, -1.606994, -2.186608, 1, 0.7803922, 0, 1,
-1.124789, -1.456824, -3.543472, 1, 0.7843137, 0, 1,
-1.103994, 0.2427666, -0.5300555, 1, 0.7921569, 0, 1,
-1.101697, -0.2703427, -1.970898, 1, 0.7960784, 0, 1,
-1.100898, 0.9779426, 1.690538, 1, 0.8039216, 0, 1,
-1.093019, -0.1418452, -3.234848, 1, 0.8117647, 0, 1,
-1.092839, -0.8920141, -1.641678, 1, 0.8156863, 0, 1,
-1.088831, -0.6051278, -2.829873, 1, 0.8235294, 0, 1,
-1.088021, 2.289906, 0.2062593, 1, 0.827451, 0, 1,
-1.082514, 0.528105, -1.479775, 1, 0.8352941, 0, 1,
-1.079715, -0.6705734, -2.380383, 1, 0.8392157, 0, 1,
-1.07847, 0.1937884, -0.5796722, 1, 0.8470588, 0, 1,
-1.077475, 1.063213, -0.5043356, 1, 0.8509804, 0, 1,
-1.077418, 1.777502, 0.05733538, 1, 0.8588235, 0, 1,
-1.063924, -0.08195619, -1.093755, 1, 0.8627451, 0, 1,
-1.063816, 1.428529, -1.536789, 1, 0.8705882, 0, 1,
-1.055813, 1.848086, -0.394749, 1, 0.8745098, 0, 1,
-1.054056, -0.5978868, -3.445158, 1, 0.8823529, 0, 1,
-1.042454, 0.2073974, -1.831643, 1, 0.8862745, 0, 1,
-1.036505, 0.4772956, -0.53456, 1, 0.8941177, 0, 1,
-1.03349, 0.8179073, -0.1009136, 1, 0.8980392, 0, 1,
-1.027647, -0.1001173, -0.4476546, 1, 0.9058824, 0, 1,
-1.023368, -0.8284889, -1.180312, 1, 0.9137255, 0, 1,
-1.022325, 1.545758, -0.6591977, 1, 0.9176471, 0, 1,
-1.0219, 1.10914, -1.40122, 1, 0.9254902, 0, 1,
-1.021062, -0.5550386, -0.3049864, 1, 0.9294118, 0, 1,
-1.01839, 0.1012544, -2.480484, 1, 0.9372549, 0, 1,
-1.017162, -1.65973, -2.086021, 1, 0.9411765, 0, 1,
-1.016084, -0.7111751, -3.299371, 1, 0.9490196, 0, 1,
-1.010389, 0.4911988, -0.6098496, 1, 0.9529412, 0, 1,
-1.009973, 1.907681, 0.8834423, 1, 0.9607843, 0, 1,
-1.007779, -1.700496, -4.026645, 1, 0.9647059, 0, 1,
-1.002264, 1.732852, -0.5877091, 1, 0.972549, 0, 1,
-0.9936152, 1.628591, -1.593503, 1, 0.9764706, 0, 1,
-0.9928749, -0.052166, -1.940674, 1, 0.9843137, 0, 1,
-0.9925503, 1.527943, 0.0302075, 1, 0.9882353, 0, 1,
-0.9844519, -0.2115417, -1.829637, 1, 0.9960784, 0, 1,
-0.98176, 0.4736762, -1.225649, 0.9960784, 1, 0, 1,
-0.9743763, -0.5487059, -1.625746, 0.9921569, 1, 0, 1,
-0.973175, 0.5729212, -0.7122641, 0.9843137, 1, 0, 1,
-0.9731129, 0.03144586, -1.067868, 0.9803922, 1, 0, 1,
-0.965496, -0.8885732, -2.181251, 0.972549, 1, 0, 1,
-0.960708, -0.1808939, 0.03604021, 0.9686275, 1, 0, 1,
-0.9595728, 0.85216, -1.353067, 0.9607843, 1, 0, 1,
-0.9576, -0.06596748, -1.117818, 0.9568627, 1, 0, 1,
-0.9542688, -1.137498, -2.964827, 0.9490196, 1, 0, 1,
-0.9536156, 1.222142, 1.414559, 0.945098, 1, 0, 1,
-0.9489193, 2.160191, 0.9134098, 0.9372549, 1, 0, 1,
-0.9474081, -1.96086, -3.819346, 0.9333333, 1, 0, 1,
-0.9456381, 0.244557, -1.255555, 0.9254902, 1, 0, 1,
-0.9406201, -0.1876664, -3.042927, 0.9215686, 1, 0, 1,
-0.9391043, 0.1197509, -1.281784, 0.9137255, 1, 0, 1,
-0.9349054, 0.980626, -1.392804, 0.9098039, 1, 0, 1,
-0.9344251, -0.9827868, -1.643601, 0.9019608, 1, 0, 1,
-0.931541, -0.8905454, -1.493718, 0.8941177, 1, 0, 1,
-0.9237694, -0.1397939, -3.440017, 0.8901961, 1, 0, 1,
-0.9185889, 2.299844, -0.8743779, 0.8823529, 1, 0, 1,
-0.9146172, 0.8633124, -1.988321, 0.8784314, 1, 0, 1,
-0.912989, -0.04470691, -2.31784, 0.8705882, 1, 0, 1,
-0.9093159, -0.1423373, -2.189353, 0.8666667, 1, 0, 1,
-0.9031667, 0.9868251, -1.928959, 0.8588235, 1, 0, 1,
-0.9016512, -1.691582, -3.277128, 0.854902, 1, 0, 1,
-0.8938788, 1.260959, -1.081962, 0.8470588, 1, 0, 1,
-0.892489, 0.4151036, -1.343412, 0.8431373, 1, 0, 1,
-0.8865359, 0.4572169, -2.07883, 0.8352941, 1, 0, 1,
-0.8835796, 0.2538853, -1.684888, 0.8313726, 1, 0, 1,
-0.8756378, -0.05885435, -1.096718, 0.8235294, 1, 0, 1,
-0.8735756, -0.6971323, -0.1768337, 0.8196079, 1, 0, 1,
-0.870215, 1.028414, -2.554878, 0.8117647, 1, 0, 1,
-0.8694972, -1.097103, -4.303524, 0.8078431, 1, 0, 1,
-0.8668249, 0.5296869, -1.318179, 0.8, 1, 0, 1,
-0.8633152, -2.300451, -1.434796, 0.7921569, 1, 0, 1,
-0.8618046, -1.032819, -4.672893, 0.7882353, 1, 0, 1,
-0.8539314, -1.87468, -4.322623, 0.7803922, 1, 0, 1,
-0.8504622, -1.173691, -2.081108, 0.7764706, 1, 0, 1,
-0.8492631, 0.7620319, -1.846778, 0.7686275, 1, 0, 1,
-0.8441278, -2.376352, -2.523382, 0.7647059, 1, 0, 1,
-0.8407012, -0.3350666, -1.915409, 0.7568628, 1, 0, 1,
-0.8380595, -0.5503415, -2.448282, 0.7529412, 1, 0, 1,
-0.8343505, 1.051496, 0.4638643, 0.7450981, 1, 0, 1,
-0.8302065, -1.985506, -0.6627775, 0.7411765, 1, 0, 1,
-0.8288806, 0.9587587, 0.0331175, 0.7333333, 1, 0, 1,
-0.8266459, -0.8691086, -2.055425, 0.7294118, 1, 0, 1,
-0.8253528, -0.1882486, -1.218077, 0.7215686, 1, 0, 1,
-0.814781, 1.119321, -0.3071155, 0.7176471, 1, 0, 1,
-0.8144085, 2.606273, 0.4034571, 0.7098039, 1, 0, 1,
-0.8130875, -0.5867754, -1.594361, 0.7058824, 1, 0, 1,
-0.8006754, -2.146639, -3.431736, 0.6980392, 1, 0, 1,
-0.7971166, 0.5844335, -0.1173714, 0.6901961, 1, 0, 1,
-0.7969398, 1.00329, 0.1952715, 0.6862745, 1, 0, 1,
-0.7937916, 0.9444741, -0.5824009, 0.6784314, 1, 0, 1,
-0.7904153, 1.05861, -1.455306, 0.6745098, 1, 0, 1,
-0.7894648, -1.562373, -4.386563, 0.6666667, 1, 0, 1,
-0.7890875, -0.8613467, -3.954979, 0.6627451, 1, 0, 1,
-0.784965, -0.07024143, -1.960129, 0.654902, 1, 0, 1,
-0.784734, 0.9742507, 0.2727982, 0.6509804, 1, 0, 1,
-0.7697325, 1.835378, 0.1341128, 0.6431373, 1, 0, 1,
-0.7684122, 0.4717148, -1.617829, 0.6392157, 1, 0, 1,
-0.7635262, 1.37185, -1.85254, 0.6313726, 1, 0, 1,
-0.7633988, -0.8743715, -1.976162, 0.627451, 1, 0, 1,
-0.7628804, -1.616042, -3.919202, 0.6196079, 1, 0, 1,
-0.7605315, 0.642616, 0.05970877, 0.6156863, 1, 0, 1,
-0.7594293, -0.150936, -1.724697, 0.6078432, 1, 0, 1,
-0.7573484, -0.2514139, -1.342535, 0.6039216, 1, 0, 1,
-0.7511773, -0.4741763, -3.793777, 0.5960785, 1, 0, 1,
-0.746401, -0.7564948, -2.655717, 0.5882353, 1, 0, 1,
-0.7412177, 1.201184, 1.194676, 0.5843138, 1, 0, 1,
-0.7366396, 0.9484144, -1.488895, 0.5764706, 1, 0, 1,
-0.732448, 0.60516, -0.6364043, 0.572549, 1, 0, 1,
-0.7296069, 1.028698, -0.5841947, 0.5647059, 1, 0, 1,
-0.7227039, -0.09006555, -0.03320454, 0.5607843, 1, 0, 1,
-0.7216222, -0.595553, -0.9545008, 0.5529412, 1, 0, 1,
-0.7150466, -0.6047447, -1.788951, 0.5490196, 1, 0, 1,
-0.7139915, -0.9058895, -2.251034, 0.5411765, 1, 0, 1,
-0.7127371, -2.122321, -1.202826, 0.5372549, 1, 0, 1,
-0.710234, -0.0330787, -1.17179, 0.5294118, 1, 0, 1,
-0.7004946, -0.4002248, -2.562034, 0.5254902, 1, 0, 1,
-0.6986752, -0.886903, -2.474144, 0.5176471, 1, 0, 1,
-0.6924557, -0.5399921, -2.089726, 0.5137255, 1, 0, 1,
-0.6875318, 0.143715, -2.331556, 0.5058824, 1, 0, 1,
-0.6850657, 1.522239, -0.2792943, 0.5019608, 1, 0, 1,
-0.6829128, 0.6154225, 1.028537, 0.4941176, 1, 0, 1,
-0.6786149, 0.5618963, -1.50189, 0.4862745, 1, 0, 1,
-0.678432, -1.462902, -3.477216, 0.4823529, 1, 0, 1,
-0.6781043, 0.5154214, -0.532501, 0.4745098, 1, 0, 1,
-0.6757707, 0.9069834, 0.2881683, 0.4705882, 1, 0, 1,
-0.6750767, -1.797746, -2.938095, 0.4627451, 1, 0, 1,
-0.6713277, -0.4567793, -3.006224, 0.4588235, 1, 0, 1,
-0.6677067, 1.57583, -1.00916, 0.4509804, 1, 0, 1,
-0.6534673, 1.162897, 0.1635505, 0.4470588, 1, 0, 1,
-0.6531329, 0.2598374, -0.1066693, 0.4392157, 1, 0, 1,
-0.6381536, -1.458278, -3.804536, 0.4352941, 1, 0, 1,
-0.6359309, 0.2944359, -1.271272, 0.427451, 1, 0, 1,
-0.6304286, 0.6669762, -2.526212, 0.4235294, 1, 0, 1,
-0.6301433, -0.01870344, 0.7376686, 0.4156863, 1, 0, 1,
-0.6298857, 2.527449, -0.6372951, 0.4117647, 1, 0, 1,
-0.6297325, -0.2867289, -1.511281, 0.4039216, 1, 0, 1,
-0.6225312, -1.339169, -3.361512, 0.3960784, 1, 0, 1,
-0.6220927, 1.517219, 0.1362859, 0.3921569, 1, 0, 1,
-0.6171755, 0.1895691, -0.9412493, 0.3843137, 1, 0, 1,
-0.6164621, 0.03714005, -1.789232, 0.3803922, 1, 0, 1,
-0.6075781, -0.6178026, -1.495653, 0.372549, 1, 0, 1,
-0.5997806, -0.1742357, -0.9464154, 0.3686275, 1, 0, 1,
-0.5971611, 0.04943861, -1.957342, 0.3607843, 1, 0, 1,
-0.5961776, -1.242631, -3.258629, 0.3568628, 1, 0, 1,
-0.5941874, -0.2772953, -2.481065, 0.3490196, 1, 0, 1,
-0.5941817, -0.565621, -2.171302, 0.345098, 1, 0, 1,
-0.5931678, 1.848347, -0.1031117, 0.3372549, 1, 0, 1,
-0.5851524, 1.425329, -1.210512, 0.3333333, 1, 0, 1,
-0.5843042, -0.6955316, -1.795185, 0.3254902, 1, 0, 1,
-0.5828162, 0.2756868, -1.220532, 0.3215686, 1, 0, 1,
-0.5796173, 0.6735612, -2.114551, 0.3137255, 1, 0, 1,
-0.5787914, 0.9459975, 0.8113435, 0.3098039, 1, 0, 1,
-0.5785742, -1.554317, -2.527275, 0.3019608, 1, 0, 1,
-0.5760915, -1.931649, -1.809844, 0.2941177, 1, 0, 1,
-0.5683315, 1.432744, 0.06591958, 0.2901961, 1, 0, 1,
-0.5658239, 1.018989, -0.5602554, 0.282353, 1, 0, 1,
-0.5651196, -0.5611996, -2.18539, 0.2784314, 1, 0, 1,
-0.5630071, 1.230928, -1.191741, 0.2705882, 1, 0, 1,
-0.5613564, 0.4601797, 0.2717809, 0.2666667, 1, 0, 1,
-0.5605336, 0.8047676, -1.383807, 0.2588235, 1, 0, 1,
-0.5595346, 0.1526198, -1.031812, 0.254902, 1, 0, 1,
-0.5558807, 0.1795453, -0.1366747, 0.2470588, 1, 0, 1,
-0.5527498, -0.6803672, -1.994363, 0.2431373, 1, 0, 1,
-0.5498142, -0.6054313, -3.127893, 0.2352941, 1, 0, 1,
-0.548105, -0.9727646, -2.55972, 0.2313726, 1, 0, 1,
-0.5465827, 0.2473443, -2.245158, 0.2235294, 1, 0, 1,
-0.5436845, -0.03375638, -2.196696, 0.2196078, 1, 0, 1,
-0.543386, -0.1925507, -0.8807245, 0.2117647, 1, 0, 1,
-0.5422323, -0.6950473, -5.947036, 0.2078431, 1, 0, 1,
-0.5371417, 0.4410747, -1.842405, 0.2, 1, 0, 1,
-0.5369573, -0.9552111, -4.640316, 0.1921569, 1, 0, 1,
-0.5352912, 0.4073548, 0.5355783, 0.1882353, 1, 0, 1,
-0.5290655, 0.3343497, -0.01505996, 0.1803922, 1, 0, 1,
-0.52663, 0.7339031, -0.9532784, 0.1764706, 1, 0, 1,
-0.5204029, -1.168622, -2.71638, 0.1686275, 1, 0, 1,
-0.5196611, 1.430734, 0.2861187, 0.1647059, 1, 0, 1,
-0.519289, -0.6827571, -3.963755, 0.1568628, 1, 0, 1,
-0.5191228, -0.8486292, -2.974944, 0.1529412, 1, 0, 1,
-0.5187446, -0.1395811, -1.700977, 0.145098, 1, 0, 1,
-0.5160841, -0.5692107, -2.592949, 0.1411765, 1, 0, 1,
-0.5072103, 0.2435998, -0.4085183, 0.1333333, 1, 0, 1,
-0.5070058, -0.2194487, -2.381007, 0.1294118, 1, 0, 1,
-0.5061911, -0.4580093, -2.262391, 0.1215686, 1, 0, 1,
-0.4996554, 0.8715512, -1.924361, 0.1176471, 1, 0, 1,
-0.4982169, 0.7455612, -0.6793879, 0.1098039, 1, 0, 1,
-0.4972582, 0.2620012, -0.9814364, 0.1058824, 1, 0, 1,
-0.4965973, 1.137962, 0.766265, 0.09803922, 1, 0, 1,
-0.4890115, -1.065143, -2.029029, 0.09019608, 1, 0, 1,
-0.482676, -0.005429922, -2.83616, 0.08627451, 1, 0, 1,
-0.4796254, 1.729836, 0.5611473, 0.07843138, 1, 0, 1,
-0.4757438, -1.900443, -2.915997, 0.07450981, 1, 0, 1,
-0.4746372, 0.6252441, -1.738268, 0.06666667, 1, 0, 1,
-0.4733406, 1.239857, 0.1555265, 0.0627451, 1, 0, 1,
-0.4708607, -1.264523, -2.374437, 0.05490196, 1, 0, 1,
-0.4647343, 1.673302, 1.803275, 0.05098039, 1, 0, 1,
-0.4643549, 0.5326173, -1.190125, 0.04313726, 1, 0, 1,
-0.4580642, 0.08715515, -1.524172, 0.03921569, 1, 0, 1,
-0.4537249, 1.157455, 1.124733, 0.03137255, 1, 0, 1,
-0.4524695, -0.5776122, -1.626104, 0.02745098, 1, 0, 1,
-0.451372, 0.6717185, 0.3656605, 0.01960784, 1, 0, 1,
-0.445002, 0.1158746, -2.49545, 0.01568628, 1, 0, 1,
-0.443157, 0.217621, -1.399607, 0.007843138, 1, 0, 1,
-0.4418259, -0.3094426, -2.881542, 0.003921569, 1, 0, 1,
-0.4391458, -0.3346535, -2.2095, 0, 1, 0.003921569, 1,
-0.4379846, -0.5605873, -3.220103, 0, 1, 0.01176471, 1,
-0.4351195, -0.2425566, -1.904477, 0, 1, 0.01568628, 1,
-0.4340286, -0.3367101, -2.775982, 0, 1, 0.02352941, 1,
-0.4322502, -0.89205, -3.130939, 0, 1, 0.02745098, 1,
-0.4308203, -1.179875, -2.613791, 0, 1, 0.03529412, 1,
-0.4297493, -0.555954, -2.609046, 0, 1, 0.03921569, 1,
-0.4286774, -0.246125, -2.505743, 0, 1, 0.04705882, 1,
-0.4286234, 0.3985294, -0.1386691, 0, 1, 0.05098039, 1,
-0.4271601, -1.027578, -2.982458, 0, 1, 0.05882353, 1,
-0.4263924, 1.528378, 1.304276, 0, 1, 0.0627451, 1,
-0.4241909, 0.8177661, -1.304655, 0, 1, 0.07058824, 1,
-0.4226098, 0.7290038, -0.6368705, 0, 1, 0.07450981, 1,
-0.4219137, 1.401677, -0.6641278, 0, 1, 0.08235294, 1,
-0.4163511, -0.1019541, -2.291119, 0, 1, 0.08627451, 1,
-0.4156801, 0.5707626, -0.8115631, 0, 1, 0.09411765, 1,
-0.4085863, 0.9774018, -0.2067982, 0, 1, 0.1019608, 1,
-0.4062543, 1.305457, 0.9075665, 0, 1, 0.1058824, 1,
-0.4021174, -2.036124, -1.668024, 0, 1, 0.1137255, 1,
-0.4008712, 0.4188023, -1.331492, 0, 1, 0.1176471, 1,
-0.3947021, 0.228563, -0.7250026, 0, 1, 0.1254902, 1,
-0.392751, 1.307855, -0.6859888, 0, 1, 0.1294118, 1,
-0.3892256, 0.03750522, -3.174505, 0, 1, 0.1372549, 1,
-0.3859496, 0.6040987, 0.4256008, 0, 1, 0.1411765, 1,
-0.3833077, -0.7089515, -2.922314, 0, 1, 0.1490196, 1,
-0.3817453, 0.0595419, -1.186604, 0, 1, 0.1529412, 1,
-0.3735924, -0.05322996, -1.358794, 0, 1, 0.1607843, 1,
-0.3730373, 1.031406, 0.7944531, 0, 1, 0.1647059, 1,
-0.3629481, -1.671366, -3.211325, 0, 1, 0.172549, 1,
-0.3504073, -0.296185, -1.839284, 0, 1, 0.1764706, 1,
-0.3495073, -1.811696, -2.391909, 0, 1, 0.1843137, 1,
-0.3463957, -0.1518538, -3.171124, 0, 1, 0.1882353, 1,
-0.3455333, -0.09793179, -1.63046, 0, 1, 0.1960784, 1,
-0.3454221, -1.908202, -3.585487, 0, 1, 0.2039216, 1,
-0.3452793, -0.7821962, -4.69459, 0, 1, 0.2078431, 1,
-0.3429666, -0.9516409, -5.964308, 0, 1, 0.2156863, 1,
-0.340133, -0.3776446, -2.560871, 0, 1, 0.2196078, 1,
-0.3380347, 0.9907557, -2.393471, 0, 1, 0.227451, 1,
-0.3361229, -0.7121353, -0.423573, 0, 1, 0.2313726, 1,
-0.3359941, -0.9605493, -3.49736, 0, 1, 0.2392157, 1,
-0.3358352, 0.4035487, -0.6354622, 0, 1, 0.2431373, 1,
-0.3355214, 0.8944361, -1.300883, 0, 1, 0.2509804, 1,
-0.3344073, -0.07160772, -0.2935453, 0, 1, 0.254902, 1,
-0.3307058, 1.177808, -1.374553, 0, 1, 0.2627451, 1,
-0.3232327, 0.5812069, -1.471747, 0, 1, 0.2666667, 1,
-0.3209668, -1.261933, -3.693764, 0, 1, 0.2745098, 1,
-0.3193853, -0.126324, -1.271799, 0, 1, 0.2784314, 1,
-0.3187926, -0.4227176, -2.763063, 0, 1, 0.2862745, 1,
-0.317902, 0.3969138, -3.050117, 0, 1, 0.2901961, 1,
-0.3143072, -1.051343, -2.027799, 0, 1, 0.2980392, 1,
-0.3114154, 0.7734923, -1.203707, 0, 1, 0.3058824, 1,
-0.3103531, 0.1759773, -0.1102766, 0, 1, 0.3098039, 1,
-0.3102387, 0.8837351, 0.3404329, 0, 1, 0.3176471, 1,
-0.3060763, -2.127298, -1.916684, 0, 1, 0.3215686, 1,
-0.3046945, 0.1600172, 0.167385, 0, 1, 0.3294118, 1,
-0.3045756, -0.5356433, -3.389627, 0, 1, 0.3333333, 1,
-0.3032747, 1.824225, 0.8345586, 0, 1, 0.3411765, 1,
-0.2890061, 1.197555, 0.06970538, 0, 1, 0.345098, 1,
-0.2863706, -0.5393032, -4.520897, 0, 1, 0.3529412, 1,
-0.285473, 0.4058792, 0.2234941, 0, 1, 0.3568628, 1,
-0.2819778, 0.5457824, -0.9114855, 0, 1, 0.3647059, 1,
-0.280972, 0.9660918, -0.2598573, 0, 1, 0.3686275, 1,
-0.2779761, -0.7641489, -4.978893, 0, 1, 0.3764706, 1,
-0.277233, 0.03070447, -1.799782, 0, 1, 0.3803922, 1,
-0.2758413, 1.36973, 1.863183, 0, 1, 0.3882353, 1,
-0.2735947, -0.5939765, -2.397347, 0, 1, 0.3921569, 1,
-0.2685747, -0.1300529, -1.418083, 0, 1, 0.4, 1,
-0.267946, -0.676127, -2.596884, 0, 1, 0.4078431, 1,
-0.2655607, -0.5987598, -2.966279, 0, 1, 0.4117647, 1,
-0.2634638, 0.7554482, -0.3292398, 0, 1, 0.4196078, 1,
-0.2613617, 0.9130326, -0.5606765, 0, 1, 0.4235294, 1,
-0.2535081, -1.691524, -3.20171, 0, 1, 0.4313726, 1,
-0.2525178, 0.3178723, -0.04008503, 0, 1, 0.4352941, 1,
-0.2478944, 0.1223648, -2.212943, 0, 1, 0.4431373, 1,
-0.2468295, -0.2215297, -3.254029, 0, 1, 0.4470588, 1,
-0.2447568, -0.9956548, -4.574699, 0, 1, 0.454902, 1,
-0.2432625, 0.3131351, -0.9284932, 0, 1, 0.4588235, 1,
-0.2422622, 1.371637, -1.240003, 0, 1, 0.4666667, 1,
-0.2373191, 0.7447935, -0.7753092, 0, 1, 0.4705882, 1,
-0.2358664, -0.06751436, -2.93731, 0, 1, 0.4784314, 1,
-0.2326968, -1.361678, -3.408772, 0, 1, 0.4823529, 1,
-0.2325018, -0.5332922, -2.263463, 0, 1, 0.4901961, 1,
-0.2266293, -0.1035401, -1.262193, 0, 1, 0.4941176, 1,
-0.2265543, -0.8500091, -4.20609, 0, 1, 0.5019608, 1,
-0.2256865, 1.565094, 0.004457536, 0, 1, 0.509804, 1,
-0.225085, -0.1399509, -2.074777, 0, 1, 0.5137255, 1,
-0.2246055, -1.198086, -1.370477, 0, 1, 0.5215687, 1,
-0.2239218, 1.384553, -1.222251, 0, 1, 0.5254902, 1,
-0.2219029, 0.502548, -0.5369838, 0, 1, 0.5333334, 1,
-0.2140043, 0.962744, -0.6962932, 0, 1, 0.5372549, 1,
-0.2131092, 1.695976, 0.2767023, 0, 1, 0.5450981, 1,
-0.2091416, -0.5865359, -3.373356, 0, 1, 0.5490196, 1,
-0.2079295, -1.242033, -2.394661, 0, 1, 0.5568628, 1,
-0.1993679, 0.4135644, 0.2929029, 0, 1, 0.5607843, 1,
-0.1980191, -0.3695147, -0.9549202, 0, 1, 0.5686275, 1,
-0.196798, -1.394843, -5.12115, 0, 1, 0.572549, 1,
-0.1965883, 0.3727457, -1.125867, 0, 1, 0.5803922, 1,
-0.1954322, 1.612425, 1.553993, 0, 1, 0.5843138, 1,
-0.1950911, 2.12407, 0.9712601, 0, 1, 0.5921569, 1,
-0.1929426, 0.04037037, -1.692629, 0, 1, 0.5960785, 1,
-0.191589, -0.8002264, -5.035483, 0, 1, 0.6039216, 1,
-0.1909424, 0.6534947, -0.3623024, 0, 1, 0.6117647, 1,
-0.1906324, 0.9584976, 0.2225771, 0, 1, 0.6156863, 1,
-0.1903235, 0.2907797, -1.6234, 0, 1, 0.6235294, 1,
-0.1902023, -1.040609, -0.8571895, 0, 1, 0.627451, 1,
-0.1897215, 0.4527785, -2.627942, 0, 1, 0.6352941, 1,
-0.1883052, 2.480399, -0.2505766, 0, 1, 0.6392157, 1,
-0.1830413, 2.151054, 0.3722529, 0, 1, 0.6470588, 1,
-0.1768249, 1.055586, 2.12835, 0, 1, 0.6509804, 1,
-0.1652476, 0.2499611, -2.288134, 0, 1, 0.6588235, 1,
-0.1648523, 0.2245891, -0.3021144, 0, 1, 0.6627451, 1,
-0.1644766, 0.5145086, -0.7644435, 0, 1, 0.6705883, 1,
-0.1644006, 0.3107468, -1.463599, 0, 1, 0.6745098, 1,
-0.1640673, 0.3893517, -0.7090293, 0, 1, 0.682353, 1,
-0.1614982, 0.9029266, -2.258051, 0, 1, 0.6862745, 1,
-0.1597387, 0.1538066, -1.066811, 0, 1, 0.6941177, 1,
-0.158326, 0.02152865, -1.592979, 0, 1, 0.7019608, 1,
-0.1554485, -0.474115, -2.353117, 0, 1, 0.7058824, 1,
-0.1534781, 0.3886288, -2.340451, 0, 1, 0.7137255, 1,
-0.1495854, 0.6492814, -0.2239856, 0, 1, 0.7176471, 1,
-0.1426139, 0.04552256, -1.544146, 0, 1, 0.7254902, 1,
-0.1425249, 1.855828, 1.187587, 0, 1, 0.7294118, 1,
-0.1411976, -0.2096741, -1.776621, 0, 1, 0.7372549, 1,
-0.1354471, 0.4988638, -0.5819358, 0, 1, 0.7411765, 1,
-0.1329277, 0.9071699, 0.1155265, 0, 1, 0.7490196, 1,
-0.127964, 0.7065841, 1.173712, 0, 1, 0.7529412, 1,
-0.1261079, -1.488423, -2.397731, 0, 1, 0.7607843, 1,
-0.1254763, -0.2387294, -1.79794, 0, 1, 0.7647059, 1,
-0.1249021, 0.3573257, -0.6086842, 0, 1, 0.772549, 1,
-0.1202151, -0.8392774, -4.916783, 0, 1, 0.7764706, 1,
-0.113808, 1.385184, -1.185206, 0, 1, 0.7843137, 1,
-0.1122507, 0.2843817, 0.3170966, 0, 1, 0.7882353, 1,
-0.1093334, 1.083413, -1.427029, 0, 1, 0.7960784, 1,
-0.1085353, -1.479015, -3.333662, 0, 1, 0.8039216, 1,
-0.1082031, 0.591623, -0.853587, 0, 1, 0.8078431, 1,
-0.1059932, 1.789571, 0.2652137, 0, 1, 0.8156863, 1,
-0.1041, -0.480789, -4.0997, 0, 1, 0.8196079, 1,
-0.104026, -1.303508, -3.737831, 0, 1, 0.827451, 1,
-0.09748744, -1.050995, -2.142699, 0, 1, 0.8313726, 1,
-0.09691629, 0.1886832, 0.790522, 0, 1, 0.8392157, 1,
-0.09617978, -0.3620422, -2.134936, 0, 1, 0.8431373, 1,
-0.09420791, 1.253504, 0.7043216, 0, 1, 0.8509804, 1,
-0.09326825, 0.6512107, -0.3985107, 0, 1, 0.854902, 1,
-0.09317608, 1.02511, 0.02292962, 0, 1, 0.8627451, 1,
-0.08849408, 0.4133714, -1.116725, 0, 1, 0.8666667, 1,
-0.08275701, -0.3119181, -0.8505546, 0, 1, 0.8745098, 1,
-0.08226766, -1.263895, -2.495025, 0, 1, 0.8784314, 1,
-0.08199016, -1.815303, -3.3506, 0, 1, 0.8862745, 1,
-0.08173203, 0.04021731, -0.671328, 0, 1, 0.8901961, 1,
-0.07985096, -0.07919516, -1.914236, 0, 1, 0.8980392, 1,
-0.0781962, 0.1114466, 0.08632079, 0, 1, 0.9058824, 1,
-0.077292, 0.459347, 0.1660643, 0, 1, 0.9098039, 1,
-0.07476119, 0.673799, -0.5237674, 0, 1, 0.9176471, 1,
-0.07407035, 0.1797944, -0.0807837, 0, 1, 0.9215686, 1,
-0.07393137, 1.035717, 0.5552613, 0, 1, 0.9294118, 1,
-0.06164145, -0.1583302, -4.129782, 0, 1, 0.9333333, 1,
-0.05901844, -0.5018119, -3.04353, 0, 1, 0.9411765, 1,
-0.05268075, -0.6721981, -3.88015, 0, 1, 0.945098, 1,
-0.05146217, -1.953744, -4.326255, 0, 1, 0.9529412, 1,
-0.04991404, -0.5121018, -2.732312, 0, 1, 0.9568627, 1,
-0.04751162, 0.2813315, -2.039058, 0, 1, 0.9647059, 1,
-0.03786386, 1.558346, 0.7481858, 0, 1, 0.9686275, 1,
-0.03484614, 0.9227358, -1.010683, 0, 1, 0.9764706, 1,
-0.03300297, -1.027017, -3.096976, 0, 1, 0.9803922, 1,
-0.02825833, -0.05159728, -1.651961, 0, 1, 0.9882353, 1,
-0.02471072, 1.047994, 0.9099643, 0, 1, 0.9921569, 1,
-0.02289721, -0.02379538, -3.198726, 0, 1, 1, 1,
-0.02288943, 0.636951, -0.9426445, 0, 0.9921569, 1, 1,
-0.0193354, -1.078189, -4.638541, 0, 0.9882353, 1, 1,
-0.01769736, 1.210639, -0.1754259, 0, 0.9803922, 1, 1,
-0.01161295, 1.185593, -0.8272591, 0, 0.9764706, 1, 1,
-0.01025768, -0.5092532, -1.689834, 0, 0.9686275, 1, 1,
-0.004345797, -0.945492, -3.505482, 0, 0.9647059, 1, 1,
-0.001043734, -0.03324734, -2.323791, 0, 0.9568627, 1, 1,
-0.0002213194, 1.215937, 0.1580994, 0, 0.9529412, 1, 1,
0.01526831, 0.7540426, 0.09555306, 0, 0.945098, 1, 1,
0.01566001, -0.8713078, 4.718494, 0, 0.9411765, 1, 1,
0.01774263, -1.548478, 1.946519, 0, 0.9333333, 1, 1,
0.01800182, -1.248141, 2.532133, 0, 0.9294118, 1, 1,
0.01849207, 0.2771548, -1.12359, 0, 0.9215686, 1, 1,
0.01932851, -0.3871059, 2.209752, 0, 0.9176471, 1, 1,
0.0204941, -1.360193, 1.315687, 0, 0.9098039, 1, 1,
0.02268219, -1.560961, 2.655783, 0, 0.9058824, 1, 1,
0.02393722, 0.3959378, 1.187205, 0, 0.8980392, 1, 1,
0.02673784, -0.2169311, 3.888603, 0, 0.8901961, 1, 1,
0.02805215, 0.1947181, 1.469637, 0, 0.8862745, 1, 1,
0.02910196, -0.5408145, 1.25129, 0, 0.8784314, 1, 1,
0.03147604, -0.3603947, 2.234622, 0, 0.8745098, 1, 1,
0.0333225, -0.212013, 2.223105, 0, 0.8666667, 1, 1,
0.0394861, -0.3098266, 2.951079, 0, 0.8627451, 1, 1,
0.04453653, 0.7041309, 1.160977, 0, 0.854902, 1, 1,
0.04552769, 0.5967541, 0.4649468, 0, 0.8509804, 1, 1,
0.046576, 1.291764, 0.5518975, 0, 0.8431373, 1, 1,
0.05024779, -1.31197, 2.933143, 0, 0.8392157, 1, 1,
0.05680954, 0.04879238, 0.6280064, 0, 0.8313726, 1, 1,
0.06126998, -0.2409694, 3.108292, 0, 0.827451, 1, 1,
0.0619458, -0.684799, 2.96404, 0, 0.8196079, 1, 1,
0.06351322, 2.202215, 0.3074218, 0, 0.8156863, 1, 1,
0.06979864, -0.3708749, 4.696017, 0, 0.8078431, 1, 1,
0.07135355, 0.0006648098, 0.07744652, 0, 0.8039216, 1, 1,
0.07222419, -0.290698, 1.538613, 0, 0.7960784, 1, 1,
0.07461293, -1.054397, 2.597524, 0, 0.7882353, 1, 1,
0.07520866, 2.032455, -1.242519, 0, 0.7843137, 1, 1,
0.07692404, -0.5845636, 3.066068, 0, 0.7764706, 1, 1,
0.08330742, 1.329364, -1.829668, 0, 0.772549, 1, 1,
0.08369286, -0.2993776, 1.298465, 0, 0.7647059, 1, 1,
0.08462842, 0.3543301, -0.09353226, 0, 0.7607843, 1, 1,
0.08581425, 1.047358, -0.472652, 0, 0.7529412, 1, 1,
0.0878277, 0.5748264, 1.328388, 0, 0.7490196, 1, 1,
0.08913504, 0.2631025, -1.030865, 0, 0.7411765, 1, 1,
0.09024809, 0.3613504, 0.1722713, 0, 0.7372549, 1, 1,
0.09049361, -0.9822099, 3.401624, 0, 0.7294118, 1, 1,
0.0905456, -1.175184, 4.601106, 0, 0.7254902, 1, 1,
0.09239483, 0.6851662, -0.410208, 0, 0.7176471, 1, 1,
0.09515019, 0.8099009, 0.2198798, 0, 0.7137255, 1, 1,
0.09602438, -0.08693529, 1.413667, 0, 0.7058824, 1, 1,
0.1002942, -0.1109775, 2.518476, 0, 0.6980392, 1, 1,
0.1015636, 2.128292, 0.57353, 0, 0.6941177, 1, 1,
0.1027323, 0.2227488, 1.257333, 0, 0.6862745, 1, 1,
0.1030593, -0.1034374, 1.7528, 0, 0.682353, 1, 1,
0.1063319, 1.565687, -0.2130266, 0, 0.6745098, 1, 1,
0.1106283, -2.102426, 2.949494, 0, 0.6705883, 1, 1,
0.1107766, 0.5509088, 2.165224, 0, 0.6627451, 1, 1,
0.1135401, 0.458761, -0.7347651, 0, 0.6588235, 1, 1,
0.1184366, 0.4182698, 0.5249378, 0, 0.6509804, 1, 1,
0.1200671, 0.121323, 0.4956469, 0, 0.6470588, 1, 1,
0.1209848, 0.7871736, 0.1127168, 0, 0.6392157, 1, 1,
0.1259284, -0.9853826, 0.4694872, 0, 0.6352941, 1, 1,
0.1297562, 0.647626, 1.447934, 0, 0.627451, 1, 1,
0.133904, 0.8049445, -0.7402837, 0, 0.6235294, 1, 1,
0.1345525, -0.5446843, 1.906652, 0, 0.6156863, 1, 1,
0.1348848, -0.4594208, 2.151604, 0, 0.6117647, 1, 1,
0.137272, -1.605385, 3.388437, 0, 0.6039216, 1, 1,
0.1394157, 0.01735878, 0.2572059, 0, 0.5960785, 1, 1,
0.1442673, -0.9207125, 3.891943, 0, 0.5921569, 1, 1,
0.1472908, -1.025775, 4.318191, 0, 0.5843138, 1, 1,
0.148613, 1.893888, 0.8505015, 0, 0.5803922, 1, 1,
0.1486832, 0.3427549, -0.767445, 0, 0.572549, 1, 1,
0.1502446, 0.1821144, -0.3000183, 0, 0.5686275, 1, 1,
0.1525054, 0.05031898, 2.492319, 0, 0.5607843, 1, 1,
0.1542656, 0.8396724, 0.5087581, 0, 0.5568628, 1, 1,
0.1551522, -1.043031, 4.268834, 0, 0.5490196, 1, 1,
0.156664, -2.318934, 2.444211, 0, 0.5450981, 1, 1,
0.1578968, 1.062645, -0.3751349, 0, 0.5372549, 1, 1,
0.1591976, 0.6053964, 0.5181711, 0, 0.5333334, 1, 1,
0.1605211, -0.001670295, 0.6707167, 0, 0.5254902, 1, 1,
0.1624295, -0.9803007, 4.296392, 0, 0.5215687, 1, 1,
0.1634529, -0.1543585, 2.528157, 0, 0.5137255, 1, 1,
0.1656814, 1.816385, 0.6185632, 0, 0.509804, 1, 1,
0.1667493, 1.174623, 1.413497, 0, 0.5019608, 1, 1,
0.1673555, -1.447594, 2.705493, 0, 0.4941176, 1, 1,
0.16786, 0.9735725, -1.009072, 0, 0.4901961, 1, 1,
0.1705736, 0.7511029, -3.333487, 0, 0.4823529, 1, 1,
0.1749975, -1.190745, 3.478522, 0, 0.4784314, 1, 1,
0.1780002, -0.0613348, 1.403407, 0, 0.4705882, 1, 1,
0.1833232, -0.5657772, 3.160998, 0, 0.4666667, 1, 1,
0.1847802, 1.412257, -0.9654991, 0, 0.4588235, 1, 1,
0.18796, 0.1397931, 1.580692, 0, 0.454902, 1, 1,
0.1928588, -0.08083814, 0.7263039, 0, 0.4470588, 1, 1,
0.1936404, 0.7308785, 1.301474, 0, 0.4431373, 1, 1,
0.2002895, -0.009516461, 1.534119, 0, 0.4352941, 1, 1,
0.202908, 1.142644, 1.54318, 0, 0.4313726, 1, 1,
0.2048354, 0.5676042, -1.186064, 0, 0.4235294, 1, 1,
0.2064842, 0.3679141, 0.2443396, 0, 0.4196078, 1, 1,
0.208218, 2.127708, 2.558602, 0, 0.4117647, 1, 1,
0.2090846, -0.6129165, 1.581633, 0, 0.4078431, 1, 1,
0.2167083, -1.221688, 5.113964, 0, 0.4, 1, 1,
0.2168331, 1.72763, 0.6457347, 0, 0.3921569, 1, 1,
0.2174529, 0.6307166, -0.3630549, 0, 0.3882353, 1, 1,
0.2189611, -1.364809, 1.556427, 0, 0.3803922, 1, 1,
0.2257296, 1.635412, 0.06803513, 0, 0.3764706, 1, 1,
0.2284064, -1.096205, 0.591491, 0, 0.3686275, 1, 1,
0.2292166, -0.0252838, 2.263191, 0, 0.3647059, 1, 1,
0.2294227, -0.004616775, 2.316489, 0, 0.3568628, 1, 1,
0.2296839, 0.171781, 2.67656, 0, 0.3529412, 1, 1,
0.2357329, -1.876905, 1.788567, 0, 0.345098, 1, 1,
0.2362529, -2.427951, 3.618568, 0, 0.3411765, 1, 1,
0.2407913, -0.6025426, 2.623317, 0, 0.3333333, 1, 1,
0.2414822, 0.850332, -1.467669, 0, 0.3294118, 1, 1,
0.2418757, 1.058133, 0.847838, 0, 0.3215686, 1, 1,
0.2478691, 2.197515, -0.7313555, 0, 0.3176471, 1, 1,
0.2509904, 0.9124986, 0.4105166, 0, 0.3098039, 1, 1,
0.2561818, -0.1735649, 1.501977, 0, 0.3058824, 1, 1,
0.2584536, -0.5825242, 1.824101, 0, 0.2980392, 1, 1,
0.2598926, -0.4417292, 3.337941, 0, 0.2901961, 1, 1,
0.2627532, 1.416271, 0.3590074, 0, 0.2862745, 1, 1,
0.2634429, 0.6860189, 0.2052551, 0, 0.2784314, 1, 1,
0.2691594, -0.1583217, 1.79243, 0, 0.2745098, 1, 1,
0.2763773, -2.16528, 1.510926, 0, 0.2666667, 1, 1,
0.2932897, 0.8590672, -0.0582707, 0, 0.2627451, 1, 1,
0.2951535, -0.9379025, 3.154096, 0, 0.254902, 1, 1,
0.2956385, 0.2835673, 1.065855, 0, 0.2509804, 1, 1,
0.2962032, 2.960598, 0.2925703, 0, 0.2431373, 1, 1,
0.2991409, -0.06989539, 2.123201, 0, 0.2392157, 1, 1,
0.2993188, 0.3098593, 1.264363, 0, 0.2313726, 1, 1,
0.3016307, 0.02846387, 1.685795, 0, 0.227451, 1, 1,
0.3022, -1.484931, 2.043093, 0, 0.2196078, 1, 1,
0.3022912, 0.706292, 0.8767998, 0, 0.2156863, 1, 1,
0.3068417, 0.4887336, -0.1712818, 0, 0.2078431, 1, 1,
0.3097169, -0.4597686, 2.506014, 0, 0.2039216, 1, 1,
0.3168136, -0.2303812, 1.714862, 0, 0.1960784, 1, 1,
0.3183052, 0.4487209, -1.445111, 0, 0.1882353, 1, 1,
0.3214937, -0.9902696, 1.902372, 0, 0.1843137, 1, 1,
0.3223839, -0.7293618, 3.760769, 0, 0.1764706, 1, 1,
0.3249347, -1.07325, 2.970758, 0, 0.172549, 1, 1,
0.3255911, -1.302195, 4.153067, 0, 0.1647059, 1, 1,
0.3271864, 1.068145, 0.8772002, 0, 0.1607843, 1, 1,
0.3286096, -0.09373488, 1.335239, 0, 0.1529412, 1, 1,
0.3295471, -0.7383103, 0.9270044, 0, 0.1490196, 1, 1,
0.3329659, 0.386073, 1.983143, 0, 0.1411765, 1, 1,
0.3353048, 1.71454, -1.617528, 0, 0.1372549, 1, 1,
0.3373775, -1.177122, 3.195267, 0, 0.1294118, 1, 1,
0.3425689, 0.578692, 1.115726, 0, 0.1254902, 1, 1,
0.34446, -1.309651, 1.680715, 0, 0.1176471, 1, 1,
0.3453796, -0.7826235, 3.096569, 0, 0.1137255, 1, 1,
0.3469059, -0.4071828, 3.96061, 0, 0.1058824, 1, 1,
0.3485164, 1.514319, 1.345718, 0, 0.09803922, 1, 1,
0.348887, 0.2184848, 3.055808, 0, 0.09411765, 1, 1,
0.3492391, -0.73749, 5.053323, 0, 0.08627451, 1, 1,
0.3559235, -0.9105071, 3.17859, 0, 0.08235294, 1, 1,
0.3599727, 0.6756238, 0.8747822, 0, 0.07450981, 1, 1,
0.3647508, -2.541779, 2.611103, 0, 0.07058824, 1, 1,
0.364931, -0.3642576, 2.37238, 0, 0.0627451, 1, 1,
0.3665888, -0.4980198, 0.6904213, 0, 0.05882353, 1, 1,
0.3712808, 1.028275, 1.863886, 0, 0.05098039, 1, 1,
0.371368, -0.7332419, 3.791015, 0, 0.04705882, 1, 1,
0.371456, 0.1572794, 0.8692806, 0, 0.03921569, 1, 1,
0.3725323, 0.2540953, -0.8046043, 0, 0.03529412, 1, 1,
0.3756341, 1.129482, 0.5536817, 0, 0.02745098, 1, 1,
0.3778212, -0.6176895, 1.341201, 0, 0.02352941, 1, 1,
0.3794617, -0.6961129, 3.578801, 0, 0.01568628, 1, 1,
0.3881354, 0.3395638, -1.335247, 0, 0.01176471, 1, 1,
0.3881825, -1.000072, 2.955634, 0, 0.003921569, 1, 1,
0.3978725, -0.7819049, 0.7203231, 0.003921569, 0, 1, 1,
0.3981395, 0.4736576, -0.3489192, 0.007843138, 0, 1, 1,
0.4003398, -0.4699475, 3.339975, 0.01568628, 0, 1, 1,
0.4031201, -0.00190197, 2.066214, 0.01960784, 0, 1, 1,
0.4065395, -0.308417, 3.688652, 0.02745098, 0, 1, 1,
0.4075283, 1.596753, 0.5337039, 0.03137255, 0, 1, 1,
0.4100235, 0.3842581, 1.197045, 0.03921569, 0, 1, 1,
0.4106799, 1.535566, -1.604978, 0.04313726, 0, 1, 1,
0.410732, 0.0532227, 0.4407658, 0.05098039, 0, 1, 1,
0.410832, 1.293511, -1.727005, 0.05490196, 0, 1, 1,
0.4116976, -0.1026793, 2.208075, 0.0627451, 0, 1, 1,
0.4121412, 0.4941305, -0.02611604, 0.06666667, 0, 1, 1,
0.4129527, -0.7574088, 3.164715, 0.07450981, 0, 1, 1,
0.41538, -1.778361, 0.3918946, 0.07843138, 0, 1, 1,
0.4164622, -1.716138, 3.724262, 0.08627451, 0, 1, 1,
0.4226741, 1.047241, 0.7609855, 0.09019608, 0, 1, 1,
0.4288478, -0.4160489, 1.629779, 0.09803922, 0, 1, 1,
0.4294272, -0.7697434, 1.885535, 0.1058824, 0, 1, 1,
0.4360844, 0.1870046, 2.062347, 0.1098039, 0, 1, 1,
0.436302, 1.267749, 0.2333164, 0.1176471, 0, 1, 1,
0.4394855, 0.3021418, 2.926135, 0.1215686, 0, 1, 1,
0.4401181, 0.5311599, -0.2794316, 0.1294118, 0, 1, 1,
0.4452307, -0.1596413, 3.078154, 0.1333333, 0, 1, 1,
0.44563, 0.5041112, 0.7440346, 0.1411765, 0, 1, 1,
0.4468197, -0.8795979, 4.051159, 0.145098, 0, 1, 1,
0.4485264, 0.8367798, -1.294422, 0.1529412, 0, 1, 1,
0.4498292, 1.462159, 0.2781009, 0.1568628, 0, 1, 1,
0.4543578, 1.672256, 1.439913, 0.1647059, 0, 1, 1,
0.4555623, -1.270112, 4.73473, 0.1686275, 0, 1, 1,
0.4597206, -1.346349, 2.039638, 0.1764706, 0, 1, 1,
0.4656426, -0.472528, 1.790321, 0.1803922, 0, 1, 1,
0.4660046, 1.113936, 1.275495, 0.1882353, 0, 1, 1,
0.4677932, 0.09628645, -0.2807544, 0.1921569, 0, 1, 1,
0.4741221, -0.4033895, 0.6015717, 0.2, 0, 1, 1,
0.4753281, 0.6168826, 2.124948, 0.2078431, 0, 1, 1,
0.4857845, -1.872519, 4.848097, 0.2117647, 0, 1, 1,
0.4882099, -0.7891022, 2.49729, 0.2196078, 0, 1, 1,
0.4894662, 0.6641477, 0.5755522, 0.2235294, 0, 1, 1,
0.4907873, 0.08193316, 2.769612, 0.2313726, 0, 1, 1,
0.4973575, -0.4660117, 0.8877859, 0.2352941, 0, 1, 1,
0.497661, 0.3020687, 0.3752578, 0.2431373, 0, 1, 1,
0.4979123, 1.234674, 0.3600051, 0.2470588, 0, 1, 1,
0.5022228, -2.116308, 3.146361, 0.254902, 0, 1, 1,
0.5054964, 0.6613739, -0.6220315, 0.2588235, 0, 1, 1,
0.5062596, 1.625926, 0.0684124, 0.2666667, 0, 1, 1,
0.5076613, -1.570641, 4.440424, 0.2705882, 0, 1, 1,
0.5168825, -1.817901, 2.945686, 0.2784314, 0, 1, 1,
0.5203123, -1.275158, 2.092277, 0.282353, 0, 1, 1,
0.5203738, -0.9235655, 2.6933, 0.2901961, 0, 1, 1,
0.5232036, -0.007121627, 2.06546, 0.2941177, 0, 1, 1,
0.5277131, -1.423012, 3.527278, 0.3019608, 0, 1, 1,
0.5280263, -0.05537532, 1.791731, 0.3098039, 0, 1, 1,
0.5343848, -1.137895, 3.6249, 0.3137255, 0, 1, 1,
0.5469702, 0.2051208, 1.859505, 0.3215686, 0, 1, 1,
0.5515426, 2.563494, 0.381076, 0.3254902, 0, 1, 1,
0.5520597, 0.1167987, 1.348891, 0.3333333, 0, 1, 1,
0.566686, 0.6751402, 0.3523507, 0.3372549, 0, 1, 1,
0.57285, 0.08921716, 1.78641, 0.345098, 0, 1, 1,
0.5778973, 0.2966907, 1.793879, 0.3490196, 0, 1, 1,
0.5791062, 0.9699489, 1.159487, 0.3568628, 0, 1, 1,
0.5842112, 1.601534, 1.530182, 0.3607843, 0, 1, 1,
0.5861694, -1.152147, 1.956904, 0.3686275, 0, 1, 1,
0.5898588, -0.01452991, 3.144135, 0.372549, 0, 1, 1,
0.5901206, -1.059455, 0.9229708, 0.3803922, 0, 1, 1,
0.5912005, 2.045523, -0.188898, 0.3843137, 0, 1, 1,
0.6007919, -0.3666282, 2.844874, 0.3921569, 0, 1, 1,
0.6045771, -0.8517287, 1.735178, 0.3960784, 0, 1, 1,
0.6051877, -0.01578275, 0.5272973, 0.4039216, 0, 1, 1,
0.6053014, -0.5809854, 0.2470737, 0.4117647, 0, 1, 1,
0.605951, 0.1864253, 2.149958, 0.4156863, 0, 1, 1,
0.6084757, -0.3482949, 1.704204, 0.4235294, 0, 1, 1,
0.6103072, 0.8618031, 0.3130725, 0.427451, 0, 1, 1,
0.6121985, 0.9560609, -0.1051735, 0.4352941, 0, 1, 1,
0.6183949, 0.5549496, 0.2420482, 0.4392157, 0, 1, 1,
0.6203938, 1.219211, 0.4106294, 0.4470588, 0, 1, 1,
0.6248336, 0.2329368, 1.720081, 0.4509804, 0, 1, 1,
0.6256942, 1.259202, 1.929363, 0.4588235, 0, 1, 1,
0.6261185, 1.499815, -0.478684, 0.4627451, 0, 1, 1,
0.6287925, -0.3661595, 2.260402, 0.4705882, 0, 1, 1,
0.6292213, 1.382475, 0.2516725, 0.4745098, 0, 1, 1,
0.6303571, -0.6898247, 3.120572, 0.4823529, 0, 1, 1,
0.6349752, -0.005392473, 0.2727822, 0.4862745, 0, 1, 1,
0.6356104, -0.5615159, -0.06295491, 0.4941176, 0, 1, 1,
0.6360331, -0.9418046, 2.769637, 0.5019608, 0, 1, 1,
0.64522, 1.146518, 1.19391, 0.5058824, 0, 1, 1,
0.6493416, 0.6615983, 0.7885975, 0.5137255, 0, 1, 1,
0.6548361, -0.8107325, 1.374129, 0.5176471, 0, 1, 1,
0.6555016, -0.7763742, 3.007874, 0.5254902, 0, 1, 1,
0.6562794, -0.6625531, 3.802724, 0.5294118, 0, 1, 1,
0.6580406, 1.675543, -0.4852577, 0.5372549, 0, 1, 1,
0.6608546, -0.8714541, 2.980023, 0.5411765, 0, 1, 1,
0.6662561, -1.1668, 3.440633, 0.5490196, 0, 1, 1,
0.6668845, -0.1829626, 1.911773, 0.5529412, 0, 1, 1,
0.6679974, -2.494168, 2.16509, 0.5607843, 0, 1, 1,
0.6690908, 1.656937, 0.5517647, 0.5647059, 0, 1, 1,
0.6725826, -1.286968, 2.88894, 0.572549, 0, 1, 1,
0.676201, -0.4060791, 2.04922, 0.5764706, 0, 1, 1,
0.6771946, 0.6822637, 1.155038, 0.5843138, 0, 1, 1,
0.6796131, -1.191734, 1.853885, 0.5882353, 0, 1, 1,
0.6813555, 0.531928, 1.508831, 0.5960785, 0, 1, 1,
0.6832653, -0.5308765, 1.339239, 0.6039216, 0, 1, 1,
0.6900055, -0.08871359, 2.963294, 0.6078432, 0, 1, 1,
0.7028141, 0.807263, 2.580634, 0.6156863, 0, 1, 1,
0.7039281, -1.16498, 2.741059, 0.6196079, 0, 1, 1,
0.7041503, -0.6523315, 2.287297, 0.627451, 0, 1, 1,
0.7042168, -0.6522, 2.420387, 0.6313726, 0, 1, 1,
0.7059419, -2.3096, 1.626439, 0.6392157, 0, 1, 1,
0.7134397, 0.5226137, 0.8694484, 0.6431373, 0, 1, 1,
0.7163564, 0.1465939, 0.9109066, 0.6509804, 0, 1, 1,
0.7204996, -0.311304, 2.018438, 0.654902, 0, 1, 1,
0.7241654, -1.474431, 3.415753, 0.6627451, 0, 1, 1,
0.7280787, 1.517181, -0.8178741, 0.6666667, 0, 1, 1,
0.7343447, 1.059716, 2.774026, 0.6745098, 0, 1, 1,
0.736474, -0.0229359, 2.056823, 0.6784314, 0, 1, 1,
0.7407709, 0.05783376, 1.350708, 0.6862745, 0, 1, 1,
0.7445237, 0.3634345, 2.100143, 0.6901961, 0, 1, 1,
0.7448748, -1.25635, 4.422375, 0.6980392, 0, 1, 1,
0.7450109, 0.9855875, 0.75087, 0.7058824, 0, 1, 1,
0.7467208, -1.273074, 1.418551, 0.7098039, 0, 1, 1,
0.7513298, 0.2424281, 1.435853, 0.7176471, 0, 1, 1,
0.7597359, -0.7682227, 2.823374, 0.7215686, 0, 1, 1,
0.7639022, -0.4665349, 2.278568, 0.7294118, 0, 1, 1,
0.7691211, -0.1677498, 2.007784, 0.7333333, 0, 1, 1,
0.7705182, 1.025465, 1.498906, 0.7411765, 0, 1, 1,
0.7825996, -0.8379652, 1.073668, 0.7450981, 0, 1, 1,
0.783596, 0.5357063, 0.7767825, 0.7529412, 0, 1, 1,
0.7837898, 0.1593977, -0.5767793, 0.7568628, 0, 1, 1,
0.7922889, 0.5967453, 1.069573, 0.7647059, 0, 1, 1,
0.8022864, -0.3651867, 2.729801, 0.7686275, 0, 1, 1,
0.8050838, -0.316759, 3.707228, 0.7764706, 0, 1, 1,
0.8104195, -0.6050526, 2.277937, 0.7803922, 0, 1, 1,
0.8106835, 0.8543758, 0.591288, 0.7882353, 0, 1, 1,
0.8122823, -0.9431375, 4.214534, 0.7921569, 0, 1, 1,
0.8167303, 1.765751, 1.210812, 0.8, 0, 1, 1,
0.8183498, -0.6597718, 2.173194, 0.8078431, 0, 1, 1,
0.8197351, 1.140634, 0.3180816, 0.8117647, 0, 1, 1,
0.8220073, 0.414122, 2.390922, 0.8196079, 0, 1, 1,
0.8249565, -0.4756577, 3.840138, 0.8235294, 0, 1, 1,
0.8285213, 0.2269264, 2.794384, 0.8313726, 0, 1, 1,
0.8300859, 1.035141, 1.371938, 0.8352941, 0, 1, 1,
0.8408312, 0.4329945, 2.565997, 0.8431373, 0, 1, 1,
0.8484733, 0.2879716, 2.564641, 0.8470588, 0, 1, 1,
0.853047, -0.5202687, 2.974074, 0.854902, 0, 1, 1,
0.8546991, -0.7119482, 1.488403, 0.8588235, 0, 1, 1,
0.8584151, -0.6593619, 4.641815, 0.8666667, 0, 1, 1,
0.8709309, 0.5708386, 0.3365098, 0.8705882, 0, 1, 1,
0.8711543, 1.189107, -0.7623983, 0.8784314, 0, 1, 1,
0.8717734, 0.3557005, 0.8922504, 0.8823529, 0, 1, 1,
0.872264, -0.3600802, 2.395421, 0.8901961, 0, 1, 1,
0.8758929, -0.7011826, 3.445514, 0.8941177, 0, 1, 1,
0.8851633, -0.7150254, 1.793323, 0.9019608, 0, 1, 1,
0.8901665, -0.258256, 1.691605, 0.9098039, 0, 1, 1,
0.8951549, -0.3768622, 2.084772, 0.9137255, 0, 1, 1,
0.9003612, 1.844663, 1.859233, 0.9215686, 0, 1, 1,
0.9008183, -0.3517011, 1.692198, 0.9254902, 0, 1, 1,
0.90161, 0.1754931, 2.348152, 0.9333333, 0, 1, 1,
0.9025438, 1.627836, 1.314666, 0.9372549, 0, 1, 1,
0.9031989, 0.5987659, 0.4256095, 0.945098, 0, 1, 1,
0.9075854, -0.2841528, 1.725886, 0.9490196, 0, 1, 1,
0.9081166, 1.600329, -0.9839774, 0.9568627, 0, 1, 1,
0.9082488, -0.6355603, 2.056821, 0.9607843, 0, 1, 1,
0.9105853, -0.4455384, 1.669783, 0.9686275, 0, 1, 1,
0.92406, 0.4374018, 0.5041751, 0.972549, 0, 1, 1,
0.9240638, -2.61729, 3.763489, 0.9803922, 0, 1, 1,
0.9283893, -0.5147511, 0.7009423, 0.9843137, 0, 1, 1,
0.9319522, 0.4967263, 1.721133, 0.9921569, 0, 1, 1,
0.9381405, -0.2895697, 2.559056, 0.9960784, 0, 1, 1,
0.9390558, 0.4227508, 0.9975551, 1, 0, 0.9960784, 1,
0.9392426, 1.284029, 0.6391366, 1, 0, 0.9882353, 1,
0.9416494, -0.1859889, 2.246475, 1, 0, 0.9843137, 1,
0.9421314, -1.716234, 2.842647, 1, 0, 0.9764706, 1,
0.9465378, -0.2810854, 0.5484757, 1, 0, 0.972549, 1,
0.9465942, -0.6219105, 3.265036, 1, 0, 0.9647059, 1,
0.947564, -1.199099, 1.992587, 1, 0, 0.9607843, 1,
0.9541377, 1.112067, -0.276715, 1, 0, 0.9529412, 1,
0.9607207, 0.233375, 1.522414, 1, 0, 0.9490196, 1,
0.9625969, 1.293427, 1.394444, 1, 0, 0.9411765, 1,
0.9706076, -0.3102431, 3.069742, 1, 0, 0.9372549, 1,
0.9745821, -0.2099527, 2.253274, 1, 0, 0.9294118, 1,
0.979383, -0.2451139, 0.5301751, 1, 0, 0.9254902, 1,
0.9817295, -1.448904, 4.676802, 1, 0, 0.9176471, 1,
0.9953583, 1.432281, -0.1846192, 1, 0, 0.9137255, 1,
0.9962635, -2.82182, 3.138217, 1, 0, 0.9058824, 1,
0.9969993, 0.1796654, 0.4419228, 1, 0, 0.9019608, 1,
1.00234, -0.337566, 0.7752814, 1, 0, 0.8941177, 1,
1.011268, 0.9893768, 1.4904, 1, 0, 0.8862745, 1,
1.013092, -0.6994524, 1.494937, 1, 0, 0.8823529, 1,
1.015179, 0.7950754, -0.880829, 1, 0, 0.8745098, 1,
1.027963, 1.733794, 2.169251, 1, 0, 0.8705882, 1,
1.037648, 0.09104577, 2.765327, 1, 0, 0.8627451, 1,
1.042429, -0.4913834, 3.008262, 1, 0, 0.8588235, 1,
1.051005, 0.1417223, 1.333114, 1, 0, 0.8509804, 1,
1.051869, 0.7017871, -1.634524, 1, 0, 0.8470588, 1,
1.052721, 0.7232603, 0.2703869, 1, 0, 0.8392157, 1,
1.053238, 0.6082362, 1.188676, 1, 0, 0.8352941, 1,
1.055399, -1.293052, 0.651745, 1, 0, 0.827451, 1,
1.056739, -0.3379473, 0.866271, 1, 0, 0.8235294, 1,
1.063638, 0.4516367, 0.6116039, 1, 0, 0.8156863, 1,
1.064496, 0.8169128, 1.603295, 1, 0, 0.8117647, 1,
1.073879, 0.3817183, 0.6524998, 1, 0, 0.8039216, 1,
1.074221, 0.6649827, 1.931, 1, 0, 0.7960784, 1,
1.082318, 0.8526708, -1.645338, 1, 0, 0.7921569, 1,
1.100314, -0.8411945, 3.509859, 1, 0, 0.7843137, 1,
1.10355, -0.5004253, 1.257689, 1, 0, 0.7803922, 1,
1.110959, -0.6616631, 1.071617, 1, 0, 0.772549, 1,
1.122912, -1.147582, 0.8285272, 1, 0, 0.7686275, 1,
1.124379, 0.4258893, 1.83701, 1, 0, 0.7607843, 1,
1.124833, 0.1779326, -0.289903, 1, 0, 0.7568628, 1,
1.125782, 1.137308, 1.609708, 1, 0, 0.7490196, 1,
1.131941, -0.1225601, 2.733428, 1, 0, 0.7450981, 1,
1.146893, 0.2780857, -1.439364, 1, 0, 0.7372549, 1,
1.151868, 0.1461236, 0.471305, 1, 0, 0.7333333, 1,
1.152638, -0.2911473, 0.9503787, 1, 0, 0.7254902, 1,
1.160291, -0.2729652, 3.199935, 1, 0, 0.7215686, 1,
1.165819, -0.742156, 0.3579031, 1, 0, 0.7137255, 1,
1.165879, 0.3177749, 1.271369, 1, 0, 0.7098039, 1,
1.166739, 0.3384976, 0.9759553, 1, 0, 0.7019608, 1,
1.173636, 0.6502633, 1.462743, 1, 0, 0.6941177, 1,
1.216695, 1.50686, 0.5084584, 1, 0, 0.6901961, 1,
1.217176, -0.9306609, 0.4924839, 1, 0, 0.682353, 1,
1.219291, -0.5970917, 2.488643, 1, 0, 0.6784314, 1,
1.238662, -0.5087634, 1.283551, 1, 0, 0.6705883, 1,
1.243801, 1.047032, 1.273175, 1, 0, 0.6666667, 1,
1.255936, -0.3165721, 2.063356, 1, 0, 0.6588235, 1,
1.264019, 0.6515665, 0.7737958, 1, 0, 0.654902, 1,
1.269429, 1.293221, 0.9953415, 1, 0, 0.6470588, 1,
1.274346, 1.45181, 0.8178837, 1, 0, 0.6431373, 1,
1.274548, 0.1426366, 2.527231, 1, 0, 0.6352941, 1,
1.284352, -1.418353, 2.808413, 1, 0, 0.6313726, 1,
1.290254, -1.460532, 3.314944, 1, 0, 0.6235294, 1,
1.290674, 1.055996, 0.1275946, 1, 0, 0.6196079, 1,
1.291497, 0.8893536, -0.400231, 1, 0, 0.6117647, 1,
1.301095, 1.687818, 0.005775672, 1, 0, 0.6078432, 1,
1.30917, -1.764913, 2.87762, 1, 0, 0.6, 1,
1.309268, -0.2804447, 1.21191, 1, 0, 0.5921569, 1,
1.314694, -0.4565456, 2.539921, 1, 0, 0.5882353, 1,
1.332577, -1.643139, 2.652522, 1, 0, 0.5803922, 1,
1.340008, -0.4725586, 1.153355, 1, 0, 0.5764706, 1,
1.341563, -0.3063657, 1.338247, 1, 0, 0.5686275, 1,
1.342738, -1.217722, 1.580799, 1, 0, 0.5647059, 1,
1.347311, -0.1515701, 2.508052, 1, 0, 0.5568628, 1,
1.348253, -0.4957436, 3.965395, 1, 0, 0.5529412, 1,
1.35497, 1.13552, 0.395302, 1, 0, 0.5450981, 1,
1.35586, 0.03755608, 2.810235, 1, 0, 0.5411765, 1,
1.356919, 0.7058495, 1.593157, 1, 0, 0.5333334, 1,
1.367533, -0.05043279, 2.277672, 1, 0, 0.5294118, 1,
1.383631, -0.7394257, 1.515083, 1, 0, 0.5215687, 1,
1.384795, -1.051871, 3.813749, 1, 0, 0.5176471, 1,
1.385225, -1.693518, 1.538372, 1, 0, 0.509804, 1,
1.387725, -0.5492578, 0.9876375, 1, 0, 0.5058824, 1,
1.391399, 1.648681, 0.9764152, 1, 0, 0.4980392, 1,
1.40472, -0.7340659, 1.706576, 1, 0, 0.4901961, 1,
1.407706, -0.7329828, 0.9832132, 1, 0, 0.4862745, 1,
1.408749, -0.4714122, 0.8130387, 1, 0, 0.4784314, 1,
1.412169, 0.2449057, 2.229162, 1, 0, 0.4745098, 1,
1.413508, -1.299703, 0.8098702, 1, 0, 0.4666667, 1,
1.414444, 0.4278879, 1.499185, 1, 0, 0.4627451, 1,
1.416557, -0.3018486, 2.82261, 1, 0, 0.454902, 1,
1.421205, -0.6513252, 2.520729, 1, 0, 0.4509804, 1,
1.429201, 1.878356, 1.931504, 1, 0, 0.4431373, 1,
1.436995, -0.5782676, 1.734116, 1, 0, 0.4392157, 1,
1.44687, 0.1520276, 2.140971, 1, 0, 0.4313726, 1,
1.457254, -0.2184502, 2.088342, 1, 0, 0.427451, 1,
1.465857, 0.06431402, 2.667858, 1, 0, 0.4196078, 1,
1.467484, -1.458627, 0.3340152, 1, 0, 0.4156863, 1,
1.486685, -0.411718, 2.436269, 1, 0, 0.4078431, 1,
1.486766, 0.1629592, -1.270798, 1, 0, 0.4039216, 1,
1.498753, 1.77059, 0.1799541, 1, 0, 0.3960784, 1,
1.502336, 1.231055, 2.111789, 1, 0, 0.3882353, 1,
1.514141, 0.6706995, 1.459948, 1, 0, 0.3843137, 1,
1.516855, 0.6832753, 0.05844942, 1, 0, 0.3764706, 1,
1.517237, 0.2041337, 2.89997, 1, 0, 0.372549, 1,
1.521616, -1.218304, 2.705792, 1, 0, 0.3647059, 1,
1.524983, -1.142272, 1.658796, 1, 0, 0.3607843, 1,
1.549243, 0.8741704, 0.9113612, 1, 0, 0.3529412, 1,
1.550058, 0.8488818, 1.002809, 1, 0, 0.3490196, 1,
1.579853, 0.6751779, 0.7914324, 1, 0, 0.3411765, 1,
1.580014, 1.265123, 2.016522, 1, 0, 0.3372549, 1,
1.584342, 0.01787175, 0.7306141, 1, 0, 0.3294118, 1,
1.598676, -1.645851, 2.687073, 1, 0, 0.3254902, 1,
1.620451, 0.06900435, 2.978622, 1, 0, 0.3176471, 1,
1.650479, 0.5620715, 0.6608408, 1, 0, 0.3137255, 1,
1.65115, -0.7487503, 0.9423665, 1, 0, 0.3058824, 1,
1.672985, 0.5115304, -0.1352413, 1, 0, 0.2980392, 1,
1.681683, -0.564625, 3.060335, 1, 0, 0.2941177, 1,
1.685621, -0.9167193, 0.7687986, 1, 0, 0.2862745, 1,
1.712689, -0.8228129, 1.364653, 1, 0, 0.282353, 1,
1.722437, 0.3759749, 0.7104759, 1, 0, 0.2745098, 1,
1.73005, -0.3897362, 0.7953253, 1, 0, 0.2705882, 1,
1.731097, 1.473067, 1.34173, 1, 0, 0.2627451, 1,
1.733406, -0.2227065, 1.131038, 1, 0, 0.2588235, 1,
1.742512, 0.9660888, 0.6243843, 1, 0, 0.2509804, 1,
1.750854, -2.517076, 3.060371, 1, 0, 0.2470588, 1,
1.770336, -0.6653408, 2.962768, 1, 0, 0.2392157, 1,
1.774219, 0.6343321, 0.2581954, 1, 0, 0.2352941, 1,
1.792527, 0.2502425, 2.519008, 1, 0, 0.227451, 1,
1.807789, 0.3371809, 2.850137, 1, 0, 0.2235294, 1,
1.824895, 1.79383, 0.5113001, 1, 0, 0.2156863, 1,
1.846566, -0.667311, 3.647931, 1, 0, 0.2117647, 1,
1.853848, 0.3447392, 0.4352174, 1, 0, 0.2039216, 1,
1.855208, -0.5200978, 2.31794, 1, 0, 0.1960784, 1,
1.892165, 0.8884416, 2.085505, 1, 0, 0.1921569, 1,
1.894151, -2.227605, 1.133067, 1, 0, 0.1843137, 1,
1.896166, -0.8883098, 1.547686, 1, 0, 0.1803922, 1,
1.902992, 1.064398, 0.7289848, 1, 0, 0.172549, 1,
1.927686, 1.55489, 2.362455, 1, 0, 0.1686275, 1,
1.949844, 2.027612, -0.3734141, 1, 0, 0.1607843, 1,
1.959839, 0.5509291, 2.281242, 1, 0, 0.1568628, 1,
1.991552, 2.512355, 1.229232, 1, 0, 0.1490196, 1,
1.993348, 0.5886862, 1.233979, 1, 0, 0.145098, 1,
2.01891, 0.1627016, 1.210337, 1, 0, 0.1372549, 1,
2.019617, 0.4275055, 1.386899, 1, 0, 0.1333333, 1,
2.022184, -0.3043087, 1.596262, 1, 0, 0.1254902, 1,
2.032636, 0.07375633, 1.659519, 1, 0, 0.1215686, 1,
2.102892, 0.06413456, 1.846013, 1, 0, 0.1137255, 1,
2.104338, 1.317626, 2.332522, 1, 0, 0.1098039, 1,
2.109436, 1.520833, 1.834876, 1, 0, 0.1019608, 1,
2.241128, 0.266533, 0.8070471, 1, 0, 0.09411765, 1,
2.247433, -0.6178527, 1.936442, 1, 0, 0.09019608, 1,
2.25199, 1.677693, 1.150474, 1, 0, 0.08235294, 1,
2.282365, 1.089342, 0.09928108, 1, 0, 0.07843138, 1,
2.319901, 0.1277469, 4.04328, 1, 0, 0.07058824, 1,
2.346967, 0.2753901, 2.207736, 1, 0, 0.06666667, 1,
2.348493, -0.6453256, 0.9532294, 1, 0, 0.05882353, 1,
2.460816, -0.04346689, 2.555222, 1, 0, 0.05490196, 1,
2.475848, -1.308779, 2.424538, 1, 0, 0.04705882, 1,
2.543989, 0.5584333, 1.907477, 1, 0, 0.04313726, 1,
2.561871, 0.8303548, 3.782683, 1, 0, 0.03529412, 1,
2.605129, -1.406801, 0.8725372, 1, 0, 0.03137255, 1,
2.644239, -0.07285842, 3.372831, 1, 0, 0.02352941, 1,
2.716703, -1.052089, 3.013444, 1, 0, 0.01960784, 1,
2.734215, -0.5503438, 1.200603, 1, 0, 0.01176471, 1,
2.896793, -0.6142098, 1.946654, 1, 0, 0.007843138, 1
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
-0.03207314, -3.801939, -7.842075, 0, -0.5, 0.5, 0.5,
-0.03207314, -3.801939, -7.842075, 1, -0.5, 0.5, 0.5,
-0.03207314, -3.801939, -7.842075, 1, 1.5, 0.5, 0.5,
-0.03207314, -3.801939, -7.842075, 0, 1.5, 0.5, 0.5
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
-3.953825, 0.0693891, -7.842075, 0, -0.5, 0.5, 0.5,
-3.953825, 0.0693891, -7.842075, 1, -0.5, 0.5, 0.5,
-3.953825, 0.0693891, -7.842075, 1, 1.5, 0.5, 0.5,
-3.953825, 0.0693891, -7.842075, 0, 1.5, 0.5, 0.5
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
-3.953825, -3.801939, -0.4251721, 0, -0.5, 0.5, 0.5,
-3.953825, -3.801939, -0.4251721, 1, -0.5, 0.5, 0.5,
-3.953825, -3.801939, -0.4251721, 1, 1.5, 0.5, 0.5,
-3.953825, -3.801939, -0.4251721, 0, 1.5, 0.5, 0.5
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
-2, -2.908556, -6.130482,
2, -2.908556, -6.130482,
-2, -2.908556, -6.130482,
-2, -3.057453, -6.415748,
-1, -2.908556, -6.130482,
-1, -3.057453, -6.415748,
0, -2.908556, -6.130482,
0, -3.057453, -6.415748,
1, -2.908556, -6.130482,
1, -3.057453, -6.415748,
2, -2.908556, -6.130482,
2, -3.057453, -6.415748
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
-2, -3.355248, -6.986279, 0, -0.5, 0.5, 0.5,
-2, -3.355248, -6.986279, 1, -0.5, 0.5, 0.5,
-2, -3.355248, -6.986279, 1, 1.5, 0.5, 0.5,
-2, -3.355248, -6.986279, 0, 1.5, 0.5, 0.5,
-1, -3.355248, -6.986279, 0, -0.5, 0.5, 0.5,
-1, -3.355248, -6.986279, 1, -0.5, 0.5, 0.5,
-1, -3.355248, -6.986279, 1, 1.5, 0.5, 0.5,
-1, -3.355248, -6.986279, 0, 1.5, 0.5, 0.5,
0, -3.355248, -6.986279, 0, -0.5, 0.5, 0.5,
0, -3.355248, -6.986279, 1, -0.5, 0.5, 0.5,
0, -3.355248, -6.986279, 1, 1.5, 0.5, 0.5,
0, -3.355248, -6.986279, 0, 1.5, 0.5, 0.5,
1, -3.355248, -6.986279, 0, -0.5, 0.5, 0.5,
1, -3.355248, -6.986279, 1, -0.5, 0.5, 0.5,
1, -3.355248, -6.986279, 1, 1.5, 0.5, 0.5,
1, -3.355248, -6.986279, 0, 1.5, 0.5, 0.5,
2, -3.355248, -6.986279, 0, -0.5, 0.5, 0.5,
2, -3.355248, -6.986279, 1, -0.5, 0.5, 0.5,
2, -3.355248, -6.986279, 1, 1.5, 0.5, 0.5,
2, -3.355248, -6.986279, 0, 1.5, 0.5, 0.5
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
-3.048805, -2, -6.130482,
-3.048805, 2, -6.130482,
-3.048805, -2, -6.130482,
-3.199641, -2, -6.415748,
-3.048805, -1, -6.130482,
-3.199641, -1, -6.415748,
-3.048805, 0, -6.130482,
-3.199641, 0, -6.415748,
-3.048805, 1, -6.130482,
-3.199641, 1, -6.415748,
-3.048805, 2, -6.130482,
-3.199641, 2, -6.415748
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
-3.501315, -2, -6.986279, 0, -0.5, 0.5, 0.5,
-3.501315, -2, -6.986279, 1, -0.5, 0.5, 0.5,
-3.501315, -2, -6.986279, 1, 1.5, 0.5, 0.5,
-3.501315, -2, -6.986279, 0, 1.5, 0.5, 0.5,
-3.501315, -1, -6.986279, 0, -0.5, 0.5, 0.5,
-3.501315, -1, -6.986279, 1, -0.5, 0.5, 0.5,
-3.501315, -1, -6.986279, 1, 1.5, 0.5, 0.5,
-3.501315, -1, -6.986279, 0, 1.5, 0.5, 0.5,
-3.501315, 0, -6.986279, 0, -0.5, 0.5, 0.5,
-3.501315, 0, -6.986279, 1, -0.5, 0.5, 0.5,
-3.501315, 0, -6.986279, 1, 1.5, 0.5, 0.5,
-3.501315, 0, -6.986279, 0, 1.5, 0.5, 0.5,
-3.501315, 1, -6.986279, 0, -0.5, 0.5, 0.5,
-3.501315, 1, -6.986279, 1, -0.5, 0.5, 0.5,
-3.501315, 1, -6.986279, 1, 1.5, 0.5, 0.5,
-3.501315, 1, -6.986279, 0, 1.5, 0.5, 0.5,
-3.501315, 2, -6.986279, 0, -0.5, 0.5, 0.5,
-3.501315, 2, -6.986279, 1, -0.5, 0.5, 0.5,
-3.501315, 2, -6.986279, 1, 1.5, 0.5, 0.5,
-3.501315, 2, -6.986279, 0, 1.5, 0.5, 0.5
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
-3.048805, -2.908556, -4,
-3.048805, -2.908556, 4,
-3.048805, -2.908556, -4,
-3.199641, -3.057453, -4,
-3.048805, -2.908556, -2,
-3.199641, -3.057453, -2,
-3.048805, -2.908556, 0,
-3.199641, -3.057453, 0,
-3.048805, -2.908556, 2,
-3.199641, -3.057453, 2,
-3.048805, -2.908556, 4,
-3.199641, -3.057453, 4
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
-3.501315, -3.355248, -4, 0, -0.5, 0.5, 0.5,
-3.501315, -3.355248, -4, 1, -0.5, 0.5, 0.5,
-3.501315, -3.355248, -4, 1, 1.5, 0.5, 0.5,
-3.501315, -3.355248, -4, 0, 1.5, 0.5, 0.5,
-3.501315, -3.355248, -2, 0, -0.5, 0.5, 0.5,
-3.501315, -3.355248, -2, 1, -0.5, 0.5, 0.5,
-3.501315, -3.355248, -2, 1, 1.5, 0.5, 0.5,
-3.501315, -3.355248, -2, 0, 1.5, 0.5, 0.5,
-3.501315, -3.355248, 0, 0, -0.5, 0.5, 0.5,
-3.501315, -3.355248, 0, 1, -0.5, 0.5, 0.5,
-3.501315, -3.355248, 0, 1, 1.5, 0.5, 0.5,
-3.501315, -3.355248, 0, 0, 1.5, 0.5, 0.5,
-3.501315, -3.355248, 2, 0, -0.5, 0.5, 0.5,
-3.501315, -3.355248, 2, 1, -0.5, 0.5, 0.5,
-3.501315, -3.355248, 2, 1, 1.5, 0.5, 0.5,
-3.501315, -3.355248, 2, 0, 1.5, 0.5, 0.5,
-3.501315, -3.355248, 4, 0, -0.5, 0.5, 0.5,
-3.501315, -3.355248, 4, 1, -0.5, 0.5, 0.5,
-3.501315, -3.355248, 4, 1, 1.5, 0.5, 0.5,
-3.501315, -3.355248, 4, 0, 1.5, 0.5, 0.5
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
-3.048805, -2.908556, -6.130482,
-3.048805, 3.047334, -6.130482,
-3.048805, -2.908556, 5.280138,
-3.048805, 3.047334, 5.280138,
-3.048805, -2.908556, -6.130482,
-3.048805, -2.908556, 5.280138,
-3.048805, 3.047334, -6.130482,
-3.048805, 3.047334, 5.280138,
-3.048805, -2.908556, -6.130482,
2.984659, -2.908556, -6.130482,
-3.048805, -2.908556, 5.280138,
2.984659, -2.908556, 5.280138,
-3.048805, 3.047334, -6.130482,
2.984659, 3.047334, -6.130482,
-3.048805, 3.047334, 5.280138,
2.984659, 3.047334, 5.280138,
2.984659, -2.908556, -6.130482,
2.984659, 3.047334, -6.130482,
2.984659, -2.908556, 5.280138,
2.984659, 3.047334, 5.280138,
2.984659, -2.908556, -6.130482,
2.984659, -2.908556, 5.280138,
2.984659, 3.047334, -6.130482,
2.984659, 3.047334, 5.280138
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
var radius = 7.590747;
var distance = 33.77209;
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
mvMatrix.translate( 0.03207314, -0.0693891, 0.4251721 );
mvMatrix.scale( 1.360291, 1.378008, 0.7192654 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.77209);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
clomeprop<-read.table("clomeprop.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-clomeprop$V2
```

```
## Error in eval(expr, envir, enclos): object 'clomeprop' not found
```

```r
y<-clomeprop$V3
```

```
## Error in eval(expr, envir, enclos): object 'clomeprop' not found
```

```r
z<-clomeprop$V4
```

```
## Error in eval(expr, envir, enclos): object 'clomeprop' not found
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
-2.960939, 1.013544, -2.380421, 0, 0, 1, 1, 1,
-2.914185, -2.003169, -1.891076, 1, 0, 0, 1, 1,
-2.710716, -0.1644724, -1.540208, 1, 0, 0, 1, 1,
-2.575288, 0.3322628, -4.196981, 1, 0, 0, 1, 1,
-2.536224, -0.4488877, -0.9576414, 1, 0, 0, 1, 1,
-2.532673, -0.165137, -1.466632, 1, 0, 0, 1, 1,
-2.426025, -0.2432793, -1.07706, 0, 0, 0, 1, 1,
-2.399665, 1.819018, -0.5482557, 0, 0, 0, 1, 1,
-2.377236, -0.3691258, -1.415536, 0, 0, 0, 1, 1,
-2.302742, 0.7577199, 0.06842511, 0, 0, 0, 1, 1,
-2.285379, 0.4787537, -2.841517, 0, 0, 0, 1, 1,
-2.28266, -0.06485182, -2.093295, 0, 0, 0, 1, 1,
-2.271583, -1.002648, 0.8949667, 0, 0, 0, 1, 1,
-2.244048, 0.3232329, -1.376085, 1, 1, 1, 1, 1,
-2.208586, 0.7873368, -0.4640489, 1, 1, 1, 1, 1,
-2.191225, 1.378899, -0.7830103, 1, 1, 1, 1, 1,
-2.18508, -0.3632833, -2.644423, 1, 1, 1, 1, 1,
-2.158941, -0.3295819, -0.9206843, 1, 1, 1, 1, 1,
-2.029938, 2.8055, -1.488426, 1, 1, 1, 1, 1,
-2.013336, -1.192941, -1.832014, 1, 1, 1, 1, 1,
-2.009993, -2.119599, -3.694149, 1, 1, 1, 1, 1,
-2.004004, -1.052639, -1.382076, 1, 1, 1, 1, 1,
-1.989449, 0.56457, -0.4024871, 1, 1, 1, 1, 1,
-1.984152, -1.088639, -2.037228, 1, 1, 1, 1, 1,
-1.974943, -0.2889262, -1.689529, 1, 1, 1, 1, 1,
-1.971007, 0.2393489, -2.205482, 1, 1, 1, 1, 1,
-1.963955, -0.132806, -3.018717, 1, 1, 1, 1, 1,
-1.960328, -1.914179, -2.305165, 1, 1, 1, 1, 1,
-1.957503, 0.5425737, -2.452701, 0, 0, 1, 1, 1,
-1.940526, 0.3481541, -2.28662, 1, 0, 0, 1, 1,
-1.921659, -1.621132, -2.360424, 1, 0, 0, 1, 1,
-1.918458, 0.3637155, -1.582361, 1, 0, 0, 1, 1,
-1.913813, 0.7591394, -1.385312, 1, 0, 0, 1, 1,
-1.885122, -0.7261736, -1.760403, 1, 0, 0, 1, 1,
-1.871846, 0.08935808, -2.077916, 0, 0, 0, 1, 1,
-1.855234, -0.2711116, -1.383283, 0, 0, 0, 1, 1,
-1.828793, -0.3623192, -2.221889, 0, 0, 0, 1, 1,
-1.802004, -0.2545412, -2.685941, 0, 0, 0, 1, 1,
-1.78235, 1.012139, 0.5247258, 0, 0, 0, 1, 1,
-1.782176, 0.994413, -2.183012, 0, 0, 0, 1, 1,
-1.776419, 1.395019, -0.8358878, 0, 0, 0, 1, 1,
-1.76675, -0.3348199, -2.020526, 1, 1, 1, 1, 1,
-1.737349, 0.6886614, -2.913053, 1, 1, 1, 1, 1,
-1.730648, -0.4604347, -1.347945, 1, 1, 1, 1, 1,
-1.718221, 0.5012146, -1.033167, 1, 1, 1, 1, 1,
-1.696682, -1.79838, -2.047386, 1, 1, 1, 1, 1,
-1.691817, 0.6600393, -1.864182, 1, 1, 1, 1, 1,
-1.685074, -2.069475, -2.297746, 1, 1, 1, 1, 1,
-1.67062, -1.233235, -2.27513, 1, 1, 1, 1, 1,
-1.66934, -0.1526064, 1.325171, 1, 1, 1, 1, 1,
-1.616636, -0.3753946, -2.362864, 1, 1, 1, 1, 1,
-1.615968, -1.820341, -2.67865, 1, 1, 1, 1, 1,
-1.606137, -0.1727926, -1.272773, 1, 1, 1, 1, 1,
-1.594767, 0.4632507, -1.697906, 1, 1, 1, 1, 1,
-1.587099, 1.214128, -0.3486121, 1, 1, 1, 1, 1,
-1.582564, 1.053693, -0.6047533, 1, 1, 1, 1, 1,
-1.577504, 0.5931075, 0.1196885, 0, 0, 1, 1, 1,
-1.553507, -1.92444, -2.281895, 1, 0, 0, 1, 1,
-1.546009, 0.4729162, -2.174411, 1, 0, 0, 1, 1,
-1.540218, 1.666508, -1.839974, 1, 0, 0, 1, 1,
-1.522326, 0.4027632, -1.238879, 1, 0, 0, 1, 1,
-1.520513, 1.786845, -1.877119, 1, 0, 0, 1, 1,
-1.518861, 0.1014396, -0.8018969, 0, 0, 0, 1, 1,
-1.512535, -0.04377864, -1.036495, 0, 0, 0, 1, 1,
-1.512477, 0.07710469, -1.672913, 0, 0, 0, 1, 1,
-1.50265, 1.220429, -1.832155, 0, 0, 0, 1, 1,
-1.486054, 1.076253, -2.353025, 0, 0, 0, 1, 1,
-1.484511, -0.07942444, -2.643049, 0, 0, 0, 1, 1,
-1.481482, -0.103097, -2.552329, 0, 0, 0, 1, 1,
-1.480369, -0.07616102, -2.350986, 1, 1, 1, 1, 1,
-1.462149, -1.698148, -2.57223, 1, 1, 1, 1, 1,
-1.461594, 0.2589451, -1.434236, 1, 1, 1, 1, 1,
-1.447595, -1.189824, -1.653899, 1, 1, 1, 1, 1,
-1.446291, 0.5174755, -2.222412, 1, 1, 1, 1, 1,
-1.444091, 0.786286, -0.2548365, 1, 1, 1, 1, 1,
-1.433766, -0.3195239, -1.813378, 1, 1, 1, 1, 1,
-1.431012, -0.3633636, -1.981758, 1, 1, 1, 1, 1,
-1.430066, -0.3763041, -2.968119, 1, 1, 1, 1, 1,
-1.425948, -1.415662, -1.228438, 1, 1, 1, 1, 1,
-1.424608, -0.6333169, -1.902172, 1, 1, 1, 1, 1,
-1.41885, 0.05149516, -2.381062, 1, 1, 1, 1, 1,
-1.416358, -0.4469032, -2.044463, 1, 1, 1, 1, 1,
-1.413584, 0.4728527, -0.9134685, 1, 1, 1, 1, 1,
-1.398681, 1.400226, -0.3702585, 1, 1, 1, 1, 1,
-1.394333, 0.7138981, -0.8315481, 0, 0, 1, 1, 1,
-1.376642, 0.9479645, -1.116125, 1, 0, 0, 1, 1,
-1.374925, 0.6096289, -1.854494, 1, 0, 0, 1, 1,
-1.362253, 0.3545103, -0.1473763, 1, 0, 0, 1, 1,
-1.341729, -0.2656175, -0.9584922, 1, 0, 0, 1, 1,
-1.341471, -0.7672643, -2.389622, 1, 0, 0, 1, 1,
-1.338188, -0.4227998, -1.807343, 0, 0, 0, 1, 1,
-1.336225, 1.495383, 0.7093271, 0, 0, 0, 1, 1,
-1.331978, -0.3305368, -2.183394, 0, 0, 0, 1, 1,
-1.312951, 0.7571582, -1.978083, 0, 0, 0, 1, 1,
-1.312506, -0.3583695, -2.035714, 0, 0, 0, 1, 1,
-1.306579, -0.3439789, -0.2903188, 0, 0, 0, 1, 1,
-1.292575, -0.7687463, -0.727789, 0, 0, 0, 1, 1,
-1.28777, -0.9505402, -2.907853, 1, 1, 1, 1, 1,
-1.285851, 0.4319057, -1.175042, 1, 1, 1, 1, 1,
-1.284629, 0.1852131, -1.245877, 1, 1, 1, 1, 1,
-1.279483, -1.589913, -3.702373, 1, 1, 1, 1, 1,
-1.277162, -0.1769036, -1.767305, 1, 1, 1, 1, 1,
-1.272003, -1.248288, -2.007223, 1, 1, 1, 1, 1,
-1.266633, 0.06530029, -0.4339997, 1, 1, 1, 1, 1,
-1.266543, -2.317251, -3.062414, 1, 1, 1, 1, 1,
-1.253779, -0.3289146, -1.211743, 1, 1, 1, 1, 1,
-1.2437, 0.9040591, -1.278858, 1, 1, 1, 1, 1,
-1.238062, -0.2376099, -0.9976351, 1, 1, 1, 1, 1,
-1.222102, 0.04262087, -0.9007162, 1, 1, 1, 1, 1,
-1.215487, -0.5825894, -1.415857, 1, 1, 1, 1, 1,
-1.214073, -0.8308328, -3.38905, 1, 1, 1, 1, 1,
-1.201965, -0.2095404, -2.910355, 1, 1, 1, 1, 1,
-1.19553, 1.008915, -0.03884843, 0, 0, 1, 1, 1,
-1.195347, 0.2537564, -0.2791285, 1, 0, 0, 1, 1,
-1.193999, -1.320743, -0.6280215, 1, 0, 0, 1, 1,
-1.186702, -0.9796196, -0.08226822, 1, 0, 0, 1, 1,
-1.184829, 0.9175084, -1.246109, 1, 0, 0, 1, 1,
-1.181376, -0.3882753, -3.077146, 1, 0, 0, 1, 1,
-1.176896, 0.8995887, -0.4698374, 0, 0, 0, 1, 1,
-1.176586, -1.607009, -1.852677, 0, 0, 0, 1, 1,
-1.175888, -0.138633, -1.333841, 0, 0, 0, 1, 1,
-1.175441, -0.1894615, -1.519376, 0, 0, 0, 1, 1,
-1.170387, 0.7785963, -1.254036, 0, 0, 0, 1, 1,
-1.16165, -0.9313158, -2.401063, 0, 0, 0, 1, 1,
-1.156846, 1.49137, -0.6806561, 0, 0, 0, 1, 1,
-1.147692, -0.3255182, -3.724846, 1, 1, 1, 1, 1,
-1.144214, 0.8559504, -2.433291, 1, 1, 1, 1, 1,
-1.142326, 0.4617665, 0.270845, 1, 1, 1, 1, 1,
-1.138414, -0.06864876, -1.751559, 1, 1, 1, 1, 1,
-1.134856, -0.9786921, -3.374895, 1, 1, 1, 1, 1,
-1.130719, -1.606994, -2.186608, 1, 1, 1, 1, 1,
-1.124789, -1.456824, -3.543472, 1, 1, 1, 1, 1,
-1.103994, 0.2427666, -0.5300555, 1, 1, 1, 1, 1,
-1.101697, -0.2703427, -1.970898, 1, 1, 1, 1, 1,
-1.100898, 0.9779426, 1.690538, 1, 1, 1, 1, 1,
-1.093019, -0.1418452, -3.234848, 1, 1, 1, 1, 1,
-1.092839, -0.8920141, -1.641678, 1, 1, 1, 1, 1,
-1.088831, -0.6051278, -2.829873, 1, 1, 1, 1, 1,
-1.088021, 2.289906, 0.2062593, 1, 1, 1, 1, 1,
-1.082514, 0.528105, -1.479775, 1, 1, 1, 1, 1,
-1.079715, -0.6705734, -2.380383, 0, 0, 1, 1, 1,
-1.07847, 0.1937884, -0.5796722, 1, 0, 0, 1, 1,
-1.077475, 1.063213, -0.5043356, 1, 0, 0, 1, 1,
-1.077418, 1.777502, 0.05733538, 1, 0, 0, 1, 1,
-1.063924, -0.08195619, -1.093755, 1, 0, 0, 1, 1,
-1.063816, 1.428529, -1.536789, 1, 0, 0, 1, 1,
-1.055813, 1.848086, -0.394749, 0, 0, 0, 1, 1,
-1.054056, -0.5978868, -3.445158, 0, 0, 0, 1, 1,
-1.042454, 0.2073974, -1.831643, 0, 0, 0, 1, 1,
-1.036505, 0.4772956, -0.53456, 0, 0, 0, 1, 1,
-1.03349, 0.8179073, -0.1009136, 0, 0, 0, 1, 1,
-1.027647, -0.1001173, -0.4476546, 0, 0, 0, 1, 1,
-1.023368, -0.8284889, -1.180312, 0, 0, 0, 1, 1,
-1.022325, 1.545758, -0.6591977, 1, 1, 1, 1, 1,
-1.0219, 1.10914, -1.40122, 1, 1, 1, 1, 1,
-1.021062, -0.5550386, -0.3049864, 1, 1, 1, 1, 1,
-1.01839, 0.1012544, -2.480484, 1, 1, 1, 1, 1,
-1.017162, -1.65973, -2.086021, 1, 1, 1, 1, 1,
-1.016084, -0.7111751, -3.299371, 1, 1, 1, 1, 1,
-1.010389, 0.4911988, -0.6098496, 1, 1, 1, 1, 1,
-1.009973, 1.907681, 0.8834423, 1, 1, 1, 1, 1,
-1.007779, -1.700496, -4.026645, 1, 1, 1, 1, 1,
-1.002264, 1.732852, -0.5877091, 1, 1, 1, 1, 1,
-0.9936152, 1.628591, -1.593503, 1, 1, 1, 1, 1,
-0.9928749, -0.052166, -1.940674, 1, 1, 1, 1, 1,
-0.9925503, 1.527943, 0.0302075, 1, 1, 1, 1, 1,
-0.9844519, -0.2115417, -1.829637, 1, 1, 1, 1, 1,
-0.98176, 0.4736762, -1.225649, 1, 1, 1, 1, 1,
-0.9743763, -0.5487059, -1.625746, 0, 0, 1, 1, 1,
-0.973175, 0.5729212, -0.7122641, 1, 0, 0, 1, 1,
-0.9731129, 0.03144586, -1.067868, 1, 0, 0, 1, 1,
-0.965496, -0.8885732, -2.181251, 1, 0, 0, 1, 1,
-0.960708, -0.1808939, 0.03604021, 1, 0, 0, 1, 1,
-0.9595728, 0.85216, -1.353067, 1, 0, 0, 1, 1,
-0.9576, -0.06596748, -1.117818, 0, 0, 0, 1, 1,
-0.9542688, -1.137498, -2.964827, 0, 0, 0, 1, 1,
-0.9536156, 1.222142, 1.414559, 0, 0, 0, 1, 1,
-0.9489193, 2.160191, 0.9134098, 0, 0, 0, 1, 1,
-0.9474081, -1.96086, -3.819346, 0, 0, 0, 1, 1,
-0.9456381, 0.244557, -1.255555, 0, 0, 0, 1, 1,
-0.9406201, -0.1876664, -3.042927, 0, 0, 0, 1, 1,
-0.9391043, 0.1197509, -1.281784, 1, 1, 1, 1, 1,
-0.9349054, 0.980626, -1.392804, 1, 1, 1, 1, 1,
-0.9344251, -0.9827868, -1.643601, 1, 1, 1, 1, 1,
-0.931541, -0.8905454, -1.493718, 1, 1, 1, 1, 1,
-0.9237694, -0.1397939, -3.440017, 1, 1, 1, 1, 1,
-0.9185889, 2.299844, -0.8743779, 1, 1, 1, 1, 1,
-0.9146172, 0.8633124, -1.988321, 1, 1, 1, 1, 1,
-0.912989, -0.04470691, -2.31784, 1, 1, 1, 1, 1,
-0.9093159, -0.1423373, -2.189353, 1, 1, 1, 1, 1,
-0.9031667, 0.9868251, -1.928959, 1, 1, 1, 1, 1,
-0.9016512, -1.691582, -3.277128, 1, 1, 1, 1, 1,
-0.8938788, 1.260959, -1.081962, 1, 1, 1, 1, 1,
-0.892489, 0.4151036, -1.343412, 1, 1, 1, 1, 1,
-0.8865359, 0.4572169, -2.07883, 1, 1, 1, 1, 1,
-0.8835796, 0.2538853, -1.684888, 1, 1, 1, 1, 1,
-0.8756378, -0.05885435, -1.096718, 0, 0, 1, 1, 1,
-0.8735756, -0.6971323, -0.1768337, 1, 0, 0, 1, 1,
-0.870215, 1.028414, -2.554878, 1, 0, 0, 1, 1,
-0.8694972, -1.097103, -4.303524, 1, 0, 0, 1, 1,
-0.8668249, 0.5296869, -1.318179, 1, 0, 0, 1, 1,
-0.8633152, -2.300451, -1.434796, 1, 0, 0, 1, 1,
-0.8618046, -1.032819, -4.672893, 0, 0, 0, 1, 1,
-0.8539314, -1.87468, -4.322623, 0, 0, 0, 1, 1,
-0.8504622, -1.173691, -2.081108, 0, 0, 0, 1, 1,
-0.8492631, 0.7620319, -1.846778, 0, 0, 0, 1, 1,
-0.8441278, -2.376352, -2.523382, 0, 0, 0, 1, 1,
-0.8407012, -0.3350666, -1.915409, 0, 0, 0, 1, 1,
-0.8380595, -0.5503415, -2.448282, 0, 0, 0, 1, 1,
-0.8343505, 1.051496, 0.4638643, 1, 1, 1, 1, 1,
-0.8302065, -1.985506, -0.6627775, 1, 1, 1, 1, 1,
-0.8288806, 0.9587587, 0.0331175, 1, 1, 1, 1, 1,
-0.8266459, -0.8691086, -2.055425, 1, 1, 1, 1, 1,
-0.8253528, -0.1882486, -1.218077, 1, 1, 1, 1, 1,
-0.814781, 1.119321, -0.3071155, 1, 1, 1, 1, 1,
-0.8144085, 2.606273, 0.4034571, 1, 1, 1, 1, 1,
-0.8130875, -0.5867754, -1.594361, 1, 1, 1, 1, 1,
-0.8006754, -2.146639, -3.431736, 1, 1, 1, 1, 1,
-0.7971166, 0.5844335, -0.1173714, 1, 1, 1, 1, 1,
-0.7969398, 1.00329, 0.1952715, 1, 1, 1, 1, 1,
-0.7937916, 0.9444741, -0.5824009, 1, 1, 1, 1, 1,
-0.7904153, 1.05861, -1.455306, 1, 1, 1, 1, 1,
-0.7894648, -1.562373, -4.386563, 1, 1, 1, 1, 1,
-0.7890875, -0.8613467, -3.954979, 1, 1, 1, 1, 1,
-0.784965, -0.07024143, -1.960129, 0, 0, 1, 1, 1,
-0.784734, 0.9742507, 0.2727982, 1, 0, 0, 1, 1,
-0.7697325, 1.835378, 0.1341128, 1, 0, 0, 1, 1,
-0.7684122, 0.4717148, -1.617829, 1, 0, 0, 1, 1,
-0.7635262, 1.37185, -1.85254, 1, 0, 0, 1, 1,
-0.7633988, -0.8743715, -1.976162, 1, 0, 0, 1, 1,
-0.7628804, -1.616042, -3.919202, 0, 0, 0, 1, 1,
-0.7605315, 0.642616, 0.05970877, 0, 0, 0, 1, 1,
-0.7594293, -0.150936, -1.724697, 0, 0, 0, 1, 1,
-0.7573484, -0.2514139, -1.342535, 0, 0, 0, 1, 1,
-0.7511773, -0.4741763, -3.793777, 0, 0, 0, 1, 1,
-0.746401, -0.7564948, -2.655717, 0, 0, 0, 1, 1,
-0.7412177, 1.201184, 1.194676, 0, 0, 0, 1, 1,
-0.7366396, 0.9484144, -1.488895, 1, 1, 1, 1, 1,
-0.732448, 0.60516, -0.6364043, 1, 1, 1, 1, 1,
-0.7296069, 1.028698, -0.5841947, 1, 1, 1, 1, 1,
-0.7227039, -0.09006555, -0.03320454, 1, 1, 1, 1, 1,
-0.7216222, -0.595553, -0.9545008, 1, 1, 1, 1, 1,
-0.7150466, -0.6047447, -1.788951, 1, 1, 1, 1, 1,
-0.7139915, -0.9058895, -2.251034, 1, 1, 1, 1, 1,
-0.7127371, -2.122321, -1.202826, 1, 1, 1, 1, 1,
-0.710234, -0.0330787, -1.17179, 1, 1, 1, 1, 1,
-0.7004946, -0.4002248, -2.562034, 1, 1, 1, 1, 1,
-0.6986752, -0.886903, -2.474144, 1, 1, 1, 1, 1,
-0.6924557, -0.5399921, -2.089726, 1, 1, 1, 1, 1,
-0.6875318, 0.143715, -2.331556, 1, 1, 1, 1, 1,
-0.6850657, 1.522239, -0.2792943, 1, 1, 1, 1, 1,
-0.6829128, 0.6154225, 1.028537, 1, 1, 1, 1, 1,
-0.6786149, 0.5618963, -1.50189, 0, 0, 1, 1, 1,
-0.678432, -1.462902, -3.477216, 1, 0, 0, 1, 1,
-0.6781043, 0.5154214, -0.532501, 1, 0, 0, 1, 1,
-0.6757707, 0.9069834, 0.2881683, 1, 0, 0, 1, 1,
-0.6750767, -1.797746, -2.938095, 1, 0, 0, 1, 1,
-0.6713277, -0.4567793, -3.006224, 1, 0, 0, 1, 1,
-0.6677067, 1.57583, -1.00916, 0, 0, 0, 1, 1,
-0.6534673, 1.162897, 0.1635505, 0, 0, 0, 1, 1,
-0.6531329, 0.2598374, -0.1066693, 0, 0, 0, 1, 1,
-0.6381536, -1.458278, -3.804536, 0, 0, 0, 1, 1,
-0.6359309, 0.2944359, -1.271272, 0, 0, 0, 1, 1,
-0.6304286, 0.6669762, -2.526212, 0, 0, 0, 1, 1,
-0.6301433, -0.01870344, 0.7376686, 0, 0, 0, 1, 1,
-0.6298857, 2.527449, -0.6372951, 1, 1, 1, 1, 1,
-0.6297325, -0.2867289, -1.511281, 1, 1, 1, 1, 1,
-0.6225312, -1.339169, -3.361512, 1, 1, 1, 1, 1,
-0.6220927, 1.517219, 0.1362859, 1, 1, 1, 1, 1,
-0.6171755, 0.1895691, -0.9412493, 1, 1, 1, 1, 1,
-0.6164621, 0.03714005, -1.789232, 1, 1, 1, 1, 1,
-0.6075781, -0.6178026, -1.495653, 1, 1, 1, 1, 1,
-0.5997806, -0.1742357, -0.9464154, 1, 1, 1, 1, 1,
-0.5971611, 0.04943861, -1.957342, 1, 1, 1, 1, 1,
-0.5961776, -1.242631, -3.258629, 1, 1, 1, 1, 1,
-0.5941874, -0.2772953, -2.481065, 1, 1, 1, 1, 1,
-0.5941817, -0.565621, -2.171302, 1, 1, 1, 1, 1,
-0.5931678, 1.848347, -0.1031117, 1, 1, 1, 1, 1,
-0.5851524, 1.425329, -1.210512, 1, 1, 1, 1, 1,
-0.5843042, -0.6955316, -1.795185, 1, 1, 1, 1, 1,
-0.5828162, 0.2756868, -1.220532, 0, 0, 1, 1, 1,
-0.5796173, 0.6735612, -2.114551, 1, 0, 0, 1, 1,
-0.5787914, 0.9459975, 0.8113435, 1, 0, 0, 1, 1,
-0.5785742, -1.554317, -2.527275, 1, 0, 0, 1, 1,
-0.5760915, -1.931649, -1.809844, 1, 0, 0, 1, 1,
-0.5683315, 1.432744, 0.06591958, 1, 0, 0, 1, 1,
-0.5658239, 1.018989, -0.5602554, 0, 0, 0, 1, 1,
-0.5651196, -0.5611996, -2.18539, 0, 0, 0, 1, 1,
-0.5630071, 1.230928, -1.191741, 0, 0, 0, 1, 1,
-0.5613564, 0.4601797, 0.2717809, 0, 0, 0, 1, 1,
-0.5605336, 0.8047676, -1.383807, 0, 0, 0, 1, 1,
-0.5595346, 0.1526198, -1.031812, 0, 0, 0, 1, 1,
-0.5558807, 0.1795453, -0.1366747, 0, 0, 0, 1, 1,
-0.5527498, -0.6803672, -1.994363, 1, 1, 1, 1, 1,
-0.5498142, -0.6054313, -3.127893, 1, 1, 1, 1, 1,
-0.548105, -0.9727646, -2.55972, 1, 1, 1, 1, 1,
-0.5465827, 0.2473443, -2.245158, 1, 1, 1, 1, 1,
-0.5436845, -0.03375638, -2.196696, 1, 1, 1, 1, 1,
-0.543386, -0.1925507, -0.8807245, 1, 1, 1, 1, 1,
-0.5422323, -0.6950473, -5.947036, 1, 1, 1, 1, 1,
-0.5371417, 0.4410747, -1.842405, 1, 1, 1, 1, 1,
-0.5369573, -0.9552111, -4.640316, 1, 1, 1, 1, 1,
-0.5352912, 0.4073548, 0.5355783, 1, 1, 1, 1, 1,
-0.5290655, 0.3343497, -0.01505996, 1, 1, 1, 1, 1,
-0.52663, 0.7339031, -0.9532784, 1, 1, 1, 1, 1,
-0.5204029, -1.168622, -2.71638, 1, 1, 1, 1, 1,
-0.5196611, 1.430734, 0.2861187, 1, 1, 1, 1, 1,
-0.519289, -0.6827571, -3.963755, 1, 1, 1, 1, 1,
-0.5191228, -0.8486292, -2.974944, 0, 0, 1, 1, 1,
-0.5187446, -0.1395811, -1.700977, 1, 0, 0, 1, 1,
-0.5160841, -0.5692107, -2.592949, 1, 0, 0, 1, 1,
-0.5072103, 0.2435998, -0.4085183, 1, 0, 0, 1, 1,
-0.5070058, -0.2194487, -2.381007, 1, 0, 0, 1, 1,
-0.5061911, -0.4580093, -2.262391, 1, 0, 0, 1, 1,
-0.4996554, 0.8715512, -1.924361, 0, 0, 0, 1, 1,
-0.4982169, 0.7455612, -0.6793879, 0, 0, 0, 1, 1,
-0.4972582, 0.2620012, -0.9814364, 0, 0, 0, 1, 1,
-0.4965973, 1.137962, 0.766265, 0, 0, 0, 1, 1,
-0.4890115, -1.065143, -2.029029, 0, 0, 0, 1, 1,
-0.482676, -0.005429922, -2.83616, 0, 0, 0, 1, 1,
-0.4796254, 1.729836, 0.5611473, 0, 0, 0, 1, 1,
-0.4757438, -1.900443, -2.915997, 1, 1, 1, 1, 1,
-0.4746372, 0.6252441, -1.738268, 1, 1, 1, 1, 1,
-0.4733406, 1.239857, 0.1555265, 1, 1, 1, 1, 1,
-0.4708607, -1.264523, -2.374437, 1, 1, 1, 1, 1,
-0.4647343, 1.673302, 1.803275, 1, 1, 1, 1, 1,
-0.4643549, 0.5326173, -1.190125, 1, 1, 1, 1, 1,
-0.4580642, 0.08715515, -1.524172, 1, 1, 1, 1, 1,
-0.4537249, 1.157455, 1.124733, 1, 1, 1, 1, 1,
-0.4524695, -0.5776122, -1.626104, 1, 1, 1, 1, 1,
-0.451372, 0.6717185, 0.3656605, 1, 1, 1, 1, 1,
-0.445002, 0.1158746, -2.49545, 1, 1, 1, 1, 1,
-0.443157, 0.217621, -1.399607, 1, 1, 1, 1, 1,
-0.4418259, -0.3094426, -2.881542, 1, 1, 1, 1, 1,
-0.4391458, -0.3346535, -2.2095, 1, 1, 1, 1, 1,
-0.4379846, -0.5605873, -3.220103, 1, 1, 1, 1, 1,
-0.4351195, -0.2425566, -1.904477, 0, 0, 1, 1, 1,
-0.4340286, -0.3367101, -2.775982, 1, 0, 0, 1, 1,
-0.4322502, -0.89205, -3.130939, 1, 0, 0, 1, 1,
-0.4308203, -1.179875, -2.613791, 1, 0, 0, 1, 1,
-0.4297493, -0.555954, -2.609046, 1, 0, 0, 1, 1,
-0.4286774, -0.246125, -2.505743, 1, 0, 0, 1, 1,
-0.4286234, 0.3985294, -0.1386691, 0, 0, 0, 1, 1,
-0.4271601, -1.027578, -2.982458, 0, 0, 0, 1, 1,
-0.4263924, 1.528378, 1.304276, 0, 0, 0, 1, 1,
-0.4241909, 0.8177661, -1.304655, 0, 0, 0, 1, 1,
-0.4226098, 0.7290038, -0.6368705, 0, 0, 0, 1, 1,
-0.4219137, 1.401677, -0.6641278, 0, 0, 0, 1, 1,
-0.4163511, -0.1019541, -2.291119, 0, 0, 0, 1, 1,
-0.4156801, 0.5707626, -0.8115631, 1, 1, 1, 1, 1,
-0.4085863, 0.9774018, -0.2067982, 1, 1, 1, 1, 1,
-0.4062543, 1.305457, 0.9075665, 1, 1, 1, 1, 1,
-0.4021174, -2.036124, -1.668024, 1, 1, 1, 1, 1,
-0.4008712, 0.4188023, -1.331492, 1, 1, 1, 1, 1,
-0.3947021, 0.228563, -0.7250026, 1, 1, 1, 1, 1,
-0.392751, 1.307855, -0.6859888, 1, 1, 1, 1, 1,
-0.3892256, 0.03750522, -3.174505, 1, 1, 1, 1, 1,
-0.3859496, 0.6040987, 0.4256008, 1, 1, 1, 1, 1,
-0.3833077, -0.7089515, -2.922314, 1, 1, 1, 1, 1,
-0.3817453, 0.0595419, -1.186604, 1, 1, 1, 1, 1,
-0.3735924, -0.05322996, -1.358794, 1, 1, 1, 1, 1,
-0.3730373, 1.031406, 0.7944531, 1, 1, 1, 1, 1,
-0.3629481, -1.671366, -3.211325, 1, 1, 1, 1, 1,
-0.3504073, -0.296185, -1.839284, 1, 1, 1, 1, 1,
-0.3495073, -1.811696, -2.391909, 0, 0, 1, 1, 1,
-0.3463957, -0.1518538, -3.171124, 1, 0, 0, 1, 1,
-0.3455333, -0.09793179, -1.63046, 1, 0, 0, 1, 1,
-0.3454221, -1.908202, -3.585487, 1, 0, 0, 1, 1,
-0.3452793, -0.7821962, -4.69459, 1, 0, 0, 1, 1,
-0.3429666, -0.9516409, -5.964308, 1, 0, 0, 1, 1,
-0.340133, -0.3776446, -2.560871, 0, 0, 0, 1, 1,
-0.3380347, 0.9907557, -2.393471, 0, 0, 0, 1, 1,
-0.3361229, -0.7121353, -0.423573, 0, 0, 0, 1, 1,
-0.3359941, -0.9605493, -3.49736, 0, 0, 0, 1, 1,
-0.3358352, 0.4035487, -0.6354622, 0, 0, 0, 1, 1,
-0.3355214, 0.8944361, -1.300883, 0, 0, 0, 1, 1,
-0.3344073, -0.07160772, -0.2935453, 0, 0, 0, 1, 1,
-0.3307058, 1.177808, -1.374553, 1, 1, 1, 1, 1,
-0.3232327, 0.5812069, -1.471747, 1, 1, 1, 1, 1,
-0.3209668, -1.261933, -3.693764, 1, 1, 1, 1, 1,
-0.3193853, -0.126324, -1.271799, 1, 1, 1, 1, 1,
-0.3187926, -0.4227176, -2.763063, 1, 1, 1, 1, 1,
-0.317902, 0.3969138, -3.050117, 1, 1, 1, 1, 1,
-0.3143072, -1.051343, -2.027799, 1, 1, 1, 1, 1,
-0.3114154, 0.7734923, -1.203707, 1, 1, 1, 1, 1,
-0.3103531, 0.1759773, -0.1102766, 1, 1, 1, 1, 1,
-0.3102387, 0.8837351, 0.3404329, 1, 1, 1, 1, 1,
-0.3060763, -2.127298, -1.916684, 1, 1, 1, 1, 1,
-0.3046945, 0.1600172, 0.167385, 1, 1, 1, 1, 1,
-0.3045756, -0.5356433, -3.389627, 1, 1, 1, 1, 1,
-0.3032747, 1.824225, 0.8345586, 1, 1, 1, 1, 1,
-0.2890061, 1.197555, 0.06970538, 1, 1, 1, 1, 1,
-0.2863706, -0.5393032, -4.520897, 0, 0, 1, 1, 1,
-0.285473, 0.4058792, 0.2234941, 1, 0, 0, 1, 1,
-0.2819778, 0.5457824, -0.9114855, 1, 0, 0, 1, 1,
-0.280972, 0.9660918, -0.2598573, 1, 0, 0, 1, 1,
-0.2779761, -0.7641489, -4.978893, 1, 0, 0, 1, 1,
-0.277233, 0.03070447, -1.799782, 1, 0, 0, 1, 1,
-0.2758413, 1.36973, 1.863183, 0, 0, 0, 1, 1,
-0.2735947, -0.5939765, -2.397347, 0, 0, 0, 1, 1,
-0.2685747, -0.1300529, -1.418083, 0, 0, 0, 1, 1,
-0.267946, -0.676127, -2.596884, 0, 0, 0, 1, 1,
-0.2655607, -0.5987598, -2.966279, 0, 0, 0, 1, 1,
-0.2634638, 0.7554482, -0.3292398, 0, 0, 0, 1, 1,
-0.2613617, 0.9130326, -0.5606765, 0, 0, 0, 1, 1,
-0.2535081, -1.691524, -3.20171, 1, 1, 1, 1, 1,
-0.2525178, 0.3178723, -0.04008503, 1, 1, 1, 1, 1,
-0.2478944, 0.1223648, -2.212943, 1, 1, 1, 1, 1,
-0.2468295, -0.2215297, -3.254029, 1, 1, 1, 1, 1,
-0.2447568, -0.9956548, -4.574699, 1, 1, 1, 1, 1,
-0.2432625, 0.3131351, -0.9284932, 1, 1, 1, 1, 1,
-0.2422622, 1.371637, -1.240003, 1, 1, 1, 1, 1,
-0.2373191, 0.7447935, -0.7753092, 1, 1, 1, 1, 1,
-0.2358664, -0.06751436, -2.93731, 1, 1, 1, 1, 1,
-0.2326968, -1.361678, -3.408772, 1, 1, 1, 1, 1,
-0.2325018, -0.5332922, -2.263463, 1, 1, 1, 1, 1,
-0.2266293, -0.1035401, -1.262193, 1, 1, 1, 1, 1,
-0.2265543, -0.8500091, -4.20609, 1, 1, 1, 1, 1,
-0.2256865, 1.565094, 0.004457536, 1, 1, 1, 1, 1,
-0.225085, -0.1399509, -2.074777, 1, 1, 1, 1, 1,
-0.2246055, -1.198086, -1.370477, 0, 0, 1, 1, 1,
-0.2239218, 1.384553, -1.222251, 1, 0, 0, 1, 1,
-0.2219029, 0.502548, -0.5369838, 1, 0, 0, 1, 1,
-0.2140043, 0.962744, -0.6962932, 1, 0, 0, 1, 1,
-0.2131092, 1.695976, 0.2767023, 1, 0, 0, 1, 1,
-0.2091416, -0.5865359, -3.373356, 1, 0, 0, 1, 1,
-0.2079295, -1.242033, -2.394661, 0, 0, 0, 1, 1,
-0.1993679, 0.4135644, 0.2929029, 0, 0, 0, 1, 1,
-0.1980191, -0.3695147, -0.9549202, 0, 0, 0, 1, 1,
-0.196798, -1.394843, -5.12115, 0, 0, 0, 1, 1,
-0.1965883, 0.3727457, -1.125867, 0, 0, 0, 1, 1,
-0.1954322, 1.612425, 1.553993, 0, 0, 0, 1, 1,
-0.1950911, 2.12407, 0.9712601, 0, 0, 0, 1, 1,
-0.1929426, 0.04037037, -1.692629, 1, 1, 1, 1, 1,
-0.191589, -0.8002264, -5.035483, 1, 1, 1, 1, 1,
-0.1909424, 0.6534947, -0.3623024, 1, 1, 1, 1, 1,
-0.1906324, 0.9584976, 0.2225771, 1, 1, 1, 1, 1,
-0.1903235, 0.2907797, -1.6234, 1, 1, 1, 1, 1,
-0.1902023, -1.040609, -0.8571895, 1, 1, 1, 1, 1,
-0.1897215, 0.4527785, -2.627942, 1, 1, 1, 1, 1,
-0.1883052, 2.480399, -0.2505766, 1, 1, 1, 1, 1,
-0.1830413, 2.151054, 0.3722529, 1, 1, 1, 1, 1,
-0.1768249, 1.055586, 2.12835, 1, 1, 1, 1, 1,
-0.1652476, 0.2499611, -2.288134, 1, 1, 1, 1, 1,
-0.1648523, 0.2245891, -0.3021144, 1, 1, 1, 1, 1,
-0.1644766, 0.5145086, -0.7644435, 1, 1, 1, 1, 1,
-0.1644006, 0.3107468, -1.463599, 1, 1, 1, 1, 1,
-0.1640673, 0.3893517, -0.7090293, 1, 1, 1, 1, 1,
-0.1614982, 0.9029266, -2.258051, 0, 0, 1, 1, 1,
-0.1597387, 0.1538066, -1.066811, 1, 0, 0, 1, 1,
-0.158326, 0.02152865, -1.592979, 1, 0, 0, 1, 1,
-0.1554485, -0.474115, -2.353117, 1, 0, 0, 1, 1,
-0.1534781, 0.3886288, -2.340451, 1, 0, 0, 1, 1,
-0.1495854, 0.6492814, -0.2239856, 1, 0, 0, 1, 1,
-0.1426139, 0.04552256, -1.544146, 0, 0, 0, 1, 1,
-0.1425249, 1.855828, 1.187587, 0, 0, 0, 1, 1,
-0.1411976, -0.2096741, -1.776621, 0, 0, 0, 1, 1,
-0.1354471, 0.4988638, -0.5819358, 0, 0, 0, 1, 1,
-0.1329277, 0.9071699, 0.1155265, 0, 0, 0, 1, 1,
-0.127964, 0.7065841, 1.173712, 0, 0, 0, 1, 1,
-0.1261079, -1.488423, -2.397731, 0, 0, 0, 1, 1,
-0.1254763, -0.2387294, -1.79794, 1, 1, 1, 1, 1,
-0.1249021, 0.3573257, -0.6086842, 1, 1, 1, 1, 1,
-0.1202151, -0.8392774, -4.916783, 1, 1, 1, 1, 1,
-0.113808, 1.385184, -1.185206, 1, 1, 1, 1, 1,
-0.1122507, 0.2843817, 0.3170966, 1, 1, 1, 1, 1,
-0.1093334, 1.083413, -1.427029, 1, 1, 1, 1, 1,
-0.1085353, -1.479015, -3.333662, 1, 1, 1, 1, 1,
-0.1082031, 0.591623, -0.853587, 1, 1, 1, 1, 1,
-0.1059932, 1.789571, 0.2652137, 1, 1, 1, 1, 1,
-0.1041, -0.480789, -4.0997, 1, 1, 1, 1, 1,
-0.104026, -1.303508, -3.737831, 1, 1, 1, 1, 1,
-0.09748744, -1.050995, -2.142699, 1, 1, 1, 1, 1,
-0.09691629, 0.1886832, 0.790522, 1, 1, 1, 1, 1,
-0.09617978, -0.3620422, -2.134936, 1, 1, 1, 1, 1,
-0.09420791, 1.253504, 0.7043216, 1, 1, 1, 1, 1,
-0.09326825, 0.6512107, -0.3985107, 0, 0, 1, 1, 1,
-0.09317608, 1.02511, 0.02292962, 1, 0, 0, 1, 1,
-0.08849408, 0.4133714, -1.116725, 1, 0, 0, 1, 1,
-0.08275701, -0.3119181, -0.8505546, 1, 0, 0, 1, 1,
-0.08226766, -1.263895, -2.495025, 1, 0, 0, 1, 1,
-0.08199016, -1.815303, -3.3506, 1, 0, 0, 1, 1,
-0.08173203, 0.04021731, -0.671328, 0, 0, 0, 1, 1,
-0.07985096, -0.07919516, -1.914236, 0, 0, 0, 1, 1,
-0.0781962, 0.1114466, 0.08632079, 0, 0, 0, 1, 1,
-0.077292, 0.459347, 0.1660643, 0, 0, 0, 1, 1,
-0.07476119, 0.673799, -0.5237674, 0, 0, 0, 1, 1,
-0.07407035, 0.1797944, -0.0807837, 0, 0, 0, 1, 1,
-0.07393137, 1.035717, 0.5552613, 0, 0, 0, 1, 1,
-0.06164145, -0.1583302, -4.129782, 1, 1, 1, 1, 1,
-0.05901844, -0.5018119, -3.04353, 1, 1, 1, 1, 1,
-0.05268075, -0.6721981, -3.88015, 1, 1, 1, 1, 1,
-0.05146217, -1.953744, -4.326255, 1, 1, 1, 1, 1,
-0.04991404, -0.5121018, -2.732312, 1, 1, 1, 1, 1,
-0.04751162, 0.2813315, -2.039058, 1, 1, 1, 1, 1,
-0.03786386, 1.558346, 0.7481858, 1, 1, 1, 1, 1,
-0.03484614, 0.9227358, -1.010683, 1, 1, 1, 1, 1,
-0.03300297, -1.027017, -3.096976, 1, 1, 1, 1, 1,
-0.02825833, -0.05159728, -1.651961, 1, 1, 1, 1, 1,
-0.02471072, 1.047994, 0.9099643, 1, 1, 1, 1, 1,
-0.02289721, -0.02379538, -3.198726, 1, 1, 1, 1, 1,
-0.02288943, 0.636951, -0.9426445, 1, 1, 1, 1, 1,
-0.0193354, -1.078189, -4.638541, 1, 1, 1, 1, 1,
-0.01769736, 1.210639, -0.1754259, 1, 1, 1, 1, 1,
-0.01161295, 1.185593, -0.8272591, 0, 0, 1, 1, 1,
-0.01025768, -0.5092532, -1.689834, 1, 0, 0, 1, 1,
-0.004345797, -0.945492, -3.505482, 1, 0, 0, 1, 1,
-0.001043734, -0.03324734, -2.323791, 1, 0, 0, 1, 1,
-0.0002213194, 1.215937, 0.1580994, 1, 0, 0, 1, 1,
0.01526831, 0.7540426, 0.09555306, 1, 0, 0, 1, 1,
0.01566001, -0.8713078, 4.718494, 0, 0, 0, 1, 1,
0.01774263, -1.548478, 1.946519, 0, 0, 0, 1, 1,
0.01800182, -1.248141, 2.532133, 0, 0, 0, 1, 1,
0.01849207, 0.2771548, -1.12359, 0, 0, 0, 1, 1,
0.01932851, -0.3871059, 2.209752, 0, 0, 0, 1, 1,
0.0204941, -1.360193, 1.315687, 0, 0, 0, 1, 1,
0.02268219, -1.560961, 2.655783, 0, 0, 0, 1, 1,
0.02393722, 0.3959378, 1.187205, 1, 1, 1, 1, 1,
0.02673784, -0.2169311, 3.888603, 1, 1, 1, 1, 1,
0.02805215, 0.1947181, 1.469637, 1, 1, 1, 1, 1,
0.02910196, -0.5408145, 1.25129, 1, 1, 1, 1, 1,
0.03147604, -0.3603947, 2.234622, 1, 1, 1, 1, 1,
0.0333225, -0.212013, 2.223105, 1, 1, 1, 1, 1,
0.0394861, -0.3098266, 2.951079, 1, 1, 1, 1, 1,
0.04453653, 0.7041309, 1.160977, 1, 1, 1, 1, 1,
0.04552769, 0.5967541, 0.4649468, 1, 1, 1, 1, 1,
0.046576, 1.291764, 0.5518975, 1, 1, 1, 1, 1,
0.05024779, -1.31197, 2.933143, 1, 1, 1, 1, 1,
0.05680954, 0.04879238, 0.6280064, 1, 1, 1, 1, 1,
0.06126998, -0.2409694, 3.108292, 1, 1, 1, 1, 1,
0.0619458, -0.684799, 2.96404, 1, 1, 1, 1, 1,
0.06351322, 2.202215, 0.3074218, 1, 1, 1, 1, 1,
0.06979864, -0.3708749, 4.696017, 0, 0, 1, 1, 1,
0.07135355, 0.0006648098, 0.07744652, 1, 0, 0, 1, 1,
0.07222419, -0.290698, 1.538613, 1, 0, 0, 1, 1,
0.07461293, -1.054397, 2.597524, 1, 0, 0, 1, 1,
0.07520866, 2.032455, -1.242519, 1, 0, 0, 1, 1,
0.07692404, -0.5845636, 3.066068, 1, 0, 0, 1, 1,
0.08330742, 1.329364, -1.829668, 0, 0, 0, 1, 1,
0.08369286, -0.2993776, 1.298465, 0, 0, 0, 1, 1,
0.08462842, 0.3543301, -0.09353226, 0, 0, 0, 1, 1,
0.08581425, 1.047358, -0.472652, 0, 0, 0, 1, 1,
0.0878277, 0.5748264, 1.328388, 0, 0, 0, 1, 1,
0.08913504, 0.2631025, -1.030865, 0, 0, 0, 1, 1,
0.09024809, 0.3613504, 0.1722713, 0, 0, 0, 1, 1,
0.09049361, -0.9822099, 3.401624, 1, 1, 1, 1, 1,
0.0905456, -1.175184, 4.601106, 1, 1, 1, 1, 1,
0.09239483, 0.6851662, -0.410208, 1, 1, 1, 1, 1,
0.09515019, 0.8099009, 0.2198798, 1, 1, 1, 1, 1,
0.09602438, -0.08693529, 1.413667, 1, 1, 1, 1, 1,
0.1002942, -0.1109775, 2.518476, 1, 1, 1, 1, 1,
0.1015636, 2.128292, 0.57353, 1, 1, 1, 1, 1,
0.1027323, 0.2227488, 1.257333, 1, 1, 1, 1, 1,
0.1030593, -0.1034374, 1.7528, 1, 1, 1, 1, 1,
0.1063319, 1.565687, -0.2130266, 1, 1, 1, 1, 1,
0.1106283, -2.102426, 2.949494, 1, 1, 1, 1, 1,
0.1107766, 0.5509088, 2.165224, 1, 1, 1, 1, 1,
0.1135401, 0.458761, -0.7347651, 1, 1, 1, 1, 1,
0.1184366, 0.4182698, 0.5249378, 1, 1, 1, 1, 1,
0.1200671, 0.121323, 0.4956469, 1, 1, 1, 1, 1,
0.1209848, 0.7871736, 0.1127168, 0, 0, 1, 1, 1,
0.1259284, -0.9853826, 0.4694872, 1, 0, 0, 1, 1,
0.1297562, 0.647626, 1.447934, 1, 0, 0, 1, 1,
0.133904, 0.8049445, -0.7402837, 1, 0, 0, 1, 1,
0.1345525, -0.5446843, 1.906652, 1, 0, 0, 1, 1,
0.1348848, -0.4594208, 2.151604, 1, 0, 0, 1, 1,
0.137272, -1.605385, 3.388437, 0, 0, 0, 1, 1,
0.1394157, 0.01735878, 0.2572059, 0, 0, 0, 1, 1,
0.1442673, -0.9207125, 3.891943, 0, 0, 0, 1, 1,
0.1472908, -1.025775, 4.318191, 0, 0, 0, 1, 1,
0.148613, 1.893888, 0.8505015, 0, 0, 0, 1, 1,
0.1486832, 0.3427549, -0.767445, 0, 0, 0, 1, 1,
0.1502446, 0.1821144, -0.3000183, 0, 0, 0, 1, 1,
0.1525054, 0.05031898, 2.492319, 1, 1, 1, 1, 1,
0.1542656, 0.8396724, 0.5087581, 1, 1, 1, 1, 1,
0.1551522, -1.043031, 4.268834, 1, 1, 1, 1, 1,
0.156664, -2.318934, 2.444211, 1, 1, 1, 1, 1,
0.1578968, 1.062645, -0.3751349, 1, 1, 1, 1, 1,
0.1591976, 0.6053964, 0.5181711, 1, 1, 1, 1, 1,
0.1605211, -0.001670295, 0.6707167, 1, 1, 1, 1, 1,
0.1624295, -0.9803007, 4.296392, 1, 1, 1, 1, 1,
0.1634529, -0.1543585, 2.528157, 1, 1, 1, 1, 1,
0.1656814, 1.816385, 0.6185632, 1, 1, 1, 1, 1,
0.1667493, 1.174623, 1.413497, 1, 1, 1, 1, 1,
0.1673555, -1.447594, 2.705493, 1, 1, 1, 1, 1,
0.16786, 0.9735725, -1.009072, 1, 1, 1, 1, 1,
0.1705736, 0.7511029, -3.333487, 1, 1, 1, 1, 1,
0.1749975, -1.190745, 3.478522, 1, 1, 1, 1, 1,
0.1780002, -0.0613348, 1.403407, 0, 0, 1, 1, 1,
0.1833232, -0.5657772, 3.160998, 1, 0, 0, 1, 1,
0.1847802, 1.412257, -0.9654991, 1, 0, 0, 1, 1,
0.18796, 0.1397931, 1.580692, 1, 0, 0, 1, 1,
0.1928588, -0.08083814, 0.7263039, 1, 0, 0, 1, 1,
0.1936404, 0.7308785, 1.301474, 1, 0, 0, 1, 1,
0.2002895, -0.009516461, 1.534119, 0, 0, 0, 1, 1,
0.202908, 1.142644, 1.54318, 0, 0, 0, 1, 1,
0.2048354, 0.5676042, -1.186064, 0, 0, 0, 1, 1,
0.2064842, 0.3679141, 0.2443396, 0, 0, 0, 1, 1,
0.208218, 2.127708, 2.558602, 0, 0, 0, 1, 1,
0.2090846, -0.6129165, 1.581633, 0, 0, 0, 1, 1,
0.2167083, -1.221688, 5.113964, 0, 0, 0, 1, 1,
0.2168331, 1.72763, 0.6457347, 1, 1, 1, 1, 1,
0.2174529, 0.6307166, -0.3630549, 1, 1, 1, 1, 1,
0.2189611, -1.364809, 1.556427, 1, 1, 1, 1, 1,
0.2257296, 1.635412, 0.06803513, 1, 1, 1, 1, 1,
0.2284064, -1.096205, 0.591491, 1, 1, 1, 1, 1,
0.2292166, -0.0252838, 2.263191, 1, 1, 1, 1, 1,
0.2294227, -0.004616775, 2.316489, 1, 1, 1, 1, 1,
0.2296839, 0.171781, 2.67656, 1, 1, 1, 1, 1,
0.2357329, -1.876905, 1.788567, 1, 1, 1, 1, 1,
0.2362529, -2.427951, 3.618568, 1, 1, 1, 1, 1,
0.2407913, -0.6025426, 2.623317, 1, 1, 1, 1, 1,
0.2414822, 0.850332, -1.467669, 1, 1, 1, 1, 1,
0.2418757, 1.058133, 0.847838, 1, 1, 1, 1, 1,
0.2478691, 2.197515, -0.7313555, 1, 1, 1, 1, 1,
0.2509904, 0.9124986, 0.4105166, 1, 1, 1, 1, 1,
0.2561818, -0.1735649, 1.501977, 0, 0, 1, 1, 1,
0.2584536, -0.5825242, 1.824101, 1, 0, 0, 1, 1,
0.2598926, -0.4417292, 3.337941, 1, 0, 0, 1, 1,
0.2627532, 1.416271, 0.3590074, 1, 0, 0, 1, 1,
0.2634429, 0.6860189, 0.2052551, 1, 0, 0, 1, 1,
0.2691594, -0.1583217, 1.79243, 1, 0, 0, 1, 1,
0.2763773, -2.16528, 1.510926, 0, 0, 0, 1, 1,
0.2932897, 0.8590672, -0.0582707, 0, 0, 0, 1, 1,
0.2951535, -0.9379025, 3.154096, 0, 0, 0, 1, 1,
0.2956385, 0.2835673, 1.065855, 0, 0, 0, 1, 1,
0.2962032, 2.960598, 0.2925703, 0, 0, 0, 1, 1,
0.2991409, -0.06989539, 2.123201, 0, 0, 0, 1, 1,
0.2993188, 0.3098593, 1.264363, 0, 0, 0, 1, 1,
0.3016307, 0.02846387, 1.685795, 1, 1, 1, 1, 1,
0.3022, -1.484931, 2.043093, 1, 1, 1, 1, 1,
0.3022912, 0.706292, 0.8767998, 1, 1, 1, 1, 1,
0.3068417, 0.4887336, -0.1712818, 1, 1, 1, 1, 1,
0.3097169, -0.4597686, 2.506014, 1, 1, 1, 1, 1,
0.3168136, -0.2303812, 1.714862, 1, 1, 1, 1, 1,
0.3183052, 0.4487209, -1.445111, 1, 1, 1, 1, 1,
0.3214937, -0.9902696, 1.902372, 1, 1, 1, 1, 1,
0.3223839, -0.7293618, 3.760769, 1, 1, 1, 1, 1,
0.3249347, -1.07325, 2.970758, 1, 1, 1, 1, 1,
0.3255911, -1.302195, 4.153067, 1, 1, 1, 1, 1,
0.3271864, 1.068145, 0.8772002, 1, 1, 1, 1, 1,
0.3286096, -0.09373488, 1.335239, 1, 1, 1, 1, 1,
0.3295471, -0.7383103, 0.9270044, 1, 1, 1, 1, 1,
0.3329659, 0.386073, 1.983143, 1, 1, 1, 1, 1,
0.3353048, 1.71454, -1.617528, 0, 0, 1, 1, 1,
0.3373775, -1.177122, 3.195267, 1, 0, 0, 1, 1,
0.3425689, 0.578692, 1.115726, 1, 0, 0, 1, 1,
0.34446, -1.309651, 1.680715, 1, 0, 0, 1, 1,
0.3453796, -0.7826235, 3.096569, 1, 0, 0, 1, 1,
0.3469059, -0.4071828, 3.96061, 1, 0, 0, 1, 1,
0.3485164, 1.514319, 1.345718, 0, 0, 0, 1, 1,
0.348887, 0.2184848, 3.055808, 0, 0, 0, 1, 1,
0.3492391, -0.73749, 5.053323, 0, 0, 0, 1, 1,
0.3559235, -0.9105071, 3.17859, 0, 0, 0, 1, 1,
0.3599727, 0.6756238, 0.8747822, 0, 0, 0, 1, 1,
0.3647508, -2.541779, 2.611103, 0, 0, 0, 1, 1,
0.364931, -0.3642576, 2.37238, 0, 0, 0, 1, 1,
0.3665888, -0.4980198, 0.6904213, 1, 1, 1, 1, 1,
0.3712808, 1.028275, 1.863886, 1, 1, 1, 1, 1,
0.371368, -0.7332419, 3.791015, 1, 1, 1, 1, 1,
0.371456, 0.1572794, 0.8692806, 1, 1, 1, 1, 1,
0.3725323, 0.2540953, -0.8046043, 1, 1, 1, 1, 1,
0.3756341, 1.129482, 0.5536817, 1, 1, 1, 1, 1,
0.3778212, -0.6176895, 1.341201, 1, 1, 1, 1, 1,
0.3794617, -0.6961129, 3.578801, 1, 1, 1, 1, 1,
0.3881354, 0.3395638, -1.335247, 1, 1, 1, 1, 1,
0.3881825, -1.000072, 2.955634, 1, 1, 1, 1, 1,
0.3978725, -0.7819049, 0.7203231, 1, 1, 1, 1, 1,
0.3981395, 0.4736576, -0.3489192, 1, 1, 1, 1, 1,
0.4003398, -0.4699475, 3.339975, 1, 1, 1, 1, 1,
0.4031201, -0.00190197, 2.066214, 1, 1, 1, 1, 1,
0.4065395, -0.308417, 3.688652, 1, 1, 1, 1, 1,
0.4075283, 1.596753, 0.5337039, 0, 0, 1, 1, 1,
0.4100235, 0.3842581, 1.197045, 1, 0, 0, 1, 1,
0.4106799, 1.535566, -1.604978, 1, 0, 0, 1, 1,
0.410732, 0.0532227, 0.4407658, 1, 0, 0, 1, 1,
0.410832, 1.293511, -1.727005, 1, 0, 0, 1, 1,
0.4116976, -0.1026793, 2.208075, 1, 0, 0, 1, 1,
0.4121412, 0.4941305, -0.02611604, 0, 0, 0, 1, 1,
0.4129527, -0.7574088, 3.164715, 0, 0, 0, 1, 1,
0.41538, -1.778361, 0.3918946, 0, 0, 0, 1, 1,
0.4164622, -1.716138, 3.724262, 0, 0, 0, 1, 1,
0.4226741, 1.047241, 0.7609855, 0, 0, 0, 1, 1,
0.4288478, -0.4160489, 1.629779, 0, 0, 0, 1, 1,
0.4294272, -0.7697434, 1.885535, 0, 0, 0, 1, 1,
0.4360844, 0.1870046, 2.062347, 1, 1, 1, 1, 1,
0.436302, 1.267749, 0.2333164, 1, 1, 1, 1, 1,
0.4394855, 0.3021418, 2.926135, 1, 1, 1, 1, 1,
0.4401181, 0.5311599, -0.2794316, 1, 1, 1, 1, 1,
0.4452307, -0.1596413, 3.078154, 1, 1, 1, 1, 1,
0.44563, 0.5041112, 0.7440346, 1, 1, 1, 1, 1,
0.4468197, -0.8795979, 4.051159, 1, 1, 1, 1, 1,
0.4485264, 0.8367798, -1.294422, 1, 1, 1, 1, 1,
0.4498292, 1.462159, 0.2781009, 1, 1, 1, 1, 1,
0.4543578, 1.672256, 1.439913, 1, 1, 1, 1, 1,
0.4555623, -1.270112, 4.73473, 1, 1, 1, 1, 1,
0.4597206, -1.346349, 2.039638, 1, 1, 1, 1, 1,
0.4656426, -0.472528, 1.790321, 1, 1, 1, 1, 1,
0.4660046, 1.113936, 1.275495, 1, 1, 1, 1, 1,
0.4677932, 0.09628645, -0.2807544, 1, 1, 1, 1, 1,
0.4741221, -0.4033895, 0.6015717, 0, 0, 1, 1, 1,
0.4753281, 0.6168826, 2.124948, 1, 0, 0, 1, 1,
0.4857845, -1.872519, 4.848097, 1, 0, 0, 1, 1,
0.4882099, -0.7891022, 2.49729, 1, 0, 0, 1, 1,
0.4894662, 0.6641477, 0.5755522, 1, 0, 0, 1, 1,
0.4907873, 0.08193316, 2.769612, 1, 0, 0, 1, 1,
0.4973575, -0.4660117, 0.8877859, 0, 0, 0, 1, 1,
0.497661, 0.3020687, 0.3752578, 0, 0, 0, 1, 1,
0.4979123, 1.234674, 0.3600051, 0, 0, 0, 1, 1,
0.5022228, -2.116308, 3.146361, 0, 0, 0, 1, 1,
0.5054964, 0.6613739, -0.6220315, 0, 0, 0, 1, 1,
0.5062596, 1.625926, 0.0684124, 0, 0, 0, 1, 1,
0.5076613, -1.570641, 4.440424, 0, 0, 0, 1, 1,
0.5168825, -1.817901, 2.945686, 1, 1, 1, 1, 1,
0.5203123, -1.275158, 2.092277, 1, 1, 1, 1, 1,
0.5203738, -0.9235655, 2.6933, 1, 1, 1, 1, 1,
0.5232036, -0.007121627, 2.06546, 1, 1, 1, 1, 1,
0.5277131, -1.423012, 3.527278, 1, 1, 1, 1, 1,
0.5280263, -0.05537532, 1.791731, 1, 1, 1, 1, 1,
0.5343848, -1.137895, 3.6249, 1, 1, 1, 1, 1,
0.5469702, 0.2051208, 1.859505, 1, 1, 1, 1, 1,
0.5515426, 2.563494, 0.381076, 1, 1, 1, 1, 1,
0.5520597, 0.1167987, 1.348891, 1, 1, 1, 1, 1,
0.566686, 0.6751402, 0.3523507, 1, 1, 1, 1, 1,
0.57285, 0.08921716, 1.78641, 1, 1, 1, 1, 1,
0.5778973, 0.2966907, 1.793879, 1, 1, 1, 1, 1,
0.5791062, 0.9699489, 1.159487, 1, 1, 1, 1, 1,
0.5842112, 1.601534, 1.530182, 1, 1, 1, 1, 1,
0.5861694, -1.152147, 1.956904, 0, 0, 1, 1, 1,
0.5898588, -0.01452991, 3.144135, 1, 0, 0, 1, 1,
0.5901206, -1.059455, 0.9229708, 1, 0, 0, 1, 1,
0.5912005, 2.045523, -0.188898, 1, 0, 0, 1, 1,
0.6007919, -0.3666282, 2.844874, 1, 0, 0, 1, 1,
0.6045771, -0.8517287, 1.735178, 1, 0, 0, 1, 1,
0.6051877, -0.01578275, 0.5272973, 0, 0, 0, 1, 1,
0.6053014, -0.5809854, 0.2470737, 0, 0, 0, 1, 1,
0.605951, 0.1864253, 2.149958, 0, 0, 0, 1, 1,
0.6084757, -0.3482949, 1.704204, 0, 0, 0, 1, 1,
0.6103072, 0.8618031, 0.3130725, 0, 0, 0, 1, 1,
0.6121985, 0.9560609, -0.1051735, 0, 0, 0, 1, 1,
0.6183949, 0.5549496, 0.2420482, 0, 0, 0, 1, 1,
0.6203938, 1.219211, 0.4106294, 1, 1, 1, 1, 1,
0.6248336, 0.2329368, 1.720081, 1, 1, 1, 1, 1,
0.6256942, 1.259202, 1.929363, 1, 1, 1, 1, 1,
0.6261185, 1.499815, -0.478684, 1, 1, 1, 1, 1,
0.6287925, -0.3661595, 2.260402, 1, 1, 1, 1, 1,
0.6292213, 1.382475, 0.2516725, 1, 1, 1, 1, 1,
0.6303571, -0.6898247, 3.120572, 1, 1, 1, 1, 1,
0.6349752, -0.005392473, 0.2727822, 1, 1, 1, 1, 1,
0.6356104, -0.5615159, -0.06295491, 1, 1, 1, 1, 1,
0.6360331, -0.9418046, 2.769637, 1, 1, 1, 1, 1,
0.64522, 1.146518, 1.19391, 1, 1, 1, 1, 1,
0.6493416, 0.6615983, 0.7885975, 1, 1, 1, 1, 1,
0.6548361, -0.8107325, 1.374129, 1, 1, 1, 1, 1,
0.6555016, -0.7763742, 3.007874, 1, 1, 1, 1, 1,
0.6562794, -0.6625531, 3.802724, 1, 1, 1, 1, 1,
0.6580406, 1.675543, -0.4852577, 0, 0, 1, 1, 1,
0.6608546, -0.8714541, 2.980023, 1, 0, 0, 1, 1,
0.6662561, -1.1668, 3.440633, 1, 0, 0, 1, 1,
0.6668845, -0.1829626, 1.911773, 1, 0, 0, 1, 1,
0.6679974, -2.494168, 2.16509, 1, 0, 0, 1, 1,
0.6690908, 1.656937, 0.5517647, 1, 0, 0, 1, 1,
0.6725826, -1.286968, 2.88894, 0, 0, 0, 1, 1,
0.676201, -0.4060791, 2.04922, 0, 0, 0, 1, 1,
0.6771946, 0.6822637, 1.155038, 0, 0, 0, 1, 1,
0.6796131, -1.191734, 1.853885, 0, 0, 0, 1, 1,
0.6813555, 0.531928, 1.508831, 0, 0, 0, 1, 1,
0.6832653, -0.5308765, 1.339239, 0, 0, 0, 1, 1,
0.6900055, -0.08871359, 2.963294, 0, 0, 0, 1, 1,
0.7028141, 0.807263, 2.580634, 1, 1, 1, 1, 1,
0.7039281, -1.16498, 2.741059, 1, 1, 1, 1, 1,
0.7041503, -0.6523315, 2.287297, 1, 1, 1, 1, 1,
0.7042168, -0.6522, 2.420387, 1, 1, 1, 1, 1,
0.7059419, -2.3096, 1.626439, 1, 1, 1, 1, 1,
0.7134397, 0.5226137, 0.8694484, 1, 1, 1, 1, 1,
0.7163564, 0.1465939, 0.9109066, 1, 1, 1, 1, 1,
0.7204996, -0.311304, 2.018438, 1, 1, 1, 1, 1,
0.7241654, -1.474431, 3.415753, 1, 1, 1, 1, 1,
0.7280787, 1.517181, -0.8178741, 1, 1, 1, 1, 1,
0.7343447, 1.059716, 2.774026, 1, 1, 1, 1, 1,
0.736474, -0.0229359, 2.056823, 1, 1, 1, 1, 1,
0.7407709, 0.05783376, 1.350708, 1, 1, 1, 1, 1,
0.7445237, 0.3634345, 2.100143, 1, 1, 1, 1, 1,
0.7448748, -1.25635, 4.422375, 1, 1, 1, 1, 1,
0.7450109, 0.9855875, 0.75087, 0, 0, 1, 1, 1,
0.7467208, -1.273074, 1.418551, 1, 0, 0, 1, 1,
0.7513298, 0.2424281, 1.435853, 1, 0, 0, 1, 1,
0.7597359, -0.7682227, 2.823374, 1, 0, 0, 1, 1,
0.7639022, -0.4665349, 2.278568, 1, 0, 0, 1, 1,
0.7691211, -0.1677498, 2.007784, 1, 0, 0, 1, 1,
0.7705182, 1.025465, 1.498906, 0, 0, 0, 1, 1,
0.7825996, -0.8379652, 1.073668, 0, 0, 0, 1, 1,
0.783596, 0.5357063, 0.7767825, 0, 0, 0, 1, 1,
0.7837898, 0.1593977, -0.5767793, 0, 0, 0, 1, 1,
0.7922889, 0.5967453, 1.069573, 0, 0, 0, 1, 1,
0.8022864, -0.3651867, 2.729801, 0, 0, 0, 1, 1,
0.8050838, -0.316759, 3.707228, 0, 0, 0, 1, 1,
0.8104195, -0.6050526, 2.277937, 1, 1, 1, 1, 1,
0.8106835, 0.8543758, 0.591288, 1, 1, 1, 1, 1,
0.8122823, -0.9431375, 4.214534, 1, 1, 1, 1, 1,
0.8167303, 1.765751, 1.210812, 1, 1, 1, 1, 1,
0.8183498, -0.6597718, 2.173194, 1, 1, 1, 1, 1,
0.8197351, 1.140634, 0.3180816, 1, 1, 1, 1, 1,
0.8220073, 0.414122, 2.390922, 1, 1, 1, 1, 1,
0.8249565, -0.4756577, 3.840138, 1, 1, 1, 1, 1,
0.8285213, 0.2269264, 2.794384, 1, 1, 1, 1, 1,
0.8300859, 1.035141, 1.371938, 1, 1, 1, 1, 1,
0.8408312, 0.4329945, 2.565997, 1, 1, 1, 1, 1,
0.8484733, 0.2879716, 2.564641, 1, 1, 1, 1, 1,
0.853047, -0.5202687, 2.974074, 1, 1, 1, 1, 1,
0.8546991, -0.7119482, 1.488403, 1, 1, 1, 1, 1,
0.8584151, -0.6593619, 4.641815, 1, 1, 1, 1, 1,
0.8709309, 0.5708386, 0.3365098, 0, 0, 1, 1, 1,
0.8711543, 1.189107, -0.7623983, 1, 0, 0, 1, 1,
0.8717734, 0.3557005, 0.8922504, 1, 0, 0, 1, 1,
0.872264, -0.3600802, 2.395421, 1, 0, 0, 1, 1,
0.8758929, -0.7011826, 3.445514, 1, 0, 0, 1, 1,
0.8851633, -0.7150254, 1.793323, 1, 0, 0, 1, 1,
0.8901665, -0.258256, 1.691605, 0, 0, 0, 1, 1,
0.8951549, -0.3768622, 2.084772, 0, 0, 0, 1, 1,
0.9003612, 1.844663, 1.859233, 0, 0, 0, 1, 1,
0.9008183, -0.3517011, 1.692198, 0, 0, 0, 1, 1,
0.90161, 0.1754931, 2.348152, 0, 0, 0, 1, 1,
0.9025438, 1.627836, 1.314666, 0, 0, 0, 1, 1,
0.9031989, 0.5987659, 0.4256095, 0, 0, 0, 1, 1,
0.9075854, -0.2841528, 1.725886, 1, 1, 1, 1, 1,
0.9081166, 1.600329, -0.9839774, 1, 1, 1, 1, 1,
0.9082488, -0.6355603, 2.056821, 1, 1, 1, 1, 1,
0.9105853, -0.4455384, 1.669783, 1, 1, 1, 1, 1,
0.92406, 0.4374018, 0.5041751, 1, 1, 1, 1, 1,
0.9240638, -2.61729, 3.763489, 1, 1, 1, 1, 1,
0.9283893, -0.5147511, 0.7009423, 1, 1, 1, 1, 1,
0.9319522, 0.4967263, 1.721133, 1, 1, 1, 1, 1,
0.9381405, -0.2895697, 2.559056, 1, 1, 1, 1, 1,
0.9390558, 0.4227508, 0.9975551, 1, 1, 1, 1, 1,
0.9392426, 1.284029, 0.6391366, 1, 1, 1, 1, 1,
0.9416494, -0.1859889, 2.246475, 1, 1, 1, 1, 1,
0.9421314, -1.716234, 2.842647, 1, 1, 1, 1, 1,
0.9465378, -0.2810854, 0.5484757, 1, 1, 1, 1, 1,
0.9465942, -0.6219105, 3.265036, 1, 1, 1, 1, 1,
0.947564, -1.199099, 1.992587, 0, 0, 1, 1, 1,
0.9541377, 1.112067, -0.276715, 1, 0, 0, 1, 1,
0.9607207, 0.233375, 1.522414, 1, 0, 0, 1, 1,
0.9625969, 1.293427, 1.394444, 1, 0, 0, 1, 1,
0.9706076, -0.3102431, 3.069742, 1, 0, 0, 1, 1,
0.9745821, -0.2099527, 2.253274, 1, 0, 0, 1, 1,
0.979383, -0.2451139, 0.5301751, 0, 0, 0, 1, 1,
0.9817295, -1.448904, 4.676802, 0, 0, 0, 1, 1,
0.9953583, 1.432281, -0.1846192, 0, 0, 0, 1, 1,
0.9962635, -2.82182, 3.138217, 0, 0, 0, 1, 1,
0.9969993, 0.1796654, 0.4419228, 0, 0, 0, 1, 1,
1.00234, -0.337566, 0.7752814, 0, 0, 0, 1, 1,
1.011268, 0.9893768, 1.4904, 0, 0, 0, 1, 1,
1.013092, -0.6994524, 1.494937, 1, 1, 1, 1, 1,
1.015179, 0.7950754, -0.880829, 1, 1, 1, 1, 1,
1.027963, 1.733794, 2.169251, 1, 1, 1, 1, 1,
1.037648, 0.09104577, 2.765327, 1, 1, 1, 1, 1,
1.042429, -0.4913834, 3.008262, 1, 1, 1, 1, 1,
1.051005, 0.1417223, 1.333114, 1, 1, 1, 1, 1,
1.051869, 0.7017871, -1.634524, 1, 1, 1, 1, 1,
1.052721, 0.7232603, 0.2703869, 1, 1, 1, 1, 1,
1.053238, 0.6082362, 1.188676, 1, 1, 1, 1, 1,
1.055399, -1.293052, 0.651745, 1, 1, 1, 1, 1,
1.056739, -0.3379473, 0.866271, 1, 1, 1, 1, 1,
1.063638, 0.4516367, 0.6116039, 1, 1, 1, 1, 1,
1.064496, 0.8169128, 1.603295, 1, 1, 1, 1, 1,
1.073879, 0.3817183, 0.6524998, 1, 1, 1, 1, 1,
1.074221, 0.6649827, 1.931, 1, 1, 1, 1, 1,
1.082318, 0.8526708, -1.645338, 0, 0, 1, 1, 1,
1.100314, -0.8411945, 3.509859, 1, 0, 0, 1, 1,
1.10355, -0.5004253, 1.257689, 1, 0, 0, 1, 1,
1.110959, -0.6616631, 1.071617, 1, 0, 0, 1, 1,
1.122912, -1.147582, 0.8285272, 1, 0, 0, 1, 1,
1.124379, 0.4258893, 1.83701, 1, 0, 0, 1, 1,
1.124833, 0.1779326, -0.289903, 0, 0, 0, 1, 1,
1.125782, 1.137308, 1.609708, 0, 0, 0, 1, 1,
1.131941, -0.1225601, 2.733428, 0, 0, 0, 1, 1,
1.146893, 0.2780857, -1.439364, 0, 0, 0, 1, 1,
1.151868, 0.1461236, 0.471305, 0, 0, 0, 1, 1,
1.152638, -0.2911473, 0.9503787, 0, 0, 0, 1, 1,
1.160291, -0.2729652, 3.199935, 0, 0, 0, 1, 1,
1.165819, -0.742156, 0.3579031, 1, 1, 1, 1, 1,
1.165879, 0.3177749, 1.271369, 1, 1, 1, 1, 1,
1.166739, 0.3384976, 0.9759553, 1, 1, 1, 1, 1,
1.173636, 0.6502633, 1.462743, 1, 1, 1, 1, 1,
1.216695, 1.50686, 0.5084584, 1, 1, 1, 1, 1,
1.217176, -0.9306609, 0.4924839, 1, 1, 1, 1, 1,
1.219291, -0.5970917, 2.488643, 1, 1, 1, 1, 1,
1.238662, -0.5087634, 1.283551, 1, 1, 1, 1, 1,
1.243801, 1.047032, 1.273175, 1, 1, 1, 1, 1,
1.255936, -0.3165721, 2.063356, 1, 1, 1, 1, 1,
1.264019, 0.6515665, 0.7737958, 1, 1, 1, 1, 1,
1.269429, 1.293221, 0.9953415, 1, 1, 1, 1, 1,
1.274346, 1.45181, 0.8178837, 1, 1, 1, 1, 1,
1.274548, 0.1426366, 2.527231, 1, 1, 1, 1, 1,
1.284352, -1.418353, 2.808413, 1, 1, 1, 1, 1,
1.290254, -1.460532, 3.314944, 0, 0, 1, 1, 1,
1.290674, 1.055996, 0.1275946, 1, 0, 0, 1, 1,
1.291497, 0.8893536, -0.400231, 1, 0, 0, 1, 1,
1.301095, 1.687818, 0.005775672, 1, 0, 0, 1, 1,
1.30917, -1.764913, 2.87762, 1, 0, 0, 1, 1,
1.309268, -0.2804447, 1.21191, 1, 0, 0, 1, 1,
1.314694, -0.4565456, 2.539921, 0, 0, 0, 1, 1,
1.332577, -1.643139, 2.652522, 0, 0, 0, 1, 1,
1.340008, -0.4725586, 1.153355, 0, 0, 0, 1, 1,
1.341563, -0.3063657, 1.338247, 0, 0, 0, 1, 1,
1.342738, -1.217722, 1.580799, 0, 0, 0, 1, 1,
1.347311, -0.1515701, 2.508052, 0, 0, 0, 1, 1,
1.348253, -0.4957436, 3.965395, 0, 0, 0, 1, 1,
1.35497, 1.13552, 0.395302, 1, 1, 1, 1, 1,
1.35586, 0.03755608, 2.810235, 1, 1, 1, 1, 1,
1.356919, 0.7058495, 1.593157, 1, 1, 1, 1, 1,
1.367533, -0.05043279, 2.277672, 1, 1, 1, 1, 1,
1.383631, -0.7394257, 1.515083, 1, 1, 1, 1, 1,
1.384795, -1.051871, 3.813749, 1, 1, 1, 1, 1,
1.385225, -1.693518, 1.538372, 1, 1, 1, 1, 1,
1.387725, -0.5492578, 0.9876375, 1, 1, 1, 1, 1,
1.391399, 1.648681, 0.9764152, 1, 1, 1, 1, 1,
1.40472, -0.7340659, 1.706576, 1, 1, 1, 1, 1,
1.407706, -0.7329828, 0.9832132, 1, 1, 1, 1, 1,
1.408749, -0.4714122, 0.8130387, 1, 1, 1, 1, 1,
1.412169, 0.2449057, 2.229162, 1, 1, 1, 1, 1,
1.413508, -1.299703, 0.8098702, 1, 1, 1, 1, 1,
1.414444, 0.4278879, 1.499185, 1, 1, 1, 1, 1,
1.416557, -0.3018486, 2.82261, 0, 0, 1, 1, 1,
1.421205, -0.6513252, 2.520729, 1, 0, 0, 1, 1,
1.429201, 1.878356, 1.931504, 1, 0, 0, 1, 1,
1.436995, -0.5782676, 1.734116, 1, 0, 0, 1, 1,
1.44687, 0.1520276, 2.140971, 1, 0, 0, 1, 1,
1.457254, -0.2184502, 2.088342, 1, 0, 0, 1, 1,
1.465857, 0.06431402, 2.667858, 0, 0, 0, 1, 1,
1.467484, -1.458627, 0.3340152, 0, 0, 0, 1, 1,
1.486685, -0.411718, 2.436269, 0, 0, 0, 1, 1,
1.486766, 0.1629592, -1.270798, 0, 0, 0, 1, 1,
1.498753, 1.77059, 0.1799541, 0, 0, 0, 1, 1,
1.502336, 1.231055, 2.111789, 0, 0, 0, 1, 1,
1.514141, 0.6706995, 1.459948, 0, 0, 0, 1, 1,
1.516855, 0.6832753, 0.05844942, 1, 1, 1, 1, 1,
1.517237, 0.2041337, 2.89997, 1, 1, 1, 1, 1,
1.521616, -1.218304, 2.705792, 1, 1, 1, 1, 1,
1.524983, -1.142272, 1.658796, 1, 1, 1, 1, 1,
1.549243, 0.8741704, 0.9113612, 1, 1, 1, 1, 1,
1.550058, 0.8488818, 1.002809, 1, 1, 1, 1, 1,
1.579853, 0.6751779, 0.7914324, 1, 1, 1, 1, 1,
1.580014, 1.265123, 2.016522, 1, 1, 1, 1, 1,
1.584342, 0.01787175, 0.7306141, 1, 1, 1, 1, 1,
1.598676, -1.645851, 2.687073, 1, 1, 1, 1, 1,
1.620451, 0.06900435, 2.978622, 1, 1, 1, 1, 1,
1.650479, 0.5620715, 0.6608408, 1, 1, 1, 1, 1,
1.65115, -0.7487503, 0.9423665, 1, 1, 1, 1, 1,
1.672985, 0.5115304, -0.1352413, 1, 1, 1, 1, 1,
1.681683, -0.564625, 3.060335, 1, 1, 1, 1, 1,
1.685621, -0.9167193, 0.7687986, 0, 0, 1, 1, 1,
1.712689, -0.8228129, 1.364653, 1, 0, 0, 1, 1,
1.722437, 0.3759749, 0.7104759, 1, 0, 0, 1, 1,
1.73005, -0.3897362, 0.7953253, 1, 0, 0, 1, 1,
1.731097, 1.473067, 1.34173, 1, 0, 0, 1, 1,
1.733406, -0.2227065, 1.131038, 1, 0, 0, 1, 1,
1.742512, 0.9660888, 0.6243843, 0, 0, 0, 1, 1,
1.750854, -2.517076, 3.060371, 0, 0, 0, 1, 1,
1.770336, -0.6653408, 2.962768, 0, 0, 0, 1, 1,
1.774219, 0.6343321, 0.2581954, 0, 0, 0, 1, 1,
1.792527, 0.2502425, 2.519008, 0, 0, 0, 1, 1,
1.807789, 0.3371809, 2.850137, 0, 0, 0, 1, 1,
1.824895, 1.79383, 0.5113001, 0, 0, 0, 1, 1,
1.846566, -0.667311, 3.647931, 1, 1, 1, 1, 1,
1.853848, 0.3447392, 0.4352174, 1, 1, 1, 1, 1,
1.855208, -0.5200978, 2.31794, 1, 1, 1, 1, 1,
1.892165, 0.8884416, 2.085505, 1, 1, 1, 1, 1,
1.894151, -2.227605, 1.133067, 1, 1, 1, 1, 1,
1.896166, -0.8883098, 1.547686, 1, 1, 1, 1, 1,
1.902992, 1.064398, 0.7289848, 1, 1, 1, 1, 1,
1.927686, 1.55489, 2.362455, 1, 1, 1, 1, 1,
1.949844, 2.027612, -0.3734141, 1, 1, 1, 1, 1,
1.959839, 0.5509291, 2.281242, 1, 1, 1, 1, 1,
1.991552, 2.512355, 1.229232, 1, 1, 1, 1, 1,
1.993348, 0.5886862, 1.233979, 1, 1, 1, 1, 1,
2.01891, 0.1627016, 1.210337, 1, 1, 1, 1, 1,
2.019617, 0.4275055, 1.386899, 1, 1, 1, 1, 1,
2.022184, -0.3043087, 1.596262, 1, 1, 1, 1, 1,
2.032636, 0.07375633, 1.659519, 0, 0, 1, 1, 1,
2.102892, 0.06413456, 1.846013, 1, 0, 0, 1, 1,
2.104338, 1.317626, 2.332522, 1, 0, 0, 1, 1,
2.109436, 1.520833, 1.834876, 1, 0, 0, 1, 1,
2.241128, 0.266533, 0.8070471, 1, 0, 0, 1, 1,
2.247433, -0.6178527, 1.936442, 1, 0, 0, 1, 1,
2.25199, 1.677693, 1.150474, 0, 0, 0, 1, 1,
2.282365, 1.089342, 0.09928108, 0, 0, 0, 1, 1,
2.319901, 0.1277469, 4.04328, 0, 0, 0, 1, 1,
2.346967, 0.2753901, 2.207736, 0, 0, 0, 1, 1,
2.348493, -0.6453256, 0.9532294, 0, 0, 0, 1, 1,
2.460816, -0.04346689, 2.555222, 0, 0, 0, 1, 1,
2.475848, -1.308779, 2.424538, 0, 0, 0, 1, 1,
2.543989, 0.5584333, 1.907477, 1, 1, 1, 1, 1,
2.561871, 0.8303548, 3.782683, 1, 1, 1, 1, 1,
2.605129, -1.406801, 0.8725372, 1, 1, 1, 1, 1,
2.644239, -0.07285842, 3.372831, 1, 1, 1, 1, 1,
2.716703, -1.052089, 3.013444, 1, 1, 1, 1, 1,
2.734215, -0.5503438, 1.200603, 1, 1, 1, 1, 1,
2.896793, -0.6142098, 1.946654, 1, 1, 1, 1, 1
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
var radius = 9.420124;
var distance = 33.08778;
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
mvMatrix.translate( 0.03207314, -0.0693891, 0.4251721 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.08778);
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