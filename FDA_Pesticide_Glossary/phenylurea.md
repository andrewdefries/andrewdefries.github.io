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
-2.927598, 0.6320412, -0.9760318, 1, 0, 0, 1,
-2.781775, -0.1137935, -0.6026655, 1, 0.007843138, 0, 1,
-2.739735, -0.681232, -0.7928349, 1, 0.01176471, 0, 1,
-2.584352, 0.2762466, -0.2375187, 1, 0.01960784, 0, 1,
-2.410048, -0.2392055, -1.655903, 1, 0.02352941, 0, 1,
-2.402347, 0.3766972, -2.097318, 1, 0.03137255, 0, 1,
-2.391641, -1.044873, -1.589622, 1, 0.03529412, 0, 1,
-2.389646, 1.493476, -1.563842, 1, 0.04313726, 0, 1,
-2.357824, 0.2319049, -0.3583976, 1, 0.04705882, 0, 1,
-2.343448, -0.03572122, -1.1413, 1, 0.05490196, 0, 1,
-2.317963, 1.557295, -1.397712, 1, 0.05882353, 0, 1,
-2.293996, 1.580872, 0.08811551, 1, 0.06666667, 0, 1,
-2.289442, 0.7269602, -1.01875, 1, 0.07058824, 0, 1,
-2.225384, 0.8167701, -1.786739, 1, 0.07843138, 0, 1,
-2.212807, -0.3494874, -0.006786909, 1, 0.08235294, 0, 1,
-2.208109, -1.153159, -2.691022, 1, 0.09019608, 0, 1,
-2.142593, -0.5822737, -1.522264, 1, 0.09411765, 0, 1,
-2.117949, 0.4534144, -0.4349215, 1, 0.1019608, 0, 1,
-2.11081, -0.6025755, -2.040053, 1, 0.1098039, 0, 1,
-2.076282, -1.01559, -2.024686, 1, 0.1137255, 0, 1,
-2.068734, 0.01832892, -1.063474, 1, 0.1215686, 0, 1,
-2.039196, -0.6629954, -3.597756, 1, 0.1254902, 0, 1,
-1.996389, 2.058475, -1.159829, 1, 0.1333333, 0, 1,
-1.948974, 0.9367933, -0.5866655, 1, 0.1372549, 0, 1,
-1.948455, 0.7471334, -1.874576, 1, 0.145098, 0, 1,
-1.937754, -0.2947269, -2.704634, 1, 0.1490196, 0, 1,
-1.904959, 1.531418, 1.153017, 1, 0.1568628, 0, 1,
-1.880995, 2.473271, 0.3914593, 1, 0.1607843, 0, 1,
-1.871257, 1.579108, -0.8944824, 1, 0.1686275, 0, 1,
-1.868361, -0.4205729, -4.810351, 1, 0.172549, 0, 1,
-1.838237, -1.909672, -3.020304, 1, 0.1803922, 0, 1,
-1.80639, 0.5570507, -1.330591, 1, 0.1843137, 0, 1,
-1.79695, 0.5320563, -1.82387, 1, 0.1921569, 0, 1,
-1.794388, -1.81353, -3.152672, 1, 0.1960784, 0, 1,
-1.770681, 0.5605224, -0.8628839, 1, 0.2039216, 0, 1,
-1.768787, -0.560212, -0.7615554, 1, 0.2117647, 0, 1,
-1.767888, 0.3857313, -0.6677846, 1, 0.2156863, 0, 1,
-1.762219, 0.07679557, -1.965225, 1, 0.2235294, 0, 1,
-1.752139, -0.9810495, -2.110615, 1, 0.227451, 0, 1,
-1.728796, -0.8774267, -3.117746, 1, 0.2352941, 0, 1,
-1.727286, -1.008644, -0.8484077, 1, 0.2392157, 0, 1,
-1.723854, -0.2002928, -1.723381, 1, 0.2470588, 0, 1,
-1.716448, 0.3141495, -0.03700066, 1, 0.2509804, 0, 1,
-1.703761, -0.1912046, -1.062238, 1, 0.2588235, 0, 1,
-1.695294, -0.314923, 0.1067365, 1, 0.2627451, 0, 1,
-1.683005, -0.3766186, -3.020342, 1, 0.2705882, 0, 1,
-1.678937, -1.155577, -2.230514, 1, 0.2745098, 0, 1,
-1.637252, -0.2552358, -1.185645, 1, 0.282353, 0, 1,
-1.632117, 0.4281394, -1.395981, 1, 0.2862745, 0, 1,
-1.612245, -0.3152392, -3.230124, 1, 0.2941177, 0, 1,
-1.578375, 1.724449, 0.2386498, 1, 0.3019608, 0, 1,
-1.570794, 0.06407052, -1.569072, 1, 0.3058824, 0, 1,
-1.563727, 0.07445271, 0.03658799, 1, 0.3137255, 0, 1,
-1.560587, -1.604218, -2.740288, 1, 0.3176471, 0, 1,
-1.544847, -1.145889, -2.019582, 1, 0.3254902, 0, 1,
-1.53821, -0.2542354, -0.5175382, 1, 0.3294118, 0, 1,
-1.537184, -1.546577, -2.171589, 1, 0.3372549, 0, 1,
-1.512364, 0.2074971, -1.556206, 1, 0.3411765, 0, 1,
-1.503243, 0.6787113, -1.18945, 1, 0.3490196, 0, 1,
-1.498735, 0.3512982, -2.202271, 1, 0.3529412, 0, 1,
-1.486767, 1.544708, 0.5217278, 1, 0.3607843, 0, 1,
-1.484606, -0.02162435, -0.1709259, 1, 0.3647059, 0, 1,
-1.462497, -0.1582159, -1.73037, 1, 0.372549, 0, 1,
-1.462407, 1.389361, 0.7101287, 1, 0.3764706, 0, 1,
-1.461116, 1.862716, -1.666009, 1, 0.3843137, 0, 1,
-1.459895, -0.6062335, -1.88179, 1, 0.3882353, 0, 1,
-1.455069, -1.106889, -1.657371, 1, 0.3960784, 0, 1,
-1.453157, 0.9582704, -1.04006, 1, 0.4039216, 0, 1,
-1.452725, -1.156732, -4.096103, 1, 0.4078431, 0, 1,
-1.449115, 0.5028528, -0.3058062, 1, 0.4156863, 0, 1,
-1.437865, 0.3440106, -2.226225, 1, 0.4196078, 0, 1,
-1.433981, 0.36013, -1.595899, 1, 0.427451, 0, 1,
-1.43282, -0.1001073, -0.9637976, 1, 0.4313726, 0, 1,
-1.426288, 0.718728, 0.156405, 1, 0.4392157, 0, 1,
-1.415806, 0.215235, -1.941338, 1, 0.4431373, 0, 1,
-1.414933, 0.5360293, -0.4971908, 1, 0.4509804, 0, 1,
-1.413741, 1.595654, -0.0238311, 1, 0.454902, 0, 1,
-1.413583, 0.516798, -0.8378805, 1, 0.4627451, 0, 1,
-1.407104, 1.71547, -1.503085, 1, 0.4666667, 0, 1,
-1.401841, 0.8804513, -1.41291, 1, 0.4745098, 0, 1,
-1.392139, -0.03386602, -2.766598, 1, 0.4784314, 0, 1,
-1.387832, -0.7794325, -2.017716, 1, 0.4862745, 0, 1,
-1.386335, -1.109835, -0.2942798, 1, 0.4901961, 0, 1,
-1.379465, -0.6258867, -1.759929, 1, 0.4980392, 0, 1,
-1.371832, 0.7833281, -1.415839, 1, 0.5058824, 0, 1,
-1.364129, -1.247276, -2.248714, 1, 0.509804, 0, 1,
-1.357538, -0.6470377, -0.02074369, 1, 0.5176471, 0, 1,
-1.337646, 0.3134432, -1.20329, 1, 0.5215687, 0, 1,
-1.331728, -1.000741, -2.641936, 1, 0.5294118, 0, 1,
-1.330321, 0.1145227, -0.9392453, 1, 0.5333334, 0, 1,
-1.321848, -0.06714177, -1.265675, 1, 0.5411765, 0, 1,
-1.303189, -1.341616, -1.805213, 1, 0.5450981, 0, 1,
-1.302029, 0.1701294, -2.154234, 1, 0.5529412, 0, 1,
-1.296748, -0.4599072, -3.239151, 1, 0.5568628, 0, 1,
-1.296024, -0.2463135, -2.475689, 1, 0.5647059, 0, 1,
-1.291752, -0.6344333, -1.976953, 1, 0.5686275, 0, 1,
-1.289975, 1.194563, 0.8821032, 1, 0.5764706, 0, 1,
-1.289299, -1.576617, -2.067879, 1, 0.5803922, 0, 1,
-1.289, -1.928833, -3.132044, 1, 0.5882353, 0, 1,
-1.273743, 1.570332, 0.3688625, 1, 0.5921569, 0, 1,
-1.270918, 0.1667926, 0.3101607, 1, 0.6, 0, 1,
-1.267821, -0.8295238, -1.970596, 1, 0.6078432, 0, 1,
-1.26569, 0.5306651, -0.05960171, 1, 0.6117647, 0, 1,
-1.263323, 0.8045186, -1.631111, 1, 0.6196079, 0, 1,
-1.252432, 0.9974279, 0.1269832, 1, 0.6235294, 0, 1,
-1.250015, 0.08216151, -3.581561, 1, 0.6313726, 0, 1,
-1.237595, -1.557617, -1.386651, 1, 0.6352941, 0, 1,
-1.228098, 0.7586764, -1.482602, 1, 0.6431373, 0, 1,
-1.207832, -0.7569202, -2.247904, 1, 0.6470588, 0, 1,
-1.207007, 2.326387, -1.471967, 1, 0.654902, 0, 1,
-1.20249, 0.9041097, -3.03099, 1, 0.6588235, 0, 1,
-1.200197, -0.8445215, -0.5840989, 1, 0.6666667, 0, 1,
-1.186842, 0.3936822, -1.814366, 1, 0.6705883, 0, 1,
-1.184802, -0.4566501, -1.889567, 1, 0.6784314, 0, 1,
-1.181437, 1.295262, -0.9166586, 1, 0.682353, 0, 1,
-1.181255, 1.800691, -0.9516308, 1, 0.6901961, 0, 1,
-1.171283, -0.166307, -0.5646368, 1, 0.6941177, 0, 1,
-1.16485, -0.03000121, -0.599698, 1, 0.7019608, 0, 1,
-1.159064, 0.7226782, -1.314778, 1, 0.7098039, 0, 1,
-1.148567, 0.8173565, -1.419364, 1, 0.7137255, 0, 1,
-1.13763, 1.227429, -1.319792, 1, 0.7215686, 0, 1,
-1.133427, -0.5766877, -3.076655, 1, 0.7254902, 0, 1,
-1.133107, 0.9167293, -3.029227, 1, 0.7333333, 0, 1,
-1.121447, -0.4457171, -0.2388296, 1, 0.7372549, 0, 1,
-1.120877, -0.9940683, -2.498956, 1, 0.7450981, 0, 1,
-1.120734, 1.095188, -0.667734, 1, 0.7490196, 0, 1,
-1.113745, 0.7782039, -1.072254, 1, 0.7568628, 0, 1,
-1.110426, -0.7173591, -3.744012, 1, 0.7607843, 0, 1,
-1.108548, 0.9067946, 1.361804, 1, 0.7686275, 0, 1,
-1.098656, -1.498625, -2.368083, 1, 0.772549, 0, 1,
-1.098506, 0.2262229, -2.086032, 1, 0.7803922, 0, 1,
-1.091956, 0.2651915, -2.741202, 1, 0.7843137, 0, 1,
-1.079372, -0.03219999, -1.899382, 1, 0.7921569, 0, 1,
-1.076961, -1.426039, -1.152932, 1, 0.7960784, 0, 1,
-1.075625, 0.4379756, -1.521771, 1, 0.8039216, 0, 1,
-1.071608, 0.1114926, -1.588532, 1, 0.8117647, 0, 1,
-1.069708, -0.3364645, -1.69911, 1, 0.8156863, 0, 1,
-1.067082, -0.5033074, -2.085525, 1, 0.8235294, 0, 1,
-1.06485, 1.038579, 0.19959, 1, 0.827451, 0, 1,
-1.056257, 0.2550993, -0.1663024, 1, 0.8352941, 0, 1,
-1.053646, 0.4879193, -2.375973, 1, 0.8392157, 0, 1,
-1.047789, -0.8100994, -3.636664, 1, 0.8470588, 0, 1,
-1.041749, -0.9390035, -0.8375719, 1, 0.8509804, 0, 1,
-1.038682, -0.01943268, -1.095616, 1, 0.8588235, 0, 1,
-1.03397, -1.672621, -3.626415, 1, 0.8627451, 0, 1,
-1.032708, -0.4621132, -2.303821, 1, 0.8705882, 0, 1,
-1.031422, -2.038136, -4.37898, 1, 0.8745098, 0, 1,
-1.025061, 1.753246, -0.6385205, 1, 0.8823529, 0, 1,
-1.020799, -1.372838, -3.246516, 1, 0.8862745, 0, 1,
-1.017896, 0.6935498, -2.261171, 1, 0.8941177, 0, 1,
-1.015765, 1.181958, 0.2144504, 1, 0.8980392, 0, 1,
-1.014689, -1.054192, -2.727063, 1, 0.9058824, 0, 1,
-1.011534, 0.959293, 0.1021805, 1, 0.9137255, 0, 1,
-1.003504, -1.905083, -3.973688, 1, 0.9176471, 0, 1,
-1.000212, -0.6987785, -1.563508, 1, 0.9254902, 0, 1,
-0.983566, -0.4260341, -2.986145, 1, 0.9294118, 0, 1,
-0.9813458, -0.2855732, -2.869077, 1, 0.9372549, 0, 1,
-0.9758968, 0.04509156, -2.207955, 1, 0.9411765, 0, 1,
-0.9758472, -1.982618, -1.847977, 1, 0.9490196, 0, 1,
-0.9743977, -1.468154, -3.268048, 1, 0.9529412, 0, 1,
-0.9673303, -0.4688527, -0.3793788, 1, 0.9607843, 0, 1,
-0.9672779, 0.5717863, -0.3987803, 1, 0.9647059, 0, 1,
-0.9660426, 0.2618318, -0.3528371, 1, 0.972549, 0, 1,
-0.942259, 1.018566, 0.4472988, 1, 0.9764706, 0, 1,
-0.9414808, -0.1885096, -1.833578, 1, 0.9843137, 0, 1,
-0.9373421, 0.7273147, -1.535288, 1, 0.9882353, 0, 1,
-0.9330704, -0.1129185, -2.198851, 1, 0.9960784, 0, 1,
-0.9319506, -1.706671, -1.359227, 0.9960784, 1, 0, 1,
-0.9268354, -0.3185988, -0.6304398, 0.9921569, 1, 0, 1,
-0.9261915, -0.01223827, -1.324723, 0.9843137, 1, 0, 1,
-0.917675, -2.013988, -2.896452, 0.9803922, 1, 0, 1,
-0.9157886, -0.5665433, -4.210063, 0.972549, 1, 0, 1,
-0.9130203, 0.1660308, -2.325241, 0.9686275, 1, 0, 1,
-0.912402, -0.4641295, -3.542283, 0.9607843, 1, 0, 1,
-0.9088524, 0.2401137, -1.521853, 0.9568627, 1, 0, 1,
-0.9087979, 1.544385, -2.353734, 0.9490196, 1, 0, 1,
-0.9067467, 0.6249032, -2.213107, 0.945098, 1, 0, 1,
-0.9064313, -0.2506561, -2.124368, 0.9372549, 1, 0, 1,
-0.9030461, 1.113353, -2.545476, 0.9333333, 1, 0, 1,
-0.9024974, -1.44168, -3.267689, 0.9254902, 1, 0, 1,
-0.9024623, 2.04513, -1.470911, 0.9215686, 1, 0, 1,
-0.9010822, -0.803281, -2.557626, 0.9137255, 1, 0, 1,
-0.9003885, -0.1241904, -2.000025, 0.9098039, 1, 0, 1,
-0.8987682, 1.072158, -0.02667764, 0.9019608, 1, 0, 1,
-0.8960807, 0.09993158, -3.022237, 0.8941177, 1, 0, 1,
-0.8903589, -0.3552362, -3.019356, 0.8901961, 1, 0, 1,
-0.8857317, -2.671373, -3.174566, 0.8823529, 1, 0, 1,
-0.8825284, 0.6015885, -1.029227, 0.8784314, 1, 0, 1,
-0.8805224, 2.389846, -1.455101, 0.8705882, 1, 0, 1,
-0.8784792, -0.2554643, -0.8870323, 0.8666667, 1, 0, 1,
-0.8768346, -1.1815, -1.188815, 0.8588235, 1, 0, 1,
-0.8709122, 0.4735737, 0.5019974, 0.854902, 1, 0, 1,
-0.8683182, -0.3224571, -2.141813, 0.8470588, 1, 0, 1,
-0.8636335, 0.1982926, -2.061594, 0.8431373, 1, 0, 1,
-0.8567232, -0.3458596, -3.044613, 0.8352941, 1, 0, 1,
-0.8541297, 0.5509201, -0.8494725, 0.8313726, 1, 0, 1,
-0.8537386, -0.10974, -2.146504, 0.8235294, 1, 0, 1,
-0.8378736, -0.2974277, -1.679059, 0.8196079, 1, 0, 1,
-0.8280988, 0.3793715, -1.255136, 0.8117647, 1, 0, 1,
-0.8264975, 1.094374, 0.8844118, 0.8078431, 1, 0, 1,
-0.8199878, -0.4031178, -2.218511, 0.8, 1, 0, 1,
-0.8165224, -1.39046, -3.335076, 0.7921569, 1, 0, 1,
-0.8149842, -1.6174, -2.319003, 0.7882353, 1, 0, 1,
-0.808468, 1.289876, 0.1076697, 0.7803922, 1, 0, 1,
-0.8083604, 1.4666, -0.8718369, 0.7764706, 1, 0, 1,
-0.7990996, -0.3052008, -2.549212, 0.7686275, 1, 0, 1,
-0.7943938, -0.7882141, -0.8439047, 0.7647059, 1, 0, 1,
-0.7929043, 0.1120867, -0.5855753, 0.7568628, 1, 0, 1,
-0.7923514, -0.08039488, -1.576552, 0.7529412, 1, 0, 1,
-0.7878393, 0.6103309, -0.08779123, 0.7450981, 1, 0, 1,
-0.7866899, 0.06378689, -1.204243, 0.7411765, 1, 0, 1,
-0.7743109, -0.1485435, -1.059276, 0.7333333, 1, 0, 1,
-0.7694949, 1.74446, -1.836875, 0.7294118, 1, 0, 1,
-0.7629977, -0.6979055, -2.365589, 0.7215686, 1, 0, 1,
-0.7629487, -0.5333564, -2.518856, 0.7176471, 1, 0, 1,
-0.7629144, 0.9070928, -0.7173471, 0.7098039, 1, 0, 1,
-0.7552884, 1.286361, 0.8525997, 0.7058824, 1, 0, 1,
-0.7497207, 0.7660483, -0.783753, 0.6980392, 1, 0, 1,
-0.7334151, 0.2752419, -3.368916, 0.6901961, 1, 0, 1,
-0.729325, -1.323778, -1.953175, 0.6862745, 1, 0, 1,
-0.7269629, 0.545248, 1.071861, 0.6784314, 1, 0, 1,
-0.7204924, 1.255066, 0.3792368, 0.6745098, 1, 0, 1,
-0.7171982, -0.8070933, -1.432999, 0.6666667, 1, 0, 1,
-0.7168993, -0.1099568, -3.156833, 0.6627451, 1, 0, 1,
-0.7036508, 1.682846, -0.6791168, 0.654902, 1, 0, 1,
-0.7032568, 0.3130516, -1.144282, 0.6509804, 1, 0, 1,
-0.696066, 0.5795038, -2.074087, 0.6431373, 1, 0, 1,
-0.6936529, -0.7020699, -3.265802, 0.6392157, 1, 0, 1,
-0.6935341, -0.09559059, -1.988407, 0.6313726, 1, 0, 1,
-0.6922639, 2.481198, -1.945319, 0.627451, 1, 0, 1,
-0.6897612, 0.6980547, 0.7662374, 0.6196079, 1, 0, 1,
-0.6855127, -1.221183, -3.651596, 0.6156863, 1, 0, 1,
-0.6822535, 0.07833996, -0.4820084, 0.6078432, 1, 0, 1,
-0.6801823, -0.3168562, -4.058888, 0.6039216, 1, 0, 1,
-0.6777692, -0.1188511, -2.735811, 0.5960785, 1, 0, 1,
-0.6715357, 0.1032127, -1.205236, 0.5882353, 1, 0, 1,
-0.6697917, 0.9758888, -0.8146499, 0.5843138, 1, 0, 1,
-0.6695708, 1.093045, 0.564746, 0.5764706, 1, 0, 1,
-0.6646672, -0.4997242, -2.446374, 0.572549, 1, 0, 1,
-0.6634056, -1.99085, -3.973445, 0.5647059, 1, 0, 1,
-0.6589515, 2.30418, -0.4587974, 0.5607843, 1, 0, 1,
-0.6587881, 1.417232, -1.027907, 0.5529412, 1, 0, 1,
-0.6581029, -0.6682763, -3.569227, 0.5490196, 1, 0, 1,
-0.6578556, 0.3412012, -2.064687, 0.5411765, 1, 0, 1,
-0.6557639, -0.5777116, -1.92881, 0.5372549, 1, 0, 1,
-0.6522488, 0.03109971, -1.807506, 0.5294118, 1, 0, 1,
-0.6506505, 0.2628919, -1.50032, 0.5254902, 1, 0, 1,
-0.6479704, 0.1435062, -0.9549316, 0.5176471, 1, 0, 1,
-0.6406102, -0.02942776, -1.662611, 0.5137255, 1, 0, 1,
-0.6379305, 0.9780231, -2.491204, 0.5058824, 1, 0, 1,
-0.6341221, -0.7071703, -2.422309, 0.5019608, 1, 0, 1,
-0.6332935, 0.2053747, -2.358874, 0.4941176, 1, 0, 1,
-0.632863, 1.783067, -1.176574, 0.4862745, 1, 0, 1,
-0.6297476, 0.6512427, -1.610449, 0.4823529, 1, 0, 1,
-0.626176, 0.3580457, 1.265935, 0.4745098, 1, 0, 1,
-0.6241257, 0.5846809, -1.167634, 0.4705882, 1, 0, 1,
-0.6196554, -0.7153809, -2.790266, 0.4627451, 1, 0, 1,
-0.6186901, 0.2182338, -2.608323, 0.4588235, 1, 0, 1,
-0.6161076, 0.1795799, -2.395875, 0.4509804, 1, 0, 1,
-0.6142402, -1.388162, -0.5436261, 0.4470588, 1, 0, 1,
-0.6114635, 1.147263, -2.979843, 0.4392157, 1, 0, 1,
-0.6059695, -0.3444724, -2.344815, 0.4352941, 1, 0, 1,
-0.6019692, -1.257242, -3.522912, 0.427451, 1, 0, 1,
-0.6007002, 0.5519352, 1.209365, 0.4235294, 1, 0, 1,
-0.5983514, 0.7780271, -1.016961, 0.4156863, 1, 0, 1,
-0.5952187, 1.227621, -1.884761, 0.4117647, 1, 0, 1,
-0.5947617, -1.155493, -1.384893, 0.4039216, 1, 0, 1,
-0.5904392, 0.3344493, -1.446651, 0.3960784, 1, 0, 1,
-0.5836152, 0.05025672, -1.538116, 0.3921569, 1, 0, 1,
-0.5783885, -0.691904, -2.676762, 0.3843137, 1, 0, 1,
-0.5648008, 0.09545682, -3.893437, 0.3803922, 1, 0, 1,
-0.5640318, -0.3653751, -3.328258, 0.372549, 1, 0, 1,
-0.5622793, -1.862512, -2.14974, 0.3686275, 1, 0, 1,
-0.561919, -1.585412, -2.859379, 0.3607843, 1, 0, 1,
-0.5618958, -0.1864874, -2.078861, 0.3568628, 1, 0, 1,
-0.5599867, -0.1397821, -1.411597, 0.3490196, 1, 0, 1,
-0.5575864, 1.482275, -0.1571702, 0.345098, 1, 0, 1,
-0.5567362, 0.4969814, -1.051866, 0.3372549, 1, 0, 1,
-0.5551634, -1.08137, -3.372884, 0.3333333, 1, 0, 1,
-0.5546394, -0.005545443, -2.061381, 0.3254902, 1, 0, 1,
-0.5524371, 0.2714714, -1.053805, 0.3215686, 1, 0, 1,
-0.551553, 0.940257, -1.865232, 0.3137255, 1, 0, 1,
-0.5432749, -0.2433326, -3.656667, 0.3098039, 1, 0, 1,
-0.542517, 0.9227248, 2.188187, 0.3019608, 1, 0, 1,
-0.5419879, 0.1198569, -1.403941, 0.2941177, 1, 0, 1,
-0.5415357, 0.5919347, -1.287473, 0.2901961, 1, 0, 1,
-0.5403284, -0.0783543, -1.855579, 0.282353, 1, 0, 1,
-0.5402981, -1.42236, -2.301886, 0.2784314, 1, 0, 1,
-0.5358254, 0.3047221, -0.5070727, 0.2705882, 1, 0, 1,
-0.5335569, 0.4578861, -1.128475, 0.2666667, 1, 0, 1,
-0.5322022, -1.902312, -0.96451, 0.2588235, 1, 0, 1,
-0.5291935, -2.001873, -1.065123, 0.254902, 1, 0, 1,
-0.5287704, 0.08491884, -0.4436167, 0.2470588, 1, 0, 1,
-0.5174255, -0.5723236, -1.39556, 0.2431373, 1, 0, 1,
-0.5134379, -0.8290018, -3.010569, 0.2352941, 1, 0, 1,
-0.5109229, 0.1789548, -1.245046, 0.2313726, 1, 0, 1,
-0.5089739, 1.102092, -1.780224, 0.2235294, 1, 0, 1,
-0.5064674, -1.452487, -4.727514, 0.2196078, 1, 0, 1,
-0.4969167, -0.3117388, -1.870646, 0.2117647, 1, 0, 1,
-0.4929868, 1.161134, -0.081521, 0.2078431, 1, 0, 1,
-0.4922552, -0.9360643, -1.309936, 0.2, 1, 0, 1,
-0.4913305, -0.5030934, -1.501992, 0.1921569, 1, 0, 1,
-0.4896356, -0.4944156, -1.229466, 0.1882353, 1, 0, 1,
-0.4853079, -0.1518682, -2.852607, 0.1803922, 1, 0, 1,
-0.4829099, 0.5019544, -0.1701091, 0.1764706, 1, 0, 1,
-0.479874, 0.02534091, 0.03363703, 0.1686275, 1, 0, 1,
-0.4779087, 1.337031, 0.3160785, 0.1647059, 1, 0, 1,
-0.4755113, 1.535419, 0.2900404, 0.1568628, 1, 0, 1,
-0.4742306, -0.3983498, -1.433015, 0.1529412, 1, 0, 1,
-0.4662614, 1.061834, -1.294811, 0.145098, 1, 0, 1,
-0.4629241, -0.5991635, -3.626385, 0.1411765, 1, 0, 1,
-0.459814, 0.6567243, -0.6868832, 0.1333333, 1, 0, 1,
-0.4581999, 0.3111908, -1.061576, 0.1294118, 1, 0, 1,
-0.4558702, 0.7490448, -0.3984353, 0.1215686, 1, 0, 1,
-0.4523081, -2.255881, -1.688637, 0.1176471, 1, 0, 1,
-0.4519468, -1.919047, -3.965259, 0.1098039, 1, 0, 1,
-0.4494174, -0.6702271, -4.07579, 0.1058824, 1, 0, 1,
-0.4487599, -1.982685, -2.934796, 0.09803922, 1, 0, 1,
-0.4474935, 1.863261, -0.2815386, 0.09019608, 1, 0, 1,
-0.4458558, -0.8981476, -2.109231, 0.08627451, 1, 0, 1,
-0.4458039, 1.766642, -1.084142, 0.07843138, 1, 0, 1,
-0.4438792, -0.04562885, -2.760723, 0.07450981, 1, 0, 1,
-0.4422475, 0.3891158, -1.745285, 0.06666667, 1, 0, 1,
-0.440163, -0.2225592, -1.907328, 0.0627451, 1, 0, 1,
-0.4352733, 1.92009, -0.2898769, 0.05490196, 1, 0, 1,
-0.434969, 0.6828916, -0.8174516, 0.05098039, 1, 0, 1,
-0.4260975, 0.7865937, -2.164087, 0.04313726, 1, 0, 1,
-0.4257793, -0.01817155, -1.596055, 0.03921569, 1, 0, 1,
-0.4241447, -0.3815342, -1.277224, 0.03137255, 1, 0, 1,
-0.4200951, 0.3357509, -1.449725, 0.02745098, 1, 0, 1,
-0.4180925, 0.2264208, 0.3273067, 0.01960784, 1, 0, 1,
-0.414074, 0.3077303, -0.230557, 0.01568628, 1, 0, 1,
-0.4064654, -1.233863, -3.366178, 0.007843138, 1, 0, 1,
-0.4039024, -1.872012, -1.693235, 0.003921569, 1, 0, 1,
-0.4001589, -1.507861, -2.704704, 0, 1, 0.003921569, 1,
-0.3947744, -1.577651, -2.284165, 0, 1, 0.01176471, 1,
-0.3937058, -2.068852, -1.624897, 0, 1, 0.01568628, 1,
-0.3934714, -3.213286, -1.952261, 0, 1, 0.02352941, 1,
-0.3866861, -1.082511, -4.259342, 0, 1, 0.02745098, 1,
-0.3847078, -0.4856166, -2.181593, 0, 1, 0.03529412, 1,
-0.3830209, -2.37387, -2.272867, 0, 1, 0.03921569, 1,
-0.3810116, 0.8752641, -0.4260703, 0, 1, 0.04705882, 1,
-0.3784934, -2.104125, -1.238412, 0, 1, 0.05098039, 1,
-0.377756, -1.76528, -4.737085, 0, 1, 0.05882353, 1,
-0.3658332, 0.3384499, -0.4723426, 0, 1, 0.0627451, 1,
-0.3648463, -0.8246536, -3.353038, 0, 1, 0.07058824, 1,
-0.3639701, -0.1028379, -3.026276, 0, 1, 0.07450981, 1,
-0.3612271, 0.4831437, -1.291248, 0, 1, 0.08235294, 1,
-0.3599223, -0.126624, -0.6537399, 0, 1, 0.08627451, 1,
-0.3522775, -0.4613286, -3.9366, 0, 1, 0.09411765, 1,
-0.3501609, 1.749592, 1.528334, 0, 1, 0.1019608, 1,
-0.3449227, 0.07654508, -1.89158, 0, 1, 0.1058824, 1,
-0.3273379, 0.6994972, 0.8140709, 0, 1, 0.1137255, 1,
-0.3213432, -0.8740032, -2.33196, 0, 1, 0.1176471, 1,
-0.3198377, 0.9701323, 0.4499737, 0, 1, 0.1254902, 1,
-0.3185058, -0.2906045, -1.547513, 0, 1, 0.1294118, 1,
-0.3173226, -0.5914919, -3.520033, 0, 1, 0.1372549, 1,
-0.3129102, 3.249335, 0.8014905, 0, 1, 0.1411765, 1,
-0.3111684, 0.9100012, 1.355387, 0, 1, 0.1490196, 1,
-0.3107805, 0.1824249, -0.7052554, 0, 1, 0.1529412, 1,
-0.3052334, -0.6334823, -2.369231, 0, 1, 0.1607843, 1,
-0.3039958, -1.281972, -3.675227, 0, 1, 0.1647059, 1,
-0.3035153, -0.04909202, -3.180349, 0, 1, 0.172549, 1,
-0.2996914, 1.241461, -0.956183, 0, 1, 0.1764706, 1,
-0.2992068, 0.9272931, 0.8554447, 0, 1, 0.1843137, 1,
-0.2961914, -0.1404757, -1.370905, 0, 1, 0.1882353, 1,
-0.2922011, 0.3719395, -0.4025579, 0, 1, 0.1960784, 1,
-0.2914065, -0.7309369, -2.846232, 0, 1, 0.2039216, 1,
-0.2892407, -0.7870605, -1.998606, 0, 1, 0.2078431, 1,
-0.281957, 0.5749651, -1.4249, 0, 1, 0.2156863, 1,
-0.2806783, -0.9754649, -3.057149, 0, 1, 0.2196078, 1,
-0.2793769, -0.7088419, -1.534484, 0, 1, 0.227451, 1,
-0.2742052, 0.1061178, -0.2049601, 0, 1, 0.2313726, 1,
-0.2741583, -0.6603178, -2.603432, 0, 1, 0.2392157, 1,
-0.2740278, 0.5022299, 0.3429295, 0, 1, 0.2431373, 1,
-0.2724383, 1.984606, -2.859549, 0, 1, 0.2509804, 1,
-0.2719393, 1.479045, 1.205297, 0, 1, 0.254902, 1,
-0.270889, -0.5017726, -4.449475, 0, 1, 0.2627451, 1,
-0.2708447, -1.30829, -1.622676, 0, 1, 0.2666667, 1,
-0.2685097, -0.9056659, -3.039356, 0, 1, 0.2745098, 1,
-0.2662192, 0.08543164, -1.605247, 0, 1, 0.2784314, 1,
-0.2645615, -0.6475831, -1.976856, 0, 1, 0.2862745, 1,
-0.2594504, -1.212373, -1.027635, 0, 1, 0.2901961, 1,
-0.2587587, -1.490312, -3.099029, 0, 1, 0.2980392, 1,
-0.2546663, -0.2203909, -2.746254, 0, 1, 0.3058824, 1,
-0.2509705, 0.241422, 1.014531, 0, 1, 0.3098039, 1,
-0.2496542, -1.544635, -3.382583, 0, 1, 0.3176471, 1,
-0.2492101, 0.619699, -0.1461828, 0, 1, 0.3215686, 1,
-0.2454307, -0.6490914, -1.744301, 0, 1, 0.3294118, 1,
-0.2432735, 1.521544, -0.5582127, 0, 1, 0.3333333, 1,
-0.2422947, 0.4553175, -0.8132454, 0, 1, 0.3411765, 1,
-0.2292197, -0.3712089, -3.782901, 0, 1, 0.345098, 1,
-0.2268169, 1.886758, 0.3939733, 0, 1, 0.3529412, 1,
-0.2264351, -0.9935464, -5.537126, 0, 1, 0.3568628, 1,
-0.2255114, -0.8108131, -2.778232, 0, 1, 0.3647059, 1,
-0.2240158, -0.2530365, -3.041502, 0, 1, 0.3686275, 1,
-0.2238596, -1.146442, -3.24312, 0, 1, 0.3764706, 1,
-0.222976, -0.8390881, -3.505297, 0, 1, 0.3803922, 1,
-0.2173096, 0.2294379, -0.3461916, 0, 1, 0.3882353, 1,
-0.2147007, -1.069509, -4.433676, 0, 1, 0.3921569, 1,
-0.2109371, -0.7375371, -3.034833, 0, 1, 0.4, 1,
-0.209356, 0.5091237, 1.33757, 0, 1, 0.4078431, 1,
-0.2021896, -2.135051, -4.203309, 0, 1, 0.4117647, 1,
-0.1996982, 0.2173067, -1.154834, 0, 1, 0.4196078, 1,
-0.1966055, -0.6246252, -2.667936, 0, 1, 0.4235294, 1,
-0.1963378, -0.3782436, -3.048113, 0, 1, 0.4313726, 1,
-0.1898971, 0.395703, 0.03609987, 0, 1, 0.4352941, 1,
-0.1894197, -0.3196357, -1.34256, 0, 1, 0.4431373, 1,
-0.1886169, -1.707412, -1.859009, 0, 1, 0.4470588, 1,
-0.1884066, 0.9615732, -0.4241844, 0, 1, 0.454902, 1,
-0.186091, 0.01765525, -2.178784, 0, 1, 0.4588235, 1,
-0.1853317, 0.158572, -1.250473, 0, 1, 0.4666667, 1,
-0.1815481, 0.7156166, -0.5532359, 0, 1, 0.4705882, 1,
-0.1804911, -2.123088, -3.873137, 0, 1, 0.4784314, 1,
-0.1801023, -0.719416, -1.817085, 0, 1, 0.4823529, 1,
-0.1796117, 0.04012421, -1.847944, 0, 1, 0.4901961, 1,
-0.1794075, 0.3826192, 1.519953, 0, 1, 0.4941176, 1,
-0.1771864, -1.545048, -2.63834, 0, 1, 0.5019608, 1,
-0.1762282, -0.6971228, -2.480665, 0, 1, 0.509804, 1,
-0.1729571, 1.281224, -0.1585554, 0, 1, 0.5137255, 1,
-0.1640785, -0.8160981, -1.624659, 0, 1, 0.5215687, 1,
-0.1604274, 0.3837132, -0.9892958, 0, 1, 0.5254902, 1,
-0.1583425, 0.1209104, -0.8366022, 0, 1, 0.5333334, 1,
-0.1533724, -0.2810293, -2.647664, 0, 1, 0.5372549, 1,
-0.1521098, 0.5163564, -0.6577395, 0, 1, 0.5450981, 1,
-0.1511799, 1.655352, -0.3206455, 0, 1, 0.5490196, 1,
-0.1492839, 0.6754543, -2.395597, 0, 1, 0.5568628, 1,
-0.1445542, 3.063012, -0.9445259, 0, 1, 0.5607843, 1,
-0.1438547, 2.160639, -0.5012207, 0, 1, 0.5686275, 1,
-0.1395726, 1.226892, 0.5503482, 0, 1, 0.572549, 1,
-0.1384972, -0.580558, -1.572076, 0, 1, 0.5803922, 1,
-0.1384522, -0.2066505, -1.977345, 0, 1, 0.5843138, 1,
-0.1360939, 1.152687, 1.536491, 0, 1, 0.5921569, 1,
-0.1270739, -0.09855473, -4.028053, 0, 1, 0.5960785, 1,
-0.1246585, 0.2024979, 0.6383739, 0, 1, 0.6039216, 1,
-0.1238233, -0.6384657, -1.861789, 0, 1, 0.6117647, 1,
-0.1224666, -2.03105, -3.684369, 0, 1, 0.6156863, 1,
-0.1200954, 1.252137, -0.4147801, 0, 1, 0.6235294, 1,
-0.1176513, -1.148628, -2.596938, 0, 1, 0.627451, 1,
-0.1167767, -0.1803124, -2.088502, 0, 1, 0.6352941, 1,
-0.1108028, 0.9163486, 0.3278761, 0, 1, 0.6392157, 1,
-0.1091084, 0.6167814, 0.2764138, 0, 1, 0.6470588, 1,
-0.1080658, 1.88817, 0.1838849, 0, 1, 0.6509804, 1,
-0.09597028, 1.383344, -0.03063838, 0, 1, 0.6588235, 1,
-0.09336318, 0.8520239, 1.285496, 0, 1, 0.6627451, 1,
-0.0914837, 1.587706, -0.8384765, 0, 1, 0.6705883, 1,
-0.08754683, 0.7252167, 0.9767906, 0, 1, 0.6745098, 1,
-0.08373234, 0.7788863, -0.9963773, 0, 1, 0.682353, 1,
-0.08157621, -0.2206001, -3.503572, 0, 1, 0.6862745, 1,
-0.08038402, 0.7675334, -2.082841, 0, 1, 0.6941177, 1,
-0.07813799, -0.1922534, -3.012417, 0, 1, 0.7019608, 1,
-0.07107238, -1.295661, -2.624808, 0, 1, 0.7058824, 1,
-0.06720183, -1.054194, -2.471771, 0, 1, 0.7137255, 1,
-0.06636323, -0.3841291, -2.035754, 0, 1, 0.7176471, 1,
-0.06566484, 0.7581428, -0.8051247, 0, 1, 0.7254902, 1,
-0.0641722, -1.453114, -2.307472, 0, 1, 0.7294118, 1,
-0.06100814, -0.2433058, -0.9910289, 0, 1, 0.7372549, 1,
-0.06020623, 0.2731386, 0.1387346, 0, 1, 0.7411765, 1,
-0.05793992, -2.166123, -1.835811, 0, 1, 0.7490196, 1,
-0.05562421, -1.522383, -4.028414, 0, 1, 0.7529412, 1,
-0.05527906, 0.2649441, -0.6476735, 0, 1, 0.7607843, 1,
-0.0551509, -0.1334133, -2.812787, 0, 1, 0.7647059, 1,
-0.04870858, 1.239189, -1.346991, 0, 1, 0.772549, 1,
-0.04855491, -0.4110154, -1.385833, 0, 1, 0.7764706, 1,
-0.03720569, -0.1042352, -4.141526, 0, 1, 0.7843137, 1,
-0.03663244, -0.2198353, -4.319023, 0, 1, 0.7882353, 1,
-0.03312912, -0.8494528, -2.03999, 0, 1, 0.7960784, 1,
-0.03125651, -0.7793382, -2.912812, 0, 1, 0.8039216, 1,
-0.02929568, 0.3137762, 0.7604181, 0, 1, 0.8078431, 1,
-0.02857277, 0.4767092, -0.2155762, 0, 1, 0.8156863, 1,
-0.02665151, -0.3582189, -2.573692, 0, 1, 0.8196079, 1,
-0.02534928, 0.8047584, -0.9572448, 0, 1, 0.827451, 1,
-0.02262526, -0.159304, -2.495697, 0, 1, 0.8313726, 1,
-0.0208251, -0.7092606, -5.289867, 0, 1, 0.8392157, 1,
-0.02079746, 0.998298, -0.06488303, 0, 1, 0.8431373, 1,
-0.01975228, 2.851035, -0.4837149, 0, 1, 0.8509804, 1,
-0.01198614, 0.5048183, 0.86264, 0, 1, 0.854902, 1,
-0.006211271, 1.298146, -1.541505, 0, 1, 0.8627451, 1,
0.0003093804, 1.300123, 0.846093, 0, 1, 0.8666667, 1,
0.001333285, -2.601723, 4.483544, 0, 1, 0.8745098, 1,
0.003245918, 0.3063895, -0.7173554, 0, 1, 0.8784314, 1,
0.006589963, -0.2657758, 1.977762, 0, 1, 0.8862745, 1,
0.007861127, -0.3264166, 2.520391, 0, 1, 0.8901961, 1,
0.008131797, 0.9523045, -0.06151946, 0, 1, 0.8980392, 1,
0.01206156, 0.5559524, 0.5343035, 0, 1, 0.9058824, 1,
0.01322145, -0.01091979, 0.8715254, 0, 1, 0.9098039, 1,
0.0201196, 0.1770765, 1.831293, 0, 1, 0.9176471, 1,
0.02259342, 1.834421, -2.083375, 0, 1, 0.9215686, 1,
0.02316581, -0.3987531, 2.607053, 0, 1, 0.9294118, 1,
0.0254826, 0.4416766, -0.6179003, 0, 1, 0.9333333, 1,
0.02595263, -0.9649293, 3.001933, 0, 1, 0.9411765, 1,
0.02624754, -0.09498774, 4.867986, 0, 1, 0.945098, 1,
0.0295992, -1.735645, 2.596986, 0, 1, 0.9529412, 1,
0.03607478, 0.7183456, -0.1101664, 0, 1, 0.9568627, 1,
0.04035927, -0.9658896, 1.42318, 0, 1, 0.9647059, 1,
0.0441191, 1.701455, -1.06348, 0, 1, 0.9686275, 1,
0.05203622, -0.7228991, 2.711767, 0, 1, 0.9764706, 1,
0.05282493, 1.014853, 0.2373083, 0, 1, 0.9803922, 1,
0.05507418, 0.5117023, 1.828547, 0, 1, 0.9882353, 1,
0.05535566, 0.8916427, -1.843615, 0, 1, 0.9921569, 1,
0.05720345, 0.5666602, 0.8763384, 0, 1, 1, 1,
0.07078621, -0.01002971, 0.1648252, 0, 0.9921569, 1, 1,
0.07124422, -1.800175, 3.596601, 0, 0.9882353, 1, 1,
0.07233464, 0.6379988, 1.10745, 0, 0.9803922, 1, 1,
0.07261548, -1.139879, 3.010098, 0, 0.9764706, 1, 1,
0.07269682, -1.2033, 1.799639, 0, 0.9686275, 1, 1,
0.08345533, 0.8550825, -0.6431705, 0, 0.9647059, 1, 1,
0.0839576, 0.3729981, 1.600844, 0, 0.9568627, 1, 1,
0.08873259, 0.8139828, -0.5068793, 0, 0.9529412, 1, 1,
0.09191392, 0.3005477, -0.04885151, 0, 0.945098, 1, 1,
0.09350087, 0.1873314, -1.053442, 0, 0.9411765, 1, 1,
0.09446748, 1.763299, -0.214649, 0, 0.9333333, 1, 1,
0.09854493, -0.4075713, 1.306761, 0, 0.9294118, 1, 1,
0.09893401, -0.3111613, 3.418543, 0, 0.9215686, 1, 1,
0.1007864, 0.5460101, 0.3072374, 0, 0.9176471, 1, 1,
0.1025496, 0.5681952, 0.2043381, 0, 0.9098039, 1, 1,
0.1038661, -1.260389, 1.819185, 0, 0.9058824, 1, 1,
0.1052504, 0.9709083, -2.433654, 0, 0.8980392, 1, 1,
0.105299, 1.341036, -0.3698468, 0, 0.8901961, 1, 1,
0.1092245, 1.49092, 0.8079649, 0, 0.8862745, 1, 1,
0.1102412, -0.2751428, 3.958779, 0, 0.8784314, 1, 1,
0.1102554, -0.9378062, 1.679903, 0, 0.8745098, 1, 1,
0.1131773, 0.9090573, -1.072764, 0, 0.8666667, 1, 1,
0.1154029, -1.16414, 0.6378396, 0, 0.8627451, 1, 1,
0.1158855, 0.9724218, -0.4454945, 0, 0.854902, 1, 1,
0.1175118, 0.3094402, 0.08612214, 0, 0.8509804, 1, 1,
0.1198945, 1.126115, -2.004775, 0, 0.8431373, 1, 1,
0.1234553, -0.3213592, 4.338016, 0, 0.8392157, 1, 1,
0.1259141, 0.739629, -0.6691782, 0, 0.8313726, 1, 1,
0.1321319, 0.9385949, 0.7887635, 0, 0.827451, 1, 1,
0.1349943, -0.5152346, 2.76597, 0, 0.8196079, 1, 1,
0.1368221, 0.9653654, -0.5929593, 0, 0.8156863, 1, 1,
0.1369312, -0.7171043, 5.131993, 0, 0.8078431, 1, 1,
0.1379787, 1.32784, 0.4016544, 0, 0.8039216, 1, 1,
0.1402219, -1.218902, 3.304622, 0, 0.7960784, 1, 1,
0.1431522, -0.3564114, 1.546266, 0, 0.7882353, 1, 1,
0.1459323, 0.005121185, 0.9309216, 0, 0.7843137, 1, 1,
0.1512552, 0.2150287, -0.1029376, 0, 0.7764706, 1, 1,
0.1534512, -0.2054592, 2.681039, 0, 0.772549, 1, 1,
0.153912, -0.4325078, 2.711357, 0, 0.7647059, 1, 1,
0.157497, -0.8391168, 2.782092, 0, 0.7607843, 1, 1,
0.1576622, 1.195368, -1.551945, 0, 0.7529412, 1, 1,
0.1613215, -1.433372, 3.507663, 0, 0.7490196, 1, 1,
0.1619604, 0.8808904, 1.021724, 0, 0.7411765, 1, 1,
0.1665182, -0.7254246, 1.739714, 0, 0.7372549, 1, 1,
0.1670381, -0.7232705, 3.533502, 0, 0.7294118, 1, 1,
0.1691703, 0.9098897, -0.8340712, 0, 0.7254902, 1, 1,
0.1696338, 0.2851762, 0.679262, 0, 0.7176471, 1, 1,
0.1718683, -0.05467913, 2.693813, 0, 0.7137255, 1, 1,
0.1742435, 0.3175925, 1.406855, 0, 0.7058824, 1, 1,
0.1746709, -0.3010297, 2.664556, 0, 0.6980392, 1, 1,
0.1747365, -1.495781, 3.30265, 0, 0.6941177, 1, 1,
0.1809393, -0.37557, 4.290657, 0, 0.6862745, 1, 1,
0.1816854, -0.1934471, 2.703263, 0, 0.682353, 1, 1,
0.1946669, -2.274489, 1.820732, 0, 0.6745098, 1, 1,
0.1962309, -1.094409, 4.200333, 0, 0.6705883, 1, 1,
0.1969962, 1.579956, 0.128524, 0, 0.6627451, 1, 1,
0.2000488, 0.879944, -0.6064392, 0, 0.6588235, 1, 1,
0.2012175, -0.9276885, 4.257413, 0, 0.6509804, 1, 1,
0.2032161, -1.120075, 2.237887, 0, 0.6470588, 1, 1,
0.2057674, 0.8007804, 0.02721819, 0, 0.6392157, 1, 1,
0.2136279, 1.456012, 0.3346413, 0, 0.6352941, 1, 1,
0.2162585, 0.1833585, 1.630265, 0, 0.627451, 1, 1,
0.2193867, 1.41371, -0.3716488, 0, 0.6235294, 1, 1,
0.220775, -1.013845, 2.100222, 0, 0.6156863, 1, 1,
0.2233968, 0.8119836, -0.08629503, 0, 0.6117647, 1, 1,
0.2235869, 0.18422, 2.764447, 0, 0.6039216, 1, 1,
0.2285441, -0.05788413, 1.693017, 0, 0.5960785, 1, 1,
0.2303679, 0.1421856, -0.06120288, 0, 0.5921569, 1, 1,
0.233828, -2.80309, 3.421792, 0, 0.5843138, 1, 1,
0.2368077, -0.2378715, 2.994508, 0, 0.5803922, 1, 1,
0.238041, 1.927944, 1.056974, 0, 0.572549, 1, 1,
0.2386541, 0.05887854, 2.441591, 0, 0.5686275, 1, 1,
0.2398211, -1.912545, 3.779733, 0, 0.5607843, 1, 1,
0.240743, -0.9081513, 4.292605, 0, 0.5568628, 1, 1,
0.2438918, 1.547391, -1.764835, 0, 0.5490196, 1, 1,
0.2479358, 1.386205, 0.6265753, 0, 0.5450981, 1, 1,
0.2488109, -0.5809395, 3.205696, 0, 0.5372549, 1, 1,
0.2537119, -0.5836697, 2.484934, 0, 0.5333334, 1, 1,
0.2558859, 0.3550954, 1.43596, 0, 0.5254902, 1, 1,
0.256507, -0.2800468, 2.157091, 0, 0.5215687, 1, 1,
0.2592885, -1.193363, 2.706545, 0, 0.5137255, 1, 1,
0.2608708, 0.5626042, -1.019644, 0, 0.509804, 1, 1,
0.2629639, 0.6494235, -0.4412539, 0, 0.5019608, 1, 1,
0.2630751, -1.345487, 2.658679, 0, 0.4941176, 1, 1,
0.2650306, -0.6273294, 2.629214, 0, 0.4901961, 1, 1,
0.2668765, -0.5272273, 0.8860229, 0, 0.4823529, 1, 1,
0.2692047, -1.174618, 3.660587, 0, 0.4784314, 1, 1,
0.2885365, -0.9141759, 3.738369, 0, 0.4705882, 1, 1,
0.2899647, -0.09264351, 2.75203, 0, 0.4666667, 1, 1,
0.2950958, 1.891069, -2.200963, 0, 0.4588235, 1, 1,
0.297612, -0.4057877, 3.955414, 0, 0.454902, 1, 1,
0.2986703, -0.2262542, 1.459584, 0, 0.4470588, 1, 1,
0.3019432, -1.163656, 2.644655, 0, 0.4431373, 1, 1,
0.3037253, -1.167424, 3.405108, 0, 0.4352941, 1, 1,
0.3042732, 1.182564, 0.9887687, 0, 0.4313726, 1, 1,
0.3047811, 0.3131839, 1.604252, 0, 0.4235294, 1, 1,
0.3055364, 0.463634, 0.8901861, 0, 0.4196078, 1, 1,
0.3058319, 1.154152, -0.07691244, 0, 0.4117647, 1, 1,
0.3073909, -0.3892421, 4.041645, 0, 0.4078431, 1, 1,
0.307892, 0.1277172, -0.2215696, 0, 0.4, 1, 1,
0.3079041, 0.4501294, 2.030612, 0, 0.3921569, 1, 1,
0.3141598, -1.483245, 3.623962, 0, 0.3882353, 1, 1,
0.3172418, -0.01448905, 1.668912, 0, 0.3803922, 1, 1,
0.323221, -0.6094107, 3.223379, 0, 0.3764706, 1, 1,
0.3233496, 1.077656, 0.7263492, 0, 0.3686275, 1, 1,
0.3238097, 0.1422733, 2.629555, 0, 0.3647059, 1, 1,
0.3245632, 0.2738255, 0.3365179, 0, 0.3568628, 1, 1,
0.3263274, 0.8494205, -0.1267017, 0, 0.3529412, 1, 1,
0.3268453, -0.803675, 4.258241, 0, 0.345098, 1, 1,
0.3292373, 1.148013, 0.7093222, 0, 0.3411765, 1, 1,
0.3342585, 0.1113258, 2.588066, 0, 0.3333333, 1, 1,
0.3357055, 1.548063, -1.598464, 0, 0.3294118, 1, 1,
0.33665, -1.13407, 3.330267, 0, 0.3215686, 1, 1,
0.3371747, -0.2904072, 2.32267, 0, 0.3176471, 1, 1,
0.3398764, 1.637113, -0.06251092, 0, 0.3098039, 1, 1,
0.3502197, 0.1722432, 2.615936, 0, 0.3058824, 1, 1,
0.3508623, 0.272393, 0.5483125, 0, 0.2980392, 1, 1,
0.350924, 0.771347, -0.5969008, 0, 0.2901961, 1, 1,
0.3512702, -0.3915737, 3.923218, 0, 0.2862745, 1, 1,
0.3560072, 1.224157, 0.7067171, 0, 0.2784314, 1, 1,
0.3564144, 2.571187, 1.315569, 0, 0.2745098, 1, 1,
0.3589235, -0.003352737, 2.454803, 0, 0.2666667, 1, 1,
0.3606124, -0.4487599, 2.572456, 0, 0.2627451, 1, 1,
0.3615589, 0.3351323, 1.5814, 0, 0.254902, 1, 1,
0.3619629, 1.025903, -0.0112832, 0, 0.2509804, 1, 1,
0.3631465, -0.02762667, 0.5686495, 0, 0.2431373, 1, 1,
0.3635128, 0.7101012, 2.337039, 0, 0.2392157, 1, 1,
0.3669063, -0.2837583, 1.70922, 0, 0.2313726, 1, 1,
0.3706647, 1.611509, -1.103743, 0, 0.227451, 1, 1,
0.372689, -0.3047897, 1.459566, 0, 0.2196078, 1, 1,
0.3730395, -2.282538, 2.200234, 0, 0.2156863, 1, 1,
0.3781869, 2.250173, -0.2886603, 0, 0.2078431, 1, 1,
0.3805519, 1.045729, 1.934942, 0, 0.2039216, 1, 1,
0.3815269, -0.2545919, 1.403098, 0, 0.1960784, 1, 1,
0.3819357, 1.682734, 0.5954253, 0, 0.1882353, 1, 1,
0.381944, 1.366697, -1.116708, 0, 0.1843137, 1, 1,
0.3835272, 1.044463, 1.38079, 0, 0.1764706, 1, 1,
0.3888975, -1.307802, 3.105482, 0, 0.172549, 1, 1,
0.3906484, 0.870102, 0.04793193, 0, 0.1647059, 1, 1,
0.3975927, -0.5129979, 1.974869, 0, 0.1607843, 1, 1,
0.3987595, 1.305829, 0.5705701, 0, 0.1529412, 1, 1,
0.3987689, -0.4450759, 2.602647, 0, 0.1490196, 1, 1,
0.4019106, 0.08916942, 0.7140839, 0, 0.1411765, 1, 1,
0.4029922, 1.01068, -1.017866, 0, 0.1372549, 1, 1,
0.4032697, 0.7457488, 2.873231, 0, 0.1294118, 1, 1,
0.403722, -0.6108463, -0.1463039, 0, 0.1254902, 1, 1,
0.4045955, -0.1673069, 2.876755, 0, 0.1176471, 1, 1,
0.4060812, -0.7348502, 4.264789, 0, 0.1137255, 1, 1,
0.407128, -1.339215, 2.378123, 0, 0.1058824, 1, 1,
0.4074205, 0.3874346, 1.899271, 0, 0.09803922, 1, 1,
0.4127409, -0.6947137, 2.452147, 0, 0.09411765, 1, 1,
0.4152288, -0.2742315, 0.7581773, 0, 0.08627451, 1, 1,
0.4184605, -1.664253, 2.832305, 0, 0.08235294, 1, 1,
0.4237062, 1.322062, -1.435674, 0, 0.07450981, 1, 1,
0.4281673, -1.02304, 2.644183, 0, 0.07058824, 1, 1,
0.4304049, 0.4605077, -0.05912601, 0, 0.0627451, 1, 1,
0.4331512, -0.2859319, 2.047349, 0, 0.05882353, 1, 1,
0.4334753, 0.5430969, 0.1429419, 0, 0.05098039, 1, 1,
0.4335423, 0.3904858, 1.278751, 0, 0.04705882, 1, 1,
0.4407026, -0.14494, 2.352226, 0, 0.03921569, 1, 1,
0.4419428, -0.8940958, 2.88451, 0, 0.03529412, 1, 1,
0.4442113, 1.505355, 2.082053, 0, 0.02745098, 1, 1,
0.4469743, 0.1978313, 1.638717, 0, 0.02352941, 1, 1,
0.4479151, -1.294264, 2.935346, 0, 0.01568628, 1, 1,
0.449523, 0.9123657, 0.9349551, 0, 0.01176471, 1, 1,
0.4561054, -1.652954, 2.451952, 0, 0.003921569, 1, 1,
0.4589265, -0.5113209, 4.197211, 0.003921569, 0, 1, 1,
0.4645448, -0.3879926, 3.328778, 0.007843138, 0, 1, 1,
0.4709765, -0.431411, 1.985542, 0.01568628, 0, 1, 1,
0.4750113, 1.358566, 0.7044773, 0.01960784, 0, 1, 1,
0.4759265, -0.7184209, 2.261638, 0.02745098, 0, 1, 1,
0.4794895, -0.04288291, 2.12352, 0.03137255, 0, 1, 1,
0.4804947, 1.2063, 0.7186219, 0.03921569, 0, 1, 1,
0.480612, -0.576983, 0.7664233, 0.04313726, 0, 1, 1,
0.483879, -0.788571, 2.662625, 0.05098039, 0, 1, 1,
0.4875997, 0.06335532, 1.721754, 0.05490196, 0, 1, 1,
0.4889649, 0.4524243, 1.852439, 0.0627451, 0, 1, 1,
0.4919945, -0.8236379, 1.129795, 0.06666667, 0, 1, 1,
0.4923814, 0.7967343, 1.196908, 0.07450981, 0, 1, 1,
0.5015929, 0.253183, 0.9049847, 0.07843138, 0, 1, 1,
0.5023644, -0.05383485, 0.2072103, 0.08627451, 0, 1, 1,
0.5028647, 0.1357193, 2.072154, 0.09019608, 0, 1, 1,
0.5031945, 0.5134489, 0.4337253, 0.09803922, 0, 1, 1,
0.5098585, -1.031684, 3.293734, 0.1058824, 0, 1, 1,
0.5134193, -1.495971, 3.582334, 0.1098039, 0, 1, 1,
0.5138664, 0.2916646, 1.573956, 0.1176471, 0, 1, 1,
0.5147941, -0.05012334, -0.8642318, 0.1215686, 0, 1, 1,
0.5150482, -0.9379219, 1.782385, 0.1294118, 0, 1, 1,
0.5202199, -0.09044041, 1.967475, 0.1333333, 0, 1, 1,
0.5213805, -1.473131, 0.7933412, 0.1411765, 0, 1, 1,
0.5244037, -0.2985138, 0.6722817, 0.145098, 0, 1, 1,
0.5263007, 1.367117, -0.6293934, 0.1529412, 0, 1, 1,
0.5269249, -0.2131713, 3.548037, 0.1568628, 0, 1, 1,
0.5344488, 0.2552607, 2.501305, 0.1647059, 0, 1, 1,
0.5352821, -1.090283, 3.14257, 0.1686275, 0, 1, 1,
0.5374835, 0.1956531, 0.6955553, 0.1764706, 0, 1, 1,
0.5453937, -0.8168719, 2.917943, 0.1803922, 0, 1, 1,
0.5536223, 0.09714248, 1.090781, 0.1882353, 0, 1, 1,
0.5544134, -0.06136025, 1.780923, 0.1921569, 0, 1, 1,
0.5546296, 0.8413398, 1.475172, 0.2, 0, 1, 1,
0.5573862, 0.37392, -0.06283429, 0.2078431, 0, 1, 1,
0.5589087, 0.1748686, 1.081927, 0.2117647, 0, 1, 1,
0.5626787, 0.473632, -0.2075917, 0.2196078, 0, 1, 1,
0.5632854, -1.214044, 3.750749, 0.2235294, 0, 1, 1,
0.5641253, -1.028068, 3.086412, 0.2313726, 0, 1, 1,
0.5666388, 0.1739725, 1.02537, 0.2352941, 0, 1, 1,
0.567808, 2.890384, 0.4304973, 0.2431373, 0, 1, 1,
0.5751268, -0.1335734, 2.589346, 0.2470588, 0, 1, 1,
0.5757495, -1.615493, 2.104361, 0.254902, 0, 1, 1,
0.5802878, -0.4170398, 2.952729, 0.2588235, 0, 1, 1,
0.5813836, 0.8950916, -0.2502887, 0.2666667, 0, 1, 1,
0.584394, 0.7593741, 0.1294713, 0.2705882, 0, 1, 1,
0.5913864, 0.3242575, 1.117898, 0.2784314, 0, 1, 1,
0.5951668, -0.1129622, 1.920699, 0.282353, 0, 1, 1,
0.5983437, 0.8544133, 1.088176, 0.2901961, 0, 1, 1,
0.5993424, -0.5218876, 2.343525, 0.2941177, 0, 1, 1,
0.5995497, -0.4294212, 1.869124, 0.3019608, 0, 1, 1,
0.6003086, -1.102027, 0.6570568, 0.3098039, 0, 1, 1,
0.6018131, 0.7581907, 0.6693588, 0.3137255, 0, 1, 1,
0.6054796, 0.1249783, 1.405167, 0.3215686, 0, 1, 1,
0.6069188, -1.241862, 4.048734, 0.3254902, 0, 1, 1,
0.6069806, 0.6060405, 0.7242007, 0.3333333, 0, 1, 1,
0.6186992, 0.4819786, 0.3107245, 0.3372549, 0, 1, 1,
0.6252149, -0.1224094, 1.405716, 0.345098, 0, 1, 1,
0.6283426, 0.7458423, 0.9897292, 0.3490196, 0, 1, 1,
0.6305957, 0.1048553, 1.602077, 0.3568628, 0, 1, 1,
0.6332188, -2.232942, 1.659296, 0.3607843, 0, 1, 1,
0.6336599, -0.3735627, 2.360322, 0.3686275, 0, 1, 1,
0.6380231, 1.781877, 0.6640671, 0.372549, 0, 1, 1,
0.638218, 1.32908, 2.818458, 0.3803922, 0, 1, 1,
0.6400232, -0.008184676, 1.283971, 0.3843137, 0, 1, 1,
0.6422808, 1.918828, -0.7377679, 0.3921569, 0, 1, 1,
0.6433253, 0.8769524, 1.484852, 0.3960784, 0, 1, 1,
0.6440132, -0.8721396, 2.737938, 0.4039216, 0, 1, 1,
0.6441035, 0.2384435, 1.724624, 0.4117647, 0, 1, 1,
0.6448417, 1.149238, -0.9038637, 0.4156863, 0, 1, 1,
0.6476178, 0.835907, -0.3057309, 0.4235294, 0, 1, 1,
0.6554793, -1.314704, 3.342834, 0.427451, 0, 1, 1,
0.6598097, -0.6869244, 1.260997, 0.4352941, 0, 1, 1,
0.6610083, 1.235606, 0.1252989, 0.4392157, 0, 1, 1,
0.6621451, -2.222249, 2.524496, 0.4470588, 0, 1, 1,
0.6690897, -1.205094, 3.351884, 0.4509804, 0, 1, 1,
0.6729642, -1.748585, 3.076783, 0.4588235, 0, 1, 1,
0.6802005, -1.44478, 2.971719, 0.4627451, 0, 1, 1,
0.6808193, 0.2025301, 3.17372, 0.4705882, 0, 1, 1,
0.6845242, -0.6827758, 3.929826, 0.4745098, 0, 1, 1,
0.6863581, 0.1417061, 0.7679255, 0.4823529, 0, 1, 1,
0.6906199, 0.5973975, 1.525847, 0.4862745, 0, 1, 1,
0.6909993, 2.045733, 0.3923929, 0.4941176, 0, 1, 1,
0.6912199, -0.7649959, 0.3983918, 0.5019608, 0, 1, 1,
0.6980768, -0.2314101, 3.803244, 0.5058824, 0, 1, 1,
0.7014472, -0.2560965, 1.60445, 0.5137255, 0, 1, 1,
0.7089925, 2.091194, 0.896607, 0.5176471, 0, 1, 1,
0.7128389, 2.373776, 0.7905151, 0.5254902, 0, 1, 1,
0.7144214, 0.07556736, 1.039806, 0.5294118, 0, 1, 1,
0.7192463, 0.5134536, 0.02279423, 0.5372549, 0, 1, 1,
0.7217801, 1.489553, 1.46945, 0.5411765, 0, 1, 1,
0.7235755, -0.1220581, 2.368238, 0.5490196, 0, 1, 1,
0.7245848, -0.525359, 1.230024, 0.5529412, 0, 1, 1,
0.7273709, -0.2766274, 1.354304, 0.5607843, 0, 1, 1,
0.730526, -0.1852576, 1.546972, 0.5647059, 0, 1, 1,
0.7310147, 0.556221, 1.3082, 0.572549, 0, 1, 1,
0.7313798, -1.396251, 3.176171, 0.5764706, 0, 1, 1,
0.7330363, 0.9277155, 1.112613, 0.5843138, 0, 1, 1,
0.7473861, -0.6403173, 2.444907, 0.5882353, 0, 1, 1,
0.7517524, -1.590848, 2.16945, 0.5960785, 0, 1, 1,
0.7620739, -0.89832, 3.747017, 0.6039216, 0, 1, 1,
0.7629251, 0.8703687, 3.253507, 0.6078432, 0, 1, 1,
0.7629759, -0.8371517, 3.121566, 0.6156863, 0, 1, 1,
0.7774013, -0.7903624, 2.68714, 0.6196079, 0, 1, 1,
0.7793851, 0.7678044, 0.6695324, 0.627451, 0, 1, 1,
0.7815228, -1.085609, 1.925253, 0.6313726, 0, 1, 1,
0.7829741, -0.3530896, 0.5439842, 0.6392157, 0, 1, 1,
0.7870655, 0.5119978, -0.1844355, 0.6431373, 0, 1, 1,
0.7882347, 0.09721942, 1.674106, 0.6509804, 0, 1, 1,
0.7915203, 0.7952086, 1.14808, 0.654902, 0, 1, 1,
0.7940882, -0.6181156, 2.749443, 0.6627451, 0, 1, 1,
0.7947711, 0.1511891, 2.828021, 0.6666667, 0, 1, 1,
0.8043144, -0.08432181, 2.242592, 0.6745098, 0, 1, 1,
0.8081054, -0.2559302, 0.6049709, 0.6784314, 0, 1, 1,
0.8137162, 0.7738948, 0.9718795, 0.6862745, 0, 1, 1,
0.8178858, -1.050848, 4.244869, 0.6901961, 0, 1, 1,
0.8228337, 2.261675, 1.102516, 0.6980392, 0, 1, 1,
0.8245259, 1.365088, -0.6137466, 0.7058824, 0, 1, 1,
0.8329386, 1.485856, -0.1870846, 0.7098039, 0, 1, 1,
0.8334179, -1.152351, 2.796897, 0.7176471, 0, 1, 1,
0.8489619, -0.5967123, 3.21399, 0.7215686, 0, 1, 1,
0.8535033, -1.470376, 2.640157, 0.7294118, 0, 1, 1,
0.8539159, 1.025452, 0.2352538, 0.7333333, 0, 1, 1,
0.8573697, -0.7236528, 2.162382, 0.7411765, 0, 1, 1,
0.8582559, 0.716378, 1.273315, 0.7450981, 0, 1, 1,
0.8735842, -1.33496, 1.468572, 0.7529412, 0, 1, 1,
0.8783748, -0.4376182, 0.5876784, 0.7568628, 0, 1, 1,
0.880345, 0.641933, 0.289657, 0.7647059, 0, 1, 1,
0.8839704, -1.21979, 1.764656, 0.7686275, 0, 1, 1,
0.8843945, 0.7233282, -0.0004692302, 0.7764706, 0, 1, 1,
0.8867885, -1.566771, 5.288191, 0.7803922, 0, 1, 1,
0.8888025, 0.2228682, -0.4744112, 0.7882353, 0, 1, 1,
0.8915455, 0.7526571, 0.7068803, 0.7921569, 0, 1, 1,
0.893977, -1.599654, 4.360503, 0.8, 0, 1, 1,
0.9051679, 0.08054575, 0.9639803, 0.8078431, 0, 1, 1,
0.9055027, 1.818336, -0.002612685, 0.8117647, 0, 1, 1,
0.9059135, 1.571193, 2.129658, 0.8196079, 0, 1, 1,
0.9060054, -0.4799737, -0.2214922, 0.8235294, 0, 1, 1,
0.9063808, -3.540784, 2.790869, 0.8313726, 0, 1, 1,
0.9074356, 0.4553942, 0.5130888, 0.8352941, 0, 1, 1,
0.9203907, 1.976285, 1.586234, 0.8431373, 0, 1, 1,
0.9233451, -0.475476, 2.430837, 0.8470588, 0, 1, 1,
0.9247069, -0.2165939, 2.002379, 0.854902, 0, 1, 1,
0.9302012, 1.884317, 1.215565, 0.8588235, 0, 1, 1,
0.9317211, 1.434679, 0.8655159, 0.8666667, 0, 1, 1,
0.9317324, 0.0314301, 1.779226, 0.8705882, 0, 1, 1,
0.939641, -1.185743, 1.570177, 0.8784314, 0, 1, 1,
0.9451907, 0.4783936, -0.2704313, 0.8823529, 0, 1, 1,
0.957436, 2.449018, -0.282122, 0.8901961, 0, 1, 1,
0.9578148, -2.038772, 3.424644, 0.8941177, 0, 1, 1,
0.9586248, 1.597287, 1.511209, 0.9019608, 0, 1, 1,
0.9626962, -0.7678394, 1.025431, 0.9098039, 0, 1, 1,
0.9634072, -0.6262698, 0.7763273, 0.9137255, 0, 1, 1,
0.963546, 0.7737371, -1.90966, 0.9215686, 0, 1, 1,
0.9651337, 0.1659504, 0.4559381, 0.9254902, 0, 1, 1,
0.9672123, 0.5110978, 1.522616, 0.9333333, 0, 1, 1,
0.9705896, -0.1600158, 1.649922, 0.9372549, 0, 1, 1,
0.9706577, -0.07008494, 2.794199, 0.945098, 0, 1, 1,
0.9710606, -0.05943454, 1.275001, 0.9490196, 0, 1, 1,
0.9724177, 1.146536, 0.4805121, 0.9568627, 0, 1, 1,
0.9729248, 1.000483, 2.063313, 0.9607843, 0, 1, 1,
0.973974, 0.2203348, 2.493028, 0.9686275, 0, 1, 1,
0.9743471, -0.6307715, 1.73133, 0.972549, 0, 1, 1,
0.976651, 2.257883, -1.077721, 0.9803922, 0, 1, 1,
0.9776709, 0.5053697, 1.45828, 0.9843137, 0, 1, 1,
0.9791677, -0.5436465, 0.8063045, 0.9921569, 0, 1, 1,
0.9805661, -1.883077, 2.049187, 0.9960784, 0, 1, 1,
0.9807289, 0.8556607, 0.9915406, 1, 0, 0.9960784, 1,
0.9828925, 0.07542607, 1.69768, 1, 0, 0.9882353, 1,
0.9837387, 1.787541, 0.62755, 1, 0, 0.9843137, 1,
0.9842589, -2.075144, 2.523664, 1, 0, 0.9764706, 1,
0.9856612, 1.09262, 1.621688, 1, 0, 0.972549, 1,
0.9870641, 1.608752, 0.5251924, 1, 0, 0.9647059, 1,
0.99266, -0.2624764, 0.5011596, 1, 0, 0.9607843, 1,
1.003149, 0.489233, 2.085302, 1, 0, 0.9529412, 1,
1.00417, 0.01914962, 0.6066121, 1, 0, 0.9490196, 1,
1.005108, 0.3233116, 1.819379, 1, 0, 0.9411765, 1,
1.006205, -0.5374524, 1.028157, 1, 0, 0.9372549, 1,
1.00835, 0.9148453, 3.083845, 1, 0, 0.9294118, 1,
1.008958, -2.101816, 1.501504, 1, 0, 0.9254902, 1,
1.016672, -0.8477446, 1.327691, 1, 0, 0.9176471, 1,
1.02577, -0.8389221, 1.020576, 1, 0, 0.9137255, 1,
1.026892, 0.01773584, 0.663538, 1, 0, 0.9058824, 1,
1.02713, -0.9557712, 2.029764, 1, 0, 0.9019608, 1,
1.027166, -1.243199, 2.589612, 1, 0, 0.8941177, 1,
1.029694, 0.6582026, 1.415578, 1, 0, 0.8862745, 1,
1.033983, -1.901361, 2.593926, 1, 0, 0.8823529, 1,
1.034056, 1.051893, 1.851812, 1, 0, 0.8745098, 1,
1.034398, -1.806274, 0.3627393, 1, 0, 0.8705882, 1,
1.044281, -0.227999, 0.1307182, 1, 0, 0.8627451, 1,
1.046629, 0.03977701, 0.6769165, 1, 0, 0.8588235, 1,
1.053282, 1.118694, 2.652787, 1, 0, 0.8509804, 1,
1.058148, -1.366194, 1.749635, 1, 0, 0.8470588, 1,
1.05968, 1.828899, 0.9951015, 1, 0, 0.8392157, 1,
1.064772, 2.649233, 2.612369, 1, 0, 0.8352941, 1,
1.065007, -0.511151, 2.338543, 1, 0, 0.827451, 1,
1.065405, 1.301589, 0.2437267, 1, 0, 0.8235294, 1,
1.068673, 0.3338655, 1.166086, 1, 0, 0.8156863, 1,
1.080315, -0.8874818, 2.381706, 1, 0, 0.8117647, 1,
1.089311, 0.07289609, 1.02101, 1, 0, 0.8039216, 1,
1.102664, -0.190953, 1.003621, 1, 0, 0.7960784, 1,
1.105168, 1.706622, 1.233594, 1, 0, 0.7921569, 1,
1.109847, 1.347451, 1.495021, 1, 0, 0.7843137, 1,
1.124524, 1.002793, 1.16667, 1, 0, 0.7803922, 1,
1.12584, 0.3827273, 1.193443, 1, 0, 0.772549, 1,
1.13158, 3.076952, 1.051272, 1, 0, 0.7686275, 1,
1.136021, -1.587448, 1.682246, 1, 0, 0.7607843, 1,
1.143771, 0.4856386, -0.3743576, 1, 0, 0.7568628, 1,
1.148615, 0.4133399, 2.083631, 1, 0, 0.7490196, 1,
1.158172, 0.5566844, 0.5518745, 1, 0, 0.7450981, 1,
1.163339, -2.609764, 3.830592, 1, 0, 0.7372549, 1,
1.167857, 0.7479893, 1.829886, 1, 0, 0.7333333, 1,
1.170327, -0.06399082, 1.90352, 1, 0, 0.7254902, 1,
1.171544, 0.007212882, 1.819227, 1, 0, 0.7215686, 1,
1.178678, -1.884079, 2.077562, 1, 0, 0.7137255, 1,
1.184795, -0.4480291, 0.4809516, 1, 0, 0.7098039, 1,
1.186446, -0.3466006, 1.738133, 1, 0, 0.7019608, 1,
1.190684, 1.488697, -0.884172, 1, 0, 0.6941177, 1,
1.192822, 0.7146127, 1.122061, 1, 0, 0.6901961, 1,
1.195033, -0.4184349, 2.524095, 1, 0, 0.682353, 1,
1.198298, -1.932213, 4.777406, 1, 0, 0.6784314, 1,
1.202116, -0.5563473, 3.748157, 1, 0, 0.6705883, 1,
1.20644, 1.066408, 2.14319, 1, 0, 0.6666667, 1,
1.210772, 0.2365482, 1.832265, 1, 0, 0.6588235, 1,
1.218806, -0.894169, 2.813442, 1, 0, 0.654902, 1,
1.22746, 0.2725475, 0.8053735, 1, 0, 0.6470588, 1,
1.227885, -0.3095437, 0.9826341, 1, 0, 0.6431373, 1,
1.23901, 1.052715, 0.8815137, 1, 0, 0.6352941, 1,
1.249655, -0.1534392, 3.17191, 1, 0, 0.6313726, 1,
1.251537, 1.994386, -0.4489416, 1, 0, 0.6235294, 1,
1.2518, 0.8696285, 1.130813, 1, 0, 0.6196079, 1,
1.253996, -0.5937899, 2.183049, 1, 0, 0.6117647, 1,
1.256786, -1.013023, 1.057179, 1, 0, 0.6078432, 1,
1.261878, -0.8738645, 0.4700945, 1, 0, 0.6, 1,
1.269063, -1.912053, 0.613702, 1, 0, 0.5921569, 1,
1.273925, -0.3633081, 0.628338, 1, 0, 0.5882353, 1,
1.295638, -0.8257705, 1.228299, 1, 0, 0.5803922, 1,
1.301935, 0.8638744, 1.190997, 1, 0, 0.5764706, 1,
1.305055, -1.325967, 0.5955564, 1, 0, 0.5686275, 1,
1.308242, -0.570329, 2.440921, 1, 0, 0.5647059, 1,
1.314083, 0.6094211, 0.8878127, 1, 0, 0.5568628, 1,
1.320769, 0.3826141, 1.239917, 1, 0, 0.5529412, 1,
1.321611, -1.185498, 0.4477757, 1, 0, 0.5450981, 1,
1.325953, 1.08229, 1.943972, 1, 0, 0.5411765, 1,
1.326095, 0.7461208, 0.5744441, 1, 0, 0.5333334, 1,
1.32764, -1.811428, 2.993723, 1, 0, 0.5294118, 1,
1.328786, -1.400743, 3.164394, 1, 0, 0.5215687, 1,
1.335779, 0.4264627, 1.471637, 1, 0, 0.5176471, 1,
1.34128, -0.6122836, 2.265444, 1, 0, 0.509804, 1,
1.341506, 0.8266949, 0.2867553, 1, 0, 0.5058824, 1,
1.342831, 0.8155378, 1.666492, 1, 0, 0.4980392, 1,
1.345647, -0.8021237, 1.547618, 1, 0, 0.4901961, 1,
1.349406, 0.3418697, 0.7977225, 1, 0, 0.4862745, 1,
1.34971, -0.8484921, 3.30493, 1, 0, 0.4784314, 1,
1.349915, -0.6646278, 1.715981, 1, 0, 0.4745098, 1,
1.358159, -0.9602194, 4.460888, 1, 0, 0.4666667, 1,
1.358734, -0.9761466, 2.249496, 1, 0, 0.4627451, 1,
1.368275, 2.819769, -0.4715951, 1, 0, 0.454902, 1,
1.37627, -0.4509325, 0.3209011, 1, 0, 0.4509804, 1,
1.377844, 0.6908194, 3.643852, 1, 0, 0.4431373, 1,
1.392461, -1.538828, 1.443699, 1, 0, 0.4392157, 1,
1.398205, 2.556508, 2.087117, 1, 0, 0.4313726, 1,
1.410371, -0.9254295, 2.216985, 1, 0, 0.427451, 1,
1.413472, 1.122776, 0.7264503, 1, 0, 0.4196078, 1,
1.417808, 0.1376221, 0.5161164, 1, 0, 0.4156863, 1,
1.420698, 0.1461338, 1.600492, 1, 0, 0.4078431, 1,
1.430096, -1.951662, 2.658767, 1, 0, 0.4039216, 1,
1.439974, 1.433626, 1.751631, 1, 0, 0.3960784, 1,
1.44008, -0.3278395, 3.619596, 1, 0, 0.3882353, 1,
1.456306, -0.3369029, 1.498969, 1, 0, 0.3843137, 1,
1.462074, -0.1619184, 2.381414, 1, 0, 0.3764706, 1,
1.464928, -1.259994, 2.951178, 1, 0, 0.372549, 1,
1.467611, -0.7320288, 5.299414, 1, 0, 0.3647059, 1,
1.468517, 0.06744026, -0.8059579, 1, 0, 0.3607843, 1,
1.485888, 0.3852209, 0.02326077, 1, 0, 0.3529412, 1,
1.496696, -2.078151, 3.351755, 1, 0, 0.3490196, 1,
1.504241, -0.4902077, 2.829487, 1, 0, 0.3411765, 1,
1.507204, 0.8144329, -0.53488, 1, 0, 0.3372549, 1,
1.513981, -0.08804578, 2.221128, 1, 0, 0.3294118, 1,
1.518791, -0.7638985, 3.216898, 1, 0, 0.3254902, 1,
1.541232, -0.3246796, 2.315184, 1, 0, 0.3176471, 1,
1.541429, -0.1794189, 3.16876, 1, 0, 0.3137255, 1,
1.555782, -0.2732249, 2.482877, 1, 0, 0.3058824, 1,
1.571881, 1.265311, 1.966616, 1, 0, 0.2980392, 1,
1.575357, -0.1324798, 1.674899, 1, 0, 0.2941177, 1,
1.576776, 1.326889, 2.542128, 1, 0, 0.2862745, 1,
1.606607, -0.3146799, 3.387185, 1, 0, 0.282353, 1,
1.615187, 0.0942367, 3.218896, 1, 0, 0.2745098, 1,
1.616763, -0.9414296, 3.084209, 1, 0, 0.2705882, 1,
1.626929, 0.006381364, 1.141354, 1, 0, 0.2627451, 1,
1.630459, -1.140577, 0.4986037, 1, 0, 0.2588235, 1,
1.637896, 0.7691166, 0.5497766, 1, 0, 0.2509804, 1,
1.655324, -0.6079957, 4.109792, 1, 0, 0.2470588, 1,
1.657067, 0.3453094, 1.1985, 1, 0, 0.2392157, 1,
1.663299, -0.2485707, 1.601589, 1, 0, 0.2352941, 1,
1.664083, -0.05152595, 2.669739, 1, 0, 0.227451, 1,
1.669291, -0.5548224, 3.436858, 1, 0, 0.2235294, 1,
1.669773, 0.4631388, 1.764981, 1, 0, 0.2156863, 1,
1.67512, -0.6922843, 3.834513, 1, 0, 0.2117647, 1,
1.711255, 1.533535, 1.775943, 1, 0, 0.2039216, 1,
1.740765, -1.260596, -0.01379404, 1, 0, 0.1960784, 1,
1.745754, -0.3180028, 0.7870782, 1, 0, 0.1921569, 1,
1.747809, 0.180609, 1.59147, 1, 0, 0.1843137, 1,
1.755782, -1.45522, 2.060946, 1, 0, 0.1803922, 1,
1.757026, -0.5300758, 1.741658, 1, 0, 0.172549, 1,
1.765127, -0.1237696, 0.5221679, 1, 0, 0.1686275, 1,
1.79386, 1.211174, 2.058174, 1, 0, 0.1607843, 1,
1.798051, 0.2643517, 1.127082, 1, 0, 0.1568628, 1,
1.809161, -0.1173523, 1.339451, 1, 0, 0.1490196, 1,
1.862374, 0.3026623, 1.399936, 1, 0, 0.145098, 1,
1.865066, 0.4109941, 1.185802, 1, 0, 0.1372549, 1,
1.868062, -1.609827, 2.05463, 1, 0, 0.1333333, 1,
1.883761, 0.02367873, 1.65234, 1, 0, 0.1254902, 1,
1.88905, -0.7241936, 1.798182, 1, 0, 0.1215686, 1,
1.895652, -0.937366, 1.766074, 1, 0, 0.1137255, 1,
1.903037, 0.9957368, 2.377021, 1, 0, 0.1098039, 1,
1.942013, -2.02497, 2.039464, 1, 0, 0.1019608, 1,
1.951689, 0.880236, 1.750823, 1, 0, 0.09411765, 1,
1.960159, -1.139927, 1.170832, 1, 0, 0.09019608, 1,
1.972171, -1.89123, 3.89277, 1, 0, 0.08235294, 1,
1.99504, -0.8035123, 4.02011, 1, 0, 0.07843138, 1,
1.997249, 2.049757, 0.8940653, 1, 0, 0.07058824, 1,
2.018273, -1.720172, 2.77947, 1, 0, 0.06666667, 1,
2.067506, 0.9174858, 0.6438094, 1, 0, 0.05882353, 1,
2.080297, 0.1614933, 2.155948, 1, 0, 0.05490196, 1,
2.168164, 1.239247, 3.662623, 1, 0, 0.04705882, 1,
2.351, 0.2087624, 1.302682, 1, 0, 0.04313726, 1,
2.398458, 0.5597737, -0.08512729, 1, 0, 0.03529412, 1,
2.429403, 0.7390017, 0.6875682, 1, 0, 0.03137255, 1,
2.553523, -0.1223668, 2.11253, 1, 0, 0.02352941, 1,
2.576442, 0.5678255, 1.63386, 1, 0, 0.01960784, 1,
2.683098, -1.015188, 2.040379, 1, 0, 0.01176471, 1,
3.367982, 1.590885, 2.479255, 1, 0, 0.007843138, 1
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
0.220192, -4.691709, -7.373919, 0, -0.5, 0.5, 0.5,
0.220192, -4.691709, -7.373919, 1, -0.5, 0.5, 0.5,
0.220192, -4.691709, -7.373919, 1, 1.5, 0.5, 0.5,
0.220192, -4.691709, -7.373919, 0, 1.5, 0.5, 0.5
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
-3.994699, -0.1457244, -7.373919, 0, -0.5, 0.5, 0.5,
-3.994699, -0.1457244, -7.373919, 1, -0.5, 0.5, 0.5,
-3.994699, -0.1457244, -7.373919, 1, 1.5, 0.5, 0.5,
-3.994699, -0.1457244, -7.373919, 0, 1.5, 0.5, 0.5
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
-3.994699, -4.691709, -0.118856, 0, -0.5, 0.5, 0.5,
-3.994699, -4.691709, -0.118856, 1, -0.5, 0.5, 0.5,
-3.994699, -4.691709, -0.118856, 1, 1.5, 0.5, 0.5,
-3.994699, -4.691709, -0.118856, 0, 1.5, 0.5, 0.5
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
-2, -3.642635, -5.699674,
3, -3.642635, -5.699674,
-2, -3.642635, -5.699674,
-2, -3.817481, -5.978715,
-1, -3.642635, -5.699674,
-1, -3.817481, -5.978715,
0, -3.642635, -5.699674,
0, -3.817481, -5.978715,
1, -3.642635, -5.699674,
1, -3.817481, -5.978715,
2, -3.642635, -5.699674,
2, -3.817481, -5.978715,
3, -3.642635, -5.699674,
3, -3.817481, -5.978715
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
-2, -4.167172, -6.536797, 0, -0.5, 0.5, 0.5,
-2, -4.167172, -6.536797, 1, -0.5, 0.5, 0.5,
-2, -4.167172, -6.536797, 1, 1.5, 0.5, 0.5,
-2, -4.167172, -6.536797, 0, 1.5, 0.5, 0.5,
-1, -4.167172, -6.536797, 0, -0.5, 0.5, 0.5,
-1, -4.167172, -6.536797, 1, -0.5, 0.5, 0.5,
-1, -4.167172, -6.536797, 1, 1.5, 0.5, 0.5,
-1, -4.167172, -6.536797, 0, 1.5, 0.5, 0.5,
0, -4.167172, -6.536797, 0, -0.5, 0.5, 0.5,
0, -4.167172, -6.536797, 1, -0.5, 0.5, 0.5,
0, -4.167172, -6.536797, 1, 1.5, 0.5, 0.5,
0, -4.167172, -6.536797, 0, 1.5, 0.5, 0.5,
1, -4.167172, -6.536797, 0, -0.5, 0.5, 0.5,
1, -4.167172, -6.536797, 1, -0.5, 0.5, 0.5,
1, -4.167172, -6.536797, 1, 1.5, 0.5, 0.5,
1, -4.167172, -6.536797, 0, 1.5, 0.5, 0.5,
2, -4.167172, -6.536797, 0, -0.5, 0.5, 0.5,
2, -4.167172, -6.536797, 1, -0.5, 0.5, 0.5,
2, -4.167172, -6.536797, 1, 1.5, 0.5, 0.5,
2, -4.167172, -6.536797, 0, 1.5, 0.5, 0.5,
3, -4.167172, -6.536797, 0, -0.5, 0.5, 0.5,
3, -4.167172, -6.536797, 1, -0.5, 0.5, 0.5,
3, -4.167172, -6.536797, 1, 1.5, 0.5, 0.5,
3, -4.167172, -6.536797, 0, 1.5, 0.5, 0.5
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
-3.022032, -3, -5.699674,
-3.022032, 3, -5.699674,
-3.022032, -3, -5.699674,
-3.184143, -3, -5.978715,
-3.022032, -2, -5.699674,
-3.184143, -2, -5.978715,
-3.022032, -1, -5.699674,
-3.184143, -1, -5.978715,
-3.022032, 0, -5.699674,
-3.184143, 0, -5.978715,
-3.022032, 1, -5.699674,
-3.184143, 1, -5.978715,
-3.022032, 2, -5.699674,
-3.184143, 2, -5.978715,
-3.022032, 3, -5.699674,
-3.184143, 3, -5.978715
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
-3.508365, -3, -6.536797, 0, -0.5, 0.5, 0.5,
-3.508365, -3, -6.536797, 1, -0.5, 0.5, 0.5,
-3.508365, -3, -6.536797, 1, 1.5, 0.5, 0.5,
-3.508365, -3, -6.536797, 0, 1.5, 0.5, 0.5,
-3.508365, -2, -6.536797, 0, -0.5, 0.5, 0.5,
-3.508365, -2, -6.536797, 1, -0.5, 0.5, 0.5,
-3.508365, -2, -6.536797, 1, 1.5, 0.5, 0.5,
-3.508365, -2, -6.536797, 0, 1.5, 0.5, 0.5,
-3.508365, -1, -6.536797, 0, -0.5, 0.5, 0.5,
-3.508365, -1, -6.536797, 1, -0.5, 0.5, 0.5,
-3.508365, -1, -6.536797, 1, 1.5, 0.5, 0.5,
-3.508365, -1, -6.536797, 0, 1.5, 0.5, 0.5,
-3.508365, 0, -6.536797, 0, -0.5, 0.5, 0.5,
-3.508365, 0, -6.536797, 1, -0.5, 0.5, 0.5,
-3.508365, 0, -6.536797, 1, 1.5, 0.5, 0.5,
-3.508365, 0, -6.536797, 0, 1.5, 0.5, 0.5,
-3.508365, 1, -6.536797, 0, -0.5, 0.5, 0.5,
-3.508365, 1, -6.536797, 1, -0.5, 0.5, 0.5,
-3.508365, 1, -6.536797, 1, 1.5, 0.5, 0.5,
-3.508365, 1, -6.536797, 0, 1.5, 0.5, 0.5,
-3.508365, 2, -6.536797, 0, -0.5, 0.5, 0.5,
-3.508365, 2, -6.536797, 1, -0.5, 0.5, 0.5,
-3.508365, 2, -6.536797, 1, 1.5, 0.5, 0.5,
-3.508365, 2, -6.536797, 0, 1.5, 0.5, 0.5,
-3.508365, 3, -6.536797, 0, -0.5, 0.5, 0.5,
-3.508365, 3, -6.536797, 1, -0.5, 0.5, 0.5,
-3.508365, 3, -6.536797, 1, 1.5, 0.5, 0.5,
-3.508365, 3, -6.536797, 0, 1.5, 0.5, 0.5
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
-3.022032, -3.642635, -4,
-3.022032, -3.642635, 4,
-3.022032, -3.642635, -4,
-3.184143, -3.817481, -4,
-3.022032, -3.642635, -2,
-3.184143, -3.817481, -2,
-3.022032, -3.642635, 0,
-3.184143, -3.817481, 0,
-3.022032, -3.642635, 2,
-3.184143, -3.817481, 2,
-3.022032, -3.642635, 4,
-3.184143, -3.817481, 4
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
-3.508365, -4.167172, -4, 0, -0.5, 0.5, 0.5,
-3.508365, -4.167172, -4, 1, -0.5, 0.5, 0.5,
-3.508365, -4.167172, -4, 1, 1.5, 0.5, 0.5,
-3.508365, -4.167172, -4, 0, 1.5, 0.5, 0.5,
-3.508365, -4.167172, -2, 0, -0.5, 0.5, 0.5,
-3.508365, -4.167172, -2, 1, -0.5, 0.5, 0.5,
-3.508365, -4.167172, -2, 1, 1.5, 0.5, 0.5,
-3.508365, -4.167172, -2, 0, 1.5, 0.5, 0.5,
-3.508365, -4.167172, 0, 0, -0.5, 0.5, 0.5,
-3.508365, -4.167172, 0, 1, -0.5, 0.5, 0.5,
-3.508365, -4.167172, 0, 1, 1.5, 0.5, 0.5,
-3.508365, -4.167172, 0, 0, 1.5, 0.5, 0.5,
-3.508365, -4.167172, 2, 0, -0.5, 0.5, 0.5,
-3.508365, -4.167172, 2, 1, -0.5, 0.5, 0.5,
-3.508365, -4.167172, 2, 1, 1.5, 0.5, 0.5,
-3.508365, -4.167172, 2, 0, 1.5, 0.5, 0.5,
-3.508365, -4.167172, 4, 0, -0.5, 0.5, 0.5,
-3.508365, -4.167172, 4, 1, -0.5, 0.5, 0.5,
-3.508365, -4.167172, 4, 1, 1.5, 0.5, 0.5,
-3.508365, -4.167172, 4, 0, 1.5, 0.5, 0.5
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
-3.022032, -3.642635, -5.699674,
-3.022032, 3.351187, -5.699674,
-3.022032, -3.642635, 5.461962,
-3.022032, 3.351187, 5.461962,
-3.022032, -3.642635, -5.699674,
-3.022032, -3.642635, 5.461962,
-3.022032, 3.351187, -5.699674,
-3.022032, 3.351187, 5.461962,
-3.022032, -3.642635, -5.699674,
3.462416, -3.642635, -5.699674,
-3.022032, -3.642635, 5.461962,
3.462416, -3.642635, 5.461962,
-3.022032, 3.351187, -5.699674,
3.462416, 3.351187, -5.699674,
-3.022032, 3.351187, 5.461962,
3.462416, 3.351187, 5.461962,
3.462416, -3.642635, -5.699674,
3.462416, 3.351187, -5.699674,
3.462416, -3.642635, 5.461962,
3.462416, 3.351187, 5.461962,
3.462416, -3.642635, -5.699674,
3.462416, -3.642635, 5.461962,
3.462416, 3.351187, -5.699674,
3.462416, 3.351187, 5.461962
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
var radius = 7.839587;
var distance = 34.87921;
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
mvMatrix.translate( -0.220192, 0.1457244, 0.118856 );
mvMatrix.scale( 1.307176, 1.211972, 0.759415 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.87921);
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
phenylurea<-read.table("phenylurea.xyz")
```

```
## Error in read.table("phenylurea.xyz"): no lines available in input
```

```r
x<-phenylurea$V2
```

```
## Error in eval(expr, envir, enclos): object 'phenylurea' not found
```

```r
y<-phenylurea$V3
```

```
## Error in eval(expr, envir, enclos): object 'phenylurea' not found
```

```r
z<-phenylurea$V4
```

```
## Error in eval(expr, envir, enclos): object 'phenylurea' not found
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
-2.927598, 0.6320412, -0.9760318, 0, 0, 1, 1, 1,
-2.781775, -0.1137935, -0.6026655, 1, 0, 0, 1, 1,
-2.739735, -0.681232, -0.7928349, 1, 0, 0, 1, 1,
-2.584352, 0.2762466, -0.2375187, 1, 0, 0, 1, 1,
-2.410048, -0.2392055, -1.655903, 1, 0, 0, 1, 1,
-2.402347, 0.3766972, -2.097318, 1, 0, 0, 1, 1,
-2.391641, -1.044873, -1.589622, 0, 0, 0, 1, 1,
-2.389646, 1.493476, -1.563842, 0, 0, 0, 1, 1,
-2.357824, 0.2319049, -0.3583976, 0, 0, 0, 1, 1,
-2.343448, -0.03572122, -1.1413, 0, 0, 0, 1, 1,
-2.317963, 1.557295, -1.397712, 0, 0, 0, 1, 1,
-2.293996, 1.580872, 0.08811551, 0, 0, 0, 1, 1,
-2.289442, 0.7269602, -1.01875, 0, 0, 0, 1, 1,
-2.225384, 0.8167701, -1.786739, 1, 1, 1, 1, 1,
-2.212807, -0.3494874, -0.006786909, 1, 1, 1, 1, 1,
-2.208109, -1.153159, -2.691022, 1, 1, 1, 1, 1,
-2.142593, -0.5822737, -1.522264, 1, 1, 1, 1, 1,
-2.117949, 0.4534144, -0.4349215, 1, 1, 1, 1, 1,
-2.11081, -0.6025755, -2.040053, 1, 1, 1, 1, 1,
-2.076282, -1.01559, -2.024686, 1, 1, 1, 1, 1,
-2.068734, 0.01832892, -1.063474, 1, 1, 1, 1, 1,
-2.039196, -0.6629954, -3.597756, 1, 1, 1, 1, 1,
-1.996389, 2.058475, -1.159829, 1, 1, 1, 1, 1,
-1.948974, 0.9367933, -0.5866655, 1, 1, 1, 1, 1,
-1.948455, 0.7471334, -1.874576, 1, 1, 1, 1, 1,
-1.937754, -0.2947269, -2.704634, 1, 1, 1, 1, 1,
-1.904959, 1.531418, 1.153017, 1, 1, 1, 1, 1,
-1.880995, 2.473271, 0.3914593, 1, 1, 1, 1, 1,
-1.871257, 1.579108, -0.8944824, 0, 0, 1, 1, 1,
-1.868361, -0.4205729, -4.810351, 1, 0, 0, 1, 1,
-1.838237, -1.909672, -3.020304, 1, 0, 0, 1, 1,
-1.80639, 0.5570507, -1.330591, 1, 0, 0, 1, 1,
-1.79695, 0.5320563, -1.82387, 1, 0, 0, 1, 1,
-1.794388, -1.81353, -3.152672, 1, 0, 0, 1, 1,
-1.770681, 0.5605224, -0.8628839, 0, 0, 0, 1, 1,
-1.768787, -0.560212, -0.7615554, 0, 0, 0, 1, 1,
-1.767888, 0.3857313, -0.6677846, 0, 0, 0, 1, 1,
-1.762219, 0.07679557, -1.965225, 0, 0, 0, 1, 1,
-1.752139, -0.9810495, -2.110615, 0, 0, 0, 1, 1,
-1.728796, -0.8774267, -3.117746, 0, 0, 0, 1, 1,
-1.727286, -1.008644, -0.8484077, 0, 0, 0, 1, 1,
-1.723854, -0.2002928, -1.723381, 1, 1, 1, 1, 1,
-1.716448, 0.3141495, -0.03700066, 1, 1, 1, 1, 1,
-1.703761, -0.1912046, -1.062238, 1, 1, 1, 1, 1,
-1.695294, -0.314923, 0.1067365, 1, 1, 1, 1, 1,
-1.683005, -0.3766186, -3.020342, 1, 1, 1, 1, 1,
-1.678937, -1.155577, -2.230514, 1, 1, 1, 1, 1,
-1.637252, -0.2552358, -1.185645, 1, 1, 1, 1, 1,
-1.632117, 0.4281394, -1.395981, 1, 1, 1, 1, 1,
-1.612245, -0.3152392, -3.230124, 1, 1, 1, 1, 1,
-1.578375, 1.724449, 0.2386498, 1, 1, 1, 1, 1,
-1.570794, 0.06407052, -1.569072, 1, 1, 1, 1, 1,
-1.563727, 0.07445271, 0.03658799, 1, 1, 1, 1, 1,
-1.560587, -1.604218, -2.740288, 1, 1, 1, 1, 1,
-1.544847, -1.145889, -2.019582, 1, 1, 1, 1, 1,
-1.53821, -0.2542354, -0.5175382, 1, 1, 1, 1, 1,
-1.537184, -1.546577, -2.171589, 0, 0, 1, 1, 1,
-1.512364, 0.2074971, -1.556206, 1, 0, 0, 1, 1,
-1.503243, 0.6787113, -1.18945, 1, 0, 0, 1, 1,
-1.498735, 0.3512982, -2.202271, 1, 0, 0, 1, 1,
-1.486767, 1.544708, 0.5217278, 1, 0, 0, 1, 1,
-1.484606, -0.02162435, -0.1709259, 1, 0, 0, 1, 1,
-1.462497, -0.1582159, -1.73037, 0, 0, 0, 1, 1,
-1.462407, 1.389361, 0.7101287, 0, 0, 0, 1, 1,
-1.461116, 1.862716, -1.666009, 0, 0, 0, 1, 1,
-1.459895, -0.6062335, -1.88179, 0, 0, 0, 1, 1,
-1.455069, -1.106889, -1.657371, 0, 0, 0, 1, 1,
-1.453157, 0.9582704, -1.04006, 0, 0, 0, 1, 1,
-1.452725, -1.156732, -4.096103, 0, 0, 0, 1, 1,
-1.449115, 0.5028528, -0.3058062, 1, 1, 1, 1, 1,
-1.437865, 0.3440106, -2.226225, 1, 1, 1, 1, 1,
-1.433981, 0.36013, -1.595899, 1, 1, 1, 1, 1,
-1.43282, -0.1001073, -0.9637976, 1, 1, 1, 1, 1,
-1.426288, 0.718728, 0.156405, 1, 1, 1, 1, 1,
-1.415806, 0.215235, -1.941338, 1, 1, 1, 1, 1,
-1.414933, 0.5360293, -0.4971908, 1, 1, 1, 1, 1,
-1.413741, 1.595654, -0.0238311, 1, 1, 1, 1, 1,
-1.413583, 0.516798, -0.8378805, 1, 1, 1, 1, 1,
-1.407104, 1.71547, -1.503085, 1, 1, 1, 1, 1,
-1.401841, 0.8804513, -1.41291, 1, 1, 1, 1, 1,
-1.392139, -0.03386602, -2.766598, 1, 1, 1, 1, 1,
-1.387832, -0.7794325, -2.017716, 1, 1, 1, 1, 1,
-1.386335, -1.109835, -0.2942798, 1, 1, 1, 1, 1,
-1.379465, -0.6258867, -1.759929, 1, 1, 1, 1, 1,
-1.371832, 0.7833281, -1.415839, 0, 0, 1, 1, 1,
-1.364129, -1.247276, -2.248714, 1, 0, 0, 1, 1,
-1.357538, -0.6470377, -0.02074369, 1, 0, 0, 1, 1,
-1.337646, 0.3134432, -1.20329, 1, 0, 0, 1, 1,
-1.331728, -1.000741, -2.641936, 1, 0, 0, 1, 1,
-1.330321, 0.1145227, -0.9392453, 1, 0, 0, 1, 1,
-1.321848, -0.06714177, -1.265675, 0, 0, 0, 1, 1,
-1.303189, -1.341616, -1.805213, 0, 0, 0, 1, 1,
-1.302029, 0.1701294, -2.154234, 0, 0, 0, 1, 1,
-1.296748, -0.4599072, -3.239151, 0, 0, 0, 1, 1,
-1.296024, -0.2463135, -2.475689, 0, 0, 0, 1, 1,
-1.291752, -0.6344333, -1.976953, 0, 0, 0, 1, 1,
-1.289975, 1.194563, 0.8821032, 0, 0, 0, 1, 1,
-1.289299, -1.576617, -2.067879, 1, 1, 1, 1, 1,
-1.289, -1.928833, -3.132044, 1, 1, 1, 1, 1,
-1.273743, 1.570332, 0.3688625, 1, 1, 1, 1, 1,
-1.270918, 0.1667926, 0.3101607, 1, 1, 1, 1, 1,
-1.267821, -0.8295238, -1.970596, 1, 1, 1, 1, 1,
-1.26569, 0.5306651, -0.05960171, 1, 1, 1, 1, 1,
-1.263323, 0.8045186, -1.631111, 1, 1, 1, 1, 1,
-1.252432, 0.9974279, 0.1269832, 1, 1, 1, 1, 1,
-1.250015, 0.08216151, -3.581561, 1, 1, 1, 1, 1,
-1.237595, -1.557617, -1.386651, 1, 1, 1, 1, 1,
-1.228098, 0.7586764, -1.482602, 1, 1, 1, 1, 1,
-1.207832, -0.7569202, -2.247904, 1, 1, 1, 1, 1,
-1.207007, 2.326387, -1.471967, 1, 1, 1, 1, 1,
-1.20249, 0.9041097, -3.03099, 1, 1, 1, 1, 1,
-1.200197, -0.8445215, -0.5840989, 1, 1, 1, 1, 1,
-1.186842, 0.3936822, -1.814366, 0, 0, 1, 1, 1,
-1.184802, -0.4566501, -1.889567, 1, 0, 0, 1, 1,
-1.181437, 1.295262, -0.9166586, 1, 0, 0, 1, 1,
-1.181255, 1.800691, -0.9516308, 1, 0, 0, 1, 1,
-1.171283, -0.166307, -0.5646368, 1, 0, 0, 1, 1,
-1.16485, -0.03000121, -0.599698, 1, 0, 0, 1, 1,
-1.159064, 0.7226782, -1.314778, 0, 0, 0, 1, 1,
-1.148567, 0.8173565, -1.419364, 0, 0, 0, 1, 1,
-1.13763, 1.227429, -1.319792, 0, 0, 0, 1, 1,
-1.133427, -0.5766877, -3.076655, 0, 0, 0, 1, 1,
-1.133107, 0.9167293, -3.029227, 0, 0, 0, 1, 1,
-1.121447, -0.4457171, -0.2388296, 0, 0, 0, 1, 1,
-1.120877, -0.9940683, -2.498956, 0, 0, 0, 1, 1,
-1.120734, 1.095188, -0.667734, 1, 1, 1, 1, 1,
-1.113745, 0.7782039, -1.072254, 1, 1, 1, 1, 1,
-1.110426, -0.7173591, -3.744012, 1, 1, 1, 1, 1,
-1.108548, 0.9067946, 1.361804, 1, 1, 1, 1, 1,
-1.098656, -1.498625, -2.368083, 1, 1, 1, 1, 1,
-1.098506, 0.2262229, -2.086032, 1, 1, 1, 1, 1,
-1.091956, 0.2651915, -2.741202, 1, 1, 1, 1, 1,
-1.079372, -0.03219999, -1.899382, 1, 1, 1, 1, 1,
-1.076961, -1.426039, -1.152932, 1, 1, 1, 1, 1,
-1.075625, 0.4379756, -1.521771, 1, 1, 1, 1, 1,
-1.071608, 0.1114926, -1.588532, 1, 1, 1, 1, 1,
-1.069708, -0.3364645, -1.69911, 1, 1, 1, 1, 1,
-1.067082, -0.5033074, -2.085525, 1, 1, 1, 1, 1,
-1.06485, 1.038579, 0.19959, 1, 1, 1, 1, 1,
-1.056257, 0.2550993, -0.1663024, 1, 1, 1, 1, 1,
-1.053646, 0.4879193, -2.375973, 0, 0, 1, 1, 1,
-1.047789, -0.8100994, -3.636664, 1, 0, 0, 1, 1,
-1.041749, -0.9390035, -0.8375719, 1, 0, 0, 1, 1,
-1.038682, -0.01943268, -1.095616, 1, 0, 0, 1, 1,
-1.03397, -1.672621, -3.626415, 1, 0, 0, 1, 1,
-1.032708, -0.4621132, -2.303821, 1, 0, 0, 1, 1,
-1.031422, -2.038136, -4.37898, 0, 0, 0, 1, 1,
-1.025061, 1.753246, -0.6385205, 0, 0, 0, 1, 1,
-1.020799, -1.372838, -3.246516, 0, 0, 0, 1, 1,
-1.017896, 0.6935498, -2.261171, 0, 0, 0, 1, 1,
-1.015765, 1.181958, 0.2144504, 0, 0, 0, 1, 1,
-1.014689, -1.054192, -2.727063, 0, 0, 0, 1, 1,
-1.011534, 0.959293, 0.1021805, 0, 0, 0, 1, 1,
-1.003504, -1.905083, -3.973688, 1, 1, 1, 1, 1,
-1.000212, -0.6987785, -1.563508, 1, 1, 1, 1, 1,
-0.983566, -0.4260341, -2.986145, 1, 1, 1, 1, 1,
-0.9813458, -0.2855732, -2.869077, 1, 1, 1, 1, 1,
-0.9758968, 0.04509156, -2.207955, 1, 1, 1, 1, 1,
-0.9758472, -1.982618, -1.847977, 1, 1, 1, 1, 1,
-0.9743977, -1.468154, -3.268048, 1, 1, 1, 1, 1,
-0.9673303, -0.4688527, -0.3793788, 1, 1, 1, 1, 1,
-0.9672779, 0.5717863, -0.3987803, 1, 1, 1, 1, 1,
-0.9660426, 0.2618318, -0.3528371, 1, 1, 1, 1, 1,
-0.942259, 1.018566, 0.4472988, 1, 1, 1, 1, 1,
-0.9414808, -0.1885096, -1.833578, 1, 1, 1, 1, 1,
-0.9373421, 0.7273147, -1.535288, 1, 1, 1, 1, 1,
-0.9330704, -0.1129185, -2.198851, 1, 1, 1, 1, 1,
-0.9319506, -1.706671, -1.359227, 1, 1, 1, 1, 1,
-0.9268354, -0.3185988, -0.6304398, 0, 0, 1, 1, 1,
-0.9261915, -0.01223827, -1.324723, 1, 0, 0, 1, 1,
-0.917675, -2.013988, -2.896452, 1, 0, 0, 1, 1,
-0.9157886, -0.5665433, -4.210063, 1, 0, 0, 1, 1,
-0.9130203, 0.1660308, -2.325241, 1, 0, 0, 1, 1,
-0.912402, -0.4641295, -3.542283, 1, 0, 0, 1, 1,
-0.9088524, 0.2401137, -1.521853, 0, 0, 0, 1, 1,
-0.9087979, 1.544385, -2.353734, 0, 0, 0, 1, 1,
-0.9067467, 0.6249032, -2.213107, 0, 0, 0, 1, 1,
-0.9064313, -0.2506561, -2.124368, 0, 0, 0, 1, 1,
-0.9030461, 1.113353, -2.545476, 0, 0, 0, 1, 1,
-0.9024974, -1.44168, -3.267689, 0, 0, 0, 1, 1,
-0.9024623, 2.04513, -1.470911, 0, 0, 0, 1, 1,
-0.9010822, -0.803281, -2.557626, 1, 1, 1, 1, 1,
-0.9003885, -0.1241904, -2.000025, 1, 1, 1, 1, 1,
-0.8987682, 1.072158, -0.02667764, 1, 1, 1, 1, 1,
-0.8960807, 0.09993158, -3.022237, 1, 1, 1, 1, 1,
-0.8903589, -0.3552362, -3.019356, 1, 1, 1, 1, 1,
-0.8857317, -2.671373, -3.174566, 1, 1, 1, 1, 1,
-0.8825284, 0.6015885, -1.029227, 1, 1, 1, 1, 1,
-0.8805224, 2.389846, -1.455101, 1, 1, 1, 1, 1,
-0.8784792, -0.2554643, -0.8870323, 1, 1, 1, 1, 1,
-0.8768346, -1.1815, -1.188815, 1, 1, 1, 1, 1,
-0.8709122, 0.4735737, 0.5019974, 1, 1, 1, 1, 1,
-0.8683182, -0.3224571, -2.141813, 1, 1, 1, 1, 1,
-0.8636335, 0.1982926, -2.061594, 1, 1, 1, 1, 1,
-0.8567232, -0.3458596, -3.044613, 1, 1, 1, 1, 1,
-0.8541297, 0.5509201, -0.8494725, 1, 1, 1, 1, 1,
-0.8537386, -0.10974, -2.146504, 0, 0, 1, 1, 1,
-0.8378736, -0.2974277, -1.679059, 1, 0, 0, 1, 1,
-0.8280988, 0.3793715, -1.255136, 1, 0, 0, 1, 1,
-0.8264975, 1.094374, 0.8844118, 1, 0, 0, 1, 1,
-0.8199878, -0.4031178, -2.218511, 1, 0, 0, 1, 1,
-0.8165224, -1.39046, -3.335076, 1, 0, 0, 1, 1,
-0.8149842, -1.6174, -2.319003, 0, 0, 0, 1, 1,
-0.808468, 1.289876, 0.1076697, 0, 0, 0, 1, 1,
-0.8083604, 1.4666, -0.8718369, 0, 0, 0, 1, 1,
-0.7990996, -0.3052008, -2.549212, 0, 0, 0, 1, 1,
-0.7943938, -0.7882141, -0.8439047, 0, 0, 0, 1, 1,
-0.7929043, 0.1120867, -0.5855753, 0, 0, 0, 1, 1,
-0.7923514, -0.08039488, -1.576552, 0, 0, 0, 1, 1,
-0.7878393, 0.6103309, -0.08779123, 1, 1, 1, 1, 1,
-0.7866899, 0.06378689, -1.204243, 1, 1, 1, 1, 1,
-0.7743109, -0.1485435, -1.059276, 1, 1, 1, 1, 1,
-0.7694949, 1.74446, -1.836875, 1, 1, 1, 1, 1,
-0.7629977, -0.6979055, -2.365589, 1, 1, 1, 1, 1,
-0.7629487, -0.5333564, -2.518856, 1, 1, 1, 1, 1,
-0.7629144, 0.9070928, -0.7173471, 1, 1, 1, 1, 1,
-0.7552884, 1.286361, 0.8525997, 1, 1, 1, 1, 1,
-0.7497207, 0.7660483, -0.783753, 1, 1, 1, 1, 1,
-0.7334151, 0.2752419, -3.368916, 1, 1, 1, 1, 1,
-0.729325, -1.323778, -1.953175, 1, 1, 1, 1, 1,
-0.7269629, 0.545248, 1.071861, 1, 1, 1, 1, 1,
-0.7204924, 1.255066, 0.3792368, 1, 1, 1, 1, 1,
-0.7171982, -0.8070933, -1.432999, 1, 1, 1, 1, 1,
-0.7168993, -0.1099568, -3.156833, 1, 1, 1, 1, 1,
-0.7036508, 1.682846, -0.6791168, 0, 0, 1, 1, 1,
-0.7032568, 0.3130516, -1.144282, 1, 0, 0, 1, 1,
-0.696066, 0.5795038, -2.074087, 1, 0, 0, 1, 1,
-0.6936529, -0.7020699, -3.265802, 1, 0, 0, 1, 1,
-0.6935341, -0.09559059, -1.988407, 1, 0, 0, 1, 1,
-0.6922639, 2.481198, -1.945319, 1, 0, 0, 1, 1,
-0.6897612, 0.6980547, 0.7662374, 0, 0, 0, 1, 1,
-0.6855127, -1.221183, -3.651596, 0, 0, 0, 1, 1,
-0.6822535, 0.07833996, -0.4820084, 0, 0, 0, 1, 1,
-0.6801823, -0.3168562, -4.058888, 0, 0, 0, 1, 1,
-0.6777692, -0.1188511, -2.735811, 0, 0, 0, 1, 1,
-0.6715357, 0.1032127, -1.205236, 0, 0, 0, 1, 1,
-0.6697917, 0.9758888, -0.8146499, 0, 0, 0, 1, 1,
-0.6695708, 1.093045, 0.564746, 1, 1, 1, 1, 1,
-0.6646672, -0.4997242, -2.446374, 1, 1, 1, 1, 1,
-0.6634056, -1.99085, -3.973445, 1, 1, 1, 1, 1,
-0.6589515, 2.30418, -0.4587974, 1, 1, 1, 1, 1,
-0.6587881, 1.417232, -1.027907, 1, 1, 1, 1, 1,
-0.6581029, -0.6682763, -3.569227, 1, 1, 1, 1, 1,
-0.6578556, 0.3412012, -2.064687, 1, 1, 1, 1, 1,
-0.6557639, -0.5777116, -1.92881, 1, 1, 1, 1, 1,
-0.6522488, 0.03109971, -1.807506, 1, 1, 1, 1, 1,
-0.6506505, 0.2628919, -1.50032, 1, 1, 1, 1, 1,
-0.6479704, 0.1435062, -0.9549316, 1, 1, 1, 1, 1,
-0.6406102, -0.02942776, -1.662611, 1, 1, 1, 1, 1,
-0.6379305, 0.9780231, -2.491204, 1, 1, 1, 1, 1,
-0.6341221, -0.7071703, -2.422309, 1, 1, 1, 1, 1,
-0.6332935, 0.2053747, -2.358874, 1, 1, 1, 1, 1,
-0.632863, 1.783067, -1.176574, 0, 0, 1, 1, 1,
-0.6297476, 0.6512427, -1.610449, 1, 0, 0, 1, 1,
-0.626176, 0.3580457, 1.265935, 1, 0, 0, 1, 1,
-0.6241257, 0.5846809, -1.167634, 1, 0, 0, 1, 1,
-0.6196554, -0.7153809, -2.790266, 1, 0, 0, 1, 1,
-0.6186901, 0.2182338, -2.608323, 1, 0, 0, 1, 1,
-0.6161076, 0.1795799, -2.395875, 0, 0, 0, 1, 1,
-0.6142402, -1.388162, -0.5436261, 0, 0, 0, 1, 1,
-0.6114635, 1.147263, -2.979843, 0, 0, 0, 1, 1,
-0.6059695, -0.3444724, -2.344815, 0, 0, 0, 1, 1,
-0.6019692, -1.257242, -3.522912, 0, 0, 0, 1, 1,
-0.6007002, 0.5519352, 1.209365, 0, 0, 0, 1, 1,
-0.5983514, 0.7780271, -1.016961, 0, 0, 0, 1, 1,
-0.5952187, 1.227621, -1.884761, 1, 1, 1, 1, 1,
-0.5947617, -1.155493, -1.384893, 1, 1, 1, 1, 1,
-0.5904392, 0.3344493, -1.446651, 1, 1, 1, 1, 1,
-0.5836152, 0.05025672, -1.538116, 1, 1, 1, 1, 1,
-0.5783885, -0.691904, -2.676762, 1, 1, 1, 1, 1,
-0.5648008, 0.09545682, -3.893437, 1, 1, 1, 1, 1,
-0.5640318, -0.3653751, -3.328258, 1, 1, 1, 1, 1,
-0.5622793, -1.862512, -2.14974, 1, 1, 1, 1, 1,
-0.561919, -1.585412, -2.859379, 1, 1, 1, 1, 1,
-0.5618958, -0.1864874, -2.078861, 1, 1, 1, 1, 1,
-0.5599867, -0.1397821, -1.411597, 1, 1, 1, 1, 1,
-0.5575864, 1.482275, -0.1571702, 1, 1, 1, 1, 1,
-0.5567362, 0.4969814, -1.051866, 1, 1, 1, 1, 1,
-0.5551634, -1.08137, -3.372884, 1, 1, 1, 1, 1,
-0.5546394, -0.005545443, -2.061381, 1, 1, 1, 1, 1,
-0.5524371, 0.2714714, -1.053805, 0, 0, 1, 1, 1,
-0.551553, 0.940257, -1.865232, 1, 0, 0, 1, 1,
-0.5432749, -0.2433326, -3.656667, 1, 0, 0, 1, 1,
-0.542517, 0.9227248, 2.188187, 1, 0, 0, 1, 1,
-0.5419879, 0.1198569, -1.403941, 1, 0, 0, 1, 1,
-0.5415357, 0.5919347, -1.287473, 1, 0, 0, 1, 1,
-0.5403284, -0.0783543, -1.855579, 0, 0, 0, 1, 1,
-0.5402981, -1.42236, -2.301886, 0, 0, 0, 1, 1,
-0.5358254, 0.3047221, -0.5070727, 0, 0, 0, 1, 1,
-0.5335569, 0.4578861, -1.128475, 0, 0, 0, 1, 1,
-0.5322022, -1.902312, -0.96451, 0, 0, 0, 1, 1,
-0.5291935, -2.001873, -1.065123, 0, 0, 0, 1, 1,
-0.5287704, 0.08491884, -0.4436167, 0, 0, 0, 1, 1,
-0.5174255, -0.5723236, -1.39556, 1, 1, 1, 1, 1,
-0.5134379, -0.8290018, -3.010569, 1, 1, 1, 1, 1,
-0.5109229, 0.1789548, -1.245046, 1, 1, 1, 1, 1,
-0.5089739, 1.102092, -1.780224, 1, 1, 1, 1, 1,
-0.5064674, -1.452487, -4.727514, 1, 1, 1, 1, 1,
-0.4969167, -0.3117388, -1.870646, 1, 1, 1, 1, 1,
-0.4929868, 1.161134, -0.081521, 1, 1, 1, 1, 1,
-0.4922552, -0.9360643, -1.309936, 1, 1, 1, 1, 1,
-0.4913305, -0.5030934, -1.501992, 1, 1, 1, 1, 1,
-0.4896356, -0.4944156, -1.229466, 1, 1, 1, 1, 1,
-0.4853079, -0.1518682, -2.852607, 1, 1, 1, 1, 1,
-0.4829099, 0.5019544, -0.1701091, 1, 1, 1, 1, 1,
-0.479874, 0.02534091, 0.03363703, 1, 1, 1, 1, 1,
-0.4779087, 1.337031, 0.3160785, 1, 1, 1, 1, 1,
-0.4755113, 1.535419, 0.2900404, 1, 1, 1, 1, 1,
-0.4742306, -0.3983498, -1.433015, 0, 0, 1, 1, 1,
-0.4662614, 1.061834, -1.294811, 1, 0, 0, 1, 1,
-0.4629241, -0.5991635, -3.626385, 1, 0, 0, 1, 1,
-0.459814, 0.6567243, -0.6868832, 1, 0, 0, 1, 1,
-0.4581999, 0.3111908, -1.061576, 1, 0, 0, 1, 1,
-0.4558702, 0.7490448, -0.3984353, 1, 0, 0, 1, 1,
-0.4523081, -2.255881, -1.688637, 0, 0, 0, 1, 1,
-0.4519468, -1.919047, -3.965259, 0, 0, 0, 1, 1,
-0.4494174, -0.6702271, -4.07579, 0, 0, 0, 1, 1,
-0.4487599, -1.982685, -2.934796, 0, 0, 0, 1, 1,
-0.4474935, 1.863261, -0.2815386, 0, 0, 0, 1, 1,
-0.4458558, -0.8981476, -2.109231, 0, 0, 0, 1, 1,
-0.4458039, 1.766642, -1.084142, 0, 0, 0, 1, 1,
-0.4438792, -0.04562885, -2.760723, 1, 1, 1, 1, 1,
-0.4422475, 0.3891158, -1.745285, 1, 1, 1, 1, 1,
-0.440163, -0.2225592, -1.907328, 1, 1, 1, 1, 1,
-0.4352733, 1.92009, -0.2898769, 1, 1, 1, 1, 1,
-0.434969, 0.6828916, -0.8174516, 1, 1, 1, 1, 1,
-0.4260975, 0.7865937, -2.164087, 1, 1, 1, 1, 1,
-0.4257793, -0.01817155, -1.596055, 1, 1, 1, 1, 1,
-0.4241447, -0.3815342, -1.277224, 1, 1, 1, 1, 1,
-0.4200951, 0.3357509, -1.449725, 1, 1, 1, 1, 1,
-0.4180925, 0.2264208, 0.3273067, 1, 1, 1, 1, 1,
-0.414074, 0.3077303, -0.230557, 1, 1, 1, 1, 1,
-0.4064654, -1.233863, -3.366178, 1, 1, 1, 1, 1,
-0.4039024, -1.872012, -1.693235, 1, 1, 1, 1, 1,
-0.4001589, -1.507861, -2.704704, 1, 1, 1, 1, 1,
-0.3947744, -1.577651, -2.284165, 1, 1, 1, 1, 1,
-0.3937058, -2.068852, -1.624897, 0, 0, 1, 1, 1,
-0.3934714, -3.213286, -1.952261, 1, 0, 0, 1, 1,
-0.3866861, -1.082511, -4.259342, 1, 0, 0, 1, 1,
-0.3847078, -0.4856166, -2.181593, 1, 0, 0, 1, 1,
-0.3830209, -2.37387, -2.272867, 1, 0, 0, 1, 1,
-0.3810116, 0.8752641, -0.4260703, 1, 0, 0, 1, 1,
-0.3784934, -2.104125, -1.238412, 0, 0, 0, 1, 1,
-0.377756, -1.76528, -4.737085, 0, 0, 0, 1, 1,
-0.3658332, 0.3384499, -0.4723426, 0, 0, 0, 1, 1,
-0.3648463, -0.8246536, -3.353038, 0, 0, 0, 1, 1,
-0.3639701, -0.1028379, -3.026276, 0, 0, 0, 1, 1,
-0.3612271, 0.4831437, -1.291248, 0, 0, 0, 1, 1,
-0.3599223, -0.126624, -0.6537399, 0, 0, 0, 1, 1,
-0.3522775, -0.4613286, -3.9366, 1, 1, 1, 1, 1,
-0.3501609, 1.749592, 1.528334, 1, 1, 1, 1, 1,
-0.3449227, 0.07654508, -1.89158, 1, 1, 1, 1, 1,
-0.3273379, 0.6994972, 0.8140709, 1, 1, 1, 1, 1,
-0.3213432, -0.8740032, -2.33196, 1, 1, 1, 1, 1,
-0.3198377, 0.9701323, 0.4499737, 1, 1, 1, 1, 1,
-0.3185058, -0.2906045, -1.547513, 1, 1, 1, 1, 1,
-0.3173226, -0.5914919, -3.520033, 1, 1, 1, 1, 1,
-0.3129102, 3.249335, 0.8014905, 1, 1, 1, 1, 1,
-0.3111684, 0.9100012, 1.355387, 1, 1, 1, 1, 1,
-0.3107805, 0.1824249, -0.7052554, 1, 1, 1, 1, 1,
-0.3052334, -0.6334823, -2.369231, 1, 1, 1, 1, 1,
-0.3039958, -1.281972, -3.675227, 1, 1, 1, 1, 1,
-0.3035153, -0.04909202, -3.180349, 1, 1, 1, 1, 1,
-0.2996914, 1.241461, -0.956183, 1, 1, 1, 1, 1,
-0.2992068, 0.9272931, 0.8554447, 0, 0, 1, 1, 1,
-0.2961914, -0.1404757, -1.370905, 1, 0, 0, 1, 1,
-0.2922011, 0.3719395, -0.4025579, 1, 0, 0, 1, 1,
-0.2914065, -0.7309369, -2.846232, 1, 0, 0, 1, 1,
-0.2892407, -0.7870605, -1.998606, 1, 0, 0, 1, 1,
-0.281957, 0.5749651, -1.4249, 1, 0, 0, 1, 1,
-0.2806783, -0.9754649, -3.057149, 0, 0, 0, 1, 1,
-0.2793769, -0.7088419, -1.534484, 0, 0, 0, 1, 1,
-0.2742052, 0.1061178, -0.2049601, 0, 0, 0, 1, 1,
-0.2741583, -0.6603178, -2.603432, 0, 0, 0, 1, 1,
-0.2740278, 0.5022299, 0.3429295, 0, 0, 0, 1, 1,
-0.2724383, 1.984606, -2.859549, 0, 0, 0, 1, 1,
-0.2719393, 1.479045, 1.205297, 0, 0, 0, 1, 1,
-0.270889, -0.5017726, -4.449475, 1, 1, 1, 1, 1,
-0.2708447, -1.30829, -1.622676, 1, 1, 1, 1, 1,
-0.2685097, -0.9056659, -3.039356, 1, 1, 1, 1, 1,
-0.2662192, 0.08543164, -1.605247, 1, 1, 1, 1, 1,
-0.2645615, -0.6475831, -1.976856, 1, 1, 1, 1, 1,
-0.2594504, -1.212373, -1.027635, 1, 1, 1, 1, 1,
-0.2587587, -1.490312, -3.099029, 1, 1, 1, 1, 1,
-0.2546663, -0.2203909, -2.746254, 1, 1, 1, 1, 1,
-0.2509705, 0.241422, 1.014531, 1, 1, 1, 1, 1,
-0.2496542, -1.544635, -3.382583, 1, 1, 1, 1, 1,
-0.2492101, 0.619699, -0.1461828, 1, 1, 1, 1, 1,
-0.2454307, -0.6490914, -1.744301, 1, 1, 1, 1, 1,
-0.2432735, 1.521544, -0.5582127, 1, 1, 1, 1, 1,
-0.2422947, 0.4553175, -0.8132454, 1, 1, 1, 1, 1,
-0.2292197, -0.3712089, -3.782901, 1, 1, 1, 1, 1,
-0.2268169, 1.886758, 0.3939733, 0, 0, 1, 1, 1,
-0.2264351, -0.9935464, -5.537126, 1, 0, 0, 1, 1,
-0.2255114, -0.8108131, -2.778232, 1, 0, 0, 1, 1,
-0.2240158, -0.2530365, -3.041502, 1, 0, 0, 1, 1,
-0.2238596, -1.146442, -3.24312, 1, 0, 0, 1, 1,
-0.222976, -0.8390881, -3.505297, 1, 0, 0, 1, 1,
-0.2173096, 0.2294379, -0.3461916, 0, 0, 0, 1, 1,
-0.2147007, -1.069509, -4.433676, 0, 0, 0, 1, 1,
-0.2109371, -0.7375371, -3.034833, 0, 0, 0, 1, 1,
-0.209356, 0.5091237, 1.33757, 0, 0, 0, 1, 1,
-0.2021896, -2.135051, -4.203309, 0, 0, 0, 1, 1,
-0.1996982, 0.2173067, -1.154834, 0, 0, 0, 1, 1,
-0.1966055, -0.6246252, -2.667936, 0, 0, 0, 1, 1,
-0.1963378, -0.3782436, -3.048113, 1, 1, 1, 1, 1,
-0.1898971, 0.395703, 0.03609987, 1, 1, 1, 1, 1,
-0.1894197, -0.3196357, -1.34256, 1, 1, 1, 1, 1,
-0.1886169, -1.707412, -1.859009, 1, 1, 1, 1, 1,
-0.1884066, 0.9615732, -0.4241844, 1, 1, 1, 1, 1,
-0.186091, 0.01765525, -2.178784, 1, 1, 1, 1, 1,
-0.1853317, 0.158572, -1.250473, 1, 1, 1, 1, 1,
-0.1815481, 0.7156166, -0.5532359, 1, 1, 1, 1, 1,
-0.1804911, -2.123088, -3.873137, 1, 1, 1, 1, 1,
-0.1801023, -0.719416, -1.817085, 1, 1, 1, 1, 1,
-0.1796117, 0.04012421, -1.847944, 1, 1, 1, 1, 1,
-0.1794075, 0.3826192, 1.519953, 1, 1, 1, 1, 1,
-0.1771864, -1.545048, -2.63834, 1, 1, 1, 1, 1,
-0.1762282, -0.6971228, -2.480665, 1, 1, 1, 1, 1,
-0.1729571, 1.281224, -0.1585554, 1, 1, 1, 1, 1,
-0.1640785, -0.8160981, -1.624659, 0, 0, 1, 1, 1,
-0.1604274, 0.3837132, -0.9892958, 1, 0, 0, 1, 1,
-0.1583425, 0.1209104, -0.8366022, 1, 0, 0, 1, 1,
-0.1533724, -0.2810293, -2.647664, 1, 0, 0, 1, 1,
-0.1521098, 0.5163564, -0.6577395, 1, 0, 0, 1, 1,
-0.1511799, 1.655352, -0.3206455, 1, 0, 0, 1, 1,
-0.1492839, 0.6754543, -2.395597, 0, 0, 0, 1, 1,
-0.1445542, 3.063012, -0.9445259, 0, 0, 0, 1, 1,
-0.1438547, 2.160639, -0.5012207, 0, 0, 0, 1, 1,
-0.1395726, 1.226892, 0.5503482, 0, 0, 0, 1, 1,
-0.1384972, -0.580558, -1.572076, 0, 0, 0, 1, 1,
-0.1384522, -0.2066505, -1.977345, 0, 0, 0, 1, 1,
-0.1360939, 1.152687, 1.536491, 0, 0, 0, 1, 1,
-0.1270739, -0.09855473, -4.028053, 1, 1, 1, 1, 1,
-0.1246585, 0.2024979, 0.6383739, 1, 1, 1, 1, 1,
-0.1238233, -0.6384657, -1.861789, 1, 1, 1, 1, 1,
-0.1224666, -2.03105, -3.684369, 1, 1, 1, 1, 1,
-0.1200954, 1.252137, -0.4147801, 1, 1, 1, 1, 1,
-0.1176513, -1.148628, -2.596938, 1, 1, 1, 1, 1,
-0.1167767, -0.1803124, -2.088502, 1, 1, 1, 1, 1,
-0.1108028, 0.9163486, 0.3278761, 1, 1, 1, 1, 1,
-0.1091084, 0.6167814, 0.2764138, 1, 1, 1, 1, 1,
-0.1080658, 1.88817, 0.1838849, 1, 1, 1, 1, 1,
-0.09597028, 1.383344, -0.03063838, 1, 1, 1, 1, 1,
-0.09336318, 0.8520239, 1.285496, 1, 1, 1, 1, 1,
-0.0914837, 1.587706, -0.8384765, 1, 1, 1, 1, 1,
-0.08754683, 0.7252167, 0.9767906, 1, 1, 1, 1, 1,
-0.08373234, 0.7788863, -0.9963773, 1, 1, 1, 1, 1,
-0.08157621, -0.2206001, -3.503572, 0, 0, 1, 1, 1,
-0.08038402, 0.7675334, -2.082841, 1, 0, 0, 1, 1,
-0.07813799, -0.1922534, -3.012417, 1, 0, 0, 1, 1,
-0.07107238, -1.295661, -2.624808, 1, 0, 0, 1, 1,
-0.06720183, -1.054194, -2.471771, 1, 0, 0, 1, 1,
-0.06636323, -0.3841291, -2.035754, 1, 0, 0, 1, 1,
-0.06566484, 0.7581428, -0.8051247, 0, 0, 0, 1, 1,
-0.0641722, -1.453114, -2.307472, 0, 0, 0, 1, 1,
-0.06100814, -0.2433058, -0.9910289, 0, 0, 0, 1, 1,
-0.06020623, 0.2731386, 0.1387346, 0, 0, 0, 1, 1,
-0.05793992, -2.166123, -1.835811, 0, 0, 0, 1, 1,
-0.05562421, -1.522383, -4.028414, 0, 0, 0, 1, 1,
-0.05527906, 0.2649441, -0.6476735, 0, 0, 0, 1, 1,
-0.0551509, -0.1334133, -2.812787, 1, 1, 1, 1, 1,
-0.04870858, 1.239189, -1.346991, 1, 1, 1, 1, 1,
-0.04855491, -0.4110154, -1.385833, 1, 1, 1, 1, 1,
-0.03720569, -0.1042352, -4.141526, 1, 1, 1, 1, 1,
-0.03663244, -0.2198353, -4.319023, 1, 1, 1, 1, 1,
-0.03312912, -0.8494528, -2.03999, 1, 1, 1, 1, 1,
-0.03125651, -0.7793382, -2.912812, 1, 1, 1, 1, 1,
-0.02929568, 0.3137762, 0.7604181, 1, 1, 1, 1, 1,
-0.02857277, 0.4767092, -0.2155762, 1, 1, 1, 1, 1,
-0.02665151, -0.3582189, -2.573692, 1, 1, 1, 1, 1,
-0.02534928, 0.8047584, -0.9572448, 1, 1, 1, 1, 1,
-0.02262526, -0.159304, -2.495697, 1, 1, 1, 1, 1,
-0.0208251, -0.7092606, -5.289867, 1, 1, 1, 1, 1,
-0.02079746, 0.998298, -0.06488303, 1, 1, 1, 1, 1,
-0.01975228, 2.851035, -0.4837149, 1, 1, 1, 1, 1,
-0.01198614, 0.5048183, 0.86264, 0, 0, 1, 1, 1,
-0.006211271, 1.298146, -1.541505, 1, 0, 0, 1, 1,
0.0003093804, 1.300123, 0.846093, 1, 0, 0, 1, 1,
0.001333285, -2.601723, 4.483544, 1, 0, 0, 1, 1,
0.003245918, 0.3063895, -0.7173554, 1, 0, 0, 1, 1,
0.006589963, -0.2657758, 1.977762, 1, 0, 0, 1, 1,
0.007861127, -0.3264166, 2.520391, 0, 0, 0, 1, 1,
0.008131797, 0.9523045, -0.06151946, 0, 0, 0, 1, 1,
0.01206156, 0.5559524, 0.5343035, 0, 0, 0, 1, 1,
0.01322145, -0.01091979, 0.8715254, 0, 0, 0, 1, 1,
0.0201196, 0.1770765, 1.831293, 0, 0, 0, 1, 1,
0.02259342, 1.834421, -2.083375, 0, 0, 0, 1, 1,
0.02316581, -0.3987531, 2.607053, 0, 0, 0, 1, 1,
0.0254826, 0.4416766, -0.6179003, 1, 1, 1, 1, 1,
0.02595263, -0.9649293, 3.001933, 1, 1, 1, 1, 1,
0.02624754, -0.09498774, 4.867986, 1, 1, 1, 1, 1,
0.0295992, -1.735645, 2.596986, 1, 1, 1, 1, 1,
0.03607478, 0.7183456, -0.1101664, 1, 1, 1, 1, 1,
0.04035927, -0.9658896, 1.42318, 1, 1, 1, 1, 1,
0.0441191, 1.701455, -1.06348, 1, 1, 1, 1, 1,
0.05203622, -0.7228991, 2.711767, 1, 1, 1, 1, 1,
0.05282493, 1.014853, 0.2373083, 1, 1, 1, 1, 1,
0.05507418, 0.5117023, 1.828547, 1, 1, 1, 1, 1,
0.05535566, 0.8916427, -1.843615, 1, 1, 1, 1, 1,
0.05720345, 0.5666602, 0.8763384, 1, 1, 1, 1, 1,
0.07078621, -0.01002971, 0.1648252, 1, 1, 1, 1, 1,
0.07124422, -1.800175, 3.596601, 1, 1, 1, 1, 1,
0.07233464, 0.6379988, 1.10745, 1, 1, 1, 1, 1,
0.07261548, -1.139879, 3.010098, 0, 0, 1, 1, 1,
0.07269682, -1.2033, 1.799639, 1, 0, 0, 1, 1,
0.08345533, 0.8550825, -0.6431705, 1, 0, 0, 1, 1,
0.0839576, 0.3729981, 1.600844, 1, 0, 0, 1, 1,
0.08873259, 0.8139828, -0.5068793, 1, 0, 0, 1, 1,
0.09191392, 0.3005477, -0.04885151, 1, 0, 0, 1, 1,
0.09350087, 0.1873314, -1.053442, 0, 0, 0, 1, 1,
0.09446748, 1.763299, -0.214649, 0, 0, 0, 1, 1,
0.09854493, -0.4075713, 1.306761, 0, 0, 0, 1, 1,
0.09893401, -0.3111613, 3.418543, 0, 0, 0, 1, 1,
0.1007864, 0.5460101, 0.3072374, 0, 0, 0, 1, 1,
0.1025496, 0.5681952, 0.2043381, 0, 0, 0, 1, 1,
0.1038661, -1.260389, 1.819185, 0, 0, 0, 1, 1,
0.1052504, 0.9709083, -2.433654, 1, 1, 1, 1, 1,
0.105299, 1.341036, -0.3698468, 1, 1, 1, 1, 1,
0.1092245, 1.49092, 0.8079649, 1, 1, 1, 1, 1,
0.1102412, -0.2751428, 3.958779, 1, 1, 1, 1, 1,
0.1102554, -0.9378062, 1.679903, 1, 1, 1, 1, 1,
0.1131773, 0.9090573, -1.072764, 1, 1, 1, 1, 1,
0.1154029, -1.16414, 0.6378396, 1, 1, 1, 1, 1,
0.1158855, 0.9724218, -0.4454945, 1, 1, 1, 1, 1,
0.1175118, 0.3094402, 0.08612214, 1, 1, 1, 1, 1,
0.1198945, 1.126115, -2.004775, 1, 1, 1, 1, 1,
0.1234553, -0.3213592, 4.338016, 1, 1, 1, 1, 1,
0.1259141, 0.739629, -0.6691782, 1, 1, 1, 1, 1,
0.1321319, 0.9385949, 0.7887635, 1, 1, 1, 1, 1,
0.1349943, -0.5152346, 2.76597, 1, 1, 1, 1, 1,
0.1368221, 0.9653654, -0.5929593, 1, 1, 1, 1, 1,
0.1369312, -0.7171043, 5.131993, 0, 0, 1, 1, 1,
0.1379787, 1.32784, 0.4016544, 1, 0, 0, 1, 1,
0.1402219, -1.218902, 3.304622, 1, 0, 0, 1, 1,
0.1431522, -0.3564114, 1.546266, 1, 0, 0, 1, 1,
0.1459323, 0.005121185, 0.9309216, 1, 0, 0, 1, 1,
0.1512552, 0.2150287, -0.1029376, 1, 0, 0, 1, 1,
0.1534512, -0.2054592, 2.681039, 0, 0, 0, 1, 1,
0.153912, -0.4325078, 2.711357, 0, 0, 0, 1, 1,
0.157497, -0.8391168, 2.782092, 0, 0, 0, 1, 1,
0.1576622, 1.195368, -1.551945, 0, 0, 0, 1, 1,
0.1613215, -1.433372, 3.507663, 0, 0, 0, 1, 1,
0.1619604, 0.8808904, 1.021724, 0, 0, 0, 1, 1,
0.1665182, -0.7254246, 1.739714, 0, 0, 0, 1, 1,
0.1670381, -0.7232705, 3.533502, 1, 1, 1, 1, 1,
0.1691703, 0.9098897, -0.8340712, 1, 1, 1, 1, 1,
0.1696338, 0.2851762, 0.679262, 1, 1, 1, 1, 1,
0.1718683, -0.05467913, 2.693813, 1, 1, 1, 1, 1,
0.1742435, 0.3175925, 1.406855, 1, 1, 1, 1, 1,
0.1746709, -0.3010297, 2.664556, 1, 1, 1, 1, 1,
0.1747365, -1.495781, 3.30265, 1, 1, 1, 1, 1,
0.1809393, -0.37557, 4.290657, 1, 1, 1, 1, 1,
0.1816854, -0.1934471, 2.703263, 1, 1, 1, 1, 1,
0.1946669, -2.274489, 1.820732, 1, 1, 1, 1, 1,
0.1962309, -1.094409, 4.200333, 1, 1, 1, 1, 1,
0.1969962, 1.579956, 0.128524, 1, 1, 1, 1, 1,
0.2000488, 0.879944, -0.6064392, 1, 1, 1, 1, 1,
0.2012175, -0.9276885, 4.257413, 1, 1, 1, 1, 1,
0.2032161, -1.120075, 2.237887, 1, 1, 1, 1, 1,
0.2057674, 0.8007804, 0.02721819, 0, 0, 1, 1, 1,
0.2136279, 1.456012, 0.3346413, 1, 0, 0, 1, 1,
0.2162585, 0.1833585, 1.630265, 1, 0, 0, 1, 1,
0.2193867, 1.41371, -0.3716488, 1, 0, 0, 1, 1,
0.220775, -1.013845, 2.100222, 1, 0, 0, 1, 1,
0.2233968, 0.8119836, -0.08629503, 1, 0, 0, 1, 1,
0.2235869, 0.18422, 2.764447, 0, 0, 0, 1, 1,
0.2285441, -0.05788413, 1.693017, 0, 0, 0, 1, 1,
0.2303679, 0.1421856, -0.06120288, 0, 0, 0, 1, 1,
0.233828, -2.80309, 3.421792, 0, 0, 0, 1, 1,
0.2368077, -0.2378715, 2.994508, 0, 0, 0, 1, 1,
0.238041, 1.927944, 1.056974, 0, 0, 0, 1, 1,
0.2386541, 0.05887854, 2.441591, 0, 0, 0, 1, 1,
0.2398211, -1.912545, 3.779733, 1, 1, 1, 1, 1,
0.240743, -0.9081513, 4.292605, 1, 1, 1, 1, 1,
0.2438918, 1.547391, -1.764835, 1, 1, 1, 1, 1,
0.2479358, 1.386205, 0.6265753, 1, 1, 1, 1, 1,
0.2488109, -0.5809395, 3.205696, 1, 1, 1, 1, 1,
0.2537119, -0.5836697, 2.484934, 1, 1, 1, 1, 1,
0.2558859, 0.3550954, 1.43596, 1, 1, 1, 1, 1,
0.256507, -0.2800468, 2.157091, 1, 1, 1, 1, 1,
0.2592885, -1.193363, 2.706545, 1, 1, 1, 1, 1,
0.2608708, 0.5626042, -1.019644, 1, 1, 1, 1, 1,
0.2629639, 0.6494235, -0.4412539, 1, 1, 1, 1, 1,
0.2630751, -1.345487, 2.658679, 1, 1, 1, 1, 1,
0.2650306, -0.6273294, 2.629214, 1, 1, 1, 1, 1,
0.2668765, -0.5272273, 0.8860229, 1, 1, 1, 1, 1,
0.2692047, -1.174618, 3.660587, 1, 1, 1, 1, 1,
0.2885365, -0.9141759, 3.738369, 0, 0, 1, 1, 1,
0.2899647, -0.09264351, 2.75203, 1, 0, 0, 1, 1,
0.2950958, 1.891069, -2.200963, 1, 0, 0, 1, 1,
0.297612, -0.4057877, 3.955414, 1, 0, 0, 1, 1,
0.2986703, -0.2262542, 1.459584, 1, 0, 0, 1, 1,
0.3019432, -1.163656, 2.644655, 1, 0, 0, 1, 1,
0.3037253, -1.167424, 3.405108, 0, 0, 0, 1, 1,
0.3042732, 1.182564, 0.9887687, 0, 0, 0, 1, 1,
0.3047811, 0.3131839, 1.604252, 0, 0, 0, 1, 1,
0.3055364, 0.463634, 0.8901861, 0, 0, 0, 1, 1,
0.3058319, 1.154152, -0.07691244, 0, 0, 0, 1, 1,
0.3073909, -0.3892421, 4.041645, 0, 0, 0, 1, 1,
0.307892, 0.1277172, -0.2215696, 0, 0, 0, 1, 1,
0.3079041, 0.4501294, 2.030612, 1, 1, 1, 1, 1,
0.3141598, -1.483245, 3.623962, 1, 1, 1, 1, 1,
0.3172418, -0.01448905, 1.668912, 1, 1, 1, 1, 1,
0.323221, -0.6094107, 3.223379, 1, 1, 1, 1, 1,
0.3233496, 1.077656, 0.7263492, 1, 1, 1, 1, 1,
0.3238097, 0.1422733, 2.629555, 1, 1, 1, 1, 1,
0.3245632, 0.2738255, 0.3365179, 1, 1, 1, 1, 1,
0.3263274, 0.8494205, -0.1267017, 1, 1, 1, 1, 1,
0.3268453, -0.803675, 4.258241, 1, 1, 1, 1, 1,
0.3292373, 1.148013, 0.7093222, 1, 1, 1, 1, 1,
0.3342585, 0.1113258, 2.588066, 1, 1, 1, 1, 1,
0.3357055, 1.548063, -1.598464, 1, 1, 1, 1, 1,
0.33665, -1.13407, 3.330267, 1, 1, 1, 1, 1,
0.3371747, -0.2904072, 2.32267, 1, 1, 1, 1, 1,
0.3398764, 1.637113, -0.06251092, 1, 1, 1, 1, 1,
0.3502197, 0.1722432, 2.615936, 0, 0, 1, 1, 1,
0.3508623, 0.272393, 0.5483125, 1, 0, 0, 1, 1,
0.350924, 0.771347, -0.5969008, 1, 0, 0, 1, 1,
0.3512702, -0.3915737, 3.923218, 1, 0, 0, 1, 1,
0.3560072, 1.224157, 0.7067171, 1, 0, 0, 1, 1,
0.3564144, 2.571187, 1.315569, 1, 0, 0, 1, 1,
0.3589235, -0.003352737, 2.454803, 0, 0, 0, 1, 1,
0.3606124, -0.4487599, 2.572456, 0, 0, 0, 1, 1,
0.3615589, 0.3351323, 1.5814, 0, 0, 0, 1, 1,
0.3619629, 1.025903, -0.0112832, 0, 0, 0, 1, 1,
0.3631465, -0.02762667, 0.5686495, 0, 0, 0, 1, 1,
0.3635128, 0.7101012, 2.337039, 0, 0, 0, 1, 1,
0.3669063, -0.2837583, 1.70922, 0, 0, 0, 1, 1,
0.3706647, 1.611509, -1.103743, 1, 1, 1, 1, 1,
0.372689, -0.3047897, 1.459566, 1, 1, 1, 1, 1,
0.3730395, -2.282538, 2.200234, 1, 1, 1, 1, 1,
0.3781869, 2.250173, -0.2886603, 1, 1, 1, 1, 1,
0.3805519, 1.045729, 1.934942, 1, 1, 1, 1, 1,
0.3815269, -0.2545919, 1.403098, 1, 1, 1, 1, 1,
0.3819357, 1.682734, 0.5954253, 1, 1, 1, 1, 1,
0.381944, 1.366697, -1.116708, 1, 1, 1, 1, 1,
0.3835272, 1.044463, 1.38079, 1, 1, 1, 1, 1,
0.3888975, -1.307802, 3.105482, 1, 1, 1, 1, 1,
0.3906484, 0.870102, 0.04793193, 1, 1, 1, 1, 1,
0.3975927, -0.5129979, 1.974869, 1, 1, 1, 1, 1,
0.3987595, 1.305829, 0.5705701, 1, 1, 1, 1, 1,
0.3987689, -0.4450759, 2.602647, 1, 1, 1, 1, 1,
0.4019106, 0.08916942, 0.7140839, 1, 1, 1, 1, 1,
0.4029922, 1.01068, -1.017866, 0, 0, 1, 1, 1,
0.4032697, 0.7457488, 2.873231, 1, 0, 0, 1, 1,
0.403722, -0.6108463, -0.1463039, 1, 0, 0, 1, 1,
0.4045955, -0.1673069, 2.876755, 1, 0, 0, 1, 1,
0.4060812, -0.7348502, 4.264789, 1, 0, 0, 1, 1,
0.407128, -1.339215, 2.378123, 1, 0, 0, 1, 1,
0.4074205, 0.3874346, 1.899271, 0, 0, 0, 1, 1,
0.4127409, -0.6947137, 2.452147, 0, 0, 0, 1, 1,
0.4152288, -0.2742315, 0.7581773, 0, 0, 0, 1, 1,
0.4184605, -1.664253, 2.832305, 0, 0, 0, 1, 1,
0.4237062, 1.322062, -1.435674, 0, 0, 0, 1, 1,
0.4281673, -1.02304, 2.644183, 0, 0, 0, 1, 1,
0.4304049, 0.4605077, -0.05912601, 0, 0, 0, 1, 1,
0.4331512, -0.2859319, 2.047349, 1, 1, 1, 1, 1,
0.4334753, 0.5430969, 0.1429419, 1, 1, 1, 1, 1,
0.4335423, 0.3904858, 1.278751, 1, 1, 1, 1, 1,
0.4407026, -0.14494, 2.352226, 1, 1, 1, 1, 1,
0.4419428, -0.8940958, 2.88451, 1, 1, 1, 1, 1,
0.4442113, 1.505355, 2.082053, 1, 1, 1, 1, 1,
0.4469743, 0.1978313, 1.638717, 1, 1, 1, 1, 1,
0.4479151, -1.294264, 2.935346, 1, 1, 1, 1, 1,
0.449523, 0.9123657, 0.9349551, 1, 1, 1, 1, 1,
0.4561054, -1.652954, 2.451952, 1, 1, 1, 1, 1,
0.4589265, -0.5113209, 4.197211, 1, 1, 1, 1, 1,
0.4645448, -0.3879926, 3.328778, 1, 1, 1, 1, 1,
0.4709765, -0.431411, 1.985542, 1, 1, 1, 1, 1,
0.4750113, 1.358566, 0.7044773, 1, 1, 1, 1, 1,
0.4759265, -0.7184209, 2.261638, 1, 1, 1, 1, 1,
0.4794895, -0.04288291, 2.12352, 0, 0, 1, 1, 1,
0.4804947, 1.2063, 0.7186219, 1, 0, 0, 1, 1,
0.480612, -0.576983, 0.7664233, 1, 0, 0, 1, 1,
0.483879, -0.788571, 2.662625, 1, 0, 0, 1, 1,
0.4875997, 0.06335532, 1.721754, 1, 0, 0, 1, 1,
0.4889649, 0.4524243, 1.852439, 1, 0, 0, 1, 1,
0.4919945, -0.8236379, 1.129795, 0, 0, 0, 1, 1,
0.4923814, 0.7967343, 1.196908, 0, 0, 0, 1, 1,
0.5015929, 0.253183, 0.9049847, 0, 0, 0, 1, 1,
0.5023644, -0.05383485, 0.2072103, 0, 0, 0, 1, 1,
0.5028647, 0.1357193, 2.072154, 0, 0, 0, 1, 1,
0.5031945, 0.5134489, 0.4337253, 0, 0, 0, 1, 1,
0.5098585, -1.031684, 3.293734, 0, 0, 0, 1, 1,
0.5134193, -1.495971, 3.582334, 1, 1, 1, 1, 1,
0.5138664, 0.2916646, 1.573956, 1, 1, 1, 1, 1,
0.5147941, -0.05012334, -0.8642318, 1, 1, 1, 1, 1,
0.5150482, -0.9379219, 1.782385, 1, 1, 1, 1, 1,
0.5202199, -0.09044041, 1.967475, 1, 1, 1, 1, 1,
0.5213805, -1.473131, 0.7933412, 1, 1, 1, 1, 1,
0.5244037, -0.2985138, 0.6722817, 1, 1, 1, 1, 1,
0.5263007, 1.367117, -0.6293934, 1, 1, 1, 1, 1,
0.5269249, -0.2131713, 3.548037, 1, 1, 1, 1, 1,
0.5344488, 0.2552607, 2.501305, 1, 1, 1, 1, 1,
0.5352821, -1.090283, 3.14257, 1, 1, 1, 1, 1,
0.5374835, 0.1956531, 0.6955553, 1, 1, 1, 1, 1,
0.5453937, -0.8168719, 2.917943, 1, 1, 1, 1, 1,
0.5536223, 0.09714248, 1.090781, 1, 1, 1, 1, 1,
0.5544134, -0.06136025, 1.780923, 1, 1, 1, 1, 1,
0.5546296, 0.8413398, 1.475172, 0, 0, 1, 1, 1,
0.5573862, 0.37392, -0.06283429, 1, 0, 0, 1, 1,
0.5589087, 0.1748686, 1.081927, 1, 0, 0, 1, 1,
0.5626787, 0.473632, -0.2075917, 1, 0, 0, 1, 1,
0.5632854, -1.214044, 3.750749, 1, 0, 0, 1, 1,
0.5641253, -1.028068, 3.086412, 1, 0, 0, 1, 1,
0.5666388, 0.1739725, 1.02537, 0, 0, 0, 1, 1,
0.567808, 2.890384, 0.4304973, 0, 0, 0, 1, 1,
0.5751268, -0.1335734, 2.589346, 0, 0, 0, 1, 1,
0.5757495, -1.615493, 2.104361, 0, 0, 0, 1, 1,
0.5802878, -0.4170398, 2.952729, 0, 0, 0, 1, 1,
0.5813836, 0.8950916, -0.2502887, 0, 0, 0, 1, 1,
0.584394, 0.7593741, 0.1294713, 0, 0, 0, 1, 1,
0.5913864, 0.3242575, 1.117898, 1, 1, 1, 1, 1,
0.5951668, -0.1129622, 1.920699, 1, 1, 1, 1, 1,
0.5983437, 0.8544133, 1.088176, 1, 1, 1, 1, 1,
0.5993424, -0.5218876, 2.343525, 1, 1, 1, 1, 1,
0.5995497, -0.4294212, 1.869124, 1, 1, 1, 1, 1,
0.6003086, -1.102027, 0.6570568, 1, 1, 1, 1, 1,
0.6018131, 0.7581907, 0.6693588, 1, 1, 1, 1, 1,
0.6054796, 0.1249783, 1.405167, 1, 1, 1, 1, 1,
0.6069188, -1.241862, 4.048734, 1, 1, 1, 1, 1,
0.6069806, 0.6060405, 0.7242007, 1, 1, 1, 1, 1,
0.6186992, 0.4819786, 0.3107245, 1, 1, 1, 1, 1,
0.6252149, -0.1224094, 1.405716, 1, 1, 1, 1, 1,
0.6283426, 0.7458423, 0.9897292, 1, 1, 1, 1, 1,
0.6305957, 0.1048553, 1.602077, 1, 1, 1, 1, 1,
0.6332188, -2.232942, 1.659296, 1, 1, 1, 1, 1,
0.6336599, -0.3735627, 2.360322, 0, 0, 1, 1, 1,
0.6380231, 1.781877, 0.6640671, 1, 0, 0, 1, 1,
0.638218, 1.32908, 2.818458, 1, 0, 0, 1, 1,
0.6400232, -0.008184676, 1.283971, 1, 0, 0, 1, 1,
0.6422808, 1.918828, -0.7377679, 1, 0, 0, 1, 1,
0.6433253, 0.8769524, 1.484852, 1, 0, 0, 1, 1,
0.6440132, -0.8721396, 2.737938, 0, 0, 0, 1, 1,
0.6441035, 0.2384435, 1.724624, 0, 0, 0, 1, 1,
0.6448417, 1.149238, -0.9038637, 0, 0, 0, 1, 1,
0.6476178, 0.835907, -0.3057309, 0, 0, 0, 1, 1,
0.6554793, -1.314704, 3.342834, 0, 0, 0, 1, 1,
0.6598097, -0.6869244, 1.260997, 0, 0, 0, 1, 1,
0.6610083, 1.235606, 0.1252989, 0, 0, 0, 1, 1,
0.6621451, -2.222249, 2.524496, 1, 1, 1, 1, 1,
0.6690897, -1.205094, 3.351884, 1, 1, 1, 1, 1,
0.6729642, -1.748585, 3.076783, 1, 1, 1, 1, 1,
0.6802005, -1.44478, 2.971719, 1, 1, 1, 1, 1,
0.6808193, 0.2025301, 3.17372, 1, 1, 1, 1, 1,
0.6845242, -0.6827758, 3.929826, 1, 1, 1, 1, 1,
0.6863581, 0.1417061, 0.7679255, 1, 1, 1, 1, 1,
0.6906199, 0.5973975, 1.525847, 1, 1, 1, 1, 1,
0.6909993, 2.045733, 0.3923929, 1, 1, 1, 1, 1,
0.6912199, -0.7649959, 0.3983918, 1, 1, 1, 1, 1,
0.6980768, -0.2314101, 3.803244, 1, 1, 1, 1, 1,
0.7014472, -0.2560965, 1.60445, 1, 1, 1, 1, 1,
0.7089925, 2.091194, 0.896607, 1, 1, 1, 1, 1,
0.7128389, 2.373776, 0.7905151, 1, 1, 1, 1, 1,
0.7144214, 0.07556736, 1.039806, 1, 1, 1, 1, 1,
0.7192463, 0.5134536, 0.02279423, 0, 0, 1, 1, 1,
0.7217801, 1.489553, 1.46945, 1, 0, 0, 1, 1,
0.7235755, -0.1220581, 2.368238, 1, 0, 0, 1, 1,
0.7245848, -0.525359, 1.230024, 1, 0, 0, 1, 1,
0.7273709, -0.2766274, 1.354304, 1, 0, 0, 1, 1,
0.730526, -0.1852576, 1.546972, 1, 0, 0, 1, 1,
0.7310147, 0.556221, 1.3082, 0, 0, 0, 1, 1,
0.7313798, -1.396251, 3.176171, 0, 0, 0, 1, 1,
0.7330363, 0.9277155, 1.112613, 0, 0, 0, 1, 1,
0.7473861, -0.6403173, 2.444907, 0, 0, 0, 1, 1,
0.7517524, -1.590848, 2.16945, 0, 0, 0, 1, 1,
0.7620739, -0.89832, 3.747017, 0, 0, 0, 1, 1,
0.7629251, 0.8703687, 3.253507, 0, 0, 0, 1, 1,
0.7629759, -0.8371517, 3.121566, 1, 1, 1, 1, 1,
0.7774013, -0.7903624, 2.68714, 1, 1, 1, 1, 1,
0.7793851, 0.7678044, 0.6695324, 1, 1, 1, 1, 1,
0.7815228, -1.085609, 1.925253, 1, 1, 1, 1, 1,
0.7829741, -0.3530896, 0.5439842, 1, 1, 1, 1, 1,
0.7870655, 0.5119978, -0.1844355, 1, 1, 1, 1, 1,
0.7882347, 0.09721942, 1.674106, 1, 1, 1, 1, 1,
0.7915203, 0.7952086, 1.14808, 1, 1, 1, 1, 1,
0.7940882, -0.6181156, 2.749443, 1, 1, 1, 1, 1,
0.7947711, 0.1511891, 2.828021, 1, 1, 1, 1, 1,
0.8043144, -0.08432181, 2.242592, 1, 1, 1, 1, 1,
0.8081054, -0.2559302, 0.6049709, 1, 1, 1, 1, 1,
0.8137162, 0.7738948, 0.9718795, 1, 1, 1, 1, 1,
0.8178858, -1.050848, 4.244869, 1, 1, 1, 1, 1,
0.8228337, 2.261675, 1.102516, 1, 1, 1, 1, 1,
0.8245259, 1.365088, -0.6137466, 0, 0, 1, 1, 1,
0.8329386, 1.485856, -0.1870846, 1, 0, 0, 1, 1,
0.8334179, -1.152351, 2.796897, 1, 0, 0, 1, 1,
0.8489619, -0.5967123, 3.21399, 1, 0, 0, 1, 1,
0.8535033, -1.470376, 2.640157, 1, 0, 0, 1, 1,
0.8539159, 1.025452, 0.2352538, 1, 0, 0, 1, 1,
0.8573697, -0.7236528, 2.162382, 0, 0, 0, 1, 1,
0.8582559, 0.716378, 1.273315, 0, 0, 0, 1, 1,
0.8735842, -1.33496, 1.468572, 0, 0, 0, 1, 1,
0.8783748, -0.4376182, 0.5876784, 0, 0, 0, 1, 1,
0.880345, 0.641933, 0.289657, 0, 0, 0, 1, 1,
0.8839704, -1.21979, 1.764656, 0, 0, 0, 1, 1,
0.8843945, 0.7233282, -0.0004692302, 0, 0, 0, 1, 1,
0.8867885, -1.566771, 5.288191, 1, 1, 1, 1, 1,
0.8888025, 0.2228682, -0.4744112, 1, 1, 1, 1, 1,
0.8915455, 0.7526571, 0.7068803, 1, 1, 1, 1, 1,
0.893977, -1.599654, 4.360503, 1, 1, 1, 1, 1,
0.9051679, 0.08054575, 0.9639803, 1, 1, 1, 1, 1,
0.9055027, 1.818336, -0.002612685, 1, 1, 1, 1, 1,
0.9059135, 1.571193, 2.129658, 1, 1, 1, 1, 1,
0.9060054, -0.4799737, -0.2214922, 1, 1, 1, 1, 1,
0.9063808, -3.540784, 2.790869, 1, 1, 1, 1, 1,
0.9074356, 0.4553942, 0.5130888, 1, 1, 1, 1, 1,
0.9203907, 1.976285, 1.586234, 1, 1, 1, 1, 1,
0.9233451, -0.475476, 2.430837, 1, 1, 1, 1, 1,
0.9247069, -0.2165939, 2.002379, 1, 1, 1, 1, 1,
0.9302012, 1.884317, 1.215565, 1, 1, 1, 1, 1,
0.9317211, 1.434679, 0.8655159, 1, 1, 1, 1, 1,
0.9317324, 0.0314301, 1.779226, 0, 0, 1, 1, 1,
0.939641, -1.185743, 1.570177, 1, 0, 0, 1, 1,
0.9451907, 0.4783936, -0.2704313, 1, 0, 0, 1, 1,
0.957436, 2.449018, -0.282122, 1, 0, 0, 1, 1,
0.9578148, -2.038772, 3.424644, 1, 0, 0, 1, 1,
0.9586248, 1.597287, 1.511209, 1, 0, 0, 1, 1,
0.9626962, -0.7678394, 1.025431, 0, 0, 0, 1, 1,
0.9634072, -0.6262698, 0.7763273, 0, 0, 0, 1, 1,
0.963546, 0.7737371, -1.90966, 0, 0, 0, 1, 1,
0.9651337, 0.1659504, 0.4559381, 0, 0, 0, 1, 1,
0.9672123, 0.5110978, 1.522616, 0, 0, 0, 1, 1,
0.9705896, -0.1600158, 1.649922, 0, 0, 0, 1, 1,
0.9706577, -0.07008494, 2.794199, 0, 0, 0, 1, 1,
0.9710606, -0.05943454, 1.275001, 1, 1, 1, 1, 1,
0.9724177, 1.146536, 0.4805121, 1, 1, 1, 1, 1,
0.9729248, 1.000483, 2.063313, 1, 1, 1, 1, 1,
0.973974, 0.2203348, 2.493028, 1, 1, 1, 1, 1,
0.9743471, -0.6307715, 1.73133, 1, 1, 1, 1, 1,
0.976651, 2.257883, -1.077721, 1, 1, 1, 1, 1,
0.9776709, 0.5053697, 1.45828, 1, 1, 1, 1, 1,
0.9791677, -0.5436465, 0.8063045, 1, 1, 1, 1, 1,
0.9805661, -1.883077, 2.049187, 1, 1, 1, 1, 1,
0.9807289, 0.8556607, 0.9915406, 1, 1, 1, 1, 1,
0.9828925, 0.07542607, 1.69768, 1, 1, 1, 1, 1,
0.9837387, 1.787541, 0.62755, 1, 1, 1, 1, 1,
0.9842589, -2.075144, 2.523664, 1, 1, 1, 1, 1,
0.9856612, 1.09262, 1.621688, 1, 1, 1, 1, 1,
0.9870641, 1.608752, 0.5251924, 1, 1, 1, 1, 1,
0.99266, -0.2624764, 0.5011596, 0, 0, 1, 1, 1,
1.003149, 0.489233, 2.085302, 1, 0, 0, 1, 1,
1.00417, 0.01914962, 0.6066121, 1, 0, 0, 1, 1,
1.005108, 0.3233116, 1.819379, 1, 0, 0, 1, 1,
1.006205, -0.5374524, 1.028157, 1, 0, 0, 1, 1,
1.00835, 0.9148453, 3.083845, 1, 0, 0, 1, 1,
1.008958, -2.101816, 1.501504, 0, 0, 0, 1, 1,
1.016672, -0.8477446, 1.327691, 0, 0, 0, 1, 1,
1.02577, -0.8389221, 1.020576, 0, 0, 0, 1, 1,
1.026892, 0.01773584, 0.663538, 0, 0, 0, 1, 1,
1.02713, -0.9557712, 2.029764, 0, 0, 0, 1, 1,
1.027166, -1.243199, 2.589612, 0, 0, 0, 1, 1,
1.029694, 0.6582026, 1.415578, 0, 0, 0, 1, 1,
1.033983, -1.901361, 2.593926, 1, 1, 1, 1, 1,
1.034056, 1.051893, 1.851812, 1, 1, 1, 1, 1,
1.034398, -1.806274, 0.3627393, 1, 1, 1, 1, 1,
1.044281, -0.227999, 0.1307182, 1, 1, 1, 1, 1,
1.046629, 0.03977701, 0.6769165, 1, 1, 1, 1, 1,
1.053282, 1.118694, 2.652787, 1, 1, 1, 1, 1,
1.058148, -1.366194, 1.749635, 1, 1, 1, 1, 1,
1.05968, 1.828899, 0.9951015, 1, 1, 1, 1, 1,
1.064772, 2.649233, 2.612369, 1, 1, 1, 1, 1,
1.065007, -0.511151, 2.338543, 1, 1, 1, 1, 1,
1.065405, 1.301589, 0.2437267, 1, 1, 1, 1, 1,
1.068673, 0.3338655, 1.166086, 1, 1, 1, 1, 1,
1.080315, -0.8874818, 2.381706, 1, 1, 1, 1, 1,
1.089311, 0.07289609, 1.02101, 1, 1, 1, 1, 1,
1.102664, -0.190953, 1.003621, 1, 1, 1, 1, 1,
1.105168, 1.706622, 1.233594, 0, 0, 1, 1, 1,
1.109847, 1.347451, 1.495021, 1, 0, 0, 1, 1,
1.124524, 1.002793, 1.16667, 1, 0, 0, 1, 1,
1.12584, 0.3827273, 1.193443, 1, 0, 0, 1, 1,
1.13158, 3.076952, 1.051272, 1, 0, 0, 1, 1,
1.136021, -1.587448, 1.682246, 1, 0, 0, 1, 1,
1.143771, 0.4856386, -0.3743576, 0, 0, 0, 1, 1,
1.148615, 0.4133399, 2.083631, 0, 0, 0, 1, 1,
1.158172, 0.5566844, 0.5518745, 0, 0, 0, 1, 1,
1.163339, -2.609764, 3.830592, 0, 0, 0, 1, 1,
1.167857, 0.7479893, 1.829886, 0, 0, 0, 1, 1,
1.170327, -0.06399082, 1.90352, 0, 0, 0, 1, 1,
1.171544, 0.007212882, 1.819227, 0, 0, 0, 1, 1,
1.178678, -1.884079, 2.077562, 1, 1, 1, 1, 1,
1.184795, -0.4480291, 0.4809516, 1, 1, 1, 1, 1,
1.186446, -0.3466006, 1.738133, 1, 1, 1, 1, 1,
1.190684, 1.488697, -0.884172, 1, 1, 1, 1, 1,
1.192822, 0.7146127, 1.122061, 1, 1, 1, 1, 1,
1.195033, -0.4184349, 2.524095, 1, 1, 1, 1, 1,
1.198298, -1.932213, 4.777406, 1, 1, 1, 1, 1,
1.202116, -0.5563473, 3.748157, 1, 1, 1, 1, 1,
1.20644, 1.066408, 2.14319, 1, 1, 1, 1, 1,
1.210772, 0.2365482, 1.832265, 1, 1, 1, 1, 1,
1.218806, -0.894169, 2.813442, 1, 1, 1, 1, 1,
1.22746, 0.2725475, 0.8053735, 1, 1, 1, 1, 1,
1.227885, -0.3095437, 0.9826341, 1, 1, 1, 1, 1,
1.23901, 1.052715, 0.8815137, 1, 1, 1, 1, 1,
1.249655, -0.1534392, 3.17191, 1, 1, 1, 1, 1,
1.251537, 1.994386, -0.4489416, 0, 0, 1, 1, 1,
1.2518, 0.8696285, 1.130813, 1, 0, 0, 1, 1,
1.253996, -0.5937899, 2.183049, 1, 0, 0, 1, 1,
1.256786, -1.013023, 1.057179, 1, 0, 0, 1, 1,
1.261878, -0.8738645, 0.4700945, 1, 0, 0, 1, 1,
1.269063, -1.912053, 0.613702, 1, 0, 0, 1, 1,
1.273925, -0.3633081, 0.628338, 0, 0, 0, 1, 1,
1.295638, -0.8257705, 1.228299, 0, 0, 0, 1, 1,
1.301935, 0.8638744, 1.190997, 0, 0, 0, 1, 1,
1.305055, -1.325967, 0.5955564, 0, 0, 0, 1, 1,
1.308242, -0.570329, 2.440921, 0, 0, 0, 1, 1,
1.314083, 0.6094211, 0.8878127, 0, 0, 0, 1, 1,
1.320769, 0.3826141, 1.239917, 0, 0, 0, 1, 1,
1.321611, -1.185498, 0.4477757, 1, 1, 1, 1, 1,
1.325953, 1.08229, 1.943972, 1, 1, 1, 1, 1,
1.326095, 0.7461208, 0.5744441, 1, 1, 1, 1, 1,
1.32764, -1.811428, 2.993723, 1, 1, 1, 1, 1,
1.328786, -1.400743, 3.164394, 1, 1, 1, 1, 1,
1.335779, 0.4264627, 1.471637, 1, 1, 1, 1, 1,
1.34128, -0.6122836, 2.265444, 1, 1, 1, 1, 1,
1.341506, 0.8266949, 0.2867553, 1, 1, 1, 1, 1,
1.342831, 0.8155378, 1.666492, 1, 1, 1, 1, 1,
1.345647, -0.8021237, 1.547618, 1, 1, 1, 1, 1,
1.349406, 0.3418697, 0.7977225, 1, 1, 1, 1, 1,
1.34971, -0.8484921, 3.30493, 1, 1, 1, 1, 1,
1.349915, -0.6646278, 1.715981, 1, 1, 1, 1, 1,
1.358159, -0.9602194, 4.460888, 1, 1, 1, 1, 1,
1.358734, -0.9761466, 2.249496, 1, 1, 1, 1, 1,
1.368275, 2.819769, -0.4715951, 0, 0, 1, 1, 1,
1.37627, -0.4509325, 0.3209011, 1, 0, 0, 1, 1,
1.377844, 0.6908194, 3.643852, 1, 0, 0, 1, 1,
1.392461, -1.538828, 1.443699, 1, 0, 0, 1, 1,
1.398205, 2.556508, 2.087117, 1, 0, 0, 1, 1,
1.410371, -0.9254295, 2.216985, 1, 0, 0, 1, 1,
1.413472, 1.122776, 0.7264503, 0, 0, 0, 1, 1,
1.417808, 0.1376221, 0.5161164, 0, 0, 0, 1, 1,
1.420698, 0.1461338, 1.600492, 0, 0, 0, 1, 1,
1.430096, -1.951662, 2.658767, 0, 0, 0, 1, 1,
1.439974, 1.433626, 1.751631, 0, 0, 0, 1, 1,
1.44008, -0.3278395, 3.619596, 0, 0, 0, 1, 1,
1.456306, -0.3369029, 1.498969, 0, 0, 0, 1, 1,
1.462074, -0.1619184, 2.381414, 1, 1, 1, 1, 1,
1.464928, -1.259994, 2.951178, 1, 1, 1, 1, 1,
1.467611, -0.7320288, 5.299414, 1, 1, 1, 1, 1,
1.468517, 0.06744026, -0.8059579, 1, 1, 1, 1, 1,
1.485888, 0.3852209, 0.02326077, 1, 1, 1, 1, 1,
1.496696, -2.078151, 3.351755, 1, 1, 1, 1, 1,
1.504241, -0.4902077, 2.829487, 1, 1, 1, 1, 1,
1.507204, 0.8144329, -0.53488, 1, 1, 1, 1, 1,
1.513981, -0.08804578, 2.221128, 1, 1, 1, 1, 1,
1.518791, -0.7638985, 3.216898, 1, 1, 1, 1, 1,
1.541232, -0.3246796, 2.315184, 1, 1, 1, 1, 1,
1.541429, -0.1794189, 3.16876, 1, 1, 1, 1, 1,
1.555782, -0.2732249, 2.482877, 1, 1, 1, 1, 1,
1.571881, 1.265311, 1.966616, 1, 1, 1, 1, 1,
1.575357, -0.1324798, 1.674899, 1, 1, 1, 1, 1,
1.576776, 1.326889, 2.542128, 0, 0, 1, 1, 1,
1.606607, -0.3146799, 3.387185, 1, 0, 0, 1, 1,
1.615187, 0.0942367, 3.218896, 1, 0, 0, 1, 1,
1.616763, -0.9414296, 3.084209, 1, 0, 0, 1, 1,
1.626929, 0.006381364, 1.141354, 1, 0, 0, 1, 1,
1.630459, -1.140577, 0.4986037, 1, 0, 0, 1, 1,
1.637896, 0.7691166, 0.5497766, 0, 0, 0, 1, 1,
1.655324, -0.6079957, 4.109792, 0, 0, 0, 1, 1,
1.657067, 0.3453094, 1.1985, 0, 0, 0, 1, 1,
1.663299, -0.2485707, 1.601589, 0, 0, 0, 1, 1,
1.664083, -0.05152595, 2.669739, 0, 0, 0, 1, 1,
1.669291, -0.5548224, 3.436858, 0, 0, 0, 1, 1,
1.669773, 0.4631388, 1.764981, 0, 0, 0, 1, 1,
1.67512, -0.6922843, 3.834513, 1, 1, 1, 1, 1,
1.711255, 1.533535, 1.775943, 1, 1, 1, 1, 1,
1.740765, -1.260596, -0.01379404, 1, 1, 1, 1, 1,
1.745754, -0.3180028, 0.7870782, 1, 1, 1, 1, 1,
1.747809, 0.180609, 1.59147, 1, 1, 1, 1, 1,
1.755782, -1.45522, 2.060946, 1, 1, 1, 1, 1,
1.757026, -0.5300758, 1.741658, 1, 1, 1, 1, 1,
1.765127, -0.1237696, 0.5221679, 1, 1, 1, 1, 1,
1.79386, 1.211174, 2.058174, 1, 1, 1, 1, 1,
1.798051, 0.2643517, 1.127082, 1, 1, 1, 1, 1,
1.809161, -0.1173523, 1.339451, 1, 1, 1, 1, 1,
1.862374, 0.3026623, 1.399936, 1, 1, 1, 1, 1,
1.865066, 0.4109941, 1.185802, 1, 1, 1, 1, 1,
1.868062, -1.609827, 2.05463, 1, 1, 1, 1, 1,
1.883761, 0.02367873, 1.65234, 1, 1, 1, 1, 1,
1.88905, -0.7241936, 1.798182, 0, 0, 1, 1, 1,
1.895652, -0.937366, 1.766074, 1, 0, 0, 1, 1,
1.903037, 0.9957368, 2.377021, 1, 0, 0, 1, 1,
1.942013, -2.02497, 2.039464, 1, 0, 0, 1, 1,
1.951689, 0.880236, 1.750823, 1, 0, 0, 1, 1,
1.960159, -1.139927, 1.170832, 1, 0, 0, 1, 1,
1.972171, -1.89123, 3.89277, 0, 0, 0, 1, 1,
1.99504, -0.8035123, 4.02011, 0, 0, 0, 1, 1,
1.997249, 2.049757, 0.8940653, 0, 0, 0, 1, 1,
2.018273, -1.720172, 2.77947, 0, 0, 0, 1, 1,
2.067506, 0.9174858, 0.6438094, 0, 0, 0, 1, 1,
2.080297, 0.1614933, 2.155948, 0, 0, 0, 1, 1,
2.168164, 1.239247, 3.662623, 0, 0, 0, 1, 1,
2.351, 0.2087624, 1.302682, 1, 1, 1, 1, 1,
2.398458, 0.5597737, -0.08512729, 1, 1, 1, 1, 1,
2.429403, 0.7390017, 0.6875682, 1, 1, 1, 1, 1,
2.553523, -0.1223668, 2.11253, 1, 1, 1, 1, 1,
2.576442, 0.5678255, 1.63386, 1, 1, 1, 1, 1,
2.683098, -1.015188, 2.040379, 1, 1, 1, 1, 1,
3.367982, 1.590885, 2.479255, 1, 1, 1, 1, 1
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
var radius = 9.697166;
var distance = 34.06089;
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
mvMatrix.translate( -0.220192, 0.1457245, 0.118856 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.06089);
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
