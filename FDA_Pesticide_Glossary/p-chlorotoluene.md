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
-4.07713, -1.146486, -2.865162, 1, 0, 0, 1,
-2.704761, -0.1881424, -0.3689751, 1, 0.007843138, 0, 1,
-2.679621, -1.796198, -1.892286, 1, 0.01176471, 0, 1,
-2.474091, 0.05062498, -0.972753, 1, 0.01960784, 0, 1,
-2.414861, -0.5947667, -1.721648, 1, 0.02352941, 0, 1,
-2.342044, -0.09497841, -1.534738, 1, 0.03137255, 0, 1,
-2.278322, 0.7247868, -0.4240164, 1, 0.03529412, 0, 1,
-2.27818, 0.9736336, -1.334306, 1, 0.04313726, 0, 1,
-2.277891, -1.134693, -0.08239536, 1, 0.04705882, 0, 1,
-2.276433, 1.558095, -1.255876, 1, 0.05490196, 0, 1,
-2.268414, 0.6938509, -0.3003107, 1, 0.05882353, 0, 1,
-2.194056, -1.003519, 0.8234878, 1, 0.06666667, 0, 1,
-2.191599, 0.1985673, -0.5031603, 1, 0.07058824, 0, 1,
-2.167601, 0.4226153, -1.825078, 1, 0.07843138, 0, 1,
-2.132735, -0.09637446, -2.109448, 1, 0.08235294, 0, 1,
-2.12263, -1.731272, -2.33566, 1, 0.09019608, 0, 1,
-2.118654, 0.2852877, 0.4411634, 1, 0.09411765, 0, 1,
-2.118198, -1.90743, -1.836227, 1, 0.1019608, 0, 1,
-2.109264, 0.3088771, -0.403859, 1, 0.1098039, 0, 1,
-2.087297, 0.1266007, -2.750756, 1, 0.1137255, 0, 1,
-2.086709, 1.010293, -1.626068, 1, 0.1215686, 0, 1,
-2.06091, 0.6619202, -1.297664, 1, 0.1254902, 0, 1,
-2.057267, -1.139109, -1.867927, 1, 0.1333333, 0, 1,
-2.049278, 0.6975662, -1.602412, 1, 0.1372549, 0, 1,
-1.995887, 0.2593625, -1.298079, 1, 0.145098, 0, 1,
-1.964533, 0.7973232, -2.135509, 1, 0.1490196, 0, 1,
-1.911089, -0.7427152, -1.022496, 1, 0.1568628, 0, 1,
-1.869658, -1.406249, -0.555869, 1, 0.1607843, 0, 1,
-1.849029, -0.07497682, -1.150033, 1, 0.1686275, 0, 1,
-1.841346, -0.9242212, -2.627996, 1, 0.172549, 0, 1,
-1.838366, -1.99726, -2.29467, 1, 0.1803922, 0, 1,
-1.821359, 2.103395, -0.6261713, 1, 0.1843137, 0, 1,
-1.817793, -1.186542, -1.768984, 1, 0.1921569, 0, 1,
-1.80343, 0.5119196, -1.661632, 1, 0.1960784, 0, 1,
-1.785334, -0.04876895, -0.1829295, 1, 0.2039216, 0, 1,
-1.783918, 0.2767543, -1.660757, 1, 0.2117647, 0, 1,
-1.746884, -0.4289774, -2.092718, 1, 0.2156863, 0, 1,
-1.718323, 0.3307992, -1.484088, 1, 0.2235294, 0, 1,
-1.715618, -1.605044, -2.81324, 1, 0.227451, 0, 1,
-1.714972, -0.6812552, -0.07481557, 1, 0.2352941, 0, 1,
-1.700557, -3.321982, -0.8820186, 1, 0.2392157, 0, 1,
-1.669012, 1.57506, 0.1838655, 1, 0.2470588, 0, 1,
-1.651565, 1.582132, 2.231417, 1, 0.2509804, 0, 1,
-1.641293, 1.210646, -1.56106, 1, 0.2588235, 0, 1,
-1.64068, -0.209778, -0.7521051, 1, 0.2627451, 0, 1,
-1.636469, -0.2342826, -1.351986, 1, 0.2705882, 0, 1,
-1.63322, -1.414709, -0.9640629, 1, 0.2745098, 0, 1,
-1.630079, 1.396355, -1.443812, 1, 0.282353, 0, 1,
-1.626252, 0.8734195, 1.150891, 1, 0.2862745, 0, 1,
-1.622189, -0.5572165, -1.069676, 1, 0.2941177, 0, 1,
-1.610167, 0.8630469, 0.01939722, 1, 0.3019608, 0, 1,
-1.609453, 0.4184977, -2.149402, 1, 0.3058824, 0, 1,
-1.599105, 0.2588777, -1.824618, 1, 0.3137255, 0, 1,
-1.597663, 0.4234736, -2.433518, 1, 0.3176471, 0, 1,
-1.592574, -0.7348081, -2.591805, 1, 0.3254902, 0, 1,
-1.578912, 0.751708, -1.905417, 1, 0.3294118, 0, 1,
-1.571231, 0.005617999, -1.163301, 1, 0.3372549, 0, 1,
-1.561623, 1.166165, -1.153094, 1, 0.3411765, 0, 1,
-1.54414, 0.1411832, 0.3362241, 1, 0.3490196, 0, 1,
-1.54393, 0.1870055, -0.9515903, 1, 0.3529412, 0, 1,
-1.543699, -0.5791959, -2.973363, 1, 0.3607843, 0, 1,
-1.541995, -0.6271822, -3.124035, 1, 0.3647059, 0, 1,
-1.529052, 0.6874889, -1.155412, 1, 0.372549, 0, 1,
-1.513326, 0.1805126, -1.844111, 1, 0.3764706, 0, 1,
-1.497975, -0.3332456, -0.1593655, 1, 0.3843137, 0, 1,
-1.492376, -0.7971955, -1.675598, 1, 0.3882353, 0, 1,
-1.491003, -0.01999379, 0.893931, 1, 0.3960784, 0, 1,
-1.483224, 1.827288, -0.1230205, 1, 0.4039216, 0, 1,
-1.475512, 0.4519705, -2.327277, 1, 0.4078431, 0, 1,
-1.474995, -0.6003885, -1.918348, 1, 0.4156863, 0, 1,
-1.469501, 1.408317, -2.048582, 1, 0.4196078, 0, 1,
-1.445163, 0.5983653, -0.9015375, 1, 0.427451, 0, 1,
-1.419717, -0.7685702, 0.3793364, 1, 0.4313726, 0, 1,
-1.416705, 0.09431116, -2.759465, 1, 0.4392157, 0, 1,
-1.416637, 0.6605018, -1.49026, 1, 0.4431373, 0, 1,
-1.414069, -0.9168381, -2.563561, 1, 0.4509804, 0, 1,
-1.407179, -0.9593056, -0.09179807, 1, 0.454902, 0, 1,
-1.400576, 0.01711412, 0.1128453, 1, 0.4627451, 0, 1,
-1.397561, -1.601765, -1.981291, 1, 0.4666667, 0, 1,
-1.393553, 0.1462576, -2.542538, 1, 0.4745098, 0, 1,
-1.379416, 0.03333654, -1.232423, 1, 0.4784314, 0, 1,
-1.359123, -1.071653, -2.658481, 1, 0.4862745, 0, 1,
-1.34339, -0.5005506, -2.132516, 1, 0.4901961, 0, 1,
-1.338665, 1.540629, -1.768488, 1, 0.4980392, 0, 1,
-1.332535, -0.8114073, -2.042361, 1, 0.5058824, 0, 1,
-1.328332, 0.765851, -0.1240897, 1, 0.509804, 0, 1,
-1.324094, 0.4240441, -2.367471, 1, 0.5176471, 0, 1,
-1.322613, 1.464696, -0.003916253, 1, 0.5215687, 0, 1,
-1.317306, -2.061537, -3.525899, 1, 0.5294118, 0, 1,
-1.29993, -1.040067, -0.8600492, 1, 0.5333334, 0, 1,
-1.298761, -0.1398368, -0.8470626, 1, 0.5411765, 0, 1,
-1.298193, 1.23106, -0.6585737, 1, 0.5450981, 0, 1,
-1.297518, 0.3392849, -1.05877, 1, 0.5529412, 0, 1,
-1.296948, 0.4580622, -0.7892406, 1, 0.5568628, 0, 1,
-1.281057, -0.4910674, -0.6586664, 1, 0.5647059, 0, 1,
-1.279868, -0.3053221, -1.934086, 1, 0.5686275, 0, 1,
-1.273786, 0.1783609, -2.397095, 1, 0.5764706, 0, 1,
-1.270099, -0.5527698, -2.064435, 1, 0.5803922, 0, 1,
-1.266905, -0.1366281, -2.006569, 1, 0.5882353, 0, 1,
-1.263219, -0.3578357, -2.273319, 1, 0.5921569, 0, 1,
-1.254362, 1.32249, -1.171295, 1, 0.6, 0, 1,
-1.254002, -0.8727871, -3.020381, 1, 0.6078432, 0, 1,
-1.244309, 0.717868, 0.3551126, 1, 0.6117647, 0, 1,
-1.235859, -1.608451, -2.069981, 1, 0.6196079, 0, 1,
-1.233003, 0.003938766, -2.816174, 1, 0.6235294, 0, 1,
-1.229407, -0.8655128, -3.644513, 1, 0.6313726, 0, 1,
-1.224037, 0.6442843, -2.896952, 1, 0.6352941, 0, 1,
-1.219253, 0.225711, -0.1949349, 1, 0.6431373, 0, 1,
-1.216845, 0.3377248, -2.31093, 1, 0.6470588, 0, 1,
-1.216149, 2.63297, 0.4152795, 1, 0.654902, 0, 1,
-1.214226, -0.3172744, -2.094857, 1, 0.6588235, 0, 1,
-1.21163, -0.209503, -1.729093, 1, 0.6666667, 0, 1,
-1.196069, 0.3674225, -1.5482, 1, 0.6705883, 0, 1,
-1.189453, 0.5146565, -0.8293519, 1, 0.6784314, 0, 1,
-1.188019, 1.358688, -1.1915, 1, 0.682353, 0, 1,
-1.185879, 1.739007, 0.4699072, 1, 0.6901961, 0, 1,
-1.162387, 0.9650307, -1.671851, 1, 0.6941177, 0, 1,
-1.159558, -0.5262882, -1.318638, 1, 0.7019608, 0, 1,
-1.158151, -0.2857421, -2.574042, 1, 0.7098039, 0, 1,
-1.15452, -0.6143082, -1.42767, 1, 0.7137255, 0, 1,
-1.15247, 0.5533866, -1.708417, 1, 0.7215686, 0, 1,
-1.145937, -2.008919, -3.130787, 1, 0.7254902, 0, 1,
-1.13711, 1.502604, -0.5333855, 1, 0.7333333, 0, 1,
-1.13383, -1.273043, -1.988058, 1, 0.7372549, 0, 1,
-1.111751, -0.1729788, -0.6649407, 1, 0.7450981, 0, 1,
-1.11113, 0.7795087, -1.883397, 1, 0.7490196, 0, 1,
-1.105154, -0.1131584, -2.627084, 1, 0.7568628, 0, 1,
-1.104191, 0.6807771, -0.350374, 1, 0.7607843, 0, 1,
-1.10202, 0.2204711, -2.173556, 1, 0.7686275, 0, 1,
-1.099011, -1.002325, -3.3421, 1, 0.772549, 0, 1,
-1.092975, -0.6798121, -2.193607, 1, 0.7803922, 0, 1,
-1.091913, -0.4324561, -2.402591, 1, 0.7843137, 0, 1,
-1.090456, -0.8336639, -2.205649, 1, 0.7921569, 0, 1,
-1.087733, -1.200299, -1.819323, 1, 0.7960784, 0, 1,
-1.07758, 0.1433822, -0.5466276, 1, 0.8039216, 0, 1,
-1.074244, 0.7188984, -1.000942, 1, 0.8117647, 0, 1,
-1.072004, 0.7397832, -0.993791, 1, 0.8156863, 0, 1,
-1.058103, 0.5406498, -0.1880848, 1, 0.8235294, 0, 1,
-1.054951, -2.084182, -1.83054, 1, 0.827451, 0, 1,
-1.053157, -1.479627, -4.004343, 1, 0.8352941, 0, 1,
-1.05222, 1.221166, -1.754443, 1, 0.8392157, 0, 1,
-1.048866, 0.5593601, -1.062431, 1, 0.8470588, 0, 1,
-1.044684, -2.294482, -4.062615, 1, 0.8509804, 0, 1,
-1.036654, 0.5377374, -2.021791, 1, 0.8588235, 0, 1,
-1.035425, -0.1378849, -2.043413, 1, 0.8627451, 0, 1,
-1.034889, 1.351843, -1.903378, 1, 0.8705882, 0, 1,
-1.031181, -1.009563, -1.911836, 1, 0.8745098, 0, 1,
-1.031008, 0.005313776, -3.093966, 1, 0.8823529, 0, 1,
-1.030966, -0.6825211, -2.608457, 1, 0.8862745, 0, 1,
-1.030033, -0.5671968, -0.9618874, 1, 0.8941177, 0, 1,
-1.028202, -0.4829548, -2.727988, 1, 0.8980392, 0, 1,
-1.022171, -1.119531, -3.030295, 1, 0.9058824, 0, 1,
-1.007386, -0.5204994, -2.361162, 1, 0.9137255, 0, 1,
-1.003535, 1.277285, 0.223126, 1, 0.9176471, 0, 1,
-1.00115, -1.241926, -4.0445, 1, 0.9254902, 0, 1,
-0.9996916, 0.6948832, -1.184392, 1, 0.9294118, 0, 1,
-0.9856673, 0.1943776, -1.15488, 1, 0.9372549, 0, 1,
-0.9841294, -0.1304253, -0.5419682, 1, 0.9411765, 0, 1,
-0.9808146, -0.04126995, 0.7553988, 1, 0.9490196, 0, 1,
-0.9712155, -1.267241, -3.465036, 1, 0.9529412, 0, 1,
-0.9545201, 0.7980147, -0.7232459, 1, 0.9607843, 0, 1,
-0.9528435, 0.8656889, 0.432218, 1, 0.9647059, 0, 1,
-0.9527861, -0.3527763, -2.69448, 1, 0.972549, 0, 1,
-0.9496005, 0.616776, -2.262805, 1, 0.9764706, 0, 1,
-0.9489117, 0.1384336, -0.176087, 1, 0.9843137, 0, 1,
-0.9366716, -0.9756651, -1.583393, 1, 0.9882353, 0, 1,
-0.9356732, -1.825454, -1.744745, 1, 0.9960784, 0, 1,
-0.9244805, -0.3747413, -1.587269, 0.9960784, 1, 0, 1,
-0.9190155, -0.6197289, -3.143171, 0.9921569, 1, 0, 1,
-0.9140146, -0.9084657, -2.840232, 0.9843137, 1, 0, 1,
-0.9126692, -0.6994588, -2.480182, 0.9803922, 1, 0, 1,
-0.9119676, -0.3194763, -0.8105342, 0.972549, 1, 0, 1,
-0.9099572, 0.8764879, -0.3824653, 0.9686275, 1, 0, 1,
-0.9073636, -0.4559019, -2.370692, 0.9607843, 1, 0, 1,
-0.9034148, -1.26853, -2.825579, 0.9568627, 1, 0, 1,
-0.9023712, -0.4857312, -2.078663, 0.9490196, 1, 0, 1,
-0.901964, 1.776352, -0.5280253, 0.945098, 1, 0, 1,
-0.9009496, 2.520763, 1.371491, 0.9372549, 1, 0, 1,
-0.8919721, -0.01246158, -0.325522, 0.9333333, 1, 0, 1,
-0.8895286, -0.1323408, -1.2254, 0.9254902, 1, 0, 1,
-0.8892656, 0.1629245, -1.924047, 0.9215686, 1, 0, 1,
-0.8805759, 0.6399238, -0.6322253, 0.9137255, 1, 0, 1,
-0.8798966, -0.1870417, -0.7566394, 0.9098039, 1, 0, 1,
-0.8742016, -1.036117, -1.72742, 0.9019608, 1, 0, 1,
-0.8645011, -2.187013, -3.136639, 0.8941177, 1, 0, 1,
-0.8644311, 1.527902, -0.8951594, 0.8901961, 1, 0, 1,
-0.8535976, -0.5209442, -2.498398, 0.8823529, 1, 0, 1,
-0.8519641, 0.3290949, -1.855418, 0.8784314, 1, 0, 1,
-0.8511688, 1.415617, -1.193484, 0.8705882, 1, 0, 1,
-0.8502091, 0.9220749, 0.3282175, 0.8666667, 1, 0, 1,
-0.8465644, -0.3754815, -2.891606, 0.8588235, 1, 0, 1,
-0.8406262, 0.1952195, -0.3259102, 0.854902, 1, 0, 1,
-0.8342543, -0.909018, -3.448464, 0.8470588, 1, 0, 1,
-0.8290666, 0.4218538, -1.353697, 0.8431373, 1, 0, 1,
-0.8273985, 0.01445321, -0.6972688, 0.8352941, 1, 0, 1,
-0.8272634, -0.8663835, -1.225385, 0.8313726, 1, 0, 1,
-0.807037, 0.6577194, -0.4802552, 0.8235294, 1, 0, 1,
-0.8028492, 0.9384395, -1.107938, 0.8196079, 1, 0, 1,
-0.7961957, -0.63968, -1.057461, 0.8117647, 1, 0, 1,
-0.7860505, -0.7000738, -2.504951, 0.8078431, 1, 0, 1,
-0.7854084, 0.1324845, -0.7984623, 0.8, 1, 0, 1,
-0.7844267, -1.662909, -4.027925, 0.7921569, 1, 0, 1,
-0.7837785, 0.4743395, -1.990608, 0.7882353, 1, 0, 1,
-0.7827511, -0.1430826, -2.443064, 0.7803922, 1, 0, 1,
-0.7813376, 0.957474, -1.398525, 0.7764706, 1, 0, 1,
-0.7784645, 0.8708308, 0.380087, 0.7686275, 1, 0, 1,
-0.7778695, -0.2638999, -2.445144, 0.7647059, 1, 0, 1,
-0.7677836, -0.2133173, -1.807224, 0.7568628, 1, 0, 1,
-0.7649775, 0.8781779, -0.5780616, 0.7529412, 1, 0, 1,
-0.7619196, 0.4085062, -1.905173, 0.7450981, 1, 0, 1,
-0.7617761, 1.103372, -0.9829843, 0.7411765, 1, 0, 1,
-0.7615916, 0.5160214, -0.3599457, 0.7333333, 1, 0, 1,
-0.7587141, 0.5604165, -1.344839, 0.7294118, 1, 0, 1,
-0.7560527, -0.1018919, -1.851913, 0.7215686, 1, 0, 1,
-0.7535138, 0.63284, -0.6018375, 0.7176471, 1, 0, 1,
-0.7476887, -0.9292526, -2.63274, 0.7098039, 1, 0, 1,
-0.7474548, 1.394721, 0.5609809, 0.7058824, 1, 0, 1,
-0.7469105, -0.2546463, -0.3703573, 0.6980392, 1, 0, 1,
-0.7468753, -1.155831, -3.85069, 0.6901961, 1, 0, 1,
-0.742377, -0.008862659, -1.730268, 0.6862745, 1, 0, 1,
-0.7393072, 1.841945, -2.047005, 0.6784314, 1, 0, 1,
-0.7271134, -0.1280165, -1.432995, 0.6745098, 1, 0, 1,
-0.7176624, 0.1463281, -2.000755, 0.6666667, 1, 0, 1,
-0.7170306, 0.9689531, -2.421631, 0.6627451, 1, 0, 1,
-0.7144775, 0.7874506, -1.356403, 0.654902, 1, 0, 1,
-0.7093564, 1.115339, -0.4416441, 0.6509804, 1, 0, 1,
-0.7075801, 0.7348589, -0.05091531, 0.6431373, 1, 0, 1,
-0.7015017, -0.1196343, -1.550597, 0.6392157, 1, 0, 1,
-0.699871, -0.9129841, -2.50886, 0.6313726, 1, 0, 1,
-0.6981656, -1.048517, -2.639803, 0.627451, 1, 0, 1,
-0.6960712, 0.5226842, -1.429641, 0.6196079, 1, 0, 1,
-0.6918353, 0.7307587, -1.255536, 0.6156863, 1, 0, 1,
-0.691775, -0.6587245, -0.5874959, 0.6078432, 1, 0, 1,
-0.6829523, 1.402472, -0.6185105, 0.6039216, 1, 0, 1,
-0.6816906, -0.7179736, -3.176173, 0.5960785, 1, 0, 1,
-0.6804887, 3.007013, -0.6344279, 0.5882353, 1, 0, 1,
-0.6749971, -2.62645, -3.974683, 0.5843138, 1, 0, 1,
-0.6730563, 0.9301017, -0.9594744, 0.5764706, 1, 0, 1,
-0.6683551, 0.04694555, -2.639794, 0.572549, 1, 0, 1,
-0.6640302, -0.8155026, -3.593998, 0.5647059, 1, 0, 1,
-0.6606269, 0.9340783, -1.063553, 0.5607843, 1, 0, 1,
-0.6589561, -2.754306, -3.9349, 0.5529412, 1, 0, 1,
-0.6568688, 1.434693, -0.6225569, 0.5490196, 1, 0, 1,
-0.646068, 0.7641619, -1.281914, 0.5411765, 1, 0, 1,
-0.6415188, -1.450559, -1.709429, 0.5372549, 1, 0, 1,
-0.6391023, 0.924158, -0.1306194, 0.5294118, 1, 0, 1,
-0.626611, 0.3659428, -0.8468887, 0.5254902, 1, 0, 1,
-0.6262649, -0.1209437, -2.637159, 0.5176471, 1, 0, 1,
-0.6260366, -1.466534, -4.232199, 0.5137255, 1, 0, 1,
-0.6257261, 1.673523, 0.4932411, 0.5058824, 1, 0, 1,
-0.620416, 0.4791903, -0.1998589, 0.5019608, 1, 0, 1,
-0.6179484, 1.44965, -1.245909, 0.4941176, 1, 0, 1,
-0.6175956, 0.4854425, 1.014672, 0.4862745, 1, 0, 1,
-0.6173736, -0.9116495, -0.1073592, 0.4823529, 1, 0, 1,
-0.6137897, -1.035106, -3.093689, 0.4745098, 1, 0, 1,
-0.6101534, -0.1326777, -2.075327, 0.4705882, 1, 0, 1,
-0.6096516, -0.4911506, -1.237664, 0.4627451, 1, 0, 1,
-0.609555, 0.8999708, -2.740591, 0.4588235, 1, 0, 1,
-0.607285, 1.189734, -0.6443496, 0.4509804, 1, 0, 1,
-0.6070308, -0.7054859, -2.151404, 0.4470588, 1, 0, 1,
-0.6069423, -0.1142186, -1.996804, 0.4392157, 1, 0, 1,
-0.6034894, 1.790418, 0.2120184, 0.4352941, 1, 0, 1,
-0.600342, 0.1792163, -0.8765393, 0.427451, 1, 0, 1,
-0.6000749, -0.02308359, -0.822633, 0.4235294, 1, 0, 1,
-0.596436, -0.1087024, -2.280901, 0.4156863, 1, 0, 1,
-0.5948883, -0.949644, -1.827467, 0.4117647, 1, 0, 1,
-0.5948009, -0.263483, -2.785664, 0.4039216, 1, 0, 1,
-0.5891147, 1.077886, -0.8309356, 0.3960784, 1, 0, 1,
-0.5875037, 0.05088774, -1.65078, 0.3921569, 1, 0, 1,
-0.5873494, -0.07170313, -1.120063, 0.3843137, 1, 0, 1,
-0.5873256, -0.4621728, -1.644808, 0.3803922, 1, 0, 1,
-0.5834345, -0.4751607, -3.463396, 0.372549, 1, 0, 1,
-0.5830194, 0.2761902, -0.6885881, 0.3686275, 1, 0, 1,
-0.5822437, 0.7786359, -0.7925339, 0.3607843, 1, 0, 1,
-0.57981, 0.9045706, 0.2215136, 0.3568628, 1, 0, 1,
-0.5784671, -1.46691, -2.653108, 0.3490196, 1, 0, 1,
-0.5767695, -2.38919, -2.578137, 0.345098, 1, 0, 1,
-0.5721388, -0.299274, -2.913311, 0.3372549, 1, 0, 1,
-0.5715694, -1.829363, -3.002222, 0.3333333, 1, 0, 1,
-0.5681749, -0.4293186, -3.978992, 0.3254902, 1, 0, 1,
-0.5475326, 0.08912961, -0.591324, 0.3215686, 1, 0, 1,
-0.5393002, -0.5418488, -0.3816541, 0.3137255, 1, 0, 1,
-0.5367182, -0.1034767, -1.545685, 0.3098039, 1, 0, 1,
-0.534705, -0.715495, -2.249807, 0.3019608, 1, 0, 1,
-0.5340887, 0.5418762, 0.2530997, 0.2941177, 1, 0, 1,
-0.5305982, 0.09174132, -2.166827, 0.2901961, 1, 0, 1,
-0.5283635, -0.1121487, -2.578214, 0.282353, 1, 0, 1,
-0.523948, -0.2055979, -1.645631, 0.2784314, 1, 0, 1,
-0.5222952, 0.3590652, -0.830514, 0.2705882, 1, 0, 1,
-0.5165734, -0.1401705, -3.181921, 0.2666667, 1, 0, 1,
-0.5156806, -0.977989, -2.965437, 0.2588235, 1, 0, 1,
-0.5123643, 0.9740332, -0.3669954, 0.254902, 1, 0, 1,
-0.5113028, 1.422889, -0.791721, 0.2470588, 1, 0, 1,
-0.5089864, 1.086852, -0.2168888, 0.2431373, 1, 0, 1,
-0.5046889, -0.933539, -3.437988, 0.2352941, 1, 0, 1,
-0.4998015, -1.364379, -3.959044, 0.2313726, 1, 0, 1,
-0.4860015, -0.3215385, -1.494588, 0.2235294, 1, 0, 1,
-0.4853146, -0.6477467, -1.624204, 0.2196078, 1, 0, 1,
-0.4812964, 1.730514, 0.2703724, 0.2117647, 1, 0, 1,
-0.4748806, 1.40105, -0.184985, 0.2078431, 1, 0, 1,
-0.4746975, -0.3370813, -1.927625, 0.2, 1, 0, 1,
-0.472513, 0.3258818, -0.04261505, 0.1921569, 1, 0, 1,
-0.470613, -0.6504627, -4.024865, 0.1882353, 1, 0, 1,
-0.4650082, 0.8075124, -0.05459862, 0.1803922, 1, 0, 1,
-0.4630263, 0.8769065, -0.5406798, 0.1764706, 1, 0, 1,
-0.4629831, -0.01711431, -1.353857, 0.1686275, 1, 0, 1,
-0.4619278, -1.067688, -3.822839, 0.1647059, 1, 0, 1,
-0.4596206, -0.1343217, -1.673704, 0.1568628, 1, 0, 1,
-0.4542425, 0.4039749, -2.042157, 0.1529412, 1, 0, 1,
-0.4536002, 0.4026969, -0.7345545, 0.145098, 1, 0, 1,
-0.4505581, 0.5448359, -0.4017085, 0.1411765, 1, 0, 1,
-0.4471886, 0.763006, -1.261676, 0.1333333, 1, 0, 1,
-0.4449884, -0.2483569, -2.625432, 0.1294118, 1, 0, 1,
-0.4438844, -1.64731, -3.199198, 0.1215686, 1, 0, 1,
-0.4423192, 0.2466594, -1.833405, 0.1176471, 1, 0, 1,
-0.4377156, 1.251164, -0.03330191, 0.1098039, 1, 0, 1,
-0.4367107, 2.051335, -0.6630789, 0.1058824, 1, 0, 1,
-0.434649, 2.809652, 0.3654126, 0.09803922, 1, 0, 1,
-0.419859, 1.0317, -1.624061, 0.09019608, 1, 0, 1,
-0.4175696, -1.075612, -3.876666, 0.08627451, 1, 0, 1,
-0.4155652, 1.500594, 0.09462887, 0.07843138, 1, 0, 1,
-0.4115669, -0.8520284, -2.147314, 0.07450981, 1, 0, 1,
-0.4087184, 0.7674115, 0.0652119, 0.06666667, 1, 0, 1,
-0.4049429, -1.215753, -2.758576, 0.0627451, 1, 0, 1,
-0.4039333, -0.1593879, -2.153786, 0.05490196, 1, 0, 1,
-0.4037449, -0.3047974, -1.743709, 0.05098039, 1, 0, 1,
-0.4021143, -0.945406, -2.62067, 0.04313726, 1, 0, 1,
-0.3932979, -1.708027, -3.52528, 0.03921569, 1, 0, 1,
-0.3918417, -0.4046802, -2.847136, 0.03137255, 1, 0, 1,
-0.3900708, 0.2738926, -1.706779, 0.02745098, 1, 0, 1,
-0.3849525, -0.3080918, -0.6979985, 0.01960784, 1, 0, 1,
-0.3790519, -1.011399, -2.012418, 0.01568628, 1, 0, 1,
-0.3784381, 0.9938563, -0.942658, 0.007843138, 1, 0, 1,
-0.3771918, 0.4249655, -0.9745549, 0.003921569, 1, 0, 1,
-0.3734201, 0.1576124, -0.7332504, 0, 1, 0.003921569, 1,
-0.3720242, -0.7340728, 0.1411824, 0, 1, 0.01176471, 1,
-0.371708, 0.9454436, -0.4232348, 0, 1, 0.01568628, 1,
-0.3716838, -1.518269, -3.247674, 0, 1, 0.02352941, 1,
-0.3701641, 0.727026, -1.311352, 0, 1, 0.02745098, 1,
-0.3695495, -1.820339, -2.505434, 0, 1, 0.03529412, 1,
-0.3655865, 0.826889, -1.535373, 0, 1, 0.03921569, 1,
-0.3651859, 0.7416764, -1.992041, 0, 1, 0.04705882, 1,
-0.3644811, 0.02251234, -2.073234, 0, 1, 0.05098039, 1,
-0.3619469, 0.3334141, -1.366486, 0, 1, 0.05882353, 1,
-0.361003, 1.038568, -0.4296017, 0, 1, 0.0627451, 1,
-0.3599574, 1.858138, -0.76486, 0, 1, 0.07058824, 1,
-0.3593975, -0.1316596, 0.07429358, 0, 1, 0.07450981, 1,
-0.3572423, -1.211928, -2.704039, 0, 1, 0.08235294, 1,
-0.3532992, -1.330083, -4.718902, 0, 1, 0.08627451, 1,
-0.352381, 0.8466187, 2.192178, 0, 1, 0.09411765, 1,
-0.3450721, 2.56816, 0.07082124, 0, 1, 0.1019608, 1,
-0.3436938, 1.032337, -0.103232, 0, 1, 0.1058824, 1,
-0.3418342, -0.04986127, -2.265418, 0, 1, 0.1137255, 1,
-0.3398297, -1.260903, -3.306447, 0, 1, 0.1176471, 1,
-0.3389843, -0.2911614, -1.493856, 0, 1, 0.1254902, 1,
-0.3337295, -0.3112673, -4.803391, 0, 1, 0.1294118, 1,
-0.3304453, 2.463633, -2.06772, 0, 1, 0.1372549, 1,
-0.3231126, -1.016765, -2.61686, 0, 1, 0.1411765, 1,
-0.3162491, -0.5804266, -0.3609157, 0, 1, 0.1490196, 1,
-0.3150589, 0.4435468, 0.7621046, 0, 1, 0.1529412, 1,
-0.312788, -0.00558913, -1.499667, 0, 1, 0.1607843, 1,
-0.3120329, 1.631777, 0.1486163, 0, 1, 0.1647059, 1,
-0.3120239, 0.0953747, -2.015748, 0, 1, 0.172549, 1,
-0.3090903, -0.961659, -2.554885, 0, 1, 0.1764706, 1,
-0.3057233, -0.1519893, -3.374628, 0, 1, 0.1843137, 1,
-0.2968442, 1.350906, 0.6693064, 0, 1, 0.1882353, 1,
-0.2959889, 0.772792, -1.748398, 0, 1, 0.1960784, 1,
-0.2950571, -1.125382, -2.610346, 0, 1, 0.2039216, 1,
-0.2923846, -1.086701, -1.158916, 0, 1, 0.2078431, 1,
-0.2892235, 1.412451, 0.1227162, 0, 1, 0.2156863, 1,
-0.2869312, -0.5994953, -1.544863, 0, 1, 0.2196078, 1,
-0.2849303, 1.245514, -0.7945209, 0, 1, 0.227451, 1,
-0.2847258, -0.1573147, -1.670671, 0, 1, 0.2313726, 1,
-0.2827034, -1.161477, -3.412246, 0, 1, 0.2392157, 1,
-0.2788774, -0.8665755, -3.343681, 0, 1, 0.2431373, 1,
-0.2752734, 0.4865648, -1.657223, 0, 1, 0.2509804, 1,
-0.2683084, 1.315919, -0.9159229, 0, 1, 0.254902, 1,
-0.2655169, 0.3838471, -0.7921627, 0, 1, 0.2627451, 1,
-0.2641236, -0.1076456, -4.68925, 0, 1, 0.2666667, 1,
-0.2632898, 0.6466116, 0.5608164, 0, 1, 0.2745098, 1,
-0.2612133, -0.3055257, -2.764585, 0, 1, 0.2784314, 1,
-0.2585806, -0.7466492, -0.7186911, 0, 1, 0.2862745, 1,
-0.254122, -0.0550579, -1.981003, 0, 1, 0.2901961, 1,
-0.2516746, 1.052226, -1.111446, 0, 1, 0.2980392, 1,
-0.2507525, 1.796189, 0.2212448, 0, 1, 0.3058824, 1,
-0.2469157, -2.126475, -1.952707, 0, 1, 0.3098039, 1,
-0.243393, -1.478879, -2.171858, 0, 1, 0.3176471, 1,
-0.242474, -0.7080471, -3.030493, 0, 1, 0.3215686, 1,
-0.2415237, -0.2641611, -4.226248, 0, 1, 0.3294118, 1,
-0.2399487, 0.3230084, -2.432462, 0, 1, 0.3333333, 1,
-0.2361155, 0.9949774, 2.696058, 0, 1, 0.3411765, 1,
-0.2360035, 0.2015239, -2.104363, 0, 1, 0.345098, 1,
-0.2354645, -0.6720884, -1.634375, 0, 1, 0.3529412, 1,
-0.2324256, -0.4693264, -2.411408, 0, 1, 0.3568628, 1,
-0.2180228, -1.631104, -3.253068, 0, 1, 0.3647059, 1,
-0.2179526, -0.3994194, -4.238218, 0, 1, 0.3686275, 1,
-0.2172765, 0.4032368, -1.15918, 0, 1, 0.3764706, 1,
-0.2170432, -1.476045, -0.8850154, 0, 1, 0.3803922, 1,
-0.2159683, -1.914542, -4.250104, 0, 1, 0.3882353, 1,
-0.205791, -0.4194359, -2.075771, 0, 1, 0.3921569, 1,
-0.2056011, -0.7092809, -2.426756, 0, 1, 0.4, 1,
-0.2052716, 1.237329, 0.03948718, 0, 1, 0.4078431, 1,
-0.2034891, -0.2719815, -1.751908, 0, 1, 0.4117647, 1,
-0.2008688, 0.2693597, 0.007897114, 0, 1, 0.4196078, 1,
-0.1989927, 1.138817, 0.4917871, 0, 1, 0.4235294, 1,
-0.19881, 0.5383469, -1.157779, 0, 1, 0.4313726, 1,
-0.196046, 0.09548263, -2.120461, 0, 1, 0.4352941, 1,
-0.1956372, 1.699941, -1.202304, 0, 1, 0.4431373, 1,
-0.1915481, -0.4271091, -2.894299, 0, 1, 0.4470588, 1,
-0.1854444, -0.6860509, -3.874937, 0, 1, 0.454902, 1,
-0.1727335, -0.7610658, -4.067453, 0, 1, 0.4588235, 1,
-0.1667622, 1.441529, -0.2959821, 0, 1, 0.4666667, 1,
-0.1644882, -1.845088, -1.562249, 0, 1, 0.4705882, 1,
-0.159181, -0.4715155, -1.11941, 0, 1, 0.4784314, 1,
-0.1582733, 0.8354686, -1.086014, 0, 1, 0.4823529, 1,
-0.1569313, 0.3070888, 0.2545856, 0, 1, 0.4901961, 1,
-0.1564149, -1.195744, -4.021527, 0, 1, 0.4941176, 1,
-0.1560568, 0.05426478, -1.033071, 0, 1, 0.5019608, 1,
-0.1547726, 0.3937545, -0.4536243, 0, 1, 0.509804, 1,
-0.154086, 0.02788578, -0.6259199, 0, 1, 0.5137255, 1,
-0.1528799, 0.7684547, 0.7923139, 0, 1, 0.5215687, 1,
-0.1519645, -0.6342349, -4.317755, 0, 1, 0.5254902, 1,
-0.1518455, 0.05580874, -3.069165, 0, 1, 0.5333334, 1,
-0.1513513, 2.696226, 0.728048, 0, 1, 0.5372549, 1,
-0.1493326, 1.714182, 0.3523933, 0, 1, 0.5450981, 1,
-0.1490973, -0.8033236, -3.586557, 0, 1, 0.5490196, 1,
-0.1441155, 0.776889, 0.6917774, 0, 1, 0.5568628, 1,
-0.1435351, 0.3565778, -0.9213257, 0, 1, 0.5607843, 1,
-0.1408291, 1.349018, 0.3911226, 0, 1, 0.5686275, 1,
-0.1358388, 1.120042, -1.580153, 0, 1, 0.572549, 1,
-0.1238585, 0.6536804, 0.1953761, 0, 1, 0.5803922, 1,
-0.1198201, -0.4669755, -2.101049, 0, 1, 0.5843138, 1,
-0.1195509, 0.8758895, 0.5125753, 0, 1, 0.5921569, 1,
-0.1136211, 0.3524514, -0.7832022, 0, 1, 0.5960785, 1,
-0.1121705, -0.4385039, -2.0872, 0, 1, 0.6039216, 1,
-0.1071858, 0.2290301, -1.215712, 0, 1, 0.6117647, 1,
-0.1070171, -1.633678, -3.476605, 0, 1, 0.6156863, 1,
-0.1037926, 0.4457805, -0.7067133, 0, 1, 0.6235294, 1,
-0.1021942, -1.564371, -1.238334, 0, 1, 0.627451, 1,
-0.09892394, -1.137646, -3.683685, 0, 1, 0.6352941, 1,
-0.09339384, -0.1577514, -2.89607, 0, 1, 0.6392157, 1,
-0.09151579, -0.1677463, -2.793914, 0, 1, 0.6470588, 1,
-0.08980728, -0.1456939, -1.410808, 0, 1, 0.6509804, 1,
-0.08782618, -0.02076719, -1.597898, 0, 1, 0.6588235, 1,
-0.08579139, 0.7876326, 0.394059, 0, 1, 0.6627451, 1,
-0.08380821, -1.893565, -2.726942, 0, 1, 0.6705883, 1,
-0.08324442, -0.08866261, -1.954896, 0, 1, 0.6745098, 1,
-0.0832109, 0.7999817, 0.5196519, 0, 1, 0.682353, 1,
-0.08311889, -0.5802161, -3.225421, 0, 1, 0.6862745, 1,
-0.08216338, -1.65072, -2.523324, 0, 1, 0.6941177, 1,
-0.0764628, -1.983219, -1.878695, 0, 1, 0.7019608, 1,
-0.07406358, 0.5340053, 0.1640355, 0, 1, 0.7058824, 1,
-0.07310899, 3.043927, -0.825541, 0, 1, 0.7137255, 1,
-0.07276709, 1.254383, 0.418565, 0, 1, 0.7176471, 1,
-0.0710736, -0.4912295, -3.383343, 0, 1, 0.7254902, 1,
-0.07059091, 0.6436593, 1.064999, 0, 1, 0.7294118, 1,
-0.06211427, -1.057574, -3.420001, 0, 1, 0.7372549, 1,
-0.05886979, -0.2054781, -2.115529, 0, 1, 0.7411765, 1,
-0.05553601, 1.347299, -0.9116743, 0, 1, 0.7490196, 1,
-0.05537136, 0.2171063, 1.332143, 0, 1, 0.7529412, 1,
-0.05477293, 2.522022, 1.991252, 0, 1, 0.7607843, 1,
-0.05441102, 1.301246, -0.6117933, 0, 1, 0.7647059, 1,
-0.05305434, -1.293117, -0.317773, 0, 1, 0.772549, 1,
-0.05294821, 0.8183468, -0.2487054, 0, 1, 0.7764706, 1,
-0.05016157, 1.223872, -0.08949852, 0, 1, 0.7843137, 1,
-0.04844127, -1.224491, -3.016267, 0, 1, 0.7882353, 1,
-0.04370243, 0.9768933, -2.638492, 0, 1, 0.7960784, 1,
-0.04336325, 0.1542721, 0.4435577, 0, 1, 0.8039216, 1,
-0.03851566, -0.4184401, -3.95508, 0, 1, 0.8078431, 1,
-0.03718878, -0.4890037, -2.293673, 0, 1, 0.8156863, 1,
-0.03661424, -1.505006, -3.994455, 0, 1, 0.8196079, 1,
-0.03432263, -0.4378626, -3.823167, 0, 1, 0.827451, 1,
-0.02916002, 1.355634, 0.1964691, 0, 1, 0.8313726, 1,
-0.02341797, 0.3552579, -0.9434232, 0, 1, 0.8392157, 1,
-0.01895416, 0.7051827, -2.461495, 0, 1, 0.8431373, 1,
-0.01674751, 0.09198516, 0.1773319, 0, 1, 0.8509804, 1,
-0.01564551, 0.06752458, -1.374024, 0, 1, 0.854902, 1,
-0.01212911, 0.00903009, -1.733018, 0, 1, 0.8627451, 1,
-0.009759921, -2.444548, -4.064585, 0, 1, 0.8666667, 1,
-0.007959095, 1.328093, -2.142701, 0, 1, 0.8745098, 1,
-0.001884755, 0.5471755, -0.08929246, 0, 1, 0.8784314, 1,
-0.001202619, -0.09065616, -2.627839, 0, 1, 0.8862745, 1,
0.004494401, 1.268036, -0.2400143, 0, 1, 0.8901961, 1,
0.005388398, 1.024659, -1.208081, 0, 1, 0.8980392, 1,
0.00632191, -0.06809756, 3.280564, 0, 1, 0.9058824, 1,
0.01123309, 0.4149995, 0.2308657, 0, 1, 0.9098039, 1,
0.01399335, 0.3712019, 1.102551, 0, 1, 0.9176471, 1,
0.01497415, 0.9462326, -0.7396005, 0, 1, 0.9215686, 1,
0.01887497, -0.6215299, 3.235353, 0, 1, 0.9294118, 1,
0.01949651, 0.8867608, 0.1666402, 0, 1, 0.9333333, 1,
0.02017841, 1.374551, -0.5432369, 0, 1, 0.9411765, 1,
0.02199196, -0.3890619, 3.515014, 0, 1, 0.945098, 1,
0.02304346, -1.843399, 3.745044, 0, 1, 0.9529412, 1,
0.02765961, -1.023267, 1.211076, 0, 1, 0.9568627, 1,
0.02868288, -1.442351, 3.231777, 0, 1, 0.9647059, 1,
0.02936256, 0.8175949, -0.1976521, 0, 1, 0.9686275, 1,
0.03733907, -0.1927505, 2.147901, 0, 1, 0.9764706, 1,
0.03998404, -0.5650799, 3.572081, 0, 1, 0.9803922, 1,
0.04171741, 1.13485, -0.2119072, 0, 1, 0.9882353, 1,
0.04511718, 1.107161, -0.07796095, 0, 1, 0.9921569, 1,
0.0505275, -2.373925, 4.265354, 0, 1, 1, 1,
0.06017939, 0.3890982, -0.2267431, 0, 0.9921569, 1, 1,
0.06128256, -0.3984993, 2.882413, 0, 0.9882353, 1, 1,
0.06293461, 0.03681938, -0.6333618, 0, 0.9803922, 1, 1,
0.06622311, -1.324805, 4.470241, 0, 0.9764706, 1, 1,
0.06666256, -0.9199587, 3.416981, 0, 0.9686275, 1, 1,
0.06666322, -0.6452838, 3.776301, 0, 0.9647059, 1, 1,
0.06780271, -1.443753, 4.533232, 0, 0.9568627, 1, 1,
0.07030804, -0.3877678, 1.904532, 0, 0.9529412, 1, 1,
0.07051259, -0.5888916, 4.561239, 0, 0.945098, 1, 1,
0.07217606, 0.37791, 0.6902478, 0, 0.9411765, 1, 1,
0.0733187, 1.252043, -0.1724187, 0, 0.9333333, 1, 1,
0.07840308, -0.8802265, 3.529873, 0, 0.9294118, 1, 1,
0.08061448, -0.817324, 2.712167, 0, 0.9215686, 1, 1,
0.0810504, 0.06501868, 0.1597323, 0, 0.9176471, 1, 1,
0.08575714, -0.3684716, 1.899101, 0, 0.9098039, 1, 1,
0.08761533, 0.2848465, -0.8791964, 0, 0.9058824, 1, 1,
0.08768361, 1.667521, 1.190259, 0, 0.8980392, 1, 1,
0.09339051, -0.760699, 3.289619, 0, 0.8901961, 1, 1,
0.09534315, -0.1158708, 2.962989, 0, 0.8862745, 1, 1,
0.09561734, 0.825963, -1.501664, 0, 0.8784314, 1, 1,
0.09710543, 0.3833395, 0.7813982, 0, 0.8745098, 1, 1,
0.1059679, -0.8502433, 1.970599, 0, 0.8666667, 1, 1,
0.1075133, -0.7423538, 3.564035, 0, 0.8627451, 1, 1,
0.1085942, 0.6313615, -0.03983701, 0, 0.854902, 1, 1,
0.1213037, 0.8986787, -0.2856663, 0, 0.8509804, 1, 1,
0.1214059, -0.8377181, 3.07801, 0, 0.8431373, 1, 1,
0.1225696, -0.0182722, 2.873972, 0, 0.8392157, 1, 1,
0.1231118, 0.8239691, -0.04771645, 0, 0.8313726, 1, 1,
0.1236472, -1.10898, 2.274192, 0, 0.827451, 1, 1,
0.1262354, -0.09900087, 2.481014, 0, 0.8196079, 1, 1,
0.1269075, -1.422617, 2.249319, 0, 0.8156863, 1, 1,
0.1303886, -2.096238, 2.142496, 0, 0.8078431, 1, 1,
0.1306389, -1.683398, 2.809305, 0, 0.8039216, 1, 1,
0.1325489, -0.008392749, 1.867314, 0, 0.7960784, 1, 1,
0.1357127, -1.406022, 3.276973, 0, 0.7882353, 1, 1,
0.1364991, -0.762279, 2.323702, 0, 0.7843137, 1, 1,
0.1400628, -1.659608, 4.116454, 0, 0.7764706, 1, 1,
0.1439636, 0.04159791, 1.2699, 0, 0.772549, 1, 1,
0.1455114, 0.09591378, 0.003102826, 0, 0.7647059, 1, 1,
0.1495539, -1.038112, 4.017567, 0, 0.7607843, 1, 1,
0.1510285, 0.3253418, -0.007538662, 0, 0.7529412, 1, 1,
0.1587397, 0.5260054, -1.934723, 0, 0.7490196, 1, 1,
0.1610712, -0.09748231, 2.877857, 0, 0.7411765, 1, 1,
0.1638853, 1.896375, 0.3735521, 0, 0.7372549, 1, 1,
0.1672737, -0.2194398, 3.780784, 0, 0.7294118, 1, 1,
0.1689654, -0.6242401, 2.982623, 0, 0.7254902, 1, 1,
0.1695172, 2.124246, 0.04302609, 0, 0.7176471, 1, 1,
0.1700494, -0.9303099, 3.919491, 0, 0.7137255, 1, 1,
0.1719473, 1.239568, -0.3781399, 0, 0.7058824, 1, 1,
0.172352, -0.4147252, 3.86865, 0, 0.6980392, 1, 1,
0.1728539, 0.7806287, 0.3920673, 0, 0.6941177, 1, 1,
0.1744896, 0.5505607, 0.2112673, 0, 0.6862745, 1, 1,
0.1768056, 0.5383304, 0.7270268, 0, 0.682353, 1, 1,
0.1782228, 1.594738, 0.9834985, 0, 0.6745098, 1, 1,
0.1798915, -0.2545386, 1.575417, 0, 0.6705883, 1, 1,
0.1849155, 1.187764, 0.4694999, 0, 0.6627451, 1, 1,
0.1872144, 0.3828391, 1.516403, 0, 0.6588235, 1, 1,
0.1937051, -1.668045, 1.367358, 0, 0.6509804, 1, 1,
0.1965514, 1.416234, 0.5275213, 0, 0.6470588, 1, 1,
0.1971978, 1.241675, -0.1145741, 0, 0.6392157, 1, 1,
0.2047138, -1.03704, 2.880016, 0, 0.6352941, 1, 1,
0.2060589, -1.113389, 3.727155, 0, 0.627451, 1, 1,
0.2097552, 0.394304, -2.139124, 0, 0.6235294, 1, 1,
0.2139328, -0.6541807, 3.040641, 0, 0.6156863, 1, 1,
0.216425, 0.1225732, 0.4134984, 0, 0.6117647, 1, 1,
0.2165885, -0.998509, 2.675105, 0, 0.6039216, 1, 1,
0.2172487, -1.898965, 3.979898, 0, 0.5960785, 1, 1,
0.2181855, -0.2802176, 2.875849, 0, 0.5921569, 1, 1,
0.2211349, -0.2800567, 1.359833, 0, 0.5843138, 1, 1,
0.2216589, 0.04005362, 1.215395, 0, 0.5803922, 1, 1,
0.2256389, 0.486729, 1.135649, 0, 0.572549, 1, 1,
0.2272461, -0.4548062, 2.273273, 0, 0.5686275, 1, 1,
0.2276051, -1.811448, 3.735688, 0, 0.5607843, 1, 1,
0.2291493, -0.879809, 3.030004, 0, 0.5568628, 1, 1,
0.2341197, -1.2615, 1.67636, 0, 0.5490196, 1, 1,
0.2344616, 0.05625692, 0.2961482, 0, 0.5450981, 1, 1,
0.2348788, 0.9865298, 0.4774499, 0, 0.5372549, 1, 1,
0.2376427, 0.4736197, 0.08989248, 0, 0.5333334, 1, 1,
0.2393128, -0.06799679, 1.865832, 0, 0.5254902, 1, 1,
0.2407377, 0.6727695, 0.01242303, 0, 0.5215687, 1, 1,
0.2420568, -0.9372564, 3.244218, 0, 0.5137255, 1, 1,
0.2423943, -0.452842, 1.449033, 0, 0.509804, 1, 1,
0.2436653, -0.2158609, 1.556769, 0, 0.5019608, 1, 1,
0.251287, -0.6755376, 3.315462, 0, 0.4941176, 1, 1,
0.2546683, -0.8142942, 1.485677, 0, 0.4901961, 1, 1,
0.2551296, -1.038454, 2.994874, 0, 0.4823529, 1, 1,
0.2594029, -0.6342639, 2.089607, 0, 0.4784314, 1, 1,
0.2605859, -0.7576657, 3.590883, 0, 0.4705882, 1, 1,
0.2622741, 0.3089682, 2.579556, 0, 0.4666667, 1, 1,
0.2668763, 0.9176915, 0.06052857, 0, 0.4588235, 1, 1,
0.2676801, 1.993743, 0.8681179, 0, 0.454902, 1, 1,
0.2712165, 0.003720779, 1.991369, 0, 0.4470588, 1, 1,
0.2734631, -1.029544, 1.683292, 0, 0.4431373, 1, 1,
0.2734877, -0.5788121, 3.345813, 0, 0.4352941, 1, 1,
0.2763968, 0.02899171, 3.016518, 0, 0.4313726, 1, 1,
0.2765976, 1.434611, 0.1593683, 0, 0.4235294, 1, 1,
0.277133, 0.6109349, 2.161587, 0, 0.4196078, 1, 1,
0.2789416, 0.7911441, 1.596738, 0, 0.4117647, 1, 1,
0.2790259, 0.3498474, 1.540525, 0, 0.4078431, 1, 1,
0.2804162, -0.08209514, -0.1280172, 0, 0.4, 1, 1,
0.280468, 2.091786, 0.4683857, 0, 0.3921569, 1, 1,
0.2831042, -1.446527, 2.473943, 0, 0.3882353, 1, 1,
0.2836463, -2.085016, 3.402162, 0, 0.3803922, 1, 1,
0.2836602, -0.6075637, 2.438073, 0, 0.3764706, 1, 1,
0.2837875, -0.6262518, 3.184968, 0, 0.3686275, 1, 1,
0.284568, 0.6406271, 0.4567269, 0, 0.3647059, 1, 1,
0.2867633, 1.672941, 0.3828227, 0, 0.3568628, 1, 1,
0.287771, -2.286363, 2.390465, 0, 0.3529412, 1, 1,
0.288453, -0.6465283, 4.698465, 0, 0.345098, 1, 1,
0.2912777, -1.676255, 4.274059, 0, 0.3411765, 1, 1,
0.2981576, 0.7935596, 1.468606, 0, 0.3333333, 1, 1,
0.3010715, -1.122447, 3.6064, 0, 0.3294118, 1, 1,
0.3083099, -0.8929754, 3.036073, 0, 0.3215686, 1, 1,
0.3155166, -0.7380124, 3.244488, 0, 0.3176471, 1, 1,
0.316742, -0.3208153, 1.864581, 0, 0.3098039, 1, 1,
0.3167546, -0.8892614, 3.943467, 0, 0.3058824, 1, 1,
0.3170117, 0.1344819, 2.195456, 0, 0.2980392, 1, 1,
0.3217837, 0.9890067, -0.5031869, 0, 0.2901961, 1, 1,
0.3226641, -1.005867, 3.632395, 0, 0.2862745, 1, 1,
0.3236407, -0.9964535, 3.21734, 0, 0.2784314, 1, 1,
0.3256814, -0.5648633, 1.62404, 0, 0.2745098, 1, 1,
0.3272845, -0.504232, 4.333087, 0, 0.2666667, 1, 1,
0.3344371, -1.078098, 2.237906, 0, 0.2627451, 1, 1,
0.337678, -0.226704, 2.164795, 0, 0.254902, 1, 1,
0.3380366, -0.3022015, 3.176762, 0, 0.2509804, 1, 1,
0.3387814, 0.2274353, 1.758447, 0, 0.2431373, 1, 1,
0.3458523, -1.238625, 3.565994, 0, 0.2392157, 1, 1,
0.3465272, 1.611216, -0.8668354, 0, 0.2313726, 1, 1,
0.3467712, 1.24164, 0.9560997, 0, 0.227451, 1, 1,
0.3503006, -0.4279844, 1.856828, 0, 0.2196078, 1, 1,
0.3511998, -0.1225849, 2.273016, 0, 0.2156863, 1, 1,
0.3513243, 1.029141, 2.318711, 0, 0.2078431, 1, 1,
0.3550579, -0.6707817, 3.403134, 0, 0.2039216, 1, 1,
0.359478, 0.5635321, 0.6858752, 0, 0.1960784, 1, 1,
0.3614133, -0.7655845, 3.313992, 0, 0.1882353, 1, 1,
0.3642659, 0.08117694, 1.543523, 0, 0.1843137, 1, 1,
0.3714699, 0.187531, 2.120291, 0, 0.1764706, 1, 1,
0.375512, 0.1209667, 0.243803, 0, 0.172549, 1, 1,
0.377601, -0.3591456, 4.063501, 0, 0.1647059, 1, 1,
0.3801191, -1.005184, 2.844662, 0, 0.1607843, 1, 1,
0.3818589, -0.7991044, 4.976377, 0, 0.1529412, 1, 1,
0.3861343, -0.9773368, 1.574014, 0, 0.1490196, 1, 1,
0.3870554, 0.9424079, -1.237532, 0, 0.1411765, 1, 1,
0.3950892, 0.2090513, -0.3191203, 0, 0.1372549, 1, 1,
0.4010163, 0.2671292, 2.41746, 0, 0.1294118, 1, 1,
0.4019689, 0.8765873, -0.7116563, 0, 0.1254902, 1, 1,
0.4078932, -0.7458054, 1.397775, 0, 0.1176471, 1, 1,
0.4090404, -1.336006, 3.109105, 0, 0.1137255, 1, 1,
0.4102798, 0.2937074, 1.859195, 0, 0.1058824, 1, 1,
0.4166553, -0.06033958, 2.39149, 0, 0.09803922, 1, 1,
0.4171019, -1.127367, 3.110716, 0, 0.09411765, 1, 1,
0.42281, -0.04684857, 1.061258, 0, 0.08627451, 1, 1,
0.4243433, 0.1804039, 1.005713, 0, 0.08235294, 1, 1,
0.4244254, -1.294341, 3.035079, 0, 0.07450981, 1, 1,
0.4245088, 0.6894205, 0.8168313, 0, 0.07058824, 1, 1,
0.4348064, -0.3818475, 1.381084, 0, 0.0627451, 1, 1,
0.4362456, -1.480734, 3.519489, 0, 0.05882353, 1, 1,
0.4407034, -0.4371757, 0.6682083, 0, 0.05098039, 1, 1,
0.4429626, 0.6661054, 1.00824, 0, 0.04705882, 1, 1,
0.4429739, -1.685309, 2.899371, 0, 0.03921569, 1, 1,
0.4452088, -0.2802476, 2.968657, 0, 0.03529412, 1, 1,
0.4547419, -1.130746, 3.913189, 0, 0.02745098, 1, 1,
0.4590957, -0.1374642, 0.7262837, 0, 0.02352941, 1, 1,
0.4647228, -0.9635342, 3.433738, 0, 0.01568628, 1, 1,
0.4679334, -1.402561, 4.55823, 0, 0.01176471, 1, 1,
0.470768, -0.6673056, 0.9242569, 0, 0.003921569, 1, 1,
0.4742725, 1.062767, -0.4772192, 0.003921569, 0, 1, 1,
0.4764424, 0.2354857, 1.826741, 0.007843138, 0, 1, 1,
0.476604, -1.602742, 2.541889, 0.01568628, 0, 1, 1,
0.4810309, 0.5492787, -0.5165557, 0.01960784, 0, 1, 1,
0.483796, -0.5171376, 2.086743, 0.02745098, 0, 1, 1,
0.4878053, 0.4322754, 0.8793885, 0.03137255, 0, 1, 1,
0.4945816, -1.100317, 1.637753, 0.03921569, 0, 1, 1,
0.4988406, -0.7459753, 3.700132, 0.04313726, 0, 1, 1,
0.4997821, -0.3502106, 2.231395, 0.05098039, 0, 1, 1,
0.5057397, 0.05398564, 2.257371, 0.05490196, 0, 1, 1,
0.5076984, -0.03643272, 1.688854, 0.0627451, 0, 1, 1,
0.5098845, 2.261058, 0.2591849, 0.06666667, 0, 1, 1,
0.5118675, 2.746912, -0.5647191, 0.07450981, 0, 1, 1,
0.5159463, 0.4535227, 1.246795, 0.07843138, 0, 1, 1,
0.5210478, 1.327824, 1.105918, 0.08627451, 0, 1, 1,
0.5217007, -1.702701, 3.743017, 0.09019608, 0, 1, 1,
0.5265021, 0.07937082, 0.5329235, 0.09803922, 0, 1, 1,
0.5269234, -0.5187435, 4.146962, 0.1058824, 0, 1, 1,
0.527692, -0.622747, 3.232415, 0.1098039, 0, 1, 1,
0.5345033, -0.3717544, 0.7151821, 0.1176471, 0, 1, 1,
0.5367234, -0.2701684, 2.23158, 0.1215686, 0, 1, 1,
0.5378948, -0.2208018, 2.352094, 0.1294118, 0, 1, 1,
0.5411555, -0.5037614, 4.412393, 0.1333333, 0, 1, 1,
0.5412278, -1.261711, 0.8915826, 0.1411765, 0, 1, 1,
0.5439041, -0.5754946, 1.968107, 0.145098, 0, 1, 1,
0.5440004, 0.6189435, 1.536879, 0.1529412, 0, 1, 1,
0.5537978, 0.172872, 1.057992, 0.1568628, 0, 1, 1,
0.5578883, -1.834154, 5.207647, 0.1647059, 0, 1, 1,
0.5597209, 0.4313847, 1.205748, 0.1686275, 0, 1, 1,
0.5608261, -0.8914106, 2.686197, 0.1764706, 0, 1, 1,
0.56186, 0.6276057, 1.057693, 0.1803922, 0, 1, 1,
0.5655938, 0.9064004, -1.303778, 0.1882353, 0, 1, 1,
0.5677664, -0.3769388, 1.404805, 0.1921569, 0, 1, 1,
0.5708832, 0.5256251, 2.04284, 0.2, 0, 1, 1,
0.5752231, -1.477354, 2.64452, 0.2078431, 0, 1, 1,
0.5764714, 0.8394852, 0.8126764, 0.2117647, 0, 1, 1,
0.5783046, 0.4749165, -0.1078292, 0.2196078, 0, 1, 1,
0.579888, 1.429467, 1.993378, 0.2235294, 0, 1, 1,
0.582306, -0.005618803, 1.505223, 0.2313726, 0, 1, 1,
0.5851572, 0.2611854, 2.433819, 0.2352941, 0, 1, 1,
0.5886624, -1.254951, 2.598154, 0.2431373, 0, 1, 1,
0.5945151, -1.905737, 3.301653, 0.2470588, 0, 1, 1,
0.5961065, -0.414443, 1.736334, 0.254902, 0, 1, 1,
0.5978111, -0.09314493, 1.04811, 0.2588235, 0, 1, 1,
0.6023367, 0.8555474, -0.3431019, 0.2666667, 0, 1, 1,
0.6033015, -1.064643, 2.133241, 0.2705882, 0, 1, 1,
0.610536, 0.1229473, 2.034842, 0.2784314, 0, 1, 1,
0.6139913, -0.3436283, 1.970806, 0.282353, 0, 1, 1,
0.6297707, -0.02646821, 2.749148, 0.2901961, 0, 1, 1,
0.6416661, -0.450612, 2.463637, 0.2941177, 0, 1, 1,
0.6636752, -0.5421679, 2.500854, 0.3019608, 0, 1, 1,
0.664615, 0.0330174, 0.9181774, 0.3098039, 0, 1, 1,
0.6696514, -0.0542364, 2.723941, 0.3137255, 0, 1, 1,
0.6700213, 0.3417464, 0.389122, 0.3215686, 0, 1, 1,
0.6709524, -0.56774, 1.48519, 0.3254902, 0, 1, 1,
0.6796189, -0.01659564, -0.04318292, 0.3333333, 0, 1, 1,
0.6876068, 2.001913, 0.8368762, 0.3372549, 0, 1, 1,
0.6946917, -0.1584328, 3.256897, 0.345098, 0, 1, 1,
0.7011915, -0.7680776, 3.670088, 0.3490196, 0, 1, 1,
0.7017915, 0.0646587, 0.9219035, 0.3568628, 0, 1, 1,
0.702703, 0.4583507, 0.6913829, 0.3607843, 0, 1, 1,
0.7137634, 1.125439, 1.543315, 0.3686275, 0, 1, 1,
0.7137854, -0.005875155, 1.636959, 0.372549, 0, 1, 1,
0.7173184, -0.5167195, 2.648015, 0.3803922, 0, 1, 1,
0.7191413, 2.248885, 0.9928185, 0.3843137, 0, 1, 1,
0.7192115, -0.9805502, 0.9378022, 0.3921569, 0, 1, 1,
0.7203677, 0.1288873, 1.35387, 0.3960784, 0, 1, 1,
0.7242519, -0.7781206, 1.350691, 0.4039216, 0, 1, 1,
0.7256843, -0.7007184, 2.426052, 0.4117647, 0, 1, 1,
0.7315739, -0.4838494, 2.768399, 0.4156863, 0, 1, 1,
0.7317418, -1.919299, 2.076183, 0.4235294, 0, 1, 1,
0.7331449, 0.1830165, 1.496543, 0.427451, 0, 1, 1,
0.7367071, 1.828101, 0.1474452, 0.4352941, 0, 1, 1,
0.7404729, -0.7356286, 1.781712, 0.4392157, 0, 1, 1,
0.7410844, 0.7020121, 1.532969, 0.4470588, 0, 1, 1,
0.7412274, -0.2813007, 2.042689, 0.4509804, 0, 1, 1,
0.7428439, 0.1941333, -0.2567858, 0.4588235, 0, 1, 1,
0.7459318, 0.4707411, 0.01551766, 0.4627451, 0, 1, 1,
0.7472513, -0.4020598, 0.979381, 0.4705882, 0, 1, 1,
0.7477401, 0.2936192, 1.627558, 0.4745098, 0, 1, 1,
0.748528, -0.9039048, 2.653065, 0.4823529, 0, 1, 1,
0.7492003, -0.7723765, 0.7948717, 0.4862745, 0, 1, 1,
0.7518214, 0.3764836, 0.02158694, 0.4941176, 0, 1, 1,
0.7529373, 0.3238752, 1.963267, 0.5019608, 0, 1, 1,
0.7542654, 0.36673, 1.667148, 0.5058824, 0, 1, 1,
0.7573951, -0.322324, 1.767108, 0.5137255, 0, 1, 1,
0.7687422, 0.5088241, 1.403332, 0.5176471, 0, 1, 1,
0.7772642, 0.1290023, 1.386139, 0.5254902, 0, 1, 1,
0.7802715, 0.09548485, 2.34421, 0.5294118, 0, 1, 1,
0.7843033, 0.2765788, 1.386568, 0.5372549, 0, 1, 1,
0.7868751, 0.03187909, 3.512324, 0.5411765, 0, 1, 1,
0.7880048, -1.005579, 1.858701, 0.5490196, 0, 1, 1,
0.7882907, 1.366692, -0.08194549, 0.5529412, 0, 1, 1,
0.7922924, -0.8085675, 1.031999, 0.5607843, 0, 1, 1,
0.7938874, -0.294304, 2.002668, 0.5647059, 0, 1, 1,
0.7992659, 2.668688, -0.2807981, 0.572549, 0, 1, 1,
0.8073753, -2.526352, 0.7332449, 0.5764706, 0, 1, 1,
0.8074838, -0.709159, 3.605896, 0.5843138, 0, 1, 1,
0.8088008, 0.8556448, -0.4126965, 0.5882353, 0, 1, 1,
0.8107463, 2.123945, 1.437067, 0.5960785, 0, 1, 1,
0.8115172, 0.1055173, -0.3557382, 0.6039216, 0, 1, 1,
0.8130118, -0.390077, 1.638018, 0.6078432, 0, 1, 1,
0.8173929, -0.2840042, 1.252623, 0.6156863, 0, 1, 1,
0.8219174, -1.486978, 1.620392, 0.6196079, 0, 1, 1,
0.8227243, -0.7208888, 3.441626, 0.627451, 0, 1, 1,
0.8243852, 0.8697028, 0.101056, 0.6313726, 0, 1, 1,
0.8278283, -0.455588, 2.028659, 0.6392157, 0, 1, 1,
0.8279073, -0.4294021, 1.452261, 0.6431373, 0, 1, 1,
0.8346862, 2.101445, 0.4704971, 0.6509804, 0, 1, 1,
0.8447556, 0.03682033, 2.346283, 0.654902, 0, 1, 1,
0.8502454, 0.2920798, 1.367672, 0.6627451, 0, 1, 1,
0.8557564, -0.3319594, 1.176994, 0.6666667, 0, 1, 1,
0.8567463, 0.8944537, -0.3412596, 0.6745098, 0, 1, 1,
0.8568181, -0.6629652, 2.151494, 0.6784314, 0, 1, 1,
0.8573974, 1.634381, -0.02745849, 0.6862745, 0, 1, 1,
0.8621356, 0.8200203, 1.357688, 0.6901961, 0, 1, 1,
0.8642412, -0.974309, -0.1412667, 0.6980392, 0, 1, 1,
0.8657711, -0.1873978, 2.081281, 0.7058824, 0, 1, 1,
0.8685865, -0.5292898, 3.123313, 0.7098039, 0, 1, 1,
0.8712238, 0.381779, 1.239658, 0.7176471, 0, 1, 1,
0.8714783, -2.140487, 3.026435, 0.7215686, 0, 1, 1,
0.8739818, -0.4406479, 1.690308, 0.7294118, 0, 1, 1,
0.8762422, 0.1331784, 1.003607, 0.7333333, 0, 1, 1,
0.8789076, -0.26696, 1.862754, 0.7411765, 0, 1, 1,
0.8831227, 2.928041, 1.18099, 0.7450981, 0, 1, 1,
0.8891606, 1.05602, 1.59994, 0.7529412, 0, 1, 1,
0.890942, 0.4614863, 1.478459, 0.7568628, 0, 1, 1,
0.8939965, -1.488367, 2.583903, 0.7647059, 0, 1, 1,
0.8973439, -0.8439793, 1.993157, 0.7686275, 0, 1, 1,
0.8986346, -0.2608101, 3.014637, 0.7764706, 0, 1, 1,
0.9077961, 0.7269461, 1.691279, 0.7803922, 0, 1, 1,
0.910251, -0.8968148, 1.982152, 0.7882353, 0, 1, 1,
0.9175819, -1.520936, 2.292072, 0.7921569, 0, 1, 1,
0.9224421, 0.4105533, -0.7161757, 0.8, 0, 1, 1,
0.9294746, -1.36724, 3.760751, 0.8078431, 0, 1, 1,
0.9322695, -0.4310687, 2.995078, 0.8117647, 0, 1, 1,
0.9374257, -0.521547, 1.717117, 0.8196079, 0, 1, 1,
0.9404981, -0.08955169, 1.088332, 0.8235294, 0, 1, 1,
0.9432706, 0.1902985, 3.157287, 0.8313726, 0, 1, 1,
0.9546986, -0.4342779, 1.070427, 0.8352941, 0, 1, 1,
0.9578499, -0.8229762, 2.253057, 0.8431373, 0, 1, 1,
0.9587078, 0.2016669, -0.8811682, 0.8470588, 0, 1, 1,
0.9600484, 1.769793, 2.384541, 0.854902, 0, 1, 1,
0.9603059, -1.404953, 1.797478, 0.8588235, 0, 1, 1,
0.9614065, -0.2949651, 1.50363, 0.8666667, 0, 1, 1,
0.9675693, 1.140748, 0.5420167, 0.8705882, 0, 1, 1,
0.9697056, 1.491815, 1.040658, 0.8784314, 0, 1, 1,
0.9705076, 1.35483, 1.794488, 0.8823529, 0, 1, 1,
0.9762549, -0.5311483, 0.6419436, 0.8901961, 0, 1, 1,
0.9847375, 0.3657863, 1.213924, 0.8941177, 0, 1, 1,
0.9847708, 0.7782078, 1.361453, 0.9019608, 0, 1, 1,
0.9859634, -0.3127148, 2.513375, 0.9098039, 0, 1, 1,
0.9889147, -0.7381918, 1.986312, 0.9137255, 0, 1, 1,
0.9940109, -1.899739, 4.658945, 0.9215686, 0, 1, 1,
0.9951258, 1.314546, -0.8204412, 0.9254902, 0, 1, 1,
0.9971131, -1.461272, 1.788502, 0.9333333, 0, 1, 1,
1.002076, 1.245789, 1.952204, 0.9372549, 0, 1, 1,
1.007794, 0.1554608, 1.923719, 0.945098, 0, 1, 1,
1.008569, 0.1580805, 3.375899, 0.9490196, 0, 1, 1,
1.011563, 0.678982, 0.2104151, 0.9568627, 0, 1, 1,
1.011795, 0.7621915, 2.196678, 0.9607843, 0, 1, 1,
1.013012, -1.350456, 4.178752, 0.9686275, 0, 1, 1,
1.019917, 0.6677341, 1.299059, 0.972549, 0, 1, 1,
1.020413, -0.2314096, 2.104355, 0.9803922, 0, 1, 1,
1.022457, 1.73094, 2.892327, 0.9843137, 0, 1, 1,
1.022522, -0.9044105, 2.07866, 0.9921569, 0, 1, 1,
1.028303, 1.001984, 0.7509708, 0.9960784, 0, 1, 1,
1.029567, -1.574406, 3.087727, 1, 0, 0.9960784, 1,
1.029744, 0.7220427, 0.8531569, 1, 0, 0.9882353, 1,
1.031445, -1.308116, 2.967982, 1, 0, 0.9843137, 1,
1.032217, 0.2883456, 1.840709, 1, 0, 0.9764706, 1,
1.033659, 1.391513, -1.058737, 1, 0, 0.972549, 1,
1.034539, -0.5610746, 2.417836, 1, 0, 0.9647059, 1,
1.03741, -1.267079, 3.991087, 1, 0, 0.9607843, 1,
1.042744, -0.8597711, 1.324074, 1, 0, 0.9529412, 1,
1.047845, -0.3445053, -0.03793278, 1, 0, 0.9490196, 1,
1.048293, 0.3250342, 0.9465137, 1, 0, 0.9411765, 1,
1.052121, 0.7451394, 2.565459, 1, 0, 0.9372549, 1,
1.053674, -0.2463899, 0.8081505, 1, 0, 0.9294118, 1,
1.058611, 2.027645, -1.512945, 1, 0, 0.9254902, 1,
1.06365, -1.107846, 2.743978, 1, 0, 0.9176471, 1,
1.07054, 1.18678, -0.1417352, 1, 0, 0.9137255, 1,
1.072947, 1.844963, 0.5072492, 1, 0, 0.9058824, 1,
1.073076, 1.454717, 1.123404, 1, 0, 0.9019608, 1,
1.080424, -2.249722, 2.191813, 1, 0, 0.8941177, 1,
1.081724, 1.279173, 0.8143842, 1, 0, 0.8862745, 1,
1.081879, 0.65333, 0.4363391, 1, 0, 0.8823529, 1,
1.082007, -0.6604528, 1.697191, 1, 0, 0.8745098, 1,
1.083688, -1.845649, 2.953624, 1, 0, 0.8705882, 1,
1.08687, 0.303403, 1.475496, 1, 0, 0.8627451, 1,
1.091823, -0.914955, 1.867398, 1, 0, 0.8588235, 1,
1.094713, 0.9068986, 0.3601253, 1, 0, 0.8509804, 1,
1.098469, -0.7798671, 2.819777, 1, 0, 0.8470588, 1,
1.099933, -0.7940567, 3.316624, 1, 0, 0.8392157, 1,
1.100838, -0.4662814, 1.858792, 1, 0, 0.8352941, 1,
1.103761, -0.5758733, 1.134427, 1, 0, 0.827451, 1,
1.115695, -0.9176726, 1.687758, 1, 0, 0.8235294, 1,
1.121732, 1.687112, 3.241742, 1, 0, 0.8156863, 1,
1.122526, -0.3401247, 1.393835, 1, 0, 0.8117647, 1,
1.127439, -0.8725341, 2.23875, 1, 0, 0.8039216, 1,
1.135908, -1.065541, 0.6337595, 1, 0, 0.7960784, 1,
1.136195, -0.4069558, 2.682165, 1, 0, 0.7921569, 1,
1.140062, 0.7997783, 0.215317, 1, 0, 0.7843137, 1,
1.1404, -2.692568, 0.6908064, 1, 0, 0.7803922, 1,
1.140833, -1.181165, -0.1670865, 1, 0, 0.772549, 1,
1.14828, 0.1767579, 2.054246, 1, 0, 0.7686275, 1,
1.14988, -1.205377, 2.877761, 1, 0, 0.7607843, 1,
1.152289, 1.104158, 0.3841727, 1, 0, 0.7568628, 1,
1.154884, -0.3188974, 3.974076, 1, 0, 0.7490196, 1,
1.156357, -0.07573094, 2.02492, 1, 0, 0.7450981, 1,
1.1592, -0.3111883, 1.680376, 1, 0, 0.7372549, 1,
1.177315, -1.018152, 1.415475, 1, 0, 0.7333333, 1,
1.178913, -0.8303949, 1.780995, 1, 0, 0.7254902, 1,
1.187804, -0.7212039, 2.831317, 1, 0, 0.7215686, 1,
1.189876, 0.6712794, 0.1588395, 1, 0, 0.7137255, 1,
1.194636, 2.190112, -0.9456786, 1, 0, 0.7098039, 1,
1.197405, -0.07018652, 0.4096238, 1, 0, 0.7019608, 1,
1.199645, -0.01669922, 2.652463, 1, 0, 0.6941177, 1,
1.206629, 0.9835353, 0.6946045, 1, 0, 0.6901961, 1,
1.211291, 0.423715, 1.418404, 1, 0, 0.682353, 1,
1.213029, -0.9020848, 3.088074, 1, 0, 0.6784314, 1,
1.213703, 0.9725811, 0.1390551, 1, 0, 0.6705883, 1,
1.232857, 0.1993041, 1.135669, 1, 0, 0.6666667, 1,
1.232921, -0.5577881, 0.432598, 1, 0, 0.6588235, 1,
1.233856, -0.167018, 1.936705, 1, 0, 0.654902, 1,
1.243001, -0.2199054, 1.148195, 1, 0, 0.6470588, 1,
1.252437, -0.1401399, 3.318988, 1, 0, 0.6431373, 1,
1.260147, -1.203605, 1.273508, 1, 0, 0.6352941, 1,
1.269939, -0.9574367, 1.496308, 1, 0, 0.6313726, 1,
1.283093, -1.059154, 2.025341, 1, 0, 0.6235294, 1,
1.285964, -0.2421493, 0.2728345, 1, 0, 0.6196079, 1,
1.287925, -0.4958233, 1.198905, 1, 0, 0.6117647, 1,
1.29196, -0.2487071, 1.304033, 1, 0, 0.6078432, 1,
1.30453, 0.1873188, 2.716292, 1, 0, 0.6, 1,
1.311701, 0.8439282, 0.7997063, 1, 0, 0.5921569, 1,
1.313749, 0.8401584, 1.150393, 1, 0, 0.5882353, 1,
1.315361, -0.04949755, 0.5488762, 1, 0, 0.5803922, 1,
1.319553, 0.06320234, 0.6750474, 1, 0, 0.5764706, 1,
1.332472, 0.2956045, 2.69528, 1, 0, 0.5686275, 1,
1.334947, 1.253519, 1.250661, 1, 0, 0.5647059, 1,
1.343978, 0.5362713, 3.009516, 1, 0, 0.5568628, 1,
1.344392, 0.20919, 1.403751, 1, 0, 0.5529412, 1,
1.355383, -1.743769, 2.000305, 1, 0, 0.5450981, 1,
1.370707, -0.0475587, 0.6933286, 1, 0, 0.5411765, 1,
1.370968, -0.7298772, 1.531741, 1, 0, 0.5333334, 1,
1.378206, -0.485018, 1.756206, 1, 0, 0.5294118, 1,
1.379934, -2.020135, 0.9792016, 1, 0, 0.5215687, 1,
1.386659, -1.853342, 3.991349, 1, 0, 0.5176471, 1,
1.38966, -1.584844, 3.216347, 1, 0, 0.509804, 1,
1.406047, 0.0919252, 2.162829, 1, 0, 0.5058824, 1,
1.410705, 0.6781882, 1.845362, 1, 0, 0.4980392, 1,
1.426811, 1.512942, 1.978929, 1, 0, 0.4901961, 1,
1.431999, 0.005641494, 3.258323, 1, 0, 0.4862745, 1,
1.434054, -1.245421, 2.81058, 1, 0, 0.4784314, 1,
1.438308, -0.1148645, 2.492681, 1, 0, 0.4745098, 1,
1.443438, -0.7211064, 2.385616, 1, 0, 0.4666667, 1,
1.454764, 0.001416775, 2.681884, 1, 0, 0.4627451, 1,
1.462076, 0.1588551, 3.070417, 1, 0, 0.454902, 1,
1.464004, 0.4357355, 1.966267, 1, 0, 0.4509804, 1,
1.465266, 0.1525306, 1.766777, 1, 0, 0.4431373, 1,
1.465873, -0.2200836, 2.033006, 1, 0, 0.4392157, 1,
1.495299, -0.6886928, 1.106887, 1, 0, 0.4313726, 1,
1.506265, -2.615053, 2.141077, 1, 0, 0.427451, 1,
1.509025, -1.255515, 2.23103, 1, 0, 0.4196078, 1,
1.510882, -0.7062699, 3.194074, 1, 0, 0.4156863, 1,
1.516617, 0.3068241, 1.319353, 1, 0, 0.4078431, 1,
1.520812, -0.4262806, 0.9406105, 1, 0, 0.4039216, 1,
1.521051, -1.349584, 0.9492881, 1, 0, 0.3960784, 1,
1.522541, -0.5089254, 2.70104, 1, 0, 0.3882353, 1,
1.523897, -0.004343015, 0.677, 1, 0, 0.3843137, 1,
1.527242, 0.6199609, 1.084012, 1, 0, 0.3764706, 1,
1.542616, 0.7197639, 1.666426, 1, 0, 0.372549, 1,
1.545992, 0.06020783, 0.9587028, 1, 0, 0.3647059, 1,
1.554374, 0.9898562, 1.502689, 1, 0, 0.3607843, 1,
1.582139, -1.187009, 3.995136, 1, 0, 0.3529412, 1,
1.622204, -1.706967, 2.195691, 1, 0, 0.3490196, 1,
1.63747, -1.475636, 3.327948, 1, 0, 0.3411765, 1,
1.683813, -0.1524303, 1.403799, 1, 0, 0.3372549, 1,
1.686558, -0.5602167, 0.6609462, 1, 0, 0.3294118, 1,
1.6933, 1.04692, 0.9899835, 1, 0, 0.3254902, 1,
1.700394, 0.2422133, 2.429228, 1, 0, 0.3176471, 1,
1.706646, -0.4455076, 1.436043, 1, 0, 0.3137255, 1,
1.70877, 1.724534, -0.4676346, 1, 0, 0.3058824, 1,
1.711883, 1.340448, 2.435015, 1, 0, 0.2980392, 1,
1.719321, 0.3071811, 1.296522, 1, 0, 0.2941177, 1,
1.727279, 0.1044178, -0.04181978, 1, 0, 0.2862745, 1,
1.73554, 0.08083566, 1.314166, 1, 0, 0.282353, 1,
1.740874, 0.1059654, 0.04895531, 1, 0, 0.2745098, 1,
1.74446, 1.594552, 1.275187, 1, 0, 0.2705882, 1,
1.767575, -1.793529, 3.369166, 1, 0, 0.2627451, 1,
1.774408, -0.537857, 2.357999, 1, 0, 0.2588235, 1,
1.77463, 1.916652, 0.3709947, 1, 0, 0.2509804, 1,
1.812928, 1.346542, -0.7633803, 1, 0, 0.2470588, 1,
1.823644, 0.2641863, 0.3706614, 1, 0, 0.2392157, 1,
1.823729, 0.8292058, 1.30815, 1, 0, 0.2352941, 1,
1.824896, 0.9753132, -0.05355326, 1, 0, 0.227451, 1,
1.829745, 0.3508801, 1.732517, 1, 0, 0.2235294, 1,
1.830059, 0.02005806, 2.111788, 1, 0, 0.2156863, 1,
1.833949, 1.061122, 2.673455, 1, 0, 0.2117647, 1,
1.854154, -1.004008, 2.728029, 1, 0, 0.2039216, 1,
1.876206, 0.5555715, 1.124312, 1, 0, 0.1960784, 1,
1.882547, -1.015401, 2.085345, 1, 0, 0.1921569, 1,
1.888, -0.704906, 3.80258, 1, 0, 0.1843137, 1,
1.895571, 0.2440226, 1.855029, 1, 0, 0.1803922, 1,
1.899063, 1.734374, -0.159444, 1, 0, 0.172549, 1,
1.9016, -0.3808866, 1.279448, 1, 0, 0.1686275, 1,
1.909537, -0.202267, -0.6110022, 1, 0, 0.1607843, 1,
1.918536, 0.0346806, 2.119621, 1, 0, 0.1568628, 1,
1.921436, -1.068794, 2.664392, 1, 0, 0.1490196, 1,
1.952177, 1.011664, 0.8548573, 1, 0, 0.145098, 1,
1.992595, 1.459289, 0.5380743, 1, 0, 0.1372549, 1,
2.016218, 0.1729106, 0.6523892, 1, 0, 0.1333333, 1,
2.059009, -2.392619, 1.011456, 1, 0, 0.1254902, 1,
2.065698, 1.758958, 1.8289, 1, 0, 0.1215686, 1,
2.120147, 0.06610799, 2.221213, 1, 0, 0.1137255, 1,
2.132482, -0.2930531, 0.7255979, 1, 0, 0.1098039, 1,
2.136312, -0.1570279, 1.252383, 1, 0, 0.1019608, 1,
2.139364, 1.291305, 0.6241956, 1, 0, 0.09411765, 1,
2.14734, 0.5530686, 1.215168, 1, 0, 0.09019608, 1,
2.166001, 1.677628, 2.603818, 1, 0, 0.08235294, 1,
2.182094, 1.779912, -1.816923, 1, 0, 0.07843138, 1,
2.186704, -0.3278428, 1.668214, 1, 0, 0.07058824, 1,
2.240481, -0.2802983, 1.965867, 1, 0, 0.06666667, 1,
2.333701, 0.1234514, 1.993115, 1, 0, 0.05882353, 1,
2.337039, -0.6177523, 2.006648, 1, 0, 0.05490196, 1,
2.459772, -0.9978914, 4.431495, 1, 0, 0.04705882, 1,
2.527546, -0.05929512, 1.005169, 1, 0, 0.04313726, 1,
2.548311, 0.1687606, 0.8829931, 1, 0, 0.03529412, 1,
2.564955, -0.6858131, -0.6650534, 1, 0, 0.03137255, 1,
2.605304, -1.959946, 1.941054, 1, 0, 0.02352941, 1,
2.716708, 0.1195046, 0.6014943, 1, 0, 0.01960784, 1,
2.756187, -0.4956957, 3.147051, 1, 0, 0.01176471, 1,
2.785274, 0.6953549, 0.8087654, 1, 0, 0.007843138, 1
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
-0.6459281, -4.401004, -6.500261, 0, -0.5, 0.5, 0.5,
-0.6459281, -4.401004, -6.500261, 1, -0.5, 0.5, 0.5,
-0.6459281, -4.401004, -6.500261, 1, 1.5, 0.5, 0.5,
-0.6459281, -4.401004, -6.500261, 0, 1.5, 0.5, 0.5
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
-5.240308, -0.1390277, -6.500261, 0, -0.5, 0.5, 0.5,
-5.240308, -0.1390277, -6.500261, 1, -0.5, 0.5, 0.5,
-5.240308, -0.1390277, -6.500261, 1, 1.5, 0.5, 0.5,
-5.240308, -0.1390277, -6.500261, 0, 1.5, 0.5, 0.5
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
-5.240308, -4.401004, 0.2021282, 0, -0.5, 0.5, 0.5,
-5.240308, -4.401004, 0.2021282, 1, -0.5, 0.5, 0.5,
-5.240308, -4.401004, 0.2021282, 1, 1.5, 0.5, 0.5,
-5.240308, -4.401004, 0.2021282, 0, 1.5, 0.5, 0.5
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
-4, -3.417471, -4.953556,
2, -3.417471, -4.953556,
-4, -3.417471, -4.953556,
-4, -3.581393, -5.21134,
-3, -3.417471, -4.953556,
-3, -3.581393, -5.21134,
-2, -3.417471, -4.953556,
-2, -3.581393, -5.21134,
-1, -3.417471, -4.953556,
-1, -3.581393, -5.21134,
0, -3.417471, -4.953556,
0, -3.581393, -5.21134,
1, -3.417471, -4.953556,
1, -3.581393, -5.21134,
2, -3.417471, -4.953556,
2, -3.581393, -5.21134
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
"-4",
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
-4, -3.909237, -5.726909, 0, -0.5, 0.5, 0.5,
-4, -3.909237, -5.726909, 1, -0.5, 0.5, 0.5,
-4, -3.909237, -5.726909, 1, 1.5, 0.5, 0.5,
-4, -3.909237, -5.726909, 0, 1.5, 0.5, 0.5,
-3, -3.909237, -5.726909, 0, -0.5, 0.5, 0.5,
-3, -3.909237, -5.726909, 1, -0.5, 0.5, 0.5,
-3, -3.909237, -5.726909, 1, 1.5, 0.5, 0.5,
-3, -3.909237, -5.726909, 0, 1.5, 0.5, 0.5,
-2, -3.909237, -5.726909, 0, -0.5, 0.5, 0.5,
-2, -3.909237, -5.726909, 1, -0.5, 0.5, 0.5,
-2, -3.909237, -5.726909, 1, 1.5, 0.5, 0.5,
-2, -3.909237, -5.726909, 0, 1.5, 0.5, 0.5,
-1, -3.909237, -5.726909, 0, -0.5, 0.5, 0.5,
-1, -3.909237, -5.726909, 1, -0.5, 0.5, 0.5,
-1, -3.909237, -5.726909, 1, 1.5, 0.5, 0.5,
-1, -3.909237, -5.726909, 0, 1.5, 0.5, 0.5,
0, -3.909237, -5.726909, 0, -0.5, 0.5, 0.5,
0, -3.909237, -5.726909, 1, -0.5, 0.5, 0.5,
0, -3.909237, -5.726909, 1, 1.5, 0.5, 0.5,
0, -3.909237, -5.726909, 0, 1.5, 0.5, 0.5,
1, -3.909237, -5.726909, 0, -0.5, 0.5, 0.5,
1, -3.909237, -5.726909, 1, -0.5, 0.5, 0.5,
1, -3.909237, -5.726909, 1, 1.5, 0.5, 0.5,
1, -3.909237, -5.726909, 0, 1.5, 0.5, 0.5,
2, -3.909237, -5.726909, 0, -0.5, 0.5, 0.5,
2, -3.909237, -5.726909, 1, -0.5, 0.5, 0.5,
2, -3.909237, -5.726909, 1, 1.5, 0.5, 0.5,
2, -3.909237, -5.726909, 0, 1.5, 0.5, 0.5
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
-4.180067, -3, -4.953556,
-4.180067, 3, -4.953556,
-4.180067, -3, -4.953556,
-4.356773, -3, -5.21134,
-4.180067, -2, -4.953556,
-4.356773, -2, -5.21134,
-4.180067, -1, -4.953556,
-4.356773, -1, -5.21134,
-4.180067, 0, -4.953556,
-4.356773, 0, -5.21134,
-4.180067, 1, -4.953556,
-4.356773, 1, -5.21134,
-4.180067, 2, -4.953556,
-4.356773, 2, -5.21134,
-4.180067, 3, -4.953556,
-4.356773, 3, -5.21134
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
-4.710187, -3, -5.726909, 0, -0.5, 0.5, 0.5,
-4.710187, -3, -5.726909, 1, -0.5, 0.5, 0.5,
-4.710187, -3, -5.726909, 1, 1.5, 0.5, 0.5,
-4.710187, -3, -5.726909, 0, 1.5, 0.5, 0.5,
-4.710187, -2, -5.726909, 0, -0.5, 0.5, 0.5,
-4.710187, -2, -5.726909, 1, -0.5, 0.5, 0.5,
-4.710187, -2, -5.726909, 1, 1.5, 0.5, 0.5,
-4.710187, -2, -5.726909, 0, 1.5, 0.5, 0.5,
-4.710187, -1, -5.726909, 0, -0.5, 0.5, 0.5,
-4.710187, -1, -5.726909, 1, -0.5, 0.5, 0.5,
-4.710187, -1, -5.726909, 1, 1.5, 0.5, 0.5,
-4.710187, -1, -5.726909, 0, 1.5, 0.5, 0.5,
-4.710187, 0, -5.726909, 0, -0.5, 0.5, 0.5,
-4.710187, 0, -5.726909, 1, -0.5, 0.5, 0.5,
-4.710187, 0, -5.726909, 1, 1.5, 0.5, 0.5,
-4.710187, 0, -5.726909, 0, 1.5, 0.5, 0.5,
-4.710187, 1, -5.726909, 0, -0.5, 0.5, 0.5,
-4.710187, 1, -5.726909, 1, -0.5, 0.5, 0.5,
-4.710187, 1, -5.726909, 1, 1.5, 0.5, 0.5,
-4.710187, 1, -5.726909, 0, 1.5, 0.5, 0.5,
-4.710187, 2, -5.726909, 0, -0.5, 0.5, 0.5,
-4.710187, 2, -5.726909, 1, -0.5, 0.5, 0.5,
-4.710187, 2, -5.726909, 1, 1.5, 0.5, 0.5,
-4.710187, 2, -5.726909, 0, 1.5, 0.5, 0.5,
-4.710187, 3, -5.726909, 0, -0.5, 0.5, 0.5,
-4.710187, 3, -5.726909, 1, -0.5, 0.5, 0.5,
-4.710187, 3, -5.726909, 1, 1.5, 0.5, 0.5,
-4.710187, 3, -5.726909, 0, 1.5, 0.5, 0.5
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
-4.180067, -3.417471, -4,
-4.180067, -3.417471, 4,
-4.180067, -3.417471, -4,
-4.356773, -3.581393, -4,
-4.180067, -3.417471, -2,
-4.356773, -3.581393, -2,
-4.180067, -3.417471, 0,
-4.356773, -3.581393, 0,
-4.180067, -3.417471, 2,
-4.356773, -3.581393, 2,
-4.180067, -3.417471, 4,
-4.356773, -3.581393, 4
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
-4.710187, -3.909237, -4, 0, -0.5, 0.5, 0.5,
-4.710187, -3.909237, -4, 1, -0.5, 0.5, 0.5,
-4.710187, -3.909237, -4, 1, 1.5, 0.5, 0.5,
-4.710187, -3.909237, -4, 0, 1.5, 0.5, 0.5,
-4.710187, -3.909237, -2, 0, -0.5, 0.5, 0.5,
-4.710187, -3.909237, -2, 1, -0.5, 0.5, 0.5,
-4.710187, -3.909237, -2, 1, 1.5, 0.5, 0.5,
-4.710187, -3.909237, -2, 0, 1.5, 0.5, 0.5,
-4.710187, -3.909237, 0, 0, -0.5, 0.5, 0.5,
-4.710187, -3.909237, 0, 1, -0.5, 0.5, 0.5,
-4.710187, -3.909237, 0, 1, 1.5, 0.5, 0.5,
-4.710187, -3.909237, 0, 0, 1.5, 0.5, 0.5,
-4.710187, -3.909237, 2, 0, -0.5, 0.5, 0.5,
-4.710187, -3.909237, 2, 1, -0.5, 0.5, 0.5,
-4.710187, -3.909237, 2, 1, 1.5, 0.5, 0.5,
-4.710187, -3.909237, 2, 0, 1.5, 0.5, 0.5,
-4.710187, -3.909237, 4, 0, -0.5, 0.5, 0.5,
-4.710187, -3.909237, 4, 1, -0.5, 0.5, 0.5,
-4.710187, -3.909237, 4, 1, 1.5, 0.5, 0.5,
-4.710187, -3.909237, 4, 0, 1.5, 0.5, 0.5
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
-4.180067, -3.417471, -4.953556,
-4.180067, 3.139415, -4.953556,
-4.180067, -3.417471, 5.357812,
-4.180067, 3.139415, 5.357812,
-4.180067, -3.417471, -4.953556,
-4.180067, -3.417471, 5.357812,
-4.180067, 3.139415, -4.953556,
-4.180067, 3.139415, 5.357812,
-4.180067, -3.417471, -4.953556,
2.88821, -3.417471, -4.953556,
-4.180067, -3.417471, 5.357812,
2.88821, -3.417471, 5.357812,
-4.180067, 3.139415, -4.953556,
2.88821, 3.139415, -4.953556,
-4.180067, 3.139415, 5.357812,
2.88821, 3.139415, 5.357812,
2.88821, -3.417471, -4.953556,
2.88821, 3.139415, -4.953556,
2.88821, -3.417471, 5.357812,
2.88821, 3.139415, 5.357812,
2.88821, -3.417471, -4.953556,
2.88821, -3.417471, 5.357812,
2.88821, 3.139415, -4.953556,
2.88821, 3.139415, 5.357812
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
var radius = 7.537975;
var distance = 33.5373;
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
mvMatrix.translate( 0.6459281, 0.1390277, -0.2021282 );
mvMatrix.scale( 1.153068, 1.243, 0.7904098 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.5373);
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
p-chlorotoluene<-read.table("p-chlorotoluene.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-p-chlorotoluene$V2
```

```
## Error in eval(expr, envir, enclos): object 'p' not found
```

```r
y<-p-chlorotoluene$V3
```

```
## Error in eval(expr, envir, enclos): object 'p' not found
```

```r
z<-p-chlorotoluene$V4
```

```
## Error in eval(expr, envir, enclos): object 'p' not found
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
-4.07713, -1.146486, -2.865162, 0, 0, 1, 1, 1,
-2.704761, -0.1881424, -0.3689751, 1, 0, 0, 1, 1,
-2.679621, -1.796198, -1.892286, 1, 0, 0, 1, 1,
-2.474091, 0.05062498, -0.972753, 1, 0, 0, 1, 1,
-2.414861, -0.5947667, -1.721648, 1, 0, 0, 1, 1,
-2.342044, -0.09497841, -1.534738, 1, 0, 0, 1, 1,
-2.278322, 0.7247868, -0.4240164, 0, 0, 0, 1, 1,
-2.27818, 0.9736336, -1.334306, 0, 0, 0, 1, 1,
-2.277891, -1.134693, -0.08239536, 0, 0, 0, 1, 1,
-2.276433, 1.558095, -1.255876, 0, 0, 0, 1, 1,
-2.268414, 0.6938509, -0.3003107, 0, 0, 0, 1, 1,
-2.194056, -1.003519, 0.8234878, 0, 0, 0, 1, 1,
-2.191599, 0.1985673, -0.5031603, 0, 0, 0, 1, 1,
-2.167601, 0.4226153, -1.825078, 1, 1, 1, 1, 1,
-2.132735, -0.09637446, -2.109448, 1, 1, 1, 1, 1,
-2.12263, -1.731272, -2.33566, 1, 1, 1, 1, 1,
-2.118654, 0.2852877, 0.4411634, 1, 1, 1, 1, 1,
-2.118198, -1.90743, -1.836227, 1, 1, 1, 1, 1,
-2.109264, 0.3088771, -0.403859, 1, 1, 1, 1, 1,
-2.087297, 0.1266007, -2.750756, 1, 1, 1, 1, 1,
-2.086709, 1.010293, -1.626068, 1, 1, 1, 1, 1,
-2.06091, 0.6619202, -1.297664, 1, 1, 1, 1, 1,
-2.057267, -1.139109, -1.867927, 1, 1, 1, 1, 1,
-2.049278, 0.6975662, -1.602412, 1, 1, 1, 1, 1,
-1.995887, 0.2593625, -1.298079, 1, 1, 1, 1, 1,
-1.964533, 0.7973232, -2.135509, 1, 1, 1, 1, 1,
-1.911089, -0.7427152, -1.022496, 1, 1, 1, 1, 1,
-1.869658, -1.406249, -0.555869, 1, 1, 1, 1, 1,
-1.849029, -0.07497682, -1.150033, 0, 0, 1, 1, 1,
-1.841346, -0.9242212, -2.627996, 1, 0, 0, 1, 1,
-1.838366, -1.99726, -2.29467, 1, 0, 0, 1, 1,
-1.821359, 2.103395, -0.6261713, 1, 0, 0, 1, 1,
-1.817793, -1.186542, -1.768984, 1, 0, 0, 1, 1,
-1.80343, 0.5119196, -1.661632, 1, 0, 0, 1, 1,
-1.785334, -0.04876895, -0.1829295, 0, 0, 0, 1, 1,
-1.783918, 0.2767543, -1.660757, 0, 0, 0, 1, 1,
-1.746884, -0.4289774, -2.092718, 0, 0, 0, 1, 1,
-1.718323, 0.3307992, -1.484088, 0, 0, 0, 1, 1,
-1.715618, -1.605044, -2.81324, 0, 0, 0, 1, 1,
-1.714972, -0.6812552, -0.07481557, 0, 0, 0, 1, 1,
-1.700557, -3.321982, -0.8820186, 0, 0, 0, 1, 1,
-1.669012, 1.57506, 0.1838655, 1, 1, 1, 1, 1,
-1.651565, 1.582132, 2.231417, 1, 1, 1, 1, 1,
-1.641293, 1.210646, -1.56106, 1, 1, 1, 1, 1,
-1.64068, -0.209778, -0.7521051, 1, 1, 1, 1, 1,
-1.636469, -0.2342826, -1.351986, 1, 1, 1, 1, 1,
-1.63322, -1.414709, -0.9640629, 1, 1, 1, 1, 1,
-1.630079, 1.396355, -1.443812, 1, 1, 1, 1, 1,
-1.626252, 0.8734195, 1.150891, 1, 1, 1, 1, 1,
-1.622189, -0.5572165, -1.069676, 1, 1, 1, 1, 1,
-1.610167, 0.8630469, 0.01939722, 1, 1, 1, 1, 1,
-1.609453, 0.4184977, -2.149402, 1, 1, 1, 1, 1,
-1.599105, 0.2588777, -1.824618, 1, 1, 1, 1, 1,
-1.597663, 0.4234736, -2.433518, 1, 1, 1, 1, 1,
-1.592574, -0.7348081, -2.591805, 1, 1, 1, 1, 1,
-1.578912, 0.751708, -1.905417, 1, 1, 1, 1, 1,
-1.571231, 0.005617999, -1.163301, 0, 0, 1, 1, 1,
-1.561623, 1.166165, -1.153094, 1, 0, 0, 1, 1,
-1.54414, 0.1411832, 0.3362241, 1, 0, 0, 1, 1,
-1.54393, 0.1870055, -0.9515903, 1, 0, 0, 1, 1,
-1.543699, -0.5791959, -2.973363, 1, 0, 0, 1, 1,
-1.541995, -0.6271822, -3.124035, 1, 0, 0, 1, 1,
-1.529052, 0.6874889, -1.155412, 0, 0, 0, 1, 1,
-1.513326, 0.1805126, -1.844111, 0, 0, 0, 1, 1,
-1.497975, -0.3332456, -0.1593655, 0, 0, 0, 1, 1,
-1.492376, -0.7971955, -1.675598, 0, 0, 0, 1, 1,
-1.491003, -0.01999379, 0.893931, 0, 0, 0, 1, 1,
-1.483224, 1.827288, -0.1230205, 0, 0, 0, 1, 1,
-1.475512, 0.4519705, -2.327277, 0, 0, 0, 1, 1,
-1.474995, -0.6003885, -1.918348, 1, 1, 1, 1, 1,
-1.469501, 1.408317, -2.048582, 1, 1, 1, 1, 1,
-1.445163, 0.5983653, -0.9015375, 1, 1, 1, 1, 1,
-1.419717, -0.7685702, 0.3793364, 1, 1, 1, 1, 1,
-1.416705, 0.09431116, -2.759465, 1, 1, 1, 1, 1,
-1.416637, 0.6605018, -1.49026, 1, 1, 1, 1, 1,
-1.414069, -0.9168381, -2.563561, 1, 1, 1, 1, 1,
-1.407179, -0.9593056, -0.09179807, 1, 1, 1, 1, 1,
-1.400576, 0.01711412, 0.1128453, 1, 1, 1, 1, 1,
-1.397561, -1.601765, -1.981291, 1, 1, 1, 1, 1,
-1.393553, 0.1462576, -2.542538, 1, 1, 1, 1, 1,
-1.379416, 0.03333654, -1.232423, 1, 1, 1, 1, 1,
-1.359123, -1.071653, -2.658481, 1, 1, 1, 1, 1,
-1.34339, -0.5005506, -2.132516, 1, 1, 1, 1, 1,
-1.338665, 1.540629, -1.768488, 1, 1, 1, 1, 1,
-1.332535, -0.8114073, -2.042361, 0, 0, 1, 1, 1,
-1.328332, 0.765851, -0.1240897, 1, 0, 0, 1, 1,
-1.324094, 0.4240441, -2.367471, 1, 0, 0, 1, 1,
-1.322613, 1.464696, -0.003916253, 1, 0, 0, 1, 1,
-1.317306, -2.061537, -3.525899, 1, 0, 0, 1, 1,
-1.29993, -1.040067, -0.8600492, 1, 0, 0, 1, 1,
-1.298761, -0.1398368, -0.8470626, 0, 0, 0, 1, 1,
-1.298193, 1.23106, -0.6585737, 0, 0, 0, 1, 1,
-1.297518, 0.3392849, -1.05877, 0, 0, 0, 1, 1,
-1.296948, 0.4580622, -0.7892406, 0, 0, 0, 1, 1,
-1.281057, -0.4910674, -0.6586664, 0, 0, 0, 1, 1,
-1.279868, -0.3053221, -1.934086, 0, 0, 0, 1, 1,
-1.273786, 0.1783609, -2.397095, 0, 0, 0, 1, 1,
-1.270099, -0.5527698, -2.064435, 1, 1, 1, 1, 1,
-1.266905, -0.1366281, -2.006569, 1, 1, 1, 1, 1,
-1.263219, -0.3578357, -2.273319, 1, 1, 1, 1, 1,
-1.254362, 1.32249, -1.171295, 1, 1, 1, 1, 1,
-1.254002, -0.8727871, -3.020381, 1, 1, 1, 1, 1,
-1.244309, 0.717868, 0.3551126, 1, 1, 1, 1, 1,
-1.235859, -1.608451, -2.069981, 1, 1, 1, 1, 1,
-1.233003, 0.003938766, -2.816174, 1, 1, 1, 1, 1,
-1.229407, -0.8655128, -3.644513, 1, 1, 1, 1, 1,
-1.224037, 0.6442843, -2.896952, 1, 1, 1, 1, 1,
-1.219253, 0.225711, -0.1949349, 1, 1, 1, 1, 1,
-1.216845, 0.3377248, -2.31093, 1, 1, 1, 1, 1,
-1.216149, 2.63297, 0.4152795, 1, 1, 1, 1, 1,
-1.214226, -0.3172744, -2.094857, 1, 1, 1, 1, 1,
-1.21163, -0.209503, -1.729093, 1, 1, 1, 1, 1,
-1.196069, 0.3674225, -1.5482, 0, 0, 1, 1, 1,
-1.189453, 0.5146565, -0.8293519, 1, 0, 0, 1, 1,
-1.188019, 1.358688, -1.1915, 1, 0, 0, 1, 1,
-1.185879, 1.739007, 0.4699072, 1, 0, 0, 1, 1,
-1.162387, 0.9650307, -1.671851, 1, 0, 0, 1, 1,
-1.159558, -0.5262882, -1.318638, 1, 0, 0, 1, 1,
-1.158151, -0.2857421, -2.574042, 0, 0, 0, 1, 1,
-1.15452, -0.6143082, -1.42767, 0, 0, 0, 1, 1,
-1.15247, 0.5533866, -1.708417, 0, 0, 0, 1, 1,
-1.145937, -2.008919, -3.130787, 0, 0, 0, 1, 1,
-1.13711, 1.502604, -0.5333855, 0, 0, 0, 1, 1,
-1.13383, -1.273043, -1.988058, 0, 0, 0, 1, 1,
-1.111751, -0.1729788, -0.6649407, 0, 0, 0, 1, 1,
-1.11113, 0.7795087, -1.883397, 1, 1, 1, 1, 1,
-1.105154, -0.1131584, -2.627084, 1, 1, 1, 1, 1,
-1.104191, 0.6807771, -0.350374, 1, 1, 1, 1, 1,
-1.10202, 0.2204711, -2.173556, 1, 1, 1, 1, 1,
-1.099011, -1.002325, -3.3421, 1, 1, 1, 1, 1,
-1.092975, -0.6798121, -2.193607, 1, 1, 1, 1, 1,
-1.091913, -0.4324561, -2.402591, 1, 1, 1, 1, 1,
-1.090456, -0.8336639, -2.205649, 1, 1, 1, 1, 1,
-1.087733, -1.200299, -1.819323, 1, 1, 1, 1, 1,
-1.07758, 0.1433822, -0.5466276, 1, 1, 1, 1, 1,
-1.074244, 0.7188984, -1.000942, 1, 1, 1, 1, 1,
-1.072004, 0.7397832, -0.993791, 1, 1, 1, 1, 1,
-1.058103, 0.5406498, -0.1880848, 1, 1, 1, 1, 1,
-1.054951, -2.084182, -1.83054, 1, 1, 1, 1, 1,
-1.053157, -1.479627, -4.004343, 1, 1, 1, 1, 1,
-1.05222, 1.221166, -1.754443, 0, 0, 1, 1, 1,
-1.048866, 0.5593601, -1.062431, 1, 0, 0, 1, 1,
-1.044684, -2.294482, -4.062615, 1, 0, 0, 1, 1,
-1.036654, 0.5377374, -2.021791, 1, 0, 0, 1, 1,
-1.035425, -0.1378849, -2.043413, 1, 0, 0, 1, 1,
-1.034889, 1.351843, -1.903378, 1, 0, 0, 1, 1,
-1.031181, -1.009563, -1.911836, 0, 0, 0, 1, 1,
-1.031008, 0.005313776, -3.093966, 0, 0, 0, 1, 1,
-1.030966, -0.6825211, -2.608457, 0, 0, 0, 1, 1,
-1.030033, -0.5671968, -0.9618874, 0, 0, 0, 1, 1,
-1.028202, -0.4829548, -2.727988, 0, 0, 0, 1, 1,
-1.022171, -1.119531, -3.030295, 0, 0, 0, 1, 1,
-1.007386, -0.5204994, -2.361162, 0, 0, 0, 1, 1,
-1.003535, 1.277285, 0.223126, 1, 1, 1, 1, 1,
-1.00115, -1.241926, -4.0445, 1, 1, 1, 1, 1,
-0.9996916, 0.6948832, -1.184392, 1, 1, 1, 1, 1,
-0.9856673, 0.1943776, -1.15488, 1, 1, 1, 1, 1,
-0.9841294, -0.1304253, -0.5419682, 1, 1, 1, 1, 1,
-0.9808146, -0.04126995, 0.7553988, 1, 1, 1, 1, 1,
-0.9712155, -1.267241, -3.465036, 1, 1, 1, 1, 1,
-0.9545201, 0.7980147, -0.7232459, 1, 1, 1, 1, 1,
-0.9528435, 0.8656889, 0.432218, 1, 1, 1, 1, 1,
-0.9527861, -0.3527763, -2.69448, 1, 1, 1, 1, 1,
-0.9496005, 0.616776, -2.262805, 1, 1, 1, 1, 1,
-0.9489117, 0.1384336, -0.176087, 1, 1, 1, 1, 1,
-0.9366716, -0.9756651, -1.583393, 1, 1, 1, 1, 1,
-0.9356732, -1.825454, -1.744745, 1, 1, 1, 1, 1,
-0.9244805, -0.3747413, -1.587269, 1, 1, 1, 1, 1,
-0.9190155, -0.6197289, -3.143171, 0, 0, 1, 1, 1,
-0.9140146, -0.9084657, -2.840232, 1, 0, 0, 1, 1,
-0.9126692, -0.6994588, -2.480182, 1, 0, 0, 1, 1,
-0.9119676, -0.3194763, -0.8105342, 1, 0, 0, 1, 1,
-0.9099572, 0.8764879, -0.3824653, 1, 0, 0, 1, 1,
-0.9073636, -0.4559019, -2.370692, 1, 0, 0, 1, 1,
-0.9034148, -1.26853, -2.825579, 0, 0, 0, 1, 1,
-0.9023712, -0.4857312, -2.078663, 0, 0, 0, 1, 1,
-0.901964, 1.776352, -0.5280253, 0, 0, 0, 1, 1,
-0.9009496, 2.520763, 1.371491, 0, 0, 0, 1, 1,
-0.8919721, -0.01246158, -0.325522, 0, 0, 0, 1, 1,
-0.8895286, -0.1323408, -1.2254, 0, 0, 0, 1, 1,
-0.8892656, 0.1629245, -1.924047, 0, 0, 0, 1, 1,
-0.8805759, 0.6399238, -0.6322253, 1, 1, 1, 1, 1,
-0.8798966, -0.1870417, -0.7566394, 1, 1, 1, 1, 1,
-0.8742016, -1.036117, -1.72742, 1, 1, 1, 1, 1,
-0.8645011, -2.187013, -3.136639, 1, 1, 1, 1, 1,
-0.8644311, 1.527902, -0.8951594, 1, 1, 1, 1, 1,
-0.8535976, -0.5209442, -2.498398, 1, 1, 1, 1, 1,
-0.8519641, 0.3290949, -1.855418, 1, 1, 1, 1, 1,
-0.8511688, 1.415617, -1.193484, 1, 1, 1, 1, 1,
-0.8502091, 0.9220749, 0.3282175, 1, 1, 1, 1, 1,
-0.8465644, -0.3754815, -2.891606, 1, 1, 1, 1, 1,
-0.8406262, 0.1952195, -0.3259102, 1, 1, 1, 1, 1,
-0.8342543, -0.909018, -3.448464, 1, 1, 1, 1, 1,
-0.8290666, 0.4218538, -1.353697, 1, 1, 1, 1, 1,
-0.8273985, 0.01445321, -0.6972688, 1, 1, 1, 1, 1,
-0.8272634, -0.8663835, -1.225385, 1, 1, 1, 1, 1,
-0.807037, 0.6577194, -0.4802552, 0, 0, 1, 1, 1,
-0.8028492, 0.9384395, -1.107938, 1, 0, 0, 1, 1,
-0.7961957, -0.63968, -1.057461, 1, 0, 0, 1, 1,
-0.7860505, -0.7000738, -2.504951, 1, 0, 0, 1, 1,
-0.7854084, 0.1324845, -0.7984623, 1, 0, 0, 1, 1,
-0.7844267, -1.662909, -4.027925, 1, 0, 0, 1, 1,
-0.7837785, 0.4743395, -1.990608, 0, 0, 0, 1, 1,
-0.7827511, -0.1430826, -2.443064, 0, 0, 0, 1, 1,
-0.7813376, 0.957474, -1.398525, 0, 0, 0, 1, 1,
-0.7784645, 0.8708308, 0.380087, 0, 0, 0, 1, 1,
-0.7778695, -0.2638999, -2.445144, 0, 0, 0, 1, 1,
-0.7677836, -0.2133173, -1.807224, 0, 0, 0, 1, 1,
-0.7649775, 0.8781779, -0.5780616, 0, 0, 0, 1, 1,
-0.7619196, 0.4085062, -1.905173, 1, 1, 1, 1, 1,
-0.7617761, 1.103372, -0.9829843, 1, 1, 1, 1, 1,
-0.7615916, 0.5160214, -0.3599457, 1, 1, 1, 1, 1,
-0.7587141, 0.5604165, -1.344839, 1, 1, 1, 1, 1,
-0.7560527, -0.1018919, -1.851913, 1, 1, 1, 1, 1,
-0.7535138, 0.63284, -0.6018375, 1, 1, 1, 1, 1,
-0.7476887, -0.9292526, -2.63274, 1, 1, 1, 1, 1,
-0.7474548, 1.394721, 0.5609809, 1, 1, 1, 1, 1,
-0.7469105, -0.2546463, -0.3703573, 1, 1, 1, 1, 1,
-0.7468753, -1.155831, -3.85069, 1, 1, 1, 1, 1,
-0.742377, -0.008862659, -1.730268, 1, 1, 1, 1, 1,
-0.7393072, 1.841945, -2.047005, 1, 1, 1, 1, 1,
-0.7271134, -0.1280165, -1.432995, 1, 1, 1, 1, 1,
-0.7176624, 0.1463281, -2.000755, 1, 1, 1, 1, 1,
-0.7170306, 0.9689531, -2.421631, 1, 1, 1, 1, 1,
-0.7144775, 0.7874506, -1.356403, 0, 0, 1, 1, 1,
-0.7093564, 1.115339, -0.4416441, 1, 0, 0, 1, 1,
-0.7075801, 0.7348589, -0.05091531, 1, 0, 0, 1, 1,
-0.7015017, -0.1196343, -1.550597, 1, 0, 0, 1, 1,
-0.699871, -0.9129841, -2.50886, 1, 0, 0, 1, 1,
-0.6981656, -1.048517, -2.639803, 1, 0, 0, 1, 1,
-0.6960712, 0.5226842, -1.429641, 0, 0, 0, 1, 1,
-0.6918353, 0.7307587, -1.255536, 0, 0, 0, 1, 1,
-0.691775, -0.6587245, -0.5874959, 0, 0, 0, 1, 1,
-0.6829523, 1.402472, -0.6185105, 0, 0, 0, 1, 1,
-0.6816906, -0.7179736, -3.176173, 0, 0, 0, 1, 1,
-0.6804887, 3.007013, -0.6344279, 0, 0, 0, 1, 1,
-0.6749971, -2.62645, -3.974683, 0, 0, 0, 1, 1,
-0.6730563, 0.9301017, -0.9594744, 1, 1, 1, 1, 1,
-0.6683551, 0.04694555, -2.639794, 1, 1, 1, 1, 1,
-0.6640302, -0.8155026, -3.593998, 1, 1, 1, 1, 1,
-0.6606269, 0.9340783, -1.063553, 1, 1, 1, 1, 1,
-0.6589561, -2.754306, -3.9349, 1, 1, 1, 1, 1,
-0.6568688, 1.434693, -0.6225569, 1, 1, 1, 1, 1,
-0.646068, 0.7641619, -1.281914, 1, 1, 1, 1, 1,
-0.6415188, -1.450559, -1.709429, 1, 1, 1, 1, 1,
-0.6391023, 0.924158, -0.1306194, 1, 1, 1, 1, 1,
-0.626611, 0.3659428, -0.8468887, 1, 1, 1, 1, 1,
-0.6262649, -0.1209437, -2.637159, 1, 1, 1, 1, 1,
-0.6260366, -1.466534, -4.232199, 1, 1, 1, 1, 1,
-0.6257261, 1.673523, 0.4932411, 1, 1, 1, 1, 1,
-0.620416, 0.4791903, -0.1998589, 1, 1, 1, 1, 1,
-0.6179484, 1.44965, -1.245909, 1, 1, 1, 1, 1,
-0.6175956, 0.4854425, 1.014672, 0, 0, 1, 1, 1,
-0.6173736, -0.9116495, -0.1073592, 1, 0, 0, 1, 1,
-0.6137897, -1.035106, -3.093689, 1, 0, 0, 1, 1,
-0.6101534, -0.1326777, -2.075327, 1, 0, 0, 1, 1,
-0.6096516, -0.4911506, -1.237664, 1, 0, 0, 1, 1,
-0.609555, 0.8999708, -2.740591, 1, 0, 0, 1, 1,
-0.607285, 1.189734, -0.6443496, 0, 0, 0, 1, 1,
-0.6070308, -0.7054859, -2.151404, 0, 0, 0, 1, 1,
-0.6069423, -0.1142186, -1.996804, 0, 0, 0, 1, 1,
-0.6034894, 1.790418, 0.2120184, 0, 0, 0, 1, 1,
-0.600342, 0.1792163, -0.8765393, 0, 0, 0, 1, 1,
-0.6000749, -0.02308359, -0.822633, 0, 0, 0, 1, 1,
-0.596436, -0.1087024, -2.280901, 0, 0, 0, 1, 1,
-0.5948883, -0.949644, -1.827467, 1, 1, 1, 1, 1,
-0.5948009, -0.263483, -2.785664, 1, 1, 1, 1, 1,
-0.5891147, 1.077886, -0.8309356, 1, 1, 1, 1, 1,
-0.5875037, 0.05088774, -1.65078, 1, 1, 1, 1, 1,
-0.5873494, -0.07170313, -1.120063, 1, 1, 1, 1, 1,
-0.5873256, -0.4621728, -1.644808, 1, 1, 1, 1, 1,
-0.5834345, -0.4751607, -3.463396, 1, 1, 1, 1, 1,
-0.5830194, 0.2761902, -0.6885881, 1, 1, 1, 1, 1,
-0.5822437, 0.7786359, -0.7925339, 1, 1, 1, 1, 1,
-0.57981, 0.9045706, 0.2215136, 1, 1, 1, 1, 1,
-0.5784671, -1.46691, -2.653108, 1, 1, 1, 1, 1,
-0.5767695, -2.38919, -2.578137, 1, 1, 1, 1, 1,
-0.5721388, -0.299274, -2.913311, 1, 1, 1, 1, 1,
-0.5715694, -1.829363, -3.002222, 1, 1, 1, 1, 1,
-0.5681749, -0.4293186, -3.978992, 1, 1, 1, 1, 1,
-0.5475326, 0.08912961, -0.591324, 0, 0, 1, 1, 1,
-0.5393002, -0.5418488, -0.3816541, 1, 0, 0, 1, 1,
-0.5367182, -0.1034767, -1.545685, 1, 0, 0, 1, 1,
-0.534705, -0.715495, -2.249807, 1, 0, 0, 1, 1,
-0.5340887, 0.5418762, 0.2530997, 1, 0, 0, 1, 1,
-0.5305982, 0.09174132, -2.166827, 1, 0, 0, 1, 1,
-0.5283635, -0.1121487, -2.578214, 0, 0, 0, 1, 1,
-0.523948, -0.2055979, -1.645631, 0, 0, 0, 1, 1,
-0.5222952, 0.3590652, -0.830514, 0, 0, 0, 1, 1,
-0.5165734, -0.1401705, -3.181921, 0, 0, 0, 1, 1,
-0.5156806, -0.977989, -2.965437, 0, 0, 0, 1, 1,
-0.5123643, 0.9740332, -0.3669954, 0, 0, 0, 1, 1,
-0.5113028, 1.422889, -0.791721, 0, 0, 0, 1, 1,
-0.5089864, 1.086852, -0.2168888, 1, 1, 1, 1, 1,
-0.5046889, -0.933539, -3.437988, 1, 1, 1, 1, 1,
-0.4998015, -1.364379, -3.959044, 1, 1, 1, 1, 1,
-0.4860015, -0.3215385, -1.494588, 1, 1, 1, 1, 1,
-0.4853146, -0.6477467, -1.624204, 1, 1, 1, 1, 1,
-0.4812964, 1.730514, 0.2703724, 1, 1, 1, 1, 1,
-0.4748806, 1.40105, -0.184985, 1, 1, 1, 1, 1,
-0.4746975, -0.3370813, -1.927625, 1, 1, 1, 1, 1,
-0.472513, 0.3258818, -0.04261505, 1, 1, 1, 1, 1,
-0.470613, -0.6504627, -4.024865, 1, 1, 1, 1, 1,
-0.4650082, 0.8075124, -0.05459862, 1, 1, 1, 1, 1,
-0.4630263, 0.8769065, -0.5406798, 1, 1, 1, 1, 1,
-0.4629831, -0.01711431, -1.353857, 1, 1, 1, 1, 1,
-0.4619278, -1.067688, -3.822839, 1, 1, 1, 1, 1,
-0.4596206, -0.1343217, -1.673704, 1, 1, 1, 1, 1,
-0.4542425, 0.4039749, -2.042157, 0, 0, 1, 1, 1,
-0.4536002, 0.4026969, -0.7345545, 1, 0, 0, 1, 1,
-0.4505581, 0.5448359, -0.4017085, 1, 0, 0, 1, 1,
-0.4471886, 0.763006, -1.261676, 1, 0, 0, 1, 1,
-0.4449884, -0.2483569, -2.625432, 1, 0, 0, 1, 1,
-0.4438844, -1.64731, -3.199198, 1, 0, 0, 1, 1,
-0.4423192, 0.2466594, -1.833405, 0, 0, 0, 1, 1,
-0.4377156, 1.251164, -0.03330191, 0, 0, 0, 1, 1,
-0.4367107, 2.051335, -0.6630789, 0, 0, 0, 1, 1,
-0.434649, 2.809652, 0.3654126, 0, 0, 0, 1, 1,
-0.419859, 1.0317, -1.624061, 0, 0, 0, 1, 1,
-0.4175696, -1.075612, -3.876666, 0, 0, 0, 1, 1,
-0.4155652, 1.500594, 0.09462887, 0, 0, 0, 1, 1,
-0.4115669, -0.8520284, -2.147314, 1, 1, 1, 1, 1,
-0.4087184, 0.7674115, 0.0652119, 1, 1, 1, 1, 1,
-0.4049429, -1.215753, -2.758576, 1, 1, 1, 1, 1,
-0.4039333, -0.1593879, -2.153786, 1, 1, 1, 1, 1,
-0.4037449, -0.3047974, -1.743709, 1, 1, 1, 1, 1,
-0.4021143, -0.945406, -2.62067, 1, 1, 1, 1, 1,
-0.3932979, -1.708027, -3.52528, 1, 1, 1, 1, 1,
-0.3918417, -0.4046802, -2.847136, 1, 1, 1, 1, 1,
-0.3900708, 0.2738926, -1.706779, 1, 1, 1, 1, 1,
-0.3849525, -0.3080918, -0.6979985, 1, 1, 1, 1, 1,
-0.3790519, -1.011399, -2.012418, 1, 1, 1, 1, 1,
-0.3784381, 0.9938563, -0.942658, 1, 1, 1, 1, 1,
-0.3771918, 0.4249655, -0.9745549, 1, 1, 1, 1, 1,
-0.3734201, 0.1576124, -0.7332504, 1, 1, 1, 1, 1,
-0.3720242, -0.7340728, 0.1411824, 1, 1, 1, 1, 1,
-0.371708, 0.9454436, -0.4232348, 0, 0, 1, 1, 1,
-0.3716838, -1.518269, -3.247674, 1, 0, 0, 1, 1,
-0.3701641, 0.727026, -1.311352, 1, 0, 0, 1, 1,
-0.3695495, -1.820339, -2.505434, 1, 0, 0, 1, 1,
-0.3655865, 0.826889, -1.535373, 1, 0, 0, 1, 1,
-0.3651859, 0.7416764, -1.992041, 1, 0, 0, 1, 1,
-0.3644811, 0.02251234, -2.073234, 0, 0, 0, 1, 1,
-0.3619469, 0.3334141, -1.366486, 0, 0, 0, 1, 1,
-0.361003, 1.038568, -0.4296017, 0, 0, 0, 1, 1,
-0.3599574, 1.858138, -0.76486, 0, 0, 0, 1, 1,
-0.3593975, -0.1316596, 0.07429358, 0, 0, 0, 1, 1,
-0.3572423, -1.211928, -2.704039, 0, 0, 0, 1, 1,
-0.3532992, -1.330083, -4.718902, 0, 0, 0, 1, 1,
-0.352381, 0.8466187, 2.192178, 1, 1, 1, 1, 1,
-0.3450721, 2.56816, 0.07082124, 1, 1, 1, 1, 1,
-0.3436938, 1.032337, -0.103232, 1, 1, 1, 1, 1,
-0.3418342, -0.04986127, -2.265418, 1, 1, 1, 1, 1,
-0.3398297, -1.260903, -3.306447, 1, 1, 1, 1, 1,
-0.3389843, -0.2911614, -1.493856, 1, 1, 1, 1, 1,
-0.3337295, -0.3112673, -4.803391, 1, 1, 1, 1, 1,
-0.3304453, 2.463633, -2.06772, 1, 1, 1, 1, 1,
-0.3231126, -1.016765, -2.61686, 1, 1, 1, 1, 1,
-0.3162491, -0.5804266, -0.3609157, 1, 1, 1, 1, 1,
-0.3150589, 0.4435468, 0.7621046, 1, 1, 1, 1, 1,
-0.312788, -0.00558913, -1.499667, 1, 1, 1, 1, 1,
-0.3120329, 1.631777, 0.1486163, 1, 1, 1, 1, 1,
-0.3120239, 0.0953747, -2.015748, 1, 1, 1, 1, 1,
-0.3090903, -0.961659, -2.554885, 1, 1, 1, 1, 1,
-0.3057233, -0.1519893, -3.374628, 0, 0, 1, 1, 1,
-0.2968442, 1.350906, 0.6693064, 1, 0, 0, 1, 1,
-0.2959889, 0.772792, -1.748398, 1, 0, 0, 1, 1,
-0.2950571, -1.125382, -2.610346, 1, 0, 0, 1, 1,
-0.2923846, -1.086701, -1.158916, 1, 0, 0, 1, 1,
-0.2892235, 1.412451, 0.1227162, 1, 0, 0, 1, 1,
-0.2869312, -0.5994953, -1.544863, 0, 0, 0, 1, 1,
-0.2849303, 1.245514, -0.7945209, 0, 0, 0, 1, 1,
-0.2847258, -0.1573147, -1.670671, 0, 0, 0, 1, 1,
-0.2827034, -1.161477, -3.412246, 0, 0, 0, 1, 1,
-0.2788774, -0.8665755, -3.343681, 0, 0, 0, 1, 1,
-0.2752734, 0.4865648, -1.657223, 0, 0, 0, 1, 1,
-0.2683084, 1.315919, -0.9159229, 0, 0, 0, 1, 1,
-0.2655169, 0.3838471, -0.7921627, 1, 1, 1, 1, 1,
-0.2641236, -0.1076456, -4.68925, 1, 1, 1, 1, 1,
-0.2632898, 0.6466116, 0.5608164, 1, 1, 1, 1, 1,
-0.2612133, -0.3055257, -2.764585, 1, 1, 1, 1, 1,
-0.2585806, -0.7466492, -0.7186911, 1, 1, 1, 1, 1,
-0.254122, -0.0550579, -1.981003, 1, 1, 1, 1, 1,
-0.2516746, 1.052226, -1.111446, 1, 1, 1, 1, 1,
-0.2507525, 1.796189, 0.2212448, 1, 1, 1, 1, 1,
-0.2469157, -2.126475, -1.952707, 1, 1, 1, 1, 1,
-0.243393, -1.478879, -2.171858, 1, 1, 1, 1, 1,
-0.242474, -0.7080471, -3.030493, 1, 1, 1, 1, 1,
-0.2415237, -0.2641611, -4.226248, 1, 1, 1, 1, 1,
-0.2399487, 0.3230084, -2.432462, 1, 1, 1, 1, 1,
-0.2361155, 0.9949774, 2.696058, 1, 1, 1, 1, 1,
-0.2360035, 0.2015239, -2.104363, 1, 1, 1, 1, 1,
-0.2354645, -0.6720884, -1.634375, 0, 0, 1, 1, 1,
-0.2324256, -0.4693264, -2.411408, 1, 0, 0, 1, 1,
-0.2180228, -1.631104, -3.253068, 1, 0, 0, 1, 1,
-0.2179526, -0.3994194, -4.238218, 1, 0, 0, 1, 1,
-0.2172765, 0.4032368, -1.15918, 1, 0, 0, 1, 1,
-0.2170432, -1.476045, -0.8850154, 1, 0, 0, 1, 1,
-0.2159683, -1.914542, -4.250104, 0, 0, 0, 1, 1,
-0.205791, -0.4194359, -2.075771, 0, 0, 0, 1, 1,
-0.2056011, -0.7092809, -2.426756, 0, 0, 0, 1, 1,
-0.2052716, 1.237329, 0.03948718, 0, 0, 0, 1, 1,
-0.2034891, -0.2719815, -1.751908, 0, 0, 0, 1, 1,
-0.2008688, 0.2693597, 0.007897114, 0, 0, 0, 1, 1,
-0.1989927, 1.138817, 0.4917871, 0, 0, 0, 1, 1,
-0.19881, 0.5383469, -1.157779, 1, 1, 1, 1, 1,
-0.196046, 0.09548263, -2.120461, 1, 1, 1, 1, 1,
-0.1956372, 1.699941, -1.202304, 1, 1, 1, 1, 1,
-0.1915481, -0.4271091, -2.894299, 1, 1, 1, 1, 1,
-0.1854444, -0.6860509, -3.874937, 1, 1, 1, 1, 1,
-0.1727335, -0.7610658, -4.067453, 1, 1, 1, 1, 1,
-0.1667622, 1.441529, -0.2959821, 1, 1, 1, 1, 1,
-0.1644882, -1.845088, -1.562249, 1, 1, 1, 1, 1,
-0.159181, -0.4715155, -1.11941, 1, 1, 1, 1, 1,
-0.1582733, 0.8354686, -1.086014, 1, 1, 1, 1, 1,
-0.1569313, 0.3070888, 0.2545856, 1, 1, 1, 1, 1,
-0.1564149, -1.195744, -4.021527, 1, 1, 1, 1, 1,
-0.1560568, 0.05426478, -1.033071, 1, 1, 1, 1, 1,
-0.1547726, 0.3937545, -0.4536243, 1, 1, 1, 1, 1,
-0.154086, 0.02788578, -0.6259199, 1, 1, 1, 1, 1,
-0.1528799, 0.7684547, 0.7923139, 0, 0, 1, 1, 1,
-0.1519645, -0.6342349, -4.317755, 1, 0, 0, 1, 1,
-0.1518455, 0.05580874, -3.069165, 1, 0, 0, 1, 1,
-0.1513513, 2.696226, 0.728048, 1, 0, 0, 1, 1,
-0.1493326, 1.714182, 0.3523933, 1, 0, 0, 1, 1,
-0.1490973, -0.8033236, -3.586557, 1, 0, 0, 1, 1,
-0.1441155, 0.776889, 0.6917774, 0, 0, 0, 1, 1,
-0.1435351, 0.3565778, -0.9213257, 0, 0, 0, 1, 1,
-0.1408291, 1.349018, 0.3911226, 0, 0, 0, 1, 1,
-0.1358388, 1.120042, -1.580153, 0, 0, 0, 1, 1,
-0.1238585, 0.6536804, 0.1953761, 0, 0, 0, 1, 1,
-0.1198201, -0.4669755, -2.101049, 0, 0, 0, 1, 1,
-0.1195509, 0.8758895, 0.5125753, 0, 0, 0, 1, 1,
-0.1136211, 0.3524514, -0.7832022, 1, 1, 1, 1, 1,
-0.1121705, -0.4385039, -2.0872, 1, 1, 1, 1, 1,
-0.1071858, 0.2290301, -1.215712, 1, 1, 1, 1, 1,
-0.1070171, -1.633678, -3.476605, 1, 1, 1, 1, 1,
-0.1037926, 0.4457805, -0.7067133, 1, 1, 1, 1, 1,
-0.1021942, -1.564371, -1.238334, 1, 1, 1, 1, 1,
-0.09892394, -1.137646, -3.683685, 1, 1, 1, 1, 1,
-0.09339384, -0.1577514, -2.89607, 1, 1, 1, 1, 1,
-0.09151579, -0.1677463, -2.793914, 1, 1, 1, 1, 1,
-0.08980728, -0.1456939, -1.410808, 1, 1, 1, 1, 1,
-0.08782618, -0.02076719, -1.597898, 1, 1, 1, 1, 1,
-0.08579139, 0.7876326, 0.394059, 1, 1, 1, 1, 1,
-0.08380821, -1.893565, -2.726942, 1, 1, 1, 1, 1,
-0.08324442, -0.08866261, -1.954896, 1, 1, 1, 1, 1,
-0.0832109, 0.7999817, 0.5196519, 1, 1, 1, 1, 1,
-0.08311889, -0.5802161, -3.225421, 0, 0, 1, 1, 1,
-0.08216338, -1.65072, -2.523324, 1, 0, 0, 1, 1,
-0.0764628, -1.983219, -1.878695, 1, 0, 0, 1, 1,
-0.07406358, 0.5340053, 0.1640355, 1, 0, 0, 1, 1,
-0.07310899, 3.043927, -0.825541, 1, 0, 0, 1, 1,
-0.07276709, 1.254383, 0.418565, 1, 0, 0, 1, 1,
-0.0710736, -0.4912295, -3.383343, 0, 0, 0, 1, 1,
-0.07059091, 0.6436593, 1.064999, 0, 0, 0, 1, 1,
-0.06211427, -1.057574, -3.420001, 0, 0, 0, 1, 1,
-0.05886979, -0.2054781, -2.115529, 0, 0, 0, 1, 1,
-0.05553601, 1.347299, -0.9116743, 0, 0, 0, 1, 1,
-0.05537136, 0.2171063, 1.332143, 0, 0, 0, 1, 1,
-0.05477293, 2.522022, 1.991252, 0, 0, 0, 1, 1,
-0.05441102, 1.301246, -0.6117933, 1, 1, 1, 1, 1,
-0.05305434, -1.293117, -0.317773, 1, 1, 1, 1, 1,
-0.05294821, 0.8183468, -0.2487054, 1, 1, 1, 1, 1,
-0.05016157, 1.223872, -0.08949852, 1, 1, 1, 1, 1,
-0.04844127, -1.224491, -3.016267, 1, 1, 1, 1, 1,
-0.04370243, 0.9768933, -2.638492, 1, 1, 1, 1, 1,
-0.04336325, 0.1542721, 0.4435577, 1, 1, 1, 1, 1,
-0.03851566, -0.4184401, -3.95508, 1, 1, 1, 1, 1,
-0.03718878, -0.4890037, -2.293673, 1, 1, 1, 1, 1,
-0.03661424, -1.505006, -3.994455, 1, 1, 1, 1, 1,
-0.03432263, -0.4378626, -3.823167, 1, 1, 1, 1, 1,
-0.02916002, 1.355634, 0.1964691, 1, 1, 1, 1, 1,
-0.02341797, 0.3552579, -0.9434232, 1, 1, 1, 1, 1,
-0.01895416, 0.7051827, -2.461495, 1, 1, 1, 1, 1,
-0.01674751, 0.09198516, 0.1773319, 1, 1, 1, 1, 1,
-0.01564551, 0.06752458, -1.374024, 0, 0, 1, 1, 1,
-0.01212911, 0.00903009, -1.733018, 1, 0, 0, 1, 1,
-0.009759921, -2.444548, -4.064585, 1, 0, 0, 1, 1,
-0.007959095, 1.328093, -2.142701, 1, 0, 0, 1, 1,
-0.001884755, 0.5471755, -0.08929246, 1, 0, 0, 1, 1,
-0.001202619, -0.09065616, -2.627839, 1, 0, 0, 1, 1,
0.004494401, 1.268036, -0.2400143, 0, 0, 0, 1, 1,
0.005388398, 1.024659, -1.208081, 0, 0, 0, 1, 1,
0.00632191, -0.06809756, 3.280564, 0, 0, 0, 1, 1,
0.01123309, 0.4149995, 0.2308657, 0, 0, 0, 1, 1,
0.01399335, 0.3712019, 1.102551, 0, 0, 0, 1, 1,
0.01497415, 0.9462326, -0.7396005, 0, 0, 0, 1, 1,
0.01887497, -0.6215299, 3.235353, 0, 0, 0, 1, 1,
0.01949651, 0.8867608, 0.1666402, 1, 1, 1, 1, 1,
0.02017841, 1.374551, -0.5432369, 1, 1, 1, 1, 1,
0.02199196, -0.3890619, 3.515014, 1, 1, 1, 1, 1,
0.02304346, -1.843399, 3.745044, 1, 1, 1, 1, 1,
0.02765961, -1.023267, 1.211076, 1, 1, 1, 1, 1,
0.02868288, -1.442351, 3.231777, 1, 1, 1, 1, 1,
0.02936256, 0.8175949, -0.1976521, 1, 1, 1, 1, 1,
0.03733907, -0.1927505, 2.147901, 1, 1, 1, 1, 1,
0.03998404, -0.5650799, 3.572081, 1, 1, 1, 1, 1,
0.04171741, 1.13485, -0.2119072, 1, 1, 1, 1, 1,
0.04511718, 1.107161, -0.07796095, 1, 1, 1, 1, 1,
0.0505275, -2.373925, 4.265354, 1, 1, 1, 1, 1,
0.06017939, 0.3890982, -0.2267431, 1, 1, 1, 1, 1,
0.06128256, -0.3984993, 2.882413, 1, 1, 1, 1, 1,
0.06293461, 0.03681938, -0.6333618, 1, 1, 1, 1, 1,
0.06622311, -1.324805, 4.470241, 0, 0, 1, 1, 1,
0.06666256, -0.9199587, 3.416981, 1, 0, 0, 1, 1,
0.06666322, -0.6452838, 3.776301, 1, 0, 0, 1, 1,
0.06780271, -1.443753, 4.533232, 1, 0, 0, 1, 1,
0.07030804, -0.3877678, 1.904532, 1, 0, 0, 1, 1,
0.07051259, -0.5888916, 4.561239, 1, 0, 0, 1, 1,
0.07217606, 0.37791, 0.6902478, 0, 0, 0, 1, 1,
0.0733187, 1.252043, -0.1724187, 0, 0, 0, 1, 1,
0.07840308, -0.8802265, 3.529873, 0, 0, 0, 1, 1,
0.08061448, -0.817324, 2.712167, 0, 0, 0, 1, 1,
0.0810504, 0.06501868, 0.1597323, 0, 0, 0, 1, 1,
0.08575714, -0.3684716, 1.899101, 0, 0, 0, 1, 1,
0.08761533, 0.2848465, -0.8791964, 0, 0, 0, 1, 1,
0.08768361, 1.667521, 1.190259, 1, 1, 1, 1, 1,
0.09339051, -0.760699, 3.289619, 1, 1, 1, 1, 1,
0.09534315, -0.1158708, 2.962989, 1, 1, 1, 1, 1,
0.09561734, 0.825963, -1.501664, 1, 1, 1, 1, 1,
0.09710543, 0.3833395, 0.7813982, 1, 1, 1, 1, 1,
0.1059679, -0.8502433, 1.970599, 1, 1, 1, 1, 1,
0.1075133, -0.7423538, 3.564035, 1, 1, 1, 1, 1,
0.1085942, 0.6313615, -0.03983701, 1, 1, 1, 1, 1,
0.1213037, 0.8986787, -0.2856663, 1, 1, 1, 1, 1,
0.1214059, -0.8377181, 3.07801, 1, 1, 1, 1, 1,
0.1225696, -0.0182722, 2.873972, 1, 1, 1, 1, 1,
0.1231118, 0.8239691, -0.04771645, 1, 1, 1, 1, 1,
0.1236472, -1.10898, 2.274192, 1, 1, 1, 1, 1,
0.1262354, -0.09900087, 2.481014, 1, 1, 1, 1, 1,
0.1269075, -1.422617, 2.249319, 1, 1, 1, 1, 1,
0.1303886, -2.096238, 2.142496, 0, 0, 1, 1, 1,
0.1306389, -1.683398, 2.809305, 1, 0, 0, 1, 1,
0.1325489, -0.008392749, 1.867314, 1, 0, 0, 1, 1,
0.1357127, -1.406022, 3.276973, 1, 0, 0, 1, 1,
0.1364991, -0.762279, 2.323702, 1, 0, 0, 1, 1,
0.1400628, -1.659608, 4.116454, 1, 0, 0, 1, 1,
0.1439636, 0.04159791, 1.2699, 0, 0, 0, 1, 1,
0.1455114, 0.09591378, 0.003102826, 0, 0, 0, 1, 1,
0.1495539, -1.038112, 4.017567, 0, 0, 0, 1, 1,
0.1510285, 0.3253418, -0.007538662, 0, 0, 0, 1, 1,
0.1587397, 0.5260054, -1.934723, 0, 0, 0, 1, 1,
0.1610712, -0.09748231, 2.877857, 0, 0, 0, 1, 1,
0.1638853, 1.896375, 0.3735521, 0, 0, 0, 1, 1,
0.1672737, -0.2194398, 3.780784, 1, 1, 1, 1, 1,
0.1689654, -0.6242401, 2.982623, 1, 1, 1, 1, 1,
0.1695172, 2.124246, 0.04302609, 1, 1, 1, 1, 1,
0.1700494, -0.9303099, 3.919491, 1, 1, 1, 1, 1,
0.1719473, 1.239568, -0.3781399, 1, 1, 1, 1, 1,
0.172352, -0.4147252, 3.86865, 1, 1, 1, 1, 1,
0.1728539, 0.7806287, 0.3920673, 1, 1, 1, 1, 1,
0.1744896, 0.5505607, 0.2112673, 1, 1, 1, 1, 1,
0.1768056, 0.5383304, 0.7270268, 1, 1, 1, 1, 1,
0.1782228, 1.594738, 0.9834985, 1, 1, 1, 1, 1,
0.1798915, -0.2545386, 1.575417, 1, 1, 1, 1, 1,
0.1849155, 1.187764, 0.4694999, 1, 1, 1, 1, 1,
0.1872144, 0.3828391, 1.516403, 1, 1, 1, 1, 1,
0.1937051, -1.668045, 1.367358, 1, 1, 1, 1, 1,
0.1965514, 1.416234, 0.5275213, 1, 1, 1, 1, 1,
0.1971978, 1.241675, -0.1145741, 0, 0, 1, 1, 1,
0.2047138, -1.03704, 2.880016, 1, 0, 0, 1, 1,
0.2060589, -1.113389, 3.727155, 1, 0, 0, 1, 1,
0.2097552, 0.394304, -2.139124, 1, 0, 0, 1, 1,
0.2139328, -0.6541807, 3.040641, 1, 0, 0, 1, 1,
0.216425, 0.1225732, 0.4134984, 1, 0, 0, 1, 1,
0.2165885, -0.998509, 2.675105, 0, 0, 0, 1, 1,
0.2172487, -1.898965, 3.979898, 0, 0, 0, 1, 1,
0.2181855, -0.2802176, 2.875849, 0, 0, 0, 1, 1,
0.2211349, -0.2800567, 1.359833, 0, 0, 0, 1, 1,
0.2216589, 0.04005362, 1.215395, 0, 0, 0, 1, 1,
0.2256389, 0.486729, 1.135649, 0, 0, 0, 1, 1,
0.2272461, -0.4548062, 2.273273, 0, 0, 0, 1, 1,
0.2276051, -1.811448, 3.735688, 1, 1, 1, 1, 1,
0.2291493, -0.879809, 3.030004, 1, 1, 1, 1, 1,
0.2341197, -1.2615, 1.67636, 1, 1, 1, 1, 1,
0.2344616, 0.05625692, 0.2961482, 1, 1, 1, 1, 1,
0.2348788, 0.9865298, 0.4774499, 1, 1, 1, 1, 1,
0.2376427, 0.4736197, 0.08989248, 1, 1, 1, 1, 1,
0.2393128, -0.06799679, 1.865832, 1, 1, 1, 1, 1,
0.2407377, 0.6727695, 0.01242303, 1, 1, 1, 1, 1,
0.2420568, -0.9372564, 3.244218, 1, 1, 1, 1, 1,
0.2423943, -0.452842, 1.449033, 1, 1, 1, 1, 1,
0.2436653, -0.2158609, 1.556769, 1, 1, 1, 1, 1,
0.251287, -0.6755376, 3.315462, 1, 1, 1, 1, 1,
0.2546683, -0.8142942, 1.485677, 1, 1, 1, 1, 1,
0.2551296, -1.038454, 2.994874, 1, 1, 1, 1, 1,
0.2594029, -0.6342639, 2.089607, 1, 1, 1, 1, 1,
0.2605859, -0.7576657, 3.590883, 0, 0, 1, 1, 1,
0.2622741, 0.3089682, 2.579556, 1, 0, 0, 1, 1,
0.2668763, 0.9176915, 0.06052857, 1, 0, 0, 1, 1,
0.2676801, 1.993743, 0.8681179, 1, 0, 0, 1, 1,
0.2712165, 0.003720779, 1.991369, 1, 0, 0, 1, 1,
0.2734631, -1.029544, 1.683292, 1, 0, 0, 1, 1,
0.2734877, -0.5788121, 3.345813, 0, 0, 0, 1, 1,
0.2763968, 0.02899171, 3.016518, 0, 0, 0, 1, 1,
0.2765976, 1.434611, 0.1593683, 0, 0, 0, 1, 1,
0.277133, 0.6109349, 2.161587, 0, 0, 0, 1, 1,
0.2789416, 0.7911441, 1.596738, 0, 0, 0, 1, 1,
0.2790259, 0.3498474, 1.540525, 0, 0, 0, 1, 1,
0.2804162, -0.08209514, -0.1280172, 0, 0, 0, 1, 1,
0.280468, 2.091786, 0.4683857, 1, 1, 1, 1, 1,
0.2831042, -1.446527, 2.473943, 1, 1, 1, 1, 1,
0.2836463, -2.085016, 3.402162, 1, 1, 1, 1, 1,
0.2836602, -0.6075637, 2.438073, 1, 1, 1, 1, 1,
0.2837875, -0.6262518, 3.184968, 1, 1, 1, 1, 1,
0.284568, 0.6406271, 0.4567269, 1, 1, 1, 1, 1,
0.2867633, 1.672941, 0.3828227, 1, 1, 1, 1, 1,
0.287771, -2.286363, 2.390465, 1, 1, 1, 1, 1,
0.288453, -0.6465283, 4.698465, 1, 1, 1, 1, 1,
0.2912777, -1.676255, 4.274059, 1, 1, 1, 1, 1,
0.2981576, 0.7935596, 1.468606, 1, 1, 1, 1, 1,
0.3010715, -1.122447, 3.6064, 1, 1, 1, 1, 1,
0.3083099, -0.8929754, 3.036073, 1, 1, 1, 1, 1,
0.3155166, -0.7380124, 3.244488, 1, 1, 1, 1, 1,
0.316742, -0.3208153, 1.864581, 1, 1, 1, 1, 1,
0.3167546, -0.8892614, 3.943467, 0, 0, 1, 1, 1,
0.3170117, 0.1344819, 2.195456, 1, 0, 0, 1, 1,
0.3217837, 0.9890067, -0.5031869, 1, 0, 0, 1, 1,
0.3226641, -1.005867, 3.632395, 1, 0, 0, 1, 1,
0.3236407, -0.9964535, 3.21734, 1, 0, 0, 1, 1,
0.3256814, -0.5648633, 1.62404, 1, 0, 0, 1, 1,
0.3272845, -0.504232, 4.333087, 0, 0, 0, 1, 1,
0.3344371, -1.078098, 2.237906, 0, 0, 0, 1, 1,
0.337678, -0.226704, 2.164795, 0, 0, 0, 1, 1,
0.3380366, -0.3022015, 3.176762, 0, 0, 0, 1, 1,
0.3387814, 0.2274353, 1.758447, 0, 0, 0, 1, 1,
0.3458523, -1.238625, 3.565994, 0, 0, 0, 1, 1,
0.3465272, 1.611216, -0.8668354, 0, 0, 0, 1, 1,
0.3467712, 1.24164, 0.9560997, 1, 1, 1, 1, 1,
0.3503006, -0.4279844, 1.856828, 1, 1, 1, 1, 1,
0.3511998, -0.1225849, 2.273016, 1, 1, 1, 1, 1,
0.3513243, 1.029141, 2.318711, 1, 1, 1, 1, 1,
0.3550579, -0.6707817, 3.403134, 1, 1, 1, 1, 1,
0.359478, 0.5635321, 0.6858752, 1, 1, 1, 1, 1,
0.3614133, -0.7655845, 3.313992, 1, 1, 1, 1, 1,
0.3642659, 0.08117694, 1.543523, 1, 1, 1, 1, 1,
0.3714699, 0.187531, 2.120291, 1, 1, 1, 1, 1,
0.375512, 0.1209667, 0.243803, 1, 1, 1, 1, 1,
0.377601, -0.3591456, 4.063501, 1, 1, 1, 1, 1,
0.3801191, -1.005184, 2.844662, 1, 1, 1, 1, 1,
0.3818589, -0.7991044, 4.976377, 1, 1, 1, 1, 1,
0.3861343, -0.9773368, 1.574014, 1, 1, 1, 1, 1,
0.3870554, 0.9424079, -1.237532, 1, 1, 1, 1, 1,
0.3950892, 0.2090513, -0.3191203, 0, 0, 1, 1, 1,
0.4010163, 0.2671292, 2.41746, 1, 0, 0, 1, 1,
0.4019689, 0.8765873, -0.7116563, 1, 0, 0, 1, 1,
0.4078932, -0.7458054, 1.397775, 1, 0, 0, 1, 1,
0.4090404, -1.336006, 3.109105, 1, 0, 0, 1, 1,
0.4102798, 0.2937074, 1.859195, 1, 0, 0, 1, 1,
0.4166553, -0.06033958, 2.39149, 0, 0, 0, 1, 1,
0.4171019, -1.127367, 3.110716, 0, 0, 0, 1, 1,
0.42281, -0.04684857, 1.061258, 0, 0, 0, 1, 1,
0.4243433, 0.1804039, 1.005713, 0, 0, 0, 1, 1,
0.4244254, -1.294341, 3.035079, 0, 0, 0, 1, 1,
0.4245088, 0.6894205, 0.8168313, 0, 0, 0, 1, 1,
0.4348064, -0.3818475, 1.381084, 0, 0, 0, 1, 1,
0.4362456, -1.480734, 3.519489, 1, 1, 1, 1, 1,
0.4407034, -0.4371757, 0.6682083, 1, 1, 1, 1, 1,
0.4429626, 0.6661054, 1.00824, 1, 1, 1, 1, 1,
0.4429739, -1.685309, 2.899371, 1, 1, 1, 1, 1,
0.4452088, -0.2802476, 2.968657, 1, 1, 1, 1, 1,
0.4547419, -1.130746, 3.913189, 1, 1, 1, 1, 1,
0.4590957, -0.1374642, 0.7262837, 1, 1, 1, 1, 1,
0.4647228, -0.9635342, 3.433738, 1, 1, 1, 1, 1,
0.4679334, -1.402561, 4.55823, 1, 1, 1, 1, 1,
0.470768, -0.6673056, 0.9242569, 1, 1, 1, 1, 1,
0.4742725, 1.062767, -0.4772192, 1, 1, 1, 1, 1,
0.4764424, 0.2354857, 1.826741, 1, 1, 1, 1, 1,
0.476604, -1.602742, 2.541889, 1, 1, 1, 1, 1,
0.4810309, 0.5492787, -0.5165557, 1, 1, 1, 1, 1,
0.483796, -0.5171376, 2.086743, 1, 1, 1, 1, 1,
0.4878053, 0.4322754, 0.8793885, 0, 0, 1, 1, 1,
0.4945816, -1.100317, 1.637753, 1, 0, 0, 1, 1,
0.4988406, -0.7459753, 3.700132, 1, 0, 0, 1, 1,
0.4997821, -0.3502106, 2.231395, 1, 0, 0, 1, 1,
0.5057397, 0.05398564, 2.257371, 1, 0, 0, 1, 1,
0.5076984, -0.03643272, 1.688854, 1, 0, 0, 1, 1,
0.5098845, 2.261058, 0.2591849, 0, 0, 0, 1, 1,
0.5118675, 2.746912, -0.5647191, 0, 0, 0, 1, 1,
0.5159463, 0.4535227, 1.246795, 0, 0, 0, 1, 1,
0.5210478, 1.327824, 1.105918, 0, 0, 0, 1, 1,
0.5217007, -1.702701, 3.743017, 0, 0, 0, 1, 1,
0.5265021, 0.07937082, 0.5329235, 0, 0, 0, 1, 1,
0.5269234, -0.5187435, 4.146962, 0, 0, 0, 1, 1,
0.527692, -0.622747, 3.232415, 1, 1, 1, 1, 1,
0.5345033, -0.3717544, 0.7151821, 1, 1, 1, 1, 1,
0.5367234, -0.2701684, 2.23158, 1, 1, 1, 1, 1,
0.5378948, -0.2208018, 2.352094, 1, 1, 1, 1, 1,
0.5411555, -0.5037614, 4.412393, 1, 1, 1, 1, 1,
0.5412278, -1.261711, 0.8915826, 1, 1, 1, 1, 1,
0.5439041, -0.5754946, 1.968107, 1, 1, 1, 1, 1,
0.5440004, 0.6189435, 1.536879, 1, 1, 1, 1, 1,
0.5537978, 0.172872, 1.057992, 1, 1, 1, 1, 1,
0.5578883, -1.834154, 5.207647, 1, 1, 1, 1, 1,
0.5597209, 0.4313847, 1.205748, 1, 1, 1, 1, 1,
0.5608261, -0.8914106, 2.686197, 1, 1, 1, 1, 1,
0.56186, 0.6276057, 1.057693, 1, 1, 1, 1, 1,
0.5655938, 0.9064004, -1.303778, 1, 1, 1, 1, 1,
0.5677664, -0.3769388, 1.404805, 1, 1, 1, 1, 1,
0.5708832, 0.5256251, 2.04284, 0, 0, 1, 1, 1,
0.5752231, -1.477354, 2.64452, 1, 0, 0, 1, 1,
0.5764714, 0.8394852, 0.8126764, 1, 0, 0, 1, 1,
0.5783046, 0.4749165, -0.1078292, 1, 0, 0, 1, 1,
0.579888, 1.429467, 1.993378, 1, 0, 0, 1, 1,
0.582306, -0.005618803, 1.505223, 1, 0, 0, 1, 1,
0.5851572, 0.2611854, 2.433819, 0, 0, 0, 1, 1,
0.5886624, -1.254951, 2.598154, 0, 0, 0, 1, 1,
0.5945151, -1.905737, 3.301653, 0, 0, 0, 1, 1,
0.5961065, -0.414443, 1.736334, 0, 0, 0, 1, 1,
0.5978111, -0.09314493, 1.04811, 0, 0, 0, 1, 1,
0.6023367, 0.8555474, -0.3431019, 0, 0, 0, 1, 1,
0.6033015, -1.064643, 2.133241, 0, 0, 0, 1, 1,
0.610536, 0.1229473, 2.034842, 1, 1, 1, 1, 1,
0.6139913, -0.3436283, 1.970806, 1, 1, 1, 1, 1,
0.6297707, -0.02646821, 2.749148, 1, 1, 1, 1, 1,
0.6416661, -0.450612, 2.463637, 1, 1, 1, 1, 1,
0.6636752, -0.5421679, 2.500854, 1, 1, 1, 1, 1,
0.664615, 0.0330174, 0.9181774, 1, 1, 1, 1, 1,
0.6696514, -0.0542364, 2.723941, 1, 1, 1, 1, 1,
0.6700213, 0.3417464, 0.389122, 1, 1, 1, 1, 1,
0.6709524, -0.56774, 1.48519, 1, 1, 1, 1, 1,
0.6796189, -0.01659564, -0.04318292, 1, 1, 1, 1, 1,
0.6876068, 2.001913, 0.8368762, 1, 1, 1, 1, 1,
0.6946917, -0.1584328, 3.256897, 1, 1, 1, 1, 1,
0.7011915, -0.7680776, 3.670088, 1, 1, 1, 1, 1,
0.7017915, 0.0646587, 0.9219035, 1, 1, 1, 1, 1,
0.702703, 0.4583507, 0.6913829, 1, 1, 1, 1, 1,
0.7137634, 1.125439, 1.543315, 0, 0, 1, 1, 1,
0.7137854, -0.005875155, 1.636959, 1, 0, 0, 1, 1,
0.7173184, -0.5167195, 2.648015, 1, 0, 0, 1, 1,
0.7191413, 2.248885, 0.9928185, 1, 0, 0, 1, 1,
0.7192115, -0.9805502, 0.9378022, 1, 0, 0, 1, 1,
0.7203677, 0.1288873, 1.35387, 1, 0, 0, 1, 1,
0.7242519, -0.7781206, 1.350691, 0, 0, 0, 1, 1,
0.7256843, -0.7007184, 2.426052, 0, 0, 0, 1, 1,
0.7315739, -0.4838494, 2.768399, 0, 0, 0, 1, 1,
0.7317418, -1.919299, 2.076183, 0, 0, 0, 1, 1,
0.7331449, 0.1830165, 1.496543, 0, 0, 0, 1, 1,
0.7367071, 1.828101, 0.1474452, 0, 0, 0, 1, 1,
0.7404729, -0.7356286, 1.781712, 0, 0, 0, 1, 1,
0.7410844, 0.7020121, 1.532969, 1, 1, 1, 1, 1,
0.7412274, -0.2813007, 2.042689, 1, 1, 1, 1, 1,
0.7428439, 0.1941333, -0.2567858, 1, 1, 1, 1, 1,
0.7459318, 0.4707411, 0.01551766, 1, 1, 1, 1, 1,
0.7472513, -0.4020598, 0.979381, 1, 1, 1, 1, 1,
0.7477401, 0.2936192, 1.627558, 1, 1, 1, 1, 1,
0.748528, -0.9039048, 2.653065, 1, 1, 1, 1, 1,
0.7492003, -0.7723765, 0.7948717, 1, 1, 1, 1, 1,
0.7518214, 0.3764836, 0.02158694, 1, 1, 1, 1, 1,
0.7529373, 0.3238752, 1.963267, 1, 1, 1, 1, 1,
0.7542654, 0.36673, 1.667148, 1, 1, 1, 1, 1,
0.7573951, -0.322324, 1.767108, 1, 1, 1, 1, 1,
0.7687422, 0.5088241, 1.403332, 1, 1, 1, 1, 1,
0.7772642, 0.1290023, 1.386139, 1, 1, 1, 1, 1,
0.7802715, 0.09548485, 2.34421, 1, 1, 1, 1, 1,
0.7843033, 0.2765788, 1.386568, 0, 0, 1, 1, 1,
0.7868751, 0.03187909, 3.512324, 1, 0, 0, 1, 1,
0.7880048, -1.005579, 1.858701, 1, 0, 0, 1, 1,
0.7882907, 1.366692, -0.08194549, 1, 0, 0, 1, 1,
0.7922924, -0.8085675, 1.031999, 1, 0, 0, 1, 1,
0.7938874, -0.294304, 2.002668, 1, 0, 0, 1, 1,
0.7992659, 2.668688, -0.2807981, 0, 0, 0, 1, 1,
0.8073753, -2.526352, 0.7332449, 0, 0, 0, 1, 1,
0.8074838, -0.709159, 3.605896, 0, 0, 0, 1, 1,
0.8088008, 0.8556448, -0.4126965, 0, 0, 0, 1, 1,
0.8107463, 2.123945, 1.437067, 0, 0, 0, 1, 1,
0.8115172, 0.1055173, -0.3557382, 0, 0, 0, 1, 1,
0.8130118, -0.390077, 1.638018, 0, 0, 0, 1, 1,
0.8173929, -0.2840042, 1.252623, 1, 1, 1, 1, 1,
0.8219174, -1.486978, 1.620392, 1, 1, 1, 1, 1,
0.8227243, -0.7208888, 3.441626, 1, 1, 1, 1, 1,
0.8243852, 0.8697028, 0.101056, 1, 1, 1, 1, 1,
0.8278283, -0.455588, 2.028659, 1, 1, 1, 1, 1,
0.8279073, -0.4294021, 1.452261, 1, 1, 1, 1, 1,
0.8346862, 2.101445, 0.4704971, 1, 1, 1, 1, 1,
0.8447556, 0.03682033, 2.346283, 1, 1, 1, 1, 1,
0.8502454, 0.2920798, 1.367672, 1, 1, 1, 1, 1,
0.8557564, -0.3319594, 1.176994, 1, 1, 1, 1, 1,
0.8567463, 0.8944537, -0.3412596, 1, 1, 1, 1, 1,
0.8568181, -0.6629652, 2.151494, 1, 1, 1, 1, 1,
0.8573974, 1.634381, -0.02745849, 1, 1, 1, 1, 1,
0.8621356, 0.8200203, 1.357688, 1, 1, 1, 1, 1,
0.8642412, -0.974309, -0.1412667, 1, 1, 1, 1, 1,
0.8657711, -0.1873978, 2.081281, 0, 0, 1, 1, 1,
0.8685865, -0.5292898, 3.123313, 1, 0, 0, 1, 1,
0.8712238, 0.381779, 1.239658, 1, 0, 0, 1, 1,
0.8714783, -2.140487, 3.026435, 1, 0, 0, 1, 1,
0.8739818, -0.4406479, 1.690308, 1, 0, 0, 1, 1,
0.8762422, 0.1331784, 1.003607, 1, 0, 0, 1, 1,
0.8789076, -0.26696, 1.862754, 0, 0, 0, 1, 1,
0.8831227, 2.928041, 1.18099, 0, 0, 0, 1, 1,
0.8891606, 1.05602, 1.59994, 0, 0, 0, 1, 1,
0.890942, 0.4614863, 1.478459, 0, 0, 0, 1, 1,
0.8939965, -1.488367, 2.583903, 0, 0, 0, 1, 1,
0.8973439, -0.8439793, 1.993157, 0, 0, 0, 1, 1,
0.8986346, -0.2608101, 3.014637, 0, 0, 0, 1, 1,
0.9077961, 0.7269461, 1.691279, 1, 1, 1, 1, 1,
0.910251, -0.8968148, 1.982152, 1, 1, 1, 1, 1,
0.9175819, -1.520936, 2.292072, 1, 1, 1, 1, 1,
0.9224421, 0.4105533, -0.7161757, 1, 1, 1, 1, 1,
0.9294746, -1.36724, 3.760751, 1, 1, 1, 1, 1,
0.9322695, -0.4310687, 2.995078, 1, 1, 1, 1, 1,
0.9374257, -0.521547, 1.717117, 1, 1, 1, 1, 1,
0.9404981, -0.08955169, 1.088332, 1, 1, 1, 1, 1,
0.9432706, 0.1902985, 3.157287, 1, 1, 1, 1, 1,
0.9546986, -0.4342779, 1.070427, 1, 1, 1, 1, 1,
0.9578499, -0.8229762, 2.253057, 1, 1, 1, 1, 1,
0.9587078, 0.2016669, -0.8811682, 1, 1, 1, 1, 1,
0.9600484, 1.769793, 2.384541, 1, 1, 1, 1, 1,
0.9603059, -1.404953, 1.797478, 1, 1, 1, 1, 1,
0.9614065, -0.2949651, 1.50363, 1, 1, 1, 1, 1,
0.9675693, 1.140748, 0.5420167, 0, 0, 1, 1, 1,
0.9697056, 1.491815, 1.040658, 1, 0, 0, 1, 1,
0.9705076, 1.35483, 1.794488, 1, 0, 0, 1, 1,
0.9762549, -0.5311483, 0.6419436, 1, 0, 0, 1, 1,
0.9847375, 0.3657863, 1.213924, 1, 0, 0, 1, 1,
0.9847708, 0.7782078, 1.361453, 1, 0, 0, 1, 1,
0.9859634, -0.3127148, 2.513375, 0, 0, 0, 1, 1,
0.9889147, -0.7381918, 1.986312, 0, 0, 0, 1, 1,
0.9940109, -1.899739, 4.658945, 0, 0, 0, 1, 1,
0.9951258, 1.314546, -0.8204412, 0, 0, 0, 1, 1,
0.9971131, -1.461272, 1.788502, 0, 0, 0, 1, 1,
1.002076, 1.245789, 1.952204, 0, 0, 0, 1, 1,
1.007794, 0.1554608, 1.923719, 0, 0, 0, 1, 1,
1.008569, 0.1580805, 3.375899, 1, 1, 1, 1, 1,
1.011563, 0.678982, 0.2104151, 1, 1, 1, 1, 1,
1.011795, 0.7621915, 2.196678, 1, 1, 1, 1, 1,
1.013012, -1.350456, 4.178752, 1, 1, 1, 1, 1,
1.019917, 0.6677341, 1.299059, 1, 1, 1, 1, 1,
1.020413, -0.2314096, 2.104355, 1, 1, 1, 1, 1,
1.022457, 1.73094, 2.892327, 1, 1, 1, 1, 1,
1.022522, -0.9044105, 2.07866, 1, 1, 1, 1, 1,
1.028303, 1.001984, 0.7509708, 1, 1, 1, 1, 1,
1.029567, -1.574406, 3.087727, 1, 1, 1, 1, 1,
1.029744, 0.7220427, 0.8531569, 1, 1, 1, 1, 1,
1.031445, -1.308116, 2.967982, 1, 1, 1, 1, 1,
1.032217, 0.2883456, 1.840709, 1, 1, 1, 1, 1,
1.033659, 1.391513, -1.058737, 1, 1, 1, 1, 1,
1.034539, -0.5610746, 2.417836, 1, 1, 1, 1, 1,
1.03741, -1.267079, 3.991087, 0, 0, 1, 1, 1,
1.042744, -0.8597711, 1.324074, 1, 0, 0, 1, 1,
1.047845, -0.3445053, -0.03793278, 1, 0, 0, 1, 1,
1.048293, 0.3250342, 0.9465137, 1, 0, 0, 1, 1,
1.052121, 0.7451394, 2.565459, 1, 0, 0, 1, 1,
1.053674, -0.2463899, 0.8081505, 1, 0, 0, 1, 1,
1.058611, 2.027645, -1.512945, 0, 0, 0, 1, 1,
1.06365, -1.107846, 2.743978, 0, 0, 0, 1, 1,
1.07054, 1.18678, -0.1417352, 0, 0, 0, 1, 1,
1.072947, 1.844963, 0.5072492, 0, 0, 0, 1, 1,
1.073076, 1.454717, 1.123404, 0, 0, 0, 1, 1,
1.080424, -2.249722, 2.191813, 0, 0, 0, 1, 1,
1.081724, 1.279173, 0.8143842, 0, 0, 0, 1, 1,
1.081879, 0.65333, 0.4363391, 1, 1, 1, 1, 1,
1.082007, -0.6604528, 1.697191, 1, 1, 1, 1, 1,
1.083688, -1.845649, 2.953624, 1, 1, 1, 1, 1,
1.08687, 0.303403, 1.475496, 1, 1, 1, 1, 1,
1.091823, -0.914955, 1.867398, 1, 1, 1, 1, 1,
1.094713, 0.9068986, 0.3601253, 1, 1, 1, 1, 1,
1.098469, -0.7798671, 2.819777, 1, 1, 1, 1, 1,
1.099933, -0.7940567, 3.316624, 1, 1, 1, 1, 1,
1.100838, -0.4662814, 1.858792, 1, 1, 1, 1, 1,
1.103761, -0.5758733, 1.134427, 1, 1, 1, 1, 1,
1.115695, -0.9176726, 1.687758, 1, 1, 1, 1, 1,
1.121732, 1.687112, 3.241742, 1, 1, 1, 1, 1,
1.122526, -0.3401247, 1.393835, 1, 1, 1, 1, 1,
1.127439, -0.8725341, 2.23875, 1, 1, 1, 1, 1,
1.135908, -1.065541, 0.6337595, 1, 1, 1, 1, 1,
1.136195, -0.4069558, 2.682165, 0, 0, 1, 1, 1,
1.140062, 0.7997783, 0.215317, 1, 0, 0, 1, 1,
1.1404, -2.692568, 0.6908064, 1, 0, 0, 1, 1,
1.140833, -1.181165, -0.1670865, 1, 0, 0, 1, 1,
1.14828, 0.1767579, 2.054246, 1, 0, 0, 1, 1,
1.14988, -1.205377, 2.877761, 1, 0, 0, 1, 1,
1.152289, 1.104158, 0.3841727, 0, 0, 0, 1, 1,
1.154884, -0.3188974, 3.974076, 0, 0, 0, 1, 1,
1.156357, -0.07573094, 2.02492, 0, 0, 0, 1, 1,
1.1592, -0.3111883, 1.680376, 0, 0, 0, 1, 1,
1.177315, -1.018152, 1.415475, 0, 0, 0, 1, 1,
1.178913, -0.8303949, 1.780995, 0, 0, 0, 1, 1,
1.187804, -0.7212039, 2.831317, 0, 0, 0, 1, 1,
1.189876, 0.6712794, 0.1588395, 1, 1, 1, 1, 1,
1.194636, 2.190112, -0.9456786, 1, 1, 1, 1, 1,
1.197405, -0.07018652, 0.4096238, 1, 1, 1, 1, 1,
1.199645, -0.01669922, 2.652463, 1, 1, 1, 1, 1,
1.206629, 0.9835353, 0.6946045, 1, 1, 1, 1, 1,
1.211291, 0.423715, 1.418404, 1, 1, 1, 1, 1,
1.213029, -0.9020848, 3.088074, 1, 1, 1, 1, 1,
1.213703, 0.9725811, 0.1390551, 1, 1, 1, 1, 1,
1.232857, 0.1993041, 1.135669, 1, 1, 1, 1, 1,
1.232921, -0.5577881, 0.432598, 1, 1, 1, 1, 1,
1.233856, -0.167018, 1.936705, 1, 1, 1, 1, 1,
1.243001, -0.2199054, 1.148195, 1, 1, 1, 1, 1,
1.252437, -0.1401399, 3.318988, 1, 1, 1, 1, 1,
1.260147, -1.203605, 1.273508, 1, 1, 1, 1, 1,
1.269939, -0.9574367, 1.496308, 1, 1, 1, 1, 1,
1.283093, -1.059154, 2.025341, 0, 0, 1, 1, 1,
1.285964, -0.2421493, 0.2728345, 1, 0, 0, 1, 1,
1.287925, -0.4958233, 1.198905, 1, 0, 0, 1, 1,
1.29196, -0.2487071, 1.304033, 1, 0, 0, 1, 1,
1.30453, 0.1873188, 2.716292, 1, 0, 0, 1, 1,
1.311701, 0.8439282, 0.7997063, 1, 0, 0, 1, 1,
1.313749, 0.8401584, 1.150393, 0, 0, 0, 1, 1,
1.315361, -0.04949755, 0.5488762, 0, 0, 0, 1, 1,
1.319553, 0.06320234, 0.6750474, 0, 0, 0, 1, 1,
1.332472, 0.2956045, 2.69528, 0, 0, 0, 1, 1,
1.334947, 1.253519, 1.250661, 0, 0, 0, 1, 1,
1.343978, 0.5362713, 3.009516, 0, 0, 0, 1, 1,
1.344392, 0.20919, 1.403751, 0, 0, 0, 1, 1,
1.355383, -1.743769, 2.000305, 1, 1, 1, 1, 1,
1.370707, -0.0475587, 0.6933286, 1, 1, 1, 1, 1,
1.370968, -0.7298772, 1.531741, 1, 1, 1, 1, 1,
1.378206, -0.485018, 1.756206, 1, 1, 1, 1, 1,
1.379934, -2.020135, 0.9792016, 1, 1, 1, 1, 1,
1.386659, -1.853342, 3.991349, 1, 1, 1, 1, 1,
1.38966, -1.584844, 3.216347, 1, 1, 1, 1, 1,
1.406047, 0.0919252, 2.162829, 1, 1, 1, 1, 1,
1.410705, 0.6781882, 1.845362, 1, 1, 1, 1, 1,
1.426811, 1.512942, 1.978929, 1, 1, 1, 1, 1,
1.431999, 0.005641494, 3.258323, 1, 1, 1, 1, 1,
1.434054, -1.245421, 2.81058, 1, 1, 1, 1, 1,
1.438308, -0.1148645, 2.492681, 1, 1, 1, 1, 1,
1.443438, -0.7211064, 2.385616, 1, 1, 1, 1, 1,
1.454764, 0.001416775, 2.681884, 1, 1, 1, 1, 1,
1.462076, 0.1588551, 3.070417, 0, 0, 1, 1, 1,
1.464004, 0.4357355, 1.966267, 1, 0, 0, 1, 1,
1.465266, 0.1525306, 1.766777, 1, 0, 0, 1, 1,
1.465873, -0.2200836, 2.033006, 1, 0, 0, 1, 1,
1.495299, -0.6886928, 1.106887, 1, 0, 0, 1, 1,
1.506265, -2.615053, 2.141077, 1, 0, 0, 1, 1,
1.509025, -1.255515, 2.23103, 0, 0, 0, 1, 1,
1.510882, -0.7062699, 3.194074, 0, 0, 0, 1, 1,
1.516617, 0.3068241, 1.319353, 0, 0, 0, 1, 1,
1.520812, -0.4262806, 0.9406105, 0, 0, 0, 1, 1,
1.521051, -1.349584, 0.9492881, 0, 0, 0, 1, 1,
1.522541, -0.5089254, 2.70104, 0, 0, 0, 1, 1,
1.523897, -0.004343015, 0.677, 0, 0, 0, 1, 1,
1.527242, 0.6199609, 1.084012, 1, 1, 1, 1, 1,
1.542616, 0.7197639, 1.666426, 1, 1, 1, 1, 1,
1.545992, 0.06020783, 0.9587028, 1, 1, 1, 1, 1,
1.554374, 0.9898562, 1.502689, 1, 1, 1, 1, 1,
1.582139, -1.187009, 3.995136, 1, 1, 1, 1, 1,
1.622204, -1.706967, 2.195691, 1, 1, 1, 1, 1,
1.63747, -1.475636, 3.327948, 1, 1, 1, 1, 1,
1.683813, -0.1524303, 1.403799, 1, 1, 1, 1, 1,
1.686558, -0.5602167, 0.6609462, 1, 1, 1, 1, 1,
1.6933, 1.04692, 0.9899835, 1, 1, 1, 1, 1,
1.700394, 0.2422133, 2.429228, 1, 1, 1, 1, 1,
1.706646, -0.4455076, 1.436043, 1, 1, 1, 1, 1,
1.70877, 1.724534, -0.4676346, 1, 1, 1, 1, 1,
1.711883, 1.340448, 2.435015, 1, 1, 1, 1, 1,
1.719321, 0.3071811, 1.296522, 1, 1, 1, 1, 1,
1.727279, 0.1044178, -0.04181978, 0, 0, 1, 1, 1,
1.73554, 0.08083566, 1.314166, 1, 0, 0, 1, 1,
1.740874, 0.1059654, 0.04895531, 1, 0, 0, 1, 1,
1.74446, 1.594552, 1.275187, 1, 0, 0, 1, 1,
1.767575, -1.793529, 3.369166, 1, 0, 0, 1, 1,
1.774408, -0.537857, 2.357999, 1, 0, 0, 1, 1,
1.77463, 1.916652, 0.3709947, 0, 0, 0, 1, 1,
1.812928, 1.346542, -0.7633803, 0, 0, 0, 1, 1,
1.823644, 0.2641863, 0.3706614, 0, 0, 0, 1, 1,
1.823729, 0.8292058, 1.30815, 0, 0, 0, 1, 1,
1.824896, 0.9753132, -0.05355326, 0, 0, 0, 1, 1,
1.829745, 0.3508801, 1.732517, 0, 0, 0, 1, 1,
1.830059, 0.02005806, 2.111788, 0, 0, 0, 1, 1,
1.833949, 1.061122, 2.673455, 1, 1, 1, 1, 1,
1.854154, -1.004008, 2.728029, 1, 1, 1, 1, 1,
1.876206, 0.5555715, 1.124312, 1, 1, 1, 1, 1,
1.882547, -1.015401, 2.085345, 1, 1, 1, 1, 1,
1.888, -0.704906, 3.80258, 1, 1, 1, 1, 1,
1.895571, 0.2440226, 1.855029, 1, 1, 1, 1, 1,
1.899063, 1.734374, -0.159444, 1, 1, 1, 1, 1,
1.9016, -0.3808866, 1.279448, 1, 1, 1, 1, 1,
1.909537, -0.202267, -0.6110022, 1, 1, 1, 1, 1,
1.918536, 0.0346806, 2.119621, 1, 1, 1, 1, 1,
1.921436, -1.068794, 2.664392, 1, 1, 1, 1, 1,
1.952177, 1.011664, 0.8548573, 1, 1, 1, 1, 1,
1.992595, 1.459289, 0.5380743, 1, 1, 1, 1, 1,
2.016218, 0.1729106, 0.6523892, 1, 1, 1, 1, 1,
2.059009, -2.392619, 1.011456, 1, 1, 1, 1, 1,
2.065698, 1.758958, 1.8289, 0, 0, 1, 1, 1,
2.120147, 0.06610799, 2.221213, 1, 0, 0, 1, 1,
2.132482, -0.2930531, 0.7255979, 1, 0, 0, 1, 1,
2.136312, -0.1570279, 1.252383, 1, 0, 0, 1, 1,
2.139364, 1.291305, 0.6241956, 1, 0, 0, 1, 1,
2.14734, 0.5530686, 1.215168, 1, 0, 0, 1, 1,
2.166001, 1.677628, 2.603818, 0, 0, 0, 1, 1,
2.182094, 1.779912, -1.816923, 0, 0, 0, 1, 1,
2.186704, -0.3278428, 1.668214, 0, 0, 0, 1, 1,
2.240481, -0.2802983, 1.965867, 0, 0, 0, 1, 1,
2.333701, 0.1234514, 1.993115, 0, 0, 0, 1, 1,
2.337039, -0.6177523, 2.006648, 0, 0, 0, 1, 1,
2.459772, -0.9978914, 4.431495, 0, 0, 0, 1, 1,
2.527546, -0.05929512, 1.005169, 1, 1, 1, 1, 1,
2.548311, 0.1687606, 0.8829931, 1, 1, 1, 1, 1,
2.564955, -0.6858131, -0.6650534, 1, 1, 1, 1, 1,
2.605304, -1.959946, 1.941054, 1, 1, 1, 1, 1,
2.716708, 0.1195046, 0.6014943, 1, 1, 1, 1, 1,
2.756187, -0.4956957, 3.147051, 1, 1, 1, 1, 1,
2.785274, 0.6953549, 0.8087654, 1, 1, 1, 1, 1
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
var radius = 9.4112;
var distance = 33.05644;
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
mvMatrix.translate( 0.6459281, 0.1390278, -0.2021282 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.05644);
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