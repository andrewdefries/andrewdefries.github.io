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
-3.432717, 2.023551, -1.129207, 1, 0, 0, 1,
-3.170748, 0.3822323, 0.08582395, 1, 0.007843138, 0, 1,
-3.065045, 0.138791, -0.7122529, 1, 0.01176471, 0, 1,
-2.647636, -0.5333992, -1.691091, 1, 0.01960784, 0, 1,
-2.612797, 1.689399, -1.514909, 1, 0.02352941, 0, 1,
-2.593709, -0.8782724, -2.276589, 1, 0.03137255, 0, 1,
-2.567463, 0.9489213, -2.587548, 1, 0.03529412, 0, 1,
-2.559222, 0.1481329, -1.427561, 1, 0.04313726, 0, 1,
-2.548324, 0.7555982, -1.002209, 1, 0.04705882, 0, 1,
-2.496294, -0.3585949, -1.376718, 1, 0.05490196, 0, 1,
-2.477058, 0.7264924, -2.37781, 1, 0.05882353, 0, 1,
-2.395979, -0.6527873, -2.752056, 1, 0.06666667, 0, 1,
-2.3732, -0.363173, -1.310622, 1, 0.07058824, 0, 1,
-2.331116, -1.142145, -1.430903, 1, 0.07843138, 0, 1,
-2.289455, 0.5075124, -0.7606961, 1, 0.08235294, 0, 1,
-2.218549, -0.8137532, -1.472174, 1, 0.09019608, 0, 1,
-2.214008, 0.6077156, -2.243089, 1, 0.09411765, 0, 1,
-2.198029, 0.8828143, -0.362047, 1, 0.1019608, 0, 1,
-2.189932, -0.7362089, -1.071713, 1, 0.1098039, 0, 1,
-2.136215, 0.8293443, -0.2776055, 1, 0.1137255, 0, 1,
-2.113754, -0.7498044, 0.2395951, 1, 0.1215686, 0, 1,
-2.095836, 0.6821959, -1.393486, 1, 0.1254902, 0, 1,
-2.08468, -0.3668142, -2.15446, 1, 0.1333333, 0, 1,
-2.079026, -1.088235, -1.435984, 1, 0.1372549, 0, 1,
-2.059285, 0.02647278, -0.1862003, 1, 0.145098, 0, 1,
-2.05112, -0.02212148, -1.199066, 1, 0.1490196, 0, 1,
-1.984065, -0.3537634, -1.899628, 1, 0.1568628, 0, 1,
-1.969336, -1.647114, -2.695336, 1, 0.1607843, 0, 1,
-1.955624, -0.1859616, -0.8852172, 1, 0.1686275, 0, 1,
-1.950243, -0.6391591, -2.804193, 1, 0.172549, 0, 1,
-1.9471, -0.6921146, -2.751, 1, 0.1803922, 0, 1,
-1.936573, -0.5326039, -2.416405, 1, 0.1843137, 0, 1,
-1.891052, 0.2732868, -1.797042, 1, 0.1921569, 0, 1,
-1.877458, -1.342081, -2.475229, 1, 0.1960784, 0, 1,
-1.859044, -1.60472, -2.42237, 1, 0.2039216, 0, 1,
-1.838341, 0.4820476, -0.1352698, 1, 0.2117647, 0, 1,
-1.835821, 0.536384, 0.6638569, 1, 0.2156863, 0, 1,
-1.832868, -1.398778, -3.604289, 1, 0.2235294, 0, 1,
-1.825687, -0.7354628, -2.056246, 1, 0.227451, 0, 1,
-1.808365, 0.9708837, 0.4611985, 1, 0.2352941, 0, 1,
-1.78654, -1.227923, -0.202686, 1, 0.2392157, 0, 1,
-1.772955, 1.391671, -1.28069, 1, 0.2470588, 0, 1,
-1.759627, -0.3336523, -2.259545, 1, 0.2509804, 0, 1,
-1.758676, -0.02821834, -1.630801, 1, 0.2588235, 0, 1,
-1.753866, -0.9245483, -1.187251, 1, 0.2627451, 0, 1,
-1.752901, -0.8361673, -1.644291, 1, 0.2705882, 0, 1,
-1.738187, 0.2398015, -2.034372, 1, 0.2745098, 0, 1,
-1.738164, 1.329278, -0.07041597, 1, 0.282353, 0, 1,
-1.733713, 1.924485, 1.326698, 1, 0.2862745, 0, 1,
-1.706168, 0.7421535, -2.210778, 1, 0.2941177, 0, 1,
-1.683089, -0.3401222, -0.9676322, 1, 0.3019608, 0, 1,
-1.681862, -0.8626693, -2.805247, 1, 0.3058824, 0, 1,
-1.660406, 2.214919, -1.695312, 1, 0.3137255, 0, 1,
-1.660082, -0.06752045, -0.7485002, 1, 0.3176471, 0, 1,
-1.656701, -0.5470203, -1.180702, 1, 0.3254902, 0, 1,
-1.631923, 1.479257, -1.893212, 1, 0.3294118, 0, 1,
-1.608268, 0.005450475, 0.3012009, 1, 0.3372549, 0, 1,
-1.597797, -1.046352, -2.056842, 1, 0.3411765, 0, 1,
-1.596749, -0.6258343, -1.372113, 1, 0.3490196, 0, 1,
-1.594627, -0.6151841, -3.562517, 1, 0.3529412, 0, 1,
-1.588182, 0.8615197, -0.2613036, 1, 0.3607843, 0, 1,
-1.559811, 1.053905, -2.33238, 1, 0.3647059, 0, 1,
-1.542003, -0.1971511, -1.102818, 1, 0.372549, 0, 1,
-1.537004, 0.2939979, 0.1069295, 1, 0.3764706, 0, 1,
-1.534901, 1.660523, -1.27147, 1, 0.3843137, 0, 1,
-1.528113, 1.080575, 0.3851391, 1, 0.3882353, 0, 1,
-1.523974, -0.548034, -2.494346, 1, 0.3960784, 0, 1,
-1.52201, 2.152147, -0.5974637, 1, 0.4039216, 0, 1,
-1.521425, -1.677658, -1.778615, 1, 0.4078431, 0, 1,
-1.506143, 2.266789, -0.8460177, 1, 0.4156863, 0, 1,
-1.501343, 0.3401065, -2.949032, 1, 0.4196078, 0, 1,
-1.496661, -0.03559752, -0.4023144, 1, 0.427451, 0, 1,
-1.487809, 0.3036559, -1.61304, 1, 0.4313726, 0, 1,
-1.473782, -1.509129, -3.006868, 1, 0.4392157, 0, 1,
-1.471535, -1.29568, -1.703978, 1, 0.4431373, 0, 1,
-1.466262, -1.081589, -2.163657, 1, 0.4509804, 0, 1,
-1.464547, -0.73491, -3.506768, 1, 0.454902, 0, 1,
-1.45755, -0.09011341, -2.403022, 1, 0.4627451, 0, 1,
-1.451756, 1.279115, -3.077591, 1, 0.4666667, 0, 1,
-1.445455, 1.186666, -1.386792, 1, 0.4745098, 0, 1,
-1.437395, 0.5625153, -0.2540219, 1, 0.4784314, 0, 1,
-1.436469, -1.840982, -1.218429, 1, 0.4862745, 0, 1,
-1.43178, 0.568199, -1.472396, 1, 0.4901961, 0, 1,
-1.421761, 0.06727504, -2.007992, 1, 0.4980392, 0, 1,
-1.415, -0.4975427, -4.862442, 1, 0.5058824, 0, 1,
-1.413528, -1.447952, -0.8535873, 1, 0.509804, 0, 1,
-1.409096, -0.6064454, -2.750028, 1, 0.5176471, 0, 1,
-1.406253, -0.1816969, -1.64771, 1, 0.5215687, 0, 1,
-1.398083, 0.1334113, -2.870563, 1, 0.5294118, 0, 1,
-1.397809, 0.4997892, -1.47523, 1, 0.5333334, 0, 1,
-1.385813, -0.8983741, -2.452921, 1, 0.5411765, 0, 1,
-1.384367, -1.434736, -2.025302, 1, 0.5450981, 0, 1,
-1.379074, -0.1526761, -2.332791, 1, 0.5529412, 0, 1,
-1.37015, -0.4568669, -2.421725, 1, 0.5568628, 0, 1,
-1.367223, 0.6635908, -2.367693, 1, 0.5647059, 0, 1,
-1.35743, 0.2299583, -0.8897508, 1, 0.5686275, 0, 1,
-1.353937, -1.979073, -0.6621518, 1, 0.5764706, 0, 1,
-1.352103, -0.4248355, -2.15924, 1, 0.5803922, 0, 1,
-1.345487, -0.4110269, -1.773305, 1, 0.5882353, 0, 1,
-1.327434, -0.02838601, -2.180506, 1, 0.5921569, 0, 1,
-1.315238, 0.6787761, -0.9745378, 1, 0.6, 0, 1,
-1.311887, -1.311558, -2.021896, 1, 0.6078432, 0, 1,
-1.310193, 0.3900596, -1.059475, 1, 0.6117647, 0, 1,
-1.295747, -0.5732374, -2.236654, 1, 0.6196079, 0, 1,
-1.291399, 0.07579876, -0.1720815, 1, 0.6235294, 0, 1,
-1.281012, -0.3116949, -0.7208042, 1, 0.6313726, 0, 1,
-1.279869, 0.3046093, -0.8871458, 1, 0.6352941, 0, 1,
-1.275922, -0.5291197, -1.153375, 1, 0.6431373, 0, 1,
-1.251277, 0.5019019, -0.9181449, 1, 0.6470588, 0, 1,
-1.246571, 0.1777986, -2.276568, 1, 0.654902, 0, 1,
-1.24458, -1.959316, -2.306801, 1, 0.6588235, 0, 1,
-1.244277, -0.4746487, -1.779251, 1, 0.6666667, 0, 1,
-1.241681, -1.077832, -2.883383, 1, 0.6705883, 0, 1,
-1.229608, 0.6264157, -1.595358, 1, 0.6784314, 0, 1,
-1.221559, 0.48796, -0.2411708, 1, 0.682353, 0, 1,
-1.220828, 0.1665716, -1.043263, 1, 0.6901961, 0, 1,
-1.216684, -1.925014, -1.813655, 1, 0.6941177, 0, 1,
-1.20952, 0.726104, -1.808254, 1, 0.7019608, 0, 1,
-1.203285, 0.6686049, 1.157348, 1, 0.7098039, 0, 1,
-1.20064, -0.7603469, -1.852776, 1, 0.7137255, 0, 1,
-1.19718, 0.3976671, -0.4906449, 1, 0.7215686, 0, 1,
-1.192855, -0.07156971, -0.967792, 1, 0.7254902, 0, 1,
-1.187888, -1.539559, -2.346083, 1, 0.7333333, 0, 1,
-1.184407, 0.3008903, -1.837733, 1, 0.7372549, 0, 1,
-1.175575, 0.3382354, -3.163262, 1, 0.7450981, 0, 1,
-1.175011, -0.3673424, -2.549233, 1, 0.7490196, 0, 1,
-1.171688, -0.2313501, -0.9326773, 1, 0.7568628, 0, 1,
-1.154454, -0.3327621, -0.8318591, 1, 0.7607843, 0, 1,
-1.15012, -2.39399, -2.327759, 1, 0.7686275, 0, 1,
-1.145782, -2.534492, -3.918367, 1, 0.772549, 0, 1,
-1.136835, -0.77663, -2.873646, 1, 0.7803922, 0, 1,
-1.1367, 0.1984784, -1.966925, 1, 0.7843137, 0, 1,
-1.133253, -0.607384, -3.499142, 1, 0.7921569, 0, 1,
-1.126864, 0.1151583, -2.641259, 1, 0.7960784, 0, 1,
-1.121664, 0.01956329, -1.391441, 1, 0.8039216, 0, 1,
-1.116241, 0.3477508, -0.3242135, 1, 0.8117647, 0, 1,
-1.115882, -0.2461609, -0.779991, 1, 0.8156863, 0, 1,
-1.115207, 0.6267807, -2.357968, 1, 0.8235294, 0, 1,
-1.1082, -2.211343, -1.760575, 1, 0.827451, 0, 1,
-1.10754, 0.04153284, -2.440368, 1, 0.8352941, 0, 1,
-1.107479, 0.2479206, -1.888724, 1, 0.8392157, 0, 1,
-1.106032, 0.0552984, -1.212996, 1, 0.8470588, 0, 1,
-1.102665, -0.5916035, 0.320359, 1, 0.8509804, 0, 1,
-1.10245, 0.6652864, -2.430784, 1, 0.8588235, 0, 1,
-1.10067, 0.8190204, -2.737886, 1, 0.8627451, 0, 1,
-1.096161, 1.121371, -2.17793, 1, 0.8705882, 0, 1,
-1.092916, 0.1185611, -1.229936, 1, 0.8745098, 0, 1,
-1.092518, -0.6793578, -2.668635, 1, 0.8823529, 0, 1,
-1.088596, 0.8732405, -1.164926, 1, 0.8862745, 0, 1,
-1.088145, -1.605697, -4.844903, 1, 0.8941177, 0, 1,
-1.077536, 0.6624574, -0.9413349, 1, 0.8980392, 0, 1,
-1.067927, -0.776737, -2.172466, 1, 0.9058824, 0, 1,
-1.06752, 1.273442, -1.384838, 1, 0.9137255, 0, 1,
-1.067274, -0.4995978, -3.515661, 1, 0.9176471, 0, 1,
-1.06645, 0.5689042, -1.945169, 1, 0.9254902, 0, 1,
-1.063397, 0.09794529, -0.5356743, 1, 0.9294118, 0, 1,
-1.061433, -0.4864478, -2.46776, 1, 0.9372549, 0, 1,
-1.059411, 0.7929185, -0.7318571, 1, 0.9411765, 0, 1,
-1.057409, 1.102728, -1.830459, 1, 0.9490196, 0, 1,
-1.056111, 1.267406, -1.397598, 1, 0.9529412, 0, 1,
-1.045971, 1.550926, -0.4242442, 1, 0.9607843, 0, 1,
-1.03052, 1.047715, -0.509573, 1, 0.9647059, 0, 1,
-1.029739, 0.03613473, -1.223279, 1, 0.972549, 0, 1,
-1.028018, 0.7699565, -2.334417, 1, 0.9764706, 0, 1,
-1.027069, -1.48154, -2.191962, 1, 0.9843137, 0, 1,
-1.023282, -0.08164697, -1.342592, 1, 0.9882353, 0, 1,
-1.014416, 0.09858076, -1.667024, 1, 0.9960784, 0, 1,
-1.013314, -1.116917, -1.302651, 0.9960784, 1, 0, 1,
-1.009563, -0.2198116, -0.8130637, 0.9921569, 1, 0, 1,
-1.005872, 0.9652784, -0.9083946, 0.9843137, 1, 0, 1,
-1.002709, 0.4662111, -1.362606, 0.9803922, 1, 0, 1,
-0.9974371, 0.4519016, -1.884362, 0.972549, 1, 0, 1,
-0.994878, -1.922719, -2.053562, 0.9686275, 1, 0, 1,
-0.9945791, 0.04241135, -1.566251, 0.9607843, 1, 0, 1,
-0.9854823, -0.7678707, -2.50103, 0.9568627, 1, 0, 1,
-0.9600152, -1.893154, -1.956667, 0.9490196, 1, 0, 1,
-0.9573833, 0.08459289, -0.2950764, 0.945098, 1, 0, 1,
-0.9553286, -0.9543352, -1.571309, 0.9372549, 1, 0, 1,
-0.9551538, 0.4144077, 1.946578, 0.9333333, 1, 0, 1,
-0.9524006, 2.095844, -1.763892, 0.9254902, 1, 0, 1,
-0.9514103, -0.6315477, -1.727136, 0.9215686, 1, 0, 1,
-0.9434324, 1.5149, 0.4752808, 0.9137255, 1, 0, 1,
-0.9318431, -0.567498, -2.730949, 0.9098039, 1, 0, 1,
-0.9316158, -0.732489, -3.229133, 0.9019608, 1, 0, 1,
-0.9203727, -1.187772, -3.56275, 0.8941177, 1, 0, 1,
-0.9195982, 0.5979605, -1.748031, 0.8901961, 1, 0, 1,
-0.9195411, -0.06688996, -2.580298, 0.8823529, 1, 0, 1,
-0.917723, 0.1156297, -0.7044989, 0.8784314, 1, 0, 1,
-0.915332, 0.2615393, -3.037676, 0.8705882, 1, 0, 1,
-0.9134107, 0.1819575, -0.2161803, 0.8666667, 1, 0, 1,
-0.9045744, -0.01109345, -2.038647, 0.8588235, 1, 0, 1,
-0.902418, 1.152013, 0.3253168, 0.854902, 1, 0, 1,
-0.9000683, -0.2869027, -2.392825, 0.8470588, 1, 0, 1,
-0.897252, -1.535382, -2.497703, 0.8431373, 1, 0, 1,
-0.8970225, -1.240765, -1.758904, 0.8352941, 1, 0, 1,
-0.8949206, 1.021516, 0.8072053, 0.8313726, 1, 0, 1,
-0.8884759, 0.004365671, 0.2052542, 0.8235294, 1, 0, 1,
-0.8873647, 1.371784, -0.5142556, 0.8196079, 1, 0, 1,
-0.8842961, 1.031484, -0.9805294, 0.8117647, 1, 0, 1,
-0.8822023, 0.4044758, -0.5810622, 0.8078431, 1, 0, 1,
-0.8797434, -1.290605, -2.110473, 0.8, 1, 0, 1,
-0.875558, 0.6543949, 0.8804871, 0.7921569, 1, 0, 1,
-0.8744956, -0.3942929, -2.416333, 0.7882353, 1, 0, 1,
-0.8706143, 0.08086443, -1.912262, 0.7803922, 1, 0, 1,
-0.8700802, -1.423995, -3.079224, 0.7764706, 1, 0, 1,
-0.8680589, -0.792757, -2.548275, 0.7686275, 1, 0, 1,
-0.8627386, -1.234705, -1.199303, 0.7647059, 1, 0, 1,
-0.8564113, 0.5355417, -1.865399, 0.7568628, 1, 0, 1,
-0.8545405, 0.27227, -1.487349, 0.7529412, 1, 0, 1,
-0.8545105, -1.496963, -4.773731, 0.7450981, 1, 0, 1,
-0.8413885, 1.540337, 0.03928517, 0.7411765, 1, 0, 1,
-0.8374423, -0.7992896, -3.322424, 0.7333333, 1, 0, 1,
-0.8289311, -0.6274171, -0.7429286, 0.7294118, 1, 0, 1,
-0.8263046, 0.01048063, -0.3364868, 0.7215686, 1, 0, 1,
-0.8249443, 0.7403611, -0.3914662, 0.7176471, 1, 0, 1,
-0.8112656, -2.67631, -3.176266, 0.7098039, 1, 0, 1,
-0.8081023, 0.2838664, -2.886512, 0.7058824, 1, 0, 1,
-0.8078756, 0.04097439, -2.654017, 0.6980392, 1, 0, 1,
-0.8023812, -1.18614, -2.812602, 0.6901961, 1, 0, 1,
-0.7965606, 0.6092712, -0.9483112, 0.6862745, 1, 0, 1,
-0.789398, -0.008885384, -0.7419195, 0.6784314, 1, 0, 1,
-0.7855563, -0.6645921, -2.261775, 0.6745098, 1, 0, 1,
-0.7852284, -1.202929, -2.692791, 0.6666667, 1, 0, 1,
-0.783793, 0.3045099, -1.830846, 0.6627451, 1, 0, 1,
-0.7829121, -0.5842642, -2.306761, 0.654902, 1, 0, 1,
-0.7789654, 0.363397, -1.432208, 0.6509804, 1, 0, 1,
-0.7721661, 1.141222, 0.1658034, 0.6431373, 1, 0, 1,
-0.7697369, 0.9366004, -1.376212, 0.6392157, 1, 0, 1,
-0.7688636, -0.1210782, -1.97855, 0.6313726, 1, 0, 1,
-0.7602292, -0.8437191, -0.4933197, 0.627451, 1, 0, 1,
-0.759159, -0.5336229, -1.556101, 0.6196079, 1, 0, 1,
-0.7551583, -0.6513008, -3.997223, 0.6156863, 1, 0, 1,
-0.7523015, 1.323615, -0.6774477, 0.6078432, 1, 0, 1,
-0.7521886, -0.2938129, -2.444743, 0.6039216, 1, 0, 1,
-0.7504433, 0.5061198, -0.65649, 0.5960785, 1, 0, 1,
-0.7503686, -0.814967, -1.710197, 0.5882353, 1, 0, 1,
-0.7367195, -1.902305, -2.30547, 0.5843138, 1, 0, 1,
-0.7319961, 0.8514631, 1.211752, 0.5764706, 1, 0, 1,
-0.7295172, 1.356718, -0.8620431, 0.572549, 1, 0, 1,
-0.7294112, 1.400433, -0.0540911, 0.5647059, 1, 0, 1,
-0.7289981, -1.557831, -1.927711, 0.5607843, 1, 0, 1,
-0.7279242, -0.7088991, -2.078139, 0.5529412, 1, 0, 1,
-0.7268631, 0.5748073, -0.6943902, 0.5490196, 1, 0, 1,
-0.7196949, -0.589147, -4.051949, 0.5411765, 1, 0, 1,
-0.7180784, -0.4301263, 0.1310774, 0.5372549, 1, 0, 1,
-0.7159711, -1.566856, -2.432618, 0.5294118, 1, 0, 1,
-0.7157044, 0.5493631, -1.223263, 0.5254902, 1, 0, 1,
-0.7151244, -0.6546973, -1.11387, 0.5176471, 1, 0, 1,
-0.7059027, 0.105916, -1.640484, 0.5137255, 1, 0, 1,
-0.704788, 0.00156148, -0.3923206, 0.5058824, 1, 0, 1,
-0.7003362, -1.625826, -1.591228, 0.5019608, 1, 0, 1,
-0.6931691, -1.372971, -2.285666, 0.4941176, 1, 0, 1,
-0.6867096, -1.73802, -1.517415, 0.4862745, 1, 0, 1,
-0.6846291, -0.5352244, -1.386061, 0.4823529, 1, 0, 1,
-0.6784287, -0.4352114, -1.738756, 0.4745098, 1, 0, 1,
-0.6772282, -0.3466123, -3.517711, 0.4705882, 1, 0, 1,
-0.6764283, 2.043821, 0.1960093, 0.4627451, 1, 0, 1,
-0.6760541, 1.686778, 0.1781169, 0.4588235, 1, 0, 1,
-0.6723983, 2.280742, -0.9123459, 0.4509804, 1, 0, 1,
-0.6702387, 0.2926639, -0.5035041, 0.4470588, 1, 0, 1,
-0.6617522, -0.1493264, -2.353606, 0.4392157, 1, 0, 1,
-0.6615317, 0.06214512, -1.133247, 0.4352941, 1, 0, 1,
-0.6543918, -1.053389, -2.548435, 0.427451, 1, 0, 1,
-0.6534842, 0.272777, -0.9989854, 0.4235294, 1, 0, 1,
-0.6456499, -0.02748046, -1.902189, 0.4156863, 1, 0, 1,
-0.6439232, 1.957437, 1.094573, 0.4117647, 1, 0, 1,
-0.6350951, -0.561734, -2.12267, 0.4039216, 1, 0, 1,
-0.6345325, 1.919051, 0.1399811, 0.3960784, 1, 0, 1,
-0.6186935, 0.2158297, -0.2491248, 0.3921569, 1, 0, 1,
-0.6153899, -0.1655365, -2.036574, 0.3843137, 1, 0, 1,
-0.6134062, -0.7933086, -4.02367, 0.3803922, 1, 0, 1,
-0.6118657, 0.9792953, -0.28196, 0.372549, 1, 0, 1,
-0.6108593, 0.1217332, -1.64465, 0.3686275, 1, 0, 1,
-0.6067992, -0.8735796, -1.835207, 0.3607843, 1, 0, 1,
-0.6065236, 0.3776326, -0.8652936, 0.3568628, 1, 0, 1,
-0.6017151, 0.03933882, -0.8714651, 0.3490196, 1, 0, 1,
-0.5978271, -0.5963107, -0.7213739, 0.345098, 1, 0, 1,
-0.5955161, 0.01805442, -2.592245, 0.3372549, 1, 0, 1,
-0.5917823, 1.004608, -1.62026, 0.3333333, 1, 0, 1,
-0.5896831, 0.04206875, -1.714869, 0.3254902, 1, 0, 1,
-0.5861379, -0.9488479, -1.615722, 0.3215686, 1, 0, 1,
-0.5793002, -0.3544364, -1.24748, 0.3137255, 1, 0, 1,
-0.5752743, 0.6061693, -0.4024869, 0.3098039, 1, 0, 1,
-0.5715539, 0.1928484, -1.431154, 0.3019608, 1, 0, 1,
-0.5682556, 1.038873, -0.08975689, 0.2941177, 1, 0, 1,
-0.566272, -0.1193996, -3.003867, 0.2901961, 1, 0, 1,
-0.5631937, 0.769675, -0.03425205, 0.282353, 1, 0, 1,
-0.5593506, -0.01308563, -0.4294448, 0.2784314, 1, 0, 1,
-0.554628, -1.114888, -1.991832, 0.2705882, 1, 0, 1,
-0.5507139, -1.138534, -3.352538, 0.2666667, 1, 0, 1,
-0.5422356, -0.909623, -1.608649, 0.2588235, 1, 0, 1,
-0.5419078, -0.2004866, -0.7165733, 0.254902, 1, 0, 1,
-0.5342995, 0.8341687, -0.8624711, 0.2470588, 1, 0, 1,
-0.5323052, -1.129906, -3.496634, 0.2431373, 1, 0, 1,
-0.531576, 1.525475, -1.431981, 0.2352941, 1, 0, 1,
-0.5307695, -0.4443508, -2.250686, 0.2313726, 1, 0, 1,
-0.5284125, -1.003718, -2.051575, 0.2235294, 1, 0, 1,
-0.5252378, -0.7111752, -1.126881, 0.2196078, 1, 0, 1,
-0.5217995, -0.8908504, -2.110315, 0.2117647, 1, 0, 1,
-0.5203705, 1.623887, -1.307212, 0.2078431, 1, 0, 1,
-0.5146504, -0.5569313, -1.746209, 0.2, 1, 0, 1,
-0.5123739, 1.11402, 0.995047, 0.1921569, 1, 0, 1,
-0.5109336, 0.02039424, -2.775784, 0.1882353, 1, 0, 1,
-0.5055378, -0.5494592, -1.77266, 0.1803922, 1, 0, 1,
-0.504406, -1.065771, -1.968922, 0.1764706, 1, 0, 1,
-0.4985211, 1.791244, -0.6394596, 0.1686275, 1, 0, 1,
-0.4950563, -0.4466095, -0.4411217, 0.1647059, 1, 0, 1,
-0.4938646, 0.184985, -1.786464, 0.1568628, 1, 0, 1,
-0.4920829, -1.876524, -2.385745, 0.1529412, 1, 0, 1,
-0.4900425, 0.4185496, -0.4717582, 0.145098, 1, 0, 1,
-0.48826, -1.090214, -2.393118, 0.1411765, 1, 0, 1,
-0.4827221, 0.7700332, 0.6566914, 0.1333333, 1, 0, 1,
-0.48126, -1.623193, -3.179871, 0.1294118, 1, 0, 1,
-0.4798468, -0.04306705, -3.067512, 0.1215686, 1, 0, 1,
-0.4697417, 0.7606748, -0.9401205, 0.1176471, 1, 0, 1,
-0.4675032, 0.8758609, -0.7277696, 0.1098039, 1, 0, 1,
-0.4626552, 1.396239, -1.223328, 0.1058824, 1, 0, 1,
-0.4618759, -0.615477, -4.259724, 0.09803922, 1, 0, 1,
-0.4483102, 1.28604, -2.073487, 0.09019608, 1, 0, 1,
-0.4465308, 0.7734929, 0.3706905, 0.08627451, 1, 0, 1,
-0.4441589, -0.9461485, -2.05756, 0.07843138, 1, 0, 1,
-0.4386347, 1.620543, -1.125665, 0.07450981, 1, 0, 1,
-0.4302348, -0.4403679, -2.272286, 0.06666667, 1, 0, 1,
-0.4232581, -0.4652489, -2.390613, 0.0627451, 1, 0, 1,
-0.421262, 0.3075371, -0.9052972, 0.05490196, 1, 0, 1,
-0.4197693, -0.8967009, -1.993459, 0.05098039, 1, 0, 1,
-0.4147318, 0.5413527, -0.5012565, 0.04313726, 1, 0, 1,
-0.4118438, -0.1697632, -0.509328, 0.03921569, 1, 0, 1,
-0.4115627, 1.170298, -1.453261, 0.03137255, 1, 0, 1,
-0.4108227, -1.412437, -2.605091, 0.02745098, 1, 0, 1,
-0.4045884, -0.2443094, -1.710943, 0.01960784, 1, 0, 1,
-0.4037628, 0.08080967, -2.222882, 0.01568628, 1, 0, 1,
-0.4028805, 0.9104483, -0.969969, 0.007843138, 1, 0, 1,
-0.4012646, 1.169991, 1.099486, 0.003921569, 1, 0, 1,
-0.3998979, 0.4782912, -2.755896, 0, 1, 0.003921569, 1,
-0.3986864, 0.6065385, -0.774745, 0, 1, 0.01176471, 1,
-0.395877, 1.363634, -0.6846308, 0, 1, 0.01568628, 1,
-0.388234, -2.060193, -3.596188, 0, 1, 0.02352941, 1,
-0.3871484, 0.2077157, -1.573958, 0, 1, 0.02745098, 1,
-0.3859734, 0.3402434, -0.2654494, 0, 1, 0.03529412, 1,
-0.3847961, -0.4334767, -2.794068, 0, 1, 0.03921569, 1,
-0.3719981, 0.0756685, -0.4632578, 0, 1, 0.04705882, 1,
-0.3696241, -0.1914697, -2.270243, 0, 1, 0.05098039, 1,
-0.3679722, 1.353754, -0.9214269, 0, 1, 0.05882353, 1,
-0.3673683, -0.6624626, -0.6773776, 0, 1, 0.0627451, 1,
-0.3615446, -0.2428938, -3.823969, 0, 1, 0.07058824, 1,
-0.3572941, -0.1714436, -0.9623905, 0, 1, 0.07450981, 1,
-0.3572524, -0.003960311, -2.144341, 0, 1, 0.08235294, 1,
-0.3550991, 1.003298, -0.9433724, 0, 1, 0.08627451, 1,
-0.3548896, -1.875721, -2.331204, 0, 1, 0.09411765, 1,
-0.3534777, -1.101401, -2.997459, 0, 1, 0.1019608, 1,
-0.3474363, 0.03274892, -1.478431, 0, 1, 0.1058824, 1,
-0.3445095, -0.02685129, -1.490076, 0, 1, 0.1137255, 1,
-0.3435729, 0.9013366, 0.3961782, 0, 1, 0.1176471, 1,
-0.3425607, -1.038144, -3.649821, 0, 1, 0.1254902, 1,
-0.3416666, 1.117699, 0.01641086, 0, 1, 0.1294118, 1,
-0.3411211, 0.4984535, -1.479585, 0, 1, 0.1372549, 1,
-0.3380252, 1.417923, -0.3400568, 0, 1, 0.1411765, 1,
-0.3350882, 0.6517752, -0.1971866, 0, 1, 0.1490196, 1,
-0.3340661, -0.1659873, -2.301727, 0, 1, 0.1529412, 1,
-0.3336562, 0.6139534, 0.3075814, 0, 1, 0.1607843, 1,
-0.3295271, 1.63931, -0.1971592, 0, 1, 0.1647059, 1,
-0.3260755, -2.043306, -3.448394, 0, 1, 0.172549, 1,
-0.3236737, 0.9303246, -0.1499743, 0, 1, 0.1764706, 1,
-0.3199937, -0.1045414, -1.14192, 0, 1, 0.1843137, 1,
-0.3111503, -0.2271753, -3.779289, 0, 1, 0.1882353, 1,
-0.3099595, 0.322909, -0.2093968, 0, 1, 0.1960784, 1,
-0.3090056, 0.5485461, 0.4685754, 0, 1, 0.2039216, 1,
-0.3011604, -0.6630972, -3.166343, 0, 1, 0.2078431, 1,
-0.2907009, -0.01210579, -1.833856, 0, 1, 0.2156863, 1,
-0.2837983, 1.641666, -1.423988, 0, 1, 0.2196078, 1,
-0.2830695, 0.9052025, 0.4465602, 0, 1, 0.227451, 1,
-0.2803304, 0.1162225, -2.016081, 0, 1, 0.2313726, 1,
-0.278982, -1.336903, -3.105551, 0, 1, 0.2392157, 1,
-0.2789212, 0.269422, -2.777501, 0, 1, 0.2431373, 1,
-0.2778272, 1.166512, -0.6324331, 0, 1, 0.2509804, 1,
-0.2771812, 0.08734062, -2.077651, 0, 1, 0.254902, 1,
-0.274066, -2.312425, -3.389029, 0, 1, 0.2627451, 1,
-0.273903, 0.8669007, -2.051456, 0, 1, 0.2666667, 1,
-0.2735693, 0.1114563, -1.435641, 0, 1, 0.2745098, 1,
-0.2720803, 1.567559, -0.8172579, 0, 1, 0.2784314, 1,
-0.2656731, 0.155641, -0.3684045, 0, 1, 0.2862745, 1,
-0.2604532, 0.1347861, -2.531331, 0, 1, 0.2901961, 1,
-0.2604187, 1.676824, 1.569823, 0, 1, 0.2980392, 1,
-0.252504, -0.4979213, -3.581516, 0, 1, 0.3058824, 1,
-0.2506299, 1.229447, -0.01836593, 0, 1, 0.3098039, 1,
-0.238315, -0.4668433, -3.097103, 0, 1, 0.3176471, 1,
-0.235352, -0.4583091, -4.095186, 0, 1, 0.3215686, 1,
-0.2269702, 0.7735782, -0.1136516, 0, 1, 0.3294118, 1,
-0.2250144, -1.32718, -1.165402, 0, 1, 0.3333333, 1,
-0.2216728, -0.5161125, -2.867209, 0, 1, 0.3411765, 1,
-0.2203718, -0.3275379, -2.556736, 0, 1, 0.345098, 1,
-0.2131648, 0.09131093, -2.555107, 0, 1, 0.3529412, 1,
-0.2099668, -0.8282343, -1.830392, 0, 1, 0.3568628, 1,
-0.2084419, -0.009374491, -0.1262435, 0, 1, 0.3647059, 1,
-0.2060501, -2.148193, -4.084785, 0, 1, 0.3686275, 1,
-0.2055701, 0.9973239, 1.294849, 0, 1, 0.3764706, 1,
-0.204889, 0.8565316, -0.1928248, 0, 1, 0.3803922, 1,
-0.2034279, 0.1095045, -0.7638169, 0, 1, 0.3882353, 1,
-0.2006786, 0.1829934, -1.21137, 0, 1, 0.3921569, 1,
-0.1975145, -1.576247, -0.4360113, 0, 1, 0.4, 1,
-0.1969992, -0.7026796, -4.309514, 0, 1, 0.4078431, 1,
-0.1969744, 0.182862, -0.2247753, 0, 1, 0.4117647, 1,
-0.194315, 1.789365, -0.1870388, 0, 1, 0.4196078, 1,
-0.1908281, 0.161533, 0.05177759, 0, 1, 0.4235294, 1,
-0.1905822, -0.914481, -2.496594, 0, 1, 0.4313726, 1,
-0.1892954, 0.3488329, -1.462723, 0, 1, 0.4352941, 1,
-0.1881972, 1.787214, 0.6161851, 0, 1, 0.4431373, 1,
-0.1875485, -0.5552371, -4.539357, 0, 1, 0.4470588, 1,
-0.1866264, 1.141481, 0.3704768, 0, 1, 0.454902, 1,
-0.1847904, 0.4537502, -1.27619, 0, 1, 0.4588235, 1,
-0.1841083, 1.266565, 2.133458, 0, 1, 0.4666667, 1,
-0.1823974, 0.5219725, 0.2013395, 0, 1, 0.4705882, 1,
-0.1813412, -1.156387, -2.804804, 0, 1, 0.4784314, 1,
-0.1759885, -0.579955, -2.851718, 0, 1, 0.4823529, 1,
-0.1718999, -0.6533396, -2.565144, 0, 1, 0.4901961, 1,
-0.1640292, -0.6304789, -1.633989, 0, 1, 0.4941176, 1,
-0.1639212, 0.8249813, 0.2144812, 0, 1, 0.5019608, 1,
-0.163885, -0.4250148, -1.779777, 0, 1, 0.509804, 1,
-0.1582893, 1.061262, -0.6318156, 0, 1, 0.5137255, 1,
-0.1508284, 0.3548483, -0.504795, 0, 1, 0.5215687, 1,
-0.1503189, -0.06317098, -1.587542, 0, 1, 0.5254902, 1,
-0.1458695, 2.282257, -0.550232, 0, 1, 0.5333334, 1,
-0.1442006, 0.4116698, 0.09701937, 0, 1, 0.5372549, 1,
-0.1441996, -0.4926568, -2.523201, 0, 1, 0.5450981, 1,
-0.1422042, 0.1090216, -1.641836, 0, 1, 0.5490196, 1,
-0.1410208, 0.2425144, -0.2100021, 0, 1, 0.5568628, 1,
-0.1397998, 0.4787391, 0.2279876, 0, 1, 0.5607843, 1,
-0.1297611, 1.260677, 0.9712955, 0, 1, 0.5686275, 1,
-0.1288201, 0.5796592, -0.3653556, 0, 1, 0.572549, 1,
-0.1267226, -1.329012, -2.514348, 0, 1, 0.5803922, 1,
-0.117366, 1.764706, 0.1897968, 0, 1, 0.5843138, 1,
-0.1120834, -0.08031146, 0.1499159, 0, 1, 0.5921569, 1,
-0.112054, -0.4376862, -3.324306, 0, 1, 0.5960785, 1,
-0.1085682, -0.3701217, -3.179033, 0, 1, 0.6039216, 1,
-0.1055082, 0.07427739, -0.3983113, 0, 1, 0.6117647, 1,
-0.1050878, 0.7678403, -0.2932553, 0, 1, 0.6156863, 1,
-0.1037135, 2.057682, -0.5239374, 0, 1, 0.6235294, 1,
-0.1034562, 1.220311, 1.192048, 0, 1, 0.627451, 1,
-0.1017273, 0.6662338, 0.6398995, 0, 1, 0.6352941, 1,
-0.09403098, 1.21766, -0.2237041, 0, 1, 0.6392157, 1,
-0.09102099, 0.699187, 0.3574525, 0, 1, 0.6470588, 1,
-0.09048046, 0.05764395, -2.731014, 0, 1, 0.6509804, 1,
-0.09007037, 1.661209, 0.03524439, 0, 1, 0.6588235, 1,
-0.08966681, -1.186929, -2.650566, 0, 1, 0.6627451, 1,
-0.08470644, -0.7401422, -4.488986, 0, 1, 0.6705883, 1,
-0.08370315, -0.3120579, -2.95353, 0, 1, 0.6745098, 1,
-0.08195616, 0.5864989, -0.343203, 0, 1, 0.682353, 1,
-0.07774394, -0.9716586, -2.62091, 0, 1, 0.6862745, 1,
-0.07685736, -0.4823232, -1.845947, 0, 1, 0.6941177, 1,
-0.07099693, 0.4033211, 1.120665, 0, 1, 0.7019608, 1,
-0.06996441, 0.3295756, 0.09079266, 0, 1, 0.7058824, 1,
-0.06695548, -1.022758, -2.407303, 0, 1, 0.7137255, 1,
-0.06565012, -1.220041, -4.064546, 0, 1, 0.7176471, 1,
-0.06040427, 0.3105888, -0.5112635, 0, 1, 0.7254902, 1,
-0.04997246, -1.522473, -4.521764, 0, 1, 0.7294118, 1,
-0.04323235, 0.54242, -0.3869746, 0, 1, 0.7372549, 1,
-0.04223346, 0.5858926, -1.983658, 0, 1, 0.7411765, 1,
-0.03693423, 0.09961157, -0.1836261, 0, 1, 0.7490196, 1,
-0.03616227, 1.79965, -0.08024748, 0, 1, 0.7529412, 1,
-0.03335588, 0.02799343, 0.5299701, 0, 1, 0.7607843, 1,
-0.03267751, 0.8195806, -0.9415227, 0, 1, 0.7647059, 1,
-0.03087755, 0.05488553, -0.2937768, 0, 1, 0.772549, 1,
-0.02776845, 0.074993, 0.5973908, 0, 1, 0.7764706, 1,
-0.023511, 0.1111111, -1.055547, 0, 1, 0.7843137, 1,
-0.01992766, -0.3692975, -4.077373, 0, 1, 0.7882353, 1,
-0.01694391, -0.5523958, -4.249036, 0, 1, 0.7960784, 1,
-0.0166323, 0.7365311, -0.06510653, 0, 1, 0.8039216, 1,
-0.0152504, -0.7304741, -3.722, 0, 1, 0.8078431, 1,
-0.01081079, -1.659835, -2.992594, 0, 1, 0.8156863, 1,
-0.01001461, -0.2156511, -2.83324, 0, 1, 0.8196079, 1,
-0.008077583, 1.398973, -1.011285, 0, 1, 0.827451, 1,
-0.005983257, -0.5308934, -2.28396, 0, 1, 0.8313726, 1,
0.004799965, -0.2043784, 3.642233, 0, 1, 0.8392157, 1,
0.006107117, -0.211304, 1.912473, 0, 1, 0.8431373, 1,
0.01307709, -1.1747, 3.866844, 0, 1, 0.8509804, 1,
0.01896264, -1.169687, 1.775049, 0, 1, 0.854902, 1,
0.01927423, -0.3071491, 3.863088, 0, 1, 0.8627451, 1,
0.01997585, 0.5355823, -0.2510526, 0, 1, 0.8666667, 1,
0.02123005, 0.4244609, 0.5811031, 0, 1, 0.8745098, 1,
0.0222439, 0.9939527, 0.007020713, 0, 1, 0.8784314, 1,
0.02374581, -1.159341, 1.656786, 0, 1, 0.8862745, 1,
0.02376724, -0.1348445, 3.4078, 0, 1, 0.8901961, 1,
0.02479699, -1.005602, 4.074942, 0, 1, 0.8980392, 1,
0.02637743, 0.3034456, 0.5652761, 0, 1, 0.9058824, 1,
0.02644298, 0.443581, 1.845493, 0, 1, 0.9098039, 1,
0.02663596, -0.7653461, 3.648718, 0, 1, 0.9176471, 1,
0.02823737, -0.8385073, 2.974734, 0, 1, 0.9215686, 1,
0.03145873, -2.141121, 4.271701, 0, 1, 0.9294118, 1,
0.03219988, 1.773231, 0.2840827, 0, 1, 0.9333333, 1,
0.03438703, -0.0384318, 2.984173, 0, 1, 0.9411765, 1,
0.03587154, 0.5772075, -1.210961, 0, 1, 0.945098, 1,
0.03708503, -0.9059023, 5.201128, 0, 1, 0.9529412, 1,
0.04054117, 0.001902731, -0.5472388, 0, 1, 0.9568627, 1,
0.0417608, 1.348902, -0.1660372, 0, 1, 0.9647059, 1,
0.04230652, 0.6290962, -0.197055, 0, 1, 0.9686275, 1,
0.04881804, -0.1313404, 3.237285, 0, 1, 0.9764706, 1,
0.05073258, -1.144019, 0.7230001, 0, 1, 0.9803922, 1,
0.05119495, 0.2651927, 0.305486, 0, 1, 0.9882353, 1,
0.05294099, 1.084658, 1.414944, 0, 1, 0.9921569, 1,
0.05854595, -1.05561, 2.110137, 0, 1, 1, 1,
0.05944638, -0.7469351, 4.194643, 0, 0.9921569, 1, 1,
0.06311902, -0.5573899, 2.628298, 0, 0.9882353, 1, 1,
0.06519912, 0.9409389, -0.135626, 0, 0.9803922, 1, 1,
0.06630816, 0.07051862, -0.8945269, 0, 0.9764706, 1, 1,
0.06652854, -1.404005, 2.614993, 0, 0.9686275, 1, 1,
0.06687243, 1.615708, 0.2082017, 0, 0.9647059, 1, 1,
0.06786477, 1.045808, 0.1893719, 0, 0.9568627, 1, 1,
0.06958498, 1.711648, -0.9180503, 0, 0.9529412, 1, 1,
0.07176345, -0.275449, 3.243467, 0, 0.945098, 1, 1,
0.07361395, 0.525588, 0.1759099, 0, 0.9411765, 1, 1,
0.07400773, 0.002131814, -0.528681, 0, 0.9333333, 1, 1,
0.07601271, -0.6595094, 1.995936, 0, 0.9294118, 1, 1,
0.08135022, -2.340469, 3.034326, 0, 0.9215686, 1, 1,
0.08514688, 1.901591, 1.645038, 0, 0.9176471, 1, 1,
0.08811446, 0.95627, 0.7068333, 0, 0.9098039, 1, 1,
0.09572345, -1.239138, 3.218734, 0, 0.9058824, 1, 1,
0.09764207, 0.4675887, -0.3984466, 0, 0.8980392, 1, 1,
0.09775816, -0.2813234, 3.991367, 0, 0.8901961, 1, 1,
0.09859052, -0.2611465, 3.519095, 0, 0.8862745, 1, 1,
0.1028547, -0.6556347, 3.529946, 0, 0.8784314, 1, 1,
0.1058875, 0.4119003, -0.5495251, 0, 0.8745098, 1, 1,
0.1086317, 0.7551905, -0.8340836, 0, 0.8666667, 1, 1,
0.1095333, 0.3811852, 0.7576447, 0, 0.8627451, 1, 1,
0.1101461, -0.9381821, 4.373963, 0, 0.854902, 1, 1,
0.111575, -2.053527, 3.456933, 0, 0.8509804, 1, 1,
0.1133714, -1.814992, 1.661212, 0, 0.8431373, 1, 1,
0.1145811, -1.309978, 2.908052, 0, 0.8392157, 1, 1,
0.1154826, -0.8089431, 3.445868, 0, 0.8313726, 1, 1,
0.1180722, 0.1207657, 1.123895, 0, 0.827451, 1, 1,
0.1237872, -1.766795, 2.029749, 0, 0.8196079, 1, 1,
0.1260131, 0.2903267, 0.7920533, 0, 0.8156863, 1, 1,
0.1304757, 0.2960421, -0.6657692, 0, 0.8078431, 1, 1,
0.1320484, 0.2730075, -0.7018554, 0, 0.8039216, 1, 1,
0.1345667, -0.9633096, 3.910313, 0, 0.7960784, 1, 1,
0.1387701, -0.2130039, 1.140774, 0, 0.7882353, 1, 1,
0.1416917, 0.6006386, 0.3166722, 0, 0.7843137, 1, 1,
0.1425641, 0.9430919, -2.679585, 0, 0.7764706, 1, 1,
0.14797, 0.5413567, 0.596587, 0, 0.772549, 1, 1,
0.1497104, 0.8504913, -0.5340981, 0, 0.7647059, 1, 1,
0.1499455, -0.7387375, 3.704322, 0, 0.7607843, 1, 1,
0.1509262, 1.105988, -0.7744057, 0, 0.7529412, 1, 1,
0.1567203, 0.5130765, 1.258035, 0, 0.7490196, 1, 1,
0.1574852, -0.9168631, 2.071887, 0, 0.7411765, 1, 1,
0.1588242, 1.049094, 0.7264088, 0, 0.7372549, 1, 1,
0.1593745, -0.8129587, 1.397889, 0, 0.7294118, 1, 1,
0.1612554, 1.890585, 0.4213628, 0, 0.7254902, 1, 1,
0.1642877, -0.2786355, 1.40939, 0, 0.7176471, 1, 1,
0.1649523, -0.5599414, 2.729902, 0, 0.7137255, 1, 1,
0.167028, 0.3052749, 0.4933741, 0, 0.7058824, 1, 1,
0.1672684, 0.01678752, -0.01090038, 0, 0.6980392, 1, 1,
0.1732956, 1.218412, 0.375783, 0, 0.6941177, 1, 1,
0.1746465, 0.25817, 0.4225596, 0, 0.6862745, 1, 1,
0.1752771, 1.257332, -1.17409, 0, 0.682353, 1, 1,
0.1770196, -1.701649, 1.961783, 0, 0.6745098, 1, 1,
0.1794712, -1.093625, 2.351563, 0, 0.6705883, 1, 1,
0.1810107, 1.113566, 1.313027, 0, 0.6627451, 1, 1,
0.1824599, 0.2286479, 1.529181, 0, 0.6588235, 1, 1,
0.1825354, -0.6656913, 2.245094, 0, 0.6509804, 1, 1,
0.1873536, -0.7339659, 3.053554, 0, 0.6470588, 1, 1,
0.1898351, -1.516601, 0.8128815, 0, 0.6392157, 1, 1,
0.1915455, 1.73764, 0.1145092, 0, 0.6352941, 1, 1,
0.1935692, 0.5779561, 1.049286, 0, 0.627451, 1, 1,
0.1995016, 0.01132165, 2.045435, 0, 0.6235294, 1, 1,
0.200978, 0.2028103, 0.5031522, 0, 0.6156863, 1, 1,
0.2018404, -0.9042043, 3.884573, 0, 0.6117647, 1, 1,
0.2072882, 0.6461574, 1.767672, 0, 0.6039216, 1, 1,
0.2131005, -1.289368, 4.17016, 0, 0.5960785, 1, 1,
0.2134545, 1.343105, 1.212962, 0, 0.5921569, 1, 1,
0.215103, 1.209614, 2.646944, 0, 0.5843138, 1, 1,
0.2188637, 0.05554158, 0.1463179, 0, 0.5803922, 1, 1,
0.2207457, 0.6453039, -0.4436156, 0, 0.572549, 1, 1,
0.2208493, 0.2012085, 0.4778751, 0, 0.5686275, 1, 1,
0.2232814, -1.799298, 1.955271, 0, 0.5607843, 1, 1,
0.2266808, -0.4439346, 3.848288, 0, 0.5568628, 1, 1,
0.2311035, -0.5739472, 3.571234, 0, 0.5490196, 1, 1,
0.2318511, 0.4860926, 0.1516793, 0, 0.5450981, 1, 1,
0.2331773, -0.7538511, 4.517108, 0, 0.5372549, 1, 1,
0.2347805, 0.6813022, -0.5583387, 0, 0.5333334, 1, 1,
0.2352802, -1.204687, 2.625082, 0, 0.5254902, 1, 1,
0.2375425, 2.134439, 0.0529062, 0, 0.5215687, 1, 1,
0.2378699, 0.0538179, 3.309864, 0, 0.5137255, 1, 1,
0.2381476, -1.058836, 3.416372, 0, 0.509804, 1, 1,
0.2389743, 0.9704258, 0.2079283, 0, 0.5019608, 1, 1,
0.2431811, 0.8046416, -0.2005844, 0, 0.4941176, 1, 1,
0.2436886, 0.3267674, 0.2450701, 0, 0.4901961, 1, 1,
0.2471404, -0.4786628, 1.424078, 0, 0.4823529, 1, 1,
0.2496087, 0.9845287, -0.1504419, 0, 0.4784314, 1, 1,
0.2497376, -0.9307413, 3.235056, 0, 0.4705882, 1, 1,
0.2526266, 1.200219, -1.159309, 0, 0.4666667, 1, 1,
0.2551509, -0.3071539, 0.120538, 0, 0.4588235, 1, 1,
0.2573897, 0.7600702, -0.8551114, 0, 0.454902, 1, 1,
0.2690024, -0.3223875, 0.7627422, 0, 0.4470588, 1, 1,
0.2706794, 1.04347, 1.141016, 0, 0.4431373, 1, 1,
0.2715662, -0.08191164, 3.061183, 0, 0.4352941, 1, 1,
0.2737124, -3.918651, 3.159346, 0, 0.4313726, 1, 1,
0.276293, -0.9027506, 0.9669003, 0, 0.4235294, 1, 1,
0.2763806, 0.3329693, 1.155916, 0, 0.4196078, 1, 1,
0.2785374, 0.6256404, 1.256881, 0, 0.4117647, 1, 1,
0.2800609, -0.4461488, 1.084304, 0, 0.4078431, 1, 1,
0.2843055, -0.3901997, 1.67554, 0, 0.4, 1, 1,
0.2863443, -0.5345908, 1.272357, 0, 0.3921569, 1, 1,
0.2919564, -0.0149999, 0.4645946, 0, 0.3882353, 1, 1,
0.2945307, -0.6065403, 2.908546, 0, 0.3803922, 1, 1,
0.2950846, 0.2197323, 0.2461824, 0, 0.3764706, 1, 1,
0.2968871, 0.08283729, 2.147893, 0, 0.3686275, 1, 1,
0.2976016, 0.5428035, 1.231991, 0, 0.3647059, 1, 1,
0.2978743, -0.2298763, 0.9041738, 0, 0.3568628, 1, 1,
0.2991835, -0.2327795, 1.392595, 0, 0.3529412, 1, 1,
0.2999527, 0.7930419, 2.697169, 0, 0.345098, 1, 1,
0.3015103, -0.6760921, 2.256679, 0, 0.3411765, 1, 1,
0.3022093, -0.2390911, -0.04242841, 0, 0.3333333, 1, 1,
0.3025158, 0.5332258, 1.989324, 0, 0.3294118, 1, 1,
0.302986, -0.3335803, -0.2145526, 0, 0.3215686, 1, 1,
0.3140668, -0.04314889, 1.980375, 0, 0.3176471, 1, 1,
0.3173755, -0.04709811, 0.2757077, 0, 0.3098039, 1, 1,
0.3222631, -0.2746426, 3.822541, 0, 0.3058824, 1, 1,
0.3223865, -1.73707, 3.527656, 0, 0.2980392, 1, 1,
0.3252282, -1.801699, 0.3448813, 0, 0.2901961, 1, 1,
0.3277518, 0.04604195, 0.6701905, 0, 0.2862745, 1, 1,
0.3298158, -1.772783, 1.272512, 0, 0.2784314, 1, 1,
0.3304643, 1.245318, 0.06855949, 0, 0.2745098, 1, 1,
0.3318698, -0.04490541, 2.278314, 0, 0.2666667, 1, 1,
0.3363436, -1.024052, 3.780012, 0, 0.2627451, 1, 1,
0.3370133, -0.04763643, 2.438132, 0, 0.254902, 1, 1,
0.3430581, -0.5727451, 4.295329, 0, 0.2509804, 1, 1,
0.3438871, 0.3088089, 1.165986, 0, 0.2431373, 1, 1,
0.3463764, 0.5543838, 1.406217, 0, 0.2392157, 1, 1,
0.3467045, -0.8396572, 2.831747, 0, 0.2313726, 1, 1,
0.3480518, 0.62794, 1.417554, 0, 0.227451, 1, 1,
0.3551044, -0.3666008, 1.940297, 0, 0.2196078, 1, 1,
0.3569959, -1.583735, 3.547723, 0, 0.2156863, 1, 1,
0.3639356, -0.4222751, 0.9802479, 0, 0.2078431, 1, 1,
0.3647028, -1.494024, 2.779843, 0, 0.2039216, 1, 1,
0.3672903, -0.5281835, 2.282197, 0, 0.1960784, 1, 1,
0.3676085, -0.8422219, 1.767931, 0, 0.1882353, 1, 1,
0.3676839, -1.6516, 3.667613, 0, 0.1843137, 1, 1,
0.3757327, -1.550927, 2.632096, 0, 0.1764706, 1, 1,
0.3763707, -0.1923463, 1.238141, 0, 0.172549, 1, 1,
0.3781722, 1.309614, 3.340444, 0, 0.1647059, 1, 1,
0.3801049, 0.8521281, 1.941382, 0, 0.1607843, 1, 1,
0.3821392, -0.6365561, 3.856848, 0, 0.1529412, 1, 1,
0.384947, -0.1755644, 1.395131, 0, 0.1490196, 1, 1,
0.3877002, -0.3716899, 2.803291, 0, 0.1411765, 1, 1,
0.3892443, -1.34723, 2.583091, 0, 0.1372549, 1, 1,
0.390081, -0.1977678, 3.266766, 0, 0.1294118, 1, 1,
0.3917328, -0.1758604, 1.96167, 0, 0.1254902, 1, 1,
0.3932157, 0.7955597, -0.7149085, 0, 0.1176471, 1, 1,
0.3963553, 0.4150562, 0.5786782, 0, 0.1137255, 1, 1,
0.3990656, -1.368527, 3.537613, 0, 0.1058824, 1, 1,
0.4017159, 0.009662494, 1.729355, 0, 0.09803922, 1, 1,
0.4049232, -0.342454, 3.71888, 0, 0.09411765, 1, 1,
0.4069396, 0.4801179, 0.3836997, 0, 0.08627451, 1, 1,
0.4097712, 2.573846, 1.649229, 0, 0.08235294, 1, 1,
0.4104566, 2.60512, 1.038259, 0, 0.07450981, 1, 1,
0.4134335, 0.9776261, -0.3765114, 0, 0.07058824, 1, 1,
0.4140807, -1.409121, 3.095467, 0, 0.0627451, 1, 1,
0.4231751, -1.390267, 2.033682, 0, 0.05882353, 1, 1,
0.4272097, 0.2417248, -1.255184, 0, 0.05098039, 1, 1,
0.4276362, 2.170809, 0.3068743, 0, 0.04705882, 1, 1,
0.4303848, 1.918447, 0.8045201, 0, 0.03921569, 1, 1,
0.4336965, -1.163179, 3.484854, 0, 0.03529412, 1, 1,
0.4354029, 1.139232, 0.3300016, 0, 0.02745098, 1, 1,
0.4354407, 0.7642661, -0.1248981, 0, 0.02352941, 1, 1,
0.4367729, -0.2847525, 2.494354, 0, 0.01568628, 1, 1,
0.4394919, 0.4313628, 2.371649, 0, 0.01176471, 1, 1,
0.4429863, -0.4834521, 1.451103, 0, 0.003921569, 1, 1,
0.4511201, 0.2539144, 1.183779, 0.003921569, 0, 1, 1,
0.4550938, -0.3018371, 1.106114, 0.007843138, 0, 1, 1,
0.4593225, -0.473449, 0.9697011, 0.01568628, 0, 1, 1,
0.4613008, -1.031608, 2.496, 0.01960784, 0, 1, 1,
0.4631805, -0.07786722, 1.709179, 0.02745098, 0, 1, 1,
0.4633511, 0.2423755, -0.1976777, 0.03137255, 0, 1, 1,
0.4660005, -1.028067, 2.900736, 0.03921569, 0, 1, 1,
0.4666354, -0.4014221, 1.349056, 0.04313726, 0, 1, 1,
0.4673359, -0.3774777, 2.406639, 0.05098039, 0, 1, 1,
0.4709789, 1.02006, 0.7343144, 0.05490196, 0, 1, 1,
0.4710187, -2.571339, 2.857054, 0.0627451, 0, 1, 1,
0.4730115, -0.8644565, 3.159292, 0.06666667, 0, 1, 1,
0.4772614, 0.908657, 0.4899852, 0.07450981, 0, 1, 1,
0.4854595, -0.6134453, 2.689454, 0.07843138, 0, 1, 1,
0.4867483, -0.2455906, 2.24753, 0.08627451, 0, 1, 1,
0.4888504, -0.456298, 1.421419, 0.09019608, 0, 1, 1,
0.4897372, 0.7683939, 0.7429667, 0.09803922, 0, 1, 1,
0.4927076, -0.3186459, 3.621788, 0.1058824, 0, 1, 1,
0.4928235, -1.825245, 1.304299, 0.1098039, 0, 1, 1,
0.4928526, -0.1987163, 2.095405, 0.1176471, 0, 1, 1,
0.4964202, -0.8864185, 1.503758, 0.1215686, 0, 1, 1,
0.4965845, -0.008896146, 0.7929718, 0.1294118, 0, 1, 1,
0.4977208, 0.5444108, 0.8460038, 0.1333333, 0, 1, 1,
0.4981188, -0.1526651, 1.687908, 0.1411765, 0, 1, 1,
0.5058887, -1.49392, 4.865843, 0.145098, 0, 1, 1,
0.5107184, 0.1703571, 1.032413, 0.1529412, 0, 1, 1,
0.5108836, 0.01942735, 1.171066, 0.1568628, 0, 1, 1,
0.5169631, 0.8176647, 0.3677655, 0.1647059, 0, 1, 1,
0.5276328, -0.1476558, 2.189595, 0.1686275, 0, 1, 1,
0.5276718, -1.477728, 1.555798, 0.1764706, 0, 1, 1,
0.5359938, 2.086563, -0.3916431, 0.1803922, 0, 1, 1,
0.5389165, 0.1382499, -0.4341361, 0.1882353, 0, 1, 1,
0.5405203, -0.9897054, 3.078864, 0.1921569, 0, 1, 1,
0.5425385, 1.494964, 0.2918431, 0.2, 0, 1, 1,
0.5439768, -0.1903734, 2.022469, 0.2078431, 0, 1, 1,
0.5459129, -1.394822, 2.960738, 0.2117647, 0, 1, 1,
0.5476029, 0.09836143, 0.6793636, 0.2196078, 0, 1, 1,
0.5483043, 0.6687971, 0.4761687, 0.2235294, 0, 1, 1,
0.5491121, 0.229991, -1.191542, 0.2313726, 0, 1, 1,
0.5526519, 2.028944, 1.171471, 0.2352941, 0, 1, 1,
0.5532826, -0.654255, 1.805495, 0.2431373, 0, 1, 1,
0.5537516, -0.9857844, 4.42744, 0.2470588, 0, 1, 1,
0.5537776, 0.5167783, 1.310807, 0.254902, 0, 1, 1,
0.5567037, -0.663321, 2.71378, 0.2588235, 0, 1, 1,
0.5622888, 2.342134, -0.4261303, 0.2666667, 0, 1, 1,
0.5674279, -0.787165, 1.409945, 0.2705882, 0, 1, 1,
0.5689929, 2.11177, -0.7783901, 0.2784314, 0, 1, 1,
0.5704635, 2.858192, -0.3819627, 0.282353, 0, 1, 1,
0.5720277, 0.6069027, 1.420864, 0.2901961, 0, 1, 1,
0.5737976, -1.277413, 0.541764, 0.2941177, 0, 1, 1,
0.5742536, -0.8412403, 2.908159, 0.3019608, 0, 1, 1,
0.5750202, 1.879935, -0.4869966, 0.3098039, 0, 1, 1,
0.5782881, -0.5013206, 2.692127, 0.3137255, 0, 1, 1,
0.5814766, 1.575013, 1.160906, 0.3215686, 0, 1, 1,
0.5825177, 1.153955, -1.270032, 0.3254902, 0, 1, 1,
0.5826666, -0.711, 3.265701, 0.3333333, 0, 1, 1,
0.5918344, -0.3897305, 2.642149, 0.3372549, 0, 1, 1,
0.5975973, 0.6548621, 2.033459, 0.345098, 0, 1, 1,
0.6004171, -0.2235161, 1.730738, 0.3490196, 0, 1, 1,
0.6059599, -0.1401262, 1.365803, 0.3568628, 0, 1, 1,
0.6061407, 0.696417, 0.3875306, 0.3607843, 0, 1, 1,
0.6066861, -1.03259, 1.291936, 0.3686275, 0, 1, 1,
0.6110413, -1.82894, 3.247819, 0.372549, 0, 1, 1,
0.6123515, 0.3518133, 0.5264814, 0.3803922, 0, 1, 1,
0.6127989, 1.034472, 1.829329, 0.3843137, 0, 1, 1,
0.6136518, 0.08927408, 1.749097, 0.3921569, 0, 1, 1,
0.6144681, 1.397258, -0.05017949, 0.3960784, 0, 1, 1,
0.6150501, 0.9637014, 0.05365602, 0.4039216, 0, 1, 1,
0.6160265, -0.2598453, 1.180626, 0.4117647, 0, 1, 1,
0.6164851, 0.5016463, 0.3457229, 0.4156863, 0, 1, 1,
0.6170392, -0.07191993, 1.82175, 0.4235294, 0, 1, 1,
0.6201974, 0.009421649, 1.809754, 0.427451, 0, 1, 1,
0.6271774, 1.655284, 0.7443209, 0.4352941, 0, 1, 1,
0.6297989, 2.198931, 1.372191, 0.4392157, 0, 1, 1,
0.6300317, 1.859221, 0.006180443, 0.4470588, 0, 1, 1,
0.6420877, 0.1275399, 1.051361, 0.4509804, 0, 1, 1,
0.6545717, -0.4613378, 2.482397, 0.4588235, 0, 1, 1,
0.6550927, -0.03654447, 1.971487, 0.4627451, 0, 1, 1,
0.6580541, -1.121193, 2.238719, 0.4705882, 0, 1, 1,
0.6581858, -0.2249176, 2.156593, 0.4745098, 0, 1, 1,
0.6641203, -0.7129046, 0.7566391, 0.4823529, 0, 1, 1,
0.6779557, -0.5075853, -0.4513876, 0.4862745, 0, 1, 1,
0.6925481, 0.3977465, 0.3080238, 0.4941176, 0, 1, 1,
0.6951561, 0.9205707, -0.5362981, 0.5019608, 0, 1, 1,
0.6972839, 2.864831, 1.190082, 0.5058824, 0, 1, 1,
0.7047939, -0.1105262, 2.876763, 0.5137255, 0, 1, 1,
0.7060181, 0.6618536, 0.3293745, 0.5176471, 0, 1, 1,
0.7090757, 2.392, 2.00303, 0.5254902, 0, 1, 1,
0.7130826, 0.9969072, 2.089291, 0.5294118, 0, 1, 1,
0.7141154, -2.170644, 2.226038, 0.5372549, 0, 1, 1,
0.7190961, -0.2091954, 1.957183, 0.5411765, 0, 1, 1,
0.7235531, 0.5684893, 0.6093583, 0.5490196, 0, 1, 1,
0.7273525, 0.9987644, 1.20987, 0.5529412, 0, 1, 1,
0.7274445, 1.444499, 0.7804568, 0.5607843, 0, 1, 1,
0.7281719, 0.2079178, 2.636059, 0.5647059, 0, 1, 1,
0.7312357, 1.110979, 1.954684, 0.572549, 0, 1, 1,
0.7342426, -0.4436475, 3.488181, 0.5764706, 0, 1, 1,
0.7356529, 0.07767399, 0.8132461, 0.5843138, 0, 1, 1,
0.738594, -1.669322, 2.528873, 0.5882353, 0, 1, 1,
0.7391863, 0.06008882, 0.345399, 0.5960785, 0, 1, 1,
0.7395002, 1.064569, 0.3902652, 0.6039216, 0, 1, 1,
0.742169, -1.958399, 3.226571, 0.6078432, 0, 1, 1,
0.7484044, -1.075689, 1.93363, 0.6156863, 0, 1, 1,
0.748888, -0.4511495, 1.935112, 0.6196079, 0, 1, 1,
0.7499887, -1.975861, 2.021724, 0.627451, 0, 1, 1,
0.7510871, 1.085309, 0.08810942, 0.6313726, 0, 1, 1,
0.7541163, -1.183396, 2.928832, 0.6392157, 0, 1, 1,
0.7581148, 1.34503, 0.5650674, 0.6431373, 0, 1, 1,
0.7589082, 0.7296636, 1.214666, 0.6509804, 0, 1, 1,
0.7592109, -0.1202069, 1.232675, 0.654902, 0, 1, 1,
0.761444, -1.928212, 2.24966, 0.6627451, 0, 1, 1,
0.7714366, 0.03773956, 1.155508, 0.6666667, 0, 1, 1,
0.7714497, -1.243037, 2.937253, 0.6745098, 0, 1, 1,
0.7732002, -0.2694539, 1.325746, 0.6784314, 0, 1, 1,
0.774092, 1.585154, -1.134109, 0.6862745, 0, 1, 1,
0.7777313, -0.1889328, 1.046374, 0.6901961, 0, 1, 1,
0.7779832, -0.846007, 1.936631, 0.6980392, 0, 1, 1,
0.7824246, -0.2408009, 1.819289, 0.7058824, 0, 1, 1,
0.783096, -0.5544204, -0.3538396, 0.7098039, 0, 1, 1,
0.7897989, 0.4303881, 1.011925, 0.7176471, 0, 1, 1,
0.7935238, 0.872347, -0.5422958, 0.7215686, 0, 1, 1,
0.7937431, -0.992059, 2.469895, 0.7294118, 0, 1, 1,
0.7962825, -0.04579825, 1.241052, 0.7333333, 0, 1, 1,
0.7969915, -0.7691782, 3.675136, 0.7411765, 0, 1, 1,
0.7989161, 0.5582019, 1.011776, 0.7450981, 0, 1, 1,
0.7998883, 0.2313876, 2.995432, 0.7529412, 0, 1, 1,
0.8033392, 0.5326487, 1.977348, 0.7568628, 0, 1, 1,
0.8043258, -0.8095101, 3.523037, 0.7647059, 0, 1, 1,
0.8132005, -0.2368087, 0.2169368, 0.7686275, 0, 1, 1,
0.827158, 0.07952596, 0.4638236, 0.7764706, 0, 1, 1,
0.8361443, -1.401686, 2.484859, 0.7803922, 0, 1, 1,
0.8387656, 0.3513637, 1.832929, 0.7882353, 0, 1, 1,
0.8407111, -0.380173, 2.922859, 0.7921569, 0, 1, 1,
0.8418596, 1.557927, 0.2622463, 0.8, 0, 1, 1,
0.8440272, -0.3408072, 2.281011, 0.8078431, 0, 1, 1,
0.8486756, -0.8501204, 3.816892, 0.8117647, 0, 1, 1,
0.8596137, -1.673751, 3.417897, 0.8196079, 0, 1, 1,
0.8676334, -1.139215, 3.632505, 0.8235294, 0, 1, 1,
0.8699424, 0.9074042, 1.665732, 0.8313726, 0, 1, 1,
0.8703658, -0.2974575, 1.746962, 0.8352941, 0, 1, 1,
0.8744387, 1.143783, 2.266912, 0.8431373, 0, 1, 1,
0.8779441, -0.5902972, 2.794816, 0.8470588, 0, 1, 1,
0.8875028, -0.3930698, 0.7741541, 0.854902, 0, 1, 1,
0.8903462, 1.394737, 1.489151, 0.8588235, 0, 1, 1,
0.8925718, 0.3331368, 1.694347, 0.8666667, 0, 1, 1,
0.8937813, 0.07603082, 1.210213, 0.8705882, 0, 1, 1,
0.899368, 1.144179, 1.188895, 0.8784314, 0, 1, 1,
0.8997186, 0.9929159, 0.6920578, 0.8823529, 0, 1, 1,
0.9026358, 0.4609573, 0.4032575, 0.8901961, 0, 1, 1,
0.9047034, 0.4140552, 0.765965, 0.8941177, 0, 1, 1,
0.909242, -1.771697, 2.807225, 0.9019608, 0, 1, 1,
0.9100937, -0.9846048, 2.500703, 0.9098039, 0, 1, 1,
0.9126419, 1.360393, -0.4249225, 0.9137255, 0, 1, 1,
0.9174371, 0.2185152, 0.7127606, 0.9215686, 0, 1, 1,
0.918515, 0.3721556, 0.6159237, 0.9254902, 0, 1, 1,
0.9222544, 0.2574028, 1.801485, 0.9333333, 0, 1, 1,
0.9229655, -0.06575888, 1.965923, 0.9372549, 0, 1, 1,
0.9239353, -0.9680046, 1.119184, 0.945098, 0, 1, 1,
0.9242455, -0.6164935, 2.283436, 0.9490196, 0, 1, 1,
0.9255648, 0.6856157, 1.066299, 0.9568627, 0, 1, 1,
0.9287116, -1.865637, 3.445948, 0.9607843, 0, 1, 1,
0.9424641, -0.5820224, 1.705748, 0.9686275, 0, 1, 1,
0.9455944, 1.912252, 1.111334, 0.972549, 0, 1, 1,
0.9518976, 0.7254248, 1.65532, 0.9803922, 0, 1, 1,
0.9530448, -0.7636079, 2.785547, 0.9843137, 0, 1, 1,
0.9563993, 0.382972, 0.9538783, 0.9921569, 0, 1, 1,
0.9575398, 0.1050142, 2.206076, 0.9960784, 0, 1, 1,
0.9613025, 0.810001, 0.4661202, 1, 0, 0.9960784, 1,
0.9632166, 0.5590843, -0.1177085, 1, 0, 0.9882353, 1,
0.9647021, -0.6776236, 1.578233, 1, 0, 0.9843137, 1,
0.966613, 1.466248, -1.296145, 1, 0, 0.9764706, 1,
0.9863517, 0.03590979, 2.094412, 1, 0, 0.972549, 1,
0.9863639, -1.313655, 2.173136, 1, 0, 0.9647059, 1,
0.9869629, -0.778845, 2.019886, 1, 0, 0.9607843, 1,
0.9872437, -1.393971, 2.053475, 1, 0, 0.9529412, 1,
0.9875104, 0.2729787, 2.843732, 1, 0, 0.9490196, 1,
0.9912502, 0.7882755, 1.458682, 1, 0, 0.9411765, 1,
0.9939581, 0.7950187, -1.364565, 1, 0, 0.9372549, 1,
0.9945619, -0.194175, 4.604956, 1, 0, 0.9294118, 1,
1.003362, -1.0143, 0.5350087, 1, 0, 0.9254902, 1,
1.00622, 1.452347, 0.4537143, 1, 0, 0.9176471, 1,
1.008339, -1.671394, 3.253339, 1, 0, 0.9137255, 1,
1.010725, 1.065526, 1.526465, 1, 0, 0.9058824, 1,
1.011872, -0.2384183, 1.330109, 1, 0, 0.9019608, 1,
1.018014, -0.677588, 4.808578, 1, 0, 0.8941177, 1,
1.01865, -2.190591, 3.055965, 1, 0, 0.8862745, 1,
1.018869, -1.073748, 1.736761, 1, 0, 0.8823529, 1,
1.023697, 2.099527, -0.6080138, 1, 0, 0.8745098, 1,
1.024779, -0.5422115, 2.104934, 1, 0, 0.8705882, 1,
1.034022, 0.5888507, 0.1858407, 1, 0, 0.8627451, 1,
1.035724, 0.7312309, 1.209244, 1, 0, 0.8588235, 1,
1.041328, -0.4040904, 1.149543, 1, 0, 0.8509804, 1,
1.041343, 1.344824, -1.053717, 1, 0, 0.8470588, 1,
1.042255, 0.4190056, 1.302842, 1, 0, 0.8392157, 1,
1.048051, -2.428276, 2.913993, 1, 0, 0.8352941, 1,
1.052618, 0.733551, 2.409979, 1, 0, 0.827451, 1,
1.064558, -0.3578669, -0.5735896, 1, 0, 0.8235294, 1,
1.0681, 0.268808, 1.148515, 1, 0, 0.8156863, 1,
1.075453, -0.1705599, 2.499428, 1, 0, 0.8117647, 1,
1.082681, 1.142226, 1.878445, 1, 0, 0.8039216, 1,
1.084234, -0.5500801, 3.716055, 1, 0, 0.7960784, 1,
1.086266, 0.7948956, 0.3987796, 1, 0, 0.7921569, 1,
1.110708, 1.107557, 0.1662441, 1, 0, 0.7843137, 1,
1.11578, 0.227107, 0.3571225, 1, 0, 0.7803922, 1,
1.12303, -0.4960991, 2.631433, 1, 0, 0.772549, 1,
1.127659, 0.4334204, 2.767312, 1, 0, 0.7686275, 1,
1.135827, 1.749713, 1.164482, 1, 0, 0.7607843, 1,
1.147487, 1.280713, 1.678286, 1, 0, 0.7568628, 1,
1.149849, -0.2891474, 2.585099, 1, 0, 0.7490196, 1,
1.157407, 0.6406949, 0.9477167, 1, 0, 0.7450981, 1,
1.163475, -0.4564278, 0.9300076, 1, 0, 0.7372549, 1,
1.16488, 1.341705, 1.25529, 1, 0, 0.7333333, 1,
1.164947, 0.2744081, 2.47041, 1, 0, 0.7254902, 1,
1.170436, 0.2754197, 2.193223, 1, 0, 0.7215686, 1,
1.184576, -2.418202, 2.314553, 1, 0, 0.7137255, 1,
1.184986, -0.09355542, 3.525452, 1, 0, 0.7098039, 1,
1.188039, 0.9343334, 1.193204, 1, 0, 0.7019608, 1,
1.189714, -1.762292, 1.761913, 1, 0, 0.6941177, 1,
1.190039, 0.04347731, -1.4188, 1, 0, 0.6901961, 1,
1.1953, -1.235027, 2.161255, 1, 0, 0.682353, 1,
1.197101, 0.5726698, 0.6526468, 1, 0, 0.6784314, 1,
1.198378, -0.8240183, 2.307629, 1, 0, 0.6705883, 1,
1.203119, -0.03986339, 0.8860345, 1, 0, 0.6666667, 1,
1.203508, -0.5935132, 2.668444, 1, 0, 0.6588235, 1,
1.204012, -1.100909, 2.04817, 1, 0, 0.654902, 1,
1.205124, 1.079806, 0.6170677, 1, 0, 0.6470588, 1,
1.207904, -0.2977678, 0.8609667, 1, 0, 0.6431373, 1,
1.209131, 0.2768582, 0.7461584, 1, 0, 0.6352941, 1,
1.217255, -0.001796121, 1.575168, 1, 0, 0.6313726, 1,
1.218204, 2.180898, 1.11193, 1, 0, 0.6235294, 1,
1.227649, 0.5085182, -0.3612744, 1, 0, 0.6196079, 1,
1.242188, 0.7999343, 0.410249, 1, 0, 0.6117647, 1,
1.250875, -1.965574, 1.484339, 1, 0, 0.6078432, 1,
1.251208, 0.7584613, -0.0921008, 1, 0, 0.6, 1,
1.254963, -0.8563493, 2.391438, 1, 0, 0.5921569, 1,
1.273927, 0.7136438, 1.060633, 1, 0, 0.5882353, 1,
1.275267, 1.09781, -0.06673346, 1, 0, 0.5803922, 1,
1.280031, -0.8932697, 2.155742, 1, 0, 0.5764706, 1,
1.282605, -0.7294652, 0.6593177, 1, 0, 0.5686275, 1,
1.288142, -0.9613203, 2.380124, 1, 0, 0.5647059, 1,
1.289977, 0.8900189, 3.162569, 1, 0, 0.5568628, 1,
1.293124, -0.1731589, 2.190166, 1, 0, 0.5529412, 1,
1.300838, 0.2840704, 2.96539, 1, 0, 0.5450981, 1,
1.301143, 0.1233014, 2.004432, 1, 0, 0.5411765, 1,
1.304296, 0.9674584, 1.306035, 1, 0, 0.5333334, 1,
1.31032, 1.154393, -0.6966935, 1, 0, 0.5294118, 1,
1.336393, -0.200753, 1.519132, 1, 0, 0.5215687, 1,
1.340371, 0.2630313, 2.689441, 1, 0, 0.5176471, 1,
1.346469, 1.004458, 0.2717208, 1, 0, 0.509804, 1,
1.362991, 1.643045, -0.51156, 1, 0, 0.5058824, 1,
1.386531, 1.243529, 0.7110324, 1, 0, 0.4980392, 1,
1.388625, 0.8582944, -0.08895417, 1, 0, 0.4901961, 1,
1.38932, -0.4541073, 1.825886, 1, 0, 0.4862745, 1,
1.39094, 0.8654351, 0.237427, 1, 0, 0.4784314, 1,
1.394321, -0.2751568, -0.577211, 1, 0, 0.4745098, 1,
1.400715, 0.9779404, -0.2348675, 1, 0, 0.4666667, 1,
1.422936, -2.04448, 1.821588, 1, 0, 0.4627451, 1,
1.426296, 1.095951, 2.302634, 1, 0, 0.454902, 1,
1.439686, 0.3320584, -0.3925178, 1, 0, 0.4509804, 1,
1.45743, -0.07695149, 3.067962, 1, 0, 0.4431373, 1,
1.461463, -0.9872829, 2.196229, 1, 0, 0.4392157, 1,
1.474817, 0.7895577, 2.423713, 1, 0, 0.4313726, 1,
1.476578, 0.2893003, 0.6275877, 1, 0, 0.427451, 1,
1.480377, 1.197904, 1.229993, 1, 0, 0.4196078, 1,
1.480899, -2.339313, 2.203614, 1, 0, 0.4156863, 1,
1.481938, -1.684, 2.038894, 1, 0, 0.4078431, 1,
1.490878, 1.203582, 1.163311, 1, 0, 0.4039216, 1,
1.493199, 0.5125882, 3.028293, 1, 0, 0.3960784, 1,
1.507239, -0.3414965, 0.5605238, 1, 0, 0.3882353, 1,
1.507457, 0.3859282, 1.428384, 1, 0, 0.3843137, 1,
1.511322, 0.7665833, -1.184015, 1, 0, 0.3764706, 1,
1.51419, 0.6507431, 1.156792, 1, 0, 0.372549, 1,
1.517921, 0.4285409, 1.126972, 1, 0, 0.3647059, 1,
1.52183, -1.196618, 2.497675, 1, 0, 0.3607843, 1,
1.530402, -0.1368771, 0.7462094, 1, 0, 0.3529412, 1,
1.530841, 0.5220734, 0.2693774, 1, 0, 0.3490196, 1,
1.534329, -0.2252019, 2.319035, 1, 0, 0.3411765, 1,
1.538804, -0.01403593, 1.61612, 1, 0, 0.3372549, 1,
1.544628, 2.122141, 1.084362, 1, 0, 0.3294118, 1,
1.549837, 2.192439, 1.707207, 1, 0, 0.3254902, 1,
1.550683, -1.143315, 1.227005, 1, 0, 0.3176471, 1,
1.563283, -1.284139, 2.491388, 1, 0, 0.3137255, 1,
1.572251, -0.6114656, 2.613624, 1, 0, 0.3058824, 1,
1.57735, 1.779637, 0.01864913, 1, 0, 0.2980392, 1,
1.583547, -0.9266777, 1.472829, 1, 0, 0.2941177, 1,
1.584362, -0.6948225, 2.710688, 1, 0, 0.2862745, 1,
1.590964, 0.8252913, 2.037442, 1, 0, 0.282353, 1,
1.597241, 0.3799271, 1.688357, 1, 0, 0.2745098, 1,
1.60643, 0.4012829, 0.1092456, 1, 0, 0.2705882, 1,
1.607027, -1.68104, 3.807318, 1, 0, 0.2627451, 1,
1.612345, -0.4070408, 2.322337, 1, 0, 0.2588235, 1,
1.631867, -0.601217, 2.393306, 1, 0, 0.2509804, 1,
1.636635, 0.01070039, 1.343176, 1, 0, 0.2470588, 1,
1.648788, -0.4151022, 0.3672613, 1, 0, 0.2392157, 1,
1.650539, -1.833031, 2.502397, 1, 0, 0.2352941, 1,
1.682397, -1.909396, 2.983332, 1, 0, 0.227451, 1,
1.695744, 0.98076, 0.3948443, 1, 0, 0.2235294, 1,
1.708807, 1.31183, 1.021185, 1, 0, 0.2156863, 1,
1.738675, -1.270874, 2.346686, 1, 0, 0.2117647, 1,
1.789495, -1.017272, 3.190269, 1, 0, 0.2039216, 1,
1.798885, -1.163556, 1.059092, 1, 0, 0.1960784, 1,
1.813021, 0.01463374, 2.866602, 1, 0, 0.1921569, 1,
1.815787, 0.0709166, 0.7159808, 1, 0, 0.1843137, 1,
1.828464, 0.4186015, 1.516997, 1, 0, 0.1803922, 1,
1.837511, -0.8888919, 2.264354, 1, 0, 0.172549, 1,
1.838265, -1.225383, 2.484561, 1, 0, 0.1686275, 1,
1.838571, -0.2005271, 1.54108, 1, 0, 0.1607843, 1,
1.848077, 0.7163094, 1.169506, 1, 0, 0.1568628, 1,
1.867233, 0.9412921, 1.914276, 1, 0, 0.1490196, 1,
1.892769, -1.557195, 1.730304, 1, 0, 0.145098, 1,
1.895904, 0.02643581, -0.2477862, 1, 0, 0.1372549, 1,
1.924366, 0.206189, 0.7066411, 1, 0, 0.1333333, 1,
1.947468, 0.03338553, 1.710295, 1, 0, 0.1254902, 1,
1.956821, -1.302461, 1.677157, 1, 0, 0.1215686, 1,
2.028649, 1.453408, 1.637205, 1, 0, 0.1137255, 1,
2.122104, 0.9021414, 0.9035618, 1, 0, 0.1098039, 1,
2.122362, -0.9840488, 2.227359, 1, 0, 0.1019608, 1,
2.141605, 0.3528634, 1.709513, 1, 0, 0.09411765, 1,
2.145345, -0.2857592, 2.800107, 1, 0, 0.09019608, 1,
2.15317, 1.162802, 1.646492, 1, 0, 0.08235294, 1,
2.180392, -3.311643, 2.22947, 1, 0, 0.07843138, 1,
2.233804, 0.4032462, 1.22827, 1, 0, 0.07058824, 1,
2.241836, -2.116982, 2.332569, 1, 0, 0.06666667, 1,
2.267755, 0.01914651, 1.571959, 1, 0, 0.05882353, 1,
2.344592, 1.011891, 1.144313, 1, 0, 0.05490196, 1,
2.394974, 0.0712092, 1.896642, 1, 0, 0.04705882, 1,
2.555544, -1.392409, 1.179588, 1, 0, 0.04313726, 1,
2.569522, 0.7115535, 3.072722, 1, 0, 0.03529412, 1,
2.577873, 1.075327, 4.511096, 1, 0, 0.03137255, 1,
2.708364, -1.168446, 3.113928, 1, 0, 0.02352941, 1,
2.747557, -2.523808, 2.615893, 1, 0, 0.01960784, 1,
2.815721, 0.9497218, 1.636128, 1, 0, 0.01176471, 1,
2.824753, 2.11227, 2.840695, 1, 0, 0.007843138, 1
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
-0.3039819, -5.068451, -6.568217, 0, -0.5, 0.5, 0.5,
-0.3039819, -5.068451, -6.568217, 1, -0.5, 0.5, 0.5,
-0.3039819, -5.068451, -6.568217, 1, 1.5, 0.5, 0.5,
-0.3039819, -5.068451, -6.568217, 0, 1.5, 0.5, 0.5
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
-4.493358, -0.5269102, -6.568217, 0, -0.5, 0.5, 0.5,
-4.493358, -0.5269102, -6.568217, 1, -0.5, 0.5, 0.5,
-4.493358, -0.5269102, -6.568217, 1, 1.5, 0.5, 0.5,
-4.493358, -0.5269102, -6.568217, 0, 1.5, 0.5, 0.5
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
-4.493358, -5.068451, 0.1693435, 0, -0.5, 0.5, 0.5,
-4.493358, -5.068451, 0.1693435, 1, -0.5, 0.5, 0.5,
-4.493358, -5.068451, 0.1693435, 1, 1.5, 0.5, 0.5,
-4.493358, -5.068451, 0.1693435, 0, 1.5, 0.5, 0.5
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
-3, -4.020403, -5.013395,
2, -4.020403, -5.013395,
-3, -4.020403, -5.013395,
-3, -4.195078, -5.272532,
-2, -4.020403, -5.013395,
-2, -4.195078, -5.272532,
-1, -4.020403, -5.013395,
-1, -4.195078, -5.272532,
0, -4.020403, -5.013395,
0, -4.195078, -5.272532,
1, -4.020403, -5.013395,
1, -4.195078, -5.272532,
2, -4.020403, -5.013395,
2, -4.195078, -5.272532
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
-3, -4.544427, -5.790806, 0, -0.5, 0.5, 0.5,
-3, -4.544427, -5.790806, 1, -0.5, 0.5, 0.5,
-3, -4.544427, -5.790806, 1, 1.5, 0.5, 0.5,
-3, -4.544427, -5.790806, 0, 1.5, 0.5, 0.5,
-2, -4.544427, -5.790806, 0, -0.5, 0.5, 0.5,
-2, -4.544427, -5.790806, 1, -0.5, 0.5, 0.5,
-2, -4.544427, -5.790806, 1, 1.5, 0.5, 0.5,
-2, -4.544427, -5.790806, 0, 1.5, 0.5, 0.5,
-1, -4.544427, -5.790806, 0, -0.5, 0.5, 0.5,
-1, -4.544427, -5.790806, 1, -0.5, 0.5, 0.5,
-1, -4.544427, -5.790806, 1, 1.5, 0.5, 0.5,
-1, -4.544427, -5.790806, 0, 1.5, 0.5, 0.5,
0, -4.544427, -5.790806, 0, -0.5, 0.5, 0.5,
0, -4.544427, -5.790806, 1, -0.5, 0.5, 0.5,
0, -4.544427, -5.790806, 1, 1.5, 0.5, 0.5,
0, -4.544427, -5.790806, 0, 1.5, 0.5, 0.5,
1, -4.544427, -5.790806, 0, -0.5, 0.5, 0.5,
1, -4.544427, -5.790806, 1, -0.5, 0.5, 0.5,
1, -4.544427, -5.790806, 1, 1.5, 0.5, 0.5,
1, -4.544427, -5.790806, 0, 1.5, 0.5, 0.5,
2, -4.544427, -5.790806, 0, -0.5, 0.5, 0.5,
2, -4.544427, -5.790806, 1, -0.5, 0.5, 0.5,
2, -4.544427, -5.790806, 1, 1.5, 0.5, 0.5,
2, -4.544427, -5.790806, 0, 1.5, 0.5, 0.5
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
-3.526579, -3, -5.013395,
-3.526579, 2, -5.013395,
-3.526579, -3, -5.013395,
-3.687708, -3, -5.272532,
-3.526579, -2, -5.013395,
-3.687708, -2, -5.272532,
-3.526579, -1, -5.013395,
-3.687708, -1, -5.272532,
-3.526579, 0, -5.013395,
-3.687708, 0, -5.272532,
-3.526579, 1, -5.013395,
-3.687708, 1, -5.272532,
-3.526579, 2, -5.013395,
-3.687708, 2, -5.272532
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
-4.009968, -3, -5.790806, 0, -0.5, 0.5, 0.5,
-4.009968, -3, -5.790806, 1, -0.5, 0.5, 0.5,
-4.009968, -3, -5.790806, 1, 1.5, 0.5, 0.5,
-4.009968, -3, -5.790806, 0, 1.5, 0.5, 0.5,
-4.009968, -2, -5.790806, 0, -0.5, 0.5, 0.5,
-4.009968, -2, -5.790806, 1, -0.5, 0.5, 0.5,
-4.009968, -2, -5.790806, 1, 1.5, 0.5, 0.5,
-4.009968, -2, -5.790806, 0, 1.5, 0.5, 0.5,
-4.009968, -1, -5.790806, 0, -0.5, 0.5, 0.5,
-4.009968, -1, -5.790806, 1, -0.5, 0.5, 0.5,
-4.009968, -1, -5.790806, 1, 1.5, 0.5, 0.5,
-4.009968, -1, -5.790806, 0, 1.5, 0.5, 0.5,
-4.009968, 0, -5.790806, 0, -0.5, 0.5, 0.5,
-4.009968, 0, -5.790806, 1, -0.5, 0.5, 0.5,
-4.009968, 0, -5.790806, 1, 1.5, 0.5, 0.5,
-4.009968, 0, -5.790806, 0, 1.5, 0.5, 0.5,
-4.009968, 1, -5.790806, 0, -0.5, 0.5, 0.5,
-4.009968, 1, -5.790806, 1, -0.5, 0.5, 0.5,
-4.009968, 1, -5.790806, 1, 1.5, 0.5, 0.5,
-4.009968, 1, -5.790806, 0, 1.5, 0.5, 0.5,
-4.009968, 2, -5.790806, 0, -0.5, 0.5, 0.5,
-4.009968, 2, -5.790806, 1, -0.5, 0.5, 0.5,
-4.009968, 2, -5.790806, 1, 1.5, 0.5, 0.5,
-4.009968, 2, -5.790806, 0, 1.5, 0.5, 0.5
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
-3.526579, -4.020403, -4,
-3.526579, -4.020403, 4,
-3.526579, -4.020403, -4,
-3.687708, -4.195078, -4,
-3.526579, -4.020403, -2,
-3.687708, -4.195078, -2,
-3.526579, -4.020403, 0,
-3.687708, -4.195078, 0,
-3.526579, -4.020403, 2,
-3.687708, -4.195078, 2,
-3.526579, -4.020403, 4,
-3.687708, -4.195078, 4
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
-4.009968, -4.544427, -4, 0, -0.5, 0.5, 0.5,
-4.009968, -4.544427, -4, 1, -0.5, 0.5, 0.5,
-4.009968, -4.544427, -4, 1, 1.5, 0.5, 0.5,
-4.009968, -4.544427, -4, 0, 1.5, 0.5, 0.5,
-4.009968, -4.544427, -2, 0, -0.5, 0.5, 0.5,
-4.009968, -4.544427, -2, 1, -0.5, 0.5, 0.5,
-4.009968, -4.544427, -2, 1, 1.5, 0.5, 0.5,
-4.009968, -4.544427, -2, 0, 1.5, 0.5, 0.5,
-4.009968, -4.544427, 0, 0, -0.5, 0.5, 0.5,
-4.009968, -4.544427, 0, 1, -0.5, 0.5, 0.5,
-4.009968, -4.544427, 0, 1, 1.5, 0.5, 0.5,
-4.009968, -4.544427, 0, 0, 1.5, 0.5, 0.5,
-4.009968, -4.544427, 2, 0, -0.5, 0.5, 0.5,
-4.009968, -4.544427, 2, 1, -0.5, 0.5, 0.5,
-4.009968, -4.544427, 2, 1, 1.5, 0.5, 0.5,
-4.009968, -4.544427, 2, 0, 1.5, 0.5, 0.5,
-4.009968, -4.544427, 4, 0, -0.5, 0.5, 0.5,
-4.009968, -4.544427, 4, 1, -0.5, 0.5, 0.5,
-4.009968, -4.544427, 4, 1, 1.5, 0.5, 0.5,
-4.009968, -4.544427, 4, 0, 1.5, 0.5, 0.5
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
-3.526579, -4.020403, -5.013395,
-3.526579, 2.966583, -5.013395,
-3.526579, -4.020403, 5.352082,
-3.526579, 2.966583, 5.352082,
-3.526579, -4.020403, -5.013395,
-3.526579, -4.020403, 5.352082,
-3.526579, 2.966583, -5.013395,
-3.526579, 2.966583, 5.352082,
-3.526579, -4.020403, -5.013395,
2.918615, -4.020403, -5.013395,
-3.526579, -4.020403, 5.352082,
2.918615, -4.020403, 5.352082,
-3.526579, 2.966583, -5.013395,
2.918615, 2.966583, -5.013395,
-3.526579, 2.966583, 5.352082,
2.918615, 2.966583, 5.352082,
2.918615, -4.020403, -5.013395,
2.918615, 2.966583, -5.013395,
2.918615, -4.020403, 5.352082,
2.918615, 2.966583, 5.352082,
2.918615, -4.020403, -5.013395,
2.918615, -4.020403, 5.352082,
2.918615, 2.966583, -5.013395,
2.918615, 2.966583, 5.352082
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
var radius = 7.510008;
var distance = 33.41287;
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
mvMatrix.translate( 0.3039819, 0.5269102, -0.1693435 );
mvMatrix.scale( 1.259848, 1.162156, 0.7833665 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.41287);
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
isazofos<-read.table("isazofos.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-isazofos$V2
```

```
## Error in eval(expr, envir, enclos): object 'isazofos' not found
```

```r
y<-isazofos$V3
```

```
## Error in eval(expr, envir, enclos): object 'isazofos' not found
```

```r
z<-isazofos$V4
```

```
## Error in eval(expr, envir, enclos): object 'isazofos' not found
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
-3.432717, 2.023551, -1.129207, 0, 0, 1, 1, 1,
-3.170748, 0.3822323, 0.08582395, 1, 0, 0, 1, 1,
-3.065045, 0.138791, -0.7122529, 1, 0, 0, 1, 1,
-2.647636, -0.5333992, -1.691091, 1, 0, 0, 1, 1,
-2.612797, 1.689399, -1.514909, 1, 0, 0, 1, 1,
-2.593709, -0.8782724, -2.276589, 1, 0, 0, 1, 1,
-2.567463, 0.9489213, -2.587548, 0, 0, 0, 1, 1,
-2.559222, 0.1481329, -1.427561, 0, 0, 0, 1, 1,
-2.548324, 0.7555982, -1.002209, 0, 0, 0, 1, 1,
-2.496294, -0.3585949, -1.376718, 0, 0, 0, 1, 1,
-2.477058, 0.7264924, -2.37781, 0, 0, 0, 1, 1,
-2.395979, -0.6527873, -2.752056, 0, 0, 0, 1, 1,
-2.3732, -0.363173, -1.310622, 0, 0, 0, 1, 1,
-2.331116, -1.142145, -1.430903, 1, 1, 1, 1, 1,
-2.289455, 0.5075124, -0.7606961, 1, 1, 1, 1, 1,
-2.218549, -0.8137532, -1.472174, 1, 1, 1, 1, 1,
-2.214008, 0.6077156, -2.243089, 1, 1, 1, 1, 1,
-2.198029, 0.8828143, -0.362047, 1, 1, 1, 1, 1,
-2.189932, -0.7362089, -1.071713, 1, 1, 1, 1, 1,
-2.136215, 0.8293443, -0.2776055, 1, 1, 1, 1, 1,
-2.113754, -0.7498044, 0.2395951, 1, 1, 1, 1, 1,
-2.095836, 0.6821959, -1.393486, 1, 1, 1, 1, 1,
-2.08468, -0.3668142, -2.15446, 1, 1, 1, 1, 1,
-2.079026, -1.088235, -1.435984, 1, 1, 1, 1, 1,
-2.059285, 0.02647278, -0.1862003, 1, 1, 1, 1, 1,
-2.05112, -0.02212148, -1.199066, 1, 1, 1, 1, 1,
-1.984065, -0.3537634, -1.899628, 1, 1, 1, 1, 1,
-1.969336, -1.647114, -2.695336, 1, 1, 1, 1, 1,
-1.955624, -0.1859616, -0.8852172, 0, 0, 1, 1, 1,
-1.950243, -0.6391591, -2.804193, 1, 0, 0, 1, 1,
-1.9471, -0.6921146, -2.751, 1, 0, 0, 1, 1,
-1.936573, -0.5326039, -2.416405, 1, 0, 0, 1, 1,
-1.891052, 0.2732868, -1.797042, 1, 0, 0, 1, 1,
-1.877458, -1.342081, -2.475229, 1, 0, 0, 1, 1,
-1.859044, -1.60472, -2.42237, 0, 0, 0, 1, 1,
-1.838341, 0.4820476, -0.1352698, 0, 0, 0, 1, 1,
-1.835821, 0.536384, 0.6638569, 0, 0, 0, 1, 1,
-1.832868, -1.398778, -3.604289, 0, 0, 0, 1, 1,
-1.825687, -0.7354628, -2.056246, 0, 0, 0, 1, 1,
-1.808365, 0.9708837, 0.4611985, 0, 0, 0, 1, 1,
-1.78654, -1.227923, -0.202686, 0, 0, 0, 1, 1,
-1.772955, 1.391671, -1.28069, 1, 1, 1, 1, 1,
-1.759627, -0.3336523, -2.259545, 1, 1, 1, 1, 1,
-1.758676, -0.02821834, -1.630801, 1, 1, 1, 1, 1,
-1.753866, -0.9245483, -1.187251, 1, 1, 1, 1, 1,
-1.752901, -0.8361673, -1.644291, 1, 1, 1, 1, 1,
-1.738187, 0.2398015, -2.034372, 1, 1, 1, 1, 1,
-1.738164, 1.329278, -0.07041597, 1, 1, 1, 1, 1,
-1.733713, 1.924485, 1.326698, 1, 1, 1, 1, 1,
-1.706168, 0.7421535, -2.210778, 1, 1, 1, 1, 1,
-1.683089, -0.3401222, -0.9676322, 1, 1, 1, 1, 1,
-1.681862, -0.8626693, -2.805247, 1, 1, 1, 1, 1,
-1.660406, 2.214919, -1.695312, 1, 1, 1, 1, 1,
-1.660082, -0.06752045, -0.7485002, 1, 1, 1, 1, 1,
-1.656701, -0.5470203, -1.180702, 1, 1, 1, 1, 1,
-1.631923, 1.479257, -1.893212, 1, 1, 1, 1, 1,
-1.608268, 0.005450475, 0.3012009, 0, 0, 1, 1, 1,
-1.597797, -1.046352, -2.056842, 1, 0, 0, 1, 1,
-1.596749, -0.6258343, -1.372113, 1, 0, 0, 1, 1,
-1.594627, -0.6151841, -3.562517, 1, 0, 0, 1, 1,
-1.588182, 0.8615197, -0.2613036, 1, 0, 0, 1, 1,
-1.559811, 1.053905, -2.33238, 1, 0, 0, 1, 1,
-1.542003, -0.1971511, -1.102818, 0, 0, 0, 1, 1,
-1.537004, 0.2939979, 0.1069295, 0, 0, 0, 1, 1,
-1.534901, 1.660523, -1.27147, 0, 0, 0, 1, 1,
-1.528113, 1.080575, 0.3851391, 0, 0, 0, 1, 1,
-1.523974, -0.548034, -2.494346, 0, 0, 0, 1, 1,
-1.52201, 2.152147, -0.5974637, 0, 0, 0, 1, 1,
-1.521425, -1.677658, -1.778615, 0, 0, 0, 1, 1,
-1.506143, 2.266789, -0.8460177, 1, 1, 1, 1, 1,
-1.501343, 0.3401065, -2.949032, 1, 1, 1, 1, 1,
-1.496661, -0.03559752, -0.4023144, 1, 1, 1, 1, 1,
-1.487809, 0.3036559, -1.61304, 1, 1, 1, 1, 1,
-1.473782, -1.509129, -3.006868, 1, 1, 1, 1, 1,
-1.471535, -1.29568, -1.703978, 1, 1, 1, 1, 1,
-1.466262, -1.081589, -2.163657, 1, 1, 1, 1, 1,
-1.464547, -0.73491, -3.506768, 1, 1, 1, 1, 1,
-1.45755, -0.09011341, -2.403022, 1, 1, 1, 1, 1,
-1.451756, 1.279115, -3.077591, 1, 1, 1, 1, 1,
-1.445455, 1.186666, -1.386792, 1, 1, 1, 1, 1,
-1.437395, 0.5625153, -0.2540219, 1, 1, 1, 1, 1,
-1.436469, -1.840982, -1.218429, 1, 1, 1, 1, 1,
-1.43178, 0.568199, -1.472396, 1, 1, 1, 1, 1,
-1.421761, 0.06727504, -2.007992, 1, 1, 1, 1, 1,
-1.415, -0.4975427, -4.862442, 0, 0, 1, 1, 1,
-1.413528, -1.447952, -0.8535873, 1, 0, 0, 1, 1,
-1.409096, -0.6064454, -2.750028, 1, 0, 0, 1, 1,
-1.406253, -0.1816969, -1.64771, 1, 0, 0, 1, 1,
-1.398083, 0.1334113, -2.870563, 1, 0, 0, 1, 1,
-1.397809, 0.4997892, -1.47523, 1, 0, 0, 1, 1,
-1.385813, -0.8983741, -2.452921, 0, 0, 0, 1, 1,
-1.384367, -1.434736, -2.025302, 0, 0, 0, 1, 1,
-1.379074, -0.1526761, -2.332791, 0, 0, 0, 1, 1,
-1.37015, -0.4568669, -2.421725, 0, 0, 0, 1, 1,
-1.367223, 0.6635908, -2.367693, 0, 0, 0, 1, 1,
-1.35743, 0.2299583, -0.8897508, 0, 0, 0, 1, 1,
-1.353937, -1.979073, -0.6621518, 0, 0, 0, 1, 1,
-1.352103, -0.4248355, -2.15924, 1, 1, 1, 1, 1,
-1.345487, -0.4110269, -1.773305, 1, 1, 1, 1, 1,
-1.327434, -0.02838601, -2.180506, 1, 1, 1, 1, 1,
-1.315238, 0.6787761, -0.9745378, 1, 1, 1, 1, 1,
-1.311887, -1.311558, -2.021896, 1, 1, 1, 1, 1,
-1.310193, 0.3900596, -1.059475, 1, 1, 1, 1, 1,
-1.295747, -0.5732374, -2.236654, 1, 1, 1, 1, 1,
-1.291399, 0.07579876, -0.1720815, 1, 1, 1, 1, 1,
-1.281012, -0.3116949, -0.7208042, 1, 1, 1, 1, 1,
-1.279869, 0.3046093, -0.8871458, 1, 1, 1, 1, 1,
-1.275922, -0.5291197, -1.153375, 1, 1, 1, 1, 1,
-1.251277, 0.5019019, -0.9181449, 1, 1, 1, 1, 1,
-1.246571, 0.1777986, -2.276568, 1, 1, 1, 1, 1,
-1.24458, -1.959316, -2.306801, 1, 1, 1, 1, 1,
-1.244277, -0.4746487, -1.779251, 1, 1, 1, 1, 1,
-1.241681, -1.077832, -2.883383, 0, 0, 1, 1, 1,
-1.229608, 0.6264157, -1.595358, 1, 0, 0, 1, 1,
-1.221559, 0.48796, -0.2411708, 1, 0, 0, 1, 1,
-1.220828, 0.1665716, -1.043263, 1, 0, 0, 1, 1,
-1.216684, -1.925014, -1.813655, 1, 0, 0, 1, 1,
-1.20952, 0.726104, -1.808254, 1, 0, 0, 1, 1,
-1.203285, 0.6686049, 1.157348, 0, 0, 0, 1, 1,
-1.20064, -0.7603469, -1.852776, 0, 0, 0, 1, 1,
-1.19718, 0.3976671, -0.4906449, 0, 0, 0, 1, 1,
-1.192855, -0.07156971, -0.967792, 0, 0, 0, 1, 1,
-1.187888, -1.539559, -2.346083, 0, 0, 0, 1, 1,
-1.184407, 0.3008903, -1.837733, 0, 0, 0, 1, 1,
-1.175575, 0.3382354, -3.163262, 0, 0, 0, 1, 1,
-1.175011, -0.3673424, -2.549233, 1, 1, 1, 1, 1,
-1.171688, -0.2313501, -0.9326773, 1, 1, 1, 1, 1,
-1.154454, -0.3327621, -0.8318591, 1, 1, 1, 1, 1,
-1.15012, -2.39399, -2.327759, 1, 1, 1, 1, 1,
-1.145782, -2.534492, -3.918367, 1, 1, 1, 1, 1,
-1.136835, -0.77663, -2.873646, 1, 1, 1, 1, 1,
-1.1367, 0.1984784, -1.966925, 1, 1, 1, 1, 1,
-1.133253, -0.607384, -3.499142, 1, 1, 1, 1, 1,
-1.126864, 0.1151583, -2.641259, 1, 1, 1, 1, 1,
-1.121664, 0.01956329, -1.391441, 1, 1, 1, 1, 1,
-1.116241, 0.3477508, -0.3242135, 1, 1, 1, 1, 1,
-1.115882, -0.2461609, -0.779991, 1, 1, 1, 1, 1,
-1.115207, 0.6267807, -2.357968, 1, 1, 1, 1, 1,
-1.1082, -2.211343, -1.760575, 1, 1, 1, 1, 1,
-1.10754, 0.04153284, -2.440368, 1, 1, 1, 1, 1,
-1.107479, 0.2479206, -1.888724, 0, 0, 1, 1, 1,
-1.106032, 0.0552984, -1.212996, 1, 0, 0, 1, 1,
-1.102665, -0.5916035, 0.320359, 1, 0, 0, 1, 1,
-1.10245, 0.6652864, -2.430784, 1, 0, 0, 1, 1,
-1.10067, 0.8190204, -2.737886, 1, 0, 0, 1, 1,
-1.096161, 1.121371, -2.17793, 1, 0, 0, 1, 1,
-1.092916, 0.1185611, -1.229936, 0, 0, 0, 1, 1,
-1.092518, -0.6793578, -2.668635, 0, 0, 0, 1, 1,
-1.088596, 0.8732405, -1.164926, 0, 0, 0, 1, 1,
-1.088145, -1.605697, -4.844903, 0, 0, 0, 1, 1,
-1.077536, 0.6624574, -0.9413349, 0, 0, 0, 1, 1,
-1.067927, -0.776737, -2.172466, 0, 0, 0, 1, 1,
-1.06752, 1.273442, -1.384838, 0, 0, 0, 1, 1,
-1.067274, -0.4995978, -3.515661, 1, 1, 1, 1, 1,
-1.06645, 0.5689042, -1.945169, 1, 1, 1, 1, 1,
-1.063397, 0.09794529, -0.5356743, 1, 1, 1, 1, 1,
-1.061433, -0.4864478, -2.46776, 1, 1, 1, 1, 1,
-1.059411, 0.7929185, -0.7318571, 1, 1, 1, 1, 1,
-1.057409, 1.102728, -1.830459, 1, 1, 1, 1, 1,
-1.056111, 1.267406, -1.397598, 1, 1, 1, 1, 1,
-1.045971, 1.550926, -0.4242442, 1, 1, 1, 1, 1,
-1.03052, 1.047715, -0.509573, 1, 1, 1, 1, 1,
-1.029739, 0.03613473, -1.223279, 1, 1, 1, 1, 1,
-1.028018, 0.7699565, -2.334417, 1, 1, 1, 1, 1,
-1.027069, -1.48154, -2.191962, 1, 1, 1, 1, 1,
-1.023282, -0.08164697, -1.342592, 1, 1, 1, 1, 1,
-1.014416, 0.09858076, -1.667024, 1, 1, 1, 1, 1,
-1.013314, -1.116917, -1.302651, 1, 1, 1, 1, 1,
-1.009563, -0.2198116, -0.8130637, 0, 0, 1, 1, 1,
-1.005872, 0.9652784, -0.9083946, 1, 0, 0, 1, 1,
-1.002709, 0.4662111, -1.362606, 1, 0, 0, 1, 1,
-0.9974371, 0.4519016, -1.884362, 1, 0, 0, 1, 1,
-0.994878, -1.922719, -2.053562, 1, 0, 0, 1, 1,
-0.9945791, 0.04241135, -1.566251, 1, 0, 0, 1, 1,
-0.9854823, -0.7678707, -2.50103, 0, 0, 0, 1, 1,
-0.9600152, -1.893154, -1.956667, 0, 0, 0, 1, 1,
-0.9573833, 0.08459289, -0.2950764, 0, 0, 0, 1, 1,
-0.9553286, -0.9543352, -1.571309, 0, 0, 0, 1, 1,
-0.9551538, 0.4144077, 1.946578, 0, 0, 0, 1, 1,
-0.9524006, 2.095844, -1.763892, 0, 0, 0, 1, 1,
-0.9514103, -0.6315477, -1.727136, 0, 0, 0, 1, 1,
-0.9434324, 1.5149, 0.4752808, 1, 1, 1, 1, 1,
-0.9318431, -0.567498, -2.730949, 1, 1, 1, 1, 1,
-0.9316158, -0.732489, -3.229133, 1, 1, 1, 1, 1,
-0.9203727, -1.187772, -3.56275, 1, 1, 1, 1, 1,
-0.9195982, 0.5979605, -1.748031, 1, 1, 1, 1, 1,
-0.9195411, -0.06688996, -2.580298, 1, 1, 1, 1, 1,
-0.917723, 0.1156297, -0.7044989, 1, 1, 1, 1, 1,
-0.915332, 0.2615393, -3.037676, 1, 1, 1, 1, 1,
-0.9134107, 0.1819575, -0.2161803, 1, 1, 1, 1, 1,
-0.9045744, -0.01109345, -2.038647, 1, 1, 1, 1, 1,
-0.902418, 1.152013, 0.3253168, 1, 1, 1, 1, 1,
-0.9000683, -0.2869027, -2.392825, 1, 1, 1, 1, 1,
-0.897252, -1.535382, -2.497703, 1, 1, 1, 1, 1,
-0.8970225, -1.240765, -1.758904, 1, 1, 1, 1, 1,
-0.8949206, 1.021516, 0.8072053, 1, 1, 1, 1, 1,
-0.8884759, 0.004365671, 0.2052542, 0, 0, 1, 1, 1,
-0.8873647, 1.371784, -0.5142556, 1, 0, 0, 1, 1,
-0.8842961, 1.031484, -0.9805294, 1, 0, 0, 1, 1,
-0.8822023, 0.4044758, -0.5810622, 1, 0, 0, 1, 1,
-0.8797434, -1.290605, -2.110473, 1, 0, 0, 1, 1,
-0.875558, 0.6543949, 0.8804871, 1, 0, 0, 1, 1,
-0.8744956, -0.3942929, -2.416333, 0, 0, 0, 1, 1,
-0.8706143, 0.08086443, -1.912262, 0, 0, 0, 1, 1,
-0.8700802, -1.423995, -3.079224, 0, 0, 0, 1, 1,
-0.8680589, -0.792757, -2.548275, 0, 0, 0, 1, 1,
-0.8627386, -1.234705, -1.199303, 0, 0, 0, 1, 1,
-0.8564113, 0.5355417, -1.865399, 0, 0, 0, 1, 1,
-0.8545405, 0.27227, -1.487349, 0, 0, 0, 1, 1,
-0.8545105, -1.496963, -4.773731, 1, 1, 1, 1, 1,
-0.8413885, 1.540337, 0.03928517, 1, 1, 1, 1, 1,
-0.8374423, -0.7992896, -3.322424, 1, 1, 1, 1, 1,
-0.8289311, -0.6274171, -0.7429286, 1, 1, 1, 1, 1,
-0.8263046, 0.01048063, -0.3364868, 1, 1, 1, 1, 1,
-0.8249443, 0.7403611, -0.3914662, 1, 1, 1, 1, 1,
-0.8112656, -2.67631, -3.176266, 1, 1, 1, 1, 1,
-0.8081023, 0.2838664, -2.886512, 1, 1, 1, 1, 1,
-0.8078756, 0.04097439, -2.654017, 1, 1, 1, 1, 1,
-0.8023812, -1.18614, -2.812602, 1, 1, 1, 1, 1,
-0.7965606, 0.6092712, -0.9483112, 1, 1, 1, 1, 1,
-0.789398, -0.008885384, -0.7419195, 1, 1, 1, 1, 1,
-0.7855563, -0.6645921, -2.261775, 1, 1, 1, 1, 1,
-0.7852284, -1.202929, -2.692791, 1, 1, 1, 1, 1,
-0.783793, 0.3045099, -1.830846, 1, 1, 1, 1, 1,
-0.7829121, -0.5842642, -2.306761, 0, 0, 1, 1, 1,
-0.7789654, 0.363397, -1.432208, 1, 0, 0, 1, 1,
-0.7721661, 1.141222, 0.1658034, 1, 0, 0, 1, 1,
-0.7697369, 0.9366004, -1.376212, 1, 0, 0, 1, 1,
-0.7688636, -0.1210782, -1.97855, 1, 0, 0, 1, 1,
-0.7602292, -0.8437191, -0.4933197, 1, 0, 0, 1, 1,
-0.759159, -0.5336229, -1.556101, 0, 0, 0, 1, 1,
-0.7551583, -0.6513008, -3.997223, 0, 0, 0, 1, 1,
-0.7523015, 1.323615, -0.6774477, 0, 0, 0, 1, 1,
-0.7521886, -0.2938129, -2.444743, 0, 0, 0, 1, 1,
-0.7504433, 0.5061198, -0.65649, 0, 0, 0, 1, 1,
-0.7503686, -0.814967, -1.710197, 0, 0, 0, 1, 1,
-0.7367195, -1.902305, -2.30547, 0, 0, 0, 1, 1,
-0.7319961, 0.8514631, 1.211752, 1, 1, 1, 1, 1,
-0.7295172, 1.356718, -0.8620431, 1, 1, 1, 1, 1,
-0.7294112, 1.400433, -0.0540911, 1, 1, 1, 1, 1,
-0.7289981, -1.557831, -1.927711, 1, 1, 1, 1, 1,
-0.7279242, -0.7088991, -2.078139, 1, 1, 1, 1, 1,
-0.7268631, 0.5748073, -0.6943902, 1, 1, 1, 1, 1,
-0.7196949, -0.589147, -4.051949, 1, 1, 1, 1, 1,
-0.7180784, -0.4301263, 0.1310774, 1, 1, 1, 1, 1,
-0.7159711, -1.566856, -2.432618, 1, 1, 1, 1, 1,
-0.7157044, 0.5493631, -1.223263, 1, 1, 1, 1, 1,
-0.7151244, -0.6546973, -1.11387, 1, 1, 1, 1, 1,
-0.7059027, 0.105916, -1.640484, 1, 1, 1, 1, 1,
-0.704788, 0.00156148, -0.3923206, 1, 1, 1, 1, 1,
-0.7003362, -1.625826, -1.591228, 1, 1, 1, 1, 1,
-0.6931691, -1.372971, -2.285666, 1, 1, 1, 1, 1,
-0.6867096, -1.73802, -1.517415, 0, 0, 1, 1, 1,
-0.6846291, -0.5352244, -1.386061, 1, 0, 0, 1, 1,
-0.6784287, -0.4352114, -1.738756, 1, 0, 0, 1, 1,
-0.6772282, -0.3466123, -3.517711, 1, 0, 0, 1, 1,
-0.6764283, 2.043821, 0.1960093, 1, 0, 0, 1, 1,
-0.6760541, 1.686778, 0.1781169, 1, 0, 0, 1, 1,
-0.6723983, 2.280742, -0.9123459, 0, 0, 0, 1, 1,
-0.6702387, 0.2926639, -0.5035041, 0, 0, 0, 1, 1,
-0.6617522, -0.1493264, -2.353606, 0, 0, 0, 1, 1,
-0.6615317, 0.06214512, -1.133247, 0, 0, 0, 1, 1,
-0.6543918, -1.053389, -2.548435, 0, 0, 0, 1, 1,
-0.6534842, 0.272777, -0.9989854, 0, 0, 0, 1, 1,
-0.6456499, -0.02748046, -1.902189, 0, 0, 0, 1, 1,
-0.6439232, 1.957437, 1.094573, 1, 1, 1, 1, 1,
-0.6350951, -0.561734, -2.12267, 1, 1, 1, 1, 1,
-0.6345325, 1.919051, 0.1399811, 1, 1, 1, 1, 1,
-0.6186935, 0.2158297, -0.2491248, 1, 1, 1, 1, 1,
-0.6153899, -0.1655365, -2.036574, 1, 1, 1, 1, 1,
-0.6134062, -0.7933086, -4.02367, 1, 1, 1, 1, 1,
-0.6118657, 0.9792953, -0.28196, 1, 1, 1, 1, 1,
-0.6108593, 0.1217332, -1.64465, 1, 1, 1, 1, 1,
-0.6067992, -0.8735796, -1.835207, 1, 1, 1, 1, 1,
-0.6065236, 0.3776326, -0.8652936, 1, 1, 1, 1, 1,
-0.6017151, 0.03933882, -0.8714651, 1, 1, 1, 1, 1,
-0.5978271, -0.5963107, -0.7213739, 1, 1, 1, 1, 1,
-0.5955161, 0.01805442, -2.592245, 1, 1, 1, 1, 1,
-0.5917823, 1.004608, -1.62026, 1, 1, 1, 1, 1,
-0.5896831, 0.04206875, -1.714869, 1, 1, 1, 1, 1,
-0.5861379, -0.9488479, -1.615722, 0, 0, 1, 1, 1,
-0.5793002, -0.3544364, -1.24748, 1, 0, 0, 1, 1,
-0.5752743, 0.6061693, -0.4024869, 1, 0, 0, 1, 1,
-0.5715539, 0.1928484, -1.431154, 1, 0, 0, 1, 1,
-0.5682556, 1.038873, -0.08975689, 1, 0, 0, 1, 1,
-0.566272, -0.1193996, -3.003867, 1, 0, 0, 1, 1,
-0.5631937, 0.769675, -0.03425205, 0, 0, 0, 1, 1,
-0.5593506, -0.01308563, -0.4294448, 0, 0, 0, 1, 1,
-0.554628, -1.114888, -1.991832, 0, 0, 0, 1, 1,
-0.5507139, -1.138534, -3.352538, 0, 0, 0, 1, 1,
-0.5422356, -0.909623, -1.608649, 0, 0, 0, 1, 1,
-0.5419078, -0.2004866, -0.7165733, 0, 0, 0, 1, 1,
-0.5342995, 0.8341687, -0.8624711, 0, 0, 0, 1, 1,
-0.5323052, -1.129906, -3.496634, 1, 1, 1, 1, 1,
-0.531576, 1.525475, -1.431981, 1, 1, 1, 1, 1,
-0.5307695, -0.4443508, -2.250686, 1, 1, 1, 1, 1,
-0.5284125, -1.003718, -2.051575, 1, 1, 1, 1, 1,
-0.5252378, -0.7111752, -1.126881, 1, 1, 1, 1, 1,
-0.5217995, -0.8908504, -2.110315, 1, 1, 1, 1, 1,
-0.5203705, 1.623887, -1.307212, 1, 1, 1, 1, 1,
-0.5146504, -0.5569313, -1.746209, 1, 1, 1, 1, 1,
-0.5123739, 1.11402, 0.995047, 1, 1, 1, 1, 1,
-0.5109336, 0.02039424, -2.775784, 1, 1, 1, 1, 1,
-0.5055378, -0.5494592, -1.77266, 1, 1, 1, 1, 1,
-0.504406, -1.065771, -1.968922, 1, 1, 1, 1, 1,
-0.4985211, 1.791244, -0.6394596, 1, 1, 1, 1, 1,
-0.4950563, -0.4466095, -0.4411217, 1, 1, 1, 1, 1,
-0.4938646, 0.184985, -1.786464, 1, 1, 1, 1, 1,
-0.4920829, -1.876524, -2.385745, 0, 0, 1, 1, 1,
-0.4900425, 0.4185496, -0.4717582, 1, 0, 0, 1, 1,
-0.48826, -1.090214, -2.393118, 1, 0, 0, 1, 1,
-0.4827221, 0.7700332, 0.6566914, 1, 0, 0, 1, 1,
-0.48126, -1.623193, -3.179871, 1, 0, 0, 1, 1,
-0.4798468, -0.04306705, -3.067512, 1, 0, 0, 1, 1,
-0.4697417, 0.7606748, -0.9401205, 0, 0, 0, 1, 1,
-0.4675032, 0.8758609, -0.7277696, 0, 0, 0, 1, 1,
-0.4626552, 1.396239, -1.223328, 0, 0, 0, 1, 1,
-0.4618759, -0.615477, -4.259724, 0, 0, 0, 1, 1,
-0.4483102, 1.28604, -2.073487, 0, 0, 0, 1, 1,
-0.4465308, 0.7734929, 0.3706905, 0, 0, 0, 1, 1,
-0.4441589, -0.9461485, -2.05756, 0, 0, 0, 1, 1,
-0.4386347, 1.620543, -1.125665, 1, 1, 1, 1, 1,
-0.4302348, -0.4403679, -2.272286, 1, 1, 1, 1, 1,
-0.4232581, -0.4652489, -2.390613, 1, 1, 1, 1, 1,
-0.421262, 0.3075371, -0.9052972, 1, 1, 1, 1, 1,
-0.4197693, -0.8967009, -1.993459, 1, 1, 1, 1, 1,
-0.4147318, 0.5413527, -0.5012565, 1, 1, 1, 1, 1,
-0.4118438, -0.1697632, -0.509328, 1, 1, 1, 1, 1,
-0.4115627, 1.170298, -1.453261, 1, 1, 1, 1, 1,
-0.4108227, -1.412437, -2.605091, 1, 1, 1, 1, 1,
-0.4045884, -0.2443094, -1.710943, 1, 1, 1, 1, 1,
-0.4037628, 0.08080967, -2.222882, 1, 1, 1, 1, 1,
-0.4028805, 0.9104483, -0.969969, 1, 1, 1, 1, 1,
-0.4012646, 1.169991, 1.099486, 1, 1, 1, 1, 1,
-0.3998979, 0.4782912, -2.755896, 1, 1, 1, 1, 1,
-0.3986864, 0.6065385, -0.774745, 1, 1, 1, 1, 1,
-0.395877, 1.363634, -0.6846308, 0, 0, 1, 1, 1,
-0.388234, -2.060193, -3.596188, 1, 0, 0, 1, 1,
-0.3871484, 0.2077157, -1.573958, 1, 0, 0, 1, 1,
-0.3859734, 0.3402434, -0.2654494, 1, 0, 0, 1, 1,
-0.3847961, -0.4334767, -2.794068, 1, 0, 0, 1, 1,
-0.3719981, 0.0756685, -0.4632578, 1, 0, 0, 1, 1,
-0.3696241, -0.1914697, -2.270243, 0, 0, 0, 1, 1,
-0.3679722, 1.353754, -0.9214269, 0, 0, 0, 1, 1,
-0.3673683, -0.6624626, -0.6773776, 0, 0, 0, 1, 1,
-0.3615446, -0.2428938, -3.823969, 0, 0, 0, 1, 1,
-0.3572941, -0.1714436, -0.9623905, 0, 0, 0, 1, 1,
-0.3572524, -0.003960311, -2.144341, 0, 0, 0, 1, 1,
-0.3550991, 1.003298, -0.9433724, 0, 0, 0, 1, 1,
-0.3548896, -1.875721, -2.331204, 1, 1, 1, 1, 1,
-0.3534777, -1.101401, -2.997459, 1, 1, 1, 1, 1,
-0.3474363, 0.03274892, -1.478431, 1, 1, 1, 1, 1,
-0.3445095, -0.02685129, -1.490076, 1, 1, 1, 1, 1,
-0.3435729, 0.9013366, 0.3961782, 1, 1, 1, 1, 1,
-0.3425607, -1.038144, -3.649821, 1, 1, 1, 1, 1,
-0.3416666, 1.117699, 0.01641086, 1, 1, 1, 1, 1,
-0.3411211, 0.4984535, -1.479585, 1, 1, 1, 1, 1,
-0.3380252, 1.417923, -0.3400568, 1, 1, 1, 1, 1,
-0.3350882, 0.6517752, -0.1971866, 1, 1, 1, 1, 1,
-0.3340661, -0.1659873, -2.301727, 1, 1, 1, 1, 1,
-0.3336562, 0.6139534, 0.3075814, 1, 1, 1, 1, 1,
-0.3295271, 1.63931, -0.1971592, 1, 1, 1, 1, 1,
-0.3260755, -2.043306, -3.448394, 1, 1, 1, 1, 1,
-0.3236737, 0.9303246, -0.1499743, 1, 1, 1, 1, 1,
-0.3199937, -0.1045414, -1.14192, 0, 0, 1, 1, 1,
-0.3111503, -0.2271753, -3.779289, 1, 0, 0, 1, 1,
-0.3099595, 0.322909, -0.2093968, 1, 0, 0, 1, 1,
-0.3090056, 0.5485461, 0.4685754, 1, 0, 0, 1, 1,
-0.3011604, -0.6630972, -3.166343, 1, 0, 0, 1, 1,
-0.2907009, -0.01210579, -1.833856, 1, 0, 0, 1, 1,
-0.2837983, 1.641666, -1.423988, 0, 0, 0, 1, 1,
-0.2830695, 0.9052025, 0.4465602, 0, 0, 0, 1, 1,
-0.2803304, 0.1162225, -2.016081, 0, 0, 0, 1, 1,
-0.278982, -1.336903, -3.105551, 0, 0, 0, 1, 1,
-0.2789212, 0.269422, -2.777501, 0, 0, 0, 1, 1,
-0.2778272, 1.166512, -0.6324331, 0, 0, 0, 1, 1,
-0.2771812, 0.08734062, -2.077651, 0, 0, 0, 1, 1,
-0.274066, -2.312425, -3.389029, 1, 1, 1, 1, 1,
-0.273903, 0.8669007, -2.051456, 1, 1, 1, 1, 1,
-0.2735693, 0.1114563, -1.435641, 1, 1, 1, 1, 1,
-0.2720803, 1.567559, -0.8172579, 1, 1, 1, 1, 1,
-0.2656731, 0.155641, -0.3684045, 1, 1, 1, 1, 1,
-0.2604532, 0.1347861, -2.531331, 1, 1, 1, 1, 1,
-0.2604187, 1.676824, 1.569823, 1, 1, 1, 1, 1,
-0.252504, -0.4979213, -3.581516, 1, 1, 1, 1, 1,
-0.2506299, 1.229447, -0.01836593, 1, 1, 1, 1, 1,
-0.238315, -0.4668433, -3.097103, 1, 1, 1, 1, 1,
-0.235352, -0.4583091, -4.095186, 1, 1, 1, 1, 1,
-0.2269702, 0.7735782, -0.1136516, 1, 1, 1, 1, 1,
-0.2250144, -1.32718, -1.165402, 1, 1, 1, 1, 1,
-0.2216728, -0.5161125, -2.867209, 1, 1, 1, 1, 1,
-0.2203718, -0.3275379, -2.556736, 1, 1, 1, 1, 1,
-0.2131648, 0.09131093, -2.555107, 0, 0, 1, 1, 1,
-0.2099668, -0.8282343, -1.830392, 1, 0, 0, 1, 1,
-0.2084419, -0.009374491, -0.1262435, 1, 0, 0, 1, 1,
-0.2060501, -2.148193, -4.084785, 1, 0, 0, 1, 1,
-0.2055701, 0.9973239, 1.294849, 1, 0, 0, 1, 1,
-0.204889, 0.8565316, -0.1928248, 1, 0, 0, 1, 1,
-0.2034279, 0.1095045, -0.7638169, 0, 0, 0, 1, 1,
-0.2006786, 0.1829934, -1.21137, 0, 0, 0, 1, 1,
-0.1975145, -1.576247, -0.4360113, 0, 0, 0, 1, 1,
-0.1969992, -0.7026796, -4.309514, 0, 0, 0, 1, 1,
-0.1969744, 0.182862, -0.2247753, 0, 0, 0, 1, 1,
-0.194315, 1.789365, -0.1870388, 0, 0, 0, 1, 1,
-0.1908281, 0.161533, 0.05177759, 0, 0, 0, 1, 1,
-0.1905822, -0.914481, -2.496594, 1, 1, 1, 1, 1,
-0.1892954, 0.3488329, -1.462723, 1, 1, 1, 1, 1,
-0.1881972, 1.787214, 0.6161851, 1, 1, 1, 1, 1,
-0.1875485, -0.5552371, -4.539357, 1, 1, 1, 1, 1,
-0.1866264, 1.141481, 0.3704768, 1, 1, 1, 1, 1,
-0.1847904, 0.4537502, -1.27619, 1, 1, 1, 1, 1,
-0.1841083, 1.266565, 2.133458, 1, 1, 1, 1, 1,
-0.1823974, 0.5219725, 0.2013395, 1, 1, 1, 1, 1,
-0.1813412, -1.156387, -2.804804, 1, 1, 1, 1, 1,
-0.1759885, -0.579955, -2.851718, 1, 1, 1, 1, 1,
-0.1718999, -0.6533396, -2.565144, 1, 1, 1, 1, 1,
-0.1640292, -0.6304789, -1.633989, 1, 1, 1, 1, 1,
-0.1639212, 0.8249813, 0.2144812, 1, 1, 1, 1, 1,
-0.163885, -0.4250148, -1.779777, 1, 1, 1, 1, 1,
-0.1582893, 1.061262, -0.6318156, 1, 1, 1, 1, 1,
-0.1508284, 0.3548483, -0.504795, 0, 0, 1, 1, 1,
-0.1503189, -0.06317098, -1.587542, 1, 0, 0, 1, 1,
-0.1458695, 2.282257, -0.550232, 1, 0, 0, 1, 1,
-0.1442006, 0.4116698, 0.09701937, 1, 0, 0, 1, 1,
-0.1441996, -0.4926568, -2.523201, 1, 0, 0, 1, 1,
-0.1422042, 0.1090216, -1.641836, 1, 0, 0, 1, 1,
-0.1410208, 0.2425144, -0.2100021, 0, 0, 0, 1, 1,
-0.1397998, 0.4787391, 0.2279876, 0, 0, 0, 1, 1,
-0.1297611, 1.260677, 0.9712955, 0, 0, 0, 1, 1,
-0.1288201, 0.5796592, -0.3653556, 0, 0, 0, 1, 1,
-0.1267226, -1.329012, -2.514348, 0, 0, 0, 1, 1,
-0.117366, 1.764706, 0.1897968, 0, 0, 0, 1, 1,
-0.1120834, -0.08031146, 0.1499159, 0, 0, 0, 1, 1,
-0.112054, -0.4376862, -3.324306, 1, 1, 1, 1, 1,
-0.1085682, -0.3701217, -3.179033, 1, 1, 1, 1, 1,
-0.1055082, 0.07427739, -0.3983113, 1, 1, 1, 1, 1,
-0.1050878, 0.7678403, -0.2932553, 1, 1, 1, 1, 1,
-0.1037135, 2.057682, -0.5239374, 1, 1, 1, 1, 1,
-0.1034562, 1.220311, 1.192048, 1, 1, 1, 1, 1,
-0.1017273, 0.6662338, 0.6398995, 1, 1, 1, 1, 1,
-0.09403098, 1.21766, -0.2237041, 1, 1, 1, 1, 1,
-0.09102099, 0.699187, 0.3574525, 1, 1, 1, 1, 1,
-0.09048046, 0.05764395, -2.731014, 1, 1, 1, 1, 1,
-0.09007037, 1.661209, 0.03524439, 1, 1, 1, 1, 1,
-0.08966681, -1.186929, -2.650566, 1, 1, 1, 1, 1,
-0.08470644, -0.7401422, -4.488986, 1, 1, 1, 1, 1,
-0.08370315, -0.3120579, -2.95353, 1, 1, 1, 1, 1,
-0.08195616, 0.5864989, -0.343203, 1, 1, 1, 1, 1,
-0.07774394, -0.9716586, -2.62091, 0, 0, 1, 1, 1,
-0.07685736, -0.4823232, -1.845947, 1, 0, 0, 1, 1,
-0.07099693, 0.4033211, 1.120665, 1, 0, 0, 1, 1,
-0.06996441, 0.3295756, 0.09079266, 1, 0, 0, 1, 1,
-0.06695548, -1.022758, -2.407303, 1, 0, 0, 1, 1,
-0.06565012, -1.220041, -4.064546, 1, 0, 0, 1, 1,
-0.06040427, 0.3105888, -0.5112635, 0, 0, 0, 1, 1,
-0.04997246, -1.522473, -4.521764, 0, 0, 0, 1, 1,
-0.04323235, 0.54242, -0.3869746, 0, 0, 0, 1, 1,
-0.04223346, 0.5858926, -1.983658, 0, 0, 0, 1, 1,
-0.03693423, 0.09961157, -0.1836261, 0, 0, 0, 1, 1,
-0.03616227, 1.79965, -0.08024748, 0, 0, 0, 1, 1,
-0.03335588, 0.02799343, 0.5299701, 0, 0, 0, 1, 1,
-0.03267751, 0.8195806, -0.9415227, 1, 1, 1, 1, 1,
-0.03087755, 0.05488553, -0.2937768, 1, 1, 1, 1, 1,
-0.02776845, 0.074993, 0.5973908, 1, 1, 1, 1, 1,
-0.023511, 0.1111111, -1.055547, 1, 1, 1, 1, 1,
-0.01992766, -0.3692975, -4.077373, 1, 1, 1, 1, 1,
-0.01694391, -0.5523958, -4.249036, 1, 1, 1, 1, 1,
-0.0166323, 0.7365311, -0.06510653, 1, 1, 1, 1, 1,
-0.0152504, -0.7304741, -3.722, 1, 1, 1, 1, 1,
-0.01081079, -1.659835, -2.992594, 1, 1, 1, 1, 1,
-0.01001461, -0.2156511, -2.83324, 1, 1, 1, 1, 1,
-0.008077583, 1.398973, -1.011285, 1, 1, 1, 1, 1,
-0.005983257, -0.5308934, -2.28396, 1, 1, 1, 1, 1,
0.004799965, -0.2043784, 3.642233, 1, 1, 1, 1, 1,
0.006107117, -0.211304, 1.912473, 1, 1, 1, 1, 1,
0.01307709, -1.1747, 3.866844, 1, 1, 1, 1, 1,
0.01896264, -1.169687, 1.775049, 0, 0, 1, 1, 1,
0.01927423, -0.3071491, 3.863088, 1, 0, 0, 1, 1,
0.01997585, 0.5355823, -0.2510526, 1, 0, 0, 1, 1,
0.02123005, 0.4244609, 0.5811031, 1, 0, 0, 1, 1,
0.0222439, 0.9939527, 0.007020713, 1, 0, 0, 1, 1,
0.02374581, -1.159341, 1.656786, 1, 0, 0, 1, 1,
0.02376724, -0.1348445, 3.4078, 0, 0, 0, 1, 1,
0.02479699, -1.005602, 4.074942, 0, 0, 0, 1, 1,
0.02637743, 0.3034456, 0.5652761, 0, 0, 0, 1, 1,
0.02644298, 0.443581, 1.845493, 0, 0, 0, 1, 1,
0.02663596, -0.7653461, 3.648718, 0, 0, 0, 1, 1,
0.02823737, -0.8385073, 2.974734, 0, 0, 0, 1, 1,
0.03145873, -2.141121, 4.271701, 0, 0, 0, 1, 1,
0.03219988, 1.773231, 0.2840827, 1, 1, 1, 1, 1,
0.03438703, -0.0384318, 2.984173, 1, 1, 1, 1, 1,
0.03587154, 0.5772075, -1.210961, 1, 1, 1, 1, 1,
0.03708503, -0.9059023, 5.201128, 1, 1, 1, 1, 1,
0.04054117, 0.001902731, -0.5472388, 1, 1, 1, 1, 1,
0.0417608, 1.348902, -0.1660372, 1, 1, 1, 1, 1,
0.04230652, 0.6290962, -0.197055, 1, 1, 1, 1, 1,
0.04881804, -0.1313404, 3.237285, 1, 1, 1, 1, 1,
0.05073258, -1.144019, 0.7230001, 1, 1, 1, 1, 1,
0.05119495, 0.2651927, 0.305486, 1, 1, 1, 1, 1,
0.05294099, 1.084658, 1.414944, 1, 1, 1, 1, 1,
0.05854595, -1.05561, 2.110137, 1, 1, 1, 1, 1,
0.05944638, -0.7469351, 4.194643, 1, 1, 1, 1, 1,
0.06311902, -0.5573899, 2.628298, 1, 1, 1, 1, 1,
0.06519912, 0.9409389, -0.135626, 1, 1, 1, 1, 1,
0.06630816, 0.07051862, -0.8945269, 0, 0, 1, 1, 1,
0.06652854, -1.404005, 2.614993, 1, 0, 0, 1, 1,
0.06687243, 1.615708, 0.2082017, 1, 0, 0, 1, 1,
0.06786477, 1.045808, 0.1893719, 1, 0, 0, 1, 1,
0.06958498, 1.711648, -0.9180503, 1, 0, 0, 1, 1,
0.07176345, -0.275449, 3.243467, 1, 0, 0, 1, 1,
0.07361395, 0.525588, 0.1759099, 0, 0, 0, 1, 1,
0.07400773, 0.002131814, -0.528681, 0, 0, 0, 1, 1,
0.07601271, -0.6595094, 1.995936, 0, 0, 0, 1, 1,
0.08135022, -2.340469, 3.034326, 0, 0, 0, 1, 1,
0.08514688, 1.901591, 1.645038, 0, 0, 0, 1, 1,
0.08811446, 0.95627, 0.7068333, 0, 0, 0, 1, 1,
0.09572345, -1.239138, 3.218734, 0, 0, 0, 1, 1,
0.09764207, 0.4675887, -0.3984466, 1, 1, 1, 1, 1,
0.09775816, -0.2813234, 3.991367, 1, 1, 1, 1, 1,
0.09859052, -0.2611465, 3.519095, 1, 1, 1, 1, 1,
0.1028547, -0.6556347, 3.529946, 1, 1, 1, 1, 1,
0.1058875, 0.4119003, -0.5495251, 1, 1, 1, 1, 1,
0.1086317, 0.7551905, -0.8340836, 1, 1, 1, 1, 1,
0.1095333, 0.3811852, 0.7576447, 1, 1, 1, 1, 1,
0.1101461, -0.9381821, 4.373963, 1, 1, 1, 1, 1,
0.111575, -2.053527, 3.456933, 1, 1, 1, 1, 1,
0.1133714, -1.814992, 1.661212, 1, 1, 1, 1, 1,
0.1145811, -1.309978, 2.908052, 1, 1, 1, 1, 1,
0.1154826, -0.8089431, 3.445868, 1, 1, 1, 1, 1,
0.1180722, 0.1207657, 1.123895, 1, 1, 1, 1, 1,
0.1237872, -1.766795, 2.029749, 1, 1, 1, 1, 1,
0.1260131, 0.2903267, 0.7920533, 1, 1, 1, 1, 1,
0.1304757, 0.2960421, -0.6657692, 0, 0, 1, 1, 1,
0.1320484, 0.2730075, -0.7018554, 1, 0, 0, 1, 1,
0.1345667, -0.9633096, 3.910313, 1, 0, 0, 1, 1,
0.1387701, -0.2130039, 1.140774, 1, 0, 0, 1, 1,
0.1416917, 0.6006386, 0.3166722, 1, 0, 0, 1, 1,
0.1425641, 0.9430919, -2.679585, 1, 0, 0, 1, 1,
0.14797, 0.5413567, 0.596587, 0, 0, 0, 1, 1,
0.1497104, 0.8504913, -0.5340981, 0, 0, 0, 1, 1,
0.1499455, -0.7387375, 3.704322, 0, 0, 0, 1, 1,
0.1509262, 1.105988, -0.7744057, 0, 0, 0, 1, 1,
0.1567203, 0.5130765, 1.258035, 0, 0, 0, 1, 1,
0.1574852, -0.9168631, 2.071887, 0, 0, 0, 1, 1,
0.1588242, 1.049094, 0.7264088, 0, 0, 0, 1, 1,
0.1593745, -0.8129587, 1.397889, 1, 1, 1, 1, 1,
0.1612554, 1.890585, 0.4213628, 1, 1, 1, 1, 1,
0.1642877, -0.2786355, 1.40939, 1, 1, 1, 1, 1,
0.1649523, -0.5599414, 2.729902, 1, 1, 1, 1, 1,
0.167028, 0.3052749, 0.4933741, 1, 1, 1, 1, 1,
0.1672684, 0.01678752, -0.01090038, 1, 1, 1, 1, 1,
0.1732956, 1.218412, 0.375783, 1, 1, 1, 1, 1,
0.1746465, 0.25817, 0.4225596, 1, 1, 1, 1, 1,
0.1752771, 1.257332, -1.17409, 1, 1, 1, 1, 1,
0.1770196, -1.701649, 1.961783, 1, 1, 1, 1, 1,
0.1794712, -1.093625, 2.351563, 1, 1, 1, 1, 1,
0.1810107, 1.113566, 1.313027, 1, 1, 1, 1, 1,
0.1824599, 0.2286479, 1.529181, 1, 1, 1, 1, 1,
0.1825354, -0.6656913, 2.245094, 1, 1, 1, 1, 1,
0.1873536, -0.7339659, 3.053554, 1, 1, 1, 1, 1,
0.1898351, -1.516601, 0.8128815, 0, 0, 1, 1, 1,
0.1915455, 1.73764, 0.1145092, 1, 0, 0, 1, 1,
0.1935692, 0.5779561, 1.049286, 1, 0, 0, 1, 1,
0.1995016, 0.01132165, 2.045435, 1, 0, 0, 1, 1,
0.200978, 0.2028103, 0.5031522, 1, 0, 0, 1, 1,
0.2018404, -0.9042043, 3.884573, 1, 0, 0, 1, 1,
0.2072882, 0.6461574, 1.767672, 0, 0, 0, 1, 1,
0.2131005, -1.289368, 4.17016, 0, 0, 0, 1, 1,
0.2134545, 1.343105, 1.212962, 0, 0, 0, 1, 1,
0.215103, 1.209614, 2.646944, 0, 0, 0, 1, 1,
0.2188637, 0.05554158, 0.1463179, 0, 0, 0, 1, 1,
0.2207457, 0.6453039, -0.4436156, 0, 0, 0, 1, 1,
0.2208493, 0.2012085, 0.4778751, 0, 0, 0, 1, 1,
0.2232814, -1.799298, 1.955271, 1, 1, 1, 1, 1,
0.2266808, -0.4439346, 3.848288, 1, 1, 1, 1, 1,
0.2311035, -0.5739472, 3.571234, 1, 1, 1, 1, 1,
0.2318511, 0.4860926, 0.1516793, 1, 1, 1, 1, 1,
0.2331773, -0.7538511, 4.517108, 1, 1, 1, 1, 1,
0.2347805, 0.6813022, -0.5583387, 1, 1, 1, 1, 1,
0.2352802, -1.204687, 2.625082, 1, 1, 1, 1, 1,
0.2375425, 2.134439, 0.0529062, 1, 1, 1, 1, 1,
0.2378699, 0.0538179, 3.309864, 1, 1, 1, 1, 1,
0.2381476, -1.058836, 3.416372, 1, 1, 1, 1, 1,
0.2389743, 0.9704258, 0.2079283, 1, 1, 1, 1, 1,
0.2431811, 0.8046416, -0.2005844, 1, 1, 1, 1, 1,
0.2436886, 0.3267674, 0.2450701, 1, 1, 1, 1, 1,
0.2471404, -0.4786628, 1.424078, 1, 1, 1, 1, 1,
0.2496087, 0.9845287, -0.1504419, 1, 1, 1, 1, 1,
0.2497376, -0.9307413, 3.235056, 0, 0, 1, 1, 1,
0.2526266, 1.200219, -1.159309, 1, 0, 0, 1, 1,
0.2551509, -0.3071539, 0.120538, 1, 0, 0, 1, 1,
0.2573897, 0.7600702, -0.8551114, 1, 0, 0, 1, 1,
0.2690024, -0.3223875, 0.7627422, 1, 0, 0, 1, 1,
0.2706794, 1.04347, 1.141016, 1, 0, 0, 1, 1,
0.2715662, -0.08191164, 3.061183, 0, 0, 0, 1, 1,
0.2737124, -3.918651, 3.159346, 0, 0, 0, 1, 1,
0.276293, -0.9027506, 0.9669003, 0, 0, 0, 1, 1,
0.2763806, 0.3329693, 1.155916, 0, 0, 0, 1, 1,
0.2785374, 0.6256404, 1.256881, 0, 0, 0, 1, 1,
0.2800609, -0.4461488, 1.084304, 0, 0, 0, 1, 1,
0.2843055, -0.3901997, 1.67554, 0, 0, 0, 1, 1,
0.2863443, -0.5345908, 1.272357, 1, 1, 1, 1, 1,
0.2919564, -0.0149999, 0.4645946, 1, 1, 1, 1, 1,
0.2945307, -0.6065403, 2.908546, 1, 1, 1, 1, 1,
0.2950846, 0.2197323, 0.2461824, 1, 1, 1, 1, 1,
0.2968871, 0.08283729, 2.147893, 1, 1, 1, 1, 1,
0.2976016, 0.5428035, 1.231991, 1, 1, 1, 1, 1,
0.2978743, -0.2298763, 0.9041738, 1, 1, 1, 1, 1,
0.2991835, -0.2327795, 1.392595, 1, 1, 1, 1, 1,
0.2999527, 0.7930419, 2.697169, 1, 1, 1, 1, 1,
0.3015103, -0.6760921, 2.256679, 1, 1, 1, 1, 1,
0.3022093, -0.2390911, -0.04242841, 1, 1, 1, 1, 1,
0.3025158, 0.5332258, 1.989324, 1, 1, 1, 1, 1,
0.302986, -0.3335803, -0.2145526, 1, 1, 1, 1, 1,
0.3140668, -0.04314889, 1.980375, 1, 1, 1, 1, 1,
0.3173755, -0.04709811, 0.2757077, 1, 1, 1, 1, 1,
0.3222631, -0.2746426, 3.822541, 0, 0, 1, 1, 1,
0.3223865, -1.73707, 3.527656, 1, 0, 0, 1, 1,
0.3252282, -1.801699, 0.3448813, 1, 0, 0, 1, 1,
0.3277518, 0.04604195, 0.6701905, 1, 0, 0, 1, 1,
0.3298158, -1.772783, 1.272512, 1, 0, 0, 1, 1,
0.3304643, 1.245318, 0.06855949, 1, 0, 0, 1, 1,
0.3318698, -0.04490541, 2.278314, 0, 0, 0, 1, 1,
0.3363436, -1.024052, 3.780012, 0, 0, 0, 1, 1,
0.3370133, -0.04763643, 2.438132, 0, 0, 0, 1, 1,
0.3430581, -0.5727451, 4.295329, 0, 0, 0, 1, 1,
0.3438871, 0.3088089, 1.165986, 0, 0, 0, 1, 1,
0.3463764, 0.5543838, 1.406217, 0, 0, 0, 1, 1,
0.3467045, -0.8396572, 2.831747, 0, 0, 0, 1, 1,
0.3480518, 0.62794, 1.417554, 1, 1, 1, 1, 1,
0.3551044, -0.3666008, 1.940297, 1, 1, 1, 1, 1,
0.3569959, -1.583735, 3.547723, 1, 1, 1, 1, 1,
0.3639356, -0.4222751, 0.9802479, 1, 1, 1, 1, 1,
0.3647028, -1.494024, 2.779843, 1, 1, 1, 1, 1,
0.3672903, -0.5281835, 2.282197, 1, 1, 1, 1, 1,
0.3676085, -0.8422219, 1.767931, 1, 1, 1, 1, 1,
0.3676839, -1.6516, 3.667613, 1, 1, 1, 1, 1,
0.3757327, -1.550927, 2.632096, 1, 1, 1, 1, 1,
0.3763707, -0.1923463, 1.238141, 1, 1, 1, 1, 1,
0.3781722, 1.309614, 3.340444, 1, 1, 1, 1, 1,
0.3801049, 0.8521281, 1.941382, 1, 1, 1, 1, 1,
0.3821392, -0.6365561, 3.856848, 1, 1, 1, 1, 1,
0.384947, -0.1755644, 1.395131, 1, 1, 1, 1, 1,
0.3877002, -0.3716899, 2.803291, 1, 1, 1, 1, 1,
0.3892443, -1.34723, 2.583091, 0, 0, 1, 1, 1,
0.390081, -0.1977678, 3.266766, 1, 0, 0, 1, 1,
0.3917328, -0.1758604, 1.96167, 1, 0, 0, 1, 1,
0.3932157, 0.7955597, -0.7149085, 1, 0, 0, 1, 1,
0.3963553, 0.4150562, 0.5786782, 1, 0, 0, 1, 1,
0.3990656, -1.368527, 3.537613, 1, 0, 0, 1, 1,
0.4017159, 0.009662494, 1.729355, 0, 0, 0, 1, 1,
0.4049232, -0.342454, 3.71888, 0, 0, 0, 1, 1,
0.4069396, 0.4801179, 0.3836997, 0, 0, 0, 1, 1,
0.4097712, 2.573846, 1.649229, 0, 0, 0, 1, 1,
0.4104566, 2.60512, 1.038259, 0, 0, 0, 1, 1,
0.4134335, 0.9776261, -0.3765114, 0, 0, 0, 1, 1,
0.4140807, -1.409121, 3.095467, 0, 0, 0, 1, 1,
0.4231751, -1.390267, 2.033682, 1, 1, 1, 1, 1,
0.4272097, 0.2417248, -1.255184, 1, 1, 1, 1, 1,
0.4276362, 2.170809, 0.3068743, 1, 1, 1, 1, 1,
0.4303848, 1.918447, 0.8045201, 1, 1, 1, 1, 1,
0.4336965, -1.163179, 3.484854, 1, 1, 1, 1, 1,
0.4354029, 1.139232, 0.3300016, 1, 1, 1, 1, 1,
0.4354407, 0.7642661, -0.1248981, 1, 1, 1, 1, 1,
0.4367729, -0.2847525, 2.494354, 1, 1, 1, 1, 1,
0.4394919, 0.4313628, 2.371649, 1, 1, 1, 1, 1,
0.4429863, -0.4834521, 1.451103, 1, 1, 1, 1, 1,
0.4511201, 0.2539144, 1.183779, 1, 1, 1, 1, 1,
0.4550938, -0.3018371, 1.106114, 1, 1, 1, 1, 1,
0.4593225, -0.473449, 0.9697011, 1, 1, 1, 1, 1,
0.4613008, -1.031608, 2.496, 1, 1, 1, 1, 1,
0.4631805, -0.07786722, 1.709179, 1, 1, 1, 1, 1,
0.4633511, 0.2423755, -0.1976777, 0, 0, 1, 1, 1,
0.4660005, -1.028067, 2.900736, 1, 0, 0, 1, 1,
0.4666354, -0.4014221, 1.349056, 1, 0, 0, 1, 1,
0.4673359, -0.3774777, 2.406639, 1, 0, 0, 1, 1,
0.4709789, 1.02006, 0.7343144, 1, 0, 0, 1, 1,
0.4710187, -2.571339, 2.857054, 1, 0, 0, 1, 1,
0.4730115, -0.8644565, 3.159292, 0, 0, 0, 1, 1,
0.4772614, 0.908657, 0.4899852, 0, 0, 0, 1, 1,
0.4854595, -0.6134453, 2.689454, 0, 0, 0, 1, 1,
0.4867483, -0.2455906, 2.24753, 0, 0, 0, 1, 1,
0.4888504, -0.456298, 1.421419, 0, 0, 0, 1, 1,
0.4897372, 0.7683939, 0.7429667, 0, 0, 0, 1, 1,
0.4927076, -0.3186459, 3.621788, 0, 0, 0, 1, 1,
0.4928235, -1.825245, 1.304299, 1, 1, 1, 1, 1,
0.4928526, -0.1987163, 2.095405, 1, 1, 1, 1, 1,
0.4964202, -0.8864185, 1.503758, 1, 1, 1, 1, 1,
0.4965845, -0.008896146, 0.7929718, 1, 1, 1, 1, 1,
0.4977208, 0.5444108, 0.8460038, 1, 1, 1, 1, 1,
0.4981188, -0.1526651, 1.687908, 1, 1, 1, 1, 1,
0.5058887, -1.49392, 4.865843, 1, 1, 1, 1, 1,
0.5107184, 0.1703571, 1.032413, 1, 1, 1, 1, 1,
0.5108836, 0.01942735, 1.171066, 1, 1, 1, 1, 1,
0.5169631, 0.8176647, 0.3677655, 1, 1, 1, 1, 1,
0.5276328, -0.1476558, 2.189595, 1, 1, 1, 1, 1,
0.5276718, -1.477728, 1.555798, 1, 1, 1, 1, 1,
0.5359938, 2.086563, -0.3916431, 1, 1, 1, 1, 1,
0.5389165, 0.1382499, -0.4341361, 1, 1, 1, 1, 1,
0.5405203, -0.9897054, 3.078864, 1, 1, 1, 1, 1,
0.5425385, 1.494964, 0.2918431, 0, 0, 1, 1, 1,
0.5439768, -0.1903734, 2.022469, 1, 0, 0, 1, 1,
0.5459129, -1.394822, 2.960738, 1, 0, 0, 1, 1,
0.5476029, 0.09836143, 0.6793636, 1, 0, 0, 1, 1,
0.5483043, 0.6687971, 0.4761687, 1, 0, 0, 1, 1,
0.5491121, 0.229991, -1.191542, 1, 0, 0, 1, 1,
0.5526519, 2.028944, 1.171471, 0, 0, 0, 1, 1,
0.5532826, -0.654255, 1.805495, 0, 0, 0, 1, 1,
0.5537516, -0.9857844, 4.42744, 0, 0, 0, 1, 1,
0.5537776, 0.5167783, 1.310807, 0, 0, 0, 1, 1,
0.5567037, -0.663321, 2.71378, 0, 0, 0, 1, 1,
0.5622888, 2.342134, -0.4261303, 0, 0, 0, 1, 1,
0.5674279, -0.787165, 1.409945, 0, 0, 0, 1, 1,
0.5689929, 2.11177, -0.7783901, 1, 1, 1, 1, 1,
0.5704635, 2.858192, -0.3819627, 1, 1, 1, 1, 1,
0.5720277, 0.6069027, 1.420864, 1, 1, 1, 1, 1,
0.5737976, -1.277413, 0.541764, 1, 1, 1, 1, 1,
0.5742536, -0.8412403, 2.908159, 1, 1, 1, 1, 1,
0.5750202, 1.879935, -0.4869966, 1, 1, 1, 1, 1,
0.5782881, -0.5013206, 2.692127, 1, 1, 1, 1, 1,
0.5814766, 1.575013, 1.160906, 1, 1, 1, 1, 1,
0.5825177, 1.153955, -1.270032, 1, 1, 1, 1, 1,
0.5826666, -0.711, 3.265701, 1, 1, 1, 1, 1,
0.5918344, -0.3897305, 2.642149, 1, 1, 1, 1, 1,
0.5975973, 0.6548621, 2.033459, 1, 1, 1, 1, 1,
0.6004171, -0.2235161, 1.730738, 1, 1, 1, 1, 1,
0.6059599, -0.1401262, 1.365803, 1, 1, 1, 1, 1,
0.6061407, 0.696417, 0.3875306, 1, 1, 1, 1, 1,
0.6066861, -1.03259, 1.291936, 0, 0, 1, 1, 1,
0.6110413, -1.82894, 3.247819, 1, 0, 0, 1, 1,
0.6123515, 0.3518133, 0.5264814, 1, 0, 0, 1, 1,
0.6127989, 1.034472, 1.829329, 1, 0, 0, 1, 1,
0.6136518, 0.08927408, 1.749097, 1, 0, 0, 1, 1,
0.6144681, 1.397258, -0.05017949, 1, 0, 0, 1, 1,
0.6150501, 0.9637014, 0.05365602, 0, 0, 0, 1, 1,
0.6160265, -0.2598453, 1.180626, 0, 0, 0, 1, 1,
0.6164851, 0.5016463, 0.3457229, 0, 0, 0, 1, 1,
0.6170392, -0.07191993, 1.82175, 0, 0, 0, 1, 1,
0.6201974, 0.009421649, 1.809754, 0, 0, 0, 1, 1,
0.6271774, 1.655284, 0.7443209, 0, 0, 0, 1, 1,
0.6297989, 2.198931, 1.372191, 0, 0, 0, 1, 1,
0.6300317, 1.859221, 0.006180443, 1, 1, 1, 1, 1,
0.6420877, 0.1275399, 1.051361, 1, 1, 1, 1, 1,
0.6545717, -0.4613378, 2.482397, 1, 1, 1, 1, 1,
0.6550927, -0.03654447, 1.971487, 1, 1, 1, 1, 1,
0.6580541, -1.121193, 2.238719, 1, 1, 1, 1, 1,
0.6581858, -0.2249176, 2.156593, 1, 1, 1, 1, 1,
0.6641203, -0.7129046, 0.7566391, 1, 1, 1, 1, 1,
0.6779557, -0.5075853, -0.4513876, 1, 1, 1, 1, 1,
0.6925481, 0.3977465, 0.3080238, 1, 1, 1, 1, 1,
0.6951561, 0.9205707, -0.5362981, 1, 1, 1, 1, 1,
0.6972839, 2.864831, 1.190082, 1, 1, 1, 1, 1,
0.7047939, -0.1105262, 2.876763, 1, 1, 1, 1, 1,
0.7060181, 0.6618536, 0.3293745, 1, 1, 1, 1, 1,
0.7090757, 2.392, 2.00303, 1, 1, 1, 1, 1,
0.7130826, 0.9969072, 2.089291, 1, 1, 1, 1, 1,
0.7141154, -2.170644, 2.226038, 0, 0, 1, 1, 1,
0.7190961, -0.2091954, 1.957183, 1, 0, 0, 1, 1,
0.7235531, 0.5684893, 0.6093583, 1, 0, 0, 1, 1,
0.7273525, 0.9987644, 1.20987, 1, 0, 0, 1, 1,
0.7274445, 1.444499, 0.7804568, 1, 0, 0, 1, 1,
0.7281719, 0.2079178, 2.636059, 1, 0, 0, 1, 1,
0.7312357, 1.110979, 1.954684, 0, 0, 0, 1, 1,
0.7342426, -0.4436475, 3.488181, 0, 0, 0, 1, 1,
0.7356529, 0.07767399, 0.8132461, 0, 0, 0, 1, 1,
0.738594, -1.669322, 2.528873, 0, 0, 0, 1, 1,
0.7391863, 0.06008882, 0.345399, 0, 0, 0, 1, 1,
0.7395002, 1.064569, 0.3902652, 0, 0, 0, 1, 1,
0.742169, -1.958399, 3.226571, 0, 0, 0, 1, 1,
0.7484044, -1.075689, 1.93363, 1, 1, 1, 1, 1,
0.748888, -0.4511495, 1.935112, 1, 1, 1, 1, 1,
0.7499887, -1.975861, 2.021724, 1, 1, 1, 1, 1,
0.7510871, 1.085309, 0.08810942, 1, 1, 1, 1, 1,
0.7541163, -1.183396, 2.928832, 1, 1, 1, 1, 1,
0.7581148, 1.34503, 0.5650674, 1, 1, 1, 1, 1,
0.7589082, 0.7296636, 1.214666, 1, 1, 1, 1, 1,
0.7592109, -0.1202069, 1.232675, 1, 1, 1, 1, 1,
0.761444, -1.928212, 2.24966, 1, 1, 1, 1, 1,
0.7714366, 0.03773956, 1.155508, 1, 1, 1, 1, 1,
0.7714497, -1.243037, 2.937253, 1, 1, 1, 1, 1,
0.7732002, -0.2694539, 1.325746, 1, 1, 1, 1, 1,
0.774092, 1.585154, -1.134109, 1, 1, 1, 1, 1,
0.7777313, -0.1889328, 1.046374, 1, 1, 1, 1, 1,
0.7779832, -0.846007, 1.936631, 1, 1, 1, 1, 1,
0.7824246, -0.2408009, 1.819289, 0, 0, 1, 1, 1,
0.783096, -0.5544204, -0.3538396, 1, 0, 0, 1, 1,
0.7897989, 0.4303881, 1.011925, 1, 0, 0, 1, 1,
0.7935238, 0.872347, -0.5422958, 1, 0, 0, 1, 1,
0.7937431, -0.992059, 2.469895, 1, 0, 0, 1, 1,
0.7962825, -0.04579825, 1.241052, 1, 0, 0, 1, 1,
0.7969915, -0.7691782, 3.675136, 0, 0, 0, 1, 1,
0.7989161, 0.5582019, 1.011776, 0, 0, 0, 1, 1,
0.7998883, 0.2313876, 2.995432, 0, 0, 0, 1, 1,
0.8033392, 0.5326487, 1.977348, 0, 0, 0, 1, 1,
0.8043258, -0.8095101, 3.523037, 0, 0, 0, 1, 1,
0.8132005, -0.2368087, 0.2169368, 0, 0, 0, 1, 1,
0.827158, 0.07952596, 0.4638236, 0, 0, 0, 1, 1,
0.8361443, -1.401686, 2.484859, 1, 1, 1, 1, 1,
0.8387656, 0.3513637, 1.832929, 1, 1, 1, 1, 1,
0.8407111, -0.380173, 2.922859, 1, 1, 1, 1, 1,
0.8418596, 1.557927, 0.2622463, 1, 1, 1, 1, 1,
0.8440272, -0.3408072, 2.281011, 1, 1, 1, 1, 1,
0.8486756, -0.8501204, 3.816892, 1, 1, 1, 1, 1,
0.8596137, -1.673751, 3.417897, 1, 1, 1, 1, 1,
0.8676334, -1.139215, 3.632505, 1, 1, 1, 1, 1,
0.8699424, 0.9074042, 1.665732, 1, 1, 1, 1, 1,
0.8703658, -0.2974575, 1.746962, 1, 1, 1, 1, 1,
0.8744387, 1.143783, 2.266912, 1, 1, 1, 1, 1,
0.8779441, -0.5902972, 2.794816, 1, 1, 1, 1, 1,
0.8875028, -0.3930698, 0.7741541, 1, 1, 1, 1, 1,
0.8903462, 1.394737, 1.489151, 1, 1, 1, 1, 1,
0.8925718, 0.3331368, 1.694347, 1, 1, 1, 1, 1,
0.8937813, 0.07603082, 1.210213, 0, 0, 1, 1, 1,
0.899368, 1.144179, 1.188895, 1, 0, 0, 1, 1,
0.8997186, 0.9929159, 0.6920578, 1, 0, 0, 1, 1,
0.9026358, 0.4609573, 0.4032575, 1, 0, 0, 1, 1,
0.9047034, 0.4140552, 0.765965, 1, 0, 0, 1, 1,
0.909242, -1.771697, 2.807225, 1, 0, 0, 1, 1,
0.9100937, -0.9846048, 2.500703, 0, 0, 0, 1, 1,
0.9126419, 1.360393, -0.4249225, 0, 0, 0, 1, 1,
0.9174371, 0.2185152, 0.7127606, 0, 0, 0, 1, 1,
0.918515, 0.3721556, 0.6159237, 0, 0, 0, 1, 1,
0.9222544, 0.2574028, 1.801485, 0, 0, 0, 1, 1,
0.9229655, -0.06575888, 1.965923, 0, 0, 0, 1, 1,
0.9239353, -0.9680046, 1.119184, 0, 0, 0, 1, 1,
0.9242455, -0.6164935, 2.283436, 1, 1, 1, 1, 1,
0.9255648, 0.6856157, 1.066299, 1, 1, 1, 1, 1,
0.9287116, -1.865637, 3.445948, 1, 1, 1, 1, 1,
0.9424641, -0.5820224, 1.705748, 1, 1, 1, 1, 1,
0.9455944, 1.912252, 1.111334, 1, 1, 1, 1, 1,
0.9518976, 0.7254248, 1.65532, 1, 1, 1, 1, 1,
0.9530448, -0.7636079, 2.785547, 1, 1, 1, 1, 1,
0.9563993, 0.382972, 0.9538783, 1, 1, 1, 1, 1,
0.9575398, 0.1050142, 2.206076, 1, 1, 1, 1, 1,
0.9613025, 0.810001, 0.4661202, 1, 1, 1, 1, 1,
0.9632166, 0.5590843, -0.1177085, 1, 1, 1, 1, 1,
0.9647021, -0.6776236, 1.578233, 1, 1, 1, 1, 1,
0.966613, 1.466248, -1.296145, 1, 1, 1, 1, 1,
0.9863517, 0.03590979, 2.094412, 1, 1, 1, 1, 1,
0.9863639, -1.313655, 2.173136, 1, 1, 1, 1, 1,
0.9869629, -0.778845, 2.019886, 0, 0, 1, 1, 1,
0.9872437, -1.393971, 2.053475, 1, 0, 0, 1, 1,
0.9875104, 0.2729787, 2.843732, 1, 0, 0, 1, 1,
0.9912502, 0.7882755, 1.458682, 1, 0, 0, 1, 1,
0.9939581, 0.7950187, -1.364565, 1, 0, 0, 1, 1,
0.9945619, -0.194175, 4.604956, 1, 0, 0, 1, 1,
1.003362, -1.0143, 0.5350087, 0, 0, 0, 1, 1,
1.00622, 1.452347, 0.4537143, 0, 0, 0, 1, 1,
1.008339, -1.671394, 3.253339, 0, 0, 0, 1, 1,
1.010725, 1.065526, 1.526465, 0, 0, 0, 1, 1,
1.011872, -0.2384183, 1.330109, 0, 0, 0, 1, 1,
1.018014, -0.677588, 4.808578, 0, 0, 0, 1, 1,
1.01865, -2.190591, 3.055965, 0, 0, 0, 1, 1,
1.018869, -1.073748, 1.736761, 1, 1, 1, 1, 1,
1.023697, 2.099527, -0.6080138, 1, 1, 1, 1, 1,
1.024779, -0.5422115, 2.104934, 1, 1, 1, 1, 1,
1.034022, 0.5888507, 0.1858407, 1, 1, 1, 1, 1,
1.035724, 0.7312309, 1.209244, 1, 1, 1, 1, 1,
1.041328, -0.4040904, 1.149543, 1, 1, 1, 1, 1,
1.041343, 1.344824, -1.053717, 1, 1, 1, 1, 1,
1.042255, 0.4190056, 1.302842, 1, 1, 1, 1, 1,
1.048051, -2.428276, 2.913993, 1, 1, 1, 1, 1,
1.052618, 0.733551, 2.409979, 1, 1, 1, 1, 1,
1.064558, -0.3578669, -0.5735896, 1, 1, 1, 1, 1,
1.0681, 0.268808, 1.148515, 1, 1, 1, 1, 1,
1.075453, -0.1705599, 2.499428, 1, 1, 1, 1, 1,
1.082681, 1.142226, 1.878445, 1, 1, 1, 1, 1,
1.084234, -0.5500801, 3.716055, 1, 1, 1, 1, 1,
1.086266, 0.7948956, 0.3987796, 0, 0, 1, 1, 1,
1.110708, 1.107557, 0.1662441, 1, 0, 0, 1, 1,
1.11578, 0.227107, 0.3571225, 1, 0, 0, 1, 1,
1.12303, -0.4960991, 2.631433, 1, 0, 0, 1, 1,
1.127659, 0.4334204, 2.767312, 1, 0, 0, 1, 1,
1.135827, 1.749713, 1.164482, 1, 0, 0, 1, 1,
1.147487, 1.280713, 1.678286, 0, 0, 0, 1, 1,
1.149849, -0.2891474, 2.585099, 0, 0, 0, 1, 1,
1.157407, 0.6406949, 0.9477167, 0, 0, 0, 1, 1,
1.163475, -0.4564278, 0.9300076, 0, 0, 0, 1, 1,
1.16488, 1.341705, 1.25529, 0, 0, 0, 1, 1,
1.164947, 0.2744081, 2.47041, 0, 0, 0, 1, 1,
1.170436, 0.2754197, 2.193223, 0, 0, 0, 1, 1,
1.184576, -2.418202, 2.314553, 1, 1, 1, 1, 1,
1.184986, -0.09355542, 3.525452, 1, 1, 1, 1, 1,
1.188039, 0.9343334, 1.193204, 1, 1, 1, 1, 1,
1.189714, -1.762292, 1.761913, 1, 1, 1, 1, 1,
1.190039, 0.04347731, -1.4188, 1, 1, 1, 1, 1,
1.1953, -1.235027, 2.161255, 1, 1, 1, 1, 1,
1.197101, 0.5726698, 0.6526468, 1, 1, 1, 1, 1,
1.198378, -0.8240183, 2.307629, 1, 1, 1, 1, 1,
1.203119, -0.03986339, 0.8860345, 1, 1, 1, 1, 1,
1.203508, -0.5935132, 2.668444, 1, 1, 1, 1, 1,
1.204012, -1.100909, 2.04817, 1, 1, 1, 1, 1,
1.205124, 1.079806, 0.6170677, 1, 1, 1, 1, 1,
1.207904, -0.2977678, 0.8609667, 1, 1, 1, 1, 1,
1.209131, 0.2768582, 0.7461584, 1, 1, 1, 1, 1,
1.217255, -0.001796121, 1.575168, 1, 1, 1, 1, 1,
1.218204, 2.180898, 1.11193, 0, 0, 1, 1, 1,
1.227649, 0.5085182, -0.3612744, 1, 0, 0, 1, 1,
1.242188, 0.7999343, 0.410249, 1, 0, 0, 1, 1,
1.250875, -1.965574, 1.484339, 1, 0, 0, 1, 1,
1.251208, 0.7584613, -0.0921008, 1, 0, 0, 1, 1,
1.254963, -0.8563493, 2.391438, 1, 0, 0, 1, 1,
1.273927, 0.7136438, 1.060633, 0, 0, 0, 1, 1,
1.275267, 1.09781, -0.06673346, 0, 0, 0, 1, 1,
1.280031, -0.8932697, 2.155742, 0, 0, 0, 1, 1,
1.282605, -0.7294652, 0.6593177, 0, 0, 0, 1, 1,
1.288142, -0.9613203, 2.380124, 0, 0, 0, 1, 1,
1.289977, 0.8900189, 3.162569, 0, 0, 0, 1, 1,
1.293124, -0.1731589, 2.190166, 0, 0, 0, 1, 1,
1.300838, 0.2840704, 2.96539, 1, 1, 1, 1, 1,
1.301143, 0.1233014, 2.004432, 1, 1, 1, 1, 1,
1.304296, 0.9674584, 1.306035, 1, 1, 1, 1, 1,
1.31032, 1.154393, -0.6966935, 1, 1, 1, 1, 1,
1.336393, -0.200753, 1.519132, 1, 1, 1, 1, 1,
1.340371, 0.2630313, 2.689441, 1, 1, 1, 1, 1,
1.346469, 1.004458, 0.2717208, 1, 1, 1, 1, 1,
1.362991, 1.643045, -0.51156, 1, 1, 1, 1, 1,
1.386531, 1.243529, 0.7110324, 1, 1, 1, 1, 1,
1.388625, 0.8582944, -0.08895417, 1, 1, 1, 1, 1,
1.38932, -0.4541073, 1.825886, 1, 1, 1, 1, 1,
1.39094, 0.8654351, 0.237427, 1, 1, 1, 1, 1,
1.394321, -0.2751568, -0.577211, 1, 1, 1, 1, 1,
1.400715, 0.9779404, -0.2348675, 1, 1, 1, 1, 1,
1.422936, -2.04448, 1.821588, 1, 1, 1, 1, 1,
1.426296, 1.095951, 2.302634, 0, 0, 1, 1, 1,
1.439686, 0.3320584, -0.3925178, 1, 0, 0, 1, 1,
1.45743, -0.07695149, 3.067962, 1, 0, 0, 1, 1,
1.461463, -0.9872829, 2.196229, 1, 0, 0, 1, 1,
1.474817, 0.7895577, 2.423713, 1, 0, 0, 1, 1,
1.476578, 0.2893003, 0.6275877, 1, 0, 0, 1, 1,
1.480377, 1.197904, 1.229993, 0, 0, 0, 1, 1,
1.480899, -2.339313, 2.203614, 0, 0, 0, 1, 1,
1.481938, -1.684, 2.038894, 0, 0, 0, 1, 1,
1.490878, 1.203582, 1.163311, 0, 0, 0, 1, 1,
1.493199, 0.5125882, 3.028293, 0, 0, 0, 1, 1,
1.507239, -0.3414965, 0.5605238, 0, 0, 0, 1, 1,
1.507457, 0.3859282, 1.428384, 0, 0, 0, 1, 1,
1.511322, 0.7665833, -1.184015, 1, 1, 1, 1, 1,
1.51419, 0.6507431, 1.156792, 1, 1, 1, 1, 1,
1.517921, 0.4285409, 1.126972, 1, 1, 1, 1, 1,
1.52183, -1.196618, 2.497675, 1, 1, 1, 1, 1,
1.530402, -0.1368771, 0.7462094, 1, 1, 1, 1, 1,
1.530841, 0.5220734, 0.2693774, 1, 1, 1, 1, 1,
1.534329, -0.2252019, 2.319035, 1, 1, 1, 1, 1,
1.538804, -0.01403593, 1.61612, 1, 1, 1, 1, 1,
1.544628, 2.122141, 1.084362, 1, 1, 1, 1, 1,
1.549837, 2.192439, 1.707207, 1, 1, 1, 1, 1,
1.550683, -1.143315, 1.227005, 1, 1, 1, 1, 1,
1.563283, -1.284139, 2.491388, 1, 1, 1, 1, 1,
1.572251, -0.6114656, 2.613624, 1, 1, 1, 1, 1,
1.57735, 1.779637, 0.01864913, 1, 1, 1, 1, 1,
1.583547, -0.9266777, 1.472829, 1, 1, 1, 1, 1,
1.584362, -0.6948225, 2.710688, 0, 0, 1, 1, 1,
1.590964, 0.8252913, 2.037442, 1, 0, 0, 1, 1,
1.597241, 0.3799271, 1.688357, 1, 0, 0, 1, 1,
1.60643, 0.4012829, 0.1092456, 1, 0, 0, 1, 1,
1.607027, -1.68104, 3.807318, 1, 0, 0, 1, 1,
1.612345, -0.4070408, 2.322337, 1, 0, 0, 1, 1,
1.631867, -0.601217, 2.393306, 0, 0, 0, 1, 1,
1.636635, 0.01070039, 1.343176, 0, 0, 0, 1, 1,
1.648788, -0.4151022, 0.3672613, 0, 0, 0, 1, 1,
1.650539, -1.833031, 2.502397, 0, 0, 0, 1, 1,
1.682397, -1.909396, 2.983332, 0, 0, 0, 1, 1,
1.695744, 0.98076, 0.3948443, 0, 0, 0, 1, 1,
1.708807, 1.31183, 1.021185, 0, 0, 0, 1, 1,
1.738675, -1.270874, 2.346686, 1, 1, 1, 1, 1,
1.789495, -1.017272, 3.190269, 1, 1, 1, 1, 1,
1.798885, -1.163556, 1.059092, 1, 1, 1, 1, 1,
1.813021, 0.01463374, 2.866602, 1, 1, 1, 1, 1,
1.815787, 0.0709166, 0.7159808, 1, 1, 1, 1, 1,
1.828464, 0.4186015, 1.516997, 1, 1, 1, 1, 1,
1.837511, -0.8888919, 2.264354, 1, 1, 1, 1, 1,
1.838265, -1.225383, 2.484561, 1, 1, 1, 1, 1,
1.838571, -0.2005271, 1.54108, 1, 1, 1, 1, 1,
1.848077, 0.7163094, 1.169506, 1, 1, 1, 1, 1,
1.867233, 0.9412921, 1.914276, 1, 1, 1, 1, 1,
1.892769, -1.557195, 1.730304, 1, 1, 1, 1, 1,
1.895904, 0.02643581, -0.2477862, 1, 1, 1, 1, 1,
1.924366, 0.206189, 0.7066411, 1, 1, 1, 1, 1,
1.947468, 0.03338553, 1.710295, 1, 1, 1, 1, 1,
1.956821, -1.302461, 1.677157, 0, 0, 1, 1, 1,
2.028649, 1.453408, 1.637205, 1, 0, 0, 1, 1,
2.122104, 0.9021414, 0.9035618, 1, 0, 0, 1, 1,
2.122362, -0.9840488, 2.227359, 1, 0, 0, 1, 1,
2.141605, 0.3528634, 1.709513, 1, 0, 0, 1, 1,
2.145345, -0.2857592, 2.800107, 1, 0, 0, 1, 1,
2.15317, 1.162802, 1.646492, 0, 0, 0, 1, 1,
2.180392, -3.311643, 2.22947, 0, 0, 0, 1, 1,
2.233804, 0.4032462, 1.22827, 0, 0, 0, 1, 1,
2.241836, -2.116982, 2.332569, 0, 0, 0, 1, 1,
2.267755, 0.01914651, 1.571959, 0, 0, 0, 1, 1,
2.344592, 1.011891, 1.144313, 0, 0, 0, 1, 1,
2.394974, 0.0712092, 1.896642, 0, 0, 0, 1, 1,
2.555544, -1.392409, 1.179588, 1, 1, 1, 1, 1,
2.569522, 0.7115535, 3.072722, 1, 1, 1, 1, 1,
2.577873, 1.075327, 4.511096, 1, 1, 1, 1, 1,
2.708364, -1.168446, 3.113928, 1, 1, 1, 1, 1,
2.747557, -2.523808, 2.615893, 1, 1, 1, 1, 1,
2.815721, 0.9497218, 1.636128, 1, 1, 1, 1, 1,
2.824753, 2.11227, 2.840695, 1, 1, 1, 1, 1
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
var radius = 9.380122;
var distance = 32.94728;
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
mvMatrix.translate( 0.3039818, 0.5269102, -0.1693435 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.94728);
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
