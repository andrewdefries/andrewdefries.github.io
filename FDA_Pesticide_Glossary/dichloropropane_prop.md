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
-3.070945, 0.7663361, -0.2225099, 1, 0, 0, 1,
-2.761752, 1.650248, 0.3512397, 1, 0.007843138, 0, 1,
-2.585489, 1.039917, -0.9933149, 1, 0.01176471, 0, 1,
-2.547472, -0.2300973, -2.153119, 1, 0.01960784, 0, 1,
-2.53668, 2.950942, -1.36352, 1, 0.02352941, 0, 1,
-2.463671, -0.1329964, -1.48119, 1, 0.03137255, 0, 1,
-2.461629, -0.6857368, -1.762504, 1, 0.03529412, 0, 1,
-2.448153, -0.7731616, -1.524839, 1, 0.04313726, 0, 1,
-2.386893, 0.9470444, -0.1912334, 1, 0.04705882, 0, 1,
-2.342956, -0.9170495, -2.011541, 1, 0.05490196, 0, 1,
-2.338308, 0.1071177, -1.559268, 1, 0.05882353, 0, 1,
-2.287879, 0.3809724, -2.025316, 1, 0.06666667, 0, 1,
-2.19702, -2.396418, -3.612786, 1, 0.07058824, 0, 1,
-2.183338, 0.9780005, -0.4278027, 1, 0.07843138, 0, 1,
-2.176483, 0.5849474, 1.27735, 1, 0.08235294, 0, 1,
-2.127463, 0.1752481, -1.269637, 1, 0.09019608, 0, 1,
-2.123021, -0.6446685, -0.6936669, 1, 0.09411765, 0, 1,
-2.120941, 0.6413863, -1.587833, 1, 0.1019608, 0, 1,
-2.092629, -0.7733102, -1.923246, 1, 0.1098039, 0, 1,
-2.084484, -0.8210039, -0.1176087, 1, 0.1137255, 0, 1,
-2.083581, 0.5198303, -1.506721, 1, 0.1215686, 0, 1,
-2.070981, 0.02274708, -1.482422, 1, 0.1254902, 0, 1,
-2.055635, 0.3824714, -1.646424, 1, 0.1333333, 0, 1,
-2.020396, 1.380643, -0.9785635, 1, 0.1372549, 0, 1,
-2.001978, -1.871729, -2.621472, 1, 0.145098, 0, 1,
-1.99273, -0.9005141, -1.787434, 1, 0.1490196, 0, 1,
-1.97921, 1.472819, -0.4302356, 1, 0.1568628, 0, 1,
-1.969521, -0.3655621, -1.011382, 1, 0.1607843, 0, 1,
-1.962947, -1.242753, -1.084764, 1, 0.1686275, 0, 1,
-1.959872, -1.02136, -3.074724, 1, 0.172549, 0, 1,
-1.945169, -3.027423, -3.305349, 1, 0.1803922, 0, 1,
-1.929862, 0.8237664, -2.593618, 1, 0.1843137, 0, 1,
-1.890759, 0.6516016, -0.7073134, 1, 0.1921569, 0, 1,
-1.888384, 1.154857, -1.135028, 1, 0.1960784, 0, 1,
-1.877248, 0.1592504, -2.482209, 1, 0.2039216, 0, 1,
-1.872471, -0.2123803, 0.1131766, 1, 0.2117647, 0, 1,
-1.850827, 0.02682296, 0.560219, 1, 0.2156863, 0, 1,
-1.828545, -0.3170115, -1.198654, 1, 0.2235294, 0, 1,
-1.818416, 0.5905914, -0.6191886, 1, 0.227451, 0, 1,
-1.817752, -0.3540527, -1.333907, 1, 0.2352941, 0, 1,
-1.8172, -0.6598472, -1.365018, 1, 0.2392157, 0, 1,
-1.777486, 0.135951, 0.1635633, 1, 0.2470588, 0, 1,
-1.748432, 0.9651892, -1.000522, 1, 0.2509804, 0, 1,
-1.724468, -1.366628, -2.7411, 1, 0.2588235, 0, 1,
-1.723285, 1.8526, -0.5436614, 1, 0.2627451, 0, 1,
-1.70023, 0.7794003, -1.298679, 1, 0.2705882, 0, 1,
-1.695767, -0.7462405, -1.718694, 1, 0.2745098, 0, 1,
-1.680512, 0.4586211, -0.5528044, 1, 0.282353, 0, 1,
-1.673337, 0.9634799, 0.9194078, 1, 0.2862745, 0, 1,
-1.672631, 0.05648509, -1.150365, 1, 0.2941177, 0, 1,
-1.667554, 0.03509552, -0.219463, 1, 0.3019608, 0, 1,
-1.641405, -0.6864864, -1.712859, 1, 0.3058824, 0, 1,
-1.631213, 0.7960803, -0.07232185, 1, 0.3137255, 0, 1,
-1.629074, -0.04475733, -0.2512236, 1, 0.3176471, 0, 1,
-1.618693, 0.3820116, -2.417358, 1, 0.3254902, 0, 1,
-1.615, -0.03077825, -1.814314, 1, 0.3294118, 0, 1,
-1.613259, 0.1287509, -0.346256, 1, 0.3372549, 0, 1,
-1.612663, -0.6803265, -1.549486, 1, 0.3411765, 0, 1,
-1.607542, 0.5830095, -0.1671746, 1, 0.3490196, 0, 1,
-1.607028, 1.035634, 0.8986067, 1, 0.3529412, 0, 1,
-1.576151, 0.9963362, 0.5428488, 1, 0.3607843, 0, 1,
-1.573687, -1.469356, -3.948389, 1, 0.3647059, 0, 1,
-1.559751, -1.176395, -1.651932, 1, 0.372549, 0, 1,
-1.551061, -0.7370023, -0.6949997, 1, 0.3764706, 0, 1,
-1.542896, -1.025518, -0.5648639, 1, 0.3843137, 0, 1,
-1.531375, 1.195878, -0.500105, 1, 0.3882353, 0, 1,
-1.520768, -0.5239224, -2.258971, 1, 0.3960784, 0, 1,
-1.520102, 0.0721923, -1.079167, 1, 0.4039216, 0, 1,
-1.505626, 0.2620687, 0.4740702, 1, 0.4078431, 0, 1,
-1.501578, 0.7117485, 0.09105328, 1, 0.4156863, 0, 1,
-1.50148, -1.042797, -1.284507, 1, 0.4196078, 0, 1,
-1.491332, -1.368237, -3.236487, 1, 0.427451, 0, 1,
-1.490559, 0.2419752, -2.678771, 1, 0.4313726, 0, 1,
-1.473027, 0.5022748, 0.04144053, 1, 0.4392157, 0, 1,
-1.470002, 0.1299444, -0.3090322, 1, 0.4431373, 0, 1,
-1.465984, -0.4004909, -2.100516, 1, 0.4509804, 0, 1,
-1.446058, -0.9198588, -3.04808, 1, 0.454902, 0, 1,
-1.439747, -1.276743, -1.405072, 1, 0.4627451, 0, 1,
-1.437897, -0.8409752, -1.46526, 1, 0.4666667, 0, 1,
-1.431923, 1.035821, -1.243693, 1, 0.4745098, 0, 1,
-1.422687, -1.251248, -2.695118, 1, 0.4784314, 0, 1,
-1.406065, -0.03470943, -0.1969993, 1, 0.4862745, 0, 1,
-1.404883, -0.3597506, -2.460426, 1, 0.4901961, 0, 1,
-1.39872, 1.778035, 0.5252487, 1, 0.4980392, 0, 1,
-1.385183, -0.006736865, -1.143155, 1, 0.5058824, 0, 1,
-1.384012, -0.4387729, 0.894168, 1, 0.509804, 0, 1,
-1.380365, 0.6995562, 0.02232753, 1, 0.5176471, 0, 1,
-1.376261, 1.045966, -1.19956, 1, 0.5215687, 0, 1,
-1.370888, 0.5980881, -0.4888529, 1, 0.5294118, 0, 1,
-1.366613, 1.224445, -1.488855, 1, 0.5333334, 0, 1,
-1.361257, -0.1588051, -0.5847455, 1, 0.5411765, 0, 1,
-1.35622, -0.07671849, -2.81592, 1, 0.5450981, 0, 1,
-1.353828, 0.6732884, -0.04708605, 1, 0.5529412, 0, 1,
-1.349632, -1.741007, -1.697333, 1, 0.5568628, 0, 1,
-1.346569, -0.1321139, -2.89627, 1, 0.5647059, 0, 1,
-1.345058, 0.252326, -0.2382342, 1, 0.5686275, 0, 1,
-1.33725, -0.6006234, -2.404032, 1, 0.5764706, 0, 1,
-1.326993, -1.897331, -2.985857, 1, 0.5803922, 0, 1,
-1.309809, 0.349447, -1.559286, 1, 0.5882353, 0, 1,
-1.28776, 0.8673694, 0.03143884, 1, 0.5921569, 0, 1,
-1.281479, 0.6776848, -0.9920456, 1, 0.6, 0, 1,
-1.268282, 0.3257172, -0.5938436, 1, 0.6078432, 0, 1,
-1.265502, -0.2438543, -1.74587, 1, 0.6117647, 0, 1,
-1.263351, -0.6869743, -4.591501, 1, 0.6196079, 0, 1,
-1.255828, -0.3940277, -2.65795, 1, 0.6235294, 0, 1,
-1.240388, -0.2931595, -1.8559, 1, 0.6313726, 0, 1,
-1.237445, -0.2831768, -1.938949, 1, 0.6352941, 0, 1,
-1.236989, 0.719246, -1.910917, 1, 0.6431373, 0, 1,
-1.234585, 0.8955309, -0.6326917, 1, 0.6470588, 0, 1,
-1.234006, -1.330282, -3.259624, 1, 0.654902, 0, 1,
-1.233963, 0.9535617, -1.5937, 1, 0.6588235, 0, 1,
-1.227365, 1.390734, -0.002199133, 1, 0.6666667, 0, 1,
-1.220676, -0.002958664, -1.945198, 1, 0.6705883, 0, 1,
-1.192916, 0.3347608, -0.7345193, 1, 0.6784314, 0, 1,
-1.190506, 1.139489, -2.638972, 1, 0.682353, 0, 1,
-1.190281, 2.375998, 0.239454, 1, 0.6901961, 0, 1,
-1.175238, -1.681577, -3.657649, 1, 0.6941177, 0, 1,
-1.168917, -2.157116, -1.789902, 1, 0.7019608, 0, 1,
-1.157944, -0.3364068, -0.4461861, 1, 0.7098039, 0, 1,
-1.157395, 0.6045859, -0.1902304, 1, 0.7137255, 0, 1,
-1.154095, -0.3105348, -1.675045, 1, 0.7215686, 0, 1,
-1.145057, 0.06622252, -1.832991, 1, 0.7254902, 0, 1,
-1.137015, 1.519904, -0.8706446, 1, 0.7333333, 0, 1,
-1.133876, -0.7690713, -2.329413, 1, 0.7372549, 0, 1,
-1.130591, 0.1374825, -1.649975, 1, 0.7450981, 0, 1,
-1.128572, -0.1237299, -0.4862342, 1, 0.7490196, 0, 1,
-1.112389, 1.738975, -1.560759, 1, 0.7568628, 0, 1,
-1.112214, 0.4615718, -0.410227, 1, 0.7607843, 0, 1,
-1.106665, -0.7851182, 0.7028205, 1, 0.7686275, 0, 1,
-1.09568, -1.341943, -2.32462, 1, 0.772549, 0, 1,
-1.091043, -0.3510889, -1.562667, 1, 0.7803922, 0, 1,
-1.083498, 0.04006318, -2.207728, 1, 0.7843137, 0, 1,
-1.078062, -1.177909, -1.417841, 1, 0.7921569, 0, 1,
-1.070818, -0.8775601, -3.396482, 1, 0.7960784, 0, 1,
-1.067166, -0.9112511, -2.300315, 1, 0.8039216, 0, 1,
-1.060053, -1.563239, -1.890326, 1, 0.8117647, 0, 1,
-1.054103, -0.9500466, -3.088401, 1, 0.8156863, 0, 1,
-1.045324, -1.572572, -2.431224, 1, 0.8235294, 0, 1,
-1.03642, -0.6763041, -2.563215, 1, 0.827451, 0, 1,
-1.034928, 0.3796034, -2.586808, 1, 0.8352941, 0, 1,
-1.032176, 1.565663, -1.948185, 1, 0.8392157, 0, 1,
-1.022357, -1.642668, -2.173815, 1, 0.8470588, 0, 1,
-1.017077, -0.6729108, -3.606774, 1, 0.8509804, 0, 1,
-1.0051, -1.516693, -2.885876, 1, 0.8588235, 0, 1,
-1.003116, -1.020937, -1.225777, 1, 0.8627451, 0, 1,
-1.001846, -0.4484883, -2.658558, 1, 0.8705882, 0, 1,
-1.001622, 2.186722, -0.1773297, 1, 0.8745098, 0, 1,
-1.001159, 1.632037, -0.7213273, 1, 0.8823529, 0, 1,
-1.000052, -1.464836, -1.905745, 1, 0.8862745, 0, 1,
-0.9954676, -0.8431258, -3.148818, 1, 0.8941177, 0, 1,
-0.9901227, 2.075853, 0.1834153, 1, 0.8980392, 0, 1,
-0.9898886, -0.7438197, -3.869035, 1, 0.9058824, 0, 1,
-0.9866644, -0.8229678, -3.867936, 1, 0.9137255, 0, 1,
-0.9864239, 0.6311842, -0.8674387, 1, 0.9176471, 0, 1,
-0.9829275, -0.8901923, -3.006993, 1, 0.9254902, 0, 1,
-0.9800799, 0.2186936, -0.3188805, 1, 0.9294118, 0, 1,
-0.9733558, 1.653269, -1.5038, 1, 0.9372549, 0, 1,
-0.970453, 0.9883345, -0.2630889, 1, 0.9411765, 0, 1,
-0.9692469, 0.3084179, -2.07181, 1, 0.9490196, 0, 1,
-0.9653062, -0.3472163, -2.332558, 1, 0.9529412, 0, 1,
-0.9651815, 0.4459482, -2.840686, 1, 0.9607843, 0, 1,
-0.9611971, -2.020125, -3.613454, 1, 0.9647059, 0, 1,
-0.9596149, 1.555629, -1.765018, 1, 0.972549, 0, 1,
-0.9586661, 1.275777, 0.8671359, 1, 0.9764706, 0, 1,
-0.9581133, 0.2995495, 0.2527613, 1, 0.9843137, 0, 1,
-0.9538873, 0.3830996, -0.6444677, 1, 0.9882353, 0, 1,
-0.9524459, -0.1934225, -0.7219578, 1, 0.9960784, 0, 1,
-0.9521875, -0.4621435, -2.54729, 0.9960784, 1, 0, 1,
-0.946519, -1.187267, -2.367933, 0.9921569, 1, 0, 1,
-0.9418646, -0.2802473, -0.9800047, 0.9843137, 1, 0, 1,
-0.9392032, -1.40993, -2.218714, 0.9803922, 1, 0, 1,
-0.9333673, -1.168416, -2.921879, 0.972549, 1, 0, 1,
-0.929953, 0.5064956, -2.182323, 0.9686275, 1, 0, 1,
-0.9297046, 0.2795184, -0.4873672, 0.9607843, 1, 0, 1,
-0.9269743, 1.649451, 1.554477, 0.9568627, 1, 0, 1,
-0.9233176, 0.004525113, -3.074504, 0.9490196, 1, 0, 1,
-0.9215349, -0.8400555, -1.952153, 0.945098, 1, 0, 1,
-0.9195768, -1.06328, -1.794328, 0.9372549, 1, 0, 1,
-0.9192852, 0.3413178, -1.796751, 0.9333333, 1, 0, 1,
-0.911096, -0.7453822, -1.93338, 0.9254902, 1, 0, 1,
-0.9109722, -0.5931911, -1.29612, 0.9215686, 1, 0, 1,
-0.9068996, -0.2135736, -1.422041, 0.9137255, 1, 0, 1,
-0.9068861, -0.5394036, -1.063469, 0.9098039, 1, 0, 1,
-0.8959923, -0.5002285, -1.42385, 0.9019608, 1, 0, 1,
-0.8931351, -1.639118, -4.005719, 0.8941177, 1, 0, 1,
-0.8908588, -1.159072, -3.494194, 0.8901961, 1, 0, 1,
-0.8848666, 0.1418326, -2.096306, 0.8823529, 1, 0, 1,
-0.8846159, -0.6675111, -2.649695, 0.8784314, 1, 0, 1,
-0.8823752, 0.3493245, 0.3117351, 0.8705882, 1, 0, 1,
-0.878078, 0.5010449, -0.7424137, 0.8666667, 1, 0, 1,
-0.871322, -1.373046, -2.878238, 0.8588235, 1, 0, 1,
-0.867094, -0.3640919, -2.789804, 0.854902, 1, 0, 1,
-0.8643156, 0.6331403, -0.3978921, 0.8470588, 1, 0, 1,
-0.8617337, 0.5941639, -0.5426017, 0.8431373, 1, 0, 1,
-0.8614543, -1.044014, -3.185974, 0.8352941, 1, 0, 1,
-0.8609875, -0.502704, -2.11882, 0.8313726, 1, 0, 1,
-0.8584782, -0.1063811, -1.095152, 0.8235294, 1, 0, 1,
-0.8549618, -0.5427821, -2.262819, 0.8196079, 1, 0, 1,
-0.8549045, -0.1291993, -1.879304, 0.8117647, 1, 0, 1,
-0.850444, -0.9437975, -2.371824, 0.8078431, 1, 0, 1,
-0.8502105, 2.363787, 1.431161, 0.8, 1, 0, 1,
-0.8441892, -0.09520504, -2.535961, 0.7921569, 1, 0, 1,
-0.8434317, 0.5865145, -1.925221, 0.7882353, 1, 0, 1,
-0.8376543, -0.3003973, -1.470829, 0.7803922, 1, 0, 1,
-0.8346485, 0.03271628, -2.983132, 0.7764706, 1, 0, 1,
-0.8338341, -0.1098922, -4.059176, 0.7686275, 1, 0, 1,
-0.8330702, -0.7204253, -3.175622, 0.7647059, 1, 0, 1,
-0.8276666, -0.09970783, -0.2408278, 0.7568628, 1, 0, 1,
-0.8119388, -0.912474, -1.676188, 0.7529412, 1, 0, 1,
-0.8102055, 1.178517, -0.904058, 0.7450981, 1, 0, 1,
-0.8099378, -1.490719, -1.718672, 0.7411765, 1, 0, 1,
-0.802354, -0.5362246, -2.287557, 0.7333333, 1, 0, 1,
-0.7962959, 0.03233915, -1.382084, 0.7294118, 1, 0, 1,
-0.7919002, 0.3793517, -0.8292753, 0.7215686, 1, 0, 1,
-0.7911283, 0.6104676, -1.164602, 0.7176471, 1, 0, 1,
-0.7867383, -0.4242433, -1.482485, 0.7098039, 1, 0, 1,
-0.780068, 0.6743969, -1.529801, 0.7058824, 1, 0, 1,
-0.7769837, -0.07950947, -1.672432, 0.6980392, 1, 0, 1,
-0.774421, 1.708148, -2.422059, 0.6901961, 1, 0, 1,
-0.7736087, 2.108835, 0.7751466, 0.6862745, 1, 0, 1,
-0.7709712, 0.8790647, -0.5834169, 0.6784314, 1, 0, 1,
-0.7678625, 0.6842028, -0.2124313, 0.6745098, 1, 0, 1,
-0.7669613, -1.00603, -2.023304, 0.6666667, 1, 0, 1,
-0.7615338, 0.4631891, -0.5589929, 0.6627451, 1, 0, 1,
-0.7583961, -0.6541473, -2.055554, 0.654902, 1, 0, 1,
-0.7539941, -0.8915338, -1.630879, 0.6509804, 1, 0, 1,
-0.7537971, 1.435794, 1.835433, 0.6431373, 1, 0, 1,
-0.7490498, 0.2983982, -0.9784501, 0.6392157, 1, 0, 1,
-0.7447299, -2.016528, -3.914764, 0.6313726, 1, 0, 1,
-0.744154, -1.0436, -0.7201369, 0.627451, 1, 0, 1,
-0.7397237, -0.8211939, -1.447177, 0.6196079, 1, 0, 1,
-0.739439, 0.8716719, 0.05925289, 0.6156863, 1, 0, 1,
-0.7387707, -1.245143, -3.496275, 0.6078432, 1, 0, 1,
-0.72979, -0.5013652, -1.577511, 0.6039216, 1, 0, 1,
-0.7281764, -1.726564, -3.423863, 0.5960785, 1, 0, 1,
-0.7234617, 1.633293, 1.934869, 0.5882353, 1, 0, 1,
-0.7230018, -0.6526144, -0.4074567, 0.5843138, 1, 0, 1,
-0.7197679, 0.6271474, -2.542451, 0.5764706, 1, 0, 1,
-0.7196411, 0.02260118, -0.6634371, 0.572549, 1, 0, 1,
-0.7074247, -0.2772471, -2.889968, 0.5647059, 1, 0, 1,
-0.7055467, -0.06020384, -1.781194, 0.5607843, 1, 0, 1,
-0.7032937, 2.351004, -1.163662, 0.5529412, 1, 0, 1,
-0.7002741, 0.1880926, -1.520838, 0.5490196, 1, 0, 1,
-0.6992945, 0.05674677, -2.267002, 0.5411765, 1, 0, 1,
-0.6940408, 0.5441463, -2.319951, 0.5372549, 1, 0, 1,
-0.69126, 1.171237, 1.46077, 0.5294118, 1, 0, 1,
-0.6907374, 0.1234692, -3.703324, 0.5254902, 1, 0, 1,
-0.689587, -0.08762263, -2.227327, 0.5176471, 1, 0, 1,
-0.6893674, 1.509462, -1.386075, 0.5137255, 1, 0, 1,
-0.6893553, 0.6386161, -0.8587542, 0.5058824, 1, 0, 1,
-0.6864749, -0.364277, -1.058399, 0.5019608, 1, 0, 1,
-0.6809337, 1.017056, 1.100157, 0.4941176, 1, 0, 1,
-0.6744611, 0.08576529, -0.5833093, 0.4862745, 1, 0, 1,
-0.6731944, -0.5874775, -0.03672858, 0.4823529, 1, 0, 1,
-0.6669707, -0.06974819, -0.1438468, 0.4745098, 1, 0, 1,
-0.6664979, -0.0539123, -2.670028, 0.4705882, 1, 0, 1,
-0.6644905, -0.7738457, -3.105883, 0.4627451, 1, 0, 1,
-0.6628059, 0.8148191, -0.8111089, 0.4588235, 1, 0, 1,
-0.6608678, 0.5266291, 0.03742737, 0.4509804, 1, 0, 1,
-0.6593408, -1.035028, -4.779508, 0.4470588, 1, 0, 1,
-0.6585702, -1.219178, -2.306277, 0.4392157, 1, 0, 1,
-0.6577207, 1.205253, 0.304401, 0.4352941, 1, 0, 1,
-0.6558185, -0.9109002, -4.104723, 0.427451, 1, 0, 1,
-0.653652, 0.2871056, -1.471638, 0.4235294, 1, 0, 1,
-0.6464959, 0.07898984, -1.505806, 0.4156863, 1, 0, 1,
-0.6414952, 0.9091892, -1.110751, 0.4117647, 1, 0, 1,
-0.6404885, -0.3673151, -3.428818, 0.4039216, 1, 0, 1,
-0.6381374, -0.5528778, -4.02847, 0.3960784, 1, 0, 1,
-0.6375464, 1.053029, 1.064889, 0.3921569, 1, 0, 1,
-0.6371046, -1.600832, -1.454647, 0.3843137, 1, 0, 1,
-0.6369834, -2.267234, -3.95324, 0.3803922, 1, 0, 1,
-0.6334916, -0.3542666, -1.750146, 0.372549, 1, 0, 1,
-0.6315569, 0.8814782, -0.4126146, 0.3686275, 1, 0, 1,
-0.6301438, -1.221007, -2.266012, 0.3607843, 1, 0, 1,
-0.6275721, -0.8088012, -2.910052, 0.3568628, 1, 0, 1,
-0.6274722, -1.253744, -1.939351, 0.3490196, 1, 0, 1,
-0.6185068, 0.2017082, -1.181796, 0.345098, 1, 0, 1,
-0.6179719, 2.110795, -1.328249, 0.3372549, 1, 0, 1,
-0.6178899, -0.5817304, -1.385497, 0.3333333, 1, 0, 1,
-0.6154869, 1.561929, -2.198219, 0.3254902, 1, 0, 1,
-0.6148066, 1.612493, -2.260767, 0.3215686, 1, 0, 1,
-0.6137565, 0.6418922, -1.003471, 0.3137255, 1, 0, 1,
-0.6122152, -0.4398596, -3.438778, 0.3098039, 1, 0, 1,
-0.6114883, -0.5881556, -3.331086, 0.3019608, 1, 0, 1,
-0.6089044, -0.3216855, -1.902733, 0.2941177, 1, 0, 1,
-0.6062482, 1.544818, 1.427455, 0.2901961, 1, 0, 1,
-0.6058426, 0.1360586, -1.601547, 0.282353, 1, 0, 1,
-0.6053591, 0.8406287, -0.830146, 0.2784314, 1, 0, 1,
-0.5838156, -0.3127567, -1.518932, 0.2705882, 1, 0, 1,
-0.5816703, 0.1927898, -0.3720422, 0.2666667, 1, 0, 1,
-0.5780259, -0.8536228, -2.538798, 0.2588235, 1, 0, 1,
-0.5742328, 0.22356, -1.0739, 0.254902, 1, 0, 1,
-0.5720952, -0.3003126, -1.212797, 0.2470588, 1, 0, 1,
-0.5687252, -0.193289, -3.195195, 0.2431373, 1, 0, 1,
-0.5626211, 0.3557182, -1.688534, 0.2352941, 1, 0, 1,
-0.5621939, 1.063085, 1.253518, 0.2313726, 1, 0, 1,
-0.5616323, -0.6509632, -2.320668, 0.2235294, 1, 0, 1,
-0.5587755, 0.06760551, 0.5939938, 0.2196078, 1, 0, 1,
-0.5566946, 0.02683732, -1.572215, 0.2117647, 1, 0, 1,
-0.5551717, -0.6003736, -2.979044, 0.2078431, 1, 0, 1,
-0.5520225, 0.8334482, -1.022294, 0.2, 1, 0, 1,
-0.548948, -0.3788496, -3.445731, 0.1921569, 1, 0, 1,
-0.5489322, -1.196399, -4.880314, 0.1882353, 1, 0, 1,
-0.5475404, 0.1551183, -1.872593, 0.1803922, 1, 0, 1,
-0.5473182, -0.5626178, -2.408873, 0.1764706, 1, 0, 1,
-0.5471326, -0.07601621, -0.9944798, 0.1686275, 1, 0, 1,
-0.542151, -0.9248514, -2.970639, 0.1647059, 1, 0, 1,
-0.5420506, 0.5365705, 0.5562801, 0.1568628, 1, 0, 1,
-0.5412797, 2.178684, -2.256024, 0.1529412, 1, 0, 1,
-0.5372781, -1.339089, -4.078517, 0.145098, 1, 0, 1,
-0.5332384, -0.3464814, -1.993179, 0.1411765, 1, 0, 1,
-0.531904, 1.66905, -0.763301, 0.1333333, 1, 0, 1,
-0.5315188, 0.190193, -2.165808, 0.1294118, 1, 0, 1,
-0.529267, 0.9181017, 0.3727431, 0.1215686, 1, 0, 1,
-0.5262192, 0.2500481, -2.597461, 0.1176471, 1, 0, 1,
-0.5251098, -1.003363, -2.647712, 0.1098039, 1, 0, 1,
-0.5127371, -1.271642, -2.382176, 0.1058824, 1, 0, 1,
-0.5121409, -0.9531483, -2.689063, 0.09803922, 1, 0, 1,
-0.5112796, -0.7435188, -1.935588, 0.09019608, 1, 0, 1,
-0.5088208, -0.6969413, -3.114022, 0.08627451, 1, 0, 1,
-0.5033667, 0.9711117, 0.8237826, 0.07843138, 1, 0, 1,
-0.5031484, -0.3560419, -3.182911, 0.07450981, 1, 0, 1,
-0.4965275, 1.207658, 0.335879, 0.06666667, 1, 0, 1,
-0.4959541, -0.691658, -3.410673, 0.0627451, 1, 0, 1,
-0.4901797, 0.9552263, 0.8314556, 0.05490196, 1, 0, 1,
-0.4864872, 0.6384418, -0.7461842, 0.05098039, 1, 0, 1,
-0.4862297, -0.07075664, -2.456645, 0.04313726, 1, 0, 1,
-0.4839017, -1.183475, -4.657994, 0.03921569, 1, 0, 1,
-0.4765376, 0.1985892, -1.7151, 0.03137255, 1, 0, 1,
-0.4731134, 0.8062165, -1.703354, 0.02745098, 1, 0, 1,
-0.470627, 0.7706875, 0.02598857, 0.01960784, 1, 0, 1,
-0.4705561, 1.133842, 0.3788929, 0.01568628, 1, 0, 1,
-0.4688484, -2.486898, -1.590799, 0.007843138, 1, 0, 1,
-0.4685251, 0.5181688, -2.057316, 0.003921569, 1, 0, 1,
-0.465394, 0.5025511, 0.2402897, 0, 1, 0.003921569, 1,
-0.4650969, -0.2698535, -2.492903, 0, 1, 0.01176471, 1,
-0.462388, -0.06179377, 0.3975903, 0, 1, 0.01568628, 1,
-0.4612136, -0.7145256, -3.659023, 0, 1, 0.02352941, 1,
-0.460294, -0.06347045, -2.965549, 0, 1, 0.02745098, 1,
-0.4562772, 1.090018, 2.647012, 0, 1, 0.03529412, 1,
-0.4466305, -1.014668, -3.168611, 0, 1, 0.03921569, 1,
-0.4456721, -1.786789, -1.678424, 0, 1, 0.04705882, 1,
-0.4442328, 0.7601849, -0.6131832, 0, 1, 0.05098039, 1,
-0.4384156, 0.8548002, -0.8019214, 0, 1, 0.05882353, 1,
-0.4335301, 0.6113662, -0.9497873, 0, 1, 0.0627451, 1,
-0.4306098, 2.197922, -0.3230482, 0, 1, 0.07058824, 1,
-0.4283465, 0.1652801, -2.617592, 0, 1, 0.07450981, 1,
-0.4237778, 0.9484324, -0.8097304, 0, 1, 0.08235294, 1,
-0.4220288, 0.5792538, -1.151468, 0, 1, 0.08627451, 1,
-0.4148405, -0.5753895, -2.202877, 0, 1, 0.09411765, 1,
-0.4108296, -0.003036561, -2.757485, 0, 1, 0.1019608, 1,
-0.4097744, 1.920313, -2.400675, 0, 1, 0.1058824, 1,
-0.4038261, 0.2900435, 0.2930733, 0, 1, 0.1137255, 1,
-0.4017606, 0.3586521, -1.289941, 0, 1, 0.1176471, 1,
-0.3983216, -1.300793, -2.261374, 0, 1, 0.1254902, 1,
-0.3964737, -1.180092, -4.497554, 0, 1, 0.1294118, 1,
-0.3949981, -0.4261603, -1.710311, 0, 1, 0.1372549, 1,
-0.3933161, 0.508144, -1.075532, 0, 1, 0.1411765, 1,
-0.3898461, -0.4099542, -4.407604, 0, 1, 0.1490196, 1,
-0.3884397, -0.3784107, -2.49287, 0, 1, 0.1529412, 1,
-0.3858657, 0.8172455, -0.6972862, 0, 1, 0.1607843, 1,
-0.381552, 0.4196305, 0.5092204, 0, 1, 0.1647059, 1,
-0.3810894, 0.5124268, -1.372628, 0, 1, 0.172549, 1,
-0.3785689, 0.859022, -0.7380796, 0, 1, 0.1764706, 1,
-0.3716424, 0.5099359, -0.9869425, 0, 1, 0.1843137, 1,
-0.3710862, 1.321839, -1.897057, 0, 1, 0.1882353, 1,
-0.3702874, 0.2551113, -0.79536, 0, 1, 0.1960784, 1,
-0.3659338, -0.996758, -0.7495791, 0, 1, 0.2039216, 1,
-0.3618096, 0.2129198, -1.551415, 0, 1, 0.2078431, 1,
-0.360803, 0.4123475, -1.333181, 0, 1, 0.2156863, 1,
-0.3602935, -0.1615011, -1.456415, 0, 1, 0.2196078, 1,
-0.3541744, 1.117369, -1.686949, 0, 1, 0.227451, 1,
-0.3520428, 0.1741359, -1.414165, 0, 1, 0.2313726, 1,
-0.3475494, -2.66992, -4.214883, 0, 1, 0.2392157, 1,
-0.3387445, -0.9965537, -3.164209, 0, 1, 0.2431373, 1,
-0.3360438, -0.3631416, -1.35781, 0, 1, 0.2509804, 1,
-0.3360157, 1.286455, -0.04682031, 0, 1, 0.254902, 1,
-0.3347962, 0.8344918, -2.140248, 0, 1, 0.2627451, 1,
-0.3341435, -0.1179564, -2.109229, 0, 1, 0.2666667, 1,
-0.3273669, -1.291955, -2.486498, 0, 1, 0.2745098, 1,
-0.3265692, 0.2471049, -2.194219, 0, 1, 0.2784314, 1,
-0.3261221, 0.6510993, 0.1791788, 0, 1, 0.2862745, 1,
-0.3131565, 0.3878134, -0.4030871, 0, 1, 0.2901961, 1,
-0.3117556, -0.4516019, -3.081791, 0, 1, 0.2980392, 1,
-0.3102284, 2.647016, -0.8818994, 0, 1, 0.3058824, 1,
-0.3092608, -0.5423705, -2.500201, 0, 1, 0.3098039, 1,
-0.3019806, -1.174062, -4.266191, 0, 1, 0.3176471, 1,
-0.300415, 0.5322179, 2.407343, 0, 1, 0.3215686, 1,
-0.297696, -0.2254759, -1.829897, 0, 1, 0.3294118, 1,
-0.2972733, 0.06379124, -1.576545, 0, 1, 0.3333333, 1,
-0.2962971, 0.5623446, -0.8371515, 0, 1, 0.3411765, 1,
-0.2947571, 0.4813092, 0.9870707, 0, 1, 0.345098, 1,
-0.2934875, -2.072169, -3.411955, 0, 1, 0.3529412, 1,
-0.2915168, -0.3259549, -2.582028, 0, 1, 0.3568628, 1,
-0.2905699, 0.3484942, -0.4179984, 0, 1, 0.3647059, 1,
-0.2883319, 1.259427, 0.2239245, 0, 1, 0.3686275, 1,
-0.2882598, -0.6288024, -2.337013, 0, 1, 0.3764706, 1,
-0.287065, -1.760408, -3.913511, 0, 1, 0.3803922, 1,
-0.2815841, 0.07699777, -0.9450003, 0, 1, 0.3882353, 1,
-0.2811906, -0.2567831, -1.128997, 0, 1, 0.3921569, 1,
-0.2803307, 0.8225859, 0.9343792, 0, 1, 0.4, 1,
-0.2590463, -1.432611, -2.557847, 0, 1, 0.4078431, 1,
-0.2585813, 0.9042048, -1.431401, 0, 1, 0.4117647, 1,
-0.254991, -1.822472, -3.161055, 0, 1, 0.4196078, 1,
-0.2515202, 0.5633379, -0.891396, 0, 1, 0.4235294, 1,
-0.2489949, 0.1409072, 0.3083482, 0, 1, 0.4313726, 1,
-0.2413774, -0.5005454, -2.264265, 0, 1, 0.4352941, 1,
-0.241051, 0.6447234, -1.717091, 0, 1, 0.4431373, 1,
-0.2371354, 0.7350757, 0.1034707, 0, 1, 0.4470588, 1,
-0.2366326, 0.6066647, -1.763497, 0, 1, 0.454902, 1,
-0.2329981, -1.232489, -2.765167, 0, 1, 0.4588235, 1,
-0.2290658, 0.1363202, -2.781876, 0, 1, 0.4666667, 1,
-0.2290235, -1.695881, -2.796026, 0, 1, 0.4705882, 1,
-0.2241243, -0.02023822, -2.39492, 0, 1, 0.4784314, 1,
-0.2236407, -2.238567, -2.792522, 0, 1, 0.4823529, 1,
-0.2230595, -1.301494, -2.146628, 0, 1, 0.4901961, 1,
-0.2227895, 1.500992, 0.8352582, 0, 1, 0.4941176, 1,
-0.2149348, 0.6016132, -0.5940433, 0, 1, 0.5019608, 1,
-0.2113391, 2.390495, -1.978145, 0, 1, 0.509804, 1,
-0.2108876, 1.286856, 0.7983055, 0, 1, 0.5137255, 1,
-0.2077151, -1.008311, -2.383957, 0, 1, 0.5215687, 1,
-0.2057462, -1.096179, -3.221603, 0, 1, 0.5254902, 1,
-0.2037318, 0.7446895, 0.3630016, 0, 1, 0.5333334, 1,
-0.1976744, -0.7957889, -4.10867, 0, 1, 0.5372549, 1,
-0.1966934, 0.8328854, -0.5290179, 0, 1, 0.5450981, 1,
-0.1898748, -0.5455251, -1.549357, 0, 1, 0.5490196, 1,
-0.1877451, -0.1394553, -1.797551, 0, 1, 0.5568628, 1,
-0.1868604, -1.038064, -5.378546, 0, 1, 0.5607843, 1,
-0.1812865, 1.475732, 2.185237, 0, 1, 0.5686275, 1,
-0.1772933, 1.54257, 0.1328923, 0, 1, 0.572549, 1,
-0.1726703, 0.08174843, -1.481016, 0, 1, 0.5803922, 1,
-0.1676415, -1.116745, -1.767614, 0, 1, 0.5843138, 1,
-0.1638046, 0.4832579, -0.3611519, 0, 1, 0.5921569, 1,
-0.1627576, -0.7657151, -3.610155, 0, 1, 0.5960785, 1,
-0.1616337, -0.5635422, -0.3999869, 0, 1, 0.6039216, 1,
-0.1604403, 3.31101, 0.0289689, 0, 1, 0.6117647, 1,
-0.1592172, 0.4424627, -0.226172, 0, 1, 0.6156863, 1,
-0.1587668, 0.9243683, -0.648044, 0, 1, 0.6235294, 1,
-0.1577237, -0.3685114, -3.490965, 0, 1, 0.627451, 1,
-0.1572792, -1.794895, -3.192898, 0, 1, 0.6352941, 1,
-0.1571445, -1.39272, -4.663632, 0, 1, 0.6392157, 1,
-0.1500557, -0.7437446, -2.801035, 0, 1, 0.6470588, 1,
-0.1422407, 1.304778, 0.7582023, 0, 1, 0.6509804, 1,
-0.1410962, 0.2028588, -1.427766, 0, 1, 0.6588235, 1,
-0.1352159, -1.670287, -0.2372315, 0, 1, 0.6627451, 1,
-0.1343195, -0.1063288, -1.961212, 0, 1, 0.6705883, 1,
-0.1341793, 1.160909, 0.5890061, 0, 1, 0.6745098, 1,
-0.1336591, 0.08886383, -1.178507, 0, 1, 0.682353, 1,
-0.1326519, -2.15946, -3.312354, 0, 1, 0.6862745, 1,
-0.1319617, -1.132553, -2.662649, 0, 1, 0.6941177, 1,
-0.1318875, 0.6930241, 0.5408099, 0, 1, 0.7019608, 1,
-0.1314207, -0.08649553, -1.904224, 0, 1, 0.7058824, 1,
-0.1288196, -0.9816974, -3.311884, 0, 1, 0.7137255, 1,
-0.1257504, -0.7761208, -3.022745, 0, 1, 0.7176471, 1,
-0.1201265, -1.402019, -4.414931, 0, 1, 0.7254902, 1,
-0.1140106, 0.2438001, 1.169986, 0, 1, 0.7294118, 1,
-0.1088874, -1.453285, -0.6732225, 0, 1, 0.7372549, 1,
-0.1069371, -2.077162, -2.579221, 0, 1, 0.7411765, 1,
-0.1051247, 0.5687249, -0.09198174, 0, 1, 0.7490196, 1,
-0.1006055, -0.5467879, -3.464757, 0, 1, 0.7529412, 1,
-0.09985539, 0.3848105, 1.154285, 0, 1, 0.7607843, 1,
-0.09855162, 0.2030802, -1.634308, 0, 1, 0.7647059, 1,
-0.09743688, -0.6361189, -2.200944, 0, 1, 0.772549, 1,
-0.09584209, -0.09004878, -3.631642, 0, 1, 0.7764706, 1,
-0.08227894, -0.5463948, -4.214619, 0, 1, 0.7843137, 1,
-0.0821605, -0.001999746, -1.987994, 0, 1, 0.7882353, 1,
-0.08061555, 1.436096, -0.4253286, 0, 1, 0.7960784, 1,
-0.07964907, -0.4971238, -4.671031, 0, 1, 0.8039216, 1,
-0.07753342, 1.204383, -0.5802068, 0, 1, 0.8078431, 1,
-0.07199598, 3.230574, -0.3194547, 0, 1, 0.8156863, 1,
-0.06996877, -1.419101, -2.169241, 0, 1, 0.8196079, 1,
-0.06273688, 0.577229, -0.855305, 0, 1, 0.827451, 1,
-0.06237702, -0.1703469, -0.985259, 0, 1, 0.8313726, 1,
-0.06180808, -0.09384456, -2.250242, 0, 1, 0.8392157, 1,
-0.06084352, 0.7525036, -1.368774, 0, 1, 0.8431373, 1,
-0.05862411, -1.16222, -3.385576, 0, 1, 0.8509804, 1,
-0.05755165, -0.6980903, -3.361521, 0, 1, 0.854902, 1,
-0.05581081, 0.7467983, -0.1551027, 0, 1, 0.8627451, 1,
-0.05571745, 0.5616999, -0.4640114, 0, 1, 0.8666667, 1,
-0.05393707, 1.133377, 2.542968, 0, 1, 0.8745098, 1,
-0.0475571, 1.485041, 0.5883023, 0, 1, 0.8784314, 1,
-0.04256221, -1.379957, -1.666984, 0, 1, 0.8862745, 1,
-0.03680751, -0.5686045, -3.18647, 0, 1, 0.8901961, 1,
-0.03374886, -0.82525, -2.949439, 0, 1, 0.8980392, 1,
-0.03304739, 0.005351927, -2.003667, 0, 1, 0.9058824, 1,
-0.03265004, -0.1792749, -2.889647, 0, 1, 0.9098039, 1,
-0.02150793, -0.01407408, -0.9088107, 0, 1, 0.9176471, 1,
-0.02043087, 0.5042291, -0.9736407, 0, 1, 0.9215686, 1,
-0.02004438, -2.325663, -3.011097, 0, 1, 0.9294118, 1,
-0.01760248, -0.394325, -2.47497, 0, 1, 0.9333333, 1,
-0.01170948, 1.309552, 0.01218838, 0, 1, 0.9411765, 1,
-0.005807233, -1.578216, -1.244259, 0, 1, 0.945098, 1,
-0.005136048, 0.7797372, -0.7297747, 0, 1, 0.9529412, 1,
0.001081223, 0.6233426, -0.07933878, 0, 1, 0.9568627, 1,
0.003246393, 0.275401, -0.1043641, 0, 1, 0.9647059, 1,
0.003956171, 0.2934445, -1.226109, 0, 1, 0.9686275, 1,
0.006682827, -0.1645814, 2.343725, 0, 1, 0.9764706, 1,
0.007737596, 2.398328, 0.8514636, 0, 1, 0.9803922, 1,
0.008207177, 0.2246408, 0.08992425, 0, 1, 0.9882353, 1,
0.008328428, -0.08887278, 2.741629, 0, 1, 0.9921569, 1,
0.01108253, 0.5318809, 0.22526, 0, 1, 1, 1,
0.01388968, 1.374945, -0.1896526, 0, 0.9921569, 1, 1,
0.01560829, -0.4960023, 2.70074, 0, 0.9882353, 1, 1,
0.01722211, 1.429975, 0.2386446, 0, 0.9803922, 1, 1,
0.02182743, 1.227222, 0.6032966, 0, 0.9764706, 1, 1,
0.02831827, 0.1025581, -1.121895, 0, 0.9686275, 1, 1,
0.02988165, -0.4866872, 2.815394, 0, 0.9647059, 1, 1,
0.03206782, 0.07892917, -0.8138219, 0, 0.9568627, 1, 1,
0.03405179, 1.363561, -1.000821, 0, 0.9529412, 1, 1,
0.03418481, -0.8407878, 2.787551, 0, 0.945098, 1, 1,
0.0354247, -0.6660269, 2.767413, 0, 0.9411765, 1, 1,
0.0355547, 0.3888747, 1.334464, 0, 0.9333333, 1, 1,
0.03976396, -0.3570527, 4.082875, 0, 0.9294118, 1, 1,
0.04039974, -0.7338031, 0.702677, 0, 0.9215686, 1, 1,
0.0423989, -0.2743426, 4.457055, 0, 0.9176471, 1, 1,
0.04267633, 0.4073074, 0.9258803, 0, 0.9098039, 1, 1,
0.04365801, 0.05104806, 0.6688893, 0, 0.9058824, 1, 1,
0.04632379, -1.210796, 2.386065, 0, 0.8980392, 1, 1,
0.04651728, 0.8204607, 0.0797796, 0, 0.8901961, 1, 1,
0.04778971, -0.7472548, 2.081069, 0, 0.8862745, 1, 1,
0.0483178, -0.9332007, 3.215607, 0, 0.8784314, 1, 1,
0.05509739, 2.357078, -0.2841223, 0, 0.8745098, 1, 1,
0.05623334, -0.8142307, 2.363501, 0, 0.8666667, 1, 1,
0.06248166, 0.3979859, -1.819852, 0, 0.8627451, 1, 1,
0.07044719, 0.8361012, -0.5176857, 0, 0.854902, 1, 1,
0.0709295, 1.550469, 0.3712004, 0, 0.8509804, 1, 1,
0.07294504, -0.8600495, 3.04619, 0, 0.8431373, 1, 1,
0.07549929, -0.8455855, 3.197424, 0, 0.8392157, 1, 1,
0.08014696, -0.1892193, 2.199476, 0, 0.8313726, 1, 1,
0.08243421, -1.046603, 3.40171, 0, 0.827451, 1, 1,
0.08370808, -0.8952212, 1.304749, 0, 0.8196079, 1, 1,
0.08459939, -0.06659819, 1.284755, 0, 0.8156863, 1, 1,
0.08604158, -1.517865, 3.992424, 0, 0.8078431, 1, 1,
0.09171534, -0.8279399, 2.48791, 0, 0.8039216, 1, 1,
0.09323053, -0.3864477, 1.367218, 0, 0.7960784, 1, 1,
0.09707586, 0.7966226, -0.648164, 0, 0.7882353, 1, 1,
0.09791139, -0.8773115, 1.530555, 0, 0.7843137, 1, 1,
0.09947346, 0.3190183, -0.5386351, 0, 0.7764706, 1, 1,
0.1008372, 0.7254532, 0.4853778, 0, 0.772549, 1, 1,
0.10447, 1.469983, -1.280211, 0, 0.7647059, 1, 1,
0.1046348, 1.041045, -0.7359244, 0, 0.7607843, 1, 1,
0.1091736, 0.8615496, 0.8642864, 0, 0.7529412, 1, 1,
0.1125561, -0.7710462, 3.528628, 0, 0.7490196, 1, 1,
0.1169445, -0.3619363, 3.488342, 0, 0.7411765, 1, 1,
0.1191748, -0.7992662, 3.370323, 0, 0.7372549, 1, 1,
0.1194204, -1.069363, 1.9229, 0, 0.7294118, 1, 1,
0.1217859, -1.198033, 4.409499, 0, 0.7254902, 1, 1,
0.1242867, -0.8003046, 2.774132, 0, 0.7176471, 1, 1,
0.1328335, 0.6208189, 1.48003, 0, 0.7137255, 1, 1,
0.132912, -2.455146, 4.239851, 0, 0.7058824, 1, 1,
0.1342653, 0.2692117, 1.547187, 0, 0.6980392, 1, 1,
0.1449393, 1.118414, -0.6518006, 0, 0.6941177, 1, 1,
0.1455926, 0.09650736, 2.325839, 0, 0.6862745, 1, 1,
0.1458797, 0.7535101, -1.047535, 0, 0.682353, 1, 1,
0.1503838, -1.877791, 2.885425, 0, 0.6745098, 1, 1,
0.1505507, 1.145529, -0.6685263, 0, 0.6705883, 1, 1,
0.1506501, -0.2397751, 1.667742, 0, 0.6627451, 1, 1,
0.1529977, 0.9159543, 0.2070393, 0, 0.6588235, 1, 1,
0.1541449, 1.45072, 0.2915601, 0, 0.6509804, 1, 1,
0.1676991, 0.2683951, 0.2353751, 0, 0.6470588, 1, 1,
0.1692417, 0.6873397, -0.8337332, 0, 0.6392157, 1, 1,
0.176571, 0.6623937, -0.2135619, 0, 0.6352941, 1, 1,
0.1780612, 0.5706002, 0.2865877, 0, 0.627451, 1, 1,
0.1793429, 2.50027, -0.618838, 0, 0.6235294, 1, 1,
0.1804763, 0.08472498, 1.441346, 0, 0.6156863, 1, 1,
0.1807587, 0.3268751, 0.9635782, 0, 0.6117647, 1, 1,
0.1914843, 0.6413935, -1.173759, 0, 0.6039216, 1, 1,
0.1933299, -0.8024864, 2.713041, 0, 0.5960785, 1, 1,
0.1950289, -0.08919713, -0.04958212, 0, 0.5921569, 1, 1,
0.1994021, 1.030639, 1.34405, 0, 0.5843138, 1, 1,
0.2006771, -0.7036905, 3.522565, 0, 0.5803922, 1, 1,
0.2011169, 0.7746407, -0.2738296, 0, 0.572549, 1, 1,
0.2023567, -0.9302105, 3.005382, 0, 0.5686275, 1, 1,
0.2042469, -0.898819, 2.540206, 0, 0.5607843, 1, 1,
0.2047139, -0.3883031, 3.373563, 0, 0.5568628, 1, 1,
0.205025, 1.40494, 0.6122923, 0, 0.5490196, 1, 1,
0.2065849, -0.1301208, 2.097158, 0, 0.5450981, 1, 1,
0.207704, -0.8610407, 2.537413, 0, 0.5372549, 1, 1,
0.2112493, 0.8025478, 0.03049877, 0, 0.5333334, 1, 1,
0.2135517, -0.9309438, 2.342541, 0, 0.5254902, 1, 1,
0.2141645, -1.126156, 4.311018, 0, 0.5215687, 1, 1,
0.2151481, 0.3127194, 0.6907235, 0, 0.5137255, 1, 1,
0.2202082, 1.202991, 0.2525982, 0, 0.509804, 1, 1,
0.224594, 0.5565565, 1.055251, 0, 0.5019608, 1, 1,
0.2256174, -0.503814, 4.044918, 0, 0.4941176, 1, 1,
0.2258164, -0.3023912, 2.884768, 0, 0.4901961, 1, 1,
0.2323638, -0.2037075, 2.691025, 0, 0.4823529, 1, 1,
0.2334775, 0.757956, -0.8434777, 0, 0.4784314, 1, 1,
0.2339556, -0.4169602, 3.234028, 0, 0.4705882, 1, 1,
0.2351931, 1.452026, 0.2442842, 0, 0.4666667, 1, 1,
0.2380756, 0.7336887, -0.610388, 0, 0.4588235, 1, 1,
0.2411653, 1.453823, 0.8177462, 0, 0.454902, 1, 1,
0.2436325, 0.2491784, 1.278304, 0, 0.4470588, 1, 1,
0.2440551, 0.5669893, 1.46763, 0, 0.4431373, 1, 1,
0.2441425, 0.2961285, 1.565681, 0, 0.4352941, 1, 1,
0.2444737, -0.8453267, 1.351438, 0, 0.4313726, 1, 1,
0.2465918, -2.634847, 2.685206, 0, 0.4235294, 1, 1,
0.2501769, -0.8274082, 3.800051, 0, 0.4196078, 1, 1,
0.2536433, -1.11212, 2.002303, 0, 0.4117647, 1, 1,
0.2544207, 0.6579846, -0.1037385, 0, 0.4078431, 1, 1,
0.2547709, 0.8834168, 1.5504, 0, 0.4, 1, 1,
0.2619272, 1.489041, 0.8455601, 0, 0.3921569, 1, 1,
0.2646195, 1.873495, -2.987466, 0, 0.3882353, 1, 1,
0.2655791, -0.4714342, 3.436862, 0, 0.3803922, 1, 1,
0.2756665, -0.7602727, 2.233933, 0, 0.3764706, 1, 1,
0.2778294, -0.6493877, 2.871382, 0, 0.3686275, 1, 1,
0.2848092, -0.7599624, 4.076172, 0, 0.3647059, 1, 1,
0.2863337, 1.268615, -0.3851146, 0, 0.3568628, 1, 1,
0.2930954, -1.495249, 3.355994, 0, 0.3529412, 1, 1,
0.2932941, 0.3342595, 0.6969378, 0, 0.345098, 1, 1,
0.2938815, 0.7281872, 0.3633395, 0, 0.3411765, 1, 1,
0.2943561, 2.019544, 0.7585552, 0, 0.3333333, 1, 1,
0.2996081, 0.6654475, 2.034363, 0, 0.3294118, 1, 1,
0.2997619, 0.2517821, 0.4076537, 0, 0.3215686, 1, 1,
0.3033074, -0.09119663, 2.206207, 0, 0.3176471, 1, 1,
0.3041749, -0.5727881, 3.428936, 0, 0.3098039, 1, 1,
0.3050866, -0.2929519, 2.01636, 0, 0.3058824, 1, 1,
0.3054701, 2.420949, -0.9439676, 0, 0.2980392, 1, 1,
0.3059417, 0.7253819, 0.1482605, 0, 0.2901961, 1, 1,
0.3076637, 0.2596738, 1.775721, 0, 0.2862745, 1, 1,
0.308813, -0.4485229, 2.308176, 0, 0.2784314, 1, 1,
0.3114827, -0.3797562, 1.127706, 0, 0.2745098, 1, 1,
0.31171, -0.5743941, 4.406585, 0, 0.2666667, 1, 1,
0.3220477, 0.3268623, 0.9253582, 0, 0.2627451, 1, 1,
0.3237597, -1.23299, 3.993519, 0, 0.254902, 1, 1,
0.3243937, -0.003148081, 3.267792, 0, 0.2509804, 1, 1,
0.3284501, -0.08749527, 0.9326352, 0, 0.2431373, 1, 1,
0.3332246, -0.6887162, 2.512457, 0, 0.2392157, 1, 1,
0.3340499, 2.373758, 0.7713363, 0, 0.2313726, 1, 1,
0.3348377, 0.9874423, -0.03378173, 0, 0.227451, 1, 1,
0.336404, -0.4611771, 3.123696, 0, 0.2196078, 1, 1,
0.3395791, -0.7281948, 2.557325, 0, 0.2156863, 1, 1,
0.3396458, 0.1005508, 2.294877, 0, 0.2078431, 1, 1,
0.3396505, 0.2266866, 0.6073563, 0, 0.2039216, 1, 1,
0.3461747, 1.471808, 0.4739557, 0, 0.1960784, 1, 1,
0.3467086, 1.02855, 0.3162281, 0, 0.1882353, 1, 1,
0.3493322, -0.991843, 3.164231, 0, 0.1843137, 1, 1,
0.3518481, 0.1155905, 0.5738298, 0, 0.1764706, 1, 1,
0.3551249, -0.709916, 1.740753, 0, 0.172549, 1, 1,
0.3664205, -0.4289581, 0.9987261, 0, 0.1647059, 1, 1,
0.3687526, 0.7189015, 2.250156, 0, 0.1607843, 1, 1,
0.3733714, -2.346086, 1.078469, 0, 0.1529412, 1, 1,
0.3749333, 0.9538225, 0.3320534, 0, 0.1490196, 1, 1,
0.3804576, 1.167702, 0.4794677, 0, 0.1411765, 1, 1,
0.3807437, -1.545472, 1.288479, 0, 0.1372549, 1, 1,
0.3833412, 0.4330687, -0.7421271, 0, 0.1294118, 1, 1,
0.3858078, -0.4911244, 2.70245, 0, 0.1254902, 1, 1,
0.3902285, 0.9173666, 0.1273185, 0, 0.1176471, 1, 1,
0.3931473, -1.072837, 1.565971, 0, 0.1137255, 1, 1,
0.3993703, 0.364162, 1.116094, 0, 0.1058824, 1, 1,
0.4005404, 0.01387887, 0.4857861, 0, 0.09803922, 1, 1,
0.4011156, -0.7608695, 3.274302, 0, 0.09411765, 1, 1,
0.4012781, 0.6509737, 0.3631818, 0, 0.08627451, 1, 1,
0.4032372, -0.4324403, 2.481441, 0, 0.08235294, 1, 1,
0.4037279, -0.382454, 3.049554, 0, 0.07450981, 1, 1,
0.4074685, 0.08124242, 2.97279, 0, 0.07058824, 1, 1,
0.4083936, -2.075855, 3.913879, 0, 0.0627451, 1, 1,
0.412119, 0.2674379, 2.060392, 0, 0.05882353, 1, 1,
0.4121582, -0.2427991, 1.342117, 0, 0.05098039, 1, 1,
0.4162772, 0.1726686, 0.4585933, 0, 0.04705882, 1, 1,
0.4168488, 0.2301011, 0.7142727, 0, 0.03921569, 1, 1,
0.4169427, 0.5190652, 2.115518, 0, 0.03529412, 1, 1,
0.4282471, -1.012478, 2.306798, 0, 0.02745098, 1, 1,
0.4292153, 0.5318028, -0.1916513, 0, 0.02352941, 1, 1,
0.4332823, -0.9375584, 1.531785, 0, 0.01568628, 1, 1,
0.43329, -0.7027998, 0.7710729, 0, 0.01176471, 1, 1,
0.433512, -0.756058, 2.797065, 0, 0.003921569, 1, 1,
0.4347269, -0.8279368, 1.749968, 0.003921569, 0, 1, 1,
0.4379293, -0.9041802, 2.965537, 0.007843138, 0, 1, 1,
0.4430873, 0.156555, 0.5721488, 0.01568628, 0, 1, 1,
0.4465013, -0.2211721, 2.482098, 0.01960784, 0, 1, 1,
0.4483368, -1.503605, 1.932764, 0.02745098, 0, 1, 1,
0.4548816, -1.121648, 4.214042, 0.03137255, 0, 1, 1,
0.456741, -0.9507731, 3.268443, 0.03921569, 0, 1, 1,
0.4585409, 0.4213118, 2.049256, 0.04313726, 0, 1, 1,
0.4603063, -0.7052346, 3.244943, 0.05098039, 0, 1, 1,
0.460869, 0.2298202, 0.7705948, 0.05490196, 0, 1, 1,
0.4644362, 0.06426548, 2.671795, 0.0627451, 0, 1, 1,
0.4696673, -0.1907491, 2.762405, 0.06666667, 0, 1, 1,
0.4701228, 1.113569, 1.306069, 0.07450981, 0, 1, 1,
0.4735518, -0.2748637, 0.7915116, 0.07843138, 0, 1, 1,
0.4759758, 0.615119, 1.899761, 0.08627451, 0, 1, 1,
0.4781382, 1.56127, 0.09049421, 0.09019608, 0, 1, 1,
0.4798239, -2.322404, 4.352567, 0.09803922, 0, 1, 1,
0.4849387, 0.698844, -0.3823532, 0.1058824, 0, 1, 1,
0.4900294, 1.242754, 0.6489353, 0.1098039, 0, 1, 1,
0.4908569, -0.01923393, 1.107286, 0.1176471, 0, 1, 1,
0.4926774, -0.07399271, 2.332453, 0.1215686, 0, 1, 1,
0.4938806, 0.6530863, -1.462205, 0.1294118, 0, 1, 1,
0.4939864, -0.4382674, 1.523523, 0.1333333, 0, 1, 1,
0.4974666, -0.07884639, 1.378306, 0.1411765, 0, 1, 1,
0.497994, 1.663512, 1.029558, 0.145098, 0, 1, 1,
0.5030639, 0.1881303, 1.799055, 0.1529412, 0, 1, 1,
0.503896, -0.05188086, 1.045268, 0.1568628, 0, 1, 1,
0.5085198, -0.9080086, 3.004289, 0.1647059, 0, 1, 1,
0.5093395, -0.6873974, 0.5157708, 0.1686275, 0, 1, 1,
0.5110769, -0.8226144, 2.523017, 0.1764706, 0, 1, 1,
0.5118352, -0.7468171, 0.928025, 0.1803922, 0, 1, 1,
0.519444, -1.834778, 2.830647, 0.1882353, 0, 1, 1,
0.5196017, 0.3825773, -0.09459812, 0.1921569, 0, 1, 1,
0.5212023, 0.1987735, 0.09755292, 0.2, 0, 1, 1,
0.5224931, -0.5217279, 3.047611, 0.2078431, 0, 1, 1,
0.5255762, -1.211598, 1.590015, 0.2117647, 0, 1, 1,
0.527807, -1.187845, 5.123354, 0.2196078, 0, 1, 1,
0.5299475, -0.1238795, 1.814878, 0.2235294, 0, 1, 1,
0.5340621, 1.424719, 0.2457749, 0.2313726, 0, 1, 1,
0.5377932, 0.829572, 0.6593281, 0.2352941, 0, 1, 1,
0.5383396, 0.8371006, 0.7677793, 0.2431373, 0, 1, 1,
0.5386269, -0.3139644, 2.817566, 0.2470588, 0, 1, 1,
0.5470871, -1.113826, 2.610345, 0.254902, 0, 1, 1,
0.5489821, -0.8443553, 3.698063, 0.2588235, 0, 1, 1,
0.5588166, 0.5274116, 1.481137, 0.2666667, 0, 1, 1,
0.5597028, -0.2099625, 1.319777, 0.2705882, 0, 1, 1,
0.5610036, -1.052659, -0.8735777, 0.2784314, 0, 1, 1,
0.5611401, -0.5658248, 2.36398, 0.282353, 0, 1, 1,
0.5619801, -0.5962819, 3.894501, 0.2901961, 0, 1, 1,
0.5628574, 0.1760691, 1.573421, 0.2941177, 0, 1, 1,
0.5647715, -1.358159, 2.717648, 0.3019608, 0, 1, 1,
0.5773478, 0.5701946, -2.225057, 0.3098039, 0, 1, 1,
0.5803025, 1.25558, 0.6693522, 0.3137255, 0, 1, 1,
0.5806991, 0.2663841, 2.763253, 0.3215686, 0, 1, 1,
0.5884752, -1.066531, 4.941064, 0.3254902, 0, 1, 1,
0.5921746, -1.801333, 2.766732, 0.3333333, 0, 1, 1,
0.5942121, -1.401363, 2.382927, 0.3372549, 0, 1, 1,
0.6026993, -2.175026, 2.551458, 0.345098, 0, 1, 1,
0.602712, -0.01670389, 0.6917647, 0.3490196, 0, 1, 1,
0.6053494, -0.4683623, 2.610655, 0.3568628, 0, 1, 1,
0.6099854, -1.541257, 4.706902, 0.3607843, 0, 1, 1,
0.6122802, -1.631576, 2.585531, 0.3686275, 0, 1, 1,
0.6125007, -0.02422618, 1.817745, 0.372549, 0, 1, 1,
0.6131559, -0.5127162, 3.054453, 0.3803922, 0, 1, 1,
0.6166277, 0.2207611, 1.091911, 0.3843137, 0, 1, 1,
0.6199334, -1.533063, 2.741601, 0.3921569, 0, 1, 1,
0.6200439, 0.9774293, 1.758544, 0.3960784, 0, 1, 1,
0.6209618, -0.1455752, 3.645436, 0.4039216, 0, 1, 1,
0.6214344, -0.2865553, 0.3965889, 0.4117647, 0, 1, 1,
0.624954, 0.7966407, 2.181215, 0.4156863, 0, 1, 1,
0.6284071, -0.638204, 2.064539, 0.4235294, 0, 1, 1,
0.6290419, 0.01603511, 2.23061, 0.427451, 0, 1, 1,
0.6301008, 2.595134, 1.032412, 0.4352941, 0, 1, 1,
0.6384146, 0.03404143, -0.4235364, 0.4392157, 0, 1, 1,
0.6434493, 1.556635, -0.5634909, 0.4470588, 0, 1, 1,
0.6465165, -1.561356, 3.681426, 0.4509804, 0, 1, 1,
0.6508086, -0.5351192, 2.006188, 0.4588235, 0, 1, 1,
0.6517988, 0.8939, -0.3726797, 0.4627451, 0, 1, 1,
0.6550861, 0.2223878, 0.1223203, 0.4705882, 0, 1, 1,
0.6554672, -0.2489766, 1.93056, 0.4745098, 0, 1, 1,
0.6556244, 0.5530652, 1.391085, 0.4823529, 0, 1, 1,
0.6576181, 0.6906863, -0.1023213, 0.4862745, 0, 1, 1,
0.6584632, -0.8521438, 3.909085, 0.4941176, 0, 1, 1,
0.6607437, -1.301909, 4.022121, 0.5019608, 0, 1, 1,
0.6625705, 0.1198695, 0.6882612, 0.5058824, 0, 1, 1,
0.6625925, 1.048507, 0.7459357, 0.5137255, 0, 1, 1,
0.6633044, -0.7028008, 2.619954, 0.5176471, 0, 1, 1,
0.6655363, -0.4599009, 1.655815, 0.5254902, 0, 1, 1,
0.6655627, 0.364872, 3.088475, 0.5294118, 0, 1, 1,
0.6685485, -0.5497555, 2.42048, 0.5372549, 0, 1, 1,
0.6698657, -0.1327536, 1.188388, 0.5411765, 0, 1, 1,
0.6707679, 1.767662, -0.6645277, 0.5490196, 0, 1, 1,
0.6718678, 0.8552359, 0.3777889, 0.5529412, 0, 1, 1,
0.6719953, -0.4661759, 2.143802, 0.5607843, 0, 1, 1,
0.6726484, 1.200454, -1.543716, 0.5647059, 0, 1, 1,
0.6771477, -1.752311, 3.002067, 0.572549, 0, 1, 1,
0.6862824, -0.686714, 3.402493, 0.5764706, 0, 1, 1,
0.6873155, -0.844252, 0.6633686, 0.5843138, 0, 1, 1,
0.6898609, 1.171712, 1.198194, 0.5882353, 0, 1, 1,
0.6921648, 0.09838896, 1.09718, 0.5960785, 0, 1, 1,
0.6957687, 0.1918448, 0.5340065, 0.6039216, 0, 1, 1,
0.6999962, 0.6283529, -0.22594, 0.6078432, 0, 1, 1,
0.7040846, -1.05493, 4.089549, 0.6156863, 0, 1, 1,
0.7089217, 0.1528926, 1.333313, 0.6196079, 0, 1, 1,
0.7124611, -1.17972, 2.78716, 0.627451, 0, 1, 1,
0.715646, 0.3681757, 1.599899, 0.6313726, 0, 1, 1,
0.7157218, 2.457461, 0.3820761, 0.6392157, 0, 1, 1,
0.7192194, 2.457138, -0.03827494, 0.6431373, 0, 1, 1,
0.7210124, 0.7958565, 2.565002, 0.6509804, 0, 1, 1,
0.7280632, -0.6491618, 1.631448, 0.654902, 0, 1, 1,
0.7293255, -0.5857711, 1.98526, 0.6627451, 0, 1, 1,
0.7294249, 1.661132, 0.8922399, 0.6666667, 0, 1, 1,
0.7297716, 0.3534936, 1.605967, 0.6745098, 0, 1, 1,
0.7387494, 1.825252, -0.309275, 0.6784314, 0, 1, 1,
0.7463183, 0.2019204, 0.2222484, 0.6862745, 0, 1, 1,
0.7467775, -0.7588375, 2.293988, 0.6901961, 0, 1, 1,
0.7552768, -0.70788, 3.116074, 0.6980392, 0, 1, 1,
0.7578873, -0.7848976, 2.710768, 0.7058824, 0, 1, 1,
0.7748576, 0.04377767, 0.03562151, 0.7098039, 0, 1, 1,
0.7765902, 0.09451534, 1.652593, 0.7176471, 0, 1, 1,
0.778607, 0.5281352, 0.2617278, 0.7215686, 0, 1, 1,
0.790694, -0.1572544, 1.792125, 0.7294118, 0, 1, 1,
0.8032404, 1.971279, -0.2542276, 0.7333333, 0, 1, 1,
0.8121382, -0.08389524, 1.046649, 0.7411765, 0, 1, 1,
0.8210744, 0.8071605, 0.0938853, 0.7450981, 0, 1, 1,
0.8229092, 0.9046741, 0.8480515, 0.7529412, 0, 1, 1,
0.8246833, -0.912039, 2.260725, 0.7568628, 0, 1, 1,
0.8257508, -0.01131087, 3.372369, 0.7647059, 0, 1, 1,
0.8341626, -0.4682826, 2.792536, 0.7686275, 0, 1, 1,
0.8358743, -1.422009, 2.432501, 0.7764706, 0, 1, 1,
0.837573, -0.7633308, 2.443023, 0.7803922, 0, 1, 1,
0.8386374, -1.082196, 2.41477, 0.7882353, 0, 1, 1,
0.8413414, 0.549962, 1.435499, 0.7921569, 0, 1, 1,
0.8447272, -0.8117124, 2.390315, 0.8, 0, 1, 1,
0.8507244, -0.7038646, 2.328707, 0.8078431, 0, 1, 1,
0.8607174, -0.2722345, 2.819096, 0.8117647, 0, 1, 1,
0.8725356, 0.8754004, 1.672876, 0.8196079, 0, 1, 1,
0.8788967, 0.3541155, 0.7127637, 0.8235294, 0, 1, 1,
0.8790468, -0.685402, 1.913533, 0.8313726, 0, 1, 1,
0.881373, 0.1855004, 1.775343, 0.8352941, 0, 1, 1,
0.8917012, 1.300895, 0.7629517, 0.8431373, 0, 1, 1,
0.8992443, 0.9119995, -0.9716229, 0.8470588, 0, 1, 1,
0.9087691, 0.3702859, 2.316207, 0.854902, 0, 1, 1,
0.9111872, -0.06870048, 1.961336, 0.8588235, 0, 1, 1,
0.9211048, -0.008879073, 0.0783054, 0.8666667, 0, 1, 1,
0.9222476, -0.285173, 1.132497, 0.8705882, 0, 1, 1,
0.9238456, 2.069724, 0.5863665, 0.8784314, 0, 1, 1,
0.9247541, -1.363402, 0.09349398, 0.8823529, 0, 1, 1,
0.9309076, 0.06017201, -0.1292707, 0.8901961, 0, 1, 1,
0.9445766, -3.41468, 2.324033, 0.8941177, 0, 1, 1,
0.9510458, 0.6637315, 0.05294539, 0.9019608, 0, 1, 1,
0.9515855, 1.165635, 0.2168262, 0.9098039, 0, 1, 1,
0.9521711, 0.9396573, 1.274447, 0.9137255, 0, 1, 1,
0.9524408, 1.519901, 1.705269, 0.9215686, 0, 1, 1,
0.9538937, -0.6999076, 3.150443, 0.9254902, 0, 1, 1,
0.9576067, 0.7816285, 0.9522138, 0.9333333, 0, 1, 1,
0.9591684, 0.08175594, 2.004686, 0.9372549, 0, 1, 1,
0.9691314, 0.2681661, 2.386331, 0.945098, 0, 1, 1,
0.9701568, 1.255957, 1.260885, 0.9490196, 0, 1, 1,
0.9711743, -0.07737318, 0.1918833, 0.9568627, 0, 1, 1,
0.9744333, -0.9081962, 2.794903, 0.9607843, 0, 1, 1,
0.9750748, -0.4568177, 3.199987, 0.9686275, 0, 1, 1,
0.9792994, 0.9499738, 1.581391, 0.972549, 0, 1, 1,
0.9829016, 2.952614, 0.9234379, 0.9803922, 0, 1, 1,
0.9886252, -0.1815806, 0.3441703, 0.9843137, 0, 1, 1,
0.9930491, 0.3712915, 1.257134, 0.9921569, 0, 1, 1,
0.9965408, 1.221962, 1.716454, 0.9960784, 0, 1, 1,
1.001081, -1.041314, 4.173965, 1, 0, 0.9960784, 1,
1.013692, -0.5932677, 0.6952415, 1, 0, 0.9882353, 1,
1.022087, 1.107131, 0.8541747, 1, 0, 0.9843137, 1,
1.027773, 0.8821711, 0.8021646, 1, 0, 0.9764706, 1,
1.033057, -2.618209, 3.522294, 1, 0, 0.972549, 1,
1.036308, -0.2647464, 1.407301, 1, 0, 0.9647059, 1,
1.049608, 0.2675377, 1.599015, 1, 0, 0.9607843, 1,
1.058058, 0.2670546, 0.644153, 1, 0, 0.9529412, 1,
1.060048, -0.229672, 2.969121, 1, 0, 0.9490196, 1,
1.062886, 0.5552397, 0.5072732, 1, 0, 0.9411765, 1,
1.064791, 1.9236, -0.1469496, 1, 0, 0.9372549, 1,
1.067569, -0.5833057, 0.06466844, 1, 0, 0.9294118, 1,
1.068221, 0.4267297, 3.788627, 1, 0, 0.9254902, 1,
1.069085, 0.6226336, -0.8284796, 1, 0, 0.9176471, 1,
1.0799, 0.2980736, 1.12108, 1, 0, 0.9137255, 1,
1.080996, -0.4892208, 3.037617, 1, 0, 0.9058824, 1,
1.085401, 1.274059, 2.450576, 1, 0, 0.9019608, 1,
1.090525, 0.7411768, 1.766223, 1, 0, 0.8941177, 1,
1.092302, 0.8129142, 1.262074, 1, 0, 0.8862745, 1,
1.092781, -1.32253, 0.8573921, 1, 0, 0.8823529, 1,
1.095438, 0.7703376, -0.04238422, 1, 0, 0.8745098, 1,
1.096889, 0.6873688, 2.436911, 1, 0, 0.8705882, 1,
1.097538, -0.5090085, -0.3551356, 1, 0, 0.8627451, 1,
1.10373, -1.97693, 2.487352, 1, 0, 0.8588235, 1,
1.109228, -0.03980678, 1.443844, 1, 0, 0.8509804, 1,
1.110397, -0.4755553, 3.016748, 1, 0, 0.8470588, 1,
1.112151, -0.7422892, 1.551599, 1, 0, 0.8392157, 1,
1.121456, -0.2607618, 1.956825, 1, 0, 0.8352941, 1,
1.123128, -0.2761959, 2.215698, 1, 0, 0.827451, 1,
1.134137, 0.7760117, 2.045865, 1, 0, 0.8235294, 1,
1.139361, -2.366287, 2.741314, 1, 0, 0.8156863, 1,
1.140715, 0.2743756, 1.061296, 1, 0, 0.8117647, 1,
1.150046, 0.1327205, 1.937569, 1, 0, 0.8039216, 1,
1.150941, -1.297308, 1.799335, 1, 0, 0.7960784, 1,
1.151272, -0.2032374, 0.6522252, 1, 0, 0.7921569, 1,
1.152253, 0.03262577, 2.311954, 1, 0, 0.7843137, 1,
1.155212, -0.8340954, 1.264695, 1, 0, 0.7803922, 1,
1.158808, -0.2989605, 3.106725, 1, 0, 0.772549, 1,
1.166165, -0.3696693, 2.468374, 1, 0, 0.7686275, 1,
1.166988, 0.4901192, 1.074768, 1, 0, 0.7607843, 1,
1.170075, -0.8077941, 1.68277, 1, 0, 0.7568628, 1,
1.17702, -0.009813806, 0.4535779, 1, 0, 0.7490196, 1,
1.197073, 0.5650573, 1.037125, 1, 0, 0.7450981, 1,
1.198177, -1.377121, 0.3926792, 1, 0, 0.7372549, 1,
1.200864, -0.3709038, 1.220405, 1, 0, 0.7333333, 1,
1.204903, 0.6800825, -0.0459367, 1, 0, 0.7254902, 1,
1.206805, 0.3668649, 0.8597074, 1, 0, 0.7215686, 1,
1.211485, 0.7096876, 3.528246, 1, 0, 0.7137255, 1,
1.211821, 0.4757446, 1.4904, 1, 0, 0.7098039, 1,
1.216523, -1.345299, 1.797735, 1, 0, 0.7019608, 1,
1.217155, 0.3150263, 0.9838827, 1, 0, 0.6941177, 1,
1.232622, 0.1835446, 0.44517, 1, 0, 0.6901961, 1,
1.233312, -0.2725756, 1.724539, 1, 0, 0.682353, 1,
1.236567, 1.897815, 1.281562, 1, 0, 0.6784314, 1,
1.236786, -0.9479188, 0.5968909, 1, 0, 0.6705883, 1,
1.245634, 0.7971731, 1.659449, 1, 0, 0.6666667, 1,
1.249638, -0.4697975, 0.8157876, 1, 0, 0.6588235, 1,
1.262346, 0.1613137, 0.8469369, 1, 0, 0.654902, 1,
1.263486, -0.3240857, 1.388391, 1, 0, 0.6470588, 1,
1.266331, 0.889879, 0.458444, 1, 0, 0.6431373, 1,
1.27181, -3.27974, 3.903869, 1, 0, 0.6352941, 1,
1.273764, 0.970046, 2.590931, 1, 0, 0.6313726, 1,
1.274442, -0.02907946, 1.248391, 1, 0, 0.6235294, 1,
1.274613, 1.050119, 1.031149, 1, 0, 0.6196079, 1,
1.276945, -1.399301, 3.092565, 1, 0, 0.6117647, 1,
1.283978, -2.575651, 4.106381, 1, 0, 0.6078432, 1,
1.287809, 0.2703736, 0.7471176, 1, 0, 0.6, 1,
1.30157, -0.9679326, 3.047804, 1, 0, 0.5921569, 1,
1.314237, 0.03083743, 0.7684504, 1, 0, 0.5882353, 1,
1.324708, 0.7598414, -0.1264812, 1, 0, 0.5803922, 1,
1.326907, 1.17076, 1.408031, 1, 0, 0.5764706, 1,
1.335821, 1.524006, 1.153366, 1, 0, 0.5686275, 1,
1.335966, 1.020354, 0.1920849, 1, 0, 0.5647059, 1,
1.343351, 0.4857852, 2.234465, 1, 0, 0.5568628, 1,
1.348681, -0.01943154, 3.476822, 1, 0, 0.5529412, 1,
1.350197, -0.08700996, 2.593905, 1, 0, 0.5450981, 1,
1.360518, 0.8052351, 1.512222, 1, 0, 0.5411765, 1,
1.367312, 1.81256, 1.533478, 1, 0, 0.5333334, 1,
1.37624, 1.245001, 0.7373716, 1, 0, 0.5294118, 1,
1.378496, -2.432069, 1.855551, 1, 0, 0.5215687, 1,
1.382122, -1.105777, 0.8890937, 1, 0, 0.5176471, 1,
1.382411, 1.590654, 1.11803, 1, 0, 0.509804, 1,
1.383918, -1.981244, 3.869003, 1, 0, 0.5058824, 1,
1.397849, 0.896405, 1.101942, 1, 0, 0.4980392, 1,
1.400113, -1.648903, 2.872911, 1, 0, 0.4901961, 1,
1.404887, -0.4953147, 2.815547, 1, 0, 0.4862745, 1,
1.406724, -0.9373066, 1.911358, 1, 0, 0.4784314, 1,
1.41472, 2.011174, 1.487053, 1, 0, 0.4745098, 1,
1.421126, 1.913102, 1.490973, 1, 0, 0.4666667, 1,
1.42813, -0.8884093, 2.423893, 1, 0, 0.4627451, 1,
1.439504, 1.02525, 2.437219, 1, 0, 0.454902, 1,
1.455761, -0.8393409, 0.2303, 1, 0, 0.4509804, 1,
1.457421, 1.076424, 0.70928, 1, 0, 0.4431373, 1,
1.479895, 1.254751, 1.754153, 1, 0, 0.4392157, 1,
1.489144, -0.8181337, 1.368677, 1, 0, 0.4313726, 1,
1.506142, 0.6808818, 0.7335933, 1, 0, 0.427451, 1,
1.506323, 0.492316, 1.978555, 1, 0, 0.4196078, 1,
1.511454, -0.4425965, 0.7904208, 1, 0, 0.4156863, 1,
1.513581, -1.395071, 4.069448, 1, 0, 0.4078431, 1,
1.520518, -0.3418057, 3.840852, 1, 0, 0.4039216, 1,
1.526574, -0.421162, 0.3665713, 1, 0, 0.3960784, 1,
1.534631, -0.6803245, 2.789447, 1, 0, 0.3882353, 1,
1.536133, -0.08968183, 1.878177, 1, 0, 0.3843137, 1,
1.543984, 0.4231675, 1.406924, 1, 0, 0.3764706, 1,
1.544795, 0.957328, 1.894479, 1, 0, 0.372549, 1,
1.549641, 0.8161055, 1.975928, 1, 0, 0.3647059, 1,
1.552099, -1.151394, 1.473997, 1, 0, 0.3607843, 1,
1.552538, 0.2773187, 0.7817221, 1, 0, 0.3529412, 1,
1.560596, -1.019089, 2.728449, 1, 0, 0.3490196, 1,
1.577269, 0.5096508, 1.470894, 1, 0, 0.3411765, 1,
1.581281, -1.082022, 3.439745, 1, 0, 0.3372549, 1,
1.589056, 2.101767, 1.314461, 1, 0, 0.3294118, 1,
1.589838, -1.353169, 1.667455, 1, 0, 0.3254902, 1,
1.593237, 0.1366245, 1.446042, 1, 0, 0.3176471, 1,
1.599748, -1.65097, 1.115564, 1, 0, 0.3137255, 1,
1.601501, -0.9782727, 2.801409, 1, 0, 0.3058824, 1,
1.602625, 0.7260875, 0.2833854, 1, 0, 0.2980392, 1,
1.621003, -1.624588, 2.094624, 1, 0, 0.2941177, 1,
1.622746, 0.274029, 1.663471, 1, 0, 0.2862745, 1,
1.636992, -1.009351, 1.78797, 1, 0, 0.282353, 1,
1.638835, 0.4028374, 0.8824075, 1, 0, 0.2745098, 1,
1.659387, 2.556949, 0.7051423, 1, 0, 0.2705882, 1,
1.670341, -2.370678, 2.746334, 1, 0, 0.2627451, 1,
1.691969, -1.526419, 1.542891, 1, 0, 0.2588235, 1,
1.700328, -1.873812, 3.328536, 1, 0, 0.2509804, 1,
1.70377, 1.55293, -0.3177285, 1, 0, 0.2470588, 1,
1.732444, 1.509746, 0.8690112, 1, 0, 0.2392157, 1,
1.743081, -0.9614372, 0.564727, 1, 0, 0.2352941, 1,
1.76991, -2.192334, 3.686282, 1, 0, 0.227451, 1,
1.772357, -0.1519802, 1.454627, 1, 0, 0.2235294, 1,
1.78855, 1.727696, 1.180003, 1, 0, 0.2156863, 1,
1.79383, -1.112275, 1.293055, 1, 0, 0.2117647, 1,
1.796969, -0.8820534, 2.758286, 1, 0, 0.2039216, 1,
1.798109, 0.1263993, 0.2560014, 1, 0, 0.1960784, 1,
1.809273, 0.2646024, 1.384633, 1, 0, 0.1921569, 1,
1.825737, 0.5008606, 1.454793, 1, 0, 0.1843137, 1,
1.829055, -2.004128, 1.680667, 1, 0, 0.1803922, 1,
1.830772, -0.4908195, 1.518388, 1, 0, 0.172549, 1,
1.840459, -0.7507837, 3.135989, 1, 0, 0.1686275, 1,
1.845629, -1.050658, 2.055706, 1, 0, 0.1607843, 1,
1.850096, 1.126263, 1.652441, 1, 0, 0.1568628, 1,
1.863521, 1.633166, 1.542341, 1, 0, 0.1490196, 1,
1.920534, -0.8545895, 0.01915228, 1, 0, 0.145098, 1,
1.94167, -0.7167028, 1.642736, 1, 0, 0.1372549, 1,
1.955868, -0.06985575, 2.035788, 1, 0, 0.1333333, 1,
1.976366, 0.07235843, 2.300755, 1, 0, 0.1254902, 1,
1.989962, -0.8727955, 1.707848, 1, 0, 0.1215686, 1,
1.993973, -0.752336, 1.404617, 1, 0, 0.1137255, 1,
2.049964, 0.04968463, 2.441835, 1, 0, 0.1098039, 1,
2.062369, 0.8593658, 1.677152, 1, 0, 0.1019608, 1,
2.11457, 1.460939, -1.179377, 1, 0, 0.09411765, 1,
2.12073, 1.388391, 2.143915, 1, 0, 0.09019608, 1,
2.147077, -0.4028529, 1.029108, 1, 0, 0.08235294, 1,
2.188739, -1.395707, 1.185824, 1, 0, 0.07843138, 1,
2.229759, 0.2771314, 1.888724, 1, 0, 0.07058824, 1,
2.262411, 1.714307, 1.738112, 1, 0, 0.06666667, 1,
2.309473, 0.8493587, 1.193496, 1, 0, 0.05882353, 1,
2.31214, -0.2682923, 0.3770843, 1, 0, 0.05490196, 1,
2.337137, -0.3893994, 2.943714, 1, 0, 0.04705882, 1,
2.365512, -0.7042042, 1.222777, 1, 0, 0.04313726, 1,
2.388704, -0.4023156, 2.546604, 1, 0, 0.03529412, 1,
2.491948, 1.444403, 2.270218, 1, 0, 0.03137255, 1,
2.541895, -0.5751643, 1.692508, 1, 0, 0.02352941, 1,
2.675055, -0.0076986, 2.758882, 1, 0, 0.01960784, 1,
2.745286, 0.849512, -0.4982937, 1, 0, 0.01176471, 1,
3.038356, 0.9749548, 2.047945, 1, 0, 0.007843138, 1
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
-0.01629472, -4.554685, -7.158618, 0, -0.5, 0.5, 0.5,
-0.01629472, -4.554685, -7.158618, 1, -0.5, 0.5, 0.5,
-0.01629472, -4.554685, -7.158618, 1, 1.5, 0.5, 0.5,
-0.01629472, -4.554685, -7.158618, 0, 1.5, 0.5, 0.5
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
-4.106472, -0.05183506, -7.158618, 0, -0.5, 0.5, 0.5,
-4.106472, -0.05183506, -7.158618, 1, -0.5, 0.5, 0.5,
-4.106472, -0.05183506, -7.158618, 1, 1.5, 0.5, 0.5,
-4.106472, -0.05183506, -7.158618, 0, 1.5, 0.5, 0.5
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
-4.106472, -4.554685, -0.1275961, 0, -0.5, 0.5, 0.5,
-4.106472, -4.554685, -0.1275961, 1, -0.5, 0.5, 0.5,
-4.106472, -4.554685, -0.1275961, 1, 1.5, 0.5, 0.5,
-4.106472, -4.554685, -0.1275961, 0, 1.5, 0.5, 0.5
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
-3, -3.515566, -5.536075,
3, -3.515566, -5.536075,
-3, -3.515566, -5.536075,
-3, -3.688752, -5.806499,
-2, -3.515566, -5.536075,
-2, -3.688752, -5.806499,
-1, -3.515566, -5.536075,
-1, -3.688752, -5.806499,
0, -3.515566, -5.536075,
0, -3.688752, -5.806499,
1, -3.515566, -5.536075,
1, -3.688752, -5.806499,
2, -3.515566, -5.536075,
2, -3.688752, -5.806499,
3, -3.515566, -5.536075,
3, -3.688752, -5.806499
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
-3, -4.035125, -6.347346, 0, -0.5, 0.5, 0.5,
-3, -4.035125, -6.347346, 1, -0.5, 0.5, 0.5,
-3, -4.035125, -6.347346, 1, 1.5, 0.5, 0.5,
-3, -4.035125, -6.347346, 0, 1.5, 0.5, 0.5,
-2, -4.035125, -6.347346, 0, -0.5, 0.5, 0.5,
-2, -4.035125, -6.347346, 1, -0.5, 0.5, 0.5,
-2, -4.035125, -6.347346, 1, 1.5, 0.5, 0.5,
-2, -4.035125, -6.347346, 0, 1.5, 0.5, 0.5,
-1, -4.035125, -6.347346, 0, -0.5, 0.5, 0.5,
-1, -4.035125, -6.347346, 1, -0.5, 0.5, 0.5,
-1, -4.035125, -6.347346, 1, 1.5, 0.5, 0.5,
-1, -4.035125, -6.347346, 0, 1.5, 0.5, 0.5,
0, -4.035125, -6.347346, 0, -0.5, 0.5, 0.5,
0, -4.035125, -6.347346, 1, -0.5, 0.5, 0.5,
0, -4.035125, -6.347346, 1, 1.5, 0.5, 0.5,
0, -4.035125, -6.347346, 0, 1.5, 0.5, 0.5,
1, -4.035125, -6.347346, 0, -0.5, 0.5, 0.5,
1, -4.035125, -6.347346, 1, -0.5, 0.5, 0.5,
1, -4.035125, -6.347346, 1, 1.5, 0.5, 0.5,
1, -4.035125, -6.347346, 0, 1.5, 0.5, 0.5,
2, -4.035125, -6.347346, 0, -0.5, 0.5, 0.5,
2, -4.035125, -6.347346, 1, -0.5, 0.5, 0.5,
2, -4.035125, -6.347346, 1, 1.5, 0.5, 0.5,
2, -4.035125, -6.347346, 0, 1.5, 0.5, 0.5,
3, -4.035125, -6.347346, 0, -0.5, 0.5, 0.5,
3, -4.035125, -6.347346, 1, -0.5, 0.5, 0.5,
3, -4.035125, -6.347346, 1, 1.5, 0.5, 0.5,
3, -4.035125, -6.347346, 0, 1.5, 0.5, 0.5
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
-3.162585, -3, -5.536075,
-3.162585, 3, -5.536075,
-3.162585, -3, -5.536075,
-3.319899, -3, -5.806499,
-3.162585, -2, -5.536075,
-3.319899, -2, -5.806499,
-3.162585, -1, -5.536075,
-3.319899, -1, -5.806499,
-3.162585, 0, -5.536075,
-3.319899, 0, -5.806499,
-3.162585, 1, -5.536075,
-3.319899, 1, -5.806499,
-3.162585, 2, -5.536075,
-3.319899, 2, -5.806499,
-3.162585, 3, -5.536075,
-3.319899, 3, -5.806499
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
-3.634528, -3, -6.347346, 0, -0.5, 0.5, 0.5,
-3.634528, -3, -6.347346, 1, -0.5, 0.5, 0.5,
-3.634528, -3, -6.347346, 1, 1.5, 0.5, 0.5,
-3.634528, -3, -6.347346, 0, 1.5, 0.5, 0.5,
-3.634528, -2, -6.347346, 0, -0.5, 0.5, 0.5,
-3.634528, -2, -6.347346, 1, -0.5, 0.5, 0.5,
-3.634528, -2, -6.347346, 1, 1.5, 0.5, 0.5,
-3.634528, -2, -6.347346, 0, 1.5, 0.5, 0.5,
-3.634528, -1, -6.347346, 0, -0.5, 0.5, 0.5,
-3.634528, -1, -6.347346, 1, -0.5, 0.5, 0.5,
-3.634528, -1, -6.347346, 1, 1.5, 0.5, 0.5,
-3.634528, -1, -6.347346, 0, 1.5, 0.5, 0.5,
-3.634528, 0, -6.347346, 0, -0.5, 0.5, 0.5,
-3.634528, 0, -6.347346, 1, -0.5, 0.5, 0.5,
-3.634528, 0, -6.347346, 1, 1.5, 0.5, 0.5,
-3.634528, 0, -6.347346, 0, 1.5, 0.5, 0.5,
-3.634528, 1, -6.347346, 0, -0.5, 0.5, 0.5,
-3.634528, 1, -6.347346, 1, -0.5, 0.5, 0.5,
-3.634528, 1, -6.347346, 1, 1.5, 0.5, 0.5,
-3.634528, 1, -6.347346, 0, 1.5, 0.5, 0.5,
-3.634528, 2, -6.347346, 0, -0.5, 0.5, 0.5,
-3.634528, 2, -6.347346, 1, -0.5, 0.5, 0.5,
-3.634528, 2, -6.347346, 1, 1.5, 0.5, 0.5,
-3.634528, 2, -6.347346, 0, 1.5, 0.5, 0.5,
-3.634528, 3, -6.347346, 0, -0.5, 0.5, 0.5,
-3.634528, 3, -6.347346, 1, -0.5, 0.5, 0.5,
-3.634528, 3, -6.347346, 1, 1.5, 0.5, 0.5,
-3.634528, 3, -6.347346, 0, 1.5, 0.5, 0.5
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
-3.162585, -3.515566, -4,
-3.162585, -3.515566, 4,
-3.162585, -3.515566, -4,
-3.319899, -3.688752, -4,
-3.162585, -3.515566, -2,
-3.319899, -3.688752, -2,
-3.162585, -3.515566, 0,
-3.319899, -3.688752, 0,
-3.162585, -3.515566, 2,
-3.319899, -3.688752, 2,
-3.162585, -3.515566, 4,
-3.319899, -3.688752, 4
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
-3.634528, -4.035125, -4, 0, -0.5, 0.5, 0.5,
-3.634528, -4.035125, -4, 1, -0.5, 0.5, 0.5,
-3.634528, -4.035125, -4, 1, 1.5, 0.5, 0.5,
-3.634528, -4.035125, -4, 0, 1.5, 0.5, 0.5,
-3.634528, -4.035125, -2, 0, -0.5, 0.5, 0.5,
-3.634528, -4.035125, -2, 1, -0.5, 0.5, 0.5,
-3.634528, -4.035125, -2, 1, 1.5, 0.5, 0.5,
-3.634528, -4.035125, -2, 0, 1.5, 0.5, 0.5,
-3.634528, -4.035125, 0, 0, -0.5, 0.5, 0.5,
-3.634528, -4.035125, 0, 1, -0.5, 0.5, 0.5,
-3.634528, -4.035125, 0, 1, 1.5, 0.5, 0.5,
-3.634528, -4.035125, 0, 0, 1.5, 0.5, 0.5,
-3.634528, -4.035125, 2, 0, -0.5, 0.5, 0.5,
-3.634528, -4.035125, 2, 1, -0.5, 0.5, 0.5,
-3.634528, -4.035125, 2, 1, 1.5, 0.5, 0.5,
-3.634528, -4.035125, 2, 0, 1.5, 0.5, 0.5,
-3.634528, -4.035125, 4, 0, -0.5, 0.5, 0.5,
-3.634528, -4.035125, 4, 1, -0.5, 0.5, 0.5,
-3.634528, -4.035125, 4, 1, 1.5, 0.5, 0.5,
-3.634528, -4.035125, 4, 0, 1.5, 0.5, 0.5
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
-3.162585, -3.515566, -5.536075,
-3.162585, 3.411896, -5.536075,
-3.162585, -3.515566, 5.280882,
-3.162585, 3.411896, 5.280882,
-3.162585, -3.515566, -5.536075,
-3.162585, -3.515566, 5.280882,
-3.162585, 3.411896, -5.536075,
-3.162585, 3.411896, 5.280882,
-3.162585, -3.515566, -5.536075,
3.129995, -3.515566, -5.536075,
-3.162585, -3.515566, 5.280882,
3.129995, -3.515566, 5.280882,
-3.162585, 3.411896, -5.536075,
3.129995, 3.411896, -5.536075,
-3.162585, 3.411896, 5.280882,
3.129995, 3.411896, 5.280882,
3.129995, -3.515566, -5.536075,
3.129995, 3.411896, -5.536075,
3.129995, -3.515566, 5.280882,
3.129995, 3.411896, 5.280882,
3.129995, -3.515566, -5.536075,
3.129995, -3.515566, 5.280882,
3.129995, 3.411896, -5.536075,
3.129995, 3.411896, 5.280882
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
var radius = 7.637842;
var distance = 33.98162;
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
mvMatrix.translate( 0.01629472, 0.05183506, 0.1275961 );
mvMatrix.scale( 1.312369, 1.192094, 0.7634481 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.98162);
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
dichloropropane_prop<-read.table("dichloropropane_prop.xyz")
```

```
## Error in read.table("dichloropropane_prop.xyz"): no lines available in input
```

```r
x<-dichloropropane_prop$V2
```

```
## Error in eval(expr, envir, enclos): object 'dichloropropane_prop' not found
```

```r
y<-dichloropropane_prop$V3
```

```
## Error in eval(expr, envir, enclos): object 'dichloropropane_prop' not found
```

```r
z<-dichloropropane_prop$V4
```

```
## Error in eval(expr, envir, enclos): object 'dichloropropane_prop' not found
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
-3.070945, 0.7663361, -0.2225099, 0, 0, 1, 1, 1,
-2.761752, 1.650248, 0.3512397, 1, 0, 0, 1, 1,
-2.585489, 1.039917, -0.9933149, 1, 0, 0, 1, 1,
-2.547472, -0.2300973, -2.153119, 1, 0, 0, 1, 1,
-2.53668, 2.950942, -1.36352, 1, 0, 0, 1, 1,
-2.463671, -0.1329964, -1.48119, 1, 0, 0, 1, 1,
-2.461629, -0.6857368, -1.762504, 0, 0, 0, 1, 1,
-2.448153, -0.7731616, -1.524839, 0, 0, 0, 1, 1,
-2.386893, 0.9470444, -0.1912334, 0, 0, 0, 1, 1,
-2.342956, -0.9170495, -2.011541, 0, 0, 0, 1, 1,
-2.338308, 0.1071177, -1.559268, 0, 0, 0, 1, 1,
-2.287879, 0.3809724, -2.025316, 0, 0, 0, 1, 1,
-2.19702, -2.396418, -3.612786, 0, 0, 0, 1, 1,
-2.183338, 0.9780005, -0.4278027, 1, 1, 1, 1, 1,
-2.176483, 0.5849474, 1.27735, 1, 1, 1, 1, 1,
-2.127463, 0.1752481, -1.269637, 1, 1, 1, 1, 1,
-2.123021, -0.6446685, -0.6936669, 1, 1, 1, 1, 1,
-2.120941, 0.6413863, -1.587833, 1, 1, 1, 1, 1,
-2.092629, -0.7733102, -1.923246, 1, 1, 1, 1, 1,
-2.084484, -0.8210039, -0.1176087, 1, 1, 1, 1, 1,
-2.083581, 0.5198303, -1.506721, 1, 1, 1, 1, 1,
-2.070981, 0.02274708, -1.482422, 1, 1, 1, 1, 1,
-2.055635, 0.3824714, -1.646424, 1, 1, 1, 1, 1,
-2.020396, 1.380643, -0.9785635, 1, 1, 1, 1, 1,
-2.001978, -1.871729, -2.621472, 1, 1, 1, 1, 1,
-1.99273, -0.9005141, -1.787434, 1, 1, 1, 1, 1,
-1.97921, 1.472819, -0.4302356, 1, 1, 1, 1, 1,
-1.969521, -0.3655621, -1.011382, 1, 1, 1, 1, 1,
-1.962947, -1.242753, -1.084764, 0, 0, 1, 1, 1,
-1.959872, -1.02136, -3.074724, 1, 0, 0, 1, 1,
-1.945169, -3.027423, -3.305349, 1, 0, 0, 1, 1,
-1.929862, 0.8237664, -2.593618, 1, 0, 0, 1, 1,
-1.890759, 0.6516016, -0.7073134, 1, 0, 0, 1, 1,
-1.888384, 1.154857, -1.135028, 1, 0, 0, 1, 1,
-1.877248, 0.1592504, -2.482209, 0, 0, 0, 1, 1,
-1.872471, -0.2123803, 0.1131766, 0, 0, 0, 1, 1,
-1.850827, 0.02682296, 0.560219, 0, 0, 0, 1, 1,
-1.828545, -0.3170115, -1.198654, 0, 0, 0, 1, 1,
-1.818416, 0.5905914, -0.6191886, 0, 0, 0, 1, 1,
-1.817752, -0.3540527, -1.333907, 0, 0, 0, 1, 1,
-1.8172, -0.6598472, -1.365018, 0, 0, 0, 1, 1,
-1.777486, 0.135951, 0.1635633, 1, 1, 1, 1, 1,
-1.748432, 0.9651892, -1.000522, 1, 1, 1, 1, 1,
-1.724468, -1.366628, -2.7411, 1, 1, 1, 1, 1,
-1.723285, 1.8526, -0.5436614, 1, 1, 1, 1, 1,
-1.70023, 0.7794003, -1.298679, 1, 1, 1, 1, 1,
-1.695767, -0.7462405, -1.718694, 1, 1, 1, 1, 1,
-1.680512, 0.4586211, -0.5528044, 1, 1, 1, 1, 1,
-1.673337, 0.9634799, 0.9194078, 1, 1, 1, 1, 1,
-1.672631, 0.05648509, -1.150365, 1, 1, 1, 1, 1,
-1.667554, 0.03509552, -0.219463, 1, 1, 1, 1, 1,
-1.641405, -0.6864864, -1.712859, 1, 1, 1, 1, 1,
-1.631213, 0.7960803, -0.07232185, 1, 1, 1, 1, 1,
-1.629074, -0.04475733, -0.2512236, 1, 1, 1, 1, 1,
-1.618693, 0.3820116, -2.417358, 1, 1, 1, 1, 1,
-1.615, -0.03077825, -1.814314, 1, 1, 1, 1, 1,
-1.613259, 0.1287509, -0.346256, 0, 0, 1, 1, 1,
-1.612663, -0.6803265, -1.549486, 1, 0, 0, 1, 1,
-1.607542, 0.5830095, -0.1671746, 1, 0, 0, 1, 1,
-1.607028, 1.035634, 0.8986067, 1, 0, 0, 1, 1,
-1.576151, 0.9963362, 0.5428488, 1, 0, 0, 1, 1,
-1.573687, -1.469356, -3.948389, 1, 0, 0, 1, 1,
-1.559751, -1.176395, -1.651932, 0, 0, 0, 1, 1,
-1.551061, -0.7370023, -0.6949997, 0, 0, 0, 1, 1,
-1.542896, -1.025518, -0.5648639, 0, 0, 0, 1, 1,
-1.531375, 1.195878, -0.500105, 0, 0, 0, 1, 1,
-1.520768, -0.5239224, -2.258971, 0, 0, 0, 1, 1,
-1.520102, 0.0721923, -1.079167, 0, 0, 0, 1, 1,
-1.505626, 0.2620687, 0.4740702, 0, 0, 0, 1, 1,
-1.501578, 0.7117485, 0.09105328, 1, 1, 1, 1, 1,
-1.50148, -1.042797, -1.284507, 1, 1, 1, 1, 1,
-1.491332, -1.368237, -3.236487, 1, 1, 1, 1, 1,
-1.490559, 0.2419752, -2.678771, 1, 1, 1, 1, 1,
-1.473027, 0.5022748, 0.04144053, 1, 1, 1, 1, 1,
-1.470002, 0.1299444, -0.3090322, 1, 1, 1, 1, 1,
-1.465984, -0.4004909, -2.100516, 1, 1, 1, 1, 1,
-1.446058, -0.9198588, -3.04808, 1, 1, 1, 1, 1,
-1.439747, -1.276743, -1.405072, 1, 1, 1, 1, 1,
-1.437897, -0.8409752, -1.46526, 1, 1, 1, 1, 1,
-1.431923, 1.035821, -1.243693, 1, 1, 1, 1, 1,
-1.422687, -1.251248, -2.695118, 1, 1, 1, 1, 1,
-1.406065, -0.03470943, -0.1969993, 1, 1, 1, 1, 1,
-1.404883, -0.3597506, -2.460426, 1, 1, 1, 1, 1,
-1.39872, 1.778035, 0.5252487, 1, 1, 1, 1, 1,
-1.385183, -0.006736865, -1.143155, 0, 0, 1, 1, 1,
-1.384012, -0.4387729, 0.894168, 1, 0, 0, 1, 1,
-1.380365, 0.6995562, 0.02232753, 1, 0, 0, 1, 1,
-1.376261, 1.045966, -1.19956, 1, 0, 0, 1, 1,
-1.370888, 0.5980881, -0.4888529, 1, 0, 0, 1, 1,
-1.366613, 1.224445, -1.488855, 1, 0, 0, 1, 1,
-1.361257, -0.1588051, -0.5847455, 0, 0, 0, 1, 1,
-1.35622, -0.07671849, -2.81592, 0, 0, 0, 1, 1,
-1.353828, 0.6732884, -0.04708605, 0, 0, 0, 1, 1,
-1.349632, -1.741007, -1.697333, 0, 0, 0, 1, 1,
-1.346569, -0.1321139, -2.89627, 0, 0, 0, 1, 1,
-1.345058, 0.252326, -0.2382342, 0, 0, 0, 1, 1,
-1.33725, -0.6006234, -2.404032, 0, 0, 0, 1, 1,
-1.326993, -1.897331, -2.985857, 1, 1, 1, 1, 1,
-1.309809, 0.349447, -1.559286, 1, 1, 1, 1, 1,
-1.28776, 0.8673694, 0.03143884, 1, 1, 1, 1, 1,
-1.281479, 0.6776848, -0.9920456, 1, 1, 1, 1, 1,
-1.268282, 0.3257172, -0.5938436, 1, 1, 1, 1, 1,
-1.265502, -0.2438543, -1.74587, 1, 1, 1, 1, 1,
-1.263351, -0.6869743, -4.591501, 1, 1, 1, 1, 1,
-1.255828, -0.3940277, -2.65795, 1, 1, 1, 1, 1,
-1.240388, -0.2931595, -1.8559, 1, 1, 1, 1, 1,
-1.237445, -0.2831768, -1.938949, 1, 1, 1, 1, 1,
-1.236989, 0.719246, -1.910917, 1, 1, 1, 1, 1,
-1.234585, 0.8955309, -0.6326917, 1, 1, 1, 1, 1,
-1.234006, -1.330282, -3.259624, 1, 1, 1, 1, 1,
-1.233963, 0.9535617, -1.5937, 1, 1, 1, 1, 1,
-1.227365, 1.390734, -0.002199133, 1, 1, 1, 1, 1,
-1.220676, -0.002958664, -1.945198, 0, 0, 1, 1, 1,
-1.192916, 0.3347608, -0.7345193, 1, 0, 0, 1, 1,
-1.190506, 1.139489, -2.638972, 1, 0, 0, 1, 1,
-1.190281, 2.375998, 0.239454, 1, 0, 0, 1, 1,
-1.175238, -1.681577, -3.657649, 1, 0, 0, 1, 1,
-1.168917, -2.157116, -1.789902, 1, 0, 0, 1, 1,
-1.157944, -0.3364068, -0.4461861, 0, 0, 0, 1, 1,
-1.157395, 0.6045859, -0.1902304, 0, 0, 0, 1, 1,
-1.154095, -0.3105348, -1.675045, 0, 0, 0, 1, 1,
-1.145057, 0.06622252, -1.832991, 0, 0, 0, 1, 1,
-1.137015, 1.519904, -0.8706446, 0, 0, 0, 1, 1,
-1.133876, -0.7690713, -2.329413, 0, 0, 0, 1, 1,
-1.130591, 0.1374825, -1.649975, 0, 0, 0, 1, 1,
-1.128572, -0.1237299, -0.4862342, 1, 1, 1, 1, 1,
-1.112389, 1.738975, -1.560759, 1, 1, 1, 1, 1,
-1.112214, 0.4615718, -0.410227, 1, 1, 1, 1, 1,
-1.106665, -0.7851182, 0.7028205, 1, 1, 1, 1, 1,
-1.09568, -1.341943, -2.32462, 1, 1, 1, 1, 1,
-1.091043, -0.3510889, -1.562667, 1, 1, 1, 1, 1,
-1.083498, 0.04006318, -2.207728, 1, 1, 1, 1, 1,
-1.078062, -1.177909, -1.417841, 1, 1, 1, 1, 1,
-1.070818, -0.8775601, -3.396482, 1, 1, 1, 1, 1,
-1.067166, -0.9112511, -2.300315, 1, 1, 1, 1, 1,
-1.060053, -1.563239, -1.890326, 1, 1, 1, 1, 1,
-1.054103, -0.9500466, -3.088401, 1, 1, 1, 1, 1,
-1.045324, -1.572572, -2.431224, 1, 1, 1, 1, 1,
-1.03642, -0.6763041, -2.563215, 1, 1, 1, 1, 1,
-1.034928, 0.3796034, -2.586808, 1, 1, 1, 1, 1,
-1.032176, 1.565663, -1.948185, 0, 0, 1, 1, 1,
-1.022357, -1.642668, -2.173815, 1, 0, 0, 1, 1,
-1.017077, -0.6729108, -3.606774, 1, 0, 0, 1, 1,
-1.0051, -1.516693, -2.885876, 1, 0, 0, 1, 1,
-1.003116, -1.020937, -1.225777, 1, 0, 0, 1, 1,
-1.001846, -0.4484883, -2.658558, 1, 0, 0, 1, 1,
-1.001622, 2.186722, -0.1773297, 0, 0, 0, 1, 1,
-1.001159, 1.632037, -0.7213273, 0, 0, 0, 1, 1,
-1.000052, -1.464836, -1.905745, 0, 0, 0, 1, 1,
-0.9954676, -0.8431258, -3.148818, 0, 0, 0, 1, 1,
-0.9901227, 2.075853, 0.1834153, 0, 0, 0, 1, 1,
-0.9898886, -0.7438197, -3.869035, 0, 0, 0, 1, 1,
-0.9866644, -0.8229678, -3.867936, 0, 0, 0, 1, 1,
-0.9864239, 0.6311842, -0.8674387, 1, 1, 1, 1, 1,
-0.9829275, -0.8901923, -3.006993, 1, 1, 1, 1, 1,
-0.9800799, 0.2186936, -0.3188805, 1, 1, 1, 1, 1,
-0.9733558, 1.653269, -1.5038, 1, 1, 1, 1, 1,
-0.970453, 0.9883345, -0.2630889, 1, 1, 1, 1, 1,
-0.9692469, 0.3084179, -2.07181, 1, 1, 1, 1, 1,
-0.9653062, -0.3472163, -2.332558, 1, 1, 1, 1, 1,
-0.9651815, 0.4459482, -2.840686, 1, 1, 1, 1, 1,
-0.9611971, -2.020125, -3.613454, 1, 1, 1, 1, 1,
-0.9596149, 1.555629, -1.765018, 1, 1, 1, 1, 1,
-0.9586661, 1.275777, 0.8671359, 1, 1, 1, 1, 1,
-0.9581133, 0.2995495, 0.2527613, 1, 1, 1, 1, 1,
-0.9538873, 0.3830996, -0.6444677, 1, 1, 1, 1, 1,
-0.9524459, -0.1934225, -0.7219578, 1, 1, 1, 1, 1,
-0.9521875, -0.4621435, -2.54729, 1, 1, 1, 1, 1,
-0.946519, -1.187267, -2.367933, 0, 0, 1, 1, 1,
-0.9418646, -0.2802473, -0.9800047, 1, 0, 0, 1, 1,
-0.9392032, -1.40993, -2.218714, 1, 0, 0, 1, 1,
-0.9333673, -1.168416, -2.921879, 1, 0, 0, 1, 1,
-0.929953, 0.5064956, -2.182323, 1, 0, 0, 1, 1,
-0.9297046, 0.2795184, -0.4873672, 1, 0, 0, 1, 1,
-0.9269743, 1.649451, 1.554477, 0, 0, 0, 1, 1,
-0.9233176, 0.004525113, -3.074504, 0, 0, 0, 1, 1,
-0.9215349, -0.8400555, -1.952153, 0, 0, 0, 1, 1,
-0.9195768, -1.06328, -1.794328, 0, 0, 0, 1, 1,
-0.9192852, 0.3413178, -1.796751, 0, 0, 0, 1, 1,
-0.911096, -0.7453822, -1.93338, 0, 0, 0, 1, 1,
-0.9109722, -0.5931911, -1.29612, 0, 0, 0, 1, 1,
-0.9068996, -0.2135736, -1.422041, 1, 1, 1, 1, 1,
-0.9068861, -0.5394036, -1.063469, 1, 1, 1, 1, 1,
-0.8959923, -0.5002285, -1.42385, 1, 1, 1, 1, 1,
-0.8931351, -1.639118, -4.005719, 1, 1, 1, 1, 1,
-0.8908588, -1.159072, -3.494194, 1, 1, 1, 1, 1,
-0.8848666, 0.1418326, -2.096306, 1, 1, 1, 1, 1,
-0.8846159, -0.6675111, -2.649695, 1, 1, 1, 1, 1,
-0.8823752, 0.3493245, 0.3117351, 1, 1, 1, 1, 1,
-0.878078, 0.5010449, -0.7424137, 1, 1, 1, 1, 1,
-0.871322, -1.373046, -2.878238, 1, 1, 1, 1, 1,
-0.867094, -0.3640919, -2.789804, 1, 1, 1, 1, 1,
-0.8643156, 0.6331403, -0.3978921, 1, 1, 1, 1, 1,
-0.8617337, 0.5941639, -0.5426017, 1, 1, 1, 1, 1,
-0.8614543, -1.044014, -3.185974, 1, 1, 1, 1, 1,
-0.8609875, -0.502704, -2.11882, 1, 1, 1, 1, 1,
-0.8584782, -0.1063811, -1.095152, 0, 0, 1, 1, 1,
-0.8549618, -0.5427821, -2.262819, 1, 0, 0, 1, 1,
-0.8549045, -0.1291993, -1.879304, 1, 0, 0, 1, 1,
-0.850444, -0.9437975, -2.371824, 1, 0, 0, 1, 1,
-0.8502105, 2.363787, 1.431161, 1, 0, 0, 1, 1,
-0.8441892, -0.09520504, -2.535961, 1, 0, 0, 1, 1,
-0.8434317, 0.5865145, -1.925221, 0, 0, 0, 1, 1,
-0.8376543, -0.3003973, -1.470829, 0, 0, 0, 1, 1,
-0.8346485, 0.03271628, -2.983132, 0, 0, 0, 1, 1,
-0.8338341, -0.1098922, -4.059176, 0, 0, 0, 1, 1,
-0.8330702, -0.7204253, -3.175622, 0, 0, 0, 1, 1,
-0.8276666, -0.09970783, -0.2408278, 0, 0, 0, 1, 1,
-0.8119388, -0.912474, -1.676188, 0, 0, 0, 1, 1,
-0.8102055, 1.178517, -0.904058, 1, 1, 1, 1, 1,
-0.8099378, -1.490719, -1.718672, 1, 1, 1, 1, 1,
-0.802354, -0.5362246, -2.287557, 1, 1, 1, 1, 1,
-0.7962959, 0.03233915, -1.382084, 1, 1, 1, 1, 1,
-0.7919002, 0.3793517, -0.8292753, 1, 1, 1, 1, 1,
-0.7911283, 0.6104676, -1.164602, 1, 1, 1, 1, 1,
-0.7867383, -0.4242433, -1.482485, 1, 1, 1, 1, 1,
-0.780068, 0.6743969, -1.529801, 1, 1, 1, 1, 1,
-0.7769837, -0.07950947, -1.672432, 1, 1, 1, 1, 1,
-0.774421, 1.708148, -2.422059, 1, 1, 1, 1, 1,
-0.7736087, 2.108835, 0.7751466, 1, 1, 1, 1, 1,
-0.7709712, 0.8790647, -0.5834169, 1, 1, 1, 1, 1,
-0.7678625, 0.6842028, -0.2124313, 1, 1, 1, 1, 1,
-0.7669613, -1.00603, -2.023304, 1, 1, 1, 1, 1,
-0.7615338, 0.4631891, -0.5589929, 1, 1, 1, 1, 1,
-0.7583961, -0.6541473, -2.055554, 0, 0, 1, 1, 1,
-0.7539941, -0.8915338, -1.630879, 1, 0, 0, 1, 1,
-0.7537971, 1.435794, 1.835433, 1, 0, 0, 1, 1,
-0.7490498, 0.2983982, -0.9784501, 1, 0, 0, 1, 1,
-0.7447299, -2.016528, -3.914764, 1, 0, 0, 1, 1,
-0.744154, -1.0436, -0.7201369, 1, 0, 0, 1, 1,
-0.7397237, -0.8211939, -1.447177, 0, 0, 0, 1, 1,
-0.739439, 0.8716719, 0.05925289, 0, 0, 0, 1, 1,
-0.7387707, -1.245143, -3.496275, 0, 0, 0, 1, 1,
-0.72979, -0.5013652, -1.577511, 0, 0, 0, 1, 1,
-0.7281764, -1.726564, -3.423863, 0, 0, 0, 1, 1,
-0.7234617, 1.633293, 1.934869, 0, 0, 0, 1, 1,
-0.7230018, -0.6526144, -0.4074567, 0, 0, 0, 1, 1,
-0.7197679, 0.6271474, -2.542451, 1, 1, 1, 1, 1,
-0.7196411, 0.02260118, -0.6634371, 1, 1, 1, 1, 1,
-0.7074247, -0.2772471, -2.889968, 1, 1, 1, 1, 1,
-0.7055467, -0.06020384, -1.781194, 1, 1, 1, 1, 1,
-0.7032937, 2.351004, -1.163662, 1, 1, 1, 1, 1,
-0.7002741, 0.1880926, -1.520838, 1, 1, 1, 1, 1,
-0.6992945, 0.05674677, -2.267002, 1, 1, 1, 1, 1,
-0.6940408, 0.5441463, -2.319951, 1, 1, 1, 1, 1,
-0.69126, 1.171237, 1.46077, 1, 1, 1, 1, 1,
-0.6907374, 0.1234692, -3.703324, 1, 1, 1, 1, 1,
-0.689587, -0.08762263, -2.227327, 1, 1, 1, 1, 1,
-0.6893674, 1.509462, -1.386075, 1, 1, 1, 1, 1,
-0.6893553, 0.6386161, -0.8587542, 1, 1, 1, 1, 1,
-0.6864749, -0.364277, -1.058399, 1, 1, 1, 1, 1,
-0.6809337, 1.017056, 1.100157, 1, 1, 1, 1, 1,
-0.6744611, 0.08576529, -0.5833093, 0, 0, 1, 1, 1,
-0.6731944, -0.5874775, -0.03672858, 1, 0, 0, 1, 1,
-0.6669707, -0.06974819, -0.1438468, 1, 0, 0, 1, 1,
-0.6664979, -0.0539123, -2.670028, 1, 0, 0, 1, 1,
-0.6644905, -0.7738457, -3.105883, 1, 0, 0, 1, 1,
-0.6628059, 0.8148191, -0.8111089, 1, 0, 0, 1, 1,
-0.6608678, 0.5266291, 0.03742737, 0, 0, 0, 1, 1,
-0.6593408, -1.035028, -4.779508, 0, 0, 0, 1, 1,
-0.6585702, -1.219178, -2.306277, 0, 0, 0, 1, 1,
-0.6577207, 1.205253, 0.304401, 0, 0, 0, 1, 1,
-0.6558185, -0.9109002, -4.104723, 0, 0, 0, 1, 1,
-0.653652, 0.2871056, -1.471638, 0, 0, 0, 1, 1,
-0.6464959, 0.07898984, -1.505806, 0, 0, 0, 1, 1,
-0.6414952, 0.9091892, -1.110751, 1, 1, 1, 1, 1,
-0.6404885, -0.3673151, -3.428818, 1, 1, 1, 1, 1,
-0.6381374, -0.5528778, -4.02847, 1, 1, 1, 1, 1,
-0.6375464, 1.053029, 1.064889, 1, 1, 1, 1, 1,
-0.6371046, -1.600832, -1.454647, 1, 1, 1, 1, 1,
-0.6369834, -2.267234, -3.95324, 1, 1, 1, 1, 1,
-0.6334916, -0.3542666, -1.750146, 1, 1, 1, 1, 1,
-0.6315569, 0.8814782, -0.4126146, 1, 1, 1, 1, 1,
-0.6301438, -1.221007, -2.266012, 1, 1, 1, 1, 1,
-0.6275721, -0.8088012, -2.910052, 1, 1, 1, 1, 1,
-0.6274722, -1.253744, -1.939351, 1, 1, 1, 1, 1,
-0.6185068, 0.2017082, -1.181796, 1, 1, 1, 1, 1,
-0.6179719, 2.110795, -1.328249, 1, 1, 1, 1, 1,
-0.6178899, -0.5817304, -1.385497, 1, 1, 1, 1, 1,
-0.6154869, 1.561929, -2.198219, 1, 1, 1, 1, 1,
-0.6148066, 1.612493, -2.260767, 0, 0, 1, 1, 1,
-0.6137565, 0.6418922, -1.003471, 1, 0, 0, 1, 1,
-0.6122152, -0.4398596, -3.438778, 1, 0, 0, 1, 1,
-0.6114883, -0.5881556, -3.331086, 1, 0, 0, 1, 1,
-0.6089044, -0.3216855, -1.902733, 1, 0, 0, 1, 1,
-0.6062482, 1.544818, 1.427455, 1, 0, 0, 1, 1,
-0.6058426, 0.1360586, -1.601547, 0, 0, 0, 1, 1,
-0.6053591, 0.8406287, -0.830146, 0, 0, 0, 1, 1,
-0.5838156, -0.3127567, -1.518932, 0, 0, 0, 1, 1,
-0.5816703, 0.1927898, -0.3720422, 0, 0, 0, 1, 1,
-0.5780259, -0.8536228, -2.538798, 0, 0, 0, 1, 1,
-0.5742328, 0.22356, -1.0739, 0, 0, 0, 1, 1,
-0.5720952, -0.3003126, -1.212797, 0, 0, 0, 1, 1,
-0.5687252, -0.193289, -3.195195, 1, 1, 1, 1, 1,
-0.5626211, 0.3557182, -1.688534, 1, 1, 1, 1, 1,
-0.5621939, 1.063085, 1.253518, 1, 1, 1, 1, 1,
-0.5616323, -0.6509632, -2.320668, 1, 1, 1, 1, 1,
-0.5587755, 0.06760551, 0.5939938, 1, 1, 1, 1, 1,
-0.5566946, 0.02683732, -1.572215, 1, 1, 1, 1, 1,
-0.5551717, -0.6003736, -2.979044, 1, 1, 1, 1, 1,
-0.5520225, 0.8334482, -1.022294, 1, 1, 1, 1, 1,
-0.548948, -0.3788496, -3.445731, 1, 1, 1, 1, 1,
-0.5489322, -1.196399, -4.880314, 1, 1, 1, 1, 1,
-0.5475404, 0.1551183, -1.872593, 1, 1, 1, 1, 1,
-0.5473182, -0.5626178, -2.408873, 1, 1, 1, 1, 1,
-0.5471326, -0.07601621, -0.9944798, 1, 1, 1, 1, 1,
-0.542151, -0.9248514, -2.970639, 1, 1, 1, 1, 1,
-0.5420506, 0.5365705, 0.5562801, 1, 1, 1, 1, 1,
-0.5412797, 2.178684, -2.256024, 0, 0, 1, 1, 1,
-0.5372781, -1.339089, -4.078517, 1, 0, 0, 1, 1,
-0.5332384, -0.3464814, -1.993179, 1, 0, 0, 1, 1,
-0.531904, 1.66905, -0.763301, 1, 0, 0, 1, 1,
-0.5315188, 0.190193, -2.165808, 1, 0, 0, 1, 1,
-0.529267, 0.9181017, 0.3727431, 1, 0, 0, 1, 1,
-0.5262192, 0.2500481, -2.597461, 0, 0, 0, 1, 1,
-0.5251098, -1.003363, -2.647712, 0, 0, 0, 1, 1,
-0.5127371, -1.271642, -2.382176, 0, 0, 0, 1, 1,
-0.5121409, -0.9531483, -2.689063, 0, 0, 0, 1, 1,
-0.5112796, -0.7435188, -1.935588, 0, 0, 0, 1, 1,
-0.5088208, -0.6969413, -3.114022, 0, 0, 0, 1, 1,
-0.5033667, 0.9711117, 0.8237826, 0, 0, 0, 1, 1,
-0.5031484, -0.3560419, -3.182911, 1, 1, 1, 1, 1,
-0.4965275, 1.207658, 0.335879, 1, 1, 1, 1, 1,
-0.4959541, -0.691658, -3.410673, 1, 1, 1, 1, 1,
-0.4901797, 0.9552263, 0.8314556, 1, 1, 1, 1, 1,
-0.4864872, 0.6384418, -0.7461842, 1, 1, 1, 1, 1,
-0.4862297, -0.07075664, -2.456645, 1, 1, 1, 1, 1,
-0.4839017, -1.183475, -4.657994, 1, 1, 1, 1, 1,
-0.4765376, 0.1985892, -1.7151, 1, 1, 1, 1, 1,
-0.4731134, 0.8062165, -1.703354, 1, 1, 1, 1, 1,
-0.470627, 0.7706875, 0.02598857, 1, 1, 1, 1, 1,
-0.4705561, 1.133842, 0.3788929, 1, 1, 1, 1, 1,
-0.4688484, -2.486898, -1.590799, 1, 1, 1, 1, 1,
-0.4685251, 0.5181688, -2.057316, 1, 1, 1, 1, 1,
-0.465394, 0.5025511, 0.2402897, 1, 1, 1, 1, 1,
-0.4650969, -0.2698535, -2.492903, 1, 1, 1, 1, 1,
-0.462388, -0.06179377, 0.3975903, 0, 0, 1, 1, 1,
-0.4612136, -0.7145256, -3.659023, 1, 0, 0, 1, 1,
-0.460294, -0.06347045, -2.965549, 1, 0, 0, 1, 1,
-0.4562772, 1.090018, 2.647012, 1, 0, 0, 1, 1,
-0.4466305, -1.014668, -3.168611, 1, 0, 0, 1, 1,
-0.4456721, -1.786789, -1.678424, 1, 0, 0, 1, 1,
-0.4442328, 0.7601849, -0.6131832, 0, 0, 0, 1, 1,
-0.4384156, 0.8548002, -0.8019214, 0, 0, 0, 1, 1,
-0.4335301, 0.6113662, -0.9497873, 0, 0, 0, 1, 1,
-0.4306098, 2.197922, -0.3230482, 0, 0, 0, 1, 1,
-0.4283465, 0.1652801, -2.617592, 0, 0, 0, 1, 1,
-0.4237778, 0.9484324, -0.8097304, 0, 0, 0, 1, 1,
-0.4220288, 0.5792538, -1.151468, 0, 0, 0, 1, 1,
-0.4148405, -0.5753895, -2.202877, 1, 1, 1, 1, 1,
-0.4108296, -0.003036561, -2.757485, 1, 1, 1, 1, 1,
-0.4097744, 1.920313, -2.400675, 1, 1, 1, 1, 1,
-0.4038261, 0.2900435, 0.2930733, 1, 1, 1, 1, 1,
-0.4017606, 0.3586521, -1.289941, 1, 1, 1, 1, 1,
-0.3983216, -1.300793, -2.261374, 1, 1, 1, 1, 1,
-0.3964737, -1.180092, -4.497554, 1, 1, 1, 1, 1,
-0.3949981, -0.4261603, -1.710311, 1, 1, 1, 1, 1,
-0.3933161, 0.508144, -1.075532, 1, 1, 1, 1, 1,
-0.3898461, -0.4099542, -4.407604, 1, 1, 1, 1, 1,
-0.3884397, -0.3784107, -2.49287, 1, 1, 1, 1, 1,
-0.3858657, 0.8172455, -0.6972862, 1, 1, 1, 1, 1,
-0.381552, 0.4196305, 0.5092204, 1, 1, 1, 1, 1,
-0.3810894, 0.5124268, -1.372628, 1, 1, 1, 1, 1,
-0.3785689, 0.859022, -0.7380796, 1, 1, 1, 1, 1,
-0.3716424, 0.5099359, -0.9869425, 0, 0, 1, 1, 1,
-0.3710862, 1.321839, -1.897057, 1, 0, 0, 1, 1,
-0.3702874, 0.2551113, -0.79536, 1, 0, 0, 1, 1,
-0.3659338, -0.996758, -0.7495791, 1, 0, 0, 1, 1,
-0.3618096, 0.2129198, -1.551415, 1, 0, 0, 1, 1,
-0.360803, 0.4123475, -1.333181, 1, 0, 0, 1, 1,
-0.3602935, -0.1615011, -1.456415, 0, 0, 0, 1, 1,
-0.3541744, 1.117369, -1.686949, 0, 0, 0, 1, 1,
-0.3520428, 0.1741359, -1.414165, 0, 0, 0, 1, 1,
-0.3475494, -2.66992, -4.214883, 0, 0, 0, 1, 1,
-0.3387445, -0.9965537, -3.164209, 0, 0, 0, 1, 1,
-0.3360438, -0.3631416, -1.35781, 0, 0, 0, 1, 1,
-0.3360157, 1.286455, -0.04682031, 0, 0, 0, 1, 1,
-0.3347962, 0.8344918, -2.140248, 1, 1, 1, 1, 1,
-0.3341435, -0.1179564, -2.109229, 1, 1, 1, 1, 1,
-0.3273669, -1.291955, -2.486498, 1, 1, 1, 1, 1,
-0.3265692, 0.2471049, -2.194219, 1, 1, 1, 1, 1,
-0.3261221, 0.6510993, 0.1791788, 1, 1, 1, 1, 1,
-0.3131565, 0.3878134, -0.4030871, 1, 1, 1, 1, 1,
-0.3117556, -0.4516019, -3.081791, 1, 1, 1, 1, 1,
-0.3102284, 2.647016, -0.8818994, 1, 1, 1, 1, 1,
-0.3092608, -0.5423705, -2.500201, 1, 1, 1, 1, 1,
-0.3019806, -1.174062, -4.266191, 1, 1, 1, 1, 1,
-0.300415, 0.5322179, 2.407343, 1, 1, 1, 1, 1,
-0.297696, -0.2254759, -1.829897, 1, 1, 1, 1, 1,
-0.2972733, 0.06379124, -1.576545, 1, 1, 1, 1, 1,
-0.2962971, 0.5623446, -0.8371515, 1, 1, 1, 1, 1,
-0.2947571, 0.4813092, 0.9870707, 1, 1, 1, 1, 1,
-0.2934875, -2.072169, -3.411955, 0, 0, 1, 1, 1,
-0.2915168, -0.3259549, -2.582028, 1, 0, 0, 1, 1,
-0.2905699, 0.3484942, -0.4179984, 1, 0, 0, 1, 1,
-0.2883319, 1.259427, 0.2239245, 1, 0, 0, 1, 1,
-0.2882598, -0.6288024, -2.337013, 1, 0, 0, 1, 1,
-0.287065, -1.760408, -3.913511, 1, 0, 0, 1, 1,
-0.2815841, 0.07699777, -0.9450003, 0, 0, 0, 1, 1,
-0.2811906, -0.2567831, -1.128997, 0, 0, 0, 1, 1,
-0.2803307, 0.8225859, 0.9343792, 0, 0, 0, 1, 1,
-0.2590463, -1.432611, -2.557847, 0, 0, 0, 1, 1,
-0.2585813, 0.9042048, -1.431401, 0, 0, 0, 1, 1,
-0.254991, -1.822472, -3.161055, 0, 0, 0, 1, 1,
-0.2515202, 0.5633379, -0.891396, 0, 0, 0, 1, 1,
-0.2489949, 0.1409072, 0.3083482, 1, 1, 1, 1, 1,
-0.2413774, -0.5005454, -2.264265, 1, 1, 1, 1, 1,
-0.241051, 0.6447234, -1.717091, 1, 1, 1, 1, 1,
-0.2371354, 0.7350757, 0.1034707, 1, 1, 1, 1, 1,
-0.2366326, 0.6066647, -1.763497, 1, 1, 1, 1, 1,
-0.2329981, -1.232489, -2.765167, 1, 1, 1, 1, 1,
-0.2290658, 0.1363202, -2.781876, 1, 1, 1, 1, 1,
-0.2290235, -1.695881, -2.796026, 1, 1, 1, 1, 1,
-0.2241243, -0.02023822, -2.39492, 1, 1, 1, 1, 1,
-0.2236407, -2.238567, -2.792522, 1, 1, 1, 1, 1,
-0.2230595, -1.301494, -2.146628, 1, 1, 1, 1, 1,
-0.2227895, 1.500992, 0.8352582, 1, 1, 1, 1, 1,
-0.2149348, 0.6016132, -0.5940433, 1, 1, 1, 1, 1,
-0.2113391, 2.390495, -1.978145, 1, 1, 1, 1, 1,
-0.2108876, 1.286856, 0.7983055, 1, 1, 1, 1, 1,
-0.2077151, -1.008311, -2.383957, 0, 0, 1, 1, 1,
-0.2057462, -1.096179, -3.221603, 1, 0, 0, 1, 1,
-0.2037318, 0.7446895, 0.3630016, 1, 0, 0, 1, 1,
-0.1976744, -0.7957889, -4.10867, 1, 0, 0, 1, 1,
-0.1966934, 0.8328854, -0.5290179, 1, 0, 0, 1, 1,
-0.1898748, -0.5455251, -1.549357, 1, 0, 0, 1, 1,
-0.1877451, -0.1394553, -1.797551, 0, 0, 0, 1, 1,
-0.1868604, -1.038064, -5.378546, 0, 0, 0, 1, 1,
-0.1812865, 1.475732, 2.185237, 0, 0, 0, 1, 1,
-0.1772933, 1.54257, 0.1328923, 0, 0, 0, 1, 1,
-0.1726703, 0.08174843, -1.481016, 0, 0, 0, 1, 1,
-0.1676415, -1.116745, -1.767614, 0, 0, 0, 1, 1,
-0.1638046, 0.4832579, -0.3611519, 0, 0, 0, 1, 1,
-0.1627576, -0.7657151, -3.610155, 1, 1, 1, 1, 1,
-0.1616337, -0.5635422, -0.3999869, 1, 1, 1, 1, 1,
-0.1604403, 3.31101, 0.0289689, 1, 1, 1, 1, 1,
-0.1592172, 0.4424627, -0.226172, 1, 1, 1, 1, 1,
-0.1587668, 0.9243683, -0.648044, 1, 1, 1, 1, 1,
-0.1577237, -0.3685114, -3.490965, 1, 1, 1, 1, 1,
-0.1572792, -1.794895, -3.192898, 1, 1, 1, 1, 1,
-0.1571445, -1.39272, -4.663632, 1, 1, 1, 1, 1,
-0.1500557, -0.7437446, -2.801035, 1, 1, 1, 1, 1,
-0.1422407, 1.304778, 0.7582023, 1, 1, 1, 1, 1,
-0.1410962, 0.2028588, -1.427766, 1, 1, 1, 1, 1,
-0.1352159, -1.670287, -0.2372315, 1, 1, 1, 1, 1,
-0.1343195, -0.1063288, -1.961212, 1, 1, 1, 1, 1,
-0.1341793, 1.160909, 0.5890061, 1, 1, 1, 1, 1,
-0.1336591, 0.08886383, -1.178507, 1, 1, 1, 1, 1,
-0.1326519, -2.15946, -3.312354, 0, 0, 1, 1, 1,
-0.1319617, -1.132553, -2.662649, 1, 0, 0, 1, 1,
-0.1318875, 0.6930241, 0.5408099, 1, 0, 0, 1, 1,
-0.1314207, -0.08649553, -1.904224, 1, 0, 0, 1, 1,
-0.1288196, -0.9816974, -3.311884, 1, 0, 0, 1, 1,
-0.1257504, -0.7761208, -3.022745, 1, 0, 0, 1, 1,
-0.1201265, -1.402019, -4.414931, 0, 0, 0, 1, 1,
-0.1140106, 0.2438001, 1.169986, 0, 0, 0, 1, 1,
-0.1088874, -1.453285, -0.6732225, 0, 0, 0, 1, 1,
-0.1069371, -2.077162, -2.579221, 0, 0, 0, 1, 1,
-0.1051247, 0.5687249, -0.09198174, 0, 0, 0, 1, 1,
-0.1006055, -0.5467879, -3.464757, 0, 0, 0, 1, 1,
-0.09985539, 0.3848105, 1.154285, 0, 0, 0, 1, 1,
-0.09855162, 0.2030802, -1.634308, 1, 1, 1, 1, 1,
-0.09743688, -0.6361189, -2.200944, 1, 1, 1, 1, 1,
-0.09584209, -0.09004878, -3.631642, 1, 1, 1, 1, 1,
-0.08227894, -0.5463948, -4.214619, 1, 1, 1, 1, 1,
-0.0821605, -0.001999746, -1.987994, 1, 1, 1, 1, 1,
-0.08061555, 1.436096, -0.4253286, 1, 1, 1, 1, 1,
-0.07964907, -0.4971238, -4.671031, 1, 1, 1, 1, 1,
-0.07753342, 1.204383, -0.5802068, 1, 1, 1, 1, 1,
-0.07199598, 3.230574, -0.3194547, 1, 1, 1, 1, 1,
-0.06996877, -1.419101, -2.169241, 1, 1, 1, 1, 1,
-0.06273688, 0.577229, -0.855305, 1, 1, 1, 1, 1,
-0.06237702, -0.1703469, -0.985259, 1, 1, 1, 1, 1,
-0.06180808, -0.09384456, -2.250242, 1, 1, 1, 1, 1,
-0.06084352, 0.7525036, -1.368774, 1, 1, 1, 1, 1,
-0.05862411, -1.16222, -3.385576, 1, 1, 1, 1, 1,
-0.05755165, -0.6980903, -3.361521, 0, 0, 1, 1, 1,
-0.05581081, 0.7467983, -0.1551027, 1, 0, 0, 1, 1,
-0.05571745, 0.5616999, -0.4640114, 1, 0, 0, 1, 1,
-0.05393707, 1.133377, 2.542968, 1, 0, 0, 1, 1,
-0.0475571, 1.485041, 0.5883023, 1, 0, 0, 1, 1,
-0.04256221, -1.379957, -1.666984, 1, 0, 0, 1, 1,
-0.03680751, -0.5686045, -3.18647, 0, 0, 0, 1, 1,
-0.03374886, -0.82525, -2.949439, 0, 0, 0, 1, 1,
-0.03304739, 0.005351927, -2.003667, 0, 0, 0, 1, 1,
-0.03265004, -0.1792749, -2.889647, 0, 0, 0, 1, 1,
-0.02150793, -0.01407408, -0.9088107, 0, 0, 0, 1, 1,
-0.02043087, 0.5042291, -0.9736407, 0, 0, 0, 1, 1,
-0.02004438, -2.325663, -3.011097, 0, 0, 0, 1, 1,
-0.01760248, -0.394325, -2.47497, 1, 1, 1, 1, 1,
-0.01170948, 1.309552, 0.01218838, 1, 1, 1, 1, 1,
-0.005807233, -1.578216, -1.244259, 1, 1, 1, 1, 1,
-0.005136048, 0.7797372, -0.7297747, 1, 1, 1, 1, 1,
0.001081223, 0.6233426, -0.07933878, 1, 1, 1, 1, 1,
0.003246393, 0.275401, -0.1043641, 1, 1, 1, 1, 1,
0.003956171, 0.2934445, -1.226109, 1, 1, 1, 1, 1,
0.006682827, -0.1645814, 2.343725, 1, 1, 1, 1, 1,
0.007737596, 2.398328, 0.8514636, 1, 1, 1, 1, 1,
0.008207177, 0.2246408, 0.08992425, 1, 1, 1, 1, 1,
0.008328428, -0.08887278, 2.741629, 1, 1, 1, 1, 1,
0.01108253, 0.5318809, 0.22526, 1, 1, 1, 1, 1,
0.01388968, 1.374945, -0.1896526, 1, 1, 1, 1, 1,
0.01560829, -0.4960023, 2.70074, 1, 1, 1, 1, 1,
0.01722211, 1.429975, 0.2386446, 1, 1, 1, 1, 1,
0.02182743, 1.227222, 0.6032966, 0, 0, 1, 1, 1,
0.02831827, 0.1025581, -1.121895, 1, 0, 0, 1, 1,
0.02988165, -0.4866872, 2.815394, 1, 0, 0, 1, 1,
0.03206782, 0.07892917, -0.8138219, 1, 0, 0, 1, 1,
0.03405179, 1.363561, -1.000821, 1, 0, 0, 1, 1,
0.03418481, -0.8407878, 2.787551, 1, 0, 0, 1, 1,
0.0354247, -0.6660269, 2.767413, 0, 0, 0, 1, 1,
0.0355547, 0.3888747, 1.334464, 0, 0, 0, 1, 1,
0.03976396, -0.3570527, 4.082875, 0, 0, 0, 1, 1,
0.04039974, -0.7338031, 0.702677, 0, 0, 0, 1, 1,
0.0423989, -0.2743426, 4.457055, 0, 0, 0, 1, 1,
0.04267633, 0.4073074, 0.9258803, 0, 0, 0, 1, 1,
0.04365801, 0.05104806, 0.6688893, 0, 0, 0, 1, 1,
0.04632379, -1.210796, 2.386065, 1, 1, 1, 1, 1,
0.04651728, 0.8204607, 0.0797796, 1, 1, 1, 1, 1,
0.04778971, -0.7472548, 2.081069, 1, 1, 1, 1, 1,
0.0483178, -0.9332007, 3.215607, 1, 1, 1, 1, 1,
0.05509739, 2.357078, -0.2841223, 1, 1, 1, 1, 1,
0.05623334, -0.8142307, 2.363501, 1, 1, 1, 1, 1,
0.06248166, 0.3979859, -1.819852, 1, 1, 1, 1, 1,
0.07044719, 0.8361012, -0.5176857, 1, 1, 1, 1, 1,
0.0709295, 1.550469, 0.3712004, 1, 1, 1, 1, 1,
0.07294504, -0.8600495, 3.04619, 1, 1, 1, 1, 1,
0.07549929, -0.8455855, 3.197424, 1, 1, 1, 1, 1,
0.08014696, -0.1892193, 2.199476, 1, 1, 1, 1, 1,
0.08243421, -1.046603, 3.40171, 1, 1, 1, 1, 1,
0.08370808, -0.8952212, 1.304749, 1, 1, 1, 1, 1,
0.08459939, -0.06659819, 1.284755, 1, 1, 1, 1, 1,
0.08604158, -1.517865, 3.992424, 0, 0, 1, 1, 1,
0.09171534, -0.8279399, 2.48791, 1, 0, 0, 1, 1,
0.09323053, -0.3864477, 1.367218, 1, 0, 0, 1, 1,
0.09707586, 0.7966226, -0.648164, 1, 0, 0, 1, 1,
0.09791139, -0.8773115, 1.530555, 1, 0, 0, 1, 1,
0.09947346, 0.3190183, -0.5386351, 1, 0, 0, 1, 1,
0.1008372, 0.7254532, 0.4853778, 0, 0, 0, 1, 1,
0.10447, 1.469983, -1.280211, 0, 0, 0, 1, 1,
0.1046348, 1.041045, -0.7359244, 0, 0, 0, 1, 1,
0.1091736, 0.8615496, 0.8642864, 0, 0, 0, 1, 1,
0.1125561, -0.7710462, 3.528628, 0, 0, 0, 1, 1,
0.1169445, -0.3619363, 3.488342, 0, 0, 0, 1, 1,
0.1191748, -0.7992662, 3.370323, 0, 0, 0, 1, 1,
0.1194204, -1.069363, 1.9229, 1, 1, 1, 1, 1,
0.1217859, -1.198033, 4.409499, 1, 1, 1, 1, 1,
0.1242867, -0.8003046, 2.774132, 1, 1, 1, 1, 1,
0.1328335, 0.6208189, 1.48003, 1, 1, 1, 1, 1,
0.132912, -2.455146, 4.239851, 1, 1, 1, 1, 1,
0.1342653, 0.2692117, 1.547187, 1, 1, 1, 1, 1,
0.1449393, 1.118414, -0.6518006, 1, 1, 1, 1, 1,
0.1455926, 0.09650736, 2.325839, 1, 1, 1, 1, 1,
0.1458797, 0.7535101, -1.047535, 1, 1, 1, 1, 1,
0.1503838, -1.877791, 2.885425, 1, 1, 1, 1, 1,
0.1505507, 1.145529, -0.6685263, 1, 1, 1, 1, 1,
0.1506501, -0.2397751, 1.667742, 1, 1, 1, 1, 1,
0.1529977, 0.9159543, 0.2070393, 1, 1, 1, 1, 1,
0.1541449, 1.45072, 0.2915601, 1, 1, 1, 1, 1,
0.1676991, 0.2683951, 0.2353751, 1, 1, 1, 1, 1,
0.1692417, 0.6873397, -0.8337332, 0, 0, 1, 1, 1,
0.176571, 0.6623937, -0.2135619, 1, 0, 0, 1, 1,
0.1780612, 0.5706002, 0.2865877, 1, 0, 0, 1, 1,
0.1793429, 2.50027, -0.618838, 1, 0, 0, 1, 1,
0.1804763, 0.08472498, 1.441346, 1, 0, 0, 1, 1,
0.1807587, 0.3268751, 0.9635782, 1, 0, 0, 1, 1,
0.1914843, 0.6413935, -1.173759, 0, 0, 0, 1, 1,
0.1933299, -0.8024864, 2.713041, 0, 0, 0, 1, 1,
0.1950289, -0.08919713, -0.04958212, 0, 0, 0, 1, 1,
0.1994021, 1.030639, 1.34405, 0, 0, 0, 1, 1,
0.2006771, -0.7036905, 3.522565, 0, 0, 0, 1, 1,
0.2011169, 0.7746407, -0.2738296, 0, 0, 0, 1, 1,
0.2023567, -0.9302105, 3.005382, 0, 0, 0, 1, 1,
0.2042469, -0.898819, 2.540206, 1, 1, 1, 1, 1,
0.2047139, -0.3883031, 3.373563, 1, 1, 1, 1, 1,
0.205025, 1.40494, 0.6122923, 1, 1, 1, 1, 1,
0.2065849, -0.1301208, 2.097158, 1, 1, 1, 1, 1,
0.207704, -0.8610407, 2.537413, 1, 1, 1, 1, 1,
0.2112493, 0.8025478, 0.03049877, 1, 1, 1, 1, 1,
0.2135517, -0.9309438, 2.342541, 1, 1, 1, 1, 1,
0.2141645, -1.126156, 4.311018, 1, 1, 1, 1, 1,
0.2151481, 0.3127194, 0.6907235, 1, 1, 1, 1, 1,
0.2202082, 1.202991, 0.2525982, 1, 1, 1, 1, 1,
0.224594, 0.5565565, 1.055251, 1, 1, 1, 1, 1,
0.2256174, -0.503814, 4.044918, 1, 1, 1, 1, 1,
0.2258164, -0.3023912, 2.884768, 1, 1, 1, 1, 1,
0.2323638, -0.2037075, 2.691025, 1, 1, 1, 1, 1,
0.2334775, 0.757956, -0.8434777, 1, 1, 1, 1, 1,
0.2339556, -0.4169602, 3.234028, 0, 0, 1, 1, 1,
0.2351931, 1.452026, 0.2442842, 1, 0, 0, 1, 1,
0.2380756, 0.7336887, -0.610388, 1, 0, 0, 1, 1,
0.2411653, 1.453823, 0.8177462, 1, 0, 0, 1, 1,
0.2436325, 0.2491784, 1.278304, 1, 0, 0, 1, 1,
0.2440551, 0.5669893, 1.46763, 1, 0, 0, 1, 1,
0.2441425, 0.2961285, 1.565681, 0, 0, 0, 1, 1,
0.2444737, -0.8453267, 1.351438, 0, 0, 0, 1, 1,
0.2465918, -2.634847, 2.685206, 0, 0, 0, 1, 1,
0.2501769, -0.8274082, 3.800051, 0, 0, 0, 1, 1,
0.2536433, -1.11212, 2.002303, 0, 0, 0, 1, 1,
0.2544207, 0.6579846, -0.1037385, 0, 0, 0, 1, 1,
0.2547709, 0.8834168, 1.5504, 0, 0, 0, 1, 1,
0.2619272, 1.489041, 0.8455601, 1, 1, 1, 1, 1,
0.2646195, 1.873495, -2.987466, 1, 1, 1, 1, 1,
0.2655791, -0.4714342, 3.436862, 1, 1, 1, 1, 1,
0.2756665, -0.7602727, 2.233933, 1, 1, 1, 1, 1,
0.2778294, -0.6493877, 2.871382, 1, 1, 1, 1, 1,
0.2848092, -0.7599624, 4.076172, 1, 1, 1, 1, 1,
0.2863337, 1.268615, -0.3851146, 1, 1, 1, 1, 1,
0.2930954, -1.495249, 3.355994, 1, 1, 1, 1, 1,
0.2932941, 0.3342595, 0.6969378, 1, 1, 1, 1, 1,
0.2938815, 0.7281872, 0.3633395, 1, 1, 1, 1, 1,
0.2943561, 2.019544, 0.7585552, 1, 1, 1, 1, 1,
0.2996081, 0.6654475, 2.034363, 1, 1, 1, 1, 1,
0.2997619, 0.2517821, 0.4076537, 1, 1, 1, 1, 1,
0.3033074, -0.09119663, 2.206207, 1, 1, 1, 1, 1,
0.3041749, -0.5727881, 3.428936, 1, 1, 1, 1, 1,
0.3050866, -0.2929519, 2.01636, 0, 0, 1, 1, 1,
0.3054701, 2.420949, -0.9439676, 1, 0, 0, 1, 1,
0.3059417, 0.7253819, 0.1482605, 1, 0, 0, 1, 1,
0.3076637, 0.2596738, 1.775721, 1, 0, 0, 1, 1,
0.308813, -0.4485229, 2.308176, 1, 0, 0, 1, 1,
0.3114827, -0.3797562, 1.127706, 1, 0, 0, 1, 1,
0.31171, -0.5743941, 4.406585, 0, 0, 0, 1, 1,
0.3220477, 0.3268623, 0.9253582, 0, 0, 0, 1, 1,
0.3237597, -1.23299, 3.993519, 0, 0, 0, 1, 1,
0.3243937, -0.003148081, 3.267792, 0, 0, 0, 1, 1,
0.3284501, -0.08749527, 0.9326352, 0, 0, 0, 1, 1,
0.3332246, -0.6887162, 2.512457, 0, 0, 0, 1, 1,
0.3340499, 2.373758, 0.7713363, 0, 0, 0, 1, 1,
0.3348377, 0.9874423, -0.03378173, 1, 1, 1, 1, 1,
0.336404, -0.4611771, 3.123696, 1, 1, 1, 1, 1,
0.3395791, -0.7281948, 2.557325, 1, 1, 1, 1, 1,
0.3396458, 0.1005508, 2.294877, 1, 1, 1, 1, 1,
0.3396505, 0.2266866, 0.6073563, 1, 1, 1, 1, 1,
0.3461747, 1.471808, 0.4739557, 1, 1, 1, 1, 1,
0.3467086, 1.02855, 0.3162281, 1, 1, 1, 1, 1,
0.3493322, -0.991843, 3.164231, 1, 1, 1, 1, 1,
0.3518481, 0.1155905, 0.5738298, 1, 1, 1, 1, 1,
0.3551249, -0.709916, 1.740753, 1, 1, 1, 1, 1,
0.3664205, -0.4289581, 0.9987261, 1, 1, 1, 1, 1,
0.3687526, 0.7189015, 2.250156, 1, 1, 1, 1, 1,
0.3733714, -2.346086, 1.078469, 1, 1, 1, 1, 1,
0.3749333, 0.9538225, 0.3320534, 1, 1, 1, 1, 1,
0.3804576, 1.167702, 0.4794677, 1, 1, 1, 1, 1,
0.3807437, -1.545472, 1.288479, 0, 0, 1, 1, 1,
0.3833412, 0.4330687, -0.7421271, 1, 0, 0, 1, 1,
0.3858078, -0.4911244, 2.70245, 1, 0, 0, 1, 1,
0.3902285, 0.9173666, 0.1273185, 1, 0, 0, 1, 1,
0.3931473, -1.072837, 1.565971, 1, 0, 0, 1, 1,
0.3993703, 0.364162, 1.116094, 1, 0, 0, 1, 1,
0.4005404, 0.01387887, 0.4857861, 0, 0, 0, 1, 1,
0.4011156, -0.7608695, 3.274302, 0, 0, 0, 1, 1,
0.4012781, 0.6509737, 0.3631818, 0, 0, 0, 1, 1,
0.4032372, -0.4324403, 2.481441, 0, 0, 0, 1, 1,
0.4037279, -0.382454, 3.049554, 0, 0, 0, 1, 1,
0.4074685, 0.08124242, 2.97279, 0, 0, 0, 1, 1,
0.4083936, -2.075855, 3.913879, 0, 0, 0, 1, 1,
0.412119, 0.2674379, 2.060392, 1, 1, 1, 1, 1,
0.4121582, -0.2427991, 1.342117, 1, 1, 1, 1, 1,
0.4162772, 0.1726686, 0.4585933, 1, 1, 1, 1, 1,
0.4168488, 0.2301011, 0.7142727, 1, 1, 1, 1, 1,
0.4169427, 0.5190652, 2.115518, 1, 1, 1, 1, 1,
0.4282471, -1.012478, 2.306798, 1, 1, 1, 1, 1,
0.4292153, 0.5318028, -0.1916513, 1, 1, 1, 1, 1,
0.4332823, -0.9375584, 1.531785, 1, 1, 1, 1, 1,
0.43329, -0.7027998, 0.7710729, 1, 1, 1, 1, 1,
0.433512, -0.756058, 2.797065, 1, 1, 1, 1, 1,
0.4347269, -0.8279368, 1.749968, 1, 1, 1, 1, 1,
0.4379293, -0.9041802, 2.965537, 1, 1, 1, 1, 1,
0.4430873, 0.156555, 0.5721488, 1, 1, 1, 1, 1,
0.4465013, -0.2211721, 2.482098, 1, 1, 1, 1, 1,
0.4483368, -1.503605, 1.932764, 1, 1, 1, 1, 1,
0.4548816, -1.121648, 4.214042, 0, 0, 1, 1, 1,
0.456741, -0.9507731, 3.268443, 1, 0, 0, 1, 1,
0.4585409, 0.4213118, 2.049256, 1, 0, 0, 1, 1,
0.4603063, -0.7052346, 3.244943, 1, 0, 0, 1, 1,
0.460869, 0.2298202, 0.7705948, 1, 0, 0, 1, 1,
0.4644362, 0.06426548, 2.671795, 1, 0, 0, 1, 1,
0.4696673, -0.1907491, 2.762405, 0, 0, 0, 1, 1,
0.4701228, 1.113569, 1.306069, 0, 0, 0, 1, 1,
0.4735518, -0.2748637, 0.7915116, 0, 0, 0, 1, 1,
0.4759758, 0.615119, 1.899761, 0, 0, 0, 1, 1,
0.4781382, 1.56127, 0.09049421, 0, 0, 0, 1, 1,
0.4798239, -2.322404, 4.352567, 0, 0, 0, 1, 1,
0.4849387, 0.698844, -0.3823532, 0, 0, 0, 1, 1,
0.4900294, 1.242754, 0.6489353, 1, 1, 1, 1, 1,
0.4908569, -0.01923393, 1.107286, 1, 1, 1, 1, 1,
0.4926774, -0.07399271, 2.332453, 1, 1, 1, 1, 1,
0.4938806, 0.6530863, -1.462205, 1, 1, 1, 1, 1,
0.4939864, -0.4382674, 1.523523, 1, 1, 1, 1, 1,
0.4974666, -0.07884639, 1.378306, 1, 1, 1, 1, 1,
0.497994, 1.663512, 1.029558, 1, 1, 1, 1, 1,
0.5030639, 0.1881303, 1.799055, 1, 1, 1, 1, 1,
0.503896, -0.05188086, 1.045268, 1, 1, 1, 1, 1,
0.5085198, -0.9080086, 3.004289, 1, 1, 1, 1, 1,
0.5093395, -0.6873974, 0.5157708, 1, 1, 1, 1, 1,
0.5110769, -0.8226144, 2.523017, 1, 1, 1, 1, 1,
0.5118352, -0.7468171, 0.928025, 1, 1, 1, 1, 1,
0.519444, -1.834778, 2.830647, 1, 1, 1, 1, 1,
0.5196017, 0.3825773, -0.09459812, 1, 1, 1, 1, 1,
0.5212023, 0.1987735, 0.09755292, 0, 0, 1, 1, 1,
0.5224931, -0.5217279, 3.047611, 1, 0, 0, 1, 1,
0.5255762, -1.211598, 1.590015, 1, 0, 0, 1, 1,
0.527807, -1.187845, 5.123354, 1, 0, 0, 1, 1,
0.5299475, -0.1238795, 1.814878, 1, 0, 0, 1, 1,
0.5340621, 1.424719, 0.2457749, 1, 0, 0, 1, 1,
0.5377932, 0.829572, 0.6593281, 0, 0, 0, 1, 1,
0.5383396, 0.8371006, 0.7677793, 0, 0, 0, 1, 1,
0.5386269, -0.3139644, 2.817566, 0, 0, 0, 1, 1,
0.5470871, -1.113826, 2.610345, 0, 0, 0, 1, 1,
0.5489821, -0.8443553, 3.698063, 0, 0, 0, 1, 1,
0.5588166, 0.5274116, 1.481137, 0, 0, 0, 1, 1,
0.5597028, -0.2099625, 1.319777, 0, 0, 0, 1, 1,
0.5610036, -1.052659, -0.8735777, 1, 1, 1, 1, 1,
0.5611401, -0.5658248, 2.36398, 1, 1, 1, 1, 1,
0.5619801, -0.5962819, 3.894501, 1, 1, 1, 1, 1,
0.5628574, 0.1760691, 1.573421, 1, 1, 1, 1, 1,
0.5647715, -1.358159, 2.717648, 1, 1, 1, 1, 1,
0.5773478, 0.5701946, -2.225057, 1, 1, 1, 1, 1,
0.5803025, 1.25558, 0.6693522, 1, 1, 1, 1, 1,
0.5806991, 0.2663841, 2.763253, 1, 1, 1, 1, 1,
0.5884752, -1.066531, 4.941064, 1, 1, 1, 1, 1,
0.5921746, -1.801333, 2.766732, 1, 1, 1, 1, 1,
0.5942121, -1.401363, 2.382927, 1, 1, 1, 1, 1,
0.6026993, -2.175026, 2.551458, 1, 1, 1, 1, 1,
0.602712, -0.01670389, 0.6917647, 1, 1, 1, 1, 1,
0.6053494, -0.4683623, 2.610655, 1, 1, 1, 1, 1,
0.6099854, -1.541257, 4.706902, 1, 1, 1, 1, 1,
0.6122802, -1.631576, 2.585531, 0, 0, 1, 1, 1,
0.6125007, -0.02422618, 1.817745, 1, 0, 0, 1, 1,
0.6131559, -0.5127162, 3.054453, 1, 0, 0, 1, 1,
0.6166277, 0.2207611, 1.091911, 1, 0, 0, 1, 1,
0.6199334, -1.533063, 2.741601, 1, 0, 0, 1, 1,
0.6200439, 0.9774293, 1.758544, 1, 0, 0, 1, 1,
0.6209618, -0.1455752, 3.645436, 0, 0, 0, 1, 1,
0.6214344, -0.2865553, 0.3965889, 0, 0, 0, 1, 1,
0.624954, 0.7966407, 2.181215, 0, 0, 0, 1, 1,
0.6284071, -0.638204, 2.064539, 0, 0, 0, 1, 1,
0.6290419, 0.01603511, 2.23061, 0, 0, 0, 1, 1,
0.6301008, 2.595134, 1.032412, 0, 0, 0, 1, 1,
0.6384146, 0.03404143, -0.4235364, 0, 0, 0, 1, 1,
0.6434493, 1.556635, -0.5634909, 1, 1, 1, 1, 1,
0.6465165, -1.561356, 3.681426, 1, 1, 1, 1, 1,
0.6508086, -0.5351192, 2.006188, 1, 1, 1, 1, 1,
0.6517988, 0.8939, -0.3726797, 1, 1, 1, 1, 1,
0.6550861, 0.2223878, 0.1223203, 1, 1, 1, 1, 1,
0.6554672, -0.2489766, 1.93056, 1, 1, 1, 1, 1,
0.6556244, 0.5530652, 1.391085, 1, 1, 1, 1, 1,
0.6576181, 0.6906863, -0.1023213, 1, 1, 1, 1, 1,
0.6584632, -0.8521438, 3.909085, 1, 1, 1, 1, 1,
0.6607437, -1.301909, 4.022121, 1, 1, 1, 1, 1,
0.6625705, 0.1198695, 0.6882612, 1, 1, 1, 1, 1,
0.6625925, 1.048507, 0.7459357, 1, 1, 1, 1, 1,
0.6633044, -0.7028008, 2.619954, 1, 1, 1, 1, 1,
0.6655363, -0.4599009, 1.655815, 1, 1, 1, 1, 1,
0.6655627, 0.364872, 3.088475, 1, 1, 1, 1, 1,
0.6685485, -0.5497555, 2.42048, 0, 0, 1, 1, 1,
0.6698657, -0.1327536, 1.188388, 1, 0, 0, 1, 1,
0.6707679, 1.767662, -0.6645277, 1, 0, 0, 1, 1,
0.6718678, 0.8552359, 0.3777889, 1, 0, 0, 1, 1,
0.6719953, -0.4661759, 2.143802, 1, 0, 0, 1, 1,
0.6726484, 1.200454, -1.543716, 1, 0, 0, 1, 1,
0.6771477, -1.752311, 3.002067, 0, 0, 0, 1, 1,
0.6862824, -0.686714, 3.402493, 0, 0, 0, 1, 1,
0.6873155, -0.844252, 0.6633686, 0, 0, 0, 1, 1,
0.6898609, 1.171712, 1.198194, 0, 0, 0, 1, 1,
0.6921648, 0.09838896, 1.09718, 0, 0, 0, 1, 1,
0.6957687, 0.1918448, 0.5340065, 0, 0, 0, 1, 1,
0.6999962, 0.6283529, -0.22594, 0, 0, 0, 1, 1,
0.7040846, -1.05493, 4.089549, 1, 1, 1, 1, 1,
0.7089217, 0.1528926, 1.333313, 1, 1, 1, 1, 1,
0.7124611, -1.17972, 2.78716, 1, 1, 1, 1, 1,
0.715646, 0.3681757, 1.599899, 1, 1, 1, 1, 1,
0.7157218, 2.457461, 0.3820761, 1, 1, 1, 1, 1,
0.7192194, 2.457138, -0.03827494, 1, 1, 1, 1, 1,
0.7210124, 0.7958565, 2.565002, 1, 1, 1, 1, 1,
0.7280632, -0.6491618, 1.631448, 1, 1, 1, 1, 1,
0.7293255, -0.5857711, 1.98526, 1, 1, 1, 1, 1,
0.7294249, 1.661132, 0.8922399, 1, 1, 1, 1, 1,
0.7297716, 0.3534936, 1.605967, 1, 1, 1, 1, 1,
0.7387494, 1.825252, -0.309275, 1, 1, 1, 1, 1,
0.7463183, 0.2019204, 0.2222484, 1, 1, 1, 1, 1,
0.7467775, -0.7588375, 2.293988, 1, 1, 1, 1, 1,
0.7552768, -0.70788, 3.116074, 1, 1, 1, 1, 1,
0.7578873, -0.7848976, 2.710768, 0, 0, 1, 1, 1,
0.7748576, 0.04377767, 0.03562151, 1, 0, 0, 1, 1,
0.7765902, 0.09451534, 1.652593, 1, 0, 0, 1, 1,
0.778607, 0.5281352, 0.2617278, 1, 0, 0, 1, 1,
0.790694, -0.1572544, 1.792125, 1, 0, 0, 1, 1,
0.8032404, 1.971279, -0.2542276, 1, 0, 0, 1, 1,
0.8121382, -0.08389524, 1.046649, 0, 0, 0, 1, 1,
0.8210744, 0.8071605, 0.0938853, 0, 0, 0, 1, 1,
0.8229092, 0.9046741, 0.8480515, 0, 0, 0, 1, 1,
0.8246833, -0.912039, 2.260725, 0, 0, 0, 1, 1,
0.8257508, -0.01131087, 3.372369, 0, 0, 0, 1, 1,
0.8341626, -0.4682826, 2.792536, 0, 0, 0, 1, 1,
0.8358743, -1.422009, 2.432501, 0, 0, 0, 1, 1,
0.837573, -0.7633308, 2.443023, 1, 1, 1, 1, 1,
0.8386374, -1.082196, 2.41477, 1, 1, 1, 1, 1,
0.8413414, 0.549962, 1.435499, 1, 1, 1, 1, 1,
0.8447272, -0.8117124, 2.390315, 1, 1, 1, 1, 1,
0.8507244, -0.7038646, 2.328707, 1, 1, 1, 1, 1,
0.8607174, -0.2722345, 2.819096, 1, 1, 1, 1, 1,
0.8725356, 0.8754004, 1.672876, 1, 1, 1, 1, 1,
0.8788967, 0.3541155, 0.7127637, 1, 1, 1, 1, 1,
0.8790468, -0.685402, 1.913533, 1, 1, 1, 1, 1,
0.881373, 0.1855004, 1.775343, 1, 1, 1, 1, 1,
0.8917012, 1.300895, 0.7629517, 1, 1, 1, 1, 1,
0.8992443, 0.9119995, -0.9716229, 1, 1, 1, 1, 1,
0.9087691, 0.3702859, 2.316207, 1, 1, 1, 1, 1,
0.9111872, -0.06870048, 1.961336, 1, 1, 1, 1, 1,
0.9211048, -0.008879073, 0.0783054, 1, 1, 1, 1, 1,
0.9222476, -0.285173, 1.132497, 0, 0, 1, 1, 1,
0.9238456, 2.069724, 0.5863665, 1, 0, 0, 1, 1,
0.9247541, -1.363402, 0.09349398, 1, 0, 0, 1, 1,
0.9309076, 0.06017201, -0.1292707, 1, 0, 0, 1, 1,
0.9445766, -3.41468, 2.324033, 1, 0, 0, 1, 1,
0.9510458, 0.6637315, 0.05294539, 1, 0, 0, 1, 1,
0.9515855, 1.165635, 0.2168262, 0, 0, 0, 1, 1,
0.9521711, 0.9396573, 1.274447, 0, 0, 0, 1, 1,
0.9524408, 1.519901, 1.705269, 0, 0, 0, 1, 1,
0.9538937, -0.6999076, 3.150443, 0, 0, 0, 1, 1,
0.9576067, 0.7816285, 0.9522138, 0, 0, 0, 1, 1,
0.9591684, 0.08175594, 2.004686, 0, 0, 0, 1, 1,
0.9691314, 0.2681661, 2.386331, 0, 0, 0, 1, 1,
0.9701568, 1.255957, 1.260885, 1, 1, 1, 1, 1,
0.9711743, -0.07737318, 0.1918833, 1, 1, 1, 1, 1,
0.9744333, -0.9081962, 2.794903, 1, 1, 1, 1, 1,
0.9750748, -0.4568177, 3.199987, 1, 1, 1, 1, 1,
0.9792994, 0.9499738, 1.581391, 1, 1, 1, 1, 1,
0.9829016, 2.952614, 0.9234379, 1, 1, 1, 1, 1,
0.9886252, -0.1815806, 0.3441703, 1, 1, 1, 1, 1,
0.9930491, 0.3712915, 1.257134, 1, 1, 1, 1, 1,
0.9965408, 1.221962, 1.716454, 1, 1, 1, 1, 1,
1.001081, -1.041314, 4.173965, 1, 1, 1, 1, 1,
1.013692, -0.5932677, 0.6952415, 1, 1, 1, 1, 1,
1.022087, 1.107131, 0.8541747, 1, 1, 1, 1, 1,
1.027773, 0.8821711, 0.8021646, 1, 1, 1, 1, 1,
1.033057, -2.618209, 3.522294, 1, 1, 1, 1, 1,
1.036308, -0.2647464, 1.407301, 1, 1, 1, 1, 1,
1.049608, 0.2675377, 1.599015, 0, 0, 1, 1, 1,
1.058058, 0.2670546, 0.644153, 1, 0, 0, 1, 1,
1.060048, -0.229672, 2.969121, 1, 0, 0, 1, 1,
1.062886, 0.5552397, 0.5072732, 1, 0, 0, 1, 1,
1.064791, 1.9236, -0.1469496, 1, 0, 0, 1, 1,
1.067569, -0.5833057, 0.06466844, 1, 0, 0, 1, 1,
1.068221, 0.4267297, 3.788627, 0, 0, 0, 1, 1,
1.069085, 0.6226336, -0.8284796, 0, 0, 0, 1, 1,
1.0799, 0.2980736, 1.12108, 0, 0, 0, 1, 1,
1.080996, -0.4892208, 3.037617, 0, 0, 0, 1, 1,
1.085401, 1.274059, 2.450576, 0, 0, 0, 1, 1,
1.090525, 0.7411768, 1.766223, 0, 0, 0, 1, 1,
1.092302, 0.8129142, 1.262074, 0, 0, 0, 1, 1,
1.092781, -1.32253, 0.8573921, 1, 1, 1, 1, 1,
1.095438, 0.7703376, -0.04238422, 1, 1, 1, 1, 1,
1.096889, 0.6873688, 2.436911, 1, 1, 1, 1, 1,
1.097538, -0.5090085, -0.3551356, 1, 1, 1, 1, 1,
1.10373, -1.97693, 2.487352, 1, 1, 1, 1, 1,
1.109228, -0.03980678, 1.443844, 1, 1, 1, 1, 1,
1.110397, -0.4755553, 3.016748, 1, 1, 1, 1, 1,
1.112151, -0.7422892, 1.551599, 1, 1, 1, 1, 1,
1.121456, -0.2607618, 1.956825, 1, 1, 1, 1, 1,
1.123128, -0.2761959, 2.215698, 1, 1, 1, 1, 1,
1.134137, 0.7760117, 2.045865, 1, 1, 1, 1, 1,
1.139361, -2.366287, 2.741314, 1, 1, 1, 1, 1,
1.140715, 0.2743756, 1.061296, 1, 1, 1, 1, 1,
1.150046, 0.1327205, 1.937569, 1, 1, 1, 1, 1,
1.150941, -1.297308, 1.799335, 1, 1, 1, 1, 1,
1.151272, -0.2032374, 0.6522252, 0, 0, 1, 1, 1,
1.152253, 0.03262577, 2.311954, 1, 0, 0, 1, 1,
1.155212, -0.8340954, 1.264695, 1, 0, 0, 1, 1,
1.158808, -0.2989605, 3.106725, 1, 0, 0, 1, 1,
1.166165, -0.3696693, 2.468374, 1, 0, 0, 1, 1,
1.166988, 0.4901192, 1.074768, 1, 0, 0, 1, 1,
1.170075, -0.8077941, 1.68277, 0, 0, 0, 1, 1,
1.17702, -0.009813806, 0.4535779, 0, 0, 0, 1, 1,
1.197073, 0.5650573, 1.037125, 0, 0, 0, 1, 1,
1.198177, -1.377121, 0.3926792, 0, 0, 0, 1, 1,
1.200864, -0.3709038, 1.220405, 0, 0, 0, 1, 1,
1.204903, 0.6800825, -0.0459367, 0, 0, 0, 1, 1,
1.206805, 0.3668649, 0.8597074, 0, 0, 0, 1, 1,
1.211485, 0.7096876, 3.528246, 1, 1, 1, 1, 1,
1.211821, 0.4757446, 1.4904, 1, 1, 1, 1, 1,
1.216523, -1.345299, 1.797735, 1, 1, 1, 1, 1,
1.217155, 0.3150263, 0.9838827, 1, 1, 1, 1, 1,
1.232622, 0.1835446, 0.44517, 1, 1, 1, 1, 1,
1.233312, -0.2725756, 1.724539, 1, 1, 1, 1, 1,
1.236567, 1.897815, 1.281562, 1, 1, 1, 1, 1,
1.236786, -0.9479188, 0.5968909, 1, 1, 1, 1, 1,
1.245634, 0.7971731, 1.659449, 1, 1, 1, 1, 1,
1.249638, -0.4697975, 0.8157876, 1, 1, 1, 1, 1,
1.262346, 0.1613137, 0.8469369, 1, 1, 1, 1, 1,
1.263486, -0.3240857, 1.388391, 1, 1, 1, 1, 1,
1.266331, 0.889879, 0.458444, 1, 1, 1, 1, 1,
1.27181, -3.27974, 3.903869, 1, 1, 1, 1, 1,
1.273764, 0.970046, 2.590931, 1, 1, 1, 1, 1,
1.274442, -0.02907946, 1.248391, 0, 0, 1, 1, 1,
1.274613, 1.050119, 1.031149, 1, 0, 0, 1, 1,
1.276945, -1.399301, 3.092565, 1, 0, 0, 1, 1,
1.283978, -2.575651, 4.106381, 1, 0, 0, 1, 1,
1.287809, 0.2703736, 0.7471176, 1, 0, 0, 1, 1,
1.30157, -0.9679326, 3.047804, 1, 0, 0, 1, 1,
1.314237, 0.03083743, 0.7684504, 0, 0, 0, 1, 1,
1.324708, 0.7598414, -0.1264812, 0, 0, 0, 1, 1,
1.326907, 1.17076, 1.408031, 0, 0, 0, 1, 1,
1.335821, 1.524006, 1.153366, 0, 0, 0, 1, 1,
1.335966, 1.020354, 0.1920849, 0, 0, 0, 1, 1,
1.343351, 0.4857852, 2.234465, 0, 0, 0, 1, 1,
1.348681, -0.01943154, 3.476822, 0, 0, 0, 1, 1,
1.350197, -0.08700996, 2.593905, 1, 1, 1, 1, 1,
1.360518, 0.8052351, 1.512222, 1, 1, 1, 1, 1,
1.367312, 1.81256, 1.533478, 1, 1, 1, 1, 1,
1.37624, 1.245001, 0.7373716, 1, 1, 1, 1, 1,
1.378496, -2.432069, 1.855551, 1, 1, 1, 1, 1,
1.382122, -1.105777, 0.8890937, 1, 1, 1, 1, 1,
1.382411, 1.590654, 1.11803, 1, 1, 1, 1, 1,
1.383918, -1.981244, 3.869003, 1, 1, 1, 1, 1,
1.397849, 0.896405, 1.101942, 1, 1, 1, 1, 1,
1.400113, -1.648903, 2.872911, 1, 1, 1, 1, 1,
1.404887, -0.4953147, 2.815547, 1, 1, 1, 1, 1,
1.406724, -0.9373066, 1.911358, 1, 1, 1, 1, 1,
1.41472, 2.011174, 1.487053, 1, 1, 1, 1, 1,
1.421126, 1.913102, 1.490973, 1, 1, 1, 1, 1,
1.42813, -0.8884093, 2.423893, 1, 1, 1, 1, 1,
1.439504, 1.02525, 2.437219, 0, 0, 1, 1, 1,
1.455761, -0.8393409, 0.2303, 1, 0, 0, 1, 1,
1.457421, 1.076424, 0.70928, 1, 0, 0, 1, 1,
1.479895, 1.254751, 1.754153, 1, 0, 0, 1, 1,
1.489144, -0.8181337, 1.368677, 1, 0, 0, 1, 1,
1.506142, 0.6808818, 0.7335933, 1, 0, 0, 1, 1,
1.506323, 0.492316, 1.978555, 0, 0, 0, 1, 1,
1.511454, -0.4425965, 0.7904208, 0, 0, 0, 1, 1,
1.513581, -1.395071, 4.069448, 0, 0, 0, 1, 1,
1.520518, -0.3418057, 3.840852, 0, 0, 0, 1, 1,
1.526574, -0.421162, 0.3665713, 0, 0, 0, 1, 1,
1.534631, -0.6803245, 2.789447, 0, 0, 0, 1, 1,
1.536133, -0.08968183, 1.878177, 0, 0, 0, 1, 1,
1.543984, 0.4231675, 1.406924, 1, 1, 1, 1, 1,
1.544795, 0.957328, 1.894479, 1, 1, 1, 1, 1,
1.549641, 0.8161055, 1.975928, 1, 1, 1, 1, 1,
1.552099, -1.151394, 1.473997, 1, 1, 1, 1, 1,
1.552538, 0.2773187, 0.7817221, 1, 1, 1, 1, 1,
1.560596, -1.019089, 2.728449, 1, 1, 1, 1, 1,
1.577269, 0.5096508, 1.470894, 1, 1, 1, 1, 1,
1.581281, -1.082022, 3.439745, 1, 1, 1, 1, 1,
1.589056, 2.101767, 1.314461, 1, 1, 1, 1, 1,
1.589838, -1.353169, 1.667455, 1, 1, 1, 1, 1,
1.593237, 0.1366245, 1.446042, 1, 1, 1, 1, 1,
1.599748, -1.65097, 1.115564, 1, 1, 1, 1, 1,
1.601501, -0.9782727, 2.801409, 1, 1, 1, 1, 1,
1.602625, 0.7260875, 0.2833854, 1, 1, 1, 1, 1,
1.621003, -1.624588, 2.094624, 1, 1, 1, 1, 1,
1.622746, 0.274029, 1.663471, 0, 0, 1, 1, 1,
1.636992, -1.009351, 1.78797, 1, 0, 0, 1, 1,
1.638835, 0.4028374, 0.8824075, 1, 0, 0, 1, 1,
1.659387, 2.556949, 0.7051423, 1, 0, 0, 1, 1,
1.670341, -2.370678, 2.746334, 1, 0, 0, 1, 1,
1.691969, -1.526419, 1.542891, 1, 0, 0, 1, 1,
1.700328, -1.873812, 3.328536, 0, 0, 0, 1, 1,
1.70377, 1.55293, -0.3177285, 0, 0, 0, 1, 1,
1.732444, 1.509746, 0.8690112, 0, 0, 0, 1, 1,
1.743081, -0.9614372, 0.564727, 0, 0, 0, 1, 1,
1.76991, -2.192334, 3.686282, 0, 0, 0, 1, 1,
1.772357, -0.1519802, 1.454627, 0, 0, 0, 1, 1,
1.78855, 1.727696, 1.180003, 0, 0, 0, 1, 1,
1.79383, -1.112275, 1.293055, 1, 1, 1, 1, 1,
1.796969, -0.8820534, 2.758286, 1, 1, 1, 1, 1,
1.798109, 0.1263993, 0.2560014, 1, 1, 1, 1, 1,
1.809273, 0.2646024, 1.384633, 1, 1, 1, 1, 1,
1.825737, 0.5008606, 1.454793, 1, 1, 1, 1, 1,
1.829055, -2.004128, 1.680667, 1, 1, 1, 1, 1,
1.830772, -0.4908195, 1.518388, 1, 1, 1, 1, 1,
1.840459, -0.7507837, 3.135989, 1, 1, 1, 1, 1,
1.845629, -1.050658, 2.055706, 1, 1, 1, 1, 1,
1.850096, 1.126263, 1.652441, 1, 1, 1, 1, 1,
1.863521, 1.633166, 1.542341, 1, 1, 1, 1, 1,
1.920534, -0.8545895, 0.01915228, 1, 1, 1, 1, 1,
1.94167, -0.7167028, 1.642736, 1, 1, 1, 1, 1,
1.955868, -0.06985575, 2.035788, 1, 1, 1, 1, 1,
1.976366, 0.07235843, 2.300755, 1, 1, 1, 1, 1,
1.989962, -0.8727955, 1.707848, 0, 0, 1, 1, 1,
1.993973, -0.752336, 1.404617, 1, 0, 0, 1, 1,
2.049964, 0.04968463, 2.441835, 1, 0, 0, 1, 1,
2.062369, 0.8593658, 1.677152, 1, 0, 0, 1, 1,
2.11457, 1.460939, -1.179377, 1, 0, 0, 1, 1,
2.12073, 1.388391, 2.143915, 1, 0, 0, 1, 1,
2.147077, -0.4028529, 1.029108, 0, 0, 0, 1, 1,
2.188739, -1.395707, 1.185824, 0, 0, 0, 1, 1,
2.229759, 0.2771314, 1.888724, 0, 0, 0, 1, 1,
2.262411, 1.714307, 1.738112, 0, 0, 0, 1, 1,
2.309473, 0.8493587, 1.193496, 0, 0, 0, 1, 1,
2.31214, -0.2682923, 0.3770843, 0, 0, 0, 1, 1,
2.337137, -0.3893994, 2.943714, 0, 0, 0, 1, 1,
2.365512, -0.7042042, 1.222777, 1, 1, 1, 1, 1,
2.388704, -0.4023156, 2.546604, 1, 1, 1, 1, 1,
2.491948, 1.444403, 2.270218, 1, 1, 1, 1, 1,
2.541895, -0.5751643, 1.692508, 1, 1, 1, 1, 1,
2.675055, -0.0076986, 2.758882, 1, 1, 1, 1, 1,
2.745286, 0.849512, -0.4982937, 1, 1, 1, 1, 1,
3.038356, 0.9749548, 2.047945, 1, 1, 1, 1, 1
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
var radius = 9.497593;
var distance = 33.35989;
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
mvMatrix.translate( 0.01629472, 0.05183506, 0.1275961 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.35989);
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
