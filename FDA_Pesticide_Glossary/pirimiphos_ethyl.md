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
-2.933143, -0.2072003, -3.047739, 1, 0, 0, 1,
-2.831746, 0.9371765, -1.054268, 1, 0.007843138, 0, 1,
-2.789218, 0.5995159, -1.882018, 1, 0.01176471, 0, 1,
-2.756182, -0.8748859, -2.068712, 1, 0.01960784, 0, 1,
-2.692799, 1.575184, -0.5063831, 1, 0.02352941, 0, 1,
-2.628778, -0.07382301, -0.5131513, 1, 0.03137255, 0, 1,
-2.442182, 1.314742, -1.034974, 1, 0.03529412, 0, 1,
-2.437784, -0.5464274, -0.7869703, 1, 0.04313726, 0, 1,
-2.434151, 1.831389, -0.528964, 1, 0.04705882, 0, 1,
-2.431664, -1.824477, -1.530209, 1, 0.05490196, 0, 1,
-2.312598, -2.22616, -2.117437, 1, 0.05882353, 0, 1,
-2.267575, 0.7699176, -0.7501521, 1, 0.06666667, 0, 1,
-2.261501, -0.765037, -2.66327, 1, 0.07058824, 0, 1,
-2.200557, 2.454837, -0.8914894, 1, 0.07843138, 0, 1,
-2.1867, -0.1261291, -2.904748, 1, 0.08235294, 0, 1,
-2.160577, 0.3596005, -1.187844, 1, 0.09019608, 0, 1,
-2.14326, -0.4584127, -2.10631, 1, 0.09411765, 0, 1,
-2.120365, 1.542683, -2.117851, 1, 0.1019608, 0, 1,
-2.097245, 1.920543, -1.131067, 1, 0.1098039, 0, 1,
-2.095478, -0.5258386, -2.7814, 1, 0.1137255, 0, 1,
-2.094131, 0.5691651, 0.9375485, 1, 0.1215686, 0, 1,
-2.092372, -0.8030288, -1.660768, 1, 0.1254902, 0, 1,
-2.053289, -1.463549, -1.729444, 1, 0.1333333, 0, 1,
-2.020513, 0.731501, 0.3444903, 1, 0.1372549, 0, 1,
-2.01022, 0.8791141, -1.563691, 1, 0.145098, 0, 1,
-1.971413, -0.2509817, -0.2651071, 1, 0.1490196, 0, 1,
-1.96318, 0.4237839, -2.05294, 1, 0.1568628, 0, 1,
-1.944556, 2.261332, -1.011985, 1, 0.1607843, 0, 1,
-1.93432, -0.1763002, -0.7923013, 1, 0.1686275, 0, 1,
-1.922276, -0.1876571, -1.667878, 1, 0.172549, 0, 1,
-1.920202, 0.6309521, -1.507239, 1, 0.1803922, 0, 1,
-1.913361, 2.14743, -1.12621, 1, 0.1843137, 0, 1,
-1.89321, -0.893173, -2.377673, 1, 0.1921569, 0, 1,
-1.851145, -0.2623318, -2.133189, 1, 0.1960784, 0, 1,
-1.84383, -0.4765923, -2.889412, 1, 0.2039216, 0, 1,
-1.817053, -0.03907947, -2.721312, 1, 0.2117647, 0, 1,
-1.793716, -0.454144, -2.894696, 1, 0.2156863, 0, 1,
-1.783202, 0.4322774, -0.4072092, 1, 0.2235294, 0, 1,
-1.762655, -2.315123, -2.450173, 1, 0.227451, 0, 1,
-1.760869, -0.5472291, -0.8070881, 1, 0.2352941, 0, 1,
-1.749344, 0.2051932, -1.408634, 1, 0.2392157, 0, 1,
-1.715838, -0.02678516, -2.277366, 1, 0.2470588, 0, 1,
-1.714491, -1.335878, -2.279415, 1, 0.2509804, 0, 1,
-1.711058, -1.187023, -2.179109, 1, 0.2588235, 0, 1,
-1.68193, -0.3176267, -1.433818, 1, 0.2627451, 0, 1,
-1.677827, 0.1888388, -1.090517, 1, 0.2705882, 0, 1,
-1.674688, 0.1513964, -1.53326, 1, 0.2745098, 0, 1,
-1.673497, 2.536394, 0.3176743, 1, 0.282353, 0, 1,
-1.650519, 1.320971, -0.4453679, 1, 0.2862745, 0, 1,
-1.649237, -0.252858, -4.698974, 1, 0.2941177, 0, 1,
-1.629934, -0.5601162, -1.099022, 1, 0.3019608, 0, 1,
-1.624664, 0.8013366, -0.04487171, 1, 0.3058824, 0, 1,
-1.599712, 3.096747, 0.2965368, 1, 0.3137255, 0, 1,
-1.596501, -0.3240246, -1.626559, 1, 0.3176471, 0, 1,
-1.593798, -0.3460167, -1.018895, 1, 0.3254902, 0, 1,
-1.587438, 0.5841556, -1.658207, 1, 0.3294118, 0, 1,
-1.58223, -1.631295, -3.801881, 1, 0.3372549, 0, 1,
-1.565511, -1.05968, -0.05276826, 1, 0.3411765, 0, 1,
-1.565245, 1.702878, 0.2645974, 1, 0.3490196, 0, 1,
-1.560967, 1.211037, -2.871157, 1, 0.3529412, 0, 1,
-1.54978, -0.5028735, -0.8606113, 1, 0.3607843, 0, 1,
-1.547428, -2.293335, -4.385691, 1, 0.3647059, 0, 1,
-1.544863, 2.307909, 1.171405, 1, 0.372549, 0, 1,
-1.536735, 0.647702, -1.356816, 1, 0.3764706, 0, 1,
-1.531396, -0.6708179, -1.304724, 1, 0.3843137, 0, 1,
-1.529379, -1.291949, -2.993634, 1, 0.3882353, 0, 1,
-1.52527, -1.221938, -2.925769, 1, 0.3960784, 0, 1,
-1.505347, 0.02870104, -2.396704, 1, 0.4039216, 0, 1,
-1.503925, -0.6437284, -2.269944, 1, 0.4078431, 0, 1,
-1.498172, -0.02168971, -1.32616, 1, 0.4156863, 0, 1,
-1.478857, -0.2769978, -0.4714242, 1, 0.4196078, 0, 1,
-1.477366, -0.4165649, -0.7831122, 1, 0.427451, 0, 1,
-1.469565, -0.7434407, -3.034143, 1, 0.4313726, 0, 1,
-1.462094, -1.371835, -3.751007, 1, 0.4392157, 0, 1,
-1.460034, 0.8836436, -0.3072826, 1, 0.4431373, 0, 1,
-1.445895, -0.870497, -3.438269, 1, 0.4509804, 0, 1,
-1.44507, -1.273659, -2.619238, 1, 0.454902, 0, 1,
-1.438779, 2.333541, 0.3155762, 1, 0.4627451, 0, 1,
-1.429517, -1.076675, -0.9008905, 1, 0.4666667, 0, 1,
-1.426747, 1.372097, -2.307587, 1, 0.4745098, 0, 1,
-1.418057, 0.6535039, -0.211599, 1, 0.4784314, 0, 1,
-1.413871, 2.026225, 0.7913026, 1, 0.4862745, 0, 1,
-1.412124, -0.5661868, 0.2397981, 1, 0.4901961, 0, 1,
-1.408942, -0.2498216, -3.197069, 1, 0.4980392, 0, 1,
-1.393182, -0.1244825, -3.06372, 1, 0.5058824, 0, 1,
-1.381072, -0.1032037, -1.22906, 1, 0.509804, 0, 1,
-1.377052, 0.5569476, -1.187722, 1, 0.5176471, 0, 1,
-1.376313, 1.696935, -1.027768, 1, 0.5215687, 0, 1,
-1.37342, -0.09160954, -1.885805, 1, 0.5294118, 0, 1,
-1.342646, -0.51942, -1.429605, 1, 0.5333334, 0, 1,
-1.341831, 0.09235623, -2.51086, 1, 0.5411765, 0, 1,
-1.331894, -0.3210392, -3.914288, 1, 0.5450981, 0, 1,
-1.326128, 0.4956172, -1.950955, 1, 0.5529412, 0, 1,
-1.325884, 2.110911, -0.6855323, 1, 0.5568628, 0, 1,
-1.32542, -0.2381743, -2.475243, 1, 0.5647059, 0, 1,
-1.314518, 0.1085425, -2.865202, 1, 0.5686275, 0, 1,
-1.314498, 0.07874364, -1.972821, 1, 0.5764706, 0, 1,
-1.314455, 0.4580016, -2.021165, 1, 0.5803922, 0, 1,
-1.308993, 0.957457, -0.6073009, 1, 0.5882353, 0, 1,
-1.307894, 1.105704, 0.7365894, 1, 0.5921569, 0, 1,
-1.306694, -0.1657053, -2.145556, 1, 0.6, 0, 1,
-1.298477, 0.2672768, -1.474511, 1, 0.6078432, 0, 1,
-1.295912, 0.06666196, -1.635655, 1, 0.6117647, 0, 1,
-1.294239, -0.6454274, -2.137939, 1, 0.6196079, 0, 1,
-1.293203, 1.540628, 0.002228025, 1, 0.6235294, 0, 1,
-1.281708, 0.6687942, -2.073251, 1, 0.6313726, 0, 1,
-1.271217, -0.1676621, -3.727674, 1, 0.6352941, 0, 1,
-1.260556, -0.3316357, -0.5638415, 1, 0.6431373, 0, 1,
-1.258904, 1.156914, 0.8603695, 1, 0.6470588, 0, 1,
-1.254179, -0.3971369, -1.793415, 1, 0.654902, 0, 1,
-1.239236, -2.009427, -1.853914, 1, 0.6588235, 0, 1,
-1.238378, 0.0250734, -3.200089, 1, 0.6666667, 0, 1,
-1.232437, 1.230907, -0.5263156, 1, 0.6705883, 0, 1,
-1.227622, -1.55715, -1.383418, 1, 0.6784314, 0, 1,
-1.226285, 0.3319973, -2.135918, 1, 0.682353, 0, 1,
-1.220982, -0.4379264, -1.172272, 1, 0.6901961, 0, 1,
-1.210522, 1.604166, -1.997105, 1, 0.6941177, 0, 1,
-1.197397, -0.3633972, -4.4312, 1, 0.7019608, 0, 1,
-1.1809, 0.8977817, -0.6119878, 1, 0.7098039, 0, 1,
-1.177484, 0.6906283, -0.6759072, 1, 0.7137255, 0, 1,
-1.17693, 0.3253284, -2.764277, 1, 0.7215686, 0, 1,
-1.166535, 0.4304143, -0.8539542, 1, 0.7254902, 0, 1,
-1.161797, 0.105508, -0.2361049, 1, 0.7333333, 0, 1,
-1.157951, -0.2491213, -1.482876, 1, 0.7372549, 0, 1,
-1.157054, -0.7901877, -1.845479, 1, 0.7450981, 0, 1,
-1.1509, -1.060997, -2.848645, 1, 0.7490196, 0, 1,
-1.150291, -1.073072, -0.8766111, 1, 0.7568628, 0, 1,
-1.146289, 0.7234036, -1.249917, 1, 0.7607843, 0, 1,
-1.133982, -0.8125305, -2.588667, 1, 0.7686275, 0, 1,
-1.133241, 0.8962537, -1.979373, 1, 0.772549, 0, 1,
-1.133138, 0.4229644, -1.421383, 1, 0.7803922, 0, 1,
-1.117908, 0.1157607, 0.3231114, 1, 0.7843137, 0, 1,
-1.117454, 0.08436935, -1.852921, 1, 0.7921569, 0, 1,
-1.115782, -0.5150288, -1.383848, 1, 0.7960784, 0, 1,
-1.115628, -0.907616, -2.168957, 1, 0.8039216, 0, 1,
-1.11518, -0.5105198, -2.417857, 1, 0.8117647, 0, 1,
-1.112493, -2.210851, -2.537945, 1, 0.8156863, 0, 1,
-1.110804, -0.4453571, -0.6830382, 1, 0.8235294, 0, 1,
-1.109014, 0.1420868, -1.000281, 1, 0.827451, 0, 1,
-1.106851, -1.152889, -2.969949, 1, 0.8352941, 0, 1,
-1.093869, -2.159914, -3.373209, 1, 0.8392157, 0, 1,
-1.093625, 1.435267, -0.1344198, 1, 0.8470588, 0, 1,
-1.09311, 0.8958606, 0.3270782, 1, 0.8509804, 0, 1,
-1.086282, 0.6794339, -2.086166, 1, 0.8588235, 0, 1,
-1.085708, 0.8371935, 0.1366026, 1, 0.8627451, 0, 1,
-1.084433, 1.280052, -0.6413819, 1, 0.8705882, 0, 1,
-1.083778, 0.6679515, -0.01293539, 1, 0.8745098, 0, 1,
-1.078728, -0.3238563, -1.014335, 1, 0.8823529, 0, 1,
-1.072446, -0.3315658, -3.62083, 1, 0.8862745, 0, 1,
-1.066428, 0.3061793, -0.4014284, 1, 0.8941177, 0, 1,
-1.06585, 0.6681058, 0.5761412, 1, 0.8980392, 0, 1,
-1.065347, -0.2025586, -1.531172, 1, 0.9058824, 0, 1,
-1.062524, 2.549618, -0.9308723, 1, 0.9137255, 0, 1,
-1.057303, -0.7737662, -4.628345, 1, 0.9176471, 0, 1,
-1.055591, -0.7581612, -2.588023, 1, 0.9254902, 0, 1,
-1.040855, -0.4290296, -1.078588, 1, 0.9294118, 0, 1,
-1.036959, 2.595766, 2.454698, 1, 0.9372549, 0, 1,
-1.035574, -0.2850916, -1.851508, 1, 0.9411765, 0, 1,
-1.033175, 0.1563026, -1.114646, 1, 0.9490196, 0, 1,
-1.030628, 0.8958152, -0.9040067, 1, 0.9529412, 0, 1,
-1.030592, 1.035237, 1.015124, 1, 0.9607843, 0, 1,
-1.022299, -1.266828, -1.302334, 1, 0.9647059, 0, 1,
-1.021366, -0.5948074, -1.96829, 1, 0.972549, 0, 1,
-1.015464, -0.1038996, -3.371082, 1, 0.9764706, 0, 1,
-1.008903, 0.6522074, -0.1687002, 1, 0.9843137, 0, 1,
-1.007658, -0.4933027, -3.509601, 1, 0.9882353, 0, 1,
-1.001137, -0.3527859, -1.409962, 1, 0.9960784, 0, 1,
-1.000096, 1.180371, -1.309664, 0.9960784, 1, 0, 1,
-0.9934815, 1.290697, 0.1008914, 0.9921569, 1, 0, 1,
-0.9909074, -1.116428, -0.1752369, 0.9843137, 1, 0, 1,
-0.9824219, -1.670509, -3.808069, 0.9803922, 1, 0, 1,
-0.9786237, 0.4271514, -1.371788, 0.972549, 1, 0, 1,
-0.9772204, 0.7946947, -0.244257, 0.9686275, 1, 0, 1,
-0.9719197, 0.8277409, -1.324527, 0.9607843, 1, 0, 1,
-0.9710869, 0.6658969, -1.639893, 0.9568627, 1, 0, 1,
-0.9648585, 1.32885, 0.06574593, 0.9490196, 1, 0, 1,
-0.9593325, -0.4123434, -2.598449, 0.945098, 1, 0, 1,
-0.9578338, -0.7754838, -1.718174, 0.9372549, 1, 0, 1,
-0.950897, -1.426135, -2.315261, 0.9333333, 1, 0, 1,
-0.9482669, 1.387748, -0.4588579, 0.9254902, 1, 0, 1,
-0.9475513, 0.1622954, -1.386405, 0.9215686, 1, 0, 1,
-0.9467377, -0.1769778, -1.431699, 0.9137255, 1, 0, 1,
-0.9428785, 0.4503452, -1.535687, 0.9098039, 1, 0, 1,
-0.9423864, 0.56987, -1.361629, 0.9019608, 1, 0, 1,
-0.9311141, 0.7947459, 0.6412603, 0.8941177, 1, 0, 1,
-0.928263, -1.918972, -1.370636, 0.8901961, 1, 0, 1,
-0.9249722, -0.608141, -1.799312, 0.8823529, 1, 0, 1,
-0.9224864, -1.796353, -2.278712, 0.8784314, 1, 0, 1,
-0.9220009, 2.407857, -0.601864, 0.8705882, 1, 0, 1,
-0.9188492, -0.2685574, -2.1644, 0.8666667, 1, 0, 1,
-0.9184871, -0.02628243, -1.333656, 0.8588235, 1, 0, 1,
-0.9138346, -0.9067922, 0.2179826, 0.854902, 1, 0, 1,
-0.9036502, 0.8892682, -0.2942983, 0.8470588, 1, 0, 1,
-0.9006964, -1.287225, -2.114327, 0.8431373, 1, 0, 1,
-0.8965273, 0.5253593, -1.627657, 0.8352941, 1, 0, 1,
-0.8945138, -1.144347, 0.0253337, 0.8313726, 1, 0, 1,
-0.8914359, -0.2285131, -1.815591, 0.8235294, 1, 0, 1,
-0.8843883, -0.262174, 0.257812, 0.8196079, 1, 0, 1,
-0.8823019, -0.4325512, -1.475568, 0.8117647, 1, 0, 1,
-0.8784636, 0.7687126, -1.266411, 0.8078431, 1, 0, 1,
-0.865868, 1.438617, -1.187872, 0.8, 1, 0, 1,
-0.863993, -0.05157882, -1.400121, 0.7921569, 1, 0, 1,
-0.8620703, -0.6476817, -2.937834, 0.7882353, 1, 0, 1,
-0.8563997, 0.4988183, -2.12773, 0.7803922, 1, 0, 1,
-0.8534761, -0.1691871, -3.158232, 0.7764706, 1, 0, 1,
-0.8517321, 0.1181695, -2.481363, 0.7686275, 1, 0, 1,
-0.8435152, 0.4126968, -1.352127, 0.7647059, 1, 0, 1,
-0.837888, 0.040116, -3.267463, 0.7568628, 1, 0, 1,
-0.8373418, -0.2404986, -2.105802, 0.7529412, 1, 0, 1,
-0.8350106, 0.6017764, -0.7001346, 0.7450981, 1, 0, 1,
-0.8326364, 0.05252831, -2.528649, 0.7411765, 1, 0, 1,
-0.8307917, -0.1286003, -1.61969, 0.7333333, 1, 0, 1,
-0.8290167, -1.154176, -3.001142, 0.7294118, 1, 0, 1,
-0.8239601, 0.2069299, -2.746324, 0.7215686, 1, 0, 1,
-0.8154827, 1.112913, -1.244764, 0.7176471, 1, 0, 1,
-0.8079247, 0.2510292, -1.212562, 0.7098039, 1, 0, 1,
-0.8044474, -0.2038721, 1.15302, 0.7058824, 1, 0, 1,
-0.7974453, -0.4221825, -2.073003, 0.6980392, 1, 0, 1,
-0.7914759, -0.1461244, -1.70262, 0.6901961, 1, 0, 1,
-0.7863041, -1.76017, -2.811187, 0.6862745, 1, 0, 1,
-0.7809061, -0.3790706, -0.8050133, 0.6784314, 1, 0, 1,
-0.7769475, 0.5381988, -1.91192, 0.6745098, 1, 0, 1,
-0.7744796, -0.486197, -3.860486, 0.6666667, 1, 0, 1,
-0.7725433, -0.5293629, -2.201203, 0.6627451, 1, 0, 1,
-0.7709197, 0.4652545, -2.441239, 0.654902, 1, 0, 1,
-0.7687957, -0.9257827, -2.378088, 0.6509804, 1, 0, 1,
-0.7685156, -0.1897833, -3.582695, 0.6431373, 1, 0, 1,
-0.7648391, -0.7283789, -3.038762, 0.6392157, 1, 0, 1,
-0.7589954, -0.7791362, -2.210976, 0.6313726, 1, 0, 1,
-0.7573222, 0.7775179, -1.788975, 0.627451, 1, 0, 1,
-0.7552069, -0.02495195, -2.617918, 0.6196079, 1, 0, 1,
-0.7525976, -0.3303159, -2.626344, 0.6156863, 1, 0, 1,
-0.752103, -0.3159841, -2.915039, 0.6078432, 1, 0, 1,
-0.7514651, -0.8567897, -3.091599, 0.6039216, 1, 0, 1,
-0.7495042, -1.640643, -2.828099, 0.5960785, 1, 0, 1,
-0.7482309, 0.5578388, -1.060169, 0.5882353, 1, 0, 1,
-0.7477744, 0.6931393, -0.5142729, 0.5843138, 1, 0, 1,
-0.7471926, 1.467055, -0.6698679, 0.5764706, 1, 0, 1,
-0.7441664, -0.4191558, -2.642026, 0.572549, 1, 0, 1,
-0.7416605, 0.5332909, -1.311781, 0.5647059, 1, 0, 1,
-0.7386138, 0.2122627, -1.387295, 0.5607843, 1, 0, 1,
-0.7367445, -1.11541, -3.116736, 0.5529412, 1, 0, 1,
-0.7349725, -1.920282, -1.676993, 0.5490196, 1, 0, 1,
-0.7300671, 0.7629242, -0.6205727, 0.5411765, 1, 0, 1,
-0.7172304, -1.905559, -1.407953, 0.5372549, 1, 0, 1,
-0.7171435, -0.128232, -0.7959118, 0.5294118, 1, 0, 1,
-0.7106769, 1.016242, -0.1874522, 0.5254902, 1, 0, 1,
-0.7063862, 1.982568, 0.7719742, 0.5176471, 1, 0, 1,
-0.7044178, 0.8254167, -1.312016, 0.5137255, 1, 0, 1,
-0.7003754, 1.20036, -0.1994166, 0.5058824, 1, 0, 1,
-0.6898193, -1.112278, -1.305612, 0.5019608, 1, 0, 1,
-0.6892501, -0.6101569, -0.7621605, 0.4941176, 1, 0, 1,
-0.6883763, 0.2524061, -0.6568676, 0.4862745, 1, 0, 1,
-0.6876734, 0.03724704, -1.264924, 0.4823529, 1, 0, 1,
-0.6810386, 0.1936491, -2.388127, 0.4745098, 1, 0, 1,
-0.6767592, -0.1931789, -1.169788, 0.4705882, 1, 0, 1,
-0.6703023, -0.5175627, -3.358586, 0.4627451, 1, 0, 1,
-0.669197, -0.1081309, -1.286312, 0.4588235, 1, 0, 1,
-0.664849, 0.004493289, -0.9616737, 0.4509804, 1, 0, 1,
-0.6646295, -1.726379, -2.09278, 0.4470588, 1, 0, 1,
-0.6623978, 0.8896291, -0.2982046, 0.4392157, 1, 0, 1,
-0.6546115, 0.3813556, -0.7957063, 0.4352941, 1, 0, 1,
-0.6486718, -0.1683381, -1.082404, 0.427451, 1, 0, 1,
-0.6480168, 1.85324, -1.470456, 0.4235294, 1, 0, 1,
-0.647077, -0.9576895, -2.771517, 0.4156863, 1, 0, 1,
-0.6467611, -0.5926082, -3.959579, 0.4117647, 1, 0, 1,
-0.640891, -1.337008, -3.261109, 0.4039216, 1, 0, 1,
-0.6383908, 0.4386437, -0.3119521, 0.3960784, 1, 0, 1,
-0.6367643, -0.8606592, -2.359346, 0.3921569, 1, 0, 1,
-0.6341851, 1.892343, -1.009109, 0.3843137, 1, 0, 1,
-0.6314771, -0.03257009, 0.2931134, 0.3803922, 1, 0, 1,
-0.6278114, -0.3396601, -1.998688, 0.372549, 1, 0, 1,
-0.6277545, -0.7345759, -3.429304, 0.3686275, 1, 0, 1,
-0.6236219, 1.92216, -0.9199317, 0.3607843, 1, 0, 1,
-0.6200156, 1.07297, 0.9945964, 0.3568628, 1, 0, 1,
-0.6052497, -0.5261614, -3.862278, 0.3490196, 1, 0, 1,
-0.6030405, 0.6232397, -0.685469, 0.345098, 1, 0, 1,
-0.6017202, 0.6638062, -0.31688, 0.3372549, 1, 0, 1,
-0.6004086, -0.6372015, -1.803887, 0.3333333, 1, 0, 1,
-0.5967719, -1.683996, -3.361668, 0.3254902, 1, 0, 1,
-0.593034, -1.378489, -2.008185, 0.3215686, 1, 0, 1,
-0.5909804, -1.23179, -2.993281, 0.3137255, 1, 0, 1,
-0.5909712, -0.6784037, -1.585636, 0.3098039, 1, 0, 1,
-0.5854688, -0.3460116, -0.4086564, 0.3019608, 1, 0, 1,
-0.5811948, 1.741021, -0.900956, 0.2941177, 1, 0, 1,
-0.579172, -0.3301874, -1.52208, 0.2901961, 1, 0, 1,
-0.5759333, -0.8722454, -1.755649, 0.282353, 1, 0, 1,
-0.5733886, -0.07833496, 0.27755, 0.2784314, 1, 0, 1,
-0.5663961, -0.5671631, -3.274283, 0.2705882, 1, 0, 1,
-0.5618096, 1.063297, 0.1192367, 0.2666667, 1, 0, 1,
-0.5568359, 0.8339794, -1.638042, 0.2588235, 1, 0, 1,
-0.5531718, 0.0975363, 2.067596, 0.254902, 1, 0, 1,
-0.5477248, 1.296863, 1.532758, 0.2470588, 1, 0, 1,
-0.5472926, 1.121805, -0.8965288, 0.2431373, 1, 0, 1,
-0.545577, 0.7210821, -0.5790421, 0.2352941, 1, 0, 1,
-0.538783, 0.8550366, 0.2219437, 0.2313726, 1, 0, 1,
-0.536273, 1.233075, -2.188613, 0.2235294, 1, 0, 1,
-0.5356885, 0.7119122, -0.1672674, 0.2196078, 1, 0, 1,
-0.5348517, 0.2813213, -2.256205, 0.2117647, 1, 0, 1,
-0.5330044, -0.1183867, -2.401496, 0.2078431, 1, 0, 1,
-0.5327062, 1.448215, 0.5193107, 0.2, 1, 0, 1,
-0.5253171, 0.2840469, -1.248792, 0.1921569, 1, 0, 1,
-0.5203145, -0.1395686, -1.367498, 0.1882353, 1, 0, 1,
-0.5202018, -0.4340913, -4.049091, 0.1803922, 1, 0, 1,
-0.5180183, 0.3179811, -0.02875788, 0.1764706, 1, 0, 1,
-0.5142252, 0.7346186, 0.695047, 0.1686275, 1, 0, 1,
-0.511919, -0.5130304, -1.034183, 0.1647059, 1, 0, 1,
-0.5102458, 0.5981378, 0.08692016, 0.1568628, 1, 0, 1,
-0.5053356, 0.0507873, -1.154599, 0.1529412, 1, 0, 1,
-0.5013909, 1.262585, -1.343235, 0.145098, 1, 0, 1,
-0.5010185, 1.654545, 0.2528137, 0.1411765, 1, 0, 1,
-0.4968068, -0.3453668, -2.783888, 0.1333333, 1, 0, 1,
-0.4954442, 2.398145, 1.289211, 0.1294118, 1, 0, 1,
-0.4866113, -0.4315809, -1.732954, 0.1215686, 1, 0, 1,
-0.4817385, -1.545792, -3.857727, 0.1176471, 1, 0, 1,
-0.4804495, -0.2727365, -0.3335913, 0.1098039, 1, 0, 1,
-0.4793817, 0.756406, -0.9676006, 0.1058824, 1, 0, 1,
-0.4766222, -0.1907126, -3.20512, 0.09803922, 1, 0, 1,
-0.4738245, 0.3725575, 0.1547083, 0.09019608, 1, 0, 1,
-0.4730046, 1.123005, 0.2325972, 0.08627451, 1, 0, 1,
-0.4705075, 0.004358954, 1.539532, 0.07843138, 1, 0, 1,
-0.4674478, -0.8781123, -2.228602, 0.07450981, 1, 0, 1,
-0.4585226, -1.425591, -3.015521, 0.06666667, 1, 0, 1,
-0.4524176, 0.3561046, -2.203884, 0.0627451, 1, 0, 1,
-0.4509231, 1.12591, -0.8356361, 0.05490196, 1, 0, 1,
-0.4494929, 0.08561183, -2.429998, 0.05098039, 1, 0, 1,
-0.4490266, 0.5011172, -1.772863, 0.04313726, 1, 0, 1,
-0.4470225, 0.1652389, -0.1844453, 0.03921569, 1, 0, 1,
-0.446087, 0.2185519, -1.170383, 0.03137255, 1, 0, 1,
-0.4454979, 0.4225214, -0.02270567, 0.02745098, 1, 0, 1,
-0.4445556, 1.635846, 0.3077207, 0.01960784, 1, 0, 1,
-0.4414822, 1.127731, -0.5056345, 0.01568628, 1, 0, 1,
-0.4409773, 0.6836492, 2.345514, 0.007843138, 1, 0, 1,
-0.4377735, 0.01647364, 1.037288, 0.003921569, 1, 0, 1,
-0.4337534, 0.1245696, -2.279494, 0, 1, 0.003921569, 1,
-0.433502, 0.9416774, -1.54028, 0, 1, 0.01176471, 1,
-0.428769, 0.601151, -0.8697432, 0, 1, 0.01568628, 1,
-0.4258381, -0.872005, -3.216222, 0, 1, 0.02352941, 1,
-0.4143739, 0.6145024, -0.07220919, 0, 1, 0.02745098, 1,
-0.4097199, -0.7911936, -3.899552, 0, 1, 0.03529412, 1,
-0.4093638, -0.2074719, -2.40536, 0, 1, 0.03921569, 1,
-0.4074081, 0.6952167, 0.5583974, 0, 1, 0.04705882, 1,
-0.4002121, -1.991234, -0.7426598, 0, 1, 0.05098039, 1,
-0.3993505, 0.4091674, -1.774384, 0, 1, 0.05882353, 1,
-0.3961161, -1.637246, -3.264388, 0, 1, 0.0627451, 1,
-0.3951134, -0.8034387, -0.5097007, 0, 1, 0.07058824, 1,
-0.3909357, 1.904509, -0.668514, 0, 1, 0.07450981, 1,
-0.3904676, 0.7068478, -0.8071999, 0, 1, 0.08235294, 1,
-0.3860854, -1.259403, -3.997104, 0, 1, 0.08627451, 1,
-0.3813604, 1.56372, 1.172807, 0, 1, 0.09411765, 1,
-0.3812826, 0.126632, -2.93293, 0, 1, 0.1019608, 1,
-0.3805985, 0.9363569, 0.257322, 0, 1, 0.1058824, 1,
-0.3777059, -1.527595, -2.705341, 0, 1, 0.1137255, 1,
-0.3754585, -0.6298776, -1.07154, 0, 1, 0.1176471, 1,
-0.3733635, 0.3578712, -0.7376595, 0, 1, 0.1254902, 1,
-0.3719539, 0.677282, 0.9611486, 0, 1, 0.1294118, 1,
-0.3700778, -0.478213, -3.989331, 0, 1, 0.1372549, 1,
-0.3686745, -0.7689113, -3.546176, 0, 1, 0.1411765, 1,
-0.3606611, -1.077957, -1.96206, 0, 1, 0.1490196, 1,
-0.3586514, 0.6175004, 0.0703858, 0, 1, 0.1529412, 1,
-0.3537127, 0.2625388, -1.141439, 0, 1, 0.1607843, 1,
-0.3532401, -1.326421, -3.534352, 0, 1, 0.1647059, 1,
-0.3513227, 0.06551228, -1.586499, 0, 1, 0.172549, 1,
-0.3456016, -1.580418, -2.639713, 0, 1, 0.1764706, 1,
-0.3419821, -0.7104179, -3.088439, 0, 1, 0.1843137, 1,
-0.3403532, 0.1917345, -1.637775, 0, 1, 0.1882353, 1,
-0.3397762, -0.6188443, -0.7525324, 0, 1, 0.1960784, 1,
-0.3381519, -0.05583994, -1.140374, 0, 1, 0.2039216, 1,
-0.3351447, 0.7712062, -0.4067131, 0, 1, 0.2078431, 1,
-0.3336477, -1.153997, -2.211364, 0, 1, 0.2156863, 1,
-0.3334962, -0.1789949, -0.6312057, 0, 1, 0.2196078, 1,
-0.3327444, 0.3618438, 0.7613207, 0, 1, 0.227451, 1,
-0.3262799, 2.334932, 0.8356104, 0, 1, 0.2313726, 1,
-0.3240349, 1.828631, 0.2506471, 0, 1, 0.2392157, 1,
-0.3236923, -1.601906, -2.783708, 0, 1, 0.2431373, 1,
-0.3206835, 0.7090089, -1.607266, 0, 1, 0.2509804, 1,
-0.312892, -0.9182484, -2.546184, 0, 1, 0.254902, 1,
-0.3123555, 1.523654, 0.192302, 0, 1, 0.2627451, 1,
-0.3121064, 1.071846, 0.8161621, 0, 1, 0.2666667, 1,
-0.3094013, -1.485644, -2.985247, 0, 1, 0.2745098, 1,
-0.302721, -1.164219, -2.582606, 0, 1, 0.2784314, 1,
-0.3019243, 0.663278, 0.3404371, 0, 1, 0.2862745, 1,
-0.3011051, 0.2596014, -0.3521114, 0, 1, 0.2901961, 1,
-0.3009371, 0.08377104, -1.208776, 0, 1, 0.2980392, 1,
-0.2982447, -0.6451876, -2.580269, 0, 1, 0.3058824, 1,
-0.2960139, -1.408945, -3.965054, 0, 1, 0.3098039, 1,
-0.2956584, 0.1634818, -0.6384395, 0, 1, 0.3176471, 1,
-0.2950299, -0.3187561, -2.50074, 0, 1, 0.3215686, 1,
-0.2936596, 0.2775439, -2.397087, 0, 1, 0.3294118, 1,
-0.2884353, -0.2315485, -3.465929, 0, 1, 0.3333333, 1,
-0.2854849, -0.7181132, -1.742331, 0, 1, 0.3411765, 1,
-0.2850518, -1.809853, -2.916491, 0, 1, 0.345098, 1,
-0.2837118, -1.15157, -3.435841, 0, 1, 0.3529412, 1,
-0.2782536, -0.9161637, -2.833726, 0, 1, 0.3568628, 1,
-0.2778811, -0.5338621, -2.909169, 0, 1, 0.3647059, 1,
-0.2774094, -0.6205642, -0.6833132, 0, 1, 0.3686275, 1,
-0.2703065, 0.6284854, -0.08005451, 0, 1, 0.3764706, 1,
-0.2650313, 0.3678526, 0.0393789, 0, 1, 0.3803922, 1,
-0.2623332, -1.487604, -3.982621, 0, 1, 0.3882353, 1,
-0.2607259, -0.3139769, -0.9956688, 0, 1, 0.3921569, 1,
-0.2582654, 0.5377914, -1.778773, 0, 1, 0.4, 1,
-0.2557041, 0.6962695, 0.1358959, 0, 1, 0.4078431, 1,
-0.2550777, -1.746871, -3.183098, 0, 1, 0.4117647, 1,
-0.2547069, -0.4062583, -1.464084, 0, 1, 0.4196078, 1,
-0.2490105, 0.1026146, -1.53161, 0, 1, 0.4235294, 1,
-0.2488503, 1.400126, -0.648384, 0, 1, 0.4313726, 1,
-0.2482322, -0.6599412, -3.165602, 0, 1, 0.4352941, 1,
-0.2480611, -0.13835, -4.04795, 0, 1, 0.4431373, 1,
-0.2476399, -0.3801822, -2.253208, 0, 1, 0.4470588, 1,
-0.2469317, -0.03932824, -3.378046, 0, 1, 0.454902, 1,
-0.2457687, 0.816589, 0.589544, 0, 1, 0.4588235, 1,
-0.2456104, -1.202732, -2.923823, 0, 1, 0.4666667, 1,
-0.2396534, 0.5162823, -0.9524424, 0, 1, 0.4705882, 1,
-0.2253971, 0.3831815, -1.143501, 0, 1, 0.4784314, 1,
-0.2250732, 0.6002887, 0.2756088, 0, 1, 0.4823529, 1,
-0.2207162, -2.800348, -4.12155, 0, 1, 0.4901961, 1,
-0.2170576, -0.3592066, -1.922515, 0, 1, 0.4941176, 1,
-0.2142582, -1.416544, -3.599382, 0, 1, 0.5019608, 1,
-0.2118558, 0.3973957, -0.2862153, 0, 1, 0.509804, 1,
-0.2117469, -1.29596, -3.049504, 0, 1, 0.5137255, 1,
-0.2096921, -0.3779957, -2.854688, 0, 1, 0.5215687, 1,
-0.2085801, -0.1575956, 0.05689075, 0, 1, 0.5254902, 1,
-0.2048566, 0.5737527, -1.310901, 0, 1, 0.5333334, 1,
-0.2031221, -0.5207555, -1.967624, 0, 1, 0.5372549, 1,
-0.1980541, -0.7395489, -2.607466, 0, 1, 0.5450981, 1,
-0.1965919, -1.252872, -3.211042, 0, 1, 0.5490196, 1,
-0.1962607, 0.3268937, -0.8571049, 0, 1, 0.5568628, 1,
-0.1929311, -0.9725972, -3.138362, 0, 1, 0.5607843, 1,
-0.1928691, 0.3290861, -1.350757, 0, 1, 0.5686275, 1,
-0.1918192, 1.287376, 0.944236, 0, 1, 0.572549, 1,
-0.1916323, -0.3417545, -3.311408, 0, 1, 0.5803922, 1,
-0.1915853, 1.170145, 1.317066, 0, 1, 0.5843138, 1,
-0.1903017, -0.06791014, -1.895717, 0, 1, 0.5921569, 1,
-0.1787732, -0.8266807, -3.421004, 0, 1, 0.5960785, 1,
-0.1764076, 1.241286, -1.194623, 0, 1, 0.6039216, 1,
-0.1760798, 0.4196121, 0.1451134, 0, 1, 0.6117647, 1,
-0.1760519, -0.5696221, -1.600435, 0, 1, 0.6156863, 1,
-0.174593, -1.840041, -3.663382, 0, 1, 0.6235294, 1,
-0.1711813, 0.9617618, 0.7611896, 0, 1, 0.627451, 1,
-0.1707698, -0.9587765, -2.704209, 0, 1, 0.6352941, 1,
-0.1705855, -0.4734985, -3.95885, 0, 1, 0.6392157, 1,
-0.1663833, -0.07876413, -2.166129, 0, 1, 0.6470588, 1,
-0.1659189, -0.2542878, -2.515047, 0, 1, 0.6509804, 1,
-0.1621265, -0.3416516, -3.757215, 0, 1, 0.6588235, 1,
-0.1612147, -0.4122011, -2.585765, 0, 1, 0.6627451, 1,
-0.1610747, -0.7049808, -1.279633, 0, 1, 0.6705883, 1,
-0.1571835, 0.2020832, -0.4804872, 0, 1, 0.6745098, 1,
-0.1550288, 0.3209274, -1.566307, 0, 1, 0.682353, 1,
-0.1508361, -0.564328, -3.253534, 0, 1, 0.6862745, 1,
-0.1500358, 1.269664, -0.9887398, 0, 1, 0.6941177, 1,
-0.1489127, -0.8168092, -3.069405, 0, 1, 0.7019608, 1,
-0.1382667, -0.03716707, -3.05093, 0, 1, 0.7058824, 1,
-0.1369073, 0.3128046, 0.5688533, 0, 1, 0.7137255, 1,
-0.1351625, 0.9660897, -0.6286151, 0, 1, 0.7176471, 1,
-0.1313863, -0.0004519747, -0.4321922, 0, 1, 0.7254902, 1,
-0.1292714, -0.5209167, -1.980108, 0, 1, 0.7294118, 1,
-0.1286599, 0.3376316, -1.184677, 0, 1, 0.7372549, 1,
-0.1226478, 1.079046, 0.2648526, 0, 1, 0.7411765, 1,
-0.1215213, 0.3334691, 0.7609659, 0, 1, 0.7490196, 1,
-0.1199274, 0.7199585, 1.905958, 0, 1, 0.7529412, 1,
-0.1195978, -0.5588313, -1.733168, 0, 1, 0.7607843, 1,
-0.1147897, -1.035827, -2.010762, 0, 1, 0.7647059, 1,
-0.1141507, -1.997972, -4.598275, 0, 1, 0.772549, 1,
-0.1120822, 1.00967, -0.5603299, 0, 1, 0.7764706, 1,
-0.1117504, 0.7704966, 0.1206795, 0, 1, 0.7843137, 1,
-0.1107011, 0.1440925, -2.155859, 0, 1, 0.7882353, 1,
-0.110561, -0.1321254, -3.000068, 0, 1, 0.7960784, 1,
-0.1099719, 1.211308, 0.9868305, 0, 1, 0.8039216, 1,
-0.1098858, -0.1623156, -2.24553, 0, 1, 0.8078431, 1,
-0.1084027, -0.801755, -3.425212, 0, 1, 0.8156863, 1,
-0.108064, -0.2483324, -3.114348, 0, 1, 0.8196079, 1,
-0.1068271, 0.9988569, 1.402476, 0, 1, 0.827451, 1,
-0.1064586, -0.2270089, -2.925102, 0, 1, 0.8313726, 1,
-0.1023443, 0.331658, -1.154019, 0, 1, 0.8392157, 1,
-0.100092, 0.0430496, 0.605919, 0, 1, 0.8431373, 1,
-0.09923086, 1.273777, -0.6761225, 0, 1, 0.8509804, 1,
-0.09711582, -0.2921517, -3.202655, 0, 1, 0.854902, 1,
-0.09057566, 1.884007, 0.8644297, 0, 1, 0.8627451, 1,
-0.08890899, -1.542009, -0.978509, 0, 1, 0.8666667, 1,
-0.088272, -0.8949319, -3.675346, 0, 1, 0.8745098, 1,
-0.07216943, -0.4009264, -3.044145, 0, 1, 0.8784314, 1,
-0.06559878, -1.234731, -4.508237, 0, 1, 0.8862745, 1,
-0.06465783, 0.441976, 2.837945, 0, 1, 0.8901961, 1,
-0.05943456, 0.5305607, -0.6223134, 0, 1, 0.8980392, 1,
-0.05585585, -0.1954802, -3.142296, 0, 1, 0.9058824, 1,
-0.0535322, -0.9042441, -1.852911, 0, 1, 0.9098039, 1,
-0.052485, 0.3465347, -0.9718772, 0, 1, 0.9176471, 1,
-0.04925627, 0.0517846, -2.12687, 0, 1, 0.9215686, 1,
-0.04826549, -0.6753351, -3.024062, 0, 1, 0.9294118, 1,
-0.04355703, 0.21774, 0.5380636, 0, 1, 0.9333333, 1,
-0.03867275, 1.30197, -0.839934, 0, 1, 0.9411765, 1,
-0.0385871, -0.9852324, -1.990432, 0, 1, 0.945098, 1,
-0.03690446, 1.005516, 1.928525, 0, 1, 0.9529412, 1,
-0.0335326, -0.8367593, -3.496827, 0, 1, 0.9568627, 1,
-0.03255589, 0.03350935, -0.01898951, 0, 1, 0.9647059, 1,
-0.03052992, -1.234747, -3.72854, 0, 1, 0.9686275, 1,
-0.02905359, -1.207061, -3.604167, 0, 1, 0.9764706, 1,
-0.02802338, -0.3686813, -1.943254, 0, 1, 0.9803922, 1,
-0.02701365, -1.021913, -3.10732, 0, 1, 0.9882353, 1,
-0.02498685, -0.6324019, -3.198309, 0, 1, 0.9921569, 1,
-0.02439912, 0.2485629, 2.388712, 0, 1, 1, 1,
-0.02279963, 1.852811, -0.2249138, 0, 0.9921569, 1, 1,
-0.02031114, -0.1248813, -2.403282, 0, 0.9882353, 1, 1,
-0.01799485, -0.7504674, -2.998053, 0, 0.9803922, 1, 1,
-0.01623136, -0.4761429, -1.870912, 0, 0.9764706, 1, 1,
-0.01390006, -0.1092721, -4.479041, 0, 0.9686275, 1, 1,
-0.01290534, -0.7337959, -3.432907, 0, 0.9647059, 1, 1,
-0.0111497, 0.677393, -0.06419172, 0, 0.9568627, 1, 1,
-0.009210918, -1.584631, -4.085613, 0, 0.9529412, 1, 1,
-0.005815837, 0.4613015, 0.5518969, 0, 0.945098, 1, 1,
-0.005689834, 0.01621771, -0.722666, 0, 0.9411765, 1, 1,
-0.005607536, -0.4706376, -2.588825, 0, 0.9333333, 1, 1,
-0.003098297, -1.004948, -2.268176, 0, 0.9294118, 1, 1,
-0.002269852, -1.729793, -3.067879, 0, 0.9215686, 1, 1,
-0.0007216624, -0.08287461, -3.34303, 0, 0.9176471, 1, 1,
-0.0002256774, -0.594484, -2.614442, 0, 0.9098039, 1, 1,
0.001588199, 0.4780906, -0.8070221, 0, 0.9058824, 1, 1,
0.002596253, 0.2102003, 0.2014612, 0, 0.8980392, 1, 1,
0.002877432, 1.603427, -1.94812, 0, 0.8901961, 1, 1,
0.006661639, 0.1337185, -0.4287724, 0, 0.8862745, 1, 1,
0.009705041, 0.456474, 0.9992894, 0, 0.8784314, 1, 1,
0.01074319, 1.103688, 0.4104889, 0, 0.8745098, 1, 1,
0.01448179, -1.682386, 2.670738, 0, 0.8666667, 1, 1,
0.01543878, 0.2845665, -0.7073408, 0, 0.8627451, 1, 1,
0.0176849, 0.02097765, 2.086895, 0, 0.854902, 1, 1,
0.01831371, -1.694678, 3.960082, 0, 0.8509804, 1, 1,
0.01866257, -1.261605, 2.796107, 0, 0.8431373, 1, 1,
0.01982214, -1.135338, 5.037523, 0, 0.8392157, 1, 1,
0.02355096, -0.5924771, 2.536421, 0, 0.8313726, 1, 1,
0.02527658, -1.328804, 3.146417, 0, 0.827451, 1, 1,
0.02577026, -1.658524, 2.651961, 0, 0.8196079, 1, 1,
0.02782895, -0.7935803, 3.476483, 0, 0.8156863, 1, 1,
0.02828183, -1.002944, 3.069785, 0, 0.8078431, 1, 1,
0.0312829, -0.3660413, 2.884432, 0, 0.8039216, 1, 1,
0.03324558, 0.1559311, -1.160124, 0, 0.7960784, 1, 1,
0.03946802, 1.812726, -0.9944127, 0, 0.7882353, 1, 1,
0.0410965, -0.9378775, 2.414514, 0, 0.7843137, 1, 1,
0.04398198, -0.5008558, 0.9104653, 0, 0.7764706, 1, 1,
0.04435663, -0.02709298, 1.898532, 0, 0.772549, 1, 1,
0.04775112, 0.5826129, 0.09844093, 0, 0.7647059, 1, 1,
0.04895321, 0.4575441, 1.107842, 0, 0.7607843, 1, 1,
0.05505222, 0.7674883, 1.544217, 0, 0.7529412, 1, 1,
0.05707072, -0.02630937, 2.798973, 0, 0.7490196, 1, 1,
0.05731726, 0.623561, -0.1240082, 0, 0.7411765, 1, 1,
0.05987385, -1.336751, 1.855516, 0, 0.7372549, 1, 1,
0.06056713, -0.6805657, 3.172728, 0, 0.7294118, 1, 1,
0.06531157, 0.3629661, 0.9965016, 0, 0.7254902, 1, 1,
0.06535509, -0.2751286, 1.121388, 0, 0.7176471, 1, 1,
0.08026757, 0.8792136, 0.485193, 0, 0.7137255, 1, 1,
0.08326574, -0.06292107, 3.683064, 0, 0.7058824, 1, 1,
0.08340002, 0.6037315, -1.341982, 0, 0.6980392, 1, 1,
0.08394306, 0.01383008, 0.6042699, 0, 0.6941177, 1, 1,
0.08594211, -1.651211, 2.584309, 0, 0.6862745, 1, 1,
0.09101892, -1.007906, 3.954307, 0, 0.682353, 1, 1,
0.09235578, 0.2448378, 0.9652414, 0, 0.6745098, 1, 1,
0.09268126, 0.3745937, -1.657155, 0, 0.6705883, 1, 1,
0.09292642, -0.4245954, 1.991524, 0, 0.6627451, 1, 1,
0.098814, 1.07052, 1.214918, 0, 0.6588235, 1, 1,
0.09947508, 0.04955287, 0.8278341, 0, 0.6509804, 1, 1,
0.1003169, -0.16216, 3.520844, 0, 0.6470588, 1, 1,
0.1009814, 0.4656095, -0.1299153, 0, 0.6392157, 1, 1,
0.1024403, 0.3164005, 0.8303595, 0, 0.6352941, 1, 1,
0.1038923, -0.01134574, 0.4437738, 0, 0.627451, 1, 1,
0.1046783, -0.03452, 2.600433, 0, 0.6235294, 1, 1,
0.1054725, 1.523533, -0.8706396, 0, 0.6156863, 1, 1,
0.1066017, -0.5235953, 4.103014, 0, 0.6117647, 1, 1,
0.1129317, -0.537634, 1.852512, 0, 0.6039216, 1, 1,
0.1157152, -0.144402, 2.655223, 0, 0.5960785, 1, 1,
0.1260712, 0.5666679, 0.2186471, 0, 0.5921569, 1, 1,
0.1283157, 1.134832, 1.646966, 0, 0.5843138, 1, 1,
0.1300097, 1.61617, 0.2693487, 0, 0.5803922, 1, 1,
0.1302506, 1.238634, -1.716269, 0, 0.572549, 1, 1,
0.1329878, -0.3303796, 1.551458, 0, 0.5686275, 1, 1,
0.1344, 0.3224703, 0.4451948, 0, 0.5607843, 1, 1,
0.1392894, 0.8316336, -0.9325436, 0, 0.5568628, 1, 1,
0.1439763, -0.001103107, 0.6902459, 0, 0.5490196, 1, 1,
0.1463137, 1.241335, -1.340179, 0, 0.5450981, 1, 1,
0.1475152, -2.099112, 2.380676, 0, 0.5372549, 1, 1,
0.1516659, -0.04031412, 0.630568, 0, 0.5333334, 1, 1,
0.1518074, -0.3336216, 2.969299, 0, 0.5254902, 1, 1,
0.153076, 0.3155291, 2.535321, 0, 0.5215687, 1, 1,
0.1553539, 1.294082, 0.4703237, 0, 0.5137255, 1, 1,
0.1556691, -0.6333156, 3.188999, 0, 0.509804, 1, 1,
0.1557308, -0.007856796, 1.604728, 0, 0.5019608, 1, 1,
0.1568007, 0.1717006, 1.09611, 0, 0.4941176, 1, 1,
0.1573434, 0.1360601, 0.5254285, 0, 0.4901961, 1, 1,
0.1588988, -1.005635, 4.39444, 0, 0.4823529, 1, 1,
0.1591873, -0.8639556, 1.263546, 0, 0.4784314, 1, 1,
0.1593048, 0.04803052, 2.553697, 0, 0.4705882, 1, 1,
0.1610682, -0.5017684, 3.24631, 0, 0.4666667, 1, 1,
0.16234, 0.01088058, 3.867746, 0, 0.4588235, 1, 1,
0.1657347, -0.6245206, 2.633248, 0, 0.454902, 1, 1,
0.165741, 0.6018539, -0.1945304, 0, 0.4470588, 1, 1,
0.1690297, -1.159378, 2.689314, 0, 0.4431373, 1, 1,
0.1726902, 0.7313397, 0.826571, 0, 0.4352941, 1, 1,
0.1743766, -0.615512, 4.890698, 0, 0.4313726, 1, 1,
0.1777673, 0.4261991, 1.096556, 0, 0.4235294, 1, 1,
0.1793932, 0.7931134, -0.01157649, 0, 0.4196078, 1, 1,
0.1879443, -2.988659, 2.076955, 0, 0.4117647, 1, 1,
0.1896881, -0.872763, 1.457647, 0, 0.4078431, 1, 1,
0.1960409, 0.2681737, 1.498815, 0, 0.4, 1, 1,
0.196987, 0.3746759, 0.693675, 0, 0.3921569, 1, 1,
0.1996513, -0.468989, 2.704432, 0, 0.3882353, 1, 1,
0.2026251, 1.109421, -0.3083672, 0, 0.3803922, 1, 1,
0.2039753, -0.1656742, 0.1032276, 0, 0.3764706, 1, 1,
0.2055271, -2.663086, 2.516169, 0, 0.3686275, 1, 1,
0.2088195, 0.3018959, 1.299879, 0, 0.3647059, 1, 1,
0.2090632, 0.1883172, 1.536393, 0, 0.3568628, 1, 1,
0.2109898, 0.9323442, 0.262631, 0, 0.3529412, 1, 1,
0.2118468, 0.6679469, 0.239402, 0, 0.345098, 1, 1,
0.2192497, 0.5506276, 1.132692, 0, 0.3411765, 1, 1,
0.2202041, 0.1390796, 0.7882456, 0, 0.3333333, 1, 1,
0.2202839, -0.8207229, 1.967682, 0, 0.3294118, 1, 1,
0.22206, 0.7595888, -0.6730562, 0, 0.3215686, 1, 1,
0.2273111, 0.9288667, 0.7481859, 0, 0.3176471, 1, 1,
0.2273828, -0.3700078, -0.07750177, 0, 0.3098039, 1, 1,
0.2321639, -1.097999, 1.251498, 0, 0.3058824, 1, 1,
0.2340302, -1.053569, 2.147428, 0, 0.2980392, 1, 1,
0.2346463, -0.139764, 1.283229, 0, 0.2901961, 1, 1,
0.2378696, -0.8643661, 1.65439, 0, 0.2862745, 1, 1,
0.238316, -0.3223524, 1.439574, 0, 0.2784314, 1, 1,
0.243599, -2.504009, 4.445997, 0, 0.2745098, 1, 1,
0.2455618, 1.487249, 0.5821552, 0, 0.2666667, 1, 1,
0.2546331, 0.3650278, -1.549225, 0, 0.2627451, 1, 1,
0.2561305, 0.4291614, -0.2429243, 0, 0.254902, 1, 1,
0.2594349, 0.8521781, 0.5624612, 0, 0.2509804, 1, 1,
0.2664284, -0.3606245, 6.22824, 0, 0.2431373, 1, 1,
0.2673533, 0.6149676, 0.6826221, 0, 0.2392157, 1, 1,
0.2723636, -0.1969471, 2.908504, 0, 0.2313726, 1, 1,
0.2775929, -0.8938791, 2.892024, 0, 0.227451, 1, 1,
0.2828088, 0.8940387, 1.03258, 0, 0.2196078, 1, 1,
0.2871146, 0.8886757, -0.0442177, 0, 0.2156863, 1, 1,
0.2888978, 0.03099309, 1.070086, 0, 0.2078431, 1, 1,
0.2953047, -0.128054, 0.5139837, 0, 0.2039216, 1, 1,
0.2956386, 1.897038, 0.01415089, 0, 0.1960784, 1, 1,
0.2980781, -1.232396, 2.158653, 0, 0.1882353, 1, 1,
0.2984959, -1.016714, 0.863399, 0, 0.1843137, 1, 1,
0.3008354, 0.5503632, 1.676833, 0, 0.1764706, 1, 1,
0.3010948, 1.386699, 1.333442, 0, 0.172549, 1, 1,
0.3061937, 0.2219902, 1.701445, 0, 0.1647059, 1, 1,
0.3091345, 0.1647638, 1.389638, 0, 0.1607843, 1, 1,
0.3092623, 1.080682, 1.597968, 0, 0.1529412, 1, 1,
0.3114446, -0.3433049, 1.05177, 0, 0.1490196, 1, 1,
0.3135322, -0.1942572, 0.9503518, 0, 0.1411765, 1, 1,
0.3140395, -0.6913484, 1.116895, 0, 0.1372549, 1, 1,
0.3148194, 0.9323348, -0.008146755, 0, 0.1294118, 1, 1,
0.3159495, 0.05056793, 2.488008, 0, 0.1254902, 1, 1,
0.3245627, 0.4875048, -0.1705868, 0, 0.1176471, 1, 1,
0.3251242, 0.1754353, 1.962181, 0, 0.1137255, 1, 1,
0.326691, -0.7514727, 3.114171, 0, 0.1058824, 1, 1,
0.3292759, 0.526262, 1.612714, 0, 0.09803922, 1, 1,
0.3303561, -1.322366, 1.424481, 0, 0.09411765, 1, 1,
0.3312112, 0.9904801, 1.735507, 0, 0.08627451, 1, 1,
0.3348351, -0.5745041, 2.354241, 0, 0.08235294, 1, 1,
0.3392175, 0.2388288, 2.104759, 0, 0.07450981, 1, 1,
0.3428966, -0.244941, 2.810156, 0, 0.07058824, 1, 1,
0.3431723, -0.47294, 3.681987, 0, 0.0627451, 1, 1,
0.3456498, -1.124743, 2.721433, 0, 0.05882353, 1, 1,
0.3477398, -3.099318, 2.508255, 0, 0.05098039, 1, 1,
0.3479255, 1.016053, -0.0004181524, 0, 0.04705882, 1, 1,
0.3490689, -0.1034969, 2.749771, 0, 0.03921569, 1, 1,
0.3492733, -0.1772601, 2.150795, 0, 0.03529412, 1, 1,
0.3505447, -0.2511849, 2.217596, 0, 0.02745098, 1, 1,
0.3560837, 0.3107881, -0.6082472, 0, 0.02352941, 1, 1,
0.3587636, 0.8436348, 0.1578863, 0, 0.01568628, 1, 1,
0.3598337, 0.06971198, 1.448724, 0, 0.01176471, 1, 1,
0.3617156, 0.3853598, -0.2197234, 0, 0.003921569, 1, 1,
0.3622416, 0.2240133, -0.3826596, 0.003921569, 0, 1, 1,
0.3655464, -0.4442092, 2.710481, 0.007843138, 0, 1, 1,
0.3658141, -0.844304, 1.870944, 0.01568628, 0, 1, 1,
0.3692693, -1.00664, 2.946222, 0.01960784, 0, 1, 1,
0.3719241, -0.9987415, 3.280905, 0.02745098, 0, 1, 1,
0.3720422, -0.8145673, 2.793728, 0.03137255, 0, 1, 1,
0.3757572, 0.1504239, 0.448474, 0.03921569, 0, 1, 1,
0.3771944, 0.6231411, -0.2372736, 0.04313726, 0, 1, 1,
0.380519, -0.2468376, 2.568993, 0.05098039, 0, 1, 1,
0.3837021, 0.5838075, 0.8465183, 0.05490196, 0, 1, 1,
0.3842119, 1.171069, 0.8180819, 0.0627451, 0, 1, 1,
0.3843738, 1.755813, 0.1202082, 0.06666667, 0, 1, 1,
0.3898385, -0.3237745, 2.841185, 0.07450981, 0, 1, 1,
0.3899001, -1.238491, 3.770913, 0.07843138, 0, 1, 1,
0.3902257, 0.934728, 2.004833, 0.08627451, 0, 1, 1,
0.391093, 1.980485, -0.6360816, 0.09019608, 0, 1, 1,
0.4000947, -1.242734, 2.390254, 0.09803922, 0, 1, 1,
0.4012749, 1.074741, 2.00394, 0.1058824, 0, 1, 1,
0.4043165, 0.1758339, 1.223731, 0.1098039, 0, 1, 1,
0.4152773, -0.1953535, 2.329917, 0.1176471, 0, 1, 1,
0.4176704, 0.3110708, -0.8883514, 0.1215686, 0, 1, 1,
0.4253561, -0.1123474, 2.167454, 0.1294118, 0, 1, 1,
0.4330574, -0.2791984, 2.049795, 0.1333333, 0, 1, 1,
0.4351235, -0.663914, 2.688951, 0.1411765, 0, 1, 1,
0.43636, 0.4434479, 1.393392, 0.145098, 0, 1, 1,
0.437496, -0.2509495, 1.800695, 0.1529412, 0, 1, 1,
0.4404871, -0.4122128, -0.8225581, 0.1568628, 0, 1, 1,
0.4428297, 0.9464443, -0.5024608, 0.1647059, 0, 1, 1,
0.4460756, 0.5025025, 1.796361, 0.1686275, 0, 1, 1,
0.4463049, 0.3533619, 0.7099809, 0.1764706, 0, 1, 1,
0.4473649, -0.06789844, -0.5450222, 0.1803922, 0, 1, 1,
0.4517266, 0.4477956, -1.052903, 0.1882353, 0, 1, 1,
0.4539787, -0.8923168, 2.712458, 0.1921569, 0, 1, 1,
0.4563108, -2.32572, 4.590811, 0.2, 0, 1, 1,
0.4583925, 2.221615, -1.286938, 0.2078431, 0, 1, 1,
0.4605412, 1.802724, -1.133329, 0.2117647, 0, 1, 1,
0.4606733, -1.427364, 2.669836, 0.2196078, 0, 1, 1,
0.4621164, 0.01846293, 2.489798, 0.2235294, 0, 1, 1,
0.4635848, 1.499707, -0.03922157, 0.2313726, 0, 1, 1,
0.4642885, -0.5075321, 2.14917, 0.2352941, 0, 1, 1,
0.4654348, -0.4659717, 2.803043, 0.2431373, 0, 1, 1,
0.4659459, 1.202926, 0.5424262, 0.2470588, 0, 1, 1,
0.4668623, 0.1542075, 2.436704, 0.254902, 0, 1, 1,
0.469411, 1.868752, 0.3203085, 0.2588235, 0, 1, 1,
0.4714108, -0.09649555, 2.626783, 0.2666667, 0, 1, 1,
0.472217, 0.3251753, 1.60974, 0.2705882, 0, 1, 1,
0.4743263, 1.715729, 1.681825, 0.2784314, 0, 1, 1,
0.4754697, 0.9242843, -0.1691668, 0.282353, 0, 1, 1,
0.4754992, 1.692246, 1.550387, 0.2901961, 0, 1, 1,
0.4790006, -0.4744688, 1.83201, 0.2941177, 0, 1, 1,
0.4853907, 0.006949914, 0.9129779, 0.3019608, 0, 1, 1,
0.4857174, 1.253538, -0.275068, 0.3098039, 0, 1, 1,
0.4868306, 0.2692925, 1.933283, 0.3137255, 0, 1, 1,
0.4878933, 0.4121925, 0.9636069, 0.3215686, 0, 1, 1,
0.4998902, -0.06872808, 4.030611, 0.3254902, 0, 1, 1,
0.5051236, -0.317916, 4.441732, 0.3333333, 0, 1, 1,
0.5098755, -0.293229, 3.054555, 0.3372549, 0, 1, 1,
0.511422, -2.033993, 1.700439, 0.345098, 0, 1, 1,
0.5186138, 0.8652355, 0.0766262, 0.3490196, 0, 1, 1,
0.5219361, 1.48488, 1.249766, 0.3568628, 0, 1, 1,
0.5261285, -0.09925275, 1.331375, 0.3607843, 0, 1, 1,
0.5288118, 0.5353401, 1.477868, 0.3686275, 0, 1, 1,
0.5302943, -1.107147, 2.527994, 0.372549, 0, 1, 1,
0.5335709, -1.882736, 3.133873, 0.3803922, 0, 1, 1,
0.5411258, -0.3950615, 2.300499, 0.3843137, 0, 1, 1,
0.5436182, 1.485585, 1.003164, 0.3921569, 0, 1, 1,
0.5443829, -0.3164433, 2.600763, 0.3960784, 0, 1, 1,
0.5460823, 1.010846, -0.3777067, 0.4039216, 0, 1, 1,
0.5571792, 0.5585328, 1.085056, 0.4117647, 0, 1, 1,
0.5572223, -1.008475, 3.20104, 0.4156863, 0, 1, 1,
0.5589243, -1.255244, 3.852433, 0.4235294, 0, 1, 1,
0.5589477, 0.3749551, 0.6036465, 0.427451, 0, 1, 1,
0.5648903, 1.110537, -1.654322, 0.4352941, 0, 1, 1,
0.5672773, 0.07514492, 0.8952021, 0.4392157, 0, 1, 1,
0.5714448, 0.1201069, 2.109518, 0.4470588, 0, 1, 1,
0.5746573, 0.2164699, 2.513764, 0.4509804, 0, 1, 1,
0.5817555, -1.011672, 2.96635, 0.4588235, 0, 1, 1,
0.584818, 1.058583, -0.08297469, 0.4627451, 0, 1, 1,
0.5853333, 0.3625738, 0.6275765, 0.4705882, 0, 1, 1,
0.5902938, -1.557582, 2.284512, 0.4745098, 0, 1, 1,
0.5918193, -0.8742096, 3.42166, 0.4823529, 0, 1, 1,
0.5928975, -1.474936, 3.355033, 0.4862745, 0, 1, 1,
0.593196, -0.438412, 2.018188, 0.4941176, 0, 1, 1,
0.6145759, -0.02313117, 5.271672, 0.5019608, 0, 1, 1,
0.6152218, 0.3037827, 0.7600637, 0.5058824, 0, 1, 1,
0.6177447, -0.08490855, 2.146751, 0.5137255, 0, 1, 1,
0.6183351, 0.7141745, -0.4041833, 0.5176471, 0, 1, 1,
0.6233854, -0.08398969, 1.698934, 0.5254902, 0, 1, 1,
0.6235322, 1.05387, 0.4214128, 0.5294118, 0, 1, 1,
0.6361704, 1.207173, 0.4304905, 0.5372549, 0, 1, 1,
0.6375704, 0.8975577, 0.5688961, 0.5411765, 0, 1, 1,
0.6419984, -0.2943732, 1.291082, 0.5490196, 0, 1, 1,
0.6432755, -0.5717472, 0.8917738, 0.5529412, 0, 1, 1,
0.6438776, 1.848136, 0.1933424, 0.5607843, 0, 1, 1,
0.6503658, 0.3342531, 1.863106, 0.5647059, 0, 1, 1,
0.6553912, 0.5496153, -0.1875375, 0.572549, 0, 1, 1,
0.655946, -0.09258174, 1.816377, 0.5764706, 0, 1, 1,
0.6567779, -0.887145, 2.711946, 0.5843138, 0, 1, 1,
0.6603907, -0.720396, 1.118568, 0.5882353, 0, 1, 1,
0.6629843, -1.046218, 1.642383, 0.5960785, 0, 1, 1,
0.6733445, -0.1044421, -0.1750994, 0.6039216, 0, 1, 1,
0.6800671, -0.3839656, 2.293706, 0.6078432, 0, 1, 1,
0.6805555, 0.6715698, -0.06933483, 0.6156863, 0, 1, 1,
0.6864285, 0.1253776, 2.235233, 0.6196079, 0, 1, 1,
0.6877355, 0.40555, 0.8689324, 0.627451, 0, 1, 1,
0.6884773, -0.03374861, 1.93172, 0.6313726, 0, 1, 1,
0.6892896, -1.972316, 4.418544, 0.6392157, 0, 1, 1,
0.6933585, -0.218166, 3.330142, 0.6431373, 0, 1, 1,
0.6977131, 0.8220474, 0.05160524, 0.6509804, 0, 1, 1,
0.7049628, -0.82765, 4.23552, 0.654902, 0, 1, 1,
0.7103595, 0.8053815, 0.574509, 0.6627451, 0, 1, 1,
0.711478, 1.038326, -0.3457529, 0.6666667, 0, 1, 1,
0.7134291, 1.096617, -0.04921953, 0.6745098, 0, 1, 1,
0.7203743, 1.516872, 1.08821, 0.6784314, 0, 1, 1,
0.7304643, -2.639055, 1.68283, 0.6862745, 0, 1, 1,
0.7396951, 1.490551, 0.6731822, 0.6901961, 0, 1, 1,
0.7404428, -0.0831448, 2.28018, 0.6980392, 0, 1, 1,
0.76288, 1.144637, -0.3164758, 0.7058824, 0, 1, 1,
0.764266, -0.1624485, 0.9784048, 0.7098039, 0, 1, 1,
0.765637, -0.6363087, 2.026518, 0.7176471, 0, 1, 1,
0.7673246, 0.5157861, 1.05983, 0.7215686, 0, 1, 1,
0.76801, 0.0558566, 0.8304501, 0.7294118, 0, 1, 1,
0.7687163, -0.02495541, 1.617468, 0.7333333, 0, 1, 1,
0.7719525, -1.418853, 4.343257, 0.7411765, 0, 1, 1,
0.7732899, 2.228643, -1.112929, 0.7450981, 0, 1, 1,
0.774042, -0.1389806, 2.928232, 0.7529412, 0, 1, 1,
0.7754613, 2.632708, -0.06960285, 0.7568628, 0, 1, 1,
0.7818115, 1.095603, 0.2383175, 0.7647059, 0, 1, 1,
0.8030375, -0.5297881, 1.962214, 0.7686275, 0, 1, 1,
0.8125158, -0.3752878, 2.67988, 0.7764706, 0, 1, 1,
0.8193136, 0.4121521, -1.182367, 0.7803922, 0, 1, 1,
0.819391, 1.277011, 2.432327, 0.7882353, 0, 1, 1,
0.8203589, -1.702051, 2.830808, 0.7921569, 0, 1, 1,
0.8224184, -0.9360682, 2.077684, 0.8, 0, 1, 1,
0.8235095, 0.7779201, 0.1447448, 0.8078431, 0, 1, 1,
0.8343272, 0.2434619, -0.8206618, 0.8117647, 0, 1, 1,
0.8355856, 0.7295558, 1.527473, 0.8196079, 0, 1, 1,
0.8371716, 1.207241, 1.037623, 0.8235294, 0, 1, 1,
0.8406887, 0.8547577, -0.7527606, 0.8313726, 0, 1, 1,
0.8577585, 0.5799506, 0.8376902, 0.8352941, 0, 1, 1,
0.8578005, 2.456378, -1.186393, 0.8431373, 0, 1, 1,
0.8589432, 1.669844, 1.21738, 0.8470588, 0, 1, 1,
0.8596976, 0.1246627, 2.885487, 0.854902, 0, 1, 1,
0.8628308, 1.475604, 1.93525, 0.8588235, 0, 1, 1,
0.8642942, -0.9806397, 4.105476, 0.8666667, 0, 1, 1,
0.8656209, 0.3503631, 2.37584, 0.8705882, 0, 1, 1,
0.8663805, 0.3410973, 0.9856182, 0.8784314, 0, 1, 1,
0.8771561, 0.07010707, 2.446226, 0.8823529, 0, 1, 1,
0.8818185, 0.5152214, 1.386276, 0.8901961, 0, 1, 1,
0.8829001, -0.0953, 0.9035613, 0.8941177, 0, 1, 1,
0.8866116, -0.05179813, 0.06799028, 0.9019608, 0, 1, 1,
0.8879133, -1.784651, 2.110797, 0.9098039, 0, 1, 1,
0.8880697, -0.4587168, 2.028093, 0.9137255, 0, 1, 1,
0.8914722, -0.9880659, 1.094514, 0.9215686, 0, 1, 1,
0.9044448, -0.6663393, 3.169527, 0.9254902, 0, 1, 1,
0.9054965, 0.1723234, 1.327888, 0.9333333, 0, 1, 1,
0.9087673, -0.5970986, 1.561439, 0.9372549, 0, 1, 1,
0.9120463, -0.05649292, 2.898104, 0.945098, 0, 1, 1,
0.9132877, -0.9505875, 2.588352, 0.9490196, 0, 1, 1,
0.9192132, -0.1251485, 0.05287401, 0.9568627, 0, 1, 1,
0.9203286, -0.8119377, 2.371563, 0.9607843, 0, 1, 1,
0.92997, 0.1714611, 1.311857, 0.9686275, 0, 1, 1,
0.9334232, 0.919601, 0.2601359, 0.972549, 0, 1, 1,
0.939708, -0.6820665, 1.74844, 0.9803922, 0, 1, 1,
0.9424704, -0.5197787, 1.943326, 0.9843137, 0, 1, 1,
0.9481235, 0.1887218, 1.086004, 0.9921569, 0, 1, 1,
0.9532304, 0.191203, 0.08172015, 0.9960784, 0, 1, 1,
0.9582563, 0.103761, 1.941369, 1, 0, 0.9960784, 1,
0.9590413, -0.6708401, 1.317122, 1, 0, 0.9882353, 1,
0.9614604, -0.7138044, 1.430254, 1, 0, 0.9843137, 1,
0.9694405, -0.04540622, 3.01537, 1, 0, 0.9764706, 1,
0.9704645, -0.02027107, 0.182911, 1, 0, 0.972549, 1,
0.9715213, 0.07357417, 0.6998546, 1, 0, 0.9647059, 1,
0.974615, 1.603226, 0.3939731, 1, 0, 0.9607843, 1,
0.9764226, -0.4382363, 2.587319, 1, 0, 0.9529412, 1,
0.9768805, -0.9889579, 1.807336, 1, 0, 0.9490196, 1,
0.9795272, 0.9406547, 2.850493, 1, 0, 0.9411765, 1,
0.9796457, 0.7986031, -0.6320074, 1, 0, 0.9372549, 1,
0.9822307, 0.1735165, 1.046068, 1, 0, 0.9294118, 1,
0.9842269, 0.2118327, 1.158695, 1, 0, 0.9254902, 1,
0.9845598, -1.307482, 2.508102, 1, 0, 0.9176471, 1,
0.9873285, 0.4297337, 0.639896, 1, 0, 0.9137255, 1,
0.9879549, 0.6992722, 0.06243866, 1, 0, 0.9058824, 1,
0.9907517, -0.2697346, 2.577738, 1, 0, 0.9019608, 1,
0.9948348, -1.656658, 4.569978, 1, 0, 0.8941177, 1,
0.9981113, -0.5355804, 2.702847, 1, 0, 0.8862745, 1,
1.016928, -0.4357189, 1.895367, 1, 0, 0.8823529, 1,
1.030642, 0.7367853, 0.9822671, 1, 0, 0.8745098, 1,
1.032354, 0.1260648, 1.981868, 1, 0, 0.8705882, 1,
1.03375, 1.482685, -0.4704435, 1, 0, 0.8627451, 1,
1.034718, -0.3885692, 0.2398924, 1, 0, 0.8588235, 1,
1.039815, 0.111568, 3.046015, 1, 0, 0.8509804, 1,
1.041041, 0.1162335, 1.670291, 1, 0, 0.8470588, 1,
1.042818, -1.603091, 4.764034, 1, 0, 0.8392157, 1,
1.049607, 0.5165936, 1.478762, 1, 0, 0.8352941, 1,
1.070433, 3.079758, 1.039098, 1, 0, 0.827451, 1,
1.084345, -2.088406, 2.043598, 1, 0, 0.8235294, 1,
1.097777, 0.1174544, 1.07688, 1, 0, 0.8156863, 1,
1.103844, 0.7531457, 0.9276983, 1, 0, 0.8117647, 1,
1.104672, -1.022947, 3.111284, 1, 0, 0.8039216, 1,
1.113297, -0.572024, 2.099399, 1, 0, 0.7960784, 1,
1.117194, -1.155448, 1.358309, 1, 0, 0.7921569, 1,
1.124146, 0.4901585, -0.9377394, 1, 0, 0.7843137, 1,
1.125632, 1.542559, 1.12399, 1, 0, 0.7803922, 1,
1.12704, -0.1017933, 1.522197, 1, 0, 0.772549, 1,
1.137924, -1.870395, 1.220441, 1, 0, 0.7686275, 1,
1.142725, -1.069891, 3.533233, 1, 0, 0.7607843, 1,
1.143137, 0.7853676, 0.4997092, 1, 0, 0.7568628, 1,
1.143919, -0.7196317, 2.086848, 1, 0, 0.7490196, 1,
1.15232, 1.020887, -0.3689893, 1, 0, 0.7450981, 1,
1.15503, -1.556458, 2.128649, 1, 0, 0.7372549, 1,
1.160146, -0.7672555, 2.055093, 1, 0, 0.7333333, 1,
1.167393, -1.034336, 2.911805, 1, 0, 0.7254902, 1,
1.16784, 0.127551, 1.520528, 1, 0, 0.7215686, 1,
1.180506, -0.9350823, 4.716149, 1, 0, 0.7137255, 1,
1.182449, -0.6986231, 2.389821, 1, 0, 0.7098039, 1,
1.183096, -0.1467287, 1.591073, 1, 0, 0.7019608, 1,
1.183308, 0.287759, 1.540152, 1, 0, 0.6941177, 1,
1.185722, 2.031761, -0.1327733, 1, 0, 0.6901961, 1,
1.1881, -0.324914, 3.263413, 1, 0, 0.682353, 1,
1.207767, 0.5762906, -1.674934, 1, 0, 0.6784314, 1,
1.220826, -0.03688099, 3.151978, 1, 0, 0.6705883, 1,
1.228907, 0.7851676, -0.733066, 1, 0, 0.6666667, 1,
1.247828, 0.7160902, -1.45443, 1, 0, 0.6588235, 1,
1.251319, -1.382159, 3.202031, 1, 0, 0.654902, 1,
1.258522, 0.1911781, 0.3965136, 1, 0, 0.6470588, 1,
1.267009, -0.833007, 1.438927, 1, 0, 0.6431373, 1,
1.269078, 1.612713, -0.3023969, 1, 0, 0.6352941, 1,
1.272657, -0.9372523, 2.448958, 1, 0, 0.6313726, 1,
1.278607, -0.9289784, 2.548061, 1, 0, 0.6235294, 1,
1.291659, -0.1573433, 1.540157, 1, 0, 0.6196079, 1,
1.309056, 1.235569, 2.618635, 1, 0, 0.6117647, 1,
1.310779, -0.4292329, 1.238768, 1, 0, 0.6078432, 1,
1.314055, 1.042629, 0.2833963, 1, 0, 0.6, 1,
1.31714, -1.473808, 1.262654, 1, 0, 0.5921569, 1,
1.325682, 0.4650387, 1.179954, 1, 0, 0.5882353, 1,
1.342623, -0.4052389, 1.878408, 1, 0, 0.5803922, 1,
1.355946, -0.9294986, 1.931152, 1, 0, 0.5764706, 1,
1.356, 1.68668, 0.586566, 1, 0, 0.5686275, 1,
1.357077, 0.09005076, 2.562392, 1, 0, 0.5647059, 1,
1.364714, 0.7769886, 3.589967, 1, 0, 0.5568628, 1,
1.375727, -0.4174755, -0.8184487, 1, 0, 0.5529412, 1,
1.385802, -0.3762163, 1.793159, 1, 0, 0.5450981, 1,
1.408394, 1.647128, 1.153617, 1, 0, 0.5411765, 1,
1.416128, -0.6212435, 1.94467, 1, 0, 0.5333334, 1,
1.417612, -0.8973309, 0.1316704, 1, 0, 0.5294118, 1,
1.428264, -0.3535666, 0.7792988, 1, 0, 0.5215687, 1,
1.432146, -0.1067503, -0.1327938, 1, 0, 0.5176471, 1,
1.440106, 0.3123194, 1.409277, 1, 0, 0.509804, 1,
1.444211, 0.09474228, 1.380876, 1, 0, 0.5058824, 1,
1.45284, 0.6127794, 0.1874847, 1, 0, 0.4980392, 1,
1.457556, -0.04659373, 2.174383, 1, 0, 0.4901961, 1,
1.473683, -0.09202813, 0.9691444, 1, 0, 0.4862745, 1,
1.491593, 0.7291293, 2.063452, 1, 0, 0.4784314, 1,
1.502267, 1.113658, 0.3353538, 1, 0, 0.4745098, 1,
1.518957, -1.837849, 4.035895, 1, 0, 0.4666667, 1,
1.524088, 0.5252399, 0.2322824, 1, 0, 0.4627451, 1,
1.535984, -0.7508956, 3.560465, 1, 0, 0.454902, 1,
1.540614, -1.463764, 2.038817, 1, 0, 0.4509804, 1,
1.547145, 0.7339699, 1.280273, 1, 0, 0.4431373, 1,
1.55245, 0.4495412, 1.34898, 1, 0, 0.4392157, 1,
1.577926, 0.2627501, 1.433679, 1, 0, 0.4313726, 1,
1.587643, -0.4657026, 3.101929, 1, 0, 0.427451, 1,
1.598871, 1.358444, -0.1521311, 1, 0, 0.4196078, 1,
1.603624, 1.501415, 0.6260845, 1, 0, 0.4156863, 1,
1.60894, -0.9302099, 1.309134, 1, 0, 0.4078431, 1,
1.610003, 1.934825, 0.881647, 1, 0, 0.4039216, 1,
1.611563, -1.801547, 3.136801, 1, 0, 0.3960784, 1,
1.616399, -0.08741074, 1.480088, 1, 0, 0.3882353, 1,
1.619609, 0.03019128, 1.172631, 1, 0, 0.3843137, 1,
1.619823, -0.6260618, 4.396286, 1, 0, 0.3764706, 1,
1.620368, 0.08109115, 1.254019, 1, 0, 0.372549, 1,
1.627059, -0.268624, -0.04091251, 1, 0, 0.3647059, 1,
1.645235, -1.49431, 1.618468, 1, 0, 0.3607843, 1,
1.645432, 2.476664, 1.957156, 1, 0, 0.3529412, 1,
1.66035, -0.9548699, 1.671683, 1, 0, 0.3490196, 1,
1.660731, -0.2624491, 0.224379, 1, 0, 0.3411765, 1,
1.661274, 0.4595794, 0.01265316, 1, 0, 0.3372549, 1,
1.692128, 0.2104103, 1.034635, 1, 0, 0.3294118, 1,
1.699312, -1.282254, 1.745938, 1, 0, 0.3254902, 1,
1.706659, 1.132388, 1.01448, 1, 0, 0.3176471, 1,
1.719143, 1.584867, 1.576356, 1, 0, 0.3137255, 1,
1.746386, -1.837845, 1.09348, 1, 0, 0.3058824, 1,
1.749557, -1.146384, 3.002926, 1, 0, 0.2980392, 1,
1.751302, 1.138743, -0.3795479, 1, 0, 0.2941177, 1,
1.751915, -0.07700583, 3.308752, 1, 0, 0.2862745, 1,
1.75381, -0.8543208, 2.897524, 1, 0, 0.282353, 1,
1.773654, -1.019386, 2.347458, 1, 0, 0.2745098, 1,
1.80377, -1.509898, 1.811119, 1, 0, 0.2705882, 1,
1.827862, 0.9295877, -0.4929892, 1, 0, 0.2627451, 1,
1.897534, 0.7688715, 0.9115816, 1, 0, 0.2588235, 1,
1.912357, -0.2553921, 1.994381, 1, 0, 0.2509804, 1,
1.915724, -2.011906, 3.165065, 1, 0, 0.2470588, 1,
1.918185, -0.3720124, 3.71032, 1, 0, 0.2392157, 1,
1.923433, -2.387476, 4.077852, 1, 0, 0.2352941, 1,
1.929, -1.068456, 1.448787, 1, 0, 0.227451, 1,
1.935148, -0.3833162, 1.385638, 1, 0, 0.2235294, 1,
1.944101, -0.3519192, 3.466772, 1, 0, 0.2156863, 1,
1.944534, 0.1626096, 1.944956, 1, 0, 0.2117647, 1,
1.969702, -0.6561957, 2.608249, 1, 0, 0.2039216, 1,
1.971189, 0.4246104, 1.551176, 1, 0, 0.1960784, 1,
1.986759, 0.287099, 0.8360879, 1, 0, 0.1921569, 1,
1.992173, 0.4359923, 2.050807, 1, 0, 0.1843137, 1,
1.997205, -0.4916872, 2.121437, 1, 0, 0.1803922, 1,
2.015802, -0.7696551, 1.70063, 1, 0, 0.172549, 1,
2.016032, -1.393209, 3.101955, 1, 0, 0.1686275, 1,
2.087236, 0.425502, 1.864275, 1, 0, 0.1607843, 1,
2.097067, 1.338312, 2.097698, 1, 0, 0.1568628, 1,
2.156631, 0.9215913, -0.08283798, 1, 0, 0.1490196, 1,
2.173113, -0.8101639, -0.1324476, 1, 0, 0.145098, 1,
2.182948, 0.5137938, 1.500004, 1, 0, 0.1372549, 1,
2.196213, -0.7303771, 1.587856, 1, 0, 0.1333333, 1,
2.199417, -0.330166, 0.6425579, 1, 0, 0.1254902, 1,
2.221837, 0.0416159, 1.50149, 1, 0, 0.1215686, 1,
2.225899, -0.6058185, 3.169832, 1, 0, 0.1137255, 1,
2.232069, 0.5250968, 0.2039736, 1, 0, 0.1098039, 1,
2.235909, 0.7380148, 1.970799, 1, 0, 0.1019608, 1,
2.257221, -1.673583, 1.973088, 1, 0, 0.09411765, 1,
2.263322, -0.5370322, 2.196821, 1, 0, 0.09019608, 1,
2.286478, 0.1928937, 1.058457, 1, 0, 0.08235294, 1,
2.299375, 0.8951534, -0.09873945, 1, 0, 0.07843138, 1,
2.314674, -0.06793459, 1.888695, 1, 0, 0.07058824, 1,
2.319284, 0.08431836, -0.1434969, 1, 0, 0.06666667, 1,
2.355363, 1.247417, 0.7509843, 1, 0, 0.05882353, 1,
2.357456, 0.5519792, 0.1126048, 1, 0, 0.05490196, 1,
2.360578, -0.5708627, 2.029608, 1, 0, 0.04705882, 1,
2.398438, -0.2000878, 3.120728, 1, 0, 0.04313726, 1,
2.46689, -0.6775904, 1.444047, 1, 0, 0.03529412, 1,
2.493512, -0.3898838, 2.104948, 1, 0, 0.03137255, 1,
2.572422, 0.172445, 2.059582, 1, 0, 0.02352941, 1,
2.847807, 0.2115473, 1.739237, 1, 0, 0.01960784, 1,
3.055607, -1.582423, 2.023944, 1, 0, 0.01176471, 1,
3.192895, 0.1726111, 1.894042, 1, 0, 0.007843138, 1
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
0.1298757, -4.149551, -6.551137, 0, -0.5, 0.5, 0.5,
0.1298757, -4.149551, -6.551137, 1, -0.5, 0.5, 0.5,
0.1298757, -4.149551, -6.551137, 1, 1.5, 0.5, 0.5,
0.1298757, -4.149551, -6.551137, 0, 1.5, 0.5, 0.5
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
-3.971507, -0.001285553, -6.551137, 0, -0.5, 0.5, 0.5,
-3.971507, -0.001285553, -6.551137, 1, -0.5, 0.5, 0.5,
-3.971507, -0.001285553, -6.551137, 1, 1.5, 0.5, 0.5,
-3.971507, -0.001285553, -6.551137, 0, 1.5, 0.5, 0.5
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
-3.971507, -4.149551, 0.7646327, 0, -0.5, 0.5, 0.5,
-3.971507, -4.149551, 0.7646327, 1, -0.5, 0.5, 0.5,
-3.971507, -4.149551, 0.7646327, 1, 1.5, 0.5, 0.5,
-3.971507, -4.149551, 0.7646327, 0, 1.5, 0.5, 0.5
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
-2, -3.192259, -4.862882,
3, -3.192259, -4.862882,
-2, -3.192259, -4.862882,
-2, -3.351807, -5.144258,
-1, -3.192259, -4.862882,
-1, -3.351807, -5.144258,
0, -3.192259, -4.862882,
0, -3.351807, -5.144258,
1, -3.192259, -4.862882,
1, -3.351807, -5.144258,
2, -3.192259, -4.862882,
2, -3.351807, -5.144258,
3, -3.192259, -4.862882,
3, -3.351807, -5.144258
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
-2, -3.670905, -5.70701, 0, -0.5, 0.5, 0.5,
-2, -3.670905, -5.70701, 1, -0.5, 0.5, 0.5,
-2, -3.670905, -5.70701, 1, 1.5, 0.5, 0.5,
-2, -3.670905, -5.70701, 0, 1.5, 0.5, 0.5,
-1, -3.670905, -5.70701, 0, -0.5, 0.5, 0.5,
-1, -3.670905, -5.70701, 1, -0.5, 0.5, 0.5,
-1, -3.670905, -5.70701, 1, 1.5, 0.5, 0.5,
-1, -3.670905, -5.70701, 0, 1.5, 0.5, 0.5,
0, -3.670905, -5.70701, 0, -0.5, 0.5, 0.5,
0, -3.670905, -5.70701, 1, -0.5, 0.5, 0.5,
0, -3.670905, -5.70701, 1, 1.5, 0.5, 0.5,
0, -3.670905, -5.70701, 0, 1.5, 0.5, 0.5,
1, -3.670905, -5.70701, 0, -0.5, 0.5, 0.5,
1, -3.670905, -5.70701, 1, -0.5, 0.5, 0.5,
1, -3.670905, -5.70701, 1, 1.5, 0.5, 0.5,
1, -3.670905, -5.70701, 0, 1.5, 0.5, 0.5,
2, -3.670905, -5.70701, 0, -0.5, 0.5, 0.5,
2, -3.670905, -5.70701, 1, -0.5, 0.5, 0.5,
2, -3.670905, -5.70701, 1, 1.5, 0.5, 0.5,
2, -3.670905, -5.70701, 0, 1.5, 0.5, 0.5,
3, -3.670905, -5.70701, 0, -0.5, 0.5, 0.5,
3, -3.670905, -5.70701, 1, -0.5, 0.5, 0.5,
3, -3.670905, -5.70701, 1, 1.5, 0.5, 0.5,
3, -3.670905, -5.70701, 0, 1.5, 0.5, 0.5
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
-3.025034, -3, -4.862882,
-3.025034, 3, -4.862882,
-3.025034, -3, -4.862882,
-3.182779, -3, -5.144258,
-3.025034, -2, -4.862882,
-3.182779, -2, -5.144258,
-3.025034, -1, -4.862882,
-3.182779, -1, -5.144258,
-3.025034, 0, -4.862882,
-3.182779, 0, -5.144258,
-3.025034, 1, -4.862882,
-3.182779, 1, -5.144258,
-3.025034, 2, -4.862882,
-3.182779, 2, -5.144258,
-3.025034, 3, -4.862882,
-3.182779, 3, -5.144258
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
-3.49827, -3, -5.70701, 0, -0.5, 0.5, 0.5,
-3.49827, -3, -5.70701, 1, -0.5, 0.5, 0.5,
-3.49827, -3, -5.70701, 1, 1.5, 0.5, 0.5,
-3.49827, -3, -5.70701, 0, 1.5, 0.5, 0.5,
-3.49827, -2, -5.70701, 0, -0.5, 0.5, 0.5,
-3.49827, -2, -5.70701, 1, -0.5, 0.5, 0.5,
-3.49827, -2, -5.70701, 1, 1.5, 0.5, 0.5,
-3.49827, -2, -5.70701, 0, 1.5, 0.5, 0.5,
-3.49827, -1, -5.70701, 0, -0.5, 0.5, 0.5,
-3.49827, -1, -5.70701, 1, -0.5, 0.5, 0.5,
-3.49827, -1, -5.70701, 1, 1.5, 0.5, 0.5,
-3.49827, -1, -5.70701, 0, 1.5, 0.5, 0.5,
-3.49827, 0, -5.70701, 0, -0.5, 0.5, 0.5,
-3.49827, 0, -5.70701, 1, -0.5, 0.5, 0.5,
-3.49827, 0, -5.70701, 1, 1.5, 0.5, 0.5,
-3.49827, 0, -5.70701, 0, 1.5, 0.5, 0.5,
-3.49827, 1, -5.70701, 0, -0.5, 0.5, 0.5,
-3.49827, 1, -5.70701, 1, -0.5, 0.5, 0.5,
-3.49827, 1, -5.70701, 1, 1.5, 0.5, 0.5,
-3.49827, 1, -5.70701, 0, 1.5, 0.5, 0.5,
-3.49827, 2, -5.70701, 0, -0.5, 0.5, 0.5,
-3.49827, 2, -5.70701, 1, -0.5, 0.5, 0.5,
-3.49827, 2, -5.70701, 1, 1.5, 0.5, 0.5,
-3.49827, 2, -5.70701, 0, 1.5, 0.5, 0.5,
-3.49827, 3, -5.70701, 0, -0.5, 0.5, 0.5,
-3.49827, 3, -5.70701, 1, -0.5, 0.5, 0.5,
-3.49827, 3, -5.70701, 1, 1.5, 0.5, 0.5,
-3.49827, 3, -5.70701, 0, 1.5, 0.5, 0.5
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
-3.025034, -3.192259, -4,
-3.025034, -3.192259, 6,
-3.025034, -3.192259, -4,
-3.182779, -3.351807, -4,
-3.025034, -3.192259, -2,
-3.182779, -3.351807, -2,
-3.025034, -3.192259, 0,
-3.182779, -3.351807, 0,
-3.025034, -3.192259, 2,
-3.182779, -3.351807, 2,
-3.025034, -3.192259, 4,
-3.182779, -3.351807, 4,
-3.025034, -3.192259, 6,
-3.182779, -3.351807, 6
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
-3.49827, -3.670905, -4, 0, -0.5, 0.5, 0.5,
-3.49827, -3.670905, -4, 1, -0.5, 0.5, 0.5,
-3.49827, -3.670905, -4, 1, 1.5, 0.5, 0.5,
-3.49827, -3.670905, -4, 0, 1.5, 0.5, 0.5,
-3.49827, -3.670905, -2, 0, -0.5, 0.5, 0.5,
-3.49827, -3.670905, -2, 1, -0.5, 0.5, 0.5,
-3.49827, -3.670905, -2, 1, 1.5, 0.5, 0.5,
-3.49827, -3.670905, -2, 0, 1.5, 0.5, 0.5,
-3.49827, -3.670905, 0, 0, -0.5, 0.5, 0.5,
-3.49827, -3.670905, 0, 1, -0.5, 0.5, 0.5,
-3.49827, -3.670905, 0, 1, 1.5, 0.5, 0.5,
-3.49827, -3.670905, 0, 0, 1.5, 0.5, 0.5,
-3.49827, -3.670905, 2, 0, -0.5, 0.5, 0.5,
-3.49827, -3.670905, 2, 1, -0.5, 0.5, 0.5,
-3.49827, -3.670905, 2, 1, 1.5, 0.5, 0.5,
-3.49827, -3.670905, 2, 0, 1.5, 0.5, 0.5,
-3.49827, -3.670905, 4, 0, -0.5, 0.5, 0.5,
-3.49827, -3.670905, 4, 1, -0.5, 0.5, 0.5,
-3.49827, -3.670905, 4, 1, 1.5, 0.5, 0.5,
-3.49827, -3.670905, 4, 0, 1.5, 0.5, 0.5,
-3.49827, -3.670905, 6, 0, -0.5, 0.5, 0.5,
-3.49827, -3.670905, 6, 1, -0.5, 0.5, 0.5,
-3.49827, -3.670905, 6, 1, 1.5, 0.5, 0.5,
-3.49827, -3.670905, 6, 0, 1.5, 0.5, 0.5
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
-3.025034, -3.192259, -4.862882,
-3.025034, 3.189688, -4.862882,
-3.025034, -3.192259, 6.392148,
-3.025034, 3.189688, 6.392148,
-3.025034, -3.192259, -4.862882,
-3.025034, -3.192259, 6.392148,
-3.025034, 3.189688, -4.862882,
-3.025034, 3.189688, 6.392148,
-3.025034, -3.192259, -4.862882,
3.284785, -3.192259, -4.862882,
-3.025034, -3.192259, 6.392148,
3.284785, -3.192259, 6.392148,
-3.025034, 3.189688, -4.862882,
3.284785, 3.189688, -4.862882,
-3.025034, 3.189688, 6.392148,
3.284785, 3.189688, 6.392148,
3.284785, -3.192259, -4.862882,
3.284785, 3.189688, -4.862882,
3.284785, -3.192259, 6.392148,
3.284785, 3.189688, 6.392148,
3.284785, -3.192259, -4.862882,
3.284785, -3.192259, 6.392148,
3.284785, 3.189688, -4.862882,
3.284785, 3.189688, 6.392148
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
var radius = 7.686701;
var distance = 34.199;
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
mvMatrix.translate( -0.1298757, 0.001285553, -0.7646327 );
mvMatrix.scale( 1.317155, 1.302269, 0.7384264 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.199);
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
pirimiphos_ethyl<-read.table("pirimiphos_ethyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pirimiphos_ethyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'pirimiphos_ethyl' not found
```

```r
y<-pirimiphos_ethyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'pirimiphos_ethyl' not found
```

```r
z<-pirimiphos_ethyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'pirimiphos_ethyl' not found
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
-2.933143, -0.2072003, -3.047739, 0, 0, 1, 1, 1,
-2.831746, 0.9371765, -1.054268, 1, 0, 0, 1, 1,
-2.789218, 0.5995159, -1.882018, 1, 0, 0, 1, 1,
-2.756182, -0.8748859, -2.068712, 1, 0, 0, 1, 1,
-2.692799, 1.575184, -0.5063831, 1, 0, 0, 1, 1,
-2.628778, -0.07382301, -0.5131513, 1, 0, 0, 1, 1,
-2.442182, 1.314742, -1.034974, 0, 0, 0, 1, 1,
-2.437784, -0.5464274, -0.7869703, 0, 0, 0, 1, 1,
-2.434151, 1.831389, -0.528964, 0, 0, 0, 1, 1,
-2.431664, -1.824477, -1.530209, 0, 0, 0, 1, 1,
-2.312598, -2.22616, -2.117437, 0, 0, 0, 1, 1,
-2.267575, 0.7699176, -0.7501521, 0, 0, 0, 1, 1,
-2.261501, -0.765037, -2.66327, 0, 0, 0, 1, 1,
-2.200557, 2.454837, -0.8914894, 1, 1, 1, 1, 1,
-2.1867, -0.1261291, -2.904748, 1, 1, 1, 1, 1,
-2.160577, 0.3596005, -1.187844, 1, 1, 1, 1, 1,
-2.14326, -0.4584127, -2.10631, 1, 1, 1, 1, 1,
-2.120365, 1.542683, -2.117851, 1, 1, 1, 1, 1,
-2.097245, 1.920543, -1.131067, 1, 1, 1, 1, 1,
-2.095478, -0.5258386, -2.7814, 1, 1, 1, 1, 1,
-2.094131, 0.5691651, 0.9375485, 1, 1, 1, 1, 1,
-2.092372, -0.8030288, -1.660768, 1, 1, 1, 1, 1,
-2.053289, -1.463549, -1.729444, 1, 1, 1, 1, 1,
-2.020513, 0.731501, 0.3444903, 1, 1, 1, 1, 1,
-2.01022, 0.8791141, -1.563691, 1, 1, 1, 1, 1,
-1.971413, -0.2509817, -0.2651071, 1, 1, 1, 1, 1,
-1.96318, 0.4237839, -2.05294, 1, 1, 1, 1, 1,
-1.944556, 2.261332, -1.011985, 1, 1, 1, 1, 1,
-1.93432, -0.1763002, -0.7923013, 0, 0, 1, 1, 1,
-1.922276, -0.1876571, -1.667878, 1, 0, 0, 1, 1,
-1.920202, 0.6309521, -1.507239, 1, 0, 0, 1, 1,
-1.913361, 2.14743, -1.12621, 1, 0, 0, 1, 1,
-1.89321, -0.893173, -2.377673, 1, 0, 0, 1, 1,
-1.851145, -0.2623318, -2.133189, 1, 0, 0, 1, 1,
-1.84383, -0.4765923, -2.889412, 0, 0, 0, 1, 1,
-1.817053, -0.03907947, -2.721312, 0, 0, 0, 1, 1,
-1.793716, -0.454144, -2.894696, 0, 0, 0, 1, 1,
-1.783202, 0.4322774, -0.4072092, 0, 0, 0, 1, 1,
-1.762655, -2.315123, -2.450173, 0, 0, 0, 1, 1,
-1.760869, -0.5472291, -0.8070881, 0, 0, 0, 1, 1,
-1.749344, 0.2051932, -1.408634, 0, 0, 0, 1, 1,
-1.715838, -0.02678516, -2.277366, 1, 1, 1, 1, 1,
-1.714491, -1.335878, -2.279415, 1, 1, 1, 1, 1,
-1.711058, -1.187023, -2.179109, 1, 1, 1, 1, 1,
-1.68193, -0.3176267, -1.433818, 1, 1, 1, 1, 1,
-1.677827, 0.1888388, -1.090517, 1, 1, 1, 1, 1,
-1.674688, 0.1513964, -1.53326, 1, 1, 1, 1, 1,
-1.673497, 2.536394, 0.3176743, 1, 1, 1, 1, 1,
-1.650519, 1.320971, -0.4453679, 1, 1, 1, 1, 1,
-1.649237, -0.252858, -4.698974, 1, 1, 1, 1, 1,
-1.629934, -0.5601162, -1.099022, 1, 1, 1, 1, 1,
-1.624664, 0.8013366, -0.04487171, 1, 1, 1, 1, 1,
-1.599712, 3.096747, 0.2965368, 1, 1, 1, 1, 1,
-1.596501, -0.3240246, -1.626559, 1, 1, 1, 1, 1,
-1.593798, -0.3460167, -1.018895, 1, 1, 1, 1, 1,
-1.587438, 0.5841556, -1.658207, 1, 1, 1, 1, 1,
-1.58223, -1.631295, -3.801881, 0, 0, 1, 1, 1,
-1.565511, -1.05968, -0.05276826, 1, 0, 0, 1, 1,
-1.565245, 1.702878, 0.2645974, 1, 0, 0, 1, 1,
-1.560967, 1.211037, -2.871157, 1, 0, 0, 1, 1,
-1.54978, -0.5028735, -0.8606113, 1, 0, 0, 1, 1,
-1.547428, -2.293335, -4.385691, 1, 0, 0, 1, 1,
-1.544863, 2.307909, 1.171405, 0, 0, 0, 1, 1,
-1.536735, 0.647702, -1.356816, 0, 0, 0, 1, 1,
-1.531396, -0.6708179, -1.304724, 0, 0, 0, 1, 1,
-1.529379, -1.291949, -2.993634, 0, 0, 0, 1, 1,
-1.52527, -1.221938, -2.925769, 0, 0, 0, 1, 1,
-1.505347, 0.02870104, -2.396704, 0, 0, 0, 1, 1,
-1.503925, -0.6437284, -2.269944, 0, 0, 0, 1, 1,
-1.498172, -0.02168971, -1.32616, 1, 1, 1, 1, 1,
-1.478857, -0.2769978, -0.4714242, 1, 1, 1, 1, 1,
-1.477366, -0.4165649, -0.7831122, 1, 1, 1, 1, 1,
-1.469565, -0.7434407, -3.034143, 1, 1, 1, 1, 1,
-1.462094, -1.371835, -3.751007, 1, 1, 1, 1, 1,
-1.460034, 0.8836436, -0.3072826, 1, 1, 1, 1, 1,
-1.445895, -0.870497, -3.438269, 1, 1, 1, 1, 1,
-1.44507, -1.273659, -2.619238, 1, 1, 1, 1, 1,
-1.438779, 2.333541, 0.3155762, 1, 1, 1, 1, 1,
-1.429517, -1.076675, -0.9008905, 1, 1, 1, 1, 1,
-1.426747, 1.372097, -2.307587, 1, 1, 1, 1, 1,
-1.418057, 0.6535039, -0.211599, 1, 1, 1, 1, 1,
-1.413871, 2.026225, 0.7913026, 1, 1, 1, 1, 1,
-1.412124, -0.5661868, 0.2397981, 1, 1, 1, 1, 1,
-1.408942, -0.2498216, -3.197069, 1, 1, 1, 1, 1,
-1.393182, -0.1244825, -3.06372, 0, 0, 1, 1, 1,
-1.381072, -0.1032037, -1.22906, 1, 0, 0, 1, 1,
-1.377052, 0.5569476, -1.187722, 1, 0, 0, 1, 1,
-1.376313, 1.696935, -1.027768, 1, 0, 0, 1, 1,
-1.37342, -0.09160954, -1.885805, 1, 0, 0, 1, 1,
-1.342646, -0.51942, -1.429605, 1, 0, 0, 1, 1,
-1.341831, 0.09235623, -2.51086, 0, 0, 0, 1, 1,
-1.331894, -0.3210392, -3.914288, 0, 0, 0, 1, 1,
-1.326128, 0.4956172, -1.950955, 0, 0, 0, 1, 1,
-1.325884, 2.110911, -0.6855323, 0, 0, 0, 1, 1,
-1.32542, -0.2381743, -2.475243, 0, 0, 0, 1, 1,
-1.314518, 0.1085425, -2.865202, 0, 0, 0, 1, 1,
-1.314498, 0.07874364, -1.972821, 0, 0, 0, 1, 1,
-1.314455, 0.4580016, -2.021165, 1, 1, 1, 1, 1,
-1.308993, 0.957457, -0.6073009, 1, 1, 1, 1, 1,
-1.307894, 1.105704, 0.7365894, 1, 1, 1, 1, 1,
-1.306694, -0.1657053, -2.145556, 1, 1, 1, 1, 1,
-1.298477, 0.2672768, -1.474511, 1, 1, 1, 1, 1,
-1.295912, 0.06666196, -1.635655, 1, 1, 1, 1, 1,
-1.294239, -0.6454274, -2.137939, 1, 1, 1, 1, 1,
-1.293203, 1.540628, 0.002228025, 1, 1, 1, 1, 1,
-1.281708, 0.6687942, -2.073251, 1, 1, 1, 1, 1,
-1.271217, -0.1676621, -3.727674, 1, 1, 1, 1, 1,
-1.260556, -0.3316357, -0.5638415, 1, 1, 1, 1, 1,
-1.258904, 1.156914, 0.8603695, 1, 1, 1, 1, 1,
-1.254179, -0.3971369, -1.793415, 1, 1, 1, 1, 1,
-1.239236, -2.009427, -1.853914, 1, 1, 1, 1, 1,
-1.238378, 0.0250734, -3.200089, 1, 1, 1, 1, 1,
-1.232437, 1.230907, -0.5263156, 0, 0, 1, 1, 1,
-1.227622, -1.55715, -1.383418, 1, 0, 0, 1, 1,
-1.226285, 0.3319973, -2.135918, 1, 0, 0, 1, 1,
-1.220982, -0.4379264, -1.172272, 1, 0, 0, 1, 1,
-1.210522, 1.604166, -1.997105, 1, 0, 0, 1, 1,
-1.197397, -0.3633972, -4.4312, 1, 0, 0, 1, 1,
-1.1809, 0.8977817, -0.6119878, 0, 0, 0, 1, 1,
-1.177484, 0.6906283, -0.6759072, 0, 0, 0, 1, 1,
-1.17693, 0.3253284, -2.764277, 0, 0, 0, 1, 1,
-1.166535, 0.4304143, -0.8539542, 0, 0, 0, 1, 1,
-1.161797, 0.105508, -0.2361049, 0, 0, 0, 1, 1,
-1.157951, -0.2491213, -1.482876, 0, 0, 0, 1, 1,
-1.157054, -0.7901877, -1.845479, 0, 0, 0, 1, 1,
-1.1509, -1.060997, -2.848645, 1, 1, 1, 1, 1,
-1.150291, -1.073072, -0.8766111, 1, 1, 1, 1, 1,
-1.146289, 0.7234036, -1.249917, 1, 1, 1, 1, 1,
-1.133982, -0.8125305, -2.588667, 1, 1, 1, 1, 1,
-1.133241, 0.8962537, -1.979373, 1, 1, 1, 1, 1,
-1.133138, 0.4229644, -1.421383, 1, 1, 1, 1, 1,
-1.117908, 0.1157607, 0.3231114, 1, 1, 1, 1, 1,
-1.117454, 0.08436935, -1.852921, 1, 1, 1, 1, 1,
-1.115782, -0.5150288, -1.383848, 1, 1, 1, 1, 1,
-1.115628, -0.907616, -2.168957, 1, 1, 1, 1, 1,
-1.11518, -0.5105198, -2.417857, 1, 1, 1, 1, 1,
-1.112493, -2.210851, -2.537945, 1, 1, 1, 1, 1,
-1.110804, -0.4453571, -0.6830382, 1, 1, 1, 1, 1,
-1.109014, 0.1420868, -1.000281, 1, 1, 1, 1, 1,
-1.106851, -1.152889, -2.969949, 1, 1, 1, 1, 1,
-1.093869, -2.159914, -3.373209, 0, 0, 1, 1, 1,
-1.093625, 1.435267, -0.1344198, 1, 0, 0, 1, 1,
-1.09311, 0.8958606, 0.3270782, 1, 0, 0, 1, 1,
-1.086282, 0.6794339, -2.086166, 1, 0, 0, 1, 1,
-1.085708, 0.8371935, 0.1366026, 1, 0, 0, 1, 1,
-1.084433, 1.280052, -0.6413819, 1, 0, 0, 1, 1,
-1.083778, 0.6679515, -0.01293539, 0, 0, 0, 1, 1,
-1.078728, -0.3238563, -1.014335, 0, 0, 0, 1, 1,
-1.072446, -0.3315658, -3.62083, 0, 0, 0, 1, 1,
-1.066428, 0.3061793, -0.4014284, 0, 0, 0, 1, 1,
-1.06585, 0.6681058, 0.5761412, 0, 0, 0, 1, 1,
-1.065347, -0.2025586, -1.531172, 0, 0, 0, 1, 1,
-1.062524, 2.549618, -0.9308723, 0, 0, 0, 1, 1,
-1.057303, -0.7737662, -4.628345, 1, 1, 1, 1, 1,
-1.055591, -0.7581612, -2.588023, 1, 1, 1, 1, 1,
-1.040855, -0.4290296, -1.078588, 1, 1, 1, 1, 1,
-1.036959, 2.595766, 2.454698, 1, 1, 1, 1, 1,
-1.035574, -0.2850916, -1.851508, 1, 1, 1, 1, 1,
-1.033175, 0.1563026, -1.114646, 1, 1, 1, 1, 1,
-1.030628, 0.8958152, -0.9040067, 1, 1, 1, 1, 1,
-1.030592, 1.035237, 1.015124, 1, 1, 1, 1, 1,
-1.022299, -1.266828, -1.302334, 1, 1, 1, 1, 1,
-1.021366, -0.5948074, -1.96829, 1, 1, 1, 1, 1,
-1.015464, -0.1038996, -3.371082, 1, 1, 1, 1, 1,
-1.008903, 0.6522074, -0.1687002, 1, 1, 1, 1, 1,
-1.007658, -0.4933027, -3.509601, 1, 1, 1, 1, 1,
-1.001137, -0.3527859, -1.409962, 1, 1, 1, 1, 1,
-1.000096, 1.180371, -1.309664, 1, 1, 1, 1, 1,
-0.9934815, 1.290697, 0.1008914, 0, 0, 1, 1, 1,
-0.9909074, -1.116428, -0.1752369, 1, 0, 0, 1, 1,
-0.9824219, -1.670509, -3.808069, 1, 0, 0, 1, 1,
-0.9786237, 0.4271514, -1.371788, 1, 0, 0, 1, 1,
-0.9772204, 0.7946947, -0.244257, 1, 0, 0, 1, 1,
-0.9719197, 0.8277409, -1.324527, 1, 0, 0, 1, 1,
-0.9710869, 0.6658969, -1.639893, 0, 0, 0, 1, 1,
-0.9648585, 1.32885, 0.06574593, 0, 0, 0, 1, 1,
-0.9593325, -0.4123434, -2.598449, 0, 0, 0, 1, 1,
-0.9578338, -0.7754838, -1.718174, 0, 0, 0, 1, 1,
-0.950897, -1.426135, -2.315261, 0, 0, 0, 1, 1,
-0.9482669, 1.387748, -0.4588579, 0, 0, 0, 1, 1,
-0.9475513, 0.1622954, -1.386405, 0, 0, 0, 1, 1,
-0.9467377, -0.1769778, -1.431699, 1, 1, 1, 1, 1,
-0.9428785, 0.4503452, -1.535687, 1, 1, 1, 1, 1,
-0.9423864, 0.56987, -1.361629, 1, 1, 1, 1, 1,
-0.9311141, 0.7947459, 0.6412603, 1, 1, 1, 1, 1,
-0.928263, -1.918972, -1.370636, 1, 1, 1, 1, 1,
-0.9249722, -0.608141, -1.799312, 1, 1, 1, 1, 1,
-0.9224864, -1.796353, -2.278712, 1, 1, 1, 1, 1,
-0.9220009, 2.407857, -0.601864, 1, 1, 1, 1, 1,
-0.9188492, -0.2685574, -2.1644, 1, 1, 1, 1, 1,
-0.9184871, -0.02628243, -1.333656, 1, 1, 1, 1, 1,
-0.9138346, -0.9067922, 0.2179826, 1, 1, 1, 1, 1,
-0.9036502, 0.8892682, -0.2942983, 1, 1, 1, 1, 1,
-0.9006964, -1.287225, -2.114327, 1, 1, 1, 1, 1,
-0.8965273, 0.5253593, -1.627657, 1, 1, 1, 1, 1,
-0.8945138, -1.144347, 0.0253337, 1, 1, 1, 1, 1,
-0.8914359, -0.2285131, -1.815591, 0, 0, 1, 1, 1,
-0.8843883, -0.262174, 0.257812, 1, 0, 0, 1, 1,
-0.8823019, -0.4325512, -1.475568, 1, 0, 0, 1, 1,
-0.8784636, 0.7687126, -1.266411, 1, 0, 0, 1, 1,
-0.865868, 1.438617, -1.187872, 1, 0, 0, 1, 1,
-0.863993, -0.05157882, -1.400121, 1, 0, 0, 1, 1,
-0.8620703, -0.6476817, -2.937834, 0, 0, 0, 1, 1,
-0.8563997, 0.4988183, -2.12773, 0, 0, 0, 1, 1,
-0.8534761, -0.1691871, -3.158232, 0, 0, 0, 1, 1,
-0.8517321, 0.1181695, -2.481363, 0, 0, 0, 1, 1,
-0.8435152, 0.4126968, -1.352127, 0, 0, 0, 1, 1,
-0.837888, 0.040116, -3.267463, 0, 0, 0, 1, 1,
-0.8373418, -0.2404986, -2.105802, 0, 0, 0, 1, 1,
-0.8350106, 0.6017764, -0.7001346, 1, 1, 1, 1, 1,
-0.8326364, 0.05252831, -2.528649, 1, 1, 1, 1, 1,
-0.8307917, -0.1286003, -1.61969, 1, 1, 1, 1, 1,
-0.8290167, -1.154176, -3.001142, 1, 1, 1, 1, 1,
-0.8239601, 0.2069299, -2.746324, 1, 1, 1, 1, 1,
-0.8154827, 1.112913, -1.244764, 1, 1, 1, 1, 1,
-0.8079247, 0.2510292, -1.212562, 1, 1, 1, 1, 1,
-0.8044474, -0.2038721, 1.15302, 1, 1, 1, 1, 1,
-0.7974453, -0.4221825, -2.073003, 1, 1, 1, 1, 1,
-0.7914759, -0.1461244, -1.70262, 1, 1, 1, 1, 1,
-0.7863041, -1.76017, -2.811187, 1, 1, 1, 1, 1,
-0.7809061, -0.3790706, -0.8050133, 1, 1, 1, 1, 1,
-0.7769475, 0.5381988, -1.91192, 1, 1, 1, 1, 1,
-0.7744796, -0.486197, -3.860486, 1, 1, 1, 1, 1,
-0.7725433, -0.5293629, -2.201203, 1, 1, 1, 1, 1,
-0.7709197, 0.4652545, -2.441239, 0, 0, 1, 1, 1,
-0.7687957, -0.9257827, -2.378088, 1, 0, 0, 1, 1,
-0.7685156, -0.1897833, -3.582695, 1, 0, 0, 1, 1,
-0.7648391, -0.7283789, -3.038762, 1, 0, 0, 1, 1,
-0.7589954, -0.7791362, -2.210976, 1, 0, 0, 1, 1,
-0.7573222, 0.7775179, -1.788975, 1, 0, 0, 1, 1,
-0.7552069, -0.02495195, -2.617918, 0, 0, 0, 1, 1,
-0.7525976, -0.3303159, -2.626344, 0, 0, 0, 1, 1,
-0.752103, -0.3159841, -2.915039, 0, 0, 0, 1, 1,
-0.7514651, -0.8567897, -3.091599, 0, 0, 0, 1, 1,
-0.7495042, -1.640643, -2.828099, 0, 0, 0, 1, 1,
-0.7482309, 0.5578388, -1.060169, 0, 0, 0, 1, 1,
-0.7477744, 0.6931393, -0.5142729, 0, 0, 0, 1, 1,
-0.7471926, 1.467055, -0.6698679, 1, 1, 1, 1, 1,
-0.7441664, -0.4191558, -2.642026, 1, 1, 1, 1, 1,
-0.7416605, 0.5332909, -1.311781, 1, 1, 1, 1, 1,
-0.7386138, 0.2122627, -1.387295, 1, 1, 1, 1, 1,
-0.7367445, -1.11541, -3.116736, 1, 1, 1, 1, 1,
-0.7349725, -1.920282, -1.676993, 1, 1, 1, 1, 1,
-0.7300671, 0.7629242, -0.6205727, 1, 1, 1, 1, 1,
-0.7172304, -1.905559, -1.407953, 1, 1, 1, 1, 1,
-0.7171435, -0.128232, -0.7959118, 1, 1, 1, 1, 1,
-0.7106769, 1.016242, -0.1874522, 1, 1, 1, 1, 1,
-0.7063862, 1.982568, 0.7719742, 1, 1, 1, 1, 1,
-0.7044178, 0.8254167, -1.312016, 1, 1, 1, 1, 1,
-0.7003754, 1.20036, -0.1994166, 1, 1, 1, 1, 1,
-0.6898193, -1.112278, -1.305612, 1, 1, 1, 1, 1,
-0.6892501, -0.6101569, -0.7621605, 1, 1, 1, 1, 1,
-0.6883763, 0.2524061, -0.6568676, 0, 0, 1, 1, 1,
-0.6876734, 0.03724704, -1.264924, 1, 0, 0, 1, 1,
-0.6810386, 0.1936491, -2.388127, 1, 0, 0, 1, 1,
-0.6767592, -0.1931789, -1.169788, 1, 0, 0, 1, 1,
-0.6703023, -0.5175627, -3.358586, 1, 0, 0, 1, 1,
-0.669197, -0.1081309, -1.286312, 1, 0, 0, 1, 1,
-0.664849, 0.004493289, -0.9616737, 0, 0, 0, 1, 1,
-0.6646295, -1.726379, -2.09278, 0, 0, 0, 1, 1,
-0.6623978, 0.8896291, -0.2982046, 0, 0, 0, 1, 1,
-0.6546115, 0.3813556, -0.7957063, 0, 0, 0, 1, 1,
-0.6486718, -0.1683381, -1.082404, 0, 0, 0, 1, 1,
-0.6480168, 1.85324, -1.470456, 0, 0, 0, 1, 1,
-0.647077, -0.9576895, -2.771517, 0, 0, 0, 1, 1,
-0.6467611, -0.5926082, -3.959579, 1, 1, 1, 1, 1,
-0.640891, -1.337008, -3.261109, 1, 1, 1, 1, 1,
-0.6383908, 0.4386437, -0.3119521, 1, 1, 1, 1, 1,
-0.6367643, -0.8606592, -2.359346, 1, 1, 1, 1, 1,
-0.6341851, 1.892343, -1.009109, 1, 1, 1, 1, 1,
-0.6314771, -0.03257009, 0.2931134, 1, 1, 1, 1, 1,
-0.6278114, -0.3396601, -1.998688, 1, 1, 1, 1, 1,
-0.6277545, -0.7345759, -3.429304, 1, 1, 1, 1, 1,
-0.6236219, 1.92216, -0.9199317, 1, 1, 1, 1, 1,
-0.6200156, 1.07297, 0.9945964, 1, 1, 1, 1, 1,
-0.6052497, -0.5261614, -3.862278, 1, 1, 1, 1, 1,
-0.6030405, 0.6232397, -0.685469, 1, 1, 1, 1, 1,
-0.6017202, 0.6638062, -0.31688, 1, 1, 1, 1, 1,
-0.6004086, -0.6372015, -1.803887, 1, 1, 1, 1, 1,
-0.5967719, -1.683996, -3.361668, 1, 1, 1, 1, 1,
-0.593034, -1.378489, -2.008185, 0, 0, 1, 1, 1,
-0.5909804, -1.23179, -2.993281, 1, 0, 0, 1, 1,
-0.5909712, -0.6784037, -1.585636, 1, 0, 0, 1, 1,
-0.5854688, -0.3460116, -0.4086564, 1, 0, 0, 1, 1,
-0.5811948, 1.741021, -0.900956, 1, 0, 0, 1, 1,
-0.579172, -0.3301874, -1.52208, 1, 0, 0, 1, 1,
-0.5759333, -0.8722454, -1.755649, 0, 0, 0, 1, 1,
-0.5733886, -0.07833496, 0.27755, 0, 0, 0, 1, 1,
-0.5663961, -0.5671631, -3.274283, 0, 0, 0, 1, 1,
-0.5618096, 1.063297, 0.1192367, 0, 0, 0, 1, 1,
-0.5568359, 0.8339794, -1.638042, 0, 0, 0, 1, 1,
-0.5531718, 0.0975363, 2.067596, 0, 0, 0, 1, 1,
-0.5477248, 1.296863, 1.532758, 0, 0, 0, 1, 1,
-0.5472926, 1.121805, -0.8965288, 1, 1, 1, 1, 1,
-0.545577, 0.7210821, -0.5790421, 1, 1, 1, 1, 1,
-0.538783, 0.8550366, 0.2219437, 1, 1, 1, 1, 1,
-0.536273, 1.233075, -2.188613, 1, 1, 1, 1, 1,
-0.5356885, 0.7119122, -0.1672674, 1, 1, 1, 1, 1,
-0.5348517, 0.2813213, -2.256205, 1, 1, 1, 1, 1,
-0.5330044, -0.1183867, -2.401496, 1, 1, 1, 1, 1,
-0.5327062, 1.448215, 0.5193107, 1, 1, 1, 1, 1,
-0.5253171, 0.2840469, -1.248792, 1, 1, 1, 1, 1,
-0.5203145, -0.1395686, -1.367498, 1, 1, 1, 1, 1,
-0.5202018, -0.4340913, -4.049091, 1, 1, 1, 1, 1,
-0.5180183, 0.3179811, -0.02875788, 1, 1, 1, 1, 1,
-0.5142252, 0.7346186, 0.695047, 1, 1, 1, 1, 1,
-0.511919, -0.5130304, -1.034183, 1, 1, 1, 1, 1,
-0.5102458, 0.5981378, 0.08692016, 1, 1, 1, 1, 1,
-0.5053356, 0.0507873, -1.154599, 0, 0, 1, 1, 1,
-0.5013909, 1.262585, -1.343235, 1, 0, 0, 1, 1,
-0.5010185, 1.654545, 0.2528137, 1, 0, 0, 1, 1,
-0.4968068, -0.3453668, -2.783888, 1, 0, 0, 1, 1,
-0.4954442, 2.398145, 1.289211, 1, 0, 0, 1, 1,
-0.4866113, -0.4315809, -1.732954, 1, 0, 0, 1, 1,
-0.4817385, -1.545792, -3.857727, 0, 0, 0, 1, 1,
-0.4804495, -0.2727365, -0.3335913, 0, 0, 0, 1, 1,
-0.4793817, 0.756406, -0.9676006, 0, 0, 0, 1, 1,
-0.4766222, -0.1907126, -3.20512, 0, 0, 0, 1, 1,
-0.4738245, 0.3725575, 0.1547083, 0, 0, 0, 1, 1,
-0.4730046, 1.123005, 0.2325972, 0, 0, 0, 1, 1,
-0.4705075, 0.004358954, 1.539532, 0, 0, 0, 1, 1,
-0.4674478, -0.8781123, -2.228602, 1, 1, 1, 1, 1,
-0.4585226, -1.425591, -3.015521, 1, 1, 1, 1, 1,
-0.4524176, 0.3561046, -2.203884, 1, 1, 1, 1, 1,
-0.4509231, 1.12591, -0.8356361, 1, 1, 1, 1, 1,
-0.4494929, 0.08561183, -2.429998, 1, 1, 1, 1, 1,
-0.4490266, 0.5011172, -1.772863, 1, 1, 1, 1, 1,
-0.4470225, 0.1652389, -0.1844453, 1, 1, 1, 1, 1,
-0.446087, 0.2185519, -1.170383, 1, 1, 1, 1, 1,
-0.4454979, 0.4225214, -0.02270567, 1, 1, 1, 1, 1,
-0.4445556, 1.635846, 0.3077207, 1, 1, 1, 1, 1,
-0.4414822, 1.127731, -0.5056345, 1, 1, 1, 1, 1,
-0.4409773, 0.6836492, 2.345514, 1, 1, 1, 1, 1,
-0.4377735, 0.01647364, 1.037288, 1, 1, 1, 1, 1,
-0.4337534, 0.1245696, -2.279494, 1, 1, 1, 1, 1,
-0.433502, 0.9416774, -1.54028, 1, 1, 1, 1, 1,
-0.428769, 0.601151, -0.8697432, 0, 0, 1, 1, 1,
-0.4258381, -0.872005, -3.216222, 1, 0, 0, 1, 1,
-0.4143739, 0.6145024, -0.07220919, 1, 0, 0, 1, 1,
-0.4097199, -0.7911936, -3.899552, 1, 0, 0, 1, 1,
-0.4093638, -0.2074719, -2.40536, 1, 0, 0, 1, 1,
-0.4074081, 0.6952167, 0.5583974, 1, 0, 0, 1, 1,
-0.4002121, -1.991234, -0.7426598, 0, 0, 0, 1, 1,
-0.3993505, 0.4091674, -1.774384, 0, 0, 0, 1, 1,
-0.3961161, -1.637246, -3.264388, 0, 0, 0, 1, 1,
-0.3951134, -0.8034387, -0.5097007, 0, 0, 0, 1, 1,
-0.3909357, 1.904509, -0.668514, 0, 0, 0, 1, 1,
-0.3904676, 0.7068478, -0.8071999, 0, 0, 0, 1, 1,
-0.3860854, -1.259403, -3.997104, 0, 0, 0, 1, 1,
-0.3813604, 1.56372, 1.172807, 1, 1, 1, 1, 1,
-0.3812826, 0.126632, -2.93293, 1, 1, 1, 1, 1,
-0.3805985, 0.9363569, 0.257322, 1, 1, 1, 1, 1,
-0.3777059, -1.527595, -2.705341, 1, 1, 1, 1, 1,
-0.3754585, -0.6298776, -1.07154, 1, 1, 1, 1, 1,
-0.3733635, 0.3578712, -0.7376595, 1, 1, 1, 1, 1,
-0.3719539, 0.677282, 0.9611486, 1, 1, 1, 1, 1,
-0.3700778, -0.478213, -3.989331, 1, 1, 1, 1, 1,
-0.3686745, -0.7689113, -3.546176, 1, 1, 1, 1, 1,
-0.3606611, -1.077957, -1.96206, 1, 1, 1, 1, 1,
-0.3586514, 0.6175004, 0.0703858, 1, 1, 1, 1, 1,
-0.3537127, 0.2625388, -1.141439, 1, 1, 1, 1, 1,
-0.3532401, -1.326421, -3.534352, 1, 1, 1, 1, 1,
-0.3513227, 0.06551228, -1.586499, 1, 1, 1, 1, 1,
-0.3456016, -1.580418, -2.639713, 1, 1, 1, 1, 1,
-0.3419821, -0.7104179, -3.088439, 0, 0, 1, 1, 1,
-0.3403532, 0.1917345, -1.637775, 1, 0, 0, 1, 1,
-0.3397762, -0.6188443, -0.7525324, 1, 0, 0, 1, 1,
-0.3381519, -0.05583994, -1.140374, 1, 0, 0, 1, 1,
-0.3351447, 0.7712062, -0.4067131, 1, 0, 0, 1, 1,
-0.3336477, -1.153997, -2.211364, 1, 0, 0, 1, 1,
-0.3334962, -0.1789949, -0.6312057, 0, 0, 0, 1, 1,
-0.3327444, 0.3618438, 0.7613207, 0, 0, 0, 1, 1,
-0.3262799, 2.334932, 0.8356104, 0, 0, 0, 1, 1,
-0.3240349, 1.828631, 0.2506471, 0, 0, 0, 1, 1,
-0.3236923, -1.601906, -2.783708, 0, 0, 0, 1, 1,
-0.3206835, 0.7090089, -1.607266, 0, 0, 0, 1, 1,
-0.312892, -0.9182484, -2.546184, 0, 0, 0, 1, 1,
-0.3123555, 1.523654, 0.192302, 1, 1, 1, 1, 1,
-0.3121064, 1.071846, 0.8161621, 1, 1, 1, 1, 1,
-0.3094013, -1.485644, -2.985247, 1, 1, 1, 1, 1,
-0.302721, -1.164219, -2.582606, 1, 1, 1, 1, 1,
-0.3019243, 0.663278, 0.3404371, 1, 1, 1, 1, 1,
-0.3011051, 0.2596014, -0.3521114, 1, 1, 1, 1, 1,
-0.3009371, 0.08377104, -1.208776, 1, 1, 1, 1, 1,
-0.2982447, -0.6451876, -2.580269, 1, 1, 1, 1, 1,
-0.2960139, -1.408945, -3.965054, 1, 1, 1, 1, 1,
-0.2956584, 0.1634818, -0.6384395, 1, 1, 1, 1, 1,
-0.2950299, -0.3187561, -2.50074, 1, 1, 1, 1, 1,
-0.2936596, 0.2775439, -2.397087, 1, 1, 1, 1, 1,
-0.2884353, -0.2315485, -3.465929, 1, 1, 1, 1, 1,
-0.2854849, -0.7181132, -1.742331, 1, 1, 1, 1, 1,
-0.2850518, -1.809853, -2.916491, 1, 1, 1, 1, 1,
-0.2837118, -1.15157, -3.435841, 0, 0, 1, 1, 1,
-0.2782536, -0.9161637, -2.833726, 1, 0, 0, 1, 1,
-0.2778811, -0.5338621, -2.909169, 1, 0, 0, 1, 1,
-0.2774094, -0.6205642, -0.6833132, 1, 0, 0, 1, 1,
-0.2703065, 0.6284854, -0.08005451, 1, 0, 0, 1, 1,
-0.2650313, 0.3678526, 0.0393789, 1, 0, 0, 1, 1,
-0.2623332, -1.487604, -3.982621, 0, 0, 0, 1, 1,
-0.2607259, -0.3139769, -0.9956688, 0, 0, 0, 1, 1,
-0.2582654, 0.5377914, -1.778773, 0, 0, 0, 1, 1,
-0.2557041, 0.6962695, 0.1358959, 0, 0, 0, 1, 1,
-0.2550777, -1.746871, -3.183098, 0, 0, 0, 1, 1,
-0.2547069, -0.4062583, -1.464084, 0, 0, 0, 1, 1,
-0.2490105, 0.1026146, -1.53161, 0, 0, 0, 1, 1,
-0.2488503, 1.400126, -0.648384, 1, 1, 1, 1, 1,
-0.2482322, -0.6599412, -3.165602, 1, 1, 1, 1, 1,
-0.2480611, -0.13835, -4.04795, 1, 1, 1, 1, 1,
-0.2476399, -0.3801822, -2.253208, 1, 1, 1, 1, 1,
-0.2469317, -0.03932824, -3.378046, 1, 1, 1, 1, 1,
-0.2457687, 0.816589, 0.589544, 1, 1, 1, 1, 1,
-0.2456104, -1.202732, -2.923823, 1, 1, 1, 1, 1,
-0.2396534, 0.5162823, -0.9524424, 1, 1, 1, 1, 1,
-0.2253971, 0.3831815, -1.143501, 1, 1, 1, 1, 1,
-0.2250732, 0.6002887, 0.2756088, 1, 1, 1, 1, 1,
-0.2207162, -2.800348, -4.12155, 1, 1, 1, 1, 1,
-0.2170576, -0.3592066, -1.922515, 1, 1, 1, 1, 1,
-0.2142582, -1.416544, -3.599382, 1, 1, 1, 1, 1,
-0.2118558, 0.3973957, -0.2862153, 1, 1, 1, 1, 1,
-0.2117469, -1.29596, -3.049504, 1, 1, 1, 1, 1,
-0.2096921, -0.3779957, -2.854688, 0, 0, 1, 1, 1,
-0.2085801, -0.1575956, 0.05689075, 1, 0, 0, 1, 1,
-0.2048566, 0.5737527, -1.310901, 1, 0, 0, 1, 1,
-0.2031221, -0.5207555, -1.967624, 1, 0, 0, 1, 1,
-0.1980541, -0.7395489, -2.607466, 1, 0, 0, 1, 1,
-0.1965919, -1.252872, -3.211042, 1, 0, 0, 1, 1,
-0.1962607, 0.3268937, -0.8571049, 0, 0, 0, 1, 1,
-0.1929311, -0.9725972, -3.138362, 0, 0, 0, 1, 1,
-0.1928691, 0.3290861, -1.350757, 0, 0, 0, 1, 1,
-0.1918192, 1.287376, 0.944236, 0, 0, 0, 1, 1,
-0.1916323, -0.3417545, -3.311408, 0, 0, 0, 1, 1,
-0.1915853, 1.170145, 1.317066, 0, 0, 0, 1, 1,
-0.1903017, -0.06791014, -1.895717, 0, 0, 0, 1, 1,
-0.1787732, -0.8266807, -3.421004, 1, 1, 1, 1, 1,
-0.1764076, 1.241286, -1.194623, 1, 1, 1, 1, 1,
-0.1760798, 0.4196121, 0.1451134, 1, 1, 1, 1, 1,
-0.1760519, -0.5696221, -1.600435, 1, 1, 1, 1, 1,
-0.174593, -1.840041, -3.663382, 1, 1, 1, 1, 1,
-0.1711813, 0.9617618, 0.7611896, 1, 1, 1, 1, 1,
-0.1707698, -0.9587765, -2.704209, 1, 1, 1, 1, 1,
-0.1705855, -0.4734985, -3.95885, 1, 1, 1, 1, 1,
-0.1663833, -0.07876413, -2.166129, 1, 1, 1, 1, 1,
-0.1659189, -0.2542878, -2.515047, 1, 1, 1, 1, 1,
-0.1621265, -0.3416516, -3.757215, 1, 1, 1, 1, 1,
-0.1612147, -0.4122011, -2.585765, 1, 1, 1, 1, 1,
-0.1610747, -0.7049808, -1.279633, 1, 1, 1, 1, 1,
-0.1571835, 0.2020832, -0.4804872, 1, 1, 1, 1, 1,
-0.1550288, 0.3209274, -1.566307, 1, 1, 1, 1, 1,
-0.1508361, -0.564328, -3.253534, 0, 0, 1, 1, 1,
-0.1500358, 1.269664, -0.9887398, 1, 0, 0, 1, 1,
-0.1489127, -0.8168092, -3.069405, 1, 0, 0, 1, 1,
-0.1382667, -0.03716707, -3.05093, 1, 0, 0, 1, 1,
-0.1369073, 0.3128046, 0.5688533, 1, 0, 0, 1, 1,
-0.1351625, 0.9660897, -0.6286151, 1, 0, 0, 1, 1,
-0.1313863, -0.0004519747, -0.4321922, 0, 0, 0, 1, 1,
-0.1292714, -0.5209167, -1.980108, 0, 0, 0, 1, 1,
-0.1286599, 0.3376316, -1.184677, 0, 0, 0, 1, 1,
-0.1226478, 1.079046, 0.2648526, 0, 0, 0, 1, 1,
-0.1215213, 0.3334691, 0.7609659, 0, 0, 0, 1, 1,
-0.1199274, 0.7199585, 1.905958, 0, 0, 0, 1, 1,
-0.1195978, -0.5588313, -1.733168, 0, 0, 0, 1, 1,
-0.1147897, -1.035827, -2.010762, 1, 1, 1, 1, 1,
-0.1141507, -1.997972, -4.598275, 1, 1, 1, 1, 1,
-0.1120822, 1.00967, -0.5603299, 1, 1, 1, 1, 1,
-0.1117504, 0.7704966, 0.1206795, 1, 1, 1, 1, 1,
-0.1107011, 0.1440925, -2.155859, 1, 1, 1, 1, 1,
-0.110561, -0.1321254, -3.000068, 1, 1, 1, 1, 1,
-0.1099719, 1.211308, 0.9868305, 1, 1, 1, 1, 1,
-0.1098858, -0.1623156, -2.24553, 1, 1, 1, 1, 1,
-0.1084027, -0.801755, -3.425212, 1, 1, 1, 1, 1,
-0.108064, -0.2483324, -3.114348, 1, 1, 1, 1, 1,
-0.1068271, 0.9988569, 1.402476, 1, 1, 1, 1, 1,
-0.1064586, -0.2270089, -2.925102, 1, 1, 1, 1, 1,
-0.1023443, 0.331658, -1.154019, 1, 1, 1, 1, 1,
-0.100092, 0.0430496, 0.605919, 1, 1, 1, 1, 1,
-0.09923086, 1.273777, -0.6761225, 1, 1, 1, 1, 1,
-0.09711582, -0.2921517, -3.202655, 0, 0, 1, 1, 1,
-0.09057566, 1.884007, 0.8644297, 1, 0, 0, 1, 1,
-0.08890899, -1.542009, -0.978509, 1, 0, 0, 1, 1,
-0.088272, -0.8949319, -3.675346, 1, 0, 0, 1, 1,
-0.07216943, -0.4009264, -3.044145, 1, 0, 0, 1, 1,
-0.06559878, -1.234731, -4.508237, 1, 0, 0, 1, 1,
-0.06465783, 0.441976, 2.837945, 0, 0, 0, 1, 1,
-0.05943456, 0.5305607, -0.6223134, 0, 0, 0, 1, 1,
-0.05585585, -0.1954802, -3.142296, 0, 0, 0, 1, 1,
-0.0535322, -0.9042441, -1.852911, 0, 0, 0, 1, 1,
-0.052485, 0.3465347, -0.9718772, 0, 0, 0, 1, 1,
-0.04925627, 0.0517846, -2.12687, 0, 0, 0, 1, 1,
-0.04826549, -0.6753351, -3.024062, 0, 0, 0, 1, 1,
-0.04355703, 0.21774, 0.5380636, 1, 1, 1, 1, 1,
-0.03867275, 1.30197, -0.839934, 1, 1, 1, 1, 1,
-0.0385871, -0.9852324, -1.990432, 1, 1, 1, 1, 1,
-0.03690446, 1.005516, 1.928525, 1, 1, 1, 1, 1,
-0.0335326, -0.8367593, -3.496827, 1, 1, 1, 1, 1,
-0.03255589, 0.03350935, -0.01898951, 1, 1, 1, 1, 1,
-0.03052992, -1.234747, -3.72854, 1, 1, 1, 1, 1,
-0.02905359, -1.207061, -3.604167, 1, 1, 1, 1, 1,
-0.02802338, -0.3686813, -1.943254, 1, 1, 1, 1, 1,
-0.02701365, -1.021913, -3.10732, 1, 1, 1, 1, 1,
-0.02498685, -0.6324019, -3.198309, 1, 1, 1, 1, 1,
-0.02439912, 0.2485629, 2.388712, 1, 1, 1, 1, 1,
-0.02279963, 1.852811, -0.2249138, 1, 1, 1, 1, 1,
-0.02031114, -0.1248813, -2.403282, 1, 1, 1, 1, 1,
-0.01799485, -0.7504674, -2.998053, 1, 1, 1, 1, 1,
-0.01623136, -0.4761429, -1.870912, 0, 0, 1, 1, 1,
-0.01390006, -0.1092721, -4.479041, 1, 0, 0, 1, 1,
-0.01290534, -0.7337959, -3.432907, 1, 0, 0, 1, 1,
-0.0111497, 0.677393, -0.06419172, 1, 0, 0, 1, 1,
-0.009210918, -1.584631, -4.085613, 1, 0, 0, 1, 1,
-0.005815837, 0.4613015, 0.5518969, 1, 0, 0, 1, 1,
-0.005689834, 0.01621771, -0.722666, 0, 0, 0, 1, 1,
-0.005607536, -0.4706376, -2.588825, 0, 0, 0, 1, 1,
-0.003098297, -1.004948, -2.268176, 0, 0, 0, 1, 1,
-0.002269852, -1.729793, -3.067879, 0, 0, 0, 1, 1,
-0.0007216624, -0.08287461, -3.34303, 0, 0, 0, 1, 1,
-0.0002256774, -0.594484, -2.614442, 0, 0, 0, 1, 1,
0.001588199, 0.4780906, -0.8070221, 0, 0, 0, 1, 1,
0.002596253, 0.2102003, 0.2014612, 1, 1, 1, 1, 1,
0.002877432, 1.603427, -1.94812, 1, 1, 1, 1, 1,
0.006661639, 0.1337185, -0.4287724, 1, 1, 1, 1, 1,
0.009705041, 0.456474, 0.9992894, 1, 1, 1, 1, 1,
0.01074319, 1.103688, 0.4104889, 1, 1, 1, 1, 1,
0.01448179, -1.682386, 2.670738, 1, 1, 1, 1, 1,
0.01543878, 0.2845665, -0.7073408, 1, 1, 1, 1, 1,
0.0176849, 0.02097765, 2.086895, 1, 1, 1, 1, 1,
0.01831371, -1.694678, 3.960082, 1, 1, 1, 1, 1,
0.01866257, -1.261605, 2.796107, 1, 1, 1, 1, 1,
0.01982214, -1.135338, 5.037523, 1, 1, 1, 1, 1,
0.02355096, -0.5924771, 2.536421, 1, 1, 1, 1, 1,
0.02527658, -1.328804, 3.146417, 1, 1, 1, 1, 1,
0.02577026, -1.658524, 2.651961, 1, 1, 1, 1, 1,
0.02782895, -0.7935803, 3.476483, 1, 1, 1, 1, 1,
0.02828183, -1.002944, 3.069785, 0, 0, 1, 1, 1,
0.0312829, -0.3660413, 2.884432, 1, 0, 0, 1, 1,
0.03324558, 0.1559311, -1.160124, 1, 0, 0, 1, 1,
0.03946802, 1.812726, -0.9944127, 1, 0, 0, 1, 1,
0.0410965, -0.9378775, 2.414514, 1, 0, 0, 1, 1,
0.04398198, -0.5008558, 0.9104653, 1, 0, 0, 1, 1,
0.04435663, -0.02709298, 1.898532, 0, 0, 0, 1, 1,
0.04775112, 0.5826129, 0.09844093, 0, 0, 0, 1, 1,
0.04895321, 0.4575441, 1.107842, 0, 0, 0, 1, 1,
0.05505222, 0.7674883, 1.544217, 0, 0, 0, 1, 1,
0.05707072, -0.02630937, 2.798973, 0, 0, 0, 1, 1,
0.05731726, 0.623561, -0.1240082, 0, 0, 0, 1, 1,
0.05987385, -1.336751, 1.855516, 0, 0, 0, 1, 1,
0.06056713, -0.6805657, 3.172728, 1, 1, 1, 1, 1,
0.06531157, 0.3629661, 0.9965016, 1, 1, 1, 1, 1,
0.06535509, -0.2751286, 1.121388, 1, 1, 1, 1, 1,
0.08026757, 0.8792136, 0.485193, 1, 1, 1, 1, 1,
0.08326574, -0.06292107, 3.683064, 1, 1, 1, 1, 1,
0.08340002, 0.6037315, -1.341982, 1, 1, 1, 1, 1,
0.08394306, 0.01383008, 0.6042699, 1, 1, 1, 1, 1,
0.08594211, -1.651211, 2.584309, 1, 1, 1, 1, 1,
0.09101892, -1.007906, 3.954307, 1, 1, 1, 1, 1,
0.09235578, 0.2448378, 0.9652414, 1, 1, 1, 1, 1,
0.09268126, 0.3745937, -1.657155, 1, 1, 1, 1, 1,
0.09292642, -0.4245954, 1.991524, 1, 1, 1, 1, 1,
0.098814, 1.07052, 1.214918, 1, 1, 1, 1, 1,
0.09947508, 0.04955287, 0.8278341, 1, 1, 1, 1, 1,
0.1003169, -0.16216, 3.520844, 1, 1, 1, 1, 1,
0.1009814, 0.4656095, -0.1299153, 0, 0, 1, 1, 1,
0.1024403, 0.3164005, 0.8303595, 1, 0, 0, 1, 1,
0.1038923, -0.01134574, 0.4437738, 1, 0, 0, 1, 1,
0.1046783, -0.03452, 2.600433, 1, 0, 0, 1, 1,
0.1054725, 1.523533, -0.8706396, 1, 0, 0, 1, 1,
0.1066017, -0.5235953, 4.103014, 1, 0, 0, 1, 1,
0.1129317, -0.537634, 1.852512, 0, 0, 0, 1, 1,
0.1157152, -0.144402, 2.655223, 0, 0, 0, 1, 1,
0.1260712, 0.5666679, 0.2186471, 0, 0, 0, 1, 1,
0.1283157, 1.134832, 1.646966, 0, 0, 0, 1, 1,
0.1300097, 1.61617, 0.2693487, 0, 0, 0, 1, 1,
0.1302506, 1.238634, -1.716269, 0, 0, 0, 1, 1,
0.1329878, -0.3303796, 1.551458, 0, 0, 0, 1, 1,
0.1344, 0.3224703, 0.4451948, 1, 1, 1, 1, 1,
0.1392894, 0.8316336, -0.9325436, 1, 1, 1, 1, 1,
0.1439763, -0.001103107, 0.6902459, 1, 1, 1, 1, 1,
0.1463137, 1.241335, -1.340179, 1, 1, 1, 1, 1,
0.1475152, -2.099112, 2.380676, 1, 1, 1, 1, 1,
0.1516659, -0.04031412, 0.630568, 1, 1, 1, 1, 1,
0.1518074, -0.3336216, 2.969299, 1, 1, 1, 1, 1,
0.153076, 0.3155291, 2.535321, 1, 1, 1, 1, 1,
0.1553539, 1.294082, 0.4703237, 1, 1, 1, 1, 1,
0.1556691, -0.6333156, 3.188999, 1, 1, 1, 1, 1,
0.1557308, -0.007856796, 1.604728, 1, 1, 1, 1, 1,
0.1568007, 0.1717006, 1.09611, 1, 1, 1, 1, 1,
0.1573434, 0.1360601, 0.5254285, 1, 1, 1, 1, 1,
0.1588988, -1.005635, 4.39444, 1, 1, 1, 1, 1,
0.1591873, -0.8639556, 1.263546, 1, 1, 1, 1, 1,
0.1593048, 0.04803052, 2.553697, 0, 0, 1, 1, 1,
0.1610682, -0.5017684, 3.24631, 1, 0, 0, 1, 1,
0.16234, 0.01088058, 3.867746, 1, 0, 0, 1, 1,
0.1657347, -0.6245206, 2.633248, 1, 0, 0, 1, 1,
0.165741, 0.6018539, -0.1945304, 1, 0, 0, 1, 1,
0.1690297, -1.159378, 2.689314, 1, 0, 0, 1, 1,
0.1726902, 0.7313397, 0.826571, 0, 0, 0, 1, 1,
0.1743766, -0.615512, 4.890698, 0, 0, 0, 1, 1,
0.1777673, 0.4261991, 1.096556, 0, 0, 0, 1, 1,
0.1793932, 0.7931134, -0.01157649, 0, 0, 0, 1, 1,
0.1879443, -2.988659, 2.076955, 0, 0, 0, 1, 1,
0.1896881, -0.872763, 1.457647, 0, 0, 0, 1, 1,
0.1960409, 0.2681737, 1.498815, 0, 0, 0, 1, 1,
0.196987, 0.3746759, 0.693675, 1, 1, 1, 1, 1,
0.1996513, -0.468989, 2.704432, 1, 1, 1, 1, 1,
0.2026251, 1.109421, -0.3083672, 1, 1, 1, 1, 1,
0.2039753, -0.1656742, 0.1032276, 1, 1, 1, 1, 1,
0.2055271, -2.663086, 2.516169, 1, 1, 1, 1, 1,
0.2088195, 0.3018959, 1.299879, 1, 1, 1, 1, 1,
0.2090632, 0.1883172, 1.536393, 1, 1, 1, 1, 1,
0.2109898, 0.9323442, 0.262631, 1, 1, 1, 1, 1,
0.2118468, 0.6679469, 0.239402, 1, 1, 1, 1, 1,
0.2192497, 0.5506276, 1.132692, 1, 1, 1, 1, 1,
0.2202041, 0.1390796, 0.7882456, 1, 1, 1, 1, 1,
0.2202839, -0.8207229, 1.967682, 1, 1, 1, 1, 1,
0.22206, 0.7595888, -0.6730562, 1, 1, 1, 1, 1,
0.2273111, 0.9288667, 0.7481859, 1, 1, 1, 1, 1,
0.2273828, -0.3700078, -0.07750177, 1, 1, 1, 1, 1,
0.2321639, -1.097999, 1.251498, 0, 0, 1, 1, 1,
0.2340302, -1.053569, 2.147428, 1, 0, 0, 1, 1,
0.2346463, -0.139764, 1.283229, 1, 0, 0, 1, 1,
0.2378696, -0.8643661, 1.65439, 1, 0, 0, 1, 1,
0.238316, -0.3223524, 1.439574, 1, 0, 0, 1, 1,
0.243599, -2.504009, 4.445997, 1, 0, 0, 1, 1,
0.2455618, 1.487249, 0.5821552, 0, 0, 0, 1, 1,
0.2546331, 0.3650278, -1.549225, 0, 0, 0, 1, 1,
0.2561305, 0.4291614, -0.2429243, 0, 0, 0, 1, 1,
0.2594349, 0.8521781, 0.5624612, 0, 0, 0, 1, 1,
0.2664284, -0.3606245, 6.22824, 0, 0, 0, 1, 1,
0.2673533, 0.6149676, 0.6826221, 0, 0, 0, 1, 1,
0.2723636, -0.1969471, 2.908504, 0, 0, 0, 1, 1,
0.2775929, -0.8938791, 2.892024, 1, 1, 1, 1, 1,
0.2828088, 0.8940387, 1.03258, 1, 1, 1, 1, 1,
0.2871146, 0.8886757, -0.0442177, 1, 1, 1, 1, 1,
0.2888978, 0.03099309, 1.070086, 1, 1, 1, 1, 1,
0.2953047, -0.128054, 0.5139837, 1, 1, 1, 1, 1,
0.2956386, 1.897038, 0.01415089, 1, 1, 1, 1, 1,
0.2980781, -1.232396, 2.158653, 1, 1, 1, 1, 1,
0.2984959, -1.016714, 0.863399, 1, 1, 1, 1, 1,
0.3008354, 0.5503632, 1.676833, 1, 1, 1, 1, 1,
0.3010948, 1.386699, 1.333442, 1, 1, 1, 1, 1,
0.3061937, 0.2219902, 1.701445, 1, 1, 1, 1, 1,
0.3091345, 0.1647638, 1.389638, 1, 1, 1, 1, 1,
0.3092623, 1.080682, 1.597968, 1, 1, 1, 1, 1,
0.3114446, -0.3433049, 1.05177, 1, 1, 1, 1, 1,
0.3135322, -0.1942572, 0.9503518, 1, 1, 1, 1, 1,
0.3140395, -0.6913484, 1.116895, 0, 0, 1, 1, 1,
0.3148194, 0.9323348, -0.008146755, 1, 0, 0, 1, 1,
0.3159495, 0.05056793, 2.488008, 1, 0, 0, 1, 1,
0.3245627, 0.4875048, -0.1705868, 1, 0, 0, 1, 1,
0.3251242, 0.1754353, 1.962181, 1, 0, 0, 1, 1,
0.326691, -0.7514727, 3.114171, 1, 0, 0, 1, 1,
0.3292759, 0.526262, 1.612714, 0, 0, 0, 1, 1,
0.3303561, -1.322366, 1.424481, 0, 0, 0, 1, 1,
0.3312112, 0.9904801, 1.735507, 0, 0, 0, 1, 1,
0.3348351, -0.5745041, 2.354241, 0, 0, 0, 1, 1,
0.3392175, 0.2388288, 2.104759, 0, 0, 0, 1, 1,
0.3428966, -0.244941, 2.810156, 0, 0, 0, 1, 1,
0.3431723, -0.47294, 3.681987, 0, 0, 0, 1, 1,
0.3456498, -1.124743, 2.721433, 1, 1, 1, 1, 1,
0.3477398, -3.099318, 2.508255, 1, 1, 1, 1, 1,
0.3479255, 1.016053, -0.0004181524, 1, 1, 1, 1, 1,
0.3490689, -0.1034969, 2.749771, 1, 1, 1, 1, 1,
0.3492733, -0.1772601, 2.150795, 1, 1, 1, 1, 1,
0.3505447, -0.2511849, 2.217596, 1, 1, 1, 1, 1,
0.3560837, 0.3107881, -0.6082472, 1, 1, 1, 1, 1,
0.3587636, 0.8436348, 0.1578863, 1, 1, 1, 1, 1,
0.3598337, 0.06971198, 1.448724, 1, 1, 1, 1, 1,
0.3617156, 0.3853598, -0.2197234, 1, 1, 1, 1, 1,
0.3622416, 0.2240133, -0.3826596, 1, 1, 1, 1, 1,
0.3655464, -0.4442092, 2.710481, 1, 1, 1, 1, 1,
0.3658141, -0.844304, 1.870944, 1, 1, 1, 1, 1,
0.3692693, -1.00664, 2.946222, 1, 1, 1, 1, 1,
0.3719241, -0.9987415, 3.280905, 1, 1, 1, 1, 1,
0.3720422, -0.8145673, 2.793728, 0, 0, 1, 1, 1,
0.3757572, 0.1504239, 0.448474, 1, 0, 0, 1, 1,
0.3771944, 0.6231411, -0.2372736, 1, 0, 0, 1, 1,
0.380519, -0.2468376, 2.568993, 1, 0, 0, 1, 1,
0.3837021, 0.5838075, 0.8465183, 1, 0, 0, 1, 1,
0.3842119, 1.171069, 0.8180819, 1, 0, 0, 1, 1,
0.3843738, 1.755813, 0.1202082, 0, 0, 0, 1, 1,
0.3898385, -0.3237745, 2.841185, 0, 0, 0, 1, 1,
0.3899001, -1.238491, 3.770913, 0, 0, 0, 1, 1,
0.3902257, 0.934728, 2.004833, 0, 0, 0, 1, 1,
0.391093, 1.980485, -0.6360816, 0, 0, 0, 1, 1,
0.4000947, -1.242734, 2.390254, 0, 0, 0, 1, 1,
0.4012749, 1.074741, 2.00394, 0, 0, 0, 1, 1,
0.4043165, 0.1758339, 1.223731, 1, 1, 1, 1, 1,
0.4152773, -0.1953535, 2.329917, 1, 1, 1, 1, 1,
0.4176704, 0.3110708, -0.8883514, 1, 1, 1, 1, 1,
0.4253561, -0.1123474, 2.167454, 1, 1, 1, 1, 1,
0.4330574, -0.2791984, 2.049795, 1, 1, 1, 1, 1,
0.4351235, -0.663914, 2.688951, 1, 1, 1, 1, 1,
0.43636, 0.4434479, 1.393392, 1, 1, 1, 1, 1,
0.437496, -0.2509495, 1.800695, 1, 1, 1, 1, 1,
0.4404871, -0.4122128, -0.8225581, 1, 1, 1, 1, 1,
0.4428297, 0.9464443, -0.5024608, 1, 1, 1, 1, 1,
0.4460756, 0.5025025, 1.796361, 1, 1, 1, 1, 1,
0.4463049, 0.3533619, 0.7099809, 1, 1, 1, 1, 1,
0.4473649, -0.06789844, -0.5450222, 1, 1, 1, 1, 1,
0.4517266, 0.4477956, -1.052903, 1, 1, 1, 1, 1,
0.4539787, -0.8923168, 2.712458, 1, 1, 1, 1, 1,
0.4563108, -2.32572, 4.590811, 0, 0, 1, 1, 1,
0.4583925, 2.221615, -1.286938, 1, 0, 0, 1, 1,
0.4605412, 1.802724, -1.133329, 1, 0, 0, 1, 1,
0.4606733, -1.427364, 2.669836, 1, 0, 0, 1, 1,
0.4621164, 0.01846293, 2.489798, 1, 0, 0, 1, 1,
0.4635848, 1.499707, -0.03922157, 1, 0, 0, 1, 1,
0.4642885, -0.5075321, 2.14917, 0, 0, 0, 1, 1,
0.4654348, -0.4659717, 2.803043, 0, 0, 0, 1, 1,
0.4659459, 1.202926, 0.5424262, 0, 0, 0, 1, 1,
0.4668623, 0.1542075, 2.436704, 0, 0, 0, 1, 1,
0.469411, 1.868752, 0.3203085, 0, 0, 0, 1, 1,
0.4714108, -0.09649555, 2.626783, 0, 0, 0, 1, 1,
0.472217, 0.3251753, 1.60974, 0, 0, 0, 1, 1,
0.4743263, 1.715729, 1.681825, 1, 1, 1, 1, 1,
0.4754697, 0.9242843, -0.1691668, 1, 1, 1, 1, 1,
0.4754992, 1.692246, 1.550387, 1, 1, 1, 1, 1,
0.4790006, -0.4744688, 1.83201, 1, 1, 1, 1, 1,
0.4853907, 0.006949914, 0.9129779, 1, 1, 1, 1, 1,
0.4857174, 1.253538, -0.275068, 1, 1, 1, 1, 1,
0.4868306, 0.2692925, 1.933283, 1, 1, 1, 1, 1,
0.4878933, 0.4121925, 0.9636069, 1, 1, 1, 1, 1,
0.4998902, -0.06872808, 4.030611, 1, 1, 1, 1, 1,
0.5051236, -0.317916, 4.441732, 1, 1, 1, 1, 1,
0.5098755, -0.293229, 3.054555, 1, 1, 1, 1, 1,
0.511422, -2.033993, 1.700439, 1, 1, 1, 1, 1,
0.5186138, 0.8652355, 0.0766262, 1, 1, 1, 1, 1,
0.5219361, 1.48488, 1.249766, 1, 1, 1, 1, 1,
0.5261285, -0.09925275, 1.331375, 1, 1, 1, 1, 1,
0.5288118, 0.5353401, 1.477868, 0, 0, 1, 1, 1,
0.5302943, -1.107147, 2.527994, 1, 0, 0, 1, 1,
0.5335709, -1.882736, 3.133873, 1, 0, 0, 1, 1,
0.5411258, -0.3950615, 2.300499, 1, 0, 0, 1, 1,
0.5436182, 1.485585, 1.003164, 1, 0, 0, 1, 1,
0.5443829, -0.3164433, 2.600763, 1, 0, 0, 1, 1,
0.5460823, 1.010846, -0.3777067, 0, 0, 0, 1, 1,
0.5571792, 0.5585328, 1.085056, 0, 0, 0, 1, 1,
0.5572223, -1.008475, 3.20104, 0, 0, 0, 1, 1,
0.5589243, -1.255244, 3.852433, 0, 0, 0, 1, 1,
0.5589477, 0.3749551, 0.6036465, 0, 0, 0, 1, 1,
0.5648903, 1.110537, -1.654322, 0, 0, 0, 1, 1,
0.5672773, 0.07514492, 0.8952021, 0, 0, 0, 1, 1,
0.5714448, 0.1201069, 2.109518, 1, 1, 1, 1, 1,
0.5746573, 0.2164699, 2.513764, 1, 1, 1, 1, 1,
0.5817555, -1.011672, 2.96635, 1, 1, 1, 1, 1,
0.584818, 1.058583, -0.08297469, 1, 1, 1, 1, 1,
0.5853333, 0.3625738, 0.6275765, 1, 1, 1, 1, 1,
0.5902938, -1.557582, 2.284512, 1, 1, 1, 1, 1,
0.5918193, -0.8742096, 3.42166, 1, 1, 1, 1, 1,
0.5928975, -1.474936, 3.355033, 1, 1, 1, 1, 1,
0.593196, -0.438412, 2.018188, 1, 1, 1, 1, 1,
0.6145759, -0.02313117, 5.271672, 1, 1, 1, 1, 1,
0.6152218, 0.3037827, 0.7600637, 1, 1, 1, 1, 1,
0.6177447, -0.08490855, 2.146751, 1, 1, 1, 1, 1,
0.6183351, 0.7141745, -0.4041833, 1, 1, 1, 1, 1,
0.6233854, -0.08398969, 1.698934, 1, 1, 1, 1, 1,
0.6235322, 1.05387, 0.4214128, 1, 1, 1, 1, 1,
0.6361704, 1.207173, 0.4304905, 0, 0, 1, 1, 1,
0.6375704, 0.8975577, 0.5688961, 1, 0, 0, 1, 1,
0.6419984, -0.2943732, 1.291082, 1, 0, 0, 1, 1,
0.6432755, -0.5717472, 0.8917738, 1, 0, 0, 1, 1,
0.6438776, 1.848136, 0.1933424, 1, 0, 0, 1, 1,
0.6503658, 0.3342531, 1.863106, 1, 0, 0, 1, 1,
0.6553912, 0.5496153, -0.1875375, 0, 0, 0, 1, 1,
0.655946, -0.09258174, 1.816377, 0, 0, 0, 1, 1,
0.6567779, -0.887145, 2.711946, 0, 0, 0, 1, 1,
0.6603907, -0.720396, 1.118568, 0, 0, 0, 1, 1,
0.6629843, -1.046218, 1.642383, 0, 0, 0, 1, 1,
0.6733445, -0.1044421, -0.1750994, 0, 0, 0, 1, 1,
0.6800671, -0.3839656, 2.293706, 0, 0, 0, 1, 1,
0.6805555, 0.6715698, -0.06933483, 1, 1, 1, 1, 1,
0.6864285, 0.1253776, 2.235233, 1, 1, 1, 1, 1,
0.6877355, 0.40555, 0.8689324, 1, 1, 1, 1, 1,
0.6884773, -0.03374861, 1.93172, 1, 1, 1, 1, 1,
0.6892896, -1.972316, 4.418544, 1, 1, 1, 1, 1,
0.6933585, -0.218166, 3.330142, 1, 1, 1, 1, 1,
0.6977131, 0.8220474, 0.05160524, 1, 1, 1, 1, 1,
0.7049628, -0.82765, 4.23552, 1, 1, 1, 1, 1,
0.7103595, 0.8053815, 0.574509, 1, 1, 1, 1, 1,
0.711478, 1.038326, -0.3457529, 1, 1, 1, 1, 1,
0.7134291, 1.096617, -0.04921953, 1, 1, 1, 1, 1,
0.7203743, 1.516872, 1.08821, 1, 1, 1, 1, 1,
0.7304643, -2.639055, 1.68283, 1, 1, 1, 1, 1,
0.7396951, 1.490551, 0.6731822, 1, 1, 1, 1, 1,
0.7404428, -0.0831448, 2.28018, 1, 1, 1, 1, 1,
0.76288, 1.144637, -0.3164758, 0, 0, 1, 1, 1,
0.764266, -0.1624485, 0.9784048, 1, 0, 0, 1, 1,
0.765637, -0.6363087, 2.026518, 1, 0, 0, 1, 1,
0.7673246, 0.5157861, 1.05983, 1, 0, 0, 1, 1,
0.76801, 0.0558566, 0.8304501, 1, 0, 0, 1, 1,
0.7687163, -0.02495541, 1.617468, 1, 0, 0, 1, 1,
0.7719525, -1.418853, 4.343257, 0, 0, 0, 1, 1,
0.7732899, 2.228643, -1.112929, 0, 0, 0, 1, 1,
0.774042, -0.1389806, 2.928232, 0, 0, 0, 1, 1,
0.7754613, 2.632708, -0.06960285, 0, 0, 0, 1, 1,
0.7818115, 1.095603, 0.2383175, 0, 0, 0, 1, 1,
0.8030375, -0.5297881, 1.962214, 0, 0, 0, 1, 1,
0.8125158, -0.3752878, 2.67988, 0, 0, 0, 1, 1,
0.8193136, 0.4121521, -1.182367, 1, 1, 1, 1, 1,
0.819391, 1.277011, 2.432327, 1, 1, 1, 1, 1,
0.8203589, -1.702051, 2.830808, 1, 1, 1, 1, 1,
0.8224184, -0.9360682, 2.077684, 1, 1, 1, 1, 1,
0.8235095, 0.7779201, 0.1447448, 1, 1, 1, 1, 1,
0.8343272, 0.2434619, -0.8206618, 1, 1, 1, 1, 1,
0.8355856, 0.7295558, 1.527473, 1, 1, 1, 1, 1,
0.8371716, 1.207241, 1.037623, 1, 1, 1, 1, 1,
0.8406887, 0.8547577, -0.7527606, 1, 1, 1, 1, 1,
0.8577585, 0.5799506, 0.8376902, 1, 1, 1, 1, 1,
0.8578005, 2.456378, -1.186393, 1, 1, 1, 1, 1,
0.8589432, 1.669844, 1.21738, 1, 1, 1, 1, 1,
0.8596976, 0.1246627, 2.885487, 1, 1, 1, 1, 1,
0.8628308, 1.475604, 1.93525, 1, 1, 1, 1, 1,
0.8642942, -0.9806397, 4.105476, 1, 1, 1, 1, 1,
0.8656209, 0.3503631, 2.37584, 0, 0, 1, 1, 1,
0.8663805, 0.3410973, 0.9856182, 1, 0, 0, 1, 1,
0.8771561, 0.07010707, 2.446226, 1, 0, 0, 1, 1,
0.8818185, 0.5152214, 1.386276, 1, 0, 0, 1, 1,
0.8829001, -0.0953, 0.9035613, 1, 0, 0, 1, 1,
0.8866116, -0.05179813, 0.06799028, 1, 0, 0, 1, 1,
0.8879133, -1.784651, 2.110797, 0, 0, 0, 1, 1,
0.8880697, -0.4587168, 2.028093, 0, 0, 0, 1, 1,
0.8914722, -0.9880659, 1.094514, 0, 0, 0, 1, 1,
0.9044448, -0.6663393, 3.169527, 0, 0, 0, 1, 1,
0.9054965, 0.1723234, 1.327888, 0, 0, 0, 1, 1,
0.9087673, -0.5970986, 1.561439, 0, 0, 0, 1, 1,
0.9120463, -0.05649292, 2.898104, 0, 0, 0, 1, 1,
0.9132877, -0.9505875, 2.588352, 1, 1, 1, 1, 1,
0.9192132, -0.1251485, 0.05287401, 1, 1, 1, 1, 1,
0.9203286, -0.8119377, 2.371563, 1, 1, 1, 1, 1,
0.92997, 0.1714611, 1.311857, 1, 1, 1, 1, 1,
0.9334232, 0.919601, 0.2601359, 1, 1, 1, 1, 1,
0.939708, -0.6820665, 1.74844, 1, 1, 1, 1, 1,
0.9424704, -0.5197787, 1.943326, 1, 1, 1, 1, 1,
0.9481235, 0.1887218, 1.086004, 1, 1, 1, 1, 1,
0.9532304, 0.191203, 0.08172015, 1, 1, 1, 1, 1,
0.9582563, 0.103761, 1.941369, 1, 1, 1, 1, 1,
0.9590413, -0.6708401, 1.317122, 1, 1, 1, 1, 1,
0.9614604, -0.7138044, 1.430254, 1, 1, 1, 1, 1,
0.9694405, -0.04540622, 3.01537, 1, 1, 1, 1, 1,
0.9704645, -0.02027107, 0.182911, 1, 1, 1, 1, 1,
0.9715213, 0.07357417, 0.6998546, 1, 1, 1, 1, 1,
0.974615, 1.603226, 0.3939731, 0, 0, 1, 1, 1,
0.9764226, -0.4382363, 2.587319, 1, 0, 0, 1, 1,
0.9768805, -0.9889579, 1.807336, 1, 0, 0, 1, 1,
0.9795272, 0.9406547, 2.850493, 1, 0, 0, 1, 1,
0.9796457, 0.7986031, -0.6320074, 1, 0, 0, 1, 1,
0.9822307, 0.1735165, 1.046068, 1, 0, 0, 1, 1,
0.9842269, 0.2118327, 1.158695, 0, 0, 0, 1, 1,
0.9845598, -1.307482, 2.508102, 0, 0, 0, 1, 1,
0.9873285, 0.4297337, 0.639896, 0, 0, 0, 1, 1,
0.9879549, 0.6992722, 0.06243866, 0, 0, 0, 1, 1,
0.9907517, -0.2697346, 2.577738, 0, 0, 0, 1, 1,
0.9948348, -1.656658, 4.569978, 0, 0, 0, 1, 1,
0.9981113, -0.5355804, 2.702847, 0, 0, 0, 1, 1,
1.016928, -0.4357189, 1.895367, 1, 1, 1, 1, 1,
1.030642, 0.7367853, 0.9822671, 1, 1, 1, 1, 1,
1.032354, 0.1260648, 1.981868, 1, 1, 1, 1, 1,
1.03375, 1.482685, -0.4704435, 1, 1, 1, 1, 1,
1.034718, -0.3885692, 0.2398924, 1, 1, 1, 1, 1,
1.039815, 0.111568, 3.046015, 1, 1, 1, 1, 1,
1.041041, 0.1162335, 1.670291, 1, 1, 1, 1, 1,
1.042818, -1.603091, 4.764034, 1, 1, 1, 1, 1,
1.049607, 0.5165936, 1.478762, 1, 1, 1, 1, 1,
1.070433, 3.079758, 1.039098, 1, 1, 1, 1, 1,
1.084345, -2.088406, 2.043598, 1, 1, 1, 1, 1,
1.097777, 0.1174544, 1.07688, 1, 1, 1, 1, 1,
1.103844, 0.7531457, 0.9276983, 1, 1, 1, 1, 1,
1.104672, -1.022947, 3.111284, 1, 1, 1, 1, 1,
1.113297, -0.572024, 2.099399, 1, 1, 1, 1, 1,
1.117194, -1.155448, 1.358309, 0, 0, 1, 1, 1,
1.124146, 0.4901585, -0.9377394, 1, 0, 0, 1, 1,
1.125632, 1.542559, 1.12399, 1, 0, 0, 1, 1,
1.12704, -0.1017933, 1.522197, 1, 0, 0, 1, 1,
1.137924, -1.870395, 1.220441, 1, 0, 0, 1, 1,
1.142725, -1.069891, 3.533233, 1, 0, 0, 1, 1,
1.143137, 0.7853676, 0.4997092, 0, 0, 0, 1, 1,
1.143919, -0.7196317, 2.086848, 0, 0, 0, 1, 1,
1.15232, 1.020887, -0.3689893, 0, 0, 0, 1, 1,
1.15503, -1.556458, 2.128649, 0, 0, 0, 1, 1,
1.160146, -0.7672555, 2.055093, 0, 0, 0, 1, 1,
1.167393, -1.034336, 2.911805, 0, 0, 0, 1, 1,
1.16784, 0.127551, 1.520528, 0, 0, 0, 1, 1,
1.180506, -0.9350823, 4.716149, 1, 1, 1, 1, 1,
1.182449, -0.6986231, 2.389821, 1, 1, 1, 1, 1,
1.183096, -0.1467287, 1.591073, 1, 1, 1, 1, 1,
1.183308, 0.287759, 1.540152, 1, 1, 1, 1, 1,
1.185722, 2.031761, -0.1327733, 1, 1, 1, 1, 1,
1.1881, -0.324914, 3.263413, 1, 1, 1, 1, 1,
1.207767, 0.5762906, -1.674934, 1, 1, 1, 1, 1,
1.220826, -0.03688099, 3.151978, 1, 1, 1, 1, 1,
1.228907, 0.7851676, -0.733066, 1, 1, 1, 1, 1,
1.247828, 0.7160902, -1.45443, 1, 1, 1, 1, 1,
1.251319, -1.382159, 3.202031, 1, 1, 1, 1, 1,
1.258522, 0.1911781, 0.3965136, 1, 1, 1, 1, 1,
1.267009, -0.833007, 1.438927, 1, 1, 1, 1, 1,
1.269078, 1.612713, -0.3023969, 1, 1, 1, 1, 1,
1.272657, -0.9372523, 2.448958, 1, 1, 1, 1, 1,
1.278607, -0.9289784, 2.548061, 0, 0, 1, 1, 1,
1.291659, -0.1573433, 1.540157, 1, 0, 0, 1, 1,
1.309056, 1.235569, 2.618635, 1, 0, 0, 1, 1,
1.310779, -0.4292329, 1.238768, 1, 0, 0, 1, 1,
1.314055, 1.042629, 0.2833963, 1, 0, 0, 1, 1,
1.31714, -1.473808, 1.262654, 1, 0, 0, 1, 1,
1.325682, 0.4650387, 1.179954, 0, 0, 0, 1, 1,
1.342623, -0.4052389, 1.878408, 0, 0, 0, 1, 1,
1.355946, -0.9294986, 1.931152, 0, 0, 0, 1, 1,
1.356, 1.68668, 0.586566, 0, 0, 0, 1, 1,
1.357077, 0.09005076, 2.562392, 0, 0, 0, 1, 1,
1.364714, 0.7769886, 3.589967, 0, 0, 0, 1, 1,
1.375727, -0.4174755, -0.8184487, 0, 0, 0, 1, 1,
1.385802, -0.3762163, 1.793159, 1, 1, 1, 1, 1,
1.408394, 1.647128, 1.153617, 1, 1, 1, 1, 1,
1.416128, -0.6212435, 1.94467, 1, 1, 1, 1, 1,
1.417612, -0.8973309, 0.1316704, 1, 1, 1, 1, 1,
1.428264, -0.3535666, 0.7792988, 1, 1, 1, 1, 1,
1.432146, -0.1067503, -0.1327938, 1, 1, 1, 1, 1,
1.440106, 0.3123194, 1.409277, 1, 1, 1, 1, 1,
1.444211, 0.09474228, 1.380876, 1, 1, 1, 1, 1,
1.45284, 0.6127794, 0.1874847, 1, 1, 1, 1, 1,
1.457556, -0.04659373, 2.174383, 1, 1, 1, 1, 1,
1.473683, -0.09202813, 0.9691444, 1, 1, 1, 1, 1,
1.491593, 0.7291293, 2.063452, 1, 1, 1, 1, 1,
1.502267, 1.113658, 0.3353538, 1, 1, 1, 1, 1,
1.518957, -1.837849, 4.035895, 1, 1, 1, 1, 1,
1.524088, 0.5252399, 0.2322824, 1, 1, 1, 1, 1,
1.535984, -0.7508956, 3.560465, 0, 0, 1, 1, 1,
1.540614, -1.463764, 2.038817, 1, 0, 0, 1, 1,
1.547145, 0.7339699, 1.280273, 1, 0, 0, 1, 1,
1.55245, 0.4495412, 1.34898, 1, 0, 0, 1, 1,
1.577926, 0.2627501, 1.433679, 1, 0, 0, 1, 1,
1.587643, -0.4657026, 3.101929, 1, 0, 0, 1, 1,
1.598871, 1.358444, -0.1521311, 0, 0, 0, 1, 1,
1.603624, 1.501415, 0.6260845, 0, 0, 0, 1, 1,
1.60894, -0.9302099, 1.309134, 0, 0, 0, 1, 1,
1.610003, 1.934825, 0.881647, 0, 0, 0, 1, 1,
1.611563, -1.801547, 3.136801, 0, 0, 0, 1, 1,
1.616399, -0.08741074, 1.480088, 0, 0, 0, 1, 1,
1.619609, 0.03019128, 1.172631, 0, 0, 0, 1, 1,
1.619823, -0.6260618, 4.396286, 1, 1, 1, 1, 1,
1.620368, 0.08109115, 1.254019, 1, 1, 1, 1, 1,
1.627059, -0.268624, -0.04091251, 1, 1, 1, 1, 1,
1.645235, -1.49431, 1.618468, 1, 1, 1, 1, 1,
1.645432, 2.476664, 1.957156, 1, 1, 1, 1, 1,
1.66035, -0.9548699, 1.671683, 1, 1, 1, 1, 1,
1.660731, -0.2624491, 0.224379, 1, 1, 1, 1, 1,
1.661274, 0.4595794, 0.01265316, 1, 1, 1, 1, 1,
1.692128, 0.2104103, 1.034635, 1, 1, 1, 1, 1,
1.699312, -1.282254, 1.745938, 1, 1, 1, 1, 1,
1.706659, 1.132388, 1.01448, 1, 1, 1, 1, 1,
1.719143, 1.584867, 1.576356, 1, 1, 1, 1, 1,
1.746386, -1.837845, 1.09348, 1, 1, 1, 1, 1,
1.749557, -1.146384, 3.002926, 1, 1, 1, 1, 1,
1.751302, 1.138743, -0.3795479, 1, 1, 1, 1, 1,
1.751915, -0.07700583, 3.308752, 0, 0, 1, 1, 1,
1.75381, -0.8543208, 2.897524, 1, 0, 0, 1, 1,
1.773654, -1.019386, 2.347458, 1, 0, 0, 1, 1,
1.80377, -1.509898, 1.811119, 1, 0, 0, 1, 1,
1.827862, 0.9295877, -0.4929892, 1, 0, 0, 1, 1,
1.897534, 0.7688715, 0.9115816, 1, 0, 0, 1, 1,
1.912357, -0.2553921, 1.994381, 0, 0, 0, 1, 1,
1.915724, -2.011906, 3.165065, 0, 0, 0, 1, 1,
1.918185, -0.3720124, 3.71032, 0, 0, 0, 1, 1,
1.923433, -2.387476, 4.077852, 0, 0, 0, 1, 1,
1.929, -1.068456, 1.448787, 0, 0, 0, 1, 1,
1.935148, -0.3833162, 1.385638, 0, 0, 0, 1, 1,
1.944101, -0.3519192, 3.466772, 0, 0, 0, 1, 1,
1.944534, 0.1626096, 1.944956, 1, 1, 1, 1, 1,
1.969702, -0.6561957, 2.608249, 1, 1, 1, 1, 1,
1.971189, 0.4246104, 1.551176, 1, 1, 1, 1, 1,
1.986759, 0.287099, 0.8360879, 1, 1, 1, 1, 1,
1.992173, 0.4359923, 2.050807, 1, 1, 1, 1, 1,
1.997205, -0.4916872, 2.121437, 1, 1, 1, 1, 1,
2.015802, -0.7696551, 1.70063, 1, 1, 1, 1, 1,
2.016032, -1.393209, 3.101955, 1, 1, 1, 1, 1,
2.087236, 0.425502, 1.864275, 1, 1, 1, 1, 1,
2.097067, 1.338312, 2.097698, 1, 1, 1, 1, 1,
2.156631, 0.9215913, -0.08283798, 1, 1, 1, 1, 1,
2.173113, -0.8101639, -0.1324476, 1, 1, 1, 1, 1,
2.182948, 0.5137938, 1.500004, 1, 1, 1, 1, 1,
2.196213, -0.7303771, 1.587856, 1, 1, 1, 1, 1,
2.199417, -0.330166, 0.6425579, 1, 1, 1, 1, 1,
2.221837, 0.0416159, 1.50149, 0, 0, 1, 1, 1,
2.225899, -0.6058185, 3.169832, 1, 0, 0, 1, 1,
2.232069, 0.5250968, 0.2039736, 1, 0, 0, 1, 1,
2.235909, 0.7380148, 1.970799, 1, 0, 0, 1, 1,
2.257221, -1.673583, 1.973088, 1, 0, 0, 1, 1,
2.263322, -0.5370322, 2.196821, 1, 0, 0, 1, 1,
2.286478, 0.1928937, 1.058457, 0, 0, 0, 1, 1,
2.299375, 0.8951534, -0.09873945, 0, 0, 0, 1, 1,
2.314674, -0.06793459, 1.888695, 0, 0, 0, 1, 1,
2.319284, 0.08431836, -0.1434969, 0, 0, 0, 1, 1,
2.355363, 1.247417, 0.7509843, 0, 0, 0, 1, 1,
2.357456, 0.5519792, 0.1126048, 0, 0, 0, 1, 1,
2.360578, -0.5708627, 2.029608, 0, 0, 0, 1, 1,
2.398438, -0.2000878, 3.120728, 1, 1, 1, 1, 1,
2.46689, -0.6775904, 1.444047, 1, 1, 1, 1, 1,
2.493512, -0.3898838, 2.104948, 1, 1, 1, 1, 1,
2.572422, 0.172445, 2.059582, 1, 1, 1, 1, 1,
2.847807, 0.2115473, 1.739237, 1, 1, 1, 1, 1,
3.055607, -1.582423, 2.023944, 1, 1, 1, 1, 1,
3.192895, 0.1726111, 1.894042, 1, 1, 1, 1, 1
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
var radius = 9.531372;
var distance = 33.47854;
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
mvMatrix.translate( -0.1298758, 0.001285553, -0.7646327 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.47854);
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
