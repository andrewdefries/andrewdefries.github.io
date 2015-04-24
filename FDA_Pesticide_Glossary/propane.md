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
-3.046724, -0.5139118, -2.921766, 1, 0, 0, 1,
-2.929167, 1.364496, -1.993575, 1, 0.007843138, 0, 1,
-2.791389, -1.195406, -0.6996578, 1, 0.01176471, 0, 1,
-2.704273, -2.475068, -2.919465, 1, 0.01960784, 0, 1,
-2.655883, 0.9113062, -1.899972, 1, 0.02352941, 0, 1,
-2.635472, 1.955891, -0.8408002, 1, 0.03137255, 0, 1,
-2.487255, -0.4702381, -3.027575, 1, 0.03529412, 0, 1,
-2.469769, 0.4759714, 0.7106563, 1, 0.04313726, 0, 1,
-2.445118, 0.02440995, -2.166713, 1, 0.04705882, 0, 1,
-2.350624, 0.500877, -1.578358, 1, 0.05490196, 0, 1,
-2.318652, -0.0159975, -2.159561, 1, 0.05882353, 0, 1,
-2.27765, -0.08282939, -2.533101, 1, 0.06666667, 0, 1,
-2.266689, -1.138962, -3.025299, 1, 0.07058824, 0, 1,
-2.250931, -0.4519593, -1.453781, 1, 0.07843138, 0, 1,
-2.237806, 1.062157, -0.7026994, 1, 0.08235294, 0, 1,
-2.234423, 0.1154556, -2.27455, 1, 0.09019608, 0, 1,
-2.228469, -0.1981813, -3.384034, 1, 0.09411765, 0, 1,
-2.140048, 0.7834442, -1.998331, 1, 0.1019608, 0, 1,
-2.12998, 1.258343, -1.126052, 1, 0.1098039, 0, 1,
-2.116706, 0.3389291, -2.588495, 1, 0.1137255, 0, 1,
-2.103399, 1.121811, -2.658996, 1, 0.1215686, 0, 1,
-2.092787, -0.2580198, -0.6487084, 1, 0.1254902, 0, 1,
-2.088448, 1.019681, -0.3498949, 1, 0.1333333, 0, 1,
-2.060829, 1.317392, -2.148251, 1, 0.1372549, 0, 1,
-1.985653, 0.9789147, -3.240516, 1, 0.145098, 0, 1,
-1.981209, 0.04117875, 0.2172184, 1, 0.1490196, 0, 1,
-1.961815, 1.379921, -1.46114, 1, 0.1568628, 0, 1,
-1.96052, -1.170458, -1.816367, 1, 0.1607843, 0, 1,
-1.950093, 0.8435408, -0.2419949, 1, 0.1686275, 0, 1,
-1.944471, 0.8433632, -1.576399, 1, 0.172549, 0, 1,
-1.937608, 1.874588, 0.02172457, 1, 0.1803922, 0, 1,
-1.915914, 0.5520573, -3.563239, 1, 0.1843137, 0, 1,
-1.900774, -0.4523682, -4.26009, 1, 0.1921569, 0, 1,
-1.90012, -0.09988845, -4.173403, 1, 0.1960784, 0, 1,
-1.895782, 1.078686, -2.212039, 1, 0.2039216, 0, 1,
-1.888522, 1.382482, 0.1118857, 1, 0.2117647, 0, 1,
-1.852431, 0.7065912, -0.6155249, 1, 0.2156863, 0, 1,
-1.848956, -0.4698661, -0.5101746, 1, 0.2235294, 0, 1,
-1.846056, 1.55825, -1.515016, 1, 0.227451, 0, 1,
-1.829033, -0.7705203, -2.159014, 1, 0.2352941, 0, 1,
-1.826241, 1.449354, 0.06596953, 1, 0.2392157, 0, 1,
-1.823909, 0.3628071, -0.2867067, 1, 0.2470588, 0, 1,
-1.823756, 0.8620067, -0.7939934, 1, 0.2509804, 0, 1,
-1.822348, -0.7840267, -2.564657, 1, 0.2588235, 0, 1,
-1.819882, 0.06881157, -1.219405, 1, 0.2627451, 0, 1,
-1.794074, 0.4274213, -0.2422357, 1, 0.2705882, 0, 1,
-1.786512, -1.068417, -2.863575, 1, 0.2745098, 0, 1,
-1.737063, 1.580651, -0.6943666, 1, 0.282353, 0, 1,
-1.729699, -1.510638, -0.8844309, 1, 0.2862745, 0, 1,
-1.72312, -0.3051621, -2.178916, 1, 0.2941177, 0, 1,
-1.704093, 0.8691299, -2.364861, 1, 0.3019608, 0, 1,
-1.677039, -0.8512582, -0.3256628, 1, 0.3058824, 0, 1,
-1.659997, 0.34934, -1.616361, 1, 0.3137255, 0, 1,
-1.652071, -1.691117, -3.4042, 1, 0.3176471, 0, 1,
-1.646569, 0.9105332, -1.173438, 1, 0.3254902, 0, 1,
-1.63973, -0.6786131, -2.918951, 1, 0.3294118, 0, 1,
-1.635728, -0.6849155, -2.383436, 1, 0.3372549, 0, 1,
-1.635417, -0.339107, -1.147792, 1, 0.3411765, 0, 1,
-1.612026, -1.76165, -0.02179438, 1, 0.3490196, 0, 1,
-1.606833, 0.6189994, -1.32723, 1, 0.3529412, 0, 1,
-1.605298, 0.6035866, -1.406488, 1, 0.3607843, 0, 1,
-1.600243, 0.7094775, -1.033503, 1, 0.3647059, 0, 1,
-1.599665, 1.324075, 0.1326867, 1, 0.372549, 0, 1,
-1.597303, -0.3399558, -1.279243, 1, 0.3764706, 0, 1,
-1.589216, -0.7261624, -1.848599, 1, 0.3843137, 0, 1,
-1.587748, 0.04495152, -1.246116, 1, 0.3882353, 0, 1,
-1.584323, 0.7867678, 0.574374, 1, 0.3960784, 0, 1,
-1.582549, 0.7743071, -0.7680459, 1, 0.4039216, 0, 1,
-1.57935, 0.5605445, -3.120927, 1, 0.4078431, 0, 1,
-1.558671, -0.2480965, -2.213867, 1, 0.4156863, 0, 1,
-1.538228, 1.051399, -0.44707, 1, 0.4196078, 0, 1,
-1.53456, -1.715225, -1.905355, 1, 0.427451, 0, 1,
-1.533797, -0.6250945, -1.288962, 1, 0.4313726, 0, 1,
-1.533629, -0.6322069, -2.051931, 1, 0.4392157, 0, 1,
-1.528205, 0.3352881, -2.031169, 1, 0.4431373, 0, 1,
-1.525227, -0.8155533, -1.149189, 1, 0.4509804, 0, 1,
-1.523643, -2.452203, -1.496247, 1, 0.454902, 0, 1,
-1.518347, -0.6222424, -2.317047, 1, 0.4627451, 0, 1,
-1.514938, -1.107943, -0.8228573, 1, 0.4666667, 0, 1,
-1.499568, -0.4317285, -0.5950952, 1, 0.4745098, 0, 1,
-1.494842, -0.5814714, -2.741095, 1, 0.4784314, 0, 1,
-1.493949, 1.654657, -1.557791, 1, 0.4862745, 0, 1,
-1.491636, -0.08895922, -1.53896, 1, 0.4901961, 0, 1,
-1.485423, 0.2344034, -1.626943, 1, 0.4980392, 0, 1,
-1.470517, 2.519188, -1.022811, 1, 0.5058824, 0, 1,
-1.449507, -2.054013, -2.064596, 1, 0.509804, 0, 1,
-1.446838, 2.039929, -1.126734, 1, 0.5176471, 0, 1,
-1.437772, 0.6215141, 0.05070085, 1, 0.5215687, 0, 1,
-1.436321, 1.3369, -0.8423086, 1, 0.5294118, 0, 1,
-1.40646, -0.3239425, -2.290768, 1, 0.5333334, 0, 1,
-1.403025, -0.6652054, -0.7469549, 1, 0.5411765, 0, 1,
-1.39854, -0.5693697, -2.063046, 1, 0.5450981, 0, 1,
-1.397249, 0.3431019, -0.3392225, 1, 0.5529412, 0, 1,
-1.396689, -1.116425, -0.7502019, 1, 0.5568628, 0, 1,
-1.394425, -1.628669, -2.885369, 1, 0.5647059, 0, 1,
-1.384527, -1.383736, -3.90346, 1, 0.5686275, 0, 1,
-1.378769, 0.6519108, 0.05893636, 1, 0.5764706, 0, 1,
-1.377732, 0.7394464, -0.4892225, 1, 0.5803922, 0, 1,
-1.375737, -2.259385, -2.525173, 1, 0.5882353, 0, 1,
-1.374836, -0.7234182, -2.184683, 1, 0.5921569, 0, 1,
-1.374827, 0.7040694, -1.006968, 1, 0.6, 0, 1,
-1.366767, 0.2226938, -1.910685, 1, 0.6078432, 0, 1,
-1.362163, 0.4428114, -3.194558, 1, 0.6117647, 0, 1,
-1.361193, -0.7588971, -2.982238, 1, 0.6196079, 0, 1,
-1.352518, -0.5219663, -1.448693, 1, 0.6235294, 0, 1,
-1.349091, 0.810283, -0.7819698, 1, 0.6313726, 0, 1,
-1.33465, -0.9934637, -1.44134, 1, 0.6352941, 0, 1,
-1.331222, -0.1606068, -1.87448, 1, 0.6431373, 0, 1,
-1.327093, -1.37132, -1.176985, 1, 0.6470588, 0, 1,
-1.324551, -0.9271551, -1.39176, 1, 0.654902, 0, 1,
-1.321635, -0.1031007, -1.643255, 1, 0.6588235, 0, 1,
-1.312211, -0.7926463, -2.745261, 1, 0.6666667, 0, 1,
-1.309926, -0.195039, -1.73958, 1, 0.6705883, 0, 1,
-1.305906, 1.068993, -0.9684191, 1, 0.6784314, 0, 1,
-1.305352, -0.7762375, -2.239214, 1, 0.682353, 0, 1,
-1.282125, -0.1286511, -1.254453, 1, 0.6901961, 0, 1,
-1.281492, 0.4511965, 0.8301931, 1, 0.6941177, 0, 1,
-1.276926, 0.6124051, -3.059308, 1, 0.7019608, 0, 1,
-1.271641, -1.505281, -2.848974, 1, 0.7098039, 0, 1,
-1.267227, 0.2039027, -0.2036981, 1, 0.7137255, 0, 1,
-1.26319, -0.9802677, -1.028772, 1, 0.7215686, 0, 1,
-1.257638, -1.125227, -2.438104, 1, 0.7254902, 0, 1,
-1.254751, 0.7355518, -0.4962544, 1, 0.7333333, 0, 1,
-1.25309, -0.1118244, -2.670741, 1, 0.7372549, 0, 1,
-1.252426, -1.638546, -2.788858, 1, 0.7450981, 0, 1,
-1.241704, -0.4263753, -3.046524, 1, 0.7490196, 0, 1,
-1.241356, -0.5113549, -1.481359, 1, 0.7568628, 0, 1,
-1.241323, -1.912845, -2.499945, 1, 0.7607843, 0, 1,
-1.237158, -0.2520978, 0.5352837, 1, 0.7686275, 0, 1,
-1.235724, -0.5406294, -1.533069, 1, 0.772549, 0, 1,
-1.233356, -0.7068022, -2.769857, 1, 0.7803922, 0, 1,
-1.232994, 1.630744, -0.7292358, 1, 0.7843137, 0, 1,
-1.224027, 0.08230235, -1.79054, 1, 0.7921569, 0, 1,
-1.220848, -0.2776329, -1.178357, 1, 0.7960784, 0, 1,
-1.212237, 1.06746, -0.6812785, 1, 0.8039216, 0, 1,
-1.206782, 1.022313, -1.646045, 1, 0.8117647, 0, 1,
-1.206145, -0.4657432, 0.1013617, 1, 0.8156863, 0, 1,
-1.198579, -0.04423288, -2.501749, 1, 0.8235294, 0, 1,
-1.186941, -0.3076418, -2.303655, 1, 0.827451, 0, 1,
-1.186017, 0.5980687, 0.3245786, 1, 0.8352941, 0, 1,
-1.185901, 1.188972, -0.06422116, 1, 0.8392157, 0, 1,
-1.181595, 0.3422502, -2.207138, 1, 0.8470588, 0, 1,
-1.180586, -0.6101365, -2.072276, 1, 0.8509804, 0, 1,
-1.173396, -0.3910534, 0.2419064, 1, 0.8588235, 0, 1,
-1.156221, 1.044755, -0.9614927, 1, 0.8627451, 0, 1,
-1.153649, -0.1863188, -2.657889, 1, 0.8705882, 0, 1,
-1.150706, -2.292302, -3.868351, 1, 0.8745098, 0, 1,
-1.147394, 0.1136735, -0.7224979, 1, 0.8823529, 0, 1,
-1.139394, 2.681395, -0.1658458, 1, 0.8862745, 0, 1,
-1.139262, -0.6690686, -2.670882, 1, 0.8941177, 0, 1,
-1.136705, 0.6596806, -1.294477, 1, 0.8980392, 0, 1,
-1.128142, 0.4306309, 0.4735916, 1, 0.9058824, 0, 1,
-1.126536, 0.966511, 0.7143992, 1, 0.9137255, 0, 1,
-1.109672, 1.420648, -0.1827106, 1, 0.9176471, 0, 1,
-1.089496, -0.05809124, -1.6672, 1, 0.9254902, 0, 1,
-1.081428, 0.1521369, -1.83948, 1, 0.9294118, 0, 1,
-1.079489, 0.8109039, -1.085721, 1, 0.9372549, 0, 1,
-1.077734, -0.6499439, -2.210366, 1, 0.9411765, 0, 1,
-1.070835, -0.01371586, -2.532439, 1, 0.9490196, 0, 1,
-1.04668, -1.227, -1.274604, 1, 0.9529412, 0, 1,
-1.024557, -0.8169842, -3.857388, 1, 0.9607843, 0, 1,
-1.024343, -1.088674, -1.026172, 1, 0.9647059, 0, 1,
-1.023543, -0.2771638, -1.715653, 1, 0.972549, 0, 1,
-1.019399, 3.325457, -0.1015065, 1, 0.9764706, 0, 1,
-1.014067, -1.04123, -2.658228, 1, 0.9843137, 0, 1,
-1.008206, 0.8331447, -0.694063, 1, 0.9882353, 0, 1,
-1.008129, -0.5058465, -1.225338, 1, 0.9960784, 0, 1,
-1.002829, -1.751346, -4.198973, 0.9960784, 1, 0, 1,
-1.002228, -0.02271333, 0.4037944, 0.9921569, 1, 0, 1,
-0.9910573, 0.0690846, -1.467054, 0.9843137, 1, 0, 1,
-0.9868888, 1.576687, -0.7551854, 0.9803922, 1, 0, 1,
-0.983031, -0.3431676, -1.621885, 0.972549, 1, 0, 1,
-0.9805216, -0.2991522, -2.768073, 0.9686275, 1, 0, 1,
-0.9772277, 0.4823455, -4.341746, 0.9607843, 1, 0, 1,
-0.9769628, -1.058392, -1.247585, 0.9568627, 1, 0, 1,
-0.9734539, 0.9566345, -1.378571, 0.9490196, 1, 0, 1,
-0.9731744, 2.142547, -0.1187735, 0.945098, 1, 0, 1,
-0.968013, 0.2796261, -3.766657, 0.9372549, 1, 0, 1,
-0.9677495, 0.07610847, -0.4693756, 0.9333333, 1, 0, 1,
-0.9657708, 0.8760003, -1.6788, 0.9254902, 1, 0, 1,
-0.9653571, -0.5358135, -1.59659, 0.9215686, 1, 0, 1,
-0.9649945, -0.05836027, -1.828684, 0.9137255, 1, 0, 1,
-0.9632623, -0.8900617, -0.9708109, 0.9098039, 1, 0, 1,
-0.9578404, 0.3675121, -0.7131319, 0.9019608, 1, 0, 1,
-0.9562607, 0.3025206, -1.527042, 0.8941177, 1, 0, 1,
-0.9483171, -1.304642, -2.142078, 0.8901961, 1, 0, 1,
-0.9466482, 1.515497, -0.947367, 0.8823529, 1, 0, 1,
-0.9455047, 0.8940794, -3.232827, 0.8784314, 1, 0, 1,
-0.9435749, -0.6275468, -1.931725, 0.8705882, 1, 0, 1,
-0.9427558, -1.258199, -1.966641, 0.8666667, 1, 0, 1,
-0.9421667, -1.17364, -2.987518, 0.8588235, 1, 0, 1,
-0.9333448, 2.556714, -0.691193, 0.854902, 1, 0, 1,
-0.9306932, 0.5483349, 0.1400862, 0.8470588, 1, 0, 1,
-0.9297627, 1.200304, -0.9176695, 0.8431373, 1, 0, 1,
-0.9235148, 0.4716941, 0.6232644, 0.8352941, 1, 0, 1,
-0.9170141, 1.032277, -1.337469, 0.8313726, 1, 0, 1,
-0.9117187, 0.7534684, -2.251457, 0.8235294, 1, 0, 1,
-0.9067463, -0.7738829, -2.027748, 0.8196079, 1, 0, 1,
-0.9031137, -0.2493549, -3.100812, 0.8117647, 1, 0, 1,
-0.8991795, -0.3880587, -0.8237844, 0.8078431, 1, 0, 1,
-0.8810088, -0.01543987, -0.496639, 0.8, 1, 0, 1,
-0.8770521, 0.1261192, -1.666009, 0.7921569, 1, 0, 1,
-0.8768417, 0.9847727, -1.01055, 0.7882353, 1, 0, 1,
-0.8722665, -0.0539278, -1.702136, 0.7803922, 1, 0, 1,
-0.8716838, -1.180961, -2.382045, 0.7764706, 1, 0, 1,
-0.8682347, -1.400817, -1.79401, 0.7686275, 1, 0, 1,
-0.8665519, -1.132091, -0.3542264, 0.7647059, 1, 0, 1,
-0.8616583, -0.4664264, -3.856227, 0.7568628, 1, 0, 1,
-0.8603452, -1.322545, -2.530209, 0.7529412, 1, 0, 1,
-0.8573562, 0.3537679, -0.5946541, 0.7450981, 1, 0, 1,
-0.8474948, -0.07653161, -3.00691, 0.7411765, 1, 0, 1,
-0.8467428, 1.430238, -1.289031, 0.7333333, 1, 0, 1,
-0.8366849, -1.405502, -1.934392, 0.7294118, 1, 0, 1,
-0.8346786, 0.6849628, -2.150095, 0.7215686, 1, 0, 1,
-0.8276842, 0.5860046, -1.381439, 0.7176471, 1, 0, 1,
-0.8225535, -0.376893, -3.247128, 0.7098039, 1, 0, 1,
-0.8210112, 0.5581535, -1.052288, 0.7058824, 1, 0, 1,
-0.8173189, -0.5688555, -3.058864, 0.6980392, 1, 0, 1,
-0.8149534, -1.405182, -2.036054, 0.6901961, 1, 0, 1,
-0.8141002, -0.2980675, -1.295785, 0.6862745, 1, 0, 1,
-0.8140046, 0.695151, -2.005098, 0.6784314, 1, 0, 1,
-0.8051548, 0.308172, -0.4409334, 0.6745098, 1, 0, 1,
-0.8042742, -0.3245316, -3.248959, 0.6666667, 1, 0, 1,
-0.8034855, 1.659761, -1.413168, 0.6627451, 1, 0, 1,
-0.8011263, 0.838617, -2.045597, 0.654902, 1, 0, 1,
-0.797289, -0.4781139, -1.589311, 0.6509804, 1, 0, 1,
-0.7924908, 1.444759, 0.908334, 0.6431373, 1, 0, 1,
-0.7919933, -0.7114255, -2.550842, 0.6392157, 1, 0, 1,
-0.7871447, 0.648922, -0.9435541, 0.6313726, 1, 0, 1,
-0.7807076, -0.959541, -2.866373, 0.627451, 1, 0, 1,
-0.7802876, -1.187079, -3.461723, 0.6196079, 1, 0, 1,
-0.7759947, -1.2645, -3.075955, 0.6156863, 1, 0, 1,
-0.7746971, -0.123374, -0.9912598, 0.6078432, 1, 0, 1,
-0.7730886, 0.7566789, -0.810938, 0.6039216, 1, 0, 1,
-0.7717845, -0.8107832, -3.027491, 0.5960785, 1, 0, 1,
-0.7715253, -0.5716122, -3.131784, 0.5882353, 1, 0, 1,
-0.7645413, 0.6463767, 0.0234372, 0.5843138, 1, 0, 1,
-0.7624148, 0.7851954, -0.3151418, 0.5764706, 1, 0, 1,
-0.7572119, -0.4888348, -1.686284, 0.572549, 1, 0, 1,
-0.7551705, 0.5048071, -0.8414212, 0.5647059, 1, 0, 1,
-0.7521077, 0.6189634, 0.3985598, 0.5607843, 1, 0, 1,
-0.7502858, -1.233839, -4.547669, 0.5529412, 1, 0, 1,
-0.7422233, 0.4400096, -0.4241501, 0.5490196, 1, 0, 1,
-0.7394678, -0.2015167, -2.217344, 0.5411765, 1, 0, 1,
-0.7381138, 1.536396, 0.2103692, 0.5372549, 1, 0, 1,
-0.7363284, -1.813576, -2.517475, 0.5294118, 1, 0, 1,
-0.7338322, -0.8642704, -1.757845, 0.5254902, 1, 0, 1,
-0.7313584, 1.250273, -0.8374951, 0.5176471, 1, 0, 1,
-0.731261, -0.9740182, -2.738521, 0.5137255, 1, 0, 1,
-0.7275781, -1.173932, -3.28563, 0.5058824, 1, 0, 1,
-0.7256557, 0.5306599, -2.02316, 0.5019608, 1, 0, 1,
-0.7243305, -0.5380915, -3.402346, 0.4941176, 1, 0, 1,
-0.7173402, -0.2547561, -1.958212, 0.4862745, 1, 0, 1,
-0.7158933, -1.201874, -2.428351, 0.4823529, 1, 0, 1,
-0.7148235, 0.002516576, 0.4305249, 0.4745098, 1, 0, 1,
-0.7119949, -0.3449026, -2.106067, 0.4705882, 1, 0, 1,
-0.7093893, -0.04524952, -1.03094, 0.4627451, 1, 0, 1,
-0.708897, 0.01800222, -0.09241538, 0.4588235, 1, 0, 1,
-0.7056276, 0.8207114, -0.5709499, 0.4509804, 1, 0, 1,
-0.7041348, -0.1376597, -1.516592, 0.4470588, 1, 0, 1,
-0.700353, -0.4245124, -2.035938, 0.4392157, 1, 0, 1,
-0.6944011, 0.4297439, -0.3835583, 0.4352941, 1, 0, 1,
-0.6904441, -0.1127755, -2.926959, 0.427451, 1, 0, 1,
-0.6833054, -0.08199849, -2.693558, 0.4235294, 1, 0, 1,
-0.6773955, 1.384873, -0.5534166, 0.4156863, 1, 0, 1,
-0.6684143, 1.352126, -0.4683503, 0.4117647, 1, 0, 1,
-0.668275, 0.3884742, -0.03100817, 0.4039216, 1, 0, 1,
-0.6664568, -0.1234431, -0.7679569, 0.3960784, 1, 0, 1,
-0.6613089, 0.4504262, 0.05544655, 0.3921569, 1, 0, 1,
-0.6612933, 0.4749178, -0.9567081, 0.3843137, 1, 0, 1,
-0.653453, -0.1865382, -3.052162, 0.3803922, 1, 0, 1,
-0.6529998, -1.270449, -4.994694, 0.372549, 1, 0, 1,
-0.6525618, -0.7850329, -2.37911, 0.3686275, 1, 0, 1,
-0.6494813, -0.5923257, -1.805489, 0.3607843, 1, 0, 1,
-0.6414816, 0.3857791, -0.503616, 0.3568628, 1, 0, 1,
-0.6369415, -2.536485, -3.288964, 0.3490196, 1, 0, 1,
-0.6321409, -0.08177603, -0.5747203, 0.345098, 1, 0, 1,
-0.6303742, 1.202183, -0.7207272, 0.3372549, 1, 0, 1,
-0.6286216, 0.5799912, -1.233837, 0.3333333, 1, 0, 1,
-0.6239517, -1.432908, -3.592728, 0.3254902, 1, 0, 1,
-0.6234815, 0.2079737, -2.551806, 0.3215686, 1, 0, 1,
-0.6193708, -0.5975145, -0.9000922, 0.3137255, 1, 0, 1,
-0.6192564, -0.08412502, -2.887877, 0.3098039, 1, 0, 1,
-0.6179966, -0.1776192, -1.681461, 0.3019608, 1, 0, 1,
-0.6071877, 0.4264379, 0.08517186, 0.2941177, 1, 0, 1,
-0.6008028, -0.1288618, -0.7714445, 0.2901961, 1, 0, 1,
-0.5947064, -0.4914927, -2.210214, 0.282353, 1, 0, 1,
-0.5930207, -0.4247587, -1.464664, 0.2784314, 1, 0, 1,
-0.5827333, 0.07799397, -1.219305, 0.2705882, 1, 0, 1,
-0.5813647, -1.131211, -2.223233, 0.2666667, 1, 0, 1,
-0.5805352, -2.740783, -1.464202, 0.2588235, 1, 0, 1,
-0.5786653, -1.018103, -3.64072, 0.254902, 1, 0, 1,
-0.5695258, -0.02907795, -1.378032, 0.2470588, 1, 0, 1,
-0.5668089, 1.415813, -1.220328, 0.2431373, 1, 0, 1,
-0.5647717, -1.329585, -3.094761, 0.2352941, 1, 0, 1,
-0.5633481, 1.303947, -0.4012007, 0.2313726, 1, 0, 1,
-0.5609524, -1.523857, -3.407097, 0.2235294, 1, 0, 1,
-0.5588487, -0.1178888, -2.428726, 0.2196078, 1, 0, 1,
-0.5552465, 0.6226914, -0.9165827, 0.2117647, 1, 0, 1,
-0.5501375, -1.659875, -2.082893, 0.2078431, 1, 0, 1,
-0.5468744, 0.1330972, -0.2936884, 0.2, 1, 0, 1,
-0.5467752, 0.2158469, -2.367971, 0.1921569, 1, 0, 1,
-0.5464962, 1.231199, -1.508808, 0.1882353, 1, 0, 1,
-0.5437469, 1.242398, -1.024889, 0.1803922, 1, 0, 1,
-0.5432153, 0.8642842, -1.157046, 0.1764706, 1, 0, 1,
-0.5410674, 0.2985184, 0.5189859, 0.1686275, 1, 0, 1,
-0.5364235, -1.064778, -3.560565, 0.1647059, 1, 0, 1,
-0.5310478, -0.6745093, -3.57315, 0.1568628, 1, 0, 1,
-0.5264962, 0.5055021, -0.7847542, 0.1529412, 1, 0, 1,
-0.5257911, 1.681623, -1.133453, 0.145098, 1, 0, 1,
-0.5252015, 0.5875992, -0.2874997, 0.1411765, 1, 0, 1,
-0.5191375, -0.9982273, -0.6063053, 0.1333333, 1, 0, 1,
-0.5187537, 0.946095, -0.6620949, 0.1294118, 1, 0, 1,
-0.5135643, 1.377065, -1.704704, 0.1215686, 1, 0, 1,
-0.5115066, -1.073264, -2.490731, 0.1176471, 1, 0, 1,
-0.5102267, 1.300522, -2.027949, 0.1098039, 1, 0, 1,
-0.5075469, 0.8266003, -0.7775521, 0.1058824, 1, 0, 1,
-0.5066495, -0.8300797, -3.737059, 0.09803922, 1, 0, 1,
-0.5062513, 0.5590923, -0.4430797, 0.09019608, 1, 0, 1,
-0.5047299, -0.2063591, -2.206616, 0.08627451, 1, 0, 1,
-0.5033758, 0.3348131, -1.289462, 0.07843138, 1, 0, 1,
-0.500569, 0.2892364, -2.071581, 0.07450981, 1, 0, 1,
-0.4933504, 0.4790677, 0.2459583, 0.06666667, 1, 0, 1,
-0.4835985, 0.09293424, -1.298093, 0.0627451, 1, 0, 1,
-0.4791021, -0.308797, -3.34131, 0.05490196, 1, 0, 1,
-0.4776975, 0.2750929, -1.768116, 0.05098039, 1, 0, 1,
-0.4772163, 0.6532998, -0.4185457, 0.04313726, 1, 0, 1,
-0.4755667, -1.009017, -3.299721, 0.03921569, 1, 0, 1,
-0.4745633, -0.4249036, -1.373827, 0.03137255, 1, 0, 1,
-0.4730775, 1.270766, -0.224142, 0.02745098, 1, 0, 1,
-0.4729247, -0.492466, -1.025195, 0.01960784, 1, 0, 1,
-0.4718722, -0.5594407, -2.422933, 0.01568628, 1, 0, 1,
-0.4710022, 0.3296873, -1.135406, 0.007843138, 1, 0, 1,
-0.4678714, 2.756458, -0.6812166, 0.003921569, 1, 0, 1,
-0.4666679, -2.149379, -3.806094, 0, 1, 0.003921569, 1,
-0.4661463, -0.08733015, -0.2333494, 0, 1, 0.01176471, 1,
-0.4655122, 0.3953142, -0.2221822, 0, 1, 0.01568628, 1,
-0.4589696, 0.6433165, 0.08205456, 0, 1, 0.02352941, 1,
-0.4559737, -1.891187, -2.550681, 0, 1, 0.02745098, 1,
-0.4466037, -1.271764, -1.379827, 0, 1, 0.03529412, 1,
-0.4438304, 1.785007, 0.4883624, 0, 1, 0.03921569, 1,
-0.4402858, -0.5804917, -1.924604, 0, 1, 0.04705882, 1,
-0.4399785, -0.8016095, -2.492155, 0, 1, 0.05098039, 1,
-0.4363779, 1.425211, -0.5309148, 0, 1, 0.05882353, 1,
-0.4336453, -1.55362, -5.626199, 0, 1, 0.0627451, 1,
-0.424628, -1.045593, -4.261621, 0, 1, 0.07058824, 1,
-0.4236213, 0.6811888, -1.133897, 0, 1, 0.07450981, 1,
-0.4229389, -0.1737289, -2.407908, 0, 1, 0.08235294, 1,
-0.419408, -0.2031071, -3.324919, 0, 1, 0.08627451, 1,
-0.4192981, -0.7911459, -2.961278, 0, 1, 0.09411765, 1,
-0.4165685, -0.4495876, -2.810447, 0, 1, 0.1019608, 1,
-0.4150033, 1.049944, 1.091711, 0, 1, 0.1058824, 1,
-0.4101653, -1.564509, -3.406151, 0, 1, 0.1137255, 1,
-0.4096935, -0.03443586, -0.7207631, 0, 1, 0.1176471, 1,
-0.4038702, -0.08563577, -0.7913896, 0, 1, 0.1254902, 1,
-0.3994904, 1.174554, -0.1816576, 0, 1, 0.1294118, 1,
-0.3955158, -0.6356396, -2.552695, 0, 1, 0.1372549, 1,
-0.3928944, 0.8066493, -0.4801869, 0, 1, 0.1411765, 1,
-0.3923054, -1.010776, -1.10711, 0, 1, 0.1490196, 1,
-0.3922076, -0.6144766, -3.251725, 0, 1, 0.1529412, 1,
-0.3880183, -1.075711, -4.353697, 0, 1, 0.1607843, 1,
-0.3860736, 1.985198, -1.982228, 0, 1, 0.1647059, 1,
-0.3830071, 0.6787508, 1.808557, 0, 1, 0.172549, 1,
-0.3830022, -0.2134658, -1.012818, 0, 1, 0.1764706, 1,
-0.381974, 0.9421005, 0.4687749, 0, 1, 0.1843137, 1,
-0.3799136, -0.783116, -2.847095, 0, 1, 0.1882353, 1,
-0.3786319, 0.1711109, -2.040556, 0, 1, 0.1960784, 1,
-0.3725857, -0.1345859, -1.53634, 0, 1, 0.2039216, 1,
-0.3720504, 0.6573068, -1.276009, 0, 1, 0.2078431, 1,
-0.3699728, 0.1690503, -3.464064, 0, 1, 0.2156863, 1,
-0.3657894, 0.8323638, 1.069559, 0, 1, 0.2196078, 1,
-0.3649354, 0.1371054, 0.7323074, 0, 1, 0.227451, 1,
-0.3628125, -0.3976987, -3.0009, 0, 1, 0.2313726, 1,
-0.3586848, 1.448983, -1.827968, 0, 1, 0.2392157, 1,
-0.356757, -0.1681265, -0.7809477, 0, 1, 0.2431373, 1,
-0.3556535, -0.8260852, -1.527285, 0, 1, 0.2509804, 1,
-0.3548377, -0.03757405, -1.645259, 0, 1, 0.254902, 1,
-0.3545141, -0.117156, -2.45324, 0, 1, 0.2627451, 1,
-0.3530455, -0.06563441, -1.316191, 0, 1, 0.2666667, 1,
-0.3522503, 0.4027594, -1.473041, 0, 1, 0.2745098, 1,
-0.3514872, 0.01609559, -1.064084, 0, 1, 0.2784314, 1,
-0.3505371, 0.8923837, -0.9474286, 0, 1, 0.2862745, 1,
-0.3473753, 0.1841931, 0.3445845, 0, 1, 0.2901961, 1,
-0.3428054, 0.2199009, 0.2713158, 0, 1, 0.2980392, 1,
-0.3388158, 0.2627341, -2.007572, 0, 1, 0.3058824, 1,
-0.335727, -1.284703, -3.170311, 0, 1, 0.3098039, 1,
-0.3340174, 0.2414171, -0.297047, 0, 1, 0.3176471, 1,
-0.3319244, 1.098527, 0.7419354, 0, 1, 0.3215686, 1,
-0.328775, -1.804856, -1.808517, 0, 1, 0.3294118, 1,
-0.3258269, 0.4748638, -1.24473, 0, 1, 0.3333333, 1,
-0.3243738, -0.01978261, -2.629249, 0, 1, 0.3411765, 1,
-0.3233181, -1.23026, -3.242023, 0, 1, 0.345098, 1,
-0.3225297, -1.27132, -1.741461, 0, 1, 0.3529412, 1,
-0.3224991, 1.030939, 0.3677399, 0, 1, 0.3568628, 1,
-0.3124219, 0.3229315, 0.624151, 0, 1, 0.3647059, 1,
-0.3121025, 0.6947898, -1.183189, 0, 1, 0.3686275, 1,
-0.3114009, -0.6423243, -2.499615, 0, 1, 0.3764706, 1,
-0.3111624, -0.1992325, -1.503405, 0, 1, 0.3803922, 1,
-0.3098163, -0.8300108, -2.61424, 0, 1, 0.3882353, 1,
-0.3003908, -1.116814, -2.805909, 0, 1, 0.3921569, 1,
-0.3001651, -1.1022, -2.638562, 0, 1, 0.4, 1,
-0.2993924, 0.4856028, 1.120479, 0, 1, 0.4078431, 1,
-0.29482, -0.3240258, -3.278733, 0, 1, 0.4117647, 1,
-0.2941241, -0.6107528, -3.630117, 0, 1, 0.4196078, 1,
-0.2933537, -0.1859231, -1.825743, 0, 1, 0.4235294, 1,
-0.2901721, 0.9349332, -0.316097, 0, 1, 0.4313726, 1,
-0.287681, 0.4447355, -0.4776708, 0, 1, 0.4352941, 1,
-0.286924, -0.7039517, -4.305685, 0, 1, 0.4431373, 1,
-0.2858114, 0.9059122, 0.3942531, 0, 1, 0.4470588, 1,
-0.2828499, -0.3105226, -1.774064, 0, 1, 0.454902, 1,
-0.2772246, 1.860173, -1.098338, 0, 1, 0.4588235, 1,
-0.2741709, -2.235157, -3.138926, 0, 1, 0.4666667, 1,
-0.2714045, -0.8930258, -1.770795, 0, 1, 0.4705882, 1,
-0.2711438, -0.1541416, -1.892241, 0, 1, 0.4784314, 1,
-0.263486, 1.109597, -0.5617648, 0, 1, 0.4823529, 1,
-0.2622336, -0.3734824, -2.986228, 0, 1, 0.4901961, 1,
-0.2576568, 1.340444, -1.538027, 0, 1, 0.4941176, 1,
-0.2553058, 0.756508, -0.8243985, 0, 1, 0.5019608, 1,
-0.2508855, 0.1517209, -1.778282, 0, 1, 0.509804, 1,
-0.2490808, 0.676936, -3.108747, 0, 1, 0.5137255, 1,
-0.2476626, -0.2236471, -2.075024, 0, 1, 0.5215687, 1,
-0.2474207, -1.291858, -3.344831, 0, 1, 0.5254902, 1,
-0.2454961, -1.378983, -3.531488, 0, 1, 0.5333334, 1,
-0.2371352, 1.017095, -0.6412076, 0, 1, 0.5372549, 1,
-0.2371167, 0.09968827, 0.2724679, 0, 1, 0.5450981, 1,
-0.235534, -1.042819, -1.463882, 0, 1, 0.5490196, 1,
-0.2354075, 0.8583701, -0.2560485, 0, 1, 0.5568628, 1,
-0.2312852, 1.237169, 0.4715386, 0, 1, 0.5607843, 1,
-0.2257359, 0.2398948, -2.214769, 0, 1, 0.5686275, 1,
-0.2235557, 1.48005, -0.7045718, 0, 1, 0.572549, 1,
-0.2214702, 0.1881606, -2.027209, 0, 1, 0.5803922, 1,
-0.2178864, -1.018333, -3.106368, 0, 1, 0.5843138, 1,
-0.2136763, -0.6358758, -2.900898, 0, 1, 0.5921569, 1,
-0.2095489, -0.2791123, -2.300707, 0, 1, 0.5960785, 1,
-0.2093196, -1.20836, -2.948942, 0, 1, 0.6039216, 1,
-0.2034142, 0.9837133, 2.056933, 0, 1, 0.6117647, 1,
-0.2028082, -0.9988163, -5.870851, 0, 1, 0.6156863, 1,
-0.2011298, 0.1134401, 0.6963932, 0, 1, 0.6235294, 1,
-0.1995529, 0.06773889, 0.4076479, 0, 1, 0.627451, 1,
-0.1975633, -0.5592585, -2.580975, 0, 1, 0.6352941, 1,
-0.1943353, 1.200687, -0.681495, 0, 1, 0.6392157, 1,
-0.1942803, 1.31271, 0.2160237, 0, 1, 0.6470588, 1,
-0.1922607, -0.7521333, -2.977249, 0, 1, 0.6509804, 1,
-0.1902043, 0.03237286, -2.44876, 0, 1, 0.6588235, 1,
-0.1896078, 0.8681126, 0.935743, 0, 1, 0.6627451, 1,
-0.1837053, 1.179645, 0.8121477, 0, 1, 0.6705883, 1,
-0.182029, 0.6991347, -0.5122922, 0, 1, 0.6745098, 1,
-0.1768719, 0.5609807, 0.1986981, 0, 1, 0.682353, 1,
-0.1759801, -0.3894118, -2.930894, 0, 1, 0.6862745, 1,
-0.1718154, -1.397305, -3.531801, 0, 1, 0.6941177, 1,
-0.1706524, -0.9713209, -4.49135, 0, 1, 0.7019608, 1,
-0.1696723, -0.6138778, -3.438236, 0, 1, 0.7058824, 1,
-0.1692052, 0.4128873, 0.8818588, 0, 1, 0.7137255, 1,
-0.1674682, -0.1358851, -3.357451, 0, 1, 0.7176471, 1,
-0.1652847, -0.4539723, -2.813819, 0, 1, 0.7254902, 1,
-0.1635355, -1.937687, -3.845344, 0, 1, 0.7294118, 1,
-0.1634093, -1.272544, -1.590588, 0, 1, 0.7372549, 1,
-0.1582273, -0.5171334, -0.1482042, 0, 1, 0.7411765, 1,
-0.1523445, 0.480002, -0.01245311, 0, 1, 0.7490196, 1,
-0.1504245, 0.9013263, 0.2404678, 0, 1, 0.7529412, 1,
-0.149204, 1.073868, 1.03722, 0, 1, 0.7607843, 1,
-0.1409657, -2.626256, -1.883417, 0, 1, 0.7647059, 1,
-0.140627, -0.3848517, -1.640632, 0, 1, 0.772549, 1,
-0.1387928, 2.016078, -0.5359671, 0, 1, 0.7764706, 1,
-0.1362255, 0.2843952, -0.03124508, 0, 1, 0.7843137, 1,
-0.1344877, -1.635569, -3.578348, 0, 1, 0.7882353, 1,
-0.1344711, 0.02035098, -1.173508, 0, 1, 0.7960784, 1,
-0.1330295, -0.3626056, -2.768252, 0, 1, 0.8039216, 1,
-0.1323915, 0.7025606, -0.03693624, 0, 1, 0.8078431, 1,
-0.128609, 0.446046, -0.7461047, 0, 1, 0.8156863, 1,
-0.1227697, 1.14196, 1.771994, 0, 1, 0.8196079, 1,
-0.1219653, 1.144437, 0.1773337, 0, 1, 0.827451, 1,
-0.1218136, 0.2407041, -1.561598, 0, 1, 0.8313726, 1,
-0.1217694, -0.1243304, -2.044234, 0, 1, 0.8392157, 1,
-0.1212621, 1.215485, 0.08223877, 0, 1, 0.8431373, 1,
-0.1204997, -0.4999072, -3.189538, 0, 1, 0.8509804, 1,
-0.1196192, 1.189922, 0.08650362, 0, 1, 0.854902, 1,
-0.1156714, -1.069069, -4.877059, 0, 1, 0.8627451, 1,
-0.1126889, -1.894338, -2.936785, 0, 1, 0.8666667, 1,
-0.1077012, 0.6435754, 0.647819, 0, 1, 0.8745098, 1,
-0.1049822, 0.4289094, -1.592742, 0, 1, 0.8784314, 1,
-0.1032542, 0.4235172, -0.1287769, 0, 1, 0.8862745, 1,
-0.09531935, -0.1878662, -1.783468, 0, 1, 0.8901961, 1,
-0.08665437, -1.335506, -3.799653, 0, 1, 0.8980392, 1,
-0.0852216, -0.8895819, -2.309467, 0, 1, 0.9058824, 1,
-0.08220027, 0.6281368, -0.9257475, 0, 1, 0.9098039, 1,
-0.08141863, 1.385147, 0.6581577, 0, 1, 0.9176471, 1,
-0.07797365, -0.9443755, -3.872275, 0, 1, 0.9215686, 1,
-0.07740366, -0.02717193, -2.692558, 0, 1, 0.9294118, 1,
-0.07709423, 2.484877, 0.3659814, 0, 1, 0.9333333, 1,
-0.07699377, 0.1155592, -1.214893, 0, 1, 0.9411765, 1,
-0.07186288, -0.1964041, -2.400646, 0, 1, 0.945098, 1,
-0.07018916, -0.05650263, -0.9178526, 0, 1, 0.9529412, 1,
-0.06759222, -0.9424359, -1.982483, 0, 1, 0.9568627, 1,
-0.06548571, -0.6295769, -2.240232, 0, 1, 0.9647059, 1,
-0.06475043, -0.2791495, -2.853656, 0, 1, 0.9686275, 1,
-0.06410742, 2.204931, 0.3874222, 0, 1, 0.9764706, 1,
-0.06273041, -4.199448, -4.152551, 0, 1, 0.9803922, 1,
-0.05224863, 1.714043, 0.6011099, 0, 1, 0.9882353, 1,
-0.05040689, 1.565498, 1.492997, 0, 1, 0.9921569, 1,
-0.04703811, 1.041331, 0.725495, 0, 1, 1, 1,
-0.04328214, 1.157054, -0.9039515, 0, 0.9921569, 1, 1,
-0.04149671, -0.03998179, -4.534625, 0, 0.9882353, 1, 1,
-0.03716245, -0.5809104, -3.634784, 0, 0.9803922, 1, 1,
-0.03645482, 0.656061, 0.0577719, 0, 0.9764706, 1, 1,
-0.0314996, -0.1498112, -3.096996, 0, 0.9686275, 1, 1,
-0.03066866, -0.2125992, -1.764205, 0, 0.9647059, 1, 1,
-0.02955742, 1.327762, -0.9802113, 0, 0.9568627, 1, 1,
-0.02740231, 0.430701, 0.1523359, 0, 0.9529412, 1, 1,
-0.02680634, -0.1488447, -0.8688819, 0, 0.945098, 1, 1,
-0.01919819, 0.6175321, 0.3374726, 0, 0.9411765, 1, 1,
-0.01847542, -1.096653, -3.160635, 0, 0.9333333, 1, 1,
-0.01545824, 0.9759304, -0.417759, 0, 0.9294118, 1, 1,
-0.01509936, -0.3484799, -1.804837, 0, 0.9215686, 1, 1,
-0.01173291, -0.9961296, -2.536036, 0, 0.9176471, 1, 1,
-0.008233919, -0.1042527, -3.931158, 0, 0.9098039, 1, 1,
-0.005170607, -0.2830461, -3.82707, 0, 0.9058824, 1, 1,
-0.005131616, -1.005384, -0.809783, 0, 0.8980392, 1, 1,
-0.002928732, 0.09233543, -0.02542031, 0, 0.8901961, 1, 1,
-0.00186013, -0.9135244, -1.847592, 0, 0.8862745, 1, 1,
0.0005517956, 1.893458, -0.7213542, 0, 0.8784314, 1, 1,
0.00958579, -1.39846, 2.292085, 0, 0.8745098, 1, 1,
0.01092666, -0.6407338, 2.531554, 0, 0.8666667, 1, 1,
0.01105621, -0.4822625, 3.302862, 0, 0.8627451, 1, 1,
0.01261442, 0.3611152, 0.7133219, 0, 0.854902, 1, 1,
0.01522976, 0.8990531, -0.5711314, 0, 0.8509804, 1, 1,
0.02953458, 1.091067, 0.6104257, 0, 0.8431373, 1, 1,
0.02965087, 0.8042372, -0.9800957, 0, 0.8392157, 1, 1,
0.03268431, -1.062382, 1.826523, 0, 0.8313726, 1, 1,
0.04328613, -0.8670182, 3.155924, 0, 0.827451, 1, 1,
0.04401558, -0.3172114, 2.762497, 0, 0.8196079, 1, 1,
0.04510022, -0.09496371, 4.369533, 0, 0.8156863, 1, 1,
0.0487578, 0.6288608, 0.3203973, 0, 0.8078431, 1, 1,
0.05257255, 0.812792, -0.9713095, 0, 0.8039216, 1, 1,
0.05362165, 0.8093867, -1.024462, 0, 0.7960784, 1, 1,
0.05457531, 1.850691, 0.1084058, 0, 0.7882353, 1, 1,
0.05677019, 0.3472466, 1.572132, 0, 0.7843137, 1, 1,
0.05805315, 0.1978467, 2.489382, 0, 0.7764706, 1, 1,
0.05868557, -0.9432003, 3.304944, 0, 0.772549, 1, 1,
0.05940101, 0.6178071, 1.326736, 0, 0.7647059, 1, 1,
0.06047788, 1.642473, 0.780464, 0, 0.7607843, 1, 1,
0.06330075, -0.5473776, 2.735243, 0, 0.7529412, 1, 1,
0.06588001, 0.6864057, 0.3604499, 0, 0.7490196, 1, 1,
0.06882083, 0.1643886, -0.6736843, 0, 0.7411765, 1, 1,
0.07556179, -0.09649962, 3.181179, 0, 0.7372549, 1, 1,
0.07709183, -0.9974985, 3.542073, 0, 0.7294118, 1, 1,
0.07830485, -0.1606133, 2.973897, 0, 0.7254902, 1, 1,
0.0798493, -0.5376315, 3.783005, 0, 0.7176471, 1, 1,
0.08042146, 0.4439269, 1.580945, 0, 0.7137255, 1, 1,
0.08174707, 0.1786263, 0.05225046, 0, 0.7058824, 1, 1,
0.08286388, -0.3064724, 3.184664, 0, 0.6980392, 1, 1,
0.08486097, -0.8268827, 2.552466, 0, 0.6941177, 1, 1,
0.09351604, 0.4007914, 1.199583, 0, 0.6862745, 1, 1,
0.0959751, -1.96799, 1.742983, 0, 0.682353, 1, 1,
0.09690595, 0.1444652, 0.6373025, 0, 0.6745098, 1, 1,
0.09750325, 0.3251322, -0.6573109, 0, 0.6705883, 1, 1,
0.09824084, 1.210982, -0.3857722, 0, 0.6627451, 1, 1,
0.09900714, 1.156953, 0.995627, 0, 0.6588235, 1, 1,
0.09926268, -0.8662487, 3.300953, 0, 0.6509804, 1, 1,
0.1008535, 0.4006247, 0.134081, 0, 0.6470588, 1, 1,
0.1010963, -0.6530873, 3.545493, 0, 0.6392157, 1, 1,
0.1015877, 1.61944, 0.3964007, 0, 0.6352941, 1, 1,
0.1119573, -0.7376091, 3.383868, 0, 0.627451, 1, 1,
0.1145685, -0.627288, 3.234751, 0, 0.6235294, 1, 1,
0.1167876, -0.2190329, 4.737388, 0, 0.6156863, 1, 1,
0.1256414, 0.06929768, 1.3154, 0, 0.6117647, 1, 1,
0.1316677, 0.4103648, 1.163481, 0, 0.6039216, 1, 1,
0.1366439, 0.9033607, -0.6080626, 0, 0.5960785, 1, 1,
0.1395124, 1.142206, 0.4603892, 0, 0.5921569, 1, 1,
0.144665, -0.2119592, 2.889559, 0, 0.5843138, 1, 1,
0.1487251, -1.323097, 2.122651, 0, 0.5803922, 1, 1,
0.149762, -1.591315, 2.834707, 0, 0.572549, 1, 1,
0.1504527, -0.9702495, 2.181543, 0, 0.5686275, 1, 1,
0.1587337, -0.2154471, 4.421018, 0, 0.5607843, 1, 1,
0.1612082, 1.419995, 0.6348357, 0, 0.5568628, 1, 1,
0.1637546, 0.2076903, 0.8196371, 0, 0.5490196, 1, 1,
0.1671953, 1.329562, -0.1490075, 0, 0.5450981, 1, 1,
0.1759325, 0.8368044, 3.089416, 0, 0.5372549, 1, 1,
0.1780512, -0.2469854, 3.690451, 0, 0.5333334, 1, 1,
0.1795336, 0.1752816, 0.1230941, 0, 0.5254902, 1, 1,
0.1804244, 0.05924211, 1.236057, 0, 0.5215687, 1, 1,
0.1833241, -1.310982, 3.868152, 0, 0.5137255, 1, 1,
0.1844235, -0.74133, 1.634272, 0, 0.509804, 1, 1,
0.1848092, -0.3386134, 3.641675, 0, 0.5019608, 1, 1,
0.186125, 1.172704, -1.42708, 0, 0.4941176, 1, 1,
0.1861559, 0.6807285, 0.9648403, 0, 0.4901961, 1, 1,
0.1934012, -0.068339, 3.0752, 0, 0.4823529, 1, 1,
0.1939234, -0.2414627, 1.93469, 0, 0.4784314, 1, 1,
0.1955455, 0.262449, 1.711902, 0, 0.4705882, 1, 1,
0.1995672, -2.030041, 3.312567, 0, 0.4666667, 1, 1,
0.2001855, 0.09427717, 2.689878, 0, 0.4588235, 1, 1,
0.2019707, -0.5395179, 4.562084, 0, 0.454902, 1, 1,
0.2031849, 0.006684114, 1.418957, 0, 0.4470588, 1, 1,
0.2055311, -1.203252, 4.631116, 0, 0.4431373, 1, 1,
0.2060748, -0.1468446, 0.3660009, 0, 0.4352941, 1, 1,
0.2124295, 1.817726, -1.093206, 0, 0.4313726, 1, 1,
0.2132227, -0.344621, 3.047004, 0, 0.4235294, 1, 1,
0.2158255, 1.134706, 0.5117126, 0, 0.4196078, 1, 1,
0.2160688, 0.6208642, 2.579578, 0, 0.4117647, 1, 1,
0.216225, -0.9236056, 1.482199, 0, 0.4078431, 1, 1,
0.2221414, 1.116017, 0.2911859, 0, 0.4, 1, 1,
0.2268992, -0.8843569, 2.775119, 0, 0.3921569, 1, 1,
0.2468709, -0.04400382, 2.562452, 0, 0.3882353, 1, 1,
0.2469531, 0.2643862, 2.579219, 0, 0.3803922, 1, 1,
0.2486196, -0.2105746, 1.650396, 0, 0.3764706, 1, 1,
0.2501096, -1.316815, 3.81338, 0, 0.3686275, 1, 1,
0.2558237, 0.4395776, 0.9658509, 0, 0.3647059, 1, 1,
0.2561451, -1.269818, 2.029218, 0, 0.3568628, 1, 1,
0.2569727, 1.136659, 0.0799854, 0, 0.3529412, 1, 1,
0.2646361, -1.956959, 3.846681, 0, 0.345098, 1, 1,
0.2651071, 0.4498546, -0.1737469, 0, 0.3411765, 1, 1,
0.2701008, -0.5761666, 2.262603, 0, 0.3333333, 1, 1,
0.275496, 1.087922, -0.8126925, 0, 0.3294118, 1, 1,
0.2783451, 0.4595799, -0.5793131, 0, 0.3215686, 1, 1,
0.2827731, 0.86059, 0.3417751, 0, 0.3176471, 1, 1,
0.2845132, -1.081126, 2.806288, 0, 0.3098039, 1, 1,
0.2911679, 0.03019713, 0.02100156, 0, 0.3058824, 1, 1,
0.2926882, 0.1475046, -0.04370994, 0, 0.2980392, 1, 1,
0.2961271, -0.1109133, 3.124786, 0, 0.2901961, 1, 1,
0.2976153, -0.212128, 1.367924, 0, 0.2862745, 1, 1,
0.3012896, 2.810567, -1.723204, 0, 0.2784314, 1, 1,
0.3085029, -0.4381705, 2.768849, 0, 0.2745098, 1, 1,
0.3086674, -0.502053, 2.065882, 0, 0.2666667, 1, 1,
0.3145097, -0.9210911, 2.483595, 0, 0.2627451, 1, 1,
0.3174311, -0.8094166, 1.856387, 0, 0.254902, 1, 1,
0.3218727, 1.061426, 0.8371487, 0, 0.2509804, 1, 1,
0.3233999, 0.5710056, 0.9553949, 0, 0.2431373, 1, 1,
0.323888, -0.2488326, 3.176059, 0, 0.2392157, 1, 1,
0.3244641, -1.842043, 4.161863, 0, 0.2313726, 1, 1,
0.3267831, 0.7857689, 0.493664, 0, 0.227451, 1, 1,
0.3288635, -0.01562225, 0.933701, 0, 0.2196078, 1, 1,
0.3341783, 1.975935, 2.876417, 0, 0.2156863, 1, 1,
0.3352627, 0.9919365, 0.6271749, 0, 0.2078431, 1, 1,
0.3368663, -1.102252, 1.609262, 0, 0.2039216, 1, 1,
0.3375534, -0.6348597, 2.627385, 0, 0.1960784, 1, 1,
0.3386615, 1.03556, -0.1874246, 0, 0.1882353, 1, 1,
0.3428232, -2.101544, 3.549343, 0, 0.1843137, 1, 1,
0.3443125, -0.7402393, 2.172745, 0, 0.1764706, 1, 1,
0.3495232, 0.2014441, 2.730616, 0, 0.172549, 1, 1,
0.3499033, 0.1841676, 1.026712, 0, 0.1647059, 1, 1,
0.3589546, 0.9013643, 1.070815, 0, 0.1607843, 1, 1,
0.359504, -1.149483, 2.047321, 0, 0.1529412, 1, 1,
0.3607537, -0.1305408, 2.900408, 0, 0.1490196, 1, 1,
0.3673562, 0.4787292, 1.056912, 0, 0.1411765, 1, 1,
0.3674798, 0.33289, 1.675657, 0, 0.1372549, 1, 1,
0.3679875, -1.489461, 2.756669, 0, 0.1294118, 1, 1,
0.3741615, -1.008921, 3.012751, 0, 0.1254902, 1, 1,
0.3745025, 0.4989159, 1.167669, 0, 0.1176471, 1, 1,
0.3794249, -1.048371, 2.60545, 0, 0.1137255, 1, 1,
0.3820605, 0.8092557, -0.777163, 0, 0.1058824, 1, 1,
0.3822817, -0.1882002, 1.598883, 0, 0.09803922, 1, 1,
0.3846908, -0.7002812, 2.569823, 0, 0.09411765, 1, 1,
0.3925255, -0.6225846, 2.577749, 0, 0.08627451, 1, 1,
0.3926888, -0.1741397, 1.365548, 0, 0.08235294, 1, 1,
0.3943366, 1.813027, 0.4541246, 0, 0.07450981, 1, 1,
0.3952405, -0.3689541, 2.722348, 0, 0.07058824, 1, 1,
0.3966571, 0.04508072, 2.375475, 0, 0.0627451, 1, 1,
0.3991328, 2.210197, -1.764477, 0, 0.05882353, 1, 1,
0.403042, -0.3549661, 3.151578, 0, 0.05098039, 1, 1,
0.4047276, -0.0309847, 3.081123, 0, 0.04705882, 1, 1,
0.4048594, -1.203595, 2.868595, 0, 0.03921569, 1, 1,
0.4057181, -0.2788043, 0.3502236, 0, 0.03529412, 1, 1,
0.407197, 0.7603885, 1.050269, 0, 0.02745098, 1, 1,
0.4092361, -1.930294, 1.819491, 0, 0.02352941, 1, 1,
0.4102271, -1.433967, 2.405442, 0, 0.01568628, 1, 1,
0.4131962, 0.7136693, 0.4144945, 0, 0.01176471, 1, 1,
0.4134579, -0.880327, 2.303964, 0, 0.003921569, 1, 1,
0.4150429, 0.873587, -0.1870307, 0.003921569, 0, 1, 1,
0.4155679, 0.9164024, 1.135101, 0.007843138, 0, 1, 1,
0.4164592, 0.3662024, -0.489105, 0.01568628, 0, 1, 1,
0.4175443, -1.293967, 2.042167, 0.01960784, 0, 1, 1,
0.4179428, 1.169184, -0.2520504, 0.02745098, 0, 1, 1,
0.4208084, -2.170381, 2.362471, 0.03137255, 0, 1, 1,
0.4273267, 1.79472, 0.2686563, 0.03921569, 0, 1, 1,
0.4358418, -0.3861004, 2.55458, 0.04313726, 0, 1, 1,
0.4358724, 2.006166, 0.2395377, 0.05098039, 0, 1, 1,
0.4397953, -1.911678, 1.951317, 0.05490196, 0, 1, 1,
0.4429197, 0.9910994, 0.5659322, 0.0627451, 0, 1, 1,
0.4469113, 0.09726722, 1.000733, 0.06666667, 0, 1, 1,
0.4505806, -1.370401, 1.934566, 0.07450981, 0, 1, 1,
0.4516252, -0.7997358, 5.164194, 0.07843138, 0, 1, 1,
0.4528242, -0.84079, 3.908383, 0.08627451, 0, 1, 1,
0.4597457, -1.008264, 2.746747, 0.09019608, 0, 1, 1,
0.4600773, -1.60738, 3.029677, 0.09803922, 0, 1, 1,
0.4602096, -0.8530185, 3.482005, 0.1058824, 0, 1, 1,
0.4729804, -2.04777, 3.435079, 0.1098039, 0, 1, 1,
0.4732239, -1.605229, 3.788105, 0.1176471, 0, 1, 1,
0.4768698, -1.165412, 3.696813, 0.1215686, 0, 1, 1,
0.4783462, -0.1631892, -1.037647, 0.1294118, 0, 1, 1,
0.4833162, 1.938488, 0.1053542, 0.1333333, 0, 1, 1,
0.4935357, -1.17363, 3.3993, 0.1411765, 0, 1, 1,
0.5040076, -0.9228741, 3.926027, 0.145098, 0, 1, 1,
0.5098406, 1.47595, 0.4057437, 0.1529412, 0, 1, 1,
0.5137491, 0.6533648, 0.6529958, 0.1568628, 0, 1, 1,
0.5169175, -1.297695, 4.012166, 0.1647059, 0, 1, 1,
0.5176952, -0.2085544, 1.987929, 0.1686275, 0, 1, 1,
0.529248, 1.469022, -0.4406666, 0.1764706, 0, 1, 1,
0.5330577, 0.001707721, 1.035524, 0.1803922, 0, 1, 1,
0.5374256, 2.393951, -1.674501, 0.1882353, 0, 1, 1,
0.5406643, -0.196159, 2.840871, 0.1921569, 0, 1, 1,
0.5426953, -0.9219791, 2.852437, 0.2, 0, 1, 1,
0.5561398, 1.2998, 0.2169968, 0.2078431, 0, 1, 1,
0.5568469, 0.6664984, 0.6478925, 0.2117647, 0, 1, 1,
0.5616484, -0.5965716, 3.124328, 0.2196078, 0, 1, 1,
0.5670963, 0.5653445, 0.07247715, 0.2235294, 0, 1, 1,
0.5680933, 1.883464, 1.060819, 0.2313726, 0, 1, 1,
0.5691764, -0.8009169, 3.725641, 0.2352941, 0, 1, 1,
0.5762045, 0.2293772, 1.140085, 0.2431373, 0, 1, 1,
0.578338, -0.8460926, 1.793727, 0.2470588, 0, 1, 1,
0.5816144, 1.335199, 0.2415686, 0.254902, 0, 1, 1,
0.5868993, -0.4770073, 3.23209, 0.2588235, 0, 1, 1,
0.5887752, -0.7306255, 3.469668, 0.2666667, 0, 1, 1,
0.5902389, 0.9909528, -0.3875593, 0.2705882, 0, 1, 1,
0.5919343, 0.7624443, 0.9493934, 0.2784314, 0, 1, 1,
0.5934296, -0.2143568, 1.714471, 0.282353, 0, 1, 1,
0.5946177, -0.5640169, 2.241982, 0.2901961, 0, 1, 1,
0.5966424, 0.9877346, -0.04080569, 0.2941177, 0, 1, 1,
0.5978411, -0.4950638, 1.718463, 0.3019608, 0, 1, 1,
0.6004459, -0.2049442, 1.543596, 0.3098039, 0, 1, 1,
0.605656, -0.975925, 2.013809, 0.3137255, 0, 1, 1,
0.6195459, -2.273511, 3.394547, 0.3215686, 0, 1, 1,
0.6238464, -0.03408032, 1.900437, 0.3254902, 0, 1, 1,
0.6240219, -0.3851254, 3.472676, 0.3333333, 0, 1, 1,
0.6304947, 1.976053, 0.3837298, 0.3372549, 0, 1, 1,
0.6328353, 1.088082, -0.8056855, 0.345098, 0, 1, 1,
0.6330444, -0.1265309, 0.9114842, 0.3490196, 0, 1, 1,
0.6335821, 0.5072441, -0.3853021, 0.3568628, 0, 1, 1,
0.6360883, -0.4255006, 1.59596, 0.3607843, 0, 1, 1,
0.6373268, -0.2353866, 2.098462, 0.3686275, 0, 1, 1,
0.6511307, 0.1849353, 0.4941208, 0.372549, 0, 1, 1,
0.6537951, 0.06370576, 1.68988, 0.3803922, 0, 1, 1,
0.6565135, 1.682705, 2.024124, 0.3843137, 0, 1, 1,
0.6573501, 0.912726, 1.757671, 0.3921569, 0, 1, 1,
0.659647, -0.6655657, 2.020409, 0.3960784, 0, 1, 1,
0.6610659, -0.106456, 2.352745, 0.4039216, 0, 1, 1,
0.6675982, 1.416822, 1.63691, 0.4117647, 0, 1, 1,
0.6688427, 0.3353545, -1.296215, 0.4156863, 0, 1, 1,
0.6716652, -1.179525, 2.369762, 0.4235294, 0, 1, 1,
0.6733309, 1.31791, -1.300916, 0.427451, 0, 1, 1,
0.6747857, -1.595358, 3.070713, 0.4352941, 0, 1, 1,
0.6777917, 0.2195645, 1.106795, 0.4392157, 0, 1, 1,
0.678028, 0.9667953, -0.5453809, 0.4470588, 0, 1, 1,
0.6813613, -0.0488843, 0.5243832, 0.4509804, 0, 1, 1,
0.6844766, -1.394414, 2.16721, 0.4588235, 0, 1, 1,
0.6883237, -0.1546767, 3.399782, 0.4627451, 0, 1, 1,
0.697104, 0.1416836, 1.983199, 0.4705882, 0, 1, 1,
0.6989142, 1.020833, 0.4392307, 0.4745098, 0, 1, 1,
0.7015694, 2.084766, 1.431148, 0.4823529, 0, 1, 1,
0.7018709, 0.6356388, 1.613151, 0.4862745, 0, 1, 1,
0.7035452, -0.2312497, 1.252788, 0.4941176, 0, 1, 1,
0.7054653, 1.026675, 2.297525, 0.5019608, 0, 1, 1,
0.7061158, 1.257622, 0.887482, 0.5058824, 0, 1, 1,
0.706334, 0.8242686, -0.1375874, 0.5137255, 0, 1, 1,
0.7071491, 1.017895, 1.841019, 0.5176471, 0, 1, 1,
0.7072777, 1.274916, 0.7902496, 0.5254902, 0, 1, 1,
0.7111022, 0.1241277, 1.398795, 0.5294118, 0, 1, 1,
0.7157641, 0.5370888, 1.380301, 0.5372549, 0, 1, 1,
0.7173443, -1.825361, 2.378383, 0.5411765, 0, 1, 1,
0.7245157, 0.5158541, 1.800676, 0.5490196, 0, 1, 1,
0.7252237, -0.3321732, 1.413542, 0.5529412, 0, 1, 1,
0.7353839, -0.6583046, 1.463492, 0.5607843, 0, 1, 1,
0.738042, 1.250639, -0.9359835, 0.5647059, 0, 1, 1,
0.739866, 0.3638063, 2.635282, 0.572549, 0, 1, 1,
0.7406574, 0.2228856, 1.922277, 0.5764706, 0, 1, 1,
0.7408324, -0.4082978, 2.579862, 0.5843138, 0, 1, 1,
0.7416469, -0.1530766, 0.4647655, 0.5882353, 0, 1, 1,
0.7435664, -1.003715, 2.961499, 0.5960785, 0, 1, 1,
0.7481162, -0.09668265, 3.022719, 0.6039216, 0, 1, 1,
0.7502195, 1.542798, 0.8515542, 0.6078432, 0, 1, 1,
0.7502667, 1.424641, 0.4463671, 0.6156863, 0, 1, 1,
0.7503386, 0.3793603, 0.9864509, 0.6196079, 0, 1, 1,
0.7510577, 0.3099587, 1.175991, 0.627451, 0, 1, 1,
0.7601797, -0.3517122, 3.656146, 0.6313726, 0, 1, 1,
0.7620873, 0.7652029, 0.345584, 0.6392157, 0, 1, 1,
0.7641408, 0.5480517, 2.289275, 0.6431373, 0, 1, 1,
0.7682341, 0.8766242, 1.095712, 0.6509804, 0, 1, 1,
0.7697102, -0.4833843, 0.4872213, 0.654902, 0, 1, 1,
0.7703525, -0.9196958, 0.8190043, 0.6627451, 0, 1, 1,
0.7781522, 1.525943, 1.303383, 0.6666667, 0, 1, 1,
0.7801784, 2.451957, 1.954175, 0.6745098, 0, 1, 1,
0.7830988, 0.3471642, 1.243589, 0.6784314, 0, 1, 1,
0.7886932, -0.5660943, 1.466468, 0.6862745, 0, 1, 1,
0.7912214, 0.4150122, 0.1168103, 0.6901961, 0, 1, 1,
0.7942094, 0.3386358, -0.02665697, 0.6980392, 0, 1, 1,
0.7957866, 0.4417562, 3.239707, 0.7058824, 0, 1, 1,
0.7993915, -1.182069, 1.143498, 0.7098039, 0, 1, 1,
0.8058608, -0.2209878, 2.205575, 0.7176471, 0, 1, 1,
0.8085464, 0.6789757, 0.3173216, 0.7215686, 0, 1, 1,
0.8086222, 0.8794282, 0.2339863, 0.7294118, 0, 1, 1,
0.8104268, 0.497594, 1.917632, 0.7333333, 0, 1, 1,
0.8235462, -0.1887692, 0.9900178, 0.7411765, 0, 1, 1,
0.8263488, -1.401264, 2.739505, 0.7450981, 0, 1, 1,
0.8314686, 0.7365512, 0.5026965, 0.7529412, 0, 1, 1,
0.8325113, -1.180027, 2.970951, 0.7568628, 0, 1, 1,
0.833777, -0.3220831, 3.648709, 0.7647059, 0, 1, 1,
0.8362881, -0.2105571, 1.933949, 0.7686275, 0, 1, 1,
0.8375586, -0.4352894, 1.198433, 0.7764706, 0, 1, 1,
0.8379415, 0.2427216, 1.309387, 0.7803922, 0, 1, 1,
0.8437629, -0.4267224, 4.329374, 0.7882353, 0, 1, 1,
0.8475233, 2.287912, 0.2337239, 0.7921569, 0, 1, 1,
0.8505842, 0.5006053, 0.6306961, 0.8, 0, 1, 1,
0.8520616, -0.1323807, 0.4310689, 0.8078431, 0, 1, 1,
0.8539864, -0.3142472, -0.9789103, 0.8117647, 0, 1, 1,
0.8629133, -0.2977538, 3.648533, 0.8196079, 0, 1, 1,
0.8653807, 1.073321, 0.588784, 0.8235294, 0, 1, 1,
0.8662541, -0.7921631, 2.546489, 0.8313726, 0, 1, 1,
0.8723203, 0.08250212, 0.2283639, 0.8352941, 0, 1, 1,
0.8748059, 1.672517, -0.7044038, 0.8431373, 0, 1, 1,
0.875819, -0.2018588, 2.42809, 0.8470588, 0, 1, 1,
0.8768854, 1.735714, -0.8070894, 0.854902, 0, 1, 1,
0.8814228, -1.225948, 3.535254, 0.8588235, 0, 1, 1,
0.8872009, -0.8388332, 2.163007, 0.8666667, 0, 1, 1,
0.8921911, 0.1544411, 3.03915, 0.8705882, 0, 1, 1,
0.8945098, 0.2701623, 1.983809, 0.8784314, 0, 1, 1,
0.8958852, -1.332372, 2.029066, 0.8823529, 0, 1, 1,
0.8975607, 0.7954375, 0.680506, 0.8901961, 0, 1, 1,
0.8979924, -0.8035431, 2.080628, 0.8941177, 0, 1, 1,
0.8990304, -0.05868245, 0.1753807, 0.9019608, 0, 1, 1,
0.8991369, 0.4491416, 2.159953, 0.9098039, 0, 1, 1,
0.9046116, -0.2581677, 2.072534, 0.9137255, 0, 1, 1,
0.9052061, 0.3243286, -0.07746957, 0.9215686, 0, 1, 1,
0.9106766, -0.3175884, 0.06934469, 0.9254902, 0, 1, 1,
0.9130784, 0.02864232, 1.750242, 0.9333333, 0, 1, 1,
0.9130855, 0.6659776, 0.5254952, 0.9372549, 0, 1, 1,
0.9150249, 1.336604, -0.1026922, 0.945098, 0, 1, 1,
0.9276906, 1.562315, -0.07871633, 0.9490196, 0, 1, 1,
0.9380991, -1.002693, 3.651396, 0.9568627, 0, 1, 1,
0.9394694, 0.6234935, 1.264364, 0.9607843, 0, 1, 1,
0.9424198, 1.562002, 2.031184, 0.9686275, 0, 1, 1,
0.9465199, -0.1448531, 1.80713, 0.972549, 0, 1, 1,
0.9471448, 1.427447, 0.9590207, 0.9803922, 0, 1, 1,
0.9581074, -2.257117, 3.215842, 0.9843137, 0, 1, 1,
0.9661726, -0.1935872, 0.8336248, 0.9921569, 0, 1, 1,
0.9663764, 2.52208, 1.193509, 0.9960784, 0, 1, 1,
0.9672042, -0.1373675, 1.832492, 1, 0, 0.9960784, 1,
0.9690063, 0.7741094, 2.105979, 1, 0, 0.9882353, 1,
0.9713306, 0.1242445, 2.649848, 1, 0, 0.9843137, 1,
0.9714468, -1.766471, 1.451811, 1, 0, 0.9764706, 1,
0.9720279, -1.907205, 2.343748, 1, 0, 0.972549, 1,
0.9795178, 1.731375, -0.05620865, 1, 0, 0.9647059, 1,
0.979714, -0.5279888, 1.993381, 1, 0, 0.9607843, 1,
0.9827501, 0.7631608, 0.9130218, 1, 0, 0.9529412, 1,
0.9841875, -0.6099122, 1.072628, 1, 0, 0.9490196, 1,
0.9939737, -0.6878836, 3.158745, 1, 0, 0.9411765, 1,
0.9945018, 0.9156547, 0.4344333, 1, 0, 0.9372549, 1,
0.996928, 1.129855, -0.0483126, 1, 0, 0.9294118, 1,
0.9983255, -0.08268627, 4.060225, 1, 0, 0.9254902, 1,
1.009456, -0.3216106, 2.688517, 1, 0, 0.9176471, 1,
1.014139, -0.2312712, 2.832858, 1, 0, 0.9137255, 1,
1.035665, -0.01727967, 2.027926, 1, 0, 0.9058824, 1,
1.036127, 0.6030455, 2.706465, 1, 0, 0.9019608, 1,
1.049719, -0.9791377, 2.296999, 1, 0, 0.8941177, 1,
1.051923, -0.2003414, 1.992382, 1, 0, 0.8862745, 1,
1.059009, -0.3593243, 0.2632729, 1, 0, 0.8823529, 1,
1.061351, 0.3174248, 0.2631349, 1, 0, 0.8745098, 1,
1.065576, 0.377746, -1.121469, 1, 0, 0.8705882, 1,
1.075707, 0.7075807, 1.225058, 1, 0, 0.8627451, 1,
1.076233, -1.494632, 2.804678, 1, 0, 0.8588235, 1,
1.081656, -0.179828, 0.7392478, 1, 0, 0.8509804, 1,
1.081985, 0.6719074, -0.6951134, 1, 0, 0.8470588, 1,
1.092745, 0.4331285, -0.7363441, 1, 0, 0.8392157, 1,
1.093555, 0.8334793, 2.707571, 1, 0, 0.8352941, 1,
1.09674, -0.996592, 3.467381, 1, 0, 0.827451, 1,
1.109617, 0.9868767, 0.3389103, 1, 0, 0.8235294, 1,
1.113795, 3.482621, -0.08091464, 1, 0, 0.8156863, 1,
1.115805, 0.1056295, 1.531216, 1, 0, 0.8117647, 1,
1.120467, 0.2788563, 2.59127, 1, 0, 0.8039216, 1,
1.128, 1.785618, -0.5913702, 1, 0, 0.7960784, 1,
1.130526, 0.06771451, 1.463956, 1, 0, 0.7921569, 1,
1.13522, 0.8780101, 2.169806, 1, 0, 0.7843137, 1,
1.138961, 0.8638065, -0.01037386, 1, 0, 0.7803922, 1,
1.139461, -0.6071869, 2.863603, 1, 0, 0.772549, 1,
1.140581, -2.419041, 1.700483, 1, 0, 0.7686275, 1,
1.140637, -0.6658643, 3.194779, 1, 0, 0.7607843, 1,
1.141797, 1.20012, 0.3130657, 1, 0, 0.7568628, 1,
1.141919, -1.468735, 2.625, 1, 0, 0.7490196, 1,
1.142671, -1.697982, 1.94969, 1, 0, 0.7450981, 1,
1.144048, 1.77158, 3.514405, 1, 0, 0.7372549, 1,
1.147623, -0.8327364, 3.060478, 1, 0, 0.7333333, 1,
1.153167, -0.2537472, 2.734045, 1, 0, 0.7254902, 1,
1.163292, -0.4175222, 0.3419885, 1, 0, 0.7215686, 1,
1.167025, 1.002676, -0.1620104, 1, 0, 0.7137255, 1,
1.17139, 1.155582, 2.401571, 1, 0, 0.7098039, 1,
1.1731, 1.733153, 0.2892107, 1, 0, 0.7019608, 1,
1.177631, -0.4114366, 1.079436, 1, 0, 0.6941177, 1,
1.179437, -1.205692, -0.2288116, 1, 0, 0.6901961, 1,
1.195147, -0.4876499, 2.135283, 1, 0, 0.682353, 1,
1.197009, 1.535363, 2.627835, 1, 0, 0.6784314, 1,
1.197389, -1.111252, 2.527039, 1, 0, 0.6705883, 1,
1.197961, -1.229086, 3.178086, 1, 0, 0.6666667, 1,
1.201287, 0.4532173, 2.843683, 1, 0, 0.6588235, 1,
1.210069, 0.05832287, -0.3768353, 1, 0, 0.654902, 1,
1.215281, -0.4657851, -0.05352841, 1, 0, 0.6470588, 1,
1.228628, -0.9847454, 2.672329, 1, 0, 0.6431373, 1,
1.256349, -0.3496768, 2.486106, 1, 0, 0.6352941, 1,
1.265652, -0.3670503, 3.41991, 1, 0, 0.6313726, 1,
1.26737, 0.1791399, 3.307575, 1, 0, 0.6235294, 1,
1.270933, -1.004868, 2.594281, 1, 0, 0.6196079, 1,
1.271933, -0.02442876, -0.0704791, 1, 0, 0.6117647, 1,
1.276471, -0.3790787, 2.513774, 1, 0, 0.6078432, 1,
1.280978, -0.7262514, 2.086703, 1, 0, 0.6, 1,
1.288344, 0.3746652, 1.232034, 1, 0, 0.5921569, 1,
1.289, -0.1413862, 2.501146, 1, 0, 0.5882353, 1,
1.293982, 1.475744, -0.214643, 1, 0, 0.5803922, 1,
1.299001, -1.073932, 3.209417, 1, 0, 0.5764706, 1,
1.320444, -1.661324, 3.170542, 1, 0, 0.5686275, 1,
1.326647, 1.672147, 1.340397, 1, 0, 0.5647059, 1,
1.327468, 2.241149, -0.5033797, 1, 0, 0.5568628, 1,
1.327996, -1.796146, 2.134955, 1, 0, 0.5529412, 1,
1.346146, -0.4417701, 1.460164, 1, 0, 0.5450981, 1,
1.347879, -0.7025833, 0.683823, 1, 0, 0.5411765, 1,
1.351968, 0.5692965, -0.9308989, 1, 0, 0.5333334, 1,
1.358362, 0.3840853, 1.47298, 1, 0, 0.5294118, 1,
1.363564, 0.04852591, 0.8641034, 1, 0, 0.5215687, 1,
1.369408, -1.216699, 2.032059, 1, 0, 0.5176471, 1,
1.375999, 0.2471583, 0.8025079, 1, 0, 0.509804, 1,
1.376012, -0.1874166, 0.5382724, 1, 0, 0.5058824, 1,
1.378017, -0.2090508, 1.838833, 1, 0, 0.4980392, 1,
1.386044, -0.5444286, 0.4502908, 1, 0, 0.4901961, 1,
1.403665, 0.4929279, 2.136085, 1, 0, 0.4862745, 1,
1.413196, -0.7041791, 2.877966, 1, 0, 0.4784314, 1,
1.417068, 1.139782, 0.1882814, 1, 0, 0.4745098, 1,
1.425403, 0.01477804, 2.540092, 1, 0, 0.4666667, 1,
1.428591, 0.8251216, 2.195726, 1, 0, 0.4627451, 1,
1.429939, -0.2395247, 1.4166, 1, 0, 0.454902, 1,
1.43497, -0.5560288, 2.984076, 1, 0, 0.4509804, 1,
1.445121, -1.240337, 2.103055, 1, 0, 0.4431373, 1,
1.450421, -0.9465485, 1.179156, 1, 0, 0.4392157, 1,
1.460515, 1.456717, 2.390343, 1, 0, 0.4313726, 1,
1.465196, -1.418264, 2.914059, 1, 0, 0.427451, 1,
1.485188, 0.2961693, 2.319802, 1, 0, 0.4196078, 1,
1.497226, -2.064572, 2.278225, 1, 0, 0.4156863, 1,
1.537296, -1.871664, 2.617517, 1, 0, 0.4078431, 1,
1.537925, -1.496216, 3.678749, 1, 0, 0.4039216, 1,
1.538945, -1.243053, 0.5753301, 1, 0, 0.3960784, 1,
1.551597, 1.671479, 2.27785, 1, 0, 0.3882353, 1,
1.553572, 0.5190938, -0.001441417, 1, 0, 0.3843137, 1,
1.566114, -2.274613, 2.234218, 1, 0, 0.3764706, 1,
1.566602, 0.8799116, -0.08175742, 1, 0, 0.372549, 1,
1.582634, -0.531912, 1.98995, 1, 0, 0.3647059, 1,
1.591596, -0.2148011, 1.969603, 1, 0, 0.3607843, 1,
1.592964, -1.276176, 2.417104, 1, 0, 0.3529412, 1,
1.59958, 0.09778391, 1.795107, 1, 0, 0.3490196, 1,
1.622483, -1.26513, 1.690888, 1, 0, 0.3411765, 1,
1.64385, -2.677591, 2.557167, 1, 0, 0.3372549, 1,
1.643859, 1.767362, 2.54451, 1, 0, 0.3294118, 1,
1.649993, 0.306328, -0.1427564, 1, 0, 0.3254902, 1,
1.654527, 1.27561, -0.6598468, 1, 0, 0.3176471, 1,
1.676821, -0.5261221, 2.066477, 1, 0, 0.3137255, 1,
1.68132, 0.06431385, -1.068881, 1, 0, 0.3058824, 1,
1.684623, -0.5332249, 1.45114, 1, 0, 0.2980392, 1,
1.706169, 0.4369562, 0.8441589, 1, 0, 0.2941177, 1,
1.717999, -0.9245949, 3.007904, 1, 0, 0.2862745, 1,
1.724216, -0.68893, 1.728749, 1, 0, 0.282353, 1,
1.734137, -1.069031, 1.268259, 1, 0, 0.2745098, 1,
1.744884, 0.3974777, 0.2735759, 1, 0, 0.2705882, 1,
1.747293, 0.938897, 1.03021, 1, 0, 0.2627451, 1,
1.754919, 0.9764818, 2.00149, 1, 0, 0.2588235, 1,
1.786004, 0.9422156, -0.02816033, 1, 0, 0.2509804, 1,
1.791093, -0.4812886, 1.695745, 1, 0, 0.2470588, 1,
1.793953, -0.1485182, 0.7181747, 1, 0, 0.2392157, 1,
1.795523, -1.356621, 2.265774, 1, 0, 0.2352941, 1,
1.822323, -0.05925379, 2.106204, 1, 0, 0.227451, 1,
1.847523, 0.7973611, 0.09200745, 1, 0, 0.2235294, 1,
1.860735, 0.2580904, 2.148708, 1, 0, 0.2156863, 1,
1.874617, -0.6126078, 1.80653, 1, 0, 0.2117647, 1,
1.877193, 0.07262862, 3.519584, 1, 0, 0.2039216, 1,
1.879096, 0.138826, 1.925357, 1, 0, 0.1960784, 1,
1.907333, 0.6866415, 1.604985, 1, 0, 0.1921569, 1,
1.953064, 1.007685, 1.936181, 1, 0, 0.1843137, 1,
1.958069, -0.02934531, 2.16225, 1, 0, 0.1803922, 1,
1.97859, 1.280206, -0.1777326, 1, 0, 0.172549, 1,
1.994053, 1.179954, 1.396748, 1, 0, 0.1686275, 1,
2.002198, 0.5039582, 2.388255, 1, 0, 0.1607843, 1,
2.004317, -0.9989517, 3.323336, 1, 0, 0.1568628, 1,
2.008599, -1.833119, 3.467039, 1, 0, 0.1490196, 1,
2.030043, -0.1854869, 2.561165, 1, 0, 0.145098, 1,
2.068585, 0.5906062, 2.584597, 1, 0, 0.1372549, 1,
2.086568, -0.02550964, 1.751622, 1, 0, 0.1333333, 1,
2.090697, -0.2767051, 1.200547, 1, 0, 0.1254902, 1,
2.117872, 0.4369671, 1.592408, 1, 0, 0.1215686, 1,
2.130466, 0.06139807, 1.955131, 1, 0, 0.1137255, 1,
2.133839, -0.2415697, 0.949304, 1, 0, 0.1098039, 1,
2.141091, -0.4247926, 1.610157, 1, 0, 0.1019608, 1,
2.174786, 0.2385367, 2.517894, 1, 0, 0.09411765, 1,
2.182787, 0.5066432, 2.330653, 1, 0, 0.09019608, 1,
2.227406, -0.7079825, 2.095365, 1, 0, 0.08235294, 1,
2.268429, -0.2032924, 2.297456, 1, 0, 0.07843138, 1,
2.296726, 0.1436811, 1.423204, 1, 0, 0.07058824, 1,
2.297073, 0.1267346, -0.5798739, 1, 0, 0.06666667, 1,
2.349607, 0.2148113, 1.675309, 1, 0, 0.05882353, 1,
2.412333, -0.4538731, 1.629575, 1, 0, 0.05490196, 1,
2.42598, 0.4931681, -1.021983, 1, 0, 0.04705882, 1,
2.427572, 0.4534055, 0.8619517, 1, 0, 0.04313726, 1,
2.561851, 0.5252385, 1.315024, 1, 0, 0.03529412, 1,
2.570037, 0.8366593, -1.069061, 1, 0, 0.03137255, 1,
2.639261, -0.497233, 0.6969169, 1, 0, 0.02352941, 1,
2.854687, 0.7140347, 0.1245244, 1, 0, 0.01960784, 1,
3.028011, -0.8126445, 2.393846, 1, 0, 0.01176471, 1,
3.0423, 0.1690789, 2.702919, 1, 0, 0.007843138, 1
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
-0.002211928, -5.501559, -7.741291, 0, -0.5, 0.5, 0.5,
-0.002211928, -5.501559, -7.741291, 1, -0.5, 0.5, 0.5,
-0.002211928, -5.501559, -7.741291, 1, 1.5, 0.5, 0.5,
-0.002211928, -5.501559, -7.741291, 0, 1.5, 0.5, 0.5
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
-4.078813, -0.3584135, -7.741291, 0, -0.5, 0.5, 0.5,
-4.078813, -0.3584135, -7.741291, 1, -0.5, 0.5, 0.5,
-4.078813, -0.3584135, -7.741291, 1, 1.5, 0.5, 0.5,
-4.078813, -0.3584135, -7.741291, 0, 1.5, 0.5, 0.5
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
-4.078813, -5.501559, -0.3533282, 0, -0.5, 0.5, 0.5,
-4.078813, -5.501559, -0.3533282, 1, -0.5, 0.5, 0.5,
-4.078813, -5.501559, -0.3533282, 1, 1.5, 0.5, 0.5,
-4.078813, -5.501559, -0.3533282, 0, 1.5, 0.5, 0.5
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
-3, -4.314679, -6.036376,
3, -4.314679, -6.036376,
-3, -4.314679, -6.036376,
-3, -4.512493, -6.320529,
-2, -4.314679, -6.036376,
-2, -4.512493, -6.320529,
-1, -4.314679, -6.036376,
-1, -4.512493, -6.320529,
0, -4.314679, -6.036376,
0, -4.512493, -6.320529,
1, -4.314679, -6.036376,
1, -4.512493, -6.320529,
2, -4.314679, -6.036376,
2, -4.512493, -6.320529,
3, -4.314679, -6.036376,
3, -4.512493, -6.320529
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
-3, -4.908119, -6.888834, 0, -0.5, 0.5, 0.5,
-3, -4.908119, -6.888834, 1, -0.5, 0.5, 0.5,
-3, -4.908119, -6.888834, 1, 1.5, 0.5, 0.5,
-3, -4.908119, -6.888834, 0, 1.5, 0.5, 0.5,
-2, -4.908119, -6.888834, 0, -0.5, 0.5, 0.5,
-2, -4.908119, -6.888834, 1, -0.5, 0.5, 0.5,
-2, -4.908119, -6.888834, 1, 1.5, 0.5, 0.5,
-2, -4.908119, -6.888834, 0, 1.5, 0.5, 0.5,
-1, -4.908119, -6.888834, 0, -0.5, 0.5, 0.5,
-1, -4.908119, -6.888834, 1, -0.5, 0.5, 0.5,
-1, -4.908119, -6.888834, 1, 1.5, 0.5, 0.5,
-1, -4.908119, -6.888834, 0, 1.5, 0.5, 0.5,
0, -4.908119, -6.888834, 0, -0.5, 0.5, 0.5,
0, -4.908119, -6.888834, 1, -0.5, 0.5, 0.5,
0, -4.908119, -6.888834, 1, 1.5, 0.5, 0.5,
0, -4.908119, -6.888834, 0, 1.5, 0.5, 0.5,
1, -4.908119, -6.888834, 0, -0.5, 0.5, 0.5,
1, -4.908119, -6.888834, 1, -0.5, 0.5, 0.5,
1, -4.908119, -6.888834, 1, 1.5, 0.5, 0.5,
1, -4.908119, -6.888834, 0, 1.5, 0.5, 0.5,
2, -4.908119, -6.888834, 0, -0.5, 0.5, 0.5,
2, -4.908119, -6.888834, 1, -0.5, 0.5, 0.5,
2, -4.908119, -6.888834, 1, 1.5, 0.5, 0.5,
2, -4.908119, -6.888834, 0, 1.5, 0.5, 0.5,
3, -4.908119, -6.888834, 0, -0.5, 0.5, 0.5,
3, -4.908119, -6.888834, 1, -0.5, 0.5, 0.5,
3, -4.908119, -6.888834, 1, 1.5, 0.5, 0.5,
3, -4.908119, -6.888834, 0, 1.5, 0.5, 0.5
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
-3.138059, -4, -6.036376,
-3.138059, 2, -6.036376,
-3.138059, -4, -6.036376,
-3.294851, -4, -6.320529,
-3.138059, -2, -6.036376,
-3.294851, -2, -6.320529,
-3.138059, 0, -6.036376,
-3.294851, 0, -6.320529,
-3.138059, 2, -6.036376,
-3.294851, 2, -6.320529
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
"-4",
"-2",
"0",
"2"
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
-3.608436, -4, -6.888834, 0, -0.5, 0.5, 0.5,
-3.608436, -4, -6.888834, 1, -0.5, 0.5, 0.5,
-3.608436, -4, -6.888834, 1, 1.5, 0.5, 0.5,
-3.608436, -4, -6.888834, 0, 1.5, 0.5, 0.5,
-3.608436, -2, -6.888834, 0, -0.5, 0.5, 0.5,
-3.608436, -2, -6.888834, 1, -0.5, 0.5, 0.5,
-3.608436, -2, -6.888834, 1, 1.5, 0.5, 0.5,
-3.608436, -2, -6.888834, 0, 1.5, 0.5, 0.5,
-3.608436, 0, -6.888834, 0, -0.5, 0.5, 0.5,
-3.608436, 0, -6.888834, 1, -0.5, 0.5, 0.5,
-3.608436, 0, -6.888834, 1, 1.5, 0.5, 0.5,
-3.608436, 0, -6.888834, 0, 1.5, 0.5, 0.5,
-3.608436, 2, -6.888834, 0, -0.5, 0.5, 0.5,
-3.608436, 2, -6.888834, 1, -0.5, 0.5, 0.5,
-3.608436, 2, -6.888834, 1, 1.5, 0.5, 0.5,
-3.608436, 2, -6.888834, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.138059, -4.314679, -4,
-3.138059, -4.314679, 4,
-3.138059, -4.314679, -4,
-3.294851, -4.512493, -4,
-3.138059, -4.314679, -2,
-3.294851, -4.512493, -2,
-3.138059, -4.314679, 0,
-3.294851, -4.512493, 0,
-3.138059, -4.314679, 2,
-3.294851, -4.512493, 2,
-3.138059, -4.314679, 4,
-3.294851, -4.512493, 4
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
-3.608436, -4.908119, -4, 0, -0.5, 0.5, 0.5,
-3.608436, -4.908119, -4, 1, -0.5, 0.5, 0.5,
-3.608436, -4.908119, -4, 1, 1.5, 0.5, 0.5,
-3.608436, -4.908119, -4, 0, 1.5, 0.5, 0.5,
-3.608436, -4.908119, -2, 0, -0.5, 0.5, 0.5,
-3.608436, -4.908119, -2, 1, -0.5, 0.5, 0.5,
-3.608436, -4.908119, -2, 1, 1.5, 0.5, 0.5,
-3.608436, -4.908119, -2, 0, 1.5, 0.5, 0.5,
-3.608436, -4.908119, 0, 0, -0.5, 0.5, 0.5,
-3.608436, -4.908119, 0, 1, -0.5, 0.5, 0.5,
-3.608436, -4.908119, 0, 1, 1.5, 0.5, 0.5,
-3.608436, -4.908119, 0, 0, 1.5, 0.5, 0.5,
-3.608436, -4.908119, 2, 0, -0.5, 0.5, 0.5,
-3.608436, -4.908119, 2, 1, -0.5, 0.5, 0.5,
-3.608436, -4.908119, 2, 1, 1.5, 0.5, 0.5,
-3.608436, -4.908119, 2, 0, 1.5, 0.5, 0.5,
-3.608436, -4.908119, 4, 0, -0.5, 0.5, 0.5,
-3.608436, -4.908119, 4, 1, -0.5, 0.5, 0.5,
-3.608436, -4.908119, 4, 1, 1.5, 0.5, 0.5,
-3.608436, -4.908119, 4, 0, 1.5, 0.5, 0.5
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
-3.138059, -4.314679, -6.036376,
-3.138059, 3.597852, -6.036376,
-3.138059, -4.314679, 5.32972,
-3.138059, 3.597852, 5.32972,
-3.138059, -4.314679, -6.036376,
-3.138059, -4.314679, 5.32972,
-3.138059, 3.597852, -6.036376,
-3.138059, 3.597852, 5.32972,
-3.138059, -4.314679, -6.036376,
3.133635, -4.314679, -6.036376,
-3.138059, -4.314679, 5.32972,
3.133635, -4.314679, 5.32972,
-3.138059, 3.597852, -6.036376,
3.133635, 3.597852, -6.036376,
-3.138059, 3.597852, 5.32972,
3.133635, 3.597852, 5.32972,
3.133635, -4.314679, -6.036376,
3.133635, 3.597852, -6.036376,
3.133635, -4.314679, 5.32972,
3.133635, 3.597852, 5.32972,
3.133635, -4.314679, -6.036376,
3.133635, -4.314679, 5.32972,
3.133635, 3.597852, -6.036376,
3.133635, 3.597852, 5.32972
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
var radius = 8.118093;
var distance = 36.11831;
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
mvMatrix.translate( 0.002211928, 0.3584135, 0.3533282 );
mvMatrix.scale( 1.399533, 1.109309, 0.7722477 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.11831);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
propane<-read.table("propane.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-propane$V2
```

```
## Error in eval(expr, envir, enclos): object 'propane' not found
```

```r
y<-propane$V3
```

```
## Error in eval(expr, envir, enclos): object 'propane' not found
```

```r
z<-propane$V4
```

```
## Error in eval(expr, envir, enclos): object 'propane' not found
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
-3.046724, -0.5139118, -2.921766, 0, 0, 1, 1, 1,
-2.929167, 1.364496, -1.993575, 1, 0, 0, 1, 1,
-2.791389, -1.195406, -0.6996578, 1, 0, 0, 1, 1,
-2.704273, -2.475068, -2.919465, 1, 0, 0, 1, 1,
-2.655883, 0.9113062, -1.899972, 1, 0, 0, 1, 1,
-2.635472, 1.955891, -0.8408002, 1, 0, 0, 1, 1,
-2.487255, -0.4702381, -3.027575, 0, 0, 0, 1, 1,
-2.469769, 0.4759714, 0.7106563, 0, 0, 0, 1, 1,
-2.445118, 0.02440995, -2.166713, 0, 0, 0, 1, 1,
-2.350624, 0.500877, -1.578358, 0, 0, 0, 1, 1,
-2.318652, -0.0159975, -2.159561, 0, 0, 0, 1, 1,
-2.27765, -0.08282939, -2.533101, 0, 0, 0, 1, 1,
-2.266689, -1.138962, -3.025299, 0, 0, 0, 1, 1,
-2.250931, -0.4519593, -1.453781, 1, 1, 1, 1, 1,
-2.237806, 1.062157, -0.7026994, 1, 1, 1, 1, 1,
-2.234423, 0.1154556, -2.27455, 1, 1, 1, 1, 1,
-2.228469, -0.1981813, -3.384034, 1, 1, 1, 1, 1,
-2.140048, 0.7834442, -1.998331, 1, 1, 1, 1, 1,
-2.12998, 1.258343, -1.126052, 1, 1, 1, 1, 1,
-2.116706, 0.3389291, -2.588495, 1, 1, 1, 1, 1,
-2.103399, 1.121811, -2.658996, 1, 1, 1, 1, 1,
-2.092787, -0.2580198, -0.6487084, 1, 1, 1, 1, 1,
-2.088448, 1.019681, -0.3498949, 1, 1, 1, 1, 1,
-2.060829, 1.317392, -2.148251, 1, 1, 1, 1, 1,
-1.985653, 0.9789147, -3.240516, 1, 1, 1, 1, 1,
-1.981209, 0.04117875, 0.2172184, 1, 1, 1, 1, 1,
-1.961815, 1.379921, -1.46114, 1, 1, 1, 1, 1,
-1.96052, -1.170458, -1.816367, 1, 1, 1, 1, 1,
-1.950093, 0.8435408, -0.2419949, 0, 0, 1, 1, 1,
-1.944471, 0.8433632, -1.576399, 1, 0, 0, 1, 1,
-1.937608, 1.874588, 0.02172457, 1, 0, 0, 1, 1,
-1.915914, 0.5520573, -3.563239, 1, 0, 0, 1, 1,
-1.900774, -0.4523682, -4.26009, 1, 0, 0, 1, 1,
-1.90012, -0.09988845, -4.173403, 1, 0, 0, 1, 1,
-1.895782, 1.078686, -2.212039, 0, 0, 0, 1, 1,
-1.888522, 1.382482, 0.1118857, 0, 0, 0, 1, 1,
-1.852431, 0.7065912, -0.6155249, 0, 0, 0, 1, 1,
-1.848956, -0.4698661, -0.5101746, 0, 0, 0, 1, 1,
-1.846056, 1.55825, -1.515016, 0, 0, 0, 1, 1,
-1.829033, -0.7705203, -2.159014, 0, 0, 0, 1, 1,
-1.826241, 1.449354, 0.06596953, 0, 0, 0, 1, 1,
-1.823909, 0.3628071, -0.2867067, 1, 1, 1, 1, 1,
-1.823756, 0.8620067, -0.7939934, 1, 1, 1, 1, 1,
-1.822348, -0.7840267, -2.564657, 1, 1, 1, 1, 1,
-1.819882, 0.06881157, -1.219405, 1, 1, 1, 1, 1,
-1.794074, 0.4274213, -0.2422357, 1, 1, 1, 1, 1,
-1.786512, -1.068417, -2.863575, 1, 1, 1, 1, 1,
-1.737063, 1.580651, -0.6943666, 1, 1, 1, 1, 1,
-1.729699, -1.510638, -0.8844309, 1, 1, 1, 1, 1,
-1.72312, -0.3051621, -2.178916, 1, 1, 1, 1, 1,
-1.704093, 0.8691299, -2.364861, 1, 1, 1, 1, 1,
-1.677039, -0.8512582, -0.3256628, 1, 1, 1, 1, 1,
-1.659997, 0.34934, -1.616361, 1, 1, 1, 1, 1,
-1.652071, -1.691117, -3.4042, 1, 1, 1, 1, 1,
-1.646569, 0.9105332, -1.173438, 1, 1, 1, 1, 1,
-1.63973, -0.6786131, -2.918951, 1, 1, 1, 1, 1,
-1.635728, -0.6849155, -2.383436, 0, 0, 1, 1, 1,
-1.635417, -0.339107, -1.147792, 1, 0, 0, 1, 1,
-1.612026, -1.76165, -0.02179438, 1, 0, 0, 1, 1,
-1.606833, 0.6189994, -1.32723, 1, 0, 0, 1, 1,
-1.605298, 0.6035866, -1.406488, 1, 0, 0, 1, 1,
-1.600243, 0.7094775, -1.033503, 1, 0, 0, 1, 1,
-1.599665, 1.324075, 0.1326867, 0, 0, 0, 1, 1,
-1.597303, -0.3399558, -1.279243, 0, 0, 0, 1, 1,
-1.589216, -0.7261624, -1.848599, 0, 0, 0, 1, 1,
-1.587748, 0.04495152, -1.246116, 0, 0, 0, 1, 1,
-1.584323, 0.7867678, 0.574374, 0, 0, 0, 1, 1,
-1.582549, 0.7743071, -0.7680459, 0, 0, 0, 1, 1,
-1.57935, 0.5605445, -3.120927, 0, 0, 0, 1, 1,
-1.558671, -0.2480965, -2.213867, 1, 1, 1, 1, 1,
-1.538228, 1.051399, -0.44707, 1, 1, 1, 1, 1,
-1.53456, -1.715225, -1.905355, 1, 1, 1, 1, 1,
-1.533797, -0.6250945, -1.288962, 1, 1, 1, 1, 1,
-1.533629, -0.6322069, -2.051931, 1, 1, 1, 1, 1,
-1.528205, 0.3352881, -2.031169, 1, 1, 1, 1, 1,
-1.525227, -0.8155533, -1.149189, 1, 1, 1, 1, 1,
-1.523643, -2.452203, -1.496247, 1, 1, 1, 1, 1,
-1.518347, -0.6222424, -2.317047, 1, 1, 1, 1, 1,
-1.514938, -1.107943, -0.8228573, 1, 1, 1, 1, 1,
-1.499568, -0.4317285, -0.5950952, 1, 1, 1, 1, 1,
-1.494842, -0.5814714, -2.741095, 1, 1, 1, 1, 1,
-1.493949, 1.654657, -1.557791, 1, 1, 1, 1, 1,
-1.491636, -0.08895922, -1.53896, 1, 1, 1, 1, 1,
-1.485423, 0.2344034, -1.626943, 1, 1, 1, 1, 1,
-1.470517, 2.519188, -1.022811, 0, 0, 1, 1, 1,
-1.449507, -2.054013, -2.064596, 1, 0, 0, 1, 1,
-1.446838, 2.039929, -1.126734, 1, 0, 0, 1, 1,
-1.437772, 0.6215141, 0.05070085, 1, 0, 0, 1, 1,
-1.436321, 1.3369, -0.8423086, 1, 0, 0, 1, 1,
-1.40646, -0.3239425, -2.290768, 1, 0, 0, 1, 1,
-1.403025, -0.6652054, -0.7469549, 0, 0, 0, 1, 1,
-1.39854, -0.5693697, -2.063046, 0, 0, 0, 1, 1,
-1.397249, 0.3431019, -0.3392225, 0, 0, 0, 1, 1,
-1.396689, -1.116425, -0.7502019, 0, 0, 0, 1, 1,
-1.394425, -1.628669, -2.885369, 0, 0, 0, 1, 1,
-1.384527, -1.383736, -3.90346, 0, 0, 0, 1, 1,
-1.378769, 0.6519108, 0.05893636, 0, 0, 0, 1, 1,
-1.377732, 0.7394464, -0.4892225, 1, 1, 1, 1, 1,
-1.375737, -2.259385, -2.525173, 1, 1, 1, 1, 1,
-1.374836, -0.7234182, -2.184683, 1, 1, 1, 1, 1,
-1.374827, 0.7040694, -1.006968, 1, 1, 1, 1, 1,
-1.366767, 0.2226938, -1.910685, 1, 1, 1, 1, 1,
-1.362163, 0.4428114, -3.194558, 1, 1, 1, 1, 1,
-1.361193, -0.7588971, -2.982238, 1, 1, 1, 1, 1,
-1.352518, -0.5219663, -1.448693, 1, 1, 1, 1, 1,
-1.349091, 0.810283, -0.7819698, 1, 1, 1, 1, 1,
-1.33465, -0.9934637, -1.44134, 1, 1, 1, 1, 1,
-1.331222, -0.1606068, -1.87448, 1, 1, 1, 1, 1,
-1.327093, -1.37132, -1.176985, 1, 1, 1, 1, 1,
-1.324551, -0.9271551, -1.39176, 1, 1, 1, 1, 1,
-1.321635, -0.1031007, -1.643255, 1, 1, 1, 1, 1,
-1.312211, -0.7926463, -2.745261, 1, 1, 1, 1, 1,
-1.309926, -0.195039, -1.73958, 0, 0, 1, 1, 1,
-1.305906, 1.068993, -0.9684191, 1, 0, 0, 1, 1,
-1.305352, -0.7762375, -2.239214, 1, 0, 0, 1, 1,
-1.282125, -0.1286511, -1.254453, 1, 0, 0, 1, 1,
-1.281492, 0.4511965, 0.8301931, 1, 0, 0, 1, 1,
-1.276926, 0.6124051, -3.059308, 1, 0, 0, 1, 1,
-1.271641, -1.505281, -2.848974, 0, 0, 0, 1, 1,
-1.267227, 0.2039027, -0.2036981, 0, 0, 0, 1, 1,
-1.26319, -0.9802677, -1.028772, 0, 0, 0, 1, 1,
-1.257638, -1.125227, -2.438104, 0, 0, 0, 1, 1,
-1.254751, 0.7355518, -0.4962544, 0, 0, 0, 1, 1,
-1.25309, -0.1118244, -2.670741, 0, 0, 0, 1, 1,
-1.252426, -1.638546, -2.788858, 0, 0, 0, 1, 1,
-1.241704, -0.4263753, -3.046524, 1, 1, 1, 1, 1,
-1.241356, -0.5113549, -1.481359, 1, 1, 1, 1, 1,
-1.241323, -1.912845, -2.499945, 1, 1, 1, 1, 1,
-1.237158, -0.2520978, 0.5352837, 1, 1, 1, 1, 1,
-1.235724, -0.5406294, -1.533069, 1, 1, 1, 1, 1,
-1.233356, -0.7068022, -2.769857, 1, 1, 1, 1, 1,
-1.232994, 1.630744, -0.7292358, 1, 1, 1, 1, 1,
-1.224027, 0.08230235, -1.79054, 1, 1, 1, 1, 1,
-1.220848, -0.2776329, -1.178357, 1, 1, 1, 1, 1,
-1.212237, 1.06746, -0.6812785, 1, 1, 1, 1, 1,
-1.206782, 1.022313, -1.646045, 1, 1, 1, 1, 1,
-1.206145, -0.4657432, 0.1013617, 1, 1, 1, 1, 1,
-1.198579, -0.04423288, -2.501749, 1, 1, 1, 1, 1,
-1.186941, -0.3076418, -2.303655, 1, 1, 1, 1, 1,
-1.186017, 0.5980687, 0.3245786, 1, 1, 1, 1, 1,
-1.185901, 1.188972, -0.06422116, 0, 0, 1, 1, 1,
-1.181595, 0.3422502, -2.207138, 1, 0, 0, 1, 1,
-1.180586, -0.6101365, -2.072276, 1, 0, 0, 1, 1,
-1.173396, -0.3910534, 0.2419064, 1, 0, 0, 1, 1,
-1.156221, 1.044755, -0.9614927, 1, 0, 0, 1, 1,
-1.153649, -0.1863188, -2.657889, 1, 0, 0, 1, 1,
-1.150706, -2.292302, -3.868351, 0, 0, 0, 1, 1,
-1.147394, 0.1136735, -0.7224979, 0, 0, 0, 1, 1,
-1.139394, 2.681395, -0.1658458, 0, 0, 0, 1, 1,
-1.139262, -0.6690686, -2.670882, 0, 0, 0, 1, 1,
-1.136705, 0.6596806, -1.294477, 0, 0, 0, 1, 1,
-1.128142, 0.4306309, 0.4735916, 0, 0, 0, 1, 1,
-1.126536, 0.966511, 0.7143992, 0, 0, 0, 1, 1,
-1.109672, 1.420648, -0.1827106, 1, 1, 1, 1, 1,
-1.089496, -0.05809124, -1.6672, 1, 1, 1, 1, 1,
-1.081428, 0.1521369, -1.83948, 1, 1, 1, 1, 1,
-1.079489, 0.8109039, -1.085721, 1, 1, 1, 1, 1,
-1.077734, -0.6499439, -2.210366, 1, 1, 1, 1, 1,
-1.070835, -0.01371586, -2.532439, 1, 1, 1, 1, 1,
-1.04668, -1.227, -1.274604, 1, 1, 1, 1, 1,
-1.024557, -0.8169842, -3.857388, 1, 1, 1, 1, 1,
-1.024343, -1.088674, -1.026172, 1, 1, 1, 1, 1,
-1.023543, -0.2771638, -1.715653, 1, 1, 1, 1, 1,
-1.019399, 3.325457, -0.1015065, 1, 1, 1, 1, 1,
-1.014067, -1.04123, -2.658228, 1, 1, 1, 1, 1,
-1.008206, 0.8331447, -0.694063, 1, 1, 1, 1, 1,
-1.008129, -0.5058465, -1.225338, 1, 1, 1, 1, 1,
-1.002829, -1.751346, -4.198973, 1, 1, 1, 1, 1,
-1.002228, -0.02271333, 0.4037944, 0, 0, 1, 1, 1,
-0.9910573, 0.0690846, -1.467054, 1, 0, 0, 1, 1,
-0.9868888, 1.576687, -0.7551854, 1, 0, 0, 1, 1,
-0.983031, -0.3431676, -1.621885, 1, 0, 0, 1, 1,
-0.9805216, -0.2991522, -2.768073, 1, 0, 0, 1, 1,
-0.9772277, 0.4823455, -4.341746, 1, 0, 0, 1, 1,
-0.9769628, -1.058392, -1.247585, 0, 0, 0, 1, 1,
-0.9734539, 0.9566345, -1.378571, 0, 0, 0, 1, 1,
-0.9731744, 2.142547, -0.1187735, 0, 0, 0, 1, 1,
-0.968013, 0.2796261, -3.766657, 0, 0, 0, 1, 1,
-0.9677495, 0.07610847, -0.4693756, 0, 0, 0, 1, 1,
-0.9657708, 0.8760003, -1.6788, 0, 0, 0, 1, 1,
-0.9653571, -0.5358135, -1.59659, 0, 0, 0, 1, 1,
-0.9649945, -0.05836027, -1.828684, 1, 1, 1, 1, 1,
-0.9632623, -0.8900617, -0.9708109, 1, 1, 1, 1, 1,
-0.9578404, 0.3675121, -0.7131319, 1, 1, 1, 1, 1,
-0.9562607, 0.3025206, -1.527042, 1, 1, 1, 1, 1,
-0.9483171, -1.304642, -2.142078, 1, 1, 1, 1, 1,
-0.9466482, 1.515497, -0.947367, 1, 1, 1, 1, 1,
-0.9455047, 0.8940794, -3.232827, 1, 1, 1, 1, 1,
-0.9435749, -0.6275468, -1.931725, 1, 1, 1, 1, 1,
-0.9427558, -1.258199, -1.966641, 1, 1, 1, 1, 1,
-0.9421667, -1.17364, -2.987518, 1, 1, 1, 1, 1,
-0.9333448, 2.556714, -0.691193, 1, 1, 1, 1, 1,
-0.9306932, 0.5483349, 0.1400862, 1, 1, 1, 1, 1,
-0.9297627, 1.200304, -0.9176695, 1, 1, 1, 1, 1,
-0.9235148, 0.4716941, 0.6232644, 1, 1, 1, 1, 1,
-0.9170141, 1.032277, -1.337469, 1, 1, 1, 1, 1,
-0.9117187, 0.7534684, -2.251457, 0, 0, 1, 1, 1,
-0.9067463, -0.7738829, -2.027748, 1, 0, 0, 1, 1,
-0.9031137, -0.2493549, -3.100812, 1, 0, 0, 1, 1,
-0.8991795, -0.3880587, -0.8237844, 1, 0, 0, 1, 1,
-0.8810088, -0.01543987, -0.496639, 1, 0, 0, 1, 1,
-0.8770521, 0.1261192, -1.666009, 1, 0, 0, 1, 1,
-0.8768417, 0.9847727, -1.01055, 0, 0, 0, 1, 1,
-0.8722665, -0.0539278, -1.702136, 0, 0, 0, 1, 1,
-0.8716838, -1.180961, -2.382045, 0, 0, 0, 1, 1,
-0.8682347, -1.400817, -1.79401, 0, 0, 0, 1, 1,
-0.8665519, -1.132091, -0.3542264, 0, 0, 0, 1, 1,
-0.8616583, -0.4664264, -3.856227, 0, 0, 0, 1, 1,
-0.8603452, -1.322545, -2.530209, 0, 0, 0, 1, 1,
-0.8573562, 0.3537679, -0.5946541, 1, 1, 1, 1, 1,
-0.8474948, -0.07653161, -3.00691, 1, 1, 1, 1, 1,
-0.8467428, 1.430238, -1.289031, 1, 1, 1, 1, 1,
-0.8366849, -1.405502, -1.934392, 1, 1, 1, 1, 1,
-0.8346786, 0.6849628, -2.150095, 1, 1, 1, 1, 1,
-0.8276842, 0.5860046, -1.381439, 1, 1, 1, 1, 1,
-0.8225535, -0.376893, -3.247128, 1, 1, 1, 1, 1,
-0.8210112, 0.5581535, -1.052288, 1, 1, 1, 1, 1,
-0.8173189, -0.5688555, -3.058864, 1, 1, 1, 1, 1,
-0.8149534, -1.405182, -2.036054, 1, 1, 1, 1, 1,
-0.8141002, -0.2980675, -1.295785, 1, 1, 1, 1, 1,
-0.8140046, 0.695151, -2.005098, 1, 1, 1, 1, 1,
-0.8051548, 0.308172, -0.4409334, 1, 1, 1, 1, 1,
-0.8042742, -0.3245316, -3.248959, 1, 1, 1, 1, 1,
-0.8034855, 1.659761, -1.413168, 1, 1, 1, 1, 1,
-0.8011263, 0.838617, -2.045597, 0, 0, 1, 1, 1,
-0.797289, -0.4781139, -1.589311, 1, 0, 0, 1, 1,
-0.7924908, 1.444759, 0.908334, 1, 0, 0, 1, 1,
-0.7919933, -0.7114255, -2.550842, 1, 0, 0, 1, 1,
-0.7871447, 0.648922, -0.9435541, 1, 0, 0, 1, 1,
-0.7807076, -0.959541, -2.866373, 1, 0, 0, 1, 1,
-0.7802876, -1.187079, -3.461723, 0, 0, 0, 1, 1,
-0.7759947, -1.2645, -3.075955, 0, 0, 0, 1, 1,
-0.7746971, -0.123374, -0.9912598, 0, 0, 0, 1, 1,
-0.7730886, 0.7566789, -0.810938, 0, 0, 0, 1, 1,
-0.7717845, -0.8107832, -3.027491, 0, 0, 0, 1, 1,
-0.7715253, -0.5716122, -3.131784, 0, 0, 0, 1, 1,
-0.7645413, 0.6463767, 0.0234372, 0, 0, 0, 1, 1,
-0.7624148, 0.7851954, -0.3151418, 1, 1, 1, 1, 1,
-0.7572119, -0.4888348, -1.686284, 1, 1, 1, 1, 1,
-0.7551705, 0.5048071, -0.8414212, 1, 1, 1, 1, 1,
-0.7521077, 0.6189634, 0.3985598, 1, 1, 1, 1, 1,
-0.7502858, -1.233839, -4.547669, 1, 1, 1, 1, 1,
-0.7422233, 0.4400096, -0.4241501, 1, 1, 1, 1, 1,
-0.7394678, -0.2015167, -2.217344, 1, 1, 1, 1, 1,
-0.7381138, 1.536396, 0.2103692, 1, 1, 1, 1, 1,
-0.7363284, -1.813576, -2.517475, 1, 1, 1, 1, 1,
-0.7338322, -0.8642704, -1.757845, 1, 1, 1, 1, 1,
-0.7313584, 1.250273, -0.8374951, 1, 1, 1, 1, 1,
-0.731261, -0.9740182, -2.738521, 1, 1, 1, 1, 1,
-0.7275781, -1.173932, -3.28563, 1, 1, 1, 1, 1,
-0.7256557, 0.5306599, -2.02316, 1, 1, 1, 1, 1,
-0.7243305, -0.5380915, -3.402346, 1, 1, 1, 1, 1,
-0.7173402, -0.2547561, -1.958212, 0, 0, 1, 1, 1,
-0.7158933, -1.201874, -2.428351, 1, 0, 0, 1, 1,
-0.7148235, 0.002516576, 0.4305249, 1, 0, 0, 1, 1,
-0.7119949, -0.3449026, -2.106067, 1, 0, 0, 1, 1,
-0.7093893, -0.04524952, -1.03094, 1, 0, 0, 1, 1,
-0.708897, 0.01800222, -0.09241538, 1, 0, 0, 1, 1,
-0.7056276, 0.8207114, -0.5709499, 0, 0, 0, 1, 1,
-0.7041348, -0.1376597, -1.516592, 0, 0, 0, 1, 1,
-0.700353, -0.4245124, -2.035938, 0, 0, 0, 1, 1,
-0.6944011, 0.4297439, -0.3835583, 0, 0, 0, 1, 1,
-0.6904441, -0.1127755, -2.926959, 0, 0, 0, 1, 1,
-0.6833054, -0.08199849, -2.693558, 0, 0, 0, 1, 1,
-0.6773955, 1.384873, -0.5534166, 0, 0, 0, 1, 1,
-0.6684143, 1.352126, -0.4683503, 1, 1, 1, 1, 1,
-0.668275, 0.3884742, -0.03100817, 1, 1, 1, 1, 1,
-0.6664568, -0.1234431, -0.7679569, 1, 1, 1, 1, 1,
-0.6613089, 0.4504262, 0.05544655, 1, 1, 1, 1, 1,
-0.6612933, 0.4749178, -0.9567081, 1, 1, 1, 1, 1,
-0.653453, -0.1865382, -3.052162, 1, 1, 1, 1, 1,
-0.6529998, -1.270449, -4.994694, 1, 1, 1, 1, 1,
-0.6525618, -0.7850329, -2.37911, 1, 1, 1, 1, 1,
-0.6494813, -0.5923257, -1.805489, 1, 1, 1, 1, 1,
-0.6414816, 0.3857791, -0.503616, 1, 1, 1, 1, 1,
-0.6369415, -2.536485, -3.288964, 1, 1, 1, 1, 1,
-0.6321409, -0.08177603, -0.5747203, 1, 1, 1, 1, 1,
-0.6303742, 1.202183, -0.7207272, 1, 1, 1, 1, 1,
-0.6286216, 0.5799912, -1.233837, 1, 1, 1, 1, 1,
-0.6239517, -1.432908, -3.592728, 1, 1, 1, 1, 1,
-0.6234815, 0.2079737, -2.551806, 0, 0, 1, 1, 1,
-0.6193708, -0.5975145, -0.9000922, 1, 0, 0, 1, 1,
-0.6192564, -0.08412502, -2.887877, 1, 0, 0, 1, 1,
-0.6179966, -0.1776192, -1.681461, 1, 0, 0, 1, 1,
-0.6071877, 0.4264379, 0.08517186, 1, 0, 0, 1, 1,
-0.6008028, -0.1288618, -0.7714445, 1, 0, 0, 1, 1,
-0.5947064, -0.4914927, -2.210214, 0, 0, 0, 1, 1,
-0.5930207, -0.4247587, -1.464664, 0, 0, 0, 1, 1,
-0.5827333, 0.07799397, -1.219305, 0, 0, 0, 1, 1,
-0.5813647, -1.131211, -2.223233, 0, 0, 0, 1, 1,
-0.5805352, -2.740783, -1.464202, 0, 0, 0, 1, 1,
-0.5786653, -1.018103, -3.64072, 0, 0, 0, 1, 1,
-0.5695258, -0.02907795, -1.378032, 0, 0, 0, 1, 1,
-0.5668089, 1.415813, -1.220328, 1, 1, 1, 1, 1,
-0.5647717, -1.329585, -3.094761, 1, 1, 1, 1, 1,
-0.5633481, 1.303947, -0.4012007, 1, 1, 1, 1, 1,
-0.5609524, -1.523857, -3.407097, 1, 1, 1, 1, 1,
-0.5588487, -0.1178888, -2.428726, 1, 1, 1, 1, 1,
-0.5552465, 0.6226914, -0.9165827, 1, 1, 1, 1, 1,
-0.5501375, -1.659875, -2.082893, 1, 1, 1, 1, 1,
-0.5468744, 0.1330972, -0.2936884, 1, 1, 1, 1, 1,
-0.5467752, 0.2158469, -2.367971, 1, 1, 1, 1, 1,
-0.5464962, 1.231199, -1.508808, 1, 1, 1, 1, 1,
-0.5437469, 1.242398, -1.024889, 1, 1, 1, 1, 1,
-0.5432153, 0.8642842, -1.157046, 1, 1, 1, 1, 1,
-0.5410674, 0.2985184, 0.5189859, 1, 1, 1, 1, 1,
-0.5364235, -1.064778, -3.560565, 1, 1, 1, 1, 1,
-0.5310478, -0.6745093, -3.57315, 1, 1, 1, 1, 1,
-0.5264962, 0.5055021, -0.7847542, 0, 0, 1, 1, 1,
-0.5257911, 1.681623, -1.133453, 1, 0, 0, 1, 1,
-0.5252015, 0.5875992, -0.2874997, 1, 0, 0, 1, 1,
-0.5191375, -0.9982273, -0.6063053, 1, 0, 0, 1, 1,
-0.5187537, 0.946095, -0.6620949, 1, 0, 0, 1, 1,
-0.5135643, 1.377065, -1.704704, 1, 0, 0, 1, 1,
-0.5115066, -1.073264, -2.490731, 0, 0, 0, 1, 1,
-0.5102267, 1.300522, -2.027949, 0, 0, 0, 1, 1,
-0.5075469, 0.8266003, -0.7775521, 0, 0, 0, 1, 1,
-0.5066495, -0.8300797, -3.737059, 0, 0, 0, 1, 1,
-0.5062513, 0.5590923, -0.4430797, 0, 0, 0, 1, 1,
-0.5047299, -0.2063591, -2.206616, 0, 0, 0, 1, 1,
-0.5033758, 0.3348131, -1.289462, 0, 0, 0, 1, 1,
-0.500569, 0.2892364, -2.071581, 1, 1, 1, 1, 1,
-0.4933504, 0.4790677, 0.2459583, 1, 1, 1, 1, 1,
-0.4835985, 0.09293424, -1.298093, 1, 1, 1, 1, 1,
-0.4791021, -0.308797, -3.34131, 1, 1, 1, 1, 1,
-0.4776975, 0.2750929, -1.768116, 1, 1, 1, 1, 1,
-0.4772163, 0.6532998, -0.4185457, 1, 1, 1, 1, 1,
-0.4755667, -1.009017, -3.299721, 1, 1, 1, 1, 1,
-0.4745633, -0.4249036, -1.373827, 1, 1, 1, 1, 1,
-0.4730775, 1.270766, -0.224142, 1, 1, 1, 1, 1,
-0.4729247, -0.492466, -1.025195, 1, 1, 1, 1, 1,
-0.4718722, -0.5594407, -2.422933, 1, 1, 1, 1, 1,
-0.4710022, 0.3296873, -1.135406, 1, 1, 1, 1, 1,
-0.4678714, 2.756458, -0.6812166, 1, 1, 1, 1, 1,
-0.4666679, -2.149379, -3.806094, 1, 1, 1, 1, 1,
-0.4661463, -0.08733015, -0.2333494, 1, 1, 1, 1, 1,
-0.4655122, 0.3953142, -0.2221822, 0, 0, 1, 1, 1,
-0.4589696, 0.6433165, 0.08205456, 1, 0, 0, 1, 1,
-0.4559737, -1.891187, -2.550681, 1, 0, 0, 1, 1,
-0.4466037, -1.271764, -1.379827, 1, 0, 0, 1, 1,
-0.4438304, 1.785007, 0.4883624, 1, 0, 0, 1, 1,
-0.4402858, -0.5804917, -1.924604, 1, 0, 0, 1, 1,
-0.4399785, -0.8016095, -2.492155, 0, 0, 0, 1, 1,
-0.4363779, 1.425211, -0.5309148, 0, 0, 0, 1, 1,
-0.4336453, -1.55362, -5.626199, 0, 0, 0, 1, 1,
-0.424628, -1.045593, -4.261621, 0, 0, 0, 1, 1,
-0.4236213, 0.6811888, -1.133897, 0, 0, 0, 1, 1,
-0.4229389, -0.1737289, -2.407908, 0, 0, 0, 1, 1,
-0.419408, -0.2031071, -3.324919, 0, 0, 0, 1, 1,
-0.4192981, -0.7911459, -2.961278, 1, 1, 1, 1, 1,
-0.4165685, -0.4495876, -2.810447, 1, 1, 1, 1, 1,
-0.4150033, 1.049944, 1.091711, 1, 1, 1, 1, 1,
-0.4101653, -1.564509, -3.406151, 1, 1, 1, 1, 1,
-0.4096935, -0.03443586, -0.7207631, 1, 1, 1, 1, 1,
-0.4038702, -0.08563577, -0.7913896, 1, 1, 1, 1, 1,
-0.3994904, 1.174554, -0.1816576, 1, 1, 1, 1, 1,
-0.3955158, -0.6356396, -2.552695, 1, 1, 1, 1, 1,
-0.3928944, 0.8066493, -0.4801869, 1, 1, 1, 1, 1,
-0.3923054, -1.010776, -1.10711, 1, 1, 1, 1, 1,
-0.3922076, -0.6144766, -3.251725, 1, 1, 1, 1, 1,
-0.3880183, -1.075711, -4.353697, 1, 1, 1, 1, 1,
-0.3860736, 1.985198, -1.982228, 1, 1, 1, 1, 1,
-0.3830071, 0.6787508, 1.808557, 1, 1, 1, 1, 1,
-0.3830022, -0.2134658, -1.012818, 1, 1, 1, 1, 1,
-0.381974, 0.9421005, 0.4687749, 0, 0, 1, 1, 1,
-0.3799136, -0.783116, -2.847095, 1, 0, 0, 1, 1,
-0.3786319, 0.1711109, -2.040556, 1, 0, 0, 1, 1,
-0.3725857, -0.1345859, -1.53634, 1, 0, 0, 1, 1,
-0.3720504, 0.6573068, -1.276009, 1, 0, 0, 1, 1,
-0.3699728, 0.1690503, -3.464064, 1, 0, 0, 1, 1,
-0.3657894, 0.8323638, 1.069559, 0, 0, 0, 1, 1,
-0.3649354, 0.1371054, 0.7323074, 0, 0, 0, 1, 1,
-0.3628125, -0.3976987, -3.0009, 0, 0, 0, 1, 1,
-0.3586848, 1.448983, -1.827968, 0, 0, 0, 1, 1,
-0.356757, -0.1681265, -0.7809477, 0, 0, 0, 1, 1,
-0.3556535, -0.8260852, -1.527285, 0, 0, 0, 1, 1,
-0.3548377, -0.03757405, -1.645259, 0, 0, 0, 1, 1,
-0.3545141, -0.117156, -2.45324, 1, 1, 1, 1, 1,
-0.3530455, -0.06563441, -1.316191, 1, 1, 1, 1, 1,
-0.3522503, 0.4027594, -1.473041, 1, 1, 1, 1, 1,
-0.3514872, 0.01609559, -1.064084, 1, 1, 1, 1, 1,
-0.3505371, 0.8923837, -0.9474286, 1, 1, 1, 1, 1,
-0.3473753, 0.1841931, 0.3445845, 1, 1, 1, 1, 1,
-0.3428054, 0.2199009, 0.2713158, 1, 1, 1, 1, 1,
-0.3388158, 0.2627341, -2.007572, 1, 1, 1, 1, 1,
-0.335727, -1.284703, -3.170311, 1, 1, 1, 1, 1,
-0.3340174, 0.2414171, -0.297047, 1, 1, 1, 1, 1,
-0.3319244, 1.098527, 0.7419354, 1, 1, 1, 1, 1,
-0.328775, -1.804856, -1.808517, 1, 1, 1, 1, 1,
-0.3258269, 0.4748638, -1.24473, 1, 1, 1, 1, 1,
-0.3243738, -0.01978261, -2.629249, 1, 1, 1, 1, 1,
-0.3233181, -1.23026, -3.242023, 1, 1, 1, 1, 1,
-0.3225297, -1.27132, -1.741461, 0, 0, 1, 1, 1,
-0.3224991, 1.030939, 0.3677399, 1, 0, 0, 1, 1,
-0.3124219, 0.3229315, 0.624151, 1, 0, 0, 1, 1,
-0.3121025, 0.6947898, -1.183189, 1, 0, 0, 1, 1,
-0.3114009, -0.6423243, -2.499615, 1, 0, 0, 1, 1,
-0.3111624, -0.1992325, -1.503405, 1, 0, 0, 1, 1,
-0.3098163, -0.8300108, -2.61424, 0, 0, 0, 1, 1,
-0.3003908, -1.116814, -2.805909, 0, 0, 0, 1, 1,
-0.3001651, -1.1022, -2.638562, 0, 0, 0, 1, 1,
-0.2993924, 0.4856028, 1.120479, 0, 0, 0, 1, 1,
-0.29482, -0.3240258, -3.278733, 0, 0, 0, 1, 1,
-0.2941241, -0.6107528, -3.630117, 0, 0, 0, 1, 1,
-0.2933537, -0.1859231, -1.825743, 0, 0, 0, 1, 1,
-0.2901721, 0.9349332, -0.316097, 1, 1, 1, 1, 1,
-0.287681, 0.4447355, -0.4776708, 1, 1, 1, 1, 1,
-0.286924, -0.7039517, -4.305685, 1, 1, 1, 1, 1,
-0.2858114, 0.9059122, 0.3942531, 1, 1, 1, 1, 1,
-0.2828499, -0.3105226, -1.774064, 1, 1, 1, 1, 1,
-0.2772246, 1.860173, -1.098338, 1, 1, 1, 1, 1,
-0.2741709, -2.235157, -3.138926, 1, 1, 1, 1, 1,
-0.2714045, -0.8930258, -1.770795, 1, 1, 1, 1, 1,
-0.2711438, -0.1541416, -1.892241, 1, 1, 1, 1, 1,
-0.263486, 1.109597, -0.5617648, 1, 1, 1, 1, 1,
-0.2622336, -0.3734824, -2.986228, 1, 1, 1, 1, 1,
-0.2576568, 1.340444, -1.538027, 1, 1, 1, 1, 1,
-0.2553058, 0.756508, -0.8243985, 1, 1, 1, 1, 1,
-0.2508855, 0.1517209, -1.778282, 1, 1, 1, 1, 1,
-0.2490808, 0.676936, -3.108747, 1, 1, 1, 1, 1,
-0.2476626, -0.2236471, -2.075024, 0, 0, 1, 1, 1,
-0.2474207, -1.291858, -3.344831, 1, 0, 0, 1, 1,
-0.2454961, -1.378983, -3.531488, 1, 0, 0, 1, 1,
-0.2371352, 1.017095, -0.6412076, 1, 0, 0, 1, 1,
-0.2371167, 0.09968827, 0.2724679, 1, 0, 0, 1, 1,
-0.235534, -1.042819, -1.463882, 1, 0, 0, 1, 1,
-0.2354075, 0.8583701, -0.2560485, 0, 0, 0, 1, 1,
-0.2312852, 1.237169, 0.4715386, 0, 0, 0, 1, 1,
-0.2257359, 0.2398948, -2.214769, 0, 0, 0, 1, 1,
-0.2235557, 1.48005, -0.7045718, 0, 0, 0, 1, 1,
-0.2214702, 0.1881606, -2.027209, 0, 0, 0, 1, 1,
-0.2178864, -1.018333, -3.106368, 0, 0, 0, 1, 1,
-0.2136763, -0.6358758, -2.900898, 0, 0, 0, 1, 1,
-0.2095489, -0.2791123, -2.300707, 1, 1, 1, 1, 1,
-0.2093196, -1.20836, -2.948942, 1, 1, 1, 1, 1,
-0.2034142, 0.9837133, 2.056933, 1, 1, 1, 1, 1,
-0.2028082, -0.9988163, -5.870851, 1, 1, 1, 1, 1,
-0.2011298, 0.1134401, 0.6963932, 1, 1, 1, 1, 1,
-0.1995529, 0.06773889, 0.4076479, 1, 1, 1, 1, 1,
-0.1975633, -0.5592585, -2.580975, 1, 1, 1, 1, 1,
-0.1943353, 1.200687, -0.681495, 1, 1, 1, 1, 1,
-0.1942803, 1.31271, 0.2160237, 1, 1, 1, 1, 1,
-0.1922607, -0.7521333, -2.977249, 1, 1, 1, 1, 1,
-0.1902043, 0.03237286, -2.44876, 1, 1, 1, 1, 1,
-0.1896078, 0.8681126, 0.935743, 1, 1, 1, 1, 1,
-0.1837053, 1.179645, 0.8121477, 1, 1, 1, 1, 1,
-0.182029, 0.6991347, -0.5122922, 1, 1, 1, 1, 1,
-0.1768719, 0.5609807, 0.1986981, 1, 1, 1, 1, 1,
-0.1759801, -0.3894118, -2.930894, 0, 0, 1, 1, 1,
-0.1718154, -1.397305, -3.531801, 1, 0, 0, 1, 1,
-0.1706524, -0.9713209, -4.49135, 1, 0, 0, 1, 1,
-0.1696723, -0.6138778, -3.438236, 1, 0, 0, 1, 1,
-0.1692052, 0.4128873, 0.8818588, 1, 0, 0, 1, 1,
-0.1674682, -0.1358851, -3.357451, 1, 0, 0, 1, 1,
-0.1652847, -0.4539723, -2.813819, 0, 0, 0, 1, 1,
-0.1635355, -1.937687, -3.845344, 0, 0, 0, 1, 1,
-0.1634093, -1.272544, -1.590588, 0, 0, 0, 1, 1,
-0.1582273, -0.5171334, -0.1482042, 0, 0, 0, 1, 1,
-0.1523445, 0.480002, -0.01245311, 0, 0, 0, 1, 1,
-0.1504245, 0.9013263, 0.2404678, 0, 0, 0, 1, 1,
-0.149204, 1.073868, 1.03722, 0, 0, 0, 1, 1,
-0.1409657, -2.626256, -1.883417, 1, 1, 1, 1, 1,
-0.140627, -0.3848517, -1.640632, 1, 1, 1, 1, 1,
-0.1387928, 2.016078, -0.5359671, 1, 1, 1, 1, 1,
-0.1362255, 0.2843952, -0.03124508, 1, 1, 1, 1, 1,
-0.1344877, -1.635569, -3.578348, 1, 1, 1, 1, 1,
-0.1344711, 0.02035098, -1.173508, 1, 1, 1, 1, 1,
-0.1330295, -0.3626056, -2.768252, 1, 1, 1, 1, 1,
-0.1323915, 0.7025606, -0.03693624, 1, 1, 1, 1, 1,
-0.128609, 0.446046, -0.7461047, 1, 1, 1, 1, 1,
-0.1227697, 1.14196, 1.771994, 1, 1, 1, 1, 1,
-0.1219653, 1.144437, 0.1773337, 1, 1, 1, 1, 1,
-0.1218136, 0.2407041, -1.561598, 1, 1, 1, 1, 1,
-0.1217694, -0.1243304, -2.044234, 1, 1, 1, 1, 1,
-0.1212621, 1.215485, 0.08223877, 1, 1, 1, 1, 1,
-0.1204997, -0.4999072, -3.189538, 1, 1, 1, 1, 1,
-0.1196192, 1.189922, 0.08650362, 0, 0, 1, 1, 1,
-0.1156714, -1.069069, -4.877059, 1, 0, 0, 1, 1,
-0.1126889, -1.894338, -2.936785, 1, 0, 0, 1, 1,
-0.1077012, 0.6435754, 0.647819, 1, 0, 0, 1, 1,
-0.1049822, 0.4289094, -1.592742, 1, 0, 0, 1, 1,
-0.1032542, 0.4235172, -0.1287769, 1, 0, 0, 1, 1,
-0.09531935, -0.1878662, -1.783468, 0, 0, 0, 1, 1,
-0.08665437, -1.335506, -3.799653, 0, 0, 0, 1, 1,
-0.0852216, -0.8895819, -2.309467, 0, 0, 0, 1, 1,
-0.08220027, 0.6281368, -0.9257475, 0, 0, 0, 1, 1,
-0.08141863, 1.385147, 0.6581577, 0, 0, 0, 1, 1,
-0.07797365, -0.9443755, -3.872275, 0, 0, 0, 1, 1,
-0.07740366, -0.02717193, -2.692558, 0, 0, 0, 1, 1,
-0.07709423, 2.484877, 0.3659814, 1, 1, 1, 1, 1,
-0.07699377, 0.1155592, -1.214893, 1, 1, 1, 1, 1,
-0.07186288, -0.1964041, -2.400646, 1, 1, 1, 1, 1,
-0.07018916, -0.05650263, -0.9178526, 1, 1, 1, 1, 1,
-0.06759222, -0.9424359, -1.982483, 1, 1, 1, 1, 1,
-0.06548571, -0.6295769, -2.240232, 1, 1, 1, 1, 1,
-0.06475043, -0.2791495, -2.853656, 1, 1, 1, 1, 1,
-0.06410742, 2.204931, 0.3874222, 1, 1, 1, 1, 1,
-0.06273041, -4.199448, -4.152551, 1, 1, 1, 1, 1,
-0.05224863, 1.714043, 0.6011099, 1, 1, 1, 1, 1,
-0.05040689, 1.565498, 1.492997, 1, 1, 1, 1, 1,
-0.04703811, 1.041331, 0.725495, 1, 1, 1, 1, 1,
-0.04328214, 1.157054, -0.9039515, 1, 1, 1, 1, 1,
-0.04149671, -0.03998179, -4.534625, 1, 1, 1, 1, 1,
-0.03716245, -0.5809104, -3.634784, 1, 1, 1, 1, 1,
-0.03645482, 0.656061, 0.0577719, 0, 0, 1, 1, 1,
-0.0314996, -0.1498112, -3.096996, 1, 0, 0, 1, 1,
-0.03066866, -0.2125992, -1.764205, 1, 0, 0, 1, 1,
-0.02955742, 1.327762, -0.9802113, 1, 0, 0, 1, 1,
-0.02740231, 0.430701, 0.1523359, 1, 0, 0, 1, 1,
-0.02680634, -0.1488447, -0.8688819, 1, 0, 0, 1, 1,
-0.01919819, 0.6175321, 0.3374726, 0, 0, 0, 1, 1,
-0.01847542, -1.096653, -3.160635, 0, 0, 0, 1, 1,
-0.01545824, 0.9759304, -0.417759, 0, 0, 0, 1, 1,
-0.01509936, -0.3484799, -1.804837, 0, 0, 0, 1, 1,
-0.01173291, -0.9961296, -2.536036, 0, 0, 0, 1, 1,
-0.008233919, -0.1042527, -3.931158, 0, 0, 0, 1, 1,
-0.005170607, -0.2830461, -3.82707, 0, 0, 0, 1, 1,
-0.005131616, -1.005384, -0.809783, 1, 1, 1, 1, 1,
-0.002928732, 0.09233543, -0.02542031, 1, 1, 1, 1, 1,
-0.00186013, -0.9135244, -1.847592, 1, 1, 1, 1, 1,
0.0005517956, 1.893458, -0.7213542, 1, 1, 1, 1, 1,
0.00958579, -1.39846, 2.292085, 1, 1, 1, 1, 1,
0.01092666, -0.6407338, 2.531554, 1, 1, 1, 1, 1,
0.01105621, -0.4822625, 3.302862, 1, 1, 1, 1, 1,
0.01261442, 0.3611152, 0.7133219, 1, 1, 1, 1, 1,
0.01522976, 0.8990531, -0.5711314, 1, 1, 1, 1, 1,
0.02953458, 1.091067, 0.6104257, 1, 1, 1, 1, 1,
0.02965087, 0.8042372, -0.9800957, 1, 1, 1, 1, 1,
0.03268431, -1.062382, 1.826523, 1, 1, 1, 1, 1,
0.04328613, -0.8670182, 3.155924, 1, 1, 1, 1, 1,
0.04401558, -0.3172114, 2.762497, 1, 1, 1, 1, 1,
0.04510022, -0.09496371, 4.369533, 1, 1, 1, 1, 1,
0.0487578, 0.6288608, 0.3203973, 0, 0, 1, 1, 1,
0.05257255, 0.812792, -0.9713095, 1, 0, 0, 1, 1,
0.05362165, 0.8093867, -1.024462, 1, 0, 0, 1, 1,
0.05457531, 1.850691, 0.1084058, 1, 0, 0, 1, 1,
0.05677019, 0.3472466, 1.572132, 1, 0, 0, 1, 1,
0.05805315, 0.1978467, 2.489382, 1, 0, 0, 1, 1,
0.05868557, -0.9432003, 3.304944, 0, 0, 0, 1, 1,
0.05940101, 0.6178071, 1.326736, 0, 0, 0, 1, 1,
0.06047788, 1.642473, 0.780464, 0, 0, 0, 1, 1,
0.06330075, -0.5473776, 2.735243, 0, 0, 0, 1, 1,
0.06588001, 0.6864057, 0.3604499, 0, 0, 0, 1, 1,
0.06882083, 0.1643886, -0.6736843, 0, 0, 0, 1, 1,
0.07556179, -0.09649962, 3.181179, 0, 0, 0, 1, 1,
0.07709183, -0.9974985, 3.542073, 1, 1, 1, 1, 1,
0.07830485, -0.1606133, 2.973897, 1, 1, 1, 1, 1,
0.0798493, -0.5376315, 3.783005, 1, 1, 1, 1, 1,
0.08042146, 0.4439269, 1.580945, 1, 1, 1, 1, 1,
0.08174707, 0.1786263, 0.05225046, 1, 1, 1, 1, 1,
0.08286388, -0.3064724, 3.184664, 1, 1, 1, 1, 1,
0.08486097, -0.8268827, 2.552466, 1, 1, 1, 1, 1,
0.09351604, 0.4007914, 1.199583, 1, 1, 1, 1, 1,
0.0959751, -1.96799, 1.742983, 1, 1, 1, 1, 1,
0.09690595, 0.1444652, 0.6373025, 1, 1, 1, 1, 1,
0.09750325, 0.3251322, -0.6573109, 1, 1, 1, 1, 1,
0.09824084, 1.210982, -0.3857722, 1, 1, 1, 1, 1,
0.09900714, 1.156953, 0.995627, 1, 1, 1, 1, 1,
0.09926268, -0.8662487, 3.300953, 1, 1, 1, 1, 1,
0.1008535, 0.4006247, 0.134081, 1, 1, 1, 1, 1,
0.1010963, -0.6530873, 3.545493, 0, 0, 1, 1, 1,
0.1015877, 1.61944, 0.3964007, 1, 0, 0, 1, 1,
0.1119573, -0.7376091, 3.383868, 1, 0, 0, 1, 1,
0.1145685, -0.627288, 3.234751, 1, 0, 0, 1, 1,
0.1167876, -0.2190329, 4.737388, 1, 0, 0, 1, 1,
0.1256414, 0.06929768, 1.3154, 1, 0, 0, 1, 1,
0.1316677, 0.4103648, 1.163481, 0, 0, 0, 1, 1,
0.1366439, 0.9033607, -0.6080626, 0, 0, 0, 1, 1,
0.1395124, 1.142206, 0.4603892, 0, 0, 0, 1, 1,
0.144665, -0.2119592, 2.889559, 0, 0, 0, 1, 1,
0.1487251, -1.323097, 2.122651, 0, 0, 0, 1, 1,
0.149762, -1.591315, 2.834707, 0, 0, 0, 1, 1,
0.1504527, -0.9702495, 2.181543, 0, 0, 0, 1, 1,
0.1587337, -0.2154471, 4.421018, 1, 1, 1, 1, 1,
0.1612082, 1.419995, 0.6348357, 1, 1, 1, 1, 1,
0.1637546, 0.2076903, 0.8196371, 1, 1, 1, 1, 1,
0.1671953, 1.329562, -0.1490075, 1, 1, 1, 1, 1,
0.1759325, 0.8368044, 3.089416, 1, 1, 1, 1, 1,
0.1780512, -0.2469854, 3.690451, 1, 1, 1, 1, 1,
0.1795336, 0.1752816, 0.1230941, 1, 1, 1, 1, 1,
0.1804244, 0.05924211, 1.236057, 1, 1, 1, 1, 1,
0.1833241, -1.310982, 3.868152, 1, 1, 1, 1, 1,
0.1844235, -0.74133, 1.634272, 1, 1, 1, 1, 1,
0.1848092, -0.3386134, 3.641675, 1, 1, 1, 1, 1,
0.186125, 1.172704, -1.42708, 1, 1, 1, 1, 1,
0.1861559, 0.6807285, 0.9648403, 1, 1, 1, 1, 1,
0.1934012, -0.068339, 3.0752, 1, 1, 1, 1, 1,
0.1939234, -0.2414627, 1.93469, 1, 1, 1, 1, 1,
0.1955455, 0.262449, 1.711902, 0, 0, 1, 1, 1,
0.1995672, -2.030041, 3.312567, 1, 0, 0, 1, 1,
0.2001855, 0.09427717, 2.689878, 1, 0, 0, 1, 1,
0.2019707, -0.5395179, 4.562084, 1, 0, 0, 1, 1,
0.2031849, 0.006684114, 1.418957, 1, 0, 0, 1, 1,
0.2055311, -1.203252, 4.631116, 1, 0, 0, 1, 1,
0.2060748, -0.1468446, 0.3660009, 0, 0, 0, 1, 1,
0.2124295, 1.817726, -1.093206, 0, 0, 0, 1, 1,
0.2132227, -0.344621, 3.047004, 0, 0, 0, 1, 1,
0.2158255, 1.134706, 0.5117126, 0, 0, 0, 1, 1,
0.2160688, 0.6208642, 2.579578, 0, 0, 0, 1, 1,
0.216225, -0.9236056, 1.482199, 0, 0, 0, 1, 1,
0.2221414, 1.116017, 0.2911859, 0, 0, 0, 1, 1,
0.2268992, -0.8843569, 2.775119, 1, 1, 1, 1, 1,
0.2468709, -0.04400382, 2.562452, 1, 1, 1, 1, 1,
0.2469531, 0.2643862, 2.579219, 1, 1, 1, 1, 1,
0.2486196, -0.2105746, 1.650396, 1, 1, 1, 1, 1,
0.2501096, -1.316815, 3.81338, 1, 1, 1, 1, 1,
0.2558237, 0.4395776, 0.9658509, 1, 1, 1, 1, 1,
0.2561451, -1.269818, 2.029218, 1, 1, 1, 1, 1,
0.2569727, 1.136659, 0.0799854, 1, 1, 1, 1, 1,
0.2646361, -1.956959, 3.846681, 1, 1, 1, 1, 1,
0.2651071, 0.4498546, -0.1737469, 1, 1, 1, 1, 1,
0.2701008, -0.5761666, 2.262603, 1, 1, 1, 1, 1,
0.275496, 1.087922, -0.8126925, 1, 1, 1, 1, 1,
0.2783451, 0.4595799, -0.5793131, 1, 1, 1, 1, 1,
0.2827731, 0.86059, 0.3417751, 1, 1, 1, 1, 1,
0.2845132, -1.081126, 2.806288, 1, 1, 1, 1, 1,
0.2911679, 0.03019713, 0.02100156, 0, 0, 1, 1, 1,
0.2926882, 0.1475046, -0.04370994, 1, 0, 0, 1, 1,
0.2961271, -0.1109133, 3.124786, 1, 0, 0, 1, 1,
0.2976153, -0.212128, 1.367924, 1, 0, 0, 1, 1,
0.3012896, 2.810567, -1.723204, 1, 0, 0, 1, 1,
0.3085029, -0.4381705, 2.768849, 1, 0, 0, 1, 1,
0.3086674, -0.502053, 2.065882, 0, 0, 0, 1, 1,
0.3145097, -0.9210911, 2.483595, 0, 0, 0, 1, 1,
0.3174311, -0.8094166, 1.856387, 0, 0, 0, 1, 1,
0.3218727, 1.061426, 0.8371487, 0, 0, 0, 1, 1,
0.3233999, 0.5710056, 0.9553949, 0, 0, 0, 1, 1,
0.323888, -0.2488326, 3.176059, 0, 0, 0, 1, 1,
0.3244641, -1.842043, 4.161863, 0, 0, 0, 1, 1,
0.3267831, 0.7857689, 0.493664, 1, 1, 1, 1, 1,
0.3288635, -0.01562225, 0.933701, 1, 1, 1, 1, 1,
0.3341783, 1.975935, 2.876417, 1, 1, 1, 1, 1,
0.3352627, 0.9919365, 0.6271749, 1, 1, 1, 1, 1,
0.3368663, -1.102252, 1.609262, 1, 1, 1, 1, 1,
0.3375534, -0.6348597, 2.627385, 1, 1, 1, 1, 1,
0.3386615, 1.03556, -0.1874246, 1, 1, 1, 1, 1,
0.3428232, -2.101544, 3.549343, 1, 1, 1, 1, 1,
0.3443125, -0.7402393, 2.172745, 1, 1, 1, 1, 1,
0.3495232, 0.2014441, 2.730616, 1, 1, 1, 1, 1,
0.3499033, 0.1841676, 1.026712, 1, 1, 1, 1, 1,
0.3589546, 0.9013643, 1.070815, 1, 1, 1, 1, 1,
0.359504, -1.149483, 2.047321, 1, 1, 1, 1, 1,
0.3607537, -0.1305408, 2.900408, 1, 1, 1, 1, 1,
0.3673562, 0.4787292, 1.056912, 1, 1, 1, 1, 1,
0.3674798, 0.33289, 1.675657, 0, 0, 1, 1, 1,
0.3679875, -1.489461, 2.756669, 1, 0, 0, 1, 1,
0.3741615, -1.008921, 3.012751, 1, 0, 0, 1, 1,
0.3745025, 0.4989159, 1.167669, 1, 0, 0, 1, 1,
0.3794249, -1.048371, 2.60545, 1, 0, 0, 1, 1,
0.3820605, 0.8092557, -0.777163, 1, 0, 0, 1, 1,
0.3822817, -0.1882002, 1.598883, 0, 0, 0, 1, 1,
0.3846908, -0.7002812, 2.569823, 0, 0, 0, 1, 1,
0.3925255, -0.6225846, 2.577749, 0, 0, 0, 1, 1,
0.3926888, -0.1741397, 1.365548, 0, 0, 0, 1, 1,
0.3943366, 1.813027, 0.4541246, 0, 0, 0, 1, 1,
0.3952405, -0.3689541, 2.722348, 0, 0, 0, 1, 1,
0.3966571, 0.04508072, 2.375475, 0, 0, 0, 1, 1,
0.3991328, 2.210197, -1.764477, 1, 1, 1, 1, 1,
0.403042, -0.3549661, 3.151578, 1, 1, 1, 1, 1,
0.4047276, -0.0309847, 3.081123, 1, 1, 1, 1, 1,
0.4048594, -1.203595, 2.868595, 1, 1, 1, 1, 1,
0.4057181, -0.2788043, 0.3502236, 1, 1, 1, 1, 1,
0.407197, 0.7603885, 1.050269, 1, 1, 1, 1, 1,
0.4092361, -1.930294, 1.819491, 1, 1, 1, 1, 1,
0.4102271, -1.433967, 2.405442, 1, 1, 1, 1, 1,
0.4131962, 0.7136693, 0.4144945, 1, 1, 1, 1, 1,
0.4134579, -0.880327, 2.303964, 1, 1, 1, 1, 1,
0.4150429, 0.873587, -0.1870307, 1, 1, 1, 1, 1,
0.4155679, 0.9164024, 1.135101, 1, 1, 1, 1, 1,
0.4164592, 0.3662024, -0.489105, 1, 1, 1, 1, 1,
0.4175443, -1.293967, 2.042167, 1, 1, 1, 1, 1,
0.4179428, 1.169184, -0.2520504, 1, 1, 1, 1, 1,
0.4208084, -2.170381, 2.362471, 0, 0, 1, 1, 1,
0.4273267, 1.79472, 0.2686563, 1, 0, 0, 1, 1,
0.4358418, -0.3861004, 2.55458, 1, 0, 0, 1, 1,
0.4358724, 2.006166, 0.2395377, 1, 0, 0, 1, 1,
0.4397953, -1.911678, 1.951317, 1, 0, 0, 1, 1,
0.4429197, 0.9910994, 0.5659322, 1, 0, 0, 1, 1,
0.4469113, 0.09726722, 1.000733, 0, 0, 0, 1, 1,
0.4505806, -1.370401, 1.934566, 0, 0, 0, 1, 1,
0.4516252, -0.7997358, 5.164194, 0, 0, 0, 1, 1,
0.4528242, -0.84079, 3.908383, 0, 0, 0, 1, 1,
0.4597457, -1.008264, 2.746747, 0, 0, 0, 1, 1,
0.4600773, -1.60738, 3.029677, 0, 0, 0, 1, 1,
0.4602096, -0.8530185, 3.482005, 0, 0, 0, 1, 1,
0.4729804, -2.04777, 3.435079, 1, 1, 1, 1, 1,
0.4732239, -1.605229, 3.788105, 1, 1, 1, 1, 1,
0.4768698, -1.165412, 3.696813, 1, 1, 1, 1, 1,
0.4783462, -0.1631892, -1.037647, 1, 1, 1, 1, 1,
0.4833162, 1.938488, 0.1053542, 1, 1, 1, 1, 1,
0.4935357, -1.17363, 3.3993, 1, 1, 1, 1, 1,
0.5040076, -0.9228741, 3.926027, 1, 1, 1, 1, 1,
0.5098406, 1.47595, 0.4057437, 1, 1, 1, 1, 1,
0.5137491, 0.6533648, 0.6529958, 1, 1, 1, 1, 1,
0.5169175, -1.297695, 4.012166, 1, 1, 1, 1, 1,
0.5176952, -0.2085544, 1.987929, 1, 1, 1, 1, 1,
0.529248, 1.469022, -0.4406666, 1, 1, 1, 1, 1,
0.5330577, 0.001707721, 1.035524, 1, 1, 1, 1, 1,
0.5374256, 2.393951, -1.674501, 1, 1, 1, 1, 1,
0.5406643, -0.196159, 2.840871, 1, 1, 1, 1, 1,
0.5426953, -0.9219791, 2.852437, 0, 0, 1, 1, 1,
0.5561398, 1.2998, 0.2169968, 1, 0, 0, 1, 1,
0.5568469, 0.6664984, 0.6478925, 1, 0, 0, 1, 1,
0.5616484, -0.5965716, 3.124328, 1, 0, 0, 1, 1,
0.5670963, 0.5653445, 0.07247715, 1, 0, 0, 1, 1,
0.5680933, 1.883464, 1.060819, 1, 0, 0, 1, 1,
0.5691764, -0.8009169, 3.725641, 0, 0, 0, 1, 1,
0.5762045, 0.2293772, 1.140085, 0, 0, 0, 1, 1,
0.578338, -0.8460926, 1.793727, 0, 0, 0, 1, 1,
0.5816144, 1.335199, 0.2415686, 0, 0, 0, 1, 1,
0.5868993, -0.4770073, 3.23209, 0, 0, 0, 1, 1,
0.5887752, -0.7306255, 3.469668, 0, 0, 0, 1, 1,
0.5902389, 0.9909528, -0.3875593, 0, 0, 0, 1, 1,
0.5919343, 0.7624443, 0.9493934, 1, 1, 1, 1, 1,
0.5934296, -0.2143568, 1.714471, 1, 1, 1, 1, 1,
0.5946177, -0.5640169, 2.241982, 1, 1, 1, 1, 1,
0.5966424, 0.9877346, -0.04080569, 1, 1, 1, 1, 1,
0.5978411, -0.4950638, 1.718463, 1, 1, 1, 1, 1,
0.6004459, -0.2049442, 1.543596, 1, 1, 1, 1, 1,
0.605656, -0.975925, 2.013809, 1, 1, 1, 1, 1,
0.6195459, -2.273511, 3.394547, 1, 1, 1, 1, 1,
0.6238464, -0.03408032, 1.900437, 1, 1, 1, 1, 1,
0.6240219, -0.3851254, 3.472676, 1, 1, 1, 1, 1,
0.6304947, 1.976053, 0.3837298, 1, 1, 1, 1, 1,
0.6328353, 1.088082, -0.8056855, 1, 1, 1, 1, 1,
0.6330444, -0.1265309, 0.9114842, 1, 1, 1, 1, 1,
0.6335821, 0.5072441, -0.3853021, 1, 1, 1, 1, 1,
0.6360883, -0.4255006, 1.59596, 1, 1, 1, 1, 1,
0.6373268, -0.2353866, 2.098462, 0, 0, 1, 1, 1,
0.6511307, 0.1849353, 0.4941208, 1, 0, 0, 1, 1,
0.6537951, 0.06370576, 1.68988, 1, 0, 0, 1, 1,
0.6565135, 1.682705, 2.024124, 1, 0, 0, 1, 1,
0.6573501, 0.912726, 1.757671, 1, 0, 0, 1, 1,
0.659647, -0.6655657, 2.020409, 1, 0, 0, 1, 1,
0.6610659, -0.106456, 2.352745, 0, 0, 0, 1, 1,
0.6675982, 1.416822, 1.63691, 0, 0, 0, 1, 1,
0.6688427, 0.3353545, -1.296215, 0, 0, 0, 1, 1,
0.6716652, -1.179525, 2.369762, 0, 0, 0, 1, 1,
0.6733309, 1.31791, -1.300916, 0, 0, 0, 1, 1,
0.6747857, -1.595358, 3.070713, 0, 0, 0, 1, 1,
0.6777917, 0.2195645, 1.106795, 0, 0, 0, 1, 1,
0.678028, 0.9667953, -0.5453809, 1, 1, 1, 1, 1,
0.6813613, -0.0488843, 0.5243832, 1, 1, 1, 1, 1,
0.6844766, -1.394414, 2.16721, 1, 1, 1, 1, 1,
0.6883237, -0.1546767, 3.399782, 1, 1, 1, 1, 1,
0.697104, 0.1416836, 1.983199, 1, 1, 1, 1, 1,
0.6989142, 1.020833, 0.4392307, 1, 1, 1, 1, 1,
0.7015694, 2.084766, 1.431148, 1, 1, 1, 1, 1,
0.7018709, 0.6356388, 1.613151, 1, 1, 1, 1, 1,
0.7035452, -0.2312497, 1.252788, 1, 1, 1, 1, 1,
0.7054653, 1.026675, 2.297525, 1, 1, 1, 1, 1,
0.7061158, 1.257622, 0.887482, 1, 1, 1, 1, 1,
0.706334, 0.8242686, -0.1375874, 1, 1, 1, 1, 1,
0.7071491, 1.017895, 1.841019, 1, 1, 1, 1, 1,
0.7072777, 1.274916, 0.7902496, 1, 1, 1, 1, 1,
0.7111022, 0.1241277, 1.398795, 1, 1, 1, 1, 1,
0.7157641, 0.5370888, 1.380301, 0, 0, 1, 1, 1,
0.7173443, -1.825361, 2.378383, 1, 0, 0, 1, 1,
0.7245157, 0.5158541, 1.800676, 1, 0, 0, 1, 1,
0.7252237, -0.3321732, 1.413542, 1, 0, 0, 1, 1,
0.7353839, -0.6583046, 1.463492, 1, 0, 0, 1, 1,
0.738042, 1.250639, -0.9359835, 1, 0, 0, 1, 1,
0.739866, 0.3638063, 2.635282, 0, 0, 0, 1, 1,
0.7406574, 0.2228856, 1.922277, 0, 0, 0, 1, 1,
0.7408324, -0.4082978, 2.579862, 0, 0, 0, 1, 1,
0.7416469, -0.1530766, 0.4647655, 0, 0, 0, 1, 1,
0.7435664, -1.003715, 2.961499, 0, 0, 0, 1, 1,
0.7481162, -0.09668265, 3.022719, 0, 0, 0, 1, 1,
0.7502195, 1.542798, 0.8515542, 0, 0, 0, 1, 1,
0.7502667, 1.424641, 0.4463671, 1, 1, 1, 1, 1,
0.7503386, 0.3793603, 0.9864509, 1, 1, 1, 1, 1,
0.7510577, 0.3099587, 1.175991, 1, 1, 1, 1, 1,
0.7601797, -0.3517122, 3.656146, 1, 1, 1, 1, 1,
0.7620873, 0.7652029, 0.345584, 1, 1, 1, 1, 1,
0.7641408, 0.5480517, 2.289275, 1, 1, 1, 1, 1,
0.7682341, 0.8766242, 1.095712, 1, 1, 1, 1, 1,
0.7697102, -0.4833843, 0.4872213, 1, 1, 1, 1, 1,
0.7703525, -0.9196958, 0.8190043, 1, 1, 1, 1, 1,
0.7781522, 1.525943, 1.303383, 1, 1, 1, 1, 1,
0.7801784, 2.451957, 1.954175, 1, 1, 1, 1, 1,
0.7830988, 0.3471642, 1.243589, 1, 1, 1, 1, 1,
0.7886932, -0.5660943, 1.466468, 1, 1, 1, 1, 1,
0.7912214, 0.4150122, 0.1168103, 1, 1, 1, 1, 1,
0.7942094, 0.3386358, -0.02665697, 1, 1, 1, 1, 1,
0.7957866, 0.4417562, 3.239707, 0, 0, 1, 1, 1,
0.7993915, -1.182069, 1.143498, 1, 0, 0, 1, 1,
0.8058608, -0.2209878, 2.205575, 1, 0, 0, 1, 1,
0.8085464, 0.6789757, 0.3173216, 1, 0, 0, 1, 1,
0.8086222, 0.8794282, 0.2339863, 1, 0, 0, 1, 1,
0.8104268, 0.497594, 1.917632, 1, 0, 0, 1, 1,
0.8235462, -0.1887692, 0.9900178, 0, 0, 0, 1, 1,
0.8263488, -1.401264, 2.739505, 0, 0, 0, 1, 1,
0.8314686, 0.7365512, 0.5026965, 0, 0, 0, 1, 1,
0.8325113, -1.180027, 2.970951, 0, 0, 0, 1, 1,
0.833777, -0.3220831, 3.648709, 0, 0, 0, 1, 1,
0.8362881, -0.2105571, 1.933949, 0, 0, 0, 1, 1,
0.8375586, -0.4352894, 1.198433, 0, 0, 0, 1, 1,
0.8379415, 0.2427216, 1.309387, 1, 1, 1, 1, 1,
0.8437629, -0.4267224, 4.329374, 1, 1, 1, 1, 1,
0.8475233, 2.287912, 0.2337239, 1, 1, 1, 1, 1,
0.8505842, 0.5006053, 0.6306961, 1, 1, 1, 1, 1,
0.8520616, -0.1323807, 0.4310689, 1, 1, 1, 1, 1,
0.8539864, -0.3142472, -0.9789103, 1, 1, 1, 1, 1,
0.8629133, -0.2977538, 3.648533, 1, 1, 1, 1, 1,
0.8653807, 1.073321, 0.588784, 1, 1, 1, 1, 1,
0.8662541, -0.7921631, 2.546489, 1, 1, 1, 1, 1,
0.8723203, 0.08250212, 0.2283639, 1, 1, 1, 1, 1,
0.8748059, 1.672517, -0.7044038, 1, 1, 1, 1, 1,
0.875819, -0.2018588, 2.42809, 1, 1, 1, 1, 1,
0.8768854, 1.735714, -0.8070894, 1, 1, 1, 1, 1,
0.8814228, -1.225948, 3.535254, 1, 1, 1, 1, 1,
0.8872009, -0.8388332, 2.163007, 1, 1, 1, 1, 1,
0.8921911, 0.1544411, 3.03915, 0, 0, 1, 1, 1,
0.8945098, 0.2701623, 1.983809, 1, 0, 0, 1, 1,
0.8958852, -1.332372, 2.029066, 1, 0, 0, 1, 1,
0.8975607, 0.7954375, 0.680506, 1, 0, 0, 1, 1,
0.8979924, -0.8035431, 2.080628, 1, 0, 0, 1, 1,
0.8990304, -0.05868245, 0.1753807, 1, 0, 0, 1, 1,
0.8991369, 0.4491416, 2.159953, 0, 0, 0, 1, 1,
0.9046116, -0.2581677, 2.072534, 0, 0, 0, 1, 1,
0.9052061, 0.3243286, -0.07746957, 0, 0, 0, 1, 1,
0.9106766, -0.3175884, 0.06934469, 0, 0, 0, 1, 1,
0.9130784, 0.02864232, 1.750242, 0, 0, 0, 1, 1,
0.9130855, 0.6659776, 0.5254952, 0, 0, 0, 1, 1,
0.9150249, 1.336604, -0.1026922, 0, 0, 0, 1, 1,
0.9276906, 1.562315, -0.07871633, 1, 1, 1, 1, 1,
0.9380991, -1.002693, 3.651396, 1, 1, 1, 1, 1,
0.9394694, 0.6234935, 1.264364, 1, 1, 1, 1, 1,
0.9424198, 1.562002, 2.031184, 1, 1, 1, 1, 1,
0.9465199, -0.1448531, 1.80713, 1, 1, 1, 1, 1,
0.9471448, 1.427447, 0.9590207, 1, 1, 1, 1, 1,
0.9581074, -2.257117, 3.215842, 1, 1, 1, 1, 1,
0.9661726, -0.1935872, 0.8336248, 1, 1, 1, 1, 1,
0.9663764, 2.52208, 1.193509, 1, 1, 1, 1, 1,
0.9672042, -0.1373675, 1.832492, 1, 1, 1, 1, 1,
0.9690063, 0.7741094, 2.105979, 1, 1, 1, 1, 1,
0.9713306, 0.1242445, 2.649848, 1, 1, 1, 1, 1,
0.9714468, -1.766471, 1.451811, 1, 1, 1, 1, 1,
0.9720279, -1.907205, 2.343748, 1, 1, 1, 1, 1,
0.9795178, 1.731375, -0.05620865, 1, 1, 1, 1, 1,
0.979714, -0.5279888, 1.993381, 0, 0, 1, 1, 1,
0.9827501, 0.7631608, 0.9130218, 1, 0, 0, 1, 1,
0.9841875, -0.6099122, 1.072628, 1, 0, 0, 1, 1,
0.9939737, -0.6878836, 3.158745, 1, 0, 0, 1, 1,
0.9945018, 0.9156547, 0.4344333, 1, 0, 0, 1, 1,
0.996928, 1.129855, -0.0483126, 1, 0, 0, 1, 1,
0.9983255, -0.08268627, 4.060225, 0, 0, 0, 1, 1,
1.009456, -0.3216106, 2.688517, 0, 0, 0, 1, 1,
1.014139, -0.2312712, 2.832858, 0, 0, 0, 1, 1,
1.035665, -0.01727967, 2.027926, 0, 0, 0, 1, 1,
1.036127, 0.6030455, 2.706465, 0, 0, 0, 1, 1,
1.049719, -0.9791377, 2.296999, 0, 0, 0, 1, 1,
1.051923, -0.2003414, 1.992382, 0, 0, 0, 1, 1,
1.059009, -0.3593243, 0.2632729, 1, 1, 1, 1, 1,
1.061351, 0.3174248, 0.2631349, 1, 1, 1, 1, 1,
1.065576, 0.377746, -1.121469, 1, 1, 1, 1, 1,
1.075707, 0.7075807, 1.225058, 1, 1, 1, 1, 1,
1.076233, -1.494632, 2.804678, 1, 1, 1, 1, 1,
1.081656, -0.179828, 0.7392478, 1, 1, 1, 1, 1,
1.081985, 0.6719074, -0.6951134, 1, 1, 1, 1, 1,
1.092745, 0.4331285, -0.7363441, 1, 1, 1, 1, 1,
1.093555, 0.8334793, 2.707571, 1, 1, 1, 1, 1,
1.09674, -0.996592, 3.467381, 1, 1, 1, 1, 1,
1.109617, 0.9868767, 0.3389103, 1, 1, 1, 1, 1,
1.113795, 3.482621, -0.08091464, 1, 1, 1, 1, 1,
1.115805, 0.1056295, 1.531216, 1, 1, 1, 1, 1,
1.120467, 0.2788563, 2.59127, 1, 1, 1, 1, 1,
1.128, 1.785618, -0.5913702, 1, 1, 1, 1, 1,
1.130526, 0.06771451, 1.463956, 0, 0, 1, 1, 1,
1.13522, 0.8780101, 2.169806, 1, 0, 0, 1, 1,
1.138961, 0.8638065, -0.01037386, 1, 0, 0, 1, 1,
1.139461, -0.6071869, 2.863603, 1, 0, 0, 1, 1,
1.140581, -2.419041, 1.700483, 1, 0, 0, 1, 1,
1.140637, -0.6658643, 3.194779, 1, 0, 0, 1, 1,
1.141797, 1.20012, 0.3130657, 0, 0, 0, 1, 1,
1.141919, -1.468735, 2.625, 0, 0, 0, 1, 1,
1.142671, -1.697982, 1.94969, 0, 0, 0, 1, 1,
1.144048, 1.77158, 3.514405, 0, 0, 0, 1, 1,
1.147623, -0.8327364, 3.060478, 0, 0, 0, 1, 1,
1.153167, -0.2537472, 2.734045, 0, 0, 0, 1, 1,
1.163292, -0.4175222, 0.3419885, 0, 0, 0, 1, 1,
1.167025, 1.002676, -0.1620104, 1, 1, 1, 1, 1,
1.17139, 1.155582, 2.401571, 1, 1, 1, 1, 1,
1.1731, 1.733153, 0.2892107, 1, 1, 1, 1, 1,
1.177631, -0.4114366, 1.079436, 1, 1, 1, 1, 1,
1.179437, -1.205692, -0.2288116, 1, 1, 1, 1, 1,
1.195147, -0.4876499, 2.135283, 1, 1, 1, 1, 1,
1.197009, 1.535363, 2.627835, 1, 1, 1, 1, 1,
1.197389, -1.111252, 2.527039, 1, 1, 1, 1, 1,
1.197961, -1.229086, 3.178086, 1, 1, 1, 1, 1,
1.201287, 0.4532173, 2.843683, 1, 1, 1, 1, 1,
1.210069, 0.05832287, -0.3768353, 1, 1, 1, 1, 1,
1.215281, -0.4657851, -0.05352841, 1, 1, 1, 1, 1,
1.228628, -0.9847454, 2.672329, 1, 1, 1, 1, 1,
1.256349, -0.3496768, 2.486106, 1, 1, 1, 1, 1,
1.265652, -0.3670503, 3.41991, 1, 1, 1, 1, 1,
1.26737, 0.1791399, 3.307575, 0, 0, 1, 1, 1,
1.270933, -1.004868, 2.594281, 1, 0, 0, 1, 1,
1.271933, -0.02442876, -0.0704791, 1, 0, 0, 1, 1,
1.276471, -0.3790787, 2.513774, 1, 0, 0, 1, 1,
1.280978, -0.7262514, 2.086703, 1, 0, 0, 1, 1,
1.288344, 0.3746652, 1.232034, 1, 0, 0, 1, 1,
1.289, -0.1413862, 2.501146, 0, 0, 0, 1, 1,
1.293982, 1.475744, -0.214643, 0, 0, 0, 1, 1,
1.299001, -1.073932, 3.209417, 0, 0, 0, 1, 1,
1.320444, -1.661324, 3.170542, 0, 0, 0, 1, 1,
1.326647, 1.672147, 1.340397, 0, 0, 0, 1, 1,
1.327468, 2.241149, -0.5033797, 0, 0, 0, 1, 1,
1.327996, -1.796146, 2.134955, 0, 0, 0, 1, 1,
1.346146, -0.4417701, 1.460164, 1, 1, 1, 1, 1,
1.347879, -0.7025833, 0.683823, 1, 1, 1, 1, 1,
1.351968, 0.5692965, -0.9308989, 1, 1, 1, 1, 1,
1.358362, 0.3840853, 1.47298, 1, 1, 1, 1, 1,
1.363564, 0.04852591, 0.8641034, 1, 1, 1, 1, 1,
1.369408, -1.216699, 2.032059, 1, 1, 1, 1, 1,
1.375999, 0.2471583, 0.8025079, 1, 1, 1, 1, 1,
1.376012, -0.1874166, 0.5382724, 1, 1, 1, 1, 1,
1.378017, -0.2090508, 1.838833, 1, 1, 1, 1, 1,
1.386044, -0.5444286, 0.4502908, 1, 1, 1, 1, 1,
1.403665, 0.4929279, 2.136085, 1, 1, 1, 1, 1,
1.413196, -0.7041791, 2.877966, 1, 1, 1, 1, 1,
1.417068, 1.139782, 0.1882814, 1, 1, 1, 1, 1,
1.425403, 0.01477804, 2.540092, 1, 1, 1, 1, 1,
1.428591, 0.8251216, 2.195726, 1, 1, 1, 1, 1,
1.429939, -0.2395247, 1.4166, 0, 0, 1, 1, 1,
1.43497, -0.5560288, 2.984076, 1, 0, 0, 1, 1,
1.445121, -1.240337, 2.103055, 1, 0, 0, 1, 1,
1.450421, -0.9465485, 1.179156, 1, 0, 0, 1, 1,
1.460515, 1.456717, 2.390343, 1, 0, 0, 1, 1,
1.465196, -1.418264, 2.914059, 1, 0, 0, 1, 1,
1.485188, 0.2961693, 2.319802, 0, 0, 0, 1, 1,
1.497226, -2.064572, 2.278225, 0, 0, 0, 1, 1,
1.537296, -1.871664, 2.617517, 0, 0, 0, 1, 1,
1.537925, -1.496216, 3.678749, 0, 0, 0, 1, 1,
1.538945, -1.243053, 0.5753301, 0, 0, 0, 1, 1,
1.551597, 1.671479, 2.27785, 0, 0, 0, 1, 1,
1.553572, 0.5190938, -0.001441417, 0, 0, 0, 1, 1,
1.566114, -2.274613, 2.234218, 1, 1, 1, 1, 1,
1.566602, 0.8799116, -0.08175742, 1, 1, 1, 1, 1,
1.582634, -0.531912, 1.98995, 1, 1, 1, 1, 1,
1.591596, -0.2148011, 1.969603, 1, 1, 1, 1, 1,
1.592964, -1.276176, 2.417104, 1, 1, 1, 1, 1,
1.59958, 0.09778391, 1.795107, 1, 1, 1, 1, 1,
1.622483, -1.26513, 1.690888, 1, 1, 1, 1, 1,
1.64385, -2.677591, 2.557167, 1, 1, 1, 1, 1,
1.643859, 1.767362, 2.54451, 1, 1, 1, 1, 1,
1.649993, 0.306328, -0.1427564, 1, 1, 1, 1, 1,
1.654527, 1.27561, -0.6598468, 1, 1, 1, 1, 1,
1.676821, -0.5261221, 2.066477, 1, 1, 1, 1, 1,
1.68132, 0.06431385, -1.068881, 1, 1, 1, 1, 1,
1.684623, -0.5332249, 1.45114, 1, 1, 1, 1, 1,
1.706169, 0.4369562, 0.8441589, 1, 1, 1, 1, 1,
1.717999, -0.9245949, 3.007904, 0, 0, 1, 1, 1,
1.724216, -0.68893, 1.728749, 1, 0, 0, 1, 1,
1.734137, -1.069031, 1.268259, 1, 0, 0, 1, 1,
1.744884, 0.3974777, 0.2735759, 1, 0, 0, 1, 1,
1.747293, 0.938897, 1.03021, 1, 0, 0, 1, 1,
1.754919, 0.9764818, 2.00149, 1, 0, 0, 1, 1,
1.786004, 0.9422156, -0.02816033, 0, 0, 0, 1, 1,
1.791093, -0.4812886, 1.695745, 0, 0, 0, 1, 1,
1.793953, -0.1485182, 0.7181747, 0, 0, 0, 1, 1,
1.795523, -1.356621, 2.265774, 0, 0, 0, 1, 1,
1.822323, -0.05925379, 2.106204, 0, 0, 0, 1, 1,
1.847523, 0.7973611, 0.09200745, 0, 0, 0, 1, 1,
1.860735, 0.2580904, 2.148708, 0, 0, 0, 1, 1,
1.874617, -0.6126078, 1.80653, 1, 1, 1, 1, 1,
1.877193, 0.07262862, 3.519584, 1, 1, 1, 1, 1,
1.879096, 0.138826, 1.925357, 1, 1, 1, 1, 1,
1.907333, 0.6866415, 1.604985, 1, 1, 1, 1, 1,
1.953064, 1.007685, 1.936181, 1, 1, 1, 1, 1,
1.958069, -0.02934531, 2.16225, 1, 1, 1, 1, 1,
1.97859, 1.280206, -0.1777326, 1, 1, 1, 1, 1,
1.994053, 1.179954, 1.396748, 1, 1, 1, 1, 1,
2.002198, 0.5039582, 2.388255, 1, 1, 1, 1, 1,
2.004317, -0.9989517, 3.323336, 1, 1, 1, 1, 1,
2.008599, -1.833119, 3.467039, 1, 1, 1, 1, 1,
2.030043, -0.1854869, 2.561165, 1, 1, 1, 1, 1,
2.068585, 0.5906062, 2.584597, 1, 1, 1, 1, 1,
2.086568, -0.02550964, 1.751622, 1, 1, 1, 1, 1,
2.090697, -0.2767051, 1.200547, 1, 1, 1, 1, 1,
2.117872, 0.4369671, 1.592408, 0, 0, 1, 1, 1,
2.130466, 0.06139807, 1.955131, 1, 0, 0, 1, 1,
2.133839, -0.2415697, 0.949304, 1, 0, 0, 1, 1,
2.141091, -0.4247926, 1.610157, 1, 0, 0, 1, 1,
2.174786, 0.2385367, 2.517894, 1, 0, 0, 1, 1,
2.182787, 0.5066432, 2.330653, 1, 0, 0, 1, 1,
2.227406, -0.7079825, 2.095365, 0, 0, 0, 1, 1,
2.268429, -0.2032924, 2.297456, 0, 0, 0, 1, 1,
2.296726, 0.1436811, 1.423204, 0, 0, 0, 1, 1,
2.297073, 0.1267346, -0.5798739, 0, 0, 0, 1, 1,
2.349607, 0.2148113, 1.675309, 0, 0, 0, 1, 1,
2.412333, -0.4538731, 1.629575, 0, 0, 0, 1, 1,
2.42598, 0.4931681, -1.021983, 0, 0, 0, 1, 1,
2.427572, 0.4534055, 0.8619517, 1, 1, 1, 1, 1,
2.561851, 0.5252385, 1.315024, 1, 1, 1, 1, 1,
2.570037, 0.8366593, -1.069061, 1, 1, 1, 1, 1,
2.639261, -0.497233, 0.6969169, 1, 1, 1, 1, 1,
2.854687, 0.7140347, 0.1245244, 1, 1, 1, 1, 1,
3.028011, -0.8126445, 2.393846, 1, 1, 1, 1, 1,
3.0423, 0.1690789, 2.702919, 1, 1, 1, 1, 1
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
var radius = 9.977418;
var distance = 35.04526;
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
mvMatrix.translate( 0.002211809, 0.3584135, 0.3533282 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.04526);
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