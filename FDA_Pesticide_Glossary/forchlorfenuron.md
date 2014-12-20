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
-2.819676, 0.828954, 1.132933, 1, 0, 0, 1,
-2.761729, 0.2078321, -1.55125, 1, 0.007843138, 0, 1,
-2.700081, 1.737288, -1.670768, 1, 0.01176471, 0, 1,
-2.59603, 0.5384585, -1.854341, 1, 0.01960784, 0, 1,
-2.58993, -0.3951343, -3.406446, 1, 0.02352941, 0, 1,
-2.497082, -0.1390165, -2.767261, 1, 0.03137255, 0, 1,
-2.467201, 0.5615376, -1.99331, 1, 0.03529412, 0, 1,
-2.434907, -0.1749817, -1.478937, 1, 0.04313726, 0, 1,
-2.407182, -1.070691, -2.204314, 1, 0.04705882, 0, 1,
-2.362226, -0.2140003, -0.9510463, 1, 0.05490196, 0, 1,
-2.33408, 0.402677, -0.6631616, 1, 0.05882353, 0, 1,
-2.248785, 1.123361, -1.77587, 1, 0.06666667, 0, 1,
-2.184119, 0.8986945, 0.4948859, 1, 0.07058824, 0, 1,
-2.170655, -0.5272062, -1.296718, 1, 0.07843138, 0, 1,
-2.149336, 0.3247337, 0.4243197, 1, 0.08235294, 0, 1,
-2.121413, 0.4780171, -0.8988932, 1, 0.09019608, 0, 1,
-2.109927, 0.371603, -1.809326, 1, 0.09411765, 0, 1,
-2.103398, -0.8684004, -2.011572, 1, 0.1019608, 0, 1,
-2.088853, 1.223056, -0.3455842, 1, 0.1098039, 0, 1,
-2.075162, -1.779603, -2.699367, 1, 0.1137255, 0, 1,
-2.06485, 0.07195344, -0.0521581, 1, 0.1215686, 0, 1,
-2.064716, -0.1713726, -1.448706, 1, 0.1254902, 0, 1,
-2.040648, 0.9938346, -0.4049509, 1, 0.1333333, 0, 1,
-2.031116, 0.8001245, -2.214819, 1, 0.1372549, 0, 1,
-2.015529, -0.3139153, -1.359195, 1, 0.145098, 0, 1,
-2.001316, 0.4072967, -0.9198119, 1, 0.1490196, 0, 1,
-1.984318, 0.6943212, -2.666076, 1, 0.1568628, 0, 1,
-1.979782, -0.6354409, -1.797019, 1, 0.1607843, 0, 1,
-1.951297, 1.655788, -1.310916, 1, 0.1686275, 0, 1,
-1.897764, -0.8215382, -2.280175, 1, 0.172549, 0, 1,
-1.89545, 0.2829712, -1.912384, 1, 0.1803922, 0, 1,
-1.798596, -1.062699, -1.707386, 1, 0.1843137, 0, 1,
-1.788789, 0.2066029, -1.789113, 1, 0.1921569, 0, 1,
-1.753172, 0.7955878, -1.954836, 1, 0.1960784, 0, 1,
-1.73693, 0.6652227, -0.05163712, 1, 0.2039216, 0, 1,
-1.720284, 0.515883, 0.02303023, 1, 0.2117647, 0, 1,
-1.717434, -0.1306762, -3.581593, 1, 0.2156863, 0, 1,
-1.715723, 1.511955, -0.8839774, 1, 0.2235294, 0, 1,
-1.69129, -1.308879, -0.5262104, 1, 0.227451, 0, 1,
-1.669692, 0.554307, -1.693927, 1, 0.2352941, 0, 1,
-1.66897, -1.51033, -0.7375174, 1, 0.2392157, 0, 1,
-1.634751, -0.5576034, -2.022207, 1, 0.2470588, 0, 1,
-1.631228, -1.717571, -2.38736, 1, 0.2509804, 0, 1,
-1.623295, -1.108811, -1.922976, 1, 0.2588235, 0, 1,
-1.622266, -1.080929, -0.2080577, 1, 0.2627451, 0, 1,
-1.621719, 0.2923839, 0.1316842, 1, 0.2705882, 0, 1,
-1.605997, 0.1548455, -4.057965, 1, 0.2745098, 0, 1,
-1.603953, 0.2205784, -2.823818, 1, 0.282353, 0, 1,
-1.597085, -1.198497, -1.797127, 1, 0.2862745, 0, 1,
-1.582498, 0.8171606, -1.449531, 1, 0.2941177, 0, 1,
-1.566399, -1.462481, -1.671924, 1, 0.3019608, 0, 1,
-1.538418, -0.2738295, -1.292982, 1, 0.3058824, 0, 1,
-1.534894, -1.762807, -1.474114, 1, 0.3137255, 0, 1,
-1.531707, 1.144277, -0.9320862, 1, 0.3176471, 0, 1,
-1.519407, -0.3818964, -0.9353567, 1, 0.3254902, 0, 1,
-1.517602, -0.9357918, -1.123711, 1, 0.3294118, 0, 1,
-1.514274, -2.084768, -2.925505, 1, 0.3372549, 0, 1,
-1.505674, 0.9702369, -0.448288, 1, 0.3411765, 0, 1,
-1.500453, -0.3706547, -2.330037, 1, 0.3490196, 0, 1,
-1.496663, -0.2502221, -1.417827, 1, 0.3529412, 0, 1,
-1.496272, 0.4734314, -0.5860301, 1, 0.3607843, 0, 1,
-1.477453, -1.032546, -2.37402, 1, 0.3647059, 0, 1,
-1.471766, -0.6162305, -1.180047, 1, 0.372549, 0, 1,
-1.471264, 0.1278761, -4.148844, 1, 0.3764706, 0, 1,
-1.443427, -0.4106134, -3.137705, 1, 0.3843137, 0, 1,
-1.423682, 0.841401, -0.8248397, 1, 0.3882353, 0, 1,
-1.415942, -0.0116997, -2.504592, 1, 0.3960784, 0, 1,
-1.407649, 0.5969439, -0.8101051, 1, 0.4039216, 0, 1,
-1.402806, -0.1333451, 1.086029, 1, 0.4078431, 0, 1,
-1.398599, 0.6066613, -1.213739, 1, 0.4156863, 0, 1,
-1.396813, -1.086908, -4.683665, 1, 0.4196078, 0, 1,
-1.396771, -1.175701, -1.31161, 1, 0.427451, 0, 1,
-1.395834, 0.4875818, 0.7994819, 1, 0.4313726, 0, 1,
-1.388285, -0.9053495, -2.233541, 1, 0.4392157, 0, 1,
-1.381696, 0.8623989, -0.1214777, 1, 0.4431373, 0, 1,
-1.37351, 0.1507043, -3.057511, 1, 0.4509804, 0, 1,
-1.366733, 0.9508857, 0.6611522, 1, 0.454902, 0, 1,
-1.355678, 0.4626504, -1.840874, 1, 0.4627451, 0, 1,
-1.354543, 1.873676, -0.449096, 1, 0.4666667, 0, 1,
-1.354366, 1.79809, -2.16535, 1, 0.4745098, 0, 1,
-1.353135, -0.3255776, -3.100533, 1, 0.4784314, 0, 1,
-1.347756, 0.1440074, -0.8064663, 1, 0.4862745, 0, 1,
-1.346315, 0.4585282, -1.046222, 1, 0.4901961, 0, 1,
-1.345331, 0.6819819, -1.198172, 1, 0.4980392, 0, 1,
-1.332345, 0.5892832, -2.229789, 1, 0.5058824, 0, 1,
-1.308914, 0.6423914, -1.004509, 1, 0.509804, 0, 1,
-1.308714, -0.1261369, -1.977998, 1, 0.5176471, 0, 1,
-1.307871, 1.28617, -1.518637, 1, 0.5215687, 0, 1,
-1.298897, -1.251208, -2.992476, 1, 0.5294118, 0, 1,
-1.296079, 0.2174689, -0.5203543, 1, 0.5333334, 0, 1,
-1.282694, -0.02165607, -1.799666, 1, 0.5411765, 0, 1,
-1.279056, -2.054004, -1.864435, 1, 0.5450981, 0, 1,
-1.278653, 1.869379, -2.270199, 1, 0.5529412, 0, 1,
-1.273864, -0.4283501, -1.796796, 1, 0.5568628, 0, 1,
-1.264897, -0.6752563, -2.479546, 1, 0.5647059, 0, 1,
-1.259256, 0.5153881, 1.050416, 1, 0.5686275, 0, 1,
-1.241493, -1.14632, -2.996872, 1, 0.5764706, 0, 1,
-1.237544, -3.550478, -2.351444, 1, 0.5803922, 0, 1,
-1.230355, 0.1268448, -1.133467, 1, 0.5882353, 0, 1,
-1.223995, 0.7543224, -0.06114524, 1, 0.5921569, 0, 1,
-1.201634, 0.001618308, -2.936872, 1, 0.6, 0, 1,
-1.197716, -0.8827102, -3.685781, 1, 0.6078432, 0, 1,
-1.195944, 1.167408, -1.32213, 1, 0.6117647, 0, 1,
-1.19416, 0.08715494, -1.723435, 1, 0.6196079, 0, 1,
-1.193711, -1.460541, -2.64587, 1, 0.6235294, 0, 1,
-1.193701, -0.753706, -3.13001, 1, 0.6313726, 0, 1,
-1.193693, 0.8751724, -0.2200186, 1, 0.6352941, 0, 1,
-1.189975, -0.4074984, -0.3594169, 1, 0.6431373, 0, 1,
-1.184848, 0.3147568, -2.510152, 1, 0.6470588, 0, 1,
-1.181613, 1.228854, -0.03193848, 1, 0.654902, 0, 1,
-1.174793, -0.8365877, -3.291998, 1, 0.6588235, 0, 1,
-1.15426, -0.1199596, -3.258626, 1, 0.6666667, 0, 1,
-1.151962, 0.9952118, -1.045458, 1, 0.6705883, 0, 1,
-1.148731, -1.010781, -2.192641, 1, 0.6784314, 0, 1,
-1.146897, -0.9065921, -2.659541, 1, 0.682353, 0, 1,
-1.135168, -1.334439, -0.4574962, 1, 0.6901961, 0, 1,
-1.128913, -0.877946, -1.973435, 1, 0.6941177, 0, 1,
-1.113244, -0.5566174, -1.835317, 1, 0.7019608, 0, 1,
-1.104628, 0.252158, -0.9716616, 1, 0.7098039, 0, 1,
-1.102876, 0.04570604, -1.243641, 1, 0.7137255, 0, 1,
-1.102058, -1.175276, -3.107013, 1, 0.7215686, 0, 1,
-1.097726, 1.094159, -0.9183401, 1, 0.7254902, 0, 1,
-1.088472, 1.795122, 0.4060123, 1, 0.7333333, 0, 1,
-1.070448, 0.4437667, -4.269593, 1, 0.7372549, 0, 1,
-1.066659, -0.3513772, -1.888988, 1, 0.7450981, 0, 1,
-1.062845, -0.1236826, -1.741924, 1, 0.7490196, 0, 1,
-1.058489, -2.508137, -2.925014, 1, 0.7568628, 0, 1,
-1.053009, 0.1873143, -2.265966, 1, 0.7607843, 0, 1,
-1.052607, -0.6993353, -0.2499141, 1, 0.7686275, 0, 1,
-1.041619, -0.2584839, -2.677068, 1, 0.772549, 0, 1,
-1.0379, -0.8075358, -2.625591, 1, 0.7803922, 0, 1,
-1.031914, -1.355393, -1.647586, 1, 0.7843137, 0, 1,
-1.025647, -1.182614, -3.100205, 1, 0.7921569, 0, 1,
-1.022623, -0.2479137, -1.972631, 1, 0.7960784, 0, 1,
-1.019118, 1.03662, -0.7055104, 1, 0.8039216, 0, 1,
-1.018674, 1.461599, -1.05818, 1, 0.8117647, 0, 1,
-0.9955208, 0.2359522, -1.182786, 1, 0.8156863, 0, 1,
-0.994511, 0.1026854, -1.022976, 1, 0.8235294, 0, 1,
-0.9940997, 1.069422, -1.280512, 1, 0.827451, 0, 1,
-0.9891161, -0.5961134, -1.445599, 1, 0.8352941, 0, 1,
-0.9715663, 0.3046748, -1.913501, 1, 0.8392157, 0, 1,
-0.969359, -2.415635, -3.115132, 1, 0.8470588, 0, 1,
-0.9632232, 0.3609002, -1.190045, 1, 0.8509804, 0, 1,
-0.9607162, 1.202498, 0.5010605, 1, 0.8588235, 0, 1,
-0.9592072, -0.2803029, -1.435353, 1, 0.8627451, 0, 1,
-0.9536676, 0.361246, 0.2772196, 1, 0.8705882, 0, 1,
-0.9521984, -0.8366168, -3.311893, 1, 0.8745098, 0, 1,
-0.951766, -0.7392179, -2.784299, 1, 0.8823529, 0, 1,
-0.9433399, 1.477644, -0.4612084, 1, 0.8862745, 0, 1,
-0.9408863, -0.9157141, -3.020508, 1, 0.8941177, 0, 1,
-0.9377701, 0.8275748, -0.9997816, 1, 0.8980392, 0, 1,
-0.9318124, -2.715962, -2.920922, 1, 0.9058824, 0, 1,
-0.9287455, -0.8535866, -3.14905, 1, 0.9137255, 0, 1,
-0.9267161, -1.469464, -1.804889, 1, 0.9176471, 0, 1,
-0.9230112, -1.402426, -1.530595, 1, 0.9254902, 0, 1,
-0.9225304, 2.02125, 0.2359606, 1, 0.9294118, 0, 1,
-0.9177619, -1.757453, -3.815476, 1, 0.9372549, 0, 1,
-0.9162173, -1.325024, -3.691657, 1, 0.9411765, 0, 1,
-0.9108962, 0.7312901, 0.5311526, 1, 0.9490196, 0, 1,
-0.9022, 0.779217, -0.02992925, 1, 0.9529412, 0, 1,
-0.9021908, -0.3567106, -2.387794, 1, 0.9607843, 0, 1,
-0.8945286, 0.2809756, -2.243131, 1, 0.9647059, 0, 1,
-0.8855119, -0.5493318, -2.795064, 1, 0.972549, 0, 1,
-0.8854774, 1.240529, -1.365693, 1, 0.9764706, 0, 1,
-0.8850822, 1.082063, -0.4559981, 1, 0.9843137, 0, 1,
-0.876521, -1.217165, -4.230837, 1, 0.9882353, 0, 1,
-0.8758031, -0.4341182, -2.967383, 1, 0.9960784, 0, 1,
-0.8708469, 0.4542147, -1.925084, 0.9960784, 1, 0, 1,
-0.8676414, 0.9097074, -0.5531975, 0.9921569, 1, 0, 1,
-0.8652962, -0.4693445, -1.808998, 0.9843137, 1, 0, 1,
-0.8565645, -1.667512, -2.919011, 0.9803922, 1, 0, 1,
-0.855608, -0.1239876, -3.059143, 0.972549, 1, 0, 1,
-0.8523473, 0.3461425, -0.9667571, 0.9686275, 1, 0, 1,
-0.8480803, 1.053631, -0.8186956, 0.9607843, 1, 0, 1,
-0.8464843, -1.343227, -2.605656, 0.9568627, 1, 0, 1,
-0.8342547, -1.645411, -2.643569, 0.9490196, 1, 0, 1,
-0.8308904, 0.4080748, -2.505943, 0.945098, 1, 0, 1,
-0.8302656, -1.247001, -1.758458, 0.9372549, 1, 0, 1,
-0.8266047, -0.5699829, -2.29635, 0.9333333, 1, 0, 1,
-0.8248562, -0.192417, -0.05081649, 0.9254902, 1, 0, 1,
-0.8248283, 0.5454634, -0.9668502, 0.9215686, 1, 0, 1,
-0.8209949, -0.7359011, -3.594274, 0.9137255, 1, 0, 1,
-0.8188894, 1.077215, -2.240426, 0.9098039, 1, 0, 1,
-0.8174262, 0.06013611, -2.150487, 0.9019608, 1, 0, 1,
-0.8125967, -1.219022, -3.273885, 0.8941177, 1, 0, 1,
-0.8108245, 0.6076469, -0.2939412, 0.8901961, 1, 0, 1,
-0.8052546, 0.3586543, -0.1783714, 0.8823529, 1, 0, 1,
-0.8045218, 0.7868024, -0.02853096, 0.8784314, 1, 0, 1,
-0.7922353, 1.219522, -0.1670239, 0.8705882, 1, 0, 1,
-0.7869139, -0.2764117, -0.9119468, 0.8666667, 1, 0, 1,
-0.7834874, 0.3427064, -2.001958, 0.8588235, 1, 0, 1,
-0.7767426, -0.2713578, -1.731185, 0.854902, 1, 0, 1,
-0.7746651, 1.233178, 0.3436953, 0.8470588, 1, 0, 1,
-0.7730584, -0.9599585, -1.49994, 0.8431373, 1, 0, 1,
-0.7696447, 0.3457401, -2.321124, 0.8352941, 1, 0, 1,
-0.7681653, 1.779881, 0.5966441, 0.8313726, 1, 0, 1,
-0.7678496, 0.373323, -2.855315, 0.8235294, 1, 0, 1,
-0.7664688, -0.2155342, -1.192727, 0.8196079, 1, 0, 1,
-0.7593305, 0.2857969, 0.2825311, 0.8117647, 1, 0, 1,
-0.7555048, -0.1118371, -1.629578, 0.8078431, 1, 0, 1,
-0.7544878, 0.4783478, -1.714097, 0.8, 1, 0, 1,
-0.7502193, -0.8703569, -2.355699, 0.7921569, 1, 0, 1,
-0.7485818, 0.8052503, -1.248912, 0.7882353, 1, 0, 1,
-0.7335835, 0.3564598, -0.8967205, 0.7803922, 1, 0, 1,
-0.7323791, -0.7567382, -1.22724, 0.7764706, 1, 0, 1,
-0.7302531, 0.06577828, -0.2184057, 0.7686275, 1, 0, 1,
-0.7248443, -0.05386343, -1.569964, 0.7647059, 1, 0, 1,
-0.7224694, 0.1019541, -1.723805, 0.7568628, 1, 0, 1,
-0.7194276, 0.3533661, 0.0980976, 0.7529412, 1, 0, 1,
-0.7162585, -0.9060178, -3.367104, 0.7450981, 1, 0, 1,
-0.7123345, 0.2501852, -0.6467867, 0.7411765, 1, 0, 1,
-0.7112969, -1.115923, -2.144753, 0.7333333, 1, 0, 1,
-0.7019038, -2.842074, -4.240456, 0.7294118, 1, 0, 1,
-0.6988681, -0.1235525, -1.495904, 0.7215686, 1, 0, 1,
-0.6972499, -0.0116619, -2.934723, 0.7176471, 1, 0, 1,
-0.6920855, -0.5982357, -2.120838, 0.7098039, 1, 0, 1,
-0.6883835, -0.1275333, -0.6054941, 0.7058824, 1, 0, 1,
-0.6882004, -1.772971, -4.49014, 0.6980392, 1, 0, 1,
-0.6855538, 1.506528, 0.2422666, 0.6901961, 1, 0, 1,
-0.6853909, -1.490545, -3.039623, 0.6862745, 1, 0, 1,
-0.6846576, 1.236617, -0.7196611, 0.6784314, 1, 0, 1,
-0.6844595, -0.6742131, -3.656121, 0.6745098, 1, 0, 1,
-0.6676915, -0.5722266, -2.173905, 0.6666667, 1, 0, 1,
-0.6668056, -1.373778, -2.838984, 0.6627451, 1, 0, 1,
-0.6649296, -1.156797, -2.114438, 0.654902, 1, 0, 1,
-0.6620091, -0.65289, -2.245038, 0.6509804, 1, 0, 1,
-0.6603368, -0.9280884, -3.150225, 0.6431373, 1, 0, 1,
-0.6550518, 1.237691, -0.7468323, 0.6392157, 1, 0, 1,
-0.6497878, -0.4435127, -3.11207, 0.6313726, 1, 0, 1,
-0.648012, 0.9810979, 0.03384951, 0.627451, 1, 0, 1,
-0.6473484, 0.6274827, -1.994936, 0.6196079, 1, 0, 1,
-0.6451459, 0.1051328, -2.31879, 0.6156863, 1, 0, 1,
-0.6423062, -0.2553564, -0.4150529, 0.6078432, 1, 0, 1,
-0.6420833, 0.6744505, -0.9055043, 0.6039216, 1, 0, 1,
-0.634732, 0.2149578, -1.25139, 0.5960785, 1, 0, 1,
-0.6317967, 0.9559042, -0.8053549, 0.5882353, 1, 0, 1,
-0.6294878, 0.7845588, 0.2535165, 0.5843138, 1, 0, 1,
-0.6279142, 1.528586, 0.2777356, 0.5764706, 1, 0, 1,
-0.6194243, -1.866998, -2.362315, 0.572549, 1, 0, 1,
-0.6181657, -0.6197422, -2.401241, 0.5647059, 1, 0, 1,
-0.6138181, 1.68213, -1.604679, 0.5607843, 1, 0, 1,
-0.6113935, -0.9533678, -2.906852, 0.5529412, 1, 0, 1,
-0.61117, -0.1018877, -0.8034152, 0.5490196, 1, 0, 1,
-0.611094, 1.005607, -2.208097, 0.5411765, 1, 0, 1,
-0.6036919, 1.270234, -1.878254, 0.5372549, 1, 0, 1,
-0.6033659, -0.574082, -3.08614, 0.5294118, 1, 0, 1,
-0.6016139, -1.316536, -2.53049, 0.5254902, 1, 0, 1,
-0.6015985, 0.5618112, -1.810331, 0.5176471, 1, 0, 1,
-0.596666, -0.4683119, -1.271098, 0.5137255, 1, 0, 1,
-0.5965673, -2.020342, -3.16446, 0.5058824, 1, 0, 1,
-0.5898185, -0.07563887, -1.966661, 0.5019608, 1, 0, 1,
-0.5839388, 0.5598268, -1.385969, 0.4941176, 1, 0, 1,
-0.5816786, 0.05994663, -1.397692, 0.4862745, 1, 0, 1,
-0.5815878, -0.6437706, -1.697137, 0.4823529, 1, 0, 1,
-0.5814893, 0.8169212, -0.6926161, 0.4745098, 1, 0, 1,
-0.5783404, -0.01993299, -0.6671988, 0.4705882, 1, 0, 1,
-0.5779461, 1.461732, 0.1200455, 0.4627451, 1, 0, 1,
-0.576839, -0.9302309, -1.537232, 0.4588235, 1, 0, 1,
-0.5755146, -0.1534594, -3.446112, 0.4509804, 1, 0, 1,
-0.5736075, -1.788055, -2.438618, 0.4470588, 1, 0, 1,
-0.5722996, 0.3995483, -1.694555, 0.4392157, 1, 0, 1,
-0.5708116, 1.51629, -1.163582, 0.4352941, 1, 0, 1,
-0.5676532, 1.184192, -0.1476023, 0.427451, 1, 0, 1,
-0.5653291, -0.02522054, -0.9949678, 0.4235294, 1, 0, 1,
-0.5624995, 0.7245554, -0.09403743, 0.4156863, 1, 0, 1,
-0.5579543, -1.182947, -5.392257, 0.4117647, 1, 0, 1,
-0.5571291, 1.912453, -0.6252537, 0.4039216, 1, 0, 1,
-0.5557542, 0.4700637, -0.2959869, 0.3960784, 1, 0, 1,
-0.5548321, -1.373455, -3.489999, 0.3921569, 1, 0, 1,
-0.5544097, 0.5526367, -0.08321486, 0.3843137, 1, 0, 1,
-0.5514856, 1.76142, 0.7109797, 0.3803922, 1, 0, 1,
-0.5513942, 1.156096, -2.82043, 0.372549, 1, 0, 1,
-0.5504312, 1.068756, -0.8488645, 0.3686275, 1, 0, 1,
-0.5435155, -1.241437, -3.755102, 0.3607843, 1, 0, 1,
-0.538696, -0.296797, -0.2512148, 0.3568628, 1, 0, 1,
-0.5376642, -0.3288014, -2.483976, 0.3490196, 1, 0, 1,
-0.5279715, 0.9353789, 0.04070709, 0.345098, 1, 0, 1,
-0.5243717, -1.274196, -1.588639, 0.3372549, 1, 0, 1,
-0.5229561, 0.1109433, -0.5915049, 0.3333333, 1, 0, 1,
-0.5223372, -0.6094991, -2.29139, 0.3254902, 1, 0, 1,
-0.5214638, 0.2204812, -1.495629, 0.3215686, 1, 0, 1,
-0.5199657, 0.3978673, -0.2893035, 0.3137255, 1, 0, 1,
-0.519841, 0.02041642, -1.474336, 0.3098039, 1, 0, 1,
-0.5169302, -1.417587, -2.015593, 0.3019608, 1, 0, 1,
-0.5091577, -0.4485411, -2.545619, 0.2941177, 1, 0, 1,
-0.5009095, 0.2799862, -1.039261, 0.2901961, 1, 0, 1,
-0.5002493, -0.7813913, -3.280282, 0.282353, 1, 0, 1,
-0.4994551, 1.497966, 1.41173, 0.2784314, 1, 0, 1,
-0.4910807, -0.8130341, -2.960884, 0.2705882, 1, 0, 1,
-0.4791475, 0.8387077, -0.3615368, 0.2666667, 1, 0, 1,
-0.4764845, -0.486733, -2.53675, 0.2588235, 1, 0, 1,
-0.4736818, -0.9276952, -2.698662, 0.254902, 1, 0, 1,
-0.4697746, 0.9527985, 0.1706133, 0.2470588, 1, 0, 1,
-0.4694051, -2.885941, -3.724535, 0.2431373, 1, 0, 1,
-0.4557191, 0.8923166, -1.400601, 0.2352941, 1, 0, 1,
-0.4505392, 1.34098, -0.3382324, 0.2313726, 1, 0, 1,
-0.4415151, -0.1432741, -2.826701, 0.2235294, 1, 0, 1,
-0.4403622, 0.7932737, -0.6656923, 0.2196078, 1, 0, 1,
-0.4392806, 0.1924036, -2.76455, 0.2117647, 1, 0, 1,
-0.4336128, -0.1054246, -2.100364, 0.2078431, 1, 0, 1,
-0.4292679, 0.8858401, 0.09326737, 0.2, 1, 0, 1,
-0.4290729, -1.849147, -4.811351, 0.1921569, 1, 0, 1,
-0.426651, -0.1479443, -0.9209766, 0.1882353, 1, 0, 1,
-0.4246758, -0.7613979, -2.161435, 0.1803922, 1, 0, 1,
-0.4246119, -0.1367361, -1.489295, 0.1764706, 1, 0, 1,
-0.4216223, 1.894028, 0.3926579, 0.1686275, 1, 0, 1,
-0.4214638, -2.115587, -3.237563, 0.1647059, 1, 0, 1,
-0.4212037, -0.288143, -1.878349, 0.1568628, 1, 0, 1,
-0.4202636, -1.777784, -1.935071, 0.1529412, 1, 0, 1,
-0.41594, -0.698148, -1.344857, 0.145098, 1, 0, 1,
-0.415747, 0.8321619, -2.400996, 0.1411765, 1, 0, 1,
-0.4020261, 1.162485, -2.910018, 0.1333333, 1, 0, 1,
-0.400681, 1.337655, 0.3859507, 0.1294118, 1, 0, 1,
-0.3954194, 0.9047953, 1.345059, 0.1215686, 1, 0, 1,
-0.3942774, -0.06199702, -1.785905, 0.1176471, 1, 0, 1,
-0.3894057, -2.26564, -3.490216, 0.1098039, 1, 0, 1,
-0.3876872, -0.4534522, -3.964826, 0.1058824, 1, 0, 1,
-0.3867506, -0.5651338, -2.058545, 0.09803922, 1, 0, 1,
-0.3862585, -0.05530722, -1.969932, 0.09019608, 1, 0, 1,
-0.384203, 1.340639, 0.5179666, 0.08627451, 1, 0, 1,
-0.3766207, -0.4498048, -1.350375, 0.07843138, 1, 0, 1,
-0.3724074, 0.4314445, -2.250277, 0.07450981, 1, 0, 1,
-0.3713064, 0.1779823, -0.8834319, 0.06666667, 1, 0, 1,
-0.3678989, -0.3030097, -1.824646, 0.0627451, 1, 0, 1,
-0.3669235, 1.450333, 1.477064, 0.05490196, 1, 0, 1,
-0.3624199, -2.390976, -3.707737, 0.05098039, 1, 0, 1,
-0.360206, 0.0407119, -2.475719, 0.04313726, 1, 0, 1,
-0.35671, -0.5934475, -0.4405244, 0.03921569, 1, 0, 1,
-0.3487979, 1.850565, -0.5495309, 0.03137255, 1, 0, 1,
-0.3482822, 2.3183, -0.02039938, 0.02745098, 1, 0, 1,
-0.3482215, 0.2153366, -0.8349674, 0.01960784, 1, 0, 1,
-0.3477056, -0.2612825, -2.711216, 0.01568628, 1, 0, 1,
-0.3463331, 1.239585, -1.019438, 0.007843138, 1, 0, 1,
-0.3454177, 0.6284461, 0.4385016, 0.003921569, 1, 0, 1,
-0.3443291, 0.233836, 0.9692373, 0, 1, 0.003921569, 1,
-0.3425345, -0.1050779, -2.228708, 0, 1, 0.01176471, 1,
-0.3393727, 1.305778, -0.7968203, 0, 1, 0.01568628, 1,
-0.334627, 1.11619, 1.557507, 0, 1, 0.02352941, 1,
-0.3339328, -0.4377404, -3.281228, 0, 1, 0.02745098, 1,
-0.3333023, 1.465009, 0.0664538, 0, 1, 0.03529412, 1,
-0.3251707, 0.1704345, -1.853551, 0, 1, 0.03921569, 1,
-0.3184862, 0.5366102, 0.3127738, 0, 1, 0.04705882, 1,
-0.3180537, -0.1663987, -1.162804, 0, 1, 0.05098039, 1,
-0.316875, 0.4064925, -1.460801, 0, 1, 0.05882353, 1,
-0.3147979, 2.131643, 0.09090158, 0, 1, 0.0627451, 1,
-0.3142174, -0.1818999, -2.902865, 0, 1, 0.07058824, 1,
-0.3123969, 0.3037288, -1.781661, 0, 1, 0.07450981, 1,
-0.3070258, -0.790544, -2.124248, 0, 1, 0.08235294, 1,
-0.3045835, 0.05680745, -1.441857, 0, 1, 0.08627451, 1,
-0.3028809, 0.3062898, -1.365, 0, 1, 0.09411765, 1,
-0.3008431, -0.8951043, -3.748573, 0, 1, 0.1019608, 1,
-0.3008191, 1.110551, 0.02140712, 0, 1, 0.1058824, 1,
-0.3001338, -1.780512, -2.945467, 0, 1, 0.1137255, 1,
-0.2987958, 0.504491, -0.8230649, 0, 1, 0.1176471, 1,
-0.2979219, 0.266648, -2.032783, 0, 1, 0.1254902, 1,
-0.295263, -1.461436, -1.894844, 0, 1, 0.1294118, 1,
-0.2950436, -1.216762, -3.586339, 0, 1, 0.1372549, 1,
-0.2909906, 0.3994463, -0.7272341, 0, 1, 0.1411765, 1,
-0.289968, 0.6142733, -2.289145, 0, 1, 0.1490196, 1,
-0.2870056, -0.4352069, -3.211669, 0, 1, 0.1529412, 1,
-0.283619, -0.6406472, -3.262653, 0, 1, 0.1607843, 1,
-0.2730379, 0.3412214, -0.7477808, 0, 1, 0.1647059, 1,
-0.2695751, -0.5426132, -2.469982, 0, 1, 0.172549, 1,
-0.2691116, -0.5598015, -1.871881, 0, 1, 0.1764706, 1,
-0.2650199, -0.1196149, -2.277265, 0, 1, 0.1843137, 1,
-0.2647593, -0.654438, -4.677054, 0, 1, 0.1882353, 1,
-0.2642839, 0.111795, -2.275141, 0, 1, 0.1960784, 1,
-0.2587625, -1.344595, -2.652538, 0, 1, 0.2039216, 1,
-0.2569183, 1.09783, -0.1081307, 0, 1, 0.2078431, 1,
-0.2514518, 0.193478, -1.176436, 0, 1, 0.2156863, 1,
-0.2500621, -0.2376987, -2.524723, 0, 1, 0.2196078, 1,
-0.2477146, -2.471994, -3.005112, 0, 1, 0.227451, 1,
-0.2426677, 1.583889, -2.995753, 0, 1, 0.2313726, 1,
-0.2423523, 0.9647337, -0.2587795, 0, 1, 0.2392157, 1,
-0.2385063, 1.11297, -0.9619541, 0, 1, 0.2431373, 1,
-0.2368952, -0.260191, -2.579565, 0, 1, 0.2509804, 1,
-0.2361027, -0.6754068, -2.28182, 0, 1, 0.254902, 1,
-0.2334701, -0.4549453, -2.9756, 0, 1, 0.2627451, 1,
-0.2324365, -0.9590369, -2.833741, 0, 1, 0.2666667, 1,
-0.2308087, -0.9395455, -1.791512, 0, 1, 0.2745098, 1,
-0.2301662, -0.7416984, -3.280887, 0, 1, 0.2784314, 1,
-0.2264215, 1.580592, -1.323278, 0, 1, 0.2862745, 1,
-0.2246324, -0.1312827, -2.102757, 0, 1, 0.2901961, 1,
-0.2224195, -1.978553, -2.58682, 0, 1, 0.2980392, 1,
-0.2224016, 0.140157, 0.4711294, 0, 1, 0.3058824, 1,
-0.2063941, -0.8055835, -4.634395, 0, 1, 0.3098039, 1,
-0.2063081, 0.364851, -0.105779, 0, 1, 0.3176471, 1,
-0.2050713, -0.1210181, -0.8879107, 0, 1, 0.3215686, 1,
-0.2005879, 0.8630434, -0.7446869, 0, 1, 0.3294118, 1,
-0.1956882, -0.4295411, -2.075082, 0, 1, 0.3333333, 1,
-0.1953627, -2.263083, -2.561915, 0, 1, 0.3411765, 1,
-0.1944912, -0.6576077, -3.018736, 0, 1, 0.345098, 1,
-0.193959, 0.09778281, -1.507926, 0, 1, 0.3529412, 1,
-0.1903333, 0.09875289, -2.288093, 0, 1, 0.3568628, 1,
-0.190147, 1.622609, -0.09383483, 0, 1, 0.3647059, 1,
-0.1881482, 0.6051774, 1.056123, 0, 1, 0.3686275, 1,
-0.1837887, 1.836578, -0.7305381, 0, 1, 0.3764706, 1,
-0.1783361, 0.9930033, 0.421355, 0, 1, 0.3803922, 1,
-0.1780494, 0.6777357, -0.9011399, 0, 1, 0.3882353, 1,
-0.1774078, 1.591752, -0.5994873, 0, 1, 0.3921569, 1,
-0.1772712, 0.8408175, 0.06803156, 0, 1, 0.4, 1,
-0.1753317, -1.170092, -3.862757, 0, 1, 0.4078431, 1,
-0.172188, -0.2012092, -1.626884, 0, 1, 0.4117647, 1,
-0.1709684, 0.6157067, -1.457521, 0, 1, 0.4196078, 1,
-0.1698106, -0.7009986, -2.130074, 0, 1, 0.4235294, 1,
-0.1674106, -1.666835, -3.690188, 0, 1, 0.4313726, 1,
-0.1646724, 0.9286416, -0.9895821, 0, 1, 0.4352941, 1,
-0.1638078, -0.4774723, -1.353768, 0, 1, 0.4431373, 1,
-0.1632864, 0.04290108, 0.7467888, 0, 1, 0.4470588, 1,
-0.1629995, -0.8580496, -3.262063, 0, 1, 0.454902, 1,
-0.1623528, 1.140726, -0.6947855, 0, 1, 0.4588235, 1,
-0.1613391, 0.6598471, 0.9681226, 0, 1, 0.4666667, 1,
-0.1546442, 1.26904, -0.7786933, 0, 1, 0.4705882, 1,
-0.1534325, 0.02040106, -1.259299, 0, 1, 0.4784314, 1,
-0.152112, 0.5439048, -1.025246, 0, 1, 0.4823529, 1,
-0.1495074, -0.2243476, -2.041767, 0, 1, 0.4901961, 1,
-0.1472943, -0.2307443, -1.806557, 0, 1, 0.4941176, 1,
-0.1454176, -0.4409994, -4.084367, 0, 1, 0.5019608, 1,
-0.1451263, -0.5230328, -3.068866, 0, 1, 0.509804, 1,
-0.1444282, -0.7147042, -3.401328, 0, 1, 0.5137255, 1,
-0.1433474, 1.30957, -0.7001544, 0, 1, 0.5215687, 1,
-0.1428598, -1.045853, -3.445158, 0, 1, 0.5254902, 1,
-0.1426201, -0.5062521, -0.9977099, 0, 1, 0.5333334, 1,
-0.1415316, -0.1871498, -0.2702454, 0, 1, 0.5372549, 1,
-0.1366554, 1.156617, -1.077377, 0, 1, 0.5450981, 1,
-0.1359814, 0.296648, 0.5621604, 0, 1, 0.5490196, 1,
-0.1329522, -0.213709, -4.08774, 0, 1, 0.5568628, 1,
-0.128836, -0.3390619, -1.944412, 0, 1, 0.5607843, 1,
-0.1287187, -0.1703635, -1.674744, 0, 1, 0.5686275, 1,
-0.1280111, -0.4432718, -3.890976, 0, 1, 0.572549, 1,
-0.1269221, 0.7040148, 0.09532811, 0, 1, 0.5803922, 1,
-0.1264339, 1.405036, -1.2783, 0, 1, 0.5843138, 1,
-0.1247059, 0.3625438, 0.6979512, 0, 1, 0.5921569, 1,
-0.1231525, -0.6639413, -2.33586, 0, 1, 0.5960785, 1,
-0.1224744, 0.3349502, -0.9655676, 0, 1, 0.6039216, 1,
-0.1197668, -1.070482, -3.497577, 0, 1, 0.6117647, 1,
-0.114528, -0.673839, -2.002323, 0, 1, 0.6156863, 1,
-0.1091684, -0.6846353, -3.099688, 0, 1, 0.6235294, 1,
-0.1067981, 0.3262609, -0.7415944, 0, 1, 0.627451, 1,
-0.1013984, -0.1305595, -2.507593, 0, 1, 0.6352941, 1,
-0.09897628, 0.5374954, -0.04951372, 0, 1, 0.6392157, 1,
-0.09070842, 0.6260387, -1.498563, 0, 1, 0.6470588, 1,
-0.08679505, -0.792266, -2.140085, 0, 1, 0.6509804, 1,
-0.08547454, -0.1040094, -3.289892, 0, 1, 0.6588235, 1,
-0.08408423, 0.2223743, 0.02951796, 0, 1, 0.6627451, 1,
-0.08242531, -0.1736546, -2.298938, 0, 1, 0.6705883, 1,
-0.07777862, 1.052647, 1.901095, 0, 1, 0.6745098, 1,
-0.07607224, 0.7561668, -0.6420469, 0, 1, 0.682353, 1,
-0.07464989, -0.6520333, -2.775321, 0, 1, 0.6862745, 1,
-0.07431358, -1.756361, -4.554956, 0, 1, 0.6941177, 1,
-0.07285151, 1.217422, 1.190053, 0, 1, 0.7019608, 1,
-0.06874229, -0.4015845, -3.833997, 0, 1, 0.7058824, 1,
-0.06376539, -0.9528638, -4.348732, 0, 1, 0.7137255, 1,
-0.06348813, -0.3518561, -2.812947, 0, 1, 0.7176471, 1,
-0.06164176, -0.02169469, -2.966043, 0, 1, 0.7254902, 1,
-0.06130132, -1.418537, -2.744053, 0, 1, 0.7294118, 1,
-0.0551232, -0.3268443, -2.565771, 0, 1, 0.7372549, 1,
-0.04917059, 0.9840001, 0.3888839, 0, 1, 0.7411765, 1,
-0.04759929, 1.337743, 0.09479752, 0, 1, 0.7490196, 1,
-0.04539695, -1.491554, -2.512511, 0, 1, 0.7529412, 1,
-0.04425791, -0.5696044, -3.9201, 0, 1, 0.7607843, 1,
-0.04402229, -1.19619, -3.725575, 0, 1, 0.7647059, 1,
-0.04277011, 0.474353, 1.218673, 0, 1, 0.772549, 1,
-0.04179751, -1.816505, -2.374456, 0, 1, 0.7764706, 1,
-0.03600395, -1.424368, -1.904304, 0, 1, 0.7843137, 1,
-0.03573221, 0.4323056, -0.3389899, 0, 1, 0.7882353, 1,
-0.03534699, -0.1751225, -2.149162, 0, 1, 0.7960784, 1,
-0.03494689, -1.903154, -2.440704, 0, 1, 0.8039216, 1,
-0.03403448, 1.122985, 1.685157, 0, 1, 0.8078431, 1,
-0.03293774, 1.127607, 1.518977, 0, 1, 0.8156863, 1,
-0.03187639, 0.3408414, -0.9693943, 0, 1, 0.8196079, 1,
-0.0309078, -1.580239, -3.233787, 0, 1, 0.827451, 1,
-0.02825546, 0.5617339, -0.2538102, 0, 1, 0.8313726, 1,
-0.01506696, 0.8204919, -0.6478459, 0, 1, 0.8392157, 1,
-0.01331615, -0.762787, -3.616886, 0, 1, 0.8431373, 1,
-0.0132438, -0.2453579, -0.914233, 0, 1, 0.8509804, 1,
-0.01232922, 0.6325932, 0.08933639, 0, 1, 0.854902, 1,
-0.009232479, 1.219421, -0.1972996, 0, 1, 0.8627451, 1,
-0.008324824, -0.5297276, -3.841834, 0, 1, 0.8666667, 1,
-0.008070479, -0.1873627, -2.659693, 0, 1, 0.8745098, 1,
-0.004750316, -0.5640867, -2.112288, 0, 1, 0.8784314, 1,
-0.004710379, 1.296869, 0.6532584, 0, 1, 0.8862745, 1,
-0.0002650433, 0.5153664, -0.1336111, 0, 1, 0.8901961, 1,
0.001799949, -0.2752958, 3.753464, 0, 1, 0.8980392, 1,
0.002550146, 1.134685, 1.877385, 0, 1, 0.9058824, 1,
0.002923334, 0.1389917, -1.652761, 0, 1, 0.9098039, 1,
0.003402537, -1.409247, 2.405641, 0, 1, 0.9176471, 1,
0.009220173, 0.7027583, 0.3773646, 0, 1, 0.9215686, 1,
0.01064694, 0.2212619, 0.4177785, 0, 1, 0.9294118, 1,
0.01958937, -0.09532823, 1.383523, 0, 1, 0.9333333, 1,
0.02051269, -0.3475859, 2.557825, 0, 1, 0.9411765, 1,
0.02430342, 0.4107523, 0.6874111, 0, 1, 0.945098, 1,
0.0257236, -0.4004555, 3.744033, 0, 1, 0.9529412, 1,
0.02692917, -1.592811, 2.456878, 0, 1, 0.9568627, 1,
0.02859056, 0.8417896, -0.6407673, 0, 1, 0.9647059, 1,
0.03061228, -0.8896654, 3.988333, 0, 1, 0.9686275, 1,
0.03161756, 1.393794, 0.9349065, 0, 1, 0.9764706, 1,
0.03344064, 0.3531928, 0.05564613, 0, 1, 0.9803922, 1,
0.03429496, -1.116975, 1.914819, 0, 1, 0.9882353, 1,
0.03593973, -0.3669344, 3.708382, 0, 1, 0.9921569, 1,
0.03670993, 0.2432458, -0.40712, 0, 1, 1, 1,
0.03724914, 1.314991, -1.883143, 0, 0.9921569, 1, 1,
0.03871604, -1.371836, 3.910778, 0, 0.9882353, 1, 1,
0.04073236, -1.703533, 2.730879, 0, 0.9803922, 1, 1,
0.04174912, -2.67917, 3.212081, 0, 0.9764706, 1, 1,
0.04551871, -0.06936933, 2.848271, 0, 0.9686275, 1, 1,
0.04881015, 0.5788733, -1.130627, 0, 0.9647059, 1, 1,
0.05107804, -0.3286, 2.401144, 0, 0.9568627, 1, 1,
0.05292851, 0.2624978, -1.703183, 0, 0.9529412, 1, 1,
0.05339999, -0.4502226, 2.727063, 0, 0.945098, 1, 1,
0.05513101, -1.728761, 3.028815, 0, 0.9411765, 1, 1,
0.05525441, -0.7702449, 3.619495, 0, 0.9333333, 1, 1,
0.05755492, 1.055703, 0.06203444, 0, 0.9294118, 1, 1,
0.05855268, -2.623116, 3.665676, 0, 0.9215686, 1, 1,
0.06095028, 0.7836446, -0.8653345, 0, 0.9176471, 1, 1,
0.07180306, 0.6675239, -0.9422032, 0, 0.9098039, 1, 1,
0.07430571, 0.408485, 0.8692906, 0, 0.9058824, 1, 1,
0.07535293, 0.01575171, 1.137474, 0, 0.8980392, 1, 1,
0.07587079, -0.7886505, 5.343155, 0, 0.8901961, 1, 1,
0.0861233, 1.756459, -0.9566683, 0, 0.8862745, 1, 1,
0.09177683, 1.717442, -0.7983571, 0, 0.8784314, 1, 1,
0.09339963, -1.237774, 3.23537, 0, 0.8745098, 1, 1,
0.09597394, 1.198168, -0.6532739, 0, 0.8666667, 1, 1,
0.09757499, 1.038041, -1.394042, 0, 0.8627451, 1, 1,
0.09963529, 0.8584529, -1.31596, 0, 0.854902, 1, 1,
0.1027602, -0.2250051, 2.791577, 0, 0.8509804, 1, 1,
0.1045633, -0.314268, 2.102885, 0, 0.8431373, 1, 1,
0.1050584, 0.09543593, 1.946469, 0, 0.8392157, 1, 1,
0.1069488, -1.588449, 1.90876, 0, 0.8313726, 1, 1,
0.1091416, -0.1852805, 2.175272, 0, 0.827451, 1, 1,
0.1099494, 1.539144, 0.4225764, 0, 0.8196079, 1, 1,
0.1125497, -1.754052, 2.260643, 0, 0.8156863, 1, 1,
0.1147119, 0.02447343, -0.04316372, 0, 0.8078431, 1, 1,
0.1157304, -0.3551951, 3.299911, 0, 0.8039216, 1, 1,
0.116398, -0.7643675, 3.339105, 0, 0.7960784, 1, 1,
0.1178186, 0.9100793, 0.6989187, 0, 0.7882353, 1, 1,
0.1197583, -1.18621, 1.891691, 0, 0.7843137, 1, 1,
0.1229299, 0.812609, -1.275268, 0, 0.7764706, 1, 1,
0.1265218, -0.1967095, 4.338334, 0, 0.772549, 1, 1,
0.1277096, -0.6054521, 1.685332, 0, 0.7647059, 1, 1,
0.1309877, 0.3610239, 1.184757, 0, 0.7607843, 1, 1,
0.1341614, 1.084637, 0.1497054, 0, 0.7529412, 1, 1,
0.1352073, -0.1569239, 2.049154, 0, 0.7490196, 1, 1,
0.1352824, 0.6758604, -1.483545, 0, 0.7411765, 1, 1,
0.1375058, -0.5527663, 3.299693, 0, 0.7372549, 1, 1,
0.137727, -1.134001, 3.322242, 0, 0.7294118, 1, 1,
0.1394356, -0.3151293, 3.468259, 0, 0.7254902, 1, 1,
0.1400287, 0.2232322, -0.6037815, 0, 0.7176471, 1, 1,
0.1448573, 0.2266503, 1.651815, 0, 0.7137255, 1, 1,
0.1464202, -0.6992989, 2.063787, 0, 0.7058824, 1, 1,
0.1464814, -0.306504, 0.7763603, 0, 0.6980392, 1, 1,
0.1469156, -1.83625, 1.649959, 0, 0.6941177, 1, 1,
0.154101, 0.02189866, 2.19585, 0, 0.6862745, 1, 1,
0.1554133, 1.439916, 0.1861331, 0, 0.682353, 1, 1,
0.1606479, -0.5954993, 3.891739, 0, 0.6745098, 1, 1,
0.1636834, -1.38456, 3.394081, 0, 0.6705883, 1, 1,
0.1645532, -1.015582, 3.878292, 0, 0.6627451, 1, 1,
0.1647877, 0.929871, 1.459106, 0, 0.6588235, 1, 1,
0.1654075, 1.499619, 0.2995617, 0, 0.6509804, 1, 1,
0.1663788, -0.5352741, 3.504302, 0, 0.6470588, 1, 1,
0.1668334, 0.5183799, 1.452228, 0, 0.6392157, 1, 1,
0.1707248, 0.03094584, 1.208838, 0, 0.6352941, 1, 1,
0.1717957, 0.4352365, -0.5701449, 0, 0.627451, 1, 1,
0.1725644, -0.372288, 1.910831, 0, 0.6235294, 1, 1,
0.1747054, 0.4419994, -1.023568, 0, 0.6156863, 1, 1,
0.1747878, 1.478936, 1.757163, 0, 0.6117647, 1, 1,
0.1754166, -0.4109789, 2.505111, 0, 0.6039216, 1, 1,
0.1832631, 0.03785278, 0.3814093, 0, 0.5960785, 1, 1,
0.1869633, -0.2841893, 3.581552, 0, 0.5921569, 1, 1,
0.1893317, -0.5069622, 2.854387, 0, 0.5843138, 1, 1,
0.190856, -0.867649, 2.002569, 0, 0.5803922, 1, 1,
0.1915524, 1.016301, -2.259069, 0, 0.572549, 1, 1,
0.1921394, -0.5460407, 1.879207, 0, 0.5686275, 1, 1,
0.192375, 0.303261, -0.1352833, 0, 0.5607843, 1, 1,
0.1948064, 0.7918681, 0.5740076, 0, 0.5568628, 1, 1,
0.1949047, -0.3722446, 4.149483, 0, 0.5490196, 1, 1,
0.1954292, 0.177469, 2.096955, 0, 0.5450981, 1, 1,
0.195667, -0.09943388, 2.725989, 0, 0.5372549, 1, 1,
0.1966289, -1.007734, 3.679039, 0, 0.5333334, 1, 1,
0.1993487, -0.6992021, 3.040957, 0, 0.5254902, 1, 1,
0.2078218, 0.4119683, 1.319553, 0, 0.5215687, 1, 1,
0.2113301, -0.6320713, 3.172311, 0, 0.5137255, 1, 1,
0.2157166, 1.586994, 0.9002703, 0, 0.509804, 1, 1,
0.2173761, 0.5893822, 1.544423, 0, 0.5019608, 1, 1,
0.2233259, -0.05063372, 3.954178, 0, 0.4941176, 1, 1,
0.2239943, 1.368332, 0.327133, 0, 0.4901961, 1, 1,
0.2295371, 0.9806448, -0.02410555, 0, 0.4823529, 1, 1,
0.2297726, -0.5926834, 3.209228, 0, 0.4784314, 1, 1,
0.23088, 1.053496, -0.1952733, 0, 0.4705882, 1, 1,
0.2363444, 0.9190819, -0.5009019, 0, 0.4666667, 1, 1,
0.2373927, 0.1424455, 0.2814308, 0, 0.4588235, 1, 1,
0.2395741, -1.140483, 2.060399, 0, 0.454902, 1, 1,
0.2400093, -0.9626138, 2.455143, 0, 0.4470588, 1, 1,
0.2412602, 0.6851649, 1.06554, 0, 0.4431373, 1, 1,
0.2414876, 0.6276305, -0.09716769, 0, 0.4352941, 1, 1,
0.2441461, -0.6470152, 2.541621, 0, 0.4313726, 1, 1,
0.2462237, 0.04508405, 0.5765613, 0, 0.4235294, 1, 1,
0.2474327, -1.966797, 2.10184, 0, 0.4196078, 1, 1,
0.2562257, 0.006718337, 1.989274, 0, 0.4117647, 1, 1,
0.2582272, 2.336619, -1.038097, 0, 0.4078431, 1, 1,
0.2585013, 0.3961404, -0.2829992, 0, 0.4, 1, 1,
0.2609853, -2.052728, 2.845272, 0, 0.3921569, 1, 1,
0.263625, 2.385886, 0.6372051, 0, 0.3882353, 1, 1,
0.2669655, 0.6038921, -0.1600177, 0, 0.3803922, 1, 1,
0.2709551, 0.9588291, -0.2462774, 0, 0.3764706, 1, 1,
0.2753657, 0.6457458, -0.357049, 0, 0.3686275, 1, 1,
0.2754225, -1.736792, 3.066053, 0, 0.3647059, 1, 1,
0.2784249, -0.4089778, 2.864993, 0, 0.3568628, 1, 1,
0.2806066, -0.8641863, 2.435149, 0, 0.3529412, 1, 1,
0.2813651, 0.04729528, 1.171935, 0, 0.345098, 1, 1,
0.2815897, 0.322996, 1.767102, 0, 0.3411765, 1, 1,
0.2830863, 1.280173, -1.421365, 0, 0.3333333, 1, 1,
0.283092, -0.5850238, 1.357481, 0, 0.3294118, 1, 1,
0.2858148, -1.033138, 4.67441, 0, 0.3215686, 1, 1,
0.287175, -0.3922207, 3.040834, 0, 0.3176471, 1, 1,
0.2876485, 1.40464, 0.2819292, 0, 0.3098039, 1, 1,
0.2929431, -2.326318, 2.199695, 0, 0.3058824, 1, 1,
0.2982403, -1.057409, 1.529282, 0, 0.2980392, 1, 1,
0.3065324, 1.143269, 1.075915, 0, 0.2901961, 1, 1,
0.3086215, -0.07014336, 0.774621, 0, 0.2862745, 1, 1,
0.3116503, -0.5858632, 2.080679, 0, 0.2784314, 1, 1,
0.3116943, 0.1774585, 1.146789, 0, 0.2745098, 1, 1,
0.3209066, -0.6402633, 1.086343, 0, 0.2666667, 1, 1,
0.323034, -0.1572909, 1.381452, 0, 0.2627451, 1, 1,
0.3289626, -0.4588741, 3.608752, 0, 0.254902, 1, 1,
0.3315877, -0.1595386, 2.075069, 0, 0.2509804, 1, 1,
0.3317811, 0.6752011, 0.5879846, 0, 0.2431373, 1, 1,
0.332016, 1.011771, -0.80514, 0, 0.2392157, 1, 1,
0.3322808, 0.08879651, 0.7648284, 0, 0.2313726, 1, 1,
0.3358139, 0.871819, 0.1821373, 0, 0.227451, 1, 1,
0.3362207, -0.6577867, 2.600971, 0, 0.2196078, 1, 1,
0.3418244, 0.8956866, 0.06517281, 0, 0.2156863, 1, 1,
0.3421516, -0.1306456, 2.038963, 0, 0.2078431, 1, 1,
0.3423167, -1.361062, 3.85123, 0, 0.2039216, 1, 1,
0.3435155, 0.3188531, 2.583897, 0, 0.1960784, 1, 1,
0.3454218, -1.156273, 4.173444, 0, 0.1882353, 1, 1,
0.3470532, 1.728885, -0.6347693, 0, 0.1843137, 1, 1,
0.3477803, 0.5811658, 0.3887853, 0, 0.1764706, 1, 1,
0.3495413, -0.9863816, 4.019434, 0, 0.172549, 1, 1,
0.3511978, -0.5298828, 2.068905, 0, 0.1647059, 1, 1,
0.3571217, 0.3719915, -0.5026887, 0, 0.1607843, 1, 1,
0.3587805, -0.1268286, 1.958836, 0, 0.1529412, 1, 1,
0.3661879, 0.7049139, -0.05129674, 0, 0.1490196, 1, 1,
0.3671628, -0.6850603, 0.5400671, 0, 0.1411765, 1, 1,
0.3698328, -1.450222, 3.983369, 0, 0.1372549, 1, 1,
0.3703171, 2.056352, -2.073787, 0, 0.1294118, 1, 1,
0.3755365, -0.7098007, 2.212566, 0, 0.1254902, 1, 1,
0.3827635, 0.4998056, 0.8882415, 0, 0.1176471, 1, 1,
0.3868167, 0.6256645, -0.02056835, 0, 0.1137255, 1, 1,
0.3943118, 1.185962, 2.133827, 0, 0.1058824, 1, 1,
0.3981322, -0.4179256, 2.27459, 0, 0.09803922, 1, 1,
0.3997204, -0.003737429, 1.821236, 0, 0.09411765, 1, 1,
0.4021959, 0.6010584, 1.05944, 0, 0.08627451, 1, 1,
0.4047887, 0.4514084, 1.70322, 0, 0.08235294, 1, 1,
0.4071851, -0.5900335, 1.134196, 0, 0.07450981, 1, 1,
0.4072178, 0.8122827, -0.3739063, 0, 0.07058824, 1, 1,
0.4081351, -0.07629018, 1.922379, 0, 0.0627451, 1, 1,
0.409952, 0.4825467, 0.09248985, 0, 0.05882353, 1, 1,
0.4101258, -2.518885, 3.465772, 0, 0.05098039, 1, 1,
0.4191327, -1.196804, 3.359418, 0, 0.04705882, 1, 1,
0.419382, 0.1259121, 0.6959999, 0, 0.03921569, 1, 1,
0.4219554, 0.152952, 1.581391, 0, 0.03529412, 1, 1,
0.4242019, 0.4398311, 0.9739013, 0, 0.02745098, 1, 1,
0.4272353, 0.4259793, 2.05862, 0, 0.02352941, 1, 1,
0.4299395, -1.352068, 2.802198, 0, 0.01568628, 1, 1,
0.4301993, 1.062775, 1.244865, 0, 0.01176471, 1, 1,
0.4356059, 0.06405804, -0.1665671, 0, 0.003921569, 1, 1,
0.4388734, 2.091872, -0.3522898, 0.003921569, 0, 1, 1,
0.4418218, -0.8863309, 2.860479, 0.007843138, 0, 1, 1,
0.4440949, 0.1996648, 2.112397, 0.01568628, 0, 1, 1,
0.4448584, 0.6185588, 0.8000919, 0.01960784, 0, 1, 1,
0.448881, -0.9077867, 1.583546, 0.02745098, 0, 1, 1,
0.450855, 1.596812, 1.572721, 0.03137255, 0, 1, 1,
0.4527223, -0.4796012, 2.079175, 0.03921569, 0, 1, 1,
0.4561849, -0.681371, 2.39458, 0.04313726, 0, 1, 1,
0.4659535, -0.5160553, 3.21501, 0.05098039, 0, 1, 1,
0.4739225, 1.011154, -2.048661, 0.05490196, 0, 1, 1,
0.4784112, 0.1926097, 1.366093, 0.0627451, 0, 1, 1,
0.4797061, -0.6704352, 2.110445, 0.06666667, 0, 1, 1,
0.4797166, 0.7912322, 0.8176287, 0.07450981, 0, 1, 1,
0.480996, -0.2650173, 1.653704, 0.07843138, 0, 1, 1,
0.49241, 0.03161796, 0.8532217, 0.08627451, 0, 1, 1,
0.4938887, 0.2088692, 0.9402429, 0.09019608, 0, 1, 1,
0.4942473, 0.5388888, 1.676476, 0.09803922, 0, 1, 1,
0.4953752, -0.2080086, 0.6692119, 0.1058824, 0, 1, 1,
0.4994541, -1.126497, 2.537338, 0.1098039, 0, 1, 1,
0.5010682, 1.05935, -0.5618743, 0.1176471, 0, 1, 1,
0.5049279, 1.603097, 1.686032, 0.1215686, 0, 1, 1,
0.505933, 1.773119, 0.3215842, 0.1294118, 0, 1, 1,
0.5062598, 1.399151, 2.09367, 0.1333333, 0, 1, 1,
0.5085359, 1.626255, 0.07634249, 0.1411765, 0, 1, 1,
0.5105723, -1.449428, 2.428587, 0.145098, 0, 1, 1,
0.5129193, 0.09841546, -0.499198, 0.1529412, 0, 1, 1,
0.5138852, 0.8107346, 0.3396052, 0.1568628, 0, 1, 1,
0.5153998, -0.1542883, 1.19511, 0.1647059, 0, 1, 1,
0.516962, -1.756776, 1.545882, 0.1686275, 0, 1, 1,
0.5204947, -1.366159, 3.120983, 0.1764706, 0, 1, 1,
0.5218444, 1.475976, 1.054016, 0.1803922, 0, 1, 1,
0.5220484, -0.2645734, 1.777017, 0.1882353, 0, 1, 1,
0.5229496, 0.7146486, 0.9313891, 0.1921569, 0, 1, 1,
0.5237932, 1.228265, -0.2263965, 0.2, 0, 1, 1,
0.525882, 0.4621089, 0.203625, 0.2078431, 0, 1, 1,
0.5262284, 0.5225736, 2.123741, 0.2117647, 0, 1, 1,
0.5298006, 0.6880879, 0.4822213, 0.2196078, 0, 1, 1,
0.5354817, -1.187989, 1.509072, 0.2235294, 0, 1, 1,
0.5369151, -1.386435, 2.098454, 0.2313726, 0, 1, 1,
0.5395603, 1.248442, 0.7799259, 0.2352941, 0, 1, 1,
0.543092, -1.268203, 3.482643, 0.2431373, 0, 1, 1,
0.5513754, 2.483424, -0.8904679, 0.2470588, 0, 1, 1,
0.5559144, 0.07463943, 1.655938, 0.254902, 0, 1, 1,
0.5562049, -0.9468544, 2.721337, 0.2588235, 0, 1, 1,
0.5641812, 1.846618, 1.564339, 0.2666667, 0, 1, 1,
0.5657789, 0.5541212, 1.67822, 0.2705882, 0, 1, 1,
0.5686831, 1.844265, -0.459434, 0.2784314, 0, 1, 1,
0.5722409, -0.5254871, 2.920386, 0.282353, 0, 1, 1,
0.5724348, -0.3517096, 2.970967, 0.2901961, 0, 1, 1,
0.5724955, -0.6303287, 2.389123, 0.2941177, 0, 1, 1,
0.5737569, -1.010068, -0.08601657, 0.3019608, 0, 1, 1,
0.5825838, 0.2126632, 0.8338966, 0.3098039, 0, 1, 1,
0.5845079, -0.4843695, 2.229844, 0.3137255, 0, 1, 1,
0.5946142, -1.108582, 2.301317, 0.3215686, 0, 1, 1,
0.6005388, 0.8953819, -0.9469639, 0.3254902, 0, 1, 1,
0.601517, 0.3855561, -0.5314382, 0.3333333, 0, 1, 1,
0.6017176, -0.9920644, 4.869237, 0.3372549, 0, 1, 1,
0.6039338, -0.5496444, 0.2415633, 0.345098, 0, 1, 1,
0.6046958, -0.4171102, 3.076343, 0.3490196, 0, 1, 1,
0.6079628, 0.3867634, 1.156341, 0.3568628, 0, 1, 1,
0.6109265, -0.7476388, 1.884511, 0.3607843, 0, 1, 1,
0.6122767, -0.1345711, 0.9990537, 0.3686275, 0, 1, 1,
0.6138451, -0.2532178, 2.215216, 0.372549, 0, 1, 1,
0.6192348, 1.528214, 0.2607826, 0.3803922, 0, 1, 1,
0.6204943, 1.86273, 3.421124, 0.3843137, 0, 1, 1,
0.627764, 0.6935968, 0.5924809, 0.3921569, 0, 1, 1,
0.6282352, 0.7620599, 1.053454, 0.3960784, 0, 1, 1,
0.6284559, -1.975639, 3.215082, 0.4039216, 0, 1, 1,
0.629625, 0.8243306, 1.412489, 0.4117647, 0, 1, 1,
0.6299586, -0.999143, 1.876576, 0.4156863, 0, 1, 1,
0.6332583, 0.004607941, 1.136946, 0.4235294, 0, 1, 1,
0.636933, -1.110339, 2.35541, 0.427451, 0, 1, 1,
0.6383916, -0.609018, 1.736739, 0.4352941, 0, 1, 1,
0.6388955, 1.908106, 1.813185, 0.4392157, 0, 1, 1,
0.6399211, -0.4660811, 2.128633, 0.4470588, 0, 1, 1,
0.6423666, -0.1146886, 1.878351, 0.4509804, 0, 1, 1,
0.6485793, -0.6433663, 0.5467167, 0.4588235, 0, 1, 1,
0.6508874, -0.6186844, 1.780615, 0.4627451, 0, 1, 1,
0.6599978, 1.165612, -0.4935565, 0.4705882, 0, 1, 1,
0.6610694, -0.04860524, 3.226764, 0.4745098, 0, 1, 1,
0.6629786, -1.521395, 3.972736, 0.4823529, 0, 1, 1,
0.6660745, -0.6522813, 4.907218, 0.4862745, 0, 1, 1,
0.6668965, -0.5943434, 2.033504, 0.4941176, 0, 1, 1,
0.675874, -0.3989142, 2.473033, 0.5019608, 0, 1, 1,
0.6841229, 1.842061, 0.2587605, 0.5058824, 0, 1, 1,
0.6858557, 1.754515, 0.7307132, 0.5137255, 0, 1, 1,
0.689484, -0.8766733, 2.966346, 0.5176471, 0, 1, 1,
0.6896012, 1.017381, 1.352862, 0.5254902, 0, 1, 1,
0.6936458, 0.7923479, -0.3045629, 0.5294118, 0, 1, 1,
0.70096, -0.6813384, 1.495301, 0.5372549, 0, 1, 1,
0.7115563, -1.632685, 1.494896, 0.5411765, 0, 1, 1,
0.7139453, -1.289982, 3.091225, 0.5490196, 0, 1, 1,
0.7140191, 0.9104226, 1.720052, 0.5529412, 0, 1, 1,
0.7149979, -0.2707861, 1.461448, 0.5607843, 0, 1, 1,
0.7151986, -0.07471308, 3.800797, 0.5647059, 0, 1, 1,
0.7198023, 0.2117027, 1.151201, 0.572549, 0, 1, 1,
0.7207707, 0.882367, 1.781314, 0.5764706, 0, 1, 1,
0.7241632, 0.559105, -0.03501948, 0.5843138, 0, 1, 1,
0.7252599, -0.2746773, 2.383338, 0.5882353, 0, 1, 1,
0.7393075, -0.2111135, 0.4815411, 0.5960785, 0, 1, 1,
0.7403604, 1.042778, -1.493037, 0.6039216, 0, 1, 1,
0.7422478, -0.3763003, 2.293258, 0.6078432, 0, 1, 1,
0.7496886, -0.1243816, 0.7259821, 0.6156863, 0, 1, 1,
0.7527519, 0.8042417, 2.043111, 0.6196079, 0, 1, 1,
0.7538788, -0.9649019, 4.674565, 0.627451, 0, 1, 1,
0.7574851, -0.21858, 2.755253, 0.6313726, 0, 1, 1,
0.7586362, -1.501008, 2.689714, 0.6392157, 0, 1, 1,
0.765043, -1.60011, 2.864626, 0.6431373, 0, 1, 1,
0.7655196, 1.708168, 2.287039, 0.6509804, 0, 1, 1,
0.7660151, -0.9840593, 0.3213945, 0.654902, 0, 1, 1,
0.7696591, 0.06006333, 1.173945, 0.6627451, 0, 1, 1,
0.7737741, -0.5822544, 0.4741833, 0.6666667, 0, 1, 1,
0.7750773, 0.7431592, 2.655129, 0.6745098, 0, 1, 1,
0.7774447, -0.4339795, 0.9687747, 0.6784314, 0, 1, 1,
0.7783602, 0.2526255, 0.6364455, 0.6862745, 0, 1, 1,
0.7823191, -1.378657, 2.964466, 0.6901961, 0, 1, 1,
0.7833604, 0.6979364, 2.185643, 0.6980392, 0, 1, 1,
0.7860352, -0.2025202, 0.1151591, 0.7058824, 0, 1, 1,
0.7924801, -2.109801, 3.155913, 0.7098039, 0, 1, 1,
0.7939933, -0.2153255, 1.086584, 0.7176471, 0, 1, 1,
0.7957583, 0.174959, 1.397292, 0.7215686, 0, 1, 1,
0.7965434, 0.06547669, 2.435985, 0.7294118, 0, 1, 1,
0.7982562, 0.5366621, 0.7702157, 0.7333333, 0, 1, 1,
0.8018749, -0.4156747, 3.029714, 0.7411765, 0, 1, 1,
0.8074529, 0.3853334, 1.552973, 0.7450981, 0, 1, 1,
0.8095003, 0.2941156, 2.655419, 0.7529412, 0, 1, 1,
0.8102288, 0.1909133, 2.482246, 0.7568628, 0, 1, 1,
0.8131286, -0.3512523, 1.989519, 0.7647059, 0, 1, 1,
0.8210094, -0.5097373, 0.277384, 0.7686275, 0, 1, 1,
0.8212736, -0.3290526, 2.052642, 0.7764706, 0, 1, 1,
0.8252468, 0.2030479, 0.8638235, 0.7803922, 0, 1, 1,
0.8266041, -1.552243, 2.948362, 0.7882353, 0, 1, 1,
0.8335243, -0.3750426, 0.9387122, 0.7921569, 0, 1, 1,
0.8392025, 0.1539267, 0.8532607, 0.8, 0, 1, 1,
0.8419892, 1.100757, 0.7270029, 0.8078431, 0, 1, 1,
0.8455757, 1.70596, 1.020523, 0.8117647, 0, 1, 1,
0.8497103, -1.353925, 1.688554, 0.8196079, 0, 1, 1,
0.8511882, 0.234797, 1.762141, 0.8235294, 0, 1, 1,
0.8590651, 0.5051008, 1.464255, 0.8313726, 0, 1, 1,
0.8636279, 0.1731029, 1.133088, 0.8352941, 0, 1, 1,
0.8719372, -1.016997, 2.435126, 0.8431373, 0, 1, 1,
0.8735181, 0.3422646, 0.2271903, 0.8470588, 0, 1, 1,
0.873585, -0.9072983, 3.381533, 0.854902, 0, 1, 1,
0.8742589, -0.2120806, 2.477451, 0.8588235, 0, 1, 1,
0.8746344, 0.3194994, 0.1575346, 0.8666667, 0, 1, 1,
0.875028, 0.3915742, 0.3658809, 0.8705882, 0, 1, 1,
0.8764851, -0.5147883, 0.760781, 0.8784314, 0, 1, 1,
0.8787179, 0.6853797, 3.030584, 0.8823529, 0, 1, 1,
0.8881823, 0.6960589, 1.71578, 0.8901961, 0, 1, 1,
0.8936901, -0.05449314, 2.472133, 0.8941177, 0, 1, 1,
0.8986271, -0.3274431, 2.981676, 0.9019608, 0, 1, 1,
0.9060531, -0.1021637, 1.461883, 0.9098039, 0, 1, 1,
0.9069083, 0.4995184, -0.7260292, 0.9137255, 0, 1, 1,
0.9192042, -0.5493436, 1.7649, 0.9215686, 0, 1, 1,
0.9226111, -0.7560458, 2.882941, 0.9254902, 0, 1, 1,
0.9419214, -0.3058395, 0.01722234, 0.9333333, 0, 1, 1,
0.9459575, -1.735391, 3.917497, 0.9372549, 0, 1, 1,
0.9507879, -1.777058, 2.679387, 0.945098, 0, 1, 1,
0.9554024, -1.243656, 2.611524, 0.9490196, 0, 1, 1,
0.9565884, 0.3747078, 2.309356, 0.9568627, 0, 1, 1,
0.9566844, -1.102727, 0.7146174, 0.9607843, 0, 1, 1,
0.9571542, -1.876041, 3.274322, 0.9686275, 0, 1, 1,
0.961514, 0.2227568, 1.947729, 0.972549, 0, 1, 1,
0.9616044, 0.3355605, 1.102215, 0.9803922, 0, 1, 1,
0.9708427, 1.061205, 1.216809, 0.9843137, 0, 1, 1,
0.9779733, -1.160415, 2.914973, 0.9921569, 0, 1, 1,
0.9781863, -0.7529098, 1.906906, 0.9960784, 0, 1, 1,
0.9789816, 0.2836843, 0.6775191, 1, 0, 0.9960784, 1,
0.9878635, 0.6715481, 0.156829, 1, 0, 0.9882353, 1,
0.9883879, -0.01636703, 0.224369, 1, 0, 0.9843137, 1,
0.9895817, 0.9712179, -0.1907669, 1, 0, 0.9764706, 1,
0.9900979, -0.4196388, -0.3734454, 1, 0, 0.972549, 1,
0.9932649, 0.3746941, 0.4128455, 1, 0, 0.9647059, 1,
0.9952189, 0.8090597, 0.7946843, 1, 0, 0.9607843, 1,
1.000858, 0.5499668, 1.976935, 1, 0, 0.9529412, 1,
1.004838, 0.7769879, 1.041981, 1, 0, 0.9490196, 1,
1.015382, 0.7196367, -0.6506832, 1, 0, 0.9411765, 1,
1.021209, -0.435164, 3.474952, 1, 0, 0.9372549, 1,
1.024341, 0.4331195, 1.446248, 1, 0, 0.9294118, 1,
1.025099, 0.000317033, 1.58738, 1, 0, 0.9254902, 1,
1.027044, 0.1394746, 0.5676278, 1, 0, 0.9176471, 1,
1.027384, -0.1325115, 2.450571, 1, 0, 0.9137255, 1,
1.027754, 2.368788, 0.1873219, 1, 0, 0.9058824, 1,
1.038274, 2.300207, -0.5736669, 1, 0, 0.9019608, 1,
1.039643, 0.4402769, 1.848382, 1, 0, 0.8941177, 1,
1.047657, -0.09960952, 0.8127779, 1, 0, 0.8862745, 1,
1.057908, 0.4697164, 1.829604, 1, 0, 0.8823529, 1,
1.062805, 0.2940612, -0.01609196, 1, 0, 0.8745098, 1,
1.069288, -1.19268, 5.551687, 1, 0, 0.8705882, 1,
1.069361, 1.712161, 1.046943, 1, 0, 0.8627451, 1,
1.079453, 1.019199, 1.307454, 1, 0, 0.8588235, 1,
1.084514, 1.636993, -0.5500715, 1, 0, 0.8509804, 1,
1.08719, -0.2486259, 3.075811, 1, 0, 0.8470588, 1,
1.091788, 1.768563, -0.8339797, 1, 0, 0.8392157, 1,
1.097645, 0.1263292, 0.3665422, 1, 0, 0.8352941, 1,
1.098398, -0.2787782, 0.3925658, 1, 0, 0.827451, 1,
1.099216, 1.109519, 2.281713, 1, 0, 0.8235294, 1,
1.102237, -0.4353725, 0.5507088, 1, 0, 0.8156863, 1,
1.10324, 0.4132569, 3.039702, 1, 0, 0.8117647, 1,
1.108871, 0.4000108, 0.7917573, 1, 0, 0.8039216, 1,
1.109946, -0.5247222, 1.586304, 1, 0, 0.7960784, 1,
1.116463, -1.68555, 3.708681, 1, 0, 0.7921569, 1,
1.119627, -1.20152, 2.117207, 1, 0, 0.7843137, 1,
1.120893, -0.1800091, 1.724667, 1, 0, 0.7803922, 1,
1.122136, 0.4025278, 0.6282814, 1, 0, 0.772549, 1,
1.122147, -0.1243914, 0.7792187, 1, 0, 0.7686275, 1,
1.143257, -0.6391347, 2.036839, 1, 0, 0.7607843, 1,
1.16628, -0.4947137, 1.131723, 1, 0, 0.7568628, 1,
1.168153, 0.8228934, 0.5099746, 1, 0, 0.7490196, 1,
1.170311, 2.977043, -0.5032968, 1, 0, 0.7450981, 1,
1.173354, 0.5140617, 1.360268, 1, 0, 0.7372549, 1,
1.179241, -1.612356, 0.6181496, 1, 0, 0.7333333, 1,
1.184758, 1.068512, 3.328471, 1, 0, 0.7254902, 1,
1.197095, 0.6657254, 2.404355, 1, 0, 0.7215686, 1,
1.19864, 0.5489829, 0.491236, 1, 0, 0.7137255, 1,
1.199013, 0.04628372, 1.995603, 1, 0, 0.7098039, 1,
1.199185, -0.02197001, 1.905148, 1, 0, 0.7019608, 1,
1.21107, 1.59726, 1.531427, 1, 0, 0.6941177, 1,
1.212372, 0.3832574, 1.681011, 1, 0, 0.6901961, 1,
1.219563, -0.3000088, 2.470919, 1, 0, 0.682353, 1,
1.223195, -0.5666583, 2.467895, 1, 0, 0.6784314, 1,
1.226941, -0.9310986, 3.765418, 1, 0, 0.6705883, 1,
1.229374, 1.927099, 0.9970469, 1, 0, 0.6666667, 1,
1.235815, -0.02151125, 1.237103, 1, 0, 0.6588235, 1,
1.25072, -0.7036674, 2.526505, 1, 0, 0.654902, 1,
1.253382, 0.5665222, 2.130723, 1, 0, 0.6470588, 1,
1.256671, -0.9698687, 1.568273, 1, 0, 0.6431373, 1,
1.256803, -1.361246, 2.382105, 1, 0, 0.6352941, 1,
1.257772, -0.1812638, 1.283872, 1, 0, 0.6313726, 1,
1.259172, 0.5735388, -0.1910562, 1, 0, 0.6235294, 1,
1.260687, 0.5560435, 2.19557, 1, 0, 0.6196079, 1,
1.264369, 0.2097143, 2.361414, 1, 0, 0.6117647, 1,
1.272071, -0.248491, 2.234448, 1, 0, 0.6078432, 1,
1.285833, 2.560075, 0.5733175, 1, 0, 0.6, 1,
1.294019, 2.612072, -0.5767354, 1, 0, 0.5921569, 1,
1.294529, -0.1082446, 2.714061, 1, 0, 0.5882353, 1,
1.306031, 0.1361628, 1.194432, 1, 0, 0.5803922, 1,
1.307496, 1.645212, 0.120749, 1, 0, 0.5764706, 1,
1.315168, 0.04026828, 1.397848, 1, 0, 0.5686275, 1,
1.325229, 2.941843, 1.677896, 1, 0, 0.5647059, 1,
1.325852, 1.92353, 0.701847, 1, 0, 0.5568628, 1,
1.354412, -0.2377392, 2.26943, 1, 0, 0.5529412, 1,
1.354467, 3.364787, 1.015649, 1, 0, 0.5450981, 1,
1.361606, -1.472067, 3.300054, 1, 0, 0.5411765, 1,
1.371243, -0.4048584, 1.830516, 1, 0, 0.5333334, 1,
1.374308, 0.3748332, 2.104957, 1, 0, 0.5294118, 1,
1.375494, -0.3230897, 0.7328917, 1, 0, 0.5215687, 1,
1.381359, -0.4699954, 2.072988, 1, 0, 0.5176471, 1,
1.383878, -0.4538141, -0.4842989, 1, 0, 0.509804, 1,
1.397437, -0.8659036, 2.344569, 1, 0, 0.5058824, 1,
1.400572, 0.1877943, 2.365852, 1, 0, 0.4980392, 1,
1.402931, -0.104123, 2.276281, 1, 0, 0.4901961, 1,
1.417549, 1.230738, -1.288471, 1, 0, 0.4862745, 1,
1.419893, 0.4778025, 2.011671, 1, 0, 0.4784314, 1,
1.42982, -0.9859693, 2.506558, 1, 0, 0.4745098, 1,
1.429871, 0.8137521, 1.344367, 1, 0, 0.4666667, 1,
1.438016, 0.2928083, 0.04762825, 1, 0, 0.4627451, 1,
1.477545, -0.7261705, 1.519312, 1, 0, 0.454902, 1,
1.479257, 0.7176189, 0.6342468, 1, 0, 0.4509804, 1,
1.487047, -0.9002275, 2.649155, 1, 0, 0.4431373, 1,
1.50127, 0.136477, 1.220487, 1, 0, 0.4392157, 1,
1.504878, 1.474632, 0.1903636, 1, 0, 0.4313726, 1,
1.505158, -0.3316309, -0.4221354, 1, 0, 0.427451, 1,
1.513928, 1.524382, 1.366267, 1, 0, 0.4196078, 1,
1.516021, 1.221771, 1.111566, 1, 0, 0.4156863, 1,
1.536888, -0.8894951, 2.064703, 1, 0, 0.4078431, 1,
1.556789, 1.352937, 1.529419, 1, 0, 0.4039216, 1,
1.576616, 0.3101794, 2.460075, 1, 0, 0.3960784, 1,
1.581777, -0.5716918, 0.909818, 1, 0, 0.3882353, 1,
1.594715, 0.3665183, -0.3388198, 1, 0, 0.3843137, 1,
1.615727, -1.813177, 1.815762, 1, 0, 0.3764706, 1,
1.61786, -1.495814, 3.796209, 1, 0, 0.372549, 1,
1.625983, 1.522335, 0.3494634, 1, 0, 0.3647059, 1,
1.626466, -0.05433635, 0.3349905, 1, 0, 0.3607843, 1,
1.627982, 1.20825, 1.188738, 1, 0, 0.3529412, 1,
1.631268, 1.059944, 2.196319, 1, 0, 0.3490196, 1,
1.635708, -1.083254, 1.755959, 1, 0, 0.3411765, 1,
1.637621, 0.5681911, 1.732373, 1, 0, 0.3372549, 1,
1.638504, -1.013714, 2.510141, 1, 0, 0.3294118, 1,
1.679371, -1.134568, 3.035515, 1, 0, 0.3254902, 1,
1.679476, 2.15924, 1.852993, 1, 0, 0.3176471, 1,
1.682146, -1.980274, 4.312742, 1, 0, 0.3137255, 1,
1.682728, -0.7505885, 3.428975, 1, 0, 0.3058824, 1,
1.686249, 0.5549843, 1.362888, 1, 0, 0.2980392, 1,
1.718385, 0.4847207, 2.640899, 1, 0, 0.2941177, 1,
1.721135, 0.6792477, -0.3752641, 1, 0, 0.2862745, 1,
1.74028, -1.383601, 2.355067, 1, 0, 0.282353, 1,
1.741579, -0.3388418, 2.544019, 1, 0, 0.2745098, 1,
1.746381, 0.8800907, 2.797019, 1, 0, 0.2705882, 1,
1.758445, 0.2375387, 0.2712262, 1, 0, 0.2627451, 1,
1.774993, 2.334337, 0.08247945, 1, 0, 0.2588235, 1,
1.780428, 0.4690382, 1.129176, 1, 0, 0.2509804, 1,
1.783974, -1.138989, 1.894378, 1, 0, 0.2470588, 1,
1.818073, 0.352313, 1.937212, 1, 0, 0.2392157, 1,
1.83507, -3.064996, 2.064891, 1, 0, 0.2352941, 1,
1.845816, -0.9155234, 4.245744, 1, 0, 0.227451, 1,
1.8975, -0.7239671, 2.910798, 1, 0, 0.2235294, 1,
1.897826, -0.1568477, -0.5291498, 1, 0, 0.2156863, 1,
1.902898, -0.294888, 1.996225, 1, 0, 0.2117647, 1,
1.91175, -0.05316006, 2.680928, 1, 0, 0.2039216, 1,
1.944029, -0.4177825, 3.015579, 1, 0, 0.1960784, 1,
1.976907, 0.03486531, 0.8019705, 1, 0, 0.1921569, 1,
1.987759, 1.05227, -0.4268576, 1, 0, 0.1843137, 1,
1.995669, 0.8610467, -0.7300205, 1, 0, 0.1803922, 1,
2.000819, -0.8750975, 1.659202, 1, 0, 0.172549, 1,
2.017146, -0.6935742, 2.368191, 1, 0, 0.1686275, 1,
2.042598, 2.059299, 0.07698733, 1, 0, 0.1607843, 1,
2.057851, -0.1534602, 2.98405, 1, 0, 0.1568628, 1,
2.106075, -0.8152726, 2.118161, 1, 0, 0.1490196, 1,
2.10789, 0.07131744, 1.388346, 1, 0, 0.145098, 1,
2.110975, -1.472241, 3.789163, 1, 0, 0.1372549, 1,
2.12623, -1.203251, 2.346901, 1, 0, 0.1333333, 1,
2.127963, -0.009419176, 0.1626297, 1, 0, 0.1254902, 1,
2.142693, 0.6095955, -0.197782, 1, 0, 0.1215686, 1,
2.145197, 1.680064, 1.104944, 1, 0, 0.1137255, 1,
2.154074, -0.3565989, 1.623254, 1, 0, 0.1098039, 1,
2.171095, -0.9741963, 1.911532, 1, 0, 0.1019608, 1,
2.194506, -1.93194, 1.189783, 1, 0, 0.09411765, 1,
2.225598, 0.1013157, 2.243438, 1, 0, 0.09019608, 1,
2.261704, -1.065153, 1.109145, 1, 0, 0.08235294, 1,
2.307119, -0.4573537, 2.441748, 1, 0, 0.07843138, 1,
2.358096, 0.8295562, 2.809242, 1, 0, 0.07058824, 1,
2.377664, 1.143822, 0.600341, 1, 0, 0.06666667, 1,
2.384067, 0.5922113, 2.060015, 1, 0, 0.05882353, 1,
2.435418, 0.3447086, 3.05239, 1, 0, 0.05490196, 1,
2.483751, -0.327773, 1.823957, 1, 0, 0.04705882, 1,
2.497035, -1.685411, 2.062847, 1, 0, 0.04313726, 1,
2.499815, 0.7606294, 1.219464, 1, 0, 0.03529412, 1,
2.509119, 0.1721415, 1.938685, 1, 0, 0.03137255, 1,
2.803118, -0.7111086, 1.918509, 1, 0, 0.02352941, 1,
2.817401, 0.6319181, 1.501354, 1, 0, 0.01960784, 1,
3.190027, 1.041994, 0.2269799, 1, 0, 0.01176471, 1,
4.267564, 0.2663686, 1.867509, 1, 0, 0.007843138, 1
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
0.7239439, -4.722615, -7.247256, 0, -0.5, 0.5, 0.5,
0.7239439, -4.722615, -7.247256, 1, -0.5, 0.5, 0.5,
0.7239439, -4.722615, -7.247256, 1, 1.5, 0.5, 0.5,
0.7239439, -4.722615, -7.247256, 0, 1.5, 0.5, 0.5
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
-4.020963, -0.09284544, -7.247256, 0, -0.5, 0.5, 0.5,
-4.020963, -0.09284544, -7.247256, 1, -0.5, 0.5, 0.5,
-4.020963, -0.09284544, -7.247256, 1, 1.5, 0.5, 0.5,
-4.020963, -0.09284544, -7.247256, 0, 1.5, 0.5, 0.5
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
-4.020963, -4.722615, 0.07971501, 0, -0.5, 0.5, 0.5,
-4.020963, -4.722615, 0.07971501, 1, -0.5, 0.5, 0.5,
-4.020963, -4.722615, 0.07971501, 1, 1.5, 0.5, 0.5,
-4.020963, -4.722615, 0.07971501, 0, 1.5, 0.5, 0.5
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
-2, -3.654207, -5.556417,
4, -3.654207, -5.556417,
-2, -3.654207, -5.556417,
-2, -3.832274, -5.838223,
0, -3.654207, -5.556417,
0, -3.832274, -5.838223,
2, -3.654207, -5.556417,
2, -3.832274, -5.838223,
4, -3.654207, -5.556417,
4, -3.832274, -5.838223
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
-2, -4.188411, -6.401836, 0, -0.5, 0.5, 0.5,
-2, -4.188411, -6.401836, 1, -0.5, 0.5, 0.5,
-2, -4.188411, -6.401836, 1, 1.5, 0.5, 0.5,
-2, -4.188411, -6.401836, 0, 1.5, 0.5, 0.5,
0, -4.188411, -6.401836, 0, -0.5, 0.5, 0.5,
0, -4.188411, -6.401836, 1, -0.5, 0.5, 0.5,
0, -4.188411, -6.401836, 1, 1.5, 0.5, 0.5,
0, -4.188411, -6.401836, 0, 1.5, 0.5, 0.5,
2, -4.188411, -6.401836, 0, -0.5, 0.5, 0.5,
2, -4.188411, -6.401836, 1, -0.5, 0.5, 0.5,
2, -4.188411, -6.401836, 1, 1.5, 0.5, 0.5,
2, -4.188411, -6.401836, 0, 1.5, 0.5, 0.5,
4, -4.188411, -6.401836, 0, -0.5, 0.5, 0.5,
4, -4.188411, -6.401836, 1, -0.5, 0.5, 0.5,
4, -4.188411, -6.401836, 1, 1.5, 0.5, 0.5,
4, -4.188411, -6.401836, 0, 1.5, 0.5, 0.5
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
-2.925985, -3, -5.556417,
-2.925985, 3, -5.556417,
-2.925985, -3, -5.556417,
-3.108481, -3, -5.838223,
-2.925985, -2, -5.556417,
-3.108481, -2, -5.838223,
-2.925985, -1, -5.556417,
-3.108481, -1, -5.838223,
-2.925985, 0, -5.556417,
-3.108481, 0, -5.838223,
-2.925985, 1, -5.556417,
-3.108481, 1, -5.838223,
-2.925985, 2, -5.556417,
-3.108481, 2, -5.838223,
-2.925985, 3, -5.556417,
-3.108481, 3, -5.838223
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
-3.473474, -3, -6.401836, 0, -0.5, 0.5, 0.5,
-3.473474, -3, -6.401836, 1, -0.5, 0.5, 0.5,
-3.473474, -3, -6.401836, 1, 1.5, 0.5, 0.5,
-3.473474, -3, -6.401836, 0, 1.5, 0.5, 0.5,
-3.473474, -2, -6.401836, 0, -0.5, 0.5, 0.5,
-3.473474, -2, -6.401836, 1, -0.5, 0.5, 0.5,
-3.473474, -2, -6.401836, 1, 1.5, 0.5, 0.5,
-3.473474, -2, -6.401836, 0, 1.5, 0.5, 0.5,
-3.473474, -1, -6.401836, 0, -0.5, 0.5, 0.5,
-3.473474, -1, -6.401836, 1, -0.5, 0.5, 0.5,
-3.473474, -1, -6.401836, 1, 1.5, 0.5, 0.5,
-3.473474, -1, -6.401836, 0, 1.5, 0.5, 0.5,
-3.473474, 0, -6.401836, 0, -0.5, 0.5, 0.5,
-3.473474, 0, -6.401836, 1, -0.5, 0.5, 0.5,
-3.473474, 0, -6.401836, 1, 1.5, 0.5, 0.5,
-3.473474, 0, -6.401836, 0, 1.5, 0.5, 0.5,
-3.473474, 1, -6.401836, 0, -0.5, 0.5, 0.5,
-3.473474, 1, -6.401836, 1, -0.5, 0.5, 0.5,
-3.473474, 1, -6.401836, 1, 1.5, 0.5, 0.5,
-3.473474, 1, -6.401836, 0, 1.5, 0.5, 0.5,
-3.473474, 2, -6.401836, 0, -0.5, 0.5, 0.5,
-3.473474, 2, -6.401836, 1, -0.5, 0.5, 0.5,
-3.473474, 2, -6.401836, 1, 1.5, 0.5, 0.5,
-3.473474, 2, -6.401836, 0, 1.5, 0.5, 0.5,
-3.473474, 3, -6.401836, 0, -0.5, 0.5, 0.5,
-3.473474, 3, -6.401836, 1, -0.5, 0.5, 0.5,
-3.473474, 3, -6.401836, 1, 1.5, 0.5, 0.5,
-3.473474, 3, -6.401836, 0, 1.5, 0.5, 0.5
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
-2.925985, -3.654207, -4,
-2.925985, -3.654207, 4,
-2.925985, -3.654207, -4,
-3.108481, -3.832274, -4,
-2.925985, -3.654207, -2,
-3.108481, -3.832274, -2,
-2.925985, -3.654207, 0,
-3.108481, -3.832274, 0,
-2.925985, -3.654207, 2,
-3.108481, -3.832274, 2,
-2.925985, -3.654207, 4,
-3.108481, -3.832274, 4
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
-3.473474, -4.188411, -4, 0, -0.5, 0.5, 0.5,
-3.473474, -4.188411, -4, 1, -0.5, 0.5, 0.5,
-3.473474, -4.188411, -4, 1, 1.5, 0.5, 0.5,
-3.473474, -4.188411, -4, 0, 1.5, 0.5, 0.5,
-3.473474, -4.188411, -2, 0, -0.5, 0.5, 0.5,
-3.473474, -4.188411, -2, 1, -0.5, 0.5, 0.5,
-3.473474, -4.188411, -2, 1, 1.5, 0.5, 0.5,
-3.473474, -4.188411, -2, 0, 1.5, 0.5, 0.5,
-3.473474, -4.188411, 0, 0, -0.5, 0.5, 0.5,
-3.473474, -4.188411, 0, 1, -0.5, 0.5, 0.5,
-3.473474, -4.188411, 0, 1, 1.5, 0.5, 0.5,
-3.473474, -4.188411, 0, 0, 1.5, 0.5, 0.5,
-3.473474, -4.188411, 2, 0, -0.5, 0.5, 0.5,
-3.473474, -4.188411, 2, 1, -0.5, 0.5, 0.5,
-3.473474, -4.188411, 2, 1, 1.5, 0.5, 0.5,
-3.473474, -4.188411, 2, 0, 1.5, 0.5, 0.5,
-3.473474, -4.188411, 4, 0, -0.5, 0.5, 0.5,
-3.473474, -4.188411, 4, 1, -0.5, 0.5, 0.5,
-3.473474, -4.188411, 4, 1, 1.5, 0.5, 0.5,
-3.473474, -4.188411, 4, 0, 1.5, 0.5, 0.5
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
-2.925985, -3.654207, -5.556417,
-2.925985, 3.468516, -5.556417,
-2.925985, -3.654207, 5.715847,
-2.925985, 3.468516, 5.715847,
-2.925985, -3.654207, -5.556417,
-2.925985, -3.654207, 5.715847,
-2.925985, 3.468516, -5.556417,
-2.925985, 3.468516, 5.715847,
-2.925985, -3.654207, -5.556417,
4.373872, -3.654207, -5.556417,
-2.925985, -3.654207, 5.715847,
4.373872, -3.654207, 5.715847,
-2.925985, 3.468516, -5.556417,
4.373872, 3.468516, -5.556417,
-2.925985, 3.468516, 5.715847,
4.373872, 3.468516, 5.715847,
4.373872, -3.654207, -5.556417,
4.373872, 3.468516, -5.556417,
4.373872, -3.654207, 5.715847,
4.373872, 3.468516, 5.715847,
4.373872, -3.654207, -5.556417,
4.373872, -3.654207, 5.715847,
4.373872, 3.468516, -5.556417,
4.373872, 3.468516, 5.715847
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
var radius = 8.117295;
var distance = 36.11476;
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
mvMatrix.translate( -0.7239439, 0.09284544, -0.07971501 );
mvMatrix.scale( 1.202295, 1.232194, 0.7785995 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.11476);
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
forchlorfenuron<-read.table("forchlorfenuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-forchlorfenuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'forchlorfenuron' not found
```

```r
y<-forchlorfenuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'forchlorfenuron' not found
```

```r
z<-forchlorfenuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'forchlorfenuron' not found
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
-2.819676, 0.828954, 1.132933, 0, 0, 1, 1, 1,
-2.761729, 0.2078321, -1.55125, 1, 0, 0, 1, 1,
-2.700081, 1.737288, -1.670768, 1, 0, 0, 1, 1,
-2.59603, 0.5384585, -1.854341, 1, 0, 0, 1, 1,
-2.58993, -0.3951343, -3.406446, 1, 0, 0, 1, 1,
-2.497082, -0.1390165, -2.767261, 1, 0, 0, 1, 1,
-2.467201, 0.5615376, -1.99331, 0, 0, 0, 1, 1,
-2.434907, -0.1749817, -1.478937, 0, 0, 0, 1, 1,
-2.407182, -1.070691, -2.204314, 0, 0, 0, 1, 1,
-2.362226, -0.2140003, -0.9510463, 0, 0, 0, 1, 1,
-2.33408, 0.402677, -0.6631616, 0, 0, 0, 1, 1,
-2.248785, 1.123361, -1.77587, 0, 0, 0, 1, 1,
-2.184119, 0.8986945, 0.4948859, 0, 0, 0, 1, 1,
-2.170655, -0.5272062, -1.296718, 1, 1, 1, 1, 1,
-2.149336, 0.3247337, 0.4243197, 1, 1, 1, 1, 1,
-2.121413, 0.4780171, -0.8988932, 1, 1, 1, 1, 1,
-2.109927, 0.371603, -1.809326, 1, 1, 1, 1, 1,
-2.103398, -0.8684004, -2.011572, 1, 1, 1, 1, 1,
-2.088853, 1.223056, -0.3455842, 1, 1, 1, 1, 1,
-2.075162, -1.779603, -2.699367, 1, 1, 1, 1, 1,
-2.06485, 0.07195344, -0.0521581, 1, 1, 1, 1, 1,
-2.064716, -0.1713726, -1.448706, 1, 1, 1, 1, 1,
-2.040648, 0.9938346, -0.4049509, 1, 1, 1, 1, 1,
-2.031116, 0.8001245, -2.214819, 1, 1, 1, 1, 1,
-2.015529, -0.3139153, -1.359195, 1, 1, 1, 1, 1,
-2.001316, 0.4072967, -0.9198119, 1, 1, 1, 1, 1,
-1.984318, 0.6943212, -2.666076, 1, 1, 1, 1, 1,
-1.979782, -0.6354409, -1.797019, 1, 1, 1, 1, 1,
-1.951297, 1.655788, -1.310916, 0, 0, 1, 1, 1,
-1.897764, -0.8215382, -2.280175, 1, 0, 0, 1, 1,
-1.89545, 0.2829712, -1.912384, 1, 0, 0, 1, 1,
-1.798596, -1.062699, -1.707386, 1, 0, 0, 1, 1,
-1.788789, 0.2066029, -1.789113, 1, 0, 0, 1, 1,
-1.753172, 0.7955878, -1.954836, 1, 0, 0, 1, 1,
-1.73693, 0.6652227, -0.05163712, 0, 0, 0, 1, 1,
-1.720284, 0.515883, 0.02303023, 0, 0, 0, 1, 1,
-1.717434, -0.1306762, -3.581593, 0, 0, 0, 1, 1,
-1.715723, 1.511955, -0.8839774, 0, 0, 0, 1, 1,
-1.69129, -1.308879, -0.5262104, 0, 0, 0, 1, 1,
-1.669692, 0.554307, -1.693927, 0, 0, 0, 1, 1,
-1.66897, -1.51033, -0.7375174, 0, 0, 0, 1, 1,
-1.634751, -0.5576034, -2.022207, 1, 1, 1, 1, 1,
-1.631228, -1.717571, -2.38736, 1, 1, 1, 1, 1,
-1.623295, -1.108811, -1.922976, 1, 1, 1, 1, 1,
-1.622266, -1.080929, -0.2080577, 1, 1, 1, 1, 1,
-1.621719, 0.2923839, 0.1316842, 1, 1, 1, 1, 1,
-1.605997, 0.1548455, -4.057965, 1, 1, 1, 1, 1,
-1.603953, 0.2205784, -2.823818, 1, 1, 1, 1, 1,
-1.597085, -1.198497, -1.797127, 1, 1, 1, 1, 1,
-1.582498, 0.8171606, -1.449531, 1, 1, 1, 1, 1,
-1.566399, -1.462481, -1.671924, 1, 1, 1, 1, 1,
-1.538418, -0.2738295, -1.292982, 1, 1, 1, 1, 1,
-1.534894, -1.762807, -1.474114, 1, 1, 1, 1, 1,
-1.531707, 1.144277, -0.9320862, 1, 1, 1, 1, 1,
-1.519407, -0.3818964, -0.9353567, 1, 1, 1, 1, 1,
-1.517602, -0.9357918, -1.123711, 1, 1, 1, 1, 1,
-1.514274, -2.084768, -2.925505, 0, 0, 1, 1, 1,
-1.505674, 0.9702369, -0.448288, 1, 0, 0, 1, 1,
-1.500453, -0.3706547, -2.330037, 1, 0, 0, 1, 1,
-1.496663, -0.2502221, -1.417827, 1, 0, 0, 1, 1,
-1.496272, 0.4734314, -0.5860301, 1, 0, 0, 1, 1,
-1.477453, -1.032546, -2.37402, 1, 0, 0, 1, 1,
-1.471766, -0.6162305, -1.180047, 0, 0, 0, 1, 1,
-1.471264, 0.1278761, -4.148844, 0, 0, 0, 1, 1,
-1.443427, -0.4106134, -3.137705, 0, 0, 0, 1, 1,
-1.423682, 0.841401, -0.8248397, 0, 0, 0, 1, 1,
-1.415942, -0.0116997, -2.504592, 0, 0, 0, 1, 1,
-1.407649, 0.5969439, -0.8101051, 0, 0, 0, 1, 1,
-1.402806, -0.1333451, 1.086029, 0, 0, 0, 1, 1,
-1.398599, 0.6066613, -1.213739, 1, 1, 1, 1, 1,
-1.396813, -1.086908, -4.683665, 1, 1, 1, 1, 1,
-1.396771, -1.175701, -1.31161, 1, 1, 1, 1, 1,
-1.395834, 0.4875818, 0.7994819, 1, 1, 1, 1, 1,
-1.388285, -0.9053495, -2.233541, 1, 1, 1, 1, 1,
-1.381696, 0.8623989, -0.1214777, 1, 1, 1, 1, 1,
-1.37351, 0.1507043, -3.057511, 1, 1, 1, 1, 1,
-1.366733, 0.9508857, 0.6611522, 1, 1, 1, 1, 1,
-1.355678, 0.4626504, -1.840874, 1, 1, 1, 1, 1,
-1.354543, 1.873676, -0.449096, 1, 1, 1, 1, 1,
-1.354366, 1.79809, -2.16535, 1, 1, 1, 1, 1,
-1.353135, -0.3255776, -3.100533, 1, 1, 1, 1, 1,
-1.347756, 0.1440074, -0.8064663, 1, 1, 1, 1, 1,
-1.346315, 0.4585282, -1.046222, 1, 1, 1, 1, 1,
-1.345331, 0.6819819, -1.198172, 1, 1, 1, 1, 1,
-1.332345, 0.5892832, -2.229789, 0, 0, 1, 1, 1,
-1.308914, 0.6423914, -1.004509, 1, 0, 0, 1, 1,
-1.308714, -0.1261369, -1.977998, 1, 0, 0, 1, 1,
-1.307871, 1.28617, -1.518637, 1, 0, 0, 1, 1,
-1.298897, -1.251208, -2.992476, 1, 0, 0, 1, 1,
-1.296079, 0.2174689, -0.5203543, 1, 0, 0, 1, 1,
-1.282694, -0.02165607, -1.799666, 0, 0, 0, 1, 1,
-1.279056, -2.054004, -1.864435, 0, 0, 0, 1, 1,
-1.278653, 1.869379, -2.270199, 0, 0, 0, 1, 1,
-1.273864, -0.4283501, -1.796796, 0, 0, 0, 1, 1,
-1.264897, -0.6752563, -2.479546, 0, 0, 0, 1, 1,
-1.259256, 0.5153881, 1.050416, 0, 0, 0, 1, 1,
-1.241493, -1.14632, -2.996872, 0, 0, 0, 1, 1,
-1.237544, -3.550478, -2.351444, 1, 1, 1, 1, 1,
-1.230355, 0.1268448, -1.133467, 1, 1, 1, 1, 1,
-1.223995, 0.7543224, -0.06114524, 1, 1, 1, 1, 1,
-1.201634, 0.001618308, -2.936872, 1, 1, 1, 1, 1,
-1.197716, -0.8827102, -3.685781, 1, 1, 1, 1, 1,
-1.195944, 1.167408, -1.32213, 1, 1, 1, 1, 1,
-1.19416, 0.08715494, -1.723435, 1, 1, 1, 1, 1,
-1.193711, -1.460541, -2.64587, 1, 1, 1, 1, 1,
-1.193701, -0.753706, -3.13001, 1, 1, 1, 1, 1,
-1.193693, 0.8751724, -0.2200186, 1, 1, 1, 1, 1,
-1.189975, -0.4074984, -0.3594169, 1, 1, 1, 1, 1,
-1.184848, 0.3147568, -2.510152, 1, 1, 1, 1, 1,
-1.181613, 1.228854, -0.03193848, 1, 1, 1, 1, 1,
-1.174793, -0.8365877, -3.291998, 1, 1, 1, 1, 1,
-1.15426, -0.1199596, -3.258626, 1, 1, 1, 1, 1,
-1.151962, 0.9952118, -1.045458, 0, 0, 1, 1, 1,
-1.148731, -1.010781, -2.192641, 1, 0, 0, 1, 1,
-1.146897, -0.9065921, -2.659541, 1, 0, 0, 1, 1,
-1.135168, -1.334439, -0.4574962, 1, 0, 0, 1, 1,
-1.128913, -0.877946, -1.973435, 1, 0, 0, 1, 1,
-1.113244, -0.5566174, -1.835317, 1, 0, 0, 1, 1,
-1.104628, 0.252158, -0.9716616, 0, 0, 0, 1, 1,
-1.102876, 0.04570604, -1.243641, 0, 0, 0, 1, 1,
-1.102058, -1.175276, -3.107013, 0, 0, 0, 1, 1,
-1.097726, 1.094159, -0.9183401, 0, 0, 0, 1, 1,
-1.088472, 1.795122, 0.4060123, 0, 0, 0, 1, 1,
-1.070448, 0.4437667, -4.269593, 0, 0, 0, 1, 1,
-1.066659, -0.3513772, -1.888988, 0, 0, 0, 1, 1,
-1.062845, -0.1236826, -1.741924, 1, 1, 1, 1, 1,
-1.058489, -2.508137, -2.925014, 1, 1, 1, 1, 1,
-1.053009, 0.1873143, -2.265966, 1, 1, 1, 1, 1,
-1.052607, -0.6993353, -0.2499141, 1, 1, 1, 1, 1,
-1.041619, -0.2584839, -2.677068, 1, 1, 1, 1, 1,
-1.0379, -0.8075358, -2.625591, 1, 1, 1, 1, 1,
-1.031914, -1.355393, -1.647586, 1, 1, 1, 1, 1,
-1.025647, -1.182614, -3.100205, 1, 1, 1, 1, 1,
-1.022623, -0.2479137, -1.972631, 1, 1, 1, 1, 1,
-1.019118, 1.03662, -0.7055104, 1, 1, 1, 1, 1,
-1.018674, 1.461599, -1.05818, 1, 1, 1, 1, 1,
-0.9955208, 0.2359522, -1.182786, 1, 1, 1, 1, 1,
-0.994511, 0.1026854, -1.022976, 1, 1, 1, 1, 1,
-0.9940997, 1.069422, -1.280512, 1, 1, 1, 1, 1,
-0.9891161, -0.5961134, -1.445599, 1, 1, 1, 1, 1,
-0.9715663, 0.3046748, -1.913501, 0, 0, 1, 1, 1,
-0.969359, -2.415635, -3.115132, 1, 0, 0, 1, 1,
-0.9632232, 0.3609002, -1.190045, 1, 0, 0, 1, 1,
-0.9607162, 1.202498, 0.5010605, 1, 0, 0, 1, 1,
-0.9592072, -0.2803029, -1.435353, 1, 0, 0, 1, 1,
-0.9536676, 0.361246, 0.2772196, 1, 0, 0, 1, 1,
-0.9521984, -0.8366168, -3.311893, 0, 0, 0, 1, 1,
-0.951766, -0.7392179, -2.784299, 0, 0, 0, 1, 1,
-0.9433399, 1.477644, -0.4612084, 0, 0, 0, 1, 1,
-0.9408863, -0.9157141, -3.020508, 0, 0, 0, 1, 1,
-0.9377701, 0.8275748, -0.9997816, 0, 0, 0, 1, 1,
-0.9318124, -2.715962, -2.920922, 0, 0, 0, 1, 1,
-0.9287455, -0.8535866, -3.14905, 0, 0, 0, 1, 1,
-0.9267161, -1.469464, -1.804889, 1, 1, 1, 1, 1,
-0.9230112, -1.402426, -1.530595, 1, 1, 1, 1, 1,
-0.9225304, 2.02125, 0.2359606, 1, 1, 1, 1, 1,
-0.9177619, -1.757453, -3.815476, 1, 1, 1, 1, 1,
-0.9162173, -1.325024, -3.691657, 1, 1, 1, 1, 1,
-0.9108962, 0.7312901, 0.5311526, 1, 1, 1, 1, 1,
-0.9022, 0.779217, -0.02992925, 1, 1, 1, 1, 1,
-0.9021908, -0.3567106, -2.387794, 1, 1, 1, 1, 1,
-0.8945286, 0.2809756, -2.243131, 1, 1, 1, 1, 1,
-0.8855119, -0.5493318, -2.795064, 1, 1, 1, 1, 1,
-0.8854774, 1.240529, -1.365693, 1, 1, 1, 1, 1,
-0.8850822, 1.082063, -0.4559981, 1, 1, 1, 1, 1,
-0.876521, -1.217165, -4.230837, 1, 1, 1, 1, 1,
-0.8758031, -0.4341182, -2.967383, 1, 1, 1, 1, 1,
-0.8708469, 0.4542147, -1.925084, 1, 1, 1, 1, 1,
-0.8676414, 0.9097074, -0.5531975, 0, 0, 1, 1, 1,
-0.8652962, -0.4693445, -1.808998, 1, 0, 0, 1, 1,
-0.8565645, -1.667512, -2.919011, 1, 0, 0, 1, 1,
-0.855608, -0.1239876, -3.059143, 1, 0, 0, 1, 1,
-0.8523473, 0.3461425, -0.9667571, 1, 0, 0, 1, 1,
-0.8480803, 1.053631, -0.8186956, 1, 0, 0, 1, 1,
-0.8464843, -1.343227, -2.605656, 0, 0, 0, 1, 1,
-0.8342547, -1.645411, -2.643569, 0, 0, 0, 1, 1,
-0.8308904, 0.4080748, -2.505943, 0, 0, 0, 1, 1,
-0.8302656, -1.247001, -1.758458, 0, 0, 0, 1, 1,
-0.8266047, -0.5699829, -2.29635, 0, 0, 0, 1, 1,
-0.8248562, -0.192417, -0.05081649, 0, 0, 0, 1, 1,
-0.8248283, 0.5454634, -0.9668502, 0, 0, 0, 1, 1,
-0.8209949, -0.7359011, -3.594274, 1, 1, 1, 1, 1,
-0.8188894, 1.077215, -2.240426, 1, 1, 1, 1, 1,
-0.8174262, 0.06013611, -2.150487, 1, 1, 1, 1, 1,
-0.8125967, -1.219022, -3.273885, 1, 1, 1, 1, 1,
-0.8108245, 0.6076469, -0.2939412, 1, 1, 1, 1, 1,
-0.8052546, 0.3586543, -0.1783714, 1, 1, 1, 1, 1,
-0.8045218, 0.7868024, -0.02853096, 1, 1, 1, 1, 1,
-0.7922353, 1.219522, -0.1670239, 1, 1, 1, 1, 1,
-0.7869139, -0.2764117, -0.9119468, 1, 1, 1, 1, 1,
-0.7834874, 0.3427064, -2.001958, 1, 1, 1, 1, 1,
-0.7767426, -0.2713578, -1.731185, 1, 1, 1, 1, 1,
-0.7746651, 1.233178, 0.3436953, 1, 1, 1, 1, 1,
-0.7730584, -0.9599585, -1.49994, 1, 1, 1, 1, 1,
-0.7696447, 0.3457401, -2.321124, 1, 1, 1, 1, 1,
-0.7681653, 1.779881, 0.5966441, 1, 1, 1, 1, 1,
-0.7678496, 0.373323, -2.855315, 0, 0, 1, 1, 1,
-0.7664688, -0.2155342, -1.192727, 1, 0, 0, 1, 1,
-0.7593305, 0.2857969, 0.2825311, 1, 0, 0, 1, 1,
-0.7555048, -0.1118371, -1.629578, 1, 0, 0, 1, 1,
-0.7544878, 0.4783478, -1.714097, 1, 0, 0, 1, 1,
-0.7502193, -0.8703569, -2.355699, 1, 0, 0, 1, 1,
-0.7485818, 0.8052503, -1.248912, 0, 0, 0, 1, 1,
-0.7335835, 0.3564598, -0.8967205, 0, 0, 0, 1, 1,
-0.7323791, -0.7567382, -1.22724, 0, 0, 0, 1, 1,
-0.7302531, 0.06577828, -0.2184057, 0, 0, 0, 1, 1,
-0.7248443, -0.05386343, -1.569964, 0, 0, 0, 1, 1,
-0.7224694, 0.1019541, -1.723805, 0, 0, 0, 1, 1,
-0.7194276, 0.3533661, 0.0980976, 0, 0, 0, 1, 1,
-0.7162585, -0.9060178, -3.367104, 1, 1, 1, 1, 1,
-0.7123345, 0.2501852, -0.6467867, 1, 1, 1, 1, 1,
-0.7112969, -1.115923, -2.144753, 1, 1, 1, 1, 1,
-0.7019038, -2.842074, -4.240456, 1, 1, 1, 1, 1,
-0.6988681, -0.1235525, -1.495904, 1, 1, 1, 1, 1,
-0.6972499, -0.0116619, -2.934723, 1, 1, 1, 1, 1,
-0.6920855, -0.5982357, -2.120838, 1, 1, 1, 1, 1,
-0.6883835, -0.1275333, -0.6054941, 1, 1, 1, 1, 1,
-0.6882004, -1.772971, -4.49014, 1, 1, 1, 1, 1,
-0.6855538, 1.506528, 0.2422666, 1, 1, 1, 1, 1,
-0.6853909, -1.490545, -3.039623, 1, 1, 1, 1, 1,
-0.6846576, 1.236617, -0.7196611, 1, 1, 1, 1, 1,
-0.6844595, -0.6742131, -3.656121, 1, 1, 1, 1, 1,
-0.6676915, -0.5722266, -2.173905, 1, 1, 1, 1, 1,
-0.6668056, -1.373778, -2.838984, 1, 1, 1, 1, 1,
-0.6649296, -1.156797, -2.114438, 0, 0, 1, 1, 1,
-0.6620091, -0.65289, -2.245038, 1, 0, 0, 1, 1,
-0.6603368, -0.9280884, -3.150225, 1, 0, 0, 1, 1,
-0.6550518, 1.237691, -0.7468323, 1, 0, 0, 1, 1,
-0.6497878, -0.4435127, -3.11207, 1, 0, 0, 1, 1,
-0.648012, 0.9810979, 0.03384951, 1, 0, 0, 1, 1,
-0.6473484, 0.6274827, -1.994936, 0, 0, 0, 1, 1,
-0.6451459, 0.1051328, -2.31879, 0, 0, 0, 1, 1,
-0.6423062, -0.2553564, -0.4150529, 0, 0, 0, 1, 1,
-0.6420833, 0.6744505, -0.9055043, 0, 0, 0, 1, 1,
-0.634732, 0.2149578, -1.25139, 0, 0, 0, 1, 1,
-0.6317967, 0.9559042, -0.8053549, 0, 0, 0, 1, 1,
-0.6294878, 0.7845588, 0.2535165, 0, 0, 0, 1, 1,
-0.6279142, 1.528586, 0.2777356, 1, 1, 1, 1, 1,
-0.6194243, -1.866998, -2.362315, 1, 1, 1, 1, 1,
-0.6181657, -0.6197422, -2.401241, 1, 1, 1, 1, 1,
-0.6138181, 1.68213, -1.604679, 1, 1, 1, 1, 1,
-0.6113935, -0.9533678, -2.906852, 1, 1, 1, 1, 1,
-0.61117, -0.1018877, -0.8034152, 1, 1, 1, 1, 1,
-0.611094, 1.005607, -2.208097, 1, 1, 1, 1, 1,
-0.6036919, 1.270234, -1.878254, 1, 1, 1, 1, 1,
-0.6033659, -0.574082, -3.08614, 1, 1, 1, 1, 1,
-0.6016139, -1.316536, -2.53049, 1, 1, 1, 1, 1,
-0.6015985, 0.5618112, -1.810331, 1, 1, 1, 1, 1,
-0.596666, -0.4683119, -1.271098, 1, 1, 1, 1, 1,
-0.5965673, -2.020342, -3.16446, 1, 1, 1, 1, 1,
-0.5898185, -0.07563887, -1.966661, 1, 1, 1, 1, 1,
-0.5839388, 0.5598268, -1.385969, 1, 1, 1, 1, 1,
-0.5816786, 0.05994663, -1.397692, 0, 0, 1, 1, 1,
-0.5815878, -0.6437706, -1.697137, 1, 0, 0, 1, 1,
-0.5814893, 0.8169212, -0.6926161, 1, 0, 0, 1, 1,
-0.5783404, -0.01993299, -0.6671988, 1, 0, 0, 1, 1,
-0.5779461, 1.461732, 0.1200455, 1, 0, 0, 1, 1,
-0.576839, -0.9302309, -1.537232, 1, 0, 0, 1, 1,
-0.5755146, -0.1534594, -3.446112, 0, 0, 0, 1, 1,
-0.5736075, -1.788055, -2.438618, 0, 0, 0, 1, 1,
-0.5722996, 0.3995483, -1.694555, 0, 0, 0, 1, 1,
-0.5708116, 1.51629, -1.163582, 0, 0, 0, 1, 1,
-0.5676532, 1.184192, -0.1476023, 0, 0, 0, 1, 1,
-0.5653291, -0.02522054, -0.9949678, 0, 0, 0, 1, 1,
-0.5624995, 0.7245554, -0.09403743, 0, 0, 0, 1, 1,
-0.5579543, -1.182947, -5.392257, 1, 1, 1, 1, 1,
-0.5571291, 1.912453, -0.6252537, 1, 1, 1, 1, 1,
-0.5557542, 0.4700637, -0.2959869, 1, 1, 1, 1, 1,
-0.5548321, -1.373455, -3.489999, 1, 1, 1, 1, 1,
-0.5544097, 0.5526367, -0.08321486, 1, 1, 1, 1, 1,
-0.5514856, 1.76142, 0.7109797, 1, 1, 1, 1, 1,
-0.5513942, 1.156096, -2.82043, 1, 1, 1, 1, 1,
-0.5504312, 1.068756, -0.8488645, 1, 1, 1, 1, 1,
-0.5435155, -1.241437, -3.755102, 1, 1, 1, 1, 1,
-0.538696, -0.296797, -0.2512148, 1, 1, 1, 1, 1,
-0.5376642, -0.3288014, -2.483976, 1, 1, 1, 1, 1,
-0.5279715, 0.9353789, 0.04070709, 1, 1, 1, 1, 1,
-0.5243717, -1.274196, -1.588639, 1, 1, 1, 1, 1,
-0.5229561, 0.1109433, -0.5915049, 1, 1, 1, 1, 1,
-0.5223372, -0.6094991, -2.29139, 1, 1, 1, 1, 1,
-0.5214638, 0.2204812, -1.495629, 0, 0, 1, 1, 1,
-0.5199657, 0.3978673, -0.2893035, 1, 0, 0, 1, 1,
-0.519841, 0.02041642, -1.474336, 1, 0, 0, 1, 1,
-0.5169302, -1.417587, -2.015593, 1, 0, 0, 1, 1,
-0.5091577, -0.4485411, -2.545619, 1, 0, 0, 1, 1,
-0.5009095, 0.2799862, -1.039261, 1, 0, 0, 1, 1,
-0.5002493, -0.7813913, -3.280282, 0, 0, 0, 1, 1,
-0.4994551, 1.497966, 1.41173, 0, 0, 0, 1, 1,
-0.4910807, -0.8130341, -2.960884, 0, 0, 0, 1, 1,
-0.4791475, 0.8387077, -0.3615368, 0, 0, 0, 1, 1,
-0.4764845, -0.486733, -2.53675, 0, 0, 0, 1, 1,
-0.4736818, -0.9276952, -2.698662, 0, 0, 0, 1, 1,
-0.4697746, 0.9527985, 0.1706133, 0, 0, 0, 1, 1,
-0.4694051, -2.885941, -3.724535, 1, 1, 1, 1, 1,
-0.4557191, 0.8923166, -1.400601, 1, 1, 1, 1, 1,
-0.4505392, 1.34098, -0.3382324, 1, 1, 1, 1, 1,
-0.4415151, -0.1432741, -2.826701, 1, 1, 1, 1, 1,
-0.4403622, 0.7932737, -0.6656923, 1, 1, 1, 1, 1,
-0.4392806, 0.1924036, -2.76455, 1, 1, 1, 1, 1,
-0.4336128, -0.1054246, -2.100364, 1, 1, 1, 1, 1,
-0.4292679, 0.8858401, 0.09326737, 1, 1, 1, 1, 1,
-0.4290729, -1.849147, -4.811351, 1, 1, 1, 1, 1,
-0.426651, -0.1479443, -0.9209766, 1, 1, 1, 1, 1,
-0.4246758, -0.7613979, -2.161435, 1, 1, 1, 1, 1,
-0.4246119, -0.1367361, -1.489295, 1, 1, 1, 1, 1,
-0.4216223, 1.894028, 0.3926579, 1, 1, 1, 1, 1,
-0.4214638, -2.115587, -3.237563, 1, 1, 1, 1, 1,
-0.4212037, -0.288143, -1.878349, 1, 1, 1, 1, 1,
-0.4202636, -1.777784, -1.935071, 0, 0, 1, 1, 1,
-0.41594, -0.698148, -1.344857, 1, 0, 0, 1, 1,
-0.415747, 0.8321619, -2.400996, 1, 0, 0, 1, 1,
-0.4020261, 1.162485, -2.910018, 1, 0, 0, 1, 1,
-0.400681, 1.337655, 0.3859507, 1, 0, 0, 1, 1,
-0.3954194, 0.9047953, 1.345059, 1, 0, 0, 1, 1,
-0.3942774, -0.06199702, -1.785905, 0, 0, 0, 1, 1,
-0.3894057, -2.26564, -3.490216, 0, 0, 0, 1, 1,
-0.3876872, -0.4534522, -3.964826, 0, 0, 0, 1, 1,
-0.3867506, -0.5651338, -2.058545, 0, 0, 0, 1, 1,
-0.3862585, -0.05530722, -1.969932, 0, 0, 0, 1, 1,
-0.384203, 1.340639, 0.5179666, 0, 0, 0, 1, 1,
-0.3766207, -0.4498048, -1.350375, 0, 0, 0, 1, 1,
-0.3724074, 0.4314445, -2.250277, 1, 1, 1, 1, 1,
-0.3713064, 0.1779823, -0.8834319, 1, 1, 1, 1, 1,
-0.3678989, -0.3030097, -1.824646, 1, 1, 1, 1, 1,
-0.3669235, 1.450333, 1.477064, 1, 1, 1, 1, 1,
-0.3624199, -2.390976, -3.707737, 1, 1, 1, 1, 1,
-0.360206, 0.0407119, -2.475719, 1, 1, 1, 1, 1,
-0.35671, -0.5934475, -0.4405244, 1, 1, 1, 1, 1,
-0.3487979, 1.850565, -0.5495309, 1, 1, 1, 1, 1,
-0.3482822, 2.3183, -0.02039938, 1, 1, 1, 1, 1,
-0.3482215, 0.2153366, -0.8349674, 1, 1, 1, 1, 1,
-0.3477056, -0.2612825, -2.711216, 1, 1, 1, 1, 1,
-0.3463331, 1.239585, -1.019438, 1, 1, 1, 1, 1,
-0.3454177, 0.6284461, 0.4385016, 1, 1, 1, 1, 1,
-0.3443291, 0.233836, 0.9692373, 1, 1, 1, 1, 1,
-0.3425345, -0.1050779, -2.228708, 1, 1, 1, 1, 1,
-0.3393727, 1.305778, -0.7968203, 0, 0, 1, 1, 1,
-0.334627, 1.11619, 1.557507, 1, 0, 0, 1, 1,
-0.3339328, -0.4377404, -3.281228, 1, 0, 0, 1, 1,
-0.3333023, 1.465009, 0.0664538, 1, 0, 0, 1, 1,
-0.3251707, 0.1704345, -1.853551, 1, 0, 0, 1, 1,
-0.3184862, 0.5366102, 0.3127738, 1, 0, 0, 1, 1,
-0.3180537, -0.1663987, -1.162804, 0, 0, 0, 1, 1,
-0.316875, 0.4064925, -1.460801, 0, 0, 0, 1, 1,
-0.3147979, 2.131643, 0.09090158, 0, 0, 0, 1, 1,
-0.3142174, -0.1818999, -2.902865, 0, 0, 0, 1, 1,
-0.3123969, 0.3037288, -1.781661, 0, 0, 0, 1, 1,
-0.3070258, -0.790544, -2.124248, 0, 0, 0, 1, 1,
-0.3045835, 0.05680745, -1.441857, 0, 0, 0, 1, 1,
-0.3028809, 0.3062898, -1.365, 1, 1, 1, 1, 1,
-0.3008431, -0.8951043, -3.748573, 1, 1, 1, 1, 1,
-0.3008191, 1.110551, 0.02140712, 1, 1, 1, 1, 1,
-0.3001338, -1.780512, -2.945467, 1, 1, 1, 1, 1,
-0.2987958, 0.504491, -0.8230649, 1, 1, 1, 1, 1,
-0.2979219, 0.266648, -2.032783, 1, 1, 1, 1, 1,
-0.295263, -1.461436, -1.894844, 1, 1, 1, 1, 1,
-0.2950436, -1.216762, -3.586339, 1, 1, 1, 1, 1,
-0.2909906, 0.3994463, -0.7272341, 1, 1, 1, 1, 1,
-0.289968, 0.6142733, -2.289145, 1, 1, 1, 1, 1,
-0.2870056, -0.4352069, -3.211669, 1, 1, 1, 1, 1,
-0.283619, -0.6406472, -3.262653, 1, 1, 1, 1, 1,
-0.2730379, 0.3412214, -0.7477808, 1, 1, 1, 1, 1,
-0.2695751, -0.5426132, -2.469982, 1, 1, 1, 1, 1,
-0.2691116, -0.5598015, -1.871881, 1, 1, 1, 1, 1,
-0.2650199, -0.1196149, -2.277265, 0, 0, 1, 1, 1,
-0.2647593, -0.654438, -4.677054, 1, 0, 0, 1, 1,
-0.2642839, 0.111795, -2.275141, 1, 0, 0, 1, 1,
-0.2587625, -1.344595, -2.652538, 1, 0, 0, 1, 1,
-0.2569183, 1.09783, -0.1081307, 1, 0, 0, 1, 1,
-0.2514518, 0.193478, -1.176436, 1, 0, 0, 1, 1,
-0.2500621, -0.2376987, -2.524723, 0, 0, 0, 1, 1,
-0.2477146, -2.471994, -3.005112, 0, 0, 0, 1, 1,
-0.2426677, 1.583889, -2.995753, 0, 0, 0, 1, 1,
-0.2423523, 0.9647337, -0.2587795, 0, 0, 0, 1, 1,
-0.2385063, 1.11297, -0.9619541, 0, 0, 0, 1, 1,
-0.2368952, -0.260191, -2.579565, 0, 0, 0, 1, 1,
-0.2361027, -0.6754068, -2.28182, 0, 0, 0, 1, 1,
-0.2334701, -0.4549453, -2.9756, 1, 1, 1, 1, 1,
-0.2324365, -0.9590369, -2.833741, 1, 1, 1, 1, 1,
-0.2308087, -0.9395455, -1.791512, 1, 1, 1, 1, 1,
-0.2301662, -0.7416984, -3.280887, 1, 1, 1, 1, 1,
-0.2264215, 1.580592, -1.323278, 1, 1, 1, 1, 1,
-0.2246324, -0.1312827, -2.102757, 1, 1, 1, 1, 1,
-0.2224195, -1.978553, -2.58682, 1, 1, 1, 1, 1,
-0.2224016, 0.140157, 0.4711294, 1, 1, 1, 1, 1,
-0.2063941, -0.8055835, -4.634395, 1, 1, 1, 1, 1,
-0.2063081, 0.364851, -0.105779, 1, 1, 1, 1, 1,
-0.2050713, -0.1210181, -0.8879107, 1, 1, 1, 1, 1,
-0.2005879, 0.8630434, -0.7446869, 1, 1, 1, 1, 1,
-0.1956882, -0.4295411, -2.075082, 1, 1, 1, 1, 1,
-0.1953627, -2.263083, -2.561915, 1, 1, 1, 1, 1,
-0.1944912, -0.6576077, -3.018736, 1, 1, 1, 1, 1,
-0.193959, 0.09778281, -1.507926, 0, 0, 1, 1, 1,
-0.1903333, 0.09875289, -2.288093, 1, 0, 0, 1, 1,
-0.190147, 1.622609, -0.09383483, 1, 0, 0, 1, 1,
-0.1881482, 0.6051774, 1.056123, 1, 0, 0, 1, 1,
-0.1837887, 1.836578, -0.7305381, 1, 0, 0, 1, 1,
-0.1783361, 0.9930033, 0.421355, 1, 0, 0, 1, 1,
-0.1780494, 0.6777357, -0.9011399, 0, 0, 0, 1, 1,
-0.1774078, 1.591752, -0.5994873, 0, 0, 0, 1, 1,
-0.1772712, 0.8408175, 0.06803156, 0, 0, 0, 1, 1,
-0.1753317, -1.170092, -3.862757, 0, 0, 0, 1, 1,
-0.172188, -0.2012092, -1.626884, 0, 0, 0, 1, 1,
-0.1709684, 0.6157067, -1.457521, 0, 0, 0, 1, 1,
-0.1698106, -0.7009986, -2.130074, 0, 0, 0, 1, 1,
-0.1674106, -1.666835, -3.690188, 1, 1, 1, 1, 1,
-0.1646724, 0.9286416, -0.9895821, 1, 1, 1, 1, 1,
-0.1638078, -0.4774723, -1.353768, 1, 1, 1, 1, 1,
-0.1632864, 0.04290108, 0.7467888, 1, 1, 1, 1, 1,
-0.1629995, -0.8580496, -3.262063, 1, 1, 1, 1, 1,
-0.1623528, 1.140726, -0.6947855, 1, 1, 1, 1, 1,
-0.1613391, 0.6598471, 0.9681226, 1, 1, 1, 1, 1,
-0.1546442, 1.26904, -0.7786933, 1, 1, 1, 1, 1,
-0.1534325, 0.02040106, -1.259299, 1, 1, 1, 1, 1,
-0.152112, 0.5439048, -1.025246, 1, 1, 1, 1, 1,
-0.1495074, -0.2243476, -2.041767, 1, 1, 1, 1, 1,
-0.1472943, -0.2307443, -1.806557, 1, 1, 1, 1, 1,
-0.1454176, -0.4409994, -4.084367, 1, 1, 1, 1, 1,
-0.1451263, -0.5230328, -3.068866, 1, 1, 1, 1, 1,
-0.1444282, -0.7147042, -3.401328, 1, 1, 1, 1, 1,
-0.1433474, 1.30957, -0.7001544, 0, 0, 1, 1, 1,
-0.1428598, -1.045853, -3.445158, 1, 0, 0, 1, 1,
-0.1426201, -0.5062521, -0.9977099, 1, 0, 0, 1, 1,
-0.1415316, -0.1871498, -0.2702454, 1, 0, 0, 1, 1,
-0.1366554, 1.156617, -1.077377, 1, 0, 0, 1, 1,
-0.1359814, 0.296648, 0.5621604, 1, 0, 0, 1, 1,
-0.1329522, -0.213709, -4.08774, 0, 0, 0, 1, 1,
-0.128836, -0.3390619, -1.944412, 0, 0, 0, 1, 1,
-0.1287187, -0.1703635, -1.674744, 0, 0, 0, 1, 1,
-0.1280111, -0.4432718, -3.890976, 0, 0, 0, 1, 1,
-0.1269221, 0.7040148, 0.09532811, 0, 0, 0, 1, 1,
-0.1264339, 1.405036, -1.2783, 0, 0, 0, 1, 1,
-0.1247059, 0.3625438, 0.6979512, 0, 0, 0, 1, 1,
-0.1231525, -0.6639413, -2.33586, 1, 1, 1, 1, 1,
-0.1224744, 0.3349502, -0.9655676, 1, 1, 1, 1, 1,
-0.1197668, -1.070482, -3.497577, 1, 1, 1, 1, 1,
-0.114528, -0.673839, -2.002323, 1, 1, 1, 1, 1,
-0.1091684, -0.6846353, -3.099688, 1, 1, 1, 1, 1,
-0.1067981, 0.3262609, -0.7415944, 1, 1, 1, 1, 1,
-0.1013984, -0.1305595, -2.507593, 1, 1, 1, 1, 1,
-0.09897628, 0.5374954, -0.04951372, 1, 1, 1, 1, 1,
-0.09070842, 0.6260387, -1.498563, 1, 1, 1, 1, 1,
-0.08679505, -0.792266, -2.140085, 1, 1, 1, 1, 1,
-0.08547454, -0.1040094, -3.289892, 1, 1, 1, 1, 1,
-0.08408423, 0.2223743, 0.02951796, 1, 1, 1, 1, 1,
-0.08242531, -0.1736546, -2.298938, 1, 1, 1, 1, 1,
-0.07777862, 1.052647, 1.901095, 1, 1, 1, 1, 1,
-0.07607224, 0.7561668, -0.6420469, 1, 1, 1, 1, 1,
-0.07464989, -0.6520333, -2.775321, 0, 0, 1, 1, 1,
-0.07431358, -1.756361, -4.554956, 1, 0, 0, 1, 1,
-0.07285151, 1.217422, 1.190053, 1, 0, 0, 1, 1,
-0.06874229, -0.4015845, -3.833997, 1, 0, 0, 1, 1,
-0.06376539, -0.9528638, -4.348732, 1, 0, 0, 1, 1,
-0.06348813, -0.3518561, -2.812947, 1, 0, 0, 1, 1,
-0.06164176, -0.02169469, -2.966043, 0, 0, 0, 1, 1,
-0.06130132, -1.418537, -2.744053, 0, 0, 0, 1, 1,
-0.0551232, -0.3268443, -2.565771, 0, 0, 0, 1, 1,
-0.04917059, 0.9840001, 0.3888839, 0, 0, 0, 1, 1,
-0.04759929, 1.337743, 0.09479752, 0, 0, 0, 1, 1,
-0.04539695, -1.491554, -2.512511, 0, 0, 0, 1, 1,
-0.04425791, -0.5696044, -3.9201, 0, 0, 0, 1, 1,
-0.04402229, -1.19619, -3.725575, 1, 1, 1, 1, 1,
-0.04277011, 0.474353, 1.218673, 1, 1, 1, 1, 1,
-0.04179751, -1.816505, -2.374456, 1, 1, 1, 1, 1,
-0.03600395, -1.424368, -1.904304, 1, 1, 1, 1, 1,
-0.03573221, 0.4323056, -0.3389899, 1, 1, 1, 1, 1,
-0.03534699, -0.1751225, -2.149162, 1, 1, 1, 1, 1,
-0.03494689, -1.903154, -2.440704, 1, 1, 1, 1, 1,
-0.03403448, 1.122985, 1.685157, 1, 1, 1, 1, 1,
-0.03293774, 1.127607, 1.518977, 1, 1, 1, 1, 1,
-0.03187639, 0.3408414, -0.9693943, 1, 1, 1, 1, 1,
-0.0309078, -1.580239, -3.233787, 1, 1, 1, 1, 1,
-0.02825546, 0.5617339, -0.2538102, 1, 1, 1, 1, 1,
-0.01506696, 0.8204919, -0.6478459, 1, 1, 1, 1, 1,
-0.01331615, -0.762787, -3.616886, 1, 1, 1, 1, 1,
-0.0132438, -0.2453579, -0.914233, 1, 1, 1, 1, 1,
-0.01232922, 0.6325932, 0.08933639, 0, 0, 1, 1, 1,
-0.009232479, 1.219421, -0.1972996, 1, 0, 0, 1, 1,
-0.008324824, -0.5297276, -3.841834, 1, 0, 0, 1, 1,
-0.008070479, -0.1873627, -2.659693, 1, 0, 0, 1, 1,
-0.004750316, -0.5640867, -2.112288, 1, 0, 0, 1, 1,
-0.004710379, 1.296869, 0.6532584, 1, 0, 0, 1, 1,
-0.0002650433, 0.5153664, -0.1336111, 0, 0, 0, 1, 1,
0.001799949, -0.2752958, 3.753464, 0, 0, 0, 1, 1,
0.002550146, 1.134685, 1.877385, 0, 0, 0, 1, 1,
0.002923334, 0.1389917, -1.652761, 0, 0, 0, 1, 1,
0.003402537, -1.409247, 2.405641, 0, 0, 0, 1, 1,
0.009220173, 0.7027583, 0.3773646, 0, 0, 0, 1, 1,
0.01064694, 0.2212619, 0.4177785, 0, 0, 0, 1, 1,
0.01958937, -0.09532823, 1.383523, 1, 1, 1, 1, 1,
0.02051269, -0.3475859, 2.557825, 1, 1, 1, 1, 1,
0.02430342, 0.4107523, 0.6874111, 1, 1, 1, 1, 1,
0.0257236, -0.4004555, 3.744033, 1, 1, 1, 1, 1,
0.02692917, -1.592811, 2.456878, 1, 1, 1, 1, 1,
0.02859056, 0.8417896, -0.6407673, 1, 1, 1, 1, 1,
0.03061228, -0.8896654, 3.988333, 1, 1, 1, 1, 1,
0.03161756, 1.393794, 0.9349065, 1, 1, 1, 1, 1,
0.03344064, 0.3531928, 0.05564613, 1, 1, 1, 1, 1,
0.03429496, -1.116975, 1.914819, 1, 1, 1, 1, 1,
0.03593973, -0.3669344, 3.708382, 1, 1, 1, 1, 1,
0.03670993, 0.2432458, -0.40712, 1, 1, 1, 1, 1,
0.03724914, 1.314991, -1.883143, 1, 1, 1, 1, 1,
0.03871604, -1.371836, 3.910778, 1, 1, 1, 1, 1,
0.04073236, -1.703533, 2.730879, 1, 1, 1, 1, 1,
0.04174912, -2.67917, 3.212081, 0, 0, 1, 1, 1,
0.04551871, -0.06936933, 2.848271, 1, 0, 0, 1, 1,
0.04881015, 0.5788733, -1.130627, 1, 0, 0, 1, 1,
0.05107804, -0.3286, 2.401144, 1, 0, 0, 1, 1,
0.05292851, 0.2624978, -1.703183, 1, 0, 0, 1, 1,
0.05339999, -0.4502226, 2.727063, 1, 0, 0, 1, 1,
0.05513101, -1.728761, 3.028815, 0, 0, 0, 1, 1,
0.05525441, -0.7702449, 3.619495, 0, 0, 0, 1, 1,
0.05755492, 1.055703, 0.06203444, 0, 0, 0, 1, 1,
0.05855268, -2.623116, 3.665676, 0, 0, 0, 1, 1,
0.06095028, 0.7836446, -0.8653345, 0, 0, 0, 1, 1,
0.07180306, 0.6675239, -0.9422032, 0, 0, 0, 1, 1,
0.07430571, 0.408485, 0.8692906, 0, 0, 0, 1, 1,
0.07535293, 0.01575171, 1.137474, 1, 1, 1, 1, 1,
0.07587079, -0.7886505, 5.343155, 1, 1, 1, 1, 1,
0.0861233, 1.756459, -0.9566683, 1, 1, 1, 1, 1,
0.09177683, 1.717442, -0.7983571, 1, 1, 1, 1, 1,
0.09339963, -1.237774, 3.23537, 1, 1, 1, 1, 1,
0.09597394, 1.198168, -0.6532739, 1, 1, 1, 1, 1,
0.09757499, 1.038041, -1.394042, 1, 1, 1, 1, 1,
0.09963529, 0.8584529, -1.31596, 1, 1, 1, 1, 1,
0.1027602, -0.2250051, 2.791577, 1, 1, 1, 1, 1,
0.1045633, -0.314268, 2.102885, 1, 1, 1, 1, 1,
0.1050584, 0.09543593, 1.946469, 1, 1, 1, 1, 1,
0.1069488, -1.588449, 1.90876, 1, 1, 1, 1, 1,
0.1091416, -0.1852805, 2.175272, 1, 1, 1, 1, 1,
0.1099494, 1.539144, 0.4225764, 1, 1, 1, 1, 1,
0.1125497, -1.754052, 2.260643, 1, 1, 1, 1, 1,
0.1147119, 0.02447343, -0.04316372, 0, 0, 1, 1, 1,
0.1157304, -0.3551951, 3.299911, 1, 0, 0, 1, 1,
0.116398, -0.7643675, 3.339105, 1, 0, 0, 1, 1,
0.1178186, 0.9100793, 0.6989187, 1, 0, 0, 1, 1,
0.1197583, -1.18621, 1.891691, 1, 0, 0, 1, 1,
0.1229299, 0.812609, -1.275268, 1, 0, 0, 1, 1,
0.1265218, -0.1967095, 4.338334, 0, 0, 0, 1, 1,
0.1277096, -0.6054521, 1.685332, 0, 0, 0, 1, 1,
0.1309877, 0.3610239, 1.184757, 0, 0, 0, 1, 1,
0.1341614, 1.084637, 0.1497054, 0, 0, 0, 1, 1,
0.1352073, -0.1569239, 2.049154, 0, 0, 0, 1, 1,
0.1352824, 0.6758604, -1.483545, 0, 0, 0, 1, 1,
0.1375058, -0.5527663, 3.299693, 0, 0, 0, 1, 1,
0.137727, -1.134001, 3.322242, 1, 1, 1, 1, 1,
0.1394356, -0.3151293, 3.468259, 1, 1, 1, 1, 1,
0.1400287, 0.2232322, -0.6037815, 1, 1, 1, 1, 1,
0.1448573, 0.2266503, 1.651815, 1, 1, 1, 1, 1,
0.1464202, -0.6992989, 2.063787, 1, 1, 1, 1, 1,
0.1464814, -0.306504, 0.7763603, 1, 1, 1, 1, 1,
0.1469156, -1.83625, 1.649959, 1, 1, 1, 1, 1,
0.154101, 0.02189866, 2.19585, 1, 1, 1, 1, 1,
0.1554133, 1.439916, 0.1861331, 1, 1, 1, 1, 1,
0.1606479, -0.5954993, 3.891739, 1, 1, 1, 1, 1,
0.1636834, -1.38456, 3.394081, 1, 1, 1, 1, 1,
0.1645532, -1.015582, 3.878292, 1, 1, 1, 1, 1,
0.1647877, 0.929871, 1.459106, 1, 1, 1, 1, 1,
0.1654075, 1.499619, 0.2995617, 1, 1, 1, 1, 1,
0.1663788, -0.5352741, 3.504302, 1, 1, 1, 1, 1,
0.1668334, 0.5183799, 1.452228, 0, 0, 1, 1, 1,
0.1707248, 0.03094584, 1.208838, 1, 0, 0, 1, 1,
0.1717957, 0.4352365, -0.5701449, 1, 0, 0, 1, 1,
0.1725644, -0.372288, 1.910831, 1, 0, 0, 1, 1,
0.1747054, 0.4419994, -1.023568, 1, 0, 0, 1, 1,
0.1747878, 1.478936, 1.757163, 1, 0, 0, 1, 1,
0.1754166, -0.4109789, 2.505111, 0, 0, 0, 1, 1,
0.1832631, 0.03785278, 0.3814093, 0, 0, 0, 1, 1,
0.1869633, -0.2841893, 3.581552, 0, 0, 0, 1, 1,
0.1893317, -0.5069622, 2.854387, 0, 0, 0, 1, 1,
0.190856, -0.867649, 2.002569, 0, 0, 0, 1, 1,
0.1915524, 1.016301, -2.259069, 0, 0, 0, 1, 1,
0.1921394, -0.5460407, 1.879207, 0, 0, 0, 1, 1,
0.192375, 0.303261, -0.1352833, 1, 1, 1, 1, 1,
0.1948064, 0.7918681, 0.5740076, 1, 1, 1, 1, 1,
0.1949047, -0.3722446, 4.149483, 1, 1, 1, 1, 1,
0.1954292, 0.177469, 2.096955, 1, 1, 1, 1, 1,
0.195667, -0.09943388, 2.725989, 1, 1, 1, 1, 1,
0.1966289, -1.007734, 3.679039, 1, 1, 1, 1, 1,
0.1993487, -0.6992021, 3.040957, 1, 1, 1, 1, 1,
0.2078218, 0.4119683, 1.319553, 1, 1, 1, 1, 1,
0.2113301, -0.6320713, 3.172311, 1, 1, 1, 1, 1,
0.2157166, 1.586994, 0.9002703, 1, 1, 1, 1, 1,
0.2173761, 0.5893822, 1.544423, 1, 1, 1, 1, 1,
0.2233259, -0.05063372, 3.954178, 1, 1, 1, 1, 1,
0.2239943, 1.368332, 0.327133, 1, 1, 1, 1, 1,
0.2295371, 0.9806448, -0.02410555, 1, 1, 1, 1, 1,
0.2297726, -0.5926834, 3.209228, 1, 1, 1, 1, 1,
0.23088, 1.053496, -0.1952733, 0, 0, 1, 1, 1,
0.2363444, 0.9190819, -0.5009019, 1, 0, 0, 1, 1,
0.2373927, 0.1424455, 0.2814308, 1, 0, 0, 1, 1,
0.2395741, -1.140483, 2.060399, 1, 0, 0, 1, 1,
0.2400093, -0.9626138, 2.455143, 1, 0, 0, 1, 1,
0.2412602, 0.6851649, 1.06554, 1, 0, 0, 1, 1,
0.2414876, 0.6276305, -0.09716769, 0, 0, 0, 1, 1,
0.2441461, -0.6470152, 2.541621, 0, 0, 0, 1, 1,
0.2462237, 0.04508405, 0.5765613, 0, 0, 0, 1, 1,
0.2474327, -1.966797, 2.10184, 0, 0, 0, 1, 1,
0.2562257, 0.006718337, 1.989274, 0, 0, 0, 1, 1,
0.2582272, 2.336619, -1.038097, 0, 0, 0, 1, 1,
0.2585013, 0.3961404, -0.2829992, 0, 0, 0, 1, 1,
0.2609853, -2.052728, 2.845272, 1, 1, 1, 1, 1,
0.263625, 2.385886, 0.6372051, 1, 1, 1, 1, 1,
0.2669655, 0.6038921, -0.1600177, 1, 1, 1, 1, 1,
0.2709551, 0.9588291, -0.2462774, 1, 1, 1, 1, 1,
0.2753657, 0.6457458, -0.357049, 1, 1, 1, 1, 1,
0.2754225, -1.736792, 3.066053, 1, 1, 1, 1, 1,
0.2784249, -0.4089778, 2.864993, 1, 1, 1, 1, 1,
0.2806066, -0.8641863, 2.435149, 1, 1, 1, 1, 1,
0.2813651, 0.04729528, 1.171935, 1, 1, 1, 1, 1,
0.2815897, 0.322996, 1.767102, 1, 1, 1, 1, 1,
0.2830863, 1.280173, -1.421365, 1, 1, 1, 1, 1,
0.283092, -0.5850238, 1.357481, 1, 1, 1, 1, 1,
0.2858148, -1.033138, 4.67441, 1, 1, 1, 1, 1,
0.287175, -0.3922207, 3.040834, 1, 1, 1, 1, 1,
0.2876485, 1.40464, 0.2819292, 1, 1, 1, 1, 1,
0.2929431, -2.326318, 2.199695, 0, 0, 1, 1, 1,
0.2982403, -1.057409, 1.529282, 1, 0, 0, 1, 1,
0.3065324, 1.143269, 1.075915, 1, 0, 0, 1, 1,
0.3086215, -0.07014336, 0.774621, 1, 0, 0, 1, 1,
0.3116503, -0.5858632, 2.080679, 1, 0, 0, 1, 1,
0.3116943, 0.1774585, 1.146789, 1, 0, 0, 1, 1,
0.3209066, -0.6402633, 1.086343, 0, 0, 0, 1, 1,
0.323034, -0.1572909, 1.381452, 0, 0, 0, 1, 1,
0.3289626, -0.4588741, 3.608752, 0, 0, 0, 1, 1,
0.3315877, -0.1595386, 2.075069, 0, 0, 0, 1, 1,
0.3317811, 0.6752011, 0.5879846, 0, 0, 0, 1, 1,
0.332016, 1.011771, -0.80514, 0, 0, 0, 1, 1,
0.3322808, 0.08879651, 0.7648284, 0, 0, 0, 1, 1,
0.3358139, 0.871819, 0.1821373, 1, 1, 1, 1, 1,
0.3362207, -0.6577867, 2.600971, 1, 1, 1, 1, 1,
0.3418244, 0.8956866, 0.06517281, 1, 1, 1, 1, 1,
0.3421516, -0.1306456, 2.038963, 1, 1, 1, 1, 1,
0.3423167, -1.361062, 3.85123, 1, 1, 1, 1, 1,
0.3435155, 0.3188531, 2.583897, 1, 1, 1, 1, 1,
0.3454218, -1.156273, 4.173444, 1, 1, 1, 1, 1,
0.3470532, 1.728885, -0.6347693, 1, 1, 1, 1, 1,
0.3477803, 0.5811658, 0.3887853, 1, 1, 1, 1, 1,
0.3495413, -0.9863816, 4.019434, 1, 1, 1, 1, 1,
0.3511978, -0.5298828, 2.068905, 1, 1, 1, 1, 1,
0.3571217, 0.3719915, -0.5026887, 1, 1, 1, 1, 1,
0.3587805, -0.1268286, 1.958836, 1, 1, 1, 1, 1,
0.3661879, 0.7049139, -0.05129674, 1, 1, 1, 1, 1,
0.3671628, -0.6850603, 0.5400671, 1, 1, 1, 1, 1,
0.3698328, -1.450222, 3.983369, 0, 0, 1, 1, 1,
0.3703171, 2.056352, -2.073787, 1, 0, 0, 1, 1,
0.3755365, -0.7098007, 2.212566, 1, 0, 0, 1, 1,
0.3827635, 0.4998056, 0.8882415, 1, 0, 0, 1, 1,
0.3868167, 0.6256645, -0.02056835, 1, 0, 0, 1, 1,
0.3943118, 1.185962, 2.133827, 1, 0, 0, 1, 1,
0.3981322, -0.4179256, 2.27459, 0, 0, 0, 1, 1,
0.3997204, -0.003737429, 1.821236, 0, 0, 0, 1, 1,
0.4021959, 0.6010584, 1.05944, 0, 0, 0, 1, 1,
0.4047887, 0.4514084, 1.70322, 0, 0, 0, 1, 1,
0.4071851, -0.5900335, 1.134196, 0, 0, 0, 1, 1,
0.4072178, 0.8122827, -0.3739063, 0, 0, 0, 1, 1,
0.4081351, -0.07629018, 1.922379, 0, 0, 0, 1, 1,
0.409952, 0.4825467, 0.09248985, 1, 1, 1, 1, 1,
0.4101258, -2.518885, 3.465772, 1, 1, 1, 1, 1,
0.4191327, -1.196804, 3.359418, 1, 1, 1, 1, 1,
0.419382, 0.1259121, 0.6959999, 1, 1, 1, 1, 1,
0.4219554, 0.152952, 1.581391, 1, 1, 1, 1, 1,
0.4242019, 0.4398311, 0.9739013, 1, 1, 1, 1, 1,
0.4272353, 0.4259793, 2.05862, 1, 1, 1, 1, 1,
0.4299395, -1.352068, 2.802198, 1, 1, 1, 1, 1,
0.4301993, 1.062775, 1.244865, 1, 1, 1, 1, 1,
0.4356059, 0.06405804, -0.1665671, 1, 1, 1, 1, 1,
0.4388734, 2.091872, -0.3522898, 1, 1, 1, 1, 1,
0.4418218, -0.8863309, 2.860479, 1, 1, 1, 1, 1,
0.4440949, 0.1996648, 2.112397, 1, 1, 1, 1, 1,
0.4448584, 0.6185588, 0.8000919, 1, 1, 1, 1, 1,
0.448881, -0.9077867, 1.583546, 1, 1, 1, 1, 1,
0.450855, 1.596812, 1.572721, 0, 0, 1, 1, 1,
0.4527223, -0.4796012, 2.079175, 1, 0, 0, 1, 1,
0.4561849, -0.681371, 2.39458, 1, 0, 0, 1, 1,
0.4659535, -0.5160553, 3.21501, 1, 0, 0, 1, 1,
0.4739225, 1.011154, -2.048661, 1, 0, 0, 1, 1,
0.4784112, 0.1926097, 1.366093, 1, 0, 0, 1, 1,
0.4797061, -0.6704352, 2.110445, 0, 0, 0, 1, 1,
0.4797166, 0.7912322, 0.8176287, 0, 0, 0, 1, 1,
0.480996, -0.2650173, 1.653704, 0, 0, 0, 1, 1,
0.49241, 0.03161796, 0.8532217, 0, 0, 0, 1, 1,
0.4938887, 0.2088692, 0.9402429, 0, 0, 0, 1, 1,
0.4942473, 0.5388888, 1.676476, 0, 0, 0, 1, 1,
0.4953752, -0.2080086, 0.6692119, 0, 0, 0, 1, 1,
0.4994541, -1.126497, 2.537338, 1, 1, 1, 1, 1,
0.5010682, 1.05935, -0.5618743, 1, 1, 1, 1, 1,
0.5049279, 1.603097, 1.686032, 1, 1, 1, 1, 1,
0.505933, 1.773119, 0.3215842, 1, 1, 1, 1, 1,
0.5062598, 1.399151, 2.09367, 1, 1, 1, 1, 1,
0.5085359, 1.626255, 0.07634249, 1, 1, 1, 1, 1,
0.5105723, -1.449428, 2.428587, 1, 1, 1, 1, 1,
0.5129193, 0.09841546, -0.499198, 1, 1, 1, 1, 1,
0.5138852, 0.8107346, 0.3396052, 1, 1, 1, 1, 1,
0.5153998, -0.1542883, 1.19511, 1, 1, 1, 1, 1,
0.516962, -1.756776, 1.545882, 1, 1, 1, 1, 1,
0.5204947, -1.366159, 3.120983, 1, 1, 1, 1, 1,
0.5218444, 1.475976, 1.054016, 1, 1, 1, 1, 1,
0.5220484, -0.2645734, 1.777017, 1, 1, 1, 1, 1,
0.5229496, 0.7146486, 0.9313891, 1, 1, 1, 1, 1,
0.5237932, 1.228265, -0.2263965, 0, 0, 1, 1, 1,
0.525882, 0.4621089, 0.203625, 1, 0, 0, 1, 1,
0.5262284, 0.5225736, 2.123741, 1, 0, 0, 1, 1,
0.5298006, 0.6880879, 0.4822213, 1, 0, 0, 1, 1,
0.5354817, -1.187989, 1.509072, 1, 0, 0, 1, 1,
0.5369151, -1.386435, 2.098454, 1, 0, 0, 1, 1,
0.5395603, 1.248442, 0.7799259, 0, 0, 0, 1, 1,
0.543092, -1.268203, 3.482643, 0, 0, 0, 1, 1,
0.5513754, 2.483424, -0.8904679, 0, 0, 0, 1, 1,
0.5559144, 0.07463943, 1.655938, 0, 0, 0, 1, 1,
0.5562049, -0.9468544, 2.721337, 0, 0, 0, 1, 1,
0.5641812, 1.846618, 1.564339, 0, 0, 0, 1, 1,
0.5657789, 0.5541212, 1.67822, 0, 0, 0, 1, 1,
0.5686831, 1.844265, -0.459434, 1, 1, 1, 1, 1,
0.5722409, -0.5254871, 2.920386, 1, 1, 1, 1, 1,
0.5724348, -0.3517096, 2.970967, 1, 1, 1, 1, 1,
0.5724955, -0.6303287, 2.389123, 1, 1, 1, 1, 1,
0.5737569, -1.010068, -0.08601657, 1, 1, 1, 1, 1,
0.5825838, 0.2126632, 0.8338966, 1, 1, 1, 1, 1,
0.5845079, -0.4843695, 2.229844, 1, 1, 1, 1, 1,
0.5946142, -1.108582, 2.301317, 1, 1, 1, 1, 1,
0.6005388, 0.8953819, -0.9469639, 1, 1, 1, 1, 1,
0.601517, 0.3855561, -0.5314382, 1, 1, 1, 1, 1,
0.6017176, -0.9920644, 4.869237, 1, 1, 1, 1, 1,
0.6039338, -0.5496444, 0.2415633, 1, 1, 1, 1, 1,
0.6046958, -0.4171102, 3.076343, 1, 1, 1, 1, 1,
0.6079628, 0.3867634, 1.156341, 1, 1, 1, 1, 1,
0.6109265, -0.7476388, 1.884511, 1, 1, 1, 1, 1,
0.6122767, -0.1345711, 0.9990537, 0, 0, 1, 1, 1,
0.6138451, -0.2532178, 2.215216, 1, 0, 0, 1, 1,
0.6192348, 1.528214, 0.2607826, 1, 0, 0, 1, 1,
0.6204943, 1.86273, 3.421124, 1, 0, 0, 1, 1,
0.627764, 0.6935968, 0.5924809, 1, 0, 0, 1, 1,
0.6282352, 0.7620599, 1.053454, 1, 0, 0, 1, 1,
0.6284559, -1.975639, 3.215082, 0, 0, 0, 1, 1,
0.629625, 0.8243306, 1.412489, 0, 0, 0, 1, 1,
0.6299586, -0.999143, 1.876576, 0, 0, 0, 1, 1,
0.6332583, 0.004607941, 1.136946, 0, 0, 0, 1, 1,
0.636933, -1.110339, 2.35541, 0, 0, 0, 1, 1,
0.6383916, -0.609018, 1.736739, 0, 0, 0, 1, 1,
0.6388955, 1.908106, 1.813185, 0, 0, 0, 1, 1,
0.6399211, -0.4660811, 2.128633, 1, 1, 1, 1, 1,
0.6423666, -0.1146886, 1.878351, 1, 1, 1, 1, 1,
0.6485793, -0.6433663, 0.5467167, 1, 1, 1, 1, 1,
0.6508874, -0.6186844, 1.780615, 1, 1, 1, 1, 1,
0.6599978, 1.165612, -0.4935565, 1, 1, 1, 1, 1,
0.6610694, -0.04860524, 3.226764, 1, 1, 1, 1, 1,
0.6629786, -1.521395, 3.972736, 1, 1, 1, 1, 1,
0.6660745, -0.6522813, 4.907218, 1, 1, 1, 1, 1,
0.6668965, -0.5943434, 2.033504, 1, 1, 1, 1, 1,
0.675874, -0.3989142, 2.473033, 1, 1, 1, 1, 1,
0.6841229, 1.842061, 0.2587605, 1, 1, 1, 1, 1,
0.6858557, 1.754515, 0.7307132, 1, 1, 1, 1, 1,
0.689484, -0.8766733, 2.966346, 1, 1, 1, 1, 1,
0.6896012, 1.017381, 1.352862, 1, 1, 1, 1, 1,
0.6936458, 0.7923479, -0.3045629, 1, 1, 1, 1, 1,
0.70096, -0.6813384, 1.495301, 0, 0, 1, 1, 1,
0.7115563, -1.632685, 1.494896, 1, 0, 0, 1, 1,
0.7139453, -1.289982, 3.091225, 1, 0, 0, 1, 1,
0.7140191, 0.9104226, 1.720052, 1, 0, 0, 1, 1,
0.7149979, -0.2707861, 1.461448, 1, 0, 0, 1, 1,
0.7151986, -0.07471308, 3.800797, 1, 0, 0, 1, 1,
0.7198023, 0.2117027, 1.151201, 0, 0, 0, 1, 1,
0.7207707, 0.882367, 1.781314, 0, 0, 0, 1, 1,
0.7241632, 0.559105, -0.03501948, 0, 0, 0, 1, 1,
0.7252599, -0.2746773, 2.383338, 0, 0, 0, 1, 1,
0.7393075, -0.2111135, 0.4815411, 0, 0, 0, 1, 1,
0.7403604, 1.042778, -1.493037, 0, 0, 0, 1, 1,
0.7422478, -0.3763003, 2.293258, 0, 0, 0, 1, 1,
0.7496886, -0.1243816, 0.7259821, 1, 1, 1, 1, 1,
0.7527519, 0.8042417, 2.043111, 1, 1, 1, 1, 1,
0.7538788, -0.9649019, 4.674565, 1, 1, 1, 1, 1,
0.7574851, -0.21858, 2.755253, 1, 1, 1, 1, 1,
0.7586362, -1.501008, 2.689714, 1, 1, 1, 1, 1,
0.765043, -1.60011, 2.864626, 1, 1, 1, 1, 1,
0.7655196, 1.708168, 2.287039, 1, 1, 1, 1, 1,
0.7660151, -0.9840593, 0.3213945, 1, 1, 1, 1, 1,
0.7696591, 0.06006333, 1.173945, 1, 1, 1, 1, 1,
0.7737741, -0.5822544, 0.4741833, 1, 1, 1, 1, 1,
0.7750773, 0.7431592, 2.655129, 1, 1, 1, 1, 1,
0.7774447, -0.4339795, 0.9687747, 1, 1, 1, 1, 1,
0.7783602, 0.2526255, 0.6364455, 1, 1, 1, 1, 1,
0.7823191, -1.378657, 2.964466, 1, 1, 1, 1, 1,
0.7833604, 0.6979364, 2.185643, 1, 1, 1, 1, 1,
0.7860352, -0.2025202, 0.1151591, 0, 0, 1, 1, 1,
0.7924801, -2.109801, 3.155913, 1, 0, 0, 1, 1,
0.7939933, -0.2153255, 1.086584, 1, 0, 0, 1, 1,
0.7957583, 0.174959, 1.397292, 1, 0, 0, 1, 1,
0.7965434, 0.06547669, 2.435985, 1, 0, 0, 1, 1,
0.7982562, 0.5366621, 0.7702157, 1, 0, 0, 1, 1,
0.8018749, -0.4156747, 3.029714, 0, 0, 0, 1, 1,
0.8074529, 0.3853334, 1.552973, 0, 0, 0, 1, 1,
0.8095003, 0.2941156, 2.655419, 0, 0, 0, 1, 1,
0.8102288, 0.1909133, 2.482246, 0, 0, 0, 1, 1,
0.8131286, -0.3512523, 1.989519, 0, 0, 0, 1, 1,
0.8210094, -0.5097373, 0.277384, 0, 0, 0, 1, 1,
0.8212736, -0.3290526, 2.052642, 0, 0, 0, 1, 1,
0.8252468, 0.2030479, 0.8638235, 1, 1, 1, 1, 1,
0.8266041, -1.552243, 2.948362, 1, 1, 1, 1, 1,
0.8335243, -0.3750426, 0.9387122, 1, 1, 1, 1, 1,
0.8392025, 0.1539267, 0.8532607, 1, 1, 1, 1, 1,
0.8419892, 1.100757, 0.7270029, 1, 1, 1, 1, 1,
0.8455757, 1.70596, 1.020523, 1, 1, 1, 1, 1,
0.8497103, -1.353925, 1.688554, 1, 1, 1, 1, 1,
0.8511882, 0.234797, 1.762141, 1, 1, 1, 1, 1,
0.8590651, 0.5051008, 1.464255, 1, 1, 1, 1, 1,
0.8636279, 0.1731029, 1.133088, 1, 1, 1, 1, 1,
0.8719372, -1.016997, 2.435126, 1, 1, 1, 1, 1,
0.8735181, 0.3422646, 0.2271903, 1, 1, 1, 1, 1,
0.873585, -0.9072983, 3.381533, 1, 1, 1, 1, 1,
0.8742589, -0.2120806, 2.477451, 1, 1, 1, 1, 1,
0.8746344, 0.3194994, 0.1575346, 1, 1, 1, 1, 1,
0.875028, 0.3915742, 0.3658809, 0, 0, 1, 1, 1,
0.8764851, -0.5147883, 0.760781, 1, 0, 0, 1, 1,
0.8787179, 0.6853797, 3.030584, 1, 0, 0, 1, 1,
0.8881823, 0.6960589, 1.71578, 1, 0, 0, 1, 1,
0.8936901, -0.05449314, 2.472133, 1, 0, 0, 1, 1,
0.8986271, -0.3274431, 2.981676, 1, 0, 0, 1, 1,
0.9060531, -0.1021637, 1.461883, 0, 0, 0, 1, 1,
0.9069083, 0.4995184, -0.7260292, 0, 0, 0, 1, 1,
0.9192042, -0.5493436, 1.7649, 0, 0, 0, 1, 1,
0.9226111, -0.7560458, 2.882941, 0, 0, 0, 1, 1,
0.9419214, -0.3058395, 0.01722234, 0, 0, 0, 1, 1,
0.9459575, -1.735391, 3.917497, 0, 0, 0, 1, 1,
0.9507879, -1.777058, 2.679387, 0, 0, 0, 1, 1,
0.9554024, -1.243656, 2.611524, 1, 1, 1, 1, 1,
0.9565884, 0.3747078, 2.309356, 1, 1, 1, 1, 1,
0.9566844, -1.102727, 0.7146174, 1, 1, 1, 1, 1,
0.9571542, -1.876041, 3.274322, 1, 1, 1, 1, 1,
0.961514, 0.2227568, 1.947729, 1, 1, 1, 1, 1,
0.9616044, 0.3355605, 1.102215, 1, 1, 1, 1, 1,
0.9708427, 1.061205, 1.216809, 1, 1, 1, 1, 1,
0.9779733, -1.160415, 2.914973, 1, 1, 1, 1, 1,
0.9781863, -0.7529098, 1.906906, 1, 1, 1, 1, 1,
0.9789816, 0.2836843, 0.6775191, 1, 1, 1, 1, 1,
0.9878635, 0.6715481, 0.156829, 1, 1, 1, 1, 1,
0.9883879, -0.01636703, 0.224369, 1, 1, 1, 1, 1,
0.9895817, 0.9712179, -0.1907669, 1, 1, 1, 1, 1,
0.9900979, -0.4196388, -0.3734454, 1, 1, 1, 1, 1,
0.9932649, 0.3746941, 0.4128455, 1, 1, 1, 1, 1,
0.9952189, 0.8090597, 0.7946843, 0, 0, 1, 1, 1,
1.000858, 0.5499668, 1.976935, 1, 0, 0, 1, 1,
1.004838, 0.7769879, 1.041981, 1, 0, 0, 1, 1,
1.015382, 0.7196367, -0.6506832, 1, 0, 0, 1, 1,
1.021209, -0.435164, 3.474952, 1, 0, 0, 1, 1,
1.024341, 0.4331195, 1.446248, 1, 0, 0, 1, 1,
1.025099, 0.000317033, 1.58738, 0, 0, 0, 1, 1,
1.027044, 0.1394746, 0.5676278, 0, 0, 0, 1, 1,
1.027384, -0.1325115, 2.450571, 0, 0, 0, 1, 1,
1.027754, 2.368788, 0.1873219, 0, 0, 0, 1, 1,
1.038274, 2.300207, -0.5736669, 0, 0, 0, 1, 1,
1.039643, 0.4402769, 1.848382, 0, 0, 0, 1, 1,
1.047657, -0.09960952, 0.8127779, 0, 0, 0, 1, 1,
1.057908, 0.4697164, 1.829604, 1, 1, 1, 1, 1,
1.062805, 0.2940612, -0.01609196, 1, 1, 1, 1, 1,
1.069288, -1.19268, 5.551687, 1, 1, 1, 1, 1,
1.069361, 1.712161, 1.046943, 1, 1, 1, 1, 1,
1.079453, 1.019199, 1.307454, 1, 1, 1, 1, 1,
1.084514, 1.636993, -0.5500715, 1, 1, 1, 1, 1,
1.08719, -0.2486259, 3.075811, 1, 1, 1, 1, 1,
1.091788, 1.768563, -0.8339797, 1, 1, 1, 1, 1,
1.097645, 0.1263292, 0.3665422, 1, 1, 1, 1, 1,
1.098398, -0.2787782, 0.3925658, 1, 1, 1, 1, 1,
1.099216, 1.109519, 2.281713, 1, 1, 1, 1, 1,
1.102237, -0.4353725, 0.5507088, 1, 1, 1, 1, 1,
1.10324, 0.4132569, 3.039702, 1, 1, 1, 1, 1,
1.108871, 0.4000108, 0.7917573, 1, 1, 1, 1, 1,
1.109946, -0.5247222, 1.586304, 1, 1, 1, 1, 1,
1.116463, -1.68555, 3.708681, 0, 0, 1, 1, 1,
1.119627, -1.20152, 2.117207, 1, 0, 0, 1, 1,
1.120893, -0.1800091, 1.724667, 1, 0, 0, 1, 1,
1.122136, 0.4025278, 0.6282814, 1, 0, 0, 1, 1,
1.122147, -0.1243914, 0.7792187, 1, 0, 0, 1, 1,
1.143257, -0.6391347, 2.036839, 1, 0, 0, 1, 1,
1.16628, -0.4947137, 1.131723, 0, 0, 0, 1, 1,
1.168153, 0.8228934, 0.5099746, 0, 0, 0, 1, 1,
1.170311, 2.977043, -0.5032968, 0, 0, 0, 1, 1,
1.173354, 0.5140617, 1.360268, 0, 0, 0, 1, 1,
1.179241, -1.612356, 0.6181496, 0, 0, 0, 1, 1,
1.184758, 1.068512, 3.328471, 0, 0, 0, 1, 1,
1.197095, 0.6657254, 2.404355, 0, 0, 0, 1, 1,
1.19864, 0.5489829, 0.491236, 1, 1, 1, 1, 1,
1.199013, 0.04628372, 1.995603, 1, 1, 1, 1, 1,
1.199185, -0.02197001, 1.905148, 1, 1, 1, 1, 1,
1.21107, 1.59726, 1.531427, 1, 1, 1, 1, 1,
1.212372, 0.3832574, 1.681011, 1, 1, 1, 1, 1,
1.219563, -0.3000088, 2.470919, 1, 1, 1, 1, 1,
1.223195, -0.5666583, 2.467895, 1, 1, 1, 1, 1,
1.226941, -0.9310986, 3.765418, 1, 1, 1, 1, 1,
1.229374, 1.927099, 0.9970469, 1, 1, 1, 1, 1,
1.235815, -0.02151125, 1.237103, 1, 1, 1, 1, 1,
1.25072, -0.7036674, 2.526505, 1, 1, 1, 1, 1,
1.253382, 0.5665222, 2.130723, 1, 1, 1, 1, 1,
1.256671, -0.9698687, 1.568273, 1, 1, 1, 1, 1,
1.256803, -1.361246, 2.382105, 1, 1, 1, 1, 1,
1.257772, -0.1812638, 1.283872, 1, 1, 1, 1, 1,
1.259172, 0.5735388, -0.1910562, 0, 0, 1, 1, 1,
1.260687, 0.5560435, 2.19557, 1, 0, 0, 1, 1,
1.264369, 0.2097143, 2.361414, 1, 0, 0, 1, 1,
1.272071, -0.248491, 2.234448, 1, 0, 0, 1, 1,
1.285833, 2.560075, 0.5733175, 1, 0, 0, 1, 1,
1.294019, 2.612072, -0.5767354, 1, 0, 0, 1, 1,
1.294529, -0.1082446, 2.714061, 0, 0, 0, 1, 1,
1.306031, 0.1361628, 1.194432, 0, 0, 0, 1, 1,
1.307496, 1.645212, 0.120749, 0, 0, 0, 1, 1,
1.315168, 0.04026828, 1.397848, 0, 0, 0, 1, 1,
1.325229, 2.941843, 1.677896, 0, 0, 0, 1, 1,
1.325852, 1.92353, 0.701847, 0, 0, 0, 1, 1,
1.354412, -0.2377392, 2.26943, 0, 0, 0, 1, 1,
1.354467, 3.364787, 1.015649, 1, 1, 1, 1, 1,
1.361606, -1.472067, 3.300054, 1, 1, 1, 1, 1,
1.371243, -0.4048584, 1.830516, 1, 1, 1, 1, 1,
1.374308, 0.3748332, 2.104957, 1, 1, 1, 1, 1,
1.375494, -0.3230897, 0.7328917, 1, 1, 1, 1, 1,
1.381359, -0.4699954, 2.072988, 1, 1, 1, 1, 1,
1.383878, -0.4538141, -0.4842989, 1, 1, 1, 1, 1,
1.397437, -0.8659036, 2.344569, 1, 1, 1, 1, 1,
1.400572, 0.1877943, 2.365852, 1, 1, 1, 1, 1,
1.402931, -0.104123, 2.276281, 1, 1, 1, 1, 1,
1.417549, 1.230738, -1.288471, 1, 1, 1, 1, 1,
1.419893, 0.4778025, 2.011671, 1, 1, 1, 1, 1,
1.42982, -0.9859693, 2.506558, 1, 1, 1, 1, 1,
1.429871, 0.8137521, 1.344367, 1, 1, 1, 1, 1,
1.438016, 0.2928083, 0.04762825, 1, 1, 1, 1, 1,
1.477545, -0.7261705, 1.519312, 0, 0, 1, 1, 1,
1.479257, 0.7176189, 0.6342468, 1, 0, 0, 1, 1,
1.487047, -0.9002275, 2.649155, 1, 0, 0, 1, 1,
1.50127, 0.136477, 1.220487, 1, 0, 0, 1, 1,
1.504878, 1.474632, 0.1903636, 1, 0, 0, 1, 1,
1.505158, -0.3316309, -0.4221354, 1, 0, 0, 1, 1,
1.513928, 1.524382, 1.366267, 0, 0, 0, 1, 1,
1.516021, 1.221771, 1.111566, 0, 0, 0, 1, 1,
1.536888, -0.8894951, 2.064703, 0, 0, 0, 1, 1,
1.556789, 1.352937, 1.529419, 0, 0, 0, 1, 1,
1.576616, 0.3101794, 2.460075, 0, 0, 0, 1, 1,
1.581777, -0.5716918, 0.909818, 0, 0, 0, 1, 1,
1.594715, 0.3665183, -0.3388198, 0, 0, 0, 1, 1,
1.615727, -1.813177, 1.815762, 1, 1, 1, 1, 1,
1.61786, -1.495814, 3.796209, 1, 1, 1, 1, 1,
1.625983, 1.522335, 0.3494634, 1, 1, 1, 1, 1,
1.626466, -0.05433635, 0.3349905, 1, 1, 1, 1, 1,
1.627982, 1.20825, 1.188738, 1, 1, 1, 1, 1,
1.631268, 1.059944, 2.196319, 1, 1, 1, 1, 1,
1.635708, -1.083254, 1.755959, 1, 1, 1, 1, 1,
1.637621, 0.5681911, 1.732373, 1, 1, 1, 1, 1,
1.638504, -1.013714, 2.510141, 1, 1, 1, 1, 1,
1.679371, -1.134568, 3.035515, 1, 1, 1, 1, 1,
1.679476, 2.15924, 1.852993, 1, 1, 1, 1, 1,
1.682146, -1.980274, 4.312742, 1, 1, 1, 1, 1,
1.682728, -0.7505885, 3.428975, 1, 1, 1, 1, 1,
1.686249, 0.5549843, 1.362888, 1, 1, 1, 1, 1,
1.718385, 0.4847207, 2.640899, 1, 1, 1, 1, 1,
1.721135, 0.6792477, -0.3752641, 0, 0, 1, 1, 1,
1.74028, -1.383601, 2.355067, 1, 0, 0, 1, 1,
1.741579, -0.3388418, 2.544019, 1, 0, 0, 1, 1,
1.746381, 0.8800907, 2.797019, 1, 0, 0, 1, 1,
1.758445, 0.2375387, 0.2712262, 1, 0, 0, 1, 1,
1.774993, 2.334337, 0.08247945, 1, 0, 0, 1, 1,
1.780428, 0.4690382, 1.129176, 0, 0, 0, 1, 1,
1.783974, -1.138989, 1.894378, 0, 0, 0, 1, 1,
1.818073, 0.352313, 1.937212, 0, 0, 0, 1, 1,
1.83507, -3.064996, 2.064891, 0, 0, 0, 1, 1,
1.845816, -0.9155234, 4.245744, 0, 0, 0, 1, 1,
1.8975, -0.7239671, 2.910798, 0, 0, 0, 1, 1,
1.897826, -0.1568477, -0.5291498, 0, 0, 0, 1, 1,
1.902898, -0.294888, 1.996225, 1, 1, 1, 1, 1,
1.91175, -0.05316006, 2.680928, 1, 1, 1, 1, 1,
1.944029, -0.4177825, 3.015579, 1, 1, 1, 1, 1,
1.976907, 0.03486531, 0.8019705, 1, 1, 1, 1, 1,
1.987759, 1.05227, -0.4268576, 1, 1, 1, 1, 1,
1.995669, 0.8610467, -0.7300205, 1, 1, 1, 1, 1,
2.000819, -0.8750975, 1.659202, 1, 1, 1, 1, 1,
2.017146, -0.6935742, 2.368191, 1, 1, 1, 1, 1,
2.042598, 2.059299, 0.07698733, 1, 1, 1, 1, 1,
2.057851, -0.1534602, 2.98405, 1, 1, 1, 1, 1,
2.106075, -0.8152726, 2.118161, 1, 1, 1, 1, 1,
2.10789, 0.07131744, 1.388346, 1, 1, 1, 1, 1,
2.110975, -1.472241, 3.789163, 1, 1, 1, 1, 1,
2.12623, -1.203251, 2.346901, 1, 1, 1, 1, 1,
2.127963, -0.009419176, 0.1626297, 1, 1, 1, 1, 1,
2.142693, 0.6095955, -0.197782, 0, 0, 1, 1, 1,
2.145197, 1.680064, 1.104944, 1, 0, 0, 1, 1,
2.154074, -0.3565989, 1.623254, 1, 0, 0, 1, 1,
2.171095, -0.9741963, 1.911532, 1, 0, 0, 1, 1,
2.194506, -1.93194, 1.189783, 1, 0, 0, 1, 1,
2.225598, 0.1013157, 2.243438, 1, 0, 0, 1, 1,
2.261704, -1.065153, 1.109145, 0, 0, 0, 1, 1,
2.307119, -0.4573537, 2.441748, 0, 0, 0, 1, 1,
2.358096, 0.8295562, 2.809242, 0, 0, 0, 1, 1,
2.377664, 1.143822, 0.600341, 0, 0, 0, 1, 1,
2.384067, 0.5922113, 2.060015, 0, 0, 0, 1, 1,
2.435418, 0.3447086, 3.05239, 0, 0, 0, 1, 1,
2.483751, -0.327773, 1.823957, 0, 0, 0, 1, 1,
2.497035, -1.685411, 2.062847, 1, 1, 1, 1, 1,
2.499815, 0.7606294, 1.219464, 1, 1, 1, 1, 1,
2.509119, 0.1721415, 1.938685, 1, 1, 1, 1, 1,
2.803118, -0.7111086, 1.918509, 1, 1, 1, 1, 1,
2.817401, 0.6319181, 1.501354, 1, 1, 1, 1, 1,
3.190027, 1.041994, 0.2269799, 1, 1, 1, 1, 1,
4.267564, 0.2663686, 1.867509, 1, 1, 1, 1, 1
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
var radius = 9.985273;
var distance = 35.07285;
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
mvMatrix.translate( -0.7239439, 0.09284544, -0.07971501 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.07285);
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
