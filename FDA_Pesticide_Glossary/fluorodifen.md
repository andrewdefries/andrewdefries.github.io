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
-3.090423, 1.361555, -1.523088, 1, 0, 0, 1,
-2.791266, 0.6213997, -0.7625173, 1, 0.007843138, 0, 1,
-2.768856, -0.3715608, -3.053641, 1, 0.01176471, 0, 1,
-2.685913, -0.4995064, -0.6652718, 1, 0.01960784, 0, 1,
-2.604618, -0.8421366, -3.140317, 1, 0.02352941, 0, 1,
-2.533978, 0.2522405, -1.26962, 1, 0.03137255, 0, 1,
-2.491932, 0.1835993, -1.437136, 1, 0.03529412, 0, 1,
-2.433863, -1.163459, -3.11187, 1, 0.04313726, 0, 1,
-2.414291, 0.07251854, -1.058719, 1, 0.04705882, 0, 1,
-2.36938, -0.1598083, -3.068702, 1, 0.05490196, 0, 1,
-2.325495, -1.381224, -2.07118, 1, 0.05882353, 0, 1,
-2.293126, -0.09910329, -0.788523, 1, 0.06666667, 0, 1,
-2.268116, 0.1491075, 0.101676, 1, 0.07058824, 0, 1,
-2.261246, 1.219202, -0.05437899, 1, 0.07843138, 0, 1,
-2.225173, -0.6434435, -2.333038, 1, 0.08235294, 0, 1,
-2.191787, -0.5253741, -2.373151, 1, 0.09019608, 0, 1,
-2.186768, 0.316255, -3.25503, 1, 0.09411765, 0, 1,
-2.173916, -0.0009412417, -2.279111, 1, 0.1019608, 0, 1,
-2.170837, -0.225097, -1.78507, 1, 0.1098039, 0, 1,
-2.160362, -0.1255544, -1.361949, 1, 0.1137255, 0, 1,
-2.149103, -1.717621, -1.813445, 1, 0.1215686, 0, 1,
-2.120874, -0.7599762, -2.582082, 1, 0.1254902, 0, 1,
-2.120626, 1.535953, 0.5992305, 1, 0.1333333, 0, 1,
-2.088669, 1.162579, -3.057289, 1, 0.1372549, 0, 1,
-2.086518, -0.004104658, -2.417513, 1, 0.145098, 0, 1,
-2.059056, -0.6257108, -1.7195, 1, 0.1490196, 0, 1,
-2.053994, 0.106474, -3.575854, 1, 0.1568628, 0, 1,
-2.042448, 0.2938541, -0.7992275, 1, 0.1607843, 0, 1,
-2.029541, 1.049091, -1.094367, 1, 0.1686275, 0, 1,
-2.018933, 1.499778, -0.5608068, 1, 0.172549, 0, 1,
-2.009928, -0.2806432, -0.5354428, 1, 0.1803922, 0, 1,
-1.949281, 1.959242, 0.6278566, 1, 0.1843137, 0, 1,
-1.94095, -1.79355, -2.040945, 1, 0.1921569, 0, 1,
-1.940752, -0.6947635, -1.594312, 1, 0.1960784, 0, 1,
-1.938753, -0.5234649, -0.001633623, 1, 0.2039216, 0, 1,
-1.935995, -1.624708, -1.83398, 1, 0.2117647, 0, 1,
-1.923823, -1.566245, -0.4833567, 1, 0.2156863, 0, 1,
-1.919145, -0.7698, -1.940727, 1, 0.2235294, 0, 1,
-1.910843, 0.426994, -1.472136, 1, 0.227451, 0, 1,
-1.905736, 0.922594, -0.5500328, 1, 0.2352941, 0, 1,
-1.889605, 0.7979857, -0.217442, 1, 0.2392157, 0, 1,
-1.877892, -0.2997919, 0.476807, 1, 0.2470588, 0, 1,
-1.87033, 1.135243, -1.180535, 1, 0.2509804, 0, 1,
-1.865171, -0.8139411, -1.802449, 1, 0.2588235, 0, 1,
-1.848209, -0.6377434, -0.6333731, 1, 0.2627451, 0, 1,
-1.806255, 0.6223422, -2.22278, 1, 0.2705882, 0, 1,
-1.796487, -1.139212, -1.765687, 1, 0.2745098, 0, 1,
-1.793218, -0.3340701, 0.4293673, 1, 0.282353, 0, 1,
-1.787139, -1.941421, -2.371034, 1, 0.2862745, 0, 1,
-1.767073, 1.289409, 0.3794657, 1, 0.2941177, 0, 1,
-1.766216, 0.8974226, 1.43775, 1, 0.3019608, 0, 1,
-1.748439, 1.239454, -0.243177, 1, 0.3058824, 0, 1,
-1.745054, -0.192226, -3.105073, 1, 0.3137255, 0, 1,
-1.74441, 0.5107388, -1.033362, 1, 0.3176471, 0, 1,
-1.721163, 0.2053248, -2.686044, 1, 0.3254902, 0, 1,
-1.718515, 1.213606, -0.1889186, 1, 0.3294118, 0, 1,
-1.710536, 1.265153, -2.299098, 1, 0.3372549, 0, 1,
-1.710497, -2.237548, -2.400634, 1, 0.3411765, 0, 1,
-1.703931, -0.03833165, -2.124622, 1, 0.3490196, 0, 1,
-1.698534, -0.3595978, -1.406658, 1, 0.3529412, 0, 1,
-1.657486, 0.7975324, -0.9715422, 1, 0.3607843, 0, 1,
-1.654446, -0.666044, -3.215967, 1, 0.3647059, 0, 1,
-1.647026, 0.6194786, -0.08476295, 1, 0.372549, 0, 1,
-1.636698, 0.8291761, -1.633485, 1, 0.3764706, 0, 1,
-1.627994, 0.7616049, -1.405, 1, 0.3843137, 0, 1,
-1.61024, 0.6419453, -0.2777909, 1, 0.3882353, 0, 1,
-1.609602, 0.7194133, -0.1639351, 1, 0.3960784, 0, 1,
-1.583397, 0.03681117, -1.323131, 1, 0.4039216, 0, 1,
-1.572403, -0.2406326, -2.521717, 1, 0.4078431, 0, 1,
-1.562636, 0.4769495, -0.3734767, 1, 0.4156863, 0, 1,
-1.54299, -0.6555872, -2.02312, 1, 0.4196078, 0, 1,
-1.540655, -0.7275946, -1.298166, 1, 0.427451, 0, 1,
-1.540467, -0.06879794, -3.402643, 1, 0.4313726, 0, 1,
-1.539537, -2.135447, -3.130494, 1, 0.4392157, 0, 1,
-1.512315, 1.04078, -1.010552, 1, 0.4431373, 0, 1,
-1.50377, -0.8255693, -2.306463, 1, 0.4509804, 0, 1,
-1.471995, 0.6383935, -1.103906, 1, 0.454902, 0, 1,
-1.469188, 0.01543213, -1.509801, 1, 0.4627451, 0, 1,
-1.456973, 0.6592792, -0.941318, 1, 0.4666667, 0, 1,
-1.455778, 0.6241241, -1.896236, 1, 0.4745098, 0, 1,
-1.455176, -0.3771341, -2.359337, 1, 0.4784314, 0, 1,
-1.449614, -0.648929, -3.55967, 1, 0.4862745, 0, 1,
-1.447065, -1.336678, -1.892692, 1, 0.4901961, 0, 1,
-1.440901, -0.5098826, -0.7079608, 1, 0.4980392, 0, 1,
-1.437406, -0.4284541, -2.526397, 1, 0.5058824, 0, 1,
-1.428017, -0.237088, -2.289743, 1, 0.509804, 0, 1,
-1.400607, 0.4441453, -1.823602, 1, 0.5176471, 0, 1,
-1.399576, 1.168071, 0.6960565, 1, 0.5215687, 0, 1,
-1.390835, -0.08045656, -1.426514, 1, 0.5294118, 0, 1,
-1.378605, -1.3193, -2.880112, 1, 0.5333334, 0, 1,
-1.361639, -0.8346256, -2.267504, 1, 0.5411765, 0, 1,
-1.351597, 0.1525649, -1.99296, 1, 0.5450981, 0, 1,
-1.345928, -0.3806081, 0.1894713, 1, 0.5529412, 0, 1,
-1.345702, 0.4530583, -1.435259, 1, 0.5568628, 0, 1,
-1.345112, 0.5370958, 0.8556821, 1, 0.5647059, 0, 1,
-1.341404, -0.6117347, -2.962132, 1, 0.5686275, 0, 1,
-1.339942, 0.1997741, 0.1110694, 1, 0.5764706, 0, 1,
-1.339715, -0.6702209, -1.956446, 1, 0.5803922, 0, 1,
-1.337827, -0.7751937, -2.218594, 1, 0.5882353, 0, 1,
-1.31899, -0.1816114, -1.720852, 1, 0.5921569, 0, 1,
-1.302434, -0.01507709, -1.0168, 1, 0.6, 0, 1,
-1.300162, 0.003256904, -1.860963, 1, 0.6078432, 0, 1,
-1.296181, -1.193261, -3.155749, 1, 0.6117647, 0, 1,
-1.294761, -0.4650498, -1.542148, 1, 0.6196079, 0, 1,
-1.293004, -0.8191093, -1.804317, 1, 0.6235294, 0, 1,
-1.282788, 0.05510887, -1.22473, 1, 0.6313726, 0, 1,
-1.276851, 1.163296, 0.09378438, 1, 0.6352941, 0, 1,
-1.273555, -0.1499063, -1.212349, 1, 0.6431373, 0, 1,
-1.271172, 0.6205842, -1.521235, 1, 0.6470588, 0, 1,
-1.271144, 0.8952001, -2.360609, 1, 0.654902, 0, 1,
-1.269675, 0.2136557, -1.851355, 1, 0.6588235, 0, 1,
-1.263981, -1.023257, -1.593202, 1, 0.6666667, 0, 1,
-1.261098, 0.7224017, -1.679526, 1, 0.6705883, 0, 1,
-1.256705, 0.7140008, -2.225264, 1, 0.6784314, 0, 1,
-1.248208, -0.3633744, -0.6066316, 1, 0.682353, 0, 1,
-1.245628, -1.091606, -2.445433, 1, 0.6901961, 0, 1,
-1.243546, -1.82844, -3.190222, 1, 0.6941177, 0, 1,
-1.230538, 1.639172, 0.3104527, 1, 0.7019608, 0, 1,
-1.230517, 0.2182744, -2.88729, 1, 0.7098039, 0, 1,
-1.225233, 0.1103755, -1.540264, 1, 0.7137255, 0, 1,
-1.224545, -0.07227024, -0.7087023, 1, 0.7215686, 0, 1,
-1.220364, 2.716624, -0.2869473, 1, 0.7254902, 0, 1,
-1.217148, 0.8475185, -1.716041, 1, 0.7333333, 0, 1,
-1.215869, 1.194931, -2.264764, 1, 0.7372549, 0, 1,
-1.214125, -1.603178, -2.39044, 1, 0.7450981, 0, 1,
-1.202367, -1.370186, -1.858376, 1, 0.7490196, 0, 1,
-1.198453, -1.40875, -0.8435643, 1, 0.7568628, 0, 1,
-1.197589, 1.202704, -2.901819, 1, 0.7607843, 0, 1,
-1.195704, -1.286898, -2.089374, 1, 0.7686275, 0, 1,
-1.192901, -0.8294951, -2.912707, 1, 0.772549, 0, 1,
-1.185543, 1.591784, -0.8473491, 1, 0.7803922, 0, 1,
-1.182506, -0.6137046, -2.820686, 1, 0.7843137, 0, 1,
-1.180509, 0.217999, -2.459172, 1, 0.7921569, 0, 1,
-1.169873, 1.009283, -1.540024, 1, 0.7960784, 0, 1,
-1.160644, -0.740731, -3.250655, 1, 0.8039216, 0, 1,
-1.143507, 0.5679005, -0.5853481, 1, 0.8117647, 0, 1,
-1.137417, 0.07848808, -2.228254, 1, 0.8156863, 0, 1,
-1.13294, -0.9945804, -1.820348, 1, 0.8235294, 0, 1,
-1.122757, 0.3988409, -1.678181, 1, 0.827451, 0, 1,
-1.114647, 0.3508862, -0.7722902, 1, 0.8352941, 0, 1,
-1.111578, 0.5875431, -0.5843608, 1, 0.8392157, 0, 1,
-1.108815, 0.1790531, -1.036339, 1, 0.8470588, 0, 1,
-1.108788, 1.252311, -1.557655, 1, 0.8509804, 0, 1,
-1.107692, -0.7060928, -2.983165, 1, 0.8588235, 0, 1,
-1.087804, -1.180776, -1.551637, 1, 0.8627451, 0, 1,
-1.086227, -0.9891175, -4.181265, 1, 0.8705882, 0, 1,
-1.081252, 0.5844716, -1.87303, 1, 0.8745098, 0, 1,
-1.07765, 0.9414033, -0.9115224, 1, 0.8823529, 0, 1,
-1.076941, -0.8327111, -1.032232, 1, 0.8862745, 0, 1,
-1.076443, -0.06513936, -1.83904, 1, 0.8941177, 0, 1,
-1.073575, -1.211719, -2.422439, 1, 0.8980392, 0, 1,
-1.069335, 0.04562925, -0.2341745, 1, 0.9058824, 0, 1,
-1.067297, 0.2221444, -0.2530064, 1, 0.9137255, 0, 1,
-1.064678, 2.183209, -2.584704, 1, 0.9176471, 0, 1,
-1.062114, -2.02308, -1.621996, 1, 0.9254902, 0, 1,
-1.061368, -0.6320512, -1.219766, 1, 0.9294118, 0, 1,
-1.057748, 1.509839, -1.401338, 1, 0.9372549, 0, 1,
-1.055816, 1.263668, -0.002823843, 1, 0.9411765, 0, 1,
-1.054576, -0.4022788, -1.64897, 1, 0.9490196, 0, 1,
-1.051747, -1.033803, -2.857194, 1, 0.9529412, 0, 1,
-1.048765, -1.241722, -2.408658, 1, 0.9607843, 0, 1,
-1.023794, -0.7096433, -1.938615, 1, 0.9647059, 0, 1,
-1.018192, 0.8883874, -1.051828, 1, 0.972549, 0, 1,
-1.009168, 0.7697903, -0.8858719, 1, 0.9764706, 0, 1,
-1.003121, -0.4663381, -2.328855, 1, 0.9843137, 0, 1,
-1.000535, 0.6516219, -1.852024, 1, 0.9882353, 0, 1,
-0.9939869, -1.350017, -0.5431091, 1, 0.9960784, 0, 1,
-0.9881348, 0.7582314, 1.281731, 0.9960784, 1, 0, 1,
-0.9879961, 0.5481047, -0.1203711, 0.9921569, 1, 0, 1,
-0.9809352, -0.1761886, -2.847947, 0.9843137, 1, 0, 1,
-0.9752917, -0.3932433, -0.920389, 0.9803922, 1, 0, 1,
-0.9751616, -1.142567, -1.598658, 0.972549, 1, 0, 1,
-0.9746806, 0.7083873, -0.06251153, 0.9686275, 1, 0, 1,
-0.9731966, -1.729297, -3.102103, 0.9607843, 1, 0, 1,
-0.9692303, 0.6768501, -1.926453, 0.9568627, 1, 0, 1,
-0.9522355, -0.9186813, -2.423638, 0.9490196, 1, 0, 1,
-0.949706, -0.9805438, -2.196319, 0.945098, 1, 0, 1,
-0.9426242, -0.4756463, -1.881779, 0.9372549, 1, 0, 1,
-0.9408585, 1.313921, -1.520609, 0.9333333, 1, 0, 1,
-0.9405904, 1.23265, -1.022596, 0.9254902, 1, 0, 1,
-0.9397796, -0.1529082, -1.050979, 0.9215686, 1, 0, 1,
-0.9284307, -0.6389146, -1.566579, 0.9137255, 1, 0, 1,
-0.9208903, 0.3097965, -1.790466, 0.9098039, 1, 0, 1,
-0.9164814, 0.6288843, -1.413808, 0.9019608, 1, 0, 1,
-0.9142349, 0.4846075, -1.640973, 0.8941177, 1, 0, 1,
-0.9135588, 0.8521709, -2.250691, 0.8901961, 1, 0, 1,
-0.9042799, 0.4471124, -2.524732, 0.8823529, 1, 0, 1,
-0.9031044, 0.2294999, -1.635039, 0.8784314, 1, 0, 1,
-0.9020157, -0.8779217, -2.645073, 0.8705882, 1, 0, 1,
-0.8994917, 0.2497203, -3.015159, 0.8666667, 1, 0, 1,
-0.8950514, -1.007103, -3.562686, 0.8588235, 1, 0, 1,
-0.8789209, 0.2571321, 0.3109569, 0.854902, 1, 0, 1,
-0.8717905, -1.122277, -2.26349, 0.8470588, 1, 0, 1,
-0.8715718, 0.6061459, 0.0273912, 0.8431373, 1, 0, 1,
-0.867451, -1.168559, -1.970173, 0.8352941, 1, 0, 1,
-0.8575464, 0.0447113, -0.5800245, 0.8313726, 1, 0, 1,
-0.8565296, -0.6994604, -1.212, 0.8235294, 1, 0, 1,
-0.8439971, -1.847819, -3.309351, 0.8196079, 1, 0, 1,
-0.8275725, 1.141055, -0.9630992, 0.8117647, 1, 0, 1,
-0.8271748, -0.9881046, -2.521987, 0.8078431, 1, 0, 1,
-0.8243688, 0.04164837, -1.016908, 0.8, 1, 0, 1,
-0.8218254, 1.181882, 1.12208, 0.7921569, 1, 0, 1,
-0.820895, 2.639781, -1.301665, 0.7882353, 1, 0, 1,
-0.8154073, 0.6040366, -0.305543, 0.7803922, 1, 0, 1,
-0.8145123, -1.450942, -1.449938, 0.7764706, 1, 0, 1,
-0.8132805, 0.255441, -0.8586758, 0.7686275, 1, 0, 1,
-0.8082758, 0.3703549, 1.458631, 0.7647059, 1, 0, 1,
-0.8026153, -1.006807, -2.389107, 0.7568628, 1, 0, 1,
-0.7985152, 1.825693, -1.872752, 0.7529412, 1, 0, 1,
-0.7794656, 0.2147684, -1.409013, 0.7450981, 1, 0, 1,
-0.7794646, -1.690049, -3.081963, 0.7411765, 1, 0, 1,
-0.7789993, 0.455099, -0.6111241, 0.7333333, 1, 0, 1,
-0.7627268, 0.08336495, -1.906264, 0.7294118, 1, 0, 1,
-0.7558598, -1.940894, -1.263281, 0.7215686, 1, 0, 1,
-0.7544326, 0.2993481, -0.9022666, 0.7176471, 1, 0, 1,
-0.7533878, 0.5760005, -2.206869, 0.7098039, 1, 0, 1,
-0.7473689, -0.5967028, -1.120443, 0.7058824, 1, 0, 1,
-0.7370613, 1.560978, 1.188807, 0.6980392, 1, 0, 1,
-0.7359317, -0.3112654, -2.086017, 0.6901961, 1, 0, 1,
-0.7312914, -0.143715, -1.506642, 0.6862745, 1, 0, 1,
-0.7300492, 0.828065, -1.425968, 0.6784314, 1, 0, 1,
-0.7280664, -0.00335558, -2.438741, 0.6745098, 1, 0, 1,
-0.7183515, 1.123436, -0.6684508, 0.6666667, 1, 0, 1,
-0.7176705, 0.9170053, -0.6796636, 0.6627451, 1, 0, 1,
-0.7162244, -1.462765, -3.431049, 0.654902, 1, 0, 1,
-0.7155437, -1.256086, -3.419348, 0.6509804, 1, 0, 1,
-0.7149031, -1.712516, -3.285674, 0.6431373, 1, 0, 1,
-0.7054484, -0.4351304, -0.534677, 0.6392157, 1, 0, 1,
-0.7017671, 0.3920711, -1.671292, 0.6313726, 1, 0, 1,
-0.7015607, -0.1953095, -2.046025, 0.627451, 1, 0, 1,
-0.6998239, 0.1383307, -0.982531, 0.6196079, 1, 0, 1,
-0.6977687, -0.696186, -3.267953, 0.6156863, 1, 0, 1,
-0.6976963, -0.008561326, -3.109988, 0.6078432, 1, 0, 1,
-0.6965963, 0.2703964, -0.690436, 0.6039216, 1, 0, 1,
-0.6964898, -0.2930439, -1.181386, 0.5960785, 1, 0, 1,
-0.6890281, 0.95328, 0.4103909, 0.5882353, 1, 0, 1,
-0.6854493, -0.5808042, -0.6333453, 0.5843138, 1, 0, 1,
-0.683945, 2.125041, 0.1088066, 0.5764706, 1, 0, 1,
-0.6807293, 1.142856, 0.2491637, 0.572549, 1, 0, 1,
-0.6797445, -0.447539, -1.859964, 0.5647059, 1, 0, 1,
-0.6763511, 0.9077065, 0.2064433, 0.5607843, 1, 0, 1,
-0.6750559, -0.5547214, -2.510498, 0.5529412, 1, 0, 1,
-0.6667835, -0.2066539, -2.110567, 0.5490196, 1, 0, 1,
-0.6603228, -0.2856132, -1.843592, 0.5411765, 1, 0, 1,
-0.6595331, 0.4882071, -2.413976, 0.5372549, 1, 0, 1,
-0.6550981, -2.443333, -4.261825, 0.5294118, 1, 0, 1,
-0.6548854, 0.7033364, 0.2304766, 0.5254902, 1, 0, 1,
-0.6536949, 1.250811, -1.155319, 0.5176471, 1, 0, 1,
-0.6524017, -0.001618639, -3.060677, 0.5137255, 1, 0, 1,
-0.651131, 1.174071, -0.5484099, 0.5058824, 1, 0, 1,
-0.6510959, -1.754313, -2.471377, 0.5019608, 1, 0, 1,
-0.6468173, 0.2431633, -1.184324, 0.4941176, 1, 0, 1,
-0.6444898, 0.2298195, -0.9110435, 0.4862745, 1, 0, 1,
-0.6443385, 0.8720247, -1.18314, 0.4823529, 1, 0, 1,
-0.6441125, 0.6231763, 1.116613, 0.4745098, 1, 0, 1,
-0.639922, 0.0502791, -1.32387, 0.4705882, 1, 0, 1,
-0.6367247, 1.126693, -0.5238141, 0.4627451, 1, 0, 1,
-0.6281365, -0.67933, -4.260138, 0.4588235, 1, 0, 1,
-0.6240759, -0.4269115, -0.9749154, 0.4509804, 1, 0, 1,
-0.6201571, 1.18749, -1.087532, 0.4470588, 1, 0, 1,
-0.6193567, 1.117703, 0.1333704, 0.4392157, 1, 0, 1,
-0.6145046, 1.871779, -1.140405, 0.4352941, 1, 0, 1,
-0.6125252, 0.3862575, -0.9840307, 0.427451, 1, 0, 1,
-0.6117939, -1.045323, -1.00826, 0.4235294, 1, 0, 1,
-0.6112131, 0.8933038, -0.1486842, 0.4156863, 1, 0, 1,
-0.6101504, 1.559786, 0.2827986, 0.4117647, 1, 0, 1,
-0.606713, -0.3715785, -1.716448, 0.4039216, 1, 0, 1,
-0.6055984, -0.6289037, -4.729806, 0.3960784, 1, 0, 1,
-0.604462, 0.04591623, -0.9890692, 0.3921569, 1, 0, 1,
-0.5969088, -1.422548, -2.259786, 0.3843137, 1, 0, 1,
-0.5968094, 0.2193235, -0.2360368, 0.3803922, 1, 0, 1,
-0.5964429, -0.8873268, -1.304813, 0.372549, 1, 0, 1,
-0.5962212, -0.1608813, -1.476771, 0.3686275, 1, 0, 1,
-0.5938416, 0.6475024, -0.5556541, 0.3607843, 1, 0, 1,
-0.5936636, -0.9129679, -1.712481, 0.3568628, 1, 0, 1,
-0.5903872, -0.6101615, -1.018851, 0.3490196, 1, 0, 1,
-0.5903744, 0.2074956, -1.872809, 0.345098, 1, 0, 1,
-0.5823464, -1.151288, -1.072532, 0.3372549, 1, 0, 1,
-0.5817648, -0.3153757, -1.374023, 0.3333333, 1, 0, 1,
-0.5776553, -0.7167342, -2.828646, 0.3254902, 1, 0, 1,
-0.568844, -0.1608998, -1.537435, 0.3215686, 1, 0, 1,
-0.5641372, 1.715484, 0.1047873, 0.3137255, 1, 0, 1,
-0.5619053, 2.139013, 1.506782, 0.3098039, 1, 0, 1,
-0.5602071, 0.8949946, -0.6628495, 0.3019608, 1, 0, 1,
-0.5592251, -1.034413, -2.265157, 0.2941177, 1, 0, 1,
-0.5579981, 1.047811, -1.071251, 0.2901961, 1, 0, 1,
-0.5569863, 0.01689597, -2.355093, 0.282353, 1, 0, 1,
-0.5559596, -0.7373821, -2.081903, 0.2784314, 1, 0, 1,
-0.5544072, -0.8270918, -3.802431, 0.2705882, 1, 0, 1,
-0.550078, -0.4897104, -3.652171, 0.2666667, 1, 0, 1,
-0.5490533, 0.3293452, -0.7164116, 0.2588235, 1, 0, 1,
-0.5470573, -1.027018, -4.745882, 0.254902, 1, 0, 1,
-0.5446439, 0.7041533, 0.08827624, 0.2470588, 1, 0, 1,
-0.5432641, -2.171233, -3.187372, 0.2431373, 1, 0, 1,
-0.5424433, 0.705519, -1.685845, 0.2352941, 1, 0, 1,
-0.5389071, 0.133415, 0.02329659, 0.2313726, 1, 0, 1,
-0.5366645, 2.308609, -0.06253719, 0.2235294, 1, 0, 1,
-0.5343223, -0.824346, -4.261562, 0.2196078, 1, 0, 1,
-0.5314277, -0.9951677, -2.298006, 0.2117647, 1, 0, 1,
-0.5305402, 1.137028, -1.394206, 0.2078431, 1, 0, 1,
-0.5277122, -0.6929067, -2.275907, 0.2, 1, 0, 1,
-0.5243245, -0.0634253, -0.7177771, 0.1921569, 1, 0, 1,
-0.5227332, -1.63224, -2.258953, 0.1882353, 1, 0, 1,
-0.5203838, 0.05090193, -2.072359, 0.1803922, 1, 0, 1,
-0.5190966, -1.464171, -2.392065, 0.1764706, 1, 0, 1,
-0.5146574, -2.350768, -3.628616, 0.1686275, 1, 0, 1,
-0.5110666, -0.1297852, -1.787777, 0.1647059, 1, 0, 1,
-0.50542, 2.462951, -0.0466042, 0.1568628, 1, 0, 1,
-0.5005594, 1.524553, -1.85655, 0.1529412, 1, 0, 1,
-0.5005301, -0.04813131, -2.52389, 0.145098, 1, 0, 1,
-0.4992742, -1.428379, -1.465397, 0.1411765, 1, 0, 1,
-0.4970705, 0.1987345, -2.655853, 0.1333333, 1, 0, 1,
-0.4944794, 0.9288963, -1.15126, 0.1294118, 1, 0, 1,
-0.4902011, -1.596585, -2.885973, 0.1215686, 1, 0, 1,
-0.4845719, -0.1579231, -0.2131831, 0.1176471, 1, 0, 1,
-0.4807308, -0.6965132, -2.268537, 0.1098039, 1, 0, 1,
-0.47954, 0.02635815, -0.2931674, 0.1058824, 1, 0, 1,
-0.4793314, 1.566978, -1.666265, 0.09803922, 1, 0, 1,
-0.4684719, 0.9871798, -0.9057887, 0.09019608, 1, 0, 1,
-0.4673528, -1.765698, -2.811213, 0.08627451, 1, 0, 1,
-0.4672776, 0.4983822, 0.8946494, 0.07843138, 1, 0, 1,
-0.4614312, -1.229516, -0.8600248, 0.07450981, 1, 0, 1,
-0.4601372, -1.577497, -1.469294, 0.06666667, 1, 0, 1,
-0.4589517, -0.3846484, -1.770746, 0.0627451, 1, 0, 1,
-0.4554231, 1.266362, -1.232211, 0.05490196, 1, 0, 1,
-0.4526271, 0.8042651, 1.065402, 0.05098039, 1, 0, 1,
-0.4524987, -0.9440193, -2.827849, 0.04313726, 1, 0, 1,
-0.451637, 1.213307, -1.989909, 0.03921569, 1, 0, 1,
-0.4481791, 0.01564644, -1.66547, 0.03137255, 1, 0, 1,
-0.4474322, 0.7652826, -0.6402322, 0.02745098, 1, 0, 1,
-0.4368095, -0.4206775, -1.922405, 0.01960784, 1, 0, 1,
-0.4287528, -1.985616, -4.394594, 0.01568628, 1, 0, 1,
-0.4286624, -0.8558835, -2.774307, 0.007843138, 1, 0, 1,
-0.4279487, 0.1084398, -2.621953, 0.003921569, 1, 0, 1,
-0.4277704, -0.06123343, -0.8185666, 0, 1, 0.003921569, 1,
-0.4248708, 2.559711, 0.3927276, 0, 1, 0.01176471, 1,
-0.4229103, 0.3939888, -0.3487017, 0, 1, 0.01568628, 1,
-0.4213194, -0.4709482, -4.466893, 0, 1, 0.02352941, 1,
-0.4188426, 1.183102, 0.33009, 0, 1, 0.02745098, 1,
-0.4082303, -1.055689, -3.895732, 0, 1, 0.03529412, 1,
-0.4057181, 1.34519, -0.4106344, 0, 1, 0.03921569, 1,
-0.403934, -1.641273, -2.707441, 0, 1, 0.04705882, 1,
-0.3972221, -0.1490073, -2.512757, 0, 1, 0.05098039, 1,
-0.3968927, -1.712821, -3.291749, 0, 1, 0.05882353, 1,
-0.3931404, -0.02323398, -0.6120348, 0, 1, 0.0627451, 1,
-0.3908686, -0.2990158, -1.597301, 0, 1, 0.07058824, 1,
-0.3902225, 0.9597588, 2.311915, 0, 1, 0.07450981, 1,
-0.3902096, 0.1784723, -1.869069, 0, 1, 0.08235294, 1,
-0.3887388, -0.3366562, -2.30077, 0, 1, 0.08627451, 1,
-0.3752754, 0.4718845, 0.2409574, 0, 1, 0.09411765, 1,
-0.375108, 0.5400874, -1.386147, 0, 1, 0.1019608, 1,
-0.3671694, 1.396831, 0.1173047, 0, 1, 0.1058824, 1,
-0.3663738, -0.5543883, -2.871015, 0, 1, 0.1137255, 1,
-0.3650048, -0.9563296, -0.5592633, 0, 1, 0.1176471, 1,
-0.3629829, 1.418212, -1.249528, 0, 1, 0.1254902, 1,
-0.3587436, 0.8077608, 0.09010088, 0, 1, 0.1294118, 1,
-0.3534248, 0.148165, -3.118899, 0, 1, 0.1372549, 1,
-0.3501161, 1.067683, 0.06290762, 0, 1, 0.1411765, 1,
-0.349876, -1.461414, -1.234067, 0, 1, 0.1490196, 1,
-0.348052, -0.2571576, -2.581573, 0, 1, 0.1529412, 1,
-0.3433176, 0.4565139, -0.8507397, 0, 1, 0.1607843, 1,
-0.3408603, 0.3267096, -1.378732, 0, 1, 0.1647059, 1,
-0.3391516, -0.596546, -3.371296, 0, 1, 0.172549, 1,
-0.3382634, 2.195666, -0.3849944, 0, 1, 0.1764706, 1,
-0.3380263, 1.188701, 0.7571523, 0, 1, 0.1843137, 1,
-0.3349861, -0.5262754, -1.614839, 0, 1, 0.1882353, 1,
-0.334384, -0.8376114, -2.786171, 0, 1, 0.1960784, 1,
-0.3314637, -1.004729, -2.659061, 0, 1, 0.2039216, 1,
-0.3302417, 0.3983637, 0.6658472, 0, 1, 0.2078431, 1,
-0.3285087, -0.5392355, -3.186098, 0, 1, 0.2156863, 1,
-0.3253685, 0.1742974, -1.896985, 0, 1, 0.2196078, 1,
-0.3247124, -0.3704142, -2.726397, 0, 1, 0.227451, 1,
-0.3244292, -0.2696096, -2.575598, 0, 1, 0.2313726, 1,
-0.3118178, -1.947371, -3.562766, 0, 1, 0.2392157, 1,
-0.3104089, -1.405323, -2.124463, 0, 1, 0.2431373, 1,
-0.3102486, 0.7461967, 0.682099, 0, 1, 0.2509804, 1,
-0.3102, 0.3579236, -0.9234066, 0, 1, 0.254902, 1,
-0.3098502, 0.1834631, -2.579499, 0, 1, 0.2627451, 1,
-0.3045797, -0.3590121, -2.365958, 0, 1, 0.2666667, 1,
-0.2982976, -1.515242, -5.210657, 0, 1, 0.2745098, 1,
-0.2960906, -0.2553388, -1.59851, 0, 1, 0.2784314, 1,
-0.2910465, 0.1148762, -1.636789, 0, 1, 0.2862745, 1,
-0.2910019, 0.8251798, -0.4868247, 0, 1, 0.2901961, 1,
-0.2906656, -1.728911, -3.99896, 0, 1, 0.2980392, 1,
-0.2900769, -0.2402999, -1.125989, 0, 1, 0.3058824, 1,
-0.2858452, -0.4815528, -1.788908, 0, 1, 0.3098039, 1,
-0.2836888, -0.3473842, -1.964634, 0, 1, 0.3176471, 1,
-0.2795579, -0.2945102, -2.837467, 0, 1, 0.3215686, 1,
-0.2771274, 0.4274706, -1.464148, 0, 1, 0.3294118, 1,
-0.2675234, -1.756498, -2.794254, 0, 1, 0.3333333, 1,
-0.2655639, -0.3361034, -2.216626, 0, 1, 0.3411765, 1,
-0.2652594, 0.6418408, -0.3249022, 0, 1, 0.345098, 1,
-0.2638767, 0.05990757, -1.236402, 0, 1, 0.3529412, 1,
-0.2586764, -0.8074127, -2.746063, 0, 1, 0.3568628, 1,
-0.2583544, 0.380686, 0.1807382, 0, 1, 0.3647059, 1,
-0.2575348, -0.4189698, -2.117777, 0, 1, 0.3686275, 1,
-0.2564245, 0.1573241, -0.2178128, 0, 1, 0.3764706, 1,
-0.2550741, 1.206958, -0.1947819, 0, 1, 0.3803922, 1,
-0.2502587, 1.736303, -0.4132082, 0, 1, 0.3882353, 1,
-0.2489466, -1.029041, -1.675603, 0, 1, 0.3921569, 1,
-0.2454348, 3.07696, 0.8120316, 0, 1, 0.4, 1,
-0.2430714, -0.1574104, -1.449358, 0, 1, 0.4078431, 1,
-0.2268258, 1.034937, 0.1801694, 0, 1, 0.4117647, 1,
-0.2214033, -0.5710701, -2.342143, 0, 1, 0.4196078, 1,
-0.2197277, 1.139073, -1.572025, 0, 1, 0.4235294, 1,
-0.2188678, -0.5877159, -1.499875, 0, 1, 0.4313726, 1,
-0.2156961, -0.5322492, -1.880603, 0, 1, 0.4352941, 1,
-0.2133687, 0.2554195, -1.446657, 0, 1, 0.4431373, 1,
-0.213011, 0.1947704, 0.2761143, 0, 1, 0.4470588, 1,
-0.2099799, -0.2906798, -3.164073, 0, 1, 0.454902, 1,
-0.2090532, -0.7899877, -2.728887, 0, 1, 0.4588235, 1,
-0.2085333, 1.495875, -0.06828675, 0, 1, 0.4666667, 1,
-0.2011139, 0.2173198, -0.05900558, 0, 1, 0.4705882, 1,
-0.1999409, -0.7854831, -2.63798, 0, 1, 0.4784314, 1,
-0.1932183, -0.6967135, -3.261649, 0, 1, 0.4823529, 1,
-0.1908941, 0.2192855, -2.295527, 0, 1, 0.4901961, 1,
-0.1876959, 0.5809708, -2.049867, 0, 1, 0.4941176, 1,
-0.1864345, 0.4456391, 0.8361913, 0, 1, 0.5019608, 1,
-0.1827832, -0.7138057, -3.431862, 0, 1, 0.509804, 1,
-0.1810625, 0.4036733, 1.352443, 0, 1, 0.5137255, 1,
-0.1793955, -0.8975819, -2.271098, 0, 1, 0.5215687, 1,
-0.177502, -0.1541963, -2.653225, 0, 1, 0.5254902, 1,
-0.1760604, -0.6942384, -2.781921, 0, 1, 0.5333334, 1,
-0.1747903, 1.184253, 0.08383547, 0, 1, 0.5372549, 1,
-0.1740491, 1.146097, 1.767583, 0, 1, 0.5450981, 1,
-0.1649805, -1.843998, -2.015976, 0, 1, 0.5490196, 1,
-0.1599302, 2.058267, -1.463059, 0, 1, 0.5568628, 1,
-0.1581051, 1.169407, 1.48182, 0, 1, 0.5607843, 1,
-0.1541327, 0.5271682, 3.268748, 0, 1, 0.5686275, 1,
-0.1532801, 0.1762562, 0.2339673, 0, 1, 0.572549, 1,
-0.1516093, -0.7161899, -2.2763, 0, 1, 0.5803922, 1,
-0.1515305, -0.3980161, -2.782575, 0, 1, 0.5843138, 1,
-0.1484638, -0.1798859, -2.920337, 0, 1, 0.5921569, 1,
-0.1480941, 0.2942894, -2.081377, 0, 1, 0.5960785, 1,
-0.144291, 0.1319902, -1.030189, 0, 1, 0.6039216, 1,
-0.14271, 0.8986955, 1.088627, 0, 1, 0.6117647, 1,
-0.1393762, -0.4785039, -4.436926, 0, 1, 0.6156863, 1,
-0.1317078, -0.7609458, -3.294045, 0, 1, 0.6235294, 1,
-0.1298436, -2.146793, -3.547805, 0, 1, 0.627451, 1,
-0.1289227, 1.064954, 0.7686377, 0, 1, 0.6352941, 1,
-0.1254279, 0.06714564, -0.8851691, 0, 1, 0.6392157, 1,
-0.1202513, 1.438571, -0.3203956, 0, 1, 0.6470588, 1,
-0.1194917, -0.397284, -3.836119, 0, 1, 0.6509804, 1,
-0.1149485, -0.320128, -5.290075, 0, 1, 0.6588235, 1,
-0.1094039, 0.4089093, 0.4006005, 0, 1, 0.6627451, 1,
-0.1083183, -0.07222567, -4.228302, 0, 1, 0.6705883, 1,
-0.1054314, -0.04758302, -0.5298492, 0, 1, 0.6745098, 1,
-0.1023924, 1.763755, 0.9606727, 0, 1, 0.682353, 1,
-0.09676727, 1.211757, -0.02805018, 0, 1, 0.6862745, 1,
-0.09209142, -1.889026, -2.222598, 0, 1, 0.6941177, 1,
-0.08822745, 1.24859, -2.348017, 0, 1, 0.7019608, 1,
-0.08790821, -0.5350257, -2.269827, 0, 1, 0.7058824, 1,
-0.08383585, -0.6660508, -2.722653, 0, 1, 0.7137255, 1,
-0.08300944, -2.408474, -2.460387, 0, 1, 0.7176471, 1,
-0.08241279, 1.57841, 0.8096808, 0, 1, 0.7254902, 1,
-0.07611287, -0.1122847, -3.119313, 0, 1, 0.7294118, 1,
-0.0749997, 0.6436294, -1.459824, 0, 1, 0.7372549, 1,
-0.07405099, 0.3957288, 0.4941277, 0, 1, 0.7411765, 1,
-0.07304149, -2.329192, -2.439201, 0, 1, 0.7490196, 1,
-0.07287582, 0.07919919, -2.473915, 0, 1, 0.7529412, 1,
-0.07004528, -0.398678, -2.317693, 0, 1, 0.7607843, 1,
-0.06945789, 0.02304918, -0.9783047, 0, 1, 0.7647059, 1,
-0.06853829, 0.2573748, 1.160642, 0, 1, 0.772549, 1,
-0.0681852, 0.8992774, -1.636533, 0, 1, 0.7764706, 1,
-0.06502537, 1.366992, 1.508662, 0, 1, 0.7843137, 1,
-0.06250007, -0.8924652, -3.006217, 0, 1, 0.7882353, 1,
-0.05588555, -0.8309693, -3.570483, 0, 1, 0.7960784, 1,
-0.05337989, 1.14088, 0.05127386, 0, 1, 0.8039216, 1,
-0.05305067, -0.5744721, -4.018438, 0, 1, 0.8078431, 1,
-0.04116567, 1.911057, -2.545346, 0, 1, 0.8156863, 1,
-0.04076345, -1.791099, -2.260096, 0, 1, 0.8196079, 1,
-0.03947598, 1.105856, -0.1850787, 0, 1, 0.827451, 1,
-0.0356078, -1.937926, -2.806456, 0, 1, 0.8313726, 1,
-0.03416672, -1.536743, -1.059292, 0, 1, 0.8392157, 1,
-0.02833122, 0.6698732, -2.10812, 0, 1, 0.8431373, 1,
-0.02795417, -0.1268474, -3.720407, 0, 1, 0.8509804, 1,
-0.02632053, -0.6931358, -3.377484, 0, 1, 0.854902, 1,
-0.02284355, 0.611737, 1.394721, 0, 1, 0.8627451, 1,
-0.02212802, 0.9953283, -1.402997, 0, 1, 0.8666667, 1,
-0.01779901, -0.146974, -3.988539, 0, 1, 0.8745098, 1,
-0.01581616, -0.8321235, -2.504392, 0, 1, 0.8784314, 1,
-0.0132578, -0.4599828, -2.481059, 0, 1, 0.8862745, 1,
-0.01273147, 1.186473, -0.8473762, 0, 1, 0.8901961, 1,
-0.008991519, -0.5428501, -2.929187, 0, 1, 0.8980392, 1,
-0.006584547, 0.07877405, -0.5144835, 0, 1, 0.9058824, 1,
0.001252689, -1.509023, 2.831059, 0, 1, 0.9098039, 1,
0.003412856, -0.4231392, 2.185006, 0, 1, 0.9176471, 1,
0.005582242, -0.03478022, 3.968348, 0, 1, 0.9215686, 1,
0.01127294, 0.3325335, -0.8247085, 0, 1, 0.9294118, 1,
0.01604242, 0.1542843, 1.394055, 0, 1, 0.9333333, 1,
0.02598999, -1.616574, 4.057715, 0, 1, 0.9411765, 1,
0.02701451, 0.5482939, -0.8569501, 0, 1, 0.945098, 1,
0.02795351, -0.9084701, 3.342446, 0, 1, 0.9529412, 1,
0.02920049, -0.2880969, 1.47313, 0, 1, 0.9568627, 1,
0.0297537, 0.464773, -0.004290179, 0, 1, 0.9647059, 1,
0.03244847, 0.6621285, -0.3497794, 0, 1, 0.9686275, 1,
0.03245779, -0.2135445, 3.933828, 0, 1, 0.9764706, 1,
0.03352921, 1.093315, 1.15526, 0, 1, 0.9803922, 1,
0.04275168, 1.272245, 0.4982591, 0, 1, 0.9882353, 1,
0.04758375, 1.493839, -0.7900237, 0, 1, 0.9921569, 1,
0.05441224, 1.318833, 0.4908341, 0, 1, 1, 1,
0.05536269, 1.157933, -0.3758236, 0, 0.9921569, 1, 1,
0.05539437, -1.385266, 2.764424, 0, 0.9882353, 1, 1,
0.06338891, 0.1040892, -0.1506301, 0, 0.9803922, 1, 1,
0.06377211, -0.6282103, 2.185029, 0, 0.9764706, 1, 1,
0.0672572, -0.005722516, 3.040987, 0, 0.9686275, 1, 1,
0.07056027, -0.716513, 2.679579, 0, 0.9647059, 1, 1,
0.07113577, -1.244916, 1.875978, 0, 0.9568627, 1, 1,
0.07433634, -0.5339325, 3.521902, 0, 0.9529412, 1, 1,
0.07465953, -0.777492, 2.859067, 0, 0.945098, 1, 1,
0.07811949, -0.6011066, 2.842319, 0, 0.9411765, 1, 1,
0.07907646, 0.2110298, 1.180261, 0, 0.9333333, 1, 1,
0.07916003, -1.014174, 4.597086, 0, 0.9294118, 1, 1,
0.0800171, 0.7832139, 0.814849, 0, 0.9215686, 1, 1,
0.08054437, -0.7781187, 2.59488, 0, 0.9176471, 1, 1,
0.08157685, 0.3339395, 0.1172918, 0, 0.9098039, 1, 1,
0.08280094, -0.9773045, 3.37944, 0, 0.9058824, 1, 1,
0.08445209, -0.8743417, 3.227826, 0, 0.8980392, 1, 1,
0.08838338, 0.7037225, -0.6407044, 0, 0.8901961, 1, 1,
0.0891372, 1.232445, 0.4648862, 0, 0.8862745, 1, 1,
0.09218631, -0.9635482, 3.649582, 0, 0.8784314, 1, 1,
0.09234657, -0.09542587, 3.085915, 0, 0.8745098, 1, 1,
0.09716625, 2.017027, -0.3709829, 0, 0.8666667, 1, 1,
0.09748271, -0.9754688, 3.721648, 0, 0.8627451, 1, 1,
0.1140917, 0.450959, -0.8140758, 0, 0.854902, 1, 1,
0.1162504, 0.1538528, 2.278466, 0, 0.8509804, 1, 1,
0.119154, -0.2002626, 3.083367, 0, 0.8431373, 1, 1,
0.121235, -0.6338681, 2.886231, 0, 0.8392157, 1, 1,
0.1214594, 1.322569, 1.468121, 0, 0.8313726, 1, 1,
0.1230968, -0.8396358, 1.391383, 0, 0.827451, 1, 1,
0.1265409, 2.249999, 1.454067, 0, 0.8196079, 1, 1,
0.1293612, -0.2006926, 2.329197, 0, 0.8156863, 1, 1,
0.1298638, -1.802491, 1.122321, 0, 0.8078431, 1, 1,
0.1299032, 0.8465988, -1.319676, 0, 0.8039216, 1, 1,
0.1343855, 1.864252, 0.111587, 0, 0.7960784, 1, 1,
0.1345164, -1.700725, 2.781216, 0, 0.7882353, 1, 1,
0.1377309, 0.132312, 1.146252, 0, 0.7843137, 1, 1,
0.1408761, -0.8762625, 5.019514, 0, 0.7764706, 1, 1,
0.1428706, 0.2922053, -1.887102, 0, 0.772549, 1, 1,
0.1453972, 0.6235303, 0.4673524, 0, 0.7647059, 1, 1,
0.1474488, 0.9676771, 0.3544467, 0, 0.7607843, 1, 1,
0.147507, -0.04187898, 3.560664, 0, 0.7529412, 1, 1,
0.151453, -1.573744, 3.338509, 0, 0.7490196, 1, 1,
0.1529125, -0.2052252, 2.63812, 0, 0.7411765, 1, 1,
0.1553852, 0.6023803, -1.229323, 0, 0.7372549, 1, 1,
0.1589381, 1.715905, -0.2814178, 0, 0.7294118, 1, 1,
0.1592672, 1.509211, -1.226792, 0, 0.7254902, 1, 1,
0.1606078, 1.559772, -0.525142, 0, 0.7176471, 1, 1,
0.1639867, 0.08927551, 0.2947911, 0, 0.7137255, 1, 1,
0.1652635, 0.3374091, 0.5893615, 0, 0.7058824, 1, 1,
0.1671441, 0.4153194, 0.2274859, 0, 0.6980392, 1, 1,
0.1771014, -1.022512, 2.178188, 0, 0.6941177, 1, 1,
0.1798035, -0.335075, 2.362776, 0, 0.6862745, 1, 1,
0.1814663, 1.201935, -1.454386, 0, 0.682353, 1, 1,
0.1855703, 0.3207164, 1.164229, 0, 0.6745098, 1, 1,
0.1881807, 0.2895051, 0.8561716, 0, 0.6705883, 1, 1,
0.1947639, -0.1718045, 0.6160541, 0, 0.6627451, 1, 1,
0.1958066, -1.15747, 4.956739, 0, 0.6588235, 1, 1,
0.1972737, -0.1810899, 1.189161, 0, 0.6509804, 1, 1,
0.1999988, -0.6405638, 2.92025, 0, 0.6470588, 1, 1,
0.2042746, 1.729796, -1.753978, 0, 0.6392157, 1, 1,
0.2114086, 1.090072, -0.4809937, 0, 0.6352941, 1, 1,
0.2122883, 0.6201071, -0.3527797, 0, 0.627451, 1, 1,
0.2141815, 0.8083085, 0.4069544, 0, 0.6235294, 1, 1,
0.2161809, 0.4949318, 1.216211, 0, 0.6156863, 1, 1,
0.2176676, 0.9613555, -0.3386599, 0, 0.6117647, 1, 1,
0.2185394, -0.4303826, 3.147923, 0, 0.6039216, 1, 1,
0.2207011, 0.3890098, 0.6386407, 0, 0.5960785, 1, 1,
0.2254173, 1.802673, -1.909819, 0, 0.5921569, 1, 1,
0.2256175, -1.37942, 4.432794, 0, 0.5843138, 1, 1,
0.2272096, 1.400232, -1.249521, 0, 0.5803922, 1, 1,
0.2274399, 0.1288086, 0.6448589, 0, 0.572549, 1, 1,
0.2287584, 1.195168, 0.1941576, 0, 0.5686275, 1, 1,
0.2325557, 0.7121768, 0.1862407, 0, 0.5607843, 1, 1,
0.2359043, -1.651915, 3.884055, 0, 0.5568628, 1, 1,
0.2369063, -0.3060856, 2.705729, 0, 0.5490196, 1, 1,
0.2389919, 0.809812, -0.1316374, 0, 0.5450981, 1, 1,
0.2393621, -2.011469, 1.201085, 0, 0.5372549, 1, 1,
0.2395896, -0.5617676, 2.177059, 0, 0.5333334, 1, 1,
0.2408503, -1.375236, 3.948831, 0, 0.5254902, 1, 1,
0.2412874, 0.4781064, 0.1069942, 0, 0.5215687, 1, 1,
0.2426557, 1.658067, 0.9442414, 0, 0.5137255, 1, 1,
0.2463258, -0.6277834, 2.000498, 0, 0.509804, 1, 1,
0.2506948, -1.077674, 3.548367, 0, 0.5019608, 1, 1,
0.254146, -0.5440786, 2.526207, 0, 0.4941176, 1, 1,
0.2554442, -1.150382, 2.519348, 0, 0.4901961, 1, 1,
0.2564293, -0.5079347, 3.594569, 0, 0.4823529, 1, 1,
0.2573094, 0.7849907, -0.2337807, 0, 0.4784314, 1, 1,
0.2591399, 1.343125, -0.4869811, 0, 0.4705882, 1, 1,
0.2592524, -0.1650991, 1.348974, 0, 0.4666667, 1, 1,
0.2634863, 0.4717284, 1.576069, 0, 0.4588235, 1, 1,
0.2635166, 0.003802981, 0.9858267, 0, 0.454902, 1, 1,
0.2666748, -0.9105821, 1.948107, 0, 0.4470588, 1, 1,
0.2671288, 2.341067, -0.4889527, 0, 0.4431373, 1, 1,
0.2683091, 0.8954346, 0.423399, 0, 0.4352941, 1, 1,
0.2687527, -1.002312, 2.98978, 0, 0.4313726, 1, 1,
0.2694266, -0.4066098, 2.223392, 0, 0.4235294, 1, 1,
0.2696601, 0.3762197, -0.1630454, 0, 0.4196078, 1, 1,
0.2747442, 0.646783, 1.017751, 0, 0.4117647, 1, 1,
0.2800166, 1.436189, -0.5921642, 0, 0.4078431, 1, 1,
0.2814896, 0.5089939, 1.153502, 0, 0.4, 1, 1,
0.2825981, 0.09607472, 0.4319859, 0, 0.3921569, 1, 1,
0.283355, -1.705294, 1.672081, 0, 0.3882353, 1, 1,
0.2859482, 1.571446, -0.6159238, 0, 0.3803922, 1, 1,
0.2868381, 0.2902171, 0.2367431, 0, 0.3764706, 1, 1,
0.2886516, 1.878527, 0.7335963, 0, 0.3686275, 1, 1,
0.289275, 0.2488368, 0.9640613, 0, 0.3647059, 1, 1,
0.2942196, 1.18854, 1.258741, 0, 0.3568628, 1, 1,
0.3035655, 0.01363346, 2.176682, 0, 0.3529412, 1, 1,
0.3084502, -1.495703, 3.132942, 0, 0.345098, 1, 1,
0.3086961, -1.207804, 3.017572, 0, 0.3411765, 1, 1,
0.3091156, -0.3954206, 2.923594, 0, 0.3333333, 1, 1,
0.316946, -0.7184839, 1.272253, 0, 0.3294118, 1, 1,
0.3194506, 1.351843, -0.9971946, 0, 0.3215686, 1, 1,
0.3214785, -0.1598591, 2.206841, 0, 0.3176471, 1, 1,
0.3223746, -0.1995566, 1.756323, 0, 0.3098039, 1, 1,
0.3230044, 1.424725, 0.8117715, 0, 0.3058824, 1, 1,
0.3234743, -0.8081762, 3.367975, 0, 0.2980392, 1, 1,
0.3350192, 1.343529, -0.485506, 0, 0.2901961, 1, 1,
0.3390121, 1.526906, 0.9063656, 0, 0.2862745, 1, 1,
0.350159, -2.760488, 3.496503, 0, 0.2784314, 1, 1,
0.3551788, -0.4803564, 2.031281, 0, 0.2745098, 1, 1,
0.3561971, 0.8740582, 0.2289438, 0, 0.2666667, 1, 1,
0.3566644, 0.2307755, 0.3377032, 0, 0.2627451, 1, 1,
0.3580103, 0.7785097, -0.7036788, 0, 0.254902, 1, 1,
0.3588492, 0.5745148, -0.5524981, 0, 0.2509804, 1, 1,
0.3613961, 0.9160339, -1.893729, 0, 0.2431373, 1, 1,
0.3624179, -0.3114689, 2.503201, 0, 0.2392157, 1, 1,
0.3633032, -0.520945, 3.084063, 0, 0.2313726, 1, 1,
0.3656404, 1.5822, -0.8904665, 0, 0.227451, 1, 1,
0.3668019, -1.061464, 2.098314, 0, 0.2196078, 1, 1,
0.3689727, 0.1869374, 0.05143525, 0, 0.2156863, 1, 1,
0.3741652, 2.015526, 0.2443058, 0, 0.2078431, 1, 1,
0.37838, -0.1517913, 3.242375, 0, 0.2039216, 1, 1,
0.3785359, 0.16872, 0.9452797, 0, 0.1960784, 1, 1,
0.3859831, -0.8670306, 4.377602, 0, 0.1882353, 1, 1,
0.3864164, -0.3515787, 2.170329, 0, 0.1843137, 1, 1,
0.3880712, 0.05700974, 1.506347, 0, 0.1764706, 1, 1,
0.3922306, -1.067419, 3.064385, 0, 0.172549, 1, 1,
0.3939463, -0.1726305, 2.047345, 0, 0.1647059, 1, 1,
0.3996761, 0.1347795, 1.393045, 0, 0.1607843, 1, 1,
0.4017334, 0.7833586, 1.716622, 0, 0.1529412, 1, 1,
0.4026697, 0.3066868, 1.953014, 0, 0.1490196, 1, 1,
0.4026737, 0.754815, 1.358904, 0, 0.1411765, 1, 1,
0.4176821, 0.06867424, 2.660466, 0, 0.1372549, 1, 1,
0.4177947, 0.6882226, 0.6078019, 0, 0.1294118, 1, 1,
0.4200668, -0.6795509, 0.9900819, 0, 0.1254902, 1, 1,
0.4203152, -2.013098, 4.885123, 0, 0.1176471, 1, 1,
0.4212271, -1.659288, 4.436667, 0, 0.1137255, 1, 1,
0.4234962, 1.511709, -1.571919, 0, 0.1058824, 1, 1,
0.428987, 0.8282387, 0.6993261, 0, 0.09803922, 1, 1,
0.4290461, 0.4714833, 1.535102, 0, 0.09411765, 1, 1,
0.4314325, 0.4714358, -0.3977155, 0, 0.08627451, 1, 1,
0.4333058, -0.1544351, 1.534322, 0, 0.08235294, 1, 1,
0.4340205, 0.3615744, 2.527319, 0, 0.07450981, 1, 1,
0.4340719, 0.1595059, 2.265016, 0, 0.07058824, 1, 1,
0.435556, -0.01538637, 0.8003172, 0, 0.0627451, 1, 1,
0.4360791, 0.5981017, 0.7176444, 0, 0.05882353, 1, 1,
0.436757, -0.5220568, -0.6254305, 0, 0.05098039, 1, 1,
0.4389643, -0.6529651, 0.9777083, 0, 0.04705882, 1, 1,
0.4470145, 0.485411, -0.1447679, 0, 0.03921569, 1, 1,
0.4478044, -2.197202, 2.962895, 0, 0.03529412, 1, 1,
0.4491474, -1.090589, 1.671203, 0, 0.02745098, 1, 1,
0.4497107, 0.6661081, 0.922232, 0, 0.02352941, 1, 1,
0.4505858, 0.2221418, -1.142887, 0, 0.01568628, 1, 1,
0.4521741, -0.548947, 2.897899, 0, 0.01176471, 1, 1,
0.4587716, -0.3028283, 2.167847, 0, 0.003921569, 1, 1,
0.4591836, 0.00679139, -1.141042, 0.003921569, 0, 1, 1,
0.4606688, 0.6081653, 1.329662, 0.007843138, 0, 1, 1,
0.4714454, -1.106638, 2.696569, 0.01568628, 0, 1, 1,
0.4797409, -0.8814715, 1.109196, 0.01960784, 0, 1, 1,
0.4797892, -0.9235021, 3.545864, 0.02745098, 0, 1, 1,
0.4835762, 1.232651, 0.6775427, 0.03137255, 0, 1, 1,
0.4853555, -0.6384201, 2.805342, 0.03921569, 0, 1, 1,
0.4865389, 1.353914, 0.8289168, 0.04313726, 0, 1, 1,
0.488187, -1.081855, 3.010611, 0.05098039, 0, 1, 1,
0.4889217, -0.9988837, 1.729657, 0.05490196, 0, 1, 1,
0.4954484, 0.1863212, 0.5631245, 0.0627451, 0, 1, 1,
0.4956939, 0.8152862, -1.065235, 0.06666667, 0, 1, 1,
0.496514, 1.658359, 0.6213032, 0.07450981, 0, 1, 1,
0.4968527, 0.006696843, 2.784686, 0.07843138, 0, 1, 1,
0.4988548, -2.463763, 2.144472, 0.08627451, 0, 1, 1,
0.5005608, -0.2200554, 2.031159, 0.09019608, 0, 1, 1,
0.5011563, 0.8878195, -0.1495625, 0.09803922, 0, 1, 1,
0.501348, -1.889015, 3.681489, 0.1058824, 0, 1, 1,
0.501846, 0.8802411, 0.5738713, 0.1098039, 0, 1, 1,
0.5023239, 0.7654215, 2.082771, 0.1176471, 0, 1, 1,
0.5038652, -0.4963636, 1.059744, 0.1215686, 0, 1, 1,
0.5048231, 1.668422, 0.01358793, 0.1294118, 0, 1, 1,
0.5099962, 0.3289591, 1.700777, 0.1333333, 0, 1, 1,
0.5102564, -0.566111, 2.763944, 0.1411765, 0, 1, 1,
0.5134275, 0.1786838, 2.410252, 0.145098, 0, 1, 1,
0.5144241, -1.322741, 4.498819, 0.1529412, 0, 1, 1,
0.5185033, -0.8533918, 2.639097, 0.1568628, 0, 1, 1,
0.5208449, -0.9328539, 1.66941, 0.1647059, 0, 1, 1,
0.5265104, -0.2086615, 1.706202, 0.1686275, 0, 1, 1,
0.5271744, 0.6662567, 0.3461718, 0.1764706, 0, 1, 1,
0.529262, -0.7744547, -0.3187355, 0.1803922, 0, 1, 1,
0.5380217, -0.4387043, 0.8460993, 0.1882353, 0, 1, 1,
0.5422128, 0.9115663, -1.306329, 0.1921569, 0, 1, 1,
0.5425811, 0.8487395, -0.2303801, 0.2, 0, 1, 1,
0.543907, 1.261712, -0.6949854, 0.2078431, 0, 1, 1,
0.5439519, 0.5862241, 2.147136, 0.2117647, 0, 1, 1,
0.5452023, 1.326766, 0.1058547, 0.2196078, 0, 1, 1,
0.5466912, -0.3102544, 1.129056, 0.2235294, 0, 1, 1,
0.5500439, -1.446286, 1.502988, 0.2313726, 0, 1, 1,
0.551652, -0.3802083, 2.944278, 0.2352941, 0, 1, 1,
0.5555233, 1.101418, 0.2111204, 0.2431373, 0, 1, 1,
0.5561263, 0.5871077, 0.5520015, 0.2470588, 0, 1, 1,
0.5588306, -0.07915756, 3.17287, 0.254902, 0, 1, 1,
0.5654867, 0.02829385, 0.6941636, 0.2588235, 0, 1, 1,
0.5672784, -0.5368025, 2.452324, 0.2666667, 0, 1, 1,
0.5704895, -0.001574069, 0.3036737, 0.2705882, 0, 1, 1,
0.5704969, -1.56499, 2.950887, 0.2784314, 0, 1, 1,
0.5714301, 1.263084, -0.1554226, 0.282353, 0, 1, 1,
0.5716926, -0.3769281, 1.726549, 0.2901961, 0, 1, 1,
0.5859906, 1.154512, 0.9168019, 0.2941177, 0, 1, 1,
0.5863772, 0.638571, 0.1204916, 0.3019608, 0, 1, 1,
0.5898762, -0.5599872, 2.438187, 0.3098039, 0, 1, 1,
0.5936108, -0.1095185, 1.908021, 0.3137255, 0, 1, 1,
0.5972698, 0.2904692, 1.588522, 0.3215686, 0, 1, 1,
0.5990164, -0.0162161, 0.2203898, 0.3254902, 0, 1, 1,
0.6050367, -0.3939314, 1.045628, 0.3333333, 0, 1, 1,
0.6084384, 0.7433829, 0.4664133, 0.3372549, 0, 1, 1,
0.6133463, -0.6989031, 2.228421, 0.345098, 0, 1, 1,
0.6175979, 0.4835655, 1.168703, 0.3490196, 0, 1, 1,
0.6230598, -0.2941102, 1.869322, 0.3568628, 0, 1, 1,
0.6248322, 0.5352445, 2.139038, 0.3607843, 0, 1, 1,
0.630141, -0.7860393, 0.8068115, 0.3686275, 0, 1, 1,
0.6356272, -0.3094746, 1.787322, 0.372549, 0, 1, 1,
0.6373059, 0.8979998, 0.4652608, 0.3803922, 0, 1, 1,
0.6424358, 0.09150559, 1.31893, 0.3843137, 0, 1, 1,
0.6494653, -1.795373, 3.706687, 0.3921569, 0, 1, 1,
0.6513858, 0.8659209, 0.387471, 0.3960784, 0, 1, 1,
0.6520823, -0.07528867, 0.1143016, 0.4039216, 0, 1, 1,
0.6540335, -0.9136132, 1.452414, 0.4117647, 0, 1, 1,
0.654864, -2.333979, 2.615571, 0.4156863, 0, 1, 1,
0.6549229, 0.1694467, 1.331931, 0.4235294, 0, 1, 1,
0.6565174, 1.522401, 0.8190672, 0.427451, 0, 1, 1,
0.6632266, 0.6819568, 2.473509, 0.4352941, 0, 1, 1,
0.6687394, -0.8352118, 0.5368348, 0.4392157, 0, 1, 1,
0.6694115, 0.1207551, 1.741138, 0.4470588, 0, 1, 1,
0.6705127, 1.327267, 0.057294, 0.4509804, 0, 1, 1,
0.6787453, -0.7739136, 3.811147, 0.4588235, 0, 1, 1,
0.6798948, 0.2701446, -0.1752999, 0.4627451, 0, 1, 1,
0.6803872, 0.2930029, 1.628582, 0.4705882, 0, 1, 1,
0.6832022, 0.4114918, -0.1152265, 0.4745098, 0, 1, 1,
0.6851638, 2.911324, 0.8794692, 0.4823529, 0, 1, 1,
0.6885107, 1.38732, 3.335179, 0.4862745, 0, 1, 1,
0.6994351, 0.1891107, -1.995027, 0.4941176, 0, 1, 1,
0.7046208, 0.3129645, -0.3768529, 0.5019608, 0, 1, 1,
0.7055188, 0.4743401, 1.716984, 0.5058824, 0, 1, 1,
0.7073192, 1.306547, 2.093945, 0.5137255, 0, 1, 1,
0.7100582, -0.4528684, 2.715617, 0.5176471, 0, 1, 1,
0.7195343, 2.565105, -1.908966, 0.5254902, 0, 1, 1,
0.72342, 0.1123559, 1.445267, 0.5294118, 0, 1, 1,
0.7289847, -1.311716, 1.090502, 0.5372549, 0, 1, 1,
0.7298399, -0.2601995, 0.8803431, 0.5411765, 0, 1, 1,
0.7300189, -1.326233, 3.441143, 0.5490196, 0, 1, 1,
0.7314225, -0.4103647, 2.339433, 0.5529412, 0, 1, 1,
0.734503, 0.450213, 0.9721979, 0.5607843, 0, 1, 1,
0.7351291, -0.3155385, 0.4258139, 0.5647059, 0, 1, 1,
0.7365925, -1.031629, 1.458292, 0.572549, 0, 1, 1,
0.7425729, -1.789975, 0.945902, 0.5764706, 0, 1, 1,
0.7428289, 0.07950655, 1.832156, 0.5843138, 0, 1, 1,
0.7469575, 1.024091, 0.04857849, 0.5882353, 0, 1, 1,
0.7564, 0.2733932, 1.821156, 0.5960785, 0, 1, 1,
0.7678565, -0.08379409, 1.629863, 0.6039216, 0, 1, 1,
0.7724779, 0.589488, 2.197488, 0.6078432, 0, 1, 1,
0.7736207, 1.284477, 2.280751, 0.6156863, 0, 1, 1,
0.7743152, -0.7868474, 1.387521, 0.6196079, 0, 1, 1,
0.776405, 0.8698556, 1.54303, 0.627451, 0, 1, 1,
0.7817874, 0.1418511, 0.1460835, 0.6313726, 0, 1, 1,
0.7876883, -0.6169147, 3.94183, 0.6392157, 0, 1, 1,
0.789409, 1.589587, 1.282808, 0.6431373, 0, 1, 1,
0.7897717, 0.3461131, 0.9007554, 0.6509804, 0, 1, 1,
0.7967773, -0.1274467, -0.2091883, 0.654902, 0, 1, 1,
0.7986062, -1.182905, 2.721117, 0.6627451, 0, 1, 1,
0.799185, 0.07341751, -0.02018026, 0.6666667, 0, 1, 1,
0.8082564, 0.7136149, 0.6793921, 0.6745098, 0, 1, 1,
0.8099248, -1.296616, 4.443711, 0.6784314, 0, 1, 1,
0.8102968, 2.424808, -1.49731, 0.6862745, 0, 1, 1,
0.8142054, 0.7878635, 1.760623, 0.6901961, 0, 1, 1,
0.8142757, 0.1340977, 2.610345, 0.6980392, 0, 1, 1,
0.8151262, -1.301628, 2.089699, 0.7058824, 0, 1, 1,
0.8232035, 1.687458, 0.5307007, 0.7098039, 0, 1, 1,
0.8234648, 1.319718, -0.01501905, 0.7176471, 0, 1, 1,
0.8262019, -0.4872031, 1.012165, 0.7215686, 0, 1, 1,
0.8265218, -1.456569, 2.732719, 0.7294118, 0, 1, 1,
0.8273521, -0.01878055, 0.9777811, 0.7333333, 0, 1, 1,
0.8308672, -0.3727751, 2.160062, 0.7411765, 0, 1, 1,
0.8333252, 1.031024, 2.52278, 0.7450981, 0, 1, 1,
0.835095, 0.08181612, 0.3757626, 0.7529412, 0, 1, 1,
0.8406753, 0.13523, 1.106882, 0.7568628, 0, 1, 1,
0.8408537, 0.3241256, 1.438937, 0.7647059, 0, 1, 1,
0.8426619, -0.3478107, 0.2022776, 0.7686275, 0, 1, 1,
0.8486074, 0.01711953, 1.489698, 0.7764706, 0, 1, 1,
0.8557603, 3.587305, 2.148223, 0.7803922, 0, 1, 1,
0.8559008, 1.206236, 0.5520309, 0.7882353, 0, 1, 1,
0.8581411, 0.4148463, 1.317628, 0.7921569, 0, 1, 1,
0.8635853, 0.1976155, 0.3601237, 0.8, 0, 1, 1,
0.8664224, -0.390322, 0.7510337, 0.8078431, 0, 1, 1,
0.8758708, -0.3841262, 2.774519, 0.8117647, 0, 1, 1,
0.8760076, 1.464118, -1.537667, 0.8196079, 0, 1, 1,
0.8777823, 1.197492, 0.653513, 0.8235294, 0, 1, 1,
0.8811502, 1.012784, 0.3628176, 0.8313726, 0, 1, 1,
0.8823277, -0.1467559, 2.145379, 0.8352941, 0, 1, 1,
0.8827296, 0.6980188, 0.1335077, 0.8431373, 0, 1, 1,
0.8830105, 0.4450292, 1.837342, 0.8470588, 0, 1, 1,
0.8946858, 0.1374987, -0.2990334, 0.854902, 0, 1, 1,
0.8968317, -0.1167808, 0.2313302, 0.8588235, 0, 1, 1,
0.8995013, -0.7570271, 2.541343, 0.8666667, 0, 1, 1,
0.9009925, -0.2660961, 0.3042088, 0.8705882, 0, 1, 1,
0.9023564, -0.4640527, 1.631445, 0.8784314, 0, 1, 1,
0.906442, -1.300432, 1.373643, 0.8823529, 0, 1, 1,
0.9084411, -0.9768568, 2.931759, 0.8901961, 0, 1, 1,
0.9142796, 1.548515, 0.7451059, 0.8941177, 0, 1, 1,
0.9152098, 0.02344594, 1.302103, 0.9019608, 0, 1, 1,
0.9176884, 1.105834, -0.339924, 0.9098039, 0, 1, 1,
0.9227446, -0.748697, 2.502544, 0.9137255, 0, 1, 1,
0.9246347, -0.880441, 1.026538, 0.9215686, 0, 1, 1,
0.9278065, -1.908798, 4.085664, 0.9254902, 0, 1, 1,
0.9282156, 0.7133548, 0.9728864, 0.9333333, 0, 1, 1,
0.9283011, 0.2503622, 4.067138, 0.9372549, 0, 1, 1,
0.932757, 0.1877959, 1.572102, 0.945098, 0, 1, 1,
0.9336239, 0.7276994, 0.7899598, 0.9490196, 0, 1, 1,
0.9352382, -0.7686266, 1.710001, 0.9568627, 0, 1, 1,
0.9396534, 0.6175705, -0.09570716, 0.9607843, 0, 1, 1,
0.9400397, -0.7479185, 2.69214, 0.9686275, 0, 1, 1,
0.9409032, -0.718787, 0.9088982, 0.972549, 0, 1, 1,
0.9440849, 0.3140401, 0.6604038, 0.9803922, 0, 1, 1,
0.9520795, -1.938115, 2.671821, 0.9843137, 0, 1, 1,
0.9524705, -0.1043696, 2.697899, 0.9921569, 0, 1, 1,
0.9759982, 0.135178, 2.731928, 0.9960784, 0, 1, 1,
0.9871069, -0.4812115, 0.5048305, 1, 0, 0.9960784, 1,
0.9891204, -0.5462378, 0.9292625, 1, 0, 0.9882353, 1,
0.9913676, -0.219109, 0.8814201, 1, 0, 0.9843137, 1,
0.9940832, 0.2637115, 2.695774, 1, 0, 0.9764706, 1,
0.999021, -0.631862, -0.3311312, 1, 0, 0.972549, 1,
0.9998519, 0.685581, 1.120347, 1, 0, 0.9647059, 1,
1.009928, -0.5320087, 1.772052, 1, 0, 0.9607843, 1,
1.011882, 1.833893, 0.01995674, 1, 0, 0.9529412, 1,
1.015828, 0.2405577, 0.6551731, 1, 0, 0.9490196, 1,
1.016829, -0.8784076, 3.656752, 1, 0, 0.9411765, 1,
1.017391, 0.4683984, 1.249489, 1, 0, 0.9372549, 1,
1.017615, -0.448846, 1.685139, 1, 0, 0.9294118, 1,
1.018634, 1.277563, -0.9374589, 1, 0, 0.9254902, 1,
1.033483, -0.6232361, 2.287267, 1, 0, 0.9176471, 1,
1.041512, -1.264608, 4.035601, 1, 0, 0.9137255, 1,
1.050923, 0.3540912, 1.710421, 1, 0, 0.9058824, 1,
1.055628, -1.418779, 3.815578, 1, 0, 0.9019608, 1,
1.056028, 2.128155, -0.8304829, 1, 0, 0.8941177, 1,
1.057691, 0.8826875, -1.565955, 1, 0, 0.8862745, 1,
1.059973, -0.6129398, 1.528291, 1, 0, 0.8823529, 1,
1.0613, 0.8352487, 1.822369, 1, 0, 0.8745098, 1,
1.061378, 0.63866, 1.241203, 1, 0, 0.8705882, 1,
1.079437, 1.152649, 0.8981086, 1, 0, 0.8627451, 1,
1.079581, 0.8749233, 2.43745, 1, 0, 0.8588235, 1,
1.084324, -0.5455268, 2.673669, 1, 0, 0.8509804, 1,
1.089336, 1.136321, 0.7638204, 1, 0, 0.8470588, 1,
1.09457, 0.2523797, 0.01299887, 1, 0, 0.8392157, 1,
1.096471, -0.2556749, 1.685048, 1, 0, 0.8352941, 1,
1.100449, 0.2248208, 2.171435, 1, 0, 0.827451, 1,
1.1028, -0.165215, 1.43346, 1, 0, 0.8235294, 1,
1.102941, -0.4412672, 3.676117, 1, 0, 0.8156863, 1,
1.103998, -0.7873107, 4.719217, 1, 0, 0.8117647, 1,
1.109663, 0.5257479, 2.45605, 1, 0, 0.8039216, 1,
1.113054, -0.1092166, 0.5793566, 1, 0, 0.7960784, 1,
1.124909, 0.005889999, 1.392563, 1, 0, 0.7921569, 1,
1.127386, 0.6065631, 1.614215, 1, 0, 0.7843137, 1,
1.127483, 0.3903952, -1.40593, 1, 0, 0.7803922, 1,
1.128995, 0.8072029, 0.3957386, 1, 0, 0.772549, 1,
1.129631, 0.8212896, 2.201993, 1, 0, 0.7686275, 1,
1.132642, 0.8965822, 2.174296, 1, 0, 0.7607843, 1,
1.141031, -0.6009535, 1.696562, 1, 0, 0.7568628, 1,
1.144614, -1.892797, 1.927981, 1, 0, 0.7490196, 1,
1.144904, 0.2756703, -0.05268446, 1, 0, 0.7450981, 1,
1.15183, 0.7648, 0.7231902, 1, 0, 0.7372549, 1,
1.165538, 1.258738, -0.3055515, 1, 0, 0.7333333, 1,
1.165932, -2.36377, 2.22384, 1, 0, 0.7254902, 1,
1.174752, 0.2821421, 1.819207, 1, 0, 0.7215686, 1,
1.181895, -1.273833, 3.855284, 1, 0, 0.7137255, 1,
1.183289, 0.3369192, 2.149314, 1, 0, 0.7098039, 1,
1.190529, 1.293684, 0.2372611, 1, 0, 0.7019608, 1,
1.191108, -0.2198921, 0.8168434, 1, 0, 0.6941177, 1,
1.191794, -0.04561939, 3.275787, 1, 0, 0.6901961, 1,
1.1929, -0.8412079, 3.01404, 1, 0, 0.682353, 1,
1.197516, -0.945619, 2.821476, 1, 0, 0.6784314, 1,
1.199297, -1.06443, 2.186238, 1, 0, 0.6705883, 1,
1.199968, 1.097319, 0.502257, 1, 0, 0.6666667, 1,
1.202453, 0.4855403, 1.822619, 1, 0, 0.6588235, 1,
1.208993, 0.9298995, 1.292401, 1, 0, 0.654902, 1,
1.215247, 0.0353505, 1.424061, 1, 0, 0.6470588, 1,
1.218627, 0.031949, 1.392261, 1, 0, 0.6431373, 1,
1.235564, -0.01116611, 0.4729486, 1, 0, 0.6352941, 1,
1.252195, -2.024328, 3.622618, 1, 0, 0.6313726, 1,
1.254457, 0.08639842, 1.801472, 1, 0, 0.6235294, 1,
1.260112, 1.335815, 1.864187, 1, 0, 0.6196079, 1,
1.266368, -0.7952309, 3.697281, 1, 0, 0.6117647, 1,
1.276896, -0.6918621, 2.272813, 1, 0, 0.6078432, 1,
1.279308, -0.2142237, 2.580581, 1, 0, 0.6, 1,
1.280391, 0.3567688, 2.43794, 1, 0, 0.5921569, 1,
1.281107, 0.2452525, 2.485151, 1, 0, 0.5882353, 1,
1.284084, 1.483989, 2.582942, 1, 0, 0.5803922, 1,
1.305665, 0.1293979, 1.458631, 1, 0, 0.5764706, 1,
1.308794, -0.3524702, 1.128433, 1, 0, 0.5686275, 1,
1.310229, -1.90397, 2.655744, 1, 0, 0.5647059, 1,
1.311499, -1.409205, 0.7030009, 1, 0, 0.5568628, 1,
1.312905, -0.3107977, 1.815888, 1, 0, 0.5529412, 1,
1.317396, 1.816301, 1.802518, 1, 0, 0.5450981, 1,
1.329527, -0.201655, 3.063186, 1, 0, 0.5411765, 1,
1.32985, 0.2553504, 1.697915, 1, 0, 0.5333334, 1,
1.330415, 1.136764, -0.7992858, 1, 0, 0.5294118, 1,
1.330653, 0.4253188, 3.651713, 1, 0, 0.5215687, 1,
1.33584, 0.002200189, 1.509313, 1, 0, 0.5176471, 1,
1.336069, -0.152069, 1.24333, 1, 0, 0.509804, 1,
1.345583, -1.199729, 3.438648, 1, 0, 0.5058824, 1,
1.350173, 1.045839, 2.127115, 1, 0, 0.4980392, 1,
1.358855, -1.851208, 1.878252, 1, 0, 0.4901961, 1,
1.360258, -0.7260271, 1.902017, 1, 0, 0.4862745, 1,
1.37069, -0.8759731, 0.2794273, 1, 0, 0.4784314, 1,
1.377783, 0.07031324, 2.49363, 1, 0, 0.4745098, 1,
1.38911, -3.208888, 2.288749, 1, 0, 0.4666667, 1,
1.390552, 0.7850661, -0.3848713, 1, 0, 0.4627451, 1,
1.393847, -0.2848743, 2.080398, 1, 0, 0.454902, 1,
1.394662, -0.8048956, 2.498532, 1, 0, 0.4509804, 1,
1.397343, 0.8718487, 1.626492, 1, 0, 0.4431373, 1,
1.399663, -0.3161331, 1.235876, 1, 0, 0.4392157, 1,
1.406836, 0.4710906, 1.233816, 1, 0, 0.4313726, 1,
1.409237, 0.5416375, 1.786125, 1, 0, 0.427451, 1,
1.415967, 1.428582, 0.857201, 1, 0, 0.4196078, 1,
1.417627, -0.8248302, 0.67161, 1, 0, 0.4156863, 1,
1.417635, 0.9591841, 2.116425, 1, 0, 0.4078431, 1,
1.424407, 0.8827749, 1.30171, 1, 0, 0.4039216, 1,
1.425099, -0.04921758, 1.043062, 1, 0, 0.3960784, 1,
1.469542, 0.03652606, 1.569702, 1, 0, 0.3882353, 1,
1.47093, 1.017195, 0.5380271, 1, 0, 0.3843137, 1,
1.4712, -1.914723, 3.085171, 1, 0, 0.3764706, 1,
1.474612, -1.043727, 2.703831, 1, 0, 0.372549, 1,
1.490114, -0.2610206, -0.4183482, 1, 0, 0.3647059, 1,
1.496401, 1.804835, 1.385287, 1, 0, 0.3607843, 1,
1.506201, 0.4405107, 1.5661, 1, 0, 0.3529412, 1,
1.507105, 0.02902355, 3.281578, 1, 0, 0.3490196, 1,
1.507419, 1.19988, -0.1038299, 1, 0, 0.3411765, 1,
1.507687, -2.989593, 2.89339, 1, 0, 0.3372549, 1,
1.519507, -0.5431392, 3.341171, 1, 0, 0.3294118, 1,
1.536977, -0.7559094, 1.89511, 1, 0, 0.3254902, 1,
1.541062, 0.4623224, 0.243886, 1, 0, 0.3176471, 1,
1.552285, -0.8999236, 1.116429, 1, 0, 0.3137255, 1,
1.570531, -0.7105633, 1.750208, 1, 0, 0.3058824, 1,
1.571196, 0.4114174, 2.576375, 1, 0, 0.2980392, 1,
1.572793, -0.5555645, 2.906889, 1, 0, 0.2941177, 1,
1.586963, 0.4779439, 0.9016939, 1, 0, 0.2862745, 1,
1.594289, -1.547349, 2.081656, 1, 0, 0.282353, 1,
1.598949, 2.191714, 2.360626, 1, 0, 0.2745098, 1,
1.605645, 0.9988915, -0.383566, 1, 0, 0.2705882, 1,
1.61228, 0.8148335, 3.13386, 1, 0, 0.2627451, 1,
1.615131, 0.8579477, 2.290134, 1, 0, 0.2588235, 1,
1.617814, 0.8464078, 2.722514, 1, 0, 0.2509804, 1,
1.621978, 1.495096, -0.8517919, 1, 0, 0.2470588, 1,
1.622924, 1.250019, 2.32567, 1, 0, 0.2392157, 1,
1.626576, -2.493208, 2.729488, 1, 0, 0.2352941, 1,
1.649038, -0.8643619, 4.223939, 1, 0, 0.227451, 1,
1.66527, -0.01444572, 1.52754, 1, 0, 0.2235294, 1,
1.676042, -3.369953, 4.133704, 1, 0, 0.2156863, 1,
1.74163, -0.6545637, 3.404121, 1, 0, 0.2117647, 1,
1.74381, 0.2833216, 0.6924822, 1, 0, 0.2039216, 1,
1.745145, -0.3679483, 2.933435, 1, 0, 0.1960784, 1,
1.753327, -0.3537557, 2.462304, 1, 0, 0.1921569, 1,
1.762764, -1.583299, 1.465876, 1, 0, 0.1843137, 1,
1.786397, 0.09896685, 1.814788, 1, 0, 0.1803922, 1,
1.799537, -0.3336553, 1.633457, 1, 0, 0.172549, 1,
1.800219, -0.02472383, 1.366241, 1, 0, 0.1686275, 1,
1.867729, -0.4441521, 1.458004, 1, 0, 0.1607843, 1,
1.885247, 1.701772, -1.463147, 1, 0, 0.1568628, 1,
1.891949, -1.464532, 2.00517, 1, 0, 0.1490196, 1,
1.900881, 0.4525678, 1.178066, 1, 0, 0.145098, 1,
1.941486, 1.049932, 2.448757, 1, 0, 0.1372549, 1,
1.955943, -1.389212, 1.884843, 1, 0, 0.1333333, 1,
1.956937, 0.4275222, -0.1778344, 1, 0, 0.1254902, 1,
1.97699, -0.693419, 0.2468199, 1, 0, 0.1215686, 1,
2.015502, -0.9008798, 2.374058, 1, 0, 0.1137255, 1,
2.030854, 0.2385426, 0.7370405, 1, 0, 0.1098039, 1,
2.032668, -0.4973983, 1.233509, 1, 0, 0.1019608, 1,
2.074428, -1.233532, 1.400898, 1, 0, 0.09411765, 1,
2.103893, -0.7188473, 1.950187, 1, 0, 0.09019608, 1,
2.104177, 0.44484, 1.049832, 1, 0, 0.08235294, 1,
2.129318, 0.9383482, 1.921609, 1, 0, 0.07843138, 1,
2.167364, -0.3477507, 1.795194, 1, 0, 0.07058824, 1,
2.167716, 1.349089, 0.9185316, 1, 0, 0.06666667, 1,
2.168844, 0.5619543, 0.4533035, 1, 0, 0.05882353, 1,
2.304847, 0.7353765, -0.07731678, 1, 0, 0.05490196, 1,
2.341535, 0.6647431, 2.078163, 1, 0, 0.04705882, 1,
2.347386, -2.542434, 2.345676, 1, 0, 0.04313726, 1,
2.38502, -0.4051019, 2.991011, 1, 0, 0.03529412, 1,
2.510853, -0.02577882, 2.320795, 1, 0, 0.03137255, 1,
2.542157, -0.08564247, -0.6816742, 1, 0, 0.02352941, 1,
2.777089, -1.025091, 1.475836, 1, 0, 0.01960784, 1,
2.931016, 1.921794, 2.355467, 1, 0, 0.01176471, 1,
3.232508, -1.493107, 2.201145, 1, 0, 0.007843138, 1
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
0.0710423, -4.549209, -7.03755, 0, -0.5, 0.5, 0.5,
0.0710423, -4.549209, -7.03755, 1, -0.5, 0.5, 0.5,
0.0710423, -4.549209, -7.03755, 1, 1.5, 0.5, 0.5,
0.0710423, -4.549209, -7.03755, 0, 1.5, 0.5, 0.5
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
-4.16216, 0.1086756, -7.03755, 0, -0.5, 0.5, 0.5,
-4.16216, 0.1086756, -7.03755, 1, -0.5, 0.5, 0.5,
-4.16216, 0.1086756, -7.03755, 1, 1.5, 0.5, 0.5,
-4.16216, 0.1086756, -7.03755, 0, 1.5, 0.5, 0.5
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
-4.16216, -4.549209, -0.1352806, 0, -0.5, 0.5, 0.5,
-4.16216, -4.549209, -0.1352806, 1, -0.5, 0.5, 0.5,
-4.16216, -4.549209, -0.1352806, 1, 1.5, 0.5, 0.5,
-4.16216, -4.549209, -0.1352806, 0, 1.5, 0.5, 0.5
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
-3, -3.474312, -5.444719,
3, -3.474312, -5.444719,
-3, -3.474312, -5.444719,
-3, -3.653462, -5.710191,
-2, -3.474312, -5.444719,
-2, -3.653462, -5.710191,
-1, -3.474312, -5.444719,
-1, -3.653462, -5.710191,
0, -3.474312, -5.444719,
0, -3.653462, -5.710191,
1, -3.474312, -5.444719,
1, -3.653462, -5.710191,
2, -3.474312, -5.444719,
2, -3.653462, -5.710191,
3, -3.474312, -5.444719,
3, -3.653462, -5.710191
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
-3, -4.01176, -6.241134, 0, -0.5, 0.5, 0.5,
-3, -4.01176, -6.241134, 1, -0.5, 0.5, 0.5,
-3, -4.01176, -6.241134, 1, 1.5, 0.5, 0.5,
-3, -4.01176, -6.241134, 0, 1.5, 0.5, 0.5,
-2, -4.01176, -6.241134, 0, -0.5, 0.5, 0.5,
-2, -4.01176, -6.241134, 1, -0.5, 0.5, 0.5,
-2, -4.01176, -6.241134, 1, 1.5, 0.5, 0.5,
-2, -4.01176, -6.241134, 0, 1.5, 0.5, 0.5,
-1, -4.01176, -6.241134, 0, -0.5, 0.5, 0.5,
-1, -4.01176, -6.241134, 1, -0.5, 0.5, 0.5,
-1, -4.01176, -6.241134, 1, 1.5, 0.5, 0.5,
-1, -4.01176, -6.241134, 0, 1.5, 0.5, 0.5,
0, -4.01176, -6.241134, 0, -0.5, 0.5, 0.5,
0, -4.01176, -6.241134, 1, -0.5, 0.5, 0.5,
0, -4.01176, -6.241134, 1, 1.5, 0.5, 0.5,
0, -4.01176, -6.241134, 0, 1.5, 0.5, 0.5,
1, -4.01176, -6.241134, 0, -0.5, 0.5, 0.5,
1, -4.01176, -6.241134, 1, -0.5, 0.5, 0.5,
1, -4.01176, -6.241134, 1, 1.5, 0.5, 0.5,
1, -4.01176, -6.241134, 0, 1.5, 0.5, 0.5,
2, -4.01176, -6.241134, 0, -0.5, 0.5, 0.5,
2, -4.01176, -6.241134, 1, -0.5, 0.5, 0.5,
2, -4.01176, -6.241134, 1, 1.5, 0.5, 0.5,
2, -4.01176, -6.241134, 0, 1.5, 0.5, 0.5,
3, -4.01176, -6.241134, 0, -0.5, 0.5, 0.5,
3, -4.01176, -6.241134, 1, -0.5, 0.5, 0.5,
3, -4.01176, -6.241134, 1, 1.5, 0.5, 0.5,
3, -4.01176, -6.241134, 0, 1.5, 0.5, 0.5
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
-3.185267, -3, -5.444719,
-3.185267, 3, -5.444719,
-3.185267, -3, -5.444719,
-3.348083, -3, -5.710191,
-3.185267, -2, -5.444719,
-3.348083, -2, -5.710191,
-3.185267, -1, -5.444719,
-3.348083, -1, -5.710191,
-3.185267, 0, -5.444719,
-3.348083, 0, -5.710191,
-3.185267, 1, -5.444719,
-3.348083, 1, -5.710191,
-3.185267, 2, -5.444719,
-3.348083, 2, -5.710191,
-3.185267, 3, -5.444719,
-3.348083, 3, -5.710191
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
-3.673714, -3, -6.241134, 0, -0.5, 0.5, 0.5,
-3.673714, -3, -6.241134, 1, -0.5, 0.5, 0.5,
-3.673714, -3, -6.241134, 1, 1.5, 0.5, 0.5,
-3.673714, -3, -6.241134, 0, 1.5, 0.5, 0.5,
-3.673714, -2, -6.241134, 0, -0.5, 0.5, 0.5,
-3.673714, -2, -6.241134, 1, -0.5, 0.5, 0.5,
-3.673714, -2, -6.241134, 1, 1.5, 0.5, 0.5,
-3.673714, -2, -6.241134, 0, 1.5, 0.5, 0.5,
-3.673714, -1, -6.241134, 0, -0.5, 0.5, 0.5,
-3.673714, -1, -6.241134, 1, -0.5, 0.5, 0.5,
-3.673714, -1, -6.241134, 1, 1.5, 0.5, 0.5,
-3.673714, -1, -6.241134, 0, 1.5, 0.5, 0.5,
-3.673714, 0, -6.241134, 0, -0.5, 0.5, 0.5,
-3.673714, 0, -6.241134, 1, -0.5, 0.5, 0.5,
-3.673714, 0, -6.241134, 1, 1.5, 0.5, 0.5,
-3.673714, 0, -6.241134, 0, 1.5, 0.5, 0.5,
-3.673714, 1, -6.241134, 0, -0.5, 0.5, 0.5,
-3.673714, 1, -6.241134, 1, -0.5, 0.5, 0.5,
-3.673714, 1, -6.241134, 1, 1.5, 0.5, 0.5,
-3.673714, 1, -6.241134, 0, 1.5, 0.5, 0.5,
-3.673714, 2, -6.241134, 0, -0.5, 0.5, 0.5,
-3.673714, 2, -6.241134, 1, -0.5, 0.5, 0.5,
-3.673714, 2, -6.241134, 1, 1.5, 0.5, 0.5,
-3.673714, 2, -6.241134, 0, 1.5, 0.5, 0.5,
-3.673714, 3, -6.241134, 0, -0.5, 0.5, 0.5,
-3.673714, 3, -6.241134, 1, -0.5, 0.5, 0.5,
-3.673714, 3, -6.241134, 1, 1.5, 0.5, 0.5,
-3.673714, 3, -6.241134, 0, 1.5, 0.5, 0.5
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
-3.185267, -3.474312, -4,
-3.185267, -3.474312, 4,
-3.185267, -3.474312, -4,
-3.348083, -3.653462, -4,
-3.185267, -3.474312, -2,
-3.348083, -3.653462, -2,
-3.185267, -3.474312, 0,
-3.348083, -3.653462, 0,
-3.185267, -3.474312, 2,
-3.348083, -3.653462, 2,
-3.185267, -3.474312, 4,
-3.348083, -3.653462, 4
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
-3.673714, -4.01176, -4, 0, -0.5, 0.5, 0.5,
-3.673714, -4.01176, -4, 1, -0.5, 0.5, 0.5,
-3.673714, -4.01176, -4, 1, 1.5, 0.5, 0.5,
-3.673714, -4.01176, -4, 0, 1.5, 0.5, 0.5,
-3.673714, -4.01176, -2, 0, -0.5, 0.5, 0.5,
-3.673714, -4.01176, -2, 1, -0.5, 0.5, 0.5,
-3.673714, -4.01176, -2, 1, 1.5, 0.5, 0.5,
-3.673714, -4.01176, -2, 0, 1.5, 0.5, 0.5,
-3.673714, -4.01176, 0, 0, -0.5, 0.5, 0.5,
-3.673714, -4.01176, 0, 1, -0.5, 0.5, 0.5,
-3.673714, -4.01176, 0, 1, 1.5, 0.5, 0.5,
-3.673714, -4.01176, 0, 0, 1.5, 0.5, 0.5,
-3.673714, -4.01176, 2, 0, -0.5, 0.5, 0.5,
-3.673714, -4.01176, 2, 1, -0.5, 0.5, 0.5,
-3.673714, -4.01176, 2, 1, 1.5, 0.5, 0.5,
-3.673714, -4.01176, 2, 0, 1.5, 0.5, 0.5,
-3.673714, -4.01176, 4, 0, -0.5, 0.5, 0.5,
-3.673714, -4.01176, 4, 1, -0.5, 0.5, 0.5,
-3.673714, -4.01176, 4, 1, 1.5, 0.5, 0.5,
-3.673714, -4.01176, 4, 0, 1.5, 0.5, 0.5
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
-3.185267, -3.474312, -5.444719,
-3.185267, 3.691664, -5.444719,
-3.185267, -3.474312, 5.174158,
-3.185267, 3.691664, 5.174158,
-3.185267, -3.474312, -5.444719,
-3.185267, -3.474312, 5.174158,
-3.185267, 3.691664, -5.444719,
-3.185267, 3.691664, 5.174158,
-3.185267, -3.474312, -5.444719,
3.327352, -3.474312, -5.444719,
-3.185267, -3.474312, 5.174158,
3.327352, -3.474312, 5.174158,
-3.185267, 3.691664, -5.444719,
3.327352, 3.691664, -5.444719,
-3.185267, 3.691664, 5.174158,
3.327352, 3.691664, 5.174158,
3.327352, -3.474312, -5.444719,
3.327352, 3.691664, -5.444719,
3.327352, -3.474312, 5.174158,
3.327352, 3.691664, 5.174158,
3.327352, -3.474312, -5.444719,
3.327352, -3.474312, 5.174158,
3.327352, 3.691664, -5.444719,
3.327352, 3.691664, 5.174158
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
var radius = 7.673841;
var distance = 34.14178;
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
mvMatrix.translate( -0.0710423, -0.1086756, 0.1352806 );
mvMatrix.scale( 1.274005, 1.157848, 0.7813545 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.14178);
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
fluorodifen<-read.table("fluorodifen.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fluorodifen$V2
```

```
## Error in eval(expr, envir, enclos): object 'fluorodifen' not found
```

```r
y<-fluorodifen$V3
```

```
## Error in eval(expr, envir, enclos): object 'fluorodifen' not found
```

```r
z<-fluorodifen$V4
```

```
## Error in eval(expr, envir, enclos): object 'fluorodifen' not found
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
-3.090423, 1.361555, -1.523088, 0, 0, 1, 1, 1,
-2.791266, 0.6213997, -0.7625173, 1, 0, 0, 1, 1,
-2.768856, -0.3715608, -3.053641, 1, 0, 0, 1, 1,
-2.685913, -0.4995064, -0.6652718, 1, 0, 0, 1, 1,
-2.604618, -0.8421366, -3.140317, 1, 0, 0, 1, 1,
-2.533978, 0.2522405, -1.26962, 1, 0, 0, 1, 1,
-2.491932, 0.1835993, -1.437136, 0, 0, 0, 1, 1,
-2.433863, -1.163459, -3.11187, 0, 0, 0, 1, 1,
-2.414291, 0.07251854, -1.058719, 0, 0, 0, 1, 1,
-2.36938, -0.1598083, -3.068702, 0, 0, 0, 1, 1,
-2.325495, -1.381224, -2.07118, 0, 0, 0, 1, 1,
-2.293126, -0.09910329, -0.788523, 0, 0, 0, 1, 1,
-2.268116, 0.1491075, 0.101676, 0, 0, 0, 1, 1,
-2.261246, 1.219202, -0.05437899, 1, 1, 1, 1, 1,
-2.225173, -0.6434435, -2.333038, 1, 1, 1, 1, 1,
-2.191787, -0.5253741, -2.373151, 1, 1, 1, 1, 1,
-2.186768, 0.316255, -3.25503, 1, 1, 1, 1, 1,
-2.173916, -0.0009412417, -2.279111, 1, 1, 1, 1, 1,
-2.170837, -0.225097, -1.78507, 1, 1, 1, 1, 1,
-2.160362, -0.1255544, -1.361949, 1, 1, 1, 1, 1,
-2.149103, -1.717621, -1.813445, 1, 1, 1, 1, 1,
-2.120874, -0.7599762, -2.582082, 1, 1, 1, 1, 1,
-2.120626, 1.535953, 0.5992305, 1, 1, 1, 1, 1,
-2.088669, 1.162579, -3.057289, 1, 1, 1, 1, 1,
-2.086518, -0.004104658, -2.417513, 1, 1, 1, 1, 1,
-2.059056, -0.6257108, -1.7195, 1, 1, 1, 1, 1,
-2.053994, 0.106474, -3.575854, 1, 1, 1, 1, 1,
-2.042448, 0.2938541, -0.7992275, 1, 1, 1, 1, 1,
-2.029541, 1.049091, -1.094367, 0, 0, 1, 1, 1,
-2.018933, 1.499778, -0.5608068, 1, 0, 0, 1, 1,
-2.009928, -0.2806432, -0.5354428, 1, 0, 0, 1, 1,
-1.949281, 1.959242, 0.6278566, 1, 0, 0, 1, 1,
-1.94095, -1.79355, -2.040945, 1, 0, 0, 1, 1,
-1.940752, -0.6947635, -1.594312, 1, 0, 0, 1, 1,
-1.938753, -0.5234649, -0.001633623, 0, 0, 0, 1, 1,
-1.935995, -1.624708, -1.83398, 0, 0, 0, 1, 1,
-1.923823, -1.566245, -0.4833567, 0, 0, 0, 1, 1,
-1.919145, -0.7698, -1.940727, 0, 0, 0, 1, 1,
-1.910843, 0.426994, -1.472136, 0, 0, 0, 1, 1,
-1.905736, 0.922594, -0.5500328, 0, 0, 0, 1, 1,
-1.889605, 0.7979857, -0.217442, 0, 0, 0, 1, 1,
-1.877892, -0.2997919, 0.476807, 1, 1, 1, 1, 1,
-1.87033, 1.135243, -1.180535, 1, 1, 1, 1, 1,
-1.865171, -0.8139411, -1.802449, 1, 1, 1, 1, 1,
-1.848209, -0.6377434, -0.6333731, 1, 1, 1, 1, 1,
-1.806255, 0.6223422, -2.22278, 1, 1, 1, 1, 1,
-1.796487, -1.139212, -1.765687, 1, 1, 1, 1, 1,
-1.793218, -0.3340701, 0.4293673, 1, 1, 1, 1, 1,
-1.787139, -1.941421, -2.371034, 1, 1, 1, 1, 1,
-1.767073, 1.289409, 0.3794657, 1, 1, 1, 1, 1,
-1.766216, 0.8974226, 1.43775, 1, 1, 1, 1, 1,
-1.748439, 1.239454, -0.243177, 1, 1, 1, 1, 1,
-1.745054, -0.192226, -3.105073, 1, 1, 1, 1, 1,
-1.74441, 0.5107388, -1.033362, 1, 1, 1, 1, 1,
-1.721163, 0.2053248, -2.686044, 1, 1, 1, 1, 1,
-1.718515, 1.213606, -0.1889186, 1, 1, 1, 1, 1,
-1.710536, 1.265153, -2.299098, 0, 0, 1, 1, 1,
-1.710497, -2.237548, -2.400634, 1, 0, 0, 1, 1,
-1.703931, -0.03833165, -2.124622, 1, 0, 0, 1, 1,
-1.698534, -0.3595978, -1.406658, 1, 0, 0, 1, 1,
-1.657486, 0.7975324, -0.9715422, 1, 0, 0, 1, 1,
-1.654446, -0.666044, -3.215967, 1, 0, 0, 1, 1,
-1.647026, 0.6194786, -0.08476295, 0, 0, 0, 1, 1,
-1.636698, 0.8291761, -1.633485, 0, 0, 0, 1, 1,
-1.627994, 0.7616049, -1.405, 0, 0, 0, 1, 1,
-1.61024, 0.6419453, -0.2777909, 0, 0, 0, 1, 1,
-1.609602, 0.7194133, -0.1639351, 0, 0, 0, 1, 1,
-1.583397, 0.03681117, -1.323131, 0, 0, 0, 1, 1,
-1.572403, -0.2406326, -2.521717, 0, 0, 0, 1, 1,
-1.562636, 0.4769495, -0.3734767, 1, 1, 1, 1, 1,
-1.54299, -0.6555872, -2.02312, 1, 1, 1, 1, 1,
-1.540655, -0.7275946, -1.298166, 1, 1, 1, 1, 1,
-1.540467, -0.06879794, -3.402643, 1, 1, 1, 1, 1,
-1.539537, -2.135447, -3.130494, 1, 1, 1, 1, 1,
-1.512315, 1.04078, -1.010552, 1, 1, 1, 1, 1,
-1.50377, -0.8255693, -2.306463, 1, 1, 1, 1, 1,
-1.471995, 0.6383935, -1.103906, 1, 1, 1, 1, 1,
-1.469188, 0.01543213, -1.509801, 1, 1, 1, 1, 1,
-1.456973, 0.6592792, -0.941318, 1, 1, 1, 1, 1,
-1.455778, 0.6241241, -1.896236, 1, 1, 1, 1, 1,
-1.455176, -0.3771341, -2.359337, 1, 1, 1, 1, 1,
-1.449614, -0.648929, -3.55967, 1, 1, 1, 1, 1,
-1.447065, -1.336678, -1.892692, 1, 1, 1, 1, 1,
-1.440901, -0.5098826, -0.7079608, 1, 1, 1, 1, 1,
-1.437406, -0.4284541, -2.526397, 0, 0, 1, 1, 1,
-1.428017, -0.237088, -2.289743, 1, 0, 0, 1, 1,
-1.400607, 0.4441453, -1.823602, 1, 0, 0, 1, 1,
-1.399576, 1.168071, 0.6960565, 1, 0, 0, 1, 1,
-1.390835, -0.08045656, -1.426514, 1, 0, 0, 1, 1,
-1.378605, -1.3193, -2.880112, 1, 0, 0, 1, 1,
-1.361639, -0.8346256, -2.267504, 0, 0, 0, 1, 1,
-1.351597, 0.1525649, -1.99296, 0, 0, 0, 1, 1,
-1.345928, -0.3806081, 0.1894713, 0, 0, 0, 1, 1,
-1.345702, 0.4530583, -1.435259, 0, 0, 0, 1, 1,
-1.345112, 0.5370958, 0.8556821, 0, 0, 0, 1, 1,
-1.341404, -0.6117347, -2.962132, 0, 0, 0, 1, 1,
-1.339942, 0.1997741, 0.1110694, 0, 0, 0, 1, 1,
-1.339715, -0.6702209, -1.956446, 1, 1, 1, 1, 1,
-1.337827, -0.7751937, -2.218594, 1, 1, 1, 1, 1,
-1.31899, -0.1816114, -1.720852, 1, 1, 1, 1, 1,
-1.302434, -0.01507709, -1.0168, 1, 1, 1, 1, 1,
-1.300162, 0.003256904, -1.860963, 1, 1, 1, 1, 1,
-1.296181, -1.193261, -3.155749, 1, 1, 1, 1, 1,
-1.294761, -0.4650498, -1.542148, 1, 1, 1, 1, 1,
-1.293004, -0.8191093, -1.804317, 1, 1, 1, 1, 1,
-1.282788, 0.05510887, -1.22473, 1, 1, 1, 1, 1,
-1.276851, 1.163296, 0.09378438, 1, 1, 1, 1, 1,
-1.273555, -0.1499063, -1.212349, 1, 1, 1, 1, 1,
-1.271172, 0.6205842, -1.521235, 1, 1, 1, 1, 1,
-1.271144, 0.8952001, -2.360609, 1, 1, 1, 1, 1,
-1.269675, 0.2136557, -1.851355, 1, 1, 1, 1, 1,
-1.263981, -1.023257, -1.593202, 1, 1, 1, 1, 1,
-1.261098, 0.7224017, -1.679526, 0, 0, 1, 1, 1,
-1.256705, 0.7140008, -2.225264, 1, 0, 0, 1, 1,
-1.248208, -0.3633744, -0.6066316, 1, 0, 0, 1, 1,
-1.245628, -1.091606, -2.445433, 1, 0, 0, 1, 1,
-1.243546, -1.82844, -3.190222, 1, 0, 0, 1, 1,
-1.230538, 1.639172, 0.3104527, 1, 0, 0, 1, 1,
-1.230517, 0.2182744, -2.88729, 0, 0, 0, 1, 1,
-1.225233, 0.1103755, -1.540264, 0, 0, 0, 1, 1,
-1.224545, -0.07227024, -0.7087023, 0, 0, 0, 1, 1,
-1.220364, 2.716624, -0.2869473, 0, 0, 0, 1, 1,
-1.217148, 0.8475185, -1.716041, 0, 0, 0, 1, 1,
-1.215869, 1.194931, -2.264764, 0, 0, 0, 1, 1,
-1.214125, -1.603178, -2.39044, 0, 0, 0, 1, 1,
-1.202367, -1.370186, -1.858376, 1, 1, 1, 1, 1,
-1.198453, -1.40875, -0.8435643, 1, 1, 1, 1, 1,
-1.197589, 1.202704, -2.901819, 1, 1, 1, 1, 1,
-1.195704, -1.286898, -2.089374, 1, 1, 1, 1, 1,
-1.192901, -0.8294951, -2.912707, 1, 1, 1, 1, 1,
-1.185543, 1.591784, -0.8473491, 1, 1, 1, 1, 1,
-1.182506, -0.6137046, -2.820686, 1, 1, 1, 1, 1,
-1.180509, 0.217999, -2.459172, 1, 1, 1, 1, 1,
-1.169873, 1.009283, -1.540024, 1, 1, 1, 1, 1,
-1.160644, -0.740731, -3.250655, 1, 1, 1, 1, 1,
-1.143507, 0.5679005, -0.5853481, 1, 1, 1, 1, 1,
-1.137417, 0.07848808, -2.228254, 1, 1, 1, 1, 1,
-1.13294, -0.9945804, -1.820348, 1, 1, 1, 1, 1,
-1.122757, 0.3988409, -1.678181, 1, 1, 1, 1, 1,
-1.114647, 0.3508862, -0.7722902, 1, 1, 1, 1, 1,
-1.111578, 0.5875431, -0.5843608, 0, 0, 1, 1, 1,
-1.108815, 0.1790531, -1.036339, 1, 0, 0, 1, 1,
-1.108788, 1.252311, -1.557655, 1, 0, 0, 1, 1,
-1.107692, -0.7060928, -2.983165, 1, 0, 0, 1, 1,
-1.087804, -1.180776, -1.551637, 1, 0, 0, 1, 1,
-1.086227, -0.9891175, -4.181265, 1, 0, 0, 1, 1,
-1.081252, 0.5844716, -1.87303, 0, 0, 0, 1, 1,
-1.07765, 0.9414033, -0.9115224, 0, 0, 0, 1, 1,
-1.076941, -0.8327111, -1.032232, 0, 0, 0, 1, 1,
-1.076443, -0.06513936, -1.83904, 0, 0, 0, 1, 1,
-1.073575, -1.211719, -2.422439, 0, 0, 0, 1, 1,
-1.069335, 0.04562925, -0.2341745, 0, 0, 0, 1, 1,
-1.067297, 0.2221444, -0.2530064, 0, 0, 0, 1, 1,
-1.064678, 2.183209, -2.584704, 1, 1, 1, 1, 1,
-1.062114, -2.02308, -1.621996, 1, 1, 1, 1, 1,
-1.061368, -0.6320512, -1.219766, 1, 1, 1, 1, 1,
-1.057748, 1.509839, -1.401338, 1, 1, 1, 1, 1,
-1.055816, 1.263668, -0.002823843, 1, 1, 1, 1, 1,
-1.054576, -0.4022788, -1.64897, 1, 1, 1, 1, 1,
-1.051747, -1.033803, -2.857194, 1, 1, 1, 1, 1,
-1.048765, -1.241722, -2.408658, 1, 1, 1, 1, 1,
-1.023794, -0.7096433, -1.938615, 1, 1, 1, 1, 1,
-1.018192, 0.8883874, -1.051828, 1, 1, 1, 1, 1,
-1.009168, 0.7697903, -0.8858719, 1, 1, 1, 1, 1,
-1.003121, -0.4663381, -2.328855, 1, 1, 1, 1, 1,
-1.000535, 0.6516219, -1.852024, 1, 1, 1, 1, 1,
-0.9939869, -1.350017, -0.5431091, 1, 1, 1, 1, 1,
-0.9881348, 0.7582314, 1.281731, 1, 1, 1, 1, 1,
-0.9879961, 0.5481047, -0.1203711, 0, 0, 1, 1, 1,
-0.9809352, -0.1761886, -2.847947, 1, 0, 0, 1, 1,
-0.9752917, -0.3932433, -0.920389, 1, 0, 0, 1, 1,
-0.9751616, -1.142567, -1.598658, 1, 0, 0, 1, 1,
-0.9746806, 0.7083873, -0.06251153, 1, 0, 0, 1, 1,
-0.9731966, -1.729297, -3.102103, 1, 0, 0, 1, 1,
-0.9692303, 0.6768501, -1.926453, 0, 0, 0, 1, 1,
-0.9522355, -0.9186813, -2.423638, 0, 0, 0, 1, 1,
-0.949706, -0.9805438, -2.196319, 0, 0, 0, 1, 1,
-0.9426242, -0.4756463, -1.881779, 0, 0, 0, 1, 1,
-0.9408585, 1.313921, -1.520609, 0, 0, 0, 1, 1,
-0.9405904, 1.23265, -1.022596, 0, 0, 0, 1, 1,
-0.9397796, -0.1529082, -1.050979, 0, 0, 0, 1, 1,
-0.9284307, -0.6389146, -1.566579, 1, 1, 1, 1, 1,
-0.9208903, 0.3097965, -1.790466, 1, 1, 1, 1, 1,
-0.9164814, 0.6288843, -1.413808, 1, 1, 1, 1, 1,
-0.9142349, 0.4846075, -1.640973, 1, 1, 1, 1, 1,
-0.9135588, 0.8521709, -2.250691, 1, 1, 1, 1, 1,
-0.9042799, 0.4471124, -2.524732, 1, 1, 1, 1, 1,
-0.9031044, 0.2294999, -1.635039, 1, 1, 1, 1, 1,
-0.9020157, -0.8779217, -2.645073, 1, 1, 1, 1, 1,
-0.8994917, 0.2497203, -3.015159, 1, 1, 1, 1, 1,
-0.8950514, -1.007103, -3.562686, 1, 1, 1, 1, 1,
-0.8789209, 0.2571321, 0.3109569, 1, 1, 1, 1, 1,
-0.8717905, -1.122277, -2.26349, 1, 1, 1, 1, 1,
-0.8715718, 0.6061459, 0.0273912, 1, 1, 1, 1, 1,
-0.867451, -1.168559, -1.970173, 1, 1, 1, 1, 1,
-0.8575464, 0.0447113, -0.5800245, 1, 1, 1, 1, 1,
-0.8565296, -0.6994604, -1.212, 0, 0, 1, 1, 1,
-0.8439971, -1.847819, -3.309351, 1, 0, 0, 1, 1,
-0.8275725, 1.141055, -0.9630992, 1, 0, 0, 1, 1,
-0.8271748, -0.9881046, -2.521987, 1, 0, 0, 1, 1,
-0.8243688, 0.04164837, -1.016908, 1, 0, 0, 1, 1,
-0.8218254, 1.181882, 1.12208, 1, 0, 0, 1, 1,
-0.820895, 2.639781, -1.301665, 0, 0, 0, 1, 1,
-0.8154073, 0.6040366, -0.305543, 0, 0, 0, 1, 1,
-0.8145123, -1.450942, -1.449938, 0, 0, 0, 1, 1,
-0.8132805, 0.255441, -0.8586758, 0, 0, 0, 1, 1,
-0.8082758, 0.3703549, 1.458631, 0, 0, 0, 1, 1,
-0.8026153, -1.006807, -2.389107, 0, 0, 0, 1, 1,
-0.7985152, 1.825693, -1.872752, 0, 0, 0, 1, 1,
-0.7794656, 0.2147684, -1.409013, 1, 1, 1, 1, 1,
-0.7794646, -1.690049, -3.081963, 1, 1, 1, 1, 1,
-0.7789993, 0.455099, -0.6111241, 1, 1, 1, 1, 1,
-0.7627268, 0.08336495, -1.906264, 1, 1, 1, 1, 1,
-0.7558598, -1.940894, -1.263281, 1, 1, 1, 1, 1,
-0.7544326, 0.2993481, -0.9022666, 1, 1, 1, 1, 1,
-0.7533878, 0.5760005, -2.206869, 1, 1, 1, 1, 1,
-0.7473689, -0.5967028, -1.120443, 1, 1, 1, 1, 1,
-0.7370613, 1.560978, 1.188807, 1, 1, 1, 1, 1,
-0.7359317, -0.3112654, -2.086017, 1, 1, 1, 1, 1,
-0.7312914, -0.143715, -1.506642, 1, 1, 1, 1, 1,
-0.7300492, 0.828065, -1.425968, 1, 1, 1, 1, 1,
-0.7280664, -0.00335558, -2.438741, 1, 1, 1, 1, 1,
-0.7183515, 1.123436, -0.6684508, 1, 1, 1, 1, 1,
-0.7176705, 0.9170053, -0.6796636, 1, 1, 1, 1, 1,
-0.7162244, -1.462765, -3.431049, 0, 0, 1, 1, 1,
-0.7155437, -1.256086, -3.419348, 1, 0, 0, 1, 1,
-0.7149031, -1.712516, -3.285674, 1, 0, 0, 1, 1,
-0.7054484, -0.4351304, -0.534677, 1, 0, 0, 1, 1,
-0.7017671, 0.3920711, -1.671292, 1, 0, 0, 1, 1,
-0.7015607, -0.1953095, -2.046025, 1, 0, 0, 1, 1,
-0.6998239, 0.1383307, -0.982531, 0, 0, 0, 1, 1,
-0.6977687, -0.696186, -3.267953, 0, 0, 0, 1, 1,
-0.6976963, -0.008561326, -3.109988, 0, 0, 0, 1, 1,
-0.6965963, 0.2703964, -0.690436, 0, 0, 0, 1, 1,
-0.6964898, -0.2930439, -1.181386, 0, 0, 0, 1, 1,
-0.6890281, 0.95328, 0.4103909, 0, 0, 0, 1, 1,
-0.6854493, -0.5808042, -0.6333453, 0, 0, 0, 1, 1,
-0.683945, 2.125041, 0.1088066, 1, 1, 1, 1, 1,
-0.6807293, 1.142856, 0.2491637, 1, 1, 1, 1, 1,
-0.6797445, -0.447539, -1.859964, 1, 1, 1, 1, 1,
-0.6763511, 0.9077065, 0.2064433, 1, 1, 1, 1, 1,
-0.6750559, -0.5547214, -2.510498, 1, 1, 1, 1, 1,
-0.6667835, -0.2066539, -2.110567, 1, 1, 1, 1, 1,
-0.6603228, -0.2856132, -1.843592, 1, 1, 1, 1, 1,
-0.6595331, 0.4882071, -2.413976, 1, 1, 1, 1, 1,
-0.6550981, -2.443333, -4.261825, 1, 1, 1, 1, 1,
-0.6548854, 0.7033364, 0.2304766, 1, 1, 1, 1, 1,
-0.6536949, 1.250811, -1.155319, 1, 1, 1, 1, 1,
-0.6524017, -0.001618639, -3.060677, 1, 1, 1, 1, 1,
-0.651131, 1.174071, -0.5484099, 1, 1, 1, 1, 1,
-0.6510959, -1.754313, -2.471377, 1, 1, 1, 1, 1,
-0.6468173, 0.2431633, -1.184324, 1, 1, 1, 1, 1,
-0.6444898, 0.2298195, -0.9110435, 0, 0, 1, 1, 1,
-0.6443385, 0.8720247, -1.18314, 1, 0, 0, 1, 1,
-0.6441125, 0.6231763, 1.116613, 1, 0, 0, 1, 1,
-0.639922, 0.0502791, -1.32387, 1, 0, 0, 1, 1,
-0.6367247, 1.126693, -0.5238141, 1, 0, 0, 1, 1,
-0.6281365, -0.67933, -4.260138, 1, 0, 0, 1, 1,
-0.6240759, -0.4269115, -0.9749154, 0, 0, 0, 1, 1,
-0.6201571, 1.18749, -1.087532, 0, 0, 0, 1, 1,
-0.6193567, 1.117703, 0.1333704, 0, 0, 0, 1, 1,
-0.6145046, 1.871779, -1.140405, 0, 0, 0, 1, 1,
-0.6125252, 0.3862575, -0.9840307, 0, 0, 0, 1, 1,
-0.6117939, -1.045323, -1.00826, 0, 0, 0, 1, 1,
-0.6112131, 0.8933038, -0.1486842, 0, 0, 0, 1, 1,
-0.6101504, 1.559786, 0.2827986, 1, 1, 1, 1, 1,
-0.606713, -0.3715785, -1.716448, 1, 1, 1, 1, 1,
-0.6055984, -0.6289037, -4.729806, 1, 1, 1, 1, 1,
-0.604462, 0.04591623, -0.9890692, 1, 1, 1, 1, 1,
-0.5969088, -1.422548, -2.259786, 1, 1, 1, 1, 1,
-0.5968094, 0.2193235, -0.2360368, 1, 1, 1, 1, 1,
-0.5964429, -0.8873268, -1.304813, 1, 1, 1, 1, 1,
-0.5962212, -0.1608813, -1.476771, 1, 1, 1, 1, 1,
-0.5938416, 0.6475024, -0.5556541, 1, 1, 1, 1, 1,
-0.5936636, -0.9129679, -1.712481, 1, 1, 1, 1, 1,
-0.5903872, -0.6101615, -1.018851, 1, 1, 1, 1, 1,
-0.5903744, 0.2074956, -1.872809, 1, 1, 1, 1, 1,
-0.5823464, -1.151288, -1.072532, 1, 1, 1, 1, 1,
-0.5817648, -0.3153757, -1.374023, 1, 1, 1, 1, 1,
-0.5776553, -0.7167342, -2.828646, 1, 1, 1, 1, 1,
-0.568844, -0.1608998, -1.537435, 0, 0, 1, 1, 1,
-0.5641372, 1.715484, 0.1047873, 1, 0, 0, 1, 1,
-0.5619053, 2.139013, 1.506782, 1, 0, 0, 1, 1,
-0.5602071, 0.8949946, -0.6628495, 1, 0, 0, 1, 1,
-0.5592251, -1.034413, -2.265157, 1, 0, 0, 1, 1,
-0.5579981, 1.047811, -1.071251, 1, 0, 0, 1, 1,
-0.5569863, 0.01689597, -2.355093, 0, 0, 0, 1, 1,
-0.5559596, -0.7373821, -2.081903, 0, 0, 0, 1, 1,
-0.5544072, -0.8270918, -3.802431, 0, 0, 0, 1, 1,
-0.550078, -0.4897104, -3.652171, 0, 0, 0, 1, 1,
-0.5490533, 0.3293452, -0.7164116, 0, 0, 0, 1, 1,
-0.5470573, -1.027018, -4.745882, 0, 0, 0, 1, 1,
-0.5446439, 0.7041533, 0.08827624, 0, 0, 0, 1, 1,
-0.5432641, -2.171233, -3.187372, 1, 1, 1, 1, 1,
-0.5424433, 0.705519, -1.685845, 1, 1, 1, 1, 1,
-0.5389071, 0.133415, 0.02329659, 1, 1, 1, 1, 1,
-0.5366645, 2.308609, -0.06253719, 1, 1, 1, 1, 1,
-0.5343223, -0.824346, -4.261562, 1, 1, 1, 1, 1,
-0.5314277, -0.9951677, -2.298006, 1, 1, 1, 1, 1,
-0.5305402, 1.137028, -1.394206, 1, 1, 1, 1, 1,
-0.5277122, -0.6929067, -2.275907, 1, 1, 1, 1, 1,
-0.5243245, -0.0634253, -0.7177771, 1, 1, 1, 1, 1,
-0.5227332, -1.63224, -2.258953, 1, 1, 1, 1, 1,
-0.5203838, 0.05090193, -2.072359, 1, 1, 1, 1, 1,
-0.5190966, -1.464171, -2.392065, 1, 1, 1, 1, 1,
-0.5146574, -2.350768, -3.628616, 1, 1, 1, 1, 1,
-0.5110666, -0.1297852, -1.787777, 1, 1, 1, 1, 1,
-0.50542, 2.462951, -0.0466042, 1, 1, 1, 1, 1,
-0.5005594, 1.524553, -1.85655, 0, 0, 1, 1, 1,
-0.5005301, -0.04813131, -2.52389, 1, 0, 0, 1, 1,
-0.4992742, -1.428379, -1.465397, 1, 0, 0, 1, 1,
-0.4970705, 0.1987345, -2.655853, 1, 0, 0, 1, 1,
-0.4944794, 0.9288963, -1.15126, 1, 0, 0, 1, 1,
-0.4902011, -1.596585, -2.885973, 1, 0, 0, 1, 1,
-0.4845719, -0.1579231, -0.2131831, 0, 0, 0, 1, 1,
-0.4807308, -0.6965132, -2.268537, 0, 0, 0, 1, 1,
-0.47954, 0.02635815, -0.2931674, 0, 0, 0, 1, 1,
-0.4793314, 1.566978, -1.666265, 0, 0, 0, 1, 1,
-0.4684719, 0.9871798, -0.9057887, 0, 0, 0, 1, 1,
-0.4673528, -1.765698, -2.811213, 0, 0, 0, 1, 1,
-0.4672776, 0.4983822, 0.8946494, 0, 0, 0, 1, 1,
-0.4614312, -1.229516, -0.8600248, 1, 1, 1, 1, 1,
-0.4601372, -1.577497, -1.469294, 1, 1, 1, 1, 1,
-0.4589517, -0.3846484, -1.770746, 1, 1, 1, 1, 1,
-0.4554231, 1.266362, -1.232211, 1, 1, 1, 1, 1,
-0.4526271, 0.8042651, 1.065402, 1, 1, 1, 1, 1,
-0.4524987, -0.9440193, -2.827849, 1, 1, 1, 1, 1,
-0.451637, 1.213307, -1.989909, 1, 1, 1, 1, 1,
-0.4481791, 0.01564644, -1.66547, 1, 1, 1, 1, 1,
-0.4474322, 0.7652826, -0.6402322, 1, 1, 1, 1, 1,
-0.4368095, -0.4206775, -1.922405, 1, 1, 1, 1, 1,
-0.4287528, -1.985616, -4.394594, 1, 1, 1, 1, 1,
-0.4286624, -0.8558835, -2.774307, 1, 1, 1, 1, 1,
-0.4279487, 0.1084398, -2.621953, 1, 1, 1, 1, 1,
-0.4277704, -0.06123343, -0.8185666, 1, 1, 1, 1, 1,
-0.4248708, 2.559711, 0.3927276, 1, 1, 1, 1, 1,
-0.4229103, 0.3939888, -0.3487017, 0, 0, 1, 1, 1,
-0.4213194, -0.4709482, -4.466893, 1, 0, 0, 1, 1,
-0.4188426, 1.183102, 0.33009, 1, 0, 0, 1, 1,
-0.4082303, -1.055689, -3.895732, 1, 0, 0, 1, 1,
-0.4057181, 1.34519, -0.4106344, 1, 0, 0, 1, 1,
-0.403934, -1.641273, -2.707441, 1, 0, 0, 1, 1,
-0.3972221, -0.1490073, -2.512757, 0, 0, 0, 1, 1,
-0.3968927, -1.712821, -3.291749, 0, 0, 0, 1, 1,
-0.3931404, -0.02323398, -0.6120348, 0, 0, 0, 1, 1,
-0.3908686, -0.2990158, -1.597301, 0, 0, 0, 1, 1,
-0.3902225, 0.9597588, 2.311915, 0, 0, 0, 1, 1,
-0.3902096, 0.1784723, -1.869069, 0, 0, 0, 1, 1,
-0.3887388, -0.3366562, -2.30077, 0, 0, 0, 1, 1,
-0.3752754, 0.4718845, 0.2409574, 1, 1, 1, 1, 1,
-0.375108, 0.5400874, -1.386147, 1, 1, 1, 1, 1,
-0.3671694, 1.396831, 0.1173047, 1, 1, 1, 1, 1,
-0.3663738, -0.5543883, -2.871015, 1, 1, 1, 1, 1,
-0.3650048, -0.9563296, -0.5592633, 1, 1, 1, 1, 1,
-0.3629829, 1.418212, -1.249528, 1, 1, 1, 1, 1,
-0.3587436, 0.8077608, 0.09010088, 1, 1, 1, 1, 1,
-0.3534248, 0.148165, -3.118899, 1, 1, 1, 1, 1,
-0.3501161, 1.067683, 0.06290762, 1, 1, 1, 1, 1,
-0.349876, -1.461414, -1.234067, 1, 1, 1, 1, 1,
-0.348052, -0.2571576, -2.581573, 1, 1, 1, 1, 1,
-0.3433176, 0.4565139, -0.8507397, 1, 1, 1, 1, 1,
-0.3408603, 0.3267096, -1.378732, 1, 1, 1, 1, 1,
-0.3391516, -0.596546, -3.371296, 1, 1, 1, 1, 1,
-0.3382634, 2.195666, -0.3849944, 1, 1, 1, 1, 1,
-0.3380263, 1.188701, 0.7571523, 0, 0, 1, 1, 1,
-0.3349861, -0.5262754, -1.614839, 1, 0, 0, 1, 1,
-0.334384, -0.8376114, -2.786171, 1, 0, 0, 1, 1,
-0.3314637, -1.004729, -2.659061, 1, 0, 0, 1, 1,
-0.3302417, 0.3983637, 0.6658472, 1, 0, 0, 1, 1,
-0.3285087, -0.5392355, -3.186098, 1, 0, 0, 1, 1,
-0.3253685, 0.1742974, -1.896985, 0, 0, 0, 1, 1,
-0.3247124, -0.3704142, -2.726397, 0, 0, 0, 1, 1,
-0.3244292, -0.2696096, -2.575598, 0, 0, 0, 1, 1,
-0.3118178, -1.947371, -3.562766, 0, 0, 0, 1, 1,
-0.3104089, -1.405323, -2.124463, 0, 0, 0, 1, 1,
-0.3102486, 0.7461967, 0.682099, 0, 0, 0, 1, 1,
-0.3102, 0.3579236, -0.9234066, 0, 0, 0, 1, 1,
-0.3098502, 0.1834631, -2.579499, 1, 1, 1, 1, 1,
-0.3045797, -0.3590121, -2.365958, 1, 1, 1, 1, 1,
-0.2982976, -1.515242, -5.210657, 1, 1, 1, 1, 1,
-0.2960906, -0.2553388, -1.59851, 1, 1, 1, 1, 1,
-0.2910465, 0.1148762, -1.636789, 1, 1, 1, 1, 1,
-0.2910019, 0.8251798, -0.4868247, 1, 1, 1, 1, 1,
-0.2906656, -1.728911, -3.99896, 1, 1, 1, 1, 1,
-0.2900769, -0.2402999, -1.125989, 1, 1, 1, 1, 1,
-0.2858452, -0.4815528, -1.788908, 1, 1, 1, 1, 1,
-0.2836888, -0.3473842, -1.964634, 1, 1, 1, 1, 1,
-0.2795579, -0.2945102, -2.837467, 1, 1, 1, 1, 1,
-0.2771274, 0.4274706, -1.464148, 1, 1, 1, 1, 1,
-0.2675234, -1.756498, -2.794254, 1, 1, 1, 1, 1,
-0.2655639, -0.3361034, -2.216626, 1, 1, 1, 1, 1,
-0.2652594, 0.6418408, -0.3249022, 1, 1, 1, 1, 1,
-0.2638767, 0.05990757, -1.236402, 0, 0, 1, 1, 1,
-0.2586764, -0.8074127, -2.746063, 1, 0, 0, 1, 1,
-0.2583544, 0.380686, 0.1807382, 1, 0, 0, 1, 1,
-0.2575348, -0.4189698, -2.117777, 1, 0, 0, 1, 1,
-0.2564245, 0.1573241, -0.2178128, 1, 0, 0, 1, 1,
-0.2550741, 1.206958, -0.1947819, 1, 0, 0, 1, 1,
-0.2502587, 1.736303, -0.4132082, 0, 0, 0, 1, 1,
-0.2489466, -1.029041, -1.675603, 0, 0, 0, 1, 1,
-0.2454348, 3.07696, 0.8120316, 0, 0, 0, 1, 1,
-0.2430714, -0.1574104, -1.449358, 0, 0, 0, 1, 1,
-0.2268258, 1.034937, 0.1801694, 0, 0, 0, 1, 1,
-0.2214033, -0.5710701, -2.342143, 0, 0, 0, 1, 1,
-0.2197277, 1.139073, -1.572025, 0, 0, 0, 1, 1,
-0.2188678, -0.5877159, -1.499875, 1, 1, 1, 1, 1,
-0.2156961, -0.5322492, -1.880603, 1, 1, 1, 1, 1,
-0.2133687, 0.2554195, -1.446657, 1, 1, 1, 1, 1,
-0.213011, 0.1947704, 0.2761143, 1, 1, 1, 1, 1,
-0.2099799, -0.2906798, -3.164073, 1, 1, 1, 1, 1,
-0.2090532, -0.7899877, -2.728887, 1, 1, 1, 1, 1,
-0.2085333, 1.495875, -0.06828675, 1, 1, 1, 1, 1,
-0.2011139, 0.2173198, -0.05900558, 1, 1, 1, 1, 1,
-0.1999409, -0.7854831, -2.63798, 1, 1, 1, 1, 1,
-0.1932183, -0.6967135, -3.261649, 1, 1, 1, 1, 1,
-0.1908941, 0.2192855, -2.295527, 1, 1, 1, 1, 1,
-0.1876959, 0.5809708, -2.049867, 1, 1, 1, 1, 1,
-0.1864345, 0.4456391, 0.8361913, 1, 1, 1, 1, 1,
-0.1827832, -0.7138057, -3.431862, 1, 1, 1, 1, 1,
-0.1810625, 0.4036733, 1.352443, 1, 1, 1, 1, 1,
-0.1793955, -0.8975819, -2.271098, 0, 0, 1, 1, 1,
-0.177502, -0.1541963, -2.653225, 1, 0, 0, 1, 1,
-0.1760604, -0.6942384, -2.781921, 1, 0, 0, 1, 1,
-0.1747903, 1.184253, 0.08383547, 1, 0, 0, 1, 1,
-0.1740491, 1.146097, 1.767583, 1, 0, 0, 1, 1,
-0.1649805, -1.843998, -2.015976, 1, 0, 0, 1, 1,
-0.1599302, 2.058267, -1.463059, 0, 0, 0, 1, 1,
-0.1581051, 1.169407, 1.48182, 0, 0, 0, 1, 1,
-0.1541327, 0.5271682, 3.268748, 0, 0, 0, 1, 1,
-0.1532801, 0.1762562, 0.2339673, 0, 0, 0, 1, 1,
-0.1516093, -0.7161899, -2.2763, 0, 0, 0, 1, 1,
-0.1515305, -0.3980161, -2.782575, 0, 0, 0, 1, 1,
-0.1484638, -0.1798859, -2.920337, 0, 0, 0, 1, 1,
-0.1480941, 0.2942894, -2.081377, 1, 1, 1, 1, 1,
-0.144291, 0.1319902, -1.030189, 1, 1, 1, 1, 1,
-0.14271, 0.8986955, 1.088627, 1, 1, 1, 1, 1,
-0.1393762, -0.4785039, -4.436926, 1, 1, 1, 1, 1,
-0.1317078, -0.7609458, -3.294045, 1, 1, 1, 1, 1,
-0.1298436, -2.146793, -3.547805, 1, 1, 1, 1, 1,
-0.1289227, 1.064954, 0.7686377, 1, 1, 1, 1, 1,
-0.1254279, 0.06714564, -0.8851691, 1, 1, 1, 1, 1,
-0.1202513, 1.438571, -0.3203956, 1, 1, 1, 1, 1,
-0.1194917, -0.397284, -3.836119, 1, 1, 1, 1, 1,
-0.1149485, -0.320128, -5.290075, 1, 1, 1, 1, 1,
-0.1094039, 0.4089093, 0.4006005, 1, 1, 1, 1, 1,
-0.1083183, -0.07222567, -4.228302, 1, 1, 1, 1, 1,
-0.1054314, -0.04758302, -0.5298492, 1, 1, 1, 1, 1,
-0.1023924, 1.763755, 0.9606727, 1, 1, 1, 1, 1,
-0.09676727, 1.211757, -0.02805018, 0, 0, 1, 1, 1,
-0.09209142, -1.889026, -2.222598, 1, 0, 0, 1, 1,
-0.08822745, 1.24859, -2.348017, 1, 0, 0, 1, 1,
-0.08790821, -0.5350257, -2.269827, 1, 0, 0, 1, 1,
-0.08383585, -0.6660508, -2.722653, 1, 0, 0, 1, 1,
-0.08300944, -2.408474, -2.460387, 1, 0, 0, 1, 1,
-0.08241279, 1.57841, 0.8096808, 0, 0, 0, 1, 1,
-0.07611287, -0.1122847, -3.119313, 0, 0, 0, 1, 1,
-0.0749997, 0.6436294, -1.459824, 0, 0, 0, 1, 1,
-0.07405099, 0.3957288, 0.4941277, 0, 0, 0, 1, 1,
-0.07304149, -2.329192, -2.439201, 0, 0, 0, 1, 1,
-0.07287582, 0.07919919, -2.473915, 0, 0, 0, 1, 1,
-0.07004528, -0.398678, -2.317693, 0, 0, 0, 1, 1,
-0.06945789, 0.02304918, -0.9783047, 1, 1, 1, 1, 1,
-0.06853829, 0.2573748, 1.160642, 1, 1, 1, 1, 1,
-0.0681852, 0.8992774, -1.636533, 1, 1, 1, 1, 1,
-0.06502537, 1.366992, 1.508662, 1, 1, 1, 1, 1,
-0.06250007, -0.8924652, -3.006217, 1, 1, 1, 1, 1,
-0.05588555, -0.8309693, -3.570483, 1, 1, 1, 1, 1,
-0.05337989, 1.14088, 0.05127386, 1, 1, 1, 1, 1,
-0.05305067, -0.5744721, -4.018438, 1, 1, 1, 1, 1,
-0.04116567, 1.911057, -2.545346, 1, 1, 1, 1, 1,
-0.04076345, -1.791099, -2.260096, 1, 1, 1, 1, 1,
-0.03947598, 1.105856, -0.1850787, 1, 1, 1, 1, 1,
-0.0356078, -1.937926, -2.806456, 1, 1, 1, 1, 1,
-0.03416672, -1.536743, -1.059292, 1, 1, 1, 1, 1,
-0.02833122, 0.6698732, -2.10812, 1, 1, 1, 1, 1,
-0.02795417, -0.1268474, -3.720407, 1, 1, 1, 1, 1,
-0.02632053, -0.6931358, -3.377484, 0, 0, 1, 1, 1,
-0.02284355, 0.611737, 1.394721, 1, 0, 0, 1, 1,
-0.02212802, 0.9953283, -1.402997, 1, 0, 0, 1, 1,
-0.01779901, -0.146974, -3.988539, 1, 0, 0, 1, 1,
-0.01581616, -0.8321235, -2.504392, 1, 0, 0, 1, 1,
-0.0132578, -0.4599828, -2.481059, 1, 0, 0, 1, 1,
-0.01273147, 1.186473, -0.8473762, 0, 0, 0, 1, 1,
-0.008991519, -0.5428501, -2.929187, 0, 0, 0, 1, 1,
-0.006584547, 0.07877405, -0.5144835, 0, 0, 0, 1, 1,
0.001252689, -1.509023, 2.831059, 0, 0, 0, 1, 1,
0.003412856, -0.4231392, 2.185006, 0, 0, 0, 1, 1,
0.005582242, -0.03478022, 3.968348, 0, 0, 0, 1, 1,
0.01127294, 0.3325335, -0.8247085, 0, 0, 0, 1, 1,
0.01604242, 0.1542843, 1.394055, 1, 1, 1, 1, 1,
0.02598999, -1.616574, 4.057715, 1, 1, 1, 1, 1,
0.02701451, 0.5482939, -0.8569501, 1, 1, 1, 1, 1,
0.02795351, -0.9084701, 3.342446, 1, 1, 1, 1, 1,
0.02920049, -0.2880969, 1.47313, 1, 1, 1, 1, 1,
0.0297537, 0.464773, -0.004290179, 1, 1, 1, 1, 1,
0.03244847, 0.6621285, -0.3497794, 1, 1, 1, 1, 1,
0.03245779, -0.2135445, 3.933828, 1, 1, 1, 1, 1,
0.03352921, 1.093315, 1.15526, 1, 1, 1, 1, 1,
0.04275168, 1.272245, 0.4982591, 1, 1, 1, 1, 1,
0.04758375, 1.493839, -0.7900237, 1, 1, 1, 1, 1,
0.05441224, 1.318833, 0.4908341, 1, 1, 1, 1, 1,
0.05536269, 1.157933, -0.3758236, 1, 1, 1, 1, 1,
0.05539437, -1.385266, 2.764424, 1, 1, 1, 1, 1,
0.06338891, 0.1040892, -0.1506301, 1, 1, 1, 1, 1,
0.06377211, -0.6282103, 2.185029, 0, 0, 1, 1, 1,
0.0672572, -0.005722516, 3.040987, 1, 0, 0, 1, 1,
0.07056027, -0.716513, 2.679579, 1, 0, 0, 1, 1,
0.07113577, -1.244916, 1.875978, 1, 0, 0, 1, 1,
0.07433634, -0.5339325, 3.521902, 1, 0, 0, 1, 1,
0.07465953, -0.777492, 2.859067, 1, 0, 0, 1, 1,
0.07811949, -0.6011066, 2.842319, 0, 0, 0, 1, 1,
0.07907646, 0.2110298, 1.180261, 0, 0, 0, 1, 1,
0.07916003, -1.014174, 4.597086, 0, 0, 0, 1, 1,
0.0800171, 0.7832139, 0.814849, 0, 0, 0, 1, 1,
0.08054437, -0.7781187, 2.59488, 0, 0, 0, 1, 1,
0.08157685, 0.3339395, 0.1172918, 0, 0, 0, 1, 1,
0.08280094, -0.9773045, 3.37944, 0, 0, 0, 1, 1,
0.08445209, -0.8743417, 3.227826, 1, 1, 1, 1, 1,
0.08838338, 0.7037225, -0.6407044, 1, 1, 1, 1, 1,
0.0891372, 1.232445, 0.4648862, 1, 1, 1, 1, 1,
0.09218631, -0.9635482, 3.649582, 1, 1, 1, 1, 1,
0.09234657, -0.09542587, 3.085915, 1, 1, 1, 1, 1,
0.09716625, 2.017027, -0.3709829, 1, 1, 1, 1, 1,
0.09748271, -0.9754688, 3.721648, 1, 1, 1, 1, 1,
0.1140917, 0.450959, -0.8140758, 1, 1, 1, 1, 1,
0.1162504, 0.1538528, 2.278466, 1, 1, 1, 1, 1,
0.119154, -0.2002626, 3.083367, 1, 1, 1, 1, 1,
0.121235, -0.6338681, 2.886231, 1, 1, 1, 1, 1,
0.1214594, 1.322569, 1.468121, 1, 1, 1, 1, 1,
0.1230968, -0.8396358, 1.391383, 1, 1, 1, 1, 1,
0.1265409, 2.249999, 1.454067, 1, 1, 1, 1, 1,
0.1293612, -0.2006926, 2.329197, 1, 1, 1, 1, 1,
0.1298638, -1.802491, 1.122321, 0, 0, 1, 1, 1,
0.1299032, 0.8465988, -1.319676, 1, 0, 0, 1, 1,
0.1343855, 1.864252, 0.111587, 1, 0, 0, 1, 1,
0.1345164, -1.700725, 2.781216, 1, 0, 0, 1, 1,
0.1377309, 0.132312, 1.146252, 1, 0, 0, 1, 1,
0.1408761, -0.8762625, 5.019514, 1, 0, 0, 1, 1,
0.1428706, 0.2922053, -1.887102, 0, 0, 0, 1, 1,
0.1453972, 0.6235303, 0.4673524, 0, 0, 0, 1, 1,
0.1474488, 0.9676771, 0.3544467, 0, 0, 0, 1, 1,
0.147507, -0.04187898, 3.560664, 0, 0, 0, 1, 1,
0.151453, -1.573744, 3.338509, 0, 0, 0, 1, 1,
0.1529125, -0.2052252, 2.63812, 0, 0, 0, 1, 1,
0.1553852, 0.6023803, -1.229323, 0, 0, 0, 1, 1,
0.1589381, 1.715905, -0.2814178, 1, 1, 1, 1, 1,
0.1592672, 1.509211, -1.226792, 1, 1, 1, 1, 1,
0.1606078, 1.559772, -0.525142, 1, 1, 1, 1, 1,
0.1639867, 0.08927551, 0.2947911, 1, 1, 1, 1, 1,
0.1652635, 0.3374091, 0.5893615, 1, 1, 1, 1, 1,
0.1671441, 0.4153194, 0.2274859, 1, 1, 1, 1, 1,
0.1771014, -1.022512, 2.178188, 1, 1, 1, 1, 1,
0.1798035, -0.335075, 2.362776, 1, 1, 1, 1, 1,
0.1814663, 1.201935, -1.454386, 1, 1, 1, 1, 1,
0.1855703, 0.3207164, 1.164229, 1, 1, 1, 1, 1,
0.1881807, 0.2895051, 0.8561716, 1, 1, 1, 1, 1,
0.1947639, -0.1718045, 0.6160541, 1, 1, 1, 1, 1,
0.1958066, -1.15747, 4.956739, 1, 1, 1, 1, 1,
0.1972737, -0.1810899, 1.189161, 1, 1, 1, 1, 1,
0.1999988, -0.6405638, 2.92025, 1, 1, 1, 1, 1,
0.2042746, 1.729796, -1.753978, 0, 0, 1, 1, 1,
0.2114086, 1.090072, -0.4809937, 1, 0, 0, 1, 1,
0.2122883, 0.6201071, -0.3527797, 1, 0, 0, 1, 1,
0.2141815, 0.8083085, 0.4069544, 1, 0, 0, 1, 1,
0.2161809, 0.4949318, 1.216211, 1, 0, 0, 1, 1,
0.2176676, 0.9613555, -0.3386599, 1, 0, 0, 1, 1,
0.2185394, -0.4303826, 3.147923, 0, 0, 0, 1, 1,
0.2207011, 0.3890098, 0.6386407, 0, 0, 0, 1, 1,
0.2254173, 1.802673, -1.909819, 0, 0, 0, 1, 1,
0.2256175, -1.37942, 4.432794, 0, 0, 0, 1, 1,
0.2272096, 1.400232, -1.249521, 0, 0, 0, 1, 1,
0.2274399, 0.1288086, 0.6448589, 0, 0, 0, 1, 1,
0.2287584, 1.195168, 0.1941576, 0, 0, 0, 1, 1,
0.2325557, 0.7121768, 0.1862407, 1, 1, 1, 1, 1,
0.2359043, -1.651915, 3.884055, 1, 1, 1, 1, 1,
0.2369063, -0.3060856, 2.705729, 1, 1, 1, 1, 1,
0.2389919, 0.809812, -0.1316374, 1, 1, 1, 1, 1,
0.2393621, -2.011469, 1.201085, 1, 1, 1, 1, 1,
0.2395896, -0.5617676, 2.177059, 1, 1, 1, 1, 1,
0.2408503, -1.375236, 3.948831, 1, 1, 1, 1, 1,
0.2412874, 0.4781064, 0.1069942, 1, 1, 1, 1, 1,
0.2426557, 1.658067, 0.9442414, 1, 1, 1, 1, 1,
0.2463258, -0.6277834, 2.000498, 1, 1, 1, 1, 1,
0.2506948, -1.077674, 3.548367, 1, 1, 1, 1, 1,
0.254146, -0.5440786, 2.526207, 1, 1, 1, 1, 1,
0.2554442, -1.150382, 2.519348, 1, 1, 1, 1, 1,
0.2564293, -0.5079347, 3.594569, 1, 1, 1, 1, 1,
0.2573094, 0.7849907, -0.2337807, 1, 1, 1, 1, 1,
0.2591399, 1.343125, -0.4869811, 0, 0, 1, 1, 1,
0.2592524, -0.1650991, 1.348974, 1, 0, 0, 1, 1,
0.2634863, 0.4717284, 1.576069, 1, 0, 0, 1, 1,
0.2635166, 0.003802981, 0.9858267, 1, 0, 0, 1, 1,
0.2666748, -0.9105821, 1.948107, 1, 0, 0, 1, 1,
0.2671288, 2.341067, -0.4889527, 1, 0, 0, 1, 1,
0.2683091, 0.8954346, 0.423399, 0, 0, 0, 1, 1,
0.2687527, -1.002312, 2.98978, 0, 0, 0, 1, 1,
0.2694266, -0.4066098, 2.223392, 0, 0, 0, 1, 1,
0.2696601, 0.3762197, -0.1630454, 0, 0, 0, 1, 1,
0.2747442, 0.646783, 1.017751, 0, 0, 0, 1, 1,
0.2800166, 1.436189, -0.5921642, 0, 0, 0, 1, 1,
0.2814896, 0.5089939, 1.153502, 0, 0, 0, 1, 1,
0.2825981, 0.09607472, 0.4319859, 1, 1, 1, 1, 1,
0.283355, -1.705294, 1.672081, 1, 1, 1, 1, 1,
0.2859482, 1.571446, -0.6159238, 1, 1, 1, 1, 1,
0.2868381, 0.2902171, 0.2367431, 1, 1, 1, 1, 1,
0.2886516, 1.878527, 0.7335963, 1, 1, 1, 1, 1,
0.289275, 0.2488368, 0.9640613, 1, 1, 1, 1, 1,
0.2942196, 1.18854, 1.258741, 1, 1, 1, 1, 1,
0.3035655, 0.01363346, 2.176682, 1, 1, 1, 1, 1,
0.3084502, -1.495703, 3.132942, 1, 1, 1, 1, 1,
0.3086961, -1.207804, 3.017572, 1, 1, 1, 1, 1,
0.3091156, -0.3954206, 2.923594, 1, 1, 1, 1, 1,
0.316946, -0.7184839, 1.272253, 1, 1, 1, 1, 1,
0.3194506, 1.351843, -0.9971946, 1, 1, 1, 1, 1,
0.3214785, -0.1598591, 2.206841, 1, 1, 1, 1, 1,
0.3223746, -0.1995566, 1.756323, 1, 1, 1, 1, 1,
0.3230044, 1.424725, 0.8117715, 0, 0, 1, 1, 1,
0.3234743, -0.8081762, 3.367975, 1, 0, 0, 1, 1,
0.3350192, 1.343529, -0.485506, 1, 0, 0, 1, 1,
0.3390121, 1.526906, 0.9063656, 1, 0, 0, 1, 1,
0.350159, -2.760488, 3.496503, 1, 0, 0, 1, 1,
0.3551788, -0.4803564, 2.031281, 1, 0, 0, 1, 1,
0.3561971, 0.8740582, 0.2289438, 0, 0, 0, 1, 1,
0.3566644, 0.2307755, 0.3377032, 0, 0, 0, 1, 1,
0.3580103, 0.7785097, -0.7036788, 0, 0, 0, 1, 1,
0.3588492, 0.5745148, -0.5524981, 0, 0, 0, 1, 1,
0.3613961, 0.9160339, -1.893729, 0, 0, 0, 1, 1,
0.3624179, -0.3114689, 2.503201, 0, 0, 0, 1, 1,
0.3633032, -0.520945, 3.084063, 0, 0, 0, 1, 1,
0.3656404, 1.5822, -0.8904665, 1, 1, 1, 1, 1,
0.3668019, -1.061464, 2.098314, 1, 1, 1, 1, 1,
0.3689727, 0.1869374, 0.05143525, 1, 1, 1, 1, 1,
0.3741652, 2.015526, 0.2443058, 1, 1, 1, 1, 1,
0.37838, -0.1517913, 3.242375, 1, 1, 1, 1, 1,
0.3785359, 0.16872, 0.9452797, 1, 1, 1, 1, 1,
0.3859831, -0.8670306, 4.377602, 1, 1, 1, 1, 1,
0.3864164, -0.3515787, 2.170329, 1, 1, 1, 1, 1,
0.3880712, 0.05700974, 1.506347, 1, 1, 1, 1, 1,
0.3922306, -1.067419, 3.064385, 1, 1, 1, 1, 1,
0.3939463, -0.1726305, 2.047345, 1, 1, 1, 1, 1,
0.3996761, 0.1347795, 1.393045, 1, 1, 1, 1, 1,
0.4017334, 0.7833586, 1.716622, 1, 1, 1, 1, 1,
0.4026697, 0.3066868, 1.953014, 1, 1, 1, 1, 1,
0.4026737, 0.754815, 1.358904, 1, 1, 1, 1, 1,
0.4176821, 0.06867424, 2.660466, 0, 0, 1, 1, 1,
0.4177947, 0.6882226, 0.6078019, 1, 0, 0, 1, 1,
0.4200668, -0.6795509, 0.9900819, 1, 0, 0, 1, 1,
0.4203152, -2.013098, 4.885123, 1, 0, 0, 1, 1,
0.4212271, -1.659288, 4.436667, 1, 0, 0, 1, 1,
0.4234962, 1.511709, -1.571919, 1, 0, 0, 1, 1,
0.428987, 0.8282387, 0.6993261, 0, 0, 0, 1, 1,
0.4290461, 0.4714833, 1.535102, 0, 0, 0, 1, 1,
0.4314325, 0.4714358, -0.3977155, 0, 0, 0, 1, 1,
0.4333058, -0.1544351, 1.534322, 0, 0, 0, 1, 1,
0.4340205, 0.3615744, 2.527319, 0, 0, 0, 1, 1,
0.4340719, 0.1595059, 2.265016, 0, 0, 0, 1, 1,
0.435556, -0.01538637, 0.8003172, 0, 0, 0, 1, 1,
0.4360791, 0.5981017, 0.7176444, 1, 1, 1, 1, 1,
0.436757, -0.5220568, -0.6254305, 1, 1, 1, 1, 1,
0.4389643, -0.6529651, 0.9777083, 1, 1, 1, 1, 1,
0.4470145, 0.485411, -0.1447679, 1, 1, 1, 1, 1,
0.4478044, -2.197202, 2.962895, 1, 1, 1, 1, 1,
0.4491474, -1.090589, 1.671203, 1, 1, 1, 1, 1,
0.4497107, 0.6661081, 0.922232, 1, 1, 1, 1, 1,
0.4505858, 0.2221418, -1.142887, 1, 1, 1, 1, 1,
0.4521741, -0.548947, 2.897899, 1, 1, 1, 1, 1,
0.4587716, -0.3028283, 2.167847, 1, 1, 1, 1, 1,
0.4591836, 0.00679139, -1.141042, 1, 1, 1, 1, 1,
0.4606688, 0.6081653, 1.329662, 1, 1, 1, 1, 1,
0.4714454, -1.106638, 2.696569, 1, 1, 1, 1, 1,
0.4797409, -0.8814715, 1.109196, 1, 1, 1, 1, 1,
0.4797892, -0.9235021, 3.545864, 1, 1, 1, 1, 1,
0.4835762, 1.232651, 0.6775427, 0, 0, 1, 1, 1,
0.4853555, -0.6384201, 2.805342, 1, 0, 0, 1, 1,
0.4865389, 1.353914, 0.8289168, 1, 0, 0, 1, 1,
0.488187, -1.081855, 3.010611, 1, 0, 0, 1, 1,
0.4889217, -0.9988837, 1.729657, 1, 0, 0, 1, 1,
0.4954484, 0.1863212, 0.5631245, 1, 0, 0, 1, 1,
0.4956939, 0.8152862, -1.065235, 0, 0, 0, 1, 1,
0.496514, 1.658359, 0.6213032, 0, 0, 0, 1, 1,
0.4968527, 0.006696843, 2.784686, 0, 0, 0, 1, 1,
0.4988548, -2.463763, 2.144472, 0, 0, 0, 1, 1,
0.5005608, -0.2200554, 2.031159, 0, 0, 0, 1, 1,
0.5011563, 0.8878195, -0.1495625, 0, 0, 0, 1, 1,
0.501348, -1.889015, 3.681489, 0, 0, 0, 1, 1,
0.501846, 0.8802411, 0.5738713, 1, 1, 1, 1, 1,
0.5023239, 0.7654215, 2.082771, 1, 1, 1, 1, 1,
0.5038652, -0.4963636, 1.059744, 1, 1, 1, 1, 1,
0.5048231, 1.668422, 0.01358793, 1, 1, 1, 1, 1,
0.5099962, 0.3289591, 1.700777, 1, 1, 1, 1, 1,
0.5102564, -0.566111, 2.763944, 1, 1, 1, 1, 1,
0.5134275, 0.1786838, 2.410252, 1, 1, 1, 1, 1,
0.5144241, -1.322741, 4.498819, 1, 1, 1, 1, 1,
0.5185033, -0.8533918, 2.639097, 1, 1, 1, 1, 1,
0.5208449, -0.9328539, 1.66941, 1, 1, 1, 1, 1,
0.5265104, -0.2086615, 1.706202, 1, 1, 1, 1, 1,
0.5271744, 0.6662567, 0.3461718, 1, 1, 1, 1, 1,
0.529262, -0.7744547, -0.3187355, 1, 1, 1, 1, 1,
0.5380217, -0.4387043, 0.8460993, 1, 1, 1, 1, 1,
0.5422128, 0.9115663, -1.306329, 1, 1, 1, 1, 1,
0.5425811, 0.8487395, -0.2303801, 0, 0, 1, 1, 1,
0.543907, 1.261712, -0.6949854, 1, 0, 0, 1, 1,
0.5439519, 0.5862241, 2.147136, 1, 0, 0, 1, 1,
0.5452023, 1.326766, 0.1058547, 1, 0, 0, 1, 1,
0.5466912, -0.3102544, 1.129056, 1, 0, 0, 1, 1,
0.5500439, -1.446286, 1.502988, 1, 0, 0, 1, 1,
0.551652, -0.3802083, 2.944278, 0, 0, 0, 1, 1,
0.5555233, 1.101418, 0.2111204, 0, 0, 0, 1, 1,
0.5561263, 0.5871077, 0.5520015, 0, 0, 0, 1, 1,
0.5588306, -0.07915756, 3.17287, 0, 0, 0, 1, 1,
0.5654867, 0.02829385, 0.6941636, 0, 0, 0, 1, 1,
0.5672784, -0.5368025, 2.452324, 0, 0, 0, 1, 1,
0.5704895, -0.001574069, 0.3036737, 0, 0, 0, 1, 1,
0.5704969, -1.56499, 2.950887, 1, 1, 1, 1, 1,
0.5714301, 1.263084, -0.1554226, 1, 1, 1, 1, 1,
0.5716926, -0.3769281, 1.726549, 1, 1, 1, 1, 1,
0.5859906, 1.154512, 0.9168019, 1, 1, 1, 1, 1,
0.5863772, 0.638571, 0.1204916, 1, 1, 1, 1, 1,
0.5898762, -0.5599872, 2.438187, 1, 1, 1, 1, 1,
0.5936108, -0.1095185, 1.908021, 1, 1, 1, 1, 1,
0.5972698, 0.2904692, 1.588522, 1, 1, 1, 1, 1,
0.5990164, -0.0162161, 0.2203898, 1, 1, 1, 1, 1,
0.6050367, -0.3939314, 1.045628, 1, 1, 1, 1, 1,
0.6084384, 0.7433829, 0.4664133, 1, 1, 1, 1, 1,
0.6133463, -0.6989031, 2.228421, 1, 1, 1, 1, 1,
0.6175979, 0.4835655, 1.168703, 1, 1, 1, 1, 1,
0.6230598, -0.2941102, 1.869322, 1, 1, 1, 1, 1,
0.6248322, 0.5352445, 2.139038, 1, 1, 1, 1, 1,
0.630141, -0.7860393, 0.8068115, 0, 0, 1, 1, 1,
0.6356272, -0.3094746, 1.787322, 1, 0, 0, 1, 1,
0.6373059, 0.8979998, 0.4652608, 1, 0, 0, 1, 1,
0.6424358, 0.09150559, 1.31893, 1, 0, 0, 1, 1,
0.6494653, -1.795373, 3.706687, 1, 0, 0, 1, 1,
0.6513858, 0.8659209, 0.387471, 1, 0, 0, 1, 1,
0.6520823, -0.07528867, 0.1143016, 0, 0, 0, 1, 1,
0.6540335, -0.9136132, 1.452414, 0, 0, 0, 1, 1,
0.654864, -2.333979, 2.615571, 0, 0, 0, 1, 1,
0.6549229, 0.1694467, 1.331931, 0, 0, 0, 1, 1,
0.6565174, 1.522401, 0.8190672, 0, 0, 0, 1, 1,
0.6632266, 0.6819568, 2.473509, 0, 0, 0, 1, 1,
0.6687394, -0.8352118, 0.5368348, 0, 0, 0, 1, 1,
0.6694115, 0.1207551, 1.741138, 1, 1, 1, 1, 1,
0.6705127, 1.327267, 0.057294, 1, 1, 1, 1, 1,
0.6787453, -0.7739136, 3.811147, 1, 1, 1, 1, 1,
0.6798948, 0.2701446, -0.1752999, 1, 1, 1, 1, 1,
0.6803872, 0.2930029, 1.628582, 1, 1, 1, 1, 1,
0.6832022, 0.4114918, -0.1152265, 1, 1, 1, 1, 1,
0.6851638, 2.911324, 0.8794692, 1, 1, 1, 1, 1,
0.6885107, 1.38732, 3.335179, 1, 1, 1, 1, 1,
0.6994351, 0.1891107, -1.995027, 1, 1, 1, 1, 1,
0.7046208, 0.3129645, -0.3768529, 1, 1, 1, 1, 1,
0.7055188, 0.4743401, 1.716984, 1, 1, 1, 1, 1,
0.7073192, 1.306547, 2.093945, 1, 1, 1, 1, 1,
0.7100582, -0.4528684, 2.715617, 1, 1, 1, 1, 1,
0.7195343, 2.565105, -1.908966, 1, 1, 1, 1, 1,
0.72342, 0.1123559, 1.445267, 1, 1, 1, 1, 1,
0.7289847, -1.311716, 1.090502, 0, 0, 1, 1, 1,
0.7298399, -0.2601995, 0.8803431, 1, 0, 0, 1, 1,
0.7300189, -1.326233, 3.441143, 1, 0, 0, 1, 1,
0.7314225, -0.4103647, 2.339433, 1, 0, 0, 1, 1,
0.734503, 0.450213, 0.9721979, 1, 0, 0, 1, 1,
0.7351291, -0.3155385, 0.4258139, 1, 0, 0, 1, 1,
0.7365925, -1.031629, 1.458292, 0, 0, 0, 1, 1,
0.7425729, -1.789975, 0.945902, 0, 0, 0, 1, 1,
0.7428289, 0.07950655, 1.832156, 0, 0, 0, 1, 1,
0.7469575, 1.024091, 0.04857849, 0, 0, 0, 1, 1,
0.7564, 0.2733932, 1.821156, 0, 0, 0, 1, 1,
0.7678565, -0.08379409, 1.629863, 0, 0, 0, 1, 1,
0.7724779, 0.589488, 2.197488, 0, 0, 0, 1, 1,
0.7736207, 1.284477, 2.280751, 1, 1, 1, 1, 1,
0.7743152, -0.7868474, 1.387521, 1, 1, 1, 1, 1,
0.776405, 0.8698556, 1.54303, 1, 1, 1, 1, 1,
0.7817874, 0.1418511, 0.1460835, 1, 1, 1, 1, 1,
0.7876883, -0.6169147, 3.94183, 1, 1, 1, 1, 1,
0.789409, 1.589587, 1.282808, 1, 1, 1, 1, 1,
0.7897717, 0.3461131, 0.9007554, 1, 1, 1, 1, 1,
0.7967773, -0.1274467, -0.2091883, 1, 1, 1, 1, 1,
0.7986062, -1.182905, 2.721117, 1, 1, 1, 1, 1,
0.799185, 0.07341751, -0.02018026, 1, 1, 1, 1, 1,
0.8082564, 0.7136149, 0.6793921, 1, 1, 1, 1, 1,
0.8099248, -1.296616, 4.443711, 1, 1, 1, 1, 1,
0.8102968, 2.424808, -1.49731, 1, 1, 1, 1, 1,
0.8142054, 0.7878635, 1.760623, 1, 1, 1, 1, 1,
0.8142757, 0.1340977, 2.610345, 1, 1, 1, 1, 1,
0.8151262, -1.301628, 2.089699, 0, 0, 1, 1, 1,
0.8232035, 1.687458, 0.5307007, 1, 0, 0, 1, 1,
0.8234648, 1.319718, -0.01501905, 1, 0, 0, 1, 1,
0.8262019, -0.4872031, 1.012165, 1, 0, 0, 1, 1,
0.8265218, -1.456569, 2.732719, 1, 0, 0, 1, 1,
0.8273521, -0.01878055, 0.9777811, 1, 0, 0, 1, 1,
0.8308672, -0.3727751, 2.160062, 0, 0, 0, 1, 1,
0.8333252, 1.031024, 2.52278, 0, 0, 0, 1, 1,
0.835095, 0.08181612, 0.3757626, 0, 0, 0, 1, 1,
0.8406753, 0.13523, 1.106882, 0, 0, 0, 1, 1,
0.8408537, 0.3241256, 1.438937, 0, 0, 0, 1, 1,
0.8426619, -0.3478107, 0.2022776, 0, 0, 0, 1, 1,
0.8486074, 0.01711953, 1.489698, 0, 0, 0, 1, 1,
0.8557603, 3.587305, 2.148223, 1, 1, 1, 1, 1,
0.8559008, 1.206236, 0.5520309, 1, 1, 1, 1, 1,
0.8581411, 0.4148463, 1.317628, 1, 1, 1, 1, 1,
0.8635853, 0.1976155, 0.3601237, 1, 1, 1, 1, 1,
0.8664224, -0.390322, 0.7510337, 1, 1, 1, 1, 1,
0.8758708, -0.3841262, 2.774519, 1, 1, 1, 1, 1,
0.8760076, 1.464118, -1.537667, 1, 1, 1, 1, 1,
0.8777823, 1.197492, 0.653513, 1, 1, 1, 1, 1,
0.8811502, 1.012784, 0.3628176, 1, 1, 1, 1, 1,
0.8823277, -0.1467559, 2.145379, 1, 1, 1, 1, 1,
0.8827296, 0.6980188, 0.1335077, 1, 1, 1, 1, 1,
0.8830105, 0.4450292, 1.837342, 1, 1, 1, 1, 1,
0.8946858, 0.1374987, -0.2990334, 1, 1, 1, 1, 1,
0.8968317, -0.1167808, 0.2313302, 1, 1, 1, 1, 1,
0.8995013, -0.7570271, 2.541343, 1, 1, 1, 1, 1,
0.9009925, -0.2660961, 0.3042088, 0, 0, 1, 1, 1,
0.9023564, -0.4640527, 1.631445, 1, 0, 0, 1, 1,
0.906442, -1.300432, 1.373643, 1, 0, 0, 1, 1,
0.9084411, -0.9768568, 2.931759, 1, 0, 0, 1, 1,
0.9142796, 1.548515, 0.7451059, 1, 0, 0, 1, 1,
0.9152098, 0.02344594, 1.302103, 1, 0, 0, 1, 1,
0.9176884, 1.105834, -0.339924, 0, 0, 0, 1, 1,
0.9227446, -0.748697, 2.502544, 0, 0, 0, 1, 1,
0.9246347, -0.880441, 1.026538, 0, 0, 0, 1, 1,
0.9278065, -1.908798, 4.085664, 0, 0, 0, 1, 1,
0.9282156, 0.7133548, 0.9728864, 0, 0, 0, 1, 1,
0.9283011, 0.2503622, 4.067138, 0, 0, 0, 1, 1,
0.932757, 0.1877959, 1.572102, 0, 0, 0, 1, 1,
0.9336239, 0.7276994, 0.7899598, 1, 1, 1, 1, 1,
0.9352382, -0.7686266, 1.710001, 1, 1, 1, 1, 1,
0.9396534, 0.6175705, -0.09570716, 1, 1, 1, 1, 1,
0.9400397, -0.7479185, 2.69214, 1, 1, 1, 1, 1,
0.9409032, -0.718787, 0.9088982, 1, 1, 1, 1, 1,
0.9440849, 0.3140401, 0.6604038, 1, 1, 1, 1, 1,
0.9520795, -1.938115, 2.671821, 1, 1, 1, 1, 1,
0.9524705, -0.1043696, 2.697899, 1, 1, 1, 1, 1,
0.9759982, 0.135178, 2.731928, 1, 1, 1, 1, 1,
0.9871069, -0.4812115, 0.5048305, 1, 1, 1, 1, 1,
0.9891204, -0.5462378, 0.9292625, 1, 1, 1, 1, 1,
0.9913676, -0.219109, 0.8814201, 1, 1, 1, 1, 1,
0.9940832, 0.2637115, 2.695774, 1, 1, 1, 1, 1,
0.999021, -0.631862, -0.3311312, 1, 1, 1, 1, 1,
0.9998519, 0.685581, 1.120347, 1, 1, 1, 1, 1,
1.009928, -0.5320087, 1.772052, 0, 0, 1, 1, 1,
1.011882, 1.833893, 0.01995674, 1, 0, 0, 1, 1,
1.015828, 0.2405577, 0.6551731, 1, 0, 0, 1, 1,
1.016829, -0.8784076, 3.656752, 1, 0, 0, 1, 1,
1.017391, 0.4683984, 1.249489, 1, 0, 0, 1, 1,
1.017615, -0.448846, 1.685139, 1, 0, 0, 1, 1,
1.018634, 1.277563, -0.9374589, 0, 0, 0, 1, 1,
1.033483, -0.6232361, 2.287267, 0, 0, 0, 1, 1,
1.041512, -1.264608, 4.035601, 0, 0, 0, 1, 1,
1.050923, 0.3540912, 1.710421, 0, 0, 0, 1, 1,
1.055628, -1.418779, 3.815578, 0, 0, 0, 1, 1,
1.056028, 2.128155, -0.8304829, 0, 0, 0, 1, 1,
1.057691, 0.8826875, -1.565955, 0, 0, 0, 1, 1,
1.059973, -0.6129398, 1.528291, 1, 1, 1, 1, 1,
1.0613, 0.8352487, 1.822369, 1, 1, 1, 1, 1,
1.061378, 0.63866, 1.241203, 1, 1, 1, 1, 1,
1.079437, 1.152649, 0.8981086, 1, 1, 1, 1, 1,
1.079581, 0.8749233, 2.43745, 1, 1, 1, 1, 1,
1.084324, -0.5455268, 2.673669, 1, 1, 1, 1, 1,
1.089336, 1.136321, 0.7638204, 1, 1, 1, 1, 1,
1.09457, 0.2523797, 0.01299887, 1, 1, 1, 1, 1,
1.096471, -0.2556749, 1.685048, 1, 1, 1, 1, 1,
1.100449, 0.2248208, 2.171435, 1, 1, 1, 1, 1,
1.1028, -0.165215, 1.43346, 1, 1, 1, 1, 1,
1.102941, -0.4412672, 3.676117, 1, 1, 1, 1, 1,
1.103998, -0.7873107, 4.719217, 1, 1, 1, 1, 1,
1.109663, 0.5257479, 2.45605, 1, 1, 1, 1, 1,
1.113054, -0.1092166, 0.5793566, 1, 1, 1, 1, 1,
1.124909, 0.005889999, 1.392563, 0, 0, 1, 1, 1,
1.127386, 0.6065631, 1.614215, 1, 0, 0, 1, 1,
1.127483, 0.3903952, -1.40593, 1, 0, 0, 1, 1,
1.128995, 0.8072029, 0.3957386, 1, 0, 0, 1, 1,
1.129631, 0.8212896, 2.201993, 1, 0, 0, 1, 1,
1.132642, 0.8965822, 2.174296, 1, 0, 0, 1, 1,
1.141031, -0.6009535, 1.696562, 0, 0, 0, 1, 1,
1.144614, -1.892797, 1.927981, 0, 0, 0, 1, 1,
1.144904, 0.2756703, -0.05268446, 0, 0, 0, 1, 1,
1.15183, 0.7648, 0.7231902, 0, 0, 0, 1, 1,
1.165538, 1.258738, -0.3055515, 0, 0, 0, 1, 1,
1.165932, -2.36377, 2.22384, 0, 0, 0, 1, 1,
1.174752, 0.2821421, 1.819207, 0, 0, 0, 1, 1,
1.181895, -1.273833, 3.855284, 1, 1, 1, 1, 1,
1.183289, 0.3369192, 2.149314, 1, 1, 1, 1, 1,
1.190529, 1.293684, 0.2372611, 1, 1, 1, 1, 1,
1.191108, -0.2198921, 0.8168434, 1, 1, 1, 1, 1,
1.191794, -0.04561939, 3.275787, 1, 1, 1, 1, 1,
1.1929, -0.8412079, 3.01404, 1, 1, 1, 1, 1,
1.197516, -0.945619, 2.821476, 1, 1, 1, 1, 1,
1.199297, -1.06443, 2.186238, 1, 1, 1, 1, 1,
1.199968, 1.097319, 0.502257, 1, 1, 1, 1, 1,
1.202453, 0.4855403, 1.822619, 1, 1, 1, 1, 1,
1.208993, 0.9298995, 1.292401, 1, 1, 1, 1, 1,
1.215247, 0.0353505, 1.424061, 1, 1, 1, 1, 1,
1.218627, 0.031949, 1.392261, 1, 1, 1, 1, 1,
1.235564, -0.01116611, 0.4729486, 1, 1, 1, 1, 1,
1.252195, -2.024328, 3.622618, 1, 1, 1, 1, 1,
1.254457, 0.08639842, 1.801472, 0, 0, 1, 1, 1,
1.260112, 1.335815, 1.864187, 1, 0, 0, 1, 1,
1.266368, -0.7952309, 3.697281, 1, 0, 0, 1, 1,
1.276896, -0.6918621, 2.272813, 1, 0, 0, 1, 1,
1.279308, -0.2142237, 2.580581, 1, 0, 0, 1, 1,
1.280391, 0.3567688, 2.43794, 1, 0, 0, 1, 1,
1.281107, 0.2452525, 2.485151, 0, 0, 0, 1, 1,
1.284084, 1.483989, 2.582942, 0, 0, 0, 1, 1,
1.305665, 0.1293979, 1.458631, 0, 0, 0, 1, 1,
1.308794, -0.3524702, 1.128433, 0, 0, 0, 1, 1,
1.310229, -1.90397, 2.655744, 0, 0, 0, 1, 1,
1.311499, -1.409205, 0.7030009, 0, 0, 0, 1, 1,
1.312905, -0.3107977, 1.815888, 0, 0, 0, 1, 1,
1.317396, 1.816301, 1.802518, 1, 1, 1, 1, 1,
1.329527, -0.201655, 3.063186, 1, 1, 1, 1, 1,
1.32985, 0.2553504, 1.697915, 1, 1, 1, 1, 1,
1.330415, 1.136764, -0.7992858, 1, 1, 1, 1, 1,
1.330653, 0.4253188, 3.651713, 1, 1, 1, 1, 1,
1.33584, 0.002200189, 1.509313, 1, 1, 1, 1, 1,
1.336069, -0.152069, 1.24333, 1, 1, 1, 1, 1,
1.345583, -1.199729, 3.438648, 1, 1, 1, 1, 1,
1.350173, 1.045839, 2.127115, 1, 1, 1, 1, 1,
1.358855, -1.851208, 1.878252, 1, 1, 1, 1, 1,
1.360258, -0.7260271, 1.902017, 1, 1, 1, 1, 1,
1.37069, -0.8759731, 0.2794273, 1, 1, 1, 1, 1,
1.377783, 0.07031324, 2.49363, 1, 1, 1, 1, 1,
1.38911, -3.208888, 2.288749, 1, 1, 1, 1, 1,
1.390552, 0.7850661, -0.3848713, 1, 1, 1, 1, 1,
1.393847, -0.2848743, 2.080398, 0, 0, 1, 1, 1,
1.394662, -0.8048956, 2.498532, 1, 0, 0, 1, 1,
1.397343, 0.8718487, 1.626492, 1, 0, 0, 1, 1,
1.399663, -0.3161331, 1.235876, 1, 0, 0, 1, 1,
1.406836, 0.4710906, 1.233816, 1, 0, 0, 1, 1,
1.409237, 0.5416375, 1.786125, 1, 0, 0, 1, 1,
1.415967, 1.428582, 0.857201, 0, 0, 0, 1, 1,
1.417627, -0.8248302, 0.67161, 0, 0, 0, 1, 1,
1.417635, 0.9591841, 2.116425, 0, 0, 0, 1, 1,
1.424407, 0.8827749, 1.30171, 0, 0, 0, 1, 1,
1.425099, -0.04921758, 1.043062, 0, 0, 0, 1, 1,
1.469542, 0.03652606, 1.569702, 0, 0, 0, 1, 1,
1.47093, 1.017195, 0.5380271, 0, 0, 0, 1, 1,
1.4712, -1.914723, 3.085171, 1, 1, 1, 1, 1,
1.474612, -1.043727, 2.703831, 1, 1, 1, 1, 1,
1.490114, -0.2610206, -0.4183482, 1, 1, 1, 1, 1,
1.496401, 1.804835, 1.385287, 1, 1, 1, 1, 1,
1.506201, 0.4405107, 1.5661, 1, 1, 1, 1, 1,
1.507105, 0.02902355, 3.281578, 1, 1, 1, 1, 1,
1.507419, 1.19988, -0.1038299, 1, 1, 1, 1, 1,
1.507687, -2.989593, 2.89339, 1, 1, 1, 1, 1,
1.519507, -0.5431392, 3.341171, 1, 1, 1, 1, 1,
1.536977, -0.7559094, 1.89511, 1, 1, 1, 1, 1,
1.541062, 0.4623224, 0.243886, 1, 1, 1, 1, 1,
1.552285, -0.8999236, 1.116429, 1, 1, 1, 1, 1,
1.570531, -0.7105633, 1.750208, 1, 1, 1, 1, 1,
1.571196, 0.4114174, 2.576375, 1, 1, 1, 1, 1,
1.572793, -0.5555645, 2.906889, 1, 1, 1, 1, 1,
1.586963, 0.4779439, 0.9016939, 0, 0, 1, 1, 1,
1.594289, -1.547349, 2.081656, 1, 0, 0, 1, 1,
1.598949, 2.191714, 2.360626, 1, 0, 0, 1, 1,
1.605645, 0.9988915, -0.383566, 1, 0, 0, 1, 1,
1.61228, 0.8148335, 3.13386, 1, 0, 0, 1, 1,
1.615131, 0.8579477, 2.290134, 1, 0, 0, 1, 1,
1.617814, 0.8464078, 2.722514, 0, 0, 0, 1, 1,
1.621978, 1.495096, -0.8517919, 0, 0, 0, 1, 1,
1.622924, 1.250019, 2.32567, 0, 0, 0, 1, 1,
1.626576, -2.493208, 2.729488, 0, 0, 0, 1, 1,
1.649038, -0.8643619, 4.223939, 0, 0, 0, 1, 1,
1.66527, -0.01444572, 1.52754, 0, 0, 0, 1, 1,
1.676042, -3.369953, 4.133704, 0, 0, 0, 1, 1,
1.74163, -0.6545637, 3.404121, 1, 1, 1, 1, 1,
1.74381, 0.2833216, 0.6924822, 1, 1, 1, 1, 1,
1.745145, -0.3679483, 2.933435, 1, 1, 1, 1, 1,
1.753327, -0.3537557, 2.462304, 1, 1, 1, 1, 1,
1.762764, -1.583299, 1.465876, 1, 1, 1, 1, 1,
1.786397, 0.09896685, 1.814788, 1, 1, 1, 1, 1,
1.799537, -0.3336553, 1.633457, 1, 1, 1, 1, 1,
1.800219, -0.02472383, 1.366241, 1, 1, 1, 1, 1,
1.867729, -0.4441521, 1.458004, 1, 1, 1, 1, 1,
1.885247, 1.701772, -1.463147, 1, 1, 1, 1, 1,
1.891949, -1.464532, 2.00517, 1, 1, 1, 1, 1,
1.900881, 0.4525678, 1.178066, 1, 1, 1, 1, 1,
1.941486, 1.049932, 2.448757, 1, 1, 1, 1, 1,
1.955943, -1.389212, 1.884843, 1, 1, 1, 1, 1,
1.956937, 0.4275222, -0.1778344, 1, 1, 1, 1, 1,
1.97699, -0.693419, 0.2468199, 0, 0, 1, 1, 1,
2.015502, -0.9008798, 2.374058, 1, 0, 0, 1, 1,
2.030854, 0.2385426, 0.7370405, 1, 0, 0, 1, 1,
2.032668, -0.4973983, 1.233509, 1, 0, 0, 1, 1,
2.074428, -1.233532, 1.400898, 1, 0, 0, 1, 1,
2.103893, -0.7188473, 1.950187, 1, 0, 0, 1, 1,
2.104177, 0.44484, 1.049832, 0, 0, 0, 1, 1,
2.129318, 0.9383482, 1.921609, 0, 0, 0, 1, 1,
2.167364, -0.3477507, 1.795194, 0, 0, 0, 1, 1,
2.167716, 1.349089, 0.9185316, 0, 0, 0, 1, 1,
2.168844, 0.5619543, 0.4533035, 0, 0, 0, 1, 1,
2.304847, 0.7353765, -0.07731678, 0, 0, 0, 1, 1,
2.341535, 0.6647431, 2.078163, 0, 0, 0, 1, 1,
2.347386, -2.542434, 2.345676, 1, 1, 1, 1, 1,
2.38502, -0.4051019, 2.991011, 1, 1, 1, 1, 1,
2.510853, -0.02577882, 2.320795, 1, 1, 1, 1, 1,
2.542157, -0.08564247, -0.6816742, 1, 1, 1, 1, 1,
2.777089, -1.025091, 1.475836, 1, 1, 1, 1, 1,
2.931016, 1.921794, 2.355467, 1, 1, 1, 1, 1,
3.232508, -1.493107, 2.201145, 1, 1, 1, 1, 1
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
var radius = 9.542613;
var distance = 33.51802;
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
mvMatrix.translate( -0.07104206, -0.1086757, 0.1352806 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.51802);
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