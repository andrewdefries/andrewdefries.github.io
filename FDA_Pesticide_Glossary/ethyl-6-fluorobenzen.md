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
-2.75612, -1.574523, -0.5048412, 1, 0, 0, 1,
-2.697373, 1.080816, -0.07698401, 1, 0.007843138, 0, 1,
-2.666944, -0.3431882, -3.319779, 1, 0.01176471, 0, 1,
-2.564831, 1.036355, -0.7636724, 1, 0.01960784, 0, 1,
-2.522018, 2.208033, 0.3617446, 1, 0.02352941, 0, 1,
-2.504141, 0.5577807, -0.1801161, 1, 0.03137255, 0, 1,
-2.479092, 1.079621, -1.474691, 1, 0.03529412, 0, 1,
-2.460426, 0.6074695, -1.432185, 1, 0.04313726, 0, 1,
-2.452969, 0.124902, -1.957663, 1, 0.04705882, 0, 1,
-2.417219, 1.503033, -0.1630287, 1, 0.05490196, 0, 1,
-2.261758, 0.201807, -1.552256, 1, 0.05882353, 0, 1,
-2.233135, 0.5188523, -1.080434, 1, 0.06666667, 0, 1,
-2.192836, -0.8707031, -1.92287, 1, 0.07058824, 0, 1,
-2.178116, 0.489358, -2.317626, 1, 0.07843138, 0, 1,
-2.176347, 0.4199335, -2.237407, 1, 0.08235294, 0, 1,
-2.1304, 0.1394783, -1.319392, 1, 0.09019608, 0, 1,
-2.110211, -0.1047702, -2.94647, 1, 0.09411765, 0, 1,
-2.107602, 0.4389055, -2.230803, 1, 0.1019608, 0, 1,
-2.106735, 1.076883, -2.70917, 1, 0.1098039, 0, 1,
-2.106292, 0.2634198, -1.972264, 1, 0.1137255, 0, 1,
-2.076883, 0.2716616, -1.41748, 1, 0.1215686, 0, 1,
-2.071224, -0.06690135, -2.830216, 1, 0.1254902, 0, 1,
-2.052329, 0.549851, -3.575282, 1, 0.1333333, 0, 1,
-2.041298, -0.4571672, -2.945314, 1, 0.1372549, 0, 1,
-2.012022, 0.5695805, -3.040395, 1, 0.145098, 0, 1,
-2.005897, -1.593155, -2.456893, 1, 0.1490196, 0, 1,
-1.995751, 0.547172, -1.616341, 1, 0.1568628, 0, 1,
-1.967224, -1.850902, -3.507253, 1, 0.1607843, 0, 1,
-1.953177, 2.892818, -1.593568, 1, 0.1686275, 0, 1,
-1.930222, 0.2284336, -1.461829, 1, 0.172549, 0, 1,
-1.896881, -1.292825, -3.247897, 1, 0.1803922, 0, 1,
-1.881941, 0.8524154, -1.116987, 1, 0.1843137, 0, 1,
-1.875335, 1.567729, -1.010021, 1, 0.1921569, 0, 1,
-1.873965, -2.143631, -3.808327, 1, 0.1960784, 0, 1,
-1.863234, 2.476805, -3.769734, 1, 0.2039216, 0, 1,
-1.859601, -0.7255155, -1.606004, 1, 0.2117647, 0, 1,
-1.827084, -0.1026225, -0.2633671, 1, 0.2156863, 0, 1,
-1.821626, 0.1285902, -1.475377, 1, 0.2235294, 0, 1,
-1.807137, 1.235875, -3.365698, 1, 0.227451, 0, 1,
-1.793176, 2.278235, -1.624955, 1, 0.2352941, 0, 1,
-1.779416, 2.051155, -2.023108, 1, 0.2392157, 0, 1,
-1.757459, -1.595546, -2.423013, 1, 0.2470588, 0, 1,
-1.754126, 0.02046134, -2.668019, 1, 0.2509804, 0, 1,
-1.742171, 1.156462, -0.330707, 1, 0.2588235, 0, 1,
-1.73905, -0.3568578, -0.09086292, 1, 0.2627451, 0, 1,
-1.71629, -0.4026767, -0.8297254, 1, 0.2705882, 0, 1,
-1.704083, -1.928376, -2.30596, 1, 0.2745098, 0, 1,
-1.680121, -0.1035936, -1.050427, 1, 0.282353, 0, 1,
-1.673097, -0.03537234, -2.285477, 1, 0.2862745, 0, 1,
-1.670089, 0.8604128, -2.102216, 1, 0.2941177, 0, 1,
-1.657339, 1.566387, -2.176419, 1, 0.3019608, 0, 1,
-1.649856, 0.7087969, -0.8648645, 1, 0.3058824, 0, 1,
-1.649189, 1.009253, -0.8071224, 1, 0.3137255, 0, 1,
-1.636486, -0.5711058, -1.295218, 1, 0.3176471, 0, 1,
-1.634741, -0.04135867, -2.200518, 1, 0.3254902, 0, 1,
-1.618845, 0.6977435, -0.8430021, 1, 0.3294118, 0, 1,
-1.616163, -0.3232838, -0.9485465, 1, 0.3372549, 0, 1,
-1.605702, -1.521716, -2.578682, 1, 0.3411765, 0, 1,
-1.599182, 0.05940752, -2.185735, 1, 0.3490196, 0, 1,
-1.553778, 0.03573974, -1.537832, 1, 0.3529412, 0, 1,
-1.525486, 0.5033658, -2.110769, 1, 0.3607843, 0, 1,
-1.499902, 1.730716, 0.911102, 1, 0.3647059, 0, 1,
-1.48602, 0.003104024, -1.475998, 1, 0.372549, 0, 1,
-1.445694, 0.2708434, -0.9444822, 1, 0.3764706, 0, 1,
-1.444926, 1.769325, -1.961573, 1, 0.3843137, 0, 1,
-1.43549, 0.6833726, -1.503555, 1, 0.3882353, 0, 1,
-1.430822, -0.4905283, -3.280559, 1, 0.3960784, 0, 1,
-1.427511, 0.4118346, -0.8349243, 1, 0.4039216, 0, 1,
-1.422312, 1.489677, -1.381129, 1, 0.4078431, 0, 1,
-1.422021, 0.5994333, 0.4249854, 1, 0.4156863, 0, 1,
-1.420232, -0.4212149, -0.3904208, 1, 0.4196078, 0, 1,
-1.419783, -2.705606, -2.059771, 1, 0.427451, 0, 1,
-1.416102, 0.09983266, -0.6689202, 1, 0.4313726, 0, 1,
-1.414768, -1.988184, -1.430574, 1, 0.4392157, 0, 1,
-1.404357, -1.944662, -2.826836, 1, 0.4431373, 0, 1,
-1.397273, 1.06544, 0.6274834, 1, 0.4509804, 0, 1,
-1.38835, -0.8579316, -1.104492, 1, 0.454902, 0, 1,
-1.386332, -0.3479622, -0.5466651, 1, 0.4627451, 0, 1,
-1.385257, -0.5985809, -2.415923, 1, 0.4666667, 0, 1,
-1.380746, 0.06882489, -1.196484, 1, 0.4745098, 0, 1,
-1.369447, 0.04904912, -2.698418, 1, 0.4784314, 0, 1,
-1.36168, -1.646105, -2.981152, 1, 0.4862745, 0, 1,
-1.360708, -0.3722426, -2.099995, 1, 0.4901961, 0, 1,
-1.360594, -0.9052625, -3.13354, 1, 0.4980392, 0, 1,
-1.359083, 0.1432624, -2.27609, 1, 0.5058824, 0, 1,
-1.356657, 0.7787002, -1.024424, 1, 0.509804, 0, 1,
-1.354616, 0.1677584, -1.873447, 1, 0.5176471, 0, 1,
-1.342162, 1.228795, -1.263639, 1, 0.5215687, 0, 1,
-1.339049, -0.4195787, -1.746847, 1, 0.5294118, 0, 1,
-1.335912, 1.319092, -0.8646092, 1, 0.5333334, 0, 1,
-1.335824, 1.283281, -0.3487055, 1, 0.5411765, 0, 1,
-1.3316, -0.07941205, -1.708323, 1, 0.5450981, 0, 1,
-1.328117, -0.3289143, -1.649803, 1, 0.5529412, 0, 1,
-1.325181, -0.1395946, -2.497188, 1, 0.5568628, 0, 1,
-1.323431, 1.044875, -1.176714, 1, 0.5647059, 0, 1,
-1.304522, 1.582881, -0.4417633, 1, 0.5686275, 0, 1,
-1.301219, 0.1194582, -0.4462409, 1, 0.5764706, 0, 1,
-1.295022, -0.9943438, -2.440807, 1, 0.5803922, 0, 1,
-1.288808, -1.68869, -3.403387, 1, 0.5882353, 0, 1,
-1.273634, -1.739259, -3.854191, 1, 0.5921569, 0, 1,
-1.263519, 0.1980263, -0.9122386, 1, 0.6, 0, 1,
-1.26263, -1.2095, -2.658576, 1, 0.6078432, 0, 1,
-1.261489, 0.2814303, -0.7844346, 1, 0.6117647, 0, 1,
-1.257908, -0.499723, -1.524031, 1, 0.6196079, 0, 1,
-1.25601, 0.3097659, -1.27811, 1, 0.6235294, 0, 1,
-1.244596, 1.225567, -2.310793, 1, 0.6313726, 0, 1,
-1.236083, -0.5437215, -1.227702, 1, 0.6352941, 0, 1,
-1.235781, 0.02294597, -0.836804, 1, 0.6431373, 0, 1,
-1.228852, -0.7636375, -1.032449, 1, 0.6470588, 0, 1,
-1.227763, 0.3216985, 0.2433878, 1, 0.654902, 0, 1,
-1.227478, -1.972987, -2.662364, 1, 0.6588235, 0, 1,
-1.227277, -1.237946, -1.554951, 1, 0.6666667, 0, 1,
-1.226044, -1.366313, -2.610945, 1, 0.6705883, 0, 1,
-1.221035, -0.06722454, -0.4112495, 1, 0.6784314, 0, 1,
-1.212439, 1.66666, -0.6177187, 1, 0.682353, 0, 1,
-1.208777, -0.006639909, -1.885808, 1, 0.6901961, 0, 1,
-1.200924, 0.7023419, -0.4824434, 1, 0.6941177, 0, 1,
-1.199138, -0.6846927, -0.7488797, 1, 0.7019608, 0, 1,
-1.198806, -0.03805532, -1.652888, 1, 0.7098039, 0, 1,
-1.198601, 1.924578, -2.182323, 1, 0.7137255, 0, 1,
-1.196, -0.4303237, -3.472686, 1, 0.7215686, 0, 1,
-1.191408, 0.4552056, -0.4032246, 1, 0.7254902, 0, 1,
-1.190903, 0.8701463, 0.2487352, 1, 0.7333333, 0, 1,
-1.189957, -1.636361, -4.569381, 1, 0.7372549, 0, 1,
-1.180835, 1.857527, -0.8923598, 1, 0.7450981, 0, 1,
-1.178661, -0.616702, -1.096877, 1, 0.7490196, 0, 1,
-1.176702, -0.3628051, -0.8252147, 1, 0.7568628, 0, 1,
-1.174728, 0.3384814, -3.604822, 1, 0.7607843, 0, 1,
-1.169849, 0.1258842, -1.734473, 1, 0.7686275, 0, 1,
-1.165435, 1.420495, -2.103577, 1, 0.772549, 0, 1,
-1.161975, 0.08134098, -1.208508, 1, 0.7803922, 0, 1,
-1.159316, 1.549477, 0.1883661, 1, 0.7843137, 0, 1,
-1.158937, -1.389279, -2.541455, 1, 0.7921569, 0, 1,
-1.158712, 0.5175444, -1.851298, 1, 0.7960784, 0, 1,
-1.148097, -0.09322453, -2.961637, 1, 0.8039216, 0, 1,
-1.143855, 0.2765214, -2.646308, 1, 0.8117647, 0, 1,
-1.14172, -3.183066, -3.19729, 1, 0.8156863, 0, 1,
-1.132151, -0.2323892, -2.710988, 1, 0.8235294, 0, 1,
-1.124349, -0.6516376, -2.866603, 1, 0.827451, 0, 1,
-1.10866, 0.4720657, -2.184069, 1, 0.8352941, 0, 1,
-1.096779, 0.1298709, -0.9714163, 1, 0.8392157, 0, 1,
-1.094931, -0.4796632, -3.542995, 1, 0.8470588, 0, 1,
-1.085877, -1.458608, -3.341405, 1, 0.8509804, 0, 1,
-1.081815, 1.072307, -0.8230364, 1, 0.8588235, 0, 1,
-1.078462, -1.38169, -3.3136, 1, 0.8627451, 0, 1,
-1.077383, -1.385529, -2.935588, 1, 0.8705882, 0, 1,
-1.073131, 1.556042, -0.4480511, 1, 0.8745098, 0, 1,
-1.068259, 0.5417448, -2.829363, 1, 0.8823529, 0, 1,
-1.064195, -1.680185, -3.295194, 1, 0.8862745, 0, 1,
-1.063599, 0.9498189, 0.4290556, 1, 0.8941177, 0, 1,
-1.055782, 0.02035827, 0.005743338, 1, 0.8980392, 0, 1,
-1.055618, -0.06803407, -1.52221, 1, 0.9058824, 0, 1,
-1.05271, 1.058776, -1.980965, 1, 0.9137255, 0, 1,
-1.052094, 0.6754816, -0.006170457, 1, 0.9176471, 0, 1,
-1.049569, -1.033606, -3.268754, 1, 0.9254902, 0, 1,
-1.048591, -1.232953, -3.372718, 1, 0.9294118, 0, 1,
-1.047832, -0.6687792, -1.694774, 1, 0.9372549, 0, 1,
-1.037961, 0.7627875, -1.615244, 1, 0.9411765, 0, 1,
-1.036172, -0.4811794, -1.900026, 1, 0.9490196, 0, 1,
-1.025076, 0.161758, -2.458284, 1, 0.9529412, 0, 1,
-1.023659, 0.7147008, 0.0920972, 1, 0.9607843, 0, 1,
-1.017798, 0.9419985, -1.105391, 1, 0.9647059, 0, 1,
-1.013664, -0.6530067, -1.845329, 1, 0.972549, 0, 1,
-1.012891, -0.579326, -0.2975713, 1, 0.9764706, 0, 1,
-1.012493, 1.825094, -0.9244042, 1, 0.9843137, 0, 1,
-1.002256, -0.3156523, -1.818222, 1, 0.9882353, 0, 1,
-0.9980022, 0.1039348, -0.6077903, 1, 0.9960784, 0, 1,
-0.9921734, -0.8024225, -3.204648, 0.9960784, 1, 0, 1,
-0.9913544, -1.201097, -2.494304, 0.9921569, 1, 0, 1,
-0.9768315, 0.08912265, -3.105358, 0.9843137, 1, 0, 1,
-0.9675476, -1.325132, -1.617992, 0.9803922, 1, 0, 1,
-0.958764, -0.06047486, -3.219902, 0.972549, 1, 0, 1,
-0.9516033, -1.326629, -3.923669, 0.9686275, 1, 0, 1,
-0.9503385, 0.3203122, -3.465701, 0.9607843, 1, 0, 1,
-0.9475207, -0.04750287, -3.0618, 0.9568627, 1, 0, 1,
-0.9468461, -0.2531629, -2.323961, 0.9490196, 1, 0, 1,
-0.945834, 2.568935, -0.5458654, 0.945098, 1, 0, 1,
-0.9452446, -1.322361, -2.473114, 0.9372549, 1, 0, 1,
-0.9371392, 0.2937836, -0.4338612, 0.9333333, 1, 0, 1,
-0.9358624, -0.4040361, -3.030137, 0.9254902, 1, 0, 1,
-0.9352378, -0.2593753, -2.379313, 0.9215686, 1, 0, 1,
-0.9343678, 0.391176, -2.450196, 0.9137255, 1, 0, 1,
-0.9312615, -0.643977, -1.667994, 0.9098039, 1, 0, 1,
-0.9289813, 0.2396688, -1.292747, 0.9019608, 1, 0, 1,
-0.9246391, 1.234136, -0.5545247, 0.8941177, 1, 0, 1,
-0.9239355, -1.125408, -1.486514, 0.8901961, 1, 0, 1,
-0.9231803, -0.7717578, -1.80085, 0.8823529, 1, 0, 1,
-0.9216304, 0.5149615, -1.863079, 0.8784314, 1, 0, 1,
-0.9203855, -0.7192364, -1.229916, 0.8705882, 1, 0, 1,
-0.9143041, -0.5591716, -1.051146, 0.8666667, 1, 0, 1,
-0.9102218, -0.5178104, -2.340167, 0.8588235, 1, 0, 1,
-0.9068184, 0.4045879, 0.0104059, 0.854902, 1, 0, 1,
-0.9036245, -0.8802054, -1.875616, 0.8470588, 1, 0, 1,
-0.886569, 0.5229433, 1.372564, 0.8431373, 1, 0, 1,
-0.8864491, 1.613541, -0.8448168, 0.8352941, 1, 0, 1,
-0.8808537, 0.5154855, -0.7943931, 0.8313726, 1, 0, 1,
-0.8749357, 0.1353181, -0.8469837, 0.8235294, 1, 0, 1,
-0.8741236, -0.2476915, -2.5261, 0.8196079, 1, 0, 1,
-0.8721485, 0.2031401, -1.253971, 0.8117647, 1, 0, 1,
-0.8654235, -0.6098094, -1.140886, 0.8078431, 1, 0, 1,
-0.857438, 0.7342688, 0.9556759, 0.8, 1, 0, 1,
-0.8553428, -0.1451968, -0.2725968, 0.7921569, 1, 0, 1,
-0.8431702, 0.4924573, -1.162847, 0.7882353, 1, 0, 1,
-0.8379294, 0.005067498, -1.190522, 0.7803922, 1, 0, 1,
-0.8374843, -0.05774163, -0.3277932, 0.7764706, 1, 0, 1,
-0.8325969, -0.4533004, -2.33135, 0.7686275, 1, 0, 1,
-0.8309535, -0.3241532, -2.820364, 0.7647059, 1, 0, 1,
-0.8307444, 0.4572791, -1.059216, 0.7568628, 1, 0, 1,
-0.8188885, -0.5164435, -2.012287, 0.7529412, 1, 0, 1,
-0.8110601, 1.30124, -0.3273044, 0.7450981, 1, 0, 1,
-0.8084761, -0.1461464, -0.5390352, 0.7411765, 1, 0, 1,
-0.8081821, 0.4425246, -1.811062, 0.7333333, 1, 0, 1,
-0.8066512, 0.4226983, -1.760961, 0.7294118, 1, 0, 1,
-0.7983475, -0.5100018, -2.940869, 0.7215686, 1, 0, 1,
-0.7978812, 0.2262454, 0.2753473, 0.7176471, 1, 0, 1,
-0.7949986, -0.7083553, -2.369334, 0.7098039, 1, 0, 1,
-0.7903364, 0.3359776, -1.818495, 0.7058824, 1, 0, 1,
-0.7861043, -0.6343043, -4.233646, 0.6980392, 1, 0, 1,
-0.7815117, 1.157521, 1.380114, 0.6901961, 1, 0, 1,
-0.7793238, -1.253254, -1.601805, 0.6862745, 1, 0, 1,
-0.7763389, 0.207757, -0.5733884, 0.6784314, 1, 0, 1,
-0.7753217, 0.007265576, 0.2467882, 0.6745098, 1, 0, 1,
-0.7677977, 1.39042, -0.6837879, 0.6666667, 1, 0, 1,
-0.7629779, 0.8290641, -0.9098343, 0.6627451, 1, 0, 1,
-0.7551619, -0.1201901, 0.1083973, 0.654902, 1, 0, 1,
-0.7522884, -2.014783, -4.003405, 0.6509804, 1, 0, 1,
-0.7473081, 0.3077046, -2.203452, 0.6431373, 1, 0, 1,
-0.7453312, 1.695421, 0.4279723, 0.6392157, 1, 0, 1,
-0.7413698, 0.8291479, -0.3255237, 0.6313726, 1, 0, 1,
-0.7389136, -0.1930009, -1.358311, 0.627451, 1, 0, 1,
-0.7374301, 0.2562088, -2.129401, 0.6196079, 1, 0, 1,
-0.7332158, 1.066444, 1.102189, 0.6156863, 1, 0, 1,
-0.7329792, 2.498806, -0.08598186, 0.6078432, 1, 0, 1,
-0.7283974, -0.138574, -1.662573, 0.6039216, 1, 0, 1,
-0.7280751, 0.238208, -1.030853, 0.5960785, 1, 0, 1,
-0.7274519, -0.1476529, -2.524165, 0.5882353, 1, 0, 1,
-0.7253271, -1.29213, -1.93978, 0.5843138, 1, 0, 1,
-0.7217615, -1.40857, -2.509181, 0.5764706, 1, 0, 1,
-0.7202104, 0.2107983, -0.06810625, 0.572549, 1, 0, 1,
-0.7149904, 1.145501, -2.101962, 0.5647059, 1, 0, 1,
-0.7036763, 1.417254, -0.9194191, 0.5607843, 1, 0, 1,
-0.6965802, 0.619022, -2.054133, 0.5529412, 1, 0, 1,
-0.6961508, -1.178537, -3.766809, 0.5490196, 1, 0, 1,
-0.6939534, 0.9259502, -1.960049, 0.5411765, 1, 0, 1,
-0.6885905, 1.33282, -0.4069776, 0.5372549, 1, 0, 1,
-0.6839922, 1.162775, -0.5087372, 0.5294118, 1, 0, 1,
-0.6811953, 0.533687, 0.3588829, 0.5254902, 1, 0, 1,
-0.6780693, 0.2577585, -2.013706, 0.5176471, 1, 0, 1,
-0.6725265, 0.01897514, -1.774116, 0.5137255, 1, 0, 1,
-0.6722528, 0.07252098, -1.319309, 0.5058824, 1, 0, 1,
-0.6705063, -0.4299892, -3.242719, 0.5019608, 1, 0, 1,
-0.6697134, 0.8203766, -1.71199, 0.4941176, 1, 0, 1,
-0.6684686, 0.277458, 0.7408527, 0.4862745, 1, 0, 1,
-0.6623128, -0.2022078, -2.268853, 0.4823529, 1, 0, 1,
-0.659273, 0.7046019, -0.693239, 0.4745098, 1, 0, 1,
-0.6590849, -0.9053494, -2.2218, 0.4705882, 1, 0, 1,
-0.6536809, 0.09390068, -1.599851, 0.4627451, 1, 0, 1,
-0.6503609, 1.67627, -1.947218, 0.4588235, 1, 0, 1,
-0.6464844, -0.1305636, -2.144903, 0.4509804, 1, 0, 1,
-0.6405953, 0.0808294, -2.575545, 0.4470588, 1, 0, 1,
-0.6375756, -0.6741446, -1.318443, 0.4392157, 1, 0, 1,
-0.6309861, 1.00556, 0.1088241, 0.4352941, 1, 0, 1,
-0.6228223, -0.1892878, -2.7017, 0.427451, 1, 0, 1,
-0.6143389, 0.005373207, -1.158656, 0.4235294, 1, 0, 1,
-0.6109182, 0.548662, -0.01740204, 0.4156863, 1, 0, 1,
-0.6097975, 0.2201392, -1.129706, 0.4117647, 1, 0, 1,
-0.6063227, -1.968933, -1.907199, 0.4039216, 1, 0, 1,
-0.6024445, -1.216083, -2.042298, 0.3960784, 1, 0, 1,
-0.6004154, 1.036154, -1.147154, 0.3921569, 1, 0, 1,
-0.5969439, 1.348465, -1.520579, 0.3843137, 1, 0, 1,
-0.5958012, 0.5370633, -0.2673317, 0.3803922, 1, 0, 1,
-0.5932375, -2.07881, -3.015754, 0.372549, 1, 0, 1,
-0.5915647, -1.720053, -4.130399, 0.3686275, 1, 0, 1,
-0.5896148, -1.135883, -4.249132, 0.3607843, 1, 0, 1,
-0.5891857, -0.5110507, -2.51809, 0.3568628, 1, 0, 1,
-0.5887151, 1.085012, 0.5078205, 0.3490196, 1, 0, 1,
-0.5869009, 0.2329882, -0.3240881, 0.345098, 1, 0, 1,
-0.5838819, 0.1669233, -1.513861, 0.3372549, 1, 0, 1,
-0.5718624, -0.3471815, -0.8399178, 0.3333333, 1, 0, 1,
-0.5711364, 2.048913, -0.8597689, 0.3254902, 1, 0, 1,
-0.5710994, 0.04618987, -1.154757, 0.3215686, 1, 0, 1,
-0.5697552, -0.7500077, -2.208103, 0.3137255, 1, 0, 1,
-0.5687518, 2.393493, -0.6873542, 0.3098039, 1, 0, 1,
-0.5672724, -0.2211759, -1.555283, 0.3019608, 1, 0, 1,
-0.5664902, 1.431805, -0.8030838, 0.2941177, 1, 0, 1,
-0.5656427, 2.555941, -0.1922275, 0.2901961, 1, 0, 1,
-0.5655678, 1.574515, -0.9570915, 0.282353, 1, 0, 1,
-0.5650771, 0.2657252, -0.8892431, 0.2784314, 1, 0, 1,
-0.5597188, 0.7437283, -0.7382229, 0.2705882, 1, 0, 1,
-0.558558, 0.404766, 0.07010128, 0.2666667, 1, 0, 1,
-0.5580933, 2.115288, -1.001342, 0.2588235, 1, 0, 1,
-0.5574262, -0.1876169, -3.227266, 0.254902, 1, 0, 1,
-0.5554082, -1.392535, -2.150409, 0.2470588, 1, 0, 1,
-0.5541278, 1.578637, -0.3653013, 0.2431373, 1, 0, 1,
-0.5528048, 0.7071892, -1.079234, 0.2352941, 1, 0, 1,
-0.5521702, 1.260498, -0.155918, 0.2313726, 1, 0, 1,
-0.5503328, 1.235701, -0.6094927, 0.2235294, 1, 0, 1,
-0.548912, 0.892181, 0.4869934, 0.2196078, 1, 0, 1,
-0.5468173, -2.745679, -1.990746, 0.2117647, 1, 0, 1,
-0.5464509, 0.2744618, -1.098293, 0.2078431, 1, 0, 1,
-0.5428822, 0.4189668, -0.1060991, 0.2, 1, 0, 1,
-0.5410439, 0.7047844, 0.8997424, 0.1921569, 1, 0, 1,
-0.5397515, -0.8407517, -0.3666879, 0.1882353, 1, 0, 1,
-0.5322506, 0.0359724, -3.450335, 0.1803922, 1, 0, 1,
-0.527409, -0.4594229, -1.742235, 0.1764706, 1, 0, 1,
-0.5272084, 0.01015856, -2.4068, 0.1686275, 1, 0, 1,
-0.5157042, 0.818599, 0.05445005, 0.1647059, 1, 0, 1,
-0.5153401, 1.436303, 0.570031, 0.1568628, 1, 0, 1,
-0.5065814, 1.523046, -0.01098949, 0.1529412, 1, 0, 1,
-0.5062945, 0.1781655, -1.418969, 0.145098, 1, 0, 1,
-0.5043982, 0.6149395, 0.004319744, 0.1411765, 1, 0, 1,
-0.4982116, -2.346678, -3.05898, 0.1333333, 1, 0, 1,
-0.4973414, -0.9727854, -1.805301, 0.1294118, 1, 0, 1,
-0.4967722, -0.295364, -2.18343, 0.1215686, 1, 0, 1,
-0.4939198, -0.6191521, -1.529881, 0.1176471, 1, 0, 1,
-0.4936496, 0.3236688, 0.9910446, 0.1098039, 1, 0, 1,
-0.4907984, -1.39079, -4.613832, 0.1058824, 1, 0, 1,
-0.4881865, -1.265093, -1.431259, 0.09803922, 1, 0, 1,
-0.4875339, -0.3270518, -2.323508, 0.09019608, 1, 0, 1,
-0.4810938, -0.1865066, -2.723482, 0.08627451, 1, 0, 1,
-0.478258, 0.4493532, -0.6547069, 0.07843138, 1, 0, 1,
-0.4762145, 0.1630926, -1.92908, 0.07450981, 1, 0, 1,
-0.4751056, 0.4467157, -1.567937, 0.06666667, 1, 0, 1,
-0.4741383, -1.063038, -1.734482, 0.0627451, 1, 0, 1,
-0.4636989, 1.008311, 0.1071074, 0.05490196, 1, 0, 1,
-0.4598438, -0.6628278, -3.246653, 0.05098039, 1, 0, 1,
-0.4575337, 1.34259, 1.220402, 0.04313726, 1, 0, 1,
-0.455716, -1.639101, -1.869292, 0.03921569, 1, 0, 1,
-0.4505673, -1.727008, -3.068312, 0.03137255, 1, 0, 1,
-0.4489138, -0.1983103, -0.9928612, 0.02745098, 1, 0, 1,
-0.4449281, -0.2532544, -1.709515, 0.01960784, 1, 0, 1,
-0.444023, 0.9634733, -0.09172943, 0.01568628, 1, 0, 1,
-0.4436232, 1.075323, 0.8398442, 0.007843138, 1, 0, 1,
-0.4320246, -1.427478, -3.641266, 0.003921569, 1, 0, 1,
-0.4247384, -0.7386517, -4.813162, 0, 1, 0.003921569, 1,
-0.4239722, 1.156698, -1.042289, 0, 1, 0.01176471, 1,
-0.4227122, -0.4630637, -3.885901, 0, 1, 0.01568628, 1,
-0.4214174, 1.187118, 0.8149273, 0, 1, 0.02352941, 1,
-0.4213212, 0.6531304, -1.906804, 0, 1, 0.02745098, 1,
-0.4201471, -0.189422, -0.8387222, 0, 1, 0.03529412, 1,
-0.4195265, -0.4824823, -1.623979, 0, 1, 0.03921569, 1,
-0.4170908, -1.388479, -4.963495, 0, 1, 0.04705882, 1,
-0.4169466, 0.0306036, -2.465433, 0, 1, 0.05098039, 1,
-0.4102885, -1.420248, -2.911689, 0, 1, 0.05882353, 1,
-0.4058054, -0.2571431, -1.716485, 0, 1, 0.0627451, 1,
-0.4054685, -0.04522188, -1.862551, 0, 1, 0.07058824, 1,
-0.4007238, 0.1653926, -3.025572, 0, 1, 0.07450981, 1,
-0.3946658, -1.385425, -1.787799, 0, 1, 0.08235294, 1,
-0.3939668, 0.5821173, -1.253374, 0, 1, 0.08627451, 1,
-0.3900386, -0.8011636, -1.69465, 0, 1, 0.09411765, 1,
-0.3843647, 0.565603, -0.7023402, 0, 1, 0.1019608, 1,
-0.3834878, 0.738134, -1.264501, 0, 1, 0.1058824, 1,
-0.3757307, -1.517169, -3.5401, 0, 1, 0.1137255, 1,
-0.3744201, 0.230496, -0.5549105, 0, 1, 0.1176471, 1,
-0.3734211, 1.248525, -0.2675132, 0, 1, 0.1254902, 1,
-0.3664291, 1.017168, -0.501333, 0, 1, 0.1294118, 1,
-0.3632764, -0.3814711, -2.809496, 0, 1, 0.1372549, 1,
-0.3616008, 0.02502105, -1.039843, 0, 1, 0.1411765, 1,
-0.3613531, 0.2153809, -1.417884, 0, 1, 0.1490196, 1,
-0.3568755, 1.478596, 1.215464, 0, 1, 0.1529412, 1,
-0.3561815, 2.150769, -2.10356, 0, 1, 0.1607843, 1,
-0.3526605, -1.211355, -1.610804, 0, 1, 0.1647059, 1,
-0.349855, 0.8605626, -0.1316464, 0, 1, 0.172549, 1,
-0.347036, 0.8173956, -0.2639864, 0, 1, 0.1764706, 1,
-0.3460391, 1.481982, -0.876673, 0, 1, 0.1843137, 1,
-0.3361342, 1.42384, -0.4450417, 0, 1, 0.1882353, 1,
-0.335107, 0.3537353, -0.7449406, 0, 1, 0.1960784, 1,
-0.3340045, 0.5561097, -0.4925243, 0, 1, 0.2039216, 1,
-0.3295583, -0.6826377, -4.573703, 0, 1, 0.2078431, 1,
-0.3264538, 1.965735, -1.407575, 0, 1, 0.2156863, 1,
-0.3238316, -0.7660437, -2.451062, 0, 1, 0.2196078, 1,
-0.3233063, -0.5211213, -1.719305, 0, 1, 0.227451, 1,
-0.3230624, -1.437135, -3.187611, 0, 1, 0.2313726, 1,
-0.3202868, -0.8237814, -2.966921, 0, 1, 0.2392157, 1,
-0.3135135, -0.8568497, -1.94837, 0, 1, 0.2431373, 1,
-0.3017606, 0.6220635, -0.5995736, 0, 1, 0.2509804, 1,
-0.3013906, -0.02939585, -1.510358, 0, 1, 0.254902, 1,
-0.3003801, -1.035519, -1.628341, 0, 1, 0.2627451, 1,
-0.2964361, 1.174896, 0.1125518, 0, 1, 0.2666667, 1,
-0.2951272, -0.5212108, -2.179501, 0, 1, 0.2745098, 1,
-0.2941776, -0.1103451, -1.951509, 0, 1, 0.2784314, 1,
-0.2830025, -0.5307528, -3.353991, 0, 1, 0.2862745, 1,
-0.2797541, -0.5715164, -0.7386695, 0, 1, 0.2901961, 1,
-0.2754334, -0.1206017, -1.167338, 0, 1, 0.2980392, 1,
-0.272284, 0.3620217, -2.492117, 0, 1, 0.3058824, 1,
-0.2720133, -0.2466434, -1.211727, 0, 1, 0.3098039, 1,
-0.2720122, -0.4389738, -2.972493, 0, 1, 0.3176471, 1,
-0.2717414, 1.176659, 2.059153, 0, 1, 0.3215686, 1,
-0.2700557, -0.3976353, -1.951378, 0, 1, 0.3294118, 1,
-0.2651446, -1.489993, -2.531167, 0, 1, 0.3333333, 1,
-0.2628921, 0.9112721, 0.09486289, 0, 1, 0.3411765, 1,
-0.2598645, 0.5232806, -0.7011428, 0, 1, 0.345098, 1,
-0.2595783, -1.931821, -3.469456, 0, 1, 0.3529412, 1,
-0.2583497, 0.05819034, -1.409763, 0, 1, 0.3568628, 1,
-0.2555671, -1.042481, -2.31697, 0, 1, 0.3647059, 1,
-0.2545157, 0.7015399, -0.2285334, 0, 1, 0.3686275, 1,
-0.2532762, 0.01964751, -0.625722, 0, 1, 0.3764706, 1,
-0.2526281, 0.4077874, -0.600673, 0, 1, 0.3803922, 1,
-0.2512709, 1.180278, 1.130061, 0, 1, 0.3882353, 1,
-0.2505698, 0.05150981, -1.670246, 0, 1, 0.3921569, 1,
-0.2455697, -0.9075778, -3.699071, 0, 1, 0.4, 1,
-0.2452769, 0.1982773, -2.349123, 0, 1, 0.4078431, 1,
-0.2450914, 1.545881, -1.413568, 0, 1, 0.4117647, 1,
-0.2435325, -0.1303202, -2.46681, 0, 1, 0.4196078, 1,
-0.2416511, -2.840444, -3.157189, 0, 1, 0.4235294, 1,
-0.2382643, 0.9952647, -1.653306, 0, 1, 0.4313726, 1,
-0.2368777, -0.06867445, -0.6185761, 0, 1, 0.4352941, 1,
-0.2333807, -1.829308, -4.049141, 0, 1, 0.4431373, 1,
-0.2322567, 1.806258, -0.5291606, 0, 1, 0.4470588, 1,
-0.2289986, -1.584562, -2.894779, 0, 1, 0.454902, 1,
-0.2284268, -1.029471, -2.346513, 0, 1, 0.4588235, 1,
-0.2277424, -1.014091, -3.420988, 0, 1, 0.4666667, 1,
-0.2266395, -1.248382, -3.835502, 0, 1, 0.4705882, 1,
-0.2196263, 0.9437395, -0.4478385, 0, 1, 0.4784314, 1,
-0.21868, -0.6894954, -2.425719, 0, 1, 0.4823529, 1,
-0.2172518, 0.7997655, 1.760663, 0, 1, 0.4901961, 1,
-0.2166974, 1.37852, -0.127356, 0, 1, 0.4941176, 1,
-0.2165476, 1.241595, 0.5580369, 0, 1, 0.5019608, 1,
-0.2148753, -1.964247, -2.96345, 0, 1, 0.509804, 1,
-0.2141374, -2.367632, -3.772472, 0, 1, 0.5137255, 1,
-0.2134694, 0.3439304, -0.04158096, 0, 1, 0.5215687, 1,
-0.2118197, 1.27198, 1.225038, 0, 1, 0.5254902, 1,
-0.2108676, 1.461399, -1.314251, 0, 1, 0.5333334, 1,
-0.2089141, 0.7628195, -2.23627, 0, 1, 0.5372549, 1,
-0.2077932, 0.4510635, -0.9125428, 0, 1, 0.5450981, 1,
-0.2071413, -1.428974, -3.208698, 0, 1, 0.5490196, 1,
-0.2033476, -0.06189111, -1.927676, 0, 1, 0.5568628, 1,
-0.199934, -1.694779, -1.873458, 0, 1, 0.5607843, 1,
-0.193218, 1.275299, -0.2510493, 0, 1, 0.5686275, 1,
-0.1889065, 0.4559622, -1.913926, 0, 1, 0.572549, 1,
-0.1887092, 0.8429195, -0.1472839, 0, 1, 0.5803922, 1,
-0.1862649, -0.3430026, -1.698278, 0, 1, 0.5843138, 1,
-0.1853182, -1.784288, -2.71136, 0, 1, 0.5921569, 1,
-0.1814811, -0.717855, -3.046935, 0, 1, 0.5960785, 1,
-0.1752053, -0.5391483, -2.955135, 0, 1, 0.6039216, 1,
-0.1741077, -0.0916153, -1.387295, 0, 1, 0.6117647, 1,
-0.1740953, 0.7304642, -0.1162672, 0, 1, 0.6156863, 1,
-0.1633563, -1.61704, -2.315152, 0, 1, 0.6235294, 1,
-0.1562468, -0.9465744, -2.7631, 0, 1, 0.627451, 1,
-0.1549828, 0.8044574, -0.64626, 0, 1, 0.6352941, 1,
-0.1489992, 0.1392838, -0.4302426, 0, 1, 0.6392157, 1,
-0.1477675, 0.4861707, -2.214117, 0, 1, 0.6470588, 1,
-0.1475918, 0.62391, -1.450284, 0, 1, 0.6509804, 1,
-0.1439283, 0.7741334, -2.004522, 0, 1, 0.6588235, 1,
-0.1416987, 0.9800074, -1.736192, 0, 1, 0.6627451, 1,
-0.1333839, -0.1935534, -1.545269, 0, 1, 0.6705883, 1,
-0.1313888, -0.2247469, -2.237377, 0, 1, 0.6745098, 1,
-0.1289853, 1.659404, 0.748112, 0, 1, 0.682353, 1,
-0.1279065, 1.081909, -0.6903341, 0, 1, 0.6862745, 1,
-0.1270631, -1.085723, -2.809189, 0, 1, 0.6941177, 1,
-0.1249001, -0.5146797, -3.734132, 0, 1, 0.7019608, 1,
-0.1213001, -0.2281034, -1.763555, 0, 1, 0.7058824, 1,
-0.1211353, -2.415376, -2.928826, 0, 1, 0.7137255, 1,
-0.1200518, 0.4810151, -0.3962008, 0, 1, 0.7176471, 1,
-0.1173395, 0.4279121, -1.32866, 0, 1, 0.7254902, 1,
-0.1125961, -0.5098173, -4.197557, 0, 1, 0.7294118, 1,
-0.1078242, -0.3781945, -3.626508, 0, 1, 0.7372549, 1,
-0.10731, -1.207064, -1.82594, 0, 1, 0.7411765, 1,
-0.1032311, 0.5623584, -1.331676, 0, 1, 0.7490196, 1,
-0.09787945, 0.3971764, 0.05928399, 0, 1, 0.7529412, 1,
-0.09691809, -0.3131204, -2.311596, 0, 1, 0.7607843, 1,
-0.09487315, -0.7106877, -2.369098, 0, 1, 0.7647059, 1,
-0.09362545, -0.1955488, -2.274571, 0, 1, 0.772549, 1,
-0.09255648, 0.2511639, 0.3984917, 0, 1, 0.7764706, 1,
-0.09181301, -1.482181, -3.403009, 0, 1, 0.7843137, 1,
-0.09152932, 0.5958519, -0.472829, 0, 1, 0.7882353, 1,
-0.08968611, -0.7610465, -2.496336, 0, 1, 0.7960784, 1,
-0.08950705, 0.8441789, 0.7702457, 0, 1, 0.8039216, 1,
-0.08819693, -0.4464251, -3.222927, 0, 1, 0.8078431, 1,
-0.08572372, 1.342118, 0.2139698, 0, 1, 0.8156863, 1,
-0.0840075, 1.459911, 1.664286, 0, 1, 0.8196079, 1,
-0.07775599, 1.824556, 0.2898111, 0, 1, 0.827451, 1,
-0.07747487, -0.7310632, -5.131672, 0, 1, 0.8313726, 1,
-0.07600689, 0.8870416, -0.1045121, 0, 1, 0.8392157, 1,
-0.07512529, 0.3086533, 0.3992217, 0, 1, 0.8431373, 1,
-0.07436736, 1.947482, 1.40598, 0, 1, 0.8509804, 1,
-0.0723518, -1.567505, -3.772059, 0, 1, 0.854902, 1,
-0.0625207, 0.2309344, -0.4491075, 0, 1, 0.8627451, 1,
-0.05769298, -0.5440239, -2.664305, 0, 1, 0.8666667, 1,
-0.0569706, 1.596315, 0.3822458, 0, 1, 0.8745098, 1,
-0.05649395, 0.8196511, -0.3733224, 0, 1, 0.8784314, 1,
-0.05303527, 0.7075538, 0.1189456, 0, 1, 0.8862745, 1,
-0.05022283, -0.7679268, -1.607552, 0, 1, 0.8901961, 1,
-0.04832372, -1.071131, -4.065449, 0, 1, 0.8980392, 1,
-0.04408722, 0.8377715, 0.0427995, 0, 1, 0.9058824, 1,
-0.0379046, 0.1748243, -2.608265, 0, 1, 0.9098039, 1,
-0.03423749, -1.086979, -3.465156, 0, 1, 0.9176471, 1,
-0.02832602, 0.3316434, 0.1074441, 0, 1, 0.9215686, 1,
-0.02432786, -0.8461322, -2.633659, 0, 1, 0.9294118, 1,
-0.02210429, -0.5207342, -4.593842, 0, 1, 0.9333333, 1,
-0.02035357, -1.992461, -2.756012, 0, 1, 0.9411765, 1,
-0.01871748, -0.3764618, -3.664859, 0, 1, 0.945098, 1,
-0.01677315, -0.7054467, -3.061988, 0, 1, 0.9529412, 1,
-0.01304987, -0.1233298, -2.483842, 0, 1, 0.9568627, 1,
0.0037189, 0.2066536, 0.8404061, 0, 1, 0.9647059, 1,
0.004456449, -0.1385329, 4.502003, 0, 1, 0.9686275, 1,
0.008463919, 0.7652421, -3.201162, 0, 1, 0.9764706, 1,
0.01075589, -0.8427426, 4.484598, 0, 1, 0.9803922, 1,
0.0108899, 2.232535, 0.7919863, 0, 1, 0.9882353, 1,
0.01533657, 0.6858745, 0.9272902, 0, 1, 0.9921569, 1,
0.01793493, -0.4269061, 2.207241, 0, 1, 1, 1,
0.01795916, 2.008097, 0.7280978, 0, 0.9921569, 1, 1,
0.02034224, 0.01827105, 0.7013253, 0, 0.9882353, 1, 1,
0.02456814, -1.792892, 3.795776, 0, 0.9803922, 1, 1,
0.02727679, -0.1987674, 4.489879, 0, 0.9764706, 1, 1,
0.03074249, 1.464882, -1.172871, 0, 0.9686275, 1, 1,
0.0325348, -0.654398, 2.401444, 0, 0.9647059, 1, 1,
0.03384161, 0.05072188, 0.567274, 0, 0.9568627, 1, 1,
0.03642417, 0.9724007, 0.5817378, 0, 0.9529412, 1, 1,
0.03755752, -1.778255, 4.21835, 0, 0.945098, 1, 1,
0.03765306, -0.4192157, 3.268717, 0, 0.9411765, 1, 1,
0.03855601, -1.59937, 2.73238, 0, 0.9333333, 1, 1,
0.0416591, 0.8431918, 2.410152, 0, 0.9294118, 1, 1,
0.04177887, -1.078331, 2.913927, 0, 0.9215686, 1, 1,
0.04419399, -1.941601, 3.696328, 0, 0.9176471, 1, 1,
0.04482571, -0.06850754, 0.001700784, 0, 0.9098039, 1, 1,
0.04843584, -0.3119943, 2.501954, 0, 0.9058824, 1, 1,
0.04852605, -0.7837761, 2.903721, 0, 0.8980392, 1, 1,
0.04991755, 0.3041382, 1.07619, 0, 0.8901961, 1, 1,
0.05014742, 0.4058623, 0.6004196, 0, 0.8862745, 1, 1,
0.05395063, -0.606416, 3.405661, 0, 0.8784314, 1, 1,
0.0540834, -0.7617481, 6.367185, 0, 0.8745098, 1, 1,
0.05708711, -1.557239, 2.589778, 0, 0.8666667, 1, 1,
0.0576011, -0.101324, 3.516228, 0, 0.8627451, 1, 1,
0.05920482, -1.482599, 4.703137, 0, 0.854902, 1, 1,
0.05923599, -0.4335419, 1.590416, 0, 0.8509804, 1, 1,
0.06395061, 0.7836117, 1.259758, 0, 0.8431373, 1, 1,
0.0649033, -0.1930229, 1.083804, 0, 0.8392157, 1, 1,
0.06782936, 1.074723, -0.4035926, 0, 0.8313726, 1, 1,
0.06791893, 0.8666167, 0.8532029, 0, 0.827451, 1, 1,
0.07140625, -0.1115726, 3.201427, 0, 0.8196079, 1, 1,
0.07251516, 1.400336, 0.9039659, 0, 0.8156863, 1, 1,
0.07430913, 1.37805, 1.089391, 0, 0.8078431, 1, 1,
0.07458686, 0.05219928, -0.9884528, 0, 0.8039216, 1, 1,
0.07505208, 2.182102, -0.3948494, 0, 0.7960784, 1, 1,
0.07949974, 0.7786185, 0.3375839, 0, 0.7882353, 1, 1,
0.08022182, 0.8962979, -0.2726583, 0, 0.7843137, 1, 1,
0.08217362, -0.04241002, 1.37522, 0, 0.7764706, 1, 1,
0.08475625, -1.21892, 2.17921, 0, 0.772549, 1, 1,
0.08786576, 0.3216786, -0.8454254, 0, 0.7647059, 1, 1,
0.08800755, -1.225158, 3.999546, 0, 0.7607843, 1, 1,
0.08891061, 0.1494113, 0.3593081, 0, 0.7529412, 1, 1,
0.0892098, 0.2559383, -0.3015407, 0, 0.7490196, 1, 1,
0.09308749, -0.5721496, 3.67554, 0, 0.7411765, 1, 1,
0.09591349, 0.439839, 0.142558, 0, 0.7372549, 1, 1,
0.1000771, 0.2616607, -0.5117579, 0, 0.7294118, 1, 1,
0.1007128, 0.5985255, -0.6829066, 0, 0.7254902, 1, 1,
0.1012027, 2.053138, 0.6835487, 0, 0.7176471, 1, 1,
0.1021436, -1.079258, 3.535291, 0, 0.7137255, 1, 1,
0.1045425, -3.141237, 3.492028, 0, 0.7058824, 1, 1,
0.1073109, 0.2299401, -0.1914791, 0, 0.6980392, 1, 1,
0.1122854, -0.7965867, 2.149716, 0, 0.6941177, 1, 1,
0.116562, 0.6611247, 0.588936, 0, 0.6862745, 1, 1,
0.1188459, -1.850218, 2.288181, 0, 0.682353, 1, 1,
0.1219157, 0.1895149, 0.3536403, 0, 0.6745098, 1, 1,
0.1221458, 1.299388, -1.941512, 0, 0.6705883, 1, 1,
0.124282, -1.286939, 4.482447, 0, 0.6627451, 1, 1,
0.1245306, -0.7635764, 2.552994, 0, 0.6588235, 1, 1,
0.1273353, 1.298069, -0.5943653, 0, 0.6509804, 1, 1,
0.1273801, 0.4559759, -1.432183, 0, 0.6470588, 1, 1,
0.128952, -1.834906, 4.397378, 0, 0.6392157, 1, 1,
0.1324172, 0.8273981, -0.3529134, 0, 0.6352941, 1, 1,
0.1333297, 0.4178119, -0.1233012, 0, 0.627451, 1, 1,
0.1333985, 0.6215472, -0.6595087, 0, 0.6235294, 1, 1,
0.1377724, 0.755183, -0.3214191, 0, 0.6156863, 1, 1,
0.1408228, -1.018669, 1.402453, 0, 0.6117647, 1, 1,
0.1467167, -0.877419, 0.9923585, 0, 0.6039216, 1, 1,
0.1507883, -0.614724, 3.99655, 0, 0.5960785, 1, 1,
0.1526151, 0.3051254, -0.7394176, 0, 0.5921569, 1, 1,
0.1534637, -0.7797523, 3.19343, 0, 0.5843138, 1, 1,
0.1556962, 0.5024328, 1.668208, 0, 0.5803922, 1, 1,
0.1569981, -0.9514519, 1.437336, 0, 0.572549, 1, 1,
0.1571558, -0.3659962, 3.255898, 0, 0.5686275, 1, 1,
0.1580462, 0.3679699, 0.8365195, 0, 0.5607843, 1, 1,
0.1624412, 0.1071819, 0.6742321, 0, 0.5568628, 1, 1,
0.1642144, 1.481763, -0.1777338, 0, 0.5490196, 1, 1,
0.1659742, -0.653384, 2.480564, 0, 0.5450981, 1, 1,
0.1676289, 2.279314, 1.863212, 0, 0.5372549, 1, 1,
0.1693286, -1.277709, 0.7433154, 0, 0.5333334, 1, 1,
0.1694186, -0.05951285, 1.764969, 0, 0.5254902, 1, 1,
0.1722182, 0.9770371, -0.2565554, 0, 0.5215687, 1, 1,
0.1738783, 1.405323, 0.3150049, 0, 0.5137255, 1, 1,
0.1749576, -2.128709, 1.010264, 0, 0.509804, 1, 1,
0.1768166, -1.579581, 4.495975, 0, 0.5019608, 1, 1,
0.177384, -1.318664, 2.882315, 0, 0.4941176, 1, 1,
0.1788076, 0.1394462, -0.3649314, 0, 0.4901961, 1, 1,
0.1811916, -0.9643474, 3.425358, 0, 0.4823529, 1, 1,
0.1906927, -0.0227562, 1.208457, 0, 0.4784314, 1, 1,
0.1910685, 0.5463275, -0.4829461, 0, 0.4705882, 1, 1,
0.1933731, -0.6240934, 2.967321, 0, 0.4666667, 1, 1,
0.1965978, 0.4567502, 0.6306829, 0, 0.4588235, 1, 1,
0.1978472, 0.9346028, 0.8065738, 0, 0.454902, 1, 1,
0.1991095, -0.07679678, 2.002171, 0, 0.4470588, 1, 1,
0.1996799, -0.2771166, 3.944346, 0, 0.4431373, 1, 1,
0.2004114, -0.765428, 2.53087, 0, 0.4352941, 1, 1,
0.2010676, -0.2900484, 1.870474, 0, 0.4313726, 1, 1,
0.2035059, -1.117695, 2.942734, 0, 0.4235294, 1, 1,
0.2040108, 1.281529, 0.4990325, 0, 0.4196078, 1, 1,
0.2054932, -0.05090259, 1.784032, 0, 0.4117647, 1, 1,
0.2105479, -1.045717, 3.75464, 0, 0.4078431, 1, 1,
0.213073, 1.437125, -0.06563396, 0, 0.4, 1, 1,
0.2255626, -0.6639583, 4.527218, 0, 0.3921569, 1, 1,
0.2279698, 0.4670039, 0.3874162, 0, 0.3882353, 1, 1,
0.228104, -0.08983608, 2.011746, 0, 0.3803922, 1, 1,
0.2313249, -1.298905, 1.612337, 0, 0.3764706, 1, 1,
0.2313489, -0.1302456, 2.227216, 0, 0.3686275, 1, 1,
0.2327147, 0.1486011, 1.073211, 0, 0.3647059, 1, 1,
0.235397, 0.2392197, 1.139256, 0, 0.3568628, 1, 1,
0.2432179, 0.08965646, 0.7793187, 0, 0.3529412, 1, 1,
0.2535924, -1.261569, 2.916298, 0, 0.345098, 1, 1,
0.2599039, -0.09619634, 1.714719, 0, 0.3411765, 1, 1,
0.2604463, 0.3744624, 0.8472573, 0, 0.3333333, 1, 1,
0.2631969, 1.244146, -0.7269971, 0, 0.3294118, 1, 1,
0.26449, -0.2949021, 1.379258, 0, 0.3215686, 1, 1,
0.2660002, -0.9754717, 2.162903, 0, 0.3176471, 1, 1,
0.2683511, 0.7368293, 0.1787504, 0, 0.3098039, 1, 1,
0.2729038, -1.159143, 0.7059592, 0, 0.3058824, 1, 1,
0.2756053, -0.8277336, 3.525882, 0, 0.2980392, 1, 1,
0.2807858, -0.7477255, 2.70882, 0, 0.2901961, 1, 1,
0.2823305, 1.150417, 2.112812, 0, 0.2862745, 1, 1,
0.2883355, 0.6006074, 1.774565, 0, 0.2784314, 1, 1,
0.2903876, 1.106369, 1.238327, 0, 0.2745098, 1, 1,
0.291927, 0.5357623, -0.1497614, 0, 0.2666667, 1, 1,
0.2941801, 0.6482338, -0.2097885, 0, 0.2627451, 1, 1,
0.2949445, 0.5938891, 0.3601187, 0, 0.254902, 1, 1,
0.2968951, -1.086159, 2.628681, 0, 0.2509804, 1, 1,
0.2981278, 0.9361281, -0.2030026, 0, 0.2431373, 1, 1,
0.3013082, -0.8324787, 6.121896, 0, 0.2392157, 1, 1,
0.3047214, -1.126165, 1.123721, 0, 0.2313726, 1, 1,
0.3092713, -2.324996, 3.502515, 0, 0.227451, 1, 1,
0.3095233, 0.4585371, -0.2510957, 0, 0.2196078, 1, 1,
0.3140495, 0.3387536, 1.185799, 0, 0.2156863, 1, 1,
0.3172767, -0.5903316, 5.237564, 0, 0.2078431, 1, 1,
0.3191832, 1.331321, 1.201712, 0, 0.2039216, 1, 1,
0.3213274, -0.5220836, 3.552657, 0, 0.1960784, 1, 1,
0.3219055, -1.486172, 3.768939, 0, 0.1882353, 1, 1,
0.3267977, -1.198135, 3.79428, 0, 0.1843137, 1, 1,
0.3278408, 0.8313995, -0.1490705, 0, 0.1764706, 1, 1,
0.3293923, 0.5584339, 0.4907169, 0, 0.172549, 1, 1,
0.337422, 0.3572415, -1.599222, 0, 0.1647059, 1, 1,
0.3377653, -0.8290415, 5.166121, 0, 0.1607843, 1, 1,
0.337829, 0.6974467, 2.084673, 0, 0.1529412, 1, 1,
0.3381681, 0.4128852, 0.6364723, 0, 0.1490196, 1, 1,
0.3400021, -0.9745454, 4.319642, 0, 0.1411765, 1, 1,
0.3411877, -0.7583321, 2.807397, 0, 0.1372549, 1, 1,
0.3462443, -0.1250416, 1.960582, 0, 0.1294118, 1, 1,
0.3483978, -0.05688753, 3.289478, 0, 0.1254902, 1, 1,
0.3495159, -0.2597453, 2.094829, 0, 0.1176471, 1, 1,
0.3502177, -1.449093, 1.964227, 0, 0.1137255, 1, 1,
0.3506708, -0.8570623, 3.492154, 0, 0.1058824, 1, 1,
0.3524314, 0.3122317, 1.471299, 0, 0.09803922, 1, 1,
0.3544725, 0.1748379, 0.3567037, 0, 0.09411765, 1, 1,
0.3569947, 0.3210513, 1.45329, 0, 0.08627451, 1, 1,
0.3749545, 1.194045, 0.2082095, 0, 0.08235294, 1, 1,
0.3775119, -0.1454889, 1.176401, 0, 0.07450981, 1, 1,
0.3797784, 0.06123531, 0.9249204, 0, 0.07058824, 1, 1,
0.3886832, 0.8434786, -0.7749317, 0, 0.0627451, 1, 1,
0.3933983, -0.5874946, 4.347408, 0, 0.05882353, 1, 1,
0.3935025, -0.9743096, 1.900117, 0, 0.05098039, 1, 1,
0.3965521, -0.08929248, 2.032288, 0, 0.04705882, 1, 1,
0.3969035, 0.4268284, 0.04887865, 0, 0.03921569, 1, 1,
0.3973992, 0.5511459, 3.344334, 0, 0.03529412, 1, 1,
0.3988364, -2.441919, 0.7274954, 0, 0.02745098, 1, 1,
0.4032411, -1.230772, 4.106468, 0, 0.02352941, 1, 1,
0.4055729, -1.073523, 2.799177, 0, 0.01568628, 1, 1,
0.4103189, -1.90984, 2.430795, 0, 0.01176471, 1, 1,
0.411106, -2.523588, 3.121974, 0, 0.003921569, 1, 1,
0.4113682, -0.4644955, 0.6989291, 0.003921569, 0, 1, 1,
0.417372, 0.1279817, 2.245818, 0.007843138, 0, 1, 1,
0.4229315, 0.772055, 1.748092, 0.01568628, 0, 1, 1,
0.4272592, 0.1011817, 1.825339, 0.01960784, 0, 1, 1,
0.4293358, -0.6644132, 2.653055, 0.02745098, 0, 1, 1,
0.4354437, 1.921203, 0.9800464, 0.03137255, 0, 1, 1,
0.4372945, 0.4004169, -1.005126, 0.03921569, 0, 1, 1,
0.4385811, -0.5233228, 1.803796, 0.04313726, 0, 1, 1,
0.4405441, 0.03303804, 1.883291, 0.05098039, 0, 1, 1,
0.4432926, -1.149565, 1.437795, 0.05490196, 0, 1, 1,
0.4454418, -0.3397793, 0.2499349, 0.0627451, 0, 1, 1,
0.4488609, -1.560928, 3.277477, 0.06666667, 0, 1, 1,
0.4519381, 1.110734, 1.337927, 0.07450981, 0, 1, 1,
0.4521978, 0.3858781, 0.1476921, 0.07843138, 0, 1, 1,
0.4533718, -0.6564643, 1.726769, 0.08627451, 0, 1, 1,
0.4548994, 0.2287107, 1.367341, 0.09019608, 0, 1, 1,
0.4566958, 0.5255729, 1.673988, 0.09803922, 0, 1, 1,
0.4609426, 1.488775, 1.847685, 0.1058824, 0, 1, 1,
0.461541, 1.236119, -0.185038, 0.1098039, 0, 1, 1,
0.4620363, -1.110277, 3.309119, 0.1176471, 0, 1, 1,
0.4627914, -0.5716279, 3.280853, 0.1215686, 0, 1, 1,
0.4646044, 0.7558277, 0.8937224, 0.1294118, 0, 1, 1,
0.4677323, -0.1782649, 3.2934, 0.1333333, 0, 1, 1,
0.4680675, 1.062195, -0.9287745, 0.1411765, 0, 1, 1,
0.4723967, 2.103096, -0.6084502, 0.145098, 0, 1, 1,
0.4739204, 1.692092, 2.272308, 0.1529412, 0, 1, 1,
0.475118, -0.6279621, 3.612432, 0.1568628, 0, 1, 1,
0.4807804, 1.974751, 0.2655276, 0.1647059, 0, 1, 1,
0.4857132, 0.1444511, 1.846982, 0.1686275, 0, 1, 1,
0.4864324, -1.317886, 3.033206, 0.1764706, 0, 1, 1,
0.4864402, 0.3237104, 1.838543, 0.1803922, 0, 1, 1,
0.4963512, 0.9413639, 0.4079924, 0.1882353, 0, 1, 1,
0.4987259, 0.08988516, 0.5650129, 0.1921569, 0, 1, 1,
0.5006578, -0.3497148, 2.797156, 0.2, 0, 1, 1,
0.5032532, -1.392289, 3.412773, 0.2078431, 0, 1, 1,
0.5066099, -0.1770311, 1.821856, 0.2117647, 0, 1, 1,
0.5083697, 0.3655712, 1.117089, 0.2196078, 0, 1, 1,
0.5179215, 1.175223, 0.4780727, 0.2235294, 0, 1, 1,
0.5182572, 0.6352437, 0.192333, 0.2313726, 0, 1, 1,
0.5230504, -0.5848798, 3.576316, 0.2352941, 0, 1, 1,
0.5235488, -0.3575525, 2.698219, 0.2431373, 0, 1, 1,
0.5250936, -1.238935, 3.556971, 0.2470588, 0, 1, 1,
0.5332808, -1.635249, 2.986291, 0.254902, 0, 1, 1,
0.5386127, -0.1772941, 2.481774, 0.2588235, 0, 1, 1,
0.538676, 1.168355, -0.5155583, 0.2666667, 0, 1, 1,
0.5398495, 1.158723, 0.378813, 0.2705882, 0, 1, 1,
0.5403008, -0.7752586, 3.144346, 0.2784314, 0, 1, 1,
0.5444829, -0.5277675, 2.678143, 0.282353, 0, 1, 1,
0.5490723, 0.8970358, 0.3056702, 0.2901961, 0, 1, 1,
0.549242, 0.5988566, 0.3385919, 0.2941177, 0, 1, 1,
0.551345, 1.437559, 1.546686, 0.3019608, 0, 1, 1,
0.5552399, -1.216644, 4.548536, 0.3098039, 0, 1, 1,
0.5560503, 1.415775, -0.5756692, 0.3137255, 0, 1, 1,
0.5560946, 2.096792, -0.4243498, 0.3215686, 0, 1, 1,
0.5585421, 0.9614201, -0.1072313, 0.3254902, 0, 1, 1,
0.5626769, 0.6316732, 1.355309, 0.3333333, 0, 1, 1,
0.5656163, -1.094832, 3.755695, 0.3372549, 0, 1, 1,
0.566482, -1.318071, 3.91545, 0.345098, 0, 1, 1,
0.5726677, -0.2607268, 1.816825, 0.3490196, 0, 1, 1,
0.5740073, 0.5421315, 1.157619, 0.3568628, 0, 1, 1,
0.5769258, -1.428018, 3.022897, 0.3607843, 0, 1, 1,
0.5793668, -1.413332, 3.683677, 0.3686275, 0, 1, 1,
0.5834286, -1.191477, 1.346429, 0.372549, 0, 1, 1,
0.5850919, -1.585682, 1.921041, 0.3803922, 0, 1, 1,
0.5898244, -0.2932978, 1.261231, 0.3843137, 0, 1, 1,
0.601779, -0.5939805, 2.452622, 0.3921569, 0, 1, 1,
0.6041814, -0.509737, 1.026788, 0.3960784, 0, 1, 1,
0.6140893, -1.103182, 2.328228, 0.4039216, 0, 1, 1,
0.6144568, -1.167709, 2.097978, 0.4117647, 0, 1, 1,
0.6175602, 0.5269142, 1.634299, 0.4156863, 0, 1, 1,
0.6217849, 0.2934218, 1.462068, 0.4235294, 0, 1, 1,
0.6312938, 2.214842, 2.050173, 0.427451, 0, 1, 1,
0.6329145, 1.067026, -0.5709185, 0.4352941, 0, 1, 1,
0.6331113, 1.67163, -0.8046641, 0.4392157, 0, 1, 1,
0.6340696, 1.324555, -0.6553422, 0.4470588, 0, 1, 1,
0.6353125, -0.2404056, 2.700512, 0.4509804, 0, 1, 1,
0.6416767, -0.8776368, 1.250054, 0.4588235, 0, 1, 1,
0.6469196, 0.2900609, 0.8288114, 0.4627451, 0, 1, 1,
0.6503483, -1.482778, 3.021487, 0.4705882, 0, 1, 1,
0.6672802, 1.594186, 2.114205, 0.4745098, 0, 1, 1,
0.6706309, -0.6958002, 2.471102, 0.4823529, 0, 1, 1,
0.6716639, 1.204601, -0.03351677, 0.4862745, 0, 1, 1,
0.6753038, -0.9712933, 2.538083, 0.4941176, 0, 1, 1,
0.6775027, -1.828953, 3.584599, 0.5019608, 0, 1, 1,
0.6778216, -1.065982, 2.176041, 0.5058824, 0, 1, 1,
0.6793491, -0.2249792, 1.254868, 0.5137255, 0, 1, 1,
0.6803177, -0.4780354, 0.691193, 0.5176471, 0, 1, 1,
0.6848922, 1.873603, -1.150748, 0.5254902, 0, 1, 1,
0.6910658, 1.070606, -0.205701, 0.5294118, 0, 1, 1,
0.6946618, -1.939271, 2.537594, 0.5372549, 0, 1, 1,
0.6957715, 1.939551, -1.37571, 0.5411765, 0, 1, 1,
0.6969815, -1.842913, 3.903386, 0.5490196, 0, 1, 1,
0.6990583, 0.6618992, 0.4425522, 0.5529412, 0, 1, 1,
0.6995727, -0.25846, 2.00099, 0.5607843, 0, 1, 1,
0.7004159, 0.5177461, 2.421877, 0.5647059, 0, 1, 1,
0.700716, -0.598047, 3.30696, 0.572549, 0, 1, 1,
0.701229, 0.6360381, 0.1820246, 0.5764706, 0, 1, 1,
0.70478, -0.04870081, 2.436374, 0.5843138, 0, 1, 1,
0.7050838, -2.046366, 1.688908, 0.5882353, 0, 1, 1,
0.7082584, 0.5425851, 0.3994318, 0.5960785, 0, 1, 1,
0.7088612, 0.5726032, 1.915192, 0.6039216, 0, 1, 1,
0.7127866, -0.9165598, 2.676885, 0.6078432, 0, 1, 1,
0.714821, 1.228781, 3.656144, 0.6156863, 0, 1, 1,
0.7165855, 0.5468814, 1.268649, 0.6196079, 0, 1, 1,
0.721157, -0.2629682, 2.609329, 0.627451, 0, 1, 1,
0.7293125, 1.135041, 0.03622475, 0.6313726, 0, 1, 1,
0.7310175, -0.2779393, 0.5939867, 0.6392157, 0, 1, 1,
0.7399695, -1.060549, 0.8363629, 0.6431373, 0, 1, 1,
0.7472338, 0.8708336, 2.917962, 0.6509804, 0, 1, 1,
0.752369, 1.28881, 0.9091187, 0.654902, 0, 1, 1,
0.7525465, -1.186502, 2.092265, 0.6627451, 0, 1, 1,
0.753514, -1.664627, 1.561019, 0.6666667, 0, 1, 1,
0.7606799, 1.21121, 1.572271, 0.6745098, 0, 1, 1,
0.7666511, -0.6760455, 2.886026, 0.6784314, 0, 1, 1,
0.76855, -0.6671032, 3.301903, 0.6862745, 0, 1, 1,
0.7686853, -0.756648, 3.115114, 0.6901961, 0, 1, 1,
0.7686943, -0.5353843, 2.37682, 0.6980392, 0, 1, 1,
0.7721022, 0.2135316, 0.4207726, 0.7058824, 0, 1, 1,
0.7724806, 0.2684373, 0.597001, 0.7098039, 0, 1, 1,
0.7739132, -0.6293395, 1.129664, 0.7176471, 0, 1, 1,
0.7739981, 0.5610119, 0.7137171, 0.7215686, 0, 1, 1,
0.7794013, 0.4555743, 2.969139, 0.7294118, 0, 1, 1,
0.7822925, -1.787868, 3.615089, 0.7333333, 0, 1, 1,
0.7867429, -0.1276384, 0.3526623, 0.7411765, 0, 1, 1,
0.7879657, 1.728715, -0.2569816, 0.7450981, 0, 1, 1,
0.7944224, -0.05476912, 0.7549269, 0.7529412, 0, 1, 1,
0.7952708, 0.05199861, 0.1857279, 0.7568628, 0, 1, 1,
0.7954192, -0.1271827, 2.600585, 0.7647059, 0, 1, 1,
0.7960812, 2.047417, 0.683251, 0.7686275, 0, 1, 1,
0.8005748, -0.6524766, 2.879838, 0.7764706, 0, 1, 1,
0.8022552, -0.5265599, 1.316885, 0.7803922, 0, 1, 1,
0.8062426, 0.2820295, -0.651887, 0.7882353, 0, 1, 1,
0.8087425, -0.1795473, 1.280082, 0.7921569, 0, 1, 1,
0.8163638, 1.841343, 1.092849, 0.8, 0, 1, 1,
0.8217001, 2.03537, 0.5662238, 0.8078431, 0, 1, 1,
0.830304, -2.120002, 2.097407, 0.8117647, 0, 1, 1,
0.8311144, -0.9135573, 3.173289, 0.8196079, 0, 1, 1,
0.8315668, -0.3286799, 1.677027, 0.8235294, 0, 1, 1,
0.8406593, -2.255109, 2.764674, 0.8313726, 0, 1, 1,
0.8416091, 0.6690701, 1.926605, 0.8352941, 0, 1, 1,
0.8421542, -0.627067, 2.036077, 0.8431373, 0, 1, 1,
0.8465908, -0.5391005, 1.422899, 0.8470588, 0, 1, 1,
0.8515344, -1.421365, 2.896481, 0.854902, 0, 1, 1,
0.8569029, 0.6010148, 1.851349, 0.8588235, 0, 1, 1,
0.8581303, 0.2026095, 0.7524602, 0.8666667, 0, 1, 1,
0.8663113, -0.321476, 1.15081, 0.8705882, 0, 1, 1,
0.8664353, 0.1122791, 0.7081648, 0.8784314, 0, 1, 1,
0.8694405, -1.227903, 2.086265, 0.8823529, 0, 1, 1,
0.8726404, 0.8800185, 1.194662, 0.8901961, 0, 1, 1,
0.8744076, 0.5793314, -0.275098, 0.8941177, 0, 1, 1,
0.8860653, -1.339618, 3.56734, 0.9019608, 0, 1, 1,
0.891247, -0.8471566, 0.5389213, 0.9098039, 0, 1, 1,
0.9001892, -0.01935969, 2.191702, 0.9137255, 0, 1, 1,
0.905385, -0.2537629, 1.888008, 0.9215686, 0, 1, 1,
0.9096983, 0.05026164, 0.7589238, 0.9254902, 0, 1, 1,
0.9168695, -1.762166, 0.4115697, 0.9333333, 0, 1, 1,
0.9225305, -0.435211, 2.83235, 0.9372549, 0, 1, 1,
0.9252056, -0.7338899, 2.490028, 0.945098, 0, 1, 1,
0.9324575, -1.454928, 2.643472, 0.9490196, 0, 1, 1,
0.9363967, -0.009708546, 1.298535, 0.9568627, 0, 1, 1,
0.9388818, 0.7399249, 1.755998, 0.9607843, 0, 1, 1,
0.9407987, 1.122589, -1.379835, 0.9686275, 0, 1, 1,
0.9476699, -0.7240543, 1.393685, 0.972549, 0, 1, 1,
0.950392, -1.290563, 2.445708, 0.9803922, 0, 1, 1,
0.9510404, 0.600576, 1.169865, 0.9843137, 0, 1, 1,
0.9552586, 0.4503332, 0.505757, 0.9921569, 0, 1, 1,
0.955994, -0.297215, 1.555089, 0.9960784, 0, 1, 1,
0.9593876, 2.899666, 0.3484672, 1, 0, 0.9960784, 1,
0.9616928, -0.276276, 1.431327, 1, 0, 0.9882353, 1,
0.9620685, 0.7767237, 1.78626, 1, 0, 0.9843137, 1,
0.9637634, -0.1841868, 0.5601059, 1, 0, 0.9764706, 1,
0.9643839, -0.1958676, 3.176532, 1, 0, 0.972549, 1,
0.9655698, -0.2422753, 1.458708, 1, 0, 0.9647059, 1,
0.9670811, 1.590818, 1.396359, 1, 0, 0.9607843, 1,
0.9770276, -0.08402221, 1.036259, 1, 0, 0.9529412, 1,
0.9858124, 0.2029506, 0.3086692, 1, 0, 0.9490196, 1,
0.9883881, 0.7479231, 1.565462, 1, 0, 0.9411765, 1,
0.9904072, 1.108738, 1.200145, 1, 0, 0.9372549, 1,
0.9934433, -1.664505, 3.434402, 1, 0, 0.9294118, 1,
1.001656, -1.756984, 2.666605, 1, 0, 0.9254902, 1,
1.003667, -0.6568642, 3.036994, 1, 0, 0.9176471, 1,
1.006629, 0.3514113, 0.4770903, 1, 0, 0.9137255, 1,
1.01196, -0.4710292, 3.285738, 1, 0, 0.9058824, 1,
1.013618, 1.339247, 1.832903, 1, 0, 0.9019608, 1,
1.02558, -0.3426223, 2.184729, 1, 0, 0.8941177, 1,
1.026109, 0.1856105, 0.3211558, 1, 0, 0.8862745, 1,
1.031303, 1.687848, -0.05016956, 1, 0, 0.8823529, 1,
1.045474, 0.8657354, -0.03802555, 1, 0, 0.8745098, 1,
1.046033, -1.737044, 4.077287, 1, 0, 0.8705882, 1,
1.046999, -0.5141674, 2.175526, 1, 0, 0.8627451, 1,
1.050504, 0.2185848, 2.13029, 1, 0, 0.8588235, 1,
1.051109, -0.3437132, 1.978903, 1, 0, 0.8509804, 1,
1.052502, 0.5183191, 1.78354, 1, 0, 0.8470588, 1,
1.05421, -1.129226, 3.107285, 1, 0, 0.8392157, 1,
1.070139, -1.519964, 2.27665, 1, 0, 0.8352941, 1,
1.073698, 0.1355031, 0.6561826, 1, 0, 0.827451, 1,
1.088185, 0.5351955, 1.704013, 1, 0, 0.8235294, 1,
1.089577, -0.3756562, 2.066016, 1, 0, 0.8156863, 1,
1.091349, 0.3379079, 2.004713, 1, 0, 0.8117647, 1,
1.098295, -0.269057, 2.66084, 1, 0, 0.8039216, 1,
1.120567, -0.9419237, 2.557512, 1, 0, 0.7960784, 1,
1.124493, 0.6168318, 3.037832, 1, 0, 0.7921569, 1,
1.132096, 0.09618639, 0.7083539, 1, 0, 0.7843137, 1,
1.135235, -1.337901, 2.558465, 1, 0, 0.7803922, 1,
1.149132, -0.05382837, 2.190032, 1, 0, 0.772549, 1,
1.158967, 0.3156718, 0.9932178, 1, 0, 0.7686275, 1,
1.161052, -0.5965536, 1.097856, 1, 0, 0.7607843, 1,
1.169491, 0.4635157, 2.045685, 1, 0, 0.7568628, 1,
1.169859, 1.393072, 1.429636, 1, 0, 0.7490196, 1,
1.177462, 4.57185, 0.7309648, 1, 0, 0.7450981, 1,
1.183879, 0.08865814, 0.3629096, 1, 0, 0.7372549, 1,
1.188666, 2.064189, 0.6471747, 1, 0, 0.7333333, 1,
1.194278, 0.8625364, 2.041842, 1, 0, 0.7254902, 1,
1.197864, -0.6726523, 2.405851, 1, 0, 0.7215686, 1,
1.203151, 0.8618551, 1.214885, 1, 0, 0.7137255, 1,
1.207129, 0.5293518, -0.1817254, 1, 0, 0.7098039, 1,
1.208024, 0.391626, 2.231351, 1, 0, 0.7019608, 1,
1.213016, 0.6037106, 2.29089, 1, 0, 0.6941177, 1,
1.218032, 0.5584463, 1.603678, 1, 0, 0.6901961, 1,
1.219992, -0.8031024, 4.702309, 1, 0, 0.682353, 1,
1.221932, 0.2661262, 2.086874, 1, 0, 0.6784314, 1,
1.232634, -1.0689, 2.290764, 1, 0, 0.6705883, 1,
1.23841, -1.253073, 4.215551, 1, 0, 0.6666667, 1,
1.243078, -0.3471251, 3.265455, 1, 0, 0.6588235, 1,
1.243791, 2.008011, 1.692118, 1, 0, 0.654902, 1,
1.25379, -0.2622357, 1.008689, 1, 0, 0.6470588, 1,
1.256301, -1.522184, 3.707087, 1, 0, 0.6431373, 1,
1.25827, 0.3741253, 0.667258, 1, 0, 0.6352941, 1,
1.26256, -1.154132, 1.065383, 1, 0, 0.6313726, 1,
1.264655, 1.328202, -0.1882746, 1, 0, 0.6235294, 1,
1.283606, -0.7736278, 2.055904, 1, 0, 0.6196079, 1,
1.285688, 0.3595158, 2.225003, 1, 0, 0.6117647, 1,
1.287132, 0.755322, 0.2050643, 1, 0, 0.6078432, 1,
1.292709, 1.522383, 1.385349, 1, 0, 0.6, 1,
1.294903, 1.0357, 2.038332, 1, 0, 0.5921569, 1,
1.301543, -1.307674, 1.570474, 1, 0, 0.5882353, 1,
1.302244, 0.9944227, -1.1343, 1, 0, 0.5803922, 1,
1.304916, 0.5672335, 1.748803, 1, 0, 0.5764706, 1,
1.307706, -2.090941, 1.129678, 1, 0, 0.5686275, 1,
1.31696, 0.1153924, 1.478702, 1, 0, 0.5647059, 1,
1.318098, -0.4477484, 3.219045, 1, 0, 0.5568628, 1,
1.32039, 2.648315, 1.60392, 1, 0, 0.5529412, 1,
1.326422, 1.003062, -0.3125927, 1, 0, 0.5450981, 1,
1.328194, 0.5525357, 1.112819, 1, 0, 0.5411765, 1,
1.331228, 0.04147711, -0.3305399, 1, 0, 0.5333334, 1,
1.332288, 0.09744584, 1.760139, 1, 0, 0.5294118, 1,
1.337973, -0.9290583, 2.004751, 1, 0, 0.5215687, 1,
1.343472, -0.3515494, -0.3480788, 1, 0, 0.5176471, 1,
1.346125, -0.992804, 1.797437, 1, 0, 0.509804, 1,
1.35328, -0.3683901, 2.432288, 1, 0, 0.5058824, 1,
1.361107, 0.3539017, 0.1562329, 1, 0, 0.4980392, 1,
1.374125, 0.6383531, 0.812175, 1, 0, 0.4901961, 1,
1.375011, 0.7285149, -0.2363347, 1, 0, 0.4862745, 1,
1.378162, -2.317591, 4.269683, 1, 0, 0.4784314, 1,
1.385595, -0.657376, 1.947752, 1, 0, 0.4745098, 1,
1.395642, 0.6764829, 1.833303, 1, 0, 0.4666667, 1,
1.398338, -1.204517, 2.50728, 1, 0, 0.4627451, 1,
1.404505, -0.5488909, 3.512814, 1, 0, 0.454902, 1,
1.425185, 0.9214147, 1.061326, 1, 0, 0.4509804, 1,
1.427656, 0.1031816, 3.464472, 1, 0, 0.4431373, 1,
1.430389, -0.3422193, 2.550933, 1, 0, 0.4392157, 1,
1.434486, -0.2143683, 4.882335, 1, 0, 0.4313726, 1,
1.442122, -0.3588193, 0.2863164, 1, 0, 0.427451, 1,
1.444456, 1.376934, -0.3060687, 1, 0, 0.4196078, 1,
1.450229, 0.7901663, -0.4528025, 1, 0, 0.4156863, 1,
1.450533, -0.3727313, 0.900372, 1, 0, 0.4078431, 1,
1.452523, 0.05596898, 3.259073, 1, 0, 0.4039216, 1,
1.461267, 0.909428, 0.998538, 1, 0, 0.3960784, 1,
1.461413, 0.3649608, 0.8856031, 1, 0, 0.3882353, 1,
1.473335, -0.1087427, 3.569054, 1, 0, 0.3843137, 1,
1.489901, -0.2347646, 1.535749, 1, 0, 0.3764706, 1,
1.5175, -0.03924493, 1.88355, 1, 0, 0.372549, 1,
1.519665, -0.585463, 4.35963, 1, 0, 0.3647059, 1,
1.529937, -0.3988734, 0.4052825, 1, 0, 0.3607843, 1,
1.536711, 0.2703046, 0.6813611, 1, 0, 0.3529412, 1,
1.542734, 1.303073, 2.177153, 1, 0, 0.3490196, 1,
1.545299, 0.1082575, 1.146552, 1, 0, 0.3411765, 1,
1.547056, 1.101553, 0.5375634, 1, 0, 0.3372549, 1,
1.549105, 2.432221, -0.5189326, 1, 0, 0.3294118, 1,
1.562135, 0.7282258, 1.194535, 1, 0, 0.3254902, 1,
1.563692, 0.1705121, 2.190495, 1, 0, 0.3176471, 1,
1.571106, -0.7039501, 1.690971, 1, 0, 0.3137255, 1,
1.5758, 0.4305141, 1.392169, 1, 0, 0.3058824, 1,
1.588711, -0.5694171, 1.512904, 1, 0, 0.2980392, 1,
1.600773, -0.1895598, 2.395713, 1, 0, 0.2941177, 1,
1.606755, -0.3495183, 1.43384, 1, 0, 0.2862745, 1,
1.619115, -0.3844547, 2.853997, 1, 0, 0.282353, 1,
1.621315, 0.9691671, 0.361207, 1, 0, 0.2745098, 1,
1.627364, -1.391496, 1.584528, 1, 0, 0.2705882, 1,
1.628868, 1.514977, 1.911388, 1, 0, 0.2627451, 1,
1.636354, -1.854974, 4.016769, 1, 0, 0.2588235, 1,
1.642126, -2.21419, 2.492173, 1, 0, 0.2509804, 1,
1.648834, -1.507528, 2.384051, 1, 0, 0.2470588, 1,
1.65828, 0.9087219, 0.2921679, 1, 0, 0.2392157, 1,
1.65988, 0.7833378, 1.694957, 1, 0, 0.2352941, 1,
1.665149, -0.07716972, 2.403548, 1, 0, 0.227451, 1,
1.665583, -0.2288983, 0.04947532, 1, 0, 0.2235294, 1,
1.668863, 0.08861545, 1.917071, 1, 0, 0.2156863, 1,
1.673145, 0.4297575, -1.011971, 1, 0, 0.2117647, 1,
1.710333, 0.03024976, 1.094391, 1, 0, 0.2039216, 1,
1.711093, -0.6385592, 1.20462, 1, 0, 0.1960784, 1,
1.7121, -0.01839385, 2.194464, 1, 0, 0.1921569, 1,
1.719368, -0.4791239, 2.62307, 1, 0, 0.1843137, 1,
1.760421, -0.962767, 2.845021, 1, 0, 0.1803922, 1,
1.76609, 0.4879154, 0.8117878, 1, 0, 0.172549, 1,
1.767601, -0.4964622, 1.44172, 1, 0, 0.1686275, 1,
1.781407, 0.04002219, 2.925048, 1, 0, 0.1607843, 1,
1.788236, 0.5787476, 1.848929, 1, 0, 0.1568628, 1,
1.805285, -1.535104, 2.258291, 1, 0, 0.1490196, 1,
1.82144, -1.132399, 2.326268, 1, 0, 0.145098, 1,
1.834985, 2.101279, -0.184102, 1, 0, 0.1372549, 1,
1.841558, -0.5705783, 1.280555, 1, 0, 0.1333333, 1,
1.860862, 1.249511, 1.148915, 1, 0, 0.1254902, 1,
1.901111, 0.5359325, 0.1577073, 1, 0, 0.1215686, 1,
1.907126, 0.7535067, 3.292187, 1, 0, 0.1137255, 1,
1.911002, 0.4810123, 0.8993704, 1, 0, 0.1098039, 1,
1.920462, -0.4948869, 1.275911, 1, 0, 0.1019608, 1,
2.017562, -1.102923, 3.888219, 1, 0, 0.09411765, 1,
2.028551, 0.351526, 1.359007, 1, 0, 0.09019608, 1,
2.028887, -0.5944712, 1.585493, 1, 0, 0.08235294, 1,
2.11918, -0.7803745, 0.4867696, 1, 0, 0.07843138, 1,
2.13189, 0.5635589, -0.3576488, 1, 0, 0.07058824, 1,
2.215191, -0.7848957, 0.9500695, 1, 0, 0.06666667, 1,
2.2406, 0.6313083, 1.721292, 1, 0, 0.05882353, 1,
2.299606, -0.2110213, 0.8089522, 1, 0, 0.05490196, 1,
2.307817, 0.6544714, 1.556036, 1, 0, 0.04705882, 1,
2.345136, -0.3112525, 2.763258, 1, 0, 0.04313726, 1,
2.364764, -0.3130961, 1.69016, 1, 0, 0.03529412, 1,
2.478296, 1.301023, 2.519871, 1, 0, 0.03137255, 1,
2.598768, 0.6920082, 1.843245, 1, 0, 0.02352941, 1,
2.653175, 1.912296, 1.361666, 1, 0, 0.01960784, 1,
2.660932, -0.2434813, 1.600104, 1, 0, 0.01176471, 1,
3.082297, -0.3957296, 1.725493, 1, 0, 0.007843138, 1
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
0.1630886, -4.497524, -7.080729, 0, -0.5, 0.5, 0.5,
0.1630886, -4.497524, -7.080729, 1, -0.5, 0.5, 0.5,
0.1630886, -4.497524, -7.080729, 1, 1.5, 0.5, 0.5,
0.1630886, -4.497524, -7.080729, 0, 1.5, 0.5, 0.5
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
-3.745732, 0.6943921, -7.080729, 0, -0.5, 0.5, 0.5,
-3.745732, 0.6943921, -7.080729, 1, -0.5, 0.5, 0.5,
-3.745732, 0.6943921, -7.080729, 1, 1.5, 0.5, 0.5,
-3.745732, 0.6943921, -7.080729, 0, 1.5, 0.5, 0.5
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
-3.745732, -4.497524, 0.6177564, 0, -0.5, 0.5, 0.5,
-3.745732, -4.497524, 0.6177564, 1, -0.5, 0.5, 0.5,
-3.745732, -4.497524, 0.6177564, 1, 1.5, 0.5, 0.5,
-3.745732, -4.497524, 0.6177564, 0, 1.5, 0.5, 0.5
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
-2, -3.29939, -5.304155,
3, -3.29939, -5.304155,
-2, -3.29939, -5.304155,
-2, -3.499079, -5.600251,
-1, -3.29939, -5.304155,
-1, -3.499079, -5.600251,
0, -3.29939, -5.304155,
0, -3.499079, -5.600251,
1, -3.29939, -5.304155,
1, -3.499079, -5.600251,
2, -3.29939, -5.304155,
2, -3.499079, -5.600251,
3, -3.29939, -5.304155,
3, -3.499079, -5.600251
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
-2, -3.898457, -6.192442, 0, -0.5, 0.5, 0.5,
-2, -3.898457, -6.192442, 1, -0.5, 0.5, 0.5,
-2, -3.898457, -6.192442, 1, 1.5, 0.5, 0.5,
-2, -3.898457, -6.192442, 0, 1.5, 0.5, 0.5,
-1, -3.898457, -6.192442, 0, -0.5, 0.5, 0.5,
-1, -3.898457, -6.192442, 1, -0.5, 0.5, 0.5,
-1, -3.898457, -6.192442, 1, 1.5, 0.5, 0.5,
-1, -3.898457, -6.192442, 0, 1.5, 0.5, 0.5,
0, -3.898457, -6.192442, 0, -0.5, 0.5, 0.5,
0, -3.898457, -6.192442, 1, -0.5, 0.5, 0.5,
0, -3.898457, -6.192442, 1, 1.5, 0.5, 0.5,
0, -3.898457, -6.192442, 0, 1.5, 0.5, 0.5,
1, -3.898457, -6.192442, 0, -0.5, 0.5, 0.5,
1, -3.898457, -6.192442, 1, -0.5, 0.5, 0.5,
1, -3.898457, -6.192442, 1, 1.5, 0.5, 0.5,
1, -3.898457, -6.192442, 0, 1.5, 0.5, 0.5,
2, -3.898457, -6.192442, 0, -0.5, 0.5, 0.5,
2, -3.898457, -6.192442, 1, -0.5, 0.5, 0.5,
2, -3.898457, -6.192442, 1, 1.5, 0.5, 0.5,
2, -3.898457, -6.192442, 0, 1.5, 0.5, 0.5,
3, -3.898457, -6.192442, 0, -0.5, 0.5, 0.5,
3, -3.898457, -6.192442, 1, -0.5, 0.5, 0.5,
3, -3.898457, -6.192442, 1, 1.5, 0.5, 0.5,
3, -3.898457, -6.192442, 0, 1.5, 0.5, 0.5
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
-2.843696, -2, -5.304155,
-2.843696, 4, -5.304155,
-2.843696, -2, -5.304155,
-2.994035, -2, -5.600251,
-2.843696, 0, -5.304155,
-2.994035, 0, -5.600251,
-2.843696, 2, -5.304155,
-2.994035, 2, -5.600251,
-2.843696, 4, -5.304155,
-2.994035, 4, -5.600251
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
"0",
"2",
"4"
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
-3.294714, -2, -6.192442, 0, -0.5, 0.5, 0.5,
-3.294714, -2, -6.192442, 1, -0.5, 0.5, 0.5,
-3.294714, -2, -6.192442, 1, 1.5, 0.5, 0.5,
-3.294714, -2, -6.192442, 0, 1.5, 0.5, 0.5,
-3.294714, 0, -6.192442, 0, -0.5, 0.5, 0.5,
-3.294714, 0, -6.192442, 1, -0.5, 0.5, 0.5,
-3.294714, 0, -6.192442, 1, 1.5, 0.5, 0.5,
-3.294714, 0, -6.192442, 0, 1.5, 0.5, 0.5,
-3.294714, 2, -6.192442, 0, -0.5, 0.5, 0.5,
-3.294714, 2, -6.192442, 1, -0.5, 0.5, 0.5,
-3.294714, 2, -6.192442, 1, 1.5, 0.5, 0.5,
-3.294714, 2, -6.192442, 0, 1.5, 0.5, 0.5,
-3.294714, 4, -6.192442, 0, -0.5, 0.5, 0.5,
-3.294714, 4, -6.192442, 1, -0.5, 0.5, 0.5,
-3.294714, 4, -6.192442, 1, 1.5, 0.5, 0.5,
-3.294714, 4, -6.192442, 0, 1.5, 0.5, 0.5
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
-2.843696, -3.29939, -4,
-2.843696, -3.29939, 6,
-2.843696, -3.29939, -4,
-2.994035, -3.499079, -4,
-2.843696, -3.29939, -2,
-2.994035, -3.499079, -2,
-2.843696, -3.29939, 0,
-2.994035, -3.499079, 0,
-2.843696, -3.29939, 2,
-2.994035, -3.499079, 2,
-2.843696, -3.29939, 4,
-2.994035, -3.499079, 4,
-2.843696, -3.29939, 6,
-2.994035, -3.499079, 6
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
-3.294714, -3.898457, -4, 0, -0.5, 0.5, 0.5,
-3.294714, -3.898457, -4, 1, -0.5, 0.5, 0.5,
-3.294714, -3.898457, -4, 1, 1.5, 0.5, 0.5,
-3.294714, -3.898457, -4, 0, 1.5, 0.5, 0.5,
-3.294714, -3.898457, -2, 0, -0.5, 0.5, 0.5,
-3.294714, -3.898457, -2, 1, -0.5, 0.5, 0.5,
-3.294714, -3.898457, -2, 1, 1.5, 0.5, 0.5,
-3.294714, -3.898457, -2, 0, 1.5, 0.5, 0.5,
-3.294714, -3.898457, 0, 0, -0.5, 0.5, 0.5,
-3.294714, -3.898457, 0, 1, -0.5, 0.5, 0.5,
-3.294714, -3.898457, 0, 1, 1.5, 0.5, 0.5,
-3.294714, -3.898457, 0, 0, 1.5, 0.5, 0.5,
-3.294714, -3.898457, 2, 0, -0.5, 0.5, 0.5,
-3.294714, -3.898457, 2, 1, -0.5, 0.5, 0.5,
-3.294714, -3.898457, 2, 1, 1.5, 0.5, 0.5,
-3.294714, -3.898457, 2, 0, 1.5, 0.5, 0.5,
-3.294714, -3.898457, 4, 0, -0.5, 0.5, 0.5,
-3.294714, -3.898457, 4, 1, -0.5, 0.5, 0.5,
-3.294714, -3.898457, 4, 1, 1.5, 0.5, 0.5,
-3.294714, -3.898457, 4, 0, 1.5, 0.5, 0.5,
-3.294714, -3.898457, 6, 0, -0.5, 0.5, 0.5,
-3.294714, -3.898457, 6, 1, -0.5, 0.5, 0.5,
-3.294714, -3.898457, 6, 1, 1.5, 0.5, 0.5,
-3.294714, -3.898457, 6, 0, 1.5, 0.5, 0.5
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
-2.843696, -3.29939, -5.304155,
-2.843696, 4.688174, -5.304155,
-2.843696, -3.29939, 6.539668,
-2.843696, 4.688174, 6.539668,
-2.843696, -3.29939, -5.304155,
-2.843696, -3.29939, 6.539668,
-2.843696, 4.688174, -5.304155,
-2.843696, 4.688174, 6.539668,
-2.843696, -3.29939, -5.304155,
3.169873, -3.29939, -5.304155,
-2.843696, -3.29939, 6.539668,
3.169873, -3.29939, 6.539668,
-2.843696, 4.688174, -5.304155,
3.169873, 4.688174, -5.304155,
-2.843696, 4.688174, 6.539668,
3.169873, 4.688174, 6.539668,
3.169873, -3.29939, -5.304155,
3.169873, 4.688174, -5.304155,
3.169873, -3.29939, 6.539668,
3.169873, 4.688174, 6.539668,
3.169873, -3.29939, -5.304155,
3.169873, -3.29939, 6.539668,
3.169873, 4.688174, -5.304155,
3.169873, 4.688174, 6.539668
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
var radius = 8.276533;
var distance = 36.82323;
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
mvMatrix.translate( -0.1630886, -0.6943921, -0.6177564 );
mvMatrix.scale( 1.488093, 1.120335, 0.7555625 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.82323);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
ethyl-6-fluorobenzen<-read.table("ethyl-6-fluorobenzen.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ethyl-6-fluorobenzen$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethyl' not found
```

```r
y<-ethyl-6-fluorobenzen$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethyl' not found
```

```r
z<-ethyl-6-fluorobenzen$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethyl' not found
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
-2.75612, -1.574523, -0.5048412, 0, 0, 1, 1, 1,
-2.697373, 1.080816, -0.07698401, 1, 0, 0, 1, 1,
-2.666944, -0.3431882, -3.319779, 1, 0, 0, 1, 1,
-2.564831, 1.036355, -0.7636724, 1, 0, 0, 1, 1,
-2.522018, 2.208033, 0.3617446, 1, 0, 0, 1, 1,
-2.504141, 0.5577807, -0.1801161, 1, 0, 0, 1, 1,
-2.479092, 1.079621, -1.474691, 0, 0, 0, 1, 1,
-2.460426, 0.6074695, -1.432185, 0, 0, 0, 1, 1,
-2.452969, 0.124902, -1.957663, 0, 0, 0, 1, 1,
-2.417219, 1.503033, -0.1630287, 0, 0, 0, 1, 1,
-2.261758, 0.201807, -1.552256, 0, 0, 0, 1, 1,
-2.233135, 0.5188523, -1.080434, 0, 0, 0, 1, 1,
-2.192836, -0.8707031, -1.92287, 0, 0, 0, 1, 1,
-2.178116, 0.489358, -2.317626, 1, 1, 1, 1, 1,
-2.176347, 0.4199335, -2.237407, 1, 1, 1, 1, 1,
-2.1304, 0.1394783, -1.319392, 1, 1, 1, 1, 1,
-2.110211, -0.1047702, -2.94647, 1, 1, 1, 1, 1,
-2.107602, 0.4389055, -2.230803, 1, 1, 1, 1, 1,
-2.106735, 1.076883, -2.70917, 1, 1, 1, 1, 1,
-2.106292, 0.2634198, -1.972264, 1, 1, 1, 1, 1,
-2.076883, 0.2716616, -1.41748, 1, 1, 1, 1, 1,
-2.071224, -0.06690135, -2.830216, 1, 1, 1, 1, 1,
-2.052329, 0.549851, -3.575282, 1, 1, 1, 1, 1,
-2.041298, -0.4571672, -2.945314, 1, 1, 1, 1, 1,
-2.012022, 0.5695805, -3.040395, 1, 1, 1, 1, 1,
-2.005897, -1.593155, -2.456893, 1, 1, 1, 1, 1,
-1.995751, 0.547172, -1.616341, 1, 1, 1, 1, 1,
-1.967224, -1.850902, -3.507253, 1, 1, 1, 1, 1,
-1.953177, 2.892818, -1.593568, 0, 0, 1, 1, 1,
-1.930222, 0.2284336, -1.461829, 1, 0, 0, 1, 1,
-1.896881, -1.292825, -3.247897, 1, 0, 0, 1, 1,
-1.881941, 0.8524154, -1.116987, 1, 0, 0, 1, 1,
-1.875335, 1.567729, -1.010021, 1, 0, 0, 1, 1,
-1.873965, -2.143631, -3.808327, 1, 0, 0, 1, 1,
-1.863234, 2.476805, -3.769734, 0, 0, 0, 1, 1,
-1.859601, -0.7255155, -1.606004, 0, 0, 0, 1, 1,
-1.827084, -0.1026225, -0.2633671, 0, 0, 0, 1, 1,
-1.821626, 0.1285902, -1.475377, 0, 0, 0, 1, 1,
-1.807137, 1.235875, -3.365698, 0, 0, 0, 1, 1,
-1.793176, 2.278235, -1.624955, 0, 0, 0, 1, 1,
-1.779416, 2.051155, -2.023108, 0, 0, 0, 1, 1,
-1.757459, -1.595546, -2.423013, 1, 1, 1, 1, 1,
-1.754126, 0.02046134, -2.668019, 1, 1, 1, 1, 1,
-1.742171, 1.156462, -0.330707, 1, 1, 1, 1, 1,
-1.73905, -0.3568578, -0.09086292, 1, 1, 1, 1, 1,
-1.71629, -0.4026767, -0.8297254, 1, 1, 1, 1, 1,
-1.704083, -1.928376, -2.30596, 1, 1, 1, 1, 1,
-1.680121, -0.1035936, -1.050427, 1, 1, 1, 1, 1,
-1.673097, -0.03537234, -2.285477, 1, 1, 1, 1, 1,
-1.670089, 0.8604128, -2.102216, 1, 1, 1, 1, 1,
-1.657339, 1.566387, -2.176419, 1, 1, 1, 1, 1,
-1.649856, 0.7087969, -0.8648645, 1, 1, 1, 1, 1,
-1.649189, 1.009253, -0.8071224, 1, 1, 1, 1, 1,
-1.636486, -0.5711058, -1.295218, 1, 1, 1, 1, 1,
-1.634741, -0.04135867, -2.200518, 1, 1, 1, 1, 1,
-1.618845, 0.6977435, -0.8430021, 1, 1, 1, 1, 1,
-1.616163, -0.3232838, -0.9485465, 0, 0, 1, 1, 1,
-1.605702, -1.521716, -2.578682, 1, 0, 0, 1, 1,
-1.599182, 0.05940752, -2.185735, 1, 0, 0, 1, 1,
-1.553778, 0.03573974, -1.537832, 1, 0, 0, 1, 1,
-1.525486, 0.5033658, -2.110769, 1, 0, 0, 1, 1,
-1.499902, 1.730716, 0.911102, 1, 0, 0, 1, 1,
-1.48602, 0.003104024, -1.475998, 0, 0, 0, 1, 1,
-1.445694, 0.2708434, -0.9444822, 0, 0, 0, 1, 1,
-1.444926, 1.769325, -1.961573, 0, 0, 0, 1, 1,
-1.43549, 0.6833726, -1.503555, 0, 0, 0, 1, 1,
-1.430822, -0.4905283, -3.280559, 0, 0, 0, 1, 1,
-1.427511, 0.4118346, -0.8349243, 0, 0, 0, 1, 1,
-1.422312, 1.489677, -1.381129, 0, 0, 0, 1, 1,
-1.422021, 0.5994333, 0.4249854, 1, 1, 1, 1, 1,
-1.420232, -0.4212149, -0.3904208, 1, 1, 1, 1, 1,
-1.419783, -2.705606, -2.059771, 1, 1, 1, 1, 1,
-1.416102, 0.09983266, -0.6689202, 1, 1, 1, 1, 1,
-1.414768, -1.988184, -1.430574, 1, 1, 1, 1, 1,
-1.404357, -1.944662, -2.826836, 1, 1, 1, 1, 1,
-1.397273, 1.06544, 0.6274834, 1, 1, 1, 1, 1,
-1.38835, -0.8579316, -1.104492, 1, 1, 1, 1, 1,
-1.386332, -0.3479622, -0.5466651, 1, 1, 1, 1, 1,
-1.385257, -0.5985809, -2.415923, 1, 1, 1, 1, 1,
-1.380746, 0.06882489, -1.196484, 1, 1, 1, 1, 1,
-1.369447, 0.04904912, -2.698418, 1, 1, 1, 1, 1,
-1.36168, -1.646105, -2.981152, 1, 1, 1, 1, 1,
-1.360708, -0.3722426, -2.099995, 1, 1, 1, 1, 1,
-1.360594, -0.9052625, -3.13354, 1, 1, 1, 1, 1,
-1.359083, 0.1432624, -2.27609, 0, 0, 1, 1, 1,
-1.356657, 0.7787002, -1.024424, 1, 0, 0, 1, 1,
-1.354616, 0.1677584, -1.873447, 1, 0, 0, 1, 1,
-1.342162, 1.228795, -1.263639, 1, 0, 0, 1, 1,
-1.339049, -0.4195787, -1.746847, 1, 0, 0, 1, 1,
-1.335912, 1.319092, -0.8646092, 1, 0, 0, 1, 1,
-1.335824, 1.283281, -0.3487055, 0, 0, 0, 1, 1,
-1.3316, -0.07941205, -1.708323, 0, 0, 0, 1, 1,
-1.328117, -0.3289143, -1.649803, 0, 0, 0, 1, 1,
-1.325181, -0.1395946, -2.497188, 0, 0, 0, 1, 1,
-1.323431, 1.044875, -1.176714, 0, 0, 0, 1, 1,
-1.304522, 1.582881, -0.4417633, 0, 0, 0, 1, 1,
-1.301219, 0.1194582, -0.4462409, 0, 0, 0, 1, 1,
-1.295022, -0.9943438, -2.440807, 1, 1, 1, 1, 1,
-1.288808, -1.68869, -3.403387, 1, 1, 1, 1, 1,
-1.273634, -1.739259, -3.854191, 1, 1, 1, 1, 1,
-1.263519, 0.1980263, -0.9122386, 1, 1, 1, 1, 1,
-1.26263, -1.2095, -2.658576, 1, 1, 1, 1, 1,
-1.261489, 0.2814303, -0.7844346, 1, 1, 1, 1, 1,
-1.257908, -0.499723, -1.524031, 1, 1, 1, 1, 1,
-1.25601, 0.3097659, -1.27811, 1, 1, 1, 1, 1,
-1.244596, 1.225567, -2.310793, 1, 1, 1, 1, 1,
-1.236083, -0.5437215, -1.227702, 1, 1, 1, 1, 1,
-1.235781, 0.02294597, -0.836804, 1, 1, 1, 1, 1,
-1.228852, -0.7636375, -1.032449, 1, 1, 1, 1, 1,
-1.227763, 0.3216985, 0.2433878, 1, 1, 1, 1, 1,
-1.227478, -1.972987, -2.662364, 1, 1, 1, 1, 1,
-1.227277, -1.237946, -1.554951, 1, 1, 1, 1, 1,
-1.226044, -1.366313, -2.610945, 0, 0, 1, 1, 1,
-1.221035, -0.06722454, -0.4112495, 1, 0, 0, 1, 1,
-1.212439, 1.66666, -0.6177187, 1, 0, 0, 1, 1,
-1.208777, -0.006639909, -1.885808, 1, 0, 0, 1, 1,
-1.200924, 0.7023419, -0.4824434, 1, 0, 0, 1, 1,
-1.199138, -0.6846927, -0.7488797, 1, 0, 0, 1, 1,
-1.198806, -0.03805532, -1.652888, 0, 0, 0, 1, 1,
-1.198601, 1.924578, -2.182323, 0, 0, 0, 1, 1,
-1.196, -0.4303237, -3.472686, 0, 0, 0, 1, 1,
-1.191408, 0.4552056, -0.4032246, 0, 0, 0, 1, 1,
-1.190903, 0.8701463, 0.2487352, 0, 0, 0, 1, 1,
-1.189957, -1.636361, -4.569381, 0, 0, 0, 1, 1,
-1.180835, 1.857527, -0.8923598, 0, 0, 0, 1, 1,
-1.178661, -0.616702, -1.096877, 1, 1, 1, 1, 1,
-1.176702, -0.3628051, -0.8252147, 1, 1, 1, 1, 1,
-1.174728, 0.3384814, -3.604822, 1, 1, 1, 1, 1,
-1.169849, 0.1258842, -1.734473, 1, 1, 1, 1, 1,
-1.165435, 1.420495, -2.103577, 1, 1, 1, 1, 1,
-1.161975, 0.08134098, -1.208508, 1, 1, 1, 1, 1,
-1.159316, 1.549477, 0.1883661, 1, 1, 1, 1, 1,
-1.158937, -1.389279, -2.541455, 1, 1, 1, 1, 1,
-1.158712, 0.5175444, -1.851298, 1, 1, 1, 1, 1,
-1.148097, -0.09322453, -2.961637, 1, 1, 1, 1, 1,
-1.143855, 0.2765214, -2.646308, 1, 1, 1, 1, 1,
-1.14172, -3.183066, -3.19729, 1, 1, 1, 1, 1,
-1.132151, -0.2323892, -2.710988, 1, 1, 1, 1, 1,
-1.124349, -0.6516376, -2.866603, 1, 1, 1, 1, 1,
-1.10866, 0.4720657, -2.184069, 1, 1, 1, 1, 1,
-1.096779, 0.1298709, -0.9714163, 0, 0, 1, 1, 1,
-1.094931, -0.4796632, -3.542995, 1, 0, 0, 1, 1,
-1.085877, -1.458608, -3.341405, 1, 0, 0, 1, 1,
-1.081815, 1.072307, -0.8230364, 1, 0, 0, 1, 1,
-1.078462, -1.38169, -3.3136, 1, 0, 0, 1, 1,
-1.077383, -1.385529, -2.935588, 1, 0, 0, 1, 1,
-1.073131, 1.556042, -0.4480511, 0, 0, 0, 1, 1,
-1.068259, 0.5417448, -2.829363, 0, 0, 0, 1, 1,
-1.064195, -1.680185, -3.295194, 0, 0, 0, 1, 1,
-1.063599, 0.9498189, 0.4290556, 0, 0, 0, 1, 1,
-1.055782, 0.02035827, 0.005743338, 0, 0, 0, 1, 1,
-1.055618, -0.06803407, -1.52221, 0, 0, 0, 1, 1,
-1.05271, 1.058776, -1.980965, 0, 0, 0, 1, 1,
-1.052094, 0.6754816, -0.006170457, 1, 1, 1, 1, 1,
-1.049569, -1.033606, -3.268754, 1, 1, 1, 1, 1,
-1.048591, -1.232953, -3.372718, 1, 1, 1, 1, 1,
-1.047832, -0.6687792, -1.694774, 1, 1, 1, 1, 1,
-1.037961, 0.7627875, -1.615244, 1, 1, 1, 1, 1,
-1.036172, -0.4811794, -1.900026, 1, 1, 1, 1, 1,
-1.025076, 0.161758, -2.458284, 1, 1, 1, 1, 1,
-1.023659, 0.7147008, 0.0920972, 1, 1, 1, 1, 1,
-1.017798, 0.9419985, -1.105391, 1, 1, 1, 1, 1,
-1.013664, -0.6530067, -1.845329, 1, 1, 1, 1, 1,
-1.012891, -0.579326, -0.2975713, 1, 1, 1, 1, 1,
-1.012493, 1.825094, -0.9244042, 1, 1, 1, 1, 1,
-1.002256, -0.3156523, -1.818222, 1, 1, 1, 1, 1,
-0.9980022, 0.1039348, -0.6077903, 1, 1, 1, 1, 1,
-0.9921734, -0.8024225, -3.204648, 1, 1, 1, 1, 1,
-0.9913544, -1.201097, -2.494304, 0, 0, 1, 1, 1,
-0.9768315, 0.08912265, -3.105358, 1, 0, 0, 1, 1,
-0.9675476, -1.325132, -1.617992, 1, 0, 0, 1, 1,
-0.958764, -0.06047486, -3.219902, 1, 0, 0, 1, 1,
-0.9516033, -1.326629, -3.923669, 1, 0, 0, 1, 1,
-0.9503385, 0.3203122, -3.465701, 1, 0, 0, 1, 1,
-0.9475207, -0.04750287, -3.0618, 0, 0, 0, 1, 1,
-0.9468461, -0.2531629, -2.323961, 0, 0, 0, 1, 1,
-0.945834, 2.568935, -0.5458654, 0, 0, 0, 1, 1,
-0.9452446, -1.322361, -2.473114, 0, 0, 0, 1, 1,
-0.9371392, 0.2937836, -0.4338612, 0, 0, 0, 1, 1,
-0.9358624, -0.4040361, -3.030137, 0, 0, 0, 1, 1,
-0.9352378, -0.2593753, -2.379313, 0, 0, 0, 1, 1,
-0.9343678, 0.391176, -2.450196, 1, 1, 1, 1, 1,
-0.9312615, -0.643977, -1.667994, 1, 1, 1, 1, 1,
-0.9289813, 0.2396688, -1.292747, 1, 1, 1, 1, 1,
-0.9246391, 1.234136, -0.5545247, 1, 1, 1, 1, 1,
-0.9239355, -1.125408, -1.486514, 1, 1, 1, 1, 1,
-0.9231803, -0.7717578, -1.80085, 1, 1, 1, 1, 1,
-0.9216304, 0.5149615, -1.863079, 1, 1, 1, 1, 1,
-0.9203855, -0.7192364, -1.229916, 1, 1, 1, 1, 1,
-0.9143041, -0.5591716, -1.051146, 1, 1, 1, 1, 1,
-0.9102218, -0.5178104, -2.340167, 1, 1, 1, 1, 1,
-0.9068184, 0.4045879, 0.0104059, 1, 1, 1, 1, 1,
-0.9036245, -0.8802054, -1.875616, 1, 1, 1, 1, 1,
-0.886569, 0.5229433, 1.372564, 1, 1, 1, 1, 1,
-0.8864491, 1.613541, -0.8448168, 1, 1, 1, 1, 1,
-0.8808537, 0.5154855, -0.7943931, 1, 1, 1, 1, 1,
-0.8749357, 0.1353181, -0.8469837, 0, 0, 1, 1, 1,
-0.8741236, -0.2476915, -2.5261, 1, 0, 0, 1, 1,
-0.8721485, 0.2031401, -1.253971, 1, 0, 0, 1, 1,
-0.8654235, -0.6098094, -1.140886, 1, 0, 0, 1, 1,
-0.857438, 0.7342688, 0.9556759, 1, 0, 0, 1, 1,
-0.8553428, -0.1451968, -0.2725968, 1, 0, 0, 1, 1,
-0.8431702, 0.4924573, -1.162847, 0, 0, 0, 1, 1,
-0.8379294, 0.005067498, -1.190522, 0, 0, 0, 1, 1,
-0.8374843, -0.05774163, -0.3277932, 0, 0, 0, 1, 1,
-0.8325969, -0.4533004, -2.33135, 0, 0, 0, 1, 1,
-0.8309535, -0.3241532, -2.820364, 0, 0, 0, 1, 1,
-0.8307444, 0.4572791, -1.059216, 0, 0, 0, 1, 1,
-0.8188885, -0.5164435, -2.012287, 0, 0, 0, 1, 1,
-0.8110601, 1.30124, -0.3273044, 1, 1, 1, 1, 1,
-0.8084761, -0.1461464, -0.5390352, 1, 1, 1, 1, 1,
-0.8081821, 0.4425246, -1.811062, 1, 1, 1, 1, 1,
-0.8066512, 0.4226983, -1.760961, 1, 1, 1, 1, 1,
-0.7983475, -0.5100018, -2.940869, 1, 1, 1, 1, 1,
-0.7978812, 0.2262454, 0.2753473, 1, 1, 1, 1, 1,
-0.7949986, -0.7083553, -2.369334, 1, 1, 1, 1, 1,
-0.7903364, 0.3359776, -1.818495, 1, 1, 1, 1, 1,
-0.7861043, -0.6343043, -4.233646, 1, 1, 1, 1, 1,
-0.7815117, 1.157521, 1.380114, 1, 1, 1, 1, 1,
-0.7793238, -1.253254, -1.601805, 1, 1, 1, 1, 1,
-0.7763389, 0.207757, -0.5733884, 1, 1, 1, 1, 1,
-0.7753217, 0.007265576, 0.2467882, 1, 1, 1, 1, 1,
-0.7677977, 1.39042, -0.6837879, 1, 1, 1, 1, 1,
-0.7629779, 0.8290641, -0.9098343, 1, 1, 1, 1, 1,
-0.7551619, -0.1201901, 0.1083973, 0, 0, 1, 1, 1,
-0.7522884, -2.014783, -4.003405, 1, 0, 0, 1, 1,
-0.7473081, 0.3077046, -2.203452, 1, 0, 0, 1, 1,
-0.7453312, 1.695421, 0.4279723, 1, 0, 0, 1, 1,
-0.7413698, 0.8291479, -0.3255237, 1, 0, 0, 1, 1,
-0.7389136, -0.1930009, -1.358311, 1, 0, 0, 1, 1,
-0.7374301, 0.2562088, -2.129401, 0, 0, 0, 1, 1,
-0.7332158, 1.066444, 1.102189, 0, 0, 0, 1, 1,
-0.7329792, 2.498806, -0.08598186, 0, 0, 0, 1, 1,
-0.7283974, -0.138574, -1.662573, 0, 0, 0, 1, 1,
-0.7280751, 0.238208, -1.030853, 0, 0, 0, 1, 1,
-0.7274519, -0.1476529, -2.524165, 0, 0, 0, 1, 1,
-0.7253271, -1.29213, -1.93978, 0, 0, 0, 1, 1,
-0.7217615, -1.40857, -2.509181, 1, 1, 1, 1, 1,
-0.7202104, 0.2107983, -0.06810625, 1, 1, 1, 1, 1,
-0.7149904, 1.145501, -2.101962, 1, 1, 1, 1, 1,
-0.7036763, 1.417254, -0.9194191, 1, 1, 1, 1, 1,
-0.6965802, 0.619022, -2.054133, 1, 1, 1, 1, 1,
-0.6961508, -1.178537, -3.766809, 1, 1, 1, 1, 1,
-0.6939534, 0.9259502, -1.960049, 1, 1, 1, 1, 1,
-0.6885905, 1.33282, -0.4069776, 1, 1, 1, 1, 1,
-0.6839922, 1.162775, -0.5087372, 1, 1, 1, 1, 1,
-0.6811953, 0.533687, 0.3588829, 1, 1, 1, 1, 1,
-0.6780693, 0.2577585, -2.013706, 1, 1, 1, 1, 1,
-0.6725265, 0.01897514, -1.774116, 1, 1, 1, 1, 1,
-0.6722528, 0.07252098, -1.319309, 1, 1, 1, 1, 1,
-0.6705063, -0.4299892, -3.242719, 1, 1, 1, 1, 1,
-0.6697134, 0.8203766, -1.71199, 1, 1, 1, 1, 1,
-0.6684686, 0.277458, 0.7408527, 0, 0, 1, 1, 1,
-0.6623128, -0.2022078, -2.268853, 1, 0, 0, 1, 1,
-0.659273, 0.7046019, -0.693239, 1, 0, 0, 1, 1,
-0.6590849, -0.9053494, -2.2218, 1, 0, 0, 1, 1,
-0.6536809, 0.09390068, -1.599851, 1, 0, 0, 1, 1,
-0.6503609, 1.67627, -1.947218, 1, 0, 0, 1, 1,
-0.6464844, -0.1305636, -2.144903, 0, 0, 0, 1, 1,
-0.6405953, 0.0808294, -2.575545, 0, 0, 0, 1, 1,
-0.6375756, -0.6741446, -1.318443, 0, 0, 0, 1, 1,
-0.6309861, 1.00556, 0.1088241, 0, 0, 0, 1, 1,
-0.6228223, -0.1892878, -2.7017, 0, 0, 0, 1, 1,
-0.6143389, 0.005373207, -1.158656, 0, 0, 0, 1, 1,
-0.6109182, 0.548662, -0.01740204, 0, 0, 0, 1, 1,
-0.6097975, 0.2201392, -1.129706, 1, 1, 1, 1, 1,
-0.6063227, -1.968933, -1.907199, 1, 1, 1, 1, 1,
-0.6024445, -1.216083, -2.042298, 1, 1, 1, 1, 1,
-0.6004154, 1.036154, -1.147154, 1, 1, 1, 1, 1,
-0.5969439, 1.348465, -1.520579, 1, 1, 1, 1, 1,
-0.5958012, 0.5370633, -0.2673317, 1, 1, 1, 1, 1,
-0.5932375, -2.07881, -3.015754, 1, 1, 1, 1, 1,
-0.5915647, -1.720053, -4.130399, 1, 1, 1, 1, 1,
-0.5896148, -1.135883, -4.249132, 1, 1, 1, 1, 1,
-0.5891857, -0.5110507, -2.51809, 1, 1, 1, 1, 1,
-0.5887151, 1.085012, 0.5078205, 1, 1, 1, 1, 1,
-0.5869009, 0.2329882, -0.3240881, 1, 1, 1, 1, 1,
-0.5838819, 0.1669233, -1.513861, 1, 1, 1, 1, 1,
-0.5718624, -0.3471815, -0.8399178, 1, 1, 1, 1, 1,
-0.5711364, 2.048913, -0.8597689, 1, 1, 1, 1, 1,
-0.5710994, 0.04618987, -1.154757, 0, 0, 1, 1, 1,
-0.5697552, -0.7500077, -2.208103, 1, 0, 0, 1, 1,
-0.5687518, 2.393493, -0.6873542, 1, 0, 0, 1, 1,
-0.5672724, -0.2211759, -1.555283, 1, 0, 0, 1, 1,
-0.5664902, 1.431805, -0.8030838, 1, 0, 0, 1, 1,
-0.5656427, 2.555941, -0.1922275, 1, 0, 0, 1, 1,
-0.5655678, 1.574515, -0.9570915, 0, 0, 0, 1, 1,
-0.5650771, 0.2657252, -0.8892431, 0, 0, 0, 1, 1,
-0.5597188, 0.7437283, -0.7382229, 0, 0, 0, 1, 1,
-0.558558, 0.404766, 0.07010128, 0, 0, 0, 1, 1,
-0.5580933, 2.115288, -1.001342, 0, 0, 0, 1, 1,
-0.5574262, -0.1876169, -3.227266, 0, 0, 0, 1, 1,
-0.5554082, -1.392535, -2.150409, 0, 0, 0, 1, 1,
-0.5541278, 1.578637, -0.3653013, 1, 1, 1, 1, 1,
-0.5528048, 0.7071892, -1.079234, 1, 1, 1, 1, 1,
-0.5521702, 1.260498, -0.155918, 1, 1, 1, 1, 1,
-0.5503328, 1.235701, -0.6094927, 1, 1, 1, 1, 1,
-0.548912, 0.892181, 0.4869934, 1, 1, 1, 1, 1,
-0.5468173, -2.745679, -1.990746, 1, 1, 1, 1, 1,
-0.5464509, 0.2744618, -1.098293, 1, 1, 1, 1, 1,
-0.5428822, 0.4189668, -0.1060991, 1, 1, 1, 1, 1,
-0.5410439, 0.7047844, 0.8997424, 1, 1, 1, 1, 1,
-0.5397515, -0.8407517, -0.3666879, 1, 1, 1, 1, 1,
-0.5322506, 0.0359724, -3.450335, 1, 1, 1, 1, 1,
-0.527409, -0.4594229, -1.742235, 1, 1, 1, 1, 1,
-0.5272084, 0.01015856, -2.4068, 1, 1, 1, 1, 1,
-0.5157042, 0.818599, 0.05445005, 1, 1, 1, 1, 1,
-0.5153401, 1.436303, 0.570031, 1, 1, 1, 1, 1,
-0.5065814, 1.523046, -0.01098949, 0, 0, 1, 1, 1,
-0.5062945, 0.1781655, -1.418969, 1, 0, 0, 1, 1,
-0.5043982, 0.6149395, 0.004319744, 1, 0, 0, 1, 1,
-0.4982116, -2.346678, -3.05898, 1, 0, 0, 1, 1,
-0.4973414, -0.9727854, -1.805301, 1, 0, 0, 1, 1,
-0.4967722, -0.295364, -2.18343, 1, 0, 0, 1, 1,
-0.4939198, -0.6191521, -1.529881, 0, 0, 0, 1, 1,
-0.4936496, 0.3236688, 0.9910446, 0, 0, 0, 1, 1,
-0.4907984, -1.39079, -4.613832, 0, 0, 0, 1, 1,
-0.4881865, -1.265093, -1.431259, 0, 0, 0, 1, 1,
-0.4875339, -0.3270518, -2.323508, 0, 0, 0, 1, 1,
-0.4810938, -0.1865066, -2.723482, 0, 0, 0, 1, 1,
-0.478258, 0.4493532, -0.6547069, 0, 0, 0, 1, 1,
-0.4762145, 0.1630926, -1.92908, 1, 1, 1, 1, 1,
-0.4751056, 0.4467157, -1.567937, 1, 1, 1, 1, 1,
-0.4741383, -1.063038, -1.734482, 1, 1, 1, 1, 1,
-0.4636989, 1.008311, 0.1071074, 1, 1, 1, 1, 1,
-0.4598438, -0.6628278, -3.246653, 1, 1, 1, 1, 1,
-0.4575337, 1.34259, 1.220402, 1, 1, 1, 1, 1,
-0.455716, -1.639101, -1.869292, 1, 1, 1, 1, 1,
-0.4505673, -1.727008, -3.068312, 1, 1, 1, 1, 1,
-0.4489138, -0.1983103, -0.9928612, 1, 1, 1, 1, 1,
-0.4449281, -0.2532544, -1.709515, 1, 1, 1, 1, 1,
-0.444023, 0.9634733, -0.09172943, 1, 1, 1, 1, 1,
-0.4436232, 1.075323, 0.8398442, 1, 1, 1, 1, 1,
-0.4320246, -1.427478, -3.641266, 1, 1, 1, 1, 1,
-0.4247384, -0.7386517, -4.813162, 1, 1, 1, 1, 1,
-0.4239722, 1.156698, -1.042289, 1, 1, 1, 1, 1,
-0.4227122, -0.4630637, -3.885901, 0, 0, 1, 1, 1,
-0.4214174, 1.187118, 0.8149273, 1, 0, 0, 1, 1,
-0.4213212, 0.6531304, -1.906804, 1, 0, 0, 1, 1,
-0.4201471, -0.189422, -0.8387222, 1, 0, 0, 1, 1,
-0.4195265, -0.4824823, -1.623979, 1, 0, 0, 1, 1,
-0.4170908, -1.388479, -4.963495, 1, 0, 0, 1, 1,
-0.4169466, 0.0306036, -2.465433, 0, 0, 0, 1, 1,
-0.4102885, -1.420248, -2.911689, 0, 0, 0, 1, 1,
-0.4058054, -0.2571431, -1.716485, 0, 0, 0, 1, 1,
-0.4054685, -0.04522188, -1.862551, 0, 0, 0, 1, 1,
-0.4007238, 0.1653926, -3.025572, 0, 0, 0, 1, 1,
-0.3946658, -1.385425, -1.787799, 0, 0, 0, 1, 1,
-0.3939668, 0.5821173, -1.253374, 0, 0, 0, 1, 1,
-0.3900386, -0.8011636, -1.69465, 1, 1, 1, 1, 1,
-0.3843647, 0.565603, -0.7023402, 1, 1, 1, 1, 1,
-0.3834878, 0.738134, -1.264501, 1, 1, 1, 1, 1,
-0.3757307, -1.517169, -3.5401, 1, 1, 1, 1, 1,
-0.3744201, 0.230496, -0.5549105, 1, 1, 1, 1, 1,
-0.3734211, 1.248525, -0.2675132, 1, 1, 1, 1, 1,
-0.3664291, 1.017168, -0.501333, 1, 1, 1, 1, 1,
-0.3632764, -0.3814711, -2.809496, 1, 1, 1, 1, 1,
-0.3616008, 0.02502105, -1.039843, 1, 1, 1, 1, 1,
-0.3613531, 0.2153809, -1.417884, 1, 1, 1, 1, 1,
-0.3568755, 1.478596, 1.215464, 1, 1, 1, 1, 1,
-0.3561815, 2.150769, -2.10356, 1, 1, 1, 1, 1,
-0.3526605, -1.211355, -1.610804, 1, 1, 1, 1, 1,
-0.349855, 0.8605626, -0.1316464, 1, 1, 1, 1, 1,
-0.347036, 0.8173956, -0.2639864, 1, 1, 1, 1, 1,
-0.3460391, 1.481982, -0.876673, 0, 0, 1, 1, 1,
-0.3361342, 1.42384, -0.4450417, 1, 0, 0, 1, 1,
-0.335107, 0.3537353, -0.7449406, 1, 0, 0, 1, 1,
-0.3340045, 0.5561097, -0.4925243, 1, 0, 0, 1, 1,
-0.3295583, -0.6826377, -4.573703, 1, 0, 0, 1, 1,
-0.3264538, 1.965735, -1.407575, 1, 0, 0, 1, 1,
-0.3238316, -0.7660437, -2.451062, 0, 0, 0, 1, 1,
-0.3233063, -0.5211213, -1.719305, 0, 0, 0, 1, 1,
-0.3230624, -1.437135, -3.187611, 0, 0, 0, 1, 1,
-0.3202868, -0.8237814, -2.966921, 0, 0, 0, 1, 1,
-0.3135135, -0.8568497, -1.94837, 0, 0, 0, 1, 1,
-0.3017606, 0.6220635, -0.5995736, 0, 0, 0, 1, 1,
-0.3013906, -0.02939585, -1.510358, 0, 0, 0, 1, 1,
-0.3003801, -1.035519, -1.628341, 1, 1, 1, 1, 1,
-0.2964361, 1.174896, 0.1125518, 1, 1, 1, 1, 1,
-0.2951272, -0.5212108, -2.179501, 1, 1, 1, 1, 1,
-0.2941776, -0.1103451, -1.951509, 1, 1, 1, 1, 1,
-0.2830025, -0.5307528, -3.353991, 1, 1, 1, 1, 1,
-0.2797541, -0.5715164, -0.7386695, 1, 1, 1, 1, 1,
-0.2754334, -0.1206017, -1.167338, 1, 1, 1, 1, 1,
-0.272284, 0.3620217, -2.492117, 1, 1, 1, 1, 1,
-0.2720133, -0.2466434, -1.211727, 1, 1, 1, 1, 1,
-0.2720122, -0.4389738, -2.972493, 1, 1, 1, 1, 1,
-0.2717414, 1.176659, 2.059153, 1, 1, 1, 1, 1,
-0.2700557, -0.3976353, -1.951378, 1, 1, 1, 1, 1,
-0.2651446, -1.489993, -2.531167, 1, 1, 1, 1, 1,
-0.2628921, 0.9112721, 0.09486289, 1, 1, 1, 1, 1,
-0.2598645, 0.5232806, -0.7011428, 1, 1, 1, 1, 1,
-0.2595783, -1.931821, -3.469456, 0, 0, 1, 1, 1,
-0.2583497, 0.05819034, -1.409763, 1, 0, 0, 1, 1,
-0.2555671, -1.042481, -2.31697, 1, 0, 0, 1, 1,
-0.2545157, 0.7015399, -0.2285334, 1, 0, 0, 1, 1,
-0.2532762, 0.01964751, -0.625722, 1, 0, 0, 1, 1,
-0.2526281, 0.4077874, -0.600673, 1, 0, 0, 1, 1,
-0.2512709, 1.180278, 1.130061, 0, 0, 0, 1, 1,
-0.2505698, 0.05150981, -1.670246, 0, 0, 0, 1, 1,
-0.2455697, -0.9075778, -3.699071, 0, 0, 0, 1, 1,
-0.2452769, 0.1982773, -2.349123, 0, 0, 0, 1, 1,
-0.2450914, 1.545881, -1.413568, 0, 0, 0, 1, 1,
-0.2435325, -0.1303202, -2.46681, 0, 0, 0, 1, 1,
-0.2416511, -2.840444, -3.157189, 0, 0, 0, 1, 1,
-0.2382643, 0.9952647, -1.653306, 1, 1, 1, 1, 1,
-0.2368777, -0.06867445, -0.6185761, 1, 1, 1, 1, 1,
-0.2333807, -1.829308, -4.049141, 1, 1, 1, 1, 1,
-0.2322567, 1.806258, -0.5291606, 1, 1, 1, 1, 1,
-0.2289986, -1.584562, -2.894779, 1, 1, 1, 1, 1,
-0.2284268, -1.029471, -2.346513, 1, 1, 1, 1, 1,
-0.2277424, -1.014091, -3.420988, 1, 1, 1, 1, 1,
-0.2266395, -1.248382, -3.835502, 1, 1, 1, 1, 1,
-0.2196263, 0.9437395, -0.4478385, 1, 1, 1, 1, 1,
-0.21868, -0.6894954, -2.425719, 1, 1, 1, 1, 1,
-0.2172518, 0.7997655, 1.760663, 1, 1, 1, 1, 1,
-0.2166974, 1.37852, -0.127356, 1, 1, 1, 1, 1,
-0.2165476, 1.241595, 0.5580369, 1, 1, 1, 1, 1,
-0.2148753, -1.964247, -2.96345, 1, 1, 1, 1, 1,
-0.2141374, -2.367632, -3.772472, 1, 1, 1, 1, 1,
-0.2134694, 0.3439304, -0.04158096, 0, 0, 1, 1, 1,
-0.2118197, 1.27198, 1.225038, 1, 0, 0, 1, 1,
-0.2108676, 1.461399, -1.314251, 1, 0, 0, 1, 1,
-0.2089141, 0.7628195, -2.23627, 1, 0, 0, 1, 1,
-0.2077932, 0.4510635, -0.9125428, 1, 0, 0, 1, 1,
-0.2071413, -1.428974, -3.208698, 1, 0, 0, 1, 1,
-0.2033476, -0.06189111, -1.927676, 0, 0, 0, 1, 1,
-0.199934, -1.694779, -1.873458, 0, 0, 0, 1, 1,
-0.193218, 1.275299, -0.2510493, 0, 0, 0, 1, 1,
-0.1889065, 0.4559622, -1.913926, 0, 0, 0, 1, 1,
-0.1887092, 0.8429195, -0.1472839, 0, 0, 0, 1, 1,
-0.1862649, -0.3430026, -1.698278, 0, 0, 0, 1, 1,
-0.1853182, -1.784288, -2.71136, 0, 0, 0, 1, 1,
-0.1814811, -0.717855, -3.046935, 1, 1, 1, 1, 1,
-0.1752053, -0.5391483, -2.955135, 1, 1, 1, 1, 1,
-0.1741077, -0.0916153, -1.387295, 1, 1, 1, 1, 1,
-0.1740953, 0.7304642, -0.1162672, 1, 1, 1, 1, 1,
-0.1633563, -1.61704, -2.315152, 1, 1, 1, 1, 1,
-0.1562468, -0.9465744, -2.7631, 1, 1, 1, 1, 1,
-0.1549828, 0.8044574, -0.64626, 1, 1, 1, 1, 1,
-0.1489992, 0.1392838, -0.4302426, 1, 1, 1, 1, 1,
-0.1477675, 0.4861707, -2.214117, 1, 1, 1, 1, 1,
-0.1475918, 0.62391, -1.450284, 1, 1, 1, 1, 1,
-0.1439283, 0.7741334, -2.004522, 1, 1, 1, 1, 1,
-0.1416987, 0.9800074, -1.736192, 1, 1, 1, 1, 1,
-0.1333839, -0.1935534, -1.545269, 1, 1, 1, 1, 1,
-0.1313888, -0.2247469, -2.237377, 1, 1, 1, 1, 1,
-0.1289853, 1.659404, 0.748112, 1, 1, 1, 1, 1,
-0.1279065, 1.081909, -0.6903341, 0, 0, 1, 1, 1,
-0.1270631, -1.085723, -2.809189, 1, 0, 0, 1, 1,
-0.1249001, -0.5146797, -3.734132, 1, 0, 0, 1, 1,
-0.1213001, -0.2281034, -1.763555, 1, 0, 0, 1, 1,
-0.1211353, -2.415376, -2.928826, 1, 0, 0, 1, 1,
-0.1200518, 0.4810151, -0.3962008, 1, 0, 0, 1, 1,
-0.1173395, 0.4279121, -1.32866, 0, 0, 0, 1, 1,
-0.1125961, -0.5098173, -4.197557, 0, 0, 0, 1, 1,
-0.1078242, -0.3781945, -3.626508, 0, 0, 0, 1, 1,
-0.10731, -1.207064, -1.82594, 0, 0, 0, 1, 1,
-0.1032311, 0.5623584, -1.331676, 0, 0, 0, 1, 1,
-0.09787945, 0.3971764, 0.05928399, 0, 0, 0, 1, 1,
-0.09691809, -0.3131204, -2.311596, 0, 0, 0, 1, 1,
-0.09487315, -0.7106877, -2.369098, 1, 1, 1, 1, 1,
-0.09362545, -0.1955488, -2.274571, 1, 1, 1, 1, 1,
-0.09255648, 0.2511639, 0.3984917, 1, 1, 1, 1, 1,
-0.09181301, -1.482181, -3.403009, 1, 1, 1, 1, 1,
-0.09152932, 0.5958519, -0.472829, 1, 1, 1, 1, 1,
-0.08968611, -0.7610465, -2.496336, 1, 1, 1, 1, 1,
-0.08950705, 0.8441789, 0.7702457, 1, 1, 1, 1, 1,
-0.08819693, -0.4464251, -3.222927, 1, 1, 1, 1, 1,
-0.08572372, 1.342118, 0.2139698, 1, 1, 1, 1, 1,
-0.0840075, 1.459911, 1.664286, 1, 1, 1, 1, 1,
-0.07775599, 1.824556, 0.2898111, 1, 1, 1, 1, 1,
-0.07747487, -0.7310632, -5.131672, 1, 1, 1, 1, 1,
-0.07600689, 0.8870416, -0.1045121, 1, 1, 1, 1, 1,
-0.07512529, 0.3086533, 0.3992217, 1, 1, 1, 1, 1,
-0.07436736, 1.947482, 1.40598, 1, 1, 1, 1, 1,
-0.0723518, -1.567505, -3.772059, 0, 0, 1, 1, 1,
-0.0625207, 0.2309344, -0.4491075, 1, 0, 0, 1, 1,
-0.05769298, -0.5440239, -2.664305, 1, 0, 0, 1, 1,
-0.0569706, 1.596315, 0.3822458, 1, 0, 0, 1, 1,
-0.05649395, 0.8196511, -0.3733224, 1, 0, 0, 1, 1,
-0.05303527, 0.7075538, 0.1189456, 1, 0, 0, 1, 1,
-0.05022283, -0.7679268, -1.607552, 0, 0, 0, 1, 1,
-0.04832372, -1.071131, -4.065449, 0, 0, 0, 1, 1,
-0.04408722, 0.8377715, 0.0427995, 0, 0, 0, 1, 1,
-0.0379046, 0.1748243, -2.608265, 0, 0, 0, 1, 1,
-0.03423749, -1.086979, -3.465156, 0, 0, 0, 1, 1,
-0.02832602, 0.3316434, 0.1074441, 0, 0, 0, 1, 1,
-0.02432786, -0.8461322, -2.633659, 0, 0, 0, 1, 1,
-0.02210429, -0.5207342, -4.593842, 1, 1, 1, 1, 1,
-0.02035357, -1.992461, -2.756012, 1, 1, 1, 1, 1,
-0.01871748, -0.3764618, -3.664859, 1, 1, 1, 1, 1,
-0.01677315, -0.7054467, -3.061988, 1, 1, 1, 1, 1,
-0.01304987, -0.1233298, -2.483842, 1, 1, 1, 1, 1,
0.0037189, 0.2066536, 0.8404061, 1, 1, 1, 1, 1,
0.004456449, -0.1385329, 4.502003, 1, 1, 1, 1, 1,
0.008463919, 0.7652421, -3.201162, 1, 1, 1, 1, 1,
0.01075589, -0.8427426, 4.484598, 1, 1, 1, 1, 1,
0.0108899, 2.232535, 0.7919863, 1, 1, 1, 1, 1,
0.01533657, 0.6858745, 0.9272902, 1, 1, 1, 1, 1,
0.01793493, -0.4269061, 2.207241, 1, 1, 1, 1, 1,
0.01795916, 2.008097, 0.7280978, 1, 1, 1, 1, 1,
0.02034224, 0.01827105, 0.7013253, 1, 1, 1, 1, 1,
0.02456814, -1.792892, 3.795776, 1, 1, 1, 1, 1,
0.02727679, -0.1987674, 4.489879, 0, 0, 1, 1, 1,
0.03074249, 1.464882, -1.172871, 1, 0, 0, 1, 1,
0.0325348, -0.654398, 2.401444, 1, 0, 0, 1, 1,
0.03384161, 0.05072188, 0.567274, 1, 0, 0, 1, 1,
0.03642417, 0.9724007, 0.5817378, 1, 0, 0, 1, 1,
0.03755752, -1.778255, 4.21835, 1, 0, 0, 1, 1,
0.03765306, -0.4192157, 3.268717, 0, 0, 0, 1, 1,
0.03855601, -1.59937, 2.73238, 0, 0, 0, 1, 1,
0.0416591, 0.8431918, 2.410152, 0, 0, 0, 1, 1,
0.04177887, -1.078331, 2.913927, 0, 0, 0, 1, 1,
0.04419399, -1.941601, 3.696328, 0, 0, 0, 1, 1,
0.04482571, -0.06850754, 0.001700784, 0, 0, 0, 1, 1,
0.04843584, -0.3119943, 2.501954, 0, 0, 0, 1, 1,
0.04852605, -0.7837761, 2.903721, 1, 1, 1, 1, 1,
0.04991755, 0.3041382, 1.07619, 1, 1, 1, 1, 1,
0.05014742, 0.4058623, 0.6004196, 1, 1, 1, 1, 1,
0.05395063, -0.606416, 3.405661, 1, 1, 1, 1, 1,
0.0540834, -0.7617481, 6.367185, 1, 1, 1, 1, 1,
0.05708711, -1.557239, 2.589778, 1, 1, 1, 1, 1,
0.0576011, -0.101324, 3.516228, 1, 1, 1, 1, 1,
0.05920482, -1.482599, 4.703137, 1, 1, 1, 1, 1,
0.05923599, -0.4335419, 1.590416, 1, 1, 1, 1, 1,
0.06395061, 0.7836117, 1.259758, 1, 1, 1, 1, 1,
0.0649033, -0.1930229, 1.083804, 1, 1, 1, 1, 1,
0.06782936, 1.074723, -0.4035926, 1, 1, 1, 1, 1,
0.06791893, 0.8666167, 0.8532029, 1, 1, 1, 1, 1,
0.07140625, -0.1115726, 3.201427, 1, 1, 1, 1, 1,
0.07251516, 1.400336, 0.9039659, 1, 1, 1, 1, 1,
0.07430913, 1.37805, 1.089391, 0, 0, 1, 1, 1,
0.07458686, 0.05219928, -0.9884528, 1, 0, 0, 1, 1,
0.07505208, 2.182102, -0.3948494, 1, 0, 0, 1, 1,
0.07949974, 0.7786185, 0.3375839, 1, 0, 0, 1, 1,
0.08022182, 0.8962979, -0.2726583, 1, 0, 0, 1, 1,
0.08217362, -0.04241002, 1.37522, 1, 0, 0, 1, 1,
0.08475625, -1.21892, 2.17921, 0, 0, 0, 1, 1,
0.08786576, 0.3216786, -0.8454254, 0, 0, 0, 1, 1,
0.08800755, -1.225158, 3.999546, 0, 0, 0, 1, 1,
0.08891061, 0.1494113, 0.3593081, 0, 0, 0, 1, 1,
0.0892098, 0.2559383, -0.3015407, 0, 0, 0, 1, 1,
0.09308749, -0.5721496, 3.67554, 0, 0, 0, 1, 1,
0.09591349, 0.439839, 0.142558, 0, 0, 0, 1, 1,
0.1000771, 0.2616607, -0.5117579, 1, 1, 1, 1, 1,
0.1007128, 0.5985255, -0.6829066, 1, 1, 1, 1, 1,
0.1012027, 2.053138, 0.6835487, 1, 1, 1, 1, 1,
0.1021436, -1.079258, 3.535291, 1, 1, 1, 1, 1,
0.1045425, -3.141237, 3.492028, 1, 1, 1, 1, 1,
0.1073109, 0.2299401, -0.1914791, 1, 1, 1, 1, 1,
0.1122854, -0.7965867, 2.149716, 1, 1, 1, 1, 1,
0.116562, 0.6611247, 0.588936, 1, 1, 1, 1, 1,
0.1188459, -1.850218, 2.288181, 1, 1, 1, 1, 1,
0.1219157, 0.1895149, 0.3536403, 1, 1, 1, 1, 1,
0.1221458, 1.299388, -1.941512, 1, 1, 1, 1, 1,
0.124282, -1.286939, 4.482447, 1, 1, 1, 1, 1,
0.1245306, -0.7635764, 2.552994, 1, 1, 1, 1, 1,
0.1273353, 1.298069, -0.5943653, 1, 1, 1, 1, 1,
0.1273801, 0.4559759, -1.432183, 1, 1, 1, 1, 1,
0.128952, -1.834906, 4.397378, 0, 0, 1, 1, 1,
0.1324172, 0.8273981, -0.3529134, 1, 0, 0, 1, 1,
0.1333297, 0.4178119, -0.1233012, 1, 0, 0, 1, 1,
0.1333985, 0.6215472, -0.6595087, 1, 0, 0, 1, 1,
0.1377724, 0.755183, -0.3214191, 1, 0, 0, 1, 1,
0.1408228, -1.018669, 1.402453, 1, 0, 0, 1, 1,
0.1467167, -0.877419, 0.9923585, 0, 0, 0, 1, 1,
0.1507883, -0.614724, 3.99655, 0, 0, 0, 1, 1,
0.1526151, 0.3051254, -0.7394176, 0, 0, 0, 1, 1,
0.1534637, -0.7797523, 3.19343, 0, 0, 0, 1, 1,
0.1556962, 0.5024328, 1.668208, 0, 0, 0, 1, 1,
0.1569981, -0.9514519, 1.437336, 0, 0, 0, 1, 1,
0.1571558, -0.3659962, 3.255898, 0, 0, 0, 1, 1,
0.1580462, 0.3679699, 0.8365195, 1, 1, 1, 1, 1,
0.1624412, 0.1071819, 0.6742321, 1, 1, 1, 1, 1,
0.1642144, 1.481763, -0.1777338, 1, 1, 1, 1, 1,
0.1659742, -0.653384, 2.480564, 1, 1, 1, 1, 1,
0.1676289, 2.279314, 1.863212, 1, 1, 1, 1, 1,
0.1693286, -1.277709, 0.7433154, 1, 1, 1, 1, 1,
0.1694186, -0.05951285, 1.764969, 1, 1, 1, 1, 1,
0.1722182, 0.9770371, -0.2565554, 1, 1, 1, 1, 1,
0.1738783, 1.405323, 0.3150049, 1, 1, 1, 1, 1,
0.1749576, -2.128709, 1.010264, 1, 1, 1, 1, 1,
0.1768166, -1.579581, 4.495975, 1, 1, 1, 1, 1,
0.177384, -1.318664, 2.882315, 1, 1, 1, 1, 1,
0.1788076, 0.1394462, -0.3649314, 1, 1, 1, 1, 1,
0.1811916, -0.9643474, 3.425358, 1, 1, 1, 1, 1,
0.1906927, -0.0227562, 1.208457, 1, 1, 1, 1, 1,
0.1910685, 0.5463275, -0.4829461, 0, 0, 1, 1, 1,
0.1933731, -0.6240934, 2.967321, 1, 0, 0, 1, 1,
0.1965978, 0.4567502, 0.6306829, 1, 0, 0, 1, 1,
0.1978472, 0.9346028, 0.8065738, 1, 0, 0, 1, 1,
0.1991095, -0.07679678, 2.002171, 1, 0, 0, 1, 1,
0.1996799, -0.2771166, 3.944346, 1, 0, 0, 1, 1,
0.2004114, -0.765428, 2.53087, 0, 0, 0, 1, 1,
0.2010676, -0.2900484, 1.870474, 0, 0, 0, 1, 1,
0.2035059, -1.117695, 2.942734, 0, 0, 0, 1, 1,
0.2040108, 1.281529, 0.4990325, 0, 0, 0, 1, 1,
0.2054932, -0.05090259, 1.784032, 0, 0, 0, 1, 1,
0.2105479, -1.045717, 3.75464, 0, 0, 0, 1, 1,
0.213073, 1.437125, -0.06563396, 0, 0, 0, 1, 1,
0.2255626, -0.6639583, 4.527218, 1, 1, 1, 1, 1,
0.2279698, 0.4670039, 0.3874162, 1, 1, 1, 1, 1,
0.228104, -0.08983608, 2.011746, 1, 1, 1, 1, 1,
0.2313249, -1.298905, 1.612337, 1, 1, 1, 1, 1,
0.2313489, -0.1302456, 2.227216, 1, 1, 1, 1, 1,
0.2327147, 0.1486011, 1.073211, 1, 1, 1, 1, 1,
0.235397, 0.2392197, 1.139256, 1, 1, 1, 1, 1,
0.2432179, 0.08965646, 0.7793187, 1, 1, 1, 1, 1,
0.2535924, -1.261569, 2.916298, 1, 1, 1, 1, 1,
0.2599039, -0.09619634, 1.714719, 1, 1, 1, 1, 1,
0.2604463, 0.3744624, 0.8472573, 1, 1, 1, 1, 1,
0.2631969, 1.244146, -0.7269971, 1, 1, 1, 1, 1,
0.26449, -0.2949021, 1.379258, 1, 1, 1, 1, 1,
0.2660002, -0.9754717, 2.162903, 1, 1, 1, 1, 1,
0.2683511, 0.7368293, 0.1787504, 1, 1, 1, 1, 1,
0.2729038, -1.159143, 0.7059592, 0, 0, 1, 1, 1,
0.2756053, -0.8277336, 3.525882, 1, 0, 0, 1, 1,
0.2807858, -0.7477255, 2.70882, 1, 0, 0, 1, 1,
0.2823305, 1.150417, 2.112812, 1, 0, 0, 1, 1,
0.2883355, 0.6006074, 1.774565, 1, 0, 0, 1, 1,
0.2903876, 1.106369, 1.238327, 1, 0, 0, 1, 1,
0.291927, 0.5357623, -0.1497614, 0, 0, 0, 1, 1,
0.2941801, 0.6482338, -0.2097885, 0, 0, 0, 1, 1,
0.2949445, 0.5938891, 0.3601187, 0, 0, 0, 1, 1,
0.2968951, -1.086159, 2.628681, 0, 0, 0, 1, 1,
0.2981278, 0.9361281, -0.2030026, 0, 0, 0, 1, 1,
0.3013082, -0.8324787, 6.121896, 0, 0, 0, 1, 1,
0.3047214, -1.126165, 1.123721, 0, 0, 0, 1, 1,
0.3092713, -2.324996, 3.502515, 1, 1, 1, 1, 1,
0.3095233, 0.4585371, -0.2510957, 1, 1, 1, 1, 1,
0.3140495, 0.3387536, 1.185799, 1, 1, 1, 1, 1,
0.3172767, -0.5903316, 5.237564, 1, 1, 1, 1, 1,
0.3191832, 1.331321, 1.201712, 1, 1, 1, 1, 1,
0.3213274, -0.5220836, 3.552657, 1, 1, 1, 1, 1,
0.3219055, -1.486172, 3.768939, 1, 1, 1, 1, 1,
0.3267977, -1.198135, 3.79428, 1, 1, 1, 1, 1,
0.3278408, 0.8313995, -0.1490705, 1, 1, 1, 1, 1,
0.3293923, 0.5584339, 0.4907169, 1, 1, 1, 1, 1,
0.337422, 0.3572415, -1.599222, 1, 1, 1, 1, 1,
0.3377653, -0.8290415, 5.166121, 1, 1, 1, 1, 1,
0.337829, 0.6974467, 2.084673, 1, 1, 1, 1, 1,
0.3381681, 0.4128852, 0.6364723, 1, 1, 1, 1, 1,
0.3400021, -0.9745454, 4.319642, 1, 1, 1, 1, 1,
0.3411877, -0.7583321, 2.807397, 0, 0, 1, 1, 1,
0.3462443, -0.1250416, 1.960582, 1, 0, 0, 1, 1,
0.3483978, -0.05688753, 3.289478, 1, 0, 0, 1, 1,
0.3495159, -0.2597453, 2.094829, 1, 0, 0, 1, 1,
0.3502177, -1.449093, 1.964227, 1, 0, 0, 1, 1,
0.3506708, -0.8570623, 3.492154, 1, 0, 0, 1, 1,
0.3524314, 0.3122317, 1.471299, 0, 0, 0, 1, 1,
0.3544725, 0.1748379, 0.3567037, 0, 0, 0, 1, 1,
0.3569947, 0.3210513, 1.45329, 0, 0, 0, 1, 1,
0.3749545, 1.194045, 0.2082095, 0, 0, 0, 1, 1,
0.3775119, -0.1454889, 1.176401, 0, 0, 0, 1, 1,
0.3797784, 0.06123531, 0.9249204, 0, 0, 0, 1, 1,
0.3886832, 0.8434786, -0.7749317, 0, 0, 0, 1, 1,
0.3933983, -0.5874946, 4.347408, 1, 1, 1, 1, 1,
0.3935025, -0.9743096, 1.900117, 1, 1, 1, 1, 1,
0.3965521, -0.08929248, 2.032288, 1, 1, 1, 1, 1,
0.3969035, 0.4268284, 0.04887865, 1, 1, 1, 1, 1,
0.3973992, 0.5511459, 3.344334, 1, 1, 1, 1, 1,
0.3988364, -2.441919, 0.7274954, 1, 1, 1, 1, 1,
0.4032411, -1.230772, 4.106468, 1, 1, 1, 1, 1,
0.4055729, -1.073523, 2.799177, 1, 1, 1, 1, 1,
0.4103189, -1.90984, 2.430795, 1, 1, 1, 1, 1,
0.411106, -2.523588, 3.121974, 1, 1, 1, 1, 1,
0.4113682, -0.4644955, 0.6989291, 1, 1, 1, 1, 1,
0.417372, 0.1279817, 2.245818, 1, 1, 1, 1, 1,
0.4229315, 0.772055, 1.748092, 1, 1, 1, 1, 1,
0.4272592, 0.1011817, 1.825339, 1, 1, 1, 1, 1,
0.4293358, -0.6644132, 2.653055, 1, 1, 1, 1, 1,
0.4354437, 1.921203, 0.9800464, 0, 0, 1, 1, 1,
0.4372945, 0.4004169, -1.005126, 1, 0, 0, 1, 1,
0.4385811, -0.5233228, 1.803796, 1, 0, 0, 1, 1,
0.4405441, 0.03303804, 1.883291, 1, 0, 0, 1, 1,
0.4432926, -1.149565, 1.437795, 1, 0, 0, 1, 1,
0.4454418, -0.3397793, 0.2499349, 1, 0, 0, 1, 1,
0.4488609, -1.560928, 3.277477, 0, 0, 0, 1, 1,
0.4519381, 1.110734, 1.337927, 0, 0, 0, 1, 1,
0.4521978, 0.3858781, 0.1476921, 0, 0, 0, 1, 1,
0.4533718, -0.6564643, 1.726769, 0, 0, 0, 1, 1,
0.4548994, 0.2287107, 1.367341, 0, 0, 0, 1, 1,
0.4566958, 0.5255729, 1.673988, 0, 0, 0, 1, 1,
0.4609426, 1.488775, 1.847685, 0, 0, 0, 1, 1,
0.461541, 1.236119, -0.185038, 1, 1, 1, 1, 1,
0.4620363, -1.110277, 3.309119, 1, 1, 1, 1, 1,
0.4627914, -0.5716279, 3.280853, 1, 1, 1, 1, 1,
0.4646044, 0.7558277, 0.8937224, 1, 1, 1, 1, 1,
0.4677323, -0.1782649, 3.2934, 1, 1, 1, 1, 1,
0.4680675, 1.062195, -0.9287745, 1, 1, 1, 1, 1,
0.4723967, 2.103096, -0.6084502, 1, 1, 1, 1, 1,
0.4739204, 1.692092, 2.272308, 1, 1, 1, 1, 1,
0.475118, -0.6279621, 3.612432, 1, 1, 1, 1, 1,
0.4807804, 1.974751, 0.2655276, 1, 1, 1, 1, 1,
0.4857132, 0.1444511, 1.846982, 1, 1, 1, 1, 1,
0.4864324, -1.317886, 3.033206, 1, 1, 1, 1, 1,
0.4864402, 0.3237104, 1.838543, 1, 1, 1, 1, 1,
0.4963512, 0.9413639, 0.4079924, 1, 1, 1, 1, 1,
0.4987259, 0.08988516, 0.5650129, 1, 1, 1, 1, 1,
0.5006578, -0.3497148, 2.797156, 0, 0, 1, 1, 1,
0.5032532, -1.392289, 3.412773, 1, 0, 0, 1, 1,
0.5066099, -0.1770311, 1.821856, 1, 0, 0, 1, 1,
0.5083697, 0.3655712, 1.117089, 1, 0, 0, 1, 1,
0.5179215, 1.175223, 0.4780727, 1, 0, 0, 1, 1,
0.5182572, 0.6352437, 0.192333, 1, 0, 0, 1, 1,
0.5230504, -0.5848798, 3.576316, 0, 0, 0, 1, 1,
0.5235488, -0.3575525, 2.698219, 0, 0, 0, 1, 1,
0.5250936, -1.238935, 3.556971, 0, 0, 0, 1, 1,
0.5332808, -1.635249, 2.986291, 0, 0, 0, 1, 1,
0.5386127, -0.1772941, 2.481774, 0, 0, 0, 1, 1,
0.538676, 1.168355, -0.5155583, 0, 0, 0, 1, 1,
0.5398495, 1.158723, 0.378813, 0, 0, 0, 1, 1,
0.5403008, -0.7752586, 3.144346, 1, 1, 1, 1, 1,
0.5444829, -0.5277675, 2.678143, 1, 1, 1, 1, 1,
0.5490723, 0.8970358, 0.3056702, 1, 1, 1, 1, 1,
0.549242, 0.5988566, 0.3385919, 1, 1, 1, 1, 1,
0.551345, 1.437559, 1.546686, 1, 1, 1, 1, 1,
0.5552399, -1.216644, 4.548536, 1, 1, 1, 1, 1,
0.5560503, 1.415775, -0.5756692, 1, 1, 1, 1, 1,
0.5560946, 2.096792, -0.4243498, 1, 1, 1, 1, 1,
0.5585421, 0.9614201, -0.1072313, 1, 1, 1, 1, 1,
0.5626769, 0.6316732, 1.355309, 1, 1, 1, 1, 1,
0.5656163, -1.094832, 3.755695, 1, 1, 1, 1, 1,
0.566482, -1.318071, 3.91545, 1, 1, 1, 1, 1,
0.5726677, -0.2607268, 1.816825, 1, 1, 1, 1, 1,
0.5740073, 0.5421315, 1.157619, 1, 1, 1, 1, 1,
0.5769258, -1.428018, 3.022897, 1, 1, 1, 1, 1,
0.5793668, -1.413332, 3.683677, 0, 0, 1, 1, 1,
0.5834286, -1.191477, 1.346429, 1, 0, 0, 1, 1,
0.5850919, -1.585682, 1.921041, 1, 0, 0, 1, 1,
0.5898244, -0.2932978, 1.261231, 1, 0, 0, 1, 1,
0.601779, -0.5939805, 2.452622, 1, 0, 0, 1, 1,
0.6041814, -0.509737, 1.026788, 1, 0, 0, 1, 1,
0.6140893, -1.103182, 2.328228, 0, 0, 0, 1, 1,
0.6144568, -1.167709, 2.097978, 0, 0, 0, 1, 1,
0.6175602, 0.5269142, 1.634299, 0, 0, 0, 1, 1,
0.6217849, 0.2934218, 1.462068, 0, 0, 0, 1, 1,
0.6312938, 2.214842, 2.050173, 0, 0, 0, 1, 1,
0.6329145, 1.067026, -0.5709185, 0, 0, 0, 1, 1,
0.6331113, 1.67163, -0.8046641, 0, 0, 0, 1, 1,
0.6340696, 1.324555, -0.6553422, 1, 1, 1, 1, 1,
0.6353125, -0.2404056, 2.700512, 1, 1, 1, 1, 1,
0.6416767, -0.8776368, 1.250054, 1, 1, 1, 1, 1,
0.6469196, 0.2900609, 0.8288114, 1, 1, 1, 1, 1,
0.6503483, -1.482778, 3.021487, 1, 1, 1, 1, 1,
0.6672802, 1.594186, 2.114205, 1, 1, 1, 1, 1,
0.6706309, -0.6958002, 2.471102, 1, 1, 1, 1, 1,
0.6716639, 1.204601, -0.03351677, 1, 1, 1, 1, 1,
0.6753038, -0.9712933, 2.538083, 1, 1, 1, 1, 1,
0.6775027, -1.828953, 3.584599, 1, 1, 1, 1, 1,
0.6778216, -1.065982, 2.176041, 1, 1, 1, 1, 1,
0.6793491, -0.2249792, 1.254868, 1, 1, 1, 1, 1,
0.6803177, -0.4780354, 0.691193, 1, 1, 1, 1, 1,
0.6848922, 1.873603, -1.150748, 1, 1, 1, 1, 1,
0.6910658, 1.070606, -0.205701, 1, 1, 1, 1, 1,
0.6946618, -1.939271, 2.537594, 0, 0, 1, 1, 1,
0.6957715, 1.939551, -1.37571, 1, 0, 0, 1, 1,
0.6969815, -1.842913, 3.903386, 1, 0, 0, 1, 1,
0.6990583, 0.6618992, 0.4425522, 1, 0, 0, 1, 1,
0.6995727, -0.25846, 2.00099, 1, 0, 0, 1, 1,
0.7004159, 0.5177461, 2.421877, 1, 0, 0, 1, 1,
0.700716, -0.598047, 3.30696, 0, 0, 0, 1, 1,
0.701229, 0.6360381, 0.1820246, 0, 0, 0, 1, 1,
0.70478, -0.04870081, 2.436374, 0, 0, 0, 1, 1,
0.7050838, -2.046366, 1.688908, 0, 0, 0, 1, 1,
0.7082584, 0.5425851, 0.3994318, 0, 0, 0, 1, 1,
0.7088612, 0.5726032, 1.915192, 0, 0, 0, 1, 1,
0.7127866, -0.9165598, 2.676885, 0, 0, 0, 1, 1,
0.714821, 1.228781, 3.656144, 1, 1, 1, 1, 1,
0.7165855, 0.5468814, 1.268649, 1, 1, 1, 1, 1,
0.721157, -0.2629682, 2.609329, 1, 1, 1, 1, 1,
0.7293125, 1.135041, 0.03622475, 1, 1, 1, 1, 1,
0.7310175, -0.2779393, 0.5939867, 1, 1, 1, 1, 1,
0.7399695, -1.060549, 0.8363629, 1, 1, 1, 1, 1,
0.7472338, 0.8708336, 2.917962, 1, 1, 1, 1, 1,
0.752369, 1.28881, 0.9091187, 1, 1, 1, 1, 1,
0.7525465, -1.186502, 2.092265, 1, 1, 1, 1, 1,
0.753514, -1.664627, 1.561019, 1, 1, 1, 1, 1,
0.7606799, 1.21121, 1.572271, 1, 1, 1, 1, 1,
0.7666511, -0.6760455, 2.886026, 1, 1, 1, 1, 1,
0.76855, -0.6671032, 3.301903, 1, 1, 1, 1, 1,
0.7686853, -0.756648, 3.115114, 1, 1, 1, 1, 1,
0.7686943, -0.5353843, 2.37682, 1, 1, 1, 1, 1,
0.7721022, 0.2135316, 0.4207726, 0, 0, 1, 1, 1,
0.7724806, 0.2684373, 0.597001, 1, 0, 0, 1, 1,
0.7739132, -0.6293395, 1.129664, 1, 0, 0, 1, 1,
0.7739981, 0.5610119, 0.7137171, 1, 0, 0, 1, 1,
0.7794013, 0.4555743, 2.969139, 1, 0, 0, 1, 1,
0.7822925, -1.787868, 3.615089, 1, 0, 0, 1, 1,
0.7867429, -0.1276384, 0.3526623, 0, 0, 0, 1, 1,
0.7879657, 1.728715, -0.2569816, 0, 0, 0, 1, 1,
0.7944224, -0.05476912, 0.7549269, 0, 0, 0, 1, 1,
0.7952708, 0.05199861, 0.1857279, 0, 0, 0, 1, 1,
0.7954192, -0.1271827, 2.600585, 0, 0, 0, 1, 1,
0.7960812, 2.047417, 0.683251, 0, 0, 0, 1, 1,
0.8005748, -0.6524766, 2.879838, 0, 0, 0, 1, 1,
0.8022552, -0.5265599, 1.316885, 1, 1, 1, 1, 1,
0.8062426, 0.2820295, -0.651887, 1, 1, 1, 1, 1,
0.8087425, -0.1795473, 1.280082, 1, 1, 1, 1, 1,
0.8163638, 1.841343, 1.092849, 1, 1, 1, 1, 1,
0.8217001, 2.03537, 0.5662238, 1, 1, 1, 1, 1,
0.830304, -2.120002, 2.097407, 1, 1, 1, 1, 1,
0.8311144, -0.9135573, 3.173289, 1, 1, 1, 1, 1,
0.8315668, -0.3286799, 1.677027, 1, 1, 1, 1, 1,
0.8406593, -2.255109, 2.764674, 1, 1, 1, 1, 1,
0.8416091, 0.6690701, 1.926605, 1, 1, 1, 1, 1,
0.8421542, -0.627067, 2.036077, 1, 1, 1, 1, 1,
0.8465908, -0.5391005, 1.422899, 1, 1, 1, 1, 1,
0.8515344, -1.421365, 2.896481, 1, 1, 1, 1, 1,
0.8569029, 0.6010148, 1.851349, 1, 1, 1, 1, 1,
0.8581303, 0.2026095, 0.7524602, 1, 1, 1, 1, 1,
0.8663113, -0.321476, 1.15081, 0, 0, 1, 1, 1,
0.8664353, 0.1122791, 0.7081648, 1, 0, 0, 1, 1,
0.8694405, -1.227903, 2.086265, 1, 0, 0, 1, 1,
0.8726404, 0.8800185, 1.194662, 1, 0, 0, 1, 1,
0.8744076, 0.5793314, -0.275098, 1, 0, 0, 1, 1,
0.8860653, -1.339618, 3.56734, 1, 0, 0, 1, 1,
0.891247, -0.8471566, 0.5389213, 0, 0, 0, 1, 1,
0.9001892, -0.01935969, 2.191702, 0, 0, 0, 1, 1,
0.905385, -0.2537629, 1.888008, 0, 0, 0, 1, 1,
0.9096983, 0.05026164, 0.7589238, 0, 0, 0, 1, 1,
0.9168695, -1.762166, 0.4115697, 0, 0, 0, 1, 1,
0.9225305, -0.435211, 2.83235, 0, 0, 0, 1, 1,
0.9252056, -0.7338899, 2.490028, 0, 0, 0, 1, 1,
0.9324575, -1.454928, 2.643472, 1, 1, 1, 1, 1,
0.9363967, -0.009708546, 1.298535, 1, 1, 1, 1, 1,
0.9388818, 0.7399249, 1.755998, 1, 1, 1, 1, 1,
0.9407987, 1.122589, -1.379835, 1, 1, 1, 1, 1,
0.9476699, -0.7240543, 1.393685, 1, 1, 1, 1, 1,
0.950392, -1.290563, 2.445708, 1, 1, 1, 1, 1,
0.9510404, 0.600576, 1.169865, 1, 1, 1, 1, 1,
0.9552586, 0.4503332, 0.505757, 1, 1, 1, 1, 1,
0.955994, -0.297215, 1.555089, 1, 1, 1, 1, 1,
0.9593876, 2.899666, 0.3484672, 1, 1, 1, 1, 1,
0.9616928, -0.276276, 1.431327, 1, 1, 1, 1, 1,
0.9620685, 0.7767237, 1.78626, 1, 1, 1, 1, 1,
0.9637634, -0.1841868, 0.5601059, 1, 1, 1, 1, 1,
0.9643839, -0.1958676, 3.176532, 1, 1, 1, 1, 1,
0.9655698, -0.2422753, 1.458708, 1, 1, 1, 1, 1,
0.9670811, 1.590818, 1.396359, 0, 0, 1, 1, 1,
0.9770276, -0.08402221, 1.036259, 1, 0, 0, 1, 1,
0.9858124, 0.2029506, 0.3086692, 1, 0, 0, 1, 1,
0.9883881, 0.7479231, 1.565462, 1, 0, 0, 1, 1,
0.9904072, 1.108738, 1.200145, 1, 0, 0, 1, 1,
0.9934433, -1.664505, 3.434402, 1, 0, 0, 1, 1,
1.001656, -1.756984, 2.666605, 0, 0, 0, 1, 1,
1.003667, -0.6568642, 3.036994, 0, 0, 0, 1, 1,
1.006629, 0.3514113, 0.4770903, 0, 0, 0, 1, 1,
1.01196, -0.4710292, 3.285738, 0, 0, 0, 1, 1,
1.013618, 1.339247, 1.832903, 0, 0, 0, 1, 1,
1.02558, -0.3426223, 2.184729, 0, 0, 0, 1, 1,
1.026109, 0.1856105, 0.3211558, 0, 0, 0, 1, 1,
1.031303, 1.687848, -0.05016956, 1, 1, 1, 1, 1,
1.045474, 0.8657354, -0.03802555, 1, 1, 1, 1, 1,
1.046033, -1.737044, 4.077287, 1, 1, 1, 1, 1,
1.046999, -0.5141674, 2.175526, 1, 1, 1, 1, 1,
1.050504, 0.2185848, 2.13029, 1, 1, 1, 1, 1,
1.051109, -0.3437132, 1.978903, 1, 1, 1, 1, 1,
1.052502, 0.5183191, 1.78354, 1, 1, 1, 1, 1,
1.05421, -1.129226, 3.107285, 1, 1, 1, 1, 1,
1.070139, -1.519964, 2.27665, 1, 1, 1, 1, 1,
1.073698, 0.1355031, 0.6561826, 1, 1, 1, 1, 1,
1.088185, 0.5351955, 1.704013, 1, 1, 1, 1, 1,
1.089577, -0.3756562, 2.066016, 1, 1, 1, 1, 1,
1.091349, 0.3379079, 2.004713, 1, 1, 1, 1, 1,
1.098295, -0.269057, 2.66084, 1, 1, 1, 1, 1,
1.120567, -0.9419237, 2.557512, 1, 1, 1, 1, 1,
1.124493, 0.6168318, 3.037832, 0, 0, 1, 1, 1,
1.132096, 0.09618639, 0.7083539, 1, 0, 0, 1, 1,
1.135235, -1.337901, 2.558465, 1, 0, 0, 1, 1,
1.149132, -0.05382837, 2.190032, 1, 0, 0, 1, 1,
1.158967, 0.3156718, 0.9932178, 1, 0, 0, 1, 1,
1.161052, -0.5965536, 1.097856, 1, 0, 0, 1, 1,
1.169491, 0.4635157, 2.045685, 0, 0, 0, 1, 1,
1.169859, 1.393072, 1.429636, 0, 0, 0, 1, 1,
1.177462, 4.57185, 0.7309648, 0, 0, 0, 1, 1,
1.183879, 0.08865814, 0.3629096, 0, 0, 0, 1, 1,
1.188666, 2.064189, 0.6471747, 0, 0, 0, 1, 1,
1.194278, 0.8625364, 2.041842, 0, 0, 0, 1, 1,
1.197864, -0.6726523, 2.405851, 0, 0, 0, 1, 1,
1.203151, 0.8618551, 1.214885, 1, 1, 1, 1, 1,
1.207129, 0.5293518, -0.1817254, 1, 1, 1, 1, 1,
1.208024, 0.391626, 2.231351, 1, 1, 1, 1, 1,
1.213016, 0.6037106, 2.29089, 1, 1, 1, 1, 1,
1.218032, 0.5584463, 1.603678, 1, 1, 1, 1, 1,
1.219992, -0.8031024, 4.702309, 1, 1, 1, 1, 1,
1.221932, 0.2661262, 2.086874, 1, 1, 1, 1, 1,
1.232634, -1.0689, 2.290764, 1, 1, 1, 1, 1,
1.23841, -1.253073, 4.215551, 1, 1, 1, 1, 1,
1.243078, -0.3471251, 3.265455, 1, 1, 1, 1, 1,
1.243791, 2.008011, 1.692118, 1, 1, 1, 1, 1,
1.25379, -0.2622357, 1.008689, 1, 1, 1, 1, 1,
1.256301, -1.522184, 3.707087, 1, 1, 1, 1, 1,
1.25827, 0.3741253, 0.667258, 1, 1, 1, 1, 1,
1.26256, -1.154132, 1.065383, 1, 1, 1, 1, 1,
1.264655, 1.328202, -0.1882746, 0, 0, 1, 1, 1,
1.283606, -0.7736278, 2.055904, 1, 0, 0, 1, 1,
1.285688, 0.3595158, 2.225003, 1, 0, 0, 1, 1,
1.287132, 0.755322, 0.2050643, 1, 0, 0, 1, 1,
1.292709, 1.522383, 1.385349, 1, 0, 0, 1, 1,
1.294903, 1.0357, 2.038332, 1, 0, 0, 1, 1,
1.301543, -1.307674, 1.570474, 0, 0, 0, 1, 1,
1.302244, 0.9944227, -1.1343, 0, 0, 0, 1, 1,
1.304916, 0.5672335, 1.748803, 0, 0, 0, 1, 1,
1.307706, -2.090941, 1.129678, 0, 0, 0, 1, 1,
1.31696, 0.1153924, 1.478702, 0, 0, 0, 1, 1,
1.318098, -0.4477484, 3.219045, 0, 0, 0, 1, 1,
1.32039, 2.648315, 1.60392, 0, 0, 0, 1, 1,
1.326422, 1.003062, -0.3125927, 1, 1, 1, 1, 1,
1.328194, 0.5525357, 1.112819, 1, 1, 1, 1, 1,
1.331228, 0.04147711, -0.3305399, 1, 1, 1, 1, 1,
1.332288, 0.09744584, 1.760139, 1, 1, 1, 1, 1,
1.337973, -0.9290583, 2.004751, 1, 1, 1, 1, 1,
1.343472, -0.3515494, -0.3480788, 1, 1, 1, 1, 1,
1.346125, -0.992804, 1.797437, 1, 1, 1, 1, 1,
1.35328, -0.3683901, 2.432288, 1, 1, 1, 1, 1,
1.361107, 0.3539017, 0.1562329, 1, 1, 1, 1, 1,
1.374125, 0.6383531, 0.812175, 1, 1, 1, 1, 1,
1.375011, 0.7285149, -0.2363347, 1, 1, 1, 1, 1,
1.378162, -2.317591, 4.269683, 1, 1, 1, 1, 1,
1.385595, -0.657376, 1.947752, 1, 1, 1, 1, 1,
1.395642, 0.6764829, 1.833303, 1, 1, 1, 1, 1,
1.398338, -1.204517, 2.50728, 1, 1, 1, 1, 1,
1.404505, -0.5488909, 3.512814, 0, 0, 1, 1, 1,
1.425185, 0.9214147, 1.061326, 1, 0, 0, 1, 1,
1.427656, 0.1031816, 3.464472, 1, 0, 0, 1, 1,
1.430389, -0.3422193, 2.550933, 1, 0, 0, 1, 1,
1.434486, -0.2143683, 4.882335, 1, 0, 0, 1, 1,
1.442122, -0.3588193, 0.2863164, 1, 0, 0, 1, 1,
1.444456, 1.376934, -0.3060687, 0, 0, 0, 1, 1,
1.450229, 0.7901663, -0.4528025, 0, 0, 0, 1, 1,
1.450533, -0.3727313, 0.900372, 0, 0, 0, 1, 1,
1.452523, 0.05596898, 3.259073, 0, 0, 0, 1, 1,
1.461267, 0.909428, 0.998538, 0, 0, 0, 1, 1,
1.461413, 0.3649608, 0.8856031, 0, 0, 0, 1, 1,
1.473335, -0.1087427, 3.569054, 0, 0, 0, 1, 1,
1.489901, -0.2347646, 1.535749, 1, 1, 1, 1, 1,
1.5175, -0.03924493, 1.88355, 1, 1, 1, 1, 1,
1.519665, -0.585463, 4.35963, 1, 1, 1, 1, 1,
1.529937, -0.3988734, 0.4052825, 1, 1, 1, 1, 1,
1.536711, 0.2703046, 0.6813611, 1, 1, 1, 1, 1,
1.542734, 1.303073, 2.177153, 1, 1, 1, 1, 1,
1.545299, 0.1082575, 1.146552, 1, 1, 1, 1, 1,
1.547056, 1.101553, 0.5375634, 1, 1, 1, 1, 1,
1.549105, 2.432221, -0.5189326, 1, 1, 1, 1, 1,
1.562135, 0.7282258, 1.194535, 1, 1, 1, 1, 1,
1.563692, 0.1705121, 2.190495, 1, 1, 1, 1, 1,
1.571106, -0.7039501, 1.690971, 1, 1, 1, 1, 1,
1.5758, 0.4305141, 1.392169, 1, 1, 1, 1, 1,
1.588711, -0.5694171, 1.512904, 1, 1, 1, 1, 1,
1.600773, -0.1895598, 2.395713, 1, 1, 1, 1, 1,
1.606755, -0.3495183, 1.43384, 0, 0, 1, 1, 1,
1.619115, -0.3844547, 2.853997, 1, 0, 0, 1, 1,
1.621315, 0.9691671, 0.361207, 1, 0, 0, 1, 1,
1.627364, -1.391496, 1.584528, 1, 0, 0, 1, 1,
1.628868, 1.514977, 1.911388, 1, 0, 0, 1, 1,
1.636354, -1.854974, 4.016769, 1, 0, 0, 1, 1,
1.642126, -2.21419, 2.492173, 0, 0, 0, 1, 1,
1.648834, -1.507528, 2.384051, 0, 0, 0, 1, 1,
1.65828, 0.9087219, 0.2921679, 0, 0, 0, 1, 1,
1.65988, 0.7833378, 1.694957, 0, 0, 0, 1, 1,
1.665149, -0.07716972, 2.403548, 0, 0, 0, 1, 1,
1.665583, -0.2288983, 0.04947532, 0, 0, 0, 1, 1,
1.668863, 0.08861545, 1.917071, 0, 0, 0, 1, 1,
1.673145, 0.4297575, -1.011971, 1, 1, 1, 1, 1,
1.710333, 0.03024976, 1.094391, 1, 1, 1, 1, 1,
1.711093, -0.6385592, 1.20462, 1, 1, 1, 1, 1,
1.7121, -0.01839385, 2.194464, 1, 1, 1, 1, 1,
1.719368, -0.4791239, 2.62307, 1, 1, 1, 1, 1,
1.760421, -0.962767, 2.845021, 1, 1, 1, 1, 1,
1.76609, 0.4879154, 0.8117878, 1, 1, 1, 1, 1,
1.767601, -0.4964622, 1.44172, 1, 1, 1, 1, 1,
1.781407, 0.04002219, 2.925048, 1, 1, 1, 1, 1,
1.788236, 0.5787476, 1.848929, 1, 1, 1, 1, 1,
1.805285, -1.535104, 2.258291, 1, 1, 1, 1, 1,
1.82144, -1.132399, 2.326268, 1, 1, 1, 1, 1,
1.834985, 2.101279, -0.184102, 1, 1, 1, 1, 1,
1.841558, -0.5705783, 1.280555, 1, 1, 1, 1, 1,
1.860862, 1.249511, 1.148915, 1, 1, 1, 1, 1,
1.901111, 0.5359325, 0.1577073, 0, 0, 1, 1, 1,
1.907126, 0.7535067, 3.292187, 1, 0, 0, 1, 1,
1.911002, 0.4810123, 0.8993704, 1, 0, 0, 1, 1,
1.920462, -0.4948869, 1.275911, 1, 0, 0, 1, 1,
2.017562, -1.102923, 3.888219, 1, 0, 0, 1, 1,
2.028551, 0.351526, 1.359007, 1, 0, 0, 1, 1,
2.028887, -0.5944712, 1.585493, 0, 0, 0, 1, 1,
2.11918, -0.7803745, 0.4867696, 0, 0, 0, 1, 1,
2.13189, 0.5635589, -0.3576488, 0, 0, 0, 1, 1,
2.215191, -0.7848957, 0.9500695, 0, 0, 0, 1, 1,
2.2406, 0.6313083, 1.721292, 0, 0, 0, 1, 1,
2.299606, -0.2110213, 0.8089522, 0, 0, 0, 1, 1,
2.307817, 0.6544714, 1.556036, 0, 0, 0, 1, 1,
2.345136, -0.3112525, 2.763258, 1, 1, 1, 1, 1,
2.364764, -0.3130961, 1.69016, 1, 1, 1, 1, 1,
2.478296, 1.301023, 2.519871, 1, 1, 1, 1, 1,
2.598768, 0.6920082, 1.843245, 1, 1, 1, 1, 1,
2.653175, 1.912296, 1.361666, 1, 1, 1, 1, 1,
2.660932, -0.2434813, 1.600104, 1, 1, 1, 1, 1,
3.082297, -0.3957296, 1.725493, 1, 1, 1, 1, 1
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
var radius = 10.12386;
var distance = 35.55963;
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
mvMatrix.translate( -0.1630887, -0.694392, -0.6177564 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.55963);
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
