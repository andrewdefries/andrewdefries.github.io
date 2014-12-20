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
-4.262989, 0.7552609, -0.9178158, 1, 0, 0, 1,
-4.229318, 0.5860747, -1.862554, 1, 0.007843138, 0, 1,
-3.058698, -1.371299, -2.901728, 1, 0.01176471, 0, 1,
-2.718741, 0.68563, -3.174129, 1, 0.01960784, 0, 1,
-2.718586, -0.5645919, -1.666093, 1, 0.02352941, 0, 1,
-2.659858, -0.7506332, -1.264748, 1, 0.03137255, 0, 1,
-2.603169, 0.1320341, -1.946307, 1, 0.03529412, 0, 1,
-2.589451, 0.8939695, -0.3678061, 1, 0.04313726, 0, 1,
-2.360352, 0.3693338, -1.66412, 1, 0.04705882, 0, 1,
-2.350495, 0.6057897, 0.1448984, 1, 0.05490196, 0, 1,
-2.350031, 0.09491932, -0.5436978, 1, 0.05882353, 0, 1,
-2.319211, -0.336753, -1.221526, 1, 0.06666667, 0, 1,
-2.293382, 1.453092, -1.917397, 1, 0.07058824, 0, 1,
-2.257735, -1.293873, -0.3289609, 1, 0.07843138, 0, 1,
-2.229909, 0.5269786, -1.735084, 1, 0.08235294, 0, 1,
-2.22804, 0.6852187, -2.575798, 1, 0.09019608, 0, 1,
-2.197803, -0.2391644, -1.672227, 1, 0.09411765, 0, 1,
-2.18362, -0.1066439, -2.303062, 1, 0.1019608, 0, 1,
-2.132664, 0.414922, -2.626361, 1, 0.1098039, 0, 1,
-2.084998, -2.676139, -3.183094, 1, 0.1137255, 0, 1,
-2.032039, -0.6067832, -2.368531, 1, 0.1215686, 0, 1,
-2.013611, 0.4903004, -0.9052025, 1, 0.1254902, 0, 1,
-1.981814, -0.7061429, -3.059752, 1, 0.1333333, 0, 1,
-1.978449, 0.1628319, -2.212547, 1, 0.1372549, 0, 1,
-1.977307, -0.2699072, -1.48846, 1, 0.145098, 0, 1,
-1.964657, 0.2800313, -1.322725, 1, 0.1490196, 0, 1,
-1.956501, -0.3828635, -0.6297509, 1, 0.1568628, 0, 1,
-1.915342, 0.2401761, -3.84777, 1, 0.1607843, 0, 1,
-1.90386, 1.201946, -0.9002158, 1, 0.1686275, 0, 1,
-1.897589, 0.6688507, -0.4951428, 1, 0.172549, 0, 1,
-1.891919, -0.1189219, -2.42169, 1, 0.1803922, 0, 1,
-1.88429, -0.555353, -1.024727, 1, 0.1843137, 0, 1,
-1.858124, 2.956847, -0.08400987, 1, 0.1921569, 0, 1,
-1.836409, -1.20153, -0.9149027, 1, 0.1960784, 0, 1,
-1.831814, 0.4006806, -1.337871, 1, 0.2039216, 0, 1,
-1.828416, -0.121573, -2.362091, 1, 0.2117647, 0, 1,
-1.821481, -1.497265, -2.600385, 1, 0.2156863, 0, 1,
-1.821086, 1.361468, -0.9812144, 1, 0.2235294, 0, 1,
-1.817878, -0.6260766, -4.135367, 1, 0.227451, 0, 1,
-1.804461, -0.205199, -1.607757, 1, 0.2352941, 0, 1,
-1.804444, 0.2448298, -1.848638, 1, 0.2392157, 0, 1,
-1.793441, -0.03580355, -2.372536, 1, 0.2470588, 0, 1,
-1.787662, 0.3600016, -1.739491, 1, 0.2509804, 0, 1,
-1.754723, 0.01575322, -1.692001, 1, 0.2588235, 0, 1,
-1.752496, -0.6518242, -0.93292, 1, 0.2627451, 0, 1,
-1.738108, -0.4340923, -1.653309, 1, 0.2705882, 0, 1,
-1.734964, 0.3967989, -0.4768273, 1, 0.2745098, 0, 1,
-1.727838, 0.7696913, -1.391853, 1, 0.282353, 0, 1,
-1.722643, -2.038082, -2.916851, 1, 0.2862745, 0, 1,
-1.720325, -0.5485585, -2.33415, 1, 0.2941177, 0, 1,
-1.715983, 0.6393502, -1.155102, 1, 0.3019608, 0, 1,
-1.694697, -0.07842539, -3.615243, 1, 0.3058824, 0, 1,
-1.691011, 1.227828, -1.123227, 1, 0.3137255, 0, 1,
-1.675557, -1.017419, -3.101562, 1, 0.3176471, 0, 1,
-1.656511, -1.704316, -3.722571, 1, 0.3254902, 0, 1,
-1.643316, -0.1868508, -2.768615, 1, 0.3294118, 0, 1,
-1.643197, -1.369146, -2.635919, 1, 0.3372549, 0, 1,
-1.629753, -1.631548, -2.069317, 1, 0.3411765, 0, 1,
-1.627701, 0.6252009, 1.101656, 1, 0.3490196, 0, 1,
-1.625795, -0.2328155, -0.6734415, 1, 0.3529412, 0, 1,
-1.619238, -0.4448165, -1.840409, 1, 0.3607843, 0, 1,
-1.611482, -0.831743, -1.945697, 1, 0.3647059, 0, 1,
-1.604781, 0.3252922, -1.43072, 1, 0.372549, 0, 1,
-1.604764, 1.277381, 0.614772, 1, 0.3764706, 0, 1,
-1.603914, -0.7085336, -1.858026, 1, 0.3843137, 0, 1,
-1.602266, -0.9141981, -1.43091, 1, 0.3882353, 0, 1,
-1.577552, 0.7862919, -2.29164, 1, 0.3960784, 0, 1,
-1.569397, -2.254232, -1.258622, 1, 0.4039216, 0, 1,
-1.539027, 0.719898, -0.4814515, 1, 0.4078431, 0, 1,
-1.526458, 0.6801924, -1.322024, 1, 0.4156863, 0, 1,
-1.525192, 0.9135125, 1.071526, 1, 0.4196078, 0, 1,
-1.525192, 0.8657318, -2.072855, 1, 0.427451, 0, 1,
-1.519336, -0.006490903, -1.480997, 1, 0.4313726, 0, 1,
-1.501573, -0.06299391, -1.386793, 1, 0.4392157, 0, 1,
-1.499937, -0.7296922, 0.07468338, 1, 0.4431373, 0, 1,
-1.4988, 1.119774, -2.861706, 1, 0.4509804, 0, 1,
-1.487186, 1.85157, -0.9118057, 1, 0.454902, 0, 1,
-1.48238, 0.2521402, -1.586564, 1, 0.4627451, 0, 1,
-1.477427, 0.07850272, -0.9561613, 1, 0.4666667, 0, 1,
-1.45467, -0.9750452, -0.7280008, 1, 0.4745098, 0, 1,
-1.447385, -3.355726, -3.046726, 1, 0.4784314, 0, 1,
-1.415448, 1.530832, 0.4399024, 1, 0.4862745, 0, 1,
-1.415436, 1.055419, -0.418907, 1, 0.4901961, 0, 1,
-1.409871, -0.003515932, -1.128963, 1, 0.4980392, 0, 1,
-1.406171, -0.2934663, -1.354242, 1, 0.5058824, 0, 1,
-1.405124, 0.3972615, -1.209605, 1, 0.509804, 0, 1,
-1.397309, -0.9134505, -0.006265248, 1, 0.5176471, 0, 1,
-1.396813, -0.8419369, -1.455205, 1, 0.5215687, 0, 1,
-1.396688, -0.1430279, -2.178214, 1, 0.5294118, 0, 1,
-1.392728, 1.469866, -0.6125953, 1, 0.5333334, 0, 1,
-1.363207, -1.734228, -1.488241, 1, 0.5411765, 0, 1,
-1.360375, 0.7962281, -0.758933, 1, 0.5450981, 0, 1,
-1.359938, -1.354513, -1.120824, 1, 0.5529412, 0, 1,
-1.358176, 0.06735322, -2.611725, 1, 0.5568628, 0, 1,
-1.357246, 1.081684, -3.320037, 1, 0.5647059, 0, 1,
-1.350573, -0.2570563, 0.7108401, 1, 0.5686275, 0, 1,
-1.34121, 0.2995743, -2.656191, 1, 0.5764706, 0, 1,
-1.338543, 0.7312332, -0.8866367, 1, 0.5803922, 0, 1,
-1.334461, 0.08690544, -2.180711, 1, 0.5882353, 0, 1,
-1.327997, -1.08477, -2.386195, 1, 0.5921569, 0, 1,
-1.327238, 1.762765, 0.4784313, 1, 0.6, 0, 1,
-1.322245, 0.8481081, -0.524241, 1, 0.6078432, 0, 1,
-1.320662, -0.113938, -1.036388, 1, 0.6117647, 0, 1,
-1.315372, -1.019386, -2.510274, 1, 0.6196079, 0, 1,
-1.307457, 0.01215561, -0.6923156, 1, 0.6235294, 0, 1,
-1.288513, -0.7460812, -2.098904, 1, 0.6313726, 0, 1,
-1.286062, -0.2637953, -0.2676703, 1, 0.6352941, 0, 1,
-1.270677, 0.512372, -2.036795, 1, 0.6431373, 0, 1,
-1.263752, -1.532047, -1.900369, 1, 0.6470588, 0, 1,
-1.263704, -0.5818311, -0.9076514, 1, 0.654902, 0, 1,
-1.26329, 0.6469991, -0.3720489, 1, 0.6588235, 0, 1,
-1.262495, -0.868845, -3.064228, 1, 0.6666667, 0, 1,
-1.259899, -0.5706267, -0.3473161, 1, 0.6705883, 0, 1,
-1.251439, -0.04821867, -1.490589, 1, 0.6784314, 0, 1,
-1.237817, 0.0500196, -0.9190784, 1, 0.682353, 0, 1,
-1.226344, 0.330331, -0.2977147, 1, 0.6901961, 0, 1,
-1.207214, 1.070485, -1.11885, 1, 0.6941177, 0, 1,
-1.205941, 0.6114489, -0.8680744, 1, 0.7019608, 0, 1,
-1.195833, -0.1406133, -0.3210648, 1, 0.7098039, 0, 1,
-1.192189, 0.513377, -1.708369, 1, 0.7137255, 0, 1,
-1.190302, 0.595666, -3.236261, 1, 0.7215686, 0, 1,
-1.190291, -0.9985765, -2.95831, 1, 0.7254902, 0, 1,
-1.183864, -0.5072213, -3.888512, 1, 0.7333333, 0, 1,
-1.180495, -0.7475796, -1.004962, 1, 0.7372549, 0, 1,
-1.177307, -0.322603, -3.289385, 1, 0.7450981, 0, 1,
-1.173247, 1.40145, 0.8694394, 1, 0.7490196, 0, 1,
-1.173222, 1.752187, -1.215328, 1, 0.7568628, 0, 1,
-1.169881, -0.005566705, -2.436796, 1, 0.7607843, 0, 1,
-1.163482, -0.2121386, 1.612164, 1, 0.7686275, 0, 1,
-1.158059, 0.382801, -1.33887, 1, 0.772549, 0, 1,
-1.155072, -2.362115, -1.991274, 1, 0.7803922, 0, 1,
-1.15496, 0.6044069, 0.32472, 1, 0.7843137, 0, 1,
-1.152601, 0.4190514, -2.855593, 1, 0.7921569, 0, 1,
-1.143405, -0.4480962, -2.649174, 1, 0.7960784, 0, 1,
-1.138676, 0.321546, -0.893507, 1, 0.8039216, 0, 1,
-1.137819, 0.3392713, -1.354327, 1, 0.8117647, 0, 1,
-1.135715, -0.5034301, -2.652047, 1, 0.8156863, 0, 1,
-1.132728, -0.4193443, -1.250988, 1, 0.8235294, 0, 1,
-1.131342, -1.181457, -1.32454, 1, 0.827451, 0, 1,
-1.130821, 0.4819524, 0.6444427, 1, 0.8352941, 0, 1,
-1.127249, -1.302088, -3.448424, 1, 0.8392157, 0, 1,
-1.122807, -0.9481286, -2.6059, 1, 0.8470588, 0, 1,
-1.121379, 0.5835137, -2.350668, 1, 0.8509804, 0, 1,
-1.121083, 1.328669, -0.4376483, 1, 0.8588235, 0, 1,
-1.113337, -0.8969784, -2.662786, 1, 0.8627451, 0, 1,
-1.112355, -0.5364895, -1.022097, 1, 0.8705882, 0, 1,
-1.102299, 0.3520952, -1.035408, 1, 0.8745098, 0, 1,
-1.100307, 1.22412, -0.6211124, 1, 0.8823529, 0, 1,
-1.098458, 1.033611, -1.235688, 1, 0.8862745, 0, 1,
-1.098096, 0.7126083, -2.279661, 1, 0.8941177, 0, 1,
-1.094942, 0.9718058, -1.305806, 1, 0.8980392, 0, 1,
-1.090688, -0.6449493, -1.195063, 1, 0.9058824, 0, 1,
-1.088936, -0.8102384, -1.57056, 1, 0.9137255, 0, 1,
-1.088233, 0.04322848, 0.8887101, 1, 0.9176471, 0, 1,
-1.088159, -0.2963847, -0.5773871, 1, 0.9254902, 0, 1,
-1.083814, -1.138226, -3.563043, 1, 0.9294118, 0, 1,
-1.08085, -0.4721851, -0.6848334, 1, 0.9372549, 0, 1,
-1.075032, -1.310937, -3.941041, 1, 0.9411765, 0, 1,
-1.072099, -1.304564, -2.577425, 1, 0.9490196, 0, 1,
-1.068039, -0.4821468, -2.333321, 1, 0.9529412, 0, 1,
-1.066654, -0.1514733, -1.317983, 1, 0.9607843, 0, 1,
-1.065005, -0.2112243, -2.121964, 1, 0.9647059, 0, 1,
-1.059883, -0.5715935, -2.453054, 1, 0.972549, 0, 1,
-1.054826, -0.007418669, -1.367649, 1, 0.9764706, 0, 1,
-1.047911, -0.1530258, -0.6429794, 1, 0.9843137, 0, 1,
-1.043538, -0.02183006, -2.788661, 1, 0.9882353, 0, 1,
-1.037774, 0.2402661, -1.299908, 1, 0.9960784, 0, 1,
-1.037608, 0.1382112, -0.8414786, 0.9960784, 1, 0, 1,
-1.03363, 0.5050789, 0.7445054, 0.9921569, 1, 0, 1,
-1.031466, 0.162716, -0.3457761, 0.9843137, 1, 0, 1,
-1.02599, 1.163604, -1.016676, 0.9803922, 1, 0, 1,
-1.022676, 0.5510775, 0.4662679, 0.972549, 1, 0, 1,
-1.016266, 0.6136604, -1.633128, 0.9686275, 1, 0, 1,
-1.011216, -0.5367041, -0.744024, 0.9607843, 1, 0, 1,
-1.009414, 0.2883843, 0.08736607, 0.9568627, 1, 0, 1,
-1.007517, -0.05222711, -1.34295, 0.9490196, 1, 0, 1,
-1.004952, -1.509407, -1.577629, 0.945098, 1, 0, 1,
-1.003621, -1.077564, -1.46176, 0.9372549, 1, 0, 1,
-0.9981285, -0.2004879, -1.497331, 0.9333333, 1, 0, 1,
-0.9973004, -0.9378988, -3.411729, 0.9254902, 1, 0, 1,
-0.9955105, 1.567676, -0.1336104, 0.9215686, 1, 0, 1,
-0.9881731, -1.497506, -3.014838, 0.9137255, 1, 0, 1,
-0.9880111, 0.05013379, -0.7003475, 0.9098039, 1, 0, 1,
-0.9824435, 0.6505247, 1.112071, 0.9019608, 1, 0, 1,
-0.9806619, -0.171929, -3.325604, 0.8941177, 1, 0, 1,
-0.973977, 0.01525766, -1.443086, 0.8901961, 1, 0, 1,
-0.9665772, 0.4991284, -1.455907, 0.8823529, 1, 0, 1,
-0.9604354, 1.34701, -0.6072863, 0.8784314, 1, 0, 1,
-0.9567647, 0.9579043, 0.6349931, 0.8705882, 1, 0, 1,
-0.9533705, -0.811093, -3.432474, 0.8666667, 1, 0, 1,
-0.9513112, 0.07839671, -0.3155407, 0.8588235, 1, 0, 1,
-0.950162, -0.4218614, -0.7431976, 0.854902, 1, 0, 1,
-0.9475915, -1.011611, -2.621909, 0.8470588, 1, 0, 1,
-0.9440523, 0.3855826, -0.9615099, 0.8431373, 1, 0, 1,
-0.9314631, -1.89745, -2.839039, 0.8352941, 1, 0, 1,
-0.926784, -0.08970817, -2.007872, 0.8313726, 1, 0, 1,
-0.9260858, 1.054431, -1.702165, 0.8235294, 1, 0, 1,
-0.9226424, -1.188683, -1.178841, 0.8196079, 1, 0, 1,
-0.9178126, 1.474194, 0.7397153, 0.8117647, 1, 0, 1,
-0.9168331, 1.18647, -0.9162565, 0.8078431, 1, 0, 1,
-0.9075112, -1.425456, -4.234589, 0.8, 1, 0, 1,
-0.8958995, -0.6334816, -3.008352, 0.7921569, 1, 0, 1,
-0.8855085, 0.528553, -1.308901, 0.7882353, 1, 0, 1,
-0.8757859, 0.142768, -0.1296937, 0.7803922, 1, 0, 1,
-0.8681291, 1.258729, 0.7639734, 0.7764706, 1, 0, 1,
-0.862635, 0.8079399, -1.044501, 0.7686275, 1, 0, 1,
-0.8603641, -0.5011399, -1.601467, 0.7647059, 1, 0, 1,
-0.8552046, -1.364833, -1.210098, 0.7568628, 1, 0, 1,
-0.8536442, -1.148034, -1.155279, 0.7529412, 1, 0, 1,
-0.8523325, 0.2688072, -0.8515131, 0.7450981, 1, 0, 1,
-0.8423204, 1.450111, -1.355573, 0.7411765, 1, 0, 1,
-0.8402722, 1.288221, -2.011514, 0.7333333, 1, 0, 1,
-0.8285497, 0.2995104, -1.340581, 0.7294118, 1, 0, 1,
-0.8274391, 0.5368593, -3.013087, 0.7215686, 1, 0, 1,
-0.8206785, 2.917703, -2.172908, 0.7176471, 1, 0, 1,
-0.8189567, -0.02270237, -3.11621, 0.7098039, 1, 0, 1,
-0.8168926, 1.374627, -1.03274, 0.7058824, 1, 0, 1,
-0.8145633, 0.2621595, -1.682632, 0.6980392, 1, 0, 1,
-0.8049924, 0.6473801, -0.4308261, 0.6901961, 1, 0, 1,
-0.7980932, -1.70106, -2.578107, 0.6862745, 1, 0, 1,
-0.7945417, -0.06652182, -2.793455, 0.6784314, 1, 0, 1,
-0.792286, -0.2305112, -0.0177976, 0.6745098, 1, 0, 1,
-0.7920161, 0.9131495, -0.9542788, 0.6666667, 1, 0, 1,
-0.7919519, 0.3607541, -1.075036, 0.6627451, 1, 0, 1,
-0.7901938, -0.2576624, -2.083728, 0.654902, 1, 0, 1,
-0.7865568, -1.043752, -3.999732, 0.6509804, 1, 0, 1,
-0.7732998, 0.8306831, 1.361697, 0.6431373, 1, 0, 1,
-0.7709894, 0.008889915, 0.02089335, 0.6392157, 1, 0, 1,
-0.7682785, -0.3768721, -2.401893, 0.6313726, 1, 0, 1,
-0.7493066, 0.139627, -1.470347, 0.627451, 1, 0, 1,
-0.7488118, 0.2387683, -1.233172, 0.6196079, 1, 0, 1,
-0.7475806, -0.9979779, -2.420541, 0.6156863, 1, 0, 1,
-0.7446306, -0.1039444, -1.130994, 0.6078432, 1, 0, 1,
-0.7425924, 2.068811, -2.342779, 0.6039216, 1, 0, 1,
-0.7424079, 0.9280214, -3.083011, 0.5960785, 1, 0, 1,
-0.7405952, -0.03716355, -2.222872, 0.5882353, 1, 0, 1,
-0.7405087, 0.9072583, -1.685492, 0.5843138, 1, 0, 1,
-0.7366608, 0.1280733, -1.078273, 0.5764706, 1, 0, 1,
-0.7344704, -1.433473, -2.272227, 0.572549, 1, 0, 1,
-0.72978, 0.2089247, -0.0488582, 0.5647059, 1, 0, 1,
-0.7247573, -0.5628419, -0.7938202, 0.5607843, 1, 0, 1,
-0.7242147, 0.8194932, -2.505501, 0.5529412, 1, 0, 1,
-0.7223434, 0.5208659, 0.9879088, 0.5490196, 1, 0, 1,
-0.7192783, 0.5711546, 0.007629465, 0.5411765, 1, 0, 1,
-0.7192574, -0.3025551, -3.387068, 0.5372549, 1, 0, 1,
-0.7187479, -1.571757, -3.716675, 0.5294118, 1, 0, 1,
-0.7119637, 1.283053, -1.952011, 0.5254902, 1, 0, 1,
-0.7114283, 1.541088, -0.59238, 0.5176471, 1, 0, 1,
-0.7067959, 1.165547, -1.863901, 0.5137255, 1, 0, 1,
-0.7009277, 0.1263078, 1.281543, 0.5058824, 1, 0, 1,
-0.6971095, 2.195618, -3.033173, 0.5019608, 1, 0, 1,
-0.6870533, -0.0002016855, -1.480783, 0.4941176, 1, 0, 1,
-0.6865628, 0.1962559, -2.710088, 0.4862745, 1, 0, 1,
-0.6830143, 1.188503, -1.773246, 0.4823529, 1, 0, 1,
-0.6822557, -1.500477, -2.743848, 0.4745098, 1, 0, 1,
-0.6687688, -0.7611859, -4.654879, 0.4705882, 1, 0, 1,
-0.6685894, 2.039457, -0.9033002, 0.4627451, 1, 0, 1,
-0.6658293, 0.1172223, -1.865491, 0.4588235, 1, 0, 1,
-0.66083, -0.8931177, -1.936995, 0.4509804, 1, 0, 1,
-0.6583937, 0.007026715, -1.06917, 0.4470588, 1, 0, 1,
-0.6581025, 0.9898289, 0.5044488, 0.4392157, 1, 0, 1,
-0.6574709, 0.5016372, -0.0522801, 0.4352941, 1, 0, 1,
-0.6517915, 0.04053787, -2.417795, 0.427451, 1, 0, 1,
-0.6509684, -0.0788682, -0.7446562, 0.4235294, 1, 0, 1,
-0.6419727, 0.01879183, -1.829374, 0.4156863, 1, 0, 1,
-0.6397334, 1.789617, -1.34289, 0.4117647, 1, 0, 1,
-0.6347792, -0.01362481, 0.309459, 0.4039216, 1, 0, 1,
-0.6345935, -0.5534497, -1.789253, 0.3960784, 1, 0, 1,
-0.6320072, -1.958364, -0.9106812, 0.3921569, 1, 0, 1,
-0.6286173, -0.2162405, -4.626788, 0.3843137, 1, 0, 1,
-0.6257309, 0.4038111, -1.235227, 0.3803922, 1, 0, 1,
-0.6222646, 0.4521699, -0.420849, 0.372549, 1, 0, 1,
-0.6193143, 1.137365, 0.6579303, 0.3686275, 1, 0, 1,
-0.6152002, -0.292575, -0.3270181, 0.3607843, 1, 0, 1,
-0.6064224, 1.503818, -0.02938255, 0.3568628, 1, 0, 1,
-0.6017891, -1.396399, -1.666625, 0.3490196, 1, 0, 1,
-0.5958961, -1.225144, -2.567214, 0.345098, 1, 0, 1,
-0.5946702, 0.4741109, -1.927307, 0.3372549, 1, 0, 1,
-0.5921108, -0.421772, -1.739967, 0.3333333, 1, 0, 1,
-0.5909732, -0.5422643, -2.415315, 0.3254902, 1, 0, 1,
-0.5861771, 1.01002, -0.5778112, 0.3215686, 1, 0, 1,
-0.5859046, -0.7401795, -2.702287, 0.3137255, 1, 0, 1,
-0.5768467, -0.2321374, -0.4911293, 0.3098039, 1, 0, 1,
-0.5713347, 1.283353, -0.5692477, 0.3019608, 1, 0, 1,
-0.570824, 0.1374311, -1.014564, 0.2941177, 1, 0, 1,
-0.5684801, -0.4693195, -2.262861, 0.2901961, 1, 0, 1,
-0.568114, 0.878792, -0.806353, 0.282353, 1, 0, 1,
-0.5676157, -0.500248, -1.742965, 0.2784314, 1, 0, 1,
-0.5672758, 0.1015535, -2.074683, 0.2705882, 1, 0, 1,
-0.5668654, -0.6750421, -1.81514, 0.2666667, 1, 0, 1,
-0.5657524, -1.0136, -4.462626, 0.2588235, 1, 0, 1,
-0.5656739, -0.5184358, -2.047306, 0.254902, 1, 0, 1,
-0.5567415, 0.303223, -0.4612702, 0.2470588, 1, 0, 1,
-0.5556419, -0.9282838, -1.703283, 0.2431373, 1, 0, 1,
-0.5502099, -0.5516079, -3.79074, 0.2352941, 1, 0, 1,
-0.5498217, -0.416939, -0.8160368, 0.2313726, 1, 0, 1,
-0.5498084, -0.007010505, -1.795753, 0.2235294, 1, 0, 1,
-0.5438858, -0.115383, -1.34887, 0.2196078, 1, 0, 1,
-0.5373446, -0.975935, -1.654494, 0.2117647, 1, 0, 1,
-0.535913, 0.08396949, -1.6469, 0.2078431, 1, 0, 1,
-0.5251791, 0.8400936, 0.04178775, 0.2, 1, 0, 1,
-0.5227747, -0.2259497, -1.903572, 0.1921569, 1, 0, 1,
-0.5220277, 0.718563, -1.351652, 0.1882353, 1, 0, 1,
-0.5209677, 0.1198955, -0.4008387, 0.1803922, 1, 0, 1,
-0.5198976, 0.6251347, -0.4919436, 0.1764706, 1, 0, 1,
-0.5156475, 1.767126, 0.02767686, 0.1686275, 1, 0, 1,
-0.5137373, -0.9318843, -2.981883, 0.1647059, 1, 0, 1,
-0.5129392, -0.1955949, -2.815212, 0.1568628, 1, 0, 1,
-0.51289, -0.06740838, -1.220932, 0.1529412, 1, 0, 1,
-0.5097541, 0.8715397, -0.8263168, 0.145098, 1, 0, 1,
-0.5087043, 1.33871, 1.00503, 0.1411765, 1, 0, 1,
-0.5075312, -1.1275, -1.965072, 0.1333333, 1, 0, 1,
-0.5021068, -0.1984829, -1.884862, 0.1294118, 1, 0, 1,
-0.4986048, 1.282975, -1.261072, 0.1215686, 1, 0, 1,
-0.4950693, -0.9625635, 0.1831365, 0.1176471, 1, 0, 1,
-0.4855478, -0.5730707, -2.431614, 0.1098039, 1, 0, 1,
-0.4820146, 0.9046797, -0.3272881, 0.1058824, 1, 0, 1,
-0.4795296, -0.6691071, -2.953084, 0.09803922, 1, 0, 1,
-0.4727854, -0.07993039, -1.283271, 0.09019608, 1, 0, 1,
-0.4717122, 0.862096, 0.7901507, 0.08627451, 1, 0, 1,
-0.4691268, -0.2576673, -2.846718, 0.07843138, 1, 0, 1,
-0.4662661, -0.4124385, -3.351153, 0.07450981, 1, 0, 1,
-0.4601535, -0.5963709, -3.466735, 0.06666667, 1, 0, 1,
-0.4571745, 1.307233, -2.455108, 0.0627451, 1, 0, 1,
-0.4537609, 1.144471, 0.4167175, 0.05490196, 1, 0, 1,
-0.4493089, -2.103646, -1.943349, 0.05098039, 1, 0, 1,
-0.4475662, 1.984198, -1.601308, 0.04313726, 1, 0, 1,
-0.442011, -1.820082, -3.718103, 0.03921569, 1, 0, 1,
-0.4415366, -0.2647969, -1.706187, 0.03137255, 1, 0, 1,
-0.4404509, -0.4819549, -2.385442, 0.02745098, 1, 0, 1,
-0.4395409, -0.3993331, -2.054169, 0.01960784, 1, 0, 1,
-0.4336886, 0.4424016, -0.7536792, 0.01568628, 1, 0, 1,
-0.4323916, 0.5561773, -0.3659329, 0.007843138, 1, 0, 1,
-0.4280767, -1.148706, -1.362091, 0.003921569, 1, 0, 1,
-0.42691, 1.628856, -2.582131, 0, 1, 0.003921569, 1,
-0.4268401, -1.059296, -2.763301, 0, 1, 0.01176471, 1,
-0.4249584, -2.144614, -2.605424, 0, 1, 0.01568628, 1,
-0.4241769, -1.904479, -1.850063, 0, 1, 0.02352941, 1,
-0.4196143, -0.3695783, -1.687854, 0, 1, 0.02745098, 1,
-0.4173597, 1.119346, -0.5140905, 0, 1, 0.03529412, 1,
-0.41666, -0.5327823, -3.381095, 0, 1, 0.03921569, 1,
-0.4148223, -0.7704053, -2.653312, 0, 1, 0.04705882, 1,
-0.4140267, 0.2952654, -2.219467, 0, 1, 0.05098039, 1,
-0.4128543, -0.4901478, -2.496683, 0, 1, 0.05882353, 1,
-0.4092593, 0.6252369, -1.61181, 0, 1, 0.0627451, 1,
-0.4056191, 0.005761797, -2.997958, 0, 1, 0.07058824, 1,
-0.4048432, 0.5037875, -1.176392, 0, 1, 0.07450981, 1,
-0.4040757, -0.3916551, -1.329602, 0, 1, 0.08235294, 1,
-0.4033217, 1.290748, -0.4622602, 0, 1, 0.08627451, 1,
-0.4014068, -0.5554498, -2.526824, 0, 1, 0.09411765, 1,
-0.3972598, 0.611048, 0.541127, 0, 1, 0.1019608, 1,
-0.3953772, 0.1285627, -2.364208, 0, 1, 0.1058824, 1,
-0.3916966, 0.1291222, -0.009099767, 0, 1, 0.1137255, 1,
-0.3888021, -0.5016763, -2.475098, 0, 1, 0.1176471, 1,
-0.3885245, 2.114882, -0.3842974, 0, 1, 0.1254902, 1,
-0.3884295, 1.297961, 0.6138074, 0, 1, 0.1294118, 1,
-0.3793098, 1.046357, -0.6718685, 0, 1, 0.1372549, 1,
-0.3770822, -0.3175398, 0.1806844, 0, 1, 0.1411765, 1,
-0.375415, 0.422968, -0.4566333, 0, 1, 0.1490196, 1,
-0.373753, -0.2496685, -1.671466, 0, 1, 0.1529412, 1,
-0.3716306, 0.7389289, -0.4646942, 0, 1, 0.1607843, 1,
-0.3709896, -0.8784472, -2.902436, 0, 1, 0.1647059, 1,
-0.3612513, -1.416324, -4.410577, 0, 1, 0.172549, 1,
-0.3587875, 0.3950936, -0.05443337, 0, 1, 0.1764706, 1,
-0.3541802, -0.2439541, -3.674485, 0, 1, 0.1843137, 1,
-0.3508856, 0.5856879, -1.162936, 0, 1, 0.1882353, 1,
-0.3506419, 0.8508753, -0.5065826, 0, 1, 0.1960784, 1,
-0.3506242, -0.9228979, -2.680713, 0, 1, 0.2039216, 1,
-0.3494722, 0.7513401, -0.5164883, 0, 1, 0.2078431, 1,
-0.3473729, 0.4867806, -1.61233, 0, 1, 0.2156863, 1,
-0.3440377, -0.06182249, -3.754758, 0, 1, 0.2196078, 1,
-0.3438792, -0.3206767, -2.099049, 0, 1, 0.227451, 1,
-0.3428651, 0.6912691, -1.164004, 0, 1, 0.2313726, 1,
-0.3373397, -0.625797, -1.002856, 0, 1, 0.2392157, 1,
-0.3327364, 1.598324, -0.580765, 0, 1, 0.2431373, 1,
-0.3307747, 0.4485719, -0.7049754, 0, 1, 0.2509804, 1,
-0.3306843, -0.05616784, -1.499452, 0, 1, 0.254902, 1,
-0.3226025, 0.3075389, -1.296443, 0, 1, 0.2627451, 1,
-0.317418, -1.031428, -3.020802, 0, 1, 0.2666667, 1,
-0.3131131, 0.811566, -0.7098925, 0, 1, 0.2745098, 1,
-0.312902, -0.7985931, -1.577571, 0, 1, 0.2784314, 1,
-0.3104746, -1.39105, -3.084593, 0, 1, 0.2862745, 1,
-0.3097575, -0.8960679, -3.446902, 0, 1, 0.2901961, 1,
-0.3090233, 1.118529, -0.6220534, 0, 1, 0.2980392, 1,
-0.3082579, 0.06968305, -2.960204, 0, 1, 0.3058824, 1,
-0.3074506, 1.890816, 2.974414, 0, 1, 0.3098039, 1,
-0.3054398, 0.6950833, 1.054819, 0, 1, 0.3176471, 1,
-0.3026138, -0.2741232, -1.002576, 0, 1, 0.3215686, 1,
-0.2958637, -0.146622, -2.024118, 0, 1, 0.3294118, 1,
-0.2953426, -0.2748263, -1.599404, 0, 1, 0.3333333, 1,
-0.2935677, -1.442509, -1.79636, 0, 1, 0.3411765, 1,
-0.289521, -0.05738144, -3.201092, 0, 1, 0.345098, 1,
-0.2872407, -1.095206, -3.760076, 0, 1, 0.3529412, 1,
-0.2858716, -0.1065472, -3.719434, 0, 1, 0.3568628, 1,
-0.2856374, 0.08372972, -0.3492483, 0, 1, 0.3647059, 1,
-0.2850471, -0.5828381, -2.17727, 0, 1, 0.3686275, 1,
-0.2848192, -0.7162268, -3.246863, 0, 1, 0.3764706, 1,
-0.2843655, 0.4826103, 0.02838705, 0, 1, 0.3803922, 1,
-0.2825808, -0.1687554, -2.937427, 0, 1, 0.3882353, 1,
-0.2811676, 0.7747761, 0.3651529, 0, 1, 0.3921569, 1,
-0.2796983, 1.031737, -0.3137471, 0, 1, 0.4, 1,
-0.2796277, -0.4626258, -2.789746, 0, 1, 0.4078431, 1,
-0.2783875, -0.3778158, -2.056609, 0, 1, 0.4117647, 1,
-0.2776248, -0.01967577, -0.3634824, 0, 1, 0.4196078, 1,
-0.2767598, 0.5191206, -0.1883407, 0, 1, 0.4235294, 1,
-0.2752216, -0.7510837, -2.116208, 0, 1, 0.4313726, 1,
-0.2700466, -0.03861181, -0.754982, 0, 1, 0.4352941, 1,
-0.2685567, 0.01914562, -1.617891, 0, 1, 0.4431373, 1,
-0.2682461, 0.9537975, 2.816905, 0, 1, 0.4470588, 1,
-0.2631803, -1.451682, -1.34432, 0, 1, 0.454902, 1,
-0.2629508, -0.8497837, -1.5763, 0, 1, 0.4588235, 1,
-0.2628156, 0.9653909, -0.5241771, 0, 1, 0.4666667, 1,
-0.2583302, 0.06746204, 0.296909, 0, 1, 0.4705882, 1,
-0.2518621, -1.299508, -2.361642, 0, 1, 0.4784314, 1,
-0.2506445, 1.211728, -0.9131471, 0, 1, 0.4823529, 1,
-0.2487502, 0.4476086, 0.3674669, 0, 1, 0.4901961, 1,
-0.2484127, 0.6292786, -0.02355924, 0, 1, 0.4941176, 1,
-0.2439889, -0.7331204, -5.121366, 0, 1, 0.5019608, 1,
-0.2407591, -0.7178928, -2.035851, 0, 1, 0.509804, 1,
-0.2389806, 0.8074118, -0.3899177, 0, 1, 0.5137255, 1,
-0.2370926, 0.8272862, 1.80187, 0, 1, 0.5215687, 1,
-0.232802, -0.3262243, -3.241551, 0, 1, 0.5254902, 1,
-0.230637, -0.8070603, -3.732801, 0, 1, 0.5333334, 1,
-0.2237594, 0.4436998, 1.124634, 0, 1, 0.5372549, 1,
-0.2216627, -1.311374, -2.061418, 0, 1, 0.5450981, 1,
-0.2181809, 2.231927, 0.5067251, 0, 1, 0.5490196, 1,
-0.2149571, 0.5568745, 0.9092978, 0, 1, 0.5568628, 1,
-0.2126849, -0.1040617, -3.279528, 0, 1, 0.5607843, 1,
-0.2126429, -0.01869523, -2.841985, 0, 1, 0.5686275, 1,
-0.2116305, 1.123984, -1.373531, 0, 1, 0.572549, 1,
-0.2112244, 1.62564, -1.440543, 0, 1, 0.5803922, 1,
-0.2037766, 0.6304423, -0.7636573, 0, 1, 0.5843138, 1,
-0.2028649, 0.90344, -1.078657, 0, 1, 0.5921569, 1,
-0.199229, 0.2361674, -1.180903, 0, 1, 0.5960785, 1,
-0.1955332, -0.0699777, -1.048677, 0, 1, 0.6039216, 1,
-0.1938503, -0.7222874, -2.982113, 0, 1, 0.6117647, 1,
-0.1912709, 0.565941, 0.2615876, 0, 1, 0.6156863, 1,
-0.189297, 0.4322108, -1.490174, 0, 1, 0.6235294, 1,
-0.1854874, -0.83707, -2.701239, 0, 1, 0.627451, 1,
-0.1842041, 0.7512292, -0.9101188, 0, 1, 0.6352941, 1,
-0.1815548, 0.2566124, -0.2369256, 0, 1, 0.6392157, 1,
-0.1782363, -0.539169, -2.642735, 0, 1, 0.6470588, 1,
-0.1758217, 0.6723294, 0.5012636, 0, 1, 0.6509804, 1,
-0.1723702, 0.2424287, -0.09580866, 0, 1, 0.6588235, 1,
-0.1708828, 0.1959535, -1.831333, 0, 1, 0.6627451, 1,
-0.1691764, -0.2924999, -2.118266, 0, 1, 0.6705883, 1,
-0.1661698, 0.8357819, 0.5981082, 0, 1, 0.6745098, 1,
-0.1648435, 0.220887, -2.101065, 0, 1, 0.682353, 1,
-0.1640352, 0.1883865, -0.7027344, 0, 1, 0.6862745, 1,
-0.1629302, -0.6866064, -3.186628, 0, 1, 0.6941177, 1,
-0.1588983, -1.700818, -4.285913, 0, 1, 0.7019608, 1,
-0.1578377, -1.344454, -4.35648, 0, 1, 0.7058824, 1,
-0.1552165, 0.3941559, -0.5989328, 0, 1, 0.7137255, 1,
-0.1489706, 1.026015, -0.7239459, 0, 1, 0.7176471, 1,
-0.1467577, -1.248134, -2.899961, 0, 1, 0.7254902, 1,
-0.1460883, 1.013295, 2.020869, 0, 1, 0.7294118, 1,
-0.1400082, 1.018942, -0.9624894, 0, 1, 0.7372549, 1,
-0.1379275, 0.356043, -2.085598, 0, 1, 0.7411765, 1,
-0.1376048, -0.3422699, -1.634518, 0, 1, 0.7490196, 1,
-0.1371768, -0.4188325, -2.114248, 0, 1, 0.7529412, 1,
-0.1292179, -0.4745327, -2.650496, 0, 1, 0.7607843, 1,
-0.1283955, -0.004884228, -3.227276, 0, 1, 0.7647059, 1,
-0.1257435, -0.2489268, -4.138619, 0, 1, 0.772549, 1,
-0.1241439, -1.132102, -3.00777, 0, 1, 0.7764706, 1,
-0.1203779, 0.793443, -1.157708, 0, 1, 0.7843137, 1,
-0.1175092, 0.1465996, -1.932186, 0, 1, 0.7882353, 1,
-0.1173414, 0.1781799, -0.05063862, 0, 1, 0.7960784, 1,
-0.1153297, -0.9358895, -2.311588, 0, 1, 0.8039216, 1,
-0.1089112, -0.6111668, -3.148407, 0, 1, 0.8078431, 1,
-0.1064965, -1.158538, -5.197721, 0, 1, 0.8156863, 1,
-0.1048534, -1.404996, -3.501478, 0, 1, 0.8196079, 1,
-0.1043199, 1.035098, 1.042647, 0, 1, 0.827451, 1,
-0.1033651, -0.832076, -1.805978, 0, 1, 0.8313726, 1,
-0.1019003, -0.4304505, -0.8367652, 0, 1, 0.8392157, 1,
-0.1009576, 1.368959, -0.1796434, 0, 1, 0.8431373, 1,
-0.09615334, 0.2143301, 0.4607538, 0, 1, 0.8509804, 1,
-0.09088731, 1.315337, -0.9359358, 0, 1, 0.854902, 1,
-0.08548363, -0.7671751, -2.451924, 0, 1, 0.8627451, 1,
-0.08534043, -0.9365511, -3.871103, 0, 1, 0.8666667, 1,
-0.08297271, -0.4141562, -3.916787, 0, 1, 0.8745098, 1,
-0.06891304, -1.311347, -3.834262, 0, 1, 0.8784314, 1,
-0.06490472, -0.2944058, -2.648651, 0, 1, 0.8862745, 1,
-0.06167522, -0.5871534, -4.901484, 0, 1, 0.8901961, 1,
-0.0610567, -2.007658, -4.048644, 0, 1, 0.8980392, 1,
-0.05884432, -1.290157, -1.648693, 0, 1, 0.9058824, 1,
-0.05331815, -1.549666, -2.547302, 0, 1, 0.9098039, 1,
-0.05299479, 0.4807283, -1.120489, 0, 1, 0.9176471, 1,
-0.0527749, -0.7922643, -3.812892, 0, 1, 0.9215686, 1,
-0.04712785, 0.4137354, -0.07343724, 0, 1, 0.9294118, 1,
-0.04626182, -0.1665108, -2.572426, 0, 1, 0.9333333, 1,
-0.04404589, 0.01037728, -0.1293138, 0, 1, 0.9411765, 1,
-0.04046374, 0.005408273, -1.659153, 0, 1, 0.945098, 1,
-0.03927809, -1.916958, -2.692255, 0, 1, 0.9529412, 1,
-0.03796406, -0.2070914, -3.598887, 0, 1, 0.9568627, 1,
-0.03452171, 1.436064, 0.4236322, 0, 1, 0.9647059, 1,
-0.02854078, -1.103127, -4.546004, 0, 1, 0.9686275, 1,
-0.01069949, -0.1096284, -2.225493, 0, 1, 0.9764706, 1,
-0.00975022, -0.5851614, -1.831918, 0, 1, 0.9803922, 1,
-0.009479884, 0.3409075, 0.232126, 0, 1, 0.9882353, 1,
-0.006083292, 1.020813, -0.7942179, 0, 1, 0.9921569, 1,
-0.005217229, -0.1023864, -3.307059, 0, 1, 1, 1,
-0.004201441, 0.9614999, 3.324049, 0, 0.9921569, 1, 1,
-0.002559251, 0.6161061, -0.1006517, 0, 0.9882353, 1, 1,
-0.00118537, 0.4597289, 1.570416, 0, 0.9803922, 1, 1,
-0.000280553, -0.2351724, -3.009208, 0, 0.9764706, 1, 1,
0.002638977, 0.1949323, -0.859827, 0, 0.9686275, 1, 1,
0.004163665, 1.047918, -0.9249688, 0, 0.9647059, 1, 1,
0.009628635, 2.407343, 1.227993, 0, 0.9568627, 1, 1,
0.01111153, 0.2160486, -0.3067745, 0, 0.9529412, 1, 1,
0.01234557, 0.2554943, 0.9369555, 0, 0.945098, 1, 1,
0.01251353, -1.095128, 4.313822, 0, 0.9411765, 1, 1,
0.0126926, -0.2529839, 2.961764, 0, 0.9333333, 1, 1,
0.01424707, -0.8708709, 2.305382, 0, 0.9294118, 1, 1,
0.01509621, 0.04021145, -0.2557519, 0, 0.9215686, 1, 1,
0.02277632, 0.6299968, 0.5583172, 0, 0.9176471, 1, 1,
0.02381426, 0.1074758, 0.08106466, 0, 0.9098039, 1, 1,
0.02406472, -1.455358, 4.42594, 0, 0.9058824, 1, 1,
0.02698151, -1.276747, 1.662799, 0, 0.8980392, 1, 1,
0.02800067, 0.2774367, 0.6457092, 0, 0.8901961, 1, 1,
0.02835091, -0.6060137, 3.304976, 0, 0.8862745, 1, 1,
0.03027057, -1.718283, 2.655891, 0, 0.8784314, 1, 1,
0.03335953, 1.549599, -0.1932983, 0, 0.8745098, 1, 1,
0.03559572, 1.723265, -0.2267779, 0, 0.8666667, 1, 1,
0.03650754, -0.5912613, 0.5536654, 0, 0.8627451, 1, 1,
0.0398153, 1.066176, -1.124265, 0, 0.854902, 1, 1,
0.04292864, 1.025869, -0.1325848, 0, 0.8509804, 1, 1,
0.04307804, 1.320253, -1.288374, 0, 0.8431373, 1, 1,
0.04543348, -0.3138081, 2.578936, 0, 0.8392157, 1, 1,
0.04722314, 0.3724096, 1.158722, 0, 0.8313726, 1, 1,
0.04848778, -0.5961131, 3.544579, 0, 0.827451, 1, 1,
0.05570217, -1.172433, 4.636546, 0, 0.8196079, 1, 1,
0.05697318, -1.459053, 2.921123, 0, 0.8156863, 1, 1,
0.06037335, 1.218313, 0.7081279, 0, 0.8078431, 1, 1,
0.06074326, 0.810578, 0.6151696, 0, 0.8039216, 1, 1,
0.06507953, -0.8456186, 3.241416, 0, 0.7960784, 1, 1,
0.0657437, -1.371645, 3.621379, 0, 0.7882353, 1, 1,
0.06833788, -0.1548046, 3.110547, 0, 0.7843137, 1, 1,
0.06849293, 0.6119846, 0.3294268, 0, 0.7764706, 1, 1,
0.06870221, -0.8559127, 1.808563, 0, 0.772549, 1, 1,
0.070434, -1.27089, 3.663117, 0, 0.7647059, 1, 1,
0.07214893, 0.06700696, 1.007668, 0, 0.7607843, 1, 1,
0.07285696, -1.118366, 1.517594, 0, 0.7529412, 1, 1,
0.07403554, 0.3369583, 0.9808002, 0, 0.7490196, 1, 1,
0.07789417, 0.8847314, -0.5282483, 0, 0.7411765, 1, 1,
0.07930689, 0.1845137, 1.609131, 0, 0.7372549, 1, 1,
0.08414262, -0.5781881, 3.582232, 0, 0.7294118, 1, 1,
0.0902939, 0.9839828, -0.8562145, 0, 0.7254902, 1, 1,
0.09308404, 1.902739, -0.5678443, 0, 0.7176471, 1, 1,
0.09462427, -0.6187952, 3.385107, 0, 0.7137255, 1, 1,
0.09522565, -1.612918, 2.29152, 0, 0.7058824, 1, 1,
0.1015609, -0.7235641, 2.590075, 0, 0.6980392, 1, 1,
0.1033993, -1.457117, 3.046859, 0, 0.6941177, 1, 1,
0.1051906, 0.6097847, 1.496826, 0, 0.6862745, 1, 1,
0.1062412, -0.535409, 0.8672773, 0, 0.682353, 1, 1,
0.1077385, 0.1069247, 0.02301987, 0, 0.6745098, 1, 1,
0.1107929, -0.9753579, 2.591455, 0, 0.6705883, 1, 1,
0.1110263, -0.2809619, 3.645181, 0, 0.6627451, 1, 1,
0.1149696, -0.1909697, 1.953954, 0, 0.6588235, 1, 1,
0.1210592, 0.2307781, 0.3499678, 0, 0.6509804, 1, 1,
0.1397986, -0.03527755, 2.77798, 0, 0.6470588, 1, 1,
0.1430804, -0.5514922, 1.838169, 0, 0.6392157, 1, 1,
0.1439906, 0.6772602, 1.841729, 0, 0.6352941, 1, 1,
0.1454249, 0.152056, 1.146852, 0, 0.627451, 1, 1,
0.1475785, -0.4563864, 2.72769, 0, 0.6235294, 1, 1,
0.1488045, -0.92406, 2.55018, 0, 0.6156863, 1, 1,
0.1559624, -0.2593998, 2.608484, 0, 0.6117647, 1, 1,
0.1590069, -0.9752519, 2.466123, 0, 0.6039216, 1, 1,
0.1624825, -1.198586, 0.6737951, 0, 0.5960785, 1, 1,
0.1627615, -0.5751227, 4.703534, 0, 0.5921569, 1, 1,
0.1639164, 0.7800573, -0.9177016, 0, 0.5843138, 1, 1,
0.1647807, -0.3071454, 3.961085, 0, 0.5803922, 1, 1,
0.1649851, -2.067209, 3.865371, 0, 0.572549, 1, 1,
0.1659271, -1.25966, 3.54422, 0, 0.5686275, 1, 1,
0.1671724, -0.3101164, 2.215245, 0, 0.5607843, 1, 1,
0.1672134, 0.314466, -0.7030388, 0, 0.5568628, 1, 1,
0.1699863, 2.053788, 0.4584258, 0, 0.5490196, 1, 1,
0.1714865, -1.518125, 1.314306, 0, 0.5450981, 1, 1,
0.1724394, 0.7351353, -0.2497368, 0, 0.5372549, 1, 1,
0.1775162, -0.04839929, 0.8183961, 0, 0.5333334, 1, 1,
0.1784007, 0.9212214, 0.69615, 0, 0.5254902, 1, 1,
0.1866396, -1.140972, -0.3069375, 0, 0.5215687, 1, 1,
0.1901834, 0.9546499, -1.362586, 0, 0.5137255, 1, 1,
0.1904602, 1.128479, -0.6978921, 0, 0.509804, 1, 1,
0.1936382, -1.206493, 2.788483, 0, 0.5019608, 1, 1,
0.1949307, 0.4924079, -0.6347241, 0, 0.4941176, 1, 1,
0.1960592, 1.396787, -0.7549829, 0, 0.4901961, 1, 1,
0.196136, 0.2665323, -0.6937547, 0, 0.4823529, 1, 1,
0.1985034, -0.6777846, 3.777487, 0, 0.4784314, 1, 1,
0.2050882, -0.3411438, 2.932409, 0, 0.4705882, 1, 1,
0.2063945, 0.7996112, -0.8798266, 0, 0.4666667, 1, 1,
0.2078525, 0.3486983, -0.6438381, 0, 0.4588235, 1, 1,
0.209089, 1.219142, -0.2169805, 0, 0.454902, 1, 1,
0.2123554, 2.074761, 0.06624226, 0, 0.4470588, 1, 1,
0.2239805, 0.7208737, -2.666012, 0, 0.4431373, 1, 1,
0.2259311, -0.9776137, 2.606853, 0, 0.4352941, 1, 1,
0.2277032, 0.281962, 2.141057, 0, 0.4313726, 1, 1,
0.230734, 0.2167938, 1.879972, 0, 0.4235294, 1, 1,
0.2318827, 0.6379977, -1.476239, 0, 0.4196078, 1, 1,
0.2387398, -0.5438901, 3.355629, 0, 0.4117647, 1, 1,
0.2399784, 0.07371079, 1.766386, 0, 0.4078431, 1, 1,
0.2402899, -2.83102, 4.340893, 0, 0.4, 1, 1,
0.2425315, 0.5005447, -2.261833, 0, 0.3921569, 1, 1,
0.2463967, -0.3174135, 2.262557, 0, 0.3882353, 1, 1,
0.2475602, 0.920092, -0.06040139, 0, 0.3803922, 1, 1,
0.2498535, 0.1319369, 3.352325, 0, 0.3764706, 1, 1,
0.2508505, -0.1739995, 0.6597739, 0, 0.3686275, 1, 1,
0.256415, 0.6576549, 0.366153, 0, 0.3647059, 1, 1,
0.2600338, 0.4771403, 1.192751, 0, 0.3568628, 1, 1,
0.267301, 0.309806, 1.378979, 0, 0.3529412, 1, 1,
0.2695762, -1.689231, 3.197503, 0, 0.345098, 1, 1,
0.2738728, 0.6308377, -0.8045382, 0, 0.3411765, 1, 1,
0.2759771, -1.854207, 2.910823, 0, 0.3333333, 1, 1,
0.2815505, 1.140698, 0.1378181, 0, 0.3294118, 1, 1,
0.284003, 0.7453115, -1.112738, 0, 0.3215686, 1, 1,
0.2844165, 0.03289156, 3.3898, 0, 0.3176471, 1, 1,
0.2852579, 0.9537787, 0.2762216, 0, 0.3098039, 1, 1,
0.2858012, 1.027113, 1.377722, 0, 0.3058824, 1, 1,
0.2871938, -2.276012, 0.9262462, 0, 0.2980392, 1, 1,
0.2873576, -0.07718274, 1.898252, 0, 0.2901961, 1, 1,
0.2896149, -1.044176, 1.385094, 0, 0.2862745, 1, 1,
0.2923326, 1.611329, 0.1568419, 0, 0.2784314, 1, 1,
0.2926775, 0.8378838, -0.030427, 0, 0.2745098, 1, 1,
0.2954704, -0.08552603, 2.534495, 0, 0.2666667, 1, 1,
0.3021381, -0.477872, 2.000899, 0, 0.2627451, 1, 1,
0.3027723, 0.5399321, -0.1683737, 0, 0.254902, 1, 1,
0.3036533, 1.055622, -0.1360083, 0, 0.2509804, 1, 1,
0.3116221, 0.7861492, 0.004769978, 0, 0.2431373, 1, 1,
0.3140085, -1.254413, 4.27762, 0, 0.2392157, 1, 1,
0.318408, 1.385627, -0.9247339, 0, 0.2313726, 1, 1,
0.3189389, 0.006530049, 1.051211, 0, 0.227451, 1, 1,
0.3233394, 0.6420026, -0.5621613, 0, 0.2196078, 1, 1,
0.3251799, 0.2682694, 2.844466, 0, 0.2156863, 1, 1,
0.3307539, -0.4609373, 3.215072, 0, 0.2078431, 1, 1,
0.3364821, 0.7561022, -0.5905318, 0, 0.2039216, 1, 1,
0.339916, -0.1206329, 2.096668, 0, 0.1960784, 1, 1,
0.340876, -1.623502, 3.010014, 0, 0.1882353, 1, 1,
0.3412614, 0.2189813, 0.9633738, 0, 0.1843137, 1, 1,
0.3425879, -0.1185961, 1.870455, 0, 0.1764706, 1, 1,
0.3492547, -1.221341, -0.1969679, 0, 0.172549, 1, 1,
0.3531608, 1.389097, -1.973121, 0, 0.1647059, 1, 1,
0.3549889, -1.741545, 3.556172, 0, 0.1607843, 1, 1,
0.3590731, 0.670735, 0.4470772, 0, 0.1529412, 1, 1,
0.3605888, -0.7392713, 2.302254, 0, 0.1490196, 1, 1,
0.3647264, 0.3731884, 1.529381, 0, 0.1411765, 1, 1,
0.3682317, -0.4532304, 3.18915, 0, 0.1372549, 1, 1,
0.3728625, -0.1603957, 1.112277, 0, 0.1294118, 1, 1,
0.3764473, -0.4342632, 3.044389, 0, 0.1254902, 1, 1,
0.3866542, -0.3866326, 3.451131, 0, 0.1176471, 1, 1,
0.3887152, -0.6973259, 3.248528, 0, 0.1137255, 1, 1,
0.3926372, -1.579149, 3.153321, 0, 0.1058824, 1, 1,
0.3974103, -0.5068108, 2.114135, 0, 0.09803922, 1, 1,
0.4000711, -0.1015064, 1.441018, 0, 0.09411765, 1, 1,
0.4040006, -0.2266998, 1.859224, 0, 0.08627451, 1, 1,
0.4066811, 0.191206, 0.7783602, 0, 0.08235294, 1, 1,
0.407149, -0.6498133, 1.619173, 0, 0.07450981, 1, 1,
0.4149379, -1.51103, 2.524691, 0, 0.07058824, 1, 1,
0.4172251, -1.713281, 1.995502, 0, 0.0627451, 1, 1,
0.419073, 0.4700957, 2.427792, 0, 0.05882353, 1, 1,
0.4191433, 0.5234762, -0.4401703, 0, 0.05098039, 1, 1,
0.4264336, 1.755512, -0.3382906, 0, 0.04705882, 1, 1,
0.4305856, -0.6163105, 2.416041, 0, 0.03921569, 1, 1,
0.4315017, -0.4816136, 2.691547, 0, 0.03529412, 1, 1,
0.4360567, 0.2273757, 1.542912, 0, 0.02745098, 1, 1,
0.4390774, 0.5688688, -0.3956299, 0, 0.02352941, 1, 1,
0.439773, -1.029792, 1.883975, 0, 0.01568628, 1, 1,
0.4413627, -0.4119036, 2.312864, 0, 0.01176471, 1, 1,
0.4418126, 1.06545, 1.716993, 0, 0.003921569, 1, 1,
0.4422337, 0.2355448, 1.271414, 0.003921569, 0, 1, 1,
0.4469818, 0.3474863, 2.318637, 0.007843138, 0, 1, 1,
0.4496901, -0.1632936, 2.167418, 0.01568628, 0, 1, 1,
0.449788, 2.257883, -0.8537253, 0.01960784, 0, 1, 1,
0.4577664, -0.06634434, 2.869133, 0.02745098, 0, 1, 1,
0.4587319, 0.3381362, 1.923662, 0.03137255, 0, 1, 1,
0.4592214, 0.631578, 0.3539204, 0.03921569, 0, 1, 1,
0.4629031, -0.4644076, 4.237817, 0.04313726, 0, 1, 1,
0.4666338, -1.173234, 2.61786, 0.05098039, 0, 1, 1,
0.4727255, -0.4935973, 1.698254, 0.05490196, 0, 1, 1,
0.4780896, -1.363548, 3.186668, 0.0627451, 0, 1, 1,
0.4785036, 1.753974, 1.484598, 0.06666667, 0, 1, 1,
0.4794779, 1.181593, 1.252273, 0.07450981, 0, 1, 1,
0.4818254, -1.53012, 3.400923, 0.07843138, 0, 1, 1,
0.4849618, -1.256676, 2.617062, 0.08627451, 0, 1, 1,
0.4887264, 1.237365, -0.4149231, 0.09019608, 0, 1, 1,
0.4891512, -0.1146359, 1.65236, 0.09803922, 0, 1, 1,
0.4917841, -1.217575, 4.518345, 0.1058824, 0, 1, 1,
0.4939215, -1.366442, 2.64879, 0.1098039, 0, 1, 1,
0.4954479, 1.374184, 0.1491057, 0.1176471, 0, 1, 1,
0.4976095, 1.73897, -0.3925631, 0.1215686, 0, 1, 1,
0.4999764, 1.785565, 0.6297761, 0.1294118, 0, 1, 1,
0.5040285, 0.4161308, 1.923164, 0.1333333, 0, 1, 1,
0.5056163, -0.5302889, 2.433809, 0.1411765, 0, 1, 1,
0.5082659, 1.347816, -0.302754, 0.145098, 0, 1, 1,
0.5092854, -1.463248, 2.12472, 0.1529412, 0, 1, 1,
0.5135726, 0.5023494, 1.526275, 0.1568628, 0, 1, 1,
0.5155441, 0.01245011, 1.589148, 0.1647059, 0, 1, 1,
0.5169122, 1.408826, -0.1307934, 0.1686275, 0, 1, 1,
0.5245462, 0.4439242, 1.256738, 0.1764706, 0, 1, 1,
0.5289571, 0.3016903, 2.012761, 0.1803922, 0, 1, 1,
0.5311754, -0.3663809, 3.798422, 0.1882353, 0, 1, 1,
0.5368047, -0.6806259, 1.945067, 0.1921569, 0, 1, 1,
0.5402104, 0.0899581, 0.6393221, 0.2, 0, 1, 1,
0.5411109, 2.567729, 0.9164203, 0.2078431, 0, 1, 1,
0.5450706, 0.8266861, 0.3842523, 0.2117647, 0, 1, 1,
0.5463657, 0.8910044, 0.04250137, 0.2196078, 0, 1, 1,
0.5470514, -1.435337, 2.528134, 0.2235294, 0, 1, 1,
0.5476207, 0.1391521, -0.1432508, 0.2313726, 0, 1, 1,
0.5495511, -1.743591, 1.712994, 0.2352941, 0, 1, 1,
0.5522941, -0.6978687, 2.432362, 0.2431373, 0, 1, 1,
0.556582, 0.308071, 2.305883, 0.2470588, 0, 1, 1,
0.5631774, -0.3771155, 1.982357, 0.254902, 0, 1, 1,
0.5665172, -0.123709, 1.820683, 0.2588235, 0, 1, 1,
0.5666167, 0.4564122, 1.695449, 0.2666667, 0, 1, 1,
0.5691539, 0.7621545, 0.4912896, 0.2705882, 0, 1, 1,
0.5765106, 0.3822687, -0.8480538, 0.2784314, 0, 1, 1,
0.5766705, 0.4288332, -0.7123633, 0.282353, 0, 1, 1,
0.5861496, 0.5113256, -0.1678973, 0.2901961, 0, 1, 1,
0.5865045, -0.3202925, 0.3021047, 0.2941177, 0, 1, 1,
0.5879206, 0.5664328, 0.6794342, 0.3019608, 0, 1, 1,
0.5881192, 0.08862258, 1.561424, 0.3098039, 0, 1, 1,
0.5930762, -0.7661986, 1.664963, 0.3137255, 0, 1, 1,
0.5954974, 1.970428, 0.456986, 0.3215686, 0, 1, 1,
0.6042383, 0.7192688, -0.4748473, 0.3254902, 0, 1, 1,
0.6047131, -0.9389291, 1.87677, 0.3333333, 0, 1, 1,
0.6072488, -0.3239166, 1.684149, 0.3372549, 0, 1, 1,
0.6086908, -0.8099911, 3.05447, 0.345098, 0, 1, 1,
0.6107928, -1.373274, 3.672284, 0.3490196, 0, 1, 1,
0.6110805, 0.5964503, 1.517845, 0.3568628, 0, 1, 1,
0.6134965, 0.4100496, 0.784183, 0.3607843, 0, 1, 1,
0.6169646, -0.5496158, 1.418906, 0.3686275, 0, 1, 1,
0.6202894, 1.298281, 0.2726907, 0.372549, 0, 1, 1,
0.6235027, -1.898623, 3.337201, 0.3803922, 0, 1, 1,
0.6242476, -0.5765825, 2.016781, 0.3843137, 0, 1, 1,
0.6248943, 0.9683902, -0.5678667, 0.3921569, 0, 1, 1,
0.6287056, -0.9764076, 3.665659, 0.3960784, 0, 1, 1,
0.6301764, -0.4428967, 3.432293, 0.4039216, 0, 1, 1,
0.6318229, -0.8176354, 2.259143, 0.4117647, 0, 1, 1,
0.6344944, -1.377303, 2.837561, 0.4156863, 0, 1, 1,
0.6348456, -0.03429458, 3.115784, 0.4235294, 0, 1, 1,
0.6453438, -0.4766442, 2.019773, 0.427451, 0, 1, 1,
0.6468558, 1.096692, 1.790986, 0.4352941, 0, 1, 1,
0.6472362, 1.361767, -0.3892146, 0.4392157, 0, 1, 1,
0.6551906, -1.077656, 3.551365, 0.4470588, 0, 1, 1,
0.6587033, 2.118132, 0.713764, 0.4509804, 0, 1, 1,
0.6603473, -0.9580572, 2.028206, 0.4588235, 0, 1, 1,
0.6620067, 0.4658189, 1.560159, 0.4627451, 0, 1, 1,
0.6648928, 0.05432139, 2.395568, 0.4705882, 0, 1, 1,
0.6651322, 0.2900828, 1.476352, 0.4745098, 0, 1, 1,
0.6681391, -0.2586254, 0.5564181, 0.4823529, 0, 1, 1,
0.6720089, 0.2560971, 0.7411828, 0.4862745, 0, 1, 1,
0.6729489, 0.6441369, 0.0006970231, 0.4941176, 0, 1, 1,
0.673584, 0.2431758, 2.098826, 0.5019608, 0, 1, 1,
0.6752669, 1.429246, 1.232673, 0.5058824, 0, 1, 1,
0.6785365, -1.661095, 3.691297, 0.5137255, 0, 1, 1,
0.6790719, 1.145305, -0.3114605, 0.5176471, 0, 1, 1,
0.6798241, -0.6742372, 1.55235, 0.5254902, 0, 1, 1,
0.6822684, -0.4370142, 0.5022079, 0.5294118, 0, 1, 1,
0.6854666, -1.774887, 1.442682, 0.5372549, 0, 1, 1,
0.6890804, -0.541815, 1.575937, 0.5411765, 0, 1, 1,
0.6944384, -0.6323736, 3.508496, 0.5490196, 0, 1, 1,
0.6947305, -0.07715615, 1.861352, 0.5529412, 0, 1, 1,
0.6954185, -0.237432, 1.465636, 0.5607843, 0, 1, 1,
0.6968681, 0.9807376, 0.883277, 0.5647059, 0, 1, 1,
0.7038891, 1.899038, -0.2266917, 0.572549, 0, 1, 1,
0.7046214, 1.145072, 0.1003482, 0.5764706, 0, 1, 1,
0.7167562, -0.6814069, 2.208103, 0.5843138, 0, 1, 1,
0.7245098, 0.5094559, 0.8299892, 0.5882353, 0, 1, 1,
0.7250714, 0.6880758, 0.2847814, 0.5960785, 0, 1, 1,
0.7251492, -1.883819, 2.485746, 0.6039216, 0, 1, 1,
0.7323347, -1.989508, 1.916715, 0.6078432, 0, 1, 1,
0.7375789, -1.058827, 3.299223, 0.6156863, 0, 1, 1,
0.7381278, 0.046107, 0.793951, 0.6196079, 0, 1, 1,
0.7392738, -0.4102427, 1.881734, 0.627451, 0, 1, 1,
0.7476631, -1.648776, 1.900226, 0.6313726, 0, 1, 1,
0.7479513, -0.08442714, 1.253203, 0.6392157, 0, 1, 1,
0.7622885, 0.9824458, 0.4586774, 0.6431373, 0, 1, 1,
0.7625658, 0.08083185, 1.425492, 0.6509804, 0, 1, 1,
0.7631146, 0.2579752, 0.3286455, 0.654902, 0, 1, 1,
0.7637207, 1.159876, 0.6740407, 0.6627451, 0, 1, 1,
0.7643057, -0.4488844, 0.9555519, 0.6666667, 0, 1, 1,
0.7660294, -1.718446, 4.049541, 0.6745098, 0, 1, 1,
0.7706468, -0.05532407, 1.800434, 0.6784314, 0, 1, 1,
0.7783915, 0.01668085, 2.547657, 0.6862745, 0, 1, 1,
0.7786611, 2.111, 2.317997, 0.6901961, 0, 1, 1,
0.7838712, -0.7367483, 1.577485, 0.6980392, 0, 1, 1,
0.7845621, -0.3377911, 2.111579, 0.7058824, 0, 1, 1,
0.7939882, 1.704554, -0.8909064, 0.7098039, 0, 1, 1,
0.7966123, 0.6270148, 1.014433, 0.7176471, 0, 1, 1,
0.7982208, -0.2325523, 1.639008, 0.7215686, 0, 1, 1,
0.7997059, 0.2123185, 2.683824, 0.7294118, 0, 1, 1,
0.8053764, 0.01598806, 1.134496, 0.7333333, 0, 1, 1,
0.805436, 1.71106, 1.126177, 0.7411765, 0, 1, 1,
0.8070062, -1.138851, 2.039449, 0.7450981, 0, 1, 1,
0.8134873, 0.3763331, -0.9833769, 0.7529412, 0, 1, 1,
0.8203818, 1.612099, 1.385388, 0.7568628, 0, 1, 1,
0.8221818, 0.4894227, 1.319219, 0.7647059, 0, 1, 1,
0.8232166, 0.2092192, 1.699208, 0.7686275, 0, 1, 1,
0.8250844, -0.5545385, 1.79789, 0.7764706, 0, 1, 1,
0.8316751, 1.503925, 1.088595, 0.7803922, 0, 1, 1,
0.8351023, 0.4100148, 1.373235, 0.7882353, 0, 1, 1,
0.8492879, 0.7633888, 0.4340696, 0.7921569, 0, 1, 1,
0.8517726, 0.9018631, -0.06371732, 0.8, 0, 1, 1,
0.8570719, -1.157344, 1.626749, 0.8078431, 0, 1, 1,
0.8641646, -0.6375902, 2.239295, 0.8117647, 0, 1, 1,
0.8673317, -0.1032632, 1.788025, 0.8196079, 0, 1, 1,
0.8677806, -0.8102967, 3.333061, 0.8235294, 0, 1, 1,
0.867862, -1.468012, 1.771265, 0.8313726, 0, 1, 1,
0.8680643, 1.100744, 1.540452, 0.8352941, 0, 1, 1,
0.8703933, 0.5492064, 2.480106, 0.8431373, 0, 1, 1,
0.8753323, 1.008786, 0.5210649, 0.8470588, 0, 1, 1,
0.8769572, 0.0278235, -1.117749, 0.854902, 0, 1, 1,
0.8785755, -0.2246923, 2.527287, 0.8588235, 0, 1, 1,
0.8805788, 1.930226, 1.913644, 0.8666667, 0, 1, 1,
0.8822359, -0.4781886, 1.109111, 0.8705882, 0, 1, 1,
0.8840011, 0.02310325, 2.754772, 0.8784314, 0, 1, 1,
0.885981, 2.081957, 0.5020139, 0.8823529, 0, 1, 1,
0.8899434, -0.5357967, 0.2351272, 0.8901961, 0, 1, 1,
0.898804, -0.1474864, 2.182836, 0.8941177, 0, 1, 1,
0.9073886, 1.774984, -0.2099415, 0.9019608, 0, 1, 1,
0.9109338, -0.3671058, 1.274323, 0.9098039, 0, 1, 1,
0.9147784, -0.4346696, 2.56869, 0.9137255, 0, 1, 1,
0.9163569, 0.4171164, 2.180673, 0.9215686, 0, 1, 1,
0.916733, 1.524905, 1.026823, 0.9254902, 0, 1, 1,
0.9169624, -1.648111, 2.830803, 0.9333333, 0, 1, 1,
0.9310489, -1.237124, 1.497736, 0.9372549, 0, 1, 1,
0.9356598, -0.589107, 1.3994, 0.945098, 0, 1, 1,
0.9362854, -1.507666, 3.143439, 0.9490196, 0, 1, 1,
0.9367961, 1.00402, 0.05653018, 0.9568627, 0, 1, 1,
0.9381019, 0.3131905, 1.027987, 0.9607843, 0, 1, 1,
0.9384955, 1.532019, 1.045886, 0.9686275, 0, 1, 1,
0.9461573, -0.9066802, 3.345415, 0.972549, 0, 1, 1,
0.9496694, -1.193792, 2.551638, 0.9803922, 0, 1, 1,
0.9559906, 0.103611, 1.837371, 0.9843137, 0, 1, 1,
0.9590283, -2.24384, 2.309729, 0.9921569, 0, 1, 1,
0.9645207, 0.7222154, 1.615131, 0.9960784, 0, 1, 1,
0.9660509, 0.7761458, 2.03655, 1, 0, 0.9960784, 1,
0.9682553, -1.318708, 3.421815, 1, 0, 0.9882353, 1,
0.9690732, -0.8024369, 2.459179, 1, 0, 0.9843137, 1,
0.9699406, 0.5534346, 0.8343909, 1, 0, 0.9764706, 1,
0.9722193, 0.6200078, 0.2505167, 1, 0, 0.972549, 1,
0.9774449, 0.08463913, 2.207965, 1, 0, 0.9647059, 1,
0.9792126, 1.510736, 0.2484275, 1, 0, 0.9607843, 1,
0.982199, -0.304087, 2.716106, 1, 0, 0.9529412, 1,
0.9847986, 0.3165466, -0.6631976, 1, 0, 0.9490196, 1,
0.9870591, -0.263644, 2.410873, 1, 0, 0.9411765, 1,
1.003349, -1.224131, 4.571516, 1, 0, 0.9372549, 1,
1.007593, 1.80851, 1.372743, 1, 0, 0.9294118, 1,
1.009533, -0.4485826, 2.481583, 1, 0, 0.9254902, 1,
1.011707, 0.4028747, 0.915176, 1, 0, 0.9176471, 1,
1.013442, -0.06983054, 0.9720656, 1, 0, 0.9137255, 1,
1.018436, -0.4882522, 0.2186378, 1, 0, 0.9058824, 1,
1.032294, -0.3049183, 1.319323, 1, 0, 0.9019608, 1,
1.038514, 0.4307694, 2.440607, 1, 0, 0.8941177, 1,
1.044351, 1.013777, 3.113065, 1, 0, 0.8862745, 1,
1.04572, -1.108324, 1.626015, 1, 0, 0.8823529, 1,
1.060534, -0.3386807, 1.537767, 1, 0, 0.8745098, 1,
1.060977, 0.5477526, 0.8113924, 1, 0, 0.8705882, 1,
1.068841, 1.146531, 0.2351034, 1, 0, 0.8627451, 1,
1.075491, -0.8690875, 2.632261, 1, 0, 0.8588235, 1,
1.075964, 0.3889261, 1.477893, 1, 0, 0.8509804, 1,
1.088081, 1.913273, 1.99054, 1, 0, 0.8470588, 1,
1.098384, -0.04727855, 1.549706, 1, 0, 0.8392157, 1,
1.100266, 0.07994435, 0.8294879, 1, 0, 0.8352941, 1,
1.104002, -1.197695, 1.499727, 1, 0, 0.827451, 1,
1.108794, 0.72487, 0.1501031, 1, 0, 0.8235294, 1,
1.111381, 1.951184, -0.2667789, 1, 0, 0.8156863, 1,
1.115127, 1.652355, 1.348594, 1, 0, 0.8117647, 1,
1.123547, 1.068702, 0.781145, 1, 0, 0.8039216, 1,
1.136606, 1.778598, 0.1650718, 1, 0, 0.7960784, 1,
1.136638, 0.1076243, 0.3150802, 1, 0, 0.7921569, 1,
1.141119, 1.280131, 0.4226081, 1, 0, 0.7843137, 1,
1.148591, 0.008696756, 2.538965, 1, 0, 0.7803922, 1,
1.149769, 0.1347384, 1.749234, 1, 0, 0.772549, 1,
1.154513, 0.7135369, 1.335042, 1, 0, 0.7686275, 1,
1.157139, -2.324832, 4.181674, 1, 0, 0.7607843, 1,
1.157392, -0.8291661, 1.07744, 1, 0, 0.7568628, 1,
1.159704, 0.2079314, 1.668399, 1, 0, 0.7490196, 1,
1.165915, 0.7872234, 2.170912, 1, 0, 0.7450981, 1,
1.167416, 1.060052, 1.18876, 1, 0, 0.7372549, 1,
1.174908, -0.7180297, 1.849126, 1, 0, 0.7333333, 1,
1.175814, -0.4539047, 3.556752, 1, 0, 0.7254902, 1,
1.177032, 0.09272724, 2.714679, 1, 0, 0.7215686, 1,
1.180924, 0.06456751, 0.3746241, 1, 0, 0.7137255, 1,
1.182089, -1.605142, 3.121089, 1, 0, 0.7098039, 1,
1.185963, -0.3212298, 1.656966, 1, 0, 0.7019608, 1,
1.190756, 0.4662505, 0.1453021, 1, 0, 0.6941177, 1,
1.191667, 0.254984, 0.2861482, 1, 0, 0.6901961, 1,
1.193782, -0.2431741, 3.473693, 1, 0, 0.682353, 1,
1.206176, -1.386385, 1.698959, 1, 0, 0.6784314, 1,
1.226387, 0.0912838, 0.5700585, 1, 0, 0.6705883, 1,
1.227649, -0.7832543, 1.806071, 1, 0, 0.6666667, 1,
1.232657, -0.754581, 0.7238068, 1, 0, 0.6588235, 1,
1.242491, -0.2327776, 1.401986, 1, 0, 0.654902, 1,
1.243283, -0.5014269, 3.244719, 1, 0, 0.6470588, 1,
1.245312, -0.9025725, 3.023147, 1, 0, 0.6431373, 1,
1.251619, 0.8740425, 2.432194, 1, 0, 0.6352941, 1,
1.252407, -0.6887125, 0.5675453, 1, 0, 0.6313726, 1,
1.258278, 0.06010048, 1.121062, 1, 0, 0.6235294, 1,
1.259999, -1.680994, 2.845515, 1, 0, 0.6196079, 1,
1.262593, -1.420638, 1.89215, 1, 0, 0.6117647, 1,
1.266082, 0.5871751, 0.946766, 1, 0, 0.6078432, 1,
1.266543, -0.9231641, 3.137303, 1, 0, 0.6, 1,
1.285429, -0.9813176, 0.5794749, 1, 0, 0.5921569, 1,
1.286644, 0.8291522, 1.341691, 1, 0, 0.5882353, 1,
1.288872, -0.7231205, 0.6463779, 1, 0, 0.5803922, 1,
1.299168, -0.2662525, 2.312442, 1, 0, 0.5764706, 1,
1.301468, 0.9192348, 2.485548, 1, 0, 0.5686275, 1,
1.319978, 0.3115747, 0.9042771, 1, 0, 0.5647059, 1,
1.322441, -0.3719133, 1.205495, 1, 0, 0.5568628, 1,
1.323279, 1.563922, 0.007190282, 1, 0, 0.5529412, 1,
1.329839, 0.9252627, 1.672574, 1, 0, 0.5450981, 1,
1.336193, 0.1982977, 1.133738, 1, 0, 0.5411765, 1,
1.336541, -1.960109, 1.605722, 1, 0, 0.5333334, 1,
1.341782, -1.18436, 1.691458, 1, 0, 0.5294118, 1,
1.360926, -0.5527607, 2.34155, 1, 0, 0.5215687, 1,
1.363372, 1.306418, 1.119949, 1, 0, 0.5176471, 1,
1.379974, -1.004745, 3.323558, 1, 0, 0.509804, 1,
1.380029, 0.5321152, 0.7027217, 1, 0, 0.5058824, 1,
1.380129, -0.4004033, 0.1979762, 1, 0, 0.4980392, 1,
1.380862, 0.06430651, 0.4571815, 1, 0, 0.4901961, 1,
1.381467, 0.2313433, 2.836069, 1, 0, 0.4862745, 1,
1.392139, 0.3119735, 1.262829, 1, 0, 0.4784314, 1,
1.396556, -1.909729, 2.370032, 1, 0, 0.4745098, 1,
1.398566, -0.4062831, 1.226252, 1, 0, 0.4666667, 1,
1.404855, 0.3568885, 1.987943, 1, 0, 0.4627451, 1,
1.407168, 0.1561944, -0.1080966, 1, 0, 0.454902, 1,
1.408383, -0.5398791, 0.2273058, 1, 0, 0.4509804, 1,
1.418747, 0.05596748, 2.436725, 1, 0, 0.4431373, 1,
1.418983, 0.2657767, 0.89438, 1, 0, 0.4392157, 1,
1.453016, -0.03792712, 2.276327, 1, 0, 0.4313726, 1,
1.462676, 1.137323, 0.1306155, 1, 0, 0.427451, 1,
1.485218, 0.2204611, 1.029129, 1, 0, 0.4196078, 1,
1.507493, -1.110123, 1.36055, 1, 0, 0.4156863, 1,
1.508236, 1.632232, -0.09370224, 1, 0, 0.4078431, 1,
1.510167, -1.447935, 0.6583788, 1, 0, 0.4039216, 1,
1.530656, 1.056053, -0.2205806, 1, 0, 0.3960784, 1,
1.544282, -1.449521, 0.4723279, 1, 0, 0.3882353, 1,
1.560712, -1.187736, 3.447349, 1, 0, 0.3843137, 1,
1.570704, -0.5429994, 2.182458, 1, 0, 0.3764706, 1,
1.579924, -0.3545551, 2.430493, 1, 0, 0.372549, 1,
1.581184, -0.2336608, 2.04871, 1, 0, 0.3647059, 1,
1.584067, 1.808382, 0.1002931, 1, 0, 0.3607843, 1,
1.589819, 0.4040141, 0.8194991, 1, 0, 0.3529412, 1,
1.591486, -0.1899981, 4.010519, 1, 0, 0.3490196, 1,
1.600104, 1.107073, 2.197255, 1, 0, 0.3411765, 1,
1.617376, -0.280009, 1.988391, 1, 0, 0.3372549, 1,
1.617873, -1.117896, 1.010454, 1, 0, 0.3294118, 1,
1.619306, 2.350571, -0.9907286, 1, 0, 0.3254902, 1,
1.619793, 0.8448582, 1.881872, 1, 0, 0.3176471, 1,
1.647135, 1.395205, 2.752561, 1, 0, 0.3137255, 1,
1.647239, 0.9986577, 0.9247758, 1, 0, 0.3058824, 1,
1.653049, -1.638525, 1.027941, 1, 0, 0.2980392, 1,
1.676267, 1.416456, 0.154164, 1, 0, 0.2941177, 1,
1.678094, -0.06580329, 3.690374, 1, 0, 0.2862745, 1,
1.709021, 0.896533, 2.344678, 1, 0, 0.282353, 1,
1.71823, 0.147563, 2.211547, 1, 0, 0.2745098, 1,
1.719432, 1.637311, -0.3484214, 1, 0, 0.2705882, 1,
1.726495, -0.1043613, 1.852236, 1, 0, 0.2627451, 1,
1.75354, 0.6244097, 1.300162, 1, 0, 0.2588235, 1,
1.755741, 1.063158, 0.3045828, 1, 0, 0.2509804, 1,
1.761283, -0.8913617, 2.713689, 1, 0, 0.2470588, 1,
1.772758, -0.4763544, 3.279295, 1, 0, 0.2392157, 1,
1.780769, -0.829438, 3.300853, 1, 0, 0.2352941, 1,
1.782913, -0.8248574, 3.267228, 1, 0, 0.227451, 1,
1.785213, -1.070167, 2.039515, 1, 0, 0.2235294, 1,
1.791665, 0.7745796, 0.185554, 1, 0, 0.2156863, 1,
1.806778, -0.7761707, 3.064806, 1, 0, 0.2117647, 1,
1.833566, -1.163454, 2.330871, 1, 0, 0.2039216, 1,
1.836074, -0.7742242, 1.958254, 1, 0, 0.1960784, 1,
1.841095, 1.239529, 0.8996927, 1, 0, 0.1921569, 1,
1.858289, -0.7634267, 1.508786, 1, 0, 0.1843137, 1,
1.865346, -0.09979638, 1.167439, 1, 0, 0.1803922, 1,
1.952473, -0.163676, 1.212443, 1, 0, 0.172549, 1,
1.953657, 1.217569, 2.862357, 1, 0, 0.1686275, 1,
1.979037, -0.4970211, 2.127301, 1, 0, 0.1607843, 1,
1.99373, 0.5575638, -0.3727225, 1, 0, 0.1568628, 1,
2.00184, -0.8210579, 3.107424, 1, 0, 0.1490196, 1,
2.008706, -1.118369, 0.7453405, 1, 0, 0.145098, 1,
2.05272, 1.086806, 0.0747831, 1, 0, 0.1372549, 1,
2.068095, 0.1934114, 2.528138, 1, 0, 0.1333333, 1,
2.099373, -1.024657, 1.825073, 1, 0, 0.1254902, 1,
2.136789, -0.7480181, 2.581338, 1, 0, 0.1215686, 1,
2.149581, 1.915902, 3.176516, 1, 0, 0.1137255, 1,
2.151336, 0.7957223, 1.393501, 1, 0, 0.1098039, 1,
2.228565, 0.9783822, 0.9277043, 1, 0, 0.1019608, 1,
2.249262, -0.9379542, 3.751311, 1, 0, 0.09411765, 1,
2.269644, 1.574974, 1.421752, 1, 0, 0.09019608, 1,
2.291219, 0.2546894, 0.8375815, 1, 0, 0.08235294, 1,
2.308298, 0.4773193, 0.3828156, 1, 0, 0.07843138, 1,
2.329871, -1.474743, 0.9911758, 1, 0, 0.07058824, 1,
2.343704, 1.41481, -0.005106891, 1, 0, 0.06666667, 1,
2.353917, -1.306072, 2.582849, 1, 0, 0.05882353, 1,
2.445715, 1.068109, 2.761926, 1, 0, 0.05490196, 1,
2.483687, 0.09876119, 0.455724, 1, 0, 0.04705882, 1,
2.498863, -0.1713966, 1.073053, 1, 0, 0.04313726, 1,
2.535605, -0.674771, 2.096285, 1, 0, 0.03529412, 1,
2.608864, -0.4361512, 2.0244, 1, 0, 0.03137255, 1,
2.77014, 0.02067584, 2.669363, 1, 0, 0.02352941, 1,
2.830813, 0.270762, -1.11672, 1, 0, 0.01960784, 1,
2.907389, -0.50984, 1.177829, 1, 0, 0.01176471, 1,
3.380252, 0.9441444, 0.635919, 1, 0, 0.007843138, 1
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
-0.4413687, -4.425707, -6.875983, 0, -0.5, 0.5, 0.5,
-0.4413687, -4.425707, -6.875983, 1, -0.5, 0.5, 0.5,
-0.4413687, -4.425707, -6.875983, 1, 1.5, 0.5, 0.5,
-0.4413687, -4.425707, -6.875983, 0, 1.5, 0.5, 0.5
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
-5.558518, -0.1994396, -6.875983, 0, -0.5, 0.5, 0.5,
-5.558518, -0.1994396, -6.875983, 1, -0.5, 0.5, 0.5,
-5.558518, -0.1994396, -6.875983, 1, 1.5, 0.5, 0.5,
-5.558518, -0.1994396, -6.875983, 0, 1.5, 0.5, 0.5
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
-5.558518, -4.425707, -0.2470934, 0, -0.5, 0.5, 0.5,
-5.558518, -4.425707, -0.2470934, 1, -0.5, 0.5, 0.5,
-5.558518, -4.425707, -0.2470934, 1, 1.5, 0.5, 0.5,
-5.558518, -4.425707, -0.2470934, 0, 1.5, 0.5, 0.5
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
-4, -3.450415, -5.34624,
2, -3.450415, -5.34624,
-4, -3.450415, -5.34624,
-4, -3.612964, -5.601197,
-2, -3.450415, -5.34624,
-2, -3.612964, -5.601197,
0, -3.450415, -5.34624,
0, -3.612964, -5.601197,
2, -3.450415, -5.34624,
2, -3.612964, -5.601197
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
"-4",
"-2",
"0",
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
-4, -3.938061, -6.111111, 0, -0.5, 0.5, 0.5,
-4, -3.938061, -6.111111, 1, -0.5, 0.5, 0.5,
-4, -3.938061, -6.111111, 1, 1.5, 0.5, 0.5,
-4, -3.938061, -6.111111, 0, 1.5, 0.5, 0.5,
-2, -3.938061, -6.111111, 0, -0.5, 0.5, 0.5,
-2, -3.938061, -6.111111, 1, -0.5, 0.5, 0.5,
-2, -3.938061, -6.111111, 1, 1.5, 0.5, 0.5,
-2, -3.938061, -6.111111, 0, 1.5, 0.5, 0.5,
0, -3.938061, -6.111111, 0, -0.5, 0.5, 0.5,
0, -3.938061, -6.111111, 1, -0.5, 0.5, 0.5,
0, -3.938061, -6.111111, 1, 1.5, 0.5, 0.5,
0, -3.938061, -6.111111, 0, 1.5, 0.5, 0.5,
2, -3.938061, -6.111111, 0, -0.5, 0.5, 0.5,
2, -3.938061, -6.111111, 1, -0.5, 0.5, 0.5,
2, -3.938061, -6.111111, 1, 1.5, 0.5, 0.5,
2, -3.938061, -6.111111, 0, 1.5, 0.5, 0.5
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
-4.377638, -3, -5.34624,
-4.377638, 2, -5.34624,
-4.377638, -3, -5.34624,
-4.574451, -3, -5.601197,
-4.377638, -2, -5.34624,
-4.574451, -2, -5.601197,
-4.377638, -1, -5.34624,
-4.574451, -1, -5.601197,
-4.377638, 0, -5.34624,
-4.574451, 0, -5.601197,
-4.377638, 1, -5.34624,
-4.574451, 1, -5.601197,
-4.377638, 2, -5.34624,
-4.574451, 2, -5.601197
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
-4.968078, -3, -6.111111, 0, -0.5, 0.5, 0.5,
-4.968078, -3, -6.111111, 1, -0.5, 0.5, 0.5,
-4.968078, -3, -6.111111, 1, 1.5, 0.5, 0.5,
-4.968078, -3, -6.111111, 0, 1.5, 0.5, 0.5,
-4.968078, -2, -6.111111, 0, -0.5, 0.5, 0.5,
-4.968078, -2, -6.111111, 1, -0.5, 0.5, 0.5,
-4.968078, -2, -6.111111, 1, 1.5, 0.5, 0.5,
-4.968078, -2, -6.111111, 0, 1.5, 0.5, 0.5,
-4.968078, -1, -6.111111, 0, -0.5, 0.5, 0.5,
-4.968078, -1, -6.111111, 1, -0.5, 0.5, 0.5,
-4.968078, -1, -6.111111, 1, 1.5, 0.5, 0.5,
-4.968078, -1, -6.111111, 0, 1.5, 0.5, 0.5,
-4.968078, 0, -6.111111, 0, -0.5, 0.5, 0.5,
-4.968078, 0, -6.111111, 1, -0.5, 0.5, 0.5,
-4.968078, 0, -6.111111, 1, 1.5, 0.5, 0.5,
-4.968078, 0, -6.111111, 0, 1.5, 0.5, 0.5,
-4.968078, 1, -6.111111, 0, -0.5, 0.5, 0.5,
-4.968078, 1, -6.111111, 1, -0.5, 0.5, 0.5,
-4.968078, 1, -6.111111, 1, 1.5, 0.5, 0.5,
-4.968078, 1, -6.111111, 0, 1.5, 0.5, 0.5,
-4.968078, 2, -6.111111, 0, -0.5, 0.5, 0.5,
-4.968078, 2, -6.111111, 1, -0.5, 0.5, 0.5,
-4.968078, 2, -6.111111, 1, 1.5, 0.5, 0.5,
-4.968078, 2, -6.111111, 0, 1.5, 0.5, 0.5
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
-4.377638, -3.450415, -4,
-4.377638, -3.450415, 4,
-4.377638, -3.450415, -4,
-4.574451, -3.612964, -4,
-4.377638, -3.450415, -2,
-4.574451, -3.612964, -2,
-4.377638, -3.450415, 0,
-4.574451, -3.612964, 0,
-4.377638, -3.450415, 2,
-4.574451, -3.612964, 2,
-4.377638, -3.450415, 4,
-4.574451, -3.612964, 4
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
-4.968078, -3.938061, -4, 0, -0.5, 0.5, 0.5,
-4.968078, -3.938061, -4, 1, -0.5, 0.5, 0.5,
-4.968078, -3.938061, -4, 1, 1.5, 0.5, 0.5,
-4.968078, -3.938061, -4, 0, 1.5, 0.5, 0.5,
-4.968078, -3.938061, -2, 0, -0.5, 0.5, 0.5,
-4.968078, -3.938061, -2, 1, -0.5, 0.5, 0.5,
-4.968078, -3.938061, -2, 1, 1.5, 0.5, 0.5,
-4.968078, -3.938061, -2, 0, 1.5, 0.5, 0.5,
-4.968078, -3.938061, 0, 0, -0.5, 0.5, 0.5,
-4.968078, -3.938061, 0, 1, -0.5, 0.5, 0.5,
-4.968078, -3.938061, 0, 1, 1.5, 0.5, 0.5,
-4.968078, -3.938061, 0, 0, 1.5, 0.5, 0.5,
-4.968078, -3.938061, 2, 0, -0.5, 0.5, 0.5,
-4.968078, -3.938061, 2, 1, -0.5, 0.5, 0.5,
-4.968078, -3.938061, 2, 1, 1.5, 0.5, 0.5,
-4.968078, -3.938061, 2, 0, 1.5, 0.5, 0.5,
-4.968078, -3.938061, 4, 0, -0.5, 0.5, 0.5,
-4.968078, -3.938061, 4, 1, -0.5, 0.5, 0.5,
-4.968078, -3.938061, 4, 1, 1.5, 0.5, 0.5,
-4.968078, -3.938061, 4, 0, 1.5, 0.5, 0.5
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
-4.377638, -3.450415, -5.34624,
-4.377638, 3.051536, -5.34624,
-4.377638, -3.450415, 4.852053,
-4.377638, 3.051536, 4.852053,
-4.377638, -3.450415, -5.34624,
-4.377638, -3.450415, 4.852053,
-4.377638, 3.051536, -5.34624,
-4.377638, 3.051536, 4.852053,
-4.377638, -3.450415, -5.34624,
3.4949, -3.450415, -5.34624,
-4.377638, -3.450415, 4.852053,
3.4949, -3.450415, 4.852053,
-4.377638, 3.051536, -5.34624,
3.4949, 3.051536, -5.34624,
-4.377638, 3.051536, 4.852053,
3.4949, 3.051536, 4.852053,
3.4949, -3.450415, -5.34624,
3.4949, 3.051536, -5.34624,
3.4949, -3.450415, 4.852053,
3.4949, 3.051536, 4.852053,
3.4949, -3.450415, -5.34624,
3.4949, -3.450415, 4.852053,
3.4949, 3.051536, -5.34624,
3.4949, 3.051536, 4.852053
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
var radius = 7.70594;
var distance = 34.2846;
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
mvMatrix.translate( 0.4413687, 0.1994396, 0.2470934 );
mvMatrix.scale( 1.058339, 1.281433, 0.8169813 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.2846);
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
dinobuton<-read.table("dinobuton.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dinobuton$V2
```

```
## Error in eval(expr, envir, enclos): object 'dinobuton' not found
```

```r
y<-dinobuton$V3
```

```
## Error in eval(expr, envir, enclos): object 'dinobuton' not found
```

```r
z<-dinobuton$V4
```

```
## Error in eval(expr, envir, enclos): object 'dinobuton' not found
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
-4.262989, 0.7552609, -0.9178158, 0, 0, 1, 1, 1,
-4.229318, 0.5860747, -1.862554, 1, 0, 0, 1, 1,
-3.058698, -1.371299, -2.901728, 1, 0, 0, 1, 1,
-2.718741, 0.68563, -3.174129, 1, 0, 0, 1, 1,
-2.718586, -0.5645919, -1.666093, 1, 0, 0, 1, 1,
-2.659858, -0.7506332, -1.264748, 1, 0, 0, 1, 1,
-2.603169, 0.1320341, -1.946307, 0, 0, 0, 1, 1,
-2.589451, 0.8939695, -0.3678061, 0, 0, 0, 1, 1,
-2.360352, 0.3693338, -1.66412, 0, 0, 0, 1, 1,
-2.350495, 0.6057897, 0.1448984, 0, 0, 0, 1, 1,
-2.350031, 0.09491932, -0.5436978, 0, 0, 0, 1, 1,
-2.319211, -0.336753, -1.221526, 0, 0, 0, 1, 1,
-2.293382, 1.453092, -1.917397, 0, 0, 0, 1, 1,
-2.257735, -1.293873, -0.3289609, 1, 1, 1, 1, 1,
-2.229909, 0.5269786, -1.735084, 1, 1, 1, 1, 1,
-2.22804, 0.6852187, -2.575798, 1, 1, 1, 1, 1,
-2.197803, -0.2391644, -1.672227, 1, 1, 1, 1, 1,
-2.18362, -0.1066439, -2.303062, 1, 1, 1, 1, 1,
-2.132664, 0.414922, -2.626361, 1, 1, 1, 1, 1,
-2.084998, -2.676139, -3.183094, 1, 1, 1, 1, 1,
-2.032039, -0.6067832, -2.368531, 1, 1, 1, 1, 1,
-2.013611, 0.4903004, -0.9052025, 1, 1, 1, 1, 1,
-1.981814, -0.7061429, -3.059752, 1, 1, 1, 1, 1,
-1.978449, 0.1628319, -2.212547, 1, 1, 1, 1, 1,
-1.977307, -0.2699072, -1.48846, 1, 1, 1, 1, 1,
-1.964657, 0.2800313, -1.322725, 1, 1, 1, 1, 1,
-1.956501, -0.3828635, -0.6297509, 1, 1, 1, 1, 1,
-1.915342, 0.2401761, -3.84777, 1, 1, 1, 1, 1,
-1.90386, 1.201946, -0.9002158, 0, 0, 1, 1, 1,
-1.897589, 0.6688507, -0.4951428, 1, 0, 0, 1, 1,
-1.891919, -0.1189219, -2.42169, 1, 0, 0, 1, 1,
-1.88429, -0.555353, -1.024727, 1, 0, 0, 1, 1,
-1.858124, 2.956847, -0.08400987, 1, 0, 0, 1, 1,
-1.836409, -1.20153, -0.9149027, 1, 0, 0, 1, 1,
-1.831814, 0.4006806, -1.337871, 0, 0, 0, 1, 1,
-1.828416, -0.121573, -2.362091, 0, 0, 0, 1, 1,
-1.821481, -1.497265, -2.600385, 0, 0, 0, 1, 1,
-1.821086, 1.361468, -0.9812144, 0, 0, 0, 1, 1,
-1.817878, -0.6260766, -4.135367, 0, 0, 0, 1, 1,
-1.804461, -0.205199, -1.607757, 0, 0, 0, 1, 1,
-1.804444, 0.2448298, -1.848638, 0, 0, 0, 1, 1,
-1.793441, -0.03580355, -2.372536, 1, 1, 1, 1, 1,
-1.787662, 0.3600016, -1.739491, 1, 1, 1, 1, 1,
-1.754723, 0.01575322, -1.692001, 1, 1, 1, 1, 1,
-1.752496, -0.6518242, -0.93292, 1, 1, 1, 1, 1,
-1.738108, -0.4340923, -1.653309, 1, 1, 1, 1, 1,
-1.734964, 0.3967989, -0.4768273, 1, 1, 1, 1, 1,
-1.727838, 0.7696913, -1.391853, 1, 1, 1, 1, 1,
-1.722643, -2.038082, -2.916851, 1, 1, 1, 1, 1,
-1.720325, -0.5485585, -2.33415, 1, 1, 1, 1, 1,
-1.715983, 0.6393502, -1.155102, 1, 1, 1, 1, 1,
-1.694697, -0.07842539, -3.615243, 1, 1, 1, 1, 1,
-1.691011, 1.227828, -1.123227, 1, 1, 1, 1, 1,
-1.675557, -1.017419, -3.101562, 1, 1, 1, 1, 1,
-1.656511, -1.704316, -3.722571, 1, 1, 1, 1, 1,
-1.643316, -0.1868508, -2.768615, 1, 1, 1, 1, 1,
-1.643197, -1.369146, -2.635919, 0, 0, 1, 1, 1,
-1.629753, -1.631548, -2.069317, 1, 0, 0, 1, 1,
-1.627701, 0.6252009, 1.101656, 1, 0, 0, 1, 1,
-1.625795, -0.2328155, -0.6734415, 1, 0, 0, 1, 1,
-1.619238, -0.4448165, -1.840409, 1, 0, 0, 1, 1,
-1.611482, -0.831743, -1.945697, 1, 0, 0, 1, 1,
-1.604781, 0.3252922, -1.43072, 0, 0, 0, 1, 1,
-1.604764, 1.277381, 0.614772, 0, 0, 0, 1, 1,
-1.603914, -0.7085336, -1.858026, 0, 0, 0, 1, 1,
-1.602266, -0.9141981, -1.43091, 0, 0, 0, 1, 1,
-1.577552, 0.7862919, -2.29164, 0, 0, 0, 1, 1,
-1.569397, -2.254232, -1.258622, 0, 0, 0, 1, 1,
-1.539027, 0.719898, -0.4814515, 0, 0, 0, 1, 1,
-1.526458, 0.6801924, -1.322024, 1, 1, 1, 1, 1,
-1.525192, 0.9135125, 1.071526, 1, 1, 1, 1, 1,
-1.525192, 0.8657318, -2.072855, 1, 1, 1, 1, 1,
-1.519336, -0.006490903, -1.480997, 1, 1, 1, 1, 1,
-1.501573, -0.06299391, -1.386793, 1, 1, 1, 1, 1,
-1.499937, -0.7296922, 0.07468338, 1, 1, 1, 1, 1,
-1.4988, 1.119774, -2.861706, 1, 1, 1, 1, 1,
-1.487186, 1.85157, -0.9118057, 1, 1, 1, 1, 1,
-1.48238, 0.2521402, -1.586564, 1, 1, 1, 1, 1,
-1.477427, 0.07850272, -0.9561613, 1, 1, 1, 1, 1,
-1.45467, -0.9750452, -0.7280008, 1, 1, 1, 1, 1,
-1.447385, -3.355726, -3.046726, 1, 1, 1, 1, 1,
-1.415448, 1.530832, 0.4399024, 1, 1, 1, 1, 1,
-1.415436, 1.055419, -0.418907, 1, 1, 1, 1, 1,
-1.409871, -0.003515932, -1.128963, 1, 1, 1, 1, 1,
-1.406171, -0.2934663, -1.354242, 0, 0, 1, 1, 1,
-1.405124, 0.3972615, -1.209605, 1, 0, 0, 1, 1,
-1.397309, -0.9134505, -0.006265248, 1, 0, 0, 1, 1,
-1.396813, -0.8419369, -1.455205, 1, 0, 0, 1, 1,
-1.396688, -0.1430279, -2.178214, 1, 0, 0, 1, 1,
-1.392728, 1.469866, -0.6125953, 1, 0, 0, 1, 1,
-1.363207, -1.734228, -1.488241, 0, 0, 0, 1, 1,
-1.360375, 0.7962281, -0.758933, 0, 0, 0, 1, 1,
-1.359938, -1.354513, -1.120824, 0, 0, 0, 1, 1,
-1.358176, 0.06735322, -2.611725, 0, 0, 0, 1, 1,
-1.357246, 1.081684, -3.320037, 0, 0, 0, 1, 1,
-1.350573, -0.2570563, 0.7108401, 0, 0, 0, 1, 1,
-1.34121, 0.2995743, -2.656191, 0, 0, 0, 1, 1,
-1.338543, 0.7312332, -0.8866367, 1, 1, 1, 1, 1,
-1.334461, 0.08690544, -2.180711, 1, 1, 1, 1, 1,
-1.327997, -1.08477, -2.386195, 1, 1, 1, 1, 1,
-1.327238, 1.762765, 0.4784313, 1, 1, 1, 1, 1,
-1.322245, 0.8481081, -0.524241, 1, 1, 1, 1, 1,
-1.320662, -0.113938, -1.036388, 1, 1, 1, 1, 1,
-1.315372, -1.019386, -2.510274, 1, 1, 1, 1, 1,
-1.307457, 0.01215561, -0.6923156, 1, 1, 1, 1, 1,
-1.288513, -0.7460812, -2.098904, 1, 1, 1, 1, 1,
-1.286062, -0.2637953, -0.2676703, 1, 1, 1, 1, 1,
-1.270677, 0.512372, -2.036795, 1, 1, 1, 1, 1,
-1.263752, -1.532047, -1.900369, 1, 1, 1, 1, 1,
-1.263704, -0.5818311, -0.9076514, 1, 1, 1, 1, 1,
-1.26329, 0.6469991, -0.3720489, 1, 1, 1, 1, 1,
-1.262495, -0.868845, -3.064228, 1, 1, 1, 1, 1,
-1.259899, -0.5706267, -0.3473161, 0, 0, 1, 1, 1,
-1.251439, -0.04821867, -1.490589, 1, 0, 0, 1, 1,
-1.237817, 0.0500196, -0.9190784, 1, 0, 0, 1, 1,
-1.226344, 0.330331, -0.2977147, 1, 0, 0, 1, 1,
-1.207214, 1.070485, -1.11885, 1, 0, 0, 1, 1,
-1.205941, 0.6114489, -0.8680744, 1, 0, 0, 1, 1,
-1.195833, -0.1406133, -0.3210648, 0, 0, 0, 1, 1,
-1.192189, 0.513377, -1.708369, 0, 0, 0, 1, 1,
-1.190302, 0.595666, -3.236261, 0, 0, 0, 1, 1,
-1.190291, -0.9985765, -2.95831, 0, 0, 0, 1, 1,
-1.183864, -0.5072213, -3.888512, 0, 0, 0, 1, 1,
-1.180495, -0.7475796, -1.004962, 0, 0, 0, 1, 1,
-1.177307, -0.322603, -3.289385, 0, 0, 0, 1, 1,
-1.173247, 1.40145, 0.8694394, 1, 1, 1, 1, 1,
-1.173222, 1.752187, -1.215328, 1, 1, 1, 1, 1,
-1.169881, -0.005566705, -2.436796, 1, 1, 1, 1, 1,
-1.163482, -0.2121386, 1.612164, 1, 1, 1, 1, 1,
-1.158059, 0.382801, -1.33887, 1, 1, 1, 1, 1,
-1.155072, -2.362115, -1.991274, 1, 1, 1, 1, 1,
-1.15496, 0.6044069, 0.32472, 1, 1, 1, 1, 1,
-1.152601, 0.4190514, -2.855593, 1, 1, 1, 1, 1,
-1.143405, -0.4480962, -2.649174, 1, 1, 1, 1, 1,
-1.138676, 0.321546, -0.893507, 1, 1, 1, 1, 1,
-1.137819, 0.3392713, -1.354327, 1, 1, 1, 1, 1,
-1.135715, -0.5034301, -2.652047, 1, 1, 1, 1, 1,
-1.132728, -0.4193443, -1.250988, 1, 1, 1, 1, 1,
-1.131342, -1.181457, -1.32454, 1, 1, 1, 1, 1,
-1.130821, 0.4819524, 0.6444427, 1, 1, 1, 1, 1,
-1.127249, -1.302088, -3.448424, 0, 0, 1, 1, 1,
-1.122807, -0.9481286, -2.6059, 1, 0, 0, 1, 1,
-1.121379, 0.5835137, -2.350668, 1, 0, 0, 1, 1,
-1.121083, 1.328669, -0.4376483, 1, 0, 0, 1, 1,
-1.113337, -0.8969784, -2.662786, 1, 0, 0, 1, 1,
-1.112355, -0.5364895, -1.022097, 1, 0, 0, 1, 1,
-1.102299, 0.3520952, -1.035408, 0, 0, 0, 1, 1,
-1.100307, 1.22412, -0.6211124, 0, 0, 0, 1, 1,
-1.098458, 1.033611, -1.235688, 0, 0, 0, 1, 1,
-1.098096, 0.7126083, -2.279661, 0, 0, 0, 1, 1,
-1.094942, 0.9718058, -1.305806, 0, 0, 0, 1, 1,
-1.090688, -0.6449493, -1.195063, 0, 0, 0, 1, 1,
-1.088936, -0.8102384, -1.57056, 0, 0, 0, 1, 1,
-1.088233, 0.04322848, 0.8887101, 1, 1, 1, 1, 1,
-1.088159, -0.2963847, -0.5773871, 1, 1, 1, 1, 1,
-1.083814, -1.138226, -3.563043, 1, 1, 1, 1, 1,
-1.08085, -0.4721851, -0.6848334, 1, 1, 1, 1, 1,
-1.075032, -1.310937, -3.941041, 1, 1, 1, 1, 1,
-1.072099, -1.304564, -2.577425, 1, 1, 1, 1, 1,
-1.068039, -0.4821468, -2.333321, 1, 1, 1, 1, 1,
-1.066654, -0.1514733, -1.317983, 1, 1, 1, 1, 1,
-1.065005, -0.2112243, -2.121964, 1, 1, 1, 1, 1,
-1.059883, -0.5715935, -2.453054, 1, 1, 1, 1, 1,
-1.054826, -0.007418669, -1.367649, 1, 1, 1, 1, 1,
-1.047911, -0.1530258, -0.6429794, 1, 1, 1, 1, 1,
-1.043538, -0.02183006, -2.788661, 1, 1, 1, 1, 1,
-1.037774, 0.2402661, -1.299908, 1, 1, 1, 1, 1,
-1.037608, 0.1382112, -0.8414786, 1, 1, 1, 1, 1,
-1.03363, 0.5050789, 0.7445054, 0, 0, 1, 1, 1,
-1.031466, 0.162716, -0.3457761, 1, 0, 0, 1, 1,
-1.02599, 1.163604, -1.016676, 1, 0, 0, 1, 1,
-1.022676, 0.5510775, 0.4662679, 1, 0, 0, 1, 1,
-1.016266, 0.6136604, -1.633128, 1, 0, 0, 1, 1,
-1.011216, -0.5367041, -0.744024, 1, 0, 0, 1, 1,
-1.009414, 0.2883843, 0.08736607, 0, 0, 0, 1, 1,
-1.007517, -0.05222711, -1.34295, 0, 0, 0, 1, 1,
-1.004952, -1.509407, -1.577629, 0, 0, 0, 1, 1,
-1.003621, -1.077564, -1.46176, 0, 0, 0, 1, 1,
-0.9981285, -0.2004879, -1.497331, 0, 0, 0, 1, 1,
-0.9973004, -0.9378988, -3.411729, 0, 0, 0, 1, 1,
-0.9955105, 1.567676, -0.1336104, 0, 0, 0, 1, 1,
-0.9881731, -1.497506, -3.014838, 1, 1, 1, 1, 1,
-0.9880111, 0.05013379, -0.7003475, 1, 1, 1, 1, 1,
-0.9824435, 0.6505247, 1.112071, 1, 1, 1, 1, 1,
-0.9806619, -0.171929, -3.325604, 1, 1, 1, 1, 1,
-0.973977, 0.01525766, -1.443086, 1, 1, 1, 1, 1,
-0.9665772, 0.4991284, -1.455907, 1, 1, 1, 1, 1,
-0.9604354, 1.34701, -0.6072863, 1, 1, 1, 1, 1,
-0.9567647, 0.9579043, 0.6349931, 1, 1, 1, 1, 1,
-0.9533705, -0.811093, -3.432474, 1, 1, 1, 1, 1,
-0.9513112, 0.07839671, -0.3155407, 1, 1, 1, 1, 1,
-0.950162, -0.4218614, -0.7431976, 1, 1, 1, 1, 1,
-0.9475915, -1.011611, -2.621909, 1, 1, 1, 1, 1,
-0.9440523, 0.3855826, -0.9615099, 1, 1, 1, 1, 1,
-0.9314631, -1.89745, -2.839039, 1, 1, 1, 1, 1,
-0.926784, -0.08970817, -2.007872, 1, 1, 1, 1, 1,
-0.9260858, 1.054431, -1.702165, 0, 0, 1, 1, 1,
-0.9226424, -1.188683, -1.178841, 1, 0, 0, 1, 1,
-0.9178126, 1.474194, 0.7397153, 1, 0, 0, 1, 1,
-0.9168331, 1.18647, -0.9162565, 1, 0, 0, 1, 1,
-0.9075112, -1.425456, -4.234589, 1, 0, 0, 1, 1,
-0.8958995, -0.6334816, -3.008352, 1, 0, 0, 1, 1,
-0.8855085, 0.528553, -1.308901, 0, 0, 0, 1, 1,
-0.8757859, 0.142768, -0.1296937, 0, 0, 0, 1, 1,
-0.8681291, 1.258729, 0.7639734, 0, 0, 0, 1, 1,
-0.862635, 0.8079399, -1.044501, 0, 0, 0, 1, 1,
-0.8603641, -0.5011399, -1.601467, 0, 0, 0, 1, 1,
-0.8552046, -1.364833, -1.210098, 0, 0, 0, 1, 1,
-0.8536442, -1.148034, -1.155279, 0, 0, 0, 1, 1,
-0.8523325, 0.2688072, -0.8515131, 1, 1, 1, 1, 1,
-0.8423204, 1.450111, -1.355573, 1, 1, 1, 1, 1,
-0.8402722, 1.288221, -2.011514, 1, 1, 1, 1, 1,
-0.8285497, 0.2995104, -1.340581, 1, 1, 1, 1, 1,
-0.8274391, 0.5368593, -3.013087, 1, 1, 1, 1, 1,
-0.8206785, 2.917703, -2.172908, 1, 1, 1, 1, 1,
-0.8189567, -0.02270237, -3.11621, 1, 1, 1, 1, 1,
-0.8168926, 1.374627, -1.03274, 1, 1, 1, 1, 1,
-0.8145633, 0.2621595, -1.682632, 1, 1, 1, 1, 1,
-0.8049924, 0.6473801, -0.4308261, 1, 1, 1, 1, 1,
-0.7980932, -1.70106, -2.578107, 1, 1, 1, 1, 1,
-0.7945417, -0.06652182, -2.793455, 1, 1, 1, 1, 1,
-0.792286, -0.2305112, -0.0177976, 1, 1, 1, 1, 1,
-0.7920161, 0.9131495, -0.9542788, 1, 1, 1, 1, 1,
-0.7919519, 0.3607541, -1.075036, 1, 1, 1, 1, 1,
-0.7901938, -0.2576624, -2.083728, 0, 0, 1, 1, 1,
-0.7865568, -1.043752, -3.999732, 1, 0, 0, 1, 1,
-0.7732998, 0.8306831, 1.361697, 1, 0, 0, 1, 1,
-0.7709894, 0.008889915, 0.02089335, 1, 0, 0, 1, 1,
-0.7682785, -0.3768721, -2.401893, 1, 0, 0, 1, 1,
-0.7493066, 0.139627, -1.470347, 1, 0, 0, 1, 1,
-0.7488118, 0.2387683, -1.233172, 0, 0, 0, 1, 1,
-0.7475806, -0.9979779, -2.420541, 0, 0, 0, 1, 1,
-0.7446306, -0.1039444, -1.130994, 0, 0, 0, 1, 1,
-0.7425924, 2.068811, -2.342779, 0, 0, 0, 1, 1,
-0.7424079, 0.9280214, -3.083011, 0, 0, 0, 1, 1,
-0.7405952, -0.03716355, -2.222872, 0, 0, 0, 1, 1,
-0.7405087, 0.9072583, -1.685492, 0, 0, 0, 1, 1,
-0.7366608, 0.1280733, -1.078273, 1, 1, 1, 1, 1,
-0.7344704, -1.433473, -2.272227, 1, 1, 1, 1, 1,
-0.72978, 0.2089247, -0.0488582, 1, 1, 1, 1, 1,
-0.7247573, -0.5628419, -0.7938202, 1, 1, 1, 1, 1,
-0.7242147, 0.8194932, -2.505501, 1, 1, 1, 1, 1,
-0.7223434, 0.5208659, 0.9879088, 1, 1, 1, 1, 1,
-0.7192783, 0.5711546, 0.007629465, 1, 1, 1, 1, 1,
-0.7192574, -0.3025551, -3.387068, 1, 1, 1, 1, 1,
-0.7187479, -1.571757, -3.716675, 1, 1, 1, 1, 1,
-0.7119637, 1.283053, -1.952011, 1, 1, 1, 1, 1,
-0.7114283, 1.541088, -0.59238, 1, 1, 1, 1, 1,
-0.7067959, 1.165547, -1.863901, 1, 1, 1, 1, 1,
-0.7009277, 0.1263078, 1.281543, 1, 1, 1, 1, 1,
-0.6971095, 2.195618, -3.033173, 1, 1, 1, 1, 1,
-0.6870533, -0.0002016855, -1.480783, 1, 1, 1, 1, 1,
-0.6865628, 0.1962559, -2.710088, 0, 0, 1, 1, 1,
-0.6830143, 1.188503, -1.773246, 1, 0, 0, 1, 1,
-0.6822557, -1.500477, -2.743848, 1, 0, 0, 1, 1,
-0.6687688, -0.7611859, -4.654879, 1, 0, 0, 1, 1,
-0.6685894, 2.039457, -0.9033002, 1, 0, 0, 1, 1,
-0.6658293, 0.1172223, -1.865491, 1, 0, 0, 1, 1,
-0.66083, -0.8931177, -1.936995, 0, 0, 0, 1, 1,
-0.6583937, 0.007026715, -1.06917, 0, 0, 0, 1, 1,
-0.6581025, 0.9898289, 0.5044488, 0, 0, 0, 1, 1,
-0.6574709, 0.5016372, -0.0522801, 0, 0, 0, 1, 1,
-0.6517915, 0.04053787, -2.417795, 0, 0, 0, 1, 1,
-0.6509684, -0.0788682, -0.7446562, 0, 0, 0, 1, 1,
-0.6419727, 0.01879183, -1.829374, 0, 0, 0, 1, 1,
-0.6397334, 1.789617, -1.34289, 1, 1, 1, 1, 1,
-0.6347792, -0.01362481, 0.309459, 1, 1, 1, 1, 1,
-0.6345935, -0.5534497, -1.789253, 1, 1, 1, 1, 1,
-0.6320072, -1.958364, -0.9106812, 1, 1, 1, 1, 1,
-0.6286173, -0.2162405, -4.626788, 1, 1, 1, 1, 1,
-0.6257309, 0.4038111, -1.235227, 1, 1, 1, 1, 1,
-0.6222646, 0.4521699, -0.420849, 1, 1, 1, 1, 1,
-0.6193143, 1.137365, 0.6579303, 1, 1, 1, 1, 1,
-0.6152002, -0.292575, -0.3270181, 1, 1, 1, 1, 1,
-0.6064224, 1.503818, -0.02938255, 1, 1, 1, 1, 1,
-0.6017891, -1.396399, -1.666625, 1, 1, 1, 1, 1,
-0.5958961, -1.225144, -2.567214, 1, 1, 1, 1, 1,
-0.5946702, 0.4741109, -1.927307, 1, 1, 1, 1, 1,
-0.5921108, -0.421772, -1.739967, 1, 1, 1, 1, 1,
-0.5909732, -0.5422643, -2.415315, 1, 1, 1, 1, 1,
-0.5861771, 1.01002, -0.5778112, 0, 0, 1, 1, 1,
-0.5859046, -0.7401795, -2.702287, 1, 0, 0, 1, 1,
-0.5768467, -0.2321374, -0.4911293, 1, 0, 0, 1, 1,
-0.5713347, 1.283353, -0.5692477, 1, 0, 0, 1, 1,
-0.570824, 0.1374311, -1.014564, 1, 0, 0, 1, 1,
-0.5684801, -0.4693195, -2.262861, 1, 0, 0, 1, 1,
-0.568114, 0.878792, -0.806353, 0, 0, 0, 1, 1,
-0.5676157, -0.500248, -1.742965, 0, 0, 0, 1, 1,
-0.5672758, 0.1015535, -2.074683, 0, 0, 0, 1, 1,
-0.5668654, -0.6750421, -1.81514, 0, 0, 0, 1, 1,
-0.5657524, -1.0136, -4.462626, 0, 0, 0, 1, 1,
-0.5656739, -0.5184358, -2.047306, 0, 0, 0, 1, 1,
-0.5567415, 0.303223, -0.4612702, 0, 0, 0, 1, 1,
-0.5556419, -0.9282838, -1.703283, 1, 1, 1, 1, 1,
-0.5502099, -0.5516079, -3.79074, 1, 1, 1, 1, 1,
-0.5498217, -0.416939, -0.8160368, 1, 1, 1, 1, 1,
-0.5498084, -0.007010505, -1.795753, 1, 1, 1, 1, 1,
-0.5438858, -0.115383, -1.34887, 1, 1, 1, 1, 1,
-0.5373446, -0.975935, -1.654494, 1, 1, 1, 1, 1,
-0.535913, 0.08396949, -1.6469, 1, 1, 1, 1, 1,
-0.5251791, 0.8400936, 0.04178775, 1, 1, 1, 1, 1,
-0.5227747, -0.2259497, -1.903572, 1, 1, 1, 1, 1,
-0.5220277, 0.718563, -1.351652, 1, 1, 1, 1, 1,
-0.5209677, 0.1198955, -0.4008387, 1, 1, 1, 1, 1,
-0.5198976, 0.6251347, -0.4919436, 1, 1, 1, 1, 1,
-0.5156475, 1.767126, 0.02767686, 1, 1, 1, 1, 1,
-0.5137373, -0.9318843, -2.981883, 1, 1, 1, 1, 1,
-0.5129392, -0.1955949, -2.815212, 1, 1, 1, 1, 1,
-0.51289, -0.06740838, -1.220932, 0, 0, 1, 1, 1,
-0.5097541, 0.8715397, -0.8263168, 1, 0, 0, 1, 1,
-0.5087043, 1.33871, 1.00503, 1, 0, 0, 1, 1,
-0.5075312, -1.1275, -1.965072, 1, 0, 0, 1, 1,
-0.5021068, -0.1984829, -1.884862, 1, 0, 0, 1, 1,
-0.4986048, 1.282975, -1.261072, 1, 0, 0, 1, 1,
-0.4950693, -0.9625635, 0.1831365, 0, 0, 0, 1, 1,
-0.4855478, -0.5730707, -2.431614, 0, 0, 0, 1, 1,
-0.4820146, 0.9046797, -0.3272881, 0, 0, 0, 1, 1,
-0.4795296, -0.6691071, -2.953084, 0, 0, 0, 1, 1,
-0.4727854, -0.07993039, -1.283271, 0, 0, 0, 1, 1,
-0.4717122, 0.862096, 0.7901507, 0, 0, 0, 1, 1,
-0.4691268, -0.2576673, -2.846718, 0, 0, 0, 1, 1,
-0.4662661, -0.4124385, -3.351153, 1, 1, 1, 1, 1,
-0.4601535, -0.5963709, -3.466735, 1, 1, 1, 1, 1,
-0.4571745, 1.307233, -2.455108, 1, 1, 1, 1, 1,
-0.4537609, 1.144471, 0.4167175, 1, 1, 1, 1, 1,
-0.4493089, -2.103646, -1.943349, 1, 1, 1, 1, 1,
-0.4475662, 1.984198, -1.601308, 1, 1, 1, 1, 1,
-0.442011, -1.820082, -3.718103, 1, 1, 1, 1, 1,
-0.4415366, -0.2647969, -1.706187, 1, 1, 1, 1, 1,
-0.4404509, -0.4819549, -2.385442, 1, 1, 1, 1, 1,
-0.4395409, -0.3993331, -2.054169, 1, 1, 1, 1, 1,
-0.4336886, 0.4424016, -0.7536792, 1, 1, 1, 1, 1,
-0.4323916, 0.5561773, -0.3659329, 1, 1, 1, 1, 1,
-0.4280767, -1.148706, -1.362091, 1, 1, 1, 1, 1,
-0.42691, 1.628856, -2.582131, 1, 1, 1, 1, 1,
-0.4268401, -1.059296, -2.763301, 1, 1, 1, 1, 1,
-0.4249584, -2.144614, -2.605424, 0, 0, 1, 1, 1,
-0.4241769, -1.904479, -1.850063, 1, 0, 0, 1, 1,
-0.4196143, -0.3695783, -1.687854, 1, 0, 0, 1, 1,
-0.4173597, 1.119346, -0.5140905, 1, 0, 0, 1, 1,
-0.41666, -0.5327823, -3.381095, 1, 0, 0, 1, 1,
-0.4148223, -0.7704053, -2.653312, 1, 0, 0, 1, 1,
-0.4140267, 0.2952654, -2.219467, 0, 0, 0, 1, 1,
-0.4128543, -0.4901478, -2.496683, 0, 0, 0, 1, 1,
-0.4092593, 0.6252369, -1.61181, 0, 0, 0, 1, 1,
-0.4056191, 0.005761797, -2.997958, 0, 0, 0, 1, 1,
-0.4048432, 0.5037875, -1.176392, 0, 0, 0, 1, 1,
-0.4040757, -0.3916551, -1.329602, 0, 0, 0, 1, 1,
-0.4033217, 1.290748, -0.4622602, 0, 0, 0, 1, 1,
-0.4014068, -0.5554498, -2.526824, 1, 1, 1, 1, 1,
-0.3972598, 0.611048, 0.541127, 1, 1, 1, 1, 1,
-0.3953772, 0.1285627, -2.364208, 1, 1, 1, 1, 1,
-0.3916966, 0.1291222, -0.009099767, 1, 1, 1, 1, 1,
-0.3888021, -0.5016763, -2.475098, 1, 1, 1, 1, 1,
-0.3885245, 2.114882, -0.3842974, 1, 1, 1, 1, 1,
-0.3884295, 1.297961, 0.6138074, 1, 1, 1, 1, 1,
-0.3793098, 1.046357, -0.6718685, 1, 1, 1, 1, 1,
-0.3770822, -0.3175398, 0.1806844, 1, 1, 1, 1, 1,
-0.375415, 0.422968, -0.4566333, 1, 1, 1, 1, 1,
-0.373753, -0.2496685, -1.671466, 1, 1, 1, 1, 1,
-0.3716306, 0.7389289, -0.4646942, 1, 1, 1, 1, 1,
-0.3709896, -0.8784472, -2.902436, 1, 1, 1, 1, 1,
-0.3612513, -1.416324, -4.410577, 1, 1, 1, 1, 1,
-0.3587875, 0.3950936, -0.05443337, 1, 1, 1, 1, 1,
-0.3541802, -0.2439541, -3.674485, 0, 0, 1, 1, 1,
-0.3508856, 0.5856879, -1.162936, 1, 0, 0, 1, 1,
-0.3506419, 0.8508753, -0.5065826, 1, 0, 0, 1, 1,
-0.3506242, -0.9228979, -2.680713, 1, 0, 0, 1, 1,
-0.3494722, 0.7513401, -0.5164883, 1, 0, 0, 1, 1,
-0.3473729, 0.4867806, -1.61233, 1, 0, 0, 1, 1,
-0.3440377, -0.06182249, -3.754758, 0, 0, 0, 1, 1,
-0.3438792, -0.3206767, -2.099049, 0, 0, 0, 1, 1,
-0.3428651, 0.6912691, -1.164004, 0, 0, 0, 1, 1,
-0.3373397, -0.625797, -1.002856, 0, 0, 0, 1, 1,
-0.3327364, 1.598324, -0.580765, 0, 0, 0, 1, 1,
-0.3307747, 0.4485719, -0.7049754, 0, 0, 0, 1, 1,
-0.3306843, -0.05616784, -1.499452, 0, 0, 0, 1, 1,
-0.3226025, 0.3075389, -1.296443, 1, 1, 1, 1, 1,
-0.317418, -1.031428, -3.020802, 1, 1, 1, 1, 1,
-0.3131131, 0.811566, -0.7098925, 1, 1, 1, 1, 1,
-0.312902, -0.7985931, -1.577571, 1, 1, 1, 1, 1,
-0.3104746, -1.39105, -3.084593, 1, 1, 1, 1, 1,
-0.3097575, -0.8960679, -3.446902, 1, 1, 1, 1, 1,
-0.3090233, 1.118529, -0.6220534, 1, 1, 1, 1, 1,
-0.3082579, 0.06968305, -2.960204, 1, 1, 1, 1, 1,
-0.3074506, 1.890816, 2.974414, 1, 1, 1, 1, 1,
-0.3054398, 0.6950833, 1.054819, 1, 1, 1, 1, 1,
-0.3026138, -0.2741232, -1.002576, 1, 1, 1, 1, 1,
-0.2958637, -0.146622, -2.024118, 1, 1, 1, 1, 1,
-0.2953426, -0.2748263, -1.599404, 1, 1, 1, 1, 1,
-0.2935677, -1.442509, -1.79636, 1, 1, 1, 1, 1,
-0.289521, -0.05738144, -3.201092, 1, 1, 1, 1, 1,
-0.2872407, -1.095206, -3.760076, 0, 0, 1, 1, 1,
-0.2858716, -0.1065472, -3.719434, 1, 0, 0, 1, 1,
-0.2856374, 0.08372972, -0.3492483, 1, 0, 0, 1, 1,
-0.2850471, -0.5828381, -2.17727, 1, 0, 0, 1, 1,
-0.2848192, -0.7162268, -3.246863, 1, 0, 0, 1, 1,
-0.2843655, 0.4826103, 0.02838705, 1, 0, 0, 1, 1,
-0.2825808, -0.1687554, -2.937427, 0, 0, 0, 1, 1,
-0.2811676, 0.7747761, 0.3651529, 0, 0, 0, 1, 1,
-0.2796983, 1.031737, -0.3137471, 0, 0, 0, 1, 1,
-0.2796277, -0.4626258, -2.789746, 0, 0, 0, 1, 1,
-0.2783875, -0.3778158, -2.056609, 0, 0, 0, 1, 1,
-0.2776248, -0.01967577, -0.3634824, 0, 0, 0, 1, 1,
-0.2767598, 0.5191206, -0.1883407, 0, 0, 0, 1, 1,
-0.2752216, -0.7510837, -2.116208, 1, 1, 1, 1, 1,
-0.2700466, -0.03861181, -0.754982, 1, 1, 1, 1, 1,
-0.2685567, 0.01914562, -1.617891, 1, 1, 1, 1, 1,
-0.2682461, 0.9537975, 2.816905, 1, 1, 1, 1, 1,
-0.2631803, -1.451682, -1.34432, 1, 1, 1, 1, 1,
-0.2629508, -0.8497837, -1.5763, 1, 1, 1, 1, 1,
-0.2628156, 0.9653909, -0.5241771, 1, 1, 1, 1, 1,
-0.2583302, 0.06746204, 0.296909, 1, 1, 1, 1, 1,
-0.2518621, -1.299508, -2.361642, 1, 1, 1, 1, 1,
-0.2506445, 1.211728, -0.9131471, 1, 1, 1, 1, 1,
-0.2487502, 0.4476086, 0.3674669, 1, 1, 1, 1, 1,
-0.2484127, 0.6292786, -0.02355924, 1, 1, 1, 1, 1,
-0.2439889, -0.7331204, -5.121366, 1, 1, 1, 1, 1,
-0.2407591, -0.7178928, -2.035851, 1, 1, 1, 1, 1,
-0.2389806, 0.8074118, -0.3899177, 1, 1, 1, 1, 1,
-0.2370926, 0.8272862, 1.80187, 0, 0, 1, 1, 1,
-0.232802, -0.3262243, -3.241551, 1, 0, 0, 1, 1,
-0.230637, -0.8070603, -3.732801, 1, 0, 0, 1, 1,
-0.2237594, 0.4436998, 1.124634, 1, 0, 0, 1, 1,
-0.2216627, -1.311374, -2.061418, 1, 0, 0, 1, 1,
-0.2181809, 2.231927, 0.5067251, 1, 0, 0, 1, 1,
-0.2149571, 0.5568745, 0.9092978, 0, 0, 0, 1, 1,
-0.2126849, -0.1040617, -3.279528, 0, 0, 0, 1, 1,
-0.2126429, -0.01869523, -2.841985, 0, 0, 0, 1, 1,
-0.2116305, 1.123984, -1.373531, 0, 0, 0, 1, 1,
-0.2112244, 1.62564, -1.440543, 0, 0, 0, 1, 1,
-0.2037766, 0.6304423, -0.7636573, 0, 0, 0, 1, 1,
-0.2028649, 0.90344, -1.078657, 0, 0, 0, 1, 1,
-0.199229, 0.2361674, -1.180903, 1, 1, 1, 1, 1,
-0.1955332, -0.0699777, -1.048677, 1, 1, 1, 1, 1,
-0.1938503, -0.7222874, -2.982113, 1, 1, 1, 1, 1,
-0.1912709, 0.565941, 0.2615876, 1, 1, 1, 1, 1,
-0.189297, 0.4322108, -1.490174, 1, 1, 1, 1, 1,
-0.1854874, -0.83707, -2.701239, 1, 1, 1, 1, 1,
-0.1842041, 0.7512292, -0.9101188, 1, 1, 1, 1, 1,
-0.1815548, 0.2566124, -0.2369256, 1, 1, 1, 1, 1,
-0.1782363, -0.539169, -2.642735, 1, 1, 1, 1, 1,
-0.1758217, 0.6723294, 0.5012636, 1, 1, 1, 1, 1,
-0.1723702, 0.2424287, -0.09580866, 1, 1, 1, 1, 1,
-0.1708828, 0.1959535, -1.831333, 1, 1, 1, 1, 1,
-0.1691764, -0.2924999, -2.118266, 1, 1, 1, 1, 1,
-0.1661698, 0.8357819, 0.5981082, 1, 1, 1, 1, 1,
-0.1648435, 0.220887, -2.101065, 1, 1, 1, 1, 1,
-0.1640352, 0.1883865, -0.7027344, 0, 0, 1, 1, 1,
-0.1629302, -0.6866064, -3.186628, 1, 0, 0, 1, 1,
-0.1588983, -1.700818, -4.285913, 1, 0, 0, 1, 1,
-0.1578377, -1.344454, -4.35648, 1, 0, 0, 1, 1,
-0.1552165, 0.3941559, -0.5989328, 1, 0, 0, 1, 1,
-0.1489706, 1.026015, -0.7239459, 1, 0, 0, 1, 1,
-0.1467577, -1.248134, -2.899961, 0, 0, 0, 1, 1,
-0.1460883, 1.013295, 2.020869, 0, 0, 0, 1, 1,
-0.1400082, 1.018942, -0.9624894, 0, 0, 0, 1, 1,
-0.1379275, 0.356043, -2.085598, 0, 0, 0, 1, 1,
-0.1376048, -0.3422699, -1.634518, 0, 0, 0, 1, 1,
-0.1371768, -0.4188325, -2.114248, 0, 0, 0, 1, 1,
-0.1292179, -0.4745327, -2.650496, 0, 0, 0, 1, 1,
-0.1283955, -0.004884228, -3.227276, 1, 1, 1, 1, 1,
-0.1257435, -0.2489268, -4.138619, 1, 1, 1, 1, 1,
-0.1241439, -1.132102, -3.00777, 1, 1, 1, 1, 1,
-0.1203779, 0.793443, -1.157708, 1, 1, 1, 1, 1,
-0.1175092, 0.1465996, -1.932186, 1, 1, 1, 1, 1,
-0.1173414, 0.1781799, -0.05063862, 1, 1, 1, 1, 1,
-0.1153297, -0.9358895, -2.311588, 1, 1, 1, 1, 1,
-0.1089112, -0.6111668, -3.148407, 1, 1, 1, 1, 1,
-0.1064965, -1.158538, -5.197721, 1, 1, 1, 1, 1,
-0.1048534, -1.404996, -3.501478, 1, 1, 1, 1, 1,
-0.1043199, 1.035098, 1.042647, 1, 1, 1, 1, 1,
-0.1033651, -0.832076, -1.805978, 1, 1, 1, 1, 1,
-0.1019003, -0.4304505, -0.8367652, 1, 1, 1, 1, 1,
-0.1009576, 1.368959, -0.1796434, 1, 1, 1, 1, 1,
-0.09615334, 0.2143301, 0.4607538, 1, 1, 1, 1, 1,
-0.09088731, 1.315337, -0.9359358, 0, 0, 1, 1, 1,
-0.08548363, -0.7671751, -2.451924, 1, 0, 0, 1, 1,
-0.08534043, -0.9365511, -3.871103, 1, 0, 0, 1, 1,
-0.08297271, -0.4141562, -3.916787, 1, 0, 0, 1, 1,
-0.06891304, -1.311347, -3.834262, 1, 0, 0, 1, 1,
-0.06490472, -0.2944058, -2.648651, 1, 0, 0, 1, 1,
-0.06167522, -0.5871534, -4.901484, 0, 0, 0, 1, 1,
-0.0610567, -2.007658, -4.048644, 0, 0, 0, 1, 1,
-0.05884432, -1.290157, -1.648693, 0, 0, 0, 1, 1,
-0.05331815, -1.549666, -2.547302, 0, 0, 0, 1, 1,
-0.05299479, 0.4807283, -1.120489, 0, 0, 0, 1, 1,
-0.0527749, -0.7922643, -3.812892, 0, 0, 0, 1, 1,
-0.04712785, 0.4137354, -0.07343724, 0, 0, 0, 1, 1,
-0.04626182, -0.1665108, -2.572426, 1, 1, 1, 1, 1,
-0.04404589, 0.01037728, -0.1293138, 1, 1, 1, 1, 1,
-0.04046374, 0.005408273, -1.659153, 1, 1, 1, 1, 1,
-0.03927809, -1.916958, -2.692255, 1, 1, 1, 1, 1,
-0.03796406, -0.2070914, -3.598887, 1, 1, 1, 1, 1,
-0.03452171, 1.436064, 0.4236322, 1, 1, 1, 1, 1,
-0.02854078, -1.103127, -4.546004, 1, 1, 1, 1, 1,
-0.01069949, -0.1096284, -2.225493, 1, 1, 1, 1, 1,
-0.00975022, -0.5851614, -1.831918, 1, 1, 1, 1, 1,
-0.009479884, 0.3409075, 0.232126, 1, 1, 1, 1, 1,
-0.006083292, 1.020813, -0.7942179, 1, 1, 1, 1, 1,
-0.005217229, -0.1023864, -3.307059, 1, 1, 1, 1, 1,
-0.004201441, 0.9614999, 3.324049, 1, 1, 1, 1, 1,
-0.002559251, 0.6161061, -0.1006517, 1, 1, 1, 1, 1,
-0.00118537, 0.4597289, 1.570416, 1, 1, 1, 1, 1,
-0.000280553, -0.2351724, -3.009208, 0, 0, 1, 1, 1,
0.002638977, 0.1949323, -0.859827, 1, 0, 0, 1, 1,
0.004163665, 1.047918, -0.9249688, 1, 0, 0, 1, 1,
0.009628635, 2.407343, 1.227993, 1, 0, 0, 1, 1,
0.01111153, 0.2160486, -0.3067745, 1, 0, 0, 1, 1,
0.01234557, 0.2554943, 0.9369555, 1, 0, 0, 1, 1,
0.01251353, -1.095128, 4.313822, 0, 0, 0, 1, 1,
0.0126926, -0.2529839, 2.961764, 0, 0, 0, 1, 1,
0.01424707, -0.8708709, 2.305382, 0, 0, 0, 1, 1,
0.01509621, 0.04021145, -0.2557519, 0, 0, 0, 1, 1,
0.02277632, 0.6299968, 0.5583172, 0, 0, 0, 1, 1,
0.02381426, 0.1074758, 0.08106466, 0, 0, 0, 1, 1,
0.02406472, -1.455358, 4.42594, 0, 0, 0, 1, 1,
0.02698151, -1.276747, 1.662799, 1, 1, 1, 1, 1,
0.02800067, 0.2774367, 0.6457092, 1, 1, 1, 1, 1,
0.02835091, -0.6060137, 3.304976, 1, 1, 1, 1, 1,
0.03027057, -1.718283, 2.655891, 1, 1, 1, 1, 1,
0.03335953, 1.549599, -0.1932983, 1, 1, 1, 1, 1,
0.03559572, 1.723265, -0.2267779, 1, 1, 1, 1, 1,
0.03650754, -0.5912613, 0.5536654, 1, 1, 1, 1, 1,
0.0398153, 1.066176, -1.124265, 1, 1, 1, 1, 1,
0.04292864, 1.025869, -0.1325848, 1, 1, 1, 1, 1,
0.04307804, 1.320253, -1.288374, 1, 1, 1, 1, 1,
0.04543348, -0.3138081, 2.578936, 1, 1, 1, 1, 1,
0.04722314, 0.3724096, 1.158722, 1, 1, 1, 1, 1,
0.04848778, -0.5961131, 3.544579, 1, 1, 1, 1, 1,
0.05570217, -1.172433, 4.636546, 1, 1, 1, 1, 1,
0.05697318, -1.459053, 2.921123, 1, 1, 1, 1, 1,
0.06037335, 1.218313, 0.7081279, 0, 0, 1, 1, 1,
0.06074326, 0.810578, 0.6151696, 1, 0, 0, 1, 1,
0.06507953, -0.8456186, 3.241416, 1, 0, 0, 1, 1,
0.0657437, -1.371645, 3.621379, 1, 0, 0, 1, 1,
0.06833788, -0.1548046, 3.110547, 1, 0, 0, 1, 1,
0.06849293, 0.6119846, 0.3294268, 1, 0, 0, 1, 1,
0.06870221, -0.8559127, 1.808563, 0, 0, 0, 1, 1,
0.070434, -1.27089, 3.663117, 0, 0, 0, 1, 1,
0.07214893, 0.06700696, 1.007668, 0, 0, 0, 1, 1,
0.07285696, -1.118366, 1.517594, 0, 0, 0, 1, 1,
0.07403554, 0.3369583, 0.9808002, 0, 0, 0, 1, 1,
0.07789417, 0.8847314, -0.5282483, 0, 0, 0, 1, 1,
0.07930689, 0.1845137, 1.609131, 0, 0, 0, 1, 1,
0.08414262, -0.5781881, 3.582232, 1, 1, 1, 1, 1,
0.0902939, 0.9839828, -0.8562145, 1, 1, 1, 1, 1,
0.09308404, 1.902739, -0.5678443, 1, 1, 1, 1, 1,
0.09462427, -0.6187952, 3.385107, 1, 1, 1, 1, 1,
0.09522565, -1.612918, 2.29152, 1, 1, 1, 1, 1,
0.1015609, -0.7235641, 2.590075, 1, 1, 1, 1, 1,
0.1033993, -1.457117, 3.046859, 1, 1, 1, 1, 1,
0.1051906, 0.6097847, 1.496826, 1, 1, 1, 1, 1,
0.1062412, -0.535409, 0.8672773, 1, 1, 1, 1, 1,
0.1077385, 0.1069247, 0.02301987, 1, 1, 1, 1, 1,
0.1107929, -0.9753579, 2.591455, 1, 1, 1, 1, 1,
0.1110263, -0.2809619, 3.645181, 1, 1, 1, 1, 1,
0.1149696, -0.1909697, 1.953954, 1, 1, 1, 1, 1,
0.1210592, 0.2307781, 0.3499678, 1, 1, 1, 1, 1,
0.1397986, -0.03527755, 2.77798, 1, 1, 1, 1, 1,
0.1430804, -0.5514922, 1.838169, 0, 0, 1, 1, 1,
0.1439906, 0.6772602, 1.841729, 1, 0, 0, 1, 1,
0.1454249, 0.152056, 1.146852, 1, 0, 0, 1, 1,
0.1475785, -0.4563864, 2.72769, 1, 0, 0, 1, 1,
0.1488045, -0.92406, 2.55018, 1, 0, 0, 1, 1,
0.1559624, -0.2593998, 2.608484, 1, 0, 0, 1, 1,
0.1590069, -0.9752519, 2.466123, 0, 0, 0, 1, 1,
0.1624825, -1.198586, 0.6737951, 0, 0, 0, 1, 1,
0.1627615, -0.5751227, 4.703534, 0, 0, 0, 1, 1,
0.1639164, 0.7800573, -0.9177016, 0, 0, 0, 1, 1,
0.1647807, -0.3071454, 3.961085, 0, 0, 0, 1, 1,
0.1649851, -2.067209, 3.865371, 0, 0, 0, 1, 1,
0.1659271, -1.25966, 3.54422, 0, 0, 0, 1, 1,
0.1671724, -0.3101164, 2.215245, 1, 1, 1, 1, 1,
0.1672134, 0.314466, -0.7030388, 1, 1, 1, 1, 1,
0.1699863, 2.053788, 0.4584258, 1, 1, 1, 1, 1,
0.1714865, -1.518125, 1.314306, 1, 1, 1, 1, 1,
0.1724394, 0.7351353, -0.2497368, 1, 1, 1, 1, 1,
0.1775162, -0.04839929, 0.8183961, 1, 1, 1, 1, 1,
0.1784007, 0.9212214, 0.69615, 1, 1, 1, 1, 1,
0.1866396, -1.140972, -0.3069375, 1, 1, 1, 1, 1,
0.1901834, 0.9546499, -1.362586, 1, 1, 1, 1, 1,
0.1904602, 1.128479, -0.6978921, 1, 1, 1, 1, 1,
0.1936382, -1.206493, 2.788483, 1, 1, 1, 1, 1,
0.1949307, 0.4924079, -0.6347241, 1, 1, 1, 1, 1,
0.1960592, 1.396787, -0.7549829, 1, 1, 1, 1, 1,
0.196136, 0.2665323, -0.6937547, 1, 1, 1, 1, 1,
0.1985034, -0.6777846, 3.777487, 1, 1, 1, 1, 1,
0.2050882, -0.3411438, 2.932409, 0, 0, 1, 1, 1,
0.2063945, 0.7996112, -0.8798266, 1, 0, 0, 1, 1,
0.2078525, 0.3486983, -0.6438381, 1, 0, 0, 1, 1,
0.209089, 1.219142, -0.2169805, 1, 0, 0, 1, 1,
0.2123554, 2.074761, 0.06624226, 1, 0, 0, 1, 1,
0.2239805, 0.7208737, -2.666012, 1, 0, 0, 1, 1,
0.2259311, -0.9776137, 2.606853, 0, 0, 0, 1, 1,
0.2277032, 0.281962, 2.141057, 0, 0, 0, 1, 1,
0.230734, 0.2167938, 1.879972, 0, 0, 0, 1, 1,
0.2318827, 0.6379977, -1.476239, 0, 0, 0, 1, 1,
0.2387398, -0.5438901, 3.355629, 0, 0, 0, 1, 1,
0.2399784, 0.07371079, 1.766386, 0, 0, 0, 1, 1,
0.2402899, -2.83102, 4.340893, 0, 0, 0, 1, 1,
0.2425315, 0.5005447, -2.261833, 1, 1, 1, 1, 1,
0.2463967, -0.3174135, 2.262557, 1, 1, 1, 1, 1,
0.2475602, 0.920092, -0.06040139, 1, 1, 1, 1, 1,
0.2498535, 0.1319369, 3.352325, 1, 1, 1, 1, 1,
0.2508505, -0.1739995, 0.6597739, 1, 1, 1, 1, 1,
0.256415, 0.6576549, 0.366153, 1, 1, 1, 1, 1,
0.2600338, 0.4771403, 1.192751, 1, 1, 1, 1, 1,
0.267301, 0.309806, 1.378979, 1, 1, 1, 1, 1,
0.2695762, -1.689231, 3.197503, 1, 1, 1, 1, 1,
0.2738728, 0.6308377, -0.8045382, 1, 1, 1, 1, 1,
0.2759771, -1.854207, 2.910823, 1, 1, 1, 1, 1,
0.2815505, 1.140698, 0.1378181, 1, 1, 1, 1, 1,
0.284003, 0.7453115, -1.112738, 1, 1, 1, 1, 1,
0.2844165, 0.03289156, 3.3898, 1, 1, 1, 1, 1,
0.2852579, 0.9537787, 0.2762216, 1, 1, 1, 1, 1,
0.2858012, 1.027113, 1.377722, 0, 0, 1, 1, 1,
0.2871938, -2.276012, 0.9262462, 1, 0, 0, 1, 1,
0.2873576, -0.07718274, 1.898252, 1, 0, 0, 1, 1,
0.2896149, -1.044176, 1.385094, 1, 0, 0, 1, 1,
0.2923326, 1.611329, 0.1568419, 1, 0, 0, 1, 1,
0.2926775, 0.8378838, -0.030427, 1, 0, 0, 1, 1,
0.2954704, -0.08552603, 2.534495, 0, 0, 0, 1, 1,
0.3021381, -0.477872, 2.000899, 0, 0, 0, 1, 1,
0.3027723, 0.5399321, -0.1683737, 0, 0, 0, 1, 1,
0.3036533, 1.055622, -0.1360083, 0, 0, 0, 1, 1,
0.3116221, 0.7861492, 0.004769978, 0, 0, 0, 1, 1,
0.3140085, -1.254413, 4.27762, 0, 0, 0, 1, 1,
0.318408, 1.385627, -0.9247339, 0, 0, 0, 1, 1,
0.3189389, 0.006530049, 1.051211, 1, 1, 1, 1, 1,
0.3233394, 0.6420026, -0.5621613, 1, 1, 1, 1, 1,
0.3251799, 0.2682694, 2.844466, 1, 1, 1, 1, 1,
0.3307539, -0.4609373, 3.215072, 1, 1, 1, 1, 1,
0.3364821, 0.7561022, -0.5905318, 1, 1, 1, 1, 1,
0.339916, -0.1206329, 2.096668, 1, 1, 1, 1, 1,
0.340876, -1.623502, 3.010014, 1, 1, 1, 1, 1,
0.3412614, 0.2189813, 0.9633738, 1, 1, 1, 1, 1,
0.3425879, -0.1185961, 1.870455, 1, 1, 1, 1, 1,
0.3492547, -1.221341, -0.1969679, 1, 1, 1, 1, 1,
0.3531608, 1.389097, -1.973121, 1, 1, 1, 1, 1,
0.3549889, -1.741545, 3.556172, 1, 1, 1, 1, 1,
0.3590731, 0.670735, 0.4470772, 1, 1, 1, 1, 1,
0.3605888, -0.7392713, 2.302254, 1, 1, 1, 1, 1,
0.3647264, 0.3731884, 1.529381, 1, 1, 1, 1, 1,
0.3682317, -0.4532304, 3.18915, 0, 0, 1, 1, 1,
0.3728625, -0.1603957, 1.112277, 1, 0, 0, 1, 1,
0.3764473, -0.4342632, 3.044389, 1, 0, 0, 1, 1,
0.3866542, -0.3866326, 3.451131, 1, 0, 0, 1, 1,
0.3887152, -0.6973259, 3.248528, 1, 0, 0, 1, 1,
0.3926372, -1.579149, 3.153321, 1, 0, 0, 1, 1,
0.3974103, -0.5068108, 2.114135, 0, 0, 0, 1, 1,
0.4000711, -0.1015064, 1.441018, 0, 0, 0, 1, 1,
0.4040006, -0.2266998, 1.859224, 0, 0, 0, 1, 1,
0.4066811, 0.191206, 0.7783602, 0, 0, 0, 1, 1,
0.407149, -0.6498133, 1.619173, 0, 0, 0, 1, 1,
0.4149379, -1.51103, 2.524691, 0, 0, 0, 1, 1,
0.4172251, -1.713281, 1.995502, 0, 0, 0, 1, 1,
0.419073, 0.4700957, 2.427792, 1, 1, 1, 1, 1,
0.4191433, 0.5234762, -0.4401703, 1, 1, 1, 1, 1,
0.4264336, 1.755512, -0.3382906, 1, 1, 1, 1, 1,
0.4305856, -0.6163105, 2.416041, 1, 1, 1, 1, 1,
0.4315017, -0.4816136, 2.691547, 1, 1, 1, 1, 1,
0.4360567, 0.2273757, 1.542912, 1, 1, 1, 1, 1,
0.4390774, 0.5688688, -0.3956299, 1, 1, 1, 1, 1,
0.439773, -1.029792, 1.883975, 1, 1, 1, 1, 1,
0.4413627, -0.4119036, 2.312864, 1, 1, 1, 1, 1,
0.4418126, 1.06545, 1.716993, 1, 1, 1, 1, 1,
0.4422337, 0.2355448, 1.271414, 1, 1, 1, 1, 1,
0.4469818, 0.3474863, 2.318637, 1, 1, 1, 1, 1,
0.4496901, -0.1632936, 2.167418, 1, 1, 1, 1, 1,
0.449788, 2.257883, -0.8537253, 1, 1, 1, 1, 1,
0.4577664, -0.06634434, 2.869133, 1, 1, 1, 1, 1,
0.4587319, 0.3381362, 1.923662, 0, 0, 1, 1, 1,
0.4592214, 0.631578, 0.3539204, 1, 0, 0, 1, 1,
0.4629031, -0.4644076, 4.237817, 1, 0, 0, 1, 1,
0.4666338, -1.173234, 2.61786, 1, 0, 0, 1, 1,
0.4727255, -0.4935973, 1.698254, 1, 0, 0, 1, 1,
0.4780896, -1.363548, 3.186668, 1, 0, 0, 1, 1,
0.4785036, 1.753974, 1.484598, 0, 0, 0, 1, 1,
0.4794779, 1.181593, 1.252273, 0, 0, 0, 1, 1,
0.4818254, -1.53012, 3.400923, 0, 0, 0, 1, 1,
0.4849618, -1.256676, 2.617062, 0, 0, 0, 1, 1,
0.4887264, 1.237365, -0.4149231, 0, 0, 0, 1, 1,
0.4891512, -0.1146359, 1.65236, 0, 0, 0, 1, 1,
0.4917841, -1.217575, 4.518345, 0, 0, 0, 1, 1,
0.4939215, -1.366442, 2.64879, 1, 1, 1, 1, 1,
0.4954479, 1.374184, 0.1491057, 1, 1, 1, 1, 1,
0.4976095, 1.73897, -0.3925631, 1, 1, 1, 1, 1,
0.4999764, 1.785565, 0.6297761, 1, 1, 1, 1, 1,
0.5040285, 0.4161308, 1.923164, 1, 1, 1, 1, 1,
0.5056163, -0.5302889, 2.433809, 1, 1, 1, 1, 1,
0.5082659, 1.347816, -0.302754, 1, 1, 1, 1, 1,
0.5092854, -1.463248, 2.12472, 1, 1, 1, 1, 1,
0.5135726, 0.5023494, 1.526275, 1, 1, 1, 1, 1,
0.5155441, 0.01245011, 1.589148, 1, 1, 1, 1, 1,
0.5169122, 1.408826, -0.1307934, 1, 1, 1, 1, 1,
0.5245462, 0.4439242, 1.256738, 1, 1, 1, 1, 1,
0.5289571, 0.3016903, 2.012761, 1, 1, 1, 1, 1,
0.5311754, -0.3663809, 3.798422, 1, 1, 1, 1, 1,
0.5368047, -0.6806259, 1.945067, 1, 1, 1, 1, 1,
0.5402104, 0.0899581, 0.6393221, 0, 0, 1, 1, 1,
0.5411109, 2.567729, 0.9164203, 1, 0, 0, 1, 1,
0.5450706, 0.8266861, 0.3842523, 1, 0, 0, 1, 1,
0.5463657, 0.8910044, 0.04250137, 1, 0, 0, 1, 1,
0.5470514, -1.435337, 2.528134, 1, 0, 0, 1, 1,
0.5476207, 0.1391521, -0.1432508, 1, 0, 0, 1, 1,
0.5495511, -1.743591, 1.712994, 0, 0, 0, 1, 1,
0.5522941, -0.6978687, 2.432362, 0, 0, 0, 1, 1,
0.556582, 0.308071, 2.305883, 0, 0, 0, 1, 1,
0.5631774, -0.3771155, 1.982357, 0, 0, 0, 1, 1,
0.5665172, -0.123709, 1.820683, 0, 0, 0, 1, 1,
0.5666167, 0.4564122, 1.695449, 0, 0, 0, 1, 1,
0.5691539, 0.7621545, 0.4912896, 0, 0, 0, 1, 1,
0.5765106, 0.3822687, -0.8480538, 1, 1, 1, 1, 1,
0.5766705, 0.4288332, -0.7123633, 1, 1, 1, 1, 1,
0.5861496, 0.5113256, -0.1678973, 1, 1, 1, 1, 1,
0.5865045, -0.3202925, 0.3021047, 1, 1, 1, 1, 1,
0.5879206, 0.5664328, 0.6794342, 1, 1, 1, 1, 1,
0.5881192, 0.08862258, 1.561424, 1, 1, 1, 1, 1,
0.5930762, -0.7661986, 1.664963, 1, 1, 1, 1, 1,
0.5954974, 1.970428, 0.456986, 1, 1, 1, 1, 1,
0.6042383, 0.7192688, -0.4748473, 1, 1, 1, 1, 1,
0.6047131, -0.9389291, 1.87677, 1, 1, 1, 1, 1,
0.6072488, -0.3239166, 1.684149, 1, 1, 1, 1, 1,
0.6086908, -0.8099911, 3.05447, 1, 1, 1, 1, 1,
0.6107928, -1.373274, 3.672284, 1, 1, 1, 1, 1,
0.6110805, 0.5964503, 1.517845, 1, 1, 1, 1, 1,
0.6134965, 0.4100496, 0.784183, 1, 1, 1, 1, 1,
0.6169646, -0.5496158, 1.418906, 0, 0, 1, 1, 1,
0.6202894, 1.298281, 0.2726907, 1, 0, 0, 1, 1,
0.6235027, -1.898623, 3.337201, 1, 0, 0, 1, 1,
0.6242476, -0.5765825, 2.016781, 1, 0, 0, 1, 1,
0.6248943, 0.9683902, -0.5678667, 1, 0, 0, 1, 1,
0.6287056, -0.9764076, 3.665659, 1, 0, 0, 1, 1,
0.6301764, -0.4428967, 3.432293, 0, 0, 0, 1, 1,
0.6318229, -0.8176354, 2.259143, 0, 0, 0, 1, 1,
0.6344944, -1.377303, 2.837561, 0, 0, 0, 1, 1,
0.6348456, -0.03429458, 3.115784, 0, 0, 0, 1, 1,
0.6453438, -0.4766442, 2.019773, 0, 0, 0, 1, 1,
0.6468558, 1.096692, 1.790986, 0, 0, 0, 1, 1,
0.6472362, 1.361767, -0.3892146, 0, 0, 0, 1, 1,
0.6551906, -1.077656, 3.551365, 1, 1, 1, 1, 1,
0.6587033, 2.118132, 0.713764, 1, 1, 1, 1, 1,
0.6603473, -0.9580572, 2.028206, 1, 1, 1, 1, 1,
0.6620067, 0.4658189, 1.560159, 1, 1, 1, 1, 1,
0.6648928, 0.05432139, 2.395568, 1, 1, 1, 1, 1,
0.6651322, 0.2900828, 1.476352, 1, 1, 1, 1, 1,
0.6681391, -0.2586254, 0.5564181, 1, 1, 1, 1, 1,
0.6720089, 0.2560971, 0.7411828, 1, 1, 1, 1, 1,
0.6729489, 0.6441369, 0.0006970231, 1, 1, 1, 1, 1,
0.673584, 0.2431758, 2.098826, 1, 1, 1, 1, 1,
0.6752669, 1.429246, 1.232673, 1, 1, 1, 1, 1,
0.6785365, -1.661095, 3.691297, 1, 1, 1, 1, 1,
0.6790719, 1.145305, -0.3114605, 1, 1, 1, 1, 1,
0.6798241, -0.6742372, 1.55235, 1, 1, 1, 1, 1,
0.6822684, -0.4370142, 0.5022079, 1, 1, 1, 1, 1,
0.6854666, -1.774887, 1.442682, 0, 0, 1, 1, 1,
0.6890804, -0.541815, 1.575937, 1, 0, 0, 1, 1,
0.6944384, -0.6323736, 3.508496, 1, 0, 0, 1, 1,
0.6947305, -0.07715615, 1.861352, 1, 0, 0, 1, 1,
0.6954185, -0.237432, 1.465636, 1, 0, 0, 1, 1,
0.6968681, 0.9807376, 0.883277, 1, 0, 0, 1, 1,
0.7038891, 1.899038, -0.2266917, 0, 0, 0, 1, 1,
0.7046214, 1.145072, 0.1003482, 0, 0, 0, 1, 1,
0.7167562, -0.6814069, 2.208103, 0, 0, 0, 1, 1,
0.7245098, 0.5094559, 0.8299892, 0, 0, 0, 1, 1,
0.7250714, 0.6880758, 0.2847814, 0, 0, 0, 1, 1,
0.7251492, -1.883819, 2.485746, 0, 0, 0, 1, 1,
0.7323347, -1.989508, 1.916715, 0, 0, 0, 1, 1,
0.7375789, -1.058827, 3.299223, 1, 1, 1, 1, 1,
0.7381278, 0.046107, 0.793951, 1, 1, 1, 1, 1,
0.7392738, -0.4102427, 1.881734, 1, 1, 1, 1, 1,
0.7476631, -1.648776, 1.900226, 1, 1, 1, 1, 1,
0.7479513, -0.08442714, 1.253203, 1, 1, 1, 1, 1,
0.7622885, 0.9824458, 0.4586774, 1, 1, 1, 1, 1,
0.7625658, 0.08083185, 1.425492, 1, 1, 1, 1, 1,
0.7631146, 0.2579752, 0.3286455, 1, 1, 1, 1, 1,
0.7637207, 1.159876, 0.6740407, 1, 1, 1, 1, 1,
0.7643057, -0.4488844, 0.9555519, 1, 1, 1, 1, 1,
0.7660294, -1.718446, 4.049541, 1, 1, 1, 1, 1,
0.7706468, -0.05532407, 1.800434, 1, 1, 1, 1, 1,
0.7783915, 0.01668085, 2.547657, 1, 1, 1, 1, 1,
0.7786611, 2.111, 2.317997, 1, 1, 1, 1, 1,
0.7838712, -0.7367483, 1.577485, 1, 1, 1, 1, 1,
0.7845621, -0.3377911, 2.111579, 0, 0, 1, 1, 1,
0.7939882, 1.704554, -0.8909064, 1, 0, 0, 1, 1,
0.7966123, 0.6270148, 1.014433, 1, 0, 0, 1, 1,
0.7982208, -0.2325523, 1.639008, 1, 0, 0, 1, 1,
0.7997059, 0.2123185, 2.683824, 1, 0, 0, 1, 1,
0.8053764, 0.01598806, 1.134496, 1, 0, 0, 1, 1,
0.805436, 1.71106, 1.126177, 0, 0, 0, 1, 1,
0.8070062, -1.138851, 2.039449, 0, 0, 0, 1, 1,
0.8134873, 0.3763331, -0.9833769, 0, 0, 0, 1, 1,
0.8203818, 1.612099, 1.385388, 0, 0, 0, 1, 1,
0.8221818, 0.4894227, 1.319219, 0, 0, 0, 1, 1,
0.8232166, 0.2092192, 1.699208, 0, 0, 0, 1, 1,
0.8250844, -0.5545385, 1.79789, 0, 0, 0, 1, 1,
0.8316751, 1.503925, 1.088595, 1, 1, 1, 1, 1,
0.8351023, 0.4100148, 1.373235, 1, 1, 1, 1, 1,
0.8492879, 0.7633888, 0.4340696, 1, 1, 1, 1, 1,
0.8517726, 0.9018631, -0.06371732, 1, 1, 1, 1, 1,
0.8570719, -1.157344, 1.626749, 1, 1, 1, 1, 1,
0.8641646, -0.6375902, 2.239295, 1, 1, 1, 1, 1,
0.8673317, -0.1032632, 1.788025, 1, 1, 1, 1, 1,
0.8677806, -0.8102967, 3.333061, 1, 1, 1, 1, 1,
0.867862, -1.468012, 1.771265, 1, 1, 1, 1, 1,
0.8680643, 1.100744, 1.540452, 1, 1, 1, 1, 1,
0.8703933, 0.5492064, 2.480106, 1, 1, 1, 1, 1,
0.8753323, 1.008786, 0.5210649, 1, 1, 1, 1, 1,
0.8769572, 0.0278235, -1.117749, 1, 1, 1, 1, 1,
0.8785755, -0.2246923, 2.527287, 1, 1, 1, 1, 1,
0.8805788, 1.930226, 1.913644, 1, 1, 1, 1, 1,
0.8822359, -0.4781886, 1.109111, 0, 0, 1, 1, 1,
0.8840011, 0.02310325, 2.754772, 1, 0, 0, 1, 1,
0.885981, 2.081957, 0.5020139, 1, 0, 0, 1, 1,
0.8899434, -0.5357967, 0.2351272, 1, 0, 0, 1, 1,
0.898804, -0.1474864, 2.182836, 1, 0, 0, 1, 1,
0.9073886, 1.774984, -0.2099415, 1, 0, 0, 1, 1,
0.9109338, -0.3671058, 1.274323, 0, 0, 0, 1, 1,
0.9147784, -0.4346696, 2.56869, 0, 0, 0, 1, 1,
0.9163569, 0.4171164, 2.180673, 0, 0, 0, 1, 1,
0.916733, 1.524905, 1.026823, 0, 0, 0, 1, 1,
0.9169624, -1.648111, 2.830803, 0, 0, 0, 1, 1,
0.9310489, -1.237124, 1.497736, 0, 0, 0, 1, 1,
0.9356598, -0.589107, 1.3994, 0, 0, 0, 1, 1,
0.9362854, -1.507666, 3.143439, 1, 1, 1, 1, 1,
0.9367961, 1.00402, 0.05653018, 1, 1, 1, 1, 1,
0.9381019, 0.3131905, 1.027987, 1, 1, 1, 1, 1,
0.9384955, 1.532019, 1.045886, 1, 1, 1, 1, 1,
0.9461573, -0.9066802, 3.345415, 1, 1, 1, 1, 1,
0.9496694, -1.193792, 2.551638, 1, 1, 1, 1, 1,
0.9559906, 0.103611, 1.837371, 1, 1, 1, 1, 1,
0.9590283, -2.24384, 2.309729, 1, 1, 1, 1, 1,
0.9645207, 0.7222154, 1.615131, 1, 1, 1, 1, 1,
0.9660509, 0.7761458, 2.03655, 1, 1, 1, 1, 1,
0.9682553, -1.318708, 3.421815, 1, 1, 1, 1, 1,
0.9690732, -0.8024369, 2.459179, 1, 1, 1, 1, 1,
0.9699406, 0.5534346, 0.8343909, 1, 1, 1, 1, 1,
0.9722193, 0.6200078, 0.2505167, 1, 1, 1, 1, 1,
0.9774449, 0.08463913, 2.207965, 1, 1, 1, 1, 1,
0.9792126, 1.510736, 0.2484275, 0, 0, 1, 1, 1,
0.982199, -0.304087, 2.716106, 1, 0, 0, 1, 1,
0.9847986, 0.3165466, -0.6631976, 1, 0, 0, 1, 1,
0.9870591, -0.263644, 2.410873, 1, 0, 0, 1, 1,
1.003349, -1.224131, 4.571516, 1, 0, 0, 1, 1,
1.007593, 1.80851, 1.372743, 1, 0, 0, 1, 1,
1.009533, -0.4485826, 2.481583, 0, 0, 0, 1, 1,
1.011707, 0.4028747, 0.915176, 0, 0, 0, 1, 1,
1.013442, -0.06983054, 0.9720656, 0, 0, 0, 1, 1,
1.018436, -0.4882522, 0.2186378, 0, 0, 0, 1, 1,
1.032294, -0.3049183, 1.319323, 0, 0, 0, 1, 1,
1.038514, 0.4307694, 2.440607, 0, 0, 0, 1, 1,
1.044351, 1.013777, 3.113065, 0, 0, 0, 1, 1,
1.04572, -1.108324, 1.626015, 1, 1, 1, 1, 1,
1.060534, -0.3386807, 1.537767, 1, 1, 1, 1, 1,
1.060977, 0.5477526, 0.8113924, 1, 1, 1, 1, 1,
1.068841, 1.146531, 0.2351034, 1, 1, 1, 1, 1,
1.075491, -0.8690875, 2.632261, 1, 1, 1, 1, 1,
1.075964, 0.3889261, 1.477893, 1, 1, 1, 1, 1,
1.088081, 1.913273, 1.99054, 1, 1, 1, 1, 1,
1.098384, -0.04727855, 1.549706, 1, 1, 1, 1, 1,
1.100266, 0.07994435, 0.8294879, 1, 1, 1, 1, 1,
1.104002, -1.197695, 1.499727, 1, 1, 1, 1, 1,
1.108794, 0.72487, 0.1501031, 1, 1, 1, 1, 1,
1.111381, 1.951184, -0.2667789, 1, 1, 1, 1, 1,
1.115127, 1.652355, 1.348594, 1, 1, 1, 1, 1,
1.123547, 1.068702, 0.781145, 1, 1, 1, 1, 1,
1.136606, 1.778598, 0.1650718, 1, 1, 1, 1, 1,
1.136638, 0.1076243, 0.3150802, 0, 0, 1, 1, 1,
1.141119, 1.280131, 0.4226081, 1, 0, 0, 1, 1,
1.148591, 0.008696756, 2.538965, 1, 0, 0, 1, 1,
1.149769, 0.1347384, 1.749234, 1, 0, 0, 1, 1,
1.154513, 0.7135369, 1.335042, 1, 0, 0, 1, 1,
1.157139, -2.324832, 4.181674, 1, 0, 0, 1, 1,
1.157392, -0.8291661, 1.07744, 0, 0, 0, 1, 1,
1.159704, 0.2079314, 1.668399, 0, 0, 0, 1, 1,
1.165915, 0.7872234, 2.170912, 0, 0, 0, 1, 1,
1.167416, 1.060052, 1.18876, 0, 0, 0, 1, 1,
1.174908, -0.7180297, 1.849126, 0, 0, 0, 1, 1,
1.175814, -0.4539047, 3.556752, 0, 0, 0, 1, 1,
1.177032, 0.09272724, 2.714679, 0, 0, 0, 1, 1,
1.180924, 0.06456751, 0.3746241, 1, 1, 1, 1, 1,
1.182089, -1.605142, 3.121089, 1, 1, 1, 1, 1,
1.185963, -0.3212298, 1.656966, 1, 1, 1, 1, 1,
1.190756, 0.4662505, 0.1453021, 1, 1, 1, 1, 1,
1.191667, 0.254984, 0.2861482, 1, 1, 1, 1, 1,
1.193782, -0.2431741, 3.473693, 1, 1, 1, 1, 1,
1.206176, -1.386385, 1.698959, 1, 1, 1, 1, 1,
1.226387, 0.0912838, 0.5700585, 1, 1, 1, 1, 1,
1.227649, -0.7832543, 1.806071, 1, 1, 1, 1, 1,
1.232657, -0.754581, 0.7238068, 1, 1, 1, 1, 1,
1.242491, -0.2327776, 1.401986, 1, 1, 1, 1, 1,
1.243283, -0.5014269, 3.244719, 1, 1, 1, 1, 1,
1.245312, -0.9025725, 3.023147, 1, 1, 1, 1, 1,
1.251619, 0.8740425, 2.432194, 1, 1, 1, 1, 1,
1.252407, -0.6887125, 0.5675453, 1, 1, 1, 1, 1,
1.258278, 0.06010048, 1.121062, 0, 0, 1, 1, 1,
1.259999, -1.680994, 2.845515, 1, 0, 0, 1, 1,
1.262593, -1.420638, 1.89215, 1, 0, 0, 1, 1,
1.266082, 0.5871751, 0.946766, 1, 0, 0, 1, 1,
1.266543, -0.9231641, 3.137303, 1, 0, 0, 1, 1,
1.285429, -0.9813176, 0.5794749, 1, 0, 0, 1, 1,
1.286644, 0.8291522, 1.341691, 0, 0, 0, 1, 1,
1.288872, -0.7231205, 0.6463779, 0, 0, 0, 1, 1,
1.299168, -0.2662525, 2.312442, 0, 0, 0, 1, 1,
1.301468, 0.9192348, 2.485548, 0, 0, 0, 1, 1,
1.319978, 0.3115747, 0.9042771, 0, 0, 0, 1, 1,
1.322441, -0.3719133, 1.205495, 0, 0, 0, 1, 1,
1.323279, 1.563922, 0.007190282, 0, 0, 0, 1, 1,
1.329839, 0.9252627, 1.672574, 1, 1, 1, 1, 1,
1.336193, 0.1982977, 1.133738, 1, 1, 1, 1, 1,
1.336541, -1.960109, 1.605722, 1, 1, 1, 1, 1,
1.341782, -1.18436, 1.691458, 1, 1, 1, 1, 1,
1.360926, -0.5527607, 2.34155, 1, 1, 1, 1, 1,
1.363372, 1.306418, 1.119949, 1, 1, 1, 1, 1,
1.379974, -1.004745, 3.323558, 1, 1, 1, 1, 1,
1.380029, 0.5321152, 0.7027217, 1, 1, 1, 1, 1,
1.380129, -0.4004033, 0.1979762, 1, 1, 1, 1, 1,
1.380862, 0.06430651, 0.4571815, 1, 1, 1, 1, 1,
1.381467, 0.2313433, 2.836069, 1, 1, 1, 1, 1,
1.392139, 0.3119735, 1.262829, 1, 1, 1, 1, 1,
1.396556, -1.909729, 2.370032, 1, 1, 1, 1, 1,
1.398566, -0.4062831, 1.226252, 1, 1, 1, 1, 1,
1.404855, 0.3568885, 1.987943, 1, 1, 1, 1, 1,
1.407168, 0.1561944, -0.1080966, 0, 0, 1, 1, 1,
1.408383, -0.5398791, 0.2273058, 1, 0, 0, 1, 1,
1.418747, 0.05596748, 2.436725, 1, 0, 0, 1, 1,
1.418983, 0.2657767, 0.89438, 1, 0, 0, 1, 1,
1.453016, -0.03792712, 2.276327, 1, 0, 0, 1, 1,
1.462676, 1.137323, 0.1306155, 1, 0, 0, 1, 1,
1.485218, 0.2204611, 1.029129, 0, 0, 0, 1, 1,
1.507493, -1.110123, 1.36055, 0, 0, 0, 1, 1,
1.508236, 1.632232, -0.09370224, 0, 0, 0, 1, 1,
1.510167, -1.447935, 0.6583788, 0, 0, 0, 1, 1,
1.530656, 1.056053, -0.2205806, 0, 0, 0, 1, 1,
1.544282, -1.449521, 0.4723279, 0, 0, 0, 1, 1,
1.560712, -1.187736, 3.447349, 0, 0, 0, 1, 1,
1.570704, -0.5429994, 2.182458, 1, 1, 1, 1, 1,
1.579924, -0.3545551, 2.430493, 1, 1, 1, 1, 1,
1.581184, -0.2336608, 2.04871, 1, 1, 1, 1, 1,
1.584067, 1.808382, 0.1002931, 1, 1, 1, 1, 1,
1.589819, 0.4040141, 0.8194991, 1, 1, 1, 1, 1,
1.591486, -0.1899981, 4.010519, 1, 1, 1, 1, 1,
1.600104, 1.107073, 2.197255, 1, 1, 1, 1, 1,
1.617376, -0.280009, 1.988391, 1, 1, 1, 1, 1,
1.617873, -1.117896, 1.010454, 1, 1, 1, 1, 1,
1.619306, 2.350571, -0.9907286, 1, 1, 1, 1, 1,
1.619793, 0.8448582, 1.881872, 1, 1, 1, 1, 1,
1.647135, 1.395205, 2.752561, 1, 1, 1, 1, 1,
1.647239, 0.9986577, 0.9247758, 1, 1, 1, 1, 1,
1.653049, -1.638525, 1.027941, 1, 1, 1, 1, 1,
1.676267, 1.416456, 0.154164, 1, 1, 1, 1, 1,
1.678094, -0.06580329, 3.690374, 0, 0, 1, 1, 1,
1.709021, 0.896533, 2.344678, 1, 0, 0, 1, 1,
1.71823, 0.147563, 2.211547, 1, 0, 0, 1, 1,
1.719432, 1.637311, -0.3484214, 1, 0, 0, 1, 1,
1.726495, -0.1043613, 1.852236, 1, 0, 0, 1, 1,
1.75354, 0.6244097, 1.300162, 1, 0, 0, 1, 1,
1.755741, 1.063158, 0.3045828, 0, 0, 0, 1, 1,
1.761283, -0.8913617, 2.713689, 0, 0, 0, 1, 1,
1.772758, -0.4763544, 3.279295, 0, 0, 0, 1, 1,
1.780769, -0.829438, 3.300853, 0, 0, 0, 1, 1,
1.782913, -0.8248574, 3.267228, 0, 0, 0, 1, 1,
1.785213, -1.070167, 2.039515, 0, 0, 0, 1, 1,
1.791665, 0.7745796, 0.185554, 0, 0, 0, 1, 1,
1.806778, -0.7761707, 3.064806, 1, 1, 1, 1, 1,
1.833566, -1.163454, 2.330871, 1, 1, 1, 1, 1,
1.836074, -0.7742242, 1.958254, 1, 1, 1, 1, 1,
1.841095, 1.239529, 0.8996927, 1, 1, 1, 1, 1,
1.858289, -0.7634267, 1.508786, 1, 1, 1, 1, 1,
1.865346, -0.09979638, 1.167439, 1, 1, 1, 1, 1,
1.952473, -0.163676, 1.212443, 1, 1, 1, 1, 1,
1.953657, 1.217569, 2.862357, 1, 1, 1, 1, 1,
1.979037, -0.4970211, 2.127301, 1, 1, 1, 1, 1,
1.99373, 0.5575638, -0.3727225, 1, 1, 1, 1, 1,
2.00184, -0.8210579, 3.107424, 1, 1, 1, 1, 1,
2.008706, -1.118369, 0.7453405, 1, 1, 1, 1, 1,
2.05272, 1.086806, 0.0747831, 1, 1, 1, 1, 1,
2.068095, 0.1934114, 2.528138, 1, 1, 1, 1, 1,
2.099373, -1.024657, 1.825073, 1, 1, 1, 1, 1,
2.136789, -0.7480181, 2.581338, 0, 0, 1, 1, 1,
2.149581, 1.915902, 3.176516, 1, 0, 0, 1, 1,
2.151336, 0.7957223, 1.393501, 1, 0, 0, 1, 1,
2.228565, 0.9783822, 0.9277043, 1, 0, 0, 1, 1,
2.249262, -0.9379542, 3.751311, 1, 0, 0, 1, 1,
2.269644, 1.574974, 1.421752, 1, 0, 0, 1, 1,
2.291219, 0.2546894, 0.8375815, 0, 0, 0, 1, 1,
2.308298, 0.4773193, 0.3828156, 0, 0, 0, 1, 1,
2.329871, -1.474743, 0.9911758, 0, 0, 0, 1, 1,
2.343704, 1.41481, -0.005106891, 0, 0, 0, 1, 1,
2.353917, -1.306072, 2.582849, 0, 0, 0, 1, 1,
2.445715, 1.068109, 2.761926, 0, 0, 0, 1, 1,
2.483687, 0.09876119, 0.455724, 0, 0, 0, 1, 1,
2.498863, -0.1713966, 1.073053, 1, 1, 1, 1, 1,
2.535605, -0.674771, 2.096285, 1, 1, 1, 1, 1,
2.608864, -0.4361512, 2.0244, 1, 1, 1, 1, 1,
2.77014, 0.02067584, 2.669363, 1, 1, 1, 1, 1,
2.830813, 0.270762, -1.11672, 1, 1, 1, 1, 1,
2.907389, -0.50984, 1.177829, 1, 1, 1, 1, 1,
3.380252, 0.9441444, 0.635919, 1, 1, 1, 1, 1
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
var radius = 9.585331;
var distance = 33.66807;
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
mvMatrix.translate( 0.4413686, 0.1994396, 0.2470934 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.66807);
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
