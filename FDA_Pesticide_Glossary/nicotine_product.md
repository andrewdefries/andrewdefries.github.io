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
-2.802228, -2.085688, -0.2979925, 1, 0, 0, 1,
-2.774917, 0.221899, -0.5597001, 1, 0.007843138, 0, 1,
-2.501832, -0.8460057, -1.368736, 1, 0.01176471, 0, 1,
-2.472615, 0.9919258, 0.470111, 1, 0.01960784, 0, 1,
-2.440917, 0.9642414, -2.054504, 1, 0.02352941, 0, 1,
-2.327954, -1.280677, -2.507363, 1, 0.03137255, 0, 1,
-2.321599, -0.1023812, -3.080719, 1, 0.03529412, 0, 1,
-2.31423, 0.4639691, -1.398812, 1, 0.04313726, 0, 1,
-2.165913, 0.1379016, -2.311831, 1, 0.04705882, 0, 1,
-2.124456, 0.2012522, -1.778287, 1, 0.05490196, 0, 1,
-2.097556, 0.6795995, -0.1948069, 1, 0.05882353, 0, 1,
-2.085452, 1.500159, -0.3718373, 1, 0.06666667, 0, 1,
-2.03473, -0.1479692, 0.1854334, 1, 0.07058824, 0, 1,
-2.011919, 1.573853, -2.00335, 1, 0.07843138, 0, 1,
-2.007527, -1.488298, -3.338184, 1, 0.08235294, 0, 1,
-2.002063, 1.258142, 0.5579497, 1, 0.09019608, 0, 1,
-1.995188, -0.6150379, 1.243254, 1, 0.09411765, 0, 1,
-1.956652, 0.02519591, -2.139252, 1, 0.1019608, 0, 1,
-1.953928, -2.223842, -3.543299, 1, 0.1098039, 0, 1,
-1.937837, 0.7635315, 0.2185046, 1, 0.1137255, 0, 1,
-1.913879, 1.013255, -1.135349, 1, 0.1215686, 0, 1,
-1.856131, -0.619951, -3.415708, 1, 0.1254902, 0, 1,
-1.850168, -0.2864634, -2.498723, 1, 0.1333333, 0, 1,
-1.839489, -0.9565285, -1.968957, 1, 0.1372549, 0, 1,
-1.829119, 2.501161, -1.404509, 1, 0.145098, 0, 1,
-1.822247, 1.311894, -2.25161, 1, 0.1490196, 0, 1,
-1.805719, 1.515454, -1.269565, 1, 0.1568628, 0, 1,
-1.793067, 0.7036692, -0.9511039, 1, 0.1607843, 0, 1,
-1.775648, 1.35817, -0.04577649, 1, 0.1686275, 0, 1,
-1.774733, 0.3036718, -1.537734, 1, 0.172549, 0, 1,
-1.746722, 0.7986254, -1.251915, 1, 0.1803922, 0, 1,
-1.714464, -1.806282, -1.043106, 1, 0.1843137, 0, 1,
-1.704336, 1.87303, -1.370942, 1, 0.1921569, 0, 1,
-1.682503, -1.07716, -1.440246, 1, 0.1960784, 0, 1,
-1.679982, -0.01278264, -3.037905, 1, 0.2039216, 0, 1,
-1.679696, -0.09852902, -2.807732, 1, 0.2117647, 0, 1,
-1.678574, -0.3121208, -3.430808, 1, 0.2156863, 0, 1,
-1.670882, 0.2673474, 0.1840127, 1, 0.2235294, 0, 1,
-1.667698, -1.992682, -1.923091, 1, 0.227451, 0, 1,
-1.658944, -0.1396139, -1.859681, 1, 0.2352941, 0, 1,
-1.653129, 0.6344971, -0.7325236, 1, 0.2392157, 0, 1,
-1.649532, 1.502489, 0.1203725, 1, 0.2470588, 0, 1,
-1.641326, 1.145691, -0.9836803, 1, 0.2509804, 0, 1,
-1.638574, 0.4108098, -1.207817, 1, 0.2588235, 0, 1,
-1.619561, 0.4347954, -0.4045774, 1, 0.2627451, 0, 1,
-1.61824, -0.2366422, -3.039359, 1, 0.2705882, 0, 1,
-1.607884, -1.227626, -3.000629, 1, 0.2745098, 0, 1,
-1.572563, -0.758579, -2.821953, 1, 0.282353, 0, 1,
-1.566892, -0.3678834, -1.618871, 1, 0.2862745, 0, 1,
-1.55339, 1.682137, -1.01119, 1, 0.2941177, 0, 1,
-1.55042, -1.286709, -2.060494, 1, 0.3019608, 0, 1,
-1.534195, 1.371292, -1.781011, 1, 0.3058824, 0, 1,
-1.524838, 0.6015165, -0.06654198, 1, 0.3137255, 0, 1,
-1.509708, -0.9881005, -3.423335, 1, 0.3176471, 0, 1,
-1.509112, 0.9025202, -1.719262, 1, 0.3254902, 0, 1,
-1.490402, 0.5619163, -2.201159, 1, 0.3294118, 0, 1,
-1.489497, -0.6127023, -1.115158, 1, 0.3372549, 0, 1,
-1.48875, 1.4411, -2.030746, 1, 0.3411765, 0, 1,
-1.469331, 0.7673756, 0.3222162, 1, 0.3490196, 0, 1,
-1.464054, 2.522086, 0.5483817, 1, 0.3529412, 0, 1,
-1.461434, -0.5980537, -3.588444, 1, 0.3607843, 0, 1,
-1.454764, -0.7654294, -2.174434, 1, 0.3647059, 0, 1,
-1.44773, -0.1135319, -1.821765, 1, 0.372549, 0, 1,
-1.445198, 2.267383, -1.296647, 1, 0.3764706, 0, 1,
-1.443417, 1.23664, -1.587021, 1, 0.3843137, 0, 1,
-1.441218, 0.008991323, -1.524099, 1, 0.3882353, 0, 1,
-1.438391, 1.686254, 0.2516569, 1, 0.3960784, 0, 1,
-1.413926, 0.5801404, -1.090344, 1, 0.4039216, 0, 1,
-1.40971, 0.1413213, -0.1347174, 1, 0.4078431, 0, 1,
-1.402784, 0.419019, -1.177208, 1, 0.4156863, 0, 1,
-1.368798, -1.386061, -2.74579, 1, 0.4196078, 0, 1,
-1.366378, -0.6060123, -1.860912, 1, 0.427451, 0, 1,
-1.365561, -0.09139313, -2.150241, 1, 0.4313726, 0, 1,
-1.364589, -0.5193728, -1.303882, 1, 0.4392157, 0, 1,
-1.362158, 0.5397517, -0.6041788, 1, 0.4431373, 0, 1,
-1.35773, -0.7963875, -2.023257, 1, 0.4509804, 0, 1,
-1.351587, -1.605099, -2.164832, 1, 0.454902, 0, 1,
-1.35156, -0.04294704, -2.452182, 1, 0.4627451, 0, 1,
-1.350063, -0.3971677, -0.6858267, 1, 0.4666667, 0, 1,
-1.334426, 1.277306, -2.582523, 1, 0.4745098, 0, 1,
-1.327466, 0.5931501, -0.4441734, 1, 0.4784314, 0, 1,
-1.320965, -0.298327, -2.549942, 1, 0.4862745, 0, 1,
-1.31945, -0.03868939, 0.2160442, 1, 0.4901961, 0, 1,
-1.317362, -1.76129, -2.501677, 1, 0.4980392, 0, 1,
-1.317031, 0.5051383, -2.060068, 1, 0.5058824, 0, 1,
-1.315036, -0.8285475, -0.9662287, 1, 0.509804, 0, 1,
-1.300797, 0.8339741, 0.5057339, 1, 0.5176471, 0, 1,
-1.293423, 1.246936, -0.9089113, 1, 0.5215687, 0, 1,
-1.283271, -0.3647757, -2.131472, 1, 0.5294118, 0, 1,
-1.281084, -0.2699061, -1.176836, 1, 0.5333334, 0, 1,
-1.280527, 1.812085, 0.004332835, 1, 0.5411765, 0, 1,
-1.272667, 0.6760802, 1.020846, 1, 0.5450981, 0, 1,
-1.266282, 1.004667, -0.6248228, 1, 0.5529412, 0, 1,
-1.263197, 1.444271, -2.168707, 1, 0.5568628, 0, 1,
-1.261802, -0.952167, -1.696634, 1, 0.5647059, 0, 1,
-1.252434, 2.425001, 0.361447, 1, 0.5686275, 0, 1,
-1.251191, 0.4495665, -2.587337, 1, 0.5764706, 0, 1,
-1.247213, -0.08018148, -0.9044781, 1, 0.5803922, 0, 1,
-1.242922, 0.6619146, 0.640406, 1, 0.5882353, 0, 1,
-1.23317, 0.6360366, -0.9965646, 1, 0.5921569, 0, 1,
-1.230105, -0.07956027, -2.040315, 1, 0.6, 0, 1,
-1.228451, -0.7098092, -3.597787, 1, 0.6078432, 0, 1,
-1.227734, -1.675868, -2.776458, 1, 0.6117647, 0, 1,
-1.222139, -1.821477, -4.11447, 1, 0.6196079, 0, 1,
-1.220876, -1.597877, -4.349015, 1, 0.6235294, 0, 1,
-1.217753, -1.391406, -3.18526, 1, 0.6313726, 0, 1,
-1.215035, -0.3863871, -2.818956, 1, 0.6352941, 0, 1,
-1.211363, 1.455444, 0.2980066, 1, 0.6431373, 0, 1,
-1.208486, -0.1898218, -1.705643, 1, 0.6470588, 0, 1,
-1.195665, -0.7972038, -1.45604, 1, 0.654902, 0, 1,
-1.19328, -1.520677, -1.680654, 1, 0.6588235, 0, 1,
-1.188192, -1.423417, -3.247647, 1, 0.6666667, 0, 1,
-1.175333, -0.7316305, -1.174779, 1, 0.6705883, 0, 1,
-1.163218, -0.1397266, -1.455855, 1, 0.6784314, 0, 1,
-1.161386, -0.4893689, -0.7084436, 1, 0.682353, 0, 1,
-1.160012, -0.6638633, -1.225135, 1, 0.6901961, 0, 1,
-1.158368, 0.06637759, 0.5940674, 1, 0.6941177, 0, 1,
-1.152932, 0.2094865, -1.314165, 1, 0.7019608, 0, 1,
-1.149197, -0.9983301, -3.275155, 1, 0.7098039, 0, 1,
-1.145723, -0.007889137, -0.7202732, 1, 0.7137255, 0, 1,
-1.145483, -0.2782437, -1.067884, 1, 0.7215686, 0, 1,
-1.142105, -0.02268088, -3.091958, 1, 0.7254902, 0, 1,
-1.1384, -0.1638409, -1.551669, 1, 0.7333333, 0, 1,
-1.136489, 2.06594, -1.100816, 1, 0.7372549, 0, 1,
-1.134785, -1.21508, -3.069101, 1, 0.7450981, 0, 1,
-1.128932, -0.2161152, -2.747361, 1, 0.7490196, 0, 1,
-1.125695, 0.2182584, -1.818745, 1, 0.7568628, 0, 1,
-1.108062, 1.798688, -1.32843, 1, 0.7607843, 0, 1,
-1.104388, -1.675267, -3.137127, 1, 0.7686275, 0, 1,
-1.10352, 0.3984026, -0.4863027, 1, 0.772549, 0, 1,
-1.097211, 0.2870898, -2.087972, 1, 0.7803922, 0, 1,
-1.090501, -0.2530608, -2.88491, 1, 0.7843137, 0, 1,
-1.083759, 0.2255254, -1.025246, 1, 0.7921569, 0, 1,
-1.083507, -0.5428887, -2.362244, 1, 0.7960784, 0, 1,
-1.080854, 0.4029015, -0.28474, 1, 0.8039216, 0, 1,
-1.079942, 0.07802881, -0.8210486, 1, 0.8117647, 0, 1,
-1.075572, 0.9141098, -0.9478649, 1, 0.8156863, 0, 1,
-1.071394, -0.9494475, -0.07884363, 1, 0.8235294, 0, 1,
-1.060851, 0.2234061, -1.258326, 1, 0.827451, 0, 1,
-1.059112, -1.191166, -3.837466, 1, 0.8352941, 0, 1,
-1.056956, 1.568485, -0.1822834, 1, 0.8392157, 0, 1,
-1.053161, -0.02425986, -1.701673, 1, 0.8470588, 0, 1,
-1.048797, 0.6890735, 0.3215685, 1, 0.8509804, 0, 1,
-1.046236, -1.642681, -3.039078, 1, 0.8588235, 0, 1,
-1.04362, -0.654489, -3.047243, 1, 0.8627451, 0, 1,
-1.034012, 1.31436, -0.3939788, 1, 0.8705882, 0, 1,
-1.029079, 0.1805439, -0.6211918, 1, 0.8745098, 0, 1,
-1.026795, 1.981591, -2.233261, 1, 0.8823529, 0, 1,
-1.023608, 0.8548853, 0.5296631, 1, 0.8862745, 0, 1,
-1.023599, 1.064515, -0.4443474, 1, 0.8941177, 0, 1,
-1.02235, 0.8267267, -1.224903, 1, 0.8980392, 0, 1,
-1.016792, 0.118151, -1.544048, 1, 0.9058824, 0, 1,
-1.01508, 0.9485258, -0.742765, 1, 0.9137255, 0, 1,
-1.008891, 1.294999, -0.6238856, 1, 0.9176471, 0, 1,
-0.9967513, 0.02065345, -1.56318, 1, 0.9254902, 0, 1,
-0.9955631, -0.4425995, -1.785475, 1, 0.9294118, 0, 1,
-0.9952235, 0.2038999, -2.532249, 1, 0.9372549, 0, 1,
-0.9942366, 0.07100851, -0.9304645, 1, 0.9411765, 0, 1,
-0.9865512, 1.490158, -1.222612, 1, 0.9490196, 0, 1,
-0.9831882, -0.1101813, -2.324985, 1, 0.9529412, 0, 1,
-0.9814199, 1.44601, -0.5203809, 1, 0.9607843, 0, 1,
-0.9787007, -0.01255339, -1.357285, 1, 0.9647059, 0, 1,
-0.9782455, 1.120567, -1.742276, 1, 0.972549, 0, 1,
-0.9703605, -0.1546345, -0.4938184, 1, 0.9764706, 0, 1,
-0.9625099, 0.5748207, -2.465157, 1, 0.9843137, 0, 1,
-0.9601379, -0.1640404, -1.480248, 1, 0.9882353, 0, 1,
-0.9595282, -0.3221076, -3.888687, 1, 0.9960784, 0, 1,
-0.9529188, 1.338534, 1.110157, 0.9960784, 1, 0, 1,
-0.9491318, 0.5412789, -0.2728566, 0.9921569, 1, 0, 1,
-0.9448897, 1.179383, -0.3297321, 0.9843137, 1, 0, 1,
-0.9448556, -0.7039729, -3.251027, 0.9803922, 1, 0, 1,
-0.9415452, 0.4975579, -3.075056, 0.972549, 1, 0, 1,
-0.9410715, -0.3079905, -1.977926, 0.9686275, 1, 0, 1,
-0.9304817, 1.498612, -0.5387377, 0.9607843, 1, 0, 1,
-0.9302012, 1.288977, 0.1604671, 0.9568627, 1, 0, 1,
-0.9277223, 1.148734, -2.91896, 0.9490196, 1, 0, 1,
-0.9163758, -2.402738, -2.51562, 0.945098, 1, 0, 1,
-0.9056543, -0.07009517, -2.120902, 0.9372549, 1, 0, 1,
-0.9056144, 0.0394229, -2.380008, 0.9333333, 1, 0, 1,
-0.8957306, 0.5113011, -1.17801, 0.9254902, 1, 0, 1,
-0.8869641, -1.299945, -1.982511, 0.9215686, 1, 0, 1,
-0.8868095, 0.8327196, 0.1790672, 0.9137255, 1, 0, 1,
-0.8843487, 0.3858979, -1.993228, 0.9098039, 1, 0, 1,
-0.8810087, -1.113791, -3.335526, 0.9019608, 1, 0, 1,
-0.8802955, -1.441875, -2.185323, 0.8941177, 1, 0, 1,
-0.8800945, -0.8513013, -1.282638, 0.8901961, 1, 0, 1,
-0.8760843, -0.4572522, -2.300647, 0.8823529, 1, 0, 1,
-0.8758589, -2.018741, -3.349351, 0.8784314, 1, 0, 1,
-0.8710527, 0.6491372, -2.826044, 0.8705882, 1, 0, 1,
-0.863137, -0.2595149, -2.886831, 0.8666667, 1, 0, 1,
-0.8546829, -0.5544425, -1.443709, 0.8588235, 1, 0, 1,
-0.8538096, 0.7118444, -2.096149, 0.854902, 1, 0, 1,
-0.8535222, -0.007390147, -2.806895, 0.8470588, 1, 0, 1,
-0.8527645, -0.1045593, -0.8990886, 0.8431373, 1, 0, 1,
-0.848675, 0.7687517, -0.4193581, 0.8352941, 1, 0, 1,
-0.8372282, -0.1927841, -2.481604, 0.8313726, 1, 0, 1,
-0.8299513, 1.463661, -1.990619, 0.8235294, 1, 0, 1,
-0.8273184, 1.308826, -1.479156, 0.8196079, 1, 0, 1,
-0.8231145, 0.4533532, -0.8074927, 0.8117647, 1, 0, 1,
-0.8226878, -0.06663959, -2.583472, 0.8078431, 1, 0, 1,
-0.8104041, -1.362991, -2.146315, 0.8, 1, 0, 1,
-0.809576, -0.7967253, -3.922696, 0.7921569, 1, 0, 1,
-0.802605, 0.5477165, 0.07169817, 0.7882353, 1, 0, 1,
-0.798381, -1.299999, -3.432195, 0.7803922, 1, 0, 1,
-0.7971755, 1.197811, -0.8292636, 0.7764706, 1, 0, 1,
-0.7943212, -0.5361816, -3.564589, 0.7686275, 1, 0, 1,
-0.7894799, -1.33683, -4.276159, 0.7647059, 1, 0, 1,
-0.7780793, -0.1953972, -0.5026909, 0.7568628, 1, 0, 1,
-0.7715507, -1.277056, -2.071989, 0.7529412, 1, 0, 1,
-0.7677999, -2.091408, -3.074341, 0.7450981, 1, 0, 1,
-0.7670237, 0.6583269, -0.4869172, 0.7411765, 1, 0, 1,
-0.7667713, -0.8568855, -3.752055, 0.7333333, 1, 0, 1,
-0.7644542, 0.2255182, -1.526584, 0.7294118, 1, 0, 1,
-0.7634379, -0.1704692, -1.446674, 0.7215686, 1, 0, 1,
-0.7542027, 0.2071821, -0.8484349, 0.7176471, 1, 0, 1,
-0.7536579, 1.497818, 1.533806, 0.7098039, 1, 0, 1,
-0.7436443, -1.162235, -1.730661, 0.7058824, 1, 0, 1,
-0.7420324, -0.2268883, -2.394475, 0.6980392, 1, 0, 1,
-0.7402402, 0.4497793, -0.9737218, 0.6901961, 1, 0, 1,
-0.7401263, 0.7658929, -0.3616463, 0.6862745, 1, 0, 1,
-0.7375908, 0.4622576, -0.7503044, 0.6784314, 1, 0, 1,
-0.7340305, -1.850425, -2.919153, 0.6745098, 1, 0, 1,
-0.7335458, 0.5475534, -1.870253, 0.6666667, 1, 0, 1,
-0.7284341, 1.541558, -0.5968005, 0.6627451, 1, 0, 1,
-0.7274314, 0.4467759, -2.108367, 0.654902, 1, 0, 1,
-0.7263641, 1.557437, 0.3863981, 0.6509804, 1, 0, 1,
-0.7167552, -1.054421, -0.5115095, 0.6431373, 1, 0, 1,
-0.7085787, 0.8100522, -0.2112244, 0.6392157, 1, 0, 1,
-0.7028074, 0.1065648, -1.38145, 0.6313726, 1, 0, 1,
-0.7012401, 2.006, -0.1032559, 0.627451, 1, 0, 1,
-0.6979877, -1.133466, -1.813561, 0.6196079, 1, 0, 1,
-0.6967025, 0.1994529, -0.3601779, 0.6156863, 1, 0, 1,
-0.6958213, -0.181554, -1.621464, 0.6078432, 1, 0, 1,
-0.6955786, 0.5528583, -1.390224, 0.6039216, 1, 0, 1,
-0.6941151, 1.74805, 0.3479652, 0.5960785, 1, 0, 1,
-0.6896718, -0.6923994, -3.357905, 0.5882353, 1, 0, 1,
-0.6880078, 0.1292173, -2.327918, 0.5843138, 1, 0, 1,
-0.6872001, -0.2637454, -1.984705, 0.5764706, 1, 0, 1,
-0.6839552, 0.3980411, -2.951666, 0.572549, 1, 0, 1,
-0.6837173, 0.5133729, -0.4680402, 0.5647059, 1, 0, 1,
-0.6787101, 0.3807854, -2.675202, 0.5607843, 1, 0, 1,
-0.6765955, -0.003686021, 1.152843, 0.5529412, 1, 0, 1,
-0.6755706, -0.7192143, -3.184428, 0.5490196, 1, 0, 1,
-0.6737697, 0.4922822, -1.462266, 0.5411765, 1, 0, 1,
-0.6730901, -0.2637366, -1.040159, 0.5372549, 1, 0, 1,
-0.6725051, -1.234608, -2.983757, 0.5294118, 1, 0, 1,
-0.6705425, 0.3176037, -2.681615, 0.5254902, 1, 0, 1,
-0.6675366, 1.162135, -1.487529, 0.5176471, 1, 0, 1,
-0.6653276, 0.5247028, 0.6703526, 0.5137255, 1, 0, 1,
-0.6642503, 1.02614, -0.9468102, 0.5058824, 1, 0, 1,
-0.6639383, 0.7180861, -2.872311, 0.5019608, 1, 0, 1,
-0.6617674, -1.620661, -2.213614, 0.4941176, 1, 0, 1,
-0.660745, 0.9122485, 0.1392952, 0.4862745, 1, 0, 1,
-0.658257, -0.05289505, -1.575525, 0.4823529, 1, 0, 1,
-0.6549568, 0.9810782, -0.835705, 0.4745098, 1, 0, 1,
-0.6529925, 1.22667, -0.03739543, 0.4705882, 1, 0, 1,
-0.652578, -0.7630122, -3.546396, 0.4627451, 1, 0, 1,
-0.6509636, 0.5958413, 0.3041446, 0.4588235, 1, 0, 1,
-0.6459822, 0.6492136, -1.609482, 0.4509804, 1, 0, 1,
-0.6404958, -0.5215824, 0.2016902, 0.4470588, 1, 0, 1,
-0.638611, 0.007379606, -1.829785, 0.4392157, 1, 0, 1,
-0.6383618, -0.4521556, -2.225185, 0.4352941, 1, 0, 1,
-0.6340245, 0.7327452, 0.6998615, 0.427451, 1, 0, 1,
-0.6266401, 1.307858, 0.6885889, 0.4235294, 1, 0, 1,
-0.6242511, -0.06351434, -1.047073, 0.4156863, 1, 0, 1,
-0.6177235, 0.2925201, -0.1253555, 0.4117647, 1, 0, 1,
-0.6155546, 0.2491459, -0.3272305, 0.4039216, 1, 0, 1,
-0.6136311, 0.8946862, -0.480485, 0.3960784, 1, 0, 1,
-0.6133718, 0.9527965, 0.102045, 0.3921569, 1, 0, 1,
-0.6126506, 0.8553418, 0.7923378, 0.3843137, 1, 0, 1,
-0.6076843, 1.140641, -1.24937, 0.3803922, 1, 0, 1,
-0.6040742, 0.1029067, -0.3208629, 0.372549, 1, 0, 1,
-0.6025502, 0.3716856, -1.600968, 0.3686275, 1, 0, 1,
-0.5991064, -0.4526981, -2.451508, 0.3607843, 1, 0, 1,
-0.5986528, -0.568397, -2.284828, 0.3568628, 1, 0, 1,
-0.5952285, -0.2053597, -2.022119, 0.3490196, 1, 0, 1,
-0.5914424, -1.566673, -1.227501, 0.345098, 1, 0, 1,
-0.5863042, -0.4162406, -1.360488, 0.3372549, 1, 0, 1,
-0.5836319, 0.3608125, -2.231957, 0.3333333, 1, 0, 1,
-0.5806469, -1.29515, -2.273922, 0.3254902, 1, 0, 1,
-0.5789163, -2.134083, -1.025633, 0.3215686, 1, 0, 1,
-0.5785494, 1.336353, -0.3866613, 0.3137255, 1, 0, 1,
-0.5785241, -0.515856, -2.703074, 0.3098039, 1, 0, 1,
-0.5780119, 0.2143159, 0.2376439, 0.3019608, 1, 0, 1,
-0.5757051, -0.2818915, -2.458212, 0.2941177, 1, 0, 1,
-0.5738913, -0.3595946, -1.326676, 0.2901961, 1, 0, 1,
-0.5712848, 0.09346454, -2.949003, 0.282353, 1, 0, 1,
-0.5690846, -0.5257638, -1.749155, 0.2784314, 1, 0, 1,
-0.5649144, -0.1753252, -2.904562, 0.2705882, 1, 0, 1,
-0.5646991, -0.1151483, -2.656922, 0.2666667, 1, 0, 1,
-0.5643821, 0.7026803, 0.07069146, 0.2588235, 1, 0, 1,
-0.5591682, -0.1602257, -0.7320768, 0.254902, 1, 0, 1,
-0.5591364, 1.833118, -1.334811, 0.2470588, 1, 0, 1,
-0.5547065, -1.672604, -3.086828, 0.2431373, 1, 0, 1,
-0.5540518, -0.2136596, -1.953538, 0.2352941, 1, 0, 1,
-0.5493827, -0.6749984, -1.946999, 0.2313726, 1, 0, 1,
-0.5437939, -1.053441, -1.748188, 0.2235294, 1, 0, 1,
-0.5412266, 1.308796, 1.04283, 0.2196078, 1, 0, 1,
-0.5362349, -0.7982011, -2.556175, 0.2117647, 1, 0, 1,
-0.535818, 0.2314369, -1.413436, 0.2078431, 1, 0, 1,
-0.5326908, 0.007309443, -1.896531, 0.2, 1, 0, 1,
-0.5326386, -1.834282, -0.5629604, 0.1921569, 1, 0, 1,
-0.5325586, 2.036285, 1.10246, 0.1882353, 1, 0, 1,
-0.529249, 0.004919092, -2.757172, 0.1803922, 1, 0, 1,
-0.5280943, 0.3931082, 0.3514439, 0.1764706, 1, 0, 1,
-0.5273298, -0.05121431, -0.7978751, 0.1686275, 1, 0, 1,
-0.525196, -0.6326823, -2.443146, 0.1647059, 1, 0, 1,
-0.5212516, 1.056159, 0.7388008, 0.1568628, 1, 0, 1,
-0.520382, -0.1513906, -3.814961, 0.1529412, 1, 0, 1,
-0.5195228, 1.556309, -1.981095, 0.145098, 1, 0, 1,
-0.5151051, -0.7076485, -2.044795, 0.1411765, 1, 0, 1,
-0.5144801, 0.4870443, -1.649074, 0.1333333, 1, 0, 1,
-0.510707, -1.122891, -4.999856, 0.1294118, 1, 0, 1,
-0.5100309, 1.150516, 0.4304357, 0.1215686, 1, 0, 1,
-0.5084631, -0.2117155, -2.444724, 0.1176471, 1, 0, 1,
-0.5074078, -0.3205296, -0.3868198, 0.1098039, 1, 0, 1,
-0.5059308, 0.3277203, -0.5837601, 0.1058824, 1, 0, 1,
-0.5000548, 1.331654, -1.172178, 0.09803922, 1, 0, 1,
-0.4989311, 1.17096, -0.4756682, 0.09019608, 1, 0, 1,
-0.4987051, 1.497997, -0.2525621, 0.08627451, 1, 0, 1,
-0.4973448, 0.446595, -0.3125057, 0.07843138, 1, 0, 1,
-0.4966196, 1.133714, 0.4931997, 0.07450981, 1, 0, 1,
-0.4912504, 0.9282609, -0.8922102, 0.06666667, 1, 0, 1,
-0.4878534, 0.1258965, -1.378416, 0.0627451, 1, 0, 1,
-0.4830393, 1.045717, -1.397326, 0.05490196, 1, 0, 1,
-0.4787284, 0.8837373, -1.617842, 0.05098039, 1, 0, 1,
-0.4754001, 1.008915, -1.015296, 0.04313726, 1, 0, 1,
-0.4746756, -1.072319, -2.428696, 0.03921569, 1, 0, 1,
-0.4746583, -3.0926, -4.590962, 0.03137255, 1, 0, 1,
-0.4723114, -1.645956, -2.899821, 0.02745098, 1, 0, 1,
-0.4707708, 0.05827553, -0.8437575, 0.01960784, 1, 0, 1,
-0.4701753, 0.6439277, 0.6032068, 0.01568628, 1, 0, 1,
-0.4621421, -0.4604614, -1.632376, 0.007843138, 1, 0, 1,
-0.4615798, 0.4937061, -0.8170648, 0.003921569, 1, 0, 1,
-0.4558754, -0.9717429, -1.520496, 0, 1, 0.003921569, 1,
-0.4517279, -0.3129032, -3.6364, 0, 1, 0.01176471, 1,
-0.4490599, -0.4248566, -1.934675, 0, 1, 0.01568628, 1,
-0.4485075, 1.06772, 1.147625, 0, 1, 0.02352941, 1,
-0.4405523, -0.8978675, -2.329529, 0, 1, 0.02745098, 1,
-0.4342118, -2.145541, -2.36239, 0, 1, 0.03529412, 1,
-0.4330619, 0.6729621, 1.531157, 0, 1, 0.03921569, 1,
-0.43121, 0.9008554, -0.8044887, 0, 1, 0.04705882, 1,
-0.427255, 0.3937622, -1.317771, 0, 1, 0.05098039, 1,
-0.4231701, -0.097471, -1.168803, 0, 1, 0.05882353, 1,
-0.4230758, -0.208268, -1.353609, 0, 1, 0.0627451, 1,
-0.4203288, 0.01935496, -1.971655, 0, 1, 0.07058824, 1,
-0.4203207, -1.022232, -1.753797, 0, 1, 0.07450981, 1,
-0.4200638, 0.03298518, -1.489213, 0, 1, 0.08235294, 1,
-0.4194871, 1.328672, 1.388943, 0, 1, 0.08627451, 1,
-0.4151421, -0.8751849, -2.678035, 0, 1, 0.09411765, 1,
-0.4140994, -0.7857575, -2.440694, 0, 1, 0.1019608, 1,
-0.4135918, 1.074467, -2.357723, 0, 1, 0.1058824, 1,
-0.4131764, -0.2788927, -2.207207, 0, 1, 0.1137255, 1,
-0.4118598, 0.3326401, -0.8300998, 0, 1, 0.1176471, 1,
-0.4090449, 0.5671256, -0.3275926, 0, 1, 0.1254902, 1,
-0.4053341, -0.6310421, -3.108972, 0, 1, 0.1294118, 1,
-0.4016934, -0.5393608, -3.221104, 0, 1, 0.1372549, 1,
-0.3946318, 1.835028, 0.2012565, 0, 1, 0.1411765, 1,
-0.3929136, -1.065549, -3.333116, 0, 1, 0.1490196, 1,
-0.3891303, 0.06039852, -0.5528334, 0, 1, 0.1529412, 1,
-0.3876975, -0.2024319, -2.37136, 0, 1, 0.1607843, 1,
-0.385005, 0.4981167, 0.246576, 0, 1, 0.1647059, 1,
-0.376579, 0.4905102, -1.513395, 0, 1, 0.172549, 1,
-0.3746621, -1.154883, -1.728828, 0, 1, 0.1764706, 1,
-0.3708109, -1.56428, -2.666922, 0, 1, 0.1843137, 1,
-0.3705521, -0.5421619, -1.232393, 0, 1, 0.1882353, 1,
-0.3702839, -0.8268815, -2.175362, 0, 1, 0.1960784, 1,
-0.3691117, -0.6798269, -2.274858, 0, 1, 0.2039216, 1,
-0.366519, -0.07184812, -2.488036, 0, 1, 0.2078431, 1,
-0.3644662, 0.6573835, -2.220371, 0, 1, 0.2156863, 1,
-0.3644006, 0.7646337, 1.270653, 0, 1, 0.2196078, 1,
-0.362771, 1.343083, -0.2849625, 0, 1, 0.227451, 1,
-0.362314, -0.685595, -2.78152, 0, 1, 0.2313726, 1,
-0.3553596, 2.466784, -1.229496, 0, 1, 0.2392157, 1,
-0.3547981, -0.1073316, -0.6638345, 0, 1, 0.2431373, 1,
-0.3544295, -0.7386777, -2.052196, 0, 1, 0.2509804, 1,
-0.3525054, -2.129408, -2.306979, 0, 1, 0.254902, 1,
-0.3458402, -1.347197, -2.161122, 0, 1, 0.2627451, 1,
-0.3433593, -0.7449888, -3.272885, 0, 1, 0.2666667, 1,
-0.3403291, -0.4616048, -3.757121, 0, 1, 0.2745098, 1,
-0.3366674, 1.613042, -1.696239, 0, 1, 0.2784314, 1,
-0.336423, -0.01735491, -2.52711, 0, 1, 0.2862745, 1,
-0.3351235, -0.5857366, -2.469985, 0, 1, 0.2901961, 1,
-0.333444, -0.730454, -3.027551, 0, 1, 0.2980392, 1,
-0.3329849, 0.01433828, -0.6639639, 0, 1, 0.3058824, 1,
-0.3327347, 1.377692, 0.3246077, 0, 1, 0.3098039, 1,
-0.3251894, -0.700712, -2.295407, 0, 1, 0.3176471, 1,
-0.3245201, 0.6971455, -1.059144, 0, 1, 0.3215686, 1,
-0.3236369, 0.4341548, -0.1817443, 0, 1, 0.3294118, 1,
-0.3231973, -0.01570012, -0.9827321, 0, 1, 0.3333333, 1,
-0.3206175, 0.7753499, -0.9891311, 0, 1, 0.3411765, 1,
-0.3203472, -0.7674762, -2.789233, 0, 1, 0.345098, 1,
-0.314741, -1.018172, -2.59253, 0, 1, 0.3529412, 1,
-0.3135575, 0.4079773, -0.08164385, 0, 1, 0.3568628, 1,
-0.3047515, -1.048754, -0.7626107, 0, 1, 0.3647059, 1,
-0.3039547, 2.200947, 0.5280594, 0, 1, 0.3686275, 1,
-0.3039491, 0.4052235, 1.011588, 0, 1, 0.3764706, 1,
-0.3039015, 0.1805474, -0.08978555, 0, 1, 0.3803922, 1,
-0.3031675, -0.9307269, -2.524824, 0, 1, 0.3882353, 1,
-0.3009709, -1.300709, -2.261361, 0, 1, 0.3921569, 1,
-0.2982524, -0.3191335, -1.290704, 0, 1, 0.4, 1,
-0.2979528, 0.06813311, -0.6859041, 0, 1, 0.4078431, 1,
-0.2958816, 1.604362, 0.3300216, 0, 1, 0.4117647, 1,
-0.295378, -0.5459328, -3.445283, 0, 1, 0.4196078, 1,
-0.2946087, 1.632432, -0.3428334, 0, 1, 0.4235294, 1,
-0.2880281, -0.2419484, -2.429108, 0, 1, 0.4313726, 1,
-0.2879691, -0.9636497, -2.041649, 0, 1, 0.4352941, 1,
-0.2872166, 0.8354937, -0.7591601, 0, 1, 0.4431373, 1,
-0.2827379, 0.2537362, -1.176099, 0, 1, 0.4470588, 1,
-0.2807162, -1.788718, -2.730596, 0, 1, 0.454902, 1,
-0.2805491, -0.9693878, -3.31987, 0, 1, 0.4588235, 1,
-0.2779585, 0.3097054, 0.4466866, 0, 1, 0.4666667, 1,
-0.2751613, 0.3089974, -2.055091, 0, 1, 0.4705882, 1,
-0.2725669, -1.292057, -3.981509, 0, 1, 0.4784314, 1,
-0.2712845, 0.01347892, -1.528876, 0, 1, 0.4823529, 1,
-0.269608, 2.044744, -0.6687546, 0, 1, 0.4901961, 1,
-0.2678658, 0.6023659, -0.944523, 0, 1, 0.4941176, 1,
-0.2619501, 1.490062, -0.08194535, 0, 1, 0.5019608, 1,
-0.2611283, -0.5155511, -0.7825199, 0, 1, 0.509804, 1,
-0.2601443, -1.524743, -2.861214, 0, 1, 0.5137255, 1,
-0.2581694, 1.143876, 1.071086, 0, 1, 0.5215687, 1,
-0.2508415, -0.9978523, -2.290312, 0, 1, 0.5254902, 1,
-0.2501481, -0.1443364, -2.427534, 0, 1, 0.5333334, 1,
-0.2491035, -0.153303, -3.426006, 0, 1, 0.5372549, 1,
-0.2441455, 0.822764, -0.2849732, 0, 1, 0.5450981, 1,
-0.24096, 0.3001652, -1.484634, 0, 1, 0.5490196, 1,
-0.2372954, -2.282641, -3.096166, 0, 1, 0.5568628, 1,
-0.232247, -0.1328837, -0.438926, 0, 1, 0.5607843, 1,
-0.2303576, 1.492898, -1.454476, 0, 1, 0.5686275, 1,
-0.2226876, 0.1856379, -0.7784522, 0, 1, 0.572549, 1,
-0.2201301, 1.103932, 1.319587, 0, 1, 0.5803922, 1,
-0.2197118, -0.1033945, -1.552547, 0, 1, 0.5843138, 1,
-0.2179589, 2.480471, -0.5213974, 0, 1, 0.5921569, 1,
-0.2176804, -0.9357671, -4.098378, 0, 1, 0.5960785, 1,
-0.2158737, 1.102704, 0.3654899, 0, 1, 0.6039216, 1,
-0.2151977, -0.1480533, -2.894894, 0, 1, 0.6117647, 1,
-0.2149849, -0.7139059, -1.655317, 0, 1, 0.6156863, 1,
-0.2130145, 0.7982761, -0.5371732, 0, 1, 0.6235294, 1,
-0.2124597, 1.50462, -0.9291288, 0, 1, 0.627451, 1,
-0.2084718, 1.835315, 1.296927, 0, 1, 0.6352941, 1,
-0.2002785, -1.357267, -2.833526, 0, 1, 0.6392157, 1,
-0.1970948, 0.390166, -0.9710208, 0, 1, 0.6470588, 1,
-0.1961885, 0.4307405, -0.5367258, 0, 1, 0.6509804, 1,
-0.1942411, -0.7540228, -0.862824, 0, 1, 0.6588235, 1,
-0.1906672, 0.932381, -0.6650974, 0, 1, 0.6627451, 1,
-0.1875614, -1.941766, -1.434716, 0, 1, 0.6705883, 1,
-0.1806211, -0.770815, -1.746048, 0, 1, 0.6745098, 1,
-0.1800814, -2.112267, -2.889472, 0, 1, 0.682353, 1,
-0.1793794, 0.8531376, -3.108318, 0, 1, 0.6862745, 1,
-0.1792929, -0.2290388, -3.988346, 0, 1, 0.6941177, 1,
-0.1770843, -0.8848849, -4.454022, 0, 1, 0.7019608, 1,
-0.1767495, 0.1716764, -0.3488713, 0, 1, 0.7058824, 1,
-0.1741561, -0.7829067, -3.37741, 0, 1, 0.7137255, 1,
-0.167014, 1.228577, 0.1666042, 0, 1, 0.7176471, 1,
-0.1651558, 1.531342, -0.1376001, 0, 1, 0.7254902, 1,
-0.1647978, 0.2892331, -0.5775185, 0, 1, 0.7294118, 1,
-0.1644549, 1.693331, 1.151668, 0, 1, 0.7372549, 1,
-0.164244, -1.207433, -3.445384, 0, 1, 0.7411765, 1,
-0.1524652, 0.04230217, -2.728148, 0, 1, 0.7490196, 1,
-0.149344, 1.936716, -1.225586, 0, 1, 0.7529412, 1,
-0.1491049, 1.088995, -1.628827, 0, 1, 0.7607843, 1,
-0.1470326, -0.5792789, -3.535582, 0, 1, 0.7647059, 1,
-0.1451816, -0.2122222, -2.276717, 0, 1, 0.772549, 1,
-0.143667, 0.7066672, 0.0529676, 0, 1, 0.7764706, 1,
-0.142165, 0.982756, -0.4561252, 0, 1, 0.7843137, 1,
-0.1408847, 0.2674747, 0.5394199, 0, 1, 0.7882353, 1,
-0.1407079, 0.8317804, -1.239868, 0, 1, 0.7960784, 1,
-0.1394752, -0.2159603, -2.037272, 0, 1, 0.8039216, 1,
-0.1369258, -1.414001, -1.43618, 0, 1, 0.8078431, 1,
-0.1359994, 0.3089989, -0.9584167, 0, 1, 0.8156863, 1,
-0.1328068, 1.094694, -0.5768377, 0, 1, 0.8196079, 1,
-0.1316805, -0.3015283, -2.993706, 0, 1, 0.827451, 1,
-0.124311, -0.005838749, -0.7192761, 0, 1, 0.8313726, 1,
-0.119826, -0.5138649, -2.544305, 0, 1, 0.8392157, 1,
-0.118597, -2.061659, -3.079453, 0, 1, 0.8431373, 1,
-0.1066765, -0.5020274, -3.004591, 0, 1, 0.8509804, 1,
-0.1060517, 1.758044, -1.965141, 0, 1, 0.854902, 1,
-0.1052088, 0.8624122, 0.9068044, 0, 1, 0.8627451, 1,
-0.104236, -3.019964, -3.077934, 0, 1, 0.8666667, 1,
-0.1041993, -0.8287048, -4.585724, 0, 1, 0.8745098, 1,
-0.1039898, -1.47071, -3.257595, 0, 1, 0.8784314, 1,
-0.09755258, -0.1521689, -0.9398016, 0, 1, 0.8862745, 1,
-0.09603791, 1.717817, -1.258111, 0, 1, 0.8901961, 1,
-0.08461019, -1.177945, -3.537302, 0, 1, 0.8980392, 1,
-0.07692084, -1.67802, -3.245536, 0, 1, 0.9058824, 1,
-0.07589138, -0.4063964, -2.354627, 0, 1, 0.9098039, 1,
-0.07103073, 0.9973193, -0.0490984, 0, 1, 0.9176471, 1,
-0.06731678, -1.247586, -3.440332, 0, 1, 0.9215686, 1,
-0.06479602, -1.746268, -3.367827, 0, 1, 0.9294118, 1,
-0.06375965, 0.7395496, 0.03451529, 0, 1, 0.9333333, 1,
-0.06122148, 1.681193, -1.54774, 0, 1, 0.9411765, 1,
-0.05857067, 1.105447, 0.3088888, 0, 1, 0.945098, 1,
-0.05842995, 0.5122555, 0.3982849, 0, 1, 0.9529412, 1,
-0.0478854, 0.1554881, -1.234637, 0, 1, 0.9568627, 1,
-0.04739427, 0.9480587, -0.5944114, 0, 1, 0.9647059, 1,
-0.04136422, -1.059447, -2.832551, 0, 1, 0.9686275, 1,
-0.0397656, 0.04196193, -0.9794852, 0, 1, 0.9764706, 1,
-0.0380432, -0.3627016, -5.230754, 0, 1, 0.9803922, 1,
-0.03793275, -0.424183, -2.715723, 0, 1, 0.9882353, 1,
-0.0373359, 0.6752163, -0.07102159, 0, 1, 0.9921569, 1,
-0.03592383, 0.3396079, -1.617707, 0, 1, 1, 1,
-0.02994103, -2.366756, -5.286174, 0, 0.9921569, 1, 1,
-0.02784991, -1.574643, -2.005638, 0, 0.9882353, 1, 1,
-0.02347079, 0.5067186, 0.6984439, 0, 0.9803922, 1, 1,
-0.01941406, 0.06320273, -1.024689, 0, 0.9764706, 1, 1,
-0.01939136, 0.893169, -1.844018, 0, 0.9686275, 1, 1,
-0.01807272, 3.168787, -2.303746, 0, 0.9647059, 1, 1,
-0.01130288, 0.4434323, -1.331608, 0, 0.9568627, 1, 1,
-0.009590665, -0.9357708, -3.017835, 0, 0.9529412, 1, 1,
-0.008788217, 1.790953, -0.548215, 0, 0.945098, 1, 1,
-0.007713561, 0.1456128, 0.7438662, 0, 0.9411765, 1, 1,
-0.004629206, -2.074197, -3.811685, 0, 0.9333333, 1, 1,
0.001029339, -0.7043726, 0.9008179, 0, 0.9294118, 1, 1,
0.004266586, -1.428316, 2.954781, 0, 0.9215686, 1, 1,
0.007451742, -0.6502771, 4.62131, 0, 0.9176471, 1, 1,
0.01877282, -1.266823, 1.705575, 0, 0.9098039, 1, 1,
0.01951679, 1.120738, -0.1099452, 0, 0.9058824, 1, 1,
0.02722847, 0.05460672, 1.192667, 0, 0.8980392, 1, 1,
0.02812388, -0.2630852, 2.076816, 0, 0.8901961, 1, 1,
0.03136807, -0.03924513, 1.897652, 0, 0.8862745, 1, 1,
0.04489849, 0.213116, 1.417586, 0, 0.8784314, 1, 1,
0.04547887, -0.5249589, 3.844489, 0, 0.8745098, 1, 1,
0.04772173, -0.05681101, 0.2772706, 0, 0.8666667, 1, 1,
0.04818838, -0.01922563, 1.16572, 0, 0.8627451, 1, 1,
0.05106478, -1.312176, 3.7628, 0, 0.854902, 1, 1,
0.05630426, -0.5029024, 3.488185, 0, 0.8509804, 1, 1,
0.05638647, 0.3653969, 0.4508967, 0, 0.8431373, 1, 1,
0.05788029, -0.1420424, 2.328229, 0, 0.8392157, 1, 1,
0.05938845, 0.3261772, -0.9192556, 0, 0.8313726, 1, 1,
0.05989782, -0.3872597, 2.393395, 0, 0.827451, 1, 1,
0.06290187, -0.1195941, 2.299793, 0, 0.8196079, 1, 1,
0.06379115, 0.3535064, -1.264563, 0, 0.8156863, 1, 1,
0.07131688, 2.416346, 0.1342181, 0, 0.8078431, 1, 1,
0.07271252, 0.6510621, -0.3484731, 0, 0.8039216, 1, 1,
0.07436702, 1.406848, 0.1076833, 0, 0.7960784, 1, 1,
0.085164, 0.3527752, 0.5642942, 0, 0.7882353, 1, 1,
0.08761668, -1.451082, 2.927481, 0, 0.7843137, 1, 1,
0.08943664, -1.471962, 2.810739, 0, 0.7764706, 1, 1,
0.09056511, 1.197119, 0.7537936, 0, 0.772549, 1, 1,
0.09165038, 3.236555, -1.590188, 0, 0.7647059, 1, 1,
0.09403667, 0.7563896, 0.9894515, 0, 0.7607843, 1, 1,
0.09932256, -0.9501175, 4.319736, 0, 0.7529412, 1, 1,
0.100175, 0.3102335, -2.023707, 0, 0.7490196, 1, 1,
0.1017698, 0.5543194, -0.7838374, 0, 0.7411765, 1, 1,
0.1028508, 2.209819, -0.6214703, 0, 0.7372549, 1, 1,
0.1079199, -1.60395, 2.853949, 0, 0.7294118, 1, 1,
0.1081049, -0.6407933, 3.206609, 0, 0.7254902, 1, 1,
0.1119665, -0.3185662, 2.566142, 0, 0.7176471, 1, 1,
0.1137655, 1.112787, -0.7378323, 0, 0.7137255, 1, 1,
0.1239852, 0.8134968, -0.005087683, 0, 0.7058824, 1, 1,
0.1289762, -0.8620951, 2.292811, 0, 0.6980392, 1, 1,
0.1312376, 0.38201, 0.5552261, 0, 0.6941177, 1, 1,
0.1338097, 0.5820295, -0.7699165, 0, 0.6862745, 1, 1,
0.1358906, -0.4515638, 2.722112, 0, 0.682353, 1, 1,
0.1384384, -0.9284959, 3.080049, 0, 0.6745098, 1, 1,
0.1400564, 1.066314, 1.174079, 0, 0.6705883, 1, 1,
0.1417502, 0.5917073, 0.7254941, 0, 0.6627451, 1, 1,
0.1526247, -0.2598499, 1.776933, 0, 0.6588235, 1, 1,
0.153544, 0.3501687, 0.2994845, 0, 0.6509804, 1, 1,
0.1567008, -1.173324, 3.164171, 0, 0.6470588, 1, 1,
0.1583896, -0.3546606, 1.598481, 0, 0.6392157, 1, 1,
0.1588101, -0.3549895, 2.652224, 0, 0.6352941, 1, 1,
0.1612939, 0.8962876, -1.873297, 0, 0.627451, 1, 1,
0.1640801, 0.6829069, 0.5296307, 0, 0.6235294, 1, 1,
0.1668176, -0.3114114, 1.179944, 0, 0.6156863, 1, 1,
0.1674172, 1.568522, 0.4848124, 0, 0.6117647, 1, 1,
0.1680603, 0.479352, -0.7000884, 0, 0.6039216, 1, 1,
0.1683607, 0.4941801, -0.5707815, 0, 0.5960785, 1, 1,
0.1734681, 1.061849, 0.1278647, 0, 0.5921569, 1, 1,
0.1756547, 0.9361562, 0.3513854, 0, 0.5843138, 1, 1,
0.178045, -2.090584, 3.181123, 0, 0.5803922, 1, 1,
0.1801061, -0.4838974, 3.624914, 0, 0.572549, 1, 1,
0.1820349, 0.1263606, 0.3482865, 0, 0.5686275, 1, 1,
0.1835789, -1.227416, 3.698471, 0, 0.5607843, 1, 1,
0.1851612, -1.36018, 3.429322, 0, 0.5568628, 1, 1,
0.1851741, 0.3556866, 0.004405044, 0, 0.5490196, 1, 1,
0.1853165, -0.9959432, 2.673414, 0, 0.5450981, 1, 1,
0.1858272, -0.995632, 4.005968, 0, 0.5372549, 1, 1,
0.1895075, -1.6243, 3.049688, 0, 0.5333334, 1, 1,
0.1899884, 0.1626819, 1.142686, 0, 0.5254902, 1, 1,
0.1929376, 0.7099975, -1.113872, 0, 0.5215687, 1, 1,
0.194104, -0.8526298, 4.287397, 0, 0.5137255, 1, 1,
0.1991495, -1.10537, 4.353641, 0, 0.509804, 1, 1,
0.1997667, -0.01903474, 1.050846, 0, 0.5019608, 1, 1,
0.2033834, 0.09115563, 1.935817, 0, 0.4941176, 1, 1,
0.2037062, -0.2838587, 3.129642, 0, 0.4901961, 1, 1,
0.20391, 0.170849, 1.243962, 0, 0.4823529, 1, 1,
0.2042598, -0.4080833, 2.052188, 0, 0.4784314, 1, 1,
0.2046959, 0.3454838, 0.2369045, 0, 0.4705882, 1, 1,
0.2057538, 1.159747, 0.8427609, 0, 0.4666667, 1, 1,
0.2061341, -1.492304, 4.171877, 0, 0.4588235, 1, 1,
0.2093333, 1.262098, -0.08960551, 0, 0.454902, 1, 1,
0.2094441, -0.780843, 3.589306, 0, 0.4470588, 1, 1,
0.2115767, -0.3827901, 0.8228135, 0, 0.4431373, 1, 1,
0.2117191, 0.9640842, -0.8133203, 0, 0.4352941, 1, 1,
0.2127551, -1.083388, 2.162103, 0, 0.4313726, 1, 1,
0.2153375, -1.444235, 3.13011, 0, 0.4235294, 1, 1,
0.217707, -0.5590946, 3.029274, 0, 0.4196078, 1, 1,
0.2195602, -0.6789122, 2.713597, 0, 0.4117647, 1, 1,
0.2285528, 0.1836014, 0.8787468, 0, 0.4078431, 1, 1,
0.2323833, -0.1700702, 2.760071, 0, 0.4, 1, 1,
0.2369831, 0.4141839, 0.8437135, 0, 0.3921569, 1, 1,
0.2381471, -0.4131828, 2.093617, 0, 0.3882353, 1, 1,
0.2419574, 0.5251317, -0.4537455, 0, 0.3803922, 1, 1,
0.245756, -1.352791, 3.043504, 0, 0.3764706, 1, 1,
0.2605679, 0.2959251, 0.004068232, 0, 0.3686275, 1, 1,
0.2614936, -0.02043548, 1.477016, 0, 0.3647059, 1, 1,
0.2658699, 0.08010856, 0.7059826, 0, 0.3568628, 1, 1,
0.2674527, 0.1891483, 1.668154, 0, 0.3529412, 1, 1,
0.2765652, -1.222616, 3.74433, 0, 0.345098, 1, 1,
0.2824493, 1.635801, -1.23316, 0, 0.3411765, 1, 1,
0.2827969, -0.949519, 3.40165, 0, 0.3333333, 1, 1,
0.2880597, -0.06503659, 1.814106, 0, 0.3294118, 1, 1,
0.2893971, -0.8629505, 3.355385, 0, 0.3215686, 1, 1,
0.2905143, 0.7773867, -0.03456961, 0, 0.3176471, 1, 1,
0.2949907, -0.1975319, 1.9378, 0, 0.3098039, 1, 1,
0.2983584, 0.02101302, 1.57047, 0, 0.3058824, 1, 1,
0.3040392, -0.6664403, 3.03786, 0, 0.2980392, 1, 1,
0.310638, 0.2988564, 0.09541722, 0, 0.2901961, 1, 1,
0.3140515, -0.03396099, 0.3554068, 0, 0.2862745, 1, 1,
0.3145617, 0.365449, 0.9057159, 0, 0.2784314, 1, 1,
0.3177658, -1.244843, 1.601728, 0, 0.2745098, 1, 1,
0.3200801, -0.02885869, 2.669116, 0, 0.2666667, 1, 1,
0.3203688, 0.6599411, 1.183348, 0, 0.2627451, 1, 1,
0.3273529, -0.460541, 1.842668, 0, 0.254902, 1, 1,
0.3336653, 0.8725805, 0.8786426, 0, 0.2509804, 1, 1,
0.3410513, 1.98418, 1.825371, 0, 0.2431373, 1, 1,
0.3413084, 0.3215301, 0.3241308, 0, 0.2392157, 1, 1,
0.3427823, 0.01791166, 2.037112, 0, 0.2313726, 1, 1,
0.3428801, -0.1024136, 1.735055, 0, 0.227451, 1, 1,
0.3448168, 0.5564221, -1.375886, 0, 0.2196078, 1, 1,
0.3474731, 0.8903244, -0.2548436, 0, 0.2156863, 1, 1,
0.348667, 0.958903, 0.5982476, 0, 0.2078431, 1, 1,
0.3510083, 0.3942257, 0.3057931, 0, 0.2039216, 1, 1,
0.3533751, 0.2308857, -0.4384639, 0, 0.1960784, 1, 1,
0.3578407, 1.273339, 1.38196, 0, 0.1882353, 1, 1,
0.3587042, 1.243182, 1.077216, 0, 0.1843137, 1, 1,
0.3615384, -0.0350599, -0.3421332, 0, 0.1764706, 1, 1,
0.3665144, -0.8453295, 1.249262, 0, 0.172549, 1, 1,
0.3682494, -1.05972, 1.890496, 0, 0.1647059, 1, 1,
0.3699237, -0.5472862, 2.340274, 0, 0.1607843, 1, 1,
0.3704957, 0.03362497, 2.473137, 0, 0.1529412, 1, 1,
0.374717, 1.130178, -0.2852894, 0, 0.1490196, 1, 1,
0.3808018, 1.18539, 0.7582538, 0, 0.1411765, 1, 1,
0.3823753, 0.3267743, 0.6917266, 0, 0.1372549, 1, 1,
0.3840323, -0.1092037, -0.134047, 0, 0.1294118, 1, 1,
0.3862844, 0.04626701, -0.8467677, 0, 0.1254902, 1, 1,
0.3880533, -0.8743567, 3.819157, 0, 0.1176471, 1, 1,
0.3893109, 0.790338, 2.097043, 0, 0.1137255, 1, 1,
0.3925756, 0.896244, -0.8655508, 0, 0.1058824, 1, 1,
0.3961983, -2.642185, 4.07336, 0, 0.09803922, 1, 1,
0.3973269, 1.48606, 1.40544, 0, 0.09411765, 1, 1,
0.400987, -0.7689604, 1.663453, 0, 0.08627451, 1, 1,
0.4135599, -0.5643879, 0.6699191, 0, 0.08235294, 1, 1,
0.416868, -0.6443273, 2.857137, 0, 0.07450981, 1, 1,
0.4214654, 0.7896667, 0.7727875, 0, 0.07058824, 1, 1,
0.4411902, -0.5397411, 2.408784, 0, 0.0627451, 1, 1,
0.4423182, -0.3834373, 3.731247, 0, 0.05882353, 1, 1,
0.4433742, -0.9644734, 2.008139, 0, 0.05098039, 1, 1,
0.4445618, 0.007010358, 1.199717, 0, 0.04705882, 1, 1,
0.4468649, 1.575105, 1.843058, 0, 0.03921569, 1, 1,
0.4480317, -2.067973, 3.044441, 0, 0.03529412, 1, 1,
0.457917, 0.82073, 2.045482, 0, 0.02745098, 1, 1,
0.4592512, 2.555001, 1.493999, 0, 0.02352941, 1, 1,
0.4596658, 0.5439752, 1.142348, 0, 0.01568628, 1, 1,
0.4610094, -0.5893574, 3.22843, 0, 0.01176471, 1, 1,
0.4623347, -0.3825662, 2.260764, 0, 0.003921569, 1, 1,
0.4639103, 0.4817257, 0.7791506, 0.003921569, 0, 1, 1,
0.4643883, -0.005153831, 2.766948, 0.007843138, 0, 1, 1,
0.4655184, 0.1501182, -1.156621, 0.01568628, 0, 1, 1,
0.4720869, -0.3968445, 1.026119, 0.01960784, 0, 1, 1,
0.4723023, -0.5074758, 1.91512, 0.02745098, 0, 1, 1,
0.4742261, 1.354005, -1.452871, 0.03137255, 0, 1, 1,
0.4751522, 0.4093854, -0.2639165, 0.03921569, 0, 1, 1,
0.4758713, -1.32118, 3.22477, 0.04313726, 0, 1, 1,
0.4781085, -1.715934, 1.634947, 0.05098039, 0, 1, 1,
0.4806902, 1.575797, 1.688875, 0.05490196, 0, 1, 1,
0.4882632, 1.20008, 0.5593871, 0.0627451, 0, 1, 1,
0.4893146, -1.070862, 2.339285, 0.06666667, 0, 1, 1,
0.494677, 0.7812933, 0.2979868, 0.07450981, 0, 1, 1,
0.4999928, 0.06992691, 0.5220165, 0.07843138, 0, 1, 1,
0.5009218, -1.482372, 4.682086, 0.08627451, 0, 1, 1,
0.5021954, -1.69241, 1.853756, 0.09019608, 0, 1, 1,
0.5098021, -0.9410717, 2.41241, 0.09803922, 0, 1, 1,
0.5114243, -0.2294623, 2.552193, 0.1058824, 0, 1, 1,
0.5116112, 1.044325, -0.327466, 0.1098039, 0, 1, 1,
0.5158896, -2.597267, 3.758493, 0.1176471, 0, 1, 1,
0.5180455, -0.3042397, 2.996888, 0.1215686, 0, 1, 1,
0.5206394, 0.8608758, 0.01130746, 0.1294118, 0, 1, 1,
0.5216804, -1.839159, 2.729173, 0.1333333, 0, 1, 1,
0.5229919, -1.225762, 3.573675, 0.1411765, 0, 1, 1,
0.5238101, -0.1663492, 2.954941, 0.145098, 0, 1, 1,
0.5263656, 0.2641521, 1.452881, 0.1529412, 0, 1, 1,
0.530883, -0.8896872, 4.508548, 0.1568628, 0, 1, 1,
0.5362415, 0.03213309, 2.548962, 0.1647059, 0, 1, 1,
0.5387795, -1.269306, 3.239712, 0.1686275, 0, 1, 1,
0.5396962, -0.932341, 1.647762, 0.1764706, 0, 1, 1,
0.5422887, -0.04859171, 1.68859, 0.1803922, 0, 1, 1,
0.5461622, -0.2931778, 3.828297, 0.1882353, 0, 1, 1,
0.5561662, -2.660371, 3.692838, 0.1921569, 0, 1, 1,
0.5576707, 0.4374423, 2.205047, 0.2, 0, 1, 1,
0.5635099, -0.8297189, 4.108174, 0.2078431, 0, 1, 1,
0.5719216, 0.5087875, 0.7946913, 0.2117647, 0, 1, 1,
0.5737922, -0.6293895, 2.15386, 0.2196078, 0, 1, 1,
0.5774719, 0.1245855, -0.9305937, 0.2235294, 0, 1, 1,
0.580824, -0.4888748, 0.4770254, 0.2313726, 0, 1, 1,
0.5877175, -0.9565282, 3.157176, 0.2352941, 0, 1, 1,
0.5878931, 1.110806, 1.525409, 0.2431373, 0, 1, 1,
0.5922229, -1.492378, 3.268055, 0.2470588, 0, 1, 1,
0.5928875, -0.9878826, 2.379144, 0.254902, 0, 1, 1,
0.5934695, -0.8607231, 0.2450701, 0.2588235, 0, 1, 1,
0.5965488, 0.2670756, 1.633756, 0.2666667, 0, 1, 1,
0.605883, 1.40359, 1.359912, 0.2705882, 0, 1, 1,
0.6067097, -0.9137579, 3.697611, 0.2784314, 0, 1, 1,
0.6070612, -0.7035751, 4.002744, 0.282353, 0, 1, 1,
0.6103433, -1.387627, 2.5574, 0.2901961, 0, 1, 1,
0.610705, 0.6699506, 0.0005163211, 0.2941177, 0, 1, 1,
0.6129693, -0.8137929, 1.583076, 0.3019608, 0, 1, 1,
0.615096, 0.3622263, 1.243733, 0.3098039, 0, 1, 1,
0.61627, -0.6530324, 3.510925, 0.3137255, 0, 1, 1,
0.6167583, -0.9310979, 2.884691, 0.3215686, 0, 1, 1,
0.6172281, 0.5778692, -0.06854685, 0.3254902, 0, 1, 1,
0.6197418, -0.4978027, 0.7076162, 0.3333333, 0, 1, 1,
0.6214615, 0.93694, -0.7071658, 0.3372549, 0, 1, 1,
0.6241975, 0.5554078, 1.495546, 0.345098, 0, 1, 1,
0.625203, 1.821179, -1.783986, 0.3490196, 0, 1, 1,
0.6261351, 0.08443023, 1.113057, 0.3568628, 0, 1, 1,
0.6320233, -0.5561685, 1.020322, 0.3607843, 0, 1, 1,
0.6384401, 0.8265423, 0.2209709, 0.3686275, 0, 1, 1,
0.6397161, 0.1430077, 1.244404, 0.372549, 0, 1, 1,
0.6403533, -1.306576, 0.897309, 0.3803922, 0, 1, 1,
0.6404721, 0.02724161, 0.5614662, 0.3843137, 0, 1, 1,
0.6424411, 0.3098055, 1.013542, 0.3921569, 0, 1, 1,
0.642911, -0.1315142, 0.5777795, 0.3960784, 0, 1, 1,
0.6442074, -0.5739088, 1.58798, 0.4039216, 0, 1, 1,
0.6460934, -1.166696, 3.122897, 0.4117647, 0, 1, 1,
0.6472646, -1.546538, 2.27686, 0.4156863, 0, 1, 1,
0.6497119, -0.2863851, 2.936609, 0.4235294, 0, 1, 1,
0.6574789, 0.09825829, 2.158847, 0.427451, 0, 1, 1,
0.6577944, -0.2113736, 1.238205, 0.4352941, 0, 1, 1,
0.6633043, -1.641975, 0.787612, 0.4392157, 0, 1, 1,
0.6665516, -1.542737, 2.379079, 0.4470588, 0, 1, 1,
0.6679038, 0.2598284, 1.626248, 0.4509804, 0, 1, 1,
0.6691679, -1.070905, 5.448412, 0.4588235, 0, 1, 1,
0.6716077, 0.4627234, -1.068577, 0.4627451, 0, 1, 1,
0.6738973, 1.006056, 0.9228008, 0.4705882, 0, 1, 1,
0.6807171, -0.2403134, -0.7326514, 0.4745098, 0, 1, 1,
0.6876341, 1.024611, 2.431057, 0.4823529, 0, 1, 1,
0.6901842, -0.7522298, 1.692808, 0.4862745, 0, 1, 1,
0.6915296, 0.9866216, 1.224889, 0.4941176, 0, 1, 1,
0.6957378, -0.4419241, 2.837285, 0.5019608, 0, 1, 1,
0.7019442, 1.001555, 1.271573, 0.5058824, 0, 1, 1,
0.707284, 2.076827, 2.339413, 0.5137255, 0, 1, 1,
0.7081949, 0.4045, 0.5538167, 0.5176471, 0, 1, 1,
0.710196, -1.623443, 2.959408, 0.5254902, 0, 1, 1,
0.7109917, 0.654689, 1.503568, 0.5294118, 0, 1, 1,
0.7125116, 0.5160734, 0.8438717, 0.5372549, 0, 1, 1,
0.7164552, -0.6652713, 2.101988, 0.5411765, 0, 1, 1,
0.7164603, -2.019032, 2.289992, 0.5490196, 0, 1, 1,
0.7173506, -1.264529, 2.24031, 0.5529412, 0, 1, 1,
0.7181438, 0.5489815, 0.4057542, 0.5607843, 0, 1, 1,
0.7187892, -0.371059, 1.287941, 0.5647059, 0, 1, 1,
0.7230631, -0.8722789, 1.258567, 0.572549, 0, 1, 1,
0.7250071, 0.009786895, 1.891751, 0.5764706, 0, 1, 1,
0.726447, -0.4119528, 1.820458, 0.5843138, 0, 1, 1,
0.7292976, -0.16267, 1.088525, 0.5882353, 0, 1, 1,
0.7345389, -2.458973, 1.77065, 0.5960785, 0, 1, 1,
0.7369637, -0.6247429, 2.882074, 0.6039216, 0, 1, 1,
0.7397926, 2.394696, -0.5687943, 0.6078432, 0, 1, 1,
0.7445073, -1.973293, 2.557636, 0.6156863, 0, 1, 1,
0.7471803, 0.1587522, 0.4901944, 0.6196079, 0, 1, 1,
0.7480497, 0.6734133, 0.07027265, 0.627451, 0, 1, 1,
0.7482414, -1.558115, 2.334799, 0.6313726, 0, 1, 1,
0.7494934, 0.274629, 1.408964, 0.6392157, 0, 1, 1,
0.751336, 0.4514556, -0.65162, 0.6431373, 0, 1, 1,
0.7581732, 0.3774178, -0.2635857, 0.6509804, 0, 1, 1,
0.7593685, -0.1445446, 2.105672, 0.654902, 0, 1, 1,
0.7637044, 1.229458, 2.790707, 0.6627451, 0, 1, 1,
0.7695771, -0.5372448, 2.215735, 0.6666667, 0, 1, 1,
0.7736357, 0.535693, 1.493448, 0.6745098, 0, 1, 1,
0.7744827, -0.8163794, 2.894312, 0.6784314, 0, 1, 1,
0.7768655, 0.1881704, 0.9742389, 0.6862745, 0, 1, 1,
0.7769929, -0.9502914, 2.916515, 0.6901961, 0, 1, 1,
0.7803132, -0.3941094, 1.710674, 0.6980392, 0, 1, 1,
0.7810256, -0.4468253, 2.920441, 0.7058824, 0, 1, 1,
0.7837934, 1.91838, 0.4142013, 0.7098039, 0, 1, 1,
0.784241, -0.9785375, -1.057893, 0.7176471, 0, 1, 1,
0.7915065, -1.54803, 1.991647, 0.7215686, 0, 1, 1,
0.7928545, 1.098059, 0.6294402, 0.7294118, 0, 1, 1,
0.7951608, 0.719755, 1.419855, 0.7333333, 0, 1, 1,
0.7955081, -0.5200531, 1.419272, 0.7411765, 0, 1, 1,
0.7978413, 0.0700373, 0.2429358, 0.7450981, 0, 1, 1,
0.8048312, -0.6623701, 0.8091093, 0.7529412, 0, 1, 1,
0.8066363, 1.816944, 1.851558, 0.7568628, 0, 1, 1,
0.8158202, 1.212243, 0.5957103, 0.7647059, 0, 1, 1,
0.8164425, 0.716274, -2.007291, 0.7686275, 0, 1, 1,
0.8296731, 0.9890062, -1.039692, 0.7764706, 0, 1, 1,
0.8339869, -0.8305687, 1.130685, 0.7803922, 0, 1, 1,
0.8382723, -1.641682, 0.4621015, 0.7882353, 0, 1, 1,
0.8385932, -0.3946412, 2.439893, 0.7921569, 0, 1, 1,
0.8553446, 0.709729, 0.2168694, 0.8, 0, 1, 1,
0.8636498, -0.1144137, 1.35989, 0.8078431, 0, 1, 1,
0.8685189, -1.403232, 2.719347, 0.8117647, 0, 1, 1,
0.8686537, -2.082659, 2.324584, 0.8196079, 0, 1, 1,
0.879935, 0.4008426, -0.5498286, 0.8235294, 0, 1, 1,
0.8853188, -0.1178716, 2.685632, 0.8313726, 0, 1, 1,
0.8947809, 0.3050315, -0.05497096, 0.8352941, 0, 1, 1,
0.8956152, -0.5770206, 3.625756, 0.8431373, 0, 1, 1,
0.8967108, 0.002305438, 2.763641, 0.8470588, 0, 1, 1,
0.913615, -0.4998972, 2.131353, 0.854902, 0, 1, 1,
0.9164588, -0.3807281, 2.644627, 0.8588235, 0, 1, 1,
0.9177483, -1.903213, 0.6110426, 0.8666667, 0, 1, 1,
0.9178439, 0.4997372, 0.03810285, 0.8705882, 0, 1, 1,
0.9178878, -0.3887784, 2.818146, 0.8784314, 0, 1, 1,
0.9187467, 0.04608492, 1.083366, 0.8823529, 0, 1, 1,
0.9265236, -0.03690306, 1.309255, 0.8901961, 0, 1, 1,
0.9296075, -0.9530788, 0.9499425, 0.8941177, 0, 1, 1,
0.9365423, -0.4630473, 2.12457, 0.9019608, 0, 1, 1,
0.9372011, 0.7626085, 0.8591891, 0.9098039, 0, 1, 1,
0.9394785, -1.435254, 0.242451, 0.9137255, 0, 1, 1,
0.945214, -0.6043087, 1.161467, 0.9215686, 0, 1, 1,
0.9529992, -0.01851651, -0.2577268, 0.9254902, 0, 1, 1,
0.9544183, 1.664338, 0.1896046, 0.9333333, 0, 1, 1,
0.9645419, 0.3828239, 0.6086913, 0.9372549, 0, 1, 1,
0.9658559, -1.141095, 3.021265, 0.945098, 0, 1, 1,
0.9664449, -0.553947, -0.4174078, 0.9490196, 0, 1, 1,
0.9689767, 0.0532123, 2.393007, 0.9568627, 0, 1, 1,
0.9701121, -1.084865, 3.264559, 0.9607843, 0, 1, 1,
0.9796692, 1.251578, 0.3047558, 0.9686275, 0, 1, 1,
0.9825931, -0.1467523, -0.02590528, 0.972549, 0, 1, 1,
0.9850171, 0.950166, 0.8683706, 0.9803922, 0, 1, 1,
0.9870136, 1.95006, 0.9987009, 0.9843137, 0, 1, 1,
0.9898972, -0.6563292, 4.587132, 0.9921569, 0, 1, 1,
0.9914908, 1.849647, 1.334498, 0.9960784, 0, 1, 1,
0.9977682, -1.335561, 2.654354, 1, 0, 0.9960784, 1,
1.000519, -1.109118, 0.5897264, 1, 0, 0.9882353, 1,
1.003121, 0.2537714, 0.3916669, 1, 0, 0.9843137, 1,
1.005977, -1.307879, 4.431131, 1, 0, 0.9764706, 1,
1.006967, 0.456038, 1.775094, 1, 0, 0.972549, 1,
1.009919, 1.304647, 0.0362844, 1, 0, 0.9647059, 1,
1.011514, -0.1157965, 0.8030354, 1, 0, 0.9607843, 1,
1.013376, -1.31397, 0.4530328, 1, 0, 0.9529412, 1,
1.025863, 0.3342002, 0.06841954, 1, 0, 0.9490196, 1,
1.039564, -0.2893425, 0.8579552, 1, 0, 0.9411765, 1,
1.042268, -0.6407301, 2.623015, 1, 0, 0.9372549, 1,
1.048326, -1.694811, 2.664248, 1, 0, 0.9294118, 1,
1.053652, 0.4704798, 1.98155, 1, 0, 0.9254902, 1,
1.057347, -0.9052821, 3.385523, 1, 0, 0.9176471, 1,
1.064774, 0.5411465, 1.327032, 1, 0, 0.9137255, 1,
1.064997, -0.5799637, 0.0252964, 1, 0, 0.9058824, 1,
1.065398, 0.5007246, 1.165216, 1, 0, 0.9019608, 1,
1.072701, 0.3492688, 1.603192, 1, 0, 0.8941177, 1,
1.079694, -0.2948839, 0.4253314, 1, 0, 0.8862745, 1,
1.085555, -0.5119511, -0.01557878, 1, 0, 0.8823529, 1,
1.090527, 0.8702399, 2.680224, 1, 0, 0.8745098, 1,
1.093087, 0.9247521, 0.7546574, 1, 0, 0.8705882, 1,
1.095317, 0.135066, 2.461616, 1, 0, 0.8627451, 1,
1.098098, -0.622103, 1.588027, 1, 0, 0.8588235, 1,
1.103845, 0.4703332, 1.563059, 1, 0, 0.8509804, 1,
1.104805, -1.479449, 2.133969, 1, 0, 0.8470588, 1,
1.112709, 1.757069, 1.116011, 1, 0, 0.8392157, 1,
1.117764, 0.1481325, 1.205182, 1, 0, 0.8352941, 1,
1.119169, -1.61871, 3.473238, 1, 0, 0.827451, 1,
1.126878, 1.239605, 1.502698, 1, 0, 0.8235294, 1,
1.142877, 0.5171357, 1.06023, 1, 0, 0.8156863, 1,
1.148084, -0.4454461, 2.924074, 1, 0, 0.8117647, 1,
1.148807, 1.370857, 2.322141, 1, 0, 0.8039216, 1,
1.151576, -0.7551886, 3.888325, 1, 0, 0.7960784, 1,
1.152211, 1.526148, 0.9815856, 1, 0, 0.7921569, 1,
1.15314, -0.6011997, 2.245453, 1, 0, 0.7843137, 1,
1.156093, 1.419378, 0.6272726, 1, 0, 0.7803922, 1,
1.165841, 0.8941258, 0.3657529, 1, 0, 0.772549, 1,
1.172516, 1.030652, 1.350877, 1, 0, 0.7686275, 1,
1.175269, -1.694202, 1.521287, 1, 0, 0.7607843, 1,
1.176055, -0.3918577, 2.191542, 1, 0, 0.7568628, 1,
1.17796, 0.5383993, 0.8481955, 1, 0, 0.7490196, 1,
1.180002, -0.854809, 2.650514, 1, 0, 0.7450981, 1,
1.187094, -0.0516234, 1.209548, 1, 0, 0.7372549, 1,
1.187526, 1.304398, 1.961767, 1, 0, 0.7333333, 1,
1.188054, -1.700833, 2.067861, 1, 0, 0.7254902, 1,
1.191875, -0.5993814, 0.7311577, 1, 0, 0.7215686, 1,
1.20484, -0.02744829, 1.163847, 1, 0, 0.7137255, 1,
1.205464, -0.1773651, 1.980724, 1, 0, 0.7098039, 1,
1.209262, -0.6454445, 2.631558, 1, 0, 0.7019608, 1,
1.215621, 0.5135045, 0.223475, 1, 0, 0.6941177, 1,
1.216625, -0.06539129, 0.3050763, 1, 0, 0.6901961, 1,
1.226611, 0.6761093, 3.555364, 1, 0, 0.682353, 1,
1.228577, 0.001937304, 0.440305, 1, 0, 0.6784314, 1,
1.238965, 0.4509883, 1.515625, 1, 0, 0.6705883, 1,
1.23986, -0.4563873, 2.033254, 1, 0, 0.6666667, 1,
1.242546, 1.90706, 1.579883, 1, 0, 0.6588235, 1,
1.253953, -0.2497987, 2.659275, 1, 0, 0.654902, 1,
1.278071, -0.4052131, 2.014469, 1, 0, 0.6470588, 1,
1.281531, -0.4087206, 1.794951, 1, 0, 0.6431373, 1,
1.287422, -0.2864885, 3.158991, 1, 0, 0.6352941, 1,
1.287467, 0.05109628, 0.5564045, 1, 0, 0.6313726, 1,
1.290492, -0.6235993, 3.499043, 1, 0, 0.6235294, 1,
1.291128, 0.6448132, 2.045201, 1, 0, 0.6196079, 1,
1.30156, 1.507207, 0.6472985, 1, 0, 0.6117647, 1,
1.302395, 1.031261, 2.64029, 1, 0, 0.6078432, 1,
1.312752, -2.442257, 5.10181, 1, 0, 0.6, 1,
1.314524, 1.462635, 2.629646, 1, 0, 0.5921569, 1,
1.318571, 0.01831556, 0.5333628, 1, 0, 0.5882353, 1,
1.326372, 0.5694335, -0.2613599, 1, 0, 0.5803922, 1,
1.33217, 2.007931, 0.1243491, 1, 0, 0.5764706, 1,
1.339278, -1.798342, 3.324815, 1, 0, 0.5686275, 1,
1.34192, -0.1284219, 1.864601, 1, 0, 0.5647059, 1,
1.365025, -0.09827817, 0.6880016, 1, 0, 0.5568628, 1,
1.366161, -0.9090199, -0.08666048, 1, 0, 0.5529412, 1,
1.389018, -0.3214705, 2.399669, 1, 0, 0.5450981, 1,
1.392105, -1.135639, 1.63159, 1, 0, 0.5411765, 1,
1.407635, 0.4680742, 0.5093104, 1, 0, 0.5333334, 1,
1.410105, 1.253606, -0.1700245, 1, 0, 0.5294118, 1,
1.413647, 0.8540026, 3.353386, 1, 0, 0.5215687, 1,
1.415227, 0.3574151, 2.231524, 1, 0, 0.5176471, 1,
1.423139, -0.2002048, 1.647128, 1, 0, 0.509804, 1,
1.425067, 0.7241597, -0.5223607, 1, 0, 0.5058824, 1,
1.428527, 0.5215889, 1.01653, 1, 0, 0.4980392, 1,
1.440333, -0.955996, 1.732882, 1, 0, 0.4901961, 1,
1.448707, -0.7442709, 2.160429, 1, 0, 0.4862745, 1,
1.462463, 0.3509961, 1.744211, 1, 0, 0.4784314, 1,
1.46314, -1.54098, 4.329207, 1, 0, 0.4745098, 1,
1.465909, 3.31253, -0.5093694, 1, 0, 0.4666667, 1,
1.467723, 0.561945, 1.901225, 1, 0, 0.4627451, 1,
1.468385, 1.446634, -0.8959298, 1, 0, 0.454902, 1,
1.482052, -0.03700027, 2.409096, 1, 0, 0.4509804, 1,
1.486473, -1.23945, 0.08715265, 1, 0, 0.4431373, 1,
1.487832, 0.3693782, 2.937749, 1, 0, 0.4392157, 1,
1.489958, -1.068971, 3.577859, 1, 0, 0.4313726, 1,
1.492923, -2.073384, 3.303474, 1, 0, 0.427451, 1,
1.498395, 0.310925, 0.7681326, 1, 0, 0.4196078, 1,
1.499881, -1.134656, 3.241272, 1, 0, 0.4156863, 1,
1.504323, 2.197678, 0.5592591, 1, 0, 0.4078431, 1,
1.507727, -0.8253924, 2.618919, 1, 0, 0.4039216, 1,
1.530478, -0.3952058, 0.9168431, 1, 0, 0.3960784, 1,
1.549431, 1.52555, 2.339807, 1, 0, 0.3882353, 1,
1.554158, -0.986902, 2.208593, 1, 0, 0.3843137, 1,
1.554321, -1.074877, 3.438758, 1, 0, 0.3764706, 1,
1.55815, 0.9746225, -0.8393362, 1, 0, 0.372549, 1,
1.567725, -0.2168196, 0.9686675, 1, 0, 0.3647059, 1,
1.58125, -0.1606241, 2.855391, 1, 0, 0.3607843, 1,
1.585106, 0.1287967, 1.77075, 1, 0, 0.3529412, 1,
1.603779, 0.4729087, -0.7387429, 1, 0, 0.3490196, 1,
1.604945, 0.7923467, 0.6005514, 1, 0, 0.3411765, 1,
1.615359, 1.425664, -0.1783279, 1, 0, 0.3372549, 1,
1.625901, 0.4091101, 3.063439, 1, 0, 0.3294118, 1,
1.633753, -0.9022739, 1.145163, 1, 0, 0.3254902, 1,
1.644856, 0.3426959, 0.2812788, 1, 0, 0.3176471, 1,
1.64709, 1.361926, 0.006585388, 1, 0, 0.3137255, 1,
1.673863, 0.9540488, 0.5970048, 1, 0, 0.3058824, 1,
1.677495, -1.634709, 2.502326, 1, 0, 0.2980392, 1,
1.677532, 2.10451, 1.468422, 1, 0, 0.2941177, 1,
1.680904, 1.113343, 2.277913, 1, 0, 0.2862745, 1,
1.689682, -1.734513, 2.640089, 1, 0, 0.282353, 1,
1.693664, 0.06065661, 0.8162016, 1, 0, 0.2745098, 1,
1.719936, -1.787753, 1.658688, 1, 0, 0.2705882, 1,
1.736679, 0.3646195, 0.4778555, 1, 0, 0.2627451, 1,
1.748695, 0.4561038, 2.003071, 1, 0, 0.2588235, 1,
1.77063, -2.380234, 2.530749, 1, 0, 0.2509804, 1,
1.772243, 0.1515982, 2.769313, 1, 0, 0.2470588, 1,
1.78237, 0.6961093, 1.191278, 1, 0, 0.2392157, 1,
1.792531, -0.2216893, 2.832466, 1, 0, 0.2352941, 1,
1.807045, -0.9313336, 1.90888, 1, 0, 0.227451, 1,
1.815549, 0.952347, 0.8801576, 1, 0, 0.2235294, 1,
1.824157, 0.7406446, 2.848454, 1, 0, 0.2156863, 1,
1.83283, 1.750762, 0.07340921, 1, 0, 0.2117647, 1,
1.836364, 1.120825, 1.172698, 1, 0, 0.2039216, 1,
1.852379, -1.920697, 3.55143, 1, 0, 0.1960784, 1,
1.89058, -0.0004011892, 1.40275, 1, 0, 0.1921569, 1,
1.92214, 1.418309, -0.05263676, 1, 0, 0.1843137, 1,
1.937907, 2.316055, -0.9330554, 1, 0, 0.1803922, 1,
1.941705, -0.2091808, 4.011766, 1, 0, 0.172549, 1,
1.952974, -2.076164, 3.779703, 1, 0, 0.1686275, 1,
1.96983, -0.9247276, 0.7970228, 1, 0, 0.1607843, 1,
1.990586, 1.145662, 0.3715253, 1, 0, 0.1568628, 1,
1.993654, -0.4561824, 3.168121, 1, 0, 0.1490196, 1,
2.048948, 0.299565, 1.589184, 1, 0, 0.145098, 1,
2.068371, -1.379672, 0.0240013, 1, 0, 0.1372549, 1,
2.096501, 0.5161236, 1.613441, 1, 0, 0.1333333, 1,
2.10655, 0.9877118, 1.201618, 1, 0, 0.1254902, 1,
2.118407, -0.3663641, 1.90682, 1, 0, 0.1215686, 1,
2.119396, -1.076626, 0.669849, 1, 0, 0.1137255, 1,
2.149473, -0.3535441, 1.463211, 1, 0, 0.1098039, 1,
2.15904, -0.5138469, 2.379642, 1, 0, 0.1019608, 1,
2.214164, -1.720938, 2.595979, 1, 0, 0.09411765, 1,
2.219881, 0.2147326, 2.303082, 1, 0, 0.09019608, 1,
2.243839, 0.7040702, 2.060906, 1, 0, 0.08235294, 1,
2.303312, 0.2207776, -0.3213991, 1, 0, 0.07843138, 1,
2.327786, -0.4970782, 3.265507, 1, 0, 0.07058824, 1,
2.346794, 0.394109, 0.7878911, 1, 0, 0.06666667, 1,
2.364583, -1.400172, 3.387965, 1, 0, 0.05882353, 1,
2.364979, -0.6889588, 1.435405, 1, 0, 0.05490196, 1,
2.365778, 0.06368636, 1.982818, 1, 0, 0.04705882, 1,
2.412374, 0.3239971, 2.028974, 1, 0, 0.04313726, 1,
2.413747, -0.1456116, 1.320864, 1, 0, 0.03529412, 1,
2.479851, 0.03870155, 1.368508, 1, 0, 0.03137255, 1,
2.578442, 0.9025823, 0.1770786, 1, 0, 0.02352941, 1,
2.97247, -0.6719537, 0.1393525, 1, 0, 0.01960784, 1,
3.02397, -0.835662, 1.483819, 1, 0, 0.01176471, 1,
3.062162, 0.2693024, 1.220527, 1, 0, 0.007843138, 1
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
0.129967, -4.17827, -7.105686, 0, -0.5, 0.5, 0.5,
0.129967, -4.17827, -7.105686, 1, -0.5, 0.5, 0.5,
0.129967, -4.17827, -7.105686, 1, 1.5, 0.5, 0.5,
0.129967, -4.17827, -7.105686, 0, 1.5, 0.5, 0.5
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
-3.796242, 0.109965, -7.105686, 0, -0.5, 0.5, 0.5,
-3.796242, 0.109965, -7.105686, 1, -0.5, 0.5, 0.5,
-3.796242, 0.109965, -7.105686, 1, 1.5, 0.5, 0.5,
-3.796242, 0.109965, -7.105686, 0, 1.5, 0.5, 0.5
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
-3.796242, -4.17827, 0.08111906, 0, -0.5, 0.5, 0.5,
-3.796242, -4.17827, 0.08111906, 1, -0.5, 0.5, 0.5,
-3.796242, -4.17827, 0.08111906, 1, 1.5, 0.5, 0.5,
-3.796242, -4.17827, 0.08111906, 0, 1.5, 0.5, 0.5
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
-2, -3.188677, -5.447193,
3, -3.188677, -5.447193,
-2, -3.188677, -5.447193,
-2, -3.353609, -5.723608,
-1, -3.188677, -5.447193,
-1, -3.353609, -5.723608,
0, -3.188677, -5.447193,
0, -3.353609, -5.723608,
1, -3.188677, -5.447193,
1, -3.353609, -5.723608,
2, -3.188677, -5.447193,
2, -3.353609, -5.723608,
3, -3.188677, -5.447193,
3, -3.353609, -5.723608
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
-2, -3.683474, -6.276439, 0, -0.5, 0.5, 0.5,
-2, -3.683474, -6.276439, 1, -0.5, 0.5, 0.5,
-2, -3.683474, -6.276439, 1, 1.5, 0.5, 0.5,
-2, -3.683474, -6.276439, 0, 1.5, 0.5, 0.5,
-1, -3.683474, -6.276439, 0, -0.5, 0.5, 0.5,
-1, -3.683474, -6.276439, 1, -0.5, 0.5, 0.5,
-1, -3.683474, -6.276439, 1, 1.5, 0.5, 0.5,
-1, -3.683474, -6.276439, 0, 1.5, 0.5, 0.5,
0, -3.683474, -6.276439, 0, -0.5, 0.5, 0.5,
0, -3.683474, -6.276439, 1, -0.5, 0.5, 0.5,
0, -3.683474, -6.276439, 1, 1.5, 0.5, 0.5,
0, -3.683474, -6.276439, 0, 1.5, 0.5, 0.5,
1, -3.683474, -6.276439, 0, -0.5, 0.5, 0.5,
1, -3.683474, -6.276439, 1, -0.5, 0.5, 0.5,
1, -3.683474, -6.276439, 1, 1.5, 0.5, 0.5,
1, -3.683474, -6.276439, 0, 1.5, 0.5, 0.5,
2, -3.683474, -6.276439, 0, -0.5, 0.5, 0.5,
2, -3.683474, -6.276439, 1, -0.5, 0.5, 0.5,
2, -3.683474, -6.276439, 1, 1.5, 0.5, 0.5,
2, -3.683474, -6.276439, 0, 1.5, 0.5, 0.5,
3, -3.683474, -6.276439, 0, -0.5, 0.5, 0.5,
3, -3.683474, -6.276439, 1, -0.5, 0.5, 0.5,
3, -3.683474, -6.276439, 1, 1.5, 0.5, 0.5,
3, -3.683474, -6.276439, 0, 1.5, 0.5, 0.5
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
-2.890194, -3, -5.447193,
-2.890194, 3, -5.447193,
-2.890194, -3, -5.447193,
-3.041202, -3, -5.723608,
-2.890194, -2, -5.447193,
-3.041202, -2, -5.723608,
-2.890194, -1, -5.447193,
-3.041202, -1, -5.723608,
-2.890194, 0, -5.447193,
-3.041202, 0, -5.723608,
-2.890194, 1, -5.447193,
-3.041202, 1, -5.723608,
-2.890194, 2, -5.447193,
-3.041202, 2, -5.723608,
-2.890194, 3, -5.447193,
-3.041202, 3, -5.723608
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
-3.343218, -3, -6.276439, 0, -0.5, 0.5, 0.5,
-3.343218, -3, -6.276439, 1, -0.5, 0.5, 0.5,
-3.343218, -3, -6.276439, 1, 1.5, 0.5, 0.5,
-3.343218, -3, -6.276439, 0, 1.5, 0.5, 0.5,
-3.343218, -2, -6.276439, 0, -0.5, 0.5, 0.5,
-3.343218, -2, -6.276439, 1, -0.5, 0.5, 0.5,
-3.343218, -2, -6.276439, 1, 1.5, 0.5, 0.5,
-3.343218, -2, -6.276439, 0, 1.5, 0.5, 0.5,
-3.343218, -1, -6.276439, 0, -0.5, 0.5, 0.5,
-3.343218, -1, -6.276439, 1, -0.5, 0.5, 0.5,
-3.343218, -1, -6.276439, 1, 1.5, 0.5, 0.5,
-3.343218, -1, -6.276439, 0, 1.5, 0.5, 0.5,
-3.343218, 0, -6.276439, 0, -0.5, 0.5, 0.5,
-3.343218, 0, -6.276439, 1, -0.5, 0.5, 0.5,
-3.343218, 0, -6.276439, 1, 1.5, 0.5, 0.5,
-3.343218, 0, -6.276439, 0, 1.5, 0.5, 0.5,
-3.343218, 1, -6.276439, 0, -0.5, 0.5, 0.5,
-3.343218, 1, -6.276439, 1, -0.5, 0.5, 0.5,
-3.343218, 1, -6.276439, 1, 1.5, 0.5, 0.5,
-3.343218, 1, -6.276439, 0, 1.5, 0.5, 0.5,
-3.343218, 2, -6.276439, 0, -0.5, 0.5, 0.5,
-3.343218, 2, -6.276439, 1, -0.5, 0.5, 0.5,
-3.343218, 2, -6.276439, 1, 1.5, 0.5, 0.5,
-3.343218, 2, -6.276439, 0, 1.5, 0.5, 0.5,
-3.343218, 3, -6.276439, 0, -0.5, 0.5, 0.5,
-3.343218, 3, -6.276439, 1, -0.5, 0.5, 0.5,
-3.343218, 3, -6.276439, 1, 1.5, 0.5, 0.5,
-3.343218, 3, -6.276439, 0, 1.5, 0.5, 0.5
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
-2.890194, -3.188677, -4,
-2.890194, -3.188677, 4,
-2.890194, -3.188677, -4,
-3.041202, -3.353609, -4,
-2.890194, -3.188677, -2,
-3.041202, -3.353609, -2,
-2.890194, -3.188677, 0,
-3.041202, -3.353609, 0,
-2.890194, -3.188677, 2,
-3.041202, -3.353609, 2,
-2.890194, -3.188677, 4,
-3.041202, -3.353609, 4
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
-3.343218, -3.683474, -4, 0, -0.5, 0.5, 0.5,
-3.343218, -3.683474, -4, 1, -0.5, 0.5, 0.5,
-3.343218, -3.683474, -4, 1, 1.5, 0.5, 0.5,
-3.343218, -3.683474, -4, 0, 1.5, 0.5, 0.5,
-3.343218, -3.683474, -2, 0, -0.5, 0.5, 0.5,
-3.343218, -3.683474, -2, 1, -0.5, 0.5, 0.5,
-3.343218, -3.683474, -2, 1, 1.5, 0.5, 0.5,
-3.343218, -3.683474, -2, 0, 1.5, 0.5, 0.5,
-3.343218, -3.683474, 0, 0, -0.5, 0.5, 0.5,
-3.343218, -3.683474, 0, 1, -0.5, 0.5, 0.5,
-3.343218, -3.683474, 0, 1, 1.5, 0.5, 0.5,
-3.343218, -3.683474, 0, 0, 1.5, 0.5, 0.5,
-3.343218, -3.683474, 2, 0, -0.5, 0.5, 0.5,
-3.343218, -3.683474, 2, 1, -0.5, 0.5, 0.5,
-3.343218, -3.683474, 2, 1, 1.5, 0.5, 0.5,
-3.343218, -3.683474, 2, 0, 1.5, 0.5, 0.5,
-3.343218, -3.683474, 4, 0, -0.5, 0.5, 0.5,
-3.343218, -3.683474, 4, 1, -0.5, 0.5, 0.5,
-3.343218, -3.683474, 4, 1, 1.5, 0.5, 0.5,
-3.343218, -3.683474, 4, 0, 1.5, 0.5, 0.5
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
-2.890194, -3.188677, -5.447193,
-2.890194, 3.408607, -5.447193,
-2.890194, -3.188677, 5.609431,
-2.890194, 3.408607, 5.609431,
-2.890194, -3.188677, -5.447193,
-2.890194, -3.188677, 5.609431,
-2.890194, 3.408607, -5.447193,
-2.890194, 3.408607, 5.609431,
-2.890194, -3.188677, -5.447193,
3.150128, -3.188677, -5.447193,
-2.890194, -3.188677, 5.609431,
3.150128, -3.188677, 5.609431,
-2.890194, 3.408607, -5.447193,
3.150128, 3.408607, -5.447193,
-2.890194, 3.408607, 5.609431,
3.150128, 3.408607, 5.609431,
3.150128, -3.188677, -5.447193,
3.150128, 3.408607, -5.447193,
3.150128, -3.188677, 5.609431,
3.150128, 3.408607, 5.609431,
3.150128, -3.188677, -5.447193,
3.150128, -3.188677, 5.609431,
3.150128, 3.408607, -5.447193,
3.150128, 3.408607, 5.609431
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
var radius = 7.594146;
var distance = 33.78721;
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
mvMatrix.translate( -0.129967, -0.109965, -0.08111906 );
mvMatrix.scale( 1.359355, 1.244594, 0.7426263 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.78721);
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
nicotine_product<-read.table("nicotine_product.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-nicotine_product$V2
```

```
## Error in eval(expr, envir, enclos): object 'nicotine_product' not found
```

```r
y<-nicotine_product$V3
```

```
## Error in eval(expr, envir, enclos): object 'nicotine_product' not found
```

```r
z<-nicotine_product$V4
```

```
## Error in eval(expr, envir, enclos): object 'nicotine_product' not found
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
-2.802228, -2.085688, -0.2979925, 0, 0, 1, 1, 1,
-2.774917, 0.221899, -0.5597001, 1, 0, 0, 1, 1,
-2.501832, -0.8460057, -1.368736, 1, 0, 0, 1, 1,
-2.472615, 0.9919258, 0.470111, 1, 0, 0, 1, 1,
-2.440917, 0.9642414, -2.054504, 1, 0, 0, 1, 1,
-2.327954, -1.280677, -2.507363, 1, 0, 0, 1, 1,
-2.321599, -0.1023812, -3.080719, 0, 0, 0, 1, 1,
-2.31423, 0.4639691, -1.398812, 0, 0, 0, 1, 1,
-2.165913, 0.1379016, -2.311831, 0, 0, 0, 1, 1,
-2.124456, 0.2012522, -1.778287, 0, 0, 0, 1, 1,
-2.097556, 0.6795995, -0.1948069, 0, 0, 0, 1, 1,
-2.085452, 1.500159, -0.3718373, 0, 0, 0, 1, 1,
-2.03473, -0.1479692, 0.1854334, 0, 0, 0, 1, 1,
-2.011919, 1.573853, -2.00335, 1, 1, 1, 1, 1,
-2.007527, -1.488298, -3.338184, 1, 1, 1, 1, 1,
-2.002063, 1.258142, 0.5579497, 1, 1, 1, 1, 1,
-1.995188, -0.6150379, 1.243254, 1, 1, 1, 1, 1,
-1.956652, 0.02519591, -2.139252, 1, 1, 1, 1, 1,
-1.953928, -2.223842, -3.543299, 1, 1, 1, 1, 1,
-1.937837, 0.7635315, 0.2185046, 1, 1, 1, 1, 1,
-1.913879, 1.013255, -1.135349, 1, 1, 1, 1, 1,
-1.856131, -0.619951, -3.415708, 1, 1, 1, 1, 1,
-1.850168, -0.2864634, -2.498723, 1, 1, 1, 1, 1,
-1.839489, -0.9565285, -1.968957, 1, 1, 1, 1, 1,
-1.829119, 2.501161, -1.404509, 1, 1, 1, 1, 1,
-1.822247, 1.311894, -2.25161, 1, 1, 1, 1, 1,
-1.805719, 1.515454, -1.269565, 1, 1, 1, 1, 1,
-1.793067, 0.7036692, -0.9511039, 1, 1, 1, 1, 1,
-1.775648, 1.35817, -0.04577649, 0, 0, 1, 1, 1,
-1.774733, 0.3036718, -1.537734, 1, 0, 0, 1, 1,
-1.746722, 0.7986254, -1.251915, 1, 0, 0, 1, 1,
-1.714464, -1.806282, -1.043106, 1, 0, 0, 1, 1,
-1.704336, 1.87303, -1.370942, 1, 0, 0, 1, 1,
-1.682503, -1.07716, -1.440246, 1, 0, 0, 1, 1,
-1.679982, -0.01278264, -3.037905, 0, 0, 0, 1, 1,
-1.679696, -0.09852902, -2.807732, 0, 0, 0, 1, 1,
-1.678574, -0.3121208, -3.430808, 0, 0, 0, 1, 1,
-1.670882, 0.2673474, 0.1840127, 0, 0, 0, 1, 1,
-1.667698, -1.992682, -1.923091, 0, 0, 0, 1, 1,
-1.658944, -0.1396139, -1.859681, 0, 0, 0, 1, 1,
-1.653129, 0.6344971, -0.7325236, 0, 0, 0, 1, 1,
-1.649532, 1.502489, 0.1203725, 1, 1, 1, 1, 1,
-1.641326, 1.145691, -0.9836803, 1, 1, 1, 1, 1,
-1.638574, 0.4108098, -1.207817, 1, 1, 1, 1, 1,
-1.619561, 0.4347954, -0.4045774, 1, 1, 1, 1, 1,
-1.61824, -0.2366422, -3.039359, 1, 1, 1, 1, 1,
-1.607884, -1.227626, -3.000629, 1, 1, 1, 1, 1,
-1.572563, -0.758579, -2.821953, 1, 1, 1, 1, 1,
-1.566892, -0.3678834, -1.618871, 1, 1, 1, 1, 1,
-1.55339, 1.682137, -1.01119, 1, 1, 1, 1, 1,
-1.55042, -1.286709, -2.060494, 1, 1, 1, 1, 1,
-1.534195, 1.371292, -1.781011, 1, 1, 1, 1, 1,
-1.524838, 0.6015165, -0.06654198, 1, 1, 1, 1, 1,
-1.509708, -0.9881005, -3.423335, 1, 1, 1, 1, 1,
-1.509112, 0.9025202, -1.719262, 1, 1, 1, 1, 1,
-1.490402, 0.5619163, -2.201159, 1, 1, 1, 1, 1,
-1.489497, -0.6127023, -1.115158, 0, 0, 1, 1, 1,
-1.48875, 1.4411, -2.030746, 1, 0, 0, 1, 1,
-1.469331, 0.7673756, 0.3222162, 1, 0, 0, 1, 1,
-1.464054, 2.522086, 0.5483817, 1, 0, 0, 1, 1,
-1.461434, -0.5980537, -3.588444, 1, 0, 0, 1, 1,
-1.454764, -0.7654294, -2.174434, 1, 0, 0, 1, 1,
-1.44773, -0.1135319, -1.821765, 0, 0, 0, 1, 1,
-1.445198, 2.267383, -1.296647, 0, 0, 0, 1, 1,
-1.443417, 1.23664, -1.587021, 0, 0, 0, 1, 1,
-1.441218, 0.008991323, -1.524099, 0, 0, 0, 1, 1,
-1.438391, 1.686254, 0.2516569, 0, 0, 0, 1, 1,
-1.413926, 0.5801404, -1.090344, 0, 0, 0, 1, 1,
-1.40971, 0.1413213, -0.1347174, 0, 0, 0, 1, 1,
-1.402784, 0.419019, -1.177208, 1, 1, 1, 1, 1,
-1.368798, -1.386061, -2.74579, 1, 1, 1, 1, 1,
-1.366378, -0.6060123, -1.860912, 1, 1, 1, 1, 1,
-1.365561, -0.09139313, -2.150241, 1, 1, 1, 1, 1,
-1.364589, -0.5193728, -1.303882, 1, 1, 1, 1, 1,
-1.362158, 0.5397517, -0.6041788, 1, 1, 1, 1, 1,
-1.35773, -0.7963875, -2.023257, 1, 1, 1, 1, 1,
-1.351587, -1.605099, -2.164832, 1, 1, 1, 1, 1,
-1.35156, -0.04294704, -2.452182, 1, 1, 1, 1, 1,
-1.350063, -0.3971677, -0.6858267, 1, 1, 1, 1, 1,
-1.334426, 1.277306, -2.582523, 1, 1, 1, 1, 1,
-1.327466, 0.5931501, -0.4441734, 1, 1, 1, 1, 1,
-1.320965, -0.298327, -2.549942, 1, 1, 1, 1, 1,
-1.31945, -0.03868939, 0.2160442, 1, 1, 1, 1, 1,
-1.317362, -1.76129, -2.501677, 1, 1, 1, 1, 1,
-1.317031, 0.5051383, -2.060068, 0, 0, 1, 1, 1,
-1.315036, -0.8285475, -0.9662287, 1, 0, 0, 1, 1,
-1.300797, 0.8339741, 0.5057339, 1, 0, 0, 1, 1,
-1.293423, 1.246936, -0.9089113, 1, 0, 0, 1, 1,
-1.283271, -0.3647757, -2.131472, 1, 0, 0, 1, 1,
-1.281084, -0.2699061, -1.176836, 1, 0, 0, 1, 1,
-1.280527, 1.812085, 0.004332835, 0, 0, 0, 1, 1,
-1.272667, 0.6760802, 1.020846, 0, 0, 0, 1, 1,
-1.266282, 1.004667, -0.6248228, 0, 0, 0, 1, 1,
-1.263197, 1.444271, -2.168707, 0, 0, 0, 1, 1,
-1.261802, -0.952167, -1.696634, 0, 0, 0, 1, 1,
-1.252434, 2.425001, 0.361447, 0, 0, 0, 1, 1,
-1.251191, 0.4495665, -2.587337, 0, 0, 0, 1, 1,
-1.247213, -0.08018148, -0.9044781, 1, 1, 1, 1, 1,
-1.242922, 0.6619146, 0.640406, 1, 1, 1, 1, 1,
-1.23317, 0.6360366, -0.9965646, 1, 1, 1, 1, 1,
-1.230105, -0.07956027, -2.040315, 1, 1, 1, 1, 1,
-1.228451, -0.7098092, -3.597787, 1, 1, 1, 1, 1,
-1.227734, -1.675868, -2.776458, 1, 1, 1, 1, 1,
-1.222139, -1.821477, -4.11447, 1, 1, 1, 1, 1,
-1.220876, -1.597877, -4.349015, 1, 1, 1, 1, 1,
-1.217753, -1.391406, -3.18526, 1, 1, 1, 1, 1,
-1.215035, -0.3863871, -2.818956, 1, 1, 1, 1, 1,
-1.211363, 1.455444, 0.2980066, 1, 1, 1, 1, 1,
-1.208486, -0.1898218, -1.705643, 1, 1, 1, 1, 1,
-1.195665, -0.7972038, -1.45604, 1, 1, 1, 1, 1,
-1.19328, -1.520677, -1.680654, 1, 1, 1, 1, 1,
-1.188192, -1.423417, -3.247647, 1, 1, 1, 1, 1,
-1.175333, -0.7316305, -1.174779, 0, 0, 1, 1, 1,
-1.163218, -0.1397266, -1.455855, 1, 0, 0, 1, 1,
-1.161386, -0.4893689, -0.7084436, 1, 0, 0, 1, 1,
-1.160012, -0.6638633, -1.225135, 1, 0, 0, 1, 1,
-1.158368, 0.06637759, 0.5940674, 1, 0, 0, 1, 1,
-1.152932, 0.2094865, -1.314165, 1, 0, 0, 1, 1,
-1.149197, -0.9983301, -3.275155, 0, 0, 0, 1, 1,
-1.145723, -0.007889137, -0.7202732, 0, 0, 0, 1, 1,
-1.145483, -0.2782437, -1.067884, 0, 0, 0, 1, 1,
-1.142105, -0.02268088, -3.091958, 0, 0, 0, 1, 1,
-1.1384, -0.1638409, -1.551669, 0, 0, 0, 1, 1,
-1.136489, 2.06594, -1.100816, 0, 0, 0, 1, 1,
-1.134785, -1.21508, -3.069101, 0, 0, 0, 1, 1,
-1.128932, -0.2161152, -2.747361, 1, 1, 1, 1, 1,
-1.125695, 0.2182584, -1.818745, 1, 1, 1, 1, 1,
-1.108062, 1.798688, -1.32843, 1, 1, 1, 1, 1,
-1.104388, -1.675267, -3.137127, 1, 1, 1, 1, 1,
-1.10352, 0.3984026, -0.4863027, 1, 1, 1, 1, 1,
-1.097211, 0.2870898, -2.087972, 1, 1, 1, 1, 1,
-1.090501, -0.2530608, -2.88491, 1, 1, 1, 1, 1,
-1.083759, 0.2255254, -1.025246, 1, 1, 1, 1, 1,
-1.083507, -0.5428887, -2.362244, 1, 1, 1, 1, 1,
-1.080854, 0.4029015, -0.28474, 1, 1, 1, 1, 1,
-1.079942, 0.07802881, -0.8210486, 1, 1, 1, 1, 1,
-1.075572, 0.9141098, -0.9478649, 1, 1, 1, 1, 1,
-1.071394, -0.9494475, -0.07884363, 1, 1, 1, 1, 1,
-1.060851, 0.2234061, -1.258326, 1, 1, 1, 1, 1,
-1.059112, -1.191166, -3.837466, 1, 1, 1, 1, 1,
-1.056956, 1.568485, -0.1822834, 0, 0, 1, 1, 1,
-1.053161, -0.02425986, -1.701673, 1, 0, 0, 1, 1,
-1.048797, 0.6890735, 0.3215685, 1, 0, 0, 1, 1,
-1.046236, -1.642681, -3.039078, 1, 0, 0, 1, 1,
-1.04362, -0.654489, -3.047243, 1, 0, 0, 1, 1,
-1.034012, 1.31436, -0.3939788, 1, 0, 0, 1, 1,
-1.029079, 0.1805439, -0.6211918, 0, 0, 0, 1, 1,
-1.026795, 1.981591, -2.233261, 0, 0, 0, 1, 1,
-1.023608, 0.8548853, 0.5296631, 0, 0, 0, 1, 1,
-1.023599, 1.064515, -0.4443474, 0, 0, 0, 1, 1,
-1.02235, 0.8267267, -1.224903, 0, 0, 0, 1, 1,
-1.016792, 0.118151, -1.544048, 0, 0, 0, 1, 1,
-1.01508, 0.9485258, -0.742765, 0, 0, 0, 1, 1,
-1.008891, 1.294999, -0.6238856, 1, 1, 1, 1, 1,
-0.9967513, 0.02065345, -1.56318, 1, 1, 1, 1, 1,
-0.9955631, -0.4425995, -1.785475, 1, 1, 1, 1, 1,
-0.9952235, 0.2038999, -2.532249, 1, 1, 1, 1, 1,
-0.9942366, 0.07100851, -0.9304645, 1, 1, 1, 1, 1,
-0.9865512, 1.490158, -1.222612, 1, 1, 1, 1, 1,
-0.9831882, -0.1101813, -2.324985, 1, 1, 1, 1, 1,
-0.9814199, 1.44601, -0.5203809, 1, 1, 1, 1, 1,
-0.9787007, -0.01255339, -1.357285, 1, 1, 1, 1, 1,
-0.9782455, 1.120567, -1.742276, 1, 1, 1, 1, 1,
-0.9703605, -0.1546345, -0.4938184, 1, 1, 1, 1, 1,
-0.9625099, 0.5748207, -2.465157, 1, 1, 1, 1, 1,
-0.9601379, -0.1640404, -1.480248, 1, 1, 1, 1, 1,
-0.9595282, -0.3221076, -3.888687, 1, 1, 1, 1, 1,
-0.9529188, 1.338534, 1.110157, 1, 1, 1, 1, 1,
-0.9491318, 0.5412789, -0.2728566, 0, 0, 1, 1, 1,
-0.9448897, 1.179383, -0.3297321, 1, 0, 0, 1, 1,
-0.9448556, -0.7039729, -3.251027, 1, 0, 0, 1, 1,
-0.9415452, 0.4975579, -3.075056, 1, 0, 0, 1, 1,
-0.9410715, -0.3079905, -1.977926, 1, 0, 0, 1, 1,
-0.9304817, 1.498612, -0.5387377, 1, 0, 0, 1, 1,
-0.9302012, 1.288977, 0.1604671, 0, 0, 0, 1, 1,
-0.9277223, 1.148734, -2.91896, 0, 0, 0, 1, 1,
-0.9163758, -2.402738, -2.51562, 0, 0, 0, 1, 1,
-0.9056543, -0.07009517, -2.120902, 0, 0, 0, 1, 1,
-0.9056144, 0.0394229, -2.380008, 0, 0, 0, 1, 1,
-0.8957306, 0.5113011, -1.17801, 0, 0, 0, 1, 1,
-0.8869641, -1.299945, -1.982511, 0, 0, 0, 1, 1,
-0.8868095, 0.8327196, 0.1790672, 1, 1, 1, 1, 1,
-0.8843487, 0.3858979, -1.993228, 1, 1, 1, 1, 1,
-0.8810087, -1.113791, -3.335526, 1, 1, 1, 1, 1,
-0.8802955, -1.441875, -2.185323, 1, 1, 1, 1, 1,
-0.8800945, -0.8513013, -1.282638, 1, 1, 1, 1, 1,
-0.8760843, -0.4572522, -2.300647, 1, 1, 1, 1, 1,
-0.8758589, -2.018741, -3.349351, 1, 1, 1, 1, 1,
-0.8710527, 0.6491372, -2.826044, 1, 1, 1, 1, 1,
-0.863137, -0.2595149, -2.886831, 1, 1, 1, 1, 1,
-0.8546829, -0.5544425, -1.443709, 1, 1, 1, 1, 1,
-0.8538096, 0.7118444, -2.096149, 1, 1, 1, 1, 1,
-0.8535222, -0.007390147, -2.806895, 1, 1, 1, 1, 1,
-0.8527645, -0.1045593, -0.8990886, 1, 1, 1, 1, 1,
-0.848675, 0.7687517, -0.4193581, 1, 1, 1, 1, 1,
-0.8372282, -0.1927841, -2.481604, 1, 1, 1, 1, 1,
-0.8299513, 1.463661, -1.990619, 0, 0, 1, 1, 1,
-0.8273184, 1.308826, -1.479156, 1, 0, 0, 1, 1,
-0.8231145, 0.4533532, -0.8074927, 1, 0, 0, 1, 1,
-0.8226878, -0.06663959, -2.583472, 1, 0, 0, 1, 1,
-0.8104041, -1.362991, -2.146315, 1, 0, 0, 1, 1,
-0.809576, -0.7967253, -3.922696, 1, 0, 0, 1, 1,
-0.802605, 0.5477165, 0.07169817, 0, 0, 0, 1, 1,
-0.798381, -1.299999, -3.432195, 0, 0, 0, 1, 1,
-0.7971755, 1.197811, -0.8292636, 0, 0, 0, 1, 1,
-0.7943212, -0.5361816, -3.564589, 0, 0, 0, 1, 1,
-0.7894799, -1.33683, -4.276159, 0, 0, 0, 1, 1,
-0.7780793, -0.1953972, -0.5026909, 0, 0, 0, 1, 1,
-0.7715507, -1.277056, -2.071989, 0, 0, 0, 1, 1,
-0.7677999, -2.091408, -3.074341, 1, 1, 1, 1, 1,
-0.7670237, 0.6583269, -0.4869172, 1, 1, 1, 1, 1,
-0.7667713, -0.8568855, -3.752055, 1, 1, 1, 1, 1,
-0.7644542, 0.2255182, -1.526584, 1, 1, 1, 1, 1,
-0.7634379, -0.1704692, -1.446674, 1, 1, 1, 1, 1,
-0.7542027, 0.2071821, -0.8484349, 1, 1, 1, 1, 1,
-0.7536579, 1.497818, 1.533806, 1, 1, 1, 1, 1,
-0.7436443, -1.162235, -1.730661, 1, 1, 1, 1, 1,
-0.7420324, -0.2268883, -2.394475, 1, 1, 1, 1, 1,
-0.7402402, 0.4497793, -0.9737218, 1, 1, 1, 1, 1,
-0.7401263, 0.7658929, -0.3616463, 1, 1, 1, 1, 1,
-0.7375908, 0.4622576, -0.7503044, 1, 1, 1, 1, 1,
-0.7340305, -1.850425, -2.919153, 1, 1, 1, 1, 1,
-0.7335458, 0.5475534, -1.870253, 1, 1, 1, 1, 1,
-0.7284341, 1.541558, -0.5968005, 1, 1, 1, 1, 1,
-0.7274314, 0.4467759, -2.108367, 0, 0, 1, 1, 1,
-0.7263641, 1.557437, 0.3863981, 1, 0, 0, 1, 1,
-0.7167552, -1.054421, -0.5115095, 1, 0, 0, 1, 1,
-0.7085787, 0.8100522, -0.2112244, 1, 0, 0, 1, 1,
-0.7028074, 0.1065648, -1.38145, 1, 0, 0, 1, 1,
-0.7012401, 2.006, -0.1032559, 1, 0, 0, 1, 1,
-0.6979877, -1.133466, -1.813561, 0, 0, 0, 1, 1,
-0.6967025, 0.1994529, -0.3601779, 0, 0, 0, 1, 1,
-0.6958213, -0.181554, -1.621464, 0, 0, 0, 1, 1,
-0.6955786, 0.5528583, -1.390224, 0, 0, 0, 1, 1,
-0.6941151, 1.74805, 0.3479652, 0, 0, 0, 1, 1,
-0.6896718, -0.6923994, -3.357905, 0, 0, 0, 1, 1,
-0.6880078, 0.1292173, -2.327918, 0, 0, 0, 1, 1,
-0.6872001, -0.2637454, -1.984705, 1, 1, 1, 1, 1,
-0.6839552, 0.3980411, -2.951666, 1, 1, 1, 1, 1,
-0.6837173, 0.5133729, -0.4680402, 1, 1, 1, 1, 1,
-0.6787101, 0.3807854, -2.675202, 1, 1, 1, 1, 1,
-0.6765955, -0.003686021, 1.152843, 1, 1, 1, 1, 1,
-0.6755706, -0.7192143, -3.184428, 1, 1, 1, 1, 1,
-0.6737697, 0.4922822, -1.462266, 1, 1, 1, 1, 1,
-0.6730901, -0.2637366, -1.040159, 1, 1, 1, 1, 1,
-0.6725051, -1.234608, -2.983757, 1, 1, 1, 1, 1,
-0.6705425, 0.3176037, -2.681615, 1, 1, 1, 1, 1,
-0.6675366, 1.162135, -1.487529, 1, 1, 1, 1, 1,
-0.6653276, 0.5247028, 0.6703526, 1, 1, 1, 1, 1,
-0.6642503, 1.02614, -0.9468102, 1, 1, 1, 1, 1,
-0.6639383, 0.7180861, -2.872311, 1, 1, 1, 1, 1,
-0.6617674, -1.620661, -2.213614, 1, 1, 1, 1, 1,
-0.660745, 0.9122485, 0.1392952, 0, 0, 1, 1, 1,
-0.658257, -0.05289505, -1.575525, 1, 0, 0, 1, 1,
-0.6549568, 0.9810782, -0.835705, 1, 0, 0, 1, 1,
-0.6529925, 1.22667, -0.03739543, 1, 0, 0, 1, 1,
-0.652578, -0.7630122, -3.546396, 1, 0, 0, 1, 1,
-0.6509636, 0.5958413, 0.3041446, 1, 0, 0, 1, 1,
-0.6459822, 0.6492136, -1.609482, 0, 0, 0, 1, 1,
-0.6404958, -0.5215824, 0.2016902, 0, 0, 0, 1, 1,
-0.638611, 0.007379606, -1.829785, 0, 0, 0, 1, 1,
-0.6383618, -0.4521556, -2.225185, 0, 0, 0, 1, 1,
-0.6340245, 0.7327452, 0.6998615, 0, 0, 0, 1, 1,
-0.6266401, 1.307858, 0.6885889, 0, 0, 0, 1, 1,
-0.6242511, -0.06351434, -1.047073, 0, 0, 0, 1, 1,
-0.6177235, 0.2925201, -0.1253555, 1, 1, 1, 1, 1,
-0.6155546, 0.2491459, -0.3272305, 1, 1, 1, 1, 1,
-0.6136311, 0.8946862, -0.480485, 1, 1, 1, 1, 1,
-0.6133718, 0.9527965, 0.102045, 1, 1, 1, 1, 1,
-0.6126506, 0.8553418, 0.7923378, 1, 1, 1, 1, 1,
-0.6076843, 1.140641, -1.24937, 1, 1, 1, 1, 1,
-0.6040742, 0.1029067, -0.3208629, 1, 1, 1, 1, 1,
-0.6025502, 0.3716856, -1.600968, 1, 1, 1, 1, 1,
-0.5991064, -0.4526981, -2.451508, 1, 1, 1, 1, 1,
-0.5986528, -0.568397, -2.284828, 1, 1, 1, 1, 1,
-0.5952285, -0.2053597, -2.022119, 1, 1, 1, 1, 1,
-0.5914424, -1.566673, -1.227501, 1, 1, 1, 1, 1,
-0.5863042, -0.4162406, -1.360488, 1, 1, 1, 1, 1,
-0.5836319, 0.3608125, -2.231957, 1, 1, 1, 1, 1,
-0.5806469, -1.29515, -2.273922, 1, 1, 1, 1, 1,
-0.5789163, -2.134083, -1.025633, 0, 0, 1, 1, 1,
-0.5785494, 1.336353, -0.3866613, 1, 0, 0, 1, 1,
-0.5785241, -0.515856, -2.703074, 1, 0, 0, 1, 1,
-0.5780119, 0.2143159, 0.2376439, 1, 0, 0, 1, 1,
-0.5757051, -0.2818915, -2.458212, 1, 0, 0, 1, 1,
-0.5738913, -0.3595946, -1.326676, 1, 0, 0, 1, 1,
-0.5712848, 0.09346454, -2.949003, 0, 0, 0, 1, 1,
-0.5690846, -0.5257638, -1.749155, 0, 0, 0, 1, 1,
-0.5649144, -0.1753252, -2.904562, 0, 0, 0, 1, 1,
-0.5646991, -0.1151483, -2.656922, 0, 0, 0, 1, 1,
-0.5643821, 0.7026803, 0.07069146, 0, 0, 0, 1, 1,
-0.5591682, -0.1602257, -0.7320768, 0, 0, 0, 1, 1,
-0.5591364, 1.833118, -1.334811, 0, 0, 0, 1, 1,
-0.5547065, -1.672604, -3.086828, 1, 1, 1, 1, 1,
-0.5540518, -0.2136596, -1.953538, 1, 1, 1, 1, 1,
-0.5493827, -0.6749984, -1.946999, 1, 1, 1, 1, 1,
-0.5437939, -1.053441, -1.748188, 1, 1, 1, 1, 1,
-0.5412266, 1.308796, 1.04283, 1, 1, 1, 1, 1,
-0.5362349, -0.7982011, -2.556175, 1, 1, 1, 1, 1,
-0.535818, 0.2314369, -1.413436, 1, 1, 1, 1, 1,
-0.5326908, 0.007309443, -1.896531, 1, 1, 1, 1, 1,
-0.5326386, -1.834282, -0.5629604, 1, 1, 1, 1, 1,
-0.5325586, 2.036285, 1.10246, 1, 1, 1, 1, 1,
-0.529249, 0.004919092, -2.757172, 1, 1, 1, 1, 1,
-0.5280943, 0.3931082, 0.3514439, 1, 1, 1, 1, 1,
-0.5273298, -0.05121431, -0.7978751, 1, 1, 1, 1, 1,
-0.525196, -0.6326823, -2.443146, 1, 1, 1, 1, 1,
-0.5212516, 1.056159, 0.7388008, 1, 1, 1, 1, 1,
-0.520382, -0.1513906, -3.814961, 0, 0, 1, 1, 1,
-0.5195228, 1.556309, -1.981095, 1, 0, 0, 1, 1,
-0.5151051, -0.7076485, -2.044795, 1, 0, 0, 1, 1,
-0.5144801, 0.4870443, -1.649074, 1, 0, 0, 1, 1,
-0.510707, -1.122891, -4.999856, 1, 0, 0, 1, 1,
-0.5100309, 1.150516, 0.4304357, 1, 0, 0, 1, 1,
-0.5084631, -0.2117155, -2.444724, 0, 0, 0, 1, 1,
-0.5074078, -0.3205296, -0.3868198, 0, 0, 0, 1, 1,
-0.5059308, 0.3277203, -0.5837601, 0, 0, 0, 1, 1,
-0.5000548, 1.331654, -1.172178, 0, 0, 0, 1, 1,
-0.4989311, 1.17096, -0.4756682, 0, 0, 0, 1, 1,
-0.4987051, 1.497997, -0.2525621, 0, 0, 0, 1, 1,
-0.4973448, 0.446595, -0.3125057, 0, 0, 0, 1, 1,
-0.4966196, 1.133714, 0.4931997, 1, 1, 1, 1, 1,
-0.4912504, 0.9282609, -0.8922102, 1, 1, 1, 1, 1,
-0.4878534, 0.1258965, -1.378416, 1, 1, 1, 1, 1,
-0.4830393, 1.045717, -1.397326, 1, 1, 1, 1, 1,
-0.4787284, 0.8837373, -1.617842, 1, 1, 1, 1, 1,
-0.4754001, 1.008915, -1.015296, 1, 1, 1, 1, 1,
-0.4746756, -1.072319, -2.428696, 1, 1, 1, 1, 1,
-0.4746583, -3.0926, -4.590962, 1, 1, 1, 1, 1,
-0.4723114, -1.645956, -2.899821, 1, 1, 1, 1, 1,
-0.4707708, 0.05827553, -0.8437575, 1, 1, 1, 1, 1,
-0.4701753, 0.6439277, 0.6032068, 1, 1, 1, 1, 1,
-0.4621421, -0.4604614, -1.632376, 1, 1, 1, 1, 1,
-0.4615798, 0.4937061, -0.8170648, 1, 1, 1, 1, 1,
-0.4558754, -0.9717429, -1.520496, 1, 1, 1, 1, 1,
-0.4517279, -0.3129032, -3.6364, 1, 1, 1, 1, 1,
-0.4490599, -0.4248566, -1.934675, 0, 0, 1, 1, 1,
-0.4485075, 1.06772, 1.147625, 1, 0, 0, 1, 1,
-0.4405523, -0.8978675, -2.329529, 1, 0, 0, 1, 1,
-0.4342118, -2.145541, -2.36239, 1, 0, 0, 1, 1,
-0.4330619, 0.6729621, 1.531157, 1, 0, 0, 1, 1,
-0.43121, 0.9008554, -0.8044887, 1, 0, 0, 1, 1,
-0.427255, 0.3937622, -1.317771, 0, 0, 0, 1, 1,
-0.4231701, -0.097471, -1.168803, 0, 0, 0, 1, 1,
-0.4230758, -0.208268, -1.353609, 0, 0, 0, 1, 1,
-0.4203288, 0.01935496, -1.971655, 0, 0, 0, 1, 1,
-0.4203207, -1.022232, -1.753797, 0, 0, 0, 1, 1,
-0.4200638, 0.03298518, -1.489213, 0, 0, 0, 1, 1,
-0.4194871, 1.328672, 1.388943, 0, 0, 0, 1, 1,
-0.4151421, -0.8751849, -2.678035, 1, 1, 1, 1, 1,
-0.4140994, -0.7857575, -2.440694, 1, 1, 1, 1, 1,
-0.4135918, 1.074467, -2.357723, 1, 1, 1, 1, 1,
-0.4131764, -0.2788927, -2.207207, 1, 1, 1, 1, 1,
-0.4118598, 0.3326401, -0.8300998, 1, 1, 1, 1, 1,
-0.4090449, 0.5671256, -0.3275926, 1, 1, 1, 1, 1,
-0.4053341, -0.6310421, -3.108972, 1, 1, 1, 1, 1,
-0.4016934, -0.5393608, -3.221104, 1, 1, 1, 1, 1,
-0.3946318, 1.835028, 0.2012565, 1, 1, 1, 1, 1,
-0.3929136, -1.065549, -3.333116, 1, 1, 1, 1, 1,
-0.3891303, 0.06039852, -0.5528334, 1, 1, 1, 1, 1,
-0.3876975, -0.2024319, -2.37136, 1, 1, 1, 1, 1,
-0.385005, 0.4981167, 0.246576, 1, 1, 1, 1, 1,
-0.376579, 0.4905102, -1.513395, 1, 1, 1, 1, 1,
-0.3746621, -1.154883, -1.728828, 1, 1, 1, 1, 1,
-0.3708109, -1.56428, -2.666922, 0, 0, 1, 1, 1,
-0.3705521, -0.5421619, -1.232393, 1, 0, 0, 1, 1,
-0.3702839, -0.8268815, -2.175362, 1, 0, 0, 1, 1,
-0.3691117, -0.6798269, -2.274858, 1, 0, 0, 1, 1,
-0.366519, -0.07184812, -2.488036, 1, 0, 0, 1, 1,
-0.3644662, 0.6573835, -2.220371, 1, 0, 0, 1, 1,
-0.3644006, 0.7646337, 1.270653, 0, 0, 0, 1, 1,
-0.362771, 1.343083, -0.2849625, 0, 0, 0, 1, 1,
-0.362314, -0.685595, -2.78152, 0, 0, 0, 1, 1,
-0.3553596, 2.466784, -1.229496, 0, 0, 0, 1, 1,
-0.3547981, -0.1073316, -0.6638345, 0, 0, 0, 1, 1,
-0.3544295, -0.7386777, -2.052196, 0, 0, 0, 1, 1,
-0.3525054, -2.129408, -2.306979, 0, 0, 0, 1, 1,
-0.3458402, -1.347197, -2.161122, 1, 1, 1, 1, 1,
-0.3433593, -0.7449888, -3.272885, 1, 1, 1, 1, 1,
-0.3403291, -0.4616048, -3.757121, 1, 1, 1, 1, 1,
-0.3366674, 1.613042, -1.696239, 1, 1, 1, 1, 1,
-0.336423, -0.01735491, -2.52711, 1, 1, 1, 1, 1,
-0.3351235, -0.5857366, -2.469985, 1, 1, 1, 1, 1,
-0.333444, -0.730454, -3.027551, 1, 1, 1, 1, 1,
-0.3329849, 0.01433828, -0.6639639, 1, 1, 1, 1, 1,
-0.3327347, 1.377692, 0.3246077, 1, 1, 1, 1, 1,
-0.3251894, -0.700712, -2.295407, 1, 1, 1, 1, 1,
-0.3245201, 0.6971455, -1.059144, 1, 1, 1, 1, 1,
-0.3236369, 0.4341548, -0.1817443, 1, 1, 1, 1, 1,
-0.3231973, -0.01570012, -0.9827321, 1, 1, 1, 1, 1,
-0.3206175, 0.7753499, -0.9891311, 1, 1, 1, 1, 1,
-0.3203472, -0.7674762, -2.789233, 1, 1, 1, 1, 1,
-0.314741, -1.018172, -2.59253, 0, 0, 1, 1, 1,
-0.3135575, 0.4079773, -0.08164385, 1, 0, 0, 1, 1,
-0.3047515, -1.048754, -0.7626107, 1, 0, 0, 1, 1,
-0.3039547, 2.200947, 0.5280594, 1, 0, 0, 1, 1,
-0.3039491, 0.4052235, 1.011588, 1, 0, 0, 1, 1,
-0.3039015, 0.1805474, -0.08978555, 1, 0, 0, 1, 1,
-0.3031675, -0.9307269, -2.524824, 0, 0, 0, 1, 1,
-0.3009709, -1.300709, -2.261361, 0, 0, 0, 1, 1,
-0.2982524, -0.3191335, -1.290704, 0, 0, 0, 1, 1,
-0.2979528, 0.06813311, -0.6859041, 0, 0, 0, 1, 1,
-0.2958816, 1.604362, 0.3300216, 0, 0, 0, 1, 1,
-0.295378, -0.5459328, -3.445283, 0, 0, 0, 1, 1,
-0.2946087, 1.632432, -0.3428334, 0, 0, 0, 1, 1,
-0.2880281, -0.2419484, -2.429108, 1, 1, 1, 1, 1,
-0.2879691, -0.9636497, -2.041649, 1, 1, 1, 1, 1,
-0.2872166, 0.8354937, -0.7591601, 1, 1, 1, 1, 1,
-0.2827379, 0.2537362, -1.176099, 1, 1, 1, 1, 1,
-0.2807162, -1.788718, -2.730596, 1, 1, 1, 1, 1,
-0.2805491, -0.9693878, -3.31987, 1, 1, 1, 1, 1,
-0.2779585, 0.3097054, 0.4466866, 1, 1, 1, 1, 1,
-0.2751613, 0.3089974, -2.055091, 1, 1, 1, 1, 1,
-0.2725669, -1.292057, -3.981509, 1, 1, 1, 1, 1,
-0.2712845, 0.01347892, -1.528876, 1, 1, 1, 1, 1,
-0.269608, 2.044744, -0.6687546, 1, 1, 1, 1, 1,
-0.2678658, 0.6023659, -0.944523, 1, 1, 1, 1, 1,
-0.2619501, 1.490062, -0.08194535, 1, 1, 1, 1, 1,
-0.2611283, -0.5155511, -0.7825199, 1, 1, 1, 1, 1,
-0.2601443, -1.524743, -2.861214, 1, 1, 1, 1, 1,
-0.2581694, 1.143876, 1.071086, 0, 0, 1, 1, 1,
-0.2508415, -0.9978523, -2.290312, 1, 0, 0, 1, 1,
-0.2501481, -0.1443364, -2.427534, 1, 0, 0, 1, 1,
-0.2491035, -0.153303, -3.426006, 1, 0, 0, 1, 1,
-0.2441455, 0.822764, -0.2849732, 1, 0, 0, 1, 1,
-0.24096, 0.3001652, -1.484634, 1, 0, 0, 1, 1,
-0.2372954, -2.282641, -3.096166, 0, 0, 0, 1, 1,
-0.232247, -0.1328837, -0.438926, 0, 0, 0, 1, 1,
-0.2303576, 1.492898, -1.454476, 0, 0, 0, 1, 1,
-0.2226876, 0.1856379, -0.7784522, 0, 0, 0, 1, 1,
-0.2201301, 1.103932, 1.319587, 0, 0, 0, 1, 1,
-0.2197118, -0.1033945, -1.552547, 0, 0, 0, 1, 1,
-0.2179589, 2.480471, -0.5213974, 0, 0, 0, 1, 1,
-0.2176804, -0.9357671, -4.098378, 1, 1, 1, 1, 1,
-0.2158737, 1.102704, 0.3654899, 1, 1, 1, 1, 1,
-0.2151977, -0.1480533, -2.894894, 1, 1, 1, 1, 1,
-0.2149849, -0.7139059, -1.655317, 1, 1, 1, 1, 1,
-0.2130145, 0.7982761, -0.5371732, 1, 1, 1, 1, 1,
-0.2124597, 1.50462, -0.9291288, 1, 1, 1, 1, 1,
-0.2084718, 1.835315, 1.296927, 1, 1, 1, 1, 1,
-0.2002785, -1.357267, -2.833526, 1, 1, 1, 1, 1,
-0.1970948, 0.390166, -0.9710208, 1, 1, 1, 1, 1,
-0.1961885, 0.4307405, -0.5367258, 1, 1, 1, 1, 1,
-0.1942411, -0.7540228, -0.862824, 1, 1, 1, 1, 1,
-0.1906672, 0.932381, -0.6650974, 1, 1, 1, 1, 1,
-0.1875614, -1.941766, -1.434716, 1, 1, 1, 1, 1,
-0.1806211, -0.770815, -1.746048, 1, 1, 1, 1, 1,
-0.1800814, -2.112267, -2.889472, 1, 1, 1, 1, 1,
-0.1793794, 0.8531376, -3.108318, 0, 0, 1, 1, 1,
-0.1792929, -0.2290388, -3.988346, 1, 0, 0, 1, 1,
-0.1770843, -0.8848849, -4.454022, 1, 0, 0, 1, 1,
-0.1767495, 0.1716764, -0.3488713, 1, 0, 0, 1, 1,
-0.1741561, -0.7829067, -3.37741, 1, 0, 0, 1, 1,
-0.167014, 1.228577, 0.1666042, 1, 0, 0, 1, 1,
-0.1651558, 1.531342, -0.1376001, 0, 0, 0, 1, 1,
-0.1647978, 0.2892331, -0.5775185, 0, 0, 0, 1, 1,
-0.1644549, 1.693331, 1.151668, 0, 0, 0, 1, 1,
-0.164244, -1.207433, -3.445384, 0, 0, 0, 1, 1,
-0.1524652, 0.04230217, -2.728148, 0, 0, 0, 1, 1,
-0.149344, 1.936716, -1.225586, 0, 0, 0, 1, 1,
-0.1491049, 1.088995, -1.628827, 0, 0, 0, 1, 1,
-0.1470326, -0.5792789, -3.535582, 1, 1, 1, 1, 1,
-0.1451816, -0.2122222, -2.276717, 1, 1, 1, 1, 1,
-0.143667, 0.7066672, 0.0529676, 1, 1, 1, 1, 1,
-0.142165, 0.982756, -0.4561252, 1, 1, 1, 1, 1,
-0.1408847, 0.2674747, 0.5394199, 1, 1, 1, 1, 1,
-0.1407079, 0.8317804, -1.239868, 1, 1, 1, 1, 1,
-0.1394752, -0.2159603, -2.037272, 1, 1, 1, 1, 1,
-0.1369258, -1.414001, -1.43618, 1, 1, 1, 1, 1,
-0.1359994, 0.3089989, -0.9584167, 1, 1, 1, 1, 1,
-0.1328068, 1.094694, -0.5768377, 1, 1, 1, 1, 1,
-0.1316805, -0.3015283, -2.993706, 1, 1, 1, 1, 1,
-0.124311, -0.005838749, -0.7192761, 1, 1, 1, 1, 1,
-0.119826, -0.5138649, -2.544305, 1, 1, 1, 1, 1,
-0.118597, -2.061659, -3.079453, 1, 1, 1, 1, 1,
-0.1066765, -0.5020274, -3.004591, 1, 1, 1, 1, 1,
-0.1060517, 1.758044, -1.965141, 0, 0, 1, 1, 1,
-0.1052088, 0.8624122, 0.9068044, 1, 0, 0, 1, 1,
-0.104236, -3.019964, -3.077934, 1, 0, 0, 1, 1,
-0.1041993, -0.8287048, -4.585724, 1, 0, 0, 1, 1,
-0.1039898, -1.47071, -3.257595, 1, 0, 0, 1, 1,
-0.09755258, -0.1521689, -0.9398016, 1, 0, 0, 1, 1,
-0.09603791, 1.717817, -1.258111, 0, 0, 0, 1, 1,
-0.08461019, -1.177945, -3.537302, 0, 0, 0, 1, 1,
-0.07692084, -1.67802, -3.245536, 0, 0, 0, 1, 1,
-0.07589138, -0.4063964, -2.354627, 0, 0, 0, 1, 1,
-0.07103073, 0.9973193, -0.0490984, 0, 0, 0, 1, 1,
-0.06731678, -1.247586, -3.440332, 0, 0, 0, 1, 1,
-0.06479602, -1.746268, -3.367827, 0, 0, 0, 1, 1,
-0.06375965, 0.7395496, 0.03451529, 1, 1, 1, 1, 1,
-0.06122148, 1.681193, -1.54774, 1, 1, 1, 1, 1,
-0.05857067, 1.105447, 0.3088888, 1, 1, 1, 1, 1,
-0.05842995, 0.5122555, 0.3982849, 1, 1, 1, 1, 1,
-0.0478854, 0.1554881, -1.234637, 1, 1, 1, 1, 1,
-0.04739427, 0.9480587, -0.5944114, 1, 1, 1, 1, 1,
-0.04136422, -1.059447, -2.832551, 1, 1, 1, 1, 1,
-0.0397656, 0.04196193, -0.9794852, 1, 1, 1, 1, 1,
-0.0380432, -0.3627016, -5.230754, 1, 1, 1, 1, 1,
-0.03793275, -0.424183, -2.715723, 1, 1, 1, 1, 1,
-0.0373359, 0.6752163, -0.07102159, 1, 1, 1, 1, 1,
-0.03592383, 0.3396079, -1.617707, 1, 1, 1, 1, 1,
-0.02994103, -2.366756, -5.286174, 1, 1, 1, 1, 1,
-0.02784991, -1.574643, -2.005638, 1, 1, 1, 1, 1,
-0.02347079, 0.5067186, 0.6984439, 1, 1, 1, 1, 1,
-0.01941406, 0.06320273, -1.024689, 0, 0, 1, 1, 1,
-0.01939136, 0.893169, -1.844018, 1, 0, 0, 1, 1,
-0.01807272, 3.168787, -2.303746, 1, 0, 0, 1, 1,
-0.01130288, 0.4434323, -1.331608, 1, 0, 0, 1, 1,
-0.009590665, -0.9357708, -3.017835, 1, 0, 0, 1, 1,
-0.008788217, 1.790953, -0.548215, 1, 0, 0, 1, 1,
-0.007713561, 0.1456128, 0.7438662, 0, 0, 0, 1, 1,
-0.004629206, -2.074197, -3.811685, 0, 0, 0, 1, 1,
0.001029339, -0.7043726, 0.9008179, 0, 0, 0, 1, 1,
0.004266586, -1.428316, 2.954781, 0, 0, 0, 1, 1,
0.007451742, -0.6502771, 4.62131, 0, 0, 0, 1, 1,
0.01877282, -1.266823, 1.705575, 0, 0, 0, 1, 1,
0.01951679, 1.120738, -0.1099452, 0, 0, 0, 1, 1,
0.02722847, 0.05460672, 1.192667, 1, 1, 1, 1, 1,
0.02812388, -0.2630852, 2.076816, 1, 1, 1, 1, 1,
0.03136807, -0.03924513, 1.897652, 1, 1, 1, 1, 1,
0.04489849, 0.213116, 1.417586, 1, 1, 1, 1, 1,
0.04547887, -0.5249589, 3.844489, 1, 1, 1, 1, 1,
0.04772173, -0.05681101, 0.2772706, 1, 1, 1, 1, 1,
0.04818838, -0.01922563, 1.16572, 1, 1, 1, 1, 1,
0.05106478, -1.312176, 3.7628, 1, 1, 1, 1, 1,
0.05630426, -0.5029024, 3.488185, 1, 1, 1, 1, 1,
0.05638647, 0.3653969, 0.4508967, 1, 1, 1, 1, 1,
0.05788029, -0.1420424, 2.328229, 1, 1, 1, 1, 1,
0.05938845, 0.3261772, -0.9192556, 1, 1, 1, 1, 1,
0.05989782, -0.3872597, 2.393395, 1, 1, 1, 1, 1,
0.06290187, -0.1195941, 2.299793, 1, 1, 1, 1, 1,
0.06379115, 0.3535064, -1.264563, 1, 1, 1, 1, 1,
0.07131688, 2.416346, 0.1342181, 0, 0, 1, 1, 1,
0.07271252, 0.6510621, -0.3484731, 1, 0, 0, 1, 1,
0.07436702, 1.406848, 0.1076833, 1, 0, 0, 1, 1,
0.085164, 0.3527752, 0.5642942, 1, 0, 0, 1, 1,
0.08761668, -1.451082, 2.927481, 1, 0, 0, 1, 1,
0.08943664, -1.471962, 2.810739, 1, 0, 0, 1, 1,
0.09056511, 1.197119, 0.7537936, 0, 0, 0, 1, 1,
0.09165038, 3.236555, -1.590188, 0, 0, 0, 1, 1,
0.09403667, 0.7563896, 0.9894515, 0, 0, 0, 1, 1,
0.09932256, -0.9501175, 4.319736, 0, 0, 0, 1, 1,
0.100175, 0.3102335, -2.023707, 0, 0, 0, 1, 1,
0.1017698, 0.5543194, -0.7838374, 0, 0, 0, 1, 1,
0.1028508, 2.209819, -0.6214703, 0, 0, 0, 1, 1,
0.1079199, -1.60395, 2.853949, 1, 1, 1, 1, 1,
0.1081049, -0.6407933, 3.206609, 1, 1, 1, 1, 1,
0.1119665, -0.3185662, 2.566142, 1, 1, 1, 1, 1,
0.1137655, 1.112787, -0.7378323, 1, 1, 1, 1, 1,
0.1239852, 0.8134968, -0.005087683, 1, 1, 1, 1, 1,
0.1289762, -0.8620951, 2.292811, 1, 1, 1, 1, 1,
0.1312376, 0.38201, 0.5552261, 1, 1, 1, 1, 1,
0.1338097, 0.5820295, -0.7699165, 1, 1, 1, 1, 1,
0.1358906, -0.4515638, 2.722112, 1, 1, 1, 1, 1,
0.1384384, -0.9284959, 3.080049, 1, 1, 1, 1, 1,
0.1400564, 1.066314, 1.174079, 1, 1, 1, 1, 1,
0.1417502, 0.5917073, 0.7254941, 1, 1, 1, 1, 1,
0.1526247, -0.2598499, 1.776933, 1, 1, 1, 1, 1,
0.153544, 0.3501687, 0.2994845, 1, 1, 1, 1, 1,
0.1567008, -1.173324, 3.164171, 1, 1, 1, 1, 1,
0.1583896, -0.3546606, 1.598481, 0, 0, 1, 1, 1,
0.1588101, -0.3549895, 2.652224, 1, 0, 0, 1, 1,
0.1612939, 0.8962876, -1.873297, 1, 0, 0, 1, 1,
0.1640801, 0.6829069, 0.5296307, 1, 0, 0, 1, 1,
0.1668176, -0.3114114, 1.179944, 1, 0, 0, 1, 1,
0.1674172, 1.568522, 0.4848124, 1, 0, 0, 1, 1,
0.1680603, 0.479352, -0.7000884, 0, 0, 0, 1, 1,
0.1683607, 0.4941801, -0.5707815, 0, 0, 0, 1, 1,
0.1734681, 1.061849, 0.1278647, 0, 0, 0, 1, 1,
0.1756547, 0.9361562, 0.3513854, 0, 0, 0, 1, 1,
0.178045, -2.090584, 3.181123, 0, 0, 0, 1, 1,
0.1801061, -0.4838974, 3.624914, 0, 0, 0, 1, 1,
0.1820349, 0.1263606, 0.3482865, 0, 0, 0, 1, 1,
0.1835789, -1.227416, 3.698471, 1, 1, 1, 1, 1,
0.1851612, -1.36018, 3.429322, 1, 1, 1, 1, 1,
0.1851741, 0.3556866, 0.004405044, 1, 1, 1, 1, 1,
0.1853165, -0.9959432, 2.673414, 1, 1, 1, 1, 1,
0.1858272, -0.995632, 4.005968, 1, 1, 1, 1, 1,
0.1895075, -1.6243, 3.049688, 1, 1, 1, 1, 1,
0.1899884, 0.1626819, 1.142686, 1, 1, 1, 1, 1,
0.1929376, 0.7099975, -1.113872, 1, 1, 1, 1, 1,
0.194104, -0.8526298, 4.287397, 1, 1, 1, 1, 1,
0.1991495, -1.10537, 4.353641, 1, 1, 1, 1, 1,
0.1997667, -0.01903474, 1.050846, 1, 1, 1, 1, 1,
0.2033834, 0.09115563, 1.935817, 1, 1, 1, 1, 1,
0.2037062, -0.2838587, 3.129642, 1, 1, 1, 1, 1,
0.20391, 0.170849, 1.243962, 1, 1, 1, 1, 1,
0.2042598, -0.4080833, 2.052188, 1, 1, 1, 1, 1,
0.2046959, 0.3454838, 0.2369045, 0, 0, 1, 1, 1,
0.2057538, 1.159747, 0.8427609, 1, 0, 0, 1, 1,
0.2061341, -1.492304, 4.171877, 1, 0, 0, 1, 1,
0.2093333, 1.262098, -0.08960551, 1, 0, 0, 1, 1,
0.2094441, -0.780843, 3.589306, 1, 0, 0, 1, 1,
0.2115767, -0.3827901, 0.8228135, 1, 0, 0, 1, 1,
0.2117191, 0.9640842, -0.8133203, 0, 0, 0, 1, 1,
0.2127551, -1.083388, 2.162103, 0, 0, 0, 1, 1,
0.2153375, -1.444235, 3.13011, 0, 0, 0, 1, 1,
0.217707, -0.5590946, 3.029274, 0, 0, 0, 1, 1,
0.2195602, -0.6789122, 2.713597, 0, 0, 0, 1, 1,
0.2285528, 0.1836014, 0.8787468, 0, 0, 0, 1, 1,
0.2323833, -0.1700702, 2.760071, 0, 0, 0, 1, 1,
0.2369831, 0.4141839, 0.8437135, 1, 1, 1, 1, 1,
0.2381471, -0.4131828, 2.093617, 1, 1, 1, 1, 1,
0.2419574, 0.5251317, -0.4537455, 1, 1, 1, 1, 1,
0.245756, -1.352791, 3.043504, 1, 1, 1, 1, 1,
0.2605679, 0.2959251, 0.004068232, 1, 1, 1, 1, 1,
0.2614936, -0.02043548, 1.477016, 1, 1, 1, 1, 1,
0.2658699, 0.08010856, 0.7059826, 1, 1, 1, 1, 1,
0.2674527, 0.1891483, 1.668154, 1, 1, 1, 1, 1,
0.2765652, -1.222616, 3.74433, 1, 1, 1, 1, 1,
0.2824493, 1.635801, -1.23316, 1, 1, 1, 1, 1,
0.2827969, -0.949519, 3.40165, 1, 1, 1, 1, 1,
0.2880597, -0.06503659, 1.814106, 1, 1, 1, 1, 1,
0.2893971, -0.8629505, 3.355385, 1, 1, 1, 1, 1,
0.2905143, 0.7773867, -0.03456961, 1, 1, 1, 1, 1,
0.2949907, -0.1975319, 1.9378, 1, 1, 1, 1, 1,
0.2983584, 0.02101302, 1.57047, 0, 0, 1, 1, 1,
0.3040392, -0.6664403, 3.03786, 1, 0, 0, 1, 1,
0.310638, 0.2988564, 0.09541722, 1, 0, 0, 1, 1,
0.3140515, -0.03396099, 0.3554068, 1, 0, 0, 1, 1,
0.3145617, 0.365449, 0.9057159, 1, 0, 0, 1, 1,
0.3177658, -1.244843, 1.601728, 1, 0, 0, 1, 1,
0.3200801, -0.02885869, 2.669116, 0, 0, 0, 1, 1,
0.3203688, 0.6599411, 1.183348, 0, 0, 0, 1, 1,
0.3273529, -0.460541, 1.842668, 0, 0, 0, 1, 1,
0.3336653, 0.8725805, 0.8786426, 0, 0, 0, 1, 1,
0.3410513, 1.98418, 1.825371, 0, 0, 0, 1, 1,
0.3413084, 0.3215301, 0.3241308, 0, 0, 0, 1, 1,
0.3427823, 0.01791166, 2.037112, 0, 0, 0, 1, 1,
0.3428801, -0.1024136, 1.735055, 1, 1, 1, 1, 1,
0.3448168, 0.5564221, -1.375886, 1, 1, 1, 1, 1,
0.3474731, 0.8903244, -0.2548436, 1, 1, 1, 1, 1,
0.348667, 0.958903, 0.5982476, 1, 1, 1, 1, 1,
0.3510083, 0.3942257, 0.3057931, 1, 1, 1, 1, 1,
0.3533751, 0.2308857, -0.4384639, 1, 1, 1, 1, 1,
0.3578407, 1.273339, 1.38196, 1, 1, 1, 1, 1,
0.3587042, 1.243182, 1.077216, 1, 1, 1, 1, 1,
0.3615384, -0.0350599, -0.3421332, 1, 1, 1, 1, 1,
0.3665144, -0.8453295, 1.249262, 1, 1, 1, 1, 1,
0.3682494, -1.05972, 1.890496, 1, 1, 1, 1, 1,
0.3699237, -0.5472862, 2.340274, 1, 1, 1, 1, 1,
0.3704957, 0.03362497, 2.473137, 1, 1, 1, 1, 1,
0.374717, 1.130178, -0.2852894, 1, 1, 1, 1, 1,
0.3808018, 1.18539, 0.7582538, 1, 1, 1, 1, 1,
0.3823753, 0.3267743, 0.6917266, 0, 0, 1, 1, 1,
0.3840323, -0.1092037, -0.134047, 1, 0, 0, 1, 1,
0.3862844, 0.04626701, -0.8467677, 1, 0, 0, 1, 1,
0.3880533, -0.8743567, 3.819157, 1, 0, 0, 1, 1,
0.3893109, 0.790338, 2.097043, 1, 0, 0, 1, 1,
0.3925756, 0.896244, -0.8655508, 1, 0, 0, 1, 1,
0.3961983, -2.642185, 4.07336, 0, 0, 0, 1, 1,
0.3973269, 1.48606, 1.40544, 0, 0, 0, 1, 1,
0.400987, -0.7689604, 1.663453, 0, 0, 0, 1, 1,
0.4135599, -0.5643879, 0.6699191, 0, 0, 0, 1, 1,
0.416868, -0.6443273, 2.857137, 0, 0, 0, 1, 1,
0.4214654, 0.7896667, 0.7727875, 0, 0, 0, 1, 1,
0.4411902, -0.5397411, 2.408784, 0, 0, 0, 1, 1,
0.4423182, -0.3834373, 3.731247, 1, 1, 1, 1, 1,
0.4433742, -0.9644734, 2.008139, 1, 1, 1, 1, 1,
0.4445618, 0.007010358, 1.199717, 1, 1, 1, 1, 1,
0.4468649, 1.575105, 1.843058, 1, 1, 1, 1, 1,
0.4480317, -2.067973, 3.044441, 1, 1, 1, 1, 1,
0.457917, 0.82073, 2.045482, 1, 1, 1, 1, 1,
0.4592512, 2.555001, 1.493999, 1, 1, 1, 1, 1,
0.4596658, 0.5439752, 1.142348, 1, 1, 1, 1, 1,
0.4610094, -0.5893574, 3.22843, 1, 1, 1, 1, 1,
0.4623347, -0.3825662, 2.260764, 1, 1, 1, 1, 1,
0.4639103, 0.4817257, 0.7791506, 1, 1, 1, 1, 1,
0.4643883, -0.005153831, 2.766948, 1, 1, 1, 1, 1,
0.4655184, 0.1501182, -1.156621, 1, 1, 1, 1, 1,
0.4720869, -0.3968445, 1.026119, 1, 1, 1, 1, 1,
0.4723023, -0.5074758, 1.91512, 1, 1, 1, 1, 1,
0.4742261, 1.354005, -1.452871, 0, 0, 1, 1, 1,
0.4751522, 0.4093854, -0.2639165, 1, 0, 0, 1, 1,
0.4758713, -1.32118, 3.22477, 1, 0, 0, 1, 1,
0.4781085, -1.715934, 1.634947, 1, 0, 0, 1, 1,
0.4806902, 1.575797, 1.688875, 1, 0, 0, 1, 1,
0.4882632, 1.20008, 0.5593871, 1, 0, 0, 1, 1,
0.4893146, -1.070862, 2.339285, 0, 0, 0, 1, 1,
0.494677, 0.7812933, 0.2979868, 0, 0, 0, 1, 1,
0.4999928, 0.06992691, 0.5220165, 0, 0, 0, 1, 1,
0.5009218, -1.482372, 4.682086, 0, 0, 0, 1, 1,
0.5021954, -1.69241, 1.853756, 0, 0, 0, 1, 1,
0.5098021, -0.9410717, 2.41241, 0, 0, 0, 1, 1,
0.5114243, -0.2294623, 2.552193, 0, 0, 0, 1, 1,
0.5116112, 1.044325, -0.327466, 1, 1, 1, 1, 1,
0.5158896, -2.597267, 3.758493, 1, 1, 1, 1, 1,
0.5180455, -0.3042397, 2.996888, 1, 1, 1, 1, 1,
0.5206394, 0.8608758, 0.01130746, 1, 1, 1, 1, 1,
0.5216804, -1.839159, 2.729173, 1, 1, 1, 1, 1,
0.5229919, -1.225762, 3.573675, 1, 1, 1, 1, 1,
0.5238101, -0.1663492, 2.954941, 1, 1, 1, 1, 1,
0.5263656, 0.2641521, 1.452881, 1, 1, 1, 1, 1,
0.530883, -0.8896872, 4.508548, 1, 1, 1, 1, 1,
0.5362415, 0.03213309, 2.548962, 1, 1, 1, 1, 1,
0.5387795, -1.269306, 3.239712, 1, 1, 1, 1, 1,
0.5396962, -0.932341, 1.647762, 1, 1, 1, 1, 1,
0.5422887, -0.04859171, 1.68859, 1, 1, 1, 1, 1,
0.5461622, -0.2931778, 3.828297, 1, 1, 1, 1, 1,
0.5561662, -2.660371, 3.692838, 1, 1, 1, 1, 1,
0.5576707, 0.4374423, 2.205047, 0, 0, 1, 1, 1,
0.5635099, -0.8297189, 4.108174, 1, 0, 0, 1, 1,
0.5719216, 0.5087875, 0.7946913, 1, 0, 0, 1, 1,
0.5737922, -0.6293895, 2.15386, 1, 0, 0, 1, 1,
0.5774719, 0.1245855, -0.9305937, 1, 0, 0, 1, 1,
0.580824, -0.4888748, 0.4770254, 1, 0, 0, 1, 1,
0.5877175, -0.9565282, 3.157176, 0, 0, 0, 1, 1,
0.5878931, 1.110806, 1.525409, 0, 0, 0, 1, 1,
0.5922229, -1.492378, 3.268055, 0, 0, 0, 1, 1,
0.5928875, -0.9878826, 2.379144, 0, 0, 0, 1, 1,
0.5934695, -0.8607231, 0.2450701, 0, 0, 0, 1, 1,
0.5965488, 0.2670756, 1.633756, 0, 0, 0, 1, 1,
0.605883, 1.40359, 1.359912, 0, 0, 0, 1, 1,
0.6067097, -0.9137579, 3.697611, 1, 1, 1, 1, 1,
0.6070612, -0.7035751, 4.002744, 1, 1, 1, 1, 1,
0.6103433, -1.387627, 2.5574, 1, 1, 1, 1, 1,
0.610705, 0.6699506, 0.0005163211, 1, 1, 1, 1, 1,
0.6129693, -0.8137929, 1.583076, 1, 1, 1, 1, 1,
0.615096, 0.3622263, 1.243733, 1, 1, 1, 1, 1,
0.61627, -0.6530324, 3.510925, 1, 1, 1, 1, 1,
0.6167583, -0.9310979, 2.884691, 1, 1, 1, 1, 1,
0.6172281, 0.5778692, -0.06854685, 1, 1, 1, 1, 1,
0.6197418, -0.4978027, 0.7076162, 1, 1, 1, 1, 1,
0.6214615, 0.93694, -0.7071658, 1, 1, 1, 1, 1,
0.6241975, 0.5554078, 1.495546, 1, 1, 1, 1, 1,
0.625203, 1.821179, -1.783986, 1, 1, 1, 1, 1,
0.6261351, 0.08443023, 1.113057, 1, 1, 1, 1, 1,
0.6320233, -0.5561685, 1.020322, 1, 1, 1, 1, 1,
0.6384401, 0.8265423, 0.2209709, 0, 0, 1, 1, 1,
0.6397161, 0.1430077, 1.244404, 1, 0, 0, 1, 1,
0.6403533, -1.306576, 0.897309, 1, 0, 0, 1, 1,
0.6404721, 0.02724161, 0.5614662, 1, 0, 0, 1, 1,
0.6424411, 0.3098055, 1.013542, 1, 0, 0, 1, 1,
0.642911, -0.1315142, 0.5777795, 1, 0, 0, 1, 1,
0.6442074, -0.5739088, 1.58798, 0, 0, 0, 1, 1,
0.6460934, -1.166696, 3.122897, 0, 0, 0, 1, 1,
0.6472646, -1.546538, 2.27686, 0, 0, 0, 1, 1,
0.6497119, -0.2863851, 2.936609, 0, 0, 0, 1, 1,
0.6574789, 0.09825829, 2.158847, 0, 0, 0, 1, 1,
0.6577944, -0.2113736, 1.238205, 0, 0, 0, 1, 1,
0.6633043, -1.641975, 0.787612, 0, 0, 0, 1, 1,
0.6665516, -1.542737, 2.379079, 1, 1, 1, 1, 1,
0.6679038, 0.2598284, 1.626248, 1, 1, 1, 1, 1,
0.6691679, -1.070905, 5.448412, 1, 1, 1, 1, 1,
0.6716077, 0.4627234, -1.068577, 1, 1, 1, 1, 1,
0.6738973, 1.006056, 0.9228008, 1, 1, 1, 1, 1,
0.6807171, -0.2403134, -0.7326514, 1, 1, 1, 1, 1,
0.6876341, 1.024611, 2.431057, 1, 1, 1, 1, 1,
0.6901842, -0.7522298, 1.692808, 1, 1, 1, 1, 1,
0.6915296, 0.9866216, 1.224889, 1, 1, 1, 1, 1,
0.6957378, -0.4419241, 2.837285, 1, 1, 1, 1, 1,
0.7019442, 1.001555, 1.271573, 1, 1, 1, 1, 1,
0.707284, 2.076827, 2.339413, 1, 1, 1, 1, 1,
0.7081949, 0.4045, 0.5538167, 1, 1, 1, 1, 1,
0.710196, -1.623443, 2.959408, 1, 1, 1, 1, 1,
0.7109917, 0.654689, 1.503568, 1, 1, 1, 1, 1,
0.7125116, 0.5160734, 0.8438717, 0, 0, 1, 1, 1,
0.7164552, -0.6652713, 2.101988, 1, 0, 0, 1, 1,
0.7164603, -2.019032, 2.289992, 1, 0, 0, 1, 1,
0.7173506, -1.264529, 2.24031, 1, 0, 0, 1, 1,
0.7181438, 0.5489815, 0.4057542, 1, 0, 0, 1, 1,
0.7187892, -0.371059, 1.287941, 1, 0, 0, 1, 1,
0.7230631, -0.8722789, 1.258567, 0, 0, 0, 1, 1,
0.7250071, 0.009786895, 1.891751, 0, 0, 0, 1, 1,
0.726447, -0.4119528, 1.820458, 0, 0, 0, 1, 1,
0.7292976, -0.16267, 1.088525, 0, 0, 0, 1, 1,
0.7345389, -2.458973, 1.77065, 0, 0, 0, 1, 1,
0.7369637, -0.6247429, 2.882074, 0, 0, 0, 1, 1,
0.7397926, 2.394696, -0.5687943, 0, 0, 0, 1, 1,
0.7445073, -1.973293, 2.557636, 1, 1, 1, 1, 1,
0.7471803, 0.1587522, 0.4901944, 1, 1, 1, 1, 1,
0.7480497, 0.6734133, 0.07027265, 1, 1, 1, 1, 1,
0.7482414, -1.558115, 2.334799, 1, 1, 1, 1, 1,
0.7494934, 0.274629, 1.408964, 1, 1, 1, 1, 1,
0.751336, 0.4514556, -0.65162, 1, 1, 1, 1, 1,
0.7581732, 0.3774178, -0.2635857, 1, 1, 1, 1, 1,
0.7593685, -0.1445446, 2.105672, 1, 1, 1, 1, 1,
0.7637044, 1.229458, 2.790707, 1, 1, 1, 1, 1,
0.7695771, -0.5372448, 2.215735, 1, 1, 1, 1, 1,
0.7736357, 0.535693, 1.493448, 1, 1, 1, 1, 1,
0.7744827, -0.8163794, 2.894312, 1, 1, 1, 1, 1,
0.7768655, 0.1881704, 0.9742389, 1, 1, 1, 1, 1,
0.7769929, -0.9502914, 2.916515, 1, 1, 1, 1, 1,
0.7803132, -0.3941094, 1.710674, 1, 1, 1, 1, 1,
0.7810256, -0.4468253, 2.920441, 0, 0, 1, 1, 1,
0.7837934, 1.91838, 0.4142013, 1, 0, 0, 1, 1,
0.784241, -0.9785375, -1.057893, 1, 0, 0, 1, 1,
0.7915065, -1.54803, 1.991647, 1, 0, 0, 1, 1,
0.7928545, 1.098059, 0.6294402, 1, 0, 0, 1, 1,
0.7951608, 0.719755, 1.419855, 1, 0, 0, 1, 1,
0.7955081, -0.5200531, 1.419272, 0, 0, 0, 1, 1,
0.7978413, 0.0700373, 0.2429358, 0, 0, 0, 1, 1,
0.8048312, -0.6623701, 0.8091093, 0, 0, 0, 1, 1,
0.8066363, 1.816944, 1.851558, 0, 0, 0, 1, 1,
0.8158202, 1.212243, 0.5957103, 0, 0, 0, 1, 1,
0.8164425, 0.716274, -2.007291, 0, 0, 0, 1, 1,
0.8296731, 0.9890062, -1.039692, 0, 0, 0, 1, 1,
0.8339869, -0.8305687, 1.130685, 1, 1, 1, 1, 1,
0.8382723, -1.641682, 0.4621015, 1, 1, 1, 1, 1,
0.8385932, -0.3946412, 2.439893, 1, 1, 1, 1, 1,
0.8553446, 0.709729, 0.2168694, 1, 1, 1, 1, 1,
0.8636498, -0.1144137, 1.35989, 1, 1, 1, 1, 1,
0.8685189, -1.403232, 2.719347, 1, 1, 1, 1, 1,
0.8686537, -2.082659, 2.324584, 1, 1, 1, 1, 1,
0.879935, 0.4008426, -0.5498286, 1, 1, 1, 1, 1,
0.8853188, -0.1178716, 2.685632, 1, 1, 1, 1, 1,
0.8947809, 0.3050315, -0.05497096, 1, 1, 1, 1, 1,
0.8956152, -0.5770206, 3.625756, 1, 1, 1, 1, 1,
0.8967108, 0.002305438, 2.763641, 1, 1, 1, 1, 1,
0.913615, -0.4998972, 2.131353, 1, 1, 1, 1, 1,
0.9164588, -0.3807281, 2.644627, 1, 1, 1, 1, 1,
0.9177483, -1.903213, 0.6110426, 1, 1, 1, 1, 1,
0.9178439, 0.4997372, 0.03810285, 0, 0, 1, 1, 1,
0.9178878, -0.3887784, 2.818146, 1, 0, 0, 1, 1,
0.9187467, 0.04608492, 1.083366, 1, 0, 0, 1, 1,
0.9265236, -0.03690306, 1.309255, 1, 0, 0, 1, 1,
0.9296075, -0.9530788, 0.9499425, 1, 0, 0, 1, 1,
0.9365423, -0.4630473, 2.12457, 1, 0, 0, 1, 1,
0.9372011, 0.7626085, 0.8591891, 0, 0, 0, 1, 1,
0.9394785, -1.435254, 0.242451, 0, 0, 0, 1, 1,
0.945214, -0.6043087, 1.161467, 0, 0, 0, 1, 1,
0.9529992, -0.01851651, -0.2577268, 0, 0, 0, 1, 1,
0.9544183, 1.664338, 0.1896046, 0, 0, 0, 1, 1,
0.9645419, 0.3828239, 0.6086913, 0, 0, 0, 1, 1,
0.9658559, -1.141095, 3.021265, 0, 0, 0, 1, 1,
0.9664449, -0.553947, -0.4174078, 1, 1, 1, 1, 1,
0.9689767, 0.0532123, 2.393007, 1, 1, 1, 1, 1,
0.9701121, -1.084865, 3.264559, 1, 1, 1, 1, 1,
0.9796692, 1.251578, 0.3047558, 1, 1, 1, 1, 1,
0.9825931, -0.1467523, -0.02590528, 1, 1, 1, 1, 1,
0.9850171, 0.950166, 0.8683706, 1, 1, 1, 1, 1,
0.9870136, 1.95006, 0.9987009, 1, 1, 1, 1, 1,
0.9898972, -0.6563292, 4.587132, 1, 1, 1, 1, 1,
0.9914908, 1.849647, 1.334498, 1, 1, 1, 1, 1,
0.9977682, -1.335561, 2.654354, 1, 1, 1, 1, 1,
1.000519, -1.109118, 0.5897264, 1, 1, 1, 1, 1,
1.003121, 0.2537714, 0.3916669, 1, 1, 1, 1, 1,
1.005977, -1.307879, 4.431131, 1, 1, 1, 1, 1,
1.006967, 0.456038, 1.775094, 1, 1, 1, 1, 1,
1.009919, 1.304647, 0.0362844, 1, 1, 1, 1, 1,
1.011514, -0.1157965, 0.8030354, 0, 0, 1, 1, 1,
1.013376, -1.31397, 0.4530328, 1, 0, 0, 1, 1,
1.025863, 0.3342002, 0.06841954, 1, 0, 0, 1, 1,
1.039564, -0.2893425, 0.8579552, 1, 0, 0, 1, 1,
1.042268, -0.6407301, 2.623015, 1, 0, 0, 1, 1,
1.048326, -1.694811, 2.664248, 1, 0, 0, 1, 1,
1.053652, 0.4704798, 1.98155, 0, 0, 0, 1, 1,
1.057347, -0.9052821, 3.385523, 0, 0, 0, 1, 1,
1.064774, 0.5411465, 1.327032, 0, 0, 0, 1, 1,
1.064997, -0.5799637, 0.0252964, 0, 0, 0, 1, 1,
1.065398, 0.5007246, 1.165216, 0, 0, 0, 1, 1,
1.072701, 0.3492688, 1.603192, 0, 0, 0, 1, 1,
1.079694, -0.2948839, 0.4253314, 0, 0, 0, 1, 1,
1.085555, -0.5119511, -0.01557878, 1, 1, 1, 1, 1,
1.090527, 0.8702399, 2.680224, 1, 1, 1, 1, 1,
1.093087, 0.9247521, 0.7546574, 1, 1, 1, 1, 1,
1.095317, 0.135066, 2.461616, 1, 1, 1, 1, 1,
1.098098, -0.622103, 1.588027, 1, 1, 1, 1, 1,
1.103845, 0.4703332, 1.563059, 1, 1, 1, 1, 1,
1.104805, -1.479449, 2.133969, 1, 1, 1, 1, 1,
1.112709, 1.757069, 1.116011, 1, 1, 1, 1, 1,
1.117764, 0.1481325, 1.205182, 1, 1, 1, 1, 1,
1.119169, -1.61871, 3.473238, 1, 1, 1, 1, 1,
1.126878, 1.239605, 1.502698, 1, 1, 1, 1, 1,
1.142877, 0.5171357, 1.06023, 1, 1, 1, 1, 1,
1.148084, -0.4454461, 2.924074, 1, 1, 1, 1, 1,
1.148807, 1.370857, 2.322141, 1, 1, 1, 1, 1,
1.151576, -0.7551886, 3.888325, 1, 1, 1, 1, 1,
1.152211, 1.526148, 0.9815856, 0, 0, 1, 1, 1,
1.15314, -0.6011997, 2.245453, 1, 0, 0, 1, 1,
1.156093, 1.419378, 0.6272726, 1, 0, 0, 1, 1,
1.165841, 0.8941258, 0.3657529, 1, 0, 0, 1, 1,
1.172516, 1.030652, 1.350877, 1, 0, 0, 1, 1,
1.175269, -1.694202, 1.521287, 1, 0, 0, 1, 1,
1.176055, -0.3918577, 2.191542, 0, 0, 0, 1, 1,
1.17796, 0.5383993, 0.8481955, 0, 0, 0, 1, 1,
1.180002, -0.854809, 2.650514, 0, 0, 0, 1, 1,
1.187094, -0.0516234, 1.209548, 0, 0, 0, 1, 1,
1.187526, 1.304398, 1.961767, 0, 0, 0, 1, 1,
1.188054, -1.700833, 2.067861, 0, 0, 0, 1, 1,
1.191875, -0.5993814, 0.7311577, 0, 0, 0, 1, 1,
1.20484, -0.02744829, 1.163847, 1, 1, 1, 1, 1,
1.205464, -0.1773651, 1.980724, 1, 1, 1, 1, 1,
1.209262, -0.6454445, 2.631558, 1, 1, 1, 1, 1,
1.215621, 0.5135045, 0.223475, 1, 1, 1, 1, 1,
1.216625, -0.06539129, 0.3050763, 1, 1, 1, 1, 1,
1.226611, 0.6761093, 3.555364, 1, 1, 1, 1, 1,
1.228577, 0.001937304, 0.440305, 1, 1, 1, 1, 1,
1.238965, 0.4509883, 1.515625, 1, 1, 1, 1, 1,
1.23986, -0.4563873, 2.033254, 1, 1, 1, 1, 1,
1.242546, 1.90706, 1.579883, 1, 1, 1, 1, 1,
1.253953, -0.2497987, 2.659275, 1, 1, 1, 1, 1,
1.278071, -0.4052131, 2.014469, 1, 1, 1, 1, 1,
1.281531, -0.4087206, 1.794951, 1, 1, 1, 1, 1,
1.287422, -0.2864885, 3.158991, 1, 1, 1, 1, 1,
1.287467, 0.05109628, 0.5564045, 1, 1, 1, 1, 1,
1.290492, -0.6235993, 3.499043, 0, 0, 1, 1, 1,
1.291128, 0.6448132, 2.045201, 1, 0, 0, 1, 1,
1.30156, 1.507207, 0.6472985, 1, 0, 0, 1, 1,
1.302395, 1.031261, 2.64029, 1, 0, 0, 1, 1,
1.312752, -2.442257, 5.10181, 1, 0, 0, 1, 1,
1.314524, 1.462635, 2.629646, 1, 0, 0, 1, 1,
1.318571, 0.01831556, 0.5333628, 0, 0, 0, 1, 1,
1.326372, 0.5694335, -0.2613599, 0, 0, 0, 1, 1,
1.33217, 2.007931, 0.1243491, 0, 0, 0, 1, 1,
1.339278, -1.798342, 3.324815, 0, 0, 0, 1, 1,
1.34192, -0.1284219, 1.864601, 0, 0, 0, 1, 1,
1.365025, -0.09827817, 0.6880016, 0, 0, 0, 1, 1,
1.366161, -0.9090199, -0.08666048, 0, 0, 0, 1, 1,
1.389018, -0.3214705, 2.399669, 1, 1, 1, 1, 1,
1.392105, -1.135639, 1.63159, 1, 1, 1, 1, 1,
1.407635, 0.4680742, 0.5093104, 1, 1, 1, 1, 1,
1.410105, 1.253606, -0.1700245, 1, 1, 1, 1, 1,
1.413647, 0.8540026, 3.353386, 1, 1, 1, 1, 1,
1.415227, 0.3574151, 2.231524, 1, 1, 1, 1, 1,
1.423139, -0.2002048, 1.647128, 1, 1, 1, 1, 1,
1.425067, 0.7241597, -0.5223607, 1, 1, 1, 1, 1,
1.428527, 0.5215889, 1.01653, 1, 1, 1, 1, 1,
1.440333, -0.955996, 1.732882, 1, 1, 1, 1, 1,
1.448707, -0.7442709, 2.160429, 1, 1, 1, 1, 1,
1.462463, 0.3509961, 1.744211, 1, 1, 1, 1, 1,
1.46314, -1.54098, 4.329207, 1, 1, 1, 1, 1,
1.465909, 3.31253, -0.5093694, 1, 1, 1, 1, 1,
1.467723, 0.561945, 1.901225, 1, 1, 1, 1, 1,
1.468385, 1.446634, -0.8959298, 0, 0, 1, 1, 1,
1.482052, -0.03700027, 2.409096, 1, 0, 0, 1, 1,
1.486473, -1.23945, 0.08715265, 1, 0, 0, 1, 1,
1.487832, 0.3693782, 2.937749, 1, 0, 0, 1, 1,
1.489958, -1.068971, 3.577859, 1, 0, 0, 1, 1,
1.492923, -2.073384, 3.303474, 1, 0, 0, 1, 1,
1.498395, 0.310925, 0.7681326, 0, 0, 0, 1, 1,
1.499881, -1.134656, 3.241272, 0, 0, 0, 1, 1,
1.504323, 2.197678, 0.5592591, 0, 0, 0, 1, 1,
1.507727, -0.8253924, 2.618919, 0, 0, 0, 1, 1,
1.530478, -0.3952058, 0.9168431, 0, 0, 0, 1, 1,
1.549431, 1.52555, 2.339807, 0, 0, 0, 1, 1,
1.554158, -0.986902, 2.208593, 0, 0, 0, 1, 1,
1.554321, -1.074877, 3.438758, 1, 1, 1, 1, 1,
1.55815, 0.9746225, -0.8393362, 1, 1, 1, 1, 1,
1.567725, -0.2168196, 0.9686675, 1, 1, 1, 1, 1,
1.58125, -0.1606241, 2.855391, 1, 1, 1, 1, 1,
1.585106, 0.1287967, 1.77075, 1, 1, 1, 1, 1,
1.603779, 0.4729087, -0.7387429, 1, 1, 1, 1, 1,
1.604945, 0.7923467, 0.6005514, 1, 1, 1, 1, 1,
1.615359, 1.425664, -0.1783279, 1, 1, 1, 1, 1,
1.625901, 0.4091101, 3.063439, 1, 1, 1, 1, 1,
1.633753, -0.9022739, 1.145163, 1, 1, 1, 1, 1,
1.644856, 0.3426959, 0.2812788, 1, 1, 1, 1, 1,
1.64709, 1.361926, 0.006585388, 1, 1, 1, 1, 1,
1.673863, 0.9540488, 0.5970048, 1, 1, 1, 1, 1,
1.677495, -1.634709, 2.502326, 1, 1, 1, 1, 1,
1.677532, 2.10451, 1.468422, 1, 1, 1, 1, 1,
1.680904, 1.113343, 2.277913, 0, 0, 1, 1, 1,
1.689682, -1.734513, 2.640089, 1, 0, 0, 1, 1,
1.693664, 0.06065661, 0.8162016, 1, 0, 0, 1, 1,
1.719936, -1.787753, 1.658688, 1, 0, 0, 1, 1,
1.736679, 0.3646195, 0.4778555, 1, 0, 0, 1, 1,
1.748695, 0.4561038, 2.003071, 1, 0, 0, 1, 1,
1.77063, -2.380234, 2.530749, 0, 0, 0, 1, 1,
1.772243, 0.1515982, 2.769313, 0, 0, 0, 1, 1,
1.78237, 0.6961093, 1.191278, 0, 0, 0, 1, 1,
1.792531, -0.2216893, 2.832466, 0, 0, 0, 1, 1,
1.807045, -0.9313336, 1.90888, 0, 0, 0, 1, 1,
1.815549, 0.952347, 0.8801576, 0, 0, 0, 1, 1,
1.824157, 0.7406446, 2.848454, 0, 0, 0, 1, 1,
1.83283, 1.750762, 0.07340921, 1, 1, 1, 1, 1,
1.836364, 1.120825, 1.172698, 1, 1, 1, 1, 1,
1.852379, -1.920697, 3.55143, 1, 1, 1, 1, 1,
1.89058, -0.0004011892, 1.40275, 1, 1, 1, 1, 1,
1.92214, 1.418309, -0.05263676, 1, 1, 1, 1, 1,
1.937907, 2.316055, -0.9330554, 1, 1, 1, 1, 1,
1.941705, -0.2091808, 4.011766, 1, 1, 1, 1, 1,
1.952974, -2.076164, 3.779703, 1, 1, 1, 1, 1,
1.96983, -0.9247276, 0.7970228, 1, 1, 1, 1, 1,
1.990586, 1.145662, 0.3715253, 1, 1, 1, 1, 1,
1.993654, -0.4561824, 3.168121, 1, 1, 1, 1, 1,
2.048948, 0.299565, 1.589184, 1, 1, 1, 1, 1,
2.068371, -1.379672, 0.0240013, 1, 1, 1, 1, 1,
2.096501, 0.5161236, 1.613441, 1, 1, 1, 1, 1,
2.10655, 0.9877118, 1.201618, 1, 1, 1, 1, 1,
2.118407, -0.3663641, 1.90682, 0, 0, 1, 1, 1,
2.119396, -1.076626, 0.669849, 1, 0, 0, 1, 1,
2.149473, -0.3535441, 1.463211, 1, 0, 0, 1, 1,
2.15904, -0.5138469, 2.379642, 1, 0, 0, 1, 1,
2.214164, -1.720938, 2.595979, 1, 0, 0, 1, 1,
2.219881, 0.2147326, 2.303082, 1, 0, 0, 1, 1,
2.243839, 0.7040702, 2.060906, 0, 0, 0, 1, 1,
2.303312, 0.2207776, -0.3213991, 0, 0, 0, 1, 1,
2.327786, -0.4970782, 3.265507, 0, 0, 0, 1, 1,
2.346794, 0.394109, 0.7878911, 0, 0, 0, 1, 1,
2.364583, -1.400172, 3.387965, 0, 0, 0, 1, 1,
2.364979, -0.6889588, 1.435405, 0, 0, 0, 1, 1,
2.365778, 0.06368636, 1.982818, 0, 0, 0, 1, 1,
2.412374, 0.3239971, 2.028974, 1, 1, 1, 1, 1,
2.413747, -0.1456116, 1.320864, 1, 1, 1, 1, 1,
2.479851, 0.03870155, 1.368508, 1, 1, 1, 1, 1,
2.578442, 0.9025823, 0.1770786, 1, 1, 1, 1, 1,
2.97247, -0.6719537, 0.1393525, 1, 1, 1, 1, 1,
3.02397, -0.835662, 1.483819, 1, 1, 1, 1, 1,
3.062162, 0.2693024, 1.220527, 1, 1, 1, 1, 1
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
var radius = 9.441187;
var distance = 33.16177;
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
mvMatrix.translate( -0.129967, -0.1099651, -0.08111906 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.16177);
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
