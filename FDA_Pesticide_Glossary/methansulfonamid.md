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
-2.964281, -1.453993, -0.9560665, 1, 0, 0, 1,
-2.914485, 0.6092992, -0.7275516, 1, 0.007843138, 0, 1,
-2.728364, 0.7212679, -1.049817, 1, 0.01176471, 0, 1,
-2.658244, -0.1431893, -1.322284, 1, 0.01960784, 0, 1,
-2.55253, -0.2462555, -1.95325, 1, 0.02352941, 0, 1,
-2.509037, 2.27665, -1.43396, 1, 0.03137255, 0, 1,
-2.410697, 1.231569, -0.4726143, 1, 0.03529412, 0, 1,
-2.397906, -0.3178464, -3.305233, 1, 0.04313726, 0, 1,
-2.390716, -0.04620776, -0.3668511, 1, 0.04705882, 0, 1,
-2.362993, 0.7031251, -1.327212, 1, 0.05490196, 0, 1,
-2.29842, 0.01957768, -1.864503, 1, 0.05882353, 0, 1,
-2.279103, -0.7803348, -0.4733487, 1, 0.06666667, 0, 1,
-2.196553, 0.7266546, -1.700317, 1, 0.07058824, 0, 1,
-2.159359, -0.3358853, -1.274586, 1, 0.07843138, 0, 1,
-2.145208, 1.038786, -0.5856648, 1, 0.08235294, 0, 1,
-2.138063, 0.09378995, -0.5160756, 1, 0.09019608, 0, 1,
-2.127731, -0.1749935, 0.5898725, 1, 0.09411765, 0, 1,
-2.028524, 0.8973971, -2.19874, 1, 0.1019608, 0, 1,
-1.992287, -1.12235, -2.556412, 1, 0.1098039, 0, 1,
-1.976476, -1.578281, -2.079943, 1, 0.1137255, 0, 1,
-1.965186, 0.1614695, -0.9296302, 1, 0.1215686, 0, 1,
-1.958932, 2.232673, -0.8364658, 1, 0.1254902, 0, 1,
-1.952867, 0.994405, 1.299835, 1, 0.1333333, 0, 1,
-1.952736, -0.5571169, -0.5650534, 1, 0.1372549, 0, 1,
-1.857245, -1.591271, -2.862594, 1, 0.145098, 0, 1,
-1.856264, -0.321612, -1.842314, 1, 0.1490196, 0, 1,
-1.856034, -0.1207006, -1.026076, 1, 0.1568628, 0, 1,
-1.846181, 0.7149855, -0.7934232, 1, 0.1607843, 0, 1,
-1.84423, 1.315573, -1.067188, 1, 0.1686275, 0, 1,
-1.841065, -0.7195163, -0.7081037, 1, 0.172549, 0, 1,
-1.838652, -0.8253595, -2.285274, 1, 0.1803922, 0, 1,
-1.83543, 0.07819425, -1.496025, 1, 0.1843137, 0, 1,
-1.829748, -2.026197, -3.142094, 1, 0.1921569, 0, 1,
-1.77844, 1.054518, -0.769132, 1, 0.1960784, 0, 1,
-1.741354, 0.5690195, -1.057677, 1, 0.2039216, 0, 1,
-1.733697, -1.513194, -1.733504, 1, 0.2117647, 0, 1,
-1.732964, 0.6375744, -0.7376164, 1, 0.2156863, 0, 1,
-1.72932, 0.3619094, -1.90609, 1, 0.2235294, 0, 1,
-1.714734, 0.06370248, -1.946617, 1, 0.227451, 0, 1,
-1.700673, 0.8144602, -1.387678, 1, 0.2352941, 0, 1,
-1.69655, -1.719846, -1.402236, 1, 0.2392157, 0, 1,
-1.677403, -0.3771101, -0.7825102, 1, 0.2470588, 0, 1,
-1.676449, 1.266219, -1.256905, 1, 0.2509804, 0, 1,
-1.663259, -0.5273669, -2.270905, 1, 0.2588235, 0, 1,
-1.639103, -0.6994846, -2.099832, 1, 0.2627451, 0, 1,
-1.639003, -1.446805, -1.917183, 1, 0.2705882, 0, 1,
-1.63877, 0.8770048, -2.754227, 1, 0.2745098, 0, 1,
-1.637134, -0.1585263, -1.918236, 1, 0.282353, 0, 1,
-1.620616, 1.086051, -0.5693113, 1, 0.2862745, 0, 1,
-1.610456, 0.172975, -1.771904, 1, 0.2941177, 0, 1,
-1.607692, -1.344926, -3.099946, 1, 0.3019608, 0, 1,
-1.604424, -1.942523, -1.927472, 1, 0.3058824, 0, 1,
-1.586183, -2.031337, -1.963304, 1, 0.3137255, 0, 1,
-1.581831, 1.137097, -1.018067, 1, 0.3176471, 0, 1,
-1.579545, 1.183476, -0.7841136, 1, 0.3254902, 0, 1,
-1.56318, -0.4174218, -2.568758, 1, 0.3294118, 0, 1,
-1.556694, -1.158112, -0.3415098, 1, 0.3372549, 0, 1,
-1.54989, -0.8809763, -1.428685, 1, 0.3411765, 0, 1,
-1.549445, 0.8872089, -0.7388278, 1, 0.3490196, 0, 1,
-1.531602, -0.3903559, -2.031284, 1, 0.3529412, 0, 1,
-1.528837, -0.2613424, -2.831889, 1, 0.3607843, 0, 1,
-1.511079, 0.8306026, 0.1340011, 1, 0.3647059, 0, 1,
-1.507679, 1.2214, -1.308613, 1, 0.372549, 0, 1,
-1.503879, 1.028093, -0.2698893, 1, 0.3764706, 0, 1,
-1.496322, 2.126386, 0.04334557, 1, 0.3843137, 0, 1,
-1.482527, -0.05621824, -2.896304, 1, 0.3882353, 0, 1,
-1.479937, 0.8124631, 0.6651387, 1, 0.3960784, 0, 1,
-1.47422, 0.7150964, -1.990628, 1, 0.4039216, 0, 1,
-1.453617, -0.6474103, -1.649315, 1, 0.4078431, 0, 1,
-1.451368, 1.431284, 0.6964418, 1, 0.4156863, 0, 1,
-1.449511, 0.2625943, -4.183707, 1, 0.4196078, 0, 1,
-1.445145, 0.9348787, -0.03428064, 1, 0.427451, 0, 1,
-1.444762, 0.6070866, -2.176898, 1, 0.4313726, 0, 1,
-1.44409, 3.489374, 1.261454, 1, 0.4392157, 0, 1,
-1.434344, -0.05647043, -2.60525, 1, 0.4431373, 0, 1,
-1.432442, -0.1261203, -0.8712193, 1, 0.4509804, 0, 1,
-1.419848, 0.4144926, -0.648714, 1, 0.454902, 0, 1,
-1.417436, 1.403196, 0.1038562, 1, 0.4627451, 0, 1,
-1.416934, 0.6458181, 0.2111374, 1, 0.4666667, 0, 1,
-1.403569, 1.13474, 0.358954, 1, 0.4745098, 0, 1,
-1.401132, 0.4969051, -1.305123, 1, 0.4784314, 0, 1,
-1.399064, -2.575406, -3.022281, 1, 0.4862745, 0, 1,
-1.388308, -1.366209, -3.115478, 1, 0.4901961, 0, 1,
-1.366952, 0.3594645, -0.9092987, 1, 0.4980392, 0, 1,
-1.365299, -1.790043, -1.374651, 1, 0.5058824, 0, 1,
-1.343373, -0.1610122, -1.039928, 1, 0.509804, 0, 1,
-1.342903, -1.725689, -1.4568, 1, 0.5176471, 0, 1,
-1.340078, -2.532749, -2.483481, 1, 0.5215687, 0, 1,
-1.335383, 0.1937006, -2.734923, 1, 0.5294118, 0, 1,
-1.332785, -0.08525667, -1.192842, 1, 0.5333334, 0, 1,
-1.332374, -0.298263, 1.714556, 1, 0.5411765, 0, 1,
-1.331657, 0.5856884, -3.757766, 1, 0.5450981, 0, 1,
-1.330832, 1.186855, -0.7716001, 1, 0.5529412, 0, 1,
-1.326975, 0.0448811, -1.869782, 1, 0.5568628, 0, 1,
-1.326589, 0.340468, -0.6745248, 1, 0.5647059, 0, 1,
-1.326236, -0.6703511, -1.972021, 1, 0.5686275, 0, 1,
-1.29994, -0.04674148, -1.683247, 1, 0.5764706, 0, 1,
-1.29966, -0.7114796, -2.720021, 1, 0.5803922, 0, 1,
-1.297886, 1.475152, -2.15048, 1, 0.5882353, 0, 1,
-1.297874, 0.1724933, -1.415909, 1, 0.5921569, 0, 1,
-1.296649, -1.039705, -2.640971, 1, 0.6, 0, 1,
-1.294003, -0.373913, -2.750636, 1, 0.6078432, 0, 1,
-1.289774, 0.05616728, -1.036598, 1, 0.6117647, 0, 1,
-1.286429, -0.1481749, -1.406673, 1, 0.6196079, 0, 1,
-1.28194, -0.6755342, -0.3326029, 1, 0.6235294, 0, 1,
-1.27707, 0.3109433, -1.109704, 1, 0.6313726, 0, 1,
-1.27146, 0.5770738, -1.572786, 1, 0.6352941, 0, 1,
-1.262481, 0.2208132, -2.000577, 1, 0.6431373, 0, 1,
-1.243129, 1.140764, -0.3949108, 1, 0.6470588, 0, 1,
-1.238691, 0.7690009, 0.8146515, 1, 0.654902, 0, 1,
-1.235549, -1.429783, -1.413604, 1, 0.6588235, 0, 1,
-1.229177, -1.324212, -2.9821, 1, 0.6666667, 0, 1,
-1.219465, 0.7996858, -1.686334, 1, 0.6705883, 0, 1,
-1.204006, 0.769959, -1.167125, 1, 0.6784314, 0, 1,
-1.199113, -0.4129596, -2.545359, 1, 0.682353, 0, 1,
-1.196991, 0.4156155, -2.480346, 1, 0.6901961, 0, 1,
-1.190564, 0.4131243, -1.297887, 1, 0.6941177, 0, 1,
-1.180305, -1.271411, -3.238877, 1, 0.7019608, 0, 1,
-1.173779, 0.03717941, -1.184886, 1, 0.7098039, 0, 1,
-1.17132, 0.4012706, -1.61113, 1, 0.7137255, 0, 1,
-1.164704, 0.7093176, -1.794401, 1, 0.7215686, 0, 1,
-1.164599, -0.592611, -1.892587, 1, 0.7254902, 0, 1,
-1.158244, -1.170116, -2.251529, 1, 0.7333333, 0, 1,
-1.156049, 0.7530041, -0.9593995, 1, 0.7372549, 0, 1,
-1.152033, -0.3710473, -1.028716, 1, 0.7450981, 0, 1,
-1.150438, 2.066909, -0.9173384, 1, 0.7490196, 0, 1,
-1.144636, 0.3747967, -0.2406805, 1, 0.7568628, 0, 1,
-1.143381, 1.485878, -1.39035, 1, 0.7607843, 0, 1,
-1.142875, -0.5455636, -2.479696, 1, 0.7686275, 0, 1,
-1.140638, 0.6295705, -0.588692, 1, 0.772549, 0, 1,
-1.139801, -1.109144, -1.413147, 1, 0.7803922, 0, 1,
-1.134365, -1.246456, -3.117895, 1, 0.7843137, 0, 1,
-1.12862, 1.262408, -1.379723, 1, 0.7921569, 0, 1,
-1.127727, -0.3397675, -2.489173, 1, 0.7960784, 0, 1,
-1.124391, 0.4900138, -1.225164, 1, 0.8039216, 0, 1,
-1.121807, 1.078181, -1.420365, 1, 0.8117647, 0, 1,
-1.114711, 0.1428686, -2.779748, 1, 0.8156863, 0, 1,
-1.112376, 0.696557, -0.03010256, 1, 0.8235294, 0, 1,
-1.08414, 0.4748582, -0.5647116, 1, 0.827451, 0, 1,
-1.084055, 2.296789, 0.5326464, 1, 0.8352941, 0, 1,
-1.074391, -1.523861, -4.349351, 1, 0.8392157, 0, 1,
-1.073194, -0.9068473, -3.384579, 1, 0.8470588, 0, 1,
-1.071964, -0.8883179, -3.0947, 1, 0.8509804, 0, 1,
-1.064024, -1.097342, -4.28151, 1, 0.8588235, 0, 1,
-1.058756, 1.040107, 1.004877, 1, 0.8627451, 0, 1,
-1.053358, -1.81913, -1.686024, 1, 0.8705882, 0, 1,
-1.052815, -0.03472604, -2.652965, 1, 0.8745098, 0, 1,
-1.044825, 0.6520122, -2.929317, 1, 0.8823529, 0, 1,
-1.043901, 2.028361, -0.6372601, 1, 0.8862745, 0, 1,
-1.038747, -0.5262285, -3.355293, 1, 0.8941177, 0, 1,
-1.038095, 0.05697489, -0.4022247, 1, 0.8980392, 0, 1,
-1.037715, -1.328736, -2.58571, 1, 0.9058824, 0, 1,
-1.035127, -0.1834646, -2.18612, 1, 0.9137255, 0, 1,
-1.033731, -0.2530166, -1.489455, 1, 0.9176471, 0, 1,
-1.032881, 0.7042631, -1.45431, 1, 0.9254902, 0, 1,
-1.015668, 0.5558945, -2.183199, 1, 0.9294118, 0, 1,
-1.012408, 1.266609, -2.010767, 1, 0.9372549, 0, 1,
-1.011177, 0.1581003, -2.029549, 1, 0.9411765, 0, 1,
-1.008031, 1.492157, -1.612603, 1, 0.9490196, 0, 1,
-1.006268, 0.9179986, 0.1362352, 1, 0.9529412, 0, 1,
-1.001867, -0.9551679, -2.736087, 1, 0.9607843, 0, 1,
-1.000803, -0.2239487, -1.03484, 1, 0.9647059, 0, 1,
-0.999966, 1.884154, 0.6076871, 1, 0.972549, 0, 1,
-0.9989474, -0.740596, -2.119052, 1, 0.9764706, 0, 1,
-0.997282, 1.061341, -1.564612, 1, 0.9843137, 0, 1,
-0.9935341, -0.3408788, -1.547189, 1, 0.9882353, 0, 1,
-0.9793782, 0.6369195, -2.009531, 1, 0.9960784, 0, 1,
-0.9769024, 2.642262, -1.013991, 0.9960784, 1, 0, 1,
-0.9698179, -0.3559165, -1.475197, 0.9921569, 1, 0, 1,
-0.9676197, 0.4316839, -1.690112, 0.9843137, 1, 0, 1,
-0.965154, 1.157444, -0.03823437, 0.9803922, 1, 0, 1,
-0.958332, -0.6027539, -1.341722, 0.972549, 1, 0, 1,
-0.9506134, 0.5413292, 0.7103721, 0.9686275, 1, 0, 1,
-0.9439398, -0.5086151, -1.485961, 0.9607843, 1, 0, 1,
-0.9416028, 0.1821114, 0.8260055, 0.9568627, 1, 0, 1,
-0.9411244, -0.124938, -0.8341249, 0.9490196, 1, 0, 1,
-0.9386284, -0.8911017, -2.480335, 0.945098, 1, 0, 1,
-0.9372509, 0.5888855, 2.28793, 0.9372549, 1, 0, 1,
-0.9339511, 0.9269916, -0.01767556, 0.9333333, 1, 0, 1,
-0.9286467, 0.5607211, -0.695529, 0.9254902, 1, 0, 1,
-0.9231822, -1.316368, -1.380493, 0.9215686, 1, 0, 1,
-0.9117024, -0.3379945, -1.387563, 0.9137255, 1, 0, 1,
-0.9109263, 0.6885375, -1.413793, 0.9098039, 1, 0, 1,
-0.908884, 0.768773, -0.2817939, 0.9019608, 1, 0, 1,
-0.9051524, -2.120995, -4.075654, 0.8941177, 1, 0, 1,
-0.9043581, 0.1989266, -2.720019, 0.8901961, 1, 0, 1,
-0.9019911, 0.1207227, -3.079445, 0.8823529, 1, 0, 1,
-0.898002, -0.8688569, -3.325426, 0.8784314, 1, 0, 1,
-0.8959553, 0.01224496, -2.872129, 0.8705882, 1, 0, 1,
-0.8949139, -0.6163008, -2.156769, 0.8666667, 1, 0, 1,
-0.883014, 0.2743213, -0.6699752, 0.8588235, 1, 0, 1,
-0.8774825, 0.3501215, -2.715096, 0.854902, 1, 0, 1,
-0.8766736, -0.05172562, -1.350435, 0.8470588, 1, 0, 1,
-0.876558, -1.131209, -3.208985, 0.8431373, 1, 0, 1,
-0.8693637, 0.04935824, -2.832505, 0.8352941, 1, 0, 1,
-0.8671518, 0.2088466, -3.006026, 0.8313726, 1, 0, 1,
-0.8639752, -0.269833, -2.388165, 0.8235294, 1, 0, 1,
-0.8586544, -0.3066786, -0.6503451, 0.8196079, 1, 0, 1,
-0.8585692, 0.3966516, -0.5922241, 0.8117647, 1, 0, 1,
-0.8504513, -1.070199, -1.729143, 0.8078431, 1, 0, 1,
-0.8491271, -0.3412064, -2.057308, 0.8, 1, 0, 1,
-0.8488238, -0.7967102, -0.292458, 0.7921569, 1, 0, 1,
-0.8483657, 1.209028, 0.9150805, 0.7882353, 1, 0, 1,
-0.8404905, -0.4263202, -1.710788, 0.7803922, 1, 0, 1,
-0.8358847, 1.552791, 0.4928635, 0.7764706, 1, 0, 1,
-0.834857, 0.3472687, -1.124297, 0.7686275, 1, 0, 1,
-0.8313334, 1.711857, -1.570321, 0.7647059, 1, 0, 1,
-0.8109734, 0.3516411, -0.7425976, 0.7568628, 1, 0, 1,
-0.8106588, 1.028798, -0.6659338, 0.7529412, 1, 0, 1,
-0.7946357, -0.154594, -2.547406, 0.7450981, 1, 0, 1,
-0.7913727, 1.02034, -0.246802, 0.7411765, 1, 0, 1,
-0.7893556, 1.035055, -1.86732, 0.7333333, 1, 0, 1,
-0.787747, 0.2282179, -0.5314387, 0.7294118, 1, 0, 1,
-0.7843609, 1.52277, -0.3436846, 0.7215686, 1, 0, 1,
-0.7842144, -1.017694, -1.282532, 0.7176471, 1, 0, 1,
-0.7792916, 0.6895521, -1.675959, 0.7098039, 1, 0, 1,
-0.7774921, -1.35648, -4.83205, 0.7058824, 1, 0, 1,
-0.77382, 0.3512999, -0.9885021, 0.6980392, 1, 0, 1,
-0.7731559, 1.460468, -0.982161, 0.6901961, 1, 0, 1,
-0.7603901, -1.013713, -1.421942, 0.6862745, 1, 0, 1,
-0.7529755, -0.8108892, -2.519282, 0.6784314, 1, 0, 1,
-0.7529333, -0.1247853, -1.835438, 0.6745098, 1, 0, 1,
-0.7505273, 0.6518942, 0.7932262, 0.6666667, 1, 0, 1,
-0.7416307, 1.670717, 0.1977004, 0.6627451, 1, 0, 1,
-0.7395891, -2.32066, -5.734169, 0.654902, 1, 0, 1,
-0.7381761, -0.9927712, -1.449884, 0.6509804, 1, 0, 1,
-0.7341108, -0.750284, -1.855208, 0.6431373, 1, 0, 1,
-0.729363, -0.9367253, -2.723586, 0.6392157, 1, 0, 1,
-0.7288054, 0.3921167, -1.131815, 0.6313726, 1, 0, 1,
-0.7284147, -1.622828, -3.888449, 0.627451, 1, 0, 1,
-0.7233542, 0.04932399, -1.092483, 0.6196079, 1, 0, 1,
-0.7176224, 1.920333, 0.2461521, 0.6156863, 1, 0, 1,
-0.7128211, -0.3029259, -2.896901, 0.6078432, 1, 0, 1,
-0.7119963, -0.1798259, -0.8081074, 0.6039216, 1, 0, 1,
-0.7112521, -0.9405649, -4.644284, 0.5960785, 1, 0, 1,
-0.70623, -0.4258454, -2.978662, 0.5882353, 1, 0, 1,
-0.7024186, 0.8541508, 0.7653473, 0.5843138, 1, 0, 1,
-0.7018512, -0.0643885, -3.140297, 0.5764706, 1, 0, 1,
-0.6982515, 0.5230677, -0.8333085, 0.572549, 1, 0, 1,
-0.694691, 1.511027, -0.3869266, 0.5647059, 1, 0, 1,
-0.6917458, -1.088222, -1.823585, 0.5607843, 1, 0, 1,
-0.6862279, 0.7846786, -0.7332709, 0.5529412, 1, 0, 1,
-0.6808724, -0.2147971, -3.44612, 0.5490196, 1, 0, 1,
-0.677409, -0.02141852, -0.3431787, 0.5411765, 1, 0, 1,
-0.6712292, -0.3735124, -2.5651, 0.5372549, 1, 0, 1,
-0.6669894, -1.596177, -2.093743, 0.5294118, 1, 0, 1,
-0.6613438, -0.09992956, -1.820344, 0.5254902, 1, 0, 1,
-0.6599275, 0.7587835, 0.4061437, 0.5176471, 1, 0, 1,
-0.6574517, -1.967575, -3.723791, 0.5137255, 1, 0, 1,
-0.6571059, -0.7894609, -1.820488, 0.5058824, 1, 0, 1,
-0.6555173, -0.1966311, -3.058287, 0.5019608, 1, 0, 1,
-0.6511292, 0.002939098, 0.4485117, 0.4941176, 1, 0, 1,
-0.6502262, -1.524373, -2.646931, 0.4862745, 1, 0, 1,
-0.6493607, 1.108115, -1.294105, 0.4823529, 1, 0, 1,
-0.6475699, 0.334758, -0.4640753, 0.4745098, 1, 0, 1,
-0.6451751, -1.366819, -3.174705, 0.4705882, 1, 0, 1,
-0.6438646, 1.090156, 0.539392, 0.4627451, 1, 0, 1,
-0.6412045, 0.8001772, -0.9011843, 0.4588235, 1, 0, 1,
-0.6410208, -0.4984965, -0.4989393, 0.4509804, 1, 0, 1,
-0.6408842, -0.2914274, -2.039755, 0.4470588, 1, 0, 1,
-0.6352706, -0.06472519, -1.547398, 0.4392157, 1, 0, 1,
-0.6332546, 0.1288926, -2.73688, 0.4352941, 1, 0, 1,
-0.6206701, -0.4895638, -2.18353, 0.427451, 1, 0, 1,
-0.6204365, -1.459948, -2.732409, 0.4235294, 1, 0, 1,
-0.6197919, -0.1247995, 1.151175, 0.4156863, 1, 0, 1,
-0.6173674, -0.4600504, -2.849473, 0.4117647, 1, 0, 1,
-0.6098464, 0.2770856, -1.694447, 0.4039216, 1, 0, 1,
-0.6096836, 0.286304, -1.178212, 0.3960784, 1, 0, 1,
-0.606358, -1.10558, -3.973396, 0.3921569, 1, 0, 1,
-0.5917236, -0.2771265, -3.342189, 0.3843137, 1, 0, 1,
-0.5903764, -0.3485318, -0.8940396, 0.3803922, 1, 0, 1,
-0.5868638, -0.9223139, -2.791712, 0.372549, 1, 0, 1,
-0.5860863, -1.785656, -2.67724, 0.3686275, 1, 0, 1,
-0.5845392, 0.4409499, -0.4763857, 0.3607843, 1, 0, 1,
-0.5758848, -0.5795068, -3.940706, 0.3568628, 1, 0, 1,
-0.5738837, -2.666478, -1.462276, 0.3490196, 1, 0, 1,
-0.5736832, -1.03836, -1.783043, 0.345098, 1, 0, 1,
-0.5698656, 2.509248, -0.5683582, 0.3372549, 1, 0, 1,
-0.5643034, -0.4865079, -0.4675719, 0.3333333, 1, 0, 1,
-0.5603659, -0.01763092, -1.720225, 0.3254902, 1, 0, 1,
-0.5584242, -0.8771867, -3.260757, 0.3215686, 1, 0, 1,
-0.5580717, 0.01034784, -1.257031, 0.3137255, 1, 0, 1,
-0.5577261, -0.1959429, -3.288157, 0.3098039, 1, 0, 1,
-0.5576391, -0.4230711, -1.219139, 0.3019608, 1, 0, 1,
-0.5573546, 0.4053346, -0.135022, 0.2941177, 1, 0, 1,
-0.554354, -0.1848648, -1.484329, 0.2901961, 1, 0, 1,
-0.5490475, -1.535836, -1.988603, 0.282353, 1, 0, 1,
-0.548111, 0.3311878, 0.3167927, 0.2784314, 1, 0, 1,
-0.5469864, -0.1087288, -1.715441, 0.2705882, 1, 0, 1,
-0.5407298, -0.1582138, -2.454679, 0.2666667, 1, 0, 1,
-0.5354422, 1.885231, 0.67238, 0.2588235, 1, 0, 1,
-0.5232537, -0.003037555, -0.9405994, 0.254902, 1, 0, 1,
-0.5197459, -0.5427027, -2.243841, 0.2470588, 1, 0, 1,
-0.5174463, -2.228819, -2.623611, 0.2431373, 1, 0, 1,
-0.5173643, 0.3654288, -1.457498, 0.2352941, 1, 0, 1,
-0.5165726, -0.7836775, -2.996544, 0.2313726, 1, 0, 1,
-0.515236, 2.629978, 0.1894642, 0.2235294, 1, 0, 1,
-0.5150768, 0.009191207, -1.514207, 0.2196078, 1, 0, 1,
-0.513621, 0.9519801, -1.003834, 0.2117647, 1, 0, 1,
-0.5057838, 0.280017, -0.9106673, 0.2078431, 1, 0, 1,
-0.5033125, -0.7427178, -3.175879, 0.2, 1, 0, 1,
-0.4993534, -0.5012188, -3.428084, 0.1921569, 1, 0, 1,
-0.4974696, 0.7300284, -0.825855, 0.1882353, 1, 0, 1,
-0.494365, -1.24047, -1.129506, 0.1803922, 1, 0, 1,
-0.4938263, 0.2135574, 1.593477, 0.1764706, 1, 0, 1,
-0.4925115, 0.4954409, 0.55664, 0.1686275, 1, 0, 1,
-0.4832881, -1.157952, -2.253202, 0.1647059, 1, 0, 1,
-0.482439, 0.4893132, 0.02489368, 0.1568628, 1, 0, 1,
-0.4787348, -0.2168553, -2.944953, 0.1529412, 1, 0, 1,
-0.475945, -1.271192, -3.211186, 0.145098, 1, 0, 1,
-0.4723585, -1.781261, -4.462113, 0.1411765, 1, 0, 1,
-0.4720798, -0.2572421, -2.254623, 0.1333333, 1, 0, 1,
-0.4712529, 0.1822484, -0.9430099, 0.1294118, 1, 0, 1,
-0.46977, 0.2041967, -1.774866, 0.1215686, 1, 0, 1,
-0.4676884, 0.0006821679, 0.2198885, 0.1176471, 1, 0, 1,
-0.464974, -0.1804764, -0.5475954, 0.1098039, 1, 0, 1,
-0.4639978, 0.2772621, -0.8818917, 0.1058824, 1, 0, 1,
-0.4630225, 0.3049454, -2.150371, 0.09803922, 1, 0, 1,
-0.4620905, -0.322209, -1.932335, 0.09019608, 1, 0, 1,
-0.4583279, 0.3253955, 0.2000256, 0.08627451, 1, 0, 1,
-0.4560434, -0.7976303, -1.471653, 0.07843138, 1, 0, 1,
-0.4528174, -0.7455527, -1.090805, 0.07450981, 1, 0, 1,
-0.4488826, -1.008394, -3.426224, 0.06666667, 1, 0, 1,
-0.4460606, -0.8307487, -2.714058, 0.0627451, 1, 0, 1,
-0.443398, 1.519014, 0.151528, 0.05490196, 1, 0, 1,
-0.4384573, 0.9661643, 0.9882436, 0.05098039, 1, 0, 1,
-0.4357059, -1.021333, -2.048356, 0.04313726, 1, 0, 1,
-0.4344875, 0.3845989, -2.436717, 0.03921569, 1, 0, 1,
-0.4341739, -0.144472, -0.7202683, 0.03137255, 1, 0, 1,
-0.4339528, -0.6110361, -1.708238, 0.02745098, 1, 0, 1,
-0.4322448, -0.6143659, -3.257843, 0.01960784, 1, 0, 1,
-0.4281914, 0.9327791, -0.6719114, 0.01568628, 1, 0, 1,
-0.4267009, 0.4520535, -0.8227705, 0.007843138, 1, 0, 1,
-0.4224048, -0.09074356, -1.318766, 0.003921569, 1, 0, 1,
-0.4222792, -1.343823, -0.8397318, 0, 1, 0.003921569, 1,
-0.4193266, 0.4300921, -1.728126, 0, 1, 0.01176471, 1,
-0.4179195, -0.140984, -2.569679, 0, 1, 0.01568628, 1,
-0.4172499, 0.5199134, -1.592982, 0, 1, 0.02352941, 1,
-0.4168257, 0.6329811, 1.695379, 0, 1, 0.02745098, 1,
-0.4158984, -0.8400657, -0.8810782, 0, 1, 0.03529412, 1,
-0.406177, 0.3837219, -2.080016, 0, 1, 0.03921569, 1,
-0.4020213, -0.5799773, -3.153473, 0, 1, 0.04705882, 1,
-0.4010742, -1.028443, -2.049447, 0, 1, 0.05098039, 1,
-0.4008403, 1.713369, -0.8797787, 0, 1, 0.05882353, 1,
-0.4001193, -0.1685797, -2.049196, 0, 1, 0.0627451, 1,
-0.3978326, 1.143143, 0.9258903, 0, 1, 0.07058824, 1,
-0.3977231, 0.8295084, 0.4479124, 0, 1, 0.07450981, 1,
-0.3879387, 0.2125891, -0.5334927, 0, 1, 0.08235294, 1,
-0.3856003, -0.0987811, -1.058991, 0, 1, 0.08627451, 1,
-0.3753059, -0.9271015, -2.512817, 0, 1, 0.09411765, 1,
-0.374306, -0.9670709, -3.383166, 0, 1, 0.1019608, 1,
-0.3663551, 0.3423928, 0.04574532, 0, 1, 0.1058824, 1,
-0.3570606, -0.5816898, -2.586443, 0, 1, 0.1137255, 1,
-0.3525448, 0.5304535, -2.303583, 0, 1, 0.1176471, 1,
-0.3505639, 0.4425299, -0.07052743, 0, 1, 0.1254902, 1,
-0.3457144, 0.6863741, -0.1798153, 0, 1, 0.1294118, 1,
-0.3326908, 1.336872, -0.8154818, 0, 1, 0.1372549, 1,
-0.3317152, 0.68281, -0.07085694, 0, 1, 0.1411765, 1,
-0.3247571, 1.185416, -0.2877793, 0, 1, 0.1490196, 1,
-0.3237696, -0.4010029, -2.84197, 0, 1, 0.1529412, 1,
-0.3229326, -1.938782, -2.452151, 0, 1, 0.1607843, 1,
-0.3208777, -0.6367133, -2.836357, 0, 1, 0.1647059, 1,
-0.3168102, 0.2644706, -0.4193007, 0, 1, 0.172549, 1,
-0.310332, 1.401634, 0.2666879, 0, 1, 0.1764706, 1,
-0.3044437, 1.030682, 1.400802, 0, 1, 0.1843137, 1,
-0.3036873, -0.2629603, -2.032404, 0, 1, 0.1882353, 1,
-0.301074, 2.475153, -0.7880152, 0, 1, 0.1960784, 1,
-0.301049, 1.117152, -1.180612, 0, 1, 0.2039216, 1,
-0.2989218, 1.830977, 0.1658559, 0, 1, 0.2078431, 1,
-0.2972268, -1.002393, -3.885186, 0, 1, 0.2156863, 1,
-0.2950642, 1.02809, -0.4887993, 0, 1, 0.2196078, 1,
-0.2940234, -0.7160749, -3.225477, 0, 1, 0.227451, 1,
-0.2912487, -0.1655788, -2.838741, 0, 1, 0.2313726, 1,
-0.2886572, -0.02457681, -2.94023, 0, 1, 0.2392157, 1,
-0.2869731, -1.256684, -2.961151, 0, 1, 0.2431373, 1,
-0.285617, 0.5097234, -0.05338328, 0, 1, 0.2509804, 1,
-0.2796466, 0.1862013, -0.2680688, 0, 1, 0.254902, 1,
-0.2768753, -1.507349, -1.640125, 0, 1, 0.2627451, 1,
-0.2765145, -0.5834639, -2.491781, 0, 1, 0.2666667, 1,
-0.2746996, 0.8771047, 0.3485636, 0, 1, 0.2745098, 1,
-0.2744659, 1.381942, 0.805733, 0, 1, 0.2784314, 1,
-0.2733994, -1.227224, -6.517624, 0, 1, 0.2862745, 1,
-0.2720349, 0.09850928, 0.514288, 0, 1, 0.2901961, 1,
-0.2718313, -1.94589, -2.148357, 0, 1, 0.2980392, 1,
-0.2694843, -0.8461252, -2.384995, 0, 1, 0.3058824, 1,
-0.2687536, 0.581753, -2.703227, 0, 1, 0.3098039, 1,
-0.2673813, 0.5604038, -0.09663352, 0, 1, 0.3176471, 1,
-0.2641333, 1.120679, -0.882054, 0, 1, 0.3215686, 1,
-0.2594546, -0.3143253, -1.154519, 0, 1, 0.3294118, 1,
-0.2549945, -2.322742, -3.144964, 0, 1, 0.3333333, 1,
-0.253866, -0.1909451, -2.379014, 0, 1, 0.3411765, 1,
-0.2513639, 0.3638685, 0.9272153, 0, 1, 0.345098, 1,
-0.2504174, -1.251866, -2.936186, 0, 1, 0.3529412, 1,
-0.24829, -0.335049, -0.7296525, 0, 1, 0.3568628, 1,
-0.2481402, 1.543872, 0.01861295, 0, 1, 0.3647059, 1,
-0.2474989, 0.3548225, 1.330258, 0, 1, 0.3686275, 1,
-0.2378187, -0.8280605, -2.179998, 0, 1, 0.3764706, 1,
-0.237322, -0.5013273, -2.00367, 0, 1, 0.3803922, 1,
-0.2369274, 0.02433776, -1.157318, 0, 1, 0.3882353, 1,
-0.2360422, 0.1450558, -1.538741, 0, 1, 0.3921569, 1,
-0.2329225, 1.322199, -0.132542, 0, 1, 0.4, 1,
-0.2318092, -0.9996513, -1.793145, 0, 1, 0.4078431, 1,
-0.2316658, 0.4881882, -1.58445, 0, 1, 0.4117647, 1,
-0.2288199, 0.2511384, -1.073225, 0, 1, 0.4196078, 1,
-0.2248158, -0.3048274, -3.278426, 0, 1, 0.4235294, 1,
-0.2246605, 0.2620489, -2.235116, 0, 1, 0.4313726, 1,
-0.223079, -0.921219, -2.308521, 0, 1, 0.4352941, 1,
-0.220414, 0.5767359, -0.1931931, 0, 1, 0.4431373, 1,
-0.2189334, -1.063434, -2.734213, 0, 1, 0.4470588, 1,
-0.2169375, 0.7837871, -0.4289105, 0, 1, 0.454902, 1,
-0.2158876, -0.03004548, -1.265421, 0, 1, 0.4588235, 1,
-0.215013, -0.4115905, -1.474622, 0, 1, 0.4666667, 1,
-0.2135024, 0.9249892, -0.408109, 0, 1, 0.4705882, 1,
-0.2111458, 0.003958306, -1.138425, 0, 1, 0.4784314, 1,
-0.2094899, 0.02908875, -3.1512, 0, 1, 0.4823529, 1,
-0.2054718, -1.36493, -3.556055, 0, 1, 0.4901961, 1,
-0.201032, -0.3014462, -2.933113, 0, 1, 0.4941176, 1,
-0.1989022, -0.5434259, -2.874516, 0, 1, 0.5019608, 1,
-0.1963222, 0.02221051, -2.889502, 0, 1, 0.509804, 1,
-0.1958917, 0.5968641, -0.5455822, 0, 1, 0.5137255, 1,
-0.1955444, -1.768216, -2.015175, 0, 1, 0.5215687, 1,
-0.1941868, -1.488642, -2.622348, 0, 1, 0.5254902, 1,
-0.1941541, 1.16642, 1.987957, 0, 1, 0.5333334, 1,
-0.1929347, -0.4611325, -2.754639, 0, 1, 0.5372549, 1,
-0.1924269, 0.5298573, 0.07395953, 0, 1, 0.5450981, 1,
-0.1922327, 0.9387711, 0.4336275, 0, 1, 0.5490196, 1,
-0.1918391, -0.4524021, -2.443947, 0, 1, 0.5568628, 1,
-0.1908291, -1.778328, -4.056027, 0, 1, 0.5607843, 1,
-0.1847615, 0.3962732, -0.04322427, 0, 1, 0.5686275, 1,
-0.1780719, -0.735724, -4.177402, 0, 1, 0.572549, 1,
-0.1774013, -1.031589, -5.909782, 0, 1, 0.5803922, 1,
-0.1764146, 0.2981734, 0.2244663, 0, 1, 0.5843138, 1,
-0.174974, -0.326892, -2.626666, 0, 1, 0.5921569, 1,
-0.1645765, -0.4234346, -4.458317, 0, 1, 0.5960785, 1,
-0.1635289, -1.684394, -1.302832, 0, 1, 0.6039216, 1,
-0.1627902, -2.099664, -1.242794, 0, 1, 0.6117647, 1,
-0.1626122, -1.565632, -3.893229, 0, 1, 0.6156863, 1,
-0.1513429, 0.5712764, -1.876823, 0, 1, 0.6235294, 1,
-0.1452094, 1.198891, -0.9077854, 0, 1, 0.627451, 1,
-0.1450868, 0.4041077, -0.4370021, 0, 1, 0.6352941, 1,
-0.1433017, -0.5383598, -1.637121, 0, 1, 0.6392157, 1,
-0.142593, 1.40106, 0.6941022, 0, 1, 0.6470588, 1,
-0.1393772, -0.09559694, -0.5813234, 0, 1, 0.6509804, 1,
-0.1388115, 0.0292752, -0.8954957, 0, 1, 0.6588235, 1,
-0.1386067, 1.00952, 0.9059962, 0, 1, 0.6627451, 1,
-0.1373769, -0.240427, -1.306733, 0, 1, 0.6705883, 1,
-0.1355249, -0.4182971, -3.457476, 0, 1, 0.6745098, 1,
-0.1341272, 1.798009, 0.752553, 0, 1, 0.682353, 1,
-0.131514, 1.403654, -1.431946, 0, 1, 0.6862745, 1,
-0.1292439, -2.225674, -2.033445, 0, 1, 0.6941177, 1,
-0.1274912, -0.1669472, -2.107025, 0, 1, 0.7019608, 1,
-0.126068, 0.6715434, -0.0138267, 0, 1, 0.7058824, 1,
-0.1258957, -0.7473197, -2.265302, 0, 1, 0.7137255, 1,
-0.1241202, 1.622016, 1.765144, 0, 1, 0.7176471, 1,
-0.1232004, 0.7188427, 1.442868, 0, 1, 0.7254902, 1,
-0.1097952, -0.9268655, -5.215035, 0, 1, 0.7294118, 1,
-0.1041583, 0.1915271, -1.535595, 0, 1, 0.7372549, 1,
-0.1039763, -0.6218804, -2.236584, 0, 1, 0.7411765, 1,
-0.1031299, -1.435992, -3.903617, 0, 1, 0.7490196, 1,
-0.09974279, 1.208466, -0.4820946, 0, 1, 0.7529412, 1,
-0.0995837, 0.1288599, -0.508663, 0, 1, 0.7607843, 1,
-0.09679417, 0.5342237, 1.359394, 0, 1, 0.7647059, 1,
-0.09578239, 0.5392236, -0.3364823, 0, 1, 0.772549, 1,
-0.09295101, 0.1431575, -1.290812, 0, 1, 0.7764706, 1,
-0.08974402, -0.9337662, -2.591302, 0, 1, 0.7843137, 1,
-0.08691288, -0.9408298, -1.947085, 0, 1, 0.7882353, 1,
-0.08635174, -0.009498809, -2.195658, 0, 1, 0.7960784, 1,
-0.08389186, -0.4071579, -1.895562, 0, 1, 0.8039216, 1,
-0.08149906, 0.2425883, 0.6790575, 0, 1, 0.8078431, 1,
-0.07665137, 1.614781, -1.203264, 0, 1, 0.8156863, 1,
-0.07649978, -1.619781, -1.980236, 0, 1, 0.8196079, 1,
-0.07508872, 1.108378, 0.1452897, 0, 1, 0.827451, 1,
-0.0749984, 0.3533397, 0.478213, 0, 1, 0.8313726, 1,
-0.07424126, -0.04633039, -0.5390058, 0, 1, 0.8392157, 1,
-0.0734662, 0.277572, 0.2873547, 0, 1, 0.8431373, 1,
-0.0733855, 0.2258874, -0.7248596, 0, 1, 0.8509804, 1,
-0.07334957, -0.4938582, -2.838173, 0, 1, 0.854902, 1,
-0.07279772, 0.258506, 0.5112799, 0, 1, 0.8627451, 1,
-0.07049127, -1.628668, -3.639071, 0, 1, 0.8666667, 1,
-0.06864429, -0.9164081, -4.169961, 0, 1, 0.8745098, 1,
-0.06863816, 0.6808454, 0.3600323, 0, 1, 0.8784314, 1,
-0.0671038, -0.2235054, -4.394272, 0, 1, 0.8862745, 1,
-0.0564055, -0.04195233, -2.671722, 0, 1, 0.8901961, 1,
-0.0466307, -0.3156151, -3.24431, 0, 1, 0.8980392, 1,
-0.04320819, -1.108428, -2.424146, 0, 1, 0.9058824, 1,
-0.03999412, -0.5755715, -3.010058, 0, 1, 0.9098039, 1,
-0.0396239, -0.2614858, -3.075444, 0, 1, 0.9176471, 1,
-0.03802279, -0.1429902, -2.134755, 0, 1, 0.9215686, 1,
-0.03322795, 0.7014795, 0.5789604, 0, 1, 0.9294118, 1,
-0.02930225, -0.3848647, -2.229429, 0, 1, 0.9333333, 1,
-0.02695389, -1.005331, -2.855994, 0, 1, 0.9411765, 1,
-0.02482833, -0.275929, -2.178887, 0, 1, 0.945098, 1,
-0.02308451, -0.3163309, -2.280282, 0, 1, 0.9529412, 1,
-0.02010802, -0.6577523, -2.848524, 0, 1, 0.9568627, 1,
-0.009010668, 1.724258, -1.151768, 0, 1, 0.9647059, 1,
-0.00178008, 0.8395417, 1.001985, 0, 1, 0.9686275, 1,
0.002888249, -0.6630797, 2.828047, 0, 1, 0.9764706, 1,
0.005272013, 0.6660566, 0.519697, 0, 1, 0.9803922, 1,
0.01377577, 1.101115, 0.7678885, 0, 1, 0.9882353, 1,
0.01636643, -1.577059, 2.502653, 0, 1, 0.9921569, 1,
0.01724202, 0.1874111, -1.014448, 0, 1, 1, 1,
0.01787985, 0.3480732, -0.9096458, 0, 0.9921569, 1, 1,
0.01988137, -0.4590939, 3.143885, 0, 0.9882353, 1, 1,
0.02110893, -0.2447724, 4.131171, 0, 0.9803922, 1, 1,
0.02683719, 0.03931969, 0.3485044, 0, 0.9764706, 1, 1,
0.02687024, -1.25997, 3.151407, 0, 0.9686275, 1, 1,
0.03070378, -0.02957525, 1.611626, 0, 0.9647059, 1, 1,
0.03662809, 1.483956, 1.867062, 0, 0.9568627, 1, 1,
0.04162739, -1.01854, 2.904957, 0, 0.9529412, 1, 1,
0.05260657, -0.1441463, 2.464575, 0, 0.945098, 1, 1,
0.0531061, 0.9966857, -0.1444222, 0, 0.9411765, 1, 1,
0.05903007, -0.1999391, 1.223572, 0, 0.9333333, 1, 1,
0.0605059, -0.1617652, 2.443269, 0, 0.9294118, 1, 1,
0.06509191, 0.8885008, 0.6945031, 0, 0.9215686, 1, 1,
0.06656531, -1.606344, 4.352478, 0, 0.9176471, 1, 1,
0.06686158, -0.3526843, 3.126682, 0, 0.9098039, 1, 1,
0.06983022, 1.074471, 0.552503, 0, 0.9058824, 1, 1,
0.06999053, 0.5918166, 1.718976, 0, 0.8980392, 1, 1,
0.07592014, -0.3580488, 3.38316, 0, 0.8901961, 1, 1,
0.0767111, 0.2932619, 0.005667896, 0, 0.8862745, 1, 1,
0.07734643, 1.091313, 0.05076022, 0, 0.8784314, 1, 1,
0.07892738, 1.369477, 0.5619279, 0, 0.8745098, 1, 1,
0.08354191, -1.41221, 2.179105, 0, 0.8666667, 1, 1,
0.08463869, -0.2364261, 3.058637, 0, 0.8627451, 1, 1,
0.0891118, -0.4458465, 3.850326, 0, 0.854902, 1, 1,
0.09013772, 1.632404, 0.07833903, 0, 0.8509804, 1, 1,
0.09061151, -0.4224463, 4.127491, 0, 0.8431373, 1, 1,
0.09075225, 1.448739, -0.6436216, 0, 0.8392157, 1, 1,
0.09169374, 0.8665923, 1.166132, 0, 0.8313726, 1, 1,
0.09468579, -1.212735, 3.209077, 0, 0.827451, 1, 1,
0.09607583, 0.8095154, 0.5955995, 0, 0.8196079, 1, 1,
0.1027918, 1.400356, 0.01213475, 0, 0.8156863, 1, 1,
0.104163, -0.3564245, 3.286826, 0, 0.8078431, 1, 1,
0.1049335, 0.5007233, -1.064469, 0, 0.8039216, 1, 1,
0.1082417, 0.359835, -0.6199504, 0, 0.7960784, 1, 1,
0.1094946, 1.066418, -0.2180365, 0, 0.7882353, 1, 1,
0.1108045, 1.392396, -0.311024, 0, 0.7843137, 1, 1,
0.1123526, 1.572944, -0.4933096, 0, 0.7764706, 1, 1,
0.1244906, 0.1257631, 0.2492712, 0, 0.772549, 1, 1,
0.1252765, -1.292155, 2.484007, 0, 0.7647059, 1, 1,
0.1257664, -0.07810804, 3.531478, 0, 0.7607843, 1, 1,
0.1271946, 0.3289829, 1.724846, 0, 0.7529412, 1, 1,
0.1272936, -0.03584265, 3.715367, 0, 0.7490196, 1, 1,
0.1285352, -0.6038489, 3.360055, 0, 0.7411765, 1, 1,
0.1297556, -0.05080815, 0.6175467, 0, 0.7372549, 1, 1,
0.1303576, 0.09742336, 1.133187, 0, 0.7294118, 1, 1,
0.1334755, 2.124865, -0.4041032, 0, 0.7254902, 1, 1,
0.1337702, -0.1182657, 2.260385, 0, 0.7176471, 1, 1,
0.1353634, -1.225749, 3.709902, 0, 0.7137255, 1, 1,
0.1370443, 1.923344, 1.141336, 0, 0.7058824, 1, 1,
0.1374068, 0.8024263, 1.527066, 0, 0.6980392, 1, 1,
0.1391394, -0.1385767, 3.198728, 0, 0.6941177, 1, 1,
0.139295, -1.046104, 1.652727, 0, 0.6862745, 1, 1,
0.1402358, 0.588195, -1.309212, 0, 0.682353, 1, 1,
0.1420044, 1.163164, -0.4641441, 0, 0.6745098, 1, 1,
0.1465747, 1.16139, -1.555121, 0, 0.6705883, 1, 1,
0.1480385, 1.099134, 0.5337136, 0, 0.6627451, 1, 1,
0.1483106, 1.501662, -0.3916201, 0, 0.6588235, 1, 1,
0.1518584, 1.635349, -0.2551134, 0, 0.6509804, 1, 1,
0.1520671, 0.7938969, -1.558812, 0, 0.6470588, 1, 1,
0.157265, 0.7358486, 0.07584979, 0, 0.6392157, 1, 1,
0.1574252, -1.101919, 3.289744, 0, 0.6352941, 1, 1,
0.1592115, -0.1531762, 2.727814, 0, 0.627451, 1, 1,
0.1622908, -1.206751, 3.726993, 0, 0.6235294, 1, 1,
0.1645671, -0.4368965, 3.845596, 0, 0.6156863, 1, 1,
0.1661525, -1.213738, 2.879793, 0, 0.6117647, 1, 1,
0.1663107, -0.6817632, 1.713966, 0, 0.6039216, 1, 1,
0.1695739, 1.368041, -0.7813947, 0, 0.5960785, 1, 1,
0.1741306, 1.273562, 1.461974, 0, 0.5921569, 1, 1,
0.1768583, -0.2580272, 1.73652, 0, 0.5843138, 1, 1,
0.1786207, -0.2701214, 3.304147, 0, 0.5803922, 1, 1,
0.1836375, 1.286826, 1.050505, 0, 0.572549, 1, 1,
0.186909, 0.761034, -0.08144748, 0, 0.5686275, 1, 1,
0.1873936, 0.1641524, 2.537079, 0, 0.5607843, 1, 1,
0.1891016, -1.121419, 2.832674, 0, 0.5568628, 1, 1,
0.1933308, 0.1725926, 1.487168, 0, 0.5490196, 1, 1,
0.1946782, 1.188197, -1.763868, 0, 0.5450981, 1, 1,
0.1951545, 1.840821, 0.5097557, 0, 0.5372549, 1, 1,
0.1987978, -0.5531913, 3.869506, 0, 0.5333334, 1, 1,
0.1998654, 1.325634, 1.180991, 0, 0.5254902, 1, 1,
0.2003282, -1.038209, 1.307847, 0, 0.5215687, 1, 1,
0.2035871, 0.8670644, -0.7125739, 0, 0.5137255, 1, 1,
0.2077497, -1.127715, 2.232917, 0, 0.509804, 1, 1,
0.2091173, -0.3292488, 4.489357, 0, 0.5019608, 1, 1,
0.2118859, 1.060739, 0.5707547, 0, 0.4941176, 1, 1,
0.2161307, 0.7887893, 0.5992054, 0, 0.4901961, 1, 1,
0.2172908, 0.3709342, 2.863045, 0, 0.4823529, 1, 1,
0.2213076, -0.3645735, 3.453826, 0, 0.4784314, 1, 1,
0.2218374, 0.9525464, 1.397636, 0, 0.4705882, 1, 1,
0.2239163, 0.02934056, 2.610381, 0, 0.4666667, 1, 1,
0.224038, 1.175653, -0.8571313, 0, 0.4588235, 1, 1,
0.2261031, 0.6742729, 1.499831, 0, 0.454902, 1, 1,
0.228971, 0.9882478, 1.151283, 0, 0.4470588, 1, 1,
0.2323953, 1.447876, 0.6310688, 0, 0.4431373, 1, 1,
0.2357671, -0.402806, 3.078853, 0, 0.4352941, 1, 1,
0.2360721, -0.06968208, 2.075877, 0, 0.4313726, 1, 1,
0.236248, -0.3351362, 3.425699, 0, 0.4235294, 1, 1,
0.2386386, 0.7667894, -0.05151775, 0, 0.4196078, 1, 1,
0.2418077, 0.02246455, 2.014641, 0, 0.4117647, 1, 1,
0.2421689, 0.4846425, 1.389245, 0, 0.4078431, 1, 1,
0.2444343, -2.422974, 2.585297, 0, 0.4, 1, 1,
0.2455027, 1.121662, -0.2344859, 0, 0.3921569, 1, 1,
0.2495749, 1.255163, 0.7107786, 0, 0.3882353, 1, 1,
0.2565661, 0.7788263, 1.733605, 0, 0.3803922, 1, 1,
0.2591913, 1.431239, 0.6765598, 0, 0.3764706, 1, 1,
0.2600601, -0.503373, 1.766698, 0, 0.3686275, 1, 1,
0.2608359, -1.547652, 4.209278, 0, 0.3647059, 1, 1,
0.2610417, 1.065077, 1.669972, 0, 0.3568628, 1, 1,
0.2610502, -0.6141812, 2.829787, 0, 0.3529412, 1, 1,
0.2621599, -0.1478222, 1.531318, 0, 0.345098, 1, 1,
0.2666004, 1.527643, -0.008362329, 0, 0.3411765, 1, 1,
0.2721006, 0.2332027, 1.22648, 0, 0.3333333, 1, 1,
0.2745714, 1.074263, 0.7512138, 0, 0.3294118, 1, 1,
0.2818201, -0.3131937, 2.226656, 0, 0.3215686, 1, 1,
0.2821204, 0.7349185, 0.2136087, 0, 0.3176471, 1, 1,
0.2867094, 1.202583, 0.1124524, 0, 0.3098039, 1, 1,
0.2877901, 0.569324, -0.5067487, 0, 0.3058824, 1, 1,
0.2883944, -0.4354451, 2.275893, 0, 0.2980392, 1, 1,
0.290321, 0.4519791, 0.2962776, 0, 0.2901961, 1, 1,
0.2903473, -0.5250095, 3.443111, 0, 0.2862745, 1, 1,
0.2937353, -0.932047, 2.041037, 0, 0.2784314, 1, 1,
0.3009808, -0.712064, 3.132582, 0, 0.2745098, 1, 1,
0.3011777, 0.9136369, -0.7259662, 0, 0.2666667, 1, 1,
0.3022958, 0.9763902, 1.299124, 0, 0.2627451, 1, 1,
0.3074859, 0.08249061, 0.766407, 0, 0.254902, 1, 1,
0.3099766, 0.4908597, -0.5806102, 0, 0.2509804, 1, 1,
0.3137726, -0.7843135, 3.027618, 0, 0.2431373, 1, 1,
0.3152109, -2.48912, 4.237518, 0, 0.2392157, 1, 1,
0.315976, -0.1747973, 2.727927, 0, 0.2313726, 1, 1,
0.3160513, -0.6445922, 1.733026, 0, 0.227451, 1, 1,
0.3179716, 0.06271173, 0.9436251, 0, 0.2196078, 1, 1,
0.3213243, -1.458132, 3.730516, 0, 0.2156863, 1, 1,
0.3223669, 1.542871, 0.9747707, 0, 0.2078431, 1, 1,
0.3298949, 1.121481, 0.8439072, 0, 0.2039216, 1, 1,
0.3308051, -0.1679741, 0.8301176, 0, 0.1960784, 1, 1,
0.3313837, 1.497817, 0.9200958, 0, 0.1882353, 1, 1,
0.3336451, 1.685383, -0.9252549, 0, 0.1843137, 1, 1,
0.338697, 0.3571533, 0.8595076, 0, 0.1764706, 1, 1,
0.3394812, -0.224608, 3.156453, 0, 0.172549, 1, 1,
0.3397974, -1.167935, 4.947183, 0, 0.1647059, 1, 1,
0.3397991, -1.34368, 3.490509, 0, 0.1607843, 1, 1,
0.3398541, -0.6512889, 0.6586608, 0, 0.1529412, 1, 1,
0.3419597, -2.877771, 3.949663, 0, 0.1490196, 1, 1,
0.3422511, -0.9787619, 2.806515, 0, 0.1411765, 1, 1,
0.342912, 0.3440869, -0.3517826, 0, 0.1372549, 1, 1,
0.3440827, 0.9898438, -0.02704373, 0, 0.1294118, 1, 1,
0.3462435, 0.5317976, 1.519988, 0, 0.1254902, 1, 1,
0.3464518, -1.644024, 2.712343, 0, 0.1176471, 1, 1,
0.3487086, -0.4742438, 2.213224, 0, 0.1137255, 1, 1,
0.3501073, 0.6587271, 0.2766079, 0, 0.1058824, 1, 1,
0.3577725, -0.3711181, 2.435772, 0, 0.09803922, 1, 1,
0.3583695, 0.7837873, 1.338797, 0, 0.09411765, 1, 1,
0.3593584, -1.092144, 2.864321, 0, 0.08627451, 1, 1,
0.3602455, 0.474917, 0.9027781, 0, 0.08235294, 1, 1,
0.3649985, 0.4754682, 0.9090391, 0, 0.07450981, 1, 1,
0.3656681, -0.8948882, 3.11975, 0, 0.07058824, 1, 1,
0.3696006, -0.675045, 2.992227, 0, 0.0627451, 1, 1,
0.3697949, -1.192609, 2.591574, 0, 0.05882353, 1, 1,
0.3710878, -0.4416375, 3.742473, 0, 0.05098039, 1, 1,
0.372297, 0.1427373, 0.5898958, 0, 0.04705882, 1, 1,
0.3773841, 0.1705083, 2.804416, 0, 0.03921569, 1, 1,
0.3780894, -0.08873434, 2.608129, 0, 0.03529412, 1, 1,
0.3817425, -1.737583, 2.157079, 0, 0.02745098, 1, 1,
0.3841668, 0.7212935, 0.2740707, 0, 0.02352941, 1, 1,
0.3844943, -0.8254173, 0.9150506, 0, 0.01568628, 1, 1,
0.3886416, -0.3971084, 0.4162779, 0, 0.01176471, 1, 1,
0.389191, 0.6610597, -0.4258842, 0, 0.003921569, 1, 1,
0.3895832, -0.4177258, 2.464459, 0.003921569, 0, 1, 1,
0.3896023, 0.6528923, 0.4233101, 0.007843138, 0, 1, 1,
0.3934093, 0.5845582, -0.481668, 0.01568628, 0, 1, 1,
0.3963915, -0.5265318, 1.777716, 0.01960784, 0, 1, 1,
0.3975194, 0.6251111, 1.246405, 0.02745098, 0, 1, 1,
0.4073802, -0.7991192, 3.453663, 0.03137255, 0, 1, 1,
0.4078692, 0.3232013, 1.488291, 0.03921569, 0, 1, 1,
0.4079681, 0.5349045, 0.05031032, 0.04313726, 0, 1, 1,
0.4083689, 1.510369, 1.579045, 0.05098039, 0, 1, 1,
0.4101695, -0.664221, 3.305124, 0.05490196, 0, 1, 1,
0.4125819, 0.2186018, 1.759408, 0.0627451, 0, 1, 1,
0.4127819, -0.04837447, 1.492344, 0.06666667, 0, 1, 1,
0.4161275, -1.433213, 3.35427, 0.07450981, 0, 1, 1,
0.4164502, -0.5058151, 2.594935, 0.07843138, 0, 1, 1,
0.4167648, 0.2787736, 0.5260501, 0.08627451, 0, 1, 1,
0.417037, 0.8854878, 3.005448, 0.09019608, 0, 1, 1,
0.4196869, -0.9495701, 4.017834, 0.09803922, 0, 1, 1,
0.4209241, -0.2730749, 2.150656, 0.1058824, 0, 1, 1,
0.4209971, -1.030426, 2.787059, 0.1098039, 0, 1, 1,
0.4213265, 2.033775, 0.4917883, 0.1176471, 0, 1, 1,
0.4215581, -0.4712901, 3.217114, 0.1215686, 0, 1, 1,
0.4252733, 0.07369791, 2.962385, 0.1294118, 0, 1, 1,
0.4264526, -1.552195, 1.735599, 0.1333333, 0, 1, 1,
0.4313025, -1.502596, 0.5280887, 0.1411765, 0, 1, 1,
0.4316314, 1.420995, -1.144725, 0.145098, 0, 1, 1,
0.4325839, 1.290648, -1.038942, 0.1529412, 0, 1, 1,
0.4347238, -0.01573222, 2.242783, 0.1568628, 0, 1, 1,
0.4407949, 2.003081, 0.3602861, 0.1647059, 0, 1, 1,
0.4496915, -0.3243048, 2.340277, 0.1686275, 0, 1, 1,
0.4497242, -0.7741362, 3.924397, 0.1764706, 0, 1, 1,
0.450669, 1.305126, 1.330617, 0.1803922, 0, 1, 1,
0.4524082, 1.386405, 0.8029078, 0.1882353, 0, 1, 1,
0.4560961, -1.302014, 3.373242, 0.1921569, 0, 1, 1,
0.4571556, 0.1725413, -0.0632974, 0.2, 0, 1, 1,
0.4597633, 0.9995574, 1.892229, 0.2078431, 0, 1, 1,
0.4601266, 0.6454408, 0.8431002, 0.2117647, 0, 1, 1,
0.4657454, 0.3422423, 0.7077678, 0.2196078, 0, 1, 1,
0.4778977, -1.117335, 2.7103, 0.2235294, 0, 1, 1,
0.4878665, 0.3253144, -0.2871967, 0.2313726, 0, 1, 1,
0.4894739, -0.09159871, 1.542636, 0.2352941, 0, 1, 1,
0.497926, 0.06915826, 2.341143, 0.2431373, 0, 1, 1,
0.5038999, 1.701287, -1.359665, 0.2470588, 0, 1, 1,
0.5043209, 0.9700546, 0.4406302, 0.254902, 0, 1, 1,
0.5062869, -0.07109281, 2.433666, 0.2588235, 0, 1, 1,
0.5091387, 0.269757, -0.9251662, 0.2666667, 0, 1, 1,
0.5159159, 1.454186, 1.109184, 0.2705882, 0, 1, 1,
0.5179066, -0.159937, 1.708257, 0.2784314, 0, 1, 1,
0.5197737, -1.983482, 2.533363, 0.282353, 0, 1, 1,
0.5232613, -0.6444525, 1.877384, 0.2901961, 0, 1, 1,
0.5244686, 0.9970082, -0.5360014, 0.2941177, 0, 1, 1,
0.525341, 0.4774444, 0.2380759, 0.3019608, 0, 1, 1,
0.5288047, -0.1114635, 2.122857, 0.3098039, 0, 1, 1,
0.5314469, -0.5847284, 2.444773, 0.3137255, 0, 1, 1,
0.5323692, 0.6360353, -0.9063938, 0.3215686, 0, 1, 1,
0.5347451, 0.3820824, 0.5197785, 0.3254902, 0, 1, 1,
0.5347829, 1.379124, 0.8252903, 0.3333333, 0, 1, 1,
0.535333, -0.7133592, 3.672374, 0.3372549, 0, 1, 1,
0.5355152, -1.11605, 3.65083, 0.345098, 0, 1, 1,
0.5390909, -0.4229955, 2.652263, 0.3490196, 0, 1, 1,
0.5405928, 1.518833, 0.7192386, 0.3568628, 0, 1, 1,
0.5406199, -1.130127, 1.978974, 0.3607843, 0, 1, 1,
0.5459506, 0.424123, -1.237693, 0.3686275, 0, 1, 1,
0.5462141, -1.340541, 2.728537, 0.372549, 0, 1, 1,
0.549754, -0.1854598, 2.961606, 0.3803922, 0, 1, 1,
0.5561956, -0.4042709, 2.968243, 0.3843137, 0, 1, 1,
0.5594356, -0.12483, 1.592445, 0.3921569, 0, 1, 1,
0.5610754, 1.397123, 0.2279297, 0.3960784, 0, 1, 1,
0.5611842, 1.469651, -0.1452109, 0.4039216, 0, 1, 1,
0.5629631, -0.6471222, 3.985018, 0.4117647, 0, 1, 1,
0.5679412, 0.761109, 0.5545833, 0.4156863, 0, 1, 1,
0.5778614, 0.381152, 1.244968, 0.4235294, 0, 1, 1,
0.5834843, -0.5215888, 3.213038, 0.427451, 0, 1, 1,
0.5858107, -1.57623, 6.607728, 0.4352941, 0, 1, 1,
0.5867562, 1.294798, 2.334462, 0.4392157, 0, 1, 1,
0.5875749, -0.960779, 2.266965, 0.4470588, 0, 1, 1,
0.5984307, 0.967815, 0.1685427, 0.4509804, 0, 1, 1,
0.5991676, -0.6019912, 2.149644, 0.4588235, 0, 1, 1,
0.6071728, 1.621063, 1.03938, 0.4627451, 0, 1, 1,
0.6101503, -1.461869, 2.610734, 0.4705882, 0, 1, 1,
0.6240744, 0.7081881, 0.9451173, 0.4745098, 0, 1, 1,
0.6245227, 0.6492589, 2.719167, 0.4823529, 0, 1, 1,
0.6270827, -0.3890899, 2.129132, 0.4862745, 0, 1, 1,
0.6299784, 0.3838363, -0.8467013, 0.4941176, 0, 1, 1,
0.6307223, 0.09809791, 0.3647707, 0.5019608, 0, 1, 1,
0.6309965, -1.180389, 2.585748, 0.5058824, 0, 1, 1,
0.631075, 0.3186314, 1.961186, 0.5137255, 0, 1, 1,
0.6316251, -0.5041115, 2.608953, 0.5176471, 0, 1, 1,
0.6397664, 1.863485, -0.5534803, 0.5254902, 0, 1, 1,
0.6415652, -0.04022947, 2.320086, 0.5294118, 0, 1, 1,
0.6422972, 0.1337319, -0.0524704, 0.5372549, 0, 1, 1,
0.6482642, 2.842164, 0.6657001, 0.5411765, 0, 1, 1,
0.6582565, -0.721805, 2.342684, 0.5490196, 0, 1, 1,
0.6598988, 1.290158, 0.6253272, 0.5529412, 0, 1, 1,
0.6609132, -0.8066771, 2.844543, 0.5607843, 0, 1, 1,
0.662284, 0.3269962, -0.09515662, 0.5647059, 0, 1, 1,
0.6657434, -1.395089, 1.913854, 0.572549, 0, 1, 1,
0.6710533, 1.460321, 0.4765212, 0.5764706, 0, 1, 1,
0.6714454, 0.7854133, 0.7833143, 0.5843138, 0, 1, 1,
0.6818074, -0.5180825, 1.962904, 0.5882353, 0, 1, 1,
0.6821399, 1.676916, 0.6560258, 0.5960785, 0, 1, 1,
0.6843783, 0.8536952, 1.279379, 0.6039216, 0, 1, 1,
0.687403, -0.5932266, 3.958886, 0.6078432, 0, 1, 1,
0.6883178, 0.34671, -0.3429222, 0.6156863, 0, 1, 1,
0.6911003, -1.614309, 3.958572, 0.6196079, 0, 1, 1,
0.6963627, -0.5587029, 1.708327, 0.627451, 0, 1, 1,
0.6979289, 1.43238, 0.05170751, 0.6313726, 0, 1, 1,
0.7020561, 0.7780771, 0.5877163, 0.6392157, 0, 1, 1,
0.7085029, 0.6944482, 0.2411499, 0.6431373, 0, 1, 1,
0.709079, -1.269715, 2.818676, 0.6509804, 0, 1, 1,
0.72584, 0.4057279, 0.1126524, 0.654902, 0, 1, 1,
0.7540997, 2.413263, 1.457401, 0.6627451, 0, 1, 1,
0.7550198, -0.8682517, 1.522047, 0.6666667, 0, 1, 1,
0.7597721, 1.733722, 2.371723, 0.6745098, 0, 1, 1,
0.760626, 2.171929, 0.5762616, 0.6784314, 0, 1, 1,
0.7643186, -0.3660913, 0.8125544, 0.6862745, 0, 1, 1,
0.7658396, -0.5968391, 0.4191764, 0.6901961, 0, 1, 1,
0.7748544, 2.846454, -0.6065719, 0.6980392, 0, 1, 1,
0.777737, 2.251327, 0.01752922, 0.7058824, 0, 1, 1,
0.7786794, 1.666451, 0.462855, 0.7098039, 0, 1, 1,
0.7810633, 0.8685342, 0.1441633, 0.7176471, 0, 1, 1,
0.7817535, 0.5110289, 1.2137, 0.7215686, 0, 1, 1,
0.7818388, 0.5970368, 0.7818046, 0.7294118, 0, 1, 1,
0.782972, -2.384478, 3.830091, 0.7333333, 0, 1, 1,
0.7872914, 1.256342, 0.765027, 0.7411765, 0, 1, 1,
0.7896757, 1.251718, 2.090699, 0.7450981, 0, 1, 1,
0.7906722, 0.4542966, 2.877382, 0.7529412, 0, 1, 1,
0.794857, -1.740689, 4.371963, 0.7568628, 0, 1, 1,
0.7960799, -1.39731, 3.47389, 0.7647059, 0, 1, 1,
0.797009, -1.549864, 0.4586573, 0.7686275, 0, 1, 1,
0.8066496, 1.91145, 0.1515157, 0.7764706, 0, 1, 1,
0.8076368, -0.08830047, 1.346744, 0.7803922, 0, 1, 1,
0.8095672, -0.2729202, 1.177943, 0.7882353, 0, 1, 1,
0.8150621, 0.8618394, 2.117032, 0.7921569, 0, 1, 1,
0.8262305, -1.539986, 0.9677032, 0.8, 0, 1, 1,
0.827596, 1.092531, 1.502979, 0.8078431, 0, 1, 1,
0.8286743, -2.063889, 2.59908, 0.8117647, 0, 1, 1,
0.8319416, 0.7351264, 2.108993, 0.8196079, 0, 1, 1,
0.8320131, 0.5643359, 2.368234, 0.8235294, 0, 1, 1,
0.8322781, -0.3916527, 0.8399037, 0.8313726, 0, 1, 1,
0.8432307, -0.687295, 3.713372, 0.8352941, 0, 1, 1,
0.8446401, -1.444154, 2.538512, 0.8431373, 0, 1, 1,
0.8460436, 0.1723635, 1.726297, 0.8470588, 0, 1, 1,
0.8531185, 1.848875, -0.030135, 0.854902, 0, 1, 1,
0.8532081, -0.7371727, 0.01578625, 0.8588235, 0, 1, 1,
0.8535523, 1.229461, 0.6450804, 0.8666667, 0, 1, 1,
0.8592811, -0.2578035, 4.171306, 0.8705882, 0, 1, 1,
0.8594988, 0.5695639, 1.332032, 0.8784314, 0, 1, 1,
0.8639728, -0.3075449, 0.518021, 0.8823529, 0, 1, 1,
0.865695, 0.6503576, 0.559045, 0.8901961, 0, 1, 1,
0.8794965, 1.414448, 2.60297, 0.8941177, 0, 1, 1,
0.8844066, -2.208127, 1.86662, 0.9019608, 0, 1, 1,
0.8867142, 1.165626, 0.1204331, 0.9098039, 0, 1, 1,
0.889723, -0.3361747, 1.73033, 0.9137255, 0, 1, 1,
0.9011765, -0.6101846, 2.803238, 0.9215686, 0, 1, 1,
0.9040204, -0.01610747, 0.6799815, 0.9254902, 0, 1, 1,
0.908197, -0.0565353, 1.353461, 0.9333333, 0, 1, 1,
0.9101247, -1.574865, 1.661546, 0.9372549, 0, 1, 1,
0.9140581, -0.5065361, 1.726787, 0.945098, 0, 1, 1,
0.9158029, 0.6992484, 1.016786, 0.9490196, 0, 1, 1,
0.9160231, -0.7774521, 2.637761, 0.9568627, 0, 1, 1,
0.9196909, 0.3215208, -0.5765871, 0.9607843, 0, 1, 1,
0.92154, 0.9601595, 1.633841, 0.9686275, 0, 1, 1,
0.9252208, -0.9361488, 3.436738, 0.972549, 0, 1, 1,
0.9321379, 1.088089, 1.319162, 0.9803922, 0, 1, 1,
0.9327075, -1.307123, 2.324695, 0.9843137, 0, 1, 1,
0.9347901, 0.4256223, 1.433387, 0.9921569, 0, 1, 1,
0.9365443, 1.098888, 0.06977689, 0.9960784, 0, 1, 1,
0.9367535, -0.9869859, 1.827105, 1, 0, 0.9960784, 1,
0.939722, 0.7653482, 0.8822717, 1, 0, 0.9882353, 1,
0.9478261, 0.774974, 3.386828, 1, 0, 0.9843137, 1,
0.9508328, -0.804714, 0.5736845, 1, 0, 0.9764706, 1,
0.9512688, -1.263156, 2.107411, 1, 0, 0.972549, 1,
0.9516631, -0.8368535, 1.534543, 1, 0, 0.9647059, 1,
0.960702, 0.1072853, 0.2724589, 1, 0, 0.9607843, 1,
0.9657798, 0.5579292, -0.8692628, 1, 0, 0.9529412, 1,
0.9840599, 0.2792405, -0.08519123, 1, 0, 0.9490196, 1,
0.985487, 1.221694, 1.897459, 1, 0, 0.9411765, 1,
0.9895214, -0.1158764, 3.555077, 1, 0, 0.9372549, 1,
0.991899, 0.5697429, 0.6425282, 1, 0, 0.9294118, 1,
1.002448, -0.8330138, 1.567954, 1, 0, 0.9254902, 1,
1.006284, -0.8489382, 2.703842, 1, 0, 0.9176471, 1,
1.017638, 1.077708, 1.038161, 1, 0, 0.9137255, 1,
1.017701, -0.2729092, 3.144868, 1, 0, 0.9058824, 1,
1.025802, -0.8141084, 3.265818, 1, 0, 0.9019608, 1,
1.028182, -0.03720577, 3.286994, 1, 0, 0.8941177, 1,
1.030239, -0.5206876, 0.2661207, 1, 0, 0.8862745, 1,
1.034897, -1.513479, 1.830917, 1, 0, 0.8823529, 1,
1.035164, -0.02813473, 2.511491, 1, 0, 0.8745098, 1,
1.062232, 1.418972, 0.6720235, 1, 0, 0.8705882, 1,
1.06668, 0.6797706, 2.516911, 1, 0, 0.8627451, 1,
1.074277, 0.532708, 0.514174, 1, 0, 0.8588235, 1,
1.082337, 0.8913711, -0.763903, 1, 0, 0.8509804, 1,
1.083755, 0.8796524, 0.7158599, 1, 0, 0.8470588, 1,
1.094138, 0.7513288, -0.8805338, 1, 0, 0.8392157, 1,
1.095247, -1.429901, 3.063209, 1, 0, 0.8352941, 1,
1.098677, 0.7084386, 2.598706, 1, 0, 0.827451, 1,
1.099822, -0.5240792, 3.656855, 1, 0, 0.8235294, 1,
1.099954, -1.148205, 1.443368, 1, 0, 0.8156863, 1,
1.110397, -0.4707452, 3.912503, 1, 0, 0.8117647, 1,
1.111097, -0.9218978, 2.49212, 1, 0, 0.8039216, 1,
1.111739, -0.5754362, 0.4872545, 1, 0, 0.7960784, 1,
1.112336, -0.5184681, 2.365297, 1, 0, 0.7921569, 1,
1.113199, -1.3399, 1.859884, 1, 0, 0.7843137, 1,
1.120933, -2.201018, 0.7878515, 1, 0, 0.7803922, 1,
1.129409, 0.05380341, 2.486575, 1, 0, 0.772549, 1,
1.136508, 1.16197, 2.011179, 1, 0, 0.7686275, 1,
1.148467, 1.558534, 0.55172, 1, 0, 0.7607843, 1,
1.150061, -0.1370395, 1.714188, 1, 0, 0.7568628, 1,
1.161739, -0.2516122, 2.036765, 1, 0, 0.7490196, 1,
1.162039, 0.006574942, -0.7805955, 1, 0, 0.7450981, 1,
1.168486, -0.2944784, 3.046483, 1, 0, 0.7372549, 1,
1.175501, 0.7221989, 2.175559, 1, 0, 0.7333333, 1,
1.1789, -0.2352735, 0.4468952, 1, 0, 0.7254902, 1,
1.181388, 0.2062444, 0.3784292, 1, 0, 0.7215686, 1,
1.182112, 1.404589, 0.8715146, 1, 0, 0.7137255, 1,
1.184118, -0.7501554, 1.120213, 1, 0, 0.7098039, 1,
1.184319, 0.1870145, 1.046992, 1, 0, 0.7019608, 1,
1.184421, 0.4368225, 1.48352, 1, 0, 0.6941177, 1,
1.197357, 0.5642655, 2.114168, 1, 0, 0.6901961, 1,
1.211041, 0.09492505, 1.373373, 1, 0, 0.682353, 1,
1.222047, 0.1750259, 0.5521212, 1, 0, 0.6784314, 1,
1.222667, -0.4851584, 1.98872, 1, 0, 0.6705883, 1,
1.222933, 0.5455897, 0.9746926, 1, 0, 0.6666667, 1,
1.226381, -0.5460376, 1.679271, 1, 0, 0.6588235, 1,
1.226524, 0.1211532, 4.094866, 1, 0, 0.654902, 1,
1.24127, 0.9428461, 2.262107, 1, 0, 0.6470588, 1,
1.254247, 0.5429337, 3.252392, 1, 0, 0.6431373, 1,
1.256789, -1.402388, 1.747254, 1, 0, 0.6352941, 1,
1.263217, -0.8166062, 4.20668, 1, 0, 0.6313726, 1,
1.264945, -1.527972, 3.05674, 1, 0, 0.6235294, 1,
1.274243, 0.1824124, 1.190398, 1, 0, 0.6196079, 1,
1.295994, -0.4924012, 1.505445, 1, 0, 0.6117647, 1,
1.322432, 0.6179256, 3.244135, 1, 0, 0.6078432, 1,
1.330091, 0.007857438, 3.228445, 1, 0, 0.6, 1,
1.349052, 1.568132, 1.129841, 1, 0, 0.5921569, 1,
1.350711, 0.7788313, 0.3464897, 1, 0, 0.5882353, 1,
1.361066, 0.9861649, 1.103422, 1, 0, 0.5803922, 1,
1.361598, 0.6995055, -0.4157554, 1, 0, 0.5764706, 1,
1.362534, -0.278871, 4.427329, 1, 0, 0.5686275, 1,
1.363591, -0.3143455, 2.435789, 1, 0, 0.5647059, 1,
1.363672, -0.6443611, 2.816813, 1, 0, 0.5568628, 1,
1.368832, 0.08995183, 3.08094, 1, 0, 0.5529412, 1,
1.372643, 0.2756806, 2.038165, 1, 0, 0.5450981, 1,
1.387026, -0.383095, 2.875751, 1, 0, 0.5411765, 1,
1.391448, 0.01012625, 1.838844, 1, 0, 0.5333334, 1,
1.399026, -1.755781, 2.541323, 1, 0, 0.5294118, 1,
1.406731, 1.259251, 1.795645, 1, 0, 0.5215687, 1,
1.416828, -0.6981922, 2.369622, 1, 0, 0.5176471, 1,
1.421158, -1.191705, 2.384982, 1, 0, 0.509804, 1,
1.42544, -0.1371138, 0.02318555, 1, 0, 0.5058824, 1,
1.42925, -0.1769495, -0.008279242, 1, 0, 0.4980392, 1,
1.436894, 0.3848447, 0.8106682, 1, 0, 0.4901961, 1,
1.438511, 0.4024009, 0.5865402, 1, 0, 0.4862745, 1,
1.444507, -1.754562, 4.363458, 1, 0, 0.4784314, 1,
1.447234, -1.14301, 2.305675, 1, 0, 0.4745098, 1,
1.453878, -3.045978, 1.984042, 1, 0, 0.4666667, 1,
1.457084, 1.729472, 1.031376, 1, 0, 0.4627451, 1,
1.457637, 0.09938659, 0.8938016, 1, 0, 0.454902, 1,
1.465393, 1.375788, 0.6235604, 1, 0, 0.4509804, 1,
1.485675, 1.361969, 0.7706494, 1, 0, 0.4431373, 1,
1.48959, -0.02575604, 2.012133, 1, 0, 0.4392157, 1,
1.493926, -0.8815393, 2.624561, 1, 0, 0.4313726, 1,
1.525142, -1.868235, 1.986783, 1, 0, 0.427451, 1,
1.528002, 0.8307431, 1.112669, 1, 0, 0.4196078, 1,
1.539763, 1.089341, 0.8346788, 1, 0, 0.4156863, 1,
1.549569, -1.559106, 3.227229, 1, 0, 0.4078431, 1,
1.549961, -1.114621, 1.548196, 1, 0, 0.4039216, 1,
1.555342, -0.786651, 2.527853, 1, 0, 0.3960784, 1,
1.56045, -0.9387663, 2.695242, 1, 0, 0.3882353, 1,
1.565975, -0.8249366, 2.480793, 1, 0, 0.3843137, 1,
1.571239, 1.004813, 0.7100652, 1, 0, 0.3764706, 1,
1.592626, -0.09583397, 2.82782, 1, 0, 0.372549, 1,
1.595088, 0.786146, 1.478849, 1, 0, 0.3647059, 1,
1.597311, -0.5278364, 1.411979, 1, 0, 0.3607843, 1,
1.614084, 0.09155691, 0.7121676, 1, 0, 0.3529412, 1,
1.616654, 0.6425163, -0.03009347, 1, 0, 0.3490196, 1,
1.622032, 0.8814794, 0.2307234, 1, 0, 0.3411765, 1,
1.625588, 0.711068, 1.855472, 1, 0, 0.3372549, 1,
1.630665, 0.6788776, 1.505301, 1, 0, 0.3294118, 1,
1.643998, 0.3012526, 2.619221, 1, 0, 0.3254902, 1,
1.656401, -0.1908093, 2.02784, 1, 0, 0.3176471, 1,
1.671041, -2.363651, 4.183735, 1, 0, 0.3137255, 1,
1.698036, -2.148559, 1.677104, 1, 0, 0.3058824, 1,
1.707184, 0.4369996, 0.8928289, 1, 0, 0.2980392, 1,
1.715468, -0.7585487, 1.732963, 1, 0, 0.2941177, 1,
1.733043, -0.2238791, 1.355132, 1, 0, 0.2862745, 1,
1.753064, -0.219341, 2.232306, 1, 0, 0.282353, 1,
1.765225, -0.2215423, 0.7840989, 1, 0, 0.2745098, 1,
1.765606, -0.5392321, 1.318767, 1, 0, 0.2705882, 1,
1.774454, 0.3174637, -1.607085, 1, 0, 0.2627451, 1,
1.779958, -0.1981156, 2.627272, 1, 0, 0.2588235, 1,
1.822826, -1.923423, 3.894779, 1, 0, 0.2509804, 1,
1.836564, 1.626597, 0.004412307, 1, 0, 0.2470588, 1,
1.864699, 2.781348, -1.107896, 1, 0, 0.2392157, 1,
1.886417, -2.283687, 2.17177, 1, 0, 0.2352941, 1,
1.899866, 0.5264653, 1.816802, 1, 0, 0.227451, 1,
1.90194, -0.1699088, 1.562105, 1, 0, 0.2235294, 1,
1.906821, -0.1987271, 1.632963, 1, 0, 0.2156863, 1,
1.90918, -0.1936283, 1.193633, 1, 0, 0.2117647, 1,
1.909759, 0.2987102, 1.468768, 1, 0, 0.2039216, 1,
1.917735, 0.3773448, 0.9490745, 1, 0, 0.1960784, 1,
1.927479, -0.7136008, 0.7107013, 1, 0, 0.1921569, 1,
1.93006, 0.5909454, 3.275517, 1, 0, 0.1843137, 1,
1.935278, -0.1999331, 2.361698, 1, 0, 0.1803922, 1,
1.997896, 0.8781705, 0.9019844, 1, 0, 0.172549, 1,
2.021775, -1.022555, 0.3387962, 1, 0, 0.1686275, 1,
2.035893, 1.048785, 0.250239, 1, 0, 0.1607843, 1,
2.039939, -1.262537, 1.651518, 1, 0, 0.1568628, 1,
2.051582, 0.2622121, 1.303792, 1, 0, 0.1490196, 1,
2.069168, -0.677036, 2.81461, 1, 0, 0.145098, 1,
2.075759, 0.2556512, 2.999817, 1, 0, 0.1372549, 1,
2.103264, -0.7520647, 0.3496498, 1, 0, 0.1333333, 1,
2.123052, -1.307965, 2.380301, 1, 0, 0.1254902, 1,
2.147822, 0.5847847, -0.1589352, 1, 0, 0.1215686, 1,
2.157418, 0.7930495, 1.606263, 1, 0, 0.1137255, 1,
2.161617, 2.382046, 1.432343, 1, 0, 0.1098039, 1,
2.186002, -0.3264796, 1.238833, 1, 0, 0.1019608, 1,
2.220006, -1.089244, 2.711356, 1, 0, 0.09411765, 1,
2.246356, -0.5436127, 1.844302, 1, 0, 0.09019608, 1,
2.269812, 0.8881088, 0.2542559, 1, 0, 0.08235294, 1,
2.271032, 0.09703697, 1.972223, 1, 0, 0.07843138, 1,
2.304549, -0.142688, 2.080333, 1, 0, 0.07058824, 1,
2.309235, 0.3120781, 2.406672, 1, 0, 0.06666667, 1,
2.424252, -1.237467, 2.640087, 1, 0, 0.05882353, 1,
2.456248, 0.8506758, -0.7253473, 1, 0, 0.05490196, 1,
2.484342, -1.291934, 3.016497, 1, 0, 0.04705882, 1,
2.544488, 0.00770585, 1.611715, 1, 0, 0.04313726, 1,
2.550932, -1.825101, 0.6584303, 1, 0, 0.03529412, 1,
2.569342, -1.066941, 1.913067, 1, 0, 0.03137255, 1,
2.624965, 0.1210737, 1.636183, 1, 0, 0.02352941, 1,
2.786891, -0.2638952, 1.363276, 1, 0, 0.01960784, 1,
3.10807, 0.6676485, -0.7098804, 1, 0, 0.01176471, 1,
3.121323, 0.5174057, 0.6980277, 1, 0, 0.007843138, 1
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
0.07852101, -4.15372, -8.742372, 0, -0.5, 0.5, 0.5,
0.07852101, -4.15372, -8.742372, 1, -0.5, 0.5, 0.5,
0.07852101, -4.15372, -8.742372, 1, 1.5, 0.5, 0.5,
0.07852101, -4.15372, -8.742372, 0, 1.5, 0.5, 0.5
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
-3.99579, 0.2216978, -8.742372, 0, -0.5, 0.5, 0.5,
-3.99579, 0.2216978, -8.742372, 1, -0.5, 0.5, 0.5,
-3.99579, 0.2216978, -8.742372, 1, 1.5, 0.5, 0.5,
-3.99579, 0.2216978, -8.742372, 0, 1.5, 0.5, 0.5
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
-3.99579, -4.15372, 0.04505229, 0, -0.5, 0.5, 0.5,
-3.99579, -4.15372, 0.04505229, 1, -0.5, 0.5, 0.5,
-3.99579, -4.15372, 0.04505229, 1, 1.5, 0.5, 0.5,
-3.99579, -4.15372, 0.04505229, 0, 1.5, 0.5, 0.5
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
-2, -3.144009, -6.714504,
3, -3.144009, -6.714504,
-2, -3.144009, -6.714504,
-2, -3.312294, -7.052482,
-1, -3.144009, -6.714504,
-1, -3.312294, -7.052482,
0, -3.144009, -6.714504,
0, -3.312294, -7.052482,
1, -3.144009, -6.714504,
1, -3.312294, -7.052482,
2, -3.144009, -6.714504,
2, -3.312294, -7.052482,
3, -3.144009, -6.714504,
3, -3.312294, -7.052482
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
-2, -3.648865, -7.728437, 0, -0.5, 0.5, 0.5,
-2, -3.648865, -7.728437, 1, -0.5, 0.5, 0.5,
-2, -3.648865, -7.728437, 1, 1.5, 0.5, 0.5,
-2, -3.648865, -7.728437, 0, 1.5, 0.5, 0.5,
-1, -3.648865, -7.728437, 0, -0.5, 0.5, 0.5,
-1, -3.648865, -7.728437, 1, -0.5, 0.5, 0.5,
-1, -3.648865, -7.728437, 1, 1.5, 0.5, 0.5,
-1, -3.648865, -7.728437, 0, 1.5, 0.5, 0.5,
0, -3.648865, -7.728437, 0, -0.5, 0.5, 0.5,
0, -3.648865, -7.728437, 1, -0.5, 0.5, 0.5,
0, -3.648865, -7.728437, 1, 1.5, 0.5, 0.5,
0, -3.648865, -7.728437, 0, 1.5, 0.5, 0.5,
1, -3.648865, -7.728437, 0, -0.5, 0.5, 0.5,
1, -3.648865, -7.728437, 1, -0.5, 0.5, 0.5,
1, -3.648865, -7.728437, 1, 1.5, 0.5, 0.5,
1, -3.648865, -7.728437, 0, 1.5, 0.5, 0.5,
2, -3.648865, -7.728437, 0, -0.5, 0.5, 0.5,
2, -3.648865, -7.728437, 1, -0.5, 0.5, 0.5,
2, -3.648865, -7.728437, 1, 1.5, 0.5, 0.5,
2, -3.648865, -7.728437, 0, 1.5, 0.5, 0.5,
3, -3.648865, -7.728437, 0, -0.5, 0.5, 0.5,
3, -3.648865, -7.728437, 1, -0.5, 0.5, 0.5,
3, -3.648865, -7.728437, 1, 1.5, 0.5, 0.5,
3, -3.648865, -7.728437, 0, 1.5, 0.5, 0.5
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
-3.055565, -3, -6.714504,
-3.055565, 3, -6.714504,
-3.055565, -3, -6.714504,
-3.212269, -3, -7.052482,
-3.055565, -2, -6.714504,
-3.212269, -2, -7.052482,
-3.055565, -1, -6.714504,
-3.212269, -1, -7.052482,
-3.055565, 0, -6.714504,
-3.212269, 0, -7.052482,
-3.055565, 1, -6.714504,
-3.212269, 1, -7.052482,
-3.055565, 2, -6.714504,
-3.212269, 2, -7.052482,
-3.055565, 3, -6.714504,
-3.212269, 3, -7.052482
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
-3.525677, -3, -7.728437, 0, -0.5, 0.5, 0.5,
-3.525677, -3, -7.728437, 1, -0.5, 0.5, 0.5,
-3.525677, -3, -7.728437, 1, 1.5, 0.5, 0.5,
-3.525677, -3, -7.728437, 0, 1.5, 0.5, 0.5,
-3.525677, -2, -7.728437, 0, -0.5, 0.5, 0.5,
-3.525677, -2, -7.728437, 1, -0.5, 0.5, 0.5,
-3.525677, -2, -7.728437, 1, 1.5, 0.5, 0.5,
-3.525677, -2, -7.728437, 0, 1.5, 0.5, 0.5,
-3.525677, -1, -7.728437, 0, -0.5, 0.5, 0.5,
-3.525677, -1, -7.728437, 1, -0.5, 0.5, 0.5,
-3.525677, -1, -7.728437, 1, 1.5, 0.5, 0.5,
-3.525677, -1, -7.728437, 0, 1.5, 0.5, 0.5,
-3.525677, 0, -7.728437, 0, -0.5, 0.5, 0.5,
-3.525677, 0, -7.728437, 1, -0.5, 0.5, 0.5,
-3.525677, 0, -7.728437, 1, 1.5, 0.5, 0.5,
-3.525677, 0, -7.728437, 0, 1.5, 0.5, 0.5,
-3.525677, 1, -7.728437, 0, -0.5, 0.5, 0.5,
-3.525677, 1, -7.728437, 1, -0.5, 0.5, 0.5,
-3.525677, 1, -7.728437, 1, 1.5, 0.5, 0.5,
-3.525677, 1, -7.728437, 0, 1.5, 0.5, 0.5,
-3.525677, 2, -7.728437, 0, -0.5, 0.5, 0.5,
-3.525677, 2, -7.728437, 1, -0.5, 0.5, 0.5,
-3.525677, 2, -7.728437, 1, 1.5, 0.5, 0.5,
-3.525677, 2, -7.728437, 0, 1.5, 0.5, 0.5,
-3.525677, 3, -7.728437, 0, -0.5, 0.5, 0.5,
-3.525677, 3, -7.728437, 1, -0.5, 0.5, 0.5,
-3.525677, 3, -7.728437, 1, 1.5, 0.5, 0.5,
-3.525677, 3, -7.728437, 0, 1.5, 0.5, 0.5
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
-3.055565, -3.144009, -6,
-3.055565, -3.144009, 6,
-3.055565, -3.144009, -6,
-3.212269, -3.312294, -6,
-3.055565, -3.144009, -4,
-3.212269, -3.312294, -4,
-3.055565, -3.144009, -2,
-3.212269, -3.312294, -2,
-3.055565, -3.144009, 0,
-3.212269, -3.312294, 0,
-3.055565, -3.144009, 2,
-3.212269, -3.312294, 2,
-3.055565, -3.144009, 4,
-3.212269, -3.312294, 4,
-3.055565, -3.144009, 6,
-3.212269, -3.312294, 6
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
"4",
"6"
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
-3.525677, -3.648865, -6, 0, -0.5, 0.5, 0.5,
-3.525677, -3.648865, -6, 1, -0.5, 0.5, 0.5,
-3.525677, -3.648865, -6, 1, 1.5, 0.5, 0.5,
-3.525677, -3.648865, -6, 0, 1.5, 0.5, 0.5,
-3.525677, -3.648865, -4, 0, -0.5, 0.5, 0.5,
-3.525677, -3.648865, -4, 1, -0.5, 0.5, 0.5,
-3.525677, -3.648865, -4, 1, 1.5, 0.5, 0.5,
-3.525677, -3.648865, -4, 0, 1.5, 0.5, 0.5,
-3.525677, -3.648865, -2, 0, -0.5, 0.5, 0.5,
-3.525677, -3.648865, -2, 1, -0.5, 0.5, 0.5,
-3.525677, -3.648865, -2, 1, 1.5, 0.5, 0.5,
-3.525677, -3.648865, -2, 0, 1.5, 0.5, 0.5,
-3.525677, -3.648865, 0, 0, -0.5, 0.5, 0.5,
-3.525677, -3.648865, 0, 1, -0.5, 0.5, 0.5,
-3.525677, -3.648865, 0, 1, 1.5, 0.5, 0.5,
-3.525677, -3.648865, 0, 0, 1.5, 0.5, 0.5,
-3.525677, -3.648865, 2, 0, -0.5, 0.5, 0.5,
-3.525677, -3.648865, 2, 1, -0.5, 0.5, 0.5,
-3.525677, -3.648865, 2, 1, 1.5, 0.5, 0.5,
-3.525677, -3.648865, 2, 0, 1.5, 0.5, 0.5,
-3.525677, -3.648865, 4, 0, -0.5, 0.5, 0.5,
-3.525677, -3.648865, 4, 1, -0.5, 0.5, 0.5,
-3.525677, -3.648865, 4, 1, 1.5, 0.5, 0.5,
-3.525677, -3.648865, 4, 0, 1.5, 0.5, 0.5,
-3.525677, -3.648865, 6, 0, -0.5, 0.5, 0.5,
-3.525677, -3.648865, 6, 1, -0.5, 0.5, 0.5,
-3.525677, -3.648865, 6, 1, 1.5, 0.5, 0.5,
-3.525677, -3.648865, 6, 0, 1.5, 0.5, 0.5
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
-3.055565, -3.144009, -6.714504,
-3.055565, 3.587404, -6.714504,
-3.055565, -3.144009, 6.804609,
-3.055565, 3.587404, 6.804609,
-3.055565, -3.144009, -6.714504,
-3.055565, -3.144009, 6.804609,
-3.055565, 3.587404, -6.714504,
-3.055565, 3.587404, 6.804609,
-3.055565, -3.144009, -6.714504,
3.212607, -3.144009, -6.714504,
-3.055565, -3.144009, 6.804609,
3.212607, -3.144009, 6.804609,
-3.055565, 3.587404, -6.714504,
3.212607, 3.587404, -6.714504,
-3.055565, 3.587404, 6.804609,
3.212607, 3.587404, 6.804609,
3.212607, -3.144009, -6.714504,
3.212607, 3.587404, -6.714504,
3.212607, -3.144009, 6.804609,
3.212607, 3.587404, 6.804609,
3.212607, -3.144009, -6.714504,
3.212607, -3.144009, 6.804609,
3.212607, 3.587404, -6.714504,
3.212607, 3.587404, 6.804609
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
var radius = 8.73133;
var distance = 38.84668;
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
mvMatrix.translate( -0.07852101, -0.2216978, -0.04505229 );
mvMatrix.scale( 1.506099, 1.402452, 0.6983066 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -38.84668);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
methansulfonamid<-read.table("methansulfonamid.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-methansulfonamid$V2
```

```
## Error in eval(expr, envir, enclos): object 'methansulfonamid' not found
```

```r
y<-methansulfonamid$V3
```

```
## Error in eval(expr, envir, enclos): object 'methansulfonamid' not found
```

```r
z<-methansulfonamid$V4
```

```
## Error in eval(expr, envir, enclos): object 'methansulfonamid' not found
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
-2.964281, -1.453993, -0.9560665, 0, 0, 1, 1, 1,
-2.914485, 0.6092992, -0.7275516, 1, 0, 0, 1, 1,
-2.728364, 0.7212679, -1.049817, 1, 0, 0, 1, 1,
-2.658244, -0.1431893, -1.322284, 1, 0, 0, 1, 1,
-2.55253, -0.2462555, -1.95325, 1, 0, 0, 1, 1,
-2.509037, 2.27665, -1.43396, 1, 0, 0, 1, 1,
-2.410697, 1.231569, -0.4726143, 0, 0, 0, 1, 1,
-2.397906, -0.3178464, -3.305233, 0, 0, 0, 1, 1,
-2.390716, -0.04620776, -0.3668511, 0, 0, 0, 1, 1,
-2.362993, 0.7031251, -1.327212, 0, 0, 0, 1, 1,
-2.29842, 0.01957768, -1.864503, 0, 0, 0, 1, 1,
-2.279103, -0.7803348, -0.4733487, 0, 0, 0, 1, 1,
-2.196553, 0.7266546, -1.700317, 0, 0, 0, 1, 1,
-2.159359, -0.3358853, -1.274586, 1, 1, 1, 1, 1,
-2.145208, 1.038786, -0.5856648, 1, 1, 1, 1, 1,
-2.138063, 0.09378995, -0.5160756, 1, 1, 1, 1, 1,
-2.127731, -0.1749935, 0.5898725, 1, 1, 1, 1, 1,
-2.028524, 0.8973971, -2.19874, 1, 1, 1, 1, 1,
-1.992287, -1.12235, -2.556412, 1, 1, 1, 1, 1,
-1.976476, -1.578281, -2.079943, 1, 1, 1, 1, 1,
-1.965186, 0.1614695, -0.9296302, 1, 1, 1, 1, 1,
-1.958932, 2.232673, -0.8364658, 1, 1, 1, 1, 1,
-1.952867, 0.994405, 1.299835, 1, 1, 1, 1, 1,
-1.952736, -0.5571169, -0.5650534, 1, 1, 1, 1, 1,
-1.857245, -1.591271, -2.862594, 1, 1, 1, 1, 1,
-1.856264, -0.321612, -1.842314, 1, 1, 1, 1, 1,
-1.856034, -0.1207006, -1.026076, 1, 1, 1, 1, 1,
-1.846181, 0.7149855, -0.7934232, 1, 1, 1, 1, 1,
-1.84423, 1.315573, -1.067188, 0, 0, 1, 1, 1,
-1.841065, -0.7195163, -0.7081037, 1, 0, 0, 1, 1,
-1.838652, -0.8253595, -2.285274, 1, 0, 0, 1, 1,
-1.83543, 0.07819425, -1.496025, 1, 0, 0, 1, 1,
-1.829748, -2.026197, -3.142094, 1, 0, 0, 1, 1,
-1.77844, 1.054518, -0.769132, 1, 0, 0, 1, 1,
-1.741354, 0.5690195, -1.057677, 0, 0, 0, 1, 1,
-1.733697, -1.513194, -1.733504, 0, 0, 0, 1, 1,
-1.732964, 0.6375744, -0.7376164, 0, 0, 0, 1, 1,
-1.72932, 0.3619094, -1.90609, 0, 0, 0, 1, 1,
-1.714734, 0.06370248, -1.946617, 0, 0, 0, 1, 1,
-1.700673, 0.8144602, -1.387678, 0, 0, 0, 1, 1,
-1.69655, -1.719846, -1.402236, 0, 0, 0, 1, 1,
-1.677403, -0.3771101, -0.7825102, 1, 1, 1, 1, 1,
-1.676449, 1.266219, -1.256905, 1, 1, 1, 1, 1,
-1.663259, -0.5273669, -2.270905, 1, 1, 1, 1, 1,
-1.639103, -0.6994846, -2.099832, 1, 1, 1, 1, 1,
-1.639003, -1.446805, -1.917183, 1, 1, 1, 1, 1,
-1.63877, 0.8770048, -2.754227, 1, 1, 1, 1, 1,
-1.637134, -0.1585263, -1.918236, 1, 1, 1, 1, 1,
-1.620616, 1.086051, -0.5693113, 1, 1, 1, 1, 1,
-1.610456, 0.172975, -1.771904, 1, 1, 1, 1, 1,
-1.607692, -1.344926, -3.099946, 1, 1, 1, 1, 1,
-1.604424, -1.942523, -1.927472, 1, 1, 1, 1, 1,
-1.586183, -2.031337, -1.963304, 1, 1, 1, 1, 1,
-1.581831, 1.137097, -1.018067, 1, 1, 1, 1, 1,
-1.579545, 1.183476, -0.7841136, 1, 1, 1, 1, 1,
-1.56318, -0.4174218, -2.568758, 1, 1, 1, 1, 1,
-1.556694, -1.158112, -0.3415098, 0, 0, 1, 1, 1,
-1.54989, -0.8809763, -1.428685, 1, 0, 0, 1, 1,
-1.549445, 0.8872089, -0.7388278, 1, 0, 0, 1, 1,
-1.531602, -0.3903559, -2.031284, 1, 0, 0, 1, 1,
-1.528837, -0.2613424, -2.831889, 1, 0, 0, 1, 1,
-1.511079, 0.8306026, 0.1340011, 1, 0, 0, 1, 1,
-1.507679, 1.2214, -1.308613, 0, 0, 0, 1, 1,
-1.503879, 1.028093, -0.2698893, 0, 0, 0, 1, 1,
-1.496322, 2.126386, 0.04334557, 0, 0, 0, 1, 1,
-1.482527, -0.05621824, -2.896304, 0, 0, 0, 1, 1,
-1.479937, 0.8124631, 0.6651387, 0, 0, 0, 1, 1,
-1.47422, 0.7150964, -1.990628, 0, 0, 0, 1, 1,
-1.453617, -0.6474103, -1.649315, 0, 0, 0, 1, 1,
-1.451368, 1.431284, 0.6964418, 1, 1, 1, 1, 1,
-1.449511, 0.2625943, -4.183707, 1, 1, 1, 1, 1,
-1.445145, 0.9348787, -0.03428064, 1, 1, 1, 1, 1,
-1.444762, 0.6070866, -2.176898, 1, 1, 1, 1, 1,
-1.44409, 3.489374, 1.261454, 1, 1, 1, 1, 1,
-1.434344, -0.05647043, -2.60525, 1, 1, 1, 1, 1,
-1.432442, -0.1261203, -0.8712193, 1, 1, 1, 1, 1,
-1.419848, 0.4144926, -0.648714, 1, 1, 1, 1, 1,
-1.417436, 1.403196, 0.1038562, 1, 1, 1, 1, 1,
-1.416934, 0.6458181, 0.2111374, 1, 1, 1, 1, 1,
-1.403569, 1.13474, 0.358954, 1, 1, 1, 1, 1,
-1.401132, 0.4969051, -1.305123, 1, 1, 1, 1, 1,
-1.399064, -2.575406, -3.022281, 1, 1, 1, 1, 1,
-1.388308, -1.366209, -3.115478, 1, 1, 1, 1, 1,
-1.366952, 0.3594645, -0.9092987, 1, 1, 1, 1, 1,
-1.365299, -1.790043, -1.374651, 0, 0, 1, 1, 1,
-1.343373, -0.1610122, -1.039928, 1, 0, 0, 1, 1,
-1.342903, -1.725689, -1.4568, 1, 0, 0, 1, 1,
-1.340078, -2.532749, -2.483481, 1, 0, 0, 1, 1,
-1.335383, 0.1937006, -2.734923, 1, 0, 0, 1, 1,
-1.332785, -0.08525667, -1.192842, 1, 0, 0, 1, 1,
-1.332374, -0.298263, 1.714556, 0, 0, 0, 1, 1,
-1.331657, 0.5856884, -3.757766, 0, 0, 0, 1, 1,
-1.330832, 1.186855, -0.7716001, 0, 0, 0, 1, 1,
-1.326975, 0.0448811, -1.869782, 0, 0, 0, 1, 1,
-1.326589, 0.340468, -0.6745248, 0, 0, 0, 1, 1,
-1.326236, -0.6703511, -1.972021, 0, 0, 0, 1, 1,
-1.29994, -0.04674148, -1.683247, 0, 0, 0, 1, 1,
-1.29966, -0.7114796, -2.720021, 1, 1, 1, 1, 1,
-1.297886, 1.475152, -2.15048, 1, 1, 1, 1, 1,
-1.297874, 0.1724933, -1.415909, 1, 1, 1, 1, 1,
-1.296649, -1.039705, -2.640971, 1, 1, 1, 1, 1,
-1.294003, -0.373913, -2.750636, 1, 1, 1, 1, 1,
-1.289774, 0.05616728, -1.036598, 1, 1, 1, 1, 1,
-1.286429, -0.1481749, -1.406673, 1, 1, 1, 1, 1,
-1.28194, -0.6755342, -0.3326029, 1, 1, 1, 1, 1,
-1.27707, 0.3109433, -1.109704, 1, 1, 1, 1, 1,
-1.27146, 0.5770738, -1.572786, 1, 1, 1, 1, 1,
-1.262481, 0.2208132, -2.000577, 1, 1, 1, 1, 1,
-1.243129, 1.140764, -0.3949108, 1, 1, 1, 1, 1,
-1.238691, 0.7690009, 0.8146515, 1, 1, 1, 1, 1,
-1.235549, -1.429783, -1.413604, 1, 1, 1, 1, 1,
-1.229177, -1.324212, -2.9821, 1, 1, 1, 1, 1,
-1.219465, 0.7996858, -1.686334, 0, 0, 1, 1, 1,
-1.204006, 0.769959, -1.167125, 1, 0, 0, 1, 1,
-1.199113, -0.4129596, -2.545359, 1, 0, 0, 1, 1,
-1.196991, 0.4156155, -2.480346, 1, 0, 0, 1, 1,
-1.190564, 0.4131243, -1.297887, 1, 0, 0, 1, 1,
-1.180305, -1.271411, -3.238877, 1, 0, 0, 1, 1,
-1.173779, 0.03717941, -1.184886, 0, 0, 0, 1, 1,
-1.17132, 0.4012706, -1.61113, 0, 0, 0, 1, 1,
-1.164704, 0.7093176, -1.794401, 0, 0, 0, 1, 1,
-1.164599, -0.592611, -1.892587, 0, 0, 0, 1, 1,
-1.158244, -1.170116, -2.251529, 0, 0, 0, 1, 1,
-1.156049, 0.7530041, -0.9593995, 0, 0, 0, 1, 1,
-1.152033, -0.3710473, -1.028716, 0, 0, 0, 1, 1,
-1.150438, 2.066909, -0.9173384, 1, 1, 1, 1, 1,
-1.144636, 0.3747967, -0.2406805, 1, 1, 1, 1, 1,
-1.143381, 1.485878, -1.39035, 1, 1, 1, 1, 1,
-1.142875, -0.5455636, -2.479696, 1, 1, 1, 1, 1,
-1.140638, 0.6295705, -0.588692, 1, 1, 1, 1, 1,
-1.139801, -1.109144, -1.413147, 1, 1, 1, 1, 1,
-1.134365, -1.246456, -3.117895, 1, 1, 1, 1, 1,
-1.12862, 1.262408, -1.379723, 1, 1, 1, 1, 1,
-1.127727, -0.3397675, -2.489173, 1, 1, 1, 1, 1,
-1.124391, 0.4900138, -1.225164, 1, 1, 1, 1, 1,
-1.121807, 1.078181, -1.420365, 1, 1, 1, 1, 1,
-1.114711, 0.1428686, -2.779748, 1, 1, 1, 1, 1,
-1.112376, 0.696557, -0.03010256, 1, 1, 1, 1, 1,
-1.08414, 0.4748582, -0.5647116, 1, 1, 1, 1, 1,
-1.084055, 2.296789, 0.5326464, 1, 1, 1, 1, 1,
-1.074391, -1.523861, -4.349351, 0, 0, 1, 1, 1,
-1.073194, -0.9068473, -3.384579, 1, 0, 0, 1, 1,
-1.071964, -0.8883179, -3.0947, 1, 0, 0, 1, 1,
-1.064024, -1.097342, -4.28151, 1, 0, 0, 1, 1,
-1.058756, 1.040107, 1.004877, 1, 0, 0, 1, 1,
-1.053358, -1.81913, -1.686024, 1, 0, 0, 1, 1,
-1.052815, -0.03472604, -2.652965, 0, 0, 0, 1, 1,
-1.044825, 0.6520122, -2.929317, 0, 0, 0, 1, 1,
-1.043901, 2.028361, -0.6372601, 0, 0, 0, 1, 1,
-1.038747, -0.5262285, -3.355293, 0, 0, 0, 1, 1,
-1.038095, 0.05697489, -0.4022247, 0, 0, 0, 1, 1,
-1.037715, -1.328736, -2.58571, 0, 0, 0, 1, 1,
-1.035127, -0.1834646, -2.18612, 0, 0, 0, 1, 1,
-1.033731, -0.2530166, -1.489455, 1, 1, 1, 1, 1,
-1.032881, 0.7042631, -1.45431, 1, 1, 1, 1, 1,
-1.015668, 0.5558945, -2.183199, 1, 1, 1, 1, 1,
-1.012408, 1.266609, -2.010767, 1, 1, 1, 1, 1,
-1.011177, 0.1581003, -2.029549, 1, 1, 1, 1, 1,
-1.008031, 1.492157, -1.612603, 1, 1, 1, 1, 1,
-1.006268, 0.9179986, 0.1362352, 1, 1, 1, 1, 1,
-1.001867, -0.9551679, -2.736087, 1, 1, 1, 1, 1,
-1.000803, -0.2239487, -1.03484, 1, 1, 1, 1, 1,
-0.999966, 1.884154, 0.6076871, 1, 1, 1, 1, 1,
-0.9989474, -0.740596, -2.119052, 1, 1, 1, 1, 1,
-0.997282, 1.061341, -1.564612, 1, 1, 1, 1, 1,
-0.9935341, -0.3408788, -1.547189, 1, 1, 1, 1, 1,
-0.9793782, 0.6369195, -2.009531, 1, 1, 1, 1, 1,
-0.9769024, 2.642262, -1.013991, 1, 1, 1, 1, 1,
-0.9698179, -0.3559165, -1.475197, 0, 0, 1, 1, 1,
-0.9676197, 0.4316839, -1.690112, 1, 0, 0, 1, 1,
-0.965154, 1.157444, -0.03823437, 1, 0, 0, 1, 1,
-0.958332, -0.6027539, -1.341722, 1, 0, 0, 1, 1,
-0.9506134, 0.5413292, 0.7103721, 1, 0, 0, 1, 1,
-0.9439398, -0.5086151, -1.485961, 1, 0, 0, 1, 1,
-0.9416028, 0.1821114, 0.8260055, 0, 0, 0, 1, 1,
-0.9411244, -0.124938, -0.8341249, 0, 0, 0, 1, 1,
-0.9386284, -0.8911017, -2.480335, 0, 0, 0, 1, 1,
-0.9372509, 0.5888855, 2.28793, 0, 0, 0, 1, 1,
-0.9339511, 0.9269916, -0.01767556, 0, 0, 0, 1, 1,
-0.9286467, 0.5607211, -0.695529, 0, 0, 0, 1, 1,
-0.9231822, -1.316368, -1.380493, 0, 0, 0, 1, 1,
-0.9117024, -0.3379945, -1.387563, 1, 1, 1, 1, 1,
-0.9109263, 0.6885375, -1.413793, 1, 1, 1, 1, 1,
-0.908884, 0.768773, -0.2817939, 1, 1, 1, 1, 1,
-0.9051524, -2.120995, -4.075654, 1, 1, 1, 1, 1,
-0.9043581, 0.1989266, -2.720019, 1, 1, 1, 1, 1,
-0.9019911, 0.1207227, -3.079445, 1, 1, 1, 1, 1,
-0.898002, -0.8688569, -3.325426, 1, 1, 1, 1, 1,
-0.8959553, 0.01224496, -2.872129, 1, 1, 1, 1, 1,
-0.8949139, -0.6163008, -2.156769, 1, 1, 1, 1, 1,
-0.883014, 0.2743213, -0.6699752, 1, 1, 1, 1, 1,
-0.8774825, 0.3501215, -2.715096, 1, 1, 1, 1, 1,
-0.8766736, -0.05172562, -1.350435, 1, 1, 1, 1, 1,
-0.876558, -1.131209, -3.208985, 1, 1, 1, 1, 1,
-0.8693637, 0.04935824, -2.832505, 1, 1, 1, 1, 1,
-0.8671518, 0.2088466, -3.006026, 1, 1, 1, 1, 1,
-0.8639752, -0.269833, -2.388165, 0, 0, 1, 1, 1,
-0.8586544, -0.3066786, -0.6503451, 1, 0, 0, 1, 1,
-0.8585692, 0.3966516, -0.5922241, 1, 0, 0, 1, 1,
-0.8504513, -1.070199, -1.729143, 1, 0, 0, 1, 1,
-0.8491271, -0.3412064, -2.057308, 1, 0, 0, 1, 1,
-0.8488238, -0.7967102, -0.292458, 1, 0, 0, 1, 1,
-0.8483657, 1.209028, 0.9150805, 0, 0, 0, 1, 1,
-0.8404905, -0.4263202, -1.710788, 0, 0, 0, 1, 1,
-0.8358847, 1.552791, 0.4928635, 0, 0, 0, 1, 1,
-0.834857, 0.3472687, -1.124297, 0, 0, 0, 1, 1,
-0.8313334, 1.711857, -1.570321, 0, 0, 0, 1, 1,
-0.8109734, 0.3516411, -0.7425976, 0, 0, 0, 1, 1,
-0.8106588, 1.028798, -0.6659338, 0, 0, 0, 1, 1,
-0.7946357, -0.154594, -2.547406, 1, 1, 1, 1, 1,
-0.7913727, 1.02034, -0.246802, 1, 1, 1, 1, 1,
-0.7893556, 1.035055, -1.86732, 1, 1, 1, 1, 1,
-0.787747, 0.2282179, -0.5314387, 1, 1, 1, 1, 1,
-0.7843609, 1.52277, -0.3436846, 1, 1, 1, 1, 1,
-0.7842144, -1.017694, -1.282532, 1, 1, 1, 1, 1,
-0.7792916, 0.6895521, -1.675959, 1, 1, 1, 1, 1,
-0.7774921, -1.35648, -4.83205, 1, 1, 1, 1, 1,
-0.77382, 0.3512999, -0.9885021, 1, 1, 1, 1, 1,
-0.7731559, 1.460468, -0.982161, 1, 1, 1, 1, 1,
-0.7603901, -1.013713, -1.421942, 1, 1, 1, 1, 1,
-0.7529755, -0.8108892, -2.519282, 1, 1, 1, 1, 1,
-0.7529333, -0.1247853, -1.835438, 1, 1, 1, 1, 1,
-0.7505273, 0.6518942, 0.7932262, 1, 1, 1, 1, 1,
-0.7416307, 1.670717, 0.1977004, 1, 1, 1, 1, 1,
-0.7395891, -2.32066, -5.734169, 0, 0, 1, 1, 1,
-0.7381761, -0.9927712, -1.449884, 1, 0, 0, 1, 1,
-0.7341108, -0.750284, -1.855208, 1, 0, 0, 1, 1,
-0.729363, -0.9367253, -2.723586, 1, 0, 0, 1, 1,
-0.7288054, 0.3921167, -1.131815, 1, 0, 0, 1, 1,
-0.7284147, -1.622828, -3.888449, 1, 0, 0, 1, 1,
-0.7233542, 0.04932399, -1.092483, 0, 0, 0, 1, 1,
-0.7176224, 1.920333, 0.2461521, 0, 0, 0, 1, 1,
-0.7128211, -0.3029259, -2.896901, 0, 0, 0, 1, 1,
-0.7119963, -0.1798259, -0.8081074, 0, 0, 0, 1, 1,
-0.7112521, -0.9405649, -4.644284, 0, 0, 0, 1, 1,
-0.70623, -0.4258454, -2.978662, 0, 0, 0, 1, 1,
-0.7024186, 0.8541508, 0.7653473, 0, 0, 0, 1, 1,
-0.7018512, -0.0643885, -3.140297, 1, 1, 1, 1, 1,
-0.6982515, 0.5230677, -0.8333085, 1, 1, 1, 1, 1,
-0.694691, 1.511027, -0.3869266, 1, 1, 1, 1, 1,
-0.6917458, -1.088222, -1.823585, 1, 1, 1, 1, 1,
-0.6862279, 0.7846786, -0.7332709, 1, 1, 1, 1, 1,
-0.6808724, -0.2147971, -3.44612, 1, 1, 1, 1, 1,
-0.677409, -0.02141852, -0.3431787, 1, 1, 1, 1, 1,
-0.6712292, -0.3735124, -2.5651, 1, 1, 1, 1, 1,
-0.6669894, -1.596177, -2.093743, 1, 1, 1, 1, 1,
-0.6613438, -0.09992956, -1.820344, 1, 1, 1, 1, 1,
-0.6599275, 0.7587835, 0.4061437, 1, 1, 1, 1, 1,
-0.6574517, -1.967575, -3.723791, 1, 1, 1, 1, 1,
-0.6571059, -0.7894609, -1.820488, 1, 1, 1, 1, 1,
-0.6555173, -0.1966311, -3.058287, 1, 1, 1, 1, 1,
-0.6511292, 0.002939098, 0.4485117, 1, 1, 1, 1, 1,
-0.6502262, -1.524373, -2.646931, 0, 0, 1, 1, 1,
-0.6493607, 1.108115, -1.294105, 1, 0, 0, 1, 1,
-0.6475699, 0.334758, -0.4640753, 1, 0, 0, 1, 1,
-0.6451751, -1.366819, -3.174705, 1, 0, 0, 1, 1,
-0.6438646, 1.090156, 0.539392, 1, 0, 0, 1, 1,
-0.6412045, 0.8001772, -0.9011843, 1, 0, 0, 1, 1,
-0.6410208, -0.4984965, -0.4989393, 0, 0, 0, 1, 1,
-0.6408842, -0.2914274, -2.039755, 0, 0, 0, 1, 1,
-0.6352706, -0.06472519, -1.547398, 0, 0, 0, 1, 1,
-0.6332546, 0.1288926, -2.73688, 0, 0, 0, 1, 1,
-0.6206701, -0.4895638, -2.18353, 0, 0, 0, 1, 1,
-0.6204365, -1.459948, -2.732409, 0, 0, 0, 1, 1,
-0.6197919, -0.1247995, 1.151175, 0, 0, 0, 1, 1,
-0.6173674, -0.4600504, -2.849473, 1, 1, 1, 1, 1,
-0.6098464, 0.2770856, -1.694447, 1, 1, 1, 1, 1,
-0.6096836, 0.286304, -1.178212, 1, 1, 1, 1, 1,
-0.606358, -1.10558, -3.973396, 1, 1, 1, 1, 1,
-0.5917236, -0.2771265, -3.342189, 1, 1, 1, 1, 1,
-0.5903764, -0.3485318, -0.8940396, 1, 1, 1, 1, 1,
-0.5868638, -0.9223139, -2.791712, 1, 1, 1, 1, 1,
-0.5860863, -1.785656, -2.67724, 1, 1, 1, 1, 1,
-0.5845392, 0.4409499, -0.4763857, 1, 1, 1, 1, 1,
-0.5758848, -0.5795068, -3.940706, 1, 1, 1, 1, 1,
-0.5738837, -2.666478, -1.462276, 1, 1, 1, 1, 1,
-0.5736832, -1.03836, -1.783043, 1, 1, 1, 1, 1,
-0.5698656, 2.509248, -0.5683582, 1, 1, 1, 1, 1,
-0.5643034, -0.4865079, -0.4675719, 1, 1, 1, 1, 1,
-0.5603659, -0.01763092, -1.720225, 1, 1, 1, 1, 1,
-0.5584242, -0.8771867, -3.260757, 0, 0, 1, 1, 1,
-0.5580717, 0.01034784, -1.257031, 1, 0, 0, 1, 1,
-0.5577261, -0.1959429, -3.288157, 1, 0, 0, 1, 1,
-0.5576391, -0.4230711, -1.219139, 1, 0, 0, 1, 1,
-0.5573546, 0.4053346, -0.135022, 1, 0, 0, 1, 1,
-0.554354, -0.1848648, -1.484329, 1, 0, 0, 1, 1,
-0.5490475, -1.535836, -1.988603, 0, 0, 0, 1, 1,
-0.548111, 0.3311878, 0.3167927, 0, 0, 0, 1, 1,
-0.5469864, -0.1087288, -1.715441, 0, 0, 0, 1, 1,
-0.5407298, -0.1582138, -2.454679, 0, 0, 0, 1, 1,
-0.5354422, 1.885231, 0.67238, 0, 0, 0, 1, 1,
-0.5232537, -0.003037555, -0.9405994, 0, 0, 0, 1, 1,
-0.5197459, -0.5427027, -2.243841, 0, 0, 0, 1, 1,
-0.5174463, -2.228819, -2.623611, 1, 1, 1, 1, 1,
-0.5173643, 0.3654288, -1.457498, 1, 1, 1, 1, 1,
-0.5165726, -0.7836775, -2.996544, 1, 1, 1, 1, 1,
-0.515236, 2.629978, 0.1894642, 1, 1, 1, 1, 1,
-0.5150768, 0.009191207, -1.514207, 1, 1, 1, 1, 1,
-0.513621, 0.9519801, -1.003834, 1, 1, 1, 1, 1,
-0.5057838, 0.280017, -0.9106673, 1, 1, 1, 1, 1,
-0.5033125, -0.7427178, -3.175879, 1, 1, 1, 1, 1,
-0.4993534, -0.5012188, -3.428084, 1, 1, 1, 1, 1,
-0.4974696, 0.7300284, -0.825855, 1, 1, 1, 1, 1,
-0.494365, -1.24047, -1.129506, 1, 1, 1, 1, 1,
-0.4938263, 0.2135574, 1.593477, 1, 1, 1, 1, 1,
-0.4925115, 0.4954409, 0.55664, 1, 1, 1, 1, 1,
-0.4832881, -1.157952, -2.253202, 1, 1, 1, 1, 1,
-0.482439, 0.4893132, 0.02489368, 1, 1, 1, 1, 1,
-0.4787348, -0.2168553, -2.944953, 0, 0, 1, 1, 1,
-0.475945, -1.271192, -3.211186, 1, 0, 0, 1, 1,
-0.4723585, -1.781261, -4.462113, 1, 0, 0, 1, 1,
-0.4720798, -0.2572421, -2.254623, 1, 0, 0, 1, 1,
-0.4712529, 0.1822484, -0.9430099, 1, 0, 0, 1, 1,
-0.46977, 0.2041967, -1.774866, 1, 0, 0, 1, 1,
-0.4676884, 0.0006821679, 0.2198885, 0, 0, 0, 1, 1,
-0.464974, -0.1804764, -0.5475954, 0, 0, 0, 1, 1,
-0.4639978, 0.2772621, -0.8818917, 0, 0, 0, 1, 1,
-0.4630225, 0.3049454, -2.150371, 0, 0, 0, 1, 1,
-0.4620905, -0.322209, -1.932335, 0, 0, 0, 1, 1,
-0.4583279, 0.3253955, 0.2000256, 0, 0, 0, 1, 1,
-0.4560434, -0.7976303, -1.471653, 0, 0, 0, 1, 1,
-0.4528174, -0.7455527, -1.090805, 1, 1, 1, 1, 1,
-0.4488826, -1.008394, -3.426224, 1, 1, 1, 1, 1,
-0.4460606, -0.8307487, -2.714058, 1, 1, 1, 1, 1,
-0.443398, 1.519014, 0.151528, 1, 1, 1, 1, 1,
-0.4384573, 0.9661643, 0.9882436, 1, 1, 1, 1, 1,
-0.4357059, -1.021333, -2.048356, 1, 1, 1, 1, 1,
-0.4344875, 0.3845989, -2.436717, 1, 1, 1, 1, 1,
-0.4341739, -0.144472, -0.7202683, 1, 1, 1, 1, 1,
-0.4339528, -0.6110361, -1.708238, 1, 1, 1, 1, 1,
-0.4322448, -0.6143659, -3.257843, 1, 1, 1, 1, 1,
-0.4281914, 0.9327791, -0.6719114, 1, 1, 1, 1, 1,
-0.4267009, 0.4520535, -0.8227705, 1, 1, 1, 1, 1,
-0.4224048, -0.09074356, -1.318766, 1, 1, 1, 1, 1,
-0.4222792, -1.343823, -0.8397318, 1, 1, 1, 1, 1,
-0.4193266, 0.4300921, -1.728126, 1, 1, 1, 1, 1,
-0.4179195, -0.140984, -2.569679, 0, 0, 1, 1, 1,
-0.4172499, 0.5199134, -1.592982, 1, 0, 0, 1, 1,
-0.4168257, 0.6329811, 1.695379, 1, 0, 0, 1, 1,
-0.4158984, -0.8400657, -0.8810782, 1, 0, 0, 1, 1,
-0.406177, 0.3837219, -2.080016, 1, 0, 0, 1, 1,
-0.4020213, -0.5799773, -3.153473, 1, 0, 0, 1, 1,
-0.4010742, -1.028443, -2.049447, 0, 0, 0, 1, 1,
-0.4008403, 1.713369, -0.8797787, 0, 0, 0, 1, 1,
-0.4001193, -0.1685797, -2.049196, 0, 0, 0, 1, 1,
-0.3978326, 1.143143, 0.9258903, 0, 0, 0, 1, 1,
-0.3977231, 0.8295084, 0.4479124, 0, 0, 0, 1, 1,
-0.3879387, 0.2125891, -0.5334927, 0, 0, 0, 1, 1,
-0.3856003, -0.0987811, -1.058991, 0, 0, 0, 1, 1,
-0.3753059, -0.9271015, -2.512817, 1, 1, 1, 1, 1,
-0.374306, -0.9670709, -3.383166, 1, 1, 1, 1, 1,
-0.3663551, 0.3423928, 0.04574532, 1, 1, 1, 1, 1,
-0.3570606, -0.5816898, -2.586443, 1, 1, 1, 1, 1,
-0.3525448, 0.5304535, -2.303583, 1, 1, 1, 1, 1,
-0.3505639, 0.4425299, -0.07052743, 1, 1, 1, 1, 1,
-0.3457144, 0.6863741, -0.1798153, 1, 1, 1, 1, 1,
-0.3326908, 1.336872, -0.8154818, 1, 1, 1, 1, 1,
-0.3317152, 0.68281, -0.07085694, 1, 1, 1, 1, 1,
-0.3247571, 1.185416, -0.2877793, 1, 1, 1, 1, 1,
-0.3237696, -0.4010029, -2.84197, 1, 1, 1, 1, 1,
-0.3229326, -1.938782, -2.452151, 1, 1, 1, 1, 1,
-0.3208777, -0.6367133, -2.836357, 1, 1, 1, 1, 1,
-0.3168102, 0.2644706, -0.4193007, 1, 1, 1, 1, 1,
-0.310332, 1.401634, 0.2666879, 1, 1, 1, 1, 1,
-0.3044437, 1.030682, 1.400802, 0, 0, 1, 1, 1,
-0.3036873, -0.2629603, -2.032404, 1, 0, 0, 1, 1,
-0.301074, 2.475153, -0.7880152, 1, 0, 0, 1, 1,
-0.301049, 1.117152, -1.180612, 1, 0, 0, 1, 1,
-0.2989218, 1.830977, 0.1658559, 1, 0, 0, 1, 1,
-0.2972268, -1.002393, -3.885186, 1, 0, 0, 1, 1,
-0.2950642, 1.02809, -0.4887993, 0, 0, 0, 1, 1,
-0.2940234, -0.7160749, -3.225477, 0, 0, 0, 1, 1,
-0.2912487, -0.1655788, -2.838741, 0, 0, 0, 1, 1,
-0.2886572, -0.02457681, -2.94023, 0, 0, 0, 1, 1,
-0.2869731, -1.256684, -2.961151, 0, 0, 0, 1, 1,
-0.285617, 0.5097234, -0.05338328, 0, 0, 0, 1, 1,
-0.2796466, 0.1862013, -0.2680688, 0, 0, 0, 1, 1,
-0.2768753, -1.507349, -1.640125, 1, 1, 1, 1, 1,
-0.2765145, -0.5834639, -2.491781, 1, 1, 1, 1, 1,
-0.2746996, 0.8771047, 0.3485636, 1, 1, 1, 1, 1,
-0.2744659, 1.381942, 0.805733, 1, 1, 1, 1, 1,
-0.2733994, -1.227224, -6.517624, 1, 1, 1, 1, 1,
-0.2720349, 0.09850928, 0.514288, 1, 1, 1, 1, 1,
-0.2718313, -1.94589, -2.148357, 1, 1, 1, 1, 1,
-0.2694843, -0.8461252, -2.384995, 1, 1, 1, 1, 1,
-0.2687536, 0.581753, -2.703227, 1, 1, 1, 1, 1,
-0.2673813, 0.5604038, -0.09663352, 1, 1, 1, 1, 1,
-0.2641333, 1.120679, -0.882054, 1, 1, 1, 1, 1,
-0.2594546, -0.3143253, -1.154519, 1, 1, 1, 1, 1,
-0.2549945, -2.322742, -3.144964, 1, 1, 1, 1, 1,
-0.253866, -0.1909451, -2.379014, 1, 1, 1, 1, 1,
-0.2513639, 0.3638685, 0.9272153, 1, 1, 1, 1, 1,
-0.2504174, -1.251866, -2.936186, 0, 0, 1, 1, 1,
-0.24829, -0.335049, -0.7296525, 1, 0, 0, 1, 1,
-0.2481402, 1.543872, 0.01861295, 1, 0, 0, 1, 1,
-0.2474989, 0.3548225, 1.330258, 1, 0, 0, 1, 1,
-0.2378187, -0.8280605, -2.179998, 1, 0, 0, 1, 1,
-0.237322, -0.5013273, -2.00367, 1, 0, 0, 1, 1,
-0.2369274, 0.02433776, -1.157318, 0, 0, 0, 1, 1,
-0.2360422, 0.1450558, -1.538741, 0, 0, 0, 1, 1,
-0.2329225, 1.322199, -0.132542, 0, 0, 0, 1, 1,
-0.2318092, -0.9996513, -1.793145, 0, 0, 0, 1, 1,
-0.2316658, 0.4881882, -1.58445, 0, 0, 0, 1, 1,
-0.2288199, 0.2511384, -1.073225, 0, 0, 0, 1, 1,
-0.2248158, -0.3048274, -3.278426, 0, 0, 0, 1, 1,
-0.2246605, 0.2620489, -2.235116, 1, 1, 1, 1, 1,
-0.223079, -0.921219, -2.308521, 1, 1, 1, 1, 1,
-0.220414, 0.5767359, -0.1931931, 1, 1, 1, 1, 1,
-0.2189334, -1.063434, -2.734213, 1, 1, 1, 1, 1,
-0.2169375, 0.7837871, -0.4289105, 1, 1, 1, 1, 1,
-0.2158876, -0.03004548, -1.265421, 1, 1, 1, 1, 1,
-0.215013, -0.4115905, -1.474622, 1, 1, 1, 1, 1,
-0.2135024, 0.9249892, -0.408109, 1, 1, 1, 1, 1,
-0.2111458, 0.003958306, -1.138425, 1, 1, 1, 1, 1,
-0.2094899, 0.02908875, -3.1512, 1, 1, 1, 1, 1,
-0.2054718, -1.36493, -3.556055, 1, 1, 1, 1, 1,
-0.201032, -0.3014462, -2.933113, 1, 1, 1, 1, 1,
-0.1989022, -0.5434259, -2.874516, 1, 1, 1, 1, 1,
-0.1963222, 0.02221051, -2.889502, 1, 1, 1, 1, 1,
-0.1958917, 0.5968641, -0.5455822, 1, 1, 1, 1, 1,
-0.1955444, -1.768216, -2.015175, 0, 0, 1, 1, 1,
-0.1941868, -1.488642, -2.622348, 1, 0, 0, 1, 1,
-0.1941541, 1.16642, 1.987957, 1, 0, 0, 1, 1,
-0.1929347, -0.4611325, -2.754639, 1, 0, 0, 1, 1,
-0.1924269, 0.5298573, 0.07395953, 1, 0, 0, 1, 1,
-0.1922327, 0.9387711, 0.4336275, 1, 0, 0, 1, 1,
-0.1918391, -0.4524021, -2.443947, 0, 0, 0, 1, 1,
-0.1908291, -1.778328, -4.056027, 0, 0, 0, 1, 1,
-0.1847615, 0.3962732, -0.04322427, 0, 0, 0, 1, 1,
-0.1780719, -0.735724, -4.177402, 0, 0, 0, 1, 1,
-0.1774013, -1.031589, -5.909782, 0, 0, 0, 1, 1,
-0.1764146, 0.2981734, 0.2244663, 0, 0, 0, 1, 1,
-0.174974, -0.326892, -2.626666, 0, 0, 0, 1, 1,
-0.1645765, -0.4234346, -4.458317, 1, 1, 1, 1, 1,
-0.1635289, -1.684394, -1.302832, 1, 1, 1, 1, 1,
-0.1627902, -2.099664, -1.242794, 1, 1, 1, 1, 1,
-0.1626122, -1.565632, -3.893229, 1, 1, 1, 1, 1,
-0.1513429, 0.5712764, -1.876823, 1, 1, 1, 1, 1,
-0.1452094, 1.198891, -0.9077854, 1, 1, 1, 1, 1,
-0.1450868, 0.4041077, -0.4370021, 1, 1, 1, 1, 1,
-0.1433017, -0.5383598, -1.637121, 1, 1, 1, 1, 1,
-0.142593, 1.40106, 0.6941022, 1, 1, 1, 1, 1,
-0.1393772, -0.09559694, -0.5813234, 1, 1, 1, 1, 1,
-0.1388115, 0.0292752, -0.8954957, 1, 1, 1, 1, 1,
-0.1386067, 1.00952, 0.9059962, 1, 1, 1, 1, 1,
-0.1373769, -0.240427, -1.306733, 1, 1, 1, 1, 1,
-0.1355249, -0.4182971, -3.457476, 1, 1, 1, 1, 1,
-0.1341272, 1.798009, 0.752553, 1, 1, 1, 1, 1,
-0.131514, 1.403654, -1.431946, 0, 0, 1, 1, 1,
-0.1292439, -2.225674, -2.033445, 1, 0, 0, 1, 1,
-0.1274912, -0.1669472, -2.107025, 1, 0, 0, 1, 1,
-0.126068, 0.6715434, -0.0138267, 1, 0, 0, 1, 1,
-0.1258957, -0.7473197, -2.265302, 1, 0, 0, 1, 1,
-0.1241202, 1.622016, 1.765144, 1, 0, 0, 1, 1,
-0.1232004, 0.7188427, 1.442868, 0, 0, 0, 1, 1,
-0.1097952, -0.9268655, -5.215035, 0, 0, 0, 1, 1,
-0.1041583, 0.1915271, -1.535595, 0, 0, 0, 1, 1,
-0.1039763, -0.6218804, -2.236584, 0, 0, 0, 1, 1,
-0.1031299, -1.435992, -3.903617, 0, 0, 0, 1, 1,
-0.09974279, 1.208466, -0.4820946, 0, 0, 0, 1, 1,
-0.0995837, 0.1288599, -0.508663, 0, 0, 0, 1, 1,
-0.09679417, 0.5342237, 1.359394, 1, 1, 1, 1, 1,
-0.09578239, 0.5392236, -0.3364823, 1, 1, 1, 1, 1,
-0.09295101, 0.1431575, -1.290812, 1, 1, 1, 1, 1,
-0.08974402, -0.9337662, -2.591302, 1, 1, 1, 1, 1,
-0.08691288, -0.9408298, -1.947085, 1, 1, 1, 1, 1,
-0.08635174, -0.009498809, -2.195658, 1, 1, 1, 1, 1,
-0.08389186, -0.4071579, -1.895562, 1, 1, 1, 1, 1,
-0.08149906, 0.2425883, 0.6790575, 1, 1, 1, 1, 1,
-0.07665137, 1.614781, -1.203264, 1, 1, 1, 1, 1,
-0.07649978, -1.619781, -1.980236, 1, 1, 1, 1, 1,
-0.07508872, 1.108378, 0.1452897, 1, 1, 1, 1, 1,
-0.0749984, 0.3533397, 0.478213, 1, 1, 1, 1, 1,
-0.07424126, -0.04633039, -0.5390058, 1, 1, 1, 1, 1,
-0.0734662, 0.277572, 0.2873547, 1, 1, 1, 1, 1,
-0.0733855, 0.2258874, -0.7248596, 1, 1, 1, 1, 1,
-0.07334957, -0.4938582, -2.838173, 0, 0, 1, 1, 1,
-0.07279772, 0.258506, 0.5112799, 1, 0, 0, 1, 1,
-0.07049127, -1.628668, -3.639071, 1, 0, 0, 1, 1,
-0.06864429, -0.9164081, -4.169961, 1, 0, 0, 1, 1,
-0.06863816, 0.6808454, 0.3600323, 1, 0, 0, 1, 1,
-0.0671038, -0.2235054, -4.394272, 1, 0, 0, 1, 1,
-0.0564055, -0.04195233, -2.671722, 0, 0, 0, 1, 1,
-0.0466307, -0.3156151, -3.24431, 0, 0, 0, 1, 1,
-0.04320819, -1.108428, -2.424146, 0, 0, 0, 1, 1,
-0.03999412, -0.5755715, -3.010058, 0, 0, 0, 1, 1,
-0.0396239, -0.2614858, -3.075444, 0, 0, 0, 1, 1,
-0.03802279, -0.1429902, -2.134755, 0, 0, 0, 1, 1,
-0.03322795, 0.7014795, 0.5789604, 0, 0, 0, 1, 1,
-0.02930225, -0.3848647, -2.229429, 1, 1, 1, 1, 1,
-0.02695389, -1.005331, -2.855994, 1, 1, 1, 1, 1,
-0.02482833, -0.275929, -2.178887, 1, 1, 1, 1, 1,
-0.02308451, -0.3163309, -2.280282, 1, 1, 1, 1, 1,
-0.02010802, -0.6577523, -2.848524, 1, 1, 1, 1, 1,
-0.009010668, 1.724258, -1.151768, 1, 1, 1, 1, 1,
-0.00178008, 0.8395417, 1.001985, 1, 1, 1, 1, 1,
0.002888249, -0.6630797, 2.828047, 1, 1, 1, 1, 1,
0.005272013, 0.6660566, 0.519697, 1, 1, 1, 1, 1,
0.01377577, 1.101115, 0.7678885, 1, 1, 1, 1, 1,
0.01636643, -1.577059, 2.502653, 1, 1, 1, 1, 1,
0.01724202, 0.1874111, -1.014448, 1, 1, 1, 1, 1,
0.01787985, 0.3480732, -0.9096458, 1, 1, 1, 1, 1,
0.01988137, -0.4590939, 3.143885, 1, 1, 1, 1, 1,
0.02110893, -0.2447724, 4.131171, 1, 1, 1, 1, 1,
0.02683719, 0.03931969, 0.3485044, 0, 0, 1, 1, 1,
0.02687024, -1.25997, 3.151407, 1, 0, 0, 1, 1,
0.03070378, -0.02957525, 1.611626, 1, 0, 0, 1, 1,
0.03662809, 1.483956, 1.867062, 1, 0, 0, 1, 1,
0.04162739, -1.01854, 2.904957, 1, 0, 0, 1, 1,
0.05260657, -0.1441463, 2.464575, 1, 0, 0, 1, 1,
0.0531061, 0.9966857, -0.1444222, 0, 0, 0, 1, 1,
0.05903007, -0.1999391, 1.223572, 0, 0, 0, 1, 1,
0.0605059, -0.1617652, 2.443269, 0, 0, 0, 1, 1,
0.06509191, 0.8885008, 0.6945031, 0, 0, 0, 1, 1,
0.06656531, -1.606344, 4.352478, 0, 0, 0, 1, 1,
0.06686158, -0.3526843, 3.126682, 0, 0, 0, 1, 1,
0.06983022, 1.074471, 0.552503, 0, 0, 0, 1, 1,
0.06999053, 0.5918166, 1.718976, 1, 1, 1, 1, 1,
0.07592014, -0.3580488, 3.38316, 1, 1, 1, 1, 1,
0.0767111, 0.2932619, 0.005667896, 1, 1, 1, 1, 1,
0.07734643, 1.091313, 0.05076022, 1, 1, 1, 1, 1,
0.07892738, 1.369477, 0.5619279, 1, 1, 1, 1, 1,
0.08354191, -1.41221, 2.179105, 1, 1, 1, 1, 1,
0.08463869, -0.2364261, 3.058637, 1, 1, 1, 1, 1,
0.0891118, -0.4458465, 3.850326, 1, 1, 1, 1, 1,
0.09013772, 1.632404, 0.07833903, 1, 1, 1, 1, 1,
0.09061151, -0.4224463, 4.127491, 1, 1, 1, 1, 1,
0.09075225, 1.448739, -0.6436216, 1, 1, 1, 1, 1,
0.09169374, 0.8665923, 1.166132, 1, 1, 1, 1, 1,
0.09468579, -1.212735, 3.209077, 1, 1, 1, 1, 1,
0.09607583, 0.8095154, 0.5955995, 1, 1, 1, 1, 1,
0.1027918, 1.400356, 0.01213475, 1, 1, 1, 1, 1,
0.104163, -0.3564245, 3.286826, 0, 0, 1, 1, 1,
0.1049335, 0.5007233, -1.064469, 1, 0, 0, 1, 1,
0.1082417, 0.359835, -0.6199504, 1, 0, 0, 1, 1,
0.1094946, 1.066418, -0.2180365, 1, 0, 0, 1, 1,
0.1108045, 1.392396, -0.311024, 1, 0, 0, 1, 1,
0.1123526, 1.572944, -0.4933096, 1, 0, 0, 1, 1,
0.1244906, 0.1257631, 0.2492712, 0, 0, 0, 1, 1,
0.1252765, -1.292155, 2.484007, 0, 0, 0, 1, 1,
0.1257664, -0.07810804, 3.531478, 0, 0, 0, 1, 1,
0.1271946, 0.3289829, 1.724846, 0, 0, 0, 1, 1,
0.1272936, -0.03584265, 3.715367, 0, 0, 0, 1, 1,
0.1285352, -0.6038489, 3.360055, 0, 0, 0, 1, 1,
0.1297556, -0.05080815, 0.6175467, 0, 0, 0, 1, 1,
0.1303576, 0.09742336, 1.133187, 1, 1, 1, 1, 1,
0.1334755, 2.124865, -0.4041032, 1, 1, 1, 1, 1,
0.1337702, -0.1182657, 2.260385, 1, 1, 1, 1, 1,
0.1353634, -1.225749, 3.709902, 1, 1, 1, 1, 1,
0.1370443, 1.923344, 1.141336, 1, 1, 1, 1, 1,
0.1374068, 0.8024263, 1.527066, 1, 1, 1, 1, 1,
0.1391394, -0.1385767, 3.198728, 1, 1, 1, 1, 1,
0.139295, -1.046104, 1.652727, 1, 1, 1, 1, 1,
0.1402358, 0.588195, -1.309212, 1, 1, 1, 1, 1,
0.1420044, 1.163164, -0.4641441, 1, 1, 1, 1, 1,
0.1465747, 1.16139, -1.555121, 1, 1, 1, 1, 1,
0.1480385, 1.099134, 0.5337136, 1, 1, 1, 1, 1,
0.1483106, 1.501662, -0.3916201, 1, 1, 1, 1, 1,
0.1518584, 1.635349, -0.2551134, 1, 1, 1, 1, 1,
0.1520671, 0.7938969, -1.558812, 1, 1, 1, 1, 1,
0.157265, 0.7358486, 0.07584979, 0, 0, 1, 1, 1,
0.1574252, -1.101919, 3.289744, 1, 0, 0, 1, 1,
0.1592115, -0.1531762, 2.727814, 1, 0, 0, 1, 1,
0.1622908, -1.206751, 3.726993, 1, 0, 0, 1, 1,
0.1645671, -0.4368965, 3.845596, 1, 0, 0, 1, 1,
0.1661525, -1.213738, 2.879793, 1, 0, 0, 1, 1,
0.1663107, -0.6817632, 1.713966, 0, 0, 0, 1, 1,
0.1695739, 1.368041, -0.7813947, 0, 0, 0, 1, 1,
0.1741306, 1.273562, 1.461974, 0, 0, 0, 1, 1,
0.1768583, -0.2580272, 1.73652, 0, 0, 0, 1, 1,
0.1786207, -0.2701214, 3.304147, 0, 0, 0, 1, 1,
0.1836375, 1.286826, 1.050505, 0, 0, 0, 1, 1,
0.186909, 0.761034, -0.08144748, 0, 0, 0, 1, 1,
0.1873936, 0.1641524, 2.537079, 1, 1, 1, 1, 1,
0.1891016, -1.121419, 2.832674, 1, 1, 1, 1, 1,
0.1933308, 0.1725926, 1.487168, 1, 1, 1, 1, 1,
0.1946782, 1.188197, -1.763868, 1, 1, 1, 1, 1,
0.1951545, 1.840821, 0.5097557, 1, 1, 1, 1, 1,
0.1987978, -0.5531913, 3.869506, 1, 1, 1, 1, 1,
0.1998654, 1.325634, 1.180991, 1, 1, 1, 1, 1,
0.2003282, -1.038209, 1.307847, 1, 1, 1, 1, 1,
0.2035871, 0.8670644, -0.7125739, 1, 1, 1, 1, 1,
0.2077497, -1.127715, 2.232917, 1, 1, 1, 1, 1,
0.2091173, -0.3292488, 4.489357, 1, 1, 1, 1, 1,
0.2118859, 1.060739, 0.5707547, 1, 1, 1, 1, 1,
0.2161307, 0.7887893, 0.5992054, 1, 1, 1, 1, 1,
0.2172908, 0.3709342, 2.863045, 1, 1, 1, 1, 1,
0.2213076, -0.3645735, 3.453826, 1, 1, 1, 1, 1,
0.2218374, 0.9525464, 1.397636, 0, 0, 1, 1, 1,
0.2239163, 0.02934056, 2.610381, 1, 0, 0, 1, 1,
0.224038, 1.175653, -0.8571313, 1, 0, 0, 1, 1,
0.2261031, 0.6742729, 1.499831, 1, 0, 0, 1, 1,
0.228971, 0.9882478, 1.151283, 1, 0, 0, 1, 1,
0.2323953, 1.447876, 0.6310688, 1, 0, 0, 1, 1,
0.2357671, -0.402806, 3.078853, 0, 0, 0, 1, 1,
0.2360721, -0.06968208, 2.075877, 0, 0, 0, 1, 1,
0.236248, -0.3351362, 3.425699, 0, 0, 0, 1, 1,
0.2386386, 0.7667894, -0.05151775, 0, 0, 0, 1, 1,
0.2418077, 0.02246455, 2.014641, 0, 0, 0, 1, 1,
0.2421689, 0.4846425, 1.389245, 0, 0, 0, 1, 1,
0.2444343, -2.422974, 2.585297, 0, 0, 0, 1, 1,
0.2455027, 1.121662, -0.2344859, 1, 1, 1, 1, 1,
0.2495749, 1.255163, 0.7107786, 1, 1, 1, 1, 1,
0.2565661, 0.7788263, 1.733605, 1, 1, 1, 1, 1,
0.2591913, 1.431239, 0.6765598, 1, 1, 1, 1, 1,
0.2600601, -0.503373, 1.766698, 1, 1, 1, 1, 1,
0.2608359, -1.547652, 4.209278, 1, 1, 1, 1, 1,
0.2610417, 1.065077, 1.669972, 1, 1, 1, 1, 1,
0.2610502, -0.6141812, 2.829787, 1, 1, 1, 1, 1,
0.2621599, -0.1478222, 1.531318, 1, 1, 1, 1, 1,
0.2666004, 1.527643, -0.008362329, 1, 1, 1, 1, 1,
0.2721006, 0.2332027, 1.22648, 1, 1, 1, 1, 1,
0.2745714, 1.074263, 0.7512138, 1, 1, 1, 1, 1,
0.2818201, -0.3131937, 2.226656, 1, 1, 1, 1, 1,
0.2821204, 0.7349185, 0.2136087, 1, 1, 1, 1, 1,
0.2867094, 1.202583, 0.1124524, 1, 1, 1, 1, 1,
0.2877901, 0.569324, -0.5067487, 0, 0, 1, 1, 1,
0.2883944, -0.4354451, 2.275893, 1, 0, 0, 1, 1,
0.290321, 0.4519791, 0.2962776, 1, 0, 0, 1, 1,
0.2903473, -0.5250095, 3.443111, 1, 0, 0, 1, 1,
0.2937353, -0.932047, 2.041037, 1, 0, 0, 1, 1,
0.3009808, -0.712064, 3.132582, 1, 0, 0, 1, 1,
0.3011777, 0.9136369, -0.7259662, 0, 0, 0, 1, 1,
0.3022958, 0.9763902, 1.299124, 0, 0, 0, 1, 1,
0.3074859, 0.08249061, 0.766407, 0, 0, 0, 1, 1,
0.3099766, 0.4908597, -0.5806102, 0, 0, 0, 1, 1,
0.3137726, -0.7843135, 3.027618, 0, 0, 0, 1, 1,
0.3152109, -2.48912, 4.237518, 0, 0, 0, 1, 1,
0.315976, -0.1747973, 2.727927, 0, 0, 0, 1, 1,
0.3160513, -0.6445922, 1.733026, 1, 1, 1, 1, 1,
0.3179716, 0.06271173, 0.9436251, 1, 1, 1, 1, 1,
0.3213243, -1.458132, 3.730516, 1, 1, 1, 1, 1,
0.3223669, 1.542871, 0.9747707, 1, 1, 1, 1, 1,
0.3298949, 1.121481, 0.8439072, 1, 1, 1, 1, 1,
0.3308051, -0.1679741, 0.8301176, 1, 1, 1, 1, 1,
0.3313837, 1.497817, 0.9200958, 1, 1, 1, 1, 1,
0.3336451, 1.685383, -0.9252549, 1, 1, 1, 1, 1,
0.338697, 0.3571533, 0.8595076, 1, 1, 1, 1, 1,
0.3394812, -0.224608, 3.156453, 1, 1, 1, 1, 1,
0.3397974, -1.167935, 4.947183, 1, 1, 1, 1, 1,
0.3397991, -1.34368, 3.490509, 1, 1, 1, 1, 1,
0.3398541, -0.6512889, 0.6586608, 1, 1, 1, 1, 1,
0.3419597, -2.877771, 3.949663, 1, 1, 1, 1, 1,
0.3422511, -0.9787619, 2.806515, 1, 1, 1, 1, 1,
0.342912, 0.3440869, -0.3517826, 0, 0, 1, 1, 1,
0.3440827, 0.9898438, -0.02704373, 1, 0, 0, 1, 1,
0.3462435, 0.5317976, 1.519988, 1, 0, 0, 1, 1,
0.3464518, -1.644024, 2.712343, 1, 0, 0, 1, 1,
0.3487086, -0.4742438, 2.213224, 1, 0, 0, 1, 1,
0.3501073, 0.6587271, 0.2766079, 1, 0, 0, 1, 1,
0.3577725, -0.3711181, 2.435772, 0, 0, 0, 1, 1,
0.3583695, 0.7837873, 1.338797, 0, 0, 0, 1, 1,
0.3593584, -1.092144, 2.864321, 0, 0, 0, 1, 1,
0.3602455, 0.474917, 0.9027781, 0, 0, 0, 1, 1,
0.3649985, 0.4754682, 0.9090391, 0, 0, 0, 1, 1,
0.3656681, -0.8948882, 3.11975, 0, 0, 0, 1, 1,
0.3696006, -0.675045, 2.992227, 0, 0, 0, 1, 1,
0.3697949, -1.192609, 2.591574, 1, 1, 1, 1, 1,
0.3710878, -0.4416375, 3.742473, 1, 1, 1, 1, 1,
0.372297, 0.1427373, 0.5898958, 1, 1, 1, 1, 1,
0.3773841, 0.1705083, 2.804416, 1, 1, 1, 1, 1,
0.3780894, -0.08873434, 2.608129, 1, 1, 1, 1, 1,
0.3817425, -1.737583, 2.157079, 1, 1, 1, 1, 1,
0.3841668, 0.7212935, 0.2740707, 1, 1, 1, 1, 1,
0.3844943, -0.8254173, 0.9150506, 1, 1, 1, 1, 1,
0.3886416, -0.3971084, 0.4162779, 1, 1, 1, 1, 1,
0.389191, 0.6610597, -0.4258842, 1, 1, 1, 1, 1,
0.3895832, -0.4177258, 2.464459, 1, 1, 1, 1, 1,
0.3896023, 0.6528923, 0.4233101, 1, 1, 1, 1, 1,
0.3934093, 0.5845582, -0.481668, 1, 1, 1, 1, 1,
0.3963915, -0.5265318, 1.777716, 1, 1, 1, 1, 1,
0.3975194, 0.6251111, 1.246405, 1, 1, 1, 1, 1,
0.4073802, -0.7991192, 3.453663, 0, 0, 1, 1, 1,
0.4078692, 0.3232013, 1.488291, 1, 0, 0, 1, 1,
0.4079681, 0.5349045, 0.05031032, 1, 0, 0, 1, 1,
0.4083689, 1.510369, 1.579045, 1, 0, 0, 1, 1,
0.4101695, -0.664221, 3.305124, 1, 0, 0, 1, 1,
0.4125819, 0.2186018, 1.759408, 1, 0, 0, 1, 1,
0.4127819, -0.04837447, 1.492344, 0, 0, 0, 1, 1,
0.4161275, -1.433213, 3.35427, 0, 0, 0, 1, 1,
0.4164502, -0.5058151, 2.594935, 0, 0, 0, 1, 1,
0.4167648, 0.2787736, 0.5260501, 0, 0, 0, 1, 1,
0.417037, 0.8854878, 3.005448, 0, 0, 0, 1, 1,
0.4196869, -0.9495701, 4.017834, 0, 0, 0, 1, 1,
0.4209241, -0.2730749, 2.150656, 0, 0, 0, 1, 1,
0.4209971, -1.030426, 2.787059, 1, 1, 1, 1, 1,
0.4213265, 2.033775, 0.4917883, 1, 1, 1, 1, 1,
0.4215581, -0.4712901, 3.217114, 1, 1, 1, 1, 1,
0.4252733, 0.07369791, 2.962385, 1, 1, 1, 1, 1,
0.4264526, -1.552195, 1.735599, 1, 1, 1, 1, 1,
0.4313025, -1.502596, 0.5280887, 1, 1, 1, 1, 1,
0.4316314, 1.420995, -1.144725, 1, 1, 1, 1, 1,
0.4325839, 1.290648, -1.038942, 1, 1, 1, 1, 1,
0.4347238, -0.01573222, 2.242783, 1, 1, 1, 1, 1,
0.4407949, 2.003081, 0.3602861, 1, 1, 1, 1, 1,
0.4496915, -0.3243048, 2.340277, 1, 1, 1, 1, 1,
0.4497242, -0.7741362, 3.924397, 1, 1, 1, 1, 1,
0.450669, 1.305126, 1.330617, 1, 1, 1, 1, 1,
0.4524082, 1.386405, 0.8029078, 1, 1, 1, 1, 1,
0.4560961, -1.302014, 3.373242, 1, 1, 1, 1, 1,
0.4571556, 0.1725413, -0.0632974, 0, 0, 1, 1, 1,
0.4597633, 0.9995574, 1.892229, 1, 0, 0, 1, 1,
0.4601266, 0.6454408, 0.8431002, 1, 0, 0, 1, 1,
0.4657454, 0.3422423, 0.7077678, 1, 0, 0, 1, 1,
0.4778977, -1.117335, 2.7103, 1, 0, 0, 1, 1,
0.4878665, 0.3253144, -0.2871967, 1, 0, 0, 1, 1,
0.4894739, -0.09159871, 1.542636, 0, 0, 0, 1, 1,
0.497926, 0.06915826, 2.341143, 0, 0, 0, 1, 1,
0.5038999, 1.701287, -1.359665, 0, 0, 0, 1, 1,
0.5043209, 0.9700546, 0.4406302, 0, 0, 0, 1, 1,
0.5062869, -0.07109281, 2.433666, 0, 0, 0, 1, 1,
0.5091387, 0.269757, -0.9251662, 0, 0, 0, 1, 1,
0.5159159, 1.454186, 1.109184, 0, 0, 0, 1, 1,
0.5179066, -0.159937, 1.708257, 1, 1, 1, 1, 1,
0.5197737, -1.983482, 2.533363, 1, 1, 1, 1, 1,
0.5232613, -0.6444525, 1.877384, 1, 1, 1, 1, 1,
0.5244686, 0.9970082, -0.5360014, 1, 1, 1, 1, 1,
0.525341, 0.4774444, 0.2380759, 1, 1, 1, 1, 1,
0.5288047, -0.1114635, 2.122857, 1, 1, 1, 1, 1,
0.5314469, -0.5847284, 2.444773, 1, 1, 1, 1, 1,
0.5323692, 0.6360353, -0.9063938, 1, 1, 1, 1, 1,
0.5347451, 0.3820824, 0.5197785, 1, 1, 1, 1, 1,
0.5347829, 1.379124, 0.8252903, 1, 1, 1, 1, 1,
0.535333, -0.7133592, 3.672374, 1, 1, 1, 1, 1,
0.5355152, -1.11605, 3.65083, 1, 1, 1, 1, 1,
0.5390909, -0.4229955, 2.652263, 1, 1, 1, 1, 1,
0.5405928, 1.518833, 0.7192386, 1, 1, 1, 1, 1,
0.5406199, -1.130127, 1.978974, 1, 1, 1, 1, 1,
0.5459506, 0.424123, -1.237693, 0, 0, 1, 1, 1,
0.5462141, -1.340541, 2.728537, 1, 0, 0, 1, 1,
0.549754, -0.1854598, 2.961606, 1, 0, 0, 1, 1,
0.5561956, -0.4042709, 2.968243, 1, 0, 0, 1, 1,
0.5594356, -0.12483, 1.592445, 1, 0, 0, 1, 1,
0.5610754, 1.397123, 0.2279297, 1, 0, 0, 1, 1,
0.5611842, 1.469651, -0.1452109, 0, 0, 0, 1, 1,
0.5629631, -0.6471222, 3.985018, 0, 0, 0, 1, 1,
0.5679412, 0.761109, 0.5545833, 0, 0, 0, 1, 1,
0.5778614, 0.381152, 1.244968, 0, 0, 0, 1, 1,
0.5834843, -0.5215888, 3.213038, 0, 0, 0, 1, 1,
0.5858107, -1.57623, 6.607728, 0, 0, 0, 1, 1,
0.5867562, 1.294798, 2.334462, 0, 0, 0, 1, 1,
0.5875749, -0.960779, 2.266965, 1, 1, 1, 1, 1,
0.5984307, 0.967815, 0.1685427, 1, 1, 1, 1, 1,
0.5991676, -0.6019912, 2.149644, 1, 1, 1, 1, 1,
0.6071728, 1.621063, 1.03938, 1, 1, 1, 1, 1,
0.6101503, -1.461869, 2.610734, 1, 1, 1, 1, 1,
0.6240744, 0.7081881, 0.9451173, 1, 1, 1, 1, 1,
0.6245227, 0.6492589, 2.719167, 1, 1, 1, 1, 1,
0.6270827, -0.3890899, 2.129132, 1, 1, 1, 1, 1,
0.6299784, 0.3838363, -0.8467013, 1, 1, 1, 1, 1,
0.6307223, 0.09809791, 0.3647707, 1, 1, 1, 1, 1,
0.6309965, -1.180389, 2.585748, 1, 1, 1, 1, 1,
0.631075, 0.3186314, 1.961186, 1, 1, 1, 1, 1,
0.6316251, -0.5041115, 2.608953, 1, 1, 1, 1, 1,
0.6397664, 1.863485, -0.5534803, 1, 1, 1, 1, 1,
0.6415652, -0.04022947, 2.320086, 1, 1, 1, 1, 1,
0.6422972, 0.1337319, -0.0524704, 0, 0, 1, 1, 1,
0.6482642, 2.842164, 0.6657001, 1, 0, 0, 1, 1,
0.6582565, -0.721805, 2.342684, 1, 0, 0, 1, 1,
0.6598988, 1.290158, 0.6253272, 1, 0, 0, 1, 1,
0.6609132, -0.8066771, 2.844543, 1, 0, 0, 1, 1,
0.662284, 0.3269962, -0.09515662, 1, 0, 0, 1, 1,
0.6657434, -1.395089, 1.913854, 0, 0, 0, 1, 1,
0.6710533, 1.460321, 0.4765212, 0, 0, 0, 1, 1,
0.6714454, 0.7854133, 0.7833143, 0, 0, 0, 1, 1,
0.6818074, -0.5180825, 1.962904, 0, 0, 0, 1, 1,
0.6821399, 1.676916, 0.6560258, 0, 0, 0, 1, 1,
0.6843783, 0.8536952, 1.279379, 0, 0, 0, 1, 1,
0.687403, -0.5932266, 3.958886, 0, 0, 0, 1, 1,
0.6883178, 0.34671, -0.3429222, 1, 1, 1, 1, 1,
0.6911003, -1.614309, 3.958572, 1, 1, 1, 1, 1,
0.6963627, -0.5587029, 1.708327, 1, 1, 1, 1, 1,
0.6979289, 1.43238, 0.05170751, 1, 1, 1, 1, 1,
0.7020561, 0.7780771, 0.5877163, 1, 1, 1, 1, 1,
0.7085029, 0.6944482, 0.2411499, 1, 1, 1, 1, 1,
0.709079, -1.269715, 2.818676, 1, 1, 1, 1, 1,
0.72584, 0.4057279, 0.1126524, 1, 1, 1, 1, 1,
0.7540997, 2.413263, 1.457401, 1, 1, 1, 1, 1,
0.7550198, -0.8682517, 1.522047, 1, 1, 1, 1, 1,
0.7597721, 1.733722, 2.371723, 1, 1, 1, 1, 1,
0.760626, 2.171929, 0.5762616, 1, 1, 1, 1, 1,
0.7643186, -0.3660913, 0.8125544, 1, 1, 1, 1, 1,
0.7658396, -0.5968391, 0.4191764, 1, 1, 1, 1, 1,
0.7748544, 2.846454, -0.6065719, 1, 1, 1, 1, 1,
0.777737, 2.251327, 0.01752922, 0, 0, 1, 1, 1,
0.7786794, 1.666451, 0.462855, 1, 0, 0, 1, 1,
0.7810633, 0.8685342, 0.1441633, 1, 0, 0, 1, 1,
0.7817535, 0.5110289, 1.2137, 1, 0, 0, 1, 1,
0.7818388, 0.5970368, 0.7818046, 1, 0, 0, 1, 1,
0.782972, -2.384478, 3.830091, 1, 0, 0, 1, 1,
0.7872914, 1.256342, 0.765027, 0, 0, 0, 1, 1,
0.7896757, 1.251718, 2.090699, 0, 0, 0, 1, 1,
0.7906722, 0.4542966, 2.877382, 0, 0, 0, 1, 1,
0.794857, -1.740689, 4.371963, 0, 0, 0, 1, 1,
0.7960799, -1.39731, 3.47389, 0, 0, 0, 1, 1,
0.797009, -1.549864, 0.4586573, 0, 0, 0, 1, 1,
0.8066496, 1.91145, 0.1515157, 0, 0, 0, 1, 1,
0.8076368, -0.08830047, 1.346744, 1, 1, 1, 1, 1,
0.8095672, -0.2729202, 1.177943, 1, 1, 1, 1, 1,
0.8150621, 0.8618394, 2.117032, 1, 1, 1, 1, 1,
0.8262305, -1.539986, 0.9677032, 1, 1, 1, 1, 1,
0.827596, 1.092531, 1.502979, 1, 1, 1, 1, 1,
0.8286743, -2.063889, 2.59908, 1, 1, 1, 1, 1,
0.8319416, 0.7351264, 2.108993, 1, 1, 1, 1, 1,
0.8320131, 0.5643359, 2.368234, 1, 1, 1, 1, 1,
0.8322781, -0.3916527, 0.8399037, 1, 1, 1, 1, 1,
0.8432307, -0.687295, 3.713372, 1, 1, 1, 1, 1,
0.8446401, -1.444154, 2.538512, 1, 1, 1, 1, 1,
0.8460436, 0.1723635, 1.726297, 1, 1, 1, 1, 1,
0.8531185, 1.848875, -0.030135, 1, 1, 1, 1, 1,
0.8532081, -0.7371727, 0.01578625, 1, 1, 1, 1, 1,
0.8535523, 1.229461, 0.6450804, 1, 1, 1, 1, 1,
0.8592811, -0.2578035, 4.171306, 0, 0, 1, 1, 1,
0.8594988, 0.5695639, 1.332032, 1, 0, 0, 1, 1,
0.8639728, -0.3075449, 0.518021, 1, 0, 0, 1, 1,
0.865695, 0.6503576, 0.559045, 1, 0, 0, 1, 1,
0.8794965, 1.414448, 2.60297, 1, 0, 0, 1, 1,
0.8844066, -2.208127, 1.86662, 1, 0, 0, 1, 1,
0.8867142, 1.165626, 0.1204331, 0, 0, 0, 1, 1,
0.889723, -0.3361747, 1.73033, 0, 0, 0, 1, 1,
0.9011765, -0.6101846, 2.803238, 0, 0, 0, 1, 1,
0.9040204, -0.01610747, 0.6799815, 0, 0, 0, 1, 1,
0.908197, -0.0565353, 1.353461, 0, 0, 0, 1, 1,
0.9101247, -1.574865, 1.661546, 0, 0, 0, 1, 1,
0.9140581, -0.5065361, 1.726787, 0, 0, 0, 1, 1,
0.9158029, 0.6992484, 1.016786, 1, 1, 1, 1, 1,
0.9160231, -0.7774521, 2.637761, 1, 1, 1, 1, 1,
0.9196909, 0.3215208, -0.5765871, 1, 1, 1, 1, 1,
0.92154, 0.9601595, 1.633841, 1, 1, 1, 1, 1,
0.9252208, -0.9361488, 3.436738, 1, 1, 1, 1, 1,
0.9321379, 1.088089, 1.319162, 1, 1, 1, 1, 1,
0.9327075, -1.307123, 2.324695, 1, 1, 1, 1, 1,
0.9347901, 0.4256223, 1.433387, 1, 1, 1, 1, 1,
0.9365443, 1.098888, 0.06977689, 1, 1, 1, 1, 1,
0.9367535, -0.9869859, 1.827105, 1, 1, 1, 1, 1,
0.939722, 0.7653482, 0.8822717, 1, 1, 1, 1, 1,
0.9478261, 0.774974, 3.386828, 1, 1, 1, 1, 1,
0.9508328, -0.804714, 0.5736845, 1, 1, 1, 1, 1,
0.9512688, -1.263156, 2.107411, 1, 1, 1, 1, 1,
0.9516631, -0.8368535, 1.534543, 1, 1, 1, 1, 1,
0.960702, 0.1072853, 0.2724589, 0, 0, 1, 1, 1,
0.9657798, 0.5579292, -0.8692628, 1, 0, 0, 1, 1,
0.9840599, 0.2792405, -0.08519123, 1, 0, 0, 1, 1,
0.985487, 1.221694, 1.897459, 1, 0, 0, 1, 1,
0.9895214, -0.1158764, 3.555077, 1, 0, 0, 1, 1,
0.991899, 0.5697429, 0.6425282, 1, 0, 0, 1, 1,
1.002448, -0.8330138, 1.567954, 0, 0, 0, 1, 1,
1.006284, -0.8489382, 2.703842, 0, 0, 0, 1, 1,
1.017638, 1.077708, 1.038161, 0, 0, 0, 1, 1,
1.017701, -0.2729092, 3.144868, 0, 0, 0, 1, 1,
1.025802, -0.8141084, 3.265818, 0, 0, 0, 1, 1,
1.028182, -0.03720577, 3.286994, 0, 0, 0, 1, 1,
1.030239, -0.5206876, 0.2661207, 0, 0, 0, 1, 1,
1.034897, -1.513479, 1.830917, 1, 1, 1, 1, 1,
1.035164, -0.02813473, 2.511491, 1, 1, 1, 1, 1,
1.062232, 1.418972, 0.6720235, 1, 1, 1, 1, 1,
1.06668, 0.6797706, 2.516911, 1, 1, 1, 1, 1,
1.074277, 0.532708, 0.514174, 1, 1, 1, 1, 1,
1.082337, 0.8913711, -0.763903, 1, 1, 1, 1, 1,
1.083755, 0.8796524, 0.7158599, 1, 1, 1, 1, 1,
1.094138, 0.7513288, -0.8805338, 1, 1, 1, 1, 1,
1.095247, -1.429901, 3.063209, 1, 1, 1, 1, 1,
1.098677, 0.7084386, 2.598706, 1, 1, 1, 1, 1,
1.099822, -0.5240792, 3.656855, 1, 1, 1, 1, 1,
1.099954, -1.148205, 1.443368, 1, 1, 1, 1, 1,
1.110397, -0.4707452, 3.912503, 1, 1, 1, 1, 1,
1.111097, -0.9218978, 2.49212, 1, 1, 1, 1, 1,
1.111739, -0.5754362, 0.4872545, 1, 1, 1, 1, 1,
1.112336, -0.5184681, 2.365297, 0, 0, 1, 1, 1,
1.113199, -1.3399, 1.859884, 1, 0, 0, 1, 1,
1.120933, -2.201018, 0.7878515, 1, 0, 0, 1, 1,
1.129409, 0.05380341, 2.486575, 1, 0, 0, 1, 1,
1.136508, 1.16197, 2.011179, 1, 0, 0, 1, 1,
1.148467, 1.558534, 0.55172, 1, 0, 0, 1, 1,
1.150061, -0.1370395, 1.714188, 0, 0, 0, 1, 1,
1.161739, -0.2516122, 2.036765, 0, 0, 0, 1, 1,
1.162039, 0.006574942, -0.7805955, 0, 0, 0, 1, 1,
1.168486, -0.2944784, 3.046483, 0, 0, 0, 1, 1,
1.175501, 0.7221989, 2.175559, 0, 0, 0, 1, 1,
1.1789, -0.2352735, 0.4468952, 0, 0, 0, 1, 1,
1.181388, 0.2062444, 0.3784292, 0, 0, 0, 1, 1,
1.182112, 1.404589, 0.8715146, 1, 1, 1, 1, 1,
1.184118, -0.7501554, 1.120213, 1, 1, 1, 1, 1,
1.184319, 0.1870145, 1.046992, 1, 1, 1, 1, 1,
1.184421, 0.4368225, 1.48352, 1, 1, 1, 1, 1,
1.197357, 0.5642655, 2.114168, 1, 1, 1, 1, 1,
1.211041, 0.09492505, 1.373373, 1, 1, 1, 1, 1,
1.222047, 0.1750259, 0.5521212, 1, 1, 1, 1, 1,
1.222667, -0.4851584, 1.98872, 1, 1, 1, 1, 1,
1.222933, 0.5455897, 0.9746926, 1, 1, 1, 1, 1,
1.226381, -0.5460376, 1.679271, 1, 1, 1, 1, 1,
1.226524, 0.1211532, 4.094866, 1, 1, 1, 1, 1,
1.24127, 0.9428461, 2.262107, 1, 1, 1, 1, 1,
1.254247, 0.5429337, 3.252392, 1, 1, 1, 1, 1,
1.256789, -1.402388, 1.747254, 1, 1, 1, 1, 1,
1.263217, -0.8166062, 4.20668, 1, 1, 1, 1, 1,
1.264945, -1.527972, 3.05674, 0, 0, 1, 1, 1,
1.274243, 0.1824124, 1.190398, 1, 0, 0, 1, 1,
1.295994, -0.4924012, 1.505445, 1, 0, 0, 1, 1,
1.322432, 0.6179256, 3.244135, 1, 0, 0, 1, 1,
1.330091, 0.007857438, 3.228445, 1, 0, 0, 1, 1,
1.349052, 1.568132, 1.129841, 1, 0, 0, 1, 1,
1.350711, 0.7788313, 0.3464897, 0, 0, 0, 1, 1,
1.361066, 0.9861649, 1.103422, 0, 0, 0, 1, 1,
1.361598, 0.6995055, -0.4157554, 0, 0, 0, 1, 1,
1.362534, -0.278871, 4.427329, 0, 0, 0, 1, 1,
1.363591, -0.3143455, 2.435789, 0, 0, 0, 1, 1,
1.363672, -0.6443611, 2.816813, 0, 0, 0, 1, 1,
1.368832, 0.08995183, 3.08094, 0, 0, 0, 1, 1,
1.372643, 0.2756806, 2.038165, 1, 1, 1, 1, 1,
1.387026, -0.383095, 2.875751, 1, 1, 1, 1, 1,
1.391448, 0.01012625, 1.838844, 1, 1, 1, 1, 1,
1.399026, -1.755781, 2.541323, 1, 1, 1, 1, 1,
1.406731, 1.259251, 1.795645, 1, 1, 1, 1, 1,
1.416828, -0.6981922, 2.369622, 1, 1, 1, 1, 1,
1.421158, -1.191705, 2.384982, 1, 1, 1, 1, 1,
1.42544, -0.1371138, 0.02318555, 1, 1, 1, 1, 1,
1.42925, -0.1769495, -0.008279242, 1, 1, 1, 1, 1,
1.436894, 0.3848447, 0.8106682, 1, 1, 1, 1, 1,
1.438511, 0.4024009, 0.5865402, 1, 1, 1, 1, 1,
1.444507, -1.754562, 4.363458, 1, 1, 1, 1, 1,
1.447234, -1.14301, 2.305675, 1, 1, 1, 1, 1,
1.453878, -3.045978, 1.984042, 1, 1, 1, 1, 1,
1.457084, 1.729472, 1.031376, 1, 1, 1, 1, 1,
1.457637, 0.09938659, 0.8938016, 0, 0, 1, 1, 1,
1.465393, 1.375788, 0.6235604, 1, 0, 0, 1, 1,
1.485675, 1.361969, 0.7706494, 1, 0, 0, 1, 1,
1.48959, -0.02575604, 2.012133, 1, 0, 0, 1, 1,
1.493926, -0.8815393, 2.624561, 1, 0, 0, 1, 1,
1.525142, -1.868235, 1.986783, 1, 0, 0, 1, 1,
1.528002, 0.8307431, 1.112669, 0, 0, 0, 1, 1,
1.539763, 1.089341, 0.8346788, 0, 0, 0, 1, 1,
1.549569, -1.559106, 3.227229, 0, 0, 0, 1, 1,
1.549961, -1.114621, 1.548196, 0, 0, 0, 1, 1,
1.555342, -0.786651, 2.527853, 0, 0, 0, 1, 1,
1.56045, -0.9387663, 2.695242, 0, 0, 0, 1, 1,
1.565975, -0.8249366, 2.480793, 0, 0, 0, 1, 1,
1.571239, 1.004813, 0.7100652, 1, 1, 1, 1, 1,
1.592626, -0.09583397, 2.82782, 1, 1, 1, 1, 1,
1.595088, 0.786146, 1.478849, 1, 1, 1, 1, 1,
1.597311, -0.5278364, 1.411979, 1, 1, 1, 1, 1,
1.614084, 0.09155691, 0.7121676, 1, 1, 1, 1, 1,
1.616654, 0.6425163, -0.03009347, 1, 1, 1, 1, 1,
1.622032, 0.8814794, 0.2307234, 1, 1, 1, 1, 1,
1.625588, 0.711068, 1.855472, 1, 1, 1, 1, 1,
1.630665, 0.6788776, 1.505301, 1, 1, 1, 1, 1,
1.643998, 0.3012526, 2.619221, 1, 1, 1, 1, 1,
1.656401, -0.1908093, 2.02784, 1, 1, 1, 1, 1,
1.671041, -2.363651, 4.183735, 1, 1, 1, 1, 1,
1.698036, -2.148559, 1.677104, 1, 1, 1, 1, 1,
1.707184, 0.4369996, 0.8928289, 1, 1, 1, 1, 1,
1.715468, -0.7585487, 1.732963, 1, 1, 1, 1, 1,
1.733043, -0.2238791, 1.355132, 0, 0, 1, 1, 1,
1.753064, -0.219341, 2.232306, 1, 0, 0, 1, 1,
1.765225, -0.2215423, 0.7840989, 1, 0, 0, 1, 1,
1.765606, -0.5392321, 1.318767, 1, 0, 0, 1, 1,
1.774454, 0.3174637, -1.607085, 1, 0, 0, 1, 1,
1.779958, -0.1981156, 2.627272, 1, 0, 0, 1, 1,
1.822826, -1.923423, 3.894779, 0, 0, 0, 1, 1,
1.836564, 1.626597, 0.004412307, 0, 0, 0, 1, 1,
1.864699, 2.781348, -1.107896, 0, 0, 0, 1, 1,
1.886417, -2.283687, 2.17177, 0, 0, 0, 1, 1,
1.899866, 0.5264653, 1.816802, 0, 0, 0, 1, 1,
1.90194, -0.1699088, 1.562105, 0, 0, 0, 1, 1,
1.906821, -0.1987271, 1.632963, 0, 0, 0, 1, 1,
1.90918, -0.1936283, 1.193633, 1, 1, 1, 1, 1,
1.909759, 0.2987102, 1.468768, 1, 1, 1, 1, 1,
1.917735, 0.3773448, 0.9490745, 1, 1, 1, 1, 1,
1.927479, -0.7136008, 0.7107013, 1, 1, 1, 1, 1,
1.93006, 0.5909454, 3.275517, 1, 1, 1, 1, 1,
1.935278, -0.1999331, 2.361698, 1, 1, 1, 1, 1,
1.997896, 0.8781705, 0.9019844, 1, 1, 1, 1, 1,
2.021775, -1.022555, 0.3387962, 1, 1, 1, 1, 1,
2.035893, 1.048785, 0.250239, 1, 1, 1, 1, 1,
2.039939, -1.262537, 1.651518, 1, 1, 1, 1, 1,
2.051582, 0.2622121, 1.303792, 1, 1, 1, 1, 1,
2.069168, -0.677036, 2.81461, 1, 1, 1, 1, 1,
2.075759, 0.2556512, 2.999817, 1, 1, 1, 1, 1,
2.103264, -0.7520647, 0.3496498, 1, 1, 1, 1, 1,
2.123052, -1.307965, 2.380301, 1, 1, 1, 1, 1,
2.147822, 0.5847847, -0.1589352, 0, 0, 1, 1, 1,
2.157418, 0.7930495, 1.606263, 1, 0, 0, 1, 1,
2.161617, 2.382046, 1.432343, 1, 0, 0, 1, 1,
2.186002, -0.3264796, 1.238833, 1, 0, 0, 1, 1,
2.220006, -1.089244, 2.711356, 1, 0, 0, 1, 1,
2.246356, -0.5436127, 1.844302, 1, 0, 0, 1, 1,
2.269812, 0.8881088, 0.2542559, 0, 0, 0, 1, 1,
2.271032, 0.09703697, 1.972223, 0, 0, 0, 1, 1,
2.304549, -0.142688, 2.080333, 0, 0, 0, 1, 1,
2.309235, 0.3120781, 2.406672, 0, 0, 0, 1, 1,
2.424252, -1.237467, 2.640087, 0, 0, 0, 1, 1,
2.456248, 0.8506758, -0.7253473, 0, 0, 0, 1, 1,
2.484342, -1.291934, 3.016497, 0, 0, 0, 1, 1,
2.544488, 0.00770585, 1.611715, 1, 1, 1, 1, 1,
2.550932, -1.825101, 0.6584303, 1, 1, 1, 1, 1,
2.569342, -1.066941, 1.913067, 1, 1, 1, 1, 1,
2.624965, 0.1210737, 1.636183, 1, 1, 1, 1, 1,
2.786891, -0.2638952, 1.363276, 1, 1, 1, 1, 1,
3.10807, 0.6676485, -0.7098804, 1, 1, 1, 1, 1,
3.121323, 0.5174057, 0.6980277, 1, 1, 1, 1, 1
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
var radius = 10.53656;
var distance = 37.00923;
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
mvMatrix.translate( -0.07852101, -0.2216978, -0.04505229 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -37.00923);
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
