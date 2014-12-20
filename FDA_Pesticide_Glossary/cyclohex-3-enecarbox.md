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
-3.881862, 0.4797888, 0.05100323, 1, 0, 0, 1,
-3.130167, 1.16685, -1.894262, 1, 0.007843138, 0, 1,
-2.951348, -0.2748957, -0.9005653, 1, 0.01176471, 0, 1,
-2.918765, 1.169243, -0.6797884, 1, 0.01960784, 0, 1,
-2.77145, -0.1734991, -2.644806, 1, 0.02352941, 0, 1,
-2.626188, 1.137933, -1.622516, 1, 0.03137255, 0, 1,
-2.613615, 1.491006, -0.4552625, 1, 0.03529412, 0, 1,
-2.532385, -1.704857, -1.436962, 1, 0.04313726, 0, 1,
-2.427631, -0.1041052, -1.0844, 1, 0.04705882, 0, 1,
-2.418125, -0.1315892, -1.616886, 1, 0.05490196, 0, 1,
-2.390486, -0.5706685, -2.425087, 1, 0.05882353, 0, 1,
-2.388536, 0.04597506, 0.663103, 1, 0.06666667, 0, 1,
-2.381633, 0.08847903, -0.9381755, 1, 0.07058824, 0, 1,
-2.380586, -0.7633452, -1.012789, 1, 0.07843138, 0, 1,
-2.34902, -0.0349167, -3.439512, 1, 0.08235294, 0, 1,
-2.331871, 1.093465, -0.6507862, 1, 0.09019608, 0, 1,
-2.32431, -1.031482, -1.167548, 1, 0.09411765, 0, 1,
-2.291485, 0.2797383, -0.6401755, 1, 0.1019608, 0, 1,
-2.243072, -1.456759, -0.9930568, 1, 0.1098039, 0, 1,
-2.207703, -1.602413, 0.3337377, 1, 0.1137255, 0, 1,
-2.203877, -1.499148, -0.9441467, 1, 0.1215686, 0, 1,
-2.201406, 0.9679567, -2.078099, 1, 0.1254902, 0, 1,
-2.18159, 0.03488086, -1.160732, 1, 0.1333333, 0, 1,
-2.144095, 0.3672493, -1.294652, 1, 0.1372549, 0, 1,
-2.127301, 0.04355973, -1.135321, 1, 0.145098, 0, 1,
-2.120301, 0.2914612, -2.244462, 1, 0.1490196, 0, 1,
-2.061354, 1.386328, -1.616024, 1, 0.1568628, 0, 1,
-2.05501, 0.1446294, -1.959353, 1, 0.1607843, 0, 1,
-2.04461, -0.1710608, -1.411234, 1, 0.1686275, 0, 1,
-2.041262, -1.048676, -3.152872, 1, 0.172549, 0, 1,
-2.039017, 0.02607351, -1.275782, 1, 0.1803922, 0, 1,
-2.036649, 0.3088421, -0.6491982, 1, 0.1843137, 0, 1,
-2.027441, -0.9593679, -2.991647, 1, 0.1921569, 0, 1,
-2.014231, -0.7083762, -2.954194, 1, 0.1960784, 0, 1,
-1.969586, -1.039644, -1.146686, 1, 0.2039216, 0, 1,
-1.95407, -0.7330049, -0.6880767, 1, 0.2117647, 0, 1,
-1.91066, 1.312989, 0.7070003, 1, 0.2156863, 0, 1,
-1.909134, 1.267535, -1.088542, 1, 0.2235294, 0, 1,
-1.903527, 0.4703749, -1.995044, 1, 0.227451, 0, 1,
-1.89164, -0.09005485, -1.557792, 1, 0.2352941, 0, 1,
-1.84143, 1.012609, -0.4385622, 1, 0.2392157, 0, 1,
-1.841095, -0.3188898, -1.02854, 1, 0.2470588, 0, 1,
-1.828262, 0.324979, -2.3146, 1, 0.2509804, 0, 1,
-1.811186, 1.1996, -2.789084, 1, 0.2588235, 0, 1,
-1.809667, -0.2530628, -1.973982, 1, 0.2627451, 0, 1,
-1.798422, 0.5734385, 0.4507891, 1, 0.2705882, 0, 1,
-1.775215, 0.07920901, -1.846022, 1, 0.2745098, 0, 1,
-1.773974, -0.4432123, -1.954168, 1, 0.282353, 0, 1,
-1.768696, -1.018944, -2.340779, 1, 0.2862745, 0, 1,
-1.761885, -1.601341, -2.558847, 1, 0.2941177, 0, 1,
-1.745306, -0.9771467, -2.267874, 1, 0.3019608, 0, 1,
-1.740923, 1.461592, -0.6141765, 1, 0.3058824, 0, 1,
-1.734287, 0.3535776, -1.515573, 1, 0.3137255, 0, 1,
-1.731796, -0.3042855, -1.440805, 1, 0.3176471, 0, 1,
-1.729632, 0.5944941, 0.08844913, 1, 0.3254902, 0, 1,
-1.729396, -0.5303246, -1.697632, 1, 0.3294118, 0, 1,
-1.701073, -0.8373867, 0.7197736, 1, 0.3372549, 0, 1,
-1.671386, 2.401983, -0.3588057, 1, 0.3411765, 0, 1,
-1.661643, -1.401149, -0.9010348, 1, 0.3490196, 0, 1,
-1.633035, -0.7576941, -0.8821771, 1, 0.3529412, 0, 1,
-1.626318, -0.2516519, -3.224483, 1, 0.3607843, 0, 1,
-1.610273, 0.7556058, -2.189646, 1, 0.3647059, 0, 1,
-1.598438, 1.472055, 0.06921253, 1, 0.372549, 0, 1,
-1.582911, 1.272587, -2.73936, 1, 0.3764706, 0, 1,
-1.578016, 0.5993351, -0.8376002, 1, 0.3843137, 0, 1,
-1.567645, -0.6287238, -1.721613, 1, 0.3882353, 0, 1,
-1.563582, 0.5745189, -2.558336, 1, 0.3960784, 0, 1,
-1.535744, 0.7347493, 0.2783872, 1, 0.4039216, 0, 1,
-1.518131, 0.3391111, -1.685296, 1, 0.4078431, 0, 1,
-1.515357, -1.588293, -3.384916, 1, 0.4156863, 0, 1,
-1.51348, -1.142531, -1.415996, 1, 0.4196078, 0, 1,
-1.505748, -2.466702, -2.843537, 1, 0.427451, 0, 1,
-1.49006, 0.08764845, -0.8544417, 1, 0.4313726, 0, 1,
-1.485854, 0.4077865, -0.515728, 1, 0.4392157, 0, 1,
-1.481676, -1.11232, -1.251937, 1, 0.4431373, 0, 1,
-1.464443, -0.1805436, -0.3719913, 1, 0.4509804, 0, 1,
-1.455192, -0.661071, -1.877788, 1, 0.454902, 0, 1,
-1.451615, -0.9831806, -0.8505978, 1, 0.4627451, 0, 1,
-1.447377, 0.8302466, -1.256892, 1, 0.4666667, 0, 1,
-1.417013, 0.5755709, -0.9400544, 1, 0.4745098, 0, 1,
-1.412733, 0.2378704, 0.1226309, 1, 0.4784314, 0, 1,
-1.408903, 1.259181, -1.116679, 1, 0.4862745, 0, 1,
-1.39084, 1.392857, 0.08273087, 1, 0.4901961, 0, 1,
-1.389234, -0.6758819, -3.58829, 1, 0.4980392, 0, 1,
-1.387081, 0.7738461, -1.094177, 1, 0.5058824, 0, 1,
-1.381596, 0.4124498, -1.045609, 1, 0.509804, 0, 1,
-1.380793, -0.9412603, -4.596053, 1, 0.5176471, 0, 1,
-1.378328, -0.4827603, 0.4486571, 1, 0.5215687, 0, 1,
-1.372983, 1.253178, -3.072627, 1, 0.5294118, 0, 1,
-1.365491, -0.2928595, -2.417918, 1, 0.5333334, 0, 1,
-1.364821, -0.6553028, -2.062286, 1, 0.5411765, 0, 1,
-1.344175, 0.0649078, -0.8787313, 1, 0.5450981, 0, 1,
-1.337682, 0.1142357, -2.577535, 1, 0.5529412, 0, 1,
-1.334897, 1.174125, -2.385981, 1, 0.5568628, 0, 1,
-1.331872, -0.9280924, -1.388528, 1, 0.5647059, 0, 1,
-1.327919, 0.3200755, -1.205317, 1, 0.5686275, 0, 1,
-1.313599, -1.250966, -3.359266, 1, 0.5764706, 0, 1,
-1.305869, 0.9365684, -0.685246, 1, 0.5803922, 0, 1,
-1.299335, 1.557088, -0.4279161, 1, 0.5882353, 0, 1,
-1.296665, -0.01255981, -1.826586, 1, 0.5921569, 0, 1,
-1.296606, -0.6568151, -1.524485, 1, 0.6, 0, 1,
-1.291672, 0.353815, -1.127267, 1, 0.6078432, 0, 1,
-1.288547, -0.3018565, -3.700065, 1, 0.6117647, 0, 1,
-1.278717, 0.431013, -3.269091, 1, 0.6196079, 0, 1,
-1.265755, -1.267019, -1.99477, 1, 0.6235294, 0, 1,
-1.262768, -0.185909, -2.097588, 1, 0.6313726, 0, 1,
-1.261918, 0.8291172, -1.65578, 1, 0.6352941, 0, 1,
-1.258794, 0.2716335, -1.303255, 1, 0.6431373, 0, 1,
-1.251947, -0.3598718, -2.013305, 1, 0.6470588, 0, 1,
-1.250261, -0.6363733, -2.739918, 1, 0.654902, 0, 1,
-1.245557, 1.847498, -1.336111, 1, 0.6588235, 0, 1,
-1.244796, 1.38243, -1.023623, 1, 0.6666667, 0, 1,
-1.243306, -0.6857328, -2.758763, 1, 0.6705883, 0, 1,
-1.24299, -0.9586012, -2.852843, 1, 0.6784314, 0, 1,
-1.222876, -2.141865, -1.502909, 1, 0.682353, 0, 1,
-1.208132, 0.3059967, -0.208641, 1, 0.6901961, 0, 1,
-1.199224, -0.222449, -2.121627, 1, 0.6941177, 0, 1,
-1.198152, 0.2941448, 0.02897373, 1, 0.7019608, 0, 1,
-1.17999, 1.600423, -0.3969022, 1, 0.7098039, 0, 1,
-1.177255, 0.4037958, -1.008463, 1, 0.7137255, 0, 1,
-1.174408, 0.2696664, -1.344537, 1, 0.7215686, 0, 1,
-1.163834, -0.09454206, -1.002365, 1, 0.7254902, 0, 1,
-1.14652, -0.4347154, -2.505603, 1, 0.7333333, 0, 1,
-1.145914, -0.3556306, -1.524804, 1, 0.7372549, 0, 1,
-1.145069, -0.5112119, -3.205423, 1, 0.7450981, 0, 1,
-1.139234, -0.7725695, -2.096339, 1, 0.7490196, 0, 1,
-1.129898, -0.4767027, -2.247056, 1, 0.7568628, 0, 1,
-1.111538, 0.5650949, -2.147217, 1, 0.7607843, 0, 1,
-1.110581, 0.3770142, 1.275947, 1, 0.7686275, 0, 1,
-1.107298, 0.265994, -1.272428, 1, 0.772549, 0, 1,
-1.105201, -0.5299329, -1.971612, 1, 0.7803922, 0, 1,
-1.105105, -0.8965832, -0.8547196, 1, 0.7843137, 0, 1,
-1.10153, -0.138754, -1.464001, 1, 0.7921569, 0, 1,
-1.099328, 0.8438633, -0.9852142, 1, 0.7960784, 0, 1,
-1.091175, -0.7959709, -2.886207, 1, 0.8039216, 0, 1,
-1.088916, -1.881042, -2.222883, 1, 0.8117647, 0, 1,
-1.088827, 1.147424, -1.434618, 1, 0.8156863, 0, 1,
-1.088389, 0.1223254, -0.8833708, 1, 0.8235294, 0, 1,
-1.084121, 0.5871474, -1.135951, 1, 0.827451, 0, 1,
-1.083553, -1.180689, -2.748776, 1, 0.8352941, 0, 1,
-1.081488, 0.7365214, -2.430265, 1, 0.8392157, 0, 1,
-1.077562, 0.693719, -0.459543, 1, 0.8470588, 0, 1,
-1.064983, 0.846465, -0.3040732, 1, 0.8509804, 0, 1,
-1.062585, -0.2058541, -0.4639883, 1, 0.8588235, 0, 1,
-1.050989, -0.8172988, -2.890877, 1, 0.8627451, 0, 1,
-1.046469, -0.2948039, -2.087838, 1, 0.8705882, 0, 1,
-1.039813, 0.1372043, -1.591784, 1, 0.8745098, 0, 1,
-1.03844, 1.081225, -0.2055486, 1, 0.8823529, 0, 1,
-1.037612, 1.322844, -0.1572831, 1, 0.8862745, 0, 1,
-1.032084, 0.6633021, -0.9790933, 1, 0.8941177, 0, 1,
-1.030057, 0.9714015, -2.417928, 1, 0.8980392, 0, 1,
-1.028066, -0.8341939, -2.738326, 1, 0.9058824, 0, 1,
-1.022226, 1.186832, 0.02388238, 1, 0.9137255, 0, 1,
-1.020741, 1.433405, -0.9677832, 1, 0.9176471, 0, 1,
-1.009489, -1.01586, -1.406979, 1, 0.9254902, 0, 1,
-1.001919, -0.2811142, -0.0131616, 1, 0.9294118, 0, 1,
-1.001235, -0.01320601, -1.112841, 1, 0.9372549, 0, 1,
-0.997679, -0.4486334, -0.3284704, 1, 0.9411765, 0, 1,
-0.9930685, -1.09915, -2.078278, 1, 0.9490196, 0, 1,
-0.9853794, 0.2858057, -0.6507514, 1, 0.9529412, 0, 1,
-0.9826469, 0.09988557, -1.048679, 1, 0.9607843, 0, 1,
-0.9819419, -2.14892, -2.562773, 1, 0.9647059, 0, 1,
-0.9761202, -1.882072, -3.534069, 1, 0.972549, 0, 1,
-0.971242, -0.2410611, -2.932482, 1, 0.9764706, 0, 1,
-0.9650803, 0.9080952, -0.5983537, 1, 0.9843137, 0, 1,
-0.9559408, 0.1046366, -1.697464, 1, 0.9882353, 0, 1,
-0.9551442, -0.5245391, -3.059365, 1, 0.9960784, 0, 1,
-0.9546979, -0.01035457, 0.01520573, 0.9960784, 1, 0, 1,
-0.945464, -1.205446, -2.79276, 0.9921569, 1, 0, 1,
-0.9439, 0.2631041, -1.909426, 0.9843137, 1, 0, 1,
-0.9416904, 0.7552456, -0.9646585, 0.9803922, 1, 0, 1,
-0.9352112, 0.3662778, -1.944525, 0.972549, 1, 0, 1,
-0.9254844, -0.411966, -1.282125, 0.9686275, 1, 0, 1,
-0.9241844, 1.249672, -0.5731413, 0.9607843, 1, 0, 1,
-0.9204631, 0.6265475, 0.8714557, 0.9568627, 1, 0, 1,
-0.9174886, -0.6137766, -2.699515, 0.9490196, 1, 0, 1,
-0.9173386, -0.5960009, -3.385834, 0.945098, 1, 0, 1,
-0.9103475, -0.008127452, -2.391629, 0.9372549, 1, 0, 1,
-0.9086048, 0.3230702, -1.802341, 0.9333333, 1, 0, 1,
-0.8924537, -2.042459, -3.48485, 0.9254902, 1, 0, 1,
-0.8889057, -0.2607574, -2.012598, 0.9215686, 1, 0, 1,
-0.8803672, -0.08678532, -2.092937, 0.9137255, 1, 0, 1,
-0.8800135, -0.2496136, -0.5493973, 0.9098039, 1, 0, 1,
-0.8740317, 0.5057829, -0.9918504, 0.9019608, 1, 0, 1,
-0.8728166, 0.5913659, -1.278574, 0.8941177, 1, 0, 1,
-0.8656338, -0.4131871, -2.273184, 0.8901961, 1, 0, 1,
-0.8611755, -1.155457, -2.416013, 0.8823529, 1, 0, 1,
-0.8568839, -0.04689905, -2.292669, 0.8784314, 1, 0, 1,
-0.8543293, -0.34086, -0.8800327, 0.8705882, 1, 0, 1,
-0.8525903, 2.140708, -0.5406227, 0.8666667, 1, 0, 1,
-0.8423809, -1.980212, -4.734221, 0.8588235, 1, 0, 1,
-0.8401233, -2.110225, -2.057463, 0.854902, 1, 0, 1,
-0.8384352, -0.04907515, -1.952438, 0.8470588, 1, 0, 1,
-0.8371426, -0.536306, -2.598488, 0.8431373, 1, 0, 1,
-0.8360934, 0.2769841, -1.025895, 0.8352941, 1, 0, 1,
-0.8303719, 0.06683285, -0.707615, 0.8313726, 1, 0, 1,
-0.825002, -0.56136, -0.6730118, 0.8235294, 1, 0, 1,
-0.823563, 0.09502633, -0.73556, 0.8196079, 1, 0, 1,
-0.8215267, -0.2741035, -1.89908, 0.8117647, 1, 0, 1,
-0.8146468, 0.3976513, -0.04652763, 0.8078431, 1, 0, 1,
-0.8113436, 0.09536555, -1.702144, 0.8, 1, 0, 1,
-0.8090996, -0.07864217, -2.084808, 0.7921569, 1, 0, 1,
-0.8071393, 0.1470131, -0.5740713, 0.7882353, 1, 0, 1,
-0.8061996, -0.5052404, -0.5885038, 0.7803922, 1, 0, 1,
-0.8046992, -0.5758448, -1.936764, 0.7764706, 1, 0, 1,
-0.8042537, -1.589097, -1.829667, 0.7686275, 1, 0, 1,
-0.7950808, 1.69664, -0.1169367, 0.7647059, 1, 0, 1,
-0.7848916, -0.1988629, -4.648793, 0.7568628, 1, 0, 1,
-0.7846434, 1.753811, 0.09172445, 0.7529412, 1, 0, 1,
-0.7841789, -0.4118745, -0.7672414, 0.7450981, 1, 0, 1,
-0.7716534, 0.7161437, -2.112691, 0.7411765, 1, 0, 1,
-0.768148, 0.2362954, 0.06795185, 0.7333333, 1, 0, 1,
-0.7678809, -1.457409, -2.602194, 0.7294118, 1, 0, 1,
-0.7589085, -2.084255, -3.951909, 0.7215686, 1, 0, 1,
-0.7502087, 2.14498, 0.507068, 0.7176471, 1, 0, 1,
-0.7492893, 0.02492125, -0.5354288, 0.7098039, 1, 0, 1,
-0.7482902, -1.222161, -5.937887, 0.7058824, 1, 0, 1,
-0.7432793, 0.4627213, 0.3218228, 0.6980392, 1, 0, 1,
-0.7419111, 2.153816, 1.237675, 0.6901961, 1, 0, 1,
-0.7379334, 0.6870613, 0.6622124, 0.6862745, 1, 0, 1,
-0.734063, -0.6159488, -2.507266, 0.6784314, 1, 0, 1,
-0.7335826, 0.4873551, 1.320764, 0.6745098, 1, 0, 1,
-0.7310993, -0.6389886, -4.281704, 0.6666667, 1, 0, 1,
-0.7272373, -0.712573, -2.342751, 0.6627451, 1, 0, 1,
-0.7249789, 0.0939034, -1.623643, 0.654902, 1, 0, 1,
-0.7218593, 0.6283392, -1.884942, 0.6509804, 1, 0, 1,
-0.7178072, -1.936466, -2.167617, 0.6431373, 1, 0, 1,
-0.716528, 0.4546268, 0.6120984, 0.6392157, 1, 0, 1,
-0.715433, -0.8365562, -2.837576, 0.6313726, 1, 0, 1,
-0.7126279, 1.528352, 0.4632586, 0.627451, 1, 0, 1,
-0.7119678, -0.4496521, -3.424125, 0.6196079, 1, 0, 1,
-0.7118769, -0.3232272, -2.438349, 0.6156863, 1, 0, 1,
-0.7102505, 0.06099589, -1.476169, 0.6078432, 1, 0, 1,
-0.7074807, 1.13439, -1.018653, 0.6039216, 1, 0, 1,
-0.7071108, -1.658697, -2.219453, 0.5960785, 1, 0, 1,
-0.6904877, -0.1447053, -2.240412, 0.5882353, 1, 0, 1,
-0.6871063, 0.5788463, -0.9782097, 0.5843138, 1, 0, 1,
-0.6868123, 1.089696, -1.144565, 0.5764706, 1, 0, 1,
-0.6815341, -0.03794102, -2.914282, 0.572549, 1, 0, 1,
-0.6755072, 0.251007, -1.572233, 0.5647059, 1, 0, 1,
-0.6752563, -0.4916382, -4.731539, 0.5607843, 1, 0, 1,
-0.6735492, -0.1958053, -2.57707, 0.5529412, 1, 0, 1,
-0.6726529, -0.6236628, -2.726212, 0.5490196, 1, 0, 1,
-0.6711295, 0.09695318, -1.641398, 0.5411765, 1, 0, 1,
-0.6674311, 0.24327, -0.8329108, 0.5372549, 1, 0, 1,
-0.6668131, 0.3733695, -0.8250375, 0.5294118, 1, 0, 1,
-0.6653032, -0.02416332, -2.842135, 0.5254902, 1, 0, 1,
-0.6604545, -1.577613, -3.137002, 0.5176471, 1, 0, 1,
-0.658309, -0.4154966, -1.512396, 0.5137255, 1, 0, 1,
-0.6550809, -1.18279, -4.215937, 0.5058824, 1, 0, 1,
-0.6536217, 1.32489, -0.188174, 0.5019608, 1, 0, 1,
-0.6533992, -1.271307, -3.118575, 0.4941176, 1, 0, 1,
-0.6514071, 0.2218042, -0.4683798, 0.4862745, 1, 0, 1,
-0.6482735, 0.000157332, -2.777134, 0.4823529, 1, 0, 1,
-0.6468825, -0.3436295, -1.20184, 0.4745098, 1, 0, 1,
-0.6461853, 0.3445729, 0.1191415, 0.4705882, 1, 0, 1,
-0.6410007, -1.466136, -3.202751, 0.4627451, 1, 0, 1,
-0.6330905, -0.4068976, -0.3467602, 0.4588235, 1, 0, 1,
-0.628728, -0.3299355, -0.2356582, 0.4509804, 1, 0, 1,
-0.6269555, 0.2666371, -2.235445, 0.4470588, 1, 0, 1,
-0.6223875, -1.624259, -3.471306, 0.4392157, 1, 0, 1,
-0.6213077, -0.2366711, -1.793621, 0.4352941, 1, 0, 1,
-0.6211275, 0.879862, 1.617333, 0.427451, 1, 0, 1,
-0.6190432, 0.9108677, 1.518144, 0.4235294, 1, 0, 1,
-0.6164234, -1.501438, -0.853594, 0.4156863, 1, 0, 1,
-0.6139954, 0.4250389, -1.381441, 0.4117647, 1, 0, 1,
-0.6128063, -0.8198173, -3.922566, 0.4039216, 1, 0, 1,
-0.6096307, -0.4590127, -1.728133, 0.3960784, 1, 0, 1,
-0.6089481, -1.878113, -4.761118, 0.3921569, 1, 0, 1,
-0.6065898, 0.8403195, -1.67582, 0.3843137, 1, 0, 1,
-0.6063538, 0.8359647, -0.7000446, 0.3803922, 1, 0, 1,
-0.5994458, 1.109825, -1.023434, 0.372549, 1, 0, 1,
-0.5993986, -0.6607828, -0.5386013, 0.3686275, 1, 0, 1,
-0.5968563, -0.9637171, -2.638043, 0.3607843, 1, 0, 1,
-0.5943802, 0.4872822, -0.9932879, 0.3568628, 1, 0, 1,
-0.588865, 1.326245, -2.70632, 0.3490196, 1, 0, 1,
-0.5779451, -0.6914726, -4.145157, 0.345098, 1, 0, 1,
-0.5772763, -0.8436609, -3.470853, 0.3372549, 1, 0, 1,
-0.574029, 1.399143, -1.248055, 0.3333333, 1, 0, 1,
-0.5729211, -0.5976822, -2.901643, 0.3254902, 1, 0, 1,
-0.5711932, 0.07502243, -0.9661415, 0.3215686, 1, 0, 1,
-0.567691, -0.03330547, -1.332955, 0.3137255, 1, 0, 1,
-0.5536214, -0.3221626, 0.6282652, 0.3098039, 1, 0, 1,
-0.5532415, -1.253616, -3.785102, 0.3019608, 1, 0, 1,
-0.5470633, 1.696263, 1.018267, 0.2941177, 1, 0, 1,
-0.5469935, 2.11757, -0.07175557, 0.2901961, 1, 0, 1,
-0.5469713, -1.552142, -3.398757, 0.282353, 1, 0, 1,
-0.5467209, 0.5244583, -1.026003, 0.2784314, 1, 0, 1,
-0.5437424, 0.7898315, -0.4478059, 0.2705882, 1, 0, 1,
-0.539425, 0.7840689, -0.02373332, 0.2666667, 1, 0, 1,
-0.5362646, -0.2696379, -2.84741, 0.2588235, 1, 0, 1,
-0.535383, -1.009019, -4.378543, 0.254902, 1, 0, 1,
-0.5339968, -0.7856748, -3.75289, 0.2470588, 1, 0, 1,
-0.5335761, -0.2431484, -1.906219, 0.2431373, 1, 0, 1,
-0.5312898, -0.5229795, -1.638627, 0.2352941, 1, 0, 1,
-0.529245, 0.9046342, -0.746053, 0.2313726, 1, 0, 1,
-0.5254623, 2.617055, -2.193887, 0.2235294, 1, 0, 1,
-0.5241101, -1.570281, -2.872381, 0.2196078, 1, 0, 1,
-0.5188869, -1.227869, -2.633619, 0.2117647, 1, 0, 1,
-0.5146623, -0.8321291, -1.198312, 0.2078431, 1, 0, 1,
-0.5138605, 0.2511811, -2.062393, 0.2, 1, 0, 1,
-0.5037514, -0.02965925, -1.373599, 0.1921569, 1, 0, 1,
-0.5028453, -0.337925, -1.847295, 0.1882353, 1, 0, 1,
-0.5015831, -1.300987, -1.784434, 0.1803922, 1, 0, 1,
-0.5000266, 1.059192, -2.225182, 0.1764706, 1, 0, 1,
-0.4990848, 0.03080756, -0.9269639, 0.1686275, 1, 0, 1,
-0.4984038, -0.2299595, -2.275822, 0.1647059, 1, 0, 1,
-0.4908427, 1.093797, 0.2014559, 0.1568628, 1, 0, 1,
-0.4907174, 0.6179574, 0.09673541, 0.1529412, 1, 0, 1,
-0.4855472, -2.393494, -3.34147, 0.145098, 1, 0, 1,
-0.4850693, -0.8372566, -2.341366, 0.1411765, 1, 0, 1,
-0.4782116, 1.429295, -1.224092, 0.1333333, 1, 0, 1,
-0.4762769, -0.1443175, -1.081247, 0.1294118, 1, 0, 1,
-0.470995, 0.4911672, -2.72666, 0.1215686, 1, 0, 1,
-0.4708445, -1.211526, -3.159453, 0.1176471, 1, 0, 1,
-0.4705423, 0.7092805, -1.886328, 0.1098039, 1, 0, 1,
-0.4695501, -0.8753361, -0.9752951, 0.1058824, 1, 0, 1,
-0.4643207, 2.176216, 1.433228, 0.09803922, 1, 0, 1,
-0.4632553, 2.164252, 0.4243199, 0.09019608, 1, 0, 1,
-0.4607029, -0.5285209, -1.361719, 0.08627451, 1, 0, 1,
-0.4575075, 0.5063052, -1.777426, 0.07843138, 1, 0, 1,
-0.4514575, 0.4885096, -0.7920027, 0.07450981, 1, 0, 1,
-0.4440742, 0.487326, 1.214717, 0.06666667, 1, 0, 1,
-0.4345011, -0.6201605, -0.1253856, 0.0627451, 1, 0, 1,
-0.4288178, -0.2908444, -2.241708, 0.05490196, 1, 0, 1,
-0.418856, 0.7860402, -1.409435, 0.05098039, 1, 0, 1,
-0.417399, 0.1762433, -2.089834, 0.04313726, 1, 0, 1,
-0.4134241, -0.1964546, -2.278722, 0.03921569, 1, 0, 1,
-0.4133477, 0.9575296, -0.7893815, 0.03137255, 1, 0, 1,
-0.4067542, -0.2235797, -0.5484062, 0.02745098, 1, 0, 1,
-0.4050231, -0.8866731, -1.422044, 0.01960784, 1, 0, 1,
-0.3983302, -1.113298, -2.623875, 0.01568628, 1, 0, 1,
-0.398008, 0.9699609, -1.645895, 0.007843138, 1, 0, 1,
-0.3957133, -0.02756444, -2.014779, 0.003921569, 1, 0, 1,
-0.394915, -0.4806516, -1.525069, 0, 1, 0.003921569, 1,
-0.3912894, -0.3226989, -3.26778, 0, 1, 0.01176471, 1,
-0.3902451, -0.03920568, -0.5569457, 0, 1, 0.01568628, 1,
-0.3899763, -0.2534291, -2.989189, 0, 1, 0.02352941, 1,
-0.3834826, 0.3515146, -1.692487, 0, 1, 0.02745098, 1,
-0.3781718, -0.3544572, -3.176209, 0, 1, 0.03529412, 1,
-0.3776425, 0.1671696, -1.045595, 0, 1, 0.03921569, 1,
-0.3755803, 0.005853555, -3.59183, 0, 1, 0.04705882, 1,
-0.3703123, 0.3705057, -1.648285, 0, 1, 0.05098039, 1,
-0.3678874, -0.5129237, -3.255627, 0, 1, 0.05882353, 1,
-0.3643939, -0.5075383, -3.05038, 0, 1, 0.0627451, 1,
-0.362085, -0.2685735, -2.280615, 0, 1, 0.07058824, 1,
-0.3542761, 0.8921671, -1.127762, 0, 1, 0.07450981, 1,
-0.3533585, -0.1789496, -1.658306, 0, 1, 0.08235294, 1,
-0.3511739, 0.1369246, -1.93287, 0, 1, 0.08627451, 1,
-0.3479653, -1.664649, -3.219615, 0, 1, 0.09411765, 1,
-0.3471893, 0.05484603, -1.635275, 0, 1, 0.1019608, 1,
-0.3382449, -1.147579, -2.539292, 0, 1, 0.1058824, 1,
-0.3377676, -2.381315, -3.685598, 0, 1, 0.1137255, 1,
-0.3332773, -0.2280615, -1.908066, 0, 1, 0.1176471, 1,
-0.3291429, 0.0005436837, -2.103184, 0, 1, 0.1254902, 1,
-0.3261213, 1.553465, 0.760333, 0, 1, 0.1294118, 1,
-0.3229911, -0.3938448, -2.524149, 0, 1, 0.1372549, 1,
-0.317212, -1.025726, -1.299036, 0, 1, 0.1411765, 1,
-0.3111097, -0.1035531, 0.007587089, 0, 1, 0.1490196, 1,
-0.3093612, -0.2447732, -1.604722, 0, 1, 0.1529412, 1,
-0.3031845, 0.8926939, -0.7634744, 0, 1, 0.1607843, 1,
-0.3020214, 0.4498475, 0.05547485, 0, 1, 0.1647059, 1,
-0.3019856, -0.4705189, -3.183599, 0, 1, 0.172549, 1,
-0.2999672, -0.7220209, -3.117125, 0, 1, 0.1764706, 1,
-0.2972648, -1.279001, -4.362484, 0, 1, 0.1843137, 1,
-0.2972566, 1.132831, -0.1806626, 0, 1, 0.1882353, 1,
-0.277258, 1.05729, 1.128332, 0, 1, 0.1960784, 1,
-0.2747692, -1.683442, -2.221497, 0, 1, 0.2039216, 1,
-0.2747588, -0.8974597, -2.036107, 0, 1, 0.2078431, 1,
-0.2695807, 0.9935891, -0.5106766, 0, 1, 0.2156863, 1,
-0.2688733, -1.204702, -1.531065, 0, 1, 0.2196078, 1,
-0.2676948, 1.628968, 0.9132153, 0, 1, 0.227451, 1,
-0.2666845, 1.64004, -0.7955119, 0, 1, 0.2313726, 1,
-0.2499384, -1.214048, -1.801737, 0, 1, 0.2392157, 1,
-0.2497045, -0.5487435, -2.264427, 0, 1, 0.2431373, 1,
-0.2460409, -1.385926, -2.759389, 0, 1, 0.2509804, 1,
-0.2458356, 1.536071, 0.06283953, 0, 1, 0.254902, 1,
-0.2431894, 1.105115, -0.02911142, 0, 1, 0.2627451, 1,
-0.2430999, 0.4275134, -1.346848, 0, 1, 0.2666667, 1,
-0.2417882, -0.9419122, -3.815231, 0, 1, 0.2745098, 1,
-0.2414634, -0.4214818, -4.016339, 0, 1, 0.2784314, 1,
-0.2365167, -0.08117928, -2.918602, 0, 1, 0.2862745, 1,
-0.23566, 1.036543, -0.6324263, 0, 1, 0.2901961, 1,
-0.2294396, 0.8861025, 0.1942052, 0, 1, 0.2980392, 1,
-0.2271105, 2.695747, -2.742803, 0, 1, 0.3058824, 1,
-0.2229411, -0.3728378, -0.9687108, 0, 1, 0.3098039, 1,
-0.2229393, -1.08999, -2.685472, 0, 1, 0.3176471, 1,
-0.2227741, 0.3136798, 0.9630075, 0, 1, 0.3215686, 1,
-0.2149366, 2.323924, -1.291649, 0, 1, 0.3294118, 1,
-0.2124606, 0.3050781, -0.6245396, 0, 1, 0.3333333, 1,
-0.2116511, 0.6622543, -0.5587146, 0, 1, 0.3411765, 1,
-0.2109817, -0.797542, -3.924258, 0, 1, 0.345098, 1,
-0.2080679, 0.1406143, -1.040876, 0, 1, 0.3529412, 1,
-0.206339, 0.1639751, -3.152542, 0, 1, 0.3568628, 1,
-0.205846, -0.1354651, -1.622985, 0, 1, 0.3647059, 1,
-0.2052324, -1.23351, -2.167599, 0, 1, 0.3686275, 1,
-0.2033591, -2.18991, -3.465424, 0, 1, 0.3764706, 1,
-0.1988024, -0.7580944, -2.599276, 0, 1, 0.3803922, 1,
-0.1874127, -0.2241133, -2.885443, 0, 1, 0.3882353, 1,
-0.1747679, -1.28709, -3.448153, 0, 1, 0.3921569, 1,
-0.1728165, 0.6805573, -1.632558, 0, 1, 0.4, 1,
-0.1714216, -0.05453897, -0.5349811, 0, 1, 0.4078431, 1,
-0.1693289, 0.4838321, 1.288791, 0, 1, 0.4117647, 1,
-0.1681492, -1.099307, -2.076147, 0, 1, 0.4196078, 1,
-0.1674854, 1.886917, -1.586375, 0, 1, 0.4235294, 1,
-0.1668132, 0.258713, -1.744957, 0, 1, 0.4313726, 1,
-0.1657752, -1.515323, -2.718297, 0, 1, 0.4352941, 1,
-0.1626893, 0.2742305, -1.290166, 0, 1, 0.4431373, 1,
-0.1485927, -0.2892592, -2.387003, 0, 1, 0.4470588, 1,
-0.1475269, 0.5561849, -0.4818663, 0, 1, 0.454902, 1,
-0.1467693, 0.4895959, -1.065744, 0, 1, 0.4588235, 1,
-0.1456738, 0.4114524, -0.01282597, 0, 1, 0.4666667, 1,
-0.1439725, 0.4564779, -0.7024417, 0, 1, 0.4705882, 1,
-0.1401875, 1.548446, 0.4259928, 0, 1, 0.4784314, 1,
-0.1390436, 0.7071491, -0.8629098, 0, 1, 0.4823529, 1,
-0.1388344, -1.148499, -2.301133, 0, 1, 0.4901961, 1,
-0.1364922, 0.2990347, -0.5135409, 0, 1, 0.4941176, 1,
-0.1331443, -0.6084491, -4.791217, 0, 1, 0.5019608, 1,
-0.130375, 0.3182982, 0.3798554, 0, 1, 0.509804, 1,
-0.1287538, -1.626371, -1.085308, 0, 1, 0.5137255, 1,
-0.1280116, -0.2185782, -2.706494, 0, 1, 0.5215687, 1,
-0.1240499, 0.9048043, -1.353758, 0, 1, 0.5254902, 1,
-0.1238947, -1.113792, -3.404214, 0, 1, 0.5333334, 1,
-0.122881, 0.3933685, 1.2795, 0, 1, 0.5372549, 1,
-0.1178829, 0.1033714, -0.7400476, 0, 1, 0.5450981, 1,
-0.1177107, 2.640662, 0.3884728, 0, 1, 0.5490196, 1,
-0.1155532, -0.04225666, -2.528596, 0, 1, 0.5568628, 1,
-0.1146227, 0.2438204, -0.8549041, 0, 1, 0.5607843, 1,
-0.1099003, 1.279282, 0.8063676, 0, 1, 0.5686275, 1,
-0.1080729, -1.083367, -3.224961, 0, 1, 0.572549, 1,
-0.1075692, -1.23064, -3.03495, 0, 1, 0.5803922, 1,
-0.1061058, 1.189739, -0.01148846, 0, 1, 0.5843138, 1,
-0.1055335, -0.541544, -2.727471, 0, 1, 0.5921569, 1,
-0.1053893, -0.7182497, -3.17626, 0, 1, 0.5960785, 1,
-0.105353, -1.537249, -1.814768, 0, 1, 0.6039216, 1,
-0.1043747, -0.4672775, -0.988214, 0, 1, 0.6117647, 1,
-0.104178, -0.7427159, -3.47575, 0, 1, 0.6156863, 1,
-0.1027057, -0.5043499, -3.633681, 0, 1, 0.6235294, 1,
-0.1019387, -0.1734072, -3.593555, 0, 1, 0.627451, 1,
-0.1014064, 0.4977797, -0.8968405, 0, 1, 0.6352941, 1,
-0.08974043, -0.892549, -3.227665, 0, 1, 0.6392157, 1,
-0.08788536, -1.440096, -3.552167, 0, 1, 0.6470588, 1,
-0.08723668, 0.8495161, 0.3732176, 0, 1, 0.6509804, 1,
-0.08458603, 0.4307385, 0.04665703, 0, 1, 0.6588235, 1,
-0.08116715, -0.3807569, -3.202938, 0, 1, 0.6627451, 1,
-0.079905, 0.676673, -1.029304, 0, 1, 0.6705883, 1,
-0.07845113, -0.01784752, -0.5849066, 0, 1, 0.6745098, 1,
-0.07160484, -0.3679252, -4.75013, 0, 1, 0.682353, 1,
-0.06370222, 0.1510286, -0.8657289, 0, 1, 0.6862745, 1,
-0.05544556, -0.5105911, -2.592326, 0, 1, 0.6941177, 1,
-0.05257992, 0.4354853, -0.4413384, 0, 1, 0.7019608, 1,
-0.05094379, 1.727859, 1.82644, 0, 1, 0.7058824, 1,
-0.04842926, 0.1405357, 0.2441492, 0, 1, 0.7137255, 1,
-0.04475198, 0.3883767, -0.8934108, 0, 1, 0.7176471, 1,
-0.04301052, 1.122097, -0.1846772, 0, 1, 0.7254902, 1,
-0.04278947, 0.7503299, 0.1138384, 0, 1, 0.7294118, 1,
-0.04235404, 1.117573, -0.52587, 0, 1, 0.7372549, 1,
-0.03874381, -1.379861, -3.015473, 0, 1, 0.7411765, 1,
-0.03751095, 1.367004, -0.5251257, 0, 1, 0.7490196, 1,
-0.03635583, 0.2890354, -0.6501244, 0, 1, 0.7529412, 1,
-0.03530477, 0.5926351, 1.104872, 0, 1, 0.7607843, 1,
-0.02130881, -0.6737529, -3.200658, 0, 1, 0.7647059, 1,
-0.01910763, -0.8308315, -3.187871, 0, 1, 0.772549, 1,
-0.01810042, -0.5868496, -3.15772, 0, 1, 0.7764706, 1,
-0.01769359, 0.9617704, 1.482532, 0, 1, 0.7843137, 1,
-0.0143413, -0.8309828, -4.483449, 0, 1, 0.7882353, 1,
-0.01402283, 0.5861925, 0.274167, 0, 1, 0.7960784, 1,
-0.01165778, 0.7877415, 1.91593, 0, 1, 0.8039216, 1,
-0.007649818, -0.1018677, -2.137788, 0, 1, 0.8078431, 1,
-0.006310552, -1.308318, -2.417084, 0, 1, 0.8156863, 1,
-0.006149271, 1.184083, 1.194556, 0, 1, 0.8196079, 1,
-0.003725692, 1.511935, 1.403615, 0, 1, 0.827451, 1,
-0.0007470567, 1.027047, -1.574026, 0, 1, 0.8313726, 1,
0.01124249, -0.6380587, 2.369324, 0, 1, 0.8392157, 1,
0.01135408, 0.7506147, 0.6892559, 0, 1, 0.8431373, 1,
0.01215188, 1.429417, -1.316601, 0, 1, 0.8509804, 1,
0.01216173, 1.200248, 1.549801, 0, 1, 0.854902, 1,
0.0199736, -0.252036, 3.641046, 0, 1, 0.8627451, 1,
0.02024162, 0.2719861, -0.5580139, 0, 1, 0.8666667, 1,
0.02074475, 0.2423138, 0.3960982, 0, 1, 0.8745098, 1,
0.02408131, 0.9577538, -0.3104441, 0, 1, 0.8784314, 1,
0.02919485, -0.5497298, 3.762128, 0, 1, 0.8862745, 1,
0.0341185, -2.213467, 2.666539, 0, 1, 0.8901961, 1,
0.03820059, -0.00101929, 0.1470941, 0, 1, 0.8980392, 1,
0.03950063, 0.06706323, 0.2340796, 0, 1, 0.9058824, 1,
0.03969043, 0.6518654, 1.016694, 0, 1, 0.9098039, 1,
0.04469964, 0.4134936, 1.293002, 0, 1, 0.9176471, 1,
0.04560059, -0.7782884, 2.833016, 0, 1, 0.9215686, 1,
0.04730751, 1.374278, 0.2844432, 0, 1, 0.9294118, 1,
0.04827455, -0.2260451, 2.819284, 0, 1, 0.9333333, 1,
0.05463934, 1.9051, 2.586973, 0, 1, 0.9411765, 1,
0.05645623, -0.2880307, 0.8811274, 0, 1, 0.945098, 1,
0.059185, -0.3197255, 3.609124, 0, 1, 0.9529412, 1,
0.06241938, -0.3672161, 4.204676, 0, 1, 0.9568627, 1,
0.06581098, 0.2630934, -1.587151, 0, 1, 0.9647059, 1,
0.06671907, 0.8107801, 0.2688661, 0, 1, 0.9686275, 1,
0.06823929, -0.8755934, 3.27364, 0, 1, 0.9764706, 1,
0.07054329, 0.08179518, -1.697416, 0, 1, 0.9803922, 1,
0.07217345, 0.2952135, -1.418663, 0, 1, 0.9882353, 1,
0.07257576, 0.3491187, 0.137549, 0, 1, 0.9921569, 1,
0.07405361, -0.3460187, 2.191311, 0, 1, 1, 1,
0.08424857, -1.664341, 3.300961, 0, 0.9921569, 1, 1,
0.08480005, 1.815061, -0.3705564, 0, 0.9882353, 1, 1,
0.08599412, -0.5788966, 2.292422, 0, 0.9803922, 1, 1,
0.08609992, -0.6785317, 2.09112, 0, 0.9764706, 1, 1,
0.08858829, -0.7169665, 1.565335, 0, 0.9686275, 1, 1,
0.09097933, 1.477982, -0.5159652, 0, 0.9647059, 1, 1,
0.09240439, -1.044623, 2.91561, 0, 0.9568627, 1, 1,
0.09245071, -1.535924, 3.674601, 0, 0.9529412, 1, 1,
0.09426263, 0.918239, 1.787993, 0, 0.945098, 1, 1,
0.09464277, -1.416609, 2.062849, 0, 0.9411765, 1, 1,
0.09511986, -2.846102, 3.0156, 0, 0.9333333, 1, 1,
0.09638833, 0.1339929, 0.3762472, 0, 0.9294118, 1, 1,
0.09838361, -0.4918178, 4.044781, 0, 0.9215686, 1, 1,
0.1029409, 0.6992643, 0.4273055, 0, 0.9176471, 1, 1,
0.1038436, -0.1081733, 2.069727, 0, 0.9098039, 1, 1,
0.104086, 0.2198039, -0.4823806, 0, 0.9058824, 1, 1,
0.1062606, -0.8661365, 1.35055, 0, 0.8980392, 1, 1,
0.1070858, -0.02926986, 1.70823, 0, 0.8901961, 1, 1,
0.1074786, 0.7243617, -1.118976, 0, 0.8862745, 1, 1,
0.1112698, -0.1402526, 3.839187, 0, 0.8784314, 1, 1,
0.1143277, -0.03477103, 1.764454, 0, 0.8745098, 1, 1,
0.1214075, -0.1363998, 2.896466, 0, 0.8666667, 1, 1,
0.1256378, -0.5907364, 2.899225, 0, 0.8627451, 1, 1,
0.1296773, 0.3855228, -1.108991, 0, 0.854902, 1, 1,
0.1297766, 0.5118663, -0.8896257, 0, 0.8509804, 1, 1,
0.129835, -0.7934562, 1.798125, 0, 0.8431373, 1, 1,
0.1306112, 0.3592255, -0.4778185, 0, 0.8392157, 1, 1,
0.1317813, -0.2682064, 0.4589343, 0, 0.8313726, 1, 1,
0.1319341, 0.4385859, 1.108634, 0, 0.827451, 1, 1,
0.1321841, 0.5216302, 0.882267, 0, 0.8196079, 1, 1,
0.1453118, -0.9732653, 3.886096, 0, 0.8156863, 1, 1,
0.150789, -0.5672849, 0.999683, 0, 0.8078431, 1, 1,
0.1559621, 0.2298435, -0.04293654, 0, 0.8039216, 1, 1,
0.1593398, -1.132496, 2.278991, 0, 0.7960784, 1, 1,
0.1632555, -0.9851394, 2.689483, 0, 0.7882353, 1, 1,
0.1656005, -0.1637674, 2.276428, 0, 0.7843137, 1, 1,
0.1669317, 1.776842, -0.5935851, 0, 0.7764706, 1, 1,
0.1676168, 0.5664746, 1.314708, 0, 0.772549, 1, 1,
0.1691443, -0.9842705, 2.283357, 0, 0.7647059, 1, 1,
0.1737256, 1.145657, -0.1899522, 0, 0.7607843, 1, 1,
0.1758032, -0.2873162, 2.745281, 0, 0.7529412, 1, 1,
0.1804242, -0.9544685, 0.6073326, 0, 0.7490196, 1, 1,
0.184653, -0.2767599, 1.571874, 0, 0.7411765, 1, 1,
0.1861802, 1.119472, -1.761569, 0, 0.7372549, 1, 1,
0.1873845, 0.5615801, 1.258449, 0, 0.7294118, 1, 1,
0.1925362, -0.879535, 3.644803, 0, 0.7254902, 1, 1,
0.1956135, 0.8907438, -1.188033, 0, 0.7176471, 1, 1,
0.1962275, -1.44221, 2.844007, 0, 0.7137255, 1, 1,
0.1967433, -0.2842646, 2.804466, 0, 0.7058824, 1, 1,
0.1992196, -0.393514, 1.186161, 0, 0.6980392, 1, 1,
0.2007339, 1.165389, 0.919223, 0, 0.6941177, 1, 1,
0.2033967, 0.3355702, -0.08811731, 0, 0.6862745, 1, 1,
0.2044687, -0.5793537, 4.181193, 0, 0.682353, 1, 1,
0.2096034, 0.09843305, -0.3865789, 0, 0.6745098, 1, 1,
0.2104097, 0.845976, 1.354357, 0, 0.6705883, 1, 1,
0.2104862, 0.1774171, 1.651983, 0, 0.6627451, 1, 1,
0.2123674, 0.1131776, -0.03282165, 0, 0.6588235, 1, 1,
0.2164318, 0.9622099, -0.3842609, 0, 0.6509804, 1, 1,
0.216839, -0.9926674, 0.8070078, 0, 0.6470588, 1, 1,
0.2209505, 0.2492496, 0.4513246, 0, 0.6392157, 1, 1,
0.2275393, 0.1333559, 1.261833, 0, 0.6352941, 1, 1,
0.2278272, -0.1207847, 1.640396, 0, 0.627451, 1, 1,
0.2334606, 0.0901226, -1.0749, 0, 0.6235294, 1, 1,
0.2336191, -1.212862, 3.701223, 0, 0.6156863, 1, 1,
0.2355426, 1.08016, -0.3396009, 0, 0.6117647, 1, 1,
0.2362334, -0.09907311, 4.295332, 0, 0.6039216, 1, 1,
0.2365531, -2.13412, 3.195757, 0, 0.5960785, 1, 1,
0.239536, 0.4924544, -0.4106157, 0, 0.5921569, 1, 1,
0.2406414, -0.06932732, 2.312846, 0, 0.5843138, 1, 1,
0.2417608, -0.7345792, 3.335667, 0, 0.5803922, 1, 1,
0.2423846, -2.032587, 3.358322, 0, 0.572549, 1, 1,
0.2529467, 1.222206, -1.246182, 0, 0.5686275, 1, 1,
0.2532699, -0.5177796, -0.2544619, 0, 0.5607843, 1, 1,
0.2566472, 0.5260434, -0.794094, 0, 0.5568628, 1, 1,
0.2573425, -0.5135071, 1.346384, 0, 0.5490196, 1, 1,
0.2606874, 1.347936, 0.6275506, 0, 0.5450981, 1, 1,
0.2626419, 0.4106749, -0.6406769, 0, 0.5372549, 1, 1,
0.2628419, -0.7282888, 3.709931, 0, 0.5333334, 1, 1,
0.2667713, 0.5223593, 1.118973, 0, 0.5254902, 1, 1,
0.269978, 2.022582, -0.1173528, 0, 0.5215687, 1, 1,
0.2713326, -1.285389, 1.90279, 0, 0.5137255, 1, 1,
0.273144, -0.1139812, 1.419112, 0, 0.509804, 1, 1,
0.276945, 1.324089, 1.098262, 0, 0.5019608, 1, 1,
0.2799684, -1.138731, 3.229391, 0, 0.4941176, 1, 1,
0.2805493, -1.974007, 2.559213, 0, 0.4901961, 1, 1,
0.2859228, -1.249765, 2.918862, 0, 0.4823529, 1, 1,
0.2869172, -0.7913321, 1.886205, 0, 0.4784314, 1, 1,
0.2879447, 0.5477402, 1.268278, 0, 0.4705882, 1, 1,
0.2882288, 1.3158, 1.131233, 0, 0.4666667, 1, 1,
0.2902963, -1.007491, 1.351734, 0, 0.4588235, 1, 1,
0.2918575, -0.9582179, 4.746559, 0, 0.454902, 1, 1,
0.2934455, -1.257234, 1.821977, 0, 0.4470588, 1, 1,
0.2973573, 0.2384499, 2.154985, 0, 0.4431373, 1, 1,
0.2992928, -0.7866872, 4.362304, 0, 0.4352941, 1, 1,
0.3027875, -0.03899713, 2.051453, 0, 0.4313726, 1, 1,
0.3037105, 0.08483264, 2.921169, 0, 0.4235294, 1, 1,
0.3066393, -0.1507302, 1.146966, 0, 0.4196078, 1, 1,
0.3070147, -1.321982, 2.237732, 0, 0.4117647, 1, 1,
0.3096451, 0.03092093, 0.1531266, 0, 0.4078431, 1, 1,
0.3110438, 0.80609, -1.053051, 0, 0.4, 1, 1,
0.3114557, 0.7969214, 2.037449, 0, 0.3921569, 1, 1,
0.3138901, 0.5890989, -0.6906484, 0, 0.3882353, 1, 1,
0.3150705, -1.17241, 2.455042, 0, 0.3803922, 1, 1,
0.3159775, 1.174875, -0.2094857, 0, 0.3764706, 1, 1,
0.3160025, 1.736073, 0.01159427, 0, 0.3686275, 1, 1,
0.3181851, -1.879407, 3.909988, 0, 0.3647059, 1, 1,
0.3187008, 0.003530757, 2.293434, 0, 0.3568628, 1, 1,
0.3226654, -0.2606838, 2.578583, 0, 0.3529412, 1, 1,
0.3229136, -1.103665, 2.64079, 0, 0.345098, 1, 1,
0.3250565, -0.7807642, 4.65873, 0, 0.3411765, 1, 1,
0.3289281, -0.2778245, 2.816322, 0, 0.3333333, 1, 1,
0.3355221, 3.205977, 1.710564, 0, 0.3294118, 1, 1,
0.3381615, 1.313761, 0.6578432, 0, 0.3215686, 1, 1,
0.3413544, -0.08728727, 1.498746, 0, 0.3176471, 1, 1,
0.3458694, 0.7167982, 0.9947727, 0, 0.3098039, 1, 1,
0.3477035, 0.1005183, 1.113375, 0, 0.3058824, 1, 1,
0.3520418, 2.073049, -0.9505461, 0, 0.2980392, 1, 1,
0.3548472, 0.5906438, -0.08433329, 0, 0.2901961, 1, 1,
0.3554665, -0.6865847, 3.090941, 0, 0.2862745, 1, 1,
0.3556755, 0.9109379, 0.8612723, 0, 0.2784314, 1, 1,
0.3559548, 1.326778, 1.669461, 0, 0.2745098, 1, 1,
0.360657, 2.601807, 0.9973001, 0, 0.2666667, 1, 1,
0.3624834, -0.6187875, 2.403532, 0, 0.2627451, 1, 1,
0.364854, -0.8245655, 2.824251, 0, 0.254902, 1, 1,
0.3677698, -0.7297859, 3.341854, 0, 0.2509804, 1, 1,
0.3693625, -0.1134306, 1.698433, 0, 0.2431373, 1, 1,
0.3698074, -0.6825034, 4.691586, 0, 0.2392157, 1, 1,
0.3754973, 0.02299482, 0.4673782, 0, 0.2313726, 1, 1,
0.3803824, -0.4692916, 5.46785, 0, 0.227451, 1, 1,
0.3818007, -0.3270173, 2.531207, 0, 0.2196078, 1, 1,
0.385398, -0.6508765, 2.173442, 0, 0.2156863, 1, 1,
0.3863229, -0.383001, 2.613841, 0, 0.2078431, 1, 1,
0.3911653, 1.308512, 1.591645, 0, 0.2039216, 1, 1,
0.39346, 0.632245, 1.409487, 0, 0.1960784, 1, 1,
0.3978022, 0.4184818, 0.9803113, 0, 0.1882353, 1, 1,
0.3986272, 1.78443, 0.3063709, 0, 0.1843137, 1, 1,
0.399688, 1.212307, 0.9983582, 0, 0.1764706, 1, 1,
0.4002135, -1.703349, 2.503805, 0, 0.172549, 1, 1,
0.4065528, -0.4885864, 2.93016, 0, 0.1647059, 1, 1,
0.406833, 1.208271, -0.2384948, 0, 0.1607843, 1, 1,
0.4072314, 1.025999, 0.01183034, 0, 0.1529412, 1, 1,
0.4114813, -0.7954422, 2.597151, 0, 0.1490196, 1, 1,
0.4137381, 0.1899842, -0.2884464, 0, 0.1411765, 1, 1,
0.4138427, -0.5205466, 2.444136, 0, 0.1372549, 1, 1,
0.4183462, 0.629867, 0.1369954, 0, 0.1294118, 1, 1,
0.4204952, -0.8720294, 2.06081, 0, 0.1254902, 1, 1,
0.4206041, -0.7961919, 1.830297, 0, 0.1176471, 1, 1,
0.4207136, -0.2304471, 2.125489, 0, 0.1137255, 1, 1,
0.4229881, 0.253073, 2.579385, 0, 0.1058824, 1, 1,
0.4232049, -1.681024, 3.779162, 0, 0.09803922, 1, 1,
0.4261595, 0.5536637, 0.3744742, 0, 0.09411765, 1, 1,
0.4283989, 0.8324154, 2.104023, 0, 0.08627451, 1, 1,
0.429268, -1.592223, 3.185894, 0, 0.08235294, 1, 1,
0.4304956, 0.8611181, 2.232899, 0, 0.07450981, 1, 1,
0.4342576, -0.7006668, 1.453959, 0, 0.07058824, 1, 1,
0.4351626, -0.7162257, 2.715789, 0, 0.0627451, 1, 1,
0.4369549, 0.4875082, -0.9860753, 0, 0.05882353, 1, 1,
0.4374661, -0.1352844, 2.109462, 0, 0.05098039, 1, 1,
0.4384492, 0.1860148, 1.228637, 0, 0.04705882, 1, 1,
0.4387734, -1.815097, 4.116529, 0, 0.03921569, 1, 1,
0.4388666, -2.614806, 3.346824, 0, 0.03529412, 1, 1,
0.4463801, 1.97732, -1.296243, 0, 0.02745098, 1, 1,
0.4583566, 0.3510751, 1.547778, 0, 0.02352941, 1, 1,
0.4617254, -0.2888603, 2.695903, 0, 0.01568628, 1, 1,
0.4636763, 1.259629, 2.051015, 0, 0.01176471, 1, 1,
0.4681927, 0.1382972, 0.6468407, 0, 0.003921569, 1, 1,
0.4793577, 0.7121239, 0.5037915, 0.003921569, 0, 1, 1,
0.4815834, -1.018523, 2.273936, 0.007843138, 0, 1, 1,
0.4883607, 0.9965777, -0.1618547, 0.01568628, 0, 1, 1,
0.5014217, -0.483496, 3.58879, 0.01960784, 0, 1, 1,
0.5025813, 1.677748, 0.9703734, 0.02745098, 0, 1, 1,
0.506319, -0.01279637, 0.6924916, 0.03137255, 0, 1, 1,
0.5136574, 1.728293, 0.3874636, 0.03921569, 0, 1, 1,
0.5152764, 0.8797444, 0.6207348, 0.04313726, 0, 1, 1,
0.5302716, 0.02643799, 0.6931092, 0.05098039, 0, 1, 1,
0.5371872, -1.034417, 2.191123, 0.05490196, 0, 1, 1,
0.5418625, 0.9617639, 2.402609, 0.0627451, 0, 1, 1,
0.5435749, 0.7113376, -0.7979084, 0.06666667, 0, 1, 1,
0.5439361, 0.05671715, 0.8203326, 0.07450981, 0, 1, 1,
0.5455195, 0.8849081, 0.9202303, 0.07843138, 0, 1, 1,
0.5464804, -0.2594073, 1.464544, 0.08627451, 0, 1, 1,
0.5487897, 0.2166557, 1.438656, 0.09019608, 0, 1, 1,
0.5492797, -0.3674419, 2.205386, 0.09803922, 0, 1, 1,
0.5502568, 0.1512455, 3.67987, 0.1058824, 0, 1, 1,
0.5688678, -1.374765, 1.706251, 0.1098039, 0, 1, 1,
0.5716605, -1.009948, 2.379608, 0.1176471, 0, 1, 1,
0.5816168, 0.4056256, 1.196617, 0.1215686, 0, 1, 1,
0.5830857, 1.202323, 1.04019, 0.1294118, 0, 1, 1,
0.5835464, 0.4777342, 0.8920986, 0.1333333, 0, 1, 1,
0.5836263, 1.049766, 0.9500909, 0.1411765, 0, 1, 1,
0.583707, 0.8950005, -0.089596, 0.145098, 0, 1, 1,
0.5839573, 0.2641601, 0.121439, 0.1529412, 0, 1, 1,
0.586596, 0.5587811, 0.7182989, 0.1568628, 0, 1, 1,
0.5952633, -0.1507227, 1.296345, 0.1647059, 0, 1, 1,
0.5953465, 0.4602053, 0.2480116, 0.1686275, 0, 1, 1,
0.5966796, -1.110538, 3.424699, 0.1764706, 0, 1, 1,
0.59864, 2.071173, 0.8192849, 0.1803922, 0, 1, 1,
0.5994425, -1.06607, 1.862712, 0.1882353, 0, 1, 1,
0.6017069, -1.310781, 3.233271, 0.1921569, 0, 1, 1,
0.6062598, -0.8297659, 3.523779, 0.2, 0, 1, 1,
0.6082043, 0.2310692, 2.183169, 0.2078431, 0, 1, 1,
0.6126059, -1.144645, 2.83057, 0.2117647, 0, 1, 1,
0.6158882, 0.4192405, -0.5128284, 0.2196078, 0, 1, 1,
0.6186217, -0.3162316, 2.567331, 0.2235294, 0, 1, 1,
0.6226115, 2.632787, 0.2846535, 0.2313726, 0, 1, 1,
0.623189, 1.413371, 0.216696, 0.2352941, 0, 1, 1,
0.6236186, 0.3778409, -0.03493089, 0.2431373, 0, 1, 1,
0.6252347, -0.2259543, 1.783652, 0.2470588, 0, 1, 1,
0.6266226, -0.9260969, 2.975127, 0.254902, 0, 1, 1,
0.6291703, -0.7965813, 2.096371, 0.2588235, 0, 1, 1,
0.6308901, 0.1688362, 1.964239, 0.2666667, 0, 1, 1,
0.6313281, -0.2334983, 2.458451, 0.2705882, 0, 1, 1,
0.6361787, -0.954321, 1.152097, 0.2784314, 0, 1, 1,
0.6414047, -0.4076421, 2.24974, 0.282353, 0, 1, 1,
0.6416034, 1.323758, -1.386525, 0.2901961, 0, 1, 1,
0.6416769, -1.396136, -0.006310625, 0.2941177, 0, 1, 1,
0.6495243, -1.845708, 1.34673, 0.3019608, 0, 1, 1,
0.6523265, -0.7364029, 1.391885, 0.3098039, 0, 1, 1,
0.6530474, 1.204027, 0.6979333, 0.3137255, 0, 1, 1,
0.6650791, 0.584358, 0.6944894, 0.3215686, 0, 1, 1,
0.667752, 2.588808, -0.9399645, 0.3254902, 0, 1, 1,
0.6695891, -0.4666617, 0.5445632, 0.3333333, 0, 1, 1,
0.6720238, -0.5678369, 2.688527, 0.3372549, 0, 1, 1,
0.673068, 0.01330115, 0.4788062, 0.345098, 0, 1, 1,
0.674013, 2.182226, 0.7849142, 0.3490196, 0, 1, 1,
0.6769173, 1.554396, 0.9109251, 0.3568628, 0, 1, 1,
0.6781772, 1.205437, 1.047076, 0.3607843, 0, 1, 1,
0.6796421, 0.7654434, 1.259971, 0.3686275, 0, 1, 1,
0.6810582, 0.322231, 2.577775, 0.372549, 0, 1, 1,
0.6837463, 0.1206158, 2.630714, 0.3803922, 0, 1, 1,
0.6856633, 0.131389, 3.046107, 0.3843137, 0, 1, 1,
0.685966, 2.414362, -0.5919439, 0.3921569, 0, 1, 1,
0.6870369, 0.4192843, 1.870298, 0.3960784, 0, 1, 1,
0.6905823, 2.36042, -1.508977, 0.4039216, 0, 1, 1,
0.695986, -0.2904607, 1.257879, 0.4117647, 0, 1, 1,
0.697505, 0.8493627, 2.378348, 0.4156863, 0, 1, 1,
0.7003579, 0.5265697, 2.178845, 0.4235294, 0, 1, 1,
0.7087881, 1.641173, -0.8277816, 0.427451, 0, 1, 1,
0.7097018, -0.1323496, -0.1918362, 0.4352941, 0, 1, 1,
0.7144273, -1.01991, 2.231728, 0.4392157, 0, 1, 1,
0.7161415, -0.1074534, 3.428785, 0.4470588, 0, 1, 1,
0.7195796, 0.529346, -0.2212053, 0.4509804, 0, 1, 1,
0.7243208, -1.57294, 3.775753, 0.4588235, 0, 1, 1,
0.7244145, 0.2000583, 1.551988, 0.4627451, 0, 1, 1,
0.7264268, -0.03913522, 2.304988, 0.4705882, 0, 1, 1,
0.7312409, 0.6507051, 2.959313, 0.4745098, 0, 1, 1,
0.7351549, 0.8398721, 1.480761, 0.4823529, 0, 1, 1,
0.745736, -1.012398, 3.821864, 0.4862745, 0, 1, 1,
0.7461033, -0.7083602, 4.110913, 0.4941176, 0, 1, 1,
0.7643734, -0.3174085, 0.9424593, 0.5019608, 0, 1, 1,
0.7664919, -2.016241, 0.8840438, 0.5058824, 0, 1, 1,
0.7665529, 0.06362659, 2.00204, 0.5137255, 0, 1, 1,
0.7669737, 0.1744849, 1.262343, 0.5176471, 0, 1, 1,
0.7673022, 0.494205, 1.642813, 0.5254902, 0, 1, 1,
0.7676406, 0.7149453, -0.2372583, 0.5294118, 0, 1, 1,
0.7678748, -1.114235, 2.16806, 0.5372549, 0, 1, 1,
0.7682151, 2.095139, 1.044945, 0.5411765, 0, 1, 1,
0.7683679, -1.023039, 2.340931, 0.5490196, 0, 1, 1,
0.7699188, 1.03772, 1.003121, 0.5529412, 0, 1, 1,
0.7769569, -0.8094878, 1.753469, 0.5607843, 0, 1, 1,
0.7816269, -1.066106, 2.778917, 0.5647059, 0, 1, 1,
0.7854839, -0.3125434, 0.8241324, 0.572549, 0, 1, 1,
0.7858023, 0.19612, 2.863786, 0.5764706, 0, 1, 1,
0.7932214, -0.5445116, 2.217267, 0.5843138, 0, 1, 1,
0.7992688, 0.322613, 1.748042, 0.5882353, 0, 1, 1,
0.7998341, 0.7258852, 0.8136964, 0.5960785, 0, 1, 1,
0.7999408, -0.1759369, 1.993786, 0.6039216, 0, 1, 1,
0.8032391, -0.0845773, 1.677302, 0.6078432, 0, 1, 1,
0.8033943, 0.1906813, 3.561305, 0.6156863, 0, 1, 1,
0.8040031, -0.807384, 1.380224, 0.6196079, 0, 1, 1,
0.807573, -0.5939139, 2.705627, 0.627451, 0, 1, 1,
0.8109246, -0.2187709, 2.150413, 0.6313726, 0, 1, 1,
0.813862, 1.941106, 1.221605, 0.6392157, 0, 1, 1,
0.8224968, -0.8065271, 3.029021, 0.6431373, 0, 1, 1,
0.8239821, 1.359256, 0.1540161, 0.6509804, 0, 1, 1,
0.8251796, 1.186708, 0.6978837, 0.654902, 0, 1, 1,
0.828631, 0.6459109, 1.590062, 0.6627451, 0, 1, 1,
0.8336825, 0.1216805, 0.8747051, 0.6666667, 0, 1, 1,
0.8350902, -0.4795814, 1.858869, 0.6745098, 0, 1, 1,
0.8370981, 0.9753848, 0.1892702, 0.6784314, 0, 1, 1,
0.837817, 0.3617597, 1.386322, 0.6862745, 0, 1, 1,
0.8388091, -0.771901, 2.952776, 0.6901961, 0, 1, 1,
0.8391798, 0.2495485, 2.042393, 0.6980392, 0, 1, 1,
0.8405426, 0.7798156, -0.3636717, 0.7058824, 0, 1, 1,
0.8491625, -1.080056, 1.584263, 0.7098039, 0, 1, 1,
0.8519074, 0.3310178, 1.03399, 0.7176471, 0, 1, 1,
0.8540794, 1.201812, 1.752735, 0.7215686, 0, 1, 1,
0.8558984, 0.9923521, 0.2784219, 0.7294118, 0, 1, 1,
0.8611727, 2.223434, -0.693818, 0.7333333, 0, 1, 1,
0.8614615, -0.3465752, 2.302731, 0.7411765, 0, 1, 1,
0.8657973, 1.053641, 0.8437329, 0.7450981, 0, 1, 1,
0.8663286, 0.211595, 0.9045469, 0.7529412, 0, 1, 1,
0.8707104, 0.9375623, 0.5518253, 0.7568628, 0, 1, 1,
0.87854, 0.5253313, 0.7809632, 0.7647059, 0, 1, 1,
0.8807393, 0.3862342, 2.151514, 0.7686275, 0, 1, 1,
0.8850723, 1.416729, -0.4013003, 0.7764706, 0, 1, 1,
0.8864794, 0.6835606, 1.380616, 0.7803922, 0, 1, 1,
0.8867213, -0.4248319, 2.211802, 0.7882353, 0, 1, 1,
0.8877465, -0.4272025, 2.142569, 0.7921569, 0, 1, 1,
0.8981273, -0.6797545, 4.49133, 0.8, 0, 1, 1,
0.9022487, -0.2175603, 1.90726, 0.8078431, 0, 1, 1,
0.9029284, 1.250442, 0.5726652, 0.8117647, 0, 1, 1,
0.9081165, 0.3515801, 1.650989, 0.8196079, 0, 1, 1,
0.9128857, 0.04437971, 2.732188, 0.8235294, 0, 1, 1,
0.9148482, 1.028751, 0.3360872, 0.8313726, 0, 1, 1,
0.9177036, -0.977143, 2.424286, 0.8352941, 0, 1, 1,
0.9215269, -1.264046, 2.400579, 0.8431373, 0, 1, 1,
0.9229276, -0.2891979, 2.685488, 0.8470588, 0, 1, 1,
0.9298408, 0.1947992, 2.011918, 0.854902, 0, 1, 1,
0.9350255, -0.2236988, 2.734628, 0.8588235, 0, 1, 1,
0.9379377, 1.065364, 1.393724, 0.8666667, 0, 1, 1,
0.9415113, -1.205025, 0.7949286, 0.8705882, 0, 1, 1,
0.9440588, 0.302366, 1.24051, 0.8784314, 0, 1, 1,
0.9570184, 0.3837708, 2.005817, 0.8823529, 0, 1, 1,
0.959519, -0.8718151, 0.8715686, 0.8901961, 0, 1, 1,
0.9613408, -0.07351955, 1.685233, 0.8941177, 0, 1, 1,
0.9674886, -0.2190736, 1.554128, 0.9019608, 0, 1, 1,
0.9735622, 0.002178267, 0.6204503, 0.9098039, 0, 1, 1,
0.9750494, -0.3143037, 1.821961, 0.9137255, 0, 1, 1,
0.9829658, 1.381884, 0.1696225, 0.9215686, 0, 1, 1,
0.9843218, 1.119282, 0.8110758, 0.9254902, 0, 1, 1,
0.9853624, 0.4777521, 1.055582, 0.9333333, 0, 1, 1,
0.9889103, -3.390609, 2.128462, 0.9372549, 0, 1, 1,
0.9916407, 1.871302, -0.7815524, 0.945098, 0, 1, 1,
0.9969288, 1.530631, 0.1316658, 0.9490196, 0, 1, 1,
0.9989399, -0.9983152, 0.4357309, 0.9568627, 0, 1, 1,
1.000991, 1.08748, 1.144822, 0.9607843, 0, 1, 1,
1.00256, -0.2691957, 0.9408941, 0.9686275, 0, 1, 1,
1.002682, -0.1412817, 2.32129, 0.972549, 0, 1, 1,
1.006606, -2.555692, 0.4102349, 0.9803922, 0, 1, 1,
1.008705, 0.9483217, 0.125498, 0.9843137, 0, 1, 1,
1.018363, -1.005965, 2.572623, 0.9921569, 0, 1, 1,
1.034504, 0.07709703, 0.9595361, 0.9960784, 0, 1, 1,
1.044651, 0.7145872, 0.3847159, 1, 0, 0.9960784, 1,
1.046631, -0.9262567, 1.68113, 1, 0, 0.9882353, 1,
1.051116, 1.063985, 0.4240882, 1, 0, 0.9843137, 1,
1.052715, 1.929869, 0.6319104, 1, 0, 0.9764706, 1,
1.061815, 1.395012, -0.08609311, 1, 0, 0.972549, 1,
1.062923, 0.2621714, 1.88384, 1, 0, 0.9647059, 1,
1.066253, 0.1939519, 1.04437, 1, 0, 0.9607843, 1,
1.067789, 1.070776, 1.380442, 1, 0, 0.9529412, 1,
1.079338, 0.9041594, -0.3925736, 1, 0, 0.9490196, 1,
1.080577, -0.290394, 1.681765, 1, 0, 0.9411765, 1,
1.082912, 0.2791239, 2.393776, 1, 0, 0.9372549, 1,
1.083493, 1.394758, 0.764703, 1, 0, 0.9294118, 1,
1.087676, -2.45909, 1.709133, 1, 0, 0.9254902, 1,
1.090931, 1.500218, -0.421327, 1, 0, 0.9176471, 1,
1.093497, -0.353028, 0.8600988, 1, 0, 0.9137255, 1,
1.095771, -0.3489148, 1.916901, 1, 0, 0.9058824, 1,
1.103474, 0.1418986, 3.515775, 1, 0, 0.9019608, 1,
1.104457, -0.6444072, 2.706572, 1, 0, 0.8941177, 1,
1.10502, 0.4752577, 0.7862863, 1, 0, 0.8862745, 1,
1.107973, -1.996692, 1.159463, 1, 0, 0.8823529, 1,
1.109329, -0.3775805, 3.355554, 1, 0, 0.8745098, 1,
1.116458, -1.091816, 2.783095, 1, 0, 0.8705882, 1,
1.118119, -0.1747086, 1.274737, 1, 0, 0.8627451, 1,
1.119665, 1.95162, -0.04813187, 1, 0, 0.8588235, 1,
1.120879, -0.5646243, 2.782783, 1, 0, 0.8509804, 1,
1.133074, -0.6684626, 2.600785, 1, 0, 0.8470588, 1,
1.137168, 0.8291467, 1.332933, 1, 0, 0.8392157, 1,
1.141397, -0.5636441, 1.067191, 1, 0, 0.8352941, 1,
1.142794, 0.443051, 0.4070986, 1, 0, 0.827451, 1,
1.146238, -0.01062267, 1.592762, 1, 0, 0.8235294, 1,
1.148966, -1.391747, 2.682636, 1, 0, 0.8156863, 1,
1.152279, 0.4149615, 1.822497, 1, 0, 0.8117647, 1,
1.158663, 0.6675975, 0.9044173, 1, 0, 0.8039216, 1,
1.163924, 0.4281242, 2.78123, 1, 0, 0.7960784, 1,
1.168414, 0.4796539, 1.796395, 1, 0, 0.7921569, 1,
1.176472, 0.2454217, 1.937769, 1, 0, 0.7843137, 1,
1.182823, 0.4244161, 1.584637, 1, 0, 0.7803922, 1,
1.182975, -0.3032587, 0.1209166, 1, 0, 0.772549, 1,
1.187405, -2.032743, 1.349736, 1, 0, 0.7686275, 1,
1.19129, -0.5772824, 2.605003, 1, 0, 0.7607843, 1,
1.196956, -1.187549, 1.900681, 1, 0, 0.7568628, 1,
1.197668, -1.247409, 1.227878, 1, 0, 0.7490196, 1,
1.207902, 0.9392772, 1.328842, 1, 0, 0.7450981, 1,
1.208718, 0.3817569, 0.432358, 1, 0, 0.7372549, 1,
1.210151, -1.082201, 2.280851, 1, 0, 0.7333333, 1,
1.218564, -0.3955671, 2.442267, 1, 0, 0.7254902, 1,
1.219736, -1.319367, 3.260489, 1, 0, 0.7215686, 1,
1.225172, -1.116231, 2.268314, 1, 0, 0.7137255, 1,
1.227272, 0.8532261, -0.536613, 1, 0, 0.7098039, 1,
1.249191, 0.2993947, 0.4903027, 1, 0, 0.7019608, 1,
1.271324, -0.6080398, 0.3477822, 1, 0, 0.6941177, 1,
1.271622, 0.2227531, 1.882928, 1, 0, 0.6901961, 1,
1.277175, 0.6794863, 0.6457517, 1, 0, 0.682353, 1,
1.277363, 0.5313299, 0.412361, 1, 0, 0.6784314, 1,
1.282371, -0.871823, 4.033259, 1, 0, 0.6705883, 1,
1.283408, -1.093861, 2.442858, 1, 0, 0.6666667, 1,
1.284029, 1.517449, 0.4055468, 1, 0, 0.6588235, 1,
1.286558, -1.340622, 3.430689, 1, 0, 0.654902, 1,
1.295337, 1.658255, 0.9268852, 1, 0, 0.6470588, 1,
1.297989, 1.165372, -0.2594924, 1, 0, 0.6431373, 1,
1.298709, 0.3184305, 0.7301487, 1, 0, 0.6352941, 1,
1.299124, -1.042023, 2.581775, 1, 0, 0.6313726, 1,
1.310872, -2.564361, 2.84625, 1, 0, 0.6235294, 1,
1.312254, -0.6937395, 2.669303, 1, 0, 0.6196079, 1,
1.312504, 0.4743208, 0.322116, 1, 0, 0.6117647, 1,
1.315938, -0.3896978, 1.837201, 1, 0, 0.6078432, 1,
1.329404, 0.4739275, 0.6590626, 1, 0, 0.6, 1,
1.337377, 0.04602491, 1.022455, 1, 0, 0.5921569, 1,
1.345876, 1.49197, -0.07274005, 1, 0, 0.5882353, 1,
1.372286, 0.1688027, 1.474291, 1, 0, 0.5803922, 1,
1.383474, -0.0765411, 0.9323742, 1, 0, 0.5764706, 1,
1.384162, 1.693664, -0.01183015, 1, 0, 0.5686275, 1,
1.405496, -0.1651566, 0.3758264, 1, 0, 0.5647059, 1,
1.429405, -1.764957, 2.684594, 1, 0, 0.5568628, 1,
1.434548, -0.3071052, 1.65949, 1, 0, 0.5529412, 1,
1.436793, -0.2229193, 2.412387, 1, 0, 0.5450981, 1,
1.437834, 0.4530231, 0.2812827, 1, 0, 0.5411765, 1,
1.444557, 0.8276178, 1.266322, 1, 0, 0.5333334, 1,
1.457807, 0.7345263, 1.66288, 1, 0, 0.5294118, 1,
1.458367, -0.2783424, 0.5837164, 1, 0, 0.5215687, 1,
1.463758, 1.093409, 1.024339, 1, 0, 0.5176471, 1,
1.466245, -0.5744518, 1.781328, 1, 0, 0.509804, 1,
1.469959, -1.783037, 3.482947, 1, 0, 0.5058824, 1,
1.472668, -0.4954215, 2.282495, 1, 0, 0.4980392, 1,
1.473676, -1.202327, 0.9619139, 1, 0, 0.4901961, 1,
1.477877, 0.622784, 1.858111, 1, 0, 0.4862745, 1,
1.47907, -0.6162802, 0.975906, 1, 0, 0.4784314, 1,
1.481739, -0.6497302, 3.449387, 1, 0, 0.4745098, 1,
1.485801, 0.05755811, 0.4843243, 1, 0, 0.4666667, 1,
1.491421, 2.29561, 1.160661, 1, 0, 0.4627451, 1,
1.49317, -0.6412196, 0.9481356, 1, 0, 0.454902, 1,
1.495355, -0.313466, 1.700046, 1, 0, 0.4509804, 1,
1.502127, -0.92764, 2.854889, 1, 0, 0.4431373, 1,
1.506625, -0.6981055, 1.570653, 1, 0, 0.4392157, 1,
1.507386, -0.5155031, 2.444225, 1, 0, 0.4313726, 1,
1.515254, -0.28563, 1.082062, 1, 0, 0.427451, 1,
1.524844, 0.4518567, 1.423411, 1, 0, 0.4196078, 1,
1.548265, 0.6494664, 0.470562, 1, 0, 0.4156863, 1,
1.558701, -0.2356632, 1.732973, 1, 0, 0.4078431, 1,
1.559726, -1.080789, 3.133838, 1, 0, 0.4039216, 1,
1.573827, 0.09778652, 1.09858, 1, 0, 0.3960784, 1,
1.576918, 0.06941229, 2.284826, 1, 0, 0.3882353, 1,
1.590359, -0.296181, 0.3925252, 1, 0, 0.3843137, 1,
1.592498, 0.05955493, 3.124632, 1, 0, 0.3764706, 1,
1.598114, -0.9666356, 2.660676, 1, 0, 0.372549, 1,
1.600187, 2.441582, 2.006367, 1, 0, 0.3647059, 1,
1.60657, 1.176995, 1.902764, 1, 0, 0.3607843, 1,
1.6084, 0.5661723, 0.4891699, 1, 0, 0.3529412, 1,
1.614073, -0.9705677, 0.9227335, 1, 0, 0.3490196, 1,
1.618458, 0.9705156, 1.311582, 1, 0, 0.3411765, 1,
1.625997, 0.04915367, 1.845866, 1, 0, 0.3372549, 1,
1.648879, -0.8767641, 2.566338, 1, 0, 0.3294118, 1,
1.655298, -0.1891017, 2.771473, 1, 0, 0.3254902, 1,
1.656869, 1.821171, 1.265039, 1, 0, 0.3176471, 1,
1.658353, -0.6643073, 2.190798, 1, 0, 0.3137255, 1,
1.670738, -0.8613626, 2.910618, 1, 0, 0.3058824, 1,
1.67939, 1.1979, 0.7200598, 1, 0, 0.2980392, 1,
1.68159, -0.002038698, 2.542245, 1, 0, 0.2941177, 1,
1.686637, 0.005377897, 3.258645, 1, 0, 0.2862745, 1,
1.689025, 0.4290282, 4.09849, 1, 0, 0.282353, 1,
1.689355, 1.045879, 1.39301, 1, 0, 0.2745098, 1,
1.691094, 1.533282, 1.603083, 1, 0, 0.2705882, 1,
1.69407, -0.06398208, 2.443179, 1, 0, 0.2627451, 1,
1.715188, 0.8225768, -0.5725402, 1, 0, 0.2588235, 1,
1.760876, 1.963764, 1.794879, 1, 0, 0.2509804, 1,
1.780395, 0.2065328, 1.025295, 1, 0, 0.2470588, 1,
1.792413, -0.4630135, 2.395452, 1, 0, 0.2392157, 1,
1.834923, -0.9904832, 1.523157, 1, 0, 0.2352941, 1,
1.847714, -0.3858368, 1.864362, 1, 0, 0.227451, 1,
1.849321, -0.4381749, 2.310094, 1, 0, 0.2235294, 1,
1.880215, 2.545867, 0.1186162, 1, 0, 0.2156863, 1,
1.886118, 0.1626225, 3.423295, 1, 0, 0.2117647, 1,
1.895411, 1.14534, -0.6545438, 1, 0, 0.2039216, 1,
1.896248, -1.296066, 3.194645, 1, 0, 0.1960784, 1,
1.941754, 0.77565, 1.622549, 1, 0, 0.1921569, 1,
1.945581, -1.072532, 0.9492175, 1, 0, 0.1843137, 1,
1.975863, -0.545895, 1.272993, 1, 0, 0.1803922, 1,
2.007214, 1.55195, -0.08837669, 1, 0, 0.172549, 1,
2.067368, -0.03177811, 1.060702, 1, 0, 0.1686275, 1,
2.07006, -1.082123, 2.400498, 1, 0, 0.1607843, 1,
2.095432, -0.2211965, 1.17562, 1, 0, 0.1568628, 1,
2.095654, -0.6339405, 1.929367, 1, 0, 0.1490196, 1,
2.097258, 1.42332, -0.1086539, 1, 0, 0.145098, 1,
2.099301, 0.9422557, 0.03668572, 1, 0, 0.1372549, 1,
2.161061, -0.9861194, 1.114781, 1, 0, 0.1333333, 1,
2.162155, 1.152623, 0.8323268, 1, 0, 0.1254902, 1,
2.164858, -0.4458885, 0.5173147, 1, 0, 0.1215686, 1,
2.205664, 0.06775153, 1.026023, 1, 0, 0.1137255, 1,
2.215828, -0.8757714, 1.915324, 1, 0, 0.1098039, 1,
2.246979, -2.008638, 2.794399, 1, 0, 0.1019608, 1,
2.269794, -0.362442, 2.167683, 1, 0, 0.09411765, 1,
2.323934, 1.016881, 2.329194, 1, 0, 0.09019608, 1,
2.326293, -1.165638, 2.033244, 1, 0, 0.08235294, 1,
2.333183, 0.7214583, 1.325944, 1, 0, 0.07843138, 1,
2.33351, -0.05428508, 5.204797, 1, 0, 0.07058824, 1,
2.377497, 0.01304826, 1.450058, 1, 0, 0.06666667, 1,
2.389938, 0.1350233, 0.1931561, 1, 0, 0.05882353, 1,
2.425125, -0.7109008, -0.1534898, 1, 0, 0.05490196, 1,
2.458891, -0.5901014, 2.094685, 1, 0, 0.04705882, 1,
2.490213, -0.6278563, 4.744585, 1, 0, 0.04313726, 1,
2.554495, 1.754986, 2.949355, 1, 0, 0.03529412, 1,
2.586968, -1.293239, 0.9508704, 1, 0, 0.03137255, 1,
2.652767, -0.1144452, 0.7848754, 1, 0, 0.02352941, 1,
2.730507, 0.6206368, 1.419491, 1, 0, 0.01960784, 1,
2.913915, -0.4751374, 1.960573, 1, 0, 0.01176471, 1,
3.018709, -0.4821852, 1.78155, 1, 0, 0.007843138, 1
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
-0.4315763, -4.50873, -7.87116, 0, -0.5, 0.5, 0.5,
-0.4315763, -4.50873, -7.87116, 1, -0.5, 0.5, 0.5,
-0.4315763, -4.50873, -7.87116, 1, 1.5, 0.5, 0.5,
-0.4315763, -4.50873, -7.87116, 0, 1.5, 0.5, 0.5
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
-5.051509, -0.09231567, -7.87116, 0, -0.5, 0.5, 0.5,
-5.051509, -0.09231567, -7.87116, 1, -0.5, 0.5, 0.5,
-5.051509, -0.09231567, -7.87116, 1, 1.5, 0.5, 0.5,
-5.051509, -0.09231567, -7.87116, 0, 1.5, 0.5, 0.5
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
-5.051509, -4.50873, -0.2350185, 0, -0.5, 0.5, 0.5,
-5.051509, -4.50873, -0.2350185, 1, -0.5, 0.5, 0.5,
-5.051509, -4.50873, -0.2350185, 1, 1.5, 0.5, 0.5,
-5.051509, -4.50873, -0.2350185, 0, 1.5, 0.5, 0.5
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
-3, -3.489557, -6.108973,
3, -3.489557, -6.108973,
-3, -3.489557, -6.108973,
-3, -3.65942, -6.402671,
-2, -3.489557, -6.108973,
-2, -3.65942, -6.402671,
-1, -3.489557, -6.108973,
-1, -3.65942, -6.402671,
0, -3.489557, -6.108973,
0, -3.65942, -6.402671,
1, -3.489557, -6.108973,
1, -3.65942, -6.402671,
2, -3.489557, -6.108973,
2, -3.65942, -6.402671,
3, -3.489557, -6.108973,
3, -3.65942, -6.402671
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
-3, -3.999144, -6.990067, 0, -0.5, 0.5, 0.5,
-3, -3.999144, -6.990067, 1, -0.5, 0.5, 0.5,
-3, -3.999144, -6.990067, 1, 1.5, 0.5, 0.5,
-3, -3.999144, -6.990067, 0, 1.5, 0.5, 0.5,
-2, -3.999144, -6.990067, 0, -0.5, 0.5, 0.5,
-2, -3.999144, -6.990067, 1, -0.5, 0.5, 0.5,
-2, -3.999144, -6.990067, 1, 1.5, 0.5, 0.5,
-2, -3.999144, -6.990067, 0, 1.5, 0.5, 0.5,
-1, -3.999144, -6.990067, 0, -0.5, 0.5, 0.5,
-1, -3.999144, -6.990067, 1, -0.5, 0.5, 0.5,
-1, -3.999144, -6.990067, 1, 1.5, 0.5, 0.5,
-1, -3.999144, -6.990067, 0, 1.5, 0.5, 0.5,
0, -3.999144, -6.990067, 0, -0.5, 0.5, 0.5,
0, -3.999144, -6.990067, 1, -0.5, 0.5, 0.5,
0, -3.999144, -6.990067, 1, 1.5, 0.5, 0.5,
0, -3.999144, -6.990067, 0, 1.5, 0.5, 0.5,
1, -3.999144, -6.990067, 0, -0.5, 0.5, 0.5,
1, -3.999144, -6.990067, 1, -0.5, 0.5, 0.5,
1, -3.999144, -6.990067, 1, 1.5, 0.5, 0.5,
1, -3.999144, -6.990067, 0, 1.5, 0.5, 0.5,
2, -3.999144, -6.990067, 0, -0.5, 0.5, 0.5,
2, -3.999144, -6.990067, 1, -0.5, 0.5, 0.5,
2, -3.999144, -6.990067, 1, 1.5, 0.5, 0.5,
2, -3.999144, -6.990067, 0, 1.5, 0.5, 0.5,
3, -3.999144, -6.990067, 0, -0.5, 0.5, 0.5,
3, -3.999144, -6.990067, 1, -0.5, 0.5, 0.5,
3, -3.999144, -6.990067, 1, 1.5, 0.5, 0.5,
3, -3.999144, -6.990067, 0, 1.5, 0.5, 0.5
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
-3.98537, -3, -6.108973,
-3.98537, 3, -6.108973,
-3.98537, -3, -6.108973,
-4.16306, -3, -6.402671,
-3.98537, -2, -6.108973,
-4.16306, -2, -6.402671,
-3.98537, -1, -6.108973,
-4.16306, -1, -6.402671,
-3.98537, 0, -6.108973,
-4.16306, 0, -6.402671,
-3.98537, 1, -6.108973,
-4.16306, 1, -6.402671,
-3.98537, 2, -6.108973,
-4.16306, 2, -6.402671,
-3.98537, 3, -6.108973,
-4.16306, 3, -6.402671
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
-4.51844, -3, -6.990067, 0, -0.5, 0.5, 0.5,
-4.51844, -3, -6.990067, 1, -0.5, 0.5, 0.5,
-4.51844, -3, -6.990067, 1, 1.5, 0.5, 0.5,
-4.51844, -3, -6.990067, 0, 1.5, 0.5, 0.5,
-4.51844, -2, -6.990067, 0, -0.5, 0.5, 0.5,
-4.51844, -2, -6.990067, 1, -0.5, 0.5, 0.5,
-4.51844, -2, -6.990067, 1, 1.5, 0.5, 0.5,
-4.51844, -2, -6.990067, 0, 1.5, 0.5, 0.5,
-4.51844, -1, -6.990067, 0, -0.5, 0.5, 0.5,
-4.51844, -1, -6.990067, 1, -0.5, 0.5, 0.5,
-4.51844, -1, -6.990067, 1, 1.5, 0.5, 0.5,
-4.51844, -1, -6.990067, 0, 1.5, 0.5, 0.5,
-4.51844, 0, -6.990067, 0, -0.5, 0.5, 0.5,
-4.51844, 0, -6.990067, 1, -0.5, 0.5, 0.5,
-4.51844, 0, -6.990067, 1, 1.5, 0.5, 0.5,
-4.51844, 0, -6.990067, 0, 1.5, 0.5, 0.5,
-4.51844, 1, -6.990067, 0, -0.5, 0.5, 0.5,
-4.51844, 1, -6.990067, 1, -0.5, 0.5, 0.5,
-4.51844, 1, -6.990067, 1, 1.5, 0.5, 0.5,
-4.51844, 1, -6.990067, 0, 1.5, 0.5, 0.5,
-4.51844, 2, -6.990067, 0, -0.5, 0.5, 0.5,
-4.51844, 2, -6.990067, 1, -0.5, 0.5, 0.5,
-4.51844, 2, -6.990067, 1, 1.5, 0.5, 0.5,
-4.51844, 2, -6.990067, 0, 1.5, 0.5, 0.5,
-4.51844, 3, -6.990067, 0, -0.5, 0.5, 0.5,
-4.51844, 3, -6.990067, 1, -0.5, 0.5, 0.5,
-4.51844, 3, -6.990067, 1, 1.5, 0.5, 0.5,
-4.51844, 3, -6.990067, 0, 1.5, 0.5, 0.5
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
-3.98537, -3.489557, -4,
-3.98537, -3.489557, 4,
-3.98537, -3.489557, -4,
-4.16306, -3.65942, -4,
-3.98537, -3.489557, -2,
-4.16306, -3.65942, -2,
-3.98537, -3.489557, 0,
-4.16306, -3.65942, 0,
-3.98537, -3.489557, 2,
-4.16306, -3.65942, 2,
-3.98537, -3.489557, 4,
-4.16306, -3.65942, 4
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
-4.51844, -3.999144, -4, 0, -0.5, 0.5, 0.5,
-4.51844, -3.999144, -4, 1, -0.5, 0.5, 0.5,
-4.51844, -3.999144, -4, 1, 1.5, 0.5, 0.5,
-4.51844, -3.999144, -4, 0, 1.5, 0.5, 0.5,
-4.51844, -3.999144, -2, 0, -0.5, 0.5, 0.5,
-4.51844, -3.999144, -2, 1, -0.5, 0.5, 0.5,
-4.51844, -3.999144, -2, 1, 1.5, 0.5, 0.5,
-4.51844, -3.999144, -2, 0, 1.5, 0.5, 0.5,
-4.51844, -3.999144, 0, 0, -0.5, 0.5, 0.5,
-4.51844, -3.999144, 0, 1, -0.5, 0.5, 0.5,
-4.51844, -3.999144, 0, 1, 1.5, 0.5, 0.5,
-4.51844, -3.999144, 0, 0, 1.5, 0.5, 0.5,
-4.51844, -3.999144, 2, 0, -0.5, 0.5, 0.5,
-4.51844, -3.999144, 2, 1, -0.5, 0.5, 0.5,
-4.51844, -3.999144, 2, 1, 1.5, 0.5, 0.5,
-4.51844, -3.999144, 2, 0, 1.5, 0.5, 0.5,
-4.51844, -3.999144, 4, 0, -0.5, 0.5, 0.5,
-4.51844, -3.999144, 4, 1, -0.5, 0.5, 0.5,
-4.51844, -3.999144, 4, 1, 1.5, 0.5, 0.5,
-4.51844, -3.999144, 4, 0, 1.5, 0.5, 0.5
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
-3.98537, -3.489557, -6.108973,
-3.98537, 3.304926, -6.108973,
-3.98537, -3.489557, 5.638936,
-3.98537, 3.304926, 5.638936,
-3.98537, -3.489557, -6.108973,
-3.98537, -3.489557, 5.638936,
-3.98537, 3.304926, -6.108973,
-3.98537, 3.304926, 5.638936,
-3.98537, -3.489557, -6.108973,
3.122218, -3.489557, -6.108973,
-3.98537, -3.489557, 5.638936,
3.122218, -3.489557, 5.638936,
-3.98537, 3.304926, -6.108973,
3.122218, 3.304926, -6.108973,
-3.98537, 3.304926, 5.638936,
3.122218, 3.304926, 5.638936,
3.122218, -3.489557, -6.108973,
3.122218, 3.304926, -6.108973,
3.122218, -3.489557, 5.638936,
3.122218, 3.304926, 5.638936,
3.122218, -3.489557, -6.108973,
3.122218, -3.489557, 5.638936,
3.122218, 3.304926, -6.108973,
3.122218, 3.304926, 5.638936
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
var radius = 8.180474;
var distance = 36.39585;
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
mvMatrix.translate( 0.4315763, 0.09231567, 0.2350185 );
mvMatrix.scale( 1.244429, 1.301775, 0.7528905 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.39585);
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
cyclohex-3-enecarbox<-read.table("cyclohex-3-enecarbox.xyz")
```

```
## Error in read.table("cyclohex-3-enecarbox.xyz"): no lines available in input
```

```r
x<-cyclohex-3-enecarbox$V2
```

```
## Error in eval(expr, envir, enclos): object 'cyclohex' not found
```

```r
y<-cyclohex-3-enecarbox$V3
```

```
## Error in eval(expr, envir, enclos): object 'cyclohex' not found
```

```r
z<-cyclohex-3-enecarbox$V4
```

```
## Error in eval(expr, envir, enclos): object 'cyclohex' not found
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
-3.881862, 0.4797888, 0.05100323, 0, 0, 1, 1, 1,
-3.130167, 1.16685, -1.894262, 1, 0, 0, 1, 1,
-2.951348, -0.2748957, -0.9005653, 1, 0, 0, 1, 1,
-2.918765, 1.169243, -0.6797884, 1, 0, 0, 1, 1,
-2.77145, -0.1734991, -2.644806, 1, 0, 0, 1, 1,
-2.626188, 1.137933, -1.622516, 1, 0, 0, 1, 1,
-2.613615, 1.491006, -0.4552625, 0, 0, 0, 1, 1,
-2.532385, -1.704857, -1.436962, 0, 0, 0, 1, 1,
-2.427631, -0.1041052, -1.0844, 0, 0, 0, 1, 1,
-2.418125, -0.1315892, -1.616886, 0, 0, 0, 1, 1,
-2.390486, -0.5706685, -2.425087, 0, 0, 0, 1, 1,
-2.388536, 0.04597506, 0.663103, 0, 0, 0, 1, 1,
-2.381633, 0.08847903, -0.9381755, 0, 0, 0, 1, 1,
-2.380586, -0.7633452, -1.012789, 1, 1, 1, 1, 1,
-2.34902, -0.0349167, -3.439512, 1, 1, 1, 1, 1,
-2.331871, 1.093465, -0.6507862, 1, 1, 1, 1, 1,
-2.32431, -1.031482, -1.167548, 1, 1, 1, 1, 1,
-2.291485, 0.2797383, -0.6401755, 1, 1, 1, 1, 1,
-2.243072, -1.456759, -0.9930568, 1, 1, 1, 1, 1,
-2.207703, -1.602413, 0.3337377, 1, 1, 1, 1, 1,
-2.203877, -1.499148, -0.9441467, 1, 1, 1, 1, 1,
-2.201406, 0.9679567, -2.078099, 1, 1, 1, 1, 1,
-2.18159, 0.03488086, -1.160732, 1, 1, 1, 1, 1,
-2.144095, 0.3672493, -1.294652, 1, 1, 1, 1, 1,
-2.127301, 0.04355973, -1.135321, 1, 1, 1, 1, 1,
-2.120301, 0.2914612, -2.244462, 1, 1, 1, 1, 1,
-2.061354, 1.386328, -1.616024, 1, 1, 1, 1, 1,
-2.05501, 0.1446294, -1.959353, 1, 1, 1, 1, 1,
-2.04461, -0.1710608, -1.411234, 0, 0, 1, 1, 1,
-2.041262, -1.048676, -3.152872, 1, 0, 0, 1, 1,
-2.039017, 0.02607351, -1.275782, 1, 0, 0, 1, 1,
-2.036649, 0.3088421, -0.6491982, 1, 0, 0, 1, 1,
-2.027441, -0.9593679, -2.991647, 1, 0, 0, 1, 1,
-2.014231, -0.7083762, -2.954194, 1, 0, 0, 1, 1,
-1.969586, -1.039644, -1.146686, 0, 0, 0, 1, 1,
-1.95407, -0.7330049, -0.6880767, 0, 0, 0, 1, 1,
-1.91066, 1.312989, 0.7070003, 0, 0, 0, 1, 1,
-1.909134, 1.267535, -1.088542, 0, 0, 0, 1, 1,
-1.903527, 0.4703749, -1.995044, 0, 0, 0, 1, 1,
-1.89164, -0.09005485, -1.557792, 0, 0, 0, 1, 1,
-1.84143, 1.012609, -0.4385622, 0, 0, 0, 1, 1,
-1.841095, -0.3188898, -1.02854, 1, 1, 1, 1, 1,
-1.828262, 0.324979, -2.3146, 1, 1, 1, 1, 1,
-1.811186, 1.1996, -2.789084, 1, 1, 1, 1, 1,
-1.809667, -0.2530628, -1.973982, 1, 1, 1, 1, 1,
-1.798422, 0.5734385, 0.4507891, 1, 1, 1, 1, 1,
-1.775215, 0.07920901, -1.846022, 1, 1, 1, 1, 1,
-1.773974, -0.4432123, -1.954168, 1, 1, 1, 1, 1,
-1.768696, -1.018944, -2.340779, 1, 1, 1, 1, 1,
-1.761885, -1.601341, -2.558847, 1, 1, 1, 1, 1,
-1.745306, -0.9771467, -2.267874, 1, 1, 1, 1, 1,
-1.740923, 1.461592, -0.6141765, 1, 1, 1, 1, 1,
-1.734287, 0.3535776, -1.515573, 1, 1, 1, 1, 1,
-1.731796, -0.3042855, -1.440805, 1, 1, 1, 1, 1,
-1.729632, 0.5944941, 0.08844913, 1, 1, 1, 1, 1,
-1.729396, -0.5303246, -1.697632, 1, 1, 1, 1, 1,
-1.701073, -0.8373867, 0.7197736, 0, 0, 1, 1, 1,
-1.671386, 2.401983, -0.3588057, 1, 0, 0, 1, 1,
-1.661643, -1.401149, -0.9010348, 1, 0, 0, 1, 1,
-1.633035, -0.7576941, -0.8821771, 1, 0, 0, 1, 1,
-1.626318, -0.2516519, -3.224483, 1, 0, 0, 1, 1,
-1.610273, 0.7556058, -2.189646, 1, 0, 0, 1, 1,
-1.598438, 1.472055, 0.06921253, 0, 0, 0, 1, 1,
-1.582911, 1.272587, -2.73936, 0, 0, 0, 1, 1,
-1.578016, 0.5993351, -0.8376002, 0, 0, 0, 1, 1,
-1.567645, -0.6287238, -1.721613, 0, 0, 0, 1, 1,
-1.563582, 0.5745189, -2.558336, 0, 0, 0, 1, 1,
-1.535744, 0.7347493, 0.2783872, 0, 0, 0, 1, 1,
-1.518131, 0.3391111, -1.685296, 0, 0, 0, 1, 1,
-1.515357, -1.588293, -3.384916, 1, 1, 1, 1, 1,
-1.51348, -1.142531, -1.415996, 1, 1, 1, 1, 1,
-1.505748, -2.466702, -2.843537, 1, 1, 1, 1, 1,
-1.49006, 0.08764845, -0.8544417, 1, 1, 1, 1, 1,
-1.485854, 0.4077865, -0.515728, 1, 1, 1, 1, 1,
-1.481676, -1.11232, -1.251937, 1, 1, 1, 1, 1,
-1.464443, -0.1805436, -0.3719913, 1, 1, 1, 1, 1,
-1.455192, -0.661071, -1.877788, 1, 1, 1, 1, 1,
-1.451615, -0.9831806, -0.8505978, 1, 1, 1, 1, 1,
-1.447377, 0.8302466, -1.256892, 1, 1, 1, 1, 1,
-1.417013, 0.5755709, -0.9400544, 1, 1, 1, 1, 1,
-1.412733, 0.2378704, 0.1226309, 1, 1, 1, 1, 1,
-1.408903, 1.259181, -1.116679, 1, 1, 1, 1, 1,
-1.39084, 1.392857, 0.08273087, 1, 1, 1, 1, 1,
-1.389234, -0.6758819, -3.58829, 1, 1, 1, 1, 1,
-1.387081, 0.7738461, -1.094177, 0, 0, 1, 1, 1,
-1.381596, 0.4124498, -1.045609, 1, 0, 0, 1, 1,
-1.380793, -0.9412603, -4.596053, 1, 0, 0, 1, 1,
-1.378328, -0.4827603, 0.4486571, 1, 0, 0, 1, 1,
-1.372983, 1.253178, -3.072627, 1, 0, 0, 1, 1,
-1.365491, -0.2928595, -2.417918, 1, 0, 0, 1, 1,
-1.364821, -0.6553028, -2.062286, 0, 0, 0, 1, 1,
-1.344175, 0.0649078, -0.8787313, 0, 0, 0, 1, 1,
-1.337682, 0.1142357, -2.577535, 0, 0, 0, 1, 1,
-1.334897, 1.174125, -2.385981, 0, 0, 0, 1, 1,
-1.331872, -0.9280924, -1.388528, 0, 0, 0, 1, 1,
-1.327919, 0.3200755, -1.205317, 0, 0, 0, 1, 1,
-1.313599, -1.250966, -3.359266, 0, 0, 0, 1, 1,
-1.305869, 0.9365684, -0.685246, 1, 1, 1, 1, 1,
-1.299335, 1.557088, -0.4279161, 1, 1, 1, 1, 1,
-1.296665, -0.01255981, -1.826586, 1, 1, 1, 1, 1,
-1.296606, -0.6568151, -1.524485, 1, 1, 1, 1, 1,
-1.291672, 0.353815, -1.127267, 1, 1, 1, 1, 1,
-1.288547, -0.3018565, -3.700065, 1, 1, 1, 1, 1,
-1.278717, 0.431013, -3.269091, 1, 1, 1, 1, 1,
-1.265755, -1.267019, -1.99477, 1, 1, 1, 1, 1,
-1.262768, -0.185909, -2.097588, 1, 1, 1, 1, 1,
-1.261918, 0.8291172, -1.65578, 1, 1, 1, 1, 1,
-1.258794, 0.2716335, -1.303255, 1, 1, 1, 1, 1,
-1.251947, -0.3598718, -2.013305, 1, 1, 1, 1, 1,
-1.250261, -0.6363733, -2.739918, 1, 1, 1, 1, 1,
-1.245557, 1.847498, -1.336111, 1, 1, 1, 1, 1,
-1.244796, 1.38243, -1.023623, 1, 1, 1, 1, 1,
-1.243306, -0.6857328, -2.758763, 0, 0, 1, 1, 1,
-1.24299, -0.9586012, -2.852843, 1, 0, 0, 1, 1,
-1.222876, -2.141865, -1.502909, 1, 0, 0, 1, 1,
-1.208132, 0.3059967, -0.208641, 1, 0, 0, 1, 1,
-1.199224, -0.222449, -2.121627, 1, 0, 0, 1, 1,
-1.198152, 0.2941448, 0.02897373, 1, 0, 0, 1, 1,
-1.17999, 1.600423, -0.3969022, 0, 0, 0, 1, 1,
-1.177255, 0.4037958, -1.008463, 0, 0, 0, 1, 1,
-1.174408, 0.2696664, -1.344537, 0, 0, 0, 1, 1,
-1.163834, -0.09454206, -1.002365, 0, 0, 0, 1, 1,
-1.14652, -0.4347154, -2.505603, 0, 0, 0, 1, 1,
-1.145914, -0.3556306, -1.524804, 0, 0, 0, 1, 1,
-1.145069, -0.5112119, -3.205423, 0, 0, 0, 1, 1,
-1.139234, -0.7725695, -2.096339, 1, 1, 1, 1, 1,
-1.129898, -0.4767027, -2.247056, 1, 1, 1, 1, 1,
-1.111538, 0.5650949, -2.147217, 1, 1, 1, 1, 1,
-1.110581, 0.3770142, 1.275947, 1, 1, 1, 1, 1,
-1.107298, 0.265994, -1.272428, 1, 1, 1, 1, 1,
-1.105201, -0.5299329, -1.971612, 1, 1, 1, 1, 1,
-1.105105, -0.8965832, -0.8547196, 1, 1, 1, 1, 1,
-1.10153, -0.138754, -1.464001, 1, 1, 1, 1, 1,
-1.099328, 0.8438633, -0.9852142, 1, 1, 1, 1, 1,
-1.091175, -0.7959709, -2.886207, 1, 1, 1, 1, 1,
-1.088916, -1.881042, -2.222883, 1, 1, 1, 1, 1,
-1.088827, 1.147424, -1.434618, 1, 1, 1, 1, 1,
-1.088389, 0.1223254, -0.8833708, 1, 1, 1, 1, 1,
-1.084121, 0.5871474, -1.135951, 1, 1, 1, 1, 1,
-1.083553, -1.180689, -2.748776, 1, 1, 1, 1, 1,
-1.081488, 0.7365214, -2.430265, 0, 0, 1, 1, 1,
-1.077562, 0.693719, -0.459543, 1, 0, 0, 1, 1,
-1.064983, 0.846465, -0.3040732, 1, 0, 0, 1, 1,
-1.062585, -0.2058541, -0.4639883, 1, 0, 0, 1, 1,
-1.050989, -0.8172988, -2.890877, 1, 0, 0, 1, 1,
-1.046469, -0.2948039, -2.087838, 1, 0, 0, 1, 1,
-1.039813, 0.1372043, -1.591784, 0, 0, 0, 1, 1,
-1.03844, 1.081225, -0.2055486, 0, 0, 0, 1, 1,
-1.037612, 1.322844, -0.1572831, 0, 0, 0, 1, 1,
-1.032084, 0.6633021, -0.9790933, 0, 0, 0, 1, 1,
-1.030057, 0.9714015, -2.417928, 0, 0, 0, 1, 1,
-1.028066, -0.8341939, -2.738326, 0, 0, 0, 1, 1,
-1.022226, 1.186832, 0.02388238, 0, 0, 0, 1, 1,
-1.020741, 1.433405, -0.9677832, 1, 1, 1, 1, 1,
-1.009489, -1.01586, -1.406979, 1, 1, 1, 1, 1,
-1.001919, -0.2811142, -0.0131616, 1, 1, 1, 1, 1,
-1.001235, -0.01320601, -1.112841, 1, 1, 1, 1, 1,
-0.997679, -0.4486334, -0.3284704, 1, 1, 1, 1, 1,
-0.9930685, -1.09915, -2.078278, 1, 1, 1, 1, 1,
-0.9853794, 0.2858057, -0.6507514, 1, 1, 1, 1, 1,
-0.9826469, 0.09988557, -1.048679, 1, 1, 1, 1, 1,
-0.9819419, -2.14892, -2.562773, 1, 1, 1, 1, 1,
-0.9761202, -1.882072, -3.534069, 1, 1, 1, 1, 1,
-0.971242, -0.2410611, -2.932482, 1, 1, 1, 1, 1,
-0.9650803, 0.9080952, -0.5983537, 1, 1, 1, 1, 1,
-0.9559408, 0.1046366, -1.697464, 1, 1, 1, 1, 1,
-0.9551442, -0.5245391, -3.059365, 1, 1, 1, 1, 1,
-0.9546979, -0.01035457, 0.01520573, 1, 1, 1, 1, 1,
-0.945464, -1.205446, -2.79276, 0, 0, 1, 1, 1,
-0.9439, 0.2631041, -1.909426, 1, 0, 0, 1, 1,
-0.9416904, 0.7552456, -0.9646585, 1, 0, 0, 1, 1,
-0.9352112, 0.3662778, -1.944525, 1, 0, 0, 1, 1,
-0.9254844, -0.411966, -1.282125, 1, 0, 0, 1, 1,
-0.9241844, 1.249672, -0.5731413, 1, 0, 0, 1, 1,
-0.9204631, 0.6265475, 0.8714557, 0, 0, 0, 1, 1,
-0.9174886, -0.6137766, -2.699515, 0, 0, 0, 1, 1,
-0.9173386, -0.5960009, -3.385834, 0, 0, 0, 1, 1,
-0.9103475, -0.008127452, -2.391629, 0, 0, 0, 1, 1,
-0.9086048, 0.3230702, -1.802341, 0, 0, 0, 1, 1,
-0.8924537, -2.042459, -3.48485, 0, 0, 0, 1, 1,
-0.8889057, -0.2607574, -2.012598, 0, 0, 0, 1, 1,
-0.8803672, -0.08678532, -2.092937, 1, 1, 1, 1, 1,
-0.8800135, -0.2496136, -0.5493973, 1, 1, 1, 1, 1,
-0.8740317, 0.5057829, -0.9918504, 1, 1, 1, 1, 1,
-0.8728166, 0.5913659, -1.278574, 1, 1, 1, 1, 1,
-0.8656338, -0.4131871, -2.273184, 1, 1, 1, 1, 1,
-0.8611755, -1.155457, -2.416013, 1, 1, 1, 1, 1,
-0.8568839, -0.04689905, -2.292669, 1, 1, 1, 1, 1,
-0.8543293, -0.34086, -0.8800327, 1, 1, 1, 1, 1,
-0.8525903, 2.140708, -0.5406227, 1, 1, 1, 1, 1,
-0.8423809, -1.980212, -4.734221, 1, 1, 1, 1, 1,
-0.8401233, -2.110225, -2.057463, 1, 1, 1, 1, 1,
-0.8384352, -0.04907515, -1.952438, 1, 1, 1, 1, 1,
-0.8371426, -0.536306, -2.598488, 1, 1, 1, 1, 1,
-0.8360934, 0.2769841, -1.025895, 1, 1, 1, 1, 1,
-0.8303719, 0.06683285, -0.707615, 1, 1, 1, 1, 1,
-0.825002, -0.56136, -0.6730118, 0, 0, 1, 1, 1,
-0.823563, 0.09502633, -0.73556, 1, 0, 0, 1, 1,
-0.8215267, -0.2741035, -1.89908, 1, 0, 0, 1, 1,
-0.8146468, 0.3976513, -0.04652763, 1, 0, 0, 1, 1,
-0.8113436, 0.09536555, -1.702144, 1, 0, 0, 1, 1,
-0.8090996, -0.07864217, -2.084808, 1, 0, 0, 1, 1,
-0.8071393, 0.1470131, -0.5740713, 0, 0, 0, 1, 1,
-0.8061996, -0.5052404, -0.5885038, 0, 0, 0, 1, 1,
-0.8046992, -0.5758448, -1.936764, 0, 0, 0, 1, 1,
-0.8042537, -1.589097, -1.829667, 0, 0, 0, 1, 1,
-0.7950808, 1.69664, -0.1169367, 0, 0, 0, 1, 1,
-0.7848916, -0.1988629, -4.648793, 0, 0, 0, 1, 1,
-0.7846434, 1.753811, 0.09172445, 0, 0, 0, 1, 1,
-0.7841789, -0.4118745, -0.7672414, 1, 1, 1, 1, 1,
-0.7716534, 0.7161437, -2.112691, 1, 1, 1, 1, 1,
-0.768148, 0.2362954, 0.06795185, 1, 1, 1, 1, 1,
-0.7678809, -1.457409, -2.602194, 1, 1, 1, 1, 1,
-0.7589085, -2.084255, -3.951909, 1, 1, 1, 1, 1,
-0.7502087, 2.14498, 0.507068, 1, 1, 1, 1, 1,
-0.7492893, 0.02492125, -0.5354288, 1, 1, 1, 1, 1,
-0.7482902, -1.222161, -5.937887, 1, 1, 1, 1, 1,
-0.7432793, 0.4627213, 0.3218228, 1, 1, 1, 1, 1,
-0.7419111, 2.153816, 1.237675, 1, 1, 1, 1, 1,
-0.7379334, 0.6870613, 0.6622124, 1, 1, 1, 1, 1,
-0.734063, -0.6159488, -2.507266, 1, 1, 1, 1, 1,
-0.7335826, 0.4873551, 1.320764, 1, 1, 1, 1, 1,
-0.7310993, -0.6389886, -4.281704, 1, 1, 1, 1, 1,
-0.7272373, -0.712573, -2.342751, 1, 1, 1, 1, 1,
-0.7249789, 0.0939034, -1.623643, 0, 0, 1, 1, 1,
-0.7218593, 0.6283392, -1.884942, 1, 0, 0, 1, 1,
-0.7178072, -1.936466, -2.167617, 1, 0, 0, 1, 1,
-0.716528, 0.4546268, 0.6120984, 1, 0, 0, 1, 1,
-0.715433, -0.8365562, -2.837576, 1, 0, 0, 1, 1,
-0.7126279, 1.528352, 0.4632586, 1, 0, 0, 1, 1,
-0.7119678, -0.4496521, -3.424125, 0, 0, 0, 1, 1,
-0.7118769, -0.3232272, -2.438349, 0, 0, 0, 1, 1,
-0.7102505, 0.06099589, -1.476169, 0, 0, 0, 1, 1,
-0.7074807, 1.13439, -1.018653, 0, 0, 0, 1, 1,
-0.7071108, -1.658697, -2.219453, 0, 0, 0, 1, 1,
-0.6904877, -0.1447053, -2.240412, 0, 0, 0, 1, 1,
-0.6871063, 0.5788463, -0.9782097, 0, 0, 0, 1, 1,
-0.6868123, 1.089696, -1.144565, 1, 1, 1, 1, 1,
-0.6815341, -0.03794102, -2.914282, 1, 1, 1, 1, 1,
-0.6755072, 0.251007, -1.572233, 1, 1, 1, 1, 1,
-0.6752563, -0.4916382, -4.731539, 1, 1, 1, 1, 1,
-0.6735492, -0.1958053, -2.57707, 1, 1, 1, 1, 1,
-0.6726529, -0.6236628, -2.726212, 1, 1, 1, 1, 1,
-0.6711295, 0.09695318, -1.641398, 1, 1, 1, 1, 1,
-0.6674311, 0.24327, -0.8329108, 1, 1, 1, 1, 1,
-0.6668131, 0.3733695, -0.8250375, 1, 1, 1, 1, 1,
-0.6653032, -0.02416332, -2.842135, 1, 1, 1, 1, 1,
-0.6604545, -1.577613, -3.137002, 1, 1, 1, 1, 1,
-0.658309, -0.4154966, -1.512396, 1, 1, 1, 1, 1,
-0.6550809, -1.18279, -4.215937, 1, 1, 1, 1, 1,
-0.6536217, 1.32489, -0.188174, 1, 1, 1, 1, 1,
-0.6533992, -1.271307, -3.118575, 1, 1, 1, 1, 1,
-0.6514071, 0.2218042, -0.4683798, 0, 0, 1, 1, 1,
-0.6482735, 0.000157332, -2.777134, 1, 0, 0, 1, 1,
-0.6468825, -0.3436295, -1.20184, 1, 0, 0, 1, 1,
-0.6461853, 0.3445729, 0.1191415, 1, 0, 0, 1, 1,
-0.6410007, -1.466136, -3.202751, 1, 0, 0, 1, 1,
-0.6330905, -0.4068976, -0.3467602, 1, 0, 0, 1, 1,
-0.628728, -0.3299355, -0.2356582, 0, 0, 0, 1, 1,
-0.6269555, 0.2666371, -2.235445, 0, 0, 0, 1, 1,
-0.6223875, -1.624259, -3.471306, 0, 0, 0, 1, 1,
-0.6213077, -0.2366711, -1.793621, 0, 0, 0, 1, 1,
-0.6211275, 0.879862, 1.617333, 0, 0, 0, 1, 1,
-0.6190432, 0.9108677, 1.518144, 0, 0, 0, 1, 1,
-0.6164234, -1.501438, -0.853594, 0, 0, 0, 1, 1,
-0.6139954, 0.4250389, -1.381441, 1, 1, 1, 1, 1,
-0.6128063, -0.8198173, -3.922566, 1, 1, 1, 1, 1,
-0.6096307, -0.4590127, -1.728133, 1, 1, 1, 1, 1,
-0.6089481, -1.878113, -4.761118, 1, 1, 1, 1, 1,
-0.6065898, 0.8403195, -1.67582, 1, 1, 1, 1, 1,
-0.6063538, 0.8359647, -0.7000446, 1, 1, 1, 1, 1,
-0.5994458, 1.109825, -1.023434, 1, 1, 1, 1, 1,
-0.5993986, -0.6607828, -0.5386013, 1, 1, 1, 1, 1,
-0.5968563, -0.9637171, -2.638043, 1, 1, 1, 1, 1,
-0.5943802, 0.4872822, -0.9932879, 1, 1, 1, 1, 1,
-0.588865, 1.326245, -2.70632, 1, 1, 1, 1, 1,
-0.5779451, -0.6914726, -4.145157, 1, 1, 1, 1, 1,
-0.5772763, -0.8436609, -3.470853, 1, 1, 1, 1, 1,
-0.574029, 1.399143, -1.248055, 1, 1, 1, 1, 1,
-0.5729211, -0.5976822, -2.901643, 1, 1, 1, 1, 1,
-0.5711932, 0.07502243, -0.9661415, 0, 0, 1, 1, 1,
-0.567691, -0.03330547, -1.332955, 1, 0, 0, 1, 1,
-0.5536214, -0.3221626, 0.6282652, 1, 0, 0, 1, 1,
-0.5532415, -1.253616, -3.785102, 1, 0, 0, 1, 1,
-0.5470633, 1.696263, 1.018267, 1, 0, 0, 1, 1,
-0.5469935, 2.11757, -0.07175557, 1, 0, 0, 1, 1,
-0.5469713, -1.552142, -3.398757, 0, 0, 0, 1, 1,
-0.5467209, 0.5244583, -1.026003, 0, 0, 0, 1, 1,
-0.5437424, 0.7898315, -0.4478059, 0, 0, 0, 1, 1,
-0.539425, 0.7840689, -0.02373332, 0, 0, 0, 1, 1,
-0.5362646, -0.2696379, -2.84741, 0, 0, 0, 1, 1,
-0.535383, -1.009019, -4.378543, 0, 0, 0, 1, 1,
-0.5339968, -0.7856748, -3.75289, 0, 0, 0, 1, 1,
-0.5335761, -0.2431484, -1.906219, 1, 1, 1, 1, 1,
-0.5312898, -0.5229795, -1.638627, 1, 1, 1, 1, 1,
-0.529245, 0.9046342, -0.746053, 1, 1, 1, 1, 1,
-0.5254623, 2.617055, -2.193887, 1, 1, 1, 1, 1,
-0.5241101, -1.570281, -2.872381, 1, 1, 1, 1, 1,
-0.5188869, -1.227869, -2.633619, 1, 1, 1, 1, 1,
-0.5146623, -0.8321291, -1.198312, 1, 1, 1, 1, 1,
-0.5138605, 0.2511811, -2.062393, 1, 1, 1, 1, 1,
-0.5037514, -0.02965925, -1.373599, 1, 1, 1, 1, 1,
-0.5028453, -0.337925, -1.847295, 1, 1, 1, 1, 1,
-0.5015831, -1.300987, -1.784434, 1, 1, 1, 1, 1,
-0.5000266, 1.059192, -2.225182, 1, 1, 1, 1, 1,
-0.4990848, 0.03080756, -0.9269639, 1, 1, 1, 1, 1,
-0.4984038, -0.2299595, -2.275822, 1, 1, 1, 1, 1,
-0.4908427, 1.093797, 0.2014559, 1, 1, 1, 1, 1,
-0.4907174, 0.6179574, 0.09673541, 0, 0, 1, 1, 1,
-0.4855472, -2.393494, -3.34147, 1, 0, 0, 1, 1,
-0.4850693, -0.8372566, -2.341366, 1, 0, 0, 1, 1,
-0.4782116, 1.429295, -1.224092, 1, 0, 0, 1, 1,
-0.4762769, -0.1443175, -1.081247, 1, 0, 0, 1, 1,
-0.470995, 0.4911672, -2.72666, 1, 0, 0, 1, 1,
-0.4708445, -1.211526, -3.159453, 0, 0, 0, 1, 1,
-0.4705423, 0.7092805, -1.886328, 0, 0, 0, 1, 1,
-0.4695501, -0.8753361, -0.9752951, 0, 0, 0, 1, 1,
-0.4643207, 2.176216, 1.433228, 0, 0, 0, 1, 1,
-0.4632553, 2.164252, 0.4243199, 0, 0, 0, 1, 1,
-0.4607029, -0.5285209, -1.361719, 0, 0, 0, 1, 1,
-0.4575075, 0.5063052, -1.777426, 0, 0, 0, 1, 1,
-0.4514575, 0.4885096, -0.7920027, 1, 1, 1, 1, 1,
-0.4440742, 0.487326, 1.214717, 1, 1, 1, 1, 1,
-0.4345011, -0.6201605, -0.1253856, 1, 1, 1, 1, 1,
-0.4288178, -0.2908444, -2.241708, 1, 1, 1, 1, 1,
-0.418856, 0.7860402, -1.409435, 1, 1, 1, 1, 1,
-0.417399, 0.1762433, -2.089834, 1, 1, 1, 1, 1,
-0.4134241, -0.1964546, -2.278722, 1, 1, 1, 1, 1,
-0.4133477, 0.9575296, -0.7893815, 1, 1, 1, 1, 1,
-0.4067542, -0.2235797, -0.5484062, 1, 1, 1, 1, 1,
-0.4050231, -0.8866731, -1.422044, 1, 1, 1, 1, 1,
-0.3983302, -1.113298, -2.623875, 1, 1, 1, 1, 1,
-0.398008, 0.9699609, -1.645895, 1, 1, 1, 1, 1,
-0.3957133, -0.02756444, -2.014779, 1, 1, 1, 1, 1,
-0.394915, -0.4806516, -1.525069, 1, 1, 1, 1, 1,
-0.3912894, -0.3226989, -3.26778, 1, 1, 1, 1, 1,
-0.3902451, -0.03920568, -0.5569457, 0, 0, 1, 1, 1,
-0.3899763, -0.2534291, -2.989189, 1, 0, 0, 1, 1,
-0.3834826, 0.3515146, -1.692487, 1, 0, 0, 1, 1,
-0.3781718, -0.3544572, -3.176209, 1, 0, 0, 1, 1,
-0.3776425, 0.1671696, -1.045595, 1, 0, 0, 1, 1,
-0.3755803, 0.005853555, -3.59183, 1, 0, 0, 1, 1,
-0.3703123, 0.3705057, -1.648285, 0, 0, 0, 1, 1,
-0.3678874, -0.5129237, -3.255627, 0, 0, 0, 1, 1,
-0.3643939, -0.5075383, -3.05038, 0, 0, 0, 1, 1,
-0.362085, -0.2685735, -2.280615, 0, 0, 0, 1, 1,
-0.3542761, 0.8921671, -1.127762, 0, 0, 0, 1, 1,
-0.3533585, -0.1789496, -1.658306, 0, 0, 0, 1, 1,
-0.3511739, 0.1369246, -1.93287, 0, 0, 0, 1, 1,
-0.3479653, -1.664649, -3.219615, 1, 1, 1, 1, 1,
-0.3471893, 0.05484603, -1.635275, 1, 1, 1, 1, 1,
-0.3382449, -1.147579, -2.539292, 1, 1, 1, 1, 1,
-0.3377676, -2.381315, -3.685598, 1, 1, 1, 1, 1,
-0.3332773, -0.2280615, -1.908066, 1, 1, 1, 1, 1,
-0.3291429, 0.0005436837, -2.103184, 1, 1, 1, 1, 1,
-0.3261213, 1.553465, 0.760333, 1, 1, 1, 1, 1,
-0.3229911, -0.3938448, -2.524149, 1, 1, 1, 1, 1,
-0.317212, -1.025726, -1.299036, 1, 1, 1, 1, 1,
-0.3111097, -0.1035531, 0.007587089, 1, 1, 1, 1, 1,
-0.3093612, -0.2447732, -1.604722, 1, 1, 1, 1, 1,
-0.3031845, 0.8926939, -0.7634744, 1, 1, 1, 1, 1,
-0.3020214, 0.4498475, 0.05547485, 1, 1, 1, 1, 1,
-0.3019856, -0.4705189, -3.183599, 1, 1, 1, 1, 1,
-0.2999672, -0.7220209, -3.117125, 1, 1, 1, 1, 1,
-0.2972648, -1.279001, -4.362484, 0, 0, 1, 1, 1,
-0.2972566, 1.132831, -0.1806626, 1, 0, 0, 1, 1,
-0.277258, 1.05729, 1.128332, 1, 0, 0, 1, 1,
-0.2747692, -1.683442, -2.221497, 1, 0, 0, 1, 1,
-0.2747588, -0.8974597, -2.036107, 1, 0, 0, 1, 1,
-0.2695807, 0.9935891, -0.5106766, 1, 0, 0, 1, 1,
-0.2688733, -1.204702, -1.531065, 0, 0, 0, 1, 1,
-0.2676948, 1.628968, 0.9132153, 0, 0, 0, 1, 1,
-0.2666845, 1.64004, -0.7955119, 0, 0, 0, 1, 1,
-0.2499384, -1.214048, -1.801737, 0, 0, 0, 1, 1,
-0.2497045, -0.5487435, -2.264427, 0, 0, 0, 1, 1,
-0.2460409, -1.385926, -2.759389, 0, 0, 0, 1, 1,
-0.2458356, 1.536071, 0.06283953, 0, 0, 0, 1, 1,
-0.2431894, 1.105115, -0.02911142, 1, 1, 1, 1, 1,
-0.2430999, 0.4275134, -1.346848, 1, 1, 1, 1, 1,
-0.2417882, -0.9419122, -3.815231, 1, 1, 1, 1, 1,
-0.2414634, -0.4214818, -4.016339, 1, 1, 1, 1, 1,
-0.2365167, -0.08117928, -2.918602, 1, 1, 1, 1, 1,
-0.23566, 1.036543, -0.6324263, 1, 1, 1, 1, 1,
-0.2294396, 0.8861025, 0.1942052, 1, 1, 1, 1, 1,
-0.2271105, 2.695747, -2.742803, 1, 1, 1, 1, 1,
-0.2229411, -0.3728378, -0.9687108, 1, 1, 1, 1, 1,
-0.2229393, -1.08999, -2.685472, 1, 1, 1, 1, 1,
-0.2227741, 0.3136798, 0.9630075, 1, 1, 1, 1, 1,
-0.2149366, 2.323924, -1.291649, 1, 1, 1, 1, 1,
-0.2124606, 0.3050781, -0.6245396, 1, 1, 1, 1, 1,
-0.2116511, 0.6622543, -0.5587146, 1, 1, 1, 1, 1,
-0.2109817, -0.797542, -3.924258, 1, 1, 1, 1, 1,
-0.2080679, 0.1406143, -1.040876, 0, 0, 1, 1, 1,
-0.206339, 0.1639751, -3.152542, 1, 0, 0, 1, 1,
-0.205846, -0.1354651, -1.622985, 1, 0, 0, 1, 1,
-0.2052324, -1.23351, -2.167599, 1, 0, 0, 1, 1,
-0.2033591, -2.18991, -3.465424, 1, 0, 0, 1, 1,
-0.1988024, -0.7580944, -2.599276, 1, 0, 0, 1, 1,
-0.1874127, -0.2241133, -2.885443, 0, 0, 0, 1, 1,
-0.1747679, -1.28709, -3.448153, 0, 0, 0, 1, 1,
-0.1728165, 0.6805573, -1.632558, 0, 0, 0, 1, 1,
-0.1714216, -0.05453897, -0.5349811, 0, 0, 0, 1, 1,
-0.1693289, 0.4838321, 1.288791, 0, 0, 0, 1, 1,
-0.1681492, -1.099307, -2.076147, 0, 0, 0, 1, 1,
-0.1674854, 1.886917, -1.586375, 0, 0, 0, 1, 1,
-0.1668132, 0.258713, -1.744957, 1, 1, 1, 1, 1,
-0.1657752, -1.515323, -2.718297, 1, 1, 1, 1, 1,
-0.1626893, 0.2742305, -1.290166, 1, 1, 1, 1, 1,
-0.1485927, -0.2892592, -2.387003, 1, 1, 1, 1, 1,
-0.1475269, 0.5561849, -0.4818663, 1, 1, 1, 1, 1,
-0.1467693, 0.4895959, -1.065744, 1, 1, 1, 1, 1,
-0.1456738, 0.4114524, -0.01282597, 1, 1, 1, 1, 1,
-0.1439725, 0.4564779, -0.7024417, 1, 1, 1, 1, 1,
-0.1401875, 1.548446, 0.4259928, 1, 1, 1, 1, 1,
-0.1390436, 0.7071491, -0.8629098, 1, 1, 1, 1, 1,
-0.1388344, -1.148499, -2.301133, 1, 1, 1, 1, 1,
-0.1364922, 0.2990347, -0.5135409, 1, 1, 1, 1, 1,
-0.1331443, -0.6084491, -4.791217, 1, 1, 1, 1, 1,
-0.130375, 0.3182982, 0.3798554, 1, 1, 1, 1, 1,
-0.1287538, -1.626371, -1.085308, 1, 1, 1, 1, 1,
-0.1280116, -0.2185782, -2.706494, 0, 0, 1, 1, 1,
-0.1240499, 0.9048043, -1.353758, 1, 0, 0, 1, 1,
-0.1238947, -1.113792, -3.404214, 1, 0, 0, 1, 1,
-0.122881, 0.3933685, 1.2795, 1, 0, 0, 1, 1,
-0.1178829, 0.1033714, -0.7400476, 1, 0, 0, 1, 1,
-0.1177107, 2.640662, 0.3884728, 1, 0, 0, 1, 1,
-0.1155532, -0.04225666, -2.528596, 0, 0, 0, 1, 1,
-0.1146227, 0.2438204, -0.8549041, 0, 0, 0, 1, 1,
-0.1099003, 1.279282, 0.8063676, 0, 0, 0, 1, 1,
-0.1080729, -1.083367, -3.224961, 0, 0, 0, 1, 1,
-0.1075692, -1.23064, -3.03495, 0, 0, 0, 1, 1,
-0.1061058, 1.189739, -0.01148846, 0, 0, 0, 1, 1,
-0.1055335, -0.541544, -2.727471, 0, 0, 0, 1, 1,
-0.1053893, -0.7182497, -3.17626, 1, 1, 1, 1, 1,
-0.105353, -1.537249, -1.814768, 1, 1, 1, 1, 1,
-0.1043747, -0.4672775, -0.988214, 1, 1, 1, 1, 1,
-0.104178, -0.7427159, -3.47575, 1, 1, 1, 1, 1,
-0.1027057, -0.5043499, -3.633681, 1, 1, 1, 1, 1,
-0.1019387, -0.1734072, -3.593555, 1, 1, 1, 1, 1,
-0.1014064, 0.4977797, -0.8968405, 1, 1, 1, 1, 1,
-0.08974043, -0.892549, -3.227665, 1, 1, 1, 1, 1,
-0.08788536, -1.440096, -3.552167, 1, 1, 1, 1, 1,
-0.08723668, 0.8495161, 0.3732176, 1, 1, 1, 1, 1,
-0.08458603, 0.4307385, 0.04665703, 1, 1, 1, 1, 1,
-0.08116715, -0.3807569, -3.202938, 1, 1, 1, 1, 1,
-0.079905, 0.676673, -1.029304, 1, 1, 1, 1, 1,
-0.07845113, -0.01784752, -0.5849066, 1, 1, 1, 1, 1,
-0.07160484, -0.3679252, -4.75013, 1, 1, 1, 1, 1,
-0.06370222, 0.1510286, -0.8657289, 0, 0, 1, 1, 1,
-0.05544556, -0.5105911, -2.592326, 1, 0, 0, 1, 1,
-0.05257992, 0.4354853, -0.4413384, 1, 0, 0, 1, 1,
-0.05094379, 1.727859, 1.82644, 1, 0, 0, 1, 1,
-0.04842926, 0.1405357, 0.2441492, 1, 0, 0, 1, 1,
-0.04475198, 0.3883767, -0.8934108, 1, 0, 0, 1, 1,
-0.04301052, 1.122097, -0.1846772, 0, 0, 0, 1, 1,
-0.04278947, 0.7503299, 0.1138384, 0, 0, 0, 1, 1,
-0.04235404, 1.117573, -0.52587, 0, 0, 0, 1, 1,
-0.03874381, -1.379861, -3.015473, 0, 0, 0, 1, 1,
-0.03751095, 1.367004, -0.5251257, 0, 0, 0, 1, 1,
-0.03635583, 0.2890354, -0.6501244, 0, 0, 0, 1, 1,
-0.03530477, 0.5926351, 1.104872, 0, 0, 0, 1, 1,
-0.02130881, -0.6737529, -3.200658, 1, 1, 1, 1, 1,
-0.01910763, -0.8308315, -3.187871, 1, 1, 1, 1, 1,
-0.01810042, -0.5868496, -3.15772, 1, 1, 1, 1, 1,
-0.01769359, 0.9617704, 1.482532, 1, 1, 1, 1, 1,
-0.0143413, -0.8309828, -4.483449, 1, 1, 1, 1, 1,
-0.01402283, 0.5861925, 0.274167, 1, 1, 1, 1, 1,
-0.01165778, 0.7877415, 1.91593, 1, 1, 1, 1, 1,
-0.007649818, -0.1018677, -2.137788, 1, 1, 1, 1, 1,
-0.006310552, -1.308318, -2.417084, 1, 1, 1, 1, 1,
-0.006149271, 1.184083, 1.194556, 1, 1, 1, 1, 1,
-0.003725692, 1.511935, 1.403615, 1, 1, 1, 1, 1,
-0.0007470567, 1.027047, -1.574026, 1, 1, 1, 1, 1,
0.01124249, -0.6380587, 2.369324, 1, 1, 1, 1, 1,
0.01135408, 0.7506147, 0.6892559, 1, 1, 1, 1, 1,
0.01215188, 1.429417, -1.316601, 1, 1, 1, 1, 1,
0.01216173, 1.200248, 1.549801, 0, 0, 1, 1, 1,
0.0199736, -0.252036, 3.641046, 1, 0, 0, 1, 1,
0.02024162, 0.2719861, -0.5580139, 1, 0, 0, 1, 1,
0.02074475, 0.2423138, 0.3960982, 1, 0, 0, 1, 1,
0.02408131, 0.9577538, -0.3104441, 1, 0, 0, 1, 1,
0.02919485, -0.5497298, 3.762128, 1, 0, 0, 1, 1,
0.0341185, -2.213467, 2.666539, 0, 0, 0, 1, 1,
0.03820059, -0.00101929, 0.1470941, 0, 0, 0, 1, 1,
0.03950063, 0.06706323, 0.2340796, 0, 0, 0, 1, 1,
0.03969043, 0.6518654, 1.016694, 0, 0, 0, 1, 1,
0.04469964, 0.4134936, 1.293002, 0, 0, 0, 1, 1,
0.04560059, -0.7782884, 2.833016, 0, 0, 0, 1, 1,
0.04730751, 1.374278, 0.2844432, 0, 0, 0, 1, 1,
0.04827455, -0.2260451, 2.819284, 1, 1, 1, 1, 1,
0.05463934, 1.9051, 2.586973, 1, 1, 1, 1, 1,
0.05645623, -0.2880307, 0.8811274, 1, 1, 1, 1, 1,
0.059185, -0.3197255, 3.609124, 1, 1, 1, 1, 1,
0.06241938, -0.3672161, 4.204676, 1, 1, 1, 1, 1,
0.06581098, 0.2630934, -1.587151, 1, 1, 1, 1, 1,
0.06671907, 0.8107801, 0.2688661, 1, 1, 1, 1, 1,
0.06823929, -0.8755934, 3.27364, 1, 1, 1, 1, 1,
0.07054329, 0.08179518, -1.697416, 1, 1, 1, 1, 1,
0.07217345, 0.2952135, -1.418663, 1, 1, 1, 1, 1,
0.07257576, 0.3491187, 0.137549, 1, 1, 1, 1, 1,
0.07405361, -0.3460187, 2.191311, 1, 1, 1, 1, 1,
0.08424857, -1.664341, 3.300961, 1, 1, 1, 1, 1,
0.08480005, 1.815061, -0.3705564, 1, 1, 1, 1, 1,
0.08599412, -0.5788966, 2.292422, 1, 1, 1, 1, 1,
0.08609992, -0.6785317, 2.09112, 0, 0, 1, 1, 1,
0.08858829, -0.7169665, 1.565335, 1, 0, 0, 1, 1,
0.09097933, 1.477982, -0.5159652, 1, 0, 0, 1, 1,
0.09240439, -1.044623, 2.91561, 1, 0, 0, 1, 1,
0.09245071, -1.535924, 3.674601, 1, 0, 0, 1, 1,
0.09426263, 0.918239, 1.787993, 1, 0, 0, 1, 1,
0.09464277, -1.416609, 2.062849, 0, 0, 0, 1, 1,
0.09511986, -2.846102, 3.0156, 0, 0, 0, 1, 1,
0.09638833, 0.1339929, 0.3762472, 0, 0, 0, 1, 1,
0.09838361, -0.4918178, 4.044781, 0, 0, 0, 1, 1,
0.1029409, 0.6992643, 0.4273055, 0, 0, 0, 1, 1,
0.1038436, -0.1081733, 2.069727, 0, 0, 0, 1, 1,
0.104086, 0.2198039, -0.4823806, 0, 0, 0, 1, 1,
0.1062606, -0.8661365, 1.35055, 1, 1, 1, 1, 1,
0.1070858, -0.02926986, 1.70823, 1, 1, 1, 1, 1,
0.1074786, 0.7243617, -1.118976, 1, 1, 1, 1, 1,
0.1112698, -0.1402526, 3.839187, 1, 1, 1, 1, 1,
0.1143277, -0.03477103, 1.764454, 1, 1, 1, 1, 1,
0.1214075, -0.1363998, 2.896466, 1, 1, 1, 1, 1,
0.1256378, -0.5907364, 2.899225, 1, 1, 1, 1, 1,
0.1296773, 0.3855228, -1.108991, 1, 1, 1, 1, 1,
0.1297766, 0.5118663, -0.8896257, 1, 1, 1, 1, 1,
0.129835, -0.7934562, 1.798125, 1, 1, 1, 1, 1,
0.1306112, 0.3592255, -0.4778185, 1, 1, 1, 1, 1,
0.1317813, -0.2682064, 0.4589343, 1, 1, 1, 1, 1,
0.1319341, 0.4385859, 1.108634, 1, 1, 1, 1, 1,
0.1321841, 0.5216302, 0.882267, 1, 1, 1, 1, 1,
0.1453118, -0.9732653, 3.886096, 1, 1, 1, 1, 1,
0.150789, -0.5672849, 0.999683, 0, 0, 1, 1, 1,
0.1559621, 0.2298435, -0.04293654, 1, 0, 0, 1, 1,
0.1593398, -1.132496, 2.278991, 1, 0, 0, 1, 1,
0.1632555, -0.9851394, 2.689483, 1, 0, 0, 1, 1,
0.1656005, -0.1637674, 2.276428, 1, 0, 0, 1, 1,
0.1669317, 1.776842, -0.5935851, 1, 0, 0, 1, 1,
0.1676168, 0.5664746, 1.314708, 0, 0, 0, 1, 1,
0.1691443, -0.9842705, 2.283357, 0, 0, 0, 1, 1,
0.1737256, 1.145657, -0.1899522, 0, 0, 0, 1, 1,
0.1758032, -0.2873162, 2.745281, 0, 0, 0, 1, 1,
0.1804242, -0.9544685, 0.6073326, 0, 0, 0, 1, 1,
0.184653, -0.2767599, 1.571874, 0, 0, 0, 1, 1,
0.1861802, 1.119472, -1.761569, 0, 0, 0, 1, 1,
0.1873845, 0.5615801, 1.258449, 1, 1, 1, 1, 1,
0.1925362, -0.879535, 3.644803, 1, 1, 1, 1, 1,
0.1956135, 0.8907438, -1.188033, 1, 1, 1, 1, 1,
0.1962275, -1.44221, 2.844007, 1, 1, 1, 1, 1,
0.1967433, -0.2842646, 2.804466, 1, 1, 1, 1, 1,
0.1992196, -0.393514, 1.186161, 1, 1, 1, 1, 1,
0.2007339, 1.165389, 0.919223, 1, 1, 1, 1, 1,
0.2033967, 0.3355702, -0.08811731, 1, 1, 1, 1, 1,
0.2044687, -0.5793537, 4.181193, 1, 1, 1, 1, 1,
0.2096034, 0.09843305, -0.3865789, 1, 1, 1, 1, 1,
0.2104097, 0.845976, 1.354357, 1, 1, 1, 1, 1,
0.2104862, 0.1774171, 1.651983, 1, 1, 1, 1, 1,
0.2123674, 0.1131776, -0.03282165, 1, 1, 1, 1, 1,
0.2164318, 0.9622099, -0.3842609, 1, 1, 1, 1, 1,
0.216839, -0.9926674, 0.8070078, 1, 1, 1, 1, 1,
0.2209505, 0.2492496, 0.4513246, 0, 0, 1, 1, 1,
0.2275393, 0.1333559, 1.261833, 1, 0, 0, 1, 1,
0.2278272, -0.1207847, 1.640396, 1, 0, 0, 1, 1,
0.2334606, 0.0901226, -1.0749, 1, 0, 0, 1, 1,
0.2336191, -1.212862, 3.701223, 1, 0, 0, 1, 1,
0.2355426, 1.08016, -0.3396009, 1, 0, 0, 1, 1,
0.2362334, -0.09907311, 4.295332, 0, 0, 0, 1, 1,
0.2365531, -2.13412, 3.195757, 0, 0, 0, 1, 1,
0.239536, 0.4924544, -0.4106157, 0, 0, 0, 1, 1,
0.2406414, -0.06932732, 2.312846, 0, 0, 0, 1, 1,
0.2417608, -0.7345792, 3.335667, 0, 0, 0, 1, 1,
0.2423846, -2.032587, 3.358322, 0, 0, 0, 1, 1,
0.2529467, 1.222206, -1.246182, 0, 0, 0, 1, 1,
0.2532699, -0.5177796, -0.2544619, 1, 1, 1, 1, 1,
0.2566472, 0.5260434, -0.794094, 1, 1, 1, 1, 1,
0.2573425, -0.5135071, 1.346384, 1, 1, 1, 1, 1,
0.2606874, 1.347936, 0.6275506, 1, 1, 1, 1, 1,
0.2626419, 0.4106749, -0.6406769, 1, 1, 1, 1, 1,
0.2628419, -0.7282888, 3.709931, 1, 1, 1, 1, 1,
0.2667713, 0.5223593, 1.118973, 1, 1, 1, 1, 1,
0.269978, 2.022582, -0.1173528, 1, 1, 1, 1, 1,
0.2713326, -1.285389, 1.90279, 1, 1, 1, 1, 1,
0.273144, -0.1139812, 1.419112, 1, 1, 1, 1, 1,
0.276945, 1.324089, 1.098262, 1, 1, 1, 1, 1,
0.2799684, -1.138731, 3.229391, 1, 1, 1, 1, 1,
0.2805493, -1.974007, 2.559213, 1, 1, 1, 1, 1,
0.2859228, -1.249765, 2.918862, 1, 1, 1, 1, 1,
0.2869172, -0.7913321, 1.886205, 1, 1, 1, 1, 1,
0.2879447, 0.5477402, 1.268278, 0, 0, 1, 1, 1,
0.2882288, 1.3158, 1.131233, 1, 0, 0, 1, 1,
0.2902963, -1.007491, 1.351734, 1, 0, 0, 1, 1,
0.2918575, -0.9582179, 4.746559, 1, 0, 0, 1, 1,
0.2934455, -1.257234, 1.821977, 1, 0, 0, 1, 1,
0.2973573, 0.2384499, 2.154985, 1, 0, 0, 1, 1,
0.2992928, -0.7866872, 4.362304, 0, 0, 0, 1, 1,
0.3027875, -0.03899713, 2.051453, 0, 0, 0, 1, 1,
0.3037105, 0.08483264, 2.921169, 0, 0, 0, 1, 1,
0.3066393, -0.1507302, 1.146966, 0, 0, 0, 1, 1,
0.3070147, -1.321982, 2.237732, 0, 0, 0, 1, 1,
0.3096451, 0.03092093, 0.1531266, 0, 0, 0, 1, 1,
0.3110438, 0.80609, -1.053051, 0, 0, 0, 1, 1,
0.3114557, 0.7969214, 2.037449, 1, 1, 1, 1, 1,
0.3138901, 0.5890989, -0.6906484, 1, 1, 1, 1, 1,
0.3150705, -1.17241, 2.455042, 1, 1, 1, 1, 1,
0.3159775, 1.174875, -0.2094857, 1, 1, 1, 1, 1,
0.3160025, 1.736073, 0.01159427, 1, 1, 1, 1, 1,
0.3181851, -1.879407, 3.909988, 1, 1, 1, 1, 1,
0.3187008, 0.003530757, 2.293434, 1, 1, 1, 1, 1,
0.3226654, -0.2606838, 2.578583, 1, 1, 1, 1, 1,
0.3229136, -1.103665, 2.64079, 1, 1, 1, 1, 1,
0.3250565, -0.7807642, 4.65873, 1, 1, 1, 1, 1,
0.3289281, -0.2778245, 2.816322, 1, 1, 1, 1, 1,
0.3355221, 3.205977, 1.710564, 1, 1, 1, 1, 1,
0.3381615, 1.313761, 0.6578432, 1, 1, 1, 1, 1,
0.3413544, -0.08728727, 1.498746, 1, 1, 1, 1, 1,
0.3458694, 0.7167982, 0.9947727, 1, 1, 1, 1, 1,
0.3477035, 0.1005183, 1.113375, 0, 0, 1, 1, 1,
0.3520418, 2.073049, -0.9505461, 1, 0, 0, 1, 1,
0.3548472, 0.5906438, -0.08433329, 1, 0, 0, 1, 1,
0.3554665, -0.6865847, 3.090941, 1, 0, 0, 1, 1,
0.3556755, 0.9109379, 0.8612723, 1, 0, 0, 1, 1,
0.3559548, 1.326778, 1.669461, 1, 0, 0, 1, 1,
0.360657, 2.601807, 0.9973001, 0, 0, 0, 1, 1,
0.3624834, -0.6187875, 2.403532, 0, 0, 0, 1, 1,
0.364854, -0.8245655, 2.824251, 0, 0, 0, 1, 1,
0.3677698, -0.7297859, 3.341854, 0, 0, 0, 1, 1,
0.3693625, -0.1134306, 1.698433, 0, 0, 0, 1, 1,
0.3698074, -0.6825034, 4.691586, 0, 0, 0, 1, 1,
0.3754973, 0.02299482, 0.4673782, 0, 0, 0, 1, 1,
0.3803824, -0.4692916, 5.46785, 1, 1, 1, 1, 1,
0.3818007, -0.3270173, 2.531207, 1, 1, 1, 1, 1,
0.385398, -0.6508765, 2.173442, 1, 1, 1, 1, 1,
0.3863229, -0.383001, 2.613841, 1, 1, 1, 1, 1,
0.3911653, 1.308512, 1.591645, 1, 1, 1, 1, 1,
0.39346, 0.632245, 1.409487, 1, 1, 1, 1, 1,
0.3978022, 0.4184818, 0.9803113, 1, 1, 1, 1, 1,
0.3986272, 1.78443, 0.3063709, 1, 1, 1, 1, 1,
0.399688, 1.212307, 0.9983582, 1, 1, 1, 1, 1,
0.4002135, -1.703349, 2.503805, 1, 1, 1, 1, 1,
0.4065528, -0.4885864, 2.93016, 1, 1, 1, 1, 1,
0.406833, 1.208271, -0.2384948, 1, 1, 1, 1, 1,
0.4072314, 1.025999, 0.01183034, 1, 1, 1, 1, 1,
0.4114813, -0.7954422, 2.597151, 1, 1, 1, 1, 1,
0.4137381, 0.1899842, -0.2884464, 1, 1, 1, 1, 1,
0.4138427, -0.5205466, 2.444136, 0, 0, 1, 1, 1,
0.4183462, 0.629867, 0.1369954, 1, 0, 0, 1, 1,
0.4204952, -0.8720294, 2.06081, 1, 0, 0, 1, 1,
0.4206041, -0.7961919, 1.830297, 1, 0, 0, 1, 1,
0.4207136, -0.2304471, 2.125489, 1, 0, 0, 1, 1,
0.4229881, 0.253073, 2.579385, 1, 0, 0, 1, 1,
0.4232049, -1.681024, 3.779162, 0, 0, 0, 1, 1,
0.4261595, 0.5536637, 0.3744742, 0, 0, 0, 1, 1,
0.4283989, 0.8324154, 2.104023, 0, 0, 0, 1, 1,
0.429268, -1.592223, 3.185894, 0, 0, 0, 1, 1,
0.4304956, 0.8611181, 2.232899, 0, 0, 0, 1, 1,
0.4342576, -0.7006668, 1.453959, 0, 0, 0, 1, 1,
0.4351626, -0.7162257, 2.715789, 0, 0, 0, 1, 1,
0.4369549, 0.4875082, -0.9860753, 1, 1, 1, 1, 1,
0.4374661, -0.1352844, 2.109462, 1, 1, 1, 1, 1,
0.4384492, 0.1860148, 1.228637, 1, 1, 1, 1, 1,
0.4387734, -1.815097, 4.116529, 1, 1, 1, 1, 1,
0.4388666, -2.614806, 3.346824, 1, 1, 1, 1, 1,
0.4463801, 1.97732, -1.296243, 1, 1, 1, 1, 1,
0.4583566, 0.3510751, 1.547778, 1, 1, 1, 1, 1,
0.4617254, -0.2888603, 2.695903, 1, 1, 1, 1, 1,
0.4636763, 1.259629, 2.051015, 1, 1, 1, 1, 1,
0.4681927, 0.1382972, 0.6468407, 1, 1, 1, 1, 1,
0.4793577, 0.7121239, 0.5037915, 1, 1, 1, 1, 1,
0.4815834, -1.018523, 2.273936, 1, 1, 1, 1, 1,
0.4883607, 0.9965777, -0.1618547, 1, 1, 1, 1, 1,
0.5014217, -0.483496, 3.58879, 1, 1, 1, 1, 1,
0.5025813, 1.677748, 0.9703734, 1, 1, 1, 1, 1,
0.506319, -0.01279637, 0.6924916, 0, 0, 1, 1, 1,
0.5136574, 1.728293, 0.3874636, 1, 0, 0, 1, 1,
0.5152764, 0.8797444, 0.6207348, 1, 0, 0, 1, 1,
0.5302716, 0.02643799, 0.6931092, 1, 0, 0, 1, 1,
0.5371872, -1.034417, 2.191123, 1, 0, 0, 1, 1,
0.5418625, 0.9617639, 2.402609, 1, 0, 0, 1, 1,
0.5435749, 0.7113376, -0.7979084, 0, 0, 0, 1, 1,
0.5439361, 0.05671715, 0.8203326, 0, 0, 0, 1, 1,
0.5455195, 0.8849081, 0.9202303, 0, 0, 0, 1, 1,
0.5464804, -0.2594073, 1.464544, 0, 0, 0, 1, 1,
0.5487897, 0.2166557, 1.438656, 0, 0, 0, 1, 1,
0.5492797, -0.3674419, 2.205386, 0, 0, 0, 1, 1,
0.5502568, 0.1512455, 3.67987, 0, 0, 0, 1, 1,
0.5688678, -1.374765, 1.706251, 1, 1, 1, 1, 1,
0.5716605, -1.009948, 2.379608, 1, 1, 1, 1, 1,
0.5816168, 0.4056256, 1.196617, 1, 1, 1, 1, 1,
0.5830857, 1.202323, 1.04019, 1, 1, 1, 1, 1,
0.5835464, 0.4777342, 0.8920986, 1, 1, 1, 1, 1,
0.5836263, 1.049766, 0.9500909, 1, 1, 1, 1, 1,
0.583707, 0.8950005, -0.089596, 1, 1, 1, 1, 1,
0.5839573, 0.2641601, 0.121439, 1, 1, 1, 1, 1,
0.586596, 0.5587811, 0.7182989, 1, 1, 1, 1, 1,
0.5952633, -0.1507227, 1.296345, 1, 1, 1, 1, 1,
0.5953465, 0.4602053, 0.2480116, 1, 1, 1, 1, 1,
0.5966796, -1.110538, 3.424699, 1, 1, 1, 1, 1,
0.59864, 2.071173, 0.8192849, 1, 1, 1, 1, 1,
0.5994425, -1.06607, 1.862712, 1, 1, 1, 1, 1,
0.6017069, -1.310781, 3.233271, 1, 1, 1, 1, 1,
0.6062598, -0.8297659, 3.523779, 0, 0, 1, 1, 1,
0.6082043, 0.2310692, 2.183169, 1, 0, 0, 1, 1,
0.6126059, -1.144645, 2.83057, 1, 0, 0, 1, 1,
0.6158882, 0.4192405, -0.5128284, 1, 0, 0, 1, 1,
0.6186217, -0.3162316, 2.567331, 1, 0, 0, 1, 1,
0.6226115, 2.632787, 0.2846535, 1, 0, 0, 1, 1,
0.623189, 1.413371, 0.216696, 0, 0, 0, 1, 1,
0.6236186, 0.3778409, -0.03493089, 0, 0, 0, 1, 1,
0.6252347, -0.2259543, 1.783652, 0, 0, 0, 1, 1,
0.6266226, -0.9260969, 2.975127, 0, 0, 0, 1, 1,
0.6291703, -0.7965813, 2.096371, 0, 0, 0, 1, 1,
0.6308901, 0.1688362, 1.964239, 0, 0, 0, 1, 1,
0.6313281, -0.2334983, 2.458451, 0, 0, 0, 1, 1,
0.6361787, -0.954321, 1.152097, 1, 1, 1, 1, 1,
0.6414047, -0.4076421, 2.24974, 1, 1, 1, 1, 1,
0.6416034, 1.323758, -1.386525, 1, 1, 1, 1, 1,
0.6416769, -1.396136, -0.006310625, 1, 1, 1, 1, 1,
0.6495243, -1.845708, 1.34673, 1, 1, 1, 1, 1,
0.6523265, -0.7364029, 1.391885, 1, 1, 1, 1, 1,
0.6530474, 1.204027, 0.6979333, 1, 1, 1, 1, 1,
0.6650791, 0.584358, 0.6944894, 1, 1, 1, 1, 1,
0.667752, 2.588808, -0.9399645, 1, 1, 1, 1, 1,
0.6695891, -0.4666617, 0.5445632, 1, 1, 1, 1, 1,
0.6720238, -0.5678369, 2.688527, 1, 1, 1, 1, 1,
0.673068, 0.01330115, 0.4788062, 1, 1, 1, 1, 1,
0.674013, 2.182226, 0.7849142, 1, 1, 1, 1, 1,
0.6769173, 1.554396, 0.9109251, 1, 1, 1, 1, 1,
0.6781772, 1.205437, 1.047076, 1, 1, 1, 1, 1,
0.6796421, 0.7654434, 1.259971, 0, 0, 1, 1, 1,
0.6810582, 0.322231, 2.577775, 1, 0, 0, 1, 1,
0.6837463, 0.1206158, 2.630714, 1, 0, 0, 1, 1,
0.6856633, 0.131389, 3.046107, 1, 0, 0, 1, 1,
0.685966, 2.414362, -0.5919439, 1, 0, 0, 1, 1,
0.6870369, 0.4192843, 1.870298, 1, 0, 0, 1, 1,
0.6905823, 2.36042, -1.508977, 0, 0, 0, 1, 1,
0.695986, -0.2904607, 1.257879, 0, 0, 0, 1, 1,
0.697505, 0.8493627, 2.378348, 0, 0, 0, 1, 1,
0.7003579, 0.5265697, 2.178845, 0, 0, 0, 1, 1,
0.7087881, 1.641173, -0.8277816, 0, 0, 0, 1, 1,
0.7097018, -0.1323496, -0.1918362, 0, 0, 0, 1, 1,
0.7144273, -1.01991, 2.231728, 0, 0, 0, 1, 1,
0.7161415, -0.1074534, 3.428785, 1, 1, 1, 1, 1,
0.7195796, 0.529346, -0.2212053, 1, 1, 1, 1, 1,
0.7243208, -1.57294, 3.775753, 1, 1, 1, 1, 1,
0.7244145, 0.2000583, 1.551988, 1, 1, 1, 1, 1,
0.7264268, -0.03913522, 2.304988, 1, 1, 1, 1, 1,
0.7312409, 0.6507051, 2.959313, 1, 1, 1, 1, 1,
0.7351549, 0.8398721, 1.480761, 1, 1, 1, 1, 1,
0.745736, -1.012398, 3.821864, 1, 1, 1, 1, 1,
0.7461033, -0.7083602, 4.110913, 1, 1, 1, 1, 1,
0.7643734, -0.3174085, 0.9424593, 1, 1, 1, 1, 1,
0.7664919, -2.016241, 0.8840438, 1, 1, 1, 1, 1,
0.7665529, 0.06362659, 2.00204, 1, 1, 1, 1, 1,
0.7669737, 0.1744849, 1.262343, 1, 1, 1, 1, 1,
0.7673022, 0.494205, 1.642813, 1, 1, 1, 1, 1,
0.7676406, 0.7149453, -0.2372583, 1, 1, 1, 1, 1,
0.7678748, -1.114235, 2.16806, 0, 0, 1, 1, 1,
0.7682151, 2.095139, 1.044945, 1, 0, 0, 1, 1,
0.7683679, -1.023039, 2.340931, 1, 0, 0, 1, 1,
0.7699188, 1.03772, 1.003121, 1, 0, 0, 1, 1,
0.7769569, -0.8094878, 1.753469, 1, 0, 0, 1, 1,
0.7816269, -1.066106, 2.778917, 1, 0, 0, 1, 1,
0.7854839, -0.3125434, 0.8241324, 0, 0, 0, 1, 1,
0.7858023, 0.19612, 2.863786, 0, 0, 0, 1, 1,
0.7932214, -0.5445116, 2.217267, 0, 0, 0, 1, 1,
0.7992688, 0.322613, 1.748042, 0, 0, 0, 1, 1,
0.7998341, 0.7258852, 0.8136964, 0, 0, 0, 1, 1,
0.7999408, -0.1759369, 1.993786, 0, 0, 0, 1, 1,
0.8032391, -0.0845773, 1.677302, 0, 0, 0, 1, 1,
0.8033943, 0.1906813, 3.561305, 1, 1, 1, 1, 1,
0.8040031, -0.807384, 1.380224, 1, 1, 1, 1, 1,
0.807573, -0.5939139, 2.705627, 1, 1, 1, 1, 1,
0.8109246, -0.2187709, 2.150413, 1, 1, 1, 1, 1,
0.813862, 1.941106, 1.221605, 1, 1, 1, 1, 1,
0.8224968, -0.8065271, 3.029021, 1, 1, 1, 1, 1,
0.8239821, 1.359256, 0.1540161, 1, 1, 1, 1, 1,
0.8251796, 1.186708, 0.6978837, 1, 1, 1, 1, 1,
0.828631, 0.6459109, 1.590062, 1, 1, 1, 1, 1,
0.8336825, 0.1216805, 0.8747051, 1, 1, 1, 1, 1,
0.8350902, -0.4795814, 1.858869, 1, 1, 1, 1, 1,
0.8370981, 0.9753848, 0.1892702, 1, 1, 1, 1, 1,
0.837817, 0.3617597, 1.386322, 1, 1, 1, 1, 1,
0.8388091, -0.771901, 2.952776, 1, 1, 1, 1, 1,
0.8391798, 0.2495485, 2.042393, 1, 1, 1, 1, 1,
0.8405426, 0.7798156, -0.3636717, 0, 0, 1, 1, 1,
0.8491625, -1.080056, 1.584263, 1, 0, 0, 1, 1,
0.8519074, 0.3310178, 1.03399, 1, 0, 0, 1, 1,
0.8540794, 1.201812, 1.752735, 1, 0, 0, 1, 1,
0.8558984, 0.9923521, 0.2784219, 1, 0, 0, 1, 1,
0.8611727, 2.223434, -0.693818, 1, 0, 0, 1, 1,
0.8614615, -0.3465752, 2.302731, 0, 0, 0, 1, 1,
0.8657973, 1.053641, 0.8437329, 0, 0, 0, 1, 1,
0.8663286, 0.211595, 0.9045469, 0, 0, 0, 1, 1,
0.8707104, 0.9375623, 0.5518253, 0, 0, 0, 1, 1,
0.87854, 0.5253313, 0.7809632, 0, 0, 0, 1, 1,
0.8807393, 0.3862342, 2.151514, 0, 0, 0, 1, 1,
0.8850723, 1.416729, -0.4013003, 0, 0, 0, 1, 1,
0.8864794, 0.6835606, 1.380616, 1, 1, 1, 1, 1,
0.8867213, -0.4248319, 2.211802, 1, 1, 1, 1, 1,
0.8877465, -0.4272025, 2.142569, 1, 1, 1, 1, 1,
0.8981273, -0.6797545, 4.49133, 1, 1, 1, 1, 1,
0.9022487, -0.2175603, 1.90726, 1, 1, 1, 1, 1,
0.9029284, 1.250442, 0.5726652, 1, 1, 1, 1, 1,
0.9081165, 0.3515801, 1.650989, 1, 1, 1, 1, 1,
0.9128857, 0.04437971, 2.732188, 1, 1, 1, 1, 1,
0.9148482, 1.028751, 0.3360872, 1, 1, 1, 1, 1,
0.9177036, -0.977143, 2.424286, 1, 1, 1, 1, 1,
0.9215269, -1.264046, 2.400579, 1, 1, 1, 1, 1,
0.9229276, -0.2891979, 2.685488, 1, 1, 1, 1, 1,
0.9298408, 0.1947992, 2.011918, 1, 1, 1, 1, 1,
0.9350255, -0.2236988, 2.734628, 1, 1, 1, 1, 1,
0.9379377, 1.065364, 1.393724, 1, 1, 1, 1, 1,
0.9415113, -1.205025, 0.7949286, 0, 0, 1, 1, 1,
0.9440588, 0.302366, 1.24051, 1, 0, 0, 1, 1,
0.9570184, 0.3837708, 2.005817, 1, 0, 0, 1, 1,
0.959519, -0.8718151, 0.8715686, 1, 0, 0, 1, 1,
0.9613408, -0.07351955, 1.685233, 1, 0, 0, 1, 1,
0.9674886, -0.2190736, 1.554128, 1, 0, 0, 1, 1,
0.9735622, 0.002178267, 0.6204503, 0, 0, 0, 1, 1,
0.9750494, -0.3143037, 1.821961, 0, 0, 0, 1, 1,
0.9829658, 1.381884, 0.1696225, 0, 0, 0, 1, 1,
0.9843218, 1.119282, 0.8110758, 0, 0, 0, 1, 1,
0.9853624, 0.4777521, 1.055582, 0, 0, 0, 1, 1,
0.9889103, -3.390609, 2.128462, 0, 0, 0, 1, 1,
0.9916407, 1.871302, -0.7815524, 0, 0, 0, 1, 1,
0.9969288, 1.530631, 0.1316658, 1, 1, 1, 1, 1,
0.9989399, -0.9983152, 0.4357309, 1, 1, 1, 1, 1,
1.000991, 1.08748, 1.144822, 1, 1, 1, 1, 1,
1.00256, -0.2691957, 0.9408941, 1, 1, 1, 1, 1,
1.002682, -0.1412817, 2.32129, 1, 1, 1, 1, 1,
1.006606, -2.555692, 0.4102349, 1, 1, 1, 1, 1,
1.008705, 0.9483217, 0.125498, 1, 1, 1, 1, 1,
1.018363, -1.005965, 2.572623, 1, 1, 1, 1, 1,
1.034504, 0.07709703, 0.9595361, 1, 1, 1, 1, 1,
1.044651, 0.7145872, 0.3847159, 1, 1, 1, 1, 1,
1.046631, -0.9262567, 1.68113, 1, 1, 1, 1, 1,
1.051116, 1.063985, 0.4240882, 1, 1, 1, 1, 1,
1.052715, 1.929869, 0.6319104, 1, 1, 1, 1, 1,
1.061815, 1.395012, -0.08609311, 1, 1, 1, 1, 1,
1.062923, 0.2621714, 1.88384, 1, 1, 1, 1, 1,
1.066253, 0.1939519, 1.04437, 0, 0, 1, 1, 1,
1.067789, 1.070776, 1.380442, 1, 0, 0, 1, 1,
1.079338, 0.9041594, -0.3925736, 1, 0, 0, 1, 1,
1.080577, -0.290394, 1.681765, 1, 0, 0, 1, 1,
1.082912, 0.2791239, 2.393776, 1, 0, 0, 1, 1,
1.083493, 1.394758, 0.764703, 1, 0, 0, 1, 1,
1.087676, -2.45909, 1.709133, 0, 0, 0, 1, 1,
1.090931, 1.500218, -0.421327, 0, 0, 0, 1, 1,
1.093497, -0.353028, 0.8600988, 0, 0, 0, 1, 1,
1.095771, -0.3489148, 1.916901, 0, 0, 0, 1, 1,
1.103474, 0.1418986, 3.515775, 0, 0, 0, 1, 1,
1.104457, -0.6444072, 2.706572, 0, 0, 0, 1, 1,
1.10502, 0.4752577, 0.7862863, 0, 0, 0, 1, 1,
1.107973, -1.996692, 1.159463, 1, 1, 1, 1, 1,
1.109329, -0.3775805, 3.355554, 1, 1, 1, 1, 1,
1.116458, -1.091816, 2.783095, 1, 1, 1, 1, 1,
1.118119, -0.1747086, 1.274737, 1, 1, 1, 1, 1,
1.119665, 1.95162, -0.04813187, 1, 1, 1, 1, 1,
1.120879, -0.5646243, 2.782783, 1, 1, 1, 1, 1,
1.133074, -0.6684626, 2.600785, 1, 1, 1, 1, 1,
1.137168, 0.8291467, 1.332933, 1, 1, 1, 1, 1,
1.141397, -0.5636441, 1.067191, 1, 1, 1, 1, 1,
1.142794, 0.443051, 0.4070986, 1, 1, 1, 1, 1,
1.146238, -0.01062267, 1.592762, 1, 1, 1, 1, 1,
1.148966, -1.391747, 2.682636, 1, 1, 1, 1, 1,
1.152279, 0.4149615, 1.822497, 1, 1, 1, 1, 1,
1.158663, 0.6675975, 0.9044173, 1, 1, 1, 1, 1,
1.163924, 0.4281242, 2.78123, 1, 1, 1, 1, 1,
1.168414, 0.4796539, 1.796395, 0, 0, 1, 1, 1,
1.176472, 0.2454217, 1.937769, 1, 0, 0, 1, 1,
1.182823, 0.4244161, 1.584637, 1, 0, 0, 1, 1,
1.182975, -0.3032587, 0.1209166, 1, 0, 0, 1, 1,
1.187405, -2.032743, 1.349736, 1, 0, 0, 1, 1,
1.19129, -0.5772824, 2.605003, 1, 0, 0, 1, 1,
1.196956, -1.187549, 1.900681, 0, 0, 0, 1, 1,
1.197668, -1.247409, 1.227878, 0, 0, 0, 1, 1,
1.207902, 0.9392772, 1.328842, 0, 0, 0, 1, 1,
1.208718, 0.3817569, 0.432358, 0, 0, 0, 1, 1,
1.210151, -1.082201, 2.280851, 0, 0, 0, 1, 1,
1.218564, -0.3955671, 2.442267, 0, 0, 0, 1, 1,
1.219736, -1.319367, 3.260489, 0, 0, 0, 1, 1,
1.225172, -1.116231, 2.268314, 1, 1, 1, 1, 1,
1.227272, 0.8532261, -0.536613, 1, 1, 1, 1, 1,
1.249191, 0.2993947, 0.4903027, 1, 1, 1, 1, 1,
1.271324, -0.6080398, 0.3477822, 1, 1, 1, 1, 1,
1.271622, 0.2227531, 1.882928, 1, 1, 1, 1, 1,
1.277175, 0.6794863, 0.6457517, 1, 1, 1, 1, 1,
1.277363, 0.5313299, 0.412361, 1, 1, 1, 1, 1,
1.282371, -0.871823, 4.033259, 1, 1, 1, 1, 1,
1.283408, -1.093861, 2.442858, 1, 1, 1, 1, 1,
1.284029, 1.517449, 0.4055468, 1, 1, 1, 1, 1,
1.286558, -1.340622, 3.430689, 1, 1, 1, 1, 1,
1.295337, 1.658255, 0.9268852, 1, 1, 1, 1, 1,
1.297989, 1.165372, -0.2594924, 1, 1, 1, 1, 1,
1.298709, 0.3184305, 0.7301487, 1, 1, 1, 1, 1,
1.299124, -1.042023, 2.581775, 1, 1, 1, 1, 1,
1.310872, -2.564361, 2.84625, 0, 0, 1, 1, 1,
1.312254, -0.6937395, 2.669303, 1, 0, 0, 1, 1,
1.312504, 0.4743208, 0.322116, 1, 0, 0, 1, 1,
1.315938, -0.3896978, 1.837201, 1, 0, 0, 1, 1,
1.329404, 0.4739275, 0.6590626, 1, 0, 0, 1, 1,
1.337377, 0.04602491, 1.022455, 1, 0, 0, 1, 1,
1.345876, 1.49197, -0.07274005, 0, 0, 0, 1, 1,
1.372286, 0.1688027, 1.474291, 0, 0, 0, 1, 1,
1.383474, -0.0765411, 0.9323742, 0, 0, 0, 1, 1,
1.384162, 1.693664, -0.01183015, 0, 0, 0, 1, 1,
1.405496, -0.1651566, 0.3758264, 0, 0, 0, 1, 1,
1.429405, -1.764957, 2.684594, 0, 0, 0, 1, 1,
1.434548, -0.3071052, 1.65949, 0, 0, 0, 1, 1,
1.436793, -0.2229193, 2.412387, 1, 1, 1, 1, 1,
1.437834, 0.4530231, 0.2812827, 1, 1, 1, 1, 1,
1.444557, 0.8276178, 1.266322, 1, 1, 1, 1, 1,
1.457807, 0.7345263, 1.66288, 1, 1, 1, 1, 1,
1.458367, -0.2783424, 0.5837164, 1, 1, 1, 1, 1,
1.463758, 1.093409, 1.024339, 1, 1, 1, 1, 1,
1.466245, -0.5744518, 1.781328, 1, 1, 1, 1, 1,
1.469959, -1.783037, 3.482947, 1, 1, 1, 1, 1,
1.472668, -0.4954215, 2.282495, 1, 1, 1, 1, 1,
1.473676, -1.202327, 0.9619139, 1, 1, 1, 1, 1,
1.477877, 0.622784, 1.858111, 1, 1, 1, 1, 1,
1.47907, -0.6162802, 0.975906, 1, 1, 1, 1, 1,
1.481739, -0.6497302, 3.449387, 1, 1, 1, 1, 1,
1.485801, 0.05755811, 0.4843243, 1, 1, 1, 1, 1,
1.491421, 2.29561, 1.160661, 1, 1, 1, 1, 1,
1.49317, -0.6412196, 0.9481356, 0, 0, 1, 1, 1,
1.495355, -0.313466, 1.700046, 1, 0, 0, 1, 1,
1.502127, -0.92764, 2.854889, 1, 0, 0, 1, 1,
1.506625, -0.6981055, 1.570653, 1, 0, 0, 1, 1,
1.507386, -0.5155031, 2.444225, 1, 0, 0, 1, 1,
1.515254, -0.28563, 1.082062, 1, 0, 0, 1, 1,
1.524844, 0.4518567, 1.423411, 0, 0, 0, 1, 1,
1.548265, 0.6494664, 0.470562, 0, 0, 0, 1, 1,
1.558701, -0.2356632, 1.732973, 0, 0, 0, 1, 1,
1.559726, -1.080789, 3.133838, 0, 0, 0, 1, 1,
1.573827, 0.09778652, 1.09858, 0, 0, 0, 1, 1,
1.576918, 0.06941229, 2.284826, 0, 0, 0, 1, 1,
1.590359, -0.296181, 0.3925252, 0, 0, 0, 1, 1,
1.592498, 0.05955493, 3.124632, 1, 1, 1, 1, 1,
1.598114, -0.9666356, 2.660676, 1, 1, 1, 1, 1,
1.600187, 2.441582, 2.006367, 1, 1, 1, 1, 1,
1.60657, 1.176995, 1.902764, 1, 1, 1, 1, 1,
1.6084, 0.5661723, 0.4891699, 1, 1, 1, 1, 1,
1.614073, -0.9705677, 0.9227335, 1, 1, 1, 1, 1,
1.618458, 0.9705156, 1.311582, 1, 1, 1, 1, 1,
1.625997, 0.04915367, 1.845866, 1, 1, 1, 1, 1,
1.648879, -0.8767641, 2.566338, 1, 1, 1, 1, 1,
1.655298, -0.1891017, 2.771473, 1, 1, 1, 1, 1,
1.656869, 1.821171, 1.265039, 1, 1, 1, 1, 1,
1.658353, -0.6643073, 2.190798, 1, 1, 1, 1, 1,
1.670738, -0.8613626, 2.910618, 1, 1, 1, 1, 1,
1.67939, 1.1979, 0.7200598, 1, 1, 1, 1, 1,
1.68159, -0.002038698, 2.542245, 1, 1, 1, 1, 1,
1.686637, 0.005377897, 3.258645, 0, 0, 1, 1, 1,
1.689025, 0.4290282, 4.09849, 1, 0, 0, 1, 1,
1.689355, 1.045879, 1.39301, 1, 0, 0, 1, 1,
1.691094, 1.533282, 1.603083, 1, 0, 0, 1, 1,
1.69407, -0.06398208, 2.443179, 1, 0, 0, 1, 1,
1.715188, 0.8225768, -0.5725402, 1, 0, 0, 1, 1,
1.760876, 1.963764, 1.794879, 0, 0, 0, 1, 1,
1.780395, 0.2065328, 1.025295, 0, 0, 0, 1, 1,
1.792413, -0.4630135, 2.395452, 0, 0, 0, 1, 1,
1.834923, -0.9904832, 1.523157, 0, 0, 0, 1, 1,
1.847714, -0.3858368, 1.864362, 0, 0, 0, 1, 1,
1.849321, -0.4381749, 2.310094, 0, 0, 0, 1, 1,
1.880215, 2.545867, 0.1186162, 0, 0, 0, 1, 1,
1.886118, 0.1626225, 3.423295, 1, 1, 1, 1, 1,
1.895411, 1.14534, -0.6545438, 1, 1, 1, 1, 1,
1.896248, -1.296066, 3.194645, 1, 1, 1, 1, 1,
1.941754, 0.77565, 1.622549, 1, 1, 1, 1, 1,
1.945581, -1.072532, 0.9492175, 1, 1, 1, 1, 1,
1.975863, -0.545895, 1.272993, 1, 1, 1, 1, 1,
2.007214, 1.55195, -0.08837669, 1, 1, 1, 1, 1,
2.067368, -0.03177811, 1.060702, 1, 1, 1, 1, 1,
2.07006, -1.082123, 2.400498, 1, 1, 1, 1, 1,
2.095432, -0.2211965, 1.17562, 1, 1, 1, 1, 1,
2.095654, -0.6339405, 1.929367, 1, 1, 1, 1, 1,
2.097258, 1.42332, -0.1086539, 1, 1, 1, 1, 1,
2.099301, 0.9422557, 0.03668572, 1, 1, 1, 1, 1,
2.161061, -0.9861194, 1.114781, 1, 1, 1, 1, 1,
2.162155, 1.152623, 0.8323268, 1, 1, 1, 1, 1,
2.164858, -0.4458885, 0.5173147, 0, 0, 1, 1, 1,
2.205664, 0.06775153, 1.026023, 1, 0, 0, 1, 1,
2.215828, -0.8757714, 1.915324, 1, 0, 0, 1, 1,
2.246979, -2.008638, 2.794399, 1, 0, 0, 1, 1,
2.269794, -0.362442, 2.167683, 1, 0, 0, 1, 1,
2.323934, 1.016881, 2.329194, 1, 0, 0, 1, 1,
2.326293, -1.165638, 2.033244, 0, 0, 0, 1, 1,
2.333183, 0.7214583, 1.325944, 0, 0, 0, 1, 1,
2.33351, -0.05428508, 5.204797, 0, 0, 0, 1, 1,
2.377497, 0.01304826, 1.450058, 0, 0, 0, 1, 1,
2.389938, 0.1350233, 0.1931561, 0, 0, 0, 1, 1,
2.425125, -0.7109008, -0.1534898, 0, 0, 0, 1, 1,
2.458891, -0.5901014, 2.094685, 0, 0, 0, 1, 1,
2.490213, -0.6278563, 4.744585, 1, 1, 1, 1, 1,
2.554495, 1.754986, 2.949355, 1, 1, 1, 1, 1,
2.586968, -1.293239, 0.9508704, 1, 1, 1, 1, 1,
2.652767, -0.1144452, 0.7848754, 1, 1, 1, 1, 1,
2.730507, 0.6206368, 1.419491, 1, 1, 1, 1, 1,
2.913915, -0.4751374, 1.960573, 1, 1, 1, 1, 1,
3.018709, -0.4821852, 1.78155, 1, 1, 1, 1, 1
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
var radius = 10.03408;
var distance = 35.24426;
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
mvMatrix.translate( 0.4315763, 0.09231567, 0.2350185 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.24426);
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
