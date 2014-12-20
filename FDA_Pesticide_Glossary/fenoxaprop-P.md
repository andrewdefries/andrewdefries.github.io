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
-3.346849, 0.7704128, -0.3202617, 1, 0, 0, 1,
-3.037588, -0.8206711, -3.582476, 1, 0.007843138, 0, 1,
-2.931073, -1.442063, -1.416807, 1, 0.01176471, 0, 1,
-2.862118, 1.190687, -2.732553, 1, 0.01960784, 0, 1,
-2.693832, 0.1138753, -0.2086716, 1, 0.02352941, 0, 1,
-2.668066, 1.486855, -1.421606, 1, 0.03137255, 0, 1,
-2.453226, -1.076522, -3.060942, 1, 0.03529412, 0, 1,
-2.443585, 0.6326129, -1.356777, 1, 0.04313726, 0, 1,
-2.331542, 0.3622212, 0.8483907, 1, 0.04705882, 0, 1,
-2.330671, 0.1067062, -1.325493, 1, 0.05490196, 0, 1,
-2.306662, 1.344495, -0.2357901, 1, 0.05882353, 0, 1,
-2.247426, -1.258885, -3.770738, 1, 0.06666667, 0, 1,
-2.238478, 2.142028, 0.06063946, 1, 0.07058824, 0, 1,
-2.2117, 0.9475445, -0.3096688, 1, 0.07843138, 0, 1,
-2.210091, -0.01701797, -0.8970201, 1, 0.08235294, 0, 1,
-2.207566, -0.9686909, -3.035892, 1, 0.09019608, 0, 1,
-2.17478, 2.7078, 0.1296444, 1, 0.09411765, 0, 1,
-2.167228, 1.294827, -1.454953, 1, 0.1019608, 0, 1,
-2.136251, -0.1399467, -1.388938, 1, 0.1098039, 0, 1,
-2.126011, 1.025732, -0.5617898, 1, 0.1137255, 0, 1,
-2.091314, -1.73513, -3.557842, 1, 0.1215686, 0, 1,
-2.066892, -0.3725642, -2.019299, 1, 0.1254902, 0, 1,
-2.054243, 0.7480823, -1.882286, 1, 0.1333333, 0, 1,
-2.035416, -0.9486758, 0.006917472, 1, 0.1372549, 0, 1,
-2.033285, 0.5048635, -2.380193, 1, 0.145098, 0, 1,
-2.029888, 0.3305314, -3.220855, 1, 0.1490196, 0, 1,
-1.967286, -0.437356, -2.4921, 1, 0.1568628, 0, 1,
-1.958627, 0.696382, -1.934751, 1, 0.1607843, 0, 1,
-1.957753, -1.338736, -2.262221, 1, 0.1686275, 0, 1,
-1.93736, 0.5376881, 1.213373, 1, 0.172549, 0, 1,
-1.907918, 0.003645658, -2.4703, 1, 0.1803922, 0, 1,
-1.869359, 1.076678, -1.356576, 1, 0.1843137, 0, 1,
-1.857495, -0.3529596, -1.322874, 1, 0.1921569, 0, 1,
-1.854087, -0.4716337, -1.893132, 1, 0.1960784, 0, 1,
-1.843069, -0.3988542, -2.303245, 1, 0.2039216, 0, 1,
-1.840843, 0.8337555, -0.1775979, 1, 0.2117647, 0, 1,
-1.824059, 1.796917, -1.779521, 1, 0.2156863, 0, 1,
-1.816611, -0.5361078, -1.228411, 1, 0.2235294, 0, 1,
-1.789408, 0.2780821, -2.961949, 1, 0.227451, 0, 1,
-1.78654, 1.786814, -1.375117, 1, 0.2352941, 0, 1,
-1.773527, -0.7359715, -1.855159, 1, 0.2392157, 0, 1,
-1.733823, -1.288695, -2.527798, 1, 0.2470588, 0, 1,
-1.712034, -0.6898264, -1.819036, 1, 0.2509804, 0, 1,
-1.698789, -0.6489945, -2.851973, 1, 0.2588235, 0, 1,
-1.694004, -1.290716, -2.575042, 1, 0.2627451, 0, 1,
-1.692704, 1.035605, -0.6888549, 1, 0.2705882, 0, 1,
-1.680858, 1.374042, 0.1667648, 1, 0.2745098, 0, 1,
-1.677999, -0.4130322, -1.972218, 1, 0.282353, 0, 1,
-1.653655, 0.8987699, -2.76276, 1, 0.2862745, 0, 1,
-1.653409, -0.573719, -1.060422, 1, 0.2941177, 0, 1,
-1.638208, 0.3015962, -0.6847987, 1, 0.3019608, 0, 1,
-1.63421, -0.2881735, -0.8764473, 1, 0.3058824, 0, 1,
-1.626692, 0.1319748, -0.8926775, 1, 0.3137255, 0, 1,
-1.617412, -0.4567903, -3.622258, 1, 0.3176471, 0, 1,
-1.605274, -1.243162, -1.62182, 1, 0.3254902, 0, 1,
-1.550249, -0.4864644, 0.1863454, 1, 0.3294118, 0, 1,
-1.536898, -0.6631827, -2.005954, 1, 0.3372549, 0, 1,
-1.518128, -0.2966138, -1.776543, 1, 0.3411765, 0, 1,
-1.50566, -1.833839, -3.196645, 1, 0.3490196, 0, 1,
-1.505322, -1.245134, -2.717439, 1, 0.3529412, 0, 1,
-1.50433, 0.4309351, -2.475779, 1, 0.3607843, 0, 1,
-1.502498, 0.2678761, -1.751282, 1, 0.3647059, 0, 1,
-1.499327, 0.5289207, -1.229477, 1, 0.372549, 0, 1,
-1.485112, 0.606597, -1.699098, 1, 0.3764706, 0, 1,
-1.474338, -0.872229, -1.707192, 1, 0.3843137, 0, 1,
-1.464968, -0.02361862, -0.8155049, 1, 0.3882353, 0, 1,
-1.461641, 0.6974152, -0.6675053, 1, 0.3960784, 0, 1,
-1.460742, -1.040488, -2.482649, 1, 0.4039216, 0, 1,
-1.456813, -0.5839747, -3.740251, 1, 0.4078431, 0, 1,
-1.434757, 0.04676128, 0.5695562, 1, 0.4156863, 0, 1,
-1.426654, -0.3027665, -2.148746, 1, 0.4196078, 0, 1,
-1.418019, 0.8503673, -0.6432391, 1, 0.427451, 0, 1,
-1.392359, 0.5276957, -0.883543, 1, 0.4313726, 0, 1,
-1.390314, -0.6605424, -0.7309701, 1, 0.4392157, 0, 1,
-1.374869, -0.2793162, -1.649295, 1, 0.4431373, 0, 1,
-1.370253, -1.196029, -1.290656, 1, 0.4509804, 0, 1,
-1.360902, 1.009108, -1.400735, 1, 0.454902, 0, 1,
-1.360422, 0.600534, -2.058826, 1, 0.4627451, 0, 1,
-1.344755, 0.8077306, -0.8702352, 1, 0.4666667, 0, 1,
-1.340149, 1.782581, -0.5811949, 1, 0.4745098, 0, 1,
-1.317252, 2.061001, -0.4589086, 1, 0.4784314, 0, 1,
-1.310671, 0.3194633, -0.329784, 1, 0.4862745, 0, 1,
-1.309494, 1.069806, -1.037681, 1, 0.4901961, 0, 1,
-1.292876, 0.7843391, -1.046347, 1, 0.4980392, 0, 1,
-1.290201, -0.4787756, -1.343377, 1, 0.5058824, 0, 1,
-1.289597, 0.05364759, -2.135118, 1, 0.509804, 0, 1,
-1.283655, 0.1879323, -0.06207802, 1, 0.5176471, 0, 1,
-1.280802, -0.01206529, -1.015379, 1, 0.5215687, 0, 1,
-1.279408, 1.255972, -1.123214, 1, 0.5294118, 0, 1,
-1.26184, -0.8830727, -1.695415, 1, 0.5333334, 0, 1,
-1.25562, -0.93639, -2.248828, 1, 0.5411765, 0, 1,
-1.255084, -0.7847825, -0.9821462, 1, 0.5450981, 0, 1,
-1.253393, 0.7919264, -0.6678022, 1, 0.5529412, 0, 1,
-1.247714, 0.4741774, -1.297761, 1, 0.5568628, 0, 1,
-1.246329, 0.1622507, -2.10323, 1, 0.5647059, 0, 1,
-1.245383, -1.352122, -0.9677054, 1, 0.5686275, 0, 1,
-1.243432, 1.557885, 0.04136216, 1, 0.5764706, 0, 1,
-1.24261, -0.8550253, -2.268696, 1, 0.5803922, 0, 1,
-1.242359, -1.156492, -1.886406, 1, 0.5882353, 0, 1,
-1.239438, -0.6031593, -1.748443, 1, 0.5921569, 0, 1,
-1.237227, -0.195227, -0.7566533, 1, 0.6, 0, 1,
-1.231448, -0.4045552, 0.9558904, 1, 0.6078432, 0, 1,
-1.220984, -1.572888, -4.312529, 1, 0.6117647, 0, 1,
-1.218387, 1.295628, 0.4459418, 1, 0.6196079, 0, 1,
-1.21209, 0.5119426, -0.1189418, 1, 0.6235294, 0, 1,
-1.207894, -1.937261, -2.713079, 1, 0.6313726, 0, 1,
-1.201374, -0.9278448, -0.4507858, 1, 0.6352941, 0, 1,
-1.195861, -0.7686718, -1.635414, 1, 0.6431373, 0, 1,
-1.194949, 1.11162, -0.9634199, 1, 0.6470588, 0, 1,
-1.182953, 2.509763, -0.5219843, 1, 0.654902, 0, 1,
-1.171515, 2.225702, -0.7712103, 1, 0.6588235, 0, 1,
-1.165246, -1.164212, -1.937765, 1, 0.6666667, 0, 1,
-1.16355, 1.74062, -0.5180213, 1, 0.6705883, 0, 1,
-1.15525, 1.187846, -0.5516958, 1, 0.6784314, 0, 1,
-1.153877, 2.065106, 0.2067483, 1, 0.682353, 0, 1,
-1.130268, 0.6018187, -1.213333, 1, 0.6901961, 0, 1,
-1.1167, -2.971116, -2.995837, 1, 0.6941177, 0, 1,
-1.115711, 0.6357448, -0.6814117, 1, 0.7019608, 0, 1,
-1.104543, 0.7422099, 0.8647667, 1, 0.7098039, 0, 1,
-1.102638, -0.2500642, -3.226303, 1, 0.7137255, 0, 1,
-1.101302, -0.994186, -2.848126, 1, 0.7215686, 0, 1,
-1.100025, -0.07727777, -2.349066, 1, 0.7254902, 0, 1,
-1.095187, 0.7978235, -0.3606785, 1, 0.7333333, 0, 1,
-1.0948, -1.752087, -3.43695, 1, 0.7372549, 0, 1,
-1.093457, 0.1132159, -2.695268, 1, 0.7450981, 0, 1,
-1.079021, 0.3549325, 0.3502411, 1, 0.7490196, 0, 1,
-1.078331, 1.050765, -0.8484893, 1, 0.7568628, 0, 1,
-1.076229, -0.145673, 0.5328233, 1, 0.7607843, 0, 1,
-1.058954, -0.5639839, -2.249067, 1, 0.7686275, 0, 1,
-1.057954, 2.374477, -0.3077227, 1, 0.772549, 0, 1,
-1.05604, 0.6178, -0.3778239, 1, 0.7803922, 0, 1,
-1.05602, -1.979011, -2.976847, 1, 0.7843137, 0, 1,
-1.052447, 0.6652005, -2.536109, 1, 0.7921569, 0, 1,
-1.052013, -2.51345, -1.838085, 1, 0.7960784, 0, 1,
-1.043887, 0.7103016, -0.148333, 1, 0.8039216, 0, 1,
-1.040902, -1.537373, -2.322872, 1, 0.8117647, 0, 1,
-1.040819, -1.365811, -3.699603, 1, 0.8156863, 0, 1,
-1.035553, 1.158309, 0.2803318, 1, 0.8235294, 0, 1,
-1.019128, -0.9297836, -3.75869, 1, 0.827451, 0, 1,
-1.014553, 0.7622147, 1.290338, 1, 0.8352941, 0, 1,
-1.014367, 1.468391, -0.9589712, 1, 0.8392157, 0, 1,
-1.01415, -0.9304782, -1.788163, 1, 0.8470588, 0, 1,
-1.013141, 0.7668921, -3.597992, 1, 0.8509804, 0, 1,
-1.011284, 0.8288189, -0.03736277, 1, 0.8588235, 0, 1,
-1.010696, -0.6095762, -2.782121, 1, 0.8627451, 0, 1,
-1.009189, 0.2897627, -1.663847, 1, 0.8705882, 0, 1,
-1.00861, -0.3037208, -1.60896, 1, 0.8745098, 0, 1,
-1.007994, 0.5934086, -1.183649, 1, 0.8823529, 0, 1,
-1.003632, 0.4837497, -2.350753, 1, 0.8862745, 0, 1,
-0.9999067, 2.674603, -0.2192635, 1, 0.8941177, 0, 1,
-0.9988867, 0.764844, -0.643825, 1, 0.8980392, 0, 1,
-0.9912464, 0.4969644, -0.8652918, 1, 0.9058824, 0, 1,
-0.9912208, 0.9142901, -1.464561, 1, 0.9137255, 0, 1,
-0.9849961, 0.1886304, -1.352496, 1, 0.9176471, 0, 1,
-0.9811801, 2.24599, -0.9827207, 1, 0.9254902, 0, 1,
-0.9794418, 0.01606061, -1.962358, 1, 0.9294118, 0, 1,
-0.9723861, -0.7446722, -3.670003, 1, 0.9372549, 0, 1,
-0.9692843, -0.4210027, -2.540688, 1, 0.9411765, 0, 1,
-0.9611832, -0.7604783, -2.777283, 1, 0.9490196, 0, 1,
-0.9588382, -0.1612488, -1.351648, 1, 0.9529412, 0, 1,
-0.9466563, -0.08162037, -1.030615, 1, 0.9607843, 0, 1,
-0.9463497, -0.2721078, -1.288851, 1, 0.9647059, 0, 1,
-0.938473, 0.3246699, -2.072431, 1, 0.972549, 0, 1,
-0.9315042, 0.6200246, 0.01870498, 1, 0.9764706, 0, 1,
-0.9289598, 1.117051, -0.5818176, 1, 0.9843137, 0, 1,
-0.9286786, -0.7064801, -2.609941, 1, 0.9882353, 0, 1,
-0.9232485, 0.9863855, -1.426546, 1, 0.9960784, 0, 1,
-0.9202999, -0.2440079, -0.03868037, 0.9960784, 1, 0, 1,
-0.916535, 1.747705, -2.168327, 0.9921569, 1, 0, 1,
-0.9118384, -0.7283353, -4.607355, 0.9843137, 1, 0, 1,
-0.9117083, 1.40298, -1.852189, 0.9803922, 1, 0, 1,
-0.8997676, -1.630505, -3.60007, 0.972549, 1, 0, 1,
-0.8927652, -1.598759, -1.617063, 0.9686275, 1, 0, 1,
-0.8910493, -0.7636802, -4.657889, 0.9607843, 1, 0, 1,
-0.8886263, -1.217775, -2.501074, 0.9568627, 1, 0, 1,
-0.8867282, 0.5642088, -0.6525688, 0.9490196, 1, 0, 1,
-0.8862475, 0.1060852, -1.491392, 0.945098, 1, 0, 1,
-0.8851283, -1.610277, -1.796396, 0.9372549, 1, 0, 1,
-0.8848763, 0.07160085, -1.958889, 0.9333333, 1, 0, 1,
-0.8844356, 0.0348843, -2.600374, 0.9254902, 1, 0, 1,
-0.8839603, 2.820094, -1.49612, 0.9215686, 1, 0, 1,
-0.8738933, 1.938747, 1.760503, 0.9137255, 1, 0, 1,
-0.8736078, -0.4153649, -0.5405602, 0.9098039, 1, 0, 1,
-0.8727026, 0.751759, -2.074459, 0.9019608, 1, 0, 1,
-0.8700914, 2.441398, 0.1599838, 0.8941177, 1, 0, 1,
-0.8531234, 0.4849464, -1.571826, 0.8901961, 1, 0, 1,
-0.8518337, -1.181458, -1.717942, 0.8823529, 1, 0, 1,
-0.8498345, -1.073412, -1.714968, 0.8784314, 1, 0, 1,
-0.8457262, 1.365806, -2.782509, 0.8705882, 1, 0, 1,
-0.8403431, -0.02442488, -3.651813, 0.8666667, 1, 0, 1,
-0.8397676, -0.5273368, -0.6424358, 0.8588235, 1, 0, 1,
-0.8370368, 0.5320717, -0.1677239, 0.854902, 1, 0, 1,
-0.8318992, 1.011465, 0.9142668, 0.8470588, 1, 0, 1,
-0.826044, -0.6926022, -1.228461, 0.8431373, 1, 0, 1,
-0.8217528, 0.7981499, 0.6769204, 0.8352941, 1, 0, 1,
-0.8192832, -0.86155, -2.644574, 0.8313726, 1, 0, 1,
-0.8136839, 0.5165651, -0.8708214, 0.8235294, 1, 0, 1,
-0.8090649, 0.03263193, -1.659271, 0.8196079, 1, 0, 1,
-0.8062601, 1.44649, 0.2012182, 0.8117647, 1, 0, 1,
-0.7952788, -0.553157, -4.244078, 0.8078431, 1, 0, 1,
-0.7877728, -1.408021, -2.738118, 0.8, 1, 0, 1,
-0.7856118, 1.233469, -0.7445996, 0.7921569, 1, 0, 1,
-0.7833034, -0.1003524, -0.4249448, 0.7882353, 1, 0, 1,
-0.771015, 0.7521908, -0.2651964, 0.7803922, 1, 0, 1,
-0.7697753, 0.2474819, -0.5775116, 0.7764706, 1, 0, 1,
-0.7669564, 0.02849909, -2.710932, 0.7686275, 1, 0, 1,
-0.766874, 2.926915, 0.1676751, 0.7647059, 1, 0, 1,
-0.7610615, -0.3292333, -1.745602, 0.7568628, 1, 0, 1,
-0.757688, 0.1323127, -2.130613, 0.7529412, 1, 0, 1,
-0.7570291, 0.3649123, -0.1607944, 0.7450981, 1, 0, 1,
-0.7492048, -0.1393877, -1.363371, 0.7411765, 1, 0, 1,
-0.7471707, 1.080005, 0.22854, 0.7333333, 1, 0, 1,
-0.7406421, 0.4866959, -0.63433, 0.7294118, 1, 0, 1,
-0.7405301, -0.3117562, -2.784275, 0.7215686, 1, 0, 1,
-0.7340465, 0.6123671, -1.033478, 0.7176471, 1, 0, 1,
-0.7335258, 0.3004407, -1.187024, 0.7098039, 1, 0, 1,
-0.7237908, -1.891467, -2.944634, 0.7058824, 1, 0, 1,
-0.7237049, 0.4912885, -0.01614126, 0.6980392, 1, 0, 1,
-0.7222383, 0.08443752, -1.146198, 0.6901961, 1, 0, 1,
-0.7207572, -1.517616, -2.219592, 0.6862745, 1, 0, 1,
-0.7179007, -0.1135228, -3.334217, 0.6784314, 1, 0, 1,
-0.7123363, -0.7908278, -3.457958, 0.6745098, 1, 0, 1,
-0.7114906, -1.474887, -2.635537, 0.6666667, 1, 0, 1,
-0.6976001, 0.773778, -0.9943752, 0.6627451, 1, 0, 1,
-0.6939629, 1.239631, -0.7297214, 0.654902, 1, 0, 1,
-0.6936411, -0.192725, -1.356008, 0.6509804, 1, 0, 1,
-0.6928963, -1.174699, -1.035685, 0.6431373, 1, 0, 1,
-0.6911663, 0.7400712, -0.6361334, 0.6392157, 1, 0, 1,
-0.6885749, -1.334548, -2.177271, 0.6313726, 1, 0, 1,
-0.6879125, -0.307861, -3.260442, 0.627451, 1, 0, 1,
-0.6848958, -1.621859, -2.786557, 0.6196079, 1, 0, 1,
-0.6785908, -1.214353, -0.9751146, 0.6156863, 1, 0, 1,
-0.6744463, 0.1396089, -1.888778, 0.6078432, 1, 0, 1,
-0.671324, 0.5523298, -1.669432, 0.6039216, 1, 0, 1,
-0.6546652, 0.1330053, -2.457033, 0.5960785, 1, 0, 1,
-0.6544111, 1.477315, -0.4920158, 0.5882353, 1, 0, 1,
-0.6534213, 1.243653, 1.641127, 0.5843138, 1, 0, 1,
-0.647466, 1.048781, -1.507724, 0.5764706, 1, 0, 1,
-0.6441367, -0.8188661, -2.135168, 0.572549, 1, 0, 1,
-0.6389266, 2.824438, 0.3571348, 0.5647059, 1, 0, 1,
-0.6377078, 1.251104, -1.578665, 0.5607843, 1, 0, 1,
-0.6373206, 1.16847, -0.5999023, 0.5529412, 1, 0, 1,
-0.6343498, -1.092435, -3.00894, 0.5490196, 1, 0, 1,
-0.633505, 0.5312974, -0.8676349, 0.5411765, 1, 0, 1,
-0.6330369, 2.565825, -0.8399957, 0.5372549, 1, 0, 1,
-0.6304592, -0.8706601, -2.117129, 0.5294118, 1, 0, 1,
-0.6215067, -0.1880267, -1.785176, 0.5254902, 1, 0, 1,
-0.6199246, 0.6812263, -2.146494, 0.5176471, 1, 0, 1,
-0.6197414, -1.412883, -3.849269, 0.5137255, 1, 0, 1,
-0.6089174, 0.8714064, -0.1524271, 0.5058824, 1, 0, 1,
-0.6085615, -2.920645, -1.433527, 0.5019608, 1, 0, 1,
-0.608111, -0.4597362, -0.9186218, 0.4941176, 1, 0, 1,
-0.6030467, 0.006024492, -0.973029, 0.4862745, 1, 0, 1,
-0.6010876, -0.2330328, -2.054721, 0.4823529, 1, 0, 1,
-0.6007628, 0.6338615, -1.138472, 0.4745098, 1, 0, 1,
-0.5982841, -1.355436, -1.319482, 0.4705882, 1, 0, 1,
-0.5972672, -1.321854, -4.606257, 0.4627451, 1, 0, 1,
-0.588759, -0.5846825, -3.051381, 0.4588235, 1, 0, 1,
-0.5873012, -0.7744634, -2.892046, 0.4509804, 1, 0, 1,
-0.5858168, -0.3804228, -2.226043, 0.4470588, 1, 0, 1,
-0.5852079, 1.657839, -1.290029, 0.4392157, 1, 0, 1,
-0.5827262, 0.4336857, -0.762698, 0.4352941, 1, 0, 1,
-0.5795305, -1.244361, -3.18014, 0.427451, 1, 0, 1,
-0.5728546, -0.5844558, -2.248204, 0.4235294, 1, 0, 1,
-0.5684575, -1.374768, -2.515185, 0.4156863, 1, 0, 1,
-0.5678882, 0.4740849, -0.2152278, 0.4117647, 1, 0, 1,
-0.5610677, -0.3597752, -2.125882, 0.4039216, 1, 0, 1,
-0.558871, 0.97782, 0.2163868, 0.3960784, 1, 0, 1,
-0.5580504, 0.8802713, -0.4509544, 0.3921569, 1, 0, 1,
-0.5536726, -1.465225, -0.5319316, 0.3843137, 1, 0, 1,
-0.5517588, -0.2979108, 0.1269028, 0.3803922, 1, 0, 1,
-0.5511153, -0.1845772, -2.177344, 0.372549, 1, 0, 1,
-0.5482597, -1.187755, -4.025233, 0.3686275, 1, 0, 1,
-0.5467597, 0.1304115, -2.417554, 0.3607843, 1, 0, 1,
-0.5461945, -0.3626587, -2.278711, 0.3568628, 1, 0, 1,
-0.5453399, -0.5269807, -2.208479, 0.3490196, 1, 0, 1,
-0.5442765, 1.347857, -1.15309, 0.345098, 1, 0, 1,
-0.5356746, -0.435805, -0.6185719, 0.3372549, 1, 0, 1,
-0.5320125, 0.5983649, -0.6235747, 0.3333333, 1, 0, 1,
-0.5299099, 0.5198333, 0.221097, 0.3254902, 1, 0, 1,
-0.520289, 0.4582871, -1.465387, 0.3215686, 1, 0, 1,
-0.5189254, -0.3359382, -1.047348, 0.3137255, 1, 0, 1,
-0.5145463, -1.139465, -0.115716, 0.3098039, 1, 0, 1,
-0.5115203, -0.02796911, -2.443987, 0.3019608, 1, 0, 1,
-0.5063399, 0.0390457, -0.4147934, 0.2941177, 1, 0, 1,
-0.5060423, -1.630773, -2.047629, 0.2901961, 1, 0, 1,
-0.4928421, -0.9183908, -4.140451, 0.282353, 1, 0, 1,
-0.4856793, -0.05399543, -0.592653, 0.2784314, 1, 0, 1,
-0.4793048, 0.6014183, -0.2438242, 0.2705882, 1, 0, 1,
-0.476084, -0.7441096, -1.251202, 0.2666667, 1, 0, 1,
-0.4681027, 0.3114489, -1.113427, 0.2588235, 1, 0, 1,
-0.4674326, 1.294521, -0.05686676, 0.254902, 1, 0, 1,
-0.4672964, -0.02156561, -1.071165, 0.2470588, 1, 0, 1,
-0.4649994, -0.7841675, -1.919749, 0.2431373, 1, 0, 1,
-0.4537062, -1.050369, -4.043493, 0.2352941, 1, 0, 1,
-0.4529526, 0.158335, 1.090506, 0.2313726, 1, 0, 1,
-0.4436401, -1.028653, -2.047627, 0.2235294, 1, 0, 1,
-0.4415272, 0.8610414, 0.4251097, 0.2196078, 1, 0, 1,
-0.4389576, 1.625012, -0.7845962, 0.2117647, 1, 0, 1,
-0.437097, -0.6017788, -2.049329, 0.2078431, 1, 0, 1,
-0.4363583, 0.07161634, -0.1517246, 0.2, 1, 0, 1,
-0.4354515, -0.1607285, -0.6901706, 0.1921569, 1, 0, 1,
-0.4308211, 0.5906982, -0.9532463, 0.1882353, 1, 0, 1,
-0.4299384, 0.4694879, 0.6574117, 0.1803922, 1, 0, 1,
-0.4279736, 0.6758855, 0.5677114, 0.1764706, 1, 0, 1,
-0.4259123, -0.9608446, -2.903281, 0.1686275, 1, 0, 1,
-0.4216941, -0.8220516, -0.8785045, 0.1647059, 1, 0, 1,
-0.4199721, 0.8028859, -0.4383672, 0.1568628, 1, 0, 1,
-0.413523, -0.2427701, -3.15287, 0.1529412, 1, 0, 1,
-0.4103887, 0.1886377, -3.936303, 0.145098, 1, 0, 1,
-0.404116, -0.9757823, -1.939453, 0.1411765, 1, 0, 1,
-0.3995337, -0.375151, -2.128461, 0.1333333, 1, 0, 1,
-0.3990711, -0.8666278, -1.117828, 0.1294118, 1, 0, 1,
-0.3958301, -0.6656957, -2.801668, 0.1215686, 1, 0, 1,
-0.3954346, -1.130158, -2.676577, 0.1176471, 1, 0, 1,
-0.3928404, 1.076598, 0.3134108, 0.1098039, 1, 0, 1,
-0.3905346, -1.666178, -4.218916, 0.1058824, 1, 0, 1,
-0.3892738, -0.3849934, -4.606791, 0.09803922, 1, 0, 1,
-0.387674, -2.515152, -2.482671, 0.09019608, 1, 0, 1,
-0.382498, -0.08219981, -1.758838, 0.08627451, 1, 0, 1,
-0.3809279, 0.7397577, -2.804821, 0.07843138, 1, 0, 1,
-0.3791762, 0.2825233, -0.5651121, 0.07450981, 1, 0, 1,
-0.3751885, -1.328785, -1.350994, 0.06666667, 1, 0, 1,
-0.3713149, 1.385728, -2.995177, 0.0627451, 1, 0, 1,
-0.3705736, 1.155828, 0.2715488, 0.05490196, 1, 0, 1,
-0.3702298, 1.425767, -0.7452961, 0.05098039, 1, 0, 1,
-0.3588041, 0.6033205, -0.06468062, 0.04313726, 1, 0, 1,
-0.3584747, 0.7924806, -1.005756, 0.03921569, 1, 0, 1,
-0.3565136, 0.01316824, -3.022617, 0.03137255, 1, 0, 1,
-0.3554167, 1.725356, -0.8076591, 0.02745098, 1, 0, 1,
-0.355368, -0.06026169, -1.495541, 0.01960784, 1, 0, 1,
-0.3513401, 0.02327392, -0.9890627, 0.01568628, 1, 0, 1,
-0.3489111, -1.659777, -5.392369, 0.007843138, 1, 0, 1,
-0.3479554, -0.1584499, -2.452634, 0.003921569, 1, 0, 1,
-0.3476547, -0.8402892, -2.352396, 0, 1, 0.003921569, 1,
-0.3468898, 0.7124181, 1.996774, 0, 1, 0.01176471, 1,
-0.3456281, -0.9082162, -3.603515, 0, 1, 0.01568628, 1,
-0.3375259, -0.4067987, -1.800048, 0, 1, 0.02352941, 1,
-0.3346176, 2.324087, 0.8424721, 0, 1, 0.02745098, 1,
-0.3315326, 0.311494, -0.4449309, 0, 1, 0.03529412, 1,
-0.3266116, 1.859953, -0.02890969, 0, 1, 0.03921569, 1,
-0.3249495, 1.928081, 0.3849934, 0, 1, 0.04705882, 1,
-0.3147064, -0.9547651, -1.312454, 0, 1, 0.05098039, 1,
-0.3078295, -1.150728, -2.164686, 0, 1, 0.05882353, 1,
-0.3039889, -1.758466, -2.408908, 0, 1, 0.0627451, 1,
-0.3033714, -0.4490995, -5.335266, 0, 1, 0.07058824, 1,
-0.3029765, 1.282937, 0.2068967, 0, 1, 0.07450981, 1,
-0.297056, -0.7866725, -2.535175, 0, 1, 0.08235294, 1,
-0.2958587, -0.7255287, -1.993677, 0, 1, 0.08627451, 1,
-0.2954126, 0.4173687, -0.2747143, 0, 1, 0.09411765, 1,
-0.2945985, 0.6033981, 0.4331883, 0, 1, 0.1019608, 1,
-0.2941147, 1.21729, -0.1625316, 0, 1, 0.1058824, 1,
-0.2926268, 0.4385578, 0.8985823, 0, 1, 0.1137255, 1,
-0.289701, -0.413032, -2.281525, 0, 1, 0.1176471, 1,
-0.2868524, -0.9805903, -4.725191, 0, 1, 0.1254902, 1,
-0.2859514, 0.8408393, -0.001997044, 0, 1, 0.1294118, 1,
-0.28504, 0.1293138, -0.6769867, 0, 1, 0.1372549, 1,
-0.2849541, -1.215234, -3.477761, 0, 1, 0.1411765, 1,
-0.283102, 0.4788844, -0.4859846, 0, 1, 0.1490196, 1,
-0.2830915, -0.6680615, -2.707523, 0, 1, 0.1529412, 1,
-0.2802509, 0.9508438, -0.1193577, 0, 1, 0.1607843, 1,
-0.2794627, -0.6280753, -3.493886, 0, 1, 0.1647059, 1,
-0.2764013, 0.261863, -2.249435, 0, 1, 0.172549, 1,
-0.2699755, -1.791697, -3.454548, 0, 1, 0.1764706, 1,
-0.2692601, -0.3256528, -2.551963, 0, 1, 0.1843137, 1,
-0.2651593, -0.2870372, -1.648797, 0, 1, 0.1882353, 1,
-0.2647829, -0.6577579, -2.706963, 0, 1, 0.1960784, 1,
-0.2640135, 0.09502211, -1.344025, 0, 1, 0.2039216, 1,
-0.2624461, -0.2621656, -2.294969, 0, 1, 0.2078431, 1,
-0.2615022, -0.07818175, -1.809672, 0, 1, 0.2156863, 1,
-0.2594832, -1.037239, -3.830053, 0, 1, 0.2196078, 1,
-0.2588087, 0.09174635, 0.03077347, 0, 1, 0.227451, 1,
-0.2536785, -0.9716547, -2.964898, 0, 1, 0.2313726, 1,
-0.253154, 0.4866736, -0.02986369, 0, 1, 0.2392157, 1,
-0.2530869, 0.4334229, -0.4568698, 0, 1, 0.2431373, 1,
-0.2507903, -0.4915333, -3.752038, 0, 1, 0.2509804, 1,
-0.2499779, 0.2010389, -1.203784, 0, 1, 0.254902, 1,
-0.2480863, -1.364253, -4.205721, 0, 1, 0.2627451, 1,
-0.2472316, 0.4802427, -1.422648, 0, 1, 0.2666667, 1,
-0.2471731, 0.05915618, -1.225882, 0, 1, 0.2745098, 1,
-0.2420023, -0.793156, -1.436114, 0, 1, 0.2784314, 1,
-0.2394541, 0.8053172, -1.040932, 0, 1, 0.2862745, 1,
-0.2347995, 0.5131721, -0.2605612, 0, 1, 0.2901961, 1,
-0.2249571, -0.03578845, -1.464528, 0, 1, 0.2980392, 1,
-0.2237913, -3.037604, -2.078678, 0, 1, 0.3058824, 1,
-0.2212391, 1.301113, -0.2050336, 0, 1, 0.3098039, 1,
-0.216415, 1.113213, -1.52801, 0, 1, 0.3176471, 1,
-0.2161017, -0.5802646, -2.984737, 0, 1, 0.3215686, 1,
-0.2150529, -0.4389818, -2.538243, 0, 1, 0.3294118, 1,
-0.2149228, -0.02448349, 0.06634201, 0, 1, 0.3333333, 1,
-0.214544, -0.8433979, -4.631209, 0, 1, 0.3411765, 1,
-0.2091167, -0.478713, -2.561268, 0, 1, 0.345098, 1,
-0.2037539, -0.08711667, -2.515134, 0, 1, 0.3529412, 1,
-0.2036394, -1.145939, -1.983446, 0, 1, 0.3568628, 1,
-0.1985765, -0.3925793, -1.560182, 0, 1, 0.3647059, 1,
-0.1974177, 1.509198, 0.1151423, 0, 1, 0.3686275, 1,
-0.1936282, -0.1045962, -1.618506, 0, 1, 0.3764706, 1,
-0.186834, -0.6121238, -1.860673, 0, 1, 0.3803922, 1,
-0.1830916, 0.2252605, -0.2548698, 0, 1, 0.3882353, 1,
-0.1817283, 1.712542, 1.904643, 0, 1, 0.3921569, 1,
-0.181329, 0.9322131, 0.6777904, 0, 1, 0.4, 1,
-0.1811402, 0.4232133, -0.04953015, 0, 1, 0.4078431, 1,
-0.1717818, -0.1650859, -2.547457, 0, 1, 0.4117647, 1,
-0.1700314, 1.818338, -0.1723991, 0, 1, 0.4196078, 1,
-0.1690813, 0.6017513, 1.167991, 0, 1, 0.4235294, 1,
-0.1660099, 1.246779, 0.395026, 0, 1, 0.4313726, 1,
-0.1655826, 0.7982956, 1.200321, 0, 1, 0.4352941, 1,
-0.1654335, -0.2016002, -1.894312, 0, 1, 0.4431373, 1,
-0.1652507, -0.6476387, -3.637471, 0, 1, 0.4470588, 1,
-0.1637074, -0.07722024, -2.545091, 0, 1, 0.454902, 1,
-0.1605835, -1.395819, -5.503745, 0, 1, 0.4588235, 1,
-0.1559384, -2.391652, -5.517655, 0, 1, 0.4666667, 1,
-0.1522069, -0.2121131, -1.820961, 0, 1, 0.4705882, 1,
-0.1508221, 2.43965, -0.5903351, 0, 1, 0.4784314, 1,
-0.1495243, 0.7262429, -1.270941, 0, 1, 0.4823529, 1,
-0.135594, 0.790495, 1.633508, 0, 1, 0.4901961, 1,
-0.132042, 0.2948925, -0.6815681, 0, 1, 0.4941176, 1,
-0.1277363, 0.5769809, -0.4967013, 0, 1, 0.5019608, 1,
-0.1254593, -1.7131, -3.536091, 0, 1, 0.509804, 1,
-0.1215441, -0.5492837, -2.500273, 0, 1, 0.5137255, 1,
-0.1191914, -0.8519864, -3.105465, 0, 1, 0.5215687, 1,
-0.1181686, 0.03323205, -0.9703119, 0, 1, 0.5254902, 1,
-0.1177738, -0.5034071, -4.581668, 0, 1, 0.5333334, 1,
-0.1144793, -0.6001214, -3.589319, 0, 1, 0.5372549, 1,
-0.1122091, 0.1923687, -1.206728, 0, 1, 0.5450981, 1,
-0.1107449, -1.86781, -2.374548, 0, 1, 0.5490196, 1,
-0.1063782, 0.2741936, -0.9377135, 0, 1, 0.5568628, 1,
-0.1033064, 1.149849, -1.105382, 0, 1, 0.5607843, 1,
-0.09728673, 1.215563, -0.276147, 0, 1, 0.5686275, 1,
-0.09514971, 1.494401, 0.3484456, 0, 1, 0.572549, 1,
-0.09477548, 1.263383, -2.071523, 0, 1, 0.5803922, 1,
-0.0935221, 1.735312, -0.5650383, 0, 1, 0.5843138, 1,
-0.0917417, -1.236315, -3.518153, 0, 1, 0.5921569, 1,
-0.08600667, 0.7306185, -1.336841, 0, 1, 0.5960785, 1,
-0.08596881, 1.099441, 0.3183213, 0, 1, 0.6039216, 1,
-0.08586865, 0.4940971, 0.3424524, 0, 1, 0.6117647, 1,
-0.08356594, 0.742312, 0.8388686, 0, 1, 0.6156863, 1,
-0.08338381, -0.05810441, -1.532474, 0, 1, 0.6235294, 1,
-0.07733528, 1.40169, -0.6369848, 0, 1, 0.627451, 1,
-0.07719485, -1.192065, -1.292551, 0, 1, 0.6352941, 1,
-0.07672499, -0.3421705, -4.592727, 0, 1, 0.6392157, 1,
-0.07397426, -0.5543566, -1.646378, 0, 1, 0.6470588, 1,
-0.07389541, -0.7386135, -2.21332, 0, 1, 0.6509804, 1,
-0.0738802, 1.10286, -0.5348414, 0, 1, 0.6588235, 1,
-0.07350729, -0.1623391, -2.226245, 0, 1, 0.6627451, 1,
-0.06929105, -0.163215, -3.082161, 0, 1, 0.6705883, 1,
-0.06853233, 0.667723, -0.843742, 0, 1, 0.6745098, 1,
-0.06735996, -0.4939155, -1.598467, 0, 1, 0.682353, 1,
-0.06371183, -0.4264867, -2.385772, 0, 1, 0.6862745, 1,
-0.06250957, 0.5211861, -0.9171568, 0, 1, 0.6941177, 1,
-0.06135699, 1.257602, -1.597207, 0, 1, 0.7019608, 1,
-0.05997718, -0.2571862, -0.717812, 0, 1, 0.7058824, 1,
-0.05557081, 1.586163, -0.3611638, 0, 1, 0.7137255, 1,
-0.04873922, 0.8999803, -2.248316, 0, 1, 0.7176471, 1,
-0.04677331, 1.960806, 0.1340478, 0, 1, 0.7254902, 1,
-0.04422007, -0.3380996, -2.401573, 0, 1, 0.7294118, 1,
-0.04287285, 2.566857, -0.2832136, 0, 1, 0.7372549, 1,
-0.03062665, -0.1921066, -2.693931, 0, 1, 0.7411765, 1,
-0.02762113, -2.043701, -5.000965, 0, 1, 0.7490196, 1,
-0.02353919, -1.026418, -2.681233, 0, 1, 0.7529412, 1,
-0.01838286, 1.126019, 0.9282494, 0, 1, 0.7607843, 1,
-0.01745889, 0.7563166, 0.1755359, 0, 1, 0.7647059, 1,
-0.01670948, -0.9860776, -3.064541, 0, 1, 0.772549, 1,
-0.0156296, -1.189845, -2.32788, 0, 1, 0.7764706, 1,
-0.008415564, 1.100368, 0.4117962, 0, 1, 0.7843137, 1,
-1.354422e-05, 0.5048834, 0.5234798, 0, 1, 0.7882353, 1,
0.0005959904, -0.2518655, 4.529382, 0, 1, 0.7960784, 1,
0.002679561, -0.02449934, 3.75127, 0, 1, 0.8039216, 1,
0.01054165, 0.592958, 0.5395124, 0, 1, 0.8078431, 1,
0.01353731, -1.28396, 4.015538, 0, 1, 0.8156863, 1,
0.01684101, 0.7098408, -0.9365746, 0, 1, 0.8196079, 1,
0.01716693, -0.4495378, 2.307093, 0, 1, 0.827451, 1,
0.01852957, 0.5821489, 1.5943, 0, 1, 0.8313726, 1,
0.01996206, -0.9857557, 4.118805, 0, 1, 0.8392157, 1,
0.02274368, 0.6479493, 0.02470024, 0, 1, 0.8431373, 1,
0.02499204, 0.4939922, 0.6284982, 0, 1, 0.8509804, 1,
0.02727782, 0.4545321, -2.409403, 0, 1, 0.854902, 1,
0.02805496, 0.6497225, -0.4100695, 0, 1, 0.8627451, 1,
0.02944652, -1.141758, 1.812428, 0, 1, 0.8666667, 1,
0.02992989, 1.948723, -1.383511, 0, 1, 0.8745098, 1,
0.03445208, -0.03717721, -0.1512367, 0, 1, 0.8784314, 1,
0.03485539, -0.02880187, 2.870021, 0, 1, 0.8862745, 1,
0.03521371, 1.586752, -0.1441279, 0, 1, 0.8901961, 1,
0.03680159, -0.3850701, 3.701361, 0, 1, 0.8980392, 1,
0.03768519, -2.291697, 3.249278, 0, 1, 0.9058824, 1,
0.03866487, -0.2662625, 1.957395, 0, 1, 0.9098039, 1,
0.04029429, 0.8455592, 0.4585807, 0, 1, 0.9176471, 1,
0.04395708, -0.6009507, 3.402015, 0, 1, 0.9215686, 1,
0.04664485, -2.441957, 2.864133, 0, 1, 0.9294118, 1,
0.05002452, -0.3771023, 2.536016, 0, 1, 0.9333333, 1,
0.05009719, -0.7594446, 2.876766, 0, 1, 0.9411765, 1,
0.05612507, 0.150882, -1.868137, 0, 1, 0.945098, 1,
0.05619162, -1.313344, 3.399888, 0, 1, 0.9529412, 1,
0.05635455, 0.07460036, 0.5028346, 0, 1, 0.9568627, 1,
0.05887783, 0.2993834, 1.858949, 0, 1, 0.9647059, 1,
0.05900716, 0.6880928, 0.1879614, 0, 1, 0.9686275, 1,
0.06302028, -0.8939189, 3.626384, 0, 1, 0.9764706, 1,
0.06564751, -0.6014175, 3.049716, 0, 1, 0.9803922, 1,
0.06568041, 1.048584, -0.07875626, 0, 1, 0.9882353, 1,
0.06615466, -0.7948513, 2.529938, 0, 1, 0.9921569, 1,
0.06827769, 1.526954, 0.5505161, 0, 1, 1, 1,
0.07098339, 1.492278, -0.2009593, 0, 0.9921569, 1, 1,
0.0713603, 0.6168702, 3.273983, 0, 0.9882353, 1, 1,
0.07229403, 2.143941, 0.9310864, 0, 0.9803922, 1, 1,
0.07323898, -0.2654472, 1.393702, 0, 0.9764706, 1, 1,
0.07468321, -0.7845274, 2.860603, 0, 0.9686275, 1, 1,
0.07598375, -0.5814848, 4.357674, 0, 0.9647059, 1, 1,
0.07634488, -0.1037896, 3.240558, 0, 0.9568627, 1, 1,
0.0766187, -1.893897, 2.729491, 0, 0.9529412, 1, 1,
0.07684346, -0.7201263, 4.041985, 0, 0.945098, 1, 1,
0.07984744, 0.3716701, -0.6669223, 0, 0.9411765, 1, 1,
0.08548899, 1.335553, 0.3162807, 0, 0.9333333, 1, 1,
0.08769774, 1.090878, 1.432052, 0, 0.9294118, 1, 1,
0.0905328, -0.5100043, 3.390483, 0, 0.9215686, 1, 1,
0.09271084, 0.8351592, -1.479809, 0, 0.9176471, 1, 1,
0.09430648, -1.829639, 4.333795, 0, 0.9098039, 1, 1,
0.09458569, 1.481016, 0.8761621, 0, 0.9058824, 1, 1,
0.09540574, -0.6161131, 3.077558, 0, 0.8980392, 1, 1,
0.09620336, -0.5632377, 3.34438, 0, 0.8901961, 1, 1,
0.09932055, 0.1173535, 0.2771136, 0, 0.8862745, 1, 1,
0.1021623, -0.4579923, 1.468644, 0, 0.8784314, 1, 1,
0.1037015, -0.9425345, 2.236982, 0, 0.8745098, 1, 1,
0.1147157, 1.103446, -0.9433356, 0, 0.8666667, 1, 1,
0.1153388, -0.5490894, 1.884156, 0, 0.8627451, 1, 1,
0.1184868, 1.353504, -1.053925, 0, 0.854902, 1, 1,
0.1193273, 0.1354802, 1.354063, 0, 0.8509804, 1, 1,
0.1205486, 1.158481, -0.03666393, 0, 0.8431373, 1, 1,
0.1212753, -1.663404, 2.34867, 0, 0.8392157, 1, 1,
0.1262207, 1.230573, 0.06676944, 0, 0.8313726, 1, 1,
0.1287507, 0.9343709, -1.466086, 0, 0.827451, 1, 1,
0.1322318, 1.519044, -2.716305, 0, 0.8196079, 1, 1,
0.1330965, 0.2806866, 2.397941, 0, 0.8156863, 1, 1,
0.1364855, 0.9020561, 0.2932108, 0, 0.8078431, 1, 1,
0.1380302, 0.8298869, -0.7620875, 0, 0.8039216, 1, 1,
0.1457672, 0.2364057, -1.062414, 0, 0.7960784, 1, 1,
0.1568892, 0.6417263, 0.7522266, 0, 0.7882353, 1, 1,
0.157332, -1.350024, 5.371553, 0, 0.7843137, 1, 1,
0.158349, 0.6356258, -0.6025377, 0, 0.7764706, 1, 1,
0.1599638, -1.236912, 3.003563, 0, 0.772549, 1, 1,
0.1636213, 3.601807, 0.02575751, 0, 0.7647059, 1, 1,
0.1664348, -0.6860328, 4.467062, 0, 0.7607843, 1, 1,
0.1683101, 0.5506377, 0.1528552, 0, 0.7529412, 1, 1,
0.1697794, 0.2226847, 0.8046063, 0, 0.7490196, 1, 1,
0.173036, -0.4270913, 2.445149, 0, 0.7411765, 1, 1,
0.1731399, -0.672228, 2.801589, 0, 0.7372549, 1, 1,
0.1750445, 0.03242006, 2.454482, 0, 0.7294118, 1, 1,
0.1774982, 0.4843864, 0.5644559, 0, 0.7254902, 1, 1,
0.1823296, -1.349167, 2.349005, 0, 0.7176471, 1, 1,
0.1827501, -0.01486618, 1.612549, 0, 0.7137255, 1, 1,
0.18433, -1.621445, 1.644996, 0, 0.7058824, 1, 1,
0.1866729, 0.6701277, 0.8178682, 0, 0.6980392, 1, 1,
0.1937545, 1.860568, 0.9407761, 0, 0.6941177, 1, 1,
0.196509, 0.003883186, 3.101358, 0, 0.6862745, 1, 1,
0.197266, -0.625381, 3.511601, 0, 0.682353, 1, 1,
0.1974234, -1.165009, 3.126018, 0, 0.6745098, 1, 1,
0.2000641, -0.5157292, 3.303648, 0, 0.6705883, 1, 1,
0.2032552, -1.230958, 3.369528, 0, 0.6627451, 1, 1,
0.2083066, 0.4139628, 1.154008, 0, 0.6588235, 1, 1,
0.2093826, 0.6002064, 1.161043, 0, 0.6509804, 1, 1,
0.2133228, 0.8541223, 1.53885, 0, 0.6470588, 1, 1,
0.2134896, 0.07414386, -0.133628, 0, 0.6392157, 1, 1,
0.2169551, -1.92626, 4.327138, 0, 0.6352941, 1, 1,
0.2216654, 0.07324269, 0.9454072, 0, 0.627451, 1, 1,
0.2221751, -0.6696771, 3.505984, 0, 0.6235294, 1, 1,
0.2222204, 0.6198218, -1.132371, 0, 0.6156863, 1, 1,
0.2237231, 1.889958, -0.4583459, 0, 0.6117647, 1, 1,
0.2239983, -2.45803, 2.558477, 0, 0.6039216, 1, 1,
0.2312809, -0.2503274, 1.124638, 0, 0.5960785, 1, 1,
0.2341214, -0.8988692, 3.863765, 0, 0.5921569, 1, 1,
0.2382201, 0.9593895, -0.7957343, 0, 0.5843138, 1, 1,
0.2383823, -0.7763924, 4.729748, 0, 0.5803922, 1, 1,
0.2421824, 1.516995, 1.640296, 0, 0.572549, 1, 1,
0.2460286, 0.2258286, 2.407466, 0, 0.5686275, 1, 1,
0.2486807, -0.8328158, 2.561471, 0, 0.5607843, 1, 1,
0.2536879, -0.7307601, 2.196587, 0, 0.5568628, 1, 1,
0.2618614, -1.304909, 2.854395, 0, 0.5490196, 1, 1,
0.2667395, -0.1795501, 3.237876, 0, 0.5450981, 1, 1,
0.269137, 0.3467013, 1.676486, 0, 0.5372549, 1, 1,
0.2692721, 2.95389, 0.07224939, 0, 0.5333334, 1, 1,
0.2705044, -1.052362, 1.054087, 0, 0.5254902, 1, 1,
0.2708126, 1.038206, -1.651377, 0, 0.5215687, 1, 1,
0.276049, -0.3967013, 1.802119, 0, 0.5137255, 1, 1,
0.2803664, 0.1778214, 2.370007, 0, 0.509804, 1, 1,
0.2888426, -0.009843892, 0.5284355, 0, 0.5019608, 1, 1,
0.2895772, -0.09425844, 0.8762217, 0, 0.4941176, 1, 1,
0.2901723, 0.4273547, 0.983684, 0, 0.4901961, 1, 1,
0.2925354, 1.318466, -0.8189451, 0, 0.4823529, 1, 1,
0.2937984, -0.8894669, 4.207984, 0, 0.4784314, 1, 1,
0.2965159, 0.6726813, 1.688495, 0, 0.4705882, 1, 1,
0.2984085, 0.3821023, -0.859385, 0, 0.4666667, 1, 1,
0.2997514, -1.998732, 4.496814, 0, 0.4588235, 1, 1,
0.308026, 0.005660275, 1.644945, 0, 0.454902, 1, 1,
0.319104, -0.5294492, 3.478029, 0, 0.4470588, 1, 1,
0.319464, 1.791735, -1.281636, 0, 0.4431373, 1, 1,
0.3236638, -0.4431881, 3.124752, 0, 0.4352941, 1, 1,
0.3247889, 1.385, -1.185452, 0, 0.4313726, 1, 1,
0.324905, -2.24056, 2.630894, 0, 0.4235294, 1, 1,
0.3277199, 0.4088212, -1.670474, 0, 0.4196078, 1, 1,
0.3288679, 1.892432, -1.101966, 0, 0.4117647, 1, 1,
0.3289691, -0.2587002, 1.96627, 0, 0.4078431, 1, 1,
0.3295502, 0.2807693, -0.7861635, 0, 0.4, 1, 1,
0.3309459, -0.8987913, 3.397111, 0, 0.3921569, 1, 1,
0.3322383, 1.868205, 2.569893, 0, 0.3882353, 1, 1,
0.3351762, -1.506112, 2.754446, 0, 0.3803922, 1, 1,
0.3407048, -1.237015, 1.730416, 0, 0.3764706, 1, 1,
0.3456729, -0.3284459, 3.395492, 0, 0.3686275, 1, 1,
0.3467549, 1.221777, -0.8256423, 0, 0.3647059, 1, 1,
0.3472074, 0.178882, 1.770521, 0, 0.3568628, 1, 1,
0.3512284, 0.1225068, -0.3779635, 0, 0.3529412, 1, 1,
0.3528184, -0.7425399, 3.669796, 0, 0.345098, 1, 1,
0.3537497, -0.1175237, 2.449819, 0, 0.3411765, 1, 1,
0.3541501, 1.163161, -1.453891, 0, 0.3333333, 1, 1,
0.3541778, 0.2312179, -1.537119, 0, 0.3294118, 1, 1,
0.3550849, -0.6937647, 2.24326, 0, 0.3215686, 1, 1,
0.3555548, 0.557349, -0.3969704, 0, 0.3176471, 1, 1,
0.3560573, 0.5239933, 1.156807, 0, 0.3098039, 1, 1,
0.3561511, 1.108655, -0.6594257, 0, 0.3058824, 1, 1,
0.3563772, 0.5056087, 0.9918033, 0, 0.2980392, 1, 1,
0.3576632, -1.903826, 2.715775, 0, 0.2901961, 1, 1,
0.3630985, 0.1102211, 1.017683, 0, 0.2862745, 1, 1,
0.3654877, -0.6205717, 2.90483, 0, 0.2784314, 1, 1,
0.3695748, -0.5062156, 2.572151, 0, 0.2745098, 1, 1,
0.3727811, 0.6388375, 1.980749, 0, 0.2666667, 1, 1,
0.3751362, -1.215944, 2.405722, 0, 0.2627451, 1, 1,
0.378033, 0.1881362, 0.2460625, 0, 0.254902, 1, 1,
0.3838295, -1.854486, 3.665763, 0, 0.2509804, 1, 1,
0.3873003, -2.383939, 1.936002, 0, 0.2431373, 1, 1,
0.3948967, 0.1653214, -1.885864, 0, 0.2392157, 1, 1,
0.4046597, 0.4130777, 0.5971425, 0, 0.2313726, 1, 1,
0.4066333, -1.855628, 1.529645, 0, 0.227451, 1, 1,
0.4068797, -0.02688102, -0.1591276, 0, 0.2196078, 1, 1,
0.4095584, 0.9353033, 0.7522376, 0, 0.2156863, 1, 1,
0.4109321, 0.1996825, 0.5658551, 0, 0.2078431, 1, 1,
0.411128, 0.04711715, 0.9220265, 0, 0.2039216, 1, 1,
0.4179932, -0.5346014, 3.229043, 0, 0.1960784, 1, 1,
0.4239865, 1.444431, -0.3092364, 0, 0.1882353, 1, 1,
0.429569, -0.1749952, 1.733976, 0, 0.1843137, 1, 1,
0.429992, 0.3524952, 0.6175107, 0, 0.1764706, 1, 1,
0.4337919, -1.385474, 4.102791, 0, 0.172549, 1, 1,
0.4339551, 0.628284, 0.4370694, 0, 0.1647059, 1, 1,
0.4368388, 0.4051821, -0.1877762, 0, 0.1607843, 1, 1,
0.4379375, -1.327183, 3.637905, 0, 0.1529412, 1, 1,
0.4465591, 0.1302729, 1.39584, 0, 0.1490196, 1, 1,
0.4484321, -0.3097168, 1.753006, 0, 0.1411765, 1, 1,
0.4551576, 1.688681, 1.681797, 0, 0.1372549, 1, 1,
0.4554266, -1.002015, 2.787847, 0, 0.1294118, 1, 1,
0.462497, 0.7788237, 0.3637316, 0, 0.1254902, 1, 1,
0.4659541, -0.8948437, 4.373, 0, 0.1176471, 1, 1,
0.4691384, -0.6113521, 2.925724, 0, 0.1137255, 1, 1,
0.4777877, 0.7068761, 0.2257748, 0, 0.1058824, 1, 1,
0.4808682, -1.084832, 1.934067, 0, 0.09803922, 1, 1,
0.4842868, -0.1950163, 3.620142, 0, 0.09411765, 1, 1,
0.4873091, 0.6772643, 0.7023082, 0, 0.08627451, 1, 1,
0.4926534, 0.6276677, 2.709406, 0, 0.08235294, 1, 1,
0.4975364, 1.085206, -0.9894409, 0, 0.07450981, 1, 1,
0.5013393, -1.063535, 1.909104, 0, 0.07058824, 1, 1,
0.502044, -0.7571638, 1.889468, 0, 0.0627451, 1, 1,
0.504543, 0.06222366, 1.326312, 0, 0.05882353, 1, 1,
0.5061347, 0.3633788, 0.6734048, 0, 0.05098039, 1, 1,
0.5061442, 0.2206028, 0.884684, 0, 0.04705882, 1, 1,
0.5147233, -2.196483, 2.694888, 0, 0.03921569, 1, 1,
0.5173793, -1.249147, 2.207221, 0, 0.03529412, 1, 1,
0.5241808, -0.8949611, 5.248491, 0, 0.02745098, 1, 1,
0.5260224, 1.007058, -1.215904, 0, 0.02352941, 1, 1,
0.5306777, 0.004006204, 1.276084, 0, 0.01568628, 1, 1,
0.5316117, 0.6751063, 0.9494998, 0, 0.01176471, 1, 1,
0.532334, 0.2903049, 0.6238898, 0, 0.003921569, 1, 1,
0.5335705, 0.506913, 0.8520088, 0.003921569, 0, 1, 1,
0.5371361, 0.8642753, 0.790151, 0.007843138, 0, 1, 1,
0.5381103, -0.426151, 2.699181, 0.01568628, 0, 1, 1,
0.5397847, 0.4878669, -0.4814342, 0.01960784, 0, 1, 1,
0.5442942, 1.033952, -1.059473, 0.02745098, 0, 1, 1,
0.5490962, -0.179486, 3.927888, 0.03137255, 0, 1, 1,
0.5501956, 0.06263667, 1.966557, 0.03921569, 0, 1, 1,
0.561516, -0.2860443, 1.54624, 0.04313726, 0, 1, 1,
0.5627534, -0.1669592, 1.152876, 0.05098039, 0, 1, 1,
0.5668421, -0.9759764, 3.461444, 0.05490196, 0, 1, 1,
0.5751147, 0.6649374, 1.306497, 0.0627451, 0, 1, 1,
0.5754724, 1.040065, 1.974683, 0.06666667, 0, 1, 1,
0.5763134, 1.247188, 0.1796476, 0.07450981, 0, 1, 1,
0.5774667, 0.5584505, 1.861386, 0.07843138, 0, 1, 1,
0.5800983, -1.008124, 2.865565, 0.08627451, 0, 1, 1,
0.5855582, 0.6480153, -0.04385646, 0.09019608, 0, 1, 1,
0.5891333, 0.03733094, 1.176067, 0.09803922, 0, 1, 1,
0.5898616, 0.3374398, 0.3979702, 0.1058824, 0, 1, 1,
0.5901511, -0.3474709, 1.277476, 0.1098039, 0, 1, 1,
0.5927456, 0.2095363, 1.694093, 0.1176471, 0, 1, 1,
0.5953105, -0.476765, 2.490202, 0.1215686, 0, 1, 1,
0.5964792, 0.5734602, 1.134345, 0.1294118, 0, 1, 1,
0.5999995, -0.4622217, 2.100731, 0.1333333, 0, 1, 1,
0.6003608, -0.5316232, 1.724406, 0.1411765, 0, 1, 1,
0.6044619, -1.557288, 2.257046, 0.145098, 0, 1, 1,
0.6050789, -1.058463, 2.008695, 0.1529412, 0, 1, 1,
0.6062589, -0.4983075, 1.159484, 0.1568628, 0, 1, 1,
0.6081276, -0.3041883, 3.612452, 0.1647059, 0, 1, 1,
0.6165456, 0.6989901, 1.42683, 0.1686275, 0, 1, 1,
0.6177043, 0.2197676, 3.006359, 0.1764706, 0, 1, 1,
0.6204611, -0.3628269, 2.620722, 0.1803922, 0, 1, 1,
0.6227517, 1.224065, -1.276722, 0.1882353, 0, 1, 1,
0.6289993, -1.389215, 3.157501, 0.1921569, 0, 1, 1,
0.6322761, -0.08297481, 0.9280554, 0.2, 0, 1, 1,
0.6327323, 0.7827508, 0.9111423, 0.2078431, 0, 1, 1,
0.6376684, -0.2522542, 2.940185, 0.2117647, 0, 1, 1,
0.6403738, 1.504879, 0.5193629, 0.2196078, 0, 1, 1,
0.6447519, 2.212273, 0.6631752, 0.2235294, 0, 1, 1,
0.6510394, 0.2500951, 2.140103, 0.2313726, 0, 1, 1,
0.6519366, -0.266832, 2.635364, 0.2352941, 0, 1, 1,
0.6546706, 1.606225, -1.018086, 0.2431373, 0, 1, 1,
0.6563535, -0.05703026, 2.9816, 0.2470588, 0, 1, 1,
0.6570218, -0.9307784, 2.512609, 0.254902, 0, 1, 1,
0.6586756, 1.206029, 0.5395954, 0.2588235, 0, 1, 1,
0.6592776, -0.6046103, 2.430975, 0.2666667, 0, 1, 1,
0.6605988, -0.8560384, 3.165349, 0.2705882, 0, 1, 1,
0.6708878, 2.078792, 0.6284589, 0.2784314, 0, 1, 1,
0.6756572, 1.016629, 0.7912091, 0.282353, 0, 1, 1,
0.6790131, 1.807195, -2.167633, 0.2901961, 0, 1, 1,
0.6835856, -0.9943564, 3.141339, 0.2941177, 0, 1, 1,
0.6843004, -1.67006, 3.761236, 0.3019608, 0, 1, 1,
0.6860929, 1.785569, -0.01571638, 0.3098039, 0, 1, 1,
0.689656, -1.42533, 2.738508, 0.3137255, 0, 1, 1,
0.6915587, 0.9742109, -0.05936971, 0.3215686, 0, 1, 1,
0.6984062, -1.200634, 1.945513, 0.3254902, 0, 1, 1,
0.7067398, -0.4846683, 1.884256, 0.3333333, 0, 1, 1,
0.7079579, -1.362642, 0.990345, 0.3372549, 0, 1, 1,
0.7100011, 0.7624714, 1.115157, 0.345098, 0, 1, 1,
0.7101997, 0.4583329, 1.244286, 0.3490196, 0, 1, 1,
0.7127116, -1.46174, 3.000893, 0.3568628, 0, 1, 1,
0.7134092, -0.7862651, 2.668431, 0.3607843, 0, 1, 1,
0.7218882, 0.6029131, 0.8856583, 0.3686275, 0, 1, 1,
0.7236778, 1.553393, 0.3011599, 0.372549, 0, 1, 1,
0.7247493, -0.8601661, 2.411909, 0.3803922, 0, 1, 1,
0.7294113, 1.322267, 0.4671121, 0.3843137, 0, 1, 1,
0.7306494, -0.1072259, 1.412753, 0.3921569, 0, 1, 1,
0.7314738, 0.2057003, -1.157023, 0.3960784, 0, 1, 1,
0.7384586, -0.3867003, 0.6930273, 0.4039216, 0, 1, 1,
0.7402864, -0.4586178, 2.688713, 0.4117647, 0, 1, 1,
0.7450892, -1.25583, 3.463905, 0.4156863, 0, 1, 1,
0.7459111, 1.554315, 0.02229473, 0.4235294, 0, 1, 1,
0.746209, 1.59129, 0.8025671, 0.427451, 0, 1, 1,
0.749679, -0.3533649, 1.462211, 0.4352941, 0, 1, 1,
0.7519845, 0.5105557, 1.947567, 0.4392157, 0, 1, 1,
0.7557879, -0.8319193, 3.707801, 0.4470588, 0, 1, 1,
0.7563264, 0.860892, 0.1081295, 0.4509804, 0, 1, 1,
0.756364, -0.3344362, 2.764319, 0.4588235, 0, 1, 1,
0.7653428, 1.295386, 2.012661, 0.4627451, 0, 1, 1,
0.7659515, 1.161331, 0.9534827, 0.4705882, 0, 1, 1,
0.7699112, 1.82974, 0.3722657, 0.4745098, 0, 1, 1,
0.7704366, -0.2865111, 3.611164, 0.4823529, 0, 1, 1,
0.7717109, 0.6794685, 0.7610711, 0.4862745, 0, 1, 1,
0.7752123, 0.9472575, -0.9876363, 0.4941176, 0, 1, 1,
0.776572, 0.3679235, 1.421, 0.5019608, 0, 1, 1,
0.7766174, -1.413899, 3.407994, 0.5058824, 0, 1, 1,
0.7808675, -0.3883063, 2.363852, 0.5137255, 0, 1, 1,
0.7823368, 0.8464903, 2.239808, 0.5176471, 0, 1, 1,
0.7885179, 0.2686594, 2.063789, 0.5254902, 0, 1, 1,
0.7904956, 0.684655, 1.285011, 0.5294118, 0, 1, 1,
0.7910184, -0.5949774, 3.051285, 0.5372549, 0, 1, 1,
0.8002529, 1.095715, 1.103908, 0.5411765, 0, 1, 1,
0.8037545, 1.001171, 1.343619, 0.5490196, 0, 1, 1,
0.8040883, 0.3204959, 0.1499367, 0.5529412, 0, 1, 1,
0.8071576, 0.7815266, -0.4618826, 0.5607843, 0, 1, 1,
0.8088194, 0.2525873, 2.992876, 0.5647059, 0, 1, 1,
0.8108883, 0.1094187, -0.247442, 0.572549, 0, 1, 1,
0.8126409, -1.814701, 3.157236, 0.5764706, 0, 1, 1,
0.815075, 2.135993, -0.3544017, 0.5843138, 0, 1, 1,
0.8157536, -0.1181605, 3.331968, 0.5882353, 0, 1, 1,
0.8160934, 1.167445, 0.7140704, 0.5960785, 0, 1, 1,
0.8211577, 2.042483, 1.052039, 0.6039216, 0, 1, 1,
0.8217933, -1.048805, 2.440278, 0.6078432, 0, 1, 1,
0.8244317, 0.9656113, 2.278346, 0.6156863, 0, 1, 1,
0.8287585, 0.6836252, 3.564561, 0.6196079, 0, 1, 1,
0.8328405, 0.5063107, 2.273544, 0.627451, 0, 1, 1,
0.8333421, -0.4833546, 3.199358, 0.6313726, 0, 1, 1,
0.8364636, -0.8006713, 1.640023, 0.6392157, 0, 1, 1,
0.8444139, 0.9769061, -0.1302845, 0.6431373, 0, 1, 1,
0.8509666, -0.1764773, 0.9257354, 0.6509804, 0, 1, 1,
0.8526273, 0.1582121, 0.6179847, 0.654902, 0, 1, 1,
0.8533474, -1.278682, 2.233861, 0.6627451, 0, 1, 1,
0.8551647, -0.7675183, 2.207192, 0.6666667, 0, 1, 1,
0.8580243, 0.1517324, 1.199506, 0.6745098, 0, 1, 1,
0.8629375, -0.560702, 3.593526, 0.6784314, 0, 1, 1,
0.863427, 1.213349, 1.826096, 0.6862745, 0, 1, 1,
0.8637502, 0.7481263, 0.06509254, 0.6901961, 0, 1, 1,
0.8647841, -1.171584, 1.697628, 0.6980392, 0, 1, 1,
0.8769861, -1.109484, 3.306108, 0.7058824, 0, 1, 1,
0.8770959, -0.9450261, 2.955628, 0.7098039, 0, 1, 1,
0.883769, 2.677458, 2.917579, 0.7176471, 0, 1, 1,
0.8882021, 0.5122603, 1.185689, 0.7215686, 0, 1, 1,
0.8906999, 0.9482796, 0.9593242, 0.7294118, 0, 1, 1,
0.8932482, -0.9830272, 3.214532, 0.7333333, 0, 1, 1,
0.8971528, 1.637267, 1.775335, 0.7411765, 0, 1, 1,
0.9078508, -0.3758044, 2.054815, 0.7450981, 0, 1, 1,
0.9099267, -0.008001756, 1.035293, 0.7529412, 0, 1, 1,
0.9128811, -1.854398, 3.60797, 0.7568628, 0, 1, 1,
0.9225555, -0.2707005, 3.235615, 0.7647059, 0, 1, 1,
0.9247331, -1.350682, 1.824716, 0.7686275, 0, 1, 1,
0.9267626, 0.837246, 1.659921, 0.7764706, 0, 1, 1,
0.9270926, 0.09846274, 2.31019, 0.7803922, 0, 1, 1,
0.9300906, 0.5869555, -0.3705747, 0.7882353, 0, 1, 1,
0.9363884, 1.266235, 0.9000984, 0.7921569, 0, 1, 1,
0.9400402, -1.076108, 0.6762285, 0.8, 0, 1, 1,
0.9441448, 2.118429, 1.215315, 0.8078431, 0, 1, 1,
0.9464351, -0.8791668, 3.106017, 0.8117647, 0, 1, 1,
0.949265, -0.6798011, 1.66573, 0.8196079, 0, 1, 1,
0.9542539, 0.07947227, 1.000467, 0.8235294, 0, 1, 1,
0.9609532, -2.292607, 2.451477, 0.8313726, 0, 1, 1,
0.9759323, -0.01822566, 0.1562862, 0.8352941, 0, 1, 1,
0.9785704, -0.1694656, 2.629636, 0.8431373, 0, 1, 1,
0.9847443, 0.7489508, 1.232704, 0.8470588, 0, 1, 1,
0.9857277, -0.01564971, 2.055172, 0.854902, 0, 1, 1,
0.987186, 2.227582, -0.2932176, 0.8588235, 0, 1, 1,
0.9872385, 0.3805893, 1.143075, 0.8666667, 0, 1, 1,
0.9917244, 0.616019, 0.9251766, 0.8705882, 0, 1, 1,
0.9918398, -1.345753, 3.145568, 0.8784314, 0, 1, 1,
0.9981084, 1.744181, 1.635381, 0.8823529, 0, 1, 1,
1.000736, 1.070556, 2.309282, 0.8901961, 0, 1, 1,
1.008516, 0.5876629, 2.458, 0.8941177, 0, 1, 1,
1.010762, -0.5560361, 1.97207, 0.9019608, 0, 1, 1,
1.013938, -0.122214, -0.2139811, 0.9098039, 0, 1, 1,
1.01708, -1.840857, 2.078335, 0.9137255, 0, 1, 1,
1.027447, 0.01609931, 1.345807, 0.9215686, 0, 1, 1,
1.027964, 0.6371561, -0.8362506, 0.9254902, 0, 1, 1,
1.030552, 0.2275939, 2.606857, 0.9333333, 0, 1, 1,
1.031078, 0.3403368, 1.11932, 0.9372549, 0, 1, 1,
1.037135, 0.8210013, 1.004231, 0.945098, 0, 1, 1,
1.040344, 0.7806286, -0.4876589, 0.9490196, 0, 1, 1,
1.043106, -0.4077604, 3.075515, 0.9568627, 0, 1, 1,
1.049997, -0.02406244, 1.295563, 0.9607843, 0, 1, 1,
1.051045, 0.1212673, 1.448287, 0.9686275, 0, 1, 1,
1.051614, 0.3193836, 0.3919509, 0.972549, 0, 1, 1,
1.053719, -0.6662351, 2.045912, 0.9803922, 0, 1, 1,
1.054717, 0.9083899, 1.620987, 0.9843137, 0, 1, 1,
1.060301, -2.214999, 2.347117, 0.9921569, 0, 1, 1,
1.064421, -2.243073, 3.171899, 0.9960784, 0, 1, 1,
1.065449, 3.862886, 0.4059797, 1, 0, 0.9960784, 1,
1.076029, -0.1881804, 0.1144966, 1, 0, 0.9882353, 1,
1.085425, 0.2930399, 1.356384, 1, 0, 0.9843137, 1,
1.088907, -1.173535, 2.44392, 1, 0, 0.9764706, 1,
1.090062, 1.614602, 2.162063, 1, 0, 0.972549, 1,
1.096058, 0.8029842, 1.36844, 1, 0, 0.9647059, 1,
1.105343, -0.2317417, 2.20694, 1, 0, 0.9607843, 1,
1.109014, 0.8449063, 1.596131, 1, 0, 0.9529412, 1,
1.109134, -0.1602567, 3.806055, 1, 0, 0.9490196, 1,
1.111349, 0.5516992, 0.6210201, 1, 0, 0.9411765, 1,
1.112323, 1.351984, 1.924003, 1, 0, 0.9372549, 1,
1.119997, -0.6601242, 2.296175, 1, 0, 0.9294118, 1,
1.129155, 0.8688149, 1.215817, 1, 0, 0.9254902, 1,
1.129317, 0.9187717, 2.289406, 1, 0, 0.9176471, 1,
1.130323, -0.3001854, -0.1126351, 1, 0, 0.9137255, 1,
1.131013, -0.6126347, 1.269837, 1, 0, 0.9058824, 1,
1.133523, -0.9892544, 1.384524, 1, 0, 0.9019608, 1,
1.141175, -0.1375745, 0.1719472, 1, 0, 0.8941177, 1,
1.141526, 1.934591, 0.6068381, 1, 0, 0.8862745, 1,
1.144433, 0.2422682, 1.375362, 1, 0, 0.8823529, 1,
1.149562, 0.369348, 0.2075934, 1, 0, 0.8745098, 1,
1.153924, -2.015209, 3.837379, 1, 0, 0.8705882, 1,
1.166092, -0.05405723, 1.970731, 1, 0, 0.8627451, 1,
1.168318, -0.1392091, 0.64059, 1, 0, 0.8588235, 1,
1.173216, 0.5421558, 2.336157, 1, 0, 0.8509804, 1,
1.17546, -0.6147777, 2.099815, 1, 0, 0.8470588, 1,
1.189855, -1.013979, 2.362233, 1, 0, 0.8392157, 1,
1.191994, 0.7502524, -1.253115, 1, 0, 0.8352941, 1,
1.19562, -0.3780011, 2.906515, 1, 0, 0.827451, 1,
1.196384, 1.114052, 1.962447, 1, 0, 0.8235294, 1,
1.197976, 0.1904881, 0.7353327, 1, 0, 0.8156863, 1,
1.203497, 1.444458, -0.6178253, 1, 0, 0.8117647, 1,
1.209544, 2.103378, -0.2878481, 1, 0, 0.8039216, 1,
1.211368, -1.062044, 0.9884651, 1, 0, 0.7960784, 1,
1.214859, 0.1407148, 0.8439719, 1, 0, 0.7921569, 1,
1.217358, -1.172104, 2.542439, 1, 0, 0.7843137, 1,
1.218835, -0.05607416, 0.3807481, 1, 0, 0.7803922, 1,
1.230477, -1.982059, 4.543724, 1, 0, 0.772549, 1,
1.23424, 0.007803565, 1.271462, 1, 0, 0.7686275, 1,
1.240943, 0.2857763, 0.7677541, 1, 0, 0.7607843, 1,
1.242868, 1.325992, 0.5590781, 1, 0, 0.7568628, 1,
1.247729, -1.508085, 1.237762, 1, 0, 0.7490196, 1,
1.247829, 0.3671211, 1.039585, 1, 0, 0.7450981, 1,
1.260082, 0.2336955, 0.5617033, 1, 0, 0.7372549, 1,
1.26386, 0.3666769, 0.5243132, 1, 0, 0.7333333, 1,
1.265862, -1.44234, 1.913189, 1, 0, 0.7254902, 1,
1.269469, -0.4187126, 2.172988, 1, 0, 0.7215686, 1,
1.275646, -1.2534, 1.978523, 1, 0, 0.7137255, 1,
1.278669, -0.1089785, 1.197598, 1, 0, 0.7098039, 1,
1.281602, -0.1341042, 0.56537, 1, 0, 0.7019608, 1,
1.283178, -0.3464308, 2.279758, 1, 0, 0.6941177, 1,
1.284755, -1.371296, 3.392689, 1, 0, 0.6901961, 1,
1.285959, -1.330533, 1.328282, 1, 0, 0.682353, 1,
1.29199, -1.188631, 2.059221, 1, 0, 0.6784314, 1,
1.307646, 1.613158, 0.8367575, 1, 0, 0.6705883, 1,
1.310608, -0.4476592, 3.241854, 1, 0, 0.6666667, 1,
1.315791, 1.099652, -0.4323469, 1, 0, 0.6588235, 1,
1.322401, 1.149771, 1.909527, 1, 0, 0.654902, 1,
1.325154, 0.5846648, 1.164677, 1, 0, 0.6470588, 1,
1.331809, 0.9675985, 2.864479, 1, 0, 0.6431373, 1,
1.335806, -0.106768, -0.4949581, 1, 0, 0.6352941, 1,
1.34054, 0.5108773, 0.7856558, 1, 0, 0.6313726, 1,
1.341709, -1.656464, 2.719893, 1, 0, 0.6235294, 1,
1.341998, -1.333217, 1.9039, 1, 0, 0.6196079, 1,
1.350271, 0.57784, 1.427408, 1, 0, 0.6117647, 1,
1.353174, -1.05314, 1.008556, 1, 0, 0.6078432, 1,
1.384359, 0.1473801, 1.510594, 1, 0, 0.6, 1,
1.392225, -0.2344333, 2.499419, 1, 0, 0.5921569, 1,
1.392243, -0.3471068, 2.660722, 1, 0, 0.5882353, 1,
1.397464, -0.9009139, 3.935936, 1, 0, 0.5803922, 1,
1.399518, 1.015257, 3.188898, 1, 0, 0.5764706, 1,
1.404788, 1.134927, 1.555288, 1, 0, 0.5686275, 1,
1.413002, -1.399953, 2.761079, 1, 0, 0.5647059, 1,
1.416821, -0.1881637, 2.504134, 1, 0, 0.5568628, 1,
1.419922, 0.7135647, -0.9797017, 1, 0, 0.5529412, 1,
1.449917, 0.3287438, 3.468238, 1, 0, 0.5450981, 1,
1.452976, 0.9750293, 2.880197, 1, 0, 0.5411765, 1,
1.453271, 0.3304607, 0.9227509, 1, 0, 0.5333334, 1,
1.455757, 0.2778748, 0.6360648, 1, 0, 0.5294118, 1,
1.460951, -0.6579121, 2.470124, 1, 0, 0.5215687, 1,
1.463931, -1.137771, 2.926437, 1, 0, 0.5176471, 1,
1.465921, 0.5384071, 1.715302, 1, 0, 0.509804, 1,
1.48095, 1.553451, 1.28781, 1, 0, 0.5058824, 1,
1.484003, 0.5798841, 1.715185, 1, 0, 0.4980392, 1,
1.488426, 2.237218, 0.7838041, 1, 0, 0.4901961, 1,
1.519803, 0.9510127, 1.485248, 1, 0, 0.4862745, 1,
1.527465, 2.226335, 0.2550648, 1, 0, 0.4784314, 1,
1.541014, -0.02146829, 1.801414, 1, 0, 0.4745098, 1,
1.556339, 0.4779701, 1.998159, 1, 0, 0.4666667, 1,
1.558878, -0.7491069, 2.525646, 1, 0, 0.4627451, 1,
1.561236, -0.3088844, 3.100183, 1, 0, 0.454902, 1,
1.570777, -0.8301608, 0.2867768, 1, 0, 0.4509804, 1,
1.573332, 0.7427859, -0.2206874, 1, 0, 0.4431373, 1,
1.575336, -0.6500775, 1.575588, 1, 0, 0.4392157, 1,
1.581614, -1.171658, 2.185437, 1, 0, 0.4313726, 1,
1.58476, 0.6143191, 1.186884, 1, 0, 0.427451, 1,
1.587252, 1.325166, 1.357584, 1, 0, 0.4196078, 1,
1.594629, -0.7027076, 1.301677, 1, 0, 0.4156863, 1,
1.60442, 2.016457, -0.3751062, 1, 0, 0.4078431, 1,
1.607229, -2.507808, 1.886311, 1, 0, 0.4039216, 1,
1.60974, 0.4735685, 2.332934, 1, 0, 0.3960784, 1,
1.611514, 0.4960988, 1.017573, 1, 0, 0.3882353, 1,
1.613424, -0.7758177, 2.826886, 1, 0, 0.3843137, 1,
1.623698, 0.3825707, 0.248962, 1, 0, 0.3764706, 1,
1.633496, -0.6382507, 0.5873882, 1, 0, 0.372549, 1,
1.675998, -1.177682, 2.570088, 1, 0, 0.3647059, 1,
1.697237, 0.2245071, 1.247644, 1, 0, 0.3607843, 1,
1.701015, 0.5011776, 2.990649, 1, 0, 0.3529412, 1,
1.702363, 1.072782, 0.626472, 1, 0, 0.3490196, 1,
1.707056, 0.8195518, 0.8231086, 1, 0, 0.3411765, 1,
1.712662, -0.3818696, 1.91086, 1, 0, 0.3372549, 1,
1.721297, 0.583029, 3.391715, 1, 0, 0.3294118, 1,
1.735661, -0.3202847, 1.462405, 1, 0, 0.3254902, 1,
1.756629, -1.113611, 0.6926396, 1, 0, 0.3176471, 1,
1.764111, 0.09148968, 1.622767, 1, 0, 0.3137255, 1,
1.783438, -0.8601845, 2.255832, 1, 0, 0.3058824, 1,
1.784825, 1.350081, -0.5635738, 1, 0, 0.2980392, 1,
1.808444, 0.4457569, 1.635933, 1, 0, 0.2941177, 1,
1.810434, -0.4685407, 3.08458, 1, 0, 0.2862745, 1,
1.818798, -1.778574, 2.483468, 1, 0, 0.282353, 1,
1.820216, -0.1530702, 1.224129, 1, 0, 0.2745098, 1,
1.826169, -0.06199674, 1.421675, 1, 0, 0.2705882, 1,
1.831936, 0.147374, 1.647729, 1, 0, 0.2627451, 1,
1.83825, -1.029045, 1.364937, 1, 0, 0.2588235, 1,
1.849545, 0.281547, 2.177391, 1, 0, 0.2509804, 1,
1.85405, 0.8336594, 1.62052, 1, 0, 0.2470588, 1,
1.861324, -2.047182, 2.453902, 1, 0, 0.2392157, 1,
1.90589, 1.599408, 0.3453346, 1, 0, 0.2352941, 1,
1.909937, -0.2224256, 1.843516, 1, 0, 0.227451, 1,
1.911606, -0.7374013, 2.166405, 1, 0, 0.2235294, 1,
1.911659, -0.7838079, 1.313058, 1, 0, 0.2156863, 1,
1.930434, -0.8830402, 1.588249, 1, 0, 0.2117647, 1,
1.933484, 1.318693, 0.1507373, 1, 0, 0.2039216, 1,
1.94053, -0.9439653, 0.6644651, 1, 0, 0.1960784, 1,
1.942245, -1.034107, 2.727928, 1, 0, 0.1921569, 1,
1.953598, 2.331107, -1.195756, 1, 0, 0.1843137, 1,
1.964303, 0.8363932, 1.304615, 1, 0, 0.1803922, 1,
1.986852, -0.5220857, 2.845156, 1, 0, 0.172549, 1,
2.001548, 0.7331657, 1.952536, 1, 0, 0.1686275, 1,
2.022452, 0.751718, 0.2655992, 1, 0, 0.1607843, 1,
2.069864, 0.1489792, 2.851181, 1, 0, 0.1568628, 1,
2.074605, -0.8065951, 1.680407, 1, 0, 0.1490196, 1,
2.07745, -0.2977165, 2.856743, 1, 0, 0.145098, 1,
2.127809, -1.762075, 3.021424, 1, 0, 0.1372549, 1,
2.142932, 0.8426467, 0.1442249, 1, 0, 0.1333333, 1,
2.16836, -0.1612583, 0.9538437, 1, 0, 0.1254902, 1,
2.179145, 2.193444, -1.610358, 1, 0, 0.1215686, 1,
2.179289, 0.08720981, 0.06816819, 1, 0, 0.1137255, 1,
2.182339, 0.6337571, 0.8693953, 1, 0, 0.1098039, 1,
2.1904, -1.081783, 1.671731, 1, 0, 0.1019608, 1,
2.225296, -0.6611693, 0.3546464, 1, 0, 0.09411765, 1,
2.243328, -0.2183017, 2.088875, 1, 0, 0.09019608, 1,
2.252699, -1.015599, 2.272592, 1, 0, 0.08235294, 1,
2.263527, -1.176667, 4.134282, 1, 0, 0.07843138, 1,
2.27316, -1.638389, 0.9212973, 1, 0, 0.07058824, 1,
2.292401, -1.991811, 1.89188, 1, 0, 0.06666667, 1,
2.319311, 0.316627, 1.909317, 1, 0, 0.05882353, 1,
2.343467, 0.3100081, 1.572899, 1, 0, 0.05490196, 1,
2.368518, 0.0703169, 0.4186317, 1, 0, 0.04705882, 1,
2.411683, 0.08996808, 3.954453, 1, 0, 0.04313726, 1,
2.443673, 0.736025, 1.358458, 1, 0, 0.03529412, 1,
2.520362, -0.8642423, 2.132627, 1, 0, 0.03137255, 1,
2.575242, -0.2822204, 1.395259, 1, 0, 0.02352941, 1,
2.651057, 1.023621, 1.165056, 1, 0, 0.01960784, 1,
2.681993, -0.2006536, 4.670959, 1, 0, 0.01176471, 1,
3.512009, 1.027154, 0.2979155, 1, 0, 0.007843138, 1
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
0.08257985, -4.207237, -7.363376, 0, -0.5, 0.5, 0.5,
0.08257985, -4.207237, -7.363376, 1, -0.5, 0.5, 0.5,
0.08257985, -4.207237, -7.363376, 1, 1.5, 0.5, 0.5,
0.08257985, -4.207237, -7.363376, 0, 1.5, 0.5, 0.5
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
-4.509426, 0.4126414, -7.363376, 0, -0.5, 0.5, 0.5,
-4.509426, 0.4126414, -7.363376, 1, -0.5, 0.5, 0.5,
-4.509426, 0.4126414, -7.363376, 1, 1.5, 0.5, 0.5,
-4.509426, 0.4126414, -7.363376, 0, 1.5, 0.5, 0.5
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
-4.509426, -4.207237, -0.07305098, 0, -0.5, 0.5, 0.5,
-4.509426, -4.207237, -0.07305098, 1, -0.5, 0.5, 0.5,
-4.509426, -4.207237, -0.07305098, 1, 1.5, 0.5, 0.5,
-4.509426, -4.207237, -0.07305098, 0, 1.5, 0.5, 0.5
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
-3, -3.141111, -5.680993,
3, -3.141111, -5.680993,
-3, -3.141111, -5.680993,
-3, -3.318799, -5.96139,
-2, -3.141111, -5.680993,
-2, -3.318799, -5.96139,
-1, -3.141111, -5.680993,
-1, -3.318799, -5.96139,
0, -3.141111, -5.680993,
0, -3.318799, -5.96139,
1, -3.141111, -5.680993,
1, -3.318799, -5.96139,
2, -3.141111, -5.680993,
2, -3.318799, -5.96139,
3, -3.141111, -5.680993,
3, -3.318799, -5.96139
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
-3, -3.674174, -6.522184, 0, -0.5, 0.5, 0.5,
-3, -3.674174, -6.522184, 1, -0.5, 0.5, 0.5,
-3, -3.674174, -6.522184, 1, 1.5, 0.5, 0.5,
-3, -3.674174, -6.522184, 0, 1.5, 0.5, 0.5,
-2, -3.674174, -6.522184, 0, -0.5, 0.5, 0.5,
-2, -3.674174, -6.522184, 1, -0.5, 0.5, 0.5,
-2, -3.674174, -6.522184, 1, 1.5, 0.5, 0.5,
-2, -3.674174, -6.522184, 0, 1.5, 0.5, 0.5,
-1, -3.674174, -6.522184, 0, -0.5, 0.5, 0.5,
-1, -3.674174, -6.522184, 1, -0.5, 0.5, 0.5,
-1, -3.674174, -6.522184, 1, 1.5, 0.5, 0.5,
-1, -3.674174, -6.522184, 0, 1.5, 0.5, 0.5,
0, -3.674174, -6.522184, 0, -0.5, 0.5, 0.5,
0, -3.674174, -6.522184, 1, -0.5, 0.5, 0.5,
0, -3.674174, -6.522184, 1, 1.5, 0.5, 0.5,
0, -3.674174, -6.522184, 0, 1.5, 0.5, 0.5,
1, -3.674174, -6.522184, 0, -0.5, 0.5, 0.5,
1, -3.674174, -6.522184, 1, -0.5, 0.5, 0.5,
1, -3.674174, -6.522184, 1, 1.5, 0.5, 0.5,
1, -3.674174, -6.522184, 0, 1.5, 0.5, 0.5,
2, -3.674174, -6.522184, 0, -0.5, 0.5, 0.5,
2, -3.674174, -6.522184, 1, -0.5, 0.5, 0.5,
2, -3.674174, -6.522184, 1, 1.5, 0.5, 0.5,
2, -3.674174, -6.522184, 0, 1.5, 0.5, 0.5,
3, -3.674174, -6.522184, 0, -0.5, 0.5, 0.5,
3, -3.674174, -6.522184, 1, -0.5, 0.5, 0.5,
3, -3.674174, -6.522184, 1, 1.5, 0.5, 0.5,
3, -3.674174, -6.522184, 0, 1.5, 0.5, 0.5
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
-3.449732, -3, -5.680993,
-3.449732, 3, -5.680993,
-3.449732, -3, -5.680993,
-3.626348, -3, -5.96139,
-3.449732, -2, -5.680993,
-3.626348, -2, -5.96139,
-3.449732, -1, -5.680993,
-3.626348, -1, -5.96139,
-3.449732, 0, -5.680993,
-3.626348, 0, -5.96139,
-3.449732, 1, -5.680993,
-3.626348, 1, -5.96139,
-3.449732, 2, -5.680993,
-3.626348, 2, -5.96139,
-3.449732, 3, -5.680993,
-3.626348, 3, -5.96139
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
-3.979579, -3, -6.522184, 0, -0.5, 0.5, 0.5,
-3.979579, -3, -6.522184, 1, -0.5, 0.5, 0.5,
-3.979579, -3, -6.522184, 1, 1.5, 0.5, 0.5,
-3.979579, -3, -6.522184, 0, 1.5, 0.5, 0.5,
-3.979579, -2, -6.522184, 0, -0.5, 0.5, 0.5,
-3.979579, -2, -6.522184, 1, -0.5, 0.5, 0.5,
-3.979579, -2, -6.522184, 1, 1.5, 0.5, 0.5,
-3.979579, -2, -6.522184, 0, 1.5, 0.5, 0.5,
-3.979579, -1, -6.522184, 0, -0.5, 0.5, 0.5,
-3.979579, -1, -6.522184, 1, -0.5, 0.5, 0.5,
-3.979579, -1, -6.522184, 1, 1.5, 0.5, 0.5,
-3.979579, -1, -6.522184, 0, 1.5, 0.5, 0.5,
-3.979579, 0, -6.522184, 0, -0.5, 0.5, 0.5,
-3.979579, 0, -6.522184, 1, -0.5, 0.5, 0.5,
-3.979579, 0, -6.522184, 1, 1.5, 0.5, 0.5,
-3.979579, 0, -6.522184, 0, 1.5, 0.5, 0.5,
-3.979579, 1, -6.522184, 0, -0.5, 0.5, 0.5,
-3.979579, 1, -6.522184, 1, -0.5, 0.5, 0.5,
-3.979579, 1, -6.522184, 1, 1.5, 0.5, 0.5,
-3.979579, 1, -6.522184, 0, 1.5, 0.5, 0.5,
-3.979579, 2, -6.522184, 0, -0.5, 0.5, 0.5,
-3.979579, 2, -6.522184, 1, -0.5, 0.5, 0.5,
-3.979579, 2, -6.522184, 1, 1.5, 0.5, 0.5,
-3.979579, 2, -6.522184, 0, 1.5, 0.5, 0.5,
-3.979579, 3, -6.522184, 0, -0.5, 0.5, 0.5,
-3.979579, 3, -6.522184, 1, -0.5, 0.5, 0.5,
-3.979579, 3, -6.522184, 1, 1.5, 0.5, 0.5,
-3.979579, 3, -6.522184, 0, 1.5, 0.5, 0.5
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
-3.449732, -3.141111, -4,
-3.449732, -3.141111, 4,
-3.449732, -3.141111, -4,
-3.626348, -3.318799, -4,
-3.449732, -3.141111, -2,
-3.626348, -3.318799, -2,
-3.449732, -3.141111, 0,
-3.626348, -3.318799, 0,
-3.449732, -3.141111, 2,
-3.626348, -3.318799, 2,
-3.449732, -3.141111, 4,
-3.626348, -3.318799, 4
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
-3.979579, -3.674174, -4, 0, -0.5, 0.5, 0.5,
-3.979579, -3.674174, -4, 1, -0.5, 0.5, 0.5,
-3.979579, -3.674174, -4, 1, 1.5, 0.5, 0.5,
-3.979579, -3.674174, -4, 0, 1.5, 0.5, 0.5,
-3.979579, -3.674174, -2, 0, -0.5, 0.5, 0.5,
-3.979579, -3.674174, -2, 1, -0.5, 0.5, 0.5,
-3.979579, -3.674174, -2, 1, 1.5, 0.5, 0.5,
-3.979579, -3.674174, -2, 0, 1.5, 0.5, 0.5,
-3.979579, -3.674174, 0, 0, -0.5, 0.5, 0.5,
-3.979579, -3.674174, 0, 1, -0.5, 0.5, 0.5,
-3.979579, -3.674174, 0, 1, 1.5, 0.5, 0.5,
-3.979579, -3.674174, 0, 0, 1.5, 0.5, 0.5,
-3.979579, -3.674174, 2, 0, -0.5, 0.5, 0.5,
-3.979579, -3.674174, 2, 1, -0.5, 0.5, 0.5,
-3.979579, -3.674174, 2, 1, 1.5, 0.5, 0.5,
-3.979579, -3.674174, 2, 0, 1.5, 0.5, 0.5,
-3.979579, -3.674174, 4, 0, -0.5, 0.5, 0.5,
-3.979579, -3.674174, 4, 1, -0.5, 0.5, 0.5,
-3.979579, -3.674174, 4, 1, 1.5, 0.5, 0.5,
-3.979579, -3.674174, 4, 0, 1.5, 0.5, 0.5
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
-3.449732, -3.141111, -5.680993,
-3.449732, 3.966394, -5.680993,
-3.449732, -3.141111, 5.534891,
-3.449732, 3.966394, 5.534891,
-3.449732, -3.141111, -5.680993,
-3.449732, -3.141111, 5.534891,
-3.449732, 3.966394, -5.680993,
-3.449732, 3.966394, 5.534891,
-3.449732, -3.141111, -5.680993,
3.614892, -3.141111, -5.680993,
-3.449732, -3.141111, 5.534891,
3.614892, -3.141111, 5.534891,
-3.449732, 3.966394, -5.680993,
3.614892, 3.966394, -5.680993,
-3.449732, 3.966394, 5.534891,
3.614892, 3.966394, 5.534891,
3.614892, -3.141111, -5.680993,
3.614892, 3.966394, -5.680993,
3.614892, -3.141111, 5.534891,
3.614892, 3.966394, 5.534891,
3.614892, -3.141111, -5.680993,
3.614892, -3.141111, 5.534891,
3.614892, 3.966394, -5.680993,
3.614892, 3.966394, 5.534891
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
var radius = 8.031423;
var distance = 35.73271;
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
mvMatrix.translate( -0.08257985, -0.4126414, 0.07305098 );
mvMatrix.scale( 1.229185, 1.221769, 0.7742351 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.73271);
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
fenoxaprop-P<-read.table("fenoxaprop-P.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fenoxaprop-P$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenoxaprop' not found
```

```r
y<-fenoxaprop-P$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenoxaprop' not found
```

```r
z<-fenoxaprop-P$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenoxaprop' not found
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
-3.346849, 0.7704128, -0.3202617, 0, 0, 1, 1, 1,
-3.037588, -0.8206711, -3.582476, 1, 0, 0, 1, 1,
-2.931073, -1.442063, -1.416807, 1, 0, 0, 1, 1,
-2.862118, 1.190687, -2.732553, 1, 0, 0, 1, 1,
-2.693832, 0.1138753, -0.2086716, 1, 0, 0, 1, 1,
-2.668066, 1.486855, -1.421606, 1, 0, 0, 1, 1,
-2.453226, -1.076522, -3.060942, 0, 0, 0, 1, 1,
-2.443585, 0.6326129, -1.356777, 0, 0, 0, 1, 1,
-2.331542, 0.3622212, 0.8483907, 0, 0, 0, 1, 1,
-2.330671, 0.1067062, -1.325493, 0, 0, 0, 1, 1,
-2.306662, 1.344495, -0.2357901, 0, 0, 0, 1, 1,
-2.247426, -1.258885, -3.770738, 0, 0, 0, 1, 1,
-2.238478, 2.142028, 0.06063946, 0, 0, 0, 1, 1,
-2.2117, 0.9475445, -0.3096688, 1, 1, 1, 1, 1,
-2.210091, -0.01701797, -0.8970201, 1, 1, 1, 1, 1,
-2.207566, -0.9686909, -3.035892, 1, 1, 1, 1, 1,
-2.17478, 2.7078, 0.1296444, 1, 1, 1, 1, 1,
-2.167228, 1.294827, -1.454953, 1, 1, 1, 1, 1,
-2.136251, -0.1399467, -1.388938, 1, 1, 1, 1, 1,
-2.126011, 1.025732, -0.5617898, 1, 1, 1, 1, 1,
-2.091314, -1.73513, -3.557842, 1, 1, 1, 1, 1,
-2.066892, -0.3725642, -2.019299, 1, 1, 1, 1, 1,
-2.054243, 0.7480823, -1.882286, 1, 1, 1, 1, 1,
-2.035416, -0.9486758, 0.006917472, 1, 1, 1, 1, 1,
-2.033285, 0.5048635, -2.380193, 1, 1, 1, 1, 1,
-2.029888, 0.3305314, -3.220855, 1, 1, 1, 1, 1,
-1.967286, -0.437356, -2.4921, 1, 1, 1, 1, 1,
-1.958627, 0.696382, -1.934751, 1, 1, 1, 1, 1,
-1.957753, -1.338736, -2.262221, 0, 0, 1, 1, 1,
-1.93736, 0.5376881, 1.213373, 1, 0, 0, 1, 1,
-1.907918, 0.003645658, -2.4703, 1, 0, 0, 1, 1,
-1.869359, 1.076678, -1.356576, 1, 0, 0, 1, 1,
-1.857495, -0.3529596, -1.322874, 1, 0, 0, 1, 1,
-1.854087, -0.4716337, -1.893132, 1, 0, 0, 1, 1,
-1.843069, -0.3988542, -2.303245, 0, 0, 0, 1, 1,
-1.840843, 0.8337555, -0.1775979, 0, 0, 0, 1, 1,
-1.824059, 1.796917, -1.779521, 0, 0, 0, 1, 1,
-1.816611, -0.5361078, -1.228411, 0, 0, 0, 1, 1,
-1.789408, 0.2780821, -2.961949, 0, 0, 0, 1, 1,
-1.78654, 1.786814, -1.375117, 0, 0, 0, 1, 1,
-1.773527, -0.7359715, -1.855159, 0, 0, 0, 1, 1,
-1.733823, -1.288695, -2.527798, 1, 1, 1, 1, 1,
-1.712034, -0.6898264, -1.819036, 1, 1, 1, 1, 1,
-1.698789, -0.6489945, -2.851973, 1, 1, 1, 1, 1,
-1.694004, -1.290716, -2.575042, 1, 1, 1, 1, 1,
-1.692704, 1.035605, -0.6888549, 1, 1, 1, 1, 1,
-1.680858, 1.374042, 0.1667648, 1, 1, 1, 1, 1,
-1.677999, -0.4130322, -1.972218, 1, 1, 1, 1, 1,
-1.653655, 0.8987699, -2.76276, 1, 1, 1, 1, 1,
-1.653409, -0.573719, -1.060422, 1, 1, 1, 1, 1,
-1.638208, 0.3015962, -0.6847987, 1, 1, 1, 1, 1,
-1.63421, -0.2881735, -0.8764473, 1, 1, 1, 1, 1,
-1.626692, 0.1319748, -0.8926775, 1, 1, 1, 1, 1,
-1.617412, -0.4567903, -3.622258, 1, 1, 1, 1, 1,
-1.605274, -1.243162, -1.62182, 1, 1, 1, 1, 1,
-1.550249, -0.4864644, 0.1863454, 1, 1, 1, 1, 1,
-1.536898, -0.6631827, -2.005954, 0, 0, 1, 1, 1,
-1.518128, -0.2966138, -1.776543, 1, 0, 0, 1, 1,
-1.50566, -1.833839, -3.196645, 1, 0, 0, 1, 1,
-1.505322, -1.245134, -2.717439, 1, 0, 0, 1, 1,
-1.50433, 0.4309351, -2.475779, 1, 0, 0, 1, 1,
-1.502498, 0.2678761, -1.751282, 1, 0, 0, 1, 1,
-1.499327, 0.5289207, -1.229477, 0, 0, 0, 1, 1,
-1.485112, 0.606597, -1.699098, 0, 0, 0, 1, 1,
-1.474338, -0.872229, -1.707192, 0, 0, 0, 1, 1,
-1.464968, -0.02361862, -0.8155049, 0, 0, 0, 1, 1,
-1.461641, 0.6974152, -0.6675053, 0, 0, 0, 1, 1,
-1.460742, -1.040488, -2.482649, 0, 0, 0, 1, 1,
-1.456813, -0.5839747, -3.740251, 0, 0, 0, 1, 1,
-1.434757, 0.04676128, 0.5695562, 1, 1, 1, 1, 1,
-1.426654, -0.3027665, -2.148746, 1, 1, 1, 1, 1,
-1.418019, 0.8503673, -0.6432391, 1, 1, 1, 1, 1,
-1.392359, 0.5276957, -0.883543, 1, 1, 1, 1, 1,
-1.390314, -0.6605424, -0.7309701, 1, 1, 1, 1, 1,
-1.374869, -0.2793162, -1.649295, 1, 1, 1, 1, 1,
-1.370253, -1.196029, -1.290656, 1, 1, 1, 1, 1,
-1.360902, 1.009108, -1.400735, 1, 1, 1, 1, 1,
-1.360422, 0.600534, -2.058826, 1, 1, 1, 1, 1,
-1.344755, 0.8077306, -0.8702352, 1, 1, 1, 1, 1,
-1.340149, 1.782581, -0.5811949, 1, 1, 1, 1, 1,
-1.317252, 2.061001, -0.4589086, 1, 1, 1, 1, 1,
-1.310671, 0.3194633, -0.329784, 1, 1, 1, 1, 1,
-1.309494, 1.069806, -1.037681, 1, 1, 1, 1, 1,
-1.292876, 0.7843391, -1.046347, 1, 1, 1, 1, 1,
-1.290201, -0.4787756, -1.343377, 0, 0, 1, 1, 1,
-1.289597, 0.05364759, -2.135118, 1, 0, 0, 1, 1,
-1.283655, 0.1879323, -0.06207802, 1, 0, 0, 1, 1,
-1.280802, -0.01206529, -1.015379, 1, 0, 0, 1, 1,
-1.279408, 1.255972, -1.123214, 1, 0, 0, 1, 1,
-1.26184, -0.8830727, -1.695415, 1, 0, 0, 1, 1,
-1.25562, -0.93639, -2.248828, 0, 0, 0, 1, 1,
-1.255084, -0.7847825, -0.9821462, 0, 0, 0, 1, 1,
-1.253393, 0.7919264, -0.6678022, 0, 0, 0, 1, 1,
-1.247714, 0.4741774, -1.297761, 0, 0, 0, 1, 1,
-1.246329, 0.1622507, -2.10323, 0, 0, 0, 1, 1,
-1.245383, -1.352122, -0.9677054, 0, 0, 0, 1, 1,
-1.243432, 1.557885, 0.04136216, 0, 0, 0, 1, 1,
-1.24261, -0.8550253, -2.268696, 1, 1, 1, 1, 1,
-1.242359, -1.156492, -1.886406, 1, 1, 1, 1, 1,
-1.239438, -0.6031593, -1.748443, 1, 1, 1, 1, 1,
-1.237227, -0.195227, -0.7566533, 1, 1, 1, 1, 1,
-1.231448, -0.4045552, 0.9558904, 1, 1, 1, 1, 1,
-1.220984, -1.572888, -4.312529, 1, 1, 1, 1, 1,
-1.218387, 1.295628, 0.4459418, 1, 1, 1, 1, 1,
-1.21209, 0.5119426, -0.1189418, 1, 1, 1, 1, 1,
-1.207894, -1.937261, -2.713079, 1, 1, 1, 1, 1,
-1.201374, -0.9278448, -0.4507858, 1, 1, 1, 1, 1,
-1.195861, -0.7686718, -1.635414, 1, 1, 1, 1, 1,
-1.194949, 1.11162, -0.9634199, 1, 1, 1, 1, 1,
-1.182953, 2.509763, -0.5219843, 1, 1, 1, 1, 1,
-1.171515, 2.225702, -0.7712103, 1, 1, 1, 1, 1,
-1.165246, -1.164212, -1.937765, 1, 1, 1, 1, 1,
-1.16355, 1.74062, -0.5180213, 0, 0, 1, 1, 1,
-1.15525, 1.187846, -0.5516958, 1, 0, 0, 1, 1,
-1.153877, 2.065106, 0.2067483, 1, 0, 0, 1, 1,
-1.130268, 0.6018187, -1.213333, 1, 0, 0, 1, 1,
-1.1167, -2.971116, -2.995837, 1, 0, 0, 1, 1,
-1.115711, 0.6357448, -0.6814117, 1, 0, 0, 1, 1,
-1.104543, 0.7422099, 0.8647667, 0, 0, 0, 1, 1,
-1.102638, -0.2500642, -3.226303, 0, 0, 0, 1, 1,
-1.101302, -0.994186, -2.848126, 0, 0, 0, 1, 1,
-1.100025, -0.07727777, -2.349066, 0, 0, 0, 1, 1,
-1.095187, 0.7978235, -0.3606785, 0, 0, 0, 1, 1,
-1.0948, -1.752087, -3.43695, 0, 0, 0, 1, 1,
-1.093457, 0.1132159, -2.695268, 0, 0, 0, 1, 1,
-1.079021, 0.3549325, 0.3502411, 1, 1, 1, 1, 1,
-1.078331, 1.050765, -0.8484893, 1, 1, 1, 1, 1,
-1.076229, -0.145673, 0.5328233, 1, 1, 1, 1, 1,
-1.058954, -0.5639839, -2.249067, 1, 1, 1, 1, 1,
-1.057954, 2.374477, -0.3077227, 1, 1, 1, 1, 1,
-1.05604, 0.6178, -0.3778239, 1, 1, 1, 1, 1,
-1.05602, -1.979011, -2.976847, 1, 1, 1, 1, 1,
-1.052447, 0.6652005, -2.536109, 1, 1, 1, 1, 1,
-1.052013, -2.51345, -1.838085, 1, 1, 1, 1, 1,
-1.043887, 0.7103016, -0.148333, 1, 1, 1, 1, 1,
-1.040902, -1.537373, -2.322872, 1, 1, 1, 1, 1,
-1.040819, -1.365811, -3.699603, 1, 1, 1, 1, 1,
-1.035553, 1.158309, 0.2803318, 1, 1, 1, 1, 1,
-1.019128, -0.9297836, -3.75869, 1, 1, 1, 1, 1,
-1.014553, 0.7622147, 1.290338, 1, 1, 1, 1, 1,
-1.014367, 1.468391, -0.9589712, 0, 0, 1, 1, 1,
-1.01415, -0.9304782, -1.788163, 1, 0, 0, 1, 1,
-1.013141, 0.7668921, -3.597992, 1, 0, 0, 1, 1,
-1.011284, 0.8288189, -0.03736277, 1, 0, 0, 1, 1,
-1.010696, -0.6095762, -2.782121, 1, 0, 0, 1, 1,
-1.009189, 0.2897627, -1.663847, 1, 0, 0, 1, 1,
-1.00861, -0.3037208, -1.60896, 0, 0, 0, 1, 1,
-1.007994, 0.5934086, -1.183649, 0, 0, 0, 1, 1,
-1.003632, 0.4837497, -2.350753, 0, 0, 0, 1, 1,
-0.9999067, 2.674603, -0.2192635, 0, 0, 0, 1, 1,
-0.9988867, 0.764844, -0.643825, 0, 0, 0, 1, 1,
-0.9912464, 0.4969644, -0.8652918, 0, 0, 0, 1, 1,
-0.9912208, 0.9142901, -1.464561, 0, 0, 0, 1, 1,
-0.9849961, 0.1886304, -1.352496, 1, 1, 1, 1, 1,
-0.9811801, 2.24599, -0.9827207, 1, 1, 1, 1, 1,
-0.9794418, 0.01606061, -1.962358, 1, 1, 1, 1, 1,
-0.9723861, -0.7446722, -3.670003, 1, 1, 1, 1, 1,
-0.9692843, -0.4210027, -2.540688, 1, 1, 1, 1, 1,
-0.9611832, -0.7604783, -2.777283, 1, 1, 1, 1, 1,
-0.9588382, -0.1612488, -1.351648, 1, 1, 1, 1, 1,
-0.9466563, -0.08162037, -1.030615, 1, 1, 1, 1, 1,
-0.9463497, -0.2721078, -1.288851, 1, 1, 1, 1, 1,
-0.938473, 0.3246699, -2.072431, 1, 1, 1, 1, 1,
-0.9315042, 0.6200246, 0.01870498, 1, 1, 1, 1, 1,
-0.9289598, 1.117051, -0.5818176, 1, 1, 1, 1, 1,
-0.9286786, -0.7064801, -2.609941, 1, 1, 1, 1, 1,
-0.9232485, 0.9863855, -1.426546, 1, 1, 1, 1, 1,
-0.9202999, -0.2440079, -0.03868037, 1, 1, 1, 1, 1,
-0.916535, 1.747705, -2.168327, 0, 0, 1, 1, 1,
-0.9118384, -0.7283353, -4.607355, 1, 0, 0, 1, 1,
-0.9117083, 1.40298, -1.852189, 1, 0, 0, 1, 1,
-0.8997676, -1.630505, -3.60007, 1, 0, 0, 1, 1,
-0.8927652, -1.598759, -1.617063, 1, 0, 0, 1, 1,
-0.8910493, -0.7636802, -4.657889, 1, 0, 0, 1, 1,
-0.8886263, -1.217775, -2.501074, 0, 0, 0, 1, 1,
-0.8867282, 0.5642088, -0.6525688, 0, 0, 0, 1, 1,
-0.8862475, 0.1060852, -1.491392, 0, 0, 0, 1, 1,
-0.8851283, -1.610277, -1.796396, 0, 0, 0, 1, 1,
-0.8848763, 0.07160085, -1.958889, 0, 0, 0, 1, 1,
-0.8844356, 0.0348843, -2.600374, 0, 0, 0, 1, 1,
-0.8839603, 2.820094, -1.49612, 0, 0, 0, 1, 1,
-0.8738933, 1.938747, 1.760503, 1, 1, 1, 1, 1,
-0.8736078, -0.4153649, -0.5405602, 1, 1, 1, 1, 1,
-0.8727026, 0.751759, -2.074459, 1, 1, 1, 1, 1,
-0.8700914, 2.441398, 0.1599838, 1, 1, 1, 1, 1,
-0.8531234, 0.4849464, -1.571826, 1, 1, 1, 1, 1,
-0.8518337, -1.181458, -1.717942, 1, 1, 1, 1, 1,
-0.8498345, -1.073412, -1.714968, 1, 1, 1, 1, 1,
-0.8457262, 1.365806, -2.782509, 1, 1, 1, 1, 1,
-0.8403431, -0.02442488, -3.651813, 1, 1, 1, 1, 1,
-0.8397676, -0.5273368, -0.6424358, 1, 1, 1, 1, 1,
-0.8370368, 0.5320717, -0.1677239, 1, 1, 1, 1, 1,
-0.8318992, 1.011465, 0.9142668, 1, 1, 1, 1, 1,
-0.826044, -0.6926022, -1.228461, 1, 1, 1, 1, 1,
-0.8217528, 0.7981499, 0.6769204, 1, 1, 1, 1, 1,
-0.8192832, -0.86155, -2.644574, 1, 1, 1, 1, 1,
-0.8136839, 0.5165651, -0.8708214, 0, 0, 1, 1, 1,
-0.8090649, 0.03263193, -1.659271, 1, 0, 0, 1, 1,
-0.8062601, 1.44649, 0.2012182, 1, 0, 0, 1, 1,
-0.7952788, -0.553157, -4.244078, 1, 0, 0, 1, 1,
-0.7877728, -1.408021, -2.738118, 1, 0, 0, 1, 1,
-0.7856118, 1.233469, -0.7445996, 1, 0, 0, 1, 1,
-0.7833034, -0.1003524, -0.4249448, 0, 0, 0, 1, 1,
-0.771015, 0.7521908, -0.2651964, 0, 0, 0, 1, 1,
-0.7697753, 0.2474819, -0.5775116, 0, 0, 0, 1, 1,
-0.7669564, 0.02849909, -2.710932, 0, 0, 0, 1, 1,
-0.766874, 2.926915, 0.1676751, 0, 0, 0, 1, 1,
-0.7610615, -0.3292333, -1.745602, 0, 0, 0, 1, 1,
-0.757688, 0.1323127, -2.130613, 0, 0, 0, 1, 1,
-0.7570291, 0.3649123, -0.1607944, 1, 1, 1, 1, 1,
-0.7492048, -0.1393877, -1.363371, 1, 1, 1, 1, 1,
-0.7471707, 1.080005, 0.22854, 1, 1, 1, 1, 1,
-0.7406421, 0.4866959, -0.63433, 1, 1, 1, 1, 1,
-0.7405301, -0.3117562, -2.784275, 1, 1, 1, 1, 1,
-0.7340465, 0.6123671, -1.033478, 1, 1, 1, 1, 1,
-0.7335258, 0.3004407, -1.187024, 1, 1, 1, 1, 1,
-0.7237908, -1.891467, -2.944634, 1, 1, 1, 1, 1,
-0.7237049, 0.4912885, -0.01614126, 1, 1, 1, 1, 1,
-0.7222383, 0.08443752, -1.146198, 1, 1, 1, 1, 1,
-0.7207572, -1.517616, -2.219592, 1, 1, 1, 1, 1,
-0.7179007, -0.1135228, -3.334217, 1, 1, 1, 1, 1,
-0.7123363, -0.7908278, -3.457958, 1, 1, 1, 1, 1,
-0.7114906, -1.474887, -2.635537, 1, 1, 1, 1, 1,
-0.6976001, 0.773778, -0.9943752, 1, 1, 1, 1, 1,
-0.6939629, 1.239631, -0.7297214, 0, 0, 1, 1, 1,
-0.6936411, -0.192725, -1.356008, 1, 0, 0, 1, 1,
-0.6928963, -1.174699, -1.035685, 1, 0, 0, 1, 1,
-0.6911663, 0.7400712, -0.6361334, 1, 0, 0, 1, 1,
-0.6885749, -1.334548, -2.177271, 1, 0, 0, 1, 1,
-0.6879125, -0.307861, -3.260442, 1, 0, 0, 1, 1,
-0.6848958, -1.621859, -2.786557, 0, 0, 0, 1, 1,
-0.6785908, -1.214353, -0.9751146, 0, 0, 0, 1, 1,
-0.6744463, 0.1396089, -1.888778, 0, 0, 0, 1, 1,
-0.671324, 0.5523298, -1.669432, 0, 0, 0, 1, 1,
-0.6546652, 0.1330053, -2.457033, 0, 0, 0, 1, 1,
-0.6544111, 1.477315, -0.4920158, 0, 0, 0, 1, 1,
-0.6534213, 1.243653, 1.641127, 0, 0, 0, 1, 1,
-0.647466, 1.048781, -1.507724, 1, 1, 1, 1, 1,
-0.6441367, -0.8188661, -2.135168, 1, 1, 1, 1, 1,
-0.6389266, 2.824438, 0.3571348, 1, 1, 1, 1, 1,
-0.6377078, 1.251104, -1.578665, 1, 1, 1, 1, 1,
-0.6373206, 1.16847, -0.5999023, 1, 1, 1, 1, 1,
-0.6343498, -1.092435, -3.00894, 1, 1, 1, 1, 1,
-0.633505, 0.5312974, -0.8676349, 1, 1, 1, 1, 1,
-0.6330369, 2.565825, -0.8399957, 1, 1, 1, 1, 1,
-0.6304592, -0.8706601, -2.117129, 1, 1, 1, 1, 1,
-0.6215067, -0.1880267, -1.785176, 1, 1, 1, 1, 1,
-0.6199246, 0.6812263, -2.146494, 1, 1, 1, 1, 1,
-0.6197414, -1.412883, -3.849269, 1, 1, 1, 1, 1,
-0.6089174, 0.8714064, -0.1524271, 1, 1, 1, 1, 1,
-0.6085615, -2.920645, -1.433527, 1, 1, 1, 1, 1,
-0.608111, -0.4597362, -0.9186218, 1, 1, 1, 1, 1,
-0.6030467, 0.006024492, -0.973029, 0, 0, 1, 1, 1,
-0.6010876, -0.2330328, -2.054721, 1, 0, 0, 1, 1,
-0.6007628, 0.6338615, -1.138472, 1, 0, 0, 1, 1,
-0.5982841, -1.355436, -1.319482, 1, 0, 0, 1, 1,
-0.5972672, -1.321854, -4.606257, 1, 0, 0, 1, 1,
-0.588759, -0.5846825, -3.051381, 1, 0, 0, 1, 1,
-0.5873012, -0.7744634, -2.892046, 0, 0, 0, 1, 1,
-0.5858168, -0.3804228, -2.226043, 0, 0, 0, 1, 1,
-0.5852079, 1.657839, -1.290029, 0, 0, 0, 1, 1,
-0.5827262, 0.4336857, -0.762698, 0, 0, 0, 1, 1,
-0.5795305, -1.244361, -3.18014, 0, 0, 0, 1, 1,
-0.5728546, -0.5844558, -2.248204, 0, 0, 0, 1, 1,
-0.5684575, -1.374768, -2.515185, 0, 0, 0, 1, 1,
-0.5678882, 0.4740849, -0.2152278, 1, 1, 1, 1, 1,
-0.5610677, -0.3597752, -2.125882, 1, 1, 1, 1, 1,
-0.558871, 0.97782, 0.2163868, 1, 1, 1, 1, 1,
-0.5580504, 0.8802713, -0.4509544, 1, 1, 1, 1, 1,
-0.5536726, -1.465225, -0.5319316, 1, 1, 1, 1, 1,
-0.5517588, -0.2979108, 0.1269028, 1, 1, 1, 1, 1,
-0.5511153, -0.1845772, -2.177344, 1, 1, 1, 1, 1,
-0.5482597, -1.187755, -4.025233, 1, 1, 1, 1, 1,
-0.5467597, 0.1304115, -2.417554, 1, 1, 1, 1, 1,
-0.5461945, -0.3626587, -2.278711, 1, 1, 1, 1, 1,
-0.5453399, -0.5269807, -2.208479, 1, 1, 1, 1, 1,
-0.5442765, 1.347857, -1.15309, 1, 1, 1, 1, 1,
-0.5356746, -0.435805, -0.6185719, 1, 1, 1, 1, 1,
-0.5320125, 0.5983649, -0.6235747, 1, 1, 1, 1, 1,
-0.5299099, 0.5198333, 0.221097, 1, 1, 1, 1, 1,
-0.520289, 0.4582871, -1.465387, 0, 0, 1, 1, 1,
-0.5189254, -0.3359382, -1.047348, 1, 0, 0, 1, 1,
-0.5145463, -1.139465, -0.115716, 1, 0, 0, 1, 1,
-0.5115203, -0.02796911, -2.443987, 1, 0, 0, 1, 1,
-0.5063399, 0.0390457, -0.4147934, 1, 0, 0, 1, 1,
-0.5060423, -1.630773, -2.047629, 1, 0, 0, 1, 1,
-0.4928421, -0.9183908, -4.140451, 0, 0, 0, 1, 1,
-0.4856793, -0.05399543, -0.592653, 0, 0, 0, 1, 1,
-0.4793048, 0.6014183, -0.2438242, 0, 0, 0, 1, 1,
-0.476084, -0.7441096, -1.251202, 0, 0, 0, 1, 1,
-0.4681027, 0.3114489, -1.113427, 0, 0, 0, 1, 1,
-0.4674326, 1.294521, -0.05686676, 0, 0, 0, 1, 1,
-0.4672964, -0.02156561, -1.071165, 0, 0, 0, 1, 1,
-0.4649994, -0.7841675, -1.919749, 1, 1, 1, 1, 1,
-0.4537062, -1.050369, -4.043493, 1, 1, 1, 1, 1,
-0.4529526, 0.158335, 1.090506, 1, 1, 1, 1, 1,
-0.4436401, -1.028653, -2.047627, 1, 1, 1, 1, 1,
-0.4415272, 0.8610414, 0.4251097, 1, 1, 1, 1, 1,
-0.4389576, 1.625012, -0.7845962, 1, 1, 1, 1, 1,
-0.437097, -0.6017788, -2.049329, 1, 1, 1, 1, 1,
-0.4363583, 0.07161634, -0.1517246, 1, 1, 1, 1, 1,
-0.4354515, -0.1607285, -0.6901706, 1, 1, 1, 1, 1,
-0.4308211, 0.5906982, -0.9532463, 1, 1, 1, 1, 1,
-0.4299384, 0.4694879, 0.6574117, 1, 1, 1, 1, 1,
-0.4279736, 0.6758855, 0.5677114, 1, 1, 1, 1, 1,
-0.4259123, -0.9608446, -2.903281, 1, 1, 1, 1, 1,
-0.4216941, -0.8220516, -0.8785045, 1, 1, 1, 1, 1,
-0.4199721, 0.8028859, -0.4383672, 1, 1, 1, 1, 1,
-0.413523, -0.2427701, -3.15287, 0, 0, 1, 1, 1,
-0.4103887, 0.1886377, -3.936303, 1, 0, 0, 1, 1,
-0.404116, -0.9757823, -1.939453, 1, 0, 0, 1, 1,
-0.3995337, -0.375151, -2.128461, 1, 0, 0, 1, 1,
-0.3990711, -0.8666278, -1.117828, 1, 0, 0, 1, 1,
-0.3958301, -0.6656957, -2.801668, 1, 0, 0, 1, 1,
-0.3954346, -1.130158, -2.676577, 0, 0, 0, 1, 1,
-0.3928404, 1.076598, 0.3134108, 0, 0, 0, 1, 1,
-0.3905346, -1.666178, -4.218916, 0, 0, 0, 1, 1,
-0.3892738, -0.3849934, -4.606791, 0, 0, 0, 1, 1,
-0.387674, -2.515152, -2.482671, 0, 0, 0, 1, 1,
-0.382498, -0.08219981, -1.758838, 0, 0, 0, 1, 1,
-0.3809279, 0.7397577, -2.804821, 0, 0, 0, 1, 1,
-0.3791762, 0.2825233, -0.5651121, 1, 1, 1, 1, 1,
-0.3751885, -1.328785, -1.350994, 1, 1, 1, 1, 1,
-0.3713149, 1.385728, -2.995177, 1, 1, 1, 1, 1,
-0.3705736, 1.155828, 0.2715488, 1, 1, 1, 1, 1,
-0.3702298, 1.425767, -0.7452961, 1, 1, 1, 1, 1,
-0.3588041, 0.6033205, -0.06468062, 1, 1, 1, 1, 1,
-0.3584747, 0.7924806, -1.005756, 1, 1, 1, 1, 1,
-0.3565136, 0.01316824, -3.022617, 1, 1, 1, 1, 1,
-0.3554167, 1.725356, -0.8076591, 1, 1, 1, 1, 1,
-0.355368, -0.06026169, -1.495541, 1, 1, 1, 1, 1,
-0.3513401, 0.02327392, -0.9890627, 1, 1, 1, 1, 1,
-0.3489111, -1.659777, -5.392369, 1, 1, 1, 1, 1,
-0.3479554, -0.1584499, -2.452634, 1, 1, 1, 1, 1,
-0.3476547, -0.8402892, -2.352396, 1, 1, 1, 1, 1,
-0.3468898, 0.7124181, 1.996774, 1, 1, 1, 1, 1,
-0.3456281, -0.9082162, -3.603515, 0, 0, 1, 1, 1,
-0.3375259, -0.4067987, -1.800048, 1, 0, 0, 1, 1,
-0.3346176, 2.324087, 0.8424721, 1, 0, 0, 1, 1,
-0.3315326, 0.311494, -0.4449309, 1, 0, 0, 1, 1,
-0.3266116, 1.859953, -0.02890969, 1, 0, 0, 1, 1,
-0.3249495, 1.928081, 0.3849934, 1, 0, 0, 1, 1,
-0.3147064, -0.9547651, -1.312454, 0, 0, 0, 1, 1,
-0.3078295, -1.150728, -2.164686, 0, 0, 0, 1, 1,
-0.3039889, -1.758466, -2.408908, 0, 0, 0, 1, 1,
-0.3033714, -0.4490995, -5.335266, 0, 0, 0, 1, 1,
-0.3029765, 1.282937, 0.2068967, 0, 0, 0, 1, 1,
-0.297056, -0.7866725, -2.535175, 0, 0, 0, 1, 1,
-0.2958587, -0.7255287, -1.993677, 0, 0, 0, 1, 1,
-0.2954126, 0.4173687, -0.2747143, 1, 1, 1, 1, 1,
-0.2945985, 0.6033981, 0.4331883, 1, 1, 1, 1, 1,
-0.2941147, 1.21729, -0.1625316, 1, 1, 1, 1, 1,
-0.2926268, 0.4385578, 0.8985823, 1, 1, 1, 1, 1,
-0.289701, -0.413032, -2.281525, 1, 1, 1, 1, 1,
-0.2868524, -0.9805903, -4.725191, 1, 1, 1, 1, 1,
-0.2859514, 0.8408393, -0.001997044, 1, 1, 1, 1, 1,
-0.28504, 0.1293138, -0.6769867, 1, 1, 1, 1, 1,
-0.2849541, -1.215234, -3.477761, 1, 1, 1, 1, 1,
-0.283102, 0.4788844, -0.4859846, 1, 1, 1, 1, 1,
-0.2830915, -0.6680615, -2.707523, 1, 1, 1, 1, 1,
-0.2802509, 0.9508438, -0.1193577, 1, 1, 1, 1, 1,
-0.2794627, -0.6280753, -3.493886, 1, 1, 1, 1, 1,
-0.2764013, 0.261863, -2.249435, 1, 1, 1, 1, 1,
-0.2699755, -1.791697, -3.454548, 1, 1, 1, 1, 1,
-0.2692601, -0.3256528, -2.551963, 0, 0, 1, 1, 1,
-0.2651593, -0.2870372, -1.648797, 1, 0, 0, 1, 1,
-0.2647829, -0.6577579, -2.706963, 1, 0, 0, 1, 1,
-0.2640135, 0.09502211, -1.344025, 1, 0, 0, 1, 1,
-0.2624461, -0.2621656, -2.294969, 1, 0, 0, 1, 1,
-0.2615022, -0.07818175, -1.809672, 1, 0, 0, 1, 1,
-0.2594832, -1.037239, -3.830053, 0, 0, 0, 1, 1,
-0.2588087, 0.09174635, 0.03077347, 0, 0, 0, 1, 1,
-0.2536785, -0.9716547, -2.964898, 0, 0, 0, 1, 1,
-0.253154, 0.4866736, -0.02986369, 0, 0, 0, 1, 1,
-0.2530869, 0.4334229, -0.4568698, 0, 0, 0, 1, 1,
-0.2507903, -0.4915333, -3.752038, 0, 0, 0, 1, 1,
-0.2499779, 0.2010389, -1.203784, 0, 0, 0, 1, 1,
-0.2480863, -1.364253, -4.205721, 1, 1, 1, 1, 1,
-0.2472316, 0.4802427, -1.422648, 1, 1, 1, 1, 1,
-0.2471731, 0.05915618, -1.225882, 1, 1, 1, 1, 1,
-0.2420023, -0.793156, -1.436114, 1, 1, 1, 1, 1,
-0.2394541, 0.8053172, -1.040932, 1, 1, 1, 1, 1,
-0.2347995, 0.5131721, -0.2605612, 1, 1, 1, 1, 1,
-0.2249571, -0.03578845, -1.464528, 1, 1, 1, 1, 1,
-0.2237913, -3.037604, -2.078678, 1, 1, 1, 1, 1,
-0.2212391, 1.301113, -0.2050336, 1, 1, 1, 1, 1,
-0.216415, 1.113213, -1.52801, 1, 1, 1, 1, 1,
-0.2161017, -0.5802646, -2.984737, 1, 1, 1, 1, 1,
-0.2150529, -0.4389818, -2.538243, 1, 1, 1, 1, 1,
-0.2149228, -0.02448349, 0.06634201, 1, 1, 1, 1, 1,
-0.214544, -0.8433979, -4.631209, 1, 1, 1, 1, 1,
-0.2091167, -0.478713, -2.561268, 1, 1, 1, 1, 1,
-0.2037539, -0.08711667, -2.515134, 0, 0, 1, 1, 1,
-0.2036394, -1.145939, -1.983446, 1, 0, 0, 1, 1,
-0.1985765, -0.3925793, -1.560182, 1, 0, 0, 1, 1,
-0.1974177, 1.509198, 0.1151423, 1, 0, 0, 1, 1,
-0.1936282, -0.1045962, -1.618506, 1, 0, 0, 1, 1,
-0.186834, -0.6121238, -1.860673, 1, 0, 0, 1, 1,
-0.1830916, 0.2252605, -0.2548698, 0, 0, 0, 1, 1,
-0.1817283, 1.712542, 1.904643, 0, 0, 0, 1, 1,
-0.181329, 0.9322131, 0.6777904, 0, 0, 0, 1, 1,
-0.1811402, 0.4232133, -0.04953015, 0, 0, 0, 1, 1,
-0.1717818, -0.1650859, -2.547457, 0, 0, 0, 1, 1,
-0.1700314, 1.818338, -0.1723991, 0, 0, 0, 1, 1,
-0.1690813, 0.6017513, 1.167991, 0, 0, 0, 1, 1,
-0.1660099, 1.246779, 0.395026, 1, 1, 1, 1, 1,
-0.1655826, 0.7982956, 1.200321, 1, 1, 1, 1, 1,
-0.1654335, -0.2016002, -1.894312, 1, 1, 1, 1, 1,
-0.1652507, -0.6476387, -3.637471, 1, 1, 1, 1, 1,
-0.1637074, -0.07722024, -2.545091, 1, 1, 1, 1, 1,
-0.1605835, -1.395819, -5.503745, 1, 1, 1, 1, 1,
-0.1559384, -2.391652, -5.517655, 1, 1, 1, 1, 1,
-0.1522069, -0.2121131, -1.820961, 1, 1, 1, 1, 1,
-0.1508221, 2.43965, -0.5903351, 1, 1, 1, 1, 1,
-0.1495243, 0.7262429, -1.270941, 1, 1, 1, 1, 1,
-0.135594, 0.790495, 1.633508, 1, 1, 1, 1, 1,
-0.132042, 0.2948925, -0.6815681, 1, 1, 1, 1, 1,
-0.1277363, 0.5769809, -0.4967013, 1, 1, 1, 1, 1,
-0.1254593, -1.7131, -3.536091, 1, 1, 1, 1, 1,
-0.1215441, -0.5492837, -2.500273, 1, 1, 1, 1, 1,
-0.1191914, -0.8519864, -3.105465, 0, 0, 1, 1, 1,
-0.1181686, 0.03323205, -0.9703119, 1, 0, 0, 1, 1,
-0.1177738, -0.5034071, -4.581668, 1, 0, 0, 1, 1,
-0.1144793, -0.6001214, -3.589319, 1, 0, 0, 1, 1,
-0.1122091, 0.1923687, -1.206728, 1, 0, 0, 1, 1,
-0.1107449, -1.86781, -2.374548, 1, 0, 0, 1, 1,
-0.1063782, 0.2741936, -0.9377135, 0, 0, 0, 1, 1,
-0.1033064, 1.149849, -1.105382, 0, 0, 0, 1, 1,
-0.09728673, 1.215563, -0.276147, 0, 0, 0, 1, 1,
-0.09514971, 1.494401, 0.3484456, 0, 0, 0, 1, 1,
-0.09477548, 1.263383, -2.071523, 0, 0, 0, 1, 1,
-0.0935221, 1.735312, -0.5650383, 0, 0, 0, 1, 1,
-0.0917417, -1.236315, -3.518153, 0, 0, 0, 1, 1,
-0.08600667, 0.7306185, -1.336841, 1, 1, 1, 1, 1,
-0.08596881, 1.099441, 0.3183213, 1, 1, 1, 1, 1,
-0.08586865, 0.4940971, 0.3424524, 1, 1, 1, 1, 1,
-0.08356594, 0.742312, 0.8388686, 1, 1, 1, 1, 1,
-0.08338381, -0.05810441, -1.532474, 1, 1, 1, 1, 1,
-0.07733528, 1.40169, -0.6369848, 1, 1, 1, 1, 1,
-0.07719485, -1.192065, -1.292551, 1, 1, 1, 1, 1,
-0.07672499, -0.3421705, -4.592727, 1, 1, 1, 1, 1,
-0.07397426, -0.5543566, -1.646378, 1, 1, 1, 1, 1,
-0.07389541, -0.7386135, -2.21332, 1, 1, 1, 1, 1,
-0.0738802, 1.10286, -0.5348414, 1, 1, 1, 1, 1,
-0.07350729, -0.1623391, -2.226245, 1, 1, 1, 1, 1,
-0.06929105, -0.163215, -3.082161, 1, 1, 1, 1, 1,
-0.06853233, 0.667723, -0.843742, 1, 1, 1, 1, 1,
-0.06735996, -0.4939155, -1.598467, 1, 1, 1, 1, 1,
-0.06371183, -0.4264867, -2.385772, 0, 0, 1, 1, 1,
-0.06250957, 0.5211861, -0.9171568, 1, 0, 0, 1, 1,
-0.06135699, 1.257602, -1.597207, 1, 0, 0, 1, 1,
-0.05997718, -0.2571862, -0.717812, 1, 0, 0, 1, 1,
-0.05557081, 1.586163, -0.3611638, 1, 0, 0, 1, 1,
-0.04873922, 0.8999803, -2.248316, 1, 0, 0, 1, 1,
-0.04677331, 1.960806, 0.1340478, 0, 0, 0, 1, 1,
-0.04422007, -0.3380996, -2.401573, 0, 0, 0, 1, 1,
-0.04287285, 2.566857, -0.2832136, 0, 0, 0, 1, 1,
-0.03062665, -0.1921066, -2.693931, 0, 0, 0, 1, 1,
-0.02762113, -2.043701, -5.000965, 0, 0, 0, 1, 1,
-0.02353919, -1.026418, -2.681233, 0, 0, 0, 1, 1,
-0.01838286, 1.126019, 0.9282494, 0, 0, 0, 1, 1,
-0.01745889, 0.7563166, 0.1755359, 1, 1, 1, 1, 1,
-0.01670948, -0.9860776, -3.064541, 1, 1, 1, 1, 1,
-0.0156296, -1.189845, -2.32788, 1, 1, 1, 1, 1,
-0.008415564, 1.100368, 0.4117962, 1, 1, 1, 1, 1,
-1.354422e-05, 0.5048834, 0.5234798, 1, 1, 1, 1, 1,
0.0005959904, -0.2518655, 4.529382, 1, 1, 1, 1, 1,
0.002679561, -0.02449934, 3.75127, 1, 1, 1, 1, 1,
0.01054165, 0.592958, 0.5395124, 1, 1, 1, 1, 1,
0.01353731, -1.28396, 4.015538, 1, 1, 1, 1, 1,
0.01684101, 0.7098408, -0.9365746, 1, 1, 1, 1, 1,
0.01716693, -0.4495378, 2.307093, 1, 1, 1, 1, 1,
0.01852957, 0.5821489, 1.5943, 1, 1, 1, 1, 1,
0.01996206, -0.9857557, 4.118805, 1, 1, 1, 1, 1,
0.02274368, 0.6479493, 0.02470024, 1, 1, 1, 1, 1,
0.02499204, 0.4939922, 0.6284982, 1, 1, 1, 1, 1,
0.02727782, 0.4545321, -2.409403, 0, 0, 1, 1, 1,
0.02805496, 0.6497225, -0.4100695, 1, 0, 0, 1, 1,
0.02944652, -1.141758, 1.812428, 1, 0, 0, 1, 1,
0.02992989, 1.948723, -1.383511, 1, 0, 0, 1, 1,
0.03445208, -0.03717721, -0.1512367, 1, 0, 0, 1, 1,
0.03485539, -0.02880187, 2.870021, 1, 0, 0, 1, 1,
0.03521371, 1.586752, -0.1441279, 0, 0, 0, 1, 1,
0.03680159, -0.3850701, 3.701361, 0, 0, 0, 1, 1,
0.03768519, -2.291697, 3.249278, 0, 0, 0, 1, 1,
0.03866487, -0.2662625, 1.957395, 0, 0, 0, 1, 1,
0.04029429, 0.8455592, 0.4585807, 0, 0, 0, 1, 1,
0.04395708, -0.6009507, 3.402015, 0, 0, 0, 1, 1,
0.04664485, -2.441957, 2.864133, 0, 0, 0, 1, 1,
0.05002452, -0.3771023, 2.536016, 1, 1, 1, 1, 1,
0.05009719, -0.7594446, 2.876766, 1, 1, 1, 1, 1,
0.05612507, 0.150882, -1.868137, 1, 1, 1, 1, 1,
0.05619162, -1.313344, 3.399888, 1, 1, 1, 1, 1,
0.05635455, 0.07460036, 0.5028346, 1, 1, 1, 1, 1,
0.05887783, 0.2993834, 1.858949, 1, 1, 1, 1, 1,
0.05900716, 0.6880928, 0.1879614, 1, 1, 1, 1, 1,
0.06302028, -0.8939189, 3.626384, 1, 1, 1, 1, 1,
0.06564751, -0.6014175, 3.049716, 1, 1, 1, 1, 1,
0.06568041, 1.048584, -0.07875626, 1, 1, 1, 1, 1,
0.06615466, -0.7948513, 2.529938, 1, 1, 1, 1, 1,
0.06827769, 1.526954, 0.5505161, 1, 1, 1, 1, 1,
0.07098339, 1.492278, -0.2009593, 1, 1, 1, 1, 1,
0.0713603, 0.6168702, 3.273983, 1, 1, 1, 1, 1,
0.07229403, 2.143941, 0.9310864, 1, 1, 1, 1, 1,
0.07323898, -0.2654472, 1.393702, 0, 0, 1, 1, 1,
0.07468321, -0.7845274, 2.860603, 1, 0, 0, 1, 1,
0.07598375, -0.5814848, 4.357674, 1, 0, 0, 1, 1,
0.07634488, -0.1037896, 3.240558, 1, 0, 0, 1, 1,
0.0766187, -1.893897, 2.729491, 1, 0, 0, 1, 1,
0.07684346, -0.7201263, 4.041985, 1, 0, 0, 1, 1,
0.07984744, 0.3716701, -0.6669223, 0, 0, 0, 1, 1,
0.08548899, 1.335553, 0.3162807, 0, 0, 0, 1, 1,
0.08769774, 1.090878, 1.432052, 0, 0, 0, 1, 1,
0.0905328, -0.5100043, 3.390483, 0, 0, 0, 1, 1,
0.09271084, 0.8351592, -1.479809, 0, 0, 0, 1, 1,
0.09430648, -1.829639, 4.333795, 0, 0, 0, 1, 1,
0.09458569, 1.481016, 0.8761621, 0, 0, 0, 1, 1,
0.09540574, -0.6161131, 3.077558, 1, 1, 1, 1, 1,
0.09620336, -0.5632377, 3.34438, 1, 1, 1, 1, 1,
0.09932055, 0.1173535, 0.2771136, 1, 1, 1, 1, 1,
0.1021623, -0.4579923, 1.468644, 1, 1, 1, 1, 1,
0.1037015, -0.9425345, 2.236982, 1, 1, 1, 1, 1,
0.1147157, 1.103446, -0.9433356, 1, 1, 1, 1, 1,
0.1153388, -0.5490894, 1.884156, 1, 1, 1, 1, 1,
0.1184868, 1.353504, -1.053925, 1, 1, 1, 1, 1,
0.1193273, 0.1354802, 1.354063, 1, 1, 1, 1, 1,
0.1205486, 1.158481, -0.03666393, 1, 1, 1, 1, 1,
0.1212753, -1.663404, 2.34867, 1, 1, 1, 1, 1,
0.1262207, 1.230573, 0.06676944, 1, 1, 1, 1, 1,
0.1287507, 0.9343709, -1.466086, 1, 1, 1, 1, 1,
0.1322318, 1.519044, -2.716305, 1, 1, 1, 1, 1,
0.1330965, 0.2806866, 2.397941, 1, 1, 1, 1, 1,
0.1364855, 0.9020561, 0.2932108, 0, 0, 1, 1, 1,
0.1380302, 0.8298869, -0.7620875, 1, 0, 0, 1, 1,
0.1457672, 0.2364057, -1.062414, 1, 0, 0, 1, 1,
0.1568892, 0.6417263, 0.7522266, 1, 0, 0, 1, 1,
0.157332, -1.350024, 5.371553, 1, 0, 0, 1, 1,
0.158349, 0.6356258, -0.6025377, 1, 0, 0, 1, 1,
0.1599638, -1.236912, 3.003563, 0, 0, 0, 1, 1,
0.1636213, 3.601807, 0.02575751, 0, 0, 0, 1, 1,
0.1664348, -0.6860328, 4.467062, 0, 0, 0, 1, 1,
0.1683101, 0.5506377, 0.1528552, 0, 0, 0, 1, 1,
0.1697794, 0.2226847, 0.8046063, 0, 0, 0, 1, 1,
0.173036, -0.4270913, 2.445149, 0, 0, 0, 1, 1,
0.1731399, -0.672228, 2.801589, 0, 0, 0, 1, 1,
0.1750445, 0.03242006, 2.454482, 1, 1, 1, 1, 1,
0.1774982, 0.4843864, 0.5644559, 1, 1, 1, 1, 1,
0.1823296, -1.349167, 2.349005, 1, 1, 1, 1, 1,
0.1827501, -0.01486618, 1.612549, 1, 1, 1, 1, 1,
0.18433, -1.621445, 1.644996, 1, 1, 1, 1, 1,
0.1866729, 0.6701277, 0.8178682, 1, 1, 1, 1, 1,
0.1937545, 1.860568, 0.9407761, 1, 1, 1, 1, 1,
0.196509, 0.003883186, 3.101358, 1, 1, 1, 1, 1,
0.197266, -0.625381, 3.511601, 1, 1, 1, 1, 1,
0.1974234, -1.165009, 3.126018, 1, 1, 1, 1, 1,
0.2000641, -0.5157292, 3.303648, 1, 1, 1, 1, 1,
0.2032552, -1.230958, 3.369528, 1, 1, 1, 1, 1,
0.2083066, 0.4139628, 1.154008, 1, 1, 1, 1, 1,
0.2093826, 0.6002064, 1.161043, 1, 1, 1, 1, 1,
0.2133228, 0.8541223, 1.53885, 1, 1, 1, 1, 1,
0.2134896, 0.07414386, -0.133628, 0, 0, 1, 1, 1,
0.2169551, -1.92626, 4.327138, 1, 0, 0, 1, 1,
0.2216654, 0.07324269, 0.9454072, 1, 0, 0, 1, 1,
0.2221751, -0.6696771, 3.505984, 1, 0, 0, 1, 1,
0.2222204, 0.6198218, -1.132371, 1, 0, 0, 1, 1,
0.2237231, 1.889958, -0.4583459, 1, 0, 0, 1, 1,
0.2239983, -2.45803, 2.558477, 0, 0, 0, 1, 1,
0.2312809, -0.2503274, 1.124638, 0, 0, 0, 1, 1,
0.2341214, -0.8988692, 3.863765, 0, 0, 0, 1, 1,
0.2382201, 0.9593895, -0.7957343, 0, 0, 0, 1, 1,
0.2383823, -0.7763924, 4.729748, 0, 0, 0, 1, 1,
0.2421824, 1.516995, 1.640296, 0, 0, 0, 1, 1,
0.2460286, 0.2258286, 2.407466, 0, 0, 0, 1, 1,
0.2486807, -0.8328158, 2.561471, 1, 1, 1, 1, 1,
0.2536879, -0.7307601, 2.196587, 1, 1, 1, 1, 1,
0.2618614, -1.304909, 2.854395, 1, 1, 1, 1, 1,
0.2667395, -0.1795501, 3.237876, 1, 1, 1, 1, 1,
0.269137, 0.3467013, 1.676486, 1, 1, 1, 1, 1,
0.2692721, 2.95389, 0.07224939, 1, 1, 1, 1, 1,
0.2705044, -1.052362, 1.054087, 1, 1, 1, 1, 1,
0.2708126, 1.038206, -1.651377, 1, 1, 1, 1, 1,
0.276049, -0.3967013, 1.802119, 1, 1, 1, 1, 1,
0.2803664, 0.1778214, 2.370007, 1, 1, 1, 1, 1,
0.2888426, -0.009843892, 0.5284355, 1, 1, 1, 1, 1,
0.2895772, -0.09425844, 0.8762217, 1, 1, 1, 1, 1,
0.2901723, 0.4273547, 0.983684, 1, 1, 1, 1, 1,
0.2925354, 1.318466, -0.8189451, 1, 1, 1, 1, 1,
0.2937984, -0.8894669, 4.207984, 1, 1, 1, 1, 1,
0.2965159, 0.6726813, 1.688495, 0, 0, 1, 1, 1,
0.2984085, 0.3821023, -0.859385, 1, 0, 0, 1, 1,
0.2997514, -1.998732, 4.496814, 1, 0, 0, 1, 1,
0.308026, 0.005660275, 1.644945, 1, 0, 0, 1, 1,
0.319104, -0.5294492, 3.478029, 1, 0, 0, 1, 1,
0.319464, 1.791735, -1.281636, 1, 0, 0, 1, 1,
0.3236638, -0.4431881, 3.124752, 0, 0, 0, 1, 1,
0.3247889, 1.385, -1.185452, 0, 0, 0, 1, 1,
0.324905, -2.24056, 2.630894, 0, 0, 0, 1, 1,
0.3277199, 0.4088212, -1.670474, 0, 0, 0, 1, 1,
0.3288679, 1.892432, -1.101966, 0, 0, 0, 1, 1,
0.3289691, -0.2587002, 1.96627, 0, 0, 0, 1, 1,
0.3295502, 0.2807693, -0.7861635, 0, 0, 0, 1, 1,
0.3309459, -0.8987913, 3.397111, 1, 1, 1, 1, 1,
0.3322383, 1.868205, 2.569893, 1, 1, 1, 1, 1,
0.3351762, -1.506112, 2.754446, 1, 1, 1, 1, 1,
0.3407048, -1.237015, 1.730416, 1, 1, 1, 1, 1,
0.3456729, -0.3284459, 3.395492, 1, 1, 1, 1, 1,
0.3467549, 1.221777, -0.8256423, 1, 1, 1, 1, 1,
0.3472074, 0.178882, 1.770521, 1, 1, 1, 1, 1,
0.3512284, 0.1225068, -0.3779635, 1, 1, 1, 1, 1,
0.3528184, -0.7425399, 3.669796, 1, 1, 1, 1, 1,
0.3537497, -0.1175237, 2.449819, 1, 1, 1, 1, 1,
0.3541501, 1.163161, -1.453891, 1, 1, 1, 1, 1,
0.3541778, 0.2312179, -1.537119, 1, 1, 1, 1, 1,
0.3550849, -0.6937647, 2.24326, 1, 1, 1, 1, 1,
0.3555548, 0.557349, -0.3969704, 1, 1, 1, 1, 1,
0.3560573, 0.5239933, 1.156807, 1, 1, 1, 1, 1,
0.3561511, 1.108655, -0.6594257, 0, 0, 1, 1, 1,
0.3563772, 0.5056087, 0.9918033, 1, 0, 0, 1, 1,
0.3576632, -1.903826, 2.715775, 1, 0, 0, 1, 1,
0.3630985, 0.1102211, 1.017683, 1, 0, 0, 1, 1,
0.3654877, -0.6205717, 2.90483, 1, 0, 0, 1, 1,
0.3695748, -0.5062156, 2.572151, 1, 0, 0, 1, 1,
0.3727811, 0.6388375, 1.980749, 0, 0, 0, 1, 1,
0.3751362, -1.215944, 2.405722, 0, 0, 0, 1, 1,
0.378033, 0.1881362, 0.2460625, 0, 0, 0, 1, 1,
0.3838295, -1.854486, 3.665763, 0, 0, 0, 1, 1,
0.3873003, -2.383939, 1.936002, 0, 0, 0, 1, 1,
0.3948967, 0.1653214, -1.885864, 0, 0, 0, 1, 1,
0.4046597, 0.4130777, 0.5971425, 0, 0, 0, 1, 1,
0.4066333, -1.855628, 1.529645, 1, 1, 1, 1, 1,
0.4068797, -0.02688102, -0.1591276, 1, 1, 1, 1, 1,
0.4095584, 0.9353033, 0.7522376, 1, 1, 1, 1, 1,
0.4109321, 0.1996825, 0.5658551, 1, 1, 1, 1, 1,
0.411128, 0.04711715, 0.9220265, 1, 1, 1, 1, 1,
0.4179932, -0.5346014, 3.229043, 1, 1, 1, 1, 1,
0.4239865, 1.444431, -0.3092364, 1, 1, 1, 1, 1,
0.429569, -0.1749952, 1.733976, 1, 1, 1, 1, 1,
0.429992, 0.3524952, 0.6175107, 1, 1, 1, 1, 1,
0.4337919, -1.385474, 4.102791, 1, 1, 1, 1, 1,
0.4339551, 0.628284, 0.4370694, 1, 1, 1, 1, 1,
0.4368388, 0.4051821, -0.1877762, 1, 1, 1, 1, 1,
0.4379375, -1.327183, 3.637905, 1, 1, 1, 1, 1,
0.4465591, 0.1302729, 1.39584, 1, 1, 1, 1, 1,
0.4484321, -0.3097168, 1.753006, 1, 1, 1, 1, 1,
0.4551576, 1.688681, 1.681797, 0, 0, 1, 1, 1,
0.4554266, -1.002015, 2.787847, 1, 0, 0, 1, 1,
0.462497, 0.7788237, 0.3637316, 1, 0, 0, 1, 1,
0.4659541, -0.8948437, 4.373, 1, 0, 0, 1, 1,
0.4691384, -0.6113521, 2.925724, 1, 0, 0, 1, 1,
0.4777877, 0.7068761, 0.2257748, 1, 0, 0, 1, 1,
0.4808682, -1.084832, 1.934067, 0, 0, 0, 1, 1,
0.4842868, -0.1950163, 3.620142, 0, 0, 0, 1, 1,
0.4873091, 0.6772643, 0.7023082, 0, 0, 0, 1, 1,
0.4926534, 0.6276677, 2.709406, 0, 0, 0, 1, 1,
0.4975364, 1.085206, -0.9894409, 0, 0, 0, 1, 1,
0.5013393, -1.063535, 1.909104, 0, 0, 0, 1, 1,
0.502044, -0.7571638, 1.889468, 0, 0, 0, 1, 1,
0.504543, 0.06222366, 1.326312, 1, 1, 1, 1, 1,
0.5061347, 0.3633788, 0.6734048, 1, 1, 1, 1, 1,
0.5061442, 0.2206028, 0.884684, 1, 1, 1, 1, 1,
0.5147233, -2.196483, 2.694888, 1, 1, 1, 1, 1,
0.5173793, -1.249147, 2.207221, 1, 1, 1, 1, 1,
0.5241808, -0.8949611, 5.248491, 1, 1, 1, 1, 1,
0.5260224, 1.007058, -1.215904, 1, 1, 1, 1, 1,
0.5306777, 0.004006204, 1.276084, 1, 1, 1, 1, 1,
0.5316117, 0.6751063, 0.9494998, 1, 1, 1, 1, 1,
0.532334, 0.2903049, 0.6238898, 1, 1, 1, 1, 1,
0.5335705, 0.506913, 0.8520088, 1, 1, 1, 1, 1,
0.5371361, 0.8642753, 0.790151, 1, 1, 1, 1, 1,
0.5381103, -0.426151, 2.699181, 1, 1, 1, 1, 1,
0.5397847, 0.4878669, -0.4814342, 1, 1, 1, 1, 1,
0.5442942, 1.033952, -1.059473, 1, 1, 1, 1, 1,
0.5490962, -0.179486, 3.927888, 0, 0, 1, 1, 1,
0.5501956, 0.06263667, 1.966557, 1, 0, 0, 1, 1,
0.561516, -0.2860443, 1.54624, 1, 0, 0, 1, 1,
0.5627534, -0.1669592, 1.152876, 1, 0, 0, 1, 1,
0.5668421, -0.9759764, 3.461444, 1, 0, 0, 1, 1,
0.5751147, 0.6649374, 1.306497, 1, 0, 0, 1, 1,
0.5754724, 1.040065, 1.974683, 0, 0, 0, 1, 1,
0.5763134, 1.247188, 0.1796476, 0, 0, 0, 1, 1,
0.5774667, 0.5584505, 1.861386, 0, 0, 0, 1, 1,
0.5800983, -1.008124, 2.865565, 0, 0, 0, 1, 1,
0.5855582, 0.6480153, -0.04385646, 0, 0, 0, 1, 1,
0.5891333, 0.03733094, 1.176067, 0, 0, 0, 1, 1,
0.5898616, 0.3374398, 0.3979702, 0, 0, 0, 1, 1,
0.5901511, -0.3474709, 1.277476, 1, 1, 1, 1, 1,
0.5927456, 0.2095363, 1.694093, 1, 1, 1, 1, 1,
0.5953105, -0.476765, 2.490202, 1, 1, 1, 1, 1,
0.5964792, 0.5734602, 1.134345, 1, 1, 1, 1, 1,
0.5999995, -0.4622217, 2.100731, 1, 1, 1, 1, 1,
0.6003608, -0.5316232, 1.724406, 1, 1, 1, 1, 1,
0.6044619, -1.557288, 2.257046, 1, 1, 1, 1, 1,
0.6050789, -1.058463, 2.008695, 1, 1, 1, 1, 1,
0.6062589, -0.4983075, 1.159484, 1, 1, 1, 1, 1,
0.6081276, -0.3041883, 3.612452, 1, 1, 1, 1, 1,
0.6165456, 0.6989901, 1.42683, 1, 1, 1, 1, 1,
0.6177043, 0.2197676, 3.006359, 1, 1, 1, 1, 1,
0.6204611, -0.3628269, 2.620722, 1, 1, 1, 1, 1,
0.6227517, 1.224065, -1.276722, 1, 1, 1, 1, 1,
0.6289993, -1.389215, 3.157501, 1, 1, 1, 1, 1,
0.6322761, -0.08297481, 0.9280554, 0, 0, 1, 1, 1,
0.6327323, 0.7827508, 0.9111423, 1, 0, 0, 1, 1,
0.6376684, -0.2522542, 2.940185, 1, 0, 0, 1, 1,
0.6403738, 1.504879, 0.5193629, 1, 0, 0, 1, 1,
0.6447519, 2.212273, 0.6631752, 1, 0, 0, 1, 1,
0.6510394, 0.2500951, 2.140103, 1, 0, 0, 1, 1,
0.6519366, -0.266832, 2.635364, 0, 0, 0, 1, 1,
0.6546706, 1.606225, -1.018086, 0, 0, 0, 1, 1,
0.6563535, -0.05703026, 2.9816, 0, 0, 0, 1, 1,
0.6570218, -0.9307784, 2.512609, 0, 0, 0, 1, 1,
0.6586756, 1.206029, 0.5395954, 0, 0, 0, 1, 1,
0.6592776, -0.6046103, 2.430975, 0, 0, 0, 1, 1,
0.6605988, -0.8560384, 3.165349, 0, 0, 0, 1, 1,
0.6708878, 2.078792, 0.6284589, 1, 1, 1, 1, 1,
0.6756572, 1.016629, 0.7912091, 1, 1, 1, 1, 1,
0.6790131, 1.807195, -2.167633, 1, 1, 1, 1, 1,
0.6835856, -0.9943564, 3.141339, 1, 1, 1, 1, 1,
0.6843004, -1.67006, 3.761236, 1, 1, 1, 1, 1,
0.6860929, 1.785569, -0.01571638, 1, 1, 1, 1, 1,
0.689656, -1.42533, 2.738508, 1, 1, 1, 1, 1,
0.6915587, 0.9742109, -0.05936971, 1, 1, 1, 1, 1,
0.6984062, -1.200634, 1.945513, 1, 1, 1, 1, 1,
0.7067398, -0.4846683, 1.884256, 1, 1, 1, 1, 1,
0.7079579, -1.362642, 0.990345, 1, 1, 1, 1, 1,
0.7100011, 0.7624714, 1.115157, 1, 1, 1, 1, 1,
0.7101997, 0.4583329, 1.244286, 1, 1, 1, 1, 1,
0.7127116, -1.46174, 3.000893, 1, 1, 1, 1, 1,
0.7134092, -0.7862651, 2.668431, 1, 1, 1, 1, 1,
0.7218882, 0.6029131, 0.8856583, 0, 0, 1, 1, 1,
0.7236778, 1.553393, 0.3011599, 1, 0, 0, 1, 1,
0.7247493, -0.8601661, 2.411909, 1, 0, 0, 1, 1,
0.7294113, 1.322267, 0.4671121, 1, 0, 0, 1, 1,
0.7306494, -0.1072259, 1.412753, 1, 0, 0, 1, 1,
0.7314738, 0.2057003, -1.157023, 1, 0, 0, 1, 1,
0.7384586, -0.3867003, 0.6930273, 0, 0, 0, 1, 1,
0.7402864, -0.4586178, 2.688713, 0, 0, 0, 1, 1,
0.7450892, -1.25583, 3.463905, 0, 0, 0, 1, 1,
0.7459111, 1.554315, 0.02229473, 0, 0, 0, 1, 1,
0.746209, 1.59129, 0.8025671, 0, 0, 0, 1, 1,
0.749679, -0.3533649, 1.462211, 0, 0, 0, 1, 1,
0.7519845, 0.5105557, 1.947567, 0, 0, 0, 1, 1,
0.7557879, -0.8319193, 3.707801, 1, 1, 1, 1, 1,
0.7563264, 0.860892, 0.1081295, 1, 1, 1, 1, 1,
0.756364, -0.3344362, 2.764319, 1, 1, 1, 1, 1,
0.7653428, 1.295386, 2.012661, 1, 1, 1, 1, 1,
0.7659515, 1.161331, 0.9534827, 1, 1, 1, 1, 1,
0.7699112, 1.82974, 0.3722657, 1, 1, 1, 1, 1,
0.7704366, -0.2865111, 3.611164, 1, 1, 1, 1, 1,
0.7717109, 0.6794685, 0.7610711, 1, 1, 1, 1, 1,
0.7752123, 0.9472575, -0.9876363, 1, 1, 1, 1, 1,
0.776572, 0.3679235, 1.421, 1, 1, 1, 1, 1,
0.7766174, -1.413899, 3.407994, 1, 1, 1, 1, 1,
0.7808675, -0.3883063, 2.363852, 1, 1, 1, 1, 1,
0.7823368, 0.8464903, 2.239808, 1, 1, 1, 1, 1,
0.7885179, 0.2686594, 2.063789, 1, 1, 1, 1, 1,
0.7904956, 0.684655, 1.285011, 1, 1, 1, 1, 1,
0.7910184, -0.5949774, 3.051285, 0, 0, 1, 1, 1,
0.8002529, 1.095715, 1.103908, 1, 0, 0, 1, 1,
0.8037545, 1.001171, 1.343619, 1, 0, 0, 1, 1,
0.8040883, 0.3204959, 0.1499367, 1, 0, 0, 1, 1,
0.8071576, 0.7815266, -0.4618826, 1, 0, 0, 1, 1,
0.8088194, 0.2525873, 2.992876, 1, 0, 0, 1, 1,
0.8108883, 0.1094187, -0.247442, 0, 0, 0, 1, 1,
0.8126409, -1.814701, 3.157236, 0, 0, 0, 1, 1,
0.815075, 2.135993, -0.3544017, 0, 0, 0, 1, 1,
0.8157536, -0.1181605, 3.331968, 0, 0, 0, 1, 1,
0.8160934, 1.167445, 0.7140704, 0, 0, 0, 1, 1,
0.8211577, 2.042483, 1.052039, 0, 0, 0, 1, 1,
0.8217933, -1.048805, 2.440278, 0, 0, 0, 1, 1,
0.8244317, 0.9656113, 2.278346, 1, 1, 1, 1, 1,
0.8287585, 0.6836252, 3.564561, 1, 1, 1, 1, 1,
0.8328405, 0.5063107, 2.273544, 1, 1, 1, 1, 1,
0.8333421, -0.4833546, 3.199358, 1, 1, 1, 1, 1,
0.8364636, -0.8006713, 1.640023, 1, 1, 1, 1, 1,
0.8444139, 0.9769061, -0.1302845, 1, 1, 1, 1, 1,
0.8509666, -0.1764773, 0.9257354, 1, 1, 1, 1, 1,
0.8526273, 0.1582121, 0.6179847, 1, 1, 1, 1, 1,
0.8533474, -1.278682, 2.233861, 1, 1, 1, 1, 1,
0.8551647, -0.7675183, 2.207192, 1, 1, 1, 1, 1,
0.8580243, 0.1517324, 1.199506, 1, 1, 1, 1, 1,
0.8629375, -0.560702, 3.593526, 1, 1, 1, 1, 1,
0.863427, 1.213349, 1.826096, 1, 1, 1, 1, 1,
0.8637502, 0.7481263, 0.06509254, 1, 1, 1, 1, 1,
0.8647841, -1.171584, 1.697628, 1, 1, 1, 1, 1,
0.8769861, -1.109484, 3.306108, 0, 0, 1, 1, 1,
0.8770959, -0.9450261, 2.955628, 1, 0, 0, 1, 1,
0.883769, 2.677458, 2.917579, 1, 0, 0, 1, 1,
0.8882021, 0.5122603, 1.185689, 1, 0, 0, 1, 1,
0.8906999, 0.9482796, 0.9593242, 1, 0, 0, 1, 1,
0.8932482, -0.9830272, 3.214532, 1, 0, 0, 1, 1,
0.8971528, 1.637267, 1.775335, 0, 0, 0, 1, 1,
0.9078508, -0.3758044, 2.054815, 0, 0, 0, 1, 1,
0.9099267, -0.008001756, 1.035293, 0, 0, 0, 1, 1,
0.9128811, -1.854398, 3.60797, 0, 0, 0, 1, 1,
0.9225555, -0.2707005, 3.235615, 0, 0, 0, 1, 1,
0.9247331, -1.350682, 1.824716, 0, 0, 0, 1, 1,
0.9267626, 0.837246, 1.659921, 0, 0, 0, 1, 1,
0.9270926, 0.09846274, 2.31019, 1, 1, 1, 1, 1,
0.9300906, 0.5869555, -0.3705747, 1, 1, 1, 1, 1,
0.9363884, 1.266235, 0.9000984, 1, 1, 1, 1, 1,
0.9400402, -1.076108, 0.6762285, 1, 1, 1, 1, 1,
0.9441448, 2.118429, 1.215315, 1, 1, 1, 1, 1,
0.9464351, -0.8791668, 3.106017, 1, 1, 1, 1, 1,
0.949265, -0.6798011, 1.66573, 1, 1, 1, 1, 1,
0.9542539, 0.07947227, 1.000467, 1, 1, 1, 1, 1,
0.9609532, -2.292607, 2.451477, 1, 1, 1, 1, 1,
0.9759323, -0.01822566, 0.1562862, 1, 1, 1, 1, 1,
0.9785704, -0.1694656, 2.629636, 1, 1, 1, 1, 1,
0.9847443, 0.7489508, 1.232704, 1, 1, 1, 1, 1,
0.9857277, -0.01564971, 2.055172, 1, 1, 1, 1, 1,
0.987186, 2.227582, -0.2932176, 1, 1, 1, 1, 1,
0.9872385, 0.3805893, 1.143075, 1, 1, 1, 1, 1,
0.9917244, 0.616019, 0.9251766, 0, 0, 1, 1, 1,
0.9918398, -1.345753, 3.145568, 1, 0, 0, 1, 1,
0.9981084, 1.744181, 1.635381, 1, 0, 0, 1, 1,
1.000736, 1.070556, 2.309282, 1, 0, 0, 1, 1,
1.008516, 0.5876629, 2.458, 1, 0, 0, 1, 1,
1.010762, -0.5560361, 1.97207, 1, 0, 0, 1, 1,
1.013938, -0.122214, -0.2139811, 0, 0, 0, 1, 1,
1.01708, -1.840857, 2.078335, 0, 0, 0, 1, 1,
1.027447, 0.01609931, 1.345807, 0, 0, 0, 1, 1,
1.027964, 0.6371561, -0.8362506, 0, 0, 0, 1, 1,
1.030552, 0.2275939, 2.606857, 0, 0, 0, 1, 1,
1.031078, 0.3403368, 1.11932, 0, 0, 0, 1, 1,
1.037135, 0.8210013, 1.004231, 0, 0, 0, 1, 1,
1.040344, 0.7806286, -0.4876589, 1, 1, 1, 1, 1,
1.043106, -0.4077604, 3.075515, 1, 1, 1, 1, 1,
1.049997, -0.02406244, 1.295563, 1, 1, 1, 1, 1,
1.051045, 0.1212673, 1.448287, 1, 1, 1, 1, 1,
1.051614, 0.3193836, 0.3919509, 1, 1, 1, 1, 1,
1.053719, -0.6662351, 2.045912, 1, 1, 1, 1, 1,
1.054717, 0.9083899, 1.620987, 1, 1, 1, 1, 1,
1.060301, -2.214999, 2.347117, 1, 1, 1, 1, 1,
1.064421, -2.243073, 3.171899, 1, 1, 1, 1, 1,
1.065449, 3.862886, 0.4059797, 1, 1, 1, 1, 1,
1.076029, -0.1881804, 0.1144966, 1, 1, 1, 1, 1,
1.085425, 0.2930399, 1.356384, 1, 1, 1, 1, 1,
1.088907, -1.173535, 2.44392, 1, 1, 1, 1, 1,
1.090062, 1.614602, 2.162063, 1, 1, 1, 1, 1,
1.096058, 0.8029842, 1.36844, 1, 1, 1, 1, 1,
1.105343, -0.2317417, 2.20694, 0, 0, 1, 1, 1,
1.109014, 0.8449063, 1.596131, 1, 0, 0, 1, 1,
1.109134, -0.1602567, 3.806055, 1, 0, 0, 1, 1,
1.111349, 0.5516992, 0.6210201, 1, 0, 0, 1, 1,
1.112323, 1.351984, 1.924003, 1, 0, 0, 1, 1,
1.119997, -0.6601242, 2.296175, 1, 0, 0, 1, 1,
1.129155, 0.8688149, 1.215817, 0, 0, 0, 1, 1,
1.129317, 0.9187717, 2.289406, 0, 0, 0, 1, 1,
1.130323, -0.3001854, -0.1126351, 0, 0, 0, 1, 1,
1.131013, -0.6126347, 1.269837, 0, 0, 0, 1, 1,
1.133523, -0.9892544, 1.384524, 0, 0, 0, 1, 1,
1.141175, -0.1375745, 0.1719472, 0, 0, 0, 1, 1,
1.141526, 1.934591, 0.6068381, 0, 0, 0, 1, 1,
1.144433, 0.2422682, 1.375362, 1, 1, 1, 1, 1,
1.149562, 0.369348, 0.2075934, 1, 1, 1, 1, 1,
1.153924, -2.015209, 3.837379, 1, 1, 1, 1, 1,
1.166092, -0.05405723, 1.970731, 1, 1, 1, 1, 1,
1.168318, -0.1392091, 0.64059, 1, 1, 1, 1, 1,
1.173216, 0.5421558, 2.336157, 1, 1, 1, 1, 1,
1.17546, -0.6147777, 2.099815, 1, 1, 1, 1, 1,
1.189855, -1.013979, 2.362233, 1, 1, 1, 1, 1,
1.191994, 0.7502524, -1.253115, 1, 1, 1, 1, 1,
1.19562, -0.3780011, 2.906515, 1, 1, 1, 1, 1,
1.196384, 1.114052, 1.962447, 1, 1, 1, 1, 1,
1.197976, 0.1904881, 0.7353327, 1, 1, 1, 1, 1,
1.203497, 1.444458, -0.6178253, 1, 1, 1, 1, 1,
1.209544, 2.103378, -0.2878481, 1, 1, 1, 1, 1,
1.211368, -1.062044, 0.9884651, 1, 1, 1, 1, 1,
1.214859, 0.1407148, 0.8439719, 0, 0, 1, 1, 1,
1.217358, -1.172104, 2.542439, 1, 0, 0, 1, 1,
1.218835, -0.05607416, 0.3807481, 1, 0, 0, 1, 1,
1.230477, -1.982059, 4.543724, 1, 0, 0, 1, 1,
1.23424, 0.007803565, 1.271462, 1, 0, 0, 1, 1,
1.240943, 0.2857763, 0.7677541, 1, 0, 0, 1, 1,
1.242868, 1.325992, 0.5590781, 0, 0, 0, 1, 1,
1.247729, -1.508085, 1.237762, 0, 0, 0, 1, 1,
1.247829, 0.3671211, 1.039585, 0, 0, 0, 1, 1,
1.260082, 0.2336955, 0.5617033, 0, 0, 0, 1, 1,
1.26386, 0.3666769, 0.5243132, 0, 0, 0, 1, 1,
1.265862, -1.44234, 1.913189, 0, 0, 0, 1, 1,
1.269469, -0.4187126, 2.172988, 0, 0, 0, 1, 1,
1.275646, -1.2534, 1.978523, 1, 1, 1, 1, 1,
1.278669, -0.1089785, 1.197598, 1, 1, 1, 1, 1,
1.281602, -0.1341042, 0.56537, 1, 1, 1, 1, 1,
1.283178, -0.3464308, 2.279758, 1, 1, 1, 1, 1,
1.284755, -1.371296, 3.392689, 1, 1, 1, 1, 1,
1.285959, -1.330533, 1.328282, 1, 1, 1, 1, 1,
1.29199, -1.188631, 2.059221, 1, 1, 1, 1, 1,
1.307646, 1.613158, 0.8367575, 1, 1, 1, 1, 1,
1.310608, -0.4476592, 3.241854, 1, 1, 1, 1, 1,
1.315791, 1.099652, -0.4323469, 1, 1, 1, 1, 1,
1.322401, 1.149771, 1.909527, 1, 1, 1, 1, 1,
1.325154, 0.5846648, 1.164677, 1, 1, 1, 1, 1,
1.331809, 0.9675985, 2.864479, 1, 1, 1, 1, 1,
1.335806, -0.106768, -0.4949581, 1, 1, 1, 1, 1,
1.34054, 0.5108773, 0.7856558, 1, 1, 1, 1, 1,
1.341709, -1.656464, 2.719893, 0, 0, 1, 1, 1,
1.341998, -1.333217, 1.9039, 1, 0, 0, 1, 1,
1.350271, 0.57784, 1.427408, 1, 0, 0, 1, 1,
1.353174, -1.05314, 1.008556, 1, 0, 0, 1, 1,
1.384359, 0.1473801, 1.510594, 1, 0, 0, 1, 1,
1.392225, -0.2344333, 2.499419, 1, 0, 0, 1, 1,
1.392243, -0.3471068, 2.660722, 0, 0, 0, 1, 1,
1.397464, -0.9009139, 3.935936, 0, 0, 0, 1, 1,
1.399518, 1.015257, 3.188898, 0, 0, 0, 1, 1,
1.404788, 1.134927, 1.555288, 0, 0, 0, 1, 1,
1.413002, -1.399953, 2.761079, 0, 0, 0, 1, 1,
1.416821, -0.1881637, 2.504134, 0, 0, 0, 1, 1,
1.419922, 0.7135647, -0.9797017, 0, 0, 0, 1, 1,
1.449917, 0.3287438, 3.468238, 1, 1, 1, 1, 1,
1.452976, 0.9750293, 2.880197, 1, 1, 1, 1, 1,
1.453271, 0.3304607, 0.9227509, 1, 1, 1, 1, 1,
1.455757, 0.2778748, 0.6360648, 1, 1, 1, 1, 1,
1.460951, -0.6579121, 2.470124, 1, 1, 1, 1, 1,
1.463931, -1.137771, 2.926437, 1, 1, 1, 1, 1,
1.465921, 0.5384071, 1.715302, 1, 1, 1, 1, 1,
1.48095, 1.553451, 1.28781, 1, 1, 1, 1, 1,
1.484003, 0.5798841, 1.715185, 1, 1, 1, 1, 1,
1.488426, 2.237218, 0.7838041, 1, 1, 1, 1, 1,
1.519803, 0.9510127, 1.485248, 1, 1, 1, 1, 1,
1.527465, 2.226335, 0.2550648, 1, 1, 1, 1, 1,
1.541014, -0.02146829, 1.801414, 1, 1, 1, 1, 1,
1.556339, 0.4779701, 1.998159, 1, 1, 1, 1, 1,
1.558878, -0.7491069, 2.525646, 1, 1, 1, 1, 1,
1.561236, -0.3088844, 3.100183, 0, 0, 1, 1, 1,
1.570777, -0.8301608, 0.2867768, 1, 0, 0, 1, 1,
1.573332, 0.7427859, -0.2206874, 1, 0, 0, 1, 1,
1.575336, -0.6500775, 1.575588, 1, 0, 0, 1, 1,
1.581614, -1.171658, 2.185437, 1, 0, 0, 1, 1,
1.58476, 0.6143191, 1.186884, 1, 0, 0, 1, 1,
1.587252, 1.325166, 1.357584, 0, 0, 0, 1, 1,
1.594629, -0.7027076, 1.301677, 0, 0, 0, 1, 1,
1.60442, 2.016457, -0.3751062, 0, 0, 0, 1, 1,
1.607229, -2.507808, 1.886311, 0, 0, 0, 1, 1,
1.60974, 0.4735685, 2.332934, 0, 0, 0, 1, 1,
1.611514, 0.4960988, 1.017573, 0, 0, 0, 1, 1,
1.613424, -0.7758177, 2.826886, 0, 0, 0, 1, 1,
1.623698, 0.3825707, 0.248962, 1, 1, 1, 1, 1,
1.633496, -0.6382507, 0.5873882, 1, 1, 1, 1, 1,
1.675998, -1.177682, 2.570088, 1, 1, 1, 1, 1,
1.697237, 0.2245071, 1.247644, 1, 1, 1, 1, 1,
1.701015, 0.5011776, 2.990649, 1, 1, 1, 1, 1,
1.702363, 1.072782, 0.626472, 1, 1, 1, 1, 1,
1.707056, 0.8195518, 0.8231086, 1, 1, 1, 1, 1,
1.712662, -0.3818696, 1.91086, 1, 1, 1, 1, 1,
1.721297, 0.583029, 3.391715, 1, 1, 1, 1, 1,
1.735661, -0.3202847, 1.462405, 1, 1, 1, 1, 1,
1.756629, -1.113611, 0.6926396, 1, 1, 1, 1, 1,
1.764111, 0.09148968, 1.622767, 1, 1, 1, 1, 1,
1.783438, -0.8601845, 2.255832, 1, 1, 1, 1, 1,
1.784825, 1.350081, -0.5635738, 1, 1, 1, 1, 1,
1.808444, 0.4457569, 1.635933, 1, 1, 1, 1, 1,
1.810434, -0.4685407, 3.08458, 0, 0, 1, 1, 1,
1.818798, -1.778574, 2.483468, 1, 0, 0, 1, 1,
1.820216, -0.1530702, 1.224129, 1, 0, 0, 1, 1,
1.826169, -0.06199674, 1.421675, 1, 0, 0, 1, 1,
1.831936, 0.147374, 1.647729, 1, 0, 0, 1, 1,
1.83825, -1.029045, 1.364937, 1, 0, 0, 1, 1,
1.849545, 0.281547, 2.177391, 0, 0, 0, 1, 1,
1.85405, 0.8336594, 1.62052, 0, 0, 0, 1, 1,
1.861324, -2.047182, 2.453902, 0, 0, 0, 1, 1,
1.90589, 1.599408, 0.3453346, 0, 0, 0, 1, 1,
1.909937, -0.2224256, 1.843516, 0, 0, 0, 1, 1,
1.911606, -0.7374013, 2.166405, 0, 0, 0, 1, 1,
1.911659, -0.7838079, 1.313058, 0, 0, 0, 1, 1,
1.930434, -0.8830402, 1.588249, 1, 1, 1, 1, 1,
1.933484, 1.318693, 0.1507373, 1, 1, 1, 1, 1,
1.94053, -0.9439653, 0.6644651, 1, 1, 1, 1, 1,
1.942245, -1.034107, 2.727928, 1, 1, 1, 1, 1,
1.953598, 2.331107, -1.195756, 1, 1, 1, 1, 1,
1.964303, 0.8363932, 1.304615, 1, 1, 1, 1, 1,
1.986852, -0.5220857, 2.845156, 1, 1, 1, 1, 1,
2.001548, 0.7331657, 1.952536, 1, 1, 1, 1, 1,
2.022452, 0.751718, 0.2655992, 1, 1, 1, 1, 1,
2.069864, 0.1489792, 2.851181, 1, 1, 1, 1, 1,
2.074605, -0.8065951, 1.680407, 1, 1, 1, 1, 1,
2.07745, -0.2977165, 2.856743, 1, 1, 1, 1, 1,
2.127809, -1.762075, 3.021424, 1, 1, 1, 1, 1,
2.142932, 0.8426467, 0.1442249, 1, 1, 1, 1, 1,
2.16836, -0.1612583, 0.9538437, 1, 1, 1, 1, 1,
2.179145, 2.193444, -1.610358, 0, 0, 1, 1, 1,
2.179289, 0.08720981, 0.06816819, 1, 0, 0, 1, 1,
2.182339, 0.6337571, 0.8693953, 1, 0, 0, 1, 1,
2.1904, -1.081783, 1.671731, 1, 0, 0, 1, 1,
2.225296, -0.6611693, 0.3546464, 1, 0, 0, 1, 1,
2.243328, -0.2183017, 2.088875, 1, 0, 0, 1, 1,
2.252699, -1.015599, 2.272592, 0, 0, 0, 1, 1,
2.263527, -1.176667, 4.134282, 0, 0, 0, 1, 1,
2.27316, -1.638389, 0.9212973, 0, 0, 0, 1, 1,
2.292401, -1.991811, 1.89188, 0, 0, 0, 1, 1,
2.319311, 0.316627, 1.909317, 0, 0, 0, 1, 1,
2.343467, 0.3100081, 1.572899, 0, 0, 0, 1, 1,
2.368518, 0.0703169, 0.4186317, 0, 0, 0, 1, 1,
2.411683, 0.08996808, 3.954453, 1, 1, 1, 1, 1,
2.443673, 0.736025, 1.358458, 1, 1, 1, 1, 1,
2.520362, -0.8642423, 2.132627, 1, 1, 1, 1, 1,
2.575242, -0.2822204, 1.395259, 1, 1, 1, 1, 1,
2.651057, 1.023621, 1.165056, 1, 1, 1, 1, 1,
2.681993, -0.2006536, 4.670959, 1, 1, 1, 1, 1,
3.512009, 1.027154, 0.2979155, 1, 1, 1, 1, 1
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
var radius = 9.897399;
var distance = 34.76419;
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
mvMatrix.translate( -0.08257961, -0.4126415, 0.07305098 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.76419);
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
