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
-2.710692, 0.921735, -1.654497, 1, 0, 0, 1,
-2.556092, -0.7490709, -1.023202, 1, 0.007843138, 0, 1,
-2.554899, -1.374579, -3.802418, 1, 0.01176471, 0, 1,
-2.548026, -1.402394, -3.731694, 1, 0.01960784, 0, 1,
-2.521823, 0.4710701, -1.873628, 1, 0.02352941, 0, 1,
-2.491025, -0.07169501, -1.562182, 1, 0.03137255, 0, 1,
-2.471833, 0.1669876, -1.224609, 1, 0.03529412, 0, 1,
-2.412152, 0.1792839, -1.821723, 1, 0.04313726, 0, 1,
-2.337479, 0.5768157, -4.055484, 1, 0.04705882, 0, 1,
-2.32453, 0.3167913, -2.009874, 1, 0.05490196, 0, 1,
-2.279244, 0.5681272, -1.855093, 1, 0.05882353, 0, 1,
-2.274163, -0.2088175, -1.150626, 1, 0.06666667, 0, 1,
-2.271461, -0.03641528, -2.561797, 1, 0.07058824, 0, 1,
-2.271259, -0.2597004, -1.660196, 1, 0.07843138, 0, 1,
-2.265666, 0.7010916, -2.533329, 1, 0.08235294, 0, 1,
-2.233346, -0.3951616, -0.6262026, 1, 0.09019608, 0, 1,
-2.223114, -0.2779775, -1.215474, 1, 0.09411765, 0, 1,
-2.20697, -0.9741915, -3.989934, 1, 0.1019608, 0, 1,
-2.178128, -1.838178, -3.47419, 1, 0.1098039, 0, 1,
-2.130063, 0.7926663, -0.4453734, 1, 0.1137255, 0, 1,
-2.128581, -0.4279982, -2.705505, 1, 0.1215686, 0, 1,
-2.127619, 1.159968, -0.07388855, 1, 0.1254902, 0, 1,
-2.094426, -0.3310655, -1.472622, 1, 0.1333333, 0, 1,
-2.091807, -0.9556589, -1.55194, 1, 0.1372549, 0, 1,
-2.081926, 0.5149491, -1.850835, 1, 0.145098, 0, 1,
-2.073339, 0.002825807, -1.617405, 1, 0.1490196, 0, 1,
-2.068331, 0.5104636, -2.650632, 1, 0.1568628, 0, 1,
-2.049636, 0.9373245, -0.106589, 1, 0.1607843, 0, 1,
-2.044035, 2.272745, -1.30249, 1, 0.1686275, 0, 1,
-2.024963, 0.3062765, -1.456864, 1, 0.172549, 0, 1,
-1.993016, 1.302434, 0.3544144, 1, 0.1803922, 0, 1,
-1.984493, 0.1886484, -0.3554296, 1, 0.1843137, 0, 1,
-1.938256, -0.379183, -1.730137, 1, 0.1921569, 0, 1,
-1.925781, -0.8705802, -0.419524, 1, 0.1960784, 0, 1,
-1.915448, -0.07804906, -2.602725, 1, 0.2039216, 0, 1,
-1.904337, 1.118151, 0.4399664, 1, 0.2117647, 0, 1,
-1.901936, -0.353931, -3.678198, 1, 0.2156863, 0, 1,
-1.897311, 0.8145407, -0.9955041, 1, 0.2235294, 0, 1,
-1.843116, -0.9075757, -1.061731, 1, 0.227451, 0, 1,
-1.82838, 0.2758313, -2.363619, 1, 0.2352941, 0, 1,
-1.827714, -1.200333, -0.8804117, 1, 0.2392157, 0, 1,
-1.783478, -0.5416932, -1.039793, 1, 0.2470588, 0, 1,
-1.77185, -0.8507311, -1.912528, 1, 0.2509804, 0, 1,
-1.768427, -0.4973724, -1.858664, 1, 0.2588235, 0, 1,
-1.765844, 0.7443175, -0.6246672, 1, 0.2627451, 0, 1,
-1.762752, -1.417863, -1.761897, 1, 0.2705882, 0, 1,
-1.747521, -0.782156, -1.965514, 1, 0.2745098, 0, 1,
-1.741519, 0.0502884, -1.018727, 1, 0.282353, 0, 1,
-1.73208, -0.3964992, -1.064875, 1, 0.2862745, 0, 1,
-1.710317, 0.1087163, -1.226276, 1, 0.2941177, 0, 1,
-1.702695, -0.2130095, -3.705318, 1, 0.3019608, 0, 1,
-1.697239, -0.006548428, -0.9269175, 1, 0.3058824, 0, 1,
-1.693809, -0.00877417, 0.03566634, 1, 0.3137255, 0, 1,
-1.685625, 0.8451858, 0.116276, 1, 0.3176471, 0, 1,
-1.657073, -0.9668594, -3.134247, 1, 0.3254902, 0, 1,
-1.644024, -0.499673, -3.518118, 1, 0.3294118, 0, 1,
-1.640829, 1.341499, -1.604118, 1, 0.3372549, 0, 1,
-1.638969, -0.3238732, -3.650497, 1, 0.3411765, 0, 1,
-1.629663, -0.3034095, -0.6034282, 1, 0.3490196, 0, 1,
-1.625857, 1.673562, 0.1275308, 1, 0.3529412, 0, 1,
-1.594387, 0.9060326, -1.101115, 1, 0.3607843, 0, 1,
-1.594049, 0.0601162, -0.9462163, 1, 0.3647059, 0, 1,
-1.584796, -0.9848455, -3.073299, 1, 0.372549, 0, 1,
-1.576204, 1.070241, -0.375155, 1, 0.3764706, 0, 1,
-1.562726, -0.764471, -2.442601, 1, 0.3843137, 0, 1,
-1.561904, -1.339451, -2.235147, 1, 0.3882353, 0, 1,
-1.554074, 0.1084369, -2.788177, 1, 0.3960784, 0, 1,
-1.549151, -0.4902236, -2.317996, 1, 0.4039216, 0, 1,
-1.539757, 1.038877, -2.113177, 1, 0.4078431, 0, 1,
-1.536893, 0.6744252, 0.08799972, 1, 0.4156863, 0, 1,
-1.513167, -0.9680523, -1.666759, 1, 0.4196078, 0, 1,
-1.498677, -0.2293441, -0.5330154, 1, 0.427451, 0, 1,
-1.492518, 0.7249297, -1.711838, 1, 0.4313726, 0, 1,
-1.486948, -0.535772, -3.327068, 1, 0.4392157, 0, 1,
-1.483369, -2.22155, -1.794362, 1, 0.4431373, 0, 1,
-1.479188, 0.1073027, -0.2590343, 1, 0.4509804, 0, 1,
-1.460495, 0.9076706, -1.051988, 1, 0.454902, 0, 1,
-1.455083, 0.09300051, -0.4098112, 1, 0.4627451, 0, 1,
-1.443007, -0.7306962, -2.387097, 1, 0.4666667, 0, 1,
-1.441518, 0.2470984, 0.2446291, 1, 0.4745098, 0, 1,
-1.427795, -0.1133596, -2.018845, 1, 0.4784314, 0, 1,
-1.426867, -1.155937, -2.01857, 1, 0.4862745, 0, 1,
-1.426563, -0.8477948, -2.678084, 1, 0.4901961, 0, 1,
-1.408509, 1.203189, -1.353826, 1, 0.4980392, 0, 1,
-1.405482, 0.4837579, -1.515974, 1, 0.5058824, 0, 1,
-1.402277, 0.7924118, -1.16634, 1, 0.509804, 0, 1,
-1.399692, -0.7568365, -2.090491, 1, 0.5176471, 0, 1,
-1.398313, 0.01693223, -2.78337, 1, 0.5215687, 0, 1,
-1.395554, 0.03979098, -1.113691, 1, 0.5294118, 0, 1,
-1.392498, -0.5011681, -1.459773, 1, 0.5333334, 0, 1,
-1.390672, 0.1376466, -2.628464, 1, 0.5411765, 0, 1,
-1.390485, -1.067162, -3.039004, 1, 0.5450981, 0, 1,
-1.389812, -0.9048346, -2.006234, 1, 0.5529412, 0, 1,
-1.384742, 2.11756, -1.201544, 1, 0.5568628, 0, 1,
-1.382601, 1.25043, -1.725828, 1, 0.5647059, 0, 1,
-1.379664, -0.2815599, -0.992569, 1, 0.5686275, 0, 1,
-1.376907, 0.2392884, -0.6635835, 1, 0.5764706, 0, 1,
-1.371245, 0.5041441, -0.5895568, 1, 0.5803922, 0, 1,
-1.369856, 1.050894, -1.5465, 1, 0.5882353, 0, 1,
-1.36579, -1.212126, -2.210648, 1, 0.5921569, 0, 1,
-1.334186, -0.3055201, -1.757023, 1, 0.6, 0, 1,
-1.333671, 0.7215657, -2.015877, 1, 0.6078432, 0, 1,
-1.333631, -1.352793, -1.17608, 1, 0.6117647, 0, 1,
-1.330615, 0.9710078, -2.381409, 1, 0.6196079, 0, 1,
-1.3208, 1.052269, 0.5439184, 1, 0.6235294, 0, 1,
-1.318652, -1.368052, -2.345022, 1, 0.6313726, 0, 1,
-1.315322, 0.4296751, -1.593879, 1, 0.6352941, 0, 1,
-1.314745, 1.028365, 0.05310619, 1, 0.6431373, 0, 1,
-1.309286, 0.3246213, -2.676112, 1, 0.6470588, 0, 1,
-1.308938, -0.332584, -3.880571, 1, 0.654902, 0, 1,
-1.299973, -0.7028804, -2.859821, 1, 0.6588235, 0, 1,
-1.295722, -0.7772744, -0.02495799, 1, 0.6666667, 0, 1,
-1.293748, 0.8160828, -1.195974, 1, 0.6705883, 0, 1,
-1.293027, -0.9871186, -1.293135, 1, 0.6784314, 0, 1,
-1.292001, 0.1145046, -1.37803, 1, 0.682353, 0, 1,
-1.289014, -0.1088176, -3.029999, 1, 0.6901961, 0, 1,
-1.288006, 2.108545, 0.7596735, 1, 0.6941177, 0, 1,
-1.285622, -0.5068312, -1.7796, 1, 0.7019608, 0, 1,
-1.278609, -0.9186737, -2.277973, 1, 0.7098039, 0, 1,
-1.263224, -0.1804231, -3.004374, 1, 0.7137255, 0, 1,
-1.257219, -2.159566, -4.105023, 1, 0.7215686, 0, 1,
-1.255947, -1.05992, -4.224943, 1, 0.7254902, 0, 1,
-1.253711, -0.03512391, -3.370872, 1, 0.7333333, 0, 1,
-1.250335, 0.5668638, -2.750571, 1, 0.7372549, 0, 1,
-1.24517, -0.2477301, -2.764267, 1, 0.7450981, 0, 1,
-1.244097, 0.3540854, -2.112823, 1, 0.7490196, 0, 1,
-1.231825, 0.9128655, -1.61631, 1, 0.7568628, 0, 1,
-1.228419, 0.9618593, -1.724819, 1, 0.7607843, 0, 1,
-1.227486, 0.3632088, -1.245719, 1, 0.7686275, 0, 1,
-1.223425, 1.787515, 0.004060785, 1, 0.772549, 0, 1,
-1.222657, 0.05535758, -1.449177, 1, 0.7803922, 0, 1,
-1.218773, 0.8093926, -1.008986, 1, 0.7843137, 0, 1,
-1.21241, -0.2584654, -3.711076, 1, 0.7921569, 0, 1,
-1.208755, 2.867135, 1.389977, 1, 0.7960784, 0, 1,
-1.183053, -0.110999, -0.8585755, 1, 0.8039216, 0, 1,
-1.182084, -1.781705, -3.809543, 1, 0.8117647, 0, 1,
-1.181789, -0.3204274, -2.36314, 1, 0.8156863, 0, 1,
-1.178061, 1.520113, -1.510213, 1, 0.8235294, 0, 1,
-1.172118, -1.306208, -3.213221, 1, 0.827451, 0, 1,
-1.167249, 0.0312843, -0.05042062, 1, 0.8352941, 0, 1,
-1.162718, -0.6854458, -2.074307, 1, 0.8392157, 0, 1,
-1.153974, 0.6127164, -0.7494826, 1, 0.8470588, 0, 1,
-1.143884, 1.480035, -1.050747, 1, 0.8509804, 0, 1,
-1.138064, -0.8968117, -1.028343, 1, 0.8588235, 0, 1,
-1.135478, 1.470415, -2.236718, 1, 0.8627451, 0, 1,
-1.135123, 1.634904, -2.220056, 1, 0.8705882, 0, 1,
-1.126125, 0.3691174, -0.972876, 1, 0.8745098, 0, 1,
-1.118046, -0.08610852, -2.459703, 1, 0.8823529, 0, 1,
-1.116994, 0.6290337, -1.045579, 1, 0.8862745, 0, 1,
-1.116923, -0.3815493, -1.026773, 1, 0.8941177, 0, 1,
-1.116722, -0.5959758, -2.228064, 1, 0.8980392, 0, 1,
-1.091229, 1.44604, 0.03028716, 1, 0.9058824, 0, 1,
-1.086236, 1.016417, -0.155465, 1, 0.9137255, 0, 1,
-1.080113, 0.6112255, -0.8496745, 1, 0.9176471, 0, 1,
-1.077872, 1.109127, -1.406115, 1, 0.9254902, 0, 1,
-1.075488, 1.549851, -1.127859, 1, 0.9294118, 0, 1,
-1.075275, -1.175636, -0.9228887, 1, 0.9372549, 0, 1,
-1.074397, -0.7541773, -2.262074, 1, 0.9411765, 0, 1,
-1.064923, -0.6417524, -0.7908934, 1, 0.9490196, 0, 1,
-1.063713, 0.08760216, -2.513869, 1, 0.9529412, 0, 1,
-1.060949, 0.5980651, -1.308702, 1, 0.9607843, 0, 1,
-1.054894, -1.09549, -1.051715, 1, 0.9647059, 0, 1,
-1.053386, 0.7875884, -1.550972, 1, 0.972549, 0, 1,
-1.048006, -0.7246823, -2.29246, 1, 0.9764706, 0, 1,
-1.046876, -1.159871, -3.212559, 1, 0.9843137, 0, 1,
-1.043845, -0.714449, -2.254486, 1, 0.9882353, 0, 1,
-1.043076, -1.740997, -0.6006798, 1, 0.9960784, 0, 1,
-1.039898, 1.498895, 0.4259584, 0.9960784, 1, 0, 1,
-1.039833, -1.274526, -1.130501, 0.9921569, 1, 0, 1,
-1.038616, 0.6363703, -0.8167977, 0.9843137, 1, 0, 1,
-1.030377, -0.2734812, -0.3135006, 0.9803922, 1, 0, 1,
-1.025489, 0.6121594, -2.251902, 0.972549, 1, 0, 1,
-1.016584, -0.3737502, -0.9493586, 0.9686275, 1, 0, 1,
-1.015393, -0.6099999, -1.92177, 0.9607843, 1, 0, 1,
-1.012356, -0.7460673, -1.651944, 0.9568627, 1, 0, 1,
-1.01208, 0.2430857, -1.992657, 0.9490196, 1, 0, 1,
-1.007872, -0.08557915, 0.5634565, 0.945098, 1, 0, 1,
-1.007377, -1.142396, -2.948483, 0.9372549, 1, 0, 1,
-1.00301, -1.962966, -4.135533, 0.9333333, 1, 0, 1,
-1.00213, 1.21549, -0.2963454, 0.9254902, 1, 0, 1,
-0.9878978, 1.532871, -0.1596941, 0.9215686, 1, 0, 1,
-0.9857492, -0.4350186, -2.136112, 0.9137255, 1, 0, 1,
-0.9838345, 0.4689477, -1.348503, 0.9098039, 1, 0, 1,
-0.9827561, 0.5695132, -1.575946, 0.9019608, 1, 0, 1,
-0.9774322, 2.00246, 0.3024088, 0.8941177, 1, 0, 1,
-0.9724166, 0.3979557, -1.506754, 0.8901961, 1, 0, 1,
-0.9679641, 1.112718, -1.390328, 0.8823529, 1, 0, 1,
-0.9580297, 1.121667, -1.750402, 0.8784314, 1, 0, 1,
-0.9560043, 2.749563, -0.7789184, 0.8705882, 1, 0, 1,
-0.9446799, 1.737264, 0.4386141, 0.8666667, 1, 0, 1,
-0.9347468, -1.072053, -1.798521, 0.8588235, 1, 0, 1,
-0.929207, -1.761088, -4.817722, 0.854902, 1, 0, 1,
-0.9255919, -0.3448185, -2.090622, 0.8470588, 1, 0, 1,
-0.9249576, 1.320022, -1.254512, 0.8431373, 1, 0, 1,
-0.9244384, 0.359146, -0.5882078, 0.8352941, 1, 0, 1,
-0.9212903, -0.2927089, -3.227037, 0.8313726, 1, 0, 1,
-0.9205148, 0.2727996, -0.05693197, 0.8235294, 1, 0, 1,
-0.9170455, 0.03625223, -2.350536, 0.8196079, 1, 0, 1,
-0.9125978, 0.5480362, -0.1757237, 0.8117647, 1, 0, 1,
-0.9117033, 0.5420799, -0.8127511, 0.8078431, 1, 0, 1,
-0.9102057, -0.5114626, -1.185187, 0.8, 1, 0, 1,
-0.9045148, 0.5071451, -2.381338, 0.7921569, 1, 0, 1,
-0.8979244, -2.774085, -2.377046, 0.7882353, 1, 0, 1,
-0.889289, -1.05145, -3.769299, 0.7803922, 1, 0, 1,
-0.8777432, -0.3871034, -0.6840302, 0.7764706, 1, 0, 1,
-0.8709601, -1.703389, -4.331386, 0.7686275, 1, 0, 1,
-0.869957, -0.4609773, -1.113852, 0.7647059, 1, 0, 1,
-0.8653942, -0.6587472, -3.266808, 0.7568628, 1, 0, 1,
-0.8547032, 1.410859, 0.009604935, 0.7529412, 1, 0, 1,
-0.8536919, -2.036932, -1.384136, 0.7450981, 1, 0, 1,
-0.8502399, -1.514015, -2.246062, 0.7411765, 1, 0, 1,
-0.8481981, 0.1182008, -1.958935, 0.7333333, 1, 0, 1,
-0.8425774, 0.2397639, -1.598958, 0.7294118, 1, 0, 1,
-0.8375595, 0.02054011, -0.665355, 0.7215686, 1, 0, 1,
-0.828702, -0.3991931, -1.806923, 0.7176471, 1, 0, 1,
-0.8254178, 0.8334303, -1.326855, 0.7098039, 1, 0, 1,
-0.8222727, -0.1748376, -2.717103, 0.7058824, 1, 0, 1,
-0.8196591, 0.3659689, -1.21511, 0.6980392, 1, 0, 1,
-0.8125483, 0.4044171, -1.491866, 0.6901961, 1, 0, 1,
-0.8113264, -1.772252, -2.338915, 0.6862745, 1, 0, 1,
-0.8099602, 0.8411105, 0.6146519, 0.6784314, 1, 0, 1,
-0.8080238, 2.996495, 0.4791734, 0.6745098, 1, 0, 1,
-0.8065359, -2.07488, -2.714403, 0.6666667, 1, 0, 1,
-0.7869352, -1.00585, -2.495496, 0.6627451, 1, 0, 1,
-0.7865282, 0.4237627, 1.058155, 0.654902, 1, 0, 1,
-0.7838582, 0.7002746, -0.7071255, 0.6509804, 1, 0, 1,
-0.7797324, 2.057643, 1.235031, 0.6431373, 1, 0, 1,
-0.779488, -0.08006568, -3.415045, 0.6392157, 1, 0, 1,
-0.7777135, -1.122932, -2.754097, 0.6313726, 1, 0, 1,
-0.7754083, 0.3242542, 1.187548, 0.627451, 1, 0, 1,
-0.7709807, -0.4465688, -2.363909, 0.6196079, 1, 0, 1,
-0.7709224, -0.4505737, -0.9013622, 0.6156863, 1, 0, 1,
-0.7705262, -0.2736317, -1.639679, 0.6078432, 1, 0, 1,
-0.770079, -0.8751935, -2.42324, 0.6039216, 1, 0, 1,
-0.7650337, 0.8827255, -1.179837, 0.5960785, 1, 0, 1,
-0.7503375, 0.4343123, -1.430164, 0.5882353, 1, 0, 1,
-0.7456583, -0.03831641, -2.376955, 0.5843138, 1, 0, 1,
-0.7426434, -0.5360928, -1.940329, 0.5764706, 1, 0, 1,
-0.742329, -1.356371, -3.305705, 0.572549, 1, 0, 1,
-0.7360022, -0.442883, -0.6974659, 0.5647059, 1, 0, 1,
-0.7281293, -0.4286191, 0.08338665, 0.5607843, 1, 0, 1,
-0.7255981, -1.07185, -3.314649, 0.5529412, 1, 0, 1,
-0.7237294, 0.4590907, -1.651491, 0.5490196, 1, 0, 1,
-0.7226401, 0.2046158, -0.6101491, 0.5411765, 1, 0, 1,
-0.7153144, 0.1361258, -1.513279, 0.5372549, 1, 0, 1,
-0.7151862, -0.1193962, -1.784003, 0.5294118, 1, 0, 1,
-0.7025281, 1.066351, -0.8410205, 0.5254902, 1, 0, 1,
-0.7020845, -0.5917288, -2.806926, 0.5176471, 1, 0, 1,
-0.7020779, -0.468861, -2.033762, 0.5137255, 1, 0, 1,
-0.6968771, 0.7268656, -2.641483, 0.5058824, 1, 0, 1,
-0.6962487, 0.2176762, -0.5295928, 0.5019608, 1, 0, 1,
-0.6924505, 0.2309685, -1.994591, 0.4941176, 1, 0, 1,
-0.6915511, -0.8402039, -3.479946, 0.4862745, 1, 0, 1,
-0.6895206, -0.07366071, -0.05215604, 0.4823529, 1, 0, 1,
-0.6876478, -0.4525188, -1.666188, 0.4745098, 1, 0, 1,
-0.6800511, -1.486154, -3.666425, 0.4705882, 1, 0, 1,
-0.679357, -0.8057445, -3.215804, 0.4627451, 1, 0, 1,
-0.6779954, 0.4071458, -0.4460866, 0.4588235, 1, 0, 1,
-0.6738863, 0.7205228, -0.7237828, 0.4509804, 1, 0, 1,
-0.6723014, 2.096374, 0.1416597, 0.4470588, 1, 0, 1,
-0.6718158, -1.378046, -2.87353, 0.4392157, 1, 0, 1,
-0.6635749, -1.214281, -1.682291, 0.4352941, 1, 0, 1,
-0.656186, -2.423665, -2.005297, 0.427451, 1, 0, 1,
-0.6498279, 0.1359902, -0.4303625, 0.4235294, 1, 0, 1,
-0.6465139, -0.3218727, -2.337185, 0.4156863, 1, 0, 1,
-0.6448828, 1.041888, -2.263212, 0.4117647, 1, 0, 1,
-0.6445097, -1.11603, -0.8616589, 0.4039216, 1, 0, 1,
-0.6378673, 1.129359, -0.08540727, 0.3960784, 1, 0, 1,
-0.6370589, 1.693545, 0.01811612, 0.3921569, 1, 0, 1,
-0.6366549, -0.04268374, -0.7333385, 0.3843137, 1, 0, 1,
-0.6353325, 0.1829341, -1.992421, 0.3803922, 1, 0, 1,
-0.6274154, -0.5661942, -2.554186, 0.372549, 1, 0, 1,
-0.6238757, -1.704954, -2.185069, 0.3686275, 1, 0, 1,
-0.620495, -0.6157784, 0.6018816, 0.3607843, 1, 0, 1,
-0.619265, 0.2624223, -0.3079196, 0.3568628, 1, 0, 1,
-0.6113771, -0.7231401, -3.022155, 0.3490196, 1, 0, 1,
-0.6108386, -0.4470652, -2.527814, 0.345098, 1, 0, 1,
-0.6083103, -0.1219954, -3.968139, 0.3372549, 1, 0, 1,
-0.6055523, -0.3134815, -2.611325, 0.3333333, 1, 0, 1,
-0.6053544, 0.2204129, -1.698229, 0.3254902, 1, 0, 1,
-0.6047606, 2.040614, -0.6269069, 0.3215686, 1, 0, 1,
-0.6024621, 1.237619, 1.045039, 0.3137255, 1, 0, 1,
-0.5964121, 0.1927105, -0.7028399, 0.3098039, 1, 0, 1,
-0.589621, 2.600537, 0.03316111, 0.3019608, 1, 0, 1,
-0.5870214, 0.2231243, -0.9750645, 0.2941177, 1, 0, 1,
-0.586637, -1.856383, -2.955138, 0.2901961, 1, 0, 1,
-0.5861732, 0.1882041, -2.564016, 0.282353, 1, 0, 1,
-0.5769401, 0.9588296, -2.084549, 0.2784314, 1, 0, 1,
-0.5724906, -0.6590472, -2.645898, 0.2705882, 1, 0, 1,
-0.5721077, 0.4088575, -1.38514, 0.2666667, 1, 0, 1,
-0.5716437, -0.027055, -1.749182, 0.2588235, 1, 0, 1,
-0.5714055, -0.4236795, -1.832386, 0.254902, 1, 0, 1,
-0.5705492, -0.7295669, -0.6699765, 0.2470588, 1, 0, 1,
-0.570008, 1.08462, -0.9717842, 0.2431373, 1, 0, 1,
-0.5693477, -0.2475131, -1.62544, 0.2352941, 1, 0, 1,
-0.5688888, 1.149473, -0.3823016, 0.2313726, 1, 0, 1,
-0.564969, 0.1585658, 0.09180544, 0.2235294, 1, 0, 1,
-0.5578766, -2.103, -3.169296, 0.2196078, 1, 0, 1,
-0.5568823, 1.125161, -0.8337808, 0.2117647, 1, 0, 1,
-0.5568321, -0.214545, -2.053387, 0.2078431, 1, 0, 1,
-0.5530638, -1.920884, -1.836106, 0.2, 1, 0, 1,
-0.5495507, -0.6909826, -2.673642, 0.1921569, 1, 0, 1,
-0.5494691, 0.3998883, -1.104049, 0.1882353, 1, 0, 1,
-0.5471576, 1.320954, -0.04235823, 0.1803922, 1, 0, 1,
-0.5423058, 0.3947258, -2.23332, 0.1764706, 1, 0, 1,
-0.5333872, 2.10951, 2.507451, 0.1686275, 1, 0, 1,
-0.5297437, -0.888963, -3.395877, 0.1647059, 1, 0, 1,
-0.5268664, -0.1580439, -1.136828, 0.1568628, 1, 0, 1,
-0.5236083, -0.2565482, -0.8409284, 0.1529412, 1, 0, 1,
-0.5217281, -1.656879, -3.611312, 0.145098, 1, 0, 1,
-0.5206981, -0.5350724, -2.411049, 0.1411765, 1, 0, 1,
-0.519787, -0.7433333, -3.409051, 0.1333333, 1, 0, 1,
-0.5164835, -0.8601366, -0.8340849, 0.1294118, 1, 0, 1,
-0.5126972, -0.4903304, -1.767868, 0.1215686, 1, 0, 1,
-0.5122678, 0.4243319, -2.192219, 0.1176471, 1, 0, 1,
-0.510518, -0.1513498, -3.182182, 0.1098039, 1, 0, 1,
-0.5089053, 0.3612047, 0.7643412, 0.1058824, 1, 0, 1,
-0.5034236, -0.4533502, -2.749338, 0.09803922, 1, 0, 1,
-0.5023665, -0.5653914, -0.4159236, 0.09019608, 1, 0, 1,
-0.4971256, 1.029766, -2.504491, 0.08627451, 1, 0, 1,
-0.4911154, 0.2854596, -0.03027903, 0.07843138, 1, 0, 1,
-0.4904081, 0.7331895, 0.05020383, 0.07450981, 1, 0, 1,
-0.4885585, 0.3197154, -0.8433855, 0.06666667, 1, 0, 1,
-0.4876575, 0.8543324, 0.9072509, 0.0627451, 1, 0, 1,
-0.4841295, -1.088534, -2.976118, 0.05490196, 1, 0, 1,
-0.482213, -0.4273895, -2.251204, 0.05098039, 1, 0, 1,
-0.4813601, -0.2125983, -3.4201, 0.04313726, 1, 0, 1,
-0.4801065, 0.08811998, -0.9101793, 0.03921569, 1, 0, 1,
-0.474972, 0.8804691, -0.6420854, 0.03137255, 1, 0, 1,
-0.4696049, 0.9915033, -1.098782, 0.02745098, 1, 0, 1,
-0.4690372, -1.339293, -2.021946, 0.01960784, 1, 0, 1,
-0.4652912, 0.1778, -1.058349, 0.01568628, 1, 0, 1,
-0.4605286, 0.2228091, -0.9069154, 0.007843138, 1, 0, 1,
-0.456926, 0.8843524, -2.032275, 0.003921569, 1, 0, 1,
-0.4527572, -0.98573, -2.093866, 0, 1, 0.003921569, 1,
-0.4493856, -0.3268216, -2.291667, 0, 1, 0.01176471, 1,
-0.4477343, -0.9753788, -4.698083, 0, 1, 0.01568628, 1,
-0.4476731, -0.2387775, -2.126173, 0, 1, 0.02352941, 1,
-0.4440354, 0.2361078, -1.496258, 0, 1, 0.02745098, 1,
-0.4425683, -0.4668215, -2.710288, 0, 1, 0.03529412, 1,
-0.4418962, -0.9291973, -3.866799, 0, 1, 0.03921569, 1,
-0.4379496, -0.323355, -2.515048, 0, 1, 0.04705882, 1,
-0.4318719, 0.6289596, -1.227205, 0, 1, 0.05098039, 1,
-0.4310078, -0.9768634, -2.545789, 0, 1, 0.05882353, 1,
-0.4263296, 0.3015664, 0.4259608, 0, 1, 0.0627451, 1,
-0.4227786, 0.2106915, -1.766757, 0, 1, 0.07058824, 1,
-0.4182236, -1.564358, -4.830917, 0, 1, 0.07450981, 1,
-0.4174714, 0.4743233, -1.105827, 0, 1, 0.08235294, 1,
-0.4123559, -0.4372993, -2.725134, 0, 1, 0.08627451, 1,
-0.4095764, -1.440062, -3.707165, 0, 1, 0.09411765, 1,
-0.406933, 0.8232068, -1.076786, 0, 1, 0.1019608, 1,
-0.4039864, 0.3973943, -0.3007912, 0, 1, 0.1058824, 1,
-0.4021331, -0.04506261, -3.248981, 0, 1, 0.1137255, 1,
-0.3999818, -0.5761706, -3.070454, 0, 1, 0.1176471, 1,
-0.3963736, -1.187209, -3.497402, 0, 1, 0.1254902, 1,
-0.3950366, -1.082763, -3.925971, 0, 1, 0.1294118, 1,
-0.3916053, 0.219211, -0.7868674, 0, 1, 0.1372549, 1,
-0.3862475, 1.325676, 0.587436, 0, 1, 0.1411765, 1,
-0.3859842, 0.8774487, 1.930787, 0, 1, 0.1490196, 1,
-0.3832463, -0.9106054, -1.927696, 0, 1, 0.1529412, 1,
-0.3805613, 0.1599072, -0.1129716, 0, 1, 0.1607843, 1,
-0.374983, 0.0232562, -2.29839, 0, 1, 0.1647059, 1,
-0.3699976, 0.496159, -0.6595138, 0, 1, 0.172549, 1,
-0.3694187, -1.55917, -5.170966, 0, 1, 0.1764706, 1,
-0.368888, -0.7736269, -2.994053, 0, 1, 0.1843137, 1,
-0.36694, 0.4679024, 0.1173999, 0, 1, 0.1882353, 1,
-0.3658821, -1.913885, -3.110638, 0, 1, 0.1960784, 1,
-0.3646536, 0.4777639, 0.2231447, 0, 1, 0.2039216, 1,
-0.3628747, 0.5956048, -0.2906734, 0, 1, 0.2078431, 1,
-0.3549926, 0.4867601, -1.262822, 0, 1, 0.2156863, 1,
-0.3548626, 0.5340266, -0.4120504, 0, 1, 0.2196078, 1,
-0.3538775, 0.1955498, -1.653571, 0, 1, 0.227451, 1,
-0.3531747, 0.9688125, 1.263199, 0, 1, 0.2313726, 1,
-0.3530442, 0.2965796, -1.315361, 0, 1, 0.2392157, 1,
-0.3519295, 0.7373616, -0.2129499, 0, 1, 0.2431373, 1,
-0.3500147, -0.1297397, -3.01331, 0, 1, 0.2509804, 1,
-0.3496532, -0.4295914, -3.529657, 0, 1, 0.254902, 1,
-0.3477966, 3.194209, 0.1394224, 0, 1, 0.2627451, 1,
-0.3463367, 1.490431, -0.6416176, 0, 1, 0.2666667, 1,
-0.3451413, -0.7023993, -2.680796, 0, 1, 0.2745098, 1,
-0.3390467, -2.346082, -1.515342, 0, 1, 0.2784314, 1,
-0.3337964, 0.3204868, -0.1545731, 0, 1, 0.2862745, 1,
-0.3279278, -0.2163305, -1.475319, 0, 1, 0.2901961, 1,
-0.3271974, 0.6171071, -0.3068123, 0, 1, 0.2980392, 1,
-0.3250583, -0.1475298, -1.209363, 0, 1, 0.3058824, 1,
-0.3242105, 0.8218506, -0.3339391, 0, 1, 0.3098039, 1,
-0.3203323, -0.2081662, -3.594246, 0, 1, 0.3176471, 1,
-0.3197721, 1.533256, 1.09594, 0, 1, 0.3215686, 1,
-0.319289, -0.4875617, -2.501117, 0, 1, 0.3294118, 1,
-0.3191924, 0.387071, -0.2815543, 0, 1, 0.3333333, 1,
-0.303001, -1.736192, -4.079272, 0, 1, 0.3411765, 1,
-0.2979584, 1.272658, 0.5011453, 0, 1, 0.345098, 1,
-0.2934208, 0.494105, -0.9445261, 0, 1, 0.3529412, 1,
-0.2927241, -0.8188422, -2.971411, 0, 1, 0.3568628, 1,
-0.2901666, 0.04922781, -0.5063343, 0, 1, 0.3647059, 1,
-0.2880296, 0.6194621, -1.336714, 0, 1, 0.3686275, 1,
-0.2861695, -1.791071, -3.424856, 0, 1, 0.3764706, 1,
-0.281461, 0.9083821, -0.4271485, 0, 1, 0.3803922, 1,
-0.2671825, 2.090952, -1.27011, 0, 1, 0.3882353, 1,
-0.2655737, 0.7737553, -0.09933134, 0, 1, 0.3921569, 1,
-0.260847, 0.147579, -0.05639496, 0, 1, 0.4, 1,
-0.2589692, -0.0372942, -2.484407, 0, 1, 0.4078431, 1,
-0.2582034, -0.3854139, -1.415348, 0, 1, 0.4117647, 1,
-0.2545539, -0.1259599, -1.728213, 0, 1, 0.4196078, 1,
-0.2519737, 0.7866284, 0.788859, 0, 1, 0.4235294, 1,
-0.2485744, -1.305896, -2.366408, 0, 1, 0.4313726, 1,
-0.2471422, -0.9818745, -1.920092, 0, 1, 0.4352941, 1,
-0.2423511, 0.8735359, -1.565754, 0, 1, 0.4431373, 1,
-0.2372852, -0.8475425, -2.768813, 0, 1, 0.4470588, 1,
-0.2334191, 0.3958276, -1.61288, 0, 1, 0.454902, 1,
-0.2327579, 0.4149436, 0.221335, 0, 1, 0.4588235, 1,
-0.232379, -0.7677079, -1.121835, 0, 1, 0.4666667, 1,
-0.228298, 1.181606, -0.3314707, 0, 1, 0.4705882, 1,
-0.2209994, 0.5186805, -0.2218888, 0, 1, 0.4784314, 1,
-0.2153861, 0.1811108, 0.3265639, 0, 1, 0.4823529, 1,
-0.2113702, 0.1115786, -0.8395256, 0, 1, 0.4901961, 1,
-0.2109095, -1.042969, -3.712562, 0, 1, 0.4941176, 1,
-0.200146, -0.7980009, -1.849405, 0, 1, 0.5019608, 1,
-0.1940092, -1.383225, -2.991601, 0, 1, 0.509804, 1,
-0.1879062, 0.1338962, -0.195184, 0, 1, 0.5137255, 1,
-0.1869634, -0.7016642, -3.497266, 0, 1, 0.5215687, 1,
-0.1859281, 0.2621521, -2.061646, 0, 1, 0.5254902, 1,
-0.1857505, -1.545753, -1.352955, 0, 1, 0.5333334, 1,
-0.1838246, -0.2013543, -2.388273, 0, 1, 0.5372549, 1,
-0.1833994, 2.119659, 1.674853, 0, 1, 0.5450981, 1,
-0.1808515, -1.389519, -4.683553, 0, 1, 0.5490196, 1,
-0.1776971, 1.568549, -1.791523, 0, 1, 0.5568628, 1,
-0.1753788, -1.427262, -4.577974, 0, 1, 0.5607843, 1,
-0.1639557, 0.7636602, -1.337334, 0, 1, 0.5686275, 1,
-0.162485, -1.528781, -3.03729, 0, 1, 0.572549, 1,
-0.1616426, -1.290834, -3.647063, 0, 1, 0.5803922, 1,
-0.161035, 0.3664578, -2.772682, 0, 1, 0.5843138, 1,
-0.16028, -0.710431, -2.209323, 0, 1, 0.5921569, 1,
-0.1588535, -0.8626922, -1.62427, 0, 1, 0.5960785, 1,
-0.1571267, -0.6024635, -1.556596, 0, 1, 0.6039216, 1,
-0.1566022, -0.4284654, -2.160839, 0, 1, 0.6117647, 1,
-0.1529811, 0.3347986, -0.256894, 0, 1, 0.6156863, 1,
-0.1487305, 1.399398, 1.624184, 0, 1, 0.6235294, 1,
-0.1461951, -0.03781815, -2.328328, 0, 1, 0.627451, 1,
-0.1410785, -1.389541, -5.275075, 0, 1, 0.6352941, 1,
-0.1386378, 0.3162946, -2.21789, 0, 1, 0.6392157, 1,
-0.1335835, 0.7554072, -0.4238821, 0, 1, 0.6470588, 1,
-0.1334812, -0.3451784, -2.993572, 0, 1, 0.6509804, 1,
-0.1325511, 0.9960693, 1.379372, 0, 1, 0.6588235, 1,
-0.1320065, -1.8436, -2.342228, 0, 1, 0.6627451, 1,
-0.1223145, 0.9492638, -1.274716, 0, 1, 0.6705883, 1,
-0.1166516, -1.360988, -2.611118, 0, 1, 0.6745098, 1,
-0.1165503, -0.7054105, -2.747339, 0, 1, 0.682353, 1,
-0.1161741, 1.364634, -0.2583961, 0, 1, 0.6862745, 1,
-0.1123457, -0.007953166, -2.122866, 0, 1, 0.6941177, 1,
-0.1090956, 0.4132918, 0.9412411, 0, 1, 0.7019608, 1,
-0.1066464, -0.3206142, -2.465235, 0, 1, 0.7058824, 1,
-0.1058025, 0.1381246, 1.083851, 0, 1, 0.7137255, 1,
-0.09794574, -1.91102, -2.373714, 0, 1, 0.7176471, 1,
-0.08770126, -0.4523841, -2.254187, 0, 1, 0.7254902, 1,
-0.08759354, -0.3044627, -3.07231, 0, 1, 0.7294118, 1,
-0.08186663, -0.4738995, -4.096726, 0, 1, 0.7372549, 1,
-0.08122841, -0.1295169, -1.360699, 0, 1, 0.7411765, 1,
-0.077197, 0.5738876, 0.5286187, 0, 1, 0.7490196, 1,
-0.07414921, 0.08952895, -0.08736636, 0, 1, 0.7529412, 1,
-0.07408303, -3.206901, -3.445558, 0, 1, 0.7607843, 1,
-0.07339106, -0.8101866, -2.218809, 0, 1, 0.7647059, 1,
-0.07235833, -1.050342, -2.598989, 0, 1, 0.772549, 1,
-0.07210993, -0.9219683, -3.489254, 0, 1, 0.7764706, 1,
-0.06741536, 0.6424027, -0.4793851, 0, 1, 0.7843137, 1,
-0.06610546, -0.4230114, -1.344534, 0, 1, 0.7882353, 1,
-0.06403948, 0.8155465, -0.4670285, 0, 1, 0.7960784, 1,
-0.06260168, 0.03797958, -2.141155, 0, 1, 0.8039216, 1,
-0.05121918, -0.3309551, -5.704944, 0, 1, 0.8078431, 1,
-0.0471854, 1.731863, -0.3728766, 0, 1, 0.8156863, 1,
-0.04602326, 0.2980326, 0.4836709, 0, 1, 0.8196079, 1,
-0.04330624, 0.5339816, -2.078812, 0, 1, 0.827451, 1,
-0.04156134, 0.5531186, -0.48397, 0, 1, 0.8313726, 1,
-0.03950917, 2.920642, -3.025271, 0, 1, 0.8392157, 1,
-0.03711816, 0.9875211, 0.338661, 0, 1, 0.8431373, 1,
-0.03578955, -0.02611423, -1.282291, 0, 1, 0.8509804, 1,
-0.03328118, -1.580024, -5.137578, 0, 1, 0.854902, 1,
-0.03234212, -0.882728, -2.285389, 0, 1, 0.8627451, 1,
-0.03137659, 0.6740199, 0.3199319, 0, 1, 0.8666667, 1,
-0.02481222, -0.1818849, -0.9897466, 0, 1, 0.8745098, 1,
-0.02413061, 0.3212765, -0.4344714, 0, 1, 0.8784314, 1,
-0.02337801, 1.625993, 1.010577, 0, 1, 0.8862745, 1,
-0.02114501, 0.7557892, 0.7452417, 0, 1, 0.8901961, 1,
-0.01929014, 0.3971692, -2.467568, 0, 1, 0.8980392, 1,
-0.01749479, 2.448353, 1.607335, 0, 1, 0.9058824, 1,
-0.01147217, 0.6263266, -1.390018, 0, 1, 0.9098039, 1,
-0.009010646, -1.100749, -1.912496, 0, 1, 0.9176471, 1,
-0.006780671, -1.39792, -2.809115, 0, 1, 0.9215686, 1,
-0.002130496, -0.8142868, -3.823834, 0, 1, 0.9294118, 1,
0.0008952098, -1.570765, 1.675609, 0, 1, 0.9333333, 1,
0.005700345, -0.5375192, 3.504808, 0, 1, 0.9411765, 1,
0.006465965, -1.359695, 4.638682, 0, 1, 0.945098, 1,
0.01063599, -0.3566721, 3.67398, 0, 1, 0.9529412, 1,
0.01250684, 0.9183525, -0.9023074, 0, 1, 0.9568627, 1,
0.01695344, -1.197063, 1.446275, 0, 1, 0.9647059, 1,
0.01832447, -1.788577, 2.102817, 0, 1, 0.9686275, 1,
0.02119662, -0.5622911, 2.914458, 0, 1, 0.9764706, 1,
0.02327185, 1.305248, -0.06286435, 0, 1, 0.9803922, 1,
0.02505921, -0.1342155, 4.025196, 0, 1, 0.9882353, 1,
0.02623551, 2.146826, -0.1664895, 0, 1, 0.9921569, 1,
0.02664801, -0.8894964, 3.042675, 0, 1, 1, 1,
0.0284391, -0.8781124, 4.472706, 0, 0.9921569, 1, 1,
0.02987526, -0.6713937, 4.198193, 0, 0.9882353, 1, 1,
0.03042527, 0.5456033, 0.5151168, 0, 0.9803922, 1, 1,
0.03102922, 1.900534, -1.022628, 0, 0.9764706, 1, 1,
0.03364552, 0.6856338, -0.2321702, 0, 0.9686275, 1, 1,
0.0345146, 0.4609954, -2.091674, 0, 0.9647059, 1, 1,
0.03541048, -0.1991005, 2.322889, 0, 0.9568627, 1, 1,
0.03831542, 0.05287948, 0.3859044, 0, 0.9529412, 1, 1,
0.04166523, 1.116493, 0.9699337, 0, 0.945098, 1, 1,
0.05073578, 0.01643374, 0.2107904, 0, 0.9411765, 1, 1,
0.05135906, 0.2719208, 0.906378, 0, 0.9333333, 1, 1,
0.05624636, -1.633588, 2.960502, 0, 0.9294118, 1, 1,
0.05760174, 1.096171, 1.016363, 0, 0.9215686, 1, 1,
0.05969207, 1.684593, 0.3602006, 0, 0.9176471, 1, 1,
0.06381121, 0.8283254, -0.5986932, 0, 0.9098039, 1, 1,
0.06506918, -0.8071287, 2.907267, 0, 0.9058824, 1, 1,
0.06534572, 0.388662, -0.2355205, 0, 0.8980392, 1, 1,
0.06624407, 0.5358202, -0.2921513, 0, 0.8901961, 1, 1,
0.06905277, -1.110626, 1.773707, 0, 0.8862745, 1, 1,
0.06982471, 2.106623, -0.2497996, 0, 0.8784314, 1, 1,
0.0721615, -0.9100605, 2.209357, 0, 0.8745098, 1, 1,
0.07351098, -0.2646909, 2.387596, 0, 0.8666667, 1, 1,
0.07482442, -0.7512732, 2.878555, 0, 0.8627451, 1, 1,
0.08094601, 1.653399, 1.456686, 0, 0.854902, 1, 1,
0.08469381, -0.9907936, 3.383382, 0, 0.8509804, 1, 1,
0.08661914, -0.8082713, 4.761056, 0, 0.8431373, 1, 1,
0.08875269, -1.583519, 3.634328, 0, 0.8392157, 1, 1,
0.08897758, 2.415145, -1.138621, 0, 0.8313726, 1, 1,
0.0890011, -0.8148859, 4.66998, 0, 0.827451, 1, 1,
0.09399782, -0.6390319, 2.289355, 0, 0.8196079, 1, 1,
0.09417214, 0.2768413, 1.062667, 0, 0.8156863, 1, 1,
0.09784321, 1.68408, -0.1345022, 0, 0.8078431, 1, 1,
0.09860339, 0.1528084, -0.1659231, 0, 0.8039216, 1, 1,
0.09865534, 0.9393349, 0.7128944, 0, 0.7960784, 1, 1,
0.09914905, 0.2452614, -0.6528793, 0, 0.7882353, 1, 1,
0.09916337, 0.02183201, 2.063668, 0, 0.7843137, 1, 1,
0.1080973, 0.5128983, -0.523779, 0, 0.7764706, 1, 1,
0.1085391, -2.2674, 5.074697, 0, 0.772549, 1, 1,
0.1165685, 0.5046915, -0.6142101, 0, 0.7647059, 1, 1,
0.1187423, -1.821759, 2.552804, 0, 0.7607843, 1, 1,
0.1269216, 0.2269532, 0.3172956, 0, 0.7529412, 1, 1,
0.1292195, 1.891732, -0.8761631, 0, 0.7490196, 1, 1,
0.1310158, 0.9887956, -1.487097, 0, 0.7411765, 1, 1,
0.135873, 0.3467377, -0.4231491, 0, 0.7372549, 1, 1,
0.1410574, 0.3737063, -0.08306003, 0, 0.7294118, 1, 1,
0.1438225, 0.2167435, 1.555836, 0, 0.7254902, 1, 1,
0.1439105, -0.3198158, 1.174767, 0, 0.7176471, 1, 1,
0.1439108, 0.496199, -0.9215471, 0, 0.7137255, 1, 1,
0.1463524, 0.4389217, 3.690425, 0, 0.7058824, 1, 1,
0.1482592, 0.06373134, 2.312562, 0, 0.6980392, 1, 1,
0.152526, 2.320518, 0.2886868, 0, 0.6941177, 1, 1,
0.1528815, -0.6448103, 3.838907, 0, 0.6862745, 1, 1,
0.1553161, 0.08822937, 0.6591959, 0, 0.682353, 1, 1,
0.1628851, -1.069082, 2.162642, 0, 0.6745098, 1, 1,
0.1632347, -1.279402, 3.453898, 0, 0.6705883, 1, 1,
0.1636645, -0.9422147, 3.603954, 0, 0.6627451, 1, 1,
0.1667411, 1.27561, -1.940683, 0, 0.6588235, 1, 1,
0.1668127, -2.368197, 1.282702, 0, 0.6509804, 1, 1,
0.170573, 2.032187, -0.2496006, 0, 0.6470588, 1, 1,
0.1712953, 1.120237, -0.5103172, 0, 0.6392157, 1, 1,
0.1723869, -0.7553248, 3.316861, 0, 0.6352941, 1, 1,
0.1724182, -0.3684038, 2.345017, 0, 0.627451, 1, 1,
0.1727815, -0.2486296, 3.271647, 0, 0.6235294, 1, 1,
0.1753693, 0.5144732, 0.3482651, 0, 0.6156863, 1, 1,
0.1791097, -0.0320518, 1.362137, 0, 0.6117647, 1, 1,
0.1808676, 0.3594964, 1.76666, 0, 0.6039216, 1, 1,
0.1848133, 0.5290686, 0.09342618, 0, 0.5960785, 1, 1,
0.1858747, -0.6192176, 2.790827, 0, 0.5921569, 1, 1,
0.1906674, 0.7058777, -1.535846, 0, 0.5843138, 1, 1,
0.1910176, -0.82795, 4.069417, 0, 0.5803922, 1, 1,
0.1913184, 0.4083744, -0.1279645, 0, 0.572549, 1, 1,
0.1929419, 0.5333969, -0.8755155, 0, 0.5686275, 1, 1,
0.1956084, 1.248574, 0.6620265, 0, 0.5607843, 1, 1,
0.200564, 1.443178, 0.3911147, 0, 0.5568628, 1, 1,
0.2059587, 0.2090418, 2.187461, 0, 0.5490196, 1, 1,
0.2079485, 0.6073893, 1.183733, 0, 0.5450981, 1, 1,
0.2101921, 1.074895, 0.5804287, 0, 0.5372549, 1, 1,
0.2104185, -0.3587747, 2.308755, 0, 0.5333334, 1, 1,
0.2119781, 0.5553027, 0.4909147, 0, 0.5254902, 1, 1,
0.2123697, -1.737496, 3.399287, 0, 0.5215687, 1, 1,
0.2214222, 0.6169001, 1.827641, 0, 0.5137255, 1, 1,
0.2247648, 0.9148094, -0.0988633, 0, 0.509804, 1, 1,
0.2248572, 1.11085, 1.742374, 0, 0.5019608, 1, 1,
0.226981, -0.2295709, 2.354661, 0, 0.4941176, 1, 1,
0.2293634, -1.26895, 4.190837, 0, 0.4901961, 1, 1,
0.2330425, 1.285636, -0.7579884, 0, 0.4823529, 1, 1,
0.2350589, 2.442141, 0.005050107, 0, 0.4784314, 1, 1,
0.2368513, 0.5006758, 0.1619288, 0, 0.4705882, 1, 1,
0.239317, 0.7773114, -1.45055, 0, 0.4666667, 1, 1,
0.2402347, -0.7341327, 3.137927, 0, 0.4588235, 1, 1,
0.2429501, -1.210384, 3.893522, 0, 0.454902, 1, 1,
0.2455021, -0.9119797, 2.262582, 0, 0.4470588, 1, 1,
0.2456807, -0.3278304, 2.329605, 0, 0.4431373, 1, 1,
0.2524275, 0.4647376, 0.3916159, 0, 0.4352941, 1, 1,
0.2568841, -1.703629, 2.823225, 0, 0.4313726, 1, 1,
0.260521, -0.0816605, 0.7418136, 0, 0.4235294, 1, 1,
0.2605992, -1.465323, 4.226421, 0, 0.4196078, 1, 1,
0.2627434, 0.6870773, 0.3463075, 0, 0.4117647, 1, 1,
0.2681334, 0.3124463, 0.5522351, 0, 0.4078431, 1, 1,
0.2711042, -1.064259, 3.84759, 0, 0.4, 1, 1,
0.2714351, 1.102508, -1.159879, 0, 0.3921569, 1, 1,
0.2746789, -0.04403013, 1.741783, 0, 0.3882353, 1, 1,
0.2747453, 0.1782429, 3.696515, 0, 0.3803922, 1, 1,
0.2761954, 0.6266555, 0.753541, 0, 0.3764706, 1, 1,
0.2802858, -1.432469, 2.674207, 0, 0.3686275, 1, 1,
0.2805004, 0.9554462, -0.5058265, 0, 0.3647059, 1, 1,
0.2884493, -0.3146709, 1.66507, 0, 0.3568628, 1, 1,
0.2925043, 0.1294087, 1.48053, 0, 0.3529412, 1, 1,
0.2940009, -0.1250775, 1.724454, 0, 0.345098, 1, 1,
0.2947988, -0.8981094, 3.583125, 0, 0.3411765, 1, 1,
0.303128, 1.210483, 1.790156, 0, 0.3333333, 1, 1,
0.3032037, -0.2906327, 3.586648, 0, 0.3294118, 1, 1,
0.3040408, 0.06962029, -1.026555, 0, 0.3215686, 1, 1,
0.3087339, 1.263454, 1.011145, 0, 0.3176471, 1, 1,
0.3094079, 1.828844, -1.672733, 0, 0.3098039, 1, 1,
0.3099651, 0.8500592, 0.2519978, 0, 0.3058824, 1, 1,
0.3103415, 0.3946233, 2.048394, 0, 0.2980392, 1, 1,
0.3111283, 1.755655, 2.249727, 0, 0.2901961, 1, 1,
0.3115559, -0.9743788, 3.002232, 0, 0.2862745, 1, 1,
0.313514, 1.06971, -0.9715179, 0, 0.2784314, 1, 1,
0.313987, 1.345513, 0.2130026, 0, 0.2745098, 1, 1,
0.3320494, 0.0956891, 1.056385, 0, 0.2666667, 1, 1,
0.3376939, -0.8889536, 1.164661, 0, 0.2627451, 1, 1,
0.3431951, -0.7172943, 4.360782, 0, 0.254902, 1, 1,
0.346104, 0.5992528, -1.883324, 0, 0.2509804, 1, 1,
0.3475168, -0.397273, 1.778839, 0, 0.2431373, 1, 1,
0.350143, 0.5736369, 1.59782, 0, 0.2392157, 1, 1,
0.3511932, -0.5345148, 2.257094, 0, 0.2313726, 1, 1,
0.3514234, 2.137663, -1.102133, 0, 0.227451, 1, 1,
0.3516488, -0.9744701, 3.698066, 0, 0.2196078, 1, 1,
0.3532819, -1.943838, 3.50116, 0, 0.2156863, 1, 1,
0.35811, -1.449301, 2.573098, 0, 0.2078431, 1, 1,
0.3596255, -1.183667, 2.557544, 0, 0.2039216, 1, 1,
0.3622403, -0.1337323, 1.297797, 0, 0.1960784, 1, 1,
0.3670418, -0.006119023, 3.468063, 0, 0.1882353, 1, 1,
0.3673582, 0.2269099, 0.7218412, 0, 0.1843137, 1, 1,
0.3742297, 0.4447709, 1.200778, 0, 0.1764706, 1, 1,
0.376964, 0.5675449, 2.029393, 0, 0.172549, 1, 1,
0.3781, -1.394479, 3.170402, 0, 0.1647059, 1, 1,
0.3894542, 1.905719, 0.5274875, 0, 0.1607843, 1, 1,
0.3916582, 0.9136994, 0.02913955, 0, 0.1529412, 1, 1,
0.3928141, 0.745507, 0.2202017, 0, 0.1490196, 1, 1,
0.3980882, 1.158378, -1.023863, 0, 0.1411765, 1, 1,
0.3988382, 1.358398, 0.8733516, 0, 0.1372549, 1, 1,
0.4007672, 1.018776, -0.3353152, 0, 0.1294118, 1, 1,
0.4025658, 1.251583, 0.5912185, 0, 0.1254902, 1, 1,
0.4054552, 0.4553771, 0.4903508, 0, 0.1176471, 1, 1,
0.4059039, 2.115693, -0.4501, 0, 0.1137255, 1, 1,
0.4232412, -0.6601619, 1.877427, 0, 0.1058824, 1, 1,
0.4259904, 0.8217739, 1.137771, 0, 0.09803922, 1, 1,
0.4276335, 0.06428615, 1.509826, 0, 0.09411765, 1, 1,
0.4292176, -0.08109544, 2.030463, 0, 0.08627451, 1, 1,
0.4325106, -0.4926689, 2.3716, 0, 0.08235294, 1, 1,
0.4336743, 1.365689, 1.32481, 0, 0.07450981, 1, 1,
0.4343668, -0.4652404, 2.417964, 0, 0.07058824, 1, 1,
0.4433213, 0.6474284, 1.264831, 0, 0.0627451, 1, 1,
0.4490724, 0.4719426, 0.3529648, 0, 0.05882353, 1, 1,
0.450239, 0.638244, -0.8610437, 0, 0.05098039, 1, 1,
0.4506988, -0.08660688, 2.152485, 0, 0.04705882, 1, 1,
0.4541742, -1.267039, 1.605048, 0, 0.03921569, 1, 1,
0.454361, -0.2519886, 2.11375, 0, 0.03529412, 1, 1,
0.4549688, 0.2581992, 0.4631799, 0, 0.02745098, 1, 1,
0.455087, 0.2516524, 0.110586, 0, 0.02352941, 1, 1,
0.4566815, -1.477885, 1.421577, 0, 0.01568628, 1, 1,
0.4579008, -0.3879883, 2.864045, 0, 0.01176471, 1, 1,
0.4613301, -1.565131, 0.4755119, 0, 0.003921569, 1, 1,
0.467203, -0.5586028, 0.6555628, 0.003921569, 0, 1, 1,
0.4689644, -0.6053507, 0.9795412, 0.007843138, 0, 1, 1,
0.473871, -0.9966849, 2.78566, 0.01568628, 0, 1, 1,
0.474135, -0.0433444, 4.02657, 0.01960784, 0, 1, 1,
0.4782192, 0.07954573, 1.193648, 0.02745098, 0, 1, 1,
0.4795387, 1.074773, 1.920696, 0.03137255, 0, 1, 1,
0.4816611, 0.7150256, 0.7828103, 0.03921569, 0, 1, 1,
0.4822914, 1.607067, 0.3656445, 0.04313726, 0, 1, 1,
0.482998, 1.197582, 0.6434409, 0.05098039, 0, 1, 1,
0.4869004, -0.3828617, 1.967899, 0.05490196, 0, 1, 1,
0.4876004, 0.436678, 0.8017337, 0.0627451, 0, 1, 1,
0.4876449, -1.834314, 2.056861, 0.06666667, 0, 1, 1,
0.488159, -1.145559, 2.107219, 0.07450981, 0, 1, 1,
0.4889892, 0.8368292, 1.870172, 0.07843138, 0, 1, 1,
0.4947644, 1.21779, 0.16963, 0.08627451, 0, 1, 1,
0.5003248, -2.496522, 3.750232, 0.09019608, 0, 1, 1,
0.50116, 1.060434, -0.577315, 0.09803922, 0, 1, 1,
0.5039665, -0.3565075, 1.904758, 0.1058824, 0, 1, 1,
0.5040779, 0.2058287, 1.764643, 0.1098039, 0, 1, 1,
0.5064829, 0.2357887, 1.617724, 0.1176471, 0, 1, 1,
0.5074863, -0.3271534, 1.913855, 0.1215686, 0, 1, 1,
0.5093054, -0.1269873, 3.067559, 0.1294118, 0, 1, 1,
0.5148791, 2.25282, -0.7860744, 0.1333333, 0, 1, 1,
0.5151475, 0.3150387, 0.8994414, 0.1411765, 0, 1, 1,
0.5155694, -1.180401, 3.518396, 0.145098, 0, 1, 1,
0.516266, 0.1553905, -0.9932576, 0.1529412, 0, 1, 1,
0.5173377, 0.3803305, 2.530214, 0.1568628, 0, 1, 1,
0.5181885, -1.203955, 4.841261, 0.1647059, 0, 1, 1,
0.5195883, 0.06334217, 1.723632, 0.1686275, 0, 1, 1,
0.5197901, -0.5192957, 3.745126, 0.1764706, 0, 1, 1,
0.5207264, -0.4843764, 2.625991, 0.1803922, 0, 1, 1,
0.5229298, -1.170407, 4.20912, 0.1882353, 0, 1, 1,
0.5319273, 0.5998229, 1.229649, 0.1921569, 0, 1, 1,
0.5341288, -1.316944, 1.82146, 0.2, 0, 1, 1,
0.5373235, -1.224931, 4.057551, 0.2078431, 0, 1, 1,
0.5407376, 0.4477122, 1.189111, 0.2117647, 0, 1, 1,
0.5419849, 1.176023, 0.2551925, 0.2196078, 0, 1, 1,
0.544242, -0.1360486, 1.419892, 0.2235294, 0, 1, 1,
0.5528403, -0.7969381, 3.35889, 0.2313726, 0, 1, 1,
0.5610107, 1.528568, 0.8426402, 0.2352941, 0, 1, 1,
0.5645252, -1.181125, 3.806233, 0.2431373, 0, 1, 1,
0.5710298, -2.709104, 1.839163, 0.2470588, 0, 1, 1,
0.5711217, -0.7679182, 5.175622, 0.254902, 0, 1, 1,
0.5734827, -0.6765761, 2.854326, 0.2588235, 0, 1, 1,
0.5808007, 1.346241, 1.394268, 0.2666667, 0, 1, 1,
0.5810961, 0.8498292, 1.367386, 0.2705882, 0, 1, 1,
0.5841845, -0.5688602, 1.251591, 0.2784314, 0, 1, 1,
0.5848142, 1.651336, 0.592071, 0.282353, 0, 1, 1,
0.5880215, -0.9750497, 0.8044041, 0.2901961, 0, 1, 1,
0.588257, -0.3670969, 2.473589, 0.2941177, 0, 1, 1,
0.5950421, -0.2720938, 3.883773, 0.3019608, 0, 1, 1,
0.6021228, 1.253543, 1.442084, 0.3098039, 0, 1, 1,
0.6024295, -0.5166587, 3.767088, 0.3137255, 0, 1, 1,
0.6051933, 1.584225, 2.802716, 0.3215686, 0, 1, 1,
0.6053947, 1.244322, 0.5022211, 0.3254902, 0, 1, 1,
0.6134064, 0.6148353, 0.9304093, 0.3333333, 0, 1, 1,
0.6140392, 2.053724, -1.039619, 0.3372549, 0, 1, 1,
0.615407, 0.8660231, 0.7797649, 0.345098, 0, 1, 1,
0.6156209, 0.1645979, 2.374315, 0.3490196, 0, 1, 1,
0.6156334, -0.3665349, 3.328393, 0.3568628, 0, 1, 1,
0.6265894, -1.797737, 1.825286, 0.3607843, 0, 1, 1,
0.6268719, 1.049708, -1.204847, 0.3686275, 0, 1, 1,
0.6272738, -0.5714824, 4.401491, 0.372549, 0, 1, 1,
0.632654, -1.590182, 3.254968, 0.3803922, 0, 1, 1,
0.6363082, -0.633289, 2.964274, 0.3843137, 0, 1, 1,
0.6387349, -0.6256771, 2.60908, 0.3921569, 0, 1, 1,
0.6417924, -0.7518124, 0.5418661, 0.3960784, 0, 1, 1,
0.6429045, -0.1601949, 2.59619, 0.4039216, 0, 1, 1,
0.6676708, 1.194957, -0.72896, 0.4117647, 0, 1, 1,
0.6698377, 0.930533, 1.18234, 0.4156863, 0, 1, 1,
0.6703993, 2.330119, 0.6982412, 0.4235294, 0, 1, 1,
0.6707987, 0.1506097, 1.806424, 0.427451, 0, 1, 1,
0.6712744, -0.659651, 1.765592, 0.4352941, 0, 1, 1,
0.6724606, 1.271389, 1.739877, 0.4392157, 0, 1, 1,
0.6724653, 0.5014819, 1.236851, 0.4470588, 0, 1, 1,
0.673008, 0.1657872, 1.996158, 0.4509804, 0, 1, 1,
0.6744502, -2.095959, 1.988543, 0.4588235, 0, 1, 1,
0.6761067, -0.5069962, 2.013821, 0.4627451, 0, 1, 1,
0.6768359, -0.2174333, 0.9530576, 0.4705882, 0, 1, 1,
0.6792145, 0.005800859, 1.753012, 0.4745098, 0, 1, 1,
0.6798097, -0.1025996, 0.8125753, 0.4823529, 0, 1, 1,
0.6800076, 3.642503, -0.1569719, 0.4862745, 0, 1, 1,
0.6842464, -0.4608182, 2.414779, 0.4941176, 0, 1, 1,
0.6843019, -1.560858, 3.250319, 0.5019608, 0, 1, 1,
0.6855073, 1.820473, 0.2746545, 0.5058824, 0, 1, 1,
0.6903798, -0.6372623, 2.112521, 0.5137255, 0, 1, 1,
0.6906727, 0.7830809, 0.6221944, 0.5176471, 0, 1, 1,
0.6913978, -0.4658594, 1.675548, 0.5254902, 0, 1, 1,
0.6928686, -0.1695303, 2.801342, 0.5294118, 0, 1, 1,
0.6946044, 0.6987147, 1.037276, 0.5372549, 0, 1, 1,
0.6948001, -1.22877, 2.502193, 0.5411765, 0, 1, 1,
0.6966192, 0.106852, 0.688826, 0.5490196, 0, 1, 1,
0.6970496, 1.700635, -0.7446429, 0.5529412, 0, 1, 1,
0.6981839, -1.5848, 3.316109, 0.5607843, 0, 1, 1,
0.6992791, 0.01353005, 1.015537, 0.5647059, 0, 1, 1,
0.7011614, 0.6399816, 0.7767357, 0.572549, 0, 1, 1,
0.7027941, -0.2363027, 1.411654, 0.5764706, 0, 1, 1,
0.7055734, 1.497282, -0.5332678, 0.5843138, 0, 1, 1,
0.7068862, 1.192129, -1.226307, 0.5882353, 0, 1, 1,
0.7082679, -1.747826, 1.950374, 0.5960785, 0, 1, 1,
0.7124785, -0.7978553, 2.429057, 0.6039216, 0, 1, 1,
0.7231123, 1.567889, -0.8552203, 0.6078432, 0, 1, 1,
0.724454, 0.5604849, 0.9795518, 0.6156863, 0, 1, 1,
0.7297859, -0.757644, 3.018739, 0.6196079, 0, 1, 1,
0.7317451, 0.1407111, 3.125065, 0.627451, 0, 1, 1,
0.7382317, 1.733498, 2.742762, 0.6313726, 0, 1, 1,
0.7422242, -0.524311, 2.847857, 0.6392157, 0, 1, 1,
0.7437931, -0.1600448, 2.892977, 0.6431373, 0, 1, 1,
0.7455078, -0.1529768, 1.71925, 0.6509804, 0, 1, 1,
0.7470091, 0.3667792, -0.1436915, 0.654902, 0, 1, 1,
0.748245, -0.721352, 2.0236, 0.6627451, 0, 1, 1,
0.7484431, 1.08527, 2.450111, 0.6666667, 0, 1, 1,
0.7485597, 0.8345929, -1.001845, 0.6745098, 0, 1, 1,
0.7513104, 0.6715508, 3.123112, 0.6784314, 0, 1, 1,
0.7607798, -0.4023747, 4.545905, 0.6862745, 0, 1, 1,
0.7629198, -0.4282847, 0.7968905, 0.6901961, 0, 1, 1,
0.7673877, 1.12843, 0.2477313, 0.6980392, 0, 1, 1,
0.7677894, -0.4276898, 4.362714, 0.7058824, 0, 1, 1,
0.7679821, 0.4664, 2.058317, 0.7098039, 0, 1, 1,
0.7685559, 0.399017, 1.958035, 0.7176471, 0, 1, 1,
0.7778589, -1.123109, 2.379208, 0.7215686, 0, 1, 1,
0.7947761, 1.014537, 0.2913134, 0.7294118, 0, 1, 1,
0.7962723, 0.1812167, 0.896076, 0.7333333, 0, 1, 1,
0.7988148, 0.3567144, -0.2144813, 0.7411765, 0, 1, 1,
0.809122, -2.044473, 3.53883, 0.7450981, 0, 1, 1,
0.8117648, 0.5006219, 0.7518961, 0.7529412, 0, 1, 1,
0.8142281, 1.194169, -0.4341462, 0.7568628, 0, 1, 1,
0.8155398, 0.9941598, 3.456538, 0.7647059, 0, 1, 1,
0.8167386, -0.02058964, 1.811877, 0.7686275, 0, 1, 1,
0.8189406, -1.401125, 3.604699, 0.7764706, 0, 1, 1,
0.8261318, -0.5715832, 1.483879, 0.7803922, 0, 1, 1,
0.841841, -0.4355389, 2.769313, 0.7882353, 0, 1, 1,
0.8418802, 0.8870561, 0.4186936, 0.7921569, 0, 1, 1,
0.8453074, -0.2816264, 1.67328, 0.8, 0, 1, 1,
0.8458903, -1.269156, 2.131599, 0.8078431, 0, 1, 1,
0.8476574, 0.2568717, 0.1078373, 0.8117647, 0, 1, 1,
0.8492881, 0.1785654, 2.093586, 0.8196079, 0, 1, 1,
0.8628895, 0.6621326, 1.197346, 0.8235294, 0, 1, 1,
0.8700355, -0.3003477, 2.662017, 0.8313726, 0, 1, 1,
0.8725291, -0.4506099, 2.440776, 0.8352941, 0, 1, 1,
0.8727274, 1.019468, 0.7124964, 0.8431373, 0, 1, 1,
0.8748422, 1.206504, -1.547822, 0.8470588, 0, 1, 1,
0.8868103, 0.00788825, 1.313897, 0.854902, 0, 1, 1,
0.8870757, 0.5226716, 1.04908, 0.8588235, 0, 1, 1,
0.88989, 0.2532555, 1.713395, 0.8666667, 0, 1, 1,
0.8939908, 2.117127, 0.8899525, 0.8705882, 0, 1, 1,
0.8949779, 0.7363936, -0.5105903, 0.8784314, 0, 1, 1,
0.8957443, -1.725862, 1.401591, 0.8823529, 0, 1, 1,
0.8981937, 0.2413355, 1.431093, 0.8901961, 0, 1, 1,
0.9011388, 0.929099, 0.1877617, 0.8941177, 0, 1, 1,
0.9072452, 0.05591087, 0.8716404, 0.9019608, 0, 1, 1,
0.9102185, -1.339576, 1.934773, 0.9098039, 0, 1, 1,
0.9120876, -2.067014, 2.705961, 0.9137255, 0, 1, 1,
0.9150496, 0.8165744, 2.18119, 0.9215686, 0, 1, 1,
0.9175164, -0.3214207, 3.28073, 0.9254902, 0, 1, 1,
0.9194766, -0.1441627, 0.06904063, 0.9333333, 0, 1, 1,
0.9197473, -0.3681935, 2.290425, 0.9372549, 0, 1, 1,
0.9234961, 0.3388839, -0.07736261, 0.945098, 0, 1, 1,
0.9239554, -1.301084, 2.070447, 0.9490196, 0, 1, 1,
0.9242393, 0.7827332, -1.59175, 0.9568627, 0, 1, 1,
0.9369169, -0.2470875, 1.387425, 0.9607843, 0, 1, 1,
0.9454983, 0.4401658, 0.7258505, 0.9686275, 0, 1, 1,
0.9628989, 1.503854, -0.1705535, 0.972549, 0, 1, 1,
0.9643323, 0.1009925, 1.40566, 0.9803922, 0, 1, 1,
0.9657909, 0.974676, -0.6657555, 0.9843137, 0, 1, 1,
0.9726524, 2.159438, -0.7916101, 0.9921569, 0, 1, 1,
0.9738172, -1.059023, -0.2364188, 0.9960784, 0, 1, 1,
0.9743939, 1.79419, 1.022858, 1, 0, 0.9960784, 1,
0.97938, -0.3349389, -0.1125557, 1, 0, 0.9882353, 1,
0.9800095, 1.340878, -0.7365125, 1, 0, 0.9843137, 1,
0.9829631, 0.05285626, 2.722303, 1, 0, 0.9764706, 1,
0.9841509, 0.9587297, 0.3966743, 1, 0, 0.972549, 1,
0.9854725, 0.6649395, -0.5960102, 1, 0, 0.9647059, 1,
0.9910425, -0.6962696, 2.781413, 1, 0, 0.9607843, 1,
0.9952828, 1.088414, 1.188415, 1, 0, 0.9529412, 1,
0.9968768, -0.5726367, 2.460352, 1, 0, 0.9490196, 1,
1.001763, -0.4400048, 1.618292, 1, 0, 0.9411765, 1,
1.002449, 0.6177772, 2.610473, 1, 0, 0.9372549, 1,
1.005547, 0.8699602, 0.5071238, 1, 0, 0.9294118, 1,
1.009274, -0.5023774, 3.760033, 1, 0, 0.9254902, 1,
1.013413, 0.2619435, 2.939698, 1, 0, 0.9176471, 1,
1.014248, -1.526771, 2.881773, 1, 0, 0.9137255, 1,
1.018893, -0.9487806, 3.091394, 1, 0, 0.9058824, 1,
1.02328, -0.1053074, 0.9652051, 1, 0, 0.9019608, 1,
1.024226, 0.5275005, 2.51907, 1, 0, 0.8941177, 1,
1.028487, -1.173463, 2.12085, 1, 0, 0.8862745, 1,
1.029967, 0.2988329, -0.1888343, 1, 0, 0.8823529, 1,
1.031909, 0.6212842, 1.446558, 1, 0, 0.8745098, 1,
1.034459, -1.057989, 4.213041, 1, 0, 0.8705882, 1,
1.051997, -1.736458, 5.040497, 1, 0, 0.8627451, 1,
1.060622, -0.1989496, 0.9681334, 1, 0, 0.8588235, 1,
1.065899, -1.445291, 2.493499, 1, 0, 0.8509804, 1,
1.068455, 1.281194, -1.585503, 1, 0, 0.8470588, 1,
1.068652, -0.5840321, 1.235948, 1, 0, 0.8392157, 1,
1.068847, -1.059855, 3.888567, 1, 0, 0.8352941, 1,
1.071495, -1.414692, 2.62149, 1, 0, 0.827451, 1,
1.074341, 1.039028, 1.275114, 1, 0, 0.8235294, 1,
1.078736, 0.2303075, 1.483277, 1, 0, 0.8156863, 1,
1.079002, 1.480544, 2.167083, 1, 0, 0.8117647, 1,
1.083888, 0.02948497, -0.4213699, 1, 0, 0.8039216, 1,
1.085399, 1.121329, -0.472268, 1, 0, 0.7960784, 1,
1.086694, -1.272654, 3.299586, 1, 0, 0.7921569, 1,
1.086737, -2.081553, 2.075253, 1, 0, 0.7843137, 1,
1.08981, -1.000528, 3.571533, 1, 0, 0.7803922, 1,
1.109833, 1.130151, -0.6111821, 1, 0, 0.772549, 1,
1.110582, 0.6752607, 0.8550301, 1, 0, 0.7686275, 1,
1.112061, -0.02252908, 1.792057, 1, 0, 0.7607843, 1,
1.116281, -0.1813475, 2.316401, 1, 0, 0.7568628, 1,
1.124292, 0.8466535, -0.2720733, 1, 0, 0.7490196, 1,
1.126736, 0.3387869, 1.228444, 1, 0, 0.7450981, 1,
1.127639, 0.7047488, 1.697661, 1, 0, 0.7372549, 1,
1.134275, -0.3646272, 1.180828, 1, 0, 0.7333333, 1,
1.134863, 0.3749735, -0.1966574, 1, 0, 0.7254902, 1,
1.137189, 0.2482735, 2.68386, 1, 0, 0.7215686, 1,
1.139542, -0.6183041, 3.155565, 1, 0, 0.7137255, 1,
1.146241, 1.396029, 2.108831, 1, 0, 0.7098039, 1,
1.14765, -0.8520089, 1.550771, 1, 0, 0.7019608, 1,
1.147746, 0.208865, 0.5424504, 1, 0, 0.6941177, 1,
1.151056, -0.936345, 1.100559, 1, 0, 0.6901961, 1,
1.153394, -0.4167765, 3.105124, 1, 0, 0.682353, 1,
1.155487, 0.7048796, 1.649546, 1, 0, 0.6784314, 1,
1.155834, -0.1534138, 2.011627, 1, 0, 0.6705883, 1,
1.161595, -0.2654442, 1.313724, 1, 0, 0.6666667, 1,
1.176766, 1.16639, 1.507288, 1, 0, 0.6588235, 1,
1.184139, 1.803811, 0.9732359, 1, 0, 0.654902, 1,
1.187545, 0.005716663, 1.810606, 1, 0, 0.6470588, 1,
1.189788, -1.286036, 2.555389, 1, 0, 0.6431373, 1,
1.203213, -0.1450272, 1.713014, 1, 0, 0.6352941, 1,
1.208643, -0.4096701, -0.9200296, 1, 0, 0.6313726, 1,
1.214402, -1.340897, 2.616208, 1, 0, 0.6235294, 1,
1.217148, 0.8495175, 1.957568, 1, 0, 0.6196079, 1,
1.221298, -1.7831, 3.273851, 1, 0, 0.6117647, 1,
1.225873, 0.195016, 2.639381, 1, 0, 0.6078432, 1,
1.243827, -1.138736, 1.820468, 1, 0, 0.6, 1,
1.245913, 2.471483, -0.2920769, 1, 0, 0.5921569, 1,
1.255706, -0.5237842, 0.8015275, 1, 0, 0.5882353, 1,
1.267822, -0.8763356, 2.177844, 1, 0, 0.5803922, 1,
1.285942, -1.982546, 2.221336, 1, 0, 0.5764706, 1,
1.293973, 0.05708718, 2.065295, 1, 0, 0.5686275, 1,
1.298176, -0.8001515, 3.892049, 1, 0, 0.5647059, 1,
1.300762, -1.225088, 1.124396, 1, 0, 0.5568628, 1,
1.307767, -0.04823365, 2.270142, 1, 0, 0.5529412, 1,
1.310196, -0.479257, 0.6428486, 1, 0, 0.5450981, 1,
1.334047, 1.25012, 0.2433016, 1, 0, 0.5411765, 1,
1.334792, 1.404408, 0.382348, 1, 0, 0.5333334, 1,
1.335871, -2.280363, 1.779825, 1, 0, 0.5294118, 1,
1.348903, 1.246587, 1.913809, 1, 0, 0.5215687, 1,
1.352048, 0.6045483, 2.092231, 1, 0, 0.5176471, 1,
1.385083, 0.613947, 1.318608, 1, 0, 0.509804, 1,
1.390034, 0.7760384, 1.621954, 1, 0, 0.5058824, 1,
1.398188, 0.6545736, 2.637472, 1, 0, 0.4980392, 1,
1.400309, 0.3014013, 0.2720684, 1, 0, 0.4901961, 1,
1.406469, -0.03647518, 2.671768, 1, 0, 0.4862745, 1,
1.413888, -0.2260137, 1.633637, 1, 0, 0.4784314, 1,
1.430641, -1.5369, 2.779008, 1, 0, 0.4745098, 1,
1.435453, -0.4906299, 2.046272, 1, 0, 0.4666667, 1,
1.450196, -0.5384124, 2.304247, 1, 0, 0.4627451, 1,
1.459261, -0.5882619, 1.485062, 1, 0, 0.454902, 1,
1.459869, -0.4442488, 1.439802, 1, 0, 0.4509804, 1,
1.464591, -0.6479656, 1.815376, 1, 0, 0.4431373, 1,
1.468606, 1.634302, -0.08553179, 1, 0, 0.4392157, 1,
1.473956, -0.846495, 3.139833, 1, 0, 0.4313726, 1,
1.474582, 1.318861, 0.8551411, 1, 0, 0.427451, 1,
1.502018, 0.5352123, 1.015547, 1, 0, 0.4196078, 1,
1.506185, 1.520038, 0.5166882, 1, 0, 0.4156863, 1,
1.508956, 0.7871557, 1.45331, 1, 0, 0.4078431, 1,
1.526086, 1.942127, -0.1918081, 1, 0, 0.4039216, 1,
1.535734, 0.9573498, 1.912484, 1, 0, 0.3960784, 1,
1.540854, 0.8408388, 1.896794, 1, 0, 0.3882353, 1,
1.546826, -1.071714, 2.396451, 1, 0, 0.3843137, 1,
1.563365, -0.5852599, 1.258383, 1, 0, 0.3764706, 1,
1.580752, 0.9641799, 1.334474, 1, 0, 0.372549, 1,
1.582248, 0.6727923, 0.7439187, 1, 0, 0.3647059, 1,
1.602527, 0.08231791, 3.226008, 1, 0, 0.3607843, 1,
1.605985, -2.398235, 4.047952, 1, 0, 0.3529412, 1,
1.607064, -0.1146132, 1.275932, 1, 0, 0.3490196, 1,
1.618827, 1.094578, 0.5084116, 1, 0, 0.3411765, 1,
1.630682, -0.3866116, 1.334401, 1, 0, 0.3372549, 1,
1.642823, -0.6183141, 2.444852, 1, 0, 0.3294118, 1,
1.645074, -2.437032, 2.130664, 1, 0, 0.3254902, 1,
1.645463, 0.5987733, 2.351646, 1, 0, 0.3176471, 1,
1.651346, -0.9227753, 2.675339, 1, 0, 0.3137255, 1,
1.660166, -0.1996569, 1.547567, 1, 0, 0.3058824, 1,
1.66997, -0.05979018, 1.971031, 1, 0, 0.2980392, 1,
1.688796, 0.997005, -0.1677586, 1, 0, 0.2941177, 1,
1.692365, 0.822536, 0.3345065, 1, 0, 0.2862745, 1,
1.698593, -0.4065313, 1.747843, 1, 0, 0.282353, 1,
1.709426, 0.007803636, 2.595669, 1, 0, 0.2745098, 1,
1.751257, -0.5271797, 3.135707, 1, 0, 0.2705882, 1,
1.755121, 0.6297632, 0.5309396, 1, 0, 0.2627451, 1,
1.757155, -1.521872, 1.852699, 1, 0, 0.2588235, 1,
1.760248, 1.12832, -0.4263893, 1, 0, 0.2509804, 1,
1.764288, -0.1103788, 3.52998, 1, 0, 0.2470588, 1,
1.765026, 0.2026834, 2.596502, 1, 0, 0.2392157, 1,
1.799811, -1.381038, 3.367767, 1, 0, 0.2352941, 1,
1.808459, -0.6425386, 1.149953, 1, 0, 0.227451, 1,
1.811867, 0.6640156, 2.237739, 1, 0, 0.2235294, 1,
1.816179, -0.9845855, 3.13695, 1, 0, 0.2156863, 1,
1.82182, -1.327907, 3.849959, 1, 0, 0.2117647, 1,
1.843998, 0.6017668, 0.8569642, 1, 0, 0.2039216, 1,
1.85132, -0.2920897, 1.738467, 1, 0, 0.1960784, 1,
1.877828, 1.061731, -0.04051419, 1, 0, 0.1921569, 1,
1.87886, -0.2166985, 1.933082, 1, 0, 0.1843137, 1,
1.890676, -0.7215478, 2.511012, 1, 0, 0.1803922, 1,
1.910836, -1.475479, 3.851618, 1, 0, 0.172549, 1,
1.941681, -1.01191, 1.864478, 1, 0, 0.1686275, 1,
1.948161, 0.9236494, 1.556111, 1, 0, 0.1607843, 1,
1.956923, -0.6117002, 3.207932, 1, 0, 0.1568628, 1,
1.966594, -0.5883477, 0.3411643, 1, 0, 0.1490196, 1,
1.993023, -0.06761707, 0.3933016, 1, 0, 0.145098, 1,
2.084954, -1.412162, 3.068204, 1, 0, 0.1372549, 1,
2.101445, -0.9513345, 2.503517, 1, 0, 0.1333333, 1,
2.124273, 0.4967206, -0.04976846, 1, 0, 0.1254902, 1,
2.124525, 1.300978, 0.521843, 1, 0, 0.1215686, 1,
2.136543, 2.142181, 1.301555, 1, 0, 0.1137255, 1,
2.136736, 0.2988547, 2.09971, 1, 0, 0.1098039, 1,
2.144859, 0.1045821, 1.877352, 1, 0, 0.1019608, 1,
2.186161, 0.7566608, 0.571694, 1, 0, 0.09411765, 1,
2.202427, -0.2609531, 0.914434, 1, 0, 0.09019608, 1,
2.269842, 0.3021816, 1.578212, 1, 0, 0.08235294, 1,
2.283127, -0.04232797, 1.643302, 1, 0, 0.07843138, 1,
2.36847, -0.1072607, 1.113882, 1, 0, 0.07058824, 1,
2.413761, 0.2067633, 1.090113, 1, 0, 0.06666667, 1,
2.480433, 1.122419, 1.434019, 1, 0, 0.05882353, 1,
2.528631, 0.1912084, 0.3164543, 1, 0, 0.05490196, 1,
2.532819, -0.4456435, 2.060207, 1, 0, 0.04705882, 1,
2.562268, -0.2335744, 2.252274, 1, 0, 0.04313726, 1,
2.626972, 0.3669353, 2.589925, 1, 0, 0.03529412, 1,
2.666627, 2.454894, 0.8401397, 1, 0, 0.03137255, 1,
2.753717, -1.567602, 2.356225, 1, 0, 0.02352941, 1,
2.856193, -0.05132951, 2.325232, 1, 0, 0.01960784, 1,
2.856774, -1.268651, 1.753814, 1, 0, 0.01176471, 1,
3.07896, 0.3255084, 1.712373, 1, 0, 0.007843138, 1
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
0.1841336, -4.367875, -7.5492, 0, -0.5, 0.5, 0.5,
0.1841336, -4.367875, -7.5492, 1, -0.5, 0.5, 0.5,
0.1841336, -4.367875, -7.5492, 1, 1.5, 0.5, 0.5,
0.1841336, -4.367875, -7.5492, 0, 1.5, 0.5, 0.5
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
-3.692039, 0.217801, -7.5492, 0, -0.5, 0.5, 0.5,
-3.692039, 0.217801, -7.5492, 1, -0.5, 0.5, 0.5,
-3.692039, 0.217801, -7.5492, 1, 1.5, 0.5, 0.5,
-3.692039, 0.217801, -7.5492, 0, 1.5, 0.5, 0.5
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
-3.692039, -4.367875, -0.2646611, 0, -0.5, 0.5, 0.5,
-3.692039, -4.367875, -0.2646611, 1, -0.5, 0.5, 0.5,
-3.692039, -4.367875, -0.2646611, 1, 1.5, 0.5, 0.5,
-3.692039, -4.367875, -0.2646611, 0, 1.5, 0.5, 0.5
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
-2, -3.309642, -5.868153,
3, -3.309642, -5.868153,
-2, -3.309642, -5.868153,
-2, -3.486014, -6.148327,
-1, -3.309642, -5.868153,
-1, -3.486014, -6.148327,
0, -3.309642, -5.868153,
0, -3.486014, -6.148327,
1, -3.309642, -5.868153,
1, -3.486014, -6.148327,
2, -3.309642, -5.868153,
2, -3.486014, -6.148327,
3, -3.309642, -5.868153,
3, -3.486014, -6.148327
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
-2, -3.838758, -6.708676, 0, -0.5, 0.5, 0.5,
-2, -3.838758, -6.708676, 1, -0.5, 0.5, 0.5,
-2, -3.838758, -6.708676, 1, 1.5, 0.5, 0.5,
-2, -3.838758, -6.708676, 0, 1.5, 0.5, 0.5,
-1, -3.838758, -6.708676, 0, -0.5, 0.5, 0.5,
-1, -3.838758, -6.708676, 1, -0.5, 0.5, 0.5,
-1, -3.838758, -6.708676, 1, 1.5, 0.5, 0.5,
-1, -3.838758, -6.708676, 0, 1.5, 0.5, 0.5,
0, -3.838758, -6.708676, 0, -0.5, 0.5, 0.5,
0, -3.838758, -6.708676, 1, -0.5, 0.5, 0.5,
0, -3.838758, -6.708676, 1, 1.5, 0.5, 0.5,
0, -3.838758, -6.708676, 0, 1.5, 0.5, 0.5,
1, -3.838758, -6.708676, 0, -0.5, 0.5, 0.5,
1, -3.838758, -6.708676, 1, -0.5, 0.5, 0.5,
1, -3.838758, -6.708676, 1, 1.5, 0.5, 0.5,
1, -3.838758, -6.708676, 0, 1.5, 0.5, 0.5,
2, -3.838758, -6.708676, 0, -0.5, 0.5, 0.5,
2, -3.838758, -6.708676, 1, -0.5, 0.5, 0.5,
2, -3.838758, -6.708676, 1, 1.5, 0.5, 0.5,
2, -3.838758, -6.708676, 0, 1.5, 0.5, 0.5,
3, -3.838758, -6.708676, 0, -0.5, 0.5, 0.5,
3, -3.838758, -6.708676, 1, -0.5, 0.5, 0.5,
3, -3.838758, -6.708676, 1, 1.5, 0.5, 0.5,
3, -3.838758, -6.708676, 0, 1.5, 0.5, 0.5
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
-2.797537, -3, -5.868153,
-2.797537, 3, -5.868153,
-2.797537, -3, -5.868153,
-2.946621, -3, -6.148327,
-2.797537, -2, -5.868153,
-2.946621, -2, -6.148327,
-2.797537, -1, -5.868153,
-2.946621, -1, -6.148327,
-2.797537, 0, -5.868153,
-2.946621, 0, -6.148327,
-2.797537, 1, -5.868153,
-2.946621, 1, -6.148327,
-2.797537, 2, -5.868153,
-2.946621, 2, -6.148327,
-2.797537, 3, -5.868153,
-2.946621, 3, -6.148327
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
-3.244788, -3, -6.708676, 0, -0.5, 0.5, 0.5,
-3.244788, -3, -6.708676, 1, -0.5, 0.5, 0.5,
-3.244788, -3, -6.708676, 1, 1.5, 0.5, 0.5,
-3.244788, -3, -6.708676, 0, 1.5, 0.5, 0.5,
-3.244788, -2, -6.708676, 0, -0.5, 0.5, 0.5,
-3.244788, -2, -6.708676, 1, -0.5, 0.5, 0.5,
-3.244788, -2, -6.708676, 1, 1.5, 0.5, 0.5,
-3.244788, -2, -6.708676, 0, 1.5, 0.5, 0.5,
-3.244788, -1, -6.708676, 0, -0.5, 0.5, 0.5,
-3.244788, -1, -6.708676, 1, -0.5, 0.5, 0.5,
-3.244788, -1, -6.708676, 1, 1.5, 0.5, 0.5,
-3.244788, -1, -6.708676, 0, 1.5, 0.5, 0.5,
-3.244788, 0, -6.708676, 0, -0.5, 0.5, 0.5,
-3.244788, 0, -6.708676, 1, -0.5, 0.5, 0.5,
-3.244788, 0, -6.708676, 1, 1.5, 0.5, 0.5,
-3.244788, 0, -6.708676, 0, 1.5, 0.5, 0.5,
-3.244788, 1, -6.708676, 0, -0.5, 0.5, 0.5,
-3.244788, 1, -6.708676, 1, -0.5, 0.5, 0.5,
-3.244788, 1, -6.708676, 1, 1.5, 0.5, 0.5,
-3.244788, 1, -6.708676, 0, 1.5, 0.5, 0.5,
-3.244788, 2, -6.708676, 0, -0.5, 0.5, 0.5,
-3.244788, 2, -6.708676, 1, -0.5, 0.5, 0.5,
-3.244788, 2, -6.708676, 1, 1.5, 0.5, 0.5,
-3.244788, 2, -6.708676, 0, 1.5, 0.5, 0.5,
-3.244788, 3, -6.708676, 0, -0.5, 0.5, 0.5,
-3.244788, 3, -6.708676, 1, -0.5, 0.5, 0.5,
-3.244788, 3, -6.708676, 1, 1.5, 0.5, 0.5,
-3.244788, 3, -6.708676, 0, 1.5, 0.5, 0.5
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
-2.797537, -3.309642, -4,
-2.797537, -3.309642, 4,
-2.797537, -3.309642, -4,
-2.946621, -3.486014, -4,
-2.797537, -3.309642, -2,
-2.946621, -3.486014, -2,
-2.797537, -3.309642, 0,
-2.946621, -3.486014, 0,
-2.797537, -3.309642, 2,
-2.946621, -3.486014, 2,
-2.797537, -3.309642, 4,
-2.946621, -3.486014, 4
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
-3.244788, -3.838758, -4, 0, -0.5, 0.5, 0.5,
-3.244788, -3.838758, -4, 1, -0.5, 0.5, 0.5,
-3.244788, -3.838758, -4, 1, 1.5, 0.5, 0.5,
-3.244788, -3.838758, -4, 0, 1.5, 0.5, 0.5,
-3.244788, -3.838758, -2, 0, -0.5, 0.5, 0.5,
-3.244788, -3.838758, -2, 1, -0.5, 0.5, 0.5,
-3.244788, -3.838758, -2, 1, 1.5, 0.5, 0.5,
-3.244788, -3.838758, -2, 0, 1.5, 0.5, 0.5,
-3.244788, -3.838758, 0, 0, -0.5, 0.5, 0.5,
-3.244788, -3.838758, 0, 1, -0.5, 0.5, 0.5,
-3.244788, -3.838758, 0, 1, 1.5, 0.5, 0.5,
-3.244788, -3.838758, 0, 0, 1.5, 0.5, 0.5,
-3.244788, -3.838758, 2, 0, -0.5, 0.5, 0.5,
-3.244788, -3.838758, 2, 1, -0.5, 0.5, 0.5,
-3.244788, -3.838758, 2, 1, 1.5, 0.5, 0.5,
-3.244788, -3.838758, 2, 0, 1.5, 0.5, 0.5,
-3.244788, -3.838758, 4, 0, -0.5, 0.5, 0.5,
-3.244788, -3.838758, 4, 1, -0.5, 0.5, 0.5,
-3.244788, -3.838758, 4, 1, 1.5, 0.5, 0.5,
-3.244788, -3.838758, 4, 0, 1.5, 0.5, 0.5
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
-2.797537, -3.309642, -5.868153,
-2.797537, 3.745244, -5.868153,
-2.797537, -3.309642, 5.33883,
-2.797537, 3.745244, 5.33883,
-2.797537, -3.309642, -5.868153,
-2.797537, -3.309642, 5.33883,
-2.797537, 3.745244, -5.868153,
-2.797537, 3.745244, 5.33883,
-2.797537, -3.309642, -5.868153,
3.165804, -3.309642, -5.868153,
-2.797537, -3.309642, 5.33883,
3.165804, -3.309642, 5.33883,
-2.797537, 3.745244, -5.868153,
3.165804, 3.745244, -5.868153,
-2.797537, 3.745244, 5.33883,
3.165804, 3.745244, 5.33883,
3.165804, -3.309642, -5.868153,
3.165804, 3.745244, -5.868153,
3.165804, -3.309642, 5.33883,
3.165804, 3.745244, 5.33883,
3.165804, -3.309642, -5.868153,
3.165804, -3.309642, 5.33883,
3.165804, 3.745244, -5.868153,
3.165804, 3.745244, 5.33883
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
var radius = 7.755217;
var distance = 34.50383;
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
mvMatrix.translate( -0.1841336, -0.217801, 0.2646611 );
mvMatrix.scale( 1.406106, 1.188551, 0.7482024 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.50383);
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
flazasulfuron<-read.table("flazasulfuron.xyz")
```

```
## Error in read.table("flazasulfuron.xyz"): no lines available in input
```

```r
x<-flazasulfuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'flazasulfuron' not found
```

```r
y<-flazasulfuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'flazasulfuron' not found
```

```r
z<-flazasulfuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'flazasulfuron' not found
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
-2.710692, 0.921735, -1.654497, 0, 0, 1, 1, 1,
-2.556092, -0.7490709, -1.023202, 1, 0, 0, 1, 1,
-2.554899, -1.374579, -3.802418, 1, 0, 0, 1, 1,
-2.548026, -1.402394, -3.731694, 1, 0, 0, 1, 1,
-2.521823, 0.4710701, -1.873628, 1, 0, 0, 1, 1,
-2.491025, -0.07169501, -1.562182, 1, 0, 0, 1, 1,
-2.471833, 0.1669876, -1.224609, 0, 0, 0, 1, 1,
-2.412152, 0.1792839, -1.821723, 0, 0, 0, 1, 1,
-2.337479, 0.5768157, -4.055484, 0, 0, 0, 1, 1,
-2.32453, 0.3167913, -2.009874, 0, 0, 0, 1, 1,
-2.279244, 0.5681272, -1.855093, 0, 0, 0, 1, 1,
-2.274163, -0.2088175, -1.150626, 0, 0, 0, 1, 1,
-2.271461, -0.03641528, -2.561797, 0, 0, 0, 1, 1,
-2.271259, -0.2597004, -1.660196, 1, 1, 1, 1, 1,
-2.265666, 0.7010916, -2.533329, 1, 1, 1, 1, 1,
-2.233346, -0.3951616, -0.6262026, 1, 1, 1, 1, 1,
-2.223114, -0.2779775, -1.215474, 1, 1, 1, 1, 1,
-2.20697, -0.9741915, -3.989934, 1, 1, 1, 1, 1,
-2.178128, -1.838178, -3.47419, 1, 1, 1, 1, 1,
-2.130063, 0.7926663, -0.4453734, 1, 1, 1, 1, 1,
-2.128581, -0.4279982, -2.705505, 1, 1, 1, 1, 1,
-2.127619, 1.159968, -0.07388855, 1, 1, 1, 1, 1,
-2.094426, -0.3310655, -1.472622, 1, 1, 1, 1, 1,
-2.091807, -0.9556589, -1.55194, 1, 1, 1, 1, 1,
-2.081926, 0.5149491, -1.850835, 1, 1, 1, 1, 1,
-2.073339, 0.002825807, -1.617405, 1, 1, 1, 1, 1,
-2.068331, 0.5104636, -2.650632, 1, 1, 1, 1, 1,
-2.049636, 0.9373245, -0.106589, 1, 1, 1, 1, 1,
-2.044035, 2.272745, -1.30249, 0, 0, 1, 1, 1,
-2.024963, 0.3062765, -1.456864, 1, 0, 0, 1, 1,
-1.993016, 1.302434, 0.3544144, 1, 0, 0, 1, 1,
-1.984493, 0.1886484, -0.3554296, 1, 0, 0, 1, 1,
-1.938256, -0.379183, -1.730137, 1, 0, 0, 1, 1,
-1.925781, -0.8705802, -0.419524, 1, 0, 0, 1, 1,
-1.915448, -0.07804906, -2.602725, 0, 0, 0, 1, 1,
-1.904337, 1.118151, 0.4399664, 0, 0, 0, 1, 1,
-1.901936, -0.353931, -3.678198, 0, 0, 0, 1, 1,
-1.897311, 0.8145407, -0.9955041, 0, 0, 0, 1, 1,
-1.843116, -0.9075757, -1.061731, 0, 0, 0, 1, 1,
-1.82838, 0.2758313, -2.363619, 0, 0, 0, 1, 1,
-1.827714, -1.200333, -0.8804117, 0, 0, 0, 1, 1,
-1.783478, -0.5416932, -1.039793, 1, 1, 1, 1, 1,
-1.77185, -0.8507311, -1.912528, 1, 1, 1, 1, 1,
-1.768427, -0.4973724, -1.858664, 1, 1, 1, 1, 1,
-1.765844, 0.7443175, -0.6246672, 1, 1, 1, 1, 1,
-1.762752, -1.417863, -1.761897, 1, 1, 1, 1, 1,
-1.747521, -0.782156, -1.965514, 1, 1, 1, 1, 1,
-1.741519, 0.0502884, -1.018727, 1, 1, 1, 1, 1,
-1.73208, -0.3964992, -1.064875, 1, 1, 1, 1, 1,
-1.710317, 0.1087163, -1.226276, 1, 1, 1, 1, 1,
-1.702695, -0.2130095, -3.705318, 1, 1, 1, 1, 1,
-1.697239, -0.006548428, -0.9269175, 1, 1, 1, 1, 1,
-1.693809, -0.00877417, 0.03566634, 1, 1, 1, 1, 1,
-1.685625, 0.8451858, 0.116276, 1, 1, 1, 1, 1,
-1.657073, -0.9668594, -3.134247, 1, 1, 1, 1, 1,
-1.644024, -0.499673, -3.518118, 1, 1, 1, 1, 1,
-1.640829, 1.341499, -1.604118, 0, 0, 1, 1, 1,
-1.638969, -0.3238732, -3.650497, 1, 0, 0, 1, 1,
-1.629663, -0.3034095, -0.6034282, 1, 0, 0, 1, 1,
-1.625857, 1.673562, 0.1275308, 1, 0, 0, 1, 1,
-1.594387, 0.9060326, -1.101115, 1, 0, 0, 1, 1,
-1.594049, 0.0601162, -0.9462163, 1, 0, 0, 1, 1,
-1.584796, -0.9848455, -3.073299, 0, 0, 0, 1, 1,
-1.576204, 1.070241, -0.375155, 0, 0, 0, 1, 1,
-1.562726, -0.764471, -2.442601, 0, 0, 0, 1, 1,
-1.561904, -1.339451, -2.235147, 0, 0, 0, 1, 1,
-1.554074, 0.1084369, -2.788177, 0, 0, 0, 1, 1,
-1.549151, -0.4902236, -2.317996, 0, 0, 0, 1, 1,
-1.539757, 1.038877, -2.113177, 0, 0, 0, 1, 1,
-1.536893, 0.6744252, 0.08799972, 1, 1, 1, 1, 1,
-1.513167, -0.9680523, -1.666759, 1, 1, 1, 1, 1,
-1.498677, -0.2293441, -0.5330154, 1, 1, 1, 1, 1,
-1.492518, 0.7249297, -1.711838, 1, 1, 1, 1, 1,
-1.486948, -0.535772, -3.327068, 1, 1, 1, 1, 1,
-1.483369, -2.22155, -1.794362, 1, 1, 1, 1, 1,
-1.479188, 0.1073027, -0.2590343, 1, 1, 1, 1, 1,
-1.460495, 0.9076706, -1.051988, 1, 1, 1, 1, 1,
-1.455083, 0.09300051, -0.4098112, 1, 1, 1, 1, 1,
-1.443007, -0.7306962, -2.387097, 1, 1, 1, 1, 1,
-1.441518, 0.2470984, 0.2446291, 1, 1, 1, 1, 1,
-1.427795, -0.1133596, -2.018845, 1, 1, 1, 1, 1,
-1.426867, -1.155937, -2.01857, 1, 1, 1, 1, 1,
-1.426563, -0.8477948, -2.678084, 1, 1, 1, 1, 1,
-1.408509, 1.203189, -1.353826, 1, 1, 1, 1, 1,
-1.405482, 0.4837579, -1.515974, 0, 0, 1, 1, 1,
-1.402277, 0.7924118, -1.16634, 1, 0, 0, 1, 1,
-1.399692, -0.7568365, -2.090491, 1, 0, 0, 1, 1,
-1.398313, 0.01693223, -2.78337, 1, 0, 0, 1, 1,
-1.395554, 0.03979098, -1.113691, 1, 0, 0, 1, 1,
-1.392498, -0.5011681, -1.459773, 1, 0, 0, 1, 1,
-1.390672, 0.1376466, -2.628464, 0, 0, 0, 1, 1,
-1.390485, -1.067162, -3.039004, 0, 0, 0, 1, 1,
-1.389812, -0.9048346, -2.006234, 0, 0, 0, 1, 1,
-1.384742, 2.11756, -1.201544, 0, 0, 0, 1, 1,
-1.382601, 1.25043, -1.725828, 0, 0, 0, 1, 1,
-1.379664, -0.2815599, -0.992569, 0, 0, 0, 1, 1,
-1.376907, 0.2392884, -0.6635835, 0, 0, 0, 1, 1,
-1.371245, 0.5041441, -0.5895568, 1, 1, 1, 1, 1,
-1.369856, 1.050894, -1.5465, 1, 1, 1, 1, 1,
-1.36579, -1.212126, -2.210648, 1, 1, 1, 1, 1,
-1.334186, -0.3055201, -1.757023, 1, 1, 1, 1, 1,
-1.333671, 0.7215657, -2.015877, 1, 1, 1, 1, 1,
-1.333631, -1.352793, -1.17608, 1, 1, 1, 1, 1,
-1.330615, 0.9710078, -2.381409, 1, 1, 1, 1, 1,
-1.3208, 1.052269, 0.5439184, 1, 1, 1, 1, 1,
-1.318652, -1.368052, -2.345022, 1, 1, 1, 1, 1,
-1.315322, 0.4296751, -1.593879, 1, 1, 1, 1, 1,
-1.314745, 1.028365, 0.05310619, 1, 1, 1, 1, 1,
-1.309286, 0.3246213, -2.676112, 1, 1, 1, 1, 1,
-1.308938, -0.332584, -3.880571, 1, 1, 1, 1, 1,
-1.299973, -0.7028804, -2.859821, 1, 1, 1, 1, 1,
-1.295722, -0.7772744, -0.02495799, 1, 1, 1, 1, 1,
-1.293748, 0.8160828, -1.195974, 0, 0, 1, 1, 1,
-1.293027, -0.9871186, -1.293135, 1, 0, 0, 1, 1,
-1.292001, 0.1145046, -1.37803, 1, 0, 0, 1, 1,
-1.289014, -0.1088176, -3.029999, 1, 0, 0, 1, 1,
-1.288006, 2.108545, 0.7596735, 1, 0, 0, 1, 1,
-1.285622, -0.5068312, -1.7796, 1, 0, 0, 1, 1,
-1.278609, -0.9186737, -2.277973, 0, 0, 0, 1, 1,
-1.263224, -0.1804231, -3.004374, 0, 0, 0, 1, 1,
-1.257219, -2.159566, -4.105023, 0, 0, 0, 1, 1,
-1.255947, -1.05992, -4.224943, 0, 0, 0, 1, 1,
-1.253711, -0.03512391, -3.370872, 0, 0, 0, 1, 1,
-1.250335, 0.5668638, -2.750571, 0, 0, 0, 1, 1,
-1.24517, -0.2477301, -2.764267, 0, 0, 0, 1, 1,
-1.244097, 0.3540854, -2.112823, 1, 1, 1, 1, 1,
-1.231825, 0.9128655, -1.61631, 1, 1, 1, 1, 1,
-1.228419, 0.9618593, -1.724819, 1, 1, 1, 1, 1,
-1.227486, 0.3632088, -1.245719, 1, 1, 1, 1, 1,
-1.223425, 1.787515, 0.004060785, 1, 1, 1, 1, 1,
-1.222657, 0.05535758, -1.449177, 1, 1, 1, 1, 1,
-1.218773, 0.8093926, -1.008986, 1, 1, 1, 1, 1,
-1.21241, -0.2584654, -3.711076, 1, 1, 1, 1, 1,
-1.208755, 2.867135, 1.389977, 1, 1, 1, 1, 1,
-1.183053, -0.110999, -0.8585755, 1, 1, 1, 1, 1,
-1.182084, -1.781705, -3.809543, 1, 1, 1, 1, 1,
-1.181789, -0.3204274, -2.36314, 1, 1, 1, 1, 1,
-1.178061, 1.520113, -1.510213, 1, 1, 1, 1, 1,
-1.172118, -1.306208, -3.213221, 1, 1, 1, 1, 1,
-1.167249, 0.0312843, -0.05042062, 1, 1, 1, 1, 1,
-1.162718, -0.6854458, -2.074307, 0, 0, 1, 1, 1,
-1.153974, 0.6127164, -0.7494826, 1, 0, 0, 1, 1,
-1.143884, 1.480035, -1.050747, 1, 0, 0, 1, 1,
-1.138064, -0.8968117, -1.028343, 1, 0, 0, 1, 1,
-1.135478, 1.470415, -2.236718, 1, 0, 0, 1, 1,
-1.135123, 1.634904, -2.220056, 1, 0, 0, 1, 1,
-1.126125, 0.3691174, -0.972876, 0, 0, 0, 1, 1,
-1.118046, -0.08610852, -2.459703, 0, 0, 0, 1, 1,
-1.116994, 0.6290337, -1.045579, 0, 0, 0, 1, 1,
-1.116923, -0.3815493, -1.026773, 0, 0, 0, 1, 1,
-1.116722, -0.5959758, -2.228064, 0, 0, 0, 1, 1,
-1.091229, 1.44604, 0.03028716, 0, 0, 0, 1, 1,
-1.086236, 1.016417, -0.155465, 0, 0, 0, 1, 1,
-1.080113, 0.6112255, -0.8496745, 1, 1, 1, 1, 1,
-1.077872, 1.109127, -1.406115, 1, 1, 1, 1, 1,
-1.075488, 1.549851, -1.127859, 1, 1, 1, 1, 1,
-1.075275, -1.175636, -0.9228887, 1, 1, 1, 1, 1,
-1.074397, -0.7541773, -2.262074, 1, 1, 1, 1, 1,
-1.064923, -0.6417524, -0.7908934, 1, 1, 1, 1, 1,
-1.063713, 0.08760216, -2.513869, 1, 1, 1, 1, 1,
-1.060949, 0.5980651, -1.308702, 1, 1, 1, 1, 1,
-1.054894, -1.09549, -1.051715, 1, 1, 1, 1, 1,
-1.053386, 0.7875884, -1.550972, 1, 1, 1, 1, 1,
-1.048006, -0.7246823, -2.29246, 1, 1, 1, 1, 1,
-1.046876, -1.159871, -3.212559, 1, 1, 1, 1, 1,
-1.043845, -0.714449, -2.254486, 1, 1, 1, 1, 1,
-1.043076, -1.740997, -0.6006798, 1, 1, 1, 1, 1,
-1.039898, 1.498895, 0.4259584, 1, 1, 1, 1, 1,
-1.039833, -1.274526, -1.130501, 0, 0, 1, 1, 1,
-1.038616, 0.6363703, -0.8167977, 1, 0, 0, 1, 1,
-1.030377, -0.2734812, -0.3135006, 1, 0, 0, 1, 1,
-1.025489, 0.6121594, -2.251902, 1, 0, 0, 1, 1,
-1.016584, -0.3737502, -0.9493586, 1, 0, 0, 1, 1,
-1.015393, -0.6099999, -1.92177, 1, 0, 0, 1, 1,
-1.012356, -0.7460673, -1.651944, 0, 0, 0, 1, 1,
-1.01208, 0.2430857, -1.992657, 0, 0, 0, 1, 1,
-1.007872, -0.08557915, 0.5634565, 0, 0, 0, 1, 1,
-1.007377, -1.142396, -2.948483, 0, 0, 0, 1, 1,
-1.00301, -1.962966, -4.135533, 0, 0, 0, 1, 1,
-1.00213, 1.21549, -0.2963454, 0, 0, 0, 1, 1,
-0.9878978, 1.532871, -0.1596941, 0, 0, 0, 1, 1,
-0.9857492, -0.4350186, -2.136112, 1, 1, 1, 1, 1,
-0.9838345, 0.4689477, -1.348503, 1, 1, 1, 1, 1,
-0.9827561, 0.5695132, -1.575946, 1, 1, 1, 1, 1,
-0.9774322, 2.00246, 0.3024088, 1, 1, 1, 1, 1,
-0.9724166, 0.3979557, -1.506754, 1, 1, 1, 1, 1,
-0.9679641, 1.112718, -1.390328, 1, 1, 1, 1, 1,
-0.9580297, 1.121667, -1.750402, 1, 1, 1, 1, 1,
-0.9560043, 2.749563, -0.7789184, 1, 1, 1, 1, 1,
-0.9446799, 1.737264, 0.4386141, 1, 1, 1, 1, 1,
-0.9347468, -1.072053, -1.798521, 1, 1, 1, 1, 1,
-0.929207, -1.761088, -4.817722, 1, 1, 1, 1, 1,
-0.9255919, -0.3448185, -2.090622, 1, 1, 1, 1, 1,
-0.9249576, 1.320022, -1.254512, 1, 1, 1, 1, 1,
-0.9244384, 0.359146, -0.5882078, 1, 1, 1, 1, 1,
-0.9212903, -0.2927089, -3.227037, 1, 1, 1, 1, 1,
-0.9205148, 0.2727996, -0.05693197, 0, 0, 1, 1, 1,
-0.9170455, 0.03625223, -2.350536, 1, 0, 0, 1, 1,
-0.9125978, 0.5480362, -0.1757237, 1, 0, 0, 1, 1,
-0.9117033, 0.5420799, -0.8127511, 1, 0, 0, 1, 1,
-0.9102057, -0.5114626, -1.185187, 1, 0, 0, 1, 1,
-0.9045148, 0.5071451, -2.381338, 1, 0, 0, 1, 1,
-0.8979244, -2.774085, -2.377046, 0, 0, 0, 1, 1,
-0.889289, -1.05145, -3.769299, 0, 0, 0, 1, 1,
-0.8777432, -0.3871034, -0.6840302, 0, 0, 0, 1, 1,
-0.8709601, -1.703389, -4.331386, 0, 0, 0, 1, 1,
-0.869957, -0.4609773, -1.113852, 0, 0, 0, 1, 1,
-0.8653942, -0.6587472, -3.266808, 0, 0, 0, 1, 1,
-0.8547032, 1.410859, 0.009604935, 0, 0, 0, 1, 1,
-0.8536919, -2.036932, -1.384136, 1, 1, 1, 1, 1,
-0.8502399, -1.514015, -2.246062, 1, 1, 1, 1, 1,
-0.8481981, 0.1182008, -1.958935, 1, 1, 1, 1, 1,
-0.8425774, 0.2397639, -1.598958, 1, 1, 1, 1, 1,
-0.8375595, 0.02054011, -0.665355, 1, 1, 1, 1, 1,
-0.828702, -0.3991931, -1.806923, 1, 1, 1, 1, 1,
-0.8254178, 0.8334303, -1.326855, 1, 1, 1, 1, 1,
-0.8222727, -0.1748376, -2.717103, 1, 1, 1, 1, 1,
-0.8196591, 0.3659689, -1.21511, 1, 1, 1, 1, 1,
-0.8125483, 0.4044171, -1.491866, 1, 1, 1, 1, 1,
-0.8113264, -1.772252, -2.338915, 1, 1, 1, 1, 1,
-0.8099602, 0.8411105, 0.6146519, 1, 1, 1, 1, 1,
-0.8080238, 2.996495, 0.4791734, 1, 1, 1, 1, 1,
-0.8065359, -2.07488, -2.714403, 1, 1, 1, 1, 1,
-0.7869352, -1.00585, -2.495496, 1, 1, 1, 1, 1,
-0.7865282, 0.4237627, 1.058155, 0, 0, 1, 1, 1,
-0.7838582, 0.7002746, -0.7071255, 1, 0, 0, 1, 1,
-0.7797324, 2.057643, 1.235031, 1, 0, 0, 1, 1,
-0.779488, -0.08006568, -3.415045, 1, 0, 0, 1, 1,
-0.7777135, -1.122932, -2.754097, 1, 0, 0, 1, 1,
-0.7754083, 0.3242542, 1.187548, 1, 0, 0, 1, 1,
-0.7709807, -0.4465688, -2.363909, 0, 0, 0, 1, 1,
-0.7709224, -0.4505737, -0.9013622, 0, 0, 0, 1, 1,
-0.7705262, -0.2736317, -1.639679, 0, 0, 0, 1, 1,
-0.770079, -0.8751935, -2.42324, 0, 0, 0, 1, 1,
-0.7650337, 0.8827255, -1.179837, 0, 0, 0, 1, 1,
-0.7503375, 0.4343123, -1.430164, 0, 0, 0, 1, 1,
-0.7456583, -0.03831641, -2.376955, 0, 0, 0, 1, 1,
-0.7426434, -0.5360928, -1.940329, 1, 1, 1, 1, 1,
-0.742329, -1.356371, -3.305705, 1, 1, 1, 1, 1,
-0.7360022, -0.442883, -0.6974659, 1, 1, 1, 1, 1,
-0.7281293, -0.4286191, 0.08338665, 1, 1, 1, 1, 1,
-0.7255981, -1.07185, -3.314649, 1, 1, 1, 1, 1,
-0.7237294, 0.4590907, -1.651491, 1, 1, 1, 1, 1,
-0.7226401, 0.2046158, -0.6101491, 1, 1, 1, 1, 1,
-0.7153144, 0.1361258, -1.513279, 1, 1, 1, 1, 1,
-0.7151862, -0.1193962, -1.784003, 1, 1, 1, 1, 1,
-0.7025281, 1.066351, -0.8410205, 1, 1, 1, 1, 1,
-0.7020845, -0.5917288, -2.806926, 1, 1, 1, 1, 1,
-0.7020779, -0.468861, -2.033762, 1, 1, 1, 1, 1,
-0.6968771, 0.7268656, -2.641483, 1, 1, 1, 1, 1,
-0.6962487, 0.2176762, -0.5295928, 1, 1, 1, 1, 1,
-0.6924505, 0.2309685, -1.994591, 1, 1, 1, 1, 1,
-0.6915511, -0.8402039, -3.479946, 0, 0, 1, 1, 1,
-0.6895206, -0.07366071, -0.05215604, 1, 0, 0, 1, 1,
-0.6876478, -0.4525188, -1.666188, 1, 0, 0, 1, 1,
-0.6800511, -1.486154, -3.666425, 1, 0, 0, 1, 1,
-0.679357, -0.8057445, -3.215804, 1, 0, 0, 1, 1,
-0.6779954, 0.4071458, -0.4460866, 1, 0, 0, 1, 1,
-0.6738863, 0.7205228, -0.7237828, 0, 0, 0, 1, 1,
-0.6723014, 2.096374, 0.1416597, 0, 0, 0, 1, 1,
-0.6718158, -1.378046, -2.87353, 0, 0, 0, 1, 1,
-0.6635749, -1.214281, -1.682291, 0, 0, 0, 1, 1,
-0.656186, -2.423665, -2.005297, 0, 0, 0, 1, 1,
-0.6498279, 0.1359902, -0.4303625, 0, 0, 0, 1, 1,
-0.6465139, -0.3218727, -2.337185, 0, 0, 0, 1, 1,
-0.6448828, 1.041888, -2.263212, 1, 1, 1, 1, 1,
-0.6445097, -1.11603, -0.8616589, 1, 1, 1, 1, 1,
-0.6378673, 1.129359, -0.08540727, 1, 1, 1, 1, 1,
-0.6370589, 1.693545, 0.01811612, 1, 1, 1, 1, 1,
-0.6366549, -0.04268374, -0.7333385, 1, 1, 1, 1, 1,
-0.6353325, 0.1829341, -1.992421, 1, 1, 1, 1, 1,
-0.6274154, -0.5661942, -2.554186, 1, 1, 1, 1, 1,
-0.6238757, -1.704954, -2.185069, 1, 1, 1, 1, 1,
-0.620495, -0.6157784, 0.6018816, 1, 1, 1, 1, 1,
-0.619265, 0.2624223, -0.3079196, 1, 1, 1, 1, 1,
-0.6113771, -0.7231401, -3.022155, 1, 1, 1, 1, 1,
-0.6108386, -0.4470652, -2.527814, 1, 1, 1, 1, 1,
-0.6083103, -0.1219954, -3.968139, 1, 1, 1, 1, 1,
-0.6055523, -0.3134815, -2.611325, 1, 1, 1, 1, 1,
-0.6053544, 0.2204129, -1.698229, 1, 1, 1, 1, 1,
-0.6047606, 2.040614, -0.6269069, 0, 0, 1, 1, 1,
-0.6024621, 1.237619, 1.045039, 1, 0, 0, 1, 1,
-0.5964121, 0.1927105, -0.7028399, 1, 0, 0, 1, 1,
-0.589621, 2.600537, 0.03316111, 1, 0, 0, 1, 1,
-0.5870214, 0.2231243, -0.9750645, 1, 0, 0, 1, 1,
-0.586637, -1.856383, -2.955138, 1, 0, 0, 1, 1,
-0.5861732, 0.1882041, -2.564016, 0, 0, 0, 1, 1,
-0.5769401, 0.9588296, -2.084549, 0, 0, 0, 1, 1,
-0.5724906, -0.6590472, -2.645898, 0, 0, 0, 1, 1,
-0.5721077, 0.4088575, -1.38514, 0, 0, 0, 1, 1,
-0.5716437, -0.027055, -1.749182, 0, 0, 0, 1, 1,
-0.5714055, -0.4236795, -1.832386, 0, 0, 0, 1, 1,
-0.5705492, -0.7295669, -0.6699765, 0, 0, 0, 1, 1,
-0.570008, 1.08462, -0.9717842, 1, 1, 1, 1, 1,
-0.5693477, -0.2475131, -1.62544, 1, 1, 1, 1, 1,
-0.5688888, 1.149473, -0.3823016, 1, 1, 1, 1, 1,
-0.564969, 0.1585658, 0.09180544, 1, 1, 1, 1, 1,
-0.5578766, -2.103, -3.169296, 1, 1, 1, 1, 1,
-0.5568823, 1.125161, -0.8337808, 1, 1, 1, 1, 1,
-0.5568321, -0.214545, -2.053387, 1, 1, 1, 1, 1,
-0.5530638, -1.920884, -1.836106, 1, 1, 1, 1, 1,
-0.5495507, -0.6909826, -2.673642, 1, 1, 1, 1, 1,
-0.5494691, 0.3998883, -1.104049, 1, 1, 1, 1, 1,
-0.5471576, 1.320954, -0.04235823, 1, 1, 1, 1, 1,
-0.5423058, 0.3947258, -2.23332, 1, 1, 1, 1, 1,
-0.5333872, 2.10951, 2.507451, 1, 1, 1, 1, 1,
-0.5297437, -0.888963, -3.395877, 1, 1, 1, 1, 1,
-0.5268664, -0.1580439, -1.136828, 1, 1, 1, 1, 1,
-0.5236083, -0.2565482, -0.8409284, 0, 0, 1, 1, 1,
-0.5217281, -1.656879, -3.611312, 1, 0, 0, 1, 1,
-0.5206981, -0.5350724, -2.411049, 1, 0, 0, 1, 1,
-0.519787, -0.7433333, -3.409051, 1, 0, 0, 1, 1,
-0.5164835, -0.8601366, -0.8340849, 1, 0, 0, 1, 1,
-0.5126972, -0.4903304, -1.767868, 1, 0, 0, 1, 1,
-0.5122678, 0.4243319, -2.192219, 0, 0, 0, 1, 1,
-0.510518, -0.1513498, -3.182182, 0, 0, 0, 1, 1,
-0.5089053, 0.3612047, 0.7643412, 0, 0, 0, 1, 1,
-0.5034236, -0.4533502, -2.749338, 0, 0, 0, 1, 1,
-0.5023665, -0.5653914, -0.4159236, 0, 0, 0, 1, 1,
-0.4971256, 1.029766, -2.504491, 0, 0, 0, 1, 1,
-0.4911154, 0.2854596, -0.03027903, 0, 0, 0, 1, 1,
-0.4904081, 0.7331895, 0.05020383, 1, 1, 1, 1, 1,
-0.4885585, 0.3197154, -0.8433855, 1, 1, 1, 1, 1,
-0.4876575, 0.8543324, 0.9072509, 1, 1, 1, 1, 1,
-0.4841295, -1.088534, -2.976118, 1, 1, 1, 1, 1,
-0.482213, -0.4273895, -2.251204, 1, 1, 1, 1, 1,
-0.4813601, -0.2125983, -3.4201, 1, 1, 1, 1, 1,
-0.4801065, 0.08811998, -0.9101793, 1, 1, 1, 1, 1,
-0.474972, 0.8804691, -0.6420854, 1, 1, 1, 1, 1,
-0.4696049, 0.9915033, -1.098782, 1, 1, 1, 1, 1,
-0.4690372, -1.339293, -2.021946, 1, 1, 1, 1, 1,
-0.4652912, 0.1778, -1.058349, 1, 1, 1, 1, 1,
-0.4605286, 0.2228091, -0.9069154, 1, 1, 1, 1, 1,
-0.456926, 0.8843524, -2.032275, 1, 1, 1, 1, 1,
-0.4527572, -0.98573, -2.093866, 1, 1, 1, 1, 1,
-0.4493856, -0.3268216, -2.291667, 1, 1, 1, 1, 1,
-0.4477343, -0.9753788, -4.698083, 0, 0, 1, 1, 1,
-0.4476731, -0.2387775, -2.126173, 1, 0, 0, 1, 1,
-0.4440354, 0.2361078, -1.496258, 1, 0, 0, 1, 1,
-0.4425683, -0.4668215, -2.710288, 1, 0, 0, 1, 1,
-0.4418962, -0.9291973, -3.866799, 1, 0, 0, 1, 1,
-0.4379496, -0.323355, -2.515048, 1, 0, 0, 1, 1,
-0.4318719, 0.6289596, -1.227205, 0, 0, 0, 1, 1,
-0.4310078, -0.9768634, -2.545789, 0, 0, 0, 1, 1,
-0.4263296, 0.3015664, 0.4259608, 0, 0, 0, 1, 1,
-0.4227786, 0.2106915, -1.766757, 0, 0, 0, 1, 1,
-0.4182236, -1.564358, -4.830917, 0, 0, 0, 1, 1,
-0.4174714, 0.4743233, -1.105827, 0, 0, 0, 1, 1,
-0.4123559, -0.4372993, -2.725134, 0, 0, 0, 1, 1,
-0.4095764, -1.440062, -3.707165, 1, 1, 1, 1, 1,
-0.406933, 0.8232068, -1.076786, 1, 1, 1, 1, 1,
-0.4039864, 0.3973943, -0.3007912, 1, 1, 1, 1, 1,
-0.4021331, -0.04506261, -3.248981, 1, 1, 1, 1, 1,
-0.3999818, -0.5761706, -3.070454, 1, 1, 1, 1, 1,
-0.3963736, -1.187209, -3.497402, 1, 1, 1, 1, 1,
-0.3950366, -1.082763, -3.925971, 1, 1, 1, 1, 1,
-0.3916053, 0.219211, -0.7868674, 1, 1, 1, 1, 1,
-0.3862475, 1.325676, 0.587436, 1, 1, 1, 1, 1,
-0.3859842, 0.8774487, 1.930787, 1, 1, 1, 1, 1,
-0.3832463, -0.9106054, -1.927696, 1, 1, 1, 1, 1,
-0.3805613, 0.1599072, -0.1129716, 1, 1, 1, 1, 1,
-0.374983, 0.0232562, -2.29839, 1, 1, 1, 1, 1,
-0.3699976, 0.496159, -0.6595138, 1, 1, 1, 1, 1,
-0.3694187, -1.55917, -5.170966, 1, 1, 1, 1, 1,
-0.368888, -0.7736269, -2.994053, 0, 0, 1, 1, 1,
-0.36694, 0.4679024, 0.1173999, 1, 0, 0, 1, 1,
-0.3658821, -1.913885, -3.110638, 1, 0, 0, 1, 1,
-0.3646536, 0.4777639, 0.2231447, 1, 0, 0, 1, 1,
-0.3628747, 0.5956048, -0.2906734, 1, 0, 0, 1, 1,
-0.3549926, 0.4867601, -1.262822, 1, 0, 0, 1, 1,
-0.3548626, 0.5340266, -0.4120504, 0, 0, 0, 1, 1,
-0.3538775, 0.1955498, -1.653571, 0, 0, 0, 1, 1,
-0.3531747, 0.9688125, 1.263199, 0, 0, 0, 1, 1,
-0.3530442, 0.2965796, -1.315361, 0, 0, 0, 1, 1,
-0.3519295, 0.7373616, -0.2129499, 0, 0, 0, 1, 1,
-0.3500147, -0.1297397, -3.01331, 0, 0, 0, 1, 1,
-0.3496532, -0.4295914, -3.529657, 0, 0, 0, 1, 1,
-0.3477966, 3.194209, 0.1394224, 1, 1, 1, 1, 1,
-0.3463367, 1.490431, -0.6416176, 1, 1, 1, 1, 1,
-0.3451413, -0.7023993, -2.680796, 1, 1, 1, 1, 1,
-0.3390467, -2.346082, -1.515342, 1, 1, 1, 1, 1,
-0.3337964, 0.3204868, -0.1545731, 1, 1, 1, 1, 1,
-0.3279278, -0.2163305, -1.475319, 1, 1, 1, 1, 1,
-0.3271974, 0.6171071, -0.3068123, 1, 1, 1, 1, 1,
-0.3250583, -0.1475298, -1.209363, 1, 1, 1, 1, 1,
-0.3242105, 0.8218506, -0.3339391, 1, 1, 1, 1, 1,
-0.3203323, -0.2081662, -3.594246, 1, 1, 1, 1, 1,
-0.3197721, 1.533256, 1.09594, 1, 1, 1, 1, 1,
-0.319289, -0.4875617, -2.501117, 1, 1, 1, 1, 1,
-0.3191924, 0.387071, -0.2815543, 1, 1, 1, 1, 1,
-0.303001, -1.736192, -4.079272, 1, 1, 1, 1, 1,
-0.2979584, 1.272658, 0.5011453, 1, 1, 1, 1, 1,
-0.2934208, 0.494105, -0.9445261, 0, 0, 1, 1, 1,
-0.2927241, -0.8188422, -2.971411, 1, 0, 0, 1, 1,
-0.2901666, 0.04922781, -0.5063343, 1, 0, 0, 1, 1,
-0.2880296, 0.6194621, -1.336714, 1, 0, 0, 1, 1,
-0.2861695, -1.791071, -3.424856, 1, 0, 0, 1, 1,
-0.281461, 0.9083821, -0.4271485, 1, 0, 0, 1, 1,
-0.2671825, 2.090952, -1.27011, 0, 0, 0, 1, 1,
-0.2655737, 0.7737553, -0.09933134, 0, 0, 0, 1, 1,
-0.260847, 0.147579, -0.05639496, 0, 0, 0, 1, 1,
-0.2589692, -0.0372942, -2.484407, 0, 0, 0, 1, 1,
-0.2582034, -0.3854139, -1.415348, 0, 0, 0, 1, 1,
-0.2545539, -0.1259599, -1.728213, 0, 0, 0, 1, 1,
-0.2519737, 0.7866284, 0.788859, 0, 0, 0, 1, 1,
-0.2485744, -1.305896, -2.366408, 1, 1, 1, 1, 1,
-0.2471422, -0.9818745, -1.920092, 1, 1, 1, 1, 1,
-0.2423511, 0.8735359, -1.565754, 1, 1, 1, 1, 1,
-0.2372852, -0.8475425, -2.768813, 1, 1, 1, 1, 1,
-0.2334191, 0.3958276, -1.61288, 1, 1, 1, 1, 1,
-0.2327579, 0.4149436, 0.221335, 1, 1, 1, 1, 1,
-0.232379, -0.7677079, -1.121835, 1, 1, 1, 1, 1,
-0.228298, 1.181606, -0.3314707, 1, 1, 1, 1, 1,
-0.2209994, 0.5186805, -0.2218888, 1, 1, 1, 1, 1,
-0.2153861, 0.1811108, 0.3265639, 1, 1, 1, 1, 1,
-0.2113702, 0.1115786, -0.8395256, 1, 1, 1, 1, 1,
-0.2109095, -1.042969, -3.712562, 1, 1, 1, 1, 1,
-0.200146, -0.7980009, -1.849405, 1, 1, 1, 1, 1,
-0.1940092, -1.383225, -2.991601, 1, 1, 1, 1, 1,
-0.1879062, 0.1338962, -0.195184, 1, 1, 1, 1, 1,
-0.1869634, -0.7016642, -3.497266, 0, 0, 1, 1, 1,
-0.1859281, 0.2621521, -2.061646, 1, 0, 0, 1, 1,
-0.1857505, -1.545753, -1.352955, 1, 0, 0, 1, 1,
-0.1838246, -0.2013543, -2.388273, 1, 0, 0, 1, 1,
-0.1833994, 2.119659, 1.674853, 1, 0, 0, 1, 1,
-0.1808515, -1.389519, -4.683553, 1, 0, 0, 1, 1,
-0.1776971, 1.568549, -1.791523, 0, 0, 0, 1, 1,
-0.1753788, -1.427262, -4.577974, 0, 0, 0, 1, 1,
-0.1639557, 0.7636602, -1.337334, 0, 0, 0, 1, 1,
-0.162485, -1.528781, -3.03729, 0, 0, 0, 1, 1,
-0.1616426, -1.290834, -3.647063, 0, 0, 0, 1, 1,
-0.161035, 0.3664578, -2.772682, 0, 0, 0, 1, 1,
-0.16028, -0.710431, -2.209323, 0, 0, 0, 1, 1,
-0.1588535, -0.8626922, -1.62427, 1, 1, 1, 1, 1,
-0.1571267, -0.6024635, -1.556596, 1, 1, 1, 1, 1,
-0.1566022, -0.4284654, -2.160839, 1, 1, 1, 1, 1,
-0.1529811, 0.3347986, -0.256894, 1, 1, 1, 1, 1,
-0.1487305, 1.399398, 1.624184, 1, 1, 1, 1, 1,
-0.1461951, -0.03781815, -2.328328, 1, 1, 1, 1, 1,
-0.1410785, -1.389541, -5.275075, 1, 1, 1, 1, 1,
-0.1386378, 0.3162946, -2.21789, 1, 1, 1, 1, 1,
-0.1335835, 0.7554072, -0.4238821, 1, 1, 1, 1, 1,
-0.1334812, -0.3451784, -2.993572, 1, 1, 1, 1, 1,
-0.1325511, 0.9960693, 1.379372, 1, 1, 1, 1, 1,
-0.1320065, -1.8436, -2.342228, 1, 1, 1, 1, 1,
-0.1223145, 0.9492638, -1.274716, 1, 1, 1, 1, 1,
-0.1166516, -1.360988, -2.611118, 1, 1, 1, 1, 1,
-0.1165503, -0.7054105, -2.747339, 1, 1, 1, 1, 1,
-0.1161741, 1.364634, -0.2583961, 0, 0, 1, 1, 1,
-0.1123457, -0.007953166, -2.122866, 1, 0, 0, 1, 1,
-0.1090956, 0.4132918, 0.9412411, 1, 0, 0, 1, 1,
-0.1066464, -0.3206142, -2.465235, 1, 0, 0, 1, 1,
-0.1058025, 0.1381246, 1.083851, 1, 0, 0, 1, 1,
-0.09794574, -1.91102, -2.373714, 1, 0, 0, 1, 1,
-0.08770126, -0.4523841, -2.254187, 0, 0, 0, 1, 1,
-0.08759354, -0.3044627, -3.07231, 0, 0, 0, 1, 1,
-0.08186663, -0.4738995, -4.096726, 0, 0, 0, 1, 1,
-0.08122841, -0.1295169, -1.360699, 0, 0, 0, 1, 1,
-0.077197, 0.5738876, 0.5286187, 0, 0, 0, 1, 1,
-0.07414921, 0.08952895, -0.08736636, 0, 0, 0, 1, 1,
-0.07408303, -3.206901, -3.445558, 0, 0, 0, 1, 1,
-0.07339106, -0.8101866, -2.218809, 1, 1, 1, 1, 1,
-0.07235833, -1.050342, -2.598989, 1, 1, 1, 1, 1,
-0.07210993, -0.9219683, -3.489254, 1, 1, 1, 1, 1,
-0.06741536, 0.6424027, -0.4793851, 1, 1, 1, 1, 1,
-0.06610546, -0.4230114, -1.344534, 1, 1, 1, 1, 1,
-0.06403948, 0.8155465, -0.4670285, 1, 1, 1, 1, 1,
-0.06260168, 0.03797958, -2.141155, 1, 1, 1, 1, 1,
-0.05121918, -0.3309551, -5.704944, 1, 1, 1, 1, 1,
-0.0471854, 1.731863, -0.3728766, 1, 1, 1, 1, 1,
-0.04602326, 0.2980326, 0.4836709, 1, 1, 1, 1, 1,
-0.04330624, 0.5339816, -2.078812, 1, 1, 1, 1, 1,
-0.04156134, 0.5531186, -0.48397, 1, 1, 1, 1, 1,
-0.03950917, 2.920642, -3.025271, 1, 1, 1, 1, 1,
-0.03711816, 0.9875211, 0.338661, 1, 1, 1, 1, 1,
-0.03578955, -0.02611423, -1.282291, 1, 1, 1, 1, 1,
-0.03328118, -1.580024, -5.137578, 0, 0, 1, 1, 1,
-0.03234212, -0.882728, -2.285389, 1, 0, 0, 1, 1,
-0.03137659, 0.6740199, 0.3199319, 1, 0, 0, 1, 1,
-0.02481222, -0.1818849, -0.9897466, 1, 0, 0, 1, 1,
-0.02413061, 0.3212765, -0.4344714, 1, 0, 0, 1, 1,
-0.02337801, 1.625993, 1.010577, 1, 0, 0, 1, 1,
-0.02114501, 0.7557892, 0.7452417, 0, 0, 0, 1, 1,
-0.01929014, 0.3971692, -2.467568, 0, 0, 0, 1, 1,
-0.01749479, 2.448353, 1.607335, 0, 0, 0, 1, 1,
-0.01147217, 0.6263266, -1.390018, 0, 0, 0, 1, 1,
-0.009010646, -1.100749, -1.912496, 0, 0, 0, 1, 1,
-0.006780671, -1.39792, -2.809115, 0, 0, 0, 1, 1,
-0.002130496, -0.8142868, -3.823834, 0, 0, 0, 1, 1,
0.0008952098, -1.570765, 1.675609, 1, 1, 1, 1, 1,
0.005700345, -0.5375192, 3.504808, 1, 1, 1, 1, 1,
0.006465965, -1.359695, 4.638682, 1, 1, 1, 1, 1,
0.01063599, -0.3566721, 3.67398, 1, 1, 1, 1, 1,
0.01250684, 0.9183525, -0.9023074, 1, 1, 1, 1, 1,
0.01695344, -1.197063, 1.446275, 1, 1, 1, 1, 1,
0.01832447, -1.788577, 2.102817, 1, 1, 1, 1, 1,
0.02119662, -0.5622911, 2.914458, 1, 1, 1, 1, 1,
0.02327185, 1.305248, -0.06286435, 1, 1, 1, 1, 1,
0.02505921, -0.1342155, 4.025196, 1, 1, 1, 1, 1,
0.02623551, 2.146826, -0.1664895, 1, 1, 1, 1, 1,
0.02664801, -0.8894964, 3.042675, 1, 1, 1, 1, 1,
0.0284391, -0.8781124, 4.472706, 1, 1, 1, 1, 1,
0.02987526, -0.6713937, 4.198193, 1, 1, 1, 1, 1,
0.03042527, 0.5456033, 0.5151168, 1, 1, 1, 1, 1,
0.03102922, 1.900534, -1.022628, 0, 0, 1, 1, 1,
0.03364552, 0.6856338, -0.2321702, 1, 0, 0, 1, 1,
0.0345146, 0.4609954, -2.091674, 1, 0, 0, 1, 1,
0.03541048, -0.1991005, 2.322889, 1, 0, 0, 1, 1,
0.03831542, 0.05287948, 0.3859044, 1, 0, 0, 1, 1,
0.04166523, 1.116493, 0.9699337, 1, 0, 0, 1, 1,
0.05073578, 0.01643374, 0.2107904, 0, 0, 0, 1, 1,
0.05135906, 0.2719208, 0.906378, 0, 0, 0, 1, 1,
0.05624636, -1.633588, 2.960502, 0, 0, 0, 1, 1,
0.05760174, 1.096171, 1.016363, 0, 0, 0, 1, 1,
0.05969207, 1.684593, 0.3602006, 0, 0, 0, 1, 1,
0.06381121, 0.8283254, -0.5986932, 0, 0, 0, 1, 1,
0.06506918, -0.8071287, 2.907267, 0, 0, 0, 1, 1,
0.06534572, 0.388662, -0.2355205, 1, 1, 1, 1, 1,
0.06624407, 0.5358202, -0.2921513, 1, 1, 1, 1, 1,
0.06905277, -1.110626, 1.773707, 1, 1, 1, 1, 1,
0.06982471, 2.106623, -0.2497996, 1, 1, 1, 1, 1,
0.0721615, -0.9100605, 2.209357, 1, 1, 1, 1, 1,
0.07351098, -0.2646909, 2.387596, 1, 1, 1, 1, 1,
0.07482442, -0.7512732, 2.878555, 1, 1, 1, 1, 1,
0.08094601, 1.653399, 1.456686, 1, 1, 1, 1, 1,
0.08469381, -0.9907936, 3.383382, 1, 1, 1, 1, 1,
0.08661914, -0.8082713, 4.761056, 1, 1, 1, 1, 1,
0.08875269, -1.583519, 3.634328, 1, 1, 1, 1, 1,
0.08897758, 2.415145, -1.138621, 1, 1, 1, 1, 1,
0.0890011, -0.8148859, 4.66998, 1, 1, 1, 1, 1,
0.09399782, -0.6390319, 2.289355, 1, 1, 1, 1, 1,
0.09417214, 0.2768413, 1.062667, 1, 1, 1, 1, 1,
0.09784321, 1.68408, -0.1345022, 0, 0, 1, 1, 1,
0.09860339, 0.1528084, -0.1659231, 1, 0, 0, 1, 1,
0.09865534, 0.9393349, 0.7128944, 1, 0, 0, 1, 1,
0.09914905, 0.2452614, -0.6528793, 1, 0, 0, 1, 1,
0.09916337, 0.02183201, 2.063668, 1, 0, 0, 1, 1,
0.1080973, 0.5128983, -0.523779, 1, 0, 0, 1, 1,
0.1085391, -2.2674, 5.074697, 0, 0, 0, 1, 1,
0.1165685, 0.5046915, -0.6142101, 0, 0, 0, 1, 1,
0.1187423, -1.821759, 2.552804, 0, 0, 0, 1, 1,
0.1269216, 0.2269532, 0.3172956, 0, 0, 0, 1, 1,
0.1292195, 1.891732, -0.8761631, 0, 0, 0, 1, 1,
0.1310158, 0.9887956, -1.487097, 0, 0, 0, 1, 1,
0.135873, 0.3467377, -0.4231491, 0, 0, 0, 1, 1,
0.1410574, 0.3737063, -0.08306003, 1, 1, 1, 1, 1,
0.1438225, 0.2167435, 1.555836, 1, 1, 1, 1, 1,
0.1439105, -0.3198158, 1.174767, 1, 1, 1, 1, 1,
0.1439108, 0.496199, -0.9215471, 1, 1, 1, 1, 1,
0.1463524, 0.4389217, 3.690425, 1, 1, 1, 1, 1,
0.1482592, 0.06373134, 2.312562, 1, 1, 1, 1, 1,
0.152526, 2.320518, 0.2886868, 1, 1, 1, 1, 1,
0.1528815, -0.6448103, 3.838907, 1, 1, 1, 1, 1,
0.1553161, 0.08822937, 0.6591959, 1, 1, 1, 1, 1,
0.1628851, -1.069082, 2.162642, 1, 1, 1, 1, 1,
0.1632347, -1.279402, 3.453898, 1, 1, 1, 1, 1,
0.1636645, -0.9422147, 3.603954, 1, 1, 1, 1, 1,
0.1667411, 1.27561, -1.940683, 1, 1, 1, 1, 1,
0.1668127, -2.368197, 1.282702, 1, 1, 1, 1, 1,
0.170573, 2.032187, -0.2496006, 1, 1, 1, 1, 1,
0.1712953, 1.120237, -0.5103172, 0, 0, 1, 1, 1,
0.1723869, -0.7553248, 3.316861, 1, 0, 0, 1, 1,
0.1724182, -0.3684038, 2.345017, 1, 0, 0, 1, 1,
0.1727815, -0.2486296, 3.271647, 1, 0, 0, 1, 1,
0.1753693, 0.5144732, 0.3482651, 1, 0, 0, 1, 1,
0.1791097, -0.0320518, 1.362137, 1, 0, 0, 1, 1,
0.1808676, 0.3594964, 1.76666, 0, 0, 0, 1, 1,
0.1848133, 0.5290686, 0.09342618, 0, 0, 0, 1, 1,
0.1858747, -0.6192176, 2.790827, 0, 0, 0, 1, 1,
0.1906674, 0.7058777, -1.535846, 0, 0, 0, 1, 1,
0.1910176, -0.82795, 4.069417, 0, 0, 0, 1, 1,
0.1913184, 0.4083744, -0.1279645, 0, 0, 0, 1, 1,
0.1929419, 0.5333969, -0.8755155, 0, 0, 0, 1, 1,
0.1956084, 1.248574, 0.6620265, 1, 1, 1, 1, 1,
0.200564, 1.443178, 0.3911147, 1, 1, 1, 1, 1,
0.2059587, 0.2090418, 2.187461, 1, 1, 1, 1, 1,
0.2079485, 0.6073893, 1.183733, 1, 1, 1, 1, 1,
0.2101921, 1.074895, 0.5804287, 1, 1, 1, 1, 1,
0.2104185, -0.3587747, 2.308755, 1, 1, 1, 1, 1,
0.2119781, 0.5553027, 0.4909147, 1, 1, 1, 1, 1,
0.2123697, -1.737496, 3.399287, 1, 1, 1, 1, 1,
0.2214222, 0.6169001, 1.827641, 1, 1, 1, 1, 1,
0.2247648, 0.9148094, -0.0988633, 1, 1, 1, 1, 1,
0.2248572, 1.11085, 1.742374, 1, 1, 1, 1, 1,
0.226981, -0.2295709, 2.354661, 1, 1, 1, 1, 1,
0.2293634, -1.26895, 4.190837, 1, 1, 1, 1, 1,
0.2330425, 1.285636, -0.7579884, 1, 1, 1, 1, 1,
0.2350589, 2.442141, 0.005050107, 1, 1, 1, 1, 1,
0.2368513, 0.5006758, 0.1619288, 0, 0, 1, 1, 1,
0.239317, 0.7773114, -1.45055, 1, 0, 0, 1, 1,
0.2402347, -0.7341327, 3.137927, 1, 0, 0, 1, 1,
0.2429501, -1.210384, 3.893522, 1, 0, 0, 1, 1,
0.2455021, -0.9119797, 2.262582, 1, 0, 0, 1, 1,
0.2456807, -0.3278304, 2.329605, 1, 0, 0, 1, 1,
0.2524275, 0.4647376, 0.3916159, 0, 0, 0, 1, 1,
0.2568841, -1.703629, 2.823225, 0, 0, 0, 1, 1,
0.260521, -0.0816605, 0.7418136, 0, 0, 0, 1, 1,
0.2605992, -1.465323, 4.226421, 0, 0, 0, 1, 1,
0.2627434, 0.6870773, 0.3463075, 0, 0, 0, 1, 1,
0.2681334, 0.3124463, 0.5522351, 0, 0, 0, 1, 1,
0.2711042, -1.064259, 3.84759, 0, 0, 0, 1, 1,
0.2714351, 1.102508, -1.159879, 1, 1, 1, 1, 1,
0.2746789, -0.04403013, 1.741783, 1, 1, 1, 1, 1,
0.2747453, 0.1782429, 3.696515, 1, 1, 1, 1, 1,
0.2761954, 0.6266555, 0.753541, 1, 1, 1, 1, 1,
0.2802858, -1.432469, 2.674207, 1, 1, 1, 1, 1,
0.2805004, 0.9554462, -0.5058265, 1, 1, 1, 1, 1,
0.2884493, -0.3146709, 1.66507, 1, 1, 1, 1, 1,
0.2925043, 0.1294087, 1.48053, 1, 1, 1, 1, 1,
0.2940009, -0.1250775, 1.724454, 1, 1, 1, 1, 1,
0.2947988, -0.8981094, 3.583125, 1, 1, 1, 1, 1,
0.303128, 1.210483, 1.790156, 1, 1, 1, 1, 1,
0.3032037, -0.2906327, 3.586648, 1, 1, 1, 1, 1,
0.3040408, 0.06962029, -1.026555, 1, 1, 1, 1, 1,
0.3087339, 1.263454, 1.011145, 1, 1, 1, 1, 1,
0.3094079, 1.828844, -1.672733, 1, 1, 1, 1, 1,
0.3099651, 0.8500592, 0.2519978, 0, 0, 1, 1, 1,
0.3103415, 0.3946233, 2.048394, 1, 0, 0, 1, 1,
0.3111283, 1.755655, 2.249727, 1, 0, 0, 1, 1,
0.3115559, -0.9743788, 3.002232, 1, 0, 0, 1, 1,
0.313514, 1.06971, -0.9715179, 1, 0, 0, 1, 1,
0.313987, 1.345513, 0.2130026, 1, 0, 0, 1, 1,
0.3320494, 0.0956891, 1.056385, 0, 0, 0, 1, 1,
0.3376939, -0.8889536, 1.164661, 0, 0, 0, 1, 1,
0.3431951, -0.7172943, 4.360782, 0, 0, 0, 1, 1,
0.346104, 0.5992528, -1.883324, 0, 0, 0, 1, 1,
0.3475168, -0.397273, 1.778839, 0, 0, 0, 1, 1,
0.350143, 0.5736369, 1.59782, 0, 0, 0, 1, 1,
0.3511932, -0.5345148, 2.257094, 0, 0, 0, 1, 1,
0.3514234, 2.137663, -1.102133, 1, 1, 1, 1, 1,
0.3516488, -0.9744701, 3.698066, 1, 1, 1, 1, 1,
0.3532819, -1.943838, 3.50116, 1, 1, 1, 1, 1,
0.35811, -1.449301, 2.573098, 1, 1, 1, 1, 1,
0.3596255, -1.183667, 2.557544, 1, 1, 1, 1, 1,
0.3622403, -0.1337323, 1.297797, 1, 1, 1, 1, 1,
0.3670418, -0.006119023, 3.468063, 1, 1, 1, 1, 1,
0.3673582, 0.2269099, 0.7218412, 1, 1, 1, 1, 1,
0.3742297, 0.4447709, 1.200778, 1, 1, 1, 1, 1,
0.376964, 0.5675449, 2.029393, 1, 1, 1, 1, 1,
0.3781, -1.394479, 3.170402, 1, 1, 1, 1, 1,
0.3894542, 1.905719, 0.5274875, 1, 1, 1, 1, 1,
0.3916582, 0.9136994, 0.02913955, 1, 1, 1, 1, 1,
0.3928141, 0.745507, 0.2202017, 1, 1, 1, 1, 1,
0.3980882, 1.158378, -1.023863, 1, 1, 1, 1, 1,
0.3988382, 1.358398, 0.8733516, 0, 0, 1, 1, 1,
0.4007672, 1.018776, -0.3353152, 1, 0, 0, 1, 1,
0.4025658, 1.251583, 0.5912185, 1, 0, 0, 1, 1,
0.4054552, 0.4553771, 0.4903508, 1, 0, 0, 1, 1,
0.4059039, 2.115693, -0.4501, 1, 0, 0, 1, 1,
0.4232412, -0.6601619, 1.877427, 1, 0, 0, 1, 1,
0.4259904, 0.8217739, 1.137771, 0, 0, 0, 1, 1,
0.4276335, 0.06428615, 1.509826, 0, 0, 0, 1, 1,
0.4292176, -0.08109544, 2.030463, 0, 0, 0, 1, 1,
0.4325106, -0.4926689, 2.3716, 0, 0, 0, 1, 1,
0.4336743, 1.365689, 1.32481, 0, 0, 0, 1, 1,
0.4343668, -0.4652404, 2.417964, 0, 0, 0, 1, 1,
0.4433213, 0.6474284, 1.264831, 0, 0, 0, 1, 1,
0.4490724, 0.4719426, 0.3529648, 1, 1, 1, 1, 1,
0.450239, 0.638244, -0.8610437, 1, 1, 1, 1, 1,
0.4506988, -0.08660688, 2.152485, 1, 1, 1, 1, 1,
0.4541742, -1.267039, 1.605048, 1, 1, 1, 1, 1,
0.454361, -0.2519886, 2.11375, 1, 1, 1, 1, 1,
0.4549688, 0.2581992, 0.4631799, 1, 1, 1, 1, 1,
0.455087, 0.2516524, 0.110586, 1, 1, 1, 1, 1,
0.4566815, -1.477885, 1.421577, 1, 1, 1, 1, 1,
0.4579008, -0.3879883, 2.864045, 1, 1, 1, 1, 1,
0.4613301, -1.565131, 0.4755119, 1, 1, 1, 1, 1,
0.467203, -0.5586028, 0.6555628, 1, 1, 1, 1, 1,
0.4689644, -0.6053507, 0.9795412, 1, 1, 1, 1, 1,
0.473871, -0.9966849, 2.78566, 1, 1, 1, 1, 1,
0.474135, -0.0433444, 4.02657, 1, 1, 1, 1, 1,
0.4782192, 0.07954573, 1.193648, 1, 1, 1, 1, 1,
0.4795387, 1.074773, 1.920696, 0, 0, 1, 1, 1,
0.4816611, 0.7150256, 0.7828103, 1, 0, 0, 1, 1,
0.4822914, 1.607067, 0.3656445, 1, 0, 0, 1, 1,
0.482998, 1.197582, 0.6434409, 1, 0, 0, 1, 1,
0.4869004, -0.3828617, 1.967899, 1, 0, 0, 1, 1,
0.4876004, 0.436678, 0.8017337, 1, 0, 0, 1, 1,
0.4876449, -1.834314, 2.056861, 0, 0, 0, 1, 1,
0.488159, -1.145559, 2.107219, 0, 0, 0, 1, 1,
0.4889892, 0.8368292, 1.870172, 0, 0, 0, 1, 1,
0.4947644, 1.21779, 0.16963, 0, 0, 0, 1, 1,
0.5003248, -2.496522, 3.750232, 0, 0, 0, 1, 1,
0.50116, 1.060434, -0.577315, 0, 0, 0, 1, 1,
0.5039665, -0.3565075, 1.904758, 0, 0, 0, 1, 1,
0.5040779, 0.2058287, 1.764643, 1, 1, 1, 1, 1,
0.5064829, 0.2357887, 1.617724, 1, 1, 1, 1, 1,
0.5074863, -0.3271534, 1.913855, 1, 1, 1, 1, 1,
0.5093054, -0.1269873, 3.067559, 1, 1, 1, 1, 1,
0.5148791, 2.25282, -0.7860744, 1, 1, 1, 1, 1,
0.5151475, 0.3150387, 0.8994414, 1, 1, 1, 1, 1,
0.5155694, -1.180401, 3.518396, 1, 1, 1, 1, 1,
0.516266, 0.1553905, -0.9932576, 1, 1, 1, 1, 1,
0.5173377, 0.3803305, 2.530214, 1, 1, 1, 1, 1,
0.5181885, -1.203955, 4.841261, 1, 1, 1, 1, 1,
0.5195883, 0.06334217, 1.723632, 1, 1, 1, 1, 1,
0.5197901, -0.5192957, 3.745126, 1, 1, 1, 1, 1,
0.5207264, -0.4843764, 2.625991, 1, 1, 1, 1, 1,
0.5229298, -1.170407, 4.20912, 1, 1, 1, 1, 1,
0.5319273, 0.5998229, 1.229649, 1, 1, 1, 1, 1,
0.5341288, -1.316944, 1.82146, 0, 0, 1, 1, 1,
0.5373235, -1.224931, 4.057551, 1, 0, 0, 1, 1,
0.5407376, 0.4477122, 1.189111, 1, 0, 0, 1, 1,
0.5419849, 1.176023, 0.2551925, 1, 0, 0, 1, 1,
0.544242, -0.1360486, 1.419892, 1, 0, 0, 1, 1,
0.5528403, -0.7969381, 3.35889, 1, 0, 0, 1, 1,
0.5610107, 1.528568, 0.8426402, 0, 0, 0, 1, 1,
0.5645252, -1.181125, 3.806233, 0, 0, 0, 1, 1,
0.5710298, -2.709104, 1.839163, 0, 0, 0, 1, 1,
0.5711217, -0.7679182, 5.175622, 0, 0, 0, 1, 1,
0.5734827, -0.6765761, 2.854326, 0, 0, 0, 1, 1,
0.5808007, 1.346241, 1.394268, 0, 0, 0, 1, 1,
0.5810961, 0.8498292, 1.367386, 0, 0, 0, 1, 1,
0.5841845, -0.5688602, 1.251591, 1, 1, 1, 1, 1,
0.5848142, 1.651336, 0.592071, 1, 1, 1, 1, 1,
0.5880215, -0.9750497, 0.8044041, 1, 1, 1, 1, 1,
0.588257, -0.3670969, 2.473589, 1, 1, 1, 1, 1,
0.5950421, -0.2720938, 3.883773, 1, 1, 1, 1, 1,
0.6021228, 1.253543, 1.442084, 1, 1, 1, 1, 1,
0.6024295, -0.5166587, 3.767088, 1, 1, 1, 1, 1,
0.6051933, 1.584225, 2.802716, 1, 1, 1, 1, 1,
0.6053947, 1.244322, 0.5022211, 1, 1, 1, 1, 1,
0.6134064, 0.6148353, 0.9304093, 1, 1, 1, 1, 1,
0.6140392, 2.053724, -1.039619, 1, 1, 1, 1, 1,
0.615407, 0.8660231, 0.7797649, 1, 1, 1, 1, 1,
0.6156209, 0.1645979, 2.374315, 1, 1, 1, 1, 1,
0.6156334, -0.3665349, 3.328393, 1, 1, 1, 1, 1,
0.6265894, -1.797737, 1.825286, 1, 1, 1, 1, 1,
0.6268719, 1.049708, -1.204847, 0, 0, 1, 1, 1,
0.6272738, -0.5714824, 4.401491, 1, 0, 0, 1, 1,
0.632654, -1.590182, 3.254968, 1, 0, 0, 1, 1,
0.6363082, -0.633289, 2.964274, 1, 0, 0, 1, 1,
0.6387349, -0.6256771, 2.60908, 1, 0, 0, 1, 1,
0.6417924, -0.7518124, 0.5418661, 1, 0, 0, 1, 1,
0.6429045, -0.1601949, 2.59619, 0, 0, 0, 1, 1,
0.6676708, 1.194957, -0.72896, 0, 0, 0, 1, 1,
0.6698377, 0.930533, 1.18234, 0, 0, 0, 1, 1,
0.6703993, 2.330119, 0.6982412, 0, 0, 0, 1, 1,
0.6707987, 0.1506097, 1.806424, 0, 0, 0, 1, 1,
0.6712744, -0.659651, 1.765592, 0, 0, 0, 1, 1,
0.6724606, 1.271389, 1.739877, 0, 0, 0, 1, 1,
0.6724653, 0.5014819, 1.236851, 1, 1, 1, 1, 1,
0.673008, 0.1657872, 1.996158, 1, 1, 1, 1, 1,
0.6744502, -2.095959, 1.988543, 1, 1, 1, 1, 1,
0.6761067, -0.5069962, 2.013821, 1, 1, 1, 1, 1,
0.6768359, -0.2174333, 0.9530576, 1, 1, 1, 1, 1,
0.6792145, 0.005800859, 1.753012, 1, 1, 1, 1, 1,
0.6798097, -0.1025996, 0.8125753, 1, 1, 1, 1, 1,
0.6800076, 3.642503, -0.1569719, 1, 1, 1, 1, 1,
0.6842464, -0.4608182, 2.414779, 1, 1, 1, 1, 1,
0.6843019, -1.560858, 3.250319, 1, 1, 1, 1, 1,
0.6855073, 1.820473, 0.2746545, 1, 1, 1, 1, 1,
0.6903798, -0.6372623, 2.112521, 1, 1, 1, 1, 1,
0.6906727, 0.7830809, 0.6221944, 1, 1, 1, 1, 1,
0.6913978, -0.4658594, 1.675548, 1, 1, 1, 1, 1,
0.6928686, -0.1695303, 2.801342, 1, 1, 1, 1, 1,
0.6946044, 0.6987147, 1.037276, 0, 0, 1, 1, 1,
0.6948001, -1.22877, 2.502193, 1, 0, 0, 1, 1,
0.6966192, 0.106852, 0.688826, 1, 0, 0, 1, 1,
0.6970496, 1.700635, -0.7446429, 1, 0, 0, 1, 1,
0.6981839, -1.5848, 3.316109, 1, 0, 0, 1, 1,
0.6992791, 0.01353005, 1.015537, 1, 0, 0, 1, 1,
0.7011614, 0.6399816, 0.7767357, 0, 0, 0, 1, 1,
0.7027941, -0.2363027, 1.411654, 0, 0, 0, 1, 1,
0.7055734, 1.497282, -0.5332678, 0, 0, 0, 1, 1,
0.7068862, 1.192129, -1.226307, 0, 0, 0, 1, 1,
0.7082679, -1.747826, 1.950374, 0, 0, 0, 1, 1,
0.7124785, -0.7978553, 2.429057, 0, 0, 0, 1, 1,
0.7231123, 1.567889, -0.8552203, 0, 0, 0, 1, 1,
0.724454, 0.5604849, 0.9795518, 1, 1, 1, 1, 1,
0.7297859, -0.757644, 3.018739, 1, 1, 1, 1, 1,
0.7317451, 0.1407111, 3.125065, 1, 1, 1, 1, 1,
0.7382317, 1.733498, 2.742762, 1, 1, 1, 1, 1,
0.7422242, -0.524311, 2.847857, 1, 1, 1, 1, 1,
0.7437931, -0.1600448, 2.892977, 1, 1, 1, 1, 1,
0.7455078, -0.1529768, 1.71925, 1, 1, 1, 1, 1,
0.7470091, 0.3667792, -0.1436915, 1, 1, 1, 1, 1,
0.748245, -0.721352, 2.0236, 1, 1, 1, 1, 1,
0.7484431, 1.08527, 2.450111, 1, 1, 1, 1, 1,
0.7485597, 0.8345929, -1.001845, 1, 1, 1, 1, 1,
0.7513104, 0.6715508, 3.123112, 1, 1, 1, 1, 1,
0.7607798, -0.4023747, 4.545905, 1, 1, 1, 1, 1,
0.7629198, -0.4282847, 0.7968905, 1, 1, 1, 1, 1,
0.7673877, 1.12843, 0.2477313, 1, 1, 1, 1, 1,
0.7677894, -0.4276898, 4.362714, 0, 0, 1, 1, 1,
0.7679821, 0.4664, 2.058317, 1, 0, 0, 1, 1,
0.7685559, 0.399017, 1.958035, 1, 0, 0, 1, 1,
0.7778589, -1.123109, 2.379208, 1, 0, 0, 1, 1,
0.7947761, 1.014537, 0.2913134, 1, 0, 0, 1, 1,
0.7962723, 0.1812167, 0.896076, 1, 0, 0, 1, 1,
0.7988148, 0.3567144, -0.2144813, 0, 0, 0, 1, 1,
0.809122, -2.044473, 3.53883, 0, 0, 0, 1, 1,
0.8117648, 0.5006219, 0.7518961, 0, 0, 0, 1, 1,
0.8142281, 1.194169, -0.4341462, 0, 0, 0, 1, 1,
0.8155398, 0.9941598, 3.456538, 0, 0, 0, 1, 1,
0.8167386, -0.02058964, 1.811877, 0, 0, 0, 1, 1,
0.8189406, -1.401125, 3.604699, 0, 0, 0, 1, 1,
0.8261318, -0.5715832, 1.483879, 1, 1, 1, 1, 1,
0.841841, -0.4355389, 2.769313, 1, 1, 1, 1, 1,
0.8418802, 0.8870561, 0.4186936, 1, 1, 1, 1, 1,
0.8453074, -0.2816264, 1.67328, 1, 1, 1, 1, 1,
0.8458903, -1.269156, 2.131599, 1, 1, 1, 1, 1,
0.8476574, 0.2568717, 0.1078373, 1, 1, 1, 1, 1,
0.8492881, 0.1785654, 2.093586, 1, 1, 1, 1, 1,
0.8628895, 0.6621326, 1.197346, 1, 1, 1, 1, 1,
0.8700355, -0.3003477, 2.662017, 1, 1, 1, 1, 1,
0.8725291, -0.4506099, 2.440776, 1, 1, 1, 1, 1,
0.8727274, 1.019468, 0.7124964, 1, 1, 1, 1, 1,
0.8748422, 1.206504, -1.547822, 1, 1, 1, 1, 1,
0.8868103, 0.00788825, 1.313897, 1, 1, 1, 1, 1,
0.8870757, 0.5226716, 1.04908, 1, 1, 1, 1, 1,
0.88989, 0.2532555, 1.713395, 1, 1, 1, 1, 1,
0.8939908, 2.117127, 0.8899525, 0, 0, 1, 1, 1,
0.8949779, 0.7363936, -0.5105903, 1, 0, 0, 1, 1,
0.8957443, -1.725862, 1.401591, 1, 0, 0, 1, 1,
0.8981937, 0.2413355, 1.431093, 1, 0, 0, 1, 1,
0.9011388, 0.929099, 0.1877617, 1, 0, 0, 1, 1,
0.9072452, 0.05591087, 0.8716404, 1, 0, 0, 1, 1,
0.9102185, -1.339576, 1.934773, 0, 0, 0, 1, 1,
0.9120876, -2.067014, 2.705961, 0, 0, 0, 1, 1,
0.9150496, 0.8165744, 2.18119, 0, 0, 0, 1, 1,
0.9175164, -0.3214207, 3.28073, 0, 0, 0, 1, 1,
0.9194766, -0.1441627, 0.06904063, 0, 0, 0, 1, 1,
0.9197473, -0.3681935, 2.290425, 0, 0, 0, 1, 1,
0.9234961, 0.3388839, -0.07736261, 0, 0, 0, 1, 1,
0.9239554, -1.301084, 2.070447, 1, 1, 1, 1, 1,
0.9242393, 0.7827332, -1.59175, 1, 1, 1, 1, 1,
0.9369169, -0.2470875, 1.387425, 1, 1, 1, 1, 1,
0.9454983, 0.4401658, 0.7258505, 1, 1, 1, 1, 1,
0.9628989, 1.503854, -0.1705535, 1, 1, 1, 1, 1,
0.9643323, 0.1009925, 1.40566, 1, 1, 1, 1, 1,
0.9657909, 0.974676, -0.6657555, 1, 1, 1, 1, 1,
0.9726524, 2.159438, -0.7916101, 1, 1, 1, 1, 1,
0.9738172, -1.059023, -0.2364188, 1, 1, 1, 1, 1,
0.9743939, 1.79419, 1.022858, 1, 1, 1, 1, 1,
0.97938, -0.3349389, -0.1125557, 1, 1, 1, 1, 1,
0.9800095, 1.340878, -0.7365125, 1, 1, 1, 1, 1,
0.9829631, 0.05285626, 2.722303, 1, 1, 1, 1, 1,
0.9841509, 0.9587297, 0.3966743, 1, 1, 1, 1, 1,
0.9854725, 0.6649395, -0.5960102, 1, 1, 1, 1, 1,
0.9910425, -0.6962696, 2.781413, 0, 0, 1, 1, 1,
0.9952828, 1.088414, 1.188415, 1, 0, 0, 1, 1,
0.9968768, -0.5726367, 2.460352, 1, 0, 0, 1, 1,
1.001763, -0.4400048, 1.618292, 1, 0, 0, 1, 1,
1.002449, 0.6177772, 2.610473, 1, 0, 0, 1, 1,
1.005547, 0.8699602, 0.5071238, 1, 0, 0, 1, 1,
1.009274, -0.5023774, 3.760033, 0, 0, 0, 1, 1,
1.013413, 0.2619435, 2.939698, 0, 0, 0, 1, 1,
1.014248, -1.526771, 2.881773, 0, 0, 0, 1, 1,
1.018893, -0.9487806, 3.091394, 0, 0, 0, 1, 1,
1.02328, -0.1053074, 0.9652051, 0, 0, 0, 1, 1,
1.024226, 0.5275005, 2.51907, 0, 0, 0, 1, 1,
1.028487, -1.173463, 2.12085, 0, 0, 0, 1, 1,
1.029967, 0.2988329, -0.1888343, 1, 1, 1, 1, 1,
1.031909, 0.6212842, 1.446558, 1, 1, 1, 1, 1,
1.034459, -1.057989, 4.213041, 1, 1, 1, 1, 1,
1.051997, -1.736458, 5.040497, 1, 1, 1, 1, 1,
1.060622, -0.1989496, 0.9681334, 1, 1, 1, 1, 1,
1.065899, -1.445291, 2.493499, 1, 1, 1, 1, 1,
1.068455, 1.281194, -1.585503, 1, 1, 1, 1, 1,
1.068652, -0.5840321, 1.235948, 1, 1, 1, 1, 1,
1.068847, -1.059855, 3.888567, 1, 1, 1, 1, 1,
1.071495, -1.414692, 2.62149, 1, 1, 1, 1, 1,
1.074341, 1.039028, 1.275114, 1, 1, 1, 1, 1,
1.078736, 0.2303075, 1.483277, 1, 1, 1, 1, 1,
1.079002, 1.480544, 2.167083, 1, 1, 1, 1, 1,
1.083888, 0.02948497, -0.4213699, 1, 1, 1, 1, 1,
1.085399, 1.121329, -0.472268, 1, 1, 1, 1, 1,
1.086694, -1.272654, 3.299586, 0, 0, 1, 1, 1,
1.086737, -2.081553, 2.075253, 1, 0, 0, 1, 1,
1.08981, -1.000528, 3.571533, 1, 0, 0, 1, 1,
1.109833, 1.130151, -0.6111821, 1, 0, 0, 1, 1,
1.110582, 0.6752607, 0.8550301, 1, 0, 0, 1, 1,
1.112061, -0.02252908, 1.792057, 1, 0, 0, 1, 1,
1.116281, -0.1813475, 2.316401, 0, 0, 0, 1, 1,
1.124292, 0.8466535, -0.2720733, 0, 0, 0, 1, 1,
1.126736, 0.3387869, 1.228444, 0, 0, 0, 1, 1,
1.127639, 0.7047488, 1.697661, 0, 0, 0, 1, 1,
1.134275, -0.3646272, 1.180828, 0, 0, 0, 1, 1,
1.134863, 0.3749735, -0.1966574, 0, 0, 0, 1, 1,
1.137189, 0.2482735, 2.68386, 0, 0, 0, 1, 1,
1.139542, -0.6183041, 3.155565, 1, 1, 1, 1, 1,
1.146241, 1.396029, 2.108831, 1, 1, 1, 1, 1,
1.14765, -0.8520089, 1.550771, 1, 1, 1, 1, 1,
1.147746, 0.208865, 0.5424504, 1, 1, 1, 1, 1,
1.151056, -0.936345, 1.100559, 1, 1, 1, 1, 1,
1.153394, -0.4167765, 3.105124, 1, 1, 1, 1, 1,
1.155487, 0.7048796, 1.649546, 1, 1, 1, 1, 1,
1.155834, -0.1534138, 2.011627, 1, 1, 1, 1, 1,
1.161595, -0.2654442, 1.313724, 1, 1, 1, 1, 1,
1.176766, 1.16639, 1.507288, 1, 1, 1, 1, 1,
1.184139, 1.803811, 0.9732359, 1, 1, 1, 1, 1,
1.187545, 0.005716663, 1.810606, 1, 1, 1, 1, 1,
1.189788, -1.286036, 2.555389, 1, 1, 1, 1, 1,
1.203213, -0.1450272, 1.713014, 1, 1, 1, 1, 1,
1.208643, -0.4096701, -0.9200296, 1, 1, 1, 1, 1,
1.214402, -1.340897, 2.616208, 0, 0, 1, 1, 1,
1.217148, 0.8495175, 1.957568, 1, 0, 0, 1, 1,
1.221298, -1.7831, 3.273851, 1, 0, 0, 1, 1,
1.225873, 0.195016, 2.639381, 1, 0, 0, 1, 1,
1.243827, -1.138736, 1.820468, 1, 0, 0, 1, 1,
1.245913, 2.471483, -0.2920769, 1, 0, 0, 1, 1,
1.255706, -0.5237842, 0.8015275, 0, 0, 0, 1, 1,
1.267822, -0.8763356, 2.177844, 0, 0, 0, 1, 1,
1.285942, -1.982546, 2.221336, 0, 0, 0, 1, 1,
1.293973, 0.05708718, 2.065295, 0, 0, 0, 1, 1,
1.298176, -0.8001515, 3.892049, 0, 0, 0, 1, 1,
1.300762, -1.225088, 1.124396, 0, 0, 0, 1, 1,
1.307767, -0.04823365, 2.270142, 0, 0, 0, 1, 1,
1.310196, -0.479257, 0.6428486, 1, 1, 1, 1, 1,
1.334047, 1.25012, 0.2433016, 1, 1, 1, 1, 1,
1.334792, 1.404408, 0.382348, 1, 1, 1, 1, 1,
1.335871, -2.280363, 1.779825, 1, 1, 1, 1, 1,
1.348903, 1.246587, 1.913809, 1, 1, 1, 1, 1,
1.352048, 0.6045483, 2.092231, 1, 1, 1, 1, 1,
1.385083, 0.613947, 1.318608, 1, 1, 1, 1, 1,
1.390034, 0.7760384, 1.621954, 1, 1, 1, 1, 1,
1.398188, 0.6545736, 2.637472, 1, 1, 1, 1, 1,
1.400309, 0.3014013, 0.2720684, 1, 1, 1, 1, 1,
1.406469, -0.03647518, 2.671768, 1, 1, 1, 1, 1,
1.413888, -0.2260137, 1.633637, 1, 1, 1, 1, 1,
1.430641, -1.5369, 2.779008, 1, 1, 1, 1, 1,
1.435453, -0.4906299, 2.046272, 1, 1, 1, 1, 1,
1.450196, -0.5384124, 2.304247, 1, 1, 1, 1, 1,
1.459261, -0.5882619, 1.485062, 0, 0, 1, 1, 1,
1.459869, -0.4442488, 1.439802, 1, 0, 0, 1, 1,
1.464591, -0.6479656, 1.815376, 1, 0, 0, 1, 1,
1.468606, 1.634302, -0.08553179, 1, 0, 0, 1, 1,
1.473956, -0.846495, 3.139833, 1, 0, 0, 1, 1,
1.474582, 1.318861, 0.8551411, 1, 0, 0, 1, 1,
1.502018, 0.5352123, 1.015547, 0, 0, 0, 1, 1,
1.506185, 1.520038, 0.5166882, 0, 0, 0, 1, 1,
1.508956, 0.7871557, 1.45331, 0, 0, 0, 1, 1,
1.526086, 1.942127, -0.1918081, 0, 0, 0, 1, 1,
1.535734, 0.9573498, 1.912484, 0, 0, 0, 1, 1,
1.540854, 0.8408388, 1.896794, 0, 0, 0, 1, 1,
1.546826, -1.071714, 2.396451, 0, 0, 0, 1, 1,
1.563365, -0.5852599, 1.258383, 1, 1, 1, 1, 1,
1.580752, 0.9641799, 1.334474, 1, 1, 1, 1, 1,
1.582248, 0.6727923, 0.7439187, 1, 1, 1, 1, 1,
1.602527, 0.08231791, 3.226008, 1, 1, 1, 1, 1,
1.605985, -2.398235, 4.047952, 1, 1, 1, 1, 1,
1.607064, -0.1146132, 1.275932, 1, 1, 1, 1, 1,
1.618827, 1.094578, 0.5084116, 1, 1, 1, 1, 1,
1.630682, -0.3866116, 1.334401, 1, 1, 1, 1, 1,
1.642823, -0.6183141, 2.444852, 1, 1, 1, 1, 1,
1.645074, -2.437032, 2.130664, 1, 1, 1, 1, 1,
1.645463, 0.5987733, 2.351646, 1, 1, 1, 1, 1,
1.651346, -0.9227753, 2.675339, 1, 1, 1, 1, 1,
1.660166, -0.1996569, 1.547567, 1, 1, 1, 1, 1,
1.66997, -0.05979018, 1.971031, 1, 1, 1, 1, 1,
1.688796, 0.997005, -0.1677586, 1, 1, 1, 1, 1,
1.692365, 0.822536, 0.3345065, 0, 0, 1, 1, 1,
1.698593, -0.4065313, 1.747843, 1, 0, 0, 1, 1,
1.709426, 0.007803636, 2.595669, 1, 0, 0, 1, 1,
1.751257, -0.5271797, 3.135707, 1, 0, 0, 1, 1,
1.755121, 0.6297632, 0.5309396, 1, 0, 0, 1, 1,
1.757155, -1.521872, 1.852699, 1, 0, 0, 1, 1,
1.760248, 1.12832, -0.4263893, 0, 0, 0, 1, 1,
1.764288, -0.1103788, 3.52998, 0, 0, 0, 1, 1,
1.765026, 0.2026834, 2.596502, 0, 0, 0, 1, 1,
1.799811, -1.381038, 3.367767, 0, 0, 0, 1, 1,
1.808459, -0.6425386, 1.149953, 0, 0, 0, 1, 1,
1.811867, 0.6640156, 2.237739, 0, 0, 0, 1, 1,
1.816179, -0.9845855, 3.13695, 0, 0, 0, 1, 1,
1.82182, -1.327907, 3.849959, 1, 1, 1, 1, 1,
1.843998, 0.6017668, 0.8569642, 1, 1, 1, 1, 1,
1.85132, -0.2920897, 1.738467, 1, 1, 1, 1, 1,
1.877828, 1.061731, -0.04051419, 1, 1, 1, 1, 1,
1.87886, -0.2166985, 1.933082, 1, 1, 1, 1, 1,
1.890676, -0.7215478, 2.511012, 1, 1, 1, 1, 1,
1.910836, -1.475479, 3.851618, 1, 1, 1, 1, 1,
1.941681, -1.01191, 1.864478, 1, 1, 1, 1, 1,
1.948161, 0.9236494, 1.556111, 1, 1, 1, 1, 1,
1.956923, -0.6117002, 3.207932, 1, 1, 1, 1, 1,
1.966594, -0.5883477, 0.3411643, 1, 1, 1, 1, 1,
1.993023, -0.06761707, 0.3933016, 1, 1, 1, 1, 1,
2.084954, -1.412162, 3.068204, 1, 1, 1, 1, 1,
2.101445, -0.9513345, 2.503517, 1, 1, 1, 1, 1,
2.124273, 0.4967206, -0.04976846, 1, 1, 1, 1, 1,
2.124525, 1.300978, 0.521843, 0, 0, 1, 1, 1,
2.136543, 2.142181, 1.301555, 1, 0, 0, 1, 1,
2.136736, 0.2988547, 2.09971, 1, 0, 0, 1, 1,
2.144859, 0.1045821, 1.877352, 1, 0, 0, 1, 1,
2.186161, 0.7566608, 0.571694, 1, 0, 0, 1, 1,
2.202427, -0.2609531, 0.914434, 1, 0, 0, 1, 1,
2.269842, 0.3021816, 1.578212, 0, 0, 0, 1, 1,
2.283127, -0.04232797, 1.643302, 0, 0, 0, 1, 1,
2.36847, -0.1072607, 1.113882, 0, 0, 0, 1, 1,
2.413761, 0.2067633, 1.090113, 0, 0, 0, 1, 1,
2.480433, 1.122419, 1.434019, 0, 0, 0, 1, 1,
2.528631, 0.1912084, 0.3164543, 0, 0, 0, 1, 1,
2.532819, -0.4456435, 2.060207, 0, 0, 0, 1, 1,
2.562268, -0.2335744, 2.252274, 1, 1, 1, 1, 1,
2.626972, 0.3669353, 2.589925, 1, 1, 1, 1, 1,
2.666627, 2.454894, 0.8401397, 1, 1, 1, 1, 1,
2.753717, -1.567602, 2.356225, 1, 1, 1, 1, 1,
2.856193, -0.05132951, 2.325232, 1, 1, 1, 1, 1,
2.856774, -1.268651, 1.753814, 1, 1, 1, 1, 1,
3.07896, 0.3255084, 1.712373, 1, 1, 1, 1, 1
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
var radius = 9.603756;
var distance = 33.73278;
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
mvMatrix.translate( -0.1841335, -0.2178011, 0.2646611 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.73278);
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
