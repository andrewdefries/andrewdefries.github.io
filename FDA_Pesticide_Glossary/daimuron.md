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
-3.592956, -0.005718755, -3.25293, 1, 0, 0, 1,
-2.84567, -1.136852, -4.521683, 1, 0.007843138, 0, 1,
-2.73701, -0.3401253, -0.7411917, 1, 0.01176471, 0, 1,
-2.721388, -1.42491, -2.26696, 1, 0.01960784, 0, 1,
-2.663711, 1.059382, -0.8959774, 1, 0.02352941, 0, 1,
-2.56279, 0.3279475, -0.904584, 1, 0.03137255, 0, 1,
-2.548981, -0.9885682, -1.088246, 1, 0.03529412, 0, 1,
-2.523761, -0.8958272, -2.942063, 1, 0.04313726, 0, 1,
-2.488683, 0.5027467, -1.223238, 1, 0.04705882, 0, 1,
-2.457343, 0.3189443, -2.243991, 1, 0.05490196, 0, 1,
-2.37991, -1.195416, -1.529576, 1, 0.05882353, 0, 1,
-2.348597, 1.959524, 0.1974254, 1, 0.06666667, 0, 1,
-2.288598, 0.395009, -2.697588, 1, 0.07058824, 0, 1,
-2.286687, 1.781295, -0.82925, 1, 0.07843138, 0, 1,
-2.257608, 0.5695097, -1.15728, 1, 0.08235294, 0, 1,
-2.244577, -0.7658311, -1.905806, 1, 0.09019608, 0, 1,
-2.232927, -0.2457018, -1.564689, 1, 0.09411765, 0, 1,
-2.218671, 0.8350434, -1.346086, 1, 0.1019608, 0, 1,
-2.20294, -0.9725953, -1.72736, 1, 0.1098039, 0, 1,
-2.118124, 2.649108, 1.198205, 1, 0.1137255, 0, 1,
-2.102716, 0.3226361, -1.129295, 1, 0.1215686, 0, 1,
-2.097532, -0.8730617, -1.080067, 1, 0.1254902, 0, 1,
-2.075914, -2.094266, -2.859393, 1, 0.1333333, 0, 1,
-2.020574, -0.8859319, -3.122831, 1, 0.1372549, 0, 1,
-2.017045, 1.527054, -2.985852, 1, 0.145098, 0, 1,
-1.995404, 0.2170525, -0.4104547, 1, 0.1490196, 0, 1,
-1.991046, 0.4983431, -2.182807, 1, 0.1568628, 0, 1,
-1.988375, 1.074397, -1.477668, 1, 0.1607843, 0, 1,
-1.979231, 0.2271699, -2.411441, 1, 0.1686275, 0, 1,
-1.975333, 0.8272161, -0.5589035, 1, 0.172549, 0, 1,
-1.974261, -0.002491024, -0.444907, 1, 0.1803922, 0, 1,
-1.97225, 1.068574, -0.9207801, 1, 0.1843137, 0, 1,
-1.954545, -0.2449603, -0.99993, 1, 0.1921569, 0, 1,
-1.943646, 2.275003, -0.985532, 1, 0.1960784, 0, 1,
-1.93113, -0.3456823, -1.828972, 1, 0.2039216, 0, 1,
-1.914252, 0.1316935, -1.775905, 1, 0.2117647, 0, 1,
-1.89489, 0.8431573, -1.341878, 1, 0.2156863, 0, 1,
-1.885786, -0.2115671, -0.01839516, 1, 0.2235294, 0, 1,
-1.881736, 0.08915261, -2.98445, 1, 0.227451, 0, 1,
-1.873789, 0.3237028, -2.12945, 1, 0.2352941, 0, 1,
-1.872688, -1.412221, -2.777519, 1, 0.2392157, 0, 1,
-1.865251, 0.3129846, -1.063398, 1, 0.2470588, 0, 1,
-1.862104, 0.4338052, -0.8127773, 1, 0.2509804, 0, 1,
-1.83851, -0.3332423, -2.122069, 1, 0.2588235, 0, 1,
-1.832476, 0.4935083, -1.915831, 1, 0.2627451, 0, 1,
-1.832085, 1.03072, -2.645877, 1, 0.2705882, 0, 1,
-1.822451, 1.075028, 0.5708399, 1, 0.2745098, 0, 1,
-1.788552, 1.040161, -0.7797833, 1, 0.282353, 0, 1,
-1.773386, -0.968558, -1.078073, 1, 0.2862745, 0, 1,
-1.766219, 0.816924, 1.322271, 1, 0.2941177, 0, 1,
-1.763988, -0.4537441, -3.683568, 1, 0.3019608, 0, 1,
-1.762723, 0.5625181, -1.294342, 1, 0.3058824, 0, 1,
-1.761832, 0.6775862, -0.750885, 1, 0.3137255, 0, 1,
-1.758392, 1.361951, -0.2186626, 1, 0.3176471, 0, 1,
-1.752763, 0.2163909, -4.114934, 1, 0.3254902, 0, 1,
-1.739417, 2.157122, -0.06414767, 1, 0.3294118, 0, 1,
-1.713621, 0.3564814, -0.8930463, 1, 0.3372549, 0, 1,
-1.704316, 0.8309557, -1.355053, 1, 0.3411765, 0, 1,
-1.686331, 0.5456439, 0.03951867, 1, 0.3490196, 0, 1,
-1.678043, 0.001204898, -1.399115, 1, 0.3529412, 0, 1,
-1.649845, 0.4442157, -1.912612, 1, 0.3607843, 0, 1,
-1.649111, -0.5295379, -2.140644, 1, 0.3647059, 0, 1,
-1.645622, -1.335702, -3.100216, 1, 0.372549, 0, 1,
-1.613689, -0.3786972, -1.560353, 1, 0.3764706, 0, 1,
-1.594578, 0.7326009, -1.303628, 1, 0.3843137, 0, 1,
-1.583994, -0.9646221, -1.009962, 1, 0.3882353, 0, 1,
-1.579865, 0.7637886, 0.1068305, 1, 0.3960784, 0, 1,
-1.579449, 0.2967103, -2.34632, 1, 0.4039216, 0, 1,
-1.576013, -1.099137, -1.853465, 1, 0.4078431, 0, 1,
-1.560591, -0.5612442, -2.278643, 1, 0.4156863, 0, 1,
-1.558145, -0.003186075, 0.5345114, 1, 0.4196078, 0, 1,
-1.556172, 1.906051, -1.979729, 1, 0.427451, 0, 1,
-1.548351, 0.01014624, -1.780745, 1, 0.4313726, 0, 1,
-1.542409, -2.435728, -2.170627, 1, 0.4392157, 0, 1,
-1.517012, 1.881256, -1.721274, 1, 0.4431373, 0, 1,
-1.504267, 0.5821824, -1.722118, 1, 0.4509804, 0, 1,
-1.499177, -0.05684354, -0.9582435, 1, 0.454902, 0, 1,
-1.471955, 0.2743721, -0.3333834, 1, 0.4627451, 0, 1,
-1.470799, 1.176356, -0.9470483, 1, 0.4666667, 0, 1,
-1.466524, -0.5703812, -1.042773, 1, 0.4745098, 0, 1,
-1.464793, -0.7447409, -2.506229, 1, 0.4784314, 0, 1,
-1.461562, 0.9699302, 0.2018899, 1, 0.4862745, 0, 1,
-1.453202, 2.030419, -1.611213, 1, 0.4901961, 0, 1,
-1.441084, -0.2433841, -1.62844, 1, 0.4980392, 0, 1,
-1.435029, 0.9129012, -1.582502, 1, 0.5058824, 0, 1,
-1.434957, 0.7336941, 0.09447384, 1, 0.509804, 0, 1,
-1.417299, -1.344743, -4.000865, 1, 0.5176471, 0, 1,
-1.416328, 0.6808741, -1.519838, 1, 0.5215687, 0, 1,
-1.410011, -0.3619995, -3.506267, 1, 0.5294118, 0, 1,
-1.408788, 2.412284, -1.143975, 1, 0.5333334, 0, 1,
-1.408689, -0.7948657, -1.678788, 1, 0.5411765, 0, 1,
-1.405975, 0.3341888, -3.301229, 1, 0.5450981, 0, 1,
-1.387037, 1.230235, -0.44052, 1, 0.5529412, 0, 1,
-1.384685, -0.2396934, -2.178898, 1, 0.5568628, 0, 1,
-1.369213, 0.6058269, -1.213527, 1, 0.5647059, 0, 1,
-1.369174, 0.2566099, -1.971333, 1, 0.5686275, 0, 1,
-1.364279, -1.176303, -2.407126, 1, 0.5764706, 0, 1,
-1.362408, -1.552961, -3.060853, 1, 0.5803922, 0, 1,
-1.362314, -0.2782794, -1.497714, 1, 0.5882353, 0, 1,
-1.340567, -0.1692184, -2.570427, 1, 0.5921569, 0, 1,
-1.336075, 1.173699, -1.400008, 1, 0.6, 0, 1,
-1.332214, -0.1400907, -1.497875, 1, 0.6078432, 0, 1,
-1.328598, -0.03157377, -1.93713, 1, 0.6117647, 0, 1,
-1.328332, 0.2378716, -0.3123982, 1, 0.6196079, 0, 1,
-1.317378, -0.4385494, -2.518522, 1, 0.6235294, 0, 1,
-1.314111, -0.7744056, -2.29658, 1, 0.6313726, 0, 1,
-1.312652, -0.6316358, -0.1212785, 1, 0.6352941, 0, 1,
-1.310068, 0.3011926, -0.6638474, 1, 0.6431373, 0, 1,
-1.308847, -0.8506223, -2.839354, 1, 0.6470588, 0, 1,
-1.306523, -0.604546, -2.72812, 1, 0.654902, 0, 1,
-1.305177, -0.7633517, -2.416329, 1, 0.6588235, 0, 1,
-1.302312, -0.02311477, -1.354315, 1, 0.6666667, 0, 1,
-1.299902, -0.2243611, -2.886504, 1, 0.6705883, 0, 1,
-1.296073, 1.12641, -1.00145, 1, 0.6784314, 0, 1,
-1.286699, -0.8961806, -2.98947, 1, 0.682353, 0, 1,
-1.284837, 0.1311597, -2.620982, 1, 0.6901961, 0, 1,
-1.277389, -0.3465621, -2.052652, 1, 0.6941177, 0, 1,
-1.276929, -0.5001569, -0.9356964, 1, 0.7019608, 0, 1,
-1.272439, -1.0313, -1.324178, 1, 0.7098039, 0, 1,
-1.270055, -0.1036674, -1.898998, 1, 0.7137255, 0, 1,
-1.268981, -0.9537037, -2.146116, 1, 0.7215686, 0, 1,
-1.252225, 0.3481194, -1.45564, 1, 0.7254902, 0, 1,
-1.252218, 0.3272862, -1.313764, 1, 0.7333333, 0, 1,
-1.243466, 0.8213811, -1.683408, 1, 0.7372549, 0, 1,
-1.235589, -0.1063576, -1.71633, 1, 0.7450981, 0, 1,
-1.232108, -0.5203791, -2.068463, 1, 0.7490196, 0, 1,
-1.226159, -0.7467939, -1.680894, 1, 0.7568628, 0, 1,
-1.224397, -0.2465995, -1.736858, 1, 0.7607843, 0, 1,
-1.222241, -1.458608, -1.404389, 1, 0.7686275, 0, 1,
-1.221918, 1.163098, -1.321547, 1, 0.772549, 0, 1,
-1.220143, -0.8426557, -1.393178, 1, 0.7803922, 0, 1,
-1.2151, 0.7692315, -1.248557, 1, 0.7843137, 0, 1,
-1.207517, 0.06754047, -1.276046, 1, 0.7921569, 0, 1,
-1.207051, 1.888606, 0.1613659, 1, 0.7960784, 0, 1,
-1.206122, 1.279966, -0.1912584, 1, 0.8039216, 0, 1,
-1.205349, -1.976184, -3.503664, 1, 0.8117647, 0, 1,
-1.205005, -0.2816006, -2.453533, 1, 0.8156863, 0, 1,
-1.204029, 0.5050394, -3.70311, 1, 0.8235294, 0, 1,
-1.202654, -0.6390381, -2.590424, 1, 0.827451, 0, 1,
-1.191535, 0.3206208, -1.375326, 1, 0.8352941, 0, 1,
-1.181852, -0.2875226, -3.25705, 1, 0.8392157, 0, 1,
-1.181514, 2.485766, -1.820571, 1, 0.8470588, 0, 1,
-1.175868, -0.890199, -4.066023, 1, 0.8509804, 0, 1,
-1.167829, -0.3502608, -1.312256, 1, 0.8588235, 0, 1,
-1.166857, -0.1219079, -1.452163, 1, 0.8627451, 0, 1,
-1.166789, 0.7109707, -2.067222, 1, 0.8705882, 0, 1,
-1.160846, -1.08435, -1.780315, 1, 0.8745098, 0, 1,
-1.157922, 2.25996, -0.7914399, 1, 0.8823529, 0, 1,
-1.149023, -0.1287463, -2.318187, 1, 0.8862745, 0, 1,
-1.144607, 1.307017, -1.571523, 1, 0.8941177, 0, 1,
-1.129019, -0.627697, -3.116651, 1, 0.8980392, 0, 1,
-1.110821, -0.04557838, -1.900785, 1, 0.9058824, 0, 1,
-1.103927, -0.6850403, -0.7264774, 1, 0.9137255, 0, 1,
-1.094567, -0.3165773, -2.289219, 1, 0.9176471, 0, 1,
-1.089578, 0.9346036, -1.719081, 1, 0.9254902, 0, 1,
-1.089506, -0.7565848, -2.472951, 1, 0.9294118, 0, 1,
-1.088641, 0.6700471, -1.863415, 1, 0.9372549, 0, 1,
-1.085855, 0.7879702, -0.3079287, 1, 0.9411765, 0, 1,
-1.079734, 0.3188898, -3.436605, 1, 0.9490196, 0, 1,
-1.066379, -0.06374537, -1.15453, 1, 0.9529412, 0, 1,
-1.065822, -0.9773626, -1.800562, 1, 0.9607843, 0, 1,
-1.063947, 0.849483, 0.8687726, 1, 0.9647059, 0, 1,
-1.059541, -0.3442834, -2.974232, 1, 0.972549, 0, 1,
-1.058075, -1.400956, -2.180665, 1, 0.9764706, 0, 1,
-1.047543, -0.04430953, -2.195974, 1, 0.9843137, 0, 1,
-1.046849, 0.7339091, -0.9614191, 1, 0.9882353, 0, 1,
-1.046705, -0.06114417, -0.839563, 1, 0.9960784, 0, 1,
-1.046208, 0.4874704, -0.8487421, 0.9960784, 1, 0, 1,
-1.040711, 0.4270432, -1.927538, 0.9921569, 1, 0, 1,
-1.040216, -1.719925, -2.063671, 0.9843137, 1, 0, 1,
-1.034413, -0.1269475, 0.4641325, 0.9803922, 1, 0, 1,
-1.029828, 1.771498, -0.3628435, 0.972549, 1, 0, 1,
-1.029059, 0.2744892, -0.205864, 0.9686275, 1, 0, 1,
-1.028284, 0.6486651, -2.105665, 0.9607843, 1, 0, 1,
-1.0279, -1.156104, -0.4231204, 0.9568627, 1, 0, 1,
-1.022447, -1.211744, -1.75133, 0.9490196, 1, 0, 1,
-1.016693, 1.726631, 0.5112409, 0.945098, 1, 0, 1,
-1.007426, 0.815345, 0.3609444, 0.9372549, 1, 0, 1,
-1.004824, 0.3351555, -2.837948, 0.9333333, 1, 0, 1,
-0.999461, -0.6618233, -2.080259, 0.9254902, 1, 0, 1,
-0.9972885, 1.852015, 1.360392, 0.9215686, 1, 0, 1,
-0.9934123, -0.9226829, -2.170878, 0.9137255, 1, 0, 1,
-0.9890924, 0.4166421, -0.1216947, 0.9098039, 1, 0, 1,
-0.9859853, -1.55187, -2.752608, 0.9019608, 1, 0, 1,
-0.9846749, -0.2745881, -1.516706, 0.8941177, 1, 0, 1,
-0.9789844, 0.006954656, -1.444197, 0.8901961, 1, 0, 1,
-0.9694456, -0.5366942, -0.551923, 0.8823529, 1, 0, 1,
-0.9621699, 0.6025919, -0.8119645, 0.8784314, 1, 0, 1,
-0.9602374, -0.8543653, -3.023419, 0.8705882, 1, 0, 1,
-0.9526445, -0.3375075, -2.720612, 0.8666667, 1, 0, 1,
-0.9521737, 0.6028205, -2.153622, 0.8588235, 1, 0, 1,
-0.9357663, 0.3826286, -1.675115, 0.854902, 1, 0, 1,
-0.9350944, -1.030103, -1.187562, 0.8470588, 1, 0, 1,
-0.9326396, -1.456133, -1.485346, 0.8431373, 1, 0, 1,
-0.9284382, -0.1088615, -0.6627215, 0.8352941, 1, 0, 1,
-0.9127908, -0.8397396, -2.190748, 0.8313726, 1, 0, 1,
-0.9102488, 0.7602115, 1.220896, 0.8235294, 1, 0, 1,
-0.9078545, -0.1761914, -1.101511, 0.8196079, 1, 0, 1,
-0.9059706, 0.318918, -1.585921, 0.8117647, 1, 0, 1,
-0.9008047, 0.6772813, -1.235734, 0.8078431, 1, 0, 1,
-0.8998758, -0.3954448, -2.046668, 0.8, 1, 0, 1,
-0.8998312, -0.7940052, -2.631818, 0.7921569, 1, 0, 1,
-0.8995062, -1.1458, -3.726944, 0.7882353, 1, 0, 1,
-0.8981596, 1.16207, -0.3654784, 0.7803922, 1, 0, 1,
-0.894693, 0.3594878, -1.119793, 0.7764706, 1, 0, 1,
-0.894472, -0.3131936, -0.9285737, 0.7686275, 1, 0, 1,
-0.8934427, -1.925718, -2.382307, 0.7647059, 1, 0, 1,
-0.8934366, -1.570068, -3.290422, 0.7568628, 1, 0, 1,
-0.8928126, -2.247051, -1.551883, 0.7529412, 1, 0, 1,
-0.8885553, -0.6128245, -2.721845, 0.7450981, 1, 0, 1,
-0.8852074, 0.07483107, -0.7722543, 0.7411765, 1, 0, 1,
-0.882143, 0.6987358, -0.5406555, 0.7333333, 1, 0, 1,
-0.8798137, 0.5159332, -1.170683, 0.7294118, 1, 0, 1,
-0.879554, 0.3601624, -2.433141, 0.7215686, 1, 0, 1,
-0.8734092, 0.1741672, -1.614432, 0.7176471, 1, 0, 1,
-0.8705325, 1.179358, -0.3609978, 0.7098039, 1, 0, 1,
-0.8626149, 0.04358232, -3.399166, 0.7058824, 1, 0, 1,
-0.8605619, 1.682563, -0.1478413, 0.6980392, 1, 0, 1,
-0.8561786, 0.1346877, -1.048896, 0.6901961, 1, 0, 1,
-0.8455012, -0.08705415, 0.1043443, 0.6862745, 1, 0, 1,
-0.8388621, 0.5600305, -1.74476, 0.6784314, 1, 0, 1,
-0.8370723, 1.054853, -1.091687, 0.6745098, 1, 0, 1,
-0.8287162, 1.575221, -0.2845256, 0.6666667, 1, 0, 1,
-0.8264102, 0.6479927, -0.9873868, 0.6627451, 1, 0, 1,
-0.8250439, -0.09166706, -2.46644, 0.654902, 1, 0, 1,
-0.8224687, 0.3247776, -1.531804, 0.6509804, 1, 0, 1,
-0.820356, 1.463102, -1.283873, 0.6431373, 1, 0, 1,
-0.8185664, -1.222857, -1.488845, 0.6392157, 1, 0, 1,
-0.815574, 2.636654, -1.17077, 0.6313726, 1, 0, 1,
-0.8147735, 1.086093, -1.52722, 0.627451, 1, 0, 1,
-0.8112496, 0.1448945, -2.530818, 0.6196079, 1, 0, 1,
-0.8104531, -1.145668, -2.291116, 0.6156863, 1, 0, 1,
-0.8103132, 0.3397955, -2.854233, 0.6078432, 1, 0, 1,
-0.8087021, 0.8813016, -1.127009, 0.6039216, 1, 0, 1,
-0.80428, -0.7264778, -3.163251, 0.5960785, 1, 0, 1,
-0.8023104, -0.555924, -2.085695, 0.5882353, 1, 0, 1,
-0.8012474, -0.8415748, -1.898014, 0.5843138, 1, 0, 1,
-0.7904182, -0.5402643, -3.725902, 0.5764706, 1, 0, 1,
-0.7804628, 1.501978, -0.3943333, 0.572549, 1, 0, 1,
-0.7665289, -0.069584, -1.936232, 0.5647059, 1, 0, 1,
-0.7661715, -0.2715702, -1.841116, 0.5607843, 1, 0, 1,
-0.7566944, -0.6912219, -0.6692006, 0.5529412, 1, 0, 1,
-0.7559543, -0.2002556, -3.419169, 0.5490196, 1, 0, 1,
-0.7517733, 1.44316, -0.4760689, 0.5411765, 1, 0, 1,
-0.7497497, -1.125189, -5.027908, 0.5372549, 1, 0, 1,
-0.7483471, -0.6806194, -0.7458699, 0.5294118, 1, 0, 1,
-0.7368062, 0.3073767, -0.04407033, 0.5254902, 1, 0, 1,
-0.7291454, 1.021117, -1.658478, 0.5176471, 1, 0, 1,
-0.725821, 1.815984, 0.569519, 0.5137255, 1, 0, 1,
-0.7159811, -0.04988832, -1.903055, 0.5058824, 1, 0, 1,
-0.711693, -1.006845, -2.777071, 0.5019608, 1, 0, 1,
-0.7077259, -1.0538, -1.505567, 0.4941176, 1, 0, 1,
-0.7067955, -0.4203325, -1.516451, 0.4862745, 1, 0, 1,
-0.6999058, -0.1810839, -2.466069, 0.4823529, 1, 0, 1,
-0.6976238, -0.3029384, -2.722845, 0.4745098, 1, 0, 1,
-0.6935459, 0.7825083, -1.59607, 0.4705882, 1, 0, 1,
-0.6918682, 0.003362138, -3.319778, 0.4627451, 1, 0, 1,
-0.6879416, 0.5281237, -0.2782011, 0.4588235, 1, 0, 1,
-0.6865091, -0.9020376, -2.500595, 0.4509804, 1, 0, 1,
-0.6862299, 0.6525146, -0.2794065, 0.4470588, 1, 0, 1,
-0.6845357, -0.4227609, -3.932084, 0.4392157, 1, 0, 1,
-0.6786292, -0.2631627, -1.038411, 0.4352941, 1, 0, 1,
-0.6781005, 0.03863973, -0.6619636, 0.427451, 1, 0, 1,
-0.6771134, 0.5336336, 0.2414432, 0.4235294, 1, 0, 1,
-0.6738441, -1.117272, -2.356537, 0.4156863, 1, 0, 1,
-0.6710176, -0.09428453, -0.8550928, 0.4117647, 1, 0, 1,
-0.6697025, -0.4781519, -2.5201, 0.4039216, 1, 0, 1,
-0.668786, 0.5898067, 0.3890071, 0.3960784, 1, 0, 1,
-0.6666718, 0.7402203, -1.558158, 0.3921569, 1, 0, 1,
-0.6646294, 0.1879916, -0.1582413, 0.3843137, 1, 0, 1,
-0.6645514, 0.2970642, 1.185607, 0.3803922, 1, 0, 1,
-0.662291, -0.9082476, -2.851381, 0.372549, 1, 0, 1,
-0.6602815, 0.3205478, -0.07882304, 0.3686275, 1, 0, 1,
-0.6570809, -0.4882493, -1.538387, 0.3607843, 1, 0, 1,
-0.6570084, -0.6411955, -3.474175, 0.3568628, 1, 0, 1,
-0.6569176, 2.537264, 1.168684, 0.3490196, 1, 0, 1,
-0.6537896, 0.7351725, -2.087972, 0.345098, 1, 0, 1,
-0.6528899, -0.8563969, -1.477628, 0.3372549, 1, 0, 1,
-0.6527795, 0.9072792, -0.8523825, 0.3333333, 1, 0, 1,
-0.64966, -1.348743, -2.464665, 0.3254902, 1, 0, 1,
-0.6473597, 0.9375181, -1.121488, 0.3215686, 1, 0, 1,
-0.6467475, 0.6795424, 0.07659346, 0.3137255, 1, 0, 1,
-0.6465874, -1.002322, -0.7197491, 0.3098039, 1, 0, 1,
-0.6451498, 0.7918214, -1.678061, 0.3019608, 1, 0, 1,
-0.6409937, -1.078307, -0.8828753, 0.2941177, 1, 0, 1,
-0.6363529, -1.623474, -3.538715, 0.2901961, 1, 0, 1,
-0.6312094, 2.169338, -1.236129, 0.282353, 1, 0, 1,
-0.6269053, 1.665395, -1.136656, 0.2784314, 1, 0, 1,
-0.6268076, -0.531962, -2.937659, 0.2705882, 1, 0, 1,
-0.626069, 1.074286, 0.643713, 0.2666667, 1, 0, 1,
-0.6252172, -0.5412533, -1.700114, 0.2588235, 1, 0, 1,
-0.6240965, -0.9585861, -2.509183, 0.254902, 1, 0, 1,
-0.6206788, -1.041725, -3.269257, 0.2470588, 1, 0, 1,
-0.6174825, -0.5993921, -2.614685, 0.2431373, 1, 0, 1,
-0.6135443, 0.6060891, -0.8688664, 0.2352941, 1, 0, 1,
-0.6023756, -0.3971648, -3.023932, 0.2313726, 1, 0, 1,
-0.5951948, -0.3468619, -1.051228, 0.2235294, 1, 0, 1,
-0.5907284, -3.212753, -2.666828, 0.2196078, 1, 0, 1,
-0.5904486, -0.1325031, -1.394207, 0.2117647, 1, 0, 1,
-0.5871806, -0.4300712, -3.789819, 0.2078431, 1, 0, 1,
-0.5840762, 1.028686, 0.4032834, 0.2, 1, 0, 1,
-0.5754001, -1.11892, -2.636144, 0.1921569, 1, 0, 1,
-0.5737838, 2.300713, -0.2993366, 0.1882353, 1, 0, 1,
-0.5680831, -1.993782, -3.003626, 0.1803922, 1, 0, 1,
-0.5663784, 0.4798258, -0.9362485, 0.1764706, 1, 0, 1,
-0.5600737, -0.5598857, -2.70381, 0.1686275, 1, 0, 1,
-0.5590966, 0.825599, -0.6810449, 0.1647059, 1, 0, 1,
-0.5583521, -0.7031093, -0.9396303, 0.1568628, 1, 0, 1,
-0.554024, -1.410773, -4.592401, 0.1529412, 1, 0, 1,
-0.5540074, 1.269488, -0.81224, 0.145098, 1, 0, 1,
-0.5534574, -0.5746609, -1.969181, 0.1411765, 1, 0, 1,
-0.5528259, 0.2899088, -0.6654859, 0.1333333, 1, 0, 1,
-0.5497633, -0.3670257, -2.762277, 0.1294118, 1, 0, 1,
-0.5495719, -0.01680162, -0.9431579, 0.1215686, 1, 0, 1,
-0.5481828, -1.896706, -2.187136, 0.1176471, 1, 0, 1,
-0.5416349, 0.4542919, -0.2901919, 0.1098039, 1, 0, 1,
-0.539993, -0.3038594, -2.935128, 0.1058824, 1, 0, 1,
-0.5346047, 0.8120283, 1.736687, 0.09803922, 1, 0, 1,
-0.5316032, -0.04437661, 0.6171746, 0.09019608, 1, 0, 1,
-0.5240351, -0.7726563, -3.073162, 0.08627451, 1, 0, 1,
-0.5234119, 0.9551245, -1.02702, 0.07843138, 1, 0, 1,
-0.5177041, 0.6635863, 0.2660598, 0.07450981, 1, 0, 1,
-0.5173006, -0.6349558, -1.676696, 0.06666667, 1, 0, 1,
-0.5166951, 0.09747736, -2.643055, 0.0627451, 1, 0, 1,
-0.5150686, 1.541429, -1.231581, 0.05490196, 1, 0, 1,
-0.5144465, -1.742344, -2.099998, 0.05098039, 1, 0, 1,
-0.5140076, -0.5111507, -2.673702, 0.04313726, 1, 0, 1,
-0.5134155, 0.7196605, -0.2926226, 0.03921569, 1, 0, 1,
-0.51072, -1.270744, -2.730622, 0.03137255, 1, 0, 1,
-0.5074965, 0.3561845, -1.97158, 0.02745098, 1, 0, 1,
-0.5045823, 0.7153109, -0.5933512, 0.01960784, 1, 0, 1,
-0.5008829, -0.1970236, -2.763965, 0.01568628, 1, 0, 1,
-0.4990383, -1.145858, -1.131756, 0.007843138, 1, 0, 1,
-0.497568, 0.8622459, -0.6471807, 0.003921569, 1, 0, 1,
-0.4947399, 1.750396, -0.6461977, 0, 1, 0.003921569, 1,
-0.4945844, -1.29786, -3.609134, 0, 1, 0.01176471, 1,
-0.4904129, -0.247677, -2.569284, 0, 1, 0.01568628, 1,
-0.4836479, -0.9512512, -3.003125, 0, 1, 0.02352941, 1,
-0.4827795, 0.8936952, 0.4237048, 0, 1, 0.02745098, 1,
-0.4775257, -1.093408, -2.589894, 0, 1, 0.03529412, 1,
-0.4734475, 1.016037, -1.59721, 0, 1, 0.03921569, 1,
-0.4728406, 2.084486, 0.7287865, 0, 1, 0.04705882, 1,
-0.4726521, 1.084278, 0.3835172, 0, 1, 0.05098039, 1,
-0.4700987, 0.04839106, -1.876679, 0, 1, 0.05882353, 1,
-0.467347, -0.04871443, -1.360107, 0, 1, 0.0627451, 1,
-0.4540982, 0.8620757, -0.7899721, 0, 1, 0.07058824, 1,
-0.4527889, 0.5861591, 0.3528103, 0, 1, 0.07450981, 1,
-0.4472964, 0.4827258, -0.7601544, 0, 1, 0.08235294, 1,
-0.4459709, 1.718591, 0.6024605, 0, 1, 0.08627451, 1,
-0.4441305, 0.2295403, -1.327899, 0, 1, 0.09411765, 1,
-0.437079, 1.380956, -1.252114, 0, 1, 0.1019608, 1,
-0.436566, -1.315137, -1.819395, 0, 1, 0.1058824, 1,
-0.4365351, -1.325769, -2.920071, 0, 1, 0.1137255, 1,
-0.4338282, 1.659006, 0.7618278, 0, 1, 0.1176471, 1,
-0.4324377, -1.007272, -2.282619, 0, 1, 0.1254902, 1,
-0.4303247, 0.8119251, -1.618226, 0, 1, 0.1294118, 1,
-0.4286037, -1.625117, -3.24886, 0, 1, 0.1372549, 1,
-0.428025, 1.586835, -0.278421, 0, 1, 0.1411765, 1,
-0.4112757, 0.6048752, 0.5663142, 0, 1, 0.1490196, 1,
-0.4076752, 0.8391442, -1.035282, 0, 1, 0.1529412, 1,
-0.40617, -1.640653, -2.512209, 0, 1, 0.1607843, 1,
-0.4049704, -1.45731, -2.061762, 0, 1, 0.1647059, 1,
-0.4021277, 0.381824, -2.071677, 0, 1, 0.172549, 1,
-0.3947355, 0.9604999, -0.3454041, 0, 1, 0.1764706, 1,
-0.3876251, -1.62809, -1.801205, 0, 1, 0.1843137, 1,
-0.3874689, -0.5174755, -1.238559, 0, 1, 0.1882353, 1,
-0.3852351, -0.3850608, -1.987954, 0, 1, 0.1960784, 1,
-0.3834798, 0.6903333, 0.008355818, 0, 1, 0.2039216, 1,
-0.383248, -0.5517539, -1.851488, 0, 1, 0.2078431, 1,
-0.3831209, 0.5878178, -0.8407928, 0, 1, 0.2156863, 1,
-0.3818246, 0.04939382, -2.04654, 0, 1, 0.2196078, 1,
-0.3789992, -0.07321837, -0.9360301, 0, 1, 0.227451, 1,
-0.3756002, -0.9803047, -2.819269, 0, 1, 0.2313726, 1,
-0.3738861, 1.808892, -2.983838, 0, 1, 0.2392157, 1,
-0.3736977, 0.1021833, 0.08818975, 0, 1, 0.2431373, 1,
-0.3731301, 0.855196, -0.1448335, 0, 1, 0.2509804, 1,
-0.3727745, 1.621473, -0.680061, 0, 1, 0.254902, 1,
-0.3679674, -0.7301258, -2.27461, 0, 1, 0.2627451, 1,
-0.3625657, 0.5893126, -0.3739273, 0, 1, 0.2666667, 1,
-0.3616715, 0.9923858, -2.198574, 0, 1, 0.2745098, 1,
-0.3604448, -0.04711461, -1.471773, 0, 1, 0.2784314, 1,
-0.3587501, 0.08478684, -1.236513, 0, 1, 0.2862745, 1,
-0.3549182, 0.324707, -0.8052172, 0, 1, 0.2901961, 1,
-0.3526114, -1.1784, -2.360318, 0, 1, 0.2980392, 1,
-0.3414038, 0.3460434, -0.4329756, 0, 1, 0.3058824, 1,
-0.3403027, 0.4526935, -0.8719832, 0, 1, 0.3098039, 1,
-0.3398038, 0.7162372, -0.1361768, 0, 1, 0.3176471, 1,
-0.3385395, 0.7674966, 0.02633511, 0, 1, 0.3215686, 1,
-0.3367938, -2.669262, -3.13139, 0, 1, 0.3294118, 1,
-0.3352889, 1.150994, -0.3554361, 0, 1, 0.3333333, 1,
-0.3287716, 0.3215564, 1.606163, 0, 1, 0.3411765, 1,
-0.3277901, 0.6480751, -0.6386844, 0, 1, 0.345098, 1,
-0.3268473, -0.206749, -1.389546, 0, 1, 0.3529412, 1,
-0.326599, -1.230312, -3.732244, 0, 1, 0.3568628, 1,
-0.3227302, 0.373614, -3.117352, 0, 1, 0.3647059, 1,
-0.3218526, -0.5067239, -2.935748, 0, 1, 0.3686275, 1,
-0.317393, -0.5421973, -2.718584, 0, 1, 0.3764706, 1,
-0.3081373, 0.1424043, -0.3311177, 0, 1, 0.3803922, 1,
-0.3018624, 0.5854357, 0.6221556, 0, 1, 0.3882353, 1,
-0.3013, -1.364737, -2.116632, 0, 1, 0.3921569, 1,
-0.2988358, -0.021771, 0.4142509, 0, 1, 0.4, 1,
-0.2982543, -0.7839262, -2.677417, 0, 1, 0.4078431, 1,
-0.2977186, -1.098903, -2.003424, 0, 1, 0.4117647, 1,
-0.2974883, -0.06631802, -2.126222, 0, 1, 0.4196078, 1,
-0.2882024, -1.226801, -1.99832, 0, 1, 0.4235294, 1,
-0.2821225, 0.1227391, -1.189957, 0, 1, 0.4313726, 1,
-0.2808382, -1.287905, -1.068851, 0, 1, 0.4352941, 1,
-0.2729915, -0.514779, -2.782264, 0, 1, 0.4431373, 1,
-0.2695371, 0.009085347, -1.783727, 0, 1, 0.4470588, 1,
-0.2694839, -1.712186, -2.268736, 0, 1, 0.454902, 1,
-0.2666731, -0.2983227, -2.152586, 0, 1, 0.4588235, 1,
-0.2626107, -0.6262517, -3.280802, 0, 1, 0.4666667, 1,
-0.2621349, -0.6080275, -2.62296, 0, 1, 0.4705882, 1,
-0.2537762, 0.4273669, -0.9840845, 0, 1, 0.4784314, 1,
-0.2443697, -0.4558984, -4.246565, 0, 1, 0.4823529, 1,
-0.2411391, -0.6855991, -1.527391, 0, 1, 0.4901961, 1,
-0.2343691, 0.04674723, -1.321145, 0, 1, 0.4941176, 1,
-0.2325818, -0.986473, -1.010269, 0, 1, 0.5019608, 1,
-0.2310632, 0.07997517, -0.2687002, 0, 1, 0.509804, 1,
-0.2293922, 0.4685731, -1.614548, 0, 1, 0.5137255, 1,
-0.2291248, -1.097983, -2.6427, 0, 1, 0.5215687, 1,
-0.2210593, 0.3031282, -0.6553646, 0, 1, 0.5254902, 1,
-0.2196987, 0.5469454, -1.388437, 0, 1, 0.5333334, 1,
-0.2187279, -1.104819, -3.138817, 0, 1, 0.5372549, 1,
-0.2135514, 0.8511757, -2.141768, 0, 1, 0.5450981, 1,
-0.2067549, 1.221755, 0.09628806, 0, 1, 0.5490196, 1,
-0.199556, -0.4202178, -3.638421, 0, 1, 0.5568628, 1,
-0.1946567, 0.1667846, -0.9392318, 0, 1, 0.5607843, 1,
-0.1894712, 0.00316728, -2.161074, 0, 1, 0.5686275, 1,
-0.1882053, 1.914862, -3.327485, 0, 1, 0.572549, 1,
-0.1874405, 0.7527716, -0.9337853, 0, 1, 0.5803922, 1,
-0.1845805, -1.187559, -3.019874, 0, 1, 0.5843138, 1,
-0.1808955, 0.8503677, 1.315573, 0, 1, 0.5921569, 1,
-0.1781364, -0.2913569, -2.219806, 0, 1, 0.5960785, 1,
-0.1743233, 1.1521, -0.1071693, 0, 1, 0.6039216, 1,
-0.1698349, 0.4754214, -0.06561158, 0, 1, 0.6117647, 1,
-0.1674834, 0.5546482, -0.9450843, 0, 1, 0.6156863, 1,
-0.1668747, -1.166718, -2.366381, 0, 1, 0.6235294, 1,
-0.1665519, -0.4149172, -3.398741, 0, 1, 0.627451, 1,
-0.1641473, 1.570734, 1.706116, 0, 1, 0.6352941, 1,
-0.1622242, 0.1978656, 0.465659, 0, 1, 0.6392157, 1,
-0.1604301, 0.2770883, 0.06486017, 0, 1, 0.6470588, 1,
-0.1601279, 0.2444937, 1.86248, 0, 1, 0.6509804, 1,
-0.1598701, 0.1495738, -0.07046254, 0, 1, 0.6588235, 1,
-0.1554626, -0.6030557, -1.988343, 0, 1, 0.6627451, 1,
-0.1547344, -0.147124, -3.435604, 0, 1, 0.6705883, 1,
-0.149285, -0.371093, -1.5306, 0, 1, 0.6745098, 1,
-0.1464386, 2.032418, -0.5155923, 0, 1, 0.682353, 1,
-0.1443503, 1.242829, 1.539364, 0, 1, 0.6862745, 1,
-0.1411513, -0.6217915, -1.908191, 0, 1, 0.6941177, 1,
-0.1410423, -0.2990662, 0.4282286, 0, 1, 0.7019608, 1,
-0.1401009, 0.187468, -0.4075727, 0, 1, 0.7058824, 1,
-0.1395685, -1.340166, -2.220617, 0, 1, 0.7137255, 1,
-0.1379389, -0.6334919, -3.714995, 0, 1, 0.7176471, 1,
-0.1355579, -0.238465, -2.551697, 0, 1, 0.7254902, 1,
-0.1267614, 0.4138458, 0.9555644, 0, 1, 0.7294118, 1,
-0.124582, 0.4662507, -0.2934173, 0, 1, 0.7372549, 1,
-0.1233472, -2.385831, -1.679887, 0, 1, 0.7411765, 1,
-0.1229691, 0.2061834, -1.307675, 0, 1, 0.7490196, 1,
-0.1213681, 0.207482, -2.580951, 0, 1, 0.7529412, 1,
-0.1209315, 1.028459, 0.7477201, 0, 1, 0.7607843, 1,
-0.1187868, 0.05360321, -1.210936, 0, 1, 0.7647059, 1,
-0.118568, 0.7495927, -0.565222, 0, 1, 0.772549, 1,
-0.116443, -0.3362432, -2.942034, 0, 1, 0.7764706, 1,
-0.1160499, 0.1476627, -2.218277, 0, 1, 0.7843137, 1,
-0.1103313, -0.3521496, -3.415174, 0, 1, 0.7882353, 1,
-0.1088905, -0.330126, -1.218165, 0, 1, 0.7960784, 1,
-0.1029563, -2.477448, -3.591788, 0, 1, 0.8039216, 1,
-0.1009491, -0.4350768, -3.560698, 0, 1, 0.8078431, 1,
-0.09993134, -0.2428683, -2.026245, 0, 1, 0.8156863, 1,
-0.09859225, -1.481783, -4.55887, 0, 1, 0.8196079, 1,
-0.09858786, 0.666164, 0.849147, 0, 1, 0.827451, 1,
-0.09823025, -2.307812, -1.232257, 0, 1, 0.8313726, 1,
-0.09760938, 1.202439, -0.5897579, 0, 1, 0.8392157, 1,
-0.09606789, -0.7582319, -2.93193, 0, 1, 0.8431373, 1,
-0.09603453, -0.4730298, -2.649588, 0, 1, 0.8509804, 1,
-0.09326512, 0.1320847, -2.082011, 0, 1, 0.854902, 1,
-0.08993683, 0.9388794, -0.2805458, 0, 1, 0.8627451, 1,
-0.08725341, -0.04853376, -1.355088, 0, 1, 0.8666667, 1,
-0.0836161, -0.7392259, -2.214581, 0, 1, 0.8745098, 1,
-0.08045541, 2.201897, -1.478277, 0, 1, 0.8784314, 1,
-0.07833347, 1.687634, 1.06711, 0, 1, 0.8862745, 1,
-0.07774214, 0.4534928, 1.908565, 0, 1, 0.8901961, 1,
-0.07720664, 0.3896136, -0.5980816, 0, 1, 0.8980392, 1,
-0.07055393, 0.6184936, -0.5899464, 0, 1, 0.9058824, 1,
-0.06743103, 0.3141986, 2.008062, 0, 1, 0.9098039, 1,
-0.06466573, 1.053039, 0.7185163, 0, 1, 0.9176471, 1,
-0.06404071, -0.1643998, -3.832829, 0, 1, 0.9215686, 1,
-0.05751042, 2.016314, -0.7698863, 0, 1, 0.9294118, 1,
-0.05145552, 0.8103611, 0.1907628, 0, 1, 0.9333333, 1,
-0.04650654, -0.4742127, -3.376571, 0, 1, 0.9411765, 1,
-0.04643429, 0.6183562, -0.6494048, 0, 1, 0.945098, 1,
-0.04497822, 0.4858594, -0.3132634, 0, 1, 0.9529412, 1,
-0.04003308, 1.625448, -1.349813, 0, 1, 0.9568627, 1,
-0.03564904, 0.1810701, 0.7925084, 0, 1, 0.9647059, 1,
-0.03508076, -1.407573, -1.497788, 0, 1, 0.9686275, 1,
-0.03281604, 0.5778094, -0.3850181, 0, 1, 0.9764706, 1,
-0.0250596, -0.01517233, -3.763909, 0, 1, 0.9803922, 1,
-0.02192543, -0.1864911, -4.354821, 0, 1, 0.9882353, 1,
-0.02035044, -0.8718516, -3.425436, 0, 1, 0.9921569, 1,
-0.01983023, 0.1152681, -0.1054424, 0, 1, 1, 1,
-0.01717258, -0.7246062, -3.060241, 0, 0.9921569, 1, 1,
-0.01528982, -0.1269673, -3.576934, 0, 0.9882353, 1, 1,
-0.01458531, -0.3328038, -4.201896, 0, 0.9803922, 1, 1,
-0.01421697, -0.3227082, -3.582448, 0, 0.9764706, 1, 1,
-0.01372505, -0.3625969, -1.134345, 0, 0.9686275, 1, 1,
-0.01161873, 1.21576, 0.09060822, 0, 0.9647059, 1, 1,
-0.01079138, -0.001579807, -2.149109, 0, 0.9568627, 1, 1,
-0.01002065, -1.345342, -2.894835, 0, 0.9529412, 1, 1,
-0.009911976, 1.189135, 0.9363163, 0, 0.945098, 1, 1,
-0.003661556, -1.4616, -2.359921, 0, 0.9411765, 1, 1,
-0.002760101, 0.111376, -0.03951719, 0, 0.9333333, 1, 1,
7.501969e-05, 0.2944894, 0.455641, 0, 0.9294118, 1, 1,
0.003896634, 1.110475, 0.2406108, 0, 0.9215686, 1, 1,
0.005345808, -0.130326, 4.609054, 0, 0.9176471, 1, 1,
0.006798997, -1.980796, 6.134967, 0, 0.9098039, 1, 1,
0.009215, 0.05298367, -0.04458616, 0, 0.9058824, 1, 1,
0.01250557, 0.8649889, -0.1045983, 0, 0.8980392, 1, 1,
0.01257285, 0.03979769, -0.840946, 0, 0.8901961, 1, 1,
0.01286579, 0.9324996, 0.2260766, 0, 0.8862745, 1, 1,
0.01291813, -0.6142935, 3.408189, 0, 0.8784314, 1, 1,
0.01432035, -2.187082, 2.778999, 0, 0.8745098, 1, 1,
0.01527993, -0.2907132, 3.924872, 0, 0.8666667, 1, 1,
0.01733533, -1.329976, 2.659782, 0, 0.8627451, 1, 1,
0.01983161, -0.6800964, 2.890954, 0, 0.854902, 1, 1,
0.02341293, -0.09081896, 2.033149, 0, 0.8509804, 1, 1,
0.02357681, -0.9592802, 3.124168, 0, 0.8431373, 1, 1,
0.02358965, -0.259031, 4.78227, 0, 0.8392157, 1, 1,
0.0252507, 1.647767, -1.437178, 0, 0.8313726, 1, 1,
0.02916711, 0.2477349, -0.6928145, 0, 0.827451, 1, 1,
0.02992295, 0.9033375, 0.2634895, 0, 0.8196079, 1, 1,
0.03153594, -0.4520432, 3.098259, 0, 0.8156863, 1, 1,
0.03154673, 0.69216, -1.035171, 0, 0.8078431, 1, 1,
0.03246655, -0.4065154, 3.251699, 0, 0.8039216, 1, 1,
0.03502486, -0.1216694, 2.896515, 0, 0.7960784, 1, 1,
0.04255009, 1.380152, -0.2792507, 0, 0.7882353, 1, 1,
0.04331601, 0.3757367, -0.7536409, 0, 0.7843137, 1, 1,
0.05308114, -0.7559502, 3.947277, 0, 0.7764706, 1, 1,
0.0564782, -0.2037481, 2.923978, 0, 0.772549, 1, 1,
0.06118534, -0.9029246, 3.824372, 0, 0.7647059, 1, 1,
0.06296662, -1.118179, 3.596819, 0, 0.7607843, 1, 1,
0.0752076, 0.2728001, 2.425725, 0, 0.7529412, 1, 1,
0.08195007, -1.29078, 3.953583, 0, 0.7490196, 1, 1,
0.08215848, -1.678643, 5.20156, 0, 0.7411765, 1, 1,
0.08268759, 0.5970868, 0.04600614, 0, 0.7372549, 1, 1,
0.08527911, 0.3428969, 0.854624, 0, 0.7294118, 1, 1,
0.0910474, -1.013901, 4.375016, 0, 0.7254902, 1, 1,
0.09162065, 0.3948367, 1.660889, 0, 0.7176471, 1, 1,
0.09863283, -0.870966, 3.675631, 0, 0.7137255, 1, 1,
0.1018611, 1.278491, 0.388639, 0, 0.7058824, 1, 1,
0.1026825, 1.780938, -0.7720323, 0, 0.6980392, 1, 1,
0.1056366, -0.4922767, 2.24435, 0, 0.6941177, 1, 1,
0.1113118, -0.538372, 3.127191, 0, 0.6862745, 1, 1,
0.1122352, 0.3137329, 1.065837, 0, 0.682353, 1, 1,
0.1135276, 1.352467, -0.3353712, 0, 0.6745098, 1, 1,
0.1222446, -0.1885737, 2.961791, 0, 0.6705883, 1, 1,
0.1226069, -0.3116068, 2.732371, 0, 0.6627451, 1, 1,
0.1232447, -0.249297, 2.030832, 0, 0.6588235, 1, 1,
0.1299579, 0.5863488, 0.5234244, 0, 0.6509804, 1, 1,
0.1391333, -0.001582847, 1.753821, 0, 0.6470588, 1, 1,
0.1428416, 0.774882, 0.3606504, 0, 0.6392157, 1, 1,
0.1450127, 0.446703, 1.147597, 0, 0.6352941, 1, 1,
0.1482158, 0.3104452, 0.2127528, 0, 0.627451, 1, 1,
0.1619974, 0.6928838, -1.199939, 0, 0.6235294, 1, 1,
0.1622425, -0.462315, 3.083526, 0, 0.6156863, 1, 1,
0.1635481, -2.180753, 3.88147, 0, 0.6117647, 1, 1,
0.1650751, 1.2895, -0.4932492, 0, 0.6039216, 1, 1,
0.1692572, 0.5180564, 1.148214, 0, 0.5960785, 1, 1,
0.172583, 0.376092, -0.6574711, 0, 0.5921569, 1, 1,
0.1755188, 1.010689, -0.500902, 0, 0.5843138, 1, 1,
0.175582, 0.795053, 1.634169, 0, 0.5803922, 1, 1,
0.1797194, 0.863715, 1.004635, 0, 0.572549, 1, 1,
0.1803387, 0.005664517, 2.908888, 0, 0.5686275, 1, 1,
0.1841885, -0.5882832, 3.771758, 0, 0.5607843, 1, 1,
0.1842513, -0.03049832, 1.563801, 0, 0.5568628, 1, 1,
0.1888608, -0.6886874, 4.376589, 0, 0.5490196, 1, 1,
0.1890421, -0.4154304, 3.698825, 0, 0.5450981, 1, 1,
0.1894924, -0.08975747, 3.225908, 0, 0.5372549, 1, 1,
0.1898097, 0.1570536, 0.372937, 0, 0.5333334, 1, 1,
0.1912678, -0.8838762, 3.075919, 0, 0.5254902, 1, 1,
0.1947893, 1.391422, -0.9938883, 0, 0.5215687, 1, 1,
0.1954647, 3.21985, 0.6210918, 0, 0.5137255, 1, 1,
0.1955028, -1.221058, 1.944689, 0, 0.509804, 1, 1,
0.1977643, -0.2198493, 0.4171457, 0, 0.5019608, 1, 1,
0.1992571, 0.1663153, 2.722754, 0, 0.4941176, 1, 1,
0.2015235, 1.740347, -0.2650268, 0, 0.4901961, 1, 1,
0.2040596, 0.6374377, 0.7187951, 0, 0.4823529, 1, 1,
0.2042081, -1.508708, 3.201284, 0, 0.4784314, 1, 1,
0.205753, 1.109013, -0.4628209, 0, 0.4705882, 1, 1,
0.2105819, 2.182417, 0.7529353, 0, 0.4666667, 1, 1,
0.2121128, 1.789878, 1.077147, 0, 0.4588235, 1, 1,
0.2188526, 0.2831271, -0.281252, 0, 0.454902, 1, 1,
0.2196489, 1.927201, -0.6580672, 0, 0.4470588, 1, 1,
0.2211729, 0.3290039, 1.274334, 0, 0.4431373, 1, 1,
0.221315, 0.6450881, 2.022718, 0, 0.4352941, 1, 1,
0.2230465, -0.5196398, 2.43881, 0, 0.4313726, 1, 1,
0.2284711, -0.00365459, 0.1715035, 0, 0.4235294, 1, 1,
0.2292868, -0.4422281, 3.152196, 0, 0.4196078, 1, 1,
0.2321897, -0.220981, 0.9714038, 0, 0.4117647, 1, 1,
0.2329587, -1.314897, 4.125123, 0, 0.4078431, 1, 1,
0.2392524, 0.09153418, 0.4949454, 0, 0.4, 1, 1,
0.240041, -0.779573, 2.912206, 0, 0.3921569, 1, 1,
0.2421114, -1.611482, 3.661246, 0, 0.3882353, 1, 1,
0.243658, -0.5285417, 2.926661, 0, 0.3803922, 1, 1,
0.2460866, 0.695093, -2.54034, 0, 0.3764706, 1, 1,
0.2476104, 0.9408715, 1.726721, 0, 0.3686275, 1, 1,
0.2503802, -1.020216, 4.698469, 0, 0.3647059, 1, 1,
0.253981, 2.560538, 1.189057, 0, 0.3568628, 1, 1,
0.2578557, 0.1484313, 0.734138, 0, 0.3529412, 1, 1,
0.2578673, -0.5867777, 1.636197, 0, 0.345098, 1, 1,
0.2579581, -1.071232, 4.031985, 0, 0.3411765, 1, 1,
0.2583662, -0.4492813, 2.186297, 0, 0.3333333, 1, 1,
0.2591487, -0.7439637, 2.651649, 0, 0.3294118, 1, 1,
0.2599169, -0.2540642, 1.121688, 0, 0.3215686, 1, 1,
0.2608085, -0.1334316, 1.848257, 0, 0.3176471, 1, 1,
0.2621284, 0.36837, 0.7409703, 0, 0.3098039, 1, 1,
0.2624948, 1.691019, 0.9880353, 0, 0.3058824, 1, 1,
0.2646998, 0.5645484, 0.7345629, 0, 0.2980392, 1, 1,
0.2657675, -0.1480845, 3.014453, 0, 0.2901961, 1, 1,
0.2698988, 1.104884, 0.3864361, 0, 0.2862745, 1, 1,
0.2720548, -0.1168884, 2.24455, 0, 0.2784314, 1, 1,
0.2752227, 0.1838934, -0.06664313, 0, 0.2745098, 1, 1,
0.275734, -0.7092643, 3.709605, 0, 0.2666667, 1, 1,
0.2760531, -0.7128569, 3.649961, 0, 0.2627451, 1, 1,
0.276592, -0.9349949, 3.170313, 0, 0.254902, 1, 1,
0.2813711, -0.2372694, 4.368823, 0, 0.2509804, 1, 1,
0.2874301, 0.6571215, 2.117052, 0, 0.2431373, 1, 1,
0.2875581, -0.02517483, 0.4773111, 0, 0.2392157, 1, 1,
0.291237, 0.1844598, -0.3175251, 0, 0.2313726, 1, 1,
0.2926428, -0.3297934, 0.222712, 0, 0.227451, 1, 1,
0.293108, 1.250978, 0.185834, 0, 0.2196078, 1, 1,
0.2961631, -0.7492734, 3.127837, 0, 0.2156863, 1, 1,
0.2967553, -0.4474331, 1.711079, 0, 0.2078431, 1, 1,
0.2976991, -1.013808, 3.417216, 0, 0.2039216, 1, 1,
0.300679, 0.4722187, 1.929003, 0, 0.1960784, 1, 1,
0.3048483, 2.899561, -0.4712127, 0, 0.1882353, 1, 1,
0.3164303, -1.12028, 3.210828, 0, 0.1843137, 1, 1,
0.3221024, -0.289106, 0.0569284, 0, 0.1764706, 1, 1,
0.3287457, 0.637491, 1.505163, 0, 0.172549, 1, 1,
0.3315878, -0.2240514, 2.00594, 0, 0.1647059, 1, 1,
0.336032, -0.4272766, 1.822387, 0, 0.1607843, 1, 1,
0.3376289, 0.7642073, 0.7933019, 0, 0.1529412, 1, 1,
0.3388472, -0.8534387, 4.032701, 0, 0.1490196, 1, 1,
0.3393286, 0.6759821, -0.3223556, 0, 0.1411765, 1, 1,
0.339725, 1.33658, 1.330957, 0, 0.1372549, 1, 1,
0.3465062, 0.9346498, 0.4312515, 0, 0.1294118, 1, 1,
0.3466779, -0.3746458, 2.268597, 0, 0.1254902, 1, 1,
0.3524087, -0.2239203, 5.5107, 0, 0.1176471, 1, 1,
0.353309, 0.747303, 0.3442029, 0, 0.1137255, 1, 1,
0.3554526, 0.6542692, -0.7804233, 0, 0.1058824, 1, 1,
0.3567613, -1.193878, 3.027173, 0, 0.09803922, 1, 1,
0.3615956, -0.4152146, 3.301642, 0, 0.09411765, 1, 1,
0.3637607, -0.7673774, 3.516807, 0, 0.08627451, 1, 1,
0.3724971, -1.043132, 1.317387, 0, 0.08235294, 1, 1,
0.3738473, -0.4333783, -0.6780623, 0, 0.07450981, 1, 1,
0.3741775, 0.3281772, 1.924373, 0, 0.07058824, 1, 1,
0.3769278, 1.919867, -0.7816962, 0, 0.0627451, 1, 1,
0.3857818, 0.1808135, 2.609046, 0, 0.05882353, 1, 1,
0.3886397, 0.6379431, 1.743915, 0, 0.05098039, 1, 1,
0.3923003, 0.7967221, -0.475782, 0, 0.04705882, 1, 1,
0.3989987, -0.6986372, 2.784247, 0, 0.03921569, 1, 1,
0.3990545, 2.636331, 0.4682291, 0, 0.03529412, 1, 1,
0.4009416, -0.468942, 1.170161, 0, 0.02745098, 1, 1,
0.4068356, 0.008303578, 1.477329, 0, 0.02352941, 1, 1,
0.4080964, -1.020538, 3.836745, 0, 0.01568628, 1, 1,
0.4083188, 1.20132, 0.775925, 0, 0.01176471, 1, 1,
0.4091833, 1.784242, 0.6973185, 0, 0.003921569, 1, 1,
0.4100126, 0.9883789, -0.4818764, 0.003921569, 0, 1, 1,
0.4162949, -0.9606333, 2.782476, 0.007843138, 0, 1, 1,
0.4168256, 0.7183308, -0.8782766, 0.01568628, 0, 1, 1,
0.4179969, 0.06389962, 2.144529, 0.01960784, 0, 1, 1,
0.4192809, -2.061273, 3.930248, 0.02745098, 0, 1, 1,
0.4198684, 0.6093659, 0.8703495, 0.03137255, 0, 1, 1,
0.4200061, 2.243927, -0.2927347, 0.03921569, 0, 1, 1,
0.4245864, -0.1995642, 3.562438, 0.04313726, 0, 1, 1,
0.427917, 0.1930516, -0.7348045, 0.05098039, 0, 1, 1,
0.4311269, 0.006254238, 0.7422615, 0.05490196, 0, 1, 1,
0.4434806, 0.17247, -1.155498, 0.0627451, 0, 1, 1,
0.4471061, 1.822432, -0.8081455, 0.06666667, 0, 1, 1,
0.4475379, 0.1850943, 0.0284435, 0.07450981, 0, 1, 1,
0.4488089, 2.152165, 0.1323558, 0.07843138, 0, 1, 1,
0.4510921, -0.1074625, 1.405915, 0.08627451, 0, 1, 1,
0.4524046, -0.4154527, 2.459188, 0.09019608, 0, 1, 1,
0.4548606, -0.7707503, 3.069735, 0.09803922, 0, 1, 1,
0.4659231, 0.5464967, 1.521723, 0.1058824, 0, 1, 1,
0.4679532, 0.9419675, 2.295501, 0.1098039, 0, 1, 1,
0.467985, 0.5496314, 1.535657, 0.1176471, 0, 1, 1,
0.4684495, -0.1357427, 2.492411, 0.1215686, 0, 1, 1,
0.4685155, 1.204921, 0.9950268, 0.1294118, 0, 1, 1,
0.4721511, 1.324735, 0.876709, 0.1333333, 0, 1, 1,
0.4729356, 0.2083094, 0.70728, 0.1411765, 0, 1, 1,
0.4775821, -0.1873375, 2.409146, 0.145098, 0, 1, 1,
0.4788178, 0.7179183, 1.538375, 0.1529412, 0, 1, 1,
0.4821861, 0.4599168, 0.04726936, 0.1568628, 0, 1, 1,
0.4821887, -0.1508974, 2.26314, 0.1647059, 0, 1, 1,
0.4846705, -0.3240152, 0.8894857, 0.1686275, 0, 1, 1,
0.4888321, 0.4936239, 1.271417, 0.1764706, 0, 1, 1,
0.4906653, 1.245953, 0.7745415, 0.1803922, 0, 1, 1,
0.4916113, -1.398353, 2.94958, 0.1882353, 0, 1, 1,
0.4933528, 0.1614994, 0.4965269, 0.1921569, 0, 1, 1,
0.4934594, -0.6900817, 4.449245, 0.2, 0, 1, 1,
0.5042565, 2.081894, -0.1906866, 0.2078431, 0, 1, 1,
0.5051149, -0.6978987, 1.712531, 0.2117647, 0, 1, 1,
0.5086143, -1.690016, 1.792589, 0.2196078, 0, 1, 1,
0.5089902, 1.020526, 1.604592, 0.2235294, 0, 1, 1,
0.5090483, -0.1800046, 1.007315, 0.2313726, 0, 1, 1,
0.5147058, 0.2934825, 0.7816172, 0.2352941, 0, 1, 1,
0.5198873, 0.2363819, 1.363616, 0.2431373, 0, 1, 1,
0.5211738, -0.1272934, 1.032874, 0.2470588, 0, 1, 1,
0.5219323, -1.164361, 2.821236, 0.254902, 0, 1, 1,
0.5247449, 0.801284, -0.7842057, 0.2588235, 0, 1, 1,
0.5266156, 0.2647611, 1.213516, 0.2666667, 0, 1, 1,
0.5285123, -0.6685342, 1.627099, 0.2705882, 0, 1, 1,
0.5291808, 1.157479, 0.3548565, 0.2784314, 0, 1, 1,
0.5322019, -0.130032, 2.275947, 0.282353, 0, 1, 1,
0.5386564, -0.1209533, 2.19322, 0.2901961, 0, 1, 1,
0.5422903, 0.8866823, 0.7582943, 0.2941177, 0, 1, 1,
0.5444657, -0.7602129, 2.662011, 0.3019608, 0, 1, 1,
0.5447932, -0.4882897, 3.317683, 0.3098039, 0, 1, 1,
0.5485117, -0.1173296, 0.04935319, 0.3137255, 0, 1, 1,
0.5506335, -1.063891, 4.379495, 0.3215686, 0, 1, 1,
0.5531678, 0.1806387, 1.3964, 0.3254902, 0, 1, 1,
0.564733, 1.722023, 0.3443591, 0.3333333, 0, 1, 1,
0.5651508, -0.8622565, 3.56941, 0.3372549, 0, 1, 1,
0.5661545, 0.6882598, -0.2944244, 0.345098, 0, 1, 1,
0.5690487, 0.2592164, 2.389003, 0.3490196, 0, 1, 1,
0.5710931, -0.7077556, 3.360112, 0.3568628, 0, 1, 1,
0.5859977, -2.010774, 2.048264, 0.3607843, 0, 1, 1,
0.5912312, -0.3820766, 2.949987, 0.3686275, 0, 1, 1,
0.5961545, 0.1193173, 1.04064, 0.372549, 0, 1, 1,
0.5977792, -1.20826, 3.390914, 0.3803922, 0, 1, 1,
0.600068, -1.305141, 1.810046, 0.3843137, 0, 1, 1,
0.6015235, -0.759725, 2.409455, 0.3921569, 0, 1, 1,
0.6034508, -1.144914, 2.159645, 0.3960784, 0, 1, 1,
0.6034943, -1.043219, 2.092137, 0.4039216, 0, 1, 1,
0.6042097, -0.5690573, 4.08022, 0.4117647, 0, 1, 1,
0.6042343, -1.035476, 2.653904, 0.4156863, 0, 1, 1,
0.6066074, -0.4561187, 2.070417, 0.4235294, 0, 1, 1,
0.608043, -1.678271, 3.409125, 0.427451, 0, 1, 1,
0.6086302, -1.178186, 2.583548, 0.4352941, 0, 1, 1,
0.6092277, -0.2796589, 2.082254, 0.4392157, 0, 1, 1,
0.6096131, -2.292709, 2.553153, 0.4470588, 0, 1, 1,
0.6108952, -1.189343, 1.95193, 0.4509804, 0, 1, 1,
0.618145, -1.41536, 2.049589, 0.4588235, 0, 1, 1,
0.6188198, 0.1560947, 0.5055645, 0.4627451, 0, 1, 1,
0.6206172, -0.5212471, 2.452153, 0.4705882, 0, 1, 1,
0.6213381, 0.5579167, 1.569788, 0.4745098, 0, 1, 1,
0.62428, 1.121526, 0.9521082, 0.4823529, 0, 1, 1,
0.6304024, 0.4056928, -0.2528087, 0.4862745, 0, 1, 1,
0.6321895, 1.051141, 1.186383, 0.4941176, 0, 1, 1,
0.6331601, 0.9222569, 0.3094517, 0.5019608, 0, 1, 1,
0.6334402, 0.06489284, 1.587493, 0.5058824, 0, 1, 1,
0.6361315, -0.03327301, 1.876275, 0.5137255, 0, 1, 1,
0.6366835, 0.6403071, 1.465691, 0.5176471, 0, 1, 1,
0.6395888, -0.6596708, 4.086155, 0.5254902, 0, 1, 1,
0.6411418, 0.06534496, -0.7680981, 0.5294118, 0, 1, 1,
0.6420257, -0.4859348, 2.833143, 0.5372549, 0, 1, 1,
0.6426161, -0.5861819, 3.294986, 0.5411765, 0, 1, 1,
0.6445946, -2.621592, 3.157956, 0.5490196, 0, 1, 1,
0.6453257, -1.665613, 1.930526, 0.5529412, 0, 1, 1,
0.6530741, -0.5496044, 4.255624, 0.5607843, 0, 1, 1,
0.6595456, -2.146525, 2.79624, 0.5647059, 0, 1, 1,
0.6609726, -1.390183, 3.245564, 0.572549, 0, 1, 1,
0.6613997, 0.1662439, 0.02592227, 0.5764706, 0, 1, 1,
0.6706042, -0.4245027, 2.195553, 0.5843138, 0, 1, 1,
0.6712568, -0.5318004, 2.242156, 0.5882353, 0, 1, 1,
0.6720213, 1.127655, -0.1026085, 0.5960785, 0, 1, 1,
0.6758574, 0.827992, -0.6284961, 0.6039216, 0, 1, 1,
0.677641, -0.8090467, 2.036051, 0.6078432, 0, 1, 1,
0.6832736, -1.618186, 3.919612, 0.6156863, 0, 1, 1,
0.6841919, 0.3333749, -0.6864821, 0.6196079, 0, 1, 1,
0.6889018, 1.78607, 1.485636, 0.627451, 0, 1, 1,
0.701649, -0.1420716, 1.615168, 0.6313726, 0, 1, 1,
0.7109201, 0.1100895, 1.375818, 0.6392157, 0, 1, 1,
0.711514, 0.7467235, 1.046572, 0.6431373, 0, 1, 1,
0.7150552, 2.013265, -0.9422561, 0.6509804, 0, 1, 1,
0.7164944, -0.08862657, 1.467467, 0.654902, 0, 1, 1,
0.7202612, 0.2622086, 0.6740464, 0.6627451, 0, 1, 1,
0.7204968, -2.511062, 1.941999, 0.6666667, 0, 1, 1,
0.7205011, 0.07738609, 3.018148, 0.6745098, 0, 1, 1,
0.7315856, -0.5263236, 0.7647845, 0.6784314, 0, 1, 1,
0.7325547, 0.5432795, -0.0551733, 0.6862745, 0, 1, 1,
0.7363521, 0.08586074, 1.667335, 0.6901961, 0, 1, 1,
0.7388813, 0.4534693, 0.766602, 0.6980392, 0, 1, 1,
0.7396975, -0.9865366, 3.768787, 0.7058824, 0, 1, 1,
0.7404135, -1.015832, 2.272923, 0.7098039, 0, 1, 1,
0.7406039, -0.7012323, 4.112487, 0.7176471, 0, 1, 1,
0.7429296, 1.255149, 0.1749542, 0.7215686, 0, 1, 1,
0.7441269, -0.6819519, 3.236291, 0.7294118, 0, 1, 1,
0.7452322, -0.7676253, 3.550576, 0.7333333, 0, 1, 1,
0.7475021, 0.3603857, 1.416745, 0.7411765, 0, 1, 1,
0.7585781, 1.223472, 0.6820967, 0.7450981, 0, 1, 1,
0.7618399, -0.1367781, 1.075135, 0.7529412, 0, 1, 1,
0.7633296, 0.8242475, 1.417733, 0.7568628, 0, 1, 1,
0.7646077, -0.7333208, 1.567372, 0.7647059, 0, 1, 1,
0.768258, 1.62092, -0.9769909, 0.7686275, 0, 1, 1,
0.7711644, 1.42005, -0.5150706, 0.7764706, 0, 1, 1,
0.7740887, -0.4753428, 0.5768613, 0.7803922, 0, 1, 1,
0.7784893, 0.9360496, 2.104681, 0.7882353, 0, 1, 1,
0.778909, -0.3786468, 5.33669, 0.7921569, 0, 1, 1,
0.7818196, 1.599302, -0.6684625, 0.8, 0, 1, 1,
0.7846829, 1.875254, -0.9628808, 0.8078431, 0, 1, 1,
0.7861077, -0.3472912, 2.794332, 0.8117647, 0, 1, 1,
0.7940897, -0.9108932, 3.169201, 0.8196079, 0, 1, 1,
0.8004064, 0.5434492, 2.885611, 0.8235294, 0, 1, 1,
0.8091025, 1.402478, -1.077637, 0.8313726, 0, 1, 1,
0.819509, 0.5811357, 0.1101768, 0.8352941, 0, 1, 1,
0.833824, 0.331053, 2.758294, 0.8431373, 0, 1, 1,
0.834446, 0.5935331, 1.251617, 0.8470588, 0, 1, 1,
0.8347528, -0.3020252, 2.565182, 0.854902, 0, 1, 1,
0.8363659, 0.2705158, 2.13607, 0.8588235, 0, 1, 1,
0.8396171, -0.414273, 2.036958, 0.8666667, 0, 1, 1,
0.8490884, -0.05270537, 0.6901025, 0.8705882, 0, 1, 1,
0.8505682, -0.4616325, 1.495465, 0.8784314, 0, 1, 1,
0.8550295, -2.389721, 3.613506, 0.8823529, 0, 1, 1,
0.8561767, 0.04706274, 2.706063, 0.8901961, 0, 1, 1,
0.8571494, -0.8502443, 2.680579, 0.8941177, 0, 1, 1,
0.8607955, 0.3698364, 1.844571, 0.9019608, 0, 1, 1,
0.8707052, -0.1472238, 2.226506, 0.9098039, 0, 1, 1,
0.8735234, 0.501244, 0.4743076, 0.9137255, 0, 1, 1,
0.8854534, 0.7566358, 0.5386968, 0.9215686, 0, 1, 1,
0.8870484, 0.1855208, 0.469426, 0.9254902, 0, 1, 1,
0.8977097, -0.1373799, 1.467118, 0.9333333, 0, 1, 1,
0.8977757, -0.06187799, 1.510915, 0.9372549, 0, 1, 1,
0.8997712, 0.5165232, 0.9211646, 0.945098, 0, 1, 1,
0.9160948, 0.5314959, 0.2193863, 0.9490196, 0, 1, 1,
0.9218979, 1.758073, -0.09155671, 0.9568627, 0, 1, 1,
0.926775, 0.474125, 0.5727647, 0.9607843, 0, 1, 1,
0.9343543, -1.376858, 2.912874, 0.9686275, 0, 1, 1,
0.9495354, 0.357912, -0.2227042, 0.972549, 0, 1, 1,
0.9518886, 0.3861164, 0.7211904, 0.9803922, 0, 1, 1,
0.952369, -1.426261, 3.938888, 0.9843137, 0, 1, 1,
0.9688053, -0.1565002, -0.1275557, 0.9921569, 0, 1, 1,
0.9724078, -1.015599, 2.874041, 0.9960784, 0, 1, 1,
0.9769583, -0.2401332, 1.120797, 1, 0, 0.9960784, 1,
0.9831135, -0.5135379, 2.614844, 1, 0, 0.9882353, 1,
0.9859021, 0.4829805, -0.03948384, 1, 0, 0.9843137, 1,
0.9887636, 1.848074, -1.139954, 1, 0, 0.9764706, 1,
0.9899104, -0.4203475, 0.2932815, 1, 0, 0.972549, 1,
0.9934612, 1.18745, 0.02850612, 1, 0, 0.9647059, 1,
1.000216, -0.2198319, 2.33165, 1, 0, 0.9607843, 1,
1.003024, -1.642233, 2.77082, 1, 0, 0.9529412, 1,
1.005008, -1.865263, 2.682507, 1, 0, 0.9490196, 1,
1.005946, -0.3079676, 2.589998, 1, 0, 0.9411765, 1,
1.008373, -0.6085452, 2.371589, 1, 0, 0.9372549, 1,
1.00925, 1.065168, 1.065907, 1, 0, 0.9294118, 1,
1.018217, -1.526016, 3.503353, 1, 0, 0.9254902, 1,
1.021124, -0.5139959, 3.054508, 1, 0, 0.9176471, 1,
1.041437, 1.375667, -0.490958, 1, 0, 0.9137255, 1,
1.042541, 0.9353333, 2.224099, 1, 0, 0.9058824, 1,
1.046082, -2.344162, 2.482348, 1, 0, 0.9019608, 1,
1.047805, 3.503906, 0.7365788, 1, 0, 0.8941177, 1,
1.048629, -0.7147576, 1.896517, 1, 0, 0.8862745, 1,
1.051431, -1.601787, 1.319943, 1, 0, 0.8823529, 1,
1.055467, -1.480484, 1.145642, 1, 0, 0.8745098, 1,
1.061291, 0.09520554, 2.08159, 1, 0, 0.8705882, 1,
1.070274, 0.3570421, 0.8131221, 1, 0, 0.8627451, 1,
1.07531, 0.634538, 0.001938721, 1, 0, 0.8588235, 1,
1.076452, -0.886753, 0.4064731, 1, 0, 0.8509804, 1,
1.080919, -0.2716972, 2.504306, 1, 0, 0.8470588, 1,
1.082272, -1.310592, 0.7082521, 1, 0, 0.8392157, 1,
1.087466, 0.2118966, 0.6133725, 1, 0, 0.8352941, 1,
1.088218, -0.2837096, 1.723206, 1, 0, 0.827451, 1,
1.094155, 0.5973718, 0.7415379, 1, 0, 0.8235294, 1,
1.096453, -1.612841, 2.355221, 1, 0, 0.8156863, 1,
1.112029, 1.221158, 1.694612, 1, 0, 0.8117647, 1,
1.112245, -0.6480563, 0.6362478, 1, 0, 0.8039216, 1,
1.118469, 1.204131, 2.467092, 1, 0, 0.7960784, 1,
1.119191, 0.1323256, 1.518783, 1, 0, 0.7921569, 1,
1.124413, -0.8152257, 4.179174, 1, 0, 0.7843137, 1,
1.125127, -0.9051006, 2.121508, 1, 0, 0.7803922, 1,
1.134115, 0.6760666, 0.9387529, 1, 0, 0.772549, 1,
1.147387, 0.4695091, 1.110383, 1, 0, 0.7686275, 1,
1.151673, -0.1990177, 2.451733, 1, 0, 0.7607843, 1,
1.152463, -0.9769444, 2.704419, 1, 0, 0.7568628, 1,
1.164209, 0.6483107, 1.161904, 1, 0, 0.7490196, 1,
1.167295, -0.1931852, 1.282926, 1, 0, 0.7450981, 1,
1.184535, 0.3698406, 0.5894359, 1, 0, 0.7372549, 1,
1.185812, 0.4163409, 1.108011, 1, 0, 0.7333333, 1,
1.192277, -0.1903088, 0.6673702, 1, 0, 0.7254902, 1,
1.19523, -1.016344, 2.491898, 1, 0, 0.7215686, 1,
1.211421, -1.960471, 2.248755, 1, 0, 0.7137255, 1,
1.212622, -0.5698441, 2.182518, 1, 0, 0.7098039, 1,
1.21622, 0.6169167, -0.007876308, 1, 0, 0.7019608, 1,
1.216236, -0.431081, 1.789984, 1, 0, 0.6941177, 1,
1.217099, -0.5610717, 0.6800943, 1, 0, 0.6901961, 1,
1.218409, 0.9920362, 1.016649, 1, 0, 0.682353, 1,
1.220437, -0.5324798, 1.134977, 1, 0, 0.6784314, 1,
1.221993, 0.3446478, 2.421976, 1, 0, 0.6705883, 1,
1.231864, -0.2888721, 0.9907496, 1, 0, 0.6666667, 1,
1.236212, -0.1554845, 0.958576, 1, 0, 0.6588235, 1,
1.236662, -0.3441328, 2.709058, 1, 0, 0.654902, 1,
1.240736, -0.7916387, 3.528232, 1, 0, 0.6470588, 1,
1.240861, -1.173261, 2.612473, 1, 0, 0.6431373, 1,
1.242005, 1.979366, -1.030019, 1, 0, 0.6352941, 1,
1.257527, 0.7319351, 1.154454, 1, 0, 0.6313726, 1,
1.258855, -2.298424, 1.609605, 1, 0, 0.6235294, 1,
1.260286, 0.9017994, 1.801059, 1, 0, 0.6196079, 1,
1.269505, -0.2998747, 2.003873, 1, 0, 0.6117647, 1,
1.274511, -1.025638, 1.476696, 1, 0, 0.6078432, 1,
1.277106, -0.2769083, 2.602488, 1, 0, 0.6, 1,
1.277592, -1.860406, 2.007181, 1, 0, 0.5921569, 1,
1.287788, -0.5456539, 1.356001, 1, 0, 0.5882353, 1,
1.310756, -0.672217, 2.953172, 1, 0, 0.5803922, 1,
1.313103, -0.4245238, 2.024837, 1, 0, 0.5764706, 1,
1.318034, 1.077013, 1.8649, 1, 0, 0.5686275, 1,
1.321364, 0.09186205, 1.995164, 1, 0, 0.5647059, 1,
1.32428, 0.482343, 1.236596, 1, 0, 0.5568628, 1,
1.324765, 0.3878812, 2.685541, 1, 0, 0.5529412, 1,
1.328651, 0.2279686, 1.525542, 1, 0, 0.5450981, 1,
1.333397, -0.1639356, 1.125609, 1, 0, 0.5411765, 1,
1.338353, 1.061779, 1.095853, 1, 0, 0.5333334, 1,
1.338843, -0.3015748, 2.391486, 1, 0, 0.5294118, 1,
1.347375, 0.4137982, 2.027124, 1, 0, 0.5215687, 1,
1.351007, -1.431544, 0.9859781, 1, 0, 0.5176471, 1,
1.368687, 1.478596, -0.3544846, 1, 0, 0.509804, 1,
1.379792, -0.1879719, 1.48123, 1, 0, 0.5058824, 1,
1.385138, -0.07730638, 1.587648, 1, 0, 0.4980392, 1,
1.386357, -1.505041, 2.137558, 1, 0, 0.4901961, 1,
1.395601, 0.9252009, 0.278509, 1, 0, 0.4862745, 1,
1.400247, 0.1357594, 2.016265, 1, 0, 0.4784314, 1,
1.404274, 0.6537924, 2.251426, 1, 0, 0.4745098, 1,
1.4159, 0.3943936, 2.84225, 1, 0, 0.4666667, 1,
1.431404, -0.8278351, 2.85461, 1, 0, 0.4627451, 1,
1.444758, 0.2333273, 2.968603, 1, 0, 0.454902, 1,
1.451372, 0.05158649, 2.470271, 1, 0, 0.4509804, 1,
1.452256, 0.1825211, 0.2894811, 1, 0, 0.4431373, 1,
1.45922, 1.12303, 1.082766, 1, 0, 0.4392157, 1,
1.459404, -0.7057911, 1.799899, 1, 0, 0.4313726, 1,
1.471285, -2.136441, 3.46921, 1, 0, 0.427451, 1,
1.471825, 0.4417807, 1.286566, 1, 0, 0.4196078, 1,
1.476771, 0.402861, 2.999146, 1, 0, 0.4156863, 1,
1.482504, -0.410488, 1.913848, 1, 0, 0.4078431, 1,
1.490085, 1.275142, 2.019478, 1, 0, 0.4039216, 1,
1.507611, 0.6124571, 1.33808, 1, 0, 0.3960784, 1,
1.512321, -0.3771758, 2.907077, 1, 0, 0.3882353, 1,
1.512499, 0.7704493, 1.474368, 1, 0, 0.3843137, 1,
1.527083, -0.00865294, 0.4594155, 1, 0, 0.3764706, 1,
1.534145, -0.4497359, 2.047447, 1, 0, 0.372549, 1,
1.54806, 0.1361411, 1.206178, 1, 0, 0.3647059, 1,
1.549039, 1.093737, 0.2584958, 1, 0, 0.3607843, 1,
1.550572, 0.5881999, 1.914263, 1, 0, 0.3529412, 1,
1.560066, -0.5981218, 2.480742, 1, 0, 0.3490196, 1,
1.565378, -0.1209565, 4.571541, 1, 0, 0.3411765, 1,
1.572411, -0.4403552, 1.611171, 1, 0, 0.3372549, 1,
1.576173, -0.2352426, 3.340561, 1, 0, 0.3294118, 1,
1.579318, -0.6574301, 2.021425, 1, 0, 0.3254902, 1,
1.583434, -1.664156, 3.005313, 1, 0, 0.3176471, 1,
1.590964, 0.7818861, 0.7919987, 1, 0, 0.3137255, 1,
1.606514, 1.317414, -0.1145631, 1, 0, 0.3058824, 1,
1.609566, -0.2815312, -0.810461, 1, 0, 0.2980392, 1,
1.618629, 0.8749429, 0.2956821, 1, 0, 0.2941177, 1,
1.628739, 0.2441555, 3.940529, 1, 0, 0.2862745, 1,
1.634884, 1.524966, 0.6581644, 1, 0, 0.282353, 1,
1.63694, 0.7578106, 1.457017, 1, 0, 0.2745098, 1,
1.638836, 0.9625409, 2.417767, 1, 0, 0.2705882, 1,
1.650176, -1.041302, 2.009097, 1, 0, 0.2627451, 1,
1.661822, 0.08699304, 3.137534, 1, 0, 0.2588235, 1,
1.664377, 0.4822893, 0.7017967, 1, 0, 0.2509804, 1,
1.66927, 0.1963747, 0.2948634, 1, 0, 0.2470588, 1,
1.690318, -0.02395978, -0.8934754, 1, 0, 0.2392157, 1,
1.71432, 1.988988, 0.3653122, 1, 0, 0.2352941, 1,
1.746869, -1.406062, 2.446623, 1, 0, 0.227451, 1,
1.770682, -0.9484936, 1.951034, 1, 0, 0.2235294, 1,
1.780437, -1.057749, 2.583898, 1, 0, 0.2156863, 1,
1.834192, -1.682884, 0.5073131, 1, 0, 0.2117647, 1,
1.83481, 1.31769, 1.224709, 1, 0, 0.2039216, 1,
1.872806, -0.323771, 1.55522, 1, 0, 0.1960784, 1,
1.891526, -0.9096181, 2.424987, 1, 0, 0.1921569, 1,
1.903674, -0.3993936, 1.762884, 1, 0, 0.1843137, 1,
1.914945, 0.07741455, 2.374472, 1, 0, 0.1803922, 1,
1.934427, 1.124626, 0.282118, 1, 0, 0.172549, 1,
1.970195, 0.9186699, 3.178997, 1, 0, 0.1686275, 1,
1.97619, 0.3981586, 1.981333, 1, 0, 0.1607843, 1,
1.976481, 0.3242188, 0.02932962, 1, 0, 0.1568628, 1,
1.977274, -1.387336, 0.7080284, 1, 0, 0.1490196, 1,
2.005135, 0.0812643, 2.460412, 1, 0, 0.145098, 1,
2.018542, 1.961659, 0.590001, 1, 0, 0.1372549, 1,
2.025024, 0.8698276, 2.504214, 1, 0, 0.1333333, 1,
2.028823, 0.2593725, 0.6812816, 1, 0, 0.1254902, 1,
2.030195, 0.4124843, 1.540443, 1, 0, 0.1215686, 1,
2.068059, -1.167353, 2.065239, 1, 0, 0.1137255, 1,
2.184664, -1.39342, 2.538888, 1, 0, 0.1098039, 1,
2.241012, -1.66205, 1.592205, 1, 0, 0.1019608, 1,
2.294742, 1.068728, 0.3971067, 1, 0, 0.09411765, 1,
2.298065, 1.630117, 0.3126994, 1, 0, 0.09019608, 1,
2.325121, -1.121036, 3.669245, 1, 0, 0.08235294, 1,
2.329496, -2.052333, 3.161407, 1, 0, 0.07843138, 1,
2.348847, -0.5855898, 1.85805, 1, 0, 0.07058824, 1,
2.370012, 0.1226319, 2.663377, 1, 0, 0.06666667, 1,
2.373622, -0.5889995, 0.5529652, 1, 0, 0.05882353, 1,
2.381952, -0.7588565, -0.2602878, 1, 0, 0.05490196, 1,
2.399712, -0.895112, 1.280216, 1, 0, 0.04705882, 1,
2.435851, 0.1694912, 1.414165, 1, 0, 0.04313726, 1,
2.464661, 0.2365941, 2.161946, 1, 0, 0.03529412, 1,
2.580854, 0.7721082, 2.8286, 1, 0, 0.03137255, 1,
2.601342, 1.309342, 0.3441044, 1, 0, 0.02352941, 1,
2.94812, -2.681949, 1.856694, 1, 0, 0.01960784, 1,
3.089092, 0.1246904, 0.7191826, 1, 0, 0.01176471, 1,
3.235473, -2.207693, 2.045314, 1, 0, 0.007843138, 1
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
-0.1787413, -4.351227, -6.920016, 0, -0.5, 0.5, 0.5,
-0.1787413, -4.351227, -6.920016, 1, -0.5, 0.5, 0.5,
-0.1787413, -4.351227, -6.920016, 1, 1.5, 0.5, 0.5,
-0.1787413, -4.351227, -6.920016, 0, 1.5, 0.5, 0.5
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
-4.750375, 0.1455762, -6.920016, 0, -0.5, 0.5, 0.5,
-4.750375, 0.1455762, -6.920016, 1, -0.5, 0.5, 0.5,
-4.750375, 0.1455762, -6.920016, 1, 1.5, 0.5, 0.5,
-4.750375, 0.1455762, -6.920016, 0, 1.5, 0.5, 0.5
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
-4.750375, -4.351227, 0.5535295, 0, -0.5, 0.5, 0.5,
-4.750375, -4.351227, 0.5535295, 1, -0.5, 0.5, 0.5,
-4.750375, -4.351227, 0.5535295, 1, 1.5, 0.5, 0.5,
-4.750375, -4.351227, 0.5535295, 0, 1.5, 0.5, 0.5
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
-3, -3.313503, -5.195352,
3, -3.313503, -5.195352,
-3, -3.313503, -5.195352,
-3, -3.486457, -5.482796,
-2, -3.313503, -5.195352,
-2, -3.486457, -5.482796,
-1, -3.313503, -5.195352,
-1, -3.486457, -5.482796,
0, -3.313503, -5.195352,
0, -3.486457, -5.482796,
1, -3.313503, -5.195352,
1, -3.486457, -5.482796,
2, -3.313503, -5.195352,
2, -3.486457, -5.482796,
3, -3.313503, -5.195352,
3, -3.486457, -5.482796
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
-3, -3.832365, -6.057683, 0, -0.5, 0.5, 0.5,
-3, -3.832365, -6.057683, 1, -0.5, 0.5, 0.5,
-3, -3.832365, -6.057683, 1, 1.5, 0.5, 0.5,
-3, -3.832365, -6.057683, 0, 1.5, 0.5, 0.5,
-2, -3.832365, -6.057683, 0, -0.5, 0.5, 0.5,
-2, -3.832365, -6.057683, 1, -0.5, 0.5, 0.5,
-2, -3.832365, -6.057683, 1, 1.5, 0.5, 0.5,
-2, -3.832365, -6.057683, 0, 1.5, 0.5, 0.5,
-1, -3.832365, -6.057683, 0, -0.5, 0.5, 0.5,
-1, -3.832365, -6.057683, 1, -0.5, 0.5, 0.5,
-1, -3.832365, -6.057683, 1, 1.5, 0.5, 0.5,
-1, -3.832365, -6.057683, 0, 1.5, 0.5, 0.5,
0, -3.832365, -6.057683, 0, -0.5, 0.5, 0.5,
0, -3.832365, -6.057683, 1, -0.5, 0.5, 0.5,
0, -3.832365, -6.057683, 1, 1.5, 0.5, 0.5,
0, -3.832365, -6.057683, 0, 1.5, 0.5, 0.5,
1, -3.832365, -6.057683, 0, -0.5, 0.5, 0.5,
1, -3.832365, -6.057683, 1, -0.5, 0.5, 0.5,
1, -3.832365, -6.057683, 1, 1.5, 0.5, 0.5,
1, -3.832365, -6.057683, 0, 1.5, 0.5, 0.5,
2, -3.832365, -6.057683, 0, -0.5, 0.5, 0.5,
2, -3.832365, -6.057683, 1, -0.5, 0.5, 0.5,
2, -3.832365, -6.057683, 1, 1.5, 0.5, 0.5,
2, -3.832365, -6.057683, 0, 1.5, 0.5, 0.5,
3, -3.832365, -6.057683, 0, -0.5, 0.5, 0.5,
3, -3.832365, -6.057683, 1, -0.5, 0.5, 0.5,
3, -3.832365, -6.057683, 1, 1.5, 0.5, 0.5,
3, -3.832365, -6.057683, 0, 1.5, 0.5, 0.5
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
-3.695383, -3, -5.195352,
-3.695383, 3, -5.195352,
-3.695383, -3, -5.195352,
-3.871215, -3, -5.482796,
-3.695383, -2, -5.195352,
-3.871215, -2, -5.482796,
-3.695383, -1, -5.195352,
-3.871215, -1, -5.482796,
-3.695383, 0, -5.195352,
-3.871215, 0, -5.482796,
-3.695383, 1, -5.195352,
-3.871215, 1, -5.482796,
-3.695383, 2, -5.195352,
-3.871215, 2, -5.482796,
-3.695383, 3, -5.195352,
-3.871215, 3, -5.482796
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
-4.222878, -3, -6.057683, 0, -0.5, 0.5, 0.5,
-4.222878, -3, -6.057683, 1, -0.5, 0.5, 0.5,
-4.222878, -3, -6.057683, 1, 1.5, 0.5, 0.5,
-4.222878, -3, -6.057683, 0, 1.5, 0.5, 0.5,
-4.222878, -2, -6.057683, 0, -0.5, 0.5, 0.5,
-4.222878, -2, -6.057683, 1, -0.5, 0.5, 0.5,
-4.222878, -2, -6.057683, 1, 1.5, 0.5, 0.5,
-4.222878, -2, -6.057683, 0, 1.5, 0.5, 0.5,
-4.222878, -1, -6.057683, 0, -0.5, 0.5, 0.5,
-4.222878, -1, -6.057683, 1, -0.5, 0.5, 0.5,
-4.222878, -1, -6.057683, 1, 1.5, 0.5, 0.5,
-4.222878, -1, -6.057683, 0, 1.5, 0.5, 0.5,
-4.222878, 0, -6.057683, 0, -0.5, 0.5, 0.5,
-4.222878, 0, -6.057683, 1, -0.5, 0.5, 0.5,
-4.222878, 0, -6.057683, 1, 1.5, 0.5, 0.5,
-4.222878, 0, -6.057683, 0, 1.5, 0.5, 0.5,
-4.222878, 1, -6.057683, 0, -0.5, 0.5, 0.5,
-4.222878, 1, -6.057683, 1, -0.5, 0.5, 0.5,
-4.222878, 1, -6.057683, 1, 1.5, 0.5, 0.5,
-4.222878, 1, -6.057683, 0, 1.5, 0.5, 0.5,
-4.222878, 2, -6.057683, 0, -0.5, 0.5, 0.5,
-4.222878, 2, -6.057683, 1, -0.5, 0.5, 0.5,
-4.222878, 2, -6.057683, 1, 1.5, 0.5, 0.5,
-4.222878, 2, -6.057683, 0, 1.5, 0.5, 0.5,
-4.222878, 3, -6.057683, 0, -0.5, 0.5, 0.5,
-4.222878, 3, -6.057683, 1, -0.5, 0.5, 0.5,
-4.222878, 3, -6.057683, 1, 1.5, 0.5, 0.5,
-4.222878, 3, -6.057683, 0, 1.5, 0.5, 0.5
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
-3.695383, -3.313503, -4,
-3.695383, -3.313503, 6,
-3.695383, -3.313503, -4,
-3.871215, -3.486457, -4,
-3.695383, -3.313503, -2,
-3.871215, -3.486457, -2,
-3.695383, -3.313503, 0,
-3.871215, -3.486457, 0,
-3.695383, -3.313503, 2,
-3.871215, -3.486457, 2,
-3.695383, -3.313503, 4,
-3.871215, -3.486457, 4,
-3.695383, -3.313503, 6,
-3.871215, -3.486457, 6
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
"4",
"6"
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
-4.222878, -3.832365, -4, 0, -0.5, 0.5, 0.5,
-4.222878, -3.832365, -4, 1, -0.5, 0.5, 0.5,
-4.222878, -3.832365, -4, 1, 1.5, 0.5, 0.5,
-4.222878, -3.832365, -4, 0, 1.5, 0.5, 0.5,
-4.222878, -3.832365, -2, 0, -0.5, 0.5, 0.5,
-4.222878, -3.832365, -2, 1, -0.5, 0.5, 0.5,
-4.222878, -3.832365, -2, 1, 1.5, 0.5, 0.5,
-4.222878, -3.832365, -2, 0, 1.5, 0.5, 0.5,
-4.222878, -3.832365, 0, 0, -0.5, 0.5, 0.5,
-4.222878, -3.832365, 0, 1, -0.5, 0.5, 0.5,
-4.222878, -3.832365, 0, 1, 1.5, 0.5, 0.5,
-4.222878, -3.832365, 0, 0, 1.5, 0.5, 0.5,
-4.222878, -3.832365, 2, 0, -0.5, 0.5, 0.5,
-4.222878, -3.832365, 2, 1, -0.5, 0.5, 0.5,
-4.222878, -3.832365, 2, 1, 1.5, 0.5, 0.5,
-4.222878, -3.832365, 2, 0, 1.5, 0.5, 0.5,
-4.222878, -3.832365, 4, 0, -0.5, 0.5, 0.5,
-4.222878, -3.832365, 4, 1, -0.5, 0.5, 0.5,
-4.222878, -3.832365, 4, 1, 1.5, 0.5, 0.5,
-4.222878, -3.832365, 4, 0, 1.5, 0.5, 0.5,
-4.222878, -3.832365, 6, 0, -0.5, 0.5, 0.5,
-4.222878, -3.832365, 6, 1, -0.5, 0.5, 0.5,
-4.222878, -3.832365, 6, 1, 1.5, 0.5, 0.5,
-4.222878, -3.832365, 6, 0, 1.5, 0.5, 0.5
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
-3.695383, -3.313503, -5.195352,
-3.695383, 3.604656, -5.195352,
-3.695383, -3.313503, 6.302411,
-3.695383, 3.604656, 6.302411,
-3.695383, -3.313503, -5.195352,
-3.695383, -3.313503, 6.302411,
-3.695383, 3.604656, -5.195352,
-3.695383, 3.604656, 6.302411,
-3.695383, -3.313503, -5.195352,
3.3379, -3.313503, -5.195352,
-3.695383, -3.313503, 6.302411,
3.3379, -3.313503, 6.302411,
-3.695383, 3.604656, -5.195352,
3.3379, 3.604656, -5.195352,
-3.695383, 3.604656, 6.302411,
3.3379, 3.604656, 6.302411,
3.3379, -3.313503, -5.195352,
3.3379, 3.604656, -5.195352,
3.3379, -3.313503, 6.302411,
3.3379, 3.604656, 6.302411,
3.3379, -3.313503, -5.195352,
3.3379, -3.313503, 6.302411,
3.3379, 3.604656, -5.195352,
3.3379, 3.604656, 6.302411
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
var radius = 8.089877;
var distance = 35.99277;
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
mvMatrix.translate( 0.1787413, -0.1455762, -0.5535295 );
mvMatrix.scale( 1.243649, 1.264344, 0.7607509 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.99277);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
daimuron<-read.table("daimuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-daimuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'daimuron' not found
```

```r
y<-daimuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'daimuron' not found
```

```r
z<-daimuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'daimuron' not found
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
-3.592956, -0.005718755, -3.25293, 0, 0, 1, 1, 1,
-2.84567, -1.136852, -4.521683, 1, 0, 0, 1, 1,
-2.73701, -0.3401253, -0.7411917, 1, 0, 0, 1, 1,
-2.721388, -1.42491, -2.26696, 1, 0, 0, 1, 1,
-2.663711, 1.059382, -0.8959774, 1, 0, 0, 1, 1,
-2.56279, 0.3279475, -0.904584, 1, 0, 0, 1, 1,
-2.548981, -0.9885682, -1.088246, 0, 0, 0, 1, 1,
-2.523761, -0.8958272, -2.942063, 0, 0, 0, 1, 1,
-2.488683, 0.5027467, -1.223238, 0, 0, 0, 1, 1,
-2.457343, 0.3189443, -2.243991, 0, 0, 0, 1, 1,
-2.37991, -1.195416, -1.529576, 0, 0, 0, 1, 1,
-2.348597, 1.959524, 0.1974254, 0, 0, 0, 1, 1,
-2.288598, 0.395009, -2.697588, 0, 0, 0, 1, 1,
-2.286687, 1.781295, -0.82925, 1, 1, 1, 1, 1,
-2.257608, 0.5695097, -1.15728, 1, 1, 1, 1, 1,
-2.244577, -0.7658311, -1.905806, 1, 1, 1, 1, 1,
-2.232927, -0.2457018, -1.564689, 1, 1, 1, 1, 1,
-2.218671, 0.8350434, -1.346086, 1, 1, 1, 1, 1,
-2.20294, -0.9725953, -1.72736, 1, 1, 1, 1, 1,
-2.118124, 2.649108, 1.198205, 1, 1, 1, 1, 1,
-2.102716, 0.3226361, -1.129295, 1, 1, 1, 1, 1,
-2.097532, -0.8730617, -1.080067, 1, 1, 1, 1, 1,
-2.075914, -2.094266, -2.859393, 1, 1, 1, 1, 1,
-2.020574, -0.8859319, -3.122831, 1, 1, 1, 1, 1,
-2.017045, 1.527054, -2.985852, 1, 1, 1, 1, 1,
-1.995404, 0.2170525, -0.4104547, 1, 1, 1, 1, 1,
-1.991046, 0.4983431, -2.182807, 1, 1, 1, 1, 1,
-1.988375, 1.074397, -1.477668, 1, 1, 1, 1, 1,
-1.979231, 0.2271699, -2.411441, 0, 0, 1, 1, 1,
-1.975333, 0.8272161, -0.5589035, 1, 0, 0, 1, 1,
-1.974261, -0.002491024, -0.444907, 1, 0, 0, 1, 1,
-1.97225, 1.068574, -0.9207801, 1, 0, 0, 1, 1,
-1.954545, -0.2449603, -0.99993, 1, 0, 0, 1, 1,
-1.943646, 2.275003, -0.985532, 1, 0, 0, 1, 1,
-1.93113, -0.3456823, -1.828972, 0, 0, 0, 1, 1,
-1.914252, 0.1316935, -1.775905, 0, 0, 0, 1, 1,
-1.89489, 0.8431573, -1.341878, 0, 0, 0, 1, 1,
-1.885786, -0.2115671, -0.01839516, 0, 0, 0, 1, 1,
-1.881736, 0.08915261, -2.98445, 0, 0, 0, 1, 1,
-1.873789, 0.3237028, -2.12945, 0, 0, 0, 1, 1,
-1.872688, -1.412221, -2.777519, 0, 0, 0, 1, 1,
-1.865251, 0.3129846, -1.063398, 1, 1, 1, 1, 1,
-1.862104, 0.4338052, -0.8127773, 1, 1, 1, 1, 1,
-1.83851, -0.3332423, -2.122069, 1, 1, 1, 1, 1,
-1.832476, 0.4935083, -1.915831, 1, 1, 1, 1, 1,
-1.832085, 1.03072, -2.645877, 1, 1, 1, 1, 1,
-1.822451, 1.075028, 0.5708399, 1, 1, 1, 1, 1,
-1.788552, 1.040161, -0.7797833, 1, 1, 1, 1, 1,
-1.773386, -0.968558, -1.078073, 1, 1, 1, 1, 1,
-1.766219, 0.816924, 1.322271, 1, 1, 1, 1, 1,
-1.763988, -0.4537441, -3.683568, 1, 1, 1, 1, 1,
-1.762723, 0.5625181, -1.294342, 1, 1, 1, 1, 1,
-1.761832, 0.6775862, -0.750885, 1, 1, 1, 1, 1,
-1.758392, 1.361951, -0.2186626, 1, 1, 1, 1, 1,
-1.752763, 0.2163909, -4.114934, 1, 1, 1, 1, 1,
-1.739417, 2.157122, -0.06414767, 1, 1, 1, 1, 1,
-1.713621, 0.3564814, -0.8930463, 0, 0, 1, 1, 1,
-1.704316, 0.8309557, -1.355053, 1, 0, 0, 1, 1,
-1.686331, 0.5456439, 0.03951867, 1, 0, 0, 1, 1,
-1.678043, 0.001204898, -1.399115, 1, 0, 0, 1, 1,
-1.649845, 0.4442157, -1.912612, 1, 0, 0, 1, 1,
-1.649111, -0.5295379, -2.140644, 1, 0, 0, 1, 1,
-1.645622, -1.335702, -3.100216, 0, 0, 0, 1, 1,
-1.613689, -0.3786972, -1.560353, 0, 0, 0, 1, 1,
-1.594578, 0.7326009, -1.303628, 0, 0, 0, 1, 1,
-1.583994, -0.9646221, -1.009962, 0, 0, 0, 1, 1,
-1.579865, 0.7637886, 0.1068305, 0, 0, 0, 1, 1,
-1.579449, 0.2967103, -2.34632, 0, 0, 0, 1, 1,
-1.576013, -1.099137, -1.853465, 0, 0, 0, 1, 1,
-1.560591, -0.5612442, -2.278643, 1, 1, 1, 1, 1,
-1.558145, -0.003186075, 0.5345114, 1, 1, 1, 1, 1,
-1.556172, 1.906051, -1.979729, 1, 1, 1, 1, 1,
-1.548351, 0.01014624, -1.780745, 1, 1, 1, 1, 1,
-1.542409, -2.435728, -2.170627, 1, 1, 1, 1, 1,
-1.517012, 1.881256, -1.721274, 1, 1, 1, 1, 1,
-1.504267, 0.5821824, -1.722118, 1, 1, 1, 1, 1,
-1.499177, -0.05684354, -0.9582435, 1, 1, 1, 1, 1,
-1.471955, 0.2743721, -0.3333834, 1, 1, 1, 1, 1,
-1.470799, 1.176356, -0.9470483, 1, 1, 1, 1, 1,
-1.466524, -0.5703812, -1.042773, 1, 1, 1, 1, 1,
-1.464793, -0.7447409, -2.506229, 1, 1, 1, 1, 1,
-1.461562, 0.9699302, 0.2018899, 1, 1, 1, 1, 1,
-1.453202, 2.030419, -1.611213, 1, 1, 1, 1, 1,
-1.441084, -0.2433841, -1.62844, 1, 1, 1, 1, 1,
-1.435029, 0.9129012, -1.582502, 0, 0, 1, 1, 1,
-1.434957, 0.7336941, 0.09447384, 1, 0, 0, 1, 1,
-1.417299, -1.344743, -4.000865, 1, 0, 0, 1, 1,
-1.416328, 0.6808741, -1.519838, 1, 0, 0, 1, 1,
-1.410011, -0.3619995, -3.506267, 1, 0, 0, 1, 1,
-1.408788, 2.412284, -1.143975, 1, 0, 0, 1, 1,
-1.408689, -0.7948657, -1.678788, 0, 0, 0, 1, 1,
-1.405975, 0.3341888, -3.301229, 0, 0, 0, 1, 1,
-1.387037, 1.230235, -0.44052, 0, 0, 0, 1, 1,
-1.384685, -0.2396934, -2.178898, 0, 0, 0, 1, 1,
-1.369213, 0.6058269, -1.213527, 0, 0, 0, 1, 1,
-1.369174, 0.2566099, -1.971333, 0, 0, 0, 1, 1,
-1.364279, -1.176303, -2.407126, 0, 0, 0, 1, 1,
-1.362408, -1.552961, -3.060853, 1, 1, 1, 1, 1,
-1.362314, -0.2782794, -1.497714, 1, 1, 1, 1, 1,
-1.340567, -0.1692184, -2.570427, 1, 1, 1, 1, 1,
-1.336075, 1.173699, -1.400008, 1, 1, 1, 1, 1,
-1.332214, -0.1400907, -1.497875, 1, 1, 1, 1, 1,
-1.328598, -0.03157377, -1.93713, 1, 1, 1, 1, 1,
-1.328332, 0.2378716, -0.3123982, 1, 1, 1, 1, 1,
-1.317378, -0.4385494, -2.518522, 1, 1, 1, 1, 1,
-1.314111, -0.7744056, -2.29658, 1, 1, 1, 1, 1,
-1.312652, -0.6316358, -0.1212785, 1, 1, 1, 1, 1,
-1.310068, 0.3011926, -0.6638474, 1, 1, 1, 1, 1,
-1.308847, -0.8506223, -2.839354, 1, 1, 1, 1, 1,
-1.306523, -0.604546, -2.72812, 1, 1, 1, 1, 1,
-1.305177, -0.7633517, -2.416329, 1, 1, 1, 1, 1,
-1.302312, -0.02311477, -1.354315, 1, 1, 1, 1, 1,
-1.299902, -0.2243611, -2.886504, 0, 0, 1, 1, 1,
-1.296073, 1.12641, -1.00145, 1, 0, 0, 1, 1,
-1.286699, -0.8961806, -2.98947, 1, 0, 0, 1, 1,
-1.284837, 0.1311597, -2.620982, 1, 0, 0, 1, 1,
-1.277389, -0.3465621, -2.052652, 1, 0, 0, 1, 1,
-1.276929, -0.5001569, -0.9356964, 1, 0, 0, 1, 1,
-1.272439, -1.0313, -1.324178, 0, 0, 0, 1, 1,
-1.270055, -0.1036674, -1.898998, 0, 0, 0, 1, 1,
-1.268981, -0.9537037, -2.146116, 0, 0, 0, 1, 1,
-1.252225, 0.3481194, -1.45564, 0, 0, 0, 1, 1,
-1.252218, 0.3272862, -1.313764, 0, 0, 0, 1, 1,
-1.243466, 0.8213811, -1.683408, 0, 0, 0, 1, 1,
-1.235589, -0.1063576, -1.71633, 0, 0, 0, 1, 1,
-1.232108, -0.5203791, -2.068463, 1, 1, 1, 1, 1,
-1.226159, -0.7467939, -1.680894, 1, 1, 1, 1, 1,
-1.224397, -0.2465995, -1.736858, 1, 1, 1, 1, 1,
-1.222241, -1.458608, -1.404389, 1, 1, 1, 1, 1,
-1.221918, 1.163098, -1.321547, 1, 1, 1, 1, 1,
-1.220143, -0.8426557, -1.393178, 1, 1, 1, 1, 1,
-1.2151, 0.7692315, -1.248557, 1, 1, 1, 1, 1,
-1.207517, 0.06754047, -1.276046, 1, 1, 1, 1, 1,
-1.207051, 1.888606, 0.1613659, 1, 1, 1, 1, 1,
-1.206122, 1.279966, -0.1912584, 1, 1, 1, 1, 1,
-1.205349, -1.976184, -3.503664, 1, 1, 1, 1, 1,
-1.205005, -0.2816006, -2.453533, 1, 1, 1, 1, 1,
-1.204029, 0.5050394, -3.70311, 1, 1, 1, 1, 1,
-1.202654, -0.6390381, -2.590424, 1, 1, 1, 1, 1,
-1.191535, 0.3206208, -1.375326, 1, 1, 1, 1, 1,
-1.181852, -0.2875226, -3.25705, 0, 0, 1, 1, 1,
-1.181514, 2.485766, -1.820571, 1, 0, 0, 1, 1,
-1.175868, -0.890199, -4.066023, 1, 0, 0, 1, 1,
-1.167829, -0.3502608, -1.312256, 1, 0, 0, 1, 1,
-1.166857, -0.1219079, -1.452163, 1, 0, 0, 1, 1,
-1.166789, 0.7109707, -2.067222, 1, 0, 0, 1, 1,
-1.160846, -1.08435, -1.780315, 0, 0, 0, 1, 1,
-1.157922, 2.25996, -0.7914399, 0, 0, 0, 1, 1,
-1.149023, -0.1287463, -2.318187, 0, 0, 0, 1, 1,
-1.144607, 1.307017, -1.571523, 0, 0, 0, 1, 1,
-1.129019, -0.627697, -3.116651, 0, 0, 0, 1, 1,
-1.110821, -0.04557838, -1.900785, 0, 0, 0, 1, 1,
-1.103927, -0.6850403, -0.7264774, 0, 0, 0, 1, 1,
-1.094567, -0.3165773, -2.289219, 1, 1, 1, 1, 1,
-1.089578, 0.9346036, -1.719081, 1, 1, 1, 1, 1,
-1.089506, -0.7565848, -2.472951, 1, 1, 1, 1, 1,
-1.088641, 0.6700471, -1.863415, 1, 1, 1, 1, 1,
-1.085855, 0.7879702, -0.3079287, 1, 1, 1, 1, 1,
-1.079734, 0.3188898, -3.436605, 1, 1, 1, 1, 1,
-1.066379, -0.06374537, -1.15453, 1, 1, 1, 1, 1,
-1.065822, -0.9773626, -1.800562, 1, 1, 1, 1, 1,
-1.063947, 0.849483, 0.8687726, 1, 1, 1, 1, 1,
-1.059541, -0.3442834, -2.974232, 1, 1, 1, 1, 1,
-1.058075, -1.400956, -2.180665, 1, 1, 1, 1, 1,
-1.047543, -0.04430953, -2.195974, 1, 1, 1, 1, 1,
-1.046849, 0.7339091, -0.9614191, 1, 1, 1, 1, 1,
-1.046705, -0.06114417, -0.839563, 1, 1, 1, 1, 1,
-1.046208, 0.4874704, -0.8487421, 1, 1, 1, 1, 1,
-1.040711, 0.4270432, -1.927538, 0, 0, 1, 1, 1,
-1.040216, -1.719925, -2.063671, 1, 0, 0, 1, 1,
-1.034413, -0.1269475, 0.4641325, 1, 0, 0, 1, 1,
-1.029828, 1.771498, -0.3628435, 1, 0, 0, 1, 1,
-1.029059, 0.2744892, -0.205864, 1, 0, 0, 1, 1,
-1.028284, 0.6486651, -2.105665, 1, 0, 0, 1, 1,
-1.0279, -1.156104, -0.4231204, 0, 0, 0, 1, 1,
-1.022447, -1.211744, -1.75133, 0, 0, 0, 1, 1,
-1.016693, 1.726631, 0.5112409, 0, 0, 0, 1, 1,
-1.007426, 0.815345, 0.3609444, 0, 0, 0, 1, 1,
-1.004824, 0.3351555, -2.837948, 0, 0, 0, 1, 1,
-0.999461, -0.6618233, -2.080259, 0, 0, 0, 1, 1,
-0.9972885, 1.852015, 1.360392, 0, 0, 0, 1, 1,
-0.9934123, -0.9226829, -2.170878, 1, 1, 1, 1, 1,
-0.9890924, 0.4166421, -0.1216947, 1, 1, 1, 1, 1,
-0.9859853, -1.55187, -2.752608, 1, 1, 1, 1, 1,
-0.9846749, -0.2745881, -1.516706, 1, 1, 1, 1, 1,
-0.9789844, 0.006954656, -1.444197, 1, 1, 1, 1, 1,
-0.9694456, -0.5366942, -0.551923, 1, 1, 1, 1, 1,
-0.9621699, 0.6025919, -0.8119645, 1, 1, 1, 1, 1,
-0.9602374, -0.8543653, -3.023419, 1, 1, 1, 1, 1,
-0.9526445, -0.3375075, -2.720612, 1, 1, 1, 1, 1,
-0.9521737, 0.6028205, -2.153622, 1, 1, 1, 1, 1,
-0.9357663, 0.3826286, -1.675115, 1, 1, 1, 1, 1,
-0.9350944, -1.030103, -1.187562, 1, 1, 1, 1, 1,
-0.9326396, -1.456133, -1.485346, 1, 1, 1, 1, 1,
-0.9284382, -0.1088615, -0.6627215, 1, 1, 1, 1, 1,
-0.9127908, -0.8397396, -2.190748, 1, 1, 1, 1, 1,
-0.9102488, 0.7602115, 1.220896, 0, 0, 1, 1, 1,
-0.9078545, -0.1761914, -1.101511, 1, 0, 0, 1, 1,
-0.9059706, 0.318918, -1.585921, 1, 0, 0, 1, 1,
-0.9008047, 0.6772813, -1.235734, 1, 0, 0, 1, 1,
-0.8998758, -0.3954448, -2.046668, 1, 0, 0, 1, 1,
-0.8998312, -0.7940052, -2.631818, 1, 0, 0, 1, 1,
-0.8995062, -1.1458, -3.726944, 0, 0, 0, 1, 1,
-0.8981596, 1.16207, -0.3654784, 0, 0, 0, 1, 1,
-0.894693, 0.3594878, -1.119793, 0, 0, 0, 1, 1,
-0.894472, -0.3131936, -0.9285737, 0, 0, 0, 1, 1,
-0.8934427, -1.925718, -2.382307, 0, 0, 0, 1, 1,
-0.8934366, -1.570068, -3.290422, 0, 0, 0, 1, 1,
-0.8928126, -2.247051, -1.551883, 0, 0, 0, 1, 1,
-0.8885553, -0.6128245, -2.721845, 1, 1, 1, 1, 1,
-0.8852074, 0.07483107, -0.7722543, 1, 1, 1, 1, 1,
-0.882143, 0.6987358, -0.5406555, 1, 1, 1, 1, 1,
-0.8798137, 0.5159332, -1.170683, 1, 1, 1, 1, 1,
-0.879554, 0.3601624, -2.433141, 1, 1, 1, 1, 1,
-0.8734092, 0.1741672, -1.614432, 1, 1, 1, 1, 1,
-0.8705325, 1.179358, -0.3609978, 1, 1, 1, 1, 1,
-0.8626149, 0.04358232, -3.399166, 1, 1, 1, 1, 1,
-0.8605619, 1.682563, -0.1478413, 1, 1, 1, 1, 1,
-0.8561786, 0.1346877, -1.048896, 1, 1, 1, 1, 1,
-0.8455012, -0.08705415, 0.1043443, 1, 1, 1, 1, 1,
-0.8388621, 0.5600305, -1.74476, 1, 1, 1, 1, 1,
-0.8370723, 1.054853, -1.091687, 1, 1, 1, 1, 1,
-0.8287162, 1.575221, -0.2845256, 1, 1, 1, 1, 1,
-0.8264102, 0.6479927, -0.9873868, 1, 1, 1, 1, 1,
-0.8250439, -0.09166706, -2.46644, 0, 0, 1, 1, 1,
-0.8224687, 0.3247776, -1.531804, 1, 0, 0, 1, 1,
-0.820356, 1.463102, -1.283873, 1, 0, 0, 1, 1,
-0.8185664, -1.222857, -1.488845, 1, 0, 0, 1, 1,
-0.815574, 2.636654, -1.17077, 1, 0, 0, 1, 1,
-0.8147735, 1.086093, -1.52722, 1, 0, 0, 1, 1,
-0.8112496, 0.1448945, -2.530818, 0, 0, 0, 1, 1,
-0.8104531, -1.145668, -2.291116, 0, 0, 0, 1, 1,
-0.8103132, 0.3397955, -2.854233, 0, 0, 0, 1, 1,
-0.8087021, 0.8813016, -1.127009, 0, 0, 0, 1, 1,
-0.80428, -0.7264778, -3.163251, 0, 0, 0, 1, 1,
-0.8023104, -0.555924, -2.085695, 0, 0, 0, 1, 1,
-0.8012474, -0.8415748, -1.898014, 0, 0, 0, 1, 1,
-0.7904182, -0.5402643, -3.725902, 1, 1, 1, 1, 1,
-0.7804628, 1.501978, -0.3943333, 1, 1, 1, 1, 1,
-0.7665289, -0.069584, -1.936232, 1, 1, 1, 1, 1,
-0.7661715, -0.2715702, -1.841116, 1, 1, 1, 1, 1,
-0.7566944, -0.6912219, -0.6692006, 1, 1, 1, 1, 1,
-0.7559543, -0.2002556, -3.419169, 1, 1, 1, 1, 1,
-0.7517733, 1.44316, -0.4760689, 1, 1, 1, 1, 1,
-0.7497497, -1.125189, -5.027908, 1, 1, 1, 1, 1,
-0.7483471, -0.6806194, -0.7458699, 1, 1, 1, 1, 1,
-0.7368062, 0.3073767, -0.04407033, 1, 1, 1, 1, 1,
-0.7291454, 1.021117, -1.658478, 1, 1, 1, 1, 1,
-0.725821, 1.815984, 0.569519, 1, 1, 1, 1, 1,
-0.7159811, -0.04988832, -1.903055, 1, 1, 1, 1, 1,
-0.711693, -1.006845, -2.777071, 1, 1, 1, 1, 1,
-0.7077259, -1.0538, -1.505567, 1, 1, 1, 1, 1,
-0.7067955, -0.4203325, -1.516451, 0, 0, 1, 1, 1,
-0.6999058, -0.1810839, -2.466069, 1, 0, 0, 1, 1,
-0.6976238, -0.3029384, -2.722845, 1, 0, 0, 1, 1,
-0.6935459, 0.7825083, -1.59607, 1, 0, 0, 1, 1,
-0.6918682, 0.003362138, -3.319778, 1, 0, 0, 1, 1,
-0.6879416, 0.5281237, -0.2782011, 1, 0, 0, 1, 1,
-0.6865091, -0.9020376, -2.500595, 0, 0, 0, 1, 1,
-0.6862299, 0.6525146, -0.2794065, 0, 0, 0, 1, 1,
-0.6845357, -0.4227609, -3.932084, 0, 0, 0, 1, 1,
-0.6786292, -0.2631627, -1.038411, 0, 0, 0, 1, 1,
-0.6781005, 0.03863973, -0.6619636, 0, 0, 0, 1, 1,
-0.6771134, 0.5336336, 0.2414432, 0, 0, 0, 1, 1,
-0.6738441, -1.117272, -2.356537, 0, 0, 0, 1, 1,
-0.6710176, -0.09428453, -0.8550928, 1, 1, 1, 1, 1,
-0.6697025, -0.4781519, -2.5201, 1, 1, 1, 1, 1,
-0.668786, 0.5898067, 0.3890071, 1, 1, 1, 1, 1,
-0.6666718, 0.7402203, -1.558158, 1, 1, 1, 1, 1,
-0.6646294, 0.1879916, -0.1582413, 1, 1, 1, 1, 1,
-0.6645514, 0.2970642, 1.185607, 1, 1, 1, 1, 1,
-0.662291, -0.9082476, -2.851381, 1, 1, 1, 1, 1,
-0.6602815, 0.3205478, -0.07882304, 1, 1, 1, 1, 1,
-0.6570809, -0.4882493, -1.538387, 1, 1, 1, 1, 1,
-0.6570084, -0.6411955, -3.474175, 1, 1, 1, 1, 1,
-0.6569176, 2.537264, 1.168684, 1, 1, 1, 1, 1,
-0.6537896, 0.7351725, -2.087972, 1, 1, 1, 1, 1,
-0.6528899, -0.8563969, -1.477628, 1, 1, 1, 1, 1,
-0.6527795, 0.9072792, -0.8523825, 1, 1, 1, 1, 1,
-0.64966, -1.348743, -2.464665, 1, 1, 1, 1, 1,
-0.6473597, 0.9375181, -1.121488, 0, 0, 1, 1, 1,
-0.6467475, 0.6795424, 0.07659346, 1, 0, 0, 1, 1,
-0.6465874, -1.002322, -0.7197491, 1, 0, 0, 1, 1,
-0.6451498, 0.7918214, -1.678061, 1, 0, 0, 1, 1,
-0.6409937, -1.078307, -0.8828753, 1, 0, 0, 1, 1,
-0.6363529, -1.623474, -3.538715, 1, 0, 0, 1, 1,
-0.6312094, 2.169338, -1.236129, 0, 0, 0, 1, 1,
-0.6269053, 1.665395, -1.136656, 0, 0, 0, 1, 1,
-0.6268076, -0.531962, -2.937659, 0, 0, 0, 1, 1,
-0.626069, 1.074286, 0.643713, 0, 0, 0, 1, 1,
-0.6252172, -0.5412533, -1.700114, 0, 0, 0, 1, 1,
-0.6240965, -0.9585861, -2.509183, 0, 0, 0, 1, 1,
-0.6206788, -1.041725, -3.269257, 0, 0, 0, 1, 1,
-0.6174825, -0.5993921, -2.614685, 1, 1, 1, 1, 1,
-0.6135443, 0.6060891, -0.8688664, 1, 1, 1, 1, 1,
-0.6023756, -0.3971648, -3.023932, 1, 1, 1, 1, 1,
-0.5951948, -0.3468619, -1.051228, 1, 1, 1, 1, 1,
-0.5907284, -3.212753, -2.666828, 1, 1, 1, 1, 1,
-0.5904486, -0.1325031, -1.394207, 1, 1, 1, 1, 1,
-0.5871806, -0.4300712, -3.789819, 1, 1, 1, 1, 1,
-0.5840762, 1.028686, 0.4032834, 1, 1, 1, 1, 1,
-0.5754001, -1.11892, -2.636144, 1, 1, 1, 1, 1,
-0.5737838, 2.300713, -0.2993366, 1, 1, 1, 1, 1,
-0.5680831, -1.993782, -3.003626, 1, 1, 1, 1, 1,
-0.5663784, 0.4798258, -0.9362485, 1, 1, 1, 1, 1,
-0.5600737, -0.5598857, -2.70381, 1, 1, 1, 1, 1,
-0.5590966, 0.825599, -0.6810449, 1, 1, 1, 1, 1,
-0.5583521, -0.7031093, -0.9396303, 1, 1, 1, 1, 1,
-0.554024, -1.410773, -4.592401, 0, 0, 1, 1, 1,
-0.5540074, 1.269488, -0.81224, 1, 0, 0, 1, 1,
-0.5534574, -0.5746609, -1.969181, 1, 0, 0, 1, 1,
-0.5528259, 0.2899088, -0.6654859, 1, 0, 0, 1, 1,
-0.5497633, -0.3670257, -2.762277, 1, 0, 0, 1, 1,
-0.5495719, -0.01680162, -0.9431579, 1, 0, 0, 1, 1,
-0.5481828, -1.896706, -2.187136, 0, 0, 0, 1, 1,
-0.5416349, 0.4542919, -0.2901919, 0, 0, 0, 1, 1,
-0.539993, -0.3038594, -2.935128, 0, 0, 0, 1, 1,
-0.5346047, 0.8120283, 1.736687, 0, 0, 0, 1, 1,
-0.5316032, -0.04437661, 0.6171746, 0, 0, 0, 1, 1,
-0.5240351, -0.7726563, -3.073162, 0, 0, 0, 1, 1,
-0.5234119, 0.9551245, -1.02702, 0, 0, 0, 1, 1,
-0.5177041, 0.6635863, 0.2660598, 1, 1, 1, 1, 1,
-0.5173006, -0.6349558, -1.676696, 1, 1, 1, 1, 1,
-0.5166951, 0.09747736, -2.643055, 1, 1, 1, 1, 1,
-0.5150686, 1.541429, -1.231581, 1, 1, 1, 1, 1,
-0.5144465, -1.742344, -2.099998, 1, 1, 1, 1, 1,
-0.5140076, -0.5111507, -2.673702, 1, 1, 1, 1, 1,
-0.5134155, 0.7196605, -0.2926226, 1, 1, 1, 1, 1,
-0.51072, -1.270744, -2.730622, 1, 1, 1, 1, 1,
-0.5074965, 0.3561845, -1.97158, 1, 1, 1, 1, 1,
-0.5045823, 0.7153109, -0.5933512, 1, 1, 1, 1, 1,
-0.5008829, -0.1970236, -2.763965, 1, 1, 1, 1, 1,
-0.4990383, -1.145858, -1.131756, 1, 1, 1, 1, 1,
-0.497568, 0.8622459, -0.6471807, 1, 1, 1, 1, 1,
-0.4947399, 1.750396, -0.6461977, 1, 1, 1, 1, 1,
-0.4945844, -1.29786, -3.609134, 1, 1, 1, 1, 1,
-0.4904129, -0.247677, -2.569284, 0, 0, 1, 1, 1,
-0.4836479, -0.9512512, -3.003125, 1, 0, 0, 1, 1,
-0.4827795, 0.8936952, 0.4237048, 1, 0, 0, 1, 1,
-0.4775257, -1.093408, -2.589894, 1, 0, 0, 1, 1,
-0.4734475, 1.016037, -1.59721, 1, 0, 0, 1, 1,
-0.4728406, 2.084486, 0.7287865, 1, 0, 0, 1, 1,
-0.4726521, 1.084278, 0.3835172, 0, 0, 0, 1, 1,
-0.4700987, 0.04839106, -1.876679, 0, 0, 0, 1, 1,
-0.467347, -0.04871443, -1.360107, 0, 0, 0, 1, 1,
-0.4540982, 0.8620757, -0.7899721, 0, 0, 0, 1, 1,
-0.4527889, 0.5861591, 0.3528103, 0, 0, 0, 1, 1,
-0.4472964, 0.4827258, -0.7601544, 0, 0, 0, 1, 1,
-0.4459709, 1.718591, 0.6024605, 0, 0, 0, 1, 1,
-0.4441305, 0.2295403, -1.327899, 1, 1, 1, 1, 1,
-0.437079, 1.380956, -1.252114, 1, 1, 1, 1, 1,
-0.436566, -1.315137, -1.819395, 1, 1, 1, 1, 1,
-0.4365351, -1.325769, -2.920071, 1, 1, 1, 1, 1,
-0.4338282, 1.659006, 0.7618278, 1, 1, 1, 1, 1,
-0.4324377, -1.007272, -2.282619, 1, 1, 1, 1, 1,
-0.4303247, 0.8119251, -1.618226, 1, 1, 1, 1, 1,
-0.4286037, -1.625117, -3.24886, 1, 1, 1, 1, 1,
-0.428025, 1.586835, -0.278421, 1, 1, 1, 1, 1,
-0.4112757, 0.6048752, 0.5663142, 1, 1, 1, 1, 1,
-0.4076752, 0.8391442, -1.035282, 1, 1, 1, 1, 1,
-0.40617, -1.640653, -2.512209, 1, 1, 1, 1, 1,
-0.4049704, -1.45731, -2.061762, 1, 1, 1, 1, 1,
-0.4021277, 0.381824, -2.071677, 1, 1, 1, 1, 1,
-0.3947355, 0.9604999, -0.3454041, 1, 1, 1, 1, 1,
-0.3876251, -1.62809, -1.801205, 0, 0, 1, 1, 1,
-0.3874689, -0.5174755, -1.238559, 1, 0, 0, 1, 1,
-0.3852351, -0.3850608, -1.987954, 1, 0, 0, 1, 1,
-0.3834798, 0.6903333, 0.008355818, 1, 0, 0, 1, 1,
-0.383248, -0.5517539, -1.851488, 1, 0, 0, 1, 1,
-0.3831209, 0.5878178, -0.8407928, 1, 0, 0, 1, 1,
-0.3818246, 0.04939382, -2.04654, 0, 0, 0, 1, 1,
-0.3789992, -0.07321837, -0.9360301, 0, 0, 0, 1, 1,
-0.3756002, -0.9803047, -2.819269, 0, 0, 0, 1, 1,
-0.3738861, 1.808892, -2.983838, 0, 0, 0, 1, 1,
-0.3736977, 0.1021833, 0.08818975, 0, 0, 0, 1, 1,
-0.3731301, 0.855196, -0.1448335, 0, 0, 0, 1, 1,
-0.3727745, 1.621473, -0.680061, 0, 0, 0, 1, 1,
-0.3679674, -0.7301258, -2.27461, 1, 1, 1, 1, 1,
-0.3625657, 0.5893126, -0.3739273, 1, 1, 1, 1, 1,
-0.3616715, 0.9923858, -2.198574, 1, 1, 1, 1, 1,
-0.3604448, -0.04711461, -1.471773, 1, 1, 1, 1, 1,
-0.3587501, 0.08478684, -1.236513, 1, 1, 1, 1, 1,
-0.3549182, 0.324707, -0.8052172, 1, 1, 1, 1, 1,
-0.3526114, -1.1784, -2.360318, 1, 1, 1, 1, 1,
-0.3414038, 0.3460434, -0.4329756, 1, 1, 1, 1, 1,
-0.3403027, 0.4526935, -0.8719832, 1, 1, 1, 1, 1,
-0.3398038, 0.7162372, -0.1361768, 1, 1, 1, 1, 1,
-0.3385395, 0.7674966, 0.02633511, 1, 1, 1, 1, 1,
-0.3367938, -2.669262, -3.13139, 1, 1, 1, 1, 1,
-0.3352889, 1.150994, -0.3554361, 1, 1, 1, 1, 1,
-0.3287716, 0.3215564, 1.606163, 1, 1, 1, 1, 1,
-0.3277901, 0.6480751, -0.6386844, 1, 1, 1, 1, 1,
-0.3268473, -0.206749, -1.389546, 0, 0, 1, 1, 1,
-0.326599, -1.230312, -3.732244, 1, 0, 0, 1, 1,
-0.3227302, 0.373614, -3.117352, 1, 0, 0, 1, 1,
-0.3218526, -0.5067239, -2.935748, 1, 0, 0, 1, 1,
-0.317393, -0.5421973, -2.718584, 1, 0, 0, 1, 1,
-0.3081373, 0.1424043, -0.3311177, 1, 0, 0, 1, 1,
-0.3018624, 0.5854357, 0.6221556, 0, 0, 0, 1, 1,
-0.3013, -1.364737, -2.116632, 0, 0, 0, 1, 1,
-0.2988358, -0.021771, 0.4142509, 0, 0, 0, 1, 1,
-0.2982543, -0.7839262, -2.677417, 0, 0, 0, 1, 1,
-0.2977186, -1.098903, -2.003424, 0, 0, 0, 1, 1,
-0.2974883, -0.06631802, -2.126222, 0, 0, 0, 1, 1,
-0.2882024, -1.226801, -1.99832, 0, 0, 0, 1, 1,
-0.2821225, 0.1227391, -1.189957, 1, 1, 1, 1, 1,
-0.2808382, -1.287905, -1.068851, 1, 1, 1, 1, 1,
-0.2729915, -0.514779, -2.782264, 1, 1, 1, 1, 1,
-0.2695371, 0.009085347, -1.783727, 1, 1, 1, 1, 1,
-0.2694839, -1.712186, -2.268736, 1, 1, 1, 1, 1,
-0.2666731, -0.2983227, -2.152586, 1, 1, 1, 1, 1,
-0.2626107, -0.6262517, -3.280802, 1, 1, 1, 1, 1,
-0.2621349, -0.6080275, -2.62296, 1, 1, 1, 1, 1,
-0.2537762, 0.4273669, -0.9840845, 1, 1, 1, 1, 1,
-0.2443697, -0.4558984, -4.246565, 1, 1, 1, 1, 1,
-0.2411391, -0.6855991, -1.527391, 1, 1, 1, 1, 1,
-0.2343691, 0.04674723, -1.321145, 1, 1, 1, 1, 1,
-0.2325818, -0.986473, -1.010269, 1, 1, 1, 1, 1,
-0.2310632, 0.07997517, -0.2687002, 1, 1, 1, 1, 1,
-0.2293922, 0.4685731, -1.614548, 1, 1, 1, 1, 1,
-0.2291248, -1.097983, -2.6427, 0, 0, 1, 1, 1,
-0.2210593, 0.3031282, -0.6553646, 1, 0, 0, 1, 1,
-0.2196987, 0.5469454, -1.388437, 1, 0, 0, 1, 1,
-0.2187279, -1.104819, -3.138817, 1, 0, 0, 1, 1,
-0.2135514, 0.8511757, -2.141768, 1, 0, 0, 1, 1,
-0.2067549, 1.221755, 0.09628806, 1, 0, 0, 1, 1,
-0.199556, -0.4202178, -3.638421, 0, 0, 0, 1, 1,
-0.1946567, 0.1667846, -0.9392318, 0, 0, 0, 1, 1,
-0.1894712, 0.00316728, -2.161074, 0, 0, 0, 1, 1,
-0.1882053, 1.914862, -3.327485, 0, 0, 0, 1, 1,
-0.1874405, 0.7527716, -0.9337853, 0, 0, 0, 1, 1,
-0.1845805, -1.187559, -3.019874, 0, 0, 0, 1, 1,
-0.1808955, 0.8503677, 1.315573, 0, 0, 0, 1, 1,
-0.1781364, -0.2913569, -2.219806, 1, 1, 1, 1, 1,
-0.1743233, 1.1521, -0.1071693, 1, 1, 1, 1, 1,
-0.1698349, 0.4754214, -0.06561158, 1, 1, 1, 1, 1,
-0.1674834, 0.5546482, -0.9450843, 1, 1, 1, 1, 1,
-0.1668747, -1.166718, -2.366381, 1, 1, 1, 1, 1,
-0.1665519, -0.4149172, -3.398741, 1, 1, 1, 1, 1,
-0.1641473, 1.570734, 1.706116, 1, 1, 1, 1, 1,
-0.1622242, 0.1978656, 0.465659, 1, 1, 1, 1, 1,
-0.1604301, 0.2770883, 0.06486017, 1, 1, 1, 1, 1,
-0.1601279, 0.2444937, 1.86248, 1, 1, 1, 1, 1,
-0.1598701, 0.1495738, -0.07046254, 1, 1, 1, 1, 1,
-0.1554626, -0.6030557, -1.988343, 1, 1, 1, 1, 1,
-0.1547344, -0.147124, -3.435604, 1, 1, 1, 1, 1,
-0.149285, -0.371093, -1.5306, 1, 1, 1, 1, 1,
-0.1464386, 2.032418, -0.5155923, 1, 1, 1, 1, 1,
-0.1443503, 1.242829, 1.539364, 0, 0, 1, 1, 1,
-0.1411513, -0.6217915, -1.908191, 1, 0, 0, 1, 1,
-0.1410423, -0.2990662, 0.4282286, 1, 0, 0, 1, 1,
-0.1401009, 0.187468, -0.4075727, 1, 0, 0, 1, 1,
-0.1395685, -1.340166, -2.220617, 1, 0, 0, 1, 1,
-0.1379389, -0.6334919, -3.714995, 1, 0, 0, 1, 1,
-0.1355579, -0.238465, -2.551697, 0, 0, 0, 1, 1,
-0.1267614, 0.4138458, 0.9555644, 0, 0, 0, 1, 1,
-0.124582, 0.4662507, -0.2934173, 0, 0, 0, 1, 1,
-0.1233472, -2.385831, -1.679887, 0, 0, 0, 1, 1,
-0.1229691, 0.2061834, -1.307675, 0, 0, 0, 1, 1,
-0.1213681, 0.207482, -2.580951, 0, 0, 0, 1, 1,
-0.1209315, 1.028459, 0.7477201, 0, 0, 0, 1, 1,
-0.1187868, 0.05360321, -1.210936, 1, 1, 1, 1, 1,
-0.118568, 0.7495927, -0.565222, 1, 1, 1, 1, 1,
-0.116443, -0.3362432, -2.942034, 1, 1, 1, 1, 1,
-0.1160499, 0.1476627, -2.218277, 1, 1, 1, 1, 1,
-0.1103313, -0.3521496, -3.415174, 1, 1, 1, 1, 1,
-0.1088905, -0.330126, -1.218165, 1, 1, 1, 1, 1,
-0.1029563, -2.477448, -3.591788, 1, 1, 1, 1, 1,
-0.1009491, -0.4350768, -3.560698, 1, 1, 1, 1, 1,
-0.09993134, -0.2428683, -2.026245, 1, 1, 1, 1, 1,
-0.09859225, -1.481783, -4.55887, 1, 1, 1, 1, 1,
-0.09858786, 0.666164, 0.849147, 1, 1, 1, 1, 1,
-0.09823025, -2.307812, -1.232257, 1, 1, 1, 1, 1,
-0.09760938, 1.202439, -0.5897579, 1, 1, 1, 1, 1,
-0.09606789, -0.7582319, -2.93193, 1, 1, 1, 1, 1,
-0.09603453, -0.4730298, -2.649588, 1, 1, 1, 1, 1,
-0.09326512, 0.1320847, -2.082011, 0, 0, 1, 1, 1,
-0.08993683, 0.9388794, -0.2805458, 1, 0, 0, 1, 1,
-0.08725341, -0.04853376, -1.355088, 1, 0, 0, 1, 1,
-0.0836161, -0.7392259, -2.214581, 1, 0, 0, 1, 1,
-0.08045541, 2.201897, -1.478277, 1, 0, 0, 1, 1,
-0.07833347, 1.687634, 1.06711, 1, 0, 0, 1, 1,
-0.07774214, 0.4534928, 1.908565, 0, 0, 0, 1, 1,
-0.07720664, 0.3896136, -0.5980816, 0, 0, 0, 1, 1,
-0.07055393, 0.6184936, -0.5899464, 0, 0, 0, 1, 1,
-0.06743103, 0.3141986, 2.008062, 0, 0, 0, 1, 1,
-0.06466573, 1.053039, 0.7185163, 0, 0, 0, 1, 1,
-0.06404071, -0.1643998, -3.832829, 0, 0, 0, 1, 1,
-0.05751042, 2.016314, -0.7698863, 0, 0, 0, 1, 1,
-0.05145552, 0.8103611, 0.1907628, 1, 1, 1, 1, 1,
-0.04650654, -0.4742127, -3.376571, 1, 1, 1, 1, 1,
-0.04643429, 0.6183562, -0.6494048, 1, 1, 1, 1, 1,
-0.04497822, 0.4858594, -0.3132634, 1, 1, 1, 1, 1,
-0.04003308, 1.625448, -1.349813, 1, 1, 1, 1, 1,
-0.03564904, 0.1810701, 0.7925084, 1, 1, 1, 1, 1,
-0.03508076, -1.407573, -1.497788, 1, 1, 1, 1, 1,
-0.03281604, 0.5778094, -0.3850181, 1, 1, 1, 1, 1,
-0.0250596, -0.01517233, -3.763909, 1, 1, 1, 1, 1,
-0.02192543, -0.1864911, -4.354821, 1, 1, 1, 1, 1,
-0.02035044, -0.8718516, -3.425436, 1, 1, 1, 1, 1,
-0.01983023, 0.1152681, -0.1054424, 1, 1, 1, 1, 1,
-0.01717258, -0.7246062, -3.060241, 1, 1, 1, 1, 1,
-0.01528982, -0.1269673, -3.576934, 1, 1, 1, 1, 1,
-0.01458531, -0.3328038, -4.201896, 1, 1, 1, 1, 1,
-0.01421697, -0.3227082, -3.582448, 0, 0, 1, 1, 1,
-0.01372505, -0.3625969, -1.134345, 1, 0, 0, 1, 1,
-0.01161873, 1.21576, 0.09060822, 1, 0, 0, 1, 1,
-0.01079138, -0.001579807, -2.149109, 1, 0, 0, 1, 1,
-0.01002065, -1.345342, -2.894835, 1, 0, 0, 1, 1,
-0.009911976, 1.189135, 0.9363163, 1, 0, 0, 1, 1,
-0.003661556, -1.4616, -2.359921, 0, 0, 0, 1, 1,
-0.002760101, 0.111376, -0.03951719, 0, 0, 0, 1, 1,
7.501969e-05, 0.2944894, 0.455641, 0, 0, 0, 1, 1,
0.003896634, 1.110475, 0.2406108, 0, 0, 0, 1, 1,
0.005345808, -0.130326, 4.609054, 0, 0, 0, 1, 1,
0.006798997, -1.980796, 6.134967, 0, 0, 0, 1, 1,
0.009215, 0.05298367, -0.04458616, 0, 0, 0, 1, 1,
0.01250557, 0.8649889, -0.1045983, 1, 1, 1, 1, 1,
0.01257285, 0.03979769, -0.840946, 1, 1, 1, 1, 1,
0.01286579, 0.9324996, 0.2260766, 1, 1, 1, 1, 1,
0.01291813, -0.6142935, 3.408189, 1, 1, 1, 1, 1,
0.01432035, -2.187082, 2.778999, 1, 1, 1, 1, 1,
0.01527993, -0.2907132, 3.924872, 1, 1, 1, 1, 1,
0.01733533, -1.329976, 2.659782, 1, 1, 1, 1, 1,
0.01983161, -0.6800964, 2.890954, 1, 1, 1, 1, 1,
0.02341293, -0.09081896, 2.033149, 1, 1, 1, 1, 1,
0.02357681, -0.9592802, 3.124168, 1, 1, 1, 1, 1,
0.02358965, -0.259031, 4.78227, 1, 1, 1, 1, 1,
0.0252507, 1.647767, -1.437178, 1, 1, 1, 1, 1,
0.02916711, 0.2477349, -0.6928145, 1, 1, 1, 1, 1,
0.02992295, 0.9033375, 0.2634895, 1, 1, 1, 1, 1,
0.03153594, -0.4520432, 3.098259, 1, 1, 1, 1, 1,
0.03154673, 0.69216, -1.035171, 0, 0, 1, 1, 1,
0.03246655, -0.4065154, 3.251699, 1, 0, 0, 1, 1,
0.03502486, -0.1216694, 2.896515, 1, 0, 0, 1, 1,
0.04255009, 1.380152, -0.2792507, 1, 0, 0, 1, 1,
0.04331601, 0.3757367, -0.7536409, 1, 0, 0, 1, 1,
0.05308114, -0.7559502, 3.947277, 1, 0, 0, 1, 1,
0.0564782, -0.2037481, 2.923978, 0, 0, 0, 1, 1,
0.06118534, -0.9029246, 3.824372, 0, 0, 0, 1, 1,
0.06296662, -1.118179, 3.596819, 0, 0, 0, 1, 1,
0.0752076, 0.2728001, 2.425725, 0, 0, 0, 1, 1,
0.08195007, -1.29078, 3.953583, 0, 0, 0, 1, 1,
0.08215848, -1.678643, 5.20156, 0, 0, 0, 1, 1,
0.08268759, 0.5970868, 0.04600614, 0, 0, 0, 1, 1,
0.08527911, 0.3428969, 0.854624, 1, 1, 1, 1, 1,
0.0910474, -1.013901, 4.375016, 1, 1, 1, 1, 1,
0.09162065, 0.3948367, 1.660889, 1, 1, 1, 1, 1,
0.09863283, -0.870966, 3.675631, 1, 1, 1, 1, 1,
0.1018611, 1.278491, 0.388639, 1, 1, 1, 1, 1,
0.1026825, 1.780938, -0.7720323, 1, 1, 1, 1, 1,
0.1056366, -0.4922767, 2.24435, 1, 1, 1, 1, 1,
0.1113118, -0.538372, 3.127191, 1, 1, 1, 1, 1,
0.1122352, 0.3137329, 1.065837, 1, 1, 1, 1, 1,
0.1135276, 1.352467, -0.3353712, 1, 1, 1, 1, 1,
0.1222446, -0.1885737, 2.961791, 1, 1, 1, 1, 1,
0.1226069, -0.3116068, 2.732371, 1, 1, 1, 1, 1,
0.1232447, -0.249297, 2.030832, 1, 1, 1, 1, 1,
0.1299579, 0.5863488, 0.5234244, 1, 1, 1, 1, 1,
0.1391333, -0.001582847, 1.753821, 1, 1, 1, 1, 1,
0.1428416, 0.774882, 0.3606504, 0, 0, 1, 1, 1,
0.1450127, 0.446703, 1.147597, 1, 0, 0, 1, 1,
0.1482158, 0.3104452, 0.2127528, 1, 0, 0, 1, 1,
0.1619974, 0.6928838, -1.199939, 1, 0, 0, 1, 1,
0.1622425, -0.462315, 3.083526, 1, 0, 0, 1, 1,
0.1635481, -2.180753, 3.88147, 1, 0, 0, 1, 1,
0.1650751, 1.2895, -0.4932492, 0, 0, 0, 1, 1,
0.1692572, 0.5180564, 1.148214, 0, 0, 0, 1, 1,
0.172583, 0.376092, -0.6574711, 0, 0, 0, 1, 1,
0.1755188, 1.010689, -0.500902, 0, 0, 0, 1, 1,
0.175582, 0.795053, 1.634169, 0, 0, 0, 1, 1,
0.1797194, 0.863715, 1.004635, 0, 0, 0, 1, 1,
0.1803387, 0.005664517, 2.908888, 0, 0, 0, 1, 1,
0.1841885, -0.5882832, 3.771758, 1, 1, 1, 1, 1,
0.1842513, -0.03049832, 1.563801, 1, 1, 1, 1, 1,
0.1888608, -0.6886874, 4.376589, 1, 1, 1, 1, 1,
0.1890421, -0.4154304, 3.698825, 1, 1, 1, 1, 1,
0.1894924, -0.08975747, 3.225908, 1, 1, 1, 1, 1,
0.1898097, 0.1570536, 0.372937, 1, 1, 1, 1, 1,
0.1912678, -0.8838762, 3.075919, 1, 1, 1, 1, 1,
0.1947893, 1.391422, -0.9938883, 1, 1, 1, 1, 1,
0.1954647, 3.21985, 0.6210918, 1, 1, 1, 1, 1,
0.1955028, -1.221058, 1.944689, 1, 1, 1, 1, 1,
0.1977643, -0.2198493, 0.4171457, 1, 1, 1, 1, 1,
0.1992571, 0.1663153, 2.722754, 1, 1, 1, 1, 1,
0.2015235, 1.740347, -0.2650268, 1, 1, 1, 1, 1,
0.2040596, 0.6374377, 0.7187951, 1, 1, 1, 1, 1,
0.2042081, -1.508708, 3.201284, 1, 1, 1, 1, 1,
0.205753, 1.109013, -0.4628209, 0, 0, 1, 1, 1,
0.2105819, 2.182417, 0.7529353, 1, 0, 0, 1, 1,
0.2121128, 1.789878, 1.077147, 1, 0, 0, 1, 1,
0.2188526, 0.2831271, -0.281252, 1, 0, 0, 1, 1,
0.2196489, 1.927201, -0.6580672, 1, 0, 0, 1, 1,
0.2211729, 0.3290039, 1.274334, 1, 0, 0, 1, 1,
0.221315, 0.6450881, 2.022718, 0, 0, 0, 1, 1,
0.2230465, -0.5196398, 2.43881, 0, 0, 0, 1, 1,
0.2284711, -0.00365459, 0.1715035, 0, 0, 0, 1, 1,
0.2292868, -0.4422281, 3.152196, 0, 0, 0, 1, 1,
0.2321897, -0.220981, 0.9714038, 0, 0, 0, 1, 1,
0.2329587, -1.314897, 4.125123, 0, 0, 0, 1, 1,
0.2392524, 0.09153418, 0.4949454, 0, 0, 0, 1, 1,
0.240041, -0.779573, 2.912206, 1, 1, 1, 1, 1,
0.2421114, -1.611482, 3.661246, 1, 1, 1, 1, 1,
0.243658, -0.5285417, 2.926661, 1, 1, 1, 1, 1,
0.2460866, 0.695093, -2.54034, 1, 1, 1, 1, 1,
0.2476104, 0.9408715, 1.726721, 1, 1, 1, 1, 1,
0.2503802, -1.020216, 4.698469, 1, 1, 1, 1, 1,
0.253981, 2.560538, 1.189057, 1, 1, 1, 1, 1,
0.2578557, 0.1484313, 0.734138, 1, 1, 1, 1, 1,
0.2578673, -0.5867777, 1.636197, 1, 1, 1, 1, 1,
0.2579581, -1.071232, 4.031985, 1, 1, 1, 1, 1,
0.2583662, -0.4492813, 2.186297, 1, 1, 1, 1, 1,
0.2591487, -0.7439637, 2.651649, 1, 1, 1, 1, 1,
0.2599169, -0.2540642, 1.121688, 1, 1, 1, 1, 1,
0.2608085, -0.1334316, 1.848257, 1, 1, 1, 1, 1,
0.2621284, 0.36837, 0.7409703, 1, 1, 1, 1, 1,
0.2624948, 1.691019, 0.9880353, 0, 0, 1, 1, 1,
0.2646998, 0.5645484, 0.7345629, 1, 0, 0, 1, 1,
0.2657675, -0.1480845, 3.014453, 1, 0, 0, 1, 1,
0.2698988, 1.104884, 0.3864361, 1, 0, 0, 1, 1,
0.2720548, -0.1168884, 2.24455, 1, 0, 0, 1, 1,
0.2752227, 0.1838934, -0.06664313, 1, 0, 0, 1, 1,
0.275734, -0.7092643, 3.709605, 0, 0, 0, 1, 1,
0.2760531, -0.7128569, 3.649961, 0, 0, 0, 1, 1,
0.276592, -0.9349949, 3.170313, 0, 0, 0, 1, 1,
0.2813711, -0.2372694, 4.368823, 0, 0, 0, 1, 1,
0.2874301, 0.6571215, 2.117052, 0, 0, 0, 1, 1,
0.2875581, -0.02517483, 0.4773111, 0, 0, 0, 1, 1,
0.291237, 0.1844598, -0.3175251, 0, 0, 0, 1, 1,
0.2926428, -0.3297934, 0.222712, 1, 1, 1, 1, 1,
0.293108, 1.250978, 0.185834, 1, 1, 1, 1, 1,
0.2961631, -0.7492734, 3.127837, 1, 1, 1, 1, 1,
0.2967553, -0.4474331, 1.711079, 1, 1, 1, 1, 1,
0.2976991, -1.013808, 3.417216, 1, 1, 1, 1, 1,
0.300679, 0.4722187, 1.929003, 1, 1, 1, 1, 1,
0.3048483, 2.899561, -0.4712127, 1, 1, 1, 1, 1,
0.3164303, -1.12028, 3.210828, 1, 1, 1, 1, 1,
0.3221024, -0.289106, 0.0569284, 1, 1, 1, 1, 1,
0.3287457, 0.637491, 1.505163, 1, 1, 1, 1, 1,
0.3315878, -0.2240514, 2.00594, 1, 1, 1, 1, 1,
0.336032, -0.4272766, 1.822387, 1, 1, 1, 1, 1,
0.3376289, 0.7642073, 0.7933019, 1, 1, 1, 1, 1,
0.3388472, -0.8534387, 4.032701, 1, 1, 1, 1, 1,
0.3393286, 0.6759821, -0.3223556, 1, 1, 1, 1, 1,
0.339725, 1.33658, 1.330957, 0, 0, 1, 1, 1,
0.3465062, 0.9346498, 0.4312515, 1, 0, 0, 1, 1,
0.3466779, -0.3746458, 2.268597, 1, 0, 0, 1, 1,
0.3524087, -0.2239203, 5.5107, 1, 0, 0, 1, 1,
0.353309, 0.747303, 0.3442029, 1, 0, 0, 1, 1,
0.3554526, 0.6542692, -0.7804233, 1, 0, 0, 1, 1,
0.3567613, -1.193878, 3.027173, 0, 0, 0, 1, 1,
0.3615956, -0.4152146, 3.301642, 0, 0, 0, 1, 1,
0.3637607, -0.7673774, 3.516807, 0, 0, 0, 1, 1,
0.3724971, -1.043132, 1.317387, 0, 0, 0, 1, 1,
0.3738473, -0.4333783, -0.6780623, 0, 0, 0, 1, 1,
0.3741775, 0.3281772, 1.924373, 0, 0, 0, 1, 1,
0.3769278, 1.919867, -0.7816962, 0, 0, 0, 1, 1,
0.3857818, 0.1808135, 2.609046, 1, 1, 1, 1, 1,
0.3886397, 0.6379431, 1.743915, 1, 1, 1, 1, 1,
0.3923003, 0.7967221, -0.475782, 1, 1, 1, 1, 1,
0.3989987, -0.6986372, 2.784247, 1, 1, 1, 1, 1,
0.3990545, 2.636331, 0.4682291, 1, 1, 1, 1, 1,
0.4009416, -0.468942, 1.170161, 1, 1, 1, 1, 1,
0.4068356, 0.008303578, 1.477329, 1, 1, 1, 1, 1,
0.4080964, -1.020538, 3.836745, 1, 1, 1, 1, 1,
0.4083188, 1.20132, 0.775925, 1, 1, 1, 1, 1,
0.4091833, 1.784242, 0.6973185, 1, 1, 1, 1, 1,
0.4100126, 0.9883789, -0.4818764, 1, 1, 1, 1, 1,
0.4162949, -0.9606333, 2.782476, 1, 1, 1, 1, 1,
0.4168256, 0.7183308, -0.8782766, 1, 1, 1, 1, 1,
0.4179969, 0.06389962, 2.144529, 1, 1, 1, 1, 1,
0.4192809, -2.061273, 3.930248, 1, 1, 1, 1, 1,
0.4198684, 0.6093659, 0.8703495, 0, 0, 1, 1, 1,
0.4200061, 2.243927, -0.2927347, 1, 0, 0, 1, 1,
0.4245864, -0.1995642, 3.562438, 1, 0, 0, 1, 1,
0.427917, 0.1930516, -0.7348045, 1, 0, 0, 1, 1,
0.4311269, 0.006254238, 0.7422615, 1, 0, 0, 1, 1,
0.4434806, 0.17247, -1.155498, 1, 0, 0, 1, 1,
0.4471061, 1.822432, -0.8081455, 0, 0, 0, 1, 1,
0.4475379, 0.1850943, 0.0284435, 0, 0, 0, 1, 1,
0.4488089, 2.152165, 0.1323558, 0, 0, 0, 1, 1,
0.4510921, -0.1074625, 1.405915, 0, 0, 0, 1, 1,
0.4524046, -0.4154527, 2.459188, 0, 0, 0, 1, 1,
0.4548606, -0.7707503, 3.069735, 0, 0, 0, 1, 1,
0.4659231, 0.5464967, 1.521723, 0, 0, 0, 1, 1,
0.4679532, 0.9419675, 2.295501, 1, 1, 1, 1, 1,
0.467985, 0.5496314, 1.535657, 1, 1, 1, 1, 1,
0.4684495, -0.1357427, 2.492411, 1, 1, 1, 1, 1,
0.4685155, 1.204921, 0.9950268, 1, 1, 1, 1, 1,
0.4721511, 1.324735, 0.876709, 1, 1, 1, 1, 1,
0.4729356, 0.2083094, 0.70728, 1, 1, 1, 1, 1,
0.4775821, -0.1873375, 2.409146, 1, 1, 1, 1, 1,
0.4788178, 0.7179183, 1.538375, 1, 1, 1, 1, 1,
0.4821861, 0.4599168, 0.04726936, 1, 1, 1, 1, 1,
0.4821887, -0.1508974, 2.26314, 1, 1, 1, 1, 1,
0.4846705, -0.3240152, 0.8894857, 1, 1, 1, 1, 1,
0.4888321, 0.4936239, 1.271417, 1, 1, 1, 1, 1,
0.4906653, 1.245953, 0.7745415, 1, 1, 1, 1, 1,
0.4916113, -1.398353, 2.94958, 1, 1, 1, 1, 1,
0.4933528, 0.1614994, 0.4965269, 1, 1, 1, 1, 1,
0.4934594, -0.6900817, 4.449245, 0, 0, 1, 1, 1,
0.5042565, 2.081894, -0.1906866, 1, 0, 0, 1, 1,
0.5051149, -0.6978987, 1.712531, 1, 0, 0, 1, 1,
0.5086143, -1.690016, 1.792589, 1, 0, 0, 1, 1,
0.5089902, 1.020526, 1.604592, 1, 0, 0, 1, 1,
0.5090483, -0.1800046, 1.007315, 1, 0, 0, 1, 1,
0.5147058, 0.2934825, 0.7816172, 0, 0, 0, 1, 1,
0.5198873, 0.2363819, 1.363616, 0, 0, 0, 1, 1,
0.5211738, -0.1272934, 1.032874, 0, 0, 0, 1, 1,
0.5219323, -1.164361, 2.821236, 0, 0, 0, 1, 1,
0.5247449, 0.801284, -0.7842057, 0, 0, 0, 1, 1,
0.5266156, 0.2647611, 1.213516, 0, 0, 0, 1, 1,
0.5285123, -0.6685342, 1.627099, 0, 0, 0, 1, 1,
0.5291808, 1.157479, 0.3548565, 1, 1, 1, 1, 1,
0.5322019, -0.130032, 2.275947, 1, 1, 1, 1, 1,
0.5386564, -0.1209533, 2.19322, 1, 1, 1, 1, 1,
0.5422903, 0.8866823, 0.7582943, 1, 1, 1, 1, 1,
0.5444657, -0.7602129, 2.662011, 1, 1, 1, 1, 1,
0.5447932, -0.4882897, 3.317683, 1, 1, 1, 1, 1,
0.5485117, -0.1173296, 0.04935319, 1, 1, 1, 1, 1,
0.5506335, -1.063891, 4.379495, 1, 1, 1, 1, 1,
0.5531678, 0.1806387, 1.3964, 1, 1, 1, 1, 1,
0.564733, 1.722023, 0.3443591, 1, 1, 1, 1, 1,
0.5651508, -0.8622565, 3.56941, 1, 1, 1, 1, 1,
0.5661545, 0.6882598, -0.2944244, 1, 1, 1, 1, 1,
0.5690487, 0.2592164, 2.389003, 1, 1, 1, 1, 1,
0.5710931, -0.7077556, 3.360112, 1, 1, 1, 1, 1,
0.5859977, -2.010774, 2.048264, 1, 1, 1, 1, 1,
0.5912312, -0.3820766, 2.949987, 0, 0, 1, 1, 1,
0.5961545, 0.1193173, 1.04064, 1, 0, 0, 1, 1,
0.5977792, -1.20826, 3.390914, 1, 0, 0, 1, 1,
0.600068, -1.305141, 1.810046, 1, 0, 0, 1, 1,
0.6015235, -0.759725, 2.409455, 1, 0, 0, 1, 1,
0.6034508, -1.144914, 2.159645, 1, 0, 0, 1, 1,
0.6034943, -1.043219, 2.092137, 0, 0, 0, 1, 1,
0.6042097, -0.5690573, 4.08022, 0, 0, 0, 1, 1,
0.6042343, -1.035476, 2.653904, 0, 0, 0, 1, 1,
0.6066074, -0.4561187, 2.070417, 0, 0, 0, 1, 1,
0.608043, -1.678271, 3.409125, 0, 0, 0, 1, 1,
0.6086302, -1.178186, 2.583548, 0, 0, 0, 1, 1,
0.6092277, -0.2796589, 2.082254, 0, 0, 0, 1, 1,
0.6096131, -2.292709, 2.553153, 1, 1, 1, 1, 1,
0.6108952, -1.189343, 1.95193, 1, 1, 1, 1, 1,
0.618145, -1.41536, 2.049589, 1, 1, 1, 1, 1,
0.6188198, 0.1560947, 0.5055645, 1, 1, 1, 1, 1,
0.6206172, -0.5212471, 2.452153, 1, 1, 1, 1, 1,
0.6213381, 0.5579167, 1.569788, 1, 1, 1, 1, 1,
0.62428, 1.121526, 0.9521082, 1, 1, 1, 1, 1,
0.6304024, 0.4056928, -0.2528087, 1, 1, 1, 1, 1,
0.6321895, 1.051141, 1.186383, 1, 1, 1, 1, 1,
0.6331601, 0.9222569, 0.3094517, 1, 1, 1, 1, 1,
0.6334402, 0.06489284, 1.587493, 1, 1, 1, 1, 1,
0.6361315, -0.03327301, 1.876275, 1, 1, 1, 1, 1,
0.6366835, 0.6403071, 1.465691, 1, 1, 1, 1, 1,
0.6395888, -0.6596708, 4.086155, 1, 1, 1, 1, 1,
0.6411418, 0.06534496, -0.7680981, 1, 1, 1, 1, 1,
0.6420257, -0.4859348, 2.833143, 0, 0, 1, 1, 1,
0.6426161, -0.5861819, 3.294986, 1, 0, 0, 1, 1,
0.6445946, -2.621592, 3.157956, 1, 0, 0, 1, 1,
0.6453257, -1.665613, 1.930526, 1, 0, 0, 1, 1,
0.6530741, -0.5496044, 4.255624, 1, 0, 0, 1, 1,
0.6595456, -2.146525, 2.79624, 1, 0, 0, 1, 1,
0.6609726, -1.390183, 3.245564, 0, 0, 0, 1, 1,
0.6613997, 0.1662439, 0.02592227, 0, 0, 0, 1, 1,
0.6706042, -0.4245027, 2.195553, 0, 0, 0, 1, 1,
0.6712568, -0.5318004, 2.242156, 0, 0, 0, 1, 1,
0.6720213, 1.127655, -0.1026085, 0, 0, 0, 1, 1,
0.6758574, 0.827992, -0.6284961, 0, 0, 0, 1, 1,
0.677641, -0.8090467, 2.036051, 0, 0, 0, 1, 1,
0.6832736, -1.618186, 3.919612, 1, 1, 1, 1, 1,
0.6841919, 0.3333749, -0.6864821, 1, 1, 1, 1, 1,
0.6889018, 1.78607, 1.485636, 1, 1, 1, 1, 1,
0.701649, -0.1420716, 1.615168, 1, 1, 1, 1, 1,
0.7109201, 0.1100895, 1.375818, 1, 1, 1, 1, 1,
0.711514, 0.7467235, 1.046572, 1, 1, 1, 1, 1,
0.7150552, 2.013265, -0.9422561, 1, 1, 1, 1, 1,
0.7164944, -0.08862657, 1.467467, 1, 1, 1, 1, 1,
0.7202612, 0.2622086, 0.6740464, 1, 1, 1, 1, 1,
0.7204968, -2.511062, 1.941999, 1, 1, 1, 1, 1,
0.7205011, 0.07738609, 3.018148, 1, 1, 1, 1, 1,
0.7315856, -0.5263236, 0.7647845, 1, 1, 1, 1, 1,
0.7325547, 0.5432795, -0.0551733, 1, 1, 1, 1, 1,
0.7363521, 0.08586074, 1.667335, 1, 1, 1, 1, 1,
0.7388813, 0.4534693, 0.766602, 1, 1, 1, 1, 1,
0.7396975, -0.9865366, 3.768787, 0, 0, 1, 1, 1,
0.7404135, -1.015832, 2.272923, 1, 0, 0, 1, 1,
0.7406039, -0.7012323, 4.112487, 1, 0, 0, 1, 1,
0.7429296, 1.255149, 0.1749542, 1, 0, 0, 1, 1,
0.7441269, -0.6819519, 3.236291, 1, 0, 0, 1, 1,
0.7452322, -0.7676253, 3.550576, 1, 0, 0, 1, 1,
0.7475021, 0.3603857, 1.416745, 0, 0, 0, 1, 1,
0.7585781, 1.223472, 0.6820967, 0, 0, 0, 1, 1,
0.7618399, -0.1367781, 1.075135, 0, 0, 0, 1, 1,
0.7633296, 0.8242475, 1.417733, 0, 0, 0, 1, 1,
0.7646077, -0.7333208, 1.567372, 0, 0, 0, 1, 1,
0.768258, 1.62092, -0.9769909, 0, 0, 0, 1, 1,
0.7711644, 1.42005, -0.5150706, 0, 0, 0, 1, 1,
0.7740887, -0.4753428, 0.5768613, 1, 1, 1, 1, 1,
0.7784893, 0.9360496, 2.104681, 1, 1, 1, 1, 1,
0.778909, -0.3786468, 5.33669, 1, 1, 1, 1, 1,
0.7818196, 1.599302, -0.6684625, 1, 1, 1, 1, 1,
0.7846829, 1.875254, -0.9628808, 1, 1, 1, 1, 1,
0.7861077, -0.3472912, 2.794332, 1, 1, 1, 1, 1,
0.7940897, -0.9108932, 3.169201, 1, 1, 1, 1, 1,
0.8004064, 0.5434492, 2.885611, 1, 1, 1, 1, 1,
0.8091025, 1.402478, -1.077637, 1, 1, 1, 1, 1,
0.819509, 0.5811357, 0.1101768, 1, 1, 1, 1, 1,
0.833824, 0.331053, 2.758294, 1, 1, 1, 1, 1,
0.834446, 0.5935331, 1.251617, 1, 1, 1, 1, 1,
0.8347528, -0.3020252, 2.565182, 1, 1, 1, 1, 1,
0.8363659, 0.2705158, 2.13607, 1, 1, 1, 1, 1,
0.8396171, -0.414273, 2.036958, 1, 1, 1, 1, 1,
0.8490884, -0.05270537, 0.6901025, 0, 0, 1, 1, 1,
0.8505682, -0.4616325, 1.495465, 1, 0, 0, 1, 1,
0.8550295, -2.389721, 3.613506, 1, 0, 0, 1, 1,
0.8561767, 0.04706274, 2.706063, 1, 0, 0, 1, 1,
0.8571494, -0.8502443, 2.680579, 1, 0, 0, 1, 1,
0.8607955, 0.3698364, 1.844571, 1, 0, 0, 1, 1,
0.8707052, -0.1472238, 2.226506, 0, 0, 0, 1, 1,
0.8735234, 0.501244, 0.4743076, 0, 0, 0, 1, 1,
0.8854534, 0.7566358, 0.5386968, 0, 0, 0, 1, 1,
0.8870484, 0.1855208, 0.469426, 0, 0, 0, 1, 1,
0.8977097, -0.1373799, 1.467118, 0, 0, 0, 1, 1,
0.8977757, -0.06187799, 1.510915, 0, 0, 0, 1, 1,
0.8997712, 0.5165232, 0.9211646, 0, 0, 0, 1, 1,
0.9160948, 0.5314959, 0.2193863, 1, 1, 1, 1, 1,
0.9218979, 1.758073, -0.09155671, 1, 1, 1, 1, 1,
0.926775, 0.474125, 0.5727647, 1, 1, 1, 1, 1,
0.9343543, -1.376858, 2.912874, 1, 1, 1, 1, 1,
0.9495354, 0.357912, -0.2227042, 1, 1, 1, 1, 1,
0.9518886, 0.3861164, 0.7211904, 1, 1, 1, 1, 1,
0.952369, -1.426261, 3.938888, 1, 1, 1, 1, 1,
0.9688053, -0.1565002, -0.1275557, 1, 1, 1, 1, 1,
0.9724078, -1.015599, 2.874041, 1, 1, 1, 1, 1,
0.9769583, -0.2401332, 1.120797, 1, 1, 1, 1, 1,
0.9831135, -0.5135379, 2.614844, 1, 1, 1, 1, 1,
0.9859021, 0.4829805, -0.03948384, 1, 1, 1, 1, 1,
0.9887636, 1.848074, -1.139954, 1, 1, 1, 1, 1,
0.9899104, -0.4203475, 0.2932815, 1, 1, 1, 1, 1,
0.9934612, 1.18745, 0.02850612, 1, 1, 1, 1, 1,
1.000216, -0.2198319, 2.33165, 0, 0, 1, 1, 1,
1.003024, -1.642233, 2.77082, 1, 0, 0, 1, 1,
1.005008, -1.865263, 2.682507, 1, 0, 0, 1, 1,
1.005946, -0.3079676, 2.589998, 1, 0, 0, 1, 1,
1.008373, -0.6085452, 2.371589, 1, 0, 0, 1, 1,
1.00925, 1.065168, 1.065907, 1, 0, 0, 1, 1,
1.018217, -1.526016, 3.503353, 0, 0, 0, 1, 1,
1.021124, -0.5139959, 3.054508, 0, 0, 0, 1, 1,
1.041437, 1.375667, -0.490958, 0, 0, 0, 1, 1,
1.042541, 0.9353333, 2.224099, 0, 0, 0, 1, 1,
1.046082, -2.344162, 2.482348, 0, 0, 0, 1, 1,
1.047805, 3.503906, 0.7365788, 0, 0, 0, 1, 1,
1.048629, -0.7147576, 1.896517, 0, 0, 0, 1, 1,
1.051431, -1.601787, 1.319943, 1, 1, 1, 1, 1,
1.055467, -1.480484, 1.145642, 1, 1, 1, 1, 1,
1.061291, 0.09520554, 2.08159, 1, 1, 1, 1, 1,
1.070274, 0.3570421, 0.8131221, 1, 1, 1, 1, 1,
1.07531, 0.634538, 0.001938721, 1, 1, 1, 1, 1,
1.076452, -0.886753, 0.4064731, 1, 1, 1, 1, 1,
1.080919, -0.2716972, 2.504306, 1, 1, 1, 1, 1,
1.082272, -1.310592, 0.7082521, 1, 1, 1, 1, 1,
1.087466, 0.2118966, 0.6133725, 1, 1, 1, 1, 1,
1.088218, -0.2837096, 1.723206, 1, 1, 1, 1, 1,
1.094155, 0.5973718, 0.7415379, 1, 1, 1, 1, 1,
1.096453, -1.612841, 2.355221, 1, 1, 1, 1, 1,
1.112029, 1.221158, 1.694612, 1, 1, 1, 1, 1,
1.112245, -0.6480563, 0.6362478, 1, 1, 1, 1, 1,
1.118469, 1.204131, 2.467092, 1, 1, 1, 1, 1,
1.119191, 0.1323256, 1.518783, 0, 0, 1, 1, 1,
1.124413, -0.8152257, 4.179174, 1, 0, 0, 1, 1,
1.125127, -0.9051006, 2.121508, 1, 0, 0, 1, 1,
1.134115, 0.6760666, 0.9387529, 1, 0, 0, 1, 1,
1.147387, 0.4695091, 1.110383, 1, 0, 0, 1, 1,
1.151673, -0.1990177, 2.451733, 1, 0, 0, 1, 1,
1.152463, -0.9769444, 2.704419, 0, 0, 0, 1, 1,
1.164209, 0.6483107, 1.161904, 0, 0, 0, 1, 1,
1.167295, -0.1931852, 1.282926, 0, 0, 0, 1, 1,
1.184535, 0.3698406, 0.5894359, 0, 0, 0, 1, 1,
1.185812, 0.4163409, 1.108011, 0, 0, 0, 1, 1,
1.192277, -0.1903088, 0.6673702, 0, 0, 0, 1, 1,
1.19523, -1.016344, 2.491898, 0, 0, 0, 1, 1,
1.211421, -1.960471, 2.248755, 1, 1, 1, 1, 1,
1.212622, -0.5698441, 2.182518, 1, 1, 1, 1, 1,
1.21622, 0.6169167, -0.007876308, 1, 1, 1, 1, 1,
1.216236, -0.431081, 1.789984, 1, 1, 1, 1, 1,
1.217099, -0.5610717, 0.6800943, 1, 1, 1, 1, 1,
1.218409, 0.9920362, 1.016649, 1, 1, 1, 1, 1,
1.220437, -0.5324798, 1.134977, 1, 1, 1, 1, 1,
1.221993, 0.3446478, 2.421976, 1, 1, 1, 1, 1,
1.231864, -0.2888721, 0.9907496, 1, 1, 1, 1, 1,
1.236212, -0.1554845, 0.958576, 1, 1, 1, 1, 1,
1.236662, -0.3441328, 2.709058, 1, 1, 1, 1, 1,
1.240736, -0.7916387, 3.528232, 1, 1, 1, 1, 1,
1.240861, -1.173261, 2.612473, 1, 1, 1, 1, 1,
1.242005, 1.979366, -1.030019, 1, 1, 1, 1, 1,
1.257527, 0.7319351, 1.154454, 1, 1, 1, 1, 1,
1.258855, -2.298424, 1.609605, 0, 0, 1, 1, 1,
1.260286, 0.9017994, 1.801059, 1, 0, 0, 1, 1,
1.269505, -0.2998747, 2.003873, 1, 0, 0, 1, 1,
1.274511, -1.025638, 1.476696, 1, 0, 0, 1, 1,
1.277106, -0.2769083, 2.602488, 1, 0, 0, 1, 1,
1.277592, -1.860406, 2.007181, 1, 0, 0, 1, 1,
1.287788, -0.5456539, 1.356001, 0, 0, 0, 1, 1,
1.310756, -0.672217, 2.953172, 0, 0, 0, 1, 1,
1.313103, -0.4245238, 2.024837, 0, 0, 0, 1, 1,
1.318034, 1.077013, 1.8649, 0, 0, 0, 1, 1,
1.321364, 0.09186205, 1.995164, 0, 0, 0, 1, 1,
1.32428, 0.482343, 1.236596, 0, 0, 0, 1, 1,
1.324765, 0.3878812, 2.685541, 0, 0, 0, 1, 1,
1.328651, 0.2279686, 1.525542, 1, 1, 1, 1, 1,
1.333397, -0.1639356, 1.125609, 1, 1, 1, 1, 1,
1.338353, 1.061779, 1.095853, 1, 1, 1, 1, 1,
1.338843, -0.3015748, 2.391486, 1, 1, 1, 1, 1,
1.347375, 0.4137982, 2.027124, 1, 1, 1, 1, 1,
1.351007, -1.431544, 0.9859781, 1, 1, 1, 1, 1,
1.368687, 1.478596, -0.3544846, 1, 1, 1, 1, 1,
1.379792, -0.1879719, 1.48123, 1, 1, 1, 1, 1,
1.385138, -0.07730638, 1.587648, 1, 1, 1, 1, 1,
1.386357, -1.505041, 2.137558, 1, 1, 1, 1, 1,
1.395601, 0.9252009, 0.278509, 1, 1, 1, 1, 1,
1.400247, 0.1357594, 2.016265, 1, 1, 1, 1, 1,
1.404274, 0.6537924, 2.251426, 1, 1, 1, 1, 1,
1.4159, 0.3943936, 2.84225, 1, 1, 1, 1, 1,
1.431404, -0.8278351, 2.85461, 1, 1, 1, 1, 1,
1.444758, 0.2333273, 2.968603, 0, 0, 1, 1, 1,
1.451372, 0.05158649, 2.470271, 1, 0, 0, 1, 1,
1.452256, 0.1825211, 0.2894811, 1, 0, 0, 1, 1,
1.45922, 1.12303, 1.082766, 1, 0, 0, 1, 1,
1.459404, -0.7057911, 1.799899, 1, 0, 0, 1, 1,
1.471285, -2.136441, 3.46921, 1, 0, 0, 1, 1,
1.471825, 0.4417807, 1.286566, 0, 0, 0, 1, 1,
1.476771, 0.402861, 2.999146, 0, 0, 0, 1, 1,
1.482504, -0.410488, 1.913848, 0, 0, 0, 1, 1,
1.490085, 1.275142, 2.019478, 0, 0, 0, 1, 1,
1.507611, 0.6124571, 1.33808, 0, 0, 0, 1, 1,
1.512321, -0.3771758, 2.907077, 0, 0, 0, 1, 1,
1.512499, 0.7704493, 1.474368, 0, 0, 0, 1, 1,
1.527083, -0.00865294, 0.4594155, 1, 1, 1, 1, 1,
1.534145, -0.4497359, 2.047447, 1, 1, 1, 1, 1,
1.54806, 0.1361411, 1.206178, 1, 1, 1, 1, 1,
1.549039, 1.093737, 0.2584958, 1, 1, 1, 1, 1,
1.550572, 0.5881999, 1.914263, 1, 1, 1, 1, 1,
1.560066, -0.5981218, 2.480742, 1, 1, 1, 1, 1,
1.565378, -0.1209565, 4.571541, 1, 1, 1, 1, 1,
1.572411, -0.4403552, 1.611171, 1, 1, 1, 1, 1,
1.576173, -0.2352426, 3.340561, 1, 1, 1, 1, 1,
1.579318, -0.6574301, 2.021425, 1, 1, 1, 1, 1,
1.583434, -1.664156, 3.005313, 1, 1, 1, 1, 1,
1.590964, 0.7818861, 0.7919987, 1, 1, 1, 1, 1,
1.606514, 1.317414, -0.1145631, 1, 1, 1, 1, 1,
1.609566, -0.2815312, -0.810461, 1, 1, 1, 1, 1,
1.618629, 0.8749429, 0.2956821, 1, 1, 1, 1, 1,
1.628739, 0.2441555, 3.940529, 0, 0, 1, 1, 1,
1.634884, 1.524966, 0.6581644, 1, 0, 0, 1, 1,
1.63694, 0.7578106, 1.457017, 1, 0, 0, 1, 1,
1.638836, 0.9625409, 2.417767, 1, 0, 0, 1, 1,
1.650176, -1.041302, 2.009097, 1, 0, 0, 1, 1,
1.661822, 0.08699304, 3.137534, 1, 0, 0, 1, 1,
1.664377, 0.4822893, 0.7017967, 0, 0, 0, 1, 1,
1.66927, 0.1963747, 0.2948634, 0, 0, 0, 1, 1,
1.690318, -0.02395978, -0.8934754, 0, 0, 0, 1, 1,
1.71432, 1.988988, 0.3653122, 0, 0, 0, 1, 1,
1.746869, -1.406062, 2.446623, 0, 0, 0, 1, 1,
1.770682, -0.9484936, 1.951034, 0, 0, 0, 1, 1,
1.780437, -1.057749, 2.583898, 0, 0, 0, 1, 1,
1.834192, -1.682884, 0.5073131, 1, 1, 1, 1, 1,
1.83481, 1.31769, 1.224709, 1, 1, 1, 1, 1,
1.872806, -0.323771, 1.55522, 1, 1, 1, 1, 1,
1.891526, -0.9096181, 2.424987, 1, 1, 1, 1, 1,
1.903674, -0.3993936, 1.762884, 1, 1, 1, 1, 1,
1.914945, 0.07741455, 2.374472, 1, 1, 1, 1, 1,
1.934427, 1.124626, 0.282118, 1, 1, 1, 1, 1,
1.970195, 0.9186699, 3.178997, 1, 1, 1, 1, 1,
1.97619, 0.3981586, 1.981333, 1, 1, 1, 1, 1,
1.976481, 0.3242188, 0.02932962, 1, 1, 1, 1, 1,
1.977274, -1.387336, 0.7080284, 1, 1, 1, 1, 1,
2.005135, 0.0812643, 2.460412, 1, 1, 1, 1, 1,
2.018542, 1.961659, 0.590001, 1, 1, 1, 1, 1,
2.025024, 0.8698276, 2.504214, 1, 1, 1, 1, 1,
2.028823, 0.2593725, 0.6812816, 1, 1, 1, 1, 1,
2.030195, 0.4124843, 1.540443, 0, 0, 1, 1, 1,
2.068059, -1.167353, 2.065239, 1, 0, 0, 1, 1,
2.184664, -1.39342, 2.538888, 1, 0, 0, 1, 1,
2.241012, -1.66205, 1.592205, 1, 0, 0, 1, 1,
2.294742, 1.068728, 0.3971067, 1, 0, 0, 1, 1,
2.298065, 1.630117, 0.3126994, 1, 0, 0, 1, 1,
2.325121, -1.121036, 3.669245, 0, 0, 0, 1, 1,
2.329496, -2.052333, 3.161407, 0, 0, 0, 1, 1,
2.348847, -0.5855898, 1.85805, 0, 0, 0, 1, 1,
2.370012, 0.1226319, 2.663377, 0, 0, 0, 1, 1,
2.373622, -0.5889995, 0.5529652, 0, 0, 0, 1, 1,
2.381952, -0.7588565, -0.2602878, 0, 0, 0, 1, 1,
2.399712, -0.895112, 1.280216, 0, 0, 0, 1, 1,
2.435851, 0.1694912, 1.414165, 1, 1, 1, 1, 1,
2.464661, 0.2365941, 2.161946, 1, 1, 1, 1, 1,
2.580854, 0.7721082, 2.8286, 1, 1, 1, 1, 1,
2.601342, 1.309342, 0.3441044, 1, 1, 1, 1, 1,
2.94812, -2.681949, 1.856694, 1, 1, 1, 1, 1,
3.089092, 0.1246904, 0.7191826, 1, 1, 1, 1, 1,
3.235473, -2.207693, 2.045314, 1, 1, 1, 1, 1
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
var radius = 9.948504;
var distance = 34.9437;
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
mvMatrix.translate( 0.1787412, -0.1455762, -0.5535295 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.9437);
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
