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
-3.24434, 0.3509759, -1.529669, 1, 0, 0, 1,
-2.838531, 1.892973, -0.4926738, 1, 0.007843138, 0, 1,
-2.794142, -0.3776617, -0.8190323, 1, 0.01176471, 0, 1,
-2.6843, 0.2851457, -1.810205, 1, 0.01960784, 0, 1,
-2.403249, -2.52254, -3.037071, 1, 0.02352941, 0, 1,
-2.313981, 0.2892533, -2.380002, 1, 0.03137255, 0, 1,
-2.311507, -1.409954, -1.731057, 1, 0.03529412, 0, 1,
-2.282966, 0.8720589, -0.2400091, 1, 0.04313726, 0, 1,
-2.229509, -2.065225, 0.3492229, 1, 0.04705882, 0, 1,
-2.212966, 2.60019, -1.579375, 1, 0.05490196, 0, 1,
-2.197976, -0.2042401, -1.234245, 1, 0.05882353, 0, 1,
-2.191227, 1.540873, -1.402462, 1, 0.06666667, 0, 1,
-2.159548, -0.6010033, -3.196237, 1, 0.07058824, 0, 1,
-2.09983, 0.09657963, -0.3472919, 1, 0.07843138, 0, 1,
-2.069481, 0.6816633, -0.5985576, 1, 0.08235294, 0, 1,
-2.018795, -2.067381, -1.505577, 1, 0.09019608, 0, 1,
-2.017437, 0.9132836, -1.004822, 1, 0.09411765, 0, 1,
-2.006384, 0.2371505, -1.018449, 1, 0.1019608, 0, 1,
-2.002032, -0.6309135, -0.725029, 1, 0.1098039, 0, 1,
-1.997536, 0.1108851, -2.487746, 1, 0.1137255, 0, 1,
-1.985332, 1.822384, -1.056276, 1, 0.1215686, 0, 1,
-1.957886, -0.8326182, -3.89776, 1, 0.1254902, 0, 1,
-1.954672, 0.6534895, -1.077611, 1, 0.1333333, 0, 1,
-1.927325, 0.1538922, -1.082165, 1, 0.1372549, 0, 1,
-1.910783, -0.9362046, -0.5466939, 1, 0.145098, 0, 1,
-1.898776, 0.1813444, -3.020076, 1, 0.1490196, 0, 1,
-1.895726, -0.355436, -0.8974425, 1, 0.1568628, 0, 1,
-1.880117, -0.2050281, -2.183451, 1, 0.1607843, 0, 1,
-1.872706, 0.09126753, -3.384581, 1, 0.1686275, 0, 1,
-1.869747, 0.02926124, 0.01113256, 1, 0.172549, 0, 1,
-1.866387, -1.653319, -3.482056, 1, 0.1803922, 0, 1,
-1.824128, 0.641052, -1.359465, 1, 0.1843137, 0, 1,
-1.821184, 1.041862, -2.615258, 1, 0.1921569, 0, 1,
-1.807416, -0.2903499, -2.31147, 1, 0.1960784, 0, 1,
-1.782752, -1.02694, -1.557055, 1, 0.2039216, 0, 1,
-1.770797, 1.11915, -2.57941, 1, 0.2117647, 0, 1,
-1.761937, 1.605703, -0.7285781, 1, 0.2156863, 0, 1,
-1.754217, 0.804709, -1.383294, 1, 0.2235294, 0, 1,
-1.752596, -0.4145047, -1.936829, 1, 0.227451, 0, 1,
-1.738132, 0.6391098, -0.8183769, 1, 0.2352941, 0, 1,
-1.727132, -1.56348, -1.135512, 1, 0.2392157, 0, 1,
-1.727076, -0.6998366, -1.367522, 1, 0.2470588, 0, 1,
-1.726355, -0.6344876, -2.084691, 1, 0.2509804, 0, 1,
-1.725971, -1.500623, -2.81196, 1, 0.2588235, 0, 1,
-1.708873, 2.308522, -2.536934, 1, 0.2627451, 0, 1,
-1.675517, 0.8539667, -0.813329, 1, 0.2705882, 0, 1,
-1.648294, 1.480572, -2.090846, 1, 0.2745098, 0, 1,
-1.629997, -0.2170457, -1.061629, 1, 0.282353, 0, 1,
-1.611299, -0.6503103, -2.486025, 1, 0.2862745, 0, 1,
-1.595178, 1.433285, -1.12539, 1, 0.2941177, 0, 1,
-1.587035, -0.8745404, -1.399394, 1, 0.3019608, 0, 1,
-1.586979, -1.063178, -1.304556, 1, 0.3058824, 0, 1,
-1.579667, 0.3280639, -0.09677213, 1, 0.3137255, 0, 1,
-1.579316, 1.263766, -2.66984, 1, 0.3176471, 0, 1,
-1.56077, 0.04890573, -2.016224, 1, 0.3254902, 0, 1,
-1.558273, 0.5935153, -1.522182, 1, 0.3294118, 0, 1,
-1.556857, 0.9555902, -1.651094, 1, 0.3372549, 0, 1,
-1.54804, -0.8541972, -1.432207, 1, 0.3411765, 0, 1,
-1.540649, -0.4782276, -1.690429, 1, 0.3490196, 0, 1,
-1.538047, -1.286074, -2.540695, 1, 0.3529412, 0, 1,
-1.537115, 0.9770168, -1.236366, 1, 0.3607843, 0, 1,
-1.525132, -1.510917, -2.752254, 1, 0.3647059, 0, 1,
-1.513692, 0.5127358, -2.573924, 1, 0.372549, 0, 1,
-1.490857, -0.5250937, -0.4540347, 1, 0.3764706, 0, 1,
-1.486355, -0.5286578, -1.199166, 1, 0.3843137, 0, 1,
-1.483144, -1.529351, -1.986731, 1, 0.3882353, 0, 1,
-1.470011, -0.1670546, -0.6786149, 1, 0.3960784, 0, 1,
-1.463581, 0.3798257, 0.872501, 1, 0.4039216, 0, 1,
-1.449967, -0.2368829, -3.297089, 1, 0.4078431, 0, 1,
-1.447746, 0.1585992, -0.9744899, 1, 0.4156863, 0, 1,
-1.445166, 0.5994003, -0.9817129, 1, 0.4196078, 0, 1,
-1.442521, 0.9492229, -3.307186, 1, 0.427451, 0, 1,
-1.441231, 0.6251574, 0.2553394, 1, 0.4313726, 0, 1,
-1.434722, 1.253388, 0.8119672, 1, 0.4392157, 0, 1,
-1.426346, -0.7330425, -3.484434, 1, 0.4431373, 0, 1,
-1.414596, -0.658918, -3.18277, 1, 0.4509804, 0, 1,
-1.408769, 0.07962395, -1.158853, 1, 0.454902, 0, 1,
-1.400823, -0.5539463, -1.314953, 1, 0.4627451, 0, 1,
-1.399192, -0.07386342, -1.534995, 1, 0.4666667, 0, 1,
-1.396032, 0.002633395, -0.6737083, 1, 0.4745098, 0, 1,
-1.384596, -0.81262, -2.111559, 1, 0.4784314, 0, 1,
-1.382331, -0.9048232, -3.141205, 1, 0.4862745, 0, 1,
-1.36647, -0.5759206, -1.737893, 1, 0.4901961, 0, 1,
-1.350937, 0.1528164, -2.268288, 1, 0.4980392, 0, 1,
-1.347863, -0.3952186, -1.411141, 1, 0.5058824, 0, 1,
-1.344789, -0.2002634, -1.600918, 1, 0.509804, 0, 1,
-1.341088, -2.145325, -0.1888656, 1, 0.5176471, 0, 1,
-1.338296, -0.3999787, -1.762678, 1, 0.5215687, 0, 1,
-1.330691, 0.3941381, -1.857229, 1, 0.5294118, 0, 1,
-1.326963, -1.447841, -2.245746, 1, 0.5333334, 0, 1,
-1.315568, -0.1480258, -5.272413, 1, 0.5411765, 0, 1,
-1.311779, 0.2901945, -1.403296, 1, 0.5450981, 0, 1,
-1.305174, -0.2577857, -2.915406, 1, 0.5529412, 0, 1,
-1.303335, 1.625963, -1.863382, 1, 0.5568628, 0, 1,
-1.301109, -0.623616, -0.86777, 1, 0.5647059, 0, 1,
-1.296135, 0.8497276, -3.117024, 1, 0.5686275, 0, 1,
-1.281645, 0.6879008, -0.3316041, 1, 0.5764706, 0, 1,
-1.277737, 2.595713, -1.99528, 1, 0.5803922, 0, 1,
-1.273161, 0.3703846, -0.7739928, 1, 0.5882353, 0, 1,
-1.251119, -0.1768398, -2.599525, 1, 0.5921569, 0, 1,
-1.232517, 0.2371411, -2.094355, 1, 0.6, 0, 1,
-1.230586, 0.3207777, -0.6993098, 1, 0.6078432, 0, 1,
-1.229316, 0.04807052, -2.65946, 1, 0.6117647, 0, 1,
-1.228332, 0.7494099, -0.02309461, 1, 0.6196079, 0, 1,
-1.222961, 0.6041171, -2.269223, 1, 0.6235294, 0, 1,
-1.20632, -0.2863817, -1.910817, 1, 0.6313726, 0, 1,
-1.197433, 0.1670574, -0.6921481, 1, 0.6352941, 0, 1,
-1.181666, -0.5655028, -2.649453, 1, 0.6431373, 0, 1,
-1.180919, -0.3794596, -1.560616, 1, 0.6470588, 0, 1,
-1.170792, 0.7236577, -1.068599, 1, 0.654902, 0, 1,
-1.162503, 0.4846409, -0.8279217, 1, 0.6588235, 0, 1,
-1.159719, -0.4214611, -2.041674, 1, 0.6666667, 0, 1,
-1.158438, 0.4676337, -1.274769, 1, 0.6705883, 0, 1,
-1.145579, -0.1125715, -2.628294, 1, 0.6784314, 0, 1,
-1.133289, -0.4240014, -4.264713, 1, 0.682353, 0, 1,
-1.129462, 2.014162, -0.7723878, 1, 0.6901961, 0, 1,
-1.126725, 0.6483061, 0.6282994, 1, 0.6941177, 0, 1,
-1.121183, 1.746725, -1.178061, 1, 0.7019608, 0, 1,
-1.121016, -0.8918534, -1.686848, 1, 0.7098039, 0, 1,
-1.118335, -0.2647505, -2.440139, 1, 0.7137255, 0, 1,
-1.108169, -0.3303709, -3.368378, 1, 0.7215686, 0, 1,
-1.091912, 0.350142, -3.10099, 1, 0.7254902, 0, 1,
-1.088271, -0.424769, -0.7216427, 1, 0.7333333, 0, 1,
-1.079984, 0.05227799, -1.845458, 1, 0.7372549, 0, 1,
-1.078842, 0.249173, -1.477562, 1, 0.7450981, 0, 1,
-1.076843, -0.4786174, -1.186623, 1, 0.7490196, 0, 1,
-1.07599, -0.4306227, -1.023454, 1, 0.7568628, 0, 1,
-1.072556, -0.2276884, -3.454295, 1, 0.7607843, 0, 1,
-1.070427, -0.02125186, -1.291417, 1, 0.7686275, 0, 1,
-1.060864, 0.4229613, -0.3917268, 1, 0.772549, 0, 1,
-1.057254, -0.9761449, -3.680558, 1, 0.7803922, 0, 1,
-1.056177, 1.076095, -1.409647, 1, 0.7843137, 0, 1,
-1.051973, -2.053244, -1.855458, 1, 0.7921569, 0, 1,
-1.050744, 1.643438, 0.330311, 1, 0.7960784, 0, 1,
-1.050342, -0.4103587, -2.761505, 1, 0.8039216, 0, 1,
-1.0473, -3.383414, -4.449309, 1, 0.8117647, 0, 1,
-1.046499, 0.706524, -2.236446, 1, 0.8156863, 0, 1,
-1.044136, 1.091662, -2.466358, 1, 0.8235294, 0, 1,
-1.043994, 0.3826325, -0.3249168, 1, 0.827451, 0, 1,
-1.043876, -1.251704, -1.277049, 1, 0.8352941, 0, 1,
-1.043039, -0.6765963, -0.92622, 1, 0.8392157, 0, 1,
-1.03957, -1.140717, -2.520934, 1, 0.8470588, 0, 1,
-1.032385, 0.9004629, -0.5674995, 1, 0.8509804, 0, 1,
-1.028621, 0.3713173, 0.1426008, 1, 0.8588235, 0, 1,
-1.025833, -0.4341289, -2.463914, 1, 0.8627451, 0, 1,
-1.02274, -0.2106158, -2.318774, 1, 0.8705882, 0, 1,
-1.022028, -0.1510358, -0.9382103, 1, 0.8745098, 0, 1,
-1.020048, 0.5911087, -1.147933, 1, 0.8823529, 0, 1,
-1.017618, -1.564095, -3.960148, 1, 0.8862745, 0, 1,
-1.004035, 0.2800083, -2.18511, 1, 0.8941177, 0, 1,
-1.003118, -0.6481586, -0.4728585, 1, 0.8980392, 0, 1,
-0.9984982, 1.339435, 0.02833083, 1, 0.9058824, 0, 1,
-0.9954761, 0.3303247, -0.02281027, 1, 0.9137255, 0, 1,
-0.9922393, 0.368632, -1.212975, 1, 0.9176471, 0, 1,
-0.9857101, 1.976758, -0.5245306, 1, 0.9254902, 0, 1,
-0.9845637, 0.7924007, 0.3722773, 1, 0.9294118, 0, 1,
-0.9831143, 1.491553, 0.6214155, 1, 0.9372549, 0, 1,
-0.98129, 0.5470313, 0.3728608, 1, 0.9411765, 0, 1,
-0.9810604, -0.4808182, -2.842349, 1, 0.9490196, 0, 1,
-0.9809847, 0.1287038, -1.536796, 1, 0.9529412, 0, 1,
-0.9749579, 0.16824, -1.254364, 1, 0.9607843, 0, 1,
-0.9682944, -0.126418, -0.4264847, 1, 0.9647059, 0, 1,
-0.9674231, 0.5977904, -1.776007, 1, 0.972549, 0, 1,
-0.9527586, -0.4909196, -2.070294, 1, 0.9764706, 0, 1,
-0.9527355, 0.2082369, -1.610295, 1, 0.9843137, 0, 1,
-0.9526944, -0.2589718, -0.4162851, 1, 0.9882353, 0, 1,
-0.9518338, 0.9051803, 0.3187267, 1, 0.9960784, 0, 1,
-0.9431069, 1.228905, -1.544317, 0.9960784, 1, 0, 1,
-0.9412457, 0.5750121, -1.981181, 0.9921569, 1, 0, 1,
-0.9279683, 0.9106708, -0.6276147, 0.9843137, 1, 0, 1,
-0.9242843, 0.7858664, -1.646521, 0.9803922, 1, 0, 1,
-0.9235748, -2.129456, -2.8439, 0.972549, 1, 0, 1,
-0.9154915, -0.7692108, -1.929373, 0.9686275, 1, 0, 1,
-0.9127609, 0.3002131, -1.71084, 0.9607843, 1, 0, 1,
-0.9104989, 0.2964913, -1.861333, 0.9568627, 1, 0, 1,
-0.9101122, 0.8173844, -1.833127, 0.9490196, 1, 0, 1,
-0.9083515, 0.02787433, -1.572717, 0.945098, 1, 0, 1,
-0.9078193, 1.388638, -1.012119, 0.9372549, 1, 0, 1,
-0.9049097, 0.4631629, -1.408771, 0.9333333, 1, 0, 1,
-0.9037639, 1.040769, -0.3314197, 0.9254902, 1, 0, 1,
-0.898195, 1.210139, -0.8769292, 0.9215686, 1, 0, 1,
-0.8976042, -0.28644, -3.10412, 0.9137255, 1, 0, 1,
-0.8957657, 0.9507051, -0.262503, 0.9098039, 1, 0, 1,
-0.8763726, -0.3517877, -0.8322864, 0.9019608, 1, 0, 1,
-0.8722873, -1.56714, -3.828516, 0.8941177, 1, 0, 1,
-0.8705053, 1.2285, 0.01514092, 0.8901961, 1, 0, 1,
-0.8684468, 0.97283, -0.1712349, 0.8823529, 1, 0, 1,
-0.8669, -0.4990533, -2.267133, 0.8784314, 1, 0, 1,
-0.8625773, 0.6874501, -0.2177572, 0.8705882, 1, 0, 1,
-0.8608834, -0.6781173, -3.307048, 0.8666667, 1, 0, 1,
-0.8600404, 0.02548185, -2.878637, 0.8588235, 1, 0, 1,
-0.8547294, -0.2923188, -3.052107, 0.854902, 1, 0, 1,
-0.853191, -1.448838, -1.34002, 0.8470588, 1, 0, 1,
-0.8527076, -0.9314873, -2.418783, 0.8431373, 1, 0, 1,
-0.8462155, 0.461941, -0.8472065, 0.8352941, 1, 0, 1,
-0.845766, -1.30253, -4.297695, 0.8313726, 1, 0, 1,
-0.8448424, 1.224867, 0.8388163, 0.8235294, 1, 0, 1,
-0.8432088, -1.993316, -1.158891, 0.8196079, 1, 0, 1,
-0.8388147, -0.4242027, -3.152317, 0.8117647, 1, 0, 1,
-0.8337994, -0.7730176, -1.892872, 0.8078431, 1, 0, 1,
-0.8256677, 1.811569, -0.4192921, 0.8, 1, 0, 1,
-0.8238854, -0.6279787, -2.396096, 0.7921569, 1, 0, 1,
-0.8231484, 1.00605, -1.327075, 0.7882353, 1, 0, 1,
-0.817861, -1.253648, -0.8860862, 0.7803922, 1, 0, 1,
-0.8150439, 1.325058, 1.023837, 0.7764706, 1, 0, 1,
-0.8054993, -0.8112431, -3.157178, 0.7686275, 1, 0, 1,
-0.804112, -0.19018, -1.388149, 0.7647059, 1, 0, 1,
-0.8035812, -1.236292, -1.223292, 0.7568628, 1, 0, 1,
-0.8029558, 0.1272142, -0.4942146, 0.7529412, 1, 0, 1,
-0.7895932, 1.326648, 0.2538899, 0.7450981, 1, 0, 1,
-0.7844195, 1.058688, -0.8428178, 0.7411765, 1, 0, 1,
-0.7834325, -0.8196215, -2.592222, 0.7333333, 1, 0, 1,
-0.7820936, -0.2002117, -0.03046015, 0.7294118, 1, 0, 1,
-0.7773653, -1.378755, -0.9175337, 0.7215686, 1, 0, 1,
-0.7771304, 1.056733, -1.360998, 0.7176471, 1, 0, 1,
-0.7583771, 0.4315663, -1.657133, 0.7098039, 1, 0, 1,
-0.7571129, -0.4420432, -1.25636, 0.7058824, 1, 0, 1,
-0.7562355, -0.5837001, -2.070065, 0.6980392, 1, 0, 1,
-0.7422737, 0.8988127, 0.2959659, 0.6901961, 1, 0, 1,
-0.7418615, -0.1295535, -1.967199, 0.6862745, 1, 0, 1,
-0.738117, 1.26962, -0.3648112, 0.6784314, 1, 0, 1,
-0.7293027, 0.339146, -1.835295, 0.6745098, 1, 0, 1,
-0.7283587, 0.7780988, -2.740162, 0.6666667, 1, 0, 1,
-0.722631, -0.2543761, -2.622588, 0.6627451, 1, 0, 1,
-0.718311, 1.311985, -0.7046063, 0.654902, 1, 0, 1,
-0.7175848, 0.9611374, -0.9113393, 0.6509804, 1, 0, 1,
-0.6998247, -1.539838, -3.162843, 0.6431373, 1, 0, 1,
-0.6968552, -0.6342678, -3.838871, 0.6392157, 1, 0, 1,
-0.6964124, 0.1163464, -1.366634, 0.6313726, 1, 0, 1,
-0.6891636, 0.1219003, -1.103008, 0.627451, 1, 0, 1,
-0.687858, -0.9186455, -0.5664054, 0.6196079, 1, 0, 1,
-0.6865923, -0.08237744, -2.89661, 0.6156863, 1, 0, 1,
-0.6862132, 0.3745232, -0.5964952, 0.6078432, 1, 0, 1,
-0.6849676, -0.1628525, -1.338017, 0.6039216, 1, 0, 1,
-0.6842878, 1.665129, -0.4831714, 0.5960785, 1, 0, 1,
-0.6831688, 1.874674, 0.1811229, 0.5882353, 1, 0, 1,
-0.6815665, 0.9897686, 0.2314955, 0.5843138, 1, 0, 1,
-0.6707447, 0.9058297, -1.493611, 0.5764706, 1, 0, 1,
-0.6698111, -1.076146, -3.618519, 0.572549, 1, 0, 1,
-0.65332, 0.9239462, -1.040365, 0.5647059, 1, 0, 1,
-0.6526561, 0.7587753, -0.6614445, 0.5607843, 1, 0, 1,
-0.6503755, -0.5392064, -2.428476, 0.5529412, 1, 0, 1,
-0.6465032, -0.2106125, -1.714684, 0.5490196, 1, 0, 1,
-0.6413847, -0.9022434, -2.198965, 0.5411765, 1, 0, 1,
-0.6390315, -1.100541, -2.32225, 0.5372549, 1, 0, 1,
-0.636744, 1.787498, -0.6834671, 0.5294118, 1, 0, 1,
-0.6359824, -0.08633839, -1.713502, 0.5254902, 1, 0, 1,
-0.6358859, 0.2552274, -1.149734, 0.5176471, 1, 0, 1,
-0.6345565, -1.391854, -1.915085, 0.5137255, 1, 0, 1,
-0.6294721, 0.2904657, -1.503471, 0.5058824, 1, 0, 1,
-0.6273068, 0.3465322, 0.4640103, 0.5019608, 1, 0, 1,
-0.6256489, 1.188617, 0.1437609, 0.4941176, 1, 0, 1,
-0.6245172, -2.223717, -3.639013, 0.4862745, 1, 0, 1,
-0.6229574, -0.6715016, -2.220896, 0.4823529, 1, 0, 1,
-0.622243, -0.3561632, -2.560986, 0.4745098, 1, 0, 1,
-0.6198373, 0.1767382, -0.6755105, 0.4705882, 1, 0, 1,
-0.6156153, -0.2990728, -1.399856, 0.4627451, 1, 0, 1,
-0.6133921, -0.05935869, -1.207666, 0.4588235, 1, 0, 1,
-0.6048812, 1.462161, -0.9710578, 0.4509804, 1, 0, 1,
-0.5991278, 1.907938, 0.8976505, 0.4470588, 1, 0, 1,
-0.5942258, 1.132599, -0.288334, 0.4392157, 1, 0, 1,
-0.5772367, -0.580505, -3.317854, 0.4352941, 1, 0, 1,
-0.5740502, -0.8874665, -3.853497, 0.427451, 1, 0, 1,
-0.5689105, -0.2087865, -1.889941, 0.4235294, 1, 0, 1,
-0.5675992, -0.2234725, -2.411945, 0.4156863, 1, 0, 1,
-0.5659062, 1.565527, -1.739494, 0.4117647, 1, 0, 1,
-0.5648777, 0.3298272, -1.941622, 0.4039216, 1, 0, 1,
-0.5615572, 0.3532376, -1.284588, 0.3960784, 1, 0, 1,
-0.5591978, 0.487354, 0.370166, 0.3921569, 1, 0, 1,
-0.5582657, 0.4323564, -1.565805, 0.3843137, 1, 0, 1,
-0.5578697, -1.421044, -3.052039, 0.3803922, 1, 0, 1,
-0.5571685, 0.683629, -1.205136, 0.372549, 1, 0, 1,
-0.5560108, 0.7399872, -1.5854, 0.3686275, 1, 0, 1,
-0.5539167, 1.720182, 0.01405385, 0.3607843, 1, 0, 1,
-0.5519444, 0.6091713, -1.369772, 0.3568628, 1, 0, 1,
-0.5505792, -0.943422, -3.304053, 0.3490196, 1, 0, 1,
-0.5479094, -0.5095204, -2.750727, 0.345098, 1, 0, 1,
-0.5428257, 0.2249958, -2.139009, 0.3372549, 1, 0, 1,
-0.5420739, -0.6958542, -3.141904, 0.3333333, 1, 0, 1,
-0.5395288, 1.482808, -0.6957366, 0.3254902, 1, 0, 1,
-0.5388907, 0.4855094, -0.5297715, 0.3215686, 1, 0, 1,
-0.5354871, -0.3677475, -0.6901791, 0.3137255, 1, 0, 1,
-0.53375, 0.7375979, -1.292604, 0.3098039, 1, 0, 1,
-0.5324466, -2.544901, -2.198419, 0.3019608, 1, 0, 1,
-0.5321846, 0.6048147, -0.3544547, 0.2941177, 1, 0, 1,
-0.5294746, 0.8727353, -1.092134, 0.2901961, 1, 0, 1,
-0.5251149, 0.1239039, 0.004698572, 0.282353, 1, 0, 1,
-0.524509, -0.3400471, -3.21067, 0.2784314, 1, 0, 1,
-0.5220882, 1.002942, 0.1950967, 0.2705882, 1, 0, 1,
-0.5217585, -1.107803, -1.351538, 0.2666667, 1, 0, 1,
-0.5205553, 0.2872015, -1.100042, 0.2588235, 1, 0, 1,
-0.5175511, -1.036477, -5.052407, 0.254902, 1, 0, 1,
-0.5160078, -0.485616, -1.174276, 0.2470588, 1, 0, 1,
-0.5147641, 1.332649, 1.571416, 0.2431373, 1, 0, 1,
-0.5146675, 0.0298034, 0.05508106, 0.2352941, 1, 0, 1,
-0.5143676, 0.453431, -1.665175, 0.2313726, 1, 0, 1,
-0.5116813, -1.252637, -0.5188391, 0.2235294, 1, 0, 1,
-0.5110646, -0.2305771, -2.748582, 0.2196078, 1, 0, 1,
-0.5070509, -1.609037, -2.861314, 0.2117647, 1, 0, 1,
-0.5041419, 0.4424754, -1.290418, 0.2078431, 1, 0, 1,
-0.5014526, -0.2044544, -2.146976, 0.2, 1, 0, 1,
-0.5009391, 0.4969921, -0.9209554, 0.1921569, 1, 0, 1,
-0.4952603, -0.1771828, -1.291768, 0.1882353, 1, 0, 1,
-0.4929255, -0.02159268, -2.911014, 0.1803922, 1, 0, 1,
-0.4894367, 1.364429, -1.057254, 0.1764706, 1, 0, 1,
-0.4863809, -1.914259, -4.213094, 0.1686275, 1, 0, 1,
-0.4781235, 1.334643, -0.05310771, 0.1647059, 1, 0, 1,
-0.4743988, 0.2682607, -1.061081, 0.1568628, 1, 0, 1,
-0.4695359, -0.7513591, -2.694933, 0.1529412, 1, 0, 1,
-0.468145, 0.8002567, -0.9679917, 0.145098, 1, 0, 1,
-0.4598321, 1.533039, -0.4705202, 0.1411765, 1, 0, 1,
-0.4586731, 0.0581703, -2.475509, 0.1333333, 1, 0, 1,
-0.4571845, 0.05685934, -0.8977956, 0.1294118, 1, 0, 1,
-0.4570968, -0.1561732, -1.593264, 0.1215686, 1, 0, 1,
-0.4539678, 0.3782169, -0.6203601, 0.1176471, 1, 0, 1,
-0.4529596, 0.4288322, -0.4794046, 0.1098039, 1, 0, 1,
-0.4509832, 1.864937, -1.03426, 0.1058824, 1, 0, 1,
-0.4497252, 0.4170162, -0.1587804, 0.09803922, 1, 0, 1,
-0.4482133, -1.713102, -2.16235, 0.09019608, 1, 0, 1,
-0.447271, -0.494787, -3.16569, 0.08627451, 1, 0, 1,
-0.4436377, 0.4570619, -0.9108005, 0.07843138, 1, 0, 1,
-0.4433713, -0.2841444, -1.894022, 0.07450981, 1, 0, 1,
-0.4398746, -0.4136105, -2.242645, 0.06666667, 1, 0, 1,
-0.4339536, -0.8565324, -2.781864, 0.0627451, 1, 0, 1,
-0.4335614, -0.5506316, -3.489665, 0.05490196, 1, 0, 1,
-0.4302598, -1.889602, -3.186903, 0.05098039, 1, 0, 1,
-0.4302265, -1.6046, -3.021508, 0.04313726, 1, 0, 1,
-0.4268581, -1.632518, -2.383487, 0.03921569, 1, 0, 1,
-0.4265553, 1.046166, -0.8506476, 0.03137255, 1, 0, 1,
-0.4255617, -0.4466879, -1.659693, 0.02745098, 1, 0, 1,
-0.4229978, 0.5323663, -1.146802, 0.01960784, 1, 0, 1,
-0.4222, -0.2906353, -2.698351, 0.01568628, 1, 0, 1,
-0.4190365, -1.014105, -2.895705, 0.007843138, 1, 0, 1,
-0.414016, -0.5302283, -2.738578, 0.003921569, 1, 0, 1,
-0.4117229, -0.03340264, -2.529618, 0, 1, 0.003921569, 1,
-0.4114789, 0.2244651, -0.2406051, 0, 1, 0.01176471, 1,
-0.410782, 1.312686, 0.5190876, 0, 1, 0.01568628, 1,
-0.4082664, 0.2985324, -1.61017, 0, 1, 0.02352941, 1,
-0.4063848, -1.36174, -3.270955, 0, 1, 0.02745098, 1,
-0.401736, 1.41064, -1.414486, 0, 1, 0.03529412, 1,
-0.4002095, -1.101561, -2.307458, 0, 1, 0.03921569, 1,
-0.3902674, 0.5400317, -1.751464, 0, 1, 0.04705882, 1,
-0.3864985, 1.766325, -0.2080004, 0, 1, 0.05098039, 1,
-0.3751129, -1.696603, -1.234358, 0, 1, 0.05882353, 1,
-0.3748412, 0.8480194, 0.7586792, 0, 1, 0.0627451, 1,
-0.3723653, -2.066311, -1.265091, 0, 1, 0.07058824, 1,
-0.3654825, -1.541276, -4.803518, 0, 1, 0.07450981, 1,
-0.3580448, 1.317375, -0.3003287, 0, 1, 0.08235294, 1,
-0.3577666, 0.01992775, -1.092881, 0, 1, 0.08627451, 1,
-0.3518754, -0.717565, -3.330941, 0, 1, 0.09411765, 1,
-0.3405805, 1.56304, 1.179564, 0, 1, 0.1019608, 1,
-0.3405108, 0.2540977, -1.006978, 0, 1, 0.1058824, 1,
-0.3376178, 1.067448, 1.242553, 0, 1, 0.1137255, 1,
-0.3357489, -1.052987, -3.217937, 0, 1, 0.1176471, 1,
-0.3310158, -0.7160131, -3.013864, 0, 1, 0.1254902, 1,
-0.3309095, 0.9750482, -1.121452, 0, 1, 0.1294118, 1,
-0.3254037, 0.005210664, -1.848772, 0, 1, 0.1372549, 1,
-0.3232299, -1.055045, -4.139238, 0, 1, 0.1411765, 1,
-0.3203921, 0.3786253, 0.8117649, 0, 1, 0.1490196, 1,
-0.3156813, -0.3393976, -3.485967, 0, 1, 0.1529412, 1,
-0.3136834, -0.7599546, -4.427396, 0, 1, 0.1607843, 1,
-0.3122427, 1.097493, 1.591846, 0, 1, 0.1647059, 1,
-0.3055408, 0.07869348, -0.7572901, 0, 1, 0.172549, 1,
-0.3044104, 0.7873298, 0.6327072, 0, 1, 0.1764706, 1,
-0.2945953, -1.171611, -4.063588, 0, 1, 0.1843137, 1,
-0.2881849, -0.9806907, -1.067077, 0, 1, 0.1882353, 1,
-0.2868635, -1.257459, -2.308974, 0, 1, 0.1960784, 1,
-0.2837474, -0.4693799, -3.944547, 0, 1, 0.2039216, 1,
-0.2831229, -0.6741586, -2.71054, 0, 1, 0.2078431, 1,
-0.2816921, -0.282141, -1.777337, 0, 1, 0.2156863, 1,
-0.2767555, -1.297472, -4.229795, 0, 1, 0.2196078, 1,
-0.2748652, 0.6925806, 0.2986677, 0, 1, 0.227451, 1,
-0.2739878, 0.2846048, -0.6194943, 0, 1, 0.2313726, 1,
-0.2735558, 1.302366, -2.827784, 0, 1, 0.2392157, 1,
-0.2728683, -0.5743271, -3.294446, 0, 1, 0.2431373, 1,
-0.2725927, -0.8188113, -0.9969504, 0, 1, 0.2509804, 1,
-0.2700631, 1.038881, -0.7222518, 0, 1, 0.254902, 1,
-0.2692544, 0.8165222, -0.06219823, 0, 1, 0.2627451, 1,
-0.2689434, 0.8859724, 0.3413768, 0, 1, 0.2666667, 1,
-0.2640973, 1.443837, -0.7217268, 0, 1, 0.2745098, 1,
-0.2603732, 0.1430537, 0.7409126, 0, 1, 0.2784314, 1,
-0.2576639, 1.244247, 0.1183847, 0, 1, 0.2862745, 1,
-0.2560377, -0.1129727, -2.071114, 0, 1, 0.2901961, 1,
-0.2554542, -1.582078, -2.431986, 0, 1, 0.2980392, 1,
-0.2515082, -0.1047036, -2.264033, 0, 1, 0.3058824, 1,
-0.2450947, -0.1706501, -3.331764, 0, 1, 0.3098039, 1,
-0.2437846, -0.06169612, -1.151345, 0, 1, 0.3176471, 1,
-0.2381442, -0.2167522, -1.691857, 0, 1, 0.3215686, 1,
-0.2379219, 1.529529, -0.1278684, 0, 1, 0.3294118, 1,
-0.2355712, 0.1220791, -1.188765, 0, 1, 0.3333333, 1,
-0.2349102, -0.1075996, -1.88683, 0, 1, 0.3411765, 1,
-0.233429, 0.2250836, -1.505039, 0, 1, 0.345098, 1,
-0.2318223, -0.005028764, -3.137481, 0, 1, 0.3529412, 1,
-0.224032, -0.1553709, -0.2280488, 0, 1, 0.3568628, 1,
-0.2217197, 0.5780104, -1.286245, 0, 1, 0.3647059, 1,
-0.2204558, -0.5134677, -1.730077, 0, 1, 0.3686275, 1,
-0.2200332, -0.3538228, -2.030569, 0, 1, 0.3764706, 1,
-0.2157155, 0.3831269, -0.5053573, 0, 1, 0.3803922, 1,
-0.2105278, -0.9011346, -4.094844, 0, 1, 0.3882353, 1,
-0.2105233, -0.7263139, -2.549673, 0, 1, 0.3921569, 1,
-0.2102092, 0.4670185, -0.812534, 0, 1, 0.4, 1,
-0.2099213, -1.240567, -2.627613, 0, 1, 0.4078431, 1,
-0.2074877, -0.5558689, -2.46101, 0, 1, 0.4117647, 1,
-0.2043583, 0.005252369, -0.397794, 0, 1, 0.4196078, 1,
-0.2042178, 0.06118284, 0.04296248, 0, 1, 0.4235294, 1,
-0.203174, -2.085899, -3.442855, 0, 1, 0.4313726, 1,
-0.1980837, 0.2616245, -0.7080621, 0, 1, 0.4352941, 1,
-0.1971963, 0.6830289, 0.6839533, 0, 1, 0.4431373, 1,
-0.1965062, 0.3934332, -0.719757, 0, 1, 0.4470588, 1,
-0.1953488, 0.0617974, -1.174788, 0, 1, 0.454902, 1,
-0.1906628, 0.5963253, -1.045216, 0, 1, 0.4588235, 1,
-0.1884762, 0.5942932, -0.8590081, 0, 1, 0.4666667, 1,
-0.1871156, -0.5812765, -4.448857, 0, 1, 0.4705882, 1,
-0.1859506, -0.34382, -1.884325, 0, 1, 0.4784314, 1,
-0.1833123, 1.74272, 0.8178511, 0, 1, 0.4823529, 1,
-0.1831529, 0.1140757, 0.1175333, 0, 1, 0.4901961, 1,
-0.1811331, -1.617203, -3.534857, 0, 1, 0.4941176, 1,
-0.1772343, 3.469884, -0.4051366, 0, 1, 0.5019608, 1,
-0.1763568, 1.219813, 0.4213128, 0, 1, 0.509804, 1,
-0.1748922, -1.035311, -2.993639, 0, 1, 0.5137255, 1,
-0.1746249, -0.3954699, -1.973551, 0, 1, 0.5215687, 1,
-0.1702806, -0.2580296, -2.667532, 0, 1, 0.5254902, 1,
-0.1675532, -0.0249479, -1.978784, 0, 1, 0.5333334, 1,
-0.1668443, 0.5593891, -0.8392753, 0, 1, 0.5372549, 1,
-0.1632402, -0.8743855, -0.9552811, 0, 1, 0.5450981, 1,
-0.1586544, -0.4795358, -3.135463, 0, 1, 0.5490196, 1,
-0.1558273, 0.2792999, -0.2688394, 0, 1, 0.5568628, 1,
-0.1556928, -1.122895, -1.791921, 0, 1, 0.5607843, 1,
-0.1540866, 0.1368608, 0.432076, 0, 1, 0.5686275, 1,
-0.152934, -0.03651471, 0.6189173, 0, 1, 0.572549, 1,
-0.1519515, -1.821417, -3.746249, 0, 1, 0.5803922, 1,
-0.1473706, 0.2949983, -1.319538, 0, 1, 0.5843138, 1,
-0.138848, 1.017848, 0.1420949, 0, 1, 0.5921569, 1,
-0.137373, -1.639908, -2.983757, 0, 1, 0.5960785, 1,
-0.1339198, 1.287185, -0.6815867, 0, 1, 0.6039216, 1,
-0.1308207, 0.5154441, -0.4283718, 0, 1, 0.6117647, 1,
-0.1303193, -0.04244592, -2.47313, 0, 1, 0.6156863, 1,
-0.12968, 1.711073, -1.073442, 0, 1, 0.6235294, 1,
-0.1293346, 0.1283496, -0.2107446, 0, 1, 0.627451, 1,
-0.1284505, 0.2585658, -1.159932, 0, 1, 0.6352941, 1,
-0.1270327, -0.7653122, -1.243268, 0, 1, 0.6392157, 1,
-0.1225432, 0.5825226, -0.8070001, 0, 1, 0.6470588, 1,
-0.1181248, -0.9889625, -2.818891, 0, 1, 0.6509804, 1,
-0.1081658, -0.1088283, -3.738816, 0, 1, 0.6588235, 1,
-0.1073264, 1.413049, 0.1136519, 0, 1, 0.6627451, 1,
-0.105942, 0.8702185, 0.6358971, 0, 1, 0.6705883, 1,
-0.1039958, -1.452122, -3.91656, 0, 1, 0.6745098, 1,
-0.1029404, -1.287439, -2.027729, 0, 1, 0.682353, 1,
-0.09863603, 0.5339429, -0.3678856, 0, 1, 0.6862745, 1,
-0.09651858, 0.6553008, -0.7290406, 0, 1, 0.6941177, 1,
-0.09425315, -0.02754989, -1.666982, 0, 1, 0.7019608, 1,
-0.09265169, -0.1916043, -3.283575, 0, 1, 0.7058824, 1,
-0.09193943, -0.2444641, -2.341653, 0, 1, 0.7137255, 1,
-0.08826071, -0.7724895, -4.289724, 0, 1, 0.7176471, 1,
-0.08771717, 0.06836552, -2.783831, 0, 1, 0.7254902, 1,
-0.08588919, -0.7189276, -3.186864, 0, 1, 0.7294118, 1,
-0.08512241, 0.3475079, -1.050974, 0, 1, 0.7372549, 1,
-0.08265024, 0.618439, -1.002404, 0, 1, 0.7411765, 1,
-0.0813125, -0.1025636, -3.179788, 0, 1, 0.7490196, 1,
-0.08040757, 0.2988482, -0.6460502, 0, 1, 0.7529412, 1,
-0.08030822, -1.128785, -4.151657, 0, 1, 0.7607843, 1,
-0.07476902, -0.07439467, -2.889199, 0, 1, 0.7647059, 1,
-0.07068139, 0.0332362, -3.394401, 0, 1, 0.772549, 1,
-0.06326307, -0.3900503, -2.45558, 0, 1, 0.7764706, 1,
-0.06087034, -0.7809983, -2.034028, 0, 1, 0.7843137, 1,
-0.05951682, 0.1144223, -0.4344889, 0, 1, 0.7882353, 1,
-0.05730411, -0.8778185, -3.294098, 0, 1, 0.7960784, 1,
-0.05538001, 0.002196786, -1.927548, 0, 1, 0.8039216, 1,
-0.04605867, 0.9126133, 1.219193, 0, 1, 0.8078431, 1,
-0.04575134, 0.7362961, 2.226719, 0, 1, 0.8156863, 1,
-0.04559684, 1.073092, -0.2413445, 0, 1, 0.8196079, 1,
-0.03730959, 0.3332264, 0.1975579, 0, 1, 0.827451, 1,
-0.03607386, 1.027498, -0.278716, 0, 1, 0.8313726, 1,
-0.03447297, 0.3624143, 0.3021205, 0, 1, 0.8392157, 1,
-0.03344075, -0.7567518, -2.686109, 0, 1, 0.8431373, 1,
-0.0315766, 1.854552, -0.1856042, 0, 1, 0.8509804, 1,
-0.03108284, -1.241466, -4.77668, 0, 1, 0.854902, 1,
-0.03028112, 0.26225, 0.1217174, 0, 1, 0.8627451, 1,
-0.02919723, 1.428582, 0.7081409, 0, 1, 0.8666667, 1,
-0.02892938, -0.04683164, -1.643719, 0, 1, 0.8745098, 1,
-0.02709267, 0.2405761, -2.000306, 0, 1, 0.8784314, 1,
-0.02459916, -2.219839, -3.567087, 0, 1, 0.8862745, 1,
-0.02405558, -0.2360513, -4.224916, 0, 1, 0.8901961, 1,
-0.02182875, 1.31776, -0.2568818, 0, 1, 0.8980392, 1,
-0.0193931, 2.122119, 0.3060872, 0, 1, 0.9058824, 1,
-0.01757614, 0.2988941, 1.827657, 0, 1, 0.9098039, 1,
-0.01693985, 1.607489, 3.057234, 0, 1, 0.9176471, 1,
-0.0123204, 0.3980818, -0.4149622, 0, 1, 0.9215686, 1,
-0.01125187, 1.069167, -1.058541, 0, 1, 0.9294118, 1,
-0.01084735, -0.1749726, -3.497812, 0, 1, 0.9333333, 1,
-0.008904045, 1.970077, 0.4860836, 0, 1, 0.9411765, 1,
-0.008753053, 1.187123, -0.5365809, 0, 1, 0.945098, 1,
-0.007614393, -0.4690621, -3.295952, 0, 1, 0.9529412, 1,
-0.003983919, -1.640053, -3.039637, 0, 1, 0.9568627, 1,
-0.001405367, -0.2777927, -1.169949, 0, 1, 0.9647059, 1,
-5.81846e-05, -0.5046509, -2.976659, 0, 1, 0.9686275, 1,
0.0007028919, 0.08871166, -0.7570382, 0, 1, 0.9764706, 1,
0.001256326, 0.5115146, -0.9323501, 0, 1, 0.9803922, 1,
0.001621628, -0.3988276, 4.51815, 0, 1, 0.9882353, 1,
0.002918315, 1.072622, -1.566397, 0, 1, 0.9921569, 1,
0.006750029, 2.65834, -1.394731, 0, 1, 1, 1,
0.009085527, -1.44861, 2.907222, 0, 0.9921569, 1, 1,
0.01062085, 0.4656172, 1.844093, 0, 0.9882353, 1, 1,
0.01442856, 1.870479, 1.245717, 0, 0.9803922, 1, 1,
0.01450358, 1.896461, 0.893755, 0, 0.9764706, 1, 1,
0.01490184, 0.0534514, 0.3791035, 0, 0.9686275, 1, 1,
0.01518341, -1.687919, 2.915871, 0, 0.9647059, 1, 1,
0.02068511, -1.610427, 3.19898, 0, 0.9568627, 1, 1,
0.02127611, 0.7277725, 0.2409091, 0, 0.9529412, 1, 1,
0.02394319, -0.4226297, 2.761626, 0, 0.945098, 1, 1,
0.0251025, 1.304016, -0.6741532, 0, 0.9411765, 1, 1,
0.02800979, 0.4131871, 0.5298231, 0, 0.9333333, 1, 1,
0.03100246, 0.006581932, 1.44017, 0, 0.9294118, 1, 1,
0.03400408, 0.7221504, -1.267016, 0, 0.9215686, 1, 1,
0.03471458, -1.36403, 3.405286, 0, 0.9176471, 1, 1,
0.03541349, -0.6655748, 2.942122, 0, 0.9098039, 1, 1,
0.03556432, 0.4808183, -1.042967, 0, 0.9058824, 1, 1,
0.03607957, -0.6207814, 3.82378, 0, 0.8980392, 1, 1,
0.03628702, -0.6517755, 2.661124, 0, 0.8901961, 1, 1,
0.03642563, 2.31824, 0.6166778, 0, 0.8862745, 1, 1,
0.0386547, 2.443033, -2.728574, 0, 0.8784314, 1, 1,
0.04150907, 1.570274, 0.8902299, 0, 0.8745098, 1, 1,
0.04415628, 0.0009186898, 3.377202, 0, 0.8666667, 1, 1,
0.04417827, -0.9632698, 1.900462, 0, 0.8627451, 1, 1,
0.04644752, -0.7107189, 1.923901, 0, 0.854902, 1, 1,
0.04794171, -1.241511, 4.514066, 0, 0.8509804, 1, 1,
0.05734923, 0.6094229, -0.1813045, 0, 0.8431373, 1, 1,
0.06494192, 0.8320616, 1.127546, 0, 0.8392157, 1, 1,
0.06650984, -1.026746, 4.561553, 0, 0.8313726, 1, 1,
0.06833436, 2.01358, -1.473296, 0, 0.827451, 1, 1,
0.06897248, 0.2692493, 0.6987745, 0, 0.8196079, 1, 1,
0.07555474, -0.009534883, 3.755696, 0, 0.8156863, 1, 1,
0.07832689, -0.9870281, 3.682621, 0, 0.8078431, 1, 1,
0.08000266, 0.5522174, -0.4111124, 0, 0.8039216, 1, 1,
0.08103079, 1.017882, -0.7097079, 0, 0.7960784, 1, 1,
0.08147562, -0.8849156, 2.953065, 0, 0.7882353, 1, 1,
0.08539572, -0.1649249, 3.215877, 0, 0.7843137, 1, 1,
0.08768213, 0.3312429, 1.568968, 0, 0.7764706, 1, 1,
0.08777916, 0.3957399, -0.2536696, 0, 0.772549, 1, 1,
0.08993728, 2.301622, -1.593899, 0, 0.7647059, 1, 1,
0.08993995, -0.7189474, 2.942177, 0, 0.7607843, 1, 1,
0.09149655, 1.023043, 0.4544154, 0, 0.7529412, 1, 1,
0.09359916, -0.7392985, 2.166719, 0, 0.7490196, 1, 1,
0.09431355, 1.299422, 0.1315959, 0, 0.7411765, 1, 1,
0.09459656, 0.8125128, 0.4266468, 0, 0.7372549, 1, 1,
0.09549335, -0.1863995, 3.376617, 0, 0.7294118, 1, 1,
0.1057067, -0.2710935, 1.184234, 0, 0.7254902, 1, 1,
0.1063355, -0.227458, 2.299785, 0, 0.7176471, 1, 1,
0.1079205, -0.1168824, 1.104535, 0, 0.7137255, 1, 1,
0.1109126, 0.5479167, -0.6091911, 0, 0.7058824, 1, 1,
0.1144626, 0.8919141, 0.3352314, 0, 0.6980392, 1, 1,
0.1149989, -0.6338477, 4.049663, 0, 0.6941177, 1, 1,
0.11546, 1.062243, 0.8246088, 0, 0.6862745, 1, 1,
0.1157671, 1.045866, 0.1270478, 0, 0.682353, 1, 1,
0.1170145, 0.1947059, -0.4717523, 0, 0.6745098, 1, 1,
0.1269381, 0.1621861, -1.876412, 0, 0.6705883, 1, 1,
0.1270071, 1.76813, 1.544887, 0, 0.6627451, 1, 1,
0.127492, 1.447437, -0.2238959, 0, 0.6588235, 1, 1,
0.1280287, 0.4999009, -1.663682, 0, 0.6509804, 1, 1,
0.1307834, 1.560838, -1.089418, 0, 0.6470588, 1, 1,
0.1312, 0.8778529, 0.6702237, 0, 0.6392157, 1, 1,
0.1329571, -0.4997236, 2.534661, 0, 0.6352941, 1, 1,
0.1334659, -0.3283744, 4.633815, 0, 0.627451, 1, 1,
0.1354912, 0.5287377, -0.1777827, 0, 0.6235294, 1, 1,
0.1393123, -0.9997359, 3.462767, 0, 0.6156863, 1, 1,
0.1395923, -0.3038752, 4.213155, 0, 0.6117647, 1, 1,
0.1424421, -0.859877, 2.324492, 0, 0.6039216, 1, 1,
0.1431447, -0.1398138, 2.25806, 0, 0.5960785, 1, 1,
0.1520709, -1.382824, 1.437309, 0, 0.5921569, 1, 1,
0.1521287, 0.2608236, 0.03548966, 0, 0.5843138, 1, 1,
0.1536069, -0.980577, 3.604281, 0, 0.5803922, 1, 1,
0.153956, -0.3364361, 2.559193, 0, 0.572549, 1, 1,
0.1547686, 1.211582, -0.943312, 0, 0.5686275, 1, 1,
0.1577272, -0.8435206, 1.659691, 0, 0.5607843, 1, 1,
0.1578528, -0.2506236, 1.576556, 0, 0.5568628, 1, 1,
0.1580423, 0.588466, 0.5930643, 0, 0.5490196, 1, 1,
0.1597733, 0.4010212, 0.8251437, 0, 0.5450981, 1, 1,
0.1629176, -0.8999041, 1.623002, 0, 0.5372549, 1, 1,
0.1643875, 1.461038, 0.6278191, 0, 0.5333334, 1, 1,
0.1663873, 0.841405, -0.04977331, 0, 0.5254902, 1, 1,
0.1717992, -0.3275984, 1.173899, 0, 0.5215687, 1, 1,
0.1720085, -0.8207217, 5.288536, 0, 0.5137255, 1, 1,
0.1724764, 1.198865, 0.7268177, 0, 0.509804, 1, 1,
0.174462, -1.657319, 3.94351, 0, 0.5019608, 1, 1,
0.1751941, -0.1221104, 3.032298, 0, 0.4941176, 1, 1,
0.1770025, -0.5219815, 3.336378, 0, 0.4901961, 1, 1,
0.1773218, 0.6646911, -0.353326, 0, 0.4823529, 1, 1,
0.1773468, -1.587849, 4.033882, 0, 0.4784314, 1, 1,
0.1823349, -0.8351204, 1.049842, 0, 0.4705882, 1, 1,
0.1824518, -0.5984514, 4.236805, 0, 0.4666667, 1, 1,
0.1830602, 0.7050574, 0.4495643, 0, 0.4588235, 1, 1,
0.1885632, 1.026498, 1.14044, 0, 0.454902, 1, 1,
0.1900361, -1.296171, 1.671783, 0, 0.4470588, 1, 1,
0.1933534, -0.9821618, 4.917252, 0, 0.4431373, 1, 1,
0.1966323, -1.237054, 4.075293, 0, 0.4352941, 1, 1,
0.1975464, 0.01691007, 0.341807, 0, 0.4313726, 1, 1,
0.2000953, -0.1012924, 2.803937, 0, 0.4235294, 1, 1,
0.2089527, -0.2916926, 0.8758268, 0, 0.4196078, 1, 1,
0.2093563, -1.298049, 3.415039, 0, 0.4117647, 1, 1,
0.2134964, -0.8215419, 4.219811, 0, 0.4078431, 1, 1,
0.2159555, -0.8561013, 3.385636, 0, 0.4, 1, 1,
0.2164797, -0.4309605, 2.790424, 0, 0.3921569, 1, 1,
0.2198726, -1.033872, 3.004499, 0, 0.3882353, 1, 1,
0.2213511, -0.7072812, 3.419229, 0, 0.3803922, 1, 1,
0.2237019, 0.2145337, -0.8670531, 0, 0.3764706, 1, 1,
0.2246301, -1.941432, 1.419126, 0, 0.3686275, 1, 1,
0.2247109, 1.150429, 0.05345684, 0, 0.3647059, 1, 1,
0.226102, -1.219717, 0.8931533, 0, 0.3568628, 1, 1,
0.226822, -1.211283, 2.496121, 0, 0.3529412, 1, 1,
0.2326333, -0.6130185, 2.516786, 0, 0.345098, 1, 1,
0.2395915, -1.036116, 2.307033, 0, 0.3411765, 1, 1,
0.244412, 0.06328701, 0.8016776, 0, 0.3333333, 1, 1,
0.2464173, 0.1369652, 1.580697, 0, 0.3294118, 1, 1,
0.2488392, 0.655337, 1.175238, 0, 0.3215686, 1, 1,
0.2547249, 2.136102, -0.2153314, 0, 0.3176471, 1, 1,
0.2549894, 0.3598292, 1.432204, 0, 0.3098039, 1, 1,
0.2570877, -0.9524384, 2.661564, 0, 0.3058824, 1, 1,
0.2580965, -0.7801826, 1.500929, 0, 0.2980392, 1, 1,
0.2583678, -0.05960494, 1.857256, 0, 0.2901961, 1, 1,
0.2589364, 2.323224, 0.8956781, 0, 0.2862745, 1, 1,
0.2589472, -0.7129639, 2.784629, 0, 0.2784314, 1, 1,
0.2594194, -0.4679368, 1.653385, 0, 0.2745098, 1, 1,
0.2595494, 0.4574985, -0.8990998, 0, 0.2666667, 1, 1,
0.2644521, -0.3480489, 0.4625874, 0, 0.2627451, 1, 1,
0.2647509, -0.8147151, 3.751291, 0, 0.254902, 1, 1,
0.2656132, -2.777995, 1.451985, 0, 0.2509804, 1, 1,
0.2678096, -1.204839, 4.795683, 0, 0.2431373, 1, 1,
0.2687014, 0.5444658, -0.4012696, 0, 0.2392157, 1, 1,
0.2709426, -0.8612136, 4.496404, 0, 0.2313726, 1, 1,
0.2721775, -1.581531, 3.58227, 0, 0.227451, 1, 1,
0.2731212, -0.7219093, 2.494993, 0, 0.2196078, 1, 1,
0.2734222, -0.5108266, 2.567786, 0, 0.2156863, 1, 1,
0.2738847, -0.5323125, 4.231899, 0, 0.2078431, 1, 1,
0.2749244, -1.469361, 2.002784, 0, 0.2039216, 1, 1,
0.2767364, -0.002477491, 3.694634, 0, 0.1960784, 1, 1,
0.2780784, 0.2902018, 1.960212, 0, 0.1882353, 1, 1,
0.2791241, -1.275562, 2.320981, 0, 0.1843137, 1, 1,
0.2810362, -0.5324383, 2.867908, 0, 0.1764706, 1, 1,
0.2828813, -0.3258691, 2.382213, 0, 0.172549, 1, 1,
0.2828961, -0.2368722, -0.1746362, 0, 0.1647059, 1, 1,
0.2851284, 0.2916829, 0.03967081, 0, 0.1607843, 1, 1,
0.2891654, 1.075569, 2.487572, 0, 0.1529412, 1, 1,
0.2897228, -0.1080142, 1.312685, 0, 0.1490196, 1, 1,
0.2960549, 0.350329, 2.470781, 0, 0.1411765, 1, 1,
0.2996703, 0.7408923, 0.7136916, 0, 0.1372549, 1, 1,
0.3003597, 0.01428123, 0.5549702, 0, 0.1294118, 1, 1,
0.3038341, -0.07884727, 1.441643, 0, 0.1254902, 1, 1,
0.3070929, 0.3217966, 1.896569, 0, 0.1176471, 1, 1,
0.3074076, 0.6305647, -0.343253, 0, 0.1137255, 1, 1,
0.31694, 1.273463, 1.494317, 0, 0.1058824, 1, 1,
0.3172312, -1.562515, 1.88988, 0, 0.09803922, 1, 1,
0.3173512, -1.270797, 3.47494, 0, 0.09411765, 1, 1,
0.3192029, -0.5412381, 0.07967632, 0, 0.08627451, 1, 1,
0.3220531, -0.8835706, 2.480983, 0, 0.08235294, 1, 1,
0.3238291, -0.5638427, 1.757791, 0, 0.07450981, 1, 1,
0.3297435, -0.6553234, 0.7708572, 0, 0.07058824, 1, 1,
0.3301201, 1.101261, 2.67049, 0, 0.0627451, 1, 1,
0.3306924, -0.8115038, 3.118874, 0, 0.05882353, 1, 1,
0.3337215, -1.157974, 2.491338, 0, 0.05098039, 1, 1,
0.3457104, 1.872411, 0.8326189, 0, 0.04705882, 1, 1,
0.3470173, 0.08267967, -0.5059047, 0, 0.03921569, 1, 1,
0.3507472, 1.677144, -0.5809938, 0, 0.03529412, 1, 1,
0.3544975, -1.683765, 4.383241, 0, 0.02745098, 1, 1,
0.3546004, -1.460789, 3.900338, 0, 0.02352941, 1, 1,
0.3547725, 0.308185, 0.3860569, 0, 0.01568628, 1, 1,
0.3567798, -0.1638826, 2.997515, 0, 0.01176471, 1, 1,
0.3594516, 0.8726339, 0.1111947, 0, 0.003921569, 1, 1,
0.366972, 0.2156727, 2.024132, 0.003921569, 0, 1, 1,
0.373528, 0.4079141, 0.8350853, 0.007843138, 0, 1, 1,
0.3788446, -0.6165559, 4.917488, 0.01568628, 0, 1, 1,
0.3793633, -0.5176925, 2.361982, 0.01960784, 0, 1, 1,
0.3821202, -1.533474, 3.290213, 0.02745098, 0, 1, 1,
0.3843023, 0.6160598, -0.4926904, 0.03137255, 0, 1, 1,
0.386294, 0.8131779, -0.4711875, 0.03921569, 0, 1, 1,
0.3866965, -0.5689859, 3.615532, 0.04313726, 0, 1, 1,
0.3930567, 0.6311646, 1.713915, 0.05098039, 0, 1, 1,
0.3961276, -0.799189, 2.333695, 0.05490196, 0, 1, 1,
0.396381, -0.4052473, 1.284949, 0.0627451, 0, 1, 1,
0.400019, 0.150749, 2.281323, 0.06666667, 0, 1, 1,
0.4013917, 1.215199, -0.6644437, 0.07450981, 0, 1, 1,
0.4023156, -0.2000894, 2.335998, 0.07843138, 0, 1, 1,
0.4032388, 0.1879841, 0.9766716, 0.08627451, 0, 1, 1,
0.4043173, 1.619409, -0.6151873, 0.09019608, 0, 1, 1,
0.4051923, 1.619183, 1.133198, 0.09803922, 0, 1, 1,
0.4065778, 0.2695483, 1.578077, 0.1058824, 0, 1, 1,
0.4079395, -0.6640207, 2.077266, 0.1098039, 0, 1, 1,
0.4189655, -0.5719884, 3.717222, 0.1176471, 0, 1, 1,
0.4195878, -1.437489, 3.055223, 0.1215686, 0, 1, 1,
0.4201086, 0.3822566, 0.6393144, 0.1294118, 0, 1, 1,
0.4268974, 1.080777, 0.2352911, 0.1333333, 0, 1, 1,
0.4273067, -0.417701, 2.946317, 0.1411765, 0, 1, 1,
0.4297241, -0.7053586, 4.394561, 0.145098, 0, 1, 1,
0.4307108, 2.096319, -0.4610629, 0.1529412, 0, 1, 1,
0.4417806, -0.6383371, 2.5612, 0.1568628, 0, 1, 1,
0.4421513, 0.3875944, 0.8533021, 0.1647059, 0, 1, 1,
0.4432645, 0.7653924, 0.1685425, 0.1686275, 0, 1, 1,
0.4460012, -0.5913821, 1.490709, 0.1764706, 0, 1, 1,
0.4505863, 0.4614189, -0.441629, 0.1803922, 0, 1, 1,
0.4553628, -1.412805, 0.4153644, 0.1882353, 0, 1, 1,
0.4560692, 0.20989, -0.01892131, 0.1921569, 0, 1, 1,
0.4564464, 0.7765127, 0.3360419, 0.2, 0, 1, 1,
0.4643083, 0.1031596, 1.48332, 0.2078431, 0, 1, 1,
0.4778939, 0.1217782, 1.773924, 0.2117647, 0, 1, 1,
0.4784003, -0.7517502, 2.652053, 0.2196078, 0, 1, 1,
0.4891401, 0.6430789, 0.9798277, 0.2235294, 0, 1, 1,
0.4900315, -0.3850541, 4.185385, 0.2313726, 0, 1, 1,
0.4944253, -0.4109973, 3.097691, 0.2352941, 0, 1, 1,
0.4981401, 0.5109712, -0.6169407, 0.2431373, 0, 1, 1,
0.4984213, -0.3569627, 3.06837, 0.2470588, 0, 1, 1,
0.4985719, 2.463722, 0.413815, 0.254902, 0, 1, 1,
0.4986978, -1.832976, 1.8149, 0.2588235, 0, 1, 1,
0.4987864, -0.2049846, 0.7367781, 0.2666667, 0, 1, 1,
0.5059636, -0.4112295, 2.68955, 0.2705882, 0, 1, 1,
0.508854, -1.820249, 3.224081, 0.2784314, 0, 1, 1,
0.5095944, 0.3661095, 1.247702, 0.282353, 0, 1, 1,
0.5108041, 0.05281706, 3.299338, 0.2901961, 0, 1, 1,
0.5120312, 0.3806671, 1.217834, 0.2941177, 0, 1, 1,
0.5130302, -0.7670292, 3.267311, 0.3019608, 0, 1, 1,
0.5163713, -1.49768, 2.482976, 0.3098039, 0, 1, 1,
0.5206997, -0.1660068, 1.668673, 0.3137255, 0, 1, 1,
0.5240463, 0.3317039, 0.570491, 0.3215686, 0, 1, 1,
0.5287477, -1.142666, 3.156032, 0.3254902, 0, 1, 1,
0.5318546, -0.9895805, 2.663036, 0.3333333, 0, 1, 1,
0.5328804, -0.6246921, 2.008764, 0.3372549, 0, 1, 1,
0.5365121, -0.5432492, 2.042438, 0.345098, 0, 1, 1,
0.541783, 0.02365635, 1.550158, 0.3490196, 0, 1, 1,
0.5460353, 2.201551, -1.643246, 0.3568628, 0, 1, 1,
0.5473173, -1.507787, 4.091891, 0.3607843, 0, 1, 1,
0.5501176, -0.5277776, 2.720659, 0.3686275, 0, 1, 1,
0.5545102, 2.382305, 1.3249, 0.372549, 0, 1, 1,
0.5689133, 2.089376, 0.517558, 0.3803922, 0, 1, 1,
0.5708218, 1.230209, 0.7688532, 0.3843137, 0, 1, 1,
0.5723731, -1.484711, 2.519139, 0.3921569, 0, 1, 1,
0.5800141, 0.271647, 2.465143, 0.3960784, 0, 1, 1,
0.5857959, 0.6967058, 0.5503791, 0.4039216, 0, 1, 1,
0.5933148, 0.367347, 0.8694526, 0.4117647, 0, 1, 1,
0.6022453, 2.038969, 1.034181, 0.4156863, 0, 1, 1,
0.6037184, -0.1101528, 1.823984, 0.4235294, 0, 1, 1,
0.6049441, -1.462201, 3.093472, 0.427451, 0, 1, 1,
0.6077009, 0.2475174, 0.9119794, 0.4352941, 0, 1, 1,
0.608925, -0.1100314, 3.066513, 0.4392157, 0, 1, 1,
0.6154248, 0.4181902, 1.935334, 0.4470588, 0, 1, 1,
0.6172414, -0.19001, 1.208578, 0.4509804, 0, 1, 1,
0.6198922, -0.9368622, 2.470508, 0.4588235, 0, 1, 1,
0.6199045, 0.3054674, 2.687734, 0.4627451, 0, 1, 1,
0.6253672, 1.383426, 0.8594467, 0.4705882, 0, 1, 1,
0.6290126, 1.685616, 1.490865, 0.4745098, 0, 1, 1,
0.6318833, 1.485141, -0.1432461, 0.4823529, 0, 1, 1,
0.6343212, -0.1526048, 2.261417, 0.4862745, 0, 1, 1,
0.6347513, 1.095681, -1.057961, 0.4941176, 0, 1, 1,
0.635538, -1.057928, 2.668479, 0.5019608, 0, 1, 1,
0.6469446, -0.06439641, -0.1495618, 0.5058824, 0, 1, 1,
0.647835, 1.77832, 1.101847, 0.5137255, 0, 1, 1,
0.6483247, -1.674016, 1.147157, 0.5176471, 0, 1, 1,
0.6517375, -0.2988099, 1.840266, 0.5254902, 0, 1, 1,
0.6523197, -0.3126202, 1.816904, 0.5294118, 0, 1, 1,
0.6523513, -1.613438, 3.039185, 0.5372549, 0, 1, 1,
0.6567056, 0.2527131, 0.779988, 0.5411765, 0, 1, 1,
0.6659608, 1.777714, -1.248624, 0.5490196, 0, 1, 1,
0.666869, -0.04990483, 4.204767, 0.5529412, 0, 1, 1,
0.6681891, -0.3145209, 1.713931, 0.5607843, 0, 1, 1,
0.6703504, -0.9949235, 2.145639, 0.5647059, 0, 1, 1,
0.6705368, 0.5979204, 0.7369453, 0.572549, 0, 1, 1,
0.6775953, -0.108343, 1.293387, 0.5764706, 0, 1, 1,
0.6780759, 1.550957, 0.3335604, 0.5843138, 0, 1, 1,
0.6782317, -1.202749, 1.810446, 0.5882353, 0, 1, 1,
0.6791489, 1.661515, -0.9782537, 0.5960785, 0, 1, 1,
0.6823505, 0.2863904, 1.560276, 0.6039216, 0, 1, 1,
0.6875012, -1.620887, 2.61246, 0.6078432, 0, 1, 1,
0.689685, 0.51773, -0.4422524, 0.6156863, 0, 1, 1,
0.6975083, 0.4376836, 0.2912024, 0.6196079, 0, 1, 1,
0.6998658, 0.4930811, 1.044737, 0.627451, 0, 1, 1,
0.7003031, 0.2479792, -0.1468528, 0.6313726, 0, 1, 1,
0.7037749, 0.3042512, 0.08208256, 0.6392157, 0, 1, 1,
0.7086799, -0.08745972, 1.267161, 0.6431373, 0, 1, 1,
0.7112659, 0.9883339, 1.293591, 0.6509804, 0, 1, 1,
0.7153071, 1.05426, 0.1085746, 0.654902, 0, 1, 1,
0.7161428, 0.6470158, -0.149721, 0.6627451, 0, 1, 1,
0.7169425, -0.4964912, 2.432749, 0.6666667, 0, 1, 1,
0.7186131, -0.1293158, 1.243352, 0.6745098, 0, 1, 1,
0.7214805, -0.8178316, 1.234294, 0.6784314, 0, 1, 1,
0.7237378, -0.07107621, 3.059522, 0.6862745, 0, 1, 1,
0.7309077, -0.7211837, 2.483655, 0.6901961, 0, 1, 1,
0.734454, -0.7979885, 1.794268, 0.6980392, 0, 1, 1,
0.7391689, 1.097606, -0.1457433, 0.7058824, 0, 1, 1,
0.7440952, 1.071601, 0.4330216, 0.7098039, 0, 1, 1,
0.7553786, -0.822598, 3.512892, 0.7176471, 0, 1, 1,
0.7624126, -0.1811716, 2.104391, 0.7215686, 0, 1, 1,
0.7725812, -0.4247193, 1.528613, 0.7294118, 0, 1, 1,
0.7748638, 1.778132, -0.5218598, 0.7333333, 0, 1, 1,
0.7778639, -1.642925, 4.606709, 0.7411765, 0, 1, 1,
0.780525, -0.3698239, -0.05289089, 0.7450981, 0, 1, 1,
0.8029292, -0.02459701, 2.173549, 0.7529412, 0, 1, 1,
0.8089049, -0.428559, 1.191706, 0.7568628, 0, 1, 1,
0.8113056, -0.6724865, 2.283902, 0.7647059, 0, 1, 1,
0.8135111, 0.6529325, -1.116409, 0.7686275, 0, 1, 1,
0.8199657, 0.2940197, 0.8655877, 0.7764706, 0, 1, 1,
0.8219271, -1.28727, 2.785904, 0.7803922, 0, 1, 1,
0.822971, -0.6991417, 2.880676, 0.7882353, 0, 1, 1,
0.8267103, 0.9195631, 0.5783328, 0.7921569, 0, 1, 1,
0.8273412, -0.262253, 1.828916, 0.8, 0, 1, 1,
0.8281121, 0.4709483, 0.7481326, 0.8078431, 0, 1, 1,
0.837027, -0.8136299, 2.136512, 0.8117647, 0, 1, 1,
0.8370408, 0.7112284, 2.069667, 0.8196079, 0, 1, 1,
0.8379765, -0.05759526, 2.700015, 0.8235294, 0, 1, 1,
0.8434681, -0.4664492, 2.687327, 0.8313726, 0, 1, 1,
0.8580887, 0.05463158, 1.669141, 0.8352941, 0, 1, 1,
0.8697023, 0.4480928, 1.242468, 0.8431373, 0, 1, 1,
0.874173, -0.3838306, 1.411442, 0.8470588, 0, 1, 1,
0.874738, -1.694767, 3.072101, 0.854902, 0, 1, 1,
0.8747489, -0.3813219, 1.640865, 0.8588235, 0, 1, 1,
0.8796365, 1.505568, 0.9625888, 0.8666667, 0, 1, 1,
0.8832017, -0.261028, 2.219772, 0.8705882, 0, 1, 1,
0.8860709, -1.682971, 2.917951, 0.8784314, 0, 1, 1,
0.8900555, 1.890502, 1.549204, 0.8823529, 0, 1, 1,
0.8914643, -1.072655, 2.537153, 0.8901961, 0, 1, 1,
0.8977938, -0.5634398, 1.820319, 0.8941177, 0, 1, 1,
0.9011815, 1.197014, 1.509292, 0.9019608, 0, 1, 1,
0.9018533, 1.414871, 0.8024033, 0.9098039, 0, 1, 1,
0.9040785, -2.159954, 3.898745, 0.9137255, 0, 1, 1,
0.909836, 0.2555457, 0.9873027, 0.9215686, 0, 1, 1,
0.912255, 0.007216776, 1.419443, 0.9254902, 0, 1, 1,
0.9123629, 0.8667192, 0.5066496, 0.9333333, 0, 1, 1,
0.9134716, -0.130331, 3.691873, 0.9372549, 0, 1, 1,
0.9154261, 0.4989057, 1.172837, 0.945098, 0, 1, 1,
0.9159951, -0.5749296, 2.765413, 0.9490196, 0, 1, 1,
0.9181227, -0.7408898, 2.444283, 0.9568627, 0, 1, 1,
0.9181293, -0.6252946, 1.809233, 0.9607843, 0, 1, 1,
0.9247568, 1.725789, 1.892889, 0.9686275, 0, 1, 1,
0.9300661, -0.1417854, 2.867902, 0.972549, 0, 1, 1,
0.9356521, -0.1123828, 2.172952, 0.9803922, 0, 1, 1,
0.9408054, -0.3326772, 0.6537901, 0.9843137, 0, 1, 1,
0.9449054, -0.6046085, 1.896975, 0.9921569, 0, 1, 1,
0.9552765, -0.8647751, 2.41596, 0.9960784, 0, 1, 1,
0.958572, -1.507455, 1.834365, 1, 0, 0.9960784, 1,
0.9600518, -2.0036, 1.538698, 1, 0, 0.9882353, 1,
0.9673645, -0.7498581, 0.8467521, 1, 0, 0.9843137, 1,
0.9677338, -1.533145, 3.374143, 1, 0, 0.9764706, 1,
0.9804216, -0.7125303, 2.437548, 1, 0, 0.972549, 1,
0.98379, -0.2872568, 2.452343, 1, 0, 0.9647059, 1,
0.9856315, 1.36388, 2.380075, 1, 0, 0.9607843, 1,
0.9860386, -0.3909887, 1.35841, 1, 0, 0.9529412, 1,
0.9868098, 0.04657212, 0.07648243, 1, 0, 0.9490196, 1,
0.9912112, 0.8299946, 1.043869, 1, 0, 0.9411765, 1,
0.991361, -0.4060177, 1.519969, 1, 0, 0.9372549, 1,
0.9964178, 0.9574717, 0.9636982, 1, 0, 0.9294118, 1,
1.005552, -0.2262984, 1.491204, 1, 0, 0.9254902, 1,
1.006932, 1.658199, -0.4293696, 1, 0, 0.9176471, 1,
1.013466, -0.7731958, 1.266709, 1, 0, 0.9137255, 1,
1.01771, 0.2375294, 0.4142388, 1, 0, 0.9058824, 1,
1.017975, -1.317298, 3.296819, 1, 0, 0.9019608, 1,
1.038734, 0.7751598, 1.507225, 1, 0, 0.8941177, 1,
1.039865, -0.2464121, 2.896056, 1, 0, 0.8862745, 1,
1.046661, -1.635428, 3.236989, 1, 0, 0.8823529, 1,
1.04948, 0.3473582, -0.2704495, 1, 0, 0.8745098, 1,
1.050349, -2.360913, 3.32648, 1, 0, 0.8705882, 1,
1.051847, -1.719579, 2.855588, 1, 0, 0.8627451, 1,
1.053585, -0.3364353, 2.437351, 1, 0, 0.8588235, 1,
1.05657, -0.5877149, 2.168526, 1, 0, 0.8509804, 1,
1.06008, -0.2671623, 1.43935, 1, 0, 0.8470588, 1,
1.067336, -1.984233, 5.435662, 1, 0, 0.8392157, 1,
1.07172, -0.6759235, 3.544862, 1, 0, 0.8352941, 1,
1.076136, -0.6436226, 4.090308, 1, 0, 0.827451, 1,
1.076372, -1.469, 3.104259, 1, 0, 0.8235294, 1,
1.090601, -0.3330709, 1.285228, 1, 0, 0.8156863, 1,
1.091805, 1.494231, 0.4550629, 1, 0, 0.8117647, 1,
1.093496, -0.7554243, 0.9781393, 1, 0, 0.8039216, 1,
1.097556, -0.1915961, 0.5152357, 1, 0, 0.7960784, 1,
1.104876, -0.2624476, 2.578369, 1, 0, 0.7921569, 1,
1.107725, 0.1824581, 1.284056, 1, 0, 0.7843137, 1,
1.111195, 0.7633116, 0.3940153, 1, 0, 0.7803922, 1,
1.11889, -0.2326526, 2.302439, 1, 0, 0.772549, 1,
1.124075, 0.3861573, 0.8151554, 1, 0, 0.7686275, 1,
1.128335, 0.9863773, 0.2826238, 1, 0, 0.7607843, 1,
1.131665, -0.656284, 0.5834197, 1, 0, 0.7568628, 1,
1.134854, 0.1224921, 0.09492663, 1, 0, 0.7490196, 1,
1.137626, -2.858273, 3.148831, 1, 0, 0.7450981, 1,
1.14386, 0.04365024, 1.662361, 1, 0, 0.7372549, 1,
1.15546, 0.9960221, 0.253581, 1, 0, 0.7333333, 1,
1.161893, 1.142443, 2.197506, 1, 0, 0.7254902, 1,
1.165863, -0.9078522, 4.877131, 1, 0, 0.7215686, 1,
1.16588, 1.679523, 1.989989, 1, 0, 0.7137255, 1,
1.166678, -0.1909385, 0.1106597, 1, 0, 0.7098039, 1,
1.167225, -1.19958, 2.969477, 1, 0, 0.7019608, 1,
1.167878, -0.3092582, 3.636529, 1, 0, 0.6941177, 1,
1.168389, 1.08691, 2.269115, 1, 0, 0.6901961, 1,
1.178715, 1.59304, 1.910188, 1, 0, 0.682353, 1,
1.179681, 1.723663, -0.1388546, 1, 0, 0.6784314, 1,
1.188268, -0.3818949, 0.8420045, 1, 0, 0.6705883, 1,
1.190234, 2.6424, 0.6661453, 1, 0, 0.6666667, 1,
1.204462, 1.466224, 0.07387669, 1, 0, 0.6588235, 1,
1.216674, -0.9140639, 2.657923, 1, 0, 0.654902, 1,
1.21689, -0.07218327, 2.829354, 1, 0, 0.6470588, 1,
1.217123, -0.5495646, 2.90311, 1, 0, 0.6431373, 1,
1.22902, -1.111024, 0.8325837, 1, 0, 0.6352941, 1,
1.230162, -2.666004, 0.8519254, 1, 0, 0.6313726, 1,
1.233365, -1.075783, 2.409741, 1, 0, 0.6235294, 1,
1.237379, -1.144591, 2.654134, 1, 0, 0.6196079, 1,
1.243045, 1.085103, -1.406781, 1, 0, 0.6117647, 1,
1.248945, 0.08099562, -0.1076296, 1, 0, 0.6078432, 1,
1.258236, -0.3959805, 3.39342, 1, 0, 0.6, 1,
1.259083, -1.115169, 2.919809, 1, 0, 0.5921569, 1,
1.261435, -0.5907085, 0.9901536, 1, 0, 0.5882353, 1,
1.276056, -0.9973403, 1.889535, 1, 0, 0.5803922, 1,
1.280837, 0.001876757, 0.1184872, 1, 0, 0.5764706, 1,
1.281245, 0.2251632, 1.012955, 1, 0, 0.5686275, 1,
1.294674, 1.295066, 2.297427, 1, 0, 0.5647059, 1,
1.299175, -0.324766, 2.257658, 1, 0, 0.5568628, 1,
1.307355, -0.8022135, 1.928949, 1, 0, 0.5529412, 1,
1.314675, 0.6590489, 0.507828, 1, 0, 0.5450981, 1,
1.317632, -0.08066734, 2.750644, 1, 0, 0.5411765, 1,
1.339821, -1.534344, 4.824967, 1, 0, 0.5333334, 1,
1.36664, -0.7842985, 4.701321, 1, 0, 0.5294118, 1,
1.381294, 1.949296, 2.12377, 1, 0, 0.5215687, 1,
1.383614, 0.6100657, 2.181783, 1, 0, 0.5176471, 1,
1.388055, -0.7117763, 1.018546, 1, 0, 0.509804, 1,
1.406588, 0.1122997, -0.779769, 1, 0, 0.5058824, 1,
1.408087, -1.661313, 1.697471, 1, 0, 0.4980392, 1,
1.409945, 0.3723755, 2.145619, 1, 0, 0.4901961, 1,
1.414813, 0.1069937, 0.6969363, 1, 0, 0.4862745, 1,
1.419259, -1.044246, 0.6062391, 1, 0, 0.4784314, 1,
1.439898, 1.253507, -1.752602, 1, 0, 0.4745098, 1,
1.444912, 0.5403969, -0.102399, 1, 0, 0.4666667, 1,
1.447146, -0.5577546, 1.65168, 1, 0, 0.4627451, 1,
1.448233, -0.7737504, 2.674769, 1, 0, 0.454902, 1,
1.451523, 1.408834, 0.7614269, 1, 0, 0.4509804, 1,
1.458433, 1.847749, -0.8963797, 1, 0, 0.4431373, 1,
1.467461, 1.273252, -1.250091, 1, 0, 0.4392157, 1,
1.470723, 1.595978, 0.4193107, 1, 0, 0.4313726, 1,
1.482323, 0.313436, 1.769766, 1, 0, 0.427451, 1,
1.494073, 0.5747663, 1.012058, 1, 0, 0.4196078, 1,
1.501388, 1.101732, 1.56417, 1, 0, 0.4156863, 1,
1.505496, 0.9440485, 1.385, 1, 0, 0.4078431, 1,
1.50774, 1.909278, 1.42929, 1, 0, 0.4039216, 1,
1.508374, 0.4354997, 1.112089, 1, 0, 0.3960784, 1,
1.515244, -1.327551, 3.454331, 1, 0, 0.3882353, 1,
1.520105, 1.122548, 0.8264837, 1, 0, 0.3843137, 1,
1.527033, -0.3643897, 3.159871, 1, 0, 0.3764706, 1,
1.53659, 1.163802, 0.2446404, 1, 0, 0.372549, 1,
1.537472, -1.166784, 3.555581, 1, 0, 0.3647059, 1,
1.552793, -0.2800193, 1.670633, 1, 0, 0.3607843, 1,
1.557203, -0.3493838, 2.438981, 1, 0, 0.3529412, 1,
1.565939, -1.943724, 2.049989, 1, 0, 0.3490196, 1,
1.587662, 1.273012, 1.422667, 1, 0, 0.3411765, 1,
1.597526, -0.9657242, -0.08844536, 1, 0, 0.3372549, 1,
1.599214, 0.1840033, 1.571487, 1, 0, 0.3294118, 1,
1.601162, -0.9890938, 2.622763, 1, 0, 0.3254902, 1,
1.604766, -0.3159942, 1.948875, 1, 0, 0.3176471, 1,
1.616402, 0.008783977, 2.345986, 1, 0, 0.3137255, 1,
1.618415, -1.221048, 2.484397, 1, 0, 0.3058824, 1,
1.623356, 0.2498402, -0.9509643, 1, 0, 0.2980392, 1,
1.62465, -0.6220163, 1.013408, 1, 0, 0.2941177, 1,
1.633516, 0.458458, 1.266688, 1, 0, 0.2862745, 1,
1.637312, -1.357852, 2.536217, 1, 0, 0.282353, 1,
1.641926, 1.451607, 1.207548, 1, 0, 0.2745098, 1,
1.646818, 0.1255412, 0.7865345, 1, 0, 0.2705882, 1,
1.651302, -1.482589, 1.490816, 1, 0, 0.2627451, 1,
1.654248, -0.654169, 1.496681, 1, 0, 0.2588235, 1,
1.690148, -1.390655, 1.58827, 1, 0, 0.2509804, 1,
1.69535, -0.8664845, 2.485284, 1, 0, 0.2470588, 1,
1.712043, -0.2968722, 1.726379, 1, 0, 0.2392157, 1,
1.732244, 1.832367, -0.6710031, 1, 0, 0.2352941, 1,
1.738139, 0.585981, 1.47104, 1, 0, 0.227451, 1,
1.73986, -0.9848835, 2.004593, 1, 0, 0.2235294, 1,
1.756738, -0.9696554, 2.113071, 1, 0, 0.2156863, 1,
1.760424, -0.1525335, 0.6429796, 1, 0, 0.2117647, 1,
1.763398, 1.446085, 0.4494353, 1, 0, 0.2039216, 1,
1.768782, -0.5337788, -0.621568, 1, 0, 0.1960784, 1,
1.796591, 0.4446773, 0.0976152, 1, 0, 0.1921569, 1,
1.802572, 0.2580423, 0.5071161, 1, 0, 0.1843137, 1,
1.80916, -0.3549944, 3.542068, 1, 0, 0.1803922, 1,
1.813741, 1.289473, 0.1952419, 1, 0, 0.172549, 1,
1.863255, 0.587295, 0.7292751, 1, 0, 0.1686275, 1,
1.866903, 0.2723235, 1.872705, 1, 0, 0.1607843, 1,
1.900795, -1.645272, 2.173051, 1, 0, 0.1568628, 1,
1.913496, 0.3757482, 2.195647, 1, 0, 0.1490196, 1,
1.920422, -0.4085723, 3.827803, 1, 0, 0.145098, 1,
1.927244, 0.7772089, 2.547635, 1, 0, 0.1372549, 1,
1.949398, -0.01685868, 2.961016, 1, 0, 0.1333333, 1,
1.969239, 0.3037249, 1.047199, 1, 0, 0.1254902, 1,
1.990912, 0.6120417, 1.733315, 1, 0, 0.1215686, 1,
1.998746, 1.469944, 1.410227, 1, 0, 0.1137255, 1,
2.007851, 0.1217661, 1.212363, 1, 0, 0.1098039, 1,
2.026751, 0.9100382, 0.2211173, 1, 0, 0.1019608, 1,
2.034543, 1.13202, 0.7006417, 1, 0, 0.09411765, 1,
2.046542, -1.127799, 2.303682, 1, 0, 0.09019608, 1,
2.05099, 2.497977, -0.2209019, 1, 0, 0.08235294, 1,
2.085445, -1.109822, 0.3737154, 1, 0, 0.07843138, 1,
2.119202, -0.4584742, 2.180681, 1, 0, 0.07058824, 1,
2.131194, -1.163186, 2.23647, 1, 0, 0.06666667, 1,
2.177274, 0.832377, 2.954192, 1, 0, 0.05882353, 1,
2.197676, -2.855227, 4.216901, 1, 0, 0.05490196, 1,
2.272182, 0.6754503, 2.133604, 1, 0, 0.04705882, 1,
2.302589, -0.1436285, 1.456094, 1, 0, 0.04313726, 1,
2.338695, 1.687984, 1.523662, 1, 0, 0.03529412, 1,
2.395859, 0.3907502, 0.4744879, 1, 0, 0.03137255, 1,
2.466183, 0.3302548, 3.389794, 1, 0, 0.02352941, 1,
2.664417, -0.3107882, 0.7672121, 1, 0, 0.01960784, 1,
2.990185, -0.1731102, 1.208827, 1, 0, 0.01176471, 1,
3.290746, 1.983559, 1.271577, 1, 0, 0.007843138, 1
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
0.02320266, -4.545048, -7.087432, 0, -0.5, 0.5, 0.5,
0.02320266, -4.545048, -7.087432, 1, -0.5, 0.5, 0.5,
0.02320266, -4.545048, -7.087432, 1, 1.5, 0.5, 0.5,
0.02320266, -4.545048, -7.087432, 0, 1.5, 0.5, 0.5
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
-4.352037, 0.04323506, -7.087432, 0, -0.5, 0.5, 0.5,
-4.352037, 0.04323506, -7.087432, 1, -0.5, 0.5, 0.5,
-4.352037, 0.04323506, -7.087432, 1, 1.5, 0.5, 0.5,
-4.352037, 0.04323506, -7.087432, 0, 1.5, 0.5, 0.5
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
-4.352037, -4.545048, 0.08162451, 0, -0.5, 0.5, 0.5,
-4.352037, -4.545048, 0.08162451, 1, -0.5, 0.5, 0.5,
-4.352037, -4.545048, 0.08162451, 1, 1.5, 0.5, 0.5,
-4.352037, -4.545048, 0.08162451, 0, 1.5, 0.5, 0.5
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
-3, -3.486213, -5.433034,
3, -3.486213, -5.433034,
-3, -3.486213, -5.433034,
-3, -3.662686, -5.708767,
-2, -3.486213, -5.433034,
-2, -3.662686, -5.708767,
-1, -3.486213, -5.433034,
-1, -3.662686, -5.708767,
0, -3.486213, -5.433034,
0, -3.662686, -5.708767,
1, -3.486213, -5.433034,
1, -3.662686, -5.708767,
2, -3.486213, -5.433034,
2, -3.662686, -5.708767,
3, -3.486213, -5.433034,
3, -3.662686, -5.708767
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
-3, -4.015631, -6.260233, 0, -0.5, 0.5, 0.5,
-3, -4.015631, -6.260233, 1, -0.5, 0.5, 0.5,
-3, -4.015631, -6.260233, 1, 1.5, 0.5, 0.5,
-3, -4.015631, -6.260233, 0, 1.5, 0.5, 0.5,
-2, -4.015631, -6.260233, 0, -0.5, 0.5, 0.5,
-2, -4.015631, -6.260233, 1, -0.5, 0.5, 0.5,
-2, -4.015631, -6.260233, 1, 1.5, 0.5, 0.5,
-2, -4.015631, -6.260233, 0, 1.5, 0.5, 0.5,
-1, -4.015631, -6.260233, 0, -0.5, 0.5, 0.5,
-1, -4.015631, -6.260233, 1, -0.5, 0.5, 0.5,
-1, -4.015631, -6.260233, 1, 1.5, 0.5, 0.5,
-1, -4.015631, -6.260233, 0, 1.5, 0.5, 0.5,
0, -4.015631, -6.260233, 0, -0.5, 0.5, 0.5,
0, -4.015631, -6.260233, 1, -0.5, 0.5, 0.5,
0, -4.015631, -6.260233, 1, 1.5, 0.5, 0.5,
0, -4.015631, -6.260233, 0, 1.5, 0.5, 0.5,
1, -4.015631, -6.260233, 0, -0.5, 0.5, 0.5,
1, -4.015631, -6.260233, 1, -0.5, 0.5, 0.5,
1, -4.015631, -6.260233, 1, 1.5, 0.5, 0.5,
1, -4.015631, -6.260233, 0, 1.5, 0.5, 0.5,
2, -4.015631, -6.260233, 0, -0.5, 0.5, 0.5,
2, -4.015631, -6.260233, 1, -0.5, 0.5, 0.5,
2, -4.015631, -6.260233, 1, 1.5, 0.5, 0.5,
2, -4.015631, -6.260233, 0, 1.5, 0.5, 0.5,
3, -4.015631, -6.260233, 0, -0.5, 0.5, 0.5,
3, -4.015631, -6.260233, 1, -0.5, 0.5, 0.5,
3, -4.015631, -6.260233, 1, 1.5, 0.5, 0.5,
3, -4.015631, -6.260233, 0, 1.5, 0.5, 0.5
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
-3.342367, -3, -5.433034,
-3.342367, 3, -5.433034,
-3.342367, -3, -5.433034,
-3.510645, -3, -5.708767,
-3.342367, -2, -5.433034,
-3.510645, -2, -5.708767,
-3.342367, -1, -5.433034,
-3.510645, -1, -5.708767,
-3.342367, 0, -5.433034,
-3.510645, 0, -5.708767,
-3.342367, 1, -5.433034,
-3.510645, 1, -5.708767,
-3.342367, 2, -5.433034,
-3.510645, 2, -5.708767,
-3.342367, 3, -5.433034,
-3.510645, 3, -5.708767
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
-3.847202, -3, -6.260233, 0, -0.5, 0.5, 0.5,
-3.847202, -3, -6.260233, 1, -0.5, 0.5, 0.5,
-3.847202, -3, -6.260233, 1, 1.5, 0.5, 0.5,
-3.847202, -3, -6.260233, 0, 1.5, 0.5, 0.5,
-3.847202, -2, -6.260233, 0, -0.5, 0.5, 0.5,
-3.847202, -2, -6.260233, 1, -0.5, 0.5, 0.5,
-3.847202, -2, -6.260233, 1, 1.5, 0.5, 0.5,
-3.847202, -2, -6.260233, 0, 1.5, 0.5, 0.5,
-3.847202, -1, -6.260233, 0, -0.5, 0.5, 0.5,
-3.847202, -1, -6.260233, 1, -0.5, 0.5, 0.5,
-3.847202, -1, -6.260233, 1, 1.5, 0.5, 0.5,
-3.847202, -1, -6.260233, 0, 1.5, 0.5, 0.5,
-3.847202, 0, -6.260233, 0, -0.5, 0.5, 0.5,
-3.847202, 0, -6.260233, 1, -0.5, 0.5, 0.5,
-3.847202, 0, -6.260233, 1, 1.5, 0.5, 0.5,
-3.847202, 0, -6.260233, 0, 1.5, 0.5, 0.5,
-3.847202, 1, -6.260233, 0, -0.5, 0.5, 0.5,
-3.847202, 1, -6.260233, 1, -0.5, 0.5, 0.5,
-3.847202, 1, -6.260233, 1, 1.5, 0.5, 0.5,
-3.847202, 1, -6.260233, 0, 1.5, 0.5, 0.5,
-3.847202, 2, -6.260233, 0, -0.5, 0.5, 0.5,
-3.847202, 2, -6.260233, 1, -0.5, 0.5, 0.5,
-3.847202, 2, -6.260233, 1, 1.5, 0.5, 0.5,
-3.847202, 2, -6.260233, 0, 1.5, 0.5, 0.5,
-3.847202, 3, -6.260233, 0, -0.5, 0.5, 0.5,
-3.847202, 3, -6.260233, 1, -0.5, 0.5, 0.5,
-3.847202, 3, -6.260233, 1, 1.5, 0.5, 0.5,
-3.847202, 3, -6.260233, 0, 1.5, 0.5, 0.5
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
-3.342367, -3.486213, -4,
-3.342367, -3.486213, 4,
-3.342367, -3.486213, -4,
-3.510645, -3.662686, -4,
-3.342367, -3.486213, -2,
-3.510645, -3.662686, -2,
-3.342367, -3.486213, 0,
-3.510645, -3.662686, 0,
-3.342367, -3.486213, 2,
-3.510645, -3.662686, 2,
-3.342367, -3.486213, 4,
-3.510645, -3.662686, 4
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
-3.847202, -4.015631, -4, 0, -0.5, 0.5, 0.5,
-3.847202, -4.015631, -4, 1, -0.5, 0.5, 0.5,
-3.847202, -4.015631, -4, 1, 1.5, 0.5, 0.5,
-3.847202, -4.015631, -4, 0, 1.5, 0.5, 0.5,
-3.847202, -4.015631, -2, 0, -0.5, 0.5, 0.5,
-3.847202, -4.015631, -2, 1, -0.5, 0.5, 0.5,
-3.847202, -4.015631, -2, 1, 1.5, 0.5, 0.5,
-3.847202, -4.015631, -2, 0, 1.5, 0.5, 0.5,
-3.847202, -4.015631, 0, 0, -0.5, 0.5, 0.5,
-3.847202, -4.015631, 0, 1, -0.5, 0.5, 0.5,
-3.847202, -4.015631, 0, 1, 1.5, 0.5, 0.5,
-3.847202, -4.015631, 0, 0, 1.5, 0.5, 0.5,
-3.847202, -4.015631, 2, 0, -0.5, 0.5, 0.5,
-3.847202, -4.015631, 2, 1, -0.5, 0.5, 0.5,
-3.847202, -4.015631, 2, 1, 1.5, 0.5, 0.5,
-3.847202, -4.015631, 2, 0, 1.5, 0.5, 0.5,
-3.847202, -4.015631, 4, 0, -0.5, 0.5, 0.5,
-3.847202, -4.015631, 4, 1, -0.5, 0.5, 0.5,
-3.847202, -4.015631, 4, 1, 1.5, 0.5, 0.5,
-3.847202, -4.015631, 4, 0, 1.5, 0.5, 0.5
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
-3.342367, -3.486213, -5.433034,
-3.342367, 3.572684, -5.433034,
-3.342367, -3.486213, 5.596283,
-3.342367, 3.572684, 5.596283,
-3.342367, -3.486213, -5.433034,
-3.342367, -3.486213, 5.596283,
-3.342367, 3.572684, -5.433034,
-3.342367, 3.572684, 5.596283,
-3.342367, -3.486213, -5.433034,
3.388772, -3.486213, -5.433034,
-3.342367, -3.486213, 5.596283,
3.388772, -3.486213, 5.596283,
-3.342367, 3.572684, -5.433034,
3.388772, 3.572684, -5.433034,
-3.342367, 3.572684, 5.596283,
3.388772, 3.572684, 5.596283,
3.388772, -3.486213, -5.433034,
3.388772, 3.572684, -5.433034,
3.388772, -3.486213, 5.596283,
3.388772, 3.572684, 5.596283,
3.388772, -3.486213, -5.433034,
3.388772, -3.486213, 5.596283,
3.388772, 3.572684, -5.433034,
3.388772, 3.572684, 5.596283
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
var radius = 7.862075;
var distance = 34.97926;
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
mvMatrix.translate( -0.02320266, -0.04323506, -0.08162451 );
mvMatrix.scale( 1.262881, 1.204243, 0.7707303 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.97926);
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
manganese_ethylenebi<-read.table("manganese_ethylenebi.xyz")
```

```
## Error in read.table("manganese_ethylenebi.xyz"): no lines available in input
```

```r
x<-manganese_ethylenebi$V2
```

```
## Error in eval(expr, envir, enclos): object 'manganese_ethylenebi' not found
```

```r
y<-manganese_ethylenebi$V3
```

```
## Error in eval(expr, envir, enclos): object 'manganese_ethylenebi' not found
```

```r
z<-manganese_ethylenebi$V4
```

```
## Error in eval(expr, envir, enclos): object 'manganese_ethylenebi' not found
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
-3.24434, 0.3509759, -1.529669, 0, 0, 1, 1, 1,
-2.838531, 1.892973, -0.4926738, 1, 0, 0, 1, 1,
-2.794142, -0.3776617, -0.8190323, 1, 0, 0, 1, 1,
-2.6843, 0.2851457, -1.810205, 1, 0, 0, 1, 1,
-2.403249, -2.52254, -3.037071, 1, 0, 0, 1, 1,
-2.313981, 0.2892533, -2.380002, 1, 0, 0, 1, 1,
-2.311507, -1.409954, -1.731057, 0, 0, 0, 1, 1,
-2.282966, 0.8720589, -0.2400091, 0, 0, 0, 1, 1,
-2.229509, -2.065225, 0.3492229, 0, 0, 0, 1, 1,
-2.212966, 2.60019, -1.579375, 0, 0, 0, 1, 1,
-2.197976, -0.2042401, -1.234245, 0, 0, 0, 1, 1,
-2.191227, 1.540873, -1.402462, 0, 0, 0, 1, 1,
-2.159548, -0.6010033, -3.196237, 0, 0, 0, 1, 1,
-2.09983, 0.09657963, -0.3472919, 1, 1, 1, 1, 1,
-2.069481, 0.6816633, -0.5985576, 1, 1, 1, 1, 1,
-2.018795, -2.067381, -1.505577, 1, 1, 1, 1, 1,
-2.017437, 0.9132836, -1.004822, 1, 1, 1, 1, 1,
-2.006384, 0.2371505, -1.018449, 1, 1, 1, 1, 1,
-2.002032, -0.6309135, -0.725029, 1, 1, 1, 1, 1,
-1.997536, 0.1108851, -2.487746, 1, 1, 1, 1, 1,
-1.985332, 1.822384, -1.056276, 1, 1, 1, 1, 1,
-1.957886, -0.8326182, -3.89776, 1, 1, 1, 1, 1,
-1.954672, 0.6534895, -1.077611, 1, 1, 1, 1, 1,
-1.927325, 0.1538922, -1.082165, 1, 1, 1, 1, 1,
-1.910783, -0.9362046, -0.5466939, 1, 1, 1, 1, 1,
-1.898776, 0.1813444, -3.020076, 1, 1, 1, 1, 1,
-1.895726, -0.355436, -0.8974425, 1, 1, 1, 1, 1,
-1.880117, -0.2050281, -2.183451, 1, 1, 1, 1, 1,
-1.872706, 0.09126753, -3.384581, 0, 0, 1, 1, 1,
-1.869747, 0.02926124, 0.01113256, 1, 0, 0, 1, 1,
-1.866387, -1.653319, -3.482056, 1, 0, 0, 1, 1,
-1.824128, 0.641052, -1.359465, 1, 0, 0, 1, 1,
-1.821184, 1.041862, -2.615258, 1, 0, 0, 1, 1,
-1.807416, -0.2903499, -2.31147, 1, 0, 0, 1, 1,
-1.782752, -1.02694, -1.557055, 0, 0, 0, 1, 1,
-1.770797, 1.11915, -2.57941, 0, 0, 0, 1, 1,
-1.761937, 1.605703, -0.7285781, 0, 0, 0, 1, 1,
-1.754217, 0.804709, -1.383294, 0, 0, 0, 1, 1,
-1.752596, -0.4145047, -1.936829, 0, 0, 0, 1, 1,
-1.738132, 0.6391098, -0.8183769, 0, 0, 0, 1, 1,
-1.727132, -1.56348, -1.135512, 0, 0, 0, 1, 1,
-1.727076, -0.6998366, -1.367522, 1, 1, 1, 1, 1,
-1.726355, -0.6344876, -2.084691, 1, 1, 1, 1, 1,
-1.725971, -1.500623, -2.81196, 1, 1, 1, 1, 1,
-1.708873, 2.308522, -2.536934, 1, 1, 1, 1, 1,
-1.675517, 0.8539667, -0.813329, 1, 1, 1, 1, 1,
-1.648294, 1.480572, -2.090846, 1, 1, 1, 1, 1,
-1.629997, -0.2170457, -1.061629, 1, 1, 1, 1, 1,
-1.611299, -0.6503103, -2.486025, 1, 1, 1, 1, 1,
-1.595178, 1.433285, -1.12539, 1, 1, 1, 1, 1,
-1.587035, -0.8745404, -1.399394, 1, 1, 1, 1, 1,
-1.586979, -1.063178, -1.304556, 1, 1, 1, 1, 1,
-1.579667, 0.3280639, -0.09677213, 1, 1, 1, 1, 1,
-1.579316, 1.263766, -2.66984, 1, 1, 1, 1, 1,
-1.56077, 0.04890573, -2.016224, 1, 1, 1, 1, 1,
-1.558273, 0.5935153, -1.522182, 1, 1, 1, 1, 1,
-1.556857, 0.9555902, -1.651094, 0, 0, 1, 1, 1,
-1.54804, -0.8541972, -1.432207, 1, 0, 0, 1, 1,
-1.540649, -0.4782276, -1.690429, 1, 0, 0, 1, 1,
-1.538047, -1.286074, -2.540695, 1, 0, 0, 1, 1,
-1.537115, 0.9770168, -1.236366, 1, 0, 0, 1, 1,
-1.525132, -1.510917, -2.752254, 1, 0, 0, 1, 1,
-1.513692, 0.5127358, -2.573924, 0, 0, 0, 1, 1,
-1.490857, -0.5250937, -0.4540347, 0, 0, 0, 1, 1,
-1.486355, -0.5286578, -1.199166, 0, 0, 0, 1, 1,
-1.483144, -1.529351, -1.986731, 0, 0, 0, 1, 1,
-1.470011, -0.1670546, -0.6786149, 0, 0, 0, 1, 1,
-1.463581, 0.3798257, 0.872501, 0, 0, 0, 1, 1,
-1.449967, -0.2368829, -3.297089, 0, 0, 0, 1, 1,
-1.447746, 0.1585992, -0.9744899, 1, 1, 1, 1, 1,
-1.445166, 0.5994003, -0.9817129, 1, 1, 1, 1, 1,
-1.442521, 0.9492229, -3.307186, 1, 1, 1, 1, 1,
-1.441231, 0.6251574, 0.2553394, 1, 1, 1, 1, 1,
-1.434722, 1.253388, 0.8119672, 1, 1, 1, 1, 1,
-1.426346, -0.7330425, -3.484434, 1, 1, 1, 1, 1,
-1.414596, -0.658918, -3.18277, 1, 1, 1, 1, 1,
-1.408769, 0.07962395, -1.158853, 1, 1, 1, 1, 1,
-1.400823, -0.5539463, -1.314953, 1, 1, 1, 1, 1,
-1.399192, -0.07386342, -1.534995, 1, 1, 1, 1, 1,
-1.396032, 0.002633395, -0.6737083, 1, 1, 1, 1, 1,
-1.384596, -0.81262, -2.111559, 1, 1, 1, 1, 1,
-1.382331, -0.9048232, -3.141205, 1, 1, 1, 1, 1,
-1.36647, -0.5759206, -1.737893, 1, 1, 1, 1, 1,
-1.350937, 0.1528164, -2.268288, 1, 1, 1, 1, 1,
-1.347863, -0.3952186, -1.411141, 0, 0, 1, 1, 1,
-1.344789, -0.2002634, -1.600918, 1, 0, 0, 1, 1,
-1.341088, -2.145325, -0.1888656, 1, 0, 0, 1, 1,
-1.338296, -0.3999787, -1.762678, 1, 0, 0, 1, 1,
-1.330691, 0.3941381, -1.857229, 1, 0, 0, 1, 1,
-1.326963, -1.447841, -2.245746, 1, 0, 0, 1, 1,
-1.315568, -0.1480258, -5.272413, 0, 0, 0, 1, 1,
-1.311779, 0.2901945, -1.403296, 0, 0, 0, 1, 1,
-1.305174, -0.2577857, -2.915406, 0, 0, 0, 1, 1,
-1.303335, 1.625963, -1.863382, 0, 0, 0, 1, 1,
-1.301109, -0.623616, -0.86777, 0, 0, 0, 1, 1,
-1.296135, 0.8497276, -3.117024, 0, 0, 0, 1, 1,
-1.281645, 0.6879008, -0.3316041, 0, 0, 0, 1, 1,
-1.277737, 2.595713, -1.99528, 1, 1, 1, 1, 1,
-1.273161, 0.3703846, -0.7739928, 1, 1, 1, 1, 1,
-1.251119, -0.1768398, -2.599525, 1, 1, 1, 1, 1,
-1.232517, 0.2371411, -2.094355, 1, 1, 1, 1, 1,
-1.230586, 0.3207777, -0.6993098, 1, 1, 1, 1, 1,
-1.229316, 0.04807052, -2.65946, 1, 1, 1, 1, 1,
-1.228332, 0.7494099, -0.02309461, 1, 1, 1, 1, 1,
-1.222961, 0.6041171, -2.269223, 1, 1, 1, 1, 1,
-1.20632, -0.2863817, -1.910817, 1, 1, 1, 1, 1,
-1.197433, 0.1670574, -0.6921481, 1, 1, 1, 1, 1,
-1.181666, -0.5655028, -2.649453, 1, 1, 1, 1, 1,
-1.180919, -0.3794596, -1.560616, 1, 1, 1, 1, 1,
-1.170792, 0.7236577, -1.068599, 1, 1, 1, 1, 1,
-1.162503, 0.4846409, -0.8279217, 1, 1, 1, 1, 1,
-1.159719, -0.4214611, -2.041674, 1, 1, 1, 1, 1,
-1.158438, 0.4676337, -1.274769, 0, 0, 1, 1, 1,
-1.145579, -0.1125715, -2.628294, 1, 0, 0, 1, 1,
-1.133289, -0.4240014, -4.264713, 1, 0, 0, 1, 1,
-1.129462, 2.014162, -0.7723878, 1, 0, 0, 1, 1,
-1.126725, 0.6483061, 0.6282994, 1, 0, 0, 1, 1,
-1.121183, 1.746725, -1.178061, 1, 0, 0, 1, 1,
-1.121016, -0.8918534, -1.686848, 0, 0, 0, 1, 1,
-1.118335, -0.2647505, -2.440139, 0, 0, 0, 1, 1,
-1.108169, -0.3303709, -3.368378, 0, 0, 0, 1, 1,
-1.091912, 0.350142, -3.10099, 0, 0, 0, 1, 1,
-1.088271, -0.424769, -0.7216427, 0, 0, 0, 1, 1,
-1.079984, 0.05227799, -1.845458, 0, 0, 0, 1, 1,
-1.078842, 0.249173, -1.477562, 0, 0, 0, 1, 1,
-1.076843, -0.4786174, -1.186623, 1, 1, 1, 1, 1,
-1.07599, -0.4306227, -1.023454, 1, 1, 1, 1, 1,
-1.072556, -0.2276884, -3.454295, 1, 1, 1, 1, 1,
-1.070427, -0.02125186, -1.291417, 1, 1, 1, 1, 1,
-1.060864, 0.4229613, -0.3917268, 1, 1, 1, 1, 1,
-1.057254, -0.9761449, -3.680558, 1, 1, 1, 1, 1,
-1.056177, 1.076095, -1.409647, 1, 1, 1, 1, 1,
-1.051973, -2.053244, -1.855458, 1, 1, 1, 1, 1,
-1.050744, 1.643438, 0.330311, 1, 1, 1, 1, 1,
-1.050342, -0.4103587, -2.761505, 1, 1, 1, 1, 1,
-1.0473, -3.383414, -4.449309, 1, 1, 1, 1, 1,
-1.046499, 0.706524, -2.236446, 1, 1, 1, 1, 1,
-1.044136, 1.091662, -2.466358, 1, 1, 1, 1, 1,
-1.043994, 0.3826325, -0.3249168, 1, 1, 1, 1, 1,
-1.043876, -1.251704, -1.277049, 1, 1, 1, 1, 1,
-1.043039, -0.6765963, -0.92622, 0, 0, 1, 1, 1,
-1.03957, -1.140717, -2.520934, 1, 0, 0, 1, 1,
-1.032385, 0.9004629, -0.5674995, 1, 0, 0, 1, 1,
-1.028621, 0.3713173, 0.1426008, 1, 0, 0, 1, 1,
-1.025833, -0.4341289, -2.463914, 1, 0, 0, 1, 1,
-1.02274, -0.2106158, -2.318774, 1, 0, 0, 1, 1,
-1.022028, -0.1510358, -0.9382103, 0, 0, 0, 1, 1,
-1.020048, 0.5911087, -1.147933, 0, 0, 0, 1, 1,
-1.017618, -1.564095, -3.960148, 0, 0, 0, 1, 1,
-1.004035, 0.2800083, -2.18511, 0, 0, 0, 1, 1,
-1.003118, -0.6481586, -0.4728585, 0, 0, 0, 1, 1,
-0.9984982, 1.339435, 0.02833083, 0, 0, 0, 1, 1,
-0.9954761, 0.3303247, -0.02281027, 0, 0, 0, 1, 1,
-0.9922393, 0.368632, -1.212975, 1, 1, 1, 1, 1,
-0.9857101, 1.976758, -0.5245306, 1, 1, 1, 1, 1,
-0.9845637, 0.7924007, 0.3722773, 1, 1, 1, 1, 1,
-0.9831143, 1.491553, 0.6214155, 1, 1, 1, 1, 1,
-0.98129, 0.5470313, 0.3728608, 1, 1, 1, 1, 1,
-0.9810604, -0.4808182, -2.842349, 1, 1, 1, 1, 1,
-0.9809847, 0.1287038, -1.536796, 1, 1, 1, 1, 1,
-0.9749579, 0.16824, -1.254364, 1, 1, 1, 1, 1,
-0.9682944, -0.126418, -0.4264847, 1, 1, 1, 1, 1,
-0.9674231, 0.5977904, -1.776007, 1, 1, 1, 1, 1,
-0.9527586, -0.4909196, -2.070294, 1, 1, 1, 1, 1,
-0.9527355, 0.2082369, -1.610295, 1, 1, 1, 1, 1,
-0.9526944, -0.2589718, -0.4162851, 1, 1, 1, 1, 1,
-0.9518338, 0.9051803, 0.3187267, 1, 1, 1, 1, 1,
-0.9431069, 1.228905, -1.544317, 1, 1, 1, 1, 1,
-0.9412457, 0.5750121, -1.981181, 0, 0, 1, 1, 1,
-0.9279683, 0.9106708, -0.6276147, 1, 0, 0, 1, 1,
-0.9242843, 0.7858664, -1.646521, 1, 0, 0, 1, 1,
-0.9235748, -2.129456, -2.8439, 1, 0, 0, 1, 1,
-0.9154915, -0.7692108, -1.929373, 1, 0, 0, 1, 1,
-0.9127609, 0.3002131, -1.71084, 1, 0, 0, 1, 1,
-0.9104989, 0.2964913, -1.861333, 0, 0, 0, 1, 1,
-0.9101122, 0.8173844, -1.833127, 0, 0, 0, 1, 1,
-0.9083515, 0.02787433, -1.572717, 0, 0, 0, 1, 1,
-0.9078193, 1.388638, -1.012119, 0, 0, 0, 1, 1,
-0.9049097, 0.4631629, -1.408771, 0, 0, 0, 1, 1,
-0.9037639, 1.040769, -0.3314197, 0, 0, 0, 1, 1,
-0.898195, 1.210139, -0.8769292, 0, 0, 0, 1, 1,
-0.8976042, -0.28644, -3.10412, 1, 1, 1, 1, 1,
-0.8957657, 0.9507051, -0.262503, 1, 1, 1, 1, 1,
-0.8763726, -0.3517877, -0.8322864, 1, 1, 1, 1, 1,
-0.8722873, -1.56714, -3.828516, 1, 1, 1, 1, 1,
-0.8705053, 1.2285, 0.01514092, 1, 1, 1, 1, 1,
-0.8684468, 0.97283, -0.1712349, 1, 1, 1, 1, 1,
-0.8669, -0.4990533, -2.267133, 1, 1, 1, 1, 1,
-0.8625773, 0.6874501, -0.2177572, 1, 1, 1, 1, 1,
-0.8608834, -0.6781173, -3.307048, 1, 1, 1, 1, 1,
-0.8600404, 0.02548185, -2.878637, 1, 1, 1, 1, 1,
-0.8547294, -0.2923188, -3.052107, 1, 1, 1, 1, 1,
-0.853191, -1.448838, -1.34002, 1, 1, 1, 1, 1,
-0.8527076, -0.9314873, -2.418783, 1, 1, 1, 1, 1,
-0.8462155, 0.461941, -0.8472065, 1, 1, 1, 1, 1,
-0.845766, -1.30253, -4.297695, 1, 1, 1, 1, 1,
-0.8448424, 1.224867, 0.8388163, 0, 0, 1, 1, 1,
-0.8432088, -1.993316, -1.158891, 1, 0, 0, 1, 1,
-0.8388147, -0.4242027, -3.152317, 1, 0, 0, 1, 1,
-0.8337994, -0.7730176, -1.892872, 1, 0, 0, 1, 1,
-0.8256677, 1.811569, -0.4192921, 1, 0, 0, 1, 1,
-0.8238854, -0.6279787, -2.396096, 1, 0, 0, 1, 1,
-0.8231484, 1.00605, -1.327075, 0, 0, 0, 1, 1,
-0.817861, -1.253648, -0.8860862, 0, 0, 0, 1, 1,
-0.8150439, 1.325058, 1.023837, 0, 0, 0, 1, 1,
-0.8054993, -0.8112431, -3.157178, 0, 0, 0, 1, 1,
-0.804112, -0.19018, -1.388149, 0, 0, 0, 1, 1,
-0.8035812, -1.236292, -1.223292, 0, 0, 0, 1, 1,
-0.8029558, 0.1272142, -0.4942146, 0, 0, 0, 1, 1,
-0.7895932, 1.326648, 0.2538899, 1, 1, 1, 1, 1,
-0.7844195, 1.058688, -0.8428178, 1, 1, 1, 1, 1,
-0.7834325, -0.8196215, -2.592222, 1, 1, 1, 1, 1,
-0.7820936, -0.2002117, -0.03046015, 1, 1, 1, 1, 1,
-0.7773653, -1.378755, -0.9175337, 1, 1, 1, 1, 1,
-0.7771304, 1.056733, -1.360998, 1, 1, 1, 1, 1,
-0.7583771, 0.4315663, -1.657133, 1, 1, 1, 1, 1,
-0.7571129, -0.4420432, -1.25636, 1, 1, 1, 1, 1,
-0.7562355, -0.5837001, -2.070065, 1, 1, 1, 1, 1,
-0.7422737, 0.8988127, 0.2959659, 1, 1, 1, 1, 1,
-0.7418615, -0.1295535, -1.967199, 1, 1, 1, 1, 1,
-0.738117, 1.26962, -0.3648112, 1, 1, 1, 1, 1,
-0.7293027, 0.339146, -1.835295, 1, 1, 1, 1, 1,
-0.7283587, 0.7780988, -2.740162, 1, 1, 1, 1, 1,
-0.722631, -0.2543761, -2.622588, 1, 1, 1, 1, 1,
-0.718311, 1.311985, -0.7046063, 0, 0, 1, 1, 1,
-0.7175848, 0.9611374, -0.9113393, 1, 0, 0, 1, 1,
-0.6998247, -1.539838, -3.162843, 1, 0, 0, 1, 1,
-0.6968552, -0.6342678, -3.838871, 1, 0, 0, 1, 1,
-0.6964124, 0.1163464, -1.366634, 1, 0, 0, 1, 1,
-0.6891636, 0.1219003, -1.103008, 1, 0, 0, 1, 1,
-0.687858, -0.9186455, -0.5664054, 0, 0, 0, 1, 1,
-0.6865923, -0.08237744, -2.89661, 0, 0, 0, 1, 1,
-0.6862132, 0.3745232, -0.5964952, 0, 0, 0, 1, 1,
-0.6849676, -0.1628525, -1.338017, 0, 0, 0, 1, 1,
-0.6842878, 1.665129, -0.4831714, 0, 0, 0, 1, 1,
-0.6831688, 1.874674, 0.1811229, 0, 0, 0, 1, 1,
-0.6815665, 0.9897686, 0.2314955, 0, 0, 0, 1, 1,
-0.6707447, 0.9058297, -1.493611, 1, 1, 1, 1, 1,
-0.6698111, -1.076146, -3.618519, 1, 1, 1, 1, 1,
-0.65332, 0.9239462, -1.040365, 1, 1, 1, 1, 1,
-0.6526561, 0.7587753, -0.6614445, 1, 1, 1, 1, 1,
-0.6503755, -0.5392064, -2.428476, 1, 1, 1, 1, 1,
-0.6465032, -0.2106125, -1.714684, 1, 1, 1, 1, 1,
-0.6413847, -0.9022434, -2.198965, 1, 1, 1, 1, 1,
-0.6390315, -1.100541, -2.32225, 1, 1, 1, 1, 1,
-0.636744, 1.787498, -0.6834671, 1, 1, 1, 1, 1,
-0.6359824, -0.08633839, -1.713502, 1, 1, 1, 1, 1,
-0.6358859, 0.2552274, -1.149734, 1, 1, 1, 1, 1,
-0.6345565, -1.391854, -1.915085, 1, 1, 1, 1, 1,
-0.6294721, 0.2904657, -1.503471, 1, 1, 1, 1, 1,
-0.6273068, 0.3465322, 0.4640103, 1, 1, 1, 1, 1,
-0.6256489, 1.188617, 0.1437609, 1, 1, 1, 1, 1,
-0.6245172, -2.223717, -3.639013, 0, 0, 1, 1, 1,
-0.6229574, -0.6715016, -2.220896, 1, 0, 0, 1, 1,
-0.622243, -0.3561632, -2.560986, 1, 0, 0, 1, 1,
-0.6198373, 0.1767382, -0.6755105, 1, 0, 0, 1, 1,
-0.6156153, -0.2990728, -1.399856, 1, 0, 0, 1, 1,
-0.6133921, -0.05935869, -1.207666, 1, 0, 0, 1, 1,
-0.6048812, 1.462161, -0.9710578, 0, 0, 0, 1, 1,
-0.5991278, 1.907938, 0.8976505, 0, 0, 0, 1, 1,
-0.5942258, 1.132599, -0.288334, 0, 0, 0, 1, 1,
-0.5772367, -0.580505, -3.317854, 0, 0, 0, 1, 1,
-0.5740502, -0.8874665, -3.853497, 0, 0, 0, 1, 1,
-0.5689105, -0.2087865, -1.889941, 0, 0, 0, 1, 1,
-0.5675992, -0.2234725, -2.411945, 0, 0, 0, 1, 1,
-0.5659062, 1.565527, -1.739494, 1, 1, 1, 1, 1,
-0.5648777, 0.3298272, -1.941622, 1, 1, 1, 1, 1,
-0.5615572, 0.3532376, -1.284588, 1, 1, 1, 1, 1,
-0.5591978, 0.487354, 0.370166, 1, 1, 1, 1, 1,
-0.5582657, 0.4323564, -1.565805, 1, 1, 1, 1, 1,
-0.5578697, -1.421044, -3.052039, 1, 1, 1, 1, 1,
-0.5571685, 0.683629, -1.205136, 1, 1, 1, 1, 1,
-0.5560108, 0.7399872, -1.5854, 1, 1, 1, 1, 1,
-0.5539167, 1.720182, 0.01405385, 1, 1, 1, 1, 1,
-0.5519444, 0.6091713, -1.369772, 1, 1, 1, 1, 1,
-0.5505792, -0.943422, -3.304053, 1, 1, 1, 1, 1,
-0.5479094, -0.5095204, -2.750727, 1, 1, 1, 1, 1,
-0.5428257, 0.2249958, -2.139009, 1, 1, 1, 1, 1,
-0.5420739, -0.6958542, -3.141904, 1, 1, 1, 1, 1,
-0.5395288, 1.482808, -0.6957366, 1, 1, 1, 1, 1,
-0.5388907, 0.4855094, -0.5297715, 0, 0, 1, 1, 1,
-0.5354871, -0.3677475, -0.6901791, 1, 0, 0, 1, 1,
-0.53375, 0.7375979, -1.292604, 1, 0, 0, 1, 1,
-0.5324466, -2.544901, -2.198419, 1, 0, 0, 1, 1,
-0.5321846, 0.6048147, -0.3544547, 1, 0, 0, 1, 1,
-0.5294746, 0.8727353, -1.092134, 1, 0, 0, 1, 1,
-0.5251149, 0.1239039, 0.004698572, 0, 0, 0, 1, 1,
-0.524509, -0.3400471, -3.21067, 0, 0, 0, 1, 1,
-0.5220882, 1.002942, 0.1950967, 0, 0, 0, 1, 1,
-0.5217585, -1.107803, -1.351538, 0, 0, 0, 1, 1,
-0.5205553, 0.2872015, -1.100042, 0, 0, 0, 1, 1,
-0.5175511, -1.036477, -5.052407, 0, 0, 0, 1, 1,
-0.5160078, -0.485616, -1.174276, 0, 0, 0, 1, 1,
-0.5147641, 1.332649, 1.571416, 1, 1, 1, 1, 1,
-0.5146675, 0.0298034, 0.05508106, 1, 1, 1, 1, 1,
-0.5143676, 0.453431, -1.665175, 1, 1, 1, 1, 1,
-0.5116813, -1.252637, -0.5188391, 1, 1, 1, 1, 1,
-0.5110646, -0.2305771, -2.748582, 1, 1, 1, 1, 1,
-0.5070509, -1.609037, -2.861314, 1, 1, 1, 1, 1,
-0.5041419, 0.4424754, -1.290418, 1, 1, 1, 1, 1,
-0.5014526, -0.2044544, -2.146976, 1, 1, 1, 1, 1,
-0.5009391, 0.4969921, -0.9209554, 1, 1, 1, 1, 1,
-0.4952603, -0.1771828, -1.291768, 1, 1, 1, 1, 1,
-0.4929255, -0.02159268, -2.911014, 1, 1, 1, 1, 1,
-0.4894367, 1.364429, -1.057254, 1, 1, 1, 1, 1,
-0.4863809, -1.914259, -4.213094, 1, 1, 1, 1, 1,
-0.4781235, 1.334643, -0.05310771, 1, 1, 1, 1, 1,
-0.4743988, 0.2682607, -1.061081, 1, 1, 1, 1, 1,
-0.4695359, -0.7513591, -2.694933, 0, 0, 1, 1, 1,
-0.468145, 0.8002567, -0.9679917, 1, 0, 0, 1, 1,
-0.4598321, 1.533039, -0.4705202, 1, 0, 0, 1, 1,
-0.4586731, 0.0581703, -2.475509, 1, 0, 0, 1, 1,
-0.4571845, 0.05685934, -0.8977956, 1, 0, 0, 1, 1,
-0.4570968, -0.1561732, -1.593264, 1, 0, 0, 1, 1,
-0.4539678, 0.3782169, -0.6203601, 0, 0, 0, 1, 1,
-0.4529596, 0.4288322, -0.4794046, 0, 0, 0, 1, 1,
-0.4509832, 1.864937, -1.03426, 0, 0, 0, 1, 1,
-0.4497252, 0.4170162, -0.1587804, 0, 0, 0, 1, 1,
-0.4482133, -1.713102, -2.16235, 0, 0, 0, 1, 1,
-0.447271, -0.494787, -3.16569, 0, 0, 0, 1, 1,
-0.4436377, 0.4570619, -0.9108005, 0, 0, 0, 1, 1,
-0.4433713, -0.2841444, -1.894022, 1, 1, 1, 1, 1,
-0.4398746, -0.4136105, -2.242645, 1, 1, 1, 1, 1,
-0.4339536, -0.8565324, -2.781864, 1, 1, 1, 1, 1,
-0.4335614, -0.5506316, -3.489665, 1, 1, 1, 1, 1,
-0.4302598, -1.889602, -3.186903, 1, 1, 1, 1, 1,
-0.4302265, -1.6046, -3.021508, 1, 1, 1, 1, 1,
-0.4268581, -1.632518, -2.383487, 1, 1, 1, 1, 1,
-0.4265553, 1.046166, -0.8506476, 1, 1, 1, 1, 1,
-0.4255617, -0.4466879, -1.659693, 1, 1, 1, 1, 1,
-0.4229978, 0.5323663, -1.146802, 1, 1, 1, 1, 1,
-0.4222, -0.2906353, -2.698351, 1, 1, 1, 1, 1,
-0.4190365, -1.014105, -2.895705, 1, 1, 1, 1, 1,
-0.414016, -0.5302283, -2.738578, 1, 1, 1, 1, 1,
-0.4117229, -0.03340264, -2.529618, 1, 1, 1, 1, 1,
-0.4114789, 0.2244651, -0.2406051, 1, 1, 1, 1, 1,
-0.410782, 1.312686, 0.5190876, 0, 0, 1, 1, 1,
-0.4082664, 0.2985324, -1.61017, 1, 0, 0, 1, 1,
-0.4063848, -1.36174, -3.270955, 1, 0, 0, 1, 1,
-0.401736, 1.41064, -1.414486, 1, 0, 0, 1, 1,
-0.4002095, -1.101561, -2.307458, 1, 0, 0, 1, 1,
-0.3902674, 0.5400317, -1.751464, 1, 0, 0, 1, 1,
-0.3864985, 1.766325, -0.2080004, 0, 0, 0, 1, 1,
-0.3751129, -1.696603, -1.234358, 0, 0, 0, 1, 1,
-0.3748412, 0.8480194, 0.7586792, 0, 0, 0, 1, 1,
-0.3723653, -2.066311, -1.265091, 0, 0, 0, 1, 1,
-0.3654825, -1.541276, -4.803518, 0, 0, 0, 1, 1,
-0.3580448, 1.317375, -0.3003287, 0, 0, 0, 1, 1,
-0.3577666, 0.01992775, -1.092881, 0, 0, 0, 1, 1,
-0.3518754, -0.717565, -3.330941, 1, 1, 1, 1, 1,
-0.3405805, 1.56304, 1.179564, 1, 1, 1, 1, 1,
-0.3405108, 0.2540977, -1.006978, 1, 1, 1, 1, 1,
-0.3376178, 1.067448, 1.242553, 1, 1, 1, 1, 1,
-0.3357489, -1.052987, -3.217937, 1, 1, 1, 1, 1,
-0.3310158, -0.7160131, -3.013864, 1, 1, 1, 1, 1,
-0.3309095, 0.9750482, -1.121452, 1, 1, 1, 1, 1,
-0.3254037, 0.005210664, -1.848772, 1, 1, 1, 1, 1,
-0.3232299, -1.055045, -4.139238, 1, 1, 1, 1, 1,
-0.3203921, 0.3786253, 0.8117649, 1, 1, 1, 1, 1,
-0.3156813, -0.3393976, -3.485967, 1, 1, 1, 1, 1,
-0.3136834, -0.7599546, -4.427396, 1, 1, 1, 1, 1,
-0.3122427, 1.097493, 1.591846, 1, 1, 1, 1, 1,
-0.3055408, 0.07869348, -0.7572901, 1, 1, 1, 1, 1,
-0.3044104, 0.7873298, 0.6327072, 1, 1, 1, 1, 1,
-0.2945953, -1.171611, -4.063588, 0, 0, 1, 1, 1,
-0.2881849, -0.9806907, -1.067077, 1, 0, 0, 1, 1,
-0.2868635, -1.257459, -2.308974, 1, 0, 0, 1, 1,
-0.2837474, -0.4693799, -3.944547, 1, 0, 0, 1, 1,
-0.2831229, -0.6741586, -2.71054, 1, 0, 0, 1, 1,
-0.2816921, -0.282141, -1.777337, 1, 0, 0, 1, 1,
-0.2767555, -1.297472, -4.229795, 0, 0, 0, 1, 1,
-0.2748652, 0.6925806, 0.2986677, 0, 0, 0, 1, 1,
-0.2739878, 0.2846048, -0.6194943, 0, 0, 0, 1, 1,
-0.2735558, 1.302366, -2.827784, 0, 0, 0, 1, 1,
-0.2728683, -0.5743271, -3.294446, 0, 0, 0, 1, 1,
-0.2725927, -0.8188113, -0.9969504, 0, 0, 0, 1, 1,
-0.2700631, 1.038881, -0.7222518, 0, 0, 0, 1, 1,
-0.2692544, 0.8165222, -0.06219823, 1, 1, 1, 1, 1,
-0.2689434, 0.8859724, 0.3413768, 1, 1, 1, 1, 1,
-0.2640973, 1.443837, -0.7217268, 1, 1, 1, 1, 1,
-0.2603732, 0.1430537, 0.7409126, 1, 1, 1, 1, 1,
-0.2576639, 1.244247, 0.1183847, 1, 1, 1, 1, 1,
-0.2560377, -0.1129727, -2.071114, 1, 1, 1, 1, 1,
-0.2554542, -1.582078, -2.431986, 1, 1, 1, 1, 1,
-0.2515082, -0.1047036, -2.264033, 1, 1, 1, 1, 1,
-0.2450947, -0.1706501, -3.331764, 1, 1, 1, 1, 1,
-0.2437846, -0.06169612, -1.151345, 1, 1, 1, 1, 1,
-0.2381442, -0.2167522, -1.691857, 1, 1, 1, 1, 1,
-0.2379219, 1.529529, -0.1278684, 1, 1, 1, 1, 1,
-0.2355712, 0.1220791, -1.188765, 1, 1, 1, 1, 1,
-0.2349102, -0.1075996, -1.88683, 1, 1, 1, 1, 1,
-0.233429, 0.2250836, -1.505039, 1, 1, 1, 1, 1,
-0.2318223, -0.005028764, -3.137481, 0, 0, 1, 1, 1,
-0.224032, -0.1553709, -0.2280488, 1, 0, 0, 1, 1,
-0.2217197, 0.5780104, -1.286245, 1, 0, 0, 1, 1,
-0.2204558, -0.5134677, -1.730077, 1, 0, 0, 1, 1,
-0.2200332, -0.3538228, -2.030569, 1, 0, 0, 1, 1,
-0.2157155, 0.3831269, -0.5053573, 1, 0, 0, 1, 1,
-0.2105278, -0.9011346, -4.094844, 0, 0, 0, 1, 1,
-0.2105233, -0.7263139, -2.549673, 0, 0, 0, 1, 1,
-0.2102092, 0.4670185, -0.812534, 0, 0, 0, 1, 1,
-0.2099213, -1.240567, -2.627613, 0, 0, 0, 1, 1,
-0.2074877, -0.5558689, -2.46101, 0, 0, 0, 1, 1,
-0.2043583, 0.005252369, -0.397794, 0, 0, 0, 1, 1,
-0.2042178, 0.06118284, 0.04296248, 0, 0, 0, 1, 1,
-0.203174, -2.085899, -3.442855, 1, 1, 1, 1, 1,
-0.1980837, 0.2616245, -0.7080621, 1, 1, 1, 1, 1,
-0.1971963, 0.6830289, 0.6839533, 1, 1, 1, 1, 1,
-0.1965062, 0.3934332, -0.719757, 1, 1, 1, 1, 1,
-0.1953488, 0.0617974, -1.174788, 1, 1, 1, 1, 1,
-0.1906628, 0.5963253, -1.045216, 1, 1, 1, 1, 1,
-0.1884762, 0.5942932, -0.8590081, 1, 1, 1, 1, 1,
-0.1871156, -0.5812765, -4.448857, 1, 1, 1, 1, 1,
-0.1859506, -0.34382, -1.884325, 1, 1, 1, 1, 1,
-0.1833123, 1.74272, 0.8178511, 1, 1, 1, 1, 1,
-0.1831529, 0.1140757, 0.1175333, 1, 1, 1, 1, 1,
-0.1811331, -1.617203, -3.534857, 1, 1, 1, 1, 1,
-0.1772343, 3.469884, -0.4051366, 1, 1, 1, 1, 1,
-0.1763568, 1.219813, 0.4213128, 1, 1, 1, 1, 1,
-0.1748922, -1.035311, -2.993639, 1, 1, 1, 1, 1,
-0.1746249, -0.3954699, -1.973551, 0, 0, 1, 1, 1,
-0.1702806, -0.2580296, -2.667532, 1, 0, 0, 1, 1,
-0.1675532, -0.0249479, -1.978784, 1, 0, 0, 1, 1,
-0.1668443, 0.5593891, -0.8392753, 1, 0, 0, 1, 1,
-0.1632402, -0.8743855, -0.9552811, 1, 0, 0, 1, 1,
-0.1586544, -0.4795358, -3.135463, 1, 0, 0, 1, 1,
-0.1558273, 0.2792999, -0.2688394, 0, 0, 0, 1, 1,
-0.1556928, -1.122895, -1.791921, 0, 0, 0, 1, 1,
-0.1540866, 0.1368608, 0.432076, 0, 0, 0, 1, 1,
-0.152934, -0.03651471, 0.6189173, 0, 0, 0, 1, 1,
-0.1519515, -1.821417, -3.746249, 0, 0, 0, 1, 1,
-0.1473706, 0.2949983, -1.319538, 0, 0, 0, 1, 1,
-0.138848, 1.017848, 0.1420949, 0, 0, 0, 1, 1,
-0.137373, -1.639908, -2.983757, 1, 1, 1, 1, 1,
-0.1339198, 1.287185, -0.6815867, 1, 1, 1, 1, 1,
-0.1308207, 0.5154441, -0.4283718, 1, 1, 1, 1, 1,
-0.1303193, -0.04244592, -2.47313, 1, 1, 1, 1, 1,
-0.12968, 1.711073, -1.073442, 1, 1, 1, 1, 1,
-0.1293346, 0.1283496, -0.2107446, 1, 1, 1, 1, 1,
-0.1284505, 0.2585658, -1.159932, 1, 1, 1, 1, 1,
-0.1270327, -0.7653122, -1.243268, 1, 1, 1, 1, 1,
-0.1225432, 0.5825226, -0.8070001, 1, 1, 1, 1, 1,
-0.1181248, -0.9889625, -2.818891, 1, 1, 1, 1, 1,
-0.1081658, -0.1088283, -3.738816, 1, 1, 1, 1, 1,
-0.1073264, 1.413049, 0.1136519, 1, 1, 1, 1, 1,
-0.105942, 0.8702185, 0.6358971, 1, 1, 1, 1, 1,
-0.1039958, -1.452122, -3.91656, 1, 1, 1, 1, 1,
-0.1029404, -1.287439, -2.027729, 1, 1, 1, 1, 1,
-0.09863603, 0.5339429, -0.3678856, 0, 0, 1, 1, 1,
-0.09651858, 0.6553008, -0.7290406, 1, 0, 0, 1, 1,
-0.09425315, -0.02754989, -1.666982, 1, 0, 0, 1, 1,
-0.09265169, -0.1916043, -3.283575, 1, 0, 0, 1, 1,
-0.09193943, -0.2444641, -2.341653, 1, 0, 0, 1, 1,
-0.08826071, -0.7724895, -4.289724, 1, 0, 0, 1, 1,
-0.08771717, 0.06836552, -2.783831, 0, 0, 0, 1, 1,
-0.08588919, -0.7189276, -3.186864, 0, 0, 0, 1, 1,
-0.08512241, 0.3475079, -1.050974, 0, 0, 0, 1, 1,
-0.08265024, 0.618439, -1.002404, 0, 0, 0, 1, 1,
-0.0813125, -0.1025636, -3.179788, 0, 0, 0, 1, 1,
-0.08040757, 0.2988482, -0.6460502, 0, 0, 0, 1, 1,
-0.08030822, -1.128785, -4.151657, 0, 0, 0, 1, 1,
-0.07476902, -0.07439467, -2.889199, 1, 1, 1, 1, 1,
-0.07068139, 0.0332362, -3.394401, 1, 1, 1, 1, 1,
-0.06326307, -0.3900503, -2.45558, 1, 1, 1, 1, 1,
-0.06087034, -0.7809983, -2.034028, 1, 1, 1, 1, 1,
-0.05951682, 0.1144223, -0.4344889, 1, 1, 1, 1, 1,
-0.05730411, -0.8778185, -3.294098, 1, 1, 1, 1, 1,
-0.05538001, 0.002196786, -1.927548, 1, 1, 1, 1, 1,
-0.04605867, 0.9126133, 1.219193, 1, 1, 1, 1, 1,
-0.04575134, 0.7362961, 2.226719, 1, 1, 1, 1, 1,
-0.04559684, 1.073092, -0.2413445, 1, 1, 1, 1, 1,
-0.03730959, 0.3332264, 0.1975579, 1, 1, 1, 1, 1,
-0.03607386, 1.027498, -0.278716, 1, 1, 1, 1, 1,
-0.03447297, 0.3624143, 0.3021205, 1, 1, 1, 1, 1,
-0.03344075, -0.7567518, -2.686109, 1, 1, 1, 1, 1,
-0.0315766, 1.854552, -0.1856042, 1, 1, 1, 1, 1,
-0.03108284, -1.241466, -4.77668, 0, 0, 1, 1, 1,
-0.03028112, 0.26225, 0.1217174, 1, 0, 0, 1, 1,
-0.02919723, 1.428582, 0.7081409, 1, 0, 0, 1, 1,
-0.02892938, -0.04683164, -1.643719, 1, 0, 0, 1, 1,
-0.02709267, 0.2405761, -2.000306, 1, 0, 0, 1, 1,
-0.02459916, -2.219839, -3.567087, 1, 0, 0, 1, 1,
-0.02405558, -0.2360513, -4.224916, 0, 0, 0, 1, 1,
-0.02182875, 1.31776, -0.2568818, 0, 0, 0, 1, 1,
-0.0193931, 2.122119, 0.3060872, 0, 0, 0, 1, 1,
-0.01757614, 0.2988941, 1.827657, 0, 0, 0, 1, 1,
-0.01693985, 1.607489, 3.057234, 0, 0, 0, 1, 1,
-0.0123204, 0.3980818, -0.4149622, 0, 0, 0, 1, 1,
-0.01125187, 1.069167, -1.058541, 0, 0, 0, 1, 1,
-0.01084735, -0.1749726, -3.497812, 1, 1, 1, 1, 1,
-0.008904045, 1.970077, 0.4860836, 1, 1, 1, 1, 1,
-0.008753053, 1.187123, -0.5365809, 1, 1, 1, 1, 1,
-0.007614393, -0.4690621, -3.295952, 1, 1, 1, 1, 1,
-0.003983919, -1.640053, -3.039637, 1, 1, 1, 1, 1,
-0.001405367, -0.2777927, -1.169949, 1, 1, 1, 1, 1,
-5.81846e-05, -0.5046509, -2.976659, 1, 1, 1, 1, 1,
0.0007028919, 0.08871166, -0.7570382, 1, 1, 1, 1, 1,
0.001256326, 0.5115146, -0.9323501, 1, 1, 1, 1, 1,
0.001621628, -0.3988276, 4.51815, 1, 1, 1, 1, 1,
0.002918315, 1.072622, -1.566397, 1, 1, 1, 1, 1,
0.006750029, 2.65834, -1.394731, 1, 1, 1, 1, 1,
0.009085527, -1.44861, 2.907222, 1, 1, 1, 1, 1,
0.01062085, 0.4656172, 1.844093, 1, 1, 1, 1, 1,
0.01442856, 1.870479, 1.245717, 1, 1, 1, 1, 1,
0.01450358, 1.896461, 0.893755, 0, 0, 1, 1, 1,
0.01490184, 0.0534514, 0.3791035, 1, 0, 0, 1, 1,
0.01518341, -1.687919, 2.915871, 1, 0, 0, 1, 1,
0.02068511, -1.610427, 3.19898, 1, 0, 0, 1, 1,
0.02127611, 0.7277725, 0.2409091, 1, 0, 0, 1, 1,
0.02394319, -0.4226297, 2.761626, 1, 0, 0, 1, 1,
0.0251025, 1.304016, -0.6741532, 0, 0, 0, 1, 1,
0.02800979, 0.4131871, 0.5298231, 0, 0, 0, 1, 1,
0.03100246, 0.006581932, 1.44017, 0, 0, 0, 1, 1,
0.03400408, 0.7221504, -1.267016, 0, 0, 0, 1, 1,
0.03471458, -1.36403, 3.405286, 0, 0, 0, 1, 1,
0.03541349, -0.6655748, 2.942122, 0, 0, 0, 1, 1,
0.03556432, 0.4808183, -1.042967, 0, 0, 0, 1, 1,
0.03607957, -0.6207814, 3.82378, 1, 1, 1, 1, 1,
0.03628702, -0.6517755, 2.661124, 1, 1, 1, 1, 1,
0.03642563, 2.31824, 0.6166778, 1, 1, 1, 1, 1,
0.0386547, 2.443033, -2.728574, 1, 1, 1, 1, 1,
0.04150907, 1.570274, 0.8902299, 1, 1, 1, 1, 1,
0.04415628, 0.0009186898, 3.377202, 1, 1, 1, 1, 1,
0.04417827, -0.9632698, 1.900462, 1, 1, 1, 1, 1,
0.04644752, -0.7107189, 1.923901, 1, 1, 1, 1, 1,
0.04794171, -1.241511, 4.514066, 1, 1, 1, 1, 1,
0.05734923, 0.6094229, -0.1813045, 1, 1, 1, 1, 1,
0.06494192, 0.8320616, 1.127546, 1, 1, 1, 1, 1,
0.06650984, -1.026746, 4.561553, 1, 1, 1, 1, 1,
0.06833436, 2.01358, -1.473296, 1, 1, 1, 1, 1,
0.06897248, 0.2692493, 0.6987745, 1, 1, 1, 1, 1,
0.07555474, -0.009534883, 3.755696, 1, 1, 1, 1, 1,
0.07832689, -0.9870281, 3.682621, 0, 0, 1, 1, 1,
0.08000266, 0.5522174, -0.4111124, 1, 0, 0, 1, 1,
0.08103079, 1.017882, -0.7097079, 1, 0, 0, 1, 1,
0.08147562, -0.8849156, 2.953065, 1, 0, 0, 1, 1,
0.08539572, -0.1649249, 3.215877, 1, 0, 0, 1, 1,
0.08768213, 0.3312429, 1.568968, 1, 0, 0, 1, 1,
0.08777916, 0.3957399, -0.2536696, 0, 0, 0, 1, 1,
0.08993728, 2.301622, -1.593899, 0, 0, 0, 1, 1,
0.08993995, -0.7189474, 2.942177, 0, 0, 0, 1, 1,
0.09149655, 1.023043, 0.4544154, 0, 0, 0, 1, 1,
0.09359916, -0.7392985, 2.166719, 0, 0, 0, 1, 1,
0.09431355, 1.299422, 0.1315959, 0, 0, 0, 1, 1,
0.09459656, 0.8125128, 0.4266468, 0, 0, 0, 1, 1,
0.09549335, -0.1863995, 3.376617, 1, 1, 1, 1, 1,
0.1057067, -0.2710935, 1.184234, 1, 1, 1, 1, 1,
0.1063355, -0.227458, 2.299785, 1, 1, 1, 1, 1,
0.1079205, -0.1168824, 1.104535, 1, 1, 1, 1, 1,
0.1109126, 0.5479167, -0.6091911, 1, 1, 1, 1, 1,
0.1144626, 0.8919141, 0.3352314, 1, 1, 1, 1, 1,
0.1149989, -0.6338477, 4.049663, 1, 1, 1, 1, 1,
0.11546, 1.062243, 0.8246088, 1, 1, 1, 1, 1,
0.1157671, 1.045866, 0.1270478, 1, 1, 1, 1, 1,
0.1170145, 0.1947059, -0.4717523, 1, 1, 1, 1, 1,
0.1269381, 0.1621861, -1.876412, 1, 1, 1, 1, 1,
0.1270071, 1.76813, 1.544887, 1, 1, 1, 1, 1,
0.127492, 1.447437, -0.2238959, 1, 1, 1, 1, 1,
0.1280287, 0.4999009, -1.663682, 1, 1, 1, 1, 1,
0.1307834, 1.560838, -1.089418, 1, 1, 1, 1, 1,
0.1312, 0.8778529, 0.6702237, 0, 0, 1, 1, 1,
0.1329571, -0.4997236, 2.534661, 1, 0, 0, 1, 1,
0.1334659, -0.3283744, 4.633815, 1, 0, 0, 1, 1,
0.1354912, 0.5287377, -0.1777827, 1, 0, 0, 1, 1,
0.1393123, -0.9997359, 3.462767, 1, 0, 0, 1, 1,
0.1395923, -0.3038752, 4.213155, 1, 0, 0, 1, 1,
0.1424421, -0.859877, 2.324492, 0, 0, 0, 1, 1,
0.1431447, -0.1398138, 2.25806, 0, 0, 0, 1, 1,
0.1520709, -1.382824, 1.437309, 0, 0, 0, 1, 1,
0.1521287, 0.2608236, 0.03548966, 0, 0, 0, 1, 1,
0.1536069, -0.980577, 3.604281, 0, 0, 0, 1, 1,
0.153956, -0.3364361, 2.559193, 0, 0, 0, 1, 1,
0.1547686, 1.211582, -0.943312, 0, 0, 0, 1, 1,
0.1577272, -0.8435206, 1.659691, 1, 1, 1, 1, 1,
0.1578528, -0.2506236, 1.576556, 1, 1, 1, 1, 1,
0.1580423, 0.588466, 0.5930643, 1, 1, 1, 1, 1,
0.1597733, 0.4010212, 0.8251437, 1, 1, 1, 1, 1,
0.1629176, -0.8999041, 1.623002, 1, 1, 1, 1, 1,
0.1643875, 1.461038, 0.6278191, 1, 1, 1, 1, 1,
0.1663873, 0.841405, -0.04977331, 1, 1, 1, 1, 1,
0.1717992, -0.3275984, 1.173899, 1, 1, 1, 1, 1,
0.1720085, -0.8207217, 5.288536, 1, 1, 1, 1, 1,
0.1724764, 1.198865, 0.7268177, 1, 1, 1, 1, 1,
0.174462, -1.657319, 3.94351, 1, 1, 1, 1, 1,
0.1751941, -0.1221104, 3.032298, 1, 1, 1, 1, 1,
0.1770025, -0.5219815, 3.336378, 1, 1, 1, 1, 1,
0.1773218, 0.6646911, -0.353326, 1, 1, 1, 1, 1,
0.1773468, -1.587849, 4.033882, 1, 1, 1, 1, 1,
0.1823349, -0.8351204, 1.049842, 0, 0, 1, 1, 1,
0.1824518, -0.5984514, 4.236805, 1, 0, 0, 1, 1,
0.1830602, 0.7050574, 0.4495643, 1, 0, 0, 1, 1,
0.1885632, 1.026498, 1.14044, 1, 0, 0, 1, 1,
0.1900361, -1.296171, 1.671783, 1, 0, 0, 1, 1,
0.1933534, -0.9821618, 4.917252, 1, 0, 0, 1, 1,
0.1966323, -1.237054, 4.075293, 0, 0, 0, 1, 1,
0.1975464, 0.01691007, 0.341807, 0, 0, 0, 1, 1,
0.2000953, -0.1012924, 2.803937, 0, 0, 0, 1, 1,
0.2089527, -0.2916926, 0.8758268, 0, 0, 0, 1, 1,
0.2093563, -1.298049, 3.415039, 0, 0, 0, 1, 1,
0.2134964, -0.8215419, 4.219811, 0, 0, 0, 1, 1,
0.2159555, -0.8561013, 3.385636, 0, 0, 0, 1, 1,
0.2164797, -0.4309605, 2.790424, 1, 1, 1, 1, 1,
0.2198726, -1.033872, 3.004499, 1, 1, 1, 1, 1,
0.2213511, -0.7072812, 3.419229, 1, 1, 1, 1, 1,
0.2237019, 0.2145337, -0.8670531, 1, 1, 1, 1, 1,
0.2246301, -1.941432, 1.419126, 1, 1, 1, 1, 1,
0.2247109, 1.150429, 0.05345684, 1, 1, 1, 1, 1,
0.226102, -1.219717, 0.8931533, 1, 1, 1, 1, 1,
0.226822, -1.211283, 2.496121, 1, 1, 1, 1, 1,
0.2326333, -0.6130185, 2.516786, 1, 1, 1, 1, 1,
0.2395915, -1.036116, 2.307033, 1, 1, 1, 1, 1,
0.244412, 0.06328701, 0.8016776, 1, 1, 1, 1, 1,
0.2464173, 0.1369652, 1.580697, 1, 1, 1, 1, 1,
0.2488392, 0.655337, 1.175238, 1, 1, 1, 1, 1,
0.2547249, 2.136102, -0.2153314, 1, 1, 1, 1, 1,
0.2549894, 0.3598292, 1.432204, 1, 1, 1, 1, 1,
0.2570877, -0.9524384, 2.661564, 0, 0, 1, 1, 1,
0.2580965, -0.7801826, 1.500929, 1, 0, 0, 1, 1,
0.2583678, -0.05960494, 1.857256, 1, 0, 0, 1, 1,
0.2589364, 2.323224, 0.8956781, 1, 0, 0, 1, 1,
0.2589472, -0.7129639, 2.784629, 1, 0, 0, 1, 1,
0.2594194, -0.4679368, 1.653385, 1, 0, 0, 1, 1,
0.2595494, 0.4574985, -0.8990998, 0, 0, 0, 1, 1,
0.2644521, -0.3480489, 0.4625874, 0, 0, 0, 1, 1,
0.2647509, -0.8147151, 3.751291, 0, 0, 0, 1, 1,
0.2656132, -2.777995, 1.451985, 0, 0, 0, 1, 1,
0.2678096, -1.204839, 4.795683, 0, 0, 0, 1, 1,
0.2687014, 0.5444658, -0.4012696, 0, 0, 0, 1, 1,
0.2709426, -0.8612136, 4.496404, 0, 0, 0, 1, 1,
0.2721775, -1.581531, 3.58227, 1, 1, 1, 1, 1,
0.2731212, -0.7219093, 2.494993, 1, 1, 1, 1, 1,
0.2734222, -0.5108266, 2.567786, 1, 1, 1, 1, 1,
0.2738847, -0.5323125, 4.231899, 1, 1, 1, 1, 1,
0.2749244, -1.469361, 2.002784, 1, 1, 1, 1, 1,
0.2767364, -0.002477491, 3.694634, 1, 1, 1, 1, 1,
0.2780784, 0.2902018, 1.960212, 1, 1, 1, 1, 1,
0.2791241, -1.275562, 2.320981, 1, 1, 1, 1, 1,
0.2810362, -0.5324383, 2.867908, 1, 1, 1, 1, 1,
0.2828813, -0.3258691, 2.382213, 1, 1, 1, 1, 1,
0.2828961, -0.2368722, -0.1746362, 1, 1, 1, 1, 1,
0.2851284, 0.2916829, 0.03967081, 1, 1, 1, 1, 1,
0.2891654, 1.075569, 2.487572, 1, 1, 1, 1, 1,
0.2897228, -0.1080142, 1.312685, 1, 1, 1, 1, 1,
0.2960549, 0.350329, 2.470781, 1, 1, 1, 1, 1,
0.2996703, 0.7408923, 0.7136916, 0, 0, 1, 1, 1,
0.3003597, 0.01428123, 0.5549702, 1, 0, 0, 1, 1,
0.3038341, -0.07884727, 1.441643, 1, 0, 0, 1, 1,
0.3070929, 0.3217966, 1.896569, 1, 0, 0, 1, 1,
0.3074076, 0.6305647, -0.343253, 1, 0, 0, 1, 1,
0.31694, 1.273463, 1.494317, 1, 0, 0, 1, 1,
0.3172312, -1.562515, 1.88988, 0, 0, 0, 1, 1,
0.3173512, -1.270797, 3.47494, 0, 0, 0, 1, 1,
0.3192029, -0.5412381, 0.07967632, 0, 0, 0, 1, 1,
0.3220531, -0.8835706, 2.480983, 0, 0, 0, 1, 1,
0.3238291, -0.5638427, 1.757791, 0, 0, 0, 1, 1,
0.3297435, -0.6553234, 0.7708572, 0, 0, 0, 1, 1,
0.3301201, 1.101261, 2.67049, 0, 0, 0, 1, 1,
0.3306924, -0.8115038, 3.118874, 1, 1, 1, 1, 1,
0.3337215, -1.157974, 2.491338, 1, 1, 1, 1, 1,
0.3457104, 1.872411, 0.8326189, 1, 1, 1, 1, 1,
0.3470173, 0.08267967, -0.5059047, 1, 1, 1, 1, 1,
0.3507472, 1.677144, -0.5809938, 1, 1, 1, 1, 1,
0.3544975, -1.683765, 4.383241, 1, 1, 1, 1, 1,
0.3546004, -1.460789, 3.900338, 1, 1, 1, 1, 1,
0.3547725, 0.308185, 0.3860569, 1, 1, 1, 1, 1,
0.3567798, -0.1638826, 2.997515, 1, 1, 1, 1, 1,
0.3594516, 0.8726339, 0.1111947, 1, 1, 1, 1, 1,
0.366972, 0.2156727, 2.024132, 1, 1, 1, 1, 1,
0.373528, 0.4079141, 0.8350853, 1, 1, 1, 1, 1,
0.3788446, -0.6165559, 4.917488, 1, 1, 1, 1, 1,
0.3793633, -0.5176925, 2.361982, 1, 1, 1, 1, 1,
0.3821202, -1.533474, 3.290213, 1, 1, 1, 1, 1,
0.3843023, 0.6160598, -0.4926904, 0, 0, 1, 1, 1,
0.386294, 0.8131779, -0.4711875, 1, 0, 0, 1, 1,
0.3866965, -0.5689859, 3.615532, 1, 0, 0, 1, 1,
0.3930567, 0.6311646, 1.713915, 1, 0, 0, 1, 1,
0.3961276, -0.799189, 2.333695, 1, 0, 0, 1, 1,
0.396381, -0.4052473, 1.284949, 1, 0, 0, 1, 1,
0.400019, 0.150749, 2.281323, 0, 0, 0, 1, 1,
0.4013917, 1.215199, -0.6644437, 0, 0, 0, 1, 1,
0.4023156, -0.2000894, 2.335998, 0, 0, 0, 1, 1,
0.4032388, 0.1879841, 0.9766716, 0, 0, 0, 1, 1,
0.4043173, 1.619409, -0.6151873, 0, 0, 0, 1, 1,
0.4051923, 1.619183, 1.133198, 0, 0, 0, 1, 1,
0.4065778, 0.2695483, 1.578077, 0, 0, 0, 1, 1,
0.4079395, -0.6640207, 2.077266, 1, 1, 1, 1, 1,
0.4189655, -0.5719884, 3.717222, 1, 1, 1, 1, 1,
0.4195878, -1.437489, 3.055223, 1, 1, 1, 1, 1,
0.4201086, 0.3822566, 0.6393144, 1, 1, 1, 1, 1,
0.4268974, 1.080777, 0.2352911, 1, 1, 1, 1, 1,
0.4273067, -0.417701, 2.946317, 1, 1, 1, 1, 1,
0.4297241, -0.7053586, 4.394561, 1, 1, 1, 1, 1,
0.4307108, 2.096319, -0.4610629, 1, 1, 1, 1, 1,
0.4417806, -0.6383371, 2.5612, 1, 1, 1, 1, 1,
0.4421513, 0.3875944, 0.8533021, 1, 1, 1, 1, 1,
0.4432645, 0.7653924, 0.1685425, 1, 1, 1, 1, 1,
0.4460012, -0.5913821, 1.490709, 1, 1, 1, 1, 1,
0.4505863, 0.4614189, -0.441629, 1, 1, 1, 1, 1,
0.4553628, -1.412805, 0.4153644, 1, 1, 1, 1, 1,
0.4560692, 0.20989, -0.01892131, 1, 1, 1, 1, 1,
0.4564464, 0.7765127, 0.3360419, 0, 0, 1, 1, 1,
0.4643083, 0.1031596, 1.48332, 1, 0, 0, 1, 1,
0.4778939, 0.1217782, 1.773924, 1, 0, 0, 1, 1,
0.4784003, -0.7517502, 2.652053, 1, 0, 0, 1, 1,
0.4891401, 0.6430789, 0.9798277, 1, 0, 0, 1, 1,
0.4900315, -0.3850541, 4.185385, 1, 0, 0, 1, 1,
0.4944253, -0.4109973, 3.097691, 0, 0, 0, 1, 1,
0.4981401, 0.5109712, -0.6169407, 0, 0, 0, 1, 1,
0.4984213, -0.3569627, 3.06837, 0, 0, 0, 1, 1,
0.4985719, 2.463722, 0.413815, 0, 0, 0, 1, 1,
0.4986978, -1.832976, 1.8149, 0, 0, 0, 1, 1,
0.4987864, -0.2049846, 0.7367781, 0, 0, 0, 1, 1,
0.5059636, -0.4112295, 2.68955, 0, 0, 0, 1, 1,
0.508854, -1.820249, 3.224081, 1, 1, 1, 1, 1,
0.5095944, 0.3661095, 1.247702, 1, 1, 1, 1, 1,
0.5108041, 0.05281706, 3.299338, 1, 1, 1, 1, 1,
0.5120312, 0.3806671, 1.217834, 1, 1, 1, 1, 1,
0.5130302, -0.7670292, 3.267311, 1, 1, 1, 1, 1,
0.5163713, -1.49768, 2.482976, 1, 1, 1, 1, 1,
0.5206997, -0.1660068, 1.668673, 1, 1, 1, 1, 1,
0.5240463, 0.3317039, 0.570491, 1, 1, 1, 1, 1,
0.5287477, -1.142666, 3.156032, 1, 1, 1, 1, 1,
0.5318546, -0.9895805, 2.663036, 1, 1, 1, 1, 1,
0.5328804, -0.6246921, 2.008764, 1, 1, 1, 1, 1,
0.5365121, -0.5432492, 2.042438, 1, 1, 1, 1, 1,
0.541783, 0.02365635, 1.550158, 1, 1, 1, 1, 1,
0.5460353, 2.201551, -1.643246, 1, 1, 1, 1, 1,
0.5473173, -1.507787, 4.091891, 1, 1, 1, 1, 1,
0.5501176, -0.5277776, 2.720659, 0, 0, 1, 1, 1,
0.5545102, 2.382305, 1.3249, 1, 0, 0, 1, 1,
0.5689133, 2.089376, 0.517558, 1, 0, 0, 1, 1,
0.5708218, 1.230209, 0.7688532, 1, 0, 0, 1, 1,
0.5723731, -1.484711, 2.519139, 1, 0, 0, 1, 1,
0.5800141, 0.271647, 2.465143, 1, 0, 0, 1, 1,
0.5857959, 0.6967058, 0.5503791, 0, 0, 0, 1, 1,
0.5933148, 0.367347, 0.8694526, 0, 0, 0, 1, 1,
0.6022453, 2.038969, 1.034181, 0, 0, 0, 1, 1,
0.6037184, -0.1101528, 1.823984, 0, 0, 0, 1, 1,
0.6049441, -1.462201, 3.093472, 0, 0, 0, 1, 1,
0.6077009, 0.2475174, 0.9119794, 0, 0, 0, 1, 1,
0.608925, -0.1100314, 3.066513, 0, 0, 0, 1, 1,
0.6154248, 0.4181902, 1.935334, 1, 1, 1, 1, 1,
0.6172414, -0.19001, 1.208578, 1, 1, 1, 1, 1,
0.6198922, -0.9368622, 2.470508, 1, 1, 1, 1, 1,
0.6199045, 0.3054674, 2.687734, 1, 1, 1, 1, 1,
0.6253672, 1.383426, 0.8594467, 1, 1, 1, 1, 1,
0.6290126, 1.685616, 1.490865, 1, 1, 1, 1, 1,
0.6318833, 1.485141, -0.1432461, 1, 1, 1, 1, 1,
0.6343212, -0.1526048, 2.261417, 1, 1, 1, 1, 1,
0.6347513, 1.095681, -1.057961, 1, 1, 1, 1, 1,
0.635538, -1.057928, 2.668479, 1, 1, 1, 1, 1,
0.6469446, -0.06439641, -0.1495618, 1, 1, 1, 1, 1,
0.647835, 1.77832, 1.101847, 1, 1, 1, 1, 1,
0.6483247, -1.674016, 1.147157, 1, 1, 1, 1, 1,
0.6517375, -0.2988099, 1.840266, 1, 1, 1, 1, 1,
0.6523197, -0.3126202, 1.816904, 1, 1, 1, 1, 1,
0.6523513, -1.613438, 3.039185, 0, 0, 1, 1, 1,
0.6567056, 0.2527131, 0.779988, 1, 0, 0, 1, 1,
0.6659608, 1.777714, -1.248624, 1, 0, 0, 1, 1,
0.666869, -0.04990483, 4.204767, 1, 0, 0, 1, 1,
0.6681891, -0.3145209, 1.713931, 1, 0, 0, 1, 1,
0.6703504, -0.9949235, 2.145639, 1, 0, 0, 1, 1,
0.6705368, 0.5979204, 0.7369453, 0, 0, 0, 1, 1,
0.6775953, -0.108343, 1.293387, 0, 0, 0, 1, 1,
0.6780759, 1.550957, 0.3335604, 0, 0, 0, 1, 1,
0.6782317, -1.202749, 1.810446, 0, 0, 0, 1, 1,
0.6791489, 1.661515, -0.9782537, 0, 0, 0, 1, 1,
0.6823505, 0.2863904, 1.560276, 0, 0, 0, 1, 1,
0.6875012, -1.620887, 2.61246, 0, 0, 0, 1, 1,
0.689685, 0.51773, -0.4422524, 1, 1, 1, 1, 1,
0.6975083, 0.4376836, 0.2912024, 1, 1, 1, 1, 1,
0.6998658, 0.4930811, 1.044737, 1, 1, 1, 1, 1,
0.7003031, 0.2479792, -0.1468528, 1, 1, 1, 1, 1,
0.7037749, 0.3042512, 0.08208256, 1, 1, 1, 1, 1,
0.7086799, -0.08745972, 1.267161, 1, 1, 1, 1, 1,
0.7112659, 0.9883339, 1.293591, 1, 1, 1, 1, 1,
0.7153071, 1.05426, 0.1085746, 1, 1, 1, 1, 1,
0.7161428, 0.6470158, -0.149721, 1, 1, 1, 1, 1,
0.7169425, -0.4964912, 2.432749, 1, 1, 1, 1, 1,
0.7186131, -0.1293158, 1.243352, 1, 1, 1, 1, 1,
0.7214805, -0.8178316, 1.234294, 1, 1, 1, 1, 1,
0.7237378, -0.07107621, 3.059522, 1, 1, 1, 1, 1,
0.7309077, -0.7211837, 2.483655, 1, 1, 1, 1, 1,
0.734454, -0.7979885, 1.794268, 1, 1, 1, 1, 1,
0.7391689, 1.097606, -0.1457433, 0, 0, 1, 1, 1,
0.7440952, 1.071601, 0.4330216, 1, 0, 0, 1, 1,
0.7553786, -0.822598, 3.512892, 1, 0, 0, 1, 1,
0.7624126, -0.1811716, 2.104391, 1, 0, 0, 1, 1,
0.7725812, -0.4247193, 1.528613, 1, 0, 0, 1, 1,
0.7748638, 1.778132, -0.5218598, 1, 0, 0, 1, 1,
0.7778639, -1.642925, 4.606709, 0, 0, 0, 1, 1,
0.780525, -0.3698239, -0.05289089, 0, 0, 0, 1, 1,
0.8029292, -0.02459701, 2.173549, 0, 0, 0, 1, 1,
0.8089049, -0.428559, 1.191706, 0, 0, 0, 1, 1,
0.8113056, -0.6724865, 2.283902, 0, 0, 0, 1, 1,
0.8135111, 0.6529325, -1.116409, 0, 0, 0, 1, 1,
0.8199657, 0.2940197, 0.8655877, 0, 0, 0, 1, 1,
0.8219271, -1.28727, 2.785904, 1, 1, 1, 1, 1,
0.822971, -0.6991417, 2.880676, 1, 1, 1, 1, 1,
0.8267103, 0.9195631, 0.5783328, 1, 1, 1, 1, 1,
0.8273412, -0.262253, 1.828916, 1, 1, 1, 1, 1,
0.8281121, 0.4709483, 0.7481326, 1, 1, 1, 1, 1,
0.837027, -0.8136299, 2.136512, 1, 1, 1, 1, 1,
0.8370408, 0.7112284, 2.069667, 1, 1, 1, 1, 1,
0.8379765, -0.05759526, 2.700015, 1, 1, 1, 1, 1,
0.8434681, -0.4664492, 2.687327, 1, 1, 1, 1, 1,
0.8580887, 0.05463158, 1.669141, 1, 1, 1, 1, 1,
0.8697023, 0.4480928, 1.242468, 1, 1, 1, 1, 1,
0.874173, -0.3838306, 1.411442, 1, 1, 1, 1, 1,
0.874738, -1.694767, 3.072101, 1, 1, 1, 1, 1,
0.8747489, -0.3813219, 1.640865, 1, 1, 1, 1, 1,
0.8796365, 1.505568, 0.9625888, 1, 1, 1, 1, 1,
0.8832017, -0.261028, 2.219772, 0, 0, 1, 1, 1,
0.8860709, -1.682971, 2.917951, 1, 0, 0, 1, 1,
0.8900555, 1.890502, 1.549204, 1, 0, 0, 1, 1,
0.8914643, -1.072655, 2.537153, 1, 0, 0, 1, 1,
0.8977938, -0.5634398, 1.820319, 1, 0, 0, 1, 1,
0.9011815, 1.197014, 1.509292, 1, 0, 0, 1, 1,
0.9018533, 1.414871, 0.8024033, 0, 0, 0, 1, 1,
0.9040785, -2.159954, 3.898745, 0, 0, 0, 1, 1,
0.909836, 0.2555457, 0.9873027, 0, 0, 0, 1, 1,
0.912255, 0.007216776, 1.419443, 0, 0, 0, 1, 1,
0.9123629, 0.8667192, 0.5066496, 0, 0, 0, 1, 1,
0.9134716, -0.130331, 3.691873, 0, 0, 0, 1, 1,
0.9154261, 0.4989057, 1.172837, 0, 0, 0, 1, 1,
0.9159951, -0.5749296, 2.765413, 1, 1, 1, 1, 1,
0.9181227, -0.7408898, 2.444283, 1, 1, 1, 1, 1,
0.9181293, -0.6252946, 1.809233, 1, 1, 1, 1, 1,
0.9247568, 1.725789, 1.892889, 1, 1, 1, 1, 1,
0.9300661, -0.1417854, 2.867902, 1, 1, 1, 1, 1,
0.9356521, -0.1123828, 2.172952, 1, 1, 1, 1, 1,
0.9408054, -0.3326772, 0.6537901, 1, 1, 1, 1, 1,
0.9449054, -0.6046085, 1.896975, 1, 1, 1, 1, 1,
0.9552765, -0.8647751, 2.41596, 1, 1, 1, 1, 1,
0.958572, -1.507455, 1.834365, 1, 1, 1, 1, 1,
0.9600518, -2.0036, 1.538698, 1, 1, 1, 1, 1,
0.9673645, -0.7498581, 0.8467521, 1, 1, 1, 1, 1,
0.9677338, -1.533145, 3.374143, 1, 1, 1, 1, 1,
0.9804216, -0.7125303, 2.437548, 1, 1, 1, 1, 1,
0.98379, -0.2872568, 2.452343, 1, 1, 1, 1, 1,
0.9856315, 1.36388, 2.380075, 0, 0, 1, 1, 1,
0.9860386, -0.3909887, 1.35841, 1, 0, 0, 1, 1,
0.9868098, 0.04657212, 0.07648243, 1, 0, 0, 1, 1,
0.9912112, 0.8299946, 1.043869, 1, 0, 0, 1, 1,
0.991361, -0.4060177, 1.519969, 1, 0, 0, 1, 1,
0.9964178, 0.9574717, 0.9636982, 1, 0, 0, 1, 1,
1.005552, -0.2262984, 1.491204, 0, 0, 0, 1, 1,
1.006932, 1.658199, -0.4293696, 0, 0, 0, 1, 1,
1.013466, -0.7731958, 1.266709, 0, 0, 0, 1, 1,
1.01771, 0.2375294, 0.4142388, 0, 0, 0, 1, 1,
1.017975, -1.317298, 3.296819, 0, 0, 0, 1, 1,
1.038734, 0.7751598, 1.507225, 0, 0, 0, 1, 1,
1.039865, -0.2464121, 2.896056, 0, 0, 0, 1, 1,
1.046661, -1.635428, 3.236989, 1, 1, 1, 1, 1,
1.04948, 0.3473582, -0.2704495, 1, 1, 1, 1, 1,
1.050349, -2.360913, 3.32648, 1, 1, 1, 1, 1,
1.051847, -1.719579, 2.855588, 1, 1, 1, 1, 1,
1.053585, -0.3364353, 2.437351, 1, 1, 1, 1, 1,
1.05657, -0.5877149, 2.168526, 1, 1, 1, 1, 1,
1.06008, -0.2671623, 1.43935, 1, 1, 1, 1, 1,
1.067336, -1.984233, 5.435662, 1, 1, 1, 1, 1,
1.07172, -0.6759235, 3.544862, 1, 1, 1, 1, 1,
1.076136, -0.6436226, 4.090308, 1, 1, 1, 1, 1,
1.076372, -1.469, 3.104259, 1, 1, 1, 1, 1,
1.090601, -0.3330709, 1.285228, 1, 1, 1, 1, 1,
1.091805, 1.494231, 0.4550629, 1, 1, 1, 1, 1,
1.093496, -0.7554243, 0.9781393, 1, 1, 1, 1, 1,
1.097556, -0.1915961, 0.5152357, 1, 1, 1, 1, 1,
1.104876, -0.2624476, 2.578369, 0, 0, 1, 1, 1,
1.107725, 0.1824581, 1.284056, 1, 0, 0, 1, 1,
1.111195, 0.7633116, 0.3940153, 1, 0, 0, 1, 1,
1.11889, -0.2326526, 2.302439, 1, 0, 0, 1, 1,
1.124075, 0.3861573, 0.8151554, 1, 0, 0, 1, 1,
1.128335, 0.9863773, 0.2826238, 1, 0, 0, 1, 1,
1.131665, -0.656284, 0.5834197, 0, 0, 0, 1, 1,
1.134854, 0.1224921, 0.09492663, 0, 0, 0, 1, 1,
1.137626, -2.858273, 3.148831, 0, 0, 0, 1, 1,
1.14386, 0.04365024, 1.662361, 0, 0, 0, 1, 1,
1.15546, 0.9960221, 0.253581, 0, 0, 0, 1, 1,
1.161893, 1.142443, 2.197506, 0, 0, 0, 1, 1,
1.165863, -0.9078522, 4.877131, 0, 0, 0, 1, 1,
1.16588, 1.679523, 1.989989, 1, 1, 1, 1, 1,
1.166678, -0.1909385, 0.1106597, 1, 1, 1, 1, 1,
1.167225, -1.19958, 2.969477, 1, 1, 1, 1, 1,
1.167878, -0.3092582, 3.636529, 1, 1, 1, 1, 1,
1.168389, 1.08691, 2.269115, 1, 1, 1, 1, 1,
1.178715, 1.59304, 1.910188, 1, 1, 1, 1, 1,
1.179681, 1.723663, -0.1388546, 1, 1, 1, 1, 1,
1.188268, -0.3818949, 0.8420045, 1, 1, 1, 1, 1,
1.190234, 2.6424, 0.6661453, 1, 1, 1, 1, 1,
1.204462, 1.466224, 0.07387669, 1, 1, 1, 1, 1,
1.216674, -0.9140639, 2.657923, 1, 1, 1, 1, 1,
1.21689, -0.07218327, 2.829354, 1, 1, 1, 1, 1,
1.217123, -0.5495646, 2.90311, 1, 1, 1, 1, 1,
1.22902, -1.111024, 0.8325837, 1, 1, 1, 1, 1,
1.230162, -2.666004, 0.8519254, 1, 1, 1, 1, 1,
1.233365, -1.075783, 2.409741, 0, 0, 1, 1, 1,
1.237379, -1.144591, 2.654134, 1, 0, 0, 1, 1,
1.243045, 1.085103, -1.406781, 1, 0, 0, 1, 1,
1.248945, 0.08099562, -0.1076296, 1, 0, 0, 1, 1,
1.258236, -0.3959805, 3.39342, 1, 0, 0, 1, 1,
1.259083, -1.115169, 2.919809, 1, 0, 0, 1, 1,
1.261435, -0.5907085, 0.9901536, 0, 0, 0, 1, 1,
1.276056, -0.9973403, 1.889535, 0, 0, 0, 1, 1,
1.280837, 0.001876757, 0.1184872, 0, 0, 0, 1, 1,
1.281245, 0.2251632, 1.012955, 0, 0, 0, 1, 1,
1.294674, 1.295066, 2.297427, 0, 0, 0, 1, 1,
1.299175, -0.324766, 2.257658, 0, 0, 0, 1, 1,
1.307355, -0.8022135, 1.928949, 0, 0, 0, 1, 1,
1.314675, 0.6590489, 0.507828, 1, 1, 1, 1, 1,
1.317632, -0.08066734, 2.750644, 1, 1, 1, 1, 1,
1.339821, -1.534344, 4.824967, 1, 1, 1, 1, 1,
1.36664, -0.7842985, 4.701321, 1, 1, 1, 1, 1,
1.381294, 1.949296, 2.12377, 1, 1, 1, 1, 1,
1.383614, 0.6100657, 2.181783, 1, 1, 1, 1, 1,
1.388055, -0.7117763, 1.018546, 1, 1, 1, 1, 1,
1.406588, 0.1122997, -0.779769, 1, 1, 1, 1, 1,
1.408087, -1.661313, 1.697471, 1, 1, 1, 1, 1,
1.409945, 0.3723755, 2.145619, 1, 1, 1, 1, 1,
1.414813, 0.1069937, 0.6969363, 1, 1, 1, 1, 1,
1.419259, -1.044246, 0.6062391, 1, 1, 1, 1, 1,
1.439898, 1.253507, -1.752602, 1, 1, 1, 1, 1,
1.444912, 0.5403969, -0.102399, 1, 1, 1, 1, 1,
1.447146, -0.5577546, 1.65168, 1, 1, 1, 1, 1,
1.448233, -0.7737504, 2.674769, 0, 0, 1, 1, 1,
1.451523, 1.408834, 0.7614269, 1, 0, 0, 1, 1,
1.458433, 1.847749, -0.8963797, 1, 0, 0, 1, 1,
1.467461, 1.273252, -1.250091, 1, 0, 0, 1, 1,
1.470723, 1.595978, 0.4193107, 1, 0, 0, 1, 1,
1.482323, 0.313436, 1.769766, 1, 0, 0, 1, 1,
1.494073, 0.5747663, 1.012058, 0, 0, 0, 1, 1,
1.501388, 1.101732, 1.56417, 0, 0, 0, 1, 1,
1.505496, 0.9440485, 1.385, 0, 0, 0, 1, 1,
1.50774, 1.909278, 1.42929, 0, 0, 0, 1, 1,
1.508374, 0.4354997, 1.112089, 0, 0, 0, 1, 1,
1.515244, -1.327551, 3.454331, 0, 0, 0, 1, 1,
1.520105, 1.122548, 0.8264837, 0, 0, 0, 1, 1,
1.527033, -0.3643897, 3.159871, 1, 1, 1, 1, 1,
1.53659, 1.163802, 0.2446404, 1, 1, 1, 1, 1,
1.537472, -1.166784, 3.555581, 1, 1, 1, 1, 1,
1.552793, -0.2800193, 1.670633, 1, 1, 1, 1, 1,
1.557203, -0.3493838, 2.438981, 1, 1, 1, 1, 1,
1.565939, -1.943724, 2.049989, 1, 1, 1, 1, 1,
1.587662, 1.273012, 1.422667, 1, 1, 1, 1, 1,
1.597526, -0.9657242, -0.08844536, 1, 1, 1, 1, 1,
1.599214, 0.1840033, 1.571487, 1, 1, 1, 1, 1,
1.601162, -0.9890938, 2.622763, 1, 1, 1, 1, 1,
1.604766, -0.3159942, 1.948875, 1, 1, 1, 1, 1,
1.616402, 0.008783977, 2.345986, 1, 1, 1, 1, 1,
1.618415, -1.221048, 2.484397, 1, 1, 1, 1, 1,
1.623356, 0.2498402, -0.9509643, 1, 1, 1, 1, 1,
1.62465, -0.6220163, 1.013408, 1, 1, 1, 1, 1,
1.633516, 0.458458, 1.266688, 0, 0, 1, 1, 1,
1.637312, -1.357852, 2.536217, 1, 0, 0, 1, 1,
1.641926, 1.451607, 1.207548, 1, 0, 0, 1, 1,
1.646818, 0.1255412, 0.7865345, 1, 0, 0, 1, 1,
1.651302, -1.482589, 1.490816, 1, 0, 0, 1, 1,
1.654248, -0.654169, 1.496681, 1, 0, 0, 1, 1,
1.690148, -1.390655, 1.58827, 0, 0, 0, 1, 1,
1.69535, -0.8664845, 2.485284, 0, 0, 0, 1, 1,
1.712043, -0.2968722, 1.726379, 0, 0, 0, 1, 1,
1.732244, 1.832367, -0.6710031, 0, 0, 0, 1, 1,
1.738139, 0.585981, 1.47104, 0, 0, 0, 1, 1,
1.73986, -0.9848835, 2.004593, 0, 0, 0, 1, 1,
1.756738, -0.9696554, 2.113071, 0, 0, 0, 1, 1,
1.760424, -0.1525335, 0.6429796, 1, 1, 1, 1, 1,
1.763398, 1.446085, 0.4494353, 1, 1, 1, 1, 1,
1.768782, -0.5337788, -0.621568, 1, 1, 1, 1, 1,
1.796591, 0.4446773, 0.0976152, 1, 1, 1, 1, 1,
1.802572, 0.2580423, 0.5071161, 1, 1, 1, 1, 1,
1.80916, -0.3549944, 3.542068, 1, 1, 1, 1, 1,
1.813741, 1.289473, 0.1952419, 1, 1, 1, 1, 1,
1.863255, 0.587295, 0.7292751, 1, 1, 1, 1, 1,
1.866903, 0.2723235, 1.872705, 1, 1, 1, 1, 1,
1.900795, -1.645272, 2.173051, 1, 1, 1, 1, 1,
1.913496, 0.3757482, 2.195647, 1, 1, 1, 1, 1,
1.920422, -0.4085723, 3.827803, 1, 1, 1, 1, 1,
1.927244, 0.7772089, 2.547635, 1, 1, 1, 1, 1,
1.949398, -0.01685868, 2.961016, 1, 1, 1, 1, 1,
1.969239, 0.3037249, 1.047199, 1, 1, 1, 1, 1,
1.990912, 0.6120417, 1.733315, 0, 0, 1, 1, 1,
1.998746, 1.469944, 1.410227, 1, 0, 0, 1, 1,
2.007851, 0.1217661, 1.212363, 1, 0, 0, 1, 1,
2.026751, 0.9100382, 0.2211173, 1, 0, 0, 1, 1,
2.034543, 1.13202, 0.7006417, 1, 0, 0, 1, 1,
2.046542, -1.127799, 2.303682, 1, 0, 0, 1, 1,
2.05099, 2.497977, -0.2209019, 0, 0, 0, 1, 1,
2.085445, -1.109822, 0.3737154, 0, 0, 0, 1, 1,
2.119202, -0.4584742, 2.180681, 0, 0, 0, 1, 1,
2.131194, -1.163186, 2.23647, 0, 0, 0, 1, 1,
2.177274, 0.832377, 2.954192, 0, 0, 0, 1, 1,
2.197676, -2.855227, 4.216901, 0, 0, 0, 1, 1,
2.272182, 0.6754503, 2.133604, 0, 0, 0, 1, 1,
2.302589, -0.1436285, 1.456094, 1, 1, 1, 1, 1,
2.338695, 1.687984, 1.523662, 1, 1, 1, 1, 1,
2.395859, 0.3907502, 0.4744879, 1, 1, 1, 1, 1,
2.466183, 0.3302548, 3.389794, 1, 1, 1, 1, 1,
2.664417, -0.3107882, 0.7672121, 1, 1, 1, 1, 1,
2.990185, -0.1731102, 1.208827, 1, 1, 1, 1, 1,
3.290746, 1.983559, 1.271577, 1, 1, 1, 1, 1
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
var radius = 9.726199;
var distance = 34.16286;
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
mvMatrix.translate( -0.02320266, -0.04323483, -0.08162451 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.16286);
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
