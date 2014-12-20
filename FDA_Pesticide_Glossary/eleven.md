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
-4.173923, 2.169789, -0.3263354, 1, 0, 0, 1,
-3.60301, 0.1920218, -0.8322986, 1, 0.007843138, 0, 1,
-3.524976, -2.161011, -1.847563, 1, 0.01176471, 0, 1,
-3.079969, 0.0115536, -0.09642579, 1, 0.01960784, 0, 1,
-2.790793, 0.4026541, -1.636849, 1, 0.02352941, 0, 1,
-2.729844, 0.7847706, -2.658204, 1, 0.03137255, 0, 1,
-2.680053, -0.427858, -1.6343, 1, 0.03529412, 0, 1,
-2.672434, 1.600104, -1.432125, 1, 0.04313726, 0, 1,
-2.652086, -0.2426483, -3.491685, 1, 0.04705882, 0, 1,
-2.61115, 0.7378703, 1.046906, 1, 0.05490196, 0, 1,
-2.596564, -2.400549, -1.584282, 1, 0.05882353, 0, 1,
-2.485654, -0.1175714, -2.539521, 1, 0.06666667, 0, 1,
-2.462447, 1.990472, -1.415458, 1, 0.07058824, 0, 1,
-2.458381, 0.831028, -0.9350796, 1, 0.07843138, 0, 1,
-2.411493, 0.4608216, -1.785157, 1, 0.08235294, 0, 1,
-2.384273, 1.98455, -0.3275603, 1, 0.09019608, 0, 1,
-2.352062, 0.9940751, -0.3828352, 1, 0.09411765, 0, 1,
-2.298724, -0.4890405, 0.06171001, 1, 0.1019608, 0, 1,
-2.238348, -0.3160757, -2.191592, 1, 0.1098039, 0, 1,
-2.229035, 0.02358868, -1.420682, 1, 0.1137255, 0, 1,
-2.227836, -0.7592851, -2.445656, 1, 0.1215686, 0, 1,
-2.195199, -1.199219, -2.283003, 1, 0.1254902, 0, 1,
-2.18224, 0.9599014, -2.340612, 1, 0.1333333, 0, 1,
-2.140777, -0.7805364, -1.882001, 1, 0.1372549, 0, 1,
-2.113061, -0.455383, 0.2800352, 1, 0.145098, 0, 1,
-2.098724, 0.4356961, -2.586207, 1, 0.1490196, 0, 1,
-2.077308, 0.9583104, -1.413631, 1, 0.1568628, 0, 1,
-2.036993, 1.243745, 0.07876743, 1, 0.1607843, 0, 1,
-2.01647, -1.826076, -1.180894, 1, 0.1686275, 0, 1,
-1.992473, 0.2058358, -2.205368, 1, 0.172549, 0, 1,
-1.990646, -0.5474743, -2.076768, 1, 0.1803922, 0, 1,
-1.988098, 0.04261543, -2.572929, 1, 0.1843137, 0, 1,
-1.965152, -0.5555242, -1.49919, 1, 0.1921569, 0, 1,
-1.963461, 0.1575427, -0.321599, 1, 0.1960784, 0, 1,
-1.955721, 0.2911286, -1.453125, 1, 0.2039216, 0, 1,
-1.954234, 0.2379969, -1.528244, 1, 0.2117647, 0, 1,
-1.941738, 1.47911, -2.087356, 1, 0.2156863, 0, 1,
-1.931546, -0.934583, -0.8724065, 1, 0.2235294, 0, 1,
-1.903455, -0.6227041, -1.282953, 1, 0.227451, 0, 1,
-1.884973, 0.2025141, -2.034662, 1, 0.2352941, 0, 1,
-1.884664, 1.406415, -0.9798414, 1, 0.2392157, 0, 1,
-1.878814, -0.3141864, -2.153314, 1, 0.2470588, 0, 1,
-1.875078, -1.023529, -1.876017, 1, 0.2509804, 0, 1,
-1.847484, 1.935758, -0.5830734, 1, 0.2588235, 0, 1,
-1.832076, -2.087425, -2.103762, 1, 0.2627451, 0, 1,
-1.830094, 0.7873318, -1.251958, 1, 0.2705882, 0, 1,
-1.829867, 0.9527526, -0.3682778, 1, 0.2745098, 0, 1,
-1.821535, -1.577816, -4.547905, 1, 0.282353, 0, 1,
-1.817, 1.883708, 0.9667706, 1, 0.2862745, 0, 1,
-1.772437, 0.4552757, -0.1491816, 1, 0.2941177, 0, 1,
-1.769102, -1.472063, -1.162036, 1, 0.3019608, 0, 1,
-1.76873, -1.466614, -2.618428, 1, 0.3058824, 0, 1,
-1.764082, -0.7616056, -3.738837, 1, 0.3137255, 0, 1,
-1.748572, -1.317476, -3.071207, 1, 0.3176471, 0, 1,
-1.723416, -0.3036664, -2.384849, 1, 0.3254902, 0, 1,
-1.709901, -0.8453982, -0.6623115, 1, 0.3294118, 0, 1,
-1.70716, -0.1191033, -1.254582, 1, 0.3372549, 0, 1,
-1.691912, 1.579921, 1.151444, 1, 0.3411765, 0, 1,
-1.688605, 1.585914, 0.274997, 1, 0.3490196, 0, 1,
-1.684439, 1.358536, -1.344169, 1, 0.3529412, 0, 1,
-1.669097, -0.4821342, -1.383299, 1, 0.3607843, 0, 1,
-1.663617, -1.680419, -2.397471, 1, 0.3647059, 0, 1,
-1.655576, -0.02591584, 0.7414395, 1, 0.372549, 0, 1,
-1.652084, 1.270312, -1.472881, 1, 0.3764706, 0, 1,
-1.650762, 0.9331775, -2.271372, 1, 0.3843137, 0, 1,
-1.616076, -0.06315445, -2.675586, 1, 0.3882353, 0, 1,
-1.614933, 0.2077774, -1.960103, 1, 0.3960784, 0, 1,
-1.610333, -3.461325, -2.367483, 1, 0.4039216, 0, 1,
-1.598446, -2.266975, -2.083064, 1, 0.4078431, 0, 1,
-1.594607, 0.5056348, -1.383063, 1, 0.4156863, 0, 1,
-1.591963, -0.04003812, -2.22173, 1, 0.4196078, 0, 1,
-1.588568, 0.2312577, -1.629652, 1, 0.427451, 0, 1,
-1.584575, 2.018268, -2.322286, 1, 0.4313726, 0, 1,
-1.562142, -0.1022686, 0.1596157, 1, 0.4392157, 0, 1,
-1.556334, -0.2011587, -1.750095, 1, 0.4431373, 0, 1,
-1.548995, 0.3112597, -1.677815, 1, 0.4509804, 0, 1,
-1.543479, 0.5304406, -1.135912, 1, 0.454902, 0, 1,
-1.522672, 0.4182181, -1.976512, 1, 0.4627451, 0, 1,
-1.520848, -0.6914754, -3.01534, 1, 0.4666667, 0, 1,
-1.514696, 0.5187221, -0.4011679, 1, 0.4745098, 0, 1,
-1.512405, -1.208408, -2.586655, 1, 0.4784314, 0, 1,
-1.510945, -2.048776, -3.944188, 1, 0.4862745, 0, 1,
-1.506378, 1.128442, -1.359528, 1, 0.4901961, 0, 1,
-1.48868, 2.376191, -3.314336, 1, 0.4980392, 0, 1,
-1.484035, 0.9959305, 0.2089277, 1, 0.5058824, 0, 1,
-1.477256, 1.484226, -1.439091, 1, 0.509804, 0, 1,
-1.467473, 1.8417, -0.1655298, 1, 0.5176471, 0, 1,
-1.458319, 0.916367, -1.928855, 1, 0.5215687, 0, 1,
-1.457297, 0.05380659, -2.443379, 1, 0.5294118, 0, 1,
-1.457114, -0.2774007, -3.074184, 1, 0.5333334, 0, 1,
-1.45197, -0.5506945, -0.3747815, 1, 0.5411765, 0, 1,
-1.437762, -0.2061939, -1.82869, 1, 0.5450981, 0, 1,
-1.4373, 0.5923922, -0.5706736, 1, 0.5529412, 0, 1,
-1.435505, 1.016848, -1.406296, 1, 0.5568628, 0, 1,
-1.416133, -1.36744, -3.023888, 1, 0.5647059, 0, 1,
-1.365517, -0.1035799, -1.6137, 1, 0.5686275, 0, 1,
-1.354162, 0.02693213, -0.402898, 1, 0.5764706, 0, 1,
-1.338502, -0.4105914, -2.022512, 1, 0.5803922, 0, 1,
-1.327535, 0.264062, -0.7369208, 1, 0.5882353, 0, 1,
-1.319335, -1.77993, -1.787845, 1, 0.5921569, 0, 1,
-1.317513, -0.4486482, -2.317394, 1, 0.6, 0, 1,
-1.307985, 0.4617875, -0.5242797, 1, 0.6078432, 0, 1,
-1.295583, 0.7968045, -1.543339, 1, 0.6117647, 0, 1,
-1.286525, -0.8352629, -1.599124, 1, 0.6196079, 0, 1,
-1.279233, 0.9975652, 0.4392984, 1, 0.6235294, 0, 1,
-1.275714, -0.1919915, -2.734841, 1, 0.6313726, 0, 1,
-1.273254, -0.01525705, -3.734968, 1, 0.6352941, 0, 1,
-1.266373, -0.3247521, -0.2903236, 1, 0.6431373, 0, 1,
-1.265319, -0.2112263, -1.654553, 1, 0.6470588, 0, 1,
-1.262559, -0.3158312, -0.5859299, 1, 0.654902, 0, 1,
-1.256503, 1.216465, -0.5875989, 1, 0.6588235, 0, 1,
-1.249379, 0.07723393, -1.678219, 1, 0.6666667, 0, 1,
-1.240978, -0.9788873, -2.259435, 1, 0.6705883, 0, 1,
-1.236637, 0.3736755, -0.6183916, 1, 0.6784314, 0, 1,
-1.236042, -1.587845, -2.732832, 1, 0.682353, 0, 1,
-1.22163, -0.1831284, -1.675839, 1, 0.6901961, 0, 1,
-1.218963, -1.145604, -1.592227, 1, 0.6941177, 0, 1,
-1.210409, 0.9404364, -0.3314999, 1, 0.7019608, 0, 1,
-1.19242, -0.05735857, -0.814893, 1, 0.7098039, 0, 1,
-1.175352, -0.4321415, -3.705765, 1, 0.7137255, 0, 1,
-1.174739, 0.6175447, -1.18321, 1, 0.7215686, 0, 1,
-1.174235, 1.112439, 0.560148, 1, 0.7254902, 0, 1,
-1.172559, 1.190736, -2.858079, 1, 0.7333333, 0, 1,
-1.17087, -0.9217844, -0.3353737, 1, 0.7372549, 0, 1,
-1.15744, -1.165995, -1.014713, 1, 0.7450981, 0, 1,
-1.157264, 0.6432771, -1.177464, 1, 0.7490196, 0, 1,
-1.155862, -0.2523837, -2.203421, 1, 0.7568628, 0, 1,
-1.141642, -0.7782186, -3.80869, 1, 0.7607843, 0, 1,
-1.121671, -0.8225524, -2.774023, 1, 0.7686275, 0, 1,
-1.120102, -1.221842, -2.874148, 1, 0.772549, 0, 1,
-1.118048, -1.031058, -1.828033, 1, 0.7803922, 0, 1,
-1.112995, 0.2821567, -0.4242339, 1, 0.7843137, 0, 1,
-1.111368, -0.7580866, -2.555448, 1, 0.7921569, 0, 1,
-1.11015, 0.2687038, -1.778577, 1, 0.7960784, 0, 1,
-1.10603, 1.382378, -0.3597763, 1, 0.8039216, 0, 1,
-1.103019, -1.600824, -2.969627, 1, 0.8117647, 0, 1,
-1.098818, -1.215505, 0.2925999, 1, 0.8156863, 0, 1,
-1.095819, 1.089936, -1.696579, 1, 0.8235294, 0, 1,
-1.093784, 0.05394962, -1.037133, 1, 0.827451, 0, 1,
-1.092591, 0.8660193, -1.194978, 1, 0.8352941, 0, 1,
-1.090456, -1.443967, -2.870731, 1, 0.8392157, 0, 1,
-1.086861, -0.5114063, -2.469672, 1, 0.8470588, 0, 1,
-1.082118, -0.4435342, -2.619675, 1, 0.8509804, 0, 1,
-1.075134, 0.4002845, -1.249558, 1, 0.8588235, 0, 1,
-1.073534, -2.184771, -2.304785, 1, 0.8627451, 0, 1,
-1.062593, -1.046798, -2.850618, 1, 0.8705882, 0, 1,
-1.053318, -1.843433, -1.949462, 1, 0.8745098, 0, 1,
-1.05165, 0.08928623, -0.9225272, 1, 0.8823529, 0, 1,
-1.047653, -1.034855, -3.294006, 1, 0.8862745, 0, 1,
-1.046938, 0.03392153, -0.1195683, 1, 0.8941177, 0, 1,
-1.042157, 0.9077877, -2.341027, 1, 0.8980392, 0, 1,
-1.041493, -0.4348983, -3.669714, 1, 0.9058824, 0, 1,
-1.033929, -0.432131, -2.42665, 1, 0.9137255, 0, 1,
-1.02832, 0.7552788, -1.15603, 1, 0.9176471, 0, 1,
-1.026651, -0.8893677, -2.533539, 1, 0.9254902, 0, 1,
-1.02639, 0.02503838, -1.517655, 1, 0.9294118, 0, 1,
-1.017205, 2.34908, -0.7188191, 1, 0.9372549, 0, 1,
-1.016394, -1.352253, -1.221751, 1, 0.9411765, 0, 1,
-1.011977, 0.9605162, 0.3331721, 1, 0.9490196, 0, 1,
-1.006314, 0.3744302, 0.2619245, 1, 0.9529412, 0, 1,
-1.003011, 0.9350153, -1.722738, 1, 0.9607843, 0, 1,
-1.000812, 0.7123739, -0.776143, 1, 0.9647059, 0, 1,
-0.999805, 1.184975, 0.7595466, 1, 0.972549, 0, 1,
-0.9974099, 1.502543, -0.6748276, 1, 0.9764706, 0, 1,
-0.9946061, -0.4944953, -2.71623, 1, 0.9843137, 0, 1,
-0.9922106, -0.8583253, -2.167978, 1, 0.9882353, 0, 1,
-0.9890692, -0.0803792, -1.187659, 1, 0.9960784, 0, 1,
-0.9887429, 0.3434233, -0.8213119, 0.9960784, 1, 0, 1,
-0.9886111, -0.6497765, -1.602513, 0.9921569, 1, 0, 1,
-0.9840232, 0.433208, -1.680188, 0.9843137, 1, 0, 1,
-0.9729397, -0.07596618, -2.001877, 0.9803922, 1, 0, 1,
-0.9716047, -0.4700677, -2.39508, 0.972549, 1, 0, 1,
-0.9680849, 1.63751, -1.119175, 0.9686275, 1, 0, 1,
-0.9648042, 2.95464, -1.151803, 0.9607843, 1, 0, 1,
-0.9636074, -0.2594086, 0.2474168, 0.9568627, 1, 0, 1,
-0.9592373, -1.400731, -1.750646, 0.9490196, 1, 0, 1,
-0.9565173, 1.017914, -0.4747286, 0.945098, 1, 0, 1,
-0.9562824, 0.6997449, -0.0372942, 0.9372549, 1, 0, 1,
-0.9503756, -1.1046, -0.9063426, 0.9333333, 1, 0, 1,
-0.9482169, -0.3423155, -0.8378764, 0.9254902, 1, 0, 1,
-0.9399517, -0.7506821, -1.360053, 0.9215686, 1, 0, 1,
-0.9349856, -0.5912778, -1.258439, 0.9137255, 1, 0, 1,
-0.9347321, 0.3777772, -2.395696, 0.9098039, 1, 0, 1,
-0.9307304, 0.1324255, -1.240278, 0.9019608, 1, 0, 1,
-0.926409, 1.08742, -1.699567, 0.8941177, 1, 0, 1,
-0.9259417, -0.426864, -1.080561, 0.8901961, 1, 0, 1,
-0.922684, -0.352873, -1.116586, 0.8823529, 1, 0, 1,
-0.9225209, 0.9771851, -1.805207, 0.8784314, 1, 0, 1,
-0.9217713, -0.2369753, -2.168772, 0.8705882, 1, 0, 1,
-0.9209081, 0.4703112, -0.5694119, 0.8666667, 1, 0, 1,
-0.9133725, -0.3935446, 0.8762031, 0.8588235, 1, 0, 1,
-0.9100385, 0.5707925, -0.5284901, 0.854902, 1, 0, 1,
-0.9090074, -1.104959, -4.189729, 0.8470588, 1, 0, 1,
-0.9088755, 0.2673161, -1.511641, 0.8431373, 1, 0, 1,
-0.9053532, 0.6907625, -0.4915875, 0.8352941, 1, 0, 1,
-0.9053002, 0.9057497, 0.6582814, 0.8313726, 1, 0, 1,
-0.903287, 0.6211802, -1.449257, 0.8235294, 1, 0, 1,
-0.8997166, 1.989877, -1.80613, 0.8196079, 1, 0, 1,
-0.8915926, 1.792286, -0.8972133, 0.8117647, 1, 0, 1,
-0.8887705, 1.780922, 0.9612718, 0.8078431, 1, 0, 1,
-0.8800043, 1.312296, -0.1590333, 0.8, 1, 0, 1,
-0.8779054, 1.476411, -2.237016, 0.7921569, 1, 0, 1,
-0.8755487, 0.8159351, -2.483069, 0.7882353, 1, 0, 1,
-0.8752216, -1.129966, -1.88867, 0.7803922, 1, 0, 1,
-0.8706803, 0.4033574, -2.772425, 0.7764706, 1, 0, 1,
-0.8694893, 0.7097621, -0.4786148, 0.7686275, 1, 0, 1,
-0.8680904, -1.96391, -1.315119, 0.7647059, 1, 0, 1,
-0.8635437, -0.7610487, -3.22522, 0.7568628, 1, 0, 1,
-0.8633662, 0.1099547, -0.5144821, 0.7529412, 1, 0, 1,
-0.8623834, -1.886628, -1.638803, 0.7450981, 1, 0, 1,
-0.8567017, -0.6604176, -1.815682, 0.7411765, 1, 0, 1,
-0.8528339, -3.118173, -3.557643, 0.7333333, 1, 0, 1,
-0.8432159, -1.932917, -2.791057, 0.7294118, 1, 0, 1,
-0.8416946, 0.509718, -1.686663, 0.7215686, 1, 0, 1,
-0.8376083, -2.154615, -1.802595, 0.7176471, 1, 0, 1,
-0.8375921, 0.5231853, 0.3410152, 0.7098039, 1, 0, 1,
-0.8360427, 0.6442091, -1.462326, 0.7058824, 1, 0, 1,
-0.83573, -0.1517751, -3.011881, 0.6980392, 1, 0, 1,
-0.8315621, 0.8080007, -0.7086036, 0.6901961, 1, 0, 1,
-0.8283699, 0.4537212, 1.445226, 0.6862745, 1, 0, 1,
-0.8269898, 0.6563426, -0.6472152, 0.6784314, 1, 0, 1,
-0.8233419, -0.6556967, -1.3347, 0.6745098, 1, 0, 1,
-0.8225545, -1.217339, -2.373943, 0.6666667, 1, 0, 1,
-0.8174877, 0.5376173, -0.9901182, 0.6627451, 1, 0, 1,
-0.8142592, -1.479913, -2.381937, 0.654902, 1, 0, 1,
-0.8125327, 1.609537, 0.1648163, 0.6509804, 1, 0, 1,
-0.8084568, -0.8846436, -1.707688, 0.6431373, 1, 0, 1,
-0.8060585, -0.7608128, -1.850404, 0.6392157, 1, 0, 1,
-0.8048075, -0.6969196, -3.641651, 0.6313726, 1, 0, 1,
-0.8027954, 0.5953537, 0.7265387, 0.627451, 1, 0, 1,
-0.801202, -1.482433, -2.353362, 0.6196079, 1, 0, 1,
-0.7966691, -0.4070777, -1.785953, 0.6156863, 1, 0, 1,
-0.7957812, 1.694037, -0.2700859, 0.6078432, 1, 0, 1,
-0.7956283, 1.229067, -0.1333912, 0.6039216, 1, 0, 1,
-0.7947737, 0.6207878, 0.03529512, 0.5960785, 1, 0, 1,
-0.7900037, -0.6474192, -2.976578, 0.5882353, 1, 0, 1,
-0.7889186, 0.6098044, -1.427042, 0.5843138, 1, 0, 1,
-0.7871101, 0.5641324, 0.3026221, 0.5764706, 1, 0, 1,
-0.7830916, -0.6022947, -1.05343, 0.572549, 1, 0, 1,
-0.7824988, 0.4188353, 0.5993072, 0.5647059, 1, 0, 1,
-0.7803963, 0.5062608, -2.085503, 0.5607843, 1, 0, 1,
-0.7773368, 0.1965918, -1.857783, 0.5529412, 1, 0, 1,
-0.7749303, 0.03766886, -2.65312, 0.5490196, 1, 0, 1,
-0.772094, 1.061402, -1.193345, 0.5411765, 1, 0, 1,
-0.7698145, -0.1117746, -2.367574, 0.5372549, 1, 0, 1,
-0.7696425, 0.3749889, 0.5663717, 0.5294118, 1, 0, 1,
-0.7613878, -1.237169, -2.288354, 0.5254902, 1, 0, 1,
-0.7610693, -0.7419679, -2.93283, 0.5176471, 1, 0, 1,
-0.7598197, 2.053835, -0.4216273, 0.5137255, 1, 0, 1,
-0.7570412, -0.8924832, 0.1015617, 0.5058824, 1, 0, 1,
-0.7564422, -0.227027, -1.340024, 0.5019608, 1, 0, 1,
-0.7554379, -0.449985, -3.323424, 0.4941176, 1, 0, 1,
-0.7550809, -1.073061, -1.518258, 0.4862745, 1, 0, 1,
-0.7524452, 0.9639708, -1.034587, 0.4823529, 1, 0, 1,
-0.7455875, -0.6488497, -3.69104, 0.4745098, 1, 0, 1,
-0.7451728, -0.7391257, -2.232101, 0.4705882, 1, 0, 1,
-0.744004, 0.5007746, -0.8605088, 0.4627451, 1, 0, 1,
-0.7413612, 0.9445654, -1.297061, 0.4588235, 1, 0, 1,
-0.7384498, -0.5863695, -0.8023636, 0.4509804, 1, 0, 1,
-0.7358622, -2.100279, -2.818195, 0.4470588, 1, 0, 1,
-0.733578, -1.286216, -2.078414, 0.4392157, 1, 0, 1,
-0.7311322, 0.2543432, -1.502979, 0.4352941, 1, 0, 1,
-0.7238632, -0.5483136, -2.563705, 0.427451, 1, 0, 1,
-0.7189062, 0.06278404, -1.942632, 0.4235294, 1, 0, 1,
-0.7138954, -0.2004687, -1.20507, 0.4156863, 1, 0, 1,
-0.7073262, -0.4351745, 0.1069633, 0.4117647, 1, 0, 1,
-0.7010041, 0.127136, -0.5436223, 0.4039216, 1, 0, 1,
-0.6989675, 0.7815577, 0.430833, 0.3960784, 1, 0, 1,
-0.6794448, -0.7454059, -2.719699, 0.3921569, 1, 0, 1,
-0.6723897, 0.4326217, -0.4585994, 0.3843137, 1, 0, 1,
-0.670432, -1.139791, -3.018914, 0.3803922, 1, 0, 1,
-0.6688914, 0.6661786, -1.551976, 0.372549, 1, 0, 1,
-0.6648836, 0.5042601, -1.08212, 0.3686275, 1, 0, 1,
-0.662671, -1.501897, -4.138158, 0.3607843, 1, 0, 1,
-0.6493911, 1.240224, 0.5624768, 0.3568628, 1, 0, 1,
-0.6303565, 1.30481, -0.1335698, 0.3490196, 1, 0, 1,
-0.630031, 2.182753, -0.01954691, 0.345098, 1, 0, 1,
-0.6295373, -0.9340183, -1.469595, 0.3372549, 1, 0, 1,
-0.6281425, -0.7888822, -1.823069, 0.3333333, 1, 0, 1,
-0.6280446, -0.3523823, -2.878796, 0.3254902, 1, 0, 1,
-0.6209003, -2.221643, -2.722997, 0.3215686, 1, 0, 1,
-0.6204269, -1.044179, -1.760309, 0.3137255, 1, 0, 1,
-0.6182222, -1.677526, -5.777859, 0.3098039, 1, 0, 1,
-0.6179495, 0.02217508, 0.7575982, 0.3019608, 1, 0, 1,
-0.6157457, 1.872736, -1.911256, 0.2941177, 1, 0, 1,
-0.6031176, -0.5104425, -2.262699, 0.2901961, 1, 0, 1,
-0.6028752, 1.498424, 0.416792, 0.282353, 1, 0, 1,
-0.5977838, -0.4838731, -1.871159, 0.2784314, 1, 0, 1,
-0.5867181, -0.1928249, -1.996159, 0.2705882, 1, 0, 1,
-0.5726462, -0.6745295, -2.183057, 0.2666667, 1, 0, 1,
-0.5663927, -0.6009224, -0.6205591, 0.2588235, 1, 0, 1,
-0.5656974, -1.566063, -3.170215, 0.254902, 1, 0, 1,
-0.5655626, -1.459519, -3.094449, 0.2470588, 1, 0, 1,
-0.564042, 0.03088058, -0.9815611, 0.2431373, 1, 0, 1,
-0.5621133, -1.941098, -2.132163, 0.2352941, 1, 0, 1,
-0.5614973, 0.3334026, -2.970958, 0.2313726, 1, 0, 1,
-0.5576056, 0.379775, -0.583727, 0.2235294, 1, 0, 1,
-0.5559939, 0.01419658, -1.121635, 0.2196078, 1, 0, 1,
-0.5538888, -1.024445, -2.01957, 0.2117647, 1, 0, 1,
-0.5479696, 0.4889343, 1.926118, 0.2078431, 1, 0, 1,
-0.547387, 0.9000643, -0.219484, 0.2, 1, 0, 1,
-0.5467228, 0.6021969, -1.371542, 0.1921569, 1, 0, 1,
-0.5439992, -0.1213032, -1.850639, 0.1882353, 1, 0, 1,
-0.542521, -1.103581, -2.66664, 0.1803922, 1, 0, 1,
-0.5405239, -0.9582989, -2.493603, 0.1764706, 1, 0, 1,
-0.5392549, -0.321469, -1.332755, 0.1686275, 1, 0, 1,
-0.5307017, 1.097913, -1.602038, 0.1647059, 1, 0, 1,
-0.5258655, -0.7217214, -2.781366, 0.1568628, 1, 0, 1,
-0.5241018, 1.752568, -0.7108701, 0.1529412, 1, 0, 1,
-0.5220085, 0.6956006, -0.4328187, 0.145098, 1, 0, 1,
-0.5186289, 0.1361192, -1.723704, 0.1411765, 1, 0, 1,
-0.5163502, -1.288938, -3.668099, 0.1333333, 1, 0, 1,
-0.5120664, 0.02289652, -1.837628, 0.1294118, 1, 0, 1,
-0.5060492, -0.119607, -3.283983, 0.1215686, 1, 0, 1,
-0.503636, 0.2770838, 0.2100281, 0.1176471, 1, 0, 1,
-0.5033157, -0.8718971, -0.9991684, 0.1098039, 1, 0, 1,
-0.5028512, -0.5404832, -3.67427, 0.1058824, 1, 0, 1,
-0.5025061, -1.175856, -0.6996068, 0.09803922, 1, 0, 1,
-0.5022464, 0.6773998, -1.849902, 0.09019608, 1, 0, 1,
-0.5012497, 0.1475756, -2.210238, 0.08627451, 1, 0, 1,
-0.4915134, 1.078734, 0.7799941, 0.07843138, 1, 0, 1,
-0.4877218, 0.9648207, 0.9349127, 0.07450981, 1, 0, 1,
-0.475224, -0.04489301, -2.06739, 0.06666667, 1, 0, 1,
-0.4708124, -1.389212, -4.45518, 0.0627451, 1, 0, 1,
-0.4666325, -0.5262228, -2.591273, 0.05490196, 1, 0, 1,
-0.466399, -0.0213215, -2.727427, 0.05098039, 1, 0, 1,
-0.4621813, -0.2445439, -1.04947, 0.04313726, 1, 0, 1,
-0.4621055, -0.3053045, -2.120054, 0.03921569, 1, 0, 1,
-0.4620968, 0.04454402, -1.581756, 0.03137255, 1, 0, 1,
-0.4612557, -0.9849575, -1.402732, 0.02745098, 1, 0, 1,
-0.4540083, -0.4232622, -1.736515, 0.01960784, 1, 0, 1,
-0.453525, 0.4272402, -0.2515016, 0.01568628, 1, 0, 1,
-0.4496051, 0.386179, 0.08869848, 0.007843138, 1, 0, 1,
-0.4453445, -0.5822617, -2.589705, 0.003921569, 1, 0, 1,
-0.4451261, -0.4103426, -4.401283, 0, 1, 0.003921569, 1,
-0.4428594, 0.542468, 0.888598, 0, 1, 0.01176471, 1,
-0.4367553, 1.752112, -0.1851244, 0, 1, 0.01568628, 1,
-0.436211, 0.7939291, 1.238425, 0, 1, 0.02352941, 1,
-0.4358029, -0.4753005, -2.575178, 0, 1, 0.02745098, 1,
-0.4342438, 0.820237, -0.6322358, 0, 1, 0.03529412, 1,
-0.4336362, 1.086456, 0.5741189, 0, 1, 0.03921569, 1,
-0.431073, 1.136633, -0.3397801, 0, 1, 0.04705882, 1,
-0.4303667, 0.2336003, 0.8416463, 0, 1, 0.05098039, 1,
-0.421726, 0.4725544, -1.511137, 0, 1, 0.05882353, 1,
-0.4187108, -0.1000296, -0.8192124, 0, 1, 0.0627451, 1,
-0.4159573, -0.7831388, -2.720503, 0, 1, 0.07058824, 1,
-0.4150858, 0.404336, -0.3104134, 0, 1, 0.07450981, 1,
-0.4115888, -0.5567755, -3.451612, 0, 1, 0.08235294, 1,
-0.4112108, 0.3218722, -1.44524, 0, 1, 0.08627451, 1,
-0.4062143, -0.03617271, -2.26701, 0, 1, 0.09411765, 1,
-0.3999273, 0.06978729, -2.816572, 0, 1, 0.1019608, 1,
-0.397878, 0.4030808, -0.5368626, 0, 1, 0.1058824, 1,
-0.3956626, 0.3019526, -3.295495, 0, 1, 0.1137255, 1,
-0.3853974, 0.6391767, -1.369519, 0, 1, 0.1176471, 1,
-0.3815711, 0.1110301, -0.5821478, 0, 1, 0.1254902, 1,
-0.3803343, 2.197105, -2.40402, 0, 1, 0.1294118, 1,
-0.3789287, 0.4342472, 1.237876, 0, 1, 0.1372549, 1,
-0.3744786, 0.6119459, 0.3442248, 0, 1, 0.1411765, 1,
-0.3730056, -1.069633, -3.658165, 0, 1, 0.1490196, 1,
-0.3719634, -0.1299838, -1.500353, 0, 1, 0.1529412, 1,
-0.3704268, 0.51389, -1.354306, 0, 1, 0.1607843, 1,
-0.3623928, -0.6638605, -3.067622, 0, 1, 0.1647059, 1,
-0.3617105, 1.458866, 0.8473492, 0, 1, 0.172549, 1,
-0.3616921, -0.6571538, -2.054072, 0, 1, 0.1764706, 1,
-0.3603758, -0.03906919, -1.25641, 0, 1, 0.1843137, 1,
-0.3554939, -0.2322935, -0.6080148, 0, 1, 0.1882353, 1,
-0.354954, -0.544628, -0.8027622, 0, 1, 0.1960784, 1,
-0.3543139, 0.2953981, -1.224874, 0, 1, 0.2039216, 1,
-0.3540566, 0.4097218, -0.2873622, 0, 1, 0.2078431, 1,
-0.3530986, 1.267567, -1.633692, 0, 1, 0.2156863, 1,
-0.3489221, -0.5243272, -1.99156, 0, 1, 0.2196078, 1,
-0.3487616, -0.09867637, -0.7124103, 0, 1, 0.227451, 1,
-0.3441608, 0.8916137, -1.323758, 0, 1, 0.2313726, 1,
-0.3418684, 0.4689057, -0.5150074, 0, 1, 0.2392157, 1,
-0.3409337, 0.6156977, 0.8527841, 0, 1, 0.2431373, 1,
-0.3392273, -1.15162, -2.16749, 0, 1, 0.2509804, 1,
-0.3325893, 0.8268567, -1.783314, 0, 1, 0.254902, 1,
-0.3308555, 0.5346394, -1.099812, 0, 1, 0.2627451, 1,
-0.3296145, -0.8800157, -0.3607899, 0, 1, 0.2666667, 1,
-0.3273722, -0.6402024, -4.100951, 0, 1, 0.2745098, 1,
-0.3266992, 1.283466, 0.8406894, 0, 1, 0.2784314, 1,
-0.3223893, 1.062663, -0.02249415, 0, 1, 0.2862745, 1,
-0.3218593, -0.6303072, -5.223958, 0, 1, 0.2901961, 1,
-0.3214942, 1.341292, 0.7397265, 0, 1, 0.2980392, 1,
-0.3203948, 0.6165302, 0.4746203, 0, 1, 0.3058824, 1,
-0.3189409, -1.734792, -1.577982, 0, 1, 0.3098039, 1,
-0.3181041, -0.2425545, -0.06812968, 0, 1, 0.3176471, 1,
-0.3176981, -0.4616937, -3.756867, 0, 1, 0.3215686, 1,
-0.3147868, -2.821147, -3.138704, 0, 1, 0.3294118, 1,
-0.3119037, -0.1962586, -2.223943, 0, 1, 0.3333333, 1,
-0.3111503, 0.5277796, 0.2595724, 0, 1, 0.3411765, 1,
-0.3086324, -0.8769744, -0.8040376, 0, 1, 0.345098, 1,
-0.3051453, -1.489586, -3.252683, 0, 1, 0.3529412, 1,
-0.3032465, 0.5109132, -0.712885, 0, 1, 0.3568628, 1,
-0.302984, -0.6252621, -4.092557, 0, 1, 0.3647059, 1,
-0.3009218, 0.8624634, -0.701579, 0, 1, 0.3686275, 1,
-0.2963744, 0.9805616, -0.9523433, 0, 1, 0.3764706, 1,
-0.2911344, 0.6728578, 2.070144, 0, 1, 0.3803922, 1,
-0.2903348, -0.4017278, -3.388612, 0, 1, 0.3882353, 1,
-0.2898715, 0.7138242, 0.3852656, 0, 1, 0.3921569, 1,
-0.2882473, 1.565648, -1.010506, 0, 1, 0.4, 1,
-0.2740203, -1.226137, -1.450389, 0, 1, 0.4078431, 1,
-0.272086, -0.3294283, -1.645397, 0, 1, 0.4117647, 1,
-0.2714024, 0.03461488, -1.40314, 0, 1, 0.4196078, 1,
-0.2697597, 0.9329813, -0.1181448, 0, 1, 0.4235294, 1,
-0.2692018, 1.348833, -0.06077854, 0, 1, 0.4313726, 1,
-0.2691451, -0.4226972, -1.837089, 0, 1, 0.4352941, 1,
-0.2680662, -0.6826443, -3.493219, 0, 1, 0.4431373, 1,
-0.2656214, 1.35474, -1.050879, 0, 1, 0.4470588, 1,
-0.2591343, -2.276049, -3.999243, 0, 1, 0.454902, 1,
-0.2409424, -0.6385031, -0.913402, 0, 1, 0.4588235, 1,
-0.2364397, -0.8901365, -2.630422, 0, 1, 0.4666667, 1,
-0.2339114, -0.08895273, -2.581622, 0, 1, 0.4705882, 1,
-0.2320909, 0.05375106, -1.826546, 0, 1, 0.4784314, 1,
-0.2310873, 1.177336, 1.186634, 0, 1, 0.4823529, 1,
-0.2309157, 0.3750624, -0.07393852, 0, 1, 0.4901961, 1,
-0.2282806, -1.166103, -1.64328, 0, 1, 0.4941176, 1,
-0.2268717, 0.2507899, 0.06617086, 0, 1, 0.5019608, 1,
-0.2255323, -1.123185, -2.089903, 0, 1, 0.509804, 1,
-0.224508, 0.504476, 0.05025994, 0, 1, 0.5137255, 1,
-0.2238573, 0.9617112, -0.1599726, 0, 1, 0.5215687, 1,
-0.2232024, -0.0389963, -2.258294, 0, 1, 0.5254902, 1,
-0.2144055, -1.204192, -1.940895, 0, 1, 0.5333334, 1,
-0.2088181, 1.49736, 0.3540497, 0, 1, 0.5372549, 1,
-0.205712, 0.0566537, -0.5386509, 0, 1, 0.5450981, 1,
-0.2054375, 0.2770584, -0.5959191, 0, 1, 0.5490196, 1,
-0.2050491, -0.5508263, -3.584398, 0, 1, 0.5568628, 1,
-0.2009951, 0.005418025, -2.517048, 0, 1, 0.5607843, 1,
-0.1949435, 0.8100448, -1.298591, 0, 1, 0.5686275, 1,
-0.1944161, 0.2187362, -1.505672, 0, 1, 0.572549, 1,
-0.19278, 0.8983924, -0.7038243, 0, 1, 0.5803922, 1,
-0.1879771, -1.883269, -3.398194, 0, 1, 0.5843138, 1,
-0.186, 0.6232384, -0.5727443, 0, 1, 0.5921569, 1,
-0.1844902, -0.8724111, -3.151089, 0, 1, 0.5960785, 1,
-0.1843615, -0.6042832, -3.491425, 0, 1, 0.6039216, 1,
-0.1759028, 1.079183, 0.3140261, 0, 1, 0.6117647, 1,
-0.171507, -0.1139039, -0.3258881, 0, 1, 0.6156863, 1,
-0.1693926, 1.343139, -0.03761739, 0, 1, 0.6235294, 1,
-0.1678698, -0.9856522, -3.268401, 0, 1, 0.627451, 1,
-0.1667621, 0.6716989, -0.994031, 0, 1, 0.6352941, 1,
-0.1630026, 0.8204652, -1.025268, 0, 1, 0.6392157, 1,
-0.1599794, 1.329638, -0.7797139, 0, 1, 0.6470588, 1,
-0.1597924, 0.7098958, -0.8000737, 0, 1, 0.6509804, 1,
-0.152849, 0.5975813, -1.374686, 0, 1, 0.6588235, 1,
-0.1518414, -1.103055, -3.309859, 0, 1, 0.6627451, 1,
-0.1497385, 1.107547, 0.7092225, 0, 1, 0.6705883, 1,
-0.1465001, 1.934866, -0.5125586, 0, 1, 0.6745098, 1,
-0.1459991, 0.6862658, 1.0227, 0, 1, 0.682353, 1,
-0.1388869, -0.8431813, -3.616719, 0, 1, 0.6862745, 1,
-0.1385053, 0.2389667, 0.3724208, 0, 1, 0.6941177, 1,
-0.1379426, 0.6948532, 0.1867787, 0, 1, 0.7019608, 1,
-0.1328323, 1.759867, -0.6130592, 0, 1, 0.7058824, 1,
-0.132548, 0.4056133, 0.4484389, 0, 1, 0.7137255, 1,
-0.1287411, -0.1634438, -2.894765, 0, 1, 0.7176471, 1,
-0.1168827, -0.5646273, -3.639405, 0, 1, 0.7254902, 1,
-0.1153652, 0.4119261, -0.3373409, 0, 1, 0.7294118, 1,
-0.1143291, -0.2376774, -2.524366, 0, 1, 0.7372549, 1,
-0.1080365, 0.3888581, -1.331661, 0, 1, 0.7411765, 1,
-0.1044771, 0.929415, 0.2166741, 0, 1, 0.7490196, 1,
-0.1025661, 0.4236034, -0.3476061, 0, 1, 0.7529412, 1,
-0.1020883, -0.9911505, -2.534214, 0, 1, 0.7607843, 1,
-0.09929262, 1.181424, -1.304737, 0, 1, 0.7647059, 1,
-0.09847765, -0.4843391, -4.03681, 0, 1, 0.772549, 1,
-0.09834991, -0.4381712, -3.615, 0, 1, 0.7764706, 1,
-0.09623228, 0.8396795, 0.8732377, 0, 1, 0.7843137, 1,
-0.09466673, 1.738453, 2.290146, 0, 1, 0.7882353, 1,
-0.09410007, -0.7132058, -4.110331, 0, 1, 0.7960784, 1,
-0.09338308, -0.261153, -2.470188, 0, 1, 0.8039216, 1,
-0.09263955, 2.335187, -1.706936, 0, 1, 0.8078431, 1,
-0.09093033, -1.277421, -0.9828545, 0, 1, 0.8156863, 1,
-0.08778415, -1.824412, -1.830717, 0, 1, 0.8196079, 1,
-0.08022349, -0.2581252, -2.348706, 0, 1, 0.827451, 1,
-0.08008464, 0.6699536, -1.5368, 0, 1, 0.8313726, 1,
-0.06775395, 0.6373644, 0.5359145, 0, 1, 0.8392157, 1,
-0.06593468, 0.7060615, 0.4780891, 0, 1, 0.8431373, 1,
-0.06112253, 1.645177, 0.8236896, 0, 1, 0.8509804, 1,
-0.06051078, -0.7056374, -1.8858, 0, 1, 0.854902, 1,
-0.04900014, -0.1182177, -3.960624, 0, 1, 0.8627451, 1,
-0.04723354, -0.9866452, -2.799084, 0, 1, 0.8666667, 1,
-0.04283081, 1.244761, -2.930628, 0, 1, 0.8745098, 1,
-0.04168851, -0.7348006, -4.256044, 0, 1, 0.8784314, 1,
-0.04116145, -0.2016321, -2.040274, 0, 1, 0.8862745, 1,
-0.03921495, 0.1318324, -1.023198, 0, 1, 0.8901961, 1,
-0.03657979, 0.638924, 0.2257656, 0, 1, 0.8980392, 1,
-0.03430414, 1.725119, -0.09460594, 0, 1, 0.9058824, 1,
-0.03245926, 0.1002574, -0.07634978, 0, 1, 0.9098039, 1,
-0.03077925, -0.9053236, -3.109148, 0, 1, 0.9176471, 1,
-0.02772139, 0.3880185, -0.1517023, 0, 1, 0.9215686, 1,
-0.02676198, -0.8682973, -2.734516, 0, 1, 0.9294118, 1,
-0.02551543, 1.878507, 1.881978, 0, 1, 0.9333333, 1,
-0.01838147, 0.9824361, -0.4403439, 0, 1, 0.9411765, 1,
-0.01687931, 0.329514, 0.161545, 0, 1, 0.945098, 1,
-0.01665963, 0.1208334, 0.003382057, 0, 1, 0.9529412, 1,
-0.01400344, -1.19086, -3.04884, 0, 1, 0.9568627, 1,
-0.01180395, -1.567426, -5.060151, 0, 1, 0.9647059, 1,
-0.006135438, -0.4808201, -2.975516, 0, 1, 0.9686275, 1,
-0.003800827, 1.087044, -0.06363414, 0, 1, 0.9764706, 1,
-0.002676221, 0.4362072, -0.7103644, 0, 1, 0.9803922, 1,
-0.001711949, -0.1979232, -5.33701, 0, 1, 0.9882353, 1,
0.002131392, 0.4648758, 0.430819, 0, 1, 0.9921569, 1,
0.002267339, -0.7692161, 3.310816, 0, 1, 1, 1,
0.004896544, 0.008863366, 0.5785354, 0, 0.9921569, 1, 1,
0.006605468, -1.772592, 2.926294, 0, 0.9882353, 1, 1,
0.008489388, 0.8756098, 1.129827, 0, 0.9803922, 1, 1,
0.01340593, -1.077046, 3.569158, 0, 0.9764706, 1, 1,
0.01400295, 0.03591047, -0.3033434, 0, 0.9686275, 1, 1,
0.01456641, -1.269363, 2.989616, 0, 0.9647059, 1, 1,
0.0181407, -0.5588876, 1.676482, 0, 0.9568627, 1, 1,
0.02027192, 0.1034691, 1.657095, 0, 0.9529412, 1, 1,
0.02578162, -0.9260165, 3.469497, 0, 0.945098, 1, 1,
0.02871532, 0.9399617, -0.5005628, 0, 0.9411765, 1, 1,
0.03126616, 0.8878148, -0.297371, 0, 0.9333333, 1, 1,
0.03360246, 0.07656191, -0.6602414, 0, 0.9294118, 1, 1,
0.04054794, -0.2150166, 0.6802161, 0, 0.9215686, 1, 1,
0.04528068, -0.6495627, 2.522091, 0, 0.9176471, 1, 1,
0.04632194, 0.7401614, -0.002710074, 0, 0.9098039, 1, 1,
0.04788497, -2.23482, 3.513784, 0, 0.9058824, 1, 1,
0.0503124, 0.7812576, -0.1500431, 0, 0.8980392, 1, 1,
0.05297041, 0.04329525, 1.680734, 0, 0.8901961, 1, 1,
0.05343036, -0.3147995, 4.247178, 0, 0.8862745, 1, 1,
0.06152919, -0.6873245, 2.845894, 0, 0.8784314, 1, 1,
0.07031912, -1.69118, 4.095484, 0, 0.8745098, 1, 1,
0.07476791, -1.366555, 4.412001, 0, 0.8666667, 1, 1,
0.07569015, -2.611311, 3.740272, 0, 0.8627451, 1, 1,
0.07601794, -0.4230215, 1.011784, 0, 0.854902, 1, 1,
0.08097431, -0.555272, 2.338691, 0, 0.8509804, 1, 1,
0.08327352, -0.09148348, 2.23364, 0, 0.8431373, 1, 1,
0.08723726, -1.176056, 2.723368, 0, 0.8392157, 1, 1,
0.08780288, -1.385182, 3.386056, 0, 0.8313726, 1, 1,
0.09518871, 0.352818, -0.7585263, 0, 0.827451, 1, 1,
0.09614115, 0.4068394, 1.978287, 0, 0.8196079, 1, 1,
0.09655526, 0.3858241, -0.4578863, 0, 0.8156863, 1, 1,
0.09687426, 1.755057, 0.603916, 0, 0.8078431, 1, 1,
0.09735753, 2.000952, 0.3938341, 0, 0.8039216, 1, 1,
0.1021735, -1.327422, 3.502219, 0, 0.7960784, 1, 1,
0.1031647, 0.07453457, 0.6730308, 0, 0.7882353, 1, 1,
0.1034174, 0.2262338, -0.03628066, 0, 0.7843137, 1, 1,
0.1126366, -0.4214655, 1.446452, 0, 0.7764706, 1, 1,
0.1183988, -0.4039965, 2.63223, 0, 0.772549, 1, 1,
0.1200053, -0.1504636, 3.863022, 0, 0.7647059, 1, 1,
0.1222729, 0.953302, 0.1735388, 0, 0.7607843, 1, 1,
0.1234688, -0.4454021, 2.545101, 0, 0.7529412, 1, 1,
0.1239414, -0.07203203, 2.426069, 0, 0.7490196, 1, 1,
0.1269676, -1.695136, 1.238509, 0, 0.7411765, 1, 1,
0.1302675, 0.6135318, 0.6575943, 0, 0.7372549, 1, 1,
0.1307962, -1.823703, 2.308378, 0, 0.7294118, 1, 1,
0.1309164, 1.908696, 0.6546095, 0, 0.7254902, 1, 1,
0.1366245, 0.7925298, 0.3908828, 0, 0.7176471, 1, 1,
0.1423217, 0.1833264, 0.9165527, 0, 0.7137255, 1, 1,
0.1437721, -0.01519363, 2.459677, 0, 0.7058824, 1, 1,
0.1471304, 0.05439848, 2.155224, 0, 0.6980392, 1, 1,
0.1495247, -0.6852078, 1.72316, 0, 0.6941177, 1, 1,
0.1511988, 0.02910164, 1.596485, 0, 0.6862745, 1, 1,
0.1589791, 0.3696869, 0.7212238, 0, 0.682353, 1, 1,
0.1632207, -1.661482, 2.666273, 0, 0.6745098, 1, 1,
0.1654999, -0.6280272, 2.464035, 0, 0.6705883, 1, 1,
0.166601, 0.8758228, -0.4857739, 0, 0.6627451, 1, 1,
0.1723009, 1.370111, 0.3573946, 0, 0.6588235, 1, 1,
0.1753253, -2.14495, 4.301848, 0, 0.6509804, 1, 1,
0.1758347, 0.5543392, -0.9032265, 0, 0.6470588, 1, 1,
0.183445, 0.4520676, 1.325894, 0, 0.6392157, 1, 1,
0.1840009, -1.527685, 3.445092, 0, 0.6352941, 1, 1,
0.1842314, -0.3609626, 3.955058, 0, 0.627451, 1, 1,
0.1847449, -1.3904, 2.090986, 0, 0.6235294, 1, 1,
0.1849372, 0.03434998, 0.2160316, 0, 0.6156863, 1, 1,
0.1916853, 0.6248662, 2.021842, 0, 0.6117647, 1, 1,
0.1928049, 0.2770589, -1.539092, 0, 0.6039216, 1, 1,
0.1929753, 1.75124, -0.5683413, 0, 0.5960785, 1, 1,
0.1933869, 1.36239, 0.0659353, 0, 0.5921569, 1, 1,
0.1943614, 1.036727, -0.1007412, 0, 0.5843138, 1, 1,
0.1992732, -0.1982833, 1.244698, 0, 0.5803922, 1, 1,
0.2016556, 1.508969, -0.1442257, 0, 0.572549, 1, 1,
0.2021965, 0.9782459, 0.8774862, 0, 0.5686275, 1, 1,
0.2058777, 0.5180267, 0.02302066, 0, 0.5607843, 1, 1,
0.2109738, 0.6556135, -1.094412, 0, 0.5568628, 1, 1,
0.2155061, 1.332229, -0.4759741, 0, 0.5490196, 1, 1,
0.2160392, 0.002042035, 1.593873, 0, 0.5450981, 1, 1,
0.2167648, 0.5160339, -0.3836602, 0, 0.5372549, 1, 1,
0.2168517, -3.011914, 3.207179, 0, 0.5333334, 1, 1,
0.221563, 1.445448, -0.8408045, 0, 0.5254902, 1, 1,
0.2263895, 0.1298977, 0.3258019, 0, 0.5215687, 1, 1,
0.2280566, 0.1151419, 1.587139, 0, 0.5137255, 1, 1,
0.2292118, -0.9476477, 3.760994, 0, 0.509804, 1, 1,
0.2308848, 2.020915, -2.350138, 0, 0.5019608, 1, 1,
0.2338979, -0.3704135, 4.046704, 0, 0.4941176, 1, 1,
0.2355137, 0.4820199, -0.2624942, 0, 0.4901961, 1, 1,
0.2378512, 0.01045667, 2.000684, 0, 0.4823529, 1, 1,
0.2412648, 0.8684374, 0.340719, 0, 0.4784314, 1, 1,
0.2442632, 0.4965512, -0.3740803, 0, 0.4705882, 1, 1,
0.244334, -0.1628559, 2.447167, 0, 0.4666667, 1, 1,
0.2447654, 0.5182698, 0.6605901, 0, 0.4588235, 1, 1,
0.2449028, 0.5089875, 0.7188784, 0, 0.454902, 1, 1,
0.2462175, 1.02316, 1.032205, 0, 0.4470588, 1, 1,
0.251198, 0.5953874, -1.804187, 0, 0.4431373, 1, 1,
0.253119, -0.7146339, 3.421652, 0, 0.4352941, 1, 1,
0.2544976, 0.3661579, 0.418906, 0, 0.4313726, 1, 1,
0.2552972, 0.9025155, 0.7677035, 0, 0.4235294, 1, 1,
0.2567464, -0.7501184, 4.096659, 0, 0.4196078, 1, 1,
0.2577373, -1.930097, 1.365075, 0, 0.4117647, 1, 1,
0.2594666, -1.045465, 3.222144, 0, 0.4078431, 1, 1,
0.259588, -1.105848, 0.9548147, 0, 0.4, 1, 1,
0.2599728, 2.35406, 2.021964, 0, 0.3921569, 1, 1,
0.2612369, -1.219541, 4.820734, 0, 0.3882353, 1, 1,
0.2666806, -0.5167468, 3.871895, 0, 0.3803922, 1, 1,
0.2670652, -0.9120476, 2.92051, 0, 0.3764706, 1, 1,
0.2691748, 0.7961229, -1.139512, 0, 0.3686275, 1, 1,
0.2697954, -0.6096973, 2.640499, 0, 0.3647059, 1, 1,
0.2729053, -0.1885374, 1.829212, 0, 0.3568628, 1, 1,
0.2778896, -0.1377876, 1.296795, 0, 0.3529412, 1, 1,
0.2795433, -0.05000405, 2.095462, 0, 0.345098, 1, 1,
0.2851724, -1.28812, 1.345575, 0, 0.3411765, 1, 1,
0.2925691, -0.1904661, 2.880639, 0, 0.3333333, 1, 1,
0.2939305, 0.4628528, 0.1876131, 0, 0.3294118, 1, 1,
0.2962379, 0.5907285, -1.219817, 0, 0.3215686, 1, 1,
0.3048769, -2.677184, 3.851164, 0, 0.3176471, 1, 1,
0.3054351, -0.240097, 4.87262, 0, 0.3098039, 1, 1,
0.3060806, 0.3049944, 2.096133, 0, 0.3058824, 1, 1,
0.3084159, 0.5332641, -0.4924027, 0, 0.2980392, 1, 1,
0.3097799, -0.8529806, 3.964292, 0, 0.2901961, 1, 1,
0.310856, 0.002619988, 0.2710274, 0, 0.2862745, 1, 1,
0.3123182, -2.306822, 1.354246, 0, 0.2784314, 1, 1,
0.3130435, -0.8268896, 0.8237156, 0, 0.2745098, 1, 1,
0.3139294, 0.3735431, 0.2529435, 0, 0.2666667, 1, 1,
0.3140049, 0.008025329, 0.9374032, 0, 0.2627451, 1, 1,
0.3156663, 0.4651312, -0.2005875, 0, 0.254902, 1, 1,
0.316307, 0.3689918, 2.330048, 0, 0.2509804, 1, 1,
0.3167158, 1.933458, 1.230477, 0, 0.2431373, 1, 1,
0.3199603, 0.1567742, 0.3541373, 0, 0.2392157, 1, 1,
0.3205149, -0.4249681, 1.629393, 0, 0.2313726, 1, 1,
0.332719, 1.436795, 0.5126377, 0, 0.227451, 1, 1,
0.3403888, -1.063075, 2.353967, 0, 0.2196078, 1, 1,
0.3466642, 0.08330053, 1.810661, 0, 0.2156863, 1, 1,
0.3466946, 0.8658397, 1.728925, 0, 0.2078431, 1, 1,
0.3481711, -0.2740531, 2.43478, 0, 0.2039216, 1, 1,
0.3543002, 0.4005021, 0.7128217, 0, 0.1960784, 1, 1,
0.3586503, 1.823565, 0.33337, 0, 0.1882353, 1, 1,
0.362886, 1.074926, -1.177623, 0, 0.1843137, 1, 1,
0.3646562, 2.276074, -0.7750989, 0, 0.1764706, 1, 1,
0.3653016, -0.06780318, 2.319284, 0, 0.172549, 1, 1,
0.3760657, 1.625081, 1.220409, 0, 0.1647059, 1, 1,
0.3814099, -0.2372814, 1.986174, 0, 0.1607843, 1, 1,
0.383276, -0.2808323, 3.421156, 0, 0.1529412, 1, 1,
0.3911552, 0.5653166, 0.3549079, 0, 0.1490196, 1, 1,
0.394098, -0.6344106, 2.021747, 0, 0.1411765, 1, 1,
0.3952666, 0.5765449, 0.7620286, 0, 0.1372549, 1, 1,
0.4008622, -0.417368, 1.851539, 0, 0.1294118, 1, 1,
0.4014413, -1.364492, 2.751731, 0, 0.1254902, 1, 1,
0.4062077, -0.05489218, 2.402221, 0, 0.1176471, 1, 1,
0.4064214, -1.295083, 2.936959, 0, 0.1137255, 1, 1,
0.4118711, 1.883907, -0.04072391, 0, 0.1058824, 1, 1,
0.4152459, -1.46109, 4.795769, 0, 0.09803922, 1, 1,
0.4153848, -0.4704346, 0.2915371, 0, 0.09411765, 1, 1,
0.4174308, 0.4930126, -0.6091878, 0, 0.08627451, 1, 1,
0.4186533, 1.189238, 1.763142, 0, 0.08235294, 1, 1,
0.4208178, 0.3471039, 0.6524323, 0, 0.07450981, 1, 1,
0.4224708, -0.2782122, 2.633522, 0, 0.07058824, 1, 1,
0.4228419, -0.6403847, 2.592974, 0, 0.0627451, 1, 1,
0.4245597, 0.8932683, 0.6148443, 0, 0.05882353, 1, 1,
0.4263816, -1.427871, 0.6608887, 0, 0.05098039, 1, 1,
0.4280209, -1.529149, 2.628284, 0, 0.04705882, 1, 1,
0.4319874, -0.7238091, 0.923086, 0, 0.03921569, 1, 1,
0.4333968, 0.5568467, 2.11182, 0, 0.03529412, 1, 1,
0.4344359, 0.07608159, 2.525397, 0, 0.02745098, 1, 1,
0.4351483, -0.1181762, 0.2364843, 0, 0.02352941, 1, 1,
0.4371969, -0.7122595, 2.93728, 0, 0.01568628, 1, 1,
0.4385513, 2.29634, 0.1445976, 0, 0.01176471, 1, 1,
0.4461831, 0.2393332, -1.002873, 0, 0.003921569, 1, 1,
0.4494508, -1.005474, 1.284955, 0.003921569, 0, 1, 1,
0.4543725, 2.041701, 1.124115, 0.007843138, 0, 1, 1,
0.4594037, 0.8554822, 0.5823269, 0.01568628, 0, 1, 1,
0.4662162, 0.9684845, -0.716435, 0.01960784, 0, 1, 1,
0.4690448, 0.4213654, 1.644643, 0.02745098, 0, 1, 1,
0.4699005, -0.8034419, 4.139112, 0.03137255, 0, 1, 1,
0.4722067, -0.1836651, 0.4196761, 0.03921569, 0, 1, 1,
0.4725437, -0.7337285, 3.449958, 0.04313726, 0, 1, 1,
0.4748308, -0.1826213, 1.170495, 0.05098039, 0, 1, 1,
0.4820204, -0.225406, 1.241019, 0.05490196, 0, 1, 1,
0.4839796, 1.925076, 1.159868, 0.0627451, 0, 1, 1,
0.4844914, -0.6631747, 0.9495426, 0.06666667, 0, 1, 1,
0.4855047, -2.585464, 4.130587, 0.07450981, 0, 1, 1,
0.4867838, 1.338293, -0.2822796, 0.07843138, 0, 1, 1,
0.4966071, -0.6739735, 2.732299, 0.08627451, 0, 1, 1,
0.4966604, 0.3396829, 0.7411363, 0.09019608, 0, 1, 1,
0.4992226, -1.306387, 5.304699, 0.09803922, 0, 1, 1,
0.5005811, 0.6672883, -0.7634934, 0.1058824, 0, 1, 1,
0.5021985, -0.4056198, 3.756319, 0.1098039, 0, 1, 1,
0.5055574, -0.7264176, 5.02299, 0.1176471, 0, 1, 1,
0.509773, 0.06438699, 2.972616, 0.1215686, 0, 1, 1,
0.5131692, 1.546575, 2.307715, 0.1294118, 0, 1, 1,
0.5144543, -0.7651759, 1.883682, 0.1333333, 0, 1, 1,
0.5192006, 1.673095, 1.333392, 0.1411765, 0, 1, 1,
0.5195913, 0.4348311, 0.6865126, 0.145098, 0, 1, 1,
0.5221964, 1.768595, 0.9902338, 0.1529412, 0, 1, 1,
0.5281181, 0.7360572, 0.4155548, 0.1568628, 0, 1, 1,
0.5308616, 0.3972242, -1.397031, 0.1647059, 0, 1, 1,
0.5392848, -0.9232142, 0.6348053, 0.1686275, 0, 1, 1,
0.5481598, 1.160688, -0.09699927, 0.1764706, 0, 1, 1,
0.5485882, -0.366594, 2.814782, 0.1803922, 0, 1, 1,
0.5486696, -0.7510173, 1.888584, 0.1882353, 0, 1, 1,
0.5489132, 0.1140478, 0.1699622, 0.1921569, 0, 1, 1,
0.5514289, 0.9873636, -0.5548757, 0.2, 0, 1, 1,
0.5546382, 1.277591, 0.4910665, 0.2078431, 0, 1, 1,
0.5581505, 0.4932904, 2.084275, 0.2117647, 0, 1, 1,
0.5581753, 1.552062, -1.068696, 0.2196078, 0, 1, 1,
0.5621008, 1.163613, -0.5419733, 0.2235294, 0, 1, 1,
0.5624347, -0.003837827, 2.334154, 0.2313726, 0, 1, 1,
0.5670312, 0.9192861, 2.144418, 0.2352941, 0, 1, 1,
0.5689732, -0.7619858, 1.597779, 0.2431373, 0, 1, 1,
0.5690236, 1.532318, -0.005080624, 0.2470588, 0, 1, 1,
0.5732586, 0.2289329, 0.8537254, 0.254902, 0, 1, 1,
0.5803132, 0.6139538, 0.5089511, 0.2588235, 0, 1, 1,
0.5818875, 0.6858388, -0.1231359, 0.2666667, 0, 1, 1,
0.5847288, -1.13033, 2.916762, 0.2705882, 0, 1, 1,
0.5861314, -0.5626858, 2.53533, 0.2784314, 0, 1, 1,
0.5894814, 0.67164, 0.2251415, 0.282353, 0, 1, 1,
0.5902662, -0.5359344, 2.922263, 0.2901961, 0, 1, 1,
0.5942559, -0.3608802, 1.897915, 0.2941177, 0, 1, 1,
0.5966951, -0.0004179058, 1.205184, 0.3019608, 0, 1, 1,
0.5984012, 1.062427, -0.418295, 0.3098039, 0, 1, 1,
0.6060004, -0.4363028, 3.42464, 0.3137255, 0, 1, 1,
0.6100072, -0.5716002, 1.382391, 0.3215686, 0, 1, 1,
0.6100618, 0.5861809, 0.9209147, 0.3254902, 0, 1, 1,
0.6101699, -0.4865296, 2.474979, 0.3333333, 0, 1, 1,
0.621013, -0.1511382, 2.604231, 0.3372549, 0, 1, 1,
0.6269695, 0.557974, 2.323056, 0.345098, 0, 1, 1,
0.6275843, -1.527478, 2.537914, 0.3490196, 0, 1, 1,
0.6287766, 1.214086, 1.47079, 0.3568628, 0, 1, 1,
0.6302861, 0.6369335, 2.145515, 0.3607843, 0, 1, 1,
0.6316555, -0.9464968, 3.811752, 0.3686275, 0, 1, 1,
0.633951, 0.6600427, 1.175723, 0.372549, 0, 1, 1,
0.6352462, 0.2088874, 1.099729, 0.3803922, 0, 1, 1,
0.6362005, 0.4726548, 0.8260175, 0.3843137, 0, 1, 1,
0.6367297, 0.8937149, -0.2331371, 0.3921569, 0, 1, 1,
0.6505013, 0.3842343, -1.361277, 0.3960784, 0, 1, 1,
0.6547355, -0.1852768, 1.647711, 0.4039216, 0, 1, 1,
0.6575955, -1.038295, 2.659984, 0.4117647, 0, 1, 1,
0.6677797, 0.8273339, 2.522884, 0.4156863, 0, 1, 1,
0.6708499, -0.9008119, 3.461462, 0.4235294, 0, 1, 1,
0.6736693, -0.8085926, 1.701697, 0.427451, 0, 1, 1,
0.674933, 0.7085091, 0.2009934, 0.4352941, 0, 1, 1,
0.6758011, 0.05535967, 1.414386, 0.4392157, 0, 1, 1,
0.6794879, 0.7498482, 1.968577, 0.4470588, 0, 1, 1,
0.6855592, -0.2676452, 1.83531, 0.4509804, 0, 1, 1,
0.6903071, 0.3100212, 2.114233, 0.4588235, 0, 1, 1,
0.6945633, 0.1483179, -0.23193, 0.4627451, 0, 1, 1,
0.6969981, -1.827297, 2.124908, 0.4705882, 0, 1, 1,
0.6974092, -0.7980764, 2.372531, 0.4745098, 0, 1, 1,
0.6979458, 0.9206756, 0.6828737, 0.4823529, 0, 1, 1,
0.6983211, 1.87993, 0.06058306, 0.4862745, 0, 1, 1,
0.6990739, 0.2349278, -0.18483, 0.4941176, 0, 1, 1,
0.699539, 0.3245896, 0.5630704, 0.5019608, 0, 1, 1,
0.7021576, 0.2245857, 0.4173608, 0.5058824, 0, 1, 1,
0.7065465, 0.857864, -0.3422808, 0.5137255, 0, 1, 1,
0.7073098, 1.252536, 0.7401822, 0.5176471, 0, 1, 1,
0.7087939, 0.5049804, 0.4386685, 0.5254902, 0, 1, 1,
0.7092, 1.165039, 1.34488, 0.5294118, 0, 1, 1,
0.7123823, 1.248652, 0.3411373, 0.5372549, 0, 1, 1,
0.713694, 0.09186139, 1.535511, 0.5411765, 0, 1, 1,
0.7202848, -0.7914925, 3.690594, 0.5490196, 0, 1, 1,
0.7211316, -1.122734, 3.866898, 0.5529412, 0, 1, 1,
0.7242057, 0.811241, -1.20635, 0.5607843, 0, 1, 1,
0.732655, 0.1341723, 3.226987, 0.5647059, 0, 1, 1,
0.7330873, -0.4454786, 2.024777, 0.572549, 0, 1, 1,
0.7331595, 1.212433, -0.05109334, 0.5764706, 0, 1, 1,
0.7429975, 0.2217765, 0.7300441, 0.5843138, 0, 1, 1,
0.7435511, -0.111652, 2.536722, 0.5882353, 0, 1, 1,
0.7473282, -0.9355473, 1.989535, 0.5960785, 0, 1, 1,
0.7474247, 1.517949, 0.5525434, 0.6039216, 0, 1, 1,
0.7548481, -0.246855, 2.168508, 0.6078432, 0, 1, 1,
0.7571548, 0.1130187, 1.78697, 0.6156863, 0, 1, 1,
0.7621392, 0.5486532, 0.1880146, 0.6196079, 0, 1, 1,
0.763112, 1.997938, 0.03057968, 0.627451, 0, 1, 1,
0.7633701, 1.161014, -1.415948, 0.6313726, 0, 1, 1,
0.7655185, -0.6039248, 2.251565, 0.6392157, 0, 1, 1,
0.7655995, 0.1690561, 2.115578, 0.6431373, 0, 1, 1,
0.7666261, 0.4064511, 1.487122, 0.6509804, 0, 1, 1,
0.7734425, 0.6814139, 1.352629, 0.654902, 0, 1, 1,
0.7745941, 0.6030908, 1.581755, 0.6627451, 0, 1, 1,
0.782914, 1.679386, -0.4089985, 0.6666667, 0, 1, 1,
0.7831619, 1.880936, 0.8175018, 0.6745098, 0, 1, 1,
0.7938877, 1.830723, 1.521377, 0.6784314, 0, 1, 1,
0.7944114, 0.4177969, 0.1681778, 0.6862745, 0, 1, 1,
0.7960925, -1.597947, 1.894688, 0.6901961, 0, 1, 1,
0.7961629, -0.3762259, 2.135332, 0.6980392, 0, 1, 1,
0.8027552, -0.684765, 1.241039, 0.7058824, 0, 1, 1,
0.813822, -0.1209919, 0.419227, 0.7098039, 0, 1, 1,
0.8157889, 1.036423, -0.09144451, 0.7176471, 0, 1, 1,
0.8158435, 0.5457554, 0.5972409, 0.7215686, 0, 1, 1,
0.8220515, -0.1345722, 2.167058, 0.7294118, 0, 1, 1,
0.8235268, 0.5960769, 1.555372, 0.7333333, 0, 1, 1,
0.8279446, -0.8820668, 2.886141, 0.7411765, 0, 1, 1,
0.8281094, 0.01230108, 0.7462753, 0.7450981, 0, 1, 1,
0.8292438, 2.656815, 0.6814959, 0.7529412, 0, 1, 1,
0.8304861, 0.9214274, 0.7700548, 0.7568628, 0, 1, 1,
0.8312417, -0.9885135, 1.952106, 0.7647059, 0, 1, 1,
0.8324562, 0.2296219, 2.52457, 0.7686275, 0, 1, 1,
0.832494, -0.6790495, 2.614961, 0.7764706, 0, 1, 1,
0.8352717, 1.30493, 0.1233672, 0.7803922, 0, 1, 1,
0.8356283, 0.5084415, -0.614192, 0.7882353, 0, 1, 1,
0.8363498, -0.0988037, 0.7779465, 0.7921569, 0, 1, 1,
0.8412905, -1.2495, 4.754506, 0.8, 0, 1, 1,
0.8414803, -0.3597773, 3.150276, 0.8078431, 0, 1, 1,
0.842924, -0.6515416, 3.830427, 0.8117647, 0, 1, 1,
0.84607, -1.39323, 3.35405, 0.8196079, 0, 1, 1,
0.8475521, -1.496795, 2.079832, 0.8235294, 0, 1, 1,
0.8500312, -0.3745839, 1.581507, 0.8313726, 0, 1, 1,
0.8502381, 0.7625719, 1.610673, 0.8352941, 0, 1, 1,
0.8621534, 0.9281263, 1.599227, 0.8431373, 0, 1, 1,
0.8643436, -1.175171, 2.084995, 0.8470588, 0, 1, 1,
0.8662742, 1.560253, 0.4157503, 0.854902, 0, 1, 1,
0.8710037, -0.1750527, 3.044041, 0.8588235, 0, 1, 1,
0.8711267, 1.38469, -1.805991, 0.8666667, 0, 1, 1,
0.8810221, -1.356741, 2.575249, 0.8705882, 0, 1, 1,
0.8832685, 1.355316, 1.375138, 0.8784314, 0, 1, 1,
0.8862077, 1.578396, 0.5643232, 0.8823529, 0, 1, 1,
0.8884492, 0.3720625, 0.9485034, 0.8901961, 0, 1, 1,
0.8887421, -0.9115801, 1.971734, 0.8941177, 0, 1, 1,
0.8900142, -0.7425602, 2.40965, 0.9019608, 0, 1, 1,
0.8971294, 0.261462, 1.850851, 0.9098039, 0, 1, 1,
0.899904, -0.9573721, 2.870219, 0.9137255, 0, 1, 1,
0.9013265, -1.520802, 2.948907, 0.9215686, 0, 1, 1,
0.9039555, 0.7941902, 0.05517042, 0.9254902, 0, 1, 1,
0.9041381, 0.3866425, -0.6987926, 0.9333333, 0, 1, 1,
0.929256, -1.617391, 1.567647, 0.9372549, 0, 1, 1,
0.9305076, 0.2682784, 1.301186, 0.945098, 0, 1, 1,
0.9363104, 0.9313893, 0.06350892, 0.9490196, 0, 1, 1,
0.9385068, 0.2825894, 0.5012226, 0.9568627, 0, 1, 1,
0.9440097, 1.988535, -0.57313, 0.9607843, 0, 1, 1,
0.9505247, 0.4125559, 0.454835, 0.9686275, 0, 1, 1,
0.9561396, -1.199885, 2.083765, 0.972549, 0, 1, 1,
0.9654751, 0.08262116, 1.186806, 0.9803922, 0, 1, 1,
0.9656734, -0.5175583, 2.477984, 0.9843137, 0, 1, 1,
0.9667526, 1.794231, -0.1007968, 0.9921569, 0, 1, 1,
0.9702468, 1.256678, 1.197666, 0.9960784, 0, 1, 1,
0.9709506, -0.9688525, 2.91092, 1, 0, 0.9960784, 1,
0.9744427, 1.656162, 1.209355, 1, 0, 0.9882353, 1,
0.9808491, -0.5491121, 2.064716, 1, 0, 0.9843137, 1,
0.9835755, -0.6072782, 3.742501, 1, 0, 0.9764706, 1,
0.9870247, 0.6240146, 1.738915, 1, 0, 0.972549, 1,
0.9891884, -0.335674, 1.806819, 1, 0, 0.9647059, 1,
0.9941927, 0.4965939, 0.8269076, 1, 0, 0.9607843, 1,
0.9972607, 0.5971829, 1.889451, 1, 0, 0.9529412, 1,
1.009028, 2.484087, 0.4687831, 1, 0, 0.9490196, 1,
1.01627, 0.03711393, 1.371049, 1, 0, 0.9411765, 1,
1.017941, -1.541173, 2.292673, 1, 0, 0.9372549, 1,
1.024937, -0.194686, 2.140346, 1, 0, 0.9294118, 1,
1.029792, 1.644513, 0.8480108, 1, 0, 0.9254902, 1,
1.035748, 1.27733, 1.555581, 1, 0, 0.9176471, 1,
1.046764, -1.478356, 1.527221, 1, 0, 0.9137255, 1,
1.047788, -1.925136, 3.510526, 1, 0, 0.9058824, 1,
1.055455, -0.4284191, 1.188337, 1, 0, 0.9019608, 1,
1.056987, -1.622572, 3.269419, 1, 0, 0.8941177, 1,
1.058557, 0.6984497, 1.492043, 1, 0, 0.8862745, 1,
1.065581, 0.879476, 1.351459, 1, 0, 0.8823529, 1,
1.068418, 1.013473, 1.379307, 1, 0, 0.8745098, 1,
1.070069, 1.461209, 1.059868, 1, 0, 0.8705882, 1,
1.085255, 1.014257, 1.231107, 1, 0, 0.8627451, 1,
1.090835, 0.04655189, -0.1144698, 1, 0, 0.8588235, 1,
1.09158, 1.108612, 1.715198, 1, 0, 0.8509804, 1,
1.091607, 1.682459, -1.065021, 1, 0, 0.8470588, 1,
1.100998, -0.4801538, 3.162777, 1, 0, 0.8392157, 1,
1.101833, -0.9423501, 1.1714, 1, 0, 0.8352941, 1,
1.104312, -0.6489502, 0.8253391, 1, 0, 0.827451, 1,
1.112777, 0.8451468, -0.4788686, 1, 0, 0.8235294, 1,
1.119945, 0.7505823, 2.293448, 1, 0, 0.8156863, 1,
1.121423, -0.4818258, 3.265351, 1, 0, 0.8117647, 1,
1.123637, -0.5650101, 2.740186, 1, 0, 0.8039216, 1,
1.132289, 2.191103, 1.159603, 1, 0, 0.7960784, 1,
1.134117, 0.5154939, 1.945852, 1, 0, 0.7921569, 1,
1.142628, 0.4325967, 0.6965532, 1, 0, 0.7843137, 1,
1.148686, -0.1489582, 0.8748996, 1, 0, 0.7803922, 1,
1.157377, -0.4384629, 1.303386, 1, 0, 0.772549, 1,
1.158548, -1.390027, 1.770354, 1, 0, 0.7686275, 1,
1.174795, -0.838721, 2.221124, 1, 0, 0.7607843, 1,
1.176894, 2.147461, -1.276109, 1, 0, 0.7568628, 1,
1.179423, 0.3325713, 2.376449, 1, 0, 0.7490196, 1,
1.186314, -1.369243, 3.167081, 1, 0, 0.7450981, 1,
1.18787, 0.982631, -1.230942, 1, 0, 0.7372549, 1,
1.19411, -0.429289, 3.146544, 1, 0, 0.7333333, 1,
1.196401, -0.662513, 2.068027, 1, 0, 0.7254902, 1,
1.208188, -0.4959698, 1.772536, 1, 0, 0.7215686, 1,
1.218201, -0.1497456, 0.8549809, 1, 0, 0.7137255, 1,
1.221759, 2.474838, 0.6917901, 1, 0, 0.7098039, 1,
1.223033, -2.192458, 2.08448, 1, 0, 0.7019608, 1,
1.224585, -0.02588168, 3.092797, 1, 0, 0.6941177, 1,
1.22538, 0.2977816, 1.86773, 1, 0, 0.6901961, 1,
1.225384, 0.2737022, 1.467473, 1, 0, 0.682353, 1,
1.227316, 0.8634789, 0.7937077, 1, 0, 0.6784314, 1,
1.231706, -0.7659645, 1.84298, 1, 0, 0.6705883, 1,
1.251476, -1.677134, 2.2926, 1, 0, 0.6666667, 1,
1.253281, 0.07222842, 2.833675, 1, 0, 0.6588235, 1,
1.254067, -0.2815659, 1.623306, 1, 0, 0.654902, 1,
1.260218, -1.670626, 3.354386, 1, 0, 0.6470588, 1,
1.267247, -1.987469, 3.971065, 1, 0, 0.6431373, 1,
1.285521, 0.1447616, 2.014, 1, 0, 0.6352941, 1,
1.287013, 1.123002, 0.7395649, 1, 0, 0.6313726, 1,
1.287668, 0.1047297, 1.085888, 1, 0, 0.6235294, 1,
1.289027, 0.5702977, 2.147028, 1, 0, 0.6196079, 1,
1.299035, 0.08901634, 2.590356, 1, 0, 0.6117647, 1,
1.311045, 1.6387, -0.4988061, 1, 0, 0.6078432, 1,
1.31404, 2.679651, 1.966536, 1, 0, 0.6, 1,
1.314679, -0.05023129, 1.099051, 1, 0, 0.5921569, 1,
1.320349, 0.9863681, -0.0141088, 1, 0, 0.5882353, 1,
1.321523, -2.772862, 0.9281864, 1, 0, 0.5803922, 1,
1.322309, 0.5123995, 2.47507, 1, 0, 0.5764706, 1,
1.345926, 0.1851318, 1.619788, 1, 0, 0.5686275, 1,
1.352918, 0.02651383, 0.2176841, 1, 0, 0.5647059, 1,
1.355347, -1.114093, 2.780715, 1, 0, 0.5568628, 1,
1.365489, 0.9769084, 1.319982, 1, 0, 0.5529412, 1,
1.375852, 0.2828893, 0.2004021, 1, 0, 0.5450981, 1,
1.377186, -0.5687487, 1.922747, 1, 0, 0.5411765, 1,
1.382832, 0.6068139, -0.8506635, 1, 0, 0.5333334, 1,
1.383427, 1.046145, 1.266965, 1, 0, 0.5294118, 1,
1.393867, -0.564908, 1.829356, 1, 0, 0.5215687, 1,
1.396866, -0.558308, 1.754124, 1, 0, 0.5176471, 1,
1.398407, 1.295437, 1.48883, 1, 0, 0.509804, 1,
1.416677, 1.187275, 1.756139, 1, 0, 0.5058824, 1,
1.417849, 0.1139436, 0.7317848, 1, 0, 0.4980392, 1,
1.421047, 0.07911553, 0.9885855, 1, 0, 0.4901961, 1,
1.432569, 0.7969541, -0.1928412, 1, 0, 0.4862745, 1,
1.442433, -0.06386902, 1.381562, 1, 0, 0.4784314, 1,
1.443459, -1.241914, -1.750993, 1, 0, 0.4745098, 1,
1.458606, 0.2352318, 0.7060768, 1, 0, 0.4666667, 1,
1.461466, -0.2048074, 1.279131, 1, 0, 0.4627451, 1,
1.463507, 0.1471802, 0.1923593, 1, 0, 0.454902, 1,
1.476879, -0.2307774, 1.823506, 1, 0, 0.4509804, 1,
1.483721, 0.2503814, 1.675545, 1, 0, 0.4431373, 1,
1.485362, -0.5353426, 2.798191, 1, 0, 0.4392157, 1,
1.502646, -0.109449, 1.827381, 1, 0, 0.4313726, 1,
1.543874, -0.4152451, 1.699437, 1, 0, 0.427451, 1,
1.55413, 0.3833875, 1.253123, 1, 0, 0.4196078, 1,
1.563624, 0.1296139, 0.5612783, 1, 0, 0.4156863, 1,
1.569841, -0.3760369, 1.915605, 1, 0, 0.4078431, 1,
1.575121, -2.069674, 2.913356, 1, 0, 0.4039216, 1,
1.586643, 0.2911612, 1.435306, 1, 0, 0.3960784, 1,
1.587083, 0.6484665, 1.995216, 1, 0, 0.3882353, 1,
1.611746, 0.6276055, 1.170808, 1, 0, 0.3843137, 1,
1.624897, -0.4555674, 2.165252, 1, 0, 0.3764706, 1,
1.62588, -0.05573799, 1.039198, 1, 0, 0.372549, 1,
1.627054, -0.5823762, 0.8915766, 1, 0, 0.3647059, 1,
1.641075, 1.073226, 0.07429162, 1, 0, 0.3607843, 1,
1.654087, -0.1255605, 2.20789, 1, 0, 0.3529412, 1,
1.663769, -0.7530888, 1.603632, 1, 0, 0.3490196, 1,
1.665804, -0.5342198, 1.45976, 1, 0, 0.3411765, 1,
1.700007, 1.779749, 0.2145444, 1, 0, 0.3372549, 1,
1.700016, 0.4486578, 2.77227, 1, 0, 0.3294118, 1,
1.704582, 1.432479, 0.2510546, 1, 0, 0.3254902, 1,
1.718595, 2.307279, 1.483469, 1, 0, 0.3176471, 1,
1.726319, 0.7884196, 1.236702, 1, 0, 0.3137255, 1,
1.730086, 0.8757612, 0.7469444, 1, 0, 0.3058824, 1,
1.737371, 0.3184708, 2.961568, 1, 0, 0.2980392, 1,
1.747406, 0.01760079, 1.262189, 1, 0, 0.2941177, 1,
1.759637, -0.1111873, 0.809982, 1, 0, 0.2862745, 1,
1.766795, 0.8465169, -0.4096682, 1, 0, 0.282353, 1,
1.79168, 0.4512657, 1.515933, 1, 0, 0.2745098, 1,
1.792513, -0.3801247, 4.802789, 1, 0, 0.2705882, 1,
1.794436, 0.8565571, 0.1328722, 1, 0, 0.2627451, 1,
1.8235, -0.1296593, 0.8504623, 1, 0, 0.2588235, 1,
1.824705, 0.8668662, 1.587229, 1, 0, 0.2509804, 1,
1.833801, 1.966545, 1.545595, 1, 0, 0.2470588, 1,
1.893297, 1.611261, 0.1909305, 1, 0, 0.2392157, 1,
1.899839, 0.1539017, 0.1450652, 1, 0, 0.2352941, 1,
1.919465, -1.034367, 2.021139, 1, 0, 0.227451, 1,
1.952006, -1.560528, 2.483041, 1, 0, 0.2235294, 1,
1.958715, -0.6798697, 3.215908, 1, 0, 0.2156863, 1,
1.962427, 0.4051851, 0.8569585, 1, 0, 0.2117647, 1,
1.969553, 0.6388227, 1.646478, 1, 0, 0.2039216, 1,
1.98512, -0.09812005, 2.525251, 1, 0, 0.1960784, 1,
1.997765, 0.2635089, 1.942491, 1, 0, 0.1921569, 1,
1.999847, -0.2797382, 1.735173, 1, 0, 0.1843137, 1,
2.003253, -0.188362, -0.9874085, 1, 0, 0.1803922, 1,
2.047197, -0.9854105, 2.776253, 1, 0, 0.172549, 1,
2.054898, 0.4098211, 0.563976, 1, 0, 0.1686275, 1,
2.057667, -0.3538261, 2.905063, 1, 0, 0.1607843, 1,
2.064526, 1.500221, -0.3265831, 1, 0, 0.1568628, 1,
2.065254, -0.7952818, 2.553738, 1, 0, 0.1490196, 1,
2.075165, -0.3883795, 2.764274, 1, 0, 0.145098, 1,
2.113681, 0.438824, 1.210702, 1, 0, 0.1372549, 1,
2.116222, 0.8705783, 0.8242421, 1, 0, 0.1333333, 1,
2.147005, 0.509073, 1.329333, 1, 0, 0.1254902, 1,
2.156096, -2.022288, 1.3196, 1, 0, 0.1215686, 1,
2.17873, -0.1272524, 1.777352, 1, 0, 0.1137255, 1,
2.186047, 0.5037683, 1.407633, 1, 0, 0.1098039, 1,
2.200881, -0.8088835, 2.124925, 1, 0, 0.1019608, 1,
2.213657, -0.3226406, 1.261223, 1, 0, 0.09411765, 1,
2.215632, 0.2789081, 1.169751, 1, 0, 0.09019608, 1,
2.215829, 0.4630356, 2.913583, 1, 0, 0.08235294, 1,
2.229544, 1.095835, 1.296971, 1, 0, 0.07843138, 1,
2.268955, -0.7108973, 3.736474, 1, 0, 0.07058824, 1,
2.27305, -0.007270882, 1.496728, 1, 0, 0.06666667, 1,
2.285843, 0.1211615, 1.117855, 1, 0, 0.05882353, 1,
2.287343, -1.752203, 3.388946, 1, 0, 0.05490196, 1,
2.356222, -1.708786, 2.268849, 1, 0, 0.04705882, 1,
2.392262, 0.5719726, 1.197556, 1, 0, 0.04313726, 1,
2.404478, 0.4157884, 1.446207, 1, 0, 0.03529412, 1,
2.467556, 1.029884, 0.8612011, 1, 0, 0.03137255, 1,
2.496978, -0.8740361, 1.807345, 1, 0, 0.02352941, 1,
2.559317, 0.7589578, 1.122962, 1, 0, 0.01960784, 1,
2.654506, -0.3467398, 2.212173, 1, 0, 0.01176471, 1,
2.72172, -0.469233, 2.293023, 1, 0, 0.007843138, 1
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
-0.7261018, -4.548831, -7.656353, 0, -0.5, 0.5, 0.5,
-0.7261018, -4.548831, -7.656353, 1, -0.5, 0.5, 0.5,
-0.7261018, -4.548831, -7.656353, 1, 1.5, 0.5, 0.5,
-0.7261018, -4.548831, -7.656353, 0, 1.5, 0.5, 0.5
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
-5.342735, -0.2533425, -7.656353, 0, -0.5, 0.5, 0.5,
-5.342735, -0.2533425, -7.656353, 1, -0.5, 0.5, 0.5,
-5.342735, -0.2533425, -7.656353, 1, 1.5, 0.5, 0.5,
-5.342735, -0.2533425, -7.656353, 0, 1.5, 0.5, 0.5
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
-5.342735, -4.548831, -0.2365801, 0, -0.5, 0.5, 0.5,
-5.342735, -4.548831, -0.2365801, 1, -0.5, 0.5, 0.5,
-5.342735, -4.548831, -0.2365801, 1, 1.5, 0.5, 0.5,
-5.342735, -4.548831, -0.2365801, 0, 1.5, 0.5, 0.5
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
-4, -3.557564, -5.944098,
2, -3.557564, -5.944098,
-4, -3.557564, -5.944098,
-4, -3.722775, -6.229474,
-3, -3.557564, -5.944098,
-3, -3.722775, -6.229474,
-2, -3.557564, -5.944098,
-2, -3.722775, -6.229474,
-1, -3.557564, -5.944098,
-1, -3.722775, -6.229474,
0, -3.557564, -5.944098,
0, -3.722775, -6.229474,
1, -3.557564, -5.944098,
1, -3.722775, -6.229474,
2, -3.557564, -5.944098,
2, -3.722775, -6.229474
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
"-3",
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
-4, -4.053198, -6.800225, 0, -0.5, 0.5, 0.5,
-4, -4.053198, -6.800225, 1, -0.5, 0.5, 0.5,
-4, -4.053198, -6.800225, 1, 1.5, 0.5, 0.5,
-4, -4.053198, -6.800225, 0, 1.5, 0.5, 0.5,
-3, -4.053198, -6.800225, 0, -0.5, 0.5, 0.5,
-3, -4.053198, -6.800225, 1, -0.5, 0.5, 0.5,
-3, -4.053198, -6.800225, 1, 1.5, 0.5, 0.5,
-3, -4.053198, -6.800225, 0, 1.5, 0.5, 0.5,
-2, -4.053198, -6.800225, 0, -0.5, 0.5, 0.5,
-2, -4.053198, -6.800225, 1, -0.5, 0.5, 0.5,
-2, -4.053198, -6.800225, 1, 1.5, 0.5, 0.5,
-2, -4.053198, -6.800225, 0, 1.5, 0.5, 0.5,
-1, -4.053198, -6.800225, 0, -0.5, 0.5, 0.5,
-1, -4.053198, -6.800225, 1, -0.5, 0.5, 0.5,
-1, -4.053198, -6.800225, 1, 1.5, 0.5, 0.5,
-1, -4.053198, -6.800225, 0, 1.5, 0.5, 0.5,
0, -4.053198, -6.800225, 0, -0.5, 0.5, 0.5,
0, -4.053198, -6.800225, 1, -0.5, 0.5, 0.5,
0, -4.053198, -6.800225, 1, 1.5, 0.5, 0.5,
0, -4.053198, -6.800225, 0, 1.5, 0.5, 0.5,
1, -4.053198, -6.800225, 0, -0.5, 0.5, 0.5,
1, -4.053198, -6.800225, 1, -0.5, 0.5, 0.5,
1, -4.053198, -6.800225, 1, 1.5, 0.5, 0.5,
1, -4.053198, -6.800225, 0, 1.5, 0.5, 0.5,
2, -4.053198, -6.800225, 0, -0.5, 0.5, 0.5,
2, -4.053198, -6.800225, 1, -0.5, 0.5, 0.5,
2, -4.053198, -6.800225, 1, 1.5, 0.5, 0.5,
2, -4.053198, -6.800225, 0, 1.5, 0.5, 0.5
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
-4.277358, -3, -5.944098,
-4.277358, 2, -5.944098,
-4.277358, -3, -5.944098,
-4.454921, -3, -6.229474,
-4.277358, -2, -5.944098,
-4.454921, -2, -6.229474,
-4.277358, -1, -5.944098,
-4.454921, -1, -6.229474,
-4.277358, 0, -5.944098,
-4.454921, 0, -6.229474,
-4.277358, 1, -5.944098,
-4.454921, 1, -6.229474,
-4.277358, 2, -5.944098,
-4.454921, 2, -6.229474
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
-4.810047, -3, -6.800225, 0, -0.5, 0.5, 0.5,
-4.810047, -3, -6.800225, 1, -0.5, 0.5, 0.5,
-4.810047, -3, -6.800225, 1, 1.5, 0.5, 0.5,
-4.810047, -3, -6.800225, 0, 1.5, 0.5, 0.5,
-4.810047, -2, -6.800225, 0, -0.5, 0.5, 0.5,
-4.810047, -2, -6.800225, 1, -0.5, 0.5, 0.5,
-4.810047, -2, -6.800225, 1, 1.5, 0.5, 0.5,
-4.810047, -2, -6.800225, 0, 1.5, 0.5, 0.5,
-4.810047, -1, -6.800225, 0, -0.5, 0.5, 0.5,
-4.810047, -1, -6.800225, 1, -0.5, 0.5, 0.5,
-4.810047, -1, -6.800225, 1, 1.5, 0.5, 0.5,
-4.810047, -1, -6.800225, 0, 1.5, 0.5, 0.5,
-4.810047, 0, -6.800225, 0, -0.5, 0.5, 0.5,
-4.810047, 0, -6.800225, 1, -0.5, 0.5, 0.5,
-4.810047, 0, -6.800225, 1, 1.5, 0.5, 0.5,
-4.810047, 0, -6.800225, 0, 1.5, 0.5, 0.5,
-4.810047, 1, -6.800225, 0, -0.5, 0.5, 0.5,
-4.810047, 1, -6.800225, 1, -0.5, 0.5, 0.5,
-4.810047, 1, -6.800225, 1, 1.5, 0.5, 0.5,
-4.810047, 1, -6.800225, 0, 1.5, 0.5, 0.5,
-4.810047, 2, -6.800225, 0, -0.5, 0.5, 0.5,
-4.810047, 2, -6.800225, 1, -0.5, 0.5, 0.5,
-4.810047, 2, -6.800225, 1, 1.5, 0.5, 0.5,
-4.810047, 2, -6.800225, 0, 1.5, 0.5, 0.5
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
-4.277358, -3.557564, -4,
-4.277358, -3.557564, 4,
-4.277358, -3.557564, -4,
-4.454921, -3.722775, -4,
-4.277358, -3.557564, -2,
-4.454921, -3.722775, -2,
-4.277358, -3.557564, 0,
-4.454921, -3.722775, 0,
-4.277358, -3.557564, 2,
-4.454921, -3.722775, 2,
-4.277358, -3.557564, 4,
-4.454921, -3.722775, 4
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
-4.810047, -4.053198, -4, 0, -0.5, 0.5, 0.5,
-4.810047, -4.053198, -4, 1, -0.5, 0.5, 0.5,
-4.810047, -4.053198, -4, 1, 1.5, 0.5, 0.5,
-4.810047, -4.053198, -4, 0, 1.5, 0.5, 0.5,
-4.810047, -4.053198, -2, 0, -0.5, 0.5, 0.5,
-4.810047, -4.053198, -2, 1, -0.5, 0.5, 0.5,
-4.810047, -4.053198, -2, 1, 1.5, 0.5, 0.5,
-4.810047, -4.053198, -2, 0, 1.5, 0.5, 0.5,
-4.810047, -4.053198, 0, 0, -0.5, 0.5, 0.5,
-4.810047, -4.053198, 0, 1, -0.5, 0.5, 0.5,
-4.810047, -4.053198, 0, 1, 1.5, 0.5, 0.5,
-4.810047, -4.053198, 0, 0, 1.5, 0.5, 0.5,
-4.810047, -4.053198, 2, 0, -0.5, 0.5, 0.5,
-4.810047, -4.053198, 2, 1, -0.5, 0.5, 0.5,
-4.810047, -4.053198, 2, 1, 1.5, 0.5, 0.5,
-4.810047, -4.053198, 2, 0, 1.5, 0.5, 0.5,
-4.810047, -4.053198, 4, 0, -0.5, 0.5, 0.5,
-4.810047, -4.053198, 4, 1, -0.5, 0.5, 0.5,
-4.810047, -4.053198, 4, 1, 1.5, 0.5, 0.5,
-4.810047, -4.053198, 4, 0, 1.5, 0.5, 0.5
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
-4.277358, -3.557564, -5.944098,
-4.277358, 3.050879, -5.944098,
-4.277358, -3.557564, 5.470937,
-4.277358, 3.050879, 5.470937,
-4.277358, -3.557564, -5.944098,
-4.277358, -3.557564, 5.470937,
-4.277358, 3.050879, -5.944098,
-4.277358, 3.050879, 5.470937,
-4.277358, -3.557564, -5.944098,
2.825155, -3.557564, -5.944098,
-4.277358, -3.557564, 5.470937,
2.825155, -3.557564, 5.470937,
-4.277358, 3.050879, -5.944098,
2.825155, 3.050879, -5.944098,
-4.277358, 3.050879, 5.470937,
2.825155, 3.050879, 5.470937,
2.825155, -3.557564, -5.944098,
2.825155, 3.050879, -5.944098,
2.825155, -3.557564, 5.470937,
2.825155, 3.050879, 5.470937,
2.825155, -3.557564, -5.944098,
2.825155, -3.557564, 5.470937,
2.825155, 3.050879, -5.944098,
2.825155, 3.050879, 5.470937
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
var radius = 7.999383;
var distance = 35.59016;
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
mvMatrix.translate( 0.7261018, 0.2533425, 0.2365801 );
mvMatrix.scale( 1.217751, 1.308794, 0.7576928 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.59016);
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
eleven<-read.table("eleven.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-eleven$V2
```

```
## Error in eval(expr, envir, enclos): object 'eleven' not found
```

```r
y<-eleven$V3
```

```
## Error in eval(expr, envir, enclos): object 'eleven' not found
```

```r
z<-eleven$V4
```

```
## Error in eval(expr, envir, enclos): object 'eleven' not found
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
-4.173923, 2.169789, -0.3263354, 0, 0, 1, 1, 1,
-3.60301, 0.1920218, -0.8322986, 1, 0, 0, 1, 1,
-3.524976, -2.161011, -1.847563, 1, 0, 0, 1, 1,
-3.079969, 0.0115536, -0.09642579, 1, 0, 0, 1, 1,
-2.790793, 0.4026541, -1.636849, 1, 0, 0, 1, 1,
-2.729844, 0.7847706, -2.658204, 1, 0, 0, 1, 1,
-2.680053, -0.427858, -1.6343, 0, 0, 0, 1, 1,
-2.672434, 1.600104, -1.432125, 0, 0, 0, 1, 1,
-2.652086, -0.2426483, -3.491685, 0, 0, 0, 1, 1,
-2.61115, 0.7378703, 1.046906, 0, 0, 0, 1, 1,
-2.596564, -2.400549, -1.584282, 0, 0, 0, 1, 1,
-2.485654, -0.1175714, -2.539521, 0, 0, 0, 1, 1,
-2.462447, 1.990472, -1.415458, 0, 0, 0, 1, 1,
-2.458381, 0.831028, -0.9350796, 1, 1, 1, 1, 1,
-2.411493, 0.4608216, -1.785157, 1, 1, 1, 1, 1,
-2.384273, 1.98455, -0.3275603, 1, 1, 1, 1, 1,
-2.352062, 0.9940751, -0.3828352, 1, 1, 1, 1, 1,
-2.298724, -0.4890405, 0.06171001, 1, 1, 1, 1, 1,
-2.238348, -0.3160757, -2.191592, 1, 1, 1, 1, 1,
-2.229035, 0.02358868, -1.420682, 1, 1, 1, 1, 1,
-2.227836, -0.7592851, -2.445656, 1, 1, 1, 1, 1,
-2.195199, -1.199219, -2.283003, 1, 1, 1, 1, 1,
-2.18224, 0.9599014, -2.340612, 1, 1, 1, 1, 1,
-2.140777, -0.7805364, -1.882001, 1, 1, 1, 1, 1,
-2.113061, -0.455383, 0.2800352, 1, 1, 1, 1, 1,
-2.098724, 0.4356961, -2.586207, 1, 1, 1, 1, 1,
-2.077308, 0.9583104, -1.413631, 1, 1, 1, 1, 1,
-2.036993, 1.243745, 0.07876743, 1, 1, 1, 1, 1,
-2.01647, -1.826076, -1.180894, 0, 0, 1, 1, 1,
-1.992473, 0.2058358, -2.205368, 1, 0, 0, 1, 1,
-1.990646, -0.5474743, -2.076768, 1, 0, 0, 1, 1,
-1.988098, 0.04261543, -2.572929, 1, 0, 0, 1, 1,
-1.965152, -0.5555242, -1.49919, 1, 0, 0, 1, 1,
-1.963461, 0.1575427, -0.321599, 1, 0, 0, 1, 1,
-1.955721, 0.2911286, -1.453125, 0, 0, 0, 1, 1,
-1.954234, 0.2379969, -1.528244, 0, 0, 0, 1, 1,
-1.941738, 1.47911, -2.087356, 0, 0, 0, 1, 1,
-1.931546, -0.934583, -0.8724065, 0, 0, 0, 1, 1,
-1.903455, -0.6227041, -1.282953, 0, 0, 0, 1, 1,
-1.884973, 0.2025141, -2.034662, 0, 0, 0, 1, 1,
-1.884664, 1.406415, -0.9798414, 0, 0, 0, 1, 1,
-1.878814, -0.3141864, -2.153314, 1, 1, 1, 1, 1,
-1.875078, -1.023529, -1.876017, 1, 1, 1, 1, 1,
-1.847484, 1.935758, -0.5830734, 1, 1, 1, 1, 1,
-1.832076, -2.087425, -2.103762, 1, 1, 1, 1, 1,
-1.830094, 0.7873318, -1.251958, 1, 1, 1, 1, 1,
-1.829867, 0.9527526, -0.3682778, 1, 1, 1, 1, 1,
-1.821535, -1.577816, -4.547905, 1, 1, 1, 1, 1,
-1.817, 1.883708, 0.9667706, 1, 1, 1, 1, 1,
-1.772437, 0.4552757, -0.1491816, 1, 1, 1, 1, 1,
-1.769102, -1.472063, -1.162036, 1, 1, 1, 1, 1,
-1.76873, -1.466614, -2.618428, 1, 1, 1, 1, 1,
-1.764082, -0.7616056, -3.738837, 1, 1, 1, 1, 1,
-1.748572, -1.317476, -3.071207, 1, 1, 1, 1, 1,
-1.723416, -0.3036664, -2.384849, 1, 1, 1, 1, 1,
-1.709901, -0.8453982, -0.6623115, 1, 1, 1, 1, 1,
-1.70716, -0.1191033, -1.254582, 0, 0, 1, 1, 1,
-1.691912, 1.579921, 1.151444, 1, 0, 0, 1, 1,
-1.688605, 1.585914, 0.274997, 1, 0, 0, 1, 1,
-1.684439, 1.358536, -1.344169, 1, 0, 0, 1, 1,
-1.669097, -0.4821342, -1.383299, 1, 0, 0, 1, 1,
-1.663617, -1.680419, -2.397471, 1, 0, 0, 1, 1,
-1.655576, -0.02591584, 0.7414395, 0, 0, 0, 1, 1,
-1.652084, 1.270312, -1.472881, 0, 0, 0, 1, 1,
-1.650762, 0.9331775, -2.271372, 0, 0, 0, 1, 1,
-1.616076, -0.06315445, -2.675586, 0, 0, 0, 1, 1,
-1.614933, 0.2077774, -1.960103, 0, 0, 0, 1, 1,
-1.610333, -3.461325, -2.367483, 0, 0, 0, 1, 1,
-1.598446, -2.266975, -2.083064, 0, 0, 0, 1, 1,
-1.594607, 0.5056348, -1.383063, 1, 1, 1, 1, 1,
-1.591963, -0.04003812, -2.22173, 1, 1, 1, 1, 1,
-1.588568, 0.2312577, -1.629652, 1, 1, 1, 1, 1,
-1.584575, 2.018268, -2.322286, 1, 1, 1, 1, 1,
-1.562142, -0.1022686, 0.1596157, 1, 1, 1, 1, 1,
-1.556334, -0.2011587, -1.750095, 1, 1, 1, 1, 1,
-1.548995, 0.3112597, -1.677815, 1, 1, 1, 1, 1,
-1.543479, 0.5304406, -1.135912, 1, 1, 1, 1, 1,
-1.522672, 0.4182181, -1.976512, 1, 1, 1, 1, 1,
-1.520848, -0.6914754, -3.01534, 1, 1, 1, 1, 1,
-1.514696, 0.5187221, -0.4011679, 1, 1, 1, 1, 1,
-1.512405, -1.208408, -2.586655, 1, 1, 1, 1, 1,
-1.510945, -2.048776, -3.944188, 1, 1, 1, 1, 1,
-1.506378, 1.128442, -1.359528, 1, 1, 1, 1, 1,
-1.48868, 2.376191, -3.314336, 1, 1, 1, 1, 1,
-1.484035, 0.9959305, 0.2089277, 0, 0, 1, 1, 1,
-1.477256, 1.484226, -1.439091, 1, 0, 0, 1, 1,
-1.467473, 1.8417, -0.1655298, 1, 0, 0, 1, 1,
-1.458319, 0.916367, -1.928855, 1, 0, 0, 1, 1,
-1.457297, 0.05380659, -2.443379, 1, 0, 0, 1, 1,
-1.457114, -0.2774007, -3.074184, 1, 0, 0, 1, 1,
-1.45197, -0.5506945, -0.3747815, 0, 0, 0, 1, 1,
-1.437762, -0.2061939, -1.82869, 0, 0, 0, 1, 1,
-1.4373, 0.5923922, -0.5706736, 0, 0, 0, 1, 1,
-1.435505, 1.016848, -1.406296, 0, 0, 0, 1, 1,
-1.416133, -1.36744, -3.023888, 0, 0, 0, 1, 1,
-1.365517, -0.1035799, -1.6137, 0, 0, 0, 1, 1,
-1.354162, 0.02693213, -0.402898, 0, 0, 0, 1, 1,
-1.338502, -0.4105914, -2.022512, 1, 1, 1, 1, 1,
-1.327535, 0.264062, -0.7369208, 1, 1, 1, 1, 1,
-1.319335, -1.77993, -1.787845, 1, 1, 1, 1, 1,
-1.317513, -0.4486482, -2.317394, 1, 1, 1, 1, 1,
-1.307985, 0.4617875, -0.5242797, 1, 1, 1, 1, 1,
-1.295583, 0.7968045, -1.543339, 1, 1, 1, 1, 1,
-1.286525, -0.8352629, -1.599124, 1, 1, 1, 1, 1,
-1.279233, 0.9975652, 0.4392984, 1, 1, 1, 1, 1,
-1.275714, -0.1919915, -2.734841, 1, 1, 1, 1, 1,
-1.273254, -0.01525705, -3.734968, 1, 1, 1, 1, 1,
-1.266373, -0.3247521, -0.2903236, 1, 1, 1, 1, 1,
-1.265319, -0.2112263, -1.654553, 1, 1, 1, 1, 1,
-1.262559, -0.3158312, -0.5859299, 1, 1, 1, 1, 1,
-1.256503, 1.216465, -0.5875989, 1, 1, 1, 1, 1,
-1.249379, 0.07723393, -1.678219, 1, 1, 1, 1, 1,
-1.240978, -0.9788873, -2.259435, 0, 0, 1, 1, 1,
-1.236637, 0.3736755, -0.6183916, 1, 0, 0, 1, 1,
-1.236042, -1.587845, -2.732832, 1, 0, 0, 1, 1,
-1.22163, -0.1831284, -1.675839, 1, 0, 0, 1, 1,
-1.218963, -1.145604, -1.592227, 1, 0, 0, 1, 1,
-1.210409, 0.9404364, -0.3314999, 1, 0, 0, 1, 1,
-1.19242, -0.05735857, -0.814893, 0, 0, 0, 1, 1,
-1.175352, -0.4321415, -3.705765, 0, 0, 0, 1, 1,
-1.174739, 0.6175447, -1.18321, 0, 0, 0, 1, 1,
-1.174235, 1.112439, 0.560148, 0, 0, 0, 1, 1,
-1.172559, 1.190736, -2.858079, 0, 0, 0, 1, 1,
-1.17087, -0.9217844, -0.3353737, 0, 0, 0, 1, 1,
-1.15744, -1.165995, -1.014713, 0, 0, 0, 1, 1,
-1.157264, 0.6432771, -1.177464, 1, 1, 1, 1, 1,
-1.155862, -0.2523837, -2.203421, 1, 1, 1, 1, 1,
-1.141642, -0.7782186, -3.80869, 1, 1, 1, 1, 1,
-1.121671, -0.8225524, -2.774023, 1, 1, 1, 1, 1,
-1.120102, -1.221842, -2.874148, 1, 1, 1, 1, 1,
-1.118048, -1.031058, -1.828033, 1, 1, 1, 1, 1,
-1.112995, 0.2821567, -0.4242339, 1, 1, 1, 1, 1,
-1.111368, -0.7580866, -2.555448, 1, 1, 1, 1, 1,
-1.11015, 0.2687038, -1.778577, 1, 1, 1, 1, 1,
-1.10603, 1.382378, -0.3597763, 1, 1, 1, 1, 1,
-1.103019, -1.600824, -2.969627, 1, 1, 1, 1, 1,
-1.098818, -1.215505, 0.2925999, 1, 1, 1, 1, 1,
-1.095819, 1.089936, -1.696579, 1, 1, 1, 1, 1,
-1.093784, 0.05394962, -1.037133, 1, 1, 1, 1, 1,
-1.092591, 0.8660193, -1.194978, 1, 1, 1, 1, 1,
-1.090456, -1.443967, -2.870731, 0, 0, 1, 1, 1,
-1.086861, -0.5114063, -2.469672, 1, 0, 0, 1, 1,
-1.082118, -0.4435342, -2.619675, 1, 0, 0, 1, 1,
-1.075134, 0.4002845, -1.249558, 1, 0, 0, 1, 1,
-1.073534, -2.184771, -2.304785, 1, 0, 0, 1, 1,
-1.062593, -1.046798, -2.850618, 1, 0, 0, 1, 1,
-1.053318, -1.843433, -1.949462, 0, 0, 0, 1, 1,
-1.05165, 0.08928623, -0.9225272, 0, 0, 0, 1, 1,
-1.047653, -1.034855, -3.294006, 0, 0, 0, 1, 1,
-1.046938, 0.03392153, -0.1195683, 0, 0, 0, 1, 1,
-1.042157, 0.9077877, -2.341027, 0, 0, 0, 1, 1,
-1.041493, -0.4348983, -3.669714, 0, 0, 0, 1, 1,
-1.033929, -0.432131, -2.42665, 0, 0, 0, 1, 1,
-1.02832, 0.7552788, -1.15603, 1, 1, 1, 1, 1,
-1.026651, -0.8893677, -2.533539, 1, 1, 1, 1, 1,
-1.02639, 0.02503838, -1.517655, 1, 1, 1, 1, 1,
-1.017205, 2.34908, -0.7188191, 1, 1, 1, 1, 1,
-1.016394, -1.352253, -1.221751, 1, 1, 1, 1, 1,
-1.011977, 0.9605162, 0.3331721, 1, 1, 1, 1, 1,
-1.006314, 0.3744302, 0.2619245, 1, 1, 1, 1, 1,
-1.003011, 0.9350153, -1.722738, 1, 1, 1, 1, 1,
-1.000812, 0.7123739, -0.776143, 1, 1, 1, 1, 1,
-0.999805, 1.184975, 0.7595466, 1, 1, 1, 1, 1,
-0.9974099, 1.502543, -0.6748276, 1, 1, 1, 1, 1,
-0.9946061, -0.4944953, -2.71623, 1, 1, 1, 1, 1,
-0.9922106, -0.8583253, -2.167978, 1, 1, 1, 1, 1,
-0.9890692, -0.0803792, -1.187659, 1, 1, 1, 1, 1,
-0.9887429, 0.3434233, -0.8213119, 1, 1, 1, 1, 1,
-0.9886111, -0.6497765, -1.602513, 0, 0, 1, 1, 1,
-0.9840232, 0.433208, -1.680188, 1, 0, 0, 1, 1,
-0.9729397, -0.07596618, -2.001877, 1, 0, 0, 1, 1,
-0.9716047, -0.4700677, -2.39508, 1, 0, 0, 1, 1,
-0.9680849, 1.63751, -1.119175, 1, 0, 0, 1, 1,
-0.9648042, 2.95464, -1.151803, 1, 0, 0, 1, 1,
-0.9636074, -0.2594086, 0.2474168, 0, 0, 0, 1, 1,
-0.9592373, -1.400731, -1.750646, 0, 0, 0, 1, 1,
-0.9565173, 1.017914, -0.4747286, 0, 0, 0, 1, 1,
-0.9562824, 0.6997449, -0.0372942, 0, 0, 0, 1, 1,
-0.9503756, -1.1046, -0.9063426, 0, 0, 0, 1, 1,
-0.9482169, -0.3423155, -0.8378764, 0, 0, 0, 1, 1,
-0.9399517, -0.7506821, -1.360053, 0, 0, 0, 1, 1,
-0.9349856, -0.5912778, -1.258439, 1, 1, 1, 1, 1,
-0.9347321, 0.3777772, -2.395696, 1, 1, 1, 1, 1,
-0.9307304, 0.1324255, -1.240278, 1, 1, 1, 1, 1,
-0.926409, 1.08742, -1.699567, 1, 1, 1, 1, 1,
-0.9259417, -0.426864, -1.080561, 1, 1, 1, 1, 1,
-0.922684, -0.352873, -1.116586, 1, 1, 1, 1, 1,
-0.9225209, 0.9771851, -1.805207, 1, 1, 1, 1, 1,
-0.9217713, -0.2369753, -2.168772, 1, 1, 1, 1, 1,
-0.9209081, 0.4703112, -0.5694119, 1, 1, 1, 1, 1,
-0.9133725, -0.3935446, 0.8762031, 1, 1, 1, 1, 1,
-0.9100385, 0.5707925, -0.5284901, 1, 1, 1, 1, 1,
-0.9090074, -1.104959, -4.189729, 1, 1, 1, 1, 1,
-0.9088755, 0.2673161, -1.511641, 1, 1, 1, 1, 1,
-0.9053532, 0.6907625, -0.4915875, 1, 1, 1, 1, 1,
-0.9053002, 0.9057497, 0.6582814, 1, 1, 1, 1, 1,
-0.903287, 0.6211802, -1.449257, 0, 0, 1, 1, 1,
-0.8997166, 1.989877, -1.80613, 1, 0, 0, 1, 1,
-0.8915926, 1.792286, -0.8972133, 1, 0, 0, 1, 1,
-0.8887705, 1.780922, 0.9612718, 1, 0, 0, 1, 1,
-0.8800043, 1.312296, -0.1590333, 1, 0, 0, 1, 1,
-0.8779054, 1.476411, -2.237016, 1, 0, 0, 1, 1,
-0.8755487, 0.8159351, -2.483069, 0, 0, 0, 1, 1,
-0.8752216, -1.129966, -1.88867, 0, 0, 0, 1, 1,
-0.8706803, 0.4033574, -2.772425, 0, 0, 0, 1, 1,
-0.8694893, 0.7097621, -0.4786148, 0, 0, 0, 1, 1,
-0.8680904, -1.96391, -1.315119, 0, 0, 0, 1, 1,
-0.8635437, -0.7610487, -3.22522, 0, 0, 0, 1, 1,
-0.8633662, 0.1099547, -0.5144821, 0, 0, 0, 1, 1,
-0.8623834, -1.886628, -1.638803, 1, 1, 1, 1, 1,
-0.8567017, -0.6604176, -1.815682, 1, 1, 1, 1, 1,
-0.8528339, -3.118173, -3.557643, 1, 1, 1, 1, 1,
-0.8432159, -1.932917, -2.791057, 1, 1, 1, 1, 1,
-0.8416946, 0.509718, -1.686663, 1, 1, 1, 1, 1,
-0.8376083, -2.154615, -1.802595, 1, 1, 1, 1, 1,
-0.8375921, 0.5231853, 0.3410152, 1, 1, 1, 1, 1,
-0.8360427, 0.6442091, -1.462326, 1, 1, 1, 1, 1,
-0.83573, -0.1517751, -3.011881, 1, 1, 1, 1, 1,
-0.8315621, 0.8080007, -0.7086036, 1, 1, 1, 1, 1,
-0.8283699, 0.4537212, 1.445226, 1, 1, 1, 1, 1,
-0.8269898, 0.6563426, -0.6472152, 1, 1, 1, 1, 1,
-0.8233419, -0.6556967, -1.3347, 1, 1, 1, 1, 1,
-0.8225545, -1.217339, -2.373943, 1, 1, 1, 1, 1,
-0.8174877, 0.5376173, -0.9901182, 1, 1, 1, 1, 1,
-0.8142592, -1.479913, -2.381937, 0, 0, 1, 1, 1,
-0.8125327, 1.609537, 0.1648163, 1, 0, 0, 1, 1,
-0.8084568, -0.8846436, -1.707688, 1, 0, 0, 1, 1,
-0.8060585, -0.7608128, -1.850404, 1, 0, 0, 1, 1,
-0.8048075, -0.6969196, -3.641651, 1, 0, 0, 1, 1,
-0.8027954, 0.5953537, 0.7265387, 1, 0, 0, 1, 1,
-0.801202, -1.482433, -2.353362, 0, 0, 0, 1, 1,
-0.7966691, -0.4070777, -1.785953, 0, 0, 0, 1, 1,
-0.7957812, 1.694037, -0.2700859, 0, 0, 0, 1, 1,
-0.7956283, 1.229067, -0.1333912, 0, 0, 0, 1, 1,
-0.7947737, 0.6207878, 0.03529512, 0, 0, 0, 1, 1,
-0.7900037, -0.6474192, -2.976578, 0, 0, 0, 1, 1,
-0.7889186, 0.6098044, -1.427042, 0, 0, 0, 1, 1,
-0.7871101, 0.5641324, 0.3026221, 1, 1, 1, 1, 1,
-0.7830916, -0.6022947, -1.05343, 1, 1, 1, 1, 1,
-0.7824988, 0.4188353, 0.5993072, 1, 1, 1, 1, 1,
-0.7803963, 0.5062608, -2.085503, 1, 1, 1, 1, 1,
-0.7773368, 0.1965918, -1.857783, 1, 1, 1, 1, 1,
-0.7749303, 0.03766886, -2.65312, 1, 1, 1, 1, 1,
-0.772094, 1.061402, -1.193345, 1, 1, 1, 1, 1,
-0.7698145, -0.1117746, -2.367574, 1, 1, 1, 1, 1,
-0.7696425, 0.3749889, 0.5663717, 1, 1, 1, 1, 1,
-0.7613878, -1.237169, -2.288354, 1, 1, 1, 1, 1,
-0.7610693, -0.7419679, -2.93283, 1, 1, 1, 1, 1,
-0.7598197, 2.053835, -0.4216273, 1, 1, 1, 1, 1,
-0.7570412, -0.8924832, 0.1015617, 1, 1, 1, 1, 1,
-0.7564422, -0.227027, -1.340024, 1, 1, 1, 1, 1,
-0.7554379, -0.449985, -3.323424, 1, 1, 1, 1, 1,
-0.7550809, -1.073061, -1.518258, 0, 0, 1, 1, 1,
-0.7524452, 0.9639708, -1.034587, 1, 0, 0, 1, 1,
-0.7455875, -0.6488497, -3.69104, 1, 0, 0, 1, 1,
-0.7451728, -0.7391257, -2.232101, 1, 0, 0, 1, 1,
-0.744004, 0.5007746, -0.8605088, 1, 0, 0, 1, 1,
-0.7413612, 0.9445654, -1.297061, 1, 0, 0, 1, 1,
-0.7384498, -0.5863695, -0.8023636, 0, 0, 0, 1, 1,
-0.7358622, -2.100279, -2.818195, 0, 0, 0, 1, 1,
-0.733578, -1.286216, -2.078414, 0, 0, 0, 1, 1,
-0.7311322, 0.2543432, -1.502979, 0, 0, 0, 1, 1,
-0.7238632, -0.5483136, -2.563705, 0, 0, 0, 1, 1,
-0.7189062, 0.06278404, -1.942632, 0, 0, 0, 1, 1,
-0.7138954, -0.2004687, -1.20507, 0, 0, 0, 1, 1,
-0.7073262, -0.4351745, 0.1069633, 1, 1, 1, 1, 1,
-0.7010041, 0.127136, -0.5436223, 1, 1, 1, 1, 1,
-0.6989675, 0.7815577, 0.430833, 1, 1, 1, 1, 1,
-0.6794448, -0.7454059, -2.719699, 1, 1, 1, 1, 1,
-0.6723897, 0.4326217, -0.4585994, 1, 1, 1, 1, 1,
-0.670432, -1.139791, -3.018914, 1, 1, 1, 1, 1,
-0.6688914, 0.6661786, -1.551976, 1, 1, 1, 1, 1,
-0.6648836, 0.5042601, -1.08212, 1, 1, 1, 1, 1,
-0.662671, -1.501897, -4.138158, 1, 1, 1, 1, 1,
-0.6493911, 1.240224, 0.5624768, 1, 1, 1, 1, 1,
-0.6303565, 1.30481, -0.1335698, 1, 1, 1, 1, 1,
-0.630031, 2.182753, -0.01954691, 1, 1, 1, 1, 1,
-0.6295373, -0.9340183, -1.469595, 1, 1, 1, 1, 1,
-0.6281425, -0.7888822, -1.823069, 1, 1, 1, 1, 1,
-0.6280446, -0.3523823, -2.878796, 1, 1, 1, 1, 1,
-0.6209003, -2.221643, -2.722997, 0, 0, 1, 1, 1,
-0.6204269, -1.044179, -1.760309, 1, 0, 0, 1, 1,
-0.6182222, -1.677526, -5.777859, 1, 0, 0, 1, 1,
-0.6179495, 0.02217508, 0.7575982, 1, 0, 0, 1, 1,
-0.6157457, 1.872736, -1.911256, 1, 0, 0, 1, 1,
-0.6031176, -0.5104425, -2.262699, 1, 0, 0, 1, 1,
-0.6028752, 1.498424, 0.416792, 0, 0, 0, 1, 1,
-0.5977838, -0.4838731, -1.871159, 0, 0, 0, 1, 1,
-0.5867181, -0.1928249, -1.996159, 0, 0, 0, 1, 1,
-0.5726462, -0.6745295, -2.183057, 0, 0, 0, 1, 1,
-0.5663927, -0.6009224, -0.6205591, 0, 0, 0, 1, 1,
-0.5656974, -1.566063, -3.170215, 0, 0, 0, 1, 1,
-0.5655626, -1.459519, -3.094449, 0, 0, 0, 1, 1,
-0.564042, 0.03088058, -0.9815611, 1, 1, 1, 1, 1,
-0.5621133, -1.941098, -2.132163, 1, 1, 1, 1, 1,
-0.5614973, 0.3334026, -2.970958, 1, 1, 1, 1, 1,
-0.5576056, 0.379775, -0.583727, 1, 1, 1, 1, 1,
-0.5559939, 0.01419658, -1.121635, 1, 1, 1, 1, 1,
-0.5538888, -1.024445, -2.01957, 1, 1, 1, 1, 1,
-0.5479696, 0.4889343, 1.926118, 1, 1, 1, 1, 1,
-0.547387, 0.9000643, -0.219484, 1, 1, 1, 1, 1,
-0.5467228, 0.6021969, -1.371542, 1, 1, 1, 1, 1,
-0.5439992, -0.1213032, -1.850639, 1, 1, 1, 1, 1,
-0.542521, -1.103581, -2.66664, 1, 1, 1, 1, 1,
-0.5405239, -0.9582989, -2.493603, 1, 1, 1, 1, 1,
-0.5392549, -0.321469, -1.332755, 1, 1, 1, 1, 1,
-0.5307017, 1.097913, -1.602038, 1, 1, 1, 1, 1,
-0.5258655, -0.7217214, -2.781366, 1, 1, 1, 1, 1,
-0.5241018, 1.752568, -0.7108701, 0, 0, 1, 1, 1,
-0.5220085, 0.6956006, -0.4328187, 1, 0, 0, 1, 1,
-0.5186289, 0.1361192, -1.723704, 1, 0, 0, 1, 1,
-0.5163502, -1.288938, -3.668099, 1, 0, 0, 1, 1,
-0.5120664, 0.02289652, -1.837628, 1, 0, 0, 1, 1,
-0.5060492, -0.119607, -3.283983, 1, 0, 0, 1, 1,
-0.503636, 0.2770838, 0.2100281, 0, 0, 0, 1, 1,
-0.5033157, -0.8718971, -0.9991684, 0, 0, 0, 1, 1,
-0.5028512, -0.5404832, -3.67427, 0, 0, 0, 1, 1,
-0.5025061, -1.175856, -0.6996068, 0, 0, 0, 1, 1,
-0.5022464, 0.6773998, -1.849902, 0, 0, 0, 1, 1,
-0.5012497, 0.1475756, -2.210238, 0, 0, 0, 1, 1,
-0.4915134, 1.078734, 0.7799941, 0, 0, 0, 1, 1,
-0.4877218, 0.9648207, 0.9349127, 1, 1, 1, 1, 1,
-0.475224, -0.04489301, -2.06739, 1, 1, 1, 1, 1,
-0.4708124, -1.389212, -4.45518, 1, 1, 1, 1, 1,
-0.4666325, -0.5262228, -2.591273, 1, 1, 1, 1, 1,
-0.466399, -0.0213215, -2.727427, 1, 1, 1, 1, 1,
-0.4621813, -0.2445439, -1.04947, 1, 1, 1, 1, 1,
-0.4621055, -0.3053045, -2.120054, 1, 1, 1, 1, 1,
-0.4620968, 0.04454402, -1.581756, 1, 1, 1, 1, 1,
-0.4612557, -0.9849575, -1.402732, 1, 1, 1, 1, 1,
-0.4540083, -0.4232622, -1.736515, 1, 1, 1, 1, 1,
-0.453525, 0.4272402, -0.2515016, 1, 1, 1, 1, 1,
-0.4496051, 0.386179, 0.08869848, 1, 1, 1, 1, 1,
-0.4453445, -0.5822617, -2.589705, 1, 1, 1, 1, 1,
-0.4451261, -0.4103426, -4.401283, 1, 1, 1, 1, 1,
-0.4428594, 0.542468, 0.888598, 1, 1, 1, 1, 1,
-0.4367553, 1.752112, -0.1851244, 0, 0, 1, 1, 1,
-0.436211, 0.7939291, 1.238425, 1, 0, 0, 1, 1,
-0.4358029, -0.4753005, -2.575178, 1, 0, 0, 1, 1,
-0.4342438, 0.820237, -0.6322358, 1, 0, 0, 1, 1,
-0.4336362, 1.086456, 0.5741189, 1, 0, 0, 1, 1,
-0.431073, 1.136633, -0.3397801, 1, 0, 0, 1, 1,
-0.4303667, 0.2336003, 0.8416463, 0, 0, 0, 1, 1,
-0.421726, 0.4725544, -1.511137, 0, 0, 0, 1, 1,
-0.4187108, -0.1000296, -0.8192124, 0, 0, 0, 1, 1,
-0.4159573, -0.7831388, -2.720503, 0, 0, 0, 1, 1,
-0.4150858, 0.404336, -0.3104134, 0, 0, 0, 1, 1,
-0.4115888, -0.5567755, -3.451612, 0, 0, 0, 1, 1,
-0.4112108, 0.3218722, -1.44524, 0, 0, 0, 1, 1,
-0.4062143, -0.03617271, -2.26701, 1, 1, 1, 1, 1,
-0.3999273, 0.06978729, -2.816572, 1, 1, 1, 1, 1,
-0.397878, 0.4030808, -0.5368626, 1, 1, 1, 1, 1,
-0.3956626, 0.3019526, -3.295495, 1, 1, 1, 1, 1,
-0.3853974, 0.6391767, -1.369519, 1, 1, 1, 1, 1,
-0.3815711, 0.1110301, -0.5821478, 1, 1, 1, 1, 1,
-0.3803343, 2.197105, -2.40402, 1, 1, 1, 1, 1,
-0.3789287, 0.4342472, 1.237876, 1, 1, 1, 1, 1,
-0.3744786, 0.6119459, 0.3442248, 1, 1, 1, 1, 1,
-0.3730056, -1.069633, -3.658165, 1, 1, 1, 1, 1,
-0.3719634, -0.1299838, -1.500353, 1, 1, 1, 1, 1,
-0.3704268, 0.51389, -1.354306, 1, 1, 1, 1, 1,
-0.3623928, -0.6638605, -3.067622, 1, 1, 1, 1, 1,
-0.3617105, 1.458866, 0.8473492, 1, 1, 1, 1, 1,
-0.3616921, -0.6571538, -2.054072, 1, 1, 1, 1, 1,
-0.3603758, -0.03906919, -1.25641, 0, 0, 1, 1, 1,
-0.3554939, -0.2322935, -0.6080148, 1, 0, 0, 1, 1,
-0.354954, -0.544628, -0.8027622, 1, 0, 0, 1, 1,
-0.3543139, 0.2953981, -1.224874, 1, 0, 0, 1, 1,
-0.3540566, 0.4097218, -0.2873622, 1, 0, 0, 1, 1,
-0.3530986, 1.267567, -1.633692, 1, 0, 0, 1, 1,
-0.3489221, -0.5243272, -1.99156, 0, 0, 0, 1, 1,
-0.3487616, -0.09867637, -0.7124103, 0, 0, 0, 1, 1,
-0.3441608, 0.8916137, -1.323758, 0, 0, 0, 1, 1,
-0.3418684, 0.4689057, -0.5150074, 0, 0, 0, 1, 1,
-0.3409337, 0.6156977, 0.8527841, 0, 0, 0, 1, 1,
-0.3392273, -1.15162, -2.16749, 0, 0, 0, 1, 1,
-0.3325893, 0.8268567, -1.783314, 0, 0, 0, 1, 1,
-0.3308555, 0.5346394, -1.099812, 1, 1, 1, 1, 1,
-0.3296145, -0.8800157, -0.3607899, 1, 1, 1, 1, 1,
-0.3273722, -0.6402024, -4.100951, 1, 1, 1, 1, 1,
-0.3266992, 1.283466, 0.8406894, 1, 1, 1, 1, 1,
-0.3223893, 1.062663, -0.02249415, 1, 1, 1, 1, 1,
-0.3218593, -0.6303072, -5.223958, 1, 1, 1, 1, 1,
-0.3214942, 1.341292, 0.7397265, 1, 1, 1, 1, 1,
-0.3203948, 0.6165302, 0.4746203, 1, 1, 1, 1, 1,
-0.3189409, -1.734792, -1.577982, 1, 1, 1, 1, 1,
-0.3181041, -0.2425545, -0.06812968, 1, 1, 1, 1, 1,
-0.3176981, -0.4616937, -3.756867, 1, 1, 1, 1, 1,
-0.3147868, -2.821147, -3.138704, 1, 1, 1, 1, 1,
-0.3119037, -0.1962586, -2.223943, 1, 1, 1, 1, 1,
-0.3111503, 0.5277796, 0.2595724, 1, 1, 1, 1, 1,
-0.3086324, -0.8769744, -0.8040376, 1, 1, 1, 1, 1,
-0.3051453, -1.489586, -3.252683, 0, 0, 1, 1, 1,
-0.3032465, 0.5109132, -0.712885, 1, 0, 0, 1, 1,
-0.302984, -0.6252621, -4.092557, 1, 0, 0, 1, 1,
-0.3009218, 0.8624634, -0.701579, 1, 0, 0, 1, 1,
-0.2963744, 0.9805616, -0.9523433, 1, 0, 0, 1, 1,
-0.2911344, 0.6728578, 2.070144, 1, 0, 0, 1, 1,
-0.2903348, -0.4017278, -3.388612, 0, 0, 0, 1, 1,
-0.2898715, 0.7138242, 0.3852656, 0, 0, 0, 1, 1,
-0.2882473, 1.565648, -1.010506, 0, 0, 0, 1, 1,
-0.2740203, -1.226137, -1.450389, 0, 0, 0, 1, 1,
-0.272086, -0.3294283, -1.645397, 0, 0, 0, 1, 1,
-0.2714024, 0.03461488, -1.40314, 0, 0, 0, 1, 1,
-0.2697597, 0.9329813, -0.1181448, 0, 0, 0, 1, 1,
-0.2692018, 1.348833, -0.06077854, 1, 1, 1, 1, 1,
-0.2691451, -0.4226972, -1.837089, 1, 1, 1, 1, 1,
-0.2680662, -0.6826443, -3.493219, 1, 1, 1, 1, 1,
-0.2656214, 1.35474, -1.050879, 1, 1, 1, 1, 1,
-0.2591343, -2.276049, -3.999243, 1, 1, 1, 1, 1,
-0.2409424, -0.6385031, -0.913402, 1, 1, 1, 1, 1,
-0.2364397, -0.8901365, -2.630422, 1, 1, 1, 1, 1,
-0.2339114, -0.08895273, -2.581622, 1, 1, 1, 1, 1,
-0.2320909, 0.05375106, -1.826546, 1, 1, 1, 1, 1,
-0.2310873, 1.177336, 1.186634, 1, 1, 1, 1, 1,
-0.2309157, 0.3750624, -0.07393852, 1, 1, 1, 1, 1,
-0.2282806, -1.166103, -1.64328, 1, 1, 1, 1, 1,
-0.2268717, 0.2507899, 0.06617086, 1, 1, 1, 1, 1,
-0.2255323, -1.123185, -2.089903, 1, 1, 1, 1, 1,
-0.224508, 0.504476, 0.05025994, 1, 1, 1, 1, 1,
-0.2238573, 0.9617112, -0.1599726, 0, 0, 1, 1, 1,
-0.2232024, -0.0389963, -2.258294, 1, 0, 0, 1, 1,
-0.2144055, -1.204192, -1.940895, 1, 0, 0, 1, 1,
-0.2088181, 1.49736, 0.3540497, 1, 0, 0, 1, 1,
-0.205712, 0.0566537, -0.5386509, 1, 0, 0, 1, 1,
-0.2054375, 0.2770584, -0.5959191, 1, 0, 0, 1, 1,
-0.2050491, -0.5508263, -3.584398, 0, 0, 0, 1, 1,
-0.2009951, 0.005418025, -2.517048, 0, 0, 0, 1, 1,
-0.1949435, 0.8100448, -1.298591, 0, 0, 0, 1, 1,
-0.1944161, 0.2187362, -1.505672, 0, 0, 0, 1, 1,
-0.19278, 0.8983924, -0.7038243, 0, 0, 0, 1, 1,
-0.1879771, -1.883269, -3.398194, 0, 0, 0, 1, 1,
-0.186, 0.6232384, -0.5727443, 0, 0, 0, 1, 1,
-0.1844902, -0.8724111, -3.151089, 1, 1, 1, 1, 1,
-0.1843615, -0.6042832, -3.491425, 1, 1, 1, 1, 1,
-0.1759028, 1.079183, 0.3140261, 1, 1, 1, 1, 1,
-0.171507, -0.1139039, -0.3258881, 1, 1, 1, 1, 1,
-0.1693926, 1.343139, -0.03761739, 1, 1, 1, 1, 1,
-0.1678698, -0.9856522, -3.268401, 1, 1, 1, 1, 1,
-0.1667621, 0.6716989, -0.994031, 1, 1, 1, 1, 1,
-0.1630026, 0.8204652, -1.025268, 1, 1, 1, 1, 1,
-0.1599794, 1.329638, -0.7797139, 1, 1, 1, 1, 1,
-0.1597924, 0.7098958, -0.8000737, 1, 1, 1, 1, 1,
-0.152849, 0.5975813, -1.374686, 1, 1, 1, 1, 1,
-0.1518414, -1.103055, -3.309859, 1, 1, 1, 1, 1,
-0.1497385, 1.107547, 0.7092225, 1, 1, 1, 1, 1,
-0.1465001, 1.934866, -0.5125586, 1, 1, 1, 1, 1,
-0.1459991, 0.6862658, 1.0227, 1, 1, 1, 1, 1,
-0.1388869, -0.8431813, -3.616719, 0, 0, 1, 1, 1,
-0.1385053, 0.2389667, 0.3724208, 1, 0, 0, 1, 1,
-0.1379426, 0.6948532, 0.1867787, 1, 0, 0, 1, 1,
-0.1328323, 1.759867, -0.6130592, 1, 0, 0, 1, 1,
-0.132548, 0.4056133, 0.4484389, 1, 0, 0, 1, 1,
-0.1287411, -0.1634438, -2.894765, 1, 0, 0, 1, 1,
-0.1168827, -0.5646273, -3.639405, 0, 0, 0, 1, 1,
-0.1153652, 0.4119261, -0.3373409, 0, 0, 0, 1, 1,
-0.1143291, -0.2376774, -2.524366, 0, 0, 0, 1, 1,
-0.1080365, 0.3888581, -1.331661, 0, 0, 0, 1, 1,
-0.1044771, 0.929415, 0.2166741, 0, 0, 0, 1, 1,
-0.1025661, 0.4236034, -0.3476061, 0, 0, 0, 1, 1,
-0.1020883, -0.9911505, -2.534214, 0, 0, 0, 1, 1,
-0.09929262, 1.181424, -1.304737, 1, 1, 1, 1, 1,
-0.09847765, -0.4843391, -4.03681, 1, 1, 1, 1, 1,
-0.09834991, -0.4381712, -3.615, 1, 1, 1, 1, 1,
-0.09623228, 0.8396795, 0.8732377, 1, 1, 1, 1, 1,
-0.09466673, 1.738453, 2.290146, 1, 1, 1, 1, 1,
-0.09410007, -0.7132058, -4.110331, 1, 1, 1, 1, 1,
-0.09338308, -0.261153, -2.470188, 1, 1, 1, 1, 1,
-0.09263955, 2.335187, -1.706936, 1, 1, 1, 1, 1,
-0.09093033, -1.277421, -0.9828545, 1, 1, 1, 1, 1,
-0.08778415, -1.824412, -1.830717, 1, 1, 1, 1, 1,
-0.08022349, -0.2581252, -2.348706, 1, 1, 1, 1, 1,
-0.08008464, 0.6699536, -1.5368, 1, 1, 1, 1, 1,
-0.06775395, 0.6373644, 0.5359145, 1, 1, 1, 1, 1,
-0.06593468, 0.7060615, 0.4780891, 1, 1, 1, 1, 1,
-0.06112253, 1.645177, 0.8236896, 1, 1, 1, 1, 1,
-0.06051078, -0.7056374, -1.8858, 0, 0, 1, 1, 1,
-0.04900014, -0.1182177, -3.960624, 1, 0, 0, 1, 1,
-0.04723354, -0.9866452, -2.799084, 1, 0, 0, 1, 1,
-0.04283081, 1.244761, -2.930628, 1, 0, 0, 1, 1,
-0.04168851, -0.7348006, -4.256044, 1, 0, 0, 1, 1,
-0.04116145, -0.2016321, -2.040274, 1, 0, 0, 1, 1,
-0.03921495, 0.1318324, -1.023198, 0, 0, 0, 1, 1,
-0.03657979, 0.638924, 0.2257656, 0, 0, 0, 1, 1,
-0.03430414, 1.725119, -0.09460594, 0, 0, 0, 1, 1,
-0.03245926, 0.1002574, -0.07634978, 0, 0, 0, 1, 1,
-0.03077925, -0.9053236, -3.109148, 0, 0, 0, 1, 1,
-0.02772139, 0.3880185, -0.1517023, 0, 0, 0, 1, 1,
-0.02676198, -0.8682973, -2.734516, 0, 0, 0, 1, 1,
-0.02551543, 1.878507, 1.881978, 1, 1, 1, 1, 1,
-0.01838147, 0.9824361, -0.4403439, 1, 1, 1, 1, 1,
-0.01687931, 0.329514, 0.161545, 1, 1, 1, 1, 1,
-0.01665963, 0.1208334, 0.003382057, 1, 1, 1, 1, 1,
-0.01400344, -1.19086, -3.04884, 1, 1, 1, 1, 1,
-0.01180395, -1.567426, -5.060151, 1, 1, 1, 1, 1,
-0.006135438, -0.4808201, -2.975516, 1, 1, 1, 1, 1,
-0.003800827, 1.087044, -0.06363414, 1, 1, 1, 1, 1,
-0.002676221, 0.4362072, -0.7103644, 1, 1, 1, 1, 1,
-0.001711949, -0.1979232, -5.33701, 1, 1, 1, 1, 1,
0.002131392, 0.4648758, 0.430819, 1, 1, 1, 1, 1,
0.002267339, -0.7692161, 3.310816, 1, 1, 1, 1, 1,
0.004896544, 0.008863366, 0.5785354, 1, 1, 1, 1, 1,
0.006605468, -1.772592, 2.926294, 1, 1, 1, 1, 1,
0.008489388, 0.8756098, 1.129827, 1, 1, 1, 1, 1,
0.01340593, -1.077046, 3.569158, 0, 0, 1, 1, 1,
0.01400295, 0.03591047, -0.3033434, 1, 0, 0, 1, 1,
0.01456641, -1.269363, 2.989616, 1, 0, 0, 1, 1,
0.0181407, -0.5588876, 1.676482, 1, 0, 0, 1, 1,
0.02027192, 0.1034691, 1.657095, 1, 0, 0, 1, 1,
0.02578162, -0.9260165, 3.469497, 1, 0, 0, 1, 1,
0.02871532, 0.9399617, -0.5005628, 0, 0, 0, 1, 1,
0.03126616, 0.8878148, -0.297371, 0, 0, 0, 1, 1,
0.03360246, 0.07656191, -0.6602414, 0, 0, 0, 1, 1,
0.04054794, -0.2150166, 0.6802161, 0, 0, 0, 1, 1,
0.04528068, -0.6495627, 2.522091, 0, 0, 0, 1, 1,
0.04632194, 0.7401614, -0.002710074, 0, 0, 0, 1, 1,
0.04788497, -2.23482, 3.513784, 0, 0, 0, 1, 1,
0.0503124, 0.7812576, -0.1500431, 1, 1, 1, 1, 1,
0.05297041, 0.04329525, 1.680734, 1, 1, 1, 1, 1,
0.05343036, -0.3147995, 4.247178, 1, 1, 1, 1, 1,
0.06152919, -0.6873245, 2.845894, 1, 1, 1, 1, 1,
0.07031912, -1.69118, 4.095484, 1, 1, 1, 1, 1,
0.07476791, -1.366555, 4.412001, 1, 1, 1, 1, 1,
0.07569015, -2.611311, 3.740272, 1, 1, 1, 1, 1,
0.07601794, -0.4230215, 1.011784, 1, 1, 1, 1, 1,
0.08097431, -0.555272, 2.338691, 1, 1, 1, 1, 1,
0.08327352, -0.09148348, 2.23364, 1, 1, 1, 1, 1,
0.08723726, -1.176056, 2.723368, 1, 1, 1, 1, 1,
0.08780288, -1.385182, 3.386056, 1, 1, 1, 1, 1,
0.09518871, 0.352818, -0.7585263, 1, 1, 1, 1, 1,
0.09614115, 0.4068394, 1.978287, 1, 1, 1, 1, 1,
0.09655526, 0.3858241, -0.4578863, 1, 1, 1, 1, 1,
0.09687426, 1.755057, 0.603916, 0, 0, 1, 1, 1,
0.09735753, 2.000952, 0.3938341, 1, 0, 0, 1, 1,
0.1021735, -1.327422, 3.502219, 1, 0, 0, 1, 1,
0.1031647, 0.07453457, 0.6730308, 1, 0, 0, 1, 1,
0.1034174, 0.2262338, -0.03628066, 1, 0, 0, 1, 1,
0.1126366, -0.4214655, 1.446452, 1, 0, 0, 1, 1,
0.1183988, -0.4039965, 2.63223, 0, 0, 0, 1, 1,
0.1200053, -0.1504636, 3.863022, 0, 0, 0, 1, 1,
0.1222729, 0.953302, 0.1735388, 0, 0, 0, 1, 1,
0.1234688, -0.4454021, 2.545101, 0, 0, 0, 1, 1,
0.1239414, -0.07203203, 2.426069, 0, 0, 0, 1, 1,
0.1269676, -1.695136, 1.238509, 0, 0, 0, 1, 1,
0.1302675, 0.6135318, 0.6575943, 0, 0, 0, 1, 1,
0.1307962, -1.823703, 2.308378, 1, 1, 1, 1, 1,
0.1309164, 1.908696, 0.6546095, 1, 1, 1, 1, 1,
0.1366245, 0.7925298, 0.3908828, 1, 1, 1, 1, 1,
0.1423217, 0.1833264, 0.9165527, 1, 1, 1, 1, 1,
0.1437721, -0.01519363, 2.459677, 1, 1, 1, 1, 1,
0.1471304, 0.05439848, 2.155224, 1, 1, 1, 1, 1,
0.1495247, -0.6852078, 1.72316, 1, 1, 1, 1, 1,
0.1511988, 0.02910164, 1.596485, 1, 1, 1, 1, 1,
0.1589791, 0.3696869, 0.7212238, 1, 1, 1, 1, 1,
0.1632207, -1.661482, 2.666273, 1, 1, 1, 1, 1,
0.1654999, -0.6280272, 2.464035, 1, 1, 1, 1, 1,
0.166601, 0.8758228, -0.4857739, 1, 1, 1, 1, 1,
0.1723009, 1.370111, 0.3573946, 1, 1, 1, 1, 1,
0.1753253, -2.14495, 4.301848, 1, 1, 1, 1, 1,
0.1758347, 0.5543392, -0.9032265, 1, 1, 1, 1, 1,
0.183445, 0.4520676, 1.325894, 0, 0, 1, 1, 1,
0.1840009, -1.527685, 3.445092, 1, 0, 0, 1, 1,
0.1842314, -0.3609626, 3.955058, 1, 0, 0, 1, 1,
0.1847449, -1.3904, 2.090986, 1, 0, 0, 1, 1,
0.1849372, 0.03434998, 0.2160316, 1, 0, 0, 1, 1,
0.1916853, 0.6248662, 2.021842, 1, 0, 0, 1, 1,
0.1928049, 0.2770589, -1.539092, 0, 0, 0, 1, 1,
0.1929753, 1.75124, -0.5683413, 0, 0, 0, 1, 1,
0.1933869, 1.36239, 0.0659353, 0, 0, 0, 1, 1,
0.1943614, 1.036727, -0.1007412, 0, 0, 0, 1, 1,
0.1992732, -0.1982833, 1.244698, 0, 0, 0, 1, 1,
0.2016556, 1.508969, -0.1442257, 0, 0, 0, 1, 1,
0.2021965, 0.9782459, 0.8774862, 0, 0, 0, 1, 1,
0.2058777, 0.5180267, 0.02302066, 1, 1, 1, 1, 1,
0.2109738, 0.6556135, -1.094412, 1, 1, 1, 1, 1,
0.2155061, 1.332229, -0.4759741, 1, 1, 1, 1, 1,
0.2160392, 0.002042035, 1.593873, 1, 1, 1, 1, 1,
0.2167648, 0.5160339, -0.3836602, 1, 1, 1, 1, 1,
0.2168517, -3.011914, 3.207179, 1, 1, 1, 1, 1,
0.221563, 1.445448, -0.8408045, 1, 1, 1, 1, 1,
0.2263895, 0.1298977, 0.3258019, 1, 1, 1, 1, 1,
0.2280566, 0.1151419, 1.587139, 1, 1, 1, 1, 1,
0.2292118, -0.9476477, 3.760994, 1, 1, 1, 1, 1,
0.2308848, 2.020915, -2.350138, 1, 1, 1, 1, 1,
0.2338979, -0.3704135, 4.046704, 1, 1, 1, 1, 1,
0.2355137, 0.4820199, -0.2624942, 1, 1, 1, 1, 1,
0.2378512, 0.01045667, 2.000684, 1, 1, 1, 1, 1,
0.2412648, 0.8684374, 0.340719, 1, 1, 1, 1, 1,
0.2442632, 0.4965512, -0.3740803, 0, 0, 1, 1, 1,
0.244334, -0.1628559, 2.447167, 1, 0, 0, 1, 1,
0.2447654, 0.5182698, 0.6605901, 1, 0, 0, 1, 1,
0.2449028, 0.5089875, 0.7188784, 1, 0, 0, 1, 1,
0.2462175, 1.02316, 1.032205, 1, 0, 0, 1, 1,
0.251198, 0.5953874, -1.804187, 1, 0, 0, 1, 1,
0.253119, -0.7146339, 3.421652, 0, 0, 0, 1, 1,
0.2544976, 0.3661579, 0.418906, 0, 0, 0, 1, 1,
0.2552972, 0.9025155, 0.7677035, 0, 0, 0, 1, 1,
0.2567464, -0.7501184, 4.096659, 0, 0, 0, 1, 1,
0.2577373, -1.930097, 1.365075, 0, 0, 0, 1, 1,
0.2594666, -1.045465, 3.222144, 0, 0, 0, 1, 1,
0.259588, -1.105848, 0.9548147, 0, 0, 0, 1, 1,
0.2599728, 2.35406, 2.021964, 1, 1, 1, 1, 1,
0.2612369, -1.219541, 4.820734, 1, 1, 1, 1, 1,
0.2666806, -0.5167468, 3.871895, 1, 1, 1, 1, 1,
0.2670652, -0.9120476, 2.92051, 1, 1, 1, 1, 1,
0.2691748, 0.7961229, -1.139512, 1, 1, 1, 1, 1,
0.2697954, -0.6096973, 2.640499, 1, 1, 1, 1, 1,
0.2729053, -0.1885374, 1.829212, 1, 1, 1, 1, 1,
0.2778896, -0.1377876, 1.296795, 1, 1, 1, 1, 1,
0.2795433, -0.05000405, 2.095462, 1, 1, 1, 1, 1,
0.2851724, -1.28812, 1.345575, 1, 1, 1, 1, 1,
0.2925691, -0.1904661, 2.880639, 1, 1, 1, 1, 1,
0.2939305, 0.4628528, 0.1876131, 1, 1, 1, 1, 1,
0.2962379, 0.5907285, -1.219817, 1, 1, 1, 1, 1,
0.3048769, -2.677184, 3.851164, 1, 1, 1, 1, 1,
0.3054351, -0.240097, 4.87262, 1, 1, 1, 1, 1,
0.3060806, 0.3049944, 2.096133, 0, 0, 1, 1, 1,
0.3084159, 0.5332641, -0.4924027, 1, 0, 0, 1, 1,
0.3097799, -0.8529806, 3.964292, 1, 0, 0, 1, 1,
0.310856, 0.002619988, 0.2710274, 1, 0, 0, 1, 1,
0.3123182, -2.306822, 1.354246, 1, 0, 0, 1, 1,
0.3130435, -0.8268896, 0.8237156, 1, 0, 0, 1, 1,
0.3139294, 0.3735431, 0.2529435, 0, 0, 0, 1, 1,
0.3140049, 0.008025329, 0.9374032, 0, 0, 0, 1, 1,
0.3156663, 0.4651312, -0.2005875, 0, 0, 0, 1, 1,
0.316307, 0.3689918, 2.330048, 0, 0, 0, 1, 1,
0.3167158, 1.933458, 1.230477, 0, 0, 0, 1, 1,
0.3199603, 0.1567742, 0.3541373, 0, 0, 0, 1, 1,
0.3205149, -0.4249681, 1.629393, 0, 0, 0, 1, 1,
0.332719, 1.436795, 0.5126377, 1, 1, 1, 1, 1,
0.3403888, -1.063075, 2.353967, 1, 1, 1, 1, 1,
0.3466642, 0.08330053, 1.810661, 1, 1, 1, 1, 1,
0.3466946, 0.8658397, 1.728925, 1, 1, 1, 1, 1,
0.3481711, -0.2740531, 2.43478, 1, 1, 1, 1, 1,
0.3543002, 0.4005021, 0.7128217, 1, 1, 1, 1, 1,
0.3586503, 1.823565, 0.33337, 1, 1, 1, 1, 1,
0.362886, 1.074926, -1.177623, 1, 1, 1, 1, 1,
0.3646562, 2.276074, -0.7750989, 1, 1, 1, 1, 1,
0.3653016, -0.06780318, 2.319284, 1, 1, 1, 1, 1,
0.3760657, 1.625081, 1.220409, 1, 1, 1, 1, 1,
0.3814099, -0.2372814, 1.986174, 1, 1, 1, 1, 1,
0.383276, -0.2808323, 3.421156, 1, 1, 1, 1, 1,
0.3911552, 0.5653166, 0.3549079, 1, 1, 1, 1, 1,
0.394098, -0.6344106, 2.021747, 1, 1, 1, 1, 1,
0.3952666, 0.5765449, 0.7620286, 0, 0, 1, 1, 1,
0.4008622, -0.417368, 1.851539, 1, 0, 0, 1, 1,
0.4014413, -1.364492, 2.751731, 1, 0, 0, 1, 1,
0.4062077, -0.05489218, 2.402221, 1, 0, 0, 1, 1,
0.4064214, -1.295083, 2.936959, 1, 0, 0, 1, 1,
0.4118711, 1.883907, -0.04072391, 1, 0, 0, 1, 1,
0.4152459, -1.46109, 4.795769, 0, 0, 0, 1, 1,
0.4153848, -0.4704346, 0.2915371, 0, 0, 0, 1, 1,
0.4174308, 0.4930126, -0.6091878, 0, 0, 0, 1, 1,
0.4186533, 1.189238, 1.763142, 0, 0, 0, 1, 1,
0.4208178, 0.3471039, 0.6524323, 0, 0, 0, 1, 1,
0.4224708, -0.2782122, 2.633522, 0, 0, 0, 1, 1,
0.4228419, -0.6403847, 2.592974, 0, 0, 0, 1, 1,
0.4245597, 0.8932683, 0.6148443, 1, 1, 1, 1, 1,
0.4263816, -1.427871, 0.6608887, 1, 1, 1, 1, 1,
0.4280209, -1.529149, 2.628284, 1, 1, 1, 1, 1,
0.4319874, -0.7238091, 0.923086, 1, 1, 1, 1, 1,
0.4333968, 0.5568467, 2.11182, 1, 1, 1, 1, 1,
0.4344359, 0.07608159, 2.525397, 1, 1, 1, 1, 1,
0.4351483, -0.1181762, 0.2364843, 1, 1, 1, 1, 1,
0.4371969, -0.7122595, 2.93728, 1, 1, 1, 1, 1,
0.4385513, 2.29634, 0.1445976, 1, 1, 1, 1, 1,
0.4461831, 0.2393332, -1.002873, 1, 1, 1, 1, 1,
0.4494508, -1.005474, 1.284955, 1, 1, 1, 1, 1,
0.4543725, 2.041701, 1.124115, 1, 1, 1, 1, 1,
0.4594037, 0.8554822, 0.5823269, 1, 1, 1, 1, 1,
0.4662162, 0.9684845, -0.716435, 1, 1, 1, 1, 1,
0.4690448, 0.4213654, 1.644643, 1, 1, 1, 1, 1,
0.4699005, -0.8034419, 4.139112, 0, 0, 1, 1, 1,
0.4722067, -0.1836651, 0.4196761, 1, 0, 0, 1, 1,
0.4725437, -0.7337285, 3.449958, 1, 0, 0, 1, 1,
0.4748308, -0.1826213, 1.170495, 1, 0, 0, 1, 1,
0.4820204, -0.225406, 1.241019, 1, 0, 0, 1, 1,
0.4839796, 1.925076, 1.159868, 1, 0, 0, 1, 1,
0.4844914, -0.6631747, 0.9495426, 0, 0, 0, 1, 1,
0.4855047, -2.585464, 4.130587, 0, 0, 0, 1, 1,
0.4867838, 1.338293, -0.2822796, 0, 0, 0, 1, 1,
0.4966071, -0.6739735, 2.732299, 0, 0, 0, 1, 1,
0.4966604, 0.3396829, 0.7411363, 0, 0, 0, 1, 1,
0.4992226, -1.306387, 5.304699, 0, 0, 0, 1, 1,
0.5005811, 0.6672883, -0.7634934, 0, 0, 0, 1, 1,
0.5021985, -0.4056198, 3.756319, 1, 1, 1, 1, 1,
0.5055574, -0.7264176, 5.02299, 1, 1, 1, 1, 1,
0.509773, 0.06438699, 2.972616, 1, 1, 1, 1, 1,
0.5131692, 1.546575, 2.307715, 1, 1, 1, 1, 1,
0.5144543, -0.7651759, 1.883682, 1, 1, 1, 1, 1,
0.5192006, 1.673095, 1.333392, 1, 1, 1, 1, 1,
0.5195913, 0.4348311, 0.6865126, 1, 1, 1, 1, 1,
0.5221964, 1.768595, 0.9902338, 1, 1, 1, 1, 1,
0.5281181, 0.7360572, 0.4155548, 1, 1, 1, 1, 1,
0.5308616, 0.3972242, -1.397031, 1, 1, 1, 1, 1,
0.5392848, -0.9232142, 0.6348053, 1, 1, 1, 1, 1,
0.5481598, 1.160688, -0.09699927, 1, 1, 1, 1, 1,
0.5485882, -0.366594, 2.814782, 1, 1, 1, 1, 1,
0.5486696, -0.7510173, 1.888584, 1, 1, 1, 1, 1,
0.5489132, 0.1140478, 0.1699622, 1, 1, 1, 1, 1,
0.5514289, 0.9873636, -0.5548757, 0, 0, 1, 1, 1,
0.5546382, 1.277591, 0.4910665, 1, 0, 0, 1, 1,
0.5581505, 0.4932904, 2.084275, 1, 0, 0, 1, 1,
0.5581753, 1.552062, -1.068696, 1, 0, 0, 1, 1,
0.5621008, 1.163613, -0.5419733, 1, 0, 0, 1, 1,
0.5624347, -0.003837827, 2.334154, 1, 0, 0, 1, 1,
0.5670312, 0.9192861, 2.144418, 0, 0, 0, 1, 1,
0.5689732, -0.7619858, 1.597779, 0, 0, 0, 1, 1,
0.5690236, 1.532318, -0.005080624, 0, 0, 0, 1, 1,
0.5732586, 0.2289329, 0.8537254, 0, 0, 0, 1, 1,
0.5803132, 0.6139538, 0.5089511, 0, 0, 0, 1, 1,
0.5818875, 0.6858388, -0.1231359, 0, 0, 0, 1, 1,
0.5847288, -1.13033, 2.916762, 0, 0, 0, 1, 1,
0.5861314, -0.5626858, 2.53533, 1, 1, 1, 1, 1,
0.5894814, 0.67164, 0.2251415, 1, 1, 1, 1, 1,
0.5902662, -0.5359344, 2.922263, 1, 1, 1, 1, 1,
0.5942559, -0.3608802, 1.897915, 1, 1, 1, 1, 1,
0.5966951, -0.0004179058, 1.205184, 1, 1, 1, 1, 1,
0.5984012, 1.062427, -0.418295, 1, 1, 1, 1, 1,
0.6060004, -0.4363028, 3.42464, 1, 1, 1, 1, 1,
0.6100072, -0.5716002, 1.382391, 1, 1, 1, 1, 1,
0.6100618, 0.5861809, 0.9209147, 1, 1, 1, 1, 1,
0.6101699, -0.4865296, 2.474979, 1, 1, 1, 1, 1,
0.621013, -0.1511382, 2.604231, 1, 1, 1, 1, 1,
0.6269695, 0.557974, 2.323056, 1, 1, 1, 1, 1,
0.6275843, -1.527478, 2.537914, 1, 1, 1, 1, 1,
0.6287766, 1.214086, 1.47079, 1, 1, 1, 1, 1,
0.6302861, 0.6369335, 2.145515, 1, 1, 1, 1, 1,
0.6316555, -0.9464968, 3.811752, 0, 0, 1, 1, 1,
0.633951, 0.6600427, 1.175723, 1, 0, 0, 1, 1,
0.6352462, 0.2088874, 1.099729, 1, 0, 0, 1, 1,
0.6362005, 0.4726548, 0.8260175, 1, 0, 0, 1, 1,
0.6367297, 0.8937149, -0.2331371, 1, 0, 0, 1, 1,
0.6505013, 0.3842343, -1.361277, 1, 0, 0, 1, 1,
0.6547355, -0.1852768, 1.647711, 0, 0, 0, 1, 1,
0.6575955, -1.038295, 2.659984, 0, 0, 0, 1, 1,
0.6677797, 0.8273339, 2.522884, 0, 0, 0, 1, 1,
0.6708499, -0.9008119, 3.461462, 0, 0, 0, 1, 1,
0.6736693, -0.8085926, 1.701697, 0, 0, 0, 1, 1,
0.674933, 0.7085091, 0.2009934, 0, 0, 0, 1, 1,
0.6758011, 0.05535967, 1.414386, 0, 0, 0, 1, 1,
0.6794879, 0.7498482, 1.968577, 1, 1, 1, 1, 1,
0.6855592, -0.2676452, 1.83531, 1, 1, 1, 1, 1,
0.6903071, 0.3100212, 2.114233, 1, 1, 1, 1, 1,
0.6945633, 0.1483179, -0.23193, 1, 1, 1, 1, 1,
0.6969981, -1.827297, 2.124908, 1, 1, 1, 1, 1,
0.6974092, -0.7980764, 2.372531, 1, 1, 1, 1, 1,
0.6979458, 0.9206756, 0.6828737, 1, 1, 1, 1, 1,
0.6983211, 1.87993, 0.06058306, 1, 1, 1, 1, 1,
0.6990739, 0.2349278, -0.18483, 1, 1, 1, 1, 1,
0.699539, 0.3245896, 0.5630704, 1, 1, 1, 1, 1,
0.7021576, 0.2245857, 0.4173608, 1, 1, 1, 1, 1,
0.7065465, 0.857864, -0.3422808, 1, 1, 1, 1, 1,
0.7073098, 1.252536, 0.7401822, 1, 1, 1, 1, 1,
0.7087939, 0.5049804, 0.4386685, 1, 1, 1, 1, 1,
0.7092, 1.165039, 1.34488, 1, 1, 1, 1, 1,
0.7123823, 1.248652, 0.3411373, 0, 0, 1, 1, 1,
0.713694, 0.09186139, 1.535511, 1, 0, 0, 1, 1,
0.7202848, -0.7914925, 3.690594, 1, 0, 0, 1, 1,
0.7211316, -1.122734, 3.866898, 1, 0, 0, 1, 1,
0.7242057, 0.811241, -1.20635, 1, 0, 0, 1, 1,
0.732655, 0.1341723, 3.226987, 1, 0, 0, 1, 1,
0.7330873, -0.4454786, 2.024777, 0, 0, 0, 1, 1,
0.7331595, 1.212433, -0.05109334, 0, 0, 0, 1, 1,
0.7429975, 0.2217765, 0.7300441, 0, 0, 0, 1, 1,
0.7435511, -0.111652, 2.536722, 0, 0, 0, 1, 1,
0.7473282, -0.9355473, 1.989535, 0, 0, 0, 1, 1,
0.7474247, 1.517949, 0.5525434, 0, 0, 0, 1, 1,
0.7548481, -0.246855, 2.168508, 0, 0, 0, 1, 1,
0.7571548, 0.1130187, 1.78697, 1, 1, 1, 1, 1,
0.7621392, 0.5486532, 0.1880146, 1, 1, 1, 1, 1,
0.763112, 1.997938, 0.03057968, 1, 1, 1, 1, 1,
0.7633701, 1.161014, -1.415948, 1, 1, 1, 1, 1,
0.7655185, -0.6039248, 2.251565, 1, 1, 1, 1, 1,
0.7655995, 0.1690561, 2.115578, 1, 1, 1, 1, 1,
0.7666261, 0.4064511, 1.487122, 1, 1, 1, 1, 1,
0.7734425, 0.6814139, 1.352629, 1, 1, 1, 1, 1,
0.7745941, 0.6030908, 1.581755, 1, 1, 1, 1, 1,
0.782914, 1.679386, -0.4089985, 1, 1, 1, 1, 1,
0.7831619, 1.880936, 0.8175018, 1, 1, 1, 1, 1,
0.7938877, 1.830723, 1.521377, 1, 1, 1, 1, 1,
0.7944114, 0.4177969, 0.1681778, 1, 1, 1, 1, 1,
0.7960925, -1.597947, 1.894688, 1, 1, 1, 1, 1,
0.7961629, -0.3762259, 2.135332, 1, 1, 1, 1, 1,
0.8027552, -0.684765, 1.241039, 0, 0, 1, 1, 1,
0.813822, -0.1209919, 0.419227, 1, 0, 0, 1, 1,
0.8157889, 1.036423, -0.09144451, 1, 0, 0, 1, 1,
0.8158435, 0.5457554, 0.5972409, 1, 0, 0, 1, 1,
0.8220515, -0.1345722, 2.167058, 1, 0, 0, 1, 1,
0.8235268, 0.5960769, 1.555372, 1, 0, 0, 1, 1,
0.8279446, -0.8820668, 2.886141, 0, 0, 0, 1, 1,
0.8281094, 0.01230108, 0.7462753, 0, 0, 0, 1, 1,
0.8292438, 2.656815, 0.6814959, 0, 0, 0, 1, 1,
0.8304861, 0.9214274, 0.7700548, 0, 0, 0, 1, 1,
0.8312417, -0.9885135, 1.952106, 0, 0, 0, 1, 1,
0.8324562, 0.2296219, 2.52457, 0, 0, 0, 1, 1,
0.832494, -0.6790495, 2.614961, 0, 0, 0, 1, 1,
0.8352717, 1.30493, 0.1233672, 1, 1, 1, 1, 1,
0.8356283, 0.5084415, -0.614192, 1, 1, 1, 1, 1,
0.8363498, -0.0988037, 0.7779465, 1, 1, 1, 1, 1,
0.8412905, -1.2495, 4.754506, 1, 1, 1, 1, 1,
0.8414803, -0.3597773, 3.150276, 1, 1, 1, 1, 1,
0.842924, -0.6515416, 3.830427, 1, 1, 1, 1, 1,
0.84607, -1.39323, 3.35405, 1, 1, 1, 1, 1,
0.8475521, -1.496795, 2.079832, 1, 1, 1, 1, 1,
0.8500312, -0.3745839, 1.581507, 1, 1, 1, 1, 1,
0.8502381, 0.7625719, 1.610673, 1, 1, 1, 1, 1,
0.8621534, 0.9281263, 1.599227, 1, 1, 1, 1, 1,
0.8643436, -1.175171, 2.084995, 1, 1, 1, 1, 1,
0.8662742, 1.560253, 0.4157503, 1, 1, 1, 1, 1,
0.8710037, -0.1750527, 3.044041, 1, 1, 1, 1, 1,
0.8711267, 1.38469, -1.805991, 1, 1, 1, 1, 1,
0.8810221, -1.356741, 2.575249, 0, 0, 1, 1, 1,
0.8832685, 1.355316, 1.375138, 1, 0, 0, 1, 1,
0.8862077, 1.578396, 0.5643232, 1, 0, 0, 1, 1,
0.8884492, 0.3720625, 0.9485034, 1, 0, 0, 1, 1,
0.8887421, -0.9115801, 1.971734, 1, 0, 0, 1, 1,
0.8900142, -0.7425602, 2.40965, 1, 0, 0, 1, 1,
0.8971294, 0.261462, 1.850851, 0, 0, 0, 1, 1,
0.899904, -0.9573721, 2.870219, 0, 0, 0, 1, 1,
0.9013265, -1.520802, 2.948907, 0, 0, 0, 1, 1,
0.9039555, 0.7941902, 0.05517042, 0, 0, 0, 1, 1,
0.9041381, 0.3866425, -0.6987926, 0, 0, 0, 1, 1,
0.929256, -1.617391, 1.567647, 0, 0, 0, 1, 1,
0.9305076, 0.2682784, 1.301186, 0, 0, 0, 1, 1,
0.9363104, 0.9313893, 0.06350892, 1, 1, 1, 1, 1,
0.9385068, 0.2825894, 0.5012226, 1, 1, 1, 1, 1,
0.9440097, 1.988535, -0.57313, 1, 1, 1, 1, 1,
0.9505247, 0.4125559, 0.454835, 1, 1, 1, 1, 1,
0.9561396, -1.199885, 2.083765, 1, 1, 1, 1, 1,
0.9654751, 0.08262116, 1.186806, 1, 1, 1, 1, 1,
0.9656734, -0.5175583, 2.477984, 1, 1, 1, 1, 1,
0.9667526, 1.794231, -0.1007968, 1, 1, 1, 1, 1,
0.9702468, 1.256678, 1.197666, 1, 1, 1, 1, 1,
0.9709506, -0.9688525, 2.91092, 1, 1, 1, 1, 1,
0.9744427, 1.656162, 1.209355, 1, 1, 1, 1, 1,
0.9808491, -0.5491121, 2.064716, 1, 1, 1, 1, 1,
0.9835755, -0.6072782, 3.742501, 1, 1, 1, 1, 1,
0.9870247, 0.6240146, 1.738915, 1, 1, 1, 1, 1,
0.9891884, -0.335674, 1.806819, 1, 1, 1, 1, 1,
0.9941927, 0.4965939, 0.8269076, 0, 0, 1, 1, 1,
0.9972607, 0.5971829, 1.889451, 1, 0, 0, 1, 1,
1.009028, 2.484087, 0.4687831, 1, 0, 0, 1, 1,
1.01627, 0.03711393, 1.371049, 1, 0, 0, 1, 1,
1.017941, -1.541173, 2.292673, 1, 0, 0, 1, 1,
1.024937, -0.194686, 2.140346, 1, 0, 0, 1, 1,
1.029792, 1.644513, 0.8480108, 0, 0, 0, 1, 1,
1.035748, 1.27733, 1.555581, 0, 0, 0, 1, 1,
1.046764, -1.478356, 1.527221, 0, 0, 0, 1, 1,
1.047788, -1.925136, 3.510526, 0, 0, 0, 1, 1,
1.055455, -0.4284191, 1.188337, 0, 0, 0, 1, 1,
1.056987, -1.622572, 3.269419, 0, 0, 0, 1, 1,
1.058557, 0.6984497, 1.492043, 0, 0, 0, 1, 1,
1.065581, 0.879476, 1.351459, 1, 1, 1, 1, 1,
1.068418, 1.013473, 1.379307, 1, 1, 1, 1, 1,
1.070069, 1.461209, 1.059868, 1, 1, 1, 1, 1,
1.085255, 1.014257, 1.231107, 1, 1, 1, 1, 1,
1.090835, 0.04655189, -0.1144698, 1, 1, 1, 1, 1,
1.09158, 1.108612, 1.715198, 1, 1, 1, 1, 1,
1.091607, 1.682459, -1.065021, 1, 1, 1, 1, 1,
1.100998, -0.4801538, 3.162777, 1, 1, 1, 1, 1,
1.101833, -0.9423501, 1.1714, 1, 1, 1, 1, 1,
1.104312, -0.6489502, 0.8253391, 1, 1, 1, 1, 1,
1.112777, 0.8451468, -0.4788686, 1, 1, 1, 1, 1,
1.119945, 0.7505823, 2.293448, 1, 1, 1, 1, 1,
1.121423, -0.4818258, 3.265351, 1, 1, 1, 1, 1,
1.123637, -0.5650101, 2.740186, 1, 1, 1, 1, 1,
1.132289, 2.191103, 1.159603, 1, 1, 1, 1, 1,
1.134117, 0.5154939, 1.945852, 0, 0, 1, 1, 1,
1.142628, 0.4325967, 0.6965532, 1, 0, 0, 1, 1,
1.148686, -0.1489582, 0.8748996, 1, 0, 0, 1, 1,
1.157377, -0.4384629, 1.303386, 1, 0, 0, 1, 1,
1.158548, -1.390027, 1.770354, 1, 0, 0, 1, 1,
1.174795, -0.838721, 2.221124, 1, 0, 0, 1, 1,
1.176894, 2.147461, -1.276109, 0, 0, 0, 1, 1,
1.179423, 0.3325713, 2.376449, 0, 0, 0, 1, 1,
1.186314, -1.369243, 3.167081, 0, 0, 0, 1, 1,
1.18787, 0.982631, -1.230942, 0, 0, 0, 1, 1,
1.19411, -0.429289, 3.146544, 0, 0, 0, 1, 1,
1.196401, -0.662513, 2.068027, 0, 0, 0, 1, 1,
1.208188, -0.4959698, 1.772536, 0, 0, 0, 1, 1,
1.218201, -0.1497456, 0.8549809, 1, 1, 1, 1, 1,
1.221759, 2.474838, 0.6917901, 1, 1, 1, 1, 1,
1.223033, -2.192458, 2.08448, 1, 1, 1, 1, 1,
1.224585, -0.02588168, 3.092797, 1, 1, 1, 1, 1,
1.22538, 0.2977816, 1.86773, 1, 1, 1, 1, 1,
1.225384, 0.2737022, 1.467473, 1, 1, 1, 1, 1,
1.227316, 0.8634789, 0.7937077, 1, 1, 1, 1, 1,
1.231706, -0.7659645, 1.84298, 1, 1, 1, 1, 1,
1.251476, -1.677134, 2.2926, 1, 1, 1, 1, 1,
1.253281, 0.07222842, 2.833675, 1, 1, 1, 1, 1,
1.254067, -0.2815659, 1.623306, 1, 1, 1, 1, 1,
1.260218, -1.670626, 3.354386, 1, 1, 1, 1, 1,
1.267247, -1.987469, 3.971065, 1, 1, 1, 1, 1,
1.285521, 0.1447616, 2.014, 1, 1, 1, 1, 1,
1.287013, 1.123002, 0.7395649, 1, 1, 1, 1, 1,
1.287668, 0.1047297, 1.085888, 0, 0, 1, 1, 1,
1.289027, 0.5702977, 2.147028, 1, 0, 0, 1, 1,
1.299035, 0.08901634, 2.590356, 1, 0, 0, 1, 1,
1.311045, 1.6387, -0.4988061, 1, 0, 0, 1, 1,
1.31404, 2.679651, 1.966536, 1, 0, 0, 1, 1,
1.314679, -0.05023129, 1.099051, 1, 0, 0, 1, 1,
1.320349, 0.9863681, -0.0141088, 0, 0, 0, 1, 1,
1.321523, -2.772862, 0.9281864, 0, 0, 0, 1, 1,
1.322309, 0.5123995, 2.47507, 0, 0, 0, 1, 1,
1.345926, 0.1851318, 1.619788, 0, 0, 0, 1, 1,
1.352918, 0.02651383, 0.2176841, 0, 0, 0, 1, 1,
1.355347, -1.114093, 2.780715, 0, 0, 0, 1, 1,
1.365489, 0.9769084, 1.319982, 0, 0, 0, 1, 1,
1.375852, 0.2828893, 0.2004021, 1, 1, 1, 1, 1,
1.377186, -0.5687487, 1.922747, 1, 1, 1, 1, 1,
1.382832, 0.6068139, -0.8506635, 1, 1, 1, 1, 1,
1.383427, 1.046145, 1.266965, 1, 1, 1, 1, 1,
1.393867, -0.564908, 1.829356, 1, 1, 1, 1, 1,
1.396866, -0.558308, 1.754124, 1, 1, 1, 1, 1,
1.398407, 1.295437, 1.48883, 1, 1, 1, 1, 1,
1.416677, 1.187275, 1.756139, 1, 1, 1, 1, 1,
1.417849, 0.1139436, 0.7317848, 1, 1, 1, 1, 1,
1.421047, 0.07911553, 0.9885855, 1, 1, 1, 1, 1,
1.432569, 0.7969541, -0.1928412, 1, 1, 1, 1, 1,
1.442433, -0.06386902, 1.381562, 1, 1, 1, 1, 1,
1.443459, -1.241914, -1.750993, 1, 1, 1, 1, 1,
1.458606, 0.2352318, 0.7060768, 1, 1, 1, 1, 1,
1.461466, -0.2048074, 1.279131, 1, 1, 1, 1, 1,
1.463507, 0.1471802, 0.1923593, 0, 0, 1, 1, 1,
1.476879, -0.2307774, 1.823506, 1, 0, 0, 1, 1,
1.483721, 0.2503814, 1.675545, 1, 0, 0, 1, 1,
1.485362, -0.5353426, 2.798191, 1, 0, 0, 1, 1,
1.502646, -0.109449, 1.827381, 1, 0, 0, 1, 1,
1.543874, -0.4152451, 1.699437, 1, 0, 0, 1, 1,
1.55413, 0.3833875, 1.253123, 0, 0, 0, 1, 1,
1.563624, 0.1296139, 0.5612783, 0, 0, 0, 1, 1,
1.569841, -0.3760369, 1.915605, 0, 0, 0, 1, 1,
1.575121, -2.069674, 2.913356, 0, 0, 0, 1, 1,
1.586643, 0.2911612, 1.435306, 0, 0, 0, 1, 1,
1.587083, 0.6484665, 1.995216, 0, 0, 0, 1, 1,
1.611746, 0.6276055, 1.170808, 0, 0, 0, 1, 1,
1.624897, -0.4555674, 2.165252, 1, 1, 1, 1, 1,
1.62588, -0.05573799, 1.039198, 1, 1, 1, 1, 1,
1.627054, -0.5823762, 0.8915766, 1, 1, 1, 1, 1,
1.641075, 1.073226, 0.07429162, 1, 1, 1, 1, 1,
1.654087, -0.1255605, 2.20789, 1, 1, 1, 1, 1,
1.663769, -0.7530888, 1.603632, 1, 1, 1, 1, 1,
1.665804, -0.5342198, 1.45976, 1, 1, 1, 1, 1,
1.700007, 1.779749, 0.2145444, 1, 1, 1, 1, 1,
1.700016, 0.4486578, 2.77227, 1, 1, 1, 1, 1,
1.704582, 1.432479, 0.2510546, 1, 1, 1, 1, 1,
1.718595, 2.307279, 1.483469, 1, 1, 1, 1, 1,
1.726319, 0.7884196, 1.236702, 1, 1, 1, 1, 1,
1.730086, 0.8757612, 0.7469444, 1, 1, 1, 1, 1,
1.737371, 0.3184708, 2.961568, 1, 1, 1, 1, 1,
1.747406, 0.01760079, 1.262189, 1, 1, 1, 1, 1,
1.759637, -0.1111873, 0.809982, 0, 0, 1, 1, 1,
1.766795, 0.8465169, -0.4096682, 1, 0, 0, 1, 1,
1.79168, 0.4512657, 1.515933, 1, 0, 0, 1, 1,
1.792513, -0.3801247, 4.802789, 1, 0, 0, 1, 1,
1.794436, 0.8565571, 0.1328722, 1, 0, 0, 1, 1,
1.8235, -0.1296593, 0.8504623, 1, 0, 0, 1, 1,
1.824705, 0.8668662, 1.587229, 0, 0, 0, 1, 1,
1.833801, 1.966545, 1.545595, 0, 0, 0, 1, 1,
1.893297, 1.611261, 0.1909305, 0, 0, 0, 1, 1,
1.899839, 0.1539017, 0.1450652, 0, 0, 0, 1, 1,
1.919465, -1.034367, 2.021139, 0, 0, 0, 1, 1,
1.952006, -1.560528, 2.483041, 0, 0, 0, 1, 1,
1.958715, -0.6798697, 3.215908, 0, 0, 0, 1, 1,
1.962427, 0.4051851, 0.8569585, 1, 1, 1, 1, 1,
1.969553, 0.6388227, 1.646478, 1, 1, 1, 1, 1,
1.98512, -0.09812005, 2.525251, 1, 1, 1, 1, 1,
1.997765, 0.2635089, 1.942491, 1, 1, 1, 1, 1,
1.999847, -0.2797382, 1.735173, 1, 1, 1, 1, 1,
2.003253, -0.188362, -0.9874085, 1, 1, 1, 1, 1,
2.047197, -0.9854105, 2.776253, 1, 1, 1, 1, 1,
2.054898, 0.4098211, 0.563976, 1, 1, 1, 1, 1,
2.057667, -0.3538261, 2.905063, 1, 1, 1, 1, 1,
2.064526, 1.500221, -0.3265831, 1, 1, 1, 1, 1,
2.065254, -0.7952818, 2.553738, 1, 1, 1, 1, 1,
2.075165, -0.3883795, 2.764274, 1, 1, 1, 1, 1,
2.113681, 0.438824, 1.210702, 1, 1, 1, 1, 1,
2.116222, 0.8705783, 0.8242421, 1, 1, 1, 1, 1,
2.147005, 0.509073, 1.329333, 1, 1, 1, 1, 1,
2.156096, -2.022288, 1.3196, 0, 0, 1, 1, 1,
2.17873, -0.1272524, 1.777352, 1, 0, 0, 1, 1,
2.186047, 0.5037683, 1.407633, 1, 0, 0, 1, 1,
2.200881, -0.8088835, 2.124925, 1, 0, 0, 1, 1,
2.213657, -0.3226406, 1.261223, 1, 0, 0, 1, 1,
2.215632, 0.2789081, 1.169751, 1, 0, 0, 1, 1,
2.215829, 0.4630356, 2.913583, 0, 0, 0, 1, 1,
2.229544, 1.095835, 1.296971, 0, 0, 0, 1, 1,
2.268955, -0.7108973, 3.736474, 0, 0, 0, 1, 1,
2.27305, -0.007270882, 1.496728, 0, 0, 0, 1, 1,
2.285843, 0.1211615, 1.117855, 0, 0, 0, 1, 1,
2.287343, -1.752203, 3.388946, 0, 0, 0, 1, 1,
2.356222, -1.708786, 2.268849, 0, 0, 0, 1, 1,
2.392262, 0.5719726, 1.197556, 1, 1, 1, 1, 1,
2.404478, 0.4157884, 1.446207, 1, 1, 1, 1, 1,
2.467556, 1.029884, 0.8612011, 1, 1, 1, 1, 1,
2.496978, -0.8740361, 1.807345, 1, 1, 1, 1, 1,
2.559317, 0.7589578, 1.122962, 1, 1, 1, 1, 1,
2.654506, -0.3467398, 2.212173, 1, 1, 1, 1, 1,
2.72172, -0.469233, 2.293023, 1, 1, 1, 1, 1
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
var radius = 9.855814;
var distance = 34.61813;
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
mvMatrix.translate( 0.7261018, 0.2533424, 0.2365801 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.61813);
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
