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
-3.431365, 0.3544298, -0.7071267, 1, 0, 0, 1,
-3.366625, 1.558749, -2.119145, 1, 0.007843138, 0, 1,
-2.919251, 0.7176673, -1.39203, 1, 0.01176471, 0, 1,
-2.915708, 0.883027, -2.042545, 1, 0.01960784, 0, 1,
-2.915515, -2.065212, -1.813069, 1, 0.02352941, 0, 1,
-2.816576, -0.9655539, -1.983255, 1, 0.03137255, 0, 1,
-2.597373, -0.7980055, -1.962188, 1, 0.03529412, 0, 1,
-2.476173, 0.3600046, -0.961823, 1, 0.04313726, 0, 1,
-2.425769, 1.967734, -0.8916334, 1, 0.04705882, 0, 1,
-2.402294, 0.7717912, -1.717959, 1, 0.05490196, 0, 1,
-2.367541, 0.4564222, -3.101339, 1, 0.05882353, 0, 1,
-2.298849, -0.005207397, 0.6529654, 1, 0.06666667, 0, 1,
-2.288969, 1.203998, -0.9399976, 1, 0.07058824, 0, 1,
-2.212342, 0.859063, 0.003408245, 1, 0.07843138, 0, 1,
-2.197751, 0.9782872, -0.3102991, 1, 0.08235294, 0, 1,
-2.146963, -0.05486239, -1.183988, 1, 0.09019608, 0, 1,
-2.12478, -1.241596, -2.589694, 1, 0.09411765, 0, 1,
-2.115377, 0.7704283, -1.961311, 1, 0.1019608, 0, 1,
-2.078036, -0.1616663, -1.651015, 1, 0.1098039, 0, 1,
-2.074063, -0.1814375, -2.631358, 1, 0.1137255, 0, 1,
-2.065225, 0.2949346, 0.2211733, 1, 0.1215686, 0, 1,
-2.034144, 1.061814, -0.4278438, 1, 0.1254902, 0, 1,
-2.01684, 0.6300779, -1.513612, 1, 0.1333333, 0, 1,
-2.009158, 0.7340724, -2.03707, 1, 0.1372549, 0, 1,
-1.909286, -0.7120892, -1.971469, 1, 0.145098, 0, 1,
-1.906165, -0.1398927, -0.2307212, 1, 0.1490196, 0, 1,
-1.899528, 0.4625622, -1.512051, 1, 0.1568628, 0, 1,
-1.873374, 0.07909194, -0.2859413, 1, 0.1607843, 0, 1,
-1.852588, 0.3584652, 0.07545391, 1, 0.1686275, 0, 1,
-1.804115, 1.786191, 0.4527473, 1, 0.172549, 0, 1,
-1.798195, 0.286137, -3.043364, 1, 0.1803922, 0, 1,
-1.786894, -0.1460104, 0.06915202, 1, 0.1843137, 0, 1,
-1.771592, 0.7302564, -1.665336, 1, 0.1921569, 0, 1,
-1.771367, 1.537246, -2.065478, 1, 0.1960784, 0, 1,
-1.756706, 0.06475955, -0.2629241, 1, 0.2039216, 0, 1,
-1.728803, 0.8461707, -1.856855, 1, 0.2117647, 0, 1,
-1.725976, 1.269096, -0.1740259, 1, 0.2156863, 0, 1,
-1.695513, -0.6400253, -1.121881, 1, 0.2235294, 0, 1,
-1.690136, -0.3480484, -1.403593, 1, 0.227451, 0, 1,
-1.673381, 0.6540754, -0.7722558, 1, 0.2352941, 0, 1,
-1.6588, -0.5272458, -1.30933, 1, 0.2392157, 0, 1,
-1.656047, -2.877347, -0.7900549, 1, 0.2470588, 0, 1,
-1.647821, 1.750306, -0.6867164, 1, 0.2509804, 0, 1,
-1.645003, -0.170929, -2.281788, 1, 0.2588235, 0, 1,
-1.636321, -0.3159191, -3.842471, 1, 0.2627451, 0, 1,
-1.635711, 0.402585, -2.582921, 1, 0.2705882, 0, 1,
-1.629647, -1.412436, -2.101829, 1, 0.2745098, 0, 1,
-1.628397, 0.4694768, -1.62984, 1, 0.282353, 0, 1,
-1.605215, -0.608095, -1.712502, 1, 0.2862745, 0, 1,
-1.593694, 0.03590398, -2.305326, 1, 0.2941177, 0, 1,
-1.592857, -0.1301476, -1.517684, 1, 0.3019608, 0, 1,
-1.579603, -0.06525007, -0.7142581, 1, 0.3058824, 0, 1,
-1.57874, -1.904324, -3.997643, 1, 0.3137255, 0, 1,
-1.57401, -1.096048, -1.501285, 1, 0.3176471, 0, 1,
-1.571371, -0.6448687, -2.452009, 1, 0.3254902, 0, 1,
-1.550377, -0.8646481, 0.07763053, 1, 0.3294118, 0, 1,
-1.54829, 0.4830147, -1.066256, 1, 0.3372549, 0, 1,
-1.535647, 0.4714652, -2.342733, 1, 0.3411765, 0, 1,
-1.515433, -0.7201633, -2.385986, 1, 0.3490196, 0, 1,
-1.51529, 0.8798265, -1.928374, 1, 0.3529412, 0, 1,
-1.486131, 0.2243908, -0.3846871, 1, 0.3607843, 0, 1,
-1.477571, 0.2383553, -0.7878926, 1, 0.3647059, 0, 1,
-1.475355, 1.350858, -0.5959844, 1, 0.372549, 0, 1,
-1.47525, -0.2200943, -1.244462, 1, 0.3764706, 0, 1,
-1.455128, 0.3867674, -1.354894, 1, 0.3843137, 0, 1,
-1.453594, -0.213757, -2.354309, 1, 0.3882353, 0, 1,
-1.449947, 0.3543796, -0.2332584, 1, 0.3960784, 0, 1,
-1.448003, 1.346871, -1.628131, 1, 0.4039216, 0, 1,
-1.441987, 1.02659, -2.111775, 1, 0.4078431, 0, 1,
-1.437783, 2.18114, -2.445484, 1, 0.4156863, 0, 1,
-1.433887, -0.4106135, -4.890147, 1, 0.4196078, 0, 1,
-1.421725, 0.9525172, -2.486668, 1, 0.427451, 0, 1,
-1.413532, 0.1599076, -1.348499, 1, 0.4313726, 0, 1,
-1.403223, -0.6758527, -1.110133, 1, 0.4392157, 0, 1,
-1.382406, -1.300851, -3.260266, 1, 0.4431373, 0, 1,
-1.375368, 0.04029784, -1.125135, 1, 0.4509804, 0, 1,
-1.371866, 0.6184597, -1.113664, 1, 0.454902, 0, 1,
-1.367008, 0.3197041, -1.425763, 1, 0.4627451, 0, 1,
-1.366814, -0.1177062, -3.141532, 1, 0.4666667, 0, 1,
-1.364022, -0.4702238, -1.49207, 1, 0.4745098, 0, 1,
-1.363772, -0.9153944, -2.32516, 1, 0.4784314, 0, 1,
-1.363233, 0.7101272, -0.2260426, 1, 0.4862745, 0, 1,
-1.354617, 2.424978, -0.07351728, 1, 0.4901961, 0, 1,
-1.339155, -0.4185815, -3.497192, 1, 0.4980392, 0, 1,
-1.333193, -0.7924109, -4.66378, 1, 0.5058824, 0, 1,
-1.327342, 0.09788318, -3.17745, 1, 0.509804, 0, 1,
-1.324519, -0.1947272, -1.644087, 1, 0.5176471, 0, 1,
-1.320891, 1.32258, 0.3397776, 1, 0.5215687, 0, 1,
-1.313398, -0.02111982, -2.337352, 1, 0.5294118, 0, 1,
-1.303852, 1.923893, 0.1133967, 1, 0.5333334, 0, 1,
-1.303379, 0.6278765, -0.5309009, 1, 0.5411765, 0, 1,
-1.291746, -0.8602978, -0.001293719, 1, 0.5450981, 0, 1,
-1.281209, -0.8479784, -0.9249607, 1, 0.5529412, 0, 1,
-1.281162, -1.913972, -1.862115, 1, 0.5568628, 0, 1,
-1.280586, -2.419046, -1.971347, 1, 0.5647059, 0, 1,
-1.254469, 0.7770894, 0.06224157, 1, 0.5686275, 0, 1,
-1.252838, -0.6323186, -2.399547, 1, 0.5764706, 0, 1,
-1.249482, 0.03207359, -0.1383898, 1, 0.5803922, 0, 1,
-1.247319, 0.2909301, -1.200206, 1, 0.5882353, 0, 1,
-1.241305, 0.9366585, -0.8612639, 1, 0.5921569, 0, 1,
-1.228977, -0.5316955, -3.183916, 1, 0.6, 0, 1,
-1.216073, -0.8421738, -1.531673, 1, 0.6078432, 0, 1,
-1.213473, 0.8030367, -1.764975, 1, 0.6117647, 0, 1,
-1.21079, 0.369126, -1.393457, 1, 0.6196079, 0, 1,
-1.200503, -0.9748798, -3.608132, 1, 0.6235294, 0, 1,
-1.18882, -0.6374508, -1.553075, 1, 0.6313726, 0, 1,
-1.183434, 0.7705706, -1.060713, 1, 0.6352941, 0, 1,
-1.180521, -0.7084458, -1.794215, 1, 0.6431373, 0, 1,
-1.17928, 1.121024, 0.6824816, 1, 0.6470588, 0, 1,
-1.172828, 0.9337763, -1.115998, 1, 0.654902, 0, 1,
-1.167434, -1.403342, -1.144139, 1, 0.6588235, 0, 1,
-1.16318, -0.4353651, -2.492853, 1, 0.6666667, 0, 1,
-1.160851, -0.8529552, -1.6597, 1, 0.6705883, 0, 1,
-1.153769, 0.4192131, -2.125455, 1, 0.6784314, 0, 1,
-1.151901, 1.64747, -0.5920928, 1, 0.682353, 0, 1,
-1.146844, -0.2746665, -0.3584937, 1, 0.6901961, 0, 1,
-1.146137, -0.2598227, -1.35041, 1, 0.6941177, 0, 1,
-1.144443, 0.9511007, 2.202061, 1, 0.7019608, 0, 1,
-1.139151, 0.1986957, -1.921342, 1, 0.7098039, 0, 1,
-1.136068, -1.310244, -3.779279, 1, 0.7137255, 0, 1,
-1.134714, 0.3481355, -0.2225308, 1, 0.7215686, 0, 1,
-1.1317, -2.146832, -2.443515, 1, 0.7254902, 0, 1,
-1.123388, -0.9942569, -2.734829, 1, 0.7333333, 0, 1,
-1.115939, 2.328174, -0.2403665, 1, 0.7372549, 0, 1,
-1.113119, 1.885032, 1.095631, 1, 0.7450981, 0, 1,
-1.112503, 0.6195276, -1.883863, 1, 0.7490196, 0, 1,
-1.1036, 0.2653837, -1.377821, 1, 0.7568628, 0, 1,
-1.100923, -0.3935901, -0.7416702, 1, 0.7607843, 0, 1,
-1.099898, 0.383288, -0.1135314, 1, 0.7686275, 0, 1,
-1.094744, -1.027385, -1.52843, 1, 0.772549, 0, 1,
-1.089743, -0.4847044, -1.538491, 1, 0.7803922, 0, 1,
-1.088723, -0.1262533, -1.637061, 1, 0.7843137, 0, 1,
-1.087874, 0.3940147, -1.384095, 1, 0.7921569, 0, 1,
-1.076598, 1.431531, -2.279109, 1, 0.7960784, 0, 1,
-1.07378, 0.10953, -1.808378, 1, 0.8039216, 0, 1,
-1.064763, -0.1782336, -1.34171, 1, 0.8117647, 0, 1,
-1.062891, -0.3121172, -0.8946878, 1, 0.8156863, 0, 1,
-1.060568, -0.2467048, -1.443721, 1, 0.8235294, 0, 1,
-1.058467, 0.1707525, -2.638938, 1, 0.827451, 0, 1,
-1.056806, -0.03356665, -1.484909, 1, 0.8352941, 0, 1,
-1.052098, 0.2489494, -0.4721343, 1, 0.8392157, 0, 1,
-1.038956, 0.3030238, -1.951501, 1, 0.8470588, 0, 1,
-1.038584, -1.037093, -2.398238, 1, 0.8509804, 0, 1,
-1.021372, -0.6878519, -1.720797, 1, 0.8588235, 0, 1,
-1.02131, 0.7296044, -0.9363191, 1, 0.8627451, 0, 1,
-1.021093, -0.9298573, -1.908019, 1, 0.8705882, 0, 1,
-1.014077, 0.004587088, -1.965513, 1, 0.8745098, 0, 1,
-1.006509, 0.04288334, -1.374857, 1, 0.8823529, 0, 1,
-0.9968782, 0.1030508, -0.671739, 1, 0.8862745, 0, 1,
-0.9948478, 0.3024783, 0.2844244, 1, 0.8941177, 0, 1,
-0.9921659, 0.6046638, -0.6969039, 1, 0.8980392, 0, 1,
-0.9881589, -0.378182, -1.107166, 1, 0.9058824, 0, 1,
-0.986885, 0.5524715, -0.6423728, 1, 0.9137255, 0, 1,
-0.9844977, 0.3651783, -2.52833, 1, 0.9176471, 0, 1,
-0.9798231, -1.669678, -1.07228, 1, 0.9254902, 0, 1,
-0.9767949, 0.8323367, -0.3073137, 1, 0.9294118, 0, 1,
-0.9766577, -2.1043, -2.91821, 1, 0.9372549, 0, 1,
-0.9754767, -1.054916, -2.183756, 1, 0.9411765, 0, 1,
-0.9746578, 0.3734434, -1.83159, 1, 0.9490196, 0, 1,
-0.9722489, 1.61684, -0.9760741, 1, 0.9529412, 0, 1,
-0.960699, 0.08138235, -1.372225, 1, 0.9607843, 0, 1,
-0.959017, 0.4901479, -2.351992, 1, 0.9647059, 0, 1,
-0.9584218, -1.405162, -2.202663, 1, 0.972549, 0, 1,
-0.9578334, 0.8349562, 0.9617813, 1, 0.9764706, 0, 1,
-0.9569592, 0.7765127, -1.831349, 1, 0.9843137, 0, 1,
-0.9564882, 2.981377, 0.6749397, 1, 0.9882353, 0, 1,
-0.9550021, 0.4849385, -2.449522, 1, 0.9960784, 0, 1,
-0.9496787, -0.2642473, -0.9794612, 0.9960784, 1, 0, 1,
-0.9473621, 1.23248, -1.093627, 0.9921569, 1, 0, 1,
-0.9427091, 1.568416, -0.3295283, 0.9843137, 1, 0, 1,
-0.9381589, -1.702734, -2.243433, 0.9803922, 1, 0, 1,
-0.9372938, 0.7444921, -0.5220618, 0.972549, 1, 0, 1,
-0.9309815, 1.78336, 2.101469, 0.9686275, 1, 0, 1,
-0.928071, 0.2595057, 0.2105086, 0.9607843, 1, 0, 1,
-0.9200441, -0.7268144, -2.140938, 0.9568627, 1, 0, 1,
-0.9147822, 0.4615647, -2.101893, 0.9490196, 1, 0, 1,
-0.9129344, -1.009146, 0.1186221, 0.945098, 1, 0, 1,
-0.912915, -0.007480854, -2.001407, 0.9372549, 1, 0, 1,
-0.9100675, -0.1416257, -2.116236, 0.9333333, 1, 0, 1,
-0.9074729, 1.701763, -1.297533, 0.9254902, 1, 0, 1,
-0.9041052, -0.6045734, -2.707187, 0.9215686, 1, 0, 1,
-0.9024528, 2.401623, 0.9732257, 0.9137255, 1, 0, 1,
-0.9019507, -0.01712903, -0.9485604, 0.9098039, 1, 0, 1,
-0.8969399, 0.5220265, 1.327379, 0.9019608, 1, 0, 1,
-0.8900527, -1.662896, -1.560887, 0.8941177, 1, 0, 1,
-0.8875895, 1.061826, -0.7795353, 0.8901961, 1, 0, 1,
-0.8816133, -1.412148, -2.217954, 0.8823529, 1, 0, 1,
-0.8787532, -0.4195898, -2.965833, 0.8784314, 1, 0, 1,
-0.8680055, -0.4504675, -2.503906, 0.8705882, 1, 0, 1,
-0.8672163, -1.529587, -4.616802, 0.8666667, 1, 0, 1,
-0.8668964, -1.275285, -3.47282, 0.8588235, 1, 0, 1,
-0.8667532, 1.119423, 0.3972609, 0.854902, 1, 0, 1,
-0.8555537, 0.06575111, -1.867902, 0.8470588, 1, 0, 1,
-0.8549263, 0.4163025, -1.453352, 0.8431373, 1, 0, 1,
-0.8547311, -0.2850041, -1.716851, 0.8352941, 1, 0, 1,
-0.8532919, -1.212636, -5.300043, 0.8313726, 1, 0, 1,
-0.850866, 1.515043, 0.9156237, 0.8235294, 1, 0, 1,
-0.8442643, 0.570315, -0.9332526, 0.8196079, 1, 0, 1,
-0.8391719, 0.9625603, -1.543404, 0.8117647, 1, 0, 1,
-0.8308258, 0.3347672, -2.574514, 0.8078431, 1, 0, 1,
-0.8293455, 0.535857, -0.5369992, 0.8, 1, 0, 1,
-0.8223911, -0.4512638, -1.740818, 0.7921569, 1, 0, 1,
-0.821436, 0.546115, -0.5978878, 0.7882353, 1, 0, 1,
-0.8164121, 0.2409846, -0.1895842, 0.7803922, 1, 0, 1,
-0.8125445, -0.1062228, -0.9638123, 0.7764706, 1, 0, 1,
-0.810658, -1.77229, -3.611937, 0.7686275, 1, 0, 1,
-0.8105723, 1.298272, 0.4977531, 0.7647059, 1, 0, 1,
-0.8104023, 0.04912814, -0.7056634, 0.7568628, 1, 0, 1,
-0.8020775, -0.8657293, -2.100636, 0.7529412, 1, 0, 1,
-0.801312, 1.061573, -2.402344, 0.7450981, 1, 0, 1,
-0.8007224, 1.19819, -2.606558, 0.7411765, 1, 0, 1,
-0.799566, 1.482667, -0.2541806, 0.7333333, 1, 0, 1,
-0.7988704, -0.06010152, -1.438636, 0.7294118, 1, 0, 1,
-0.795351, -0.6687363, -2.431172, 0.7215686, 1, 0, 1,
-0.7877492, -0.6830844, -2.271727, 0.7176471, 1, 0, 1,
-0.7854728, -0.9800407, -3.176275, 0.7098039, 1, 0, 1,
-0.7836542, 1.504841, 0.0462064, 0.7058824, 1, 0, 1,
-0.7712759, -0.06832836, -2.393869, 0.6980392, 1, 0, 1,
-0.7697525, 0.2041213, -1.934157, 0.6901961, 1, 0, 1,
-0.7674496, 0.9376608, -1.10992, 0.6862745, 1, 0, 1,
-0.7666947, -0.6788797, -2.523172, 0.6784314, 1, 0, 1,
-0.7629445, -0.2830831, -3.049022, 0.6745098, 1, 0, 1,
-0.7597321, 0.7303823, -0.02300248, 0.6666667, 1, 0, 1,
-0.7585803, 0.7634364, -0.4241925, 0.6627451, 1, 0, 1,
-0.7453319, -0.7367859, -2.443825, 0.654902, 1, 0, 1,
-0.7407513, 0.1749379, -1.618121, 0.6509804, 1, 0, 1,
-0.7345975, -0.1150155, 1.098224, 0.6431373, 1, 0, 1,
-0.7345555, -1.001707, -1.405581, 0.6392157, 1, 0, 1,
-0.7266427, -0.7722647, -2.428074, 0.6313726, 1, 0, 1,
-0.7247366, -0.1300175, -1.751211, 0.627451, 1, 0, 1,
-0.7208582, -0.7939529, -2.453764, 0.6196079, 1, 0, 1,
-0.7206662, -0.3810026, -3.907581, 0.6156863, 1, 0, 1,
-0.7174037, 1.308837, 1.569035, 0.6078432, 1, 0, 1,
-0.7092298, 0.3812255, 0.104149, 0.6039216, 1, 0, 1,
-0.7063842, 0.903275, 0.3772543, 0.5960785, 1, 0, 1,
-0.7046603, 1.783914, -0.7059987, 0.5882353, 1, 0, 1,
-0.704085, -1.344268, -3.540626, 0.5843138, 1, 0, 1,
-0.7030033, -1.094331, -2.813668, 0.5764706, 1, 0, 1,
-0.7025854, -0.3647788, -3.505774, 0.572549, 1, 0, 1,
-0.7015857, -0.4882431, -2.848405, 0.5647059, 1, 0, 1,
-0.7011265, -1.060068, -4.602245, 0.5607843, 1, 0, 1,
-0.6977705, -0.9736883, -3.947968, 0.5529412, 1, 0, 1,
-0.6968405, -0.8938911, -2.738999, 0.5490196, 1, 0, 1,
-0.6941721, 0.7475607, 0.6677079, 0.5411765, 1, 0, 1,
-0.684019, 0.2821652, 0.4193713, 0.5372549, 1, 0, 1,
-0.6832061, -0.009039002, -0.6643866, 0.5294118, 1, 0, 1,
-0.6781935, -0.4630491, -2.852368, 0.5254902, 1, 0, 1,
-0.6760719, -1.927524, -5.084402, 0.5176471, 1, 0, 1,
-0.6670812, -0.6668062, -2.906067, 0.5137255, 1, 0, 1,
-0.6667068, 0.917486, 1.056562, 0.5058824, 1, 0, 1,
-0.6660252, -0.5541012, -2.063906, 0.5019608, 1, 0, 1,
-0.6610611, 0.2565611, -0.2666212, 0.4941176, 1, 0, 1,
-0.6605687, 2.284583, 1.186863, 0.4862745, 1, 0, 1,
-0.6599252, -0.6989136, -1.624796, 0.4823529, 1, 0, 1,
-0.6596543, -1.214658, -3.413213, 0.4745098, 1, 0, 1,
-0.6583856, -1.422989, -1.708446, 0.4705882, 1, 0, 1,
-0.6459935, -0.6855968, -2.37454, 0.4627451, 1, 0, 1,
-0.6455474, -0.6266634, -1.995281, 0.4588235, 1, 0, 1,
-0.6369713, 2.144919, 0.318108, 0.4509804, 1, 0, 1,
-0.6343953, -0.3367071, -3.246594, 0.4470588, 1, 0, 1,
-0.6324429, 1.955178, -0.1741448, 0.4392157, 1, 0, 1,
-0.630415, -0.05883968, -1.346264, 0.4352941, 1, 0, 1,
-0.6272329, -0.3073709, -1.580408, 0.427451, 1, 0, 1,
-0.6263813, -0.01204952, -2.016002, 0.4235294, 1, 0, 1,
-0.6251838, -0.1075103, -1.619338, 0.4156863, 1, 0, 1,
-0.6250327, 2.051631, 0.9200262, 0.4117647, 1, 0, 1,
-0.6205773, -0.8679252, -1.593932, 0.4039216, 1, 0, 1,
-0.6200922, -0.5469333, -1.035256, 0.3960784, 1, 0, 1,
-0.619916, 0.5949205, -1.158732, 0.3921569, 1, 0, 1,
-0.6121894, -0.3512624, -0.8640661, 0.3843137, 1, 0, 1,
-0.6116858, -0.6662153, -1.99636, 0.3803922, 1, 0, 1,
-0.608755, -1.093798, -4.130211, 0.372549, 1, 0, 1,
-0.6077449, 0.1087071, -1.757125, 0.3686275, 1, 0, 1,
-0.6057655, 0.09013849, -3.535264, 0.3607843, 1, 0, 1,
-0.6028826, 1.178753, 0.7991366, 0.3568628, 1, 0, 1,
-0.599903, -1.502853, -2.381386, 0.3490196, 1, 0, 1,
-0.5998677, -0.3992054, -3.074095, 0.345098, 1, 0, 1,
-0.5991376, -1.527484, -3.547696, 0.3372549, 1, 0, 1,
-0.5956792, 1.214352, 0.2496978, 0.3333333, 1, 0, 1,
-0.5955595, -0.2126673, -1.020579, 0.3254902, 1, 0, 1,
-0.5930244, 0.05453251, -1.799624, 0.3215686, 1, 0, 1,
-0.5917553, 0.2140512, -2.37801, 0.3137255, 1, 0, 1,
-0.590457, -0.5036449, -2.014772, 0.3098039, 1, 0, 1,
-0.5858578, 0.3019805, -0.1771371, 0.3019608, 1, 0, 1,
-0.5846514, 0.3915205, -0.1350989, 0.2941177, 1, 0, 1,
-0.5807844, 0.006119833, -2.033638, 0.2901961, 1, 0, 1,
-0.5798715, 0.5981143, 0.7583393, 0.282353, 1, 0, 1,
-0.5749974, 0.5047623, -0.0342413, 0.2784314, 1, 0, 1,
-0.5705317, -0.3309727, -0.5481847, 0.2705882, 1, 0, 1,
-0.5700406, -0.2930421, -0.9008341, 0.2666667, 1, 0, 1,
-0.5596529, 1.603266, -0.1370107, 0.2588235, 1, 0, 1,
-0.5578671, -0.9385093, -2.058881, 0.254902, 1, 0, 1,
-0.5560158, 0.9091859, -1.330561, 0.2470588, 1, 0, 1,
-0.5530908, -0.03765523, -4.196657, 0.2431373, 1, 0, 1,
-0.5493498, -1.263051, -3.233416, 0.2352941, 1, 0, 1,
-0.5463407, -0.1479177, -2.521746, 0.2313726, 1, 0, 1,
-0.544053, 1.105891, -0.6705609, 0.2235294, 1, 0, 1,
-0.5408558, -1.062134, -2.972977, 0.2196078, 1, 0, 1,
-0.5401219, 0.1390708, -0.5023522, 0.2117647, 1, 0, 1,
-0.5348982, -0.1941628, -1.282078, 0.2078431, 1, 0, 1,
-0.5332, 0.98399, -0.23037, 0.2, 1, 0, 1,
-0.5327148, 1.300865, 0.1981187, 0.1921569, 1, 0, 1,
-0.5292454, -0.5600934, -1.651629, 0.1882353, 1, 0, 1,
-0.5292343, 1.357863, -1.001508, 0.1803922, 1, 0, 1,
-0.5289871, -0.2314525, -2.700265, 0.1764706, 1, 0, 1,
-0.5253326, -1.199587, -2.178128, 0.1686275, 1, 0, 1,
-0.5181592, -0.5079718, -2.738278, 0.1647059, 1, 0, 1,
-0.5147918, 0.319148, -1.946811, 0.1568628, 1, 0, 1,
-0.5104304, 0.7384951, -1.889238, 0.1529412, 1, 0, 1,
-0.5098084, -0.5027487, -1.22526, 0.145098, 1, 0, 1,
-0.5089788, -0.9060078, -3.985909, 0.1411765, 1, 0, 1,
-0.5035763, -0.3897647, -1.91826, 0.1333333, 1, 0, 1,
-0.4999458, 1.459751, 0.08556262, 0.1294118, 1, 0, 1,
-0.4979806, -0.8830656, -3.665757, 0.1215686, 1, 0, 1,
-0.496969, 0.619176, -1.862111, 0.1176471, 1, 0, 1,
-0.4919926, -0.18547, -1.607264, 0.1098039, 1, 0, 1,
-0.4886549, -1.030487, -3.804391, 0.1058824, 1, 0, 1,
-0.488261, -0.7546663, -1.296665, 0.09803922, 1, 0, 1,
-0.4872117, 0.1840191, -0.07560398, 0.09019608, 1, 0, 1,
-0.485962, -0.4368356, -3.170055, 0.08627451, 1, 0, 1,
-0.4844228, 1.034377, -1.8028, 0.07843138, 1, 0, 1,
-0.4778125, 0.7630897, -0.7848924, 0.07450981, 1, 0, 1,
-0.4754015, -1.633079, -5.675294, 0.06666667, 1, 0, 1,
-0.4708789, -0.4366794, -3.800194, 0.0627451, 1, 0, 1,
-0.4645876, 0.8758605, 0.9065145, 0.05490196, 1, 0, 1,
-0.4640137, 0.4341029, -0.8518845, 0.05098039, 1, 0, 1,
-0.4616354, -1.47576, -1.165159, 0.04313726, 1, 0, 1,
-0.4608434, 0.03439208, -0.4195807, 0.03921569, 1, 0, 1,
-0.4514137, -0.03778385, -3.05146, 0.03137255, 1, 0, 1,
-0.4507309, -0.619791, -1.286499, 0.02745098, 1, 0, 1,
-0.448392, -0.6361246, -2.86072, 0.01960784, 1, 0, 1,
-0.4412843, 1.333609, -2.038667, 0.01568628, 1, 0, 1,
-0.439811, 0.1497748, -1.457849, 0.007843138, 1, 0, 1,
-0.4393046, 1.730065, -0.9487107, 0.003921569, 1, 0, 1,
-0.4385689, 0.1242921, -0.8328778, 0, 1, 0.003921569, 1,
-0.4371747, -1.014096, -4.461218, 0, 1, 0.01176471, 1,
-0.4348692, 0.08172374, -0.7292345, 0, 1, 0.01568628, 1,
-0.4305703, 0.3627911, -1.680585, 0, 1, 0.02352941, 1,
-0.4303258, -0.4666371, -3.550185, 0, 1, 0.02745098, 1,
-0.4267771, -0.8673158, -2.604243, 0, 1, 0.03529412, 1,
-0.425196, -1.555966, -1.490301, 0, 1, 0.03921569, 1,
-0.4238464, -0.3176349, -2.793774, 0, 1, 0.04705882, 1,
-0.4214656, 0.6945702, -1.796303, 0, 1, 0.05098039, 1,
-0.4173568, 0.6106125, -1.659782, 0, 1, 0.05882353, 1,
-0.4173003, -0.3047713, -3.414508, 0, 1, 0.0627451, 1,
-0.4125942, 0.3443136, -0.4854135, 0, 1, 0.07058824, 1,
-0.4078053, 1.398097, -2.110702, 0, 1, 0.07450981, 1,
-0.4069357, 0.5196071, -2.699034, 0, 1, 0.08235294, 1,
-0.4042464, -0.7278596, -3.014335, 0, 1, 0.08627451, 1,
-0.4017757, -0.3887608, -2.024879, 0, 1, 0.09411765, 1,
-0.3982865, 0.7949551, -0.5624398, 0, 1, 0.1019608, 1,
-0.3980598, 1.172958, -1.297042, 0, 1, 0.1058824, 1,
-0.3977824, 1.670673, 0.6625426, 0, 1, 0.1137255, 1,
-0.3962508, -0.5861275, -2.70844, 0, 1, 0.1176471, 1,
-0.3961795, -1.165125, -1.424827, 0, 1, 0.1254902, 1,
-0.3956547, -2.674451, -3.225503, 0, 1, 0.1294118, 1,
-0.3927389, 0.1640321, -0.8467057, 0, 1, 0.1372549, 1,
-0.3919989, -0.5444465, -2.330066, 0, 1, 0.1411765, 1,
-0.3890798, 0.4640343, 0.01379042, 0, 1, 0.1490196, 1,
-0.3865676, 0.7914485, -1.120757, 0, 1, 0.1529412, 1,
-0.3851034, -0.1671347, -0.4404205, 0, 1, 0.1607843, 1,
-0.3834181, -1.32007, -3.143602, 0, 1, 0.1647059, 1,
-0.3831927, 0.7637038, -0.3276747, 0, 1, 0.172549, 1,
-0.3831852, -0.2862148, -2.797272, 0, 1, 0.1764706, 1,
-0.3808376, 1.52162, 0.5783229, 0, 1, 0.1843137, 1,
-0.3775728, 0.2525106, -2.173203, 0, 1, 0.1882353, 1,
-0.3739823, -0.3569147, -3.435847, 0, 1, 0.1960784, 1,
-0.3719791, 0.6310375, -0.9119205, 0, 1, 0.2039216, 1,
-0.3719127, 0.2860368, -1.44924, 0, 1, 0.2078431, 1,
-0.3701005, -1.243632, -0.3334053, 0, 1, 0.2156863, 1,
-0.3686152, -0.1468299, -2.538471, 0, 1, 0.2196078, 1,
-0.3663159, 1.501733, -0.7578481, 0, 1, 0.227451, 1,
-0.3662114, -0.00545744, -1.471182, 0, 1, 0.2313726, 1,
-0.3631012, -0.3351727, -3.992316, 0, 1, 0.2392157, 1,
-0.355762, -0.4181959, -2.537425, 0, 1, 0.2431373, 1,
-0.3556598, 0.9605505, 1.344299, 0, 1, 0.2509804, 1,
-0.3535881, 0.9354672, 0.5124025, 0, 1, 0.254902, 1,
-0.3522667, -1.882756, -4.075433, 0, 1, 0.2627451, 1,
-0.3510937, 0.9556994, 0.9387298, 0, 1, 0.2666667, 1,
-0.3475146, 0.1714752, -0.874716, 0, 1, 0.2745098, 1,
-0.3436609, -0.3865852, -1.226059, 0, 1, 0.2784314, 1,
-0.3432443, 1.1718, -0.680897, 0, 1, 0.2862745, 1,
-0.3384004, -0.7037137, -1.889708, 0, 1, 0.2901961, 1,
-0.3323973, 0.401994, 1.262419, 0, 1, 0.2980392, 1,
-0.3289911, -1.272337, -1.969563, 0, 1, 0.3058824, 1,
-0.3288225, 0.5185462, 0.8365248, 0, 1, 0.3098039, 1,
-0.3279947, -1.036414, -2.592136, 0, 1, 0.3176471, 1,
-0.3259982, -0.5856252, -2.897818, 0, 1, 0.3215686, 1,
-0.3247705, -1.443579, -2.615658, 0, 1, 0.3294118, 1,
-0.3230306, 0.5194592, -1.020489, 0, 1, 0.3333333, 1,
-0.3221728, -0.1200365, -2.355714, 0, 1, 0.3411765, 1,
-0.3187684, 0.4137501, 1.107904, 0, 1, 0.345098, 1,
-0.3128714, 1.886191, -1.394593, 0, 1, 0.3529412, 1,
-0.3119881, -0.4368238, -0.9661852, 0, 1, 0.3568628, 1,
-0.3076186, 0.513476, -0.9004784, 0, 1, 0.3647059, 1,
-0.3039234, 0.1907408, -1.867422, 0, 1, 0.3686275, 1,
-0.3029147, 0.3309205, -1.304771, 0, 1, 0.3764706, 1,
-0.3016242, -1.228932, -4.008232, 0, 1, 0.3803922, 1,
-0.2998179, 1.612094, -0.2274063, 0, 1, 0.3882353, 1,
-0.2951351, -0.848001, -3.722812, 0, 1, 0.3921569, 1,
-0.293957, 1.237357, -0.3332742, 0, 1, 0.4, 1,
-0.2921368, 1.120833, 1.709501, 0, 1, 0.4078431, 1,
-0.2897471, -0.9069508, -4.54231, 0, 1, 0.4117647, 1,
-0.2861237, 1.038972, 0.08401338, 0, 1, 0.4196078, 1,
-0.2844245, 0.3866466, -1.785522, 0, 1, 0.4235294, 1,
-0.283833, 1.095074, -0.1732169, 0, 1, 0.4313726, 1,
-0.2833785, -0.3964461, -2.81427, 0, 1, 0.4352941, 1,
-0.2821155, 1.151441, -0.02614834, 0, 1, 0.4431373, 1,
-0.2793714, 0.4976463, -0.3180678, 0, 1, 0.4470588, 1,
-0.2738911, 0.02983992, -1.952326, 0, 1, 0.454902, 1,
-0.2733012, 0.2825871, -0.3206182, 0, 1, 0.4588235, 1,
-0.2731528, 0.2699112, 0.1901413, 0, 1, 0.4666667, 1,
-0.2715467, 0.5042518, 0.196423, 0, 1, 0.4705882, 1,
-0.2708969, 1.153648, -0.4587561, 0, 1, 0.4784314, 1,
-0.2670175, 0.5133414, -2.541668, 0, 1, 0.4823529, 1,
-0.2670131, -0.4778778, -5.466582, 0, 1, 0.4901961, 1,
-0.2618452, -0.6463312, -2.563864, 0, 1, 0.4941176, 1,
-0.2610928, -0.1432927, -1.04982, 0, 1, 0.5019608, 1,
-0.2587809, -0.6517031, -0.2611056, 0, 1, 0.509804, 1,
-0.2566466, -0.001670854, -3.177398, 0, 1, 0.5137255, 1,
-0.2538521, -0.6965027, -1.297775, 0, 1, 0.5215687, 1,
-0.2522828, -0.8193838, -2.59504, 0, 1, 0.5254902, 1,
-0.2520894, 0.38282, -0.6552575, 0, 1, 0.5333334, 1,
-0.2509398, 0.8773962, -0.1066391, 0, 1, 0.5372549, 1,
-0.2477311, -1.185756, -1.332757, 0, 1, 0.5450981, 1,
-0.2476511, 0.5201141, 1.172065, 0, 1, 0.5490196, 1,
-0.2472697, 1.16492, 0.8007909, 0, 1, 0.5568628, 1,
-0.2459517, 1.549348, -0.1952159, 0, 1, 0.5607843, 1,
-0.245913, 0.6256703, -0.5084389, 0, 1, 0.5686275, 1,
-0.2448369, 0.2119335, -0.1212243, 0, 1, 0.572549, 1,
-0.2430106, -0.7352088, -1.546401, 0, 1, 0.5803922, 1,
-0.2428242, -0.3675421, -1.939593, 0, 1, 0.5843138, 1,
-0.2419813, 0.5926014, -0.6159142, 0, 1, 0.5921569, 1,
-0.2282048, 0.4929388, -1.001543, 0, 1, 0.5960785, 1,
-0.2265348, 0.6796257, -0.5445415, 0, 1, 0.6039216, 1,
-0.2255414, -1.039333, -3.508352, 0, 1, 0.6117647, 1,
-0.2174662, 0.007455006, -2.294686, 0, 1, 0.6156863, 1,
-0.2172058, 1.109188, 0.1129345, 0, 1, 0.6235294, 1,
-0.2153934, 0.3452031, -1.220493, 0, 1, 0.627451, 1,
-0.2120116, -0.6248435, -2.426358, 0, 1, 0.6352941, 1,
-0.2095266, -1.04173, -2.285805, 0, 1, 0.6392157, 1,
-0.2084543, -0.5623805, 0.4818359, 0, 1, 0.6470588, 1,
-0.2026353, -0.04548443, -3.28012, 0, 1, 0.6509804, 1,
-0.2005338, -0.4935274, -2.74627, 0, 1, 0.6588235, 1,
-0.1956675, -0.5848731, -1.69075, 0, 1, 0.6627451, 1,
-0.1933043, 0.9953672, 0.5331191, 0, 1, 0.6705883, 1,
-0.1847381, 0.8553495, 0.7152877, 0, 1, 0.6745098, 1,
-0.1829497, -0.5078219, -2.927282, 0, 1, 0.682353, 1,
-0.1708765, -0.1029876, -1.761124, 0, 1, 0.6862745, 1,
-0.1689114, -0.2442955, -1.26514, 0, 1, 0.6941177, 1,
-0.1616559, 0.8180829, 0.1220116, 0, 1, 0.7019608, 1,
-0.1615005, -0.8051736, -5.832343, 0, 1, 0.7058824, 1,
-0.1534184, 0.2136438, -1.11208, 0, 1, 0.7137255, 1,
-0.1510387, -0.2559957, -2.642418, 0, 1, 0.7176471, 1,
-0.1484081, 0.26137, -1.867915, 0, 1, 0.7254902, 1,
-0.1478923, 0.1147994, 2.14993, 0, 1, 0.7294118, 1,
-0.1443421, -1.593814, -4.242914, 0, 1, 0.7372549, 1,
-0.1415365, 3.87351, 1.055004, 0, 1, 0.7411765, 1,
-0.1401587, 0.7686496, 0.1360258, 0, 1, 0.7490196, 1,
-0.1397721, 1.074005, -0.4204826, 0, 1, 0.7529412, 1,
-0.1389969, -0.6222295, -2.680458, 0, 1, 0.7607843, 1,
-0.1347121, -0.1284094, -2.453552, 0, 1, 0.7647059, 1,
-0.1317689, 1.305267, -0.8968104, 0, 1, 0.772549, 1,
-0.1308884, -0.3969035, -3.256223, 0, 1, 0.7764706, 1,
-0.1298808, 1.722774, -0.4420559, 0, 1, 0.7843137, 1,
-0.1285821, -0.02919831, -1.240874, 0, 1, 0.7882353, 1,
-0.1281568, 0.6052237, 0.04159905, 0, 1, 0.7960784, 1,
-0.1248148, -0.3721262, -3.427216, 0, 1, 0.8039216, 1,
-0.1181407, -0.5678587, -2.346853, 0, 1, 0.8078431, 1,
-0.1122576, 0.03234925, -1.076585, 0, 1, 0.8156863, 1,
-0.1117643, -0.2313268, -4.713679, 0, 1, 0.8196079, 1,
-0.1110581, -0.8637073, -3.725871, 0, 1, 0.827451, 1,
-0.1061182, -1.359292, -3.888809, 0, 1, 0.8313726, 1,
-0.1057818, 1.235481, -1.447603, 0, 1, 0.8392157, 1,
-0.105308, 0.9563342, -0.6239003, 0, 1, 0.8431373, 1,
-0.1021154, 0.5680373, -0.03789748, 0, 1, 0.8509804, 1,
-0.1012921, -0.08896056, -3.211404, 0, 1, 0.854902, 1,
-0.09926, 1.039578, 0.6089681, 0, 1, 0.8627451, 1,
-0.09895999, 0.5138491, 0.749326, 0, 1, 0.8666667, 1,
-0.09390812, 0.3839845, -0.9835466, 0, 1, 0.8745098, 1,
-0.0913702, 0.8700848, -0.9762048, 0, 1, 0.8784314, 1,
-0.08723747, -0.1519891, -2.470543, 0, 1, 0.8862745, 1,
-0.08345264, -1.885301, -2.990855, 0, 1, 0.8901961, 1,
-0.07841255, 0.1176714, -1.373353, 0, 1, 0.8980392, 1,
-0.07840039, 1.128398, 1.383835, 0, 1, 0.9058824, 1,
-0.07728402, -0.540467, -3.305277, 0, 1, 0.9098039, 1,
-0.07341119, 1.041309, 1.418007, 0, 1, 0.9176471, 1,
-0.07337178, 0.3261485, -1.916895, 0, 1, 0.9215686, 1,
-0.07105073, 1.133356, -1.659864, 0, 1, 0.9294118, 1,
-0.07024899, -0.5951573, -2.311866, 0, 1, 0.9333333, 1,
-0.06975156, 0.1433539, -1.175845, 0, 1, 0.9411765, 1,
-0.06375626, -0.5245736, -1.697182, 0, 1, 0.945098, 1,
-0.06204985, -1.056439, -3.28111, 0, 1, 0.9529412, 1,
-0.06149469, -0.2771925, -1.139601, 0, 1, 0.9568627, 1,
-0.05793989, -1.775985, -4.681081, 0, 1, 0.9647059, 1,
-0.05394665, -0.1829121, -2.72885, 0, 1, 0.9686275, 1,
-0.04976565, 0.514584, -1.044824, 0, 1, 0.9764706, 1,
-0.04666486, -1.428353, -1.814239, 0, 1, 0.9803922, 1,
-0.04641921, -2.039709, -3.611582, 0, 1, 0.9882353, 1,
-0.0442415, 2.040356, 1.678978, 0, 1, 0.9921569, 1,
-0.04405641, 2.929822, 0.9627392, 0, 1, 1, 1,
-0.04236156, -1.158131, -2.905875, 0, 0.9921569, 1, 1,
-0.03924932, 0.112121, -0.5448932, 0, 0.9882353, 1, 1,
-0.03830302, 1.515192, -1.358033, 0, 0.9803922, 1, 1,
-0.03179901, -0.3874771, -3.458246, 0, 0.9764706, 1, 1,
-0.03031895, -0.0159665, -1.643852, 0, 0.9686275, 1, 1,
-0.02930034, -0.1417745, -1.930398, 0, 0.9647059, 1, 1,
-0.02849366, -0.622938, -3.551081, 0, 0.9568627, 1, 1,
-0.02842444, 0.09735079, -1.618501, 0, 0.9529412, 1, 1,
-0.02825178, -0.07415488, -4.531238, 0, 0.945098, 1, 1,
-0.02402313, 1.839267, -1.088008, 0, 0.9411765, 1, 1,
-0.02268057, -0.8594486, -2.305253, 0, 0.9333333, 1, 1,
-0.02141608, 0.8843033, 0.08753107, 0, 0.9294118, 1, 1,
-0.01945971, -0.4976284, -2.502413, 0, 0.9215686, 1, 1,
-0.01930983, 0.0126371, -1.040083, 0, 0.9176471, 1, 1,
-0.01730737, 0.2059757, 1.093025, 0, 0.9098039, 1, 1,
-0.01643706, 0.1158732, 0.4810609, 0, 0.9058824, 1, 1,
-0.01619004, 0.7381212, -0.2105091, 0, 0.8980392, 1, 1,
-0.01500652, -2.242908, -3.413038, 0, 0.8901961, 1, 1,
-0.01125006, -1.183867, -3.372505, 0, 0.8862745, 1, 1,
-0.01006683, -1.376884, -3.370835, 0, 0.8784314, 1, 1,
-0.009721503, 0.5788137, -0.9958527, 0, 0.8745098, 1, 1,
-0.006457771, 1.707083, -0.1400689, 0, 0.8666667, 1, 1,
-0.003525079, -1.024359, -2.440688, 0, 0.8627451, 1, 1,
0.005353273, 1.548193, 0.1232548, 0, 0.854902, 1, 1,
0.00714389, 0.9379025, -0.9858786, 0, 0.8509804, 1, 1,
0.01437018, 0.4017547, -0.2932385, 0, 0.8431373, 1, 1,
0.01703211, 0.6679206, 1.65458, 0, 0.8392157, 1, 1,
0.02027799, -1.436209, 2.470196, 0, 0.8313726, 1, 1,
0.02204834, 1.012448, -0.5701777, 0, 0.827451, 1, 1,
0.02612139, -0.4098582, 4.069633, 0, 0.8196079, 1, 1,
0.02638716, -0.5892599, 3.563896, 0, 0.8156863, 1, 1,
0.02718718, 0.317973, -0.6028062, 0, 0.8078431, 1, 1,
0.03110417, -1.823101, 2.981241, 0, 0.8039216, 1, 1,
0.03415746, -1.040046, 3.507329, 0, 0.7960784, 1, 1,
0.03785289, 1.028043, -0.9072219, 0, 0.7882353, 1, 1,
0.03824185, 0.1456203, 2.915091, 0, 0.7843137, 1, 1,
0.04535525, -0.02028666, 1.065231, 0, 0.7764706, 1, 1,
0.04612159, -1.147369, 4.446695, 0, 0.772549, 1, 1,
0.04618753, -0.6199288, 2.712969, 0, 0.7647059, 1, 1,
0.04899176, -0.6511098, 2.896344, 0, 0.7607843, 1, 1,
0.04938365, -0.03153989, 3.187738, 0, 0.7529412, 1, 1,
0.05024718, -0.2480868, 4.313757, 0, 0.7490196, 1, 1,
0.05387067, -1.227206, 2.143176, 0, 0.7411765, 1, 1,
0.0572668, 0.00349849, 0.7965416, 0, 0.7372549, 1, 1,
0.05800046, 0.3049694, 1.201996, 0, 0.7294118, 1, 1,
0.05975769, -1.467993, 2.35707, 0, 0.7254902, 1, 1,
0.06180345, 0.6391872, 0.448029, 0, 0.7176471, 1, 1,
0.06745222, -1.284503, 2.703459, 0, 0.7137255, 1, 1,
0.06790271, 0.3870262, 1.257667, 0, 0.7058824, 1, 1,
0.07457126, -0.630094, 2.496492, 0, 0.6980392, 1, 1,
0.07526511, 0.4044961, -0.9279139, 0, 0.6941177, 1, 1,
0.07570171, -0.2468513, 1.679692, 0, 0.6862745, 1, 1,
0.08125445, 0.2014111, 0.8191909, 0, 0.682353, 1, 1,
0.08245096, -0.3924242, 2.118731, 0, 0.6745098, 1, 1,
0.08501887, 0.2694567, 1.635969, 0, 0.6705883, 1, 1,
0.09110992, -2.007637, 0.170813, 0, 0.6627451, 1, 1,
0.09325617, -0.4075599, 3.040141, 0, 0.6588235, 1, 1,
0.09712537, 0.291283, 0.3003907, 0, 0.6509804, 1, 1,
0.1023429, -0.06039374, 2.647448, 0, 0.6470588, 1, 1,
0.104297, 0.09155972, 0.6118953, 0, 0.6392157, 1, 1,
0.1065423, 1.371049, 0.5216317, 0, 0.6352941, 1, 1,
0.1075277, -0.5349737, 3.183143, 0, 0.627451, 1, 1,
0.1094098, -1.899448, 5.03543, 0, 0.6235294, 1, 1,
0.1096906, 1.107191, 1.018309, 0, 0.6156863, 1, 1,
0.1118251, -0.608518, 3.256338, 0, 0.6117647, 1, 1,
0.1126659, -1.308727, 4.197968, 0, 0.6039216, 1, 1,
0.1183493, -1.169252, 4.215007, 0, 0.5960785, 1, 1,
0.1214997, 0.7187114, -0.6607374, 0, 0.5921569, 1, 1,
0.1242183, 0.5746131, 0.595746, 0, 0.5843138, 1, 1,
0.1245354, -1.068758, 2.652988, 0, 0.5803922, 1, 1,
0.1298594, 0.1759819, -0.3283576, 0, 0.572549, 1, 1,
0.133465, -1.415731, 2.838807, 0, 0.5686275, 1, 1,
0.1357735, -1.146266, 2.437174, 0, 0.5607843, 1, 1,
0.1361107, 0.6610173, 0.7504482, 0, 0.5568628, 1, 1,
0.1391919, 0.01569813, 1.592166, 0, 0.5490196, 1, 1,
0.1512482, 1.085904, 0.7545509, 0, 0.5450981, 1, 1,
0.1581363, 0.3648582, -0.6397198, 0, 0.5372549, 1, 1,
0.160077, -0.9598069, 2.911747, 0, 0.5333334, 1, 1,
0.1664679, -0.4936377, 2.177767, 0, 0.5254902, 1, 1,
0.1674794, 1.130608, 1.523704, 0, 0.5215687, 1, 1,
0.1678482, 0.3493415, 0.1775568, 0, 0.5137255, 1, 1,
0.1680342, -0.9336838, 2.241027, 0, 0.509804, 1, 1,
0.1705908, 0.5674242, 0.4403583, 0, 0.5019608, 1, 1,
0.1713514, 0.4969932, 0.2846293, 0, 0.4941176, 1, 1,
0.1720016, 1.092916, -0.5560457, 0, 0.4901961, 1, 1,
0.1747516, 1.516417, 1.693551, 0, 0.4823529, 1, 1,
0.1748393, -1.177512, 4.08976, 0, 0.4784314, 1, 1,
0.1797821, -0.323873, 4.040251, 0, 0.4705882, 1, 1,
0.1803159, 1.239894, 1.386262, 0, 0.4666667, 1, 1,
0.1804879, 0.4691057, -0.2686181, 0, 0.4588235, 1, 1,
0.1883534, -0.9095524, 2.424123, 0, 0.454902, 1, 1,
0.1894553, -1.413898, 3.87816, 0, 0.4470588, 1, 1,
0.1896631, 0.06064659, 3.323031, 0, 0.4431373, 1, 1,
0.1900867, 1.33748, -0.02932463, 0, 0.4352941, 1, 1,
0.1904384, 2.173852, 0.09517848, 0, 0.4313726, 1, 1,
0.1909894, 0.01483174, -0.03898579, 0, 0.4235294, 1, 1,
0.1950484, -0.3303133, 2.051471, 0, 0.4196078, 1, 1,
0.201247, 1.015636, -0.471237, 0, 0.4117647, 1, 1,
0.2027383, -0.5743608, 1.657416, 0, 0.4078431, 1, 1,
0.2039125, 0.8307934, 0.6674103, 0, 0.4, 1, 1,
0.2079696, 1.085954, 0.2312483, 0, 0.3921569, 1, 1,
0.2097697, -2.291907, 3.218831, 0, 0.3882353, 1, 1,
0.2098564, -1.211608, 2.075593, 0, 0.3803922, 1, 1,
0.21094, 0.2220278, 1.158763, 0, 0.3764706, 1, 1,
0.2133965, 0.4306662, -1.241374, 0, 0.3686275, 1, 1,
0.2142061, 0.3635541, -0.1885754, 0, 0.3647059, 1, 1,
0.2195373, 1.607432, -0.2202833, 0, 0.3568628, 1, 1,
0.2195675, -0.8123801, 2.016035, 0, 0.3529412, 1, 1,
0.2250884, 1.507281, -0.3860244, 0, 0.345098, 1, 1,
0.2261048, -0.5242465, 3.49578, 0, 0.3411765, 1, 1,
0.2270498, 0.5737083, -0.3502715, 0, 0.3333333, 1, 1,
0.2289051, -1.648078, 4.032607, 0, 0.3294118, 1, 1,
0.2298622, 0.2327106, 0.4934743, 0, 0.3215686, 1, 1,
0.232404, 0.4898887, 1.490151, 0, 0.3176471, 1, 1,
0.2409646, -1.485625, 4.104094, 0, 0.3098039, 1, 1,
0.244043, 1.200485, 1.301566, 0, 0.3058824, 1, 1,
0.2500212, -0.4638251, 2.637441, 0, 0.2980392, 1, 1,
0.2526833, 0.7106411, 0.7819548, 0, 0.2901961, 1, 1,
0.2567776, -0.5749714, 3.124116, 0, 0.2862745, 1, 1,
0.2569562, -0.4951821, 3.205742, 0, 0.2784314, 1, 1,
0.2669389, -0.3696162, 2.659836, 0, 0.2745098, 1, 1,
0.2683745, -0.8777543, 1.833727, 0, 0.2666667, 1, 1,
0.2684818, -1.145461, 2.626079, 0, 0.2627451, 1, 1,
0.2744215, 2.644841, -0.1623819, 0, 0.254902, 1, 1,
0.2777747, -0.831648, 2.732278, 0, 0.2509804, 1, 1,
0.2781695, -0.7404104, 5.300068, 0, 0.2431373, 1, 1,
0.279086, -0.9501098, 2.996444, 0, 0.2392157, 1, 1,
0.2791464, 1.26036, 0.4068535, 0, 0.2313726, 1, 1,
0.2854694, 0.2529819, 0.9247149, 0, 0.227451, 1, 1,
0.2863742, -0.5111366, 1.449822, 0, 0.2196078, 1, 1,
0.2875364, -1.300312, 1.777262, 0, 0.2156863, 1, 1,
0.300907, -0.214845, 3.357982, 0, 0.2078431, 1, 1,
0.3009818, 1.01979, -1.229417, 0, 0.2039216, 1, 1,
0.3014443, -0.2525671, 1.953579, 0, 0.1960784, 1, 1,
0.3036688, -0.1855654, 1.65304, 0, 0.1882353, 1, 1,
0.3041089, -0.5096597, 2.294419, 0, 0.1843137, 1, 1,
0.3044651, -0.6463464, 1.334919, 0, 0.1764706, 1, 1,
0.3088984, 0.6246265, 1.327754, 0, 0.172549, 1, 1,
0.309255, 0.8094992, 2.935719, 0, 0.1647059, 1, 1,
0.3112375, 0.584479, -0.02752332, 0, 0.1607843, 1, 1,
0.3123349, 0.5575678, 0.1362351, 0, 0.1529412, 1, 1,
0.3141942, 0.7520111, -0.3642909, 0, 0.1490196, 1, 1,
0.3151295, -0.7199088, 2.938584, 0, 0.1411765, 1, 1,
0.3151365, 0.590515, -0.1151489, 0, 0.1372549, 1, 1,
0.3218809, -0.5491223, 1.278668, 0, 0.1294118, 1, 1,
0.3229107, 0.4365445, 2.988596, 0, 0.1254902, 1, 1,
0.3248914, 0.0594998, 1.39034, 0, 0.1176471, 1, 1,
0.32755, 0.6193867, 0.276338, 0, 0.1137255, 1, 1,
0.3291631, -0.7130539, 3.66642, 0, 0.1058824, 1, 1,
0.3296113, -0.6665366, 3.524997, 0, 0.09803922, 1, 1,
0.3325798, 1.843227, 0.4079496, 0, 0.09411765, 1, 1,
0.3358008, 1.309989, 1.172613, 0, 0.08627451, 1, 1,
0.3363455, 1.585557, -0.5343328, 0, 0.08235294, 1, 1,
0.337813, 1.310461, -0.4985551, 0, 0.07450981, 1, 1,
0.3387341, 0.6330504, -0.1577489, 0, 0.07058824, 1, 1,
0.3392226, -0.2735394, 2.386598, 0, 0.0627451, 1, 1,
0.3396474, 0.6790246, 0.4555247, 0, 0.05882353, 1, 1,
0.3408059, -0.8121113, 1.90961, 0, 0.05098039, 1, 1,
0.3408313, 0.5002138, 0.09292646, 0, 0.04705882, 1, 1,
0.348979, -0.7569965, 3.534549, 0, 0.03921569, 1, 1,
0.3492444, -0.677912, 3.936896, 0, 0.03529412, 1, 1,
0.3583538, -1.008811, 1.503484, 0, 0.02745098, 1, 1,
0.3585439, 0.589268, 0.2782654, 0, 0.02352941, 1, 1,
0.3604636, -1.294386, 4.331748, 0, 0.01568628, 1, 1,
0.3675012, 0.5368018, 1.837147, 0, 0.01176471, 1, 1,
0.3679586, -0.4957669, 1.63767, 0, 0.003921569, 1, 1,
0.3697622, 0.8387166, -0.1572522, 0.003921569, 0, 1, 1,
0.3705516, 1.609554, -0.5694264, 0.007843138, 0, 1, 1,
0.3756669, 1.505238, 2.066687, 0.01568628, 0, 1, 1,
0.3762464, 1.066999, 0.02908519, 0.01960784, 0, 1, 1,
0.3789992, -1.437291, 3.170528, 0.02745098, 0, 1, 1,
0.386756, -0.5640353, 2.586714, 0.03137255, 0, 1, 1,
0.3924187, -0.1798337, 2.063522, 0.03921569, 0, 1, 1,
0.3952103, 1.296379, -1.096667, 0.04313726, 0, 1, 1,
0.3993911, 0.1002761, 0.9520673, 0.05098039, 0, 1, 1,
0.4011927, -0.3520655, 5.471713, 0.05490196, 0, 1, 1,
0.4046538, -0.3987842, 3.454531, 0.0627451, 0, 1, 1,
0.4061243, -0.4526863, 2.481817, 0.06666667, 0, 1, 1,
0.4069253, -1.640005, 3.172896, 0.07450981, 0, 1, 1,
0.4086706, -0.4616494, 2.010794, 0.07843138, 0, 1, 1,
0.4112438, -0.8078393, 2.481352, 0.08627451, 0, 1, 1,
0.4159028, -0.6856971, 3.292184, 0.09019608, 0, 1, 1,
0.4212365, 1.278444, 1.039226, 0.09803922, 0, 1, 1,
0.4221832, -1.746484, 3.313263, 0.1058824, 0, 1, 1,
0.423713, -1.07981, 1.758414, 0.1098039, 0, 1, 1,
0.4307937, 1.649047, -1.816747, 0.1176471, 0, 1, 1,
0.4313194, -0.1333477, 0.03953679, 0.1215686, 0, 1, 1,
0.4339682, 0.2070297, 2.464189, 0.1294118, 0, 1, 1,
0.4386306, -0.7469994, 2.066813, 0.1333333, 0, 1, 1,
0.4400285, -0.3029965, 0.3933314, 0.1411765, 0, 1, 1,
0.4517613, 1.495319, 0.02849035, 0.145098, 0, 1, 1,
0.4557112, -0.4460912, 3.322485, 0.1529412, 0, 1, 1,
0.4557761, -0.6683138, 2.456859, 0.1568628, 0, 1, 1,
0.4571015, 0.5180241, 0.2175615, 0.1647059, 0, 1, 1,
0.4578412, 0.3183874, 0.6111004, 0.1686275, 0, 1, 1,
0.4578946, 0.07970041, 0.646148, 0.1764706, 0, 1, 1,
0.4610317, 0.4011306, 2.39096, 0.1803922, 0, 1, 1,
0.4668673, 0.7685022, -0.02418087, 0.1882353, 0, 1, 1,
0.478074, 0.2002205, 2.154924, 0.1921569, 0, 1, 1,
0.4790403, -0.5443112, 1.577121, 0.2, 0, 1, 1,
0.4907911, 0.2530352, 0.6619503, 0.2078431, 0, 1, 1,
0.4933376, 0.5994347, -0.3008198, 0.2117647, 0, 1, 1,
0.5006723, -0.8119915, 1.664917, 0.2196078, 0, 1, 1,
0.5121131, 0.2156306, 1.939126, 0.2235294, 0, 1, 1,
0.5184235, -0.5542883, 3.118865, 0.2313726, 0, 1, 1,
0.5235853, -0.6556681, 1.179149, 0.2352941, 0, 1, 1,
0.5315536, -1.157474, 2.879169, 0.2431373, 0, 1, 1,
0.5335137, -0.7028092, 3.067952, 0.2470588, 0, 1, 1,
0.5337279, -0.03567748, 2.380445, 0.254902, 0, 1, 1,
0.5404894, -0.2157409, 2.129279, 0.2588235, 0, 1, 1,
0.5420613, -0.1796163, 2.406549, 0.2666667, 0, 1, 1,
0.5469444, 0.9546657, 1.350683, 0.2705882, 0, 1, 1,
0.5475134, -1.19754, 2.107566, 0.2784314, 0, 1, 1,
0.5478678, -0.05158707, 1.711788, 0.282353, 0, 1, 1,
0.5519372, -1.186148, 2.633058, 0.2901961, 0, 1, 1,
0.5542918, -0.8691657, 3.960637, 0.2941177, 0, 1, 1,
0.554472, -0.868355, 2.112297, 0.3019608, 0, 1, 1,
0.5583966, -0.6088144, 4.075616, 0.3098039, 0, 1, 1,
0.5591683, -0.7484738, 3.023374, 0.3137255, 0, 1, 1,
0.5661983, -1.057275, 3.081292, 0.3215686, 0, 1, 1,
0.5683479, -0.4232752, 1.822845, 0.3254902, 0, 1, 1,
0.5708645, -1.540782, 2.166767, 0.3333333, 0, 1, 1,
0.5735755, -1.164141, 0.9783579, 0.3372549, 0, 1, 1,
0.5758107, -0.09683724, 2.385315, 0.345098, 0, 1, 1,
0.5807519, 0.7136714, -0.4071346, 0.3490196, 0, 1, 1,
0.5901338, -0.1330715, -0.3126525, 0.3568628, 0, 1, 1,
0.5919041, -0.1032692, 2.108541, 0.3607843, 0, 1, 1,
0.5961187, 0.6195258, 1.568832, 0.3686275, 0, 1, 1,
0.5965297, -1.389748, 3.920834, 0.372549, 0, 1, 1,
0.6007249, 0.2405846, 1.455143, 0.3803922, 0, 1, 1,
0.6024292, -0.8090911, 1.034326, 0.3843137, 0, 1, 1,
0.604398, -0.04331972, 4.342126, 0.3921569, 0, 1, 1,
0.6080686, 1.504813, 0.7810159, 0.3960784, 0, 1, 1,
0.6114318, 1.427063, -1.285243, 0.4039216, 0, 1, 1,
0.6126364, 2.248226, 0.1625328, 0.4117647, 0, 1, 1,
0.6136012, 0.6601039, -0.2338186, 0.4156863, 0, 1, 1,
0.6138797, -1.227789, 4.514291, 0.4235294, 0, 1, 1,
0.6151816, -1.418706, 3.039286, 0.427451, 0, 1, 1,
0.6171941, -1.63867, 3.117247, 0.4352941, 0, 1, 1,
0.6180227, -0.4888207, 2.644463, 0.4392157, 0, 1, 1,
0.630396, 0.5377039, 1.788216, 0.4470588, 0, 1, 1,
0.6328158, -1.58793, 3.440461, 0.4509804, 0, 1, 1,
0.6332755, 0.5624276, 0.07213853, 0.4588235, 0, 1, 1,
0.6367335, -0.470967, 1.939281, 0.4627451, 0, 1, 1,
0.6385953, 1.624314, 1.719561, 0.4705882, 0, 1, 1,
0.6414464, -0.8983172, 2.519819, 0.4745098, 0, 1, 1,
0.6424316, -0.04900169, 1.581342, 0.4823529, 0, 1, 1,
0.6425586, 0.4554117, 0.2733229, 0.4862745, 0, 1, 1,
0.6441095, -0.06506321, 1.447627, 0.4941176, 0, 1, 1,
0.6445233, -0.2432818, 2.70662, 0.5019608, 0, 1, 1,
0.6452422, -0.2000691, 2.019608, 0.5058824, 0, 1, 1,
0.6478607, 2.441033, 1.520387, 0.5137255, 0, 1, 1,
0.65075, -0.453558, 0.8768201, 0.5176471, 0, 1, 1,
0.6514008, 0.5726889, 0.5480935, 0.5254902, 0, 1, 1,
0.651561, -0.6299268, 3.110263, 0.5294118, 0, 1, 1,
0.6559669, -0.9630627, 3.443965, 0.5372549, 0, 1, 1,
0.6565921, 1.628404, 1.280726, 0.5411765, 0, 1, 1,
0.6717564, 0.176818, -0.4720733, 0.5490196, 0, 1, 1,
0.67542, 2.407524, -2.101752, 0.5529412, 0, 1, 1,
0.677904, 1.168531, 0.5376511, 0.5607843, 0, 1, 1,
0.6780812, 0.4458066, -0.3663242, 0.5647059, 0, 1, 1,
0.6794567, -1.659306, 2.495325, 0.572549, 0, 1, 1,
0.6795981, -0.0224182, 1.925056, 0.5764706, 0, 1, 1,
0.683946, 1.503181, 0.6914144, 0.5843138, 0, 1, 1,
0.6873249, -0.7631583, 2.188536, 0.5882353, 0, 1, 1,
0.6878988, -1.832916, 2.735184, 0.5960785, 0, 1, 1,
0.6900971, 1.079637, 1.796185, 0.6039216, 0, 1, 1,
0.6906044, -0.2874347, 3.440085, 0.6078432, 0, 1, 1,
0.691126, 1.237781, -0.3083915, 0.6156863, 0, 1, 1,
0.6928481, 0.5442034, -0.1068244, 0.6196079, 0, 1, 1,
0.6932228, 2.282639, -0.653222, 0.627451, 0, 1, 1,
0.6963536, -0.7179295, 3.744935, 0.6313726, 0, 1, 1,
0.7045289, 0.6437255, 3.088728, 0.6392157, 0, 1, 1,
0.7047357, -0.07521444, 3.635672, 0.6431373, 0, 1, 1,
0.7051978, -0.1806387, 2.085296, 0.6509804, 0, 1, 1,
0.7086545, -0.1478564, 2.567721, 0.654902, 0, 1, 1,
0.7111096, 1.67192, 0.865985, 0.6627451, 0, 1, 1,
0.7135993, 0.1385595, 1.767304, 0.6666667, 0, 1, 1,
0.7161866, -0.2976484, 2.233364, 0.6745098, 0, 1, 1,
0.7204908, -0.03906786, 2.374524, 0.6784314, 0, 1, 1,
0.7250752, 1.69169, 0.2452883, 0.6862745, 0, 1, 1,
0.7250813, -0.3075302, 2.120615, 0.6901961, 0, 1, 1,
0.7255586, 0.382107, 1.960945, 0.6980392, 0, 1, 1,
0.726228, 0.7048643, 1.451759, 0.7058824, 0, 1, 1,
0.7290442, -1.495378, 2.569287, 0.7098039, 0, 1, 1,
0.7327726, 0.07930665, 1.506621, 0.7176471, 0, 1, 1,
0.7351063, -0.8894476, 2.000406, 0.7215686, 0, 1, 1,
0.7368366, 0.0921107, 0.669411, 0.7294118, 0, 1, 1,
0.7435564, 0.9215521, 0.3400536, 0.7333333, 0, 1, 1,
0.7580107, 2.332216, 0.154065, 0.7411765, 0, 1, 1,
0.7632242, 0.2224295, 1.233899, 0.7450981, 0, 1, 1,
0.7694552, -0.08394022, 0.5709683, 0.7529412, 0, 1, 1,
0.7739475, 0.3109312, 1.362112, 0.7568628, 0, 1, 1,
0.7792969, 1.587319, 1.298502, 0.7647059, 0, 1, 1,
0.7848536, -0.4443633, 1.857782, 0.7686275, 0, 1, 1,
0.7943174, -0.1231987, 0.3796997, 0.7764706, 0, 1, 1,
0.7952855, 1.020585, 0.8612657, 0.7803922, 0, 1, 1,
0.8001343, -0.6217134, 2.119951, 0.7882353, 0, 1, 1,
0.8004312, 0.1347508, 2.761811, 0.7921569, 0, 1, 1,
0.8078642, 1.170434, -0.3933098, 0.8, 0, 1, 1,
0.8180906, 0.2299413, 2.239721, 0.8078431, 0, 1, 1,
0.8226425, 1.000492, 1.103867, 0.8117647, 0, 1, 1,
0.8349563, -1.117242, 1.935545, 0.8196079, 0, 1, 1,
0.8357709, 0.05807427, 1.307388, 0.8235294, 0, 1, 1,
0.8571204, -0.1810637, 2.478927, 0.8313726, 0, 1, 1,
0.8637674, -0.8847072, 3.778662, 0.8352941, 0, 1, 1,
0.8714154, 0.1259123, 1.229355, 0.8431373, 0, 1, 1,
0.8740625, 1.508495, 0.7435374, 0.8470588, 0, 1, 1,
0.8741612, -1.265479, 3.217882, 0.854902, 0, 1, 1,
0.8828399, 0.810112, 1.163306, 0.8588235, 0, 1, 1,
0.8843694, -0.3072498, 2.244125, 0.8666667, 0, 1, 1,
0.8854246, -0.3738172, 3.068834, 0.8705882, 0, 1, 1,
0.8963642, 0.7647763, 1.509802, 0.8784314, 0, 1, 1,
0.8964458, 0.8890185, 1.65927, 0.8823529, 0, 1, 1,
0.8984283, 1.810344, -0.890191, 0.8901961, 0, 1, 1,
0.9030521, -0.5140848, 2.664053, 0.8941177, 0, 1, 1,
0.9040331, -0.4592245, 0.5064936, 0.9019608, 0, 1, 1,
0.9043708, -0.2694576, 2.757675, 0.9098039, 0, 1, 1,
0.904607, 0.3454635, 3.208515, 0.9137255, 0, 1, 1,
0.9065549, -1.222402, 1.627206, 0.9215686, 0, 1, 1,
0.9105545, 0.3317637, 0.8766694, 0.9254902, 0, 1, 1,
0.9171425, -2.008106, 2.929574, 0.9333333, 0, 1, 1,
0.9191802, -0.0007957575, 3.185604, 0.9372549, 0, 1, 1,
0.9222708, 1.378644, -0.2087424, 0.945098, 0, 1, 1,
0.9254566, 0.2003818, 1.866193, 0.9490196, 0, 1, 1,
0.9364011, 0.2371923, 1.910503, 0.9568627, 0, 1, 1,
0.9470979, 0.8471355, 1.04536, 0.9607843, 0, 1, 1,
0.9475926, -2.439524, 2.391797, 0.9686275, 0, 1, 1,
0.9553146, -0.01902569, 3.085621, 0.972549, 0, 1, 1,
0.9563783, -0.448217, -0.07433785, 0.9803922, 0, 1, 1,
0.9642758, -0.8755201, 2.447248, 0.9843137, 0, 1, 1,
0.9645858, 0.4956137, 1.956194, 0.9921569, 0, 1, 1,
0.9713953, 1.243491, 0.9247811, 0.9960784, 0, 1, 1,
0.9771243, 0.3442401, 0.8080217, 1, 0, 0.9960784, 1,
0.9841853, 0.6038659, 1.171104, 1, 0, 0.9882353, 1,
0.9920005, 0.6148278, -1.067385, 1, 0, 0.9843137, 1,
0.9923611, 0.2998666, 0.758285, 1, 0, 0.9764706, 1,
0.9969862, 0.1097386, 1.458292, 1, 0, 0.972549, 1,
1.001354, 0.53732, 1.666875, 1, 0, 0.9647059, 1,
1.005705, -0.2777179, 2.603774, 1, 0, 0.9607843, 1,
1.008574, 0.2411338, 1.76192, 1, 0, 0.9529412, 1,
1.014689, -2.21169, 0.9467463, 1, 0, 0.9490196, 1,
1.014848, 0.5492008, 1.369572, 1, 0, 0.9411765, 1,
1.02063, -0.2041151, 1.951826, 1, 0, 0.9372549, 1,
1.020659, 0.2417662, 1.942608, 1, 0, 0.9294118, 1,
1.030643, 1.126135, 1.779259, 1, 0, 0.9254902, 1,
1.032213, 0.338347, 0.8469127, 1, 0, 0.9176471, 1,
1.037255, -0.2952315, 0.2458371, 1, 0, 0.9137255, 1,
1.042735, 0.5106394, 1.645877, 1, 0, 0.9058824, 1,
1.043497, 0.1289229, 2.34235, 1, 0, 0.9019608, 1,
1.045651, 0.06227347, 1.726998, 1, 0, 0.8941177, 1,
1.053229, 1.171252, 2.239731, 1, 0, 0.8862745, 1,
1.058024, 0.1286867, 0.5499517, 1, 0, 0.8823529, 1,
1.068668, 0.3361175, 3.106517, 1, 0, 0.8745098, 1,
1.075485, -2.096533, 1.907873, 1, 0, 0.8705882, 1,
1.076142, 0.4198653, -0.2538906, 1, 0, 0.8627451, 1,
1.077551, -0.6904163, 2.015018, 1, 0, 0.8588235, 1,
1.083785, 1.101889, 0.0783224, 1, 0, 0.8509804, 1,
1.089687, 0.6283923, 1.704013, 1, 0, 0.8470588, 1,
1.099954, 0.0330366, 0.7144641, 1, 0, 0.8392157, 1,
1.10368, 1.422102, 0.9946722, 1, 0, 0.8352941, 1,
1.106885, 0.0195803, 2.820972, 1, 0, 0.827451, 1,
1.117123, 0.6089034, 0.5312509, 1, 0, 0.8235294, 1,
1.118514, 0.642741, -0.6063797, 1, 0, 0.8156863, 1,
1.120408, 1.757089, 0.4260892, 1, 0, 0.8117647, 1,
1.125902, 0.09929167, 1.743322, 1, 0, 0.8039216, 1,
1.128953, 0.9494069, 0.2089315, 1, 0, 0.7960784, 1,
1.133631, -0.05598292, 2.158952, 1, 0, 0.7921569, 1,
1.135419, 0.1802429, 2.029713, 1, 0, 0.7843137, 1,
1.136047, -1.460965, 2.239962, 1, 0, 0.7803922, 1,
1.139324, -0.2901372, 2.435139, 1, 0, 0.772549, 1,
1.144494, 0.8386347, 1.045183, 1, 0, 0.7686275, 1,
1.146363, 0.3406394, 1.553261, 1, 0, 0.7607843, 1,
1.153401, -1.744217, 3.40241, 1, 0, 0.7568628, 1,
1.159168, -0.3668189, 3.477371, 1, 0, 0.7490196, 1,
1.16278, 2.186895, 0.03723242, 1, 0, 0.7450981, 1,
1.166356, -1.457505, 2.01071, 1, 0, 0.7372549, 1,
1.170025, -0.65694, 1.942416, 1, 0, 0.7333333, 1,
1.177881, 0.5025252, 1.253424, 1, 0, 0.7254902, 1,
1.184615, 1.004451, 1.397159, 1, 0, 0.7215686, 1,
1.187197, -1.048426, 3.050483, 1, 0, 0.7137255, 1,
1.191589, -1.055418, 1.969628, 1, 0, 0.7098039, 1,
1.194046, 0.4335775, -0.9508559, 1, 0, 0.7019608, 1,
1.20426, 2.347835, -0.2065476, 1, 0, 0.6941177, 1,
1.215883, 0.5827712, 1.68588, 1, 0, 0.6901961, 1,
1.22346, -0.7920784, 0.9414907, 1, 0, 0.682353, 1,
1.22428, 0.3376624, 1.632473, 1, 0, 0.6784314, 1,
1.230546, 0.3610297, 1.67395, 1, 0, 0.6705883, 1,
1.231998, -0.7593607, 1.955079, 1, 0, 0.6666667, 1,
1.232174, 1.168075, 1.660516, 1, 0, 0.6588235, 1,
1.236529, -0.195203, 3.333122, 1, 0, 0.654902, 1,
1.249267, 0.5070132, 0.4873673, 1, 0, 0.6470588, 1,
1.290092, -0.9489861, 0.6591026, 1, 0, 0.6431373, 1,
1.306867, -0.4865607, 2.925818, 1, 0, 0.6352941, 1,
1.311326, 1.260542, -0.05822052, 1, 0, 0.6313726, 1,
1.313777, 1.323441, -0.1037691, 1, 0, 0.6235294, 1,
1.317194, -0.6793057, 2.173185, 1, 0, 0.6196079, 1,
1.32217, 1.008776, -0.07910935, 1, 0, 0.6117647, 1,
1.32446, -0.564452, 0.638706, 1, 0, 0.6078432, 1,
1.324838, -0.1004531, 1.756191, 1, 0, 0.6, 1,
1.325343, 1.374026, 1.661546, 1, 0, 0.5921569, 1,
1.327991, -0.7449048, 3.43423, 1, 0, 0.5882353, 1,
1.330789, 1.663683, 0.5014942, 1, 0, 0.5803922, 1,
1.333171, -1.603141, 1.566304, 1, 0, 0.5764706, 1,
1.339269, 1.28412, 1.38441, 1, 0, 0.5686275, 1,
1.340254, 0.1155998, 0.3045528, 1, 0, 0.5647059, 1,
1.344815, -0.7073528, 2.358109, 1, 0, 0.5568628, 1,
1.356425, -0.1200126, 2.694357, 1, 0, 0.5529412, 1,
1.376712, 0.3704377, 2.728065, 1, 0, 0.5450981, 1,
1.383374, 0.09743303, 1.002622, 1, 0, 0.5411765, 1,
1.390627, 0.4485701, -1.753098, 1, 0, 0.5333334, 1,
1.390999, 0.5003027, 1.287806, 1, 0, 0.5294118, 1,
1.396508, 1.049551, 0.6923032, 1, 0, 0.5215687, 1,
1.400099, 0.004464594, 3.253223, 1, 0, 0.5176471, 1,
1.407471, 0.8067173, -0.406815, 1, 0, 0.509804, 1,
1.410842, -1.902153, 1.411185, 1, 0, 0.5058824, 1,
1.433846, -0.1686433, -0.7231933, 1, 0, 0.4980392, 1,
1.43408, -0.07045991, 2.916793, 1, 0, 0.4901961, 1,
1.443727, -1.224694, 2.151623, 1, 0, 0.4862745, 1,
1.471154, -1.855082, 2.276201, 1, 0, 0.4784314, 1,
1.477139, -0.3016793, 2.42035, 1, 0, 0.4745098, 1,
1.479574, -0.2842406, 3.036464, 1, 0, 0.4666667, 1,
1.482384, 0.1525512, 1.31102, 1, 0, 0.4627451, 1,
1.488665, -1.180996, 1.850718, 1, 0, 0.454902, 1,
1.490739, -0.2062747, 2.247101, 1, 0, 0.4509804, 1,
1.499342, -0.7688559, 2.980038, 1, 0, 0.4431373, 1,
1.500877, -0.5434824, 3.138122, 1, 0, 0.4392157, 1,
1.50371, -1.079343, 1.329093, 1, 0, 0.4313726, 1,
1.507093, 1.297951, 2.725575, 1, 0, 0.427451, 1,
1.534336, -0.2847962, 0.3747759, 1, 0, 0.4196078, 1,
1.546309, -0.01187505, 1.449799, 1, 0, 0.4156863, 1,
1.562616, -0.8253907, 1.190401, 1, 0, 0.4078431, 1,
1.579065, 0.1021592, 2.208507, 1, 0, 0.4039216, 1,
1.579108, 0.7352156, 0.5849042, 1, 0, 0.3960784, 1,
1.579358, 0.5020936, 2.453147, 1, 0, 0.3882353, 1,
1.603072, -0.2551246, 2.545523, 1, 0, 0.3843137, 1,
1.610611, 0.1175098, -0.1983523, 1, 0, 0.3764706, 1,
1.622398, -0.5408488, 3.445342, 1, 0, 0.372549, 1,
1.635594, 0.7161413, -0.511027, 1, 0, 0.3647059, 1,
1.638291, 0.7560402, -1.702557, 1, 0, 0.3607843, 1,
1.641405, -1.315226, 2.293089, 1, 0, 0.3529412, 1,
1.643668, 0.2719494, 2.038881, 1, 0, 0.3490196, 1,
1.663488, 1.63126, 1.057566, 1, 0, 0.3411765, 1,
1.669524, -0.314463, 1.443079, 1, 0, 0.3372549, 1,
1.679928, 2.199478, 2.244977, 1, 0, 0.3294118, 1,
1.688863, -0.2604157, 0.7404602, 1, 0, 0.3254902, 1,
1.693767, -1.223003, 0.7110005, 1, 0, 0.3176471, 1,
1.705844, -0.2688973, -0.7993584, 1, 0, 0.3137255, 1,
1.710458, -0.8883111, 2.707636, 1, 0, 0.3058824, 1,
1.711665, 0.001177874, 2.110054, 1, 0, 0.2980392, 1,
1.730989, 0.7352234, 1.956901, 1, 0, 0.2941177, 1,
1.733725, -0.00123885, 0.8137451, 1, 0, 0.2862745, 1,
1.736381, 0.8825883, 0.5622439, 1, 0, 0.282353, 1,
1.743592, 0.1087683, 1.818725, 1, 0, 0.2745098, 1,
1.746609, 0.8042918, 2.948745, 1, 0, 0.2705882, 1,
1.752488, -1.098655, 1.74477, 1, 0, 0.2627451, 1,
1.779446, 0.5002612, 1.468311, 1, 0, 0.2588235, 1,
1.789298, -0.6151304, -0.1721115, 1, 0, 0.2509804, 1,
1.800286, 0.7806103, 1.038845, 1, 0, 0.2470588, 1,
1.81572, -0.1015368, 3.733246, 1, 0, 0.2392157, 1,
1.822756, 1.281302, -1.947044, 1, 0, 0.2352941, 1,
1.845371, -0.304748, 1.103352, 1, 0, 0.227451, 1,
1.847965, 0.4743818, 2.920152, 1, 0, 0.2235294, 1,
1.856932, 0.3964912, 1.430418, 1, 0, 0.2156863, 1,
1.868683, -1.518842, 0.8947394, 1, 0, 0.2117647, 1,
1.878036, -0.09739209, -0.2101322, 1, 0, 0.2039216, 1,
1.901403, 1.709764, -0.1683524, 1, 0, 0.1960784, 1,
1.911664, -0.2114824, -0.9675332, 1, 0, 0.1921569, 1,
1.920419, -0.09580436, 2.19572, 1, 0, 0.1843137, 1,
1.92483, 1.621426, 2.359101, 1, 0, 0.1803922, 1,
1.958502, 0.7928365, 2.172909, 1, 0, 0.172549, 1,
1.959429, 0.08036204, 2.148568, 1, 0, 0.1686275, 1,
1.976557, 0.718839, 0.06230259, 1, 0, 0.1607843, 1,
1.979336, -0.5471913, 4.138185, 1, 0, 0.1568628, 1,
1.985221, -0.914302, 1.71877, 1, 0, 0.1490196, 1,
1.994875, -0.7839311, 0.8868157, 1, 0, 0.145098, 1,
2.002702, 1.7362, 0.184418, 1, 0, 0.1372549, 1,
2.02003, -0.8665233, 2.418883, 1, 0, 0.1333333, 1,
2.048714, 1.395582, 1.661631, 1, 0, 0.1254902, 1,
2.053149, -0.5245672, 1.259687, 1, 0, 0.1215686, 1,
2.087722, -1.529932, 2.057523, 1, 0, 0.1137255, 1,
2.176867, 0.3302647, 1.165164, 1, 0, 0.1098039, 1,
2.185622, 0.2960528, 2.456738, 1, 0, 0.1019608, 1,
2.186382, -2.092273, 2.26633, 1, 0, 0.09411765, 1,
2.189328, -1.764893, 1.948689, 1, 0, 0.09019608, 1,
2.18993, 0.2169218, 0.7204227, 1, 0, 0.08235294, 1,
2.201263, 0.12237, 2.345902, 1, 0, 0.07843138, 1,
2.217736, -0.1573993, 0.6690004, 1, 0, 0.07058824, 1,
2.235546, 0.9408413, 0.8434115, 1, 0, 0.06666667, 1,
2.262711, -0.738156, 1.626541, 1, 0, 0.05882353, 1,
2.315586, 1.537113, -0.6087052, 1, 0, 0.05490196, 1,
2.318012, 0.01789944, 1.632409, 1, 0, 0.04705882, 1,
2.328588, 0.6662387, -0.8315279, 1, 0, 0.04313726, 1,
2.349682, 0.7237327, 0.7479855, 1, 0, 0.03529412, 1,
2.403095, -0.2855805, 2.612726, 1, 0, 0.03137255, 1,
2.435602, 0.5405086, 3.138115, 1, 0, 0.02352941, 1,
2.44577, 1.297604, 1.721591, 1, 0, 0.01960784, 1,
2.609937, 1.7321, 2.129511, 1, 0, 0.01176471, 1,
2.854532, -0.9180763, 2.339821, 1, 0, 0.007843138, 1
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
-0.2884161, -4.021617, -7.748381, 0, -0.5, 0.5, 0.5,
-0.2884161, -4.021617, -7.748381, 1, -0.5, 0.5, 0.5,
-0.2884161, -4.021617, -7.748381, 1, 1.5, 0.5, 0.5,
-0.2884161, -4.021617, -7.748381, 0, 1.5, 0.5, 0.5
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
-4.496824, 0.4980813, -7.748381, 0, -0.5, 0.5, 0.5,
-4.496824, 0.4980813, -7.748381, 1, -0.5, 0.5, 0.5,
-4.496824, 0.4980813, -7.748381, 1, 1.5, 0.5, 0.5,
-4.496824, 0.4980813, -7.748381, 0, 1.5, 0.5, 0.5
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
-4.496824, -4.021617, -0.1803153, 0, -0.5, 0.5, 0.5,
-4.496824, -4.021617, -0.1803153, 1, -0.5, 0.5, 0.5,
-4.496824, -4.021617, -0.1803153, 1, 1.5, 0.5, 0.5,
-4.496824, -4.021617, -0.1803153, 0, 1.5, 0.5, 0.5
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
-3, -2.97861, -6.001904,
2, -2.97861, -6.001904,
-3, -2.97861, -6.001904,
-3, -3.152444, -6.292984,
-2, -2.97861, -6.001904,
-2, -3.152444, -6.292984,
-1, -2.97861, -6.001904,
-1, -3.152444, -6.292984,
0, -2.97861, -6.001904,
0, -3.152444, -6.292984,
1, -2.97861, -6.001904,
1, -3.152444, -6.292984,
2, -2.97861, -6.001904,
2, -3.152444, -6.292984
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
-3, -3.500113, -6.875142, 0, -0.5, 0.5, 0.5,
-3, -3.500113, -6.875142, 1, -0.5, 0.5, 0.5,
-3, -3.500113, -6.875142, 1, 1.5, 0.5, 0.5,
-3, -3.500113, -6.875142, 0, 1.5, 0.5, 0.5,
-2, -3.500113, -6.875142, 0, -0.5, 0.5, 0.5,
-2, -3.500113, -6.875142, 1, -0.5, 0.5, 0.5,
-2, -3.500113, -6.875142, 1, 1.5, 0.5, 0.5,
-2, -3.500113, -6.875142, 0, 1.5, 0.5, 0.5,
-1, -3.500113, -6.875142, 0, -0.5, 0.5, 0.5,
-1, -3.500113, -6.875142, 1, -0.5, 0.5, 0.5,
-1, -3.500113, -6.875142, 1, 1.5, 0.5, 0.5,
-1, -3.500113, -6.875142, 0, 1.5, 0.5, 0.5,
0, -3.500113, -6.875142, 0, -0.5, 0.5, 0.5,
0, -3.500113, -6.875142, 1, -0.5, 0.5, 0.5,
0, -3.500113, -6.875142, 1, 1.5, 0.5, 0.5,
0, -3.500113, -6.875142, 0, 1.5, 0.5, 0.5,
1, -3.500113, -6.875142, 0, -0.5, 0.5, 0.5,
1, -3.500113, -6.875142, 1, -0.5, 0.5, 0.5,
1, -3.500113, -6.875142, 1, 1.5, 0.5, 0.5,
1, -3.500113, -6.875142, 0, 1.5, 0.5, 0.5,
2, -3.500113, -6.875142, 0, -0.5, 0.5, 0.5,
2, -3.500113, -6.875142, 1, -0.5, 0.5, 0.5,
2, -3.500113, -6.875142, 1, 1.5, 0.5, 0.5,
2, -3.500113, -6.875142, 0, 1.5, 0.5, 0.5
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
-3.525653, -2, -6.001904,
-3.525653, 3, -6.001904,
-3.525653, -2, -6.001904,
-3.687515, -2, -6.292984,
-3.525653, -1, -6.001904,
-3.687515, -1, -6.292984,
-3.525653, 0, -6.001904,
-3.687515, 0, -6.292984,
-3.525653, 1, -6.001904,
-3.687515, 1, -6.292984,
-3.525653, 2, -6.001904,
-3.687515, 2, -6.292984,
-3.525653, 3, -6.001904,
-3.687515, 3, -6.292984
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
-4.011239, -2, -6.875142, 0, -0.5, 0.5, 0.5,
-4.011239, -2, -6.875142, 1, -0.5, 0.5, 0.5,
-4.011239, -2, -6.875142, 1, 1.5, 0.5, 0.5,
-4.011239, -2, -6.875142, 0, 1.5, 0.5, 0.5,
-4.011239, -1, -6.875142, 0, -0.5, 0.5, 0.5,
-4.011239, -1, -6.875142, 1, -0.5, 0.5, 0.5,
-4.011239, -1, -6.875142, 1, 1.5, 0.5, 0.5,
-4.011239, -1, -6.875142, 0, 1.5, 0.5, 0.5,
-4.011239, 0, -6.875142, 0, -0.5, 0.5, 0.5,
-4.011239, 0, -6.875142, 1, -0.5, 0.5, 0.5,
-4.011239, 0, -6.875142, 1, 1.5, 0.5, 0.5,
-4.011239, 0, -6.875142, 0, 1.5, 0.5, 0.5,
-4.011239, 1, -6.875142, 0, -0.5, 0.5, 0.5,
-4.011239, 1, -6.875142, 1, -0.5, 0.5, 0.5,
-4.011239, 1, -6.875142, 1, 1.5, 0.5, 0.5,
-4.011239, 1, -6.875142, 0, 1.5, 0.5, 0.5,
-4.011239, 2, -6.875142, 0, -0.5, 0.5, 0.5,
-4.011239, 2, -6.875142, 1, -0.5, 0.5, 0.5,
-4.011239, 2, -6.875142, 1, 1.5, 0.5, 0.5,
-4.011239, 2, -6.875142, 0, 1.5, 0.5, 0.5,
-4.011239, 3, -6.875142, 0, -0.5, 0.5, 0.5,
-4.011239, 3, -6.875142, 1, -0.5, 0.5, 0.5,
-4.011239, 3, -6.875142, 1, 1.5, 0.5, 0.5,
-4.011239, 3, -6.875142, 0, 1.5, 0.5, 0.5
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
-3.525653, -2.97861, -4,
-3.525653, -2.97861, 4,
-3.525653, -2.97861, -4,
-3.687515, -3.152444, -4,
-3.525653, -2.97861, -2,
-3.687515, -3.152444, -2,
-3.525653, -2.97861, 0,
-3.687515, -3.152444, 0,
-3.525653, -2.97861, 2,
-3.687515, -3.152444, 2,
-3.525653, -2.97861, 4,
-3.687515, -3.152444, 4
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
-4.011239, -3.500113, -4, 0, -0.5, 0.5, 0.5,
-4.011239, -3.500113, -4, 1, -0.5, 0.5, 0.5,
-4.011239, -3.500113, -4, 1, 1.5, 0.5, 0.5,
-4.011239, -3.500113, -4, 0, 1.5, 0.5, 0.5,
-4.011239, -3.500113, -2, 0, -0.5, 0.5, 0.5,
-4.011239, -3.500113, -2, 1, -0.5, 0.5, 0.5,
-4.011239, -3.500113, -2, 1, 1.5, 0.5, 0.5,
-4.011239, -3.500113, -2, 0, 1.5, 0.5, 0.5,
-4.011239, -3.500113, 0, 0, -0.5, 0.5, 0.5,
-4.011239, -3.500113, 0, 1, -0.5, 0.5, 0.5,
-4.011239, -3.500113, 0, 1, 1.5, 0.5, 0.5,
-4.011239, -3.500113, 0, 0, 1.5, 0.5, 0.5,
-4.011239, -3.500113, 2, 0, -0.5, 0.5, 0.5,
-4.011239, -3.500113, 2, 1, -0.5, 0.5, 0.5,
-4.011239, -3.500113, 2, 1, 1.5, 0.5, 0.5,
-4.011239, -3.500113, 2, 0, 1.5, 0.5, 0.5,
-4.011239, -3.500113, 4, 0, -0.5, 0.5, 0.5,
-4.011239, -3.500113, 4, 1, -0.5, 0.5, 0.5,
-4.011239, -3.500113, 4, 1, 1.5, 0.5, 0.5,
-4.011239, -3.500113, 4, 0, 1.5, 0.5, 0.5
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
-3.525653, -2.97861, -6.001904,
-3.525653, 3.974772, -6.001904,
-3.525653, -2.97861, 5.641273,
-3.525653, 3.974772, 5.641273,
-3.525653, -2.97861, -6.001904,
-3.525653, -2.97861, 5.641273,
-3.525653, 3.974772, -6.001904,
-3.525653, 3.974772, 5.641273,
-3.525653, -2.97861, -6.001904,
2.948821, -2.97861, -6.001904,
-3.525653, -2.97861, 5.641273,
2.948821, -2.97861, 5.641273,
-3.525653, 3.974772, -6.001904,
2.948821, 3.974772, -6.001904,
-3.525653, 3.974772, 5.641273,
2.948821, 3.974772, 5.641273,
2.948821, -2.97861, -6.001904,
2.948821, 3.974772, -6.001904,
2.948821, -2.97861, 5.641273,
2.948821, 3.974772, 5.641273,
2.948821, -2.97861, -6.001904,
2.948821, -2.97861, 5.641273,
2.948821, 3.974772, -6.001904,
2.948821, 3.974772, 5.641273
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
var radius = 8.024503;
var distance = 35.70192;
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
mvMatrix.translate( 0.2884161, -0.4980813, 0.1803153 );
mvMatrix.scale( 1.34007, 1.247774, 0.7451789 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.70192);
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
methyl_m-hydroxycarb<-read.table("methyl_m-hydroxycarb.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-methyl_m-hydroxycarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'methyl_m' not found
```

```r
y<-methyl_m-hydroxycarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'methyl_m' not found
```

```r
z<-methyl_m-hydroxycarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'methyl_m' not found
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
-3.431365, 0.3544298, -0.7071267, 0, 0, 1, 1, 1,
-3.366625, 1.558749, -2.119145, 1, 0, 0, 1, 1,
-2.919251, 0.7176673, -1.39203, 1, 0, 0, 1, 1,
-2.915708, 0.883027, -2.042545, 1, 0, 0, 1, 1,
-2.915515, -2.065212, -1.813069, 1, 0, 0, 1, 1,
-2.816576, -0.9655539, -1.983255, 1, 0, 0, 1, 1,
-2.597373, -0.7980055, -1.962188, 0, 0, 0, 1, 1,
-2.476173, 0.3600046, -0.961823, 0, 0, 0, 1, 1,
-2.425769, 1.967734, -0.8916334, 0, 0, 0, 1, 1,
-2.402294, 0.7717912, -1.717959, 0, 0, 0, 1, 1,
-2.367541, 0.4564222, -3.101339, 0, 0, 0, 1, 1,
-2.298849, -0.005207397, 0.6529654, 0, 0, 0, 1, 1,
-2.288969, 1.203998, -0.9399976, 0, 0, 0, 1, 1,
-2.212342, 0.859063, 0.003408245, 1, 1, 1, 1, 1,
-2.197751, 0.9782872, -0.3102991, 1, 1, 1, 1, 1,
-2.146963, -0.05486239, -1.183988, 1, 1, 1, 1, 1,
-2.12478, -1.241596, -2.589694, 1, 1, 1, 1, 1,
-2.115377, 0.7704283, -1.961311, 1, 1, 1, 1, 1,
-2.078036, -0.1616663, -1.651015, 1, 1, 1, 1, 1,
-2.074063, -0.1814375, -2.631358, 1, 1, 1, 1, 1,
-2.065225, 0.2949346, 0.2211733, 1, 1, 1, 1, 1,
-2.034144, 1.061814, -0.4278438, 1, 1, 1, 1, 1,
-2.01684, 0.6300779, -1.513612, 1, 1, 1, 1, 1,
-2.009158, 0.7340724, -2.03707, 1, 1, 1, 1, 1,
-1.909286, -0.7120892, -1.971469, 1, 1, 1, 1, 1,
-1.906165, -0.1398927, -0.2307212, 1, 1, 1, 1, 1,
-1.899528, 0.4625622, -1.512051, 1, 1, 1, 1, 1,
-1.873374, 0.07909194, -0.2859413, 1, 1, 1, 1, 1,
-1.852588, 0.3584652, 0.07545391, 0, 0, 1, 1, 1,
-1.804115, 1.786191, 0.4527473, 1, 0, 0, 1, 1,
-1.798195, 0.286137, -3.043364, 1, 0, 0, 1, 1,
-1.786894, -0.1460104, 0.06915202, 1, 0, 0, 1, 1,
-1.771592, 0.7302564, -1.665336, 1, 0, 0, 1, 1,
-1.771367, 1.537246, -2.065478, 1, 0, 0, 1, 1,
-1.756706, 0.06475955, -0.2629241, 0, 0, 0, 1, 1,
-1.728803, 0.8461707, -1.856855, 0, 0, 0, 1, 1,
-1.725976, 1.269096, -0.1740259, 0, 0, 0, 1, 1,
-1.695513, -0.6400253, -1.121881, 0, 0, 0, 1, 1,
-1.690136, -0.3480484, -1.403593, 0, 0, 0, 1, 1,
-1.673381, 0.6540754, -0.7722558, 0, 0, 0, 1, 1,
-1.6588, -0.5272458, -1.30933, 0, 0, 0, 1, 1,
-1.656047, -2.877347, -0.7900549, 1, 1, 1, 1, 1,
-1.647821, 1.750306, -0.6867164, 1, 1, 1, 1, 1,
-1.645003, -0.170929, -2.281788, 1, 1, 1, 1, 1,
-1.636321, -0.3159191, -3.842471, 1, 1, 1, 1, 1,
-1.635711, 0.402585, -2.582921, 1, 1, 1, 1, 1,
-1.629647, -1.412436, -2.101829, 1, 1, 1, 1, 1,
-1.628397, 0.4694768, -1.62984, 1, 1, 1, 1, 1,
-1.605215, -0.608095, -1.712502, 1, 1, 1, 1, 1,
-1.593694, 0.03590398, -2.305326, 1, 1, 1, 1, 1,
-1.592857, -0.1301476, -1.517684, 1, 1, 1, 1, 1,
-1.579603, -0.06525007, -0.7142581, 1, 1, 1, 1, 1,
-1.57874, -1.904324, -3.997643, 1, 1, 1, 1, 1,
-1.57401, -1.096048, -1.501285, 1, 1, 1, 1, 1,
-1.571371, -0.6448687, -2.452009, 1, 1, 1, 1, 1,
-1.550377, -0.8646481, 0.07763053, 1, 1, 1, 1, 1,
-1.54829, 0.4830147, -1.066256, 0, 0, 1, 1, 1,
-1.535647, 0.4714652, -2.342733, 1, 0, 0, 1, 1,
-1.515433, -0.7201633, -2.385986, 1, 0, 0, 1, 1,
-1.51529, 0.8798265, -1.928374, 1, 0, 0, 1, 1,
-1.486131, 0.2243908, -0.3846871, 1, 0, 0, 1, 1,
-1.477571, 0.2383553, -0.7878926, 1, 0, 0, 1, 1,
-1.475355, 1.350858, -0.5959844, 0, 0, 0, 1, 1,
-1.47525, -0.2200943, -1.244462, 0, 0, 0, 1, 1,
-1.455128, 0.3867674, -1.354894, 0, 0, 0, 1, 1,
-1.453594, -0.213757, -2.354309, 0, 0, 0, 1, 1,
-1.449947, 0.3543796, -0.2332584, 0, 0, 0, 1, 1,
-1.448003, 1.346871, -1.628131, 0, 0, 0, 1, 1,
-1.441987, 1.02659, -2.111775, 0, 0, 0, 1, 1,
-1.437783, 2.18114, -2.445484, 1, 1, 1, 1, 1,
-1.433887, -0.4106135, -4.890147, 1, 1, 1, 1, 1,
-1.421725, 0.9525172, -2.486668, 1, 1, 1, 1, 1,
-1.413532, 0.1599076, -1.348499, 1, 1, 1, 1, 1,
-1.403223, -0.6758527, -1.110133, 1, 1, 1, 1, 1,
-1.382406, -1.300851, -3.260266, 1, 1, 1, 1, 1,
-1.375368, 0.04029784, -1.125135, 1, 1, 1, 1, 1,
-1.371866, 0.6184597, -1.113664, 1, 1, 1, 1, 1,
-1.367008, 0.3197041, -1.425763, 1, 1, 1, 1, 1,
-1.366814, -0.1177062, -3.141532, 1, 1, 1, 1, 1,
-1.364022, -0.4702238, -1.49207, 1, 1, 1, 1, 1,
-1.363772, -0.9153944, -2.32516, 1, 1, 1, 1, 1,
-1.363233, 0.7101272, -0.2260426, 1, 1, 1, 1, 1,
-1.354617, 2.424978, -0.07351728, 1, 1, 1, 1, 1,
-1.339155, -0.4185815, -3.497192, 1, 1, 1, 1, 1,
-1.333193, -0.7924109, -4.66378, 0, 0, 1, 1, 1,
-1.327342, 0.09788318, -3.17745, 1, 0, 0, 1, 1,
-1.324519, -0.1947272, -1.644087, 1, 0, 0, 1, 1,
-1.320891, 1.32258, 0.3397776, 1, 0, 0, 1, 1,
-1.313398, -0.02111982, -2.337352, 1, 0, 0, 1, 1,
-1.303852, 1.923893, 0.1133967, 1, 0, 0, 1, 1,
-1.303379, 0.6278765, -0.5309009, 0, 0, 0, 1, 1,
-1.291746, -0.8602978, -0.001293719, 0, 0, 0, 1, 1,
-1.281209, -0.8479784, -0.9249607, 0, 0, 0, 1, 1,
-1.281162, -1.913972, -1.862115, 0, 0, 0, 1, 1,
-1.280586, -2.419046, -1.971347, 0, 0, 0, 1, 1,
-1.254469, 0.7770894, 0.06224157, 0, 0, 0, 1, 1,
-1.252838, -0.6323186, -2.399547, 0, 0, 0, 1, 1,
-1.249482, 0.03207359, -0.1383898, 1, 1, 1, 1, 1,
-1.247319, 0.2909301, -1.200206, 1, 1, 1, 1, 1,
-1.241305, 0.9366585, -0.8612639, 1, 1, 1, 1, 1,
-1.228977, -0.5316955, -3.183916, 1, 1, 1, 1, 1,
-1.216073, -0.8421738, -1.531673, 1, 1, 1, 1, 1,
-1.213473, 0.8030367, -1.764975, 1, 1, 1, 1, 1,
-1.21079, 0.369126, -1.393457, 1, 1, 1, 1, 1,
-1.200503, -0.9748798, -3.608132, 1, 1, 1, 1, 1,
-1.18882, -0.6374508, -1.553075, 1, 1, 1, 1, 1,
-1.183434, 0.7705706, -1.060713, 1, 1, 1, 1, 1,
-1.180521, -0.7084458, -1.794215, 1, 1, 1, 1, 1,
-1.17928, 1.121024, 0.6824816, 1, 1, 1, 1, 1,
-1.172828, 0.9337763, -1.115998, 1, 1, 1, 1, 1,
-1.167434, -1.403342, -1.144139, 1, 1, 1, 1, 1,
-1.16318, -0.4353651, -2.492853, 1, 1, 1, 1, 1,
-1.160851, -0.8529552, -1.6597, 0, 0, 1, 1, 1,
-1.153769, 0.4192131, -2.125455, 1, 0, 0, 1, 1,
-1.151901, 1.64747, -0.5920928, 1, 0, 0, 1, 1,
-1.146844, -0.2746665, -0.3584937, 1, 0, 0, 1, 1,
-1.146137, -0.2598227, -1.35041, 1, 0, 0, 1, 1,
-1.144443, 0.9511007, 2.202061, 1, 0, 0, 1, 1,
-1.139151, 0.1986957, -1.921342, 0, 0, 0, 1, 1,
-1.136068, -1.310244, -3.779279, 0, 0, 0, 1, 1,
-1.134714, 0.3481355, -0.2225308, 0, 0, 0, 1, 1,
-1.1317, -2.146832, -2.443515, 0, 0, 0, 1, 1,
-1.123388, -0.9942569, -2.734829, 0, 0, 0, 1, 1,
-1.115939, 2.328174, -0.2403665, 0, 0, 0, 1, 1,
-1.113119, 1.885032, 1.095631, 0, 0, 0, 1, 1,
-1.112503, 0.6195276, -1.883863, 1, 1, 1, 1, 1,
-1.1036, 0.2653837, -1.377821, 1, 1, 1, 1, 1,
-1.100923, -0.3935901, -0.7416702, 1, 1, 1, 1, 1,
-1.099898, 0.383288, -0.1135314, 1, 1, 1, 1, 1,
-1.094744, -1.027385, -1.52843, 1, 1, 1, 1, 1,
-1.089743, -0.4847044, -1.538491, 1, 1, 1, 1, 1,
-1.088723, -0.1262533, -1.637061, 1, 1, 1, 1, 1,
-1.087874, 0.3940147, -1.384095, 1, 1, 1, 1, 1,
-1.076598, 1.431531, -2.279109, 1, 1, 1, 1, 1,
-1.07378, 0.10953, -1.808378, 1, 1, 1, 1, 1,
-1.064763, -0.1782336, -1.34171, 1, 1, 1, 1, 1,
-1.062891, -0.3121172, -0.8946878, 1, 1, 1, 1, 1,
-1.060568, -0.2467048, -1.443721, 1, 1, 1, 1, 1,
-1.058467, 0.1707525, -2.638938, 1, 1, 1, 1, 1,
-1.056806, -0.03356665, -1.484909, 1, 1, 1, 1, 1,
-1.052098, 0.2489494, -0.4721343, 0, 0, 1, 1, 1,
-1.038956, 0.3030238, -1.951501, 1, 0, 0, 1, 1,
-1.038584, -1.037093, -2.398238, 1, 0, 0, 1, 1,
-1.021372, -0.6878519, -1.720797, 1, 0, 0, 1, 1,
-1.02131, 0.7296044, -0.9363191, 1, 0, 0, 1, 1,
-1.021093, -0.9298573, -1.908019, 1, 0, 0, 1, 1,
-1.014077, 0.004587088, -1.965513, 0, 0, 0, 1, 1,
-1.006509, 0.04288334, -1.374857, 0, 0, 0, 1, 1,
-0.9968782, 0.1030508, -0.671739, 0, 0, 0, 1, 1,
-0.9948478, 0.3024783, 0.2844244, 0, 0, 0, 1, 1,
-0.9921659, 0.6046638, -0.6969039, 0, 0, 0, 1, 1,
-0.9881589, -0.378182, -1.107166, 0, 0, 0, 1, 1,
-0.986885, 0.5524715, -0.6423728, 0, 0, 0, 1, 1,
-0.9844977, 0.3651783, -2.52833, 1, 1, 1, 1, 1,
-0.9798231, -1.669678, -1.07228, 1, 1, 1, 1, 1,
-0.9767949, 0.8323367, -0.3073137, 1, 1, 1, 1, 1,
-0.9766577, -2.1043, -2.91821, 1, 1, 1, 1, 1,
-0.9754767, -1.054916, -2.183756, 1, 1, 1, 1, 1,
-0.9746578, 0.3734434, -1.83159, 1, 1, 1, 1, 1,
-0.9722489, 1.61684, -0.9760741, 1, 1, 1, 1, 1,
-0.960699, 0.08138235, -1.372225, 1, 1, 1, 1, 1,
-0.959017, 0.4901479, -2.351992, 1, 1, 1, 1, 1,
-0.9584218, -1.405162, -2.202663, 1, 1, 1, 1, 1,
-0.9578334, 0.8349562, 0.9617813, 1, 1, 1, 1, 1,
-0.9569592, 0.7765127, -1.831349, 1, 1, 1, 1, 1,
-0.9564882, 2.981377, 0.6749397, 1, 1, 1, 1, 1,
-0.9550021, 0.4849385, -2.449522, 1, 1, 1, 1, 1,
-0.9496787, -0.2642473, -0.9794612, 1, 1, 1, 1, 1,
-0.9473621, 1.23248, -1.093627, 0, 0, 1, 1, 1,
-0.9427091, 1.568416, -0.3295283, 1, 0, 0, 1, 1,
-0.9381589, -1.702734, -2.243433, 1, 0, 0, 1, 1,
-0.9372938, 0.7444921, -0.5220618, 1, 0, 0, 1, 1,
-0.9309815, 1.78336, 2.101469, 1, 0, 0, 1, 1,
-0.928071, 0.2595057, 0.2105086, 1, 0, 0, 1, 1,
-0.9200441, -0.7268144, -2.140938, 0, 0, 0, 1, 1,
-0.9147822, 0.4615647, -2.101893, 0, 0, 0, 1, 1,
-0.9129344, -1.009146, 0.1186221, 0, 0, 0, 1, 1,
-0.912915, -0.007480854, -2.001407, 0, 0, 0, 1, 1,
-0.9100675, -0.1416257, -2.116236, 0, 0, 0, 1, 1,
-0.9074729, 1.701763, -1.297533, 0, 0, 0, 1, 1,
-0.9041052, -0.6045734, -2.707187, 0, 0, 0, 1, 1,
-0.9024528, 2.401623, 0.9732257, 1, 1, 1, 1, 1,
-0.9019507, -0.01712903, -0.9485604, 1, 1, 1, 1, 1,
-0.8969399, 0.5220265, 1.327379, 1, 1, 1, 1, 1,
-0.8900527, -1.662896, -1.560887, 1, 1, 1, 1, 1,
-0.8875895, 1.061826, -0.7795353, 1, 1, 1, 1, 1,
-0.8816133, -1.412148, -2.217954, 1, 1, 1, 1, 1,
-0.8787532, -0.4195898, -2.965833, 1, 1, 1, 1, 1,
-0.8680055, -0.4504675, -2.503906, 1, 1, 1, 1, 1,
-0.8672163, -1.529587, -4.616802, 1, 1, 1, 1, 1,
-0.8668964, -1.275285, -3.47282, 1, 1, 1, 1, 1,
-0.8667532, 1.119423, 0.3972609, 1, 1, 1, 1, 1,
-0.8555537, 0.06575111, -1.867902, 1, 1, 1, 1, 1,
-0.8549263, 0.4163025, -1.453352, 1, 1, 1, 1, 1,
-0.8547311, -0.2850041, -1.716851, 1, 1, 1, 1, 1,
-0.8532919, -1.212636, -5.300043, 1, 1, 1, 1, 1,
-0.850866, 1.515043, 0.9156237, 0, 0, 1, 1, 1,
-0.8442643, 0.570315, -0.9332526, 1, 0, 0, 1, 1,
-0.8391719, 0.9625603, -1.543404, 1, 0, 0, 1, 1,
-0.8308258, 0.3347672, -2.574514, 1, 0, 0, 1, 1,
-0.8293455, 0.535857, -0.5369992, 1, 0, 0, 1, 1,
-0.8223911, -0.4512638, -1.740818, 1, 0, 0, 1, 1,
-0.821436, 0.546115, -0.5978878, 0, 0, 0, 1, 1,
-0.8164121, 0.2409846, -0.1895842, 0, 0, 0, 1, 1,
-0.8125445, -0.1062228, -0.9638123, 0, 0, 0, 1, 1,
-0.810658, -1.77229, -3.611937, 0, 0, 0, 1, 1,
-0.8105723, 1.298272, 0.4977531, 0, 0, 0, 1, 1,
-0.8104023, 0.04912814, -0.7056634, 0, 0, 0, 1, 1,
-0.8020775, -0.8657293, -2.100636, 0, 0, 0, 1, 1,
-0.801312, 1.061573, -2.402344, 1, 1, 1, 1, 1,
-0.8007224, 1.19819, -2.606558, 1, 1, 1, 1, 1,
-0.799566, 1.482667, -0.2541806, 1, 1, 1, 1, 1,
-0.7988704, -0.06010152, -1.438636, 1, 1, 1, 1, 1,
-0.795351, -0.6687363, -2.431172, 1, 1, 1, 1, 1,
-0.7877492, -0.6830844, -2.271727, 1, 1, 1, 1, 1,
-0.7854728, -0.9800407, -3.176275, 1, 1, 1, 1, 1,
-0.7836542, 1.504841, 0.0462064, 1, 1, 1, 1, 1,
-0.7712759, -0.06832836, -2.393869, 1, 1, 1, 1, 1,
-0.7697525, 0.2041213, -1.934157, 1, 1, 1, 1, 1,
-0.7674496, 0.9376608, -1.10992, 1, 1, 1, 1, 1,
-0.7666947, -0.6788797, -2.523172, 1, 1, 1, 1, 1,
-0.7629445, -0.2830831, -3.049022, 1, 1, 1, 1, 1,
-0.7597321, 0.7303823, -0.02300248, 1, 1, 1, 1, 1,
-0.7585803, 0.7634364, -0.4241925, 1, 1, 1, 1, 1,
-0.7453319, -0.7367859, -2.443825, 0, 0, 1, 1, 1,
-0.7407513, 0.1749379, -1.618121, 1, 0, 0, 1, 1,
-0.7345975, -0.1150155, 1.098224, 1, 0, 0, 1, 1,
-0.7345555, -1.001707, -1.405581, 1, 0, 0, 1, 1,
-0.7266427, -0.7722647, -2.428074, 1, 0, 0, 1, 1,
-0.7247366, -0.1300175, -1.751211, 1, 0, 0, 1, 1,
-0.7208582, -0.7939529, -2.453764, 0, 0, 0, 1, 1,
-0.7206662, -0.3810026, -3.907581, 0, 0, 0, 1, 1,
-0.7174037, 1.308837, 1.569035, 0, 0, 0, 1, 1,
-0.7092298, 0.3812255, 0.104149, 0, 0, 0, 1, 1,
-0.7063842, 0.903275, 0.3772543, 0, 0, 0, 1, 1,
-0.7046603, 1.783914, -0.7059987, 0, 0, 0, 1, 1,
-0.704085, -1.344268, -3.540626, 0, 0, 0, 1, 1,
-0.7030033, -1.094331, -2.813668, 1, 1, 1, 1, 1,
-0.7025854, -0.3647788, -3.505774, 1, 1, 1, 1, 1,
-0.7015857, -0.4882431, -2.848405, 1, 1, 1, 1, 1,
-0.7011265, -1.060068, -4.602245, 1, 1, 1, 1, 1,
-0.6977705, -0.9736883, -3.947968, 1, 1, 1, 1, 1,
-0.6968405, -0.8938911, -2.738999, 1, 1, 1, 1, 1,
-0.6941721, 0.7475607, 0.6677079, 1, 1, 1, 1, 1,
-0.684019, 0.2821652, 0.4193713, 1, 1, 1, 1, 1,
-0.6832061, -0.009039002, -0.6643866, 1, 1, 1, 1, 1,
-0.6781935, -0.4630491, -2.852368, 1, 1, 1, 1, 1,
-0.6760719, -1.927524, -5.084402, 1, 1, 1, 1, 1,
-0.6670812, -0.6668062, -2.906067, 1, 1, 1, 1, 1,
-0.6667068, 0.917486, 1.056562, 1, 1, 1, 1, 1,
-0.6660252, -0.5541012, -2.063906, 1, 1, 1, 1, 1,
-0.6610611, 0.2565611, -0.2666212, 1, 1, 1, 1, 1,
-0.6605687, 2.284583, 1.186863, 0, 0, 1, 1, 1,
-0.6599252, -0.6989136, -1.624796, 1, 0, 0, 1, 1,
-0.6596543, -1.214658, -3.413213, 1, 0, 0, 1, 1,
-0.6583856, -1.422989, -1.708446, 1, 0, 0, 1, 1,
-0.6459935, -0.6855968, -2.37454, 1, 0, 0, 1, 1,
-0.6455474, -0.6266634, -1.995281, 1, 0, 0, 1, 1,
-0.6369713, 2.144919, 0.318108, 0, 0, 0, 1, 1,
-0.6343953, -0.3367071, -3.246594, 0, 0, 0, 1, 1,
-0.6324429, 1.955178, -0.1741448, 0, 0, 0, 1, 1,
-0.630415, -0.05883968, -1.346264, 0, 0, 0, 1, 1,
-0.6272329, -0.3073709, -1.580408, 0, 0, 0, 1, 1,
-0.6263813, -0.01204952, -2.016002, 0, 0, 0, 1, 1,
-0.6251838, -0.1075103, -1.619338, 0, 0, 0, 1, 1,
-0.6250327, 2.051631, 0.9200262, 1, 1, 1, 1, 1,
-0.6205773, -0.8679252, -1.593932, 1, 1, 1, 1, 1,
-0.6200922, -0.5469333, -1.035256, 1, 1, 1, 1, 1,
-0.619916, 0.5949205, -1.158732, 1, 1, 1, 1, 1,
-0.6121894, -0.3512624, -0.8640661, 1, 1, 1, 1, 1,
-0.6116858, -0.6662153, -1.99636, 1, 1, 1, 1, 1,
-0.608755, -1.093798, -4.130211, 1, 1, 1, 1, 1,
-0.6077449, 0.1087071, -1.757125, 1, 1, 1, 1, 1,
-0.6057655, 0.09013849, -3.535264, 1, 1, 1, 1, 1,
-0.6028826, 1.178753, 0.7991366, 1, 1, 1, 1, 1,
-0.599903, -1.502853, -2.381386, 1, 1, 1, 1, 1,
-0.5998677, -0.3992054, -3.074095, 1, 1, 1, 1, 1,
-0.5991376, -1.527484, -3.547696, 1, 1, 1, 1, 1,
-0.5956792, 1.214352, 0.2496978, 1, 1, 1, 1, 1,
-0.5955595, -0.2126673, -1.020579, 1, 1, 1, 1, 1,
-0.5930244, 0.05453251, -1.799624, 0, 0, 1, 1, 1,
-0.5917553, 0.2140512, -2.37801, 1, 0, 0, 1, 1,
-0.590457, -0.5036449, -2.014772, 1, 0, 0, 1, 1,
-0.5858578, 0.3019805, -0.1771371, 1, 0, 0, 1, 1,
-0.5846514, 0.3915205, -0.1350989, 1, 0, 0, 1, 1,
-0.5807844, 0.006119833, -2.033638, 1, 0, 0, 1, 1,
-0.5798715, 0.5981143, 0.7583393, 0, 0, 0, 1, 1,
-0.5749974, 0.5047623, -0.0342413, 0, 0, 0, 1, 1,
-0.5705317, -0.3309727, -0.5481847, 0, 0, 0, 1, 1,
-0.5700406, -0.2930421, -0.9008341, 0, 0, 0, 1, 1,
-0.5596529, 1.603266, -0.1370107, 0, 0, 0, 1, 1,
-0.5578671, -0.9385093, -2.058881, 0, 0, 0, 1, 1,
-0.5560158, 0.9091859, -1.330561, 0, 0, 0, 1, 1,
-0.5530908, -0.03765523, -4.196657, 1, 1, 1, 1, 1,
-0.5493498, -1.263051, -3.233416, 1, 1, 1, 1, 1,
-0.5463407, -0.1479177, -2.521746, 1, 1, 1, 1, 1,
-0.544053, 1.105891, -0.6705609, 1, 1, 1, 1, 1,
-0.5408558, -1.062134, -2.972977, 1, 1, 1, 1, 1,
-0.5401219, 0.1390708, -0.5023522, 1, 1, 1, 1, 1,
-0.5348982, -0.1941628, -1.282078, 1, 1, 1, 1, 1,
-0.5332, 0.98399, -0.23037, 1, 1, 1, 1, 1,
-0.5327148, 1.300865, 0.1981187, 1, 1, 1, 1, 1,
-0.5292454, -0.5600934, -1.651629, 1, 1, 1, 1, 1,
-0.5292343, 1.357863, -1.001508, 1, 1, 1, 1, 1,
-0.5289871, -0.2314525, -2.700265, 1, 1, 1, 1, 1,
-0.5253326, -1.199587, -2.178128, 1, 1, 1, 1, 1,
-0.5181592, -0.5079718, -2.738278, 1, 1, 1, 1, 1,
-0.5147918, 0.319148, -1.946811, 1, 1, 1, 1, 1,
-0.5104304, 0.7384951, -1.889238, 0, 0, 1, 1, 1,
-0.5098084, -0.5027487, -1.22526, 1, 0, 0, 1, 1,
-0.5089788, -0.9060078, -3.985909, 1, 0, 0, 1, 1,
-0.5035763, -0.3897647, -1.91826, 1, 0, 0, 1, 1,
-0.4999458, 1.459751, 0.08556262, 1, 0, 0, 1, 1,
-0.4979806, -0.8830656, -3.665757, 1, 0, 0, 1, 1,
-0.496969, 0.619176, -1.862111, 0, 0, 0, 1, 1,
-0.4919926, -0.18547, -1.607264, 0, 0, 0, 1, 1,
-0.4886549, -1.030487, -3.804391, 0, 0, 0, 1, 1,
-0.488261, -0.7546663, -1.296665, 0, 0, 0, 1, 1,
-0.4872117, 0.1840191, -0.07560398, 0, 0, 0, 1, 1,
-0.485962, -0.4368356, -3.170055, 0, 0, 0, 1, 1,
-0.4844228, 1.034377, -1.8028, 0, 0, 0, 1, 1,
-0.4778125, 0.7630897, -0.7848924, 1, 1, 1, 1, 1,
-0.4754015, -1.633079, -5.675294, 1, 1, 1, 1, 1,
-0.4708789, -0.4366794, -3.800194, 1, 1, 1, 1, 1,
-0.4645876, 0.8758605, 0.9065145, 1, 1, 1, 1, 1,
-0.4640137, 0.4341029, -0.8518845, 1, 1, 1, 1, 1,
-0.4616354, -1.47576, -1.165159, 1, 1, 1, 1, 1,
-0.4608434, 0.03439208, -0.4195807, 1, 1, 1, 1, 1,
-0.4514137, -0.03778385, -3.05146, 1, 1, 1, 1, 1,
-0.4507309, -0.619791, -1.286499, 1, 1, 1, 1, 1,
-0.448392, -0.6361246, -2.86072, 1, 1, 1, 1, 1,
-0.4412843, 1.333609, -2.038667, 1, 1, 1, 1, 1,
-0.439811, 0.1497748, -1.457849, 1, 1, 1, 1, 1,
-0.4393046, 1.730065, -0.9487107, 1, 1, 1, 1, 1,
-0.4385689, 0.1242921, -0.8328778, 1, 1, 1, 1, 1,
-0.4371747, -1.014096, -4.461218, 1, 1, 1, 1, 1,
-0.4348692, 0.08172374, -0.7292345, 0, 0, 1, 1, 1,
-0.4305703, 0.3627911, -1.680585, 1, 0, 0, 1, 1,
-0.4303258, -0.4666371, -3.550185, 1, 0, 0, 1, 1,
-0.4267771, -0.8673158, -2.604243, 1, 0, 0, 1, 1,
-0.425196, -1.555966, -1.490301, 1, 0, 0, 1, 1,
-0.4238464, -0.3176349, -2.793774, 1, 0, 0, 1, 1,
-0.4214656, 0.6945702, -1.796303, 0, 0, 0, 1, 1,
-0.4173568, 0.6106125, -1.659782, 0, 0, 0, 1, 1,
-0.4173003, -0.3047713, -3.414508, 0, 0, 0, 1, 1,
-0.4125942, 0.3443136, -0.4854135, 0, 0, 0, 1, 1,
-0.4078053, 1.398097, -2.110702, 0, 0, 0, 1, 1,
-0.4069357, 0.5196071, -2.699034, 0, 0, 0, 1, 1,
-0.4042464, -0.7278596, -3.014335, 0, 0, 0, 1, 1,
-0.4017757, -0.3887608, -2.024879, 1, 1, 1, 1, 1,
-0.3982865, 0.7949551, -0.5624398, 1, 1, 1, 1, 1,
-0.3980598, 1.172958, -1.297042, 1, 1, 1, 1, 1,
-0.3977824, 1.670673, 0.6625426, 1, 1, 1, 1, 1,
-0.3962508, -0.5861275, -2.70844, 1, 1, 1, 1, 1,
-0.3961795, -1.165125, -1.424827, 1, 1, 1, 1, 1,
-0.3956547, -2.674451, -3.225503, 1, 1, 1, 1, 1,
-0.3927389, 0.1640321, -0.8467057, 1, 1, 1, 1, 1,
-0.3919989, -0.5444465, -2.330066, 1, 1, 1, 1, 1,
-0.3890798, 0.4640343, 0.01379042, 1, 1, 1, 1, 1,
-0.3865676, 0.7914485, -1.120757, 1, 1, 1, 1, 1,
-0.3851034, -0.1671347, -0.4404205, 1, 1, 1, 1, 1,
-0.3834181, -1.32007, -3.143602, 1, 1, 1, 1, 1,
-0.3831927, 0.7637038, -0.3276747, 1, 1, 1, 1, 1,
-0.3831852, -0.2862148, -2.797272, 1, 1, 1, 1, 1,
-0.3808376, 1.52162, 0.5783229, 0, 0, 1, 1, 1,
-0.3775728, 0.2525106, -2.173203, 1, 0, 0, 1, 1,
-0.3739823, -0.3569147, -3.435847, 1, 0, 0, 1, 1,
-0.3719791, 0.6310375, -0.9119205, 1, 0, 0, 1, 1,
-0.3719127, 0.2860368, -1.44924, 1, 0, 0, 1, 1,
-0.3701005, -1.243632, -0.3334053, 1, 0, 0, 1, 1,
-0.3686152, -0.1468299, -2.538471, 0, 0, 0, 1, 1,
-0.3663159, 1.501733, -0.7578481, 0, 0, 0, 1, 1,
-0.3662114, -0.00545744, -1.471182, 0, 0, 0, 1, 1,
-0.3631012, -0.3351727, -3.992316, 0, 0, 0, 1, 1,
-0.355762, -0.4181959, -2.537425, 0, 0, 0, 1, 1,
-0.3556598, 0.9605505, 1.344299, 0, 0, 0, 1, 1,
-0.3535881, 0.9354672, 0.5124025, 0, 0, 0, 1, 1,
-0.3522667, -1.882756, -4.075433, 1, 1, 1, 1, 1,
-0.3510937, 0.9556994, 0.9387298, 1, 1, 1, 1, 1,
-0.3475146, 0.1714752, -0.874716, 1, 1, 1, 1, 1,
-0.3436609, -0.3865852, -1.226059, 1, 1, 1, 1, 1,
-0.3432443, 1.1718, -0.680897, 1, 1, 1, 1, 1,
-0.3384004, -0.7037137, -1.889708, 1, 1, 1, 1, 1,
-0.3323973, 0.401994, 1.262419, 1, 1, 1, 1, 1,
-0.3289911, -1.272337, -1.969563, 1, 1, 1, 1, 1,
-0.3288225, 0.5185462, 0.8365248, 1, 1, 1, 1, 1,
-0.3279947, -1.036414, -2.592136, 1, 1, 1, 1, 1,
-0.3259982, -0.5856252, -2.897818, 1, 1, 1, 1, 1,
-0.3247705, -1.443579, -2.615658, 1, 1, 1, 1, 1,
-0.3230306, 0.5194592, -1.020489, 1, 1, 1, 1, 1,
-0.3221728, -0.1200365, -2.355714, 1, 1, 1, 1, 1,
-0.3187684, 0.4137501, 1.107904, 1, 1, 1, 1, 1,
-0.3128714, 1.886191, -1.394593, 0, 0, 1, 1, 1,
-0.3119881, -0.4368238, -0.9661852, 1, 0, 0, 1, 1,
-0.3076186, 0.513476, -0.9004784, 1, 0, 0, 1, 1,
-0.3039234, 0.1907408, -1.867422, 1, 0, 0, 1, 1,
-0.3029147, 0.3309205, -1.304771, 1, 0, 0, 1, 1,
-0.3016242, -1.228932, -4.008232, 1, 0, 0, 1, 1,
-0.2998179, 1.612094, -0.2274063, 0, 0, 0, 1, 1,
-0.2951351, -0.848001, -3.722812, 0, 0, 0, 1, 1,
-0.293957, 1.237357, -0.3332742, 0, 0, 0, 1, 1,
-0.2921368, 1.120833, 1.709501, 0, 0, 0, 1, 1,
-0.2897471, -0.9069508, -4.54231, 0, 0, 0, 1, 1,
-0.2861237, 1.038972, 0.08401338, 0, 0, 0, 1, 1,
-0.2844245, 0.3866466, -1.785522, 0, 0, 0, 1, 1,
-0.283833, 1.095074, -0.1732169, 1, 1, 1, 1, 1,
-0.2833785, -0.3964461, -2.81427, 1, 1, 1, 1, 1,
-0.2821155, 1.151441, -0.02614834, 1, 1, 1, 1, 1,
-0.2793714, 0.4976463, -0.3180678, 1, 1, 1, 1, 1,
-0.2738911, 0.02983992, -1.952326, 1, 1, 1, 1, 1,
-0.2733012, 0.2825871, -0.3206182, 1, 1, 1, 1, 1,
-0.2731528, 0.2699112, 0.1901413, 1, 1, 1, 1, 1,
-0.2715467, 0.5042518, 0.196423, 1, 1, 1, 1, 1,
-0.2708969, 1.153648, -0.4587561, 1, 1, 1, 1, 1,
-0.2670175, 0.5133414, -2.541668, 1, 1, 1, 1, 1,
-0.2670131, -0.4778778, -5.466582, 1, 1, 1, 1, 1,
-0.2618452, -0.6463312, -2.563864, 1, 1, 1, 1, 1,
-0.2610928, -0.1432927, -1.04982, 1, 1, 1, 1, 1,
-0.2587809, -0.6517031, -0.2611056, 1, 1, 1, 1, 1,
-0.2566466, -0.001670854, -3.177398, 1, 1, 1, 1, 1,
-0.2538521, -0.6965027, -1.297775, 0, 0, 1, 1, 1,
-0.2522828, -0.8193838, -2.59504, 1, 0, 0, 1, 1,
-0.2520894, 0.38282, -0.6552575, 1, 0, 0, 1, 1,
-0.2509398, 0.8773962, -0.1066391, 1, 0, 0, 1, 1,
-0.2477311, -1.185756, -1.332757, 1, 0, 0, 1, 1,
-0.2476511, 0.5201141, 1.172065, 1, 0, 0, 1, 1,
-0.2472697, 1.16492, 0.8007909, 0, 0, 0, 1, 1,
-0.2459517, 1.549348, -0.1952159, 0, 0, 0, 1, 1,
-0.245913, 0.6256703, -0.5084389, 0, 0, 0, 1, 1,
-0.2448369, 0.2119335, -0.1212243, 0, 0, 0, 1, 1,
-0.2430106, -0.7352088, -1.546401, 0, 0, 0, 1, 1,
-0.2428242, -0.3675421, -1.939593, 0, 0, 0, 1, 1,
-0.2419813, 0.5926014, -0.6159142, 0, 0, 0, 1, 1,
-0.2282048, 0.4929388, -1.001543, 1, 1, 1, 1, 1,
-0.2265348, 0.6796257, -0.5445415, 1, 1, 1, 1, 1,
-0.2255414, -1.039333, -3.508352, 1, 1, 1, 1, 1,
-0.2174662, 0.007455006, -2.294686, 1, 1, 1, 1, 1,
-0.2172058, 1.109188, 0.1129345, 1, 1, 1, 1, 1,
-0.2153934, 0.3452031, -1.220493, 1, 1, 1, 1, 1,
-0.2120116, -0.6248435, -2.426358, 1, 1, 1, 1, 1,
-0.2095266, -1.04173, -2.285805, 1, 1, 1, 1, 1,
-0.2084543, -0.5623805, 0.4818359, 1, 1, 1, 1, 1,
-0.2026353, -0.04548443, -3.28012, 1, 1, 1, 1, 1,
-0.2005338, -0.4935274, -2.74627, 1, 1, 1, 1, 1,
-0.1956675, -0.5848731, -1.69075, 1, 1, 1, 1, 1,
-0.1933043, 0.9953672, 0.5331191, 1, 1, 1, 1, 1,
-0.1847381, 0.8553495, 0.7152877, 1, 1, 1, 1, 1,
-0.1829497, -0.5078219, -2.927282, 1, 1, 1, 1, 1,
-0.1708765, -0.1029876, -1.761124, 0, 0, 1, 1, 1,
-0.1689114, -0.2442955, -1.26514, 1, 0, 0, 1, 1,
-0.1616559, 0.8180829, 0.1220116, 1, 0, 0, 1, 1,
-0.1615005, -0.8051736, -5.832343, 1, 0, 0, 1, 1,
-0.1534184, 0.2136438, -1.11208, 1, 0, 0, 1, 1,
-0.1510387, -0.2559957, -2.642418, 1, 0, 0, 1, 1,
-0.1484081, 0.26137, -1.867915, 0, 0, 0, 1, 1,
-0.1478923, 0.1147994, 2.14993, 0, 0, 0, 1, 1,
-0.1443421, -1.593814, -4.242914, 0, 0, 0, 1, 1,
-0.1415365, 3.87351, 1.055004, 0, 0, 0, 1, 1,
-0.1401587, 0.7686496, 0.1360258, 0, 0, 0, 1, 1,
-0.1397721, 1.074005, -0.4204826, 0, 0, 0, 1, 1,
-0.1389969, -0.6222295, -2.680458, 0, 0, 0, 1, 1,
-0.1347121, -0.1284094, -2.453552, 1, 1, 1, 1, 1,
-0.1317689, 1.305267, -0.8968104, 1, 1, 1, 1, 1,
-0.1308884, -0.3969035, -3.256223, 1, 1, 1, 1, 1,
-0.1298808, 1.722774, -0.4420559, 1, 1, 1, 1, 1,
-0.1285821, -0.02919831, -1.240874, 1, 1, 1, 1, 1,
-0.1281568, 0.6052237, 0.04159905, 1, 1, 1, 1, 1,
-0.1248148, -0.3721262, -3.427216, 1, 1, 1, 1, 1,
-0.1181407, -0.5678587, -2.346853, 1, 1, 1, 1, 1,
-0.1122576, 0.03234925, -1.076585, 1, 1, 1, 1, 1,
-0.1117643, -0.2313268, -4.713679, 1, 1, 1, 1, 1,
-0.1110581, -0.8637073, -3.725871, 1, 1, 1, 1, 1,
-0.1061182, -1.359292, -3.888809, 1, 1, 1, 1, 1,
-0.1057818, 1.235481, -1.447603, 1, 1, 1, 1, 1,
-0.105308, 0.9563342, -0.6239003, 1, 1, 1, 1, 1,
-0.1021154, 0.5680373, -0.03789748, 1, 1, 1, 1, 1,
-0.1012921, -0.08896056, -3.211404, 0, 0, 1, 1, 1,
-0.09926, 1.039578, 0.6089681, 1, 0, 0, 1, 1,
-0.09895999, 0.5138491, 0.749326, 1, 0, 0, 1, 1,
-0.09390812, 0.3839845, -0.9835466, 1, 0, 0, 1, 1,
-0.0913702, 0.8700848, -0.9762048, 1, 0, 0, 1, 1,
-0.08723747, -0.1519891, -2.470543, 1, 0, 0, 1, 1,
-0.08345264, -1.885301, -2.990855, 0, 0, 0, 1, 1,
-0.07841255, 0.1176714, -1.373353, 0, 0, 0, 1, 1,
-0.07840039, 1.128398, 1.383835, 0, 0, 0, 1, 1,
-0.07728402, -0.540467, -3.305277, 0, 0, 0, 1, 1,
-0.07341119, 1.041309, 1.418007, 0, 0, 0, 1, 1,
-0.07337178, 0.3261485, -1.916895, 0, 0, 0, 1, 1,
-0.07105073, 1.133356, -1.659864, 0, 0, 0, 1, 1,
-0.07024899, -0.5951573, -2.311866, 1, 1, 1, 1, 1,
-0.06975156, 0.1433539, -1.175845, 1, 1, 1, 1, 1,
-0.06375626, -0.5245736, -1.697182, 1, 1, 1, 1, 1,
-0.06204985, -1.056439, -3.28111, 1, 1, 1, 1, 1,
-0.06149469, -0.2771925, -1.139601, 1, 1, 1, 1, 1,
-0.05793989, -1.775985, -4.681081, 1, 1, 1, 1, 1,
-0.05394665, -0.1829121, -2.72885, 1, 1, 1, 1, 1,
-0.04976565, 0.514584, -1.044824, 1, 1, 1, 1, 1,
-0.04666486, -1.428353, -1.814239, 1, 1, 1, 1, 1,
-0.04641921, -2.039709, -3.611582, 1, 1, 1, 1, 1,
-0.0442415, 2.040356, 1.678978, 1, 1, 1, 1, 1,
-0.04405641, 2.929822, 0.9627392, 1, 1, 1, 1, 1,
-0.04236156, -1.158131, -2.905875, 1, 1, 1, 1, 1,
-0.03924932, 0.112121, -0.5448932, 1, 1, 1, 1, 1,
-0.03830302, 1.515192, -1.358033, 1, 1, 1, 1, 1,
-0.03179901, -0.3874771, -3.458246, 0, 0, 1, 1, 1,
-0.03031895, -0.0159665, -1.643852, 1, 0, 0, 1, 1,
-0.02930034, -0.1417745, -1.930398, 1, 0, 0, 1, 1,
-0.02849366, -0.622938, -3.551081, 1, 0, 0, 1, 1,
-0.02842444, 0.09735079, -1.618501, 1, 0, 0, 1, 1,
-0.02825178, -0.07415488, -4.531238, 1, 0, 0, 1, 1,
-0.02402313, 1.839267, -1.088008, 0, 0, 0, 1, 1,
-0.02268057, -0.8594486, -2.305253, 0, 0, 0, 1, 1,
-0.02141608, 0.8843033, 0.08753107, 0, 0, 0, 1, 1,
-0.01945971, -0.4976284, -2.502413, 0, 0, 0, 1, 1,
-0.01930983, 0.0126371, -1.040083, 0, 0, 0, 1, 1,
-0.01730737, 0.2059757, 1.093025, 0, 0, 0, 1, 1,
-0.01643706, 0.1158732, 0.4810609, 0, 0, 0, 1, 1,
-0.01619004, 0.7381212, -0.2105091, 1, 1, 1, 1, 1,
-0.01500652, -2.242908, -3.413038, 1, 1, 1, 1, 1,
-0.01125006, -1.183867, -3.372505, 1, 1, 1, 1, 1,
-0.01006683, -1.376884, -3.370835, 1, 1, 1, 1, 1,
-0.009721503, 0.5788137, -0.9958527, 1, 1, 1, 1, 1,
-0.006457771, 1.707083, -0.1400689, 1, 1, 1, 1, 1,
-0.003525079, -1.024359, -2.440688, 1, 1, 1, 1, 1,
0.005353273, 1.548193, 0.1232548, 1, 1, 1, 1, 1,
0.00714389, 0.9379025, -0.9858786, 1, 1, 1, 1, 1,
0.01437018, 0.4017547, -0.2932385, 1, 1, 1, 1, 1,
0.01703211, 0.6679206, 1.65458, 1, 1, 1, 1, 1,
0.02027799, -1.436209, 2.470196, 1, 1, 1, 1, 1,
0.02204834, 1.012448, -0.5701777, 1, 1, 1, 1, 1,
0.02612139, -0.4098582, 4.069633, 1, 1, 1, 1, 1,
0.02638716, -0.5892599, 3.563896, 1, 1, 1, 1, 1,
0.02718718, 0.317973, -0.6028062, 0, 0, 1, 1, 1,
0.03110417, -1.823101, 2.981241, 1, 0, 0, 1, 1,
0.03415746, -1.040046, 3.507329, 1, 0, 0, 1, 1,
0.03785289, 1.028043, -0.9072219, 1, 0, 0, 1, 1,
0.03824185, 0.1456203, 2.915091, 1, 0, 0, 1, 1,
0.04535525, -0.02028666, 1.065231, 1, 0, 0, 1, 1,
0.04612159, -1.147369, 4.446695, 0, 0, 0, 1, 1,
0.04618753, -0.6199288, 2.712969, 0, 0, 0, 1, 1,
0.04899176, -0.6511098, 2.896344, 0, 0, 0, 1, 1,
0.04938365, -0.03153989, 3.187738, 0, 0, 0, 1, 1,
0.05024718, -0.2480868, 4.313757, 0, 0, 0, 1, 1,
0.05387067, -1.227206, 2.143176, 0, 0, 0, 1, 1,
0.0572668, 0.00349849, 0.7965416, 0, 0, 0, 1, 1,
0.05800046, 0.3049694, 1.201996, 1, 1, 1, 1, 1,
0.05975769, -1.467993, 2.35707, 1, 1, 1, 1, 1,
0.06180345, 0.6391872, 0.448029, 1, 1, 1, 1, 1,
0.06745222, -1.284503, 2.703459, 1, 1, 1, 1, 1,
0.06790271, 0.3870262, 1.257667, 1, 1, 1, 1, 1,
0.07457126, -0.630094, 2.496492, 1, 1, 1, 1, 1,
0.07526511, 0.4044961, -0.9279139, 1, 1, 1, 1, 1,
0.07570171, -0.2468513, 1.679692, 1, 1, 1, 1, 1,
0.08125445, 0.2014111, 0.8191909, 1, 1, 1, 1, 1,
0.08245096, -0.3924242, 2.118731, 1, 1, 1, 1, 1,
0.08501887, 0.2694567, 1.635969, 1, 1, 1, 1, 1,
0.09110992, -2.007637, 0.170813, 1, 1, 1, 1, 1,
0.09325617, -0.4075599, 3.040141, 1, 1, 1, 1, 1,
0.09712537, 0.291283, 0.3003907, 1, 1, 1, 1, 1,
0.1023429, -0.06039374, 2.647448, 1, 1, 1, 1, 1,
0.104297, 0.09155972, 0.6118953, 0, 0, 1, 1, 1,
0.1065423, 1.371049, 0.5216317, 1, 0, 0, 1, 1,
0.1075277, -0.5349737, 3.183143, 1, 0, 0, 1, 1,
0.1094098, -1.899448, 5.03543, 1, 0, 0, 1, 1,
0.1096906, 1.107191, 1.018309, 1, 0, 0, 1, 1,
0.1118251, -0.608518, 3.256338, 1, 0, 0, 1, 1,
0.1126659, -1.308727, 4.197968, 0, 0, 0, 1, 1,
0.1183493, -1.169252, 4.215007, 0, 0, 0, 1, 1,
0.1214997, 0.7187114, -0.6607374, 0, 0, 0, 1, 1,
0.1242183, 0.5746131, 0.595746, 0, 0, 0, 1, 1,
0.1245354, -1.068758, 2.652988, 0, 0, 0, 1, 1,
0.1298594, 0.1759819, -0.3283576, 0, 0, 0, 1, 1,
0.133465, -1.415731, 2.838807, 0, 0, 0, 1, 1,
0.1357735, -1.146266, 2.437174, 1, 1, 1, 1, 1,
0.1361107, 0.6610173, 0.7504482, 1, 1, 1, 1, 1,
0.1391919, 0.01569813, 1.592166, 1, 1, 1, 1, 1,
0.1512482, 1.085904, 0.7545509, 1, 1, 1, 1, 1,
0.1581363, 0.3648582, -0.6397198, 1, 1, 1, 1, 1,
0.160077, -0.9598069, 2.911747, 1, 1, 1, 1, 1,
0.1664679, -0.4936377, 2.177767, 1, 1, 1, 1, 1,
0.1674794, 1.130608, 1.523704, 1, 1, 1, 1, 1,
0.1678482, 0.3493415, 0.1775568, 1, 1, 1, 1, 1,
0.1680342, -0.9336838, 2.241027, 1, 1, 1, 1, 1,
0.1705908, 0.5674242, 0.4403583, 1, 1, 1, 1, 1,
0.1713514, 0.4969932, 0.2846293, 1, 1, 1, 1, 1,
0.1720016, 1.092916, -0.5560457, 1, 1, 1, 1, 1,
0.1747516, 1.516417, 1.693551, 1, 1, 1, 1, 1,
0.1748393, -1.177512, 4.08976, 1, 1, 1, 1, 1,
0.1797821, -0.323873, 4.040251, 0, 0, 1, 1, 1,
0.1803159, 1.239894, 1.386262, 1, 0, 0, 1, 1,
0.1804879, 0.4691057, -0.2686181, 1, 0, 0, 1, 1,
0.1883534, -0.9095524, 2.424123, 1, 0, 0, 1, 1,
0.1894553, -1.413898, 3.87816, 1, 0, 0, 1, 1,
0.1896631, 0.06064659, 3.323031, 1, 0, 0, 1, 1,
0.1900867, 1.33748, -0.02932463, 0, 0, 0, 1, 1,
0.1904384, 2.173852, 0.09517848, 0, 0, 0, 1, 1,
0.1909894, 0.01483174, -0.03898579, 0, 0, 0, 1, 1,
0.1950484, -0.3303133, 2.051471, 0, 0, 0, 1, 1,
0.201247, 1.015636, -0.471237, 0, 0, 0, 1, 1,
0.2027383, -0.5743608, 1.657416, 0, 0, 0, 1, 1,
0.2039125, 0.8307934, 0.6674103, 0, 0, 0, 1, 1,
0.2079696, 1.085954, 0.2312483, 1, 1, 1, 1, 1,
0.2097697, -2.291907, 3.218831, 1, 1, 1, 1, 1,
0.2098564, -1.211608, 2.075593, 1, 1, 1, 1, 1,
0.21094, 0.2220278, 1.158763, 1, 1, 1, 1, 1,
0.2133965, 0.4306662, -1.241374, 1, 1, 1, 1, 1,
0.2142061, 0.3635541, -0.1885754, 1, 1, 1, 1, 1,
0.2195373, 1.607432, -0.2202833, 1, 1, 1, 1, 1,
0.2195675, -0.8123801, 2.016035, 1, 1, 1, 1, 1,
0.2250884, 1.507281, -0.3860244, 1, 1, 1, 1, 1,
0.2261048, -0.5242465, 3.49578, 1, 1, 1, 1, 1,
0.2270498, 0.5737083, -0.3502715, 1, 1, 1, 1, 1,
0.2289051, -1.648078, 4.032607, 1, 1, 1, 1, 1,
0.2298622, 0.2327106, 0.4934743, 1, 1, 1, 1, 1,
0.232404, 0.4898887, 1.490151, 1, 1, 1, 1, 1,
0.2409646, -1.485625, 4.104094, 1, 1, 1, 1, 1,
0.244043, 1.200485, 1.301566, 0, 0, 1, 1, 1,
0.2500212, -0.4638251, 2.637441, 1, 0, 0, 1, 1,
0.2526833, 0.7106411, 0.7819548, 1, 0, 0, 1, 1,
0.2567776, -0.5749714, 3.124116, 1, 0, 0, 1, 1,
0.2569562, -0.4951821, 3.205742, 1, 0, 0, 1, 1,
0.2669389, -0.3696162, 2.659836, 1, 0, 0, 1, 1,
0.2683745, -0.8777543, 1.833727, 0, 0, 0, 1, 1,
0.2684818, -1.145461, 2.626079, 0, 0, 0, 1, 1,
0.2744215, 2.644841, -0.1623819, 0, 0, 0, 1, 1,
0.2777747, -0.831648, 2.732278, 0, 0, 0, 1, 1,
0.2781695, -0.7404104, 5.300068, 0, 0, 0, 1, 1,
0.279086, -0.9501098, 2.996444, 0, 0, 0, 1, 1,
0.2791464, 1.26036, 0.4068535, 0, 0, 0, 1, 1,
0.2854694, 0.2529819, 0.9247149, 1, 1, 1, 1, 1,
0.2863742, -0.5111366, 1.449822, 1, 1, 1, 1, 1,
0.2875364, -1.300312, 1.777262, 1, 1, 1, 1, 1,
0.300907, -0.214845, 3.357982, 1, 1, 1, 1, 1,
0.3009818, 1.01979, -1.229417, 1, 1, 1, 1, 1,
0.3014443, -0.2525671, 1.953579, 1, 1, 1, 1, 1,
0.3036688, -0.1855654, 1.65304, 1, 1, 1, 1, 1,
0.3041089, -0.5096597, 2.294419, 1, 1, 1, 1, 1,
0.3044651, -0.6463464, 1.334919, 1, 1, 1, 1, 1,
0.3088984, 0.6246265, 1.327754, 1, 1, 1, 1, 1,
0.309255, 0.8094992, 2.935719, 1, 1, 1, 1, 1,
0.3112375, 0.584479, -0.02752332, 1, 1, 1, 1, 1,
0.3123349, 0.5575678, 0.1362351, 1, 1, 1, 1, 1,
0.3141942, 0.7520111, -0.3642909, 1, 1, 1, 1, 1,
0.3151295, -0.7199088, 2.938584, 1, 1, 1, 1, 1,
0.3151365, 0.590515, -0.1151489, 0, 0, 1, 1, 1,
0.3218809, -0.5491223, 1.278668, 1, 0, 0, 1, 1,
0.3229107, 0.4365445, 2.988596, 1, 0, 0, 1, 1,
0.3248914, 0.0594998, 1.39034, 1, 0, 0, 1, 1,
0.32755, 0.6193867, 0.276338, 1, 0, 0, 1, 1,
0.3291631, -0.7130539, 3.66642, 1, 0, 0, 1, 1,
0.3296113, -0.6665366, 3.524997, 0, 0, 0, 1, 1,
0.3325798, 1.843227, 0.4079496, 0, 0, 0, 1, 1,
0.3358008, 1.309989, 1.172613, 0, 0, 0, 1, 1,
0.3363455, 1.585557, -0.5343328, 0, 0, 0, 1, 1,
0.337813, 1.310461, -0.4985551, 0, 0, 0, 1, 1,
0.3387341, 0.6330504, -0.1577489, 0, 0, 0, 1, 1,
0.3392226, -0.2735394, 2.386598, 0, 0, 0, 1, 1,
0.3396474, 0.6790246, 0.4555247, 1, 1, 1, 1, 1,
0.3408059, -0.8121113, 1.90961, 1, 1, 1, 1, 1,
0.3408313, 0.5002138, 0.09292646, 1, 1, 1, 1, 1,
0.348979, -0.7569965, 3.534549, 1, 1, 1, 1, 1,
0.3492444, -0.677912, 3.936896, 1, 1, 1, 1, 1,
0.3583538, -1.008811, 1.503484, 1, 1, 1, 1, 1,
0.3585439, 0.589268, 0.2782654, 1, 1, 1, 1, 1,
0.3604636, -1.294386, 4.331748, 1, 1, 1, 1, 1,
0.3675012, 0.5368018, 1.837147, 1, 1, 1, 1, 1,
0.3679586, -0.4957669, 1.63767, 1, 1, 1, 1, 1,
0.3697622, 0.8387166, -0.1572522, 1, 1, 1, 1, 1,
0.3705516, 1.609554, -0.5694264, 1, 1, 1, 1, 1,
0.3756669, 1.505238, 2.066687, 1, 1, 1, 1, 1,
0.3762464, 1.066999, 0.02908519, 1, 1, 1, 1, 1,
0.3789992, -1.437291, 3.170528, 1, 1, 1, 1, 1,
0.386756, -0.5640353, 2.586714, 0, 0, 1, 1, 1,
0.3924187, -0.1798337, 2.063522, 1, 0, 0, 1, 1,
0.3952103, 1.296379, -1.096667, 1, 0, 0, 1, 1,
0.3993911, 0.1002761, 0.9520673, 1, 0, 0, 1, 1,
0.4011927, -0.3520655, 5.471713, 1, 0, 0, 1, 1,
0.4046538, -0.3987842, 3.454531, 1, 0, 0, 1, 1,
0.4061243, -0.4526863, 2.481817, 0, 0, 0, 1, 1,
0.4069253, -1.640005, 3.172896, 0, 0, 0, 1, 1,
0.4086706, -0.4616494, 2.010794, 0, 0, 0, 1, 1,
0.4112438, -0.8078393, 2.481352, 0, 0, 0, 1, 1,
0.4159028, -0.6856971, 3.292184, 0, 0, 0, 1, 1,
0.4212365, 1.278444, 1.039226, 0, 0, 0, 1, 1,
0.4221832, -1.746484, 3.313263, 0, 0, 0, 1, 1,
0.423713, -1.07981, 1.758414, 1, 1, 1, 1, 1,
0.4307937, 1.649047, -1.816747, 1, 1, 1, 1, 1,
0.4313194, -0.1333477, 0.03953679, 1, 1, 1, 1, 1,
0.4339682, 0.2070297, 2.464189, 1, 1, 1, 1, 1,
0.4386306, -0.7469994, 2.066813, 1, 1, 1, 1, 1,
0.4400285, -0.3029965, 0.3933314, 1, 1, 1, 1, 1,
0.4517613, 1.495319, 0.02849035, 1, 1, 1, 1, 1,
0.4557112, -0.4460912, 3.322485, 1, 1, 1, 1, 1,
0.4557761, -0.6683138, 2.456859, 1, 1, 1, 1, 1,
0.4571015, 0.5180241, 0.2175615, 1, 1, 1, 1, 1,
0.4578412, 0.3183874, 0.6111004, 1, 1, 1, 1, 1,
0.4578946, 0.07970041, 0.646148, 1, 1, 1, 1, 1,
0.4610317, 0.4011306, 2.39096, 1, 1, 1, 1, 1,
0.4668673, 0.7685022, -0.02418087, 1, 1, 1, 1, 1,
0.478074, 0.2002205, 2.154924, 1, 1, 1, 1, 1,
0.4790403, -0.5443112, 1.577121, 0, 0, 1, 1, 1,
0.4907911, 0.2530352, 0.6619503, 1, 0, 0, 1, 1,
0.4933376, 0.5994347, -0.3008198, 1, 0, 0, 1, 1,
0.5006723, -0.8119915, 1.664917, 1, 0, 0, 1, 1,
0.5121131, 0.2156306, 1.939126, 1, 0, 0, 1, 1,
0.5184235, -0.5542883, 3.118865, 1, 0, 0, 1, 1,
0.5235853, -0.6556681, 1.179149, 0, 0, 0, 1, 1,
0.5315536, -1.157474, 2.879169, 0, 0, 0, 1, 1,
0.5335137, -0.7028092, 3.067952, 0, 0, 0, 1, 1,
0.5337279, -0.03567748, 2.380445, 0, 0, 0, 1, 1,
0.5404894, -0.2157409, 2.129279, 0, 0, 0, 1, 1,
0.5420613, -0.1796163, 2.406549, 0, 0, 0, 1, 1,
0.5469444, 0.9546657, 1.350683, 0, 0, 0, 1, 1,
0.5475134, -1.19754, 2.107566, 1, 1, 1, 1, 1,
0.5478678, -0.05158707, 1.711788, 1, 1, 1, 1, 1,
0.5519372, -1.186148, 2.633058, 1, 1, 1, 1, 1,
0.5542918, -0.8691657, 3.960637, 1, 1, 1, 1, 1,
0.554472, -0.868355, 2.112297, 1, 1, 1, 1, 1,
0.5583966, -0.6088144, 4.075616, 1, 1, 1, 1, 1,
0.5591683, -0.7484738, 3.023374, 1, 1, 1, 1, 1,
0.5661983, -1.057275, 3.081292, 1, 1, 1, 1, 1,
0.5683479, -0.4232752, 1.822845, 1, 1, 1, 1, 1,
0.5708645, -1.540782, 2.166767, 1, 1, 1, 1, 1,
0.5735755, -1.164141, 0.9783579, 1, 1, 1, 1, 1,
0.5758107, -0.09683724, 2.385315, 1, 1, 1, 1, 1,
0.5807519, 0.7136714, -0.4071346, 1, 1, 1, 1, 1,
0.5901338, -0.1330715, -0.3126525, 1, 1, 1, 1, 1,
0.5919041, -0.1032692, 2.108541, 1, 1, 1, 1, 1,
0.5961187, 0.6195258, 1.568832, 0, 0, 1, 1, 1,
0.5965297, -1.389748, 3.920834, 1, 0, 0, 1, 1,
0.6007249, 0.2405846, 1.455143, 1, 0, 0, 1, 1,
0.6024292, -0.8090911, 1.034326, 1, 0, 0, 1, 1,
0.604398, -0.04331972, 4.342126, 1, 0, 0, 1, 1,
0.6080686, 1.504813, 0.7810159, 1, 0, 0, 1, 1,
0.6114318, 1.427063, -1.285243, 0, 0, 0, 1, 1,
0.6126364, 2.248226, 0.1625328, 0, 0, 0, 1, 1,
0.6136012, 0.6601039, -0.2338186, 0, 0, 0, 1, 1,
0.6138797, -1.227789, 4.514291, 0, 0, 0, 1, 1,
0.6151816, -1.418706, 3.039286, 0, 0, 0, 1, 1,
0.6171941, -1.63867, 3.117247, 0, 0, 0, 1, 1,
0.6180227, -0.4888207, 2.644463, 0, 0, 0, 1, 1,
0.630396, 0.5377039, 1.788216, 1, 1, 1, 1, 1,
0.6328158, -1.58793, 3.440461, 1, 1, 1, 1, 1,
0.6332755, 0.5624276, 0.07213853, 1, 1, 1, 1, 1,
0.6367335, -0.470967, 1.939281, 1, 1, 1, 1, 1,
0.6385953, 1.624314, 1.719561, 1, 1, 1, 1, 1,
0.6414464, -0.8983172, 2.519819, 1, 1, 1, 1, 1,
0.6424316, -0.04900169, 1.581342, 1, 1, 1, 1, 1,
0.6425586, 0.4554117, 0.2733229, 1, 1, 1, 1, 1,
0.6441095, -0.06506321, 1.447627, 1, 1, 1, 1, 1,
0.6445233, -0.2432818, 2.70662, 1, 1, 1, 1, 1,
0.6452422, -0.2000691, 2.019608, 1, 1, 1, 1, 1,
0.6478607, 2.441033, 1.520387, 1, 1, 1, 1, 1,
0.65075, -0.453558, 0.8768201, 1, 1, 1, 1, 1,
0.6514008, 0.5726889, 0.5480935, 1, 1, 1, 1, 1,
0.651561, -0.6299268, 3.110263, 1, 1, 1, 1, 1,
0.6559669, -0.9630627, 3.443965, 0, 0, 1, 1, 1,
0.6565921, 1.628404, 1.280726, 1, 0, 0, 1, 1,
0.6717564, 0.176818, -0.4720733, 1, 0, 0, 1, 1,
0.67542, 2.407524, -2.101752, 1, 0, 0, 1, 1,
0.677904, 1.168531, 0.5376511, 1, 0, 0, 1, 1,
0.6780812, 0.4458066, -0.3663242, 1, 0, 0, 1, 1,
0.6794567, -1.659306, 2.495325, 0, 0, 0, 1, 1,
0.6795981, -0.0224182, 1.925056, 0, 0, 0, 1, 1,
0.683946, 1.503181, 0.6914144, 0, 0, 0, 1, 1,
0.6873249, -0.7631583, 2.188536, 0, 0, 0, 1, 1,
0.6878988, -1.832916, 2.735184, 0, 0, 0, 1, 1,
0.6900971, 1.079637, 1.796185, 0, 0, 0, 1, 1,
0.6906044, -0.2874347, 3.440085, 0, 0, 0, 1, 1,
0.691126, 1.237781, -0.3083915, 1, 1, 1, 1, 1,
0.6928481, 0.5442034, -0.1068244, 1, 1, 1, 1, 1,
0.6932228, 2.282639, -0.653222, 1, 1, 1, 1, 1,
0.6963536, -0.7179295, 3.744935, 1, 1, 1, 1, 1,
0.7045289, 0.6437255, 3.088728, 1, 1, 1, 1, 1,
0.7047357, -0.07521444, 3.635672, 1, 1, 1, 1, 1,
0.7051978, -0.1806387, 2.085296, 1, 1, 1, 1, 1,
0.7086545, -0.1478564, 2.567721, 1, 1, 1, 1, 1,
0.7111096, 1.67192, 0.865985, 1, 1, 1, 1, 1,
0.7135993, 0.1385595, 1.767304, 1, 1, 1, 1, 1,
0.7161866, -0.2976484, 2.233364, 1, 1, 1, 1, 1,
0.7204908, -0.03906786, 2.374524, 1, 1, 1, 1, 1,
0.7250752, 1.69169, 0.2452883, 1, 1, 1, 1, 1,
0.7250813, -0.3075302, 2.120615, 1, 1, 1, 1, 1,
0.7255586, 0.382107, 1.960945, 1, 1, 1, 1, 1,
0.726228, 0.7048643, 1.451759, 0, 0, 1, 1, 1,
0.7290442, -1.495378, 2.569287, 1, 0, 0, 1, 1,
0.7327726, 0.07930665, 1.506621, 1, 0, 0, 1, 1,
0.7351063, -0.8894476, 2.000406, 1, 0, 0, 1, 1,
0.7368366, 0.0921107, 0.669411, 1, 0, 0, 1, 1,
0.7435564, 0.9215521, 0.3400536, 1, 0, 0, 1, 1,
0.7580107, 2.332216, 0.154065, 0, 0, 0, 1, 1,
0.7632242, 0.2224295, 1.233899, 0, 0, 0, 1, 1,
0.7694552, -0.08394022, 0.5709683, 0, 0, 0, 1, 1,
0.7739475, 0.3109312, 1.362112, 0, 0, 0, 1, 1,
0.7792969, 1.587319, 1.298502, 0, 0, 0, 1, 1,
0.7848536, -0.4443633, 1.857782, 0, 0, 0, 1, 1,
0.7943174, -0.1231987, 0.3796997, 0, 0, 0, 1, 1,
0.7952855, 1.020585, 0.8612657, 1, 1, 1, 1, 1,
0.8001343, -0.6217134, 2.119951, 1, 1, 1, 1, 1,
0.8004312, 0.1347508, 2.761811, 1, 1, 1, 1, 1,
0.8078642, 1.170434, -0.3933098, 1, 1, 1, 1, 1,
0.8180906, 0.2299413, 2.239721, 1, 1, 1, 1, 1,
0.8226425, 1.000492, 1.103867, 1, 1, 1, 1, 1,
0.8349563, -1.117242, 1.935545, 1, 1, 1, 1, 1,
0.8357709, 0.05807427, 1.307388, 1, 1, 1, 1, 1,
0.8571204, -0.1810637, 2.478927, 1, 1, 1, 1, 1,
0.8637674, -0.8847072, 3.778662, 1, 1, 1, 1, 1,
0.8714154, 0.1259123, 1.229355, 1, 1, 1, 1, 1,
0.8740625, 1.508495, 0.7435374, 1, 1, 1, 1, 1,
0.8741612, -1.265479, 3.217882, 1, 1, 1, 1, 1,
0.8828399, 0.810112, 1.163306, 1, 1, 1, 1, 1,
0.8843694, -0.3072498, 2.244125, 1, 1, 1, 1, 1,
0.8854246, -0.3738172, 3.068834, 0, 0, 1, 1, 1,
0.8963642, 0.7647763, 1.509802, 1, 0, 0, 1, 1,
0.8964458, 0.8890185, 1.65927, 1, 0, 0, 1, 1,
0.8984283, 1.810344, -0.890191, 1, 0, 0, 1, 1,
0.9030521, -0.5140848, 2.664053, 1, 0, 0, 1, 1,
0.9040331, -0.4592245, 0.5064936, 1, 0, 0, 1, 1,
0.9043708, -0.2694576, 2.757675, 0, 0, 0, 1, 1,
0.904607, 0.3454635, 3.208515, 0, 0, 0, 1, 1,
0.9065549, -1.222402, 1.627206, 0, 0, 0, 1, 1,
0.9105545, 0.3317637, 0.8766694, 0, 0, 0, 1, 1,
0.9171425, -2.008106, 2.929574, 0, 0, 0, 1, 1,
0.9191802, -0.0007957575, 3.185604, 0, 0, 0, 1, 1,
0.9222708, 1.378644, -0.2087424, 0, 0, 0, 1, 1,
0.9254566, 0.2003818, 1.866193, 1, 1, 1, 1, 1,
0.9364011, 0.2371923, 1.910503, 1, 1, 1, 1, 1,
0.9470979, 0.8471355, 1.04536, 1, 1, 1, 1, 1,
0.9475926, -2.439524, 2.391797, 1, 1, 1, 1, 1,
0.9553146, -0.01902569, 3.085621, 1, 1, 1, 1, 1,
0.9563783, -0.448217, -0.07433785, 1, 1, 1, 1, 1,
0.9642758, -0.8755201, 2.447248, 1, 1, 1, 1, 1,
0.9645858, 0.4956137, 1.956194, 1, 1, 1, 1, 1,
0.9713953, 1.243491, 0.9247811, 1, 1, 1, 1, 1,
0.9771243, 0.3442401, 0.8080217, 1, 1, 1, 1, 1,
0.9841853, 0.6038659, 1.171104, 1, 1, 1, 1, 1,
0.9920005, 0.6148278, -1.067385, 1, 1, 1, 1, 1,
0.9923611, 0.2998666, 0.758285, 1, 1, 1, 1, 1,
0.9969862, 0.1097386, 1.458292, 1, 1, 1, 1, 1,
1.001354, 0.53732, 1.666875, 1, 1, 1, 1, 1,
1.005705, -0.2777179, 2.603774, 0, 0, 1, 1, 1,
1.008574, 0.2411338, 1.76192, 1, 0, 0, 1, 1,
1.014689, -2.21169, 0.9467463, 1, 0, 0, 1, 1,
1.014848, 0.5492008, 1.369572, 1, 0, 0, 1, 1,
1.02063, -0.2041151, 1.951826, 1, 0, 0, 1, 1,
1.020659, 0.2417662, 1.942608, 1, 0, 0, 1, 1,
1.030643, 1.126135, 1.779259, 0, 0, 0, 1, 1,
1.032213, 0.338347, 0.8469127, 0, 0, 0, 1, 1,
1.037255, -0.2952315, 0.2458371, 0, 0, 0, 1, 1,
1.042735, 0.5106394, 1.645877, 0, 0, 0, 1, 1,
1.043497, 0.1289229, 2.34235, 0, 0, 0, 1, 1,
1.045651, 0.06227347, 1.726998, 0, 0, 0, 1, 1,
1.053229, 1.171252, 2.239731, 0, 0, 0, 1, 1,
1.058024, 0.1286867, 0.5499517, 1, 1, 1, 1, 1,
1.068668, 0.3361175, 3.106517, 1, 1, 1, 1, 1,
1.075485, -2.096533, 1.907873, 1, 1, 1, 1, 1,
1.076142, 0.4198653, -0.2538906, 1, 1, 1, 1, 1,
1.077551, -0.6904163, 2.015018, 1, 1, 1, 1, 1,
1.083785, 1.101889, 0.0783224, 1, 1, 1, 1, 1,
1.089687, 0.6283923, 1.704013, 1, 1, 1, 1, 1,
1.099954, 0.0330366, 0.7144641, 1, 1, 1, 1, 1,
1.10368, 1.422102, 0.9946722, 1, 1, 1, 1, 1,
1.106885, 0.0195803, 2.820972, 1, 1, 1, 1, 1,
1.117123, 0.6089034, 0.5312509, 1, 1, 1, 1, 1,
1.118514, 0.642741, -0.6063797, 1, 1, 1, 1, 1,
1.120408, 1.757089, 0.4260892, 1, 1, 1, 1, 1,
1.125902, 0.09929167, 1.743322, 1, 1, 1, 1, 1,
1.128953, 0.9494069, 0.2089315, 1, 1, 1, 1, 1,
1.133631, -0.05598292, 2.158952, 0, 0, 1, 1, 1,
1.135419, 0.1802429, 2.029713, 1, 0, 0, 1, 1,
1.136047, -1.460965, 2.239962, 1, 0, 0, 1, 1,
1.139324, -0.2901372, 2.435139, 1, 0, 0, 1, 1,
1.144494, 0.8386347, 1.045183, 1, 0, 0, 1, 1,
1.146363, 0.3406394, 1.553261, 1, 0, 0, 1, 1,
1.153401, -1.744217, 3.40241, 0, 0, 0, 1, 1,
1.159168, -0.3668189, 3.477371, 0, 0, 0, 1, 1,
1.16278, 2.186895, 0.03723242, 0, 0, 0, 1, 1,
1.166356, -1.457505, 2.01071, 0, 0, 0, 1, 1,
1.170025, -0.65694, 1.942416, 0, 0, 0, 1, 1,
1.177881, 0.5025252, 1.253424, 0, 0, 0, 1, 1,
1.184615, 1.004451, 1.397159, 0, 0, 0, 1, 1,
1.187197, -1.048426, 3.050483, 1, 1, 1, 1, 1,
1.191589, -1.055418, 1.969628, 1, 1, 1, 1, 1,
1.194046, 0.4335775, -0.9508559, 1, 1, 1, 1, 1,
1.20426, 2.347835, -0.2065476, 1, 1, 1, 1, 1,
1.215883, 0.5827712, 1.68588, 1, 1, 1, 1, 1,
1.22346, -0.7920784, 0.9414907, 1, 1, 1, 1, 1,
1.22428, 0.3376624, 1.632473, 1, 1, 1, 1, 1,
1.230546, 0.3610297, 1.67395, 1, 1, 1, 1, 1,
1.231998, -0.7593607, 1.955079, 1, 1, 1, 1, 1,
1.232174, 1.168075, 1.660516, 1, 1, 1, 1, 1,
1.236529, -0.195203, 3.333122, 1, 1, 1, 1, 1,
1.249267, 0.5070132, 0.4873673, 1, 1, 1, 1, 1,
1.290092, -0.9489861, 0.6591026, 1, 1, 1, 1, 1,
1.306867, -0.4865607, 2.925818, 1, 1, 1, 1, 1,
1.311326, 1.260542, -0.05822052, 1, 1, 1, 1, 1,
1.313777, 1.323441, -0.1037691, 0, 0, 1, 1, 1,
1.317194, -0.6793057, 2.173185, 1, 0, 0, 1, 1,
1.32217, 1.008776, -0.07910935, 1, 0, 0, 1, 1,
1.32446, -0.564452, 0.638706, 1, 0, 0, 1, 1,
1.324838, -0.1004531, 1.756191, 1, 0, 0, 1, 1,
1.325343, 1.374026, 1.661546, 1, 0, 0, 1, 1,
1.327991, -0.7449048, 3.43423, 0, 0, 0, 1, 1,
1.330789, 1.663683, 0.5014942, 0, 0, 0, 1, 1,
1.333171, -1.603141, 1.566304, 0, 0, 0, 1, 1,
1.339269, 1.28412, 1.38441, 0, 0, 0, 1, 1,
1.340254, 0.1155998, 0.3045528, 0, 0, 0, 1, 1,
1.344815, -0.7073528, 2.358109, 0, 0, 0, 1, 1,
1.356425, -0.1200126, 2.694357, 0, 0, 0, 1, 1,
1.376712, 0.3704377, 2.728065, 1, 1, 1, 1, 1,
1.383374, 0.09743303, 1.002622, 1, 1, 1, 1, 1,
1.390627, 0.4485701, -1.753098, 1, 1, 1, 1, 1,
1.390999, 0.5003027, 1.287806, 1, 1, 1, 1, 1,
1.396508, 1.049551, 0.6923032, 1, 1, 1, 1, 1,
1.400099, 0.004464594, 3.253223, 1, 1, 1, 1, 1,
1.407471, 0.8067173, -0.406815, 1, 1, 1, 1, 1,
1.410842, -1.902153, 1.411185, 1, 1, 1, 1, 1,
1.433846, -0.1686433, -0.7231933, 1, 1, 1, 1, 1,
1.43408, -0.07045991, 2.916793, 1, 1, 1, 1, 1,
1.443727, -1.224694, 2.151623, 1, 1, 1, 1, 1,
1.471154, -1.855082, 2.276201, 1, 1, 1, 1, 1,
1.477139, -0.3016793, 2.42035, 1, 1, 1, 1, 1,
1.479574, -0.2842406, 3.036464, 1, 1, 1, 1, 1,
1.482384, 0.1525512, 1.31102, 1, 1, 1, 1, 1,
1.488665, -1.180996, 1.850718, 0, 0, 1, 1, 1,
1.490739, -0.2062747, 2.247101, 1, 0, 0, 1, 1,
1.499342, -0.7688559, 2.980038, 1, 0, 0, 1, 1,
1.500877, -0.5434824, 3.138122, 1, 0, 0, 1, 1,
1.50371, -1.079343, 1.329093, 1, 0, 0, 1, 1,
1.507093, 1.297951, 2.725575, 1, 0, 0, 1, 1,
1.534336, -0.2847962, 0.3747759, 0, 0, 0, 1, 1,
1.546309, -0.01187505, 1.449799, 0, 0, 0, 1, 1,
1.562616, -0.8253907, 1.190401, 0, 0, 0, 1, 1,
1.579065, 0.1021592, 2.208507, 0, 0, 0, 1, 1,
1.579108, 0.7352156, 0.5849042, 0, 0, 0, 1, 1,
1.579358, 0.5020936, 2.453147, 0, 0, 0, 1, 1,
1.603072, -0.2551246, 2.545523, 0, 0, 0, 1, 1,
1.610611, 0.1175098, -0.1983523, 1, 1, 1, 1, 1,
1.622398, -0.5408488, 3.445342, 1, 1, 1, 1, 1,
1.635594, 0.7161413, -0.511027, 1, 1, 1, 1, 1,
1.638291, 0.7560402, -1.702557, 1, 1, 1, 1, 1,
1.641405, -1.315226, 2.293089, 1, 1, 1, 1, 1,
1.643668, 0.2719494, 2.038881, 1, 1, 1, 1, 1,
1.663488, 1.63126, 1.057566, 1, 1, 1, 1, 1,
1.669524, -0.314463, 1.443079, 1, 1, 1, 1, 1,
1.679928, 2.199478, 2.244977, 1, 1, 1, 1, 1,
1.688863, -0.2604157, 0.7404602, 1, 1, 1, 1, 1,
1.693767, -1.223003, 0.7110005, 1, 1, 1, 1, 1,
1.705844, -0.2688973, -0.7993584, 1, 1, 1, 1, 1,
1.710458, -0.8883111, 2.707636, 1, 1, 1, 1, 1,
1.711665, 0.001177874, 2.110054, 1, 1, 1, 1, 1,
1.730989, 0.7352234, 1.956901, 1, 1, 1, 1, 1,
1.733725, -0.00123885, 0.8137451, 0, 0, 1, 1, 1,
1.736381, 0.8825883, 0.5622439, 1, 0, 0, 1, 1,
1.743592, 0.1087683, 1.818725, 1, 0, 0, 1, 1,
1.746609, 0.8042918, 2.948745, 1, 0, 0, 1, 1,
1.752488, -1.098655, 1.74477, 1, 0, 0, 1, 1,
1.779446, 0.5002612, 1.468311, 1, 0, 0, 1, 1,
1.789298, -0.6151304, -0.1721115, 0, 0, 0, 1, 1,
1.800286, 0.7806103, 1.038845, 0, 0, 0, 1, 1,
1.81572, -0.1015368, 3.733246, 0, 0, 0, 1, 1,
1.822756, 1.281302, -1.947044, 0, 0, 0, 1, 1,
1.845371, -0.304748, 1.103352, 0, 0, 0, 1, 1,
1.847965, 0.4743818, 2.920152, 0, 0, 0, 1, 1,
1.856932, 0.3964912, 1.430418, 0, 0, 0, 1, 1,
1.868683, -1.518842, 0.8947394, 1, 1, 1, 1, 1,
1.878036, -0.09739209, -0.2101322, 1, 1, 1, 1, 1,
1.901403, 1.709764, -0.1683524, 1, 1, 1, 1, 1,
1.911664, -0.2114824, -0.9675332, 1, 1, 1, 1, 1,
1.920419, -0.09580436, 2.19572, 1, 1, 1, 1, 1,
1.92483, 1.621426, 2.359101, 1, 1, 1, 1, 1,
1.958502, 0.7928365, 2.172909, 1, 1, 1, 1, 1,
1.959429, 0.08036204, 2.148568, 1, 1, 1, 1, 1,
1.976557, 0.718839, 0.06230259, 1, 1, 1, 1, 1,
1.979336, -0.5471913, 4.138185, 1, 1, 1, 1, 1,
1.985221, -0.914302, 1.71877, 1, 1, 1, 1, 1,
1.994875, -0.7839311, 0.8868157, 1, 1, 1, 1, 1,
2.002702, 1.7362, 0.184418, 1, 1, 1, 1, 1,
2.02003, -0.8665233, 2.418883, 1, 1, 1, 1, 1,
2.048714, 1.395582, 1.661631, 1, 1, 1, 1, 1,
2.053149, -0.5245672, 1.259687, 0, 0, 1, 1, 1,
2.087722, -1.529932, 2.057523, 1, 0, 0, 1, 1,
2.176867, 0.3302647, 1.165164, 1, 0, 0, 1, 1,
2.185622, 0.2960528, 2.456738, 1, 0, 0, 1, 1,
2.186382, -2.092273, 2.26633, 1, 0, 0, 1, 1,
2.189328, -1.764893, 1.948689, 1, 0, 0, 1, 1,
2.18993, 0.2169218, 0.7204227, 0, 0, 0, 1, 1,
2.201263, 0.12237, 2.345902, 0, 0, 0, 1, 1,
2.217736, -0.1573993, 0.6690004, 0, 0, 0, 1, 1,
2.235546, 0.9408413, 0.8434115, 0, 0, 0, 1, 1,
2.262711, -0.738156, 1.626541, 0, 0, 0, 1, 1,
2.315586, 1.537113, -0.6087052, 0, 0, 0, 1, 1,
2.318012, 0.01789944, 1.632409, 0, 0, 0, 1, 1,
2.328588, 0.6662387, -0.8315279, 1, 1, 1, 1, 1,
2.349682, 0.7237327, 0.7479855, 1, 1, 1, 1, 1,
2.403095, -0.2855805, 2.612726, 1, 1, 1, 1, 1,
2.435602, 0.5405086, 3.138115, 1, 1, 1, 1, 1,
2.44577, 1.297604, 1.721591, 1, 1, 1, 1, 1,
2.609937, 1.7321, 2.129511, 1, 1, 1, 1, 1,
2.854532, -0.9180763, 2.339821, 1, 1, 1, 1, 1
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
var radius = 9.872944;
var distance = 34.6783;
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
mvMatrix.translate( 0.2884163, -0.4980812, 0.1803153 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.6783);
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
