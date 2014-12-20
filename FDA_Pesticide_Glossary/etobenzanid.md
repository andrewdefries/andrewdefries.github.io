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
-3.624435, 0.4748044, -1.738271, 1, 0, 0, 1,
-3.583394, 0.5638359, 0.3891136, 1, 0.007843138, 0, 1,
-3.368389, -0.2255124, -2.92448, 1, 0.01176471, 0, 1,
-2.921178, -0.3226121, -1.992671, 1, 0.01960784, 0, 1,
-2.901625, -0.9783381, -3.503554, 1, 0.02352941, 0, 1,
-2.699929, -0.06562878, -1.751088, 1, 0.03137255, 0, 1,
-2.679947, -0.8854683, -2.246165, 1, 0.03529412, 0, 1,
-2.664331, 1.043, -3.614502, 1, 0.04313726, 0, 1,
-2.575863, -1.095793, -2.562291, 1, 0.04705882, 0, 1,
-2.499068, -0.171533, -1.792435, 1, 0.05490196, 0, 1,
-2.498555, 0.02769902, -0.7687535, 1, 0.05882353, 0, 1,
-2.445889, -1.266989, -2.511433, 1, 0.06666667, 0, 1,
-2.405913, -1.189059, -1.226438, 1, 0.07058824, 0, 1,
-2.377542, -1.971588, -3.109304, 1, 0.07843138, 0, 1,
-2.367457, 0.988993, 0.09109871, 1, 0.08235294, 0, 1,
-2.327747, -0.6900671, -2.717267, 1, 0.09019608, 0, 1,
-2.287641, -0.2163386, -1.959275, 1, 0.09411765, 0, 1,
-2.213039, -0.8597231, -1.615063, 1, 0.1019608, 0, 1,
-2.211144, 1.452844, -0.1067194, 1, 0.1098039, 0, 1,
-2.181823, -0.05571709, -1.407394, 1, 0.1137255, 0, 1,
-2.180012, -2.226321, -0.3707623, 1, 0.1215686, 0, 1,
-2.172217, -0.2402934, -0.9088471, 1, 0.1254902, 0, 1,
-2.170551, 1.785582, 0.9778614, 1, 0.1333333, 0, 1,
-2.154053, -1.335365, -3.556428, 1, 0.1372549, 0, 1,
-2.152026, 0.1489588, -1.061184, 1, 0.145098, 0, 1,
-2.149178, 0.8564852, -0.1108186, 1, 0.1490196, 0, 1,
-2.113021, 1.10761, -3.204565, 1, 0.1568628, 0, 1,
-2.078808, -1.815261, -0.832924, 1, 0.1607843, 0, 1,
-2.06928, -0.4668925, -2.618124, 1, 0.1686275, 0, 1,
-2.05171, 0.3568609, -1.619409, 1, 0.172549, 0, 1,
-2.035412, 0.195758, 1.437004, 1, 0.1803922, 0, 1,
-2.033982, 0.004108524, -1.533297, 1, 0.1843137, 0, 1,
-1.998749, 0.7763255, -0.5090413, 1, 0.1921569, 0, 1,
-1.969434, 0.3879761, -2.225206, 1, 0.1960784, 0, 1,
-1.950956, -0.08049093, -1.092733, 1, 0.2039216, 0, 1,
-1.921847, 0.354082, -0.5077586, 1, 0.2117647, 0, 1,
-1.90812, -0.06900133, -2.006947, 1, 0.2156863, 0, 1,
-1.894992, -0.4290447, -2.189573, 1, 0.2235294, 0, 1,
-1.844574, -0.3606437, -2.124651, 1, 0.227451, 0, 1,
-1.84271, -1.354366, -3.093368, 1, 0.2352941, 0, 1,
-1.805629, 0.780589, -0.9562563, 1, 0.2392157, 0, 1,
-1.802195, -0.9765531, -1.08751, 1, 0.2470588, 0, 1,
-1.796492, 0.09467149, -2.223512, 1, 0.2509804, 0, 1,
-1.792215, 0.237544, -0.5259078, 1, 0.2588235, 0, 1,
-1.790378, 0.2443658, -1.219284, 1, 0.2627451, 0, 1,
-1.77137, 1.070781, -0.9402224, 1, 0.2705882, 0, 1,
-1.768003, -0.3570915, -1.804366, 1, 0.2745098, 0, 1,
-1.755242, -0.5454987, -1.572614, 1, 0.282353, 0, 1,
-1.712849, -0.1718109, -1.621654, 1, 0.2862745, 0, 1,
-1.711888, 1.293486, 0.6474282, 1, 0.2941177, 0, 1,
-1.707441, -0.3242096, -3.162521, 1, 0.3019608, 0, 1,
-1.704483, -1.196513, -3.296392, 1, 0.3058824, 0, 1,
-1.702193, 0.6087757, -2.665259, 1, 0.3137255, 0, 1,
-1.687377, 0.4750185, -1.362134, 1, 0.3176471, 0, 1,
-1.666033, 0.7911514, -1.524474, 1, 0.3254902, 0, 1,
-1.659467, 0.09781116, -2.595679, 1, 0.3294118, 0, 1,
-1.65005, 0.4951129, -2.231422, 1, 0.3372549, 0, 1,
-1.632874, -0.3183537, -2.913997, 1, 0.3411765, 0, 1,
-1.619172, -0.2269133, -2.223769, 1, 0.3490196, 0, 1,
-1.614574, 0.5890619, 0.2384257, 1, 0.3529412, 0, 1,
-1.612373, -1.29918, 0.1451232, 1, 0.3607843, 0, 1,
-1.605964, -0.6158842, -1.403702, 1, 0.3647059, 0, 1,
-1.561554, 0.2367496, 0.777603, 1, 0.372549, 0, 1,
-1.556244, -0.9991695, -1.119279, 1, 0.3764706, 0, 1,
-1.53841, 2.837898, -0.6956649, 1, 0.3843137, 0, 1,
-1.528339, 0.1761755, -1.671684, 1, 0.3882353, 0, 1,
-1.52184, 0.3081408, 1.733658, 1, 0.3960784, 0, 1,
-1.499839, -0.295849, -2.282181, 1, 0.4039216, 0, 1,
-1.475037, 0.616848, -0.8485047, 1, 0.4078431, 0, 1,
-1.473876, -0.6983252, -3.093212, 1, 0.4156863, 0, 1,
-1.460901, -0.8059986, -1.136094, 1, 0.4196078, 0, 1,
-1.454148, 0.6577853, -2.217623, 1, 0.427451, 0, 1,
-1.449511, 0.8953655, -0.8944379, 1, 0.4313726, 0, 1,
-1.441618, -0.1588632, -2.007796, 1, 0.4392157, 0, 1,
-1.440011, -0.07170017, -1.619337, 1, 0.4431373, 0, 1,
-1.431742, -0.1065841, -0.5320868, 1, 0.4509804, 0, 1,
-1.403878, 1.355073, -0.04464572, 1, 0.454902, 0, 1,
-1.402215, -0.3913741, -0.9030285, 1, 0.4627451, 0, 1,
-1.394793, -1.586802, -0.7890809, 1, 0.4666667, 0, 1,
-1.389701, -0.7402567, -2.392926, 1, 0.4745098, 0, 1,
-1.384556, -0.4064412, -1.676047, 1, 0.4784314, 0, 1,
-1.3827, -2.260479, -1.80335, 1, 0.4862745, 0, 1,
-1.376595, 1.798322, -1.739988, 1, 0.4901961, 0, 1,
-1.35511, 0.663458, -2.389335, 1, 0.4980392, 0, 1,
-1.348643, -0.4583239, -1.801414, 1, 0.5058824, 0, 1,
-1.345075, -0.4257711, -1.422214, 1, 0.509804, 0, 1,
-1.331874, 1.074265, 0.3906862, 1, 0.5176471, 0, 1,
-1.322255, -1.245089, -2.589968, 1, 0.5215687, 0, 1,
-1.321844, -0.6986251, -2.068141, 1, 0.5294118, 0, 1,
-1.310812, 0.3431426, -3.259061, 1, 0.5333334, 0, 1,
-1.304793, 0.6545725, -1.098433, 1, 0.5411765, 0, 1,
-1.30254, 1.381553, -0.05658733, 1, 0.5450981, 0, 1,
-1.300476, 0.08298068, -0.9081504, 1, 0.5529412, 0, 1,
-1.293103, -0.5478727, -2.51053, 1, 0.5568628, 0, 1,
-1.281511, -1.307686, -3.595432, 1, 0.5647059, 0, 1,
-1.279346, 0.5013662, -1.434082, 1, 0.5686275, 0, 1,
-1.268134, -0.1614635, -0.663974, 1, 0.5764706, 0, 1,
-1.260516, -2.420658, -1.635325, 1, 0.5803922, 0, 1,
-1.257121, -1.884284, -1.672891, 1, 0.5882353, 0, 1,
-1.251032, 1.40994, -1.209263, 1, 0.5921569, 0, 1,
-1.245695, 0.9075028, -1.307083, 1, 0.6, 0, 1,
-1.244992, -0.3660218, -2.338809, 1, 0.6078432, 0, 1,
-1.244192, -0.9313897, -2.512913, 1, 0.6117647, 0, 1,
-1.238821, 0.6980394, -1.787082, 1, 0.6196079, 0, 1,
-1.235437, -0.9408228, -4.081005, 1, 0.6235294, 0, 1,
-1.226433, 0.9173428, -2.534226, 1, 0.6313726, 0, 1,
-1.22307, -1.319808, -1.795092, 1, 0.6352941, 0, 1,
-1.222147, -0.2518252, 0.1582432, 1, 0.6431373, 0, 1,
-1.220897, 0.4471943, -2.063653, 1, 0.6470588, 0, 1,
-1.21647, -2.007652, -2.845895, 1, 0.654902, 0, 1,
-1.213688, -0.1412928, -2.571699, 1, 0.6588235, 0, 1,
-1.20831, 1.515092, 0.719932, 1, 0.6666667, 0, 1,
-1.205093, -0.6007138, -1.138943, 1, 0.6705883, 0, 1,
-1.203897, 0.4906216, -1.897182, 1, 0.6784314, 0, 1,
-1.196422, -0.6135101, -2.902258, 1, 0.682353, 0, 1,
-1.195774, 0.551319, -0.2591277, 1, 0.6901961, 0, 1,
-1.190601, 0.5661705, -0.8296977, 1, 0.6941177, 0, 1,
-1.180474, 1.132347, -0.09630534, 1, 0.7019608, 0, 1,
-1.161116, -0.004212015, -1.111356, 1, 0.7098039, 0, 1,
-1.138725, 0.8051347, -2.144571, 1, 0.7137255, 0, 1,
-1.116818, -0.8965194, -2.55376, 1, 0.7215686, 0, 1,
-1.110201, 0.4263719, -3.005255, 1, 0.7254902, 0, 1,
-1.108609, -0.7972825, -3.359385, 1, 0.7333333, 0, 1,
-1.101069, -2.489473, -2.413354, 1, 0.7372549, 0, 1,
-1.091453, 0.4136379, -1.766143, 1, 0.7450981, 0, 1,
-1.087716, 0.1963524, 0.2998257, 1, 0.7490196, 0, 1,
-1.086816, 0.2822133, -0.6420152, 1, 0.7568628, 0, 1,
-1.08676, 0.1299886, -1.95211, 1, 0.7607843, 0, 1,
-1.076177, -1.232203, -3.397848, 1, 0.7686275, 0, 1,
-1.069307, -1.155679, -1.260126, 1, 0.772549, 0, 1,
-1.066636, -2.985516, -2.444545, 1, 0.7803922, 0, 1,
-1.066109, -0.5985243, -0.5486854, 1, 0.7843137, 0, 1,
-1.065869, -1.368073, -1.875921, 1, 0.7921569, 0, 1,
-1.063639, -0.3468771, -0.8283797, 1, 0.7960784, 0, 1,
-1.062222, 0.9579462, -2.383544, 1, 0.8039216, 0, 1,
-1.060267, -1.256737, -1.637649, 1, 0.8117647, 0, 1,
-1.050377, 0.7012126, -0.588075, 1, 0.8156863, 0, 1,
-1.049023, 0.8845899, -1.840188, 1, 0.8235294, 0, 1,
-1.048535, -0.54665, -1.509183, 1, 0.827451, 0, 1,
-1.042755, -0.1288067, -1.600043, 1, 0.8352941, 0, 1,
-1.034364, -0.5763438, -0.8644449, 1, 0.8392157, 0, 1,
-1.032507, 0.1921939, -2.061785, 1, 0.8470588, 0, 1,
-1.031492, -0.5647839, -1.743021, 1, 0.8509804, 0, 1,
-1.031468, -0.5317516, -0.8755401, 1, 0.8588235, 0, 1,
-1.028721, 1.773324, 0.2425001, 1, 0.8627451, 0, 1,
-1.021306, -0.005291277, -1.279089, 1, 0.8705882, 0, 1,
-1.019602, 0.3947116, -0.2565229, 1, 0.8745098, 0, 1,
-1.019147, -1.070058, -2.208869, 1, 0.8823529, 0, 1,
-1.015926, 0.2850328, -0.2648316, 1, 0.8862745, 0, 1,
-1.012756, -0.1608746, -3.614498, 1, 0.8941177, 0, 1,
-0.9958506, 2.053298, -0.4930902, 1, 0.8980392, 0, 1,
-0.9842063, 0.4641114, -1.591894, 1, 0.9058824, 0, 1,
-0.9835529, -1.237852, -3.35816, 1, 0.9137255, 0, 1,
-0.9830005, 0.1104911, 0.1350599, 1, 0.9176471, 0, 1,
-0.9813395, -0.4865173, -3.092058, 1, 0.9254902, 0, 1,
-0.9796188, 0.1308209, -2.891859, 1, 0.9294118, 0, 1,
-0.9739919, -2.083557, -1.314568, 1, 0.9372549, 0, 1,
-0.9735867, -0.4475816, -1.490719, 1, 0.9411765, 0, 1,
-0.9577019, 0.1135443, 0.002512433, 1, 0.9490196, 0, 1,
-0.9551505, -0.3731856, -4.014288, 1, 0.9529412, 0, 1,
-0.9536511, -1.311062, -4.500105, 1, 0.9607843, 0, 1,
-0.9528659, -0.941345, -3.204891, 1, 0.9647059, 0, 1,
-0.9488068, -0.3686738, -1.690853, 1, 0.972549, 0, 1,
-0.9448111, 1.302639, -1.196393, 1, 0.9764706, 0, 1,
-0.9447623, 0.3235377, -3.083793, 1, 0.9843137, 0, 1,
-0.9440013, -0.1623802, -3.324866, 1, 0.9882353, 0, 1,
-0.939675, -1.167688, -1.931585, 1, 0.9960784, 0, 1,
-0.9386386, -0.5868208, -3.634474, 0.9960784, 1, 0, 1,
-0.9334806, -1.471522, -2.380136, 0.9921569, 1, 0, 1,
-0.9315647, 1.88016, 0.3675377, 0.9843137, 1, 0, 1,
-0.9266908, -0.5067074, -0.6393152, 0.9803922, 1, 0, 1,
-0.9246311, -0.03755379, -0.9451326, 0.972549, 1, 0, 1,
-0.9232366, 1.064618, -0.4817722, 0.9686275, 1, 0, 1,
-0.9225502, 0.700139, -1.370389, 0.9607843, 1, 0, 1,
-0.9140884, -0.2510272, -1.495228, 0.9568627, 1, 0, 1,
-0.9088925, 0.8522555, -1.504591, 0.9490196, 1, 0, 1,
-0.8967237, -0.2478948, -2.910163, 0.945098, 1, 0, 1,
-0.8899487, 0.1294962, -1.097633, 0.9372549, 1, 0, 1,
-0.8891839, -1.890818, -3.723084, 0.9333333, 1, 0, 1,
-0.8840528, -0.5123237, -2.191959, 0.9254902, 1, 0, 1,
-0.8799043, -1.109697, -3.325064, 0.9215686, 1, 0, 1,
-0.8778243, 1.257212, -0.5585304, 0.9137255, 1, 0, 1,
-0.8769243, 0.2410495, -0.9388173, 0.9098039, 1, 0, 1,
-0.87257, -0.06950675, -1.326397, 0.9019608, 1, 0, 1,
-0.8699831, 0.4766717, -0.382845, 0.8941177, 1, 0, 1,
-0.8689683, -1.167464, -2.07762, 0.8901961, 1, 0, 1,
-0.8606378, -3.196169, -2.702118, 0.8823529, 1, 0, 1,
-0.8575988, 1.5738, 0.2083094, 0.8784314, 1, 0, 1,
-0.8502288, 1.269097, -1.896577, 0.8705882, 1, 0, 1,
-0.8499072, -1.15437, -3.490226, 0.8666667, 1, 0, 1,
-0.8493015, -0.7471297, -3.453616, 0.8588235, 1, 0, 1,
-0.8490016, 0.1541487, 0.7185269, 0.854902, 1, 0, 1,
-0.8447869, -0.3657934, -2.387969, 0.8470588, 1, 0, 1,
-0.8445573, 1.037009, -0.3295862, 0.8431373, 1, 0, 1,
-0.8444952, -0.5816028, -2.311096, 0.8352941, 1, 0, 1,
-0.8430255, 0.5710401, -3.115808, 0.8313726, 1, 0, 1,
-0.8392237, 0.5461846, 0.2920358, 0.8235294, 1, 0, 1,
-0.8238853, -0.11752, -0.2778954, 0.8196079, 1, 0, 1,
-0.8149976, -1.535773, -3.156398, 0.8117647, 1, 0, 1,
-0.808662, 0.08870099, -0.9326327, 0.8078431, 1, 0, 1,
-0.8079481, -0.758391, -2.650413, 0.8, 1, 0, 1,
-0.7994922, 1.303468, -0.8406581, 0.7921569, 1, 0, 1,
-0.7983064, -0.6127625, -1.349671, 0.7882353, 1, 0, 1,
-0.7942847, 1.660704, -0.4653347, 0.7803922, 1, 0, 1,
-0.7935888, -0.4038514, -1.952496, 0.7764706, 1, 0, 1,
-0.7933839, 0.209867, 1.150471, 0.7686275, 1, 0, 1,
-0.7929651, 1.37245, 0.6894079, 0.7647059, 1, 0, 1,
-0.7920588, 0.6927289, -0.259635, 0.7568628, 1, 0, 1,
-0.7912794, 0.07765973, -0.9008377, 0.7529412, 1, 0, 1,
-0.7884891, 0.706898, -1.325396, 0.7450981, 1, 0, 1,
-0.7882487, -0.968007, -3.819676, 0.7411765, 1, 0, 1,
-0.7874889, 1.513438, -0.5786048, 0.7333333, 1, 0, 1,
-0.7857348, -0.492975, -2.940841, 0.7294118, 1, 0, 1,
-0.7797434, -0.8163465, -2.882229, 0.7215686, 1, 0, 1,
-0.7789111, 0.08729011, -0.7274861, 0.7176471, 1, 0, 1,
-0.7787633, 0.1210568, -0.7143027, 0.7098039, 1, 0, 1,
-0.7754906, -0.3757825, -2.021621, 0.7058824, 1, 0, 1,
-0.7637818, -0.177308, -2.763756, 0.6980392, 1, 0, 1,
-0.7629306, 0.2716658, -0.1291424, 0.6901961, 1, 0, 1,
-0.7470289, 1.503018, -0.3701586, 0.6862745, 1, 0, 1,
-0.7468967, -0.5401835, -2.941481, 0.6784314, 1, 0, 1,
-0.744557, -0.2817768, -3.615028, 0.6745098, 1, 0, 1,
-0.7443536, 0.7971311, -0.4318759, 0.6666667, 1, 0, 1,
-0.7397412, 0.4392647, -0.08235201, 0.6627451, 1, 0, 1,
-0.7393817, 0.5146403, 1.006859, 0.654902, 1, 0, 1,
-0.7349861, -0.7889057, -4.982309, 0.6509804, 1, 0, 1,
-0.7337464, 0.7114275, -0.420357, 0.6431373, 1, 0, 1,
-0.7284129, -0.5946882, -2.361246, 0.6392157, 1, 0, 1,
-0.7238669, 1.747077, -2.242535, 0.6313726, 1, 0, 1,
-0.7220986, 1.729703, 0.1798308, 0.627451, 1, 0, 1,
-0.7208745, 0.3831216, -1.384923, 0.6196079, 1, 0, 1,
-0.7172735, 0.6846514, -0.8732976, 0.6156863, 1, 0, 1,
-0.7152496, -0.2994198, -0.8299026, 0.6078432, 1, 0, 1,
-0.713249, 0.6309708, -2.038675, 0.6039216, 1, 0, 1,
-0.7016336, 0.6979211, -1.884267, 0.5960785, 1, 0, 1,
-0.6997157, 1.564987, -0.3951547, 0.5882353, 1, 0, 1,
-0.6951005, -0.9262803, -2.840489, 0.5843138, 1, 0, 1,
-0.6946875, 0.9955564, -2.261558, 0.5764706, 1, 0, 1,
-0.6899624, -1.243783, -2.450708, 0.572549, 1, 0, 1,
-0.6898608, 1.452848, -1.817295, 0.5647059, 1, 0, 1,
-0.6880637, -0.6632906, -0.4602365, 0.5607843, 1, 0, 1,
-0.6834437, 0.379005, -0.8133293, 0.5529412, 1, 0, 1,
-0.6791903, -0.03777582, -1.758421, 0.5490196, 1, 0, 1,
-0.6790811, 1.124353, 0.1211004, 0.5411765, 1, 0, 1,
-0.6780263, -1.758871, -2.009598, 0.5372549, 1, 0, 1,
-0.6774343, -0.1126084, -0.2057536, 0.5294118, 1, 0, 1,
-0.6767486, -2.251415, -3.486871, 0.5254902, 1, 0, 1,
-0.669903, -2.189661, -2.508848, 0.5176471, 1, 0, 1,
-0.6696615, -1.115434, -1.054222, 0.5137255, 1, 0, 1,
-0.6642529, 0.02191388, -0.1072471, 0.5058824, 1, 0, 1,
-0.6614926, -0.2435295, -0.9339677, 0.5019608, 1, 0, 1,
-0.6611497, 0.7734219, -0.7009114, 0.4941176, 1, 0, 1,
-0.6592388, -3.413143, -1.709627, 0.4862745, 1, 0, 1,
-0.6547353, 0.700757, -0.4747434, 0.4823529, 1, 0, 1,
-0.6543006, 1.347631, 0.1996006, 0.4745098, 1, 0, 1,
-0.6480468, -0.8606189, -4.815217, 0.4705882, 1, 0, 1,
-0.6414976, 0.4033361, -0.9379122, 0.4627451, 1, 0, 1,
-0.6406403, -0.2029636, -1.326018, 0.4588235, 1, 0, 1,
-0.6305183, 0.9762352, 2.229098, 0.4509804, 1, 0, 1,
-0.6231316, 0.1829087, -0.8082749, 0.4470588, 1, 0, 1,
-0.6142417, 0.7156203, -1.411316, 0.4392157, 1, 0, 1,
-0.6139812, -0.6433308, -2.901889, 0.4352941, 1, 0, 1,
-0.6118721, -0.3138893, -2.012962, 0.427451, 1, 0, 1,
-0.6085923, 0.6189339, -0.5001942, 0.4235294, 1, 0, 1,
-0.6044234, -0.1275242, -1.200302, 0.4156863, 1, 0, 1,
-0.603745, 3.593621, 0.5681156, 0.4117647, 1, 0, 1,
-0.6016557, 0.8353806, -1.964181, 0.4039216, 1, 0, 1,
-0.6008231, -1.724686, -2.490762, 0.3960784, 1, 0, 1,
-0.6001678, -0.97321, -0.992723, 0.3921569, 1, 0, 1,
-0.5974788, 0.926052, -1.384552, 0.3843137, 1, 0, 1,
-0.5971837, 0.9201621, -0.9705649, 0.3803922, 1, 0, 1,
-0.5961411, -0.6628617, -2.650209, 0.372549, 1, 0, 1,
-0.5918377, 0.3819625, 0.8878055, 0.3686275, 1, 0, 1,
-0.5897502, 0.1400856, -2.088549, 0.3607843, 1, 0, 1,
-0.5896616, 1.252427, -2.347831, 0.3568628, 1, 0, 1,
-0.5843857, 0.3295112, -0.1097099, 0.3490196, 1, 0, 1,
-0.5801019, -0.5998585, -2.669116, 0.345098, 1, 0, 1,
-0.5794143, 2.106375, -0.003077149, 0.3372549, 1, 0, 1,
-0.5780141, 0.6124551, -0.7491341, 0.3333333, 1, 0, 1,
-0.5756059, -0.2941369, -1.868372, 0.3254902, 1, 0, 1,
-0.5740248, 0.3490122, -2.336512, 0.3215686, 1, 0, 1,
-0.5710955, -1.640138, -1.884456, 0.3137255, 1, 0, 1,
-0.5708532, -0.08860248, -0.5005445, 0.3098039, 1, 0, 1,
-0.5701846, -1.468252, -3.649349, 0.3019608, 1, 0, 1,
-0.5646539, 1.749037, 0.4790314, 0.2941177, 1, 0, 1,
-0.5609168, 1.273577, 0.5264159, 0.2901961, 1, 0, 1,
-0.5552595, 2.069364, 0.6145376, 0.282353, 1, 0, 1,
-0.5541893, 0.1020485, -2.793367, 0.2784314, 1, 0, 1,
-0.5534567, -0.9952853, -2.293005, 0.2705882, 1, 0, 1,
-0.5523536, 1.833857, 0.08747549, 0.2666667, 1, 0, 1,
-0.5481324, -1.459856, -1.686718, 0.2588235, 1, 0, 1,
-0.5434775, 1.122214, -2.42657, 0.254902, 1, 0, 1,
-0.5410714, -0.4711261, -0.07330637, 0.2470588, 1, 0, 1,
-0.5358124, 0.9689853, -0.8464132, 0.2431373, 1, 0, 1,
-0.5321549, 1.290718, -1.082551, 0.2352941, 1, 0, 1,
-0.5302199, -0.5741131, -1.910602, 0.2313726, 1, 0, 1,
-0.5294362, -0.2149757, -1.874943, 0.2235294, 1, 0, 1,
-0.5260198, 1.123472, -1.278128, 0.2196078, 1, 0, 1,
-0.5185994, 0.6822541, 0.04506963, 0.2117647, 1, 0, 1,
-0.5154355, 0.8649144, -2.199584, 0.2078431, 1, 0, 1,
-0.5131038, -0.6512999, -3.604857, 0.2, 1, 0, 1,
-0.5118209, -1.320608, -3.163008, 0.1921569, 1, 0, 1,
-0.504954, 0.9629271, -0.8158884, 0.1882353, 1, 0, 1,
-0.4985619, 0.005766094, -1.320611, 0.1803922, 1, 0, 1,
-0.4953691, 0.2987741, -3.831469, 0.1764706, 1, 0, 1,
-0.4938369, 1.045785, -0.3745082, 0.1686275, 1, 0, 1,
-0.4935791, 0.3203844, -0.2180556, 0.1647059, 1, 0, 1,
-0.4823208, -1.431265, -1.9055, 0.1568628, 1, 0, 1,
-0.4777803, -0.1162661, -1.729328, 0.1529412, 1, 0, 1,
-0.47565, -1.321432, -3.124445, 0.145098, 1, 0, 1,
-0.4716479, -1.232039, -2.827903, 0.1411765, 1, 0, 1,
-0.4709053, -0.4592879, -3.545888, 0.1333333, 1, 0, 1,
-0.4690664, -0.7061424, -3.585875, 0.1294118, 1, 0, 1,
-0.4689997, 1.566426, 1.104694, 0.1215686, 1, 0, 1,
-0.4656435, 0.3482583, -2.215, 0.1176471, 1, 0, 1,
-0.4643241, -0.9082627, -3.44081, 0.1098039, 1, 0, 1,
-0.4617945, 0.4000387, 0.406312, 0.1058824, 1, 0, 1,
-0.4584377, -1.587445, -1.892499, 0.09803922, 1, 0, 1,
-0.4516389, 1.566551, -1.128735, 0.09019608, 1, 0, 1,
-0.4497812, -0.6441603, -3.76661, 0.08627451, 1, 0, 1,
-0.4453546, -0.5294749, -1.503043, 0.07843138, 1, 0, 1,
-0.4438209, 0.0241726, -2.967369, 0.07450981, 1, 0, 1,
-0.4409449, -2.171033, -3.07444, 0.06666667, 1, 0, 1,
-0.4402494, -0.2331271, -0.9858844, 0.0627451, 1, 0, 1,
-0.4382824, -0.4551249, -3.270155, 0.05490196, 1, 0, 1,
-0.434031, -0.07755372, -0.8796358, 0.05098039, 1, 0, 1,
-0.4338008, 0.2756226, -1.015227, 0.04313726, 1, 0, 1,
-0.4323118, -0.9334232, -2.545212, 0.03921569, 1, 0, 1,
-0.4304336, 0.347747, 0.2379905, 0.03137255, 1, 0, 1,
-0.4303859, -0.1509916, -1.405074, 0.02745098, 1, 0, 1,
-0.4279694, -0.8163001, -4.4663, 0.01960784, 1, 0, 1,
-0.4229324, 0.6077291, -1.360459, 0.01568628, 1, 0, 1,
-0.417878, -1.407408, -2.399499, 0.007843138, 1, 0, 1,
-0.4157464, -0.3384895, -2.995134, 0.003921569, 1, 0, 1,
-0.4130451, 0.1249259, -0.09136575, 0, 1, 0.003921569, 1,
-0.4118314, -1.085828, -0.3707731, 0, 1, 0.01176471, 1,
-0.4086021, -0.05907109, -1.651586, 0, 1, 0.01568628, 1,
-0.4079827, 0.4872376, -1.774331, 0, 1, 0.02352941, 1,
-0.4073553, 0.2678629, -0.7758159, 0, 1, 0.02745098, 1,
-0.4058188, 0.2998227, -0.8909438, 0, 1, 0.03529412, 1,
-0.3981962, -0.8759893, -2.884072, 0, 1, 0.03921569, 1,
-0.3912212, 0.3418422, -0.7806683, 0, 1, 0.04705882, 1,
-0.3911815, -0.5598828, -0.6406837, 0, 1, 0.05098039, 1,
-0.3872393, -2.427156, -2.138932, 0, 1, 0.05882353, 1,
-0.3858937, -0.1776114, -2.556984, 0, 1, 0.0627451, 1,
-0.3841195, 0.314022, -3.039516, 0, 1, 0.07058824, 1,
-0.3840837, -1.341544, -4.546956, 0, 1, 0.07450981, 1,
-0.3818463, -1.341407, -2.227169, 0, 1, 0.08235294, 1,
-0.3793708, -1.398446, -2.5248, 0, 1, 0.08627451, 1,
-0.3788647, -0.6525702, -2.584278, 0, 1, 0.09411765, 1,
-0.3774584, -0.1749364, -1.798476, 0, 1, 0.1019608, 1,
-0.3747207, 1.634442, -0.366827, 0, 1, 0.1058824, 1,
-0.3745591, 0.3301518, 0.8704763, 0, 1, 0.1137255, 1,
-0.373542, 0.3215437, -0.1453626, 0, 1, 0.1176471, 1,
-0.3700151, -1.071437, -2.622955, 0, 1, 0.1254902, 1,
-0.3686744, -0.3083196, -3.106794, 0, 1, 0.1294118, 1,
-0.3649837, -0.3415939, -1.403783, 0, 1, 0.1372549, 1,
-0.3633127, 0.7539679, 0.5714204, 0, 1, 0.1411765, 1,
-0.3618648, 0.5075003, -3.602122, 0, 1, 0.1490196, 1,
-0.354285, -1.525977, -3.070603, 0, 1, 0.1529412, 1,
-0.3530294, -0.7189406, -2.099418, 0, 1, 0.1607843, 1,
-0.3490016, -0.160727, -2.138521, 0, 1, 0.1647059, 1,
-0.3480671, 1.525087, -1.857047, 0, 1, 0.172549, 1,
-0.3425202, 0.9737329, -0.3231541, 0, 1, 0.1764706, 1,
-0.3380634, -0.01551127, -1.601639, 0, 1, 0.1843137, 1,
-0.3378983, 1.638826, 0.7201092, 0, 1, 0.1882353, 1,
-0.336458, -0.03156292, -1.096781, 0, 1, 0.1960784, 1,
-0.3342527, 0.06919096, -3.15869, 0, 1, 0.2039216, 1,
-0.3280217, 0.3367998, -0.5644137, 0, 1, 0.2078431, 1,
-0.3182236, 0.546711, -0.2284391, 0, 1, 0.2156863, 1,
-0.3170169, 1.125018, -0.1655785, 0, 1, 0.2196078, 1,
-0.3155792, 0.9388347, -0.3601043, 0, 1, 0.227451, 1,
-0.3133353, -0.1467146, -1.79625, 0, 1, 0.2313726, 1,
-0.3087775, 0.2880351, -1.452531, 0, 1, 0.2392157, 1,
-0.3074804, 1.934966, -0.3189753, 0, 1, 0.2431373, 1,
-0.3068462, -2.137647, -4.0532, 0, 1, 0.2509804, 1,
-0.3057186, 0.4679227, 0.9750272, 0, 1, 0.254902, 1,
-0.3044322, -3.002715, -2.664561, 0, 1, 0.2627451, 1,
-0.302946, 0.7060022, -0.9995458, 0, 1, 0.2666667, 1,
-0.3020905, 0.4174521, -1.364604, 0, 1, 0.2745098, 1,
-0.2931549, -1.075739, -2.766691, 0, 1, 0.2784314, 1,
-0.2840906, 0.8024483, -0.3319538, 0, 1, 0.2862745, 1,
-0.2795388, 1.469231, -2.256321, 0, 1, 0.2901961, 1,
-0.2777847, 0.6049606, -2.779892, 0, 1, 0.2980392, 1,
-0.2767521, -0.9103427, -2.848278, 0, 1, 0.3058824, 1,
-0.2751555, -1.622172, -1.830693, 0, 1, 0.3098039, 1,
-0.2746179, -0.8241329, -4.2932, 0, 1, 0.3176471, 1,
-0.2677945, -0.1773527, -2.175314, 0, 1, 0.3215686, 1,
-0.2610644, -0.9741422, -4.698159, 0, 1, 0.3294118, 1,
-0.2553355, -1.308906, -2.43713, 0, 1, 0.3333333, 1,
-0.2538105, 0.4730254, -0.7898753, 0, 1, 0.3411765, 1,
-0.253437, 0.9396854, -1.037261, 0, 1, 0.345098, 1,
-0.2509111, 0.580235, 0.1308492, 0, 1, 0.3529412, 1,
-0.2453903, -1.714646, -2.630509, 0, 1, 0.3568628, 1,
-0.242503, -0.6437517, -2.201163, 0, 1, 0.3647059, 1,
-0.2424336, -0.9640731, -3.57226, 0, 1, 0.3686275, 1,
-0.2391595, 0.7530583, -0.9012381, 0, 1, 0.3764706, 1,
-0.2356011, 0.390938, 0.2380514, 0, 1, 0.3803922, 1,
-0.2348593, -0.989972, -3.285819, 0, 1, 0.3882353, 1,
-0.228718, -0.3208107, -3.975025, 0, 1, 0.3921569, 1,
-0.2263725, -0.7336375, -3.623312, 0, 1, 0.4, 1,
-0.2259508, -0.01810941, -1.382081, 0, 1, 0.4078431, 1,
-0.2246532, -0.8336014, -3.320935, 0, 1, 0.4117647, 1,
-0.2244079, -0.4796024, -2.698687, 0, 1, 0.4196078, 1,
-0.221679, -0.3801951, -1.215836, 0, 1, 0.4235294, 1,
-0.2193982, -1.06924, -1.847356, 0, 1, 0.4313726, 1,
-0.2168165, -0.9572326, -1.04467, 0, 1, 0.4352941, 1,
-0.214757, 0.9432876, 0.5358378, 0, 1, 0.4431373, 1,
-0.2125895, -0.499425, -5.198133, 0, 1, 0.4470588, 1,
-0.2073667, -0.4523147, -3.249736, 0, 1, 0.454902, 1,
-0.2002676, 1.303366, -0.02300406, 0, 1, 0.4588235, 1,
-0.1971686, -1.500044, -1.932286, 0, 1, 0.4666667, 1,
-0.1964077, 0.4932182, 0.2675394, 0, 1, 0.4705882, 1,
-0.1956258, 0.5573819, -1.515192, 0, 1, 0.4784314, 1,
-0.1938417, 1.299473, 1.855354, 0, 1, 0.4823529, 1,
-0.182775, 1.342561, -1.723204, 0, 1, 0.4901961, 1,
-0.1820207, 0.7720631, 1.413392, 0, 1, 0.4941176, 1,
-0.1793782, 1.109754, -0.6406454, 0, 1, 0.5019608, 1,
-0.1778226, -1.234805, -3.539255, 0, 1, 0.509804, 1,
-0.1752931, -1.515867, -4.056329, 0, 1, 0.5137255, 1,
-0.175071, 0.1258827, 0.2756802, 0, 1, 0.5215687, 1,
-0.1696409, -1.174601, -3.339911, 0, 1, 0.5254902, 1,
-0.1687109, 0.4537883, -0.9183663, 0, 1, 0.5333334, 1,
-0.1672281, -0.4378188, -3.908572, 0, 1, 0.5372549, 1,
-0.1637311, -1.155123, -5.010719, 0, 1, 0.5450981, 1,
-0.1629321, 0.9343932, 0.285758, 0, 1, 0.5490196, 1,
-0.1574955, 1.420471, 0.6392296, 0, 1, 0.5568628, 1,
-0.1550193, -0.5766469, -3.667937, 0, 1, 0.5607843, 1,
-0.1541158, 0.5306769, 0.1846729, 0, 1, 0.5686275, 1,
-0.1533699, -0.9364997, -2.190922, 0, 1, 0.572549, 1,
-0.1533484, 0.1400681, -1.738288, 0, 1, 0.5803922, 1,
-0.1511004, -0.9154313, -1.925763, 0, 1, 0.5843138, 1,
-0.1509428, -0.06586529, -5.328697, 0, 1, 0.5921569, 1,
-0.1499738, 2.953372, 0.05394914, 0, 1, 0.5960785, 1,
-0.1474832, 0.82443, -0.186094, 0, 1, 0.6039216, 1,
-0.1457961, -0.6025195, -4.347372, 0, 1, 0.6117647, 1,
-0.1429905, 0.4478592, 0.9497859, 0, 1, 0.6156863, 1,
-0.142574, -0.9648474, -4.022548, 0, 1, 0.6235294, 1,
-0.1423869, -1.557733, -4.162614, 0, 1, 0.627451, 1,
-0.1392611, -0.6693333, -3.166701, 0, 1, 0.6352941, 1,
-0.1389394, -0.3519194, -2.788124, 0, 1, 0.6392157, 1,
-0.1352362, 0.9393034, -0.09701452, 0, 1, 0.6470588, 1,
-0.1325953, 0.3157621, -0.237471, 0, 1, 0.6509804, 1,
-0.1289947, 0.8872902, 1.913043, 0, 1, 0.6588235, 1,
-0.1252022, -1.158318, -2.819072, 0, 1, 0.6627451, 1,
-0.1118759, -0.5873731, -2.991874, 0, 1, 0.6705883, 1,
-0.1091611, -0.03459958, 0.4843162, 0, 1, 0.6745098, 1,
-0.1047223, 1.535585, 0.9703444, 0, 1, 0.682353, 1,
-0.1040702, 0.8064534, -1.406111, 0, 1, 0.6862745, 1,
-0.1037751, -0.6392908, -3.763938, 0, 1, 0.6941177, 1,
-0.103511, 0.3542918, -1.315972, 0, 1, 0.7019608, 1,
-0.1020439, 0.1512814, -0.253171, 0, 1, 0.7058824, 1,
-0.09627013, -0.9122044, -0.7623453, 0, 1, 0.7137255, 1,
-0.09319157, 1.722196, 1.111095, 0, 1, 0.7176471, 1,
-0.0915387, 0.9501023, 0.6005699, 0, 1, 0.7254902, 1,
-0.09026733, 1.599058, 0.1202971, 0, 1, 0.7294118, 1,
-0.08945244, 2.045255, 0.2950464, 0, 1, 0.7372549, 1,
-0.08838111, -0.9624119, -2.628385, 0, 1, 0.7411765, 1,
-0.08810937, -0.4944126, -2.547153, 0, 1, 0.7490196, 1,
-0.08596556, 0.8222293, 1.061096, 0, 1, 0.7529412, 1,
-0.08531284, 0.7459179, -0.3850342, 0, 1, 0.7607843, 1,
-0.08254103, -0.5103446, -3.678297, 0, 1, 0.7647059, 1,
-0.08242476, 0.4677229, -1.599736, 0, 1, 0.772549, 1,
-0.0807112, 0.1071927, 0.7907442, 0, 1, 0.7764706, 1,
-0.07919294, 0.4231113, -0.6775089, 0, 1, 0.7843137, 1,
-0.07802331, 0.08796336, -2.082286, 0, 1, 0.7882353, 1,
-0.0739374, 0.6766201, -0.6533499, 0, 1, 0.7960784, 1,
-0.06363399, 0.3937964, -0.7320531, 0, 1, 0.8039216, 1,
-0.06252584, 0.3153017, -0.2180402, 0, 1, 0.8078431, 1,
-0.06188247, 0.5996041, 0.007488458, 0, 1, 0.8156863, 1,
-0.05956745, 0.0478441, 0.3923755, 0, 1, 0.8196079, 1,
-0.05741034, -1.029902, -3.381434, 0, 1, 0.827451, 1,
-0.05681712, 0.1306293, 0.2319453, 0, 1, 0.8313726, 1,
-0.05614025, 0.496121, -1.348882, 0, 1, 0.8392157, 1,
-0.05388224, -0.5564609, -1.848558, 0, 1, 0.8431373, 1,
-0.0512541, -0.6033014, -0.885008, 0, 1, 0.8509804, 1,
-0.04437899, -0.1805149, -1.577574, 0, 1, 0.854902, 1,
-0.03900732, -1.293873, -1.846777, 0, 1, 0.8627451, 1,
-0.03705465, 1.218566, -1.518319, 0, 1, 0.8666667, 1,
-0.03575855, -0.2948468, -3.33796, 0, 1, 0.8745098, 1,
-0.03125213, -0.1588642, -2.043564, 0, 1, 0.8784314, 1,
-0.02202127, -0.3271392, -3.422899, 0, 1, 0.8862745, 1,
-0.02089384, -0.06886214, -3.831045, 0, 1, 0.8901961, 1,
-0.0163004, 1.019054, -0.9979918, 0, 1, 0.8980392, 1,
-0.01012637, 0.1721688, -1.488601, 0, 1, 0.9058824, 1,
-0.009683104, -0.5596678, -3.410417, 0, 1, 0.9098039, 1,
-0.007150593, 0.3289725, -0.7751983, 0, 1, 0.9176471, 1,
-0.006561007, 0.8496626, -0.6441166, 0, 1, 0.9215686, 1,
-0.006091398, -1.468537, -2.559527, 0, 1, 0.9294118, 1,
-0.002565401, -0.1495468, -3.401706, 0, 1, 0.9333333, 1,
0.005519278, 0.9729872, 0.003043878, 0, 1, 0.9411765, 1,
0.007126621, 0.6008654, -0.7541131, 0, 1, 0.945098, 1,
0.009091337, -0.5982873, 4.129632, 0, 1, 0.9529412, 1,
0.01328047, -1.201238, 4.899457, 0, 1, 0.9568627, 1,
0.01377992, 0.1028023, 0.6879638, 0, 1, 0.9647059, 1,
0.01425522, 2.18326, 0.2077345, 0, 1, 0.9686275, 1,
0.0146057, 0.5390473, 0.1392234, 0, 1, 0.9764706, 1,
0.01583597, 0.1618755, -0.3498332, 0, 1, 0.9803922, 1,
0.01853894, 0.9134868, 0.2261049, 0, 1, 0.9882353, 1,
0.02005618, -0.2664208, 3.075684, 0, 1, 0.9921569, 1,
0.02026869, -1.577544, 2.743081, 0, 1, 1, 1,
0.02393431, 1.973247, 2.025424, 0, 0.9921569, 1, 1,
0.02814359, 1.059162, -0.1028198, 0, 0.9882353, 1, 1,
0.03594328, 0.4781237, -0.5365056, 0, 0.9803922, 1, 1,
0.03733974, -0.8773902, 3.905154, 0, 0.9764706, 1, 1,
0.03749212, 1.489976, -0.01201296, 0, 0.9686275, 1, 1,
0.03806984, -0.0157009, 1.402612, 0, 0.9647059, 1, 1,
0.03934783, 1.031851, 0.5976726, 0, 0.9568627, 1, 1,
0.05268433, 1.362165, 0.4243083, 0, 0.9529412, 1, 1,
0.05276501, -0.5753783, 4.547967, 0, 0.945098, 1, 1,
0.05295303, 0.1292177, 0.2441181, 0, 0.9411765, 1, 1,
0.05572877, -0.2183678, 1.921573, 0, 0.9333333, 1, 1,
0.05577287, -0.204806, 3.371325, 0, 0.9294118, 1, 1,
0.06054421, 0.1182943, -0.167587, 0, 0.9215686, 1, 1,
0.06075097, 0.6908761, -0.6518551, 0, 0.9176471, 1, 1,
0.06153426, 0.4051209, -1.194453, 0, 0.9098039, 1, 1,
0.06224437, -0.6696393, 2.230781, 0, 0.9058824, 1, 1,
0.06520323, -0.6577476, 1.872789, 0, 0.8980392, 1, 1,
0.06554592, 0.5383883, -0.2104204, 0, 0.8901961, 1, 1,
0.06727391, -0.385484, 3.570477, 0, 0.8862745, 1, 1,
0.06798116, -1.134819, 4.246672, 0, 0.8784314, 1, 1,
0.08091728, 0.7796776, -0.2001656, 0, 0.8745098, 1, 1,
0.08143137, 0.2581697, -0.253861, 0, 0.8666667, 1, 1,
0.08657245, -0.5005375, 2.049145, 0, 0.8627451, 1, 1,
0.08727966, -1.295227, 3.126438, 0, 0.854902, 1, 1,
0.09307545, 0.1664234, -0.2992526, 0, 0.8509804, 1, 1,
0.09698412, 0.1112989, -1.016769, 0, 0.8431373, 1, 1,
0.0996497, -0.8185911, 4.681498, 0, 0.8392157, 1, 1,
0.09980094, -1.404506, 2.979975, 0, 0.8313726, 1, 1,
0.1001509, -0.2662297, 2.714316, 0, 0.827451, 1, 1,
0.1024191, 0.855025, -1.929478, 0, 0.8196079, 1, 1,
0.1029882, 1.303117, -0.8318835, 0, 0.8156863, 1, 1,
0.1048577, -0.1740482, 1.402052, 0, 0.8078431, 1, 1,
0.1072793, -0.2655909, 2.451598, 0, 0.8039216, 1, 1,
0.1091916, 0.379599, -0.1493409, 0, 0.7960784, 1, 1,
0.1099636, -1.898055, 2.260815, 0, 0.7882353, 1, 1,
0.1121956, -0.5448875, 1.133289, 0, 0.7843137, 1, 1,
0.1195206, -1.23941, 2.643805, 0, 0.7764706, 1, 1,
0.1201929, 0.8540234, -0.7634141, 0, 0.772549, 1, 1,
0.1251063, 0.9435357, 0.1166744, 0, 0.7647059, 1, 1,
0.1263406, 0.728121, 1.761109, 0, 0.7607843, 1, 1,
0.1297407, 0.7906443, 1.172384, 0, 0.7529412, 1, 1,
0.1315505, 1.236451, -0.412567, 0, 0.7490196, 1, 1,
0.1362685, 0.005001911, 1.980119, 0, 0.7411765, 1, 1,
0.1375293, 0.2693484, -0.9021049, 0, 0.7372549, 1, 1,
0.1402402, 0.8166249, -1.20936, 0, 0.7294118, 1, 1,
0.1404945, 0.4240683, 2.045158, 0, 0.7254902, 1, 1,
0.1449651, 1.316744, 1.270532, 0, 0.7176471, 1, 1,
0.1538816, -0.08830158, 3.644791, 0, 0.7137255, 1, 1,
0.154537, 0.4399112, -0.875316, 0, 0.7058824, 1, 1,
0.1563678, 0.4664756, -0.9531581, 0, 0.6980392, 1, 1,
0.1583738, -0.07539991, 0.4930834, 0, 0.6941177, 1, 1,
0.1586122, -0.697286, 4.674073, 0, 0.6862745, 1, 1,
0.165842, 1.250278, -0.698833, 0, 0.682353, 1, 1,
0.1693839, 0.6096007, 1.8656, 0, 0.6745098, 1, 1,
0.1748596, -0.7530084, 3.54416, 0, 0.6705883, 1, 1,
0.1775611, 1.210885, -0.9673095, 0, 0.6627451, 1, 1,
0.1780796, -0.3078278, 3.464331, 0, 0.6588235, 1, 1,
0.1874522, -1.514584, 1.906276, 0, 0.6509804, 1, 1,
0.1890765, 1.12525, -0.3786972, 0, 0.6470588, 1, 1,
0.1902554, 0.7294091, -0.4788955, 0, 0.6392157, 1, 1,
0.1926042, -0.03964465, 2.270395, 0, 0.6352941, 1, 1,
0.1960951, -1.0749, 1.76675, 0, 0.627451, 1, 1,
0.1982307, -0.3413083, 1.859865, 0, 0.6235294, 1, 1,
0.2046465, 2.26753, 0.3443767, 0, 0.6156863, 1, 1,
0.2062119, -1.229137, 3.704748, 0, 0.6117647, 1, 1,
0.2065132, 1.578176, -1.351703, 0, 0.6039216, 1, 1,
0.2066176, -0.8199981, 2.370833, 0, 0.5960785, 1, 1,
0.2111875, 0.4171163, -0.9809492, 0, 0.5921569, 1, 1,
0.2210452, 0.62062, 0.006615439, 0, 0.5843138, 1, 1,
0.2270312, -0.1986496, 2.435491, 0, 0.5803922, 1, 1,
0.2350105, 0.9155863, 2.068103, 0, 0.572549, 1, 1,
0.2395362, 0.07575927, 1.590238, 0, 0.5686275, 1, 1,
0.2407593, -0.4750634, -0.2701471, 0, 0.5607843, 1, 1,
0.2411791, -0.09560821, 1.823923, 0, 0.5568628, 1, 1,
0.2418428, -2.021487, 4.381497, 0, 0.5490196, 1, 1,
0.2516615, -0.127506, 3.755155, 0, 0.5450981, 1, 1,
0.2517598, -0.5292259, 1.988969, 0, 0.5372549, 1, 1,
0.2519086, -0.3443566, 2.570656, 0, 0.5333334, 1, 1,
0.2558655, -1.000685, 3.955765, 0, 0.5254902, 1, 1,
0.2629128, 1.126313, -0.8881704, 0, 0.5215687, 1, 1,
0.2647626, -2.211185, 2.566983, 0, 0.5137255, 1, 1,
0.2689564, 1.573333, 2.524297, 0, 0.509804, 1, 1,
0.2707271, -0.002509866, 3.012631, 0, 0.5019608, 1, 1,
0.2715634, 0.484199, -0.3423528, 0, 0.4941176, 1, 1,
0.2726665, 0.6944159, 0.2618375, 0, 0.4901961, 1, 1,
0.2730627, -1.668303, 4.694394, 0, 0.4823529, 1, 1,
0.2736465, -1.46411, 3.201927, 0, 0.4784314, 1, 1,
0.2770156, -0.5775688, 2.984979, 0, 0.4705882, 1, 1,
0.277465, 0.2890037, 1.155526, 0, 0.4666667, 1, 1,
0.2791571, -1.752431, 2.234466, 0, 0.4588235, 1, 1,
0.2796948, -0.001229121, 2.428309, 0, 0.454902, 1, 1,
0.281495, -0.1406888, 1.990604, 0, 0.4470588, 1, 1,
0.2823037, 0.9841853, -2.044492, 0, 0.4431373, 1, 1,
0.2881009, -1.629343, 4.411341, 0, 0.4352941, 1, 1,
0.2904529, 0.8732247, 0.6145287, 0, 0.4313726, 1, 1,
0.2910844, 1.73118, 0.1435213, 0, 0.4235294, 1, 1,
0.2943042, 0.1840776, 1.905255, 0, 0.4196078, 1, 1,
0.2973776, -0.1241324, 2.212601, 0, 0.4117647, 1, 1,
0.3037074, 1.19775, 0.9477018, 0, 0.4078431, 1, 1,
0.3061163, -1.414707, 3.160567, 0, 0.4, 1, 1,
0.3069772, 0.90499, 2.562243, 0, 0.3921569, 1, 1,
0.3095498, -0.592759, 4.358626, 0, 0.3882353, 1, 1,
0.3102681, -0.8302459, 2.399347, 0, 0.3803922, 1, 1,
0.3169285, 1.841642, 0.1194962, 0, 0.3764706, 1, 1,
0.3189171, -0.5141374, 2.884644, 0, 0.3686275, 1, 1,
0.3193358, -1.35339, 2.657906, 0, 0.3647059, 1, 1,
0.3193702, 0.1547951, 0.2423258, 0, 0.3568628, 1, 1,
0.3206337, 1.60481, 1.56975, 0, 0.3529412, 1, 1,
0.3231646, 1.395206, -0.3508525, 0, 0.345098, 1, 1,
0.3241023, -1.836461, 2.306654, 0, 0.3411765, 1, 1,
0.3275017, -0.07582213, -0.05138715, 0, 0.3333333, 1, 1,
0.3281082, -0.1977942, 3.747137, 0, 0.3294118, 1, 1,
0.3285723, 0.5982797, -1.042984, 0, 0.3215686, 1, 1,
0.3295827, -1.24457, 3.409687, 0, 0.3176471, 1, 1,
0.329952, -1.106443, 1.2875, 0, 0.3098039, 1, 1,
0.3300535, -2.854971, 2.979846, 0, 0.3058824, 1, 1,
0.3359595, 0.8008714, 2.175095, 0, 0.2980392, 1, 1,
0.3371897, -0.5039663, 0.9913654, 0, 0.2901961, 1, 1,
0.3381747, 0.009735398, 2.352901, 0, 0.2862745, 1, 1,
0.3392824, -0.9921851, 3.16992, 0, 0.2784314, 1, 1,
0.3427569, 0.4461478, 0.4705589, 0, 0.2745098, 1, 1,
0.3472188, 1.095843, 0.5230824, 0, 0.2666667, 1, 1,
0.3474355, 0.4012104, 0.05905307, 0, 0.2627451, 1, 1,
0.3479395, -0.412036, 3.38574, 0, 0.254902, 1, 1,
0.3569331, 0.06487583, -0.2126204, 0, 0.2509804, 1, 1,
0.3632801, -0.06844683, 2.24006, 0, 0.2431373, 1, 1,
0.364622, -0.1187515, 3.421016, 0, 0.2392157, 1, 1,
0.3666448, 0.08037779, 2.358839, 0, 0.2313726, 1, 1,
0.3667528, -0.8004473, 2.317937, 0, 0.227451, 1, 1,
0.3756223, 0.6187665, 0.8088501, 0, 0.2196078, 1, 1,
0.3785753, -0.1276963, 0.3673842, 0, 0.2156863, 1, 1,
0.3794823, 1.10356, -0.9828156, 0, 0.2078431, 1, 1,
0.3817693, 2.439077, 0.8379312, 0, 0.2039216, 1, 1,
0.3868203, 0.1324537, 2.250808, 0, 0.1960784, 1, 1,
0.3881851, 1.527331, 0.0577009, 0, 0.1882353, 1, 1,
0.3885401, -1.37621, 1.677668, 0, 0.1843137, 1, 1,
0.3906173, 1.154896, -1.983663, 0, 0.1764706, 1, 1,
0.3918807, 2.384993, -0.7871459, 0, 0.172549, 1, 1,
0.3939275, -0.7384011, 2.837113, 0, 0.1647059, 1, 1,
0.4031508, 1.774881, 0.159708, 0, 0.1607843, 1, 1,
0.4064762, -1.02194, 2.022047, 0, 0.1529412, 1, 1,
0.4064838, -0.6271424, 1.413914, 0, 0.1490196, 1, 1,
0.4073954, -0.4381236, 1.252137, 0, 0.1411765, 1, 1,
0.4079171, -1.108216, 3.936634, 0, 0.1372549, 1, 1,
0.4161726, 0.996116, 1.749902, 0, 0.1294118, 1, 1,
0.4198314, 1.546046, 1.059194, 0, 0.1254902, 1, 1,
0.4229272, -1.197704, 3.581882, 0, 0.1176471, 1, 1,
0.4267956, 2.331568, -1.133818, 0, 0.1137255, 1, 1,
0.4284199, 0.6371969, 0.7177633, 0, 0.1058824, 1, 1,
0.4336366, 2.731829, 1.212986, 0, 0.09803922, 1, 1,
0.4439347, -2.116193, 2.36556, 0, 0.09411765, 1, 1,
0.4447774, -0.4769183, 2.763891, 0, 0.08627451, 1, 1,
0.4503003, -0.08528762, 2.890786, 0, 0.08235294, 1, 1,
0.4525616, -0.9229378, 2.192241, 0, 0.07450981, 1, 1,
0.4546148, -1.40762, 1.935595, 0, 0.07058824, 1, 1,
0.4664309, 0.8928326, 1.123233, 0, 0.0627451, 1, 1,
0.4723901, 0.01958618, 0.3857709, 0, 0.05882353, 1, 1,
0.4726044, 1.909516, -0.7679995, 0, 0.05098039, 1, 1,
0.4742774, -0.8047503, 3.314242, 0, 0.04705882, 1, 1,
0.4764688, 0.05026068, 0.3110065, 0, 0.03921569, 1, 1,
0.478042, 0.0253836, 0.5685018, 0, 0.03529412, 1, 1,
0.4810598, 0.3444395, -0.005687388, 0, 0.02745098, 1, 1,
0.4866674, -1.392619, 1.870333, 0, 0.02352941, 1, 1,
0.4872508, 1.236656, -0.3119412, 0, 0.01568628, 1, 1,
0.4922168, -0.1231586, 3.231561, 0, 0.01176471, 1, 1,
0.4930777, 0.6652531, -0.4654337, 0, 0.003921569, 1, 1,
0.4988188, 0.6593442, -0.6839861, 0.003921569, 0, 1, 1,
0.5001921, -1.625171, 5.001875, 0.007843138, 0, 1, 1,
0.5017456, 0.5156105, 0.792503, 0.01568628, 0, 1, 1,
0.502732, -0.3422975, 0.7491275, 0.01960784, 0, 1, 1,
0.5037674, -0.6705544, 1.436013, 0.02745098, 0, 1, 1,
0.5047395, -0.3730957, 2.282871, 0.03137255, 0, 1, 1,
0.5079143, 0.3802851, 0.6855679, 0.03921569, 0, 1, 1,
0.5149188, -0.1864703, 1.486245, 0.04313726, 0, 1, 1,
0.5171509, 0.441509, 2.064903, 0.05098039, 0, 1, 1,
0.5200707, -1.082221, 2.343691, 0.05490196, 0, 1, 1,
0.5250011, -0.08856556, 3.472901, 0.0627451, 0, 1, 1,
0.5335261, -1.299899, 2.657897, 0.06666667, 0, 1, 1,
0.5399317, -1.518263, 2.040914, 0.07450981, 0, 1, 1,
0.5448923, -0.1547371, 1.484208, 0.07843138, 0, 1, 1,
0.5469486, 0.6870391, 0.8081104, 0.08627451, 0, 1, 1,
0.5481972, -0.8390176, 2.329257, 0.09019608, 0, 1, 1,
0.551219, -0.3624805, 3.344748, 0.09803922, 0, 1, 1,
0.5525283, 0.6554532, 0.2871989, 0.1058824, 0, 1, 1,
0.5526664, 0.6587198, -0.2084456, 0.1098039, 0, 1, 1,
0.5548784, -1.172001, 1.696839, 0.1176471, 0, 1, 1,
0.5564541, 0.9875424, 0.5839778, 0.1215686, 0, 1, 1,
0.5596566, 0.5603476, -0.06309822, 0.1294118, 0, 1, 1,
0.5642994, 0.9553776, 1.026862, 0.1333333, 0, 1, 1,
0.5647223, -1.165675, 3.788703, 0.1411765, 0, 1, 1,
0.5658687, 0.2271258, 1.405021, 0.145098, 0, 1, 1,
0.5669534, 1.039338, 0.5199811, 0.1529412, 0, 1, 1,
0.5679023, 0.6073589, 0.9476099, 0.1568628, 0, 1, 1,
0.56998, 0.6031843, 1.288036, 0.1647059, 0, 1, 1,
0.5762978, -1.007288, 3.836631, 0.1686275, 0, 1, 1,
0.5778434, 0.4681188, -0.6699114, 0.1764706, 0, 1, 1,
0.5788794, 0.630609, 0.3882287, 0.1803922, 0, 1, 1,
0.5799897, 1.176832, 0.8365117, 0.1882353, 0, 1, 1,
0.5805007, 1.222213, 1.497026, 0.1921569, 0, 1, 1,
0.5828652, 0.8541455, 1.025956, 0.2, 0, 1, 1,
0.5848785, -0.4380869, 2.46946, 0.2078431, 0, 1, 1,
0.5857654, 0.1117655, 0.3724481, 0.2117647, 0, 1, 1,
0.5859278, -0.4726678, 1.759408, 0.2196078, 0, 1, 1,
0.590197, 1.137264, -0.4497301, 0.2235294, 0, 1, 1,
0.5935401, -0.7141728, 1.956943, 0.2313726, 0, 1, 1,
0.5943061, -0.2560042, 1.465139, 0.2352941, 0, 1, 1,
0.5945213, 0.5734193, 0.01591869, 0.2431373, 0, 1, 1,
0.5956764, -0.7079549, 1.287044, 0.2470588, 0, 1, 1,
0.5993054, -0.9358632, 3.592705, 0.254902, 0, 1, 1,
0.5996455, -0.3309101, 1.734987, 0.2588235, 0, 1, 1,
0.6000023, 0.7685582, 3.040206, 0.2666667, 0, 1, 1,
0.6008161, -0.5233432, 4.35657, 0.2705882, 0, 1, 1,
0.6068156, -1.003343, 2.700441, 0.2784314, 0, 1, 1,
0.6079302, 0.004494638, 1.55424, 0.282353, 0, 1, 1,
0.6150663, -0.09432645, 2.055665, 0.2901961, 0, 1, 1,
0.6153647, -2.409457, 5.951271, 0.2941177, 0, 1, 1,
0.6237089, 0.3035745, 1.015274, 0.3019608, 0, 1, 1,
0.6318744, -0.8587704, 1.079886, 0.3098039, 0, 1, 1,
0.6334372, 0.9947307, 0.1445725, 0.3137255, 0, 1, 1,
0.644792, -0.5330226, 2.475454, 0.3215686, 0, 1, 1,
0.6474239, -1.130759, 1.649585, 0.3254902, 0, 1, 1,
0.6481785, -0.5944199, 2.984089, 0.3333333, 0, 1, 1,
0.6515574, -1.143746, 3.463228, 0.3372549, 0, 1, 1,
0.6595517, -0.08850652, 2.733963, 0.345098, 0, 1, 1,
0.6711471, 0.9499463, 0.1836434, 0.3490196, 0, 1, 1,
0.671943, -0.01439911, 1.658494, 0.3568628, 0, 1, 1,
0.6722453, -1.187266, 4.066841, 0.3607843, 0, 1, 1,
0.6755286, 1.280047, 0.1227841, 0.3686275, 0, 1, 1,
0.6791143, 0.08451788, 1.453448, 0.372549, 0, 1, 1,
0.6860021, -0.7489261, 1.991134, 0.3803922, 0, 1, 1,
0.6882598, -1.553939, 3.320031, 0.3843137, 0, 1, 1,
0.6886297, 0.5399235, 1.54564, 0.3921569, 0, 1, 1,
0.6889364, -0.03841812, 1.718788, 0.3960784, 0, 1, 1,
0.6890289, -0.04227347, 3.210319, 0.4039216, 0, 1, 1,
0.6998889, -0.1710592, 2.366919, 0.4117647, 0, 1, 1,
0.6999441, -0.3818276, 2.405357, 0.4156863, 0, 1, 1,
0.7022176, -1.16441, 2.627822, 0.4235294, 0, 1, 1,
0.70346, -0.5685875, 1.258288, 0.427451, 0, 1, 1,
0.704321, -0.6985235, 1.731393, 0.4352941, 0, 1, 1,
0.7054882, -0.9829202, 2.013238, 0.4392157, 0, 1, 1,
0.7074774, -0.0467713, 2.023908, 0.4470588, 0, 1, 1,
0.7080031, -1.07362, 1.087298, 0.4509804, 0, 1, 1,
0.708375, -1.683875, 3.681685, 0.4588235, 0, 1, 1,
0.7117315, 0.116112, 1.422894, 0.4627451, 0, 1, 1,
0.7138512, -0.7461661, 2.890722, 0.4705882, 0, 1, 1,
0.7164021, -1.543156, 3.00526, 0.4745098, 0, 1, 1,
0.7173058, 1.563162, 0.9263306, 0.4823529, 0, 1, 1,
0.7194986, 0.5648218, 1.118953, 0.4862745, 0, 1, 1,
0.7211386, -0.2750011, 3.276128, 0.4941176, 0, 1, 1,
0.7230705, 2.024781, 2.056271, 0.5019608, 0, 1, 1,
0.7267032, 0.3487388, -0.01743079, 0.5058824, 0, 1, 1,
0.7276525, -0.1225905, 2.094278, 0.5137255, 0, 1, 1,
0.7285008, 0.9611036, 0.7652354, 0.5176471, 0, 1, 1,
0.7409553, 2.077327, -0.2265521, 0.5254902, 0, 1, 1,
0.7418226, -2.349638, 2.965119, 0.5294118, 0, 1, 1,
0.7569792, 2.345193, 1.507315, 0.5372549, 0, 1, 1,
0.7581002, -0.5573338, 2.024828, 0.5411765, 0, 1, 1,
0.7595038, -1.213978, 0.6254428, 0.5490196, 0, 1, 1,
0.7618133, 0.05923134, 2.823569, 0.5529412, 0, 1, 1,
0.7618489, 0.4018107, 0.6512253, 0.5607843, 0, 1, 1,
0.7629705, -0.3765191, 2.553223, 0.5647059, 0, 1, 1,
0.7630293, -1.641448, 3.906294, 0.572549, 0, 1, 1,
0.7655597, -1.413349, 1.646271, 0.5764706, 0, 1, 1,
0.7690355, 0.4290007, 0.8370278, 0.5843138, 0, 1, 1,
0.7712609, -0.3522884, 2.717688, 0.5882353, 0, 1, 1,
0.7737257, -0.7844931, 3.904165, 0.5960785, 0, 1, 1,
0.7783341, 0.7599102, 1.225897, 0.6039216, 0, 1, 1,
0.7841645, 0.2438237, 1.16625, 0.6078432, 0, 1, 1,
0.7848389, 0.3461014, -0.02740508, 0.6156863, 0, 1, 1,
0.7854035, 0.4811458, 2.553397, 0.6196079, 0, 1, 1,
0.7877085, 1.599977, 0.8273264, 0.627451, 0, 1, 1,
0.7947441, -0.09693393, 2.390819, 0.6313726, 0, 1, 1,
0.7949684, 0.1003668, 1.612254, 0.6392157, 0, 1, 1,
0.7982771, -1.697482, 2.101221, 0.6431373, 0, 1, 1,
0.8011332, -0.6756035, 2.785577, 0.6509804, 0, 1, 1,
0.8041718, 2.197154, 1.260022, 0.654902, 0, 1, 1,
0.8078229, -0.6274626, 2.984504, 0.6627451, 0, 1, 1,
0.8115527, -1.645386, 2.995475, 0.6666667, 0, 1, 1,
0.8123603, 0.3896808, 1.002928, 0.6745098, 0, 1, 1,
0.8139058, 2.132384, 0.134433, 0.6784314, 0, 1, 1,
0.8178502, 0.5876041, -0.2822087, 0.6862745, 0, 1, 1,
0.8208702, 1.772821, 0.05782219, 0.6901961, 0, 1, 1,
0.8217647, 0.4478654, -0.5564146, 0.6980392, 0, 1, 1,
0.8278221, 0.1054656, 1.831365, 0.7058824, 0, 1, 1,
0.8305691, 0.3767013, 2.113856, 0.7098039, 0, 1, 1,
0.8332846, -0.7312091, 2.531635, 0.7176471, 0, 1, 1,
0.8422693, 0.4629141, 1.542442, 0.7215686, 0, 1, 1,
0.8426995, -0.7562957, 2.668763, 0.7294118, 0, 1, 1,
0.8549809, -0.2611175, 1.806379, 0.7333333, 0, 1, 1,
0.8559759, -0.5660099, 2.186234, 0.7411765, 0, 1, 1,
0.8562009, 0.2807773, 0.3570289, 0.7450981, 0, 1, 1,
0.8566854, -0.5721315, 1.431799, 0.7529412, 0, 1, 1,
0.8592116, -0.4453856, 1.99024, 0.7568628, 0, 1, 1,
0.8613969, -1.063113, 1.865186, 0.7647059, 0, 1, 1,
0.8630876, 0.5047589, 0.9039528, 0.7686275, 0, 1, 1,
0.8693081, -0.5175791, 1.483674, 0.7764706, 0, 1, 1,
0.8724245, -0.3366326, 1.652005, 0.7803922, 0, 1, 1,
0.8787912, -1.130802, 1.23022, 0.7882353, 0, 1, 1,
0.8788283, -0.5858938, 1.763078, 0.7921569, 0, 1, 1,
0.8788313, -0.3692384, -1.503604, 0.8, 0, 1, 1,
0.8812814, 0.6169137, -0.1758774, 0.8078431, 0, 1, 1,
0.8958931, -1.734274, 2.37806, 0.8117647, 0, 1, 1,
0.8962154, 0.8240435, -0.2603485, 0.8196079, 0, 1, 1,
0.9008984, -1.125128, 3.625667, 0.8235294, 0, 1, 1,
0.901847, 0.1778153, 1.639573, 0.8313726, 0, 1, 1,
0.9031529, 1.339436, -0.3289488, 0.8352941, 0, 1, 1,
0.9051616, 0.5341769, 0.04764177, 0.8431373, 0, 1, 1,
0.9063987, -0.1404882, 2.826828, 0.8470588, 0, 1, 1,
0.9100465, -0.2664317, 1.175059, 0.854902, 0, 1, 1,
0.9126186, -1.239163, 2.48152, 0.8588235, 0, 1, 1,
0.9153143, -0.1684203, 1.844034, 0.8666667, 0, 1, 1,
0.9158356, 0.3575128, 0.6960726, 0.8705882, 0, 1, 1,
0.9192428, -0.1042737, 2.040843, 0.8784314, 0, 1, 1,
0.9254127, 1.641704, 0.8452349, 0.8823529, 0, 1, 1,
0.9255703, -0.6025169, 1.912148, 0.8901961, 0, 1, 1,
0.9333231, 0.004164282, 1.759557, 0.8941177, 0, 1, 1,
0.9387456, -0.5681263, 2.436017, 0.9019608, 0, 1, 1,
0.9422518, 0.1375425, 0.8441595, 0.9098039, 0, 1, 1,
0.948724, 0.612859, -0.1223969, 0.9137255, 0, 1, 1,
0.9510159, 0.4169885, -0.8192492, 0.9215686, 0, 1, 1,
0.9527044, -0.3997936, 1.554299, 0.9254902, 0, 1, 1,
0.9556279, 1.134823, 1.090716, 0.9333333, 0, 1, 1,
0.9596374, -1.571309, 4.071785, 0.9372549, 0, 1, 1,
0.9646438, -0.3307159, 1.173922, 0.945098, 0, 1, 1,
0.9664098, 0.5629261, -1.16767, 0.9490196, 0, 1, 1,
0.9668108, -1.174372, 2.293345, 0.9568627, 0, 1, 1,
0.9830585, -2.25825, 1.769352, 0.9607843, 0, 1, 1,
0.9939508, -0.7239898, 0.6634626, 0.9686275, 0, 1, 1,
1.003062, 0.08307011, 1.302434, 0.972549, 0, 1, 1,
1.006265, 1.251314, 0.4795908, 0.9803922, 0, 1, 1,
1.00711, 1.221773, 1.62854, 0.9843137, 0, 1, 1,
1.008098, 1.364771, 2.071047, 0.9921569, 0, 1, 1,
1.010301, -0.2053287, 1.782666, 0.9960784, 0, 1, 1,
1.012648, 0.1745455, -1.031565, 1, 0, 0.9960784, 1,
1.01283, 1.872573, -1.152565, 1, 0, 0.9882353, 1,
1.014844, -0.1571153, 1.576735, 1, 0, 0.9843137, 1,
1.016407, 0.8737769, 0.653204, 1, 0, 0.9764706, 1,
1.018294, -1.377045, 2.633702, 1, 0, 0.972549, 1,
1.023556, 0.735505, 0.9276594, 1, 0, 0.9647059, 1,
1.028698, -2.327939, 4.21678, 1, 0, 0.9607843, 1,
1.031961, -0.9617028, 2.989293, 1, 0, 0.9529412, 1,
1.042567, 0.5722318, 1.192522, 1, 0, 0.9490196, 1,
1.04281, -2.029999, 3.153156, 1, 0, 0.9411765, 1,
1.048179, -1.877657, 3.938072, 1, 0, 0.9372549, 1,
1.050677, 0.3246558, 0.7315651, 1, 0, 0.9294118, 1,
1.050698, 0.7220746, 1.364705, 1, 0, 0.9254902, 1,
1.056153, 0.7494747, 1.593407, 1, 0, 0.9176471, 1,
1.056918, 0.7164376, 1.032254, 1, 0, 0.9137255, 1,
1.064304, -0.4003007, 1.185959, 1, 0, 0.9058824, 1,
1.065949, -0.759053, 2.537483, 1, 0, 0.9019608, 1,
1.072852, 1.781346, -0.1545869, 1, 0, 0.8941177, 1,
1.076369, 1.177538, 1.952422, 1, 0, 0.8862745, 1,
1.077117, -1.368856, 1.367682, 1, 0, 0.8823529, 1,
1.078555, 0.4421773, 1.109732, 1, 0, 0.8745098, 1,
1.088493, 0.9404336, -0.6501532, 1, 0, 0.8705882, 1,
1.095237, -2.059099, 2.622699, 1, 0, 0.8627451, 1,
1.096577, 1.184031, -0.05325509, 1, 0, 0.8588235, 1,
1.107299, 0.9826527, 0.9400622, 1, 0, 0.8509804, 1,
1.112836, -0.2004878, 0.7075405, 1, 0, 0.8470588, 1,
1.113891, -1.687548, 3.373165, 1, 0, 0.8392157, 1,
1.127809, 0.3695064, 1.999142, 1, 0, 0.8352941, 1,
1.137303, 0.7044649, 0.289416, 1, 0, 0.827451, 1,
1.137775, 0.3673482, 2.242859, 1, 0, 0.8235294, 1,
1.139402, -1.104045, 2.235482, 1, 0, 0.8156863, 1,
1.15369, 0.9791319, 0.1423095, 1, 0, 0.8117647, 1,
1.158254, 0.5642055, -0.1450269, 1, 0, 0.8039216, 1,
1.16125, -0.1625843, 2.501753, 1, 0, 0.7960784, 1,
1.16154, 0.6883202, 1.927776, 1, 0, 0.7921569, 1,
1.162005, 0.4190505, 1.660698, 1, 0, 0.7843137, 1,
1.168736, -0.3002588, 3.631932, 1, 0, 0.7803922, 1,
1.171842, 1.016266, -0.7791167, 1, 0, 0.772549, 1,
1.174044, 2.456496, 1.628675, 1, 0, 0.7686275, 1,
1.174275, -1.015781, 2.826226, 1, 0, 0.7607843, 1,
1.188154, -0.4164194, 3.416017, 1, 0, 0.7568628, 1,
1.191013, 0.2122108, 0.9277065, 1, 0, 0.7490196, 1,
1.193763, -1.316594, 1.145886, 1, 0, 0.7450981, 1,
1.199464, 0.08478278, 3.568758, 1, 0, 0.7372549, 1,
1.202133, 0.4209682, 2.89072, 1, 0, 0.7333333, 1,
1.209413, -0.8280343, 2.341793, 1, 0, 0.7254902, 1,
1.214579, 0.8431745, 0.2495377, 1, 0, 0.7215686, 1,
1.214729, -0.2847971, 1.553289, 1, 0, 0.7137255, 1,
1.214843, 1.396548, 0.8332016, 1, 0, 0.7098039, 1,
1.219934, 0.2746596, 1.405402, 1, 0, 0.7019608, 1,
1.220707, 1.688408, 0.1465813, 1, 0, 0.6941177, 1,
1.221637, -0.1307895, 1.111482, 1, 0, 0.6901961, 1,
1.231189, 1.577398, 0.12414, 1, 0, 0.682353, 1,
1.234504, 0.573054, 2.114984, 1, 0, 0.6784314, 1,
1.235103, 1.055519, 0.1735303, 1, 0, 0.6705883, 1,
1.2529, -0.7514996, 0.5477028, 1, 0, 0.6666667, 1,
1.255679, -0.001110106, 0.646071, 1, 0, 0.6588235, 1,
1.261056, -0.2953753, 1.685523, 1, 0, 0.654902, 1,
1.262524, -1.122505, 1.960211, 1, 0, 0.6470588, 1,
1.264314, -0.6227598, 4.488991, 1, 0, 0.6431373, 1,
1.264562, -0.9031729, 2.043521, 1, 0, 0.6352941, 1,
1.268233, -1.675758, 3.107427, 1, 0, 0.6313726, 1,
1.275043, -0.7557002, 1.103881, 1, 0, 0.6235294, 1,
1.279403, -1.086835, 2.559619, 1, 0, 0.6196079, 1,
1.279856, 1.934191, 1.320446, 1, 0, 0.6117647, 1,
1.283672, 0.560186, 0.09984284, 1, 0, 0.6078432, 1,
1.287113, -0.6113979, -0.03949455, 1, 0, 0.6, 1,
1.289246, -0.7370794, 4.23242, 1, 0, 0.5921569, 1,
1.309006, 1.036011, 2.734687, 1, 0, 0.5882353, 1,
1.311302, -2.367654, 3.531107, 1, 0, 0.5803922, 1,
1.328224, 2.627322, 1.973568, 1, 0, 0.5764706, 1,
1.329525, -0.09670157, 2.691798, 1, 0, 0.5686275, 1,
1.33276, 0.1560089, 0.5795054, 1, 0, 0.5647059, 1,
1.341282, 1.418062, 0.5303316, 1, 0, 0.5568628, 1,
1.34144, 1.585923, -0.4338129, 1, 0, 0.5529412, 1,
1.348083, -1.305013, 0.1791493, 1, 0, 0.5450981, 1,
1.350395, 0.7383016, 2.470999, 1, 0, 0.5411765, 1,
1.35237, -0.2893268, 0.9603512, 1, 0, 0.5333334, 1,
1.358171, -0.235462, 1.918877, 1, 0, 0.5294118, 1,
1.366012, 0.61506, 2.535062, 1, 0, 0.5215687, 1,
1.378471, 1.636595, 0.08546659, 1, 0, 0.5176471, 1,
1.382452, -0.3136201, 2.037447, 1, 0, 0.509804, 1,
1.391358, 0.587307, 3.23374, 1, 0, 0.5058824, 1,
1.403528, -0.9731731, 2.613898, 1, 0, 0.4980392, 1,
1.405654, 0.9909389, 1.062293, 1, 0, 0.4901961, 1,
1.41558, -0.6494963, 2.500798, 1, 0, 0.4862745, 1,
1.416013, 1.190531, 1.62855, 1, 0, 0.4784314, 1,
1.416519, 0.3773066, 2.396003, 1, 0, 0.4745098, 1,
1.417424, -1.855761, 3.532082, 1, 0, 0.4666667, 1,
1.427082, 1.315844, 0.9425808, 1, 0, 0.4627451, 1,
1.433441, 0.7887036, 1.262131, 1, 0, 0.454902, 1,
1.446464, 0.3441628, 1.336743, 1, 0, 0.4509804, 1,
1.470836, 1.525748, -0.235425, 1, 0, 0.4431373, 1,
1.471229, -0.7682146, 1.309265, 1, 0, 0.4392157, 1,
1.474051, -1.554947, 2.321275, 1, 0, 0.4313726, 1,
1.474677, -0.1027047, 1.736236, 1, 0, 0.427451, 1,
1.475436, 0.2376766, 1.635791, 1, 0, 0.4196078, 1,
1.481844, -1.005965, 0.9155314, 1, 0, 0.4156863, 1,
1.488611, -0.1814447, 2.078459, 1, 0, 0.4078431, 1,
1.494381, -0.3226488, 2.058659, 1, 0, 0.4039216, 1,
1.507685, 0.4243151, 1.452438, 1, 0, 0.3960784, 1,
1.514578, -1.448465, 3.638813, 1, 0, 0.3882353, 1,
1.518142, -0.2244988, 3.379169, 1, 0, 0.3843137, 1,
1.523213, -0.1678042, 2.366878, 1, 0, 0.3764706, 1,
1.527737, 1.03567, 1.386558, 1, 0, 0.372549, 1,
1.529271, 0.935819, 3.617328, 1, 0, 0.3647059, 1,
1.544779, -0.6732606, 1.807022, 1, 0, 0.3607843, 1,
1.549929, 0.9865962, 0.9127768, 1, 0, 0.3529412, 1,
1.553655, -1.117383, 2.153001, 1, 0, 0.3490196, 1,
1.559564, 0.8407174, 2.341502, 1, 0, 0.3411765, 1,
1.563745, 1.268865, -0.7889801, 1, 0, 0.3372549, 1,
1.570827, 0.7772011, -0.3529525, 1, 0, 0.3294118, 1,
1.58918, 0.2831781, 2.56064, 1, 0, 0.3254902, 1,
1.600306, -1.035314, 2.732069, 1, 0, 0.3176471, 1,
1.600477, 1.114326, 2.958288, 1, 0, 0.3137255, 1,
1.612017, 0.7526427, 1.603827, 1, 0, 0.3058824, 1,
1.614104, -0.3167863, 0.2334499, 1, 0, 0.2980392, 1,
1.615366, -0.6053089, 2.003122, 1, 0, 0.2941177, 1,
1.621057, 1.380748, 2.019307, 1, 0, 0.2862745, 1,
1.623279, -0.641883, 3.24289, 1, 0, 0.282353, 1,
1.666274, 1.166603, 0.4434421, 1, 0, 0.2745098, 1,
1.67142, -1.561105, 3.177454, 1, 0, 0.2705882, 1,
1.692863, 0.541114, 2.843536, 1, 0, 0.2627451, 1,
1.696414, 0.6496025, 1.604149, 1, 0, 0.2588235, 1,
1.698681, -1.567335, 1.888472, 1, 0, 0.2509804, 1,
1.713091, -0.6271455, 3.989205, 1, 0, 0.2470588, 1,
1.717844, -1.091023, 1.566067, 1, 0, 0.2392157, 1,
1.722035, 0.8431164, 1.927186, 1, 0, 0.2352941, 1,
1.730811, -1.019653, 1.984445, 1, 0, 0.227451, 1,
1.732597, 1.501681, 3.346706, 1, 0, 0.2235294, 1,
1.765424, 1.786524, 1.088263, 1, 0, 0.2156863, 1,
1.766301, -0.0646112, 0.5556853, 1, 0, 0.2117647, 1,
1.779153, -1.065009, 0.0852454, 1, 0, 0.2039216, 1,
1.794487, -0.4178632, 1.181011, 1, 0, 0.1960784, 1,
1.800892, -1.423536, 1.046238, 1, 0, 0.1921569, 1,
1.834499, 0.1391761, 0.1946517, 1, 0, 0.1843137, 1,
1.84417, -0.6609652, 1.482239, 1, 0, 0.1803922, 1,
1.878819, 1.094608, 2.03643, 1, 0, 0.172549, 1,
1.883435, 0.9565572, 1.332054, 1, 0, 0.1686275, 1,
1.94657, 0.9658194, 1.137123, 1, 0, 0.1607843, 1,
1.951351, -2.284527, 2.481005, 1, 0, 0.1568628, 1,
1.957346, 1.234694, 1.553808, 1, 0, 0.1490196, 1,
1.964291, -0.6533563, 1.118039, 1, 0, 0.145098, 1,
1.98775, -1.46972, 2.484709, 1, 0, 0.1372549, 1,
2.026103, 0.08465705, 0.8146421, 1, 0, 0.1333333, 1,
2.037467, -1.092349, 4.310411, 1, 0, 0.1254902, 1,
2.069745, 0.1187493, 0.4110763, 1, 0, 0.1215686, 1,
2.074536, -0.02507456, -0.002650639, 1, 0, 0.1137255, 1,
2.075092, 0.7218279, 4.880794, 1, 0, 0.1098039, 1,
2.103275, -0.8158067, 1.591677, 1, 0, 0.1019608, 1,
2.11382, 0.5750992, 1.860772, 1, 0, 0.09411765, 1,
2.124583, -0.648005, 1.576123, 1, 0, 0.09019608, 1,
2.175439, 0.9005417, 1.949287, 1, 0, 0.08235294, 1,
2.242703, -0.383076, 1.937121, 1, 0, 0.07843138, 1,
2.259999, -1.366025, 4.764468, 1, 0, 0.07058824, 1,
2.280641, 0.1273342, 2.089284, 1, 0, 0.06666667, 1,
2.335574, 0.3385289, 2.104275, 1, 0, 0.05882353, 1,
2.345835, -0.2062224, 2.686506, 1, 0, 0.05490196, 1,
2.386594, -0.5754492, 0.1145041, 1, 0, 0.04705882, 1,
2.389259, -0.8109861, 2.157074, 1, 0, 0.04313726, 1,
2.443734, 0.8120712, 2.837088, 1, 0, 0.03529412, 1,
2.52699, -0.804724, 2.121636, 1, 0, 0.03137255, 1,
2.664094, 0.4111414, 1.440132, 1, 0, 0.02352941, 1,
3.262701, 0.4595012, 3.180844, 1, 0, 0.01960784, 1,
3.431897, 0.4521205, 1.064219, 1, 0, 0.01176471, 1,
4.308205, 0.5607888, 1.006069, 1, 0, 0.007843138, 1
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
0.3418847, -4.60079, -7.240651, 0, -0.5, 0.5, 0.5,
0.3418847, -4.60079, -7.240651, 1, -0.5, 0.5, 0.5,
0.3418847, -4.60079, -7.240651, 1, 1.5, 0.5, 0.5,
0.3418847, -4.60079, -7.240651, 0, 1.5, 0.5, 0.5
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
-4.969018, 0.09023869, -7.240651, 0, -0.5, 0.5, 0.5,
-4.969018, 0.09023869, -7.240651, 1, -0.5, 0.5, 0.5,
-4.969018, 0.09023869, -7.240651, 1, 1.5, 0.5, 0.5,
-4.969018, 0.09023869, -7.240651, 0, 1.5, 0.5, 0.5
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
-4.969018, -4.60079, 0.3112872, 0, -0.5, 0.5, 0.5,
-4.969018, -4.60079, 0.3112872, 1, -0.5, 0.5, 0.5,
-4.969018, -4.60079, 0.3112872, 1, 1.5, 0.5, 0.5,
-4.969018, -4.60079, 0.3112872, 0, 1.5, 0.5, 0.5
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
-2, -3.518245, -5.497896,
4, -3.518245, -5.497896,
-2, -3.518245, -5.497896,
-2, -3.698669, -5.788355,
0, -3.518245, -5.497896,
0, -3.698669, -5.788355,
2, -3.518245, -5.497896,
2, -3.698669, -5.788355,
4, -3.518245, -5.497896,
4, -3.698669, -5.788355
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
-2, -4.059517, -6.369274, 0, -0.5, 0.5, 0.5,
-2, -4.059517, -6.369274, 1, -0.5, 0.5, 0.5,
-2, -4.059517, -6.369274, 1, 1.5, 0.5, 0.5,
-2, -4.059517, -6.369274, 0, 1.5, 0.5, 0.5,
0, -4.059517, -6.369274, 0, -0.5, 0.5, 0.5,
0, -4.059517, -6.369274, 1, -0.5, 0.5, 0.5,
0, -4.059517, -6.369274, 1, 1.5, 0.5, 0.5,
0, -4.059517, -6.369274, 0, 1.5, 0.5, 0.5,
2, -4.059517, -6.369274, 0, -0.5, 0.5, 0.5,
2, -4.059517, -6.369274, 1, -0.5, 0.5, 0.5,
2, -4.059517, -6.369274, 1, 1.5, 0.5, 0.5,
2, -4.059517, -6.369274, 0, 1.5, 0.5, 0.5,
4, -4.059517, -6.369274, 0, -0.5, 0.5, 0.5,
4, -4.059517, -6.369274, 1, -0.5, 0.5, 0.5,
4, -4.059517, -6.369274, 1, 1.5, 0.5, 0.5,
4, -4.059517, -6.369274, 0, 1.5, 0.5, 0.5
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
-3.743425, -2, -5.497896,
-3.743425, 2, -5.497896,
-3.743425, -2, -5.497896,
-3.94769, -2, -5.788355,
-3.743425, 0, -5.497896,
-3.94769, 0, -5.788355,
-3.743425, 2, -5.497896,
-3.94769, 2, -5.788355
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
-4.356221, -2, -6.369274, 0, -0.5, 0.5, 0.5,
-4.356221, -2, -6.369274, 1, -0.5, 0.5, 0.5,
-4.356221, -2, -6.369274, 1, 1.5, 0.5, 0.5,
-4.356221, -2, -6.369274, 0, 1.5, 0.5, 0.5,
-4.356221, 0, -6.369274, 0, -0.5, 0.5, 0.5,
-4.356221, 0, -6.369274, 1, -0.5, 0.5, 0.5,
-4.356221, 0, -6.369274, 1, 1.5, 0.5, 0.5,
-4.356221, 0, -6.369274, 0, 1.5, 0.5, 0.5,
-4.356221, 2, -6.369274, 0, -0.5, 0.5, 0.5,
-4.356221, 2, -6.369274, 1, -0.5, 0.5, 0.5,
-4.356221, 2, -6.369274, 1, 1.5, 0.5, 0.5,
-4.356221, 2, -6.369274, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.743425, -3.518245, -4,
-3.743425, -3.518245, 4,
-3.743425, -3.518245, -4,
-3.94769, -3.698669, -4,
-3.743425, -3.518245, -2,
-3.94769, -3.698669, -2,
-3.743425, -3.518245, 0,
-3.94769, -3.698669, 0,
-3.743425, -3.518245, 2,
-3.94769, -3.698669, 2,
-3.743425, -3.518245, 4,
-3.94769, -3.698669, 4
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
-4.356221, -4.059517, -4, 0, -0.5, 0.5, 0.5,
-4.356221, -4.059517, -4, 1, -0.5, 0.5, 0.5,
-4.356221, -4.059517, -4, 1, 1.5, 0.5, 0.5,
-4.356221, -4.059517, -4, 0, 1.5, 0.5, 0.5,
-4.356221, -4.059517, -2, 0, -0.5, 0.5, 0.5,
-4.356221, -4.059517, -2, 1, -0.5, 0.5, 0.5,
-4.356221, -4.059517, -2, 1, 1.5, 0.5, 0.5,
-4.356221, -4.059517, -2, 0, 1.5, 0.5, 0.5,
-4.356221, -4.059517, 0, 0, -0.5, 0.5, 0.5,
-4.356221, -4.059517, 0, 1, -0.5, 0.5, 0.5,
-4.356221, -4.059517, 0, 1, 1.5, 0.5, 0.5,
-4.356221, -4.059517, 0, 0, 1.5, 0.5, 0.5,
-4.356221, -4.059517, 2, 0, -0.5, 0.5, 0.5,
-4.356221, -4.059517, 2, 1, -0.5, 0.5, 0.5,
-4.356221, -4.059517, 2, 1, 1.5, 0.5, 0.5,
-4.356221, -4.059517, 2, 0, 1.5, 0.5, 0.5,
-4.356221, -4.059517, 4, 0, -0.5, 0.5, 0.5,
-4.356221, -4.059517, 4, 1, -0.5, 0.5, 0.5,
-4.356221, -4.059517, 4, 1, 1.5, 0.5, 0.5,
-4.356221, -4.059517, 4, 0, 1.5, 0.5, 0.5
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
-3.743425, -3.518245, -5.497896,
-3.743425, 3.698722, -5.497896,
-3.743425, -3.518245, 6.120471,
-3.743425, 3.698722, 6.120471,
-3.743425, -3.518245, -5.497896,
-3.743425, -3.518245, 6.120471,
-3.743425, 3.698722, -5.497896,
-3.743425, 3.698722, 6.120471,
-3.743425, -3.518245, -5.497896,
4.427194, -3.518245, -5.497896,
-3.743425, -3.518245, 6.120471,
4.427194, -3.518245, 6.120471,
-3.743425, 3.698722, -5.497896,
4.427194, 3.698722, -5.497896,
-3.743425, 3.698722, 6.120471,
4.427194, 3.698722, 6.120471,
4.427194, -3.518245, -5.497896,
4.427194, 3.698722, -5.497896,
4.427194, -3.518245, 6.120471,
4.427194, 3.698722, 6.120471,
4.427194, -3.518245, -5.497896,
4.427194, -3.518245, 6.120471,
4.427194, 3.698722, -5.497896,
4.427194, 3.698722, 6.120471
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
var radius = 8.507403;
var distance = 37.8504;
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
mvMatrix.translate( -0.3418847, -0.09023869, -0.3112872 );
mvMatrix.scale( 1.125786, 1.274548, 0.7917094 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.8504);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
etobenzanid<-read.table("etobenzanid.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-etobenzanid$V2
```

```
## Error in eval(expr, envir, enclos): object 'etobenzanid' not found
```

```r
y<-etobenzanid$V3
```

```
## Error in eval(expr, envir, enclos): object 'etobenzanid' not found
```

```r
z<-etobenzanid$V4
```

```
## Error in eval(expr, envir, enclos): object 'etobenzanid' not found
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
-3.624435, 0.4748044, -1.738271, 0, 0, 1, 1, 1,
-3.583394, 0.5638359, 0.3891136, 1, 0, 0, 1, 1,
-3.368389, -0.2255124, -2.92448, 1, 0, 0, 1, 1,
-2.921178, -0.3226121, -1.992671, 1, 0, 0, 1, 1,
-2.901625, -0.9783381, -3.503554, 1, 0, 0, 1, 1,
-2.699929, -0.06562878, -1.751088, 1, 0, 0, 1, 1,
-2.679947, -0.8854683, -2.246165, 0, 0, 0, 1, 1,
-2.664331, 1.043, -3.614502, 0, 0, 0, 1, 1,
-2.575863, -1.095793, -2.562291, 0, 0, 0, 1, 1,
-2.499068, -0.171533, -1.792435, 0, 0, 0, 1, 1,
-2.498555, 0.02769902, -0.7687535, 0, 0, 0, 1, 1,
-2.445889, -1.266989, -2.511433, 0, 0, 0, 1, 1,
-2.405913, -1.189059, -1.226438, 0, 0, 0, 1, 1,
-2.377542, -1.971588, -3.109304, 1, 1, 1, 1, 1,
-2.367457, 0.988993, 0.09109871, 1, 1, 1, 1, 1,
-2.327747, -0.6900671, -2.717267, 1, 1, 1, 1, 1,
-2.287641, -0.2163386, -1.959275, 1, 1, 1, 1, 1,
-2.213039, -0.8597231, -1.615063, 1, 1, 1, 1, 1,
-2.211144, 1.452844, -0.1067194, 1, 1, 1, 1, 1,
-2.181823, -0.05571709, -1.407394, 1, 1, 1, 1, 1,
-2.180012, -2.226321, -0.3707623, 1, 1, 1, 1, 1,
-2.172217, -0.2402934, -0.9088471, 1, 1, 1, 1, 1,
-2.170551, 1.785582, 0.9778614, 1, 1, 1, 1, 1,
-2.154053, -1.335365, -3.556428, 1, 1, 1, 1, 1,
-2.152026, 0.1489588, -1.061184, 1, 1, 1, 1, 1,
-2.149178, 0.8564852, -0.1108186, 1, 1, 1, 1, 1,
-2.113021, 1.10761, -3.204565, 1, 1, 1, 1, 1,
-2.078808, -1.815261, -0.832924, 1, 1, 1, 1, 1,
-2.06928, -0.4668925, -2.618124, 0, 0, 1, 1, 1,
-2.05171, 0.3568609, -1.619409, 1, 0, 0, 1, 1,
-2.035412, 0.195758, 1.437004, 1, 0, 0, 1, 1,
-2.033982, 0.004108524, -1.533297, 1, 0, 0, 1, 1,
-1.998749, 0.7763255, -0.5090413, 1, 0, 0, 1, 1,
-1.969434, 0.3879761, -2.225206, 1, 0, 0, 1, 1,
-1.950956, -0.08049093, -1.092733, 0, 0, 0, 1, 1,
-1.921847, 0.354082, -0.5077586, 0, 0, 0, 1, 1,
-1.90812, -0.06900133, -2.006947, 0, 0, 0, 1, 1,
-1.894992, -0.4290447, -2.189573, 0, 0, 0, 1, 1,
-1.844574, -0.3606437, -2.124651, 0, 0, 0, 1, 1,
-1.84271, -1.354366, -3.093368, 0, 0, 0, 1, 1,
-1.805629, 0.780589, -0.9562563, 0, 0, 0, 1, 1,
-1.802195, -0.9765531, -1.08751, 1, 1, 1, 1, 1,
-1.796492, 0.09467149, -2.223512, 1, 1, 1, 1, 1,
-1.792215, 0.237544, -0.5259078, 1, 1, 1, 1, 1,
-1.790378, 0.2443658, -1.219284, 1, 1, 1, 1, 1,
-1.77137, 1.070781, -0.9402224, 1, 1, 1, 1, 1,
-1.768003, -0.3570915, -1.804366, 1, 1, 1, 1, 1,
-1.755242, -0.5454987, -1.572614, 1, 1, 1, 1, 1,
-1.712849, -0.1718109, -1.621654, 1, 1, 1, 1, 1,
-1.711888, 1.293486, 0.6474282, 1, 1, 1, 1, 1,
-1.707441, -0.3242096, -3.162521, 1, 1, 1, 1, 1,
-1.704483, -1.196513, -3.296392, 1, 1, 1, 1, 1,
-1.702193, 0.6087757, -2.665259, 1, 1, 1, 1, 1,
-1.687377, 0.4750185, -1.362134, 1, 1, 1, 1, 1,
-1.666033, 0.7911514, -1.524474, 1, 1, 1, 1, 1,
-1.659467, 0.09781116, -2.595679, 1, 1, 1, 1, 1,
-1.65005, 0.4951129, -2.231422, 0, 0, 1, 1, 1,
-1.632874, -0.3183537, -2.913997, 1, 0, 0, 1, 1,
-1.619172, -0.2269133, -2.223769, 1, 0, 0, 1, 1,
-1.614574, 0.5890619, 0.2384257, 1, 0, 0, 1, 1,
-1.612373, -1.29918, 0.1451232, 1, 0, 0, 1, 1,
-1.605964, -0.6158842, -1.403702, 1, 0, 0, 1, 1,
-1.561554, 0.2367496, 0.777603, 0, 0, 0, 1, 1,
-1.556244, -0.9991695, -1.119279, 0, 0, 0, 1, 1,
-1.53841, 2.837898, -0.6956649, 0, 0, 0, 1, 1,
-1.528339, 0.1761755, -1.671684, 0, 0, 0, 1, 1,
-1.52184, 0.3081408, 1.733658, 0, 0, 0, 1, 1,
-1.499839, -0.295849, -2.282181, 0, 0, 0, 1, 1,
-1.475037, 0.616848, -0.8485047, 0, 0, 0, 1, 1,
-1.473876, -0.6983252, -3.093212, 1, 1, 1, 1, 1,
-1.460901, -0.8059986, -1.136094, 1, 1, 1, 1, 1,
-1.454148, 0.6577853, -2.217623, 1, 1, 1, 1, 1,
-1.449511, 0.8953655, -0.8944379, 1, 1, 1, 1, 1,
-1.441618, -0.1588632, -2.007796, 1, 1, 1, 1, 1,
-1.440011, -0.07170017, -1.619337, 1, 1, 1, 1, 1,
-1.431742, -0.1065841, -0.5320868, 1, 1, 1, 1, 1,
-1.403878, 1.355073, -0.04464572, 1, 1, 1, 1, 1,
-1.402215, -0.3913741, -0.9030285, 1, 1, 1, 1, 1,
-1.394793, -1.586802, -0.7890809, 1, 1, 1, 1, 1,
-1.389701, -0.7402567, -2.392926, 1, 1, 1, 1, 1,
-1.384556, -0.4064412, -1.676047, 1, 1, 1, 1, 1,
-1.3827, -2.260479, -1.80335, 1, 1, 1, 1, 1,
-1.376595, 1.798322, -1.739988, 1, 1, 1, 1, 1,
-1.35511, 0.663458, -2.389335, 1, 1, 1, 1, 1,
-1.348643, -0.4583239, -1.801414, 0, 0, 1, 1, 1,
-1.345075, -0.4257711, -1.422214, 1, 0, 0, 1, 1,
-1.331874, 1.074265, 0.3906862, 1, 0, 0, 1, 1,
-1.322255, -1.245089, -2.589968, 1, 0, 0, 1, 1,
-1.321844, -0.6986251, -2.068141, 1, 0, 0, 1, 1,
-1.310812, 0.3431426, -3.259061, 1, 0, 0, 1, 1,
-1.304793, 0.6545725, -1.098433, 0, 0, 0, 1, 1,
-1.30254, 1.381553, -0.05658733, 0, 0, 0, 1, 1,
-1.300476, 0.08298068, -0.9081504, 0, 0, 0, 1, 1,
-1.293103, -0.5478727, -2.51053, 0, 0, 0, 1, 1,
-1.281511, -1.307686, -3.595432, 0, 0, 0, 1, 1,
-1.279346, 0.5013662, -1.434082, 0, 0, 0, 1, 1,
-1.268134, -0.1614635, -0.663974, 0, 0, 0, 1, 1,
-1.260516, -2.420658, -1.635325, 1, 1, 1, 1, 1,
-1.257121, -1.884284, -1.672891, 1, 1, 1, 1, 1,
-1.251032, 1.40994, -1.209263, 1, 1, 1, 1, 1,
-1.245695, 0.9075028, -1.307083, 1, 1, 1, 1, 1,
-1.244992, -0.3660218, -2.338809, 1, 1, 1, 1, 1,
-1.244192, -0.9313897, -2.512913, 1, 1, 1, 1, 1,
-1.238821, 0.6980394, -1.787082, 1, 1, 1, 1, 1,
-1.235437, -0.9408228, -4.081005, 1, 1, 1, 1, 1,
-1.226433, 0.9173428, -2.534226, 1, 1, 1, 1, 1,
-1.22307, -1.319808, -1.795092, 1, 1, 1, 1, 1,
-1.222147, -0.2518252, 0.1582432, 1, 1, 1, 1, 1,
-1.220897, 0.4471943, -2.063653, 1, 1, 1, 1, 1,
-1.21647, -2.007652, -2.845895, 1, 1, 1, 1, 1,
-1.213688, -0.1412928, -2.571699, 1, 1, 1, 1, 1,
-1.20831, 1.515092, 0.719932, 1, 1, 1, 1, 1,
-1.205093, -0.6007138, -1.138943, 0, 0, 1, 1, 1,
-1.203897, 0.4906216, -1.897182, 1, 0, 0, 1, 1,
-1.196422, -0.6135101, -2.902258, 1, 0, 0, 1, 1,
-1.195774, 0.551319, -0.2591277, 1, 0, 0, 1, 1,
-1.190601, 0.5661705, -0.8296977, 1, 0, 0, 1, 1,
-1.180474, 1.132347, -0.09630534, 1, 0, 0, 1, 1,
-1.161116, -0.004212015, -1.111356, 0, 0, 0, 1, 1,
-1.138725, 0.8051347, -2.144571, 0, 0, 0, 1, 1,
-1.116818, -0.8965194, -2.55376, 0, 0, 0, 1, 1,
-1.110201, 0.4263719, -3.005255, 0, 0, 0, 1, 1,
-1.108609, -0.7972825, -3.359385, 0, 0, 0, 1, 1,
-1.101069, -2.489473, -2.413354, 0, 0, 0, 1, 1,
-1.091453, 0.4136379, -1.766143, 0, 0, 0, 1, 1,
-1.087716, 0.1963524, 0.2998257, 1, 1, 1, 1, 1,
-1.086816, 0.2822133, -0.6420152, 1, 1, 1, 1, 1,
-1.08676, 0.1299886, -1.95211, 1, 1, 1, 1, 1,
-1.076177, -1.232203, -3.397848, 1, 1, 1, 1, 1,
-1.069307, -1.155679, -1.260126, 1, 1, 1, 1, 1,
-1.066636, -2.985516, -2.444545, 1, 1, 1, 1, 1,
-1.066109, -0.5985243, -0.5486854, 1, 1, 1, 1, 1,
-1.065869, -1.368073, -1.875921, 1, 1, 1, 1, 1,
-1.063639, -0.3468771, -0.8283797, 1, 1, 1, 1, 1,
-1.062222, 0.9579462, -2.383544, 1, 1, 1, 1, 1,
-1.060267, -1.256737, -1.637649, 1, 1, 1, 1, 1,
-1.050377, 0.7012126, -0.588075, 1, 1, 1, 1, 1,
-1.049023, 0.8845899, -1.840188, 1, 1, 1, 1, 1,
-1.048535, -0.54665, -1.509183, 1, 1, 1, 1, 1,
-1.042755, -0.1288067, -1.600043, 1, 1, 1, 1, 1,
-1.034364, -0.5763438, -0.8644449, 0, 0, 1, 1, 1,
-1.032507, 0.1921939, -2.061785, 1, 0, 0, 1, 1,
-1.031492, -0.5647839, -1.743021, 1, 0, 0, 1, 1,
-1.031468, -0.5317516, -0.8755401, 1, 0, 0, 1, 1,
-1.028721, 1.773324, 0.2425001, 1, 0, 0, 1, 1,
-1.021306, -0.005291277, -1.279089, 1, 0, 0, 1, 1,
-1.019602, 0.3947116, -0.2565229, 0, 0, 0, 1, 1,
-1.019147, -1.070058, -2.208869, 0, 0, 0, 1, 1,
-1.015926, 0.2850328, -0.2648316, 0, 0, 0, 1, 1,
-1.012756, -0.1608746, -3.614498, 0, 0, 0, 1, 1,
-0.9958506, 2.053298, -0.4930902, 0, 0, 0, 1, 1,
-0.9842063, 0.4641114, -1.591894, 0, 0, 0, 1, 1,
-0.9835529, -1.237852, -3.35816, 0, 0, 0, 1, 1,
-0.9830005, 0.1104911, 0.1350599, 1, 1, 1, 1, 1,
-0.9813395, -0.4865173, -3.092058, 1, 1, 1, 1, 1,
-0.9796188, 0.1308209, -2.891859, 1, 1, 1, 1, 1,
-0.9739919, -2.083557, -1.314568, 1, 1, 1, 1, 1,
-0.9735867, -0.4475816, -1.490719, 1, 1, 1, 1, 1,
-0.9577019, 0.1135443, 0.002512433, 1, 1, 1, 1, 1,
-0.9551505, -0.3731856, -4.014288, 1, 1, 1, 1, 1,
-0.9536511, -1.311062, -4.500105, 1, 1, 1, 1, 1,
-0.9528659, -0.941345, -3.204891, 1, 1, 1, 1, 1,
-0.9488068, -0.3686738, -1.690853, 1, 1, 1, 1, 1,
-0.9448111, 1.302639, -1.196393, 1, 1, 1, 1, 1,
-0.9447623, 0.3235377, -3.083793, 1, 1, 1, 1, 1,
-0.9440013, -0.1623802, -3.324866, 1, 1, 1, 1, 1,
-0.939675, -1.167688, -1.931585, 1, 1, 1, 1, 1,
-0.9386386, -0.5868208, -3.634474, 1, 1, 1, 1, 1,
-0.9334806, -1.471522, -2.380136, 0, 0, 1, 1, 1,
-0.9315647, 1.88016, 0.3675377, 1, 0, 0, 1, 1,
-0.9266908, -0.5067074, -0.6393152, 1, 0, 0, 1, 1,
-0.9246311, -0.03755379, -0.9451326, 1, 0, 0, 1, 1,
-0.9232366, 1.064618, -0.4817722, 1, 0, 0, 1, 1,
-0.9225502, 0.700139, -1.370389, 1, 0, 0, 1, 1,
-0.9140884, -0.2510272, -1.495228, 0, 0, 0, 1, 1,
-0.9088925, 0.8522555, -1.504591, 0, 0, 0, 1, 1,
-0.8967237, -0.2478948, -2.910163, 0, 0, 0, 1, 1,
-0.8899487, 0.1294962, -1.097633, 0, 0, 0, 1, 1,
-0.8891839, -1.890818, -3.723084, 0, 0, 0, 1, 1,
-0.8840528, -0.5123237, -2.191959, 0, 0, 0, 1, 1,
-0.8799043, -1.109697, -3.325064, 0, 0, 0, 1, 1,
-0.8778243, 1.257212, -0.5585304, 1, 1, 1, 1, 1,
-0.8769243, 0.2410495, -0.9388173, 1, 1, 1, 1, 1,
-0.87257, -0.06950675, -1.326397, 1, 1, 1, 1, 1,
-0.8699831, 0.4766717, -0.382845, 1, 1, 1, 1, 1,
-0.8689683, -1.167464, -2.07762, 1, 1, 1, 1, 1,
-0.8606378, -3.196169, -2.702118, 1, 1, 1, 1, 1,
-0.8575988, 1.5738, 0.2083094, 1, 1, 1, 1, 1,
-0.8502288, 1.269097, -1.896577, 1, 1, 1, 1, 1,
-0.8499072, -1.15437, -3.490226, 1, 1, 1, 1, 1,
-0.8493015, -0.7471297, -3.453616, 1, 1, 1, 1, 1,
-0.8490016, 0.1541487, 0.7185269, 1, 1, 1, 1, 1,
-0.8447869, -0.3657934, -2.387969, 1, 1, 1, 1, 1,
-0.8445573, 1.037009, -0.3295862, 1, 1, 1, 1, 1,
-0.8444952, -0.5816028, -2.311096, 1, 1, 1, 1, 1,
-0.8430255, 0.5710401, -3.115808, 1, 1, 1, 1, 1,
-0.8392237, 0.5461846, 0.2920358, 0, 0, 1, 1, 1,
-0.8238853, -0.11752, -0.2778954, 1, 0, 0, 1, 1,
-0.8149976, -1.535773, -3.156398, 1, 0, 0, 1, 1,
-0.808662, 0.08870099, -0.9326327, 1, 0, 0, 1, 1,
-0.8079481, -0.758391, -2.650413, 1, 0, 0, 1, 1,
-0.7994922, 1.303468, -0.8406581, 1, 0, 0, 1, 1,
-0.7983064, -0.6127625, -1.349671, 0, 0, 0, 1, 1,
-0.7942847, 1.660704, -0.4653347, 0, 0, 0, 1, 1,
-0.7935888, -0.4038514, -1.952496, 0, 0, 0, 1, 1,
-0.7933839, 0.209867, 1.150471, 0, 0, 0, 1, 1,
-0.7929651, 1.37245, 0.6894079, 0, 0, 0, 1, 1,
-0.7920588, 0.6927289, -0.259635, 0, 0, 0, 1, 1,
-0.7912794, 0.07765973, -0.9008377, 0, 0, 0, 1, 1,
-0.7884891, 0.706898, -1.325396, 1, 1, 1, 1, 1,
-0.7882487, -0.968007, -3.819676, 1, 1, 1, 1, 1,
-0.7874889, 1.513438, -0.5786048, 1, 1, 1, 1, 1,
-0.7857348, -0.492975, -2.940841, 1, 1, 1, 1, 1,
-0.7797434, -0.8163465, -2.882229, 1, 1, 1, 1, 1,
-0.7789111, 0.08729011, -0.7274861, 1, 1, 1, 1, 1,
-0.7787633, 0.1210568, -0.7143027, 1, 1, 1, 1, 1,
-0.7754906, -0.3757825, -2.021621, 1, 1, 1, 1, 1,
-0.7637818, -0.177308, -2.763756, 1, 1, 1, 1, 1,
-0.7629306, 0.2716658, -0.1291424, 1, 1, 1, 1, 1,
-0.7470289, 1.503018, -0.3701586, 1, 1, 1, 1, 1,
-0.7468967, -0.5401835, -2.941481, 1, 1, 1, 1, 1,
-0.744557, -0.2817768, -3.615028, 1, 1, 1, 1, 1,
-0.7443536, 0.7971311, -0.4318759, 1, 1, 1, 1, 1,
-0.7397412, 0.4392647, -0.08235201, 1, 1, 1, 1, 1,
-0.7393817, 0.5146403, 1.006859, 0, 0, 1, 1, 1,
-0.7349861, -0.7889057, -4.982309, 1, 0, 0, 1, 1,
-0.7337464, 0.7114275, -0.420357, 1, 0, 0, 1, 1,
-0.7284129, -0.5946882, -2.361246, 1, 0, 0, 1, 1,
-0.7238669, 1.747077, -2.242535, 1, 0, 0, 1, 1,
-0.7220986, 1.729703, 0.1798308, 1, 0, 0, 1, 1,
-0.7208745, 0.3831216, -1.384923, 0, 0, 0, 1, 1,
-0.7172735, 0.6846514, -0.8732976, 0, 0, 0, 1, 1,
-0.7152496, -0.2994198, -0.8299026, 0, 0, 0, 1, 1,
-0.713249, 0.6309708, -2.038675, 0, 0, 0, 1, 1,
-0.7016336, 0.6979211, -1.884267, 0, 0, 0, 1, 1,
-0.6997157, 1.564987, -0.3951547, 0, 0, 0, 1, 1,
-0.6951005, -0.9262803, -2.840489, 0, 0, 0, 1, 1,
-0.6946875, 0.9955564, -2.261558, 1, 1, 1, 1, 1,
-0.6899624, -1.243783, -2.450708, 1, 1, 1, 1, 1,
-0.6898608, 1.452848, -1.817295, 1, 1, 1, 1, 1,
-0.6880637, -0.6632906, -0.4602365, 1, 1, 1, 1, 1,
-0.6834437, 0.379005, -0.8133293, 1, 1, 1, 1, 1,
-0.6791903, -0.03777582, -1.758421, 1, 1, 1, 1, 1,
-0.6790811, 1.124353, 0.1211004, 1, 1, 1, 1, 1,
-0.6780263, -1.758871, -2.009598, 1, 1, 1, 1, 1,
-0.6774343, -0.1126084, -0.2057536, 1, 1, 1, 1, 1,
-0.6767486, -2.251415, -3.486871, 1, 1, 1, 1, 1,
-0.669903, -2.189661, -2.508848, 1, 1, 1, 1, 1,
-0.6696615, -1.115434, -1.054222, 1, 1, 1, 1, 1,
-0.6642529, 0.02191388, -0.1072471, 1, 1, 1, 1, 1,
-0.6614926, -0.2435295, -0.9339677, 1, 1, 1, 1, 1,
-0.6611497, 0.7734219, -0.7009114, 1, 1, 1, 1, 1,
-0.6592388, -3.413143, -1.709627, 0, 0, 1, 1, 1,
-0.6547353, 0.700757, -0.4747434, 1, 0, 0, 1, 1,
-0.6543006, 1.347631, 0.1996006, 1, 0, 0, 1, 1,
-0.6480468, -0.8606189, -4.815217, 1, 0, 0, 1, 1,
-0.6414976, 0.4033361, -0.9379122, 1, 0, 0, 1, 1,
-0.6406403, -0.2029636, -1.326018, 1, 0, 0, 1, 1,
-0.6305183, 0.9762352, 2.229098, 0, 0, 0, 1, 1,
-0.6231316, 0.1829087, -0.8082749, 0, 0, 0, 1, 1,
-0.6142417, 0.7156203, -1.411316, 0, 0, 0, 1, 1,
-0.6139812, -0.6433308, -2.901889, 0, 0, 0, 1, 1,
-0.6118721, -0.3138893, -2.012962, 0, 0, 0, 1, 1,
-0.6085923, 0.6189339, -0.5001942, 0, 0, 0, 1, 1,
-0.6044234, -0.1275242, -1.200302, 0, 0, 0, 1, 1,
-0.603745, 3.593621, 0.5681156, 1, 1, 1, 1, 1,
-0.6016557, 0.8353806, -1.964181, 1, 1, 1, 1, 1,
-0.6008231, -1.724686, -2.490762, 1, 1, 1, 1, 1,
-0.6001678, -0.97321, -0.992723, 1, 1, 1, 1, 1,
-0.5974788, 0.926052, -1.384552, 1, 1, 1, 1, 1,
-0.5971837, 0.9201621, -0.9705649, 1, 1, 1, 1, 1,
-0.5961411, -0.6628617, -2.650209, 1, 1, 1, 1, 1,
-0.5918377, 0.3819625, 0.8878055, 1, 1, 1, 1, 1,
-0.5897502, 0.1400856, -2.088549, 1, 1, 1, 1, 1,
-0.5896616, 1.252427, -2.347831, 1, 1, 1, 1, 1,
-0.5843857, 0.3295112, -0.1097099, 1, 1, 1, 1, 1,
-0.5801019, -0.5998585, -2.669116, 1, 1, 1, 1, 1,
-0.5794143, 2.106375, -0.003077149, 1, 1, 1, 1, 1,
-0.5780141, 0.6124551, -0.7491341, 1, 1, 1, 1, 1,
-0.5756059, -0.2941369, -1.868372, 1, 1, 1, 1, 1,
-0.5740248, 0.3490122, -2.336512, 0, 0, 1, 1, 1,
-0.5710955, -1.640138, -1.884456, 1, 0, 0, 1, 1,
-0.5708532, -0.08860248, -0.5005445, 1, 0, 0, 1, 1,
-0.5701846, -1.468252, -3.649349, 1, 0, 0, 1, 1,
-0.5646539, 1.749037, 0.4790314, 1, 0, 0, 1, 1,
-0.5609168, 1.273577, 0.5264159, 1, 0, 0, 1, 1,
-0.5552595, 2.069364, 0.6145376, 0, 0, 0, 1, 1,
-0.5541893, 0.1020485, -2.793367, 0, 0, 0, 1, 1,
-0.5534567, -0.9952853, -2.293005, 0, 0, 0, 1, 1,
-0.5523536, 1.833857, 0.08747549, 0, 0, 0, 1, 1,
-0.5481324, -1.459856, -1.686718, 0, 0, 0, 1, 1,
-0.5434775, 1.122214, -2.42657, 0, 0, 0, 1, 1,
-0.5410714, -0.4711261, -0.07330637, 0, 0, 0, 1, 1,
-0.5358124, 0.9689853, -0.8464132, 1, 1, 1, 1, 1,
-0.5321549, 1.290718, -1.082551, 1, 1, 1, 1, 1,
-0.5302199, -0.5741131, -1.910602, 1, 1, 1, 1, 1,
-0.5294362, -0.2149757, -1.874943, 1, 1, 1, 1, 1,
-0.5260198, 1.123472, -1.278128, 1, 1, 1, 1, 1,
-0.5185994, 0.6822541, 0.04506963, 1, 1, 1, 1, 1,
-0.5154355, 0.8649144, -2.199584, 1, 1, 1, 1, 1,
-0.5131038, -0.6512999, -3.604857, 1, 1, 1, 1, 1,
-0.5118209, -1.320608, -3.163008, 1, 1, 1, 1, 1,
-0.504954, 0.9629271, -0.8158884, 1, 1, 1, 1, 1,
-0.4985619, 0.005766094, -1.320611, 1, 1, 1, 1, 1,
-0.4953691, 0.2987741, -3.831469, 1, 1, 1, 1, 1,
-0.4938369, 1.045785, -0.3745082, 1, 1, 1, 1, 1,
-0.4935791, 0.3203844, -0.2180556, 1, 1, 1, 1, 1,
-0.4823208, -1.431265, -1.9055, 1, 1, 1, 1, 1,
-0.4777803, -0.1162661, -1.729328, 0, 0, 1, 1, 1,
-0.47565, -1.321432, -3.124445, 1, 0, 0, 1, 1,
-0.4716479, -1.232039, -2.827903, 1, 0, 0, 1, 1,
-0.4709053, -0.4592879, -3.545888, 1, 0, 0, 1, 1,
-0.4690664, -0.7061424, -3.585875, 1, 0, 0, 1, 1,
-0.4689997, 1.566426, 1.104694, 1, 0, 0, 1, 1,
-0.4656435, 0.3482583, -2.215, 0, 0, 0, 1, 1,
-0.4643241, -0.9082627, -3.44081, 0, 0, 0, 1, 1,
-0.4617945, 0.4000387, 0.406312, 0, 0, 0, 1, 1,
-0.4584377, -1.587445, -1.892499, 0, 0, 0, 1, 1,
-0.4516389, 1.566551, -1.128735, 0, 0, 0, 1, 1,
-0.4497812, -0.6441603, -3.76661, 0, 0, 0, 1, 1,
-0.4453546, -0.5294749, -1.503043, 0, 0, 0, 1, 1,
-0.4438209, 0.0241726, -2.967369, 1, 1, 1, 1, 1,
-0.4409449, -2.171033, -3.07444, 1, 1, 1, 1, 1,
-0.4402494, -0.2331271, -0.9858844, 1, 1, 1, 1, 1,
-0.4382824, -0.4551249, -3.270155, 1, 1, 1, 1, 1,
-0.434031, -0.07755372, -0.8796358, 1, 1, 1, 1, 1,
-0.4338008, 0.2756226, -1.015227, 1, 1, 1, 1, 1,
-0.4323118, -0.9334232, -2.545212, 1, 1, 1, 1, 1,
-0.4304336, 0.347747, 0.2379905, 1, 1, 1, 1, 1,
-0.4303859, -0.1509916, -1.405074, 1, 1, 1, 1, 1,
-0.4279694, -0.8163001, -4.4663, 1, 1, 1, 1, 1,
-0.4229324, 0.6077291, -1.360459, 1, 1, 1, 1, 1,
-0.417878, -1.407408, -2.399499, 1, 1, 1, 1, 1,
-0.4157464, -0.3384895, -2.995134, 1, 1, 1, 1, 1,
-0.4130451, 0.1249259, -0.09136575, 1, 1, 1, 1, 1,
-0.4118314, -1.085828, -0.3707731, 1, 1, 1, 1, 1,
-0.4086021, -0.05907109, -1.651586, 0, 0, 1, 1, 1,
-0.4079827, 0.4872376, -1.774331, 1, 0, 0, 1, 1,
-0.4073553, 0.2678629, -0.7758159, 1, 0, 0, 1, 1,
-0.4058188, 0.2998227, -0.8909438, 1, 0, 0, 1, 1,
-0.3981962, -0.8759893, -2.884072, 1, 0, 0, 1, 1,
-0.3912212, 0.3418422, -0.7806683, 1, 0, 0, 1, 1,
-0.3911815, -0.5598828, -0.6406837, 0, 0, 0, 1, 1,
-0.3872393, -2.427156, -2.138932, 0, 0, 0, 1, 1,
-0.3858937, -0.1776114, -2.556984, 0, 0, 0, 1, 1,
-0.3841195, 0.314022, -3.039516, 0, 0, 0, 1, 1,
-0.3840837, -1.341544, -4.546956, 0, 0, 0, 1, 1,
-0.3818463, -1.341407, -2.227169, 0, 0, 0, 1, 1,
-0.3793708, -1.398446, -2.5248, 0, 0, 0, 1, 1,
-0.3788647, -0.6525702, -2.584278, 1, 1, 1, 1, 1,
-0.3774584, -0.1749364, -1.798476, 1, 1, 1, 1, 1,
-0.3747207, 1.634442, -0.366827, 1, 1, 1, 1, 1,
-0.3745591, 0.3301518, 0.8704763, 1, 1, 1, 1, 1,
-0.373542, 0.3215437, -0.1453626, 1, 1, 1, 1, 1,
-0.3700151, -1.071437, -2.622955, 1, 1, 1, 1, 1,
-0.3686744, -0.3083196, -3.106794, 1, 1, 1, 1, 1,
-0.3649837, -0.3415939, -1.403783, 1, 1, 1, 1, 1,
-0.3633127, 0.7539679, 0.5714204, 1, 1, 1, 1, 1,
-0.3618648, 0.5075003, -3.602122, 1, 1, 1, 1, 1,
-0.354285, -1.525977, -3.070603, 1, 1, 1, 1, 1,
-0.3530294, -0.7189406, -2.099418, 1, 1, 1, 1, 1,
-0.3490016, -0.160727, -2.138521, 1, 1, 1, 1, 1,
-0.3480671, 1.525087, -1.857047, 1, 1, 1, 1, 1,
-0.3425202, 0.9737329, -0.3231541, 1, 1, 1, 1, 1,
-0.3380634, -0.01551127, -1.601639, 0, 0, 1, 1, 1,
-0.3378983, 1.638826, 0.7201092, 1, 0, 0, 1, 1,
-0.336458, -0.03156292, -1.096781, 1, 0, 0, 1, 1,
-0.3342527, 0.06919096, -3.15869, 1, 0, 0, 1, 1,
-0.3280217, 0.3367998, -0.5644137, 1, 0, 0, 1, 1,
-0.3182236, 0.546711, -0.2284391, 1, 0, 0, 1, 1,
-0.3170169, 1.125018, -0.1655785, 0, 0, 0, 1, 1,
-0.3155792, 0.9388347, -0.3601043, 0, 0, 0, 1, 1,
-0.3133353, -0.1467146, -1.79625, 0, 0, 0, 1, 1,
-0.3087775, 0.2880351, -1.452531, 0, 0, 0, 1, 1,
-0.3074804, 1.934966, -0.3189753, 0, 0, 0, 1, 1,
-0.3068462, -2.137647, -4.0532, 0, 0, 0, 1, 1,
-0.3057186, 0.4679227, 0.9750272, 0, 0, 0, 1, 1,
-0.3044322, -3.002715, -2.664561, 1, 1, 1, 1, 1,
-0.302946, 0.7060022, -0.9995458, 1, 1, 1, 1, 1,
-0.3020905, 0.4174521, -1.364604, 1, 1, 1, 1, 1,
-0.2931549, -1.075739, -2.766691, 1, 1, 1, 1, 1,
-0.2840906, 0.8024483, -0.3319538, 1, 1, 1, 1, 1,
-0.2795388, 1.469231, -2.256321, 1, 1, 1, 1, 1,
-0.2777847, 0.6049606, -2.779892, 1, 1, 1, 1, 1,
-0.2767521, -0.9103427, -2.848278, 1, 1, 1, 1, 1,
-0.2751555, -1.622172, -1.830693, 1, 1, 1, 1, 1,
-0.2746179, -0.8241329, -4.2932, 1, 1, 1, 1, 1,
-0.2677945, -0.1773527, -2.175314, 1, 1, 1, 1, 1,
-0.2610644, -0.9741422, -4.698159, 1, 1, 1, 1, 1,
-0.2553355, -1.308906, -2.43713, 1, 1, 1, 1, 1,
-0.2538105, 0.4730254, -0.7898753, 1, 1, 1, 1, 1,
-0.253437, 0.9396854, -1.037261, 1, 1, 1, 1, 1,
-0.2509111, 0.580235, 0.1308492, 0, 0, 1, 1, 1,
-0.2453903, -1.714646, -2.630509, 1, 0, 0, 1, 1,
-0.242503, -0.6437517, -2.201163, 1, 0, 0, 1, 1,
-0.2424336, -0.9640731, -3.57226, 1, 0, 0, 1, 1,
-0.2391595, 0.7530583, -0.9012381, 1, 0, 0, 1, 1,
-0.2356011, 0.390938, 0.2380514, 1, 0, 0, 1, 1,
-0.2348593, -0.989972, -3.285819, 0, 0, 0, 1, 1,
-0.228718, -0.3208107, -3.975025, 0, 0, 0, 1, 1,
-0.2263725, -0.7336375, -3.623312, 0, 0, 0, 1, 1,
-0.2259508, -0.01810941, -1.382081, 0, 0, 0, 1, 1,
-0.2246532, -0.8336014, -3.320935, 0, 0, 0, 1, 1,
-0.2244079, -0.4796024, -2.698687, 0, 0, 0, 1, 1,
-0.221679, -0.3801951, -1.215836, 0, 0, 0, 1, 1,
-0.2193982, -1.06924, -1.847356, 1, 1, 1, 1, 1,
-0.2168165, -0.9572326, -1.04467, 1, 1, 1, 1, 1,
-0.214757, 0.9432876, 0.5358378, 1, 1, 1, 1, 1,
-0.2125895, -0.499425, -5.198133, 1, 1, 1, 1, 1,
-0.2073667, -0.4523147, -3.249736, 1, 1, 1, 1, 1,
-0.2002676, 1.303366, -0.02300406, 1, 1, 1, 1, 1,
-0.1971686, -1.500044, -1.932286, 1, 1, 1, 1, 1,
-0.1964077, 0.4932182, 0.2675394, 1, 1, 1, 1, 1,
-0.1956258, 0.5573819, -1.515192, 1, 1, 1, 1, 1,
-0.1938417, 1.299473, 1.855354, 1, 1, 1, 1, 1,
-0.182775, 1.342561, -1.723204, 1, 1, 1, 1, 1,
-0.1820207, 0.7720631, 1.413392, 1, 1, 1, 1, 1,
-0.1793782, 1.109754, -0.6406454, 1, 1, 1, 1, 1,
-0.1778226, -1.234805, -3.539255, 1, 1, 1, 1, 1,
-0.1752931, -1.515867, -4.056329, 1, 1, 1, 1, 1,
-0.175071, 0.1258827, 0.2756802, 0, 0, 1, 1, 1,
-0.1696409, -1.174601, -3.339911, 1, 0, 0, 1, 1,
-0.1687109, 0.4537883, -0.9183663, 1, 0, 0, 1, 1,
-0.1672281, -0.4378188, -3.908572, 1, 0, 0, 1, 1,
-0.1637311, -1.155123, -5.010719, 1, 0, 0, 1, 1,
-0.1629321, 0.9343932, 0.285758, 1, 0, 0, 1, 1,
-0.1574955, 1.420471, 0.6392296, 0, 0, 0, 1, 1,
-0.1550193, -0.5766469, -3.667937, 0, 0, 0, 1, 1,
-0.1541158, 0.5306769, 0.1846729, 0, 0, 0, 1, 1,
-0.1533699, -0.9364997, -2.190922, 0, 0, 0, 1, 1,
-0.1533484, 0.1400681, -1.738288, 0, 0, 0, 1, 1,
-0.1511004, -0.9154313, -1.925763, 0, 0, 0, 1, 1,
-0.1509428, -0.06586529, -5.328697, 0, 0, 0, 1, 1,
-0.1499738, 2.953372, 0.05394914, 1, 1, 1, 1, 1,
-0.1474832, 0.82443, -0.186094, 1, 1, 1, 1, 1,
-0.1457961, -0.6025195, -4.347372, 1, 1, 1, 1, 1,
-0.1429905, 0.4478592, 0.9497859, 1, 1, 1, 1, 1,
-0.142574, -0.9648474, -4.022548, 1, 1, 1, 1, 1,
-0.1423869, -1.557733, -4.162614, 1, 1, 1, 1, 1,
-0.1392611, -0.6693333, -3.166701, 1, 1, 1, 1, 1,
-0.1389394, -0.3519194, -2.788124, 1, 1, 1, 1, 1,
-0.1352362, 0.9393034, -0.09701452, 1, 1, 1, 1, 1,
-0.1325953, 0.3157621, -0.237471, 1, 1, 1, 1, 1,
-0.1289947, 0.8872902, 1.913043, 1, 1, 1, 1, 1,
-0.1252022, -1.158318, -2.819072, 1, 1, 1, 1, 1,
-0.1118759, -0.5873731, -2.991874, 1, 1, 1, 1, 1,
-0.1091611, -0.03459958, 0.4843162, 1, 1, 1, 1, 1,
-0.1047223, 1.535585, 0.9703444, 1, 1, 1, 1, 1,
-0.1040702, 0.8064534, -1.406111, 0, 0, 1, 1, 1,
-0.1037751, -0.6392908, -3.763938, 1, 0, 0, 1, 1,
-0.103511, 0.3542918, -1.315972, 1, 0, 0, 1, 1,
-0.1020439, 0.1512814, -0.253171, 1, 0, 0, 1, 1,
-0.09627013, -0.9122044, -0.7623453, 1, 0, 0, 1, 1,
-0.09319157, 1.722196, 1.111095, 1, 0, 0, 1, 1,
-0.0915387, 0.9501023, 0.6005699, 0, 0, 0, 1, 1,
-0.09026733, 1.599058, 0.1202971, 0, 0, 0, 1, 1,
-0.08945244, 2.045255, 0.2950464, 0, 0, 0, 1, 1,
-0.08838111, -0.9624119, -2.628385, 0, 0, 0, 1, 1,
-0.08810937, -0.4944126, -2.547153, 0, 0, 0, 1, 1,
-0.08596556, 0.8222293, 1.061096, 0, 0, 0, 1, 1,
-0.08531284, 0.7459179, -0.3850342, 0, 0, 0, 1, 1,
-0.08254103, -0.5103446, -3.678297, 1, 1, 1, 1, 1,
-0.08242476, 0.4677229, -1.599736, 1, 1, 1, 1, 1,
-0.0807112, 0.1071927, 0.7907442, 1, 1, 1, 1, 1,
-0.07919294, 0.4231113, -0.6775089, 1, 1, 1, 1, 1,
-0.07802331, 0.08796336, -2.082286, 1, 1, 1, 1, 1,
-0.0739374, 0.6766201, -0.6533499, 1, 1, 1, 1, 1,
-0.06363399, 0.3937964, -0.7320531, 1, 1, 1, 1, 1,
-0.06252584, 0.3153017, -0.2180402, 1, 1, 1, 1, 1,
-0.06188247, 0.5996041, 0.007488458, 1, 1, 1, 1, 1,
-0.05956745, 0.0478441, 0.3923755, 1, 1, 1, 1, 1,
-0.05741034, -1.029902, -3.381434, 1, 1, 1, 1, 1,
-0.05681712, 0.1306293, 0.2319453, 1, 1, 1, 1, 1,
-0.05614025, 0.496121, -1.348882, 1, 1, 1, 1, 1,
-0.05388224, -0.5564609, -1.848558, 1, 1, 1, 1, 1,
-0.0512541, -0.6033014, -0.885008, 1, 1, 1, 1, 1,
-0.04437899, -0.1805149, -1.577574, 0, 0, 1, 1, 1,
-0.03900732, -1.293873, -1.846777, 1, 0, 0, 1, 1,
-0.03705465, 1.218566, -1.518319, 1, 0, 0, 1, 1,
-0.03575855, -0.2948468, -3.33796, 1, 0, 0, 1, 1,
-0.03125213, -0.1588642, -2.043564, 1, 0, 0, 1, 1,
-0.02202127, -0.3271392, -3.422899, 1, 0, 0, 1, 1,
-0.02089384, -0.06886214, -3.831045, 0, 0, 0, 1, 1,
-0.0163004, 1.019054, -0.9979918, 0, 0, 0, 1, 1,
-0.01012637, 0.1721688, -1.488601, 0, 0, 0, 1, 1,
-0.009683104, -0.5596678, -3.410417, 0, 0, 0, 1, 1,
-0.007150593, 0.3289725, -0.7751983, 0, 0, 0, 1, 1,
-0.006561007, 0.8496626, -0.6441166, 0, 0, 0, 1, 1,
-0.006091398, -1.468537, -2.559527, 0, 0, 0, 1, 1,
-0.002565401, -0.1495468, -3.401706, 1, 1, 1, 1, 1,
0.005519278, 0.9729872, 0.003043878, 1, 1, 1, 1, 1,
0.007126621, 0.6008654, -0.7541131, 1, 1, 1, 1, 1,
0.009091337, -0.5982873, 4.129632, 1, 1, 1, 1, 1,
0.01328047, -1.201238, 4.899457, 1, 1, 1, 1, 1,
0.01377992, 0.1028023, 0.6879638, 1, 1, 1, 1, 1,
0.01425522, 2.18326, 0.2077345, 1, 1, 1, 1, 1,
0.0146057, 0.5390473, 0.1392234, 1, 1, 1, 1, 1,
0.01583597, 0.1618755, -0.3498332, 1, 1, 1, 1, 1,
0.01853894, 0.9134868, 0.2261049, 1, 1, 1, 1, 1,
0.02005618, -0.2664208, 3.075684, 1, 1, 1, 1, 1,
0.02026869, -1.577544, 2.743081, 1, 1, 1, 1, 1,
0.02393431, 1.973247, 2.025424, 1, 1, 1, 1, 1,
0.02814359, 1.059162, -0.1028198, 1, 1, 1, 1, 1,
0.03594328, 0.4781237, -0.5365056, 1, 1, 1, 1, 1,
0.03733974, -0.8773902, 3.905154, 0, 0, 1, 1, 1,
0.03749212, 1.489976, -0.01201296, 1, 0, 0, 1, 1,
0.03806984, -0.0157009, 1.402612, 1, 0, 0, 1, 1,
0.03934783, 1.031851, 0.5976726, 1, 0, 0, 1, 1,
0.05268433, 1.362165, 0.4243083, 1, 0, 0, 1, 1,
0.05276501, -0.5753783, 4.547967, 1, 0, 0, 1, 1,
0.05295303, 0.1292177, 0.2441181, 0, 0, 0, 1, 1,
0.05572877, -0.2183678, 1.921573, 0, 0, 0, 1, 1,
0.05577287, -0.204806, 3.371325, 0, 0, 0, 1, 1,
0.06054421, 0.1182943, -0.167587, 0, 0, 0, 1, 1,
0.06075097, 0.6908761, -0.6518551, 0, 0, 0, 1, 1,
0.06153426, 0.4051209, -1.194453, 0, 0, 0, 1, 1,
0.06224437, -0.6696393, 2.230781, 0, 0, 0, 1, 1,
0.06520323, -0.6577476, 1.872789, 1, 1, 1, 1, 1,
0.06554592, 0.5383883, -0.2104204, 1, 1, 1, 1, 1,
0.06727391, -0.385484, 3.570477, 1, 1, 1, 1, 1,
0.06798116, -1.134819, 4.246672, 1, 1, 1, 1, 1,
0.08091728, 0.7796776, -0.2001656, 1, 1, 1, 1, 1,
0.08143137, 0.2581697, -0.253861, 1, 1, 1, 1, 1,
0.08657245, -0.5005375, 2.049145, 1, 1, 1, 1, 1,
0.08727966, -1.295227, 3.126438, 1, 1, 1, 1, 1,
0.09307545, 0.1664234, -0.2992526, 1, 1, 1, 1, 1,
0.09698412, 0.1112989, -1.016769, 1, 1, 1, 1, 1,
0.0996497, -0.8185911, 4.681498, 1, 1, 1, 1, 1,
0.09980094, -1.404506, 2.979975, 1, 1, 1, 1, 1,
0.1001509, -0.2662297, 2.714316, 1, 1, 1, 1, 1,
0.1024191, 0.855025, -1.929478, 1, 1, 1, 1, 1,
0.1029882, 1.303117, -0.8318835, 1, 1, 1, 1, 1,
0.1048577, -0.1740482, 1.402052, 0, 0, 1, 1, 1,
0.1072793, -0.2655909, 2.451598, 1, 0, 0, 1, 1,
0.1091916, 0.379599, -0.1493409, 1, 0, 0, 1, 1,
0.1099636, -1.898055, 2.260815, 1, 0, 0, 1, 1,
0.1121956, -0.5448875, 1.133289, 1, 0, 0, 1, 1,
0.1195206, -1.23941, 2.643805, 1, 0, 0, 1, 1,
0.1201929, 0.8540234, -0.7634141, 0, 0, 0, 1, 1,
0.1251063, 0.9435357, 0.1166744, 0, 0, 0, 1, 1,
0.1263406, 0.728121, 1.761109, 0, 0, 0, 1, 1,
0.1297407, 0.7906443, 1.172384, 0, 0, 0, 1, 1,
0.1315505, 1.236451, -0.412567, 0, 0, 0, 1, 1,
0.1362685, 0.005001911, 1.980119, 0, 0, 0, 1, 1,
0.1375293, 0.2693484, -0.9021049, 0, 0, 0, 1, 1,
0.1402402, 0.8166249, -1.20936, 1, 1, 1, 1, 1,
0.1404945, 0.4240683, 2.045158, 1, 1, 1, 1, 1,
0.1449651, 1.316744, 1.270532, 1, 1, 1, 1, 1,
0.1538816, -0.08830158, 3.644791, 1, 1, 1, 1, 1,
0.154537, 0.4399112, -0.875316, 1, 1, 1, 1, 1,
0.1563678, 0.4664756, -0.9531581, 1, 1, 1, 1, 1,
0.1583738, -0.07539991, 0.4930834, 1, 1, 1, 1, 1,
0.1586122, -0.697286, 4.674073, 1, 1, 1, 1, 1,
0.165842, 1.250278, -0.698833, 1, 1, 1, 1, 1,
0.1693839, 0.6096007, 1.8656, 1, 1, 1, 1, 1,
0.1748596, -0.7530084, 3.54416, 1, 1, 1, 1, 1,
0.1775611, 1.210885, -0.9673095, 1, 1, 1, 1, 1,
0.1780796, -0.3078278, 3.464331, 1, 1, 1, 1, 1,
0.1874522, -1.514584, 1.906276, 1, 1, 1, 1, 1,
0.1890765, 1.12525, -0.3786972, 1, 1, 1, 1, 1,
0.1902554, 0.7294091, -0.4788955, 0, 0, 1, 1, 1,
0.1926042, -0.03964465, 2.270395, 1, 0, 0, 1, 1,
0.1960951, -1.0749, 1.76675, 1, 0, 0, 1, 1,
0.1982307, -0.3413083, 1.859865, 1, 0, 0, 1, 1,
0.2046465, 2.26753, 0.3443767, 1, 0, 0, 1, 1,
0.2062119, -1.229137, 3.704748, 1, 0, 0, 1, 1,
0.2065132, 1.578176, -1.351703, 0, 0, 0, 1, 1,
0.2066176, -0.8199981, 2.370833, 0, 0, 0, 1, 1,
0.2111875, 0.4171163, -0.9809492, 0, 0, 0, 1, 1,
0.2210452, 0.62062, 0.006615439, 0, 0, 0, 1, 1,
0.2270312, -0.1986496, 2.435491, 0, 0, 0, 1, 1,
0.2350105, 0.9155863, 2.068103, 0, 0, 0, 1, 1,
0.2395362, 0.07575927, 1.590238, 0, 0, 0, 1, 1,
0.2407593, -0.4750634, -0.2701471, 1, 1, 1, 1, 1,
0.2411791, -0.09560821, 1.823923, 1, 1, 1, 1, 1,
0.2418428, -2.021487, 4.381497, 1, 1, 1, 1, 1,
0.2516615, -0.127506, 3.755155, 1, 1, 1, 1, 1,
0.2517598, -0.5292259, 1.988969, 1, 1, 1, 1, 1,
0.2519086, -0.3443566, 2.570656, 1, 1, 1, 1, 1,
0.2558655, -1.000685, 3.955765, 1, 1, 1, 1, 1,
0.2629128, 1.126313, -0.8881704, 1, 1, 1, 1, 1,
0.2647626, -2.211185, 2.566983, 1, 1, 1, 1, 1,
0.2689564, 1.573333, 2.524297, 1, 1, 1, 1, 1,
0.2707271, -0.002509866, 3.012631, 1, 1, 1, 1, 1,
0.2715634, 0.484199, -0.3423528, 1, 1, 1, 1, 1,
0.2726665, 0.6944159, 0.2618375, 1, 1, 1, 1, 1,
0.2730627, -1.668303, 4.694394, 1, 1, 1, 1, 1,
0.2736465, -1.46411, 3.201927, 1, 1, 1, 1, 1,
0.2770156, -0.5775688, 2.984979, 0, 0, 1, 1, 1,
0.277465, 0.2890037, 1.155526, 1, 0, 0, 1, 1,
0.2791571, -1.752431, 2.234466, 1, 0, 0, 1, 1,
0.2796948, -0.001229121, 2.428309, 1, 0, 0, 1, 1,
0.281495, -0.1406888, 1.990604, 1, 0, 0, 1, 1,
0.2823037, 0.9841853, -2.044492, 1, 0, 0, 1, 1,
0.2881009, -1.629343, 4.411341, 0, 0, 0, 1, 1,
0.2904529, 0.8732247, 0.6145287, 0, 0, 0, 1, 1,
0.2910844, 1.73118, 0.1435213, 0, 0, 0, 1, 1,
0.2943042, 0.1840776, 1.905255, 0, 0, 0, 1, 1,
0.2973776, -0.1241324, 2.212601, 0, 0, 0, 1, 1,
0.3037074, 1.19775, 0.9477018, 0, 0, 0, 1, 1,
0.3061163, -1.414707, 3.160567, 0, 0, 0, 1, 1,
0.3069772, 0.90499, 2.562243, 1, 1, 1, 1, 1,
0.3095498, -0.592759, 4.358626, 1, 1, 1, 1, 1,
0.3102681, -0.8302459, 2.399347, 1, 1, 1, 1, 1,
0.3169285, 1.841642, 0.1194962, 1, 1, 1, 1, 1,
0.3189171, -0.5141374, 2.884644, 1, 1, 1, 1, 1,
0.3193358, -1.35339, 2.657906, 1, 1, 1, 1, 1,
0.3193702, 0.1547951, 0.2423258, 1, 1, 1, 1, 1,
0.3206337, 1.60481, 1.56975, 1, 1, 1, 1, 1,
0.3231646, 1.395206, -0.3508525, 1, 1, 1, 1, 1,
0.3241023, -1.836461, 2.306654, 1, 1, 1, 1, 1,
0.3275017, -0.07582213, -0.05138715, 1, 1, 1, 1, 1,
0.3281082, -0.1977942, 3.747137, 1, 1, 1, 1, 1,
0.3285723, 0.5982797, -1.042984, 1, 1, 1, 1, 1,
0.3295827, -1.24457, 3.409687, 1, 1, 1, 1, 1,
0.329952, -1.106443, 1.2875, 1, 1, 1, 1, 1,
0.3300535, -2.854971, 2.979846, 0, 0, 1, 1, 1,
0.3359595, 0.8008714, 2.175095, 1, 0, 0, 1, 1,
0.3371897, -0.5039663, 0.9913654, 1, 0, 0, 1, 1,
0.3381747, 0.009735398, 2.352901, 1, 0, 0, 1, 1,
0.3392824, -0.9921851, 3.16992, 1, 0, 0, 1, 1,
0.3427569, 0.4461478, 0.4705589, 1, 0, 0, 1, 1,
0.3472188, 1.095843, 0.5230824, 0, 0, 0, 1, 1,
0.3474355, 0.4012104, 0.05905307, 0, 0, 0, 1, 1,
0.3479395, -0.412036, 3.38574, 0, 0, 0, 1, 1,
0.3569331, 0.06487583, -0.2126204, 0, 0, 0, 1, 1,
0.3632801, -0.06844683, 2.24006, 0, 0, 0, 1, 1,
0.364622, -0.1187515, 3.421016, 0, 0, 0, 1, 1,
0.3666448, 0.08037779, 2.358839, 0, 0, 0, 1, 1,
0.3667528, -0.8004473, 2.317937, 1, 1, 1, 1, 1,
0.3756223, 0.6187665, 0.8088501, 1, 1, 1, 1, 1,
0.3785753, -0.1276963, 0.3673842, 1, 1, 1, 1, 1,
0.3794823, 1.10356, -0.9828156, 1, 1, 1, 1, 1,
0.3817693, 2.439077, 0.8379312, 1, 1, 1, 1, 1,
0.3868203, 0.1324537, 2.250808, 1, 1, 1, 1, 1,
0.3881851, 1.527331, 0.0577009, 1, 1, 1, 1, 1,
0.3885401, -1.37621, 1.677668, 1, 1, 1, 1, 1,
0.3906173, 1.154896, -1.983663, 1, 1, 1, 1, 1,
0.3918807, 2.384993, -0.7871459, 1, 1, 1, 1, 1,
0.3939275, -0.7384011, 2.837113, 1, 1, 1, 1, 1,
0.4031508, 1.774881, 0.159708, 1, 1, 1, 1, 1,
0.4064762, -1.02194, 2.022047, 1, 1, 1, 1, 1,
0.4064838, -0.6271424, 1.413914, 1, 1, 1, 1, 1,
0.4073954, -0.4381236, 1.252137, 1, 1, 1, 1, 1,
0.4079171, -1.108216, 3.936634, 0, 0, 1, 1, 1,
0.4161726, 0.996116, 1.749902, 1, 0, 0, 1, 1,
0.4198314, 1.546046, 1.059194, 1, 0, 0, 1, 1,
0.4229272, -1.197704, 3.581882, 1, 0, 0, 1, 1,
0.4267956, 2.331568, -1.133818, 1, 0, 0, 1, 1,
0.4284199, 0.6371969, 0.7177633, 1, 0, 0, 1, 1,
0.4336366, 2.731829, 1.212986, 0, 0, 0, 1, 1,
0.4439347, -2.116193, 2.36556, 0, 0, 0, 1, 1,
0.4447774, -0.4769183, 2.763891, 0, 0, 0, 1, 1,
0.4503003, -0.08528762, 2.890786, 0, 0, 0, 1, 1,
0.4525616, -0.9229378, 2.192241, 0, 0, 0, 1, 1,
0.4546148, -1.40762, 1.935595, 0, 0, 0, 1, 1,
0.4664309, 0.8928326, 1.123233, 0, 0, 0, 1, 1,
0.4723901, 0.01958618, 0.3857709, 1, 1, 1, 1, 1,
0.4726044, 1.909516, -0.7679995, 1, 1, 1, 1, 1,
0.4742774, -0.8047503, 3.314242, 1, 1, 1, 1, 1,
0.4764688, 0.05026068, 0.3110065, 1, 1, 1, 1, 1,
0.478042, 0.0253836, 0.5685018, 1, 1, 1, 1, 1,
0.4810598, 0.3444395, -0.005687388, 1, 1, 1, 1, 1,
0.4866674, -1.392619, 1.870333, 1, 1, 1, 1, 1,
0.4872508, 1.236656, -0.3119412, 1, 1, 1, 1, 1,
0.4922168, -0.1231586, 3.231561, 1, 1, 1, 1, 1,
0.4930777, 0.6652531, -0.4654337, 1, 1, 1, 1, 1,
0.4988188, 0.6593442, -0.6839861, 1, 1, 1, 1, 1,
0.5001921, -1.625171, 5.001875, 1, 1, 1, 1, 1,
0.5017456, 0.5156105, 0.792503, 1, 1, 1, 1, 1,
0.502732, -0.3422975, 0.7491275, 1, 1, 1, 1, 1,
0.5037674, -0.6705544, 1.436013, 1, 1, 1, 1, 1,
0.5047395, -0.3730957, 2.282871, 0, 0, 1, 1, 1,
0.5079143, 0.3802851, 0.6855679, 1, 0, 0, 1, 1,
0.5149188, -0.1864703, 1.486245, 1, 0, 0, 1, 1,
0.5171509, 0.441509, 2.064903, 1, 0, 0, 1, 1,
0.5200707, -1.082221, 2.343691, 1, 0, 0, 1, 1,
0.5250011, -0.08856556, 3.472901, 1, 0, 0, 1, 1,
0.5335261, -1.299899, 2.657897, 0, 0, 0, 1, 1,
0.5399317, -1.518263, 2.040914, 0, 0, 0, 1, 1,
0.5448923, -0.1547371, 1.484208, 0, 0, 0, 1, 1,
0.5469486, 0.6870391, 0.8081104, 0, 0, 0, 1, 1,
0.5481972, -0.8390176, 2.329257, 0, 0, 0, 1, 1,
0.551219, -0.3624805, 3.344748, 0, 0, 0, 1, 1,
0.5525283, 0.6554532, 0.2871989, 0, 0, 0, 1, 1,
0.5526664, 0.6587198, -0.2084456, 1, 1, 1, 1, 1,
0.5548784, -1.172001, 1.696839, 1, 1, 1, 1, 1,
0.5564541, 0.9875424, 0.5839778, 1, 1, 1, 1, 1,
0.5596566, 0.5603476, -0.06309822, 1, 1, 1, 1, 1,
0.5642994, 0.9553776, 1.026862, 1, 1, 1, 1, 1,
0.5647223, -1.165675, 3.788703, 1, 1, 1, 1, 1,
0.5658687, 0.2271258, 1.405021, 1, 1, 1, 1, 1,
0.5669534, 1.039338, 0.5199811, 1, 1, 1, 1, 1,
0.5679023, 0.6073589, 0.9476099, 1, 1, 1, 1, 1,
0.56998, 0.6031843, 1.288036, 1, 1, 1, 1, 1,
0.5762978, -1.007288, 3.836631, 1, 1, 1, 1, 1,
0.5778434, 0.4681188, -0.6699114, 1, 1, 1, 1, 1,
0.5788794, 0.630609, 0.3882287, 1, 1, 1, 1, 1,
0.5799897, 1.176832, 0.8365117, 1, 1, 1, 1, 1,
0.5805007, 1.222213, 1.497026, 1, 1, 1, 1, 1,
0.5828652, 0.8541455, 1.025956, 0, 0, 1, 1, 1,
0.5848785, -0.4380869, 2.46946, 1, 0, 0, 1, 1,
0.5857654, 0.1117655, 0.3724481, 1, 0, 0, 1, 1,
0.5859278, -0.4726678, 1.759408, 1, 0, 0, 1, 1,
0.590197, 1.137264, -0.4497301, 1, 0, 0, 1, 1,
0.5935401, -0.7141728, 1.956943, 1, 0, 0, 1, 1,
0.5943061, -0.2560042, 1.465139, 0, 0, 0, 1, 1,
0.5945213, 0.5734193, 0.01591869, 0, 0, 0, 1, 1,
0.5956764, -0.7079549, 1.287044, 0, 0, 0, 1, 1,
0.5993054, -0.9358632, 3.592705, 0, 0, 0, 1, 1,
0.5996455, -0.3309101, 1.734987, 0, 0, 0, 1, 1,
0.6000023, 0.7685582, 3.040206, 0, 0, 0, 1, 1,
0.6008161, -0.5233432, 4.35657, 0, 0, 0, 1, 1,
0.6068156, -1.003343, 2.700441, 1, 1, 1, 1, 1,
0.6079302, 0.004494638, 1.55424, 1, 1, 1, 1, 1,
0.6150663, -0.09432645, 2.055665, 1, 1, 1, 1, 1,
0.6153647, -2.409457, 5.951271, 1, 1, 1, 1, 1,
0.6237089, 0.3035745, 1.015274, 1, 1, 1, 1, 1,
0.6318744, -0.8587704, 1.079886, 1, 1, 1, 1, 1,
0.6334372, 0.9947307, 0.1445725, 1, 1, 1, 1, 1,
0.644792, -0.5330226, 2.475454, 1, 1, 1, 1, 1,
0.6474239, -1.130759, 1.649585, 1, 1, 1, 1, 1,
0.6481785, -0.5944199, 2.984089, 1, 1, 1, 1, 1,
0.6515574, -1.143746, 3.463228, 1, 1, 1, 1, 1,
0.6595517, -0.08850652, 2.733963, 1, 1, 1, 1, 1,
0.6711471, 0.9499463, 0.1836434, 1, 1, 1, 1, 1,
0.671943, -0.01439911, 1.658494, 1, 1, 1, 1, 1,
0.6722453, -1.187266, 4.066841, 1, 1, 1, 1, 1,
0.6755286, 1.280047, 0.1227841, 0, 0, 1, 1, 1,
0.6791143, 0.08451788, 1.453448, 1, 0, 0, 1, 1,
0.6860021, -0.7489261, 1.991134, 1, 0, 0, 1, 1,
0.6882598, -1.553939, 3.320031, 1, 0, 0, 1, 1,
0.6886297, 0.5399235, 1.54564, 1, 0, 0, 1, 1,
0.6889364, -0.03841812, 1.718788, 1, 0, 0, 1, 1,
0.6890289, -0.04227347, 3.210319, 0, 0, 0, 1, 1,
0.6998889, -0.1710592, 2.366919, 0, 0, 0, 1, 1,
0.6999441, -0.3818276, 2.405357, 0, 0, 0, 1, 1,
0.7022176, -1.16441, 2.627822, 0, 0, 0, 1, 1,
0.70346, -0.5685875, 1.258288, 0, 0, 0, 1, 1,
0.704321, -0.6985235, 1.731393, 0, 0, 0, 1, 1,
0.7054882, -0.9829202, 2.013238, 0, 0, 0, 1, 1,
0.7074774, -0.0467713, 2.023908, 1, 1, 1, 1, 1,
0.7080031, -1.07362, 1.087298, 1, 1, 1, 1, 1,
0.708375, -1.683875, 3.681685, 1, 1, 1, 1, 1,
0.7117315, 0.116112, 1.422894, 1, 1, 1, 1, 1,
0.7138512, -0.7461661, 2.890722, 1, 1, 1, 1, 1,
0.7164021, -1.543156, 3.00526, 1, 1, 1, 1, 1,
0.7173058, 1.563162, 0.9263306, 1, 1, 1, 1, 1,
0.7194986, 0.5648218, 1.118953, 1, 1, 1, 1, 1,
0.7211386, -0.2750011, 3.276128, 1, 1, 1, 1, 1,
0.7230705, 2.024781, 2.056271, 1, 1, 1, 1, 1,
0.7267032, 0.3487388, -0.01743079, 1, 1, 1, 1, 1,
0.7276525, -0.1225905, 2.094278, 1, 1, 1, 1, 1,
0.7285008, 0.9611036, 0.7652354, 1, 1, 1, 1, 1,
0.7409553, 2.077327, -0.2265521, 1, 1, 1, 1, 1,
0.7418226, -2.349638, 2.965119, 1, 1, 1, 1, 1,
0.7569792, 2.345193, 1.507315, 0, 0, 1, 1, 1,
0.7581002, -0.5573338, 2.024828, 1, 0, 0, 1, 1,
0.7595038, -1.213978, 0.6254428, 1, 0, 0, 1, 1,
0.7618133, 0.05923134, 2.823569, 1, 0, 0, 1, 1,
0.7618489, 0.4018107, 0.6512253, 1, 0, 0, 1, 1,
0.7629705, -0.3765191, 2.553223, 1, 0, 0, 1, 1,
0.7630293, -1.641448, 3.906294, 0, 0, 0, 1, 1,
0.7655597, -1.413349, 1.646271, 0, 0, 0, 1, 1,
0.7690355, 0.4290007, 0.8370278, 0, 0, 0, 1, 1,
0.7712609, -0.3522884, 2.717688, 0, 0, 0, 1, 1,
0.7737257, -0.7844931, 3.904165, 0, 0, 0, 1, 1,
0.7783341, 0.7599102, 1.225897, 0, 0, 0, 1, 1,
0.7841645, 0.2438237, 1.16625, 0, 0, 0, 1, 1,
0.7848389, 0.3461014, -0.02740508, 1, 1, 1, 1, 1,
0.7854035, 0.4811458, 2.553397, 1, 1, 1, 1, 1,
0.7877085, 1.599977, 0.8273264, 1, 1, 1, 1, 1,
0.7947441, -0.09693393, 2.390819, 1, 1, 1, 1, 1,
0.7949684, 0.1003668, 1.612254, 1, 1, 1, 1, 1,
0.7982771, -1.697482, 2.101221, 1, 1, 1, 1, 1,
0.8011332, -0.6756035, 2.785577, 1, 1, 1, 1, 1,
0.8041718, 2.197154, 1.260022, 1, 1, 1, 1, 1,
0.8078229, -0.6274626, 2.984504, 1, 1, 1, 1, 1,
0.8115527, -1.645386, 2.995475, 1, 1, 1, 1, 1,
0.8123603, 0.3896808, 1.002928, 1, 1, 1, 1, 1,
0.8139058, 2.132384, 0.134433, 1, 1, 1, 1, 1,
0.8178502, 0.5876041, -0.2822087, 1, 1, 1, 1, 1,
0.8208702, 1.772821, 0.05782219, 1, 1, 1, 1, 1,
0.8217647, 0.4478654, -0.5564146, 1, 1, 1, 1, 1,
0.8278221, 0.1054656, 1.831365, 0, 0, 1, 1, 1,
0.8305691, 0.3767013, 2.113856, 1, 0, 0, 1, 1,
0.8332846, -0.7312091, 2.531635, 1, 0, 0, 1, 1,
0.8422693, 0.4629141, 1.542442, 1, 0, 0, 1, 1,
0.8426995, -0.7562957, 2.668763, 1, 0, 0, 1, 1,
0.8549809, -0.2611175, 1.806379, 1, 0, 0, 1, 1,
0.8559759, -0.5660099, 2.186234, 0, 0, 0, 1, 1,
0.8562009, 0.2807773, 0.3570289, 0, 0, 0, 1, 1,
0.8566854, -0.5721315, 1.431799, 0, 0, 0, 1, 1,
0.8592116, -0.4453856, 1.99024, 0, 0, 0, 1, 1,
0.8613969, -1.063113, 1.865186, 0, 0, 0, 1, 1,
0.8630876, 0.5047589, 0.9039528, 0, 0, 0, 1, 1,
0.8693081, -0.5175791, 1.483674, 0, 0, 0, 1, 1,
0.8724245, -0.3366326, 1.652005, 1, 1, 1, 1, 1,
0.8787912, -1.130802, 1.23022, 1, 1, 1, 1, 1,
0.8788283, -0.5858938, 1.763078, 1, 1, 1, 1, 1,
0.8788313, -0.3692384, -1.503604, 1, 1, 1, 1, 1,
0.8812814, 0.6169137, -0.1758774, 1, 1, 1, 1, 1,
0.8958931, -1.734274, 2.37806, 1, 1, 1, 1, 1,
0.8962154, 0.8240435, -0.2603485, 1, 1, 1, 1, 1,
0.9008984, -1.125128, 3.625667, 1, 1, 1, 1, 1,
0.901847, 0.1778153, 1.639573, 1, 1, 1, 1, 1,
0.9031529, 1.339436, -0.3289488, 1, 1, 1, 1, 1,
0.9051616, 0.5341769, 0.04764177, 1, 1, 1, 1, 1,
0.9063987, -0.1404882, 2.826828, 1, 1, 1, 1, 1,
0.9100465, -0.2664317, 1.175059, 1, 1, 1, 1, 1,
0.9126186, -1.239163, 2.48152, 1, 1, 1, 1, 1,
0.9153143, -0.1684203, 1.844034, 1, 1, 1, 1, 1,
0.9158356, 0.3575128, 0.6960726, 0, 0, 1, 1, 1,
0.9192428, -0.1042737, 2.040843, 1, 0, 0, 1, 1,
0.9254127, 1.641704, 0.8452349, 1, 0, 0, 1, 1,
0.9255703, -0.6025169, 1.912148, 1, 0, 0, 1, 1,
0.9333231, 0.004164282, 1.759557, 1, 0, 0, 1, 1,
0.9387456, -0.5681263, 2.436017, 1, 0, 0, 1, 1,
0.9422518, 0.1375425, 0.8441595, 0, 0, 0, 1, 1,
0.948724, 0.612859, -0.1223969, 0, 0, 0, 1, 1,
0.9510159, 0.4169885, -0.8192492, 0, 0, 0, 1, 1,
0.9527044, -0.3997936, 1.554299, 0, 0, 0, 1, 1,
0.9556279, 1.134823, 1.090716, 0, 0, 0, 1, 1,
0.9596374, -1.571309, 4.071785, 0, 0, 0, 1, 1,
0.9646438, -0.3307159, 1.173922, 0, 0, 0, 1, 1,
0.9664098, 0.5629261, -1.16767, 1, 1, 1, 1, 1,
0.9668108, -1.174372, 2.293345, 1, 1, 1, 1, 1,
0.9830585, -2.25825, 1.769352, 1, 1, 1, 1, 1,
0.9939508, -0.7239898, 0.6634626, 1, 1, 1, 1, 1,
1.003062, 0.08307011, 1.302434, 1, 1, 1, 1, 1,
1.006265, 1.251314, 0.4795908, 1, 1, 1, 1, 1,
1.00711, 1.221773, 1.62854, 1, 1, 1, 1, 1,
1.008098, 1.364771, 2.071047, 1, 1, 1, 1, 1,
1.010301, -0.2053287, 1.782666, 1, 1, 1, 1, 1,
1.012648, 0.1745455, -1.031565, 1, 1, 1, 1, 1,
1.01283, 1.872573, -1.152565, 1, 1, 1, 1, 1,
1.014844, -0.1571153, 1.576735, 1, 1, 1, 1, 1,
1.016407, 0.8737769, 0.653204, 1, 1, 1, 1, 1,
1.018294, -1.377045, 2.633702, 1, 1, 1, 1, 1,
1.023556, 0.735505, 0.9276594, 1, 1, 1, 1, 1,
1.028698, -2.327939, 4.21678, 0, 0, 1, 1, 1,
1.031961, -0.9617028, 2.989293, 1, 0, 0, 1, 1,
1.042567, 0.5722318, 1.192522, 1, 0, 0, 1, 1,
1.04281, -2.029999, 3.153156, 1, 0, 0, 1, 1,
1.048179, -1.877657, 3.938072, 1, 0, 0, 1, 1,
1.050677, 0.3246558, 0.7315651, 1, 0, 0, 1, 1,
1.050698, 0.7220746, 1.364705, 0, 0, 0, 1, 1,
1.056153, 0.7494747, 1.593407, 0, 0, 0, 1, 1,
1.056918, 0.7164376, 1.032254, 0, 0, 0, 1, 1,
1.064304, -0.4003007, 1.185959, 0, 0, 0, 1, 1,
1.065949, -0.759053, 2.537483, 0, 0, 0, 1, 1,
1.072852, 1.781346, -0.1545869, 0, 0, 0, 1, 1,
1.076369, 1.177538, 1.952422, 0, 0, 0, 1, 1,
1.077117, -1.368856, 1.367682, 1, 1, 1, 1, 1,
1.078555, 0.4421773, 1.109732, 1, 1, 1, 1, 1,
1.088493, 0.9404336, -0.6501532, 1, 1, 1, 1, 1,
1.095237, -2.059099, 2.622699, 1, 1, 1, 1, 1,
1.096577, 1.184031, -0.05325509, 1, 1, 1, 1, 1,
1.107299, 0.9826527, 0.9400622, 1, 1, 1, 1, 1,
1.112836, -0.2004878, 0.7075405, 1, 1, 1, 1, 1,
1.113891, -1.687548, 3.373165, 1, 1, 1, 1, 1,
1.127809, 0.3695064, 1.999142, 1, 1, 1, 1, 1,
1.137303, 0.7044649, 0.289416, 1, 1, 1, 1, 1,
1.137775, 0.3673482, 2.242859, 1, 1, 1, 1, 1,
1.139402, -1.104045, 2.235482, 1, 1, 1, 1, 1,
1.15369, 0.9791319, 0.1423095, 1, 1, 1, 1, 1,
1.158254, 0.5642055, -0.1450269, 1, 1, 1, 1, 1,
1.16125, -0.1625843, 2.501753, 1, 1, 1, 1, 1,
1.16154, 0.6883202, 1.927776, 0, 0, 1, 1, 1,
1.162005, 0.4190505, 1.660698, 1, 0, 0, 1, 1,
1.168736, -0.3002588, 3.631932, 1, 0, 0, 1, 1,
1.171842, 1.016266, -0.7791167, 1, 0, 0, 1, 1,
1.174044, 2.456496, 1.628675, 1, 0, 0, 1, 1,
1.174275, -1.015781, 2.826226, 1, 0, 0, 1, 1,
1.188154, -0.4164194, 3.416017, 0, 0, 0, 1, 1,
1.191013, 0.2122108, 0.9277065, 0, 0, 0, 1, 1,
1.193763, -1.316594, 1.145886, 0, 0, 0, 1, 1,
1.199464, 0.08478278, 3.568758, 0, 0, 0, 1, 1,
1.202133, 0.4209682, 2.89072, 0, 0, 0, 1, 1,
1.209413, -0.8280343, 2.341793, 0, 0, 0, 1, 1,
1.214579, 0.8431745, 0.2495377, 0, 0, 0, 1, 1,
1.214729, -0.2847971, 1.553289, 1, 1, 1, 1, 1,
1.214843, 1.396548, 0.8332016, 1, 1, 1, 1, 1,
1.219934, 0.2746596, 1.405402, 1, 1, 1, 1, 1,
1.220707, 1.688408, 0.1465813, 1, 1, 1, 1, 1,
1.221637, -0.1307895, 1.111482, 1, 1, 1, 1, 1,
1.231189, 1.577398, 0.12414, 1, 1, 1, 1, 1,
1.234504, 0.573054, 2.114984, 1, 1, 1, 1, 1,
1.235103, 1.055519, 0.1735303, 1, 1, 1, 1, 1,
1.2529, -0.7514996, 0.5477028, 1, 1, 1, 1, 1,
1.255679, -0.001110106, 0.646071, 1, 1, 1, 1, 1,
1.261056, -0.2953753, 1.685523, 1, 1, 1, 1, 1,
1.262524, -1.122505, 1.960211, 1, 1, 1, 1, 1,
1.264314, -0.6227598, 4.488991, 1, 1, 1, 1, 1,
1.264562, -0.9031729, 2.043521, 1, 1, 1, 1, 1,
1.268233, -1.675758, 3.107427, 1, 1, 1, 1, 1,
1.275043, -0.7557002, 1.103881, 0, 0, 1, 1, 1,
1.279403, -1.086835, 2.559619, 1, 0, 0, 1, 1,
1.279856, 1.934191, 1.320446, 1, 0, 0, 1, 1,
1.283672, 0.560186, 0.09984284, 1, 0, 0, 1, 1,
1.287113, -0.6113979, -0.03949455, 1, 0, 0, 1, 1,
1.289246, -0.7370794, 4.23242, 1, 0, 0, 1, 1,
1.309006, 1.036011, 2.734687, 0, 0, 0, 1, 1,
1.311302, -2.367654, 3.531107, 0, 0, 0, 1, 1,
1.328224, 2.627322, 1.973568, 0, 0, 0, 1, 1,
1.329525, -0.09670157, 2.691798, 0, 0, 0, 1, 1,
1.33276, 0.1560089, 0.5795054, 0, 0, 0, 1, 1,
1.341282, 1.418062, 0.5303316, 0, 0, 0, 1, 1,
1.34144, 1.585923, -0.4338129, 0, 0, 0, 1, 1,
1.348083, -1.305013, 0.1791493, 1, 1, 1, 1, 1,
1.350395, 0.7383016, 2.470999, 1, 1, 1, 1, 1,
1.35237, -0.2893268, 0.9603512, 1, 1, 1, 1, 1,
1.358171, -0.235462, 1.918877, 1, 1, 1, 1, 1,
1.366012, 0.61506, 2.535062, 1, 1, 1, 1, 1,
1.378471, 1.636595, 0.08546659, 1, 1, 1, 1, 1,
1.382452, -0.3136201, 2.037447, 1, 1, 1, 1, 1,
1.391358, 0.587307, 3.23374, 1, 1, 1, 1, 1,
1.403528, -0.9731731, 2.613898, 1, 1, 1, 1, 1,
1.405654, 0.9909389, 1.062293, 1, 1, 1, 1, 1,
1.41558, -0.6494963, 2.500798, 1, 1, 1, 1, 1,
1.416013, 1.190531, 1.62855, 1, 1, 1, 1, 1,
1.416519, 0.3773066, 2.396003, 1, 1, 1, 1, 1,
1.417424, -1.855761, 3.532082, 1, 1, 1, 1, 1,
1.427082, 1.315844, 0.9425808, 1, 1, 1, 1, 1,
1.433441, 0.7887036, 1.262131, 0, 0, 1, 1, 1,
1.446464, 0.3441628, 1.336743, 1, 0, 0, 1, 1,
1.470836, 1.525748, -0.235425, 1, 0, 0, 1, 1,
1.471229, -0.7682146, 1.309265, 1, 0, 0, 1, 1,
1.474051, -1.554947, 2.321275, 1, 0, 0, 1, 1,
1.474677, -0.1027047, 1.736236, 1, 0, 0, 1, 1,
1.475436, 0.2376766, 1.635791, 0, 0, 0, 1, 1,
1.481844, -1.005965, 0.9155314, 0, 0, 0, 1, 1,
1.488611, -0.1814447, 2.078459, 0, 0, 0, 1, 1,
1.494381, -0.3226488, 2.058659, 0, 0, 0, 1, 1,
1.507685, 0.4243151, 1.452438, 0, 0, 0, 1, 1,
1.514578, -1.448465, 3.638813, 0, 0, 0, 1, 1,
1.518142, -0.2244988, 3.379169, 0, 0, 0, 1, 1,
1.523213, -0.1678042, 2.366878, 1, 1, 1, 1, 1,
1.527737, 1.03567, 1.386558, 1, 1, 1, 1, 1,
1.529271, 0.935819, 3.617328, 1, 1, 1, 1, 1,
1.544779, -0.6732606, 1.807022, 1, 1, 1, 1, 1,
1.549929, 0.9865962, 0.9127768, 1, 1, 1, 1, 1,
1.553655, -1.117383, 2.153001, 1, 1, 1, 1, 1,
1.559564, 0.8407174, 2.341502, 1, 1, 1, 1, 1,
1.563745, 1.268865, -0.7889801, 1, 1, 1, 1, 1,
1.570827, 0.7772011, -0.3529525, 1, 1, 1, 1, 1,
1.58918, 0.2831781, 2.56064, 1, 1, 1, 1, 1,
1.600306, -1.035314, 2.732069, 1, 1, 1, 1, 1,
1.600477, 1.114326, 2.958288, 1, 1, 1, 1, 1,
1.612017, 0.7526427, 1.603827, 1, 1, 1, 1, 1,
1.614104, -0.3167863, 0.2334499, 1, 1, 1, 1, 1,
1.615366, -0.6053089, 2.003122, 1, 1, 1, 1, 1,
1.621057, 1.380748, 2.019307, 0, 0, 1, 1, 1,
1.623279, -0.641883, 3.24289, 1, 0, 0, 1, 1,
1.666274, 1.166603, 0.4434421, 1, 0, 0, 1, 1,
1.67142, -1.561105, 3.177454, 1, 0, 0, 1, 1,
1.692863, 0.541114, 2.843536, 1, 0, 0, 1, 1,
1.696414, 0.6496025, 1.604149, 1, 0, 0, 1, 1,
1.698681, -1.567335, 1.888472, 0, 0, 0, 1, 1,
1.713091, -0.6271455, 3.989205, 0, 0, 0, 1, 1,
1.717844, -1.091023, 1.566067, 0, 0, 0, 1, 1,
1.722035, 0.8431164, 1.927186, 0, 0, 0, 1, 1,
1.730811, -1.019653, 1.984445, 0, 0, 0, 1, 1,
1.732597, 1.501681, 3.346706, 0, 0, 0, 1, 1,
1.765424, 1.786524, 1.088263, 0, 0, 0, 1, 1,
1.766301, -0.0646112, 0.5556853, 1, 1, 1, 1, 1,
1.779153, -1.065009, 0.0852454, 1, 1, 1, 1, 1,
1.794487, -0.4178632, 1.181011, 1, 1, 1, 1, 1,
1.800892, -1.423536, 1.046238, 1, 1, 1, 1, 1,
1.834499, 0.1391761, 0.1946517, 1, 1, 1, 1, 1,
1.84417, -0.6609652, 1.482239, 1, 1, 1, 1, 1,
1.878819, 1.094608, 2.03643, 1, 1, 1, 1, 1,
1.883435, 0.9565572, 1.332054, 1, 1, 1, 1, 1,
1.94657, 0.9658194, 1.137123, 1, 1, 1, 1, 1,
1.951351, -2.284527, 2.481005, 1, 1, 1, 1, 1,
1.957346, 1.234694, 1.553808, 1, 1, 1, 1, 1,
1.964291, -0.6533563, 1.118039, 1, 1, 1, 1, 1,
1.98775, -1.46972, 2.484709, 1, 1, 1, 1, 1,
2.026103, 0.08465705, 0.8146421, 1, 1, 1, 1, 1,
2.037467, -1.092349, 4.310411, 1, 1, 1, 1, 1,
2.069745, 0.1187493, 0.4110763, 0, 0, 1, 1, 1,
2.074536, -0.02507456, -0.002650639, 1, 0, 0, 1, 1,
2.075092, 0.7218279, 4.880794, 1, 0, 0, 1, 1,
2.103275, -0.8158067, 1.591677, 1, 0, 0, 1, 1,
2.11382, 0.5750992, 1.860772, 1, 0, 0, 1, 1,
2.124583, -0.648005, 1.576123, 1, 0, 0, 1, 1,
2.175439, 0.9005417, 1.949287, 0, 0, 0, 1, 1,
2.242703, -0.383076, 1.937121, 0, 0, 0, 1, 1,
2.259999, -1.366025, 4.764468, 0, 0, 0, 1, 1,
2.280641, 0.1273342, 2.089284, 0, 0, 0, 1, 1,
2.335574, 0.3385289, 2.104275, 0, 0, 0, 1, 1,
2.345835, -0.2062224, 2.686506, 0, 0, 0, 1, 1,
2.386594, -0.5754492, 0.1145041, 0, 0, 0, 1, 1,
2.389259, -0.8109861, 2.157074, 1, 1, 1, 1, 1,
2.443734, 0.8120712, 2.837088, 1, 1, 1, 1, 1,
2.52699, -0.804724, 2.121636, 1, 1, 1, 1, 1,
2.664094, 0.4111414, 1.440132, 1, 1, 1, 1, 1,
3.262701, 0.4595012, 3.180844, 1, 1, 1, 1, 1,
3.431897, 0.4521205, 1.064219, 1, 1, 1, 1, 1,
4.308205, 0.5607888, 1.006069, 1, 1, 1, 1, 1
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
var radius = 10.37937;
var distance = 36.4571;
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
mvMatrix.translate( -0.3418846, -0.09023881, -0.3112872 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.4571);
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
