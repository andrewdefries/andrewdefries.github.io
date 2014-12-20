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
-3.225076, -2.048588, -2.046888, 1, 0, 0, 1,
-2.999596, -0.05393694, -2.439027, 1, 0.007843138, 0, 1,
-2.775113, -1.240719, -3.776557, 1, 0.01176471, 0, 1,
-2.743967, 0.5318699, -0.6799194, 1, 0.01960784, 0, 1,
-2.562663, -0.1303268, -3.351974, 1, 0.02352941, 0, 1,
-2.483383, 0.2543785, -0.9005019, 1, 0.03137255, 0, 1,
-2.43067, 0.6856063, -0.6667162, 1, 0.03529412, 0, 1,
-2.41475, 1.103491, -0.4068277, 1, 0.04313726, 0, 1,
-2.388882, -0.8577887, -1.158893, 1, 0.04705882, 0, 1,
-2.357119, -0.8401374, -1.367525, 1, 0.05490196, 0, 1,
-2.338653, -0.8294583, -2.146352, 1, 0.05882353, 0, 1,
-2.302506, 0.712491, -2.764624, 1, 0.06666667, 0, 1,
-2.27672, -0.1576457, -2.805074, 1, 0.07058824, 0, 1,
-2.271883, 1.092754, -0.8639053, 1, 0.07843138, 0, 1,
-2.264099, -0.2603966, -3.215775, 1, 0.08235294, 0, 1,
-2.261659, -1.253431, -3.746842, 1, 0.09019608, 0, 1,
-2.241464, -1.483659, -2.7147, 1, 0.09411765, 0, 1,
-2.239413, 1.170189, 0.5539743, 1, 0.1019608, 0, 1,
-2.190557, -0.6255014, -1.278393, 1, 0.1098039, 0, 1,
-2.188403, -0.05887164, -2.012832, 1, 0.1137255, 0, 1,
-2.169972, 0.6857254, -2.674551, 1, 0.1215686, 0, 1,
-2.162197, 1.250037, -0.7427771, 1, 0.1254902, 0, 1,
-2.149188, -0.6962061, -1.873021, 1, 0.1333333, 0, 1,
-2.133371, -0.7925129, -1.368312, 1, 0.1372549, 0, 1,
-2.131364, 0.325494, -1.890464, 1, 0.145098, 0, 1,
-2.080493, 0.2682235, -1.48745, 1, 0.1490196, 0, 1,
-2.076888, -0.01146438, -1.63213, 1, 0.1568628, 0, 1,
-2.07446, -1.284641, -1.230462, 1, 0.1607843, 0, 1,
-2.07364, -0.24591, -2.38202, 1, 0.1686275, 0, 1,
-2.040901, 0.1197546, -1.686974, 1, 0.172549, 0, 1,
-2.035712, -0.1563824, -2.486073, 1, 0.1803922, 0, 1,
-2.033119, -1.177569, -1.043046, 1, 0.1843137, 0, 1,
-2.024685, -0.5975413, -1.699044, 1, 0.1921569, 0, 1,
-2.015624, -0.0413825, -2.909497, 1, 0.1960784, 0, 1,
-1.975437, 0.2386078, 0.3613632, 1, 0.2039216, 0, 1,
-1.974583, -0.3355805, -2.228084, 1, 0.2117647, 0, 1,
-1.952806, -1.229263, -1.464357, 1, 0.2156863, 0, 1,
-1.951051, 1.784965, 1.057631, 1, 0.2235294, 0, 1,
-1.924927, 0.002049921, -2.144756, 1, 0.227451, 0, 1,
-1.918151, 1.676228, -0.5391611, 1, 0.2352941, 0, 1,
-1.915179, 1.316078, -0.7253984, 1, 0.2392157, 0, 1,
-1.887408, -2.126627, -3.798589, 1, 0.2470588, 0, 1,
-1.842356, 2.384738, 1.099965, 1, 0.2509804, 0, 1,
-1.82885, 1.023409, -1.445217, 1, 0.2588235, 0, 1,
-1.82259, -0.5557039, -1.528428, 1, 0.2627451, 0, 1,
-1.819897, 1.118928, -0.4288827, 1, 0.2705882, 0, 1,
-1.807451, -0.08366254, -0.3721408, 1, 0.2745098, 0, 1,
-1.790127, -0.511378, -1.672653, 1, 0.282353, 0, 1,
-1.780159, 0.8649735, -0.3973769, 1, 0.2862745, 0, 1,
-1.772655, 1.207035, -0.4771017, 1, 0.2941177, 0, 1,
-1.752575, -0.6426696, -2.12375, 1, 0.3019608, 0, 1,
-1.747908, 0.8261552, -0.6062836, 1, 0.3058824, 0, 1,
-1.742159, 1.018207, 0.1132689, 1, 0.3137255, 0, 1,
-1.740677, 1.023265, -1.382443, 1, 0.3176471, 0, 1,
-1.736115, 0.9382514, -1.620418, 1, 0.3254902, 0, 1,
-1.728005, 0.4570072, -1.121532, 1, 0.3294118, 0, 1,
-1.722356, 1.537519, -1.224982, 1, 0.3372549, 0, 1,
-1.707936, 0.8248285, -1.07866, 1, 0.3411765, 0, 1,
-1.706355, -1.505956, -1.093299, 1, 0.3490196, 0, 1,
-1.696493, 0.7568318, 1.009863, 1, 0.3529412, 0, 1,
-1.686573, 1.434169, -2.724949, 1, 0.3607843, 0, 1,
-1.68222, -1.622491, -2.175017, 1, 0.3647059, 0, 1,
-1.681178, -1.530039, -3.111271, 1, 0.372549, 0, 1,
-1.651893, -0.5535363, -2.234792, 1, 0.3764706, 0, 1,
-1.651443, 2.275291, -1.105953, 1, 0.3843137, 0, 1,
-1.638113, -1.361894, 0.1585667, 1, 0.3882353, 0, 1,
-1.630676, 0.9970365, -1.603107, 1, 0.3960784, 0, 1,
-1.618744, -1.958763, -3.088781, 1, 0.4039216, 0, 1,
-1.616248, -0.1544045, -1.327531, 1, 0.4078431, 0, 1,
-1.613366, -0.8632683, -2.152412, 1, 0.4156863, 0, 1,
-1.605877, -0.5108855, -3.403249, 1, 0.4196078, 0, 1,
-1.605152, 1.471778, -1.189508, 1, 0.427451, 0, 1,
-1.59933, -1.085881, -3.453959, 1, 0.4313726, 0, 1,
-1.584151, 1.706832, 0.156195, 1, 0.4392157, 0, 1,
-1.581879, 1.689229, -2.568913, 1, 0.4431373, 0, 1,
-1.577477, 0.009143692, -1.442524, 1, 0.4509804, 0, 1,
-1.564868, -0.4868377, -1.121588, 1, 0.454902, 0, 1,
-1.560163, -1.422808, -2.799287, 1, 0.4627451, 0, 1,
-1.549052, 0.08616139, -2.335053, 1, 0.4666667, 0, 1,
-1.531645, 0.7744492, -1.16073, 1, 0.4745098, 0, 1,
-1.531553, -0.08759026, -1.551131, 1, 0.4784314, 0, 1,
-1.529709, -2.19047, -1.782355, 1, 0.4862745, 0, 1,
-1.519354, -1.791535, -2.749311, 1, 0.4901961, 0, 1,
-1.515515, -1.113412, -1.739413, 1, 0.4980392, 0, 1,
-1.509012, -2.252932, -3.129983, 1, 0.5058824, 0, 1,
-1.508594, -0.2836443, -1.753366, 1, 0.509804, 0, 1,
-1.503524, -1.575323, -2.462373, 1, 0.5176471, 0, 1,
-1.499484, -0.08190241, -2.955719, 1, 0.5215687, 0, 1,
-1.493895, -1.238951, -4.702772, 1, 0.5294118, 0, 1,
-1.49172, -0.7863825, -3.040886, 1, 0.5333334, 0, 1,
-1.490122, -0.263395, -2.5886, 1, 0.5411765, 0, 1,
-1.489082, 0.3741504, -0.1804196, 1, 0.5450981, 0, 1,
-1.479083, 0.9704923, 0.1349044, 1, 0.5529412, 0, 1,
-1.478943, -0.4377407, -2.733268, 1, 0.5568628, 0, 1,
-1.46764, -0.4017702, -1.807525, 1, 0.5647059, 0, 1,
-1.454707, -0.1188952, -2.627077, 1, 0.5686275, 0, 1,
-1.449026, 0.4821622, 0.5601271, 1, 0.5764706, 0, 1,
-1.439173, -0.2318928, -2.030759, 1, 0.5803922, 0, 1,
-1.436663, -2.099072, -1.780173, 1, 0.5882353, 0, 1,
-1.424821, 0.1019146, -2.880879, 1, 0.5921569, 0, 1,
-1.419302, -1.053671, -1.80785, 1, 0.6, 0, 1,
-1.414899, 0.3064247, -3.802974, 1, 0.6078432, 0, 1,
-1.408807, -0.5144786, -2.731222, 1, 0.6117647, 0, 1,
-1.40117, -0.790638, -1.156359, 1, 0.6196079, 0, 1,
-1.400085, -0.7227438, -1.044782, 1, 0.6235294, 0, 1,
-1.399059, 1.043061, 0.5737828, 1, 0.6313726, 0, 1,
-1.396238, -0.2795479, -2.781373, 1, 0.6352941, 0, 1,
-1.385104, -1.213093, -0.4761159, 1, 0.6431373, 0, 1,
-1.383321, 1.100484, -2.3849, 1, 0.6470588, 0, 1,
-1.377421, 1.222402, 0.2343878, 1, 0.654902, 0, 1,
-1.374871, -0.2541681, -1.189622, 1, 0.6588235, 0, 1,
-1.374813, -0.3943281, 0.9355322, 1, 0.6666667, 0, 1,
-1.373719, -0.8352872, -3.242085, 1, 0.6705883, 0, 1,
-1.372754, -0.865513, -0.5633687, 1, 0.6784314, 0, 1,
-1.370139, -1.767967, -0.8858269, 1, 0.682353, 0, 1,
-1.368904, 1.877008, -0.2056535, 1, 0.6901961, 0, 1,
-1.359008, 0.655757, -1.536842, 1, 0.6941177, 0, 1,
-1.352832, 0.06290646, -1.201188, 1, 0.7019608, 0, 1,
-1.344995, -1.253185, -2.62499, 1, 0.7098039, 0, 1,
-1.34126, 1.44795, -0.2328755, 1, 0.7137255, 0, 1,
-1.338339, 1.135961, -2.162488, 1, 0.7215686, 0, 1,
-1.323105, -0.8513703, 0.1134169, 1, 0.7254902, 0, 1,
-1.32092, -0.2050827, -1.669327, 1, 0.7333333, 0, 1,
-1.320876, -0.08631764, -1.985499, 1, 0.7372549, 0, 1,
-1.317716, -0.3433256, -0.3524197, 1, 0.7450981, 0, 1,
-1.31582, -0.7970999, -3.241243, 1, 0.7490196, 0, 1,
-1.315726, 2.57068, -2.883354, 1, 0.7568628, 0, 1,
-1.297113, 0.2398534, -1.805043, 1, 0.7607843, 0, 1,
-1.296092, 0.8454044, -0.4265708, 1, 0.7686275, 0, 1,
-1.292809, -2.712006, -1.971539, 1, 0.772549, 0, 1,
-1.28788, 0.6852487, -1.253125, 1, 0.7803922, 0, 1,
-1.280636, 0.7753196, -2.423291, 1, 0.7843137, 0, 1,
-1.270574, 1.346811, -1.323557, 1, 0.7921569, 0, 1,
-1.237875, 1.105487, -1.036369, 1, 0.7960784, 0, 1,
-1.231371, 0.5462654, -1.400294, 1, 0.8039216, 0, 1,
-1.229657, 0.6008766, -1.473601, 1, 0.8117647, 0, 1,
-1.22703, -1.036586, -2.247488, 1, 0.8156863, 0, 1,
-1.226414, 0.293262, -0.8064884, 1, 0.8235294, 0, 1,
-1.218125, -0.1763988, -1.985972, 1, 0.827451, 0, 1,
-1.215535, 1.553276, 0.05216983, 1, 0.8352941, 0, 1,
-1.207825, 0.2039421, -1.622925, 1, 0.8392157, 0, 1,
-1.207764, 1.346182, -0.7289283, 1, 0.8470588, 0, 1,
-1.203329, 0.6769173, -0.6180897, 1, 0.8509804, 0, 1,
-1.193953, -0.2803769, -2.127545, 1, 0.8588235, 0, 1,
-1.188745, -0.5772023, -2.752629, 1, 0.8627451, 0, 1,
-1.188354, 0.5779821, -1.509215, 1, 0.8705882, 0, 1,
-1.180879, -1.649978, -1.297952, 1, 0.8745098, 0, 1,
-1.178886, -0.4665605, -1.123032, 1, 0.8823529, 0, 1,
-1.173726, -0.04540655, -2.037401, 1, 0.8862745, 0, 1,
-1.167425, -0.478843, -2.133629, 1, 0.8941177, 0, 1,
-1.164321, 0.8394567, -1.911194, 1, 0.8980392, 0, 1,
-1.153736, -0.4025371, -4.142292, 1, 0.9058824, 0, 1,
-1.152123, 2.025923, -1.264317, 1, 0.9137255, 0, 1,
-1.151905, 0.7289643, -2.927834, 1, 0.9176471, 0, 1,
-1.151805, -0.5224571, -1.430232, 1, 0.9254902, 0, 1,
-1.134432, -0.6921468, -1.217405, 1, 0.9294118, 0, 1,
-1.12782, 0.1420507, -1.561846, 1, 0.9372549, 0, 1,
-1.126678, -0.6242595, -1.943718, 1, 0.9411765, 0, 1,
-1.12008, 1.472138, 0.406809, 1, 0.9490196, 0, 1,
-1.115418, -0.7313673, -2.119604, 1, 0.9529412, 0, 1,
-1.114778, -0.4174103, -1.183567, 1, 0.9607843, 0, 1,
-1.111794, -0.9701605, -1.799045, 1, 0.9647059, 0, 1,
-1.103351, -0.07976966, -1.483349, 1, 0.972549, 0, 1,
-1.096364, -0.06524102, -2.8504, 1, 0.9764706, 0, 1,
-1.095389, 0.8912477, -2.254111, 1, 0.9843137, 0, 1,
-1.094006, -1.244496, -2.253145, 1, 0.9882353, 0, 1,
-1.091925, 3.119227, -2.4585, 1, 0.9960784, 0, 1,
-1.090855, 0.6461924, -0.5867822, 0.9960784, 1, 0, 1,
-1.08346, -0.2204902, 0.6411853, 0.9921569, 1, 0, 1,
-1.082991, -0.08742473, -2.619945, 0.9843137, 1, 0, 1,
-1.07687, 0.4916698, -1.204628, 0.9803922, 1, 0, 1,
-1.075077, 0.3252984, -2.47524, 0.972549, 1, 0, 1,
-1.064683, 0.4065929, -0.6723557, 0.9686275, 1, 0, 1,
-1.064461, -0.1898542, -3.115853, 0.9607843, 1, 0, 1,
-1.060055, -0.2710015, -2.166507, 0.9568627, 1, 0, 1,
-1.057311, 0.05632315, -1.430472, 0.9490196, 1, 0, 1,
-1.055367, 0.5999448, 0.04708573, 0.945098, 1, 0, 1,
-1.050954, 1.552396, 1.604034, 0.9372549, 1, 0, 1,
-1.046188, -0.1530696, -2.025897, 0.9333333, 1, 0, 1,
-1.041166, 1.418312, 0.1143228, 0.9254902, 1, 0, 1,
-1.03663, 0.7259331, -0.8991238, 0.9215686, 1, 0, 1,
-1.027357, 0.4062206, 0.3733096, 0.9137255, 1, 0, 1,
-1.023813, -1.492932, -2.985713, 0.9098039, 1, 0, 1,
-1.016074, 0.4030544, -0.2550137, 0.9019608, 1, 0, 1,
-1.013152, -0.8373938, -3.556546, 0.8941177, 1, 0, 1,
-1.001683, -1.253108, -1.08849, 0.8901961, 1, 0, 1,
-0.9974346, -0.1830615, -0.00968219, 0.8823529, 1, 0, 1,
-0.9933864, 0.02753588, 0.7107056, 0.8784314, 1, 0, 1,
-0.992246, 0.6590317, -1.760267, 0.8705882, 1, 0, 1,
-0.9892008, 0.916436, -0.1436243, 0.8666667, 1, 0, 1,
-0.987837, -0.3884669, -0.706718, 0.8588235, 1, 0, 1,
-0.9870108, -1.442976, -3.179264, 0.854902, 1, 0, 1,
-0.9805424, -0.334471, -1.60547, 0.8470588, 1, 0, 1,
-0.9792436, 0.08698107, -2.008551, 0.8431373, 1, 0, 1,
-0.9754139, -0.003368202, -1.290195, 0.8352941, 1, 0, 1,
-0.9690393, -2.176456, -3.591555, 0.8313726, 1, 0, 1,
-0.9645392, -1.007412, -1.444454, 0.8235294, 1, 0, 1,
-0.9578031, 0.3371096, -1.575509, 0.8196079, 1, 0, 1,
-0.9541383, 2.33392, -0.8020286, 0.8117647, 1, 0, 1,
-0.9497071, -0.6161382, -2.44673, 0.8078431, 1, 0, 1,
-0.945721, 0.7705724, -2.133327, 0.8, 1, 0, 1,
-0.9440622, -0.3431227, -0.9835325, 0.7921569, 1, 0, 1,
-0.9434173, -2.373368, -1.838542, 0.7882353, 1, 0, 1,
-0.9380876, -0.7818981, -2.002644, 0.7803922, 1, 0, 1,
-0.934379, 0.93766, -0.7055991, 0.7764706, 1, 0, 1,
-0.9308028, -0.03614229, -3.781634, 0.7686275, 1, 0, 1,
-0.9187616, 0.2910967, -2.12882, 0.7647059, 1, 0, 1,
-0.9161922, 0.4132513, 0.7476591, 0.7568628, 1, 0, 1,
-0.9121737, 0.5414137, -1.577914, 0.7529412, 1, 0, 1,
-0.9022589, 2.424847, -0.6863198, 0.7450981, 1, 0, 1,
-0.8987585, -0.74599, -1.77533, 0.7411765, 1, 0, 1,
-0.8967587, 1.288632, -0.8293655, 0.7333333, 1, 0, 1,
-0.8946936, -0.7761859, -2.820958, 0.7294118, 1, 0, 1,
-0.8925509, 1.478168, -1.401329, 0.7215686, 1, 0, 1,
-0.8893236, 1.743688, 0.669674, 0.7176471, 1, 0, 1,
-0.8809432, -0.5797241, -2.118351, 0.7098039, 1, 0, 1,
-0.8784617, 1.501919, -0.7564954, 0.7058824, 1, 0, 1,
-0.8745948, -1.151489, -2.332162, 0.6980392, 1, 0, 1,
-0.860221, -0.8185683, -4.061896, 0.6901961, 1, 0, 1,
-0.8566428, -0.06809465, -2.760681, 0.6862745, 1, 0, 1,
-0.8557687, 0.4317082, 0.8346898, 0.6784314, 1, 0, 1,
-0.8538731, -0.357886, -1.583446, 0.6745098, 1, 0, 1,
-0.8531788, 0.3560143, -2.047188, 0.6666667, 1, 0, 1,
-0.8503065, 1.506169, -3.064591, 0.6627451, 1, 0, 1,
-0.8427958, 1.249543, -0.6119279, 0.654902, 1, 0, 1,
-0.8322805, 1.235283, -0.219608, 0.6509804, 1, 0, 1,
-0.8305243, 0.6188526, -2.73402, 0.6431373, 1, 0, 1,
-0.8255436, -0.3072776, -2.134816, 0.6392157, 1, 0, 1,
-0.8233865, 0.6684485, -2.125038, 0.6313726, 1, 0, 1,
-0.8209805, -0.5241153, -1.736547, 0.627451, 1, 0, 1,
-0.8168728, 1.131788, -1.328762, 0.6196079, 1, 0, 1,
-0.8120145, -0.5790995, -2.021739, 0.6156863, 1, 0, 1,
-0.8015522, 1.199585, 0.326638, 0.6078432, 1, 0, 1,
-0.7985271, 0.6165019, -1.48508, 0.6039216, 1, 0, 1,
-0.797547, -1.208145, -2.604342, 0.5960785, 1, 0, 1,
-0.7973295, 1.617685, -1.118008, 0.5882353, 1, 0, 1,
-0.7955596, 0.3041951, -0.7210654, 0.5843138, 1, 0, 1,
-0.7950078, -0.09363769, -0.494958, 0.5764706, 1, 0, 1,
-0.7924693, 1.275964, 0.2486586, 0.572549, 1, 0, 1,
-0.79019, 0.2599264, 0.3924133, 0.5647059, 1, 0, 1,
-0.7896387, 1.082449, -1.216293, 0.5607843, 1, 0, 1,
-0.7895159, 0.3405156, -0.3709779, 0.5529412, 1, 0, 1,
-0.7885025, 1.774685, 1.60097, 0.5490196, 1, 0, 1,
-0.7866826, 0.2321924, -1.620226, 0.5411765, 1, 0, 1,
-0.7833401, -0.9231099, -1.742642, 0.5372549, 1, 0, 1,
-0.776055, -0.2672799, -3.333981, 0.5294118, 1, 0, 1,
-0.7698438, 0.1243247, -1.410247, 0.5254902, 1, 0, 1,
-0.7686537, -0.5884995, -0.7431452, 0.5176471, 1, 0, 1,
-0.7645299, 0.9530303, -1.133884, 0.5137255, 1, 0, 1,
-0.7596008, 0.6962149, -1.219112, 0.5058824, 1, 0, 1,
-0.7579885, -0.8252499, -2.009855, 0.5019608, 1, 0, 1,
-0.75646, -1.890579, -2.645618, 0.4941176, 1, 0, 1,
-0.7539352, -0.4993204, -2.52656, 0.4862745, 1, 0, 1,
-0.7513462, 0.5390257, -0.7165156, 0.4823529, 1, 0, 1,
-0.7440559, -1.52333, -1.302064, 0.4745098, 1, 0, 1,
-0.7284244, -0.8894064, -4.12844, 0.4705882, 1, 0, 1,
-0.7276103, -0.3041061, -1.616129, 0.4627451, 1, 0, 1,
-0.7237124, -0.4815216, -2.75213, 0.4588235, 1, 0, 1,
-0.7236944, -1.215395, -2.149552, 0.4509804, 1, 0, 1,
-0.7224269, 0.686305, 0.513644, 0.4470588, 1, 0, 1,
-0.7177977, 0.02197364, -2.027706, 0.4392157, 1, 0, 1,
-0.7156774, -1.106302, -2.503803, 0.4352941, 1, 0, 1,
-0.713456, -1.428151, -3.356149, 0.427451, 1, 0, 1,
-0.7092718, 0.4065126, -2.131912, 0.4235294, 1, 0, 1,
-0.7080565, -0.8349894, -2.549384, 0.4156863, 1, 0, 1,
-0.7010666, 1.859657, 0.1631442, 0.4117647, 1, 0, 1,
-0.6997936, -0.2302586, -2.208367, 0.4039216, 1, 0, 1,
-0.692704, 1.602272, -0.4885208, 0.3960784, 1, 0, 1,
-0.6889781, 0.1444986, 0.5336578, 0.3921569, 1, 0, 1,
-0.6860574, 0.2729676, -0.9565831, 0.3843137, 1, 0, 1,
-0.683782, 0.654889, -0.3312981, 0.3803922, 1, 0, 1,
-0.680975, 0.4309232, -0.4696348, 0.372549, 1, 0, 1,
-0.6787558, -0.2235037, -0.652874, 0.3686275, 1, 0, 1,
-0.6604861, -1.11467, -2.72319, 0.3607843, 1, 0, 1,
-0.6559142, 0.9242071, -0.353893, 0.3568628, 1, 0, 1,
-0.6515017, -0.08754369, -3.406326, 0.3490196, 1, 0, 1,
-0.6503093, 0.2718799, -1.273386, 0.345098, 1, 0, 1,
-0.639147, 2.062882, 1.141039, 0.3372549, 1, 0, 1,
-0.6376863, -0.808942, -3.768278, 0.3333333, 1, 0, 1,
-0.6337146, 0.2651867, -1.438416, 0.3254902, 1, 0, 1,
-0.6322864, -0.5844414, -3.478639, 0.3215686, 1, 0, 1,
-0.6305425, -0.07961333, -4.048788, 0.3137255, 1, 0, 1,
-0.6269245, 1.063839, 0.955952, 0.3098039, 1, 0, 1,
-0.6261144, 0.08134677, -0.6597173, 0.3019608, 1, 0, 1,
-0.6222073, -1.158188, -2.927804, 0.2941177, 1, 0, 1,
-0.6202551, -0.0361906, 0.1116058, 0.2901961, 1, 0, 1,
-0.6152362, 1.396925, -1.168705, 0.282353, 1, 0, 1,
-0.6151304, -0.4822269, -1.249086, 0.2784314, 1, 0, 1,
-0.6141225, 0.1348657, -0.8453195, 0.2705882, 1, 0, 1,
-0.6079365, 0.648066, -1.927871, 0.2666667, 1, 0, 1,
-0.5992684, -0.1606887, -2.226897, 0.2588235, 1, 0, 1,
-0.5971895, 0.9586127, 0.1057252, 0.254902, 1, 0, 1,
-0.59348, -0.0917808, -1.061556, 0.2470588, 1, 0, 1,
-0.5903364, 0.2618779, -0.09263843, 0.2431373, 1, 0, 1,
-0.5839765, -1.920298, -3.177836, 0.2352941, 1, 0, 1,
-0.5835146, -0.9132479, -3.700847, 0.2313726, 1, 0, 1,
-0.5795435, -1.72435, -2.880455, 0.2235294, 1, 0, 1,
-0.5717809, -0.156178, -0.9796311, 0.2196078, 1, 0, 1,
-0.5678615, -0.1538879, -2.985528, 0.2117647, 1, 0, 1,
-0.5671756, 0.7480857, 0.09480283, 0.2078431, 1, 0, 1,
-0.5666563, -0.8797235, -1.885172, 0.2, 1, 0, 1,
-0.5655655, 0.1183082, 0.4314323, 0.1921569, 1, 0, 1,
-0.5652155, -0.336261, -3.133716, 0.1882353, 1, 0, 1,
-0.5642964, -0.1135728, -2.352015, 0.1803922, 1, 0, 1,
-0.5640851, 0.3633586, 0.3311739, 0.1764706, 1, 0, 1,
-0.5614103, 0.7439095, -1.015466, 0.1686275, 1, 0, 1,
-0.5592474, -0.3274604, -2.716238, 0.1647059, 1, 0, 1,
-0.5484053, -0.7493867, -2.17096, 0.1568628, 1, 0, 1,
-0.5435174, 1.588659, -0.9962733, 0.1529412, 1, 0, 1,
-0.5405651, -0.5200354, -1.579163, 0.145098, 1, 0, 1,
-0.5380018, -2.119442, -3.611432, 0.1411765, 1, 0, 1,
-0.5348101, 0.6515189, -0.9603988, 0.1333333, 1, 0, 1,
-0.5258254, 1.195414, 1.489801, 0.1294118, 1, 0, 1,
-0.5234194, 0.1189357, -1.028674, 0.1215686, 1, 0, 1,
-0.5206653, -0.06078973, -3.580654, 0.1176471, 1, 0, 1,
-0.5177591, -1.213508, -3.770724, 0.1098039, 1, 0, 1,
-0.5139166, -1.58228, -2.128111, 0.1058824, 1, 0, 1,
-0.5066485, 0.9702828, -1.639813, 0.09803922, 1, 0, 1,
-0.5044677, 0.6786497, 0.8876627, 0.09019608, 1, 0, 1,
-0.5025054, 1.452767, -0.06243212, 0.08627451, 1, 0, 1,
-0.5000816, -0.4556141, -0.2393211, 0.07843138, 1, 0, 1,
-0.4988202, 0.2857221, -1.667725, 0.07450981, 1, 0, 1,
-0.4908306, -0.8974777, -2.287416, 0.06666667, 1, 0, 1,
-0.4891, 1.050673, 0.04763027, 0.0627451, 1, 0, 1,
-0.4876315, 0.5838016, 0.3582409, 0.05490196, 1, 0, 1,
-0.4850016, -1.366495, -2.356801, 0.05098039, 1, 0, 1,
-0.4834201, 1.014567, 0.1621828, 0.04313726, 1, 0, 1,
-0.4834031, 1.811737, 0.2672492, 0.03921569, 1, 0, 1,
-0.4809139, -0.7619175, -3.292396, 0.03137255, 1, 0, 1,
-0.4797001, 0.3278149, -1.294123, 0.02745098, 1, 0, 1,
-0.4745709, -0.03802231, -0.7320105, 0.01960784, 1, 0, 1,
-0.4737824, -1.192021, -5.463423, 0.01568628, 1, 0, 1,
-0.4717422, 0.4553675, -1.403924, 0.007843138, 1, 0, 1,
-0.47081, -0.3635238, -2.979086, 0.003921569, 1, 0, 1,
-0.4692477, 0.1202371, -0.2854085, 0, 1, 0.003921569, 1,
-0.4653029, 1.341916, -0.6014755, 0, 1, 0.01176471, 1,
-0.4534267, 1.806234, -1.03121, 0, 1, 0.01568628, 1,
-0.4507664, -0.2224787, -1.179698, 0, 1, 0.02352941, 1,
-0.44888, -0.9396051, -4.679618, 0, 1, 0.02745098, 1,
-0.4412508, -0.9245887, -2.357846, 0, 1, 0.03529412, 1,
-0.4355188, 0.777067, -0.2849258, 0, 1, 0.03921569, 1,
-0.4347023, 0.7247877, -0.9829645, 0, 1, 0.04705882, 1,
-0.4340132, -1.558341, -2.421319, 0, 1, 0.05098039, 1,
-0.4318964, 1.087007, -0.2181967, 0, 1, 0.05882353, 1,
-0.411935, 0.1736027, 0.6998091, 0, 1, 0.0627451, 1,
-0.4068176, -0.7921457, -4.056315, 0, 1, 0.07058824, 1,
-0.4043856, 0.41816, 0.540751, 0, 1, 0.07450981, 1,
-0.4029158, 1.892826, 1.360479, 0, 1, 0.08235294, 1,
-0.4021896, 1.624524, -0.9882079, 0, 1, 0.08627451, 1,
-0.3956352, 1.599136, -1.488394, 0, 1, 0.09411765, 1,
-0.3944629, -0.9642932, -3.05425, 0, 1, 0.1019608, 1,
-0.3940789, 0.7187083, 1.98121, 0, 1, 0.1058824, 1,
-0.3921891, 0.01020047, -1.799507, 0, 1, 0.1137255, 1,
-0.3916144, -0.282627, -0.7779442, 0, 1, 0.1176471, 1,
-0.3903054, -1.1337, -4.337832, 0, 1, 0.1254902, 1,
-0.3848012, -0.07050313, -3.135597, 0, 1, 0.1294118, 1,
-0.3846921, -0.06244585, -2.106777, 0, 1, 0.1372549, 1,
-0.3837202, -0.1305718, -1.389572, 0, 1, 0.1411765, 1,
-0.3830017, 0.9569325, -0.08653349, 0, 1, 0.1490196, 1,
-0.3829508, 0.8736513, -0.4266736, 0, 1, 0.1529412, 1,
-0.3807813, 1.209094, -1.216481, 0, 1, 0.1607843, 1,
-0.3786332, -0.7562508, -1.900081, 0, 1, 0.1647059, 1,
-0.3759113, 0.5961901, -0.872073, 0, 1, 0.172549, 1,
-0.3738679, 1.422132, 0.6101851, 0, 1, 0.1764706, 1,
-0.3729958, 0.1446688, -1.218608, 0, 1, 0.1843137, 1,
-0.3629006, -0.7152306, -2.774316, 0, 1, 0.1882353, 1,
-0.3616107, 0.1547655, -1.012385, 0, 1, 0.1960784, 1,
-0.3564415, -1.137283, -2.87825, 0, 1, 0.2039216, 1,
-0.3460136, -1.17163, -2.652922, 0, 1, 0.2078431, 1,
-0.3459983, -1.647427, -1.870887, 0, 1, 0.2156863, 1,
-0.3444724, -0.7030833, -2.550115, 0, 1, 0.2196078, 1,
-0.3394042, -0.2590873, -1.613998, 0, 1, 0.227451, 1,
-0.3365813, 0.17307, -0.307991, 0, 1, 0.2313726, 1,
-0.3336271, -0.7442433, -2.176619, 0, 1, 0.2392157, 1,
-0.3229498, -0.9889274, -2.077808, 0, 1, 0.2431373, 1,
-0.3171504, 1.51119, 0.2198537, 0, 1, 0.2509804, 1,
-0.316419, -0.06359444, -2.644782, 0, 1, 0.254902, 1,
-0.312273, -0.7610867, -4.093309, 0, 1, 0.2627451, 1,
-0.3089386, -0.7944536, -3.622175, 0, 1, 0.2666667, 1,
-0.3026758, 0.871354, -0.3056335, 0, 1, 0.2745098, 1,
-0.2997229, 0.8816158, 0.6966145, 0, 1, 0.2784314, 1,
-0.2968748, -0.04813116, 0.07325917, 0, 1, 0.2862745, 1,
-0.2947842, -0.2162627, -2.403175, 0, 1, 0.2901961, 1,
-0.2924879, 2.69408, -0.6151776, 0, 1, 0.2980392, 1,
-0.2887021, -0.1805758, -3.110316, 0, 1, 0.3058824, 1,
-0.2875715, 1.269024, -0.8957267, 0, 1, 0.3098039, 1,
-0.2832125, 0.5178139, -0.8799823, 0, 1, 0.3176471, 1,
-0.2831742, 0.09878197, -0.0829654, 0, 1, 0.3215686, 1,
-0.280837, 1.236985, -0.2115968, 0, 1, 0.3294118, 1,
-0.2799636, 0.9268507, -0.3946007, 0, 1, 0.3333333, 1,
-0.2792553, -1.350143, -1.875844, 0, 1, 0.3411765, 1,
-0.2775271, 0.3433017, -0.2081651, 0, 1, 0.345098, 1,
-0.2743942, 0.5692964, -0.3258133, 0, 1, 0.3529412, 1,
-0.2743321, 0.2284892, 0.1822876, 0, 1, 0.3568628, 1,
-0.2738003, -1.391234, -1.88417, 0, 1, 0.3647059, 1,
-0.2715707, -0.409608, -3.17772, 0, 1, 0.3686275, 1,
-0.2684487, -0.4633221, -3.460166, 0, 1, 0.3764706, 1,
-0.2666129, 0.8986287, -1.270291, 0, 1, 0.3803922, 1,
-0.2635326, -0.2199074, -0.9010566, 0, 1, 0.3882353, 1,
-0.2595546, -0.4169534, -3.153903, 0, 1, 0.3921569, 1,
-0.2530207, -0.5039524, -2.216534, 0, 1, 0.4, 1,
-0.2507346, 1.376744, 0.894293, 0, 1, 0.4078431, 1,
-0.2462766, -0.9249821, -1.827221, 0, 1, 0.4117647, 1,
-0.2388355, -0.2357789, -4.599814, 0, 1, 0.4196078, 1,
-0.2374287, 2.074512, -0.3354612, 0, 1, 0.4235294, 1,
-0.2367249, -0.3532589, -1.764111, 0, 1, 0.4313726, 1,
-0.2340536, 2.007635, -0.6942071, 0, 1, 0.4352941, 1,
-0.2329519, -0.4341657, -2.536166, 0, 1, 0.4431373, 1,
-0.2289215, -0.5761067, -2.232809, 0, 1, 0.4470588, 1,
-0.226364, -0.3042156, -4.355362, 0, 1, 0.454902, 1,
-0.2239641, -1.343657, -2.430398, 0, 1, 0.4588235, 1,
-0.223788, -0.009296391, 1.393347, 0, 1, 0.4666667, 1,
-0.2228317, -0.8143909, -3.989717, 0, 1, 0.4705882, 1,
-0.2211492, -0.8596975, -3.102294, 0, 1, 0.4784314, 1,
-0.2200177, 0.6436407, -0.2109182, 0, 1, 0.4823529, 1,
-0.2182431, -0.2763574, -1.382239, 0, 1, 0.4901961, 1,
-0.2179799, -2.376509, -3.244716, 0, 1, 0.4941176, 1,
-0.2174761, 0.3620762, -1.048211, 0, 1, 0.5019608, 1,
-0.2122321, 1.976307, 0.5091664, 0, 1, 0.509804, 1,
-0.2114945, 0.9433241, -0.5863571, 0, 1, 0.5137255, 1,
-0.2091097, 0.7971228, 0.6738455, 0, 1, 0.5215687, 1,
-0.2067956, -1.36142, -2.064054, 0, 1, 0.5254902, 1,
-0.1992561, -0.07414415, -0.5844564, 0, 1, 0.5333334, 1,
-0.198963, 0.1589494, -0.6653545, 0, 1, 0.5372549, 1,
-0.198328, 0.1554624, -2.082005, 0, 1, 0.5450981, 1,
-0.1953063, -0.09390841, -2.281306, 0, 1, 0.5490196, 1,
-0.1914853, -0.9936611, -4.063966, 0, 1, 0.5568628, 1,
-0.1905642, -0.7581252, -4.561476, 0, 1, 0.5607843, 1,
-0.1864202, -0.549143, -4.630132, 0, 1, 0.5686275, 1,
-0.1859805, 0.2410332, -1.588128, 0, 1, 0.572549, 1,
-0.1849728, 0.5334895, 0.2751984, 0, 1, 0.5803922, 1,
-0.1847154, 0.8507649, 0.1074344, 0, 1, 0.5843138, 1,
-0.1831619, 0.7217458, 0.8669409, 0, 1, 0.5921569, 1,
-0.1827254, 1.681629, -1.229344, 0, 1, 0.5960785, 1,
-0.1825616, -0.8462595, -4.110858, 0, 1, 0.6039216, 1,
-0.1822417, 0.2838064, -0.201647, 0, 1, 0.6117647, 1,
-0.1809078, 1.229635, 2.759144, 0, 1, 0.6156863, 1,
-0.1757549, -0.1744139, -1.384484, 0, 1, 0.6235294, 1,
-0.1704404, -0.3402795, -2.892549, 0, 1, 0.627451, 1,
-0.1624883, -0.8911981, -2.629565, 0, 1, 0.6352941, 1,
-0.1607559, -2.048342, -2.918596, 0, 1, 0.6392157, 1,
-0.1539423, -0.08984473, 0.07204182, 0, 1, 0.6470588, 1,
-0.150408, -0.1419166, -1.596148, 0, 1, 0.6509804, 1,
-0.1482054, -0.5744378, -5.206711, 0, 1, 0.6588235, 1,
-0.1450232, 0.3564678, -3.241061, 0, 1, 0.6627451, 1,
-0.1379995, -0.9940672, -0.8870781, 0, 1, 0.6705883, 1,
-0.1355718, -0.7731028, -2.479534, 0, 1, 0.6745098, 1,
-0.1327759, -1.435612, -2.745356, 0, 1, 0.682353, 1,
-0.1287966, 0.02110584, -1.643983, 0, 1, 0.6862745, 1,
-0.128104, -0.4799238, -2.799361, 0, 1, 0.6941177, 1,
-0.1228897, 0.8644791, 0.7634355, 0, 1, 0.7019608, 1,
-0.1220305, 0.7058566, 0.08651947, 0, 1, 0.7058824, 1,
-0.1212649, 0.3130601, -0.156355, 0, 1, 0.7137255, 1,
-0.1206618, 1.927295, -1.561611, 0, 1, 0.7176471, 1,
-0.1178416, 0.07877598, -1.257349, 0, 1, 0.7254902, 1,
-0.1174364, -1.373525, -2.630399, 0, 1, 0.7294118, 1,
-0.1167953, -1.841679, -2.342184, 0, 1, 0.7372549, 1,
-0.1156928, 0.459679, -2.4639, 0, 1, 0.7411765, 1,
-0.1134226, -0.09630714, -2.358779, 0, 1, 0.7490196, 1,
-0.1133556, 1.321299, -1.28154, 0, 1, 0.7529412, 1,
-0.1129723, -1.289162, -4.425398, 0, 1, 0.7607843, 1,
-0.1122571, 0.3056224, -0.7957633, 0, 1, 0.7647059, 1,
-0.1030235, -1.623712, -2.514263, 0, 1, 0.772549, 1,
-0.1015445, 1.049858, 2.011235, 0, 1, 0.7764706, 1,
-0.09804916, 0.07786513, -1.111366, 0, 1, 0.7843137, 1,
-0.09707475, 1.808534, 0.7374797, 0, 1, 0.7882353, 1,
-0.09672574, 1.733169, -0.4813624, 0, 1, 0.7960784, 1,
-0.09144208, 1.463067, 0.5998164, 0, 1, 0.8039216, 1,
-0.09129594, 3.047132, 1.149332, 0, 1, 0.8078431, 1,
-0.08774574, 1.248893, -0.3682386, 0, 1, 0.8156863, 1,
-0.08762932, 0.5721771, -0.8256952, 0, 1, 0.8196079, 1,
-0.08562462, 0.4438431, 0.06692106, 0, 1, 0.827451, 1,
-0.08536626, -0.8211492, -3.001435, 0, 1, 0.8313726, 1,
-0.08394942, 0.04497295, -1.351734, 0, 1, 0.8392157, 1,
-0.0835534, -0.006180036, -0.7931364, 0, 1, 0.8431373, 1,
-0.06982457, -1.672646, -3.524393, 0, 1, 0.8509804, 1,
-0.06947565, -1.122009, -3.493609, 0, 1, 0.854902, 1,
-0.0652739, -1.475185, -3.345795, 0, 1, 0.8627451, 1,
-0.06390117, -0.06822356, -2.737432, 0, 1, 0.8666667, 1,
-0.0632908, -1.23907, -3.872313, 0, 1, 0.8745098, 1,
-0.06176673, -0.8262951, -3.900953, 0, 1, 0.8784314, 1,
-0.06120436, -1.215553, -2.19155, 0, 1, 0.8862745, 1,
-0.05774755, 0.4999656, -0.3123269, 0, 1, 0.8901961, 1,
-0.05764743, 0.9024258, -0.6564029, 0, 1, 0.8980392, 1,
-0.05363936, 1.403209, 0.3462465, 0, 1, 0.9058824, 1,
-0.05199766, -1.677181, -3.658686, 0, 1, 0.9098039, 1,
-0.04889793, 0.8147807, -0.9522091, 0, 1, 0.9176471, 1,
-0.04882395, -0.382553, -1.471696, 0, 1, 0.9215686, 1,
-0.04736497, -0.2328325, -3.639327, 0, 1, 0.9294118, 1,
-0.04608778, 0.38619, 0.7880844, 0, 1, 0.9333333, 1,
-0.04452743, 0.01210981, -1.138209, 0, 1, 0.9411765, 1,
-0.04281814, -0.7596847, -1.638699, 0, 1, 0.945098, 1,
-0.04220215, -1.942883, -2.860817, 0, 1, 0.9529412, 1,
-0.04088797, 0.6322078, -0.4289021, 0, 1, 0.9568627, 1,
-0.03950248, -0.9906414, -2.819457, 0, 1, 0.9647059, 1,
-0.03774734, 2.09301, 0.07986677, 0, 1, 0.9686275, 1,
-0.0355638, 0.006983864, -1.68614, 0, 1, 0.9764706, 1,
-0.02449185, 1.935785, 0.1819323, 0, 1, 0.9803922, 1,
-0.01981339, 0.9350923, -2.675239, 0, 1, 0.9882353, 1,
-0.01814882, -0.6396844, -1.65325, 0, 1, 0.9921569, 1,
-0.01725516, -0.1020493, -2.957117, 0, 1, 1, 1,
-0.01447105, 0.6590096, 0.3090703, 0, 0.9921569, 1, 1,
-0.01342696, -1.307138, -2.38492, 0, 0.9882353, 1, 1,
-0.01152539, 1.208294, 0.1595299, 0, 0.9803922, 1, 1,
-0.0110019, 0.4942358, -0.7289236, 0, 0.9764706, 1, 1,
-0.004142763, -0.5023063, -2.642039, 0, 0.9686275, 1, 1,
-0.0002844771, -0.352377, -2.356262, 0, 0.9647059, 1, 1,
-7.938087e-05, 0.09863382, -0.4695773, 0, 0.9568627, 1, 1,
2.108871e-05, -1.513795, 2.924007, 0, 0.9529412, 1, 1,
0.001090352, 0.7844159, -0.1172999, 0, 0.945098, 1, 1,
0.003605921, 0.1408872, -1.278101, 0, 0.9411765, 1, 1,
0.003906308, -1.628123, 1.373501, 0, 0.9333333, 1, 1,
0.004849139, 0.3901165, 0.3062245, 0, 0.9294118, 1, 1,
0.004978366, -0.4286059, 4.981946, 0, 0.9215686, 1, 1,
0.005795143, -0.5039909, 4.996421, 0, 0.9176471, 1, 1,
0.006876902, -0.1283715, 2.242273, 0, 0.9098039, 1, 1,
0.01187305, -1.255696, 1.95767, 0, 0.9058824, 1, 1,
0.01194105, 0.6524727, -1.038022, 0, 0.8980392, 1, 1,
0.03188466, 1.719066, -1.835209, 0, 0.8901961, 1, 1,
0.03254792, 0.843367, 0.4427068, 0, 0.8862745, 1, 1,
0.03402955, 0.4694782, -0.08546792, 0, 0.8784314, 1, 1,
0.0342254, 0.5414044, -0.6717321, 0, 0.8745098, 1, 1,
0.04007348, -0.4656815, 3.97354, 0, 0.8666667, 1, 1,
0.04194209, -1.331685, 2.709535, 0, 0.8627451, 1, 1,
0.04443092, 0.9251428, 0.165732, 0, 0.854902, 1, 1,
0.04504091, -0.364202, 3.100659, 0, 0.8509804, 1, 1,
0.04531205, 0.4794391, -0.1329874, 0, 0.8431373, 1, 1,
0.04953569, -0.3261491, 6.262718, 0, 0.8392157, 1, 1,
0.05215149, 0.7250366, -0.3698328, 0, 0.8313726, 1, 1,
0.05298922, -1.068878, 2.617638, 0, 0.827451, 1, 1,
0.05429473, -0.8668333, 3.68652, 0, 0.8196079, 1, 1,
0.05620832, 0.03592854, 0.7843881, 0, 0.8156863, 1, 1,
0.05705346, -0.006789497, -0.9101591, 0, 0.8078431, 1, 1,
0.06168654, -1.695214, 3.586292, 0, 0.8039216, 1, 1,
0.06250565, 0.5598714, 0.2721674, 0, 0.7960784, 1, 1,
0.0648863, 0.1989722, 0.6001801, 0, 0.7882353, 1, 1,
0.06730779, -0.4128058, 2.480188, 0, 0.7843137, 1, 1,
0.06757642, -1.22039, 5.759472, 0, 0.7764706, 1, 1,
0.06824626, -0.1121403, 3.089075, 0, 0.772549, 1, 1,
0.06892115, 1.340081, -0.2489008, 0, 0.7647059, 1, 1,
0.07090127, 1.000532, -0.03968082, 0, 0.7607843, 1, 1,
0.07111049, -0.2995543, 4.212326, 0, 0.7529412, 1, 1,
0.07205132, 0.135825, 1.034385, 0, 0.7490196, 1, 1,
0.07550046, 0.08752429, -0.8171607, 0, 0.7411765, 1, 1,
0.07636902, 0.2791228, 0.5827597, 0, 0.7372549, 1, 1,
0.07774581, 1.502192, 0.1044735, 0, 0.7294118, 1, 1,
0.07873666, 0.8850423, -0.05500883, 0, 0.7254902, 1, 1,
0.08204154, 0.1589737, 2.371609, 0, 0.7176471, 1, 1,
0.08272907, -0.4779562, 2.565392, 0, 0.7137255, 1, 1,
0.0839283, 2.389771, -1.107299, 0, 0.7058824, 1, 1,
0.08697602, 1.462729, -0.2445212, 0, 0.6980392, 1, 1,
0.08797012, -0.6363369, 3.245421, 0, 0.6941177, 1, 1,
0.08831131, -0.991891, 2.963897, 0, 0.6862745, 1, 1,
0.08917376, 1.143034, -0.8874766, 0, 0.682353, 1, 1,
0.08945188, -0.4837812, 2.975817, 0, 0.6745098, 1, 1,
0.09143347, 0.1918303, 0.9619359, 0, 0.6705883, 1, 1,
0.0929013, 1.124498, -2.404642, 0, 0.6627451, 1, 1,
0.09377015, 0.2020949, 0.7308612, 0, 0.6588235, 1, 1,
0.09521148, 0.2704987, -1.000192, 0, 0.6509804, 1, 1,
0.09666228, 0.7496606, 0.3846296, 0, 0.6470588, 1, 1,
0.1020847, -0.2014197, 1.264907, 0, 0.6392157, 1, 1,
0.1023043, 0.3790511, -0.8803471, 0, 0.6352941, 1, 1,
0.1060801, -0.654902, 5.585079, 0, 0.627451, 1, 1,
0.110467, -1.367088, 3.070465, 0, 0.6235294, 1, 1,
0.1121889, -0.3036043, 3.320546, 0, 0.6156863, 1, 1,
0.1155742, 0.3848514, -0.2922032, 0, 0.6117647, 1, 1,
0.1156471, -1.035607, 1.940468, 0, 0.6039216, 1, 1,
0.1163684, -0.2625812, 3.321219, 0, 0.5960785, 1, 1,
0.1194524, 0.7900154, 0.3548871, 0, 0.5921569, 1, 1,
0.1215797, -0.7096784, 2.578109, 0, 0.5843138, 1, 1,
0.1216696, 1.955107, -1.240018, 0, 0.5803922, 1, 1,
0.1244585, 0.1948438, 1.317668, 0, 0.572549, 1, 1,
0.1247559, -0.5414643, 4.662327, 0, 0.5686275, 1, 1,
0.1256607, -1.307708, 4.592536, 0, 0.5607843, 1, 1,
0.1293364, -0.2790496, 3.984763, 0, 0.5568628, 1, 1,
0.1382463, -0.545373, 3.030982, 0, 0.5490196, 1, 1,
0.142471, 1.013405, 0.5664303, 0, 0.5450981, 1, 1,
0.1513802, -0.01804921, 2.478304, 0, 0.5372549, 1, 1,
0.1532236, -0.4038164, 4.846819, 0, 0.5333334, 1, 1,
0.1568196, 1.049397, 1.061881, 0, 0.5254902, 1, 1,
0.1572974, -2.11308, 3.864238, 0, 0.5215687, 1, 1,
0.1591649, -0.5248953, 3.893417, 0, 0.5137255, 1, 1,
0.1594853, -1.072484, 3.335619, 0, 0.509804, 1, 1,
0.1611781, -0.8297387, 2.677149, 0, 0.5019608, 1, 1,
0.1614806, 2.481662, -0.1991715, 0, 0.4941176, 1, 1,
0.1648833, 0.1702858, 0.7411719, 0, 0.4901961, 1, 1,
0.1648914, -1.587026, 3.126433, 0, 0.4823529, 1, 1,
0.1668698, -0.5849165, 2.542306, 0, 0.4784314, 1, 1,
0.1676847, -0.3916674, 2.452487, 0, 0.4705882, 1, 1,
0.1699406, 1.424916, 2.768387, 0, 0.4666667, 1, 1,
0.1722925, 0.3675869, -0.8981853, 0, 0.4588235, 1, 1,
0.1767168, 1.007421, 0.1002604, 0, 0.454902, 1, 1,
0.1769741, 0.6037436, 0.4341052, 0, 0.4470588, 1, 1,
0.1806265, 0.2435246, -0.006462848, 0, 0.4431373, 1, 1,
0.1862538, -0.3071291, 3.2175, 0, 0.4352941, 1, 1,
0.1863007, -0.2376678, 4.256361, 0, 0.4313726, 1, 1,
0.1880613, 0.4312202, -1.389776, 0, 0.4235294, 1, 1,
0.1892923, -0.4782439, 1.122179, 0, 0.4196078, 1, 1,
0.1930879, -0.7473056, 2.34444, 0, 0.4117647, 1, 1,
0.1945495, -0.2945859, 2.101888, 0, 0.4078431, 1, 1,
0.1964339, 0.5005291, 0.4595441, 0, 0.4, 1, 1,
0.2011522, -0.478678, 1.797853, 0, 0.3921569, 1, 1,
0.208025, 1.33358, 0.02120301, 0, 0.3882353, 1, 1,
0.2100758, 0.1785855, 2.199582, 0, 0.3803922, 1, 1,
0.2131473, -0.8597232, 3.545373, 0, 0.3764706, 1, 1,
0.2197154, 1.798506, 1.576788, 0, 0.3686275, 1, 1,
0.2319355, -0.2903745, 3.226674, 0, 0.3647059, 1, 1,
0.2375161, -0.8250205, 2.137016, 0, 0.3568628, 1, 1,
0.2396448, 0.9293563, 1.698381, 0, 0.3529412, 1, 1,
0.2416961, -0.8837469, 3.688645, 0, 0.345098, 1, 1,
0.2428162, 0.8428203, 1.861806, 0, 0.3411765, 1, 1,
0.2446914, 1.072134, 0.8375358, 0, 0.3333333, 1, 1,
0.2514441, -0.7058632, 2.716396, 0, 0.3294118, 1, 1,
0.2557836, -1.08072, 3.479746, 0, 0.3215686, 1, 1,
0.2596979, 1.222625, -1.490152, 0, 0.3176471, 1, 1,
0.2598698, -1.896312, 3.872592, 0, 0.3098039, 1, 1,
0.2602116, 1.180814, -0.8245943, 0, 0.3058824, 1, 1,
0.2681932, -1.292025, 4.122352, 0, 0.2980392, 1, 1,
0.272332, -0.9032389, 3.084137, 0, 0.2901961, 1, 1,
0.2787937, -1.796225, 1.797569, 0, 0.2862745, 1, 1,
0.2789419, 1.351903, -1.912552, 0, 0.2784314, 1, 1,
0.2794161, 0.9052908, 0.9355475, 0, 0.2745098, 1, 1,
0.2813983, 0.6728947, -0.8257108, 0, 0.2666667, 1, 1,
0.2839519, 0.07890159, 3.848614, 0, 0.2627451, 1, 1,
0.283959, 0.3899754, 0.8779171, 0, 0.254902, 1, 1,
0.2859917, -0.3906066, 2.077107, 0, 0.2509804, 1, 1,
0.2911039, 0.3709331, -0.932856, 0, 0.2431373, 1, 1,
0.2920386, -0.03322805, 4.124202, 0, 0.2392157, 1, 1,
0.3018132, 0.08479848, 1.446787, 0, 0.2313726, 1, 1,
0.3018253, -0.1869511, 2.176788, 0, 0.227451, 1, 1,
0.3028958, -1.848544, 2.605617, 0, 0.2196078, 1, 1,
0.3061371, -0.7689402, 2.812446, 0, 0.2156863, 1, 1,
0.3092538, 1.094897, -2.272193, 0, 0.2078431, 1, 1,
0.3120764, -0.1408634, 1.314588, 0, 0.2039216, 1, 1,
0.3128063, -0.9360775, 3.784791, 0, 0.1960784, 1, 1,
0.3159477, 1.440663, 1.708038, 0, 0.1882353, 1, 1,
0.3220364, 1.719224, 0.6775912, 0, 0.1843137, 1, 1,
0.3229008, -0.448396, 0.7807487, 0, 0.1764706, 1, 1,
0.3264426, 1.288897, 0.9503558, 0, 0.172549, 1, 1,
0.3315414, 0.1773557, 1.33141, 0, 0.1647059, 1, 1,
0.3369735, 0.7766817, 1.061304, 0, 0.1607843, 1, 1,
0.3376201, -0.01248284, 1.397247, 0, 0.1529412, 1, 1,
0.3386018, 0.3047298, 2.266278, 0, 0.1490196, 1, 1,
0.3411114, 1.732772, 0.8647914, 0, 0.1411765, 1, 1,
0.3436342, 1.041746, -0.9270619, 0, 0.1372549, 1, 1,
0.3533452, -0.9796047, 2.699417, 0, 0.1294118, 1, 1,
0.3546846, 1.673655, -0.8414643, 0, 0.1254902, 1, 1,
0.3569919, 0.1612129, 2.416911, 0, 0.1176471, 1, 1,
0.3627366, -0.3140662, 2.811642, 0, 0.1137255, 1, 1,
0.3629698, 0.125165, 2.08835, 0, 0.1058824, 1, 1,
0.3633287, 0.3381901, 1.140217, 0, 0.09803922, 1, 1,
0.3637437, 0.9868488, 0.3546874, 0, 0.09411765, 1, 1,
0.3667408, 1.177954, 1.704004, 0, 0.08627451, 1, 1,
0.3678227, 0.4884589, -0.9115093, 0, 0.08235294, 1, 1,
0.3685206, 2.336369, -0.609075, 0, 0.07450981, 1, 1,
0.3712153, 0.7396678, 0.03325212, 0, 0.07058824, 1, 1,
0.3744916, 1.431205, 1.135998, 0, 0.0627451, 1, 1,
0.3765285, 1.142505, 0.5880489, 0, 0.05882353, 1, 1,
0.3806254, 0.04925353, 1.656775, 0, 0.05098039, 1, 1,
0.3808038, 1.137683, -1.010234, 0, 0.04705882, 1, 1,
0.3879332, 0.4441508, 2.645303, 0, 0.03921569, 1, 1,
0.388986, -1.054464, 5.936524, 0, 0.03529412, 1, 1,
0.3962905, 1.755076, -0.5147514, 0, 0.02745098, 1, 1,
0.4002558, 0.02013852, 1.496597, 0, 0.02352941, 1, 1,
0.4006324, 0.8856041, -1.32345, 0, 0.01568628, 1, 1,
0.4013567, 1.113059, 1.863156, 0, 0.01176471, 1, 1,
0.406739, -0.3005053, 3.628241, 0, 0.003921569, 1, 1,
0.4083673, -0.008998073, 1.257808, 0.003921569, 0, 1, 1,
0.4096404, 0.1453176, 2.096821, 0.007843138, 0, 1, 1,
0.4148019, -0.4334305, 3.080337, 0.01568628, 0, 1, 1,
0.4154833, 0.8102948, 0.5822601, 0.01960784, 0, 1, 1,
0.4158294, -0.8336543, 2.872873, 0.02745098, 0, 1, 1,
0.4166718, 1.269439, 1.132951, 0.03137255, 0, 1, 1,
0.4192863, 1.398964, 0.3334733, 0.03921569, 0, 1, 1,
0.4197271, 0.7935607, -0.2808832, 0.04313726, 0, 1, 1,
0.4229823, -1.088384, 1.265424, 0.05098039, 0, 1, 1,
0.4237221, 1.975577, 0.6102928, 0.05490196, 0, 1, 1,
0.4249181, 0.171795, 1.430209, 0.0627451, 0, 1, 1,
0.4252357, -0.8662674, 2.022313, 0.06666667, 0, 1, 1,
0.4253229, -0.3782064, 2.92107, 0.07450981, 0, 1, 1,
0.42613, -0.1590252, 2.06245, 0.07843138, 0, 1, 1,
0.4291191, -1.835023, 2.621364, 0.08627451, 0, 1, 1,
0.4323356, 1.532067, 0.4432813, 0.09019608, 0, 1, 1,
0.4415659, -0.2185759, 3.707854, 0.09803922, 0, 1, 1,
0.4445369, 0.7300599, 0.4693852, 0.1058824, 0, 1, 1,
0.4496916, 0.3320101, 1.894946, 0.1098039, 0, 1, 1,
0.4519037, -1.412019, 2.039994, 0.1176471, 0, 1, 1,
0.4525859, -0.3463385, 1.400455, 0.1215686, 0, 1, 1,
0.4526219, 0.2024573, 0.1143291, 0.1294118, 0, 1, 1,
0.4558037, -0.7440026, 3.197058, 0.1333333, 0, 1, 1,
0.4632276, -1.358417, 2.815287, 0.1411765, 0, 1, 1,
0.4654665, -1.668228, 3.137875, 0.145098, 0, 1, 1,
0.4663682, -1.19968, 2.3848, 0.1529412, 0, 1, 1,
0.4678659, -0.0946495, 1.652851, 0.1568628, 0, 1, 1,
0.4791247, 1.461666, 1.041695, 0.1647059, 0, 1, 1,
0.4854273, -0.4470214, -0.05973739, 0.1686275, 0, 1, 1,
0.4906835, 0.7951543, 1.100898, 0.1764706, 0, 1, 1,
0.4915967, 1.169509, -0.442974, 0.1803922, 0, 1, 1,
0.4923081, 2.338768, 1.028358, 0.1882353, 0, 1, 1,
0.4936607, -0.3318726, 3.267803, 0.1921569, 0, 1, 1,
0.4952065, 0.2743089, 1.673358, 0.2, 0, 1, 1,
0.4971947, -0.8523299, 3.649539, 0.2078431, 0, 1, 1,
0.5025581, 1.851884, 0.2127298, 0.2117647, 0, 1, 1,
0.5037684, -1.23941, 1.613317, 0.2196078, 0, 1, 1,
0.504446, -1.783623, 1.88799, 0.2235294, 0, 1, 1,
0.5061337, -0.2229152, -0.7940896, 0.2313726, 0, 1, 1,
0.5089321, -0.1987178, 1.865457, 0.2352941, 0, 1, 1,
0.5153598, -0.3200606, 2.288281, 0.2431373, 0, 1, 1,
0.5170451, 0.1845752, 0.378029, 0.2470588, 0, 1, 1,
0.5176176, -0.6807199, 1.364345, 0.254902, 0, 1, 1,
0.5193576, -1.086925, 2.530105, 0.2588235, 0, 1, 1,
0.5196425, -0.9316905, 2.932543, 0.2666667, 0, 1, 1,
0.5220917, -1.544841, 2.876664, 0.2705882, 0, 1, 1,
0.5244951, -1.024816, 3.379172, 0.2784314, 0, 1, 1,
0.5248389, 0.01910871, 2.195002, 0.282353, 0, 1, 1,
0.5275184, -1.675109, 3.043977, 0.2901961, 0, 1, 1,
0.5303672, -0.2843486, 3.169225, 0.2941177, 0, 1, 1,
0.5376657, -0.03053477, 3.473421, 0.3019608, 0, 1, 1,
0.5405265, -1.175203, 4.223861, 0.3098039, 0, 1, 1,
0.542322, 0.6938288, 0.03777117, 0.3137255, 0, 1, 1,
0.544413, -0.09891161, 2.890069, 0.3215686, 0, 1, 1,
0.5469217, -0.8297981, 3.293039, 0.3254902, 0, 1, 1,
0.5515199, 0.6484314, 0.5186579, 0.3333333, 0, 1, 1,
0.5521523, 0.2276759, 1.311269, 0.3372549, 0, 1, 1,
0.553361, -0.0005316749, 3.103025, 0.345098, 0, 1, 1,
0.5584189, -0.788381, 2.0551, 0.3490196, 0, 1, 1,
0.5655804, 0.02874106, 3.774678, 0.3568628, 0, 1, 1,
0.5656661, -1.443448, 2.488868, 0.3607843, 0, 1, 1,
0.5756876, -0.3538552, 2.351828, 0.3686275, 0, 1, 1,
0.58201, -1.045784, 1.062329, 0.372549, 0, 1, 1,
0.5834955, -0.8035543, 2.417723, 0.3803922, 0, 1, 1,
0.5871307, -0.3310704, 2.352356, 0.3843137, 0, 1, 1,
0.588038, -0.5168959, 0.4699004, 0.3921569, 0, 1, 1,
0.5896773, -0.4617653, 1.257719, 0.3960784, 0, 1, 1,
0.5940093, 0.4455625, 2.537306, 0.4039216, 0, 1, 1,
0.5961277, 0.05583155, 0.4464503, 0.4117647, 0, 1, 1,
0.596284, 1.258926, 1.100591, 0.4156863, 0, 1, 1,
0.597019, -0.906351, 3.747925, 0.4235294, 0, 1, 1,
0.5991406, -1.894095, 1.61296, 0.427451, 0, 1, 1,
0.5998303, -1.057799, 3.229316, 0.4352941, 0, 1, 1,
0.6019739, -1.375448, 3.059095, 0.4392157, 0, 1, 1,
0.606796, -0.9562569, 3.551893, 0.4470588, 0, 1, 1,
0.609143, -0.3571228, 2.959883, 0.4509804, 0, 1, 1,
0.6116364, 0.971813, 0.831343, 0.4588235, 0, 1, 1,
0.6147917, 0.8753211, 1.950416, 0.4627451, 0, 1, 1,
0.6158189, -2.107657, 0.4086708, 0.4705882, 0, 1, 1,
0.6222251, -0.2928034, 1.042726, 0.4745098, 0, 1, 1,
0.622301, -0.9113056, 2.650587, 0.4823529, 0, 1, 1,
0.6252173, -0.7295659, 4.296022, 0.4862745, 0, 1, 1,
0.6283219, 1.295195, 1.833625, 0.4941176, 0, 1, 1,
0.628944, 0.7443449, -0.3613446, 0.5019608, 0, 1, 1,
0.6308067, 1.56891, -0.7286373, 0.5058824, 0, 1, 1,
0.6345569, 0.1373179, 1.85144, 0.5137255, 0, 1, 1,
0.6350779, 0.8171026, 1.608607, 0.5176471, 0, 1, 1,
0.6354009, -1.801806, 3.641362, 0.5254902, 0, 1, 1,
0.6361381, 0.8339901, 1.040592, 0.5294118, 0, 1, 1,
0.6396735, 0.8039162, 0.1871191, 0.5372549, 0, 1, 1,
0.64053, 0.2305009, -0.3081062, 0.5411765, 0, 1, 1,
0.6457968, 0.3126532, 1.629638, 0.5490196, 0, 1, 1,
0.6461254, -0.4001296, 2.819629, 0.5529412, 0, 1, 1,
0.6489092, -1.285951, 1.631333, 0.5607843, 0, 1, 1,
0.6491994, 0.4245968, 2.474388, 0.5647059, 0, 1, 1,
0.6496066, -0.5522046, 2.928256, 0.572549, 0, 1, 1,
0.6501337, 0.1521506, 2.865824, 0.5764706, 0, 1, 1,
0.6507072, 1.675321, -0.2014027, 0.5843138, 0, 1, 1,
0.6529714, -0.9164789, 2.193448, 0.5882353, 0, 1, 1,
0.6533647, 0.3289609, -0.3604879, 0.5960785, 0, 1, 1,
0.6571274, 1.125911, 0.1469507, 0.6039216, 0, 1, 1,
0.6595635, 0.5097655, 1.351115, 0.6078432, 0, 1, 1,
0.6599194, 0.06656583, 1.238169, 0.6156863, 0, 1, 1,
0.661819, -1.474259, 3.409706, 0.6196079, 0, 1, 1,
0.6658475, 1.098994, 0.1345911, 0.627451, 0, 1, 1,
0.6703413, -1.300781, 3.700585, 0.6313726, 0, 1, 1,
0.6728124, -0.5351534, 2.390967, 0.6392157, 0, 1, 1,
0.6738428, -1.085591, -0.4647942, 0.6431373, 0, 1, 1,
0.6745986, -0.006170146, 1.795503, 0.6509804, 0, 1, 1,
0.6748007, -1.384698, 3.048909, 0.654902, 0, 1, 1,
0.6851245, 0.2536556, 1.126446, 0.6627451, 0, 1, 1,
0.693584, 0.6383958, 1.884882, 0.6666667, 0, 1, 1,
0.6959408, 0.05671773, 0.1098569, 0.6745098, 0, 1, 1,
0.6960613, -0.4747853, 4.509083, 0.6784314, 0, 1, 1,
0.701686, 1.075005, 0.1058925, 0.6862745, 0, 1, 1,
0.7035521, -0.4763966, 1.406891, 0.6901961, 0, 1, 1,
0.7037811, 0.2898049, 3.39904, 0.6980392, 0, 1, 1,
0.7078323, -1.171279, 4.79553, 0.7058824, 0, 1, 1,
0.7153599, -0.1697742, 1.009189, 0.7098039, 0, 1, 1,
0.7201535, 0.82142, 0.8011665, 0.7176471, 0, 1, 1,
0.730872, -0.8560375, 1.144535, 0.7215686, 0, 1, 1,
0.7347727, 0.4846099, 1.712166, 0.7294118, 0, 1, 1,
0.7374506, -0.3668036, 3.138678, 0.7333333, 0, 1, 1,
0.7394986, 1.409858, -0.3893682, 0.7411765, 0, 1, 1,
0.7405005, -0.1801919, 3.008949, 0.7450981, 0, 1, 1,
0.7405115, -1.329496, 1.112888, 0.7529412, 0, 1, 1,
0.7499769, 0.9779369, 0.4625802, 0.7568628, 0, 1, 1,
0.7510744, -0.5336676, 2.183778, 0.7647059, 0, 1, 1,
0.7517654, 1.804691, -0.2246557, 0.7686275, 0, 1, 1,
0.7549051, -0.562462, 2.613755, 0.7764706, 0, 1, 1,
0.7566302, -1.138379, 1.69783, 0.7803922, 0, 1, 1,
0.7601393, 0.2456539, 1.553594, 0.7882353, 0, 1, 1,
0.7622589, -0.9799112, 0.999914, 0.7921569, 0, 1, 1,
0.7672758, -0.5203238, 2.685752, 0.8, 0, 1, 1,
0.7808213, -1.196906, 2.754735, 0.8078431, 0, 1, 1,
0.7837, -1.500363, 2.61256, 0.8117647, 0, 1, 1,
0.7953899, -1.443497, 2.928422, 0.8196079, 0, 1, 1,
0.7969912, 0.1558006, 1.82818, 0.8235294, 0, 1, 1,
0.8041347, -0.1630346, 4.090616, 0.8313726, 0, 1, 1,
0.805855, -0.7972093, 2.791455, 0.8352941, 0, 1, 1,
0.8060556, 0.8487443, 0.5500425, 0.8431373, 0, 1, 1,
0.8084131, -1.033182, 2.429391, 0.8470588, 0, 1, 1,
0.8110098, -0.9522127, 1.687258, 0.854902, 0, 1, 1,
0.8223168, -0.8847447, 0.8143373, 0.8588235, 0, 1, 1,
0.8322875, -0.4997165, 2.32398, 0.8666667, 0, 1, 1,
0.8377773, -0.6728516, 2.169061, 0.8705882, 0, 1, 1,
0.8404211, 0.9562091, 0.9381708, 0.8784314, 0, 1, 1,
0.8456341, -0.1860032, 1.298428, 0.8823529, 0, 1, 1,
0.8473813, 0.6022649, 1.998698, 0.8901961, 0, 1, 1,
0.8578185, 1.231838, -1.786063, 0.8941177, 0, 1, 1,
0.8591326, -0.3825081, 2.491956, 0.9019608, 0, 1, 1,
0.8606442, 0.05264694, 2.343297, 0.9098039, 0, 1, 1,
0.861499, -0.3981195, 1.265046, 0.9137255, 0, 1, 1,
0.8786576, -0.8331584, 1.498514, 0.9215686, 0, 1, 1,
0.8812492, -1.733538, 3.475478, 0.9254902, 0, 1, 1,
0.8829443, 0.01070517, 3.166728, 0.9333333, 0, 1, 1,
0.8835742, -0.3773863, 1.976896, 0.9372549, 0, 1, 1,
0.9033482, 0.3730651, 1.195665, 0.945098, 0, 1, 1,
0.9066889, 0.6556302, 0.3096709, 0.9490196, 0, 1, 1,
0.9100614, 0.6781929, 1.720227, 0.9568627, 0, 1, 1,
0.9102492, -0.005237635, 1.810314, 0.9607843, 0, 1, 1,
0.9103241, 2.399773, -0.2244432, 0.9686275, 0, 1, 1,
0.9122387, -0.9541056, 2.752986, 0.972549, 0, 1, 1,
0.9173146, -0.3076765, 2.735102, 0.9803922, 0, 1, 1,
0.9201679, 0.005579558, 3.299532, 0.9843137, 0, 1, 1,
0.9214585, 0.1796514, 3.107864, 0.9921569, 0, 1, 1,
0.9223267, -0.3023008, 2.594352, 0.9960784, 0, 1, 1,
0.9236448, 0.5795754, 0.9454274, 1, 0, 0.9960784, 1,
0.9278736, 0.2173406, 1.43319, 1, 0, 0.9882353, 1,
0.9304643, 0.1661536, 0.2837967, 1, 0, 0.9843137, 1,
0.9351185, -1.021969, 1.296811, 1, 0, 0.9764706, 1,
0.9403345, 0.1079142, 1.248755, 1, 0, 0.972549, 1,
0.95872, 0.03020605, 0.9552277, 1, 0, 0.9647059, 1,
0.96982, 0.6656803, 1.47231, 1, 0, 0.9607843, 1,
0.9702699, 0.03634708, 1.844452, 1, 0, 0.9529412, 1,
0.971845, 0.1128826, 1.04443, 1, 0, 0.9490196, 1,
0.9719322, 0.5184244, -0.712017, 1, 0, 0.9411765, 1,
0.9749526, -2.085934, 3.677492, 1, 0, 0.9372549, 1,
0.9784942, 1.375536, -0.7436056, 1, 0, 0.9294118, 1,
0.9827946, -0.8388453, 4.349717, 1, 0, 0.9254902, 1,
0.9880708, 0.6485913, 0.8360964, 1, 0, 0.9176471, 1,
0.9953979, -1.021972, 3.168144, 1, 0, 0.9137255, 1,
1.009861, 0.08972594, 1.436177, 1, 0, 0.9058824, 1,
1.027215, -0.9546843, 2.488872, 1, 0, 0.9019608, 1,
1.031562, -1.686189, 2.19832, 1, 0, 0.8941177, 1,
1.031799, -0.683789, 3.359886, 1, 0, 0.8862745, 1,
1.040616, -0.2214469, 1.574786, 1, 0, 0.8823529, 1,
1.040935, -0.9355482, 0.1654116, 1, 0, 0.8745098, 1,
1.046776, 1.483746, 0.3964345, 1, 0, 0.8705882, 1,
1.052714, -0.8602284, 3.611816, 1, 0, 0.8627451, 1,
1.05818, -1.948437, 3.074836, 1, 0, 0.8588235, 1,
1.061474, -1.577609, 2.977036, 1, 0, 0.8509804, 1,
1.072062, 0.01634771, 0.5162129, 1, 0, 0.8470588, 1,
1.087826, 0.04981693, 3.250227, 1, 0, 0.8392157, 1,
1.091621, -0.5230602, 2.015605, 1, 0, 0.8352941, 1,
1.096313, -0.724641, 2.288553, 1, 0, 0.827451, 1,
1.115568, -2.291825, 4.521355, 1, 0, 0.8235294, 1,
1.120676, -0.6920717, 0.9647774, 1, 0, 0.8156863, 1,
1.12606, -0.01372182, 0.7285124, 1, 0, 0.8117647, 1,
1.127562, -0.828379, 0.4913248, 1, 0, 0.8039216, 1,
1.131182, 0.6682324, 0.5784179, 1, 0, 0.7960784, 1,
1.146103, -1.080392, 2.107335, 1, 0, 0.7921569, 1,
1.154087, -1.077537, 2.60999, 1, 0, 0.7843137, 1,
1.178801, 0.4561916, 1.088863, 1, 0, 0.7803922, 1,
1.182957, -0.4316971, 0.2233032, 1, 0, 0.772549, 1,
1.186377, 0.3138823, 1.502783, 1, 0, 0.7686275, 1,
1.186733, 1.575849, 1.728897, 1, 0, 0.7607843, 1,
1.188798, -1.69197, 1.638276, 1, 0, 0.7568628, 1,
1.191162, -1.037683, 2.842856, 1, 0, 0.7490196, 1,
1.206495, -0.1819081, 1.920515, 1, 0, 0.7450981, 1,
1.208819, -1.00424, 2.821324, 1, 0, 0.7372549, 1,
1.211786, 1.390653, 2.573929, 1, 0, 0.7333333, 1,
1.212962, -0.9618428, 1.469638, 1, 0, 0.7254902, 1,
1.221769, 0.32292, 0.9824717, 1, 0, 0.7215686, 1,
1.231732, -0.09466136, 1.755572, 1, 0, 0.7137255, 1,
1.235571, -0.4826679, 2.185133, 1, 0, 0.7098039, 1,
1.241563, 1.538267, 1.825245, 1, 0, 0.7019608, 1,
1.251884, -0.5034907, 3.50049, 1, 0, 0.6941177, 1,
1.258344, -0.347298, 3.020905, 1, 0, 0.6901961, 1,
1.258798, 0.4684442, 1.238073, 1, 0, 0.682353, 1,
1.260522, -0.7138813, 0.8416568, 1, 0, 0.6784314, 1,
1.265497, 0.2784025, 1.066531, 1, 0, 0.6705883, 1,
1.269124, 0.8236016, 1.892689, 1, 0, 0.6666667, 1,
1.272829, 0.925116, 1.71424, 1, 0, 0.6588235, 1,
1.278985, 0.08845518, 0.6953238, 1, 0, 0.654902, 1,
1.295097, 0.4662401, 0.4796644, 1, 0, 0.6470588, 1,
1.296524, 0.2820674, 0.8640375, 1, 0, 0.6431373, 1,
1.316053, 0.9126513, 1.079435, 1, 0, 0.6352941, 1,
1.321735, 0.817695, 1.218245, 1, 0, 0.6313726, 1,
1.329469, -1.925368, 3.017461, 1, 0, 0.6235294, 1,
1.33005, -0.6897585, 1.482292, 1, 0, 0.6196079, 1,
1.336714, 1.996924, -0.3886018, 1, 0, 0.6117647, 1,
1.338612, 0.9326739, 2.222121, 1, 0, 0.6078432, 1,
1.348865, -0.5935716, 4.006397, 1, 0, 0.6, 1,
1.350009, -0.59209, 1.973342, 1, 0, 0.5921569, 1,
1.359149, 1.307859, 2.047163, 1, 0, 0.5882353, 1,
1.362713, -0.3184197, 1.676372, 1, 0, 0.5803922, 1,
1.363861, -1.45488, 0.6681319, 1, 0, 0.5764706, 1,
1.381408, 0.2562498, -1.05065, 1, 0, 0.5686275, 1,
1.382496, 1.05905, -0.1542906, 1, 0, 0.5647059, 1,
1.382673, -0.3577922, 2.270473, 1, 0, 0.5568628, 1,
1.396831, 0.1482694, 0.1209785, 1, 0, 0.5529412, 1,
1.402751, 1.092343, 1.154684, 1, 0, 0.5450981, 1,
1.404872, 0.2980572, 0.8137863, 1, 0, 0.5411765, 1,
1.405232, -0.6080781, 1.918479, 1, 0, 0.5333334, 1,
1.406042, 0.2320091, 2.623825, 1, 0, 0.5294118, 1,
1.40645, 0.05760512, 2.573699, 1, 0, 0.5215687, 1,
1.407055, -0.2326897, 0.976901, 1, 0, 0.5176471, 1,
1.410008, 0.9996769, -0.351376, 1, 0, 0.509804, 1,
1.413277, -1.287256, 2.159916, 1, 0, 0.5058824, 1,
1.423613, 2.000563, -0.662191, 1, 0, 0.4980392, 1,
1.423831, -0.8416777, 1.972074, 1, 0, 0.4901961, 1,
1.42553, 0.05049447, 2.537293, 1, 0, 0.4862745, 1,
1.42575, -1.257518, 3.301816, 1, 0, 0.4784314, 1,
1.428491, -1.587783, 0.4636728, 1, 0, 0.4745098, 1,
1.429171, -0.3025415, 2.353756, 1, 0, 0.4666667, 1,
1.435126, -2.219367, 0.7920916, 1, 0, 0.4627451, 1,
1.439145, -1.271632, 2.07287, 1, 0, 0.454902, 1,
1.45039, -0.6294771, 1.728293, 1, 0, 0.4509804, 1,
1.460832, 0.009246415, 1.828453, 1, 0, 0.4431373, 1,
1.470034, -0.7395138, 0.5651035, 1, 0, 0.4392157, 1,
1.475639, 0.9097188, 1.809437, 1, 0, 0.4313726, 1,
1.481259, 0.8441269, 1.927603, 1, 0, 0.427451, 1,
1.486461, -0.8826683, 2.396274, 1, 0, 0.4196078, 1,
1.497665, -0.8200806, 1.210009, 1, 0, 0.4156863, 1,
1.510823, 0.7317284, 1.803012, 1, 0, 0.4078431, 1,
1.51173, -0.361525, 3.205099, 1, 0, 0.4039216, 1,
1.535673, -1.987884, 1.302028, 1, 0, 0.3960784, 1,
1.549109, 1.000316, 0.3624015, 1, 0, 0.3882353, 1,
1.559438, 0.6347282, 1.487408, 1, 0, 0.3843137, 1,
1.561771, 0.9151362, -1.682396, 1, 0, 0.3764706, 1,
1.566313, -0.6998593, 1.109568, 1, 0, 0.372549, 1,
1.5762, 0.4809923, 1.311263, 1, 0, 0.3647059, 1,
1.59418, -0.4524278, 2.364411, 1, 0, 0.3607843, 1,
1.611031, 1.945514, 0.3615435, 1, 0, 0.3529412, 1,
1.61557, -0.03824507, 0.6788521, 1, 0, 0.3490196, 1,
1.631293, -0.3219067, 1.119589, 1, 0, 0.3411765, 1,
1.639696, -0.744809, 0.8131507, 1, 0, 0.3372549, 1,
1.647127, -0.04030256, 0.3258838, 1, 0, 0.3294118, 1,
1.660428, -0.1882205, 1.855626, 1, 0, 0.3254902, 1,
1.660647, 0.5262066, 0.8187827, 1, 0, 0.3176471, 1,
1.670776, -0.114038, 1.713112, 1, 0, 0.3137255, 1,
1.682261, 0.5564014, 1.298953, 1, 0, 0.3058824, 1,
1.683245, -1.170925, 0.4441925, 1, 0, 0.2980392, 1,
1.691633, -1.705729, 2.503929, 1, 0, 0.2941177, 1,
1.723417, 1.304217, 1.235242, 1, 0, 0.2862745, 1,
1.729371, -0.7580951, 0.568302, 1, 0, 0.282353, 1,
1.739491, -0.4100697, 3.13001, 1, 0, 0.2745098, 1,
1.752272, 2.086477, 1.187294, 1, 0, 0.2705882, 1,
1.767412, -0.5385284, 0.8432731, 1, 0, 0.2627451, 1,
1.770528, -0.6085014, 1.824916, 1, 0, 0.2588235, 1,
1.780051, -1.740588, 0.3043105, 1, 0, 0.2509804, 1,
1.79393, -0.7933784, -0.4273205, 1, 0, 0.2470588, 1,
1.813478, 0.122156, 0.8699566, 1, 0, 0.2392157, 1,
1.824077, 0.1334632, 2.682803, 1, 0, 0.2352941, 1,
1.824933, -0.1184865, 0.9815264, 1, 0, 0.227451, 1,
1.833281, -0.9972316, 2.815429, 1, 0, 0.2235294, 1,
1.884472, 1.019624, -0.3433532, 1, 0, 0.2156863, 1,
1.895875, -0.2244711, 1.468185, 1, 0, 0.2117647, 1,
1.929814, 0.1786807, 1.20341, 1, 0, 0.2039216, 1,
1.939116, -0.1575714, 1.293708, 1, 0, 0.1960784, 1,
2.007423, -1.177581, 1.789919, 1, 0, 0.1921569, 1,
2.008029, 0.6857834, 2.283971, 1, 0, 0.1843137, 1,
2.033814, -0.5876746, 1.238713, 1, 0, 0.1803922, 1,
2.035304, 1.800445, -0.9146548, 1, 0, 0.172549, 1,
2.039216, -0.2789609, 0.45383, 1, 0, 0.1686275, 1,
2.039705, 0.5376362, 2.924692, 1, 0, 0.1607843, 1,
2.056512, 0.275939, 1.33972, 1, 0, 0.1568628, 1,
2.103206, 0.1697539, 1.71379, 1, 0, 0.1490196, 1,
2.121084, 0.6084378, -2.340851, 1, 0, 0.145098, 1,
2.124777, 0.307657, 0.6438522, 1, 0, 0.1372549, 1,
2.131588, -1.975761, 2.654903, 1, 0, 0.1333333, 1,
2.132786, 1.556607, 0.318453, 1, 0, 0.1254902, 1,
2.139929, 1.158068, 0.6055619, 1, 0, 0.1215686, 1,
2.156163, 1.007859, 1.132983, 1, 0, 0.1137255, 1,
2.161325, -0.8678182, 0.9971916, 1, 0, 0.1098039, 1,
2.17803, 0.6947185, 1.78471, 1, 0, 0.1019608, 1,
2.201162, -0.1003716, 0.6224557, 1, 0, 0.09411765, 1,
2.203675, -0.2683131, 4.401225, 1, 0, 0.09019608, 1,
2.222867, -1.99061, 2.99087, 1, 0, 0.08235294, 1,
2.300308, 1.071385, 2.264513, 1, 0, 0.07843138, 1,
2.327322, -1.073585, 1.385295, 1, 0, 0.07058824, 1,
2.354027, -0.4676358, 2.474688, 1, 0, 0.06666667, 1,
2.59158, 0.6471701, 2.605853, 1, 0, 0.05882353, 1,
2.63687, -0.457308, 2.723973, 1, 0, 0.05490196, 1,
2.642107, -0.2514574, 2.925151, 1, 0, 0.04705882, 1,
2.698226, 0.3913188, -0.02514657, 1, 0, 0.04313726, 1,
2.725922, 0.07789083, 2.806279, 1, 0, 0.03529412, 1,
2.788683, -0.9153924, 0.9213185, 1, 0, 0.03137255, 1,
2.822943, -1.206229, 2.642566, 1, 0, 0.02352941, 1,
2.910671, -0.9358315, 0.9381551, 1, 0, 0.01960784, 1,
3.022485, -0.1082201, 0.2876544, 1, 0, 0.01176471, 1,
3.541468, -0.7803221, 2.817414, 1, 0, 0.007843138, 1
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
0.1581961, -3.7004, -7.451004, 0, -0.5, 0.5, 0.5,
0.1581961, -3.7004, -7.451004, 1, -0.5, 0.5, 0.5,
0.1581961, -3.7004, -7.451004, 1, 1.5, 0.5, 0.5,
0.1581961, -3.7004, -7.451004, 0, 1.5, 0.5, 0.5
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
-4.372005, 0.2036102, -7.451004, 0, -0.5, 0.5, 0.5,
-4.372005, 0.2036102, -7.451004, 1, -0.5, 0.5, 0.5,
-4.372005, 0.2036102, -7.451004, 1, 1.5, 0.5, 0.5,
-4.372005, 0.2036102, -7.451004, 0, 1.5, 0.5, 0.5
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
-4.372005, -3.7004, 0.3996475, 0, -0.5, 0.5, 0.5,
-4.372005, -3.7004, 0.3996475, 1, -0.5, 0.5, 0.5,
-4.372005, -3.7004, 0.3996475, 1, 1.5, 0.5, 0.5,
-4.372005, -3.7004, 0.3996475, 0, 1.5, 0.5, 0.5
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
-3, -2.799475, -5.639316,
3, -2.799475, -5.639316,
-3, -2.799475, -5.639316,
-3, -2.949629, -5.941264,
-2, -2.799475, -5.639316,
-2, -2.949629, -5.941264,
-1, -2.799475, -5.639316,
-1, -2.949629, -5.941264,
0, -2.799475, -5.639316,
0, -2.949629, -5.941264,
1, -2.799475, -5.639316,
1, -2.949629, -5.941264,
2, -2.799475, -5.639316,
2, -2.949629, -5.941264,
3, -2.799475, -5.639316,
3, -2.949629, -5.941264
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
-3, -3.249938, -6.54516, 0, -0.5, 0.5, 0.5,
-3, -3.249938, -6.54516, 1, -0.5, 0.5, 0.5,
-3, -3.249938, -6.54516, 1, 1.5, 0.5, 0.5,
-3, -3.249938, -6.54516, 0, 1.5, 0.5, 0.5,
-2, -3.249938, -6.54516, 0, -0.5, 0.5, 0.5,
-2, -3.249938, -6.54516, 1, -0.5, 0.5, 0.5,
-2, -3.249938, -6.54516, 1, 1.5, 0.5, 0.5,
-2, -3.249938, -6.54516, 0, 1.5, 0.5, 0.5,
-1, -3.249938, -6.54516, 0, -0.5, 0.5, 0.5,
-1, -3.249938, -6.54516, 1, -0.5, 0.5, 0.5,
-1, -3.249938, -6.54516, 1, 1.5, 0.5, 0.5,
-1, -3.249938, -6.54516, 0, 1.5, 0.5, 0.5,
0, -3.249938, -6.54516, 0, -0.5, 0.5, 0.5,
0, -3.249938, -6.54516, 1, -0.5, 0.5, 0.5,
0, -3.249938, -6.54516, 1, 1.5, 0.5, 0.5,
0, -3.249938, -6.54516, 0, 1.5, 0.5, 0.5,
1, -3.249938, -6.54516, 0, -0.5, 0.5, 0.5,
1, -3.249938, -6.54516, 1, -0.5, 0.5, 0.5,
1, -3.249938, -6.54516, 1, 1.5, 0.5, 0.5,
1, -3.249938, -6.54516, 0, 1.5, 0.5, 0.5,
2, -3.249938, -6.54516, 0, -0.5, 0.5, 0.5,
2, -3.249938, -6.54516, 1, -0.5, 0.5, 0.5,
2, -3.249938, -6.54516, 1, 1.5, 0.5, 0.5,
2, -3.249938, -6.54516, 0, 1.5, 0.5, 0.5,
3, -3.249938, -6.54516, 0, -0.5, 0.5, 0.5,
3, -3.249938, -6.54516, 1, -0.5, 0.5, 0.5,
3, -3.249938, -6.54516, 1, 1.5, 0.5, 0.5,
3, -3.249938, -6.54516, 0, 1.5, 0.5, 0.5
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
-3.326574, -2, -5.639316,
-3.326574, 3, -5.639316,
-3.326574, -2, -5.639316,
-3.500812, -2, -5.941264,
-3.326574, -1, -5.639316,
-3.500812, -1, -5.941264,
-3.326574, 0, -5.639316,
-3.500812, 0, -5.941264,
-3.326574, 1, -5.639316,
-3.500812, 1, -5.941264,
-3.326574, 2, -5.639316,
-3.500812, 2, -5.941264,
-3.326574, 3, -5.639316,
-3.500812, 3, -5.941264
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
-3.849289, -2, -6.54516, 0, -0.5, 0.5, 0.5,
-3.849289, -2, -6.54516, 1, -0.5, 0.5, 0.5,
-3.849289, -2, -6.54516, 1, 1.5, 0.5, 0.5,
-3.849289, -2, -6.54516, 0, 1.5, 0.5, 0.5,
-3.849289, -1, -6.54516, 0, -0.5, 0.5, 0.5,
-3.849289, -1, -6.54516, 1, -0.5, 0.5, 0.5,
-3.849289, -1, -6.54516, 1, 1.5, 0.5, 0.5,
-3.849289, -1, -6.54516, 0, 1.5, 0.5, 0.5,
-3.849289, 0, -6.54516, 0, -0.5, 0.5, 0.5,
-3.849289, 0, -6.54516, 1, -0.5, 0.5, 0.5,
-3.849289, 0, -6.54516, 1, 1.5, 0.5, 0.5,
-3.849289, 0, -6.54516, 0, 1.5, 0.5, 0.5,
-3.849289, 1, -6.54516, 0, -0.5, 0.5, 0.5,
-3.849289, 1, -6.54516, 1, -0.5, 0.5, 0.5,
-3.849289, 1, -6.54516, 1, 1.5, 0.5, 0.5,
-3.849289, 1, -6.54516, 0, 1.5, 0.5, 0.5,
-3.849289, 2, -6.54516, 0, -0.5, 0.5, 0.5,
-3.849289, 2, -6.54516, 1, -0.5, 0.5, 0.5,
-3.849289, 2, -6.54516, 1, 1.5, 0.5, 0.5,
-3.849289, 2, -6.54516, 0, 1.5, 0.5, 0.5,
-3.849289, 3, -6.54516, 0, -0.5, 0.5, 0.5,
-3.849289, 3, -6.54516, 1, -0.5, 0.5, 0.5,
-3.849289, 3, -6.54516, 1, 1.5, 0.5, 0.5,
-3.849289, 3, -6.54516, 0, 1.5, 0.5, 0.5
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
-3.326574, -2.799475, -4,
-3.326574, -2.799475, 6,
-3.326574, -2.799475, -4,
-3.500812, -2.949629, -4,
-3.326574, -2.799475, -2,
-3.500812, -2.949629, -2,
-3.326574, -2.799475, 0,
-3.500812, -2.949629, 0,
-3.326574, -2.799475, 2,
-3.500812, -2.949629, 2,
-3.326574, -2.799475, 4,
-3.500812, -2.949629, 4,
-3.326574, -2.799475, 6,
-3.500812, -2.949629, 6
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
-3.849289, -3.249938, -4, 0, -0.5, 0.5, 0.5,
-3.849289, -3.249938, -4, 1, -0.5, 0.5, 0.5,
-3.849289, -3.249938, -4, 1, 1.5, 0.5, 0.5,
-3.849289, -3.249938, -4, 0, 1.5, 0.5, 0.5,
-3.849289, -3.249938, -2, 0, -0.5, 0.5, 0.5,
-3.849289, -3.249938, -2, 1, -0.5, 0.5, 0.5,
-3.849289, -3.249938, -2, 1, 1.5, 0.5, 0.5,
-3.849289, -3.249938, -2, 0, 1.5, 0.5, 0.5,
-3.849289, -3.249938, 0, 0, -0.5, 0.5, 0.5,
-3.849289, -3.249938, 0, 1, -0.5, 0.5, 0.5,
-3.849289, -3.249938, 0, 1, 1.5, 0.5, 0.5,
-3.849289, -3.249938, 0, 0, 1.5, 0.5, 0.5,
-3.849289, -3.249938, 2, 0, -0.5, 0.5, 0.5,
-3.849289, -3.249938, 2, 1, -0.5, 0.5, 0.5,
-3.849289, -3.249938, 2, 1, 1.5, 0.5, 0.5,
-3.849289, -3.249938, 2, 0, 1.5, 0.5, 0.5,
-3.849289, -3.249938, 4, 0, -0.5, 0.5, 0.5,
-3.849289, -3.249938, 4, 1, -0.5, 0.5, 0.5,
-3.849289, -3.249938, 4, 1, 1.5, 0.5, 0.5,
-3.849289, -3.249938, 4, 0, 1.5, 0.5, 0.5,
-3.849289, -3.249938, 6, 0, -0.5, 0.5, 0.5,
-3.849289, -3.249938, 6, 1, -0.5, 0.5, 0.5,
-3.849289, -3.249938, 6, 1, 1.5, 0.5, 0.5,
-3.849289, -3.249938, 6, 0, 1.5, 0.5, 0.5
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
-3.326574, -2.799475, -5.639316,
-3.326574, 3.206695, -5.639316,
-3.326574, -2.799475, 6.438611,
-3.326574, 3.206695, 6.438611,
-3.326574, -2.799475, -5.639316,
-3.326574, -2.799475, 6.438611,
-3.326574, 3.206695, -5.639316,
-3.326574, 3.206695, 6.438611,
-3.326574, -2.799475, -5.639316,
3.642966, -2.799475, -5.639316,
-3.326574, -2.799475, 6.438611,
3.642966, -2.799475, 6.438611,
-3.326574, 3.206695, -5.639316,
3.642966, 3.206695, -5.639316,
-3.326574, 3.206695, 6.438611,
3.642966, 3.206695, 6.438611,
3.642966, -2.799475, -5.639316,
3.642966, 3.206695, -5.639316,
3.642966, -2.799475, 6.438611,
3.642966, 3.206695, 6.438611,
3.642966, -2.799475, -5.639316,
3.642966, -2.799475, 6.438611,
3.642966, 3.206695, -5.639316,
3.642966, 3.206695, 6.438611
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
var radius = 8.107451;
var distance = 36.07097;
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
mvMatrix.translate( -0.1581961, -0.2036102, -0.3996475 );
mvMatrix.scale( 1.257749, 1.459488, 0.7257815 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.07097);
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
oxalate<-read.table("oxalate.xyz")
```

```
## Error in read.table("oxalate.xyz"): no lines available in input
```

```r
x<-oxalate$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxalate' not found
```

```r
y<-oxalate$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxalate' not found
```

```r
z<-oxalate$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxalate' not found
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
-3.225076, -2.048588, -2.046888, 0, 0, 1, 1, 1,
-2.999596, -0.05393694, -2.439027, 1, 0, 0, 1, 1,
-2.775113, -1.240719, -3.776557, 1, 0, 0, 1, 1,
-2.743967, 0.5318699, -0.6799194, 1, 0, 0, 1, 1,
-2.562663, -0.1303268, -3.351974, 1, 0, 0, 1, 1,
-2.483383, 0.2543785, -0.9005019, 1, 0, 0, 1, 1,
-2.43067, 0.6856063, -0.6667162, 0, 0, 0, 1, 1,
-2.41475, 1.103491, -0.4068277, 0, 0, 0, 1, 1,
-2.388882, -0.8577887, -1.158893, 0, 0, 0, 1, 1,
-2.357119, -0.8401374, -1.367525, 0, 0, 0, 1, 1,
-2.338653, -0.8294583, -2.146352, 0, 0, 0, 1, 1,
-2.302506, 0.712491, -2.764624, 0, 0, 0, 1, 1,
-2.27672, -0.1576457, -2.805074, 0, 0, 0, 1, 1,
-2.271883, 1.092754, -0.8639053, 1, 1, 1, 1, 1,
-2.264099, -0.2603966, -3.215775, 1, 1, 1, 1, 1,
-2.261659, -1.253431, -3.746842, 1, 1, 1, 1, 1,
-2.241464, -1.483659, -2.7147, 1, 1, 1, 1, 1,
-2.239413, 1.170189, 0.5539743, 1, 1, 1, 1, 1,
-2.190557, -0.6255014, -1.278393, 1, 1, 1, 1, 1,
-2.188403, -0.05887164, -2.012832, 1, 1, 1, 1, 1,
-2.169972, 0.6857254, -2.674551, 1, 1, 1, 1, 1,
-2.162197, 1.250037, -0.7427771, 1, 1, 1, 1, 1,
-2.149188, -0.6962061, -1.873021, 1, 1, 1, 1, 1,
-2.133371, -0.7925129, -1.368312, 1, 1, 1, 1, 1,
-2.131364, 0.325494, -1.890464, 1, 1, 1, 1, 1,
-2.080493, 0.2682235, -1.48745, 1, 1, 1, 1, 1,
-2.076888, -0.01146438, -1.63213, 1, 1, 1, 1, 1,
-2.07446, -1.284641, -1.230462, 1, 1, 1, 1, 1,
-2.07364, -0.24591, -2.38202, 0, 0, 1, 1, 1,
-2.040901, 0.1197546, -1.686974, 1, 0, 0, 1, 1,
-2.035712, -0.1563824, -2.486073, 1, 0, 0, 1, 1,
-2.033119, -1.177569, -1.043046, 1, 0, 0, 1, 1,
-2.024685, -0.5975413, -1.699044, 1, 0, 0, 1, 1,
-2.015624, -0.0413825, -2.909497, 1, 0, 0, 1, 1,
-1.975437, 0.2386078, 0.3613632, 0, 0, 0, 1, 1,
-1.974583, -0.3355805, -2.228084, 0, 0, 0, 1, 1,
-1.952806, -1.229263, -1.464357, 0, 0, 0, 1, 1,
-1.951051, 1.784965, 1.057631, 0, 0, 0, 1, 1,
-1.924927, 0.002049921, -2.144756, 0, 0, 0, 1, 1,
-1.918151, 1.676228, -0.5391611, 0, 0, 0, 1, 1,
-1.915179, 1.316078, -0.7253984, 0, 0, 0, 1, 1,
-1.887408, -2.126627, -3.798589, 1, 1, 1, 1, 1,
-1.842356, 2.384738, 1.099965, 1, 1, 1, 1, 1,
-1.82885, 1.023409, -1.445217, 1, 1, 1, 1, 1,
-1.82259, -0.5557039, -1.528428, 1, 1, 1, 1, 1,
-1.819897, 1.118928, -0.4288827, 1, 1, 1, 1, 1,
-1.807451, -0.08366254, -0.3721408, 1, 1, 1, 1, 1,
-1.790127, -0.511378, -1.672653, 1, 1, 1, 1, 1,
-1.780159, 0.8649735, -0.3973769, 1, 1, 1, 1, 1,
-1.772655, 1.207035, -0.4771017, 1, 1, 1, 1, 1,
-1.752575, -0.6426696, -2.12375, 1, 1, 1, 1, 1,
-1.747908, 0.8261552, -0.6062836, 1, 1, 1, 1, 1,
-1.742159, 1.018207, 0.1132689, 1, 1, 1, 1, 1,
-1.740677, 1.023265, -1.382443, 1, 1, 1, 1, 1,
-1.736115, 0.9382514, -1.620418, 1, 1, 1, 1, 1,
-1.728005, 0.4570072, -1.121532, 1, 1, 1, 1, 1,
-1.722356, 1.537519, -1.224982, 0, 0, 1, 1, 1,
-1.707936, 0.8248285, -1.07866, 1, 0, 0, 1, 1,
-1.706355, -1.505956, -1.093299, 1, 0, 0, 1, 1,
-1.696493, 0.7568318, 1.009863, 1, 0, 0, 1, 1,
-1.686573, 1.434169, -2.724949, 1, 0, 0, 1, 1,
-1.68222, -1.622491, -2.175017, 1, 0, 0, 1, 1,
-1.681178, -1.530039, -3.111271, 0, 0, 0, 1, 1,
-1.651893, -0.5535363, -2.234792, 0, 0, 0, 1, 1,
-1.651443, 2.275291, -1.105953, 0, 0, 0, 1, 1,
-1.638113, -1.361894, 0.1585667, 0, 0, 0, 1, 1,
-1.630676, 0.9970365, -1.603107, 0, 0, 0, 1, 1,
-1.618744, -1.958763, -3.088781, 0, 0, 0, 1, 1,
-1.616248, -0.1544045, -1.327531, 0, 0, 0, 1, 1,
-1.613366, -0.8632683, -2.152412, 1, 1, 1, 1, 1,
-1.605877, -0.5108855, -3.403249, 1, 1, 1, 1, 1,
-1.605152, 1.471778, -1.189508, 1, 1, 1, 1, 1,
-1.59933, -1.085881, -3.453959, 1, 1, 1, 1, 1,
-1.584151, 1.706832, 0.156195, 1, 1, 1, 1, 1,
-1.581879, 1.689229, -2.568913, 1, 1, 1, 1, 1,
-1.577477, 0.009143692, -1.442524, 1, 1, 1, 1, 1,
-1.564868, -0.4868377, -1.121588, 1, 1, 1, 1, 1,
-1.560163, -1.422808, -2.799287, 1, 1, 1, 1, 1,
-1.549052, 0.08616139, -2.335053, 1, 1, 1, 1, 1,
-1.531645, 0.7744492, -1.16073, 1, 1, 1, 1, 1,
-1.531553, -0.08759026, -1.551131, 1, 1, 1, 1, 1,
-1.529709, -2.19047, -1.782355, 1, 1, 1, 1, 1,
-1.519354, -1.791535, -2.749311, 1, 1, 1, 1, 1,
-1.515515, -1.113412, -1.739413, 1, 1, 1, 1, 1,
-1.509012, -2.252932, -3.129983, 0, 0, 1, 1, 1,
-1.508594, -0.2836443, -1.753366, 1, 0, 0, 1, 1,
-1.503524, -1.575323, -2.462373, 1, 0, 0, 1, 1,
-1.499484, -0.08190241, -2.955719, 1, 0, 0, 1, 1,
-1.493895, -1.238951, -4.702772, 1, 0, 0, 1, 1,
-1.49172, -0.7863825, -3.040886, 1, 0, 0, 1, 1,
-1.490122, -0.263395, -2.5886, 0, 0, 0, 1, 1,
-1.489082, 0.3741504, -0.1804196, 0, 0, 0, 1, 1,
-1.479083, 0.9704923, 0.1349044, 0, 0, 0, 1, 1,
-1.478943, -0.4377407, -2.733268, 0, 0, 0, 1, 1,
-1.46764, -0.4017702, -1.807525, 0, 0, 0, 1, 1,
-1.454707, -0.1188952, -2.627077, 0, 0, 0, 1, 1,
-1.449026, 0.4821622, 0.5601271, 0, 0, 0, 1, 1,
-1.439173, -0.2318928, -2.030759, 1, 1, 1, 1, 1,
-1.436663, -2.099072, -1.780173, 1, 1, 1, 1, 1,
-1.424821, 0.1019146, -2.880879, 1, 1, 1, 1, 1,
-1.419302, -1.053671, -1.80785, 1, 1, 1, 1, 1,
-1.414899, 0.3064247, -3.802974, 1, 1, 1, 1, 1,
-1.408807, -0.5144786, -2.731222, 1, 1, 1, 1, 1,
-1.40117, -0.790638, -1.156359, 1, 1, 1, 1, 1,
-1.400085, -0.7227438, -1.044782, 1, 1, 1, 1, 1,
-1.399059, 1.043061, 0.5737828, 1, 1, 1, 1, 1,
-1.396238, -0.2795479, -2.781373, 1, 1, 1, 1, 1,
-1.385104, -1.213093, -0.4761159, 1, 1, 1, 1, 1,
-1.383321, 1.100484, -2.3849, 1, 1, 1, 1, 1,
-1.377421, 1.222402, 0.2343878, 1, 1, 1, 1, 1,
-1.374871, -0.2541681, -1.189622, 1, 1, 1, 1, 1,
-1.374813, -0.3943281, 0.9355322, 1, 1, 1, 1, 1,
-1.373719, -0.8352872, -3.242085, 0, 0, 1, 1, 1,
-1.372754, -0.865513, -0.5633687, 1, 0, 0, 1, 1,
-1.370139, -1.767967, -0.8858269, 1, 0, 0, 1, 1,
-1.368904, 1.877008, -0.2056535, 1, 0, 0, 1, 1,
-1.359008, 0.655757, -1.536842, 1, 0, 0, 1, 1,
-1.352832, 0.06290646, -1.201188, 1, 0, 0, 1, 1,
-1.344995, -1.253185, -2.62499, 0, 0, 0, 1, 1,
-1.34126, 1.44795, -0.2328755, 0, 0, 0, 1, 1,
-1.338339, 1.135961, -2.162488, 0, 0, 0, 1, 1,
-1.323105, -0.8513703, 0.1134169, 0, 0, 0, 1, 1,
-1.32092, -0.2050827, -1.669327, 0, 0, 0, 1, 1,
-1.320876, -0.08631764, -1.985499, 0, 0, 0, 1, 1,
-1.317716, -0.3433256, -0.3524197, 0, 0, 0, 1, 1,
-1.31582, -0.7970999, -3.241243, 1, 1, 1, 1, 1,
-1.315726, 2.57068, -2.883354, 1, 1, 1, 1, 1,
-1.297113, 0.2398534, -1.805043, 1, 1, 1, 1, 1,
-1.296092, 0.8454044, -0.4265708, 1, 1, 1, 1, 1,
-1.292809, -2.712006, -1.971539, 1, 1, 1, 1, 1,
-1.28788, 0.6852487, -1.253125, 1, 1, 1, 1, 1,
-1.280636, 0.7753196, -2.423291, 1, 1, 1, 1, 1,
-1.270574, 1.346811, -1.323557, 1, 1, 1, 1, 1,
-1.237875, 1.105487, -1.036369, 1, 1, 1, 1, 1,
-1.231371, 0.5462654, -1.400294, 1, 1, 1, 1, 1,
-1.229657, 0.6008766, -1.473601, 1, 1, 1, 1, 1,
-1.22703, -1.036586, -2.247488, 1, 1, 1, 1, 1,
-1.226414, 0.293262, -0.8064884, 1, 1, 1, 1, 1,
-1.218125, -0.1763988, -1.985972, 1, 1, 1, 1, 1,
-1.215535, 1.553276, 0.05216983, 1, 1, 1, 1, 1,
-1.207825, 0.2039421, -1.622925, 0, 0, 1, 1, 1,
-1.207764, 1.346182, -0.7289283, 1, 0, 0, 1, 1,
-1.203329, 0.6769173, -0.6180897, 1, 0, 0, 1, 1,
-1.193953, -0.2803769, -2.127545, 1, 0, 0, 1, 1,
-1.188745, -0.5772023, -2.752629, 1, 0, 0, 1, 1,
-1.188354, 0.5779821, -1.509215, 1, 0, 0, 1, 1,
-1.180879, -1.649978, -1.297952, 0, 0, 0, 1, 1,
-1.178886, -0.4665605, -1.123032, 0, 0, 0, 1, 1,
-1.173726, -0.04540655, -2.037401, 0, 0, 0, 1, 1,
-1.167425, -0.478843, -2.133629, 0, 0, 0, 1, 1,
-1.164321, 0.8394567, -1.911194, 0, 0, 0, 1, 1,
-1.153736, -0.4025371, -4.142292, 0, 0, 0, 1, 1,
-1.152123, 2.025923, -1.264317, 0, 0, 0, 1, 1,
-1.151905, 0.7289643, -2.927834, 1, 1, 1, 1, 1,
-1.151805, -0.5224571, -1.430232, 1, 1, 1, 1, 1,
-1.134432, -0.6921468, -1.217405, 1, 1, 1, 1, 1,
-1.12782, 0.1420507, -1.561846, 1, 1, 1, 1, 1,
-1.126678, -0.6242595, -1.943718, 1, 1, 1, 1, 1,
-1.12008, 1.472138, 0.406809, 1, 1, 1, 1, 1,
-1.115418, -0.7313673, -2.119604, 1, 1, 1, 1, 1,
-1.114778, -0.4174103, -1.183567, 1, 1, 1, 1, 1,
-1.111794, -0.9701605, -1.799045, 1, 1, 1, 1, 1,
-1.103351, -0.07976966, -1.483349, 1, 1, 1, 1, 1,
-1.096364, -0.06524102, -2.8504, 1, 1, 1, 1, 1,
-1.095389, 0.8912477, -2.254111, 1, 1, 1, 1, 1,
-1.094006, -1.244496, -2.253145, 1, 1, 1, 1, 1,
-1.091925, 3.119227, -2.4585, 1, 1, 1, 1, 1,
-1.090855, 0.6461924, -0.5867822, 1, 1, 1, 1, 1,
-1.08346, -0.2204902, 0.6411853, 0, 0, 1, 1, 1,
-1.082991, -0.08742473, -2.619945, 1, 0, 0, 1, 1,
-1.07687, 0.4916698, -1.204628, 1, 0, 0, 1, 1,
-1.075077, 0.3252984, -2.47524, 1, 0, 0, 1, 1,
-1.064683, 0.4065929, -0.6723557, 1, 0, 0, 1, 1,
-1.064461, -0.1898542, -3.115853, 1, 0, 0, 1, 1,
-1.060055, -0.2710015, -2.166507, 0, 0, 0, 1, 1,
-1.057311, 0.05632315, -1.430472, 0, 0, 0, 1, 1,
-1.055367, 0.5999448, 0.04708573, 0, 0, 0, 1, 1,
-1.050954, 1.552396, 1.604034, 0, 0, 0, 1, 1,
-1.046188, -0.1530696, -2.025897, 0, 0, 0, 1, 1,
-1.041166, 1.418312, 0.1143228, 0, 0, 0, 1, 1,
-1.03663, 0.7259331, -0.8991238, 0, 0, 0, 1, 1,
-1.027357, 0.4062206, 0.3733096, 1, 1, 1, 1, 1,
-1.023813, -1.492932, -2.985713, 1, 1, 1, 1, 1,
-1.016074, 0.4030544, -0.2550137, 1, 1, 1, 1, 1,
-1.013152, -0.8373938, -3.556546, 1, 1, 1, 1, 1,
-1.001683, -1.253108, -1.08849, 1, 1, 1, 1, 1,
-0.9974346, -0.1830615, -0.00968219, 1, 1, 1, 1, 1,
-0.9933864, 0.02753588, 0.7107056, 1, 1, 1, 1, 1,
-0.992246, 0.6590317, -1.760267, 1, 1, 1, 1, 1,
-0.9892008, 0.916436, -0.1436243, 1, 1, 1, 1, 1,
-0.987837, -0.3884669, -0.706718, 1, 1, 1, 1, 1,
-0.9870108, -1.442976, -3.179264, 1, 1, 1, 1, 1,
-0.9805424, -0.334471, -1.60547, 1, 1, 1, 1, 1,
-0.9792436, 0.08698107, -2.008551, 1, 1, 1, 1, 1,
-0.9754139, -0.003368202, -1.290195, 1, 1, 1, 1, 1,
-0.9690393, -2.176456, -3.591555, 1, 1, 1, 1, 1,
-0.9645392, -1.007412, -1.444454, 0, 0, 1, 1, 1,
-0.9578031, 0.3371096, -1.575509, 1, 0, 0, 1, 1,
-0.9541383, 2.33392, -0.8020286, 1, 0, 0, 1, 1,
-0.9497071, -0.6161382, -2.44673, 1, 0, 0, 1, 1,
-0.945721, 0.7705724, -2.133327, 1, 0, 0, 1, 1,
-0.9440622, -0.3431227, -0.9835325, 1, 0, 0, 1, 1,
-0.9434173, -2.373368, -1.838542, 0, 0, 0, 1, 1,
-0.9380876, -0.7818981, -2.002644, 0, 0, 0, 1, 1,
-0.934379, 0.93766, -0.7055991, 0, 0, 0, 1, 1,
-0.9308028, -0.03614229, -3.781634, 0, 0, 0, 1, 1,
-0.9187616, 0.2910967, -2.12882, 0, 0, 0, 1, 1,
-0.9161922, 0.4132513, 0.7476591, 0, 0, 0, 1, 1,
-0.9121737, 0.5414137, -1.577914, 0, 0, 0, 1, 1,
-0.9022589, 2.424847, -0.6863198, 1, 1, 1, 1, 1,
-0.8987585, -0.74599, -1.77533, 1, 1, 1, 1, 1,
-0.8967587, 1.288632, -0.8293655, 1, 1, 1, 1, 1,
-0.8946936, -0.7761859, -2.820958, 1, 1, 1, 1, 1,
-0.8925509, 1.478168, -1.401329, 1, 1, 1, 1, 1,
-0.8893236, 1.743688, 0.669674, 1, 1, 1, 1, 1,
-0.8809432, -0.5797241, -2.118351, 1, 1, 1, 1, 1,
-0.8784617, 1.501919, -0.7564954, 1, 1, 1, 1, 1,
-0.8745948, -1.151489, -2.332162, 1, 1, 1, 1, 1,
-0.860221, -0.8185683, -4.061896, 1, 1, 1, 1, 1,
-0.8566428, -0.06809465, -2.760681, 1, 1, 1, 1, 1,
-0.8557687, 0.4317082, 0.8346898, 1, 1, 1, 1, 1,
-0.8538731, -0.357886, -1.583446, 1, 1, 1, 1, 1,
-0.8531788, 0.3560143, -2.047188, 1, 1, 1, 1, 1,
-0.8503065, 1.506169, -3.064591, 1, 1, 1, 1, 1,
-0.8427958, 1.249543, -0.6119279, 0, 0, 1, 1, 1,
-0.8322805, 1.235283, -0.219608, 1, 0, 0, 1, 1,
-0.8305243, 0.6188526, -2.73402, 1, 0, 0, 1, 1,
-0.8255436, -0.3072776, -2.134816, 1, 0, 0, 1, 1,
-0.8233865, 0.6684485, -2.125038, 1, 0, 0, 1, 1,
-0.8209805, -0.5241153, -1.736547, 1, 0, 0, 1, 1,
-0.8168728, 1.131788, -1.328762, 0, 0, 0, 1, 1,
-0.8120145, -0.5790995, -2.021739, 0, 0, 0, 1, 1,
-0.8015522, 1.199585, 0.326638, 0, 0, 0, 1, 1,
-0.7985271, 0.6165019, -1.48508, 0, 0, 0, 1, 1,
-0.797547, -1.208145, -2.604342, 0, 0, 0, 1, 1,
-0.7973295, 1.617685, -1.118008, 0, 0, 0, 1, 1,
-0.7955596, 0.3041951, -0.7210654, 0, 0, 0, 1, 1,
-0.7950078, -0.09363769, -0.494958, 1, 1, 1, 1, 1,
-0.7924693, 1.275964, 0.2486586, 1, 1, 1, 1, 1,
-0.79019, 0.2599264, 0.3924133, 1, 1, 1, 1, 1,
-0.7896387, 1.082449, -1.216293, 1, 1, 1, 1, 1,
-0.7895159, 0.3405156, -0.3709779, 1, 1, 1, 1, 1,
-0.7885025, 1.774685, 1.60097, 1, 1, 1, 1, 1,
-0.7866826, 0.2321924, -1.620226, 1, 1, 1, 1, 1,
-0.7833401, -0.9231099, -1.742642, 1, 1, 1, 1, 1,
-0.776055, -0.2672799, -3.333981, 1, 1, 1, 1, 1,
-0.7698438, 0.1243247, -1.410247, 1, 1, 1, 1, 1,
-0.7686537, -0.5884995, -0.7431452, 1, 1, 1, 1, 1,
-0.7645299, 0.9530303, -1.133884, 1, 1, 1, 1, 1,
-0.7596008, 0.6962149, -1.219112, 1, 1, 1, 1, 1,
-0.7579885, -0.8252499, -2.009855, 1, 1, 1, 1, 1,
-0.75646, -1.890579, -2.645618, 1, 1, 1, 1, 1,
-0.7539352, -0.4993204, -2.52656, 0, 0, 1, 1, 1,
-0.7513462, 0.5390257, -0.7165156, 1, 0, 0, 1, 1,
-0.7440559, -1.52333, -1.302064, 1, 0, 0, 1, 1,
-0.7284244, -0.8894064, -4.12844, 1, 0, 0, 1, 1,
-0.7276103, -0.3041061, -1.616129, 1, 0, 0, 1, 1,
-0.7237124, -0.4815216, -2.75213, 1, 0, 0, 1, 1,
-0.7236944, -1.215395, -2.149552, 0, 0, 0, 1, 1,
-0.7224269, 0.686305, 0.513644, 0, 0, 0, 1, 1,
-0.7177977, 0.02197364, -2.027706, 0, 0, 0, 1, 1,
-0.7156774, -1.106302, -2.503803, 0, 0, 0, 1, 1,
-0.713456, -1.428151, -3.356149, 0, 0, 0, 1, 1,
-0.7092718, 0.4065126, -2.131912, 0, 0, 0, 1, 1,
-0.7080565, -0.8349894, -2.549384, 0, 0, 0, 1, 1,
-0.7010666, 1.859657, 0.1631442, 1, 1, 1, 1, 1,
-0.6997936, -0.2302586, -2.208367, 1, 1, 1, 1, 1,
-0.692704, 1.602272, -0.4885208, 1, 1, 1, 1, 1,
-0.6889781, 0.1444986, 0.5336578, 1, 1, 1, 1, 1,
-0.6860574, 0.2729676, -0.9565831, 1, 1, 1, 1, 1,
-0.683782, 0.654889, -0.3312981, 1, 1, 1, 1, 1,
-0.680975, 0.4309232, -0.4696348, 1, 1, 1, 1, 1,
-0.6787558, -0.2235037, -0.652874, 1, 1, 1, 1, 1,
-0.6604861, -1.11467, -2.72319, 1, 1, 1, 1, 1,
-0.6559142, 0.9242071, -0.353893, 1, 1, 1, 1, 1,
-0.6515017, -0.08754369, -3.406326, 1, 1, 1, 1, 1,
-0.6503093, 0.2718799, -1.273386, 1, 1, 1, 1, 1,
-0.639147, 2.062882, 1.141039, 1, 1, 1, 1, 1,
-0.6376863, -0.808942, -3.768278, 1, 1, 1, 1, 1,
-0.6337146, 0.2651867, -1.438416, 1, 1, 1, 1, 1,
-0.6322864, -0.5844414, -3.478639, 0, 0, 1, 1, 1,
-0.6305425, -0.07961333, -4.048788, 1, 0, 0, 1, 1,
-0.6269245, 1.063839, 0.955952, 1, 0, 0, 1, 1,
-0.6261144, 0.08134677, -0.6597173, 1, 0, 0, 1, 1,
-0.6222073, -1.158188, -2.927804, 1, 0, 0, 1, 1,
-0.6202551, -0.0361906, 0.1116058, 1, 0, 0, 1, 1,
-0.6152362, 1.396925, -1.168705, 0, 0, 0, 1, 1,
-0.6151304, -0.4822269, -1.249086, 0, 0, 0, 1, 1,
-0.6141225, 0.1348657, -0.8453195, 0, 0, 0, 1, 1,
-0.6079365, 0.648066, -1.927871, 0, 0, 0, 1, 1,
-0.5992684, -0.1606887, -2.226897, 0, 0, 0, 1, 1,
-0.5971895, 0.9586127, 0.1057252, 0, 0, 0, 1, 1,
-0.59348, -0.0917808, -1.061556, 0, 0, 0, 1, 1,
-0.5903364, 0.2618779, -0.09263843, 1, 1, 1, 1, 1,
-0.5839765, -1.920298, -3.177836, 1, 1, 1, 1, 1,
-0.5835146, -0.9132479, -3.700847, 1, 1, 1, 1, 1,
-0.5795435, -1.72435, -2.880455, 1, 1, 1, 1, 1,
-0.5717809, -0.156178, -0.9796311, 1, 1, 1, 1, 1,
-0.5678615, -0.1538879, -2.985528, 1, 1, 1, 1, 1,
-0.5671756, 0.7480857, 0.09480283, 1, 1, 1, 1, 1,
-0.5666563, -0.8797235, -1.885172, 1, 1, 1, 1, 1,
-0.5655655, 0.1183082, 0.4314323, 1, 1, 1, 1, 1,
-0.5652155, -0.336261, -3.133716, 1, 1, 1, 1, 1,
-0.5642964, -0.1135728, -2.352015, 1, 1, 1, 1, 1,
-0.5640851, 0.3633586, 0.3311739, 1, 1, 1, 1, 1,
-0.5614103, 0.7439095, -1.015466, 1, 1, 1, 1, 1,
-0.5592474, -0.3274604, -2.716238, 1, 1, 1, 1, 1,
-0.5484053, -0.7493867, -2.17096, 1, 1, 1, 1, 1,
-0.5435174, 1.588659, -0.9962733, 0, 0, 1, 1, 1,
-0.5405651, -0.5200354, -1.579163, 1, 0, 0, 1, 1,
-0.5380018, -2.119442, -3.611432, 1, 0, 0, 1, 1,
-0.5348101, 0.6515189, -0.9603988, 1, 0, 0, 1, 1,
-0.5258254, 1.195414, 1.489801, 1, 0, 0, 1, 1,
-0.5234194, 0.1189357, -1.028674, 1, 0, 0, 1, 1,
-0.5206653, -0.06078973, -3.580654, 0, 0, 0, 1, 1,
-0.5177591, -1.213508, -3.770724, 0, 0, 0, 1, 1,
-0.5139166, -1.58228, -2.128111, 0, 0, 0, 1, 1,
-0.5066485, 0.9702828, -1.639813, 0, 0, 0, 1, 1,
-0.5044677, 0.6786497, 0.8876627, 0, 0, 0, 1, 1,
-0.5025054, 1.452767, -0.06243212, 0, 0, 0, 1, 1,
-0.5000816, -0.4556141, -0.2393211, 0, 0, 0, 1, 1,
-0.4988202, 0.2857221, -1.667725, 1, 1, 1, 1, 1,
-0.4908306, -0.8974777, -2.287416, 1, 1, 1, 1, 1,
-0.4891, 1.050673, 0.04763027, 1, 1, 1, 1, 1,
-0.4876315, 0.5838016, 0.3582409, 1, 1, 1, 1, 1,
-0.4850016, -1.366495, -2.356801, 1, 1, 1, 1, 1,
-0.4834201, 1.014567, 0.1621828, 1, 1, 1, 1, 1,
-0.4834031, 1.811737, 0.2672492, 1, 1, 1, 1, 1,
-0.4809139, -0.7619175, -3.292396, 1, 1, 1, 1, 1,
-0.4797001, 0.3278149, -1.294123, 1, 1, 1, 1, 1,
-0.4745709, -0.03802231, -0.7320105, 1, 1, 1, 1, 1,
-0.4737824, -1.192021, -5.463423, 1, 1, 1, 1, 1,
-0.4717422, 0.4553675, -1.403924, 1, 1, 1, 1, 1,
-0.47081, -0.3635238, -2.979086, 1, 1, 1, 1, 1,
-0.4692477, 0.1202371, -0.2854085, 1, 1, 1, 1, 1,
-0.4653029, 1.341916, -0.6014755, 1, 1, 1, 1, 1,
-0.4534267, 1.806234, -1.03121, 0, 0, 1, 1, 1,
-0.4507664, -0.2224787, -1.179698, 1, 0, 0, 1, 1,
-0.44888, -0.9396051, -4.679618, 1, 0, 0, 1, 1,
-0.4412508, -0.9245887, -2.357846, 1, 0, 0, 1, 1,
-0.4355188, 0.777067, -0.2849258, 1, 0, 0, 1, 1,
-0.4347023, 0.7247877, -0.9829645, 1, 0, 0, 1, 1,
-0.4340132, -1.558341, -2.421319, 0, 0, 0, 1, 1,
-0.4318964, 1.087007, -0.2181967, 0, 0, 0, 1, 1,
-0.411935, 0.1736027, 0.6998091, 0, 0, 0, 1, 1,
-0.4068176, -0.7921457, -4.056315, 0, 0, 0, 1, 1,
-0.4043856, 0.41816, 0.540751, 0, 0, 0, 1, 1,
-0.4029158, 1.892826, 1.360479, 0, 0, 0, 1, 1,
-0.4021896, 1.624524, -0.9882079, 0, 0, 0, 1, 1,
-0.3956352, 1.599136, -1.488394, 1, 1, 1, 1, 1,
-0.3944629, -0.9642932, -3.05425, 1, 1, 1, 1, 1,
-0.3940789, 0.7187083, 1.98121, 1, 1, 1, 1, 1,
-0.3921891, 0.01020047, -1.799507, 1, 1, 1, 1, 1,
-0.3916144, -0.282627, -0.7779442, 1, 1, 1, 1, 1,
-0.3903054, -1.1337, -4.337832, 1, 1, 1, 1, 1,
-0.3848012, -0.07050313, -3.135597, 1, 1, 1, 1, 1,
-0.3846921, -0.06244585, -2.106777, 1, 1, 1, 1, 1,
-0.3837202, -0.1305718, -1.389572, 1, 1, 1, 1, 1,
-0.3830017, 0.9569325, -0.08653349, 1, 1, 1, 1, 1,
-0.3829508, 0.8736513, -0.4266736, 1, 1, 1, 1, 1,
-0.3807813, 1.209094, -1.216481, 1, 1, 1, 1, 1,
-0.3786332, -0.7562508, -1.900081, 1, 1, 1, 1, 1,
-0.3759113, 0.5961901, -0.872073, 1, 1, 1, 1, 1,
-0.3738679, 1.422132, 0.6101851, 1, 1, 1, 1, 1,
-0.3729958, 0.1446688, -1.218608, 0, 0, 1, 1, 1,
-0.3629006, -0.7152306, -2.774316, 1, 0, 0, 1, 1,
-0.3616107, 0.1547655, -1.012385, 1, 0, 0, 1, 1,
-0.3564415, -1.137283, -2.87825, 1, 0, 0, 1, 1,
-0.3460136, -1.17163, -2.652922, 1, 0, 0, 1, 1,
-0.3459983, -1.647427, -1.870887, 1, 0, 0, 1, 1,
-0.3444724, -0.7030833, -2.550115, 0, 0, 0, 1, 1,
-0.3394042, -0.2590873, -1.613998, 0, 0, 0, 1, 1,
-0.3365813, 0.17307, -0.307991, 0, 0, 0, 1, 1,
-0.3336271, -0.7442433, -2.176619, 0, 0, 0, 1, 1,
-0.3229498, -0.9889274, -2.077808, 0, 0, 0, 1, 1,
-0.3171504, 1.51119, 0.2198537, 0, 0, 0, 1, 1,
-0.316419, -0.06359444, -2.644782, 0, 0, 0, 1, 1,
-0.312273, -0.7610867, -4.093309, 1, 1, 1, 1, 1,
-0.3089386, -0.7944536, -3.622175, 1, 1, 1, 1, 1,
-0.3026758, 0.871354, -0.3056335, 1, 1, 1, 1, 1,
-0.2997229, 0.8816158, 0.6966145, 1, 1, 1, 1, 1,
-0.2968748, -0.04813116, 0.07325917, 1, 1, 1, 1, 1,
-0.2947842, -0.2162627, -2.403175, 1, 1, 1, 1, 1,
-0.2924879, 2.69408, -0.6151776, 1, 1, 1, 1, 1,
-0.2887021, -0.1805758, -3.110316, 1, 1, 1, 1, 1,
-0.2875715, 1.269024, -0.8957267, 1, 1, 1, 1, 1,
-0.2832125, 0.5178139, -0.8799823, 1, 1, 1, 1, 1,
-0.2831742, 0.09878197, -0.0829654, 1, 1, 1, 1, 1,
-0.280837, 1.236985, -0.2115968, 1, 1, 1, 1, 1,
-0.2799636, 0.9268507, -0.3946007, 1, 1, 1, 1, 1,
-0.2792553, -1.350143, -1.875844, 1, 1, 1, 1, 1,
-0.2775271, 0.3433017, -0.2081651, 1, 1, 1, 1, 1,
-0.2743942, 0.5692964, -0.3258133, 0, 0, 1, 1, 1,
-0.2743321, 0.2284892, 0.1822876, 1, 0, 0, 1, 1,
-0.2738003, -1.391234, -1.88417, 1, 0, 0, 1, 1,
-0.2715707, -0.409608, -3.17772, 1, 0, 0, 1, 1,
-0.2684487, -0.4633221, -3.460166, 1, 0, 0, 1, 1,
-0.2666129, 0.8986287, -1.270291, 1, 0, 0, 1, 1,
-0.2635326, -0.2199074, -0.9010566, 0, 0, 0, 1, 1,
-0.2595546, -0.4169534, -3.153903, 0, 0, 0, 1, 1,
-0.2530207, -0.5039524, -2.216534, 0, 0, 0, 1, 1,
-0.2507346, 1.376744, 0.894293, 0, 0, 0, 1, 1,
-0.2462766, -0.9249821, -1.827221, 0, 0, 0, 1, 1,
-0.2388355, -0.2357789, -4.599814, 0, 0, 0, 1, 1,
-0.2374287, 2.074512, -0.3354612, 0, 0, 0, 1, 1,
-0.2367249, -0.3532589, -1.764111, 1, 1, 1, 1, 1,
-0.2340536, 2.007635, -0.6942071, 1, 1, 1, 1, 1,
-0.2329519, -0.4341657, -2.536166, 1, 1, 1, 1, 1,
-0.2289215, -0.5761067, -2.232809, 1, 1, 1, 1, 1,
-0.226364, -0.3042156, -4.355362, 1, 1, 1, 1, 1,
-0.2239641, -1.343657, -2.430398, 1, 1, 1, 1, 1,
-0.223788, -0.009296391, 1.393347, 1, 1, 1, 1, 1,
-0.2228317, -0.8143909, -3.989717, 1, 1, 1, 1, 1,
-0.2211492, -0.8596975, -3.102294, 1, 1, 1, 1, 1,
-0.2200177, 0.6436407, -0.2109182, 1, 1, 1, 1, 1,
-0.2182431, -0.2763574, -1.382239, 1, 1, 1, 1, 1,
-0.2179799, -2.376509, -3.244716, 1, 1, 1, 1, 1,
-0.2174761, 0.3620762, -1.048211, 1, 1, 1, 1, 1,
-0.2122321, 1.976307, 0.5091664, 1, 1, 1, 1, 1,
-0.2114945, 0.9433241, -0.5863571, 1, 1, 1, 1, 1,
-0.2091097, 0.7971228, 0.6738455, 0, 0, 1, 1, 1,
-0.2067956, -1.36142, -2.064054, 1, 0, 0, 1, 1,
-0.1992561, -0.07414415, -0.5844564, 1, 0, 0, 1, 1,
-0.198963, 0.1589494, -0.6653545, 1, 0, 0, 1, 1,
-0.198328, 0.1554624, -2.082005, 1, 0, 0, 1, 1,
-0.1953063, -0.09390841, -2.281306, 1, 0, 0, 1, 1,
-0.1914853, -0.9936611, -4.063966, 0, 0, 0, 1, 1,
-0.1905642, -0.7581252, -4.561476, 0, 0, 0, 1, 1,
-0.1864202, -0.549143, -4.630132, 0, 0, 0, 1, 1,
-0.1859805, 0.2410332, -1.588128, 0, 0, 0, 1, 1,
-0.1849728, 0.5334895, 0.2751984, 0, 0, 0, 1, 1,
-0.1847154, 0.8507649, 0.1074344, 0, 0, 0, 1, 1,
-0.1831619, 0.7217458, 0.8669409, 0, 0, 0, 1, 1,
-0.1827254, 1.681629, -1.229344, 1, 1, 1, 1, 1,
-0.1825616, -0.8462595, -4.110858, 1, 1, 1, 1, 1,
-0.1822417, 0.2838064, -0.201647, 1, 1, 1, 1, 1,
-0.1809078, 1.229635, 2.759144, 1, 1, 1, 1, 1,
-0.1757549, -0.1744139, -1.384484, 1, 1, 1, 1, 1,
-0.1704404, -0.3402795, -2.892549, 1, 1, 1, 1, 1,
-0.1624883, -0.8911981, -2.629565, 1, 1, 1, 1, 1,
-0.1607559, -2.048342, -2.918596, 1, 1, 1, 1, 1,
-0.1539423, -0.08984473, 0.07204182, 1, 1, 1, 1, 1,
-0.150408, -0.1419166, -1.596148, 1, 1, 1, 1, 1,
-0.1482054, -0.5744378, -5.206711, 1, 1, 1, 1, 1,
-0.1450232, 0.3564678, -3.241061, 1, 1, 1, 1, 1,
-0.1379995, -0.9940672, -0.8870781, 1, 1, 1, 1, 1,
-0.1355718, -0.7731028, -2.479534, 1, 1, 1, 1, 1,
-0.1327759, -1.435612, -2.745356, 1, 1, 1, 1, 1,
-0.1287966, 0.02110584, -1.643983, 0, 0, 1, 1, 1,
-0.128104, -0.4799238, -2.799361, 1, 0, 0, 1, 1,
-0.1228897, 0.8644791, 0.7634355, 1, 0, 0, 1, 1,
-0.1220305, 0.7058566, 0.08651947, 1, 0, 0, 1, 1,
-0.1212649, 0.3130601, -0.156355, 1, 0, 0, 1, 1,
-0.1206618, 1.927295, -1.561611, 1, 0, 0, 1, 1,
-0.1178416, 0.07877598, -1.257349, 0, 0, 0, 1, 1,
-0.1174364, -1.373525, -2.630399, 0, 0, 0, 1, 1,
-0.1167953, -1.841679, -2.342184, 0, 0, 0, 1, 1,
-0.1156928, 0.459679, -2.4639, 0, 0, 0, 1, 1,
-0.1134226, -0.09630714, -2.358779, 0, 0, 0, 1, 1,
-0.1133556, 1.321299, -1.28154, 0, 0, 0, 1, 1,
-0.1129723, -1.289162, -4.425398, 0, 0, 0, 1, 1,
-0.1122571, 0.3056224, -0.7957633, 1, 1, 1, 1, 1,
-0.1030235, -1.623712, -2.514263, 1, 1, 1, 1, 1,
-0.1015445, 1.049858, 2.011235, 1, 1, 1, 1, 1,
-0.09804916, 0.07786513, -1.111366, 1, 1, 1, 1, 1,
-0.09707475, 1.808534, 0.7374797, 1, 1, 1, 1, 1,
-0.09672574, 1.733169, -0.4813624, 1, 1, 1, 1, 1,
-0.09144208, 1.463067, 0.5998164, 1, 1, 1, 1, 1,
-0.09129594, 3.047132, 1.149332, 1, 1, 1, 1, 1,
-0.08774574, 1.248893, -0.3682386, 1, 1, 1, 1, 1,
-0.08762932, 0.5721771, -0.8256952, 1, 1, 1, 1, 1,
-0.08562462, 0.4438431, 0.06692106, 1, 1, 1, 1, 1,
-0.08536626, -0.8211492, -3.001435, 1, 1, 1, 1, 1,
-0.08394942, 0.04497295, -1.351734, 1, 1, 1, 1, 1,
-0.0835534, -0.006180036, -0.7931364, 1, 1, 1, 1, 1,
-0.06982457, -1.672646, -3.524393, 1, 1, 1, 1, 1,
-0.06947565, -1.122009, -3.493609, 0, 0, 1, 1, 1,
-0.0652739, -1.475185, -3.345795, 1, 0, 0, 1, 1,
-0.06390117, -0.06822356, -2.737432, 1, 0, 0, 1, 1,
-0.0632908, -1.23907, -3.872313, 1, 0, 0, 1, 1,
-0.06176673, -0.8262951, -3.900953, 1, 0, 0, 1, 1,
-0.06120436, -1.215553, -2.19155, 1, 0, 0, 1, 1,
-0.05774755, 0.4999656, -0.3123269, 0, 0, 0, 1, 1,
-0.05764743, 0.9024258, -0.6564029, 0, 0, 0, 1, 1,
-0.05363936, 1.403209, 0.3462465, 0, 0, 0, 1, 1,
-0.05199766, -1.677181, -3.658686, 0, 0, 0, 1, 1,
-0.04889793, 0.8147807, -0.9522091, 0, 0, 0, 1, 1,
-0.04882395, -0.382553, -1.471696, 0, 0, 0, 1, 1,
-0.04736497, -0.2328325, -3.639327, 0, 0, 0, 1, 1,
-0.04608778, 0.38619, 0.7880844, 1, 1, 1, 1, 1,
-0.04452743, 0.01210981, -1.138209, 1, 1, 1, 1, 1,
-0.04281814, -0.7596847, -1.638699, 1, 1, 1, 1, 1,
-0.04220215, -1.942883, -2.860817, 1, 1, 1, 1, 1,
-0.04088797, 0.6322078, -0.4289021, 1, 1, 1, 1, 1,
-0.03950248, -0.9906414, -2.819457, 1, 1, 1, 1, 1,
-0.03774734, 2.09301, 0.07986677, 1, 1, 1, 1, 1,
-0.0355638, 0.006983864, -1.68614, 1, 1, 1, 1, 1,
-0.02449185, 1.935785, 0.1819323, 1, 1, 1, 1, 1,
-0.01981339, 0.9350923, -2.675239, 1, 1, 1, 1, 1,
-0.01814882, -0.6396844, -1.65325, 1, 1, 1, 1, 1,
-0.01725516, -0.1020493, -2.957117, 1, 1, 1, 1, 1,
-0.01447105, 0.6590096, 0.3090703, 1, 1, 1, 1, 1,
-0.01342696, -1.307138, -2.38492, 1, 1, 1, 1, 1,
-0.01152539, 1.208294, 0.1595299, 1, 1, 1, 1, 1,
-0.0110019, 0.4942358, -0.7289236, 0, 0, 1, 1, 1,
-0.004142763, -0.5023063, -2.642039, 1, 0, 0, 1, 1,
-0.0002844771, -0.352377, -2.356262, 1, 0, 0, 1, 1,
-7.938087e-05, 0.09863382, -0.4695773, 1, 0, 0, 1, 1,
2.108871e-05, -1.513795, 2.924007, 1, 0, 0, 1, 1,
0.001090352, 0.7844159, -0.1172999, 1, 0, 0, 1, 1,
0.003605921, 0.1408872, -1.278101, 0, 0, 0, 1, 1,
0.003906308, -1.628123, 1.373501, 0, 0, 0, 1, 1,
0.004849139, 0.3901165, 0.3062245, 0, 0, 0, 1, 1,
0.004978366, -0.4286059, 4.981946, 0, 0, 0, 1, 1,
0.005795143, -0.5039909, 4.996421, 0, 0, 0, 1, 1,
0.006876902, -0.1283715, 2.242273, 0, 0, 0, 1, 1,
0.01187305, -1.255696, 1.95767, 0, 0, 0, 1, 1,
0.01194105, 0.6524727, -1.038022, 1, 1, 1, 1, 1,
0.03188466, 1.719066, -1.835209, 1, 1, 1, 1, 1,
0.03254792, 0.843367, 0.4427068, 1, 1, 1, 1, 1,
0.03402955, 0.4694782, -0.08546792, 1, 1, 1, 1, 1,
0.0342254, 0.5414044, -0.6717321, 1, 1, 1, 1, 1,
0.04007348, -0.4656815, 3.97354, 1, 1, 1, 1, 1,
0.04194209, -1.331685, 2.709535, 1, 1, 1, 1, 1,
0.04443092, 0.9251428, 0.165732, 1, 1, 1, 1, 1,
0.04504091, -0.364202, 3.100659, 1, 1, 1, 1, 1,
0.04531205, 0.4794391, -0.1329874, 1, 1, 1, 1, 1,
0.04953569, -0.3261491, 6.262718, 1, 1, 1, 1, 1,
0.05215149, 0.7250366, -0.3698328, 1, 1, 1, 1, 1,
0.05298922, -1.068878, 2.617638, 1, 1, 1, 1, 1,
0.05429473, -0.8668333, 3.68652, 1, 1, 1, 1, 1,
0.05620832, 0.03592854, 0.7843881, 1, 1, 1, 1, 1,
0.05705346, -0.006789497, -0.9101591, 0, 0, 1, 1, 1,
0.06168654, -1.695214, 3.586292, 1, 0, 0, 1, 1,
0.06250565, 0.5598714, 0.2721674, 1, 0, 0, 1, 1,
0.0648863, 0.1989722, 0.6001801, 1, 0, 0, 1, 1,
0.06730779, -0.4128058, 2.480188, 1, 0, 0, 1, 1,
0.06757642, -1.22039, 5.759472, 1, 0, 0, 1, 1,
0.06824626, -0.1121403, 3.089075, 0, 0, 0, 1, 1,
0.06892115, 1.340081, -0.2489008, 0, 0, 0, 1, 1,
0.07090127, 1.000532, -0.03968082, 0, 0, 0, 1, 1,
0.07111049, -0.2995543, 4.212326, 0, 0, 0, 1, 1,
0.07205132, 0.135825, 1.034385, 0, 0, 0, 1, 1,
0.07550046, 0.08752429, -0.8171607, 0, 0, 0, 1, 1,
0.07636902, 0.2791228, 0.5827597, 0, 0, 0, 1, 1,
0.07774581, 1.502192, 0.1044735, 1, 1, 1, 1, 1,
0.07873666, 0.8850423, -0.05500883, 1, 1, 1, 1, 1,
0.08204154, 0.1589737, 2.371609, 1, 1, 1, 1, 1,
0.08272907, -0.4779562, 2.565392, 1, 1, 1, 1, 1,
0.0839283, 2.389771, -1.107299, 1, 1, 1, 1, 1,
0.08697602, 1.462729, -0.2445212, 1, 1, 1, 1, 1,
0.08797012, -0.6363369, 3.245421, 1, 1, 1, 1, 1,
0.08831131, -0.991891, 2.963897, 1, 1, 1, 1, 1,
0.08917376, 1.143034, -0.8874766, 1, 1, 1, 1, 1,
0.08945188, -0.4837812, 2.975817, 1, 1, 1, 1, 1,
0.09143347, 0.1918303, 0.9619359, 1, 1, 1, 1, 1,
0.0929013, 1.124498, -2.404642, 1, 1, 1, 1, 1,
0.09377015, 0.2020949, 0.7308612, 1, 1, 1, 1, 1,
0.09521148, 0.2704987, -1.000192, 1, 1, 1, 1, 1,
0.09666228, 0.7496606, 0.3846296, 1, 1, 1, 1, 1,
0.1020847, -0.2014197, 1.264907, 0, 0, 1, 1, 1,
0.1023043, 0.3790511, -0.8803471, 1, 0, 0, 1, 1,
0.1060801, -0.654902, 5.585079, 1, 0, 0, 1, 1,
0.110467, -1.367088, 3.070465, 1, 0, 0, 1, 1,
0.1121889, -0.3036043, 3.320546, 1, 0, 0, 1, 1,
0.1155742, 0.3848514, -0.2922032, 1, 0, 0, 1, 1,
0.1156471, -1.035607, 1.940468, 0, 0, 0, 1, 1,
0.1163684, -0.2625812, 3.321219, 0, 0, 0, 1, 1,
0.1194524, 0.7900154, 0.3548871, 0, 0, 0, 1, 1,
0.1215797, -0.7096784, 2.578109, 0, 0, 0, 1, 1,
0.1216696, 1.955107, -1.240018, 0, 0, 0, 1, 1,
0.1244585, 0.1948438, 1.317668, 0, 0, 0, 1, 1,
0.1247559, -0.5414643, 4.662327, 0, 0, 0, 1, 1,
0.1256607, -1.307708, 4.592536, 1, 1, 1, 1, 1,
0.1293364, -0.2790496, 3.984763, 1, 1, 1, 1, 1,
0.1382463, -0.545373, 3.030982, 1, 1, 1, 1, 1,
0.142471, 1.013405, 0.5664303, 1, 1, 1, 1, 1,
0.1513802, -0.01804921, 2.478304, 1, 1, 1, 1, 1,
0.1532236, -0.4038164, 4.846819, 1, 1, 1, 1, 1,
0.1568196, 1.049397, 1.061881, 1, 1, 1, 1, 1,
0.1572974, -2.11308, 3.864238, 1, 1, 1, 1, 1,
0.1591649, -0.5248953, 3.893417, 1, 1, 1, 1, 1,
0.1594853, -1.072484, 3.335619, 1, 1, 1, 1, 1,
0.1611781, -0.8297387, 2.677149, 1, 1, 1, 1, 1,
0.1614806, 2.481662, -0.1991715, 1, 1, 1, 1, 1,
0.1648833, 0.1702858, 0.7411719, 1, 1, 1, 1, 1,
0.1648914, -1.587026, 3.126433, 1, 1, 1, 1, 1,
0.1668698, -0.5849165, 2.542306, 1, 1, 1, 1, 1,
0.1676847, -0.3916674, 2.452487, 0, 0, 1, 1, 1,
0.1699406, 1.424916, 2.768387, 1, 0, 0, 1, 1,
0.1722925, 0.3675869, -0.8981853, 1, 0, 0, 1, 1,
0.1767168, 1.007421, 0.1002604, 1, 0, 0, 1, 1,
0.1769741, 0.6037436, 0.4341052, 1, 0, 0, 1, 1,
0.1806265, 0.2435246, -0.006462848, 1, 0, 0, 1, 1,
0.1862538, -0.3071291, 3.2175, 0, 0, 0, 1, 1,
0.1863007, -0.2376678, 4.256361, 0, 0, 0, 1, 1,
0.1880613, 0.4312202, -1.389776, 0, 0, 0, 1, 1,
0.1892923, -0.4782439, 1.122179, 0, 0, 0, 1, 1,
0.1930879, -0.7473056, 2.34444, 0, 0, 0, 1, 1,
0.1945495, -0.2945859, 2.101888, 0, 0, 0, 1, 1,
0.1964339, 0.5005291, 0.4595441, 0, 0, 0, 1, 1,
0.2011522, -0.478678, 1.797853, 1, 1, 1, 1, 1,
0.208025, 1.33358, 0.02120301, 1, 1, 1, 1, 1,
0.2100758, 0.1785855, 2.199582, 1, 1, 1, 1, 1,
0.2131473, -0.8597232, 3.545373, 1, 1, 1, 1, 1,
0.2197154, 1.798506, 1.576788, 1, 1, 1, 1, 1,
0.2319355, -0.2903745, 3.226674, 1, 1, 1, 1, 1,
0.2375161, -0.8250205, 2.137016, 1, 1, 1, 1, 1,
0.2396448, 0.9293563, 1.698381, 1, 1, 1, 1, 1,
0.2416961, -0.8837469, 3.688645, 1, 1, 1, 1, 1,
0.2428162, 0.8428203, 1.861806, 1, 1, 1, 1, 1,
0.2446914, 1.072134, 0.8375358, 1, 1, 1, 1, 1,
0.2514441, -0.7058632, 2.716396, 1, 1, 1, 1, 1,
0.2557836, -1.08072, 3.479746, 1, 1, 1, 1, 1,
0.2596979, 1.222625, -1.490152, 1, 1, 1, 1, 1,
0.2598698, -1.896312, 3.872592, 1, 1, 1, 1, 1,
0.2602116, 1.180814, -0.8245943, 0, 0, 1, 1, 1,
0.2681932, -1.292025, 4.122352, 1, 0, 0, 1, 1,
0.272332, -0.9032389, 3.084137, 1, 0, 0, 1, 1,
0.2787937, -1.796225, 1.797569, 1, 0, 0, 1, 1,
0.2789419, 1.351903, -1.912552, 1, 0, 0, 1, 1,
0.2794161, 0.9052908, 0.9355475, 1, 0, 0, 1, 1,
0.2813983, 0.6728947, -0.8257108, 0, 0, 0, 1, 1,
0.2839519, 0.07890159, 3.848614, 0, 0, 0, 1, 1,
0.283959, 0.3899754, 0.8779171, 0, 0, 0, 1, 1,
0.2859917, -0.3906066, 2.077107, 0, 0, 0, 1, 1,
0.2911039, 0.3709331, -0.932856, 0, 0, 0, 1, 1,
0.2920386, -0.03322805, 4.124202, 0, 0, 0, 1, 1,
0.3018132, 0.08479848, 1.446787, 0, 0, 0, 1, 1,
0.3018253, -0.1869511, 2.176788, 1, 1, 1, 1, 1,
0.3028958, -1.848544, 2.605617, 1, 1, 1, 1, 1,
0.3061371, -0.7689402, 2.812446, 1, 1, 1, 1, 1,
0.3092538, 1.094897, -2.272193, 1, 1, 1, 1, 1,
0.3120764, -0.1408634, 1.314588, 1, 1, 1, 1, 1,
0.3128063, -0.9360775, 3.784791, 1, 1, 1, 1, 1,
0.3159477, 1.440663, 1.708038, 1, 1, 1, 1, 1,
0.3220364, 1.719224, 0.6775912, 1, 1, 1, 1, 1,
0.3229008, -0.448396, 0.7807487, 1, 1, 1, 1, 1,
0.3264426, 1.288897, 0.9503558, 1, 1, 1, 1, 1,
0.3315414, 0.1773557, 1.33141, 1, 1, 1, 1, 1,
0.3369735, 0.7766817, 1.061304, 1, 1, 1, 1, 1,
0.3376201, -0.01248284, 1.397247, 1, 1, 1, 1, 1,
0.3386018, 0.3047298, 2.266278, 1, 1, 1, 1, 1,
0.3411114, 1.732772, 0.8647914, 1, 1, 1, 1, 1,
0.3436342, 1.041746, -0.9270619, 0, 0, 1, 1, 1,
0.3533452, -0.9796047, 2.699417, 1, 0, 0, 1, 1,
0.3546846, 1.673655, -0.8414643, 1, 0, 0, 1, 1,
0.3569919, 0.1612129, 2.416911, 1, 0, 0, 1, 1,
0.3627366, -0.3140662, 2.811642, 1, 0, 0, 1, 1,
0.3629698, 0.125165, 2.08835, 1, 0, 0, 1, 1,
0.3633287, 0.3381901, 1.140217, 0, 0, 0, 1, 1,
0.3637437, 0.9868488, 0.3546874, 0, 0, 0, 1, 1,
0.3667408, 1.177954, 1.704004, 0, 0, 0, 1, 1,
0.3678227, 0.4884589, -0.9115093, 0, 0, 0, 1, 1,
0.3685206, 2.336369, -0.609075, 0, 0, 0, 1, 1,
0.3712153, 0.7396678, 0.03325212, 0, 0, 0, 1, 1,
0.3744916, 1.431205, 1.135998, 0, 0, 0, 1, 1,
0.3765285, 1.142505, 0.5880489, 1, 1, 1, 1, 1,
0.3806254, 0.04925353, 1.656775, 1, 1, 1, 1, 1,
0.3808038, 1.137683, -1.010234, 1, 1, 1, 1, 1,
0.3879332, 0.4441508, 2.645303, 1, 1, 1, 1, 1,
0.388986, -1.054464, 5.936524, 1, 1, 1, 1, 1,
0.3962905, 1.755076, -0.5147514, 1, 1, 1, 1, 1,
0.4002558, 0.02013852, 1.496597, 1, 1, 1, 1, 1,
0.4006324, 0.8856041, -1.32345, 1, 1, 1, 1, 1,
0.4013567, 1.113059, 1.863156, 1, 1, 1, 1, 1,
0.406739, -0.3005053, 3.628241, 1, 1, 1, 1, 1,
0.4083673, -0.008998073, 1.257808, 1, 1, 1, 1, 1,
0.4096404, 0.1453176, 2.096821, 1, 1, 1, 1, 1,
0.4148019, -0.4334305, 3.080337, 1, 1, 1, 1, 1,
0.4154833, 0.8102948, 0.5822601, 1, 1, 1, 1, 1,
0.4158294, -0.8336543, 2.872873, 1, 1, 1, 1, 1,
0.4166718, 1.269439, 1.132951, 0, 0, 1, 1, 1,
0.4192863, 1.398964, 0.3334733, 1, 0, 0, 1, 1,
0.4197271, 0.7935607, -0.2808832, 1, 0, 0, 1, 1,
0.4229823, -1.088384, 1.265424, 1, 0, 0, 1, 1,
0.4237221, 1.975577, 0.6102928, 1, 0, 0, 1, 1,
0.4249181, 0.171795, 1.430209, 1, 0, 0, 1, 1,
0.4252357, -0.8662674, 2.022313, 0, 0, 0, 1, 1,
0.4253229, -0.3782064, 2.92107, 0, 0, 0, 1, 1,
0.42613, -0.1590252, 2.06245, 0, 0, 0, 1, 1,
0.4291191, -1.835023, 2.621364, 0, 0, 0, 1, 1,
0.4323356, 1.532067, 0.4432813, 0, 0, 0, 1, 1,
0.4415659, -0.2185759, 3.707854, 0, 0, 0, 1, 1,
0.4445369, 0.7300599, 0.4693852, 0, 0, 0, 1, 1,
0.4496916, 0.3320101, 1.894946, 1, 1, 1, 1, 1,
0.4519037, -1.412019, 2.039994, 1, 1, 1, 1, 1,
0.4525859, -0.3463385, 1.400455, 1, 1, 1, 1, 1,
0.4526219, 0.2024573, 0.1143291, 1, 1, 1, 1, 1,
0.4558037, -0.7440026, 3.197058, 1, 1, 1, 1, 1,
0.4632276, -1.358417, 2.815287, 1, 1, 1, 1, 1,
0.4654665, -1.668228, 3.137875, 1, 1, 1, 1, 1,
0.4663682, -1.19968, 2.3848, 1, 1, 1, 1, 1,
0.4678659, -0.0946495, 1.652851, 1, 1, 1, 1, 1,
0.4791247, 1.461666, 1.041695, 1, 1, 1, 1, 1,
0.4854273, -0.4470214, -0.05973739, 1, 1, 1, 1, 1,
0.4906835, 0.7951543, 1.100898, 1, 1, 1, 1, 1,
0.4915967, 1.169509, -0.442974, 1, 1, 1, 1, 1,
0.4923081, 2.338768, 1.028358, 1, 1, 1, 1, 1,
0.4936607, -0.3318726, 3.267803, 1, 1, 1, 1, 1,
0.4952065, 0.2743089, 1.673358, 0, 0, 1, 1, 1,
0.4971947, -0.8523299, 3.649539, 1, 0, 0, 1, 1,
0.5025581, 1.851884, 0.2127298, 1, 0, 0, 1, 1,
0.5037684, -1.23941, 1.613317, 1, 0, 0, 1, 1,
0.504446, -1.783623, 1.88799, 1, 0, 0, 1, 1,
0.5061337, -0.2229152, -0.7940896, 1, 0, 0, 1, 1,
0.5089321, -0.1987178, 1.865457, 0, 0, 0, 1, 1,
0.5153598, -0.3200606, 2.288281, 0, 0, 0, 1, 1,
0.5170451, 0.1845752, 0.378029, 0, 0, 0, 1, 1,
0.5176176, -0.6807199, 1.364345, 0, 0, 0, 1, 1,
0.5193576, -1.086925, 2.530105, 0, 0, 0, 1, 1,
0.5196425, -0.9316905, 2.932543, 0, 0, 0, 1, 1,
0.5220917, -1.544841, 2.876664, 0, 0, 0, 1, 1,
0.5244951, -1.024816, 3.379172, 1, 1, 1, 1, 1,
0.5248389, 0.01910871, 2.195002, 1, 1, 1, 1, 1,
0.5275184, -1.675109, 3.043977, 1, 1, 1, 1, 1,
0.5303672, -0.2843486, 3.169225, 1, 1, 1, 1, 1,
0.5376657, -0.03053477, 3.473421, 1, 1, 1, 1, 1,
0.5405265, -1.175203, 4.223861, 1, 1, 1, 1, 1,
0.542322, 0.6938288, 0.03777117, 1, 1, 1, 1, 1,
0.544413, -0.09891161, 2.890069, 1, 1, 1, 1, 1,
0.5469217, -0.8297981, 3.293039, 1, 1, 1, 1, 1,
0.5515199, 0.6484314, 0.5186579, 1, 1, 1, 1, 1,
0.5521523, 0.2276759, 1.311269, 1, 1, 1, 1, 1,
0.553361, -0.0005316749, 3.103025, 1, 1, 1, 1, 1,
0.5584189, -0.788381, 2.0551, 1, 1, 1, 1, 1,
0.5655804, 0.02874106, 3.774678, 1, 1, 1, 1, 1,
0.5656661, -1.443448, 2.488868, 1, 1, 1, 1, 1,
0.5756876, -0.3538552, 2.351828, 0, 0, 1, 1, 1,
0.58201, -1.045784, 1.062329, 1, 0, 0, 1, 1,
0.5834955, -0.8035543, 2.417723, 1, 0, 0, 1, 1,
0.5871307, -0.3310704, 2.352356, 1, 0, 0, 1, 1,
0.588038, -0.5168959, 0.4699004, 1, 0, 0, 1, 1,
0.5896773, -0.4617653, 1.257719, 1, 0, 0, 1, 1,
0.5940093, 0.4455625, 2.537306, 0, 0, 0, 1, 1,
0.5961277, 0.05583155, 0.4464503, 0, 0, 0, 1, 1,
0.596284, 1.258926, 1.100591, 0, 0, 0, 1, 1,
0.597019, -0.906351, 3.747925, 0, 0, 0, 1, 1,
0.5991406, -1.894095, 1.61296, 0, 0, 0, 1, 1,
0.5998303, -1.057799, 3.229316, 0, 0, 0, 1, 1,
0.6019739, -1.375448, 3.059095, 0, 0, 0, 1, 1,
0.606796, -0.9562569, 3.551893, 1, 1, 1, 1, 1,
0.609143, -0.3571228, 2.959883, 1, 1, 1, 1, 1,
0.6116364, 0.971813, 0.831343, 1, 1, 1, 1, 1,
0.6147917, 0.8753211, 1.950416, 1, 1, 1, 1, 1,
0.6158189, -2.107657, 0.4086708, 1, 1, 1, 1, 1,
0.6222251, -0.2928034, 1.042726, 1, 1, 1, 1, 1,
0.622301, -0.9113056, 2.650587, 1, 1, 1, 1, 1,
0.6252173, -0.7295659, 4.296022, 1, 1, 1, 1, 1,
0.6283219, 1.295195, 1.833625, 1, 1, 1, 1, 1,
0.628944, 0.7443449, -0.3613446, 1, 1, 1, 1, 1,
0.6308067, 1.56891, -0.7286373, 1, 1, 1, 1, 1,
0.6345569, 0.1373179, 1.85144, 1, 1, 1, 1, 1,
0.6350779, 0.8171026, 1.608607, 1, 1, 1, 1, 1,
0.6354009, -1.801806, 3.641362, 1, 1, 1, 1, 1,
0.6361381, 0.8339901, 1.040592, 1, 1, 1, 1, 1,
0.6396735, 0.8039162, 0.1871191, 0, 0, 1, 1, 1,
0.64053, 0.2305009, -0.3081062, 1, 0, 0, 1, 1,
0.6457968, 0.3126532, 1.629638, 1, 0, 0, 1, 1,
0.6461254, -0.4001296, 2.819629, 1, 0, 0, 1, 1,
0.6489092, -1.285951, 1.631333, 1, 0, 0, 1, 1,
0.6491994, 0.4245968, 2.474388, 1, 0, 0, 1, 1,
0.6496066, -0.5522046, 2.928256, 0, 0, 0, 1, 1,
0.6501337, 0.1521506, 2.865824, 0, 0, 0, 1, 1,
0.6507072, 1.675321, -0.2014027, 0, 0, 0, 1, 1,
0.6529714, -0.9164789, 2.193448, 0, 0, 0, 1, 1,
0.6533647, 0.3289609, -0.3604879, 0, 0, 0, 1, 1,
0.6571274, 1.125911, 0.1469507, 0, 0, 0, 1, 1,
0.6595635, 0.5097655, 1.351115, 0, 0, 0, 1, 1,
0.6599194, 0.06656583, 1.238169, 1, 1, 1, 1, 1,
0.661819, -1.474259, 3.409706, 1, 1, 1, 1, 1,
0.6658475, 1.098994, 0.1345911, 1, 1, 1, 1, 1,
0.6703413, -1.300781, 3.700585, 1, 1, 1, 1, 1,
0.6728124, -0.5351534, 2.390967, 1, 1, 1, 1, 1,
0.6738428, -1.085591, -0.4647942, 1, 1, 1, 1, 1,
0.6745986, -0.006170146, 1.795503, 1, 1, 1, 1, 1,
0.6748007, -1.384698, 3.048909, 1, 1, 1, 1, 1,
0.6851245, 0.2536556, 1.126446, 1, 1, 1, 1, 1,
0.693584, 0.6383958, 1.884882, 1, 1, 1, 1, 1,
0.6959408, 0.05671773, 0.1098569, 1, 1, 1, 1, 1,
0.6960613, -0.4747853, 4.509083, 1, 1, 1, 1, 1,
0.701686, 1.075005, 0.1058925, 1, 1, 1, 1, 1,
0.7035521, -0.4763966, 1.406891, 1, 1, 1, 1, 1,
0.7037811, 0.2898049, 3.39904, 1, 1, 1, 1, 1,
0.7078323, -1.171279, 4.79553, 0, 0, 1, 1, 1,
0.7153599, -0.1697742, 1.009189, 1, 0, 0, 1, 1,
0.7201535, 0.82142, 0.8011665, 1, 0, 0, 1, 1,
0.730872, -0.8560375, 1.144535, 1, 0, 0, 1, 1,
0.7347727, 0.4846099, 1.712166, 1, 0, 0, 1, 1,
0.7374506, -0.3668036, 3.138678, 1, 0, 0, 1, 1,
0.7394986, 1.409858, -0.3893682, 0, 0, 0, 1, 1,
0.7405005, -0.1801919, 3.008949, 0, 0, 0, 1, 1,
0.7405115, -1.329496, 1.112888, 0, 0, 0, 1, 1,
0.7499769, 0.9779369, 0.4625802, 0, 0, 0, 1, 1,
0.7510744, -0.5336676, 2.183778, 0, 0, 0, 1, 1,
0.7517654, 1.804691, -0.2246557, 0, 0, 0, 1, 1,
0.7549051, -0.562462, 2.613755, 0, 0, 0, 1, 1,
0.7566302, -1.138379, 1.69783, 1, 1, 1, 1, 1,
0.7601393, 0.2456539, 1.553594, 1, 1, 1, 1, 1,
0.7622589, -0.9799112, 0.999914, 1, 1, 1, 1, 1,
0.7672758, -0.5203238, 2.685752, 1, 1, 1, 1, 1,
0.7808213, -1.196906, 2.754735, 1, 1, 1, 1, 1,
0.7837, -1.500363, 2.61256, 1, 1, 1, 1, 1,
0.7953899, -1.443497, 2.928422, 1, 1, 1, 1, 1,
0.7969912, 0.1558006, 1.82818, 1, 1, 1, 1, 1,
0.8041347, -0.1630346, 4.090616, 1, 1, 1, 1, 1,
0.805855, -0.7972093, 2.791455, 1, 1, 1, 1, 1,
0.8060556, 0.8487443, 0.5500425, 1, 1, 1, 1, 1,
0.8084131, -1.033182, 2.429391, 1, 1, 1, 1, 1,
0.8110098, -0.9522127, 1.687258, 1, 1, 1, 1, 1,
0.8223168, -0.8847447, 0.8143373, 1, 1, 1, 1, 1,
0.8322875, -0.4997165, 2.32398, 1, 1, 1, 1, 1,
0.8377773, -0.6728516, 2.169061, 0, 0, 1, 1, 1,
0.8404211, 0.9562091, 0.9381708, 1, 0, 0, 1, 1,
0.8456341, -0.1860032, 1.298428, 1, 0, 0, 1, 1,
0.8473813, 0.6022649, 1.998698, 1, 0, 0, 1, 1,
0.8578185, 1.231838, -1.786063, 1, 0, 0, 1, 1,
0.8591326, -0.3825081, 2.491956, 1, 0, 0, 1, 1,
0.8606442, 0.05264694, 2.343297, 0, 0, 0, 1, 1,
0.861499, -0.3981195, 1.265046, 0, 0, 0, 1, 1,
0.8786576, -0.8331584, 1.498514, 0, 0, 0, 1, 1,
0.8812492, -1.733538, 3.475478, 0, 0, 0, 1, 1,
0.8829443, 0.01070517, 3.166728, 0, 0, 0, 1, 1,
0.8835742, -0.3773863, 1.976896, 0, 0, 0, 1, 1,
0.9033482, 0.3730651, 1.195665, 0, 0, 0, 1, 1,
0.9066889, 0.6556302, 0.3096709, 1, 1, 1, 1, 1,
0.9100614, 0.6781929, 1.720227, 1, 1, 1, 1, 1,
0.9102492, -0.005237635, 1.810314, 1, 1, 1, 1, 1,
0.9103241, 2.399773, -0.2244432, 1, 1, 1, 1, 1,
0.9122387, -0.9541056, 2.752986, 1, 1, 1, 1, 1,
0.9173146, -0.3076765, 2.735102, 1, 1, 1, 1, 1,
0.9201679, 0.005579558, 3.299532, 1, 1, 1, 1, 1,
0.9214585, 0.1796514, 3.107864, 1, 1, 1, 1, 1,
0.9223267, -0.3023008, 2.594352, 1, 1, 1, 1, 1,
0.9236448, 0.5795754, 0.9454274, 1, 1, 1, 1, 1,
0.9278736, 0.2173406, 1.43319, 1, 1, 1, 1, 1,
0.9304643, 0.1661536, 0.2837967, 1, 1, 1, 1, 1,
0.9351185, -1.021969, 1.296811, 1, 1, 1, 1, 1,
0.9403345, 0.1079142, 1.248755, 1, 1, 1, 1, 1,
0.95872, 0.03020605, 0.9552277, 1, 1, 1, 1, 1,
0.96982, 0.6656803, 1.47231, 0, 0, 1, 1, 1,
0.9702699, 0.03634708, 1.844452, 1, 0, 0, 1, 1,
0.971845, 0.1128826, 1.04443, 1, 0, 0, 1, 1,
0.9719322, 0.5184244, -0.712017, 1, 0, 0, 1, 1,
0.9749526, -2.085934, 3.677492, 1, 0, 0, 1, 1,
0.9784942, 1.375536, -0.7436056, 1, 0, 0, 1, 1,
0.9827946, -0.8388453, 4.349717, 0, 0, 0, 1, 1,
0.9880708, 0.6485913, 0.8360964, 0, 0, 0, 1, 1,
0.9953979, -1.021972, 3.168144, 0, 0, 0, 1, 1,
1.009861, 0.08972594, 1.436177, 0, 0, 0, 1, 1,
1.027215, -0.9546843, 2.488872, 0, 0, 0, 1, 1,
1.031562, -1.686189, 2.19832, 0, 0, 0, 1, 1,
1.031799, -0.683789, 3.359886, 0, 0, 0, 1, 1,
1.040616, -0.2214469, 1.574786, 1, 1, 1, 1, 1,
1.040935, -0.9355482, 0.1654116, 1, 1, 1, 1, 1,
1.046776, 1.483746, 0.3964345, 1, 1, 1, 1, 1,
1.052714, -0.8602284, 3.611816, 1, 1, 1, 1, 1,
1.05818, -1.948437, 3.074836, 1, 1, 1, 1, 1,
1.061474, -1.577609, 2.977036, 1, 1, 1, 1, 1,
1.072062, 0.01634771, 0.5162129, 1, 1, 1, 1, 1,
1.087826, 0.04981693, 3.250227, 1, 1, 1, 1, 1,
1.091621, -0.5230602, 2.015605, 1, 1, 1, 1, 1,
1.096313, -0.724641, 2.288553, 1, 1, 1, 1, 1,
1.115568, -2.291825, 4.521355, 1, 1, 1, 1, 1,
1.120676, -0.6920717, 0.9647774, 1, 1, 1, 1, 1,
1.12606, -0.01372182, 0.7285124, 1, 1, 1, 1, 1,
1.127562, -0.828379, 0.4913248, 1, 1, 1, 1, 1,
1.131182, 0.6682324, 0.5784179, 1, 1, 1, 1, 1,
1.146103, -1.080392, 2.107335, 0, 0, 1, 1, 1,
1.154087, -1.077537, 2.60999, 1, 0, 0, 1, 1,
1.178801, 0.4561916, 1.088863, 1, 0, 0, 1, 1,
1.182957, -0.4316971, 0.2233032, 1, 0, 0, 1, 1,
1.186377, 0.3138823, 1.502783, 1, 0, 0, 1, 1,
1.186733, 1.575849, 1.728897, 1, 0, 0, 1, 1,
1.188798, -1.69197, 1.638276, 0, 0, 0, 1, 1,
1.191162, -1.037683, 2.842856, 0, 0, 0, 1, 1,
1.206495, -0.1819081, 1.920515, 0, 0, 0, 1, 1,
1.208819, -1.00424, 2.821324, 0, 0, 0, 1, 1,
1.211786, 1.390653, 2.573929, 0, 0, 0, 1, 1,
1.212962, -0.9618428, 1.469638, 0, 0, 0, 1, 1,
1.221769, 0.32292, 0.9824717, 0, 0, 0, 1, 1,
1.231732, -0.09466136, 1.755572, 1, 1, 1, 1, 1,
1.235571, -0.4826679, 2.185133, 1, 1, 1, 1, 1,
1.241563, 1.538267, 1.825245, 1, 1, 1, 1, 1,
1.251884, -0.5034907, 3.50049, 1, 1, 1, 1, 1,
1.258344, -0.347298, 3.020905, 1, 1, 1, 1, 1,
1.258798, 0.4684442, 1.238073, 1, 1, 1, 1, 1,
1.260522, -0.7138813, 0.8416568, 1, 1, 1, 1, 1,
1.265497, 0.2784025, 1.066531, 1, 1, 1, 1, 1,
1.269124, 0.8236016, 1.892689, 1, 1, 1, 1, 1,
1.272829, 0.925116, 1.71424, 1, 1, 1, 1, 1,
1.278985, 0.08845518, 0.6953238, 1, 1, 1, 1, 1,
1.295097, 0.4662401, 0.4796644, 1, 1, 1, 1, 1,
1.296524, 0.2820674, 0.8640375, 1, 1, 1, 1, 1,
1.316053, 0.9126513, 1.079435, 1, 1, 1, 1, 1,
1.321735, 0.817695, 1.218245, 1, 1, 1, 1, 1,
1.329469, -1.925368, 3.017461, 0, 0, 1, 1, 1,
1.33005, -0.6897585, 1.482292, 1, 0, 0, 1, 1,
1.336714, 1.996924, -0.3886018, 1, 0, 0, 1, 1,
1.338612, 0.9326739, 2.222121, 1, 0, 0, 1, 1,
1.348865, -0.5935716, 4.006397, 1, 0, 0, 1, 1,
1.350009, -0.59209, 1.973342, 1, 0, 0, 1, 1,
1.359149, 1.307859, 2.047163, 0, 0, 0, 1, 1,
1.362713, -0.3184197, 1.676372, 0, 0, 0, 1, 1,
1.363861, -1.45488, 0.6681319, 0, 0, 0, 1, 1,
1.381408, 0.2562498, -1.05065, 0, 0, 0, 1, 1,
1.382496, 1.05905, -0.1542906, 0, 0, 0, 1, 1,
1.382673, -0.3577922, 2.270473, 0, 0, 0, 1, 1,
1.396831, 0.1482694, 0.1209785, 0, 0, 0, 1, 1,
1.402751, 1.092343, 1.154684, 1, 1, 1, 1, 1,
1.404872, 0.2980572, 0.8137863, 1, 1, 1, 1, 1,
1.405232, -0.6080781, 1.918479, 1, 1, 1, 1, 1,
1.406042, 0.2320091, 2.623825, 1, 1, 1, 1, 1,
1.40645, 0.05760512, 2.573699, 1, 1, 1, 1, 1,
1.407055, -0.2326897, 0.976901, 1, 1, 1, 1, 1,
1.410008, 0.9996769, -0.351376, 1, 1, 1, 1, 1,
1.413277, -1.287256, 2.159916, 1, 1, 1, 1, 1,
1.423613, 2.000563, -0.662191, 1, 1, 1, 1, 1,
1.423831, -0.8416777, 1.972074, 1, 1, 1, 1, 1,
1.42553, 0.05049447, 2.537293, 1, 1, 1, 1, 1,
1.42575, -1.257518, 3.301816, 1, 1, 1, 1, 1,
1.428491, -1.587783, 0.4636728, 1, 1, 1, 1, 1,
1.429171, -0.3025415, 2.353756, 1, 1, 1, 1, 1,
1.435126, -2.219367, 0.7920916, 1, 1, 1, 1, 1,
1.439145, -1.271632, 2.07287, 0, 0, 1, 1, 1,
1.45039, -0.6294771, 1.728293, 1, 0, 0, 1, 1,
1.460832, 0.009246415, 1.828453, 1, 0, 0, 1, 1,
1.470034, -0.7395138, 0.5651035, 1, 0, 0, 1, 1,
1.475639, 0.9097188, 1.809437, 1, 0, 0, 1, 1,
1.481259, 0.8441269, 1.927603, 1, 0, 0, 1, 1,
1.486461, -0.8826683, 2.396274, 0, 0, 0, 1, 1,
1.497665, -0.8200806, 1.210009, 0, 0, 0, 1, 1,
1.510823, 0.7317284, 1.803012, 0, 0, 0, 1, 1,
1.51173, -0.361525, 3.205099, 0, 0, 0, 1, 1,
1.535673, -1.987884, 1.302028, 0, 0, 0, 1, 1,
1.549109, 1.000316, 0.3624015, 0, 0, 0, 1, 1,
1.559438, 0.6347282, 1.487408, 0, 0, 0, 1, 1,
1.561771, 0.9151362, -1.682396, 1, 1, 1, 1, 1,
1.566313, -0.6998593, 1.109568, 1, 1, 1, 1, 1,
1.5762, 0.4809923, 1.311263, 1, 1, 1, 1, 1,
1.59418, -0.4524278, 2.364411, 1, 1, 1, 1, 1,
1.611031, 1.945514, 0.3615435, 1, 1, 1, 1, 1,
1.61557, -0.03824507, 0.6788521, 1, 1, 1, 1, 1,
1.631293, -0.3219067, 1.119589, 1, 1, 1, 1, 1,
1.639696, -0.744809, 0.8131507, 1, 1, 1, 1, 1,
1.647127, -0.04030256, 0.3258838, 1, 1, 1, 1, 1,
1.660428, -0.1882205, 1.855626, 1, 1, 1, 1, 1,
1.660647, 0.5262066, 0.8187827, 1, 1, 1, 1, 1,
1.670776, -0.114038, 1.713112, 1, 1, 1, 1, 1,
1.682261, 0.5564014, 1.298953, 1, 1, 1, 1, 1,
1.683245, -1.170925, 0.4441925, 1, 1, 1, 1, 1,
1.691633, -1.705729, 2.503929, 1, 1, 1, 1, 1,
1.723417, 1.304217, 1.235242, 0, 0, 1, 1, 1,
1.729371, -0.7580951, 0.568302, 1, 0, 0, 1, 1,
1.739491, -0.4100697, 3.13001, 1, 0, 0, 1, 1,
1.752272, 2.086477, 1.187294, 1, 0, 0, 1, 1,
1.767412, -0.5385284, 0.8432731, 1, 0, 0, 1, 1,
1.770528, -0.6085014, 1.824916, 1, 0, 0, 1, 1,
1.780051, -1.740588, 0.3043105, 0, 0, 0, 1, 1,
1.79393, -0.7933784, -0.4273205, 0, 0, 0, 1, 1,
1.813478, 0.122156, 0.8699566, 0, 0, 0, 1, 1,
1.824077, 0.1334632, 2.682803, 0, 0, 0, 1, 1,
1.824933, -0.1184865, 0.9815264, 0, 0, 0, 1, 1,
1.833281, -0.9972316, 2.815429, 0, 0, 0, 1, 1,
1.884472, 1.019624, -0.3433532, 0, 0, 0, 1, 1,
1.895875, -0.2244711, 1.468185, 1, 1, 1, 1, 1,
1.929814, 0.1786807, 1.20341, 1, 1, 1, 1, 1,
1.939116, -0.1575714, 1.293708, 1, 1, 1, 1, 1,
2.007423, -1.177581, 1.789919, 1, 1, 1, 1, 1,
2.008029, 0.6857834, 2.283971, 1, 1, 1, 1, 1,
2.033814, -0.5876746, 1.238713, 1, 1, 1, 1, 1,
2.035304, 1.800445, -0.9146548, 1, 1, 1, 1, 1,
2.039216, -0.2789609, 0.45383, 1, 1, 1, 1, 1,
2.039705, 0.5376362, 2.924692, 1, 1, 1, 1, 1,
2.056512, 0.275939, 1.33972, 1, 1, 1, 1, 1,
2.103206, 0.1697539, 1.71379, 1, 1, 1, 1, 1,
2.121084, 0.6084378, -2.340851, 1, 1, 1, 1, 1,
2.124777, 0.307657, 0.6438522, 1, 1, 1, 1, 1,
2.131588, -1.975761, 2.654903, 1, 1, 1, 1, 1,
2.132786, 1.556607, 0.318453, 1, 1, 1, 1, 1,
2.139929, 1.158068, 0.6055619, 0, 0, 1, 1, 1,
2.156163, 1.007859, 1.132983, 1, 0, 0, 1, 1,
2.161325, -0.8678182, 0.9971916, 1, 0, 0, 1, 1,
2.17803, 0.6947185, 1.78471, 1, 0, 0, 1, 1,
2.201162, -0.1003716, 0.6224557, 1, 0, 0, 1, 1,
2.203675, -0.2683131, 4.401225, 1, 0, 0, 1, 1,
2.222867, -1.99061, 2.99087, 0, 0, 0, 1, 1,
2.300308, 1.071385, 2.264513, 0, 0, 0, 1, 1,
2.327322, -1.073585, 1.385295, 0, 0, 0, 1, 1,
2.354027, -0.4676358, 2.474688, 0, 0, 0, 1, 1,
2.59158, 0.6471701, 2.605853, 0, 0, 0, 1, 1,
2.63687, -0.457308, 2.723973, 0, 0, 0, 1, 1,
2.642107, -0.2514574, 2.925151, 0, 0, 0, 1, 1,
2.698226, 0.3913188, -0.02514657, 1, 1, 1, 1, 1,
2.725922, 0.07789083, 2.806279, 1, 1, 1, 1, 1,
2.788683, -0.9153924, 0.9213185, 1, 1, 1, 1, 1,
2.822943, -1.206229, 2.642566, 1, 1, 1, 1, 1,
2.910671, -0.9358315, 0.9381551, 1, 1, 1, 1, 1,
3.022485, -0.1082201, 0.2876544, 1, 1, 1, 1, 1,
3.541468, -0.7803221, 2.817414, 1, 1, 1, 1, 1
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
var radius = 9.939452;
var distance = 34.9119;
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
mvMatrix.translate( -0.158196, -0.2036101, -0.3996475 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.9119);
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
