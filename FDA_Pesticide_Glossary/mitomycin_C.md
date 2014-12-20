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
-3.245425, -0.6564239, -2.069435, 1, 0, 0, 1,
-2.908612, 0.6793286, 0.005203729, 1, 0.007843138, 0, 1,
-2.514329, 0.6680391, -0.07242171, 1, 0.01176471, 0, 1,
-2.43411, 0.4951772, 0.4897006, 1, 0.01960784, 0, 1,
-2.430107, 0.8467832, 0.9079477, 1, 0.02352941, 0, 1,
-2.399273, -0.1302757, -1.321556, 1, 0.03137255, 0, 1,
-2.29075, -0.659659, -2.959656, 1, 0.03529412, 0, 1,
-2.287382, -2.045383, -2.859529, 1, 0.04313726, 0, 1,
-2.27598, -1.064434, -1.396744, 1, 0.04705882, 0, 1,
-2.274808, 1.487018, -2.320333, 1, 0.05490196, 0, 1,
-2.265299, 1.26754, -0.5945567, 1, 0.05882353, 0, 1,
-2.234463, -0.8577237, -0.3280296, 1, 0.06666667, 0, 1,
-2.168422, -0.1006253, -2.229231, 1, 0.07058824, 0, 1,
-2.162663, 0.5683522, -0.3351134, 1, 0.07843138, 0, 1,
-2.149816, -2.827873, -2.157604, 1, 0.08235294, 0, 1,
-2.093075, -1.50631, -1.889239, 1, 0.09019608, 0, 1,
-2.078418, 0.9650047, -3.553828, 1, 0.09411765, 0, 1,
-2.057976, 0.2662753, -0.3081921, 1, 0.1019608, 0, 1,
-2.0532, 0.2356813, -0.6304962, 1, 0.1098039, 0, 1,
-2.017967, 0.6959864, -1.71429, 1, 0.1137255, 0, 1,
-1.991692, 0.7983631, -1.635438, 1, 0.1215686, 0, 1,
-1.989297, 0.1260614, -2.343342, 1, 0.1254902, 0, 1,
-1.973148, 0.7124884, -0.9556795, 1, 0.1333333, 0, 1,
-1.9476, 1.392418, -1.901282, 1, 0.1372549, 0, 1,
-1.940395, -2.000508, -2.110184, 1, 0.145098, 0, 1,
-1.926235, 0.9284838, -3.751017, 1, 0.1490196, 0, 1,
-1.914176, 0.1282527, -1.341181, 1, 0.1568628, 0, 1,
-1.907156, -1.10368, -2.159347, 1, 0.1607843, 0, 1,
-1.880493, -0.1441728, 0.3546715, 1, 0.1686275, 0, 1,
-1.867951, -1.982106, -1.115222, 1, 0.172549, 0, 1,
-1.843322, -0.3168714, -2.959102, 1, 0.1803922, 0, 1,
-1.82471, 0.3312632, -1.051327, 1, 0.1843137, 0, 1,
-1.811603, -1.62082, -2.42826, 1, 0.1921569, 0, 1,
-1.776307, -0.3401861, -2.457967, 1, 0.1960784, 0, 1,
-1.77495, -0.8127086, -1.558648, 1, 0.2039216, 0, 1,
-1.773711, 0.1593332, -1.410727, 1, 0.2117647, 0, 1,
-1.750705, 0.4873033, -2.917805, 1, 0.2156863, 0, 1,
-1.750164, 0.5255386, -0.2605996, 1, 0.2235294, 0, 1,
-1.713748, -0.2619089, -2.102694, 1, 0.227451, 0, 1,
-1.70755, 0.1098898, -1.739669, 1, 0.2352941, 0, 1,
-1.706682, 0.694474, 0.6560086, 1, 0.2392157, 0, 1,
-1.690543, 0.1164857, -1.040053, 1, 0.2470588, 0, 1,
-1.649135, -1.521159, -1.972881, 1, 0.2509804, 0, 1,
-1.641226, 0.03228244, -2.395998, 1, 0.2588235, 0, 1,
-1.639696, -1.254114, -2.912021, 1, 0.2627451, 0, 1,
-1.631113, 0.451661, -2.068366, 1, 0.2705882, 0, 1,
-1.62625, 0.2260184, -0.7728335, 1, 0.2745098, 0, 1,
-1.622839, -0.9261679, -1.89487, 1, 0.282353, 0, 1,
-1.617012, 0.8691721, -1.10723, 1, 0.2862745, 0, 1,
-1.617007, -0.5535291, -2.4823, 1, 0.2941177, 0, 1,
-1.615672, -1.247205, -4.27046, 1, 0.3019608, 0, 1,
-1.613363, -0.002928254, 0.7552587, 1, 0.3058824, 0, 1,
-1.611384, 0.8443707, -1.721491, 1, 0.3137255, 0, 1,
-1.598362, -1.140126, -1.222307, 1, 0.3176471, 0, 1,
-1.56946, 0.8080398, -0.9044169, 1, 0.3254902, 0, 1,
-1.553025, 1.329456, 0.2933296, 1, 0.3294118, 0, 1,
-1.548922, -0.7789709, -2.672063, 1, 0.3372549, 0, 1,
-1.537253, -0.7549386, -3.608782, 1, 0.3411765, 0, 1,
-1.535046, -0.2318694, -2.529389, 1, 0.3490196, 0, 1,
-1.515938, -1.224475, -2.140316, 1, 0.3529412, 0, 1,
-1.507319, -0.9433577, -2.789266, 1, 0.3607843, 0, 1,
-1.505388, -1.632563, -3.348649, 1, 0.3647059, 0, 1,
-1.50189, 0.630223, -0.05343966, 1, 0.372549, 0, 1,
-1.498366, 0.7913772, -1.579637, 1, 0.3764706, 0, 1,
-1.48605, 0.1433094, -0.01076867, 1, 0.3843137, 0, 1,
-1.480361, -0.5559098, -3.110683, 1, 0.3882353, 0, 1,
-1.470542, 0.3351274, -1.549764, 1, 0.3960784, 0, 1,
-1.469815, 0.6076004, -0.5383527, 1, 0.4039216, 0, 1,
-1.464083, -0.106665, -3.115274, 1, 0.4078431, 0, 1,
-1.459301, 1.228175, -0.779349, 1, 0.4156863, 0, 1,
-1.458478, -0.1625726, -0.750246, 1, 0.4196078, 0, 1,
-1.455437, -0.1670214, 0.2879197, 1, 0.427451, 0, 1,
-1.442621, 1.256941, -0.7258453, 1, 0.4313726, 0, 1,
-1.441312, -1.003276, -1.613966, 1, 0.4392157, 0, 1,
-1.432072, 0.6585359, -0.9666859, 1, 0.4431373, 0, 1,
-1.415407, 0.2924607, -1.849026, 1, 0.4509804, 0, 1,
-1.411309, -0.04080085, -1.014713, 1, 0.454902, 0, 1,
-1.410478, -0.9309208, -1.648852, 1, 0.4627451, 0, 1,
-1.401602, 0.7102102, -0.01491867, 1, 0.4666667, 0, 1,
-1.39905, 0.04543673, -4.54839, 1, 0.4745098, 0, 1,
-1.392267, -0.08005227, -1.11017, 1, 0.4784314, 0, 1,
-1.387692, -1.001396, -1.828144, 1, 0.4862745, 0, 1,
-1.38415, 1.076582, -0.6669756, 1, 0.4901961, 0, 1,
-1.375772, 0.8605962, -0.2368373, 1, 0.4980392, 0, 1,
-1.368275, -1.318446, -3.24144, 1, 0.5058824, 0, 1,
-1.365092, 2.28353, 0.4442516, 1, 0.509804, 0, 1,
-1.35569, 2.716864, -1.866106, 1, 0.5176471, 0, 1,
-1.34656, -0.4972025, -3.614854, 1, 0.5215687, 0, 1,
-1.346017, 0.5923178, -0.6107178, 1, 0.5294118, 0, 1,
-1.345848, -0.9134532, -2.549561, 1, 0.5333334, 0, 1,
-1.344531, -1.076393, -4.767721, 1, 0.5411765, 0, 1,
-1.339614, -0.7209167, -0.8396401, 1, 0.5450981, 0, 1,
-1.337381, -0.4957705, -1.617714, 1, 0.5529412, 0, 1,
-1.336944, 0.8971374, -0.3602321, 1, 0.5568628, 0, 1,
-1.33039, 0.3060766, -1.163841, 1, 0.5647059, 0, 1,
-1.321966, -0.06322345, -1.960423, 1, 0.5686275, 0, 1,
-1.317627, 0.5440826, -1.034918, 1, 0.5764706, 0, 1,
-1.311642, 0.9360064, -0.8511122, 1, 0.5803922, 0, 1,
-1.308315, -0.1318304, -1.195406, 1, 0.5882353, 0, 1,
-1.292331, 0.01482014, -1.199098, 1, 0.5921569, 0, 1,
-1.290623, 0.6324467, -2.648071, 1, 0.6, 0, 1,
-1.290168, 1.385601, -1.019071, 1, 0.6078432, 0, 1,
-1.280867, -0.3656088, -2.104655, 1, 0.6117647, 0, 1,
-1.276806, -0.8467032, -1.056548, 1, 0.6196079, 0, 1,
-1.27379, -1.045455, -2.187779, 1, 0.6235294, 0, 1,
-1.267186, 1.578341, -0.2262843, 1, 0.6313726, 0, 1,
-1.265112, 0.4596785, -1.880865, 1, 0.6352941, 0, 1,
-1.264778, 0.9198694, -2.014557, 1, 0.6431373, 0, 1,
-1.257379, -0.7467651, -2.144672, 1, 0.6470588, 0, 1,
-1.254466, -0.1560527, -0.8163581, 1, 0.654902, 0, 1,
-1.249099, 0.4488023, -1.755178, 1, 0.6588235, 0, 1,
-1.244181, -2.089898, -2.807879, 1, 0.6666667, 0, 1,
-1.229149, 0.4085224, -2.51408, 1, 0.6705883, 0, 1,
-1.197567, 2.095653, 0.5293453, 1, 0.6784314, 0, 1,
-1.188732, -1.26376, -1.329482, 1, 0.682353, 0, 1,
-1.188455, 0.2834118, -1.376529, 1, 0.6901961, 0, 1,
-1.181828, 2.382451, -0.1473163, 1, 0.6941177, 0, 1,
-1.170392, 0.9475885, -0.8945867, 1, 0.7019608, 0, 1,
-1.148718, -0.3179826, -0.3699817, 1, 0.7098039, 0, 1,
-1.146372, -0.5548898, -2.217747, 1, 0.7137255, 0, 1,
-1.137743, -0.6372428, -1.402723, 1, 0.7215686, 0, 1,
-1.133309, -0.2038627, -2.790505, 1, 0.7254902, 0, 1,
-1.128278, 0.357349, -1.279985, 1, 0.7333333, 0, 1,
-1.12513, -0.4500058, -3.043247, 1, 0.7372549, 0, 1,
-1.124392, 0.1677295, -1.215105, 1, 0.7450981, 0, 1,
-1.114538, -0.4321275, -2.268068, 1, 0.7490196, 0, 1,
-1.103511, -0.1871079, -0.7122706, 1, 0.7568628, 0, 1,
-1.092645, 0.7956554, 0.1050846, 1, 0.7607843, 0, 1,
-1.086697, -1.175785, -3.481978, 1, 0.7686275, 0, 1,
-1.083385, 0.9322709, -0.08110512, 1, 0.772549, 0, 1,
-1.072919, -0.3382539, -0.8962508, 1, 0.7803922, 0, 1,
-1.070075, -0.7227883, -3.51132, 1, 0.7843137, 0, 1,
-1.066197, 1.198834, -0.2913115, 1, 0.7921569, 0, 1,
-1.061024, -1.379573, -0.327489, 1, 0.7960784, 0, 1,
-1.058906, -3.058488, -3.309856, 1, 0.8039216, 0, 1,
-1.058535, 0.7868946, -2.29151, 1, 0.8117647, 0, 1,
-1.053841, 0.5005174, -1.290269, 1, 0.8156863, 0, 1,
-1.047679, -1.052296, -2.741203, 1, 0.8235294, 0, 1,
-1.044095, 0.09707165, -1.180321, 1, 0.827451, 0, 1,
-1.039375, -0.5307456, -2.204726, 1, 0.8352941, 0, 1,
-1.03913, -0.5258944, -4.742919, 1, 0.8392157, 0, 1,
-1.03828, -0.6816744, -0.3030853, 1, 0.8470588, 0, 1,
-1.03634, 1.131967, -0.5768611, 1, 0.8509804, 0, 1,
-1.030308, 0.1792499, -1.675858, 1, 0.8588235, 0, 1,
-1.02883, -0.5945668, -0.1407058, 1, 0.8627451, 0, 1,
-1.02854, -0.6900277, -3.166266, 1, 0.8705882, 0, 1,
-1.011511, -0.9016804, -1.707531, 1, 0.8745098, 0, 1,
-1.007949, -1.03734, -2.643116, 1, 0.8823529, 0, 1,
-1.006641, 1.339964, -0.6570143, 1, 0.8862745, 0, 1,
-1.00451, 0.545188, -2.012906, 1, 0.8941177, 0, 1,
-1.002597, -1.089732, -2.311403, 1, 0.8980392, 0, 1,
-1.001824, 0.298723, -2.670158, 1, 0.9058824, 0, 1,
-1.000838, 0.3408513, -0.2023621, 1, 0.9137255, 0, 1,
-0.9943942, 0.5644202, -1.653131, 1, 0.9176471, 0, 1,
-0.9891703, 0.1459355, -2.439438, 1, 0.9254902, 0, 1,
-0.9871551, -1.655232, -3.872365, 1, 0.9294118, 0, 1,
-0.9850427, -2.596556, -3.429317, 1, 0.9372549, 0, 1,
-0.9837359, 2.421489, -1.363438, 1, 0.9411765, 0, 1,
-0.9812557, -0.5846196, -2.552811, 1, 0.9490196, 0, 1,
-0.97358, -0.677956, -1.404501, 1, 0.9529412, 0, 1,
-0.9654171, -1.752124, -3.296003, 1, 0.9607843, 0, 1,
-0.9652351, 0.08492362, -2.562792, 1, 0.9647059, 0, 1,
-0.9633679, 0.05048512, -2.918743, 1, 0.972549, 0, 1,
-0.9595153, -0.6409847, -0.8107687, 1, 0.9764706, 0, 1,
-0.9571714, -0.4839729, -3.403466, 1, 0.9843137, 0, 1,
-0.9553043, -2.320778, -2.000447, 1, 0.9882353, 0, 1,
-0.9534944, 0.3336816, -0.8299212, 1, 0.9960784, 0, 1,
-0.9493701, -0.7011073, -1.952816, 0.9960784, 1, 0, 1,
-0.9443834, -2.274582, -1.809421, 0.9921569, 1, 0, 1,
-0.9420562, -1.278351, -3.189289, 0.9843137, 1, 0, 1,
-0.9409047, 1.110532, -0.9258646, 0.9803922, 1, 0, 1,
-0.9331568, -0.1996615, -2.673273, 0.972549, 1, 0, 1,
-0.9318328, -1.313026, -2.698906, 0.9686275, 1, 0, 1,
-0.929127, -0.5457233, -2.846591, 0.9607843, 1, 0, 1,
-0.9228291, -0.5314306, -1.99872, 0.9568627, 1, 0, 1,
-0.9093153, -2.060713, -2.357718, 0.9490196, 1, 0, 1,
-0.9061612, 2.297481, 0.6083532, 0.945098, 1, 0, 1,
-0.9047713, 0.7664821, -1.323101, 0.9372549, 1, 0, 1,
-0.9044324, 0.6328344, -1.484767, 0.9333333, 1, 0, 1,
-0.9015358, 0.6836544, -1.403623, 0.9254902, 1, 0, 1,
-0.8991098, -0.5330357, -3.794713, 0.9215686, 1, 0, 1,
-0.898486, -0.6357198, -3.078584, 0.9137255, 1, 0, 1,
-0.8945776, 0.7385481, -0.7404213, 0.9098039, 1, 0, 1,
-0.8921183, -1.137977, -4.222823, 0.9019608, 1, 0, 1,
-0.8918674, 1.258994, -2.072012, 0.8941177, 1, 0, 1,
-0.889619, -2.119087, -3.30215, 0.8901961, 1, 0, 1,
-0.8890086, 0.2829136, -2.373632, 0.8823529, 1, 0, 1,
-0.8852005, -0.9377277, -0.5800577, 0.8784314, 1, 0, 1,
-0.8845533, 1.75958, -0.8122945, 0.8705882, 1, 0, 1,
-0.8826751, -0.1560971, -1.626549, 0.8666667, 1, 0, 1,
-0.8790368, 0.08405355, -1.801532, 0.8588235, 1, 0, 1,
-0.8755143, -0.3798015, -2.132587, 0.854902, 1, 0, 1,
-0.8672896, 0.8683347, -1.604048, 0.8470588, 1, 0, 1,
-0.8630268, -0.6931856, -1.809184, 0.8431373, 1, 0, 1,
-0.8550485, 0.9483545, 1.144441, 0.8352941, 1, 0, 1,
-0.8536249, 0.8062479, -0.08727252, 0.8313726, 1, 0, 1,
-0.8387311, 1.25304, -2.461135, 0.8235294, 1, 0, 1,
-0.8312036, 0.2288002, -3.398224, 0.8196079, 1, 0, 1,
-0.8305528, -0.9790345, -2.610909, 0.8117647, 1, 0, 1,
-0.8294342, -0.6645496, -3.499962, 0.8078431, 1, 0, 1,
-0.8265792, 0.7334259, -1.685518, 0.8, 1, 0, 1,
-0.8256221, 0.8234814, -0.395204, 0.7921569, 1, 0, 1,
-0.8227901, -1.091527, -3.050233, 0.7882353, 1, 0, 1,
-0.8216484, 0.9800654, 0.128634, 0.7803922, 1, 0, 1,
-0.819176, 0.4855477, -0.8759743, 0.7764706, 1, 0, 1,
-0.8129035, -1.136385, -3.891533, 0.7686275, 1, 0, 1,
-0.8082674, 1.805148, 0.9437166, 0.7647059, 1, 0, 1,
-0.8034132, -1.474655, -5.297472, 0.7568628, 1, 0, 1,
-0.8022906, 0.8502379, -2.983082, 0.7529412, 1, 0, 1,
-0.7933325, -0.3106269, -3.041287, 0.7450981, 1, 0, 1,
-0.7930196, 0.1917452, -1.021275, 0.7411765, 1, 0, 1,
-0.7918562, -1.523936, -3.215786, 0.7333333, 1, 0, 1,
-0.7863746, -2.292478, -2.645904, 0.7294118, 1, 0, 1,
-0.7859131, 1.267057, -0.1704714, 0.7215686, 1, 0, 1,
-0.783636, 2.52517, -0.7846513, 0.7176471, 1, 0, 1,
-0.7803442, 1.311995, 0.1861702, 0.7098039, 1, 0, 1,
-0.7780031, -0.7224788, -1.051427, 0.7058824, 1, 0, 1,
-0.7762762, 0.3059789, -0.9192129, 0.6980392, 1, 0, 1,
-0.7760262, 0.9292874, -0.5693315, 0.6901961, 1, 0, 1,
-0.7758362, -2.153247, -2.540944, 0.6862745, 1, 0, 1,
-0.7744896, 0.3271558, 0.6768324, 0.6784314, 1, 0, 1,
-0.7703917, 2.012415, -0.2071213, 0.6745098, 1, 0, 1,
-0.7684758, -0.8281852, -2.465786, 0.6666667, 1, 0, 1,
-0.7631874, -1.45582, -2.90763, 0.6627451, 1, 0, 1,
-0.7582022, 0.2077259, 0.4367258, 0.654902, 1, 0, 1,
-0.7524033, 0.5624069, -1.257062, 0.6509804, 1, 0, 1,
-0.7475478, 1.365134, -2.089879, 0.6431373, 1, 0, 1,
-0.7403099, -0.854623, -3.869856, 0.6392157, 1, 0, 1,
-0.7364292, -2.460438, -3.322423, 0.6313726, 1, 0, 1,
-0.7333606, -1.059487, -3.147594, 0.627451, 1, 0, 1,
-0.7291964, -0.9280308, -1.711399, 0.6196079, 1, 0, 1,
-0.727513, 0.2234252, -2.267264, 0.6156863, 1, 0, 1,
-0.7231821, -2.356979, -2.434047, 0.6078432, 1, 0, 1,
-0.7176464, -0.7321616, -2.814158, 0.6039216, 1, 0, 1,
-0.7175483, -0.3345799, -1.158318, 0.5960785, 1, 0, 1,
-0.7076033, -0.8854365, -2.885253, 0.5882353, 1, 0, 1,
-0.7054521, 1.007799, -1.487504, 0.5843138, 1, 0, 1,
-0.704673, -0.674542, -3.130625, 0.5764706, 1, 0, 1,
-0.704524, -0.5292903, -2.324351, 0.572549, 1, 0, 1,
-0.6978709, -0.1944833, -2.239237, 0.5647059, 1, 0, 1,
-0.6978548, -0.09441321, -0.8975255, 0.5607843, 1, 0, 1,
-0.6958597, -1.707327, -2.778152, 0.5529412, 1, 0, 1,
-0.6939187, -0.1368058, -0.4926084, 0.5490196, 1, 0, 1,
-0.690853, 0.2350596, 0.3822547, 0.5411765, 1, 0, 1,
-0.6893293, -1.074437, -3.118083, 0.5372549, 1, 0, 1,
-0.6857731, 1.830626, -0.1351865, 0.5294118, 1, 0, 1,
-0.679647, -0.2198987, -1.493554, 0.5254902, 1, 0, 1,
-0.6774659, 1.236594, -1.185287, 0.5176471, 1, 0, 1,
-0.6770173, -0.6711069, -3.369257, 0.5137255, 1, 0, 1,
-0.6708297, 1.59865, -0.5394068, 0.5058824, 1, 0, 1,
-0.6606045, -1.152296, -2.739443, 0.5019608, 1, 0, 1,
-0.6605242, -0.4924115, -1.222946, 0.4941176, 1, 0, 1,
-0.6583545, 0.1993213, -1.047437, 0.4862745, 1, 0, 1,
-0.6571218, -1.130188, -3.206393, 0.4823529, 1, 0, 1,
-0.6540021, -0.929739, -3.061744, 0.4745098, 1, 0, 1,
-0.6501065, 0.009171912, -0.8656828, 0.4705882, 1, 0, 1,
-0.6496674, -1.382049, -3.409282, 0.4627451, 1, 0, 1,
-0.6480924, -0.6193445, -2.113681, 0.4588235, 1, 0, 1,
-0.6428921, 0.09857105, -1.347297, 0.4509804, 1, 0, 1,
-0.6360691, 0.522091, 0.3757243, 0.4470588, 1, 0, 1,
-0.6349269, -0.4680062, -2.956608, 0.4392157, 1, 0, 1,
-0.6329885, 1.104284, -0.7524244, 0.4352941, 1, 0, 1,
-0.6294044, 0.291875, -0.05800449, 0.427451, 1, 0, 1,
-0.6266202, 0.2804071, -0.9403834, 0.4235294, 1, 0, 1,
-0.6247638, -0.8116229, -1.386902, 0.4156863, 1, 0, 1,
-0.6242386, -0.4186327, -1.984896, 0.4117647, 1, 0, 1,
-0.6218518, 0.8597512, -1.627398, 0.4039216, 1, 0, 1,
-0.614494, -0.3627431, -3.393718, 0.3960784, 1, 0, 1,
-0.6096568, -0.8489814, -1.903486, 0.3921569, 1, 0, 1,
-0.6074788, 1.408886, -1.053094, 0.3843137, 1, 0, 1,
-0.6020814, -0.6429754, -1.834063, 0.3803922, 1, 0, 1,
-0.5989072, 0.07901866, -2.124814, 0.372549, 1, 0, 1,
-0.5974147, 1.402757, -0.6285501, 0.3686275, 1, 0, 1,
-0.594855, 0.06488484, -3.576145, 0.3607843, 1, 0, 1,
-0.5898737, -0.1584008, -0.6430019, 0.3568628, 1, 0, 1,
-0.5885447, 0.1461265, -2.747803, 0.3490196, 1, 0, 1,
-0.5880002, 1.186464, 0.1884329, 0.345098, 1, 0, 1,
-0.5809508, 0.8365451, -0.391481, 0.3372549, 1, 0, 1,
-0.5807506, 1.497276, -1.130873, 0.3333333, 1, 0, 1,
-0.5796834, -1.788587, -3.644523, 0.3254902, 1, 0, 1,
-0.5770975, -0.271105, -3.096652, 0.3215686, 1, 0, 1,
-0.5746143, -0.1175254, -1.390452, 0.3137255, 1, 0, 1,
-0.5689691, 0.3799019, -0.5937217, 0.3098039, 1, 0, 1,
-0.5660099, -1.929453, -2.93221, 0.3019608, 1, 0, 1,
-0.5650221, 0.5435625, -0.3691761, 0.2941177, 1, 0, 1,
-0.5631297, -0.02460897, 0.7617956, 0.2901961, 1, 0, 1,
-0.5594589, -0.7459964, -1.39614, 0.282353, 1, 0, 1,
-0.5525893, 0.3900243, -2.017515, 0.2784314, 1, 0, 1,
-0.5524738, -0.2090288, -3.13663, 0.2705882, 1, 0, 1,
-0.5514097, -2.019908, -1.476676, 0.2666667, 1, 0, 1,
-0.5512885, -1.484, -3.088364, 0.2588235, 1, 0, 1,
-0.5512868, 0.4844228, -0.6586732, 0.254902, 1, 0, 1,
-0.5497707, -0.2389223, -1.857863, 0.2470588, 1, 0, 1,
-0.5418956, 0.3707041, -3.706091, 0.2431373, 1, 0, 1,
-0.5417352, 0.5745025, -1.016512, 0.2352941, 1, 0, 1,
-0.5305649, 1.489632, 0.8487518, 0.2313726, 1, 0, 1,
-0.5300239, 1.833744, 0.5651804, 0.2235294, 1, 0, 1,
-0.5215639, 1.005323, -0.846613, 0.2196078, 1, 0, 1,
-0.5202298, -0.8122847, -1.375276, 0.2117647, 1, 0, 1,
-0.5173752, -0.3305107, -3.950556, 0.2078431, 1, 0, 1,
-0.5164813, 0.2377388, -0.4983912, 0.2, 1, 0, 1,
-0.5137706, -0.06754391, -0.6006745, 0.1921569, 1, 0, 1,
-0.5114428, -0.792286, -1.78622, 0.1882353, 1, 0, 1,
-0.5070276, 0.4059699, 0.998403, 0.1803922, 1, 0, 1,
-0.5048498, 1.020093, -1.507746, 0.1764706, 1, 0, 1,
-0.499403, 1.203604, -1.122259, 0.1686275, 1, 0, 1,
-0.4922446, 0.6830719, -1.238573, 0.1647059, 1, 0, 1,
-0.4810115, 0.7913657, -0.369821, 0.1568628, 1, 0, 1,
-0.4789941, -0.006126608, 0.959394, 0.1529412, 1, 0, 1,
-0.4774905, 0.5604895, -3.122488, 0.145098, 1, 0, 1,
-0.4749383, 1.095683, 0.4135569, 0.1411765, 1, 0, 1,
-0.471751, -0.03207802, -1.378735, 0.1333333, 1, 0, 1,
-0.4671302, -0.7769898, -2.435701, 0.1294118, 1, 0, 1,
-0.4653302, 1.094239, -1.668018, 0.1215686, 1, 0, 1,
-0.4633292, -1.306004, -3.175935, 0.1176471, 1, 0, 1,
-0.4614085, -0.9222026, -1.549711, 0.1098039, 1, 0, 1,
-0.460062, 0.3325208, -0.82844, 0.1058824, 1, 0, 1,
-0.4595273, 1.03334, -1.267254, 0.09803922, 1, 0, 1,
-0.4587356, -0.9419643, -1.685304, 0.09019608, 1, 0, 1,
-0.4520585, -0.559322, -1.447606, 0.08627451, 1, 0, 1,
-0.451891, 0.488773, -1.744013, 0.07843138, 1, 0, 1,
-0.4506489, 0.185338, -1.196555, 0.07450981, 1, 0, 1,
-0.4481991, -0.6768404, -1.262746, 0.06666667, 1, 0, 1,
-0.4465418, 1.715188, -0.6218466, 0.0627451, 1, 0, 1,
-0.4464842, 0.5938491, 0.05608802, 0.05490196, 1, 0, 1,
-0.4463219, -1.441382, -3.938228, 0.05098039, 1, 0, 1,
-0.4453404, 0.3100925, -2.685044, 0.04313726, 1, 0, 1,
-0.4444224, 0.32212, -0.2224367, 0.03921569, 1, 0, 1,
-0.4419827, 1.827374, -0.5695931, 0.03137255, 1, 0, 1,
-0.4363505, -0.07446968, -1.667546, 0.02745098, 1, 0, 1,
-0.4344407, 1.432194, 0.284917, 0.01960784, 1, 0, 1,
-0.4280785, -0.3073263, -3.340156, 0.01568628, 1, 0, 1,
-0.4271395, -0.3888294, -1.169881, 0.007843138, 1, 0, 1,
-0.4269684, -0.1930005, -3.479346, 0.003921569, 1, 0, 1,
-0.4263142, -1.423916, -4.011301, 0, 1, 0.003921569, 1,
-0.4245048, 0.459516, 0.1350504, 0, 1, 0.01176471, 1,
-0.4218165, -0.3644102, -3.865393, 0, 1, 0.01568628, 1,
-0.416893, -0.1656081, -3.605092, 0, 1, 0.02352941, 1,
-0.4146396, 0.6172552, -0.264266, 0, 1, 0.02745098, 1,
-0.4146069, 0.4439851, -1.351255, 0, 1, 0.03529412, 1,
-0.4135489, 0.5419297, -2.144844, 0, 1, 0.03921569, 1,
-0.4100827, -0.6570035, -1.967612, 0, 1, 0.04705882, 1,
-0.4099437, 1.137074, -1.968995, 0, 1, 0.05098039, 1,
-0.4053455, -1.421516, -3.084341, 0, 1, 0.05882353, 1,
-0.4019112, 0.5500243, -2.552305, 0, 1, 0.0627451, 1,
-0.4014944, -0.1422278, -1.95873, 0, 1, 0.07058824, 1,
-0.3981498, -1.514988, -4.074537, 0, 1, 0.07450981, 1,
-0.3967915, 1.103016, -0.7172004, 0, 1, 0.08235294, 1,
-0.3965659, 0.1991685, -2.388043, 0, 1, 0.08627451, 1,
-0.3886071, 0.6744774, -1.532338, 0, 1, 0.09411765, 1,
-0.3826093, -0.3828855, -1.118357, 0, 1, 0.1019608, 1,
-0.3781983, 0.1467114, -0.8779669, 0, 1, 0.1058824, 1,
-0.3755707, 1.587396, -0.4106509, 0, 1, 0.1137255, 1,
-0.372605, 1.627703, -0.431131, 0, 1, 0.1176471, 1,
-0.370423, -1.150855, -2.684511, 0, 1, 0.1254902, 1,
-0.3636033, 0.9283504, -1.428535, 0, 1, 0.1294118, 1,
-0.3560933, 0.3968838, 0.2575455, 0, 1, 0.1372549, 1,
-0.3560827, -0.7974603, -2.733089, 0, 1, 0.1411765, 1,
-0.3551229, -0.6904891, -2.538258, 0, 1, 0.1490196, 1,
-0.3478859, -0.03227185, -2.928081, 0, 1, 0.1529412, 1,
-0.3430829, 0.8839111, -1.676326, 0, 1, 0.1607843, 1,
-0.3422939, 0.7517431, -0.3174731, 0, 1, 0.1647059, 1,
-0.3417474, -0.6001542, -4.153766, 0, 1, 0.172549, 1,
-0.3398893, 1.678824, -0.6280953, 0, 1, 0.1764706, 1,
-0.3377636, -0.04388003, -0.5643269, 0, 1, 0.1843137, 1,
-0.3329589, -0.7539171, -3.075638, 0, 1, 0.1882353, 1,
-0.3303356, 0.9036735, -1.470995, 0, 1, 0.1960784, 1,
-0.3287979, -0.5606733, -2.339481, 0, 1, 0.2039216, 1,
-0.323453, -0.1896221, -3.432028, 0, 1, 0.2078431, 1,
-0.3228152, 1.250528, -0.6368145, 0, 1, 0.2156863, 1,
-0.3195268, 0.4638721, -1.498265, 0, 1, 0.2196078, 1,
-0.3185347, 1.143916, 0.07718393, 0, 1, 0.227451, 1,
-0.3126464, 1.031969, -2.697487, 0, 1, 0.2313726, 1,
-0.3124508, 1.562856, 1.37648, 0, 1, 0.2392157, 1,
-0.3106077, 0.185312, -1.148572, 0, 1, 0.2431373, 1,
-0.3102376, 1.875219, 0.2085572, 0, 1, 0.2509804, 1,
-0.3071907, -0.4549373, -3.834269, 0, 1, 0.254902, 1,
-0.3028329, -0.6520195, -2.458267, 0, 1, 0.2627451, 1,
-0.2967769, 0.4583066, -1.283439, 0, 1, 0.2666667, 1,
-0.2918312, 0.2684853, -2.210259, 0, 1, 0.2745098, 1,
-0.2904376, -1.560016, -3.404579, 0, 1, 0.2784314, 1,
-0.2885902, -0.144076, -2.10989, 0, 1, 0.2862745, 1,
-0.2880401, 0.1741567, -1.691712, 0, 1, 0.2901961, 1,
-0.2878412, 0.3731378, 0.6331382, 0, 1, 0.2980392, 1,
-0.2871044, 1.819828, -0.4893425, 0, 1, 0.3058824, 1,
-0.2845693, 1.041342, -0.4946336, 0, 1, 0.3098039, 1,
-0.2829564, 0.2857843, -0.1730204, 0, 1, 0.3176471, 1,
-0.2806808, -1.925464, -2.024922, 0, 1, 0.3215686, 1,
-0.2805371, 0.5933116, -1.4348, 0, 1, 0.3294118, 1,
-0.2799852, -1.004911, -3.637363, 0, 1, 0.3333333, 1,
-0.2778947, -0.6584436, -1.840722, 0, 1, 0.3411765, 1,
-0.2762643, -0.5036075, -2.551782, 0, 1, 0.345098, 1,
-0.2712014, 1.30965, 1.334378, 0, 1, 0.3529412, 1,
-0.2704678, -0.5977626, -3.778539, 0, 1, 0.3568628, 1,
-0.2672915, 0.1490297, 0.4050735, 0, 1, 0.3647059, 1,
-0.26439, -0.3689323, -2.902989, 0, 1, 0.3686275, 1,
-0.2624367, -0.1946123, -1.791684, 0, 1, 0.3764706, 1,
-0.2617275, -0.2724644, -0.259231, 0, 1, 0.3803922, 1,
-0.2612586, 1.459567, 0.02873198, 0, 1, 0.3882353, 1,
-0.260727, -0.7973126, -3.075587, 0, 1, 0.3921569, 1,
-0.2598564, 1.521779, -0.471947, 0, 1, 0.4, 1,
-0.2569821, -0.06821978, -1.249133, 0, 1, 0.4078431, 1,
-0.2502907, -0.6015711, -2.656833, 0, 1, 0.4117647, 1,
-0.2383988, 2.192077, -0.225787, 0, 1, 0.4196078, 1,
-0.2357436, -1.357713, -3.169916, 0, 1, 0.4235294, 1,
-0.2355068, -1.751412, -2.741635, 0, 1, 0.4313726, 1,
-0.2325564, 0.3692267, -0.5670805, 0, 1, 0.4352941, 1,
-0.2286126, -0.5611551, -2.645237, 0, 1, 0.4431373, 1,
-0.2197158, -0.2996903, -0.4502536, 0, 1, 0.4470588, 1,
-0.2192488, -1.325822, -3.649735, 0, 1, 0.454902, 1,
-0.2160709, -0.5971275, -2.856695, 0, 1, 0.4588235, 1,
-0.2139985, -0.01059852, -1.218247, 0, 1, 0.4666667, 1,
-0.2100204, -0.5945241, -3.51228, 0, 1, 0.4705882, 1,
-0.2046233, 1.837398, -1.568976, 0, 1, 0.4784314, 1,
-0.2001046, -0.02257096, -1.524591, 0, 1, 0.4823529, 1,
-0.1990269, 1.409744, -0.4402698, 0, 1, 0.4901961, 1,
-0.1982774, 0.1965697, -1.562507, 0, 1, 0.4941176, 1,
-0.1971371, 0.1192613, -0.9413031, 0, 1, 0.5019608, 1,
-0.1969162, 0.574636, -1.584497, 0, 1, 0.509804, 1,
-0.1959266, 1.754072, 0.1524791, 0, 1, 0.5137255, 1,
-0.1930019, 0.6811849, -1.685401, 0, 1, 0.5215687, 1,
-0.1822248, 0.01511987, -1.396021, 0, 1, 0.5254902, 1,
-0.1814205, -0.1276194, -2.608722, 0, 1, 0.5333334, 1,
-0.1781654, -1.56222, -2.080725, 0, 1, 0.5372549, 1,
-0.1721396, 0.7745566, 1.260707, 0, 1, 0.5450981, 1,
-0.1712385, -0.02566179, -1.639753, 0, 1, 0.5490196, 1,
-0.1694829, 0.8047641, -0.2091203, 0, 1, 0.5568628, 1,
-0.1682656, -1.181808, -1.952342, 0, 1, 0.5607843, 1,
-0.166459, 0.04781286, -0.6904999, 0, 1, 0.5686275, 1,
-0.161525, -0.02434479, -2.837002, 0, 1, 0.572549, 1,
-0.161014, 0.7848086, 1.248636, 0, 1, 0.5803922, 1,
-0.1584303, 1.638892, -0.07835714, 0, 1, 0.5843138, 1,
-0.1569683, 0.7782938, 0.3735025, 0, 1, 0.5921569, 1,
-0.1566994, -0.2241845, -3.135729, 0, 1, 0.5960785, 1,
-0.1566876, 0.01177428, -2.44767, 0, 1, 0.6039216, 1,
-0.1549611, -1.082449, -3.655839, 0, 1, 0.6117647, 1,
-0.1524928, 0.04597952, -0.02707343, 0, 1, 0.6156863, 1,
-0.1523131, -0.6174119, -3.616269, 0, 1, 0.6235294, 1,
-0.1519295, 1.491166, -0.09344584, 0, 1, 0.627451, 1,
-0.1458457, 1.174527, -2.017092, 0, 1, 0.6352941, 1,
-0.1444297, -0.5091127, -2.106627, 0, 1, 0.6392157, 1,
-0.1432219, -0.3171901, -1.905475, 0, 1, 0.6470588, 1,
-0.1419242, 0.9902056, -1.278629, 0, 1, 0.6509804, 1,
-0.1386798, -1.046372, -3.90955, 0, 1, 0.6588235, 1,
-0.1376946, -0.5007634, -3.240619, 0, 1, 0.6627451, 1,
-0.1374402, 0.05480849, -1.245322, 0, 1, 0.6705883, 1,
-0.1370288, 0.4975955, 0.1020234, 0, 1, 0.6745098, 1,
-0.1366062, 0.435075, 0.29764, 0, 1, 0.682353, 1,
-0.1341101, -0.9869066, -2.827908, 0, 1, 0.6862745, 1,
-0.1328914, 1.012825, -0.4703119, 0, 1, 0.6941177, 1,
-0.1254867, 0.2927107, -0.2366244, 0, 1, 0.7019608, 1,
-0.1254646, 0.7660826, -0.4755388, 0, 1, 0.7058824, 1,
-0.1187431, 1.738061, -2.406645, 0, 1, 0.7137255, 1,
-0.1180385, 1.926837, 0.7493365, 0, 1, 0.7176471, 1,
-0.1176532, 0.2296024, 1.123314, 0, 1, 0.7254902, 1,
-0.1159074, -0.05188641, -3.077131, 0, 1, 0.7294118, 1,
-0.1157319, 0.3097401, 0.8629611, 0, 1, 0.7372549, 1,
-0.1058025, 0.267155, -1.066224, 0, 1, 0.7411765, 1,
-0.1026185, 1.641194, 0.7331719, 0, 1, 0.7490196, 1,
-0.1023867, 1.187805, -1.989735, 0, 1, 0.7529412, 1,
-0.1017697, -0.5256629, -3.189496, 0, 1, 0.7607843, 1,
-0.1005848, -0.488538, -2.109509, 0, 1, 0.7647059, 1,
-0.09894728, -1.734687, -3.015278, 0, 1, 0.772549, 1,
-0.09697086, 1.936449, -1.335668, 0, 1, 0.7764706, 1,
-0.09565473, -0.3442004, -3.441483, 0, 1, 0.7843137, 1,
-0.09504582, 0.6443527, 0.561195, 0, 1, 0.7882353, 1,
-0.09405664, -0.8088706, -2.969304, 0, 1, 0.7960784, 1,
-0.09374288, -0.6985663, -2.651691, 0, 1, 0.8039216, 1,
-0.09048624, 2.004459, 1.549171, 0, 1, 0.8078431, 1,
-0.08810527, -1.286545, -4.603701, 0, 1, 0.8156863, 1,
-0.08759787, -1.397966, -4.202781, 0, 1, 0.8196079, 1,
-0.08317588, -1.481891, -5.347443, 0, 1, 0.827451, 1,
-0.07658825, -0.4457299, -1.660392, 0, 1, 0.8313726, 1,
-0.07442393, -0.515514, -3.74963, 0, 1, 0.8392157, 1,
-0.07280725, 0.4734513, -1.632597, 0, 1, 0.8431373, 1,
-0.06489883, -0.6972297, -2.860614, 0, 1, 0.8509804, 1,
-0.06132052, -0.323041, -2.530336, 0, 1, 0.854902, 1,
-0.06074781, 0.7272239, 0.2962152, 0, 1, 0.8627451, 1,
-0.05855827, -0.3010356, -2.418441, 0, 1, 0.8666667, 1,
-0.05663982, 0.3144212, -0.3290194, 0, 1, 0.8745098, 1,
-0.0548714, -0.5081015, -4.312868, 0, 1, 0.8784314, 1,
-0.05234962, 1.226873, 1.496914, 0, 1, 0.8862745, 1,
-0.05037689, -1.390528, -3.858055, 0, 1, 0.8901961, 1,
-0.0467853, 1.868312, -1.068425, 0, 1, 0.8980392, 1,
-0.03769718, 1.507313, -0.2648645, 0, 1, 0.9058824, 1,
-0.03711353, -1.742714, -2.667297, 0, 1, 0.9098039, 1,
-0.03252796, 0.2194048, -0.1411171, 0, 1, 0.9176471, 1,
-0.03165497, 1.299862, 1.067397, 0, 1, 0.9215686, 1,
-0.03076871, -0.06760565, -2.622701, 0, 1, 0.9294118, 1,
-0.02733807, -0.2462142, -4.352797, 0, 1, 0.9333333, 1,
-0.02521196, -0.5892588, -4.187091, 0, 1, 0.9411765, 1,
-0.02357387, -0.05413387, -1.022522, 0, 1, 0.945098, 1,
-0.02023173, 1.462772, -0.2238459, 0, 1, 0.9529412, 1,
-0.01435432, 2.034662, -1.678283, 0, 1, 0.9568627, 1,
-0.01113365, -0.3245679, -2.166884, 0, 1, 0.9647059, 1,
-0.01018333, -0.07312496, -3.094141, 0, 1, 0.9686275, 1,
-0.007943052, -0.8166794, -4.796782, 0, 1, 0.9764706, 1,
-0.007061027, -0.9281473, -4.144878, 0, 1, 0.9803922, 1,
-0.005356901, -0.4069982, -4.033002, 0, 1, 0.9882353, 1,
-0.002970556, 0.1390385, -0.1566311, 0, 1, 0.9921569, 1,
-0.001161889, 1.117372, -1.553613, 0, 1, 1, 1,
0.001262138, 0.7616903, 0.1629364, 0, 0.9921569, 1, 1,
0.00134255, -0.5371811, 5.019893, 0, 0.9882353, 1, 1,
0.006823507, 1.251106, 0.4597169, 0, 0.9803922, 1, 1,
0.00827708, -0.5210259, 3.167672, 0, 0.9764706, 1, 1,
0.009664502, -0.7759514, 4.187475, 0, 0.9686275, 1, 1,
0.01045147, 0.5818158, 1.083324, 0, 0.9647059, 1, 1,
0.01575622, 1.729449, -0.9768227, 0, 0.9568627, 1, 1,
0.01762195, 0.5105094, -1.189298, 0, 0.9529412, 1, 1,
0.02648179, 1.714521, 1.665311, 0, 0.945098, 1, 1,
0.02962295, -0.2452465, 2.391416, 0, 0.9411765, 1, 1,
0.03083435, 0.9216468, -0.1163126, 0, 0.9333333, 1, 1,
0.03187486, 1.531394, -0.05239773, 0, 0.9294118, 1, 1,
0.03323088, 1.73281, -0.3822855, 0, 0.9215686, 1, 1,
0.03366661, -1.054905, 4.158832, 0, 0.9176471, 1, 1,
0.04423268, -0.1332484, 4.360819, 0, 0.9098039, 1, 1,
0.04699415, -0.8921553, 3.056924, 0, 0.9058824, 1, 1,
0.0472691, 0.02964775, -0.3927809, 0, 0.8980392, 1, 1,
0.04748316, 1.148973, 0.1273668, 0, 0.8901961, 1, 1,
0.05374739, -0.3667079, 2.326893, 0, 0.8862745, 1, 1,
0.05753266, 1.04176, 0.2611381, 0, 0.8784314, 1, 1,
0.05798233, -0.02925429, 2.328538, 0, 0.8745098, 1, 1,
0.06274109, -0.04903555, 3.274222, 0, 0.8666667, 1, 1,
0.06291611, 0.9965976, 0.04703289, 0, 0.8627451, 1, 1,
0.0631096, 0.2723133, 0.5284328, 0, 0.854902, 1, 1,
0.06346115, 1.215713, -0.6207675, 0, 0.8509804, 1, 1,
0.06732652, -0.1046515, 3.915487, 0, 0.8431373, 1, 1,
0.06923133, 0.1294243, -0.1837103, 0, 0.8392157, 1, 1,
0.0702564, 0.544834, -0.3537075, 0, 0.8313726, 1, 1,
0.07325123, 0.08219189, 0.5057682, 0, 0.827451, 1, 1,
0.07586257, 1.105542, -1.443687, 0, 0.8196079, 1, 1,
0.0787826, -0.1512915, 1.34444, 0, 0.8156863, 1, 1,
0.07931672, -0.2477695, 2.757882, 0, 0.8078431, 1, 1,
0.08176006, 0.8117245, 1.524063, 0, 0.8039216, 1, 1,
0.08330401, 0.8432096, -0.08325823, 0, 0.7960784, 1, 1,
0.08380225, 0.6161233, 1.271819, 0, 0.7882353, 1, 1,
0.09160896, 0.6065031, -0.8648198, 0, 0.7843137, 1, 1,
0.0921467, 1.544023, 0.4357449, 0, 0.7764706, 1, 1,
0.09223917, -0.675152, 4.114044, 0, 0.772549, 1, 1,
0.09234408, -0.7002568, 4.214323, 0, 0.7647059, 1, 1,
0.0945447, 0.7542263, 1.606353, 0, 0.7607843, 1, 1,
0.0946354, -0.1244722, 1.386717, 0, 0.7529412, 1, 1,
0.09546259, 0.4877938, 0.2492596, 0, 0.7490196, 1, 1,
0.09602556, -2.045737, 3.032515, 0, 0.7411765, 1, 1,
0.09852596, 0.4078593, 0.7851557, 0, 0.7372549, 1, 1,
0.1003061, -0.6233484, 2.184571, 0, 0.7294118, 1, 1,
0.1004818, -0.387146, 0.4652526, 0, 0.7254902, 1, 1,
0.1005079, 1.324415, -1.587177, 0, 0.7176471, 1, 1,
0.1005684, 0.3769059, -0.3008548, 0, 0.7137255, 1, 1,
0.1007705, 0.3527593, -0.007875604, 0, 0.7058824, 1, 1,
0.1017161, 0.2546099, 0.2802282, 0, 0.6980392, 1, 1,
0.1030721, -0.217921, 1.173382, 0, 0.6941177, 1, 1,
0.1031845, 0.01442826, 2.027264, 0, 0.6862745, 1, 1,
0.1066403, 1.634428, 0.02012339, 0, 0.682353, 1, 1,
0.1071525, -0.152857, 0.6728908, 0, 0.6745098, 1, 1,
0.107949, -0.2257663, 2.034107, 0, 0.6705883, 1, 1,
0.1082761, -1.012905, 5.581975, 0, 0.6627451, 1, 1,
0.1119452, 0.03225325, 1.778042, 0, 0.6588235, 1, 1,
0.1144729, 0.4900565, 0.6594029, 0, 0.6509804, 1, 1,
0.1145559, -1.180219, 3.512245, 0, 0.6470588, 1, 1,
0.1146254, -0.9897069, 3.18124, 0, 0.6392157, 1, 1,
0.1211772, 1.548473, 1.367985, 0, 0.6352941, 1, 1,
0.1215298, -0.4803162, 1.920366, 0, 0.627451, 1, 1,
0.1270434, -0.08519848, 2.752353, 0, 0.6235294, 1, 1,
0.1387831, 0.1427532, 0.8733563, 0, 0.6156863, 1, 1,
0.1437307, -0.6120362, 1.72218, 0, 0.6117647, 1, 1,
0.1439818, 0.7713944, 1.529199, 0, 0.6039216, 1, 1,
0.1483779, -0.7950068, 2.159965, 0, 0.5960785, 1, 1,
0.1528643, 0.7207175, -0.06493733, 0, 0.5921569, 1, 1,
0.1539702, 0.2566255, 1.429983, 0, 0.5843138, 1, 1,
0.1582729, 0.1788357, 0.2697818, 0, 0.5803922, 1, 1,
0.1598778, 2.085921, 1.0307, 0, 0.572549, 1, 1,
0.1599603, -1.525979, 3.378054, 0, 0.5686275, 1, 1,
0.1655774, -1.068154, 2.864007, 0, 0.5607843, 1, 1,
0.1660458, 0.2687991, -0.4701121, 0, 0.5568628, 1, 1,
0.1681249, -0.5010037, 3.044996, 0, 0.5490196, 1, 1,
0.1688354, -0.8227893, 2.416302, 0, 0.5450981, 1, 1,
0.170055, -2.589716, 1.968589, 0, 0.5372549, 1, 1,
0.1721293, -0.3737996, 2.00727, 0, 0.5333334, 1, 1,
0.1805884, -1.020343, 4.827177, 0, 0.5254902, 1, 1,
0.1860852, 0.940286, 1.021705, 0, 0.5215687, 1, 1,
0.1923353, 0.630846, 2.092454, 0, 0.5137255, 1, 1,
0.1952378, 0.758571, 0.694575, 0, 0.509804, 1, 1,
0.196107, 0.1745813, 1.132561, 0, 0.5019608, 1, 1,
0.197692, 0.1834713, 1.197988, 0, 0.4941176, 1, 1,
0.206507, 0.2459708, 1.337134, 0, 0.4901961, 1, 1,
0.2125371, -0.4025492, 2.955954, 0, 0.4823529, 1, 1,
0.2146128, -1.35347, 1.589779, 0, 0.4784314, 1, 1,
0.2192473, 0.1839963, -0.3127126, 0, 0.4705882, 1, 1,
0.2214359, -0.2212316, 2.767765, 0, 0.4666667, 1, 1,
0.221486, -1.166346, 1.355662, 0, 0.4588235, 1, 1,
0.2222863, -1.681463, 1.544024, 0, 0.454902, 1, 1,
0.2225027, -0.06402104, 2.82763, 0, 0.4470588, 1, 1,
0.2229929, -0.2742828, 2.78057, 0, 0.4431373, 1, 1,
0.2236459, -0.6480667, 2.047339, 0, 0.4352941, 1, 1,
0.2246231, -0.9784175, 2.982802, 0, 0.4313726, 1, 1,
0.2265585, -0.1307923, 0.9115416, 0, 0.4235294, 1, 1,
0.2277417, 0.4163446, -0.8434669, 0, 0.4196078, 1, 1,
0.2287869, -0.8461488, 4.208044, 0, 0.4117647, 1, 1,
0.2288906, -1.034725, 2.147906, 0, 0.4078431, 1, 1,
0.2328892, -1.793103, 3.066026, 0, 0.4, 1, 1,
0.2362401, 0.910141, 0.09570747, 0, 0.3921569, 1, 1,
0.2408532, 0.4672055, 0.444515, 0, 0.3882353, 1, 1,
0.2428518, 0.6880466, 0.8227065, 0, 0.3803922, 1, 1,
0.2452358, -0.7839237, 2.308218, 0, 0.3764706, 1, 1,
0.245309, -2.077601, 3.510269, 0, 0.3686275, 1, 1,
0.2484462, -0.3149115, 3.924337, 0, 0.3647059, 1, 1,
0.2494533, 0.1590514, 1.189507, 0, 0.3568628, 1, 1,
0.2503835, 1.499155, -0.6988475, 0, 0.3529412, 1, 1,
0.2505724, -0.2139761, 4.403926, 0, 0.345098, 1, 1,
0.2537298, -0.2451994, 3.208671, 0, 0.3411765, 1, 1,
0.2580157, 2.13987, 0.2440964, 0, 0.3333333, 1, 1,
0.2604329, 0.5631688, 3.106406, 0, 0.3294118, 1, 1,
0.2614178, 1.588774, -1.473832, 0, 0.3215686, 1, 1,
0.2659519, -0.08084924, 0.3526423, 0, 0.3176471, 1, 1,
0.2661408, 0.3109806, 1.59536, 0, 0.3098039, 1, 1,
0.2672345, -0.03371155, 0.2941177, 0, 0.3058824, 1, 1,
0.2675978, -1.441655, 2.197372, 0, 0.2980392, 1, 1,
0.2685747, 1.487631, 1.542826, 0, 0.2901961, 1, 1,
0.2689235, -0.6289473, 3.741119, 0, 0.2862745, 1, 1,
0.2699712, 0.4268102, -0.7941965, 0, 0.2784314, 1, 1,
0.2728567, -1.193831, 4.641062, 0, 0.2745098, 1, 1,
0.2741329, -0.4321656, 1.811315, 0, 0.2666667, 1, 1,
0.2796564, -1.274041, 3.266186, 0, 0.2627451, 1, 1,
0.2803041, -0.4301049, 3.816397, 0, 0.254902, 1, 1,
0.2811044, -0.8670198, 2.905938, 0, 0.2509804, 1, 1,
0.291222, 0.1930593, 2.927253, 0, 0.2431373, 1, 1,
0.2966774, -1.691286, 4.151184, 0, 0.2392157, 1, 1,
0.3050519, 1.287089, 1.310953, 0, 0.2313726, 1, 1,
0.3094685, -0.3429739, 3.440747, 0, 0.227451, 1, 1,
0.3122802, -0.2864715, 3.217624, 0, 0.2196078, 1, 1,
0.3129939, -0.01129723, 2.888764, 0, 0.2156863, 1, 1,
0.3140849, 0.4400103, 0.4495954, 0, 0.2078431, 1, 1,
0.3167687, -0.1989393, 1.51966, 0, 0.2039216, 1, 1,
0.3214555, -2.12397, 2.535755, 0, 0.1960784, 1, 1,
0.3231522, 0.8458132, 0.6344905, 0, 0.1882353, 1, 1,
0.3252037, -1.39891, 4.54091, 0, 0.1843137, 1, 1,
0.3254934, 1.109098, -1.158107, 0, 0.1764706, 1, 1,
0.3257962, -0.4411569, 2.821826, 0, 0.172549, 1, 1,
0.3298115, 0.178566, 2.329753, 0, 0.1647059, 1, 1,
0.3302954, -0.1727369, 3.360311, 0, 0.1607843, 1, 1,
0.330437, -1.042681, 2.480169, 0, 0.1529412, 1, 1,
0.3347156, -0.1250291, 1.602231, 0, 0.1490196, 1, 1,
0.3353277, 1.014701, 0.3131392, 0, 0.1411765, 1, 1,
0.3410738, 0.4316956, 1.430061, 0, 0.1372549, 1, 1,
0.3450925, -0.8515369, 3.132993, 0, 0.1294118, 1, 1,
0.3506118, -0.6513035, 2.368748, 0, 0.1254902, 1, 1,
0.3525157, 1.657206, -0.789314, 0, 0.1176471, 1, 1,
0.358859, 0.05635728, 1.349375, 0, 0.1137255, 1, 1,
0.3674534, 2.787623, 0.7867103, 0, 0.1058824, 1, 1,
0.3736748, -0.6966869, 2.531362, 0, 0.09803922, 1, 1,
0.3794045, -0.7519664, 1.696546, 0, 0.09411765, 1, 1,
0.3811805, 0.9798634, 0.5005509, 0, 0.08627451, 1, 1,
0.3816577, -1.407927, 3.994122, 0, 0.08235294, 1, 1,
0.3875814, -1.137028, 2.404454, 0, 0.07450981, 1, 1,
0.3890958, 0.3694524, 0.4686669, 0, 0.07058824, 1, 1,
0.391973, 0.1609956, 1.45029, 0, 0.0627451, 1, 1,
0.4035582, 0.3230669, 3.563189, 0, 0.05882353, 1, 1,
0.4038669, -0.9745686, 2.072804, 0, 0.05098039, 1, 1,
0.4089238, -0.1261539, 2.134494, 0, 0.04705882, 1, 1,
0.4104024, -1.02555, 1.128862, 0, 0.03921569, 1, 1,
0.4105448, 1.34664, 0.3746291, 0, 0.03529412, 1, 1,
0.4114536, 0.9659616, -1.470747, 0, 0.02745098, 1, 1,
0.4129726, 1.223808, 1.762363, 0, 0.02352941, 1, 1,
0.4173622, -0.112982, 1.270162, 0, 0.01568628, 1, 1,
0.4176734, -1.251922, 2.464108, 0, 0.01176471, 1, 1,
0.419305, 0.7348649, -1.520969, 0, 0.003921569, 1, 1,
0.4202306, -0.1820135, 1.724278, 0.003921569, 0, 1, 1,
0.420355, -0.05817687, 1.041881, 0.007843138, 0, 1, 1,
0.4231355, 0.6764128, 0.5071899, 0.01568628, 0, 1, 1,
0.4247398, 0.6734492, 1.827046, 0.01960784, 0, 1, 1,
0.4271978, -0.7319214, 2.2032, 0.02745098, 0, 1, 1,
0.4278634, -1.146789, 2.889384, 0.03137255, 0, 1, 1,
0.4317142, 2.575653, 0.2760489, 0.03921569, 0, 1, 1,
0.4319468, -0.09483954, 1.69003, 0.04313726, 0, 1, 1,
0.43546, 1.755373, -1.262813, 0.05098039, 0, 1, 1,
0.4374581, -0.6936075, 2.556702, 0.05490196, 0, 1, 1,
0.4381036, -0.659152, 0.5999799, 0.0627451, 0, 1, 1,
0.4481482, 0.3265111, 1.533832, 0.06666667, 0, 1, 1,
0.450185, -0.6180477, 2.182374, 0.07450981, 0, 1, 1,
0.4568371, -0.627829, 2.527922, 0.07843138, 0, 1, 1,
0.458033, -1.458525, 2.602685, 0.08627451, 0, 1, 1,
0.4596513, -0.6453742, 1.320525, 0.09019608, 0, 1, 1,
0.4625846, 1.426612, 1.03554, 0.09803922, 0, 1, 1,
0.4639687, -1.615116, 2.85864, 0.1058824, 0, 1, 1,
0.4649009, 0.407192, 0.6848873, 0.1098039, 0, 1, 1,
0.4655021, -0.1496521, 1.078879, 0.1176471, 0, 1, 1,
0.4702106, 0.5635481, -0.4909976, 0.1215686, 0, 1, 1,
0.4726233, -1.031701, 4.502883, 0.1294118, 0, 1, 1,
0.472774, -0.5288564, 2.401106, 0.1333333, 0, 1, 1,
0.4783823, -0.8431158, 1.073988, 0.1411765, 0, 1, 1,
0.4847784, -1.550253, 2.590222, 0.145098, 0, 1, 1,
0.4848893, -1.881159, 2.296382, 0.1529412, 0, 1, 1,
0.4870142, -1.352423, 4.791373, 0.1568628, 0, 1, 1,
0.4871241, 0.3419871, 0.0834588, 0.1647059, 0, 1, 1,
0.4931071, 0.3873821, 1.686242, 0.1686275, 0, 1, 1,
0.4946522, 0.5212017, 0.2322911, 0.1764706, 0, 1, 1,
0.4974535, -1.067466, 2.727685, 0.1803922, 0, 1, 1,
0.4999313, 0.3338878, -0.1148483, 0.1882353, 0, 1, 1,
0.5009705, 0.1360087, 1.504598, 0.1921569, 0, 1, 1,
0.5020797, 1.325249, 0.3625942, 0.2, 0, 1, 1,
0.5034353, -1.407472, -1.031094, 0.2078431, 0, 1, 1,
0.5045949, 0.9441864, -0.1268174, 0.2117647, 0, 1, 1,
0.5063786, 0.5190686, 1.625979, 0.2196078, 0, 1, 1,
0.5091415, 3.05135, 1.266657, 0.2235294, 0, 1, 1,
0.5108625, -0.3613048, 2.461233, 0.2313726, 0, 1, 1,
0.5111146, -1.227467, 3.324745, 0.2352941, 0, 1, 1,
0.5111755, 0.1353568, 0.1482115, 0.2431373, 0, 1, 1,
0.5161468, -1.004801, 2.499248, 0.2470588, 0, 1, 1,
0.5288012, -0.1620043, 3.338823, 0.254902, 0, 1, 1,
0.5352808, -0.4502753, -0.3168734, 0.2588235, 0, 1, 1,
0.5402024, -1.934215, 2.472187, 0.2666667, 0, 1, 1,
0.5437539, -0.2327462, 0.752983, 0.2705882, 0, 1, 1,
0.5462777, -0.573696, 2.399967, 0.2784314, 0, 1, 1,
0.5465854, -0.693339, 1.141356, 0.282353, 0, 1, 1,
0.5484151, -0.6067496, 2.062904, 0.2901961, 0, 1, 1,
0.5539174, -0.3258533, 2.219939, 0.2941177, 0, 1, 1,
0.5638528, -0.2433496, 0.5909249, 0.3019608, 0, 1, 1,
0.5652934, 0.425371, -0.1757943, 0.3098039, 0, 1, 1,
0.5700616, 0.9807094, 0.8026008, 0.3137255, 0, 1, 1,
0.5729121, 0.5774822, 1.016659, 0.3215686, 0, 1, 1,
0.573334, 1.172379, 0.5969325, 0.3254902, 0, 1, 1,
0.5809724, 0.1452975, 0.1254161, 0.3333333, 0, 1, 1,
0.5826154, 1.143997, 2.176155, 0.3372549, 0, 1, 1,
0.5834872, 0.908546, 2.159659, 0.345098, 0, 1, 1,
0.5907303, 1.103935, 1.963508, 0.3490196, 0, 1, 1,
0.5911097, 0.5889747, 2.787857, 0.3568628, 0, 1, 1,
0.5968451, -1.392594, 4.251352, 0.3607843, 0, 1, 1,
0.5978491, 0.2328723, 1.282044, 0.3686275, 0, 1, 1,
0.5986874, 0.7652599, 1.971483, 0.372549, 0, 1, 1,
0.601302, 1.65251, 1.547848, 0.3803922, 0, 1, 1,
0.605158, -0.5165401, 2.799105, 0.3843137, 0, 1, 1,
0.6054381, -0.8779993, 3.533028, 0.3921569, 0, 1, 1,
0.6078804, 1.630521, 0.9215692, 0.3960784, 0, 1, 1,
0.6083862, 1.089863, -0.840107, 0.4039216, 0, 1, 1,
0.6089032, 0.1922965, 0.5325437, 0.4117647, 0, 1, 1,
0.609023, 0.2986883, 1.147833, 0.4156863, 0, 1, 1,
0.6104071, -1.198557, 3.666913, 0.4235294, 0, 1, 1,
0.6115634, -0.6396059, 2.348474, 0.427451, 0, 1, 1,
0.6116242, 1.038681, -0.01786134, 0.4352941, 0, 1, 1,
0.6133041, -1.439097, 6.075997, 0.4392157, 0, 1, 1,
0.6188592, 0.7871379, -0.5996755, 0.4470588, 0, 1, 1,
0.6193093, -1.465692, 2.441123, 0.4509804, 0, 1, 1,
0.633091, -1.250863, 2.048675, 0.4588235, 0, 1, 1,
0.6378651, -0.3138737, 1.743849, 0.4627451, 0, 1, 1,
0.6393613, 0.2236728, 0.5784252, 0.4705882, 0, 1, 1,
0.6439602, -0.1208819, 0.08197752, 0.4745098, 0, 1, 1,
0.6448411, 0.7629441, 0.1068373, 0.4823529, 0, 1, 1,
0.6464973, -0.03053753, 1.317112, 0.4862745, 0, 1, 1,
0.6512871, -0.2282462, 0.7207671, 0.4941176, 0, 1, 1,
0.6568388, -0.5781155, 3.012915, 0.5019608, 0, 1, 1,
0.6583268, 1.403251, 0.7885329, 0.5058824, 0, 1, 1,
0.6583428, -0.5328724, 1.390011, 0.5137255, 0, 1, 1,
0.6612133, 0.958173, 0.5230258, 0.5176471, 0, 1, 1,
0.661474, -0.4542273, 3.788806, 0.5254902, 0, 1, 1,
0.666966, -1.041554, 3.572327, 0.5294118, 0, 1, 1,
0.6670684, 0.5144774, 2.458009, 0.5372549, 0, 1, 1,
0.6723483, -0.536274, 2.61549, 0.5411765, 0, 1, 1,
0.674931, -0.5615634, 3.102483, 0.5490196, 0, 1, 1,
0.6772796, -0.575256, 3.03617, 0.5529412, 0, 1, 1,
0.6805774, 0.3498812, 0.7746435, 0.5607843, 0, 1, 1,
0.6828266, 1.770734, -1.037153, 0.5647059, 0, 1, 1,
0.6851358, -0.2918393, 2.9002, 0.572549, 0, 1, 1,
0.685449, 0.3142653, 1.823067, 0.5764706, 0, 1, 1,
0.6906, -0.4604618, 3.622133, 0.5843138, 0, 1, 1,
0.6975217, -0.6255761, 1.553058, 0.5882353, 0, 1, 1,
0.7003817, 0.5712461, 0.1327537, 0.5960785, 0, 1, 1,
0.7067933, 0.284018, -0.2699234, 0.6039216, 0, 1, 1,
0.7138968, 0.6389213, 1.319638, 0.6078432, 0, 1, 1,
0.7150702, -0.4892051, 4.046539, 0.6156863, 0, 1, 1,
0.7162343, -0.8235844, 2.352967, 0.6196079, 0, 1, 1,
0.718474, 0.6812075, 1.518793, 0.627451, 0, 1, 1,
0.7240467, 0.7140176, -0.9664729, 0.6313726, 0, 1, 1,
0.7250806, -0.8780535, 2.149141, 0.6392157, 0, 1, 1,
0.7260174, -0.1706413, 0.7372965, 0.6431373, 0, 1, 1,
0.7261786, -0.8927543, 0.5576946, 0.6509804, 0, 1, 1,
0.7270915, 0.133186, -0.8102749, 0.654902, 0, 1, 1,
0.7287145, 0.3203579, 2.527627, 0.6627451, 0, 1, 1,
0.7447979, 0.2830636, 1.416733, 0.6666667, 0, 1, 1,
0.750147, -1.45689, 4.032553, 0.6745098, 0, 1, 1,
0.7537764, 0.1364008, -0.4136266, 0.6784314, 0, 1, 1,
0.7594755, -0.4600168, 3.41422, 0.6862745, 0, 1, 1,
0.7621824, -1.779658, 1.415851, 0.6901961, 0, 1, 1,
0.7653694, -1.248169, 2.296148, 0.6980392, 0, 1, 1,
0.7700287, -0.5492188, 2.681895, 0.7058824, 0, 1, 1,
0.7724165, 1.344752, -1.604575, 0.7098039, 0, 1, 1,
0.7773281, -0.352568, 2.196633, 0.7176471, 0, 1, 1,
0.7833722, -0.7287221, 3.672218, 0.7215686, 0, 1, 1,
0.7864525, -0.3250411, 2.483937, 0.7294118, 0, 1, 1,
0.7883511, -0.8003319, 2.417977, 0.7333333, 0, 1, 1,
0.7897792, 2.672751, 0.6377653, 0.7411765, 0, 1, 1,
0.7928181, -0.1154562, 3.033683, 0.7450981, 0, 1, 1,
0.7950423, 0.9847776, 0.5651861, 0.7529412, 0, 1, 1,
0.7978671, -0.3942418, 2.068755, 0.7568628, 0, 1, 1,
0.7983672, -0.2071223, 3.272242, 0.7647059, 0, 1, 1,
0.7997587, -0.01901858, 1.739305, 0.7686275, 0, 1, 1,
0.8035101, 0.4242107, 0.7447539, 0.7764706, 0, 1, 1,
0.8077965, 1.259243, -0.3913014, 0.7803922, 0, 1, 1,
0.8111804, 0.2778769, 0.3031946, 0.7882353, 0, 1, 1,
0.8319173, -0.544309, 3.90669, 0.7921569, 0, 1, 1,
0.8368667, 0.6591552, -0.4551458, 0.8, 0, 1, 1,
0.8526557, -0.02596542, 2.039497, 0.8078431, 0, 1, 1,
0.8566841, -0.3444652, 1.799695, 0.8117647, 0, 1, 1,
0.8573595, -1.707412, 3.844778, 0.8196079, 0, 1, 1,
0.8626608, 0.4119341, 1.555144, 0.8235294, 0, 1, 1,
0.8671882, 0.4234911, 2.044868, 0.8313726, 0, 1, 1,
0.8717744, -0.9043368, 2.675654, 0.8352941, 0, 1, 1,
0.8722713, -2.25927, 2.693631, 0.8431373, 0, 1, 1,
0.8733816, -0.4997405, 2.661939, 0.8470588, 0, 1, 1,
0.881367, 0.2646592, 0.7719422, 0.854902, 0, 1, 1,
0.8883999, -0.8964232, 2.511737, 0.8588235, 0, 1, 1,
0.891977, -0.7129022, 1.831779, 0.8666667, 0, 1, 1,
0.8925544, 0.6928209, 0.8462811, 0.8705882, 0, 1, 1,
0.8933136, 0.3405739, 0.9779629, 0.8784314, 0, 1, 1,
0.8969318, -1.845358, 4.325038, 0.8823529, 0, 1, 1,
0.8974099, 2.16056, 1.205458, 0.8901961, 0, 1, 1,
0.8984684, 0.4306154, 2.202824, 0.8941177, 0, 1, 1,
0.8992289, -0.7899255, 1.926483, 0.9019608, 0, 1, 1,
0.903845, 1.000836, 0.9739408, 0.9098039, 0, 1, 1,
0.9045001, 0.9772427, 1.793828, 0.9137255, 0, 1, 1,
0.9065851, 0.4674429, 1.73691, 0.9215686, 0, 1, 1,
0.9081578, 0.5657361, 1.410396, 0.9254902, 0, 1, 1,
0.9097745, -0.8565122, 2.577616, 0.9333333, 0, 1, 1,
0.9115394, 0.2802147, 1.987167, 0.9372549, 0, 1, 1,
0.9199026, 1.264976, 1.246235, 0.945098, 0, 1, 1,
0.9250072, -0.6878754, 4.031119, 0.9490196, 0, 1, 1,
0.9250125, 1.638186, -0.8718033, 0.9568627, 0, 1, 1,
0.9266167, 0.9102216, 0.9049383, 0.9607843, 0, 1, 1,
0.9326032, 0.7877493, 1.872518, 0.9686275, 0, 1, 1,
0.933377, -0.86171, 1.966343, 0.972549, 0, 1, 1,
0.9388427, -0.1350994, 1.403542, 0.9803922, 0, 1, 1,
0.9420153, -0.7542596, 2.719708, 0.9843137, 0, 1, 1,
0.945002, -0.5199636, 2.291023, 0.9921569, 0, 1, 1,
0.9479646, 2.419673, 0.9724509, 0.9960784, 0, 1, 1,
0.9524604, -0.69503, 0.9335988, 1, 0, 0.9960784, 1,
0.9587896, -0.3577719, 1.768748, 1, 0, 0.9882353, 1,
0.9799926, -1.39977, 1.584508, 1, 0, 0.9843137, 1,
0.9801869, -0.8182409, 2.059669, 1, 0, 0.9764706, 1,
0.9879569, 0.753352, 1.019942, 1, 0, 0.972549, 1,
0.9929821, -0.938051, 3.515, 1, 0, 0.9647059, 1,
0.9956661, -0.5139393, 0.6291938, 1, 0, 0.9607843, 1,
0.9978872, -2.489683, 2.264284, 1, 0, 0.9529412, 1,
1.001034, 1.21663, 1.183466, 1, 0, 0.9490196, 1,
1.009568, -0.9472561, 2.615667, 1, 0, 0.9411765, 1,
1.014969, -1.230566, 2.078542, 1, 0, 0.9372549, 1,
1.017574, 0.9235529, 2.29471, 1, 0, 0.9294118, 1,
1.036086, 0.5846078, 0.6992776, 1, 0, 0.9254902, 1,
1.040059, 0.2945941, 1.497424, 1, 0, 0.9176471, 1,
1.041526, -0.07950224, 4.040541, 1, 0, 0.9137255, 1,
1.047419, 1.140073, -0.03489789, 1, 0, 0.9058824, 1,
1.058599, -1.630564, 2.810373, 1, 0, 0.9019608, 1,
1.063736, -1.480201, 2.382863, 1, 0, 0.8941177, 1,
1.071173, 1.288199, 0.1845024, 1, 0, 0.8862745, 1,
1.07612, -0.8897532, 0.8073057, 1, 0, 0.8823529, 1,
1.076705, 1.62068, 0.7004202, 1, 0, 0.8745098, 1,
1.07834, -0.441958, 3.396492, 1, 0, 0.8705882, 1,
1.078968, 0.4681539, -0.07070342, 1, 0, 0.8627451, 1,
1.079855, -0.1688333, -0.3453158, 1, 0, 0.8588235, 1,
1.080725, -0.1889953, 0.7946371, 1, 0, 0.8509804, 1,
1.088251, 0.04158027, 1.315469, 1, 0, 0.8470588, 1,
1.097202, -0.4412288, 2.837978, 1, 0, 0.8392157, 1,
1.10249, 1.197325, -0.2316908, 1, 0, 0.8352941, 1,
1.105116, 0.126694, 2.327338, 1, 0, 0.827451, 1,
1.115207, 0.5735019, 1.824999, 1, 0, 0.8235294, 1,
1.117533, -0.01940542, 2.72715, 1, 0, 0.8156863, 1,
1.117904, -1.07006, 2.301261, 1, 0, 0.8117647, 1,
1.11834, -0.4368708, 3.007057, 1, 0, 0.8039216, 1,
1.121037, 1.029224, 2.778907, 1, 0, 0.7960784, 1,
1.12409, 0.7782465, 0.6380557, 1, 0, 0.7921569, 1,
1.124956, 0.3755091, 3.224576, 1, 0, 0.7843137, 1,
1.129346, 1.332542, 0.2544962, 1, 0, 0.7803922, 1,
1.131958, 0.6704795, -0.4108734, 1, 0, 0.772549, 1,
1.149, -0.2406479, 1.604238, 1, 0, 0.7686275, 1,
1.153293, -1.303701, 2.713942, 1, 0, 0.7607843, 1,
1.153768, -0.8094674, 1.928893, 1, 0, 0.7568628, 1,
1.15964, 0.05878308, 1.581327, 1, 0, 0.7490196, 1,
1.161012, -0.2256831, 1.903614, 1, 0, 0.7450981, 1,
1.167861, -0.3176717, 3.040037, 1, 0, 0.7372549, 1,
1.17044, -1.498289, 1.832237, 1, 0, 0.7333333, 1,
1.171295, -2.255099, 1.954064, 1, 0, 0.7254902, 1,
1.171945, -0.5066857, 2.67222, 1, 0, 0.7215686, 1,
1.176024, 0.4899781, 1.521124, 1, 0, 0.7137255, 1,
1.178555, -0.6625912, 2.074066, 1, 0, 0.7098039, 1,
1.178809, 1.693795, -0.09301401, 1, 0, 0.7019608, 1,
1.182633, -1.036655, 3.088042, 1, 0, 0.6941177, 1,
1.184514, -0.4597864, 0.3357968, 1, 0, 0.6901961, 1,
1.186465, 0.7281923, 1.363719, 1, 0, 0.682353, 1,
1.188121, -0.572651, 2.772728, 1, 0, 0.6784314, 1,
1.193143, 0.7810036, 0.6025749, 1, 0, 0.6705883, 1,
1.206322, -0.4850776, 0.7646669, 1, 0, 0.6666667, 1,
1.217091, -0.07589045, 3.110063, 1, 0, 0.6588235, 1,
1.23205, -0.5138903, 2.704437, 1, 0, 0.654902, 1,
1.247774, -0.04026096, 0.7311818, 1, 0, 0.6470588, 1,
1.248737, -0.1285425, 1.989465, 1, 0, 0.6431373, 1,
1.249892, 0.509277, 1.608352, 1, 0, 0.6352941, 1,
1.251392, -1.114641, 0.7359611, 1, 0, 0.6313726, 1,
1.252852, -0.06289364, 1.281577, 1, 0, 0.6235294, 1,
1.253433, 0.9262591, -0.2962386, 1, 0, 0.6196079, 1,
1.268291, -0.4492453, 2.883521, 1, 0, 0.6117647, 1,
1.282385, 0.4512315, -0.3627101, 1, 0, 0.6078432, 1,
1.290596, 0.6108012, 1.559739, 1, 0, 0.6, 1,
1.293296, 0.6485575, 1.070044, 1, 0, 0.5921569, 1,
1.299911, 0.1672219, 1.775506, 1, 0, 0.5882353, 1,
1.303057, 1.159489, 0.1715866, 1, 0, 0.5803922, 1,
1.312585, 0.07585156, 1.916276, 1, 0, 0.5764706, 1,
1.321071, -1.069445, 1.652021, 1, 0, 0.5686275, 1,
1.323064, 0.5016606, 1.323317, 1, 0, 0.5647059, 1,
1.333058, -0.3213267, 0.2684067, 1, 0, 0.5568628, 1,
1.336577, -1.449209, 0.704988, 1, 0, 0.5529412, 1,
1.345512, -0.08605569, 3.465168, 1, 0, 0.5450981, 1,
1.372614, 0.7149047, -0.1597399, 1, 0, 0.5411765, 1,
1.396819, 1.227031, 1.505188, 1, 0, 0.5333334, 1,
1.397241, -0.03463653, 2.101721, 1, 0, 0.5294118, 1,
1.400342, 2.243949, 0.4935271, 1, 0, 0.5215687, 1,
1.403049, -1.099826, 2.681167, 1, 0, 0.5176471, 1,
1.408569, -0.06599746, 1.169327, 1, 0, 0.509804, 1,
1.409184, 0.8790957, 2.732438, 1, 0, 0.5058824, 1,
1.411257, 0.7492465, 2.528089, 1, 0, 0.4980392, 1,
1.417422, 0.05991934, -0.05888506, 1, 0, 0.4901961, 1,
1.420005, 1.026733, 2.154754, 1, 0, 0.4862745, 1,
1.424688, -1.128396, 3.16536, 1, 0, 0.4784314, 1,
1.425667, 0.2664588, 1.509442, 1, 0, 0.4745098, 1,
1.428582, 0.495198, 1.590815, 1, 0, 0.4666667, 1,
1.433492, 0.01606364, 3.002412, 1, 0, 0.4627451, 1,
1.433733, -0.1599911, 0.2782214, 1, 0, 0.454902, 1,
1.440883, 0.6378341, 0.8181055, 1, 0, 0.4509804, 1,
1.441287, -0.940374, 1.791543, 1, 0, 0.4431373, 1,
1.456603, 0.3569548, 1.158522, 1, 0, 0.4392157, 1,
1.4612, 0.7560973, 2.979261, 1, 0, 0.4313726, 1,
1.474747, -0.9598141, 1.776192, 1, 0, 0.427451, 1,
1.475455, -0.5333709, 3.115029, 1, 0, 0.4196078, 1,
1.476706, -1.020684, 4.952629, 1, 0, 0.4156863, 1,
1.477376, 1.128764, 2.167011, 1, 0, 0.4078431, 1,
1.488877, 0.186322, 1.53572, 1, 0, 0.4039216, 1,
1.488996, -1.566747, 4.057, 1, 0, 0.3960784, 1,
1.48972, 1.305723, -0.3050673, 1, 0, 0.3882353, 1,
1.490372, -0.4041154, 1.779473, 1, 0, 0.3843137, 1,
1.496146, -0.2252212, 0.7700039, 1, 0, 0.3764706, 1,
1.505211, -0.4145016, 3.121486, 1, 0, 0.372549, 1,
1.510831, 2.599066, 1.497012, 1, 0, 0.3647059, 1,
1.536903, -1.298102, -1.216423, 1, 0, 0.3607843, 1,
1.542608, 0.7083546, 0.4872045, 1, 0, 0.3529412, 1,
1.542778, 0.1739347, -0.2447547, 1, 0, 0.3490196, 1,
1.54944, 1.218084, -0.08310641, 1, 0, 0.3411765, 1,
1.552521, 0.9185923, 2.18858, 1, 0, 0.3372549, 1,
1.552841, -0.6329399, 2.875872, 1, 0, 0.3294118, 1,
1.567911, 0.4822755, 2.811057, 1, 0, 0.3254902, 1,
1.57404, 0.02599131, 0.1608083, 1, 0, 0.3176471, 1,
1.586197, -0.7309158, 3.258172, 1, 0, 0.3137255, 1,
1.594201, -0.2808484, 2.505232, 1, 0, 0.3058824, 1,
1.598382, -0.4459614, 0.450789, 1, 0, 0.2980392, 1,
1.605583, -0.9526778, 2.620755, 1, 0, 0.2941177, 1,
1.648503, 2.450818, 0.6375958, 1, 0, 0.2862745, 1,
1.666161, 0.1634709, 1.361745, 1, 0, 0.282353, 1,
1.675405, 0.6358439, 0.4875771, 1, 0, 0.2745098, 1,
1.719699, 1.104666, 2.077503, 1, 0, 0.2705882, 1,
1.727775, 0.1721573, 2.372132, 1, 0, 0.2627451, 1,
1.734812, -2.454739, 1.575964, 1, 0, 0.2588235, 1,
1.737014, 1.423874, -0.3068993, 1, 0, 0.2509804, 1,
1.758612, -0.09531281, 3.517735, 1, 0, 0.2470588, 1,
1.775894, 0.1764131, 2.255191, 1, 0, 0.2392157, 1,
1.778045, 1.617652, 2.505494, 1, 0, 0.2352941, 1,
1.778293, 1.835084, 1.095456, 1, 0, 0.227451, 1,
1.782802, -1.697614, 3.160614, 1, 0, 0.2235294, 1,
1.822346, -0.754833, 0.8672829, 1, 0, 0.2156863, 1,
1.847105, 1.05379, 1.240489, 1, 0, 0.2117647, 1,
1.857176, -1.144868, 0.4883013, 1, 0, 0.2039216, 1,
1.85814, 0.1024876, 1.614347, 1, 0, 0.1960784, 1,
1.869856, -1.207739, 0.5809938, 1, 0, 0.1921569, 1,
1.882976, -0.3841154, 1.717338, 1, 0, 0.1843137, 1,
1.890434, 1.418951, 2.388645, 1, 0, 0.1803922, 1,
1.902401, -0.7127622, 1.771247, 1, 0, 0.172549, 1,
1.947852, -0.5484181, 1.152777, 1, 0, 0.1686275, 1,
1.949024, 0.9304547, -0.6314875, 1, 0, 0.1607843, 1,
1.959592, -0.4065846, 1.389265, 1, 0, 0.1568628, 1,
1.974653, -0.9529858, 3.082684, 1, 0, 0.1490196, 1,
1.994715, 0.3158334, 3.228409, 1, 0, 0.145098, 1,
2.007529, -1.430938, 2.156558, 1, 0, 0.1372549, 1,
2.064184, 0.7061805, -0.3461856, 1, 0, 0.1333333, 1,
2.091664, 0.6125863, 1.08724, 1, 0, 0.1254902, 1,
2.105172, -0.1443559, 2.61402, 1, 0, 0.1215686, 1,
2.116425, 0.5613452, 1.175642, 1, 0, 0.1137255, 1,
2.129272, -0.8212683, 2.570356, 1, 0, 0.1098039, 1,
2.15243, 0.6441023, 1.274119, 1, 0, 0.1019608, 1,
2.165735, -0.9284937, 1.810042, 1, 0, 0.09411765, 1,
2.173082, -0.04843411, 2.177241, 1, 0, 0.09019608, 1,
2.226938, -0.4359901, 1.685189, 1, 0, 0.08235294, 1,
2.241532, -0.2292198, 2.277674, 1, 0, 0.07843138, 1,
2.255694, 0.6153457, 3.059447, 1, 0, 0.07058824, 1,
2.279455, -2.337829, 1.946542, 1, 0, 0.06666667, 1,
2.285509, -1.928407, 3.275537, 1, 0, 0.05882353, 1,
2.302131, 1.192851, -0.6851716, 1, 0, 0.05490196, 1,
2.329496, 2.272658, 1.07753, 1, 0, 0.04705882, 1,
2.333705, -0.329125, 2.104642, 1, 0, 0.04313726, 1,
2.391904, -0.1724702, 2.365686, 1, 0, 0.03529412, 1,
2.421834, -0.9489679, 1.397587, 1, 0, 0.03137255, 1,
2.599087, 0.5037261, 1.873297, 1, 0, 0.02352941, 1,
2.645321, 1.563896, 1.796528, 1, 0, 0.01960784, 1,
3.291746, 1.524178, 1.675158, 1, 0, 0.01176471, 1,
3.478535, -0.8373088, 0.5454391, 1, 0, 0.007843138, 1
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
0.1165552, -4.094105, -7.283716, 0, -0.5, 0.5, 0.5,
0.1165552, -4.094105, -7.283716, 1, -0.5, 0.5, 0.5,
0.1165552, -4.094105, -7.283716, 1, 1.5, 0.5, 0.5,
0.1165552, -4.094105, -7.283716, 0, 1.5, 0.5, 0.5
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
-4.385136, -0.003568649, -7.283716, 0, -0.5, 0.5, 0.5,
-4.385136, -0.003568649, -7.283716, 1, -0.5, 0.5, 0.5,
-4.385136, -0.003568649, -7.283716, 1, 1.5, 0.5, 0.5,
-4.385136, -0.003568649, -7.283716, 0, 1.5, 0.5, 0.5
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
-4.385136, -4.094105, 0.3642774, 0, -0.5, 0.5, 0.5,
-4.385136, -4.094105, 0.3642774, 1, -0.5, 0.5, 0.5,
-4.385136, -4.094105, 0.3642774, 1, 1.5, 0.5, 0.5,
-4.385136, -4.094105, 0.3642774, 0, 1.5, 0.5, 0.5
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
-3, -3.150135, -5.518794,
3, -3.150135, -5.518794,
-3, -3.150135, -5.518794,
-3, -3.307464, -5.812948,
-2, -3.150135, -5.518794,
-2, -3.307464, -5.812948,
-1, -3.150135, -5.518794,
-1, -3.307464, -5.812948,
0, -3.150135, -5.518794,
0, -3.307464, -5.812948,
1, -3.150135, -5.518794,
1, -3.307464, -5.812948,
2, -3.150135, -5.518794,
2, -3.307464, -5.812948,
3, -3.150135, -5.518794,
3, -3.307464, -5.812948
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
-3, -3.62212, -6.401255, 0, -0.5, 0.5, 0.5,
-3, -3.62212, -6.401255, 1, -0.5, 0.5, 0.5,
-3, -3.62212, -6.401255, 1, 1.5, 0.5, 0.5,
-3, -3.62212, -6.401255, 0, 1.5, 0.5, 0.5,
-2, -3.62212, -6.401255, 0, -0.5, 0.5, 0.5,
-2, -3.62212, -6.401255, 1, -0.5, 0.5, 0.5,
-2, -3.62212, -6.401255, 1, 1.5, 0.5, 0.5,
-2, -3.62212, -6.401255, 0, 1.5, 0.5, 0.5,
-1, -3.62212, -6.401255, 0, -0.5, 0.5, 0.5,
-1, -3.62212, -6.401255, 1, -0.5, 0.5, 0.5,
-1, -3.62212, -6.401255, 1, 1.5, 0.5, 0.5,
-1, -3.62212, -6.401255, 0, 1.5, 0.5, 0.5,
0, -3.62212, -6.401255, 0, -0.5, 0.5, 0.5,
0, -3.62212, -6.401255, 1, -0.5, 0.5, 0.5,
0, -3.62212, -6.401255, 1, 1.5, 0.5, 0.5,
0, -3.62212, -6.401255, 0, 1.5, 0.5, 0.5,
1, -3.62212, -6.401255, 0, -0.5, 0.5, 0.5,
1, -3.62212, -6.401255, 1, -0.5, 0.5, 0.5,
1, -3.62212, -6.401255, 1, 1.5, 0.5, 0.5,
1, -3.62212, -6.401255, 0, 1.5, 0.5, 0.5,
2, -3.62212, -6.401255, 0, -0.5, 0.5, 0.5,
2, -3.62212, -6.401255, 1, -0.5, 0.5, 0.5,
2, -3.62212, -6.401255, 1, 1.5, 0.5, 0.5,
2, -3.62212, -6.401255, 0, 1.5, 0.5, 0.5,
3, -3.62212, -6.401255, 0, -0.5, 0.5, 0.5,
3, -3.62212, -6.401255, 1, -0.5, 0.5, 0.5,
3, -3.62212, -6.401255, 1, 1.5, 0.5, 0.5,
3, -3.62212, -6.401255, 0, 1.5, 0.5, 0.5
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
-3.346284, -3, -5.518794,
-3.346284, 3, -5.518794,
-3.346284, -3, -5.518794,
-3.519426, -3, -5.812948,
-3.346284, -2, -5.518794,
-3.519426, -2, -5.812948,
-3.346284, -1, -5.518794,
-3.519426, -1, -5.812948,
-3.346284, 0, -5.518794,
-3.519426, 0, -5.812948,
-3.346284, 1, -5.518794,
-3.519426, 1, -5.812948,
-3.346284, 2, -5.518794,
-3.519426, 2, -5.812948,
-3.346284, 3, -5.518794,
-3.519426, 3, -5.812948
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
-3.86571, -3, -6.401255, 0, -0.5, 0.5, 0.5,
-3.86571, -3, -6.401255, 1, -0.5, 0.5, 0.5,
-3.86571, -3, -6.401255, 1, 1.5, 0.5, 0.5,
-3.86571, -3, -6.401255, 0, 1.5, 0.5, 0.5,
-3.86571, -2, -6.401255, 0, -0.5, 0.5, 0.5,
-3.86571, -2, -6.401255, 1, -0.5, 0.5, 0.5,
-3.86571, -2, -6.401255, 1, 1.5, 0.5, 0.5,
-3.86571, -2, -6.401255, 0, 1.5, 0.5, 0.5,
-3.86571, -1, -6.401255, 0, -0.5, 0.5, 0.5,
-3.86571, -1, -6.401255, 1, -0.5, 0.5, 0.5,
-3.86571, -1, -6.401255, 1, 1.5, 0.5, 0.5,
-3.86571, -1, -6.401255, 0, 1.5, 0.5, 0.5,
-3.86571, 0, -6.401255, 0, -0.5, 0.5, 0.5,
-3.86571, 0, -6.401255, 1, -0.5, 0.5, 0.5,
-3.86571, 0, -6.401255, 1, 1.5, 0.5, 0.5,
-3.86571, 0, -6.401255, 0, 1.5, 0.5, 0.5,
-3.86571, 1, -6.401255, 0, -0.5, 0.5, 0.5,
-3.86571, 1, -6.401255, 1, -0.5, 0.5, 0.5,
-3.86571, 1, -6.401255, 1, 1.5, 0.5, 0.5,
-3.86571, 1, -6.401255, 0, 1.5, 0.5, 0.5,
-3.86571, 2, -6.401255, 0, -0.5, 0.5, 0.5,
-3.86571, 2, -6.401255, 1, -0.5, 0.5, 0.5,
-3.86571, 2, -6.401255, 1, 1.5, 0.5, 0.5,
-3.86571, 2, -6.401255, 0, 1.5, 0.5, 0.5,
-3.86571, 3, -6.401255, 0, -0.5, 0.5, 0.5,
-3.86571, 3, -6.401255, 1, -0.5, 0.5, 0.5,
-3.86571, 3, -6.401255, 1, 1.5, 0.5, 0.5,
-3.86571, 3, -6.401255, 0, 1.5, 0.5, 0.5
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
-3.346284, -3.150135, -4,
-3.346284, -3.150135, 6,
-3.346284, -3.150135, -4,
-3.519426, -3.307464, -4,
-3.346284, -3.150135, -2,
-3.519426, -3.307464, -2,
-3.346284, -3.150135, 0,
-3.519426, -3.307464, 0,
-3.346284, -3.150135, 2,
-3.519426, -3.307464, 2,
-3.346284, -3.150135, 4,
-3.519426, -3.307464, 4,
-3.346284, -3.150135, 6,
-3.519426, -3.307464, 6
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
-3.86571, -3.62212, -4, 0, -0.5, 0.5, 0.5,
-3.86571, -3.62212, -4, 1, -0.5, 0.5, 0.5,
-3.86571, -3.62212, -4, 1, 1.5, 0.5, 0.5,
-3.86571, -3.62212, -4, 0, 1.5, 0.5, 0.5,
-3.86571, -3.62212, -2, 0, -0.5, 0.5, 0.5,
-3.86571, -3.62212, -2, 1, -0.5, 0.5, 0.5,
-3.86571, -3.62212, -2, 1, 1.5, 0.5, 0.5,
-3.86571, -3.62212, -2, 0, 1.5, 0.5, 0.5,
-3.86571, -3.62212, 0, 0, -0.5, 0.5, 0.5,
-3.86571, -3.62212, 0, 1, -0.5, 0.5, 0.5,
-3.86571, -3.62212, 0, 1, 1.5, 0.5, 0.5,
-3.86571, -3.62212, 0, 0, 1.5, 0.5, 0.5,
-3.86571, -3.62212, 2, 0, -0.5, 0.5, 0.5,
-3.86571, -3.62212, 2, 1, -0.5, 0.5, 0.5,
-3.86571, -3.62212, 2, 1, 1.5, 0.5, 0.5,
-3.86571, -3.62212, 2, 0, 1.5, 0.5, 0.5,
-3.86571, -3.62212, 4, 0, -0.5, 0.5, 0.5,
-3.86571, -3.62212, 4, 1, -0.5, 0.5, 0.5,
-3.86571, -3.62212, 4, 1, 1.5, 0.5, 0.5,
-3.86571, -3.62212, 4, 0, 1.5, 0.5, 0.5,
-3.86571, -3.62212, 6, 0, -0.5, 0.5, 0.5,
-3.86571, -3.62212, 6, 1, -0.5, 0.5, 0.5,
-3.86571, -3.62212, 6, 1, 1.5, 0.5, 0.5,
-3.86571, -3.62212, 6, 0, 1.5, 0.5, 0.5
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
-3.346284, -3.150135, -5.518794,
-3.346284, 3.142998, -5.518794,
-3.346284, -3.150135, 6.247349,
-3.346284, 3.142998, 6.247349,
-3.346284, -3.150135, -5.518794,
-3.346284, -3.150135, 6.247349,
-3.346284, 3.142998, -5.518794,
-3.346284, 3.142998, 6.247349,
-3.346284, -3.150135, -5.518794,
3.579394, -3.150135, -5.518794,
-3.346284, -3.150135, 6.247349,
3.579394, -3.150135, 6.247349,
-3.346284, 3.142998, -5.518794,
3.579394, 3.142998, -5.518794,
-3.346284, 3.142998, 6.247349,
3.579394, 3.142998, 6.247349,
3.579394, -3.150135, -5.518794,
3.579394, 3.142998, -5.518794,
3.579394, -3.150135, 6.247349,
3.579394, 3.142998, 6.247349,
3.579394, -3.150135, -5.518794,
3.579394, -3.150135, 6.247349,
3.579394, 3.142998, -5.518794,
3.579394, 3.142998, 6.247349
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
var radius = 8.027678;
var distance = 35.71605;
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
mvMatrix.translate( -0.1165552, 0.003568649, -0.3642774 );
mvMatrix.scale( 1.253261, 1.379231, 0.7376829 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.71605);
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
mitomycin_C<-read.table("mitomycin_C.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-mitomycin_C$V2
```

```
## Error in eval(expr, envir, enclos): object 'mitomycin_C' not found
```

```r
y<-mitomycin_C$V3
```

```
## Error in eval(expr, envir, enclos): object 'mitomycin_C' not found
```

```r
z<-mitomycin_C$V4
```

```
## Error in eval(expr, envir, enclos): object 'mitomycin_C' not found
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
-3.245425, -0.6564239, -2.069435, 0, 0, 1, 1, 1,
-2.908612, 0.6793286, 0.005203729, 1, 0, 0, 1, 1,
-2.514329, 0.6680391, -0.07242171, 1, 0, 0, 1, 1,
-2.43411, 0.4951772, 0.4897006, 1, 0, 0, 1, 1,
-2.430107, 0.8467832, 0.9079477, 1, 0, 0, 1, 1,
-2.399273, -0.1302757, -1.321556, 1, 0, 0, 1, 1,
-2.29075, -0.659659, -2.959656, 0, 0, 0, 1, 1,
-2.287382, -2.045383, -2.859529, 0, 0, 0, 1, 1,
-2.27598, -1.064434, -1.396744, 0, 0, 0, 1, 1,
-2.274808, 1.487018, -2.320333, 0, 0, 0, 1, 1,
-2.265299, 1.26754, -0.5945567, 0, 0, 0, 1, 1,
-2.234463, -0.8577237, -0.3280296, 0, 0, 0, 1, 1,
-2.168422, -0.1006253, -2.229231, 0, 0, 0, 1, 1,
-2.162663, 0.5683522, -0.3351134, 1, 1, 1, 1, 1,
-2.149816, -2.827873, -2.157604, 1, 1, 1, 1, 1,
-2.093075, -1.50631, -1.889239, 1, 1, 1, 1, 1,
-2.078418, 0.9650047, -3.553828, 1, 1, 1, 1, 1,
-2.057976, 0.2662753, -0.3081921, 1, 1, 1, 1, 1,
-2.0532, 0.2356813, -0.6304962, 1, 1, 1, 1, 1,
-2.017967, 0.6959864, -1.71429, 1, 1, 1, 1, 1,
-1.991692, 0.7983631, -1.635438, 1, 1, 1, 1, 1,
-1.989297, 0.1260614, -2.343342, 1, 1, 1, 1, 1,
-1.973148, 0.7124884, -0.9556795, 1, 1, 1, 1, 1,
-1.9476, 1.392418, -1.901282, 1, 1, 1, 1, 1,
-1.940395, -2.000508, -2.110184, 1, 1, 1, 1, 1,
-1.926235, 0.9284838, -3.751017, 1, 1, 1, 1, 1,
-1.914176, 0.1282527, -1.341181, 1, 1, 1, 1, 1,
-1.907156, -1.10368, -2.159347, 1, 1, 1, 1, 1,
-1.880493, -0.1441728, 0.3546715, 0, 0, 1, 1, 1,
-1.867951, -1.982106, -1.115222, 1, 0, 0, 1, 1,
-1.843322, -0.3168714, -2.959102, 1, 0, 0, 1, 1,
-1.82471, 0.3312632, -1.051327, 1, 0, 0, 1, 1,
-1.811603, -1.62082, -2.42826, 1, 0, 0, 1, 1,
-1.776307, -0.3401861, -2.457967, 1, 0, 0, 1, 1,
-1.77495, -0.8127086, -1.558648, 0, 0, 0, 1, 1,
-1.773711, 0.1593332, -1.410727, 0, 0, 0, 1, 1,
-1.750705, 0.4873033, -2.917805, 0, 0, 0, 1, 1,
-1.750164, 0.5255386, -0.2605996, 0, 0, 0, 1, 1,
-1.713748, -0.2619089, -2.102694, 0, 0, 0, 1, 1,
-1.70755, 0.1098898, -1.739669, 0, 0, 0, 1, 1,
-1.706682, 0.694474, 0.6560086, 0, 0, 0, 1, 1,
-1.690543, 0.1164857, -1.040053, 1, 1, 1, 1, 1,
-1.649135, -1.521159, -1.972881, 1, 1, 1, 1, 1,
-1.641226, 0.03228244, -2.395998, 1, 1, 1, 1, 1,
-1.639696, -1.254114, -2.912021, 1, 1, 1, 1, 1,
-1.631113, 0.451661, -2.068366, 1, 1, 1, 1, 1,
-1.62625, 0.2260184, -0.7728335, 1, 1, 1, 1, 1,
-1.622839, -0.9261679, -1.89487, 1, 1, 1, 1, 1,
-1.617012, 0.8691721, -1.10723, 1, 1, 1, 1, 1,
-1.617007, -0.5535291, -2.4823, 1, 1, 1, 1, 1,
-1.615672, -1.247205, -4.27046, 1, 1, 1, 1, 1,
-1.613363, -0.002928254, 0.7552587, 1, 1, 1, 1, 1,
-1.611384, 0.8443707, -1.721491, 1, 1, 1, 1, 1,
-1.598362, -1.140126, -1.222307, 1, 1, 1, 1, 1,
-1.56946, 0.8080398, -0.9044169, 1, 1, 1, 1, 1,
-1.553025, 1.329456, 0.2933296, 1, 1, 1, 1, 1,
-1.548922, -0.7789709, -2.672063, 0, 0, 1, 1, 1,
-1.537253, -0.7549386, -3.608782, 1, 0, 0, 1, 1,
-1.535046, -0.2318694, -2.529389, 1, 0, 0, 1, 1,
-1.515938, -1.224475, -2.140316, 1, 0, 0, 1, 1,
-1.507319, -0.9433577, -2.789266, 1, 0, 0, 1, 1,
-1.505388, -1.632563, -3.348649, 1, 0, 0, 1, 1,
-1.50189, 0.630223, -0.05343966, 0, 0, 0, 1, 1,
-1.498366, 0.7913772, -1.579637, 0, 0, 0, 1, 1,
-1.48605, 0.1433094, -0.01076867, 0, 0, 0, 1, 1,
-1.480361, -0.5559098, -3.110683, 0, 0, 0, 1, 1,
-1.470542, 0.3351274, -1.549764, 0, 0, 0, 1, 1,
-1.469815, 0.6076004, -0.5383527, 0, 0, 0, 1, 1,
-1.464083, -0.106665, -3.115274, 0, 0, 0, 1, 1,
-1.459301, 1.228175, -0.779349, 1, 1, 1, 1, 1,
-1.458478, -0.1625726, -0.750246, 1, 1, 1, 1, 1,
-1.455437, -0.1670214, 0.2879197, 1, 1, 1, 1, 1,
-1.442621, 1.256941, -0.7258453, 1, 1, 1, 1, 1,
-1.441312, -1.003276, -1.613966, 1, 1, 1, 1, 1,
-1.432072, 0.6585359, -0.9666859, 1, 1, 1, 1, 1,
-1.415407, 0.2924607, -1.849026, 1, 1, 1, 1, 1,
-1.411309, -0.04080085, -1.014713, 1, 1, 1, 1, 1,
-1.410478, -0.9309208, -1.648852, 1, 1, 1, 1, 1,
-1.401602, 0.7102102, -0.01491867, 1, 1, 1, 1, 1,
-1.39905, 0.04543673, -4.54839, 1, 1, 1, 1, 1,
-1.392267, -0.08005227, -1.11017, 1, 1, 1, 1, 1,
-1.387692, -1.001396, -1.828144, 1, 1, 1, 1, 1,
-1.38415, 1.076582, -0.6669756, 1, 1, 1, 1, 1,
-1.375772, 0.8605962, -0.2368373, 1, 1, 1, 1, 1,
-1.368275, -1.318446, -3.24144, 0, 0, 1, 1, 1,
-1.365092, 2.28353, 0.4442516, 1, 0, 0, 1, 1,
-1.35569, 2.716864, -1.866106, 1, 0, 0, 1, 1,
-1.34656, -0.4972025, -3.614854, 1, 0, 0, 1, 1,
-1.346017, 0.5923178, -0.6107178, 1, 0, 0, 1, 1,
-1.345848, -0.9134532, -2.549561, 1, 0, 0, 1, 1,
-1.344531, -1.076393, -4.767721, 0, 0, 0, 1, 1,
-1.339614, -0.7209167, -0.8396401, 0, 0, 0, 1, 1,
-1.337381, -0.4957705, -1.617714, 0, 0, 0, 1, 1,
-1.336944, 0.8971374, -0.3602321, 0, 0, 0, 1, 1,
-1.33039, 0.3060766, -1.163841, 0, 0, 0, 1, 1,
-1.321966, -0.06322345, -1.960423, 0, 0, 0, 1, 1,
-1.317627, 0.5440826, -1.034918, 0, 0, 0, 1, 1,
-1.311642, 0.9360064, -0.8511122, 1, 1, 1, 1, 1,
-1.308315, -0.1318304, -1.195406, 1, 1, 1, 1, 1,
-1.292331, 0.01482014, -1.199098, 1, 1, 1, 1, 1,
-1.290623, 0.6324467, -2.648071, 1, 1, 1, 1, 1,
-1.290168, 1.385601, -1.019071, 1, 1, 1, 1, 1,
-1.280867, -0.3656088, -2.104655, 1, 1, 1, 1, 1,
-1.276806, -0.8467032, -1.056548, 1, 1, 1, 1, 1,
-1.27379, -1.045455, -2.187779, 1, 1, 1, 1, 1,
-1.267186, 1.578341, -0.2262843, 1, 1, 1, 1, 1,
-1.265112, 0.4596785, -1.880865, 1, 1, 1, 1, 1,
-1.264778, 0.9198694, -2.014557, 1, 1, 1, 1, 1,
-1.257379, -0.7467651, -2.144672, 1, 1, 1, 1, 1,
-1.254466, -0.1560527, -0.8163581, 1, 1, 1, 1, 1,
-1.249099, 0.4488023, -1.755178, 1, 1, 1, 1, 1,
-1.244181, -2.089898, -2.807879, 1, 1, 1, 1, 1,
-1.229149, 0.4085224, -2.51408, 0, 0, 1, 1, 1,
-1.197567, 2.095653, 0.5293453, 1, 0, 0, 1, 1,
-1.188732, -1.26376, -1.329482, 1, 0, 0, 1, 1,
-1.188455, 0.2834118, -1.376529, 1, 0, 0, 1, 1,
-1.181828, 2.382451, -0.1473163, 1, 0, 0, 1, 1,
-1.170392, 0.9475885, -0.8945867, 1, 0, 0, 1, 1,
-1.148718, -0.3179826, -0.3699817, 0, 0, 0, 1, 1,
-1.146372, -0.5548898, -2.217747, 0, 0, 0, 1, 1,
-1.137743, -0.6372428, -1.402723, 0, 0, 0, 1, 1,
-1.133309, -0.2038627, -2.790505, 0, 0, 0, 1, 1,
-1.128278, 0.357349, -1.279985, 0, 0, 0, 1, 1,
-1.12513, -0.4500058, -3.043247, 0, 0, 0, 1, 1,
-1.124392, 0.1677295, -1.215105, 0, 0, 0, 1, 1,
-1.114538, -0.4321275, -2.268068, 1, 1, 1, 1, 1,
-1.103511, -0.1871079, -0.7122706, 1, 1, 1, 1, 1,
-1.092645, 0.7956554, 0.1050846, 1, 1, 1, 1, 1,
-1.086697, -1.175785, -3.481978, 1, 1, 1, 1, 1,
-1.083385, 0.9322709, -0.08110512, 1, 1, 1, 1, 1,
-1.072919, -0.3382539, -0.8962508, 1, 1, 1, 1, 1,
-1.070075, -0.7227883, -3.51132, 1, 1, 1, 1, 1,
-1.066197, 1.198834, -0.2913115, 1, 1, 1, 1, 1,
-1.061024, -1.379573, -0.327489, 1, 1, 1, 1, 1,
-1.058906, -3.058488, -3.309856, 1, 1, 1, 1, 1,
-1.058535, 0.7868946, -2.29151, 1, 1, 1, 1, 1,
-1.053841, 0.5005174, -1.290269, 1, 1, 1, 1, 1,
-1.047679, -1.052296, -2.741203, 1, 1, 1, 1, 1,
-1.044095, 0.09707165, -1.180321, 1, 1, 1, 1, 1,
-1.039375, -0.5307456, -2.204726, 1, 1, 1, 1, 1,
-1.03913, -0.5258944, -4.742919, 0, 0, 1, 1, 1,
-1.03828, -0.6816744, -0.3030853, 1, 0, 0, 1, 1,
-1.03634, 1.131967, -0.5768611, 1, 0, 0, 1, 1,
-1.030308, 0.1792499, -1.675858, 1, 0, 0, 1, 1,
-1.02883, -0.5945668, -0.1407058, 1, 0, 0, 1, 1,
-1.02854, -0.6900277, -3.166266, 1, 0, 0, 1, 1,
-1.011511, -0.9016804, -1.707531, 0, 0, 0, 1, 1,
-1.007949, -1.03734, -2.643116, 0, 0, 0, 1, 1,
-1.006641, 1.339964, -0.6570143, 0, 0, 0, 1, 1,
-1.00451, 0.545188, -2.012906, 0, 0, 0, 1, 1,
-1.002597, -1.089732, -2.311403, 0, 0, 0, 1, 1,
-1.001824, 0.298723, -2.670158, 0, 0, 0, 1, 1,
-1.000838, 0.3408513, -0.2023621, 0, 0, 0, 1, 1,
-0.9943942, 0.5644202, -1.653131, 1, 1, 1, 1, 1,
-0.9891703, 0.1459355, -2.439438, 1, 1, 1, 1, 1,
-0.9871551, -1.655232, -3.872365, 1, 1, 1, 1, 1,
-0.9850427, -2.596556, -3.429317, 1, 1, 1, 1, 1,
-0.9837359, 2.421489, -1.363438, 1, 1, 1, 1, 1,
-0.9812557, -0.5846196, -2.552811, 1, 1, 1, 1, 1,
-0.97358, -0.677956, -1.404501, 1, 1, 1, 1, 1,
-0.9654171, -1.752124, -3.296003, 1, 1, 1, 1, 1,
-0.9652351, 0.08492362, -2.562792, 1, 1, 1, 1, 1,
-0.9633679, 0.05048512, -2.918743, 1, 1, 1, 1, 1,
-0.9595153, -0.6409847, -0.8107687, 1, 1, 1, 1, 1,
-0.9571714, -0.4839729, -3.403466, 1, 1, 1, 1, 1,
-0.9553043, -2.320778, -2.000447, 1, 1, 1, 1, 1,
-0.9534944, 0.3336816, -0.8299212, 1, 1, 1, 1, 1,
-0.9493701, -0.7011073, -1.952816, 1, 1, 1, 1, 1,
-0.9443834, -2.274582, -1.809421, 0, 0, 1, 1, 1,
-0.9420562, -1.278351, -3.189289, 1, 0, 0, 1, 1,
-0.9409047, 1.110532, -0.9258646, 1, 0, 0, 1, 1,
-0.9331568, -0.1996615, -2.673273, 1, 0, 0, 1, 1,
-0.9318328, -1.313026, -2.698906, 1, 0, 0, 1, 1,
-0.929127, -0.5457233, -2.846591, 1, 0, 0, 1, 1,
-0.9228291, -0.5314306, -1.99872, 0, 0, 0, 1, 1,
-0.9093153, -2.060713, -2.357718, 0, 0, 0, 1, 1,
-0.9061612, 2.297481, 0.6083532, 0, 0, 0, 1, 1,
-0.9047713, 0.7664821, -1.323101, 0, 0, 0, 1, 1,
-0.9044324, 0.6328344, -1.484767, 0, 0, 0, 1, 1,
-0.9015358, 0.6836544, -1.403623, 0, 0, 0, 1, 1,
-0.8991098, -0.5330357, -3.794713, 0, 0, 0, 1, 1,
-0.898486, -0.6357198, -3.078584, 1, 1, 1, 1, 1,
-0.8945776, 0.7385481, -0.7404213, 1, 1, 1, 1, 1,
-0.8921183, -1.137977, -4.222823, 1, 1, 1, 1, 1,
-0.8918674, 1.258994, -2.072012, 1, 1, 1, 1, 1,
-0.889619, -2.119087, -3.30215, 1, 1, 1, 1, 1,
-0.8890086, 0.2829136, -2.373632, 1, 1, 1, 1, 1,
-0.8852005, -0.9377277, -0.5800577, 1, 1, 1, 1, 1,
-0.8845533, 1.75958, -0.8122945, 1, 1, 1, 1, 1,
-0.8826751, -0.1560971, -1.626549, 1, 1, 1, 1, 1,
-0.8790368, 0.08405355, -1.801532, 1, 1, 1, 1, 1,
-0.8755143, -0.3798015, -2.132587, 1, 1, 1, 1, 1,
-0.8672896, 0.8683347, -1.604048, 1, 1, 1, 1, 1,
-0.8630268, -0.6931856, -1.809184, 1, 1, 1, 1, 1,
-0.8550485, 0.9483545, 1.144441, 1, 1, 1, 1, 1,
-0.8536249, 0.8062479, -0.08727252, 1, 1, 1, 1, 1,
-0.8387311, 1.25304, -2.461135, 0, 0, 1, 1, 1,
-0.8312036, 0.2288002, -3.398224, 1, 0, 0, 1, 1,
-0.8305528, -0.9790345, -2.610909, 1, 0, 0, 1, 1,
-0.8294342, -0.6645496, -3.499962, 1, 0, 0, 1, 1,
-0.8265792, 0.7334259, -1.685518, 1, 0, 0, 1, 1,
-0.8256221, 0.8234814, -0.395204, 1, 0, 0, 1, 1,
-0.8227901, -1.091527, -3.050233, 0, 0, 0, 1, 1,
-0.8216484, 0.9800654, 0.128634, 0, 0, 0, 1, 1,
-0.819176, 0.4855477, -0.8759743, 0, 0, 0, 1, 1,
-0.8129035, -1.136385, -3.891533, 0, 0, 0, 1, 1,
-0.8082674, 1.805148, 0.9437166, 0, 0, 0, 1, 1,
-0.8034132, -1.474655, -5.297472, 0, 0, 0, 1, 1,
-0.8022906, 0.8502379, -2.983082, 0, 0, 0, 1, 1,
-0.7933325, -0.3106269, -3.041287, 1, 1, 1, 1, 1,
-0.7930196, 0.1917452, -1.021275, 1, 1, 1, 1, 1,
-0.7918562, -1.523936, -3.215786, 1, 1, 1, 1, 1,
-0.7863746, -2.292478, -2.645904, 1, 1, 1, 1, 1,
-0.7859131, 1.267057, -0.1704714, 1, 1, 1, 1, 1,
-0.783636, 2.52517, -0.7846513, 1, 1, 1, 1, 1,
-0.7803442, 1.311995, 0.1861702, 1, 1, 1, 1, 1,
-0.7780031, -0.7224788, -1.051427, 1, 1, 1, 1, 1,
-0.7762762, 0.3059789, -0.9192129, 1, 1, 1, 1, 1,
-0.7760262, 0.9292874, -0.5693315, 1, 1, 1, 1, 1,
-0.7758362, -2.153247, -2.540944, 1, 1, 1, 1, 1,
-0.7744896, 0.3271558, 0.6768324, 1, 1, 1, 1, 1,
-0.7703917, 2.012415, -0.2071213, 1, 1, 1, 1, 1,
-0.7684758, -0.8281852, -2.465786, 1, 1, 1, 1, 1,
-0.7631874, -1.45582, -2.90763, 1, 1, 1, 1, 1,
-0.7582022, 0.2077259, 0.4367258, 0, 0, 1, 1, 1,
-0.7524033, 0.5624069, -1.257062, 1, 0, 0, 1, 1,
-0.7475478, 1.365134, -2.089879, 1, 0, 0, 1, 1,
-0.7403099, -0.854623, -3.869856, 1, 0, 0, 1, 1,
-0.7364292, -2.460438, -3.322423, 1, 0, 0, 1, 1,
-0.7333606, -1.059487, -3.147594, 1, 0, 0, 1, 1,
-0.7291964, -0.9280308, -1.711399, 0, 0, 0, 1, 1,
-0.727513, 0.2234252, -2.267264, 0, 0, 0, 1, 1,
-0.7231821, -2.356979, -2.434047, 0, 0, 0, 1, 1,
-0.7176464, -0.7321616, -2.814158, 0, 0, 0, 1, 1,
-0.7175483, -0.3345799, -1.158318, 0, 0, 0, 1, 1,
-0.7076033, -0.8854365, -2.885253, 0, 0, 0, 1, 1,
-0.7054521, 1.007799, -1.487504, 0, 0, 0, 1, 1,
-0.704673, -0.674542, -3.130625, 1, 1, 1, 1, 1,
-0.704524, -0.5292903, -2.324351, 1, 1, 1, 1, 1,
-0.6978709, -0.1944833, -2.239237, 1, 1, 1, 1, 1,
-0.6978548, -0.09441321, -0.8975255, 1, 1, 1, 1, 1,
-0.6958597, -1.707327, -2.778152, 1, 1, 1, 1, 1,
-0.6939187, -0.1368058, -0.4926084, 1, 1, 1, 1, 1,
-0.690853, 0.2350596, 0.3822547, 1, 1, 1, 1, 1,
-0.6893293, -1.074437, -3.118083, 1, 1, 1, 1, 1,
-0.6857731, 1.830626, -0.1351865, 1, 1, 1, 1, 1,
-0.679647, -0.2198987, -1.493554, 1, 1, 1, 1, 1,
-0.6774659, 1.236594, -1.185287, 1, 1, 1, 1, 1,
-0.6770173, -0.6711069, -3.369257, 1, 1, 1, 1, 1,
-0.6708297, 1.59865, -0.5394068, 1, 1, 1, 1, 1,
-0.6606045, -1.152296, -2.739443, 1, 1, 1, 1, 1,
-0.6605242, -0.4924115, -1.222946, 1, 1, 1, 1, 1,
-0.6583545, 0.1993213, -1.047437, 0, 0, 1, 1, 1,
-0.6571218, -1.130188, -3.206393, 1, 0, 0, 1, 1,
-0.6540021, -0.929739, -3.061744, 1, 0, 0, 1, 1,
-0.6501065, 0.009171912, -0.8656828, 1, 0, 0, 1, 1,
-0.6496674, -1.382049, -3.409282, 1, 0, 0, 1, 1,
-0.6480924, -0.6193445, -2.113681, 1, 0, 0, 1, 1,
-0.6428921, 0.09857105, -1.347297, 0, 0, 0, 1, 1,
-0.6360691, 0.522091, 0.3757243, 0, 0, 0, 1, 1,
-0.6349269, -0.4680062, -2.956608, 0, 0, 0, 1, 1,
-0.6329885, 1.104284, -0.7524244, 0, 0, 0, 1, 1,
-0.6294044, 0.291875, -0.05800449, 0, 0, 0, 1, 1,
-0.6266202, 0.2804071, -0.9403834, 0, 0, 0, 1, 1,
-0.6247638, -0.8116229, -1.386902, 0, 0, 0, 1, 1,
-0.6242386, -0.4186327, -1.984896, 1, 1, 1, 1, 1,
-0.6218518, 0.8597512, -1.627398, 1, 1, 1, 1, 1,
-0.614494, -0.3627431, -3.393718, 1, 1, 1, 1, 1,
-0.6096568, -0.8489814, -1.903486, 1, 1, 1, 1, 1,
-0.6074788, 1.408886, -1.053094, 1, 1, 1, 1, 1,
-0.6020814, -0.6429754, -1.834063, 1, 1, 1, 1, 1,
-0.5989072, 0.07901866, -2.124814, 1, 1, 1, 1, 1,
-0.5974147, 1.402757, -0.6285501, 1, 1, 1, 1, 1,
-0.594855, 0.06488484, -3.576145, 1, 1, 1, 1, 1,
-0.5898737, -0.1584008, -0.6430019, 1, 1, 1, 1, 1,
-0.5885447, 0.1461265, -2.747803, 1, 1, 1, 1, 1,
-0.5880002, 1.186464, 0.1884329, 1, 1, 1, 1, 1,
-0.5809508, 0.8365451, -0.391481, 1, 1, 1, 1, 1,
-0.5807506, 1.497276, -1.130873, 1, 1, 1, 1, 1,
-0.5796834, -1.788587, -3.644523, 1, 1, 1, 1, 1,
-0.5770975, -0.271105, -3.096652, 0, 0, 1, 1, 1,
-0.5746143, -0.1175254, -1.390452, 1, 0, 0, 1, 1,
-0.5689691, 0.3799019, -0.5937217, 1, 0, 0, 1, 1,
-0.5660099, -1.929453, -2.93221, 1, 0, 0, 1, 1,
-0.5650221, 0.5435625, -0.3691761, 1, 0, 0, 1, 1,
-0.5631297, -0.02460897, 0.7617956, 1, 0, 0, 1, 1,
-0.5594589, -0.7459964, -1.39614, 0, 0, 0, 1, 1,
-0.5525893, 0.3900243, -2.017515, 0, 0, 0, 1, 1,
-0.5524738, -0.2090288, -3.13663, 0, 0, 0, 1, 1,
-0.5514097, -2.019908, -1.476676, 0, 0, 0, 1, 1,
-0.5512885, -1.484, -3.088364, 0, 0, 0, 1, 1,
-0.5512868, 0.4844228, -0.6586732, 0, 0, 0, 1, 1,
-0.5497707, -0.2389223, -1.857863, 0, 0, 0, 1, 1,
-0.5418956, 0.3707041, -3.706091, 1, 1, 1, 1, 1,
-0.5417352, 0.5745025, -1.016512, 1, 1, 1, 1, 1,
-0.5305649, 1.489632, 0.8487518, 1, 1, 1, 1, 1,
-0.5300239, 1.833744, 0.5651804, 1, 1, 1, 1, 1,
-0.5215639, 1.005323, -0.846613, 1, 1, 1, 1, 1,
-0.5202298, -0.8122847, -1.375276, 1, 1, 1, 1, 1,
-0.5173752, -0.3305107, -3.950556, 1, 1, 1, 1, 1,
-0.5164813, 0.2377388, -0.4983912, 1, 1, 1, 1, 1,
-0.5137706, -0.06754391, -0.6006745, 1, 1, 1, 1, 1,
-0.5114428, -0.792286, -1.78622, 1, 1, 1, 1, 1,
-0.5070276, 0.4059699, 0.998403, 1, 1, 1, 1, 1,
-0.5048498, 1.020093, -1.507746, 1, 1, 1, 1, 1,
-0.499403, 1.203604, -1.122259, 1, 1, 1, 1, 1,
-0.4922446, 0.6830719, -1.238573, 1, 1, 1, 1, 1,
-0.4810115, 0.7913657, -0.369821, 1, 1, 1, 1, 1,
-0.4789941, -0.006126608, 0.959394, 0, 0, 1, 1, 1,
-0.4774905, 0.5604895, -3.122488, 1, 0, 0, 1, 1,
-0.4749383, 1.095683, 0.4135569, 1, 0, 0, 1, 1,
-0.471751, -0.03207802, -1.378735, 1, 0, 0, 1, 1,
-0.4671302, -0.7769898, -2.435701, 1, 0, 0, 1, 1,
-0.4653302, 1.094239, -1.668018, 1, 0, 0, 1, 1,
-0.4633292, -1.306004, -3.175935, 0, 0, 0, 1, 1,
-0.4614085, -0.9222026, -1.549711, 0, 0, 0, 1, 1,
-0.460062, 0.3325208, -0.82844, 0, 0, 0, 1, 1,
-0.4595273, 1.03334, -1.267254, 0, 0, 0, 1, 1,
-0.4587356, -0.9419643, -1.685304, 0, 0, 0, 1, 1,
-0.4520585, -0.559322, -1.447606, 0, 0, 0, 1, 1,
-0.451891, 0.488773, -1.744013, 0, 0, 0, 1, 1,
-0.4506489, 0.185338, -1.196555, 1, 1, 1, 1, 1,
-0.4481991, -0.6768404, -1.262746, 1, 1, 1, 1, 1,
-0.4465418, 1.715188, -0.6218466, 1, 1, 1, 1, 1,
-0.4464842, 0.5938491, 0.05608802, 1, 1, 1, 1, 1,
-0.4463219, -1.441382, -3.938228, 1, 1, 1, 1, 1,
-0.4453404, 0.3100925, -2.685044, 1, 1, 1, 1, 1,
-0.4444224, 0.32212, -0.2224367, 1, 1, 1, 1, 1,
-0.4419827, 1.827374, -0.5695931, 1, 1, 1, 1, 1,
-0.4363505, -0.07446968, -1.667546, 1, 1, 1, 1, 1,
-0.4344407, 1.432194, 0.284917, 1, 1, 1, 1, 1,
-0.4280785, -0.3073263, -3.340156, 1, 1, 1, 1, 1,
-0.4271395, -0.3888294, -1.169881, 1, 1, 1, 1, 1,
-0.4269684, -0.1930005, -3.479346, 1, 1, 1, 1, 1,
-0.4263142, -1.423916, -4.011301, 1, 1, 1, 1, 1,
-0.4245048, 0.459516, 0.1350504, 1, 1, 1, 1, 1,
-0.4218165, -0.3644102, -3.865393, 0, 0, 1, 1, 1,
-0.416893, -0.1656081, -3.605092, 1, 0, 0, 1, 1,
-0.4146396, 0.6172552, -0.264266, 1, 0, 0, 1, 1,
-0.4146069, 0.4439851, -1.351255, 1, 0, 0, 1, 1,
-0.4135489, 0.5419297, -2.144844, 1, 0, 0, 1, 1,
-0.4100827, -0.6570035, -1.967612, 1, 0, 0, 1, 1,
-0.4099437, 1.137074, -1.968995, 0, 0, 0, 1, 1,
-0.4053455, -1.421516, -3.084341, 0, 0, 0, 1, 1,
-0.4019112, 0.5500243, -2.552305, 0, 0, 0, 1, 1,
-0.4014944, -0.1422278, -1.95873, 0, 0, 0, 1, 1,
-0.3981498, -1.514988, -4.074537, 0, 0, 0, 1, 1,
-0.3967915, 1.103016, -0.7172004, 0, 0, 0, 1, 1,
-0.3965659, 0.1991685, -2.388043, 0, 0, 0, 1, 1,
-0.3886071, 0.6744774, -1.532338, 1, 1, 1, 1, 1,
-0.3826093, -0.3828855, -1.118357, 1, 1, 1, 1, 1,
-0.3781983, 0.1467114, -0.8779669, 1, 1, 1, 1, 1,
-0.3755707, 1.587396, -0.4106509, 1, 1, 1, 1, 1,
-0.372605, 1.627703, -0.431131, 1, 1, 1, 1, 1,
-0.370423, -1.150855, -2.684511, 1, 1, 1, 1, 1,
-0.3636033, 0.9283504, -1.428535, 1, 1, 1, 1, 1,
-0.3560933, 0.3968838, 0.2575455, 1, 1, 1, 1, 1,
-0.3560827, -0.7974603, -2.733089, 1, 1, 1, 1, 1,
-0.3551229, -0.6904891, -2.538258, 1, 1, 1, 1, 1,
-0.3478859, -0.03227185, -2.928081, 1, 1, 1, 1, 1,
-0.3430829, 0.8839111, -1.676326, 1, 1, 1, 1, 1,
-0.3422939, 0.7517431, -0.3174731, 1, 1, 1, 1, 1,
-0.3417474, -0.6001542, -4.153766, 1, 1, 1, 1, 1,
-0.3398893, 1.678824, -0.6280953, 1, 1, 1, 1, 1,
-0.3377636, -0.04388003, -0.5643269, 0, 0, 1, 1, 1,
-0.3329589, -0.7539171, -3.075638, 1, 0, 0, 1, 1,
-0.3303356, 0.9036735, -1.470995, 1, 0, 0, 1, 1,
-0.3287979, -0.5606733, -2.339481, 1, 0, 0, 1, 1,
-0.323453, -0.1896221, -3.432028, 1, 0, 0, 1, 1,
-0.3228152, 1.250528, -0.6368145, 1, 0, 0, 1, 1,
-0.3195268, 0.4638721, -1.498265, 0, 0, 0, 1, 1,
-0.3185347, 1.143916, 0.07718393, 0, 0, 0, 1, 1,
-0.3126464, 1.031969, -2.697487, 0, 0, 0, 1, 1,
-0.3124508, 1.562856, 1.37648, 0, 0, 0, 1, 1,
-0.3106077, 0.185312, -1.148572, 0, 0, 0, 1, 1,
-0.3102376, 1.875219, 0.2085572, 0, 0, 0, 1, 1,
-0.3071907, -0.4549373, -3.834269, 0, 0, 0, 1, 1,
-0.3028329, -0.6520195, -2.458267, 1, 1, 1, 1, 1,
-0.2967769, 0.4583066, -1.283439, 1, 1, 1, 1, 1,
-0.2918312, 0.2684853, -2.210259, 1, 1, 1, 1, 1,
-0.2904376, -1.560016, -3.404579, 1, 1, 1, 1, 1,
-0.2885902, -0.144076, -2.10989, 1, 1, 1, 1, 1,
-0.2880401, 0.1741567, -1.691712, 1, 1, 1, 1, 1,
-0.2878412, 0.3731378, 0.6331382, 1, 1, 1, 1, 1,
-0.2871044, 1.819828, -0.4893425, 1, 1, 1, 1, 1,
-0.2845693, 1.041342, -0.4946336, 1, 1, 1, 1, 1,
-0.2829564, 0.2857843, -0.1730204, 1, 1, 1, 1, 1,
-0.2806808, -1.925464, -2.024922, 1, 1, 1, 1, 1,
-0.2805371, 0.5933116, -1.4348, 1, 1, 1, 1, 1,
-0.2799852, -1.004911, -3.637363, 1, 1, 1, 1, 1,
-0.2778947, -0.6584436, -1.840722, 1, 1, 1, 1, 1,
-0.2762643, -0.5036075, -2.551782, 1, 1, 1, 1, 1,
-0.2712014, 1.30965, 1.334378, 0, 0, 1, 1, 1,
-0.2704678, -0.5977626, -3.778539, 1, 0, 0, 1, 1,
-0.2672915, 0.1490297, 0.4050735, 1, 0, 0, 1, 1,
-0.26439, -0.3689323, -2.902989, 1, 0, 0, 1, 1,
-0.2624367, -0.1946123, -1.791684, 1, 0, 0, 1, 1,
-0.2617275, -0.2724644, -0.259231, 1, 0, 0, 1, 1,
-0.2612586, 1.459567, 0.02873198, 0, 0, 0, 1, 1,
-0.260727, -0.7973126, -3.075587, 0, 0, 0, 1, 1,
-0.2598564, 1.521779, -0.471947, 0, 0, 0, 1, 1,
-0.2569821, -0.06821978, -1.249133, 0, 0, 0, 1, 1,
-0.2502907, -0.6015711, -2.656833, 0, 0, 0, 1, 1,
-0.2383988, 2.192077, -0.225787, 0, 0, 0, 1, 1,
-0.2357436, -1.357713, -3.169916, 0, 0, 0, 1, 1,
-0.2355068, -1.751412, -2.741635, 1, 1, 1, 1, 1,
-0.2325564, 0.3692267, -0.5670805, 1, 1, 1, 1, 1,
-0.2286126, -0.5611551, -2.645237, 1, 1, 1, 1, 1,
-0.2197158, -0.2996903, -0.4502536, 1, 1, 1, 1, 1,
-0.2192488, -1.325822, -3.649735, 1, 1, 1, 1, 1,
-0.2160709, -0.5971275, -2.856695, 1, 1, 1, 1, 1,
-0.2139985, -0.01059852, -1.218247, 1, 1, 1, 1, 1,
-0.2100204, -0.5945241, -3.51228, 1, 1, 1, 1, 1,
-0.2046233, 1.837398, -1.568976, 1, 1, 1, 1, 1,
-0.2001046, -0.02257096, -1.524591, 1, 1, 1, 1, 1,
-0.1990269, 1.409744, -0.4402698, 1, 1, 1, 1, 1,
-0.1982774, 0.1965697, -1.562507, 1, 1, 1, 1, 1,
-0.1971371, 0.1192613, -0.9413031, 1, 1, 1, 1, 1,
-0.1969162, 0.574636, -1.584497, 1, 1, 1, 1, 1,
-0.1959266, 1.754072, 0.1524791, 1, 1, 1, 1, 1,
-0.1930019, 0.6811849, -1.685401, 0, 0, 1, 1, 1,
-0.1822248, 0.01511987, -1.396021, 1, 0, 0, 1, 1,
-0.1814205, -0.1276194, -2.608722, 1, 0, 0, 1, 1,
-0.1781654, -1.56222, -2.080725, 1, 0, 0, 1, 1,
-0.1721396, 0.7745566, 1.260707, 1, 0, 0, 1, 1,
-0.1712385, -0.02566179, -1.639753, 1, 0, 0, 1, 1,
-0.1694829, 0.8047641, -0.2091203, 0, 0, 0, 1, 1,
-0.1682656, -1.181808, -1.952342, 0, 0, 0, 1, 1,
-0.166459, 0.04781286, -0.6904999, 0, 0, 0, 1, 1,
-0.161525, -0.02434479, -2.837002, 0, 0, 0, 1, 1,
-0.161014, 0.7848086, 1.248636, 0, 0, 0, 1, 1,
-0.1584303, 1.638892, -0.07835714, 0, 0, 0, 1, 1,
-0.1569683, 0.7782938, 0.3735025, 0, 0, 0, 1, 1,
-0.1566994, -0.2241845, -3.135729, 1, 1, 1, 1, 1,
-0.1566876, 0.01177428, -2.44767, 1, 1, 1, 1, 1,
-0.1549611, -1.082449, -3.655839, 1, 1, 1, 1, 1,
-0.1524928, 0.04597952, -0.02707343, 1, 1, 1, 1, 1,
-0.1523131, -0.6174119, -3.616269, 1, 1, 1, 1, 1,
-0.1519295, 1.491166, -0.09344584, 1, 1, 1, 1, 1,
-0.1458457, 1.174527, -2.017092, 1, 1, 1, 1, 1,
-0.1444297, -0.5091127, -2.106627, 1, 1, 1, 1, 1,
-0.1432219, -0.3171901, -1.905475, 1, 1, 1, 1, 1,
-0.1419242, 0.9902056, -1.278629, 1, 1, 1, 1, 1,
-0.1386798, -1.046372, -3.90955, 1, 1, 1, 1, 1,
-0.1376946, -0.5007634, -3.240619, 1, 1, 1, 1, 1,
-0.1374402, 0.05480849, -1.245322, 1, 1, 1, 1, 1,
-0.1370288, 0.4975955, 0.1020234, 1, 1, 1, 1, 1,
-0.1366062, 0.435075, 0.29764, 1, 1, 1, 1, 1,
-0.1341101, -0.9869066, -2.827908, 0, 0, 1, 1, 1,
-0.1328914, 1.012825, -0.4703119, 1, 0, 0, 1, 1,
-0.1254867, 0.2927107, -0.2366244, 1, 0, 0, 1, 1,
-0.1254646, 0.7660826, -0.4755388, 1, 0, 0, 1, 1,
-0.1187431, 1.738061, -2.406645, 1, 0, 0, 1, 1,
-0.1180385, 1.926837, 0.7493365, 1, 0, 0, 1, 1,
-0.1176532, 0.2296024, 1.123314, 0, 0, 0, 1, 1,
-0.1159074, -0.05188641, -3.077131, 0, 0, 0, 1, 1,
-0.1157319, 0.3097401, 0.8629611, 0, 0, 0, 1, 1,
-0.1058025, 0.267155, -1.066224, 0, 0, 0, 1, 1,
-0.1026185, 1.641194, 0.7331719, 0, 0, 0, 1, 1,
-0.1023867, 1.187805, -1.989735, 0, 0, 0, 1, 1,
-0.1017697, -0.5256629, -3.189496, 0, 0, 0, 1, 1,
-0.1005848, -0.488538, -2.109509, 1, 1, 1, 1, 1,
-0.09894728, -1.734687, -3.015278, 1, 1, 1, 1, 1,
-0.09697086, 1.936449, -1.335668, 1, 1, 1, 1, 1,
-0.09565473, -0.3442004, -3.441483, 1, 1, 1, 1, 1,
-0.09504582, 0.6443527, 0.561195, 1, 1, 1, 1, 1,
-0.09405664, -0.8088706, -2.969304, 1, 1, 1, 1, 1,
-0.09374288, -0.6985663, -2.651691, 1, 1, 1, 1, 1,
-0.09048624, 2.004459, 1.549171, 1, 1, 1, 1, 1,
-0.08810527, -1.286545, -4.603701, 1, 1, 1, 1, 1,
-0.08759787, -1.397966, -4.202781, 1, 1, 1, 1, 1,
-0.08317588, -1.481891, -5.347443, 1, 1, 1, 1, 1,
-0.07658825, -0.4457299, -1.660392, 1, 1, 1, 1, 1,
-0.07442393, -0.515514, -3.74963, 1, 1, 1, 1, 1,
-0.07280725, 0.4734513, -1.632597, 1, 1, 1, 1, 1,
-0.06489883, -0.6972297, -2.860614, 1, 1, 1, 1, 1,
-0.06132052, -0.323041, -2.530336, 0, 0, 1, 1, 1,
-0.06074781, 0.7272239, 0.2962152, 1, 0, 0, 1, 1,
-0.05855827, -0.3010356, -2.418441, 1, 0, 0, 1, 1,
-0.05663982, 0.3144212, -0.3290194, 1, 0, 0, 1, 1,
-0.0548714, -0.5081015, -4.312868, 1, 0, 0, 1, 1,
-0.05234962, 1.226873, 1.496914, 1, 0, 0, 1, 1,
-0.05037689, -1.390528, -3.858055, 0, 0, 0, 1, 1,
-0.0467853, 1.868312, -1.068425, 0, 0, 0, 1, 1,
-0.03769718, 1.507313, -0.2648645, 0, 0, 0, 1, 1,
-0.03711353, -1.742714, -2.667297, 0, 0, 0, 1, 1,
-0.03252796, 0.2194048, -0.1411171, 0, 0, 0, 1, 1,
-0.03165497, 1.299862, 1.067397, 0, 0, 0, 1, 1,
-0.03076871, -0.06760565, -2.622701, 0, 0, 0, 1, 1,
-0.02733807, -0.2462142, -4.352797, 1, 1, 1, 1, 1,
-0.02521196, -0.5892588, -4.187091, 1, 1, 1, 1, 1,
-0.02357387, -0.05413387, -1.022522, 1, 1, 1, 1, 1,
-0.02023173, 1.462772, -0.2238459, 1, 1, 1, 1, 1,
-0.01435432, 2.034662, -1.678283, 1, 1, 1, 1, 1,
-0.01113365, -0.3245679, -2.166884, 1, 1, 1, 1, 1,
-0.01018333, -0.07312496, -3.094141, 1, 1, 1, 1, 1,
-0.007943052, -0.8166794, -4.796782, 1, 1, 1, 1, 1,
-0.007061027, -0.9281473, -4.144878, 1, 1, 1, 1, 1,
-0.005356901, -0.4069982, -4.033002, 1, 1, 1, 1, 1,
-0.002970556, 0.1390385, -0.1566311, 1, 1, 1, 1, 1,
-0.001161889, 1.117372, -1.553613, 1, 1, 1, 1, 1,
0.001262138, 0.7616903, 0.1629364, 1, 1, 1, 1, 1,
0.00134255, -0.5371811, 5.019893, 1, 1, 1, 1, 1,
0.006823507, 1.251106, 0.4597169, 1, 1, 1, 1, 1,
0.00827708, -0.5210259, 3.167672, 0, 0, 1, 1, 1,
0.009664502, -0.7759514, 4.187475, 1, 0, 0, 1, 1,
0.01045147, 0.5818158, 1.083324, 1, 0, 0, 1, 1,
0.01575622, 1.729449, -0.9768227, 1, 0, 0, 1, 1,
0.01762195, 0.5105094, -1.189298, 1, 0, 0, 1, 1,
0.02648179, 1.714521, 1.665311, 1, 0, 0, 1, 1,
0.02962295, -0.2452465, 2.391416, 0, 0, 0, 1, 1,
0.03083435, 0.9216468, -0.1163126, 0, 0, 0, 1, 1,
0.03187486, 1.531394, -0.05239773, 0, 0, 0, 1, 1,
0.03323088, 1.73281, -0.3822855, 0, 0, 0, 1, 1,
0.03366661, -1.054905, 4.158832, 0, 0, 0, 1, 1,
0.04423268, -0.1332484, 4.360819, 0, 0, 0, 1, 1,
0.04699415, -0.8921553, 3.056924, 0, 0, 0, 1, 1,
0.0472691, 0.02964775, -0.3927809, 1, 1, 1, 1, 1,
0.04748316, 1.148973, 0.1273668, 1, 1, 1, 1, 1,
0.05374739, -0.3667079, 2.326893, 1, 1, 1, 1, 1,
0.05753266, 1.04176, 0.2611381, 1, 1, 1, 1, 1,
0.05798233, -0.02925429, 2.328538, 1, 1, 1, 1, 1,
0.06274109, -0.04903555, 3.274222, 1, 1, 1, 1, 1,
0.06291611, 0.9965976, 0.04703289, 1, 1, 1, 1, 1,
0.0631096, 0.2723133, 0.5284328, 1, 1, 1, 1, 1,
0.06346115, 1.215713, -0.6207675, 1, 1, 1, 1, 1,
0.06732652, -0.1046515, 3.915487, 1, 1, 1, 1, 1,
0.06923133, 0.1294243, -0.1837103, 1, 1, 1, 1, 1,
0.0702564, 0.544834, -0.3537075, 1, 1, 1, 1, 1,
0.07325123, 0.08219189, 0.5057682, 1, 1, 1, 1, 1,
0.07586257, 1.105542, -1.443687, 1, 1, 1, 1, 1,
0.0787826, -0.1512915, 1.34444, 1, 1, 1, 1, 1,
0.07931672, -0.2477695, 2.757882, 0, 0, 1, 1, 1,
0.08176006, 0.8117245, 1.524063, 1, 0, 0, 1, 1,
0.08330401, 0.8432096, -0.08325823, 1, 0, 0, 1, 1,
0.08380225, 0.6161233, 1.271819, 1, 0, 0, 1, 1,
0.09160896, 0.6065031, -0.8648198, 1, 0, 0, 1, 1,
0.0921467, 1.544023, 0.4357449, 1, 0, 0, 1, 1,
0.09223917, -0.675152, 4.114044, 0, 0, 0, 1, 1,
0.09234408, -0.7002568, 4.214323, 0, 0, 0, 1, 1,
0.0945447, 0.7542263, 1.606353, 0, 0, 0, 1, 1,
0.0946354, -0.1244722, 1.386717, 0, 0, 0, 1, 1,
0.09546259, 0.4877938, 0.2492596, 0, 0, 0, 1, 1,
0.09602556, -2.045737, 3.032515, 0, 0, 0, 1, 1,
0.09852596, 0.4078593, 0.7851557, 0, 0, 0, 1, 1,
0.1003061, -0.6233484, 2.184571, 1, 1, 1, 1, 1,
0.1004818, -0.387146, 0.4652526, 1, 1, 1, 1, 1,
0.1005079, 1.324415, -1.587177, 1, 1, 1, 1, 1,
0.1005684, 0.3769059, -0.3008548, 1, 1, 1, 1, 1,
0.1007705, 0.3527593, -0.007875604, 1, 1, 1, 1, 1,
0.1017161, 0.2546099, 0.2802282, 1, 1, 1, 1, 1,
0.1030721, -0.217921, 1.173382, 1, 1, 1, 1, 1,
0.1031845, 0.01442826, 2.027264, 1, 1, 1, 1, 1,
0.1066403, 1.634428, 0.02012339, 1, 1, 1, 1, 1,
0.1071525, -0.152857, 0.6728908, 1, 1, 1, 1, 1,
0.107949, -0.2257663, 2.034107, 1, 1, 1, 1, 1,
0.1082761, -1.012905, 5.581975, 1, 1, 1, 1, 1,
0.1119452, 0.03225325, 1.778042, 1, 1, 1, 1, 1,
0.1144729, 0.4900565, 0.6594029, 1, 1, 1, 1, 1,
0.1145559, -1.180219, 3.512245, 1, 1, 1, 1, 1,
0.1146254, -0.9897069, 3.18124, 0, 0, 1, 1, 1,
0.1211772, 1.548473, 1.367985, 1, 0, 0, 1, 1,
0.1215298, -0.4803162, 1.920366, 1, 0, 0, 1, 1,
0.1270434, -0.08519848, 2.752353, 1, 0, 0, 1, 1,
0.1387831, 0.1427532, 0.8733563, 1, 0, 0, 1, 1,
0.1437307, -0.6120362, 1.72218, 1, 0, 0, 1, 1,
0.1439818, 0.7713944, 1.529199, 0, 0, 0, 1, 1,
0.1483779, -0.7950068, 2.159965, 0, 0, 0, 1, 1,
0.1528643, 0.7207175, -0.06493733, 0, 0, 0, 1, 1,
0.1539702, 0.2566255, 1.429983, 0, 0, 0, 1, 1,
0.1582729, 0.1788357, 0.2697818, 0, 0, 0, 1, 1,
0.1598778, 2.085921, 1.0307, 0, 0, 0, 1, 1,
0.1599603, -1.525979, 3.378054, 0, 0, 0, 1, 1,
0.1655774, -1.068154, 2.864007, 1, 1, 1, 1, 1,
0.1660458, 0.2687991, -0.4701121, 1, 1, 1, 1, 1,
0.1681249, -0.5010037, 3.044996, 1, 1, 1, 1, 1,
0.1688354, -0.8227893, 2.416302, 1, 1, 1, 1, 1,
0.170055, -2.589716, 1.968589, 1, 1, 1, 1, 1,
0.1721293, -0.3737996, 2.00727, 1, 1, 1, 1, 1,
0.1805884, -1.020343, 4.827177, 1, 1, 1, 1, 1,
0.1860852, 0.940286, 1.021705, 1, 1, 1, 1, 1,
0.1923353, 0.630846, 2.092454, 1, 1, 1, 1, 1,
0.1952378, 0.758571, 0.694575, 1, 1, 1, 1, 1,
0.196107, 0.1745813, 1.132561, 1, 1, 1, 1, 1,
0.197692, 0.1834713, 1.197988, 1, 1, 1, 1, 1,
0.206507, 0.2459708, 1.337134, 1, 1, 1, 1, 1,
0.2125371, -0.4025492, 2.955954, 1, 1, 1, 1, 1,
0.2146128, -1.35347, 1.589779, 1, 1, 1, 1, 1,
0.2192473, 0.1839963, -0.3127126, 0, 0, 1, 1, 1,
0.2214359, -0.2212316, 2.767765, 1, 0, 0, 1, 1,
0.221486, -1.166346, 1.355662, 1, 0, 0, 1, 1,
0.2222863, -1.681463, 1.544024, 1, 0, 0, 1, 1,
0.2225027, -0.06402104, 2.82763, 1, 0, 0, 1, 1,
0.2229929, -0.2742828, 2.78057, 1, 0, 0, 1, 1,
0.2236459, -0.6480667, 2.047339, 0, 0, 0, 1, 1,
0.2246231, -0.9784175, 2.982802, 0, 0, 0, 1, 1,
0.2265585, -0.1307923, 0.9115416, 0, 0, 0, 1, 1,
0.2277417, 0.4163446, -0.8434669, 0, 0, 0, 1, 1,
0.2287869, -0.8461488, 4.208044, 0, 0, 0, 1, 1,
0.2288906, -1.034725, 2.147906, 0, 0, 0, 1, 1,
0.2328892, -1.793103, 3.066026, 0, 0, 0, 1, 1,
0.2362401, 0.910141, 0.09570747, 1, 1, 1, 1, 1,
0.2408532, 0.4672055, 0.444515, 1, 1, 1, 1, 1,
0.2428518, 0.6880466, 0.8227065, 1, 1, 1, 1, 1,
0.2452358, -0.7839237, 2.308218, 1, 1, 1, 1, 1,
0.245309, -2.077601, 3.510269, 1, 1, 1, 1, 1,
0.2484462, -0.3149115, 3.924337, 1, 1, 1, 1, 1,
0.2494533, 0.1590514, 1.189507, 1, 1, 1, 1, 1,
0.2503835, 1.499155, -0.6988475, 1, 1, 1, 1, 1,
0.2505724, -0.2139761, 4.403926, 1, 1, 1, 1, 1,
0.2537298, -0.2451994, 3.208671, 1, 1, 1, 1, 1,
0.2580157, 2.13987, 0.2440964, 1, 1, 1, 1, 1,
0.2604329, 0.5631688, 3.106406, 1, 1, 1, 1, 1,
0.2614178, 1.588774, -1.473832, 1, 1, 1, 1, 1,
0.2659519, -0.08084924, 0.3526423, 1, 1, 1, 1, 1,
0.2661408, 0.3109806, 1.59536, 1, 1, 1, 1, 1,
0.2672345, -0.03371155, 0.2941177, 0, 0, 1, 1, 1,
0.2675978, -1.441655, 2.197372, 1, 0, 0, 1, 1,
0.2685747, 1.487631, 1.542826, 1, 0, 0, 1, 1,
0.2689235, -0.6289473, 3.741119, 1, 0, 0, 1, 1,
0.2699712, 0.4268102, -0.7941965, 1, 0, 0, 1, 1,
0.2728567, -1.193831, 4.641062, 1, 0, 0, 1, 1,
0.2741329, -0.4321656, 1.811315, 0, 0, 0, 1, 1,
0.2796564, -1.274041, 3.266186, 0, 0, 0, 1, 1,
0.2803041, -0.4301049, 3.816397, 0, 0, 0, 1, 1,
0.2811044, -0.8670198, 2.905938, 0, 0, 0, 1, 1,
0.291222, 0.1930593, 2.927253, 0, 0, 0, 1, 1,
0.2966774, -1.691286, 4.151184, 0, 0, 0, 1, 1,
0.3050519, 1.287089, 1.310953, 0, 0, 0, 1, 1,
0.3094685, -0.3429739, 3.440747, 1, 1, 1, 1, 1,
0.3122802, -0.2864715, 3.217624, 1, 1, 1, 1, 1,
0.3129939, -0.01129723, 2.888764, 1, 1, 1, 1, 1,
0.3140849, 0.4400103, 0.4495954, 1, 1, 1, 1, 1,
0.3167687, -0.1989393, 1.51966, 1, 1, 1, 1, 1,
0.3214555, -2.12397, 2.535755, 1, 1, 1, 1, 1,
0.3231522, 0.8458132, 0.6344905, 1, 1, 1, 1, 1,
0.3252037, -1.39891, 4.54091, 1, 1, 1, 1, 1,
0.3254934, 1.109098, -1.158107, 1, 1, 1, 1, 1,
0.3257962, -0.4411569, 2.821826, 1, 1, 1, 1, 1,
0.3298115, 0.178566, 2.329753, 1, 1, 1, 1, 1,
0.3302954, -0.1727369, 3.360311, 1, 1, 1, 1, 1,
0.330437, -1.042681, 2.480169, 1, 1, 1, 1, 1,
0.3347156, -0.1250291, 1.602231, 1, 1, 1, 1, 1,
0.3353277, 1.014701, 0.3131392, 1, 1, 1, 1, 1,
0.3410738, 0.4316956, 1.430061, 0, 0, 1, 1, 1,
0.3450925, -0.8515369, 3.132993, 1, 0, 0, 1, 1,
0.3506118, -0.6513035, 2.368748, 1, 0, 0, 1, 1,
0.3525157, 1.657206, -0.789314, 1, 0, 0, 1, 1,
0.358859, 0.05635728, 1.349375, 1, 0, 0, 1, 1,
0.3674534, 2.787623, 0.7867103, 1, 0, 0, 1, 1,
0.3736748, -0.6966869, 2.531362, 0, 0, 0, 1, 1,
0.3794045, -0.7519664, 1.696546, 0, 0, 0, 1, 1,
0.3811805, 0.9798634, 0.5005509, 0, 0, 0, 1, 1,
0.3816577, -1.407927, 3.994122, 0, 0, 0, 1, 1,
0.3875814, -1.137028, 2.404454, 0, 0, 0, 1, 1,
0.3890958, 0.3694524, 0.4686669, 0, 0, 0, 1, 1,
0.391973, 0.1609956, 1.45029, 0, 0, 0, 1, 1,
0.4035582, 0.3230669, 3.563189, 1, 1, 1, 1, 1,
0.4038669, -0.9745686, 2.072804, 1, 1, 1, 1, 1,
0.4089238, -0.1261539, 2.134494, 1, 1, 1, 1, 1,
0.4104024, -1.02555, 1.128862, 1, 1, 1, 1, 1,
0.4105448, 1.34664, 0.3746291, 1, 1, 1, 1, 1,
0.4114536, 0.9659616, -1.470747, 1, 1, 1, 1, 1,
0.4129726, 1.223808, 1.762363, 1, 1, 1, 1, 1,
0.4173622, -0.112982, 1.270162, 1, 1, 1, 1, 1,
0.4176734, -1.251922, 2.464108, 1, 1, 1, 1, 1,
0.419305, 0.7348649, -1.520969, 1, 1, 1, 1, 1,
0.4202306, -0.1820135, 1.724278, 1, 1, 1, 1, 1,
0.420355, -0.05817687, 1.041881, 1, 1, 1, 1, 1,
0.4231355, 0.6764128, 0.5071899, 1, 1, 1, 1, 1,
0.4247398, 0.6734492, 1.827046, 1, 1, 1, 1, 1,
0.4271978, -0.7319214, 2.2032, 1, 1, 1, 1, 1,
0.4278634, -1.146789, 2.889384, 0, 0, 1, 1, 1,
0.4317142, 2.575653, 0.2760489, 1, 0, 0, 1, 1,
0.4319468, -0.09483954, 1.69003, 1, 0, 0, 1, 1,
0.43546, 1.755373, -1.262813, 1, 0, 0, 1, 1,
0.4374581, -0.6936075, 2.556702, 1, 0, 0, 1, 1,
0.4381036, -0.659152, 0.5999799, 1, 0, 0, 1, 1,
0.4481482, 0.3265111, 1.533832, 0, 0, 0, 1, 1,
0.450185, -0.6180477, 2.182374, 0, 0, 0, 1, 1,
0.4568371, -0.627829, 2.527922, 0, 0, 0, 1, 1,
0.458033, -1.458525, 2.602685, 0, 0, 0, 1, 1,
0.4596513, -0.6453742, 1.320525, 0, 0, 0, 1, 1,
0.4625846, 1.426612, 1.03554, 0, 0, 0, 1, 1,
0.4639687, -1.615116, 2.85864, 0, 0, 0, 1, 1,
0.4649009, 0.407192, 0.6848873, 1, 1, 1, 1, 1,
0.4655021, -0.1496521, 1.078879, 1, 1, 1, 1, 1,
0.4702106, 0.5635481, -0.4909976, 1, 1, 1, 1, 1,
0.4726233, -1.031701, 4.502883, 1, 1, 1, 1, 1,
0.472774, -0.5288564, 2.401106, 1, 1, 1, 1, 1,
0.4783823, -0.8431158, 1.073988, 1, 1, 1, 1, 1,
0.4847784, -1.550253, 2.590222, 1, 1, 1, 1, 1,
0.4848893, -1.881159, 2.296382, 1, 1, 1, 1, 1,
0.4870142, -1.352423, 4.791373, 1, 1, 1, 1, 1,
0.4871241, 0.3419871, 0.0834588, 1, 1, 1, 1, 1,
0.4931071, 0.3873821, 1.686242, 1, 1, 1, 1, 1,
0.4946522, 0.5212017, 0.2322911, 1, 1, 1, 1, 1,
0.4974535, -1.067466, 2.727685, 1, 1, 1, 1, 1,
0.4999313, 0.3338878, -0.1148483, 1, 1, 1, 1, 1,
0.5009705, 0.1360087, 1.504598, 1, 1, 1, 1, 1,
0.5020797, 1.325249, 0.3625942, 0, 0, 1, 1, 1,
0.5034353, -1.407472, -1.031094, 1, 0, 0, 1, 1,
0.5045949, 0.9441864, -0.1268174, 1, 0, 0, 1, 1,
0.5063786, 0.5190686, 1.625979, 1, 0, 0, 1, 1,
0.5091415, 3.05135, 1.266657, 1, 0, 0, 1, 1,
0.5108625, -0.3613048, 2.461233, 1, 0, 0, 1, 1,
0.5111146, -1.227467, 3.324745, 0, 0, 0, 1, 1,
0.5111755, 0.1353568, 0.1482115, 0, 0, 0, 1, 1,
0.5161468, -1.004801, 2.499248, 0, 0, 0, 1, 1,
0.5288012, -0.1620043, 3.338823, 0, 0, 0, 1, 1,
0.5352808, -0.4502753, -0.3168734, 0, 0, 0, 1, 1,
0.5402024, -1.934215, 2.472187, 0, 0, 0, 1, 1,
0.5437539, -0.2327462, 0.752983, 0, 0, 0, 1, 1,
0.5462777, -0.573696, 2.399967, 1, 1, 1, 1, 1,
0.5465854, -0.693339, 1.141356, 1, 1, 1, 1, 1,
0.5484151, -0.6067496, 2.062904, 1, 1, 1, 1, 1,
0.5539174, -0.3258533, 2.219939, 1, 1, 1, 1, 1,
0.5638528, -0.2433496, 0.5909249, 1, 1, 1, 1, 1,
0.5652934, 0.425371, -0.1757943, 1, 1, 1, 1, 1,
0.5700616, 0.9807094, 0.8026008, 1, 1, 1, 1, 1,
0.5729121, 0.5774822, 1.016659, 1, 1, 1, 1, 1,
0.573334, 1.172379, 0.5969325, 1, 1, 1, 1, 1,
0.5809724, 0.1452975, 0.1254161, 1, 1, 1, 1, 1,
0.5826154, 1.143997, 2.176155, 1, 1, 1, 1, 1,
0.5834872, 0.908546, 2.159659, 1, 1, 1, 1, 1,
0.5907303, 1.103935, 1.963508, 1, 1, 1, 1, 1,
0.5911097, 0.5889747, 2.787857, 1, 1, 1, 1, 1,
0.5968451, -1.392594, 4.251352, 1, 1, 1, 1, 1,
0.5978491, 0.2328723, 1.282044, 0, 0, 1, 1, 1,
0.5986874, 0.7652599, 1.971483, 1, 0, 0, 1, 1,
0.601302, 1.65251, 1.547848, 1, 0, 0, 1, 1,
0.605158, -0.5165401, 2.799105, 1, 0, 0, 1, 1,
0.6054381, -0.8779993, 3.533028, 1, 0, 0, 1, 1,
0.6078804, 1.630521, 0.9215692, 1, 0, 0, 1, 1,
0.6083862, 1.089863, -0.840107, 0, 0, 0, 1, 1,
0.6089032, 0.1922965, 0.5325437, 0, 0, 0, 1, 1,
0.609023, 0.2986883, 1.147833, 0, 0, 0, 1, 1,
0.6104071, -1.198557, 3.666913, 0, 0, 0, 1, 1,
0.6115634, -0.6396059, 2.348474, 0, 0, 0, 1, 1,
0.6116242, 1.038681, -0.01786134, 0, 0, 0, 1, 1,
0.6133041, -1.439097, 6.075997, 0, 0, 0, 1, 1,
0.6188592, 0.7871379, -0.5996755, 1, 1, 1, 1, 1,
0.6193093, -1.465692, 2.441123, 1, 1, 1, 1, 1,
0.633091, -1.250863, 2.048675, 1, 1, 1, 1, 1,
0.6378651, -0.3138737, 1.743849, 1, 1, 1, 1, 1,
0.6393613, 0.2236728, 0.5784252, 1, 1, 1, 1, 1,
0.6439602, -0.1208819, 0.08197752, 1, 1, 1, 1, 1,
0.6448411, 0.7629441, 0.1068373, 1, 1, 1, 1, 1,
0.6464973, -0.03053753, 1.317112, 1, 1, 1, 1, 1,
0.6512871, -0.2282462, 0.7207671, 1, 1, 1, 1, 1,
0.6568388, -0.5781155, 3.012915, 1, 1, 1, 1, 1,
0.6583268, 1.403251, 0.7885329, 1, 1, 1, 1, 1,
0.6583428, -0.5328724, 1.390011, 1, 1, 1, 1, 1,
0.6612133, 0.958173, 0.5230258, 1, 1, 1, 1, 1,
0.661474, -0.4542273, 3.788806, 1, 1, 1, 1, 1,
0.666966, -1.041554, 3.572327, 1, 1, 1, 1, 1,
0.6670684, 0.5144774, 2.458009, 0, 0, 1, 1, 1,
0.6723483, -0.536274, 2.61549, 1, 0, 0, 1, 1,
0.674931, -0.5615634, 3.102483, 1, 0, 0, 1, 1,
0.6772796, -0.575256, 3.03617, 1, 0, 0, 1, 1,
0.6805774, 0.3498812, 0.7746435, 1, 0, 0, 1, 1,
0.6828266, 1.770734, -1.037153, 1, 0, 0, 1, 1,
0.6851358, -0.2918393, 2.9002, 0, 0, 0, 1, 1,
0.685449, 0.3142653, 1.823067, 0, 0, 0, 1, 1,
0.6906, -0.4604618, 3.622133, 0, 0, 0, 1, 1,
0.6975217, -0.6255761, 1.553058, 0, 0, 0, 1, 1,
0.7003817, 0.5712461, 0.1327537, 0, 0, 0, 1, 1,
0.7067933, 0.284018, -0.2699234, 0, 0, 0, 1, 1,
0.7138968, 0.6389213, 1.319638, 0, 0, 0, 1, 1,
0.7150702, -0.4892051, 4.046539, 1, 1, 1, 1, 1,
0.7162343, -0.8235844, 2.352967, 1, 1, 1, 1, 1,
0.718474, 0.6812075, 1.518793, 1, 1, 1, 1, 1,
0.7240467, 0.7140176, -0.9664729, 1, 1, 1, 1, 1,
0.7250806, -0.8780535, 2.149141, 1, 1, 1, 1, 1,
0.7260174, -0.1706413, 0.7372965, 1, 1, 1, 1, 1,
0.7261786, -0.8927543, 0.5576946, 1, 1, 1, 1, 1,
0.7270915, 0.133186, -0.8102749, 1, 1, 1, 1, 1,
0.7287145, 0.3203579, 2.527627, 1, 1, 1, 1, 1,
0.7447979, 0.2830636, 1.416733, 1, 1, 1, 1, 1,
0.750147, -1.45689, 4.032553, 1, 1, 1, 1, 1,
0.7537764, 0.1364008, -0.4136266, 1, 1, 1, 1, 1,
0.7594755, -0.4600168, 3.41422, 1, 1, 1, 1, 1,
0.7621824, -1.779658, 1.415851, 1, 1, 1, 1, 1,
0.7653694, -1.248169, 2.296148, 1, 1, 1, 1, 1,
0.7700287, -0.5492188, 2.681895, 0, 0, 1, 1, 1,
0.7724165, 1.344752, -1.604575, 1, 0, 0, 1, 1,
0.7773281, -0.352568, 2.196633, 1, 0, 0, 1, 1,
0.7833722, -0.7287221, 3.672218, 1, 0, 0, 1, 1,
0.7864525, -0.3250411, 2.483937, 1, 0, 0, 1, 1,
0.7883511, -0.8003319, 2.417977, 1, 0, 0, 1, 1,
0.7897792, 2.672751, 0.6377653, 0, 0, 0, 1, 1,
0.7928181, -0.1154562, 3.033683, 0, 0, 0, 1, 1,
0.7950423, 0.9847776, 0.5651861, 0, 0, 0, 1, 1,
0.7978671, -0.3942418, 2.068755, 0, 0, 0, 1, 1,
0.7983672, -0.2071223, 3.272242, 0, 0, 0, 1, 1,
0.7997587, -0.01901858, 1.739305, 0, 0, 0, 1, 1,
0.8035101, 0.4242107, 0.7447539, 0, 0, 0, 1, 1,
0.8077965, 1.259243, -0.3913014, 1, 1, 1, 1, 1,
0.8111804, 0.2778769, 0.3031946, 1, 1, 1, 1, 1,
0.8319173, -0.544309, 3.90669, 1, 1, 1, 1, 1,
0.8368667, 0.6591552, -0.4551458, 1, 1, 1, 1, 1,
0.8526557, -0.02596542, 2.039497, 1, 1, 1, 1, 1,
0.8566841, -0.3444652, 1.799695, 1, 1, 1, 1, 1,
0.8573595, -1.707412, 3.844778, 1, 1, 1, 1, 1,
0.8626608, 0.4119341, 1.555144, 1, 1, 1, 1, 1,
0.8671882, 0.4234911, 2.044868, 1, 1, 1, 1, 1,
0.8717744, -0.9043368, 2.675654, 1, 1, 1, 1, 1,
0.8722713, -2.25927, 2.693631, 1, 1, 1, 1, 1,
0.8733816, -0.4997405, 2.661939, 1, 1, 1, 1, 1,
0.881367, 0.2646592, 0.7719422, 1, 1, 1, 1, 1,
0.8883999, -0.8964232, 2.511737, 1, 1, 1, 1, 1,
0.891977, -0.7129022, 1.831779, 1, 1, 1, 1, 1,
0.8925544, 0.6928209, 0.8462811, 0, 0, 1, 1, 1,
0.8933136, 0.3405739, 0.9779629, 1, 0, 0, 1, 1,
0.8969318, -1.845358, 4.325038, 1, 0, 0, 1, 1,
0.8974099, 2.16056, 1.205458, 1, 0, 0, 1, 1,
0.8984684, 0.4306154, 2.202824, 1, 0, 0, 1, 1,
0.8992289, -0.7899255, 1.926483, 1, 0, 0, 1, 1,
0.903845, 1.000836, 0.9739408, 0, 0, 0, 1, 1,
0.9045001, 0.9772427, 1.793828, 0, 0, 0, 1, 1,
0.9065851, 0.4674429, 1.73691, 0, 0, 0, 1, 1,
0.9081578, 0.5657361, 1.410396, 0, 0, 0, 1, 1,
0.9097745, -0.8565122, 2.577616, 0, 0, 0, 1, 1,
0.9115394, 0.2802147, 1.987167, 0, 0, 0, 1, 1,
0.9199026, 1.264976, 1.246235, 0, 0, 0, 1, 1,
0.9250072, -0.6878754, 4.031119, 1, 1, 1, 1, 1,
0.9250125, 1.638186, -0.8718033, 1, 1, 1, 1, 1,
0.9266167, 0.9102216, 0.9049383, 1, 1, 1, 1, 1,
0.9326032, 0.7877493, 1.872518, 1, 1, 1, 1, 1,
0.933377, -0.86171, 1.966343, 1, 1, 1, 1, 1,
0.9388427, -0.1350994, 1.403542, 1, 1, 1, 1, 1,
0.9420153, -0.7542596, 2.719708, 1, 1, 1, 1, 1,
0.945002, -0.5199636, 2.291023, 1, 1, 1, 1, 1,
0.9479646, 2.419673, 0.9724509, 1, 1, 1, 1, 1,
0.9524604, -0.69503, 0.9335988, 1, 1, 1, 1, 1,
0.9587896, -0.3577719, 1.768748, 1, 1, 1, 1, 1,
0.9799926, -1.39977, 1.584508, 1, 1, 1, 1, 1,
0.9801869, -0.8182409, 2.059669, 1, 1, 1, 1, 1,
0.9879569, 0.753352, 1.019942, 1, 1, 1, 1, 1,
0.9929821, -0.938051, 3.515, 1, 1, 1, 1, 1,
0.9956661, -0.5139393, 0.6291938, 0, 0, 1, 1, 1,
0.9978872, -2.489683, 2.264284, 1, 0, 0, 1, 1,
1.001034, 1.21663, 1.183466, 1, 0, 0, 1, 1,
1.009568, -0.9472561, 2.615667, 1, 0, 0, 1, 1,
1.014969, -1.230566, 2.078542, 1, 0, 0, 1, 1,
1.017574, 0.9235529, 2.29471, 1, 0, 0, 1, 1,
1.036086, 0.5846078, 0.6992776, 0, 0, 0, 1, 1,
1.040059, 0.2945941, 1.497424, 0, 0, 0, 1, 1,
1.041526, -0.07950224, 4.040541, 0, 0, 0, 1, 1,
1.047419, 1.140073, -0.03489789, 0, 0, 0, 1, 1,
1.058599, -1.630564, 2.810373, 0, 0, 0, 1, 1,
1.063736, -1.480201, 2.382863, 0, 0, 0, 1, 1,
1.071173, 1.288199, 0.1845024, 0, 0, 0, 1, 1,
1.07612, -0.8897532, 0.8073057, 1, 1, 1, 1, 1,
1.076705, 1.62068, 0.7004202, 1, 1, 1, 1, 1,
1.07834, -0.441958, 3.396492, 1, 1, 1, 1, 1,
1.078968, 0.4681539, -0.07070342, 1, 1, 1, 1, 1,
1.079855, -0.1688333, -0.3453158, 1, 1, 1, 1, 1,
1.080725, -0.1889953, 0.7946371, 1, 1, 1, 1, 1,
1.088251, 0.04158027, 1.315469, 1, 1, 1, 1, 1,
1.097202, -0.4412288, 2.837978, 1, 1, 1, 1, 1,
1.10249, 1.197325, -0.2316908, 1, 1, 1, 1, 1,
1.105116, 0.126694, 2.327338, 1, 1, 1, 1, 1,
1.115207, 0.5735019, 1.824999, 1, 1, 1, 1, 1,
1.117533, -0.01940542, 2.72715, 1, 1, 1, 1, 1,
1.117904, -1.07006, 2.301261, 1, 1, 1, 1, 1,
1.11834, -0.4368708, 3.007057, 1, 1, 1, 1, 1,
1.121037, 1.029224, 2.778907, 1, 1, 1, 1, 1,
1.12409, 0.7782465, 0.6380557, 0, 0, 1, 1, 1,
1.124956, 0.3755091, 3.224576, 1, 0, 0, 1, 1,
1.129346, 1.332542, 0.2544962, 1, 0, 0, 1, 1,
1.131958, 0.6704795, -0.4108734, 1, 0, 0, 1, 1,
1.149, -0.2406479, 1.604238, 1, 0, 0, 1, 1,
1.153293, -1.303701, 2.713942, 1, 0, 0, 1, 1,
1.153768, -0.8094674, 1.928893, 0, 0, 0, 1, 1,
1.15964, 0.05878308, 1.581327, 0, 0, 0, 1, 1,
1.161012, -0.2256831, 1.903614, 0, 0, 0, 1, 1,
1.167861, -0.3176717, 3.040037, 0, 0, 0, 1, 1,
1.17044, -1.498289, 1.832237, 0, 0, 0, 1, 1,
1.171295, -2.255099, 1.954064, 0, 0, 0, 1, 1,
1.171945, -0.5066857, 2.67222, 0, 0, 0, 1, 1,
1.176024, 0.4899781, 1.521124, 1, 1, 1, 1, 1,
1.178555, -0.6625912, 2.074066, 1, 1, 1, 1, 1,
1.178809, 1.693795, -0.09301401, 1, 1, 1, 1, 1,
1.182633, -1.036655, 3.088042, 1, 1, 1, 1, 1,
1.184514, -0.4597864, 0.3357968, 1, 1, 1, 1, 1,
1.186465, 0.7281923, 1.363719, 1, 1, 1, 1, 1,
1.188121, -0.572651, 2.772728, 1, 1, 1, 1, 1,
1.193143, 0.7810036, 0.6025749, 1, 1, 1, 1, 1,
1.206322, -0.4850776, 0.7646669, 1, 1, 1, 1, 1,
1.217091, -0.07589045, 3.110063, 1, 1, 1, 1, 1,
1.23205, -0.5138903, 2.704437, 1, 1, 1, 1, 1,
1.247774, -0.04026096, 0.7311818, 1, 1, 1, 1, 1,
1.248737, -0.1285425, 1.989465, 1, 1, 1, 1, 1,
1.249892, 0.509277, 1.608352, 1, 1, 1, 1, 1,
1.251392, -1.114641, 0.7359611, 1, 1, 1, 1, 1,
1.252852, -0.06289364, 1.281577, 0, 0, 1, 1, 1,
1.253433, 0.9262591, -0.2962386, 1, 0, 0, 1, 1,
1.268291, -0.4492453, 2.883521, 1, 0, 0, 1, 1,
1.282385, 0.4512315, -0.3627101, 1, 0, 0, 1, 1,
1.290596, 0.6108012, 1.559739, 1, 0, 0, 1, 1,
1.293296, 0.6485575, 1.070044, 1, 0, 0, 1, 1,
1.299911, 0.1672219, 1.775506, 0, 0, 0, 1, 1,
1.303057, 1.159489, 0.1715866, 0, 0, 0, 1, 1,
1.312585, 0.07585156, 1.916276, 0, 0, 0, 1, 1,
1.321071, -1.069445, 1.652021, 0, 0, 0, 1, 1,
1.323064, 0.5016606, 1.323317, 0, 0, 0, 1, 1,
1.333058, -0.3213267, 0.2684067, 0, 0, 0, 1, 1,
1.336577, -1.449209, 0.704988, 0, 0, 0, 1, 1,
1.345512, -0.08605569, 3.465168, 1, 1, 1, 1, 1,
1.372614, 0.7149047, -0.1597399, 1, 1, 1, 1, 1,
1.396819, 1.227031, 1.505188, 1, 1, 1, 1, 1,
1.397241, -0.03463653, 2.101721, 1, 1, 1, 1, 1,
1.400342, 2.243949, 0.4935271, 1, 1, 1, 1, 1,
1.403049, -1.099826, 2.681167, 1, 1, 1, 1, 1,
1.408569, -0.06599746, 1.169327, 1, 1, 1, 1, 1,
1.409184, 0.8790957, 2.732438, 1, 1, 1, 1, 1,
1.411257, 0.7492465, 2.528089, 1, 1, 1, 1, 1,
1.417422, 0.05991934, -0.05888506, 1, 1, 1, 1, 1,
1.420005, 1.026733, 2.154754, 1, 1, 1, 1, 1,
1.424688, -1.128396, 3.16536, 1, 1, 1, 1, 1,
1.425667, 0.2664588, 1.509442, 1, 1, 1, 1, 1,
1.428582, 0.495198, 1.590815, 1, 1, 1, 1, 1,
1.433492, 0.01606364, 3.002412, 1, 1, 1, 1, 1,
1.433733, -0.1599911, 0.2782214, 0, 0, 1, 1, 1,
1.440883, 0.6378341, 0.8181055, 1, 0, 0, 1, 1,
1.441287, -0.940374, 1.791543, 1, 0, 0, 1, 1,
1.456603, 0.3569548, 1.158522, 1, 0, 0, 1, 1,
1.4612, 0.7560973, 2.979261, 1, 0, 0, 1, 1,
1.474747, -0.9598141, 1.776192, 1, 0, 0, 1, 1,
1.475455, -0.5333709, 3.115029, 0, 0, 0, 1, 1,
1.476706, -1.020684, 4.952629, 0, 0, 0, 1, 1,
1.477376, 1.128764, 2.167011, 0, 0, 0, 1, 1,
1.488877, 0.186322, 1.53572, 0, 0, 0, 1, 1,
1.488996, -1.566747, 4.057, 0, 0, 0, 1, 1,
1.48972, 1.305723, -0.3050673, 0, 0, 0, 1, 1,
1.490372, -0.4041154, 1.779473, 0, 0, 0, 1, 1,
1.496146, -0.2252212, 0.7700039, 1, 1, 1, 1, 1,
1.505211, -0.4145016, 3.121486, 1, 1, 1, 1, 1,
1.510831, 2.599066, 1.497012, 1, 1, 1, 1, 1,
1.536903, -1.298102, -1.216423, 1, 1, 1, 1, 1,
1.542608, 0.7083546, 0.4872045, 1, 1, 1, 1, 1,
1.542778, 0.1739347, -0.2447547, 1, 1, 1, 1, 1,
1.54944, 1.218084, -0.08310641, 1, 1, 1, 1, 1,
1.552521, 0.9185923, 2.18858, 1, 1, 1, 1, 1,
1.552841, -0.6329399, 2.875872, 1, 1, 1, 1, 1,
1.567911, 0.4822755, 2.811057, 1, 1, 1, 1, 1,
1.57404, 0.02599131, 0.1608083, 1, 1, 1, 1, 1,
1.586197, -0.7309158, 3.258172, 1, 1, 1, 1, 1,
1.594201, -0.2808484, 2.505232, 1, 1, 1, 1, 1,
1.598382, -0.4459614, 0.450789, 1, 1, 1, 1, 1,
1.605583, -0.9526778, 2.620755, 1, 1, 1, 1, 1,
1.648503, 2.450818, 0.6375958, 0, 0, 1, 1, 1,
1.666161, 0.1634709, 1.361745, 1, 0, 0, 1, 1,
1.675405, 0.6358439, 0.4875771, 1, 0, 0, 1, 1,
1.719699, 1.104666, 2.077503, 1, 0, 0, 1, 1,
1.727775, 0.1721573, 2.372132, 1, 0, 0, 1, 1,
1.734812, -2.454739, 1.575964, 1, 0, 0, 1, 1,
1.737014, 1.423874, -0.3068993, 0, 0, 0, 1, 1,
1.758612, -0.09531281, 3.517735, 0, 0, 0, 1, 1,
1.775894, 0.1764131, 2.255191, 0, 0, 0, 1, 1,
1.778045, 1.617652, 2.505494, 0, 0, 0, 1, 1,
1.778293, 1.835084, 1.095456, 0, 0, 0, 1, 1,
1.782802, -1.697614, 3.160614, 0, 0, 0, 1, 1,
1.822346, -0.754833, 0.8672829, 0, 0, 0, 1, 1,
1.847105, 1.05379, 1.240489, 1, 1, 1, 1, 1,
1.857176, -1.144868, 0.4883013, 1, 1, 1, 1, 1,
1.85814, 0.1024876, 1.614347, 1, 1, 1, 1, 1,
1.869856, -1.207739, 0.5809938, 1, 1, 1, 1, 1,
1.882976, -0.3841154, 1.717338, 1, 1, 1, 1, 1,
1.890434, 1.418951, 2.388645, 1, 1, 1, 1, 1,
1.902401, -0.7127622, 1.771247, 1, 1, 1, 1, 1,
1.947852, -0.5484181, 1.152777, 1, 1, 1, 1, 1,
1.949024, 0.9304547, -0.6314875, 1, 1, 1, 1, 1,
1.959592, -0.4065846, 1.389265, 1, 1, 1, 1, 1,
1.974653, -0.9529858, 3.082684, 1, 1, 1, 1, 1,
1.994715, 0.3158334, 3.228409, 1, 1, 1, 1, 1,
2.007529, -1.430938, 2.156558, 1, 1, 1, 1, 1,
2.064184, 0.7061805, -0.3461856, 1, 1, 1, 1, 1,
2.091664, 0.6125863, 1.08724, 1, 1, 1, 1, 1,
2.105172, -0.1443559, 2.61402, 0, 0, 1, 1, 1,
2.116425, 0.5613452, 1.175642, 1, 0, 0, 1, 1,
2.129272, -0.8212683, 2.570356, 1, 0, 0, 1, 1,
2.15243, 0.6441023, 1.274119, 1, 0, 0, 1, 1,
2.165735, -0.9284937, 1.810042, 1, 0, 0, 1, 1,
2.173082, -0.04843411, 2.177241, 1, 0, 0, 1, 1,
2.226938, -0.4359901, 1.685189, 0, 0, 0, 1, 1,
2.241532, -0.2292198, 2.277674, 0, 0, 0, 1, 1,
2.255694, 0.6153457, 3.059447, 0, 0, 0, 1, 1,
2.279455, -2.337829, 1.946542, 0, 0, 0, 1, 1,
2.285509, -1.928407, 3.275537, 0, 0, 0, 1, 1,
2.302131, 1.192851, -0.6851716, 0, 0, 0, 1, 1,
2.329496, 2.272658, 1.07753, 0, 0, 0, 1, 1,
2.333705, -0.329125, 2.104642, 1, 1, 1, 1, 1,
2.391904, -0.1724702, 2.365686, 1, 1, 1, 1, 1,
2.421834, -0.9489679, 1.397587, 1, 1, 1, 1, 1,
2.599087, 0.5037261, 1.873297, 1, 1, 1, 1, 1,
2.645321, 1.563896, 1.796528, 1, 1, 1, 1, 1,
3.291746, 1.524178, 1.675158, 1, 1, 1, 1, 1,
3.478535, -0.8373088, 0.5454391, 1, 1, 1, 1, 1
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
var radius = 9.870404;
var distance = 34.66937;
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
mvMatrix.translate( -0.1165552, 0.003568649, -0.3642774 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.66937);
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
