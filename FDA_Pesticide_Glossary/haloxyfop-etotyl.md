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
-3.308702, 0.4804843, -1.320832, 1, 0, 0, 1,
-3.165411, -1.675674, -2.488233, 1, 0.007843138, 0, 1,
-2.962661, 2.27794, 0.2606737, 1, 0.01176471, 0, 1,
-2.577806, -0.05347516, -2.580155, 1, 0.01960784, 0, 1,
-2.532039, -0.6911454, -2.392803, 1, 0.02352941, 0, 1,
-2.519015, -0.1746912, -1.5474, 1, 0.03137255, 0, 1,
-2.466583, 0.4248547, -1.824661, 1, 0.03529412, 0, 1,
-2.38518, -1.531389, -0.5290474, 1, 0.04313726, 0, 1,
-2.362655, -0.6011189, -2.451108, 1, 0.04705882, 0, 1,
-2.257048, 0.06906581, -1.354684, 1, 0.05490196, 0, 1,
-2.255162, 0.2049358, -2.056574, 1, 0.05882353, 0, 1,
-2.206868, -0.2078563, -1.100041, 1, 0.06666667, 0, 1,
-2.194178, 1.234806, -0.3082285, 1, 0.07058824, 0, 1,
-2.147763, 0.3312792, -1.873549, 1, 0.07843138, 0, 1,
-2.139134, 1.172839, -2.909148, 1, 0.08235294, 0, 1,
-2.040238, -1.392919, -1.863436, 1, 0.09019608, 0, 1,
-2.039428, -0.9043973, -1.304557, 1, 0.09411765, 0, 1,
-2.036167, -0.01408464, -1.198479, 1, 0.1019608, 0, 1,
-2.005118, -0.1979934, -1.309593, 1, 0.1098039, 0, 1,
-2.000088, 1.472901, -0.6197239, 1, 0.1137255, 0, 1,
-1.994578, -1.702758, -1.318923, 1, 0.1215686, 0, 1,
-1.949089, -0.9490144, -3.342178, 1, 0.1254902, 0, 1,
-1.932212, -0.6771274, -2.830788, 1, 0.1333333, 0, 1,
-1.9304, -1.15925, -2.289645, 1, 0.1372549, 0, 1,
-1.909903, 0.5440425, -0.4989347, 1, 0.145098, 0, 1,
-1.889743, 1.235906, 0.04678166, 1, 0.1490196, 0, 1,
-1.842126, 2.637756, -0.2130373, 1, 0.1568628, 0, 1,
-1.818767, 0.9770485, -1.324717, 1, 0.1607843, 0, 1,
-1.81631, 0.7589772, -2.097078, 1, 0.1686275, 0, 1,
-1.788623, -1.650674, -1.698853, 1, 0.172549, 0, 1,
-1.785228, 0.9299088, 0.2118338, 1, 0.1803922, 0, 1,
-1.770666, 0.1694802, -1.12338, 1, 0.1843137, 0, 1,
-1.76907, -0.3440251, -0.6165836, 1, 0.1921569, 0, 1,
-1.766656, -0.579804, -2.48714, 1, 0.1960784, 0, 1,
-1.764982, -0.2037955, -2.269048, 1, 0.2039216, 0, 1,
-1.764772, 1.742821, -0.2923936, 1, 0.2117647, 0, 1,
-1.74767, -0.815406, -3.486318, 1, 0.2156863, 0, 1,
-1.74567, 0.0930348, 0.06382569, 1, 0.2235294, 0, 1,
-1.74436, -0.1673986, -1.741572, 1, 0.227451, 0, 1,
-1.723593, 0.5140132, -1.014054, 1, 0.2352941, 0, 1,
-1.723216, 1.084564, -2.378693, 1, 0.2392157, 0, 1,
-1.721173, 0.1558716, -1.741085, 1, 0.2470588, 0, 1,
-1.717003, -1.836627, -1.517498, 1, 0.2509804, 0, 1,
-1.71248, -1.018343, -1.815518, 1, 0.2588235, 0, 1,
-1.702483, -0.4613501, -2.215899, 1, 0.2627451, 0, 1,
-1.700743, -0.583369, -0.9268105, 1, 0.2705882, 0, 1,
-1.679678, 0.9340329, -1.495197, 1, 0.2745098, 0, 1,
-1.676527, 0.5555922, -0.04939398, 1, 0.282353, 0, 1,
-1.672526, 1.253569, -0.6360742, 1, 0.2862745, 0, 1,
-1.662113, 0.02882062, -1.935508, 1, 0.2941177, 0, 1,
-1.658347, 1.065343, -1.813007, 1, 0.3019608, 0, 1,
-1.652834, 0.04599226, -1.483581, 1, 0.3058824, 0, 1,
-1.60638, 1.243669, -0.420571, 1, 0.3137255, 0, 1,
-1.584697, 1.611636, -2.886636, 1, 0.3176471, 0, 1,
-1.545098, -1.052712, -2.433261, 1, 0.3254902, 0, 1,
-1.53317, -0.29484, -2.1335, 1, 0.3294118, 0, 1,
-1.518224, -1.251002, -2.382245, 1, 0.3372549, 0, 1,
-1.516801, -0.2552092, -2.927827, 1, 0.3411765, 0, 1,
-1.512939, 0.2934321, -1.740228, 1, 0.3490196, 0, 1,
-1.511087, 0.5006678, -1.327766, 1, 0.3529412, 0, 1,
-1.509377, 0.5078349, -2.302846, 1, 0.3607843, 0, 1,
-1.507006, -0.9068961, -3.228788, 1, 0.3647059, 0, 1,
-1.488181, -1.149741, -3.258306, 1, 0.372549, 0, 1,
-1.487405, -0.6433573, -3.399671, 1, 0.3764706, 0, 1,
-1.48327, -1.182347, -2.343272, 1, 0.3843137, 0, 1,
-1.464541, -0.2126598, -2.110047, 1, 0.3882353, 0, 1,
-1.463128, 0.4664, 0.3292421, 1, 0.3960784, 0, 1,
-1.462382, 0.1997918, -1.097205, 1, 0.4039216, 0, 1,
-1.461165, 1.59469, -0.3900063, 1, 0.4078431, 0, 1,
-1.457528, 0.7993051, 0.1168909, 1, 0.4156863, 0, 1,
-1.453613, -0.3261205, -2.370021, 1, 0.4196078, 0, 1,
-1.452178, -1.046471, -1.914199, 1, 0.427451, 0, 1,
-1.442535, -1.251987, -2.648608, 1, 0.4313726, 0, 1,
-1.43929, -0.304451, -2.426836, 1, 0.4392157, 0, 1,
-1.438686, -0.2310852, -0.1847368, 1, 0.4431373, 0, 1,
-1.437536, -0.7813978, -2.786117, 1, 0.4509804, 0, 1,
-1.429777, -0.7572951, -2.003917, 1, 0.454902, 0, 1,
-1.418515, -0.4354163, -2.846487, 1, 0.4627451, 0, 1,
-1.418046, -0.4758047, -1.127724, 1, 0.4666667, 0, 1,
-1.417332, 0.2894794, -1.708187, 1, 0.4745098, 0, 1,
-1.416006, 0.1992254, -1.060879, 1, 0.4784314, 0, 1,
-1.41525, -0.9242105, -1.277587, 1, 0.4862745, 0, 1,
-1.402935, -2.114712, -2.750611, 1, 0.4901961, 0, 1,
-1.398144, -1.451131, -1.902549, 1, 0.4980392, 0, 1,
-1.394336, -0.6737024, 0.3859039, 1, 0.5058824, 0, 1,
-1.382698, 0.3528549, -1.343551, 1, 0.509804, 0, 1,
-1.377249, 0.6129597, 0.06780904, 1, 0.5176471, 0, 1,
-1.364943, -1.402992, -0.9917364, 1, 0.5215687, 0, 1,
-1.36144, 1.063779, -1.824924, 1, 0.5294118, 0, 1,
-1.359289, -0.8116609, -0.2536464, 1, 0.5333334, 0, 1,
-1.3581, -1.307047, -0.7149538, 1, 0.5411765, 0, 1,
-1.357207, -0.1352153, -1.923076, 1, 0.5450981, 0, 1,
-1.342895, -0.2965189, -2.623788, 1, 0.5529412, 0, 1,
-1.340168, 0.9973268, -2.381654, 1, 0.5568628, 0, 1,
-1.332488, -1.645323, -3.340021, 1, 0.5647059, 0, 1,
-1.322515, 0.2315195, -0.05970077, 1, 0.5686275, 0, 1,
-1.315722, 0.6457589, -0.852466, 1, 0.5764706, 0, 1,
-1.304454, -0.1552798, -1.863405, 1, 0.5803922, 0, 1,
-1.284026, -0.1166953, -0.8034692, 1, 0.5882353, 0, 1,
-1.278218, -0.2451822, -0.7408037, 1, 0.5921569, 0, 1,
-1.275816, 0.3645967, -1.451301, 1, 0.6, 0, 1,
-1.259887, -0.8360266, -0.7845458, 1, 0.6078432, 0, 1,
-1.259834, 0.3984363, -1.940683, 1, 0.6117647, 0, 1,
-1.254901, -0.5515829, -2.747133, 1, 0.6196079, 0, 1,
-1.25216, -1.31717, -2.63061, 1, 0.6235294, 0, 1,
-1.243932, 0.4027579, 0.2824708, 1, 0.6313726, 0, 1,
-1.237145, -1.645328, -2.167991, 1, 0.6352941, 0, 1,
-1.23465, 0.9663488, -1.89481, 1, 0.6431373, 0, 1,
-1.2237, 0.4607123, -1.073079, 1, 0.6470588, 0, 1,
-1.222795, -0.5696481, -2.185295, 1, 0.654902, 0, 1,
-1.220596, -0.754263, -2.624155, 1, 0.6588235, 0, 1,
-1.198964, 0.9430319, -1.357519, 1, 0.6666667, 0, 1,
-1.195908, -0.02920019, 0.6047319, 1, 0.6705883, 0, 1,
-1.1923, 0.7029364, -0.9303579, 1, 0.6784314, 0, 1,
-1.190771, -0.4015013, -1.233124, 1, 0.682353, 0, 1,
-1.190028, -0.6849009, -1.006883, 1, 0.6901961, 0, 1,
-1.184269, 0.3519003, -0.3332632, 1, 0.6941177, 0, 1,
-1.182748, 2.443832, -1.685796, 1, 0.7019608, 0, 1,
-1.176137, -0.2207555, 0.4750972, 1, 0.7098039, 0, 1,
-1.174152, -0.04663048, -1.83342, 1, 0.7137255, 0, 1,
-1.168998, -0.1179493, -2.75672, 1, 0.7215686, 0, 1,
-1.168961, -0.413527, -2.119644, 1, 0.7254902, 0, 1,
-1.167807, -0.05022475, -0.3579529, 1, 0.7333333, 0, 1,
-1.166417, -1.806212, -2.097274, 1, 0.7372549, 0, 1,
-1.158937, 1.13939, -2.069015, 1, 0.7450981, 0, 1,
-1.153039, -0.3457544, -1.962762, 1, 0.7490196, 0, 1,
-1.152558, 2.532277, -0.2188427, 1, 0.7568628, 0, 1,
-1.141493, -0.8548772, -2.664238, 1, 0.7607843, 0, 1,
-1.140892, 1.675227, -0.9078373, 1, 0.7686275, 0, 1,
-1.140875, -0.7555175, -1.253162, 1, 0.772549, 0, 1,
-1.132117, -1.360483, -0.949932, 1, 0.7803922, 0, 1,
-1.131574, -1.767917, -2.845778, 1, 0.7843137, 0, 1,
-1.126732, -1.475873, -2.21443, 1, 0.7921569, 0, 1,
-1.124302, -1.888678, -1.318059, 1, 0.7960784, 0, 1,
-1.12336, 1.48728, 0.8928853, 1, 0.8039216, 0, 1,
-1.122585, -0.5393013, -2.234064, 1, 0.8117647, 0, 1,
-1.121816, 0.5839115, 0.05619501, 1, 0.8156863, 0, 1,
-1.121506, 2.43183, 0.03845697, 1, 0.8235294, 0, 1,
-1.10916, -0.6111642, -4.335018, 1, 0.827451, 0, 1,
-1.100119, -0.1926426, -0.9260762, 1, 0.8352941, 0, 1,
-1.091031, 0.3766, -2.506568, 1, 0.8392157, 0, 1,
-1.084049, -0.2412517, -0.8456687, 1, 0.8470588, 0, 1,
-1.056109, 0.7843224, -1.442722, 1, 0.8509804, 0, 1,
-1.055724, 0.1910696, -2.497055, 1, 0.8588235, 0, 1,
-1.055558, -1.488616, -3.487256, 1, 0.8627451, 0, 1,
-1.04991, -0.8128628, -1.355162, 1, 0.8705882, 0, 1,
-1.048984, -1.009813, -0.7751788, 1, 0.8745098, 0, 1,
-1.048972, 0.7632434, -2.229764, 1, 0.8823529, 0, 1,
-1.041602, 0.01884022, -0.6546393, 1, 0.8862745, 0, 1,
-1.037645, -0.1082447, -0.2615956, 1, 0.8941177, 0, 1,
-1.030233, -1.225591, -1.619113, 1, 0.8980392, 0, 1,
-1.029973, -1.762534, -2.159768, 1, 0.9058824, 0, 1,
-1.029906, -0.9307087, -3.577862, 1, 0.9137255, 0, 1,
-1.026626, -0.8470775, -3.207814, 1, 0.9176471, 0, 1,
-1.017233, 0.7482826, -0.4163263, 1, 0.9254902, 0, 1,
-1.001709, 0.1059351, -2.202656, 1, 0.9294118, 0, 1,
-1.000567, -0.7880328, -1.667351, 1, 0.9372549, 0, 1,
-0.9895614, 1.022845, -0.2260584, 1, 0.9411765, 0, 1,
-0.9838393, -1.372747, -4.073929, 1, 0.9490196, 0, 1,
-0.9780099, -0.2614651, -2.4199, 1, 0.9529412, 0, 1,
-0.9771016, 0.6027089, -1.43124, 1, 0.9607843, 0, 1,
-0.9767205, 0.6375901, -0.4756495, 1, 0.9647059, 0, 1,
-0.9727119, -0.6045811, -2.643109, 1, 0.972549, 0, 1,
-0.969762, 0.8562487, -1.107177, 1, 0.9764706, 0, 1,
-0.9667903, 0.6331265, -2.775355, 1, 0.9843137, 0, 1,
-0.9610844, 0.2328968, -0.1309334, 1, 0.9882353, 0, 1,
-0.9568058, 0.4728239, -0.8450586, 1, 0.9960784, 0, 1,
-0.9423305, 0.6372209, -1.166975, 0.9960784, 1, 0, 1,
-0.9320942, -0.4917977, -2.776043, 0.9921569, 1, 0, 1,
-0.925254, 0.009280816, -0.682469, 0.9843137, 1, 0, 1,
-0.9226147, 0.2033195, -0.3655761, 0.9803922, 1, 0, 1,
-0.9220802, -1.519252, -4.182735, 0.972549, 1, 0, 1,
-0.9166176, 0.9429696, -0.1654842, 0.9686275, 1, 0, 1,
-0.916098, 0.1896025, -0.106584, 0.9607843, 1, 0, 1,
-0.9134358, 0.7356501, -0.6941622, 0.9568627, 1, 0, 1,
-0.9131409, 1.720053, 0.1372689, 0.9490196, 1, 0, 1,
-0.9122421, -0.1493882, -0.7469817, 0.945098, 1, 0, 1,
-0.9111183, 0.5553052, 0.3212424, 0.9372549, 1, 0, 1,
-0.907407, -0.3886786, -2.490723, 0.9333333, 1, 0, 1,
-0.8968305, -0.2482298, -1.354764, 0.9254902, 1, 0, 1,
-0.8962224, 0.1294123, -1.069683, 0.9215686, 1, 0, 1,
-0.8905903, -0.2279899, -1.475426, 0.9137255, 1, 0, 1,
-0.8887919, 0.2003475, 1.104159, 0.9098039, 1, 0, 1,
-0.8837263, 1.128536, -0.9370965, 0.9019608, 1, 0, 1,
-0.8770875, 1.220186, -2.498258, 0.8941177, 1, 0, 1,
-0.8723453, 0.6459157, 0.5042471, 0.8901961, 1, 0, 1,
-0.8687605, -0.146789, -1.801947, 0.8823529, 1, 0, 1,
-0.8679382, 1.943134, -0.04578902, 0.8784314, 1, 0, 1,
-0.8658055, -1.83945, -2.414958, 0.8705882, 1, 0, 1,
-0.85944, -0.247234, -3.164814, 0.8666667, 1, 0, 1,
-0.8586199, -1.303326, -3.219124, 0.8588235, 1, 0, 1,
-0.8585988, 1.389574, -0.01963092, 0.854902, 1, 0, 1,
-0.8556026, -1.876357, -3.072196, 0.8470588, 1, 0, 1,
-0.8554639, -1.629545, -1.33531, 0.8431373, 1, 0, 1,
-0.8416565, -0.5124292, -2.025708, 0.8352941, 1, 0, 1,
-0.8340815, -0.4299379, 0.4610966, 0.8313726, 1, 0, 1,
-0.8324645, -1.367996, -4.188024, 0.8235294, 1, 0, 1,
-0.825376, -0.1516485, -0.9292228, 0.8196079, 1, 0, 1,
-0.8219771, 0.6717747, 0.7595819, 0.8117647, 1, 0, 1,
-0.8203345, 0.9568714, 0.4922777, 0.8078431, 1, 0, 1,
-0.8171291, 0.8285329, -1.841033, 0.8, 1, 0, 1,
-0.8134894, 1.689003, -1.240976, 0.7921569, 1, 0, 1,
-0.8112803, 0.5889671, 0.7427219, 0.7882353, 1, 0, 1,
-0.8073731, 0.392472, -1.666183, 0.7803922, 1, 0, 1,
-0.8056274, 0.5397478, -0.8490343, 0.7764706, 1, 0, 1,
-0.8021122, 1.371702, 0.008664619, 0.7686275, 1, 0, 1,
-0.7946727, 0.4967031, -3.099113, 0.7647059, 1, 0, 1,
-0.7927738, 0.0326415, -2.240755, 0.7568628, 1, 0, 1,
-0.7925028, -0.3580233, -2.340631, 0.7529412, 1, 0, 1,
-0.7924455, 0.7169307, -1.71003, 0.7450981, 1, 0, 1,
-0.7915811, -0.03100875, -2.004267, 0.7411765, 1, 0, 1,
-0.7897227, -1.214641, -3.162033, 0.7333333, 1, 0, 1,
-0.7866483, 1.735167, -1.732146, 0.7294118, 1, 0, 1,
-0.7854404, -0.9137096, -4.259926, 0.7215686, 1, 0, 1,
-0.7854402, 0.02794344, -2.296244, 0.7176471, 1, 0, 1,
-0.7831624, -0.4049411, -4.38864, 0.7098039, 1, 0, 1,
-0.7770893, -0.642803, -2.820529, 0.7058824, 1, 0, 1,
-0.7732627, -1.038756, -3.336586, 0.6980392, 1, 0, 1,
-0.7719184, -1.237659, -2.452747, 0.6901961, 1, 0, 1,
-0.7709579, 1.274251, -1.637584, 0.6862745, 1, 0, 1,
-0.7679375, -0.6136484, -3.277918, 0.6784314, 1, 0, 1,
-0.7669895, 0.3089649, -2.728709, 0.6745098, 1, 0, 1,
-0.7669629, 0.2354821, -0.08383792, 0.6666667, 1, 0, 1,
-0.7659351, 0.4333391, -1.351702, 0.6627451, 1, 0, 1,
-0.764522, -0.4690505, -2.43626, 0.654902, 1, 0, 1,
-0.7614828, 0.7969225, 1.186552, 0.6509804, 1, 0, 1,
-0.7428145, 0.07326255, -3.166413, 0.6431373, 1, 0, 1,
-0.7411169, 1.026416, -0.1255693, 0.6392157, 1, 0, 1,
-0.7407528, 0.8559233, 0.3643042, 0.6313726, 1, 0, 1,
-0.740669, 0.7707958, -0.9894994, 0.627451, 1, 0, 1,
-0.7331821, 1.616932, -1.256785, 0.6196079, 1, 0, 1,
-0.7258362, 1.148326, -1.532758, 0.6156863, 1, 0, 1,
-0.7111736, 0.7378051, 0.8033145, 0.6078432, 1, 0, 1,
-0.7056581, -0.7841756, -3.004457, 0.6039216, 1, 0, 1,
-0.6974954, 2.481211, -2.109875, 0.5960785, 1, 0, 1,
-0.6898113, 0.4162854, -0.7304897, 0.5882353, 1, 0, 1,
-0.6855716, -1.081428, -2.125303, 0.5843138, 1, 0, 1,
-0.6742831, 2.064756, 0.9788037, 0.5764706, 1, 0, 1,
-0.6728265, -0.457032, -3.032472, 0.572549, 1, 0, 1,
-0.6721334, -0.3306857, -3.169643, 0.5647059, 1, 0, 1,
-0.6720291, 0.7005982, 0.3834388, 0.5607843, 1, 0, 1,
-0.6662528, -0.5924768, -2.232806, 0.5529412, 1, 0, 1,
-0.6520162, -0.3184589, -0.6390124, 0.5490196, 1, 0, 1,
-0.6513222, -0.9425505, -2.2321, 0.5411765, 1, 0, 1,
-0.6485224, -0.2303976, -0.6606824, 0.5372549, 1, 0, 1,
-0.6481379, 2.345689, 0.6127605, 0.5294118, 1, 0, 1,
-0.6473283, -0.01437612, -3.467426, 0.5254902, 1, 0, 1,
-0.6472411, -0.6261908, -2.229887, 0.5176471, 1, 0, 1,
-0.6405563, -1.40522, -3.674115, 0.5137255, 1, 0, 1,
-0.6357958, 1.180201, -0.0261851, 0.5058824, 1, 0, 1,
-0.6336291, -0.7093374, -3.292732, 0.5019608, 1, 0, 1,
-0.6327245, -0.3301368, -3.298751, 0.4941176, 1, 0, 1,
-0.6282677, 1.494819, 1.049714, 0.4862745, 1, 0, 1,
-0.6251069, 0.5639602, -2.899929, 0.4823529, 1, 0, 1,
-0.624873, 0.3208098, -1.575295, 0.4745098, 1, 0, 1,
-0.6226762, -2.260862, -3.52289, 0.4705882, 1, 0, 1,
-0.6211521, 1.805281, 0.1088525, 0.4627451, 1, 0, 1,
-0.6171536, 0.6810755, -0.8029561, 0.4588235, 1, 0, 1,
-0.6165753, 0.4943808, -1.389986, 0.4509804, 1, 0, 1,
-0.6165151, -0.9804965, -2.675865, 0.4470588, 1, 0, 1,
-0.6158266, 2.466627, -1.318151, 0.4392157, 1, 0, 1,
-0.6094989, -0.5600564, -1.868327, 0.4352941, 1, 0, 1,
-0.6083366, -0.5786049, -3.036564, 0.427451, 1, 0, 1,
-0.6082817, 0.8031808, -0.005372897, 0.4235294, 1, 0, 1,
-0.6050977, 0.8119431, -0.393959, 0.4156863, 1, 0, 1,
-0.6021087, 0.3807468, -0.009477865, 0.4117647, 1, 0, 1,
-0.6019884, 1.470354, -1.419179, 0.4039216, 1, 0, 1,
-0.6011751, -1.37831, -2.941005, 0.3960784, 1, 0, 1,
-0.5974433, -0.3466728, -0.203281, 0.3921569, 1, 0, 1,
-0.5966752, 0.2284149, -2.411123, 0.3843137, 1, 0, 1,
-0.5959332, 0.8927521, -1.678874, 0.3803922, 1, 0, 1,
-0.5878941, -0.189279, -1.360725, 0.372549, 1, 0, 1,
-0.5871631, 1.499449, -0.04485157, 0.3686275, 1, 0, 1,
-0.5867344, -0.9526146, -2.419826, 0.3607843, 1, 0, 1,
-0.5865098, 0.751177, -0.8620712, 0.3568628, 1, 0, 1,
-0.5862922, -0.6187129, -0.9863082, 0.3490196, 1, 0, 1,
-0.5853305, -0.541505, -1.128042, 0.345098, 1, 0, 1,
-0.5842079, 0.6983624, 0.5768684, 0.3372549, 1, 0, 1,
-0.5789736, 1.205608, -0.1445963, 0.3333333, 1, 0, 1,
-0.5776995, -0.3544078, -2.457048, 0.3254902, 1, 0, 1,
-0.575292, -0.1337165, -2.18334, 0.3215686, 1, 0, 1,
-0.5705037, -0.2372461, -1.562496, 0.3137255, 1, 0, 1,
-0.5685313, -1.402834, -1.928761, 0.3098039, 1, 0, 1,
-0.5674055, -2.091101, -3.358983, 0.3019608, 1, 0, 1,
-0.562566, 1.024452, 0.1631506, 0.2941177, 1, 0, 1,
-0.5528082, -1.59874, -2.645165, 0.2901961, 1, 0, 1,
-0.5510851, -1.236589, -2.762338, 0.282353, 1, 0, 1,
-0.5494488, -0.2822623, -1.769507, 0.2784314, 1, 0, 1,
-0.5484302, 1.291841, -0.2175507, 0.2705882, 1, 0, 1,
-0.5479953, 0.02757174, -0.6986361, 0.2666667, 1, 0, 1,
-0.5459055, -1.732765, -1.751762, 0.2588235, 1, 0, 1,
-0.5438577, -0.6994538, -1.538533, 0.254902, 1, 0, 1,
-0.5424603, -0.1713097, -2.697524, 0.2470588, 1, 0, 1,
-0.5365233, -1.335451, -0.906767, 0.2431373, 1, 0, 1,
-0.5353965, -0.3121355, -3.552241, 0.2352941, 1, 0, 1,
-0.5333711, 0.5039495, -2.570184, 0.2313726, 1, 0, 1,
-0.5329619, -0.2774428, -2.708935, 0.2235294, 1, 0, 1,
-0.5328085, -0.613889, -2.293069, 0.2196078, 1, 0, 1,
-0.532073, 1.240243, 1.305841, 0.2117647, 1, 0, 1,
-0.5295015, -1.435491, -3.493134, 0.2078431, 1, 0, 1,
-0.5290843, -0.4505717, -3.638872, 0.2, 1, 0, 1,
-0.5285626, -0.08785079, -1.293725, 0.1921569, 1, 0, 1,
-0.5284659, 0.5259755, -2.565279, 0.1882353, 1, 0, 1,
-0.5224341, -0.9030618, -2.370895, 0.1803922, 1, 0, 1,
-0.5170889, -0.4116719, -2.023232, 0.1764706, 1, 0, 1,
-0.5169991, -0.2593157, -3.40899, 0.1686275, 1, 0, 1,
-0.5157135, 0.9245699, -0.5088942, 0.1647059, 1, 0, 1,
-0.5098006, -3.467428, -3.738955, 0.1568628, 1, 0, 1,
-0.5068012, 0.2806649, -1.56375, 0.1529412, 1, 0, 1,
-0.5042938, 0.5834426, -0.9712681, 0.145098, 1, 0, 1,
-0.5002242, 1.704011, 0.352581, 0.1411765, 1, 0, 1,
-0.4980296, 0.9337242, -0.6262187, 0.1333333, 1, 0, 1,
-0.4974403, 1.128467, 0.3062122, 0.1294118, 1, 0, 1,
-0.4973967, 1.678051, 0.9260157, 0.1215686, 1, 0, 1,
-0.4961404, 0.0578776, -3.835685, 0.1176471, 1, 0, 1,
-0.4896528, -1.40166, -2.401814, 0.1098039, 1, 0, 1,
-0.4891804, 0.6967708, -0.4264144, 0.1058824, 1, 0, 1,
-0.4889594, -2.177473, -3.983358, 0.09803922, 1, 0, 1,
-0.4865712, 0.7393935, -2.611446, 0.09019608, 1, 0, 1,
-0.4796813, 0.001362637, -0.6194793, 0.08627451, 1, 0, 1,
-0.4794004, -0.2624006, -0.9046437, 0.07843138, 1, 0, 1,
-0.4766402, -1.614272, -1.908643, 0.07450981, 1, 0, 1,
-0.4701926, -0.5250072, -2.401628, 0.06666667, 1, 0, 1,
-0.469248, 0.4276687, -1.201563, 0.0627451, 1, 0, 1,
-0.467378, 0.8176453, 0.7818938, 0.05490196, 1, 0, 1,
-0.4657323, -2.116947, -2.308632, 0.05098039, 1, 0, 1,
-0.4650466, -1.017137, -3.407444, 0.04313726, 1, 0, 1,
-0.4630342, -1.946527, -4.670219, 0.03921569, 1, 0, 1,
-0.4584301, -1.482431, -2.598255, 0.03137255, 1, 0, 1,
-0.4547243, -1.593101, -2.642274, 0.02745098, 1, 0, 1,
-0.4545579, -0.3358035, -1.55556, 0.01960784, 1, 0, 1,
-0.4456443, 1.892387, -1.321998, 0.01568628, 1, 0, 1,
-0.4415791, 0.2183701, -1.864406, 0.007843138, 1, 0, 1,
-0.4335876, -1.177628, -3.286065, 0.003921569, 1, 0, 1,
-0.4328929, -0.6952065, -2.858433, 0, 1, 0.003921569, 1,
-0.4307244, -0.6176366, -2.452662, 0, 1, 0.01176471, 1,
-0.428116, 0.9177064, -1.331675, 0, 1, 0.01568628, 1,
-0.4269968, -0.2074854, -1.322987, 0, 1, 0.02352941, 1,
-0.4245587, 0.8942068, 0.7942152, 0, 1, 0.02745098, 1,
-0.4178567, 0.0006472492, -2.533786, 0, 1, 0.03529412, 1,
-0.4137821, 0.613376, 0.3493326, 0, 1, 0.03921569, 1,
-0.4105667, -0.7837303, -2.658489, 0, 1, 0.04705882, 1,
-0.4063629, -1.763759, -2.841312, 0, 1, 0.05098039, 1,
-0.4059415, 1.968525, -0.7045573, 0, 1, 0.05882353, 1,
-0.4054681, 0.5080419, -0.7961119, 0, 1, 0.0627451, 1,
-0.4029718, 0.778712, -0.7982489, 0, 1, 0.07058824, 1,
-0.4026865, 0.9851801, -0.1652323, 0, 1, 0.07450981, 1,
-0.4023371, -1.663884, -1.667362, 0, 1, 0.08235294, 1,
-0.3978852, 0.748457, -0.145813, 0, 1, 0.08627451, 1,
-0.3966104, 1.114523, -0.6462412, 0, 1, 0.09411765, 1,
-0.3962899, -1.769285, -2.664521, 0, 1, 0.1019608, 1,
-0.3942193, -0.02673153, -1.635284, 0, 1, 0.1058824, 1,
-0.39094, -1.275418, -2.220603, 0, 1, 0.1137255, 1,
-0.389519, -1.706445, -3.765462, 0, 1, 0.1176471, 1,
-0.3876952, 0.3558328, -1.239078, 0, 1, 0.1254902, 1,
-0.3871279, -2.476472, -0.6766833, 0, 1, 0.1294118, 1,
-0.3870624, 1.144725, 1.098049, 0, 1, 0.1372549, 1,
-0.3859266, 0.2169244, -1.518558, 0, 1, 0.1411765, 1,
-0.384616, 0.8648605, 0.7429494, 0, 1, 0.1490196, 1,
-0.3805424, -1.331255, -3.445426, 0, 1, 0.1529412, 1,
-0.3799798, 1.141713, 0.4017936, 0, 1, 0.1607843, 1,
-0.3764198, -2.55632, -6.044396, 0, 1, 0.1647059, 1,
-0.3740005, -0.8971645, -2.643332, 0, 1, 0.172549, 1,
-0.3722526, 0.920073, -0.8757291, 0, 1, 0.1764706, 1,
-0.3702014, 0.5885166, -0.2008199, 0, 1, 0.1843137, 1,
-0.3634591, -2.750136, -3.928634, 0, 1, 0.1882353, 1,
-0.3592928, 0.1049367, -0.3825614, 0, 1, 0.1960784, 1,
-0.3575652, -0.08701079, -1.47621, 0, 1, 0.2039216, 1,
-0.3551252, 0.4486621, -0.3207951, 0, 1, 0.2078431, 1,
-0.3496193, 0.0320091, -2.110108, 0, 1, 0.2156863, 1,
-0.3453798, -0.2128637, -2.686228, 0, 1, 0.2196078, 1,
-0.3439685, 0.8192694, 0.3085578, 0, 1, 0.227451, 1,
-0.3385003, -0.08773291, -1.822446, 0, 1, 0.2313726, 1,
-0.3357804, 1.221261, -0.2391253, 0, 1, 0.2392157, 1,
-0.3327814, 1.514244, 0.895582, 0, 1, 0.2431373, 1,
-0.3317708, 1.557448, -0.994339, 0, 1, 0.2509804, 1,
-0.3240712, -0.07875571, -2.107961, 0, 1, 0.254902, 1,
-0.322294, 0.2802595, -0.07646358, 0, 1, 0.2627451, 1,
-0.3214707, -2.656524, -2.393101, 0, 1, 0.2666667, 1,
-0.3112405, -1.105803, -2.794661, 0, 1, 0.2745098, 1,
-0.3077573, -0.7087558, -1.418222, 0, 1, 0.2784314, 1,
-0.3059095, -0.3866349, -0.9503971, 0, 1, 0.2862745, 1,
-0.3032223, 0.7108786, 1.693939, 0, 1, 0.2901961, 1,
-0.3005729, 0.8785082, -1.616379, 0, 1, 0.2980392, 1,
-0.2995355, 0.6209414, -2.126397, 0, 1, 0.3058824, 1,
-0.2978129, 1.149869, -0.8926544, 0, 1, 0.3098039, 1,
-0.2951176, 1.481579, -1.145579, 0, 1, 0.3176471, 1,
-0.2947365, 0.9317087, -0.6489803, 0, 1, 0.3215686, 1,
-0.2923268, -0.09531938, -2.487947, 0, 1, 0.3294118, 1,
-0.2919328, -1.027305, -4.246689, 0, 1, 0.3333333, 1,
-0.2908617, 0.2161414, -0.6493794, 0, 1, 0.3411765, 1,
-0.2881513, 0.6064283, -0.3620033, 0, 1, 0.345098, 1,
-0.2850866, -0.7100742, -2.456853, 0, 1, 0.3529412, 1,
-0.2809879, 0.2171973, -1.047657, 0, 1, 0.3568628, 1,
-0.2788754, -2.755549, -1.304791, 0, 1, 0.3647059, 1,
-0.2681157, 1.571205, -1.655982, 0, 1, 0.3686275, 1,
-0.2668605, 1.468777, -0.183781, 0, 1, 0.3764706, 1,
-0.264699, -0.9187402, -2.536975, 0, 1, 0.3803922, 1,
-0.2646013, 1.922983, -0.2025883, 0, 1, 0.3882353, 1,
-0.2645303, 1.455637, -0.02099369, 0, 1, 0.3921569, 1,
-0.2551527, 0.7585264, -1.036658, 0, 1, 0.4, 1,
-0.2530919, 0.5215399, 0.8882255, 0, 1, 0.4078431, 1,
-0.2529254, -2.342195, -2.088042, 0, 1, 0.4117647, 1,
-0.2453381, -1.25732, -1.949268, 0, 1, 0.4196078, 1,
-0.2427379, 0.03848302, -2.427944, 0, 1, 0.4235294, 1,
-0.241895, -0.4677165, -1.028565, 0, 1, 0.4313726, 1,
-0.233699, 2.622329, 0.09493219, 0, 1, 0.4352941, 1,
-0.2316865, -0.1654944, -1.164724, 0, 1, 0.4431373, 1,
-0.2304482, 0.3800323, 0.5006017, 0, 1, 0.4470588, 1,
-0.2296124, -0.2475677, -0.8638114, 0, 1, 0.454902, 1,
-0.2287138, -1.088148, -3.397571, 0, 1, 0.4588235, 1,
-0.2248963, 2.105665, -0.2571547, 0, 1, 0.4666667, 1,
-0.2240744, -0.2160895, -2.706986, 0, 1, 0.4705882, 1,
-0.2235633, 0.7334648, 0.8616148, 0, 1, 0.4784314, 1,
-0.22205, 0.1240352, 0.09118564, 0, 1, 0.4823529, 1,
-0.2193255, 0.1061618, -0.1880621, 0, 1, 0.4901961, 1,
-0.2167028, -1.301611, -2.765654, 0, 1, 0.4941176, 1,
-0.2156646, 1.206243, 0.1314342, 0, 1, 0.5019608, 1,
-0.2150156, -1.740873, -1.842794, 0, 1, 0.509804, 1,
-0.2139599, -1.808506, -3.512186, 0, 1, 0.5137255, 1,
-0.2124324, -0.2422668, -2.646319, 0, 1, 0.5215687, 1,
-0.2104713, 1.120776, -1.987502, 0, 1, 0.5254902, 1,
-0.2100409, -1.032495, -2.989064, 0, 1, 0.5333334, 1,
-0.2035383, 2.45193, 0.693225, 0, 1, 0.5372549, 1,
-0.198116, 0.2338275, -2.48722, 0, 1, 0.5450981, 1,
-0.1958527, 1.118627, -1.245901, 0, 1, 0.5490196, 1,
-0.1952215, 0.2041991, -0.09023654, 0, 1, 0.5568628, 1,
-0.19517, -0.1093851, -3.006114, 0, 1, 0.5607843, 1,
-0.1950567, -0.6315381, -4.443736, 0, 1, 0.5686275, 1,
-0.1945754, -0.942486, -3.435315, 0, 1, 0.572549, 1,
-0.1928079, -0.4859665, -1.843395, 0, 1, 0.5803922, 1,
-0.1905769, 0.7062593, 0.02376746, 0, 1, 0.5843138, 1,
-0.1902119, -0.3382242, -4.330193, 0, 1, 0.5921569, 1,
-0.1892017, -1.15291, -2.717521, 0, 1, 0.5960785, 1,
-0.1888918, -0.4914117, -2.947383, 0, 1, 0.6039216, 1,
-0.1851954, 2.403227, 1.157589, 0, 1, 0.6117647, 1,
-0.1840701, -0.7319492, -1.902205, 0, 1, 0.6156863, 1,
-0.1745877, 0.5106321, 0.3626016, 0, 1, 0.6235294, 1,
-0.1736984, -1.616522, -1.423649, 0, 1, 0.627451, 1,
-0.1696513, -0.6887202, -4.570218, 0, 1, 0.6352941, 1,
-0.1659227, 0.9589337, -0.51071, 0, 1, 0.6392157, 1,
-0.1643578, -0.5561539, -2.239236, 0, 1, 0.6470588, 1,
-0.1605459, -0.9553093, -2.819164, 0, 1, 0.6509804, 1,
-0.1574268, 0.006047273, -1.56009, 0, 1, 0.6588235, 1,
-0.1404183, 0.3503889, 0.2769756, 0, 1, 0.6627451, 1,
-0.1391146, -1.937499, -2.667388, 0, 1, 0.6705883, 1,
-0.1306636, -0.8253405, -4.330355, 0, 1, 0.6745098, 1,
-0.1265001, 1.384279, 0.5451467, 0, 1, 0.682353, 1,
-0.1221538, 0.6318557, 0.3109773, 0, 1, 0.6862745, 1,
-0.1216695, -0.1969682, -2.235028, 0, 1, 0.6941177, 1,
-0.1214244, -1.403973, -2.319592, 0, 1, 0.7019608, 1,
-0.1206616, -0.5663989, -4.234765, 0, 1, 0.7058824, 1,
-0.1203419, -0.1447109, -1.789651, 0, 1, 0.7137255, 1,
-0.1190741, 2.023065, -0.8356341, 0, 1, 0.7176471, 1,
-0.1187559, -2.050745, -3.655471, 0, 1, 0.7254902, 1,
-0.1119157, 0.1003605, -1.988994, 0, 1, 0.7294118, 1,
-0.1086427, 0.4001988, -1.080395, 0, 1, 0.7372549, 1,
-0.102858, 1.08014, 1.130929, 0, 1, 0.7411765, 1,
-0.09881811, -0.4097756, -2.108806, 0, 1, 0.7490196, 1,
-0.09870151, 0.02177427, -3.182463, 0, 1, 0.7529412, 1,
-0.09810869, 1.207027, -1.510834, 0, 1, 0.7607843, 1,
-0.09756931, 1.422524, -0.4099059, 0, 1, 0.7647059, 1,
-0.09628213, -0.2364036, -2.100113, 0, 1, 0.772549, 1,
-0.09568956, -0.06493635, -1.482425, 0, 1, 0.7764706, 1,
-0.08828029, -1.547609, -4.34067, 0, 1, 0.7843137, 1,
-0.08540037, -0.3519371, -2.926202, 0, 1, 0.7882353, 1,
-0.08502486, -2.098941, -2.710347, 0, 1, 0.7960784, 1,
-0.0830332, -1.100371, -3.23604, 0, 1, 0.8039216, 1,
-0.08033129, -0.9229912, -3.480336, 0, 1, 0.8078431, 1,
-0.07827834, -0.9841955, -4.260968, 0, 1, 0.8156863, 1,
-0.07787399, -1.408845, -2.916823, 0, 1, 0.8196079, 1,
-0.07770769, 2.231335, -1.095323, 0, 1, 0.827451, 1,
-0.07431634, -1.119793, -3.086497, 0, 1, 0.8313726, 1,
-0.07122561, 0.2116128, 2.432156, 0, 1, 0.8392157, 1,
-0.06830808, -0.2020255, -2.066652, 0, 1, 0.8431373, 1,
-0.06711616, 0.803448, -1.489865, 0, 1, 0.8509804, 1,
-0.06296938, 0.1263985, 0.1077705, 0, 1, 0.854902, 1,
-0.05642866, -1.414389, -1.544811, 0, 1, 0.8627451, 1,
-0.05613579, 1.056067, -1.010162, 0, 1, 0.8666667, 1,
-0.05362523, 0.4613435, -1.042049, 0, 1, 0.8745098, 1,
-0.05229156, -1.278525, -3.953991, 0, 1, 0.8784314, 1,
-0.05119683, 0.6087736, 0.8074313, 0, 1, 0.8862745, 1,
-0.05040318, 2.401818, -0.5737748, 0, 1, 0.8901961, 1,
-0.04292117, -0.2468247, -1.931627, 0, 1, 0.8980392, 1,
-0.04129792, -0.16583, -4.335293, 0, 1, 0.9058824, 1,
-0.0393648, 2.39541, -0.1981412, 0, 1, 0.9098039, 1,
-0.03480553, -1.052201, -3.611652, 0, 1, 0.9176471, 1,
-0.03347888, -0.5765609, -3.876853, 0, 1, 0.9215686, 1,
-0.03225654, 2.038609, -0.3435846, 0, 1, 0.9294118, 1,
-0.03191701, -1.025255, -1.801643, 0, 1, 0.9333333, 1,
-0.03137954, 2.686539, -0.6871825, 0, 1, 0.9411765, 1,
-0.03007959, 2.200391, -0.4669807, 0, 1, 0.945098, 1,
-0.02810943, -1.057948, -3.539172, 0, 1, 0.9529412, 1,
-0.02743408, -1.471773, -3.787901, 0, 1, 0.9568627, 1,
-0.02522503, -0.3716585, -3.180686, 0, 1, 0.9647059, 1,
-0.01902589, 0.4513035, 0.7688436, 0, 1, 0.9686275, 1,
-0.01549838, 1.168385, 0.630964, 0, 1, 0.9764706, 1,
-0.01179032, -0.2378016, -2.30252, 0, 1, 0.9803922, 1,
-0.01128359, -1.110875, -2.396191, 0, 1, 0.9882353, 1,
-0.00924015, 0.2238857, 0.7673884, 0, 1, 0.9921569, 1,
-0.009184822, -0.03538596, -2.229434, 0, 1, 1, 1,
-0.001170713, 1.187365, -0.6283789, 0, 0.9921569, 1, 1,
-0.0001155847, -0.00537106, -3.567543, 0, 0.9882353, 1, 1,
0.0004066376, 0.1838847, 0.1889505, 0, 0.9803922, 1, 1,
0.002436411, -0.3235257, 3.109669, 0, 0.9764706, 1, 1,
0.002455714, -1.696586, 3.484913, 0, 0.9686275, 1, 1,
0.008932029, 0.4423316, -0.9243397, 0, 0.9647059, 1, 1,
0.01260798, -0.8897715, 1.597428, 0, 0.9568627, 1, 1,
0.01269659, 0.09057625, 0.1128069, 0, 0.9529412, 1, 1,
0.01391634, 1.308124, 0.313925, 0, 0.945098, 1, 1,
0.01736394, 0.7234151, -0.4704735, 0, 0.9411765, 1, 1,
0.01809131, -0.9510436, 3.811615, 0, 0.9333333, 1, 1,
0.01892493, 1.651624, -0.0754636, 0, 0.9294118, 1, 1,
0.0229869, -0.6776399, 5.321649, 0, 0.9215686, 1, 1,
0.02457926, 0.2373118, 0.4919432, 0, 0.9176471, 1, 1,
0.02918005, 0.3332797, -0.4570753, 0, 0.9098039, 1, 1,
0.02925923, -0.7277613, 3.966853, 0, 0.9058824, 1, 1,
0.03272062, -0.8539137, 5.922052, 0, 0.8980392, 1, 1,
0.03366722, -0.4798319, 5.093791, 0, 0.8901961, 1, 1,
0.03459553, -1.313276, 2.949381, 0, 0.8862745, 1, 1,
0.03775286, -0.1358143, 1.376568, 0, 0.8784314, 1, 1,
0.04024845, 0.4505543, -0.6059735, 0, 0.8745098, 1, 1,
0.04208744, 0.06589577, -0.5317011, 0, 0.8666667, 1, 1,
0.04357519, 0.4085842, 1.425596, 0, 0.8627451, 1, 1,
0.04431755, 1.046516, 1.421955, 0, 0.854902, 1, 1,
0.04815452, -1.273106, 2.471621, 0, 0.8509804, 1, 1,
0.05024073, 0.2245968, -0.3779843, 0, 0.8431373, 1, 1,
0.05227981, -0.1435248, 1.594322, 0, 0.8392157, 1, 1,
0.05243412, -0.01740931, 0.5361229, 0, 0.8313726, 1, 1,
0.0566034, -0.1387563, 3.187174, 0, 0.827451, 1, 1,
0.06054758, 0.1177807, -0.6947373, 0, 0.8196079, 1, 1,
0.0608445, -1.304954, 4.173024, 0, 0.8156863, 1, 1,
0.06262767, -1.098896, 2.822831, 0, 0.8078431, 1, 1,
0.06405295, -0.7618858, 2.573355, 0, 0.8039216, 1, 1,
0.06413584, -1.060927, 2.009478, 0, 0.7960784, 1, 1,
0.06994057, -0.426643, 3.015587, 0, 0.7882353, 1, 1,
0.07248224, -0.07122, 1.973996, 0, 0.7843137, 1, 1,
0.07649303, 0.7106841, -1.450773, 0, 0.7764706, 1, 1,
0.07809632, -1.188726, 1.035446, 0, 0.772549, 1, 1,
0.08162922, -0.1572549, 1.9964, 0, 0.7647059, 1, 1,
0.08575951, 0.5732508, 0.5354071, 0, 0.7607843, 1, 1,
0.0880192, -0.8412037, 2.921858, 0, 0.7529412, 1, 1,
0.08819818, -0.1143664, 1.777937, 0, 0.7490196, 1, 1,
0.0884018, -1.184299, 4.405845, 0, 0.7411765, 1, 1,
0.09187002, -2.775886, 3.025138, 0, 0.7372549, 1, 1,
0.09223837, -2.11775, 2.906331, 0, 0.7294118, 1, 1,
0.09420316, -0.3339019, 3.689703, 0, 0.7254902, 1, 1,
0.09488959, -1.336146, 2.399657, 0, 0.7176471, 1, 1,
0.09718461, 1.272166, -1.133793, 0, 0.7137255, 1, 1,
0.1018145, 0.6350327, -0.4111498, 0, 0.7058824, 1, 1,
0.1026529, 1.116153, -1.888125, 0, 0.6980392, 1, 1,
0.1072088, 1.920756, 0.3695313, 0, 0.6941177, 1, 1,
0.1074519, -0.1757038, 1.631751, 0, 0.6862745, 1, 1,
0.1114835, 0.2300342, 0.526251, 0, 0.682353, 1, 1,
0.1152935, 0.08010643, -0.40957, 0, 0.6745098, 1, 1,
0.1155675, 0.3024672, 1.913896, 0, 0.6705883, 1, 1,
0.1178213, 0.1501177, 0.2659053, 0, 0.6627451, 1, 1,
0.1199348, 0.7130583, -1.33976, 0, 0.6588235, 1, 1,
0.1210819, -1.371696, 2.640887, 0, 0.6509804, 1, 1,
0.121927, -0.8251696, 1.031066, 0, 0.6470588, 1, 1,
0.1223686, 1.152675, -0.9462535, 0, 0.6392157, 1, 1,
0.1241066, -1.06169, 3.144837, 0, 0.6352941, 1, 1,
0.1326048, 0.15425, 1.300228, 0, 0.627451, 1, 1,
0.1332764, 0.1812721, 1.02921, 0, 0.6235294, 1, 1,
0.1337644, 0.5948234, -0.5226792, 0, 0.6156863, 1, 1,
0.1383329, 1.588514, -1.221811, 0, 0.6117647, 1, 1,
0.1384468, -0.6533627, 2.728831, 0, 0.6039216, 1, 1,
0.1392463, 0.141134, 1.800777, 0, 0.5960785, 1, 1,
0.1409192, 1.2272, -1.414939, 0, 0.5921569, 1, 1,
0.145412, 0.8856682, -1.244453, 0, 0.5843138, 1, 1,
0.1507245, -0.4226364, 2.160981, 0, 0.5803922, 1, 1,
0.1539122, 1.282545, -0.4700567, 0, 0.572549, 1, 1,
0.1639649, 0.1570878, 2.233481, 0, 0.5686275, 1, 1,
0.1666327, -0.0413634, 3.142891, 0, 0.5607843, 1, 1,
0.1719115, -1.084351, 2.863856, 0, 0.5568628, 1, 1,
0.172265, -0.4491936, 1.156997, 0, 0.5490196, 1, 1,
0.1743562, -0.5676981, 2.022496, 0, 0.5450981, 1, 1,
0.1785821, -0.1068082, 1.547829, 0, 0.5372549, 1, 1,
0.1869097, 0.2337307, 0.5568628, 0, 0.5333334, 1, 1,
0.2038233, -1.716339, 2.379972, 0, 0.5254902, 1, 1,
0.2040506, -0.3814251, 3.717275, 0, 0.5215687, 1, 1,
0.2065448, 2.445323, -0.9522089, 0, 0.5137255, 1, 1,
0.2069368, 2.155837, 1.235109, 0, 0.509804, 1, 1,
0.2101925, -1.500292, 1.431557, 0, 0.5019608, 1, 1,
0.2104686, 0.7929361, -0.1548796, 0, 0.4941176, 1, 1,
0.2126668, -0.7930843, 3.026664, 0, 0.4901961, 1, 1,
0.2140262, -0.05429405, 2.15432, 0, 0.4823529, 1, 1,
0.2168896, 1.176683, 2.185731, 0, 0.4784314, 1, 1,
0.2178852, -0.0962602, 2.479315, 0, 0.4705882, 1, 1,
0.2209064, -0.2419822, 2.900763, 0, 0.4666667, 1, 1,
0.2272018, 0.1740962, 2.625707, 0, 0.4588235, 1, 1,
0.2272577, 1.247941, 1.316642, 0, 0.454902, 1, 1,
0.2284828, -1.597633, 2.359415, 0, 0.4470588, 1, 1,
0.2318744, 0.5482215, 0.1867833, 0, 0.4431373, 1, 1,
0.2357373, 0.8120859, 1.440133, 0, 0.4352941, 1, 1,
0.2383907, -2.106637, 3.0908, 0, 0.4313726, 1, 1,
0.2387019, 0.05490194, 2.65773, 0, 0.4235294, 1, 1,
0.2466669, -2.971462, 1.989132, 0, 0.4196078, 1, 1,
0.2526432, -0.5005499, 4.09268, 0, 0.4117647, 1, 1,
0.2541401, 0.6860291, -0.5444248, 0, 0.4078431, 1, 1,
0.254765, -0.4440919, 2.741237, 0, 0.4, 1, 1,
0.2596922, -0.6586468, 4.141544, 0, 0.3921569, 1, 1,
0.2609346, -0.09850847, 2.657125, 0, 0.3882353, 1, 1,
0.26245, 1.386838, 1.443015, 0, 0.3803922, 1, 1,
0.2638468, 0.02002377, 2.096095, 0, 0.3764706, 1, 1,
0.2685586, 0.09911262, 0.3384871, 0, 0.3686275, 1, 1,
0.2692509, 1.023317, -0.4510866, 0, 0.3647059, 1, 1,
0.2713092, 1.530999, 1.2314, 0, 0.3568628, 1, 1,
0.2713406, 0.2186537, 0.653075, 0, 0.3529412, 1, 1,
0.2716089, -0.02789461, 1.575988, 0, 0.345098, 1, 1,
0.2724479, -0.240073, 1.57753, 0, 0.3411765, 1, 1,
0.2762155, 2.580675, 0.9795529, 0, 0.3333333, 1, 1,
0.2787966, -1.446258, 4.661685, 0, 0.3294118, 1, 1,
0.2812191, -0.2681384, 1.723527, 0, 0.3215686, 1, 1,
0.2816323, 0.4995502, 0.1691544, 0, 0.3176471, 1, 1,
0.2816671, -0.7239864, 2.740024, 0, 0.3098039, 1, 1,
0.2837126, 0.6751457, 0.6219828, 0, 0.3058824, 1, 1,
0.2841266, 2.396035, 0.02427382, 0, 0.2980392, 1, 1,
0.2868164, 0.9010514, -0.4605058, 0, 0.2901961, 1, 1,
0.2935324, 0.9527181, 0.09021509, 0, 0.2862745, 1, 1,
0.2938612, 0.2227826, -0.0304025, 0, 0.2784314, 1, 1,
0.3042687, 0.3516384, 1.045071, 0, 0.2745098, 1, 1,
0.3065065, -0.4983846, 2.9494, 0, 0.2666667, 1, 1,
0.3075162, 1.4322, -0.3478724, 0, 0.2627451, 1, 1,
0.312894, -1.243168, 1.143748, 0, 0.254902, 1, 1,
0.3132175, 0.0394621, 0.6015192, 0, 0.2509804, 1, 1,
0.3148813, 0.2860001, 0.05944375, 0, 0.2431373, 1, 1,
0.3152691, -0.4076023, 2.67453, 0, 0.2392157, 1, 1,
0.3164611, -0.1135279, 1.093182, 0, 0.2313726, 1, 1,
0.31772, -1.517813, 5.758676, 0, 0.227451, 1, 1,
0.3241424, 1.498719, -1.859255, 0, 0.2196078, 1, 1,
0.3248929, -1.233674, 1.094868, 0, 0.2156863, 1, 1,
0.3259144, 0.5552654, 0.6027293, 0, 0.2078431, 1, 1,
0.3311061, -1.772923, 2.415006, 0, 0.2039216, 1, 1,
0.331981, 0.2555039, 0.6750827, 0, 0.1960784, 1, 1,
0.332441, 0.9757469, 0.7054528, 0, 0.1882353, 1, 1,
0.3329985, 0.6210069, 0.6583756, 0, 0.1843137, 1, 1,
0.3336549, -0.009587842, 1.743423, 0, 0.1764706, 1, 1,
0.3358257, -0.1636452, 2.579193, 0, 0.172549, 1, 1,
0.3420128, -0.414831, 3.387115, 0, 0.1647059, 1, 1,
0.3441799, 1.5856, -1.141978, 0, 0.1607843, 1, 1,
0.3457579, 2.091835, 0.3214892, 0, 0.1529412, 1, 1,
0.3491662, 0.5851493, -1.39737, 0, 0.1490196, 1, 1,
0.3529643, -1.246676, 0.4489061, 0, 0.1411765, 1, 1,
0.3540814, 0.8114154, 0.2733419, 0, 0.1372549, 1, 1,
0.3574113, 2.035303, 1.784106, 0, 0.1294118, 1, 1,
0.3575571, 1.463808, 0.4896683, 0, 0.1254902, 1, 1,
0.3589266, 2.234472, 0.4863855, 0, 0.1176471, 1, 1,
0.3661276, -2.177763, 4.33911, 0, 0.1137255, 1, 1,
0.3662082, 0.6463122, 1.388741, 0, 0.1058824, 1, 1,
0.3671741, -0.8788666, 2.53189, 0, 0.09803922, 1, 1,
0.3675463, -1.513059, 2.528534, 0, 0.09411765, 1, 1,
0.3679488, -1.249894, 2.474323, 0, 0.08627451, 1, 1,
0.3682855, -0.1425544, 1.191758, 0, 0.08235294, 1, 1,
0.3687714, -0.6608136, 2.354453, 0, 0.07450981, 1, 1,
0.3717304, -0.08428823, 1.880621, 0, 0.07058824, 1, 1,
0.3720152, -0.7365662, 2.745466, 0, 0.0627451, 1, 1,
0.3786978, 0.5483074, 0.1505327, 0, 0.05882353, 1, 1,
0.3794519, -0.7544459, 0.8857154, 0, 0.05098039, 1, 1,
0.3802796, -0.6474331, 3.286137, 0, 0.04705882, 1, 1,
0.3821394, 0.6570418, 0.08879251, 0, 0.03921569, 1, 1,
0.3825677, -0.7555543, 3.098034, 0, 0.03529412, 1, 1,
0.3865894, -0.2201633, 1.519969, 0, 0.02745098, 1, 1,
0.3912856, 0.1566615, 1.197205, 0, 0.02352941, 1, 1,
0.392042, -0.2152739, 2.711437, 0, 0.01568628, 1, 1,
0.3959895, -0.1085554, 1.914336, 0, 0.01176471, 1, 1,
0.3988356, 0.8382692, 2.360268, 0, 0.003921569, 1, 1,
0.4003271, 0.507314, -0.4489876, 0.003921569, 0, 1, 1,
0.400565, -0.4289334, 2.979328, 0.007843138, 0, 1, 1,
0.4011253, 0.7502372, 1.081554, 0.01568628, 0, 1, 1,
0.4090055, -1.616142, 2.552955, 0.01960784, 0, 1, 1,
0.4101775, -2.796227, 2.113489, 0.02745098, 0, 1, 1,
0.4102645, 1.425145, -0.8811303, 0.03137255, 0, 1, 1,
0.4104356, 0.8381754, -0.6620361, 0.03921569, 0, 1, 1,
0.4118603, 1.448517, 2.359082, 0.04313726, 0, 1, 1,
0.4144305, -0.7937018, 2.65143, 0.05098039, 0, 1, 1,
0.4149834, -1.043056, 3.718927, 0.05490196, 0, 1, 1,
0.4239912, -0.0559289, 0.6102614, 0.0627451, 0, 1, 1,
0.4280928, -0.09566306, 1.541681, 0.06666667, 0, 1, 1,
0.4328606, 0.8028014, 0.9608846, 0.07450981, 0, 1, 1,
0.4344454, 2.045939, 0.343327, 0.07843138, 0, 1, 1,
0.4379201, -0.6998315, 4.490328, 0.08627451, 0, 1, 1,
0.4408449, 0.5630975, 0.4625978, 0.09019608, 0, 1, 1,
0.4411213, 2.119416, 1.552306, 0.09803922, 0, 1, 1,
0.441982, 0.6997908, -1.687466, 0.1058824, 0, 1, 1,
0.4447486, 0.4145436, 0.7404373, 0.1098039, 0, 1, 1,
0.4471218, 1.115486, 0.887327, 0.1176471, 0, 1, 1,
0.4487036, 0.6420952, 0.8255038, 0.1215686, 0, 1, 1,
0.4490072, -0.3658458, 3.433329, 0.1294118, 0, 1, 1,
0.4490366, -0.577331, 1.305443, 0.1333333, 0, 1, 1,
0.4510924, -0.8845012, 2.18169, 0.1411765, 0, 1, 1,
0.4522623, -0.0251183, 3.323591, 0.145098, 0, 1, 1,
0.4571043, -0.1486853, 0.8653288, 0.1529412, 0, 1, 1,
0.4601003, 1.139734, 1.212297, 0.1568628, 0, 1, 1,
0.4610523, -0.488319, 4.005645, 0.1647059, 0, 1, 1,
0.4655506, -1.773967, 3.872098, 0.1686275, 0, 1, 1,
0.4660609, 1.255588, 1.554466, 0.1764706, 0, 1, 1,
0.4661603, -0.8582615, 2.844204, 0.1803922, 0, 1, 1,
0.469981, 0.4618119, 1.418455, 0.1882353, 0, 1, 1,
0.4714679, 2.252544, -0.4951603, 0.1921569, 0, 1, 1,
0.4757924, -0.5094495, 1.188509, 0.2, 0, 1, 1,
0.4836707, -0.1056533, 0.3827434, 0.2078431, 0, 1, 1,
0.4849078, -0.8241007, 2.317236, 0.2117647, 0, 1, 1,
0.492449, 0.2750824, 1.441216, 0.2196078, 0, 1, 1,
0.4934818, 0.934498, 0.5272417, 0.2235294, 0, 1, 1,
0.4972904, 0.08458356, -1.156829, 0.2313726, 0, 1, 1,
0.4996432, -0.4975349, 2.491695, 0.2352941, 0, 1, 1,
0.5002139, 0.2572379, 2.739954, 0.2431373, 0, 1, 1,
0.5060109, -0.1864273, 1.067966, 0.2470588, 0, 1, 1,
0.5107028, 0.6796792, 0.9616299, 0.254902, 0, 1, 1,
0.5110665, -1.070588, 1.996519, 0.2588235, 0, 1, 1,
0.5190387, 0.8120745, -0.6344613, 0.2666667, 0, 1, 1,
0.51955, 0.2754783, 1.800342, 0.2705882, 0, 1, 1,
0.5218377, -0.5106423, 2.190175, 0.2784314, 0, 1, 1,
0.5246229, -0.004596499, 1.43625, 0.282353, 0, 1, 1,
0.5251703, -0.9367169, 1.941244, 0.2901961, 0, 1, 1,
0.5274395, -0.6670768, 3.972029, 0.2941177, 0, 1, 1,
0.5278974, 0.3541418, 0.3450156, 0.3019608, 0, 1, 1,
0.5293865, -0.8930547, 2.59013, 0.3098039, 0, 1, 1,
0.5386086, 0.7758674, 0.6918315, 0.3137255, 0, 1, 1,
0.5395999, -0.4108705, 2.278589, 0.3215686, 0, 1, 1,
0.5402967, -0.9169364, 2.083173, 0.3254902, 0, 1, 1,
0.54668, 1.166909, 0.3450809, 0.3333333, 0, 1, 1,
0.547695, 0.7535676, -0.1287135, 0.3372549, 0, 1, 1,
0.5511667, -0.7719279, 2.05287, 0.345098, 0, 1, 1,
0.5516863, -0.07321477, 3.100346, 0.3490196, 0, 1, 1,
0.5517263, 0.4665706, 0.5787491, 0.3568628, 0, 1, 1,
0.5620494, 0.3729002, -0.8528472, 0.3607843, 0, 1, 1,
0.5637479, 0.9012433, -0.2669327, 0.3686275, 0, 1, 1,
0.566119, 0.6826277, 0.8519811, 0.372549, 0, 1, 1,
0.5801226, 0.2125875, 2.353102, 0.3803922, 0, 1, 1,
0.582534, 0.8506228, -0.300634, 0.3843137, 0, 1, 1,
0.5839166, 0.4746061, 1.881984, 0.3921569, 0, 1, 1,
0.58803, -1.257746, 5.52638, 0.3960784, 0, 1, 1,
0.5898154, -2.957127, 2.301313, 0.4039216, 0, 1, 1,
0.594471, -0.6975514, 2.155962, 0.4117647, 0, 1, 1,
0.5968298, -0.2892738, 3.212974, 0.4156863, 0, 1, 1,
0.6009983, 1.147757, 0.9534327, 0.4235294, 0, 1, 1,
0.6015565, 0.1387847, 1.24634, 0.427451, 0, 1, 1,
0.6137754, 0.2437335, 1.051804, 0.4352941, 0, 1, 1,
0.6140993, 0.3836105, 0.1211476, 0.4392157, 0, 1, 1,
0.6164048, 0.07377663, 1.791199, 0.4470588, 0, 1, 1,
0.6269897, 0.7629309, -0.1864426, 0.4509804, 0, 1, 1,
0.627873, -1.665809, 3.003021, 0.4588235, 0, 1, 1,
0.6312792, -0.3454766, 2.884514, 0.4627451, 0, 1, 1,
0.632401, 1.159799, 0.9124435, 0.4705882, 0, 1, 1,
0.6338857, 0.2322194, 0.6431729, 0.4745098, 0, 1, 1,
0.6399527, -1.081858, 4.222864, 0.4823529, 0, 1, 1,
0.6421148, 0.9017417, 1.723356, 0.4862745, 0, 1, 1,
0.6437466, 0.4046966, 1.52306, 0.4941176, 0, 1, 1,
0.6481746, 0.2883429, 0.9011357, 0.5019608, 0, 1, 1,
0.6489994, 0.8192163, 0.1119398, 0.5058824, 0, 1, 1,
0.6521202, -0.2307795, 1.270735, 0.5137255, 0, 1, 1,
0.6603854, -0.3767394, 1.245431, 0.5176471, 0, 1, 1,
0.6616477, 0.6018437, 0.1996161, 0.5254902, 0, 1, 1,
0.6621317, -0.0507135, 1.908713, 0.5294118, 0, 1, 1,
0.6622831, 1.473941, 0.2904234, 0.5372549, 0, 1, 1,
0.6693146, 1.331647, 2.159806, 0.5411765, 0, 1, 1,
0.6746118, -0.30772, 1.686692, 0.5490196, 0, 1, 1,
0.6876907, -0.3505153, 3.2596, 0.5529412, 0, 1, 1,
0.6895457, 0.992856, 2.395526, 0.5607843, 0, 1, 1,
0.6906513, -0.8120019, 2.820441, 0.5647059, 0, 1, 1,
0.6955686, 0.3553604, 0.6159648, 0.572549, 0, 1, 1,
0.7049795, -1.059073, 3.47283, 0.5764706, 0, 1, 1,
0.7059032, -0.4964611, 2.840369, 0.5843138, 0, 1, 1,
0.7059397, -0.4427696, 0.4643164, 0.5882353, 0, 1, 1,
0.70911, -0.6080585, 2.309645, 0.5960785, 0, 1, 1,
0.7131837, 0.154115, 2.703312, 0.6039216, 0, 1, 1,
0.7142342, -0.7640712, 0.1234184, 0.6078432, 0, 1, 1,
0.7179574, 0.8896559, -0.1965685, 0.6156863, 0, 1, 1,
0.7241573, 2.013414, 0.6169036, 0.6196079, 0, 1, 1,
0.7283708, -1.054077, 4.91186, 0.627451, 0, 1, 1,
0.7333499, -0.02427026, 1.434035, 0.6313726, 0, 1, 1,
0.7351938, 1.622414, -0.2977598, 0.6392157, 0, 1, 1,
0.7354612, -1.446145, 1.898186, 0.6431373, 0, 1, 1,
0.7357985, -1.214664, 2.358961, 0.6509804, 0, 1, 1,
0.7370992, -0.2845637, 2.109524, 0.654902, 0, 1, 1,
0.7500167, 0.2257482, 1.67445, 0.6627451, 0, 1, 1,
0.750942, 0.4568945, 1.245669, 0.6666667, 0, 1, 1,
0.752789, 0.9681554, -0.5351557, 0.6745098, 0, 1, 1,
0.7557359, 0.4248249, 0.6964366, 0.6784314, 0, 1, 1,
0.7582216, -0.2077857, 3.299071, 0.6862745, 0, 1, 1,
0.7590566, -0.05645993, 2.714612, 0.6901961, 0, 1, 1,
0.7619132, 0.3541311, 3.981015, 0.6980392, 0, 1, 1,
0.7636741, -0.3500451, 2.952674, 0.7058824, 0, 1, 1,
0.763958, -0.6965596, 2.130175, 0.7098039, 0, 1, 1,
0.7646467, -0.3987344, 1.862817, 0.7176471, 0, 1, 1,
0.7658932, 0.8304271, 1.022997, 0.7215686, 0, 1, 1,
0.7704279, -1.387778, 1.711971, 0.7294118, 0, 1, 1,
0.7720185, -0.7180752, 1.41947, 0.7333333, 0, 1, 1,
0.7735401, 0.3506698, 1.011856, 0.7411765, 0, 1, 1,
0.7792992, -1.524899, 4.343329, 0.7450981, 0, 1, 1,
0.7832511, 1.849199, 0.5160614, 0.7529412, 0, 1, 1,
0.7859505, -0.2882165, 2.004365, 0.7568628, 0, 1, 1,
0.7990559, -0.2125165, 1.841932, 0.7647059, 0, 1, 1,
0.8003902, -1.138645, 3.232333, 0.7686275, 0, 1, 1,
0.8004807, 0.5256903, -0.3778808, 0.7764706, 0, 1, 1,
0.8082456, -0.2969877, 0.7697446, 0.7803922, 0, 1, 1,
0.8176047, 0.1098199, 2.707789, 0.7882353, 0, 1, 1,
0.8178587, 0.6992242, 0.6394351, 0.7921569, 0, 1, 1,
0.8195925, 0.4393604, 0.7373695, 0.8, 0, 1, 1,
0.8221341, 0.4119096, 2.417172, 0.8078431, 0, 1, 1,
0.8227524, -0.2635246, 2.698447, 0.8117647, 0, 1, 1,
0.8284662, -0.8244857, 1.17515, 0.8196079, 0, 1, 1,
0.8301708, -0.04695411, 1.16692, 0.8235294, 0, 1, 1,
0.8342955, 0.3870129, -0.01573543, 0.8313726, 0, 1, 1,
0.8383994, 0.429029, 0.9775146, 0.8352941, 0, 1, 1,
0.8397896, -0.3325688, 0.193841, 0.8431373, 0, 1, 1,
0.8564646, -0.9511029, 2.094785, 0.8470588, 0, 1, 1,
0.8607014, 1.256716, 1.171209, 0.854902, 0, 1, 1,
0.8615876, 0.120167, 1.095085, 0.8588235, 0, 1, 1,
0.8626445, 0.5553443, 0.5045844, 0.8666667, 0, 1, 1,
0.8678921, -0.3725329, 5.876374, 0.8705882, 0, 1, 1,
0.8702205, -1.638737, 3.567529, 0.8784314, 0, 1, 1,
0.8703508, -0.4164739, 1.782793, 0.8823529, 0, 1, 1,
0.8732204, -0.1534942, 3.302125, 0.8901961, 0, 1, 1,
0.8843927, -0.891171, 2.311347, 0.8941177, 0, 1, 1,
0.8876079, 2.283, -0.5802553, 0.9019608, 0, 1, 1,
0.8896922, 1.388845, -0.1486596, 0.9098039, 0, 1, 1,
0.891924, 0.5252479, 2.214588, 0.9137255, 0, 1, 1,
0.8950204, 0.07412725, 1.478148, 0.9215686, 0, 1, 1,
0.8985677, -1.056975, 1.473664, 0.9254902, 0, 1, 1,
0.8994864, 0.4833429, 0.7316003, 0.9333333, 0, 1, 1,
0.9025318, -1.577797, 2.765958, 0.9372549, 0, 1, 1,
0.9029635, -0.1952967, 2.080306, 0.945098, 0, 1, 1,
0.9037352, -0.3852709, 1.421492, 0.9490196, 0, 1, 1,
0.9052288, -1.591071, 0.2848519, 0.9568627, 0, 1, 1,
0.9055776, -0.7261157, 1.789131, 0.9607843, 0, 1, 1,
0.9128917, -1.885558, 3.734569, 0.9686275, 0, 1, 1,
0.9158974, -1.563523, 3.380851, 0.972549, 0, 1, 1,
0.9248215, 0.06672458, 1.840804, 0.9803922, 0, 1, 1,
0.9283792, 0.8743564, 1.023368, 0.9843137, 0, 1, 1,
0.9303499, 1.417181, -0.4982062, 0.9921569, 0, 1, 1,
0.9457033, -1.200181, 3.565139, 0.9960784, 0, 1, 1,
0.9561101, -1.053887, -0.02245723, 1, 0, 0.9960784, 1,
0.9574195, 1.990337, -0.2546657, 1, 0, 0.9882353, 1,
0.9578844, 0.760623, 0.8252345, 1, 0, 0.9843137, 1,
0.9670736, -0.3083706, 1.81026, 1, 0, 0.9764706, 1,
0.9691049, 0.5086419, -1.415515, 1, 0, 0.972549, 1,
0.9776357, 0.09355738, 2.519059, 1, 0, 0.9647059, 1,
0.9833599, -0.2572484, 1.940531, 1, 0, 0.9607843, 1,
0.9910812, 1.064668, -0.2253723, 1, 0, 0.9529412, 1,
0.9910901, -0.0605132, 3.171039, 1, 0, 0.9490196, 1,
0.9925148, 0.6166162, 0.5967664, 1, 0, 0.9411765, 1,
1.000585, -0.7228721, 3.482735, 1, 0, 0.9372549, 1,
1.003237, -0.3744518, 1.616702, 1, 0, 0.9294118, 1,
1.017416, -1.997445, 2.748682, 1, 0, 0.9254902, 1,
1.027494, 0.9271582, 0.5718772, 1, 0, 0.9176471, 1,
1.031014, 1.616391, 1.255997, 1, 0, 0.9137255, 1,
1.031641, -0.08388493, 1.512338, 1, 0, 0.9058824, 1,
1.041075, -0.007070456, 1.860831, 1, 0, 0.9019608, 1,
1.048006, -1.624087, 1.151834, 1, 0, 0.8941177, 1,
1.050179, 2.177047, 1.273383, 1, 0, 0.8862745, 1,
1.061697, 2.530733, 0.4636383, 1, 0, 0.8823529, 1,
1.073884, 0.1605103, -0.1991377, 1, 0, 0.8745098, 1,
1.076848, 0.4367349, 0.6346505, 1, 0, 0.8705882, 1,
1.077058, 1.111375, -1.154304, 1, 0, 0.8627451, 1,
1.077235, 0.5305213, 0.05352593, 1, 0, 0.8588235, 1,
1.078975, 1.005886, 0.6336129, 1, 0, 0.8509804, 1,
1.087439, 0.6471309, 0.1544438, 1, 0, 0.8470588, 1,
1.096027, 0.06182992, 3.738194, 1, 0, 0.8392157, 1,
1.096504, -0.9379228, 3.433747, 1, 0, 0.8352941, 1,
1.097289, 0.06556754, 0.7782471, 1, 0, 0.827451, 1,
1.099884, -2.310968, 0.6576571, 1, 0, 0.8235294, 1,
1.10055, 0.1032486, 2.256122, 1, 0, 0.8156863, 1,
1.118596, -0.8976511, 2.3949, 1, 0, 0.8117647, 1,
1.124801, 0.06918412, 0.5441903, 1, 0, 0.8039216, 1,
1.131225, 0.7744128, 1.297844, 1, 0, 0.7960784, 1,
1.132268, 0.2317567, 1.840671, 1, 0, 0.7921569, 1,
1.13308, 0.2351597, 1.100153, 1, 0, 0.7843137, 1,
1.135604, 0.09290852, 1.132654, 1, 0, 0.7803922, 1,
1.142625, 0.03970241, 1.96593, 1, 0, 0.772549, 1,
1.143134, -1.015856, 2.008982, 1, 0, 0.7686275, 1,
1.14371, -2.949631, 3.211366, 1, 0, 0.7607843, 1,
1.144598, 0.7296245, 1.118785, 1, 0, 0.7568628, 1,
1.151067, -1.383149, 4.032898, 1, 0, 0.7490196, 1,
1.152487, -1.508927, 1.470527, 1, 0, 0.7450981, 1,
1.16755, -0.2671161, 1.111665, 1, 0, 0.7372549, 1,
1.174052, -0.05683965, 0.8334144, 1, 0, 0.7333333, 1,
1.175593, -0.4098934, 3.549099, 1, 0, 0.7254902, 1,
1.177722, 1.499527, 1.76672, 1, 0, 0.7215686, 1,
1.180721, -0.8665569, 3.206839, 1, 0, 0.7137255, 1,
1.187898, -1.339289, 0.9523769, 1, 0, 0.7098039, 1,
1.19001, 1.447123, 1.286917, 1, 0, 0.7019608, 1,
1.190277, 0.04492875, 0.1250723, 1, 0, 0.6941177, 1,
1.191992, 0.7919475, 1.519565, 1, 0, 0.6901961, 1,
1.194486, -1.188131, 2.940662, 1, 0, 0.682353, 1,
1.200938, 0.3695404, 1.27089, 1, 0, 0.6784314, 1,
1.206583, -0.2042968, 2.555663, 1, 0, 0.6705883, 1,
1.208348, -1.405343, 2.689741, 1, 0, 0.6666667, 1,
1.229204, -0.689855, 1.163093, 1, 0, 0.6588235, 1,
1.234885, 0.3373922, 0.1272047, 1, 0, 0.654902, 1,
1.234942, 1.270698, 0.3946671, 1, 0, 0.6470588, 1,
1.245086, -2.673836, 1.654616, 1, 0, 0.6431373, 1,
1.254564, -0.6532894, 1.700013, 1, 0, 0.6352941, 1,
1.25498, -0.2268858, 1.585461, 1, 0, 0.6313726, 1,
1.257494, -0.5287983, 2.300501, 1, 0, 0.6235294, 1,
1.261863, 0.4341846, 1.9371, 1, 0, 0.6196079, 1,
1.267509, 0.6617531, 2.232634, 1, 0, 0.6117647, 1,
1.2893, -0.7902381, 2.609909, 1, 0, 0.6078432, 1,
1.298782, -1.226967, 3.906863, 1, 0, 0.6, 1,
1.305832, 1.208103, 0.08366501, 1, 0, 0.5921569, 1,
1.308701, 0.1367018, 1.390585, 1, 0, 0.5882353, 1,
1.314761, 0.1894091, 0.2635166, 1, 0, 0.5803922, 1,
1.323714, 1.326237, 0.93293, 1, 0, 0.5764706, 1,
1.324712, -0.7002929, 1.864316, 1, 0, 0.5686275, 1,
1.325967, -0.731487, 1.855252, 1, 0, 0.5647059, 1,
1.327589, -0.3163166, 2.597587, 1, 0, 0.5568628, 1,
1.332799, 0.3476065, 0.2985531, 1, 0, 0.5529412, 1,
1.344295, -0.2044625, 1.124272, 1, 0, 0.5450981, 1,
1.37868, -2.129293, 1.501195, 1, 0, 0.5411765, 1,
1.410216, -0.6369826, 1.495707, 1, 0, 0.5333334, 1,
1.411368, -0.1566072, 3.036362, 1, 0, 0.5294118, 1,
1.417036, -1.845707, 3.272169, 1, 0, 0.5215687, 1,
1.426315, 0.8004265, 1.157781, 1, 0, 0.5176471, 1,
1.437604, -1.277814, 3.250851, 1, 0, 0.509804, 1,
1.440225, 0.1895715, 0.4193266, 1, 0, 0.5058824, 1,
1.440707, -0.7351803, 1.922936, 1, 0, 0.4980392, 1,
1.450749, -0.3498995, -0.739157, 1, 0, 0.4901961, 1,
1.455389, -0.496099, 3.132964, 1, 0, 0.4862745, 1,
1.467755, -0.435793, 1.906207, 1, 0, 0.4784314, 1,
1.471832, 0.9672692, 0.72795, 1, 0, 0.4745098, 1,
1.476955, -0.1802446, 2.358579, 1, 0, 0.4666667, 1,
1.484203, 0.592251, 1.276276, 1, 0, 0.4627451, 1,
1.486883, -0.8102275, 2.398463, 1, 0, 0.454902, 1,
1.490348, -0.1975211, 3.083388, 1, 0, 0.4509804, 1,
1.517522, -1.173081, 4.086398, 1, 0, 0.4431373, 1,
1.522664, 1.283705, 0.1133515, 1, 0, 0.4392157, 1,
1.525194, 0.4485188, 1.268598, 1, 0, 0.4313726, 1,
1.540226, 0.4266285, 1.251978, 1, 0, 0.427451, 1,
1.567826, -0.3243802, 0.6903552, 1, 0, 0.4196078, 1,
1.572968, 0.5568525, 2.80512, 1, 0, 0.4156863, 1,
1.574016, 1.406508, 0.4549758, 1, 0, 0.4078431, 1,
1.583749, 2.123525, -0.3974645, 1, 0, 0.4039216, 1,
1.593966, -1.751332, 1.219109, 1, 0, 0.3960784, 1,
1.601887, -0.3813349, 2.743589, 1, 0, 0.3882353, 1,
1.63121, -1.754868, 2.333989, 1, 0, 0.3843137, 1,
1.63257, 1.185395, -0.2000922, 1, 0, 0.3764706, 1,
1.63372, -1.005853, 1.868269, 1, 0, 0.372549, 1,
1.634178, 0.5159693, 0.8837013, 1, 0, 0.3647059, 1,
1.638121, 1.163588, 2.374289, 1, 0, 0.3607843, 1,
1.647769, -0.7696799, 0.3786512, 1, 0, 0.3529412, 1,
1.663751, -1.277005, 3.172114, 1, 0, 0.3490196, 1,
1.672462, 0.6884509, 2.024223, 1, 0, 0.3411765, 1,
1.673151, -0.7794046, 1.806523, 1, 0, 0.3372549, 1,
1.676474, -0.438059, 1.722589, 1, 0, 0.3294118, 1,
1.682701, -1.921041, 1.62905, 1, 0, 0.3254902, 1,
1.683858, -0.3062525, 3.141917, 1, 0, 0.3176471, 1,
1.685298, 0.3732375, 0.2194576, 1, 0, 0.3137255, 1,
1.686933, -0.8792577, 1.666825, 1, 0, 0.3058824, 1,
1.72064, -0.7636067, 1.480036, 1, 0, 0.2980392, 1,
1.745449, 0.733126, 0.9280105, 1, 0, 0.2941177, 1,
1.751328, -0.3298187, 1.655704, 1, 0, 0.2862745, 1,
1.752938, 0.05672213, -0.03965074, 1, 0, 0.282353, 1,
1.769994, -0.1555442, 3.961915, 1, 0, 0.2745098, 1,
1.770651, 1.421947, 0.8557611, 1, 0, 0.2705882, 1,
1.78239, -0.2949831, 0.1654703, 1, 0, 0.2627451, 1,
1.80573, 0.2490981, 1.844331, 1, 0, 0.2588235, 1,
1.830932, -0.2584718, 2.272187, 1, 0, 0.2509804, 1,
1.911022, -1.030566, 1.707569, 1, 0, 0.2470588, 1,
1.920934, -0.7962788, 1.852078, 1, 0, 0.2392157, 1,
1.921054, -0.3104786, 3.983347, 1, 0, 0.2352941, 1,
1.933119, 0.4575655, 0.9485338, 1, 0, 0.227451, 1,
1.982024, -1.494591, 3.486295, 1, 0, 0.2235294, 1,
1.994027, 0.8972673, 1.40809, 1, 0, 0.2156863, 1,
2.006992, -0.9162507, 3.396123, 1, 0, 0.2117647, 1,
2.01136, -0.220974, 3.796515, 1, 0, 0.2039216, 1,
2.020074, -0.1347632, 2.15535, 1, 0, 0.1960784, 1,
2.029629, -0.8356788, 1.514968, 1, 0, 0.1921569, 1,
2.030145, -0.7951212, 2.4473, 1, 0, 0.1843137, 1,
2.065196, 0.8978927, 1.719673, 1, 0, 0.1803922, 1,
2.09401, 0.06099805, 0.3929194, 1, 0, 0.172549, 1,
2.104835, -0.03632296, 1.304074, 1, 0, 0.1686275, 1,
2.105992, 0.5130073, 0.3786371, 1, 0, 0.1607843, 1,
2.112298, -0.5470632, 1.219148, 1, 0, 0.1568628, 1,
2.116044, -0.06321145, 1.764482, 1, 0, 0.1490196, 1,
2.120626, 0.8833116, 1.515917, 1, 0, 0.145098, 1,
2.130769, -0.6067738, 1.779955, 1, 0, 0.1372549, 1,
2.17067, 1.256067, 0.1247744, 1, 0, 0.1333333, 1,
2.17446, -1.00573, 0.5138738, 1, 0, 0.1254902, 1,
2.183101, 2.242699, 0.3525626, 1, 0, 0.1215686, 1,
2.229318, -1.529862, 0.4933056, 1, 0, 0.1137255, 1,
2.254979, 0.3052258, 2.326357, 1, 0, 0.1098039, 1,
2.276868, 0.5120164, 2.936746, 1, 0, 0.1019608, 1,
2.356858, 0.8630978, 2.23638, 1, 0, 0.09411765, 1,
2.389919, -1.342257, 2.361023, 1, 0, 0.09019608, 1,
2.415442, -0.4020872, -0.3812301, 1, 0, 0.08235294, 1,
2.42873, 0.7716655, 1.352239, 1, 0, 0.07843138, 1,
2.443777, -1.107129, 1.905487, 1, 0, 0.07058824, 1,
2.474834, 0.5843071, 1.073373, 1, 0, 0.06666667, 1,
2.476517, -0.01761544, 3.586519, 1, 0, 0.05882353, 1,
2.495666, 0.1926154, 0.4757657, 1, 0, 0.05490196, 1,
2.584462, -0.9791875, 1.856505, 1, 0, 0.04705882, 1,
2.595756, -0.6487048, 1.885278, 1, 0, 0.04313726, 1,
2.645074, -0.02641537, 1.637875, 1, 0, 0.03529412, 1,
2.700184, -1.260769, 0.9553752, 1, 0, 0.03137255, 1,
3.120397, 0.9811484, -0.7260439, 1, 0, 0.02352941, 1,
3.303599, 2.926656, 0.03887421, 1, 0, 0.01960784, 1,
3.313793, -1.882004, 1.917097, 1, 0, 0.01176471, 1,
3.43975, 0.1777327, 1.994571, 1, 0, 0.007843138, 1
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
0.06552422, -4.551225, -8.072709, 0, -0.5, 0.5, 0.5,
0.06552422, -4.551225, -8.072709, 1, -0.5, 0.5, 0.5,
0.06552422, -4.551225, -8.072709, 1, 1.5, 0.5, 0.5,
0.06552422, -4.551225, -8.072709, 0, 1.5, 0.5, 0.5
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
-4.452564, -0.2703861, -8.072709, 0, -0.5, 0.5, 0.5,
-4.452564, -0.2703861, -8.072709, 1, -0.5, 0.5, 0.5,
-4.452564, -0.2703861, -8.072709, 1, 1.5, 0.5, 0.5,
-4.452564, -0.2703861, -8.072709, 0, 1.5, 0.5, 0.5
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
-4.452564, -4.551225, -0.06117225, 0, -0.5, 0.5, 0.5,
-4.452564, -4.551225, -0.06117225, 1, -0.5, 0.5, 0.5,
-4.452564, -4.551225, -0.06117225, 1, 1.5, 0.5, 0.5,
-4.452564, -4.551225, -0.06117225, 0, 1.5, 0.5, 0.5
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
-3, -3.563339, -6.223893,
3, -3.563339, -6.223893,
-3, -3.563339, -6.223893,
-3, -3.727987, -6.532029,
-2, -3.563339, -6.223893,
-2, -3.727987, -6.532029,
-1, -3.563339, -6.223893,
-1, -3.727987, -6.532029,
0, -3.563339, -6.223893,
0, -3.727987, -6.532029,
1, -3.563339, -6.223893,
1, -3.727987, -6.532029,
2, -3.563339, -6.223893,
2, -3.727987, -6.532029,
3, -3.563339, -6.223893,
3, -3.727987, -6.532029
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
-3, -4.057282, -7.148301, 0, -0.5, 0.5, 0.5,
-3, -4.057282, -7.148301, 1, -0.5, 0.5, 0.5,
-3, -4.057282, -7.148301, 1, 1.5, 0.5, 0.5,
-3, -4.057282, -7.148301, 0, 1.5, 0.5, 0.5,
-2, -4.057282, -7.148301, 0, -0.5, 0.5, 0.5,
-2, -4.057282, -7.148301, 1, -0.5, 0.5, 0.5,
-2, -4.057282, -7.148301, 1, 1.5, 0.5, 0.5,
-2, -4.057282, -7.148301, 0, 1.5, 0.5, 0.5,
-1, -4.057282, -7.148301, 0, -0.5, 0.5, 0.5,
-1, -4.057282, -7.148301, 1, -0.5, 0.5, 0.5,
-1, -4.057282, -7.148301, 1, 1.5, 0.5, 0.5,
-1, -4.057282, -7.148301, 0, 1.5, 0.5, 0.5,
0, -4.057282, -7.148301, 0, -0.5, 0.5, 0.5,
0, -4.057282, -7.148301, 1, -0.5, 0.5, 0.5,
0, -4.057282, -7.148301, 1, 1.5, 0.5, 0.5,
0, -4.057282, -7.148301, 0, 1.5, 0.5, 0.5,
1, -4.057282, -7.148301, 0, -0.5, 0.5, 0.5,
1, -4.057282, -7.148301, 1, -0.5, 0.5, 0.5,
1, -4.057282, -7.148301, 1, 1.5, 0.5, 0.5,
1, -4.057282, -7.148301, 0, 1.5, 0.5, 0.5,
2, -4.057282, -7.148301, 0, -0.5, 0.5, 0.5,
2, -4.057282, -7.148301, 1, -0.5, 0.5, 0.5,
2, -4.057282, -7.148301, 1, 1.5, 0.5, 0.5,
2, -4.057282, -7.148301, 0, 1.5, 0.5, 0.5,
3, -4.057282, -7.148301, 0, -0.5, 0.5, 0.5,
3, -4.057282, -7.148301, 1, -0.5, 0.5, 0.5,
3, -4.057282, -7.148301, 1, 1.5, 0.5, 0.5,
3, -4.057282, -7.148301, 0, 1.5, 0.5, 0.5
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
-3.409928, -3, -6.223893,
-3.409928, 2, -6.223893,
-3.409928, -3, -6.223893,
-3.583701, -3, -6.532029,
-3.409928, -2, -6.223893,
-3.583701, -2, -6.532029,
-3.409928, -1, -6.223893,
-3.583701, -1, -6.532029,
-3.409928, 0, -6.223893,
-3.583701, 0, -6.532029,
-3.409928, 1, -6.223893,
-3.583701, 1, -6.532029,
-3.409928, 2, -6.223893,
-3.583701, 2, -6.532029
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
-3.931246, -3, -7.148301, 0, -0.5, 0.5, 0.5,
-3.931246, -3, -7.148301, 1, -0.5, 0.5, 0.5,
-3.931246, -3, -7.148301, 1, 1.5, 0.5, 0.5,
-3.931246, -3, -7.148301, 0, 1.5, 0.5, 0.5,
-3.931246, -2, -7.148301, 0, -0.5, 0.5, 0.5,
-3.931246, -2, -7.148301, 1, -0.5, 0.5, 0.5,
-3.931246, -2, -7.148301, 1, 1.5, 0.5, 0.5,
-3.931246, -2, -7.148301, 0, 1.5, 0.5, 0.5,
-3.931246, -1, -7.148301, 0, -0.5, 0.5, 0.5,
-3.931246, -1, -7.148301, 1, -0.5, 0.5, 0.5,
-3.931246, -1, -7.148301, 1, 1.5, 0.5, 0.5,
-3.931246, -1, -7.148301, 0, 1.5, 0.5, 0.5,
-3.931246, 0, -7.148301, 0, -0.5, 0.5, 0.5,
-3.931246, 0, -7.148301, 1, -0.5, 0.5, 0.5,
-3.931246, 0, -7.148301, 1, 1.5, 0.5, 0.5,
-3.931246, 0, -7.148301, 0, 1.5, 0.5, 0.5,
-3.931246, 1, -7.148301, 0, -0.5, 0.5, 0.5,
-3.931246, 1, -7.148301, 1, -0.5, 0.5, 0.5,
-3.931246, 1, -7.148301, 1, 1.5, 0.5, 0.5,
-3.931246, 1, -7.148301, 0, 1.5, 0.5, 0.5,
-3.931246, 2, -7.148301, 0, -0.5, 0.5, 0.5,
-3.931246, 2, -7.148301, 1, -0.5, 0.5, 0.5,
-3.931246, 2, -7.148301, 1, 1.5, 0.5, 0.5,
-3.931246, 2, -7.148301, 0, 1.5, 0.5, 0.5
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
-3.409928, -3.563339, -6,
-3.409928, -3.563339, 4,
-3.409928, -3.563339, -6,
-3.583701, -3.727987, -6,
-3.409928, -3.563339, -4,
-3.583701, -3.727987, -4,
-3.409928, -3.563339, -2,
-3.583701, -3.727987, -2,
-3.409928, -3.563339, 0,
-3.583701, -3.727987, 0,
-3.409928, -3.563339, 2,
-3.583701, -3.727987, 2,
-3.409928, -3.563339, 4,
-3.583701, -3.727987, 4
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
"-6",
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
-3.931246, -4.057282, -6, 0, -0.5, 0.5, 0.5,
-3.931246, -4.057282, -6, 1, -0.5, 0.5, 0.5,
-3.931246, -4.057282, -6, 1, 1.5, 0.5, 0.5,
-3.931246, -4.057282, -6, 0, 1.5, 0.5, 0.5,
-3.931246, -4.057282, -4, 0, -0.5, 0.5, 0.5,
-3.931246, -4.057282, -4, 1, -0.5, 0.5, 0.5,
-3.931246, -4.057282, -4, 1, 1.5, 0.5, 0.5,
-3.931246, -4.057282, -4, 0, 1.5, 0.5, 0.5,
-3.931246, -4.057282, -2, 0, -0.5, 0.5, 0.5,
-3.931246, -4.057282, -2, 1, -0.5, 0.5, 0.5,
-3.931246, -4.057282, -2, 1, 1.5, 0.5, 0.5,
-3.931246, -4.057282, -2, 0, 1.5, 0.5, 0.5,
-3.931246, -4.057282, 0, 0, -0.5, 0.5, 0.5,
-3.931246, -4.057282, 0, 1, -0.5, 0.5, 0.5,
-3.931246, -4.057282, 0, 1, 1.5, 0.5, 0.5,
-3.931246, -4.057282, 0, 0, 1.5, 0.5, 0.5,
-3.931246, -4.057282, 2, 0, -0.5, 0.5, 0.5,
-3.931246, -4.057282, 2, 1, -0.5, 0.5, 0.5,
-3.931246, -4.057282, 2, 1, 1.5, 0.5, 0.5,
-3.931246, -4.057282, 2, 0, 1.5, 0.5, 0.5,
-3.931246, -4.057282, 4, 0, -0.5, 0.5, 0.5,
-3.931246, -4.057282, 4, 1, -0.5, 0.5, 0.5,
-3.931246, -4.057282, 4, 1, 1.5, 0.5, 0.5,
-3.931246, -4.057282, 4, 0, 1.5, 0.5, 0.5
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
-3.409928, -3.563339, -6.223893,
-3.409928, 3.022567, -6.223893,
-3.409928, -3.563339, 6.101549,
-3.409928, 3.022567, 6.101549,
-3.409928, -3.563339, -6.223893,
-3.409928, -3.563339, 6.101549,
-3.409928, 3.022567, -6.223893,
-3.409928, 3.022567, 6.101549,
-3.409928, -3.563339, -6.223893,
3.540977, -3.563339, -6.223893,
-3.409928, -3.563339, 6.101549,
3.540977, -3.563339, 6.101549,
-3.409928, 3.022567, -6.223893,
3.540977, 3.022567, -6.223893,
-3.409928, 3.022567, 6.101549,
3.540977, 3.022567, 6.101549,
3.540977, -3.563339, -6.223893,
3.540977, 3.022567, -6.223893,
3.540977, -3.563339, 6.101549,
3.540977, 3.022567, 6.101549,
3.540977, -3.563339, -6.223893,
3.540977, -3.563339, 6.101549,
3.540977, 3.022567, -6.223893,
3.540977, 3.022567, 6.101549
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
var radius = 8.334302;
var distance = 37.08025;
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
mvMatrix.translate( -0.06552422, 0.2703861, 0.06117225 );
mvMatrix.scale( 1.296408, 1.368257, 0.7311065 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.08025);
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
haloxyfop-etotyl<-read.table("haloxyfop-etotyl.xyz")
```

```
## Error in read.table("haloxyfop-etotyl.xyz"): no lines available in input
```

```r
x<-haloxyfop-etotyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'haloxyfop' not found
```

```r
y<-haloxyfop-etotyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'haloxyfop' not found
```

```r
z<-haloxyfop-etotyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'haloxyfop' not found
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
-3.308702, 0.4804843, -1.320832, 0, 0, 1, 1, 1,
-3.165411, -1.675674, -2.488233, 1, 0, 0, 1, 1,
-2.962661, 2.27794, 0.2606737, 1, 0, 0, 1, 1,
-2.577806, -0.05347516, -2.580155, 1, 0, 0, 1, 1,
-2.532039, -0.6911454, -2.392803, 1, 0, 0, 1, 1,
-2.519015, -0.1746912, -1.5474, 1, 0, 0, 1, 1,
-2.466583, 0.4248547, -1.824661, 0, 0, 0, 1, 1,
-2.38518, -1.531389, -0.5290474, 0, 0, 0, 1, 1,
-2.362655, -0.6011189, -2.451108, 0, 0, 0, 1, 1,
-2.257048, 0.06906581, -1.354684, 0, 0, 0, 1, 1,
-2.255162, 0.2049358, -2.056574, 0, 0, 0, 1, 1,
-2.206868, -0.2078563, -1.100041, 0, 0, 0, 1, 1,
-2.194178, 1.234806, -0.3082285, 0, 0, 0, 1, 1,
-2.147763, 0.3312792, -1.873549, 1, 1, 1, 1, 1,
-2.139134, 1.172839, -2.909148, 1, 1, 1, 1, 1,
-2.040238, -1.392919, -1.863436, 1, 1, 1, 1, 1,
-2.039428, -0.9043973, -1.304557, 1, 1, 1, 1, 1,
-2.036167, -0.01408464, -1.198479, 1, 1, 1, 1, 1,
-2.005118, -0.1979934, -1.309593, 1, 1, 1, 1, 1,
-2.000088, 1.472901, -0.6197239, 1, 1, 1, 1, 1,
-1.994578, -1.702758, -1.318923, 1, 1, 1, 1, 1,
-1.949089, -0.9490144, -3.342178, 1, 1, 1, 1, 1,
-1.932212, -0.6771274, -2.830788, 1, 1, 1, 1, 1,
-1.9304, -1.15925, -2.289645, 1, 1, 1, 1, 1,
-1.909903, 0.5440425, -0.4989347, 1, 1, 1, 1, 1,
-1.889743, 1.235906, 0.04678166, 1, 1, 1, 1, 1,
-1.842126, 2.637756, -0.2130373, 1, 1, 1, 1, 1,
-1.818767, 0.9770485, -1.324717, 1, 1, 1, 1, 1,
-1.81631, 0.7589772, -2.097078, 0, 0, 1, 1, 1,
-1.788623, -1.650674, -1.698853, 1, 0, 0, 1, 1,
-1.785228, 0.9299088, 0.2118338, 1, 0, 0, 1, 1,
-1.770666, 0.1694802, -1.12338, 1, 0, 0, 1, 1,
-1.76907, -0.3440251, -0.6165836, 1, 0, 0, 1, 1,
-1.766656, -0.579804, -2.48714, 1, 0, 0, 1, 1,
-1.764982, -0.2037955, -2.269048, 0, 0, 0, 1, 1,
-1.764772, 1.742821, -0.2923936, 0, 0, 0, 1, 1,
-1.74767, -0.815406, -3.486318, 0, 0, 0, 1, 1,
-1.74567, 0.0930348, 0.06382569, 0, 0, 0, 1, 1,
-1.74436, -0.1673986, -1.741572, 0, 0, 0, 1, 1,
-1.723593, 0.5140132, -1.014054, 0, 0, 0, 1, 1,
-1.723216, 1.084564, -2.378693, 0, 0, 0, 1, 1,
-1.721173, 0.1558716, -1.741085, 1, 1, 1, 1, 1,
-1.717003, -1.836627, -1.517498, 1, 1, 1, 1, 1,
-1.71248, -1.018343, -1.815518, 1, 1, 1, 1, 1,
-1.702483, -0.4613501, -2.215899, 1, 1, 1, 1, 1,
-1.700743, -0.583369, -0.9268105, 1, 1, 1, 1, 1,
-1.679678, 0.9340329, -1.495197, 1, 1, 1, 1, 1,
-1.676527, 0.5555922, -0.04939398, 1, 1, 1, 1, 1,
-1.672526, 1.253569, -0.6360742, 1, 1, 1, 1, 1,
-1.662113, 0.02882062, -1.935508, 1, 1, 1, 1, 1,
-1.658347, 1.065343, -1.813007, 1, 1, 1, 1, 1,
-1.652834, 0.04599226, -1.483581, 1, 1, 1, 1, 1,
-1.60638, 1.243669, -0.420571, 1, 1, 1, 1, 1,
-1.584697, 1.611636, -2.886636, 1, 1, 1, 1, 1,
-1.545098, -1.052712, -2.433261, 1, 1, 1, 1, 1,
-1.53317, -0.29484, -2.1335, 1, 1, 1, 1, 1,
-1.518224, -1.251002, -2.382245, 0, 0, 1, 1, 1,
-1.516801, -0.2552092, -2.927827, 1, 0, 0, 1, 1,
-1.512939, 0.2934321, -1.740228, 1, 0, 0, 1, 1,
-1.511087, 0.5006678, -1.327766, 1, 0, 0, 1, 1,
-1.509377, 0.5078349, -2.302846, 1, 0, 0, 1, 1,
-1.507006, -0.9068961, -3.228788, 1, 0, 0, 1, 1,
-1.488181, -1.149741, -3.258306, 0, 0, 0, 1, 1,
-1.487405, -0.6433573, -3.399671, 0, 0, 0, 1, 1,
-1.48327, -1.182347, -2.343272, 0, 0, 0, 1, 1,
-1.464541, -0.2126598, -2.110047, 0, 0, 0, 1, 1,
-1.463128, 0.4664, 0.3292421, 0, 0, 0, 1, 1,
-1.462382, 0.1997918, -1.097205, 0, 0, 0, 1, 1,
-1.461165, 1.59469, -0.3900063, 0, 0, 0, 1, 1,
-1.457528, 0.7993051, 0.1168909, 1, 1, 1, 1, 1,
-1.453613, -0.3261205, -2.370021, 1, 1, 1, 1, 1,
-1.452178, -1.046471, -1.914199, 1, 1, 1, 1, 1,
-1.442535, -1.251987, -2.648608, 1, 1, 1, 1, 1,
-1.43929, -0.304451, -2.426836, 1, 1, 1, 1, 1,
-1.438686, -0.2310852, -0.1847368, 1, 1, 1, 1, 1,
-1.437536, -0.7813978, -2.786117, 1, 1, 1, 1, 1,
-1.429777, -0.7572951, -2.003917, 1, 1, 1, 1, 1,
-1.418515, -0.4354163, -2.846487, 1, 1, 1, 1, 1,
-1.418046, -0.4758047, -1.127724, 1, 1, 1, 1, 1,
-1.417332, 0.2894794, -1.708187, 1, 1, 1, 1, 1,
-1.416006, 0.1992254, -1.060879, 1, 1, 1, 1, 1,
-1.41525, -0.9242105, -1.277587, 1, 1, 1, 1, 1,
-1.402935, -2.114712, -2.750611, 1, 1, 1, 1, 1,
-1.398144, -1.451131, -1.902549, 1, 1, 1, 1, 1,
-1.394336, -0.6737024, 0.3859039, 0, 0, 1, 1, 1,
-1.382698, 0.3528549, -1.343551, 1, 0, 0, 1, 1,
-1.377249, 0.6129597, 0.06780904, 1, 0, 0, 1, 1,
-1.364943, -1.402992, -0.9917364, 1, 0, 0, 1, 1,
-1.36144, 1.063779, -1.824924, 1, 0, 0, 1, 1,
-1.359289, -0.8116609, -0.2536464, 1, 0, 0, 1, 1,
-1.3581, -1.307047, -0.7149538, 0, 0, 0, 1, 1,
-1.357207, -0.1352153, -1.923076, 0, 0, 0, 1, 1,
-1.342895, -0.2965189, -2.623788, 0, 0, 0, 1, 1,
-1.340168, 0.9973268, -2.381654, 0, 0, 0, 1, 1,
-1.332488, -1.645323, -3.340021, 0, 0, 0, 1, 1,
-1.322515, 0.2315195, -0.05970077, 0, 0, 0, 1, 1,
-1.315722, 0.6457589, -0.852466, 0, 0, 0, 1, 1,
-1.304454, -0.1552798, -1.863405, 1, 1, 1, 1, 1,
-1.284026, -0.1166953, -0.8034692, 1, 1, 1, 1, 1,
-1.278218, -0.2451822, -0.7408037, 1, 1, 1, 1, 1,
-1.275816, 0.3645967, -1.451301, 1, 1, 1, 1, 1,
-1.259887, -0.8360266, -0.7845458, 1, 1, 1, 1, 1,
-1.259834, 0.3984363, -1.940683, 1, 1, 1, 1, 1,
-1.254901, -0.5515829, -2.747133, 1, 1, 1, 1, 1,
-1.25216, -1.31717, -2.63061, 1, 1, 1, 1, 1,
-1.243932, 0.4027579, 0.2824708, 1, 1, 1, 1, 1,
-1.237145, -1.645328, -2.167991, 1, 1, 1, 1, 1,
-1.23465, 0.9663488, -1.89481, 1, 1, 1, 1, 1,
-1.2237, 0.4607123, -1.073079, 1, 1, 1, 1, 1,
-1.222795, -0.5696481, -2.185295, 1, 1, 1, 1, 1,
-1.220596, -0.754263, -2.624155, 1, 1, 1, 1, 1,
-1.198964, 0.9430319, -1.357519, 1, 1, 1, 1, 1,
-1.195908, -0.02920019, 0.6047319, 0, 0, 1, 1, 1,
-1.1923, 0.7029364, -0.9303579, 1, 0, 0, 1, 1,
-1.190771, -0.4015013, -1.233124, 1, 0, 0, 1, 1,
-1.190028, -0.6849009, -1.006883, 1, 0, 0, 1, 1,
-1.184269, 0.3519003, -0.3332632, 1, 0, 0, 1, 1,
-1.182748, 2.443832, -1.685796, 1, 0, 0, 1, 1,
-1.176137, -0.2207555, 0.4750972, 0, 0, 0, 1, 1,
-1.174152, -0.04663048, -1.83342, 0, 0, 0, 1, 1,
-1.168998, -0.1179493, -2.75672, 0, 0, 0, 1, 1,
-1.168961, -0.413527, -2.119644, 0, 0, 0, 1, 1,
-1.167807, -0.05022475, -0.3579529, 0, 0, 0, 1, 1,
-1.166417, -1.806212, -2.097274, 0, 0, 0, 1, 1,
-1.158937, 1.13939, -2.069015, 0, 0, 0, 1, 1,
-1.153039, -0.3457544, -1.962762, 1, 1, 1, 1, 1,
-1.152558, 2.532277, -0.2188427, 1, 1, 1, 1, 1,
-1.141493, -0.8548772, -2.664238, 1, 1, 1, 1, 1,
-1.140892, 1.675227, -0.9078373, 1, 1, 1, 1, 1,
-1.140875, -0.7555175, -1.253162, 1, 1, 1, 1, 1,
-1.132117, -1.360483, -0.949932, 1, 1, 1, 1, 1,
-1.131574, -1.767917, -2.845778, 1, 1, 1, 1, 1,
-1.126732, -1.475873, -2.21443, 1, 1, 1, 1, 1,
-1.124302, -1.888678, -1.318059, 1, 1, 1, 1, 1,
-1.12336, 1.48728, 0.8928853, 1, 1, 1, 1, 1,
-1.122585, -0.5393013, -2.234064, 1, 1, 1, 1, 1,
-1.121816, 0.5839115, 0.05619501, 1, 1, 1, 1, 1,
-1.121506, 2.43183, 0.03845697, 1, 1, 1, 1, 1,
-1.10916, -0.6111642, -4.335018, 1, 1, 1, 1, 1,
-1.100119, -0.1926426, -0.9260762, 1, 1, 1, 1, 1,
-1.091031, 0.3766, -2.506568, 0, 0, 1, 1, 1,
-1.084049, -0.2412517, -0.8456687, 1, 0, 0, 1, 1,
-1.056109, 0.7843224, -1.442722, 1, 0, 0, 1, 1,
-1.055724, 0.1910696, -2.497055, 1, 0, 0, 1, 1,
-1.055558, -1.488616, -3.487256, 1, 0, 0, 1, 1,
-1.04991, -0.8128628, -1.355162, 1, 0, 0, 1, 1,
-1.048984, -1.009813, -0.7751788, 0, 0, 0, 1, 1,
-1.048972, 0.7632434, -2.229764, 0, 0, 0, 1, 1,
-1.041602, 0.01884022, -0.6546393, 0, 0, 0, 1, 1,
-1.037645, -0.1082447, -0.2615956, 0, 0, 0, 1, 1,
-1.030233, -1.225591, -1.619113, 0, 0, 0, 1, 1,
-1.029973, -1.762534, -2.159768, 0, 0, 0, 1, 1,
-1.029906, -0.9307087, -3.577862, 0, 0, 0, 1, 1,
-1.026626, -0.8470775, -3.207814, 1, 1, 1, 1, 1,
-1.017233, 0.7482826, -0.4163263, 1, 1, 1, 1, 1,
-1.001709, 0.1059351, -2.202656, 1, 1, 1, 1, 1,
-1.000567, -0.7880328, -1.667351, 1, 1, 1, 1, 1,
-0.9895614, 1.022845, -0.2260584, 1, 1, 1, 1, 1,
-0.9838393, -1.372747, -4.073929, 1, 1, 1, 1, 1,
-0.9780099, -0.2614651, -2.4199, 1, 1, 1, 1, 1,
-0.9771016, 0.6027089, -1.43124, 1, 1, 1, 1, 1,
-0.9767205, 0.6375901, -0.4756495, 1, 1, 1, 1, 1,
-0.9727119, -0.6045811, -2.643109, 1, 1, 1, 1, 1,
-0.969762, 0.8562487, -1.107177, 1, 1, 1, 1, 1,
-0.9667903, 0.6331265, -2.775355, 1, 1, 1, 1, 1,
-0.9610844, 0.2328968, -0.1309334, 1, 1, 1, 1, 1,
-0.9568058, 0.4728239, -0.8450586, 1, 1, 1, 1, 1,
-0.9423305, 0.6372209, -1.166975, 1, 1, 1, 1, 1,
-0.9320942, -0.4917977, -2.776043, 0, 0, 1, 1, 1,
-0.925254, 0.009280816, -0.682469, 1, 0, 0, 1, 1,
-0.9226147, 0.2033195, -0.3655761, 1, 0, 0, 1, 1,
-0.9220802, -1.519252, -4.182735, 1, 0, 0, 1, 1,
-0.9166176, 0.9429696, -0.1654842, 1, 0, 0, 1, 1,
-0.916098, 0.1896025, -0.106584, 1, 0, 0, 1, 1,
-0.9134358, 0.7356501, -0.6941622, 0, 0, 0, 1, 1,
-0.9131409, 1.720053, 0.1372689, 0, 0, 0, 1, 1,
-0.9122421, -0.1493882, -0.7469817, 0, 0, 0, 1, 1,
-0.9111183, 0.5553052, 0.3212424, 0, 0, 0, 1, 1,
-0.907407, -0.3886786, -2.490723, 0, 0, 0, 1, 1,
-0.8968305, -0.2482298, -1.354764, 0, 0, 0, 1, 1,
-0.8962224, 0.1294123, -1.069683, 0, 0, 0, 1, 1,
-0.8905903, -0.2279899, -1.475426, 1, 1, 1, 1, 1,
-0.8887919, 0.2003475, 1.104159, 1, 1, 1, 1, 1,
-0.8837263, 1.128536, -0.9370965, 1, 1, 1, 1, 1,
-0.8770875, 1.220186, -2.498258, 1, 1, 1, 1, 1,
-0.8723453, 0.6459157, 0.5042471, 1, 1, 1, 1, 1,
-0.8687605, -0.146789, -1.801947, 1, 1, 1, 1, 1,
-0.8679382, 1.943134, -0.04578902, 1, 1, 1, 1, 1,
-0.8658055, -1.83945, -2.414958, 1, 1, 1, 1, 1,
-0.85944, -0.247234, -3.164814, 1, 1, 1, 1, 1,
-0.8586199, -1.303326, -3.219124, 1, 1, 1, 1, 1,
-0.8585988, 1.389574, -0.01963092, 1, 1, 1, 1, 1,
-0.8556026, -1.876357, -3.072196, 1, 1, 1, 1, 1,
-0.8554639, -1.629545, -1.33531, 1, 1, 1, 1, 1,
-0.8416565, -0.5124292, -2.025708, 1, 1, 1, 1, 1,
-0.8340815, -0.4299379, 0.4610966, 1, 1, 1, 1, 1,
-0.8324645, -1.367996, -4.188024, 0, 0, 1, 1, 1,
-0.825376, -0.1516485, -0.9292228, 1, 0, 0, 1, 1,
-0.8219771, 0.6717747, 0.7595819, 1, 0, 0, 1, 1,
-0.8203345, 0.9568714, 0.4922777, 1, 0, 0, 1, 1,
-0.8171291, 0.8285329, -1.841033, 1, 0, 0, 1, 1,
-0.8134894, 1.689003, -1.240976, 1, 0, 0, 1, 1,
-0.8112803, 0.5889671, 0.7427219, 0, 0, 0, 1, 1,
-0.8073731, 0.392472, -1.666183, 0, 0, 0, 1, 1,
-0.8056274, 0.5397478, -0.8490343, 0, 0, 0, 1, 1,
-0.8021122, 1.371702, 0.008664619, 0, 0, 0, 1, 1,
-0.7946727, 0.4967031, -3.099113, 0, 0, 0, 1, 1,
-0.7927738, 0.0326415, -2.240755, 0, 0, 0, 1, 1,
-0.7925028, -0.3580233, -2.340631, 0, 0, 0, 1, 1,
-0.7924455, 0.7169307, -1.71003, 1, 1, 1, 1, 1,
-0.7915811, -0.03100875, -2.004267, 1, 1, 1, 1, 1,
-0.7897227, -1.214641, -3.162033, 1, 1, 1, 1, 1,
-0.7866483, 1.735167, -1.732146, 1, 1, 1, 1, 1,
-0.7854404, -0.9137096, -4.259926, 1, 1, 1, 1, 1,
-0.7854402, 0.02794344, -2.296244, 1, 1, 1, 1, 1,
-0.7831624, -0.4049411, -4.38864, 1, 1, 1, 1, 1,
-0.7770893, -0.642803, -2.820529, 1, 1, 1, 1, 1,
-0.7732627, -1.038756, -3.336586, 1, 1, 1, 1, 1,
-0.7719184, -1.237659, -2.452747, 1, 1, 1, 1, 1,
-0.7709579, 1.274251, -1.637584, 1, 1, 1, 1, 1,
-0.7679375, -0.6136484, -3.277918, 1, 1, 1, 1, 1,
-0.7669895, 0.3089649, -2.728709, 1, 1, 1, 1, 1,
-0.7669629, 0.2354821, -0.08383792, 1, 1, 1, 1, 1,
-0.7659351, 0.4333391, -1.351702, 1, 1, 1, 1, 1,
-0.764522, -0.4690505, -2.43626, 0, 0, 1, 1, 1,
-0.7614828, 0.7969225, 1.186552, 1, 0, 0, 1, 1,
-0.7428145, 0.07326255, -3.166413, 1, 0, 0, 1, 1,
-0.7411169, 1.026416, -0.1255693, 1, 0, 0, 1, 1,
-0.7407528, 0.8559233, 0.3643042, 1, 0, 0, 1, 1,
-0.740669, 0.7707958, -0.9894994, 1, 0, 0, 1, 1,
-0.7331821, 1.616932, -1.256785, 0, 0, 0, 1, 1,
-0.7258362, 1.148326, -1.532758, 0, 0, 0, 1, 1,
-0.7111736, 0.7378051, 0.8033145, 0, 0, 0, 1, 1,
-0.7056581, -0.7841756, -3.004457, 0, 0, 0, 1, 1,
-0.6974954, 2.481211, -2.109875, 0, 0, 0, 1, 1,
-0.6898113, 0.4162854, -0.7304897, 0, 0, 0, 1, 1,
-0.6855716, -1.081428, -2.125303, 0, 0, 0, 1, 1,
-0.6742831, 2.064756, 0.9788037, 1, 1, 1, 1, 1,
-0.6728265, -0.457032, -3.032472, 1, 1, 1, 1, 1,
-0.6721334, -0.3306857, -3.169643, 1, 1, 1, 1, 1,
-0.6720291, 0.7005982, 0.3834388, 1, 1, 1, 1, 1,
-0.6662528, -0.5924768, -2.232806, 1, 1, 1, 1, 1,
-0.6520162, -0.3184589, -0.6390124, 1, 1, 1, 1, 1,
-0.6513222, -0.9425505, -2.2321, 1, 1, 1, 1, 1,
-0.6485224, -0.2303976, -0.6606824, 1, 1, 1, 1, 1,
-0.6481379, 2.345689, 0.6127605, 1, 1, 1, 1, 1,
-0.6473283, -0.01437612, -3.467426, 1, 1, 1, 1, 1,
-0.6472411, -0.6261908, -2.229887, 1, 1, 1, 1, 1,
-0.6405563, -1.40522, -3.674115, 1, 1, 1, 1, 1,
-0.6357958, 1.180201, -0.0261851, 1, 1, 1, 1, 1,
-0.6336291, -0.7093374, -3.292732, 1, 1, 1, 1, 1,
-0.6327245, -0.3301368, -3.298751, 1, 1, 1, 1, 1,
-0.6282677, 1.494819, 1.049714, 0, 0, 1, 1, 1,
-0.6251069, 0.5639602, -2.899929, 1, 0, 0, 1, 1,
-0.624873, 0.3208098, -1.575295, 1, 0, 0, 1, 1,
-0.6226762, -2.260862, -3.52289, 1, 0, 0, 1, 1,
-0.6211521, 1.805281, 0.1088525, 1, 0, 0, 1, 1,
-0.6171536, 0.6810755, -0.8029561, 1, 0, 0, 1, 1,
-0.6165753, 0.4943808, -1.389986, 0, 0, 0, 1, 1,
-0.6165151, -0.9804965, -2.675865, 0, 0, 0, 1, 1,
-0.6158266, 2.466627, -1.318151, 0, 0, 0, 1, 1,
-0.6094989, -0.5600564, -1.868327, 0, 0, 0, 1, 1,
-0.6083366, -0.5786049, -3.036564, 0, 0, 0, 1, 1,
-0.6082817, 0.8031808, -0.005372897, 0, 0, 0, 1, 1,
-0.6050977, 0.8119431, -0.393959, 0, 0, 0, 1, 1,
-0.6021087, 0.3807468, -0.009477865, 1, 1, 1, 1, 1,
-0.6019884, 1.470354, -1.419179, 1, 1, 1, 1, 1,
-0.6011751, -1.37831, -2.941005, 1, 1, 1, 1, 1,
-0.5974433, -0.3466728, -0.203281, 1, 1, 1, 1, 1,
-0.5966752, 0.2284149, -2.411123, 1, 1, 1, 1, 1,
-0.5959332, 0.8927521, -1.678874, 1, 1, 1, 1, 1,
-0.5878941, -0.189279, -1.360725, 1, 1, 1, 1, 1,
-0.5871631, 1.499449, -0.04485157, 1, 1, 1, 1, 1,
-0.5867344, -0.9526146, -2.419826, 1, 1, 1, 1, 1,
-0.5865098, 0.751177, -0.8620712, 1, 1, 1, 1, 1,
-0.5862922, -0.6187129, -0.9863082, 1, 1, 1, 1, 1,
-0.5853305, -0.541505, -1.128042, 1, 1, 1, 1, 1,
-0.5842079, 0.6983624, 0.5768684, 1, 1, 1, 1, 1,
-0.5789736, 1.205608, -0.1445963, 1, 1, 1, 1, 1,
-0.5776995, -0.3544078, -2.457048, 1, 1, 1, 1, 1,
-0.575292, -0.1337165, -2.18334, 0, 0, 1, 1, 1,
-0.5705037, -0.2372461, -1.562496, 1, 0, 0, 1, 1,
-0.5685313, -1.402834, -1.928761, 1, 0, 0, 1, 1,
-0.5674055, -2.091101, -3.358983, 1, 0, 0, 1, 1,
-0.562566, 1.024452, 0.1631506, 1, 0, 0, 1, 1,
-0.5528082, -1.59874, -2.645165, 1, 0, 0, 1, 1,
-0.5510851, -1.236589, -2.762338, 0, 0, 0, 1, 1,
-0.5494488, -0.2822623, -1.769507, 0, 0, 0, 1, 1,
-0.5484302, 1.291841, -0.2175507, 0, 0, 0, 1, 1,
-0.5479953, 0.02757174, -0.6986361, 0, 0, 0, 1, 1,
-0.5459055, -1.732765, -1.751762, 0, 0, 0, 1, 1,
-0.5438577, -0.6994538, -1.538533, 0, 0, 0, 1, 1,
-0.5424603, -0.1713097, -2.697524, 0, 0, 0, 1, 1,
-0.5365233, -1.335451, -0.906767, 1, 1, 1, 1, 1,
-0.5353965, -0.3121355, -3.552241, 1, 1, 1, 1, 1,
-0.5333711, 0.5039495, -2.570184, 1, 1, 1, 1, 1,
-0.5329619, -0.2774428, -2.708935, 1, 1, 1, 1, 1,
-0.5328085, -0.613889, -2.293069, 1, 1, 1, 1, 1,
-0.532073, 1.240243, 1.305841, 1, 1, 1, 1, 1,
-0.5295015, -1.435491, -3.493134, 1, 1, 1, 1, 1,
-0.5290843, -0.4505717, -3.638872, 1, 1, 1, 1, 1,
-0.5285626, -0.08785079, -1.293725, 1, 1, 1, 1, 1,
-0.5284659, 0.5259755, -2.565279, 1, 1, 1, 1, 1,
-0.5224341, -0.9030618, -2.370895, 1, 1, 1, 1, 1,
-0.5170889, -0.4116719, -2.023232, 1, 1, 1, 1, 1,
-0.5169991, -0.2593157, -3.40899, 1, 1, 1, 1, 1,
-0.5157135, 0.9245699, -0.5088942, 1, 1, 1, 1, 1,
-0.5098006, -3.467428, -3.738955, 1, 1, 1, 1, 1,
-0.5068012, 0.2806649, -1.56375, 0, 0, 1, 1, 1,
-0.5042938, 0.5834426, -0.9712681, 1, 0, 0, 1, 1,
-0.5002242, 1.704011, 0.352581, 1, 0, 0, 1, 1,
-0.4980296, 0.9337242, -0.6262187, 1, 0, 0, 1, 1,
-0.4974403, 1.128467, 0.3062122, 1, 0, 0, 1, 1,
-0.4973967, 1.678051, 0.9260157, 1, 0, 0, 1, 1,
-0.4961404, 0.0578776, -3.835685, 0, 0, 0, 1, 1,
-0.4896528, -1.40166, -2.401814, 0, 0, 0, 1, 1,
-0.4891804, 0.6967708, -0.4264144, 0, 0, 0, 1, 1,
-0.4889594, -2.177473, -3.983358, 0, 0, 0, 1, 1,
-0.4865712, 0.7393935, -2.611446, 0, 0, 0, 1, 1,
-0.4796813, 0.001362637, -0.6194793, 0, 0, 0, 1, 1,
-0.4794004, -0.2624006, -0.9046437, 0, 0, 0, 1, 1,
-0.4766402, -1.614272, -1.908643, 1, 1, 1, 1, 1,
-0.4701926, -0.5250072, -2.401628, 1, 1, 1, 1, 1,
-0.469248, 0.4276687, -1.201563, 1, 1, 1, 1, 1,
-0.467378, 0.8176453, 0.7818938, 1, 1, 1, 1, 1,
-0.4657323, -2.116947, -2.308632, 1, 1, 1, 1, 1,
-0.4650466, -1.017137, -3.407444, 1, 1, 1, 1, 1,
-0.4630342, -1.946527, -4.670219, 1, 1, 1, 1, 1,
-0.4584301, -1.482431, -2.598255, 1, 1, 1, 1, 1,
-0.4547243, -1.593101, -2.642274, 1, 1, 1, 1, 1,
-0.4545579, -0.3358035, -1.55556, 1, 1, 1, 1, 1,
-0.4456443, 1.892387, -1.321998, 1, 1, 1, 1, 1,
-0.4415791, 0.2183701, -1.864406, 1, 1, 1, 1, 1,
-0.4335876, -1.177628, -3.286065, 1, 1, 1, 1, 1,
-0.4328929, -0.6952065, -2.858433, 1, 1, 1, 1, 1,
-0.4307244, -0.6176366, -2.452662, 1, 1, 1, 1, 1,
-0.428116, 0.9177064, -1.331675, 0, 0, 1, 1, 1,
-0.4269968, -0.2074854, -1.322987, 1, 0, 0, 1, 1,
-0.4245587, 0.8942068, 0.7942152, 1, 0, 0, 1, 1,
-0.4178567, 0.0006472492, -2.533786, 1, 0, 0, 1, 1,
-0.4137821, 0.613376, 0.3493326, 1, 0, 0, 1, 1,
-0.4105667, -0.7837303, -2.658489, 1, 0, 0, 1, 1,
-0.4063629, -1.763759, -2.841312, 0, 0, 0, 1, 1,
-0.4059415, 1.968525, -0.7045573, 0, 0, 0, 1, 1,
-0.4054681, 0.5080419, -0.7961119, 0, 0, 0, 1, 1,
-0.4029718, 0.778712, -0.7982489, 0, 0, 0, 1, 1,
-0.4026865, 0.9851801, -0.1652323, 0, 0, 0, 1, 1,
-0.4023371, -1.663884, -1.667362, 0, 0, 0, 1, 1,
-0.3978852, 0.748457, -0.145813, 0, 0, 0, 1, 1,
-0.3966104, 1.114523, -0.6462412, 1, 1, 1, 1, 1,
-0.3962899, -1.769285, -2.664521, 1, 1, 1, 1, 1,
-0.3942193, -0.02673153, -1.635284, 1, 1, 1, 1, 1,
-0.39094, -1.275418, -2.220603, 1, 1, 1, 1, 1,
-0.389519, -1.706445, -3.765462, 1, 1, 1, 1, 1,
-0.3876952, 0.3558328, -1.239078, 1, 1, 1, 1, 1,
-0.3871279, -2.476472, -0.6766833, 1, 1, 1, 1, 1,
-0.3870624, 1.144725, 1.098049, 1, 1, 1, 1, 1,
-0.3859266, 0.2169244, -1.518558, 1, 1, 1, 1, 1,
-0.384616, 0.8648605, 0.7429494, 1, 1, 1, 1, 1,
-0.3805424, -1.331255, -3.445426, 1, 1, 1, 1, 1,
-0.3799798, 1.141713, 0.4017936, 1, 1, 1, 1, 1,
-0.3764198, -2.55632, -6.044396, 1, 1, 1, 1, 1,
-0.3740005, -0.8971645, -2.643332, 1, 1, 1, 1, 1,
-0.3722526, 0.920073, -0.8757291, 1, 1, 1, 1, 1,
-0.3702014, 0.5885166, -0.2008199, 0, 0, 1, 1, 1,
-0.3634591, -2.750136, -3.928634, 1, 0, 0, 1, 1,
-0.3592928, 0.1049367, -0.3825614, 1, 0, 0, 1, 1,
-0.3575652, -0.08701079, -1.47621, 1, 0, 0, 1, 1,
-0.3551252, 0.4486621, -0.3207951, 1, 0, 0, 1, 1,
-0.3496193, 0.0320091, -2.110108, 1, 0, 0, 1, 1,
-0.3453798, -0.2128637, -2.686228, 0, 0, 0, 1, 1,
-0.3439685, 0.8192694, 0.3085578, 0, 0, 0, 1, 1,
-0.3385003, -0.08773291, -1.822446, 0, 0, 0, 1, 1,
-0.3357804, 1.221261, -0.2391253, 0, 0, 0, 1, 1,
-0.3327814, 1.514244, 0.895582, 0, 0, 0, 1, 1,
-0.3317708, 1.557448, -0.994339, 0, 0, 0, 1, 1,
-0.3240712, -0.07875571, -2.107961, 0, 0, 0, 1, 1,
-0.322294, 0.2802595, -0.07646358, 1, 1, 1, 1, 1,
-0.3214707, -2.656524, -2.393101, 1, 1, 1, 1, 1,
-0.3112405, -1.105803, -2.794661, 1, 1, 1, 1, 1,
-0.3077573, -0.7087558, -1.418222, 1, 1, 1, 1, 1,
-0.3059095, -0.3866349, -0.9503971, 1, 1, 1, 1, 1,
-0.3032223, 0.7108786, 1.693939, 1, 1, 1, 1, 1,
-0.3005729, 0.8785082, -1.616379, 1, 1, 1, 1, 1,
-0.2995355, 0.6209414, -2.126397, 1, 1, 1, 1, 1,
-0.2978129, 1.149869, -0.8926544, 1, 1, 1, 1, 1,
-0.2951176, 1.481579, -1.145579, 1, 1, 1, 1, 1,
-0.2947365, 0.9317087, -0.6489803, 1, 1, 1, 1, 1,
-0.2923268, -0.09531938, -2.487947, 1, 1, 1, 1, 1,
-0.2919328, -1.027305, -4.246689, 1, 1, 1, 1, 1,
-0.2908617, 0.2161414, -0.6493794, 1, 1, 1, 1, 1,
-0.2881513, 0.6064283, -0.3620033, 1, 1, 1, 1, 1,
-0.2850866, -0.7100742, -2.456853, 0, 0, 1, 1, 1,
-0.2809879, 0.2171973, -1.047657, 1, 0, 0, 1, 1,
-0.2788754, -2.755549, -1.304791, 1, 0, 0, 1, 1,
-0.2681157, 1.571205, -1.655982, 1, 0, 0, 1, 1,
-0.2668605, 1.468777, -0.183781, 1, 0, 0, 1, 1,
-0.264699, -0.9187402, -2.536975, 1, 0, 0, 1, 1,
-0.2646013, 1.922983, -0.2025883, 0, 0, 0, 1, 1,
-0.2645303, 1.455637, -0.02099369, 0, 0, 0, 1, 1,
-0.2551527, 0.7585264, -1.036658, 0, 0, 0, 1, 1,
-0.2530919, 0.5215399, 0.8882255, 0, 0, 0, 1, 1,
-0.2529254, -2.342195, -2.088042, 0, 0, 0, 1, 1,
-0.2453381, -1.25732, -1.949268, 0, 0, 0, 1, 1,
-0.2427379, 0.03848302, -2.427944, 0, 0, 0, 1, 1,
-0.241895, -0.4677165, -1.028565, 1, 1, 1, 1, 1,
-0.233699, 2.622329, 0.09493219, 1, 1, 1, 1, 1,
-0.2316865, -0.1654944, -1.164724, 1, 1, 1, 1, 1,
-0.2304482, 0.3800323, 0.5006017, 1, 1, 1, 1, 1,
-0.2296124, -0.2475677, -0.8638114, 1, 1, 1, 1, 1,
-0.2287138, -1.088148, -3.397571, 1, 1, 1, 1, 1,
-0.2248963, 2.105665, -0.2571547, 1, 1, 1, 1, 1,
-0.2240744, -0.2160895, -2.706986, 1, 1, 1, 1, 1,
-0.2235633, 0.7334648, 0.8616148, 1, 1, 1, 1, 1,
-0.22205, 0.1240352, 0.09118564, 1, 1, 1, 1, 1,
-0.2193255, 0.1061618, -0.1880621, 1, 1, 1, 1, 1,
-0.2167028, -1.301611, -2.765654, 1, 1, 1, 1, 1,
-0.2156646, 1.206243, 0.1314342, 1, 1, 1, 1, 1,
-0.2150156, -1.740873, -1.842794, 1, 1, 1, 1, 1,
-0.2139599, -1.808506, -3.512186, 1, 1, 1, 1, 1,
-0.2124324, -0.2422668, -2.646319, 0, 0, 1, 1, 1,
-0.2104713, 1.120776, -1.987502, 1, 0, 0, 1, 1,
-0.2100409, -1.032495, -2.989064, 1, 0, 0, 1, 1,
-0.2035383, 2.45193, 0.693225, 1, 0, 0, 1, 1,
-0.198116, 0.2338275, -2.48722, 1, 0, 0, 1, 1,
-0.1958527, 1.118627, -1.245901, 1, 0, 0, 1, 1,
-0.1952215, 0.2041991, -0.09023654, 0, 0, 0, 1, 1,
-0.19517, -0.1093851, -3.006114, 0, 0, 0, 1, 1,
-0.1950567, -0.6315381, -4.443736, 0, 0, 0, 1, 1,
-0.1945754, -0.942486, -3.435315, 0, 0, 0, 1, 1,
-0.1928079, -0.4859665, -1.843395, 0, 0, 0, 1, 1,
-0.1905769, 0.7062593, 0.02376746, 0, 0, 0, 1, 1,
-0.1902119, -0.3382242, -4.330193, 0, 0, 0, 1, 1,
-0.1892017, -1.15291, -2.717521, 1, 1, 1, 1, 1,
-0.1888918, -0.4914117, -2.947383, 1, 1, 1, 1, 1,
-0.1851954, 2.403227, 1.157589, 1, 1, 1, 1, 1,
-0.1840701, -0.7319492, -1.902205, 1, 1, 1, 1, 1,
-0.1745877, 0.5106321, 0.3626016, 1, 1, 1, 1, 1,
-0.1736984, -1.616522, -1.423649, 1, 1, 1, 1, 1,
-0.1696513, -0.6887202, -4.570218, 1, 1, 1, 1, 1,
-0.1659227, 0.9589337, -0.51071, 1, 1, 1, 1, 1,
-0.1643578, -0.5561539, -2.239236, 1, 1, 1, 1, 1,
-0.1605459, -0.9553093, -2.819164, 1, 1, 1, 1, 1,
-0.1574268, 0.006047273, -1.56009, 1, 1, 1, 1, 1,
-0.1404183, 0.3503889, 0.2769756, 1, 1, 1, 1, 1,
-0.1391146, -1.937499, -2.667388, 1, 1, 1, 1, 1,
-0.1306636, -0.8253405, -4.330355, 1, 1, 1, 1, 1,
-0.1265001, 1.384279, 0.5451467, 1, 1, 1, 1, 1,
-0.1221538, 0.6318557, 0.3109773, 0, 0, 1, 1, 1,
-0.1216695, -0.1969682, -2.235028, 1, 0, 0, 1, 1,
-0.1214244, -1.403973, -2.319592, 1, 0, 0, 1, 1,
-0.1206616, -0.5663989, -4.234765, 1, 0, 0, 1, 1,
-0.1203419, -0.1447109, -1.789651, 1, 0, 0, 1, 1,
-0.1190741, 2.023065, -0.8356341, 1, 0, 0, 1, 1,
-0.1187559, -2.050745, -3.655471, 0, 0, 0, 1, 1,
-0.1119157, 0.1003605, -1.988994, 0, 0, 0, 1, 1,
-0.1086427, 0.4001988, -1.080395, 0, 0, 0, 1, 1,
-0.102858, 1.08014, 1.130929, 0, 0, 0, 1, 1,
-0.09881811, -0.4097756, -2.108806, 0, 0, 0, 1, 1,
-0.09870151, 0.02177427, -3.182463, 0, 0, 0, 1, 1,
-0.09810869, 1.207027, -1.510834, 0, 0, 0, 1, 1,
-0.09756931, 1.422524, -0.4099059, 1, 1, 1, 1, 1,
-0.09628213, -0.2364036, -2.100113, 1, 1, 1, 1, 1,
-0.09568956, -0.06493635, -1.482425, 1, 1, 1, 1, 1,
-0.08828029, -1.547609, -4.34067, 1, 1, 1, 1, 1,
-0.08540037, -0.3519371, -2.926202, 1, 1, 1, 1, 1,
-0.08502486, -2.098941, -2.710347, 1, 1, 1, 1, 1,
-0.0830332, -1.100371, -3.23604, 1, 1, 1, 1, 1,
-0.08033129, -0.9229912, -3.480336, 1, 1, 1, 1, 1,
-0.07827834, -0.9841955, -4.260968, 1, 1, 1, 1, 1,
-0.07787399, -1.408845, -2.916823, 1, 1, 1, 1, 1,
-0.07770769, 2.231335, -1.095323, 1, 1, 1, 1, 1,
-0.07431634, -1.119793, -3.086497, 1, 1, 1, 1, 1,
-0.07122561, 0.2116128, 2.432156, 1, 1, 1, 1, 1,
-0.06830808, -0.2020255, -2.066652, 1, 1, 1, 1, 1,
-0.06711616, 0.803448, -1.489865, 1, 1, 1, 1, 1,
-0.06296938, 0.1263985, 0.1077705, 0, 0, 1, 1, 1,
-0.05642866, -1.414389, -1.544811, 1, 0, 0, 1, 1,
-0.05613579, 1.056067, -1.010162, 1, 0, 0, 1, 1,
-0.05362523, 0.4613435, -1.042049, 1, 0, 0, 1, 1,
-0.05229156, -1.278525, -3.953991, 1, 0, 0, 1, 1,
-0.05119683, 0.6087736, 0.8074313, 1, 0, 0, 1, 1,
-0.05040318, 2.401818, -0.5737748, 0, 0, 0, 1, 1,
-0.04292117, -0.2468247, -1.931627, 0, 0, 0, 1, 1,
-0.04129792, -0.16583, -4.335293, 0, 0, 0, 1, 1,
-0.0393648, 2.39541, -0.1981412, 0, 0, 0, 1, 1,
-0.03480553, -1.052201, -3.611652, 0, 0, 0, 1, 1,
-0.03347888, -0.5765609, -3.876853, 0, 0, 0, 1, 1,
-0.03225654, 2.038609, -0.3435846, 0, 0, 0, 1, 1,
-0.03191701, -1.025255, -1.801643, 1, 1, 1, 1, 1,
-0.03137954, 2.686539, -0.6871825, 1, 1, 1, 1, 1,
-0.03007959, 2.200391, -0.4669807, 1, 1, 1, 1, 1,
-0.02810943, -1.057948, -3.539172, 1, 1, 1, 1, 1,
-0.02743408, -1.471773, -3.787901, 1, 1, 1, 1, 1,
-0.02522503, -0.3716585, -3.180686, 1, 1, 1, 1, 1,
-0.01902589, 0.4513035, 0.7688436, 1, 1, 1, 1, 1,
-0.01549838, 1.168385, 0.630964, 1, 1, 1, 1, 1,
-0.01179032, -0.2378016, -2.30252, 1, 1, 1, 1, 1,
-0.01128359, -1.110875, -2.396191, 1, 1, 1, 1, 1,
-0.00924015, 0.2238857, 0.7673884, 1, 1, 1, 1, 1,
-0.009184822, -0.03538596, -2.229434, 1, 1, 1, 1, 1,
-0.001170713, 1.187365, -0.6283789, 1, 1, 1, 1, 1,
-0.0001155847, -0.00537106, -3.567543, 1, 1, 1, 1, 1,
0.0004066376, 0.1838847, 0.1889505, 1, 1, 1, 1, 1,
0.002436411, -0.3235257, 3.109669, 0, 0, 1, 1, 1,
0.002455714, -1.696586, 3.484913, 1, 0, 0, 1, 1,
0.008932029, 0.4423316, -0.9243397, 1, 0, 0, 1, 1,
0.01260798, -0.8897715, 1.597428, 1, 0, 0, 1, 1,
0.01269659, 0.09057625, 0.1128069, 1, 0, 0, 1, 1,
0.01391634, 1.308124, 0.313925, 1, 0, 0, 1, 1,
0.01736394, 0.7234151, -0.4704735, 0, 0, 0, 1, 1,
0.01809131, -0.9510436, 3.811615, 0, 0, 0, 1, 1,
0.01892493, 1.651624, -0.0754636, 0, 0, 0, 1, 1,
0.0229869, -0.6776399, 5.321649, 0, 0, 0, 1, 1,
0.02457926, 0.2373118, 0.4919432, 0, 0, 0, 1, 1,
0.02918005, 0.3332797, -0.4570753, 0, 0, 0, 1, 1,
0.02925923, -0.7277613, 3.966853, 0, 0, 0, 1, 1,
0.03272062, -0.8539137, 5.922052, 1, 1, 1, 1, 1,
0.03366722, -0.4798319, 5.093791, 1, 1, 1, 1, 1,
0.03459553, -1.313276, 2.949381, 1, 1, 1, 1, 1,
0.03775286, -0.1358143, 1.376568, 1, 1, 1, 1, 1,
0.04024845, 0.4505543, -0.6059735, 1, 1, 1, 1, 1,
0.04208744, 0.06589577, -0.5317011, 1, 1, 1, 1, 1,
0.04357519, 0.4085842, 1.425596, 1, 1, 1, 1, 1,
0.04431755, 1.046516, 1.421955, 1, 1, 1, 1, 1,
0.04815452, -1.273106, 2.471621, 1, 1, 1, 1, 1,
0.05024073, 0.2245968, -0.3779843, 1, 1, 1, 1, 1,
0.05227981, -0.1435248, 1.594322, 1, 1, 1, 1, 1,
0.05243412, -0.01740931, 0.5361229, 1, 1, 1, 1, 1,
0.0566034, -0.1387563, 3.187174, 1, 1, 1, 1, 1,
0.06054758, 0.1177807, -0.6947373, 1, 1, 1, 1, 1,
0.0608445, -1.304954, 4.173024, 1, 1, 1, 1, 1,
0.06262767, -1.098896, 2.822831, 0, 0, 1, 1, 1,
0.06405295, -0.7618858, 2.573355, 1, 0, 0, 1, 1,
0.06413584, -1.060927, 2.009478, 1, 0, 0, 1, 1,
0.06994057, -0.426643, 3.015587, 1, 0, 0, 1, 1,
0.07248224, -0.07122, 1.973996, 1, 0, 0, 1, 1,
0.07649303, 0.7106841, -1.450773, 1, 0, 0, 1, 1,
0.07809632, -1.188726, 1.035446, 0, 0, 0, 1, 1,
0.08162922, -0.1572549, 1.9964, 0, 0, 0, 1, 1,
0.08575951, 0.5732508, 0.5354071, 0, 0, 0, 1, 1,
0.0880192, -0.8412037, 2.921858, 0, 0, 0, 1, 1,
0.08819818, -0.1143664, 1.777937, 0, 0, 0, 1, 1,
0.0884018, -1.184299, 4.405845, 0, 0, 0, 1, 1,
0.09187002, -2.775886, 3.025138, 0, 0, 0, 1, 1,
0.09223837, -2.11775, 2.906331, 1, 1, 1, 1, 1,
0.09420316, -0.3339019, 3.689703, 1, 1, 1, 1, 1,
0.09488959, -1.336146, 2.399657, 1, 1, 1, 1, 1,
0.09718461, 1.272166, -1.133793, 1, 1, 1, 1, 1,
0.1018145, 0.6350327, -0.4111498, 1, 1, 1, 1, 1,
0.1026529, 1.116153, -1.888125, 1, 1, 1, 1, 1,
0.1072088, 1.920756, 0.3695313, 1, 1, 1, 1, 1,
0.1074519, -0.1757038, 1.631751, 1, 1, 1, 1, 1,
0.1114835, 0.2300342, 0.526251, 1, 1, 1, 1, 1,
0.1152935, 0.08010643, -0.40957, 1, 1, 1, 1, 1,
0.1155675, 0.3024672, 1.913896, 1, 1, 1, 1, 1,
0.1178213, 0.1501177, 0.2659053, 1, 1, 1, 1, 1,
0.1199348, 0.7130583, -1.33976, 1, 1, 1, 1, 1,
0.1210819, -1.371696, 2.640887, 1, 1, 1, 1, 1,
0.121927, -0.8251696, 1.031066, 1, 1, 1, 1, 1,
0.1223686, 1.152675, -0.9462535, 0, 0, 1, 1, 1,
0.1241066, -1.06169, 3.144837, 1, 0, 0, 1, 1,
0.1326048, 0.15425, 1.300228, 1, 0, 0, 1, 1,
0.1332764, 0.1812721, 1.02921, 1, 0, 0, 1, 1,
0.1337644, 0.5948234, -0.5226792, 1, 0, 0, 1, 1,
0.1383329, 1.588514, -1.221811, 1, 0, 0, 1, 1,
0.1384468, -0.6533627, 2.728831, 0, 0, 0, 1, 1,
0.1392463, 0.141134, 1.800777, 0, 0, 0, 1, 1,
0.1409192, 1.2272, -1.414939, 0, 0, 0, 1, 1,
0.145412, 0.8856682, -1.244453, 0, 0, 0, 1, 1,
0.1507245, -0.4226364, 2.160981, 0, 0, 0, 1, 1,
0.1539122, 1.282545, -0.4700567, 0, 0, 0, 1, 1,
0.1639649, 0.1570878, 2.233481, 0, 0, 0, 1, 1,
0.1666327, -0.0413634, 3.142891, 1, 1, 1, 1, 1,
0.1719115, -1.084351, 2.863856, 1, 1, 1, 1, 1,
0.172265, -0.4491936, 1.156997, 1, 1, 1, 1, 1,
0.1743562, -0.5676981, 2.022496, 1, 1, 1, 1, 1,
0.1785821, -0.1068082, 1.547829, 1, 1, 1, 1, 1,
0.1869097, 0.2337307, 0.5568628, 1, 1, 1, 1, 1,
0.2038233, -1.716339, 2.379972, 1, 1, 1, 1, 1,
0.2040506, -0.3814251, 3.717275, 1, 1, 1, 1, 1,
0.2065448, 2.445323, -0.9522089, 1, 1, 1, 1, 1,
0.2069368, 2.155837, 1.235109, 1, 1, 1, 1, 1,
0.2101925, -1.500292, 1.431557, 1, 1, 1, 1, 1,
0.2104686, 0.7929361, -0.1548796, 1, 1, 1, 1, 1,
0.2126668, -0.7930843, 3.026664, 1, 1, 1, 1, 1,
0.2140262, -0.05429405, 2.15432, 1, 1, 1, 1, 1,
0.2168896, 1.176683, 2.185731, 1, 1, 1, 1, 1,
0.2178852, -0.0962602, 2.479315, 0, 0, 1, 1, 1,
0.2209064, -0.2419822, 2.900763, 1, 0, 0, 1, 1,
0.2272018, 0.1740962, 2.625707, 1, 0, 0, 1, 1,
0.2272577, 1.247941, 1.316642, 1, 0, 0, 1, 1,
0.2284828, -1.597633, 2.359415, 1, 0, 0, 1, 1,
0.2318744, 0.5482215, 0.1867833, 1, 0, 0, 1, 1,
0.2357373, 0.8120859, 1.440133, 0, 0, 0, 1, 1,
0.2383907, -2.106637, 3.0908, 0, 0, 0, 1, 1,
0.2387019, 0.05490194, 2.65773, 0, 0, 0, 1, 1,
0.2466669, -2.971462, 1.989132, 0, 0, 0, 1, 1,
0.2526432, -0.5005499, 4.09268, 0, 0, 0, 1, 1,
0.2541401, 0.6860291, -0.5444248, 0, 0, 0, 1, 1,
0.254765, -0.4440919, 2.741237, 0, 0, 0, 1, 1,
0.2596922, -0.6586468, 4.141544, 1, 1, 1, 1, 1,
0.2609346, -0.09850847, 2.657125, 1, 1, 1, 1, 1,
0.26245, 1.386838, 1.443015, 1, 1, 1, 1, 1,
0.2638468, 0.02002377, 2.096095, 1, 1, 1, 1, 1,
0.2685586, 0.09911262, 0.3384871, 1, 1, 1, 1, 1,
0.2692509, 1.023317, -0.4510866, 1, 1, 1, 1, 1,
0.2713092, 1.530999, 1.2314, 1, 1, 1, 1, 1,
0.2713406, 0.2186537, 0.653075, 1, 1, 1, 1, 1,
0.2716089, -0.02789461, 1.575988, 1, 1, 1, 1, 1,
0.2724479, -0.240073, 1.57753, 1, 1, 1, 1, 1,
0.2762155, 2.580675, 0.9795529, 1, 1, 1, 1, 1,
0.2787966, -1.446258, 4.661685, 1, 1, 1, 1, 1,
0.2812191, -0.2681384, 1.723527, 1, 1, 1, 1, 1,
0.2816323, 0.4995502, 0.1691544, 1, 1, 1, 1, 1,
0.2816671, -0.7239864, 2.740024, 1, 1, 1, 1, 1,
0.2837126, 0.6751457, 0.6219828, 0, 0, 1, 1, 1,
0.2841266, 2.396035, 0.02427382, 1, 0, 0, 1, 1,
0.2868164, 0.9010514, -0.4605058, 1, 0, 0, 1, 1,
0.2935324, 0.9527181, 0.09021509, 1, 0, 0, 1, 1,
0.2938612, 0.2227826, -0.0304025, 1, 0, 0, 1, 1,
0.3042687, 0.3516384, 1.045071, 1, 0, 0, 1, 1,
0.3065065, -0.4983846, 2.9494, 0, 0, 0, 1, 1,
0.3075162, 1.4322, -0.3478724, 0, 0, 0, 1, 1,
0.312894, -1.243168, 1.143748, 0, 0, 0, 1, 1,
0.3132175, 0.0394621, 0.6015192, 0, 0, 0, 1, 1,
0.3148813, 0.2860001, 0.05944375, 0, 0, 0, 1, 1,
0.3152691, -0.4076023, 2.67453, 0, 0, 0, 1, 1,
0.3164611, -0.1135279, 1.093182, 0, 0, 0, 1, 1,
0.31772, -1.517813, 5.758676, 1, 1, 1, 1, 1,
0.3241424, 1.498719, -1.859255, 1, 1, 1, 1, 1,
0.3248929, -1.233674, 1.094868, 1, 1, 1, 1, 1,
0.3259144, 0.5552654, 0.6027293, 1, 1, 1, 1, 1,
0.3311061, -1.772923, 2.415006, 1, 1, 1, 1, 1,
0.331981, 0.2555039, 0.6750827, 1, 1, 1, 1, 1,
0.332441, 0.9757469, 0.7054528, 1, 1, 1, 1, 1,
0.3329985, 0.6210069, 0.6583756, 1, 1, 1, 1, 1,
0.3336549, -0.009587842, 1.743423, 1, 1, 1, 1, 1,
0.3358257, -0.1636452, 2.579193, 1, 1, 1, 1, 1,
0.3420128, -0.414831, 3.387115, 1, 1, 1, 1, 1,
0.3441799, 1.5856, -1.141978, 1, 1, 1, 1, 1,
0.3457579, 2.091835, 0.3214892, 1, 1, 1, 1, 1,
0.3491662, 0.5851493, -1.39737, 1, 1, 1, 1, 1,
0.3529643, -1.246676, 0.4489061, 1, 1, 1, 1, 1,
0.3540814, 0.8114154, 0.2733419, 0, 0, 1, 1, 1,
0.3574113, 2.035303, 1.784106, 1, 0, 0, 1, 1,
0.3575571, 1.463808, 0.4896683, 1, 0, 0, 1, 1,
0.3589266, 2.234472, 0.4863855, 1, 0, 0, 1, 1,
0.3661276, -2.177763, 4.33911, 1, 0, 0, 1, 1,
0.3662082, 0.6463122, 1.388741, 1, 0, 0, 1, 1,
0.3671741, -0.8788666, 2.53189, 0, 0, 0, 1, 1,
0.3675463, -1.513059, 2.528534, 0, 0, 0, 1, 1,
0.3679488, -1.249894, 2.474323, 0, 0, 0, 1, 1,
0.3682855, -0.1425544, 1.191758, 0, 0, 0, 1, 1,
0.3687714, -0.6608136, 2.354453, 0, 0, 0, 1, 1,
0.3717304, -0.08428823, 1.880621, 0, 0, 0, 1, 1,
0.3720152, -0.7365662, 2.745466, 0, 0, 0, 1, 1,
0.3786978, 0.5483074, 0.1505327, 1, 1, 1, 1, 1,
0.3794519, -0.7544459, 0.8857154, 1, 1, 1, 1, 1,
0.3802796, -0.6474331, 3.286137, 1, 1, 1, 1, 1,
0.3821394, 0.6570418, 0.08879251, 1, 1, 1, 1, 1,
0.3825677, -0.7555543, 3.098034, 1, 1, 1, 1, 1,
0.3865894, -0.2201633, 1.519969, 1, 1, 1, 1, 1,
0.3912856, 0.1566615, 1.197205, 1, 1, 1, 1, 1,
0.392042, -0.2152739, 2.711437, 1, 1, 1, 1, 1,
0.3959895, -0.1085554, 1.914336, 1, 1, 1, 1, 1,
0.3988356, 0.8382692, 2.360268, 1, 1, 1, 1, 1,
0.4003271, 0.507314, -0.4489876, 1, 1, 1, 1, 1,
0.400565, -0.4289334, 2.979328, 1, 1, 1, 1, 1,
0.4011253, 0.7502372, 1.081554, 1, 1, 1, 1, 1,
0.4090055, -1.616142, 2.552955, 1, 1, 1, 1, 1,
0.4101775, -2.796227, 2.113489, 1, 1, 1, 1, 1,
0.4102645, 1.425145, -0.8811303, 0, 0, 1, 1, 1,
0.4104356, 0.8381754, -0.6620361, 1, 0, 0, 1, 1,
0.4118603, 1.448517, 2.359082, 1, 0, 0, 1, 1,
0.4144305, -0.7937018, 2.65143, 1, 0, 0, 1, 1,
0.4149834, -1.043056, 3.718927, 1, 0, 0, 1, 1,
0.4239912, -0.0559289, 0.6102614, 1, 0, 0, 1, 1,
0.4280928, -0.09566306, 1.541681, 0, 0, 0, 1, 1,
0.4328606, 0.8028014, 0.9608846, 0, 0, 0, 1, 1,
0.4344454, 2.045939, 0.343327, 0, 0, 0, 1, 1,
0.4379201, -0.6998315, 4.490328, 0, 0, 0, 1, 1,
0.4408449, 0.5630975, 0.4625978, 0, 0, 0, 1, 1,
0.4411213, 2.119416, 1.552306, 0, 0, 0, 1, 1,
0.441982, 0.6997908, -1.687466, 0, 0, 0, 1, 1,
0.4447486, 0.4145436, 0.7404373, 1, 1, 1, 1, 1,
0.4471218, 1.115486, 0.887327, 1, 1, 1, 1, 1,
0.4487036, 0.6420952, 0.8255038, 1, 1, 1, 1, 1,
0.4490072, -0.3658458, 3.433329, 1, 1, 1, 1, 1,
0.4490366, -0.577331, 1.305443, 1, 1, 1, 1, 1,
0.4510924, -0.8845012, 2.18169, 1, 1, 1, 1, 1,
0.4522623, -0.0251183, 3.323591, 1, 1, 1, 1, 1,
0.4571043, -0.1486853, 0.8653288, 1, 1, 1, 1, 1,
0.4601003, 1.139734, 1.212297, 1, 1, 1, 1, 1,
0.4610523, -0.488319, 4.005645, 1, 1, 1, 1, 1,
0.4655506, -1.773967, 3.872098, 1, 1, 1, 1, 1,
0.4660609, 1.255588, 1.554466, 1, 1, 1, 1, 1,
0.4661603, -0.8582615, 2.844204, 1, 1, 1, 1, 1,
0.469981, 0.4618119, 1.418455, 1, 1, 1, 1, 1,
0.4714679, 2.252544, -0.4951603, 1, 1, 1, 1, 1,
0.4757924, -0.5094495, 1.188509, 0, 0, 1, 1, 1,
0.4836707, -0.1056533, 0.3827434, 1, 0, 0, 1, 1,
0.4849078, -0.8241007, 2.317236, 1, 0, 0, 1, 1,
0.492449, 0.2750824, 1.441216, 1, 0, 0, 1, 1,
0.4934818, 0.934498, 0.5272417, 1, 0, 0, 1, 1,
0.4972904, 0.08458356, -1.156829, 1, 0, 0, 1, 1,
0.4996432, -0.4975349, 2.491695, 0, 0, 0, 1, 1,
0.5002139, 0.2572379, 2.739954, 0, 0, 0, 1, 1,
0.5060109, -0.1864273, 1.067966, 0, 0, 0, 1, 1,
0.5107028, 0.6796792, 0.9616299, 0, 0, 0, 1, 1,
0.5110665, -1.070588, 1.996519, 0, 0, 0, 1, 1,
0.5190387, 0.8120745, -0.6344613, 0, 0, 0, 1, 1,
0.51955, 0.2754783, 1.800342, 0, 0, 0, 1, 1,
0.5218377, -0.5106423, 2.190175, 1, 1, 1, 1, 1,
0.5246229, -0.004596499, 1.43625, 1, 1, 1, 1, 1,
0.5251703, -0.9367169, 1.941244, 1, 1, 1, 1, 1,
0.5274395, -0.6670768, 3.972029, 1, 1, 1, 1, 1,
0.5278974, 0.3541418, 0.3450156, 1, 1, 1, 1, 1,
0.5293865, -0.8930547, 2.59013, 1, 1, 1, 1, 1,
0.5386086, 0.7758674, 0.6918315, 1, 1, 1, 1, 1,
0.5395999, -0.4108705, 2.278589, 1, 1, 1, 1, 1,
0.5402967, -0.9169364, 2.083173, 1, 1, 1, 1, 1,
0.54668, 1.166909, 0.3450809, 1, 1, 1, 1, 1,
0.547695, 0.7535676, -0.1287135, 1, 1, 1, 1, 1,
0.5511667, -0.7719279, 2.05287, 1, 1, 1, 1, 1,
0.5516863, -0.07321477, 3.100346, 1, 1, 1, 1, 1,
0.5517263, 0.4665706, 0.5787491, 1, 1, 1, 1, 1,
0.5620494, 0.3729002, -0.8528472, 1, 1, 1, 1, 1,
0.5637479, 0.9012433, -0.2669327, 0, 0, 1, 1, 1,
0.566119, 0.6826277, 0.8519811, 1, 0, 0, 1, 1,
0.5801226, 0.2125875, 2.353102, 1, 0, 0, 1, 1,
0.582534, 0.8506228, -0.300634, 1, 0, 0, 1, 1,
0.5839166, 0.4746061, 1.881984, 1, 0, 0, 1, 1,
0.58803, -1.257746, 5.52638, 1, 0, 0, 1, 1,
0.5898154, -2.957127, 2.301313, 0, 0, 0, 1, 1,
0.594471, -0.6975514, 2.155962, 0, 0, 0, 1, 1,
0.5968298, -0.2892738, 3.212974, 0, 0, 0, 1, 1,
0.6009983, 1.147757, 0.9534327, 0, 0, 0, 1, 1,
0.6015565, 0.1387847, 1.24634, 0, 0, 0, 1, 1,
0.6137754, 0.2437335, 1.051804, 0, 0, 0, 1, 1,
0.6140993, 0.3836105, 0.1211476, 0, 0, 0, 1, 1,
0.6164048, 0.07377663, 1.791199, 1, 1, 1, 1, 1,
0.6269897, 0.7629309, -0.1864426, 1, 1, 1, 1, 1,
0.627873, -1.665809, 3.003021, 1, 1, 1, 1, 1,
0.6312792, -0.3454766, 2.884514, 1, 1, 1, 1, 1,
0.632401, 1.159799, 0.9124435, 1, 1, 1, 1, 1,
0.6338857, 0.2322194, 0.6431729, 1, 1, 1, 1, 1,
0.6399527, -1.081858, 4.222864, 1, 1, 1, 1, 1,
0.6421148, 0.9017417, 1.723356, 1, 1, 1, 1, 1,
0.6437466, 0.4046966, 1.52306, 1, 1, 1, 1, 1,
0.6481746, 0.2883429, 0.9011357, 1, 1, 1, 1, 1,
0.6489994, 0.8192163, 0.1119398, 1, 1, 1, 1, 1,
0.6521202, -0.2307795, 1.270735, 1, 1, 1, 1, 1,
0.6603854, -0.3767394, 1.245431, 1, 1, 1, 1, 1,
0.6616477, 0.6018437, 0.1996161, 1, 1, 1, 1, 1,
0.6621317, -0.0507135, 1.908713, 1, 1, 1, 1, 1,
0.6622831, 1.473941, 0.2904234, 0, 0, 1, 1, 1,
0.6693146, 1.331647, 2.159806, 1, 0, 0, 1, 1,
0.6746118, -0.30772, 1.686692, 1, 0, 0, 1, 1,
0.6876907, -0.3505153, 3.2596, 1, 0, 0, 1, 1,
0.6895457, 0.992856, 2.395526, 1, 0, 0, 1, 1,
0.6906513, -0.8120019, 2.820441, 1, 0, 0, 1, 1,
0.6955686, 0.3553604, 0.6159648, 0, 0, 0, 1, 1,
0.7049795, -1.059073, 3.47283, 0, 0, 0, 1, 1,
0.7059032, -0.4964611, 2.840369, 0, 0, 0, 1, 1,
0.7059397, -0.4427696, 0.4643164, 0, 0, 0, 1, 1,
0.70911, -0.6080585, 2.309645, 0, 0, 0, 1, 1,
0.7131837, 0.154115, 2.703312, 0, 0, 0, 1, 1,
0.7142342, -0.7640712, 0.1234184, 0, 0, 0, 1, 1,
0.7179574, 0.8896559, -0.1965685, 1, 1, 1, 1, 1,
0.7241573, 2.013414, 0.6169036, 1, 1, 1, 1, 1,
0.7283708, -1.054077, 4.91186, 1, 1, 1, 1, 1,
0.7333499, -0.02427026, 1.434035, 1, 1, 1, 1, 1,
0.7351938, 1.622414, -0.2977598, 1, 1, 1, 1, 1,
0.7354612, -1.446145, 1.898186, 1, 1, 1, 1, 1,
0.7357985, -1.214664, 2.358961, 1, 1, 1, 1, 1,
0.7370992, -0.2845637, 2.109524, 1, 1, 1, 1, 1,
0.7500167, 0.2257482, 1.67445, 1, 1, 1, 1, 1,
0.750942, 0.4568945, 1.245669, 1, 1, 1, 1, 1,
0.752789, 0.9681554, -0.5351557, 1, 1, 1, 1, 1,
0.7557359, 0.4248249, 0.6964366, 1, 1, 1, 1, 1,
0.7582216, -0.2077857, 3.299071, 1, 1, 1, 1, 1,
0.7590566, -0.05645993, 2.714612, 1, 1, 1, 1, 1,
0.7619132, 0.3541311, 3.981015, 1, 1, 1, 1, 1,
0.7636741, -0.3500451, 2.952674, 0, 0, 1, 1, 1,
0.763958, -0.6965596, 2.130175, 1, 0, 0, 1, 1,
0.7646467, -0.3987344, 1.862817, 1, 0, 0, 1, 1,
0.7658932, 0.8304271, 1.022997, 1, 0, 0, 1, 1,
0.7704279, -1.387778, 1.711971, 1, 0, 0, 1, 1,
0.7720185, -0.7180752, 1.41947, 1, 0, 0, 1, 1,
0.7735401, 0.3506698, 1.011856, 0, 0, 0, 1, 1,
0.7792992, -1.524899, 4.343329, 0, 0, 0, 1, 1,
0.7832511, 1.849199, 0.5160614, 0, 0, 0, 1, 1,
0.7859505, -0.2882165, 2.004365, 0, 0, 0, 1, 1,
0.7990559, -0.2125165, 1.841932, 0, 0, 0, 1, 1,
0.8003902, -1.138645, 3.232333, 0, 0, 0, 1, 1,
0.8004807, 0.5256903, -0.3778808, 0, 0, 0, 1, 1,
0.8082456, -0.2969877, 0.7697446, 1, 1, 1, 1, 1,
0.8176047, 0.1098199, 2.707789, 1, 1, 1, 1, 1,
0.8178587, 0.6992242, 0.6394351, 1, 1, 1, 1, 1,
0.8195925, 0.4393604, 0.7373695, 1, 1, 1, 1, 1,
0.8221341, 0.4119096, 2.417172, 1, 1, 1, 1, 1,
0.8227524, -0.2635246, 2.698447, 1, 1, 1, 1, 1,
0.8284662, -0.8244857, 1.17515, 1, 1, 1, 1, 1,
0.8301708, -0.04695411, 1.16692, 1, 1, 1, 1, 1,
0.8342955, 0.3870129, -0.01573543, 1, 1, 1, 1, 1,
0.8383994, 0.429029, 0.9775146, 1, 1, 1, 1, 1,
0.8397896, -0.3325688, 0.193841, 1, 1, 1, 1, 1,
0.8564646, -0.9511029, 2.094785, 1, 1, 1, 1, 1,
0.8607014, 1.256716, 1.171209, 1, 1, 1, 1, 1,
0.8615876, 0.120167, 1.095085, 1, 1, 1, 1, 1,
0.8626445, 0.5553443, 0.5045844, 1, 1, 1, 1, 1,
0.8678921, -0.3725329, 5.876374, 0, 0, 1, 1, 1,
0.8702205, -1.638737, 3.567529, 1, 0, 0, 1, 1,
0.8703508, -0.4164739, 1.782793, 1, 0, 0, 1, 1,
0.8732204, -0.1534942, 3.302125, 1, 0, 0, 1, 1,
0.8843927, -0.891171, 2.311347, 1, 0, 0, 1, 1,
0.8876079, 2.283, -0.5802553, 1, 0, 0, 1, 1,
0.8896922, 1.388845, -0.1486596, 0, 0, 0, 1, 1,
0.891924, 0.5252479, 2.214588, 0, 0, 0, 1, 1,
0.8950204, 0.07412725, 1.478148, 0, 0, 0, 1, 1,
0.8985677, -1.056975, 1.473664, 0, 0, 0, 1, 1,
0.8994864, 0.4833429, 0.7316003, 0, 0, 0, 1, 1,
0.9025318, -1.577797, 2.765958, 0, 0, 0, 1, 1,
0.9029635, -0.1952967, 2.080306, 0, 0, 0, 1, 1,
0.9037352, -0.3852709, 1.421492, 1, 1, 1, 1, 1,
0.9052288, -1.591071, 0.2848519, 1, 1, 1, 1, 1,
0.9055776, -0.7261157, 1.789131, 1, 1, 1, 1, 1,
0.9128917, -1.885558, 3.734569, 1, 1, 1, 1, 1,
0.9158974, -1.563523, 3.380851, 1, 1, 1, 1, 1,
0.9248215, 0.06672458, 1.840804, 1, 1, 1, 1, 1,
0.9283792, 0.8743564, 1.023368, 1, 1, 1, 1, 1,
0.9303499, 1.417181, -0.4982062, 1, 1, 1, 1, 1,
0.9457033, -1.200181, 3.565139, 1, 1, 1, 1, 1,
0.9561101, -1.053887, -0.02245723, 1, 1, 1, 1, 1,
0.9574195, 1.990337, -0.2546657, 1, 1, 1, 1, 1,
0.9578844, 0.760623, 0.8252345, 1, 1, 1, 1, 1,
0.9670736, -0.3083706, 1.81026, 1, 1, 1, 1, 1,
0.9691049, 0.5086419, -1.415515, 1, 1, 1, 1, 1,
0.9776357, 0.09355738, 2.519059, 1, 1, 1, 1, 1,
0.9833599, -0.2572484, 1.940531, 0, 0, 1, 1, 1,
0.9910812, 1.064668, -0.2253723, 1, 0, 0, 1, 1,
0.9910901, -0.0605132, 3.171039, 1, 0, 0, 1, 1,
0.9925148, 0.6166162, 0.5967664, 1, 0, 0, 1, 1,
1.000585, -0.7228721, 3.482735, 1, 0, 0, 1, 1,
1.003237, -0.3744518, 1.616702, 1, 0, 0, 1, 1,
1.017416, -1.997445, 2.748682, 0, 0, 0, 1, 1,
1.027494, 0.9271582, 0.5718772, 0, 0, 0, 1, 1,
1.031014, 1.616391, 1.255997, 0, 0, 0, 1, 1,
1.031641, -0.08388493, 1.512338, 0, 0, 0, 1, 1,
1.041075, -0.007070456, 1.860831, 0, 0, 0, 1, 1,
1.048006, -1.624087, 1.151834, 0, 0, 0, 1, 1,
1.050179, 2.177047, 1.273383, 0, 0, 0, 1, 1,
1.061697, 2.530733, 0.4636383, 1, 1, 1, 1, 1,
1.073884, 0.1605103, -0.1991377, 1, 1, 1, 1, 1,
1.076848, 0.4367349, 0.6346505, 1, 1, 1, 1, 1,
1.077058, 1.111375, -1.154304, 1, 1, 1, 1, 1,
1.077235, 0.5305213, 0.05352593, 1, 1, 1, 1, 1,
1.078975, 1.005886, 0.6336129, 1, 1, 1, 1, 1,
1.087439, 0.6471309, 0.1544438, 1, 1, 1, 1, 1,
1.096027, 0.06182992, 3.738194, 1, 1, 1, 1, 1,
1.096504, -0.9379228, 3.433747, 1, 1, 1, 1, 1,
1.097289, 0.06556754, 0.7782471, 1, 1, 1, 1, 1,
1.099884, -2.310968, 0.6576571, 1, 1, 1, 1, 1,
1.10055, 0.1032486, 2.256122, 1, 1, 1, 1, 1,
1.118596, -0.8976511, 2.3949, 1, 1, 1, 1, 1,
1.124801, 0.06918412, 0.5441903, 1, 1, 1, 1, 1,
1.131225, 0.7744128, 1.297844, 1, 1, 1, 1, 1,
1.132268, 0.2317567, 1.840671, 0, 0, 1, 1, 1,
1.13308, 0.2351597, 1.100153, 1, 0, 0, 1, 1,
1.135604, 0.09290852, 1.132654, 1, 0, 0, 1, 1,
1.142625, 0.03970241, 1.96593, 1, 0, 0, 1, 1,
1.143134, -1.015856, 2.008982, 1, 0, 0, 1, 1,
1.14371, -2.949631, 3.211366, 1, 0, 0, 1, 1,
1.144598, 0.7296245, 1.118785, 0, 0, 0, 1, 1,
1.151067, -1.383149, 4.032898, 0, 0, 0, 1, 1,
1.152487, -1.508927, 1.470527, 0, 0, 0, 1, 1,
1.16755, -0.2671161, 1.111665, 0, 0, 0, 1, 1,
1.174052, -0.05683965, 0.8334144, 0, 0, 0, 1, 1,
1.175593, -0.4098934, 3.549099, 0, 0, 0, 1, 1,
1.177722, 1.499527, 1.76672, 0, 0, 0, 1, 1,
1.180721, -0.8665569, 3.206839, 1, 1, 1, 1, 1,
1.187898, -1.339289, 0.9523769, 1, 1, 1, 1, 1,
1.19001, 1.447123, 1.286917, 1, 1, 1, 1, 1,
1.190277, 0.04492875, 0.1250723, 1, 1, 1, 1, 1,
1.191992, 0.7919475, 1.519565, 1, 1, 1, 1, 1,
1.194486, -1.188131, 2.940662, 1, 1, 1, 1, 1,
1.200938, 0.3695404, 1.27089, 1, 1, 1, 1, 1,
1.206583, -0.2042968, 2.555663, 1, 1, 1, 1, 1,
1.208348, -1.405343, 2.689741, 1, 1, 1, 1, 1,
1.229204, -0.689855, 1.163093, 1, 1, 1, 1, 1,
1.234885, 0.3373922, 0.1272047, 1, 1, 1, 1, 1,
1.234942, 1.270698, 0.3946671, 1, 1, 1, 1, 1,
1.245086, -2.673836, 1.654616, 1, 1, 1, 1, 1,
1.254564, -0.6532894, 1.700013, 1, 1, 1, 1, 1,
1.25498, -0.2268858, 1.585461, 1, 1, 1, 1, 1,
1.257494, -0.5287983, 2.300501, 0, 0, 1, 1, 1,
1.261863, 0.4341846, 1.9371, 1, 0, 0, 1, 1,
1.267509, 0.6617531, 2.232634, 1, 0, 0, 1, 1,
1.2893, -0.7902381, 2.609909, 1, 0, 0, 1, 1,
1.298782, -1.226967, 3.906863, 1, 0, 0, 1, 1,
1.305832, 1.208103, 0.08366501, 1, 0, 0, 1, 1,
1.308701, 0.1367018, 1.390585, 0, 0, 0, 1, 1,
1.314761, 0.1894091, 0.2635166, 0, 0, 0, 1, 1,
1.323714, 1.326237, 0.93293, 0, 0, 0, 1, 1,
1.324712, -0.7002929, 1.864316, 0, 0, 0, 1, 1,
1.325967, -0.731487, 1.855252, 0, 0, 0, 1, 1,
1.327589, -0.3163166, 2.597587, 0, 0, 0, 1, 1,
1.332799, 0.3476065, 0.2985531, 0, 0, 0, 1, 1,
1.344295, -0.2044625, 1.124272, 1, 1, 1, 1, 1,
1.37868, -2.129293, 1.501195, 1, 1, 1, 1, 1,
1.410216, -0.6369826, 1.495707, 1, 1, 1, 1, 1,
1.411368, -0.1566072, 3.036362, 1, 1, 1, 1, 1,
1.417036, -1.845707, 3.272169, 1, 1, 1, 1, 1,
1.426315, 0.8004265, 1.157781, 1, 1, 1, 1, 1,
1.437604, -1.277814, 3.250851, 1, 1, 1, 1, 1,
1.440225, 0.1895715, 0.4193266, 1, 1, 1, 1, 1,
1.440707, -0.7351803, 1.922936, 1, 1, 1, 1, 1,
1.450749, -0.3498995, -0.739157, 1, 1, 1, 1, 1,
1.455389, -0.496099, 3.132964, 1, 1, 1, 1, 1,
1.467755, -0.435793, 1.906207, 1, 1, 1, 1, 1,
1.471832, 0.9672692, 0.72795, 1, 1, 1, 1, 1,
1.476955, -0.1802446, 2.358579, 1, 1, 1, 1, 1,
1.484203, 0.592251, 1.276276, 1, 1, 1, 1, 1,
1.486883, -0.8102275, 2.398463, 0, 0, 1, 1, 1,
1.490348, -0.1975211, 3.083388, 1, 0, 0, 1, 1,
1.517522, -1.173081, 4.086398, 1, 0, 0, 1, 1,
1.522664, 1.283705, 0.1133515, 1, 0, 0, 1, 1,
1.525194, 0.4485188, 1.268598, 1, 0, 0, 1, 1,
1.540226, 0.4266285, 1.251978, 1, 0, 0, 1, 1,
1.567826, -0.3243802, 0.6903552, 0, 0, 0, 1, 1,
1.572968, 0.5568525, 2.80512, 0, 0, 0, 1, 1,
1.574016, 1.406508, 0.4549758, 0, 0, 0, 1, 1,
1.583749, 2.123525, -0.3974645, 0, 0, 0, 1, 1,
1.593966, -1.751332, 1.219109, 0, 0, 0, 1, 1,
1.601887, -0.3813349, 2.743589, 0, 0, 0, 1, 1,
1.63121, -1.754868, 2.333989, 0, 0, 0, 1, 1,
1.63257, 1.185395, -0.2000922, 1, 1, 1, 1, 1,
1.63372, -1.005853, 1.868269, 1, 1, 1, 1, 1,
1.634178, 0.5159693, 0.8837013, 1, 1, 1, 1, 1,
1.638121, 1.163588, 2.374289, 1, 1, 1, 1, 1,
1.647769, -0.7696799, 0.3786512, 1, 1, 1, 1, 1,
1.663751, -1.277005, 3.172114, 1, 1, 1, 1, 1,
1.672462, 0.6884509, 2.024223, 1, 1, 1, 1, 1,
1.673151, -0.7794046, 1.806523, 1, 1, 1, 1, 1,
1.676474, -0.438059, 1.722589, 1, 1, 1, 1, 1,
1.682701, -1.921041, 1.62905, 1, 1, 1, 1, 1,
1.683858, -0.3062525, 3.141917, 1, 1, 1, 1, 1,
1.685298, 0.3732375, 0.2194576, 1, 1, 1, 1, 1,
1.686933, -0.8792577, 1.666825, 1, 1, 1, 1, 1,
1.72064, -0.7636067, 1.480036, 1, 1, 1, 1, 1,
1.745449, 0.733126, 0.9280105, 1, 1, 1, 1, 1,
1.751328, -0.3298187, 1.655704, 0, 0, 1, 1, 1,
1.752938, 0.05672213, -0.03965074, 1, 0, 0, 1, 1,
1.769994, -0.1555442, 3.961915, 1, 0, 0, 1, 1,
1.770651, 1.421947, 0.8557611, 1, 0, 0, 1, 1,
1.78239, -0.2949831, 0.1654703, 1, 0, 0, 1, 1,
1.80573, 0.2490981, 1.844331, 1, 0, 0, 1, 1,
1.830932, -0.2584718, 2.272187, 0, 0, 0, 1, 1,
1.911022, -1.030566, 1.707569, 0, 0, 0, 1, 1,
1.920934, -0.7962788, 1.852078, 0, 0, 0, 1, 1,
1.921054, -0.3104786, 3.983347, 0, 0, 0, 1, 1,
1.933119, 0.4575655, 0.9485338, 0, 0, 0, 1, 1,
1.982024, -1.494591, 3.486295, 0, 0, 0, 1, 1,
1.994027, 0.8972673, 1.40809, 0, 0, 0, 1, 1,
2.006992, -0.9162507, 3.396123, 1, 1, 1, 1, 1,
2.01136, -0.220974, 3.796515, 1, 1, 1, 1, 1,
2.020074, -0.1347632, 2.15535, 1, 1, 1, 1, 1,
2.029629, -0.8356788, 1.514968, 1, 1, 1, 1, 1,
2.030145, -0.7951212, 2.4473, 1, 1, 1, 1, 1,
2.065196, 0.8978927, 1.719673, 1, 1, 1, 1, 1,
2.09401, 0.06099805, 0.3929194, 1, 1, 1, 1, 1,
2.104835, -0.03632296, 1.304074, 1, 1, 1, 1, 1,
2.105992, 0.5130073, 0.3786371, 1, 1, 1, 1, 1,
2.112298, -0.5470632, 1.219148, 1, 1, 1, 1, 1,
2.116044, -0.06321145, 1.764482, 1, 1, 1, 1, 1,
2.120626, 0.8833116, 1.515917, 1, 1, 1, 1, 1,
2.130769, -0.6067738, 1.779955, 1, 1, 1, 1, 1,
2.17067, 1.256067, 0.1247744, 1, 1, 1, 1, 1,
2.17446, -1.00573, 0.5138738, 1, 1, 1, 1, 1,
2.183101, 2.242699, 0.3525626, 0, 0, 1, 1, 1,
2.229318, -1.529862, 0.4933056, 1, 0, 0, 1, 1,
2.254979, 0.3052258, 2.326357, 1, 0, 0, 1, 1,
2.276868, 0.5120164, 2.936746, 1, 0, 0, 1, 1,
2.356858, 0.8630978, 2.23638, 1, 0, 0, 1, 1,
2.389919, -1.342257, 2.361023, 1, 0, 0, 1, 1,
2.415442, -0.4020872, -0.3812301, 0, 0, 0, 1, 1,
2.42873, 0.7716655, 1.352239, 0, 0, 0, 1, 1,
2.443777, -1.107129, 1.905487, 0, 0, 0, 1, 1,
2.474834, 0.5843071, 1.073373, 0, 0, 0, 1, 1,
2.476517, -0.01761544, 3.586519, 0, 0, 0, 1, 1,
2.495666, 0.1926154, 0.4757657, 0, 0, 0, 1, 1,
2.584462, -0.9791875, 1.856505, 0, 0, 0, 1, 1,
2.595756, -0.6487048, 1.885278, 1, 1, 1, 1, 1,
2.645074, -0.02641537, 1.637875, 1, 1, 1, 1, 1,
2.700184, -1.260769, 0.9553752, 1, 1, 1, 1, 1,
3.120397, 0.9811484, -0.7260439, 1, 1, 1, 1, 1,
3.303599, 2.926656, 0.03887421, 1, 1, 1, 1, 1,
3.313793, -1.882004, 1.917097, 1, 1, 1, 1, 1,
3.43975, 0.1777327, 1.994571, 1, 1, 1, 1, 1
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
var radius = 10.17214;
var distance = 35.72921;
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
mvMatrix.translate( -0.0655241, 0.2703861, 0.06117225 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.72921);
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
