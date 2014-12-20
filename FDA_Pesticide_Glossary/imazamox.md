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
-3.258314, 0.2863468, -1.347272, 1, 0, 0, 1,
-2.958766, 0.03842939, -2.456816, 1, 0.007843138, 0, 1,
-2.722432, -0.1034922, -2.310453, 1, 0.01176471, 0, 1,
-2.630858, 1.025625, -1.818954, 1, 0.01960784, 0, 1,
-2.503247, 0.04905669, -1.654908, 1, 0.02352941, 0, 1,
-2.408266, -2.264126, -2.993833, 1, 0.03137255, 0, 1,
-2.364016, -1.581421, -2.181099, 1, 0.03529412, 0, 1,
-2.338955, -1.821367, -1.369732, 1, 0.04313726, 0, 1,
-2.335707, -0.8524689, -2.462641, 1, 0.04705882, 0, 1,
-2.305707, 0.3882265, -0.1791318, 1, 0.05490196, 0, 1,
-2.269646, -0.5288334, -0.219883, 1, 0.05882353, 0, 1,
-2.250028, 1.189587, -0.5041647, 1, 0.06666667, 0, 1,
-2.233001, -0.6347118, -2.264359, 1, 0.07058824, 0, 1,
-2.228552, -1.489423, -1.94751, 1, 0.07843138, 0, 1,
-2.222445, 0.3230148, -3.50853, 1, 0.08235294, 0, 1,
-2.20589, 0.05622789, -2.320565, 1, 0.09019608, 0, 1,
-2.202081, -1.788707, -2.299408, 1, 0.09411765, 0, 1,
-2.186164, -1.163885, -2.397253, 1, 0.1019608, 0, 1,
-2.183228, -1.25894, -0.8977264, 1, 0.1098039, 0, 1,
-2.09091, 1.973944, 0.222119, 1, 0.1137255, 0, 1,
-2.062548, -0.8085814, -2.380394, 1, 0.1215686, 0, 1,
-2.054144, 0.2621406, -1.535041, 1, 0.1254902, 0, 1,
-2.036232, -0.7936983, -1.870182, 1, 0.1333333, 0, 1,
-1.985358, 1.92392, -0.9945279, 1, 0.1372549, 0, 1,
-1.965785, -0.2764562, -1.453489, 1, 0.145098, 0, 1,
-1.951871, 0.4250699, -1.25725, 1, 0.1490196, 0, 1,
-1.921853, 0.1909751, -1.303853, 1, 0.1568628, 0, 1,
-1.916874, 0.2978644, -0.962414, 1, 0.1607843, 0, 1,
-1.909275, 2.593374, 0.9140064, 1, 0.1686275, 0, 1,
-1.901973, -0.04350176, -1.86654, 1, 0.172549, 0, 1,
-1.882919, -0.6107153, -2.422188, 1, 0.1803922, 0, 1,
-1.871744, -0.172886, -0.2913114, 1, 0.1843137, 0, 1,
-1.822295, 0.3373635, -1.242776, 1, 0.1921569, 0, 1,
-1.817704, 1.670262, -1.393525, 1, 0.1960784, 0, 1,
-1.816403, 1.32796, -1.749696, 1, 0.2039216, 0, 1,
-1.812739, -0.001353899, -0.5005326, 1, 0.2117647, 0, 1,
-1.810451, -0.8582785, -1.190514, 1, 0.2156863, 0, 1,
-1.791852, 0.5792301, -1.175333, 1, 0.2235294, 0, 1,
-1.788403, -0.9396768, -1.17067, 1, 0.227451, 0, 1,
-1.787381, -0.7128367, -0.3053233, 1, 0.2352941, 0, 1,
-1.752994, -0.956145, -3.136951, 1, 0.2392157, 0, 1,
-1.740816, 0.05988752, -1.54879, 1, 0.2470588, 0, 1,
-1.725125, -0.3699639, -1.667912, 1, 0.2509804, 0, 1,
-1.715683, 0.1200774, -1.551641, 1, 0.2588235, 0, 1,
-1.71334, 0.4048997, -2.114748, 1, 0.2627451, 0, 1,
-1.689265, 0.1528601, -1.323915, 1, 0.2705882, 0, 1,
-1.67121, 2.380875, 0.2344924, 1, 0.2745098, 0, 1,
-1.666271, 0.01736696, -2.510228, 1, 0.282353, 0, 1,
-1.663681, -2.754636, -1.833809, 1, 0.2862745, 0, 1,
-1.636619, -0.6046648, -2.007281, 1, 0.2941177, 0, 1,
-1.589581, 0.6038207, -2.153631, 1, 0.3019608, 0, 1,
-1.578111, 0.2038686, -3.841791, 1, 0.3058824, 0, 1,
-1.563869, 0.9942049, -0.9592415, 1, 0.3137255, 0, 1,
-1.552513, -2.042171, -4.107702, 1, 0.3176471, 0, 1,
-1.538116, -3.174209, -2.61605, 1, 0.3254902, 0, 1,
-1.520901, 0.402861, -2.18561, 1, 0.3294118, 0, 1,
-1.51844, 0.1473168, -1.011027, 1, 0.3372549, 0, 1,
-1.512922, -1.493001, -3.48118, 1, 0.3411765, 0, 1,
-1.508495, -0.0004867058, -1.16797, 1, 0.3490196, 0, 1,
-1.5084, 0.9561692, -1.479539, 1, 0.3529412, 0, 1,
-1.505818, 0.1741951, -0.05368929, 1, 0.3607843, 0, 1,
-1.494604, -1.325539, -1.656757, 1, 0.3647059, 0, 1,
-1.493425, 1.866702, -1.110291, 1, 0.372549, 0, 1,
-1.466599, -0.5902916, -1.334731, 1, 0.3764706, 0, 1,
-1.45966, -0.8568147, -2.377429, 1, 0.3843137, 0, 1,
-1.458699, 0.04016779, -0.375751, 1, 0.3882353, 0, 1,
-1.458584, -0.894991, -2.216782, 1, 0.3960784, 0, 1,
-1.455568, 0.881712, -1.710182, 1, 0.4039216, 0, 1,
-1.455456, -1.003255, -3.757514, 1, 0.4078431, 0, 1,
-1.454916, -0.5454103, -2.183946, 1, 0.4156863, 0, 1,
-1.452026, 1.572002, -1.730769, 1, 0.4196078, 0, 1,
-1.450742, -1.287248, -0.9600801, 1, 0.427451, 0, 1,
-1.441338, -0.05431546, -1.471513, 1, 0.4313726, 0, 1,
-1.434197, 0.1073478, -2.095773, 1, 0.4392157, 0, 1,
-1.427355, 0.4423943, -2.03584, 1, 0.4431373, 0, 1,
-1.415424, 0.5538511, -3.182261, 1, 0.4509804, 0, 1,
-1.408019, 0.7597396, -3.007616, 1, 0.454902, 0, 1,
-1.407185, -2.298023, -4.917218, 1, 0.4627451, 0, 1,
-1.400371, 1.60003, 0.5589467, 1, 0.4666667, 0, 1,
-1.364368, -0.1977516, -0.5306782, 1, 0.4745098, 0, 1,
-1.361214, -0.3057868, -1.845537, 1, 0.4784314, 0, 1,
-1.359875, -1.38824, 0.3160668, 1, 0.4862745, 0, 1,
-1.358945, 0.1826826, -1.071565, 1, 0.4901961, 0, 1,
-1.346188, 0.2716126, -1.31773, 1, 0.4980392, 0, 1,
-1.340032, -0.8863305, -1.980061, 1, 0.5058824, 0, 1,
-1.338969, 1.788448, 1.605081, 1, 0.509804, 0, 1,
-1.338632, -0.7738335, -3.624395, 1, 0.5176471, 0, 1,
-1.327821, 0.05824243, -2.701957, 1, 0.5215687, 0, 1,
-1.321348, 0.3267809, -0.9135953, 1, 0.5294118, 0, 1,
-1.31411, -0.6059409, -1.990926, 1, 0.5333334, 0, 1,
-1.308423, -1.298869, -1.604725, 1, 0.5411765, 0, 1,
-1.307532, -1.444469, -2.53951, 1, 0.5450981, 0, 1,
-1.293859, -1.711135, -3.175025, 1, 0.5529412, 0, 1,
-1.288166, 1.157759, 0.3539166, 1, 0.5568628, 0, 1,
-1.284753, -1.023008, -2.062017, 1, 0.5647059, 0, 1,
-1.283678, -0.848825, -3.831136, 1, 0.5686275, 0, 1,
-1.281516, -0.2895521, -1.316958, 1, 0.5764706, 0, 1,
-1.279631, 2.224351, 0.1947786, 1, 0.5803922, 0, 1,
-1.276322, 1.169696, -0.3169272, 1, 0.5882353, 0, 1,
-1.269191, -1.123974, -4.063261, 1, 0.5921569, 0, 1,
-1.265885, -0.579707, -2.916254, 1, 0.6, 0, 1,
-1.264603, 0.5827997, -0.9586837, 1, 0.6078432, 0, 1,
-1.262599, -1.081865, -1.815886, 1, 0.6117647, 0, 1,
-1.253951, 0.1840095, -0.9243201, 1, 0.6196079, 0, 1,
-1.241934, -0.5868155, -1.858937, 1, 0.6235294, 0, 1,
-1.239919, -0.6426165, -1.591305, 1, 0.6313726, 0, 1,
-1.238336, -1.162599, -2.814948, 1, 0.6352941, 0, 1,
-1.229828, 2.131248, -2.7791, 1, 0.6431373, 0, 1,
-1.228297, -0.6808389, -0.7728957, 1, 0.6470588, 0, 1,
-1.220512, -0.002762561, -1.26646, 1, 0.654902, 0, 1,
-1.216812, -0.6638553, -1.65792, 1, 0.6588235, 0, 1,
-1.207906, 1.836426, -0.7668592, 1, 0.6666667, 0, 1,
-1.206331, -0.03296724, -0.9113383, 1, 0.6705883, 0, 1,
-1.204556, -1.08572, -1.867936, 1, 0.6784314, 0, 1,
-1.200438, 0.4912005, -2.449425, 1, 0.682353, 0, 1,
-1.198009, -0.6246441, -2.567592, 1, 0.6901961, 0, 1,
-1.197547, 0.1454388, -1.619227, 1, 0.6941177, 0, 1,
-1.195448, -1.656673, -2.015807, 1, 0.7019608, 0, 1,
-1.191524, 0.9649677, -2.937492, 1, 0.7098039, 0, 1,
-1.189944, -0.4347152, 0.07322471, 1, 0.7137255, 0, 1,
-1.182889, -0.8985243, -2.168303, 1, 0.7215686, 0, 1,
-1.182369, -0.7999986, -2.003209, 1, 0.7254902, 0, 1,
-1.178206, 1.702604, 0.814602, 1, 0.7333333, 0, 1,
-1.175147, -0.03595584, -2.26586, 1, 0.7372549, 0, 1,
-1.175067, 0.857558, 0.466726, 1, 0.7450981, 0, 1,
-1.174329, 0.1974076, -1.401452, 1, 0.7490196, 0, 1,
-1.173361, -0.3934102, -2.630682, 1, 0.7568628, 0, 1,
-1.172835, -0.1404114, -2.111977, 1, 0.7607843, 0, 1,
-1.166248, -1.577561, -2.832547, 1, 0.7686275, 0, 1,
-1.14813, -0.7838336, -2.665678, 1, 0.772549, 0, 1,
-1.148027, -0.9983875, -3.307564, 1, 0.7803922, 0, 1,
-1.142039, 0.3728594, -1.383241, 1, 0.7843137, 0, 1,
-1.140414, -0.446401, -1.203852, 1, 0.7921569, 0, 1,
-1.138298, -1.476018, -2.154428, 1, 0.7960784, 0, 1,
-1.136815, 0.9946922, -0.3396774, 1, 0.8039216, 0, 1,
-1.131641, 1.132655, -0.8862849, 1, 0.8117647, 0, 1,
-1.131505, -0.2893828, -2.175487, 1, 0.8156863, 0, 1,
-1.128852, 0.6447106, 0.779416, 1, 0.8235294, 0, 1,
-1.123888, -0.9677571, -4.351482, 1, 0.827451, 0, 1,
-1.121801, -1.17662, -1.062477, 1, 0.8352941, 0, 1,
-1.120199, -0.08395939, -3.675863, 1, 0.8392157, 0, 1,
-1.120005, 1.693632, -0.2292693, 1, 0.8470588, 0, 1,
-1.119484, 0.8934624, -1.009479, 1, 0.8509804, 0, 1,
-1.116956, 1.174221, -1.731886, 1, 0.8588235, 0, 1,
-1.113475, -0.2710801, -2.505426, 1, 0.8627451, 0, 1,
-1.113432, -0.03649534, -1.108205, 1, 0.8705882, 0, 1,
-1.107496, -0.1865603, -2.36027, 1, 0.8745098, 0, 1,
-1.103478, 1.343396, -0.6724052, 1, 0.8823529, 0, 1,
-1.10063, -0.2947413, -1.700992, 1, 0.8862745, 0, 1,
-1.094752, -2.131143, -1.100951, 1, 0.8941177, 0, 1,
-1.08861, -1.794602, -2.401324, 1, 0.8980392, 0, 1,
-1.085175, 0.7494977, -1.066971, 1, 0.9058824, 0, 1,
-1.081165, 2.040241, -1.978875, 1, 0.9137255, 0, 1,
-1.078958, 0.3847875, -0.6538266, 1, 0.9176471, 0, 1,
-1.072739, 0.09337097, 1.236383, 1, 0.9254902, 0, 1,
-1.064431, -0.2913895, -1.033958, 1, 0.9294118, 0, 1,
-1.062482, -1.764819, -2.450912, 1, 0.9372549, 0, 1,
-1.060812, 0.6054206, -2.350096, 1, 0.9411765, 0, 1,
-1.05653, 0.5821571, -2.378398, 1, 0.9490196, 0, 1,
-1.054415, -0.2082285, -2.774411, 1, 0.9529412, 0, 1,
-1.05314, -2.649549, -3.117318, 1, 0.9607843, 0, 1,
-1.034208, 0.3740067, -0.6705987, 1, 0.9647059, 0, 1,
-1.027127, 0.07348976, -1.433745, 1, 0.972549, 0, 1,
-1.02305, 2.081126, -0.2531092, 1, 0.9764706, 0, 1,
-1.018517, 2.08435, -0.4279828, 1, 0.9843137, 0, 1,
-1.017954, 0.1217096, -1.877479, 1, 0.9882353, 0, 1,
-1.007162, 0.3110803, -0.0578149, 1, 0.9960784, 0, 1,
-1.006718, -0.6022639, -2.82603, 0.9960784, 1, 0, 1,
-0.9909116, -0.2944972, -0.7531055, 0.9921569, 1, 0, 1,
-0.9905172, 0.8546579, 0.06665596, 0.9843137, 1, 0, 1,
-0.9825494, 0.8039899, -0.7214141, 0.9803922, 1, 0, 1,
-0.9810057, -0.654428, -3.474659, 0.972549, 1, 0, 1,
-0.9779972, 0.7744585, -1.365275, 0.9686275, 1, 0, 1,
-0.9692664, -1.24485, -2.703098, 0.9607843, 1, 0, 1,
-0.9690027, -0.8295656, -3.531415, 0.9568627, 1, 0, 1,
-0.954805, 0.4737129, -0.6257474, 0.9490196, 1, 0, 1,
-0.954195, -0.6980804, -3.039021, 0.945098, 1, 0, 1,
-0.9525731, 0.5994654, -1.766324, 0.9372549, 1, 0, 1,
-0.9524223, -0.04435248, -1.916674, 0.9333333, 1, 0, 1,
-0.952365, 0.09405204, -1.769598, 0.9254902, 1, 0, 1,
-0.9511498, 0.9826351, -0.2373739, 0.9215686, 1, 0, 1,
-0.9419457, -0.1281388, -1.133651, 0.9137255, 1, 0, 1,
-0.9405749, -0.09828095, -3.033297, 0.9098039, 1, 0, 1,
-0.923094, 0.2553967, -2.290823, 0.9019608, 1, 0, 1,
-0.9213219, -0.3550696, -2.499936, 0.8941177, 1, 0, 1,
-0.9198857, -0.9614017, -1.523077, 0.8901961, 1, 0, 1,
-0.9191452, -1.267803, -3.246246, 0.8823529, 1, 0, 1,
-0.9122214, -3.251535, -4.288828, 0.8784314, 1, 0, 1,
-0.9100682, 0.6456468, -1.896637, 0.8705882, 1, 0, 1,
-0.9075065, 0.1759496, -1.829597, 0.8666667, 1, 0, 1,
-0.9069716, -0.1417075, -4.339025, 0.8588235, 1, 0, 1,
-0.902778, -0.1110917, -2.407857, 0.854902, 1, 0, 1,
-0.8985441, -1.040624, -2.773434, 0.8470588, 1, 0, 1,
-0.8929971, 1.637521, -0.9752727, 0.8431373, 1, 0, 1,
-0.8913307, 0.3465127, -2.106668, 0.8352941, 1, 0, 1,
-0.8908281, 0.9074261, -0.6409726, 0.8313726, 1, 0, 1,
-0.8841939, 1.299127, 0.2253564, 0.8235294, 1, 0, 1,
-0.8815206, 0.342494, -0.9274451, 0.8196079, 1, 0, 1,
-0.8686447, 0.3434737, -0.7261642, 0.8117647, 1, 0, 1,
-0.8683918, 0.2416568, -1.267658, 0.8078431, 1, 0, 1,
-0.8670409, -0.924646, -3.628345, 0.8, 1, 0, 1,
-0.8610814, 0.4521879, -1.60827, 0.7921569, 1, 0, 1,
-0.8606673, -0.2086713, -1.591693, 0.7882353, 1, 0, 1,
-0.8526499, 0.6287252, -0.8985816, 0.7803922, 1, 0, 1,
-0.8461013, -0.4720962, -0.6610575, 0.7764706, 1, 0, 1,
-0.8414152, -0.5591967, -2.130607, 0.7686275, 1, 0, 1,
-0.8405373, 0.362609, -1.2332, 0.7647059, 1, 0, 1,
-0.8396283, -0.5693382, -2.157787, 0.7568628, 1, 0, 1,
-0.8357018, -1.660237, -3.030488, 0.7529412, 1, 0, 1,
-0.8328235, 1.543517, -1.020157, 0.7450981, 1, 0, 1,
-0.8325906, -0.9554795, -2.304696, 0.7411765, 1, 0, 1,
-0.83184, -1.917213, -2.175921, 0.7333333, 1, 0, 1,
-0.8259061, 0.4639607, -0.9428726, 0.7294118, 1, 0, 1,
-0.8208221, 0.5959674, -1.89938, 0.7215686, 1, 0, 1,
-0.8191262, 0.04791123, -1.351172, 0.7176471, 1, 0, 1,
-0.8176008, -0.6439053, -1.890506, 0.7098039, 1, 0, 1,
-0.8173372, 1.803268, -1.467646, 0.7058824, 1, 0, 1,
-0.8163074, 1.029507, -2.850105, 0.6980392, 1, 0, 1,
-0.8140352, -1.277734, -3.157815, 0.6901961, 1, 0, 1,
-0.8138638, -0.2419546, -0.8674081, 0.6862745, 1, 0, 1,
-0.8130216, -1.391629, -4.436345, 0.6784314, 1, 0, 1,
-0.8048795, 0.8915673, -0.7512003, 0.6745098, 1, 0, 1,
-0.8041009, -0.436039, -0.9461577, 0.6666667, 1, 0, 1,
-0.792793, 0.5517938, -2.024043, 0.6627451, 1, 0, 1,
-0.7894422, 0.360308, -1.945229, 0.654902, 1, 0, 1,
-0.7792801, 0.3976269, -0.1062644, 0.6509804, 1, 0, 1,
-0.7776875, -0.452373, -1.100083, 0.6431373, 1, 0, 1,
-0.7769944, 0.8424695, 0.23794, 0.6392157, 1, 0, 1,
-0.7756933, -0.3156418, -1.438763, 0.6313726, 1, 0, 1,
-0.7704622, 0.4246999, -0.3973877, 0.627451, 1, 0, 1,
-0.7698283, -0.9502233, -3.210597, 0.6196079, 1, 0, 1,
-0.7676455, 1.004428, -0.01742691, 0.6156863, 1, 0, 1,
-0.7649115, -0.4039925, -1.556193, 0.6078432, 1, 0, 1,
-0.7640474, -1.789718, -3.756712, 0.6039216, 1, 0, 1,
-0.755255, 0.6022583, -2.550605, 0.5960785, 1, 0, 1,
-0.7488518, 0.02797574, -0.4220845, 0.5882353, 1, 0, 1,
-0.7486431, 0.400337, 0.6241573, 0.5843138, 1, 0, 1,
-0.7477244, 0.3378751, 0.236157, 0.5764706, 1, 0, 1,
-0.7409086, -0.4583566, -2.282109, 0.572549, 1, 0, 1,
-0.7402472, -0.08065972, -2.019003, 0.5647059, 1, 0, 1,
-0.736218, -0.134771, -3.29699, 0.5607843, 1, 0, 1,
-0.735208, -1.201742, -2.836254, 0.5529412, 1, 0, 1,
-0.733201, 0.4598648, -1.063251, 0.5490196, 1, 0, 1,
-0.7325294, -0.2959763, -1.293093, 0.5411765, 1, 0, 1,
-0.7244107, 0.4632015, 1.121098, 0.5372549, 1, 0, 1,
-0.7203106, 1.603013, -1.21616, 0.5294118, 1, 0, 1,
-0.7197108, -0.4134573, -3.779361, 0.5254902, 1, 0, 1,
-0.718632, -1.268986, -0.9771835, 0.5176471, 1, 0, 1,
-0.7175234, -1.786587, -1.790731, 0.5137255, 1, 0, 1,
-0.7138466, -1.04141, -2.937608, 0.5058824, 1, 0, 1,
-0.7123495, -0.7620983, -2.952328, 0.5019608, 1, 0, 1,
-0.7096266, -0.6428316, -1.787048, 0.4941176, 1, 0, 1,
-0.7032272, 0.462554, -2.038931, 0.4862745, 1, 0, 1,
-0.6904768, 0.8395286, -0.7021146, 0.4823529, 1, 0, 1,
-0.6899409, -1.124905, -2.847175, 0.4745098, 1, 0, 1,
-0.6857895, -0.8251538, -0.7957081, 0.4705882, 1, 0, 1,
-0.6855568, 0.2412765, -2.148299, 0.4627451, 1, 0, 1,
-0.6847506, 0.3050979, -0.6435817, 0.4588235, 1, 0, 1,
-0.6802105, -1.785793, -3.080595, 0.4509804, 1, 0, 1,
-0.6726594, -0.4388313, -2.318736, 0.4470588, 1, 0, 1,
-0.6619899, -0.1209872, -2.558973, 0.4392157, 1, 0, 1,
-0.6494451, 0.4887567, -1.069585, 0.4352941, 1, 0, 1,
-0.6396809, 0.6055897, -0.980449, 0.427451, 1, 0, 1,
-0.6390506, 1.060629, -0.5854305, 0.4235294, 1, 0, 1,
-0.6388363, 1.572502, 0.1487874, 0.4156863, 1, 0, 1,
-0.637773, -1.051365, -1.991556, 0.4117647, 1, 0, 1,
-0.636725, 0.02493855, -1.536656, 0.4039216, 1, 0, 1,
-0.6313685, -0.5369912, -2.327398, 0.3960784, 1, 0, 1,
-0.6274041, 1.513599, 1.369334, 0.3921569, 1, 0, 1,
-0.6263363, 1.181865, -0.9099633, 0.3843137, 1, 0, 1,
-0.6247014, -0.0005826793, -0.9020958, 0.3803922, 1, 0, 1,
-0.6196069, 0.7809352, -1.538074, 0.372549, 1, 0, 1,
-0.6194722, 0.05498895, -2.264888, 0.3686275, 1, 0, 1,
-0.6162582, -0.03585614, -1.045525, 0.3607843, 1, 0, 1,
-0.6145386, -0.4564064, -2.991582, 0.3568628, 1, 0, 1,
-0.5869919, 0.199174, 0.114478, 0.3490196, 1, 0, 1,
-0.5831844, 0.2848056, -1.772123, 0.345098, 1, 0, 1,
-0.5831187, 1.806139, -0.1140661, 0.3372549, 1, 0, 1,
-0.5750644, 0.1732461, -2.100675, 0.3333333, 1, 0, 1,
-0.5737892, 0.000937313, -2.271738, 0.3254902, 1, 0, 1,
-0.5731906, 0.1369557, 0.8572738, 0.3215686, 1, 0, 1,
-0.5728375, -0.07542392, -0.3026771, 0.3137255, 1, 0, 1,
-0.5717908, -0.8007014, -2.786225, 0.3098039, 1, 0, 1,
-0.5687208, 0.1460438, -2.518547, 0.3019608, 1, 0, 1,
-0.5567297, -0.08985064, -1.176511, 0.2941177, 1, 0, 1,
-0.555974, 1.141112, 0.3944959, 0.2901961, 1, 0, 1,
-0.5531353, -0.4427198, -2.488423, 0.282353, 1, 0, 1,
-0.552047, -0.7876386, -0.1779223, 0.2784314, 1, 0, 1,
-0.5506371, 0.8788062, -1.579162, 0.2705882, 1, 0, 1,
-0.5494331, -0.4050932, -1.07396, 0.2666667, 1, 0, 1,
-0.5330567, 0.4981457, -0.8970296, 0.2588235, 1, 0, 1,
-0.5314388, 1.015732, -2.420581, 0.254902, 1, 0, 1,
-0.5295582, -0.5391066, -0.5294609, 0.2470588, 1, 0, 1,
-0.5291624, 1.241553, -1.465069, 0.2431373, 1, 0, 1,
-0.5266756, 0.7602415, -0.9252319, 0.2352941, 1, 0, 1,
-0.5237051, -0.2789909, -2.984965, 0.2313726, 1, 0, 1,
-0.5218957, 0.4212826, -0.4152287, 0.2235294, 1, 0, 1,
-0.5202922, -0.6095057, -2.291361, 0.2196078, 1, 0, 1,
-0.5184451, 1.807231, -0.7219736, 0.2117647, 1, 0, 1,
-0.5180544, -0.9510111, -3.165805, 0.2078431, 1, 0, 1,
-0.5161399, 0.4225083, -1.527472, 0.2, 1, 0, 1,
-0.5138809, -1.493334, -1.466907, 0.1921569, 1, 0, 1,
-0.5135145, -0.5036149, -2.880288, 0.1882353, 1, 0, 1,
-0.5088708, 1.9137, -0.2390469, 0.1803922, 1, 0, 1,
-0.5078216, 1.542188, -1.875466, 0.1764706, 1, 0, 1,
-0.506397, -0.1858668, -2.19267, 0.1686275, 1, 0, 1,
-0.5030715, 0.02874465, -2.646903, 0.1647059, 1, 0, 1,
-0.5022866, -1.123939, -4.187027, 0.1568628, 1, 0, 1,
-0.5011758, -0.5862284, -4.3074, 0.1529412, 1, 0, 1,
-0.4977119, -1.812984, -2.641456, 0.145098, 1, 0, 1,
-0.4960486, -0.06651021, -1.41505, 0.1411765, 1, 0, 1,
-0.4920648, 2.144313, 0.9900284, 0.1333333, 1, 0, 1,
-0.4882367, 0.3347877, -2.716485, 0.1294118, 1, 0, 1,
-0.4872999, 1.444962, 0.1952755, 0.1215686, 1, 0, 1,
-0.4872063, 0.112236, -0.3692863, 0.1176471, 1, 0, 1,
-0.4846304, 1.515211, 1.062683, 0.1098039, 1, 0, 1,
-0.4829088, -0.3622593, 0.7545395, 0.1058824, 1, 0, 1,
-0.482873, 0.452396, 0.4386996, 0.09803922, 1, 0, 1,
-0.4745087, -0.1809567, -3.341358, 0.09019608, 1, 0, 1,
-0.4738176, 0.5083602, 1.237219, 0.08627451, 1, 0, 1,
-0.4703693, 1.037237, 1.51277, 0.07843138, 1, 0, 1,
-0.4689844, 0.1820805, -2.056471, 0.07450981, 1, 0, 1,
-0.4648904, -0.7094449, -3.418654, 0.06666667, 1, 0, 1,
-0.4630193, -1.209892, -2.693713, 0.0627451, 1, 0, 1,
-0.4583673, -0.9355806, -3.450608, 0.05490196, 1, 0, 1,
-0.4582721, -0.4483803, -4.015831, 0.05098039, 1, 0, 1,
-0.4576063, -1.026173, -2.825147, 0.04313726, 1, 0, 1,
-0.4552886, -0.4672362, -1.214287, 0.03921569, 1, 0, 1,
-0.45499, 0.1950397, -2.446541, 0.03137255, 1, 0, 1,
-0.4511917, -0.3481323, -2.601774, 0.02745098, 1, 0, 1,
-0.4503985, -0.367929, -2.851589, 0.01960784, 1, 0, 1,
-0.4472264, -0.9436833, -1.758118, 0.01568628, 1, 0, 1,
-0.4452273, 0.7201099, 0.1806005, 0.007843138, 1, 0, 1,
-0.4449256, -1.288136, -1.134353, 0.003921569, 1, 0, 1,
-0.4415284, -1.099547, -2.503019, 0, 1, 0.003921569, 1,
-0.4411765, 1.247251, -1.252785, 0, 1, 0.01176471, 1,
-0.4364384, 0.8901612, 1.211701, 0, 1, 0.01568628, 1,
-0.4345704, 1.856244, -0.07302301, 0, 1, 0.02352941, 1,
-0.4331069, 1.021306, -0.01320772, 0, 1, 0.02745098, 1,
-0.4270024, -0.6078981, -2.938342, 0, 1, 0.03529412, 1,
-0.4247213, 0.6046342, 0.5180232, 0, 1, 0.03921569, 1,
-0.4234293, 0.9128929, -0.252109, 0, 1, 0.04705882, 1,
-0.4224952, -1.526789, -3.219573, 0, 1, 0.05098039, 1,
-0.4109974, 0.2869289, 1.058185, 0, 1, 0.05882353, 1,
-0.4107917, -0.04903321, -0.7013485, 0, 1, 0.0627451, 1,
-0.4024511, -0.280983, -4.405694, 0, 1, 0.07058824, 1,
-0.4017274, -0.146361, -2.572202, 0, 1, 0.07450981, 1,
-0.4001738, -0.4941498, -2.133273, 0, 1, 0.08235294, 1,
-0.396462, 1.392654, -0.2738848, 0, 1, 0.08627451, 1,
-0.3951029, -0.7351144, -1.271514, 0, 1, 0.09411765, 1,
-0.3947382, -0.8255064, -4.192874, 0, 1, 0.1019608, 1,
-0.3941105, 0.03852903, -1.511421, 0, 1, 0.1058824, 1,
-0.3940642, 1.05264, 0.6983902, 0, 1, 0.1137255, 1,
-0.3933724, 0.326454, -1.622962, 0, 1, 0.1176471, 1,
-0.3931251, -0.567005, -1.873379, 0, 1, 0.1254902, 1,
-0.3910392, -0.7992719, -2.463056, 0, 1, 0.1294118, 1,
-0.386512, -0.6584743, -3.354164, 0, 1, 0.1372549, 1,
-0.3834071, 1.605161, 1.983979, 0, 1, 0.1411765, 1,
-0.3831425, -0.197457, -2.389871, 0, 1, 0.1490196, 1,
-0.3772941, 0.7587143, 0.1119849, 0, 1, 0.1529412, 1,
-0.3765098, -1.167099, -1.897128, 0, 1, 0.1607843, 1,
-0.3739201, 0.26047, 0.1438121, 0, 1, 0.1647059, 1,
-0.3720888, 0.3594485, -0.6674547, 0, 1, 0.172549, 1,
-0.3711476, 0.4808364, -0.685818, 0, 1, 0.1764706, 1,
-0.3688098, -0.6638562, -2.312965, 0, 1, 0.1843137, 1,
-0.3662391, 0.1530466, -1.098589, 0, 1, 0.1882353, 1,
-0.3644214, 0.4290096, -1.484305, 0, 1, 0.1960784, 1,
-0.3544073, -0.3365017, -1.695606, 0, 1, 0.2039216, 1,
-0.3531508, 1.427092, -2.107283, 0, 1, 0.2078431, 1,
-0.3469862, -0.1382678, -2.476887, 0, 1, 0.2156863, 1,
-0.3460428, 0.5390198, -0.1149011, 0, 1, 0.2196078, 1,
-0.3431721, -0.9591957, -3.910655, 0, 1, 0.227451, 1,
-0.3419847, 0.2184316, -1.569979, 0, 1, 0.2313726, 1,
-0.3417734, 0.2267919, 0.2995144, 0, 1, 0.2392157, 1,
-0.3390973, -0.2644212, -2.595615, 0, 1, 0.2431373, 1,
-0.3382761, -0.4658079, -3.175082, 0, 1, 0.2509804, 1,
-0.3342766, -0.3559242, -1.683646, 0, 1, 0.254902, 1,
-0.3315206, 1.08266, -1.018406, 0, 1, 0.2627451, 1,
-0.3304838, -1.5695, -3.701581, 0, 1, 0.2666667, 1,
-0.3261279, 0.6863088, -1.501138, 0, 1, 0.2745098, 1,
-0.3248985, -0.7190846, -2.610633, 0, 1, 0.2784314, 1,
-0.3241155, -1.86978, -4.282383, 0, 1, 0.2862745, 1,
-0.3238402, 0.2219617, -0.8550274, 0, 1, 0.2901961, 1,
-0.3237836, -0.8443092, -1.278707, 0, 1, 0.2980392, 1,
-0.3202434, 0.5899602, -0.001701354, 0, 1, 0.3058824, 1,
-0.3148182, 0.08355262, -0.5026661, 0, 1, 0.3098039, 1,
-0.3138444, 0.6738253, -1.266659, 0, 1, 0.3176471, 1,
-0.3069706, 0.4067742, -0.2934316, 0, 1, 0.3215686, 1,
-0.3029841, 0.3322768, 0.3157079, 0, 1, 0.3294118, 1,
-0.2943096, -0.5909454, -2.97075, 0, 1, 0.3333333, 1,
-0.2927253, 1.166156, -0.7823463, 0, 1, 0.3411765, 1,
-0.2920665, 0.1186716, -0.7931692, 0, 1, 0.345098, 1,
-0.2897489, 2.021836, -1.580266, 0, 1, 0.3529412, 1,
-0.2885726, -0.5564848, -2.125877, 0, 1, 0.3568628, 1,
-0.2868989, -0.8437015, -1.523812, 0, 1, 0.3647059, 1,
-0.2816722, -1.980995, -2.02008, 0, 1, 0.3686275, 1,
-0.2796166, -0.5139883, -2.181137, 0, 1, 0.3764706, 1,
-0.2766558, -0.8266432, -3.824827, 0, 1, 0.3803922, 1,
-0.2762254, 0.2858136, -1.431239, 0, 1, 0.3882353, 1,
-0.2732135, 0.4293687, -2.037318, 0, 1, 0.3921569, 1,
-0.271102, -0.3071664, -2.375254, 0, 1, 0.4, 1,
-0.2681441, 0.2464737, -1.388634, 0, 1, 0.4078431, 1,
-0.2654714, -0.8507064, -0.8201164, 0, 1, 0.4117647, 1,
-0.2614193, -2.582089, -2.532985, 0, 1, 0.4196078, 1,
-0.2612044, 0.03446116, -3.257991, 0, 1, 0.4235294, 1,
-0.2602942, -0.749673, -3.369327, 0, 1, 0.4313726, 1,
-0.252938, -0.7058611, -3.44024, 0, 1, 0.4352941, 1,
-0.2529324, -0.8925991, -4.486997, 0, 1, 0.4431373, 1,
-0.2506572, -1.96007, -3.388871, 0, 1, 0.4470588, 1,
-0.2452309, 1.174311, -0.4248584, 0, 1, 0.454902, 1,
-0.2445129, -0.5115204, -2.303676, 0, 1, 0.4588235, 1,
-0.2421351, 0.1869981, -0.5699656, 0, 1, 0.4666667, 1,
-0.2405319, 0.04841487, -0.7565646, 0, 1, 0.4705882, 1,
-0.2390187, -2.029041, -1.414904, 0, 1, 0.4784314, 1,
-0.2386496, -0.1853745, -1.838508, 0, 1, 0.4823529, 1,
-0.2381365, -0.1086856, -0.8943067, 0, 1, 0.4901961, 1,
-0.2376922, 0.8672762, -1.81721, 0, 1, 0.4941176, 1,
-0.2346026, -1.306281, -1.851969, 0, 1, 0.5019608, 1,
-0.2328692, 1.7491, 0.4782657, 0, 1, 0.509804, 1,
-0.2305036, -0.9011471, -4.370527, 0, 1, 0.5137255, 1,
-0.2291712, -0.5750799, -1.226538, 0, 1, 0.5215687, 1,
-0.2287647, -0.003996683, -2.440606, 0, 1, 0.5254902, 1,
-0.2268759, 2.04765, 0.007821231, 0, 1, 0.5333334, 1,
-0.2232473, 1.158347, 1.827356, 0, 1, 0.5372549, 1,
-0.2228187, -0.2778647, -1.182201, 0, 1, 0.5450981, 1,
-0.2214032, 0.02054165, -1.610114, 0, 1, 0.5490196, 1,
-0.2170442, -1.079791, -3.152623, 0, 1, 0.5568628, 1,
-0.2159764, 1.031805, 1.20298, 0, 1, 0.5607843, 1,
-0.2150715, -1.236517, -3.125865, 0, 1, 0.5686275, 1,
-0.2147685, -0.9935153, -1.415941, 0, 1, 0.572549, 1,
-0.2121735, 1.590197, 0.9625611, 0, 1, 0.5803922, 1,
-0.2106675, -0.314453, -3.463534, 0, 1, 0.5843138, 1,
-0.209534, -0.4457479, -1.916168, 0, 1, 0.5921569, 1,
-0.2062571, 1.099092, 0.63398, 0, 1, 0.5960785, 1,
-0.2016018, -0.7390738, -2.315595, 0, 1, 0.6039216, 1,
-0.1785845, -0.7951035, -3.193097, 0, 1, 0.6117647, 1,
-0.1784312, -1.55387, -4.33916, 0, 1, 0.6156863, 1,
-0.1781734, -0.7577839, -2.591595, 0, 1, 0.6235294, 1,
-0.1767392, 0.9655921, -0.3786436, 0, 1, 0.627451, 1,
-0.1757337, -0.9491906, -3.041758, 0, 1, 0.6352941, 1,
-0.1735889, 1.520317, 1.0268, 0, 1, 0.6392157, 1,
-0.1712791, -0.6500408, -3.359736, 0, 1, 0.6470588, 1,
-0.1711543, 0.3099404, -0.7910097, 0, 1, 0.6509804, 1,
-0.170765, -1.037018, -3.246078, 0, 1, 0.6588235, 1,
-0.1669094, 0.237642, 0.4844351, 0, 1, 0.6627451, 1,
-0.1659745, -0.2595093, -3.001865, 0, 1, 0.6705883, 1,
-0.1630749, -1.183032, -4.147593, 0, 1, 0.6745098, 1,
-0.1629607, -0.8526877, -3.15798, 0, 1, 0.682353, 1,
-0.161961, 0.8195371, 1.762635, 0, 1, 0.6862745, 1,
-0.1576656, 0.7755095, -0.5332001, 0, 1, 0.6941177, 1,
-0.1487408, 0.570831, -1.600017, 0, 1, 0.7019608, 1,
-0.1417958, -1.331966, -3.396531, 0, 1, 0.7058824, 1,
-0.141516, -1.25282, -1.916076, 0, 1, 0.7137255, 1,
-0.1351346, 1.654664, -0.2956327, 0, 1, 0.7176471, 1,
-0.1298867, -0.2238992, -2.667633, 0, 1, 0.7254902, 1,
-0.1298084, -1.871521, -3.483547, 0, 1, 0.7294118, 1,
-0.1227854, 0.2320296, -1.857695, 0, 1, 0.7372549, 1,
-0.1216954, -0.7553756, -2.409641, 0, 1, 0.7411765, 1,
-0.1213905, -0.1720253, -2.746173, 0, 1, 0.7490196, 1,
-0.1202712, 2.092554, 0.9934144, 0, 1, 0.7529412, 1,
-0.1135542, 0.7705719, -0.626916, 0, 1, 0.7607843, 1,
-0.1103876, -0.9081064, -0.04314096, 0, 1, 0.7647059, 1,
-0.1090228, 0.4129208, -2.039686, 0, 1, 0.772549, 1,
-0.1050408, -0.07332998, -0.3657472, 0, 1, 0.7764706, 1,
-0.1049123, 1.315014, 0.07330016, 0, 1, 0.7843137, 1,
-0.1021459, 0.4300387, 0.05976838, 0, 1, 0.7882353, 1,
-0.09929206, -0.4279766, -3.301501, 0, 1, 0.7960784, 1,
-0.09855244, 0.6587353, 0.3144712, 0, 1, 0.8039216, 1,
-0.0982518, -0.6817368, -2.989013, 0, 1, 0.8078431, 1,
-0.09519307, 0.2414425, 0.2333263, 0, 1, 0.8156863, 1,
-0.08811896, 0.7143669, 0.1604634, 0, 1, 0.8196079, 1,
-0.08419123, 1.452486, -1.99796, 0, 1, 0.827451, 1,
-0.08294856, 0.8658507, 0.706174, 0, 1, 0.8313726, 1,
-0.08165095, -0.8744931, -2.107528, 0, 1, 0.8392157, 1,
-0.07901567, 0.6521831, -0.07606797, 0, 1, 0.8431373, 1,
-0.07852173, -1.488676, -1.913943, 0, 1, 0.8509804, 1,
-0.07780731, -0.7660843, -2.994004, 0, 1, 0.854902, 1,
-0.07747769, 0.3030696, 0.4960704, 0, 1, 0.8627451, 1,
-0.07664461, 0.3777749, 2.442969, 0, 1, 0.8666667, 1,
-0.07597834, -0.7840753, -3.095924, 0, 1, 0.8745098, 1,
-0.07487088, 1.119247, 1.018163, 0, 1, 0.8784314, 1,
-0.07446146, -0.9574583, -2.963776, 0, 1, 0.8862745, 1,
-0.07370824, -1.71896, -3.888639, 0, 1, 0.8901961, 1,
-0.07345593, 0.7303874, -0.9868788, 0, 1, 0.8980392, 1,
-0.0702059, 0.06276076, -0.7245181, 0, 1, 0.9058824, 1,
-0.06988817, -0.2937613, -3.944122, 0, 1, 0.9098039, 1,
-0.06945994, 0.7191104, 0.09794763, 0, 1, 0.9176471, 1,
-0.06757839, 1.87776, -1.435277, 0, 1, 0.9215686, 1,
-0.06725901, 0.5446845, -0.6113719, 0, 1, 0.9294118, 1,
-0.06381371, 1.652493, -1.369155, 0, 1, 0.9333333, 1,
-0.06366414, -0.4204521, -3.11998, 0, 1, 0.9411765, 1,
-0.06365518, 2.039745, 0.2299147, 0, 1, 0.945098, 1,
-0.0612906, -0.7110293, -2.289017, 0, 1, 0.9529412, 1,
-0.06016613, -1.115802, -3.78026, 0, 1, 0.9568627, 1,
-0.06013201, -0.2950734, -1.095198, 0, 1, 0.9647059, 1,
-0.05864066, 0.4641295, 0.3264213, 0, 1, 0.9686275, 1,
-0.05446346, 1.089599, 1.637922, 0, 1, 0.9764706, 1,
-0.05191648, -1.416379, -3.222623, 0, 1, 0.9803922, 1,
-0.05145127, -0.6133402, -4.675717, 0, 1, 0.9882353, 1,
-0.05120679, -1.712777, -3.576375, 0, 1, 0.9921569, 1,
-0.04797246, -1.605888, -3.577796, 0, 1, 1, 1,
-0.04561143, -0.7545292, -5.121426, 0, 0.9921569, 1, 1,
-0.0422197, 1.345094, -0.08173499, 0, 0.9882353, 1, 1,
-0.03915004, -2.108599, -4.890022, 0, 0.9803922, 1, 1,
-0.03868853, -0.1847857, -3.260043, 0, 0.9764706, 1, 1,
-0.02207475, -0.9578007, -2.961655, 0, 0.9686275, 1, 1,
-0.02146594, -1.370872, -4.773374, 0, 0.9647059, 1, 1,
-0.0208297, 0.410258, 0.6521896, 0, 0.9568627, 1, 1,
-0.020038, 0.139456, -0.09449399, 0, 0.9529412, 1, 1,
-0.01738344, -1.10847, -3.291516, 0, 0.945098, 1, 1,
-0.01695334, 1.114038, 2.221462, 0, 0.9411765, 1, 1,
-0.01608858, 0.5715219, -0.86892, 0, 0.9333333, 1, 1,
-0.0159959, -0.2636793, -2.956651, 0, 0.9294118, 1, 1,
-0.01072064, 0.882084, -0.4839577, 0, 0.9215686, 1, 1,
-0.009057751, 0.05259904, 0.149342, 0, 0.9176471, 1, 1,
-0.008908061, 0.1644914, 0.1196096, 0, 0.9098039, 1, 1,
-0.007435161, 1.528467, 1.073742, 0, 0.9058824, 1, 1,
-0.0007341626, 0.5876244, -0.05288271, 0, 0.8980392, 1, 1,
0.0005864681, 0.5981953, -1.163419, 0, 0.8901961, 1, 1,
0.003283261, -0.62717, 4.659307, 0, 0.8862745, 1, 1,
0.003421294, -0.4727796, 3.587138, 0, 0.8784314, 1, 1,
0.006843894, 0.7160357, 0.1784126, 0, 0.8745098, 1, 1,
0.007766122, 1.074509, 0.1465386, 0, 0.8666667, 1, 1,
0.01083172, -0.9953079, 3.518084, 0, 0.8627451, 1, 1,
0.01224911, 0.7226706, -0.107087, 0, 0.854902, 1, 1,
0.01564024, 0.7696957, -1.33033, 0, 0.8509804, 1, 1,
0.02072679, 0.8570895, -0.5512905, 0, 0.8431373, 1, 1,
0.02241989, -0.3199085, 2.442461, 0, 0.8392157, 1, 1,
0.02252957, -0.8390095, 2.198548, 0, 0.8313726, 1, 1,
0.02300682, -1.150514, 3.257528, 0, 0.827451, 1, 1,
0.02338552, -0.766428, 3.993367, 0, 0.8196079, 1, 1,
0.02644126, -1.756125, 3.877015, 0, 0.8156863, 1, 1,
0.02789616, -0.7999641, 2.816585, 0, 0.8078431, 1, 1,
0.02813253, -0.167518, 3.035398, 0, 0.8039216, 1, 1,
0.03228552, -1.036991, 1.917712, 0, 0.7960784, 1, 1,
0.04212748, 0.4095827, 1.543772, 0, 0.7882353, 1, 1,
0.04446724, 0.1440458, -1.813344, 0, 0.7843137, 1, 1,
0.04569176, -0.2254575, 1.695385, 0, 0.7764706, 1, 1,
0.0494825, 1.210302, 0.07744643, 0, 0.772549, 1, 1,
0.05298377, 1.111232, -0.6752648, 0, 0.7647059, 1, 1,
0.05460039, 0.2301877, 1.872455, 0, 0.7607843, 1, 1,
0.05865533, 1.049712, 0.565127, 0, 0.7529412, 1, 1,
0.06085636, 0.05787725, -0.5169333, 0, 0.7490196, 1, 1,
0.06362142, -0.8009022, 2.37449, 0, 0.7411765, 1, 1,
0.06500707, -0.2212757, 3.454598, 0, 0.7372549, 1, 1,
0.06526253, 0.5527927, 2.067367, 0, 0.7294118, 1, 1,
0.06615845, -0.8165816, 3.387259, 0, 0.7254902, 1, 1,
0.06849103, 1.247767, 0.2262406, 0, 0.7176471, 1, 1,
0.07018258, -0.08175308, 3.028125, 0, 0.7137255, 1, 1,
0.07154953, 1.579648, 0.82855, 0, 0.7058824, 1, 1,
0.07259074, 0.2432597, 0.637325, 0, 0.6980392, 1, 1,
0.07652073, -2.053026, 0.9577804, 0, 0.6941177, 1, 1,
0.07758091, -0.8829675, 3.583752, 0, 0.6862745, 1, 1,
0.08318228, 1.807863, 0.9805922, 0, 0.682353, 1, 1,
0.09174458, 1.423267, 1.349286, 0, 0.6745098, 1, 1,
0.09468089, -1.067855, 4.684468, 0, 0.6705883, 1, 1,
0.09841635, -0.7175637, 3.908641, 0, 0.6627451, 1, 1,
0.1030302, 1.273993, -1.721084, 0, 0.6588235, 1, 1,
0.1100622, -0.1017158, 1.809074, 0, 0.6509804, 1, 1,
0.1143012, 0.2494125, 1.769312, 0, 0.6470588, 1, 1,
0.1206033, -1.02861, 4.144405, 0, 0.6392157, 1, 1,
0.1225809, 0.2438208, 2.022574, 0, 0.6352941, 1, 1,
0.125869, 0.4953469, 0.3723285, 0, 0.627451, 1, 1,
0.126549, 1.21621, 0.2682184, 0, 0.6235294, 1, 1,
0.1269937, -0.5102588, 1.968479, 0, 0.6156863, 1, 1,
0.1306151, -0.8267422, 4.537234, 0, 0.6117647, 1, 1,
0.1349446, -0.8983183, 4.457364, 0, 0.6039216, 1, 1,
0.139094, -1.32463, 3.725863, 0, 0.5960785, 1, 1,
0.1424971, 0.4823188, -0.06976502, 0, 0.5921569, 1, 1,
0.1436787, -2.830577, 3.244269, 0, 0.5843138, 1, 1,
0.1450327, -0.5598609, 2.123339, 0, 0.5803922, 1, 1,
0.1455842, -0.9166425, 0.8944716, 0, 0.572549, 1, 1,
0.1457446, 2.512021, -0.4676278, 0, 0.5686275, 1, 1,
0.1460996, -0.3348579, 1.99129, 0, 0.5607843, 1, 1,
0.1511872, -1.608958, 2.10719, 0, 0.5568628, 1, 1,
0.152628, -1.562609, 2.604193, 0, 0.5490196, 1, 1,
0.1526698, -0.4160777, 3.687641, 0, 0.5450981, 1, 1,
0.1587435, -0.7133448, 1.623529, 0, 0.5372549, 1, 1,
0.1587877, -0.02759408, 1.09881, 0, 0.5333334, 1, 1,
0.1591001, -1.853143, 1.209198, 0, 0.5254902, 1, 1,
0.1603278, 0.5732725, -0.08195103, 0, 0.5215687, 1, 1,
0.1626287, 1.585094, -1.574806, 0, 0.5137255, 1, 1,
0.166267, -0.2584407, 1.906968, 0, 0.509804, 1, 1,
0.1727438, 1.467702, 0.5304669, 0, 0.5019608, 1, 1,
0.1756543, -0.08730745, 0.8254309, 0, 0.4941176, 1, 1,
0.1785908, -0.2829047, 3.769706, 0, 0.4901961, 1, 1,
0.178941, 0.7093242, 1.268184, 0, 0.4823529, 1, 1,
0.1833677, -2.021133, 2.781655, 0, 0.4784314, 1, 1,
0.1948971, 0.5941224, -0.3792098, 0, 0.4705882, 1, 1,
0.1981041, 0.3348604, 0.8118591, 0, 0.4666667, 1, 1,
0.2010072, 0.6577398, -1.405853, 0, 0.4588235, 1, 1,
0.2017705, -0.8911044, 2.389521, 0, 0.454902, 1, 1,
0.2053931, -0.3766366, 2.822524, 0, 0.4470588, 1, 1,
0.2066841, 0.8549768, 0.7966023, 0, 0.4431373, 1, 1,
0.2090379, 1.191972, 0.1676535, 0, 0.4352941, 1, 1,
0.2125293, 2.060292, -0.2019579, 0, 0.4313726, 1, 1,
0.2139309, 0.5297768, 1.294211, 0, 0.4235294, 1, 1,
0.2173854, -0.08176947, 1.839083, 0, 0.4196078, 1, 1,
0.2192285, -0.2655775, 2.10273, 0, 0.4117647, 1, 1,
0.221792, 1.053118, -0.2787744, 0, 0.4078431, 1, 1,
0.2227603, 1.223284, 0.6479499, 0, 0.4, 1, 1,
0.2270685, -1.320153, 4.981033, 0, 0.3921569, 1, 1,
0.2287253, -0.7073777, 2.724577, 0, 0.3882353, 1, 1,
0.2287747, -0.3945322, 3.790257, 0, 0.3803922, 1, 1,
0.2312383, 0.6553993, 1.822971, 0, 0.3764706, 1, 1,
0.2363648, 0.3988376, -0.2422642, 0, 0.3686275, 1, 1,
0.2392579, 2.306062, -0.5405554, 0, 0.3647059, 1, 1,
0.2431125, 0.3739532, 0.304196, 0, 0.3568628, 1, 1,
0.2510271, 1.402974, -0.6650258, 0, 0.3529412, 1, 1,
0.2519709, 0.4213428, 1.836185, 0, 0.345098, 1, 1,
0.2530249, -0.6524541, 1.975122, 0, 0.3411765, 1, 1,
0.2546027, -0.002676965, 1.712749, 0, 0.3333333, 1, 1,
0.2574608, 0.0202664, 0.8706394, 0, 0.3294118, 1, 1,
0.2578095, -0.6389296, 3.040214, 0, 0.3215686, 1, 1,
0.2592943, -0.06125611, 2.220901, 0, 0.3176471, 1, 1,
0.2701549, -0.6474616, 3.613648, 0, 0.3098039, 1, 1,
0.2753539, -1.733723, 2.355982, 0, 0.3058824, 1, 1,
0.2755873, -0.6877436, 3.789153, 0, 0.2980392, 1, 1,
0.2790235, -1.101178, 2.33605, 0, 0.2901961, 1, 1,
0.2866504, -0.009614584, 2.032351, 0, 0.2862745, 1, 1,
0.2905767, 0.3688354, 0.5778673, 0, 0.2784314, 1, 1,
0.2920028, -0.8786265, 3.581204, 0, 0.2745098, 1, 1,
0.2959459, 0.7362524, 1.870722, 0, 0.2666667, 1, 1,
0.3035384, 0.8125581, -0.5144852, 0, 0.2627451, 1, 1,
0.3052741, 1.038018, 0.2726203, 0, 0.254902, 1, 1,
0.3059856, -0.1901655, 4.292857, 0, 0.2509804, 1, 1,
0.3105933, 1.562073, 0.3403707, 0, 0.2431373, 1, 1,
0.3105974, 1.001179, -0.9957843, 0, 0.2392157, 1, 1,
0.3127846, 0.2934771, 1.53526, 0, 0.2313726, 1, 1,
0.313459, -0.8407066, 5.01547, 0, 0.227451, 1, 1,
0.3187609, 1.831132, -1.211025, 0, 0.2196078, 1, 1,
0.3283772, 0.7127665, -0.3864642, 0, 0.2156863, 1, 1,
0.3312123, -0.2712554, 2.333651, 0, 0.2078431, 1, 1,
0.3317918, 0.1399537, -0.3344683, 0, 0.2039216, 1, 1,
0.3365577, -0.01132997, 0.9698846, 0, 0.1960784, 1, 1,
0.3423045, 0.1137117, 0.938791, 0, 0.1882353, 1, 1,
0.3439351, -0.103097, 1.861297, 0, 0.1843137, 1, 1,
0.349425, 1.870492, 0.23293, 0, 0.1764706, 1, 1,
0.3502904, 0.05998785, 1.474276, 0, 0.172549, 1, 1,
0.3532794, 0.3478702, 0.153473, 0, 0.1647059, 1, 1,
0.354251, -0.5209367, 3.307301, 0, 0.1607843, 1, 1,
0.3580193, 0.6370649, 0.8906635, 0, 0.1529412, 1, 1,
0.3588181, -1.095704, 2.505554, 0, 0.1490196, 1, 1,
0.3624669, 1.349218, 1.396437, 0, 0.1411765, 1, 1,
0.3654228, -1.066861, 3.166739, 0, 0.1372549, 1, 1,
0.3678696, 1.131239, 0.2858945, 0, 0.1294118, 1, 1,
0.3703576, 0.696283, -0.02463468, 0, 0.1254902, 1, 1,
0.370433, 0.04277568, 2.113463, 0, 0.1176471, 1, 1,
0.3734952, 0.5502554, 0.2556732, 0, 0.1137255, 1, 1,
0.3760308, -0.9293176, 4.026759, 0, 0.1058824, 1, 1,
0.3809883, -0.2212954, 2.995155, 0, 0.09803922, 1, 1,
0.3872087, -0.5887054, 1.49136, 0, 0.09411765, 1, 1,
0.3906319, 0.2697503, 1.416762, 0, 0.08627451, 1, 1,
0.3927971, -0.1501492, 0.6968219, 0, 0.08235294, 1, 1,
0.3957468, 0.1269174, -0.1436202, 0, 0.07450981, 1, 1,
0.4005624, 0.7842311, 2.237045, 0, 0.07058824, 1, 1,
0.4010766, 1.842974, 0.8237821, 0, 0.0627451, 1, 1,
0.4022748, -1.057487, 2.485248, 0, 0.05882353, 1, 1,
0.4024545, -1.861761, 2.98608, 0, 0.05098039, 1, 1,
0.4061989, -0.3931772, 1.599129, 0, 0.04705882, 1, 1,
0.4065845, -0.3740663, 0.9590774, 0, 0.03921569, 1, 1,
0.4076516, 0.07075902, -0.168588, 0, 0.03529412, 1, 1,
0.4097176, 0.1372271, 1.361047, 0, 0.02745098, 1, 1,
0.4112769, -1.204646, 4.61184, 0, 0.02352941, 1, 1,
0.4152645, -0.2229965, 2.423314, 0, 0.01568628, 1, 1,
0.4178753, 1.963219, -0.05019749, 0, 0.01176471, 1, 1,
0.4191528, -0.7878398, 3.328572, 0, 0.003921569, 1, 1,
0.4232115, -0.02124787, 1.705841, 0.003921569, 0, 1, 1,
0.4239174, 0.6328548, 0.8060976, 0.007843138, 0, 1, 1,
0.4324024, 1.477075, -0.07825992, 0.01568628, 0, 1, 1,
0.4349311, -0.03249153, 1.576494, 0.01960784, 0, 1, 1,
0.4351069, -0.2616188, 1.719164, 0.02745098, 0, 1, 1,
0.4358389, -1.023471, 3.742946, 0.03137255, 0, 1, 1,
0.4365349, 0.6709216, 0.2731695, 0.03921569, 0, 1, 1,
0.4368138, -0.8178419, 4.545928, 0.04313726, 0, 1, 1,
0.4400084, 0.8774149, 0.6750237, 0.05098039, 0, 1, 1,
0.4400185, 1.472579, 0.05843934, 0.05490196, 0, 1, 1,
0.442944, 0.7282538, -0.6074694, 0.0627451, 0, 1, 1,
0.4439382, 1.115548, -0.9363672, 0.06666667, 0, 1, 1,
0.4454449, -0.3363847, 3.293885, 0.07450981, 0, 1, 1,
0.4500213, -0.1829046, 1.499898, 0.07843138, 0, 1, 1,
0.4503911, 0.1579639, 1.753927, 0.08627451, 0, 1, 1,
0.4580272, 0.6790903, 2.191937, 0.09019608, 0, 1, 1,
0.4583957, -0.233201, 1.629731, 0.09803922, 0, 1, 1,
0.4629405, -1.092441, 2.773737, 0.1058824, 0, 1, 1,
0.463302, -0.6977633, 1.323615, 0.1098039, 0, 1, 1,
0.4636279, 0.3006128, 0.09946327, 0.1176471, 0, 1, 1,
0.4666454, -1.358083, 3.688044, 0.1215686, 0, 1, 1,
0.4698232, 0.2177022, 1.164317, 0.1294118, 0, 1, 1,
0.4725759, -1.836385, 2.998234, 0.1333333, 0, 1, 1,
0.4810466, -0.8499836, 1.62777, 0.1411765, 0, 1, 1,
0.4814368, -0.1569749, 4.290153, 0.145098, 0, 1, 1,
0.481973, -0.2859978, 2.976126, 0.1529412, 0, 1, 1,
0.4822268, -1.142998, 2.041551, 0.1568628, 0, 1, 1,
0.4833241, -0.08405125, 0.244867, 0.1647059, 0, 1, 1,
0.4872703, -1.575555, 2.838443, 0.1686275, 0, 1, 1,
0.4898774, 0.4222673, 1.577246, 0.1764706, 0, 1, 1,
0.4938905, -0.9984521, 4.475975, 0.1803922, 0, 1, 1,
0.4960342, 0.962564, 1.011966, 0.1882353, 0, 1, 1,
0.4985452, 2.841416, -0.3142338, 0.1921569, 0, 1, 1,
0.5017663, -1.137768, 2.536663, 0.2, 0, 1, 1,
0.5034866, 0.4058521, 2.68966, 0.2078431, 0, 1, 1,
0.5061892, 0.1690476, 1.806886, 0.2117647, 0, 1, 1,
0.5087123, -0.2419103, 2.761951, 0.2196078, 0, 1, 1,
0.50927, 1.015758, -0.02355388, 0.2235294, 0, 1, 1,
0.5105758, -0.7043408, 1.054989, 0.2313726, 0, 1, 1,
0.5153661, -0.7357203, 2.707231, 0.2352941, 0, 1, 1,
0.5177516, -0.4188639, 0.1502106, 0.2431373, 0, 1, 1,
0.5182334, -0.09804773, 1.737396, 0.2470588, 0, 1, 1,
0.5191935, 2.156537, -1.205854, 0.254902, 0, 1, 1,
0.5192403, -0.2653463, 0.5407892, 0.2588235, 0, 1, 1,
0.5257248, -1.274229, 1.048596, 0.2666667, 0, 1, 1,
0.5264042, -0.2416462, 2.316936, 0.2705882, 0, 1, 1,
0.5356581, -1.651102, 2.913687, 0.2784314, 0, 1, 1,
0.5371719, -1.892308, 1.796891, 0.282353, 0, 1, 1,
0.5389985, 0.8680122, 1.033726, 0.2901961, 0, 1, 1,
0.5403124, 0.01956497, 2.145246, 0.2941177, 0, 1, 1,
0.542151, -0.2855569, 2.225707, 0.3019608, 0, 1, 1,
0.5476971, -0.7952714, 3.152587, 0.3098039, 0, 1, 1,
0.5477202, 0.124454, -0.7211542, 0.3137255, 0, 1, 1,
0.5499891, -0.06534687, 0.2939369, 0.3215686, 0, 1, 1,
0.5500509, -0.06074524, 0.7965595, 0.3254902, 0, 1, 1,
0.550824, -1.358663, 3.309581, 0.3333333, 0, 1, 1,
0.5511222, -0.7239742, 3.919501, 0.3372549, 0, 1, 1,
0.5541304, 0.2969136, 1.885153, 0.345098, 0, 1, 1,
0.5606431, -0.04686324, 2.275247, 0.3490196, 0, 1, 1,
0.5698327, 0.3487462, 3.592373, 0.3568628, 0, 1, 1,
0.5702286, -0.4542563, 2.190032, 0.3607843, 0, 1, 1,
0.5704368, 0.7323202, 0.5768572, 0.3686275, 0, 1, 1,
0.5744258, -0.9271669, 2.314529, 0.372549, 0, 1, 1,
0.5787006, -0.1960968, 2.833945, 0.3803922, 0, 1, 1,
0.5801753, 0.807345, 1.434415, 0.3843137, 0, 1, 1,
0.5805314, -0.08946332, 2.017584, 0.3921569, 0, 1, 1,
0.5833294, 2.286793, -0.1594246, 0.3960784, 0, 1, 1,
0.5834732, -0.1736921, 1.365925, 0.4039216, 0, 1, 1,
0.5851761, -0.09002648, 1.684247, 0.4117647, 0, 1, 1,
0.5874717, 1.58635, -0.4500239, 0.4156863, 0, 1, 1,
0.6001143, 0.321472, 1.462343, 0.4235294, 0, 1, 1,
0.6027525, 1.493021, 0.08589573, 0.427451, 0, 1, 1,
0.604255, 1.625566, 0.1833894, 0.4352941, 0, 1, 1,
0.606994, 1.183487, -0.3960617, 0.4392157, 0, 1, 1,
0.6168088, -0.4818937, 2.332662, 0.4470588, 0, 1, 1,
0.616922, -1.357342, 1.417869, 0.4509804, 0, 1, 1,
0.6187748, 0.8394371, 2.430423, 0.4588235, 0, 1, 1,
0.6258667, -0.3833613, 2.541239, 0.4627451, 0, 1, 1,
0.626492, -0.07351382, 1.129578, 0.4705882, 0, 1, 1,
0.6275878, 0.2422726, 2.485068, 0.4745098, 0, 1, 1,
0.6340742, 1.891954, 0.8849638, 0.4823529, 0, 1, 1,
0.6418106, -0.8465103, 2.607568, 0.4862745, 0, 1, 1,
0.6433904, 0.8044439, 0.1716594, 0.4941176, 0, 1, 1,
0.6467896, 0.2010478, -0.1012384, 0.5019608, 0, 1, 1,
0.6511589, -0.2355861, 0.3812432, 0.5058824, 0, 1, 1,
0.652234, -0.9702298, 3.495173, 0.5137255, 0, 1, 1,
0.655481, -1.87386, 2.540752, 0.5176471, 0, 1, 1,
0.660871, -0.7056494, 2.143399, 0.5254902, 0, 1, 1,
0.6615285, 0.3003826, 1.714958, 0.5294118, 0, 1, 1,
0.668534, 0.2595604, 1.672859, 0.5372549, 0, 1, 1,
0.6753565, 0.3530408, 2.263768, 0.5411765, 0, 1, 1,
0.6776331, -0.9286623, 2.812087, 0.5490196, 0, 1, 1,
0.6801811, 0.1335356, 0.2777748, 0.5529412, 0, 1, 1,
0.6835722, -1.432418, 1.284671, 0.5607843, 0, 1, 1,
0.699136, 0.5028681, 0.4177075, 0.5647059, 0, 1, 1,
0.6996529, 0.8548677, -0.1610844, 0.572549, 0, 1, 1,
0.7010897, -1.147748, 2.334738, 0.5764706, 0, 1, 1,
0.7014683, -0.7905836, 1.351205, 0.5843138, 0, 1, 1,
0.707977, -0.09376942, 2.340494, 0.5882353, 0, 1, 1,
0.71385, -0.6746406, 3.60076, 0.5960785, 0, 1, 1,
0.7195079, -0.3349435, 3.472819, 0.6039216, 0, 1, 1,
0.7322722, 1.160756, 0.789156, 0.6078432, 0, 1, 1,
0.7335639, -1.418998, 3.063825, 0.6156863, 0, 1, 1,
0.7345797, 0.7625511, 0.314758, 0.6196079, 0, 1, 1,
0.7385103, 0.3889176, 1.545234, 0.627451, 0, 1, 1,
0.7430203, 0.5982333, 1.481391, 0.6313726, 0, 1, 1,
0.7488201, -0.8058903, 3.098559, 0.6392157, 0, 1, 1,
0.7507607, 0.1179592, -0.8242701, 0.6431373, 0, 1, 1,
0.7526587, -0.8341067, 1.537397, 0.6509804, 0, 1, 1,
0.7552034, -1.480817, 1.870624, 0.654902, 0, 1, 1,
0.758671, 0.3215136, 0.6382527, 0.6627451, 0, 1, 1,
0.7611527, -0.3687701, 3.978346, 0.6666667, 0, 1, 1,
0.7630451, -0.835557, 4.433948, 0.6745098, 0, 1, 1,
0.7710806, 0.4010097, 2.237973, 0.6784314, 0, 1, 1,
0.771404, -0.6336572, 1.541432, 0.6862745, 0, 1, 1,
0.774764, 1.023153, 3.062922, 0.6901961, 0, 1, 1,
0.7817098, 1.048367, 0.8222975, 0.6980392, 0, 1, 1,
0.78482, -2.095797, 2.650839, 0.7058824, 0, 1, 1,
0.7901376, -1.12595, 2.920958, 0.7098039, 0, 1, 1,
0.7964088, -0.4850839, 1.872679, 0.7176471, 0, 1, 1,
0.7966551, -0.3277277, 2.618456, 0.7215686, 0, 1, 1,
0.8003724, -0.9017447, 4.361179, 0.7294118, 0, 1, 1,
0.8063995, 1.198002, 0.8166605, 0.7333333, 0, 1, 1,
0.8118097, -1.35403, 3.094765, 0.7411765, 0, 1, 1,
0.8146893, -0.9897538, 2.803855, 0.7450981, 0, 1, 1,
0.8155335, -1.240615, 2.751833, 0.7529412, 0, 1, 1,
0.8169138, 0.6523871, 0.3633181, 0.7568628, 0, 1, 1,
0.817916, 0.4601149, 1.960796, 0.7647059, 0, 1, 1,
0.8220506, -0.9013276, 2.589125, 0.7686275, 0, 1, 1,
0.8316548, 1.64096, -0.2547224, 0.7764706, 0, 1, 1,
0.8374378, -0.5750496, 3.021311, 0.7803922, 0, 1, 1,
0.8376141, 0.649037, 2.669839, 0.7882353, 0, 1, 1,
0.8382508, -0.4713548, 2.94349, 0.7921569, 0, 1, 1,
0.8452217, 1.306614, 1.67512, 0.8, 0, 1, 1,
0.8489337, -0.3528525, 0.5374523, 0.8078431, 0, 1, 1,
0.8673587, 0.5723822, 0.6960777, 0.8117647, 0, 1, 1,
0.867372, -0.3545651, 1.28496, 0.8196079, 0, 1, 1,
0.8674236, -1.570919, 3.234087, 0.8235294, 0, 1, 1,
0.8684271, 1.521602, -0.1829714, 0.8313726, 0, 1, 1,
0.8695084, -1.08277, 1.788588, 0.8352941, 0, 1, 1,
0.8724404, 0.4982682, 0.3763505, 0.8431373, 0, 1, 1,
0.8762137, 0.7100787, 1.244916, 0.8470588, 0, 1, 1,
0.8800252, -0.6884318, 0.5768121, 0.854902, 0, 1, 1,
0.8816556, -0.2019829, 2.007522, 0.8588235, 0, 1, 1,
0.8841891, -1.448274, 2.414984, 0.8666667, 0, 1, 1,
0.8876797, -0.3743051, 2.167725, 0.8705882, 0, 1, 1,
0.8884879, -0.6861953, 2.140004, 0.8784314, 0, 1, 1,
0.893189, -1.16846, 2.410881, 0.8823529, 0, 1, 1,
0.8937655, -0.5784014, 3.50456, 0.8901961, 0, 1, 1,
0.9019431, 0.1065531, 2.579971, 0.8941177, 0, 1, 1,
0.9192213, -1.179583, 2.8644, 0.9019608, 0, 1, 1,
0.9284162, 1.090458, 0.06429428, 0.9098039, 0, 1, 1,
0.9292865, -1.270492, 0.3039207, 0.9137255, 0, 1, 1,
0.9368032, -1.601122, 3.276996, 0.9215686, 0, 1, 1,
0.9386089, -0.7398197, 1.603458, 0.9254902, 0, 1, 1,
0.9426712, 1.304447, 1.57215, 0.9333333, 0, 1, 1,
0.9472715, -2.710286, 2.377358, 0.9372549, 0, 1, 1,
0.950533, 0.3915116, 0.9666369, 0.945098, 0, 1, 1,
0.9534191, 0.3629848, 0.9184079, 0.9490196, 0, 1, 1,
0.9570248, 1.726123, -0.1706723, 0.9568627, 0, 1, 1,
0.9590998, -0.6902533, 1.144331, 0.9607843, 0, 1, 1,
0.9592462, -1.048842, 1.706405, 0.9686275, 0, 1, 1,
0.9600638, 0.1691228, 1.564057, 0.972549, 0, 1, 1,
0.9675075, 0.1139514, 0.9796417, 0.9803922, 0, 1, 1,
0.9683855, -0.808288, 2.265872, 0.9843137, 0, 1, 1,
0.9707492, -1.438382, 1.807363, 0.9921569, 0, 1, 1,
0.971136, 0.6776162, 1.078003, 0.9960784, 0, 1, 1,
0.9780207, -1.091793, 1.319991, 1, 0, 0.9960784, 1,
0.9880152, 0.923162, 2.344847, 1, 0, 0.9882353, 1,
0.9912395, 0.9244596, 1.489846, 1, 0, 0.9843137, 1,
0.9941878, 0.8216811, -0.2424546, 1, 0, 0.9764706, 1,
0.9983559, -0.07769123, 0.386131, 1, 0, 0.972549, 1,
1.003684, 0.4323601, -0.7893162, 1, 0, 0.9647059, 1,
1.004904, -0.7600172, 2.397472, 1, 0, 0.9607843, 1,
1.009024, -1.985075, 0.3738227, 1, 0, 0.9529412, 1,
1.010017, 0.685914, 1.225084, 1, 0, 0.9490196, 1,
1.012094, -0.4558296, 1.61826, 1, 0, 0.9411765, 1,
1.015193, -1.646662, 2.721575, 1, 0, 0.9372549, 1,
1.016939, 0.9946927, -0.9946963, 1, 0, 0.9294118, 1,
1.019889, 0.8506552, 3.928759, 1, 0, 0.9254902, 1,
1.021054, -0.794356, 1.120268, 1, 0, 0.9176471, 1,
1.036968, -1.230523, 1.603915, 1, 0, 0.9137255, 1,
1.037925, -2.263115, 1.793411, 1, 0, 0.9058824, 1,
1.051069, -0.1750537, 2.691206, 1, 0, 0.9019608, 1,
1.051864, -0.1791128, 1.60234, 1, 0, 0.8941177, 1,
1.056381, -1.414688, 3.233806, 1, 0, 0.8862745, 1,
1.058167, 1.128429, -0.6184152, 1, 0, 0.8823529, 1,
1.069261, 1.711262, -1.775118, 1, 0, 0.8745098, 1,
1.073176, 0.2868265, 1.340503, 1, 0, 0.8705882, 1,
1.07899, 1.110594, 0.1336756, 1, 0, 0.8627451, 1,
1.080938, -0.7351643, 2.783859, 1, 0, 0.8588235, 1,
1.109704, 0.3075068, 0.7776234, 1, 0, 0.8509804, 1,
1.110639, 0.5812302, 2.306155, 1, 0, 0.8470588, 1,
1.120684, -0.7260203, 3.105899, 1, 0, 0.8392157, 1,
1.121106, -0.6152846, 1.435714, 1, 0, 0.8352941, 1,
1.123583, -0.5061914, 2.768209, 1, 0, 0.827451, 1,
1.127434, -0.1236452, 1.659724, 1, 0, 0.8235294, 1,
1.131758, 0.5824643, 0.8661401, 1, 0, 0.8156863, 1,
1.137007, 1.159989, 2.350786, 1, 0, 0.8117647, 1,
1.145724, 1.30678, 2.367363, 1, 0, 0.8039216, 1,
1.149856, -1.372482, 1.057426, 1, 0, 0.7960784, 1,
1.157105, 1.84397, 1.326531, 1, 0, 0.7921569, 1,
1.157365, 1.14152, 0.8261997, 1, 0, 0.7843137, 1,
1.169426, 1.627557, 0.7048485, 1, 0, 0.7803922, 1,
1.172865, 0.7608678, 0.807929, 1, 0, 0.772549, 1,
1.179664, -0.1595376, 1.715105, 1, 0, 0.7686275, 1,
1.180694, -0.7147972, 2.125703, 1, 0, 0.7607843, 1,
1.185957, 0.02022614, 3.118828, 1, 0, 0.7568628, 1,
1.18972, 0.3642107, 1.108981, 1, 0, 0.7490196, 1,
1.192169, -0.1707625, 1.425781, 1, 0, 0.7450981, 1,
1.192679, -0.9409448, 1.411414, 1, 0, 0.7372549, 1,
1.198351, -0.2564892, 3.395294, 1, 0, 0.7333333, 1,
1.203976, -0.8869729, 2.408992, 1, 0, 0.7254902, 1,
1.20501, -0.9790603, 1.696809, 1, 0, 0.7215686, 1,
1.209613, -1.75434, 3.312162, 1, 0, 0.7137255, 1,
1.212403, 1.353088, 1.766486, 1, 0, 0.7098039, 1,
1.215953, 0.004777341, 2.71945, 1, 0, 0.7019608, 1,
1.231795, -0.9500329, 2.475265, 1, 0, 0.6941177, 1,
1.238826, -0.2200883, 2.41127, 1, 0, 0.6901961, 1,
1.25134, -0.7124333, 3.895255, 1, 0, 0.682353, 1,
1.251615, -1.551035, 2.824829, 1, 0, 0.6784314, 1,
1.255555, 0.3787892, 2.37401, 1, 0, 0.6705883, 1,
1.256217, -1.01362, 2.052538, 1, 0, 0.6666667, 1,
1.259899, -0.08809195, 2.962039, 1, 0, 0.6588235, 1,
1.26204, -1.142157, 0.8185443, 1, 0, 0.654902, 1,
1.273869, 0.7438877, 0.01605062, 1, 0, 0.6470588, 1,
1.2745, 0.0465041, 0.5554932, 1, 0, 0.6431373, 1,
1.277591, -1.653127, 5.229979, 1, 0, 0.6352941, 1,
1.282416, 0.6837877, 1.353936, 1, 0, 0.6313726, 1,
1.286026, -1.557351, 2.450339, 1, 0, 0.6235294, 1,
1.289286, -1.701026, 1.765882, 1, 0, 0.6196079, 1,
1.289778, 0.5472891, 0.5251454, 1, 0, 0.6117647, 1,
1.295003, 0.4287716, 2.684567, 1, 0, 0.6078432, 1,
1.305569, 0.0373837, 1.009032, 1, 0, 0.6, 1,
1.308417, 1.579813, 1.119235, 1, 0, 0.5921569, 1,
1.311856, 2.56784, 2.094611, 1, 0, 0.5882353, 1,
1.323009, 1.822686, 0.9830272, 1, 0, 0.5803922, 1,
1.336518, 0.9403719, 1.015448, 1, 0, 0.5764706, 1,
1.341834, 0.6468912, 2.187015, 1, 0, 0.5686275, 1,
1.341988, -0.456168, 3.459002, 1, 0, 0.5647059, 1,
1.348066, 0.3567279, -0.006684393, 1, 0, 0.5568628, 1,
1.35344, -0.756573, 1.640668, 1, 0, 0.5529412, 1,
1.359024, 1.665962, 2.066633, 1, 0, 0.5450981, 1,
1.359616, 1.02209, 1.568727, 1, 0, 0.5411765, 1,
1.368276, 1.1063, -0.3266769, 1, 0, 0.5333334, 1,
1.36987, 0.3907812, 2.393068, 1, 0, 0.5294118, 1,
1.369965, -0.557196, 1.953007, 1, 0, 0.5215687, 1,
1.379622, 0.2650997, 1.544832, 1, 0, 0.5176471, 1,
1.386694, -0.7058657, -0.04727378, 1, 0, 0.509804, 1,
1.41145, 1.250238, 0.1110401, 1, 0, 0.5058824, 1,
1.414299, -0.9950665, 1.777002, 1, 0, 0.4980392, 1,
1.416721, -1.452118, 1.106745, 1, 0, 0.4901961, 1,
1.419975, -0.2343704, 0.3337902, 1, 0, 0.4862745, 1,
1.425696, -0.7509743, 1.949825, 1, 0, 0.4784314, 1,
1.428778, -1.082036, 2.415281, 1, 0, 0.4745098, 1,
1.430925, 0.2019797, 0.7300512, 1, 0, 0.4666667, 1,
1.459662, 0.4717095, 0.8589966, 1, 0, 0.4627451, 1,
1.461196, -0.2698717, 1.000543, 1, 0, 0.454902, 1,
1.472656, -2.461978, 3.169944, 1, 0, 0.4509804, 1,
1.472974, 0.9359586, 1.291829, 1, 0, 0.4431373, 1,
1.473371, -0.754644, 1.923546, 1, 0, 0.4392157, 1,
1.478388, 0.8467692, 2.091669, 1, 0, 0.4313726, 1,
1.482152, 0.3840589, 2.117953, 1, 0, 0.427451, 1,
1.4938, 0.7255669, 0.8926474, 1, 0, 0.4196078, 1,
1.493812, -0.676153, 4.197865, 1, 0, 0.4156863, 1,
1.496952, -0.5128648, 1.911469, 1, 0, 0.4078431, 1,
1.52967, 1.15887, 1.723945, 1, 0, 0.4039216, 1,
1.531638, -1.767945, 2.106332, 1, 0, 0.3960784, 1,
1.537395, 0.0730056, 1.505421, 1, 0, 0.3882353, 1,
1.541735, -0.03688536, 1.641539, 1, 0, 0.3843137, 1,
1.542144, -0.160522, 3.43626, 1, 0, 0.3764706, 1,
1.549016, -2.23093, 3.614942, 1, 0, 0.372549, 1,
1.551938, 0.4487866, 1.452663, 1, 0, 0.3647059, 1,
1.566632, -0.05405292, 1.504019, 1, 0, 0.3607843, 1,
1.571886, 2.113764, 1.269888, 1, 0, 0.3529412, 1,
1.579859, -0.1346688, 1.922812, 1, 0, 0.3490196, 1,
1.582241, -0.2918526, 0.9700191, 1, 0, 0.3411765, 1,
1.582461, 1.954139, 1.132993, 1, 0, 0.3372549, 1,
1.584038, -0.1236877, 1.86066, 1, 0, 0.3294118, 1,
1.597, 1.264105, 1.981271, 1, 0, 0.3254902, 1,
1.610217, 0.5230227, 0.6827628, 1, 0, 0.3176471, 1,
1.61299, 1.446075, 0.1454751, 1, 0, 0.3137255, 1,
1.637397, 0.5106854, 0.9732478, 1, 0, 0.3058824, 1,
1.642631, 1.012604, 2.32293, 1, 0, 0.2980392, 1,
1.664973, 1.076288, 0.7018223, 1, 0, 0.2941177, 1,
1.688536, -1.838291, 3.054064, 1, 0, 0.2862745, 1,
1.704829, -0.5143557, 3.565528, 1, 0, 0.282353, 1,
1.723293, 1.33006, 0.4723131, 1, 0, 0.2745098, 1,
1.723991, 0.2474463, 2.058913, 1, 0, 0.2705882, 1,
1.724661, -0.3794791, 1.935391, 1, 0, 0.2627451, 1,
1.728944, 0.8428335, 3.165005, 1, 0, 0.2588235, 1,
1.731348, -2.603573, 2.734206, 1, 0, 0.2509804, 1,
1.732333, -0.9490286, 3.671928, 1, 0, 0.2470588, 1,
1.789574, 0.7093759, 1.549306, 1, 0, 0.2392157, 1,
1.795551, 0.4485332, 1.182742, 1, 0, 0.2352941, 1,
1.817457, 1.932251, 0.2854785, 1, 0, 0.227451, 1,
1.826289, 1.292456, 1.515929, 1, 0, 0.2235294, 1,
1.833968, -1.653425, 3.713275, 1, 0, 0.2156863, 1,
1.841013, -1.899002, 0.1673091, 1, 0, 0.2117647, 1,
1.845353, -0.06671885, 2.342318, 1, 0, 0.2039216, 1,
1.872547, 0.9211047, 3.235905, 1, 0, 0.1960784, 1,
1.876708, 0.09801605, 3.278507, 1, 0, 0.1921569, 1,
1.880027, 0.2610317, 1.916532, 1, 0, 0.1843137, 1,
1.880841, 1.448769, 0.5580066, 1, 0, 0.1803922, 1,
1.893014, 0.3549621, -0.1022357, 1, 0, 0.172549, 1,
1.899594, 0.1056512, 0.4797208, 1, 0, 0.1686275, 1,
1.906005, 0.5620264, 1.358665, 1, 0, 0.1607843, 1,
1.918105, 1.009394, 2.519507, 1, 0, 0.1568628, 1,
1.920599, 1.124695, 2.14044, 1, 0, 0.1490196, 1,
1.927985, 0.2769229, 0.9935979, 1, 0, 0.145098, 1,
1.932953, 0.1530603, 1.040329, 1, 0, 0.1372549, 1,
1.963358, 1.021997, 1.780515, 1, 0, 0.1333333, 1,
1.980714, -0.1533649, 1.256596, 1, 0, 0.1254902, 1,
2.016398, -0.503771, 2.757099, 1, 0, 0.1215686, 1,
2.024955, -0.08948515, 1.998727, 1, 0, 0.1137255, 1,
2.143064, -0.8758941, 3.199407, 1, 0, 0.1098039, 1,
2.164246, 0.7996024, -0.1190949, 1, 0, 0.1019608, 1,
2.182224, 0.1486892, 2.232605, 1, 0, 0.09411765, 1,
2.204942, 0.6957984, 3.364471, 1, 0, 0.09019608, 1,
2.288407, -0.7370378, 1.444831, 1, 0, 0.08235294, 1,
2.329471, -1.224538, 1.585773, 1, 0, 0.07843138, 1,
2.426342, 0.1014516, 2.036475, 1, 0, 0.07058824, 1,
2.564762, -1.100673, 1.212238, 1, 0, 0.06666667, 1,
2.653527, 0.7325344, 2.018935, 1, 0, 0.05882353, 1,
2.68723, 0.6385564, 1.6028, 1, 0, 0.05490196, 1,
2.707688, -1.162056, -0.05408358, 1, 0, 0.04705882, 1,
2.712484, 1.176443, 2.129548, 1, 0, 0.04313726, 1,
2.738705, 1.290453, -1.412024, 1, 0, 0.03529412, 1,
2.769646, 0.5635595, 1.482657, 1, 0, 0.03137255, 1,
2.828408, 2.118536, 0.9118926, 1, 0, 0.02352941, 1,
2.869946, 0.5738626, 1.343045, 1, 0, 0.01960784, 1,
2.974886, 1.114123, 0.6449985, 1, 0, 0.01176471, 1,
3.05126, 0.5005953, 2.729642, 1, 0, 0.007843138, 1
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
-0.1035269, -4.28429, -6.875989, 0, -0.5, 0.5, 0.5,
-0.1035269, -4.28429, -6.875989, 1, -0.5, 0.5, 0.5,
-0.1035269, -4.28429, -6.875989, 1, 1.5, 0.5, 0.5,
-0.1035269, -4.28429, -6.875989, 0, 1.5, 0.5, 0.5
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
-4.327787, -0.2050595, -6.875989, 0, -0.5, 0.5, 0.5,
-4.327787, -0.2050595, -6.875989, 1, -0.5, 0.5, 0.5,
-4.327787, -0.2050595, -6.875989, 1, 1.5, 0.5, 0.5,
-4.327787, -0.2050595, -6.875989, 0, 1.5, 0.5, 0.5
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
-4.327787, -4.28429, 0.05427647, 0, -0.5, 0.5, 0.5,
-4.327787, -4.28429, 0.05427647, 1, -0.5, 0.5, 0.5,
-4.327787, -4.28429, 0.05427647, 1, 1.5, 0.5, 0.5,
-4.327787, -4.28429, 0.05427647, 0, 1.5, 0.5, 0.5
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
-3, -3.342929, -5.276697,
3, -3.342929, -5.276697,
-3, -3.342929, -5.276697,
-3, -3.499823, -5.543246,
-2, -3.342929, -5.276697,
-2, -3.499823, -5.543246,
-1, -3.342929, -5.276697,
-1, -3.499823, -5.543246,
0, -3.342929, -5.276697,
0, -3.499823, -5.543246,
1, -3.342929, -5.276697,
1, -3.499823, -5.543246,
2, -3.342929, -5.276697,
2, -3.499823, -5.543246,
3, -3.342929, -5.276697,
3, -3.499823, -5.543246
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
-3, -3.81361, -6.076343, 0, -0.5, 0.5, 0.5,
-3, -3.81361, -6.076343, 1, -0.5, 0.5, 0.5,
-3, -3.81361, -6.076343, 1, 1.5, 0.5, 0.5,
-3, -3.81361, -6.076343, 0, 1.5, 0.5, 0.5,
-2, -3.81361, -6.076343, 0, -0.5, 0.5, 0.5,
-2, -3.81361, -6.076343, 1, -0.5, 0.5, 0.5,
-2, -3.81361, -6.076343, 1, 1.5, 0.5, 0.5,
-2, -3.81361, -6.076343, 0, 1.5, 0.5, 0.5,
-1, -3.81361, -6.076343, 0, -0.5, 0.5, 0.5,
-1, -3.81361, -6.076343, 1, -0.5, 0.5, 0.5,
-1, -3.81361, -6.076343, 1, 1.5, 0.5, 0.5,
-1, -3.81361, -6.076343, 0, 1.5, 0.5, 0.5,
0, -3.81361, -6.076343, 0, -0.5, 0.5, 0.5,
0, -3.81361, -6.076343, 1, -0.5, 0.5, 0.5,
0, -3.81361, -6.076343, 1, 1.5, 0.5, 0.5,
0, -3.81361, -6.076343, 0, 1.5, 0.5, 0.5,
1, -3.81361, -6.076343, 0, -0.5, 0.5, 0.5,
1, -3.81361, -6.076343, 1, -0.5, 0.5, 0.5,
1, -3.81361, -6.076343, 1, 1.5, 0.5, 0.5,
1, -3.81361, -6.076343, 0, 1.5, 0.5, 0.5,
2, -3.81361, -6.076343, 0, -0.5, 0.5, 0.5,
2, -3.81361, -6.076343, 1, -0.5, 0.5, 0.5,
2, -3.81361, -6.076343, 1, 1.5, 0.5, 0.5,
2, -3.81361, -6.076343, 0, 1.5, 0.5, 0.5,
3, -3.81361, -6.076343, 0, -0.5, 0.5, 0.5,
3, -3.81361, -6.076343, 1, -0.5, 0.5, 0.5,
3, -3.81361, -6.076343, 1, 1.5, 0.5, 0.5,
3, -3.81361, -6.076343, 0, 1.5, 0.5, 0.5
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
-3.352958, -3, -5.276697,
-3.352958, 2, -5.276697,
-3.352958, -3, -5.276697,
-3.515429, -3, -5.543246,
-3.352958, -2, -5.276697,
-3.515429, -2, -5.543246,
-3.352958, -1, -5.276697,
-3.515429, -1, -5.543246,
-3.352958, 0, -5.276697,
-3.515429, 0, -5.543246,
-3.352958, 1, -5.276697,
-3.515429, 1, -5.543246,
-3.352958, 2, -5.276697,
-3.515429, 2, -5.543246
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
-3.840373, -3, -6.076343, 0, -0.5, 0.5, 0.5,
-3.840373, -3, -6.076343, 1, -0.5, 0.5, 0.5,
-3.840373, -3, -6.076343, 1, 1.5, 0.5, 0.5,
-3.840373, -3, -6.076343, 0, 1.5, 0.5, 0.5,
-3.840373, -2, -6.076343, 0, -0.5, 0.5, 0.5,
-3.840373, -2, -6.076343, 1, -0.5, 0.5, 0.5,
-3.840373, -2, -6.076343, 1, 1.5, 0.5, 0.5,
-3.840373, -2, -6.076343, 0, 1.5, 0.5, 0.5,
-3.840373, -1, -6.076343, 0, -0.5, 0.5, 0.5,
-3.840373, -1, -6.076343, 1, -0.5, 0.5, 0.5,
-3.840373, -1, -6.076343, 1, 1.5, 0.5, 0.5,
-3.840373, -1, -6.076343, 0, 1.5, 0.5, 0.5,
-3.840373, 0, -6.076343, 0, -0.5, 0.5, 0.5,
-3.840373, 0, -6.076343, 1, -0.5, 0.5, 0.5,
-3.840373, 0, -6.076343, 1, 1.5, 0.5, 0.5,
-3.840373, 0, -6.076343, 0, 1.5, 0.5, 0.5,
-3.840373, 1, -6.076343, 0, -0.5, 0.5, 0.5,
-3.840373, 1, -6.076343, 1, -0.5, 0.5, 0.5,
-3.840373, 1, -6.076343, 1, 1.5, 0.5, 0.5,
-3.840373, 1, -6.076343, 0, 1.5, 0.5, 0.5,
-3.840373, 2, -6.076343, 0, -0.5, 0.5, 0.5,
-3.840373, 2, -6.076343, 1, -0.5, 0.5, 0.5,
-3.840373, 2, -6.076343, 1, 1.5, 0.5, 0.5,
-3.840373, 2, -6.076343, 0, 1.5, 0.5, 0.5
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
-3.352958, -3.342929, -4,
-3.352958, -3.342929, 4,
-3.352958, -3.342929, -4,
-3.515429, -3.499823, -4,
-3.352958, -3.342929, -2,
-3.515429, -3.499823, -2,
-3.352958, -3.342929, 0,
-3.515429, -3.499823, 0,
-3.352958, -3.342929, 2,
-3.515429, -3.499823, 2,
-3.352958, -3.342929, 4,
-3.515429, -3.499823, 4
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
-3.840373, -3.81361, -4, 0, -0.5, 0.5, 0.5,
-3.840373, -3.81361, -4, 1, -0.5, 0.5, 0.5,
-3.840373, -3.81361, -4, 1, 1.5, 0.5, 0.5,
-3.840373, -3.81361, -4, 0, 1.5, 0.5, 0.5,
-3.840373, -3.81361, -2, 0, -0.5, 0.5, 0.5,
-3.840373, -3.81361, -2, 1, -0.5, 0.5, 0.5,
-3.840373, -3.81361, -2, 1, 1.5, 0.5, 0.5,
-3.840373, -3.81361, -2, 0, 1.5, 0.5, 0.5,
-3.840373, -3.81361, 0, 0, -0.5, 0.5, 0.5,
-3.840373, -3.81361, 0, 1, -0.5, 0.5, 0.5,
-3.840373, -3.81361, 0, 1, 1.5, 0.5, 0.5,
-3.840373, -3.81361, 0, 0, 1.5, 0.5, 0.5,
-3.840373, -3.81361, 2, 0, -0.5, 0.5, 0.5,
-3.840373, -3.81361, 2, 1, -0.5, 0.5, 0.5,
-3.840373, -3.81361, 2, 1, 1.5, 0.5, 0.5,
-3.840373, -3.81361, 2, 0, 1.5, 0.5, 0.5,
-3.840373, -3.81361, 4, 0, -0.5, 0.5, 0.5,
-3.840373, -3.81361, 4, 1, -0.5, 0.5, 0.5,
-3.840373, -3.81361, 4, 1, 1.5, 0.5, 0.5,
-3.840373, -3.81361, 4, 0, 1.5, 0.5, 0.5
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
-3.352958, -3.342929, -5.276697,
-3.352958, 2.93281, -5.276697,
-3.352958, -3.342929, 5.38525,
-3.352958, 2.93281, 5.38525,
-3.352958, -3.342929, -5.276697,
-3.352958, -3.342929, 5.38525,
-3.352958, 2.93281, -5.276697,
-3.352958, 2.93281, 5.38525,
-3.352958, -3.342929, -5.276697,
3.145904, -3.342929, -5.276697,
-3.352958, -3.342929, 5.38525,
3.145904, -3.342929, 5.38525,
-3.352958, 2.93281, -5.276697,
3.145904, 2.93281, -5.276697,
-3.352958, 2.93281, 5.38525,
3.145904, 2.93281, 5.38525,
3.145904, -3.342929, -5.276697,
3.145904, 2.93281, -5.276697,
3.145904, -3.342929, 5.38525,
3.145904, 2.93281, 5.38525,
3.145904, -3.342929, -5.276697,
3.145904, -3.342929, 5.38525,
3.145904, 2.93281, -5.276697,
3.145904, 2.93281, 5.38525
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
var radius = 7.462314;
var distance = 33.20068;
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
mvMatrix.translate( 0.1035269, 0.2050595, -0.05427647 );
mvMatrix.scale( 1.24151, 1.285649, 0.7567473 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.20068);
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
imazamox<-read.table("imazamox.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-imazamox$V2
```

```
## Error in eval(expr, envir, enclos): object 'imazamox' not found
```

```r
y<-imazamox$V3
```

```
## Error in eval(expr, envir, enclos): object 'imazamox' not found
```

```r
z<-imazamox$V4
```

```
## Error in eval(expr, envir, enclos): object 'imazamox' not found
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
-3.258314, 0.2863468, -1.347272, 0, 0, 1, 1, 1,
-2.958766, 0.03842939, -2.456816, 1, 0, 0, 1, 1,
-2.722432, -0.1034922, -2.310453, 1, 0, 0, 1, 1,
-2.630858, 1.025625, -1.818954, 1, 0, 0, 1, 1,
-2.503247, 0.04905669, -1.654908, 1, 0, 0, 1, 1,
-2.408266, -2.264126, -2.993833, 1, 0, 0, 1, 1,
-2.364016, -1.581421, -2.181099, 0, 0, 0, 1, 1,
-2.338955, -1.821367, -1.369732, 0, 0, 0, 1, 1,
-2.335707, -0.8524689, -2.462641, 0, 0, 0, 1, 1,
-2.305707, 0.3882265, -0.1791318, 0, 0, 0, 1, 1,
-2.269646, -0.5288334, -0.219883, 0, 0, 0, 1, 1,
-2.250028, 1.189587, -0.5041647, 0, 0, 0, 1, 1,
-2.233001, -0.6347118, -2.264359, 0, 0, 0, 1, 1,
-2.228552, -1.489423, -1.94751, 1, 1, 1, 1, 1,
-2.222445, 0.3230148, -3.50853, 1, 1, 1, 1, 1,
-2.20589, 0.05622789, -2.320565, 1, 1, 1, 1, 1,
-2.202081, -1.788707, -2.299408, 1, 1, 1, 1, 1,
-2.186164, -1.163885, -2.397253, 1, 1, 1, 1, 1,
-2.183228, -1.25894, -0.8977264, 1, 1, 1, 1, 1,
-2.09091, 1.973944, 0.222119, 1, 1, 1, 1, 1,
-2.062548, -0.8085814, -2.380394, 1, 1, 1, 1, 1,
-2.054144, 0.2621406, -1.535041, 1, 1, 1, 1, 1,
-2.036232, -0.7936983, -1.870182, 1, 1, 1, 1, 1,
-1.985358, 1.92392, -0.9945279, 1, 1, 1, 1, 1,
-1.965785, -0.2764562, -1.453489, 1, 1, 1, 1, 1,
-1.951871, 0.4250699, -1.25725, 1, 1, 1, 1, 1,
-1.921853, 0.1909751, -1.303853, 1, 1, 1, 1, 1,
-1.916874, 0.2978644, -0.962414, 1, 1, 1, 1, 1,
-1.909275, 2.593374, 0.9140064, 0, 0, 1, 1, 1,
-1.901973, -0.04350176, -1.86654, 1, 0, 0, 1, 1,
-1.882919, -0.6107153, -2.422188, 1, 0, 0, 1, 1,
-1.871744, -0.172886, -0.2913114, 1, 0, 0, 1, 1,
-1.822295, 0.3373635, -1.242776, 1, 0, 0, 1, 1,
-1.817704, 1.670262, -1.393525, 1, 0, 0, 1, 1,
-1.816403, 1.32796, -1.749696, 0, 0, 0, 1, 1,
-1.812739, -0.001353899, -0.5005326, 0, 0, 0, 1, 1,
-1.810451, -0.8582785, -1.190514, 0, 0, 0, 1, 1,
-1.791852, 0.5792301, -1.175333, 0, 0, 0, 1, 1,
-1.788403, -0.9396768, -1.17067, 0, 0, 0, 1, 1,
-1.787381, -0.7128367, -0.3053233, 0, 0, 0, 1, 1,
-1.752994, -0.956145, -3.136951, 0, 0, 0, 1, 1,
-1.740816, 0.05988752, -1.54879, 1, 1, 1, 1, 1,
-1.725125, -0.3699639, -1.667912, 1, 1, 1, 1, 1,
-1.715683, 0.1200774, -1.551641, 1, 1, 1, 1, 1,
-1.71334, 0.4048997, -2.114748, 1, 1, 1, 1, 1,
-1.689265, 0.1528601, -1.323915, 1, 1, 1, 1, 1,
-1.67121, 2.380875, 0.2344924, 1, 1, 1, 1, 1,
-1.666271, 0.01736696, -2.510228, 1, 1, 1, 1, 1,
-1.663681, -2.754636, -1.833809, 1, 1, 1, 1, 1,
-1.636619, -0.6046648, -2.007281, 1, 1, 1, 1, 1,
-1.589581, 0.6038207, -2.153631, 1, 1, 1, 1, 1,
-1.578111, 0.2038686, -3.841791, 1, 1, 1, 1, 1,
-1.563869, 0.9942049, -0.9592415, 1, 1, 1, 1, 1,
-1.552513, -2.042171, -4.107702, 1, 1, 1, 1, 1,
-1.538116, -3.174209, -2.61605, 1, 1, 1, 1, 1,
-1.520901, 0.402861, -2.18561, 1, 1, 1, 1, 1,
-1.51844, 0.1473168, -1.011027, 0, 0, 1, 1, 1,
-1.512922, -1.493001, -3.48118, 1, 0, 0, 1, 1,
-1.508495, -0.0004867058, -1.16797, 1, 0, 0, 1, 1,
-1.5084, 0.9561692, -1.479539, 1, 0, 0, 1, 1,
-1.505818, 0.1741951, -0.05368929, 1, 0, 0, 1, 1,
-1.494604, -1.325539, -1.656757, 1, 0, 0, 1, 1,
-1.493425, 1.866702, -1.110291, 0, 0, 0, 1, 1,
-1.466599, -0.5902916, -1.334731, 0, 0, 0, 1, 1,
-1.45966, -0.8568147, -2.377429, 0, 0, 0, 1, 1,
-1.458699, 0.04016779, -0.375751, 0, 0, 0, 1, 1,
-1.458584, -0.894991, -2.216782, 0, 0, 0, 1, 1,
-1.455568, 0.881712, -1.710182, 0, 0, 0, 1, 1,
-1.455456, -1.003255, -3.757514, 0, 0, 0, 1, 1,
-1.454916, -0.5454103, -2.183946, 1, 1, 1, 1, 1,
-1.452026, 1.572002, -1.730769, 1, 1, 1, 1, 1,
-1.450742, -1.287248, -0.9600801, 1, 1, 1, 1, 1,
-1.441338, -0.05431546, -1.471513, 1, 1, 1, 1, 1,
-1.434197, 0.1073478, -2.095773, 1, 1, 1, 1, 1,
-1.427355, 0.4423943, -2.03584, 1, 1, 1, 1, 1,
-1.415424, 0.5538511, -3.182261, 1, 1, 1, 1, 1,
-1.408019, 0.7597396, -3.007616, 1, 1, 1, 1, 1,
-1.407185, -2.298023, -4.917218, 1, 1, 1, 1, 1,
-1.400371, 1.60003, 0.5589467, 1, 1, 1, 1, 1,
-1.364368, -0.1977516, -0.5306782, 1, 1, 1, 1, 1,
-1.361214, -0.3057868, -1.845537, 1, 1, 1, 1, 1,
-1.359875, -1.38824, 0.3160668, 1, 1, 1, 1, 1,
-1.358945, 0.1826826, -1.071565, 1, 1, 1, 1, 1,
-1.346188, 0.2716126, -1.31773, 1, 1, 1, 1, 1,
-1.340032, -0.8863305, -1.980061, 0, 0, 1, 1, 1,
-1.338969, 1.788448, 1.605081, 1, 0, 0, 1, 1,
-1.338632, -0.7738335, -3.624395, 1, 0, 0, 1, 1,
-1.327821, 0.05824243, -2.701957, 1, 0, 0, 1, 1,
-1.321348, 0.3267809, -0.9135953, 1, 0, 0, 1, 1,
-1.31411, -0.6059409, -1.990926, 1, 0, 0, 1, 1,
-1.308423, -1.298869, -1.604725, 0, 0, 0, 1, 1,
-1.307532, -1.444469, -2.53951, 0, 0, 0, 1, 1,
-1.293859, -1.711135, -3.175025, 0, 0, 0, 1, 1,
-1.288166, 1.157759, 0.3539166, 0, 0, 0, 1, 1,
-1.284753, -1.023008, -2.062017, 0, 0, 0, 1, 1,
-1.283678, -0.848825, -3.831136, 0, 0, 0, 1, 1,
-1.281516, -0.2895521, -1.316958, 0, 0, 0, 1, 1,
-1.279631, 2.224351, 0.1947786, 1, 1, 1, 1, 1,
-1.276322, 1.169696, -0.3169272, 1, 1, 1, 1, 1,
-1.269191, -1.123974, -4.063261, 1, 1, 1, 1, 1,
-1.265885, -0.579707, -2.916254, 1, 1, 1, 1, 1,
-1.264603, 0.5827997, -0.9586837, 1, 1, 1, 1, 1,
-1.262599, -1.081865, -1.815886, 1, 1, 1, 1, 1,
-1.253951, 0.1840095, -0.9243201, 1, 1, 1, 1, 1,
-1.241934, -0.5868155, -1.858937, 1, 1, 1, 1, 1,
-1.239919, -0.6426165, -1.591305, 1, 1, 1, 1, 1,
-1.238336, -1.162599, -2.814948, 1, 1, 1, 1, 1,
-1.229828, 2.131248, -2.7791, 1, 1, 1, 1, 1,
-1.228297, -0.6808389, -0.7728957, 1, 1, 1, 1, 1,
-1.220512, -0.002762561, -1.26646, 1, 1, 1, 1, 1,
-1.216812, -0.6638553, -1.65792, 1, 1, 1, 1, 1,
-1.207906, 1.836426, -0.7668592, 1, 1, 1, 1, 1,
-1.206331, -0.03296724, -0.9113383, 0, 0, 1, 1, 1,
-1.204556, -1.08572, -1.867936, 1, 0, 0, 1, 1,
-1.200438, 0.4912005, -2.449425, 1, 0, 0, 1, 1,
-1.198009, -0.6246441, -2.567592, 1, 0, 0, 1, 1,
-1.197547, 0.1454388, -1.619227, 1, 0, 0, 1, 1,
-1.195448, -1.656673, -2.015807, 1, 0, 0, 1, 1,
-1.191524, 0.9649677, -2.937492, 0, 0, 0, 1, 1,
-1.189944, -0.4347152, 0.07322471, 0, 0, 0, 1, 1,
-1.182889, -0.8985243, -2.168303, 0, 0, 0, 1, 1,
-1.182369, -0.7999986, -2.003209, 0, 0, 0, 1, 1,
-1.178206, 1.702604, 0.814602, 0, 0, 0, 1, 1,
-1.175147, -0.03595584, -2.26586, 0, 0, 0, 1, 1,
-1.175067, 0.857558, 0.466726, 0, 0, 0, 1, 1,
-1.174329, 0.1974076, -1.401452, 1, 1, 1, 1, 1,
-1.173361, -0.3934102, -2.630682, 1, 1, 1, 1, 1,
-1.172835, -0.1404114, -2.111977, 1, 1, 1, 1, 1,
-1.166248, -1.577561, -2.832547, 1, 1, 1, 1, 1,
-1.14813, -0.7838336, -2.665678, 1, 1, 1, 1, 1,
-1.148027, -0.9983875, -3.307564, 1, 1, 1, 1, 1,
-1.142039, 0.3728594, -1.383241, 1, 1, 1, 1, 1,
-1.140414, -0.446401, -1.203852, 1, 1, 1, 1, 1,
-1.138298, -1.476018, -2.154428, 1, 1, 1, 1, 1,
-1.136815, 0.9946922, -0.3396774, 1, 1, 1, 1, 1,
-1.131641, 1.132655, -0.8862849, 1, 1, 1, 1, 1,
-1.131505, -0.2893828, -2.175487, 1, 1, 1, 1, 1,
-1.128852, 0.6447106, 0.779416, 1, 1, 1, 1, 1,
-1.123888, -0.9677571, -4.351482, 1, 1, 1, 1, 1,
-1.121801, -1.17662, -1.062477, 1, 1, 1, 1, 1,
-1.120199, -0.08395939, -3.675863, 0, 0, 1, 1, 1,
-1.120005, 1.693632, -0.2292693, 1, 0, 0, 1, 1,
-1.119484, 0.8934624, -1.009479, 1, 0, 0, 1, 1,
-1.116956, 1.174221, -1.731886, 1, 0, 0, 1, 1,
-1.113475, -0.2710801, -2.505426, 1, 0, 0, 1, 1,
-1.113432, -0.03649534, -1.108205, 1, 0, 0, 1, 1,
-1.107496, -0.1865603, -2.36027, 0, 0, 0, 1, 1,
-1.103478, 1.343396, -0.6724052, 0, 0, 0, 1, 1,
-1.10063, -0.2947413, -1.700992, 0, 0, 0, 1, 1,
-1.094752, -2.131143, -1.100951, 0, 0, 0, 1, 1,
-1.08861, -1.794602, -2.401324, 0, 0, 0, 1, 1,
-1.085175, 0.7494977, -1.066971, 0, 0, 0, 1, 1,
-1.081165, 2.040241, -1.978875, 0, 0, 0, 1, 1,
-1.078958, 0.3847875, -0.6538266, 1, 1, 1, 1, 1,
-1.072739, 0.09337097, 1.236383, 1, 1, 1, 1, 1,
-1.064431, -0.2913895, -1.033958, 1, 1, 1, 1, 1,
-1.062482, -1.764819, -2.450912, 1, 1, 1, 1, 1,
-1.060812, 0.6054206, -2.350096, 1, 1, 1, 1, 1,
-1.05653, 0.5821571, -2.378398, 1, 1, 1, 1, 1,
-1.054415, -0.2082285, -2.774411, 1, 1, 1, 1, 1,
-1.05314, -2.649549, -3.117318, 1, 1, 1, 1, 1,
-1.034208, 0.3740067, -0.6705987, 1, 1, 1, 1, 1,
-1.027127, 0.07348976, -1.433745, 1, 1, 1, 1, 1,
-1.02305, 2.081126, -0.2531092, 1, 1, 1, 1, 1,
-1.018517, 2.08435, -0.4279828, 1, 1, 1, 1, 1,
-1.017954, 0.1217096, -1.877479, 1, 1, 1, 1, 1,
-1.007162, 0.3110803, -0.0578149, 1, 1, 1, 1, 1,
-1.006718, -0.6022639, -2.82603, 1, 1, 1, 1, 1,
-0.9909116, -0.2944972, -0.7531055, 0, 0, 1, 1, 1,
-0.9905172, 0.8546579, 0.06665596, 1, 0, 0, 1, 1,
-0.9825494, 0.8039899, -0.7214141, 1, 0, 0, 1, 1,
-0.9810057, -0.654428, -3.474659, 1, 0, 0, 1, 1,
-0.9779972, 0.7744585, -1.365275, 1, 0, 0, 1, 1,
-0.9692664, -1.24485, -2.703098, 1, 0, 0, 1, 1,
-0.9690027, -0.8295656, -3.531415, 0, 0, 0, 1, 1,
-0.954805, 0.4737129, -0.6257474, 0, 0, 0, 1, 1,
-0.954195, -0.6980804, -3.039021, 0, 0, 0, 1, 1,
-0.9525731, 0.5994654, -1.766324, 0, 0, 0, 1, 1,
-0.9524223, -0.04435248, -1.916674, 0, 0, 0, 1, 1,
-0.952365, 0.09405204, -1.769598, 0, 0, 0, 1, 1,
-0.9511498, 0.9826351, -0.2373739, 0, 0, 0, 1, 1,
-0.9419457, -0.1281388, -1.133651, 1, 1, 1, 1, 1,
-0.9405749, -0.09828095, -3.033297, 1, 1, 1, 1, 1,
-0.923094, 0.2553967, -2.290823, 1, 1, 1, 1, 1,
-0.9213219, -0.3550696, -2.499936, 1, 1, 1, 1, 1,
-0.9198857, -0.9614017, -1.523077, 1, 1, 1, 1, 1,
-0.9191452, -1.267803, -3.246246, 1, 1, 1, 1, 1,
-0.9122214, -3.251535, -4.288828, 1, 1, 1, 1, 1,
-0.9100682, 0.6456468, -1.896637, 1, 1, 1, 1, 1,
-0.9075065, 0.1759496, -1.829597, 1, 1, 1, 1, 1,
-0.9069716, -0.1417075, -4.339025, 1, 1, 1, 1, 1,
-0.902778, -0.1110917, -2.407857, 1, 1, 1, 1, 1,
-0.8985441, -1.040624, -2.773434, 1, 1, 1, 1, 1,
-0.8929971, 1.637521, -0.9752727, 1, 1, 1, 1, 1,
-0.8913307, 0.3465127, -2.106668, 1, 1, 1, 1, 1,
-0.8908281, 0.9074261, -0.6409726, 1, 1, 1, 1, 1,
-0.8841939, 1.299127, 0.2253564, 0, 0, 1, 1, 1,
-0.8815206, 0.342494, -0.9274451, 1, 0, 0, 1, 1,
-0.8686447, 0.3434737, -0.7261642, 1, 0, 0, 1, 1,
-0.8683918, 0.2416568, -1.267658, 1, 0, 0, 1, 1,
-0.8670409, -0.924646, -3.628345, 1, 0, 0, 1, 1,
-0.8610814, 0.4521879, -1.60827, 1, 0, 0, 1, 1,
-0.8606673, -0.2086713, -1.591693, 0, 0, 0, 1, 1,
-0.8526499, 0.6287252, -0.8985816, 0, 0, 0, 1, 1,
-0.8461013, -0.4720962, -0.6610575, 0, 0, 0, 1, 1,
-0.8414152, -0.5591967, -2.130607, 0, 0, 0, 1, 1,
-0.8405373, 0.362609, -1.2332, 0, 0, 0, 1, 1,
-0.8396283, -0.5693382, -2.157787, 0, 0, 0, 1, 1,
-0.8357018, -1.660237, -3.030488, 0, 0, 0, 1, 1,
-0.8328235, 1.543517, -1.020157, 1, 1, 1, 1, 1,
-0.8325906, -0.9554795, -2.304696, 1, 1, 1, 1, 1,
-0.83184, -1.917213, -2.175921, 1, 1, 1, 1, 1,
-0.8259061, 0.4639607, -0.9428726, 1, 1, 1, 1, 1,
-0.8208221, 0.5959674, -1.89938, 1, 1, 1, 1, 1,
-0.8191262, 0.04791123, -1.351172, 1, 1, 1, 1, 1,
-0.8176008, -0.6439053, -1.890506, 1, 1, 1, 1, 1,
-0.8173372, 1.803268, -1.467646, 1, 1, 1, 1, 1,
-0.8163074, 1.029507, -2.850105, 1, 1, 1, 1, 1,
-0.8140352, -1.277734, -3.157815, 1, 1, 1, 1, 1,
-0.8138638, -0.2419546, -0.8674081, 1, 1, 1, 1, 1,
-0.8130216, -1.391629, -4.436345, 1, 1, 1, 1, 1,
-0.8048795, 0.8915673, -0.7512003, 1, 1, 1, 1, 1,
-0.8041009, -0.436039, -0.9461577, 1, 1, 1, 1, 1,
-0.792793, 0.5517938, -2.024043, 1, 1, 1, 1, 1,
-0.7894422, 0.360308, -1.945229, 0, 0, 1, 1, 1,
-0.7792801, 0.3976269, -0.1062644, 1, 0, 0, 1, 1,
-0.7776875, -0.452373, -1.100083, 1, 0, 0, 1, 1,
-0.7769944, 0.8424695, 0.23794, 1, 0, 0, 1, 1,
-0.7756933, -0.3156418, -1.438763, 1, 0, 0, 1, 1,
-0.7704622, 0.4246999, -0.3973877, 1, 0, 0, 1, 1,
-0.7698283, -0.9502233, -3.210597, 0, 0, 0, 1, 1,
-0.7676455, 1.004428, -0.01742691, 0, 0, 0, 1, 1,
-0.7649115, -0.4039925, -1.556193, 0, 0, 0, 1, 1,
-0.7640474, -1.789718, -3.756712, 0, 0, 0, 1, 1,
-0.755255, 0.6022583, -2.550605, 0, 0, 0, 1, 1,
-0.7488518, 0.02797574, -0.4220845, 0, 0, 0, 1, 1,
-0.7486431, 0.400337, 0.6241573, 0, 0, 0, 1, 1,
-0.7477244, 0.3378751, 0.236157, 1, 1, 1, 1, 1,
-0.7409086, -0.4583566, -2.282109, 1, 1, 1, 1, 1,
-0.7402472, -0.08065972, -2.019003, 1, 1, 1, 1, 1,
-0.736218, -0.134771, -3.29699, 1, 1, 1, 1, 1,
-0.735208, -1.201742, -2.836254, 1, 1, 1, 1, 1,
-0.733201, 0.4598648, -1.063251, 1, 1, 1, 1, 1,
-0.7325294, -0.2959763, -1.293093, 1, 1, 1, 1, 1,
-0.7244107, 0.4632015, 1.121098, 1, 1, 1, 1, 1,
-0.7203106, 1.603013, -1.21616, 1, 1, 1, 1, 1,
-0.7197108, -0.4134573, -3.779361, 1, 1, 1, 1, 1,
-0.718632, -1.268986, -0.9771835, 1, 1, 1, 1, 1,
-0.7175234, -1.786587, -1.790731, 1, 1, 1, 1, 1,
-0.7138466, -1.04141, -2.937608, 1, 1, 1, 1, 1,
-0.7123495, -0.7620983, -2.952328, 1, 1, 1, 1, 1,
-0.7096266, -0.6428316, -1.787048, 1, 1, 1, 1, 1,
-0.7032272, 0.462554, -2.038931, 0, 0, 1, 1, 1,
-0.6904768, 0.8395286, -0.7021146, 1, 0, 0, 1, 1,
-0.6899409, -1.124905, -2.847175, 1, 0, 0, 1, 1,
-0.6857895, -0.8251538, -0.7957081, 1, 0, 0, 1, 1,
-0.6855568, 0.2412765, -2.148299, 1, 0, 0, 1, 1,
-0.6847506, 0.3050979, -0.6435817, 1, 0, 0, 1, 1,
-0.6802105, -1.785793, -3.080595, 0, 0, 0, 1, 1,
-0.6726594, -0.4388313, -2.318736, 0, 0, 0, 1, 1,
-0.6619899, -0.1209872, -2.558973, 0, 0, 0, 1, 1,
-0.6494451, 0.4887567, -1.069585, 0, 0, 0, 1, 1,
-0.6396809, 0.6055897, -0.980449, 0, 0, 0, 1, 1,
-0.6390506, 1.060629, -0.5854305, 0, 0, 0, 1, 1,
-0.6388363, 1.572502, 0.1487874, 0, 0, 0, 1, 1,
-0.637773, -1.051365, -1.991556, 1, 1, 1, 1, 1,
-0.636725, 0.02493855, -1.536656, 1, 1, 1, 1, 1,
-0.6313685, -0.5369912, -2.327398, 1, 1, 1, 1, 1,
-0.6274041, 1.513599, 1.369334, 1, 1, 1, 1, 1,
-0.6263363, 1.181865, -0.9099633, 1, 1, 1, 1, 1,
-0.6247014, -0.0005826793, -0.9020958, 1, 1, 1, 1, 1,
-0.6196069, 0.7809352, -1.538074, 1, 1, 1, 1, 1,
-0.6194722, 0.05498895, -2.264888, 1, 1, 1, 1, 1,
-0.6162582, -0.03585614, -1.045525, 1, 1, 1, 1, 1,
-0.6145386, -0.4564064, -2.991582, 1, 1, 1, 1, 1,
-0.5869919, 0.199174, 0.114478, 1, 1, 1, 1, 1,
-0.5831844, 0.2848056, -1.772123, 1, 1, 1, 1, 1,
-0.5831187, 1.806139, -0.1140661, 1, 1, 1, 1, 1,
-0.5750644, 0.1732461, -2.100675, 1, 1, 1, 1, 1,
-0.5737892, 0.000937313, -2.271738, 1, 1, 1, 1, 1,
-0.5731906, 0.1369557, 0.8572738, 0, 0, 1, 1, 1,
-0.5728375, -0.07542392, -0.3026771, 1, 0, 0, 1, 1,
-0.5717908, -0.8007014, -2.786225, 1, 0, 0, 1, 1,
-0.5687208, 0.1460438, -2.518547, 1, 0, 0, 1, 1,
-0.5567297, -0.08985064, -1.176511, 1, 0, 0, 1, 1,
-0.555974, 1.141112, 0.3944959, 1, 0, 0, 1, 1,
-0.5531353, -0.4427198, -2.488423, 0, 0, 0, 1, 1,
-0.552047, -0.7876386, -0.1779223, 0, 0, 0, 1, 1,
-0.5506371, 0.8788062, -1.579162, 0, 0, 0, 1, 1,
-0.5494331, -0.4050932, -1.07396, 0, 0, 0, 1, 1,
-0.5330567, 0.4981457, -0.8970296, 0, 0, 0, 1, 1,
-0.5314388, 1.015732, -2.420581, 0, 0, 0, 1, 1,
-0.5295582, -0.5391066, -0.5294609, 0, 0, 0, 1, 1,
-0.5291624, 1.241553, -1.465069, 1, 1, 1, 1, 1,
-0.5266756, 0.7602415, -0.9252319, 1, 1, 1, 1, 1,
-0.5237051, -0.2789909, -2.984965, 1, 1, 1, 1, 1,
-0.5218957, 0.4212826, -0.4152287, 1, 1, 1, 1, 1,
-0.5202922, -0.6095057, -2.291361, 1, 1, 1, 1, 1,
-0.5184451, 1.807231, -0.7219736, 1, 1, 1, 1, 1,
-0.5180544, -0.9510111, -3.165805, 1, 1, 1, 1, 1,
-0.5161399, 0.4225083, -1.527472, 1, 1, 1, 1, 1,
-0.5138809, -1.493334, -1.466907, 1, 1, 1, 1, 1,
-0.5135145, -0.5036149, -2.880288, 1, 1, 1, 1, 1,
-0.5088708, 1.9137, -0.2390469, 1, 1, 1, 1, 1,
-0.5078216, 1.542188, -1.875466, 1, 1, 1, 1, 1,
-0.506397, -0.1858668, -2.19267, 1, 1, 1, 1, 1,
-0.5030715, 0.02874465, -2.646903, 1, 1, 1, 1, 1,
-0.5022866, -1.123939, -4.187027, 1, 1, 1, 1, 1,
-0.5011758, -0.5862284, -4.3074, 0, 0, 1, 1, 1,
-0.4977119, -1.812984, -2.641456, 1, 0, 0, 1, 1,
-0.4960486, -0.06651021, -1.41505, 1, 0, 0, 1, 1,
-0.4920648, 2.144313, 0.9900284, 1, 0, 0, 1, 1,
-0.4882367, 0.3347877, -2.716485, 1, 0, 0, 1, 1,
-0.4872999, 1.444962, 0.1952755, 1, 0, 0, 1, 1,
-0.4872063, 0.112236, -0.3692863, 0, 0, 0, 1, 1,
-0.4846304, 1.515211, 1.062683, 0, 0, 0, 1, 1,
-0.4829088, -0.3622593, 0.7545395, 0, 0, 0, 1, 1,
-0.482873, 0.452396, 0.4386996, 0, 0, 0, 1, 1,
-0.4745087, -0.1809567, -3.341358, 0, 0, 0, 1, 1,
-0.4738176, 0.5083602, 1.237219, 0, 0, 0, 1, 1,
-0.4703693, 1.037237, 1.51277, 0, 0, 0, 1, 1,
-0.4689844, 0.1820805, -2.056471, 1, 1, 1, 1, 1,
-0.4648904, -0.7094449, -3.418654, 1, 1, 1, 1, 1,
-0.4630193, -1.209892, -2.693713, 1, 1, 1, 1, 1,
-0.4583673, -0.9355806, -3.450608, 1, 1, 1, 1, 1,
-0.4582721, -0.4483803, -4.015831, 1, 1, 1, 1, 1,
-0.4576063, -1.026173, -2.825147, 1, 1, 1, 1, 1,
-0.4552886, -0.4672362, -1.214287, 1, 1, 1, 1, 1,
-0.45499, 0.1950397, -2.446541, 1, 1, 1, 1, 1,
-0.4511917, -0.3481323, -2.601774, 1, 1, 1, 1, 1,
-0.4503985, -0.367929, -2.851589, 1, 1, 1, 1, 1,
-0.4472264, -0.9436833, -1.758118, 1, 1, 1, 1, 1,
-0.4452273, 0.7201099, 0.1806005, 1, 1, 1, 1, 1,
-0.4449256, -1.288136, -1.134353, 1, 1, 1, 1, 1,
-0.4415284, -1.099547, -2.503019, 1, 1, 1, 1, 1,
-0.4411765, 1.247251, -1.252785, 1, 1, 1, 1, 1,
-0.4364384, 0.8901612, 1.211701, 0, 0, 1, 1, 1,
-0.4345704, 1.856244, -0.07302301, 1, 0, 0, 1, 1,
-0.4331069, 1.021306, -0.01320772, 1, 0, 0, 1, 1,
-0.4270024, -0.6078981, -2.938342, 1, 0, 0, 1, 1,
-0.4247213, 0.6046342, 0.5180232, 1, 0, 0, 1, 1,
-0.4234293, 0.9128929, -0.252109, 1, 0, 0, 1, 1,
-0.4224952, -1.526789, -3.219573, 0, 0, 0, 1, 1,
-0.4109974, 0.2869289, 1.058185, 0, 0, 0, 1, 1,
-0.4107917, -0.04903321, -0.7013485, 0, 0, 0, 1, 1,
-0.4024511, -0.280983, -4.405694, 0, 0, 0, 1, 1,
-0.4017274, -0.146361, -2.572202, 0, 0, 0, 1, 1,
-0.4001738, -0.4941498, -2.133273, 0, 0, 0, 1, 1,
-0.396462, 1.392654, -0.2738848, 0, 0, 0, 1, 1,
-0.3951029, -0.7351144, -1.271514, 1, 1, 1, 1, 1,
-0.3947382, -0.8255064, -4.192874, 1, 1, 1, 1, 1,
-0.3941105, 0.03852903, -1.511421, 1, 1, 1, 1, 1,
-0.3940642, 1.05264, 0.6983902, 1, 1, 1, 1, 1,
-0.3933724, 0.326454, -1.622962, 1, 1, 1, 1, 1,
-0.3931251, -0.567005, -1.873379, 1, 1, 1, 1, 1,
-0.3910392, -0.7992719, -2.463056, 1, 1, 1, 1, 1,
-0.386512, -0.6584743, -3.354164, 1, 1, 1, 1, 1,
-0.3834071, 1.605161, 1.983979, 1, 1, 1, 1, 1,
-0.3831425, -0.197457, -2.389871, 1, 1, 1, 1, 1,
-0.3772941, 0.7587143, 0.1119849, 1, 1, 1, 1, 1,
-0.3765098, -1.167099, -1.897128, 1, 1, 1, 1, 1,
-0.3739201, 0.26047, 0.1438121, 1, 1, 1, 1, 1,
-0.3720888, 0.3594485, -0.6674547, 1, 1, 1, 1, 1,
-0.3711476, 0.4808364, -0.685818, 1, 1, 1, 1, 1,
-0.3688098, -0.6638562, -2.312965, 0, 0, 1, 1, 1,
-0.3662391, 0.1530466, -1.098589, 1, 0, 0, 1, 1,
-0.3644214, 0.4290096, -1.484305, 1, 0, 0, 1, 1,
-0.3544073, -0.3365017, -1.695606, 1, 0, 0, 1, 1,
-0.3531508, 1.427092, -2.107283, 1, 0, 0, 1, 1,
-0.3469862, -0.1382678, -2.476887, 1, 0, 0, 1, 1,
-0.3460428, 0.5390198, -0.1149011, 0, 0, 0, 1, 1,
-0.3431721, -0.9591957, -3.910655, 0, 0, 0, 1, 1,
-0.3419847, 0.2184316, -1.569979, 0, 0, 0, 1, 1,
-0.3417734, 0.2267919, 0.2995144, 0, 0, 0, 1, 1,
-0.3390973, -0.2644212, -2.595615, 0, 0, 0, 1, 1,
-0.3382761, -0.4658079, -3.175082, 0, 0, 0, 1, 1,
-0.3342766, -0.3559242, -1.683646, 0, 0, 0, 1, 1,
-0.3315206, 1.08266, -1.018406, 1, 1, 1, 1, 1,
-0.3304838, -1.5695, -3.701581, 1, 1, 1, 1, 1,
-0.3261279, 0.6863088, -1.501138, 1, 1, 1, 1, 1,
-0.3248985, -0.7190846, -2.610633, 1, 1, 1, 1, 1,
-0.3241155, -1.86978, -4.282383, 1, 1, 1, 1, 1,
-0.3238402, 0.2219617, -0.8550274, 1, 1, 1, 1, 1,
-0.3237836, -0.8443092, -1.278707, 1, 1, 1, 1, 1,
-0.3202434, 0.5899602, -0.001701354, 1, 1, 1, 1, 1,
-0.3148182, 0.08355262, -0.5026661, 1, 1, 1, 1, 1,
-0.3138444, 0.6738253, -1.266659, 1, 1, 1, 1, 1,
-0.3069706, 0.4067742, -0.2934316, 1, 1, 1, 1, 1,
-0.3029841, 0.3322768, 0.3157079, 1, 1, 1, 1, 1,
-0.2943096, -0.5909454, -2.97075, 1, 1, 1, 1, 1,
-0.2927253, 1.166156, -0.7823463, 1, 1, 1, 1, 1,
-0.2920665, 0.1186716, -0.7931692, 1, 1, 1, 1, 1,
-0.2897489, 2.021836, -1.580266, 0, 0, 1, 1, 1,
-0.2885726, -0.5564848, -2.125877, 1, 0, 0, 1, 1,
-0.2868989, -0.8437015, -1.523812, 1, 0, 0, 1, 1,
-0.2816722, -1.980995, -2.02008, 1, 0, 0, 1, 1,
-0.2796166, -0.5139883, -2.181137, 1, 0, 0, 1, 1,
-0.2766558, -0.8266432, -3.824827, 1, 0, 0, 1, 1,
-0.2762254, 0.2858136, -1.431239, 0, 0, 0, 1, 1,
-0.2732135, 0.4293687, -2.037318, 0, 0, 0, 1, 1,
-0.271102, -0.3071664, -2.375254, 0, 0, 0, 1, 1,
-0.2681441, 0.2464737, -1.388634, 0, 0, 0, 1, 1,
-0.2654714, -0.8507064, -0.8201164, 0, 0, 0, 1, 1,
-0.2614193, -2.582089, -2.532985, 0, 0, 0, 1, 1,
-0.2612044, 0.03446116, -3.257991, 0, 0, 0, 1, 1,
-0.2602942, -0.749673, -3.369327, 1, 1, 1, 1, 1,
-0.252938, -0.7058611, -3.44024, 1, 1, 1, 1, 1,
-0.2529324, -0.8925991, -4.486997, 1, 1, 1, 1, 1,
-0.2506572, -1.96007, -3.388871, 1, 1, 1, 1, 1,
-0.2452309, 1.174311, -0.4248584, 1, 1, 1, 1, 1,
-0.2445129, -0.5115204, -2.303676, 1, 1, 1, 1, 1,
-0.2421351, 0.1869981, -0.5699656, 1, 1, 1, 1, 1,
-0.2405319, 0.04841487, -0.7565646, 1, 1, 1, 1, 1,
-0.2390187, -2.029041, -1.414904, 1, 1, 1, 1, 1,
-0.2386496, -0.1853745, -1.838508, 1, 1, 1, 1, 1,
-0.2381365, -0.1086856, -0.8943067, 1, 1, 1, 1, 1,
-0.2376922, 0.8672762, -1.81721, 1, 1, 1, 1, 1,
-0.2346026, -1.306281, -1.851969, 1, 1, 1, 1, 1,
-0.2328692, 1.7491, 0.4782657, 1, 1, 1, 1, 1,
-0.2305036, -0.9011471, -4.370527, 1, 1, 1, 1, 1,
-0.2291712, -0.5750799, -1.226538, 0, 0, 1, 1, 1,
-0.2287647, -0.003996683, -2.440606, 1, 0, 0, 1, 1,
-0.2268759, 2.04765, 0.007821231, 1, 0, 0, 1, 1,
-0.2232473, 1.158347, 1.827356, 1, 0, 0, 1, 1,
-0.2228187, -0.2778647, -1.182201, 1, 0, 0, 1, 1,
-0.2214032, 0.02054165, -1.610114, 1, 0, 0, 1, 1,
-0.2170442, -1.079791, -3.152623, 0, 0, 0, 1, 1,
-0.2159764, 1.031805, 1.20298, 0, 0, 0, 1, 1,
-0.2150715, -1.236517, -3.125865, 0, 0, 0, 1, 1,
-0.2147685, -0.9935153, -1.415941, 0, 0, 0, 1, 1,
-0.2121735, 1.590197, 0.9625611, 0, 0, 0, 1, 1,
-0.2106675, -0.314453, -3.463534, 0, 0, 0, 1, 1,
-0.209534, -0.4457479, -1.916168, 0, 0, 0, 1, 1,
-0.2062571, 1.099092, 0.63398, 1, 1, 1, 1, 1,
-0.2016018, -0.7390738, -2.315595, 1, 1, 1, 1, 1,
-0.1785845, -0.7951035, -3.193097, 1, 1, 1, 1, 1,
-0.1784312, -1.55387, -4.33916, 1, 1, 1, 1, 1,
-0.1781734, -0.7577839, -2.591595, 1, 1, 1, 1, 1,
-0.1767392, 0.9655921, -0.3786436, 1, 1, 1, 1, 1,
-0.1757337, -0.9491906, -3.041758, 1, 1, 1, 1, 1,
-0.1735889, 1.520317, 1.0268, 1, 1, 1, 1, 1,
-0.1712791, -0.6500408, -3.359736, 1, 1, 1, 1, 1,
-0.1711543, 0.3099404, -0.7910097, 1, 1, 1, 1, 1,
-0.170765, -1.037018, -3.246078, 1, 1, 1, 1, 1,
-0.1669094, 0.237642, 0.4844351, 1, 1, 1, 1, 1,
-0.1659745, -0.2595093, -3.001865, 1, 1, 1, 1, 1,
-0.1630749, -1.183032, -4.147593, 1, 1, 1, 1, 1,
-0.1629607, -0.8526877, -3.15798, 1, 1, 1, 1, 1,
-0.161961, 0.8195371, 1.762635, 0, 0, 1, 1, 1,
-0.1576656, 0.7755095, -0.5332001, 1, 0, 0, 1, 1,
-0.1487408, 0.570831, -1.600017, 1, 0, 0, 1, 1,
-0.1417958, -1.331966, -3.396531, 1, 0, 0, 1, 1,
-0.141516, -1.25282, -1.916076, 1, 0, 0, 1, 1,
-0.1351346, 1.654664, -0.2956327, 1, 0, 0, 1, 1,
-0.1298867, -0.2238992, -2.667633, 0, 0, 0, 1, 1,
-0.1298084, -1.871521, -3.483547, 0, 0, 0, 1, 1,
-0.1227854, 0.2320296, -1.857695, 0, 0, 0, 1, 1,
-0.1216954, -0.7553756, -2.409641, 0, 0, 0, 1, 1,
-0.1213905, -0.1720253, -2.746173, 0, 0, 0, 1, 1,
-0.1202712, 2.092554, 0.9934144, 0, 0, 0, 1, 1,
-0.1135542, 0.7705719, -0.626916, 0, 0, 0, 1, 1,
-0.1103876, -0.9081064, -0.04314096, 1, 1, 1, 1, 1,
-0.1090228, 0.4129208, -2.039686, 1, 1, 1, 1, 1,
-0.1050408, -0.07332998, -0.3657472, 1, 1, 1, 1, 1,
-0.1049123, 1.315014, 0.07330016, 1, 1, 1, 1, 1,
-0.1021459, 0.4300387, 0.05976838, 1, 1, 1, 1, 1,
-0.09929206, -0.4279766, -3.301501, 1, 1, 1, 1, 1,
-0.09855244, 0.6587353, 0.3144712, 1, 1, 1, 1, 1,
-0.0982518, -0.6817368, -2.989013, 1, 1, 1, 1, 1,
-0.09519307, 0.2414425, 0.2333263, 1, 1, 1, 1, 1,
-0.08811896, 0.7143669, 0.1604634, 1, 1, 1, 1, 1,
-0.08419123, 1.452486, -1.99796, 1, 1, 1, 1, 1,
-0.08294856, 0.8658507, 0.706174, 1, 1, 1, 1, 1,
-0.08165095, -0.8744931, -2.107528, 1, 1, 1, 1, 1,
-0.07901567, 0.6521831, -0.07606797, 1, 1, 1, 1, 1,
-0.07852173, -1.488676, -1.913943, 1, 1, 1, 1, 1,
-0.07780731, -0.7660843, -2.994004, 0, 0, 1, 1, 1,
-0.07747769, 0.3030696, 0.4960704, 1, 0, 0, 1, 1,
-0.07664461, 0.3777749, 2.442969, 1, 0, 0, 1, 1,
-0.07597834, -0.7840753, -3.095924, 1, 0, 0, 1, 1,
-0.07487088, 1.119247, 1.018163, 1, 0, 0, 1, 1,
-0.07446146, -0.9574583, -2.963776, 1, 0, 0, 1, 1,
-0.07370824, -1.71896, -3.888639, 0, 0, 0, 1, 1,
-0.07345593, 0.7303874, -0.9868788, 0, 0, 0, 1, 1,
-0.0702059, 0.06276076, -0.7245181, 0, 0, 0, 1, 1,
-0.06988817, -0.2937613, -3.944122, 0, 0, 0, 1, 1,
-0.06945994, 0.7191104, 0.09794763, 0, 0, 0, 1, 1,
-0.06757839, 1.87776, -1.435277, 0, 0, 0, 1, 1,
-0.06725901, 0.5446845, -0.6113719, 0, 0, 0, 1, 1,
-0.06381371, 1.652493, -1.369155, 1, 1, 1, 1, 1,
-0.06366414, -0.4204521, -3.11998, 1, 1, 1, 1, 1,
-0.06365518, 2.039745, 0.2299147, 1, 1, 1, 1, 1,
-0.0612906, -0.7110293, -2.289017, 1, 1, 1, 1, 1,
-0.06016613, -1.115802, -3.78026, 1, 1, 1, 1, 1,
-0.06013201, -0.2950734, -1.095198, 1, 1, 1, 1, 1,
-0.05864066, 0.4641295, 0.3264213, 1, 1, 1, 1, 1,
-0.05446346, 1.089599, 1.637922, 1, 1, 1, 1, 1,
-0.05191648, -1.416379, -3.222623, 1, 1, 1, 1, 1,
-0.05145127, -0.6133402, -4.675717, 1, 1, 1, 1, 1,
-0.05120679, -1.712777, -3.576375, 1, 1, 1, 1, 1,
-0.04797246, -1.605888, -3.577796, 1, 1, 1, 1, 1,
-0.04561143, -0.7545292, -5.121426, 1, 1, 1, 1, 1,
-0.0422197, 1.345094, -0.08173499, 1, 1, 1, 1, 1,
-0.03915004, -2.108599, -4.890022, 1, 1, 1, 1, 1,
-0.03868853, -0.1847857, -3.260043, 0, 0, 1, 1, 1,
-0.02207475, -0.9578007, -2.961655, 1, 0, 0, 1, 1,
-0.02146594, -1.370872, -4.773374, 1, 0, 0, 1, 1,
-0.0208297, 0.410258, 0.6521896, 1, 0, 0, 1, 1,
-0.020038, 0.139456, -0.09449399, 1, 0, 0, 1, 1,
-0.01738344, -1.10847, -3.291516, 1, 0, 0, 1, 1,
-0.01695334, 1.114038, 2.221462, 0, 0, 0, 1, 1,
-0.01608858, 0.5715219, -0.86892, 0, 0, 0, 1, 1,
-0.0159959, -0.2636793, -2.956651, 0, 0, 0, 1, 1,
-0.01072064, 0.882084, -0.4839577, 0, 0, 0, 1, 1,
-0.009057751, 0.05259904, 0.149342, 0, 0, 0, 1, 1,
-0.008908061, 0.1644914, 0.1196096, 0, 0, 0, 1, 1,
-0.007435161, 1.528467, 1.073742, 0, 0, 0, 1, 1,
-0.0007341626, 0.5876244, -0.05288271, 1, 1, 1, 1, 1,
0.0005864681, 0.5981953, -1.163419, 1, 1, 1, 1, 1,
0.003283261, -0.62717, 4.659307, 1, 1, 1, 1, 1,
0.003421294, -0.4727796, 3.587138, 1, 1, 1, 1, 1,
0.006843894, 0.7160357, 0.1784126, 1, 1, 1, 1, 1,
0.007766122, 1.074509, 0.1465386, 1, 1, 1, 1, 1,
0.01083172, -0.9953079, 3.518084, 1, 1, 1, 1, 1,
0.01224911, 0.7226706, -0.107087, 1, 1, 1, 1, 1,
0.01564024, 0.7696957, -1.33033, 1, 1, 1, 1, 1,
0.02072679, 0.8570895, -0.5512905, 1, 1, 1, 1, 1,
0.02241989, -0.3199085, 2.442461, 1, 1, 1, 1, 1,
0.02252957, -0.8390095, 2.198548, 1, 1, 1, 1, 1,
0.02300682, -1.150514, 3.257528, 1, 1, 1, 1, 1,
0.02338552, -0.766428, 3.993367, 1, 1, 1, 1, 1,
0.02644126, -1.756125, 3.877015, 1, 1, 1, 1, 1,
0.02789616, -0.7999641, 2.816585, 0, 0, 1, 1, 1,
0.02813253, -0.167518, 3.035398, 1, 0, 0, 1, 1,
0.03228552, -1.036991, 1.917712, 1, 0, 0, 1, 1,
0.04212748, 0.4095827, 1.543772, 1, 0, 0, 1, 1,
0.04446724, 0.1440458, -1.813344, 1, 0, 0, 1, 1,
0.04569176, -0.2254575, 1.695385, 1, 0, 0, 1, 1,
0.0494825, 1.210302, 0.07744643, 0, 0, 0, 1, 1,
0.05298377, 1.111232, -0.6752648, 0, 0, 0, 1, 1,
0.05460039, 0.2301877, 1.872455, 0, 0, 0, 1, 1,
0.05865533, 1.049712, 0.565127, 0, 0, 0, 1, 1,
0.06085636, 0.05787725, -0.5169333, 0, 0, 0, 1, 1,
0.06362142, -0.8009022, 2.37449, 0, 0, 0, 1, 1,
0.06500707, -0.2212757, 3.454598, 0, 0, 0, 1, 1,
0.06526253, 0.5527927, 2.067367, 1, 1, 1, 1, 1,
0.06615845, -0.8165816, 3.387259, 1, 1, 1, 1, 1,
0.06849103, 1.247767, 0.2262406, 1, 1, 1, 1, 1,
0.07018258, -0.08175308, 3.028125, 1, 1, 1, 1, 1,
0.07154953, 1.579648, 0.82855, 1, 1, 1, 1, 1,
0.07259074, 0.2432597, 0.637325, 1, 1, 1, 1, 1,
0.07652073, -2.053026, 0.9577804, 1, 1, 1, 1, 1,
0.07758091, -0.8829675, 3.583752, 1, 1, 1, 1, 1,
0.08318228, 1.807863, 0.9805922, 1, 1, 1, 1, 1,
0.09174458, 1.423267, 1.349286, 1, 1, 1, 1, 1,
0.09468089, -1.067855, 4.684468, 1, 1, 1, 1, 1,
0.09841635, -0.7175637, 3.908641, 1, 1, 1, 1, 1,
0.1030302, 1.273993, -1.721084, 1, 1, 1, 1, 1,
0.1100622, -0.1017158, 1.809074, 1, 1, 1, 1, 1,
0.1143012, 0.2494125, 1.769312, 1, 1, 1, 1, 1,
0.1206033, -1.02861, 4.144405, 0, 0, 1, 1, 1,
0.1225809, 0.2438208, 2.022574, 1, 0, 0, 1, 1,
0.125869, 0.4953469, 0.3723285, 1, 0, 0, 1, 1,
0.126549, 1.21621, 0.2682184, 1, 0, 0, 1, 1,
0.1269937, -0.5102588, 1.968479, 1, 0, 0, 1, 1,
0.1306151, -0.8267422, 4.537234, 1, 0, 0, 1, 1,
0.1349446, -0.8983183, 4.457364, 0, 0, 0, 1, 1,
0.139094, -1.32463, 3.725863, 0, 0, 0, 1, 1,
0.1424971, 0.4823188, -0.06976502, 0, 0, 0, 1, 1,
0.1436787, -2.830577, 3.244269, 0, 0, 0, 1, 1,
0.1450327, -0.5598609, 2.123339, 0, 0, 0, 1, 1,
0.1455842, -0.9166425, 0.8944716, 0, 0, 0, 1, 1,
0.1457446, 2.512021, -0.4676278, 0, 0, 0, 1, 1,
0.1460996, -0.3348579, 1.99129, 1, 1, 1, 1, 1,
0.1511872, -1.608958, 2.10719, 1, 1, 1, 1, 1,
0.152628, -1.562609, 2.604193, 1, 1, 1, 1, 1,
0.1526698, -0.4160777, 3.687641, 1, 1, 1, 1, 1,
0.1587435, -0.7133448, 1.623529, 1, 1, 1, 1, 1,
0.1587877, -0.02759408, 1.09881, 1, 1, 1, 1, 1,
0.1591001, -1.853143, 1.209198, 1, 1, 1, 1, 1,
0.1603278, 0.5732725, -0.08195103, 1, 1, 1, 1, 1,
0.1626287, 1.585094, -1.574806, 1, 1, 1, 1, 1,
0.166267, -0.2584407, 1.906968, 1, 1, 1, 1, 1,
0.1727438, 1.467702, 0.5304669, 1, 1, 1, 1, 1,
0.1756543, -0.08730745, 0.8254309, 1, 1, 1, 1, 1,
0.1785908, -0.2829047, 3.769706, 1, 1, 1, 1, 1,
0.178941, 0.7093242, 1.268184, 1, 1, 1, 1, 1,
0.1833677, -2.021133, 2.781655, 1, 1, 1, 1, 1,
0.1948971, 0.5941224, -0.3792098, 0, 0, 1, 1, 1,
0.1981041, 0.3348604, 0.8118591, 1, 0, 0, 1, 1,
0.2010072, 0.6577398, -1.405853, 1, 0, 0, 1, 1,
0.2017705, -0.8911044, 2.389521, 1, 0, 0, 1, 1,
0.2053931, -0.3766366, 2.822524, 1, 0, 0, 1, 1,
0.2066841, 0.8549768, 0.7966023, 1, 0, 0, 1, 1,
0.2090379, 1.191972, 0.1676535, 0, 0, 0, 1, 1,
0.2125293, 2.060292, -0.2019579, 0, 0, 0, 1, 1,
0.2139309, 0.5297768, 1.294211, 0, 0, 0, 1, 1,
0.2173854, -0.08176947, 1.839083, 0, 0, 0, 1, 1,
0.2192285, -0.2655775, 2.10273, 0, 0, 0, 1, 1,
0.221792, 1.053118, -0.2787744, 0, 0, 0, 1, 1,
0.2227603, 1.223284, 0.6479499, 0, 0, 0, 1, 1,
0.2270685, -1.320153, 4.981033, 1, 1, 1, 1, 1,
0.2287253, -0.7073777, 2.724577, 1, 1, 1, 1, 1,
0.2287747, -0.3945322, 3.790257, 1, 1, 1, 1, 1,
0.2312383, 0.6553993, 1.822971, 1, 1, 1, 1, 1,
0.2363648, 0.3988376, -0.2422642, 1, 1, 1, 1, 1,
0.2392579, 2.306062, -0.5405554, 1, 1, 1, 1, 1,
0.2431125, 0.3739532, 0.304196, 1, 1, 1, 1, 1,
0.2510271, 1.402974, -0.6650258, 1, 1, 1, 1, 1,
0.2519709, 0.4213428, 1.836185, 1, 1, 1, 1, 1,
0.2530249, -0.6524541, 1.975122, 1, 1, 1, 1, 1,
0.2546027, -0.002676965, 1.712749, 1, 1, 1, 1, 1,
0.2574608, 0.0202664, 0.8706394, 1, 1, 1, 1, 1,
0.2578095, -0.6389296, 3.040214, 1, 1, 1, 1, 1,
0.2592943, -0.06125611, 2.220901, 1, 1, 1, 1, 1,
0.2701549, -0.6474616, 3.613648, 1, 1, 1, 1, 1,
0.2753539, -1.733723, 2.355982, 0, 0, 1, 1, 1,
0.2755873, -0.6877436, 3.789153, 1, 0, 0, 1, 1,
0.2790235, -1.101178, 2.33605, 1, 0, 0, 1, 1,
0.2866504, -0.009614584, 2.032351, 1, 0, 0, 1, 1,
0.2905767, 0.3688354, 0.5778673, 1, 0, 0, 1, 1,
0.2920028, -0.8786265, 3.581204, 1, 0, 0, 1, 1,
0.2959459, 0.7362524, 1.870722, 0, 0, 0, 1, 1,
0.3035384, 0.8125581, -0.5144852, 0, 0, 0, 1, 1,
0.3052741, 1.038018, 0.2726203, 0, 0, 0, 1, 1,
0.3059856, -0.1901655, 4.292857, 0, 0, 0, 1, 1,
0.3105933, 1.562073, 0.3403707, 0, 0, 0, 1, 1,
0.3105974, 1.001179, -0.9957843, 0, 0, 0, 1, 1,
0.3127846, 0.2934771, 1.53526, 0, 0, 0, 1, 1,
0.313459, -0.8407066, 5.01547, 1, 1, 1, 1, 1,
0.3187609, 1.831132, -1.211025, 1, 1, 1, 1, 1,
0.3283772, 0.7127665, -0.3864642, 1, 1, 1, 1, 1,
0.3312123, -0.2712554, 2.333651, 1, 1, 1, 1, 1,
0.3317918, 0.1399537, -0.3344683, 1, 1, 1, 1, 1,
0.3365577, -0.01132997, 0.9698846, 1, 1, 1, 1, 1,
0.3423045, 0.1137117, 0.938791, 1, 1, 1, 1, 1,
0.3439351, -0.103097, 1.861297, 1, 1, 1, 1, 1,
0.349425, 1.870492, 0.23293, 1, 1, 1, 1, 1,
0.3502904, 0.05998785, 1.474276, 1, 1, 1, 1, 1,
0.3532794, 0.3478702, 0.153473, 1, 1, 1, 1, 1,
0.354251, -0.5209367, 3.307301, 1, 1, 1, 1, 1,
0.3580193, 0.6370649, 0.8906635, 1, 1, 1, 1, 1,
0.3588181, -1.095704, 2.505554, 1, 1, 1, 1, 1,
0.3624669, 1.349218, 1.396437, 1, 1, 1, 1, 1,
0.3654228, -1.066861, 3.166739, 0, 0, 1, 1, 1,
0.3678696, 1.131239, 0.2858945, 1, 0, 0, 1, 1,
0.3703576, 0.696283, -0.02463468, 1, 0, 0, 1, 1,
0.370433, 0.04277568, 2.113463, 1, 0, 0, 1, 1,
0.3734952, 0.5502554, 0.2556732, 1, 0, 0, 1, 1,
0.3760308, -0.9293176, 4.026759, 1, 0, 0, 1, 1,
0.3809883, -0.2212954, 2.995155, 0, 0, 0, 1, 1,
0.3872087, -0.5887054, 1.49136, 0, 0, 0, 1, 1,
0.3906319, 0.2697503, 1.416762, 0, 0, 0, 1, 1,
0.3927971, -0.1501492, 0.6968219, 0, 0, 0, 1, 1,
0.3957468, 0.1269174, -0.1436202, 0, 0, 0, 1, 1,
0.4005624, 0.7842311, 2.237045, 0, 0, 0, 1, 1,
0.4010766, 1.842974, 0.8237821, 0, 0, 0, 1, 1,
0.4022748, -1.057487, 2.485248, 1, 1, 1, 1, 1,
0.4024545, -1.861761, 2.98608, 1, 1, 1, 1, 1,
0.4061989, -0.3931772, 1.599129, 1, 1, 1, 1, 1,
0.4065845, -0.3740663, 0.9590774, 1, 1, 1, 1, 1,
0.4076516, 0.07075902, -0.168588, 1, 1, 1, 1, 1,
0.4097176, 0.1372271, 1.361047, 1, 1, 1, 1, 1,
0.4112769, -1.204646, 4.61184, 1, 1, 1, 1, 1,
0.4152645, -0.2229965, 2.423314, 1, 1, 1, 1, 1,
0.4178753, 1.963219, -0.05019749, 1, 1, 1, 1, 1,
0.4191528, -0.7878398, 3.328572, 1, 1, 1, 1, 1,
0.4232115, -0.02124787, 1.705841, 1, 1, 1, 1, 1,
0.4239174, 0.6328548, 0.8060976, 1, 1, 1, 1, 1,
0.4324024, 1.477075, -0.07825992, 1, 1, 1, 1, 1,
0.4349311, -0.03249153, 1.576494, 1, 1, 1, 1, 1,
0.4351069, -0.2616188, 1.719164, 1, 1, 1, 1, 1,
0.4358389, -1.023471, 3.742946, 0, 0, 1, 1, 1,
0.4365349, 0.6709216, 0.2731695, 1, 0, 0, 1, 1,
0.4368138, -0.8178419, 4.545928, 1, 0, 0, 1, 1,
0.4400084, 0.8774149, 0.6750237, 1, 0, 0, 1, 1,
0.4400185, 1.472579, 0.05843934, 1, 0, 0, 1, 1,
0.442944, 0.7282538, -0.6074694, 1, 0, 0, 1, 1,
0.4439382, 1.115548, -0.9363672, 0, 0, 0, 1, 1,
0.4454449, -0.3363847, 3.293885, 0, 0, 0, 1, 1,
0.4500213, -0.1829046, 1.499898, 0, 0, 0, 1, 1,
0.4503911, 0.1579639, 1.753927, 0, 0, 0, 1, 1,
0.4580272, 0.6790903, 2.191937, 0, 0, 0, 1, 1,
0.4583957, -0.233201, 1.629731, 0, 0, 0, 1, 1,
0.4629405, -1.092441, 2.773737, 0, 0, 0, 1, 1,
0.463302, -0.6977633, 1.323615, 1, 1, 1, 1, 1,
0.4636279, 0.3006128, 0.09946327, 1, 1, 1, 1, 1,
0.4666454, -1.358083, 3.688044, 1, 1, 1, 1, 1,
0.4698232, 0.2177022, 1.164317, 1, 1, 1, 1, 1,
0.4725759, -1.836385, 2.998234, 1, 1, 1, 1, 1,
0.4810466, -0.8499836, 1.62777, 1, 1, 1, 1, 1,
0.4814368, -0.1569749, 4.290153, 1, 1, 1, 1, 1,
0.481973, -0.2859978, 2.976126, 1, 1, 1, 1, 1,
0.4822268, -1.142998, 2.041551, 1, 1, 1, 1, 1,
0.4833241, -0.08405125, 0.244867, 1, 1, 1, 1, 1,
0.4872703, -1.575555, 2.838443, 1, 1, 1, 1, 1,
0.4898774, 0.4222673, 1.577246, 1, 1, 1, 1, 1,
0.4938905, -0.9984521, 4.475975, 1, 1, 1, 1, 1,
0.4960342, 0.962564, 1.011966, 1, 1, 1, 1, 1,
0.4985452, 2.841416, -0.3142338, 1, 1, 1, 1, 1,
0.5017663, -1.137768, 2.536663, 0, 0, 1, 1, 1,
0.5034866, 0.4058521, 2.68966, 1, 0, 0, 1, 1,
0.5061892, 0.1690476, 1.806886, 1, 0, 0, 1, 1,
0.5087123, -0.2419103, 2.761951, 1, 0, 0, 1, 1,
0.50927, 1.015758, -0.02355388, 1, 0, 0, 1, 1,
0.5105758, -0.7043408, 1.054989, 1, 0, 0, 1, 1,
0.5153661, -0.7357203, 2.707231, 0, 0, 0, 1, 1,
0.5177516, -0.4188639, 0.1502106, 0, 0, 0, 1, 1,
0.5182334, -0.09804773, 1.737396, 0, 0, 0, 1, 1,
0.5191935, 2.156537, -1.205854, 0, 0, 0, 1, 1,
0.5192403, -0.2653463, 0.5407892, 0, 0, 0, 1, 1,
0.5257248, -1.274229, 1.048596, 0, 0, 0, 1, 1,
0.5264042, -0.2416462, 2.316936, 0, 0, 0, 1, 1,
0.5356581, -1.651102, 2.913687, 1, 1, 1, 1, 1,
0.5371719, -1.892308, 1.796891, 1, 1, 1, 1, 1,
0.5389985, 0.8680122, 1.033726, 1, 1, 1, 1, 1,
0.5403124, 0.01956497, 2.145246, 1, 1, 1, 1, 1,
0.542151, -0.2855569, 2.225707, 1, 1, 1, 1, 1,
0.5476971, -0.7952714, 3.152587, 1, 1, 1, 1, 1,
0.5477202, 0.124454, -0.7211542, 1, 1, 1, 1, 1,
0.5499891, -0.06534687, 0.2939369, 1, 1, 1, 1, 1,
0.5500509, -0.06074524, 0.7965595, 1, 1, 1, 1, 1,
0.550824, -1.358663, 3.309581, 1, 1, 1, 1, 1,
0.5511222, -0.7239742, 3.919501, 1, 1, 1, 1, 1,
0.5541304, 0.2969136, 1.885153, 1, 1, 1, 1, 1,
0.5606431, -0.04686324, 2.275247, 1, 1, 1, 1, 1,
0.5698327, 0.3487462, 3.592373, 1, 1, 1, 1, 1,
0.5702286, -0.4542563, 2.190032, 1, 1, 1, 1, 1,
0.5704368, 0.7323202, 0.5768572, 0, 0, 1, 1, 1,
0.5744258, -0.9271669, 2.314529, 1, 0, 0, 1, 1,
0.5787006, -0.1960968, 2.833945, 1, 0, 0, 1, 1,
0.5801753, 0.807345, 1.434415, 1, 0, 0, 1, 1,
0.5805314, -0.08946332, 2.017584, 1, 0, 0, 1, 1,
0.5833294, 2.286793, -0.1594246, 1, 0, 0, 1, 1,
0.5834732, -0.1736921, 1.365925, 0, 0, 0, 1, 1,
0.5851761, -0.09002648, 1.684247, 0, 0, 0, 1, 1,
0.5874717, 1.58635, -0.4500239, 0, 0, 0, 1, 1,
0.6001143, 0.321472, 1.462343, 0, 0, 0, 1, 1,
0.6027525, 1.493021, 0.08589573, 0, 0, 0, 1, 1,
0.604255, 1.625566, 0.1833894, 0, 0, 0, 1, 1,
0.606994, 1.183487, -0.3960617, 0, 0, 0, 1, 1,
0.6168088, -0.4818937, 2.332662, 1, 1, 1, 1, 1,
0.616922, -1.357342, 1.417869, 1, 1, 1, 1, 1,
0.6187748, 0.8394371, 2.430423, 1, 1, 1, 1, 1,
0.6258667, -0.3833613, 2.541239, 1, 1, 1, 1, 1,
0.626492, -0.07351382, 1.129578, 1, 1, 1, 1, 1,
0.6275878, 0.2422726, 2.485068, 1, 1, 1, 1, 1,
0.6340742, 1.891954, 0.8849638, 1, 1, 1, 1, 1,
0.6418106, -0.8465103, 2.607568, 1, 1, 1, 1, 1,
0.6433904, 0.8044439, 0.1716594, 1, 1, 1, 1, 1,
0.6467896, 0.2010478, -0.1012384, 1, 1, 1, 1, 1,
0.6511589, -0.2355861, 0.3812432, 1, 1, 1, 1, 1,
0.652234, -0.9702298, 3.495173, 1, 1, 1, 1, 1,
0.655481, -1.87386, 2.540752, 1, 1, 1, 1, 1,
0.660871, -0.7056494, 2.143399, 1, 1, 1, 1, 1,
0.6615285, 0.3003826, 1.714958, 1, 1, 1, 1, 1,
0.668534, 0.2595604, 1.672859, 0, 0, 1, 1, 1,
0.6753565, 0.3530408, 2.263768, 1, 0, 0, 1, 1,
0.6776331, -0.9286623, 2.812087, 1, 0, 0, 1, 1,
0.6801811, 0.1335356, 0.2777748, 1, 0, 0, 1, 1,
0.6835722, -1.432418, 1.284671, 1, 0, 0, 1, 1,
0.699136, 0.5028681, 0.4177075, 1, 0, 0, 1, 1,
0.6996529, 0.8548677, -0.1610844, 0, 0, 0, 1, 1,
0.7010897, -1.147748, 2.334738, 0, 0, 0, 1, 1,
0.7014683, -0.7905836, 1.351205, 0, 0, 0, 1, 1,
0.707977, -0.09376942, 2.340494, 0, 0, 0, 1, 1,
0.71385, -0.6746406, 3.60076, 0, 0, 0, 1, 1,
0.7195079, -0.3349435, 3.472819, 0, 0, 0, 1, 1,
0.7322722, 1.160756, 0.789156, 0, 0, 0, 1, 1,
0.7335639, -1.418998, 3.063825, 1, 1, 1, 1, 1,
0.7345797, 0.7625511, 0.314758, 1, 1, 1, 1, 1,
0.7385103, 0.3889176, 1.545234, 1, 1, 1, 1, 1,
0.7430203, 0.5982333, 1.481391, 1, 1, 1, 1, 1,
0.7488201, -0.8058903, 3.098559, 1, 1, 1, 1, 1,
0.7507607, 0.1179592, -0.8242701, 1, 1, 1, 1, 1,
0.7526587, -0.8341067, 1.537397, 1, 1, 1, 1, 1,
0.7552034, -1.480817, 1.870624, 1, 1, 1, 1, 1,
0.758671, 0.3215136, 0.6382527, 1, 1, 1, 1, 1,
0.7611527, -0.3687701, 3.978346, 1, 1, 1, 1, 1,
0.7630451, -0.835557, 4.433948, 1, 1, 1, 1, 1,
0.7710806, 0.4010097, 2.237973, 1, 1, 1, 1, 1,
0.771404, -0.6336572, 1.541432, 1, 1, 1, 1, 1,
0.774764, 1.023153, 3.062922, 1, 1, 1, 1, 1,
0.7817098, 1.048367, 0.8222975, 1, 1, 1, 1, 1,
0.78482, -2.095797, 2.650839, 0, 0, 1, 1, 1,
0.7901376, -1.12595, 2.920958, 1, 0, 0, 1, 1,
0.7964088, -0.4850839, 1.872679, 1, 0, 0, 1, 1,
0.7966551, -0.3277277, 2.618456, 1, 0, 0, 1, 1,
0.8003724, -0.9017447, 4.361179, 1, 0, 0, 1, 1,
0.8063995, 1.198002, 0.8166605, 1, 0, 0, 1, 1,
0.8118097, -1.35403, 3.094765, 0, 0, 0, 1, 1,
0.8146893, -0.9897538, 2.803855, 0, 0, 0, 1, 1,
0.8155335, -1.240615, 2.751833, 0, 0, 0, 1, 1,
0.8169138, 0.6523871, 0.3633181, 0, 0, 0, 1, 1,
0.817916, 0.4601149, 1.960796, 0, 0, 0, 1, 1,
0.8220506, -0.9013276, 2.589125, 0, 0, 0, 1, 1,
0.8316548, 1.64096, -0.2547224, 0, 0, 0, 1, 1,
0.8374378, -0.5750496, 3.021311, 1, 1, 1, 1, 1,
0.8376141, 0.649037, 2.669839, 1, 1, 1, 1, 1,
0.8382508, -0.4713548, 2.94349, 1, 1, 1, 1, 1,
0.8452217, 1.306614, 1.67512, 1, 1, 1, 1, 1,
0.8489337, -0.3528525, 0.5374523, 1, 1, 1, 1, 1,
0.8673587, 0.5723822, 0.6960777, 1, 1, 1, 1, 1,
0.867372, -0.3545651, 1.28496, 1, 1, 1, 1, 1,
0.8674236, -1.570919, 3.234087, 1, 1, 1, 1, 1,
0.8684271, 1.521602, -0.1829714, 1, 1, 1, 1, 1,
0.8695084, -1.08277, 1.788588, 1, 1, 1, 1, 1,
0.8724404, 0.4982682, 0.3763505, 1, 1, 1, 1, 1,
0.8762137, 0.7100787, 1.244916, 1, 1, 1, 1, 1,
0.8800252, -0.6884318, 0.5768121, 1, 1, 1, 1, 1,
0.8816556, -0.2019829, 2.007522, 1, 1, 1, 1, 1,
0.8841891, -1.448274, 2.414984, 1, 1, 1, 1, 1,
0.8876797, -0.3743051, 2.167725, 0, 0, 1, 1, 1,
0.8884879, -0.6861953, 2.140004, 1, 0, 0, 1, 1,
0.893189, -1.16846, 2.410881, 1, 0, 0, 1, 1,
0.8937655, -0.5784014, 3.50456, 1, 0, 0, 1, 1,
0.9019431, 0.1065531, 2.579971, 1, 0, 0, 1, 1,
0.9192213, -1.179583, 2.8644, 1, 0, 0, 1, 1,
0.9284162, 1.090458, 0.06429428, 0, 0, 0, 1, 1,
0.9292865, -1.270492, 0.3039207, 0, 0, 0, 1, 1,
0.9368032, -1.601122, 3.276996, 0, 0, 0, 1, 1,
0.9386089, -0.7398197, 1.603458, 0, 0, 0, 1, 1,
0.9426712, 1.304447, 1.57215, 0, 0, 0, 1, 1,
0.9472715, -2.710286, 2.377358, 0, 0, 0, 1, 1,
0.950533, 0.3915116, 0.9666369, 0, 0, 0, 1, 1,
0.9534191, 0.3629848, 0.9184079, 1, 1, 1, 1, 1,
0.9570248, 1.726123, -0.1706723, 1, 1, 1, 1, 1,
0.9590998, -0.6902533, 1.144331, 1, 1, 1, 1, 1,
0.9592462, -1.048842, 1.706405, 1, 1, 1, 1, 1,
0.9600638, 0.1691228, 1.564057, 1, 1, 1, 1, 1,
0.9675075, 0.1139514, 0.9796417, 1, 1, 1, 1, 1,
0.9683855, -0.808288, 2.265872, 1, 1, 1, 1, 1,
0.9707492, -1.438382, 1.807363, 1, 1, 1, 1, 1,
0.971136, 0.6776162, 1.078003, 1, 1, 1, 1, 1,
0.9780207, -1.091793, 1.319991, 1, 1, 1, 1, 1,
0.9880152, 0.923162, 2.344847, 1, 1, 1, 1, 1,
0.9912395, 0.9244596, 1.489846, 1, 1, 1, 1, 1,
0.9941878, 0.8216811, -0.2424546, 1, 1, 1, 1, 1,
0.9983559, -0.07769123, 0.386131, 1, 1, 1, 1, 1,
1.003684, 0.4323601, -0.7893162, 1, 1, 1, 1, 1,
1.004904, -0.7600172, 2.397472, 0, 0, 1, 1, 1,
1.009024, -1.985075, 0.3738227, 1, 0, 0, 1, 1,
1.010017, 0.685914, 1.225084, 1, 0, 0, 1, 1,
1.012094, -0.4558296, 1.61826, 1, 0, 0, 1, 1,
1.015193, -1.646662, 2.721575, 1, 0, 0, 1, 1,
1.016939, 0.9946927, -0.9946963, 1, 0, 0, 1, 1,
1.019889, 0.8506552, 3.928759, 0, 0, 0, 1, 1,
1.021054, -0.794356, 1.120268, 0, 0, 0, 1, 1,
1.036968, -1.230523, 1.603915, 0, 0, 0, 1, 1,
1.037925, -2.263115, 1.793411, 0, 0, 0, 1, 1,
1.051069, -0.1750537, 2.691206, 0, 0, 0, 1, 1,
1.051864, -0.1791128, 1.60234, 0, 0, 0, 1, 1,
1.056381, -1.414688, 3.233806, 0, 0, 0, 1, 1,
1.058167, 1.128429, -0.6184152, 1, 1, 1, 1, 1,
1.069261, 1.711262, -1.775118, 1, 1, 1, 1, 1,
1.073176, 0.2868265, 1.340503, 1, 1, 1, 1, 1,
1.07899, 1.110594, 0.1336756, 1, 1, 1, 1, 1,
1.080938, -0.7351643, 2.783859, 1, 1, 1, 1, 1,
1.109704, 0.3075068, 0.7776234, 1, 1, 1, 1, 1,
1.110639, 0.5812302, 2.306155, 1, 1, 1, 1, 1,
1.120684, -0.7260203, 3.105899, 1, 1, 1, 1, 1,
1.121106, -0.6152846, 1.435714, 1, 1, 1, 1, 1,
1.123583, -0.5061914, 2.768209, 1, 1, 1, 1, 1,
1.127434, -0.1236452, 1.659724, 1, 1, 1, 1, 1,
1.131758, 0.5824643, 0.8661401, 1, 1, 1, 1, 1,
1.137007, 1.159989, 2.350786, 1, 1, 1, 1, 1,
1.145724, 1.30678, 2.367363, 1, 1, 1, 1, 1,
1.149856, -1.372482, 1.057426, 1, 1, 1, 1, 1,
1.157105, 1.84397, 1.326531, 0, 0, 1, 1, 1,
1.157365, 1.14152, 0.8261997, 1, 0, 0, 1, 1,
1.169426, 1.627557, 0.7048485, 1, 0, 0, 1, 1,
1.172865, 0.7608678, 0.807929, 1, 0, 0, 1, 1,
1.179664, -0.1595376, 1.715105, 1, 0, 0, 1, 1,
1.180694, -0.7147972, 2.125703, 1, 0, 0, 1, 1,
1.185957, 0.02022614, 3.118828, 0, 0, 0, 1, 1,
1.18972, 0.3642107, 1.108981, 0, 0, 0, 1, 1,
1.192169, -0.1707625, 1.425781, 0, 0, 0, 1, 1,
1.192679, -0.9409448, 1.411414, 0, 0, 0, 1, 1,
1.198351, -0.2564892, 3.395294, 0, 0, 0, 1, 1,
1.203976, -0.8869729, 2.408992, 0, 0, 0, 1, 1,
1.20501, -0.9790603, 1.696809, 0, 0, 0, 1, 1,
1.209613, -1.75434, 3.312162, 1, 1, 1, 1, 1,
1.212403, 1.353088, 1.766486, 1, 1, 1, 1, 1,
1.215953, 0.004777341, 2.71945, 1, 1, 1, 1, 1,
1.231795, -0.9500329, 2.475265, 1, 1, 1, 1, 1,
1.238826, -0.2200883, 2.41127, 1, 1, 1, 1, 1,
1.25134, -0.7124333, 3.895255, 1, 1, 1, 1, 1,
1.251615, -1.551035, 2.824829, 1, 1, 1, 1, 1,
1.255555, 0.3787892, 2.37401, 1, 1, 1, 1, 1,
1.256217, -1.01362, 2.052538, 1, 1, 1, 1, 1,
1.259899, -0.08809195, 2.962039, 1, 1, 1, 1, 1,
1.26204, -1.142157, 0.8185443, 1, 1, 1, 1, 1,
1.273869, 0.7438877, 0.01605062, 1, 1, 1, 1, 1,
1.2745, 0.0465041, 0.5554932, 1, 1, 1, 1, 1,
1.277591, -1.653127, 5.229979, 1, 1, 1, 1, 1,
1.282416, 0.6837877, 1.353936, 1, 1, 1, 1, 1,
1.286026, -1.557351, 2.450339, 0, 0, 1, 1, 1,
1.289286, -1.701026, 1.765882, 1, 0, 0, 1, 1,
1.289778, 0.5472891, 0.5251454, 1, 0, 0, 1, 1,
1.295003, 0.4287716, 2.684567, 1, 0, 0, 1, 1,
1.305569, 0.0373837, 1.009032, 1, 0, 0, 1, 1,
1.308417, 1.579813, 1.119235, 1, 0, 0, 1, 1,
1.311856, 2.56784, 2.094611, 0, 0, 0, 1, 1,
1.323009, 1.822686, 0.9830272, 0, 0, 0, 1, 1,
1.336518, 0.9403719, 1.015448, 0, 0, 0, 1, 1,
1.341834, 0.6468912, 2.187015, 0, 0, 0, 1, 1,
1.341988, -0.456168, 3.459002, 0, 0, 0, 1, 1,
1.348066, 0.3567279, -0.006684393, 0, 0, 0, 1, 1,
1.35344, -0.756573, 1.640668, 0, 0, 0, 1, 1,
1.359024, 1.665962, 2.066633, 1, 1, 1, 1, 1,
1.359616, 1.02209, 1.568727, 1, 1, 1, 1, 1,
1.368276, 1.1063, -0.3266769, 1, 1, 1, 1, 1,
1.36987, 0.3907812, 2.393068, 1, 1, 1, 1, 1,
1.369965, -0.557196, 1.953007, 1, 1, 1, 1, 1,
1.379622, 0.2650997, 1.544832, 1, 1, 1, 1, 1,
1.386694, -0.7058657, -0.04727378, 1, 1, 1, 1, 1,
1.41145, 1.250238, 0.1110401, 1, 1, 1, 1, 1,
1.414299, -0.9950665, 1.777002, 1, 1, 1, 1, 1,
1.416721, -1.452118, 1.106745, 1, 1, 1, 1, 1,
1.419975, -0.2343704, 0.3337902, 1, 1, 1, 1, 1,
1.425696, -0.7509743, 1.949825, 1, 1, 1, 1, 1,
1.428778, -1.082036, 2.415281, 1, 1, 1, 1, 1,
1.430925, 0.2019797, 0.7300512, 1, 1, 1, 1, 1,
1.459662, 0.4717095, 0.8589966, 1, 1, 1, 1, 1,
1.461196, -0.2698717, 1.000543, 0, 0, 1, 1, 1,
1.472656, -2.461978, 3.169944, 1, 0, 0, 1, 1,
1.472974, 0.9359586, 1.291829, 1, 0, 0, 1, 1,
1.473371, -0.754644, 1.923546, 1, 0, 0, 1, 1,
1.478388, 0.8467692, 2.091669, 1, 0, 0, 1, 1,
1.482152, 0.3840589, 2.117953, 1, 0, 0, 1, 1,
1.4938, 0.7255669, 0.8926474, 0, 0, 0, 1, 1,
1.493812, -0.676153, 4.197865, 0, 0, 0, 1, 1,
1.496952, -0.5128648, 1.911469, 0, 0, 0, 1, 1,
1.52967, 1.15887, 1.723945, 0, 0, 0, 1, 1,
1.531638, -1.767945, 2.106332, 0, 0, 0, 1, 1,
1.537395, 0.0730056, 1.505421, 0, 0, 0, 1, 1,
1.541735, -0.03688536, 1.641539, 0, 0, 0, 1, 1,
1.542144, -0.160522, 3.43626, 1, 1, 1, 1, 1,
1.549016, -2.23093, 3.614942, 1, 1, 1, 1, 1,
1.551938, 0.4487866, 1.452663, 1, 1, 1, 1, 1,
1.566632, -0.05405292, 1.504019, 1, 1, 1, 1, 1,
1.571886, 2.113764, 1.269888, 1, 1, 1, 1, 1,
1.579859, -0.1346688, 1.922812, 1, 1, 1, 1, 1,
1.582241, -0.2918526, 0.9700191, 1, 1, 1, 1, 1,
1.582461, 1.954139, 1.132993, 1, 1, 1, 1, 1,
1.584038, -0.1236877, 1.86066, 1, 1, 1, 1, 1,
1.597, 1.264105, 1.981271, 1, 1, 1, 1, 1,
1.610217, 0.5230227, 0.6827628, 1, 1, 1, 1, 1,
1.61299, 1.446075, 0.1454751, 1, 1, 1, 1, 1,
1.637397, 0.5106854, 0.9732478, 1, 1, 1, 1, 1,
1.642631, 1.012604, 2.32293, 1, 1, 1, 1, 1,
1.664973, 1.076288, 0.7018223, 1, 1, 1, 1, 1,
1.688536, -1.838291, 3.054064, 0, 0, 1, 1, 1,
1.704829, -0.5143557, 3.565528, 1, 0, 0, 1, 1,
1.723293, 1.33006, 0.4723131, 1, 0, 0, 1, 1,
1.723991, 0.2474463, 2.058913, 1, 0, 0, 1, 1,
1.724661, -0.3794791, 1.935391, 1, 0, 0, 1, 1,
1.728944, 0.8428335, 3.165005, 1, 0, 0, 1, 1,
1.731348, -2.603573, 2.734206, 0, 0, 0, 1, 1,
1.732333, -0.9490286, 3.671928, 0, 0, 0, 1, 1,
1.789574, 0.7093759, 1.549306, 0, 0, 0, 1, 1,
1.795551, 0.4485332, 1.182742, 0, 0, 0, 1, 1,
1.817457, 1.932251, 0.2854785, 0, 0, 0, 1, 1,
1.826289, 1.292456, 1.515929, 0, 0, 0, 1, 1,
1.833968, -1.653425, 3.713275, 0, 0, 0, 1, 1,
1.841013, -1.899002, 0.1673091, 1, 1, 1, 1, 1,
1.845353, -0.06671885, 2.342318, 1, 1, 1, 1, 1,
1.872547, 0.9211047, 3.235905, 1, 1, 1, 1, 1,
1.876708, 0.09801605, 3.278507, 1, 1, 1, 1, 1,
1.880027, 0.2610317, 1.916532, 1, 1, 1, 1, 1,
1.880841, 1.448769, 0.5580066, 1, 1, 1, 1, 1,
1.893014, 0.3549621, -0.1022357, 1, 1, 1, 1, 1,
1.899594, 0.1056512, 0.4797208, 1, 1, 1, 1, 1,
1.906005, 0.5620264, 1.358665, 1, 1, 1, 1, 1,
1.918105, 1.009394, 2.519507, 1, 1, 1, 1, 1,
1.920599, 1.124695, 2.14044, 1, 1, 1, 1, 1,
1.927985, 0.2769229, 0.9935979, 1, 1, 1, 1, 1,
1.932953, 0.1530603, 1.040329, 1, 1, 1, 1, 1,
1.963358, 1.021997, 1.780515, 1, 1, 1, 1, 1,
1.980714, -0.1533649, 1.256596, 1, 1, 1, 1, 1,
2.016398, -0.503771, 2.757099, 0, 0, 1, 1, 1,
2.024955, -0.08948515, 1.998727, 1, 0, 0, 1, 1,
2.143064, -0.8758941, 3.199407, 1, 0, 0, 1, 1,
2.164246, 0.7996024, -0.1190949, 1, 0, 0, 1, 1,
2.182224, 0.1486892, 2.232605, 1, 0, 0, 1, 1,
2.204942, 0.6957984, 3.364471, 1, 0, 0, 1, 1,
2.288407, -0.7370378, 1.444831, 0, 0, 0, 1, 1,
2.329471, -1.224538, 1.585773, 0, 0, 0, 1, 1,
2.426342, 0.1014516, 2.036475, 0, 0, 0, 1, 1,
2.564762, -1.100673, 1.212238, 0, 0, 0, 1, 1,
2.653527, 0.7325344, 2.018935, 0, 0, 0, 1, 1,
2.68723, 0.6385564, 1.6028, 0, 0, 0, 1, 1,
2.707688, -1.162056, -0.05408358, 0, 0, 0, 1, 1,
2.712484, 1.176443, 2.129548, 1, 1, 1, 1, 1,
2.738705, 1.290453, -1.412024, 1, 1, 1, 1, 1,
2.769646, 0.5635595, 1.482657, 1, 1, 1, 1, 1,
2.828408, 2.118536, 0.9118926, 1, 1, 1, 1, 1,
2.869946, 0.5738626, 1.343045, 1, 1, 1, 1, 1,
2.974886, 1.114123, 0.6449985, 1, 1, 1, 1, 1,
3.05126, 0.5005953, 2.729642, 1, 1, 1, 1, 1
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
var radius = 9.319248;
var distance = 32.73346;
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
mvMatrix.translate( 0.1035268, 0.2050595, -0.05427647 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.73346);
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
