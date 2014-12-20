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
-2.904346, 0.5707962, 0.5296445, 1, 0, 0, 1,
-2.730802, -0.53532, -1.738239, 1, 0.007843138, 0, 1,
-2.355544, 1.11758, -0.4311105, 1, 0.01176471, 0, 1,
-2.353233, 0.5352062, 0.002286902, 1, 0.01960784, 0, 1,
-2.33937, 1.547624, -1.163528, 1, 0.02352941, 0, 1,
-2.285537, 0.7921699, -1.695397, 1, 0.03137255, 0, 1,
-2.279588, -1.086818, -1.094759, 1, 0.03529412, 0, 1,
-2.270291, 0.6864472, -0.8892554, 1, 0.04313726, 0, 1,
-2.255752, 0.1432476, -0.859108, 1, 0.04705882, 0, 1,
-2.230453, 0.1020646, -1.005461, 1, 0.05490196, 0, 1,
-2.1025, 1.298985, 0.7656329, 1, 0.05882353, 0, 1,
-2.053139, 0.3152652, -2.416462, 1, 0.06666667, 0, 1,
-2.051714, 0.6665342, -1.338826, 1, 0.07058824, 0, 1,
-2.037426, -1.00075, -1.755657, 1, 0.07843138, 0, 1,
-2.036139, -0.005217457, -1.921062, 1, 0.08235294, 0, 1,
-2.026339, 2.026463, -1.405309, 1, 0.09019608, 0, 1,
-2.00281, -1.027896, -1.995977, 1, 0.09411765, 0, 1,
-1.999245, -0.7701005, -4.371346, 1, 0.1019608, 0, 1,
-1.968481, 1.081378, 0.4634708, 1, 0.1098039, 0, 1,
-1.928856, -0.04290844, -1.915924, 1, 0.1137255, 0, 1,
-1.927046, -0.7739631, -2.556155, 1, 0.1215686, 0, 1,
-1.918814, -0.09525197, -1.772874, 1, 0.1254902, 0, 1,
-1.907537, -0.999386, -3.096164, 1, 0.1333333, 0, 1,
-1.896399, -0.3950901, -0.7181894, 1, 0.1372549, 0, 1,
-1.896352, 0.7477657, -1.666996, 1, 0.145098, 0, 1,
-1.88911, -1.695632, -0.3870496, 1, 0.1490196, 0, 1,
-1.853327, 1.477732, -0.8326697, 1, 0.1568628, 0, 1,
-1.853041, -2.134837, -2.425307, 1, 0.1607843, 0, 1,
-1.845214, -0.1528875, -1.698611, 1, 0.1686275, 0, 1,
-1.844538, 0.5262644, -1.70333, 1, 0.172549, 0, 1,
-1.844275, 0.2128259, -1.936665, 1, 0.1803922, 0, 1,
-1.843869, -0.6651545, -2.206622, 1, 0.1843137, 0, 1,
-1.834302, 0.2524707, -2.933864, 1, 0.1921569, 0, 1,
-1.794078, 1.533112, -1.435193, 1, 0.1960784, 0, 1,
-1.788581, 0.1762669, -2.351993, 1, 0.2039216, 0, 1,
-1.730365, -1.21322, -1.999281, 1, 0.2117647, 0, 1,
-1.729019, -1.088403, -1.23259, 1, 0.2156863, 0, 1,
-1.722013, -0.5196859, 0.07444096, 1, 0.2235294, 0, 1,
-1.711497, -0.1710104, -0.966993, 1, 0.227451, 0, 1,
-1.704996, -0.1185783, -1.60703, 1, 0.2352941, 0, 1,
-1.693422, 0.7359786, 0.3172508, 1, 0.2392157, 0, 1,
-1.685274, -0.3557025, -2.905124, 1, 0.2470588, 0, 1,
-1.675967, -0.3353727, -1.451516, 1, 0.2509804, 0, 1,
-1.65834, 0.08869038, -2.98957, 1, 0.2588235, 0, 1,
-1.651511, -3.101271, -1.703613, 1, 0.2627451, 0, 1,
-1.642259, -0.6232581, -1.145436, 1, 0.2705882, 0, 1,
-1.639183, -0.639276, -0.4355586, 1, 0.2745098, 0, 1,
-1.637246, 0.03025685, -2.571682, 1, 0.282353, 0, 1,
-1.636083, -0.757984, -1.862642, 1, 0.2862745, 0, 1,
-1.629356, -0.9136843, -2.877511, 1, 0.2941177, 0, 1,
-1.62094, 0.2293156, -2.685179, 1, 0.3019608, 0, 1,
-1.616645, -0.4991084, -2.822421, 1, 0.3058824, 0, 1,
-1.615359, 1.028244, -1.188082, 1, 0.3137255, 0, 1,
-1.606172, 0.6308089, -1.062569, 1, 0.3176471, 0, 1,
-1.599813, 1.034931, 0.7930069, 1, 0.3254902, 0, 1,
-1.584097, 0.1834905, -0.7070588, 1, 0.3294118, 0, 1,
-1.583844, -0.3405123, -0.6950857, 1, 0.3372549, 0, 1,
-1.582819, 0.301335, -3.030501, 1, 0.3411765, 0, 1,
-1.575899, 0.4110055, -0.04615629, 1, 0.3490196, 0, 1,
-1.554978, -1.304622, 0.793162, 1, 0.3529412, 0, 1,
-1.544599, -1.329511, -1.380141, 1, 0.3607843, 0, 1,
-1.518593, -0.357859, -1.296467, 1, 0.3647059, 0, 1,
-1.517292, -0.1063403, -2.728618, 1, 0.372549, 0, 1,
-1.504698, 0.967595, -1.534738, 1, 0.3764706, 0, 1,
-1.500636, -1.202819, -2.038311, 1, 0.3843137, 0, 1,
-1.500342, -0.5578966, -1.471301, 1, 0.3882353, 0, 1,
-1.492698, -1.90602, -3.440521, 1, 0.3960784, 0, 1,
-1.491383, 1.864476, 0.3956538, 1, 0.4039216, 0, 1,
-1.486569, 1.729723, -1.01175, 1, 0.4078431, 0, 1,
-1.480851, -0.3749364, -3.034644, 1, 0.4156863, 0, 1,
-1.478288, -0.1842241, -1.07119, 1, 0.4196078, 0, 1,
-1.476764, 0.05000535, -1.449305, 1, 0.427451, 0, 1,
-1.463878, 1.466576, -0.1005946, 1, 0.4313726, 0, 1,
-1.458955, 0.05993523, -2.053191, 1, 0.4392157, 0, 1,
-1.451475, 2.023333, -0.68623, 1, 0.4431373, 0, 1,
-1.448449, 0.5040298, -0.5150426, 1, 0.4509804, 0, 1,
-1.447426, -0.617056, -3.553842, 1, 0.454902, 0, 1,
-1.442215, 0.1734181, -1.634043, 1, 0.4627451, 0, 1,
-1.431268, 1.893085, -0.6293755, 1, 0.4666667, 0, 1,
-1.429108, 0.1685909, -1.837547, 1, 0.4745098, 0, 1,
-1.415453, -1.049989, -3.195142, 1, 0.4784314, 0, 1,
-1.410785, -0.6238366, -0.2807781, 1, 0.4862745, 0, 1,
-1.388927, -0.3059915, -2.5892, 1, 0.4901961, 0, 1,
-1.370711, -0.6684654, -3.277001, 1, 0.4980392, 0, 1,
-1.364168, 1.632117, -0.8271793, 1, 0.5058824, 0, 1,
-1.363616, -1.552419, -2.314823, 1, 0.509804, 0, 1,
-1.348218, -1.464007, -1.37956, 1, 0.5176471, 0, 1,
-1.339933, 0.8263165, -0.4559882, 1, 0.5215687, 0, 1,
-1.336832, 0.143004, -2.601737, 1, 0.5294118, 0, 1,
-1.33371, 0.7873967, -1.047005, 1, 0.5333334, 0, 1,
-1.328209, -0.1822322, -1.662521, 1, 0.5411765, 0, 1,
-1.32399, 0.9652186, -2.835142, 1, 0.5450981, 0, 1,
-1.320237, -0.9405756, -2.229347, 1, 0.5529412, 0, 1,
-1.315167, 0.7902704, -2.267068, 1, 0.5568628, 0, 1,
-1.309751, -0.3512199, -2.554602, 1, 0.5647059, 0, 1,
-1.308186, 0.3091044, -0.9071884, 1, 0.5686275, 0, 1,
-1.2999, 0.6177087, -1.033589, 1, 0.5764706, 0, 1,
-1.296978, 1.802953, -2.187319, 1, 0.5803922, 0, 1,
-1.289728, 0.06443659, -2.843858, 1, 0.5882353, 0, 1,
-1.288953, 0.8526923, 0.02235062, 1, 0.5921569, 0, 1,
-1.282468, 0.3595109, -1.168264, 1, 0.6, 0, 1,
-1.272422, 1.873143, 1.231914, 1, 0.6078432, 0, 1,
-1.264827, -0.3719726, -3.716119, 1, 0.6117647, 0, 1,
-1.261357, 0.8483117, 0.5292243, 1, 0.6196079, 0, 1,
-1.260278, 0.4823666, -1.228697, 1, 0.6235294, 0, 1,
-1.257416, -0.6818745, -3.176454, 1, 0.6313726, 0, 1,
-1.250932, -1.242753, -2.452291, 1, 0.6352941, 0, 1,
-1.244327, -0.7253644, -1.691186, 1, 0.6431373, 0, 1,
-1.226408, 1.204125, -2.234776, 1, 0.6470588, 0, 1,
-1.226099, 0.8721454, -0.9772171, 1, 0.654902, 0, 1,
-1.222499, -0.8538979, -2.193847, 1, 0.6588235, 0, 1,
-1.220847, 1.045098, -1.191251, 1, 0.6666667, 0, 1,
-1.214909, 1.543706, -2.279656, 1, 0.6705883, 0, 1,
-1.201218, -0.02446966, -2.405649, 1, 0.6784314, 0, 1,
-1.196047, -1.806734, -3.470314, 1, 0.682353, 0, 1,
-1.185787, -0.7161312, -1.107051, 1, 0.6901961, 0, 1,
-1.177977, 0.9781075, -2.351406, 1, 0.6941177, 0, 1,
-1.172809, -1.357101, -2.425718, 1, 0.7019608, 0, 1,
-1.169724, 0.354627, -2.2756, 1, 0.7098039, 0, 1,
-1.158537, 0.8360516, -0.3801555, 1, 0.7137255, 0, 1,
-1.155512, 1.081727, -0.1516733, 1, 0.7215686, 0, 1,
-1.147944, -0.3548386, -1.349433, 1, 0.7254902, 0, 1,
-1.145914, -0.7900057, -1.091177, 1, 0.7333333, 0, 1,
-1.134779, -2.267868, -1.604205, 1, 0.7372549, 0, 1,
-1.132788, -0.3768505, -1.144423, 1, 0.7450981, 0, 1,
-1.126648, 0.7902831, -1.301542, 1, 0.7490196, 0, 1,
-1.120927, 0.9299708, -2.517622, 1, 0.7568628, 0, 1,
-1.114701, -0.387356, -1.707033, 1, 0.7607843, 0, 1,
-1.10685, 0.6565729, -0.2062447, 1, 0.7686275, 0, 1,
-1.102262, -0.8763468, -3.045569, 1, 0.772549, 0, 1,
-1.099842, 0.2688675, -1.908661, 1, 0.7803922, 0, 1,
-1.090823, -0.4600321, -1.724949, 1, 0.7843137, 0, 1,
-1.089539, -0.7002214, -2.945555, 1, 0.7921569, 0, 1,
-1.087806, 0.2003767, -3.542618, 1, 0.7960784, 0, 1,
-1.085386, -0.3547433, -1.890339, 1, 0.8039216, 0, 1,
-1.084964, 0.09433351, -0.6348392, 1, 0.8117647, 0, 1,
-1.081795, -0.07323492, -2.409863, 1, 0.8156863, 0, 1,
-1.076669, 1.183989, -1.403805, 1, 0.8235294, 0, 1,
-1.070031, -0.4304839, -1.780357, 1, 0.827451, 0, 1,
-1.067109, 0.02950287, -3.83077, 1, 0.8352941, 0, 1,
-1.064458, 0.9110684, -0.7429062, 1, 0.8392157, 0, 1,
-1.063183, -1.834226, -1.62419, 1, 0.8470588, 0, 1,
-1.058404, 1.863062, -0.593591, 1, 0.8509804, 0, 1,
-1.047441, 0.5242463, 0.7300234, 1, 0.8588235, 0, 1,
-1.042286, 0.9004567, 0.8933365, 1, 0.8627451, 0, 1,
-1.039838, 0.07477807, -3.340353, 1, 0.8705882, 0, 1,
-1.037916, -0.4117463, -2.479926, 1, 0.8745098, 0, 1,
-1.028332, -0.1388368, -1.074536, 1, 0.8823529, 0, 1,
-1.015412, 0.7560173, -1.815782, 1, 0.8862745, 0, 1,
-1.014235, -0.006685007, -2.919921, 1, 0.8941177, 0, 1,
-1.012638, -0.2405105, -1.289298, 1, 0.8980392, 0, 1,
-1.006903, -0.9264743, -2.018744, 1, 0.9058824, 0, 1,
-1.006631, 1.46172, -1.308224, 1, 0.9137255, 0, 1,
-1.00403, 0.7379186, -2.952945, 1, 0.9176471, 0, 1,
-1.001459, -0.6827945, -1.589033, 1, 0.9254902, 0, 1,
-1.001363, 0.1318894, -0.7945339, 1, 0.9294118, 0, 1,
-1.000636, 0.3791489, -1.222248, 1, 0.9372549, 0, 1,
-0.997859, 0.8053609, -0.6257838, 1, 0.9411765, 0, 1,
-0.9943935, -1.542488, -3.008667, 1, 0.9490196, 0, 1,
-0.9847395, -0.7171896, -2.060771, 1, 0.9529412, 0, 1,
-0.9825214, -0.7450662, -1.985753, 1, 0.9607843, 0, 1,
-0.9697703, 0.4195394, -2.082242, 1, 0.9647059, 0, 1,
-0.9650741, 1.1963, 0.04940757, 1, 0.972549, 0, 1,
-0.960323, 0.09077141, -0.7359948, 1, 0.9764706, 0, 1,
-0.9583337, -0.9728214, -2.116698, 1, 0.9843137, 0, 1,
-0.9410735, -1.234533, -3.297519, 1, 0.9882353, 0, 1,
-0.938951, -0.4351033, -2.626707, 1, 0.9960784, 0, 1,
-0.9384363, -0.676992, -1.627068, 0.9960784, 1, 0, 1,
-0.938269, 0.1564091, -2.089556, 0.9921569, 1, 0, 1,
-0.9378834, 0.7317616, -0.8949501, 0.9843137, 1, 0, 1,
-0.9301207, 1.073161, -0.9778421, 0.9803922, 1, 0, 1,
-0.9289232, 1.659875, 0.7957491, 0.972549, 1, 0, 1,
-0.9267845, -0.1503742, -0.5308014, 0.9686275, 1, 0, 1,
-0.9260388, 1.160175, -3.081205, 0.9607843, 1, 0, 1,
-0.9223841, -1.676381, -1.861444, 0.9568627, 1, 0, 1,
-0.9192614, -0.1135491, -2.44374, 0.9490196, 1, 0, 1,
-0.9190393, -1.536529, -1.533543, 0.945098, 1, 0, 1,
-0.9177309, -0.3529816, -1.435922, 0.9372549, 1, 0, 1,
-0.9173558, -2.217603, -1.954695, 0.9333333, 1, 0, 1,
-0.9152951, -0.203695, -0.2637469, 0.9254902, 1, 0, 1,
-0.8996527, -0.9837543, -2.141929, 0.9215686, 1, 0, 1,
-0.8939592, 1.271101, -1.245416, 0.9137255, 1, 0, 1,
-0.8937908, -0.647637, -2.754932, 0.9098039, 1, 0, 1,
-0.889685, 0.02064766, -3.970596, 0.9019608, 1, 0, 1,
-0.8847042, 0.4628116, -1.10447, 0.8941177, 1, 0, 1,
-0.8826539, -1.426699, -2.909152, 0.8901961, 1, 0, 1,
-0.8792799, 0.706403, -1.801098, 0.8823529, 1, 0, 1,
-0.8791324, -0.2130459, -1.918784, 0.8784314, 1, 0, 1,
-0.8762853, -2.125871, -3.58917, 0.8705882, 1, 0, 1,
-0.8708153, -1.115156, -4.227974, 0.8666667, 1, 0, 1,
-0.8688352, 0.4040681, -0.4772081, 0.8588235, 1, 0, 1,
-0.8653815, -0.1289472, -1.026254, 0.854902, 1, 0, 1,
-0.8653655, 0.1181538, -2.056462, 0.8470588, 1, 0, 1,
-0.8649111, 0.04714151, 1.426334, 0.8431373, 1, 0, 1,
-0.8631492, 0.3639448, -0.05808178, 0.8352941, 1, 0, 1,
-0.8511062, 1.111653, -0.2699034, 0.8313726, 1, 0, 1,
-0.8456464, 0.2904018, 0.7586921, 0.8235294, 1, 0, 1,
-0.8456228, -0.1608513, -1.208922, 0.8196079, 1, 0, 1,
-0.8345138, -0.1694722, -2.521037, 0.8117647, 1, 0, 1,
-0.8311651, -1.840568, -3.179381, 0.8078431, 1, 0, 1,
-0.8301696, 1.711679, -1.180064, 0.8, 1, 0, 1,
-0.8277892, 0.4920661, -0.2950998, 0.7921569, 1, 0, 1,
-0.8165396, 1.232292, -1.45782, 0.7882353, 1, 0, 1,
-0.8144233, 0.9265422, 0.8335835, 0.7803922, 1, 0, 1,
-0.8136219, -2.054544, -3.039779, 0.7764706, 1, 0, 1,
-0.8113073, 0.7803938, -1.381864, 0.7686275, 1, 0, 1,
-0.8100547, -0.3990055, -2.755893, 0.7647059, 1, 0, 1,
-0.8074942, -0.1638732, -2.509681, 0.7568628, 1, 0, 1,
-0.8057734, 0.04458936, -2.434007, 0.7529412, 1, 0, 1,
-0.8014869, 0.05447091, -2.15669, 0.7450981, 1, 0, 1,
-0.7996402, 0.7970271, -2.060517, 0.7411765, 1, 0, 1,
-0.7979057, 0.5703869, -0.9026034, 0.7333333, 1, 0, 1,
-0.7958971, 0.04596553, -0.5904298, 0.7294118, 1, 0, 1,
-0.7935371, -0.1647735, -3.705332, 0.7215686, 1, 0, 1,
-0.7915316, -0.9366683, -2.726552, 0.7176471, 1, 0, 1,
-0.7910593, 0.8743584, -0.262594, 0.7098039, 1, 0, 1,
-0.7888614, -0.2210098, -2.690475, 0.7058824, 1, 0, 1,
-0.7868525, -0.3944407, -1.388619, 0.6980392, 1, 0, 1,
-0.7846719, 1.259743, -0.9459774, 0.6901961, 1, 0, 1,
-0.7785665, 0.4709474, -0.00307987, 0.6862745, 1, 0, 1,
-0.7773144, 0.9634077, -0.8727677, 0.6784314, 1, 0, 1,
-0.7742296, -0.8809348, -2.809776, 0.6745098, 1, 0, 1,
-0.7720701, -0.7137762, -3.824763, 0.6666667, 1, 0, 1,
-0.7707341, 0.2814623, -2.024865, 0.6627451, 1, 0, 1,
-0.7700207, 0.2809942, -0.82386, 0.654902, 1, 0, 1,
-0.7688023, -0.3062913, -1.389311, 0.6509804, 1, 0, 1,
-0.7670634, -1.487478, -1.355872, 0.6431373, 1, 0, 1,
-0.7658227, 0.6664778, -0.1736597, 0.6392157, 1, 0, 1,
-0.7597547, 0.636741, -2.194482, 0.6313726, 1, 0, 1,
-0.7551365, -0.2194818, 0.5481592, 0.627451, 1, 0, 1,
-0.7541078, 0.3479889, -0.5335199, 0.6196079, 1, 0, 1,
-0.7500702, 0.995851, -0.07438833, 0.6156863, 1, 0, 1,
-0.7490119, -0.2393576, -1.298598, 0.6078432, 1, 0, 1,
-0.7367551, -0.7794737, -1.458486, 0.6039216, 1, 0, 1,
-0.73544, 1.053569, 0.4469273, 0.5960785, 1, 0, 1,
-0.7338468, -0.1984411, -2.208718, 0.5882353, 1, 0, 1,
-0.7319006, 1.145832, -2.012966, 0.5843138, 1, 0, 1,
-0.7301804, 0.8853524, 0.5089132, 0.5764706, 1, 0, 1,
-0.7276884, 0.8935592, 1.181556, 0.572549, 1, 0, 1,
-0.7257753, -0.1918479, -2.909856, 0.5647059, 1, 0, 1,
-0.7238092, 1.248865, 0.5125419, 0.5607843, 1, 0, 1,
-0.7198287, -0.6703416, -3.816453, 0.5529412, 1, 0, 1,
-0.7181695, -0.8165893, -2.992385, 0.5490196, 1, 0, 1,
-0.7125524, -0.5754036, -1.80851, 0.5411765, 1, 0, 1,
-0.7097261, -1.0307, -3.209154, 0.5372549, 1, 0, 1,
-0.7089132, 0.01859854, -1.435672, 0.5294118, 1, 0, 1,
-0.7087951, 1.485668, 0.6508723, 0.5254902, 1, 0, 1,
-0.7077033, 0.4503969, -1.181877, 0.5176471, 1, 0, 1,
-0.7070855, 0.4724573, 0.9701708, 0.5137255, 1, 0, 1,
-0.6982043, -0.9260461, -2.774952, 0.5058824, 1, 0, 1,
-0.6963163, -1.332414, -2.118876, 0.5019608, 1, 0, 1,
-0.6959988, -0.8630038, -2.419224, 0.4941176, 1, 0, 1,
-0.6949703, -0.8492432, -1.495206, 0.4862745, 1, 0, 1,
-0.6922094, -0.2233236, -1.398867, 0.4823529, 1, 0, 1,
-0.6901829, 0.3506874, -2.068047, 0.4745098, 1, 0, 1,
-0.6870118, 1.766672, 1.545994, 0.4705882, 1, 0, 1,
-0.6810808, -2.981297, -3.407146, 0.4627451, 1, 0, 1,
-0.6793236, 0.9873133, 0.7709659, 0.4588235, 1, 0, 1,
-0.6784927, -1.179215, -2.359791, 0.4509804, 1, 0, 1,
-0.6777346, 0.4318534, -0.5197039, 0.4470588, 1, 0, 1,
-0.6771355, 0.05810319, -1.4189, 0.4392157, 1, 0, 1,
-0.6713924, -0.1796906, -1.304563, 0.4352941, 1, 0, 1,
-0.6687026, 0.3075029, -2.662313, 0.427451, 1, 0, 1,
-0.6598108, -0.1529956, -0.3181501, 0.4235294, 1, 0, 1,
-0.6592982, 0.7911569, -2.110031, 0.4156863, 1, 0, 1,
-0.6446151, 0.05513274, -2.198548, 0.4117647, 1, 0, 1,
-0.6433184, 0.6855189, -2.491988, 0.4039216, 1, 0, 1,
-0.6426308, 0.2532136, -2.105083, 0.3960784, 1, 0, 1,
-0.6424098, -2.175545, -1.849434, 0.3921569, 1, 0, 1,
-0.6409822, -0.1969582, -0.08181883, 0.3843137, 1, 0, 1,
-0.6407731, -0.1722433, 0.02083797, 0.3803922, 1, 0, 1,
-0.6394385, -1.493119, -2.473647, 0.372549, 1, 0, 1,
-0.638301, 0.05811391, -2.187619, 0.3686275, 1, 0, 1,
-0.637949, 1.087862, -1.343691, 0.3607843, 1, 0, 1,
-0.6369788, -1.396655, -2.488441, 0.3568628, 1, 0, 1,
-0.6337251, 0.9403508, -0.7057858, 0.3490196, 1, 0, 1,
-0.6315699, -0.7720506, -2.238566, 0.345098, 1, 0, 1,
-0.6294722, -1.981251, -2.294466, 0.3372549, 1, 0, 1,
-0.6289338, 0.03301468, -3.348829, 0.3333333, 1, 0, 1,
-0.6286138, -1.430905, -5.037157, 0.3254902, 1, 0, 1,
-0.6276253, 0.4279179, -0.7659338, 0.3215686, 1, 0, 1,
-0.6214935, 0.1023699, -3.03965, 0.3137255, 1, 0, 1,
-0.6107655, 0.8024528, -1.541293, 0.3098039, 1, 0, 1,
-0.6090491, -1.651299, -2.030769, 0.3019608, 1, 0, 1,
-0.6081768, -0.03446066, -1.720081, 0.2941177, 1, 0, 1,
-0.6076348, -0.6656065, -2.068182, 0.2901961, 1, 0, 1,
-0.6018339, -0.3734715, -3.852336, 0.282353, 1, 0, 1,
-0.6002638, -0.4096421, -2.385666, 0.2784314, 1, 0, 1,
-0.5985917, -0.674871, -2.234917, 0.2705882, 1, 0, 1,
-0.5939655, -2.331764, -0.8924993, 0.2666667, 1, 0, 1,
-0.5843743, -0.4150276, -2.203782, 0.2588235, 1, 0, 1,
-0.5817366, 0.7954531, -1.655348, 0.254902, 1, 0, 1,
-0.5802317, 1.321058, -1.715762, 0.2470588, 1, 0, 1,
-0.5748459, -0.6869202, -3.148913, 0.2431373, 1, 0, 1,
-0.572684, -1.010996, -2.615968, 0.2352941, 1, 0, 1,
-0.5717846, 0.1710754, -1.767071, 0.2313726, 1, 0, 1,
-0.570124, 1.050659, 1.114411, 0.2235294, 1, 0, 1,
-0.5660477, -0.4321053, -1.152828, 0.2196078, 1, 0, 1,
-0.5614456, 0.6457378, -0.7457017, 0.2117647, 1, 0, 1,
-0.5608166, 0.8911928, -1.544227, 0.2078431, 1, 0, 1,
-0.5470781, -0.5613778, -2.096475, 0.2, 1, 0, 1,
-0.5448392, -0.08744882, -1.837543, 0.1921569, 1, 0, 1,
-0.5384645, -1.556085, -2.579981, 0.1882353, 1, 0, 1,
-0.5370615, -2.029701, -3.032315, 0.1803922, 1, 0, 1,
-0.5365914, -0.8864845, -4.653184, 0.1764706, 1, 0, 1,
-0.5351658, -0.8157656, -2.140592, 0.1686275, 1, 0, 1,
-0.533321, 0.889411, -0.7201451, 0.1647059, 1, 0, 1,
-0.5312661, 0.3187201, -2.344785, 0.1568628, 1, 0, 1,
-0.5285999, 0.02995874, -0.6280313, 0.1529412, 1, 0, 1,
-0.5229573, -0.1252121, -2.669577, 0.145098, 1, 0, 1,
-0.5211281, 0.3728746, -2.10324, 0.1411765, 1, 0, 1,
-0.5115045, 0.2379058, 0.03230864, 0.1333333, 1, 0, 1,
-0.5101231, -0.6192184, -2.971705, 0.1294118, 1, 0, 1,
-0.5099674, -0.9887877, -2.218258, 0.1215686, 1, 0, 1,
-0.5042737, 1.007612, -1.386652, 0.1176471, 1, 0, 1,
-0.5005041, -0.5384971, -3.07749, 0.1098039, 1, 0, 1,
-0.492378, 1.385579, -1.720942, 0.1058824, 1, 0, 1,
-0.4921349, 2.319807, -0.69876, 0.09803922, 1, 0, 1,
-0.4900381, -0.7993081, -3.327718, 0.09019608, 1, 0, 1,
-0.487902, 0.3946872, 0.1574008, 0.08627451, 1, 0, 1,
-0.487608, 1.656743, 1.1882, 0.07843138, 1, 0, 1,
-0.4828685, -1.701758, -2.329325, 0.07450981, 1, 0, 1,
-0.4808823, -0.2687666, -1.975804, 0.06666667, 1, 0, 1,
-0.4760123, 0.221725, -1.060604, 0.0627451, 1, 0, 1,
-0.4726935, 0.8056504, -1.478793, 0.05490196, 1, 0, 1,
-0.4724174, 0.2671415, -2.671029, 0.05098039, 1, 0, 1,
-0.4719854, 1.689277, -2.002015, 0.04313726, 1, 0, 1,
-0.4677579, 0.9750311, -1.430302, 0.03921569, 1, 0, 1,
-0.4669084, -1.496107, -1.938231, 0.03137255, 1, 0, 1,
-0.4644582, -0.6069355, -2.540752, 0.02745098, 1, 0, 1,
-0.4640058, -1.646068, -2.842244, 0.01960784, 1, 0, 1,
-0.461448, 0.06083544, -2.54602, 0.01568628, 1, 0, 1,
-0.4596227, 1.327054, 0.6713284, 0.007843138, 1, 0, 1,
-0.4589685, -0.8511141, -1.900554, 0.003921569, 1, 0, 1,
-0.4589641, 0.5441268, -0.8716528, 0, 1, 0.003921569, 1,
-0.4551958, 0.2412281, -0.2507381, 0, 1, 0.01176471, 1,
-0.4509563, 1.799937, 0.3153048, 0, 1, 0.01568628, 1,
-0.4479157, 0.4482248, -1.497962, 0, 1, 0.02352941, 1,
-0.4456491, 1.645215, 1.145328, 0, 1, 0.02745098, 1,
-0.4412327, 1.865432, -0.935972, 0, 1, 0.03529412, 1,
-0.4388543, 0.05756493, -0.4822106, 0, 1, 0.03921569, 1,
-0.4383263, 2.217835, -0.3334315, 0, 1, 0.04705882, 1,
-0.43579, -0.05870374, -1.089226, 0, 1, 0.05098039, 1,
-0.4312843, -0.06554095, -0.9951537, 0, 1, 0.05882353, 1,
-0.4275056, -1.516202, -2.897279, 0, 1, 0.0627451, 1,
-0.4259259, 0.3142791, -0.6210991, 0, 1, 0.07058824, 1,
-0.4251519, -0.966015, -3.940351, 0, 1, 0.07450981, 1,
-0.4244428, 1.016078, -1.494893, 0, 1, 0.08235294, 1,
-0.4226943, 0.2639706, 0.2735902, 0, 1, 0.08627451, 1,
-0.421441, -1.749051, -5.13876, 0, 1, 0.09411765, 1,
-0.4201803, 0.1673836, -1.47858, 0, 1, 0.1019608, 1,
-0.4131716, -0.7847008, -1.720458, 0, 1, 0.1058824, 1,
-0.4112627, 0.3031026, -2.655911, 0, 1, 0.1137255, 1,
-0.4111903, 0.7769136, 0.5387404, 0, 1, 0.1176471, 1,
-0.406213, 1.24175, -1.530694, 0, 1, 0.1254902, 1,
-0.3921706, 1.979062, -1.400333, 0, 1, 0.1294118, 1,
-0.3846573, 0.9438323, 1.062075, 0, 1, 0.1372549, 1,
-0.3840844, 1.447421, 0.7060115, 0, 1, 0.1411765, 1,
-0.3782639, -0.1624436, -1.033975, 0, 1, 0.1490196, 1,
-0.3752528, -0.04552489, -0.1172215, 0, 1, 0.1529412, 1,
-0.3724062, 0.1183227, -0.9668345, 0, 1, 0.1607843, 1,
-0.3708764, 1.757185, 1.446271, 0, 1, 0.1647059, 1,
-0.36546, -0.9303936, -2.125415, 0, 1, 0.172549, 1,
-0.3616943, 1.356915, -0.489694, 0, 1, 0.1764706, 1,
-0.3567776, 0.6114286, -1.428846, 0, 1, 0.1843137, 1,
-0.3560086, -0.1182202, -3.133718, 0, 1, 0.1882353, 1,
-0.353832, -2.072352, -2.93586, 0, 1, 0.1960784, 1,
-0.3506146, -1.024456, -4.258363, 0, 1, 0.2039216, 1,
-0.3483998, 0.2401311, -0.6984512, 0, 1, 0.2078431, 1,
-0.3476038, 0.1813126, -2.050427, 0, 1, 0.2156863, 1,
-0.3452553, -0.288791, -3.724121, 0, 1, 0.2196078, 1,
-0.3443737, 0.4088916, -2.140843, 0, 1, 0.227451, 1,
-0.341148, -0.4000951, -3.005084, 0, 1, 0.2313726, 1,
-0.3395216, -1.327175, -3.247745, 0, 1, 0.2392157, 1,
-0.3367754, 0.1679687, -2.132403, 0, 1, 0.2431373, 1,
-0.3323722, -0.2868049, -1.686647, 0, 1, 0.2509804, 1,
-0.3308119, 0.9043851, -0.3311299, 0, 1, 0.254902, 1,
-0.3296461, 0.8884631, -0.1733221, 0, 1, 0.2627451, 1,
-0.3278514, -0.1329271, -2.646283, 0, 1, 0.2666667, 1,
-0.3265684, 0.09969264, -0.8867067, 0, 1, 0.2745098, 1,
-0.3238267, 1.419692, 0.9497093, 0, 1, 0.2784314, 1,
-0.3198358, 0.6800018, -0.5334561, 0, 1, 0.2862745, 1,
-0.3158786, 0.8285856, -0.7574259, 0, 1, 0.2901961, 1,
-0.3106764, -1.292149, -4.43958, 0, 1, 0.2980392, 1,
-0.3078178, 1.846111, -0.5911065, 0, 1, 0.3058824, 1,
-0.3063588, 0.3129885, -1.848356, 0, 1, 0.3098039, 1,
-0.2981624, -0.8540393, -2.684402, 0, 1, 0.3176471, 1,
-0.2927272, 0.6331424, -0.3257883, 0, 1, 0.3215686, 1,
-0.290101, -0.533427, -2.525484, 0, 1, 0.3294118, 1,
-0.289196, 0.3473655, -0.7505371, 0, 1, 0.3333333, 1,
-0.2821373, 0.4637871, -1.342655, 0, 1, 0.3411765, 1,
-0.2795616, -1.051468, -2.102715, 0, 1, 0.345098, 1,
-0.2759069, 0.1910811, -1.036921, 0, 1, 0.3529412, 1,
-0.2754631, 1.145739, -1.000425, 0, 1, 0.3568628, 1,
-0.2752505, 0.1072221, -0.897061, 0, 1, 0.3647059, 1,
-0.2689147, 1.224736, -0.2115319, 0, 1, 0.3686275, 1,
-0.2684049, 0.2310157, -1.425685, 0, 1, 0.3764706, 1,
-0.2662648, -0.6516649, -3.578015, 0, 1, 0.3803922, 1,
-0.2645387, 1.648464, -0.7544017, 0, 1, 0.3882353, 1,
-0.2639582, -1.564952, -2.443448, 0, 1, 0.3921569, 1,
-0.2630472, -0.1196426, -2.655122, 0, 1, 0.4, 1,
-0.2615485, 0.7682722, -0.610711, 0, 1, 0.4078431, 1,
-0.2604996, -0.1939901, -2.2278, 0, 1, 0.4117647, 1,
-0.2566433, -1.138323, -2.769856, 0, 1, 0.4196078, 1,
-0.2536985, 0.1035809, -1.20758, 0, 1, 0.4235294, 1,
-0.253562, 2.179415, -1.588122, 0, 1, 0.4313726, 1,
-0.2526329, 0.3983402, -2.331503, 0, 1, 0.4352941, 1,
-0.2515191, -0.2272584, -1.980028, 0, 1, 0.4431373, 1,
-0.2441601, 0.7079584, -1.335366, 0, 1, 0.4470588, 1,
-0.2397338, 1.196495, -0.8328141, 0, 1, 0.454902, 1,
-0.2382341, -0.5153329, -3.097884, 0, 1, 0.4588235, 1,
-0.2366615, 0.2668676, -1.844751, 0, 1, 0.4666667, 1,
-0.2287563, 2.168337, 0.3704681, 0, 1, 0.4705882, 1,
-0.2275665, -1.611606, -4.163348, 0, 1, 0.4784314, 1,
-0.2260754, -0.3014742, -2.350118, 0, 1, 0.4823529, 1,
-0.222599, 1.592335, 0.4124077, 0, 1, 0.4901961, 1,
-0.2201868, 0.008049436, -1.334219, 0, 1, 0.4941176, 1,
-0.2186674, -1.038452, -3.614636, 0, 1, 0.5019608, 1,
-0.2176669, 1.843738, -0.8021551, 0, 1, 0.509804, 1,
-0.2159387, -0.6574342, -2.056295, 0, 1, 0.5137255, 1,
-0.2150003, 0.4065495, -0.3703341, 0, 1, 0.5215687, 1,
-0.2103942, 1.196995, -0.7625484, 0, 1, 0.5254902, 1,
-0.2063816, -0.2094012, -2.152279, 0, 1, 0.5333334, 1,
-0.2010409, 0.2109764, -1.92871, 0, 1, 0.5372549, 1,
-0.1974564, 0.4894134, -1.285574, 0, 1, 0.5450981, 1,
-0.1965631, -1.594034, -3.170036, 0, 1, 0.5490196, 1,
-0.1964313, -0.8584548, -3.611039, 0, 1, 0.5568628, 1,
-0.1958419, 0.9342837, -0.2116285, 0, 1, 0.5607843, 1,
-0.1951921, 1.154885, 0.8528002, 0, 1, 0.5686275, 1,
-0.192389, 0.2140305, -0.8050606, 0, 1, 0.572549, 1,
-0.18838, -0.2023123, -1.60136, 0, 1, 0.5803922, 1,
-0.1863042, 0.5673485, 2.149999, 0, 1, 0.5843138, 1,
-0.1862366, 0.6652659, -0.1237543, 0, 1, 0.5921569, 1,
-0.1850178, 0.1372695, -1.742843, 0, 1, 0.5960785, 1,
-0.1808486, 1.046787, 0.2126511, 0, 1, 0.6039216, 1,
-0.169233, 0.6571003, -0.9229392, 0, 1, 0.6117647, 1,
-0.1674826, 0.2540738, -1.388247, 0, 1, 0.6156863, 1,
-0.1663315, 0.06447913, -1.697908, 0, 1, 0.6235294, 1,
-0.1606886, -1.973464, -5.109577, 0, 1, 0.627451, 1,
-0.1575953, -0.2356254, -4.207746, 0, 1, 0.6352941, 1,
-0.1573863, 0.9656062, -2.083577, 0, 1, 0.6392157, 1,
-0.1571455, -0.7350751, -1.409239, 0, 1, 0.6470588, 1,
-0.156024, 1.695188, -0.8984038, 0, 1, 0.6509804, 1,
-0.1502183, 0.7385747, -0.1457487, 0, 1, 0.6588235, 1,
-0.1496916, -0.9509257, -2.327844, 0, 1, 0.6627451, 1,
-0.1483557, 2.426016, 1.137658, 0, 1, 0.6705883, 1,
-0.1480527, -1.481248, -4.432664, 0, 1, 0.6745098, 1,
-0.1476629, -0.0588311, -0.7420985, 0, 1, 0.682353, 1,
-0.1453627, -2.454144, -2.9806, 0, 1, 0.6862745, 1,
-0.1389018, 0.3595822, -2.583175, 0, 1, 0.6941177, 1,
-0.1304408, -0.3459837, -4.814136, 0, 1, 0.7019608, 1,
-0.1303672, 0.07594873, 0.290592, 0, 1, 0.7058824, 1,
-0.1280008, 1.531482, -1.064538, 0, 1, 0.7137255, 1,
-0.1229235, 0.7720816, -0.01869169, 0, 1, 0.7176471, 1,
-0.1225292, 1.547569, -0.9282896, 0, 1, 0.7254902, 1,
-0.1214386, -1.028976, -2.117031, 0, 1, 0.7294118, 1,
-0.1051224, 0.5807319, 0.1960998, 0, 1, 0.7372549, 1,
-0.1036279, -0.2987963, -3.142202, 0, 1, 0.7411765, 1,
-0.0979636, 0.006036433, -0.1782023, 0, 1, 0.7490196, 1,
-0.09495116, 0.7011167, -0.4622539, 0, 1, 0.7529412, 1,
-0.09438806, 0.6863393, 0.03391, 0, 1, 0.7607843, 1,
-0.08714444, -1.238108, -3.35116, 0, 1, 0.7647059, 1,
-0.08485129, 0.3413466, 1.064876, 0, 1, 0.772549, 1,
-0.08185466, -0.3971331, -2.64764, 0, 1, 0.7764706, 1,
-0.07195877, 3.15859, 0.102449, 0, 1, 0.7843137, 1,
-0.07102189, 0.6849282, -1.293986, 0, 1, 0.7882353, 1,
-0.06463391, -1.28971, -4.236323, 0, 1, 0.7960784, 1,
-0.06449207, -0.2242677, -2.698723, 0, 1, 0.8039216, 1,
-0.06347314, -1.261901, -1.55338, 0, 1, 0.8078431, 1,
-0.06274253, -0.8836253, -3.487964, 0, 1, 0.8156863, 1,
-0.05328243, -0.04061511, -1.475594, 0, 1, 0.8196079, 1,
-0.05116001, -0.5000703, -2.107366, 0, 1, 0.827451, 1,
-0.04303712, 1.097891, -0.610264, 0, 1, 0.8313726, 1,
-0.04216981, -0.233041, -2.809124, 0, 1, 0.8392157, 1,
-0.04093607, -0.7865554, -2.342267, 0, 1, 0.8431373, 1,
-0.03922185, 0.8866429, -0.4602378, 0, 1, 0.8509804, 1,
-0.03843132, -2.097529, -2.136175, 0, 1, 0.854902, 1,
-0.03682613, -0.153971, -2.302042, 0, 1, 0.8627451, 1,
-0.03287637, -1.064964, -3.678216, 0, 1, 0.8666667, 1,
-0.03182352, 0.07640627, 0.3605388, 0, 1, 0.8745098, 1,
-0.03125179, -2.789414, -4.177834, 0, 1, 0.8784314, 1,
-0.02295678, 1.876347, -0.7240387, 0, 1, 0.8862745, 1,
-0.02125103, -0.1500601, -2.434013, 0, 1, 0.8901961, 1,
-0.01577296, 0.7524578, 0.5095503, 0, 1, 0.8980392, 1,
-0.01461532, 0.1243152, 0.2170528, 0, 1, 0.9058824, 1,
-0.01402309, -0.661239, -2.219949, 0, 1, 0.9098039, 1,
-0.01378889, 0.9447751, -0.2805758, 0, 1, 0.9176471, 1,
-0.009926985, 0.4009428, 0.3113419, 0, 1, 0.9215686, 1,
-0.009874215, 0.3056943, 0.8425313, 0, 1, 0.9294118, 1,
-0.009300647, 0.080538, -0.2780161, 0, 1, 0.9333333, 1,
-0.00817714, 0.1149589, 0.4828289, 0, 1, 0.9411765, 1,
-0.008075137, 0.09886528, -0.120578, 0, 1, 0.945098, 1,
-0.0007703199, -0.4725084, -3.853767, 0, 1, 0.9529412, 1,
0.002814397, -0.3889349, 3.406762, 0, 1, 0.9568627, 1,
0.00524983, -1.289928, 4.273342, 0, 1, 0.9647059, 1,
0.0171545, -0.5901587, 3.367055, 0, 1, 0.9686275, 1,
0.01935215, -0.04673591, 1.825744, 0, 1, 0.9764706, 1,
0.02237985, 0.2356683, 0.7723997, 0, 1, 0.9803922, 1,
0.02284445, -0.1388209, 2.785187, 0, 1, 0.9882353, 1,
0.02440775, -0.233055, 2.018438, 0, 1, 0.9921569, 1,
0.02453259, -1.344217, 3.499096, 0, 1, 1, 1,
0.02565529, 1.515944, -0.4495016, 0, 0.9921569, 1, 1,
0.02873311, 0.4741718, 1.180582, 0, 0.9882353, 1, 1,
0.02899021, 0.543752, 1.106285, 0, 0.9803922, 1, 1,
0.03175734, 1.064581, 1.208884, 0, 0.9764706, 1, 1,
0.04049751, -0.2327386, 2.756358, 0, 0.9686275, 1, 1,
0.0415237, 0.6785828, -0.3030997, 0, 0.9647059, 1, 1,
0.04191726, 0.943252, 0.9412598, 0, 0.9568627, 1, 1,
0.04252036, -1.132158, 4.676286, 0, 0.9529412, 1, 1,
0.04416147, 0.7033596, -1.099157, 0, 0.945098, 1, 1,
0.04551435, 0.2136562, 0.4855159, 0, 0.9411765, 1, 1,
0.05907258, -0.4037088, 2.066759, 0, 0.9333333, 1, 1,
0.05923874, -0.7100204, 1.635382, 0, 0.9294118, 1, 1,
0.0634274, 1.598437, -0.9292446, 0, 0.9215686, 1, 1,
0.06507463, 0.1802958, -0.08417117, 0, 0.9176471, 1, 1,
0.0671628, 0.1155477, 2.340381, 0, 0.9098039, 1, 1,
0.06992541, 0.3312397, 0.1244367, 0, 0.9058824, 1, 1,
0.07085187, 0.6826963, 0.001367287, 0, 0.8980392, 1, 1,
0.07203794, 1.803538, -0.149562, 0, 0.8901961, 1, 1,
0.07419506, 0.05494744, 0.9338716, 0, 0.8862745, 1, 1,
0.07854751, -0.3696611, 3.48717, 0, 0.8784314, 1, 1,
0.07944804, 0.7032869, -0.2825606, 0, 0.8745098, 1, 1,
0.08281026, 0.5887103, -0.3016219, 0, 0.8666667, 1, 1,
0.08723622, 0.0326892, 1.498521, 0, 0.8627451, 1, 1,
0.09553915, -0.05289295, 2.782387, 0, 0.854902, 1, 1,
0.09569035, -1.195154, 4.807806, 0, 0.8509804, 1, 1,
0.09779828, 1.037391, 0.3919307, 0, 0.8431373, 1, 1,
0.1005161, 0.7650271, -0.6281803, 0, 0.8392157, 1, 1,
0.1011491, 1.536762, 0.585167, 0, 0.8313726, 1, 1,
0.1013026, -2.541078, 2.721261, 0, 0.827451, 1, 1,
0.102509, -0.5643529, 1.567787, 0, 0.8196079, 1, 1,
0.103146, 0.04495195, 1.701039, 0, 0.8156863, 1, 1,
0.103181, -0.9369338, 4.615417, 0, 0.8078431, 1, 1,
0.1065386, 0.7621409, 1.72227, 0, 0.8039216, 1, 1,
0.1086004, 0.4403573, 0.1564849, 0, 0.7960784, 1, 1,
0.1111836, 0.4417643, -1.922858, 0, 0.7882353, 1, 1,
0.1113698, -0.2017724, 3.305849, 0, 0.7843137, 1, 1,
0.1139917, -0.7486739, 3.330658, 0, 0.7764706, 1, 1,
0.1179026, 1.08804, -0.9064509, 0, 0.772549, 1, 1,
0.1190874, -1.725677, 2.425013, 0, 0.7647059, 1, 1,
0.1209775, -0.6613057, 3.531655, 0, 0.7607843, 1, 1,
0.1288042, -0.4141899, 2.70906, 0, 0.7529412, 1, 1,
0.1376759, -1.550918, 4.070645, 0, 0.7490196, 1, 1,
0.1378961, 0.547707, 1.019443, 0, 0.7411765, 1, 1,
0.1384862, -0.4670767, 1.95386, 0, 0.7372549, 1, 1,
0.1399386, -0.2561184, 2.683501, 0, 0.7294118, 1, 1,
0.1429794, 1.300791, 0.06756631, 0, 0.7254902, 1, 1,
0.1436087, -1.284983, 1.869918, 0, 0.7176471, 1, 1,
0.1472747, -0.127669, 2.520822, 0, 0.7137255, 1, 1,
0.1496763, 0.0789341, 0.2223306, 0, 0.7058824, 1, 1,
0.1502436, -1.379399, 0.6037613, 0, 0.6980392, 1, 1,
0.1522078, 0.6663603, 0.397781, 0, 0.6941177, 1, 1,
0.1524826, -0.1732151, 2.704054, 0, 0.6862745, 1, 1,
0.1533177, 0.2600509, 1.088883, 0, 0.682353, 1, 1,
0.1549076, 0.1040346, 0.01532644, 0, 0.6745098, 1, 1,
0.1588813, 0.6795314, -0.3705706, 0, 0.6705883, 1, 1,
0.1710123, -0.8711351, 2.989861, 0, 0.6627451, 1, 1,
0.1710205, 0.8540081, 0.8003688, 0, 0.6588235, 1, 1,
0.1722727, 1.124796, 0.1476789, 0, 0.6509804, 1, 1,
0.1730135, -0.5549613, 3.12429, 0, 0.6470588, 1, 1,
0.1752915, -0.2876748, 0.6480485, 0, 0.6392157, 1, 1,
0.1758083, 1.200329, -0.3991104, 0, 0.6352941, 1, 1,
0.1837721, 0.2416348, 0.3000864, 0, 0.627451, 1, 1,
0.1850144, 0.7881288, 0.5381043, 0, 0.6235294, 1, 1,
0.1910414, -0.6838644, 4.854945, 0, 0.6156863, 1, 1,
0.1926255, -0.2263878, 3.104726, 0, 0.6117647, 1, 1,
0.1932064, -0.4207051, 2.814934, 0, 0.6039216, 1, 1,
0.1945141, 1.358037, 0.6397265, 0, 0.5960785, 1, 1,
0.1970778, 0.7399023, -0.5348091, 0, 0.5921569, 1, 1,
0.1978664, -0.08271611, 1.856437, 0, 0.5843138, 1, 1,
0.1981235, -0.5755095, 2.539132, 0, 0.5803922, 1, 1,
0.1984707, 0.4951979, -0.2632272, 0, 0.572549, 1, 1,
0.2064899, -0.9029225, 3.689032, 0, 0.5686275, 1, 1,
0.2072509, -0.8316798, 1.107131, 0, 0.5607843, 1, 1,
0.2095382, -0.3904634, 2.374967, 0, 0.5568628, 1, 1,
0.2096387, 1.428142, -0.7302947, 0, 0.5490196, 1, 1,
0.2103458, -0.1529102, 3.637604, 0, 0.5450981, 1, 1,
0.2183017, -0.09132234, 2.62531, 0, 0.5372549, 1, 1,
0.2195425, -0.03097278, 1.84115, 0, 0.5333334, 1, 1,
0.2219665, -0.186594, 1.664331, 0, 0.5254902, 1, 1,
0.2242095, 0.1679697, 0.7735811, 0, 0.5215687, 1, 1,
0.2265987, 1.229914, 2.708128, 0, 0.5137255, 1, 1,
0.2273927, 0.4139459, -0.8177572, 0, 0.509804, 1, 1,
0.2284182, -0.6431836, 2.577369, 0, 0.5019608, 1, 1,
0.2288386, 1.284289, 0.8598306, 0, 0.4941176, 1, 1,
0.2305216, -0.09834082, 2.349736, 0, 0.4901961, 1, 1,
0.2448293, 0.1108938, 3.325599, 0, 0.4823529, 1, 1,
0.2460299, 0.2964475, 2.192867, 0, 0.4784314, 1, 1,
0.2483192, 0.4894138, -0.4150732, 0, 0.4705882, 1, 1,
0.2498264, 0.8202212, 0.9078688, 0, 0.4666667, 1, 1,
0.2507077, -1.24763, 3.347186, 0, 0.4588235, 1, 1,
0.2529512, -1.707169, 5.166894, 0, 0.454902, 1, 1,
0.2543709, 1.395127, 1.106531, 0, 0.4470588, 1, 1,
0.2601999, 1.642929, 0.983592, 0, 0.4431373, 1, 1,
0.2614594, 0.7190177, 2.029704, 0, 0.4352941, 1, 1,
0.2667312, -0.1480096, -0.2359818, 0, 0.4313726, 1, 1,
0.2672586, 1.370266, -0.07632792, 0, 0.4235294, 1, 1,
0.2675105, 1.221664, 1.887265, 0, 0.4196078, 1, 1,
0.267951, 0.05285018, 0.6606811, 0, 0.4117647, 1, 1,
0.2697318, 0.3628221, -0.1348454, 0, 0.4078431, 1, 1,
0.2708559, 0.2479888, 0.9633038, 0, 0.4, 1, 1,
0.2721741, 0.6229253, -0.9234167, 0, 0.3921569, 1, 1,
0.2722612, 0.8611453, 1.386883, 0, 0.3882353, 1, 1,
0.275219, -0.9289023, 3.872707, 0, 0.3803922, 1, 1,
0.2779122, -0.6825233, 3.266595, 0, 0.3764706, 1, 1,
0.2786142, -0.7698985, 2.909214, 0, 0.3686275, 1, 1,
0.2804115, 2.558678, -1.685923, 0, 0.3647059, 1, 1,
0.2813912, 0.2422642, 0.7228054, 0, 0.3568628, 1, 1,
0.2816931, 0.2102733, 2.239629, 0, 0.3529412, 1, 1,
0.2859226, 0.1991015, 0.06831518, 0, 0.345098, 1, 1,
0.2860321, 1.963966, -0.159968, 0, 0.3411765, 1, 1,
0.2889731, 1.586885, 1.01729, 0, 0.3333333, 1, 1,
0.2976317, -1.65303, 1.983588, 0, 0.3294118, 1, 1,
0.2976694, 0.9215872, 0.5896161, 0, 0.3215686, 1, 1,
0.2996316, 1.138004, 2.100225, 0, 0.3176471, 1, 1,
0.3027135, 1.82497, 0.1625613, 0, 0.3098039, 1, 1,
0.3035417, -0.594503, 4.513999, 0, 0.3058824, 1, 1,
0.3037855, 0.1858342, 0.8129105, 0, 0.2980392, 1, 1,
0.3038023, 0.4855946, -0.2608671, 0, 0.2901961, 1, 1,
0.3040049, -1.474833, 4.639507, 0, 0.2862745, 1, 1,
0.309231, 1.724267, 1.718623, 0, 0.2784314, 1, 1,
0.3144158, -0.01324892, 0.4624414, 0, 0.2745098, 1, 1,
0.3176705, -0.2404449, 3.163756, 0, 0.2666667, 1, 1,
0.322386, -0.02633461, 0.8121244, 0, 0.2627451, 1, 1,
0.3240229, -0.7563828, 3.226667, 0, 0.254902, 1, 1,
0.3255329, 0.3243562, 0.9816688, 0, 0.2509804, 1, 1,
0.3264745, 0.4708276, -0.8709935, 0, 0.2431373, 1, 1,
0.3283474, -0.3313682, 2.806026, 0, 0.2392157, 1, 1,
0.3337635, -0.7859861, 3.872989, 0, 0.2313726, 1, 1,
0.334393, 0.6304615, 1.449728, 0, 0.227451, 1, 1,
0.3346154, 0.8708053, -1.200221, 0, 0.2196078, 1, 1,
0.3407815, 0.374373, -2.522682, 0, 0.2156863, 1, 1,
0.3449279, -0.4704526, 1.315531, 0, 0.2078431, 1, 1,
0.3470578, -2.066384, 1.659938, 0, 0.2039216, 1, 1,
0.347675, -0.4890013, 2.599365, 0, 0.1960784, 1, 1,
0.3483998, -0.9133683, 2.310505, 0, 0.1882353, 1, 1,
0.3486902, -1.615612, 2.469849, 0, 0.1843137, 1, 1,
0.3491697, 2.171898, -1.666442, 0, 0.1764706, 1, 1,
0.3502752, -0.7604079, 2.350487, 0, 0.172549, 1, 1,
0.3539993, 0.8126755, -0.2041252, 0, 0.1647059, 1, 1,
0.3577602, 0.3178228, 2.028502, 0, 0.1607843, 1, 1,
0.362865, 0.6795076, 0.009964709, 0, 0.1529412, 1, 1,
0.3659928, 0.09561671, 0.5082911, 0, 0.1490196, 1, 1,
0.3718444, -0.813091, 2.437753, 0, 0.1411765, 1, 1,
0.3733127, 1.324349, 0.2048095, 0, 0.1372549, 1, 1,
0.3752594, 0.6655195, -0.5615229, 0, 0.1294118, 1, 1,
0.3764223, -0.4338045, 3.687705, 0, 0.1254902, 1, 1,
0.3774653, -0.01061324, -0.5375296, 0, 0.1176471, 1, 1,
0.3845267, -0.1480362, 2.876213, 0, 0.1137255, 1, 1,
0.3872412, 0.6395197, -0.7988071, 0, 0.1058824, 1, 1,
0.3891181, 1.19273, 0.01899641, 0, 0.09803922, 1, 1,
0.3899758, -1.616856, 3.014629, 0, 0.09411765, 1, 1,
0.3904155, 0.1011163, 1.77625, 0, 0.08627451, 1, 1,
0.392294, -1.454957, 2.936993, 0, 0.08235294, 1, 1,
0.3939182, 0.09634628, 0.9538311, 0, 0.07450981, 1, 1,
0.3983972, 0.521772, 1.31713, 0, 0.07058824, 1, 1,
0.4059307, 2.068787, -0.3105623, 0, 0.0627451, 1, 1,
0.4124732, -1.079322, 1.63566, 0, 0.05882353, 1, 1,
0.4132999, -0.5289204, 0.06043919, 0, 0.05098039, 1, 1,
0.4149376, -0.585158, 3.790957, 0, 0.04705882, 1, 1,
0.4157083, -0.3187792, 1.979246, 0, 0.03921569, 1, 1,
0.4249653, -1.288597, 1.168012, 0, 0.03529412, 1, 1,
0.4256068, -0.3701876, 2.456603, 0, 0.02745098, 1, 1,
0.4280266, 0.6015336, 0.07305616, 0, 0.02352941, 1, 1,
0.4290271, 0.4713765, 0.8570156, 0, 0.01568628, 1, 1,
0.4372573, 0.7729601, 0.0204065, 0, 0.01176471, 1, 1,
0.438826, 0.5838794, 1.855321, 0, 0.003921569, 1, 1,
0.4396339, -0.2371079, 2.111551, 0.003921569, 0, 1, 1,
0.4406687, -0.03748659, 2.487415, 0.007843138, 0, 1, 1,
0.4435035, 0.1893308, 3.969921, 0.01568628, 0, 1, 1,
0.4444927, -0.3112389, -0.009927205, 0.01960784, 0, 1, 1,
0.4450548, -1.474725, 2.013152, 0.02745098, 0, 1, 1,
0.4466648, 0.9260627, 0.9876009, 0.03137255, 0, 1, 1,
0.4491714, -0.6846809, 1.939995, 0.03921569, 0, 1, 1,
0.4527518, -0.9396024, 0.9716904, 0.04313726, 0, 1, 1,
0.4541366, 0.4450889, -0.3213408, 0.05098039, 0, 1, 1,
0.461661, -0.3803678, 1.568264, 0.05490196, 0, 1, 1,
0.4653358, 0.02384293, 1.704963, 0.0627451, 0, 1, 1,
0.4678814, 0.7292818, -1.224907, 0.06666667, 0, 1, 1,
0.4693066, -0.7580388, 2.927812, 0.07450981, 0, 1, 1,
0.4694712, -0.6185142, 3.171284, 0.07843138, 0, 1, 1,
0.4721468, 1.135011, -1.331463, 0.08627451, 0, 1, 1,
0.4723004, 0.6538767, 1.587883, 0.09019608, 0, 1, 1,
0.4731767, -0.5836493, 1.595021, 0.09803922, 0, 1, 1,
0.4733185, 1.215574, -1.124614, 0.1058824, 0, 1, 1,
0.4754718, -0.3512262, 3.368071, 0.1098039, 0, 1, 1,
0.4757052, -0.08400953, 1.906005, 0.1176471, 0, 1, 1,
0.4761904, -0.8590693, 3.718404, 0.1215686, 0, 1, 1,
0.4791467, 0.1128187, 1.2884, 0.1294118, 0, 1, 1,
0.4804924, -1.319193, 2.935948, 0.1333333, 0, 1, 1,
0.4805418, 0.8921111, 0.260937, 0.1411765, 0, 1, 1,
0.4807151, 0.8422586, 0.2325212, 0.145098, 0, 1, 1,
0.4833369, 0.6219099, 1.682986, 0.1529412, 0, 1, 1,
0.4846822, 0.8486222, 0.7591221, 0.1568628, 0, 1, 1,
0.4847489, 0.3805829, 0.8425607, 0.1647059, 0, 1, 1,
0.4943304, -0.2490852, 1.48494, 0.1686275, 0, 1, 1,
0.4997476, -0.2425279, 3.187098, 0.1764706, 0, 1, 1,
0.5019901, 0.2330307, 1.336081, 0.1803922, 0, 1, 1,
0.5051166, 1.288146, 0.8711675, 0.1882353, 0, 1, 1,
0.5054147, -0.782159, 1.47156, 0.1921569, 0, 1, 1,
0.51322, 0.7448742, 1.25963, 0.2, 0, 1, 1,
0.5163321, 0.3658471, 0.4739471, 0.2078431, 0, 1, 1,
0.5176633, -0.4058419, 2.087836, 0.2117647, 0, 1, 1,
0.5203561, -2.464878, 2.399968, 0.2196078, 0, 1, 1,
0.5209517, 0.7080289, 2.802722, 0.2235294, 0, 1, 1,
0.522202, -0.4882253, 2.262083, 0.2313726, 0, 1, 1,
0.5228835, -0.3909366, 5.79336, 0.2352941, 0, 1, 1,
0.5239677, 2.783207, -1.521758, 0.2431373, 0, 1, 1,
0.5243322, -1.172033, 2.730138, 0.2470588, 0, 1, 1,
0.5313334, 1.474767, 1.039869, 0.254902, 0, 1, 1,
0.5382767, -2.163164, 4.113026, 0.2588235, 0, 1, 1,
0.5400575, -0.7933059, 2.412894, 0.2666667, 0, 1, 1,
0.5435764, 0.3954581, 1.862026, 0.2705882, 0, 1, 1,
0.5441684, -0.4083174, 1.244017, 0.2784314, 0, 1, 1,
0.5455636, 0.8599757, 1.479802, 0.282353, 0, 1, 1,
0.5468625, 0.6223403, -0.7268196, 0.2901961, 0, 1, 1,
0.548172, 0.04558441, 2.237872, 0.2941177, 0, 1, 1,
0.5483706, -0.0736932, 2.407631, 0.3019608, 0, 1, 1,
0.5503443, 0.2928021, 0.3620903, 0.3098039, 0, 1, 1,
0.5524833, -0.1029472, 3.572479, 0.3137255, 0, 1, 1,
0.5547464, -1.130522, 4.362962, 0.3215686, 0, 1, 1,
0.5634921, -0.4408902, 1.016868, 0.3254902, 0, 1, 1,
0.5650087, -0.4718477, 2.354754, 0.3333333, 0, 1, 1,
0.565303, -0.5864578, 0.8706005, 0.3372549, 0, 1, 1,
0.5670545, -1.343554, 3.521012, 0.345098, 0, 1, 1,
0.57102, 0.4252127, 1.33356, 0.3490196, 0, 1, 1,
0.5737895, 0.9200726, 0.9956812, 0.3568628, 0, 1, 1,
0.5793906, -0.6387867, 4.287613, 0.3607843, 0, 1, 1,
0.5820905, -0.9722116, -0.07578184, 0.3686275, 0, 1, 1,
0.5831878, -1.116571, 1.406255, 0.372549, 0, 1, 1,
0.5877904, -0.542654, 2.103142, 0.3803922, 0, 1, 1,
0.5929248, 0.6226239, 1.521911, 0.3843137, 0, 1, 1,
0.5933639, 1.652573, 0.432859, 0.3921569, 0, 1, 1,
0.5969338, -0.1739009, 1.065405, 0.3960784, 0, 1, 1,
0.6007021, 0.2404478, 1.575314, 0.4039216, 0, 1, 1,
0.6087255, 0.7263134, -1.100019, 0.4117647, 0, 1, 1,
0.6104947, 0.2315022, 0.1881279, 0.4156863, 0, 1, 1,
0.6141068, -0.6807826, 1.195821, 0.4235294, 0, 1, 1,
0.6168236, 0.7044278, 1.055507, 0.427451, 0, 1, 1,
0.6180764, -1.190999, 0.8528447, 0.4352941, 0, 1, 1,
0.6198304, 0.4771842, 2.409286, 0.4392157, 0, 1, 1,
0.6251847, -0.1936449, 0.9088013, 0.4470588, 0, 1, 1,
0.6256278, 0.1449605, 0.3000798, 0.4509804, 0, 1, 1,
0.6310868, -0.4808165, 3.21991, 0.4588235, 0, 1, 1,
0.6312179, 0.329344, 0.3509635, 0.4627451, 0, 1, 1,
0.635137, -0.8910335, 1.230368, 0.4705882, 0, 1, 1,
0.6353183, 1.337169, 1.227477, 0.4745098, 0, 1, 1,
0.639362, 0.6052511, -0.2687913, 0.4823529, 0, 1, 1,
0.6398972, 0.09685076, 1.384009, 0.4862745, 0, 1, 1,
0.6442842, -0.03464806, 2.026352, 0.4941176, 0, 1, 1,
0.6532028, -0.9026916, 4.071402, 0.5019608, 0, 1, 1,
0.6565018, -0.4752052, 1.203253, 0.5058824, 0, 1, 1,
0.6568668, -2.158344, 3.324544, 0.5137255, 0, 1, 1,
0.6628032, -1.428971, 1.744326, 0.5176471, 0, 1, 1,
0.6638079, 0.2184432, 2.291546, 0.5254902, 0, 1, 1,
0.6640145, -0.8078706, 2.050887, 0.5294118, 0, 1, 1,
0.6704937, 1.159907, 0.07049404, 0.5372549, 0, 1, 1,
0.6743217, -0.6531579, 2.954949, 0.5411765, 0, 1, 1,
0.6762094, -1.164065, 0.8984426, 0.5490196, 0, 1, 1,
0.6826472, -1.788091, 1.174428, 0.5529412, 0, 1, 1,
0.6856992, 0.9598438, 0.6974427, 0.5607843, 0, 1, 1,
0.6935887, 0.004693685, 1.629436, 0.5647059, 0, 1, 1,
0.6994257, 1.279119, 0.2341014, 0.572549, 0, 1, 1,
0.7014282, -1.582585, 3.733928, 0.5764706, 0, 1, 1,
0.7072511, 2.229913, 0.80002, 0.5843138, 0, 1, 1,
0.7074262, -1.405439, 3.190658, 0.5882353, 0, 1, 1,
0.7107224, 1.96773, 0.3931971, 0.5960785, 0, 1, 1,
0.7218817, -0.4726616, 1.700717, 0.6039216, 0, 1, 1,
0.7230139, -2.967019, 2.70256, 0.6078432, 0, 1, 1,
0.7246911, -0.4035669, 2.969863, 0.6156863, 0, 1, 1,
0.7266251, -1.508699, 4.157276, 0.6196079, 0, 1, 1,
0.7301127, -1.530746, 4.001434, 0.627451, 0, 1, 1,
0.7304757, -0.2479048, 2.783175, 0.6313726, 0, 1, 1,
0.7310598, -0.4589496, 2.684076, 0.6392157, 0, 1, 1,
0.7360762, 0.06122836, -0.1228571, 0.6431373, 0, 1, 1,
0.7402725, 0.3121916, 0.896996, 0.6509804, 0, 1, 1,
0.7408365, 1.407919, 2.7147, 0.654902, 0, 1, 1,
0.7490879, 0.03068358, -0.1640178, 0.6627451, 0, 1, 1,
0.7529591, 0.3448248, 0.4304756, 0.6666667, 0, 1, 1,
0.7543353, -0.3930583, 3.279263, 0.6745098, 0, 1, 1,
0.7582039, -1.399449, 3.270958, 0.6784314, 0, 1, 1,
0.7639776, 0.1924556, 1.856794, 0.6862745, 0, 1, 1,
0.7738378, 1.041636, 0.428869, 0.6901961, 0, 1, 1,
0.7746981, -0.03079029, 1.564977, 0.6980392, 0, 1, 1,
0.7757117, -1.13581, 2.404002, 0.7058824, 0, 1, 1,
0.7769032, -0.3202833, 0.563658, 0.7098039, 0, 1, 1,
0.7813085, -0.3813458, 2.483264, 0.7176471, 0, 1, 1,
0.7842247, 0.3951483, 2.687565, 0.7215686, 0, 1, 1,
0.7860945, 0.4273571, 0.5034724, 0.7294118, 0, 1, 1,
0.7886932, 0.3524302, 2.744758, 0.7333333, 0, 1, 1,
0.7904828, -0.3199787, 0.9528965, 0.7411765, 0, 1, 1,
0.7928845, 1.032442, 1.728368, 0.7450981, 0, 1, 1,
0.7929354, -0.9184512, 1.646642, 0.7529412, 0, 1, 1,
0.7938101, 1.381144, 0.5687979, 0.7568628, 0, 1, 1,
0.7990808, 0.2671161, 2.112261, 0.7647059, 0, 1, 1,
0.7999106, 0.07750822, 2.040803, 0.7686275, 0, 1, 1,
0.8004943, -0.201668, -0.8407862, 0.7764706, 0, 1, 1,
0.8015963, 0.2311982, 3.094246, 0.7803922, 0, 1, 1,
0.8065042, 1.038276, -0.09027237, 0.7882353, 0, 1, 1,
0.808024, -0.3022387, 1.943908, 0.7921569, 0, 1, 1,
0.8139989, 1.959458, -0.004972377, 0.8, 0, 1, 1,
0.8149956, -0.1602165, 1.483069, 0.8078431, 0, 1, 1,
0.8161348, -0.3733119, 2.359874, 0.8117647, 0, 1, 1,
0.8164139, 0.1813036, 0.2451417, 0.8196079, 0, 1, 1,
0.8204195, -0.6486773, 1.085522, 0.8235294, 0, 1, 1,
0.8230968, -0.6305447, 2.954953, 0.8313726, 0, 1, 1,
0.8253026, -1.562057, 5.372575, 0.8352941, 0, 1, 1,
0.8276606, 0.3693271, 1.201133, 0.8431373, 0, 1, 1,
0.8276702, -0.5901805, 3.069052, 0.8470588, 0, 1, 1,
0.828257, -1.898194, 2.792607, 0.854902, 0, 1, 1,
0.830047, -1.756077, 2.32903, 0.8588235, 0, 1, 1,
0.8306968, 0.7198754, 2.194372, 0.8666667, 0, 1, 1,
0.8478854, 0.2324335, 1.156667, 0.8705882, 0, 1, 1,
0.8478937, 0.06157401, 0.04420656, 0.8784314, 0, 1, 1,
0.8519623, -0.7304911, 2.846671, 0.8823529, 0, 1, 1,
0.8700305, -0.9526806, 1.326444, 0.8901961, 0, 1, 1,
0.8741362, 0.633571, 3.199586, 0.8941177, 0, 1, 1,
0.8772906, -1.757395, 2.845491, 0.9019608, 0, 1, 1,
0.8812142, 0.9670833, 1.586686, 0.9098039, 0, 1, 1,
0.881669, 1.051705, 0.5919433, 0.9137255, 0, 1, 1,
0.8848025, 0.1352004, 2.157635, 0.9215686, 0, 1, 1,
0.889046, 0.08278602, 2.037441, 0.9254902, 0, 1, 1,
0.8916295, -0.5747575, 2.012448, 0.9333333, 0, 1, 1,
0.8917899, 0.08534339, 2.283029, 0.9372549, 0, 1, 1,
0.8939549, -0.4610003, 2.353913, 0.945098, 0, 1, 1,
0.9003173, 1.783999, -0.4146168, 0.9490196, 0, 1, 1,
0.901369, 1.393511, 1.435539, 0.9568627, 0, 1, 1,
0.9014295, -2.001566, 1.57993, 0.9607843, 0, 1, 1,
0.9022554, 0.3946962, 1.722136, 0.9686275, 0, 1, 1,
0.9038442, -0.8387218, 3.201852, 0.972549, 0, 1, 1,
0.9044387, -0.2992896, 2.060565, 0.9803922, 0, 1, 1,
0.9050753, -0.3424174, 1.277021, 0.9843137, 0, 1, 1,
0.9156427, -0.5618623, -0.205948, 0.9921569, 0, 1, 1,
0.9176169, -0.05602069, 2.222572, 0.9960784, 0, 1, 1,
0.9185887, -1.292729, 1.3586, 1, 0, 0.9960784, 1,
0.9203729, -0.2918709, 1.078178, 1, 0, 0.9882353, 1,
0.9212395, -0.1325285, 3.261873, 1, 0, 0.9843137, 1,
0.9263682, 0.7028285, 0.501003, 1, 0, 0.9764706, 1,
0.9326481, 1.545803, -0.397262, 1, 0, 0.972549, 1,
0.9328109, 1.732214, 0.6715348, 1, 0, 0.9647059, 1,
0.9344744, -0.0768714, 2.132386, 1, 0, 0.9607843, 1,
0.9345108, 0.05593023, 0.5168379, 1, 0, 0.9529412, 1,
0.9404179, 0.1132218, -0.6205035, 1, 0, 0.9490196, 1,
0.9438766, 1.525557, 0.556267, 1, 0, 0.9411765, 1,
0.9439246, 0.3343721, 0.9131458, 1, 0, 0.9372549, 1,
0.9444568, 0.1143618, 1.8949, 1, 0, 0.9294118, 1,
0.9488401, -0.2388442, 2.165897, 1, 0, 0.9254902, 1,
0.9493235, -1.344263, 1.188468, 1, 0, 0.9176471, 1,
0.9534016, -0.1337677, 3.464617, 1, 0, 0.9137255, 1,
0.9543509, -0.3828956, 1.882959, 1, 0, 0.9058824, 1,
0.960867, -0.1212988, 1.692562, 1, 0, 0.9019608, 1,
0.961431, 0.3320513, 0.519253, 1, 0, 0.8941177, 1,
0.9621748, -0.7869068, 1.586969, 1, 0, 0.8862745, 1,
0.9654603, 0.008518443, 1.194976, 1, 0, 0.8823529, 1,
0.9755054, -0.5615001, 3.487412, 1, 0, 0.8745098, 1,
0.9756578, -1.194007, 3.212591, 1, 0, 0.8705882, 1,
0.988714, 1.097673, 0.449103, 1, 0, 0.8627451, 1,
1.000872, -0.7028745, 3.181451, 1, 0, 0.8588235, 1,
1.001702, 0.1348281, 1.706627, 1, 0, 0.8509804, 1,
1.006639, 1.04658, 1.728045, 1, 0, 0.8470588, 1,
1.011255, -1.932863, 1.928735, 1, 0, 0.8392157, 1,
1.021266, -1.475739, 3.151437, 1, 0, 0.8352941, 1,
1.030453, -1.183929, 2.527186, 1, 0, 0.827451, 1,
1.038696, -0.7546756, 4.367766, 1, 0, 0.8235294, 1,
1.047459, 1.796161, 0.1532386, 1, 0, 0.8156863, 1,
1.051262, -1.646322, 2.91146, 1, 0, 0.8117647, 1,
1.053213, -0.4030854, 0.4597434, 1, 0, 0.8039216, 1,
1.053867, 0.001806067, 0.4687212, 1, 0, 0.7960784, 1,
1.058464, -0.5235611, 2.644464, 1, 0, 0.7921569, 1,
1.060358, -0.3091351, 2.170917, 1, 0, 0.7843137, 1,
1.060495, -1.003281, 2.144425, 1, 0, 0.7803922, 1,
1.060503, 0.1308701, 1.692858, 1, 0, 0.772549, 1,
1.061506, 1.491805, 1.03972, 1, 0, 0.7686275, 1,
1.06155, -0.2572665, 0.591086, 1, 0, 0.7607843, 1,
1.067974, -0.9906642, 1.617313, 1, 0, 0.7568628, 1,
1.069874, -0.1096271, 2.625981, 1, 0, 0.7490196, 1,
1.077553, -0.8342499, 2.225002, 1, 0, 0.7450981, 1,
1.098453, -0.6753055, 3.283251, 1, 0, 0.7372549, 1,
1.109116, -0.4009333, 1.838446, 1, 0, 0.7333333, 1,
1.111353, 1.871845, -0.3430231, 1, 0, 0.7254902, 1,
1.11641, -0.5228431, 2.165992, 1, 0, 0.7215686, 1,
1.127435, 1.94944, 0.7706968, 1, 0, 0.7137255, 1,
1.136081, 2.003693, 0.8351986, 1, 0, 0.7098039, 1,
1.143417, 1.006704, -0.5879336, 1, 0, 0.7019608, 1,
1.147568, 0.7972438, -0.4543464, 1, 0, 0.6941177, 1,
1.151862, 0.4687115, 1.115921, 1, 0, 0.6901961, 1,
1.18654, 0.1962202, -0.0987995, 1, 0, 0.682353, 1,
1.195321, 2.607837, 0.8073649, 1, 0, 0.6784314, 1,
1.197094, -0.0924588, 2.155235, 1, 0, 0.6705883, 1,
1.199605, 0.6608483, 1.239606, 1, 0, 0.6666667, 1,
1.20532, -1.003531, 1.408313, 1, 0, 0.6588235, 1,
1.220278, 3.159223, 2.05656, 1, 0, 0.654902, 1,
1.221896, 0.5015549, 1.79756, 1, 0, 0.6470588, 1,
1.236737, 0.1950475, 0.7181636, 1, 0, 0.6431373, 1,
1.249903, 0.9817873, 1.1701, 1, 0, 0.6352941, 1,
1.254133, 0.5981386, 0.7778924, 1, 0, 0.6313726, 1,
1.255452, -0.3726819, 3.11799, 1, 0, 0.6235294, 1,
1.257016, -1.342814, 2.097823, 1, 0, 0.6196079, 1,
1.263039, 0.5500544, 2.216462, 1, 0, 0.6117647, 1,
1.271804, -0.2922473, 2.779258, 1, 0, 0.6078432, 1,
1.272409, -2.356185, 4.186842, 1, 0, 0.6, 1,
1.272993, -1.323724, 2.040485, 1, 0, 0.5921569, 1,
1.278554, 1.889115, 0.5035612, 1, 0, 0.5882353, 1,
1.281498, 0.6775643, 1.150939, 1, 0, 0.5803922, 1,
1.286078, -0.2990194, 1.652674, 1, 0, 0.5764706, 1,
1.288649, -1.566128, 1.729441, 1, 0, 0.5686275, 1,
1.288946, -0.2498248, 3.079866, 1, 0, 0.5647059, 1,
1.295836, -1.314996, 2.438521, 1, 0, 0.5568628, 1,
1.296824, -1.52645, 2.020717, 1, 0, 0.5529412, 1,
1.297836, 1.701, 1.421629, 1, 0, 0.5450981, 1,
1.311428, -0.9327105, 1.263829, 1, 0, 0.5411765, 1,
1.328801, 0.3363104, 2.516377, 1, 0, 0.5333334, 1,
1.337852, -2.005183, 3.419104, 1, 0, 0.5294118, 1,
1.346758, -0.03479332, 1.882665, 1, 0, 0.5215687, 1,
1.352952, -0.7659486, 2.180139, 1, 0, 0.5176471, 1,
1.360538, 0.4656406, 2.087812, 1, 0, 0.509804, 1,
1.369539, -1.588018, 1.727676, 1, 0, 0.5058824, 1,
1.373307, 0.30819, 1.921665, 1, 0, 0.4980392, 1,
1.373607, 0.1886422, 2.427122, 1, 0, 0.4901961, 1,
1.374998, -0.2703383, 2.264968, 1, 0, 0.4862745, 1,
1.379471, -1.274721, 2.0959, 1, 0, 0.4784314, 1,
1.385775, -0.6528271, 2.34081, 1, 0, 0.4745098, 1,
1.396751, 0.9975794, 3.278111, 1, 0, 0.4666667, 1,
1.39868, 0.6031106, 0.5508628, 1, 0, 0.4627451, 1,
1.398746, 1.895614, 0.3195076, 1, 0, 0.454902, 1,
1.406355, 0.1892303, 2.382766, 1, 0, 0.4509804, 1,
1.406901, -0.200232, 1.939122, 1, 0, 0.4431373, 1,
1.421649, 1.399975, -0.4598507, 1, 0, 0.4392157, 1,
1.426103, -1.333024, 0.7003123, 1, 0, 0.4313726, 1,
1.430833, -0.02619322, 0.9115213, 1, 0, 0.427451, 1,
1.434603, 0.8206111, 0.9594773, 1, 0, 0.4196078, 1,
1.43606, 0.1695929, 0.6515169, 1, 0, 0.4156863, 1,
1.452105, -0.01709971, 0.8633583, 1, 0, 0.4078431, 1,
1.460804, -1.016589, 1.077837, 1, 0, 0.4039216, 1,
1.461571, 0.6369349, 0.8713624, 1, 0, 0.3960784, 1,
1.470895, 2.261358, -1.118783, 1, 0, 0.3882353, 1,
1.471401, 0.1140236, 0.970611, 1, 0, 0.3843137, 1,
1.473266, -1.202479, 3.484468, 1, 0, 0.3764706, 1,
1.478907, -1.294363, 2.357852, 1, 0, 0.372549, 1,
1.4967, 1.55146, 2.109987, 1, 0, 0.3647059, 1,
1.500789, 0.3924542, 1.511155, 1, 0, 0.3607843, 1,
1.501175, -0.2539422, 0.9865198, 1, 0, 0.3529412, 1,
1.509447, -0.6243578, 0.7832131, 1, 0, 0.3490196, 1,
1.513269, -0.7005937, 0.4684947, 1, 0, 0.3411765, 1,
1.513391, 1.24587, 0.8142151, 1, 0, 0.3372549, 1,
1.516751, 0.6352072, 1.679621, 1, 0, 0.3294118, 1,
1.534639, -1.346742, 3.542982, 1, 0, 0.3254902, 1,
1.582732, -0.5668095, 2.463176, 1, 0, 0.3176471, 1,
1.584857, 0.0004590396, 1.411436, 1, 0, 0.3137255, 1,
1.586078, 1.545148, 1.149678, 1, 0, 0.3058824, 1,
1.592125, -1.324358, 2.736903, 1, 0, 0.2980392, 1,
1.596326, 0.5085789, 0.4211183, 1, 0, 0.2941177, 1,
1.608741, -0.1880439, 2.08874, 1, 0, 0.2862745, 1,
1.622397, 1.283467, -0.896041, 1, 0, 0.282353, 1,
1.628272, -1.205967, 1.08966, 1, 0, 0.2745098, 1,
1.630495, 0.7599393, 0.7339709, 1, 0, 0.2705882, 1,
1.645251, -1.943901, 2.757939, 1, 0, 0.2627451, 1,
1.647515, -1.793184, 2.032604, 1, 0, 0.2588235, 1,
1.66291, 1.225084, 0.4010962, 1, 0, 0.2509804, 1,
1.665067, 0.07418911, 2.14657, 1, 0, 0.2470588, 1,
1.669238, -2.629777, 3.377387, 1, 0, 0.2392157, 1,
1.672808, 0.2515096, 1.628593, 1, 0, 0.2352941, 1,
1.69053, -1.884862, 1.052366, 1, 0, 0.227451, 1,
1.708289, 0.7747959, -1.585225, 1, 0, 0.2235294, 1,
1.721467, -0.2726985, 3.285347, 1, 0, 0.2156863, 1,
1.734716, 0.3234467, -0.07515384, 1, 0, 0.2117647, 1,
1.758011, 0.9605484, 2.324702, 1, 0, 0.2039216, 1,
1.771601, 0.7152276, 0.3899049, 1, 0, 0.1960784, 1,
1.793555, -0.1897465, 0.02908029, 1, 0, 0.1921569, 1,
1.810874, -0.18725, 2.156616, 1, 0, 0.1843137, 1,
1.818387, -0.7934016, 0.7451415, 1, 0, 0.1803922, 1,
1.845687, -0.5291926, 1.183072, 1, 0, 0.172549, 1,
1.864623, -0.03343761, 0.80825, 1, 0, 0.1686275, 1,
1.867209, -0.1540953, -0.1950094, 1, 0, 0.1607843, 1,
1.87757, -0.1793883, 0.679983, 1, 0, 0.1568628, 1,
1.880417, -1.155055, 2.309942, 1, 0, 0.1490196, 1,
1.93721, -0.8495802, 0.7654708, 1, 0, 0.145098, 1,
1.973624, -0.08184253, 0.1103318, 1, 0, 0.1372549, 1,
1.996856, -1.423492, 3.453234, 1, 0, 0.1333333, 1,
2.00167, 0.575676, 2.681049, 1, 0, 0.1254902, 1,
2.005362, -1.756991, 1.932386, 1, 0, 0.1215686, 1,
2.013883, 0.01573658, 0.3031788, 1, 0, 0.1137255, 1,
2.060433, -2.077091, -0.3233146, 1, 0, 0.1098039, 1,
2.107705, -0.7795907, 1.099008, 1, 0, 0.1019608, 1,
2.117478, 1.616296, 1.390845, 1, 0, 0.09411765, 1,
2.129338, 0.9527408, 2.031333, 1, 0, 0.09019608, 1,
2.146271, 0.4307326, -0.5654479, 1, 0, 0.08235294, 1,
2.156157, -0.03469062, 1.912206, 1, 0, 0.07843138, 1,
2.219671, 0.7346837, 2.476083, 1, 0, 0.07058824, 1,
2.235791, -1.419546, 3.305945, 1, 0, 0.06666667, 1,
2.267244, 0.1372023, 0.1993121, 1, 0, 0.05882353, 1,
2.296603, -0.02114398, 2.40227, 1, 0, 0.05490196, 1,
2.301521, 1.613933, 0.6306419, 1, 0, 0.04705882, 1,
2.399636, 1.360472, -0.09503616, 1, 0, 0.04313726, 1,
2.407341, -1.589954, 2.296005, 1, 0, 0.03529412, 1,
2.530077, 1.06351, 1.543671, 1, 0, 0.03137255, 1,
2.559711, -0.5421687, 2.316109, 1, 0, 0.02352941, 1,
2.65379, 0.3135689, 0.3209648, 1, 0, 0.01960784, 1,
2.837357, 1.289768, 0.7867781, 1, 0, 0.01176471, 1,
2.963616, -0.9698382, 2.208572, 1, 0, 0.007843138, 1
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
0.02963543, -4.162425, -6.991755, 0, -0.5, 0.5, 0.5,
0.02963543, -4.162425, -6.991755, 1, -0.5, 0.5, 0.5,
0.02963543, -4.162425, -6.991755, 1, 1.5, 0.5, 0.5,
0.02963543, -4.162425, -6.991755, 0, 1.5, 0.5, 0.5
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
-3.898965, 0.02897573, -6.991755, 0, -0.5, 0.5, 0.5,
-3.898965, 0.02897573, -6.991755, 1, -0.5, 0.5, 0.5,
-3.898965, 0.02897573, -6.991755, 1, 1.5, 0.5, 0.5,
-3.898965, 0.02897573, -6.991755, 0, 1.5, 0.5, 0.5
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
-3.898965, -4.162425, 0.3272998, 0, -0.5, 0.5, 0.5,
-3.898965, -4.162425, 0.3272998, 1, -0.5, 0.5, 0.5,
-3.898965, -4.162425, 0.3272998, 1, 1.5, 0.5, 0.5,
-3.898965, -4.162425, 0.3272998, 0, 1.5, 0.5, 0.5
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
-2, -3.195179, -5.302742,
2, -3.195179, -5.302742,
-2, -3.195179, -5.302742,
-2, -3.356386, -5.584244,
-1, -3.195179, -5.302742,
-1, -3.356386, -5.584244,
0, -3.195179, -5.302742,
0, -3.356386, -5.584244,
1, -3.195179, -5.302742,
1, -3.356386, -5.584244,
2, -3.195179, -5.302742,
2, -3.356386, -5.584244
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
-2, -3.678802, -6.147248, 0, -0.5, 0.5, 0.5,
-2, -3.678802, -6.147248, 1, -0.5, 0.5, 0.5,
-2, -3.678802, -6.147248, 1, 1.5, 0.5, 0.5,
-2, -3.678802, -6.147248, 0, 1.5, 0.5, 0.5,
-1, -3.678802, -6.147248, 0, -0.5, 0.5, 0.5,
-1, -3.678802, -6.147248, 1, -0.5, 0.5, 0.5,
-1, -3.678802, -6.147248, 1, 1.5, 0.5, 0.5,
-1, -3.678802, -6.147248, 0, 1.5, 0.5, 0.5,
0, -3.678802, -6.147248, 0, -0.5, 0.5, 0.5,
0, -3.678802, -6.147248, 1, -0.5, 0.5, 0.5,
0, -3.678802, -6.147248, 1, 1.5, 0.5, 0.5,
0, -3.678802, -6.147248, 0, 1.5, 0.5, 0.5,
1, -3.678802, -6.147248, 0, -0.5, 0.5, 0.5,
1, -3.678802, -6.147248, 1, -0.5, 0.5, 0.5,
1, -3.678802, -6.147248, 1, 1.5, 0.5, 0.5,
1, -3.678802, -6.147248, 0, 1.5, 0.5, 0.5,
2, -3.678802, -6.147248, 0, -0.5, 0.5, 0.5,
2, -3.678802, -6.147248, 1, -0.5, 0.5, 0.5,
2, -3.678802, -6.147248, 1, 1.5, 0.5, 0.5,
2, -3.678802, -6.147248, 0, 1.5, 0.5, 0.5
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
-2.992365, -3, -5.302742,
-2.992365, 3, -5.302742,
-2.992365, -3, -5.302742,
-3.143465, -3, -5.584244,
-2.992365, -2, -5.302742,
-3.143465, -2, -5.584244,
-2.992365, -1, -5.302742,
-3.143465, -1, -5.584244,
-2.992365, 0, -5.302742,
-3.143465, 0, -5.584244,
-2.992365, 1, -5.302742,
-3.143465, 1, -5.584244,
-2.992365, 2, -5.302742,
-3.143465, 2, -5.584244,
-2.992365, 3, -5.302742,
-3.143465, 3, -5.584244
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
-3.445665, -3, -6.147248, 0, -0.5, 0.5, 0.5,
-3.445665, -3, -6.147248, 1, -0.5, 0.5, 0.5,
-3.445665, -3, -6.147248, 1, 1.5, 0.5, 0.5,
-3.445665, -3, -6.147248, 0, 1.5, 0.5, 0.5,
-3.445665, -2, -6.147248, 0, -0.5, 0.5, 0.5,
-3.445665, -2, -6.147248, 1, -0.5, 0.5, 0.5,
-3.445665, -2, -6.147248, 1, 1.5, 0.5, 0.5,
-3.445665, -2, -6.147248, 0, 1.5, 0.5, 0.5,
-3.445665, -1, -6.147248, 0, -0.5, 0.5, 0.5,
-3.445665, -1, -6.147248, 1, -0.5, 0.5, 0.5,
-3.445665, -1, -6.147248, 1, 1.5, 0.5, 0.5,
-3.445665, -1, -6.147248, 0, 1.5, 0.5, 0.5,
-3.445665, 0, -6.147248, 0, -0.5, 0.5, 0.5,
-3.445665, 0, -6.147248, 1, -0.5, 0.5, 0.5,
-3.445665, 0, -6.147248, 1, 1.5, 0.5, 0.5,
-3.445665, 0, -6.147248, 0, 1.5, 0.5, 0.5,
-3.445665, 1, -6.147248, 0, -0.5, 0.5, 0.5,
-3.445665, 1, -6.147248, 1, -0.5, 0.5, 0.5,
-3.445665, 1, -6.147248, 1, 1.5, 0.5, 0.5,
-3.445665, 1, -6.147248, 0, 1.5, 0.5, 0.5,
-3.445665, 2, -6.147248, 0, -0.5, 0.5, 0.5,
-3.445665, 2, -6.147248, 1, -0.5, 0.5, 0.5,
-3.445665, 2, -6.147248, 1, 1.5, 0.5, 0.5,
-3.445665, 2, -6.147248, 0, 1.5, 0.5, 0.5,
-3.445665, 3, -6.147248, 0, -0.5, 0.5, 0.5,
-3.445665, 3, -6.147248, 1, -0.5, 0.5, 0.5,
-3.445665, 3, -6.147248, 1, 1.5, 0.5, 0.5,
-3.445665, 3, -6.147248, 0, 1.5, 0.5, 0.5
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
-2.992365, -3.195179, -4,
-2.992365, -3.195179, 4,
-2.992365, -3.195179, -4,
-3.143465, -3.356386, -4,
-2.992365, -3.195179, -2,
-3.143465, -3.356386, -2,
-2.992365, -3.195179, 0,
-3.143465, -3.356386, 0,
-2.992365, -3.195179, 2,
-3.143465, -3.356386, 2,
-2.992365, -3.195179, 4,
-3.143465, -3.356386, 4
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
-3.445665, -3.678802, -4, 0, -0.5, 0.5, 0.5,
-3.445665, -3.678802, -4, 1, -0.5, 0.5, 0.5,
-3.445665, -3.678802, -4, 1, 1.5, 0.5, 0.5,
-3.445665, -3.678802, -4, 0, 1.5, 0.5, 0.5,
-3.445665, -3.678802, -2, 0, -0.5, 0.5, 0.5,
-3.445665, -3.678802, -2, 1, -0.5, 0.5, 0.5,
-3.445665, -3.678802, -2, 1, 1.5, 0.5, 0.5,
-3.445665, -3.678802, -2, 0, 1.5, 0.5, 0.5,
-3.445665, -3.678802, 0, 0, -0.5, 0.5, 0.5,
-3.445665, -3.678802, 0, 1, -0.5, 0.5, 0.5,
-3.445665, -3.678802, 0, 1, 1.5, 0.5, 0.5,
-3.445665, -3.678802, 0, 0, 1.5, 0.5, 0.5,
-3.445665, -3.678802, 2, 0, -0.5, 0.5, 0.5,
-3.445665, -3.678802, 2, 1, -0.5, 0.5, 0.5,
-3.445665, -3.678802, 2, 1, 1.5, 0.5, 0.5,
-3.445665, -3.678802, 2, 0, 1.5, 0.5, 0.5,
-3.445665, -3.678802, 4, 0, -0.5, 0.5, 0.5,
-3.445665, -3.678802, 4, 1, -0.5, 0.5, 0.5,
-3.445665, -3.678802, 4, 1, 1.5, 0.5, 0.5,
-3.445665, -3.678802, 4, 0, 1.5, 0.5, 0.5
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
-2.992365, -3.195179, -5.302742,
-2.992365, 3.25313, -5.302742,
-2.992365, -3.195179, 5.957342,
-2.992365, 3.25313, 5.957342,
-2.992365, -3.195179, -5.302742,
-2.992365, -3.195179, 5.957342,
-2.992365, 3.25313, -5.302742,
-2.992365, 3.25313, 5.957342,
-2.992365, -3.195179, -5.302742,
3.051636, -3.195179, -5.302742,
-2.992365, -3.195179, 5.957342,
3.051636, -3.195179, 5.957342,
-2.992365, 3.25313, -5.302742,
3.051636, 3.25313, -5.302742,
-2.992365, 3.25313, 5.957342,
3.051636, 3.25313, 5.957342,
3.051636, -3.195179, -5.302742,
3.051636, 3.25313, -5.302742,
3.051636, -3.195179, 5.957342,
3.051636, 3.25313, 5.957342,
3.051636, -3.195179, -5.302742,
3.051636, -3.195179, 5.957342,
3.051636, 3.25313, -5.302742,
3.051636, 3.25313, 5.957342
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
var radius = 7.643576;
var distance = 34.00713;
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
mvMatrix.translate( -0.02963543, -0.02897573, -0.3272998 );
mvMatrix.scale( 1.36737, 1.281636, 0.733954 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.00713);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
isoxazole_5-cyclopro<-read.table("isoxazole_5-cyclopro.xyz", skip=1)
```

```
## Error in isoxazole_5 - cyclopro <- read.table("isoxazole_5-cyclopro.xyz", : object 'isoxazole_5' not found
```

```r
x<-isoxazole_5-cyclopro$V2
```

```
## Error in eval(expr, envir, enclos): object 'isoxazole_5' not found
```

```r
y<-isoxazole_5-cyclopro$V3
```

```
## Error in eval(expr, envir, enclos): object 'isoxazole_5' not found
```

```r
z<-isoxazole_5-cyclopro$V4
```

```
## Error in eval(expr, envir, enclos): object 'isoxazole_5' not found
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
-2.904346, 0.5707962, 0.5296445, 0, 0, 1, 1, 1,
-2.730802, -0.53532, -1.738239, 1, 0, 0, 1, 1,
-2.355544, 1.11758, -0.4311105, 1, 0, 0, 1, 1,
-2.353233, 0.5352062, 0.002286902, 1, 0, 0, 1, 1,
-2.33937, 1.547624, -1.163528, 1, 0, 0, 1, 1,
-2.285537, 0.7921699, -1.695397, 1, 0, 0, 1, 1,
-2.279588, -1.086818, -1.094759, 0, 0, 0, 1, 1,
-2.270291, 0.6864472, -0.8892554, 0, 0, 0, 1, 1,
-2.255752, 0.1432476, -0.859108, 0, 0, 0, 1, 1,
-2.230453, 0.1020646, -1.005461, 0, 0, 0, 1, 1,
-2.1025, 1.298985, 0.7656329, 0, 0, 0, 1, 1,
-2.053139, 0.3152652, -2.416462, 0, 0, 0, 1, 1,
-2.051714, 0.6665342, -1.338826, 0, 0, 0, 1, 1,
-2.037426, -1.00075, -1.755657, 1, 1, 1, 1, 1,
-2.036139, -0.005217457, -1.921062, 1, 1, 1, 1, 1,
-2.026339, 2.026463, -1.405309, 1, 1, 1, 1, 1,
-2.00281, -1.027896, -1.995977, 1, 1, 1, 1, 1,
-1.999245, -0.7701005, -4.371346, 1, 1, 1, 1, 1,
-1.968481, 1.081378, 0.4634708, 1, 1, 1, 1, 1,
-1.928856, -0.04290844, -1.915924, 1, 1, 1, 1, 1,
-1.927046, -0.7739631, -2.556155, 1, 1, 1, 1, 1,
-1.918814, -0.09525197, -1.772874, 1, 1, 1, 1, 1,
-1.907537, -0.999386, -3.096164, 1, 1, 1, 1, 1,
-1.896399, -0.3950901, -0.7181894, 1, 1, 1, 1, 1,
-1.896352, 0.7477657, -1.666996, 1, 1, 1, 1, 1,
-1.88911, -1.695632, -0.3870496, 1, 1, 1, 1, 1,
-1.853327, 1.477732, -0.8326697, 1, 1, 1, 1, 1,
-1.853041, -2.134837, -2.425307, 1, 1, 1, 1, 1,
-1.845214, -0.1528875, -1.698611, 0, 0, 1, 1, 1,
-1.844538, 0.5262644, -1.70333, 1, 0, 0, 1, 1,
-1.844275, 0.2128259, -1.936665, 1, 0, 0, 1, 1,
-1.843869, -0.6651545, -2.206622, 1, 0, 0, 1, 1,
-1.834302, 0.2524707, -2.933864, 1, 0, 0, 1, 1,
-1.794078, 1.533112, -1.435193, 1, 0, 0, 1, 1,
-1.788581, 0.1762669, -2.351993, 0, 0, 0, 1, 1,
-1.730365, -1.21322, -1.999281, 0, 0, 0, 1, 1,
-1.729019, -1.088403, -1.23259, 0, 0, 0, 1, 1,
-1.722013, -0.5196859, 0.07444096, 0, 0, 0, 1, 1,
-1.711497, -0.1710104, -0.966993, 0, 0, 0, 1, 1,
-1.704996, -0.1185783, -1.60703, 0, 0, 0, 1, 1,
-1.693422, 0.7359786, 0.3172508, 0, 0, 0, 1, 1,
-1.685274, -0.3557025, -2.905124, 1, 1, 1, 1, 1,
-1.675967, -0.3353727, -1.451516, 1, 1, 1, 1, 1,
-1.65834, 0.08869038, -2.98957, 1, 1, 1, 1, 1,
-1.651511, -3.101271, -1.703613, 1, 1, 1, 1, 1,
-1.642259, -0.6232581, -1.145436, 1, 1, 1, 1, 1,
-1.639183, -0.639276, -0.4355586, 1, 1, 1, 1, 1,
-1.637246, 0.03025685, -2.571682, 1, 1, 1, 1, 1,
-1.636083, -0.757984, -1.862642, 1, 1, 1, 1, 1,
-1.629356, -0.9136843, -2.877511, 1, 1, 1, 1, 1,
-1.62094, 0.2293156, -2.685179, 1, 1, 1, 1, 1,
-1.616645, -0.4991084, -2.822421, 1, 1, 1, 1, 1,
-1.615359, 1.028244, -1.188082, 1, 1, 1, 1, 1,
-1.606172, 0.6308089, -1.062569, 1, 1, 1, 1, 1,
-1.599813, 1.034931, 0.7930069, 1, 1, 1, 1, 1,
-1.584097, 0.1834905, -0.7070588, 1, 1, 1, 1, 1,
-1.583844, -0.3405123, -0.6950857, 0, 0, 1, 1, 1,
-1.582819, 0.301335, -3.030501, 1, 0, 0, 1, 1,
-1.575899, 0.4110055, -0.04615629, 1, 0, 0, 1, 1,
-1.554978, -1.304622, 0.793162, 1, 0, 0, 1, 1,
-1.544599, -1.329511, -1.380141, 1, 0, 0, 1, 1,
-1.518593, -0.357859, -1.296467, 1, 0, 0, 1, 1,
-1.517292, -0.1063403, -2.728618, 0, 0, 0, 1, 1,
-1.504698, 0.967595, -1.534738, 0, 0, 0, 1, 1,
-1.500636, -1.202819, -2.038311, 0, 0, 0, 1, 1,
-1.500342, -0.5578966, -1.471301, 0, 0, 0, 1, 1,
-1.492698, -1.90602, -3.440521, 0, 0, 0, 1, 1,
-1.491383, 1.864476, 0.3956538, 0, 0, 0, 1, 1,
-1.486569, 1.729723, -1.01175, 0, 0, 0, 1, 1,
-1.480851, -0.3749364, -3.034644, 1, 1, 1, 1, 1,
-1.478288, -0.1842241, -1.07119, 1, 1, 1, 1, 1,
-1.476764, 0.05000535, -1.449305, 1, 1, 1, 1, 1,
-1.463878, 1.466576, -0.1005946, 1, 1, 1, 1, 1,
-1.458955, 0.05993523, -2.053191, 1, 1, 1, 1, 1,
-1.451475, 2.023333, -0.68623, 1, 1, 1, 1, 1,
-1.448449, 0.5040298, -0.5150426, 1, 1, 1, 1, 1,
-1.447426, -0.617056, -3.553842, 1, 1, 1, 1, 1,
-1.442215, 0.1734181, -1.634043, 1, 1, 1, 1, 1,
-1.431268, 1.893085, -0.6293755, 1, 1, 1, 1, 1,
-1.429108, 0.1685909, -1.837547, 1, 1, 1, 1, 1,
-1.415453, -1.049989, -3.195142, 1, 1, 1, 1, 1,
-1.410785, -0.6238366, -0.2807781, 1, 1, 1, 1, 1,
-1.388927, -0.3059915, -2.5892, 1, 1, 1, 1, 1,
-1.370711, -0.6684654, -3.277001, 1, 1, 1, 1, 1,
-1.364168, 1.632117, -0.8271793, 0, 0, 1, 1, 1,
-1.363616, -1.552419, -2.314823, 1, 0, 0, 1, 1,
-1.348218, -1.464007, -1.37956, 1, 0, 0, 1, 1,
-1.339933, 0.8263165, -0.4559882, 1, 0, 0, 1, 1,
-1.336832, 0.143004, -2.601737, 1, 0, 0, 1, 1,
-1.33371, 0.7873967, -1.047005, 1, 0, 0, 1, 1,
-1.328209, -0.1822322, -1.662521, 0, 0, 0, 1, 1,
-1.32399, 0.9652186, -2.835142, 0, 0, 0, 1, 1,
-1.320237, -0.9405756, -2.229347, 0, 0, 0, 1, 1,
-1.315167, 0.7902704, -2.267068, 0, 0, 0, 1, 1,
-1.309751, -0.3512199, -2.554602, 0, 0, 0, 1, 1,
-1.308186, 0.3091044, -0.9071884, 0, 0, 0, 1, 1,
-1.2999, 0.6177087, -1.033589, 0, 0, 0, 1, 1,
-1.296978, 1.802953, -2.187319, 1, 1, 1, 1, 1,
-1.289728, 0.06443659, -2.843858, 1, 1, 1, 1, 1,
-1.288953, 0.8526923, 0.02235062, 1, 1, 1, 1, 1,
-1.282468, 0.3595109, -1.168264, 1, 1, 1, 1, 1,
-1.272422, 1.873143, 1.231914, 1, 1, 1, 1, 1,
-1.264827, -0.3719726, -3.716119, 1, 1, 1, 1, 1,
-1.261357, 0.8483117, 0.5292243, 1, 1, 1, 1, 1,
-1.260278, 0.4823666, -1.228697, 1, 1, 1, 1, 1,
-1.257416, -0.6818745, -3.176454, 1, 1, 1, 1, 1,
-1.250932, -1.242753, -2.452291, 1, 1, 1, 1, 1,
-1.244327, -0.7253644, -1.691186, 1, 1, 1, 1, 1,
-1.226408, 1.204125, -2.234776, 1, 1, 1, 1, 1,
-1.226099, 0.8721454, -0.9772171, 1, 1, 1, 1, 1,
-1.222499, -0.8538979, -2.193847, 1, 1, 1, 1, 1,
-1.220847, 1.045098, -1.191251, 1, 1, 1, 1, 1,
-1.214909, 1.543706, -2.279656, 0, 0, 1, 1, 1,
-1.201218, -0.02446966, -2.405649, 1, 0, 0, 1, 1,
-1.196047, -1.806734, -3.470314, 1, 0, 0, 1, 1,
-1.185787, -0.7161312, -1.107051, 1, 0, 0, 1, 1,
-1.177977, 0.9781075, -2.351406, 1, 0, 0, 1, 1,
-1.172809, -1.357101, -2.425718, 1, 0, 0, 1, 1,
-1.169724, 0.354627, -2.2756, 0, 0, 0, 1, 1,
-1.158537, 0.8360516, -0.3801555, 0, 0, 0, 1, 1,
-1.155512, 1.081727, -0.1516733, 0, 0, 0, 1, 1,
-1.147944, -0.3548386, -1.349433, 0, 0, 0, 1, 1,
-1.145914, -0.7900057, -1.091177, 0, 0, 0, 1, 1,
-1.134779, -2.267868, -1.604205, 0, 0, 0, 1, 1,
-1.132788, -0.3768505, -1.144423, 0, 0, 0, 1, 1,
-1.126648, 0.7902831, -1.301542, 1, 1, 1, 1, 1,
-1.120927, 0.9299708, -2.517622, 1, 1, 1, 1, 1,
-1.114701, -0.387356, -1.707033, 1, 1, 1, 1, 1,
-1.10685, 0.6565729, -0.2062447, 1, 1, 1, 1, 1,
-1.102262, -0.8763468, -3.045569, 1, 1, 1, 1, 1,
-1.099842, 0.2688675, -1.908661, 1, 1, 1, 1, 1,
-1.090823, -0.4600321, -1.724949, 1, 1, 1, 1, 1,
-1.089539, -0.7002214, -2.945555, 1, 1, 1, 1, 1,
-1.087806, 0.2003767, -3.542618, 1, 1, 1, 1, 1,
-1.085386, -0.3547433, -1.890339, 1, 1, 1, 1, 1,
-1.084964, 0.09433351, -0.6348392, 1, 1, 1, 1, 1,
-1.081795, -0.07323492, -2.409863, 1, 1, 1, 1, 1,
-1.076669, 1.183989, -1.403805, 1, 1, 1, 1, 1,
-1.070031, -0.4304839, -1.780357, 1, 1, 1, 1, 1,
-1.067109, 0.02950287, -3.83077, 1, 1, 1, 1, 1,
-1.064458, 0.9110684, -0.7429062, 0, 0, 1, 1, 1,
-1.063183, -1.834226, -1.62419, 1, 0, 0, 1, 1,
-1.058404, 1.863062, -0.593591, 1, 0, 0, 1, 1,
-1.047441, 0.5242463, 0.7300234, 1, 0, 0, 1, 1,
-1.042286, 0.9004567, 0.8933365, 1, 0, 0, 1, 1,
-1.039838, 0.07477807, -3.340353, 1, 0, 0, 1, 1,
-1.037916, -0.4117463, -2.479926, 0, 0, 0, 1, 1,
-1.028332, -0.1388368, -1.074536, 0, 0, 0, 1, 1,
-1.015412, 0.7560173, -1.815782, 0, 0, 0, 1, 1,
-1.014235, -0.006685007, -2.919921, 0, 0, 0, 1, 1,
-1.012638, -0.2405105, -1.289298, 0, 0, 0, 1, 1,
-1.006903, -0.9264743, -2.018744, 0, 0, 0, 1, 1,
-1.006631, 1.46172, -1.308224, 0, 0, 0, 1, 1,
-1.00403, 0.7379186, -2.952945, 1, 1, 1, 1, 1,
-1.001459, -0.6827945, -1.589033, 1, 1, 1, 1, 1,
-1.001363, 0.1318894, -0.7945339, 1, 1, 1, 1, 1,
-1.000636, 0.3791489, -1.222248, 1, 1, 1, 1, 1,
-0.997859, 0.8053609, -0.6257838, 1, 1, 1, 1, 1,
-0.9943935, -1.542488, -3.008667, 1, 1, 1, 1, 1,
-0.9847395, -0.7171896, -2.060771, 1, 1, 1, 1, 1,
-0.9825214, -0.7450662, -1.985753, 1, 1, 1, 1, 1,
-0.9697703, 0.4195394, -2.082242, 1, 1, 1, 1, 1,
-0.9650741, 1.1963, 0.04940757, 1, 1, 1, 1, 1,
-0.960323, 0.09077141, -0.7359948, 1, 1, 1, 1, 1,
-0.9583337, -0.9728214, -2.116698, 1, 1, 1, 1, 1,
-0.9410735, -1.234533, -3.297519, 1, 1, 1, 1, 1,
-0.938951, -0.4351033, -2.626707, 1, 1, 1, 1, 1,
-0.9384363, -0.676992, -1.627068, 1, 1, 1, 1, 1,
-0.938269, 0.1564091, -2.089556, 0, 0, 1, 1, 1,
-0.9378834, 0.7317616, -0.8949501, 1, 0, 0, 1, 1,
-0.9301207, 1.073161, -0.9778421, 1, 0, 0, 1, 1,
-0.9289232, 1.659875, 0.7957491, 1, 0, 0, 1, 1,
-0.9267845, -0.1503742, -0.5308014, 1, 0, 0, 1, 1,
-0.9260388, 1.160175, -3.081205, 1, 0, 0, 1, 1,
-0.9223841, -1.676381, -1.861444, 0, 0, 0, 1, 1,
-0.9192614, -0.1135491, -2.44374, 0, 0, 0, 1, 1,
-0.9190393, -1.536529, -1.533543, 0, 0, 0, 1, 1,
-0.9177309, -0.3529816, -1.435922, 0, 0, 0, 1, 1,
-0.9173558, -2.217603, -1.954695, 0, 0, 0, 1, 1,
-0.9152951, -0.203695, -0.2637469, 0, 0, 0, 1, 1,
-0.8996527, -0.9837543, -2.141929, 0, 0, 0, 1, 1,
-0.8939592, 1.271101, -1.245416, 1, 1, 1, 1, 1,
-0.8937908, -0.647637, -2.754932, 1, 1, 1, 1, 1,
-0.889685, 0.02064766, -3.970596, 1, 1, 1, 1, 1,
-0.8847042, 0.4628116, -1.10447, 1, 1, 1, 1, 1,
-0.8826539, -1.426699, -2.909152, 1, 1, 1, 1, 1,
-0.8792799, 0.706403, -1.801098, 1, 1, 1, 1, 1,
-0.8791324, -0.2130459, -1.918784, 1, 1, 1, 1, 1,
-0.8762853, -2.125871, -3.58917, 1, 1, 1, 1, 1,
-0.8708153, -1.115156, -4.227974, 1, 1, 1, 1, 1,
-0.8688352, 0.4040681, -0.4772081, 1, 1, 1, 1, 1,
-0.8653815, -0.1289472, -1.026254, 1, 1, 1, 1, 1,
-0.8653655, 0.1181538, -2.056462, 1, 1, 1, 1, 1,
-0.8649111, 0.04714151, 1.426334, 1, 1, 1, 1, 1,
-0.8631492, 0.3639448, -0.05808178, 1, 1, 1, 1, 1,
-0.8511062, 1.111653, -0.2699034, 1, 1, 1, 1, 1,
-0.8456464, 0.2904018, 0.7586921, 0, 0, 1, 1, 1,
-0.8456228, -0.1608513, -1.208922, 1, 0, 0, 1, 1,
-0.8345138, -0.1694722, -2.521037, 1, 0, 0, 1, 1,
-0.8311651, -1.840568, -3.179381, 1, 0, 0, 1, 1,
-0.8301696, 1.711679, -1.180064, 1, 0, 0, 1, 1,
-0.8277892, 0.4920661, -0.2950998, 1, 0, 0, 1, 1,
-0.8165396, 1.232292, -1.45782, 0, 0, 0, 1, 1,
-0.8144233, 0.9265422, 0.8335835, 0, 0, 0, 1, 1,
-0.8136219, -2.054544, -3.039779, 0, 0, 0, 1, 1,
-0.8113073, 0.7803938, -1.381864, 0, 0, 0, 1, 1,
-0.8100547, -0.3990055, -2.755893, 0, 0, 0, 1, 1,
-0.8074942, -0.1638732, -2.509681, 0, 0, 0, 1, 1,
-0.8057734, 0.04458936, -2.434007, 0, 0, 0, 1, 1,
-0.8014869, 0.05447091, -2.15669, 1, 1, 1, 1, 1,
-0.7996402, 0.7970271, -2.060517, 1, 1, 1, 1, 1,
-0.7979057, 0.5703869, -0.9026034, 1, 1, 1, 1, 1,
-0.7958971, 0.04596553, -0.5904298, 1, 1, 1, 1, 1,
-0.7935371, -0.1647735, -3.705332, 1, 1, 1, 1, 1,
-0.7915316, -0.9366683, -2.726552, 1, 1, 1, 1, 1,
-0.7910593, 0.8743584, -0.262594, 1, 1, 1, 1, 1,
-0.7888614, -0.2210098, -2.690475, 1, 1, 1, 1, 1,
-0.7868525, -0.3944407, -1.388619, 1, 1, 1, 1, 1,
-0.7846719, 1.259743, -0.9459774, 1, 1, 1, 1, 1,
-0.7785665, 0.4709474, -0.00307987, 1, 1, 1, 1, 1,
-0.7773144, 0.9634077, -0.8727677, 1, 1, 1, 1, 1,
-0.7742296, -0.8809348, -2.809776, 1, 1, 1, 1, 1,
-0.7720701, -0.7137762, -3.824763, 1, 1, 1, 1, 1,
-0.7707341, 0.2814623, -2.024865, 1, 1, 1, 1, 1,
-0.7700207, 0.2809942, -0.82386, 0, 0, 1, 1, 1,
-0.7688023, -0.3062913, -1.389311, 1, 0, 0, 1, 1,
-0.7670634, -1.487478, -1.355872, 1, 0, 0, 1, 1,
-0.7658227, 0.6664778, -0.1736597, 1, 0, 0, 1, 1,
-0.7597547, 0.636741, -2.194482, 1, 0, 0, 1, 1,
-0.7551365, -0.2194818, 0.5481592, 1, 0, 0, 1, 1,
-0.7541078, 0.3479889, -0.5335199, 0, 0, 0, 1, 1,
-0.7500702, 0.995851, -0.07438833, 0, 0, 0, 1, 1,
-0.7490119, -0.2393576, -1.298598, 0, 0, 0, 1, 1,
-0.7367551, -0.7794737, -1.458486, 0, 0, 0, 1, 1,
-0.73544, 1.053569, 0.4469273, 0, 0, 0, 1, 1,
-0.7338468, -0.1984411, -2.208718, 0, 0, 0, 1, 1,
-0.7319006, 1.145832, -2.012966, 0, 0, 0, 1, 1,
-0.7301804, 0.8853524, 0.5089132, 1, 1, 1, 1, 1,
-0.7276884, 0.8935592, 1.181556, 1, 1, 1, 1, 1,
-0.7257753, -0.1918479, -2.909856, 1, 1, 1, 1, 1,
-0.7238092, 1.248865, 0.5125419, 1, 1, 1, 1, 1,
-0.7198287, -0.6703416, -3.816453, 1, 1, 1, 1, 1,
-0.7181695, -0.8165893, -2.992385, 1, 1, 1, 1, 1,
-0.7125524, -0.5754036, -1.80851, 1, 1, 1, 1, 1,
-0.7097261, -1.0307, -3.209154, 1, 1, 1, 1, 1,
-0.7089132, 0.01859854, -1.435672, 1, 1, 1, 1, 1,
-0.7087951, 1.485668, 0.6508723, 1, 1, 1, 1, 1,
-0.7077033, 0.4503969, -1.181877, 1, 1, 1, 1, 1,
-0.7070855, 0.4724573, 0.9701708, 1, 1, 1, 1, 1,
-0.6982043, -0.9260461, -2.774952, 1, 1, 1, 1, 1,
-0.6963163, -1.332414, -2.118876, 1, 1, 1, 1, 1,
-0.6959988, -0.8630038, -2.419224, 1, 1, 1, 1, 1,
-0.6949703, -0.8492432, -1.495206, 0, 0, 1, 1, 1,
-0.6922094, -0.2233236, -1.398867, 1, 0, 0, 1, 1,
-0.6901829, 0.3506874, -2.068047, 1, 0, 0, 1, 1,
-0.6870118, 1.766672, 1.545994, 1, 0, 0, 1, 1,
-0.6810808, -2.981297, -3.407146, 1, 0, 0, 1, 1,
-0.6793236, 0.9873133, 0.7709659, 1, 0, 0, 1, 1,
-0.6784927, -1.179215, -2.359791, 0, 0, 0, 1, 1,
-0.6777346, 0.4318534, -0.5197039, 0, 0, 0, 1, 1,
-0.6771355, 0.05810319, -1.4189, 0, 0, 0, 1, 1,
-0.6713924, -0.1796906, -1.304563, 0, 0, 0, 1, 1,
-0.6687026, 0.3075029, -2.662313, 0, 0, 0, 1, 1,
-0.6598108, -0.1529956, -0.3181501, 0, 0, 0, 1, 1,
-0.6592982, 0.7911569, -2.110031, 0, 0, 0, 1, 1,
-0.6446151, 0.05513274, -2.198548, 1, 1, 1, 1, 1,
-0.6433184, 0.6855189, -2.491988, 1, 1, 1, 1, 1,
-0.6426308, 0.2532136, -2.105083, 1, 1, 1, 1, 1,
-0.6424098, -2.175545, -1.849434, 1, 1, 1, 1, 1,
-0.6409822, -0.1969582, -0.08181883, 1, 1, 1, 1, 1,
-0.6407731, -0.1722433, 0.02083797, 1, 1, 1, 1, 1,
-0.6394385, -1.493119, -2.473647, 1, 1, 1, 1, 1,
-0.638301, 0.05811391, -2.187619, 1, 1, 1, 1, 1,
-0.637949, 1.087862, -1.343691, 1, 1, 1, 1, 1,
-0.6369788, -1.396655, -2.488441, 1, 1, 1, 1, 1,
-0.6337251, 0.9403508, -0.7057858, 1, 1, 1, 1, 1,
-0.6315699, -0.7720506, -2.238566, 1, 1, 1, 1, 1,
-0.6294722, -1.981251, -2.294466, 1, 1, 1, 1, 1,
-0.6289338, 0.03301468, -3.348829, 1, 1, 1, 1, 1,
-0.6286138, -1.430905, -5.037157, 1, 1, 1, 1, 1,
-0.6276253, 0.4279179, -0.7659338, 0, 0, 1, 1, 1,
-0.6214935, 0.1023699, -3.03965, 1, 0, 0, 1, 1,
-0.6107655, 0.8024528, -1.541293, 1, 0, 0, 1, 1,
-0.6090491, -1.651299, -2.030769, 1, 0, 0, 1, 1,
-0.6081768, -0.03446066, -1.720081, 1, 0, 0, 1, 1,
-0.6076348, -0.6656065, -2.068182, 1, 0, 0, 1, 1,
-0.6018339, -0.3734715, -3.852336, 0, 0, 0, 1, 1,
-0.6002638, -0.4096421, -2.385666, 0, 0, 0, 1, 1,
-0.5985917, -0.674871, -2.234917, 0, 0, 0, 1, 1,
-0.5939655, -2.331764, -0.8924993, 0, 0, 0, 1, 1,
-0.5843743, -0.4150276, -2.203782, 0, 0, 0, 1, 1,
-0.5817366, 0.7954531, -1.655348, 0, 0, 0, 1, 1,
-0.5802317, 1.321058, -1.715762, 0, 0, 0, 1, 1,
-0.5748459, -0.6869202, -3.148913, 1, 1, 1, 1, 1,
-0.572684, -1.010996, -2.615968, 1, 1, 1, 1, 1,
-0.5717846, 0.1710754, -1.767071, 1, 1, 1, 1, 1,
-0.570124, 1.050659, 1.114411, 1, 1, 1, 1, 1,
-0.5660477, -0.4321053, -1.152828, 1, 1, 1, 1, 1,
-0.5614456, 0.6457378, -0.7457017, 1, 1, 1, 1, 1,
-0.5608166, 0.8911928, -1.544227, 1, 1, 1, 1, 1,
-0.5470781, -0.5613778, -2.096475, 1, 1, 1, 1, 1,
-0.5448392, -0.08744882, -1.837543, 1, 1, 1, 1, 1,
-0.5384645, -1.556085, -2.579981, 1, 1, 1, 1, 1,
-0.5370615, -2.029701, -3.032315, 1, 1, 1, 1, 1,
-0.5365914, -0.8864845, -4.653184, 1, 1, 1, 1, 1,
-0.5351658, -0.8157656, -2.140592, 1, 1, 1, 1, 1,
-0.533321, 0.889411, -0.7201451, 1, 1, 1, 1, 1,
-0.5312661, 0.3187201, -2.344785, 1, 1, 1, 1, 1,
-0.5285999, 0.02995874, -0.6280313, 0, 0, 1, 1, 1,
-0.5229573, -0.1252121, -2.669577, 1, 0, 0, 1, 1,
-0.5211281, 0.3728746, -2.10324, 1, 0, 0, 1, 1,
-0.5115045, 0.2379058, 0.03230864, 1, 0, 0, 1, 1,
-0.5101231, -0.6192184, -2.971705, 1, 0, 0, 1, 1,
-0.5099674, -0.9887877, -2.218258, 1, 0, 0, 1, 1,
-0.5042737, 1.007612, -1.386652, 0, 0, 0, 1, 1,
-0.5005041, -0.5384971, -3.07749, 0, 0, 0, 1, 1,
-0.492378, 1.385579, -1.720942, 0, 0, 0, 1, 1,
-0.4921349, 2.319807, -0.69876, 0, 0, 0, 1, 1,
-0.4900381, -0.7993081, -3.327718, 0, 0, 0, 1, 1,
-0.487902, 0.3946872, 0.1574008, 0, 0, 0, 1, 1,
-0.487608, 1.656743, 1.1882, 0, 0, 0, 1, 1,
-0.4828685, -1.701758, -2.329325, 1, 1, 1, 1, 1,
-0.4808823, -0.2687666, -1.975804, 1, 1, 1, 1, 1,
-0.4760123, 0.221725, -1.060604, 1, 1, 1, 1, 1,
-0.4726935, 0.8056504, -1.478793, 1, 1, 1, 1, 1,
-0.4724174, 0.2671415, -2.671029, 1, 1, 1, 1, 1,
-0.4719854, 1.689277, -2.002015, 1, 1, 1, 1, 1,
-0.4677579, 0.9750311, -1.430302, 1, 1, 1, 1, 1,
-0.4669084, -1.496107, -1.938231, 1, 1, 1, 1, 1,
-0.4644582, -0.6069355, -2.540752, 1, 1, 1, 1, 1,
-0.4640058, -1.646068, -2.842244, 1, 1, 1, 1, 1,
-0.461448, 0.06083544, -2.54602, 1, 1, 1, 1, 1,
-0.4596227, 1.327054, 0.6713284, 1, 1, 1, 1, 1,
-0.4589685, -0.8511141, -1.900554, 1, 1, 1, 1, 1,
-0.4589641, 0.5441268, -0.8716528, 1, 1, 1, 1, 1,
-0.4551958, 0.2412281, -0.2507381, 1, 1, 1, 1, 1,
-0.4509563, 1.799937, 0.3153048, 0, 0, 1, 1, 1,
-0.4479157, 0.4482248, -1.497962, 1, 0, 0, 1, 1,
-0.4456491, 1.645215, 1.145328, 1, 0, 0, 1, 1,
-0.4412327, 1.865432, -0.935972, 1, 0, 0, 1, 1,
-0.4388543, 0.05756493, -0.4822106, 1, 0, 0, 1, 1,
-0.4383263, 2.217835, -0.3334315, 1, 0, 0, 1, 1,
-0.43579, -0.05870374, -1.089226, 0, 0, 0, 1, 1,
-0.4312843, -0.06554095, -0.9951537, 0, 0, 0, 1, 1,
-0.4275056, -1.516202, -2.897279, 0, 0, 0, 1, 1,
-0.4259259, 0.3142791, -0.6210991, 0, 0, 0, 1, 1,
-0.4251519, -0.966015, -3.940351, 0, 0, 0, 1, 1,
-0.4244428, 1.016078, -1.494893, 0, 0, 0, 1, 1,
-0.4226943, 0.2639706, 0.2735902, 0, 0, 0, 1, 1,
-0.421441, -1.749051, -5.13876, 1, 1, 1, 1, 1,
-0.4201803, 0.1673836, -1.47858, 1, 1, 1, 1, 1,
-0.4131716, -0.7847008, -1.720458, 1, 1, 1, 1, 1,
-0.4112627, 0.3031026, -2.655911, 1, 1, 1, 1, 1,
-0.4111903, 0.7769136, 0.5387404, 1, 1, 1, 1, 1,
-0.406213, 1.24175, -1.530694, 1, 1, 1, 1, 1,
-0.3921706, 1.979062, -1.400333, 1, 1, 1, 1, 1,
-0.3846573, 0.9438323, 1.062075, 1, 1, 1, 1, 1,
-0.3840844, 1.447421, 0.7060115, 1, 1, 1, 1, 1,
-0.3782639, -0.1624436, -1.033975, 1, 1, 1, 1, 1,
-0.3752528, -0.04552489, -0.1172215, 1, 1, 1, 1, 1,
-0.3724062, 0.1183227, -0.9668345, 1, 1, 1, 1, 1,
-0.3708764, 1.757185, 1.446271, 1, 1, 1, 1, 1,
-0.36546, -0.9303936, -2.125415, 1, 1, 1, 1, 1,
-0.3616943, 1.356915, -0.489694, 1, 1, 1, 1, 1,
-0.3567776, 0.6114286, -1.428846, 0, 0, 1, 1, 1,
-0.3560086, -0.1182202, -3.133718, 1, 0, 0, 1, 1,
-0.353832, -2.072352, -2.93586, 1, 0, 0, 1, 1,
-0.3506146, -1.024456, -4.258363, 1, 0, 0, 1, 1,
-0.3483998, 0.2401311, -0.6984512, 1, 0, 0, 1, 1,
-0.3476038, 0.1813126, -2.050427, 1, 0, 0, 1, 1,
-0.3452553, -0.288791, -3.724121, 0, 0, 0, 1, 1,
-0.3443737, 0.4088916, -2.140843, 0, 0, 0, 1, 1,
-0.341148, -0.4000951, -3.005084, 0, 0, 0, 1, 1,
-0.3395216, -1.327175, -3.247745, 0, 0, 0, 1, 1,
-0.3367754, 0.1679687, -2.132403, 0, 0, 0, 1, 1,
-0.3323722, -0.2868049, -1.686647, 0, 0, 0, 1, 1,
-0.3308119, 0.9043851, -0.3311299, 0, 0, 0, 1, 1,
-0.3296461, 0.8884631, -0.1733221, 1, 1, 1, 1, 1,
-0.3278514, -0.1329271, -2.646283, 1, 1, 1, 1, 1,
-0.3265684, 0.09969264, -0.8867067, 1, 1, 1, 1, 1,
-0.3238267, 1.419692, 0.9497093, 1, 1, 1, 1, 1,
-0.3198358, 0.6800018, -0.5334561, 1, 1, 1, 1, 1,
-0.3158786, 0.8285856, -0.7574259, 1, 1, 1, 1, 1,
-0.3106764, -1.292149, -4.43958, 1, 1, 1, 1, 1,
-0.3078178, 1.846111, -0.5911065, 1, 1, 1, 1, 1,
-0.3063588, 0.3129885, -1.848356, 1, 1, 1, 1, 1,
-0.2981624, -0.8540393, -2.684402, 1, 1, 1, 1, 1,
-0.2927272, 0.6331424, -0.3257883, 1, 1, 1, 1, 1,
-0.290101, -0.533427, -2.525484, 1, 1, 1, 1, 1,
-0.289196, 0.3473655, -0.7505371, 1, 1, 1, 1, 1,
-0.2821373, 0.4637871, -1.342655, 1, 1, 1, 1, 1,
-0.2795616, -1.051468, -2.102715, 1, 1, 1, 1, 1,
-0.2759069, 0.1910811, -1.036921, 0, 0, 1, 1, 1,
-0.2754631, 1.145739, -1.000425, 1, 0, 0, 1, 1,
-0.2752505, 0.1072221, -0.897061, 1, 0, 0, 1, 1,
-0.2689147, 1.224736, -0.2115319, 1, 0, 0, 1, 1,
-0.2684049, 0.2310157, -1.425685, 1, 0, 0, 1, 1,
-0.2662648, -0.6516649, -3.578015, 1, 0, 0, 1, 1,
-0.2645387, 1.648464, -0.7544017, 0, 0, 0, 1, 1,
-0.2639582, -1.564952, -2.443448, 0, 0, 0, 1, 1,
-0.2630472, -0.1196426, -2.655122, 0, 0, 0, 1, 1,
-0.2615485, 0.7682722, -0.610711, 0, 0, 0, 1, 1,
-0.2604996, -0.1939901, -2.2278, 0, 0, 0, 1, 1,
-0.2566433, -1.138323, -2.769856, 0, 0, 0, 1, 1,
-0.2536985, 0.1035809, -1.20758, 0, 0, 0, 1, 1,
-0.253562, 2.179415, -1.588122, 1, 1, 1, 1, 1,
-0.2526329, 0.3983402, -2.331503, 1, 1, 1, 1, 1,
-0.2515191, -0.2272584, -1.980028, 1, 1, 1, 1, 1,
-0.2441601, 0.7079584, -1.335366, 1, 1, 1, 1, 1,
-0.2397338, 1.196495, -0.8328141, 1, 1, 1, 1, 1,
-0.2382341, -0.5153329, -3.097884, 1, 1, 1, 1, 1,
-0.2366615, 0.2668676, -1.844751, 1, 1, 1, 1, 1,
-0.2287563, 2.168337, 0.3704681, 1, 1, 1, 1, 1,
-0.2275665, -1.611606, -4.163348, 1, 1, 1, 1, 1,
-0.2260754, -0.3014742, -2.350118, 1, 1, 1, 1, 1,
-0.222599, 1.592335, 0.4124077, 1, 1, 1, 1, 1,
-0.2201868, 0.008049436, -1.334219, 1, 1, 1, 1, 1,
-0.2186674, -1.038452, -3.614636, 1, 1, 1, 1, 1,
-0.2176669, 1.843738, -0.8021551, 1, 1, 1, 1, 1,
-0.2159387, -0.6574342, -2.056295, 1, 1, 1, 1, 1,
-0.2150003, 0.4065495, -0.3703341, 0, 0, 1, 1, 1,
-0.2103942, 1.196995, -0.7625484, 1, 0, 0, 1, 1,
-0.2063816, -0.2094012, -2.152279, 1, 0, 0, 1, 1,
-0.2010409, 0.2109764, -1.92871, 1, 0, 0, 1, 1,
-0.1974564, 0.4894134, -1.285574, 1, 0, 0, 1, 1,
-0.1965631, -1.594034, -3.170036, 1, 0, 0, 1, 1,
-0.1964313, -0.8584548, -3.611039, 0, 0, 0, 1, 1,
-0.1958419, 0.9342837, -0.2116285, 0, 0, 0, 1, 1,
-0.1951921, 1.154885, 0.8528002, 0, 0, 0, 1, 1,
-0.192389, 0.2140305, -0.8050606, 0, 0, 0, 1, 1,
-0.18838, -0.2023123, -1.60136, 0, 0, 0, 1, 1,
-0.1863042, 0.5673485, 2.149999, 0, 0, 0, 1, 1,
-0.1862366, 0.6652659, -0.1237543, 0, 0, 0, 1, 1,
-0.1850178, 0.1372695, -1.742843, 1, 1, 1, 1, 1,
-0.1808486, 1.046787, 0.2126511, 1, 1, 1, 1, 1,
-0.169233, 0.6571003, -0.9229392, 1, 1, 1, 1, 1,
-0.1674826, 0.2540738, -1.388247, 1, 1, 1, 1, 1,
-0.1663315, 0.06447913, -1.697908, 1, 1, 1, 1, 1,
-0.1606886, -1.973464, -5.109577, 1, 1, 1, 1, 1,
-0.1575953, -0.2356254, -4.207746, 1, 1, 1, 1, 1,
-0.1573863, 0.9656062, -2.083577, 1, 1, 1, 1, 1,
-0.1571455, -0.7350751, -1.409239, 1, 1, 1, 1, 1,
-0.156024, 1.695188, -0.8984038, 1, 1, 1, 1, 1,
-0.1502183, 0.7385747, -0.1457487, 1, 1, 1, 1, 1,
-0.1496916, -0.9509257, -2.327844, 1, 1, 1, 1, 1,
-0.1483557, 2.426016, 1.137658, 1, 1, 1, 1, 1,
-0.1480527, -1.481248, -4.432664, 1, 1, 1, 1, 1,
-0.1476629, -0.0588311, -0.7420985, 1, 1, 1, 1, 1,
-0.1453627, -2.454144, -2.9806, 0, 0, 1, 1, 1,
-0.1389018, 0.3595822, -2.583175, 1, 0, 0, 1, 1,
-0.1304408, -0.3459837, -4.814136, 1, 0, 0, 1, 1,
-0.1303672, 0.07594873, 0.290592, 1, 0, 0, 1, 1,
-0.1280008, 1.531482, -1.064538, 1, 0, 0, 1, 1,
-0.1229235, 0.7720816, -0.01869169, 1, 0, 0, 1, 1,
-0.1225292, 1.547569, -0.9282896, 0, 0, 0, 1, 1,
-0.1214386, -1.028976, -2.117031, 0, 0, 0, 1, 1,
-0.1051224, 0.5807319, 0.1960998, 0, 0, 0, 1, 1,
-0.1036279, -0.2987963, -3.142202, 0, 0, 0, 1, 1,
-0.0979636, 0.006036433, -0.1782023, 0, 0, 0, 1, 1,
-0.09495116, 0.7011167, -0.4622539, 0, 0, 0, 1, 1,
-0.09438806, 0.6863393, 0.03391, 0, 0, 0, 1, 1,
-0.08714444, -1.238108, -3.35116, 1, 1, 1, 1, 1,
-0.08485129, 0.3413466, 1.064876, 1, 1, 1, 1, 1,
-0.08185466, -0.3971331, -2.64764, 1, 1, 1, 1, 1,
-0.07195877, 3.15859, 0.102449, 1, 1, 1, 1, 1,
-0.07102189, 0.6849282, -1.293986, 1, 1, 1, 1, 1,
-0.06463391, -1.28971, -4.236323, 1, 1, 1, 1, 1,
-0.06449207, -0.2242677, -2.698723, 1, 1, 1, 1, 1,
-0.06347314, -1.261901, -1.55338, 1, 1, 1, 1, 1,
-0.06274253, -0.8836253, -3.487964, 1, 1, 1, 1, 1,
-0.05328243, -0.04061511, -1.475594, 1, 1, 1, 1, 1,
-0.05116001, -0.5000703, -2.107366, 1, 1, 1, 1, 1,
-0.04303712, 1.097891, -0.610264, 1, 1, 1, 1, 1,
-0.04216981, -0.233041, -2.809124, 1, 1, 1, 1, 1,
-0.04093607, -0.7865554, -2.342267, 1, 1, 1, 1, 1,
-0.03922185, 0.8866429, -0.4602378, 1, 1, 1, 1, 1,
-0.03843132, -2.097529, -2.136175, 0, 0, 1, 1, 1,
-0.03682613, -0.153971, -2.302042, 1, 0, 0, 1, 1,
-0.03287637, -1.064964, -3.678216, 1, 0, 0, 1, 1,
-0.03182352, 0.07640627, 0.3605388, 1, 0, 0, 1, 1,
-0.03125179, -2.789414, -4.177834, 1, 0, 0, 1, 1,
-0.02295678, 1.876347, -0.7240387, 1, 0, 0, 1, 1,
-0.02125103, -0.1500601, -2.434013, 0, 0, 0, 1, 1,
-0.01577296, 0.7524578, 0.5095503, 0, 0, 0, 1, 1,
-0.01461532, 0.1243152, 0.2170528, 0, 0, 0, 1, 1,
-0.01402309, -0.661239, -2.219949, 0, 0, 0, 1, 1,
-0.01378889, 0.9447751, -0.2805758, 0, 0, 0, 1, 1,
-0.009926985, 0.4009428, 0.3113419, 0, 0, 0, 1, 1,
-0.009874215, 0.3056943, 0.8425313, 0, 0, 0, 1, 1,
-0.009300647, 0.080538, -0.2780161, 1, 1, 1, 1, 1,
-0.00817714, 0.1149589, 0.4828289, 1, 1, 1, 1, 1,
-0.008075137, 0.09886528, -0.120578, 1, 1, 1, 1, 1,
-0.0007703199, -0.4725084, -3.853767, 1, 1, 1, 1, 1,
0.002814397, -0.3889349, 3.406762, 1, 1, 1, 1, 1,
0.00524983, -1.289928, 4.273342, 1, 1, 1, 1, 1,
0.0171545, -0.5901587, 3.367055, 1, 1, 1, 1, 1,
0.01935215, -0.04673591, 1.825744, 1, 1, 1, 1, 1,
0.02237985, 0.2356683, 0.7723997, 1, 1, 1, 1, 1,
0.02284445, -0.1388209, 2.785187, 1, 1, 1, 1, 1,
0.02440775, -0.233055, 2.018438, 1, 1, 1, 1, 1,
0.02453259, -1.344217, 3.499096, 1, 1, 1, 1, 1,
0.02565529, 1.515944, -0.4495016, 1, 1, 1, 1, 1,
0.02873311, 0.4741718, 1.180582, 1, 1, 1, 1, 1,
0.02899021, 0.543752, 1.106285, 1, 1, 1, 1, 1,
0.03175734, 1.064581, 1.208884, 0, 0, 1, 1, 1,
0.04049751, -0.2327386, 2.756358, 1, 0, 0, 1, 1,
0.0415237, 0.6785828, -0.3030997, 1, 0, 0, 1, 1,
0.04191726, 0.943252, 0.9412598, 1, 0, 0, 1, 1,
0.04252036, -1.132158, 4.676286, 1, 0, 0, 1, 1,
0.04416147, 0.7033596, -1.099157, 1, 0, 0, 1, 1,
0.04551435, 0.2136562, 0.4855159, 0, 0, 0, 1, 1,
0.05907258, -0.4037088, 2.066759, 0, 0, 0, 1, 1,
0.05923874, -0.7100204, 1.635382, 0, 0, 0, 1, 1,
0.0634274, 1.598437, -0.9292446, 0, 0, 0, 1, 1,
0.06507463, 0.1802958, -0.08417117, 0, 0, 0, 1, 1,
0.0671628, 0.1155477, 2.340381, 0, 0, 0, 1, 1,
0.06992541, 0.3312397, 0.1244367, 0, 0, 0, 1, 1,
0.07085187, 0.6826963, 0.001367287, 1, 1, 1, 1, 1,
0.07203794, 1.803538, -0.149562, 1, 1, 1, 1, 1,
0.07419506, 0.05494744, 0.9338716, 1, 1, 1, 1, 1,
0.07854751, -0.3696611, 3.48717, 1, 1, 1, 1, 1,
0.07944804, 0.7032869, -0.2825606, 1, 1, 1, 1, 1,
0.08281026, 0.5887103, -0.3016219, 1, 1, 1, 1, 1,
0.08723622, 0.0326892, 1.498521, 1, 1, 1, 1, 1,
0.09553915, -0.05289295, 2.782387, 1, 1, 1, 1, 1,
0.09569035, -1.195154, 4.807806, 1, 1, 1, 1, 1,
0.09779828, 1.037391, 0.3919307, 1, 1, 1, 1, 1,
0.1005161, 0.7650271, -0.6281803, 1, 1, 1, 1, 1,
0.1011491, 1.536762, 0.585167, 1, 1, 1, 1, 1,
0.1013026, -2.541078, 2.721261, 1, 1, 1, 1, 1,
0.102509, -0.5643529, 1.567787, 1, 1, 1, 1, 1,
0.103146, 0.04495195, 1.701039, 1, 1, 1, 1, 1,
0.103181, -0.9369338, 4.615417, 0, 0, 1, 1, 1,
0.1065386, 0.7621409, 1.72227, 1, 0, 0, 1, 1,
0.1086004, 0.4403573, 0.1564849, 1, 0, 0, 1, 1,
0.1111836, 0.4417643, -1.922858, 1, 0, 0, 1, 1,
0.1113698, -0.2017724, 3.305849, 1, 0, 0, 1, 1,
0.1139917, -0.7486739, 3.330658, 1, 0, 0, 1, 1,
0.1179026, 1.08804, -0.9064509, 0, 0, 0, 1, 1,
0.1190874, -1.725677, 2.425013, 0, 0, 0, 1, 1,
0.1209775, -0.6613057, 3.531655, 0, 0, 0, 1, 1,
0.1288042, -0.4141899, 2.70906, 0, 0, 0, 1, 1,
0.1376759, -1.550918, 4.070645, 0, 0, 0, 1, 1,
0.1378961, 0.547707, 1.019443, 0, 0, 0, 1, 1,
0.1384862, -0.4670767, 1.95386, 0, 0, 0, 1, 1,
0.1399386, -0.2561184, 2.683501, 1, 1, 1, 1, 1,
0.1429794, 1.300791, 0.06756631, 1, 1, 1, 1, 1,
0.1436087, -1.284983, 1.869918, 1, 1, 1, 1, 1,
0.1472747, -0.127669, 2.520822, 1, 1, 1, 1, 1,
0.1496763, 0.0789341, 0.2223306, 1, 1, 1, 1, 1,
0.1502436, -1.379399, 0.6037613, 1, 1, 1, 1, 1,
0.1522078, 0.6663603, 0.397781, 1, 1, 1, 1, 1,
0.1524826, -0.1732151, 2.704054, 1, 1, 1, 1, 1,
0.1533177, 0.2600509, 1.088883, 1, 1, 1, 1, 1,
0.1549076, 0.1040346, 0.01532644, 1, 1, 1, 1, 1,
0.1588813, 0.6795314, -0.3705706, 1, 1, 1, 1, 1,
0.1710123, -0.8711351, 2.989861, 1, 1, 1, 1, 1,
0.1710205, 0.8540081, 0.8003688, 1, 1, 1, 1, 1,
0.1722727, 1.124796, 0.1476789, 1, 1, 1, 1, 1,
0.1730135, -0.5549613, 3.12429, 1, 1, 1, 1, 1,
0.1752915, -0.2876748, 0.6480485, 0, 0, 1, 1, 1,
0.1758083, 1.200329, -0.3991104, 1, 0, 0, 1, 1,
0.1837721, 0.2416348, 0.3000864, 1, 0, 0, 1, 1,
0.1850144, 0.7881288, 0.5381043, 1, 0, 0, 1, 1,
0.1910414, -0.6838644, 4.854945, 1, 0, 0, 1, 1,
0.1926255, -0.2263878, 3.104726, 1, 0, 0, 1, 1,
0.1932064, -0.4207051, 2.814934, 0, 0, 0, 1, 1,
0.1945141, 1.358037, 0.6397265, 0, 0, 0, 1, 1,
0.1970778, 0.7399023, -0.5348091, 0, 0, 0, 1, 1,
0.1978664, -0.08271611, 1.856437, 0, 0, 0, 1, 1,
0.1981235, -0.5755095, 2.539132, 0, 0, 0, 1, 1,
0.1984707, 0.4951979, -0.2632272, 0, 0, 0, 1, 1,
0.2064899, -0.9029225, 3.689032, 0, 0, 0, 1, 1,
0.2072509, -0.8316798, 1.107131, 1, 1, 1, 1, 1,
0.2095382, -0.3904634, 2.374967, 1, 1, 1, 1, 1,
0.2096387, 1.428142, -0.7302947, 1, 1, 1, 1, 1,
0.2103458, -0.1529102, 3.637604, 1, 1, 1, 1, 1,
0.2183017, -0.09132234, 2.62531, 1, 1, 1, 1, 1,
0.2195425, -0.03097278, 1.84115, 1, 1, 1, 1, 1,
0.2219665, -0.186594, 1.664331, 1, 1, 1, 1, 1,
0.2242095, 0.1679697, 0.7735811, 1, 1, 1, 1, 1,
0.2265987, 1.229914, 2.708128, 1, 1, 1, 1, 1,
0.2273927, 0.4139459, -0.8177572, 1, 1, 1, 1, 1,
0.2284182, -0.6431836, 2.577369, 1, 1, 1, 1, 1,
0.2288386, 1.284289, 0.8598306, 1, 1, 1, 1, 1,
0.2305216, -0.09834082, 2.349736, 1, 1, 1, 1, 1,
0.2448293, 0.1108938, 3.325599, 1, 1, 1, 1, 1,
0.2460299, 0.2964475, 2.192867, 1, 1, 1, 1, 1,
0.2483192, 0.4894138, -0.4150732, 0, 0, 1, 1, 1,
0.2498264, 0.8202212, 0.9078688, 1, 0, 0, 1, 1,
0.2507077, -1.24763, 3.347186, 1, 0, 0, 1, 1,
0.2529512, -1.707169, 5.166894, 1, 0, 0, 1, 1,
0.2543709, 1.395127, 1.106531, 1, 0, 0, 1, 1,
0.2601999, 1.642929, 0.983592, 1, 0, 0, 1, 1,
0.2614594, 0.7190177, 2.029704, 0, 0, 0, 1, 1,
0.2667312, -0.1480096, -0.2359818, 0, 0, 0, 1, 1,
0.2672586, 1.370266, -0.07632792, 0, 0, 0, 1, 1,
0.2675105, 1.221664, 1.887265, 0, 0, 0, 1, 1,
0.267951, 0.05285018, 0.6606811, 0, 0, 0, 1, 1,
0.2697318, 0.3628221, -0.1348454, 0, 0, 0, 1, 1,
0.2708559, 0.2479888, 0.9633038, 0, 0, 0, 1, 1,
0.2721741, 0.6229253, -0.9234167, 1, 1, 1, 1, 1,
0.2722612, 0.8611453, 1.386883, 1, 1, 1, 1, 1,
0.275219, -0.9289023, 3.872707, 1, 1, 1, 1, 1,
0.2779122, -0.6825233, 3.266595, 1, 1, 1, 1, 1,
0.2786142, -0.7698985, 2.909214, 1, 1, 1, 1, 1,
0.2804115, 2.558678, -1.685923, 1, 1, 1, 1, 1,
0.2813912, 0.2422642, 0.7228054, 1, 1, 1, 1, 1,
0.2816931, 0.2102733, 2.239629, 1, 1, 1, 1, 1,
0.2859226, 0.1991015, 0.06831518, 1, 1, 1, 1, 1,
0.2860321, 1.963966, -0.159968, 1, 1, 1, 1, 1,
0.2889731, 1.586885, 1.01729, 1, 1, 1, 1, 1,
0.2976317, -1.65303, 1.983588, 1, 1, 1, 1, 1,
0.2976694, 0.9215872, 0.5896161, 1, 1, 1, 1, 1,
0.2996316, 1.138004, 2.100225, 1, 1, 1, 1, 1,
0.3027135, 1.82497, 0.1625613, 1, 1, 1, 1, 1,
0.3035417, -0.594503, 4.513999, 0, 0, 1, 1, 1,
0.3037855, 0.1858342, 0.8129105, 1, 0, 0, 1, 1,
0.3038023, 0.4855946, -0.2608671, 1, 0, 0, 1, 1,
0.3040049, -1.474833, 4.639507, 1, 0, 0, 1, 1,
0.309231, 1.724267, 1.718623, 1, 0, 0, 1, 1,
0.3144158, -0.01324892, 0.4624414, 1, 0, 0, 1, 1,
0.3176705, -0.2404449, 3.163756, 0, 0, 0, 1, 1,
0.322386, -0.02633461, 0.8121244, 0, 0, 0, 1, 1,
0.3240229, -0.7563828, 3.226667, 0, 0, 0, 1, 1,
0.3255329, 0.3243562, 0.9816688, 0, 0, 0, 1, 1,
0.3264745, 0.4708276, -0.8709935, 0, 0, 0, 1, 1,
0.3283474, -0.3313682, 2.806026, 0, 0, 0, 1, 1,
0.3337635, -0.7859861, 3.872989, 0, 0, 0, 1, 1,
0.334393, 0.6304615, 1.449728, 1, 1, 1, 1, 1,
0.3346154, 0.8708053, -1.200221, 1, 1, 1, 1, 1,
0.3407815, 0.374373, -2.522682, 1, 1, 1, 1, 1,
0.3449279, -0.4704526, 1.315531, 1, 1, 1, 1, 1,
0.3470578, -2.066384, 1.659938, 1, 1, 1, 1, 1,
0.347675, -0.4890013, 2.599365, 1, 1, 1, 1, 1,
0.3483998, -0.9133683, 2.310505, 1, 1, 1, 1, 1,
0.3486902, -1.615612, 2.469849, 1, 1, 1, 1, 1,
0.3491697, 2.171898, -1.666442, 1, 1, 1, 1, 1,
0.3502752, -0.7604079, 2.350487, 1, 1, 1, 1, 1,
0.3539993, 0.8126755, -0.2041252, 1, 1, 1, 1, 1,
0.3577602, 0.3178228, 2.028502, 1, 1, 1, 1, 1,
0.362865, 0.6795076, 0.009964709, 1, 1, 1, 1, 1,
0.3659928, 0.09561671, 0.5082911, 1, 1, 1, 1, 1,
0.3718444, -0.813091, 2.437753, 1, 1, 1, 1, 1,
0.3733127, 1.324349, 0.2048095, 0, 0, 1, 1, 1,
0.3752594, 0.6655195, -0.5615229, 1, 0, 0, 1, 1,
0.3764223, -0.4338045, 3.687705, 1, 0, 0, 1, 1,
0.3774653, -0.01061324, -0.5375296, 1, 0, 0, 1, 1,
0.3845267, -0.1480362, 2.876213, 1, 0, 0, 1, 1,
0.3872412, 0.6395197, -0.7988071, 1, 0, 0, 1, 1,
0.3891181, 1.19273, 0.01899641, 0, 0, 0, 1, 1,
0.3899758, -1.616856, 3.014629, 0, 0, 0, 1, 1,
0.3904155, 0.1011163, 1.77625, 0, 0, 0, 1, 1,
0.392294, -1.454957, 2.936993, 0, 0, 0, 1, 1,
0.3939182, 0.09634628, 0.9538311, 0, 0, 0, 1, 1,
0.3983972, 0.521772, 1.31713, 0, 0, 0, 1, 1,
0.4059307, 2.068787, -0.3105623, 0, 0, 0, 1, 1,
0.4124732, -1.079322, 1.63566, 1, 1, 1, 1, 1,
0.4132999, -0.5289204, 0.06043919, 1, 1, 1, 1, 1,
0.4149376, -0.585158, 3.790957, 1, 1, 1, 1, 1,
0.4157083, -0.3187792, 1.979246, 1, 1, 1, 1, 1,
0.4249653, -1.288597, 1.168012, 1, 1, 1, 1, 1,
0.4256068, -0.3701876, 2.456603, 1, 1, 1, 1, 1,
0.4280266, 0.6015336, 0.07305616, 1, 1, 1, 1, 1,
0.4290271, 0.4713765, 0.8570156, 1, 1, 1, 1, 1,
0.4372573, 0.7729601, 0.0204065, 1, 1, 1, 1, 1,
0.438826, 0.5838794, 1.855321, 1, 1, 1, 1, 1,
0.4396339, -0.2371079, 2.111551, 1, 1, 1, 1, 1,
0.4406687, -0.03748659, 2.487415, 1, 1, 1, 1, 1,
0.4435035, 0.1893308, 3.969921, 1, 1, 1, 1, 1,
0.4444927, -0.3112389, -0.009927205, 1, 1, 1, 1, 1,
0.4450548, -1.474725, 2.013152, 1, 1, 1, 1, 1,
0.4466648, 0.9260627, 0.9876009, 0, 0, 1, 1, 1,
0.4491714, -0.6846809, 1.939995, 1, 0, 0, 1, 1,
0.4527518, -0.9396024, 0.9716904, 1, 0, 0, 1, 1,
0.4541366, 0.4450889, -0.3213408, 1, 0, 0, 1, 1,
0.461661, -0.3803678, 1.568264, 1, 0, 0, 1, 1,
0.4653358, 0.02384293, 1.704963, 1, 0, 0, 1, 1,
0.4678814, 0.7292818, -1.224907, 0, 0, 0, 1, 1,
0.4693066, -0.7580388, 2.927812, 0, 0, 0, 1, 1,
0.4694712, -0.6185142, 3.171284, 0, 0, 0, 1, 1,
0.4721468, 1.135011, -1.331463, 0, 0, 0, 1, 1,
0.4723004, 0.6538767, 1.587883, 0, 0, 0, 1, 1,
0.4731767, -0.5836493, 1.595021, 0, 0, 0, 1, 1,
0.4733185, 1.215574, -1.124614, 0, 0, 0, 1, 1,
0.4754718, -0.3512262, 3.368071, 1, 1, 1, 1, 1,
0.4757052, -0.08400953, 1.906005, 1, 1, 1, 1, 1,
0.4761904, -0.8590693, 3.718404, 1, 1, 1, 1, 1,
0.4791467, 0.1128187, 1.2884, 1, 1, 1, 1, 1,
0.4804924, -1.319193, 2.935948, 1, 1, 1, 1, 1,
0.4805418, 0.8921111, 0.260937, 1, 1, 1, 1, 1,
0.4807151, 0.8422586, 0.2325212, 1, 1, 1, 1, 1,
0.4833369, 0.6219099, 1.682986, 1, 1, 1, 1, 1,
0.4846822, 0.8486222, 0.7591221, 1, 1, 1, 1, 1,
0.4847489, 0.3805829, 0.8425607, 1, 1, 1, 1, 1,
0.4943304, -0.2490852, 1.48494, 1, 1, 1, 1, 1,
0.4997476, -0.2425279, 3.187098, 1, 1, 1, 1, 1,
0.5019901, 0.2330307, 1.336081, 1, 1, 1, 1, 1,
0.5051166, 1.288146, 0.8711675, 1, 1, 1, 1, 1,
0.5054147, -0.782159, 1.47156, 1, 1, 1, 1, 1,
0.51322, 0.7448742, 1.25963, 0, 0, 1, 1, 1,
0.5163321, 0.3658471, 0.4739471, 1, 0, 0, 1, 1,
0.5176633, -0.4058419, 2.087836, 1, 0, 0, 1, 1,
0.5203561, -2.464878, 2.399968, 1, 0, 0, 1, 1,
0.5209517, 0.7080289, 2.802722, 1, 0, 0, 1, 1,
0.522202, -0.4882253, 2.262083, 1, 0, 0, 1, 1,
0.5228835, -0.3909366, 5.79336, 0, 0, 0, 1, 1,
0.5239677, 2.783207, -1.521758, 0, 0, 0, 1, 1,
0.5243322, -1.172033, 2.730138, 0, 0, 0, 1, 1,
0.5313334, 1.474767, 1.039869, 0, 0, 0, 1, 1,
0.5382767, -2.163164, 4.113026, 0, 0, 0, 1, 1,
0.5400575, -0.7933059, 2.412894, 0, 0, 0, 1, 1,
0.5435764, 0.3954581, 1.862026, 0, 0, 0, 1, 1,
0.5441684, -0.4083174, 1.244017, 1, 1, 1, 1, 1,
0.5455636, 0.8599757, 1.479802, 1, 1, 1, 1, 1,
0.5468625, 0.6223403, -0.7268196, 1, 1, 1, 1, 1,
0.548172, 0.04558441, 2.237872, 1, 1, 1, 1, 1,
0.5483706, -0.0736932, 2.407631, 1, 1, 1, 1, 1,
0.5503443, 0.2928021, 0.3620903, 1, 1, 1, 1, 1,
0.5524833, -0.1029472, 3.572479, 1, 1, 1, 1, 1,
0.5547464, -1.130522, 4.362962, 1, 1, 1, 1, 1,
0.5634921, -0.4408902, 1.016868, 1, 1, 1, 1, 1,
0.5650087, -0.4718477, 2.354754, 1, 1, 1, 1, 1,
0.565303, -0.5864578, 0.8706005, 1, 1, 1, 1, 1,
0.5670545, -1.343554, 3.521012, 1, 1, 1, 1, 1,
0.57102, 0.4252127, 1.33356, 1, 1, 1, 1, 1,
0.5737895, 0.9200726, 0.9956812, 1, 1, 1, 1, 1,
0.5793906, -0.6387867, 4.287613, 1, 1, 1, 1, 1,
0.5820905, -0.9722116, -0.07578184, 0, 0, 1, 1, 1,
0.5831878, -1.116571, 1.406255, 1, 0, 0, 1, 1,
0.5877904, -0.542654, 2.103142, 1, 0, 0, 1, 1,
0.5929248, 0.6226239, 1.521911, 1, 0, 0, 1, 1,
0.5933639, 1.652573, 0.432859, 1, 0, 0, 1, 1,
0.5969338, -0.1739009, 1.065405, 1, 0, 0, 1, 1,
0.6007021, 0.2404478, 1.575314, 0, 0, 0, 1, 1,
0.6087255, 0.7263134, -1.100019, 0, 0, 0, 1, 1,
0.6104947, 0.2315022, 0.1881279, 0, 0, 0, 1, 1,
0.6141068, -0.6807826, 1.195821, 0, 0, 0, 1, 1,
0.6168236, 0.7044278, 1.055507, 0, 0, 0, 1, 1,
0.6180764, -1.190999, 0.8528447, 0, 0, 0, 1, 1,
0.6198304, 0.4771842, 2.409286, 0, 0, 0, 1, 1,
0.6251847, -0.1936449, 0.9088013, 1, 1, 1, 1, 1,
0.6256278, 0.1449605, 0.3000798, 1, 1, 1, 1, 1,
0.6310868, -0.4808165, 3.21991, 1, 1, 1, 1, 1,
0.6312179, 0.329344, 0.3509635, 1, 1, 1, 1, 1,
0.635137, -0.8910335, 1.230368, 1, 1, 1, 1, 1,
0.6353183, 1.337169, 1.227477, 1, 1, 1, 1, 1,
0.639362, 0.6052511, -0.2687913, 1, 1, 1, 1, 1,
0.6398972, 0.09685076, 1.384009, 1, 1, 1, 1, 1,
0.6442842, -0.03464806, 2.026352, 1, 1, 1, 1, 1,
0.6532028, -0.9026916, 4.071402, 1, 1, 1, 1, 1,
0.6565018, -0.4752052, 1.203253, 1, 1, 1, 1, 1,
0.6568668, -2.158344, 3.324544, 1, 1, 1, 1, 1,
0.6628032, -1.428971, 1.744326, 1, 1, 1, 1, 1,
0.6638079, 0.2184432, 2.291546, 1, 1, 1, 1, 1,
0.6640145, -0.8078706, 2.050887, 1, 1, 1, 1, 1,
0.6704937, 1.159907, 0.07049404, 0, 0, 1, 1, 1,
0.6743217, -0.6531579, 2.954949, 1, 0, 0, 1, 1,
0.6762094, -1.164065, 0.8984426, 1, 0, 0, 1, 1,
0.6826472, -1.788091, 1.174428, 1, 0, 0, 1, 1,
0.6856992, 0.9598438, 0.6974427, 1, 0, 0, 1, 1,
0.6935887, 0.004693685, 1.629436, 1, 0, 0, 1, 1,
0.6994257, 1.279119, 0.2341014, 0, 0, 0, 1, 1,
0.7014282, -1.582585, 3.733928, 0, 0, 0, 1, 1,
0.7072511, 2.229913, 0.80002, 0, 0, 0, 1, 1,
0.7074262, -1.405439, 3.190658, 0, 0, 0, 1, 1,
0.7107224, 1.96773, 0.3931971, 0, 0, 0, 1, 1,
0.7218817, -0.4726616, 1.700717, 0, 0, 0, 1, 1,
0.7230139, -2.967019, 2.70256, 0, 0, 0, 1, 1,
0.7246911, -0.4035669, 2.969863, 1, 1, 1, 1, 1,
0.7266251, -1.508699, 4.157276, 1, 1, 1, 1, 1,
0.7301127, -1.530746, 4.001434, 1, 1, 1, 1, 1,
0.7304757, -0.2479048, 2.783175, 1, 1, 1, 1, 1,
0.7310598, -0.4589496, 2.684076, 1, 1, 1, 1, 1,
0.7360762, 0.06122836, -0.1228571, 1, 1, 1, 1, 1,
0.7402725, 0.3121916, 0.896996, 1, 1, 1, 1, 1,
0.7408365, 1.407919, 2.7147, 1, 1, 1, 1, 1,
0.7490879, 0.03068358, -0.1640178, 1, 1, 1, 1, 1,
0.7529591, 0.3448248, 0.4304756, 1, 1, 1, 1, 1,
0.7543353, -0.3930583, 3.279263, 1, 1, 1, 1, 1,
0.7582039, -1.399449, 3.270958, 1, 1, 1, 1, 1,
0.7639776, 0.1924556, 1.856794, 1, 1, 1, 1, 1,
0.7738378, 1.041636, 0.428869, 1, 1, 1, 1, 1,
0.7746981, -0.03079029, 1.564977, 1, 1, 1, 1, 1,
0.7757117, -1.13581, 2.404002, 0, 0, 1, 1, 1,
0.7769032, -0.3202833, 0.563658, 1, 0, 0, 1, 1,
0.7813085, -0.3813458, 2.483264, 1, 0, 0, 1, 1,
0.7842247, 0.3951483, 2.687565, 1, 0, 0, 1, 1,
0.7860945, 0.4273571, 0.5034724, 1, 0, 0, 1, 1,
0.7886932, 0.3524302, 2.744758, 1, 0, 0, 1, 1,
0.7904828, -0.3199787, 0.9528965, 0, 0, 0, 1, 1,
0.7928845, 1.032442, 1.728368, 0, 0, 0, 1, 1,
0.7929354, -0.9184512, 1.646642, 0, 0, 0, 1, 1,
0.7938101, 1.381144, 0.5687979, 0, 0, 0, 1, 1,
0.7990808, 0.2671161, 2.112261, 0, 0, 0, 1, 1,
0.7999106, 0.07750822, 2.040803, 0, 0, 0, 1, 1,
0.8004943, -0.201668, -0.8407862, 0, 0, 0, 1, 1,
0.8015963, 0.2311982, 3.094246, 1, 1, 1, 1, 1,
0.8065042, 1.038276, -0.09027237, 1, 1, 1, 1, 1,
0.808024, -0.3022387, 1.943908, 1, 1, 1, 1, 1,
0.8139989, 1.959458, -0.004972377, 1, 1, 1, 1, 1,
0.8149956, -0.1602165, 1.483069, 1, 1, 1, 1, 1,
0.8161348, -0.3733119, 2.359874, 1, 1, 1, 1, 1,
0.8164139, 0.1813036, 0.2451417, 1, 1, 1, 1, 1,
0.8204195, -0.6486773, 1.085522, 1, 1, 1, 1, 1,
0.8230968, -0.6305447, 2.954953, 1, 1, 1, 1, 1,
0.8253026, -1.562057, 5.372575, 1, 1, 1, 1, 1,
0.8276606, 0.3693271, 1.201133, 1, 1, 1, 1, 1,
0.8276702, -0.5901805, 3.069052, 1, 1, 1, 1, 1,
0.828257, -1.898194, 2.792607, 1, 1, 1, 1, 1,
0.830047, -1.756077, 2.32903, 1, 1, 1, 1, 1,
0.8306968, 0.7198754, 2.194372, 1, 1, 1, 1, 1,
0.8478854, 0.2324335, 1.156667, 0, 0, 1, 1, 1,
0.8478937, 0.06157401, 0.04420656, 1, 0, 0, 1, 1,
0.8519623, -0.7304911, 2.846671, 1, 0, 0, 1, 1,
0.8700305, -0.9526806, 1.326444, 1, 0, 0, 1, 1,
0.8741362, 0.633571, 3.199586, 1, 0, 0, 1, 1,
0.8772906, -1.757395, 2.845491, 1, 0, 0, 1, 1,
0.8812142, 0.9670833, 1.586686, 0, 0, 0, 1, 1,
0.881669, 1.051705, 0.5919433, 0, 0, 0, 1, 1,
0.8848025, 0.1352004, 2.157635, 0, 0, 0, 1, 1,
0.889046, 0.08278602, 2.037441, 0, 0, 0, 1, 1,
0.8916295, -0.5747575, 2.012448, 0, 0, 0, 1, 1,
0.8917899, 0.08534339, 2.283029, 0, 0, 0, 1, 1,
0.8939549, -0.4610003, 2.353913, 0, 0, 0, 1, 1,
0.9003173, 1.783999, -0.4146168, 1, 1, 1, 1, 1,
0.901369, 1.393511, 1.435539, 1, 1, 1, 1, 1,
0.9014295, -2.001566, 1.57993, 1, 1, 1, 1, 1,
0.9022554, 0.3946962, 1.722136, 1, 1, 1, 1, 1,
0.9038442, -0.8387218, 3.201852, 1, 1, 1, 1, 1,
0.9044387, -0.2992896, 2.060565, 1, 1, 1, 1, 1,
0.9050753, -0.3424174, 1.277021, 1, 1, 1, 1, 1,
0.9156427, -0.5618623, -0.205948, 1, 1, 1, 1, 1,
0.9176169, -0.05602069, 2.222572, 1, 1, 1, 1, 1,
0.9185887, -1.292729, 1.3586, 1, 1, 1, 1, 1,
0.9203729, -0.2918709, 1.078178, 1, 1, 1, 1, 1,
0.9212395, -0.1325285, 3.261873, 1, 1, 1, 1, 1,
0.9263682, 0.7028285, 0.501003, 1, 1, 1, 1, 1,
0.9326481, 1.545803, -0.397262, 1, 1, 1, 1, 1,
0.9328109, 1.732214, 0.6715348, 1, 1, 1, 1, 1,
0.9344744, -0.0768714, 2.132386, 0, 0, 1, 1, 1,
0.9345108, 0.05593023, 0.5168379, 1, 0, 0, 1, 1,
0.9404179, 0.1132218, -0.6205035, 1, 0, 0, 1, 1,
0.9438766, 1.525557, 0.556267, 1, 0, 0, 1, 1,
0.9439246, 0.3343721, 0.9131458, 1, 0, 0, 1, 1,
0.9444568, 0.1143618, 1.8949, 1, 0, 0, 1, 1,
0.9488401, -0.2388442, 2.165897, 0, 0, 0, 1, 1,
0.9493235, -1.344263, 1.188468, 0, 0, 0, 1, 1,
0.9534016, -0.1337677, 3.464617, 0, 0, 0, 1, 1,
0.9543509, -0.3828956, 1.882959, 0, 0, 0, 1, 1,
0.960867, -0.1212988, 1.692562, 0, 0, 0, 1, 1,
0.961431, 0.3320513, 0.519253, 0, 0, 0, 1, 1,
0.9621748, -0.7869068, 1.586969, 0, 0, 0, 1, 1,
0.9654603, 0.008518443, 1.194976, 1, 1, 1, 1, 1,
0.9755054, -0.5615001, 3.487412, 1, 1, 1, 1, 1,
0.9756578, -1.194007, 3.212591, 1, 1, 1, 1, 1,
0.988714, 1.097673, 0.449103, 1, 1, 1, 1, 1,
1.000872, -0.7028745, 3.181451, 1, 1, 1, 1, 1,
1.001702, 0.1348281, 1.706627, 1, 1, 1, 1, 1,
1.006639, 1.04658, 1.728045, 1, 1, 1, 1, 1,
1.011255, -1.932863, 1.928735, 1, 1, 1, 1, 1,
1.021266, -1.475739, 3.151437, 1, 1, 1, 1, 1,
1.030453, -1.183929, 2.527186, 1, 1, 1, 1, 1,
1.038696, -0.7546756, 4.367766, 1, 1, 1, 1, 1,
1.047459, 1.796161, 0.1532386, 1, 1, 1, 1, 1,
1.051262, -1.646322, 2.91146, 1, 1, 1, 1, 1,
1.053213, -0.4030854, 0.4597434, 1, 1, 1, 1, 1,
1.053867, 0.001806067, 0.4687212, 1, 1, 1, 1, 1,
1.058464, -0.5235611, 2.644464, 0, 0, 1, 1, 1,
1.060358, -0.3091351, 2.170917, 1, 0, 0, 1, 1,
1.060495, -1.003281, 2.144425, 1, 0, 0, 1, 1,
1.060503, 0.1308701, 1.692858, 1, 0, 0, 1, 1,
1.061506, 1.491805, 1.03972, 1, 0, 0, 1, 1,
1.06155, -0.2572665, 0.591086, 1, 0, 0, 1, 1,
1.067974, -0.9906642, 1.617313, 0, 0, 0, 1, 1,
1.069874, -0.1096271, 2.625981, 0, 0, 0, 1, 1,
1.077553, -0.8342499, 2.225002, 0, 0, 0, 1, 1,
1.098453, -0.6753055, 3.283251, 0, 0, 0, 1, 1,
1.109116, -0.4009333, 1.838446, 0, 0, 0, 1, 1,
1.111353, 1.871845, -0.3430231, 0, 0, 0, 1, 1,
1.11641, -0.5228431, 2.165992, 0, 0, 0, 1, 1,
1.127435, 1.94944, 0.7706968, 1, 1, 1, 1, 1,
1.136081, 2.003693, 0.8351986, 1, 1, 1, 1, 1,
1.143417, 1.006704, -0.5879336, 1, 1, 1, 1, 1,
1.147568, 0.7972438, -0.4543464, 1, 1, 1, 1, 1,
1.151862, 0.4687115, 1.115921, 1, 1, 1, 1, 1,
1.18654, 0.1962202, -0.0987995, 1, 1, 1, 1, 1,
1.195321, 2.607837, 0.8073649, 1, 1, 1, 1, 1,
1.197094, -0.0924588, 2.155235, 1, 1, 1, 1, 1,
1.199605, 0.6608483, 1.239606, 1, 1, 1, 1, 1,
1.20532, -1.003531, 1.408313, 1, 1, 1, 1, 1,
1.220278, 3.159223, 2.05656, 1, 1, 1, 1, 1,
1.221896, 0.5015549, 1.79756, 1, 1, 1, 1, 1,
1.236737, 0.1950475, 0.7181636, 1, 1, 1, 1, 1,
1.249903, 0.9817873, 1.1701, 1, 1, 1, 1, 1,
1.254133, 0.5981386, 0.7778924, 1, 1, 1, 1, 1,
1.255452, -0.3726819, 3.11799, 0, 0, 1, 1, 1,
1.257016, -1.342814, 2.097823, 1, 0, 0, 1, 1,
1.263039, 0.5500544, 2.216462, 1, 0, 0, 1, 1,
1.271804, -0.2922473, 2.779258, 1, 0, 0, 1, 1,
1.272409, -2.356185, 4.186842, 1, 0, 0, 1, 1,
1.272993, -1.323724, 2.040485, 1, 0, 0, 1, 1,
1.278554, 1.889115, 0.5035612, 0, 0, 0, 1, 1,
1.281498, 0.6775643, 1.150939, 0, 0, 0, 1, 1,
1.286078, -0.2990194, 1.652674, 0, 0, 0, 1, 1,
1.288649, -1.566128, 1.729441, 0, 0, 0, 1, 1,
1.288946, -0.2498248, 3.079866, 0, 0, 0, 1, 1,
1.295836, -1.314996, 2.438521, 0, 0, 0, 1, 1,
1.296824, -1.52645, 2.020717, 0, 0, 0, 1, 1,
1.297836, 1.701, 1.421629, 1, 1, 1, 1, 1,
1.311428, -0.9327105, 1.263829, 1, 1, 1, 1, 1,
1.328801, 0.3363104, 2.516377, 1, 1, 1, 1, 1,
1.337852, -2.005183, 3.419104, 1, 1, 1, 1, 1,
1.346758, -0.03479332, 1.882665, 1, 1, 1, 1, 1,
1.352952, -0.7659486, 2.180139, 1, 1, 1, 1, 1,
1.360538, 0.4656406, 2.087812, 1, 1, 1, 1, 1,
1.369539, -1.588018, 1.727676, 1, 1, 1, 1, 1,
1.373307, 0.30819, 1.921665, 1, 1, 1, 1, 1,
1.373607, 0.1886422, 2.427122, 1, 1, 1, 1, 1,
1.374998, -0.2703383, 2.264968, 1, 1, 1, 1, 1,
1.379471, -1.274721, 2.0959, 1, 1, 1, 1, 1,
1.385775, -0.6528271, 2.34081, 1, 1, 1, 1, 1,
1.396751, 0.9975794, 3.278111, 1, 1, 1, 1, 1,
1.39868, 0.6031106, 0.5508628, 1, 1, 1, 1, 1,
1.398746, 1.895614, 0.3195076, 0, 0, 1, 1, 1,
1.406355, 0.1892303, 2.382766, 1, 0, 0, 1, 1,
1.406901, -0.200232, 1.939122, 1, 0, 0, 1, 1,
1.421649, 1.399975, -0.4598507, 1, 0, 0, 1, 1,
1.426103, -1.333024, 0.7003123, 1, 0, 0, 1, 1,
1.430833, -0.02619322, 0.9115213, 1, 0, 0, 1, 1,
1.434603, 0.8206111, 0.9594773, 0, 0, 0, 1, 1,
1.43606, 0.1695929, 0.6515169, 0, 0, 0, 1, 1,
1.452105, -0.01709971, 0.8633583, 0, 0, 0, 1, 1,
1.460804, -1.016589, 1.077837, 0, 0, 0, 1, 1,
1.461571, 0.6369349, 0.8713624, 0, 0, 0, 1, 1,
1.470895, 2.261358, -1.118783, 0, 0, 0, 1, 1,
1.471401, 0.1140236, 0.970611, 0, 0, 0, 1, 1,
1.473266, -1.202479, 3.484468, 1, 1, 1, 1, 1,
1.478907, -1.294363, 2.357852, 1, 1, 1, 1, 1,
1.4967, 1.55146, 2.109987, 1, 1, 1, 1, 1,
1.500789, 0.3924542, 1.511155, 1, 1, 1, 1, 1,
1.501175, -0.2539422, 0.9865198, 1, 1, 1, 1, 1,
1.509447, -0.6243578, 0.7832131, 1, 1, 1, 1, 1,
1.513269, -0.7005937, 0.4684947, 1, 1, 1, 1, 1,
1.513391, 1.24587, 0.8142151, 1, 1, 1, 1, 1,
1.516751, 0.6352072, 1.679621, 1, 1, 1, 1, 1,
1.534639, -1.346742, 3.542982, 1, 1, 1, 1, 1,
1.582732, -0.5668095, 2.463176, 1, 1, 1, 1, 1,
1.584857, 0.0004590396, 1.411436, 1, 1, 1, 1, 1,
1.586078, 1.545148, 1.149678, 1, 1, 1, 1, 1,
1.592125, -1.324358, 2.736903, 1, 1, 1, 1, 1,
1.596326, 0.5085789, 0.4211183, 1, 1, 1, 1, 1,
1.608741, -0.1880439, 2.08874, 0, 0, 1, 1, 1,
1.622397, 1.283467, -0.896041, 1, 0, 0, 1, 1,
1.628272, -1.205967, 1.08966, 1, 0, 0, 1, 1,
1.630495, 0.7599393, 0.7339709, 1, 0, 0, 1, 1,
1.645251, -1.943901, 2.757939, 1, 0, 0, 1, 1,
1.647515, -1.793184, 2.032604, 1, 0, 0, 1, 1,
1.66291, 1.225084, 0.4010962, 0, 0, 0, 1, 1,
1.665067, 0.07418911, 2.14657, 0, 0, 0, 1, 1,
1.669238, -2.629777, 3.377387, 0, 0, 0, 1, 1,
1.672808, 0.2515096, 1.628593, 0, 0, 0, 1, 1,
1.69053, -1.884862, 1.052366, 0, 0, 0, 1, 1,
1.708289, 0.7747959, -1.585225, 0, 0, 0, 1, 1,
1.721467, -0.2726985, 3.285347, 0, 0, 0, 1, 1,
1.734716, 0.3234467, -0.07515384, 1, 1, 1, 1, 1,
1.758011, 0.9605484, 2.324702, 1, 1, 1, 1, 1,
1.771601, 0.7152276, 0.3899049, 1, 1, 1, 1, 1,
1.793555, -0.1897465, 0.02908029, 1, 1, 1, 1, 1,
1.810874, -0.18725, 2.156616, 1, 1, 1, 1, 1,
1.818387, -0.7934016, 0.7451415, 1, 1, 1, 1, 1,
1.845687, -0.5291926, 1.183072, 1, 1, 1, 1, 1,
1.864623, -0.03343761, 0.80825, 1, 1, 1, 1, 1,
1.867209, -0.1540953, -0.1950094, 1, 1, 1, 1, 1,
1.87757, -0.1793883, 0.679983, 1, 1, 1, 1, 1,
1.880417, -1.155055, 2.309942, 1, 1, 1, 1, 1,
1.93721, -0.8495802, 0.7654708, 1, 1, 1, 1, 1,
1.973624, -0.08184253, 0.1103318, 1, 1, 1, 1, 1,
1.996856, -1.423492, 3.453234, 1, 1, 1, 1, 1,
2.00167, 0.575676, 2.681049, 1, 1, 1, 1, 1,
2.005362, -1.756991, 1.932386, 0, 0, 1, 1, 1,
2.013883, 0.01573658, 0.3031788, 1, 0, 0, 1, 1,
2.060433, -2.077091, -0.3233146, 1, 0, 0, 1, 1,
2.107705, -0.7795907, 1.099008, 1, 0, 0, 1, 1,
2.117478, 1.616296, 1.390845, 1, 0, 0, 1, 1,
2.129338, 0.9527408, 2.031333, 1, 0, 0, 1, 1,
2.146271, 0.4307326, -0.5654479, 0, 0, 0, 1, 1,
2.156157, -0.03469062, 1.912206, 0, 0, 0, 1, 1,
2.219671, 0.7346837, 2.476083, 0, 0, 0, 1, 1,
2.235791, -1.419546, 3.305945, 0, 0, 0, 1, 1,
2.267244, 0.1372023, 0.1993121, 0, 0, 0, 1, 1,
2.296603, -0.02114398, 2.40227, 0, 0, 0, 1, 1,
2.301521, 1.613933, 0.6306419, 0, 0, 0, 1, 1,
2.399636, 1.360472, -0.09503616, 1, 1, 1, 1, 1,
2.407341, -1.589954, 2.296005, 1, 1, 1, 1, 1,
2.530077, 1.06351, 1.543671, 1, 1, 1, 1, 1,
2.559711, -0.5421687, 2.316109, 1, 1, 1, 1, 1,
2.65379, 0.3135689, 0.3209648, 1, 1, 1, 1, 1,
2.837357, 1.289768, 0.7867781, 1, 1, 1, 1, 1,
2.963616, -0.9698382, 2.208572, 1, 1, 1, 1, 1
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
var radius = 9.484595;
var distance = 33.31424;
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
mvMatrix.translate( -0.02963543, -0.02897573, -0.3272998 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.31424);
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
