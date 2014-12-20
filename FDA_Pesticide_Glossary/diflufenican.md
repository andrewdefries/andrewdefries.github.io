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
-2.985708, -1.151031, -1.836543, 1, 0, 0, 1,
-2.842796, 0.803708, -2.336325, 1, 0.007843138, 0, 1,
-2.829055, -0.706009, -1.459867, 1, 0.01176471, 0, 1,
-2.743583, 0.6443923, -2.361277, 1, 0.01960784, 0, 1,
-2.743298, -0.003711171, -2.961911, 1, 0.02352941, 0, 1,
-2.569161, -1.176544, -3.278803, 1, 0.03137255, 0, 1,
-2.561226, -0.6575276, -1.976236, 1, 0.03529412, 0, 1,
-2.525715, 1.38399, -1.062719, 1, 0.04313726, 0, 1,
-2.472569, 0.8652085, -3.187079, 1, 0.04705882, 0, 1,
-2.426471, 0.2367318, -1.511625, 1, 0.05490196, 0, 1,
-2.279248, -0.0378357, -0.8786755, 1, 0.05882353, 0, 1,
-2.257865, 1.13998, -1.42219, 1, 0.06666667, 0, 1,
-2.230321, -0.9882537, -3.841902, 1, 0.07058824, 0, 1,
-2.225916, -0.5294159, -2.727156, 1, 0.07843138, 0, 1,
-2.222044, 0.6831607, -1.33489, 1, 0.08235294, 0, 1,
-2.209336, 2.048315, 0.8394651, 1, 0.09019608, 0, 1,
-2.184734, -0.3691696, -1.539643, 1, 0.09411765, 0, 1,
-2.181328, -0.6650751, -1.08416, 1, 0.1019608, 0, 1,
-2.163982, 1.826545, -3.723965, 1, 0.1098039, 0, 1,
-2.120479, -0.3973946, -1.760496, 1, 0.1137255, 0, 1,
-2.066124, 0.5635862, -2.005712, 1, 0.1215686, 0, 1,
-2.045151, 0.5263081, -1.561179, 1, 0.1254902, 0, 1,
-2.04292, 1.319644, -0.6256326, 1, 0.1333333, 0, 1,
-2.027161, 0.7660248, -1.300848, 1, 0.1372549, 0, 1,
-2.000811, -0.3171951, -0.3405864, 1, 0.145098, 0, 1,
-1.991334, -0.6334845, -2.383805, 1, 0.1490196, 0, 1,
-1.97027, 0.4763864, -0.5189112, 1, 0.1568628, 0, 1,
-1.968564, 0.514948, -1.484536, 1, 0.1607843, 0, 1,
-1.96623, -0.006232074, -1.173549, 1, 0.1686275, 0, 1,
-1.937163, 1.399703, -0.2940534, 1, 0.172549, 0, 1,
-1.933004, -1.012634, -0.3200592, 1, 0.1803922, 0, 1,
-1.931696, -1.331094, -4.365997, 1, 0.1843137, 0, 1,
-1.918246, 0.05035865, -1.890538, 1, 0.1921569, 0, 1,
-1.899868, -1.57123, -4.552691, 1, 0.1960784, 0, 1,
-1.887902, -0.5523085, -3.703473, 1, 0.2039216, 0, 1,
-1.885124, -0.7458052, -2.310568, 1, 0.2117647, 0, 1,
-1.859019, -1.640103, -2.143503, 1, 0.2156863, 0, 1,
-1.854695, 0.1509535, 0.129599, 1, 0.2235294, 0, 1,
-1.844663, 1.419445, -1.171705, 1, 0.227451, 0, 1,
-1.843941, 0.8381716, -3.359462, 1, 0.2352941, 0, 1,
-1.840532, -1.46523, -1.335352, 1, 0.2392157, 0, 1,
-1.8254, 0.3113679, -3.877138, 1, 0.2470588, 0, 1,
-1.81483, -0.0410208, -3.163671, 1, 0.2509804, 0, 1,
-1.777262, 0.8217468, -0.6659012, 1, 0.2588235, 0, 1,
-1.762331, -0.4057399, -1.908478, 1, 0.2627451, 0, 1,
-1.762312, 0.9047378, -0.3855039, 1, 0.2705882, 0, 1,
-1.726599, -0.3195213, -1.519244, 1, 0.2745098, 0, 1,
-1.726132, -1.739371, -3.267287, 1, 0.282353, 0, 1,
-1.717695, -0.4476267, -1.178177, 1, 0.2862745, 0, 1,
-1.713048, 0.766286, -0.9770716, 1, 0.2941177, 0, 1,
-1.708386, -0.343787, -3.494757, 1, 0.3019608, 0, 1,
-1.699504, 1.450375, -0.7935696, 1, 0.3058824, 0, 1,
-1.687974, 0.0951999, -1.425358, 1, 0.3137255, 0, 1,
-1.687416, -0.3115816, -1.586671, 1, 0.3176471, 0, 1,
-1.681265, -1.108371, -2.360439, 1, 0.3254902, 0, 1,
-1.672924, -0.8526221, -3.321605, 1, 0.3294118, 0, 1,
-1.668072, 0.3787403, -1.99198, 1, 0.3372549, 0, 1,
-1.667706, -0.236882, -2.710749, 1, 0.3411765, 0, 1,
-1.643141, 1.007859, -1.891954, 1, 0.3490196, 0, 1,
-1.635189, -0.02071925, -3.413912, 1, 0.3529412, 0, 1,
-1.631537, 0.9823068, -1.428673, 1, 0.3607843, 0, 1,
-1.629751, -0.3448591, 0.7189295, 1, 0.3647059, 0, 1,
-1.624503, 0.183683, -1.260627, 1, 0.372549, 0, 1,
-1.62301, 0.4488111, -0.6538523, 1, 0.3764706, 0, 1,
-1.615627, 0.6100093, -3.639488, 1, 0.3843137, 0, 1,
-1.615448, -0.559692, -2.064592, 1, 0.3882353, 0, 1,
-1.603774, 0.1351931, -2.259039, 1, 0.3960784, 0, 1,
-1.577098, 1.26038, -0.8881068, 1, 0.4039216, 0, 1,
-1.572922, 1.352029, 0.1074822, 1, 0.4078431, 0, 1,
-1.56484, 1.271125, -1.911384, 1, 0.4156863, 0, 1,
-1.560454, 0.2163805, -3.303933, 1, 0.4196078, 0, 1,
-1.543548, 1.810812, -1.203722, 1, 0.427451, 0, 1,
-1.535993, -0.7062685, -2.126939, 1, 0.4313726, 0, 1,
-1.532716, -1.109745, -1.584018, 1, 0.4392157, 0, 1,
-1.529339, -1.438345, -3.952696, 1, 0.4431373, 0, 1,
-1.510524, -0.5317177, -2.389667, 1, 0.4509804, 0, 1,
-1.491364, 0.2259761, -2.037714, 1, 0.454902, 0, 1,
-1.477911, -0.888989, 0.4845223, 1, 0.4627451, 0, 1,
-1.473137, -0.350171, -2.534277, 1, 0.4666667, 0, 1,
-1.458581, 1.824038, 0.2093562, 1, 0.4745098, 0, 1,
-1.455945, -0.8746076, -2.808895, 1, 0.4784314, 0, 1,
-1.436811, 0.4457338, -2.211994, 1, 0.4862745, 0, 1,
-1.416712, 0.895132, -0.5142984, 1, 0.4901961, 0, 1,
-1.399759, -0.6612809, -0.0004930184, 1, 0.4980392, 0, 1,
-1.399348, 0.3179278, -1.89502, 1, 0.5058824, 0, 1,
-1.38801, -1.219543, -2.341936, 1, 0.509804, 0, 1,
-1.374021, 0.4597732, -0.4076364, 1, 0.5176471, 0, 1,
-1.365203, 1.027894, -1.837912, 1, 0.5215687, 0, 1,
-1.358097, -0.0417907, 0.09926872, 1, 0.5294118, 0, 1,
-1.349682, -1.378755, -2.41072, 1, 0.5333334, 0, 1,
-1.348044, 0.1482331, -2.485378, 1, 0.5411765, 0, 1,
-1.348035, -0.1662211, 0.05693308, 1, 0.5450981, 0, 1,
-1.343957, 0.4068978, -2.580468, 1, 0.5529412, 0, 1,
-1.33887, -0.0910553, -1.007965, 1, 0.5568628, 0, 1,
-1.337662, -1.6112, -2.779813, 1, 0.5647059, 0, 1,
-1.310372, -1.392112, -2.735146, 1, 0.5686275, 0, 1,
-1.309835, 0.6727548, 0.7333903, 1, 0.5764706, 0, 1,
-1.307634, -0.7600913, -0.9337587, 1, 0.5803922, 0, 1,
-1.303962, -0.8866021, -1.802499, 1, 0.5882353, 0, 1,
-1.29858, -0.9854958, -1.565069, 1, 0.5921569, 0, 1,
-1.297449, 0.9369115, -1.260178, 1, 0.6, 0, 1,
-1.2908, 0.04130884, -2.787418, 1, 0.6078432, 0, 1,
-1.284582, -0.04121426, -0.3011078, 1, 0.6117647, 0, 1,
-1.280501, 0.1819398, -1.162106, 1, 0.6196079, 0, 1,
-1.273063, 0.6013408, -2.011256, 1, 0.6235294, 0, 1,
-1.273033, 0.9032352, -0.5128663, 1, 0.6313726, 0, 1,
-1.266766, -0.7194506, -4.546807, 1, 0.6352941, 0, 1,
-1.257089, -0.4148969, -3.421131, 1, 0.6431373, 0, 1,
-1.256306, -1.90638, -2.676002, 1, 0.6470588, 0, 1,
-1.252942, -0.9105413, -2.380484, 1, 0.654902, 0, 1,
-1.251835, -0.8849102, -2.224002, 1, 0.6588235, 0, 1,
-1.25158, -0.6089611, -4.514133, 1, 0.6666667, 0, 1,
-1.245245, -0.5527975, -1.231787, 1, 0.6705883, 0, 1,
-1.235228, -0.2511407, -2.529254, 1, 0.6784314, 0, 1,
-1.223809, -0.02728885, -1.472889, 1, 0.682353, 0, 1,
-1.220789, 1.095033, 0.2367856, 1, 0.6901961, 0, 1,
-1.219779, 0.7478608, -1.564786, 1, 0.6941177, 0, 1,
-1.219337, 1.839491, -1.003331, 1, 0.7019608, 0, 1,
-1.206924, 0.05355507, -3.877701, 1, 0.7098039, 0, 1,
-1.197196, -0.1212877, -3.008116, 1, 0.7137255, 0, 1,
-1.191119, -0.9911616, -2.552869, 1, 0.7215686, 0, 1,
-1.18697, -1.627497, -2.142296, 1, 0.7254902, 0, 1,
-1.185474, -0.5311863, -1.849816, 1, 0.7333333, 0, 1,
-1.184613, -0.1439503, -1.403003, 1, 0.7372549, 0, 1,
-1.184173, 0.6132374, -2.085285, 1, 0.7450981, 0, 1,
-1.182058, 1.006088, -1.032968, 1, 0.7490196, 0, 1,
-1.180645, -0.7201027, -0.7968466, 1, 0.7568628, 0, 1,
-1.178168, -2.998697, -4.483211, 1, 0.7607843, 0, 1,
-1.173759, 0.0889275, -1.127429, 1, 0.7686275, 0, 1,
-1.170209, 0.576957, -2.031154, 1, 0.772549, 0, 1,
-1.168124, -0.4390646, -1.606734, 1, 0.7803922, 0, 1,
-1.139245, -1.364431, -1.951507, 1, 0.7843137, 0, 1,
-1.136137, 0.2299921, -1.929385, 1, 0.7921569, 0, 1,
-1.133037, -0.03827048, -1.663803, 1, 0.7960784, 0, 1,
-1.131136, 0.2650614, -1.2238, 1, 0.8039216, 0, 1,
-1.127045, -0.8113589, -0.3115191, 1, 0.8117647, 0, 1,
-1.124681, -0.08238029, -2.432205, 1, 0.8156863, 0, 1,
-1.123622, -0.9449561, -1.758142, 1, 0.8235294, 0, 1,
-1.112703, -0.4880616, -1.503404, 1, 0.827451, 0, 1,
-1.110558, -1.824767, -2.948326, 1, 0.8352941, 0, 1,
-1.10417, 2.306784, 0.9691303, 1, 0.8392157, 0, 1,
-1.103975, 1.770986, -0.2313621, 1, 0.8470588, 0, 1,
-1.103296, -0.3623942, -2.153332, 1, 0.8509804, 0, 1,
-1.097912, -1.351345, -2.833586, 1, 0.8588235, 0, 1,
-1.091368, 0.4294223, -2.192636, 1, 0.8627451, 0, 1,
-1.084875, 0.2391785, -2.576301, 1, 0.8705882, 0, 1,
-1.076548, -2.000225, -2.415856, 1, 0.8745098, 0, 1,
-1.076028, -1.168885, -3.351048, 1, 0.8823529, 0, 1,
-1.074, 0.7020109, -1.538803, 1, 0.8862745, 0, 1,
-1.070427, 0.05721217, -1.19741, 1, 0.8941177, 0, 1,
-1.066509, 0.8227675, -1.5984, 1, 0.8980392, 0, 1,
-1.065456, 1.514774, 2.515281, 1, 0.9058824, 0, 1,
-1.06536, 0.245935, 1.26386, 1, 0.9137255, 0, 1,
-1.062598, 0.7368344, -0.8108321, 1, 0.9176471, 0, 1,
-1.059201, -0.9918859, -1.628789, 1, 0.9254902, 0, 1,
-1.058268, 1.019391, -2.94957, 1, 0.9294118, 0, 1,
-1.057592, 0.1804753, -1.291325, 1, 0.9372549, 0, 1,
-1.056575, 1.531039, -1.126023, 1, 0.9411765, 0, 1,
-1.056097, 2.126108, -1.169697, 1, 0.9490196, 0, 1,
-1.055363, -1.347711, -2.16599, 1, 0.9529412, 0, 1,
-1.054579, -0.4810061, -2.143697, 1, 0.9607843, 0, 1,
-1.049896, -2.718492, -5.323974, 1, 0.9647059, 0, 1,
-1.041207, -0.2007786, -1.684571, 1, 0.972549, 0, 1,
-1.032903, 1.620574, 0.5476283, 1, 0.9764706, 0, 1,
-1.031676, 0.6475905, -0.4052592, 1, 0.9843137, 0, 1,
-1.021448, 0.6543918, -2.330589, 1, 0.9882353, 0, 1,
-1.011389, 0.2252696, -1.346537, 1, 0.9960784, 0, 1,
-1.009424, -0.1390157, -1.150408, 0.9960784, 1, 0, 1,
-0.99647, -0.9622665, -4.099501, 0.9921569, 1, 0, 1,
-0.9955791, 0.05012211, -0.53861, 0.9843137, 1, 0, 1,
-0.9863878, -0.3584943, -0.9716607, 0.9803922, 1, 0, 1,
-0.9845412, 1.094333, 2.103316, 0.972549, 1, 0, 1,
-0.9680041, 0.7447151, 1.007002, 0.9686275, 1, 0, 1,
-0.9679861, -0.2159131, -1.686498, 0.9607843, 1, 0, 1,
-0.9614825, 2.794617, -0.6732479, 0.9568627, 1, 0, 1,
-0.9604548, -1.506345, -0.7521833, 0.9490196, 1, 0, 1,
-0.9507381, -0.4603644, -0.715878, 0.945098, 1, 0, 1,
-0.9459321, 0.2073743, -1.406782, 0.9372549, 1, 0, 1,
-0.9447995, 1.88238, -0.3515718, 0.9333333, 1, 0, 1,
-0.9410322, -1.13414, -2.584298, 0.9254902, 1, 0, 1,
-0.9267173, 1.130188, 0.2295584, 0.9215686, 1, 0, 1,
-0.926479, -0.232425, -1.370284, 0.9137255, 1, 0, 1,
-0.9215822, -0.6557024, -1.163599, 0.9098039, 1, 0, 1,
-0.9198377, 0.8365021, -1.381806, 0.9019608, 1, 0, 1,
-0.9132368, 0.1553778, -1.366308, 0.8941177, 1, 0, 1,
-0.9128112, 1.336705, 0.5175637, 0.8901961, 1, 0, 1,
-0.9059637, -0.8519434, -2.664876, 0.8823529, 1, 0, 1,
-0.8931799, -1.090434, -1.556835, 0.8784314, 1, 0, 1,
-0.8887722, -1.168188, -3.531712, 0.8705882, 1, 0, 1,
-0.888675, -0.7340643, -2.710045, 0.8666667, 1, 0, 1,
-0.8863351, -0.4592434, -3.210193, 0.8588235, 1, 0, 1,
-0.8857058, 1.833148, -1.352284, 0.854902, 1, 0, 1,
-0.8854243, 0.02486021, -0.6956078, 0.8470588, 1, 0, 1,
-0.8833292, -0.6164557, -2.130558, 0.8431373, 1, 0, 1,
-0.8820038, -0.3362754, -1.810619, 0.8352941, 1, 0, 1,
-0.8772088, 1.397772, 0.9329075, 0.8313726, 1, 0, 1,
-0.8767672, 0.4664613, -1.956426, 0.8235294, 1, 0, 1,
-0.8766117, 0.4962353, -1.970097, 0.8196079, 1, 0, 1,
-0.8752258, 0.4722652, -0.8531372, 0.8117647, 1, 0, 1,
-0.8730256, 1.101333, -1.165173, 0.8078431, 1, 0, 1,
-0.8726571, 0.6909959, -1.249111, 0.8, 1, 0, 1,
-0.8699591, 0.006320216, -1.281153, 0.7921569, 1, 0, 1,
-0.8613268, 0.2788535, -0.9735476, 0.7882353, 1, 0, 1,
-0.860593, -0.2129725, -1.428183, 0.7803922, 1, 0, 1,
-0.8604097, -0.5220868, -2.728783, 0.7764706, 1, 0, 1,
-0.8589359, 2.357615, 0.2905757, 0.7686275, 1, 0, 1,
-0.8582062, 1.508905, -1.075865, 0.7647059, 1, 0, 1,
-0.8580639, -0.2043685, -1.08018, 0.7568628, 1, 0, 1,
-0.8541477, -0.6554285, -1.398911, 0.7529412, 1, 0, 1,
-0.8513228, -0.07791156, -2.000853, 0.7450981, 1, 0, 1,
-0.8491097, 0.3797914, -0.7985842, 0.7411765, 1, 0, 1,
-0.8439664, -0.744058, -2.930889, 0.7333333, 1, 0, 1,
-0.835656, 0.5958303, -1.223762, 0.7294118, 1, 0, 1,
-0.826539, -2.656127, -4.334279, 0.7215686, 1, 0, 1,
-0.8176324, -0.1647913, -0.940546, 0.7176471, 1, 0, 1,
-0.8170426, 2.575977, 0.2423652, 0.7098039, 1, 0, 1,
-0.8101851, -1.201553, -2.642856, 0.7058824, 1, 0, 1,
-0.8083872, 1.331407, -2.402337, 0.6980392, 1, 0, 1,
-0.8050774, -0.5759209, -2.786866, 0.6901961, 1, 0, 1,
-0.7980146, -0.108134, -2.869234, 0.6862745, 1, 0, 1,
-0.7950307, 0.1890443, -2.85184, 0.6784314, 1, 0, 1,
-0.7915636, -0.4971355, -1.13816, 0.6745098, 1, 0, 1,
-0.7906026, 0.4875989, 1.104173, 0.6666667, 1, 0, 1,
-0.7905928, 0.2821063, -2.217747, 0.6627451, 1, 0, 1,
-0.7838521, -0.8499803, -3.034348, 0.654902, 1, 0, 1,
-0.7825096, -0.5952055, -1.79371, 0.6509804, 1, 0, 1,
-0.781606, 1.370048, -0.161242, 0.6431373, 1, 0, 1,
-0.7800466, 0.4760195, -0.5465035, 0.6392157, 1, 0, 1,
-0.7792631, -0.8048335, -1.616999, 0.6313726, 1, 0, 1,
-0.7790748, -0.4841868, -0.8272274, 0.627451, 1, 0, 1,
-0.7786556, 0.2155416, -0.3071208, 0.6196079, 1, 0, 1,
-0.7750116, -0.3765126, -2.435829, 0.6156863, 1, 0, 1,
-0.7731775, -1.073883, -2.634423, 0.6078432, 1, 0, 1,
-0.7707257, -0.793903, -2.672626, 0.6039216, 1, 0, 1,
-0.7696199, 1.150698, -2.070102, 0.5960785, 1, 0, 1,
-0.7639292, -0.5653526, -3.449564, 0.5882353, 1, 0, 1,
-0.7629611, -0.5721317, -2.6269, 0.5843138, 1, 0, 1,
-0.7619751, 0.618148, -1.998741, 0.5764706, 1, 0, 1,
-0.7619209, -1.43583, -2.934022, 0.572549, 1, 0, 1,
-0.7556514, -1.659328, -3.137604, 0.5647059, 1, 0, 1,
-0.7515577, 1.325002, 0.299648, 0.5607843, 1, 0, 1,
-0.7493619, -0.1955114, -2.029559, 0.5529412, 1, 0, 1,
-0.7482454, 0.4100763, 1.174534, 0.5490196, 1, 0, 1,
-0.7458541, -0.3645471, -0.1064488, 0.5411765, 1, 0, 1,
-0.7423443, -0.3956289, -2.651695, 0.5372549, 1, 0, 1,
-0.7405193, -1.061899, -1.643646, 0.5294118, 1, 0, 1,
-0.7399491, -1.525038, -3.851871, 0.5254902, 1, 0, 1,
-0.737485, -0.1379195, -3.194432, 0.5176471, 1, 0, 1,
-0.7372763, 0.01340374, -2.216116, 0.5137255, 1, 0, 1,
-0.7346706, -1.840487, -2.16612, 0.5058824, 1, 0, 1,
-0.7295626, 0.7270928, 0.0125316, 0.5019608, 1, 0, 1,
-0.7254158, 1.153458, 0.2241585, 0.4941176, 1, 0, 1,
-0.7198264, -0.6365412, -2.515248, 0.4862745, 1, 0, 1,
-0.7179527, -0.4734323, -1.638228, 0.4823529, 1, 0, 1,
-0.7174149, 0.6155764, -1.691597, 0.4745098, 1, 0, 1,
-0.7101021, -1.259043, -1.875684, 0.4705882, 1, 0, 1,
-0.7065408, 0.3920328, -1.990161, 0.4627451, 1, 0, 1,
-0.7058527, 1.564375, 1.23441, 0.4588235, 1, 0, 1,
-0.7005184, 0.741958, -0.5176604, 0.4509804, 1, 0, 1,
-0.6989357, 0.8108624, 0.7474735, 0.4470588, 1, 0, 1,
-0.6979766, 0.236688, -2.720952, 0.4392157, 1, 0, 1,
-0.6969767, 0.1274911, -3.288897, 0.4352941, 1, 0, 1,
-0.6946424, 0.1304344, -2.09319, 0.427451, 1, 0, 1,
-0.6778937, -0.8812803, -1.455848, 0.4235294, 1, 0, 1,
-0.6751211, -0.0564108, -0.5058941, 0.4156863, 1, 0, 1,
-0.6710814, 0.965732, -0.2401144, 0.4117647, 1, 0, 1,
-0.6695582, -0.1102178, -0.8209485, 0.4039216, 1, 0, 1,
-0.6671543, 0.0289372, -1.749453, 0.3960784, 1, 0, 1,
-0.662863, 0.1568553, -0.05194483, 0.3921569, 1, 0, 1,
-0.6625543, 0.0831093, -1.059045, 0.3843137, 1, 0, 1,
-0.6583466, -1.355318, -5.653389, 0.3803922, 1, 0, 1,
-0.6566919, 0.05402897, -2.240072, 0.372549, 1, 0, 1,
-0.6490315, -1.617118, -1.715539, 0.3686275, 1, 0, 1,
-0.644343, 0.8610078, -1.276711, 0.3607843, 1, 0, 1,
-0.6434964, -0.2869059, -1.186712, 0.3568628, 1, 0, 1,
-0.6433293, 1.506164, -1.110233, 0.3490196, 1, 0, 1,
-0.638885, -0.4766374, -0.3995014, 0.345098, 1, 0, 1,
-0.6367418, 0.97037, -0.8495725, 0.3372549, 1, 0, 1,
-0.6358716, 0.5530747, -0.9040671, 0.3333333, 1, 0, 1,
-0.6341279, -0.1345355, -3.194271, 0.3254902, 1, 0, 1,
-0.6267584, 0.07483922, -0.6785634, 0.3215686, 1, 0, 1,
-0.6252511, -0.03384593, -1.240207, 0.3137255, 1, 0, 1,
-0.6199169, 1.052448, 0.8584258, 0.3098039, 1, 0, 1,
-0.6194441, -0.1945328, -2.019083, 0.3019608, 1, 0, 1,
-0.6155809, 0.4209166, -1.509025, 0.2941177, 1, 0, 1,
-0.6130769, -1.091016, -2.623259, 0.2901961, 1, 0, 1,
-0.6107168, -0.2360648, -0.3202498, 0.282353, 1, 0, 1,
-0.6088405, 0.4843242, -1.095518, 0.2784314, 1, 0, 1,
-0.6067249, 1.843836, 0.5774826, 0.2705882, 1, 0, 1,
-0.6064873, 0.5580587, -0.1262078, 0.2666667, 1, 0, 1,
-0.603315, -0.3443197, -3.395341, 0.2588235, 1, 0, 1,
-0.6015638, 0.3599334, -2.273832, 0.254902, 1, 0, 1,
-0.597191, -1.674657, -3.295178, 0.2470588, 1, 0, 1,
-0.5951574, 1.470497, -0.7415054, 0.2431373, 1, 0, 1,
-0.5885617, -1.001197, -2.960664, 0.2352941, 1, 0, 1,
-0.5876243, 0.6134338, -2.719958, 0.2313726, 1, 0, 1,
-0.5809425, 0.5792315, -0.520897, 0.2235294, 1, 0, 1,
-0.5801743, 0.01595889, -3.466499, 0.2196078, 1, 0, 1,
-0.5772216, -1.910745, -3.436599, 0.2117647, 1, 0, 1,
-0.5749853, -1.533244, -2.647002, 0.2078431, 1, 0, 1,
-0.571382, 1.154793, 0.1328123, 0.2, 1, 0, 1,
-0.5706396, -1.062484, -1.593255, 0.1921569, 1, 0, 1,
-0.5699619, -1.424038, -2.051098, 0.1882353, 1, 0, 1,
-0.5695509, -0.2195974, -0.7575419, 0.1803922, 1, 0, 1,
-0.5681917, 1.192851, -1.533906, 0.1764706, 1, 0, 1,
-0.5662805, -1.193273, -2.503632, 0.1686275, 1, 0, 1,
-0.5593827, -1.125212, -1.165411, 0.1647059, 1, 0, 1,
-0.5581397, 1.827911, -1.05275, 0.1568628, 1, 0, 1,
-0.5581288, 0.3516183, -0.6406043, 0.1529412, 1, 0, 1,
-0.5565885, 0.3673084, -0.2940306, 0.145098, 1, 0, 1,
-0.5533134, 1.264313, 0.1901363, 0.1411765, 1, 0, 1,
-0.551023, -0.7541423, -1.732645, 0.1333333, 1, 0, 1,
-0.5494257, 0.331997, -0.7283776, 0.1294118, 1, 0, 1,
-0.5448799, -1.734007, -2.038068, 0.1215686, 1, 0, 1,
-0.5423474, -0.5313501, -2.68101, 0.1176471, 1, 0, 1,
-0.5410461, 0.5635654, 0.1934833, 0.1098039, 1, 0, 1,
-0.5286583, -1.061135, -2.98821, 0.1058824, 1, 0, 1,
-0.5225025, -1.772405, -2.629887, 0.09803922, 1, 0, 1,
-0.5122553, 0.7101738, -0.6684003, 0.09019608, 1, 0, 1,
-0.5108644, -2.453171, -1.983859, 0.08627451, 1, 0, 1,
-0.5098474, -2.064875, -4.606172, 0.07843138, 1, 0, 1,
-0.5062538, -0.8712021, -1.318723, 0.07450981, 1, 0, 1,
-0.5021387, -1.050509, -2.08846, 0.06666667, 1, 0, 1,
-0.5019493, -0.5339876, -2.090266, 0.0627451, 1, 0, 1,
-0.4998867, -0.2695698, -3.37432, 0.05490196, 1, 0, 1,
-0.4965518, -0.9381883, -2.895551, 0.05098039, 1, 0, 1,
-0.4947219, -0.1747996, -0.7620934, 0.04313726, 1, 0, 1,
-0.4848692, 0.5429133, 1.11892, 0.03921569, 1, 0, 1,
-0.4822543, -0.8824903, -1.812223, 0.03137255, 1, 0, 1,
-0.4757508, 0.5839345, -1.408629, 0.02745098, 1, 0, 1,
-0.4742945, 1.825197, -1.562841, 0.01960784, 1, 0, 1,
-0.4675257, -0.9170774, -4.131654, 0.01568628, 1, 0, 1,
-0.4619434, -1.061101, -2.429277, 0.007843138, 1, 0, 1,
-0.459089, -1.803799, -3.415966, 0.003921569, 1, 0, 1,
-0.4581036, -0.6384495, -3.367601, 0, 1, 0.003921569, 1,
-0.4581014, -1.63642, -2.959681, 0, 1, 0.01176471, 1,
-0.4558429, -0.09199644, -0.7439977, 0, 1, 0.01568628, 1,
-0.4517505, -2.560894, -4.733024, 0, 1, 0.02352941, 1,
-0.4504343, 0.2718178, 0.3069277, 0, 1, 0.02745098, 1,
-0.4467648, -1.018656, -1.913197, 0, 1, 0.03529412, 1,
-0.4427239, -0.4553538, -2.785367, 0, 1, 0.03921569, 1,
-0.4400933, -0.8157558, -3.818609, 0, 1, 0.04705882, 1,
-0.439796, -1.340048, -3.35994, 0, 1, 0.05098039, 1,
-0.4383037, -1.101541, -3.853942, 0, 1, 0.05882353, 1,
-0.4360095, -0.2908324, -2.785797, 0, 1, 0.0627451, 1,
-0.4342453, -0.8683678, -0.7326618, 0, 1, 0.07058824, 1,
-0.4265912, -0.8188165, -3.622335, 0, 1, 0.07450981, 1,
-0.4255117, 1.0219, -0.978093, 0, 1, 0.08235294, 1,
-0.4253199, 0.8196702, -1.204043, 0, 1, 0.08627451, 1,
-0.4197173, -0.008455351, -1.004206, 0, 1, 0.09411765, 1,
-0.4171058, 0.4297709, 0.7707189, 0, 1, 0.1019608, 1,
-0.4135953, 1.505157, -0.219038, 0, 1, 0.1058824, 1,
-0.4111537, -0.5253007, -4.732253, 0, 1, 0.1137255, 1,
-0.4064655, 0.742386, -0.9791595, 0, 1, 0.1176471, 1,
-0.4056082, -1.577723, -2.29965, 0, 1, 0.1254902, 1,
-0.4045278, 1.516884, 0.5112954, 0, 1, 0.1294118, 1,
-0.4042637, 0.1650492, -0.1083042, 0, 1, 0.1372549, 1,
-0.39749, -1.089486, -3.318758, 0, 1, 0.1411765, 1,
-0.3932865, -0.152929, -0.4713717, 0, 1, 0.1490196, 1,
-0.3931007, -0.4869544, 0.2214247, 0, 1, 0.1529412, 1,
-0.3858103, 0.0515813, -0.4112403, 0, 1, 0.1607843, 1,
-0.3801497, -1.473148, -4.005547, 0, 1, 0.1647059, 1,
-0.3800442, 0.7029159, -1.017486, 0, 1, 0.172549, 1,
-0.3796421, 0.3306716, -1.38015, 0, 1, 0.1764706, 1,
-0.3781015, 0.6956981, -0.09439529, 0, 1, 0.1843137, 1,
-0.3765432, -1.671864, -1.620108, 0, 1, 0.1882353, 1,
-0.3755313, -1.482731, -2.967594, 0, 1, 0.1960784, 1,
-0.3717479, -0.5034446, -2.58727, 0, 1, 0.2039216, 1,
-0.3632085, 0.7048853, 1.599985, 0, 1, 0.2078431, 1,
-0.3630968, 0.4018306, -0.9856638, 0, 1, 0.2156863, 1,
-0.3606133, -1.323011, -4.248606, 0, 1, 0.2196078, 1,
-0.3585958, -0.4682248, -0.6893985, 0, 1, 0.227451, 1,
-0.3581595, 1.268782, -1.379355, 0, 1, 0.2313726, 1,
-0.3569362, -0.5092167, -1.133254, 0, 1, 0.2392157, 1,
-0.3560335, 0.5941965, 0.243197, 0, 1, 0.2431373, 1,
-0.354187, -0.4976538, -1.199996, 0, 1, 0.2509804, 1,
-0.3502626, -0.6171809, -2.206172, 0, 1, 0.254902, 1,
-0.3501315, 0.108026, -1.428878, 0, 1, 0.2627451, 1,
-0.3363472, -1.598049, -1.506613, 0, 1, 0.2666667, 1,
-0.3304053, -1.385779, -4.232306, 0, 1, 0.2745098, 1,
-0.3269372, 0.3864072, -0.3382685, 0, 1, 0.2784314, 1,
-0.3201515, 0.2297208, -1.649809, 0, 1, 0.2862745, 1,
-0.3133669, 0.4246443, -2.080482, 0, 1, 0.2901961, 1,
-0.3120417, 0.5677955, 0.0005246361, 0, 1, 0.2980392, 1,
-0.3103108, 1.364663, -0.4870144, 0, 1, 0.3058824, 1,
-0.3077968, -0.3064686, -1.017828, 0, 1, 0.3098039, 1,
-0.3040325, -0.02665413, 0.157074, 0, 1, 0.3176471, 1,
-0.303589, 0.6966571, -0.47702, 0, 1, 0.3215686, 1,
-0.3021717, 0.377738, 0.2224907, 0, 1, 0.3294118, 1,
-0.2984497, -1.242892, -2.784064, 0, 1, 0.3333333, 1,
-0.2964704, 0.2605944, -1.332481, 0, 1, 0.3411765, 1,
-0.2941318, 0.7433617, -2.823017, 0, 1, 0.345098, 1,
-0.2940005, -1.046917, -3.036786, 0, 1, 0.3529412, 1,
-0.2920428, -0.9614251, -3.602161, 0, 1, 0.3568628, 1,
-0.2898411, 0.923612, -0.4055113, 0, 1, 0.3647059, 1,
-0.2890618, -0.04398451, -1.998007, 0, 1, 0.3686275, 1,
-0.2854027, -1.280059, -3.994421, 0, 1, 0.3764706, 1,
-0.2840505, -0.3213688, -1.617069, 0, 1, 0.3803922, 1,
-0.2826075, 0.8504279, 1.406535, 0, 1, 0.3882353, 1,
-0.281251, -0.8648974, -2.550851, 0, 1, 0.3921569, 1,
-0.2758051, 0.351913, 0.8852072, 0, 1, 0.4, 1,
-0.2735195, 0.887895, -0.4374815, 0, 1, 0.4078431, 1,
-0.2718669, 0.1121342, -1.812771, 0, 1, 0.4117647, 1,
-0.2715728, -1.313101, -2.984826, 0, 1, 0.4196078, 1,
-0.2700008, 0.7189077, -3.005184, 0, 1, 0.4235294, 1,
-0.2674143, -0.3412692, -2.49417, 0, 1, 0.4313726, 1,
-0.2624206, -0.1400404, -0.8108767, 0, 1, 0.4352941, 1,
-0.2609118, 1.342501, 0.5787721, 0, 1, 0.4431373, 1,
-0.25961, -0.345252, -2.697221, 0, 1, 0.4470588, 1,
-0.2593415, -1.049309, -2.234318, 0, 1, 0.454902, 1,
-0.2572213, -0.7422585, -3.006577, 0, 1, 0.4588235, 1,
-0.2572144, -0.04657992, -1.668663, 0, 1, 0.4666667, 1,
-0.2559857, 0.865977, -0.1937542, 0, 1, 0.4705882, 1,
-0.2557073, 0.6108156, -0.5661883, 0, 1, 0.4784314, 1,
-0.2514021, -0.8686519, -3.910146, 0, 1, 0.4823529, 1,
-0.2487473, -1.409324, -2.64818, 0, 1, 0.4901961, 1,
-0.2482568, -0.6665688, -4.471397, 0, 1, 0.4941176, 1,
-0.2476915, 0.3847479, 0.7134404, 0, 1, 0.5019608, 1,
-0.2460369, 0.595729, -1.02833, 0, 1, 0.509804, 1,
-0.2451578, 0.8014673, -1.70119, 0, 1, 0.5137255, 1,
-0.2358398, 1.178356, 0.02982794, 0, 1, 0.5215687, 1,
-0.2351464, -0.2037877, -2.380296, 0, 1, 0.5254902, 1,
-0.2345834, 0.888705, -0.3127189, 0, 1, 0.5333334, 1,
-0.2338124, 0.03265717, -2.682818, 0, 1, 0.5372549, 1,
-0.2309031, -0.1978495, -1.875933, 0, 1, 0.5450981, 1,
-0.2286262, -0.2985753, -2.722536, 0, 1, 0.5490196, 1,
-0.2262907, -0.1289477, -2.020925, 0, 1, 0.5568628, 1,
-0.2201335, -0.08238687, -1.795746, 0, 1, 0.5607843, 1,
-0.2122792, -0.4582146, -0.7931426, 0, 1, 0.5686275, 1,
-0.2087741, -0.7671068, -1.951299, 0, 1, 0.572549, 1,
-0.2064676, 1.655862, 0.6201357, 0, 1, 0.5803922, 1,
-0.2062838, -0.1650345, -1.340788, 0, 1, 0.5843138, 1,
-0.1968539, -0.9018629, -2.409389, 0, 1, 0.5921569, 1,
-0.1959753, 0.4567812, -0.1744731, 0, 1, 0.5960785, 1,
-0.1782724, 0.6362457, -0.2365475, 0, 1, 0.6039216, 1,
-0.1780182, 1.97857, -0.6330475, 0, 1, 0.6117647, 1,
-0.1760295, 0.07515194, 1.174992, 0, 1, 0.6156863, 1,
-0.1728205, 0.2737843, -0.1264847, 0, 1, 0.6235294, 1,
-0.1661683, 0.7888845, 0.1071641, 0, 1, 0.627451, 1,
-0.1614845, -0.4915588, -3.11346, 0, 1, 0.6352941, 1,
-0.1603217, 1.418841, -0.7683345, 0, 1, 0.6392157, 1,
-0.158885, -1.249885, -3.556234, 0, 1, 0.6470588, 1,
-0.1566158, -0.1043407, -0.776235, 0, 1, 0.6509804, 1,
-0.1558342, -0.4788092, -2.892272, 0, 1, 0.6588235, 1,
-0.154413, 1.350155, -1.017207, 0, 1, 0.6627451, 1,
-0.1540188, 0.7654276, -0.6538911, 0, 1, 0.6705883, 1,
-0.1511368, 0.7820061, -0.9428518, 0, 1, 0.6745098, 1,
-0.145065, -0.1632386, -1.996294, 0, 1, 0.682353, 1,
-0.1438888, -0.007954915, -0.2064652, 0, 1, 0.6862745, 1,
-0.1380107, -1.272562, -2.823398, 0, 1, 0.6941177, 1,
-0.1364588, -1.123705, -3.230405, 0, 1, 0.7019608, 1,
-0.1357708, -0.688648, -2.295538, 0, 1, 0.7058824, 1,
-0.1351772, -0.09001218, -1.747974, 0, 1, 0.7137255, 1,
-0.1332151, -0.7954676, -2.7235, 0, 1, 0.7176471, 1,
-0.1231976, -0.9490774, -1.6336, 0, 1, 0.7254902, 1,
-0.1229614, 0.9767067, 0.8730946, 0, 1, 0.7294118, 1,
-0.122782, -0.8469682, -3.101725, 0, 1, 0.7372549, 1,
-0.1213694, 0.2234503, -0.7509038, 0, 1, 0.7411765, 1,
-0.1182955, 0.3303412, -0.8977487, 0, 1, 0.7490196, 1,
-0.1163969, 0.4502584, -1.366153, 0, 1, 0.7529412, 1,
-0.1144573, -1.473135, -2.691011, 0, 1, 0.7607843, 1,
-0.1111402, 0.03260246, -0.391722, 0, 1, 0.7647059, 1,
-0.1108561, -0.5230684, -2.448678, 0, 1, 0.772549, 1,
-0.1080337, -1.028523, -4.103475, 0, 1, 0.7764706, 1,
-0.1023716, -0.3905907, -1.810492, 0, 1, 0.7843137, 1,
-0.1003312, 0.3133855, -0.8973255, 0, 1, 0.7882353, 1,
-0.0908663, 0.4855686, 0.9324337, 0, 1, 0.7960784, 1,
-0.08590057, 0.4636856, 1.332338, 0, 1, 0.8039216, 1,
-0.08550459, -0.2108563, -2.130751, 0, 1, 0.8078431, 1,
-0.08384782, -1.492523, -0.9031775, 0, 1, 0.8156863, 1,
-0.08358575, 0.7327636, -1.829017, 0, 1, 0.8196079, 1,
-0.08162905, 0.6734591, 1.182417, 0, 1, 0.827451, 1,
-0.07940067, 0.04310343, -1.027436, 0, 1, 0.8313726, 1,
-0.07857963, -0.1541023, -2.657516, 0, 1, 0.8392157, 1,
-0.0774383, 1.678272, -1.185053, 0, 1, 0.8431373, 1,
-0.07436614, -0.3343552, -5.032978, 0, 1, 0.8509804, 1,
-0.07417839, 0.6381143, 0.3860171, 0, 1, 0.854902, 1,
-0.07127175, -0.1587516, -3.546999, 0, 1, 0.8627451, 1,
-0.0668281, 0.3209003, -1.004604, 0, 1, 0.8666667, 1,
-0.06101478, 1.025922, 0.2817855, 0, 1, 0.8745098, 1,
-0.05621726, -1.055221, -4.563181, 0, 1, 0.8784314, 1,
-0.05247616, -2.631214, -3.832364, 0, 1, 0.8862745, 1,
-0.05095144, 0.8186807, -0.5971184, 0, 1, 0.8901961, 1,
-0.0505353, 1.469799, 0.3967502, 0, 1, 0.8980392, 1,
-0.04931201, 0.03371515, -1.404829, 0, 1, 0.9058824, 1,
-0.04352184, -2.4769, -2.862176, 0, 1, 0.9098039, 1,
-0.04261791, -0.3599598, -3.714046, 0, 1, 0.9176471, 1,
-0.03754123, 0.5812977, 0.2506, 0, 1, 0.9215686, 1,
-0.03648578, -0.8036357, -1.851445, 0, 1, 0.9294118, 1,
-0.03607607, -0.8660554, -3.18954, 0, 1, 0.9333333, 1,
-0.03536088, 0.1277405, -1.09771, 0, 1, 0.9411765, 1,
-0.03438556, -0.9018105, -3.461809, 0, 1, 0.945098, 1,
-0.03398518, 1.395567, -1.458067, 0, 1, 0.9529412, 1,
-0.0312019, 0.3330052, -0.9283462, 0, 1, 0.9568627, 1,
-0.02309694, -0.6269892, -2.617304, 0, 1, 0.9647059, 1,
-0.02203718, 0.8867154, 1.218541, 0, 1, 0.9686275, 1,
-0.0109589, 1.558194, 0.2922145, 0, 1, 0.9764706, 1,
-0.01069901, -0.9013308, -2.050958, 0, 1, 0.9803922, 1,
-0.006813521, 1.066607, 1.703999, 0, 1, 0.9882353, 1,
-0.005990705, 1.997209, -0.6821093, 0, 1, 0.9921569, 1,
-0.004151777, -0.002315064, -1.955682, 0, 1, 1, 1,
0.001268703, 2.140295, -1.536385, 0, 0.9921569, 1, 1,
0.001957468, -0.9798698, 3.294619, 0, 0.9882353, 1, 1,
0.003542936, 0.3752364, 0.0301925, 0, 0.9803922, 1, 1,
0.009445618, 0.919553, -0.7470599, 0, 0.9764706, 1, 1,
0.01202859, 1.02221, 0.4859251, 0, 0.9686275, 1, 1,
0.01655538, -2.179417, 3.202558, 0, 0.9647059, 1, 1,
0.02126461, -0.2497743, 3.256323, 0, 0.9568627, 1, 1,
0.02175636, 0.230107, 0.1507173, 0, 0.9529412, 1, 1,
0.02348486, -0.5013039, 3.120779, 0, 0.945098, 1, 1,
0.02492222, 0.4242091, 0.8021957, 0, 0.9411765, 1, 1,
0.02561315, 0.1574116, 0.7514489, 0, 0.9333333, 1, 1,
0.02633669, -0.7208008, 3.607058, 0, 0.9294118, 1, 1,
0.02645355, -0.8987071, 2.832179, 0, 0.9215686, 1, 1,
0.02676172, -0.9574879, 4.146346, 0, 0.9176471, 1, 1,
0.02823677, 0.0285482, 1.230543, 0, 0.9098039, 1, 1,
0.03058063, -1.437369, 1.838203, 0, 0.9058824, 1, 1,
0.03205423, 0.06172554, 0.9400307, 0, 0.8980392, 1, 1,
0.04345129, -0.08541539, 2.717854, 0, 0.8901961, 1, 1,
0.04842489, -1.350364, 2.913257, 0, 0.8862745, 1, 1,
0.05169592, 1.205269, 1.044096, 0, 0.8784314, 1, 1,
0.05253556, -0.1788897, 2.151381, 0, 0.8745098, 1, 1,
0.05718754, 0.7660474, 0.8874671, 0, 0.8666667, 1, 1,
0.059227, -0.1582503, 1.339133, 0, 0.8627451, 1, 1,
0.06248043, -0.1558248, 4.194691, 0, 0.854902, 1, 1,
0.06314476, -2.045429, 4.381948, 0, 0.8509804, 1, 1,
0.065533, 0.3432606, -0.7702425, 0, 0.8431373, 1, 1,
0.07321468, 0.1130724, 0.1984021, 0, 0.8392157, 1, 1,
0.07420234, -0.4298635, 2.670993, 0, 0.8313726, 1, 1,
0.08389674, -0.9489114, 3.028818, 0, 0.827451, 1, 1,
0.08567673, -0.5658722, 2.797925, 0, 0.8196079, 1, 1,
0.09095766, 0.06629208, 0.989601, 0, 0.8156863, 1, 1,
0.09352848, -0.8696886, 2.408577, 0, 0.8078431, 1, 1,
0.09404223, 1.547339, 0.40704, 0, 0.8039216, 1, 1,
0.09669689, 0.04348218, 0.5748129, 0, 0.7960784, 1, 1,
0.09726501, -0.2642037, 2.529943, 0, 0.7882353, 1, 1,
0.0976838, 1.295642, -0.4765981, 0, 0.7843137, 1, 1,
0.09785662, -0.4980946, 1.969609, 0, 0.7764706, 1, 1,
0.0985176, 0.3802705, 0.8181631, 0, 0.772549, 1, 1,
0.09876297, -0.1040905, 2.931366, 0, 0.7647059, 1, 1,
0.1027983, -1.359169, 1.563799, 0, 0.7607843, 1, 1,
0.105462, -1.701966, 2.025804, 0, 0.7529412, 1, 1,
0.1059845, -0.06315327, 0.7147383, 0, 0.7490196, 1, 1,
0.1065993, -0.4700049, 2.786885, 0, 0.7411765, 1, 1,
0.107534, 0.07412517, 1.059861, 0, 0.7372549, 1, 1,
0.1099994, 0.4862998, -0.4086309, 0, 0.7294118, 1, 1,
0.1169819, -0.5418847, 1.145336, 0, 0.7254902, 1, 1,
0.1171076, -0.3489119, 1.173761, 0, 0.7176471, 1, 1,
0.123454, 0.3811892, 0.584174, 0, 0.7137255, 1, 1,
0.1290951, 0.1601092, 1.571262, 0, 0.7058824, 1, 1,
0.1337855, -1.409986, 1.96535, 0, 0.6980392, 1, 1,
0.1347212, 2.142492, -0.3731868, 0, 0.6941177, 1, 1,
0.1386037, -0.8339103, 3.391052, 0, 0.6862745, 1, 1,
0.1453854, 1.329984, -1.051118, 0, 0.682353, 1, 1,
0.1456364, 0.8619636, -1.69189, 0, 0.6745098, 1, 1,
0.1473618, 0.9295477, 1.755888, 0, 0.6705883, 1, 1,
0.1530282, -0.2239903, 2.871768, 0, 0.6627451, 1, 1,
0.1536158, -0.1474165, 2.976835, 0, 0.6588235, 1, 1,
0.1543796, -0.8493713, 3.118764, 0, 0.6509804, 1, 1,
0.1563442, -0.8170015, 1.893187, 0, 0.6470588, 1, 1,
0.1612212, -0.07720917, 1.971865, 0, 0.6392157, 1, 1,
0.1651464, -1.013912, 1.666242, 0, 0.6352941, 1, 1,
0.1653361, -0.892482, 3.818253, 0, 0.627451, 1, 1,
0.1704293, -0.6442171, 1.878049, 0, 0.6235294, 1, 1,
0.1722835, -0.7218104, 4.952376, 0, 0.6156863, 1, 1,
0.1734326, -1.274424, 4.041468, 0, 0.6117647, 1, 1,
0.1760167, 0.455719, -0.3822585, 0, 0.6039216, 1, 1,
0.1773469, -1.267204, 2.071732, 0, 0.5960785, 1, 1,
0.177693, -1.06131, 2.07156, 0, 0.5921569, 1, 1,
0.1794071, -1.677849, 3.135182, 0, 0.5843138, 1, 1,
0.1856675, 0.9270902, -0.2593488, 0, 0.5803922, 1, 1,
0.1865059, -1.132536, 4.425334, 0, 0.572549, 1, 1,
0.1883959, 0.5566232, 0.2564307, 0, 0.5686275, 1, 1,
0.1897864, 2.627712, -1.929081, 0, 0.5607843, 1, 1,
0.191665, -0.3921319, 3.552979, 0, 0.5568628, 1, 1,
0.1958, 1.21705, -0.2765676, 0, 0.5490196, 1, 1,
0.2034949, -0.1272495, 0.8571779, 0, 0.5450981, 1, 1,
0.2044314, -0.2512259, 1.034552, 0, 0.5372549, 1, 1,
0.2049235, -1.721775, 2.885177, 0, 0.5333334, 1, 1,
0.2090919, 0.4936379, 1.2214, 0, 0.5254902, 1, 1,
0.2100983, -0.6433541, 1.723559, 0, 0.5215687, 1, 1,
0.2118938, 0.5274733, -0.5601643, 0, 0.5137255, 1, 1,
0.2145338, -0.5654627, 3.355683, 0, 0.509804, 1, 1,
0.2148332, -0.06630312, 0.8711039, 0, 0.5019608, 1, 1,
0.2154699, -1.310666, 3.938989, 0, 0.4941176, 1, 1,
0.217996, -0.5358219, 2.631715, 0, 0.4901961, 1, 1,
0.2186616, -1.137225, 3.474308, 0, 0.4823529, 1, 1,
0.219452, 0.6477889, 0.05798586, 0, 0.4784314, 1, 1,
0.2199909, 1.357641, 0.584114, 0, 0.4705882, 1, 1,
0.2216608, 0.5603203, -1.241651, 0, 0.4666667, 1, 1,
0.2222608, 0.644724, -0.9969039, 0, 0.4588235, 1, 1,
0.2230567, 0.6850156, 1.102351, 0, 0.454902, 1, 1,
0.2355696, 0.3986746, -0.6877024, 0, 0.4470588, 1, 1,
0.2360947, -2.097171, 3.279775, 0, 0.4431373, 1, 1,
0.2395194, -0.03988845, 1.607941, 0, 0.4352941, 1, 1,
0.2405632, 0.1448344, 1.452929, 0, 0.4313726, 1, 1,
0.2414404, -1.246804, 2.580146, 0, 0.4235294, 1, 1,
0.2418172, -0.3441857, 3.861455, 0, 0.4196078, 1, 1,
0.2418472, 0.7850494, -0.6956774, 0, 0.4117647, 1, 1,
0.2473589, 0.9465792, 1.680807, 0, 0.4078431, 1, 1,
0.2529739, -0.638857, 1.340138, 0, 0.4, 1, 1,
0.2530218, -0.3644505, 1.888554, 0, 0.3921569, 1, 1,
0.2621463, 0.5839102, 0.8953469, 0, 0.3882353, 1, 1,
0.2731245, 0.2477036, 1.450059, 0, 0.3803922, 1, 1,
0.2784077, -0.2455759, 2.269479, 0, 0.3764706, 1, 1,
0.2807219, -0.8223585, 4.330632, 0, 0.3686275, 1, 1,
0.2824818, -0.2269181, 2.59807, 0, 0.3647059, 1, 1,
0.2838086, 0.9378893, -0.519927, 0, 0.3568628, 1, 1,
0.2851709, 0.6688402, 2.133304, 0, 0.3529412, 1, 1,
0.2880187, -0.9356392, 2.924074, 0, 0.345098, 1, 1,
0.2907275, 0.4185385, 1.338625, 0, 0.3411765, 1, 1,
0.3000209, 0.4961897, 1.114933, 0, 0.3333333, 1, 1,
0.3007491, -0.6356902, 1.881187, 0, 0.3294118, 1, 1,
0.3039754, -2.198296, 4.102154, 0, 0.3215686, 1, 1,
0.3048918, 2.213866, -0.7224922, 0, 0.3176471, 1, 1,
0.3119682, 0.3828088, -1.603583, 0, 0.3098039, 1, 1,
0.3128958, -0.1834897, 3.97409, 0, 0.3058824, 1, 1,
0.3138836, -0.6946574, 2.189136, 0, 0.2980392, 1, 1,
0.3191898, 0.3400832, 1.647366, 0, 0.2901961, 1, 1,
0.3199029, 0.8772319, -0.768846, 0, 0.2862745, 1, 1,
0.3239256, 0.9236917, -2.383419, 0, 0.2784314, 1, 1,
0.324879, 2.833357, 1.93202, 0, 0.2745098, 1, 1,
0.3279493, -0.6657318, 2.526099, 0, 0.2666667, 1, 1,
0.3295602, -0.4389746, 2.735705, 0, 0.2627451, 1, 1,
0.3319149, 0.4613107, 0.6750044, 0, 0.254902, 1, 1,
0.3338259, 1.866423, 0.1704306, 0, 0.2509804, 1, 1,
0.3373949, 0.3062026, 2.014373, 0, 0.2431373, 1, 1,
0.3403732, 0.1984443, 0.8426332, 0, 0.2392157, 1, 1,
0.3425255, 0.007737301, 1.39482, 0, 0.2313726, 1, 1,
0.343916, 0.05835125, 1.277371, 0, 0.227451, 1, 1,
0.3440616, -3.353324, 2.588224, 0, 0.2196078, 1, 1,
0.3473494, 0.5171692, 2.175719, 0, 0.2156863, 1, 1,
0.3578113, 0.5177224, 0.3142295, 0, 0.2078431, 1, 1,
0.3584089, 0.9303384, 0.07329719, 0, 0.2039216, 1, 1,
0.3590485, 0.3561364, 1.896757, 0, 0.1960784, 1, 1,
0.3609674, 0.3332919, 0.1011835, 0, 0.1882353, 1, 1,
0.36483, 0.2310946, 0.1487092, 0, 0.1843137, 1, 1,
0.3651075, 0.9510316, 1.975827, 0, 0.1764706, 1, 1,
0.3726733, -0.4278941, 2.253613, 0, 0.172549, 1, 1,
0.3741455, -0.3032919, 3.767761, 0, 0.1647059, 1, 1,
0.375748, 0.3476732, 0.3427326, 0, 0.1607843, 1, 1,
0.3790294, -0.8958278, 1.332967, 0, 0.1529412, 1, 1,
0.3801418, 0.108249, 0.1340973, 0, 0.1490196, 1, 1,
0.3812747, 0.6898945, 0.7257084, 0, 0.1411765, 1, 1,
0.3830088, 1.543772, 0.6586648, 0, 0.1372549, 1, 1,
0.3848238, 0.8560185, -1.496945, 0, 0.1294118, 1, 1,
0.3849742, 0.5116625, -0.8395394, 0, 0.1254902, 1, 1,
0.3868341, -1.793506, 0.7059023, 0, 0.1176471, 1, 1,
0.3871515, 0.4720786, -1.148845, 0, 0.1137255, 1, 1,
0.3874574, 0.9043419, 0.7775171, 0, 0.1058824, 1, 1,
0.3891779, -0.5377885, 3.11169, 0, 0.09803922, 1, 1,
0.3919955, 1.032322, -0.3930692, 0, 0.09411765, 1, 1,
0.3998305, -0.4272998, 2.572127, 0, 0.08627451, 1, 1,
0.3999322, 1.568601, 0.3453805, 0, 0.08235294, 1, 1,
0.4024954, 0.1756343, -1.243363, 0, 0.07450981, 1, 1,
0.4088005, 1.6117, 0.2184057, 0, 0.07058824, 1, 1,
0.4103929, -1.533185, 3.755919, 0, 0.0627451, 1, 1,
0.4127678, -0.2464098, 1.720989, 0, 0.05882353, 1, 1,
0.4150855, 0.7112054, -0.4475499, 0, 0.05098039, 1, 1,
0.4161389, 0.9081569, 1.103201, 0, 0.04705882, 1, 1,
0.4174133, -0.3800096, 1.597015, 0, 0.03921569, 1, 1,
0.4178048, 0.397854, 1.283458, 0, 0.03529412, 1, 1,
0.4180553, 0.5437133, 1.848303, 0, 0.02745098, 1, 1,
0.4247526, 1.036838, 0.6006603, 0, 0.02352941, 1, 1,
0.4262989, -0.2378988, 3.203356, 0, 0.01568628, 1, 1,
0.4284971, -0.5829504, 3.042842, 0, 0.01176471, 1, 1,
0.4287487, -1.011637, 3.578101, 0, 0.003921569, 1, 1,
0.4306162, 0.7988527, 0.1017419, 0.003921569, 0, 1, 1,
0.4334031, 0.4478496, -0.03911641, 0.007843138, 0, 1, 1,
0.4358355, 0.2944269, -1.091909, 0.01568628, 0, 1, 1,
0.4387538, 0.05427565, 3.069108, 0.01960784, 0, 1, 1,
0.4418862, 0.3116542, -0.2304215, 0.02745098, 0, 1, 1,
0.4459917, -1.114879, 2.857449, 0.03137255, 0, 1, 1,
0.4472055, -0.008414045, 1.457373, 0.03921569, 0, 1, 1,
0.4508901, 1.149692, 0.4929529, 0.04313726, 0, 1, 1,
0.4529065, 0.7267782, 0.4115084, 0.05098039, 0, 1, 1,
0.4548005, -1.304804, 2.9276, 0.05490196, 0, 1, 1,
0.460028, 0.7612755, 1.744851, 0.0627451, 0, 1, 1,
0.4622363, 1.714805, 0.9597001, 0.06666667, 0, 1, 1,
0.4640659, -0.9741525, 4.192608, 0.07450981, 0, 1, 1,
0.4647108, 1.079307, -1.193306, 0.07843138, 0, 1, 1,
0.4698696, -1.464927, 2.854653, 0.08627451, 0, 1, 1,
0.4778111, -0.8519776, 2.840276, 0.09019608, 0, 1, 1,
0.4790867, -0.4255598, 1.267152, 0.09803922, 0, 1, 1,
0.4846851, 0.6782903, 0.8298458, 0.1058824, 0, 1, 1,
0.4847925, 0.4774355, 1.333638, 0.1098039, 0, 1, 1,
0.4873775, -0.3610359, 0.9555203, 0.1176471, 0, 1, 1,
0.4882126, -0.1551819, 2.376382, 0.1215686, 0, 1, 1,
0.4904286, -1.232325, -0.9066676, 0.1294118, 0, 1, 1,
0.4990805, -1.69088, 4.486947, 0.1333333, 0, 1, 1,
0.5002041, -0.381192, 2.473832, 0.1411765, 0, 1, 1,
0.5008965, 0.2499298, 1.475108, 0.145098, 0, 1, 1,
0.5025563, -1.049935, 3.123055, 0.1529412, 0, 1, 1,
0.5036051, 0.8048258, 0.8735549, 0.1568628, 0, 1, 1,
0.5050203, -0.3953405, -0.3615239, 0.1647059, 0, 1, 1,
0.5068014, -0.11426, 0.8147118, 0.1686275, 0, 1, 1,
0.5116726, -0.1263382, 0.08390361, 0.1764706, 0, 1, 1,
0.5121374, 0.3880941, 0.8849649, 0.1803922, 0, 1, 1,
0.5124747, -1.649545, 2.692446, 0.1882353, 0, 1, 1,
0.5126759, -0.9743319, 1.129413, 0.1921569, 0, 1, 1,
0.5148365, -0.0005767534, 1.097826, 0.2, 0, 1, 1,
0.5150868, -1.855875, 4.998371, 0.2078431, 0, 1, 1,
0.5169474, -0.5443656, 2.470654, 0.2117647, 0, 1, 1,
0.5209125, 1.147223, 0.7358984, 0.2196078, 0, 1, 1,
0.5211135, -0.3494154, 4.14667, 0.2235294, 0, 1, 1,
0.5237129, -1.069585, 3.022566, 0.2313726, 0, 1, 1,
0.5237389, 0.8944703, 1.761932, 0.2352941, 0, 1, 1,
0.5261654, -0.4886563, 2.793517, 0.2431373, 0, 1, 1,
0.5299717, 1.166695, 0.2494868, 0.2470588, 0, 1, 1,
0.5327635, -2.264167, 3.004784, 0.254902, 0, 1, 1,
0.5351709, 0.2697678, 0.2339878, 0.2588235, 0, 1, 1,
0.5461133, -0.5306945, 3.503453, 0.2666667, 0, 1, 1,
0.5517288, -0.6011654, 2.368493, 0.2705882, 0, 1, 1,
0.5567179, -0.3509023, 2.622767, 0.2784314, 0, 1, 1,
0.558009, 0.811056, 3.142868, 0.282353, 0, 1, 1,
0.5585064, 0.3031503, 0.8654534, 0.2901961, 0, 1, 1,
0.5603577, 0.5901594, 0.1932532, 0.2941177, 0, 1, 1,
0.5607796, -0.9810715, 2.218344, 0.3019608, 0, 1, 1,
0.5631733, 0.4839714, 1.508257, 0.3098039, 0, 1, 1,
0.5662175, -0.3777881, 4.236187, 0.3137255, 0, 1, 1,
0.5713654, -0.686461, 2.736736, 0.3215686, 0, 1, 1,
0.5731567, -0.874944, 1.986384, 0.3254902, 0, 1, 1,
0.5768605, -0.8550192, 1.998338, 0.3333333, 0, 1, 1,
0.5786276, 0.6508008, 0.6381364, 0.3372549, 0, 1, 1,
0.5818866, -0.4021466, 1.394678, 0.345098, 0, 1, 1,
0.5827453, -0.431655, 4.166565, 0.3490196, 0, 1, 1,
0.583144, 0.635798, -0.1747433, 0.3568628, 0, 1, 1,
0.5863343, -0.1185762, 3.212261, 0.3607843, 0, 1, 1,
0.5865695, 0.160309, 1.471435, 0.3686275, 0, 1, 1,
0.5887741, 2.578398, 1.180304, 0.372549, 0, 1, 1,
0.5930521, -0.3402674, 2.889867, 0.3803922, 0, 1, 1,
0.5944121, 0.5091503, 2.101658, 0.3843137, 0, 1, 1,
0.6015837, 0.5454893, 0.6070146, 0.3921569, 0, 1, 1,
0.6017497, -0.7661358, 0.9318394, 0.3960784, 0, 1, 1,
0.6058522, -1.036791, 2.018322, 0.4039216, 0, 1, 1,
0.606095, 1.337599, -0.0001780118, 0.4117647, 0, 1, 1,
0.6126029, 1.173545, -1.00494, 0.4156863, 0, 1, 1,
0.6193261, -0.2708835, 1.632241, 0.4235294, 0, 1, 1,
0.6235021, 0.02370594, 1.318163, 0.427451, 0, 1, 1,
0.6246695, 0.6630078, 1.693842, 0.4352941, 0, 1, 1,
0.6262265, 0.1666263, 0.04849826, 0.4392157, 0, 1, 1,
0.6302543, 1.181213, 2.164324, 0.4470588, 0, 1, 1,
0.6330888, 0.27277, -1.093286, 0.4509804, 0, 1, 1,
0.6369818, -0.2540996, 1.193988, 0.4588235, 0, 1, 1,
0.6460353, 1.823777, 0.09938478, 0.4627451, 0, 1, 1,
0.650449, -1.528495, 3.270373, 0.4705882, 0, 1, 1,
0.6520224, -0.1503376, 0.9657261, 0.4745098, 0, 1, 1,
0.6543786, 0.0034303, -0.33926, 0.4823529, 0, 1, 1,
0.6601328, -0.6019765, 2.223049, 0.4862745, 0, 1, 1,
0.6603183, 1.209497, 0.617997, 0.4941176, 0, 1, 1,
0.6607332, 0.3597393, -0.5525772, 0.5019608, 0, 1, 1,
0.6630466, 1.668452, -0.3053341, 0.5058824, 0, 1, 1,
0.6673369, -0.3116576, 3.242161, 0.5137255, 0, 1, 1,
0.6682688, -0.5752127, 1.149039, 0.5176471, 0, 1, 1,
0.6723319, -0.2700831, 1.324736, 0.5254902, 0, 1, 1,
0.6747857, -1.008939, 2.410427, 0.5294118, 0, 1, 1,
0.6749383, -1.142044, 3.467186, 0.5372549, 0, 1, 1,
0.6749572, 0.2140775, 2.300213, 0.5411765, 0, 1, 1,
0.6756006, -0.1781469, 2.282551, 0.5490196, 0, 1, 1,
0.6764295, 1.424447, -0.6212369, 0.5529412, 0, 1, 1,
0.6824251, -0.719687, 3.256385, 0.5607843, 0, 1, 1,
0.6863166, -0.02073359, 0.9193932, 0.5647059, 0, 1, 1,
0.6884407, 0.05819945, 1.488632, 0.572549, 0, 1, 1,
0.6888362, -0.4278665, 2.550424, 0.5764706, 0, 1, 1,
0.6895493, -0.3307246, 1.583152, 0.5843138, 0, 1, 1,
0.6913856, -0.1495828, 1.328397, 0.5882353, 0, 1, 1,
0.6949902, -0.485461, 1.666806, 0.5960785, 0, 1, 1,
0.6953261, 0.1289999, 2.561281, 0.6039216, 0, 1, 1,
0.6979998, 0.6320385, 0.01784804, 0.6078432, 0, 1, 1,
0.6983026, 0.1818286, 2.506342, 0.6156863, 0, 1, 1,
0.7012331, 0.1120168, 2.159725, 0.6196079, 0, 1, 1,
0.7043998, -0.009373135, 1.856128, 0.627451, 0, 1, 1,
0.7057766, 0.6045762, -0.17348, 0.6313726, 0, 1, 1,
0.7064068, -1.231738, 2.484614, 0.6392157, 0, 1, 1,
0.7131485, 0.0240365, 0.9967263, 0.6431373, 0, 1, 1,
0.7173026, -1.264529, 1.925152, 0.6509804, 0, 1, 1,
0.7184525, 1.831848, -0.1713495, 0.654902, 0, 1, 1,
0.7336737, -0.2907298, 2.278515, 0.6627451, 0, 1, 1,
0.734682, 2.764698, 1.194178, 0.6666667, 0, 1, 1,
0.7351661, 0.652611, -0.07571952, 0.6745098, 0, 1, 1,
0.7360585, 0.2033558, 0.4446027, 0.6784314, 0, 1, 1,
0.7403361, -0.4322134, 1.500991, 0.6862745, 0, 1, 1,
0.7427108, -1.492031, 1.245907, 0.6901961, 0, 1, 1,
0.742759, -1.225436, 3.199634, 0.6980392, 0, 1, 1,
0.7437708, 0.2345441, -0.8648467, 0.7058824, 0, 1, 1,
0.7466404, -0.80507, 0.9281636, 0.7098039, 0, 1, 1,
0.7483336, -1.66178, 3.854342, 0.7176471, 0, 1, 1,
0.7571241, 0.4551498, 2.383984, 0.7215686, 0, 1, 1,
0.762096, -0.3138752, 1.92607, 0.7294118, 0, 1, 1,
0.7688674, 0.4264319, 1.155106, 0.7333333, 0, 1, 1,
0.7707663, -0.4234878, 3.363094, 0.7411765, 0, 1, 1,
0.7806718, 1.953596, 1.679702, 0.7450981, 0, 1, 1,
0.7829125, 0.03036051, 0.9677793, 0.7529412, 0, 1, 1,
0.7882124, -0.6304647, 2.107043, 0.7568628, 0, 1, 1,
0.7944193, -0.6216957, 2.335328, 0.7647059, 0, 1, 1,
0.798183, 0.4458401, 1.132253, 0.7686275, 0, 1, 1,
0.7985563, -0.4385243, 3.744576, 0.7764706, 0, 1, 1,
0.799708, -1.337978, 2.412895, 0.7803922, 0, 1, 1,
0.8014041, 0.3584269, 1.199981, 0.7882353, 0, 1, 1,
0.805755, -0.6049758, 2.031588, 0.7921569, 0, 1, 1,
0.8059398, -1.231983, 1.438912, 0.8, 0, 1, 1,
0.809103, -0.6972766, 3.540667, 0.8078431, 0, 1, 1,
0.809892, -0.5599555, 2.020214, 0.8117647, 0, 1, 1,
0.810419, 0.1761831, 0.5699567, 0.8196079, 0, 1, 1,
0.8150384, 1.031912, 1.974411, 0.8235294, 0, 1, 1,
0.8296391, -0.2371882, 1.768339, 0.8313726, 0, 1, 1,
0.8322059, -0.7237822, 2.184772, 0.8352941, 0, 1, 1,
0.8394147, -1.18745, 1.613775, 0.8431373, 0, 1, 1,
0.8448791, -0.7057745, 2.345107, 0.8470588, 0, 1, 1,
0.8454353, 0.05045798, -0.562067, 0.854902, 0, 1, 1,
0.8458112, -1.379992, 1.889576, 0.8588235, 0, 1, 1,
0.8499679, -0.5014549, 2.625794, 0.8666667, 0, 1, 1,
0.8503202, 0.2876771, -1.324736, 0.8705882, 0, 1, 1,
0.850446, 1.052098, 1.004219, 0.8784314, 0, 1, 1,
0.8531293, -0.63505, 2.721211, 0.8823529, 0, 1, 1,
0.8634488, -1.228606, 2.072131, 0.8901961, 0, 1, 1,
0.8649211, -1.028602, 4.611349, 0.8941177, 0, 1, 1,
0.8665016, 1.0105, 1.275233, 0.9019608, 0, 1, 1,
0.8670321, -0.1572272, 3.277907, 0.9098039, 0, 1, 1,
0.8672556, -0.2998995, 3.621628, 0.9137255, 0, 1, 1,
0.8708386, -0.1602059, 0.7063195, 0.9215686, 0, 1, 1,
0.875249, 0.490559, 0.6999786, 0.9254902, 0, 1, 1,
0.8883796, 0.7588091, 1.484472, 0.9333333, 0, 1, 1,
0.8969629, -0.7124283, 3.709026, 0.9372549, 0, 1, 1,
0.9040146, 1.488491, -2.031058, 0.945098, 0, 1, 1,
0.906632, 0.5755972, 1.143458, 0.9490196, 0, 1, 1,
0.9069934, 1.31296, 1.415784, 0.9568627, 0, 1, 1,
0.9092144, 0.5266639, 2.09702, 0.9607843, 0, 1, 1,
0.9170816, -1.18093, 4.621001, 0.9686275, 0, 1, 1,
0.9182036, -0.9554279, 3.187125, 0.972549, 0, 1, 1,
0.9211447, -1.092936, 3.054241, 0.9803922, 0, 1, 1,
0.9222214, 0.6180261, 0.6947212, 0.9843137, 0, 1, 1,
0.9236611, 0.8985593, -0.7846166, 0.9921569, 0, 1, 1,
0.9310371, -0.2925593, 1.386739, 0.9960784, 0, 1, 1,
0.9312739, -0.08368774, 2.21071, 1, 0, 0.9960784, 1,
0.9558519, 0.705947, 0.7378609, 1, 0, 0.9882353, 1,
0.9591382, 2.093608, 1.825032, 1, 0, 0.9843137, 1,
0.9676945, -0.1985441, 2.218178, 1, 0, 0.9764706, 1,
0.97729, 1.894423, 1.592401, 1, 0, 0.972549, 1,
0.9863954, -0.6118896, 1.229514, 1, 0, 0.9647059, 1,
0.986499, -0.3382043, 3.330054, 1, 0, 0.9607843, 1,
1.006196, 1.910236, -1.01245, 1, 0, 0.9529412, 1,
1.010499, -0.9997845, 2.410579, 1, 0, 0.9490196, 1,
1.011905, 0.7701437, 1.354694, 1, 0, 0.9411765, 1,
1.01307, -2.042593, 1.337594, 1, 0, 0.9372549, 1,
1.016559, -2.165373, 3.3772, 1, 0, 0.9294118, 1,
1.022176, -0.2047692, 1.79185, 1, 0, 0.9254902, 1,
1.023297, -0.8076814, 1.415116, 1, 0, 0.9176471, 1,
1.025455, -2.529559, 2.359608, 1, 0, 0.9137255, 1,
1.027741, 0.6347809, -1.455525, 1, 0, 0.9058824, 1,
1.029124, -0.9059014, 3.03789, 1, 0, 0.9019608, 1,
1.029397, 0.2317738, 1.969867, 1, 0, 0.8941177, 1,
1.031459, -0.07383131, 1.630456, 1, 0, 0.8862745, 1,
1.03546, 0.6701984, 0.2419236, 1, 0, 0.8823529, 1,
1.039491, -0.8849546, 2.872984, 1, 0, 0.8745098, 1,
1.044797, 0.1047435, 2.431137, 1, 0, 0.8705882, 1,
1.048712, -0.9515611, 1.89539, 1, 0, 0.8627451, 1,
1.059651, 0.4033343, 1.02183, 1, 0, 0.8588235, 1,
1.063749, 1.147477, 3.113319, 1, 0, 0.8509804, 1,
1.065438, -0.3543325, 2.201913, 1, 0, 0.8470588, 1,
1.068659, 0.2052278, 2.890765, 1, 0, 0.8392157, 1,
1.076419, -0.3360894, 2.13029, 1, 0, 0.8352941, 1,
1.085572, 0.5031273, 0.6576045, 1, 0, 0.827451, 1,
1.091283, 0.8104798, 0.8115757, 1, 0, 0.8235294, 1,
1.09245, -0.2077348, 1.653487, 1, 0, 0.8156863, 1,
1.092752, 1.048619, 0.5815693, 1, 0, 0.8117647, 1,
1.095197, -1.239209, 0.7043564, 1, 0, 0.8039216, 1,
1.095796, -0.1949409, 0.1785545, 1, 0, 0.7960784, 1,
1.096294, -0.4720567, 1.183672, 1, 0, 0.7921569, 1,
1.097683, 0.738816, 1.2962, 1, 0, 0.7843137, 1,
1.102439, -0.360568, 1.613946, 1, 0, 0.7803922, 1,
1.111971, 0.0172959, 2.23453, 1, 0, 0.772549, 1,
1.112251, 0.4113863, 0.2391897, 1, 0, 0.7686275, 1,
1.117005, -1.697999, 1.63072, 1, 0, 0.7607843, 1,
1.123403, 0.2156132, 1.385796, 1, 0, 0.7568628, 1,
1.124106, -0.5863522, 3.243131, 1, 0, 0.7490196, 1,
1.129745, -1.509109, 3.711808, 1, 0, 0.7450981, 1,
1.132887, -0.8171883, 3.149246, 1, 0, 0.7372549, 1,
1.134814, 1.126456, 1.618568, 1, 0, 0.7333333, 1,
1.14095, 1.137034, 0.8221527, 1, 0, 0.7254902, 1,
1.143252, 0.5928445, 0.2126845, 1, 0, 0.7215686, 1,
1.153198, 2.502219, 0.40649, 1, 0, 0.7137255, 1,
1.167417, 0.3305207, 1.463824, 1, 0, 0.7098039, 1,
1.173206, -0.2074451, 2.997303, 1, 0, 0.7019608, 1,
1.173618, 0.9993375, 1.80841, 1, 0, 0.6941177, 1,
1.174111, -0.1230721, 2.885487, 1, 0, 0.6901961, 1,
1.177086, -0.5341277, 3.200643, 1, 0, 0.682353, 1,
1.182253, 0.09118082, 2.297925, 1, 0, 0.6784314, 1,
1.185609, 0.2663132, 0.6049507, 1, 0, 0.6705883, 1,
1.187749, -0.2790955, 3.905835, 1, 0, 0.6666667, 1,
1.197082, -1.328482, 2.467524, 1, 0, 0.6588235, 1,
1.198129, -1.246297, 3.73002, 1, 0, 0.654902, 1,
1.20952, 0.2877962, 1.303482, 1, 0, 0.6470588, 1,
1.211937, -1.051507, 2.600132, 1, 0, 0.6431373, 1,
1.214187, -0.0413629, 2.260971, 1, 0, 0.6352941, 1,
1.225683, 0.445628, 0.3829153, 1, 0, 0.6313726, 1,
1.229004, -0.4674952, 1.380176, 1, 0, 0.6235294, 1,
1.229059, 0.1668275, 1.149004, 1, 0, 0.6196079, 1,
1.231418, 0.6351563, 0.6721423, 1, 0, 0.6117647, 1,
1.24027, 1.26259, 0.1197916, 1, 0, 0.6078432, 1,
1.25315, 0.1437649, 0.2904007, 1, 0, 0.6, 1,
1.268659, 0.3757142, 2.169361, 1, 0, 0.5921569, 1,
1.27142, -0.7695608, 2.578933, 1, 0, 0.5882353, 1,
1.274632, -1.160821, 1.788318, 1, 0, 0.5803922, 1,
1.274818, 1.17511, 0.9485372, 1, 0, 0.5764706, 1,
1.275513, -1.058553, 1.691749, 1, 0, 0.5686275, 1,
1.276205, -0.9678032, -0.09626984, 1, 0, 0.5647059, 1,
1.282756, -0.2170446, 1.014314, 1, 0, 0.5568628, 1,
1.283636, -1.299427, 1.168049, 1, 0, 0.5529412, 1,
1.286411, 0.04831768, 2.000337, 1, 0, 0.5450981, 1,
1.295397, 0.5029235, 1.094714, 1, 0, 0.5411765, 1,
1.305854, -0.8924313, 3.871325, 1, 0, 0.5333334, 1,
1.325164, 1.518511, 1.316811, 1, 0, 0.5294118, 1,
1.32859, 0.9936829, 1.104383, 1, 0, 0.5215687, 1,
1.330958, -0.7797007, 2.008375, 1, 0, 0.5176471, 1,
1.333377, -0.119386, -0.8475484, 1, 0, 0.509804, 1,
1.333822, 1.192119, 2.76432, 1, 0, 0.5058824, 1,
1.337735, -0.4414569, 1.703081, 1, 0, 0.4980392, 1,
1.339161, 1.057376, 1.102127, 1, 0, 0.4901961, 1,
1.342486, 0.1569422, 0.6216926, 1, 0, 0.4862745, 1,
1.346285, 0.8313944, 0.7041265, 1, 0, 0.4784314, 1,
1.355689, -0.3557013, 1.563478, 1, 0, 0.4745098, 1,
1.369543, 0.9215084, 0.01117634, 1, 0, 0.4666667, 1,
1.377286, -0.4614674, 2.503997, 1, 0, 0.4627451, 1,
1.387662, -1.990895, 1.647112, 1, 0, 0.454902, 1,
1.397813, -0.30733, 2.309239, 1, 0, 0.4509804, 1,
1.398043, -0.08616929, 2.460781, 1, 0, 0.4431373, 1,
1.402781, 1.152267, 1.544816, 1, 0, 0.4392157, 1,
1.422307, 0.2725912, 3.167826, 1, 0, 0.4313726, 1,
1.442833, -0.6393776, 3.490696, 1, 0, 0.427451, 1,
1.445661, 0.6660401, 0.6315898, 1, 0, 0.4196078, 1,
1.453361, 0.3459, 1.911659, 1, 0, 0.4156863, 1,
1.453783, -0.1283231, 1.188868, 1, 0, 0.4078431, 1,
1.454151, 0.1830583, 1.692286, 1, 0, 0.4039216, 1,
1.467786, 0.1684457, 1.611479, 1, 0, 0.3960784, 1,
1.477414, -0.3344011, 2.733612, 1, 0, 0.3882353, 1,
1.489672, 0.9077445, 0.5544354, 1, 0, 0.3843137, 1,
1.522158, -1.494558, 1.072668, 1, 0, 0.3764706, 1,
1.524517, 0.06854585, 1.199617, 1, 0, 0.372549, 1,
1.52742, -1.04706, 3.83329, 1, 0, 0.3647059, 1,
1.532579, 0.3457243, -0.8865359, 1, 0, 0.3607843, 1,
1.533769, -1.200216, 2.151222, 1, 0, 0.3529412, 1,
1.574882, -0.2110966, 2.262956, 1, 0, 0.3490196, 1,
1.575394, 1.687732, 0.4401363, 1, 0, 0.3411765, 1,
1.579356, -0.6873088, 2.575877, 1, 0, 0.3372549, 1,
1.579529, 0.5360805, 2.438083, 1, 0, 0.3294118, 1,
1.583807, 0.236263, -0.151641, 1, 0, 0.3254902, 1,
1.587154, -0.7043544, 2.076732, 1, 0, 0.3176471, 1,
1.59146, 0.6329326, 1.574558, 1, 0, 0.3137255, 1,
1.595761, -1.147015, 1.55579, 1, 0, 0.3058824, 1,
1.598172, 0.893119, 0.7199878, 1, 0, 0.2980392, 1,
1.610011, 1.090307, 1.574988, 1, 0, 0.2941177, 1,
1.620927, -1.170475, 1.497109, 1, 0, 0.2862745, 1,
1.62478, 0.9626887, 0.6792122, 1, 0, 0.282353, 1,
1.626708, 0.6688405, 2.721082, 1, 0, 0.2745098, 1,
1.688901, 1.784788, 1.565998, 1, 0, 0.2705882, 1,
1.696588, 0.2532001, 1.576267, 1, 0, 0.2627451, 1,
1.713167, 0.2882886, 1.973393, 1, 0, 0.2588235, 1,
1.727492, 0.3612241, 1.046553, 1, 0, 0.2509804, 1,
1.732787, 0.278838, 2.646698, 1, 0, 0.2470588, 1,
1.732846, -0.1488011, 1.721842, 1, 0, 0.2392157, 1,
1.736038, -0.3825268, 3.157426, 1, 0, 0.2352941, 1,
1.740399, 0.558469, 1.808219, 1, 0, 0.227451, 1,
1.772047, 0.9446561, 0.9471645, 1, 0, 0.2235294, 1,
1.783708, 1.964057, -0.1397757, 1, 0, 0.2156863, 1,
1.784872, -1.026275, 2.354533, 1, 0, 0.2117647, 1,
1.806523, 0.1337869, 2.307758, 1, 0, 0.2039216, 1,
1.841411, 2.03171, -0.520229, 1, 0, 0.1960784, 1,
1.913874, 0.1987611, 1.236308, 1, 0, 0.1921569, 1,
1.916571, 0.1173867, 0.8793676, 1, 0, 0.1843137, 1,
1.927533, -0.2303065, 0.5305963, 1, 0, 0.1803922, 1,
1.952251, -0.7264917, 2.623274, 1, 0, 0.172549, 1,
1.96848, 1.06034, 1.606885, 1, 0, 0.1686275, 1,
2.003407, -0.3001097, 0.5734673, 1, 0, 0.1607843, 1,
2.025252, 0.4477965, 1.570497, 1, 0, 0.1568628, 1,
2.037311, -0.646524, 2.111182, 1, 0, 0.1490196, 1,
2.059713, 1.036451, 0.05842742, 1, 0, 0.145098, 1,
2.067173, 0.1269095, 1.422108, 1, 0, 0.1372549, 1,
2.087561, 1.193044, 0.3047847, 1, 0, 0.1333333, 1,
2.115037, -1.323637, 2.004717, 1, 0, 0.1254902, 1,
2.122123, 0.6532894, 0.2161377, 1, 0, 0.1215686, 1,
2.130076, -0.3044427, 1.708503, 1, 0, 0.1137255, 1,
2.182741, 0.8650208, 0.5358585, 1, 0, 0.1098039, 1,
2.184838, 0.1729289, 2.771548, 1, 0, 0.1019608, 1,
2.199285, 0.8223683, -0.4816626, 1, 0, 0.09411765, 1,
2.227686, 0.05755643, 1.64785, 1, 0, 0.09019608, 1,
2.281124, -0.1047082, 2.683387, 1, 0, 0.08235294, 1,
2.292944, -0.5900083, 0.9682154, 1, 0, 0.07843138, 1,
2.307517, -1.336403, 3.212837, 1, 0, 0.07058824, 1,
2.309086, 0.1683438, 2.394882, 1, 0, 0.06666667, 1,
2.439391, -2.01864, 1.641956, 1, 0, 0.05882353, 1,
2.457049, 1.04722, 1.421202, 1, 0, 0.05490196, 1,
2.558348, -1.47499, 1.660712, 1, 0, 0.04705882, 1,
2.641796, -2.327009, 2.223624, 1, 0, 0.04313726, 1,
2.731008, 1.133967, 0.9229915, 1, 0, 0.03529412, 1,
2.742525, -0.5216023, 1.486766, 1, 0, 0.03137255, 1,
2.824226, 1.655737, 0.2078717, 1, 0, 0.02352941, 1,
2.935936, 1.525512, -1.492169, 1, 0, 0.01960784, 1,
3.080112, 0.03630781, 1.617332, 1, 0, 0.01176471, 1,
3.522416, 0.9672348, 2.079769, 1, 0, 0.007843138, 1
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
0.2683538, -4.401966, -7.458862, 0, -0.5, 0.5, 0.5,
0.2683538, -4.401966, -7.458862, 1, -0.5, 0.5, 0.5,
0.2683538, -4.401966, -7.458862, 1, 1.5, 0.5, 0.5,
0.2683538, -4.401966, -7.458862, 0, 1.5, 0.5, 0.5
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
-4.088835, -0.2599835, -7.458862, 0, -0.5, 0.5, 0.5,
-4.088835, -0.2599835, -7.458862, 1, -0.5, 0.5, 0.5,
-4.088835, -0.2599835, -7.458862, 1, 1.5, 0.5, 0.5,
-4.088835, -0.2599835, -7.458862, 0, 1.5, 0.5, 0.5
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
-4.088835, -4.401966, -0.3275089, 0, -0.5, 0.5, 0.5,
-4.088835, -4.401966, -0.3275089, 1, -0.5, 0.5, 0.5,
-4.088835, -4.401966, -0.3275089, 1, 1.5, 0.5, 0.5,
-4.088835, -4.401966, -0.3275089, 0, 1.5, 0.5, 0.5
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
-2, -3.446124, -5.813165,
3, -3.446124, -5.813165,
-2, -3.446124, -5.813165,
-2, -3.605431, -6.087448,
-1, -3.446124, -5.813165,
-1, -3.605431, -6.087448,
0, -3.446124, -5.813165,
0, -3.605431, -6.087448,
1, -3.446124, -5.813165,
1, -3.605431, -6.087448,
2, -3.446124, -5.813165,
2, -3.605431, -6.087448,
3, -3.446124, -5.813165,
3, -3.605431, -6.087448
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
-2, -3.924045, -6.636014, 0, -0.5, 0.5, 0.5,
-2, -3.924045, -6.636014, 1, -0.5, 0.5, 0.5,
-2, -3.924045, -6.636014, 1, 1.5, 0.5, 0.5,
-2, -3.924045, -6.636014, 0, 1.5, 0.5, 0.5,
-1, -3.924045, -6.636014, 0, -0.5, 0.5, 0.5,
-1, -3.924045, -6.636014, 1, -0.5, 0.5, 0.5,
-1, -3.924045, -6.636014, 1, 1.5, 0.5, 0.5,
-1, -3.924045, -6.636014, 0, 1.5, 0.5, 0.5,
0, -3.924045, -6.636014, 0, -0.5, 0.5, 0.5,
0, -3.924045, -6.636014, 1, -0.5, 0.5, 0.5,
0, -3.924045, -6.636014, 1, 1.5, 0.5, 0.5,
0, -3.924045, -6.636014, 0, 1.5, 0.5, 0.5,
1, -3.924045, -6.636014, 0, -0.5, 0.5, 0.5,
1, -3.924045, -6.636014, 1, -0.5, 0.5, 0.5,
1, -3.924045, -6.636014, 1, 1.5, 0.5, 0.5,
1, -3.924045, -6.636014, 0, 1.5, 0.5, 0.5,
2, -3.924045, -6.636014, 0, -0.5, 0.5, 0.5,
2, -3.924045, -6.636014, 1, -0.5, 0.5, 0.5,
2, -3.924045, -6.636014, 1, 1.5, 0.5, 0.5,
2, -3.924045, -6.636014, 0, 1.5, 0.5, 0.5,
3, -3.924045, -6.636014, 0, -0.5, 0.5, 0.5,
3, -3.924045, -6.636014, 1, -0.5, 0.5, 0.5,
3, -3.924045, -6.636014, 1, 1.5, 0.5, 0.5,
3, -3.924045, -6.636014, 0, 1.5, 0.5, 0.5
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
-3.08333, -3, -5.813165,
-3.08333, 2, -5.813165,
-3.08333, -3, -5.813165,
-3.250914, -3, -6.087448,
-3.08333, -2, -5.813165,
-3.250914, -2, -6.087448,
-3.08333, -1, -5.813165,
-3.250914, -1, -6.087448,
-3.08333, 0, -5.813165,
-3.250914, 0, -6.087448,
-3.08333, 1, -5.813165,
-3.250914, 1, -6.087448,
-3.08333, 2, -5.813165,
-3.250914, 2, -6.087448
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
-3.586083, -3, -6.636014, 0, -0.5, 0.5, 0.5,
-3.586083, -3, -6.636014, 1, -0.5, 0.5, 0.5,
-3.586083, -3, -6.636014, 1, 1.5, 0.5, 0.5,
-3.586083, -3, -6.636014, 0, 1.5, 0.5, 0.5,
-3.586083, -2, -6.636014, 0, -0.5, 0.5, 0.5,
-3.586083, -2, -6.636014, 1, -0.5, 0.5, 0.5,
-3.586083, -2, -6.636014, 1, 1.5, 0.5, 0.5,
-3.586083, -2, -6.636014, 0, 1.5, 0.5, 0.5,
-3.586083, -1, -6.636014, 0, -0.5, 0.5, 0.5,
-3.586083, -1, -6.636014, 1, -0.5, 0.5, 0.5,
-3.586083, -1, -6.636014, 1, 1.5, 0.5, 0.5,
-3.586083, -1, -6.636014, 0, 1.5, 0.5, 0.5,
-3.586083, 0, -6.636014, 0, -0.5, 0.5, 0.5,
-3.586083, 0, -6.636014, 1, -0.5, 0.5, 0.5,
-3.586083, 0, -6.636014, 1, 1.5, 0.5, 0.5,
-3.586083, 0, -6.636014, 0, 1.5, 0.5, 0.5,
-3.586083, 1, -6.636014, 0, -0.5, 0.5, 0.5,
-3.586083, 1, -6.636014, 1, -0.5, 0.5, 0.5,
-3.586083, 1, -6.636014, 1, 1.5, 0.5, 0.5,
-3.586083, 1, -6.636014, 0, 1.5, 0.5, 0.5,
-3.586083, 2, -6.636014, 0, -0.5, 0.5, 0.5,
-3.586083, 2, -6.636014, 1, -0.5, 0.5, 0.5,
-3.586083, 2, -6.636014, 1, 1.5, 0.5, 0.5,
-3.586083, 2, -6.636014, 0, 1.5, 0.5, 0.5
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
-3.08333, -3.446124, -4,
-3.08333, -3.446124, 4,
-3.08333, -3.446124, -4,
-3.250914, -3.605431, -4,
-3.08333, -3.446124, -2,
-3.250914, -3.605431, -2,
-3.08333, -3.446124, 0,
-3.250914, -3.605431, 0,
-3.08333, -3.446124, 2,
-3.250914, -3.605431, 2,
-3.08333, -3.446124, 4,
-3.250914, -3.605431, 4
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
-3.586083, -3.924045, -4, 0, -0.5, 0.5, 0.5,
-3.586083, -3.924045, -4, 1, -0.5, 0.5, 0.5,
-3.586083, -3.924045, -4, 1, 1.5, 0.5, 0.5,
-3.586083, -3.924045, -4, 0, 1.5, 0.5, 0.5,
-3.586083, -3.924045, -2, 0, -0.5, 0.5, 0.5,
-3.586083, -3.924045, -2, 1, -0.5, 0.5, 0.5,
-3.586083, -3.924045, -2, 1, 1.5, 0.5, 0.5,
-3.586083, -3.924045, -2, 0, 1.5, 0.5, 0.5,
-3.586083, -3.924045, 0, 0, -0.5, 0.5, 0.5,
-3.586083, -3.924045, 0, 1, -0.5, 0.5, 0.5,
-3.586083, -3.924045, 0, 1, 1.5, 0.5, 0.5,
-3.586083, -3.924045, 0, 0, 1.5, 0.5, 0.5,
-3.586083, -3.924045, 2, 0, -0.5, 0.5, 0.5,
-3.586083, -3.924045, 2, 1, -0.5, 0.5, 0.5,
-3.586083, -3.924045, 2, 1, 1.5, 0.5, 0.5,
-3.586083, -3.924045, 2, 0, 1.5, 0.5, 0.5,
-3.586083, -3.924045, 4, 0, -0.5, 0.5, 0.5,
-3.586083, -3.924045, 4, 1, -0.5, 0.5, 0.5,
-3.586083, -3.924045, 4, 1, 1.5, 0.5, 0.5,
-3.586083, -3.924045, 4, 0, 1.5, 0.5, 0.5
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
-3.08333, -3.446124, -5.813165,
-3.08333, 2.926157, -5.813165,
-3.08333, -3.446124, 5.158147,
-3.08333, 2.926157, 5.158147,
-3.08333, -3.446124, -5.813165,
-3.08333, -3.446124, 5.158147,
-3.08333, 2.926157, -5.813165,
-3.08333, 2.926157, 5.158147,
-3.08333, -3.446124, -5.813165,
3.620038, -3.446124, -5.813165,
-3.08333, -3.446124, 5.158147,
3.620038, -3.446124, 5.158147,
-3.08333, 2.926157, -5.813165,
3.620038, 2.926157, -5.813165,
-3.08333, 2.926157, 5.158147,
3.620038, 2.926157, 5.158147,
3.620038, -3.446124, -5.813165,
3.620038, 2.926157, -5.813165,
3.620038, -3.446124, 5.158147,
3.620038, 2.926157, 5.158147,
3.620038, -3.446124, -5.813165,
3.620038, -3.446124, 5.158147,
3.620038, 2.926157, -5.813165,
3.620038, 2.926157, 5.158147
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
var radius = 7.662404;
var distance = 34.0909;
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
mvMatrix.translate( -0.2683538, 0.2599835, 0.3275089 );
mvMatrix.scale( 1.235907, 1.300122, 0.7551276 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.0909);
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
diflufenican<-read.table("diflufenican.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-diflufenican$V2
```

```
## Error in eval(expr, envir, enclos): object 'diflufenican' not found
```

```r
y<-diflufenican$V3
```

```
## Error in eval(expr, envir, enclos): object 'diflufenican' not found
```

```r
z<-diflufenican$V4
```

```
## Error in eval(expr, envir, enclos): object 'diflufenican' not found
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
-2.985708, -1.151031, -1.836543, 0, 0, 1, 1, 1,
-2.842796, 0.803708, -2.336325, 1, 0, 0, 1, 1,
-2.829055, -0.706009, -1.459867, 1, 0, 0, 1, 1,
-2.743583, 0.6443923, -2.361277, 1, 0, 0, 1, 1,
-2.743298, -0.003711171, -2.961911, 1, 0, 0, 1, 1,
-2.569161, -1.176544, -3.278803, 1, 0, 0, 1, 1,
-2.561226, -0.6575276, -1.976236, 0, 0, 0, 1, 1,
-2.525715, 1.38399, -1.062719, 0, 0, 0, 1, 1,
-2.472569, 0.8652085, -3.187079, 0, 0, 0, 1, 1,
-2.426471, 0.2367318, -1.511625, 0, 0, 0, 1, 1,
-2.279248, -0.0378357, -0.8786755, 0, 0, 0, 1, 1,
-2.257865, 1.13998, -1.42219, 0, 0, 0, 1, 1,
-2.230321, -0.9882537, -3.841902, 0, 0, 0, 1, 1,
-2.225916, -0.5294159, -2.727156, 1, 1, 1, 1, 1,
-2.222044, 0.6831607, -1.33489, 1, 1, 1, 1, 1,
-2.209336, 2.048315, 0.8394651, 1, 1, 1, 1, 1,
-2.184734, -0.3691696, -1.539643, 1, 1, 1, 1, 1,
-2.181328, -0.6650751, -1.08416, 1, 1, 1, 1, 1,
-2.163982, 1.826545, -3.723965, 1, 1, 1, 1, 1,
-2.120479, -0.3973946, -1.760496, 1, 1, 1, 1, 1,
-2.066124, 0.5635862, -2.005712, 1, 1, 1, 1, 1,
-2.045151, 0.5263081, -1.561179, 1, 1, 1, 1, 1,
-2.04292, 1.319644, -0.6256326, 1, 1, 1, 1, 1,
-2.027161, 0.7660248, -1.300848, 1, 1, 1, 1, 1,
-2.000811, -0.3171951, -0.3405864, 1, 1, 1, 1, 1,
-1.991334, -0.6334845, -2.383805, 1, 1, 1, 1, 1,
-1.97027, 0.4763864, -0.5189112, 1, 1, 1, 1, 1,
-1.968564, 0.514948, -1.484536, 1, 1, 1, 1, 1,
-1.96623, -0.006232074, -1.173549, 0, 0, 1, 1, 1,
-1.937163, 1.399703, -0.2940534, 1, 0, 0, 1, 1,
-1.933004, -1.012634, -0.3200592, 1, 0, 0, 1, 1,
-1.931696, -1.331094, -4.365997, 1, 0, 0, 1, 1,
-1.918246, 0.05035865, -1.890538, 1, 0, 0, 1, 1,
-1.899868, -1.57123, -4.552691, 1, 0, 0, 1, 1,
-1.887902, -0.5523085, -3.703473, 0, 0, 0, 1, 1,
-1.885124, -0.7458052, -2.310568, 0, 0, 0, 1, 1,
-1.859019, -1.640103, -2.143503, 0, 0, 0, 1, 1,
-1.854695, 0.1509535, 0.129599, 0, 0, 0, 1, 1,
-1.844663, 1.419445, -1.171705, 0, 0, 0, 1, 1,
-1.843941, 0.8381716, -3.359462, 0, 0, 0, 1, 1,
-1.840532, -1.46523, -1.335352, 0, 0, 0, 1, 1,
-1.8254, 0.3113679, -3.877138, 1, 1, 1, 1, 1,
-1.81483, -0.0410208, -3.163671, 1, 1, 1, 1, 1,
-1.777262, 0.8217468, -0.6659012, 1, 1, 1, 1, 1,
-1.762331, -0.4057399, -1.908478, 1, 1, 1, 1, 1,
-1.762312, 0.9047378, -0.3855039, 1, 1, 1, 1, 1,
-1.726599, -0.3195213, -1.519244, 1, 1, 1, 1, 1,
-1.726132, -1.739371, -3.267287, 1, 1, 1, 1, 1,
-1.717695, -0.4476267, -1.178177, 1, 1, 1, 1, 1,
-1.713048, 0.766286, -0.9770716, 1, 1, 1, 1, 1,
-1.708386, -0.343787, -3.494757, 1, 1, 1, 1, 1,
-1.699504, 1.450375, -0.7935696, 1, 1, 1, 1, 1,
-1.687974, 0.0951999, -1.425358, 1, 1, 1, 1, 1,
-1.687416, -0.3115816, -1.586671, 1, 1, 1, 1, 1,
-1.681265, -1.108371, -2.360439, 1, 1, 1, 1, 1,
-1.672924, -0.8526221, -3.321605, 1, 1, 1, 1, 1,
-1.668072, 0.3787403, -1.99198, 0, 0, 1, 1, 1,
-1.667706, -0.236882, -2.710749, 1, 0, 0, 1, 1,
-1.643141, 1.007859, -1.891954, 1, 0, 0, 1, 1,
-1.635189, -0.02071925, -3.413912, 1, 0, 0, 1, 1,
-1.631537, 0.9823068, -1.428673, 1, 0, 0, 1, 1,
-1.629751, -0.3448591, 0.7189295, 1, 0, 0, 1, 1,
-1.624503, 0.183683, -1.260627, 0, 0, 0, 1, 1,
-1.62301, 0.4488111, -0.6538523, 0, 0, 0, 1, 1,
-1.615627, 0.6100093, -3.639488, 0, 0, 0, 1, 1,
-1.615448, -0.559692, -2.064592, 0, 0, 0, 1, 1,
-1.603774, 0.1351931, -2.259039, 0, 0, 0, 1, 1,
-1.577098, 1.26038, -0.8881068, 0, 0, 0, 1, 1,
-1.572922, 1.352029, 0.1074822, 0, 0, 0, 1, 1,
-1.56484, 1.271125, -1.911384, 1, 1, 1, 1, 1,
-1.560454, 0.2163805, -3.303933, 1, 1, 1, 1, 1,
-1.543548, 1.810812, -1.203722, 1, 1, 1, 1, 1,
-1.535993, -0.7062685, -2.126939, 1, 1, 1, 1, 1,
-1.532716, -1.109745, -1.584018, 1, 1, 1, 1, 1,
-1.529339, -1.438345, -3.952696, 1, 1, 1, 1, 1,
-1.510524, -0.5317177, -2.389667, 1, 1, 1, 1, 1,
-1.491364, 0.2259761, -2.037714, 1, 1, 1, 1, 1,
-1.477911, -0.888989, 0.4845223, 1, 1, 1, 1, 1,
-1.473137, -0.350171, -2.534277, 1, 1, 1, 1, 1,
-1.458581, 1.824038, 0.2093562, 1, 1, 1, 1, 1,
-1.455945, -0.8746076, -2.808895, 1, 1, 1, 1, 1,
-1.436811, 0.4457338, -2.211994, 1, 1, 1, 1, 1,
-1.416712, 0.895132, -0.5142984, 1, 1, 1, 1, 1,
-1.399759, -0.6612809, -0.0004930184, 1, 1, 1, 1, 1,
-1.399348, 0.3179278, -1.89502, 0, 0, 1, 1, 1,
-1.38801, -1.219543, -2.341936, 1, 0, 0, 1, 1,
-1.374021, 0.4597732, -0.4076364, 1, 0, 0, 1, 1,
-1.365203, 1.027894, -1.837912, 1, 0, 0, 1, 1,
-1.358097, -0.0417907, 0.09926872, 1, 0, 0, 1, 1,
-1.349682, -1.378755, -2.41072, 1, 0, 0, 1, 1,
-1.348044, 0.1482331, -2.485378, 0, 0, 0, 1, 1,
-1.348035, -0.1662211, 0.05693308, 0, 0, 0, 1, 1,
-1.343957, 0.4068978, -2.580468, 0, 0, 0, 1, 1,
-1.33887, -0.0910553, -1.007965, 0, 0, 0, 1, 1,
-1.337662, -1.6112, -2.779813, 0, 0, 0, 1, 1,
-1.310372, -1.392112, -2.735146, 0, 0, 0, 1, 1,
-1.309835, 0.6727548, 0.7333903, 0, 0, 0, 1, 1,
-1.307634, -0.7600913, -0.9337587, 1, 1, 1, 1, 1,
-1.303962, -0.8866021, -1.802499, 1, 1, 1, 1, 1,
-1.29858, -0.9854958, -1.565069, 1, 1, 1, 1, 1,
-1.297449, 0.9369115, -1.260178, 1, 1, 1, 1, 1,
-1.2908, 0.04130884, -2.787418, 1, 1, 1, 1, 1,
-1.284582, -0.04121426, -0.3011078, 1, 1, 1, 1, 1,
-1.280501, 0.1819398, -1.162106, 1, 1, 1, 1, 1,
-1.273063, 0.6013408, -2.011256, 1, 1, 1, 1, 1,
-1.273033, 0.9032352, -0.5128663, 1, 1, 1, 1, 1,
-1.266766, -0.7194506, -4.546807, 1, 1, 1, 1, 1,
-1.257089, -0.4148969, -3.421131, 1, 1, 1, 1, 1,
-1.256306, -1.90638, -2.676002, 1, 1, 1, 1, 1,
-1.252942, -0.9105413, -2.380484, 1, 1, 1, 1, 1,
-1.251835, -0.8849102, -2.224002, 1, 1, 1, 1, 1,
-1.25158, -0.6089611, -4.514133, 1, 1, 1, 1, 1,
-1.245245, -0.5527975, -1.231787, 0, 0, 1, 1, 1,
-1.235228, -0.2511407, -2.529254, 1, 0, 0, 1, 1,
-1.223809, -0.02728885, -1.472889, 1, 0, 0, 1, 1,
-1.220789, 1.095033, 0.2367856, 1, 0, 0, 1, 1,
-1.219779, 0.7478608, -1.564786, 1, 0, 0, 1, 1,
-1.219337, 1.839491, -1.003331, 1, 0, 0, 1, 1,
-1.206924, 0.05355507, -3.877701, 0, 0, 0, 1, 1,
-1.197196, -0.1212877, -3.008116, 0, 0, 0, 1, 1,
-1.191119, -0.9911616, -2.552869, 0, 0, 0, 1, 1,
-1.18697, -1.627497, -2.142296, 0, 0, 0, 1, 1,
-1.185474, -0.5311863, -1.849816, 0, 0, 0, 1, 1,
-1.184613, -0.1439503, -1.403003, 0, 0, 0, 1, 1,
-1.184173, 0.6132374, -2.085285, 0, 0, 0, 1, 1,
-1.182058, 1.006088, -1.032968, 1, 1, 1, 1, 1,
-1.180645, -0.7201027, -0.7968466, 1, 1, 1, 1, 1,
-1.178168, -2.998697, -4.483211, 1, 1, 1, 1, 1,
-1.173759, 0.0889275, -1.127429, 1, 1, 1, 1, 1,
-1.170209, 0.576957, -2.031154, 1, 1, 1, 1, 1,
-1.168124, -0.4390646, -1.606734, 1, 1, 1, 1, 1,
-1.139245, -1.364431, -1.951507, 1, 1, 1, 1, 1,
-1.136137, 0.2299921, -1.929385, 1, 1, 1, 1, 1,
-1.133037, -0.03827048, -1.663803, 1, 1, 1, 1, 1,
-1.131136, 0.2650614, -1.2238, 1, 1, 1, 1, 1,
-1.127045, -0.8113589, -0.3115191, 1, 1, 1, 1, 1,
-1.124681, -0.08238029, -2.432205, 1, 1, 1, 1, 1,
-1.123622, -0.9449561, -1.758142, 1, 1, 1, 1, 1,
-1.112703, -0.4880616, -1.503404, 1, 1, 1, 1, 1,
-1.110558, -1.824767, -2.948326, 1, 1, 1, 1, 1,
-1.10417, 2.306784, 0.9691303, 0, 0, 1, 1, 1,
-1.103975, 1.770986, -0.2313621, 1, 0, 0, 1, 1,
-1.103296, -0.3623942, -2.153332, 1, 0, 0, 1, 1,
-1.097912, -1.351345, -2.833586, 1, 0, 0, 1, 1,
-1.091368, 0.4294223, -2.192636, 1, 0, 0, 1, 1,
-1.084875, 0.2391785, -2.576301, 1, 0, 0, 1, 1,
-1.076548, -2.000225, -2.415856, 0, 0, 0, 1, 1,
-1.076028, -1.168885, -3.351048, 0, 0, 0, 1, 1,
-1.074, 0.7020109, -1.538803, 0, 0, 0, 1, 1,
-1.070427, 0.05721217, -1.19741, 0, 0, 0, 1, 1,
-1.066509, 0.8227675, -1.5984, 0, 0, 0, 1, 1,
-1.065456, 1.514774, 2.515281, 0, 0, 0, 1, 1,
-1.06536, 0.245935, 1.26386, 0, 0, 0, 1, 1,
-1.062598, 0.7368344, -0.8108321, 1, 1, 1, 1, 1,
-1.059201, -0.9918859, -1.628789, 1, 1, 1, 1, 1,
-1.058268, 1.019391, -2.94957, 1, 1, 1, 1, 1,
-1.057592, 0.1804753, -1.291325, 1, 1, 1, 1, 1,
-1.056575, 1.531039, -1.126023, 1, 1, 1, 1, 1,
-1.056097, 2.126108, -1.169697, 1, 1, 1, 1, 1,
-1.055363, -1.347711, -2.16599, 1, 1, 1, 1, 1,
-1.054579, -0.4810061, -2.143697, 1, 1, 1, 1, 1,
-1.049896, -2.718492, -5.323974, 1, 1, 1, 1, 1,
-1.041207, -0.2007786, -1.684571, 1, 1, 1, 1, 1,
-1.032903, 1.620574, 0.5476283, 1, 1, 1, 1, 1,
-1.031676, 0.6475905, -0.4052592, 1, 1, 1, 1, 1,
-1.021448, 0.6543918, -2.330589, 1, 1, 1, 1, 1,
-1.011389, 0.2252696, -1.346537, 1, 1, 1, 1, 1,
-1.009424, -0.1390157, -1.150408, 1, 1, 1, 1, 1,
-0.99647, -0.9622665, -4.099501, 0, 0, 1, 1, 1,
-0.9955791, 0.05012211, -0.53861, 1, 0, 0, 1, 1,
-0.9863878, -0.3584943, -0.9716607, 1, 0, 0, 1, 1,
-0.9845412, 1.094333, 2.103316, 1, 0, 0, 1, 1,
-0.9680041, 0.7447151, 1.007002, 1, 0, 0, 1, 1,
-0.9679861, -0.2159131, -1.686498, 1, 0, 0, 1, 1,
-0.9614825, 2.794617, -0.6732479, 0, 0, 0, 1, 1,
-0.9604548, -1.506345, -0.7521833, 0, 0, 0, 1, 1,
-0.9507381, -0.4603644, -0.715878, 0, 0, 0, 1, 1,
-0.9459321, 0.2073743, -1.406782, 0, 0, 0, 1, 1,
-0.9447995, 1.88238, -0.3515718, 0, 0, 0, 1, 1,
-0.9410322, -1.13414, -2.584298, 0, 0, 0, 1, 1,
-0.9267173, 1.130188, 0.2295584, 0, 0, 0, 1, 1,
-0.926479, -0.232425, -1.370284, 1, 1, 1, 1, 1,
-0.9215822, -0.6557024, -1.163599, 1, 1, 1, 1, 1,
-0.9198377, 0.8365021, -1.381806, 1, 1, 1, 1, 1,
-0.9132368, 0.1553778, -1.366308, 1, 1, 1, 1, 1,
-0.9128112, 1.336705, 0.5175637, 1, 1, 1, 1, 1,
-0.9059637, -0.8519434, -2.664876, 1, 1, 1, 1, 1,
-0.8931799, -1.090434, -1.556835, 1, 1, 1, 1, 1,
-0.8887722, -1.168188, -3.531712, 1, 1, 1, 1, 1,
-0.888675, -0.7340643, -2.710045, 1, 1, 1, 1, 1,
-0.8863351, -0.4592434, -3.210193, 1, 1, 1, 1, 1,
-0.8857058, 1.833148, -1.352284, 1, 1, 1, 1, 1,
-0.8854243, 0.02486021, -0.6956078, 1, 1, 1, 1, 1,
-0.8833292, -0.6164557, -2.130558, 1, 1, 1, 1, 1,
-0.8820038, -0.3362754, -1.810619, 1, 1, 1, 1, 1,
-0.8772088, 1.397772, 0.9329075, 1, 1, 1, 1, 1,
-0.8767672, 0.4664613, -1.956426, 0, 0, 1, 1, 1,
-0.8766117, 0.4962353, -1.970097, 1, 0, 0, 1, 1,
-0.8752258, 0.4722652, -0.8531372, 1, 0, 0, 1, 1,
-0.8730256, 1.101333, -1.165173, 1, 0, 0, 1, 1,
-0.8726571, 0.6909959, -1.249111, 1, 0, 0, 1, 1,
-0.8699591, 0.006320216, -1.281153, 1, 0, 0, 1, 1,
-0.8613268, 0.2788535, -0.9735476, 0, 0, 0, 1, 1,
-0.860593, -0.2129725, -1.428183, 0, 0, 0, 1, 1,
-0.8604097, -0.5220868, -2.728783, 0, 0, 0, 1, 1,
-0.8589359, 2.357615, 0.2905757, 0, 0, 0, 1, 1,
-0.8582062, 1.508905, -1.075865, 0, 0, 0, 1, 1,
-0.8580639, -0.2043685, -1.08018, 0, 0, 0, 1, 1,
-0.8541477, -0.6554285, -1.398911, 0, 0, 0, 1, 1,
-0.8513228, -0.07791156, -2.000853, 1, 1, 1, 1, 1,
-0.8491097, 0.3797914, -0.7985842, 1, 1, 1, 1, 1,
-0.8439664, -0.744058, -2.930889, 1, 1, 1, 1, 1,
-0.835656, 0.5958303, -1.223762, 1, 1, 1, 1, 1,
-0.826539, -2.656127, -4.334279, 1, 1, 1, 1, 1,
-0.8176324, -0.1647913, -0.940546, 1, 1, 1, 1, 1,
-0.8170426, 2.575977, 0.2423652, 1, 1, 1, 1, 1,
-0.8101851, -1.201553, -2.642856, 1, 1, 1, 1, 1,
-0.8083872, 1.331407, -2.402337, 1, 1, 1, 1, 1,
-0.8050774, -0.5759209, -2.786866, 1, 1, 1, 1, 1,
-0.7980146, -0.108134, -2.869234, 1, 1, 1, 1, 1,
-0.7950307, 0.1890443, -2.85184, 1, 1, 1, 1, 1,
-0.7915636, -0.4971355, -1.13816, 1, 1, 1, 1, 1,
-0.7906026, 0.4875989, 1.104173, 1, 1, 1, 1, 1,
-0.7905928, 0.2821063, -2.217747, 1, 1, 1, 1, 1,
-0.7838521, -0.8499803, -3.034348, 0, 0, 1, 1, 1,
-0.7825096, -0.5952055, -1.79371, 1, 0, 0, 1, 1,
-0.781606, 1.370048, -0.161242, 1, 0, 0, 1, 1,
-0.7800466, 0.4760195, -0.5465035, 1, 0, 0, 1, 1,
-0.7792631, -0.8048335, -1.616999, 1, 0, 0, 1, 1,
-0.7790748, -0.4841868, -0.8272274, 1, 0, 0, 1, 1,
-0.7786556, 0.2155416, -0.3071208, 0, 0, 0, 1, 1,
-0.7750116, -0.3765126, -2.435829, 0, 0, 0, 1, 1,
-0.7731775, -1.073883, -2.634423, 0, 0, 0, 1, 1,
-0.7707257, -0.793903, -2.672626, 0, 0, 0, 1, 1,
-0.7696199, 1.150698, -2.070102, 0, 0, 0, 1, 1,
-0.7639292, -0.5653526, -3.449564, 0, 0, 0, 1, 1,
-0.7629611, -0.5721317, -2.6269, 0, 0, 0, 1, 1,
-0.7619751, 0.618148, -1.998741, 1, 1, 1, 1, 1,
-0.7619209, -1.43583, -2.934022, 1, 1, 1, 1, 1,
-0.7556514, -1.659328, -3.137604, 1, 1, 1, 1, 1,
-0.7515577, 1.325002, 0.299648, 1, 1, 1, 1, 1,
-0.7493619, -0.1955114, -2.029559, 1, 1, 1, 1, 1,
-0.7482454, 0.4100763, 1.174534, 1, 1, 1, 1, 1,
-0.7458541, -0.3645471, -0.1064488, 1, 1, 1, 1, 1,
-0.7423443, -0.3956289, -2.651695, 1, 1, 1, 1, 1,
-0.7405193, -1.061899, -1.643646, 1, 1, 1, 1, 1,
-0.7399491, -1.525038, -3.851871, 1, 1, 1, 1, 1,
-0.737485, -0.1379195, -3.194432, 1, 1, 1, 1, 1,
-0.7372763, 0.01340374, -2.216116, 1, 1, 1, 1, 1,
-0.7346706, -1.840487, -2.16612, 1, 1, 1, 1, 1,
-0.7295626, 0.7270928, 0.0125316, 1, 1, 1, 1, 1,
-0.7254158, 1.153458, 0.2241585, 1, 1, 1, 1, 1,
-0.7198264, -0.6365412, -2.515248, 0, 0, 1, 1, 1,
-0.7179527, -0.4734323, -1.638228, 1, 0, 0, 1, 1,
-0.7174149, 0.6155764, -1.691597, 1, 0, 0, 1, 1,
-0.7101021, -1.259043, -1.875684, 1, 0, 0, 1, 1,
-0.7065408, 0.3920328, -1.990161, 1, 0, 0, 1, 1,
-0.7058527, 1.564375, 1.23441, 1, 0, 0, 1, 1,
-0.7005184, 0.741958, -0.5176604, 0, 0, 0, 1, 1,
-0.6989357, 0.8108624, 0.7474735, 0, 0, 0, 1, 1,
-0.6979766, 0.236688, -2.720952, 0, 0, 0, 1, 1,
-0.6969767, 0.1274911, -3.288897, 0, 0, 0, 1, 1,
-0.6946424, 0.1304344, -2.09319, 0, 0, 0, 1, 1,
-0.6778937, -0.8812803, -1.455848, 0, 0, 0, 1, 1,
-0.6751211, -0.0564108, -0.5058941, 0, 0, 0, 1, 1,
-0.6710814, 0.965732, -0.2401144, 1, 1, 1, 1, 1,
-0.6695582, -0.1102178, -0.8209485, 1, 1, 1, 1, 1,
-0.6671543, 0.0289372, -1.749453, 1, 1, 1, 1, 1,
-0.662863, 0.1568553, -0.05194483, 1, 1, 1, 1, 1,
-0.6625543, 0.0831093, -1.059045, 1, 1, 1, 1, 1,
-0.6583466, -1.355318, -5.653389, 1, 1, 1, 1, 1,
-0.6566919, 0.05402897, -2.240072, 1, 1, 1, 1, 1,
-0.6490315, -1.617118, -1.715539, 1, 1, 1, 1, 1,
-0.644343, 0.8610078, -1.276711, 1, 1, 1, 1, 1,
-0.6434964, -0.2869059, -1.186712, 1, 1, 1, 1, 1,
-0.6433293, 1.506164, -1.110233, 1, 1, 1, 1, 1,
-0.638885, -0.4766374, -0.3995014, 1, 1, 1, 1, 1,
-0.6367418, 0.97037, -0.8495725, 1, 1, 1, 1, 1,
-0.6358716, 0.5530747, -0.9040671, 1, 1, 1, 1, 1,
-0.6341279, -0.1345355, -3.194271, 1, 1, 1, 1, 1,
-0.6267584, 0.07483922, -0.6785634, 0, 0, 1, 1, 1,
-0.6252511, -0.03384593, -1.240207, 1, 0, 0, 1, 1,
-0.6199169, 1.052448, 0.8584258, 1, 0, 0, 1, 1,
-0.6194441, -0.1945328, -2.019083, 1, 0, 0, 1, 1,
-0.6155809, 0.4209166, -1.509025, 1, 0, 0, 1, 1,
-0.6130769, -1.091016, -2.623259, 1, 0, 0, 1, 1,
-0.6107168, -0.2360648, -0.3202498, 0, 0, 0, 1, 1,
-0.6088405, 0.4843242, -1.095518, 0, 0, 0, 1, 1,
-0.6067249, 1.843836, 0.5774826, 0, 0, 0, 1, 1,
-0.6064873, 0.5580587, -0.1262078, 0, 0, 0, 1, 1,
-0.603315, -0.3443197, -3.395341, 0, 0, 0, 1, 1,
-0.6015638, 0.3599334, -2.273832, 0, 0, 0, 1, 1,
-0.597191, -1.674657, -3.295178, 0, 0, 0, 1, 1,
-0.5951574, 1.470497, -0.7415054, 1, 1, 1, 1, 1,
-0.5885617, -1.001197, -2.960664, 1, 1, 1, 1, 1,
-0.5876243, 0.6134338, -2.719958, 1, 1, 1, 1, 1,
-0.5809425, 0.5792315, -0.520897, 1, 1, 1, 1, 1,
-0.5801743, 0.01595889, -3.466499, 1, 1, 1, 1, 1,
-0.5772216, -1.910745, -3.436599, 1, 1, 1, 1, 1,
-0.5749853, -1.533244, -2.647002, 1, 1, 1, 1, 1,
-0.571382, 1.154793, 0.1328123, 1, 1, 1, 1, 1,
-0.5706396, -1.062484, -1.593255, 1, 1, 1, 1, 1,
-0.5699619, -1.424038, -2.051098, 1, 1, 1, 1, 1,
-0.5695509, -0.2195974, -0.7575419, 1, 1, 1, 1, 1,
-0.5681917, 1.192851, -1.533906, 1, 1, 1, 1, 1,
-0.5662805, -1.193273, -2.503632, 1, 1, 1, 1, 1,
-0.5593827, -1.125212, -1.165411, 1, 1, 1, 1, 1,
-0.5581397, 1.827911, -1.05275, 1, 1, 1, 1, 1,
-0.5581288, 0.3516183, -0.6406043, 0, 0, 1, 1, 1,
-0.5565885, 0.3673084, -0.2940306, 1, 0, 0, 1, 1,
-0.5533134, 1.264313, 0.1901363, 1, 0, 0, 1, 1,
-0.551023, -0.7541423, -1.732645, 1, 0, 0, 1, 1,
-0.5494257, 0.331997, -0.7283776, 1, 0, 0, 1, 1,
-0.5448799, -1.734007, -2.038068, 1, 0, 0, 1, 1,
-0.5423474, -0.5313501, -2.68101, 0, 0, 0, 1, 1,
-0.5410461, 0.5635654, 0.1934833, 0, 0, 0, 1, 1,
-0.5286583, -1.061135, -2.98821, 0, 0, 0, 1, 1,
-0.5225025, -1.772405, -2.629887, 0, 0, 0, 1, 1,
-0.5122553, 0.7101738, -0.6684003, 0, 0, 0, 1, 1,
-0.5108644, -2.453171, -1.983859, 0, 0, 0, 1, 1,
-0.5098474, -2.064875, -4.606172, 0, 0, 0, 1, 1,
-0.5062538, -0.8712021, -1.318723, 1, 1, 1, 1, 1,
-0.5021387, -1.050509, -2.08846, 1, 1, 1, 1, 1,
-0.5019493, -0.5339876, -2.090266, 1, 1, 1, 1, 1,
-0.4998867, -0.2695698, -3.37432, 1, 1, 1, 1, 1,
-0.4965518, -0.9381883, -2.895551, 1, 1, 1, 1, 1,
-0.4947219, -0.1747996, -0.7620934, 1, 1, 1, 1, 1,
-0.4848692, 0.5429133, 1.11892, 1, 1, 1, 1, 1,
-0.4822543, -0.8824903, -1.812223, 1, 1, 1, 1, 1,
-0.4757508, 0.5839345, -1.408629, 1, 1, 1, 1, 1,
-0.4742945, 1.825197, -1.562841, 1, 1, 1, 1, 1,
-0.4675257, -0.9170774, -4.131654, 1, 1, 1, 1, 1,
-0.4619434, -1.061101, -2.429277, 1, 1, 1, 1, 1,
-0.459089, -1.803799, -3.415966, 1, 1, 1, 1, 1,
-0.4581036, -0.6384495, -3.367601, 1, 1, 1, 1, 1,
-0.4581014, -1.63642, -2.959681, 1, 1, 1, 1, 1,
-0.4558429, -0.09199644, -0.7439977, 0, 0, 1, 1, 1,
-0.4517505, -2.560894, -4.733024, 1, 0, 0, 1, 1,
-0.4504343, 0.2718178, 0.3069277, 1, 0, 0, 1, 1,
-0.4467648, -1.018656, -1.913197, 1, 0, 0, 1, 1,
-0.4427239, -0.4553538, -2.785367, 1, 0, 0, 1, 1,
-0.4400933, -0.8157558, -3.818609, 1, 0, 0, 1, 1,
-0.439796, -1.340048, -3.35994, 0, 0, 0, 1, 1,
-0.4383037, -1.101541, -3.853942, 0, 0, 0, 1, 1,
-0.4360095, -0.2908324, -2.785797, 0, 0, 0, 1, 1,
-0.4342453, -0.8683678, -0.7326618, 0, 0, 0, 1, 1,
-0.4265912, -0.8188165, -3.622335, 0, 0, 0, 1, 1,
-0.4255117, 1.0219, -0.978093, 0, 0, 0, 1, 1,
-0.4253199, 0.8196702, -1.204043, 0, 0, 0, 1, 1,
-0.4197173, -0.008455351, -1.004206, 1, 1, 1, 1, 1,
-0.4171058, 0.4297709, 0.7707189, 1, 1, 1, 1, 1,
-0.4135953, 1.505157, -0.219038, 1, 1, 1, 1, 1,
-0.4111537, -0.5253007, -4.732253, 1, 1, 1, 1, 1,
-0.4064655, 0.742386, -0.9791595, 1, 1, 1, 1, 1,
-0.4056082, -1.577723, -2.29965, 1, 1, 1, 1, 1,
-0.4045278, 1.516884, 0.5112954, 1, 1, 1, 1, 1,
-0.4042637, 0.1650492, -0.1083042, 1, 1, 1, 1, 1,
-0.39749, -1.089486, -3.318758, 1, 1, 1, 1, 1,
-0.3932865, -0.152929, -0.4713717, 1, 1, 1, 1, 1,
-0.3931007, -0.4869544, 0.2214247, 1, 1, 1, 1, 1,
-0.3858103, 0.0515813, -0.4112403, 1, 1, 1, 1, 1,
-0.3801497, -1.473148, -4.005547, 1, 1, 1, 1, 1,
-0.3800442, 0.7029159, -1.017486, 1, 1, 1, 1, 1,
-0.3796421, 0.3306716, -1.38015, 1, 1, 1, 1, 1,
-0.3781015, 0.6956981, -0.09439529, 0, 0, 1, 1, 1,
-0.3765432, -1.671864, -1.620108, 1, 0, 0, 1, 1,
-0.3755313, -1.482731, -2.967594, 1, 0, 0, 1, 1,
-0.3717479, -0.5034446, -2.58727, 1, 0, 0, 1, 1,
-0.3632085, 0.7048853, 1.599985, 1, 0, 0, 1, 1,
-0.3630968, 0.4018306, -0.9856638, 1, 0, 0, 1, 1,
-0.3606133, -1.323011, -4.248606, 0, 0, 0, 1, 1,
-0.3585958, -0.4682248, -0.6893985, 0, 0, 0, 1, 1,
-0.3581595, 1.268782, -1.379355, 0, 0, 0, 1, 1,
-0.3569362, -0.5092167, -1.133254, 0, 0, 0, 1, 1,
-0.3560335, 0.5941965, 0.243197, 0, 0, 0, 1, 1,
-0.354187, -0.4976538, -1.199996, 0, 0, 0, 1, 1,
-0.3502626, -0.6171809, -2.206172, 0, 0, 0, 1, 1,
-0.3501315, 0.108026, -1.428878, 1, 1, 1, 1, 1,
-0.3363472, -1.598049, -1.506613, 1, 1, 1, 1, 1,
-0.3304053, -1.385779, -4.232306, 1, 1, 1, 1, 1,
-0.3269372, 0.3864072, -0.3382685, 1, 1, 1, 1, 1,
-0.3201515, 0.2297208, -1.649809, 1, 1, 1, 1, 1,
-0.3133669, 0.4246443, -2.080482, 1, 1, 1, 1, 1,
-0.3120417, 0.5677955, 0.0005246361, 1, 1, 1, 1, 1,
-0.3103108, 1.364663, -0.4870144, 1, 1, 1, 1, 1,
-0.3077968, -0.3064686, -1.017828, 1, 1, 1, 1, 1,
-0.3040325, -0.02665413, 0.157074, 1, 1, 1, 1, 1,
-0.303589, 0.6966571, -0.47702, 1, 1, 1, 1, 1,
-0.3021717, 0.377738, 0.2224907, 1, 1, 1, 1, 1,
-0.2984497, -1.242892, -2.784064, 1, 1, 1, 1, 1,
-0.2964704, 0.2605944, -1.332481, 1, 1, 1, 1, 1,
-0.2941318, 0.7433617, -2.823017, 1, 1, 1, 1, 1,
-0.2940005, -1.046917, -3.036786, 0, 0, 1, 1, 1,
-0.2920428, -0.9614251, -3.602161, 1, 0, 0, 1, 1,
-0.2898411, 0.923612, -0.4055113, 1, 0, 0, 1, 1,
-0.2890618, -0.04398451, -1.998007, 1, 0, 0, 1, 1,
-0.2854027, -1.280059, -3.994421, 1, 0, 0, 1, 1,
-0.2840505, -0.3213688, -1.617069, 1, 0, 0, 1, 1,
-0.2826075, 0.8504279, 1.406535, 0, 0, 0, 1, 1,
-0.281251, -0.8648974, -2.550851, 0, 0, 0, 1, 1,
-0.2758051, 0.351913, 0.8852072, 0, 0, 0, 1, 1,
-0.2735195, 0.887895, -0.4374815, 0, 0, 0, 1, 1,
-0.2718669, 0.1121342, -1.812771, 0, 0, 0, 1, 1,
-0.2715728, -1.313101, -2.984826, 0, 0, 0, 1, 1,
-0.2700008, 0.7189077, -3.005184, 0, 0, 0, 1, 1,
-0.2674143, -0.3412692, -2.49417, 1, 1, 1, 1, 1,
-0.2624206, -0.1400404, -0.8108767, 1, 1, 1, 1, 1,
-0.2609118, 1.342501, 0.5787721, 1, 1, 1, 1, 1,
-0.25961, -0.345252, -2.697221, 1, 1, 1, 1, 1,
-0.2593415, -1.049309, -2.234318, 1, 1, 1, 1, 1,
-0.2572213, -0.7422585, -3.006577, 1, 1, 1, 1, 1,
-0.2572144, -0.04657992, -1.668663, 1, 1, 1, 1, 1,
-0.2559857, 0.865977, -0.1937542, 1, 1, 1, 1, 1,
-0.2557073, 0.6108156, -0.5661883, 1, 1, 1, 1, 1,
-0.2514021, -0.8686519, -3.910146, 1, 1, 1, 1, 1,
-0.2487473, -1.409324, -2.64818, 1, 1, 1, 1, 1,
-0.2482568, -0.6665688, -4.471397, 1, 1, 1, 1, 1,
-0.2476915, 0.3847479, 0.7134404, 1, 1, 1, 1, 1,
-0.2460369, 0.595729, -1.02833, 1, 1, 1, 1, 1,
-0.2451578, 0.8014673, -1.70119, 1, 1, 1, 1, 1,
-0.2358398, 1.178356, 0.02982794, 0, 0, 1, 1, 1,
-0.2351464, -0.2037877, -2.380296, 1, 0, 0, 1, 1,
-0.2345834, 0.888705, -0.3127189, 1, 0, 0, 1, 1,
-0.2338124, 0.03265717, -2.682818, 1, 0, 0, 1, 1,
-0.2309031, -0.1978495, -1.875933, 1, 0, 0, 1, 1,
-0.2286262, -0.2985753, -2.722536, 1, 0, 0, 1, 1,
-0.2262907, -0.1289477, -2.020925, 0, 0, 0, 1, 1,
-0.2201335, -0.08238687, -1.795746, 0, 0, 0, 1, 1,
-0.2122792, -0.4582146, -0.7931426, 0, 0, 0, 1, 1,
-0.2087741, -0.7671068, -1.951299, 0, 0, 0, 1, 1,
-0.2064676, 1.655862, 0.6201357, 0, 0, 0, 1, 1,
-0.2062838, -0.1650345, -1.340788, 0, 0, 0, 1, 1,
-0.1968539, -0.9018629, -2.409389, 0, 0, 0, 1, 1,
-0.1959753, 0.4567812, -0.1744731, 1, 1, 1, 1, 1,
-0.1782724, 0.6362457, -0.2365475, 1, 1, 1, 1, 1,
-0.1780182, 1.97857, -0.6330475, 1, 1, 1, 1, 1,
-0.1760295, 0.07515194, 1.174992, 1, 1, 1, 1, 1,
-0.1728205, 0.2737843, -0.1264847, 1, 1, 1, 1, 1,
-0.1661683, 0.7888845, 0.1071641, 1, 1, 1, 1, 1,
-0.1614845, -0.4915588, -3.11346, 1, 1, 1, 1, 1,
-0.1603217, 1.418841, -0.7683345, 1, 1, 1, 1, 1,
-0.158885, -1.249885, -3.556234, 1, 1, 1, 1, 1,
-0.1566158, -0.1043407, -0.776235, 1, 1, 1, 1, 1,
-0.1558342, -0.4788092, -2.892272, 1, 1, 1, 1, 1,
-0.154413, 1.350155, -1.017207, 1, 1, 1, 1, 1,
-0.1540188, 0.7654276, -0.6538911, 1, 1, 1, 1, 1,
-0.1511368, 0.7820061, -0.9428518, 1, 1, 1, 1, 1,
-0.145065, -0.1632386, -1.996294, 1, 1, 1, 1, 1,
-0.1438888, -0.007954915, -0.2064652, 0, 0, 1, 1, 1,
-0.1380107, -1.272562, -2.823398, 1, 0, 0, 1, 1,
-0.1364588, -1.123705, -3.230405, 1, 0, 0, 1, 1,
-0.1357708, -0.688648, -2.295538, 1, 0, 0, 1, 1,
-0.1351772, -0.09001218, -1.747974, 1, 0, 0, 1, 1,
-0.1332151, -0.7954676, -2.7235, 1, 0, 0, 1, 1,
-0.1231976, -0.9490774, -1.6336, 0, 0, 0, 1, 1,
-0.1229614, 0.9767067, 0.8730946, 0, 0, 0, 1, 1,
-0.122782, -0.8469682, -3.101725, 0, 0, 0, 1, 1,
-0.1213694, 0.2234503, -0.7509038, 0, 0, 0, 1, 1,
-0.1182955, 0.3303412, -0.8977487, 0, 0, 0, 1, 1,
-0.1163969, 0.4502584, -1.366153, 0, 0, 0, 1, 1,
-0.1144573, -1.473135, -2.691011, 0, 0, 0, 1, 1,
-0.1111402, 0.03260246, -0.391722, 1, 1, 1, 1, 1,
-0.1108561, -0.5230684, -2.448678, 1, 1, 1, 1, 1,
-0.1080337, -1.028523, -4.103475, 1, 1, 1, 1, 1,
-0.1023716, -0.3905907, -1.810492, 1, 1, 1, 1, 1,
-0.1003312, 0.3133855, -0.8973255, 1, 1, 1, 1, 1,
-0.0908663, 0.4855686, 0.9324337, 1, 1, 1, 1, 1,
-0.08590057, 0.4636856, 1.332338, 1, 1, 1, 1, 1,
-0.08550459, -0.2108563, -2.130751, 1, 1, 1, 1, 1,
-0.08384782, -1.492523, -0.9031775, 1, 1, 1, 1, 1,
-0.08358575, 0.7327636, -1.829017, 1, 1, 1, 1, 1,
-0.08162905, 0.6734591, 1.182417, 1, 1, 1, 1, 1,
-0.07940067, 0.04310343, -1.027436, 1, 1, 1, 1, 1,
-0.07857963, -0.1541023, -2.657516, 1, 1, 1, 1, 1,
-0.0774383, 1.678272, -1.185053, 1, 1, 1, 1, 1,
-0.07436614, -0.3343552, -5.032978, 1, 1, 1, 1, 1,
-0.07417839, 0.6381143, 0.3860171, 0, 0, 1, 1, 1,
-0.07127175, -0.1587516, -3.546999, 1, 0, 0, 1, 1,
-0.0668281, 0.3209003, -1.004604, 1, 0, 0, 1, 1,
-0.06101478, 1.025922, 0.2817855, 1, 0, 0, 1, 1,
-0.05621726, -1.055221, -4.563181, 1, 0, 0, 1, 1,
-0.05247616, -2.631214, -3.832364, 1, 0, 0, 1, 1,
-0.05095144, 0.8186807, -0.5971184, 0, 0, 0, 1, 1,
-0.0505353, 1.469799, 0.3967502, 0, 0, 0, 1, 1,
-0.04931201, 0.03371515, -1.404829, 0, 0, 0, 1, 1,
-0.04352184, -2.4769, -2.862176, 0, 0, 0, 1, 1,
-0.04261791, -0.3599598, -3.714046, 0, 0, 0, 1, 1,
-0.03754123, 0.5812977, 0.2506, 0, 0, 0, 1, 1,
-0.03648578, -0.8036357, -1.851445, 0, 0, 0, 1, 1,
-0.03607607, -0.8660554, -3.18954, 1, 1, 1, 1, 1,
-0.03536088, 0.1277405, -1.09771, 1, 1, 1, 1, 1,
-0.03438556, -0.9018105, -3.461809, 1, 1, 1, 1, 1,
-0.03398518, 1.395567, -1.458067, 1, 1, 1, 1, 1,
-0.0312019, 0.3330052, -0.9283462, 1, 1, 1, 1, 1,
-0.02309694, -0.6269892, -2.617304, 1, 1, 1, 1, 1,
-0.02203718, 0.8867154, 1.218541, 1, 1, 1, 1, 1,
-0.0109589, 1.558194, 0.2922145, 1, 1, 1, 1, 1,
-0.01069901, -0.9013308, -2.050958, 1, 1, 1, 1, 1,
-0.006813521, 1.066607, 1.703999, 1, 1, 1, 1, 1,
-0.005990705, 1.997209, -0.6821093, 1, 1, 1, 1, 1,
-0.004151777, -0.002315064, -1.955682, 1, 1, 1, 1, 1,
0.001268703, 2.140295, -1.536385, 1, 1, 1, 1, 1,
0.001957468, -0.9798698, 3.294619, 1, 1, 1, 1, 1,
0.003542936, 0.3752364, 0.0301925, 1, 1, 1, 1, 1,
0.009445618, 0.919553, -0.7470599, 0, 0, 1, 1, 1,
0.01202859, 1.02221, 0.4859251, 1, 0, 0, 1, 1,
0.01655538, -2.179417, 3.202558, 1, 0, 0, 1, 1,
0.02126461, -0.2497743, 3.256323, 1, 0, 0, 1, 1,
0.02175636, 0.230107, 0.1507173, 1, 0, 0, 1, 1,
0.02348486, -0.5013039, 3.120779, 1, 0, 0, 1, 1,
0.02492222, 0.4242091, 0.8021957, 0, 0, 0, 1, 1,
0.02561315, 0.1574116, 0.7514489, 0, 0, 0, 1, 1,
0.02633669, -0.7208008, 3.607058, 0, 0, 0, 1, 1,
0.02645355, -0.8987071, 2.832179, 0, 0, 0, 1, 1,
0.02676172, -0.9574879, 4.146346, 0, 0, 0, 1, 1,
0.02823677, 0.0285482, 1.230543, 0, 0, 0, 1, 1,
0.03058063, -1.437369, 1.838203, 0, 0, 0, 1, 1,
0.03205423, 0.06172554, 0.9400307, 1, 1, 1, 1, 1,
0.04345129, -0.08541539, 2.717854, 1, 1, 1, 1, 1,
0.04842489, -1.350364, 2.913257, 1, 1, 1, 1, 1,
0.05169592, 1.205269, 1.044096, 1, 1, 1, 1, 1,
0.05253556, -0.1788897, 2.151381, 1, 1, 1, 1, 1,
0.05718754, 0.7660474, 0.8874671, 1, 1, 1, 1, 1,
0.059227, -0.1582503, 1.339133, 1, 1, 1, 1, 1,
0.06248043, -0.1558248, 4.194691, 1, 1, 1, 1, 1,
0.06314476, -2.045429, 4.381948, 1, 1, 1, 1, 1,
0.065533, 0.3432606, -0.7702425, 1, 1, 1, 1, 1,
0.07321468, 0.1130724, 0.1984021, 1, 1, 1, 1, 1,
0.07420234, -0.4298635, 2.670993, 1, 1, 1, 1, 1,
0.08389674, -0.9489114, 3.028818, 1, 1, 1, 1, 1,
0.08567673, -0.5658722, 2.797925, 1, 1, 1, 1, 1,
0.09095766, 0.06629208, 0.989601, 1, 1, 1, 1, 1,
0.09352848, -0.8696886, 2.408577, 0, 0, 1, 1, 1,
0.09404223, 1.547339, 0.40704, 1, 0, 0, 1, 1,
0.09669689, 0.04348218, 0.5748129, 1, 0, 0, 1, 1,
0.09726501, -0.2642037, 2.529943, 1, 0, 0, 1, 1,
0.0976838, 1.295642, -0.4765981, 1, 0, 0, 1, 1,
0.09785662, -0.4980946, 1.969609, 1, 0, 0, 1, 1,
0.0985176, 0.3802705, 0.8181631, 0, 0, 0, 1, 1,
0.09876297, -0.1040905, 2.931366, 0, 0, 0, 1, 1,
0.1027983, -1.359169, 1.563799, 0, 0, 0, 1, 1,
0.105462, -1.701966, 2.025804, 0, 0, 0, 1, 1,
0.1059845, -0.06315327, 0.7147383, 0, 0, 0, 1, 1,
0.1065993, -0.4700049, 2.786885, 0, 0, 0, 1, 1,
0.107534, 0.07412517, 1.059861, 0, 0, 0, 1, 1,
0.1099994, 0.4862998, -0.4086309, 1, 1, 1, 1, 1,
0.1169819, -0.5418847, 1.145336, 1, 1, 1, 1, 1,
0.1171076, -0.3489119, 1.173761, 1, 1, 1, 1, 1,
0.123454, 0.3811892, 0.584174, 1, 1, 1, 1, 1,
0.1290951, 0.1601092, 1.571262, 1, 1, 1, 1, 1,
0.1337855, -1.409986, 1.96535, 1, 1, 1, 1, 1,
0.1347212, 2.142492, -0.3731868, 1, 1, 1, 1, 1,
0.1386037, -0.8339103, 3.391052, 1, 1, 1, 1, 1,
0.1453854, 1.329984, -1.051118, 1, 1, 1, 1, 1,
0.1456364, 0.8619636, -1.69189, 1, 1, 1, 1, 1,
0.1473618, 0.9295477, 1.755888, 1, 1, 1, 1, 1,
0.1530282, -0.2239903, 2.871768, 1, 1, 1, 1, 1,
0.1536158, -0.1474165, 2.976835, 1, 1, 1, 1, 1,
0.1543796, -0.8493713, 3.118764, 1, 1, 1, 1, 1,
0.1563442, -0.8170015, 1.893187, 1, 1, 1, 1, 1,
0.1612212, -0.07720917, 1.971865, 0, 0, 1, 1, 1,
0.1651464, -1.013912, 1.666242, 1, 0, 0, 1, 1,
0.1653361, -0.892482, 3.818253, 1, 0, 0, 1, 1,
0.1704293, -0.6442171, 1.878049, 1, 0, 0, 1, 1,
0.1722835, -0.7218104, 4.952376, 1, 0, 0, 1, 1,
0.1734326, -1.274424, 4.041468, 1, 0, 0, 1, 1,
0.1760167, 0.455719, -0.3822585, 0, 0, 0, 1, 1,
0.1773469, -1.267204, 2.071732, 0, 0, 0, 1, 1,
0.177693, -1.06131, 2.07156, 0, 0, 0, 1, 1,
0.1794071, -1.677849, 3.135182, 0, 0, 0, 1, 1,
0.1856675, 0.9270902, -0.2593488, 0, 0, 0, 1, 1,
0.1865059, -1.132536, 4.425334, 0, 0, 0, 1, 1,
0.1883959, 0.5566232, 0.2564307, 0, 0, 0, 1, 1,
0.1897864, 2.627712, -1.929081, 1, 1, 1, 1, 1,
0.191665, -0.3921319, 3.552979, 1, 1, 1, 1, 1,
0.1958, 1.21705, -0.2765676, 1, 1, 1, 1, 1,
0.2034949, -0.1272495, 0.8571779, 1, 1, 1, 1, 1,
0.2044314, -0.2512259, 1.034552, 1, 1, 1, 1, 1,
0.2049235, -1.721775, 2.885177, 1, 1, 1, 1, 1,
0.2090919, 0.4936379, 1.2214, 1, 1, 1, 1, 1,
0.2100983, -0.6433541, 1.723559, 1, 1, 1, 1, 1,
0.2118938, 0.5274733, -0.5601643, 1, 1, 1, 1, 1,
0.2145338, -0.5654627, 3.355683, 1, 1, 1, 1, 1,
0.2148332, -0.06630312, 0.8711039, 1, 1, 1, 1, 1,
0.2154699, -1.310666, 3.938989, 1, 1, 1, 1, 1,
0.217996, -0.5358219, 2.631715, 1, 1, 1, 1, 1,
0.2186616, -1.137225, 3.474308, 1, 1, 1, 1, 1,
0.219452, 0.6477889, 0.05798586, 1, 1, 1, 1, 1,
0.2199909, 1.357641, 0.584114, 0, 0, 1, 1, 1,
0.2216608, 0.5603203, -1.241651, 1, 0, 0, 1, 1,
0.2222608, 0.644724, -0.9969039, 1, 0, 0, 1, 1,
0.2230567, 0.6850156, 1.102351, 1, 0, 0, 1, 1,
0.2355696, 0.3986746, -0.6877024, 1, 0, 0, 1, 1,
0.2360947, -2.097171, 3.279775, 1, 0, 0, 1, 1,
0.2395194, -0.03988845, 1.607941, 0, 0, 0, 1, 1,
0.2405632, 0.1448344, 1.452929, 0, 0, 0, 1, 1,
0.2414404, -1.246804, 2.580146, 0, 0, 0, 1, 1,
0.2418172, -0.3441857, 3.861455, 0, 0, 0, 1, 1,
0.2418472, 0.7850494, -0.6956774, 0, 0, 0, 1, 1,
0.2473589, 0.9465792, 1.680807, 0, 0, 0, 1, 1,
0.2529739, -0.638857, 1.340138, 0, 0, 0, 1, 1,
0.2530218, -0.3644505, 1.888554, 1, 1, 1, 1, 1,
0.2621463, 0.5839102, 0.8953469, 1, 1, 1, 1, 1,
0.2731245, 0.2477036, 1.450059, 1, 1, 1, 1, 1,
0.2784077, -0.2455759, 2.269479, 1, 1, 1, 1, 1,
0.2807219, -0.8223585, 4.330632, 1, 1, 1, 1, 1,
0.2824818, -0.2269181, 2.59807, 1, 1, 1, 1, 1,
0.2838086, 0.9378893, -0.519927, 1, 1, 1, 1, 1,
0.2851709, 0.6688402, 2.133304, 1, 1, 1, 1, 1,
0.2880187, -0.9356392, 2.924074, 1, 1, 1, 1, 1,
0.2907275, 0.4185385, 1.338625, 1, 1, 1, 1, 1,
0.3000209, 0.4961897, 1.114933, 1, 1, 1, 1, 1,
0.3007491, -0.6356902, 1.881187, 1, 1, 1, 1, 1,
0.3039754, -2.198296, 4.102154, 1, 1, 1, 1, 1,
0.3048918, 2.213866, -0.7224922, 1, 1, 1, 1, 1,
0.3119682, 0.3828088, -1.603583, 1, 1, 1, 1, 1,
0.3128958, -0.1834897, 3.97409, 0, 0, 1, 1, 1,
0.3138836, -0.6946574, 2.189136, 1, 0, 0, 1, 1,
0.3191898, 0.3400832, 1.647366, 1, 0, 0, 1, 1,
0.3199029, 0.8772319, -0.768846, 1, 0, 0, 1, 1,
0.3239256, 0.9236917, -2.383419, 1, 0, 0, 1, 1,
0.324879, 2.833357, 1.93202, 1, 0, 0, 1, 1,
0.3279493, -0.6657318, 2.526099, 0, 0, 0, 1, 1,
0.3295602, -0.4389746, 2.735705, 0, 0, 0, 1, 1,
0.3319149, 0.4613107, 0.6750044, 0, 0, 0, 1, 1,
0.3338259, 1.866423, 0.1704306, 0, 0, 0, 1, 1,
0.3373949, 0.3062026, 2.014373, 0, 0, 0, 1, 1,
0.3403732, 0.1984443, 0.8426332, 0, 0, 0, 1, 1,
0.3425255, 0.007737301, 1.39482, 0, 0, 0, 1, 1,
0.343916, 0.05835125, 1.277371, 1, 1, 1, 1, 1,
0.3440616, -3.353324, 2.588224, 1, 1, 1, 1, 1,
0.3473494, 0.5171692, 2.175719, 1, 1, 1, 1, 1,
0.3578113, 0.5177224, 0.3142295, 1, 1, 1, 1, 1,
0.3584089, 0.9303384, 0.07329719, 1, 1, 1, 1, 1,
0.3590485, 0.3561364, 1.896757, 1, 1, 1, 1, 1,
0.3609674, 0.3332919, 0.1011835, 1, 1, 1, 1, 1,
0.36483, 0.2310946, 0.1487092, 1, 1, 1, 1, 1,
0.3651075, 0.9510316, 1.975827, 1, 1, 1, 1, 1,
0.3726733, -0.4278941, 2.253613, 1, 1, 1, 1, 1,
0.3741455, -0.3032919, 3.767761, 1, 1, 1, 1, 1,
0.375748, 0.3476732, 0.3427326, 1, 1, 1, 1, 1,
0.3790294, -0.8958278, 1.332967, 1, 1, 1, 1, 1,
0.3801418, 0.108249, 0.1340973, 1, 1, 1, 1, 1,
0.3812747, 0.6898945, 0.7257084, 1, 1, 1, 1, 1,
0.3830088, 1.543772, 0.6586648, 0, 0, 1, 1, 1,
0.3848238, 0.8560185, -1.496945, 1, 0, 0, 1, 1,
0.3849742, 0.5116625, -0.8395394, 1, 0, 0, 1, 1,
0.3868341, -1.793506, 0.7059023, 1, 0, 0, 1, 1,
0.3871515, 0.4720786, -1.148845, 1, 0, 0, 1, 1,
0.3874574, 0.9043419, 0.7775171, 1, 0, 0, 1, 1,
0.3891779, -0.5377885, 3.11169, 0, 0, 0, 1, 1,
0.3919955, 1.032322, -0.3930692, 0, 0, 0, 1, 1,
0.3998305, -0.4272998, 2.572127, 0, 0, 0, 1, 1,
0.3999322, 1.568601, 0.3453805, 0, 0, 0, 1, 1,
0.4024954, 0.1756343, -1.243363, 0, 0, 0, 1, 1,
0.4088005, 1.6117, 0.2184057, 0, 0, 0, 1, 1,
0.4103929, -1.533185, 3.755919, 0, 0, 0, 1, 1,
0.4127678, -0.2464098, 1.720989, 1, 1, 1, 1, 1,
0.4150855, 0.7112054, -0.4475499, 1, 1, 1, 1, 1,
0.4161389, 0.9081569, 1.103201, 1, 1, 1, 1, 1,
0.4174133, -0.3800096, 1.597015, 1, 1, 1, 1, 1,
0.4178048, 0.397854, 1.283458, 1, 1, 1, 1, 1,
0.4180553, 0.5437133, 1.848303, 1, 1, 1, 1, 1,
0.4247526, 1.036838, 0.6006603, 1, 1, 1, 1, 1,
0.4262989, -0.2378988, 3.203356, 1, 1, 1, 1, 1,
0.4284971, -0.5829504, 3.042842, 1, 1, 1, 1, 1,
0.4287487, -1.011637, 3.578101, 1, 1, 1, 1, 1,
0.4306162, 0.7988527, 0.1017419, 1, 1, 1, 1, 1,
0.4334031, 0.4478496, -0.03911641, 1, 1, 1, 1, 1,
0.4358355, 0.2944269, -1.091909, 1, 1, 1, 1, 1,
0.4387538, 0.05427565, 3.069108, 1, 1, 1, 1, 1,
0.4418862, 0.3116542, -0.2304215, 1, 1, 1, 1, 1,
0.4459917, -1.114879, 2.857449, 0, 0, 1, 1, 1,
0.4472055, -0.008414045, 1.457373, 1, 0, 0, 1, 1,
0.4508901, 1.149692, 0.4929529, 1, 0, 0, 1, 1,
0.4529065, 0.7267782, 0.4115084, 1, 0, 0, 1, 1,
0.4548005, -1.304804, 2.9276, 1, 0, 0, 1, 1,
0.460028, 0.7612755, 1.744851, 1, 0, 0, 1, 1,
0.4622363, 1.714805, 0.9597001, 0, 0, 0, 1, 1,
0.4640659, -0.9741525, 4.192608, 0, 0, 0, 1, 1,
0.4647108, 1.079307, -1.193306, 0, 0, 0, 1, 1,
0.4698696, -1.464927, 2.854653, 0, 0, 0, 1, 1,
0.4778111, -0.8519776, 2.840276, 0, 0, 0, 1, 1,
0.4790867, -0.4255598, 1.267152, 0, 0, 0, 1, 1,
0.4846851, 0.6782903, 0.8298458, 0, 0, 0, 1, 1,
0.4847925, 0.4774355, 1.333638, 1, 1, 1, 1, 1,
0.4873775, -0.3610359, 0.9555203, 1, 1, 1, 1, 1,
0.4882126, -0.1551819, 2.376382, 1, 1, 1, 1, 1,
0.4904286, -1.232325, -0.9066676, 1, 1, 1, 1, 1,
0.4990805, -1.69088, 4.486947, 1, 1, 1, 1, 1,
0.5002041, -0.381192, 2.473832, 1, 1, 1, 1, 1,
0.5008965, 0.2499298, 1.475108, 1, 1, 1, 1, 1,
0.5025563, -1.049935, 3.123055, 1, 1, 1, 1, 1,
0.5036051, 0.8048258, 0.8735549, 1, 1, 1, 1, 1,
0.5050203, -0.3953405, -0.3615239, 1, 1, 1, 1, 1,
0.5068014, -0.11426, 0.8147118, 1, 1, 1, 1, 1,
0.5116726, -0.1263382, 0.08390361, 1, 1, 1, 1, 1,
0.5121374, 0.3880941, 0.8849649, 1, 1, 1, 1, 1,
0.5124747, -1.649545, 2.692446, 1, 1, 1, 1, 1,
0.5126759, -0.9743319, 1.129413, 1, 1, 1, 1, 1,
0.5148365, -0.0005767534, 1.097826, 0, 0, 1, 1, 1,
0.5150868, -1.855875, 4.998371, 1, 0, 0, 1, 1,
0.5169474, -0.5443656, 2.470654, 1, 0, 0, 1, 1,
0.5209125, 1.147223, 0.7358984, 1, 0, 0, 1, 1,
0.5211135, -0.3494154, 4.14667, 1, 0, 0, 1, 1,
0.5237129, -1.069585, 3.022566, 1, 0, 0, 1, 1,
0.5237389, 0.8944703, 1.761932, 0, 0, 0, 1, 1,
0.5261654, -0.4886563, 2.793517, 0, 0, 0, 1, 1,
0.5299717, 1.166695, 0.2494868, 0, 0, 0, 1, 1,
0.5327635, -2.264167, 3.004784, 0, 0, 0, 1, 1,
0.5351709, 0.2697678, 0.2339878, 0, 0, 0, 1, 1,
0.5461133, -0.5306945, 3.503453, 0, 0, 0, 1, 1,
0.5517288, -0.6011654, 2.368493, 0, 0, 0, 1, 1,
0.5567179, -0.3509023, 2.622767, 1, 1, 1, 1, 1,
0.558009, 0.811056, 3.142868, 1, 1, 1, 1, 1,
0.5585064, 0.3031503, 0.8654534, 1, 1, 1, 1, 1,
0.5603577, 0.5901594, 0.1932532, 1, 1, 1, 1, 1,
0.5607796, -0.9810715, 2.218344, 1, 1, 1, 1, 1,
0.5631733, 0.4839714, 1.508257, 1, 1, 1, 1, 1,
0.5662175, -0.3777881, 4.236187, 1, 1, 1, 1, 1,
0.5713654, -0.686461, 2.736736, 1, 1, 1, 1, 1,
0.5731567, -0.874944, 1.986384, 1, 1, 1, 1, 1,
0.5768605, -0.8550192, 1.998338, 1, 1, 1, 1, 1,
0.5786276, 0.6508008, 0.6381364, 1, 1, 1, 1, 1,
0.5818866, -0.4021466, 1.394678, 1, 1, 1, 1, 1,
0.5827453, -0.431655, 4.166565, 1, 1, 1, 1, 1,
0.583144, 0.635798, -0.1747433, 1, 1, 1, 1, 1,
0.5863343, -0.1185762, 3.212261, 1, 1, 1, 1, 1,
0.5865695, 0.160309, 1.471435, 0, 0, 1, 1, 1,
0.5887741, 2.578398, 1.180304, 1, 0, 0, 1, 1,
0.5930521, -0.3402674, 2.889867, 1, 0, 0, 1, 1,
0.5944121, 0.5091503, 2.101658, 1, 0, 0, 1, 1,
0.6015837, 0.5454893, 0.6070146, 1, 0, 0, 1, 1,
0.6017497, -0.7661358, 0.9318394, 1, 0, 0, 1, 1,
0.6058522, -1.036791, 2.018322, 0, 0, 0, 1, 1,
0.606095, 1.337599, -0.0001780118, 0, 0, 0, 1, 1,
0.6126029, 1.173545, -1.00494, 0, 0, 0, 1, 1,
0.6193261, -0.2708835, 1.632241, 0, 0, 0, 1, 1,
0.6235021, 0.02370594, 1.318163, 0, 0, 0, 1, 1,
0.6246695, 0.6630078, 1.693842, 0, 0, 0, 1, 1,
0.6262265, 0.1666263, 0.04849826, 0, 0, 0, 1, 1,
0.6302543, 1.181213, 2.164324, 1, 1, 1, 1, 1,
0.6330888, 0.27277, -1.093286, 1, 1, 1, 1, 1,
0.6369818, -0.2540996, 1.193988, 1, 1, 1, 1, 1,
0.6460353, 1.823777, 0.09938478, 1, 1, 1, 1, 1,
0.650449, -1.528495, 3.270373, 1, 1, 1, 1, 1,
0.6520224, -0.1503376, 0.9657261, 1, 1, 1, 1, 1,
0.6543786, 0.0034303, -0.33926, 1, 1, 1, 1, 1,
0.6601328, -0.6019765, 2.223049, 1, 1, 1, 1, 1,
0.6603183, 1.209497, 0.617997, 1, 1, 1, 1, 1,
0.6607332, 0.3597393, -0.5525772, 1, 1, 1, 1, 1,
0.6630466, 1.668452, -0.3053341, 1, 1, 1, 1, 1,
0.6673369, -0.3116576, 3.242161, 1, 1, 1, 1, 1,
0.6682688, -0.5752127, 1.149039, 1, 1, 1, 1, 1,
0.6723319, -0.2700831, 1.324736, 1, 1, 1, 1, 1,
0.6747857, -1.008939, 2.410427, 1, 1, 1, 1, 1,
0.6749383, -1.142044, 3.467186, 0, 0, 1, 1, 1,
0.6749572, 0.2140775, 2.300213, 1, 0, 0, 1, 1,
0.6756006, -0.1781469, 2.282551, 1, 0, 0, 1, 1,
0.6764295, 1.424447, -0.6212369, 1, 0, 0, 1, 1,
0.6824251, -0.719687, 3.256385, 1, 0, 0, 1, 1,
0.6863166, -0.02073359, 0.9193932, 1, 0, 0, 1, 1,
0.6884407, 0.05819945, 1.488632, 0, 0, 0, 1, 1,
0.6888362, -0.4278665, 2.550424, 0, 0, 0, 1, 1,
0.6895493, -0.3307246, 1.583152, 0, 0, 0, 1, 1,
0.6913856, -0.1495828, 1.328397, 0, 0, 0, 1, 1,
0.6949902, -0.485461, 1.666806, 0, 0, 0, 1, 1,
0.6953261, 0.1289999, 2.561281, 0, 0, 0, 1, 1,
0.6979998, 0.6320385, 0.01784804, 0, 0, 0, 1, 1,
0.6983026, 0.1818286, 2.506342, 1, 1, 1, 1, 1,
0.7012331, 0.1120168, 2.159725, 1, 1, 1, 1, 1,
0.7043998, -0.009373135, 1.856128, 1, 1, 1, 1, 1,
0.7057766, 0.6045762, -0.17348, 1, 1, 1, 1, 1,
0.7064068, -1.231738, 2.484614, 1, 1, 1, 1, 1,
0.7131485, 0.0240365, 0.9967263, 1, 1, 1, 1, 1,
0.7173026, -1.264529, 1.925152, 1, 1, 1, 1, 1,
0.7184525, 1.831848, -0.1713495, 1, 1, 1, 1, 1,
0.7336737, -0.2907298, 2.278515, 1, 1, 1, 1, 1,
0.734682, 2.764698, 1.194178, 1, 1, 1, 1, 1,
0.7351661, 0.652611, -0.07571952, 1, 1, 1, 1, 1,
0.7360585, 0.2033558, 0.4446027, 1, 1, 1, 1, 1,
0.7403361, -0.4322134, 1.500991, 1, 1, 1, 1, 1,
0.7427108, -1.492031, 1.245907, 1, 1, 1, 1, 1,
0.742759, -1.225436, 3.199634, 1, 1, 1, 1, 1,
0.7437708, 0.2345441, -0.8648467, 0, 0, 1, 1, 1,
0.7466404, -0.80507, 0.9281636, 1, 0, 0, 1, 1,
0.7483336, -1.66178, 3.854342, 1, 0, 0, 1, 1,
0.7571241, 0.4551498, 2.383984, 1, 0, 0, 1, 1,
0.762096, -0.3138752, 1.92607, 1, 0, 0, 1, 1,
0.7688674, 0.4264319, 1.155106, 1, 0, 0, 1, 1,
0.7707663, -0.4234878, 3.363094, 0, 0, 0, 1, 1,
0.7806718, 1.953596, 1.679702, 0, 0, 0, 1, 1,
0.7829125, 0.03036051, 0.9677793, 0, 0, 0, 1, 1,
0.7882124, -0.6304647, 2.107043, 0, 0, 0, 1, 1,
0.7944193, -0.6216957, 2.335328, 0, 0, 0, 1, 1,
0.798183, 0.4458401, 1.132253, 0, 0, 0, 1, 1,
0.7985563, -0.4385243, 3.744576, 0, 0, 0, 1, 1,
0.799708, -1.337978, 2.412895, 1, 1, 1, 1, 1,
0.8014041, 0.3584269, 1.199981, 1, 1, 1, 1, 1,
0.805755, -0.6049758, 2.031588, 1, 1, 1, 1, 1,
0.8059398, -1.231983, 1.438912, 1, 1, 1, 1, 1,
0.809103, -0.6972766, 3.540667, 1, 1, 1, 1, 1,
0.809892, -0.5599555, 2.020214, 1, 1, 1, 1, 1,
0.810419, 0.1761831, 0.5699567, 1, 1, 1, 1, 1,
0.8150384, 1.031912, 1.974411, 1, 1, 1, 1, 1,
0.8296391, -0.2371882, 1.768339, 1, 1, 1, 1, 1,
0.8322059, -0.7237822, 2.184772, 1, 1, 1, 1, 1,
0.8394147, -1.18745, 1.613775, 1, 1, 1, 1, 1,
0.8448791, -0.7057745, 2.345107, 1, 1, 1, 1, 1,
0.8454353, 0.05045798, -0.562067, 1, 1, 1, 1, 1,
0.8458112, -1.379992, 1.889576, 1, 1, 1, 1, 1,
0.8499679, -0.5014549, 2.625794, 1, 1, 1, 1, 1,
0.8503202, 0.2876771, -1.324736, 0, 0, 1, 1, 1,
0.850446, 1.052098, 1.004219, 1, 0, 0, 1, 1,
0.8531293, -0.63505, 2.721211, 1, 0, 0, 1, 1,
0.8634488, -1.228606, 2.072131, 1, 0, 0, 1, 1,
0.8649211, -1.028602, 4.611349, 1, 0, 0, 1, 1,
0.8665016, 1.0105, 1.275233, 1, 0, 0, 1, 1,
0.8670321, -0.1572272, 3.277907, 0, 0, 0, 1, 1,
0.8672556, -0.2998995, 3.621628, 0, 0, 0, 1, 1,
0.8708386, -0.1602059, 0.7063195, 0, 0, 0, 1, 1,
0.875249, 0.490559, 0.6999786, 0, 0, 0, 1, 1,
0.8883796, 0.7588091, 1.484472, 0, 0, 0, 1, 1,
0.8969629, -0.7124283, 3.709026, 0, 0, 0, 1, 1,
0.9040146, 1.488491, -2.031058, 0, 0, 0, 1, 1,
0.906632, 0.5755972, 1.143458, 1, 1, 1, 1, 1,
0.9069934, 1.31296, 1.415784, 1, 1, 1, 1, 1,
0.9092144, 0.5266639, 2.09702, 1, 1, 1, 1, 1,
0.9170816, -1.18093, 4.621001, 1, 1, 1, 1, 1,
0.9182036, -0.9554279, 3.187125, 1, 1, 1, 1, 1,
0.9211447, -1.092936, 3.054241, 1, 1, 1, 1, 1,
0.9222214, 0.6180261, 0.6947212, 1, 1, 1, 1, 1,
0.9236611, 0.8985593, -0.7846166, 1, 1, 1, 1, 1,
0.9310371, -0.2925593, 1.386739, 1, 1, 1, 1, 1,
0.9312739, -0.08368774, 2.21071, 1, 1, 1, 1, 1,
0.9558519, 0.705947, 0.7378609, 1, 1, 1, 1, 1,
0.9591382, 2.093608, 1.825032, 1, 1, 1, 1, 1,
0.9676945, -0.1985441, 2.218178, 1, 1, 1, 1, 1,
0.97729, 1.894423, 1.592401, 1, 1, 1, 1, 1,
0.9863954, -0.6118896, 1.229514, 1, 1, 1, 1, 1,
0.986499, -0.3382043, 3.330054, 0, 0, 1, 1, 1,
1.006196, 1.910236, -1.01245, 1, 0, 0, 1, 1,
1.010499, -0.9997845, 2.410579, 1, 0, 0, 1, 1,
1.011905, 0.7701437, 1.354694, 1, 0, 0, 1, 1,
1.01307, -2.042593, 1.337594, 1, 0, 0, 1, 1,
1.016559, -2.165373, 3.3772, 1, 0, 0, 1, 1,
1.022176, -0.2047692, 1.79185, 0, 0, 0, 1, 1,
1.023297, -0.8076814, 1.415116, 0, 0, 0, 1, 1,
1.025455, -2.529559, 2.359608, 0, 0, 0, 1, 1,
1.027741, 0.6347809, -1.455525, 0, 0, 0, 1, 1,
1.029124, -0.9059014, 3.03789, 0, 0, 0, 1, 1,
1.029397, 0.2317738, 1.969867, 0, 0, 0, 1, 1,
1.031459, -0.07383131, 1.630456, 0, 0, 0, 1, 1,
1.03546, 0.6701984, 0.2419236, 1, 1, 1, 1, 1,
1.039491, -0.8849546, 2.872984, 1, 1, 1, 1, 1,
1.044797, 0.1047435, 2.431137, 1, 1, 1, 1, 1,
1.048712, -0.9515611, 1.89539, 1, 1, 1, 1, 1,
1.059651, 0.4033343, 1.02183, 1, 1, 1, 1, 1,
1.063749, 1.147477, 3.113319, 1, 1, 1, 1, 1,
1.065438, -0.3543325, 2.201913, 1, 1, 1, 1, 1,
1.068659, 0.2052278, 2.890765, 1, 1, 1, 1, 1,
1.076419, -0.3360894, 2.13029, 1, 1, 1, 1, 1,
1.085572, 0.5031273, 0.6576045, 1, 1, 1, 1, 1,
1.091283, 0.8104798, 0.8115757, 1, 1, 1, 1, 1,
1.09245, -0.2077348, 1.653487, 1, 1, 1, 1, 1,
1.092752, 1.048619, 0.5815693, 1, 1, 1, 1, 1,
1.095197, -1.239209, 0.7043564, 1, 1, 1, 1, 1,
1.095796, -0.1949409, 0.1785545, 1, 1, 1, 1, 1,
1.096294, -0.4720567, 1.183672, 0, 0, 1, 1, 1,
1.097683, 0.738816, 1.2962, 1, 0, 0, 1, 1,
1.102439, -0.360568, 1.613946, 1, 0, 0, 1, 1,
1.111971, 0.0172959, 2.23453, 1, 0, 0, 1, 1,
1.112251, 0.4113863, 0.2391897, 1, 0, 0, 1, 1,
1.117005, -1.697999, 1.63072, 1, 0, 0, 1, 1,
1.123403, 0.2156132, 1.385796, 0, 0, 0, 1, 1,
1.124106, -0.5863522, 3.243131, 0, 0, 0, 1, 1,
1.129745, -1.509109, 3.711808, 0, 0, 0, 1, 1,
1.132887, -0.8171883, 3.149246, 0, 0, 0, 1, 1,
1.134814, 1.126456, 1.618568, 0, 0, 0, 1, 1,
1.14095, 1.137034, 0.8221527, 0, 0, 0, 1, 1,
1.143252, 0.5928445, 0.2126845, 0, 0, 0, 1, 1,
1.153198, 2.502219, 0.40649, 1, 1, 1, 1, 1,
1.167417, 0.3305207, 1.463824, 1, 1, 1, 1, 1,
1.173206, -0.2074451, 2.997303, 1, 1, 1, 1, 1,
1.173618, 0.9993375, 1.80841, 1, 1, 1, 1, 1,
1.174111, -0.1230721, 2.885487, 1, 1, 1, 1, 1,
1.177086, -0.5341277, 3.200643, 1, 1, 1, 1, 1,
1.182253, 0.09118082, 2.297925, 1, 1, 1, 1, 1,
1.185609, 0.2663132, 0.6049507, 1, 1, 1, 1, 1,
1.187749, -0.2790955, 3.905835, 1, 1, 1, 1, 1,
1.197082, -1.328482, 2.467524, 1, 1, 1, 1, 1,
1.198129, -1.246297, 3.73002, 1, 1, 1, 1, 1,
1.20952, 0.2877962, 1.303482, 1, 1, 1, 1, 1,
1.211937, -1.051507, 2.600132, 1, 1, 1, 1, 1,
1.214187, -0.0413629, 2.260971, 1, 1, 1, 1, 1,
1.225683, 0.445628, 0.3829153, 1, 1, 1, 1, 1,
1.229004, -0.4674952, 1.380176, 0, 0, 1, 1, 1,
1.229059, 0.1668275, 1.149004, 1, 0, 0, 1, 1,
1.231418, 0.6351563, 0.6721423, 1, 0, 0, 1, 1,
1.24027, 1.26259, 0.1197916, 1, 0, 0, 1, 1,
1.25315, 0.1437649, 0.2904007, 1, 0, 0, 1, 1,
1.268659, 0.3757142, 2.169361, 1, 0, 0, 1, 1,
1.27142, -0.7695608, 2.578933, 0, 0, 0, 1, 1,
1.274632, -1.160821, 1.788318, 0, 0, 0, 1, 1,
1.274818, 1.17511, 0.9485372, 0, 0, 0, 1, 1,
1.275513, -1.058553, 1.691749, 0, 0, 0, 1, 1,
1.276205, -0.9678032, -0.09626984, 0, 0, 0, 1, 1,
1.282756, -0.2170446, 1.014314, 0, 0, 0, 1, 1,
1.283636, -1.299427, 1.168049, 0, 0, 0, 1, 1,
1.286411, 0.04831768, 2.000337, 1, 1, 1, 1, 1,
1.295397, 0.5029235, 1.094714, 1, 1, 1, 1, 1,
1.305854, -0.8924313, 3.871325, 1, 1, 1, 1, 1,
1.325164, 1.518511, 1.316811, 1, 1, 1, 1, 1,
1.32859, 0.9936829, 1.104383, 1, 1, 1, 1, 1,
1.330958, -0.7797007, 2.008375, 1, 1, 1, 1, 1,
1.333377, -0.119386, -0.8475484, 1, 1, 1, 1, 1,
1.333822, 1.192119, 2.76432, 1, 1, 1, 1, 1,
1.337735, -0.4414569, 1.703081, 1, 1, 1, 1, 1,
1.339161, 1.057376, 1.102127, 1, 1, 1, 1, 1,
1.342486, 0.1569422, 0.6216926, 1, 1, 1, 1, 1,
1.346285, 0.8313944, 0.7041265, 1, 1, 1, 1, 1,
1.355689, -0.3557013, 1.563478, 1, 1, 1, 1, 1,
1.369543, 0.9215084, 0.01117634, 1, 1, 1, 1, 1,
1.377286, -0.4614674, 2.503997, 1, 1, 1, 1, 1,
1.387662, -1.990895, 1.647112, 0, 0, 1, 1, 1,
1.397813, -0.30733, 2.309239, 1, 0, 0, 1, 1,
1.398043, -0.08616929, 2.460781, 1, 0, 0, 1, 1,
1.402781, 1.152267, 1.544816, 1, 0, 0, 1, 1,
1.422307, 0.2725912, 3.167826, 1, 0, 0, 1, 1,
1.442833, -0.6393776, 3.490696, 1, 0, 0, 1, 1,
1.445661, 0.6660401, 0.6315898, 0, 0, 0, 1, 1,
1.453361, 0.3459, 1.911659, 0, 0, 0, 1, 1,
1.453783, -0.1283231, 1.188868, 0, 0, 0, 1, 1,
1.454151, 0.1830583, 1.692286, 0, 0, 0, 1, 1,
1.467786, 0.1684457, 1.611479, 0, 0, 0, 1, 1,
1.477414, -0.3344011, 2.733612, 0, 0, 0, 1, 1,
1.489672, 0.9077445, 0.5544354, 0, 0, 0, 1, 1,
1.522158, -1.494558, 1.072668, 1, 1, 1, 1, 1,
1.524517, 0.06854585, 1.199617, 1, 1, 1, 1, 1,
1.52742, -1.04706, 3.83329, 1, 1, 1, 1, 1,
1.532579, 0.3457243, -0.8865359, 1, 1, 1, 1, 1,
1.533769, -1.200216, 2.151222, 1, 1, 1, 1, 1,
1.574882, -0.2110966, 2.262956, 1, 1, 1, 1, 1,
1.575394, 1.687732, 0.4401363, 1, 1, 1, 1, 1,
1.579356, -0.6873088, 2.575877, 1, 1, 1, 1, 1,
1.579529, 0.5360805, 2.438083, 1, 1, 1, 1, 1,
1.583807, 0.236263, -0.151641, 1, 1, 1, 1, 1,
1.587154, -0.7043544, 2.076732, 1, 1, 1, 1, 1,
1.59146, 0.6329326, 1.574558, 1, 1, 1, 1, 1,
1.595761, -1.147015, 1.55579, 1, 1, 1, 1, 1,
1.598172, 0.893119, 0.7199878, 1, 1, 1, 1, 1,
1.610011, 1.090307, 1.574988, 1, 1, 1, 1, 1,
1.620927, -1.170475, 1.497109, 0, 0, 1, 1, 1,
1.62478, 0.9626887, 0.6792122, 1, 0, 0, 1, 1,
1.626708, 0.6688405, 2.721082, 1, 0, 0, 1, 1,
1.688901, 1.784788, 1.565998, 1, 0, 0, 1, 1,
1.696588, 0.2532001, 1.576267, 1, 0, 0, 1, 1,
1.713167, 0.2882886, 1.973393, 1, 0, 0, 1, 1,
1.727492, 0.3612241, 1.046553, 0, 0, 0, 1, 1,
1.732787, 0.278838, 2.646698, 0, 0, 0, 1, 1,
1.732846, -0.1488011, 1.721842, 0, 0, 0, 1, 1,
1.736038, -0.3825268, 3.157426, 0, 0, 0, 1, 1,
1.740399, 0.558469, 1.808219, 0, 0, 0, 1, 1,
1.772047, 0.9446561, 0.9471645, 0, 0, 0, 1, 1,
1.783708, 1.964057, -0.1397757, 0, 0, 0, 1, 1,
1.784872, -1.026275, 2.354533, 1, 1, 1, 1, 1,
1.806523, 0.1337869, 2.307758, 1, 1, 1, 1, 1,
1.841411, 2.03171, -0.520229, 1, 1, 1, 1, 1,
1.913874, 0.1987611, 1.236308, 1, 1, 1, 1, 1,
1.916571, 0.1173867, 0.8793676, 1, 1, 1, 1, 1,
1.927533, -0.2303065, 0.5305963, 1, 1, 1, 1, 1,
1.952251, -0.7264917, 2.623274, 1, 1, 1, 1, 1,
1.96848, 1.06034, 1.606885, 1, 1, 1, 1, 1,
2.003407, -0.3001097, 0.5734673, 1, 1, 1, 1, 1,
2.025252, 0.4477965, 1.570497, 1, 1, 1, 1, 1,
2.037311, -0.646524, 2.111182, 1, 1, 1, 1, 1,
2.059713, 1.036451, 0.05842742, 1, 1, 1, 1, 1,
2.067173, 0.1269095, 1.422108, 1, 1, 1, 1, 1,
2.087561, 1.193044, 0.3047847, 1, 1, 1, 1, 1,
2.115037, -1.323637, 2.004717, 1, 1, 1, 1, 1,
2.122123, 0.6532894, 0.2161377, 0, 0, 1, 1, 1,
2.130076, -0.3044427, 1.708503, 1, 0, 0, 1, 1,
2.182741, 0.8650208, 0.5358585, 1, 0, 0, 1, 1,
2.184838, 0.1729289, 2.771548, 1, 0, 0, 1, 1,
2.199285, 0.8223683, -0.4816626, 1, 0, 0, 1, 1,
2.227686, 0.05755643, 1.64785, 1, 0, 0, 1, 1,
2.281124, -0.1047082, 2.683387, 0, 0, 0, 1, 1,
2.292944, -0.5900083, 0.9682154, 0, 0, 0, 1, 1,
2.307517, -1.336403, 3.212837, 0, 0, 0, 1, 1,
2.309086, 0.1683438, 2.394882, 0, 0, 0, 1, 1,
2.439391, -2.01864, 1.641956, 0, 0, 0, 1, 1,
2.457049, 1.04722, 1.421202, 0, 0, 0, 1, 1,
2.558348, -1.47499, 1.660712, 0, 0, 0, 1, 1,
2.641796, -2.327009, 2.223624, 1, 1, 1, 1, 1,
2.731008, 1.133967, 0.9229915, 1, 1, 1, 1, 1,
2.742525, -0.5216023, 1.486766, 1, 1, 1, 1, 1,
2.824226, 1.655737, 0.2078717, 1, 1, 1, 1, 1,
2.935936, 1.525512, -1.492169, 1, 1, 1, 1, 1,
3.080112, 0.03630781, 1.617332, 1, 1, 1, 1, 1,
3.522416, 0.9672348, 2.079769, 1, 1, 1, 1, 1
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
var radius = 9.517971;
var distance = 33.43147;
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
mvMatrix.translate( -0.2683539, 0.2599835, 0.3275089 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.43147);
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
