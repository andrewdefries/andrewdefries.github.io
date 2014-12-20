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
-3.108392, -0.2777204, 0.1911553, 1, 0, 0, 1,
-3.045115, 0.85394, 1.8154, 1, 0.007843138, 0, 1,
-2.988729, 0.5788772, -2.970325, 1, 0.01176471, 0, 1,
-2.936926, 0.6846901, -2.959533, 1, 0.01960784, 0, 1,
-2.91955, -0.7177262, -2.943298, 1, 0.02352941, 0, 1,
-2.724159, -0.2395525, -1.239911, 1, 0.03137255, 0, 1,
-2.529625, -1.085587, -3.249584, 1, 0.03529412, 0, 1,
-2.497716, 0.5822297, 0.02976097, 1, 0.04313726, 0, 1,
-2.464379, -1.307396, -1.927728, 1, 0.04705882, 0, 1,
-2.431128, -0.2923991, -2.128459, 1, 0.05490196, 0, 1,
-2.364464, -0.6414279, -0.5034506, 1, 0.05882353, 0, 1,
-2.268175, 0.7594141, -2.133775, 1, 0.06666667, 0, 1,
-2.237433, 0.8100185, -1.646324, 1, 0.07058824, 0, 1,
-2.23037, -0.7235696, -2.724334, 1, 0.07843138, 0, 1,
-2.209395, -0.007838832, -2.309269, 1, 0.08235294, 0, 1,
-2.206109, -0.9964755, -1.800786, 1, 0.09019608, 0, 1,
-2.189513, 0.4753801, -0.5290308, 1, 0.09411765, 0, 1,
-2.188174, 0.06495117, -2.920474, 1, 0.1019608, 0, 1,
-2.186054, -0.2673581, -1.405241, 1, 0.1098039, 0, 1,
-2.170932, -0.6951726, -1.237015, 1, 0.1137255, 0, 1,
-2.161086, -0.7219067, -2.884318, 1, 0.1215686, 0, 1,
-2.16001, 1.462381, -1.544811, 1, 0.1254902, 0, 1,
-2.137886, -0.8675034, -1.29452, 1, 0.1333333, 0, 1,
-2.109733, 0.8813109, -0.7936611, 1, 0.1372549, 0, 1,
-2.082608, 1.334447, -0.8815234, 1, 0.145098, 0, 1,
-2.071813, 0.4461989, -2.916991, 1, 0.1490196, 0, 1,
-2.053111, -0.8440158, -3.471182, 1, 0.1568628, 0, 1,
-2.051546, 1.136569, -2.21009, 1, 0.1607843, 0, 1,
-2.045618, -0.3947944, -2.89441, 1, 0.1686275, 0, 1,
-2.035098, 1.110203, -0.5714389, 1, 0.172549, 0, 1,
-2.008927, 1.468149, -1.10689, 1, 0.1803922, 0, 1,
-2.006834, 1.359088, 0.8939806, 1, 0.1843137, 0, 1,
-2.002197, -0.291627, -1.810653, 1, 0.1921569, 0, 1,
-1.999222, -0.2795171, -1.732767, 1, 0.1960784, 0, 1,
-1.929792, -1.553588, -1.563203, 1, 0.2039216, 0, 1,
-1.922772, 1.867294, -1.560521, 1, 0.2117647, 0, 1,
-1.921775, -1.561063, -3.204983, 1, 0.2156863, 0, 1,
-1.886203, -0.05757139, -1.288136, 1, 0.2235294, 0, 1,
-1.883159, -0.4602062, 0.518254, 1, 0.227451, 0, 1,
-1.871433, -1.184027, -1.963271, 1, 0.2352941, 0, 1,
-1.870197, 0.3949012, -2.89852, 1, 0.2392157, 0, 1,
-1.796005, -0.7870322, -0.2411216, 1, 0.2470588, 0, 1,
-1.791094, 0.1964451, -1.878067, 1, 0.2509804, 0, 1,
-1.779957, 0.2553251, -0.4208874, 1, 0.2588235, 0, 1,
-1.777529, 2.191304, -1.976175, 1, 0.2627451, 0, 1,
-1.775649, -0.8304955, -0.7378557, 1, 0.2705882, 0, 1,
-1.760588, 1.533276, -2.143606, 1, 0.2745098, 0, 1,
-1.758364, -1.192187, -2.623583, 1, 0.282353, 0, 1,
-1.735116, 0.4262285, -0.9394109, 1, 0.2862745, 0, 1,
-1.730411, -1.12235, -1.425732, 1, 0.2941177, 0, 1,
-1.728254, -0.1547012, -3.38289, 1, 0.3019608, 0, 1,
-1.70922, -0.223884, -0.6422517, 1, 0.3058824, 0, 1,
-1.690358, -2.602853, -2.395374, 1, 0.3137255, 0, 1,
-1.689139, 0.9959432, -0.8369655, 1, 0.3176471, 0, 1,
-1.687332, -0.03691426, -2.828912, 1, 0.3254902, 0, 1,
-1.682529, -1.172104, -3.285358, 1, 0.3294118, 0, 1,
-1.659909, 0.06939643, -1.050598, 1, 0.3372549, 0, 1,
-1.650788, 0.1723762, -0.6056445, 1, 0.3411765, 0, 1,
-1.649105, -1.176452, -1.960415, 1, 0.3490196, 0, 1,
-1.636746, -0.9802228, -2.311474, 1, 0.3529412, 0, 1,
-1.635187, 0.1552866, -1.128312, 1, 0.3607843, 0, 1,
-1.62963, 1.652109, 0.6465127, 1, 0.3647059, 0, 1,
-1.618657, -0.3011612, -2.153438, 1, 0.372549, 0, 1,
-1.615009, -0.1121505, -0.1048046, 1, 0.3764706, 0, 1,
-1.613321, -0.7896262, -2.744878, 1, 0.3843137, 0, 1,
-1.591648, 0.7637044, 0.7818736, 1, 0.3882353, 0, 1,
-1.585703, 0.4513663, -1.495403, 1, 0.3960784, 0, 1,
-1.574837, 1.460667, -1.167246, 1, 0.4039216, 0, 1,
-1.567349, 0.1622041, -2.489369, 1, 0.4078431, 0, 1,
-1.564975, 2.330836, -0.6861269, 1, 0.4156863, 0, 1,
-1.552314, 0.9873399, -1.406342, 1, 0.4196078, 0, 1,
-1.549484, -0.3892541, -3.953339, 1, 0.427451, 0, 1,
-1.538342, 1.632194, -2.337563, 1, 0.4313726, 0, 1,
-1.536191, 0.7891338, -0.242736, 1, 0.4392157, 0, 1,
-1.527185, -0.3585213, -1.899313, 1, 0.4431373, 0, 1,
-1.525062, 1.880838, -1.574379, 1, 0.4509804, 0, 1,
-1.523071, 0.1464494, -2.96838, 1, 0.454902, 0, 1,
-1.511104, -0.8264017, -1.283563, 1, 0.4627451, 0, 1,
-1.508765, -1.451398, -1.535259, 1, 0.4666667, 0, 1,
-1.507347, 1.641663, 0.4339541, 1, 0.4745098, 0, 1,
-1.503897, -0.07401578, -2.293987, 1, 0.4784314, 0, 1,
-1.498607, 0.7717863, -1.962447, 1, 0.4862745, 0, 1,
-1.468864, 0.3445401, -2.68052, 1, 0.4901961, 0, 1,
-1.455107, 0.769743, -2.431719, 1, 0.4980392, 0, 1,
-1.451952, -2.980453, -2.897151, 1, 0.5058824, 0, 1,
-1.450082, -0.5351394, -2.406972, 1, 0.509804, 0, 1,
-1.435212, -0.3587714, -2.305497, 1, 0.5176471, 0, 1,
-1.423627, 0.344605, -0.6788036, 1, 0.5215687, 0, 1,
-1.42099, 0.6293684, -0.5953485, 1, 0.5294118, 0, 1,
-1.41972, -0.2504773, -1.210814, 1, 0.5333334, 0, 1,
-1.388135, -0.8341159, -1.208972, 1, 0.5411765, 0, 1,
-1.361575, 0.3216145, -1.070244, 1, 0.5450981, 0, 1,
-1.355206, -0.07532151, -1.200642, 1, 0.5529412, 0, 1,
-1.352871, -0.3509572, -0.448411, 1, 0.5568628, 0, 1,
-1.33881, -1.251341, -2.32013, 1, 0.5647059, 0, 1,
-1.3324, 1.223837, -2.477943, 1, 0.5686275, 0, 1,
-1.32595, 1.070153, -1.075987, 1, 0.5764706, 0, 1,
-1.321909, 1.656564, -0.5134398, 1, 0.5803922, 0, 1,
-1.31731, 0.2088119, -2.001186, 1, 0.5882353, 0, 1,
-1.31265, 0.05274357, -2.560372, 1, 0.5921569, 0, 1,
-1.308701, 0.05252471, -3.052933, 1, 0.6, 0, 1,
-1.303788, 0.9674019, 0.3084292, 1, 0.6078432, 0, 1,
-1.299746, 1.281832, -1.749383, 1, 0.6117647, 0, 1,
-1.291614, -1.273114, -3.485271, 1, 0.6196079, 0, 1,
-1.290458, -1.098605, -1.024781, 1, 0.6235294, 0, 1,
-1.281775, 0.5478576, -0.3807764, 1, 0.6313726, 0, 1,
-1.278804, 0.3347949, -0.4665312, 1, 0.6352941, 0, 1,
-1.277757, -0.1623758, -1.307376, 1, 0.6431373, 0, 1,
-1.26196, 0.7101849, -1.081101, 1, 0.6470588, 0, 1,
-1.259642, -0.4520883, -1.866842, 1, 0.654902, 0, 1,
-1.257569, 0.1500658, -1.755964, 1, 0.6588235, 0, 1,
-1.256893, 0.438196, -1.923342, 1, 0.6666667, 0, 1,
-1.236855, 1.364271, 0.9418204, 1, 0.6705883, 0, 1,
-1.229569, 3.354907, -0.4626654, 1, 0.6784314, 0, 1,
-1.227224, -0.8912867, -2.510972, 1, 0.682353, 0, 1,
-1.225908, 0.5975625, -1.420429, 1, 0.6901961, 0, 1,
-1.225821, 1.025684, -1.727579, 1, 0.6941177, 0, 1,
-1.223131, -0.4742828, -2.659852, 1, 0.7019608, 0, 1,
-1.218028, 0.1346669, 0.5572159, 1, 0.7098039, 0, 1,
-1.214789, -1.514056, -2.225213, 1, 0.7137255, 0, 1,
-1.214406, 1.074797, -1.605122, 1, 0.7215686, 0, 1,
-1.214, 3.145425, -2.367217, 1, 0.7254902, 0, 1,
-1.212165, -0.8881271, -2.463548, 1, 0.7333333, 0, 1,
-1.209551, -0.5874608, -2.42221, 1, 0.7372549, 0, 1,
-1.208804, 0.09716664, -1.051095, 1, 0.7450981, 0, 1,
-1.191853, 0.4198526, -2.008725, 1, 0.7490196, 0, 1,
-1.173073, -0.490357, -4.777707, 1, 0.7568628, 0, 1,
-1.171079, 0.3973361, -1.803355, 1, 0.7607843, 0, 1,
-1.170414, 0.2875575, -2.492672, 1, 0.7686275, 0, 1,
-1.154054, -1.044838, -4.621738, 1, 0.772549, 0, 1,
-1.15241, -0.8731543, -2.27178, 1, 0.7803922, 0, 1,
-1.149649, -0.4641847, -2.215507, 1, 0.7843137, 0, 1,
-1.149574, -1.082796, -2.359705, 1, 0.7921569, 0, 1,
-1.148914, -0.8899527, -2.661366, 1, 0.7960784, 0, 1,
-1.148021, -0.01988794, -0.1086942, 1, 0.8039216, 0, 1,
-1.143948, 0.4749467, -1.284918, 1, 0.8117647, 0, 1,
-1.142385, -1.035486, -1.535166, 1, 0.8156863, 0, 1,
-1.139824, -0.9037141, -0.3813031, 1, 0.8235294, 0, 1,
-1.138908, 0.2491435, -0.8310673, 1, 0.827451, 0, 1,
-1.132579, 2.473025, -2.248949, 1, 0.8352941, 0, 1,
-1.12782, -1.431143, -2.900756, 1, 0.8392157, 0, 1,
-1.124333, 1.950517, 0.2741486, 1, 0.8470588, 0, 1,
-1.121793, 0.116812, -1.067635, 1, 0.8509804, 0, 1,
-1.121728, 1.619756, -0.07117105, 1, 0.8588235, 0, 1,
-1.096418, -0.1989584, -0.9813606, 1, 0.8627451, 0, 1,
-1.081483, -0.4948448, -2.446505, 1, 0.8705882, 0, 1,
-1.071996, 0.418854, -1.119069, 1, 0.8745098, 0, 1,
-1.061836, -0.2429937, -1.329842, 1, 0.8823529, 0, 1,
-1.058542, -1.099743, -2.028608, 1, 0.8862745, 0, 1,
-1.054174, 1.215351, -0.3273997, 1, 0.8941177, 0, 1,
-1.052028, 0.0476899, -2.438743, 1, 0.8980392, 0, 1,
-1.043178, 0.1306249, -0.8546591, 1, 0.9058824, 0, 1,
-1.039457, 0.3711305, -2.21678, 1, 0.9137255, 0, 1,
-1.035118, 1.005307, -0.7085977, 1, 0.9176471, 0, 1,
-1.032535, -0.3163852, -2.037426, 1, 0.9254902, 0, 1,
-1.032117, -0.76389, -2.48284, 1, 0.9294118, 0, 1,
-1.012996, -0.9005352, -2.718697, 1, 0.9372549, 0, 1,
-1.005599, -2.006481, -2.069488, 1, 0.9411765, 0, 1,
-0.9833825, -0.08784169, -1.122091, 1, 0.9490196, 0, 1,
-0.9658809, 0.3539328, 0.2592565, 1, 0.9529412, 0, 1,
-0.9655018, 0.9111328, -0.4668636, 1, 0.9607843, 0, 1,
-0.9621428, 0.4269074, -2.173483, 1, 0.9647059, 0, 1,
-0.9621314, -0.7415804, -2.248046, 1, 0.972549, 0, 1,
-0.9611371, -0.02961908, -0.9518306, 1, 0.9764706, 0, 1,
-0.9602719, 1.332191, -0.01576014, 1, 0.9843137, 0, 1,
-0.9582642, 0.8075058, 0.3185221, 1, 0.9882353, 0, 1,
-0.9500622, 0.5095162, -1.388907, 1, 0.9960784, 0, 1,
-0.9480116, 0.04778644, 0.1568125, 0.9960784, 1, 0, 1,
-0.9441519, 0.5625237, -0.3224956, 0.9921569, 1, 0, 1,
-0.9401938, -0.08048575, -0.5759398, 0.9843137, 1, 0, 1,
-0.9393224, 2.077975, -1.133929, 0.9803922, 1, 0, 1,
-0.934298, -0.234568, -1.520124, 0.972549, 1, 0, 1,
-0.9290958, -1.045513, -1.357574, 0.9686275, 1, 0, 1,
-0.9288179, -1.291721, -2.114403, 0.9607843, 1, 0, 1,
-0.9268668, -0.6824788, -2.072353, 0.9568627, 1, 0, 1,
-0.9262204, 1.173286, 0.1679276, 0.9490196, 1, 0, 1,
-0.923606, 0.2358864, -2.334353, 0.945098, 1, 0, 1,
-0.9221622, 0.5768257, -2.033539, 0.9372549, 1, 0, 1,
-0.9185126, 0.9745793, 0.7163945, 0.9333333, 1, 0, 1,
-0.9104883, 0.8254511, -1.772234, 0.9254902, 1, 0, 1,
-0.9103534, 0.4415634, -0.9941048, 0.9215686, 1, 0, 1,
-0.9059452, 0.1701399, -3.128334, 0.9137255, 1, 0, 1,
-0.9016018, 2.324352, 1.703014, 0.9098039, 1, 0, 1,
-0.8993705, -0.8308257, -2.300523, 0.9019608, 1, 0, 1,
-0.8967384, 0.04257718, -3.55698, 0.8941177, 1, 0, 1,
-0.8847553, -0.2563402, -2.469214, 0.8901961, 1, 0, 1,
-0.8772491, 0.04532413, -2.232, 0.8823529, 1, 0, 1,
-0.8761458, -1.094009, -1.974927, 0.8784314, 1, 0, 1,
-0.8741167, -0.9864662, -1.358085, 0.8705882, 1, 0, 1,
-0.8703645, 0.6150014, -1.536353, 0.8666667, 1, 0, 1,
-0.8684316, -0.1008903, -0.4419047, 0.8588235, 1, 0, 1,
-0.8679536, -0.8537302, -2.067487, 0.854902, 1, 0, 1,
-0.8663467, 1.209944, -0.8201539, 0.8470588, 1, 0, 1,
-0.8626409, 1.180506, 1.792923, 0.8431373, 1, 0, 1,
-0.8599325, 0.6083585, -0.9172359, 0.8352941, 1, 0, 1,
-0.8590018, 1.91899, 0.3687512, 0.8313726, 1, 0, 1,
-0.858145, -0.9545224, -3.806674, 0.8235294, 1, 0, 1,
-0.8572105, -0.4836774, -2.795987, 0.8196079, 1, 0, 1,
-0.8556095, -0.1283261, -0.929687, 0.8117647, 1, 0, 1,
-0.8545064, 0.178559, 0.05744314, 0.8078431, 1, 0, 1,
-0.8508825, -0.01686057, -0.9351996, 0.8, 1, 0, 1,
-0.8398582, -0.2853725, -2.227792, 0.7921569, 1, 0, 1,
-0.8317134, -0.1642307, -2.604803, 0.7882353, 1, 0, 1,
-0.829479, -0.09833954, -1.932858, 0.7803922, 1, 0, 1,
-0.8263556, 0.8348947, 0.8802173, 0.7764706, 1, 0, 1,
-0.8255943, -1.259622, -3.063717, 0.7686275, 1, 0, 1,
-0.8169264, -1.966101, -4.234103, 0.7647059, 1, 0, 1,
-0.8166586, -0.336413, -3.219796, 0.7568628, 1, 0, 1,
-0.8164061, -1.243455, -3.310957, 0.7529412, 1, 0, 1,
-0.8091261, -2.325856, -0.5751514, 0.7450981, 1, 0, 1,
-0.8031514, 0.7977574, -0.2126271, 0.7411765, 1, 0, 1,
-0.8010772, -0.6099039, -0.7439981, 0.7333333, 1, 0, 1,
-0.801005, -0.1228312, -2.382137, 0.7294118, 1, 0, 1,
-0.7967103, 1.820349, -0.177886, 0.7215686, 1, 0, 1,
-0.7940952, 0.5099426, -0.3300664, 0.7176471, 1, 0, 1,
-0.7931759, -0.4019468, -2.086758, 0.7098039, 1, 0, 1,
-0.7928602, -0.9262089, -2.51961, 0.7058824, 1, 0, 1,
-0.7928572, -0.8554895, -0.8209394, 0.6980392, 1, 0, 1,
-0.7906553, -1.208719, -2.221764, 0.6901961, 1, 0, 1,
-0.7903001, -0.5392556, -2.286128, 0.6862745, 1, 0, 1,
-0.7874005, -0.5159499, -1.544187, 0.6784314, 1, 0, 1,
-0.7865211, 0.6619856, -1.026888, 0.6745098, 1, 0, 1,
-0.7800142, 1.493662, 0.7228777, 0.6666667, 1, 0, 1,
-0.7792067, 0.1009447, -1.780877, 0.6627451, 1, 0, 1,
-0.771732, 0.8688647, -1.665275, 0.654902, 1, 0, 1,
-0.7708884, -1.215665, -1.140705, 0.6509804, 1, 0, 1,
-0.7602627, 0.6968866, -1.415348, 0.6431373, 1, 0, 1,
-0.7598121, 0.2308521, -1.244621, 0.6392157, 1, 0, 1,
-0.7547116, 0.5233611, -3.762107, 0.6313726, 1, 0, 1,
-0.7529885, -0.3143496, -2.439359, 0.627451, 1, 0, 1,
-0.752713, 0.4291302, -1.101196, 0.6196079, 1, 0, 1,
-0.7514801, -0.7786409, -2.876748, 0.6156863, 1, 0, 1,
-0.7508764, 2.864999, 1.859372, 0.6078432, 1, 0, 1,
-0.7495775, 0.3653422, 1.000108, 0.6039216, 1, 0, 1,
-0.7466667, 0.936052, -0.4870372, 0.5960785, 1, 0, 1,
-0.7422036, 2.134362, -0.7378892, 0.5882353, 1, 0, 1,
-0.7395067, 0.08480136, -1.990906, 0.5843138, 1, 0, 1,
-0.7354214, -0.3168029, -1.447408, 0.5764706, 1, 0, 1,
-0.7333651, -0.6220778, -1.730316, 0.572549, 1, 0, 1,
-0.7281891, 0.3567335, 1.423964, 0.5647059, 1, 0, 1,
-0.7186546, -1.981174, -2.786422, 0.5607843, 1, 0, 1,
-0.7174242, -1.827112, -2.636791, 0.5529412, 1, 0, 1,
-0.713364, -0.4678324, -2.148847, 0.5490196, 1, 0, 1,
-0.6938987, 1.286888, 1.101811, 0.5411765, 1, 0, 1,
-0.6928617, -0.2825785, -0.8420708, 0.5372549, 1, 0, 1,
-0.6890894, -1.037699, -3.377441, 0.5294118, 1, 0, 1,
-0.6878159, -0.2200973, -3.261224, 0.5254902, 1, 0, 1,
-0.6867205, -0.3324653, -1.259885, 0.5176471, 1, 0, 1,
-0.6826527, 0.2580771, -1.799546, 0.5137255, 1, 0, 1,
-0.680165, 0.02407701, -1.845725, 0.5058824, 1, 0, 1,
-0.6788214, -0.4879655, -1.028684, 0.5019608, 1, 0, 1,
-0.6778689, -0.6516309, -1.614193, 0.4941176, 1, 0, 1,
-0.675079, 0.3075774, -0.422867, 0.4862745, 1, 0, 1,
-0.6688978, -0.6333471, -1.997293, 0.4823529, 1, 0, 1,
-0.665715, -0.705411, -1.600718, 0.4745098, 1, 0, 1,
-0.6644822, 0.2645237, -0.6791755, 0.4705882, 1, 0, 1,
-0.6626122, -0.2246387, -2.33082, 0.4627451, 1, 0, 1,
-0.6571238, -0.7994533, -1.927301, 0.4588235, 1, 0, 1,
-0.6570427, -0.05860075, -1.773656, 0.4509804, 1, 0, 1,
-0.6536013, -0.7434856, -2.688867, 0.4470588, 1, 0, 1,
-0.6534303, -0.8118873, -4.255624, 0.4392157, 1, 0, 1,
-0.648087, 1.201587, -2.158426, 0.4352941, 1, 0, 1,
-0.6454741, 1.433501, -0.4006179, 0.427451, 1, 0, 1,
-0.6409386, -1.168747, -2.416438, 0.4235294, 1, 0, 1,
-0.6391975, -0.7053652, -3.230772, 0.4156863, 1, 0, 1,
-0.637799, 2.120288, 1.922414, 0.4117647, 1, 0, 1,
-0.6349242, 1.292122, -0.297784, 0.4039216, 1, 0, 1,
-0.629436, -1.031062, -2.00525, 0.3960784, 1, 0, 1,
-0.6163027, 0.3776222, -1.938094, 0.3921569, 1, 0, 1,
-0.6131354, 1.326149, -0.9282936, 0.3843137, 1, 0, 1,
-0.6107595, -0.9747413, 0.03973855, 0.3803922, 1, 0, 1,
-0.6097614, 0.7349136, -0.7763332, 0.372549, 1, 0, 1,
-0.6079597, -1.729459, -2.817002, 0.3686275, 1, 0, 1,
-0.5998089, -0.535065, -0.5242794, 0.3607843, 1, 0, 1,
-0.5907912, -0.3228544, -3.193527, 0.3568628, 1, 0, 1,
-0.5895746, 0.94857, -0.9009873, 0.3490196, 1, 0, 1,
-0.5885151, -0.319146, -2.449629, 0.345098, 1, 0, 1,
-0.5773748, -0.9283296, -3.298322, 0.3372549, 1, 0, 1,
-0.5762871, 1.937925, -0.2239221, 0.3333333, 1, 0, 1,
-0.5684234, -1.434963, -1.572978, 0.3254902, 1, 0, 1,
-0.561749, 0.4806297, -1.921763, 0.3215686, 1, 0, 1,
-0.5601669, 0.3905117, 0.7377228, 0.3137255, 1, 0, 1,
-0.5549842, 1.220696, -1.434697, 0.3098039, 1, 0, 1,
-0.5531424, 1.260205, -0.865822, 0.3019608, 1, 0, 1,
-0.5506564, 2.806752, -0.2983158, 0.2941177, 1, 0, 1,
-0.5469568, -0.318297, -1.25751, 0.2901961, 1, 0, 1,
-0.539415, 0.6261765, -0.4385418, 0.282353, 1, 0, 1,
-0.5373619, 0.1053776, -1.60132, 0.2784314, 1, 0, 1,
-0.5344403, -0.5873613, -2.823648, 0.2705882, 1, 0, 1,
-0.5322256, -1.645569, -2.148243, 0.2666667, 1, 0, 1,
-0.5313346, -0.3194413, -1.358704, 0.2588235, 1, 0, 1,
-0.5246645, 0.8588243, -3.146175, 0.254902, 1, 0, 1,
-0.5234243, -0.9069083, -0.9130052, 0.2470588, 1, 0, 1,
-0.5233901, 1.726912, -0.7741228, 0.2431373, 1, 0, 1,
-0.5177082, -0.524209, -2.639966, 0.2352941, 1, 0, 1,
-0.5141805, 0.3678135, -0.5255231, 0.2313726, 1, 0, 1,
-0.5086251, 0.3167106, -0.2253922, 0.2235294, 1, 0, 1,
-0.5077202, 0.1214207, -2.147836, 0.2196078, 1, 0, 1,
-0.5062175, 0.8748192, -1.759173, 0.2117647, 1, 0, 1,
-0.5061732, 2.392088, -1.000195, 0.2078431, 1, 0, 1,
-0.5058076, -1.249103, -2.696984, 0.2, 1, 0, 1,
-0.4980197, 1.019439, 1.17815, 0.1921569, 1, 0, 1,
-0.4961403, -0.8810215, -4.596449, 0.1882353, 1, 0, 1,
-0.4950242, -2.798659, -2.175359, 0.1803922, 1, 0, 1,
-0.4867141, -1.626763, -3.206743, 0.1764706, 1, 0, 1,
-0.4849582, -2.190726, -4.923429, 0.1686275, 1, 0, 1,
-0.4831354, 0.3060088, -2.204962, 0.1647059, 1, 0, 1,
-0.4830004, -1.182675, -3.049417, 0.1568628, 1, 0, 1,
-0.4817354, -0.5605403, -2.448638, 0.1529412, 1, 0, 1,
-0.4814542, 0.2136257, -3.275203, 0.145098, 1, 0, 1,
-0.4802369, 0.8416276, 0.7862852, 0.1411765, 1, 0, 1,
-0.4777158, 1.375146, 0.2297028, 0.1333333, 1, 0, 1,
-0.4730299, -1.356302, -1.819587, 0.1294118, 1, 0, 1,
-0.4713542, -1.114718, -2.991543, 0.1215686, 1, 0, 1,
-0.4691178, -1.787193, -3.436299, 0.1176471, 1, 0, 1,
-0.4609596, 0.0003530211, -0.5377763, 0.1098039, 1, 0, 1,
-0.4551386, -1.659913, -2.898045, 0.1058824, 1, 0, 1,
-0.4514062, -0.9155326, -3.071627, 0.09803922, 1, 0, 1,
-0.4498625, 0.4052287, -0.5606382, 0.09019608, 1, 0, 1,
-0.4453314, 1.949387, -0.1109012, 0.08627451, 1, 0, 1,
-0.4410399, -1.216651, -4.215077, 0.07843138, 1, 0, 1,
-0.4393261, 0.627189, -1.984635, 0.07450981, 1, 0, 1,
-0.4361214, 0.3807148, -1.240773, 0.06666667, 1, 0, 1,
-0.4359823, 0.2898102, -0.1412008, 0.0627451, 1, 0, 1,
-0.4321507, -0.397768, -2.950004, 0.05490196, 1, 0, 1,
-0.4306943, -0.2903955, -3.430207, 0.05098039, 1, 0, 1,
-0.4266741, 0.9141431, 0.9768969, 0.04313726, 1, 0, 1,
-0.4241504, -0.05427188, -2.889532, 0.03921569, 1, 0, 1,
-0.423635, 0.5892551, -1.060359, 0.03137255, 1, 0, 1,
-0.4193681, -0.5693271, -2.002252, 0.02745098, 1, 0, 1,
-0.4180369, -0.698062, -2.702509, 0.01960784, 1, 0, 1,
-0.4161456, -0.4761921, -3.698887, 0.01568628, 1, 0, 1,
-0.413693, -1.543517, -4.794572, 0.007843138, 1, 0, 1,
-0.4119934, -1.609343, -1.376417, 0.003921569, 1, 0, 1,
-0.411919, -0.7931529, -2.655735, 0, 1, 0.003921569, 1,
-0.4061821, 0.4663069, -0.04011404, 0, 1, 0.01176471, 1,
-0.4050485, 0.1483901, 0.8612462, 0, 1, 0.01568628, 1,
-0.4048008, 1.025385, -0.8362198, 0, 1, 0.02352941, 1,
-0.3901309, -1.111207, -2.756354, 0, 1, 0.02745098, 1,
-0.3900512, -1.001945, -3.196683, 0, 1, 0.03529412, 1,
-0.3839141, -1.424221, -3.544229, 0, 1, 0.03921569, 1,
-0.3824823, 0.7221564, -0.6451172, 0, 1, 0.04705882, 1,
-0.3778001, 0.5503732, 0.2578871, 0, 1, 0.05098039, 1,
-0.3751733, 0.6501199, 0.2508081, 0, 1, 0.05882353, 1,
-0.3750743, -0.5053481, -2.880878, 0, 1, 0.0627451, 1,
-0.3730097, -0.1906077, -1.682451, 0, 1, 0.07058824, 1,
-0.3672451, 0.7319421, 0.3415002, 0, 1, 0.07450981, 1,
-0.3610758, -0.9466204, -2.809605, 0, 1, 0.08235294, 1,
-0.358008, 0.00719087, -1.217925, 0, 1, 0.08627451, 1,
-0.3551689, 0.3478457, -2.487356, 0, 1, 0.09411765, 1,
-0.3520805, 0.448577, -1.31917, 0, 1, 0.1019608, 1,
-0.3512145, -1.331858, -1.205276, 0, 1, 0.1058824, 1,
-0.351163, 0.7960274, 1.1067, 0, 1, 0.1137255, 1,
-0.350066, 0.4935922, 0.420831, 0, 1, 0.1176471, 1,
-0.3465309, -0.5270966, -2.438172, 0, 1, 0.1254902, 1,
-0.3458841, -0.2185464, -2.844202, 0, 1, 0.1294118, 1,
-0.3447978, -0.752537, -1.938792, 0, 1, 0.1372549, 1,
-0.3423718, -0.8364075, -3.983908, 0, 1, 0.1411765, 1,
-0.3394743, 0.502529, -1.367983, 0, 1, 0.1490196, 1,
-0.3387183, -0.621334, -2.536679, 0, 1, 0.1529412, 1,
-0.3378488, -1.059603, -2.358318, 0, 1, 0.1607843, 1,
-0.3374722, -0.6890109, -0.3634822, 0, 1, 0.1647059, 1,
-0.3352914, -0.4303149, -2.152357, 0, 1, 0.172549, 1,
-0.3344961, 0.6914129, -0.7397587, 0, 1, 0.1764706, 1,
-0.3338276, -0.1528795, -1.991907, 0, 1, 0.1843137, 1,
-0.3280463, 0.4406099, -1.007877, 0, 1, 0.1882353, 1,
-0.325979, -1.213796, -2.593308, 0, 1, 0.1960784, 1,
-0.3226638, 0.03074878, -1.575296, 0, 1, 0.2039216, 1,
-0.3223491, -0.4071603, -2.055321, 0, 1, 0.2078431, 1,
-0.3178445, 1.746737, -2.071899, 0, 1, 0.2156863, 1,
-0.3156047, -0.4583315, -2.76422, 0, 1, 0.2196078, 1,
-0.3074101, 0.3154037, -1.696132, 0, 1, 0.227451, 1,
-0.3071329, 0.549562, -1.440433, 0, 1, 0.2313726, 1,
-0.3054385, 1.531681, 0.3628173, 0, 1, 0.2392157, 1,
-0.3003017, -1.297898, -2.201291, 0, 1, 0.2431373, 1,
-0.2986726, -0.8179435, -2.410535, 0, 1, 0.2509804, 1,
-0.2986389, -1.681378, -3.717257, 0, 1, 0.254902, 1,
-0.2964831, -0.4188907, -3.175565, 0, 1, 0.2627451, 1,
-0.2960379, -0.7976548, -3.686953, 0, 1, 0.2666667, 1,
-0.2860292, 0.3975242, -0.6452947, 0, 1, 0.2745098, 1,
-0.2849408, 0.4959776, -0.9022593, 0, 1, 0.2784314, 1,
-0.2846522, -0.4463474, -2.973912, 0, 1, 0.2862745, 1,
-0.284027, 0.6503638, -1.801766, 0, 1, 0.2901961, 1,
-0.2813327, 0.7058951, -0.6026813, 0, 1, 0.2980392, 1,
-0.2810063, -0.006148813, 0.7343852, 0, 1, 0.3058824, 1,
-0.2803878, -1.149807, -2.238661, 0, 1, 0.3098039, 1,
-0.2802799, 0.6052849, -0.3890918, 0, 1, 0.3176471, 1,
-0.2755012, 2.274161, -0.568921, 0, 1, 0.3215686, 1,
-0.2737878, 0.5820427, -0.1210003, 0, 1, 0.3294118, 1,
-0.2712035, -1.067179, -3.630812, 0, 1, 0.3333333, 1,
-0.2705726, 0.01358066, -0.5807454, 0, 1, 0.3411765, 1,
-0.2701876, -0.9411748, -4.476216, 0, 1, 0.345098, 1,
-0.2700037, 0.1550627, -0.9347873, 0, 1, 0.3529412, 1,
-0.263328, 0.03661801, -1.308, 0, 1, 0.3568628, 1,
-0.256891, 0.9785105, -0.5503736, 0, 1, 0.3647059, 1,
-0.2557119, 0.9104602, 2.42899, 0, 1, 0.3686275, 1,
-0.2536552, 0.3019591, -0.9343829, 0, 1, 0.3764706, 1,
-0.2512765, -0.7218298, -3.32394, 0, 1, 0.3803922, 1,
-0.2494792, -2.322804, -3.503408, 0, 1, 0.3882353, 1,
-0.2450798, -1.875716, -4.677163, 0, 1, 0.3921569, 1,
-0.2396615, 0.003122658, -0.009094802, 0, 1, 0.4, 1,
-0.2395396, 0.9939682, -0.3197227, 0, 1, 0.4078431, 1,
-0.2359468, 1.225716, -1.425608, 0, 1, 0.4117647, 1,
-0.2305757, -0.6110981, -4.725502, 0, 1, 0.4196078, 1,
-0.2280058, 0.5034177, 0.00885989, 0, 1, 0.4235294, 1,
-0.2266907, -0.9203793, -1.605167, 0, 1, 0.4313726, 1,
-0.2263454, 0.6938401, -1.716571, 0, 1, 0.4352941, 1,
-0.2249744, -0.568362, -3.285136, 0, 1, 0.4431373, 1,
-0.2207347, 0.3204917, -1.591568, 0, 1, 0.4470588, 1,
-0.2198177, -0.5092572, -4.015017, 0, 1, 0.454902, 1,
-0.2190669, -1.611721, -1.774018, 0, 1, 0.4588235, 1,
-0.2163152, 0.7182363, 1.377861, 0, 1, 0.4666667, 1,
-0.2147138, 1.580438, 0.2452456, 0, 1, 0.4705882, 1,
-0.2128352, 0.6776471, -0.81455, 0, 1, 0.4784314, 1,
-0.2106411, 0.01826247, -1.679018, 0, 1, 0.4823529, 1,
-0.206784, 0.5570454, -1.567583, 0, 1, 0.4901961, 1,
-0.2026416, -0.005558311, -2.524364, 0, 1, 0.4941176, 1,
-0.2022538, -0.4159701, -3.328425, 0, 1, 0.5019608, 1,
-0.2018792, -0.6581048, -3.401665, 0, 1, 0.509804, 1,
-0.2012707, 0.8923633, -1.736752, 0, 1, 0.5137255, 1,
-0.2010998, -0.06339741, -4.591341, 0, 1, 0.5215687, 1,
-0.1984681, -0.7347383, -1.442954, 0, 1, 0.5254902, 1,
-0.1941365, -0.713206, -2.764959, 0, 1, 0.5333334, 1,
-0.1907255, -0.8312702, -3.425833, 0, 1, 0.5372549, 1,
-0.1894713, -1.051116, -2.962708, 0, 1, 0.5450981, 1,
-0.188457, -1.237183, -2.626354, 0, 1, 0.5490196, 1,
-0.1837372, 1.383627, 0.5719212, 0, 1, 0.5568628, 1,
-0.1806239, -1.564434, -1.865954, 0, 1, 0.5607843, 1,
-0.1792657, -0.195262, -3.004326, 0, 1, 0.5686275, 1,
-0.1736077, -1.722526, -3.459398, 0, 1, 0.572549, 1,
-0.1666955, 0.6875291, -0.2760693, 0, 1, 0.5803922, 1,
-0.1639981, -0.7929979, -3.442317, 0, 1, 0.5843138, 1,
-0.1635888, -0.4585941, -4.21956, 0, 1, 0.5921569, 1,
-0.1595155, 0.4644775, 1.074078, 0, 1, 0.5960785, 1,
-0.1590483, -0.5716808, -1.218717, 0, 1, 0.6039216, 1,
-0.1585908, -0.1110761, 0.2729629, 0, 1, 0.6117647, 1,
-0.1570822, -0.7037719, -2.588004, 0, 1, 0.6156863, 1,
-0.1550481, 0.4514244, 0.07594085, 0, 1, 0.6235294, 1,
-0.1539208, -0.07206162, 0.05519199, 0, 1, 0.627451, 1,
-0.1473393, 0.8332143, -0.3755074, 0, 1, 0.6352941, 1,
-0.1439597, -0.07783835, -2.347181, 0, 1, 0.6392157, 1,
-0.1402801, -0.1559023, -1.814057, 0, 1, 0.6470588, 1,
-0.1398952, -0.4341543, -2.858658, 0, 1, 0.6509804, 1,
-0.1367654, -1.356117, -4.238661, 0, 1, 0.6588235, 1,
-0.1328747, -0.2925967, -3.086846, 0, 1, 0.6627451, 1,
-0.1319793, 0.09704854, 0.1652894, 0, 1, 0.6705883, 1,
-0.1290283, 0.2319103, -0.0830946, 0, 1, 0.6745098, 1,
-0.1249275, 2.657097, -0.4850379, 0, 1, 0.682353, 1,
-0.1209775, 0.2363394, 0.4470696, 0, 1, 0.6862745, 1,
-0.113967, 0.32368, -1.027003, 0, 1, 0.6941177, 1,
-0.1055705, 0.3209018, -0.360281, 0, 1, 0.7019608, 1,
-0.1050433, -0.3777166, -0.8863955, 0, 1, 0.7058824, 1,
-0.103493, 1.105133, -0.4756215, 0, 1, 0.7137255, 1,
-0.1033479, -0.3588085, -3.3842, 0, 1, 0.7176471, 1,
-0.1031499, -1.22266, -2.512634, 0, 1, 0.7254902, 1,
-0.1030682, -1.409046, -2.39941, 0, 1, 0.7294118, 1,
-0.102732, -0.5194961, -3.512018, 0, 1, 0.7372549, 1,
-0.1025972, 0.3865258, -0.9716367, 0, 1, 0.7411765, 1,
-0.1022349, -0.2708147, -3.003613, 0, 1, 0.7490196, 1,
-0.1011955, 1.68437, -0.1023169, 0, 1, 0.7529412, 1,
-0.09972967, -1.780508, -4.231418, 0, 1, 0.7607843, 1,
-0.09708346, 0.4792414, -1.576545, 0, 1, 0.7647059, 1,
-0.09659068, -1.952295, -4.362635, 0, 1, 0.772549, 1,
-0.09633657, 0.9654775, 0.2391378, 0, 1, 0.7764706, 1,
-0.09530708, 0.7827095, 0.1938606, 0, 1, 0.7843137, 1,
-0.09008683, 0.0322479, -1.936834, 0, 1, 0.7882353, 1,
-0.08703365, 0.7330248, -0.3756485, 0, 1, 0.7960784, 1,
-0.08405425, -0.120995, -2.025942, 0, 1, 0.8039216, 1,
-0.08119341, 0.3591668, 0.2775785, 0, 1, 0.8078431, 1,
-0.07879062, 0.5055106, -0.5956373, 0, 1, 0.8156863, 1,
-0.07616767, 1.813602, -0.3798561, 0, 1, 0.8196079, 1,
-0.07455184, 1.106206, 0.06559349, 0, 1, 0.827451, 1,
-0.07282044, -3.019634, -1.082637, 0, 1, 0.8313726, 1,
-0.06931569, -2.326614, -3.187721, 0, 1, 0.8392157, 1,
-0.06846339, 0.7373039, 0.9223602, 0, 1, 0.8431373, 1,
-0.0664731, -0.586925, -1.197574, 0, 1, 0.8509804, 1,
-0.06399725, -1.520616, -3.729335, 0, 1, 0.854902, 1,
-0.06275234, -0.7425526, -3.611533, 0, 1, 0.8627451, 1,
-0.06055734, 0.2555605, -0.4502699, 0, 1, 0.8666667, 1,
-0.06041225, 1.726274, 0.1865106, 0, 1, 0.8745098, 1,
-0.05996635, -0.2346275, -3.168544, 0, 1, 0.8784314, 1,
-0.05850142, 0.2782707, -0.1897389, 0, 1, 0.8862745, 1,
-0.05716005, 0.03555079, -1.293392, 0, 1, 0.8901961, 1,
-0.05411029, 1.80753, -0.3049963, 0, 1, 0.8980392, 1,
-0.0461919, 0.6390474, 0.1751167, 0, 1, 0.9058824, 1,
-0.04574835, 0.4121549, -1.753572, 0, 1, 0.9098039, 1,
-0.03869749, -0.4223753, -3.209121, 0, 1, 0.9176471, 1,
-0.03627393, 0.5453853, -1.1448, 0, 1, 0.9215686, 1,
-0.02990769, 0.05929163, -0.7498952, 0, 1, 0.9294118, 1,
-0.02606685, 0.9237131, -0.8537184, 0, 1, 0.9333333, 1,
-0.02603299, -2.071185, -2.622465, 0, 1, 0.9411765, 1,
-0.02516596, 1.563421, 0.5327667, 0, 1, 0.945098, 1,
-0.01949576, 0.7542088, -0.4362107, 0, 1, 0.9529412, 1,
-0.01866856, 0.2446435, -0.5721061, 0, 1, 0.9568627, 1,
-0.01758624, 0.2301362, 0.4405769, 0, 1, 0.9647059, 1,
-0.0169933, 1.768072, 1.108249, 0, 1, 0.9686275, 1,
-0.01403769, 0.5275236, 1.360412, 0, 1, 0.9764706, 1,
-0.01234713, -0.1510436, -2.445132, 0, 1, 0.9803922, 1,
-0.009740527, -0.752742, -3.267929, 0, 1, 0.9882353, 1,
-0.008895082, 0.08086731, -0.3374457, 0, 1, 0.9921569, 1,
-0.008872202, 1.067899, -1.8252, 0, 1, 1, 1,
-0.008327914, 0.1304948, -0.8187992, 0, 0.9921569, 1, 1,
-0.007975227, 0.2996032, 0.8497763, 0, 0.9882353, 1, 1,
-0.006286594, -2.066045, -3.090255, 0, 0.9803922, 1, 1,
-0.0008712416, 0.3796367, -0.4477489, 0, 0.9764706, 1, 1,
0.003292685, 0.1236371, -1.706761, 0, 0.9686275, 1, 1,
0.008650602, -2.296071, 5.2992, 0, 0.9647059, 1, 1,
0.00904865, -0.06346707, 0.5017794, 0, 0.9568627, 1, 1,
0.01066386, 1.758418, -0.6364418, 0, 0.9529412, 1, 1,
0.01297722, -0.1232229, 3.307307, 0, 0.945098, 1, 1,
0.02229538, -0.6511229, 2.756239, 0, 0.9411765, 1, 1,
0.0247433, 1.074968, 0.4604786, 0, 0.9333333, 1, 1,
0.02667198, -0.983246, 3.88009, 0, 0.9294118, 1, 1,
0.02814085, 1.559722, 0.1748206, 0, 0.9215686, 1, 1,
0.03347218, 0.3657273, 0.8908751, 0, 0.9176471, 1, 1,
0.03769301, -0.3994069, 3.311035, 0, 0.9098039, 1, 1,
0.03933527, 0.8430099, -0.7638502, 0, 0.9058824, 1, 1,
0.04033286, -0.8566649, 4.540384, 0, 0.8980392, 1, 1,
0.04103913, -1.443597, 2.655923, 0, 0.8901961, 1, 1,
0.04479326, 1.326547, -1.041294, 0, 0.8862745, 1, 1,
0.04734584, 1.820138, 0.7423835, 0, 0.8784314, 1, 1,
0.05153575, -1.471368, 3.01268, 0, 0.8745098, 1, 1,
0.05263917, 0.1221443, 0.9621948, 0, 0.8666667, 1, 1,
0.06100215, -0.9648325, 3.823101, 0, 0.8627451, 1, 1,
0.06106295, 1.582112, 1.705531, 0, 0.854902, 1, 1,
0.06192807, -0.9316339, 2.8642, 0, 0.8509804, 1, 1,
0.0626357, 0.3632109, -1.36752, 0, 0.8431373, 1, 1,
0.06380667, -1.996931, 3.090183, 0, 0.8392157, 1, 1,
0.06575033, 2.107737, 0.9196486, 0, 0.8313726, 1, 1,
0.0724543, 1.838912, -1.957467, 0, 0.827451, 1, 1,
0.07373677, 0.6692769, -1.647753, 0, 0.8196079, 1, 1,
0.08132489, -0.4809788, 1.517186, 0, 0.8156863, 1, 1,
0.08212869, 1.888425, -0.03188598, 0, 0.8078431, 1, 1,
0.08337755, -0.07315316, 2.170838, 0, 0.8039216, 1, 1,
0.08537813, -1.715836, 2.325768, 0, 0.7960784, 1, 1,
0.09899309, -1.861344, 4.98377, 0, 0.7882353, 1, 1,
0.1059627, -1.277007, 2.960317, 0, 0.7843137, 1, 1,
0.1061277, 0.6312757, -1.452294, 0, 0.7764706, 1, 1,
0.1066759, 1.776073, 0.8910385, 0, 0.772549, 1, 1,
0.1074493, 0.01414264, 1.695677, 0, 0.7647059, 1, 1,
0.1131826, 0.4786308, 1.125643, 0, 0.7607843, 1, 1,
0.11532, 0.3732464, -0.6156285, 0, 0.7529412, 1, 1,
0.1169267, 0.9866653, 0.5532212, 0, 0.7490196, 1, 1,
0.1308577, 0.6911721, 1.037097, 0, 0.7411765, 1, 1,
0.1325548, -0.8834305, 2.144031, 0, 0.7372549, 1, 1,
0.1357679, 0.3163127, 1.806132, 0, 0.7294118, 1, 1,
0.1360932, -0.0748272, 1.284803, 0, 0.7254902, 1, 1,
0.1377549, 0.3473993, 1.855881, 0, 0.7176471, 1, 1,
0.1474469, -0.7664363, 2.615905, 0, 0.7137255, 1, 1,
0.1483981, -0.5752313, 2.914043, 0, 0.7058824, 1, 1,
0.1554526, 1.604117, -0.6866322, 0, 0.6980392, 1, 1,
0.1564542, -0.3872195, 4.335548, 0, 0.6941177, 1, 1,
0.1568238, -0.551239, 1.884136, 0, 0.6862745, 1, 1,
0.1609712, 1.074237, 0.5354843, 0, 0.682353, 1, 1,
0.1613109, -1.585103, 3.618423, 0, 0.6745098, 1, 1,
0.1665609, 1.170126, 0.07416034, 0, 0.6705883, 1, 1,
0.1697162, -1.979563, 3.464368, 0, 0.6627451, 1, 1,
0.1709655, -0.7451424, 1.460553, 0, 0.6588235, 1, 1,
0.1731482, -0.4736798, 2.614098, 0, 0.6509804, 1, 1,
0.1756628, 0.3039578, 1.27461, 0, 0.6470588, 1, 1,
0.1786034, -1.496993, 3.073833, 0, 0.6392157, 1, 1,
0.1832258, -0.4133908, 1.605312, 0, 0.6352941, 1, 1,
0.185103, -1.076182, 3.177472, 0, 0.627451, 1, 1,
0.1851371, -0.2586836, 2.804427, 0, 0.6235294, 1, 1,
0.1893488, 3.015796, 0.8908282, 0, 0.6156863, 1, 1,
0.1896097, -0.3287717, 3.380446, 0, 0.6117647, 1, 1,
0.1909351, -1.118202, 2.935508, 0, 0.6039216, 1, 1,
0.1927421, 0.3770619, 1.841978, 0, 0.5960785, 1, 1,
0.1942537, -1.211445, 4.999784, 0, 0.5921569, 1, 1,
0.1965944, 1.096633, -0.9258668, 0, 0.5843138, 1, 1,
0.2012618, 0.5887997, 0.9158656, 0, 0.5803922, 1, 1,
0.2012842, 0.6433009, 0.8813987, 0, 0.572549, 1, 1,
0.2035622, -1.129166, 3.401469, 0, 0.5686275, 1, 1,
0.207938, 2.261303, -0.3964635, 0, 0.5607843, 1, 1,
0.2092011, 0.4684368, 0.001943759, 0, 0.5568628, 1, 1,
0.2094155, -0.3983873, 3.318894, 0, 0.5490196, 1, 1,
0.2105652, -0.6748289, 2.835682, 0, 0.5450981, 1, 1,
0.2153976, 0.6206285, 2.11682, 0, 0.5372549, 1, 1,
0.2182843, 0.5912869, 0.7278852, 0, 0.5333334, 1, 1,
0.2210945, 0.2899816, 1.523734, 0, 0.5254902, 1, 1,
0.2213443, 0.6840726, 0.5357522, 0, 0.5215687, 1, 1,
0.2221356, 0.03237428, 0.88894, 0, 0.5137255, 1, 1,
0.2295651, -0.8822811, 3.411942, 0, 0.509804, 1, 1,
0.2307944, -1.922721, 3.631677, 0, 0.5019608, 1, 1,
0.2357524, 1.427753, 1.065492, 0, 0.4941176, 1, 1,
0.237406, -1.35709, 3.651241, 0, 0.4901961, 1, 1,
0.2385558, 0.2371831, 0.9672883, 0, 0.4823529, 1, 1,
0.2387746, -0.07902784, 0.4407719, 0, 0.4784314, 1, 1,
0.2391008, 1.947229, 0.4832733, 0, 0.4705882, 1, 1,
0.2392759, -0.6417668, 1.678863, 0, 0.4666667, 1, 1,
0.2453882, -1.459776, 3.326958, 0, 0.4588235, 1, 1,
0.2470932, 0.5747973, 1.609796, 0, 0.454902, 1, 1,
0.2473429, 0.2157119, -0.5666775, 0, 0.4470588, 1, 1,
0.2541204, 0.4982951, -0.3946094, 0, 0.4431373, 1, 1,
0.256995, -1.49246, 1.694028, 0, 0.4352941, 1, 1,
0.2571724, -0.1920394, 1.011095, 0, 0.4313726, 1, 1,
0.2695294, -1.316651, 4.780978, 0, 0.4235294, 1, 1,
0.2698932, -0.5516341, 2.41997, 0, 0.4196078, 1, 1,
0.2702087, -1.029042, 2.445405, 0, 0.4117647, 1, 1,
0.2737487, 0.808259, 0.5986515, 0, 0.4078431, 1, 1,
0.2771285, -1.047889, 3.345163, 0, 0.4, 1, 1,
0.2794528, -0.1089194, 0.788291, 0, 0.3921569, 1, 1,
0.2802908, 1.911456, 0.1691573, 0, 0.3882353, 1, 1,
0.2880502, -0.9065232, 2.314863, 0, 0.3803922, 1, 1,
0.2886146, 0.8975201, 2.257422, 0, 0.3764706, 1, 1,
0.28941, -0.2676801, 2.503873, 0, 0.3686275, 1, 1,
0.2895198, 0.5935622, 0.5510046, 0, 0.3647059, 1, 1,
0.2904372, 0.004005777, -0.3972687, 0, 0.3568628, 1, 1,
0.2907584, -0.5702093, 0.9779856, 0, 0.3529412, 1, 1,
0.292188, -0.2865819, 1.377085, 0, 0.345098, 1, 1,
0.2937776, -0.4919909, 1.804152, 0, 0.3411765, 1, 1,
0.2974729, 0.9529877, 1.326366, 0, 0.3333333, 1, 1,
0.2975049, -1.215475, 1.728723, 0, 0.3294118, 1, 1,
0.2982187, 0.3556897, -0.2150139, 0, 0.3215686, 1, 1,
0.2983844, -0.80582, 2.212215, 0, 0.3176471, 1, 1,
0.2986007, 2.107065, 1.221885, 0, 0.3098039, 1, 1,
0.2989115, 0.6330835, 1.775076, 0, 0.3058824, 1, 1,
0.2992641, 0.7834737, -1.354926, 0, 0.2980392, 1, 1,
0.3018533, 0.004654429, 0.5879155, 0, 0.2901961, 1, 1,
0.3058277, -1.304392, 3.144344, 0, 0.2862745, 1, 1,
0.3078632, -0.9514028, 5.482426, 0, 0.2784314, 1, 1,
0.3086264, -0.5324942, 2.746018, 0, 0.2745098, 1, 1,
0.3161865, -0.7903101, 1.800822, 0, 0.2666667, 1, 1,
0.3233182, 0.3120563, 1.051219, 0, 0.2627451, 1, 1,
0.3235823, -0.1016793, 2.382726, 0, 0.254902, 1, 1,
0.3255612, 0.7343453, 0.4475384, 0, 0.2509804, 1, 1,
0.3256581, 1.089908, 0.5007235, 0, 0.2431373, 1, 1,
0.3257299, -2.410399, 2.0868, 0, 0.2392157, 1, 1,
0.3281956, 0.06950229, 1.195005, 0, 0.2313726, 1, 1,
0.3311172, 0.5500318, -0.763052, 0, 0.227451, 1, 1,
0.331499, -1.26977, 3.662251, 0, 0.2196078, 1, 1,
0.3324454, 0.3102179, 1.874996, 0, 0.2156863, 1, 1,
0.3395067, -0.4399291, 1.996321, 0, 0.2078431, 1, 1,
0.3438917, 0.655349, 0.7484394, 0, 0.2039216, 1, 1,
0.3445535, 0.2920026, -0.700075, 0, 0.1960784, 1, 1,
0.3453249, 0.6887986, 1.206979, 0, 0.1882353, 1, 1,
0.3454182, -1.919317, 2.569952, 0, 0.1843137, 1, 1,
0.3566796, 1.835264, -0.6667222, 0, 0.1764706, 1, 1,
0.358164, 0.442513, 1.556985, 0, 0.172549, 1, 1,
0.3625862, 0.8749633, 0.3338569, 0, 0.1647059, 1, 1,
0.3672136, 0.3254575, 1.5623, 0, 0.1607843, 1, 1,
0.3698677, 0.4098999, 0.5418753, 0, 0.1529412, 1, 1,
0.37008, 0.8091054, 1.622149, 0, 0.1490196, 1, 1,
0.3730848, -0.781077, 1.798448, 0, 0.1411765, 1, 1,
0.373385, 1.450329, -0.09919307, 0, 0.1372549, 1, 1,
0.375604, 1.252131, 1.71424, 0, 0.1294118, 1, 1,
0.3803441, 0.3361096, 2.373267, 0, 0.1254902, 1, 1,
0.385123, 0.1685788, 1.371194, 0, 0.1176471, 1, 1,
0.3870248, 0.9351764, 0.664356, 0, 0.1137255, 1, 1,
0.3877822, 0.4881914, 1.423021, 0, 0.1058824, 1, 1,
0.3917123, 0.3194441, 0.7200403, 0, 0.09803922, 1, 1,
0.3959352, -0.7667584, -0.004506145, 0, 0.09411765, 1, 1,
0.400108, -1.234601, 0.8193206, 0, 0.08627451, 1, 1,
0.4007035, -0.8271612, 2.130034, 0, 0.08235294, 1, 1,
0.4008457, 1.796284, 0.2484252, 0, 0.07450981, 1, 1,
0.4025891, -0.2801135, 3.444071, 0, 0.07058824, 1, 1,
0.4072533, 1.414161, -0.6443462, 0, 0.0627451, 1, 1,
0.4085778, -0.0429018, 1.421907, 0, 0.05882353, 1, 1,
0.4178068, -0.3162917, 2.000544, 0, 0.05098039, 1, 1,
0.420171, 0.2847424, 0.7770677, 0, 0.04705882, 1, 1,
0.4211713, -0.3851312, 2.246917, 0, 0.03921569, 1, 1,
0.4218626, 0.2182914, 2.739919, 0, 0.03529412, 1, 1,
0.4228009, -1.967668, 1.126099, 0, 0.02745098, 1, 1,
0.4307833, 0.3104173, 1.670676, 0, 0.02352941, 1, 1,
0.4325355, 0.9732098, 0.6331919, 0, 0.01568628, 1, 1,
0.4329703, 0.3624625, -0.0538582, 0, 0.01176471, 1, 1,
0.4335901, 1.329553, 1.095776, 0, 0.003921569, 1, 1,
0.4352435, -0.008970691, 1.401104, 0.003921569, 0, 1, 1,
0.4363456, 1.948367, 1.189767, 0.007843138, 0, 1, 1,
0.4393896, -0.8137532, 2.342796, 0.01568628, 0, 1, 1,
0.4506968, 1.57607, -0.362321, 0.01960784, 0, 1, 1,
0.4596366, -0.2503796, 1.182906, 0.02745098, 0, 1, 1,
0.4637238, 0.02498624, 1.9555, 0.03137255, 0, 1, 1,
0.4645641, 0.07762176, 2.029141, 0.03921569, 0, 1, 1,
0.4690791, 0.1829516, 1.708778, 0.04313726, 0, 1, 1,
0.4698805, -0.02380767, 1.8867, 0.05098039, 0, 1, 1,
0.4714738, 0.7003477, 0.4064044, 0.05490196, 0, 1, 1,
0.4728041, -1.682825, 2.833611, 0.0627451, 0, 1, 1,
0.4736316, 2.439323, 2.377568, 0.06666667, 0, 1, 1,
0.4747182, 0.9535666, -1.113427, 0.07450981, 0, 1, 1,
0.4770242, -0.6785166, 2.30187, 0.07843138, 0, 1, 1,
0.4782324, 0.4324979, 0.9283516, 0.08627451, 0, 1, 1,
0.4829218, 0.1198574, 1.531637, 0.09019608, 0, 1, 1,
0.4830073, -1.400676, 3.452894, 0.09803922, 0, 1, 1,
0.4877737, 1.622492, 0.199902, 0.1058824, 0, 1, 1,
0.4887071, 1.193889, 0.7404997, 0.1098039, 0, 1, 1,
0.4901162, -1.572306, 2.092005, 0.1176471, 0, 1, 1,
0.4909485, -1.492159, 2.323757, 0.1215686, 0, 1, 1,
0.4911904, -0.07659561, 0.9569774, 0.1294118, 0, 1, 1,
0.4920127, -0.5758347, 3.160552, 0.1333333, 0, 1, 1,
0.4921631, -1.667245, 3.429905, 0.1411765, 0, 1, 1,
0.4954697, -0.09147419, 2.147806, 0.145098, 0, 1, 1,
0.5001879, -0.07698291, 1.119678, 0.1529412, 0, 1, 1,
0.5030394, 1.142939, -0.176164, 0.1568628, 0, 1, 1,
0.5062738, 1.362516, 0.2322718, 0.1647059, 0, 1, 1,
0.509734, 0.5076933, -0.3904727, 0.1686275, 0, 1, 1,
0.5107293, -1.304129, 3.246031, 0.1764706, 0, 1, 1,
0.5114787, 0.8328138, -0.897365, 0.1803922, 0, 1, 1,
0.513743, 0.3176481, 2.102313, 0.1882353, 0, 1, 1,
0.5146444, -2.077101, 1.981006, 0.1921569, 0, 1, 1,
0.5220427, 0.1781349, 1.438628, 0.2, 0, 1, 1,
0.5273811, 1.478467, 0.2756965, 0.2078431, 0, 1, 1,
0.5329472, -0.826633, 3.98782, 0.2117647, 0, 1, 1,
0.5337232, 0.7820027, 1.679549, 0.2196078, 0, 1, 1,
0.5463889, -0.1037145, 3.020699, 0.2235294, 0, 1, 1,
0.5495769, 1.261228, 0.663209, 0.2313726, 0, 1, 1,
0.5508401, -1.198868, 3.607241, 0.2352941, 0, 1, 1,
0.5528467, 0.3399931, 0.6359962, 0.2431373, 0, 1, 1,
0.552973, 0.2578241, -0.4545808, 0.2470588, 0, 1, 1,
0.5577374, 0.3594096, 0.9875194, 0.254902, 0, 1, 1,
0.5582836, 0.5861487, 0.6746914, 0.2588235, 0, 1, 1,
0.5649322, 0.007061971, 1.23244, 0.2666667, 0, 1, 1,
0.5652928, 0.4327066, 0.9975438, 0.2705882, 0, 1, 1,
0.5675254, 0.4313932, -0.1966546, 0.2784314, 0, 1, 1,
0.5712283, -0.002257287, 1.494561, 0.282353, 0, 1, 1,
0.5753097, -1.73193, 0.5365028, 0.2901961, 0, 1, 1,
0.5754782, -0.712843, 1.432259, 0.2941177, 0, 1, 1,
0.5756068, -0.01984515, 2.180845, 0.3019608, 0, 1, 1,
0.5785475, 1.218398, -0.05168262, 0.3098039, 0, 1, 1,
0.5837482, -1.322456, 2.523434, 0.3137255, 0, 1, 1,
0.587674, -1.21689, 1.683212, 0.3215686, 0, 1, 1,
0.5883543, -0.0370368, 2.3808, 0.3254902, 0, 1, 1,
0.5886133, -0.2887034, 0.04914716, 0.3333333, 0, 1, 1,
0.5901354, -0.7291664, 1.296222, 0.3372549, 0, 1, 1,
0.5954636, 0.9154081, 0.09235023, 0.345098, 0, 1, 1,
0.5956736, -0.4163362, 1.324192, 0.3490196, 0, 1, 1,
0.596594, -0.04285667, 1.77742, 0.3568628, 0, 1, 1,
0.5997093, -1.401288, 2.712869, 0.3607843, 0, 1, 1,
0.601074, 1.609958, -0.1885904, 0.3686275, 0, 1, 1,
0.6061212, -0.7425888, 3.021298, 0.372549, 0, 1, 1,
0.6105638, 4.180622, 0.1913288, 0.3803922, 0, 1, 1,
0.6108333, 1.329873, -0.2673231, 0.3843137, 0, 1, 1,
0.6138005, 0.400153, 0.2770693, 0.3921569, 0, 1, 1,
0.6146325, -0.4667177, 1.574156, 0.3960784, 0, 1, 1,
0.6164367, -0.8318427, 2.055247, 0.4039216, 0, 1, 1,
0.6193152, -0.5021787, 3.317477, 0.4117647, 0, 1, 1,
0.6219684, -1.083284, 3.069218, 0.4156863, 0, 1, 1,
0.6316732, 0.9254718, 0.1672145, 0.4235294, 0, 1, 1,
0.6392243, -0.1829315, 1.360678, 0.427451, 0, 1, 1,
0.6457952, -0.2216593, 1.311485, 0.4352941, 0, 1, 1,
0.6493862, -0.8523144, 2.980218, 0.4392157, 0, 1, 1,
0.6574137, -0.4872411, 1.586554, 0.4470588, 0, 1, 1,
0.6646494, -0.5743182, 1.814413, 0.4509804, 0, 1, 1,
0.6667705, -0.4252096, 1.160568, 0.4588235, 0, 1, 1,
0.6669217, 0.7398391, 0.9592397, 0.4627451, 0, 1, 1,
0.6686729, -0.9198228, 1.090599, 0.4705882, 0, 1, 1,
0.6735254, 0.2073007, 1.989172, 0.4745098, 0, 1, 1,
0.6755649, 0.1868276, 1.829289, 0.4823529, 0, 1, 1,
0.6767421, 1.707371, 0.007307034, 0.4862745, 0, 1, 1,
0.6800803, -0.6155515, 1.962697, 0.4941176, 0, 1, 1,
0.680719, -1.279642, 1.295051, 0.5019608, 0, 1, 1,
0.6942095, -1.511079, 3.217917, 0.5058824, 0, 1, 1,
0.6947908, 0.180379, -0.7121311, 0.5137255, 0, 1, 1,
0.695423, -1.208835, 3.210661, 0.5176471, 0, 1, 1,
0.7052211, 0.9583294, 0.166341, 0.5254902, 0, 1, 1,
0.7071601, -1.701593, 4.208653, 0.5294118, 0, 1, 1,
0.7092867, -1.36391, 3.375312, 0.5372549, 0, 1, 1,
0.7105582, 1.318046, -0.5950802, 0.5411765, 0, 1, 1,
0.7114149, 0.4260412, 1.000223, 0.5490196, 0, 1, 1,
0.7148439, -0.3965475, 2.506505, 0.5529412, 0, 1, 1,
0.7148893, 0.5859452, -0.1763124, 0.5607843, 0, 1, 1,
0.7149461, 0.5277252, 1.63633, 0.5647059, 0, 1, 1,
0.7173278, -0.4818703, 2.699198, 0.572549, 0, 1, 1,
0.7205914, -0.2043953, 1.539701, 0.5764706, 0, 1, 1,
0.7232378, 1.180218, 1.708588, 0.5843138, 0, 1, 1,
0.7243533, 0.5668659, 2.034932, 0.5882353, 0, 1, 1,
0.7271659, 0.5693761, -1.274274, 0.5960785, 0, 1, 1,
0.7320181, 0.2317773, 0.5898909, 0.6039216, 0, 1, 1,
0.736506, 0.05273711, 0.1701833, 0.6078432, 0, 1, 1,
0.7385374, -1.02059, 2.234992, 0.6156863, 0, 1, 1,
0.7395558, 1.142792, -0.3556925, 0.6196079, 0, 1, 1,
0.7420055, 0.002217267, 0.1477241, 0.627451, 0, 1, 1,
0.7518565, 0.105009, -0.1991022, 0.6313726, 0, 1, 1,
0.7530326, -1.657385, 3.912413, 0.6392157, 0, 1, 1,
0.7531409, -0.2736538, 1.372911, 0.6431373, 0, 1, 1,
0.7538189, -0.2429925, 1.944506, 0.6509804, 0, 1, 1,
0.7542243, -0.3121051, 2.177888, 0.654902, 0, 1, 1,
0.7551277, -1.597329, 4.446689, 0.6627451, 0, 1, 1,
0.7576768, -0.2149245, 1.989333, 0.6666667, 0, 1, 1,
0.7601729, -0.07351857, 1.050386, 0.6745098, 0, 1, 1,
0.7616811, 0.09490886, 0.237856, 0.6784314, 0, 1, 1,
0.7627987, 0.8680094, -0.5937331, 0.6862745, 0, 1, 1,
0.7629737, 1.43495, -0.8803023, 0.6901961, 0, 1, 1,
0.7630975, -2.632299, 2.280009, 0.6980392, 0, 1, 1,
0.7737998, 1.194582, -0.2628962, 0.7058824, 0, 1, 1,
0.7738181, 1.629019, 0.7097221, 0.7098039, 0, 1, 1,
0.7749209, -1.113737, 1.964878, 0.7176471, 0, 1, 1,
0.7907643, 0.02841237, 2.353112, 0.7215686, 0, 1, 1,
0.7946628, -0.3210724, 3.331235, 0.7294118, 0, 1, 1,
0.7975424, -1.034027, 4.143799, 0.7333333, 0, 1, 1,
0.8004122, 0.6128372, 0.4986899, 0.7411765, 0, 1, 1,
0.8004819, 1.17542, 2.894977, 0.7450981, 0, 1, 1,
0.8254695, -0.308158, 1.496803, 0.7529412, 0, 1, 1,
0.8257859, 0.5099222, 1.226775, 0.7568628, 0, 1, 1,
0.8285258, -0.8419726, 1.286608, 0.7647059, 0, 1, 1,
0.8328173, 0.3864552, 0.5708061, 0.7686275, 0, 1, 1,
0.8429425, -1.0152, 2.275609, 0.7764706, 0, 1, 1,
0.8429683, 1.127898, -0.063357, 0.7803922, 0, 1, 1,
0.8441273, 0.1571651, 3.869498, 0.7882353, 0, 1, 1,
0.8441635, -0.2699193, 2.177418, 0.7921569, 0, 1, 1,
0.8482757, -1.493017, 2.8177, 0.8, 0, 1, 1,
0.8551428, -0.06196428, 1.744969, 0.8078431, 0, 1, 1,
0.865375, 0.5720686, 2.09743, 0.8117647, 0, 1, 1,
0.8678883, -0.4939883, 1.237797, 0.8196079, 0, 1, 1,
0.8700158, 0.02172096, 1.080238, 0.8235294, 0, 1, 1,
0.8811301, -0.9097146, 3.425607, 0.8313726, 0, 1, 1,
0.8842416, -0.0463061, 2.45832, 0.8352941, 0, 1, 1,
0.8892627, 2.07331, 0.7637597, 0.8431373, 0, 1, 1,
0.8947629, -0.6896533, 3.36138, 0.8470588, 0, 1, 1,
0.8979896, -0.2231656, 1.09897, 0.854902, 0, 1, 1,
0.9064119, -1.074564, 1.419619, 0.8588235, 0, 1, 1,
0.9077367, 0.575853, 2.511511, 0.8666667, 0, 1, 1,
0.9085867, 0.2309732, 1.331777, 0.8705882, 0, 1, 1,
0.9092427, -0.1137915, 2.502333, 0.8784314, 0, 1, 1,
0.9146, -1.17624, 1.665495, 0.8823529, 0, 1, 1,
0.9164145, 0.2113063, -0.3481934, 0.8901961, 0, 1, 1,
0.9218433, 0.5635154, -0.2287299, 0.8941177, 0, 1, 1,
0.9222041, -0.3803063, 2.525941, 0.9019608, 0, 1, 1,
0.9222595, -0.5897408, 3.8937, 0.9098039, 0, 1, 1,
0.9225805, 1.596825, -0.8540363, 0.9137255, 0, 1, 1,
0.9245876, -0.2317291, 2.065986, 0.9215686, 0, 1, 1,
0.9331859, -1.384721, 1.546872, 0.9254902, 0, 1, 1,
0.951391, 0.1046114, 1.719571, 0.9333333, 0, 1, 1,
0.9526516, 0.6363928, 1.520183, 0.9372549, 0, 1, 1,
0.9536251, 1.057678, 1.639093, 0.945098, 0, 1, 1,
0.9565265, 1.340609, -1.370387, 0.9490196, 0, 1, 1,
0.957493, 0.5070195, -0.03886179, 0.9568627, 0, 1, 1,
0.9593273, -0.6177709, 2.203957, 0.9607843, 0, 1, 1,
0.9601949, -0.02715384, 1.332741, 0.9686275, 0, 1, 1,
0.9644686, -0.3773143, 0.3556917, 0.972549, 0, 1, 1,
0.9678593, -1.738368, 2.151453, 0.9803922, 0, 1, 1,
0.968778, -1.168914, 2.891916, 0.9843137, 0, 1, 1,
0.9728354, 0.04382984, 1.765308, 0.9921569, 0, 1, 1,
0.974093, -0.9003466, 2.543227, 0.9960784, 0, 1, 1,
0.9752617, 0.3199709, 1.427714, 1, 0, 0.9960784, 1,
0.9798627, -0.07775299, 0.5857787, 1, 0, 0.9882353, 1,
0.9829975, -0.1303091, 2.180563, 1, 0, 0.9843137, 1,
0.9832824, -0.1641552, 0.6470668, 1, 0, 0.9764706, 1,
0.9836144, 2.173851, -0.01139661, 1, 0, 0.972549, 1,
0.9880826, -0.3649297, 0.3838487, 1, 0, 0.9647059, 1,
0.9886051, 0.5492004, 1.384231, 1, 0, 0.9607843, 1,
0.9887398, -0.5566351, 2.415355, 1, 0, 0.9529412, 1,
0.9888116, -0.3173836, 2.314552, 1, 0, 0.9490196, 1,
0.9947801, -0.918576, 1.824403, 1, 0, 0.9411765, 1,
0.9948248, 0.4296831, -0.03258547, 1, 0, 0.9372549, 1,
0.9992895, 0.492025, 0.7228079, 1, 0, 0.9294118, 1,
0.9994144, -0.3053256, 0.6244997, 1, 0, 0.9254902, 1,
1.002075, 0.2296713, 1.066074, 1, 0, 0.9176471, 1,
1.004035, 1.074587, 0.2805141, 1, 0, 0.9137255, 1,
1.004282, -0.331406, 3.40034, 1, 0, 0.9058824, 1,
1.013546, -1.139788, 2.136201, 1, 0, 0.9019608, 1,
1.020218, 0.4780168, 1.807869, 1, 0, 0.8941177, 1,
1.020369, 0.8066163, 0.1569979, 1, 0, 0.8862745, 1,
1.020508, -0.2579438, 3.309469, 1, 0, 0.8823529, 1,
1.022186, 1.47734, -0.1699671, 1, 0, 0.8745098, 1,
1.024076, 0.3909498, 2.423203, 1, 0, 0.8705882, 1,
1.025278, 0.2840348, 3.043229, 1, 0, 0.8627451, 1,
1.034099, -0.4228329, 1.506531, 1, 0, 0.8588235, 1,
1.040487, 0.2379038, 1.148662, 1, 0, 0.8509804, 1,
1.04628, 1.250924, -0.2405995, 1, 0, 0.8470588, 1,
1.046908, -0.09016558, 1.583125, 1, 0, 0.8392157, 1,
1.050002, 2.359585, -0.003730284, 1, 0, 0.8352941, 1,
1.05437, 0.7709474, 1.697141, 1, 0, 0.827451, 1,
1.055962, -0.3243541, 0.8859753, 1, 0, 0.8235294, 1,
1.060471, -0.7815459, 2.693323, 1, 0, 0.8156863, 1,
1.061018, -0.1241122, 1.789566, 1, 0, 0.8117647, 1,
1.061699, -0.187243, 1.333566, 1, 0, 0.8039216, 1,
1.074739, 1.85538, 0.7172171, 1, 0, 0.7960784, 1,
1.07684, 0.1729343, 2.179525, 1, 0, 0.7921569, 1,
1.079606, -0.864162, 1.979322, 1, 0, 0.7843137, 1,
1.079935, 0.9746052, 0.1504832, 1, 0, 0.7803922, 1,
1.085091, -0.2850812, 0.7331185, 1, 0, 0.772549, 1,
1.086141, 1.648578, -0.3325181, 1, 0, 0.7686275, 1,
1.086933, 2.079157, 1.155203, 1, 0, 0.7607843, 1,
1.090211, -0.3231423, 0.2266275, 1, 0, 0.7568628, 1,
1.095804, -0.4358322, 2.075806, 1, 0, 0.7490196, 1,
1.096351, -0.6379063, 1.905323, 1, 0, 0.7450981, 1,
1.106864, 0.8754906, 1.266345, 1, 0, 0.7372549, 1,
1.11168, 0.8262094, 1.13265, 1, 0, 0.7333333, 1,
1.12092, -0.2938542, 1.183868, 1, 0, 0.7254902, 1,
1.124429, -1.047128, 2.765965, 1, 0, 0.7215686, 1,
1.127527, 0.7423885, 1.323165, 1, 0, 0.7137255, 1,
1.128646, -0.03751009, 2.400845, 1, 0, 0.7098039, 1,
1.130755, -0.8553633, 2.340816, 1, 0, 0.7019608, 1,
1.132921, 0.8184881, 2.313339, 1, 0, 0.6941177, 1,
1.134922, 0.4773447, -0.4409131, 1, 0, 0.6901961, 1,
1.139329, -0.2656939, 3.003306, 1, 0, 0.682353, 1,
1.146646, -0.06956221, 3.246419, 1, 0, 0.6784314, 1,
1.153765, -0.4258668, 0.729763, 1, 0, 0.6705883, 1,
1.15662, -1.369687, 0.7212476, 1, 0, 0.6666667, 1,
1.157118, 0.001036428, 1.644803, 1, 0, 0.6588235, 1,
1.166724, -0.2077032, 1.484064, 1, 0, 0.654902, 1,
1.166939, -0.4515583, 1.097128, 1, 0, 0.6470588, 1,
1.167982, 0.1239887, 0.7907993, 1, 0, 0.6431373, 1,
1.188984, -0.3563781, 0.7467255, 1, 0, 0.6352941, 1,
1.195974, 1.299534, 0.5884367, 1, 0, 0.6313726, 1,
1.19923, -0.1691756, 2.321998, 1, 0, 0.6235294, 1,
1.199899, -0.3053899, 1.52553, 1, 0, 0.6196079, 1,
1.207744, -1.279891, 2.782236, 1, 0, 0.6117647, 1,
1.213545, -0.3254066, 2.058607, 1, 0, 0.6078432, 1,
1.216067, 0.6939477, 2.541112, 1, 0, 0.6, 1,
1.2264, -0.1422504, 0.6690347, 1, 0, 0.5921569, 1,
1.233906, -0.1359621, 3.584664, 1, 0, 0.5882353, 1,
1.236224, -0.9377626, 3.45936, 1, 0, 0.5803922, 1,
1.240856, -1.35414, 2.87158, 1, 0, 0.5764706, 1,
1.24381, 0.6898342, 1.566288, 1, 0, 0.5686275, 1,
1.246366, -0.7442139, 1.941616, 1, 0, 0.5647059, 1,
1.246968, -1.469784, 2.753548, 1, 0, 0.5568628, 1,
1.26372, 1.084384, 0.739009, 1, 0, 0.5529412, 1,
1.264156, 1.025095, 0.6129928, 1, 0, 0.5450981, 1,
1.266907, -0.849268, 2.109272, 1, 0, 0.5411765, 1,
1.267293, 0.9517342, -0.2401856, 1, 0, 0.5333334, 1,
1.271731, -0.1105709, 0.07158205, 1, 0, 0.5294118, 1,
1.277059, -0.4288034, 2.665328, 1, 0, 0.5215687, 1,
1.294028, 1.55637, 0.330559, 1, 0, 0.5176471, 1,
1.297695, 0.2598253, 1.858139, 1, 0, 0.509804, 1,
1.304127, -1.199412, 1.381448, 1, 0, 0.5058824, 1,
1.307806, 0.4208192, -0.548853, 1, 0, 0.4980392, 1,
1.308269, 1.330496, 0.009076335, 1, 0, 0.4901961, 1,
1.313276, -1.164415, 1.328014, 1, 0, 0.4862745, 1,
1.31936, -0.5804843, 1.644126, 1, 0, 0.4784314, 1,
1.321294, 0.5537555, 2.231885, 1, 0, 0.4745098, 1,
1.330427, -0.9702048, 2.797538, 1, 0, 0.4666667, 1,
1.335479, 0.4202409, 2.509743, 1, 0, 0.4627451, 1,
1.339296, -1.914549, 2.559155, 1, 0, 0.454902, 1,
1.346112, 1.171966, 1.696479, 1, 0, 0.4509804, 1,
1.349017, -0.8730538, 2.117299, 1, 0, 0.4431373, 1,
1.349187, -1.621662, 1.821206, 1, 0, 0.4392157, 1,
1.364859, 0.08388367, 2.146386, 1, 0, 0.4313726, 1,
1.366288, -0.3026684, 2.871224, 1, 0, 0.427451, 1,
1.419643, -0.6699014, 2.176933, 1, 0, 0.4196078, 1,
1.423655, 1.315826, 0.1274689, 1, 0, 0.4156863, 1,
1.424742, -1.379909, 2.444036, 1, 0, 0.4078431, 1,
1.427019, -0.6720812, 0.5433236, 1, 0, 0.4039216, 1,
1.429556, 0.2146742, 1.984153, 1, 0, 0.3960784, 1,
1.441061, -0.2668507, 2.758269, 1, 0, 0.3882353, 1,
1.444293, 0.3353418, -0.6095753, 1, 0, 0.3843137, 1,
1.458807, 0.64069, 1.304762, 1, 0, 0.3764706, 1,
1.459657, -0.9429382, 2.547061, 1, 0, 0.372549, 1,
1.461723, 0.2955174, 1.539095, 1, 0, 0.3647059, 1,
1.480533, -3.397129, 2.761591, 1, 0, 0.3607843, 1,
1.482309, -0.8505566, 1.981297, 1, 0, 0.3529412, 1,
1.496087, 1.391035, 2.02268, 1, 0, 0.3490196, 1,
1.498721, 1.705738, -0.4440803, 1, 0, 0.3411765, 1,
1.50366, -1.691018, 0.8734775, 1, 0, 0.3372549, 1,
1.507925, 0.1518236, 2.834945, 1, 0, 0.3294118, 1,
1.517818, 0.2453957, 0.942935, 1, 0, 0.3254902, 1,
1.533194, -1.599153, 3.180326, 1, 0, 0.3176471, 1,
1.545231, -1.973542, 3.118166, 1, 0, 0.3137255, 1,
1.576724, 0.2197057, 0.6794978, 1, 0, 0.3058824, 1,
1.613169, -0.3290716, 1.109825, 1, 0, 0.2980392, 1,
1.62414, -0.4357349, 1.039944, 1, 0, 0.2941177, 1,
1.625433, 0.2418635, 1.725487, 1, 0, 0.2862745, 1,
1.62619, 1.388461, 1.564528, 1, 0, 0.282353, 1,
1.637191, -1.771921, 3.04645, 1, 0, 0.2745098, 1,
1.63904, -0.355026, -0.3479585, 1, 0, 0.2705882, 1,
1.647267, -2.004948, 2.991885, 1, 0, 0.2627451, 1,
1.66256, 1.033013, 1.734255, 1, 0, 0.2588235, 1,
1.66988, -0.4194474, 2.435233, 1, 0, 0.2509804, 1,
1.679328, -0.5591846, 1.914581, 1, 0, 0.2470588, 1,
1.689342, 0.7294589, 1.162317, 1, 0, 0.2392157, 1,
1.695137, -0.5625934, 2.849881, 1, 0, 0.2352941, 1,
1.707857, -1.744919, 2.60107, 1, 0, 0.227451, 1,
1.774275, -0.04078824, 1.313955, 1, 0, 0.2235294, 1,
1.801504, -0.2321554, 2.876625, 1, 0, 0.2156863, 1,
1.803656, 0.9844162, 0.5963693, 1, 0, 0.2117647, 1,
1.804294, 0.387776, 0.5422121, 1, 0, 0.2039216, 1,
1.805748, 0.2421932, 1.948179, 1, 0, 0.1960784, 1,
1.817326, -1.385884, 1.280863, 1, 0, 0.1921569, 1,
1.823785, -0.6775182, 0.8163124, 1, 0, 0.1843137, 1,
1.84228, -0.3922612, 1.607157, 1, 0, 0.1803922, 1,
1.843375, -0.3454231, 2.852564, 1, 0, 0.172549, 1,
1.852548, 1.487984, 1.704499, 1, 0, 0.1686275, 1,
1.856925, 0.3021475, 2.131614, 1, 0, 0.1607843, 1,
1.857796, -2.305654, 2.899113, 1, 0, 0.1568628, 1,
1.875441, 1.585699, -1.667762, 1, 0, 0.1490196, 1,
1.886584, -0.1203755, 1.770651, 1, 0, 0.145098, 1,
1.903985, -1.507155, 1.323947, 1, 0, 0.1372549, 1,
1.914081, -1.170483, 2.966199, 1, 0, 0.1333333, 1,
1.914972, -0.176054, 0.802339, 1, 0, 0.1254902, 1,
1.944585, -0.6154973, 1.860231, 1, 0, 0.1215686, 1,
1.953811, -0.9819272, 3.858637, 1, 0, 0.1137255, 1,
1.968639, -0.0710623, 2.729203, 1, 0, 0.1098039, 1,
1.977956, 1.031719, 2.658037, 1, 0, 0.1019608, 1,
2.060779, -0.6584975, 2.407051, 1, 0, 0.09411765, 1,
2.06689, 0.1160444, 2.050625, 1, 0, 0.09019608, 1,
2.070371, 0.5559937, 1.355407, 1, 0, 0.08235294, 1,
2.101719, 0.113304, 0.219511, 1, 0, 0.07843138, 1,
2.11998, 1.034096, 0.3376782, 1, 0, 0.07058824, 1,
2.171682, -1.270245, 1.305307, 1, 0, 0.06666667, 1,
2.246084, 2.354722, 0.6675521, 1, 0, 0.05882353, 1,
2.253426, -0.5395711, 2.600307, 1, 0, 0.05490196, 1,
2.311694, 0.88231, 1.625417, 1, 0, 0.04705882, 1,
2.32348, 1.510544, 1.515669, 1, 0, 0.04313726, 1,
2.361278, 0.08108629, 1.760757, 1, 0, 0.03529412, 1,
2.478156, 0.2306905, 0.5003, 1, 0, 0.03137255, 1,
2.494801, 0.4301046, 1.318971, 1, 0, 0.02352941, 1,
2.510835, -0.4033695, 2.210254, 1, 0, 0.01960784, 1,
2.598875, -0.5519834, 3.047127, 1, 0, 0.01176471, 1,
2.859433, -0.8042555, 3.022224, 1, 0, 0.007843138, 1
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
-0.1244792, -4.681558, -6.687222, 0, -0.5, 0.5, 0.5,
-0.1244792, -4.681558, -6.687222, 1, -0.5, 0.5, 0.5,
-0.1244792, -4.681558, -6.687222, 1, 1.5, 0.5, 0.5,
-0.1244792, -4.681558, -6.687222, 0, 1.5, 0.5, 0.5
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
-4.119938, 0.3917465, -6.687222, 0, -0.5, 0.5, 0.5,
-4.119938, 0.3917465, -6.687222, 1, -0.5, 0.5, 0.5,
-4.119938, 0.3917465, -6.687222, 1, 1.5, 0.5, 0.5,
-4.119938, 0.3917465, -6.687222, 0, 1.5, 0.5, 0.5
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
-4.119938, -4.681558, 0.2794983, 0, -0.5, 0.5, 0.5,
-4.119938, -4.681558, 0.2794983, 1, -0.5, 0.5, 0.5,
-4.119938, -4.681558, 0.2794983, 1, 1.5, 0.5, 0.5,
-4.119938, -4.681558, 0.2794983, 0, 1.5, 0.5, 0.5
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
-3, -3.510795, -5.079517,
2, -3.510795, -5.079517,
-3, -3.510795, -5.079517,
-3, -3.705922, -5.347467,
-2, -3.510795, -5.079517,
-2, -3.705922, -5.347467,
-1, -3.510795, -5.079517,
-1, -3.705922, -5.347467,
0, -3.510795, -5.079517,
0, -3.705922, -5.347467,
1, -3.510795, -5.079517,
1, -3.705922, -5.347467,
2, -3.510795, -5.079517,
2, -3.705922, -5.347467
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
-3, -4.096177, -5.883369, 0, -0.5, 0.5, 0.5,
-3, -4.096177, -5.883369, 1, -0.5, 0.5, 0.5,
-3, -4.096177, -5.883369, 1, 1.5, 0.5, 0.5,
-3, -4.096177, -5.883369, 0, 1.5, 0.5, 0.5,
-2, -4.096177, -5.883369, 0, -0.5, 0.5, 0.5,
-2, -4.096177, -5.883369, 1, -0.5, 0.5, 0.5,
-2, -4.096177, -5.883369, 1, 1.5, 0.5, 0.5,
-2, -4.096177, -5.883369, 0, 1.5, 0.5, 0.5,
-1, -4.096177, -5.883369, 0, -0.5, 0.5, 0.5,
-1, -4.096177, -5.883369, 1, -0.5, 0.5, 0.5,
-1, -4.096177, -5.883369, 1, 1.5, 0.5, 0.5,
-1, -4.096177, -5.883369, 0, 1.5, 0.5, 0.5,
0, -4.096177, -5.883369, 0, -0.5, 0.5, 0.5,
0, -4.096177, -5.883369, 1, -0.5, 0.5, 0.5,
0, -4.096177, -5.883369, 1, 1.5, 0.5, 0.5,
0, -4.096177, -5.883369, 0, 1.5, 0.5, 0.5,
1, -4.096177, -5.883369, 0, -0.5, 0.5, 0.5,
1, -4.096177, -5.883369, 1, -0.5, 0.5, 0.5,
1, -4.096177, -5.883369, 1, 1.5, 0.5, 0.5,
1, -4.096177, -5.883369, 0, 1.5, 0.5, 0.5,
2, -4.096177, -5.883369, 0, -0.5, 0.5, 0.5,
2, -4.096177, -5.883369, 1, -0.5, 0.5, 0.5,
2, -4.096177, -5.883369, 1, 1.5, 0.5, 0.5,
2, -4.096177, -5.883369, 0, 1.5, 0.5, 0.5
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
-3.197909, -2, -5.079517,
-3.197909, 4, -5.079517,
-3.197909, -2, -5.079517,
-3.351581, -2, -5.347467,
-3.197909, 0, -5.079517,
-3.351581, 0, -5.347467,
-3.197909, 2, -5.079517,
-3.351581, 2, -5.347467,
-3.197909, 4, -5.079517,
-3.351581, 4, -5.347467
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
"0",
"2",
"4"
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
-3.658924, -2, -5.883369, 0, -0.5, 0.5, 0.5,
-3.658924, -2, -5.883369, 1, -0.5, 0.5, 0.5,
-3.658924, -2, -5.883369, 1, 1.5, 0.5, 0.5,
-3.658924, -2, -5.883369, 0, 1.5, 0.5, 0.5,
-3.658924, 0, -5.883369, 0, -0.5, 0.5, 0.5,
-3.658924, 0, -5.883369, 1, -0.5, 0.5, 0.5,
-3.658924, 0, -5.883369, 1, 1.5, 0.5, 0.5,
-3.658924, 0, -5.883369, 0, 1.5, 0.5, 0.5,
-3.658924, 2, -5.883369, 0, -0.5, 0.5, 0.5,
-3.658924, 2, -5.883369, 1, -0.5, 0.5, 0.5,
-3.658924, 2, -5.883369, 1, 1.5, 0.5, 0.5,
-3.658924, 2, -5.883369, 0, 1.5, 0.5, 0.5,
-3.658924, 4, -5.883369, 0, -0.5, 0.5, 0.5,
-3.658924, 4, -5.883369, 1, -0.5, 0.5, 0.5,
-3.658924, 4, -5.883369, 1, 1.5, 0.5, 0.5,
-3.658924, 4, -5.883369, 0, 1.5, 0.5, 0.5
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
-3.197909, -3.510795, -4,
-3.197909, -3.510795, 4,
-3.197909, -3.510795, -4,
-3.351581, -3.705922, -4,
-3.197909, -3.510795, -2,
-3.351581, -3.705922, -2,
-3.197909, -3.510795, 0,
-3.351581, -3.705922, 0,
-3.197909, -3.510795, 2,
-3.351581, -3.705922, 2,
-3.197909, -3.510795, 4,
-3.351581, -3.705922, 4
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
-3.658924, -4.096177, -4, 0, -0.5, 0.5, 0.5,
-3.658924, -4.096177, -4, 1, -0.5, 0.5, 0.5,
-3.658924, -4.096177, -4, 1, 1.5, 0.5, 0.5,
-3.658924, -4.096177, -4, 0, 1.5, 0.5, 0.5,
-3.658924, -4.096177, -2, 0, -0.5, 0.5, 0.5,
-3.658924, -4.096177, -2, 1, -0.5, 0.5, 0.5,
-3.658924, -4.096177, -2, 1, 1.5, 0.5, 0.5,
-3.658924, -4.096177, -2, 0, 1.5, 0.5, 0.5,
-3.658924, -4.096177, 0, 0, -0.5, 0.5, 0.5,
-3.658924, -4.096177, 0, 1, -0.5, 0.5, 0.5,
-3.658924, -4.096177, 0, 1, 1.5, 0.5, 0.5,
-3.658924, -4.096177, 0, 0, 1.5, 0.5, 0.5,
-3.658924, -4.096177, 2, 0, -0.5, 0.5, 0.5,
-3.658924, -4.096177, 2, 1, -0.5, 0.5, 0.5,
-3.658924, -4.096177, 2, 1, 1.5, 0.5, 0.5,
-3.658924, -4.096177, 2, 0, 1.5, 0.5, 0.5,
-3.658924, -4.096177, 4, 0, -0.5, 0.5, 0.5,
-3.658924, -4.096177, 4, 1, -0.5, 0.5, 0.5,
-3.658924, -4.096177, 4, 1, 1.5, 0.5, 0.5,
-3.658924, -4.096177, 4, 0, 1.5, 0.5, 0.5
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
-3.197909, -3.510795, -5.079517,
-3.197909, 4.294288, -5.079517,
-3.197909, -3.510795, 5.638514,
-3.197909, 4.294288, 5.638514,
-3.197909, -3.510795, -5.079517,
-3.197909, -3.510795, 5.638514,
-3.197909, 4.294288, -5.079517,
-3.197909, 4.294288, 5.638514,
-3.197909, -3.510795, -5.079517,
2.948951, -3.510795, -5.079517,
-3.197909, -3.510795, 5.638514,
2.948951, -3.510795, 5.638514,
-3.197909, 4.294288, -5.079517,
2.948951, 4.294288, -5.079517,
-3.197909, 4.294288, 5.638514,
2.948951, 4.294288, 5.638514,
2.948951, -3.510795, -5.079517,
2.948951, 4.294288, -5.079517,
2.948951, -3.510795, 5.638514,
2.948951, 4.294288, 5.638514,
2.948951, -3.510795, -5.079517,
2.948951, -3.510795, 5.638514,
2.948951, 4.294288, -5.079517,
2.948951, 4.294288, 5.638514
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
var radius = 7.803782;
var distance = 34.71991;
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
mvMatrix.translate( 0.1244792, -0.3917465, -0.2794983 );
mvMatrix.scale( 1.372669, 1.081039, 0.7872344 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.71991);
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
pymetrozine<-read.table("pymetrozine.xyz")
```

```
## Error in read.table("pymetrozine.xyz"): no lines available in input
```

```r
x<-pymetrozine$V2
```

```
## Error in eval(expr, envir, enclos): object 'pymetrozine' not found
```

```r
y<-pymetrozine$V3
```

```
## Error in eval(expr, envir, enclos): object 'pymetrozine' not found
```

```r
z<-pymetrozine$V4
```

```
## Error in eval(expr, envir, enclos): object 'pymetrozine' not found
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
-3.108392, -0.2777204, 0.1911553, 0, 0, 1, 1, 1,
-3.045115, 0.85394, 1.8154, 1, 0, 0, 1, 1,
-2.988729, 0.5788772, -2.970325, 1, 0, 0, 1, 1,
-2.936926, 0.6846901, -2.959533, 1, 0, 0, 1, 1,
-2.91955, -0.7177262, -2.943298, 1, 0, 0, 1, 1,
-2.724159, -0.2395525, -1.239911, 1, 0, 0, 1, 1,
-2.529625, -1.085587, -3.249584, 0, 0, 0, 1, 1,
-2.497716, 0.5822297, 0.02976097, 0, 0, 0, 1, 1,
-2.464379, -1.307396, -1.927728, 0, 0, 0, 1, 1,
-2.431128, -0.2923991, -2.128459, 0, 0, 0, 1, 1,
-2.364464, -0.6414279, -0.5034506, 0, 0, 0, 1, 1,
-2.268175, 0.7594141, -2.133775, 0, 0, 0, 1, 1,
-2.237433, 0.8100185, -1.646324, 0, 0, 0, 1, 1,
-2.23037, -0.7235696, -2.724334, 1, 1, 1, 1, 1,
-2.209395, -0.007838832, -2.309269, 1, 1, 1, 1, 1,
-2.206109, -0.9964755, -1.800786, 1, 1, 1, 1, 1,
-2.189513, 0.4753801, -0.5290308, 1, 1, 1, 1, 1,
-2.188174, 0.06495117, -2.920474, 1, 1, 1, 1, 1,
-2.186054, -0.2673581, -1.405241, 1, 1, 1, 1, 1,
-2.170932, -0.6951726, -1.237015, 1, 1, 1, 1, 1,
-2.161086, -0.7219067, -2.884318, 1, 1, 1, 1, 1,
-2.16001, 1.462381, -1.544811, 1, 1, 1, 1, 1,
-2.137886, -0.8675034, -1.29452, 1, 1, 1, 1, 1,
-2.109733, 0.8813109, -0.7936611, 1, 1, 1, 1, 1,
-2.082608, 1.334447, -0.8815234, 1, 1, 1, 1, 1,
-2.071813, 0.4461989, -2.916991, 1, 1, 1, 1, 1,
-2.053111, -0.8440158, -3.471182, 1, 1, 1, 1, 1,
-2.051546, 1.136569, -2.21009, 1, 1, 1, 1, 1,
-2.045618, -0.3947944, -2.89441, 0, 0, 1, 1, 1,
-2.035098, 1.110203, -0.5714389, 1, 0, 0, 1, 1,
-2.008927, 1.468149, -1.10689, 1, 0, 0, 1, 1,
-2.006834, 1.359088, 0.8939806, 1, 0, 0, 1, 1,
-2.002197, -0.291627, -1.810653, 1, 0, 0, 1, 1,
-1.999222, -0.2795171, -1.732767, 1, 0, 0, 1, 1,
-1.929792, -1.553588, -1.563203, 0, 0, 0, 1, 1,
-1.922772, 1.867294, -1.560521, 0, 0, 0, 1, 1,
-1.921775, -1.561063, -3.204983, 0, 0, 0, 1, 1,
-1.886203, -0.05757139, -1.288136, 0, 0, 0, 1, 1,
-1.883159, -0.4602062, 0.518254, 0, 0, 0, 1, 1,
-1.871433, -1.184027, -1.963271, 0, 0, 0, 1, 1,
-1.870197, 0.3949012, -2.89852, 0, 0, 0, 1, 1,
-1.796005, -0.7870322, -0.2411216, 1, 1, 1, 1, 1,
-1.791094, 0.1964451, -1.878067, 1, 1, 1, 1, 1,
-1.779957, 0.2553251, -0.4208874, 1, 1, 1, 1, 1,
-1.777529, 2.191304, -1.976175, 1, 1, 1, 1, 1,
-1.775649, -0.8304955, -0.7378557, 1, 1, 1, 1, 1,
-1.760588, 1.533276, -2.143606, 1, 1, 1, 1, 1,
-1.758364, -1.192187, -2.623583, 1, 1, 1, 1, 1,
-1.735116, 0.4262285, -0.9394109, 1, 1, 1, 1, 1,
-1.730411, -1.12235, -1.425732, 1, 1, 1, 1, 1,
-1.728254, -0.1547012, -3.38289, 1, 1, 1, 1, 1,
-1.70922, -0.223884, -0.6422517, 1, 1, 1, 1, 1,
-1.690358, -2.602853, -2.395374, 1, 1, 1, 1, 1,
-1.689139, 0.9959432, -0.8369655, 1, 1, 1, 1, 1,
-1.687332, -0.03691426, -2.828912, 1, 1, 1, 1, 1,
-1.682529, -1.172104, -3.285358, 1, 1, 1, 1, 1,
-1.659909, 0.06939643, -1.050598, 0, 0, 1, 1, 1,
-1.650788, 0.1723762, -0.6056445, 1, 0, 0, 1, 1,
-1.649105, -1.176452, -1.960415, 1, 0, 0, 1, 1,
-1.636746, -0.9802228, -2.311474, 1, 0, 0, 1, 1,
-1.635187, 0.1552866, -1.128312, 1, 0, 0, 1, 1,
-1.62963, 1.652109, 0.6465127, 1, 0, 0, 1, 1,
-1.618657, -0.3011612, -2.153438, 0, 0, 0, 1, 1,
-1.615009, -0.1121505, -0.1048046, 0, 0, 0, 1, 1,
-1.613321, -0.7896262, -2.744878, 0, 0, 0, 1, 1,
-1.591648, 0.7637044, 0.7818736, 0, 0, 0, 1, 1,
-1.585703, 0.4513663, -1.495403, 0, 0, 0, 1, 1,
-1.574837, 1.460667, -1.167246, 0, 0, 0, 1, 1,
-1.567349, 0.1622041, -2.489369, 0, 0, 0, 1, 1,
-1.564975, 2.330836, -0.6861269, 1, 1, 1, 1, 1,
-1.552314, 0.9873399, -1.406342, 1, 1, 1, 1, 1,
-1.549484, -0.3892541, -3.953339, 1, 1, 1, 1, 1,
-1.538342, 1.632194, -2.337563, 1, 1, 1, 1, 1,
-1.536191, 0.7891338, -0.242736, 1, 1, 1, 1, 1,
-1.527185, -0.3585213, -1.899313, 1, 1, 1, 1, 1,
-1.525062, 1.880838, -1.574379, 1, 1, 1, 1, 1,
-1.523071, 0.1464494, -2.96838, 1, 1, 1, 1, 1,
-1.511104, -0.8264017, -1.283563, 1, 1, 1, 1, 1,
-1.508765, -1.451398, -1.535259, 1, 1, 1, 1, 1,
-1.507347, 1.641663, 0.4339541, 1, 1, 1, 1, 1,
-1.503897, -0.07401578, -2.293987, 1, 1, 1, 1, 1,
-1.498607, 0.7717863, -1.962447, 1, 1, 1, 1, 1,
-1.468864, 0.3445401, -2.68052, 1, 1, 1, 1, 1,
-1.455107, 0.769743, -2.431719, 1, 1, 1, 1, 1,
-1.451952, -2.980453, -2.897151, 0, 0, 1, 1, 1,
-1.450082, -0.5351394, -2.406972, 1, 0, 0, 1, 1,
-1.435212, -0.3587714, -2.305497, 1, 0, 0, 1, 1,
-1.423627, 0.344605, -0.6788036, 1, 0, 0, 1, 1,
-1.42099, 0.6293684, -0.5953485, 1, 0, 0, 1, 1,
-1.41972, -0.2504773, -1.210814, 1, 0, 0, 1, 1,
-1.388135, -0.8341159, -1.208972, 0, 0, 0, 1, 1,
-1.361575, 0.3216145, -1.070244, 0, 0, 0, 1, 1,
-1.355206, -0.07532151, -1.200642, 0, 0, 0, 1, 1,
-1.352871, -0.3509572, -0.448411, 0, 0, 0, 1, 1,
-1.33881, -1.251341, -2.32013, 0, 0, 0, 1, 1,
-1.3324, 1.223837, -2.477943, 0, 0, 0, 1, 1,
-1.32595, 1.070153, -1.075987, 0, 0, 0, 1, 1,
-1.321909, 1.656564, -0.5134398, 1, 1, 1, 1, 1,
-1.31731, 0.2088119, -2.001186, 1, 1, 1, 1, 1,
-1.31265, 0.05274357, -2.560372, 1, 1, 1, 1, 1,
-1.308701, 0.05252471, -3.052933, 1, 1, 1, 1, 1,
-1.303788, 0.9674019, 0.3084292, 1, 1, 1, 1, 1,
-1.299746, 1.281832, -1.749383, 1, 1, 1, 1, 1,
-1.291614, -1.273114, -3.485271, 1, 1, 1, 1, 1,
-1.290458, -1.098605, -1.024781, 1, 1, 1, 1, 1,
-1.281775, 0.5478576, -0.3807764, 1, 1, 1, 1, 1,
-1.278804, 0.3347949, -0.4665312, 1, 1, 1, 1, 1,
-1.277757, -0.1623758, -1.307376, 1, 1, 1, 1, 1,
-1.26196, 0.7101849, -1.081101, 1, 1, 1, 1, 1,
-1.259642, -0.4520883, -1.866842, 1, 1, 1, 1, 1,
-1.257569, 0.1500658, -1.755964, 1, 1, 1, 1, 1,
-1.256893, 0.438196, -1.923342, 1, 1, 1, 1, 1,
-1.236855, 1.364271, 0.9418204, 0, 0, 1, 1, 1,
-1.229569, 3.354907, -0.4626654, 1, 0, 0, 1, 1,
-1.227224, -0.8912867, -2.510972, 1, 0, 0, 1, 1,
-1.225908, 0.5975625, -1.420429, 1, 0, 0, 1, 1,
-1.225821, 1.025684, -1.727579, 1, 0, 0, 1, 1,
-1.223131, -0.4742828, -2.659852, 1, 0, 0, 1, 1,
-1.218028, 0.1346669, 0.5572159, 0, 0, 0, 1, 1,
-1.214789, -1.514056, -2.225213, 0, 0, 0, 1, 1,
-1.214406, 1.074797, -1.605122, 0, 0, 0, 1, 1,
-1.214, 3.145425, -2.367217, 0, 0, 0, 1, 1,
-1.212165, -0.8881271, -2.463548, 0, 0, 0, 1, 1,
-1.209551, -0.5874608, -2.42221, 0, 0, 0, 1, 1,
-1.208804, 0.09716664, -1.051095, 0, 0, 0, 1, 1,
-1.191853, 0.4198526, -2.008725, 1, 1, 1, 1, 1,
-1.173073, -0.490357, -4.777707, 1, 1, 1, 1, 1,
-1.171079, 0.3973361, -1.803355, 1, 1, 1, 1, 1,
-1.170414, 0.2875575, -2.492672, 1, 1, 1, 1, 1,
-1.154054, -1.044838, -4.621738, 1, 1, 1, 1, 1,
-1.15241, -0.8731543, -2.27178, 1, 1, 1, 1, 1,
-1.149649, -0.4641847, -2.215507, 1, 1, 1, 1, 1,
-1.149574, -1.082796, -2.359705, 1, 1, 1, 1, 1,
-1.148914, -0.8899527, -2.661366, 1, 1, 1, 1, 1,
-1.148021, -0.01988794, -0.1086942, 1, 1, 1, 1, 1,
-1.143948, 0.4749467, -1.284918, 1, 1, 1, 1, 1,
-1.142385, -1.035486, -1.535166, 1, 1, 1, 1, 1,
-1.139824, -0.9037141, -0.3813031, 1, 1, 1, 1, 1,
-1.138908, 0.2491435, -0.8310673, 1, 1, 1, 1, 1,
-1.132579, 2.473025, -2.248949, 1, 1, 1, 1, 1,
-1.12782, -1.431143, -2.900756, 0, 0, 1, 1, 1,
-1.124333, 1.950517, 0.2741486, 1, 0, 0, 1, 1,
-1.121793, 0.116812, -1.067635, 1, 0, 0, 1, 1,
-1.121728, 1.619756, -0.07117105, 1, 0, 0, 1, 1,
-1.096418, -0.1989584, -0.9813606, 1, 0, 0, 1, 1,
-1.081483, -0.4948448, -2.446505, 1, 0, 0, 1, 1,
-1.071996, 0.418854, -1.119069, 0, 0, 0, 1, 1,
-1.061836, -0.2429937, -1.329842, 0, 0, 0, 1, 1,
-1.058542, -1.099743, -2.028608, 0, 0, 0, 1, 1,
-1.054174, 1.215351, -0.3273997, 0, 0, 0, 1, 1,
-1.052028, 0.0476899, -2.438743, 0, 0, 0, 1, 1,
-1.043178, 0.1306249, -0.8546591, 0, 0, 0, 1, 1,
-1.039457, 0.3711305, -2.21678, 0, 0, 0, 1, 1,
-1.035118, 1.005307, -0.7085977, 1, 1, 1, 1, 1,
-1.032535, -0.3163852, -2.037426, 1, 1, 1, 1, 1,
-1.032117, -0.76389, -2.48284, 1, 1, 1, 1, 1,
-1.012996, -0.9005352, -2.718697, 1, 1, 1, 1, 1,
-1.005599, -2.006481, -2.069488, 1, 1, 1, 1, 1,
-0.9833825, -0.08784169, -1.122091, 1, 1, 1, 1, 1,
-0.9658809, 0.3539328, 0.2592565, 1, 1, 1, 1, 1,
-0.9655018, 0.9111328, -0.4668636, 1, 1, 1, 1, 1,
-0.9621428, 0.4269074, -2.173483, 1, 1, 1, 1, 1,
-0.9621314, -0.7415804, -2.248046, 1, 1, 1, 1, 1,
-0.9611371, -0.02961908, -0.9518306, 1, 1, 1, 1, 1,
-0.9602719, 1.332191, -0.01576014, 1, 1, 1, 1, 1,
-0.9582642, 0.8075058, 0.3185221, 1, 1, 1, 1, 1,
-0.9500622, 0.5095162, -1.388907, 1, 1, 1, 1, 1,
-0.9480116, 0.04778644, 0.1568125, 1, 1, 1, 1, 1,
-0.9441519, 0.5625237, -0.3224956, 0, 0, 1, 1, 1,
-0.9401938, -0.08048575, -0.5759398, 1, 0, 0, 1, 1,
-0.9393224, 2.077975, -1.133929, 1, 0, 0, 1, 1,
-0.934298, -0.234568, -1.520124, 1, 0, 0, 1, 1,
-0.9290958, -1.045513, -1.357574, 1, 0, 0, 1, 1,
-0.9288179, -1.291721, -2.114403, 1, 0, 0, 1, 1,
-0.9268668, -0.6824788, -2.072353, 0, 0, 0, 1, 1,
-0.9262204, 1.173286, 0.1679276, 0, 0, 0, 1, 1,
-0.923606, 0.2358864, -2.334353, 0, 0, 0, 1, 1,
-0.9221622, 0.5768257, -2.033539, 0, 0, 0, 1, 1,
-0.9185126, 0.9745793, 0.7163945, 0, 0, 0, 1, 1,
-0.9104883, 0.8254511, -1.772234, 0, 0, 0, 1, 1,
-0.9103534, 0.4415634, -0.9941048, 0, 0, 0, 1, 1,
-0.9059452, 0.1701399, -3.128334, 1, 1, 1, 1, 1,
-0.9016018, 2.324352, 1.703014, 1, 1, 1, 1, 1,
-0.8993705, -0.8308257, -2.300523, 1, 1, 1, 1, 1,
-0.8967384, 0.04257718, -3.55698, 1, 1, 1, 1, 1,
-0.8847553, -0.2563402, -2.469214, 1, 1, 1, 1, 1,
-0.8772491, 0.04532413, -2.232, 1, 1, 1, 1, 1,
-0.8761458, -1.094009, -1.974927, 1, 1, 1, 1, 1,
-0.8741167, -0.9864662, -1.358085, 1, 1, 1, 1, 1,
-0.8703645, 0.6150014, -1.536353, 1, 1, 1, 1, 1,
-0.8684316, -0.1008903, -0.4419047, 1, 1, 1, 1, 1,
-0.8679536, -0.8537302, -2.067487, 1, 1, 1, 1, 1,
-0.8663467, 1.209944, -0.8201539, 1, 1, 1, 1, 1,
-0.8626409, 1.180506, 1.792923, 1, 1, 1, 1, 1,
-0.8599325, 0.6083585, -0.9172359, 1, 1, 1, 1, 1,
-0.8590018, 1.91899, 0.3687512, 1, 1, 1, 1, 1,
-0.858145, -0.9545224, -3.806674, 0, 0, 1, 1, 1,
-0.8572105, -0.4836774, -2.795987, 1, 0, 0, 1, 1,
-0.8556095, -0.1283261, -0.929687, 1, 0, 0, 1, 1,
-0.8545064, 0.178559, 0.05744314, 1, 0, 0, 1, 1,
-0.8508825, -0.01686057, -0.9351996, 1, 0, 0, 1, 1,
-0.8398582, -0.2853725, -2.227792, 1, 0, 0, 1, 1,
-0.8317134, -0.1642307, -2.604803, 0, 0, 0, 1, 1,
-0.829479, -0.09833954, -1.932858, 0, 0, 0, 1, 1,
-0.8263556, 0.8348947, 0.8802173, 0, 0, 0, 1, 1,
-0.8255943, -1.259622, -3.063717, 0, 0, 0, 1, 1,
-0.8169264, -1.966101, -4.234103, 0, 0, 0, 1, 1,
-0.8166586, -0.336413, -3.219796, 0, 0, 0, 1, 1,
-0.8164061, -1.243455, -3.310957, 0, 0, 0, 1, 1,
-0.8091261, -2.325856, -0.5751514, 1, 1, 1, 1, 1,
-0.8031514, 0.7977574, -0.2126271, 1, 1, 1, 1, 1,
-0.8010772, -0.6099039, -0.7439981, 1, 1, 1, 1, 1,
-0.801005, -0.1228312, -2.382137, 1, 1, 1, 1, 1,
-0.7967103, 1.820349, -0.177886, 1, 1, 1, 1, 1,
-0.7940952, 0.5099426, -0.3300664, 1, 1, 1, 1, 1,
-0.7931759, -0.4019468, -2.086758, 1, 1, 1, 1, 1,
-0.7928602, -0.9262089, -2.51961, 1, 1, 1, 1, 1,
-0.7928572, -0.8554895, -0.8209394, 1, 1, 1, 1, 1,
-0.7906553, -1.208719, -2.221764, 1, 1, 1, 1, 1,
-0.7903001, -0.5392556, -2.286128, 1, 1, 1, 1, 1,
-0.7874005, -0.5159499, -1.544187, 1, 1, 1, 1, 1,
-0.7865211, 0.6619856, -1.026888, 1, 1, 1, 1, 1,
-0.7800142, 1.493662, 0.7228777, 1, 1, 1, 1, 1,
-0.7792067, 0.1009447, -1.780877, 1, 1, 1, 1, 1,
-0.771732, 0.8688647, -1.665275, 0, 0, 1, 1, 1,
-0.7708884, -1.215665, -1.140705, 1, 0, 0, 1, 1,
-0.7602627, 0.6968866, -1.415348, 1, 0, 0, 1, 1,
-0.7598121, 0.2308521, -1.244621, 1, 0, 0, 1, 1,
-0.7547116, 0.5233611, -3.762107, 1, 0, 0, 1, 1,
-0.7529885, -0.3143496, -2.439359, 1, 0, 0, 1, 1,
-0.752713, 0.4291302, -1.101196, 0, 0, 0, 1, 1,
-0.7514801, -0.7786409, -2.876748, 0, 0, 0, 1, 1,
-0.7508764, 2.864999, 1.859372, 0, 0, 0, 1, 1,
-0.7495775, 0.3653422, 1.000108, 0, 0, 0, 1, 1,
-0.7466667, 0.936052, -0.4870372, 0, 0, 0, 1, 1,
-0.7422036, 2.134362, -0.7378892, 0, 0, 0, 1, 1,
-0.7395067, 0.08480136, -1.990906, 0, 0, 0, 1, 1,
-0.7354214, -0.3168029, -1.447408, 1, 1, 1, 1, 1,
-0.7333651, -0.6220778, -1.730316, 1, 1, 1, 1, 1,
-0.7281891, 0.3567335, 1.423964, 1, 1, 1, 1, 1,
-0.7186546, -1.981174, -2.786422, 1, 1, 1, 1, 1,
-0.7174242, -1.827112, -2.636791, 1, 1, 1, 1, 1,
-0.713364, -0.4678324, -2.148847, 1, 1, 1, 1, 1,
-0.6938987, 1.286888, 1.101811, 1, 1, 1, 1, 1,
-0.6928617, -0.2825785, -0.8420708, 1, 1, 1, 1, 1,
-0.6890894, -1.037699, -3.377441, 1, 1, 1, 1, 1,
-0.6878159, -0.2200973, -3.261224, 1, 1, 1, 1, 1,
-0.6867205, -0.3324653, -1.259885, 1, 1, 1, 1, 1,
-0.6826527, 0.2580771, -1.799546, 1, 1, 1, 1, 1,
-0.680165, 0.02407701, -1.845725, 1, 1, 1, 1, 1,
-0.6788214, -0.4879655, -1.028684, 1, 1, 1, 1, 1,
-0.6778689, -0.6516309, -1.614193, 1, 1, 1, 1, 1,
-0.675079, 0.3075774, -0.422867, 0, 0, 1, 1, 1,
-0.6688978, -0.6333471, -1.997293, 1, 0, 0, 1, 1,
-0.665715, -0.705411, -1.600718, 1, 0, 0, 1, 1,
-0.6644822, 0.2645237, -0.6791755, 1, 0, 0, 1, 1,
-0.6626122, -0.2246387, -2.33082, 1, 0, 0, 1, 1,
-0.6571238, -0.7994533, -1.927301, 1, 0, 0, 1, 1,
-0.6570427, -0.05860075, -1.773656, 0, 0, 0, 1, 1,
-0.6536013, -0.7434856, -2.688867, 0, 0, 0, 1, 1,
-0.6534303, -0.8118873, -4.255624, 0, 0, 0, 1, 1,
-0.648087, 1.201587, -2.158426, 0, 0, 0, 1, 1,
-0.6454741, 1.433501, -0.4006179, 0, 0, 0, 1, 1,
-0.6409386, -1.168747, -2.416438, 0, 0, 0, 1, 1,
-0.6391975, -0.7053652, -3.230772, 0, 0, 0, 1, 1,
-0.637799, 2.120288, 1.922414, 1, 1, 1, 1, 1,
-0.6349242, 1.292122, -0.297784, 1, 1, 1, 1, 1,
-0.629436, -1.031062, -2.00525, 1, 1, 1, 1, 1,
-0.6163027, 0.3776222, -1.938094, 1, 1, 1, 1, 1,
-0.6131354, 1.326149, -0.9282936, 1, 1, 1, 1, 1,
-0.6107595, -0.9747413, 0.03973855, 1, 1, 1, 1, 1,
-0.6097614, 0.7349136, -0.7763332, 1, 1, 1, 1, 1,
-0.6079597, -1.729459, -2.817002, 1, 1, 1, 1, 1,
-0.5998089, -0.535065, -0.5242794, 1, 1, 1, 1, 1,
-0.5907912, -0.3228544, -3.193527, 1, 1, 1, 1, 1,
-0.5895746, 0.94857, -0.9009873, 1, 1, 1, 1, 1,
-0.5885151, -0.319146, -2.449629, 1, 1, 1, 1, 1,
-0.5773748, -0.9283296, -3.298322, 1, 1, 1, 1, 1,
-0.5762871, 1.937925, -0.2239221, 1, 1, 1, 1, 1,
-0.5684234, -1.434963, -1.572978, 1, 1, 1, 1, 1,
-0.561749, 0.4806297, -1.921763, 0, 0, 1, 1, 1,
-0.5601669, 0.3905117, 0.7377228, 1, 0, 0, 1, 1,
-0.5549842, 1.220696, -1.434697, 1, 0, 0, 1, 1,
-0.5531424, 1.260205, -0.865822, 1, 0, 0, 1, 1,
-0.5506564, 2.806752, -0.2983158, 1, 0, 0, 1, 1,
-0.5469568, -0.318297, -1.25751, 1, 0, 0, 1, 1,
-0.539415, 0.6261765, -0.4385418, 0, 0, 0, 1, 1,
-0.5373619, 0.1053776, -1.60132, 0, 0, 0, 1, 1,
-0.5344403, -0.5873613, -2.823648, 0, 0, 0, 1, 1,
-0.5322256, -1.645569, -2.148243, 0, 0, 0, 1, 1,
-0.5313346, -0.3194413, -1.358704, 0, 0, 0, 1, 1,
-0.5246645, 0.8588243, -3.146175, 0, 0, 0, 1, 1,
-0.5234243, -0.9069083, -0.9130052, 0, 0, 0, 1, 1,
-0.5233901, 1.726912, -0.7741228, 1, 1, 1, 1, 1,
-0.5177082, -0.524209, -2.639966, 1, 1, 1, 1, 1,
-0.5141805, 0.3678135, -0.5255231, 1, 1, 1, 1, 1,
-0.5086251, 0.3167106, -0.2253922, 1, 1, 1, 1, 1,
-0.5077202, 0.1214207, -2.147836, 1, 1, 1, 1, 1,
-0.5062175, 0.8748192, -1.759173, 1, 1, 1, 1, 1,
-0.5061732, 2.392088, -1.000195, 1, 1, 1, 1, 1,
-0.5058076, -1.249103, -2.696984, 1, 1, 1, 1, 1,
-0.4980197, 1.019439, 1.17815, 1, 1, 1, 1, 1,
-0.4961403, -0.8810215, -4.596449, 1, 1, 1, 1, 1,
-0.4950242, -2.798659, -2.175359, 1, 1, 1, 1, 1,
-0.4867141, -1.626763, -3.206743, 1, 1, 1, 1, 1,
-0.4849582, -2.190726, -4.923429, 1, 1, 1, 1, 1,
-0.4831354, 0.3060088, -2.204962, 1, 1, 1, 1, 1,
-0.4830004, -1.182675, -3.049417, 1, 1, 1, 1, 1,
-0.4817354, -0.5605403, -2.448638, 0, 0, 1, 1, 1,
-0.4814542, 0.2136257, -3.275203, 1, 0, 0, 1, 1,
-0.4802369, 0.8416276, 0.7862852, 1, 0, 0, 1, 1,
-0.4777158, 1.375146, 0.2297028, 1, 0, 0, 1, 1,
-0.4730299, -1.356302, -1.819587, 1, 0, 0, 1, 1,
-0.4713542, -1.114718, -2.991543, 1, 0, 0, 1, 1,
-0.4691178, -1.787193, -3.436299, 0, 0, 0, 1, 1,
-0.4609596, 0.0003530211, -0.5377763, 0, 0, 0, 1, 1,
-0.4551386, -1.659913, -2.898045, 0, 0, 0, 1, 1,
-0.4514062, -0.9155326, -3.071627, 0, 0, 0, 1, 1,
-0.4498625, 0.4052287, -0.5606382, 0, 0, 0, 1, 1,
-0.4453314, 1.949387, -0.1109012, 0, 0, 0, 1, 1,
-0.4410399, -1.216651, -4.215077, 0, 0, 0, 1, 1,
-0.4393261, 0.627189, -1.984635, 1, 1, 1, 1, 1,
-0.4361214, 0.3807148, -1.240773, 1, 1, 1, 1, 1,
-0.4359823, 0.2898102, -0.1412008, 1, 1, 1, 1, 1,
-0.4321507, -0.397768, -2.950004, 1, 1, 1, 1, 1,
-0.4306943, -0.2903955, -3.430207, 1, 1, 1, 1, 1,
-0.4266741, 0.9141431, 0.9768969, 1, 1, 1, 1, 1,
-0.4241504, -0.05427188, -2.889532, 1, 1, 1, 1, 1,
-0.423635, 0.5892551, -1.060359, 1, 1, 1, 1, 1,
-0.4193681, -0.5693271, -2.002252, 1, 1, 1, 1, 1,
-0.4180369, -0.698062, -2.702509, 1, 1, 1, 1, 1,
-0.4161456, -0.4761921, -3.698887, 1, 1, 1, 1, 1,
-0.413693, -1.543517, -4.794572, 1, 1, 1, 1, 1,
-0.4119934, -1.609343, -1.376417, 1, 1, 1, 1, 1,
-0.411919, -0.7931529, -2.655735, 1, 1, 1, 1, 1,
-0.4061821, 0.4663069, -0.04011404, 1, 1, 1, 1, 1,
-0.4050485, 0.1483901, 0.8612462, 0, 0, 1, 1, 1,
-0.4048008, 1.025385, -0.8362198, 1, 0, 0, 1, 1,
-0.3901309, -1.111207, -2.756354, 1, 0, 0, 1, 1,
-0.3900512, -1.001945, -3.196683, 1, 0, 0, 1, 1,
-0.3839141, -1.424221, -3.544229, 1, 0, 0, 1, 1,
-0.3824823, 0.7221564, -0.6451172, 1, 0, 0, 1, 1,
-0.3778001, 0.5503732, 0.2578871, 0, 0, 0, 1, 1,
-0.3751733, 0.6501199, 0.2508081, 0, 0, 0, 1, 1,
-0.3750743, -0.5053481, -2.880878, 0, 0, 0, 1, 1,
-0.3730097, -0.1906077, -1.682451, 0, 0, 0, 1, 1,
-0.3672451, 0.7319421, 0.3415002, 0, 0, 0, 1, 1,
-0.3610758, -0.9466204, -2.809605, 0, 0, 0, 1, 1,
-0.358008, 0.00719087, -1.217925, 0, 0, 0, 1, 1,
-0.3551689, 0.3478457, -2.487356, 1, 1, 1, 1, 1,
-0.3520805, 0.448577, -1.31917, 1, 1, 1, 1, 1,
-0.3512145, -1.331858, -1.205276, 1, 1, 1, 1, 1,
-0.351163, 0.7960274, 1.1067, 1, 1, 1, 1, 1,
-0.350066, 0.4935922, 0.420831, 1, 1, 1, 1, 1,
-0.3465309, -0.5270966, -2.438172, 1, 1, 1, 1, 1,
-0.3458841, -0.2185464, -2.844202, 1, 1, 1, 1, 1,
-0.3447978, -0.752537, -1.938792, 1, 1, 1, 1, 1,
-0.3423718, -0.8364075, -3.983908, 1, 1, 1, 1, 1,
-0.3394743, 0.502529, -1.367983, 1, 1, 1, 1, 1,
-0.3387183, -0.621334, -2.536679, 1, 1, 1, 1, 1,
-0.3378488, -1.059603, -2.358318, 1, 1, 1, 1, 1,
-0.3374722, -0.6890109, -0.3634822, 1, 1, 1, 1, 1,
-0.3352914, -0.4303149, -2.152357, 1, 1, 1, 1, 1,
-0.3344961, 0.6914129, -0.7397587, 1, 1, 1, 1, 1,
-0.3338276, -0.1528795, -1.991907, 0, 0, 1, 1, 1,
-0.3280463, 0.4406099, -1.007877, 1, 0, 0, 1, 1,
-0.325979, -1.213796, -2.593308, 1, 0, 0, 1, 1,
-0.3226638, 0.03074878, -1.575296, 1, 0, 0, 1, 1,
-0.3223491, -0.4071603, -2.055321, 1, 0, 0, 1, 1,
-0.3178445, 1.746737, -2.071899, 1, 0, 0, 1, 1,
-0.3156047, -0.4583315, -2.76422, 0, 0, 0, 1, 1,
-0.3074101, 0.3154037, -1.696132, 0, 0, 0, 1, 1,
-0.3071329, 0.549562, -1.440433, 0, 0, 0, 1, 1,
-0.3054385, 1.531681, 0.3628173, 0, 0, 0, 1, 1,
-0.3003017, -1.297898, -2.201291, 0, 0, 0, 1, 1,
-0.2986726, -0.8179435, -2.410535, 0, 0, 0, 1, 1,
-0.2986389, -1.681378, -3.717257, 0, 0, 0, 1, 1,
-0.2964831, -0.4188907, -3.175565, 1, 1, 1, 1, 1,
-0.2960379, -0.7976548, -3.686953, 1, 1, 1, 1, 1,
-0.2860292, 0.3975242, -0.6452947, 1, 1, 1, 1, 1,
-0.2849408, 0.4959776, -0.9022593, 1, 1, 1, 1, 1,
-0.2846522, -0.4463474, -2.973912, 1, 1, 1, 1, 1,
-0.284027, 0.6503638, -1.801766, 1, 1, 1, 1, 1,
-0.2813327, 0.7058951, -0.6026813, 1, 1, 1, 1, 1,
-0.2810063, -0.006148813, 0.7343852, 1, 1, 1, 1, 1,
-0.2803878, -1.149807, -2.238661, 1, 1, 1, 1, 1,
-0.2802799, 0.6052849, -0.3890918, 1, 1, 1, 1, 1,
-0.2755012, 2.274161, -0.568921, 1, 1, 1, 1, 1,
-0.2737878, 0.5820427, -0.1210003, 1, 1, 1, 1, 1,
-0.2712035, -1.067179, -3.630812, 1, 1, 1, 1, 1,
-0.2705726, 0.01358066, -0.5807454, 1, 1, 1, 1, 1,
-0.2701876, -0.9411748, -4.476216, 1, 1, 1, 1, 1,
-0.2700037, 0.1550627, -0.9347873, 0, 0, 1, 1, 1,
-0.263328, 0.03661801, -1.308, 1, 0, 0, 1, 1,
-0.256891, 0.9785105, -0.5503736, 1, 0, 0, 1, 1,
-0.2557119, 0.9104602, 2.42899, 1, 0, 0, 1, 1,
-0.2536552, 0.3019591, -0.9343829, 1, 0, 0, 1, 1,
-0.2512765, -0.7218298, -3.32394, 1, 0, 0, 1, 1,
-0.2494792, -2.322804, -3.503408, 0, 0, 0, 1, 1,
-0.2450798, -1.875716, -4.677163, 0, 0, 0, 1, 1,
-0.2396615, 0.003122658, -0.009094802, 0, 0, 0, 1, 1,
-0.2395396, 0.9939682, -0.3197227, 0, 0, 0, 1, 1,
-0.2359468, 1.225716, -1.425608, 0, 0, 0, 1, 1,
-0.2305757, -0.6110981, -4.725502, 0, 0, 0, 1, 1,
-0.2280058, 0.5034177, 0.00885989, 0, 0, 0, 1, 1,
-0.2266907, -0.9203793, -1.605167, 1, 1, 1, 1, 1,
-0.2263454, 0.6938401, -1.716571, 1, 1, 1, 1, 1,
-0.2249744, -0.568362, -3.285136, 1, 1, 1, 1, 1,
-0.2207347, 0.3204917, -1.591568, 1, 1, 1, 1, 1,
-0.2198177, -0.5092572, -4.015017, 1, 1, 1, 1, 1,
-0.2190669, -1.611721, -1.774018, 1, 1, 1, 1, 1,
-0.2163152, 0.7182363, 1.377861, 1, 1, 1, 1, 1,
-0.2147138, 1.580438, 0.2452456, 1, 1, 1, 1, 1,
-0.2128352, 0.6776471, -0.81455, 1, 1, 1, 1, 1,
-0.2106411, 0.01826247, -1.679018, 1, 1, 1, 1, 1,
-0.206784, 0.5570454, -1.567583, 1, 1, 1, 1, 1,
-0.2026416, -0.005558311, -2.524364, 1, 1, 1, 1, 1,
-0.2022538, -0.4159701, -3.328425, 1, 1, 1, 1, 1,
-0.2018792, -0.6581048, -3.401665, 1, 1, 1, 1, 1,
-0.2012707, 0.8923633, -1.736752, 1, 1, 1, 1, 1,
-0.2010998, -0.06339741, -4.591341, 0, 0, 1, 1, 1,
-0.1984681, -0.7347383, -1.442954, 1, 0, 0, 1, 1,
-0.1941365, -0.713206, -2.764959, 1, 0, 0, 1, 1,
-0.1907255, -0.8312702, -3.425833, 1, 0, 0, 1, 1,
-0.1894713, -1.051116, -2.962708, 1, 0, 0, 1, 1,
-0.188457, -1.237183, -2.626354, 1, 0, 0, 1, 1,
-0.1837372, 1.383627, 0.5719212, 0, 0, 0, 1, 1,
-0.1806239, -1.564434, -1.865954, 0, 0, 0, 1, 1,
-0.1792657, -0.195262, -3.004326, 0, 0, 0, 1, 1,
-0.1736077, -1.722526, -3.459398, 0, 0, 0, 1, 1,
-0.1666955, 0.6875291, -0.2760693, 0, 0, 0, 1, 1,
-0.1639981, -0.7929979, -3.442317, 0, 0, 0, 1, 1,
-0.1635888, -0.4585941, -4.21956, 0, 0, 0, 1, 1,
-0.1595155, 0.4644775, 1.074078, 1, 1, 1, 1, 1,
-0.1590483, -0.5716808, -1.218717, 1, 1, 1, 1, 1,
-0.1585908, -0.1110761, 0.2729629, 1, 1, 1, 1, 1,
-0.1570822, -0.7037719, -2.588004, 1, 1, 1, 1, 1,
-0.1550481, 0.4514244, 0.07594085, 1, 1, 1, 1, 1,
-0.1539208, -0.07206162, 0.05519199, 1, 1, 1, 1, 1,
-0.1473393, 0.8332143, -0.3755074, 1, 1, 1, 1, 1,
-0.1439597, -0.07783835, -2.347181, 1, 1, 1, 1, 1,
-0.1402801, -0.1559023, -1.814057, 1, 1, 1, 1, 1,
-0.1398952, -0.4341543, -2.858658, 1, 1, 1, 1, 1,
-0.1367654, -1.356117, -4.238661, 1, 1, 1, 1, 1,
-0.1328747, -0.2925967, -3.086846, 1, 1, 1, 1, 1,
-0.1319793, 0.09704854, 0.1652894, 1, 1, 1, 1, 1,
-0.1290283, 0.2319103, -0.0830946, 1, 1, 1, 1, 1,
-0.1249275, 2.657097, -0.4850379, 1, 1, 1, 1, 1,
-0.1209775, 0.2363394, 0.4470696, 0, 0, 1, 1, 1,
-0.113967, 0.32368, -1.027003, 1, 0, 0, 1, 1,
-0.1055705, 0.3209018, -0.360281, 1, 0, 0, 1, 1,
-0.1050433, -0.3777166, -0.8863955, 1, 0, 0, 1, 1,
-0.103493, 1.105133, -0.4756215, 1, 0, 0, 1, 1,
-0.1033479, -0.3588085, -3.3842, 1, 0, 0, 1, 1,
-0.1031499, -1.22266, -2.512634, 0, 0, 0, 1, 1,
-0.1030682, -1.409046, -2.39941, 0, 0, 0, 1, 1,
-0.102732, -0.5194961, -3.512018, 0, 0, 0, 1, 1,
-0.1025972, 0.3865258, -0.9716367, 0, 0, 0, 1, 1,
-0.1022349, -0.2708147, -3.003613, 0, 0, 0, 1, 1,
-0.1011955, 1.68437, -0.1023169, 0, 0, 0, 1, 1,
-0.09972967, -1.780508, -4.231418, 0, 0, 0, 1, 1,
-0.09708346, 0.4792414, -1.576545, 1, 1, 1, 1, 1,
-0.09659068, -1.952295, -4.362635, 1, 1, 1, 1, 1,
-0.09633657, 0.9654775, 0.2391378, 1, 1, 1, 1, 1,
-0.09530708, 0.7827095, 0.1938606, 1, 1, 1, 1, 1,
-0.09008683, 0.0322479, -1.936834, 1, 1, 1, 1, 1,
-0.08703365, 0.7330248, -0.3756485, 1, 1, 1, 1, 1,
-0.08405425, -0.120995, -2.025942, 1, 1, 1, 1, 1,
-0.08119341, 0.3591668, 0.2775785, 1, 1, 1, 1, 1,
-0.07879062, 0.5055106, -0.5956373, 1, 1, 1, 1, 1,
-0.07616767, 1.813602, -0.3798561, 1, 1, 1, 1, 1,
-0.07455184, 1.106206, 0.06559349, 1, 1, 1, 1, 1,
-0.07282044, -3.019634, -1.082637, 1, 1, 1, 1, 1,
-0.06931569, -2.326614, -3.187721, 1, 1, 1, 1, 1,
-0.06846339, 0.7373039, 0.9223602, 1, 1, 1, 1, 1,
-0.0664731, -0.586925, -1.197574, 1, 1, 1, 1, 1,
-0.06399725, -1.520616, -3.729335, 0, 0, 1, 1, 1,
-0.06275234, -0.7425526, -3.611533, 1, 0, 0, 1, 1,
-0.06055734, 0.2555605, -0.4502699, 1, 0, 0, 1, 1,
-0.06041225, 1.726274, 0.1865106, 1, 0, 0, 1, 1,
-0.05996635, -0.2346275, -3.168544, 1, 0, 0, 1, 1,
-0.05850142, 0.2782707, -0.1897389, 1, 0, 0, 1, 1,
-0.05716005, 0.03555079, -1.293392, 0, 0, 0, 1, 1,
-0.05411029, 1.80753, -0.3049963, 0, 0, 0, 1, 1,
-0.0461919, 0.6390474, 0.1751167, 0, 0, 0, 1, 1,
-0.04574835, 0.4121549, -1.753572, 0, 0, 0, 1, 1,
-0.03869749, -0.4223753, -3.209121, 0, 0, 0, 1, 1,
-0.03627393, 0.5453853, -1.1448, 0, 0, 0, 1, 1,
-0.02990769, 0.05929163, -0.7498952, 0, 0, 0, 1, 1,
-0.02606685, 0.9237131, -0.8537184, 1, 1, 1, 1, 1,
-0.02603299, -2.071185, -2.622465, 1, 1, 1, 1, 1,
-0.02516596, 1.563421, 0.5327667, 1, 1, 1, 1, 1,
-0.01949576, 0.7542088, -0.4362107, 1, 1, 1, 1, 1,
-0.01866856, 0.2446435, -0.5721061, 1, 1, 1, 1, 1,
-0.01758624, 0.2301362, 0.4405769, 1, 1, 1, 1, 1,
-0.0169933, 1.768072, 1.108249, 1, 1, 1, 1, 1,
-0.01403769, 0.5275236, 1.360412, 1, 1, 1, 1, 1,
-0.01234713, -0.1510436, -2.445132, 1, 1, 1, 1, 1,
-0.009740527, -0.752742, -3.267929, 1, 1, 1, 1, 1,
-0.008895082, 0.08086731, -0.3374457, 1, 1, 1, 1, 1,
-0.008872202, 1.067899, -1.8252, 1, 1, 1, 1, 1,
-0.008327914, 0.1304948, -0.8187992, 1, 1, 1, 1, 1,
-0.007975227, 0.2996032, 0.8497763, 1, 1, 1, 1, 1,
-0.006286594, -2.066045, -3.090255, 1, 1, 1, 1, 1,
-0.0008712416, 0.3796367, -0.4477489, 0, 0, 1, 1, 1,
0.003292685, 0.1236371, -1.706761, 1, 0, 0, 1, 1,
0.008650602, -2.296071, 5.2992, 1, 0, 0, 1, 1,
0.00904865, -0.06346707, 0.5017794, 1, 0, 0, 1, 1,
0.01066386, 1.758418, -0.6364418, 1, 0, 0, 1, 1,
0.01297722, -0.1232229, 3.307307, 1, 0, 0, 1, 1,
0.02229538, -0.6511229, 2.756239, 0, 0, 0, 1, 1,
0.0247433, 1.074968, 0.4604786, 0, 0, 0, 1, 1,
0.02667198, -0.983246, 3.88009, 0, 0, 0, 1, 1,
0.02814085, 1.559722, 0.1748206, 0, 0, 0, 1, 1,
0.03347218, 0.3657273, 0.8908751, 0, 0, 0, 1, 1,
0.03769301, -0.3994069, 3.311035, 0, 0, 0, 1, 1,
0.03933527, 0.8430099, -0.7638502, 0, 0, 0, 1, 1,
0.04033286, -0.8566649, 4.540384, 1, 1, 1, 1, 1,
0.04103913, -1.443597, 2.655923, 1, 1, 1, 1, 1,
0.04479326, 1.326547, -1.041294, 1, 1, 1, 1, 1,
0.04734584, 1.820138, 0.7423835, 1, 1, 1, 1, 1,
0.05153575, -1.471368, 3.01268, 1, 1, 1, 1, 1,
0.05263917, 0.1221443, 0.9621948, 1, 1, 1, 1, 1,
0.06100215, -0.9648325, 3.823101, 1, 1, 1, 1, 1,
0.06106295, 1.582112, 1.705531, 1, 1, 1, 1, 1,
0.06192807, -0.9316339, 2.8642, 1, 1, 1, 1, 1,
0.0626357, 0.3632109, -1.36752, 1, 1, 1, 1, 1,
0.06380667, -1.996931, 3.090183, 1, 1, 1, 1, 1,
0.06575033, 2.107737, 0.9196486, 1, 1, 1, 1, 1,
0.0724543, 1.838912, -1.957467, 1, 1, 1, 1, 1,
0.07373677, 0.6692769, -1.647753, 1, 1, 1, 1, 1,
0.08132489, -0.4809788, 1.517186, 1, 1, 1, 1, 1,
0.08212869, 1.888425, -0.03188598, 0, 0, 1, 1, 1,
0.08337755, -0.07315316, 2.170838, 1, 0, 0, 1, 1,
0.08537813, -1.715836, 2.325768, 1, 0, 0, 1, 1,
0.09899309, -1.861344, 4.98377, 1, 0, 0, 1, 1,
0.1059627, -1.277007, 2.960317, 1, 0, 0, 1, 1,
0.1061277, 0.6312757, -1.452294, 1, 0, 0, 1, 1,
0.1066759, 1.776073, 0.8910385, 0, 0, 0, 1, 1,
0.1074493, 0.01414264, 1.695677, 0, 0, 0, 1, 1,
0.1131826, 0.4786308, 1.125643, 0, 0, 0, 1, 1,
0.11532, 0.3732464, -0.6156285, 0, 0, 0, 1, 1,
0.1169267, 0.9866653, 0.5532212, 0, 0, 0, 1, 1,
0.1308577, 0.6911721, 1.037097, 0, 0, 0, 1, 1,
0.1325548, -0.8834305, 2.144031, 0, 0, 0, 1, 1,
0.1357679, 0.3163127, 1.806132, 1, 1, 1, 1, 1,
0.1360932, -0.0748272, 1.284803, 1, 1, 1, 1, 1,
0.1377549, 0.3473993, 1.855881, 1, 1, 1, 1, 1,
0.1474469, -0.7664363, 2.615905, 1, 1, 1, 1, 1,
0.1483981, -0.5752313, 2.914043, 1, 1, 1, 1, 1,
0.1554526, 1.604117, -0.6866322, 1, 1, 1, 1, 1,
0.1564542, -0.3872195, 4.335548, 1, 1, 1, 1, 1,
0.1568238, -0.551239, 1.884136, 1, 1, 1, 1, 1,
0.1609712, 1.074237, 0.5354843, 1, 1, 1, 1, 1,
0.1613109, -1.585103, 3.618423, 1, 1, 1, 1, 1,
0.1665609, 1.170126, 0.07416034, 1, 1, 1, 1, 1,
0.1697162, -1.979563, 3.464368, 1, 1, 1, 1, 1,
0.1709655, -0.7451424, 1.460553, 1, 1, 1, 1, 1,
0.1731482, -0.4736798, 2.614098, 1, 1, 1, 1, 1,
0.1756628, 0.3039578, 1.27461, 1, 1, 1, 1, 1,
0.1786034, -1.496993, 3.073833, 0, 0, 1, 1, 1,
0.1832258, -0.4133908, 1.605312, 1, 0, 0, 1, 1,
0.185103, -1.076182, 3.177472, 1, 0, 0, 1, 1,
0.1851371, -0.2586836, 2.804427, 1, 0, 0, 1, 1,
0.1893488, 3.015796, 0.8908282, 1, 0, 0, 1, 1,
0.1896097, -0.3287717, 3.380446, 1, 0, 0, 1, 1,
0.1909351, -1.118202, 2.935508, 0, 0, 0, 1, 1,
0.1927421, 0.3770619, 1.841978, 0, 0, 0, 1, 1,
0.1942537, -1.211445, 4.999784, 0, 0, 0, 1, 1,
0.1965944, 1.096633, -0.9258668, 0, 0, 0, 1, 1,
0.2012618, 0.5887997, 0.9158656, 0, 0, 0, 1, 1,
0.2012842, 0.6433009, 0.8813987, 0, 0, 0, 1, 1,
0.2035622, -1.129166, 3.401469, 0, 0, 0, 1, 1,
0.207938, 2.261303, -0.3964635, 1, 1, 1, 1, 1,
0.2092011, 0.4684368, 0.001943759, 1, 1, 1, 1, 1,
0.2094155, -0.3983873, 3.318894, 1, 1, 1, 1, 1,
0.2105652, -0.6748289, 2.835682, 1, 1, 1, 1, 1,
0.2153976, 0.6206285, 2.11682, 1, 1, 1, 1, 1,
0.2182843, 0.5912869, 0.7278852, 1, 1, 1, 1, 1,
0.2210945, 0.2899816, 1.523734, 1, 1, 1, 1, 1,
0.2213443, 0.6840726, 0.5357522, 1, 1, 1, 1, 1,
0.2221356, 0.03237428, 0.88894, 1, 1, 1, 1, 1,
0.2295651, -0.8822811, 3.411942, 1, 1, 1, 1, 1,
0.2307944, -1.922721, 3.631677, 1, 1, 1, 1, 1,
0.2357524, 1.427753, 1.065492, 1, 1, 1, 1, 1,
0.237406, -1.35709, 3.651241, 1, 1, 1, 1, 1,
0.2385558, 0.2371831, 0.9672883, 1, 1, 1, 1, 1,
0.2387746, -0.07902784, 0.4407719, 1, 1, 1, 1, 1,
0.2391008, 1.947229, 0.4832733, 0, 0, 1, 1, 1,
0.2392759, -0.6417668, 1.678863, 1, 0, 0, 1, 1,
0.2453882, -1.459776, 3.326958, 1, 0, 0, 1, 1,
0.2470932, 0.5747973, 1.609796, 1, 0, 0, 1, 1,
0.2473429, 0.2157119, -0.5666775, 1, 0, 0, 1, 1,
0.2541204, 0.4982951, -0.3946094, 1, 0, 0, 1, 1,
0.256995, -1.49246, 1.694028, 0, 0, 0, 1, 1,
0.2571724, -0.1920394, 1.011095, 0, 0, 0, 1, 1,
0.2695294, -1.316651, 4.780978, 0, 0, 0, 1, 1,
0.2698932, -0.5516341, 2.41997, 0, 0, 0, 1, 1,
0.2702087, -1.029042, 2.445405, 0, 0, 0, 1, 1,
0.2737487, 0.808259, 0.5986515, 0, 0, 0, 1, 1,
0.2771285, -1.047889, 3.345163, 0, 0, 0, 1, 1,
0.2794528, -0.1089194, 0.788291, 1, 1, 1, 1, 1,
0.2802908, 1.911456, 0.1691573, 1, 1, 1, 1, 1,
0.2880502, -0.9065232, 2.314863, 1, 1, 1, 1, 1,
0.2886146, 0.8975201, 2.257422, 1, 1, 1, 1, 1,
0.28941, -0.2676801, 2.503873, 1, 1, 1, 1, 1,
0.2895198, 0.5935622, 0.5510046, 1, 1, 1, 1, 1,
0.2904372, 0.004005777, -0.3972687, 1, 1, 1, 1, 1,
0.2907584, -0.5702093, 0.9779856, 1, 1, 1, 1, 1,
0.292188, -0.2865819, 1.377085, 1, 1, 1, 1, 1,
0.2937776, -0.4919909, 1.804152, 1, 1, 1, 1, 1,
0.2974729, 0.9529877, 1.326366, 1, 1, 1, 1, 1,
0.2975049, -1.215475, 1.728723, 1, 1, 1, 1, 1,
0.2982187, 0.3556897, -0.2150139, 1, 1, 1, 1, 1,
0.2983844, -0.80582, 2.212215, 1, 1, 1, 1, 1,
0.2986007, 2.107065, 1.221885, 1, 1, 1, 1, 1,
0.2989115, 0.6330835, 1.775076, 0, 0, 1, 1, 1,
0.2992641, 0.7834737, -1.354926, 1, 0, 0, 1, 1,
0.3018533, 0.004654429, 0.5879155, 1, 0, 0, 1, 1,
0.3058277, -1.304392, 3.144344, 1, 0, 0, 1, 1,
0.3078632, -0.9514028, 5.482426, 1, 0, 0, 1, 1,
0.3086264, -0.5324942, 2.746018, 1, 0, 0, 1, 1,
0.3161865, -0.7903101, 1.800822, 0, 0, 0, 1, 1,
0.3233182, 0.3120563, 1.051219, 0, 0, 0, 1, 1,
0.3235823, -0.1016793, 2.382726, 0, 0, 0, 1, 1,
0.3255612, 0.7343453, 0.4475384, 0, 0, 0, 1, 1,
0.3256581, 1.089908, 0.5007235, 0, 0, 0, 1, 1,
0.3257299, -2.410399, 2.0868, 0, 0, 0, 1, 1,
0.3281956, 0.06950229, 1.195005, 0, 0, 0, 1, 1,
0.3311172, 0.5500318, -0.763052, 1, 1, 1, 1, 1,
0.331499, -1.26977, 3.662251, 1, 1, 1, 1, 1,
0.3324454, 0.3102179, 1.874996, 1, 1, 1, 1, 1,
0.3395067, -0.4399291, 1.996321, 1, 1, 1, 1, 1,
0.3438917, 0.655349, 0.7484394, 1, 1, 1, 1, 1,
0.3445535, 0.2920026, -0.700075, 1, 1, 1, 1, 1,
0.3453249, 0.6887986, 1.206979, 1, 1, 1, 1, 1,
0.3454182, -1.919317, 2.569952, 1, 1, 1, 1, 1,
0.3566796, 1.835264, -0.6667222, 1, 1, 1, 1, 1,
0.358164, 0.442513, 1.556985, 1, 1, 1, 1, 1,
0.3625862, 0.8749633, 0.3338569, 1, 1, 1, 1, 1,
0.3672136, 0.3254575, 1.5623, 1, 1, 1, 1, 1,
0.3698677, 0.4098999, 0.5418753, 1, 1, 1, 1, 1,
0.37008, 0.8091054, 1.622149, 1, 1, 1, 1, 1,
0.3730848, -0.781077, 1.798448, 1, 1, 1, 1, 1,
0.373385, 1.450329, -0.09919307, 0, 0, 1, 1, 1,
0.375604, 1.252131, 1.71424, 1, 0, 0, 1, 1,
0.3803441, 0.3361096, 2.373267, 1, 0, 0, 1, 1,
0.385123, 0.1685788, 1.371194, 1, 0, 0, 1, 1,
0.3870248, 0.9351764, 0.664356, 1, 0, 0, 1, 1,
0.3877822, 0.4881914, 1.423021, 1, 0, 0, 1, 1,
0.3917123, 0.3194441, 0.7200403, 0, 0, 0, 1, 1,
0.3959352, -0.7667584, -0.004506145, 0, 0, 0, 1, 1,
0.400108, -1.234601, 0.8193206, 0, 0, 0, 1, 1,
0.4007035, -0.8271612, 2.130034, 0, 0, 0, 1, 1,
0.4008457, 1.796284, 0.2484252, 0, 0, 0, 1, 1,
0.4025891, -0.2801135, 3.444071, 0, 0, 0, 1, 1,
0.4072533, 1.414161, -0.6443462, 0, 0, 0, 1, 1,
0.4085778, -0.0429018, 1.421907, 1, 1, 1, 1, 1,
0.4178068, -0.3162917, 2.000544, 1, 1, 1, 1, 1,
0.420171, 0.2847424, 0.7770677, 1, 1, 1, 1, 1,
0.4211713, -0.3851312, 2.246917, 1, 1, 1, 1, 1,
0.4218626, 0.2182914, 2.739919, 1, 1, 1, 1, 1,
0.4228009, -1.967668, 1.126099, 1, 1, 1, 1, 1,
0.4307833, 0.3104173, 1.670676, 1, 1, 1, 1, 1,
0.4325355, 0.9732098, 0.6331919, 1, 1, 1, 1, 1,
0.4329703, 0.3624625, -0.0538582, 1, 1, 1, 1, 1,
0.4335901, 1.329553, 1.095776, 1, 1, 1, 1, 1,
0.4352435, -0.008970691, 1.401104, 1, 1, 1, 1, 1,
0.4363456, 1.948367, 1.189767, 1, 1, 1, 1, 1,
0.4393896, -0.8137532, 2.342796, 1, 1, 1, 1, 1,
0.4506968, 1.57607, -0.362321, 1, 1, 1, 1, 1,
0.4596366, -0.2503796, 1.182906, 1, 1, 1, 1, 1,
0.4637238, 0.02498624, 1.9555, 0, 0, 1, 1, 1,
0.4645641, 0.07762176, 2.029141, 1, 0, 0, 1, 1,
0.4690791, 0.1829516, 1.708778, 1, 0, 0, 1, 1,
0.4698805, -0.02380767, 1.8867, 1, 0, 0, 1, 1,
0.4714738, 0.7003477, 0.4064044, 1, 0, 0, 1, 1,
0.4728041, -1.682825, 2.833611, 1, 0, 0, 1, 1,
0.4736316, 2.439323, 2.377568, 0, 0, 0, 1, 1,
0.4747182, 0.9535666, -1.113427, 0, 0, 0, 1, 1,
0.4770242, -0.6785166, 2.30187, 0, 0, 0, 1, 1,
0.4782324, 0.4324979, 0.9283516, 0, 0, 0, 1, 1,
0.4829218, 0.1198574, 1.531637, 0, 0, 0, 1, 1,
0.4830073, -1.400676, 3.452894, 0, 0, 0, 1, 1,
0.4877737, 1.622492, 0.199902, 0, 0, 0, 1, 1,
0.4887071, 1.193889, 0.7404997, 1, 1, 1, 1, 1,
0.4901162, -1.572306, 2.092005, 1, 1, 1, 1, 1,
0.4909485, -1.492159, 2.323757, 1, 1, 1, 1, 1,
0.4911904, -0.07659561, 0.9569774, 1, 1, 1, 1, 1,
0.4920127, -0.5758347, 3.160552, 1, 1, 1, 1, 1,
0.4921631, -1.667245, 3.429905, 1, 1, 1, 1, 1,
0.4954697, -0.09147419, 2.147806, 1, 1, 1, 1, 1,
0.5001879, -0.07698291, 1.119678, 1, 1, 1, 1, 1,
0.5030394, 1.142939, -0.176164, 1, 1, 1, 1, 1,
0.5062738, 1.362516, 0.2322718, 1, 1, 1, 1, 1,
0.509734, 0.5076933, -0.3904727, 1, 1, 1, 1, 1,
0.5107293, -1.304129, 3.246031, 1, 1, 1, 1, 1,
0.5114787, 0.8328138, -0.897365, 1, 1, 1, 1, 1,
0.513743, 0.3176481, 2.102313, 1, 1, 1, 1, 1,
0.5146444, -2.077101, 1.981006, 1, 1, 1, 1, 1,
0.5220427, 0.1781349, 1.438628, 0, 0, 1, 1, 1,
0.5273811, 1.478467, 0.2756965, 1, 0, 0, 1, 1,
0.5329472, -0.826633, 3.98782, 1, 0, 0, 1, 1,
0.5337232, 0.7820027, 1.679549, 1, 0, 0, 1, 1,
0.5463889, -0.1037145, 3.020699, 1, 0, 0, 1, 1,
0.5495769, 1.261228, 0.663209, 1, 0, 0, 1, 1,
0.5508401, -1.198868, 3.607241, 0, 0, 0, 1, 1,
0.5528467, 0.3399931, 0.6359962, 0, 0, 0, 1, 1,
0.552973, 0.2578241, -0.4545808, 0, 0, 0, 1, 1,
0.5577374, 0.3594096, 0.9875194, 0, 0, 0, 1, 1,
0.5582836, 0.5861487, 0.6746914, 0, 0, 0, 1, 1,
0.5649322, 0.007061971, 1.23244, 0, 0, 0, 1, 1,
0.5652928, 0.4327066, 0.9975438, 0, 0, 0, 1, 1,
0.5675254, 0.4313932, -0.1966546, 1, 1, 1, 1, 1,
0.5712283, -0.002257287, 1.494561, 1, 1, 1, 1, 1,
0.5753097, -1.73193, 0.5365028, 1, 1, 1, 1, 1,
0.5754782, -0.712843, 1.432259, 1, 1, 1, 1, 1,
0.5756068, -0.01984515, 2.180845, 1, 1, 1, 1, 1,
0.5785475, 1.218398, -0.05168262, 1, 1, 1, 1, 1,
0.5837482, -1.322456, 2.523434, 1, 1, 1, 1, 1,
0.587674, -1.21689, 1.683212, 1, 1, 1, 1, 1,
0.5883543, -0.0370368, 2.3808, 1, 1, 1, 1, 1,
0.5886133, -0.2887034, 0.04914716, 1, 1, 1, 1, 1,
0.5901354, -0.7291664, 1.296222, 1, 1, 1, 1, 1,
0.5954636, 0.9154081, 0.09235023, 1, 1, 1, 1, 1,
0.5956736, -0.4163362, 1.324192, 1, 1, 1, 1, 1,
0.596594, -0.04285667, 1.77742, 1, 1, 1, 1, 1,
0.5997093, -1.401288, 2.712869, 1, 1, 1, 1, 1,
0.601074, 1.609958, -0.1885904, 0, 0, 1, 1, 1,
0.6061212, -0.7425888, 3.021298, 1, 0, 0, 1, 1,
0.6105638, 4.180622, 0.1913288, 1, 0, 0, 1, 1,
0.6108333, 1.329873, -0.2673231, 1, 0, 0, 1, 1,
0.6138005, 0.400153, 0.2770693, 1, 0, 0, 1, 1,
0.6146325, -0.4667177, 1.574156, 1, 0, 0, 1, 1,
0.6164367, -0.8318427, 2.055247, 0, 0, 0, 1, 1,
0.6193152, -0.5021787, 3.317477, 0, 0, 0, 1, 1,
0.6219684, -1.083284, 3.069218, 0, 0, 0, 1, 1,
0.6316732, 0.9254718, 0.1672145, 0, 0, 0, 1, 1,
0.6392243, -0.1829315, 1.360678, 0, 0, 0, 1, 1,
0.6457952, -0.2216593, 1.311485, 0, 0, 0, 1, 1,
0.6493862, -0.8523144, 2.980218, 0, 0, 0, 1, 1,
0.6574137, -0.4872411, 1.586554, 1, 1, 1, 1, 1,
0.6646494, -0.5743182, 1.814413, 1, 1, 1, 1, 1,
0.6667705, -0.4252096, 1.160568, 1, 1, 1, 1, 1,
0.6669217, 0.7398391, 0.9592397, 1, 1, 1, 1, 1,
0.6686729, -0.9198228, 1.090599, 1, 1, 1, 1, 1,
0.6735254, 0.2073007, 1.989172, 1, 1, 1, 1, 1,
0.6755649, 0.1868276, 1.829289, 1, 1, 1, 1, 1,
0.6767421, 1.707371, 0.007307034, 1, 1, 1, 1, 1,
0.6800803, -0.6155515, 1.962697, 1, 1, 1, 1, 1,
0.680719, -1.279642, 1.295051, 1, 1, 1, 1, 1,
0.6942095, -1.511079, 3.217917, 1, 1, 1, 1, 1,
0.6947908, 0.180379, -0.7121311, 1, 1, 1, 1, 1,
0.695423, -1.208835, 3.210661, 1, 1, 1, 1, 1,
0.7052211, 0.9583294, 0.166341, 1, 1, 1, 1, 1,
0.7071601, -1.701593, 4.208653, 1, 1, 1, 1, 1,
0.7092867, -1.36391, 3.375312, 0, 0, 1, 1, 1,
0.7105582, 1.318046, -0.5950802, 1, 0, 0, 1, 1,
0.7114149, 0.4260412, 1.000223, 1, 0, 0, 1, 1,
0.7148439, -0.3965475, 2.506505, 1, 0, 0, 1, 1,
0.7148893, 0.5859452, -0.1763124, 1, 0, 0, 1, 1,
0.7149461, 0.5277252, 1.63633, 1, 0, 0, 1, 1,
0.7173278, -0.4818703, 2.699198, 0, 0, 0, 1, 1,
0.7205914, -0.2043953, 1.539701, 0, 0, 0, 1, 1,
0.7232378, 1.180218, 1.708588, 0, 0, 0, 1, 1,
0.7243533, 0.5668659, 2.034932, 0, 0, 0, 1, 1,
0.7271659, 0.5693761, -1.274274, 0, 0, 0, 1, 1,
0.7320181, 0.2317773, 0.5898909, 0, 0, 0, 1, 1,
0.736506, 0.05273711, 0.1701833, 0, 0, 0, 1, 1,
0.7385374, -1.02059, 2.234992, 1, 1, 1, 1, 1,
0.7395558, 1.142792, -0.3556925, 1, 1, 1, 1, 1,
0.7420055, 0.002217267, 0.1477241, 1, 1, 1, 1, 1,
0.7518565, 0.105009, -0.1991022, 1, 1, 1, 1, 1,
0.7530326, -1.657385, 3.912413, 1, 1, 1, 1, 1,
0.7531409, -0.2736538, 1.372911, 1, 1, 1, 1, 1,
0.7538189, -0.2429925, 1.944506, 1, 1, 1, 1, 1,
0.7542243, -0.3121051, 2.177888, 1, 1, 1, 1, 1,
0.7551277, -1.597329, 4.446689, 1, 1, 1, 1, 1,
0.7576768, -0.2149245, 1.989333, 1, 1, 1, 1, 1,
0.7601729, -0.07351857, 1.050386, 1, 1, 1, 1, 1,
0.7616811, 0.09490886, 0.237856, 1, 1, 1, 1, 1,
0.7627987, 0.8680094, -0.5937331, 1, 1, 1, 1, 1,
0.7629737, 1.43495, -0.8803023, 1, 1, 1, 1, 1,
0.7630975, -2.632299, 2.280009, 1, 1, 1, 1, 1,
0.7737998, 1.194582, -0.2628962, 0, 0, 1, 1, 1,
0.7738181, 1.629019, 0.7097221, 1, 0, 0, 1, 1,
0.7749209, -1.113737, 1.964878, 1, 0, 0, 1, 1,
0.7907643, 0.02841237, 2.353112, 1, 0, 0, 1, 1,
0.7946628, -0.3210724, 3.331235, 1, 0, 0, 1, 1,
0.7975424, -1.034027, 4.143799, 1, 0, 0, 1, 1,
0.8004122, 0.6128372, 0.4986899, 0, 0, 0, 1, 1,
0.8004819, 1.17542, 2.894977, 0, 0, 0, 1, 1,
0.8254695, -0.308158, 1.496803, 0, 0, 0, 1, 1,
0.8257859, 0.5099222, 1.226775, 0, 0, 0, 1, 1,
0.8285258, -0.8419726, 1.286608, 0, 0, 0, 1, 1,
0.8328173, 0.3864552, 0.5708061, 0, 0, 0, 1, 1,
0.8429425, -1.0152, 2.275609, 0, 0, 0, 1, 1,
0.8429683, 1.127898, -0.063357, 1, 1, 1, 1, 1,
0.8441273, 0.1571651, 3.869498, 1, 1, 1, 1, 1,
0.8441635, -0.2699193, 2.177418, 1, 1, 1, 1, 1,
0.8482757, -1.493017, 2.8177, 1, 1, 1, 1, 1,
0.8551428, -0.06196428, 1.744969, 1, 1, 1, 1, 1,
0.865375, 0.5720686, 2.09743, 1, 1, 1, 1, 1,
0.8678883, -0.4939883, 1.237797, 1, 1, 1, 1, 1,
0.8700158, 0.02172096, 1.080238, 1, 1, 1, 1, 1,
0.8811301, -0.9097146, 3.425607, 1, 1, 1, 1, 1,
0.8842416, -0.0463061, 2.45832, 1, 1, 1, 1, 1,
0.8892627, 2.07331, 0.7637597, 1, 1, 1, 1, 1,
0.8947629, -0.6896533, 3.36138, 1, 1, 1, 1, 1,
0.8979896, -0.2231656, 1.09897, 1, 1, 1, 1, 1,
0.9064119, -1.074564, 1.419619, 1, 1, 1, 1, 1,
0.9077367, 0.575853, 2.511511, 1, 1, 1, 1, 1,
0.9085867, 0.2309732, 1.331777, 0, 0, 1, 1, 1,
0.9092427, -0.1137915, 2.502333, 1, 0, 0, 1, 1,
0.9146, -1.17624, 1.665495, 1, 0, 0, 1, 1,
0.9164145, 0.2113063, -0.3481934, 1, 0, 0, 1, 1,
0.9218433, 0.5635154, -0.2287299, 1, 0, 0, 1, 1,
0.9222041, -0.3803063, 2.525941, 1, 0, 0, 1, 1,
0.9222595, -0.5897408, 3.8937, 0, 0, 0, 1, 1,
0.9225805, 1.596825, -0.8540363, 0, 0, 0, 1, 1,
0.9245876, -0.2317291, 2.065986, 0, 0, 0, 1, 1,
0.9331859, -1.384721, 1.546872, 0, 0, 0, 1, 1,
0.951391, 0.1046114, 1.719571, 0, 0, 0, 1, 1,
0.9526516, 0.6363928, 1.520183, 0, 0, 0, 1, 1,
0.9536251, 1.057678, 1.639093, 0, 0, 0, 1, 1,
0.9565265, 1.340609, -1.370387, 1, 1, 1, 1, 1,
0.957493, 0.5070195, -0.03886179, 1, 1, 1, 1, 1,
0.9593273, -0.6177709, 2.203957, 1, 1, 1, 1, 1,
0.9601949, -0.02715384, 1.332741, 1, 1, 1, 1, 1,
0.9644686, -0.3773143, 0.3556917, 1, 1, 1, 1, 1,
0.9678593, -1.738368, 2.151453, 1, 1, 1, 1, 1,
0.968778, -1.168914, 2.891916, 1, 1, 1, 1, 1,
0.9728354, 0.04382984, 1.765308, 1, 1, 1, 1, 1,
0.974093, -0.9003466, 2.543227, 1, 1, 1, 1, 1,
0.9752617, 0.3199709, 1.427714, 1, 1, 1, 1, 1,
0.9798627, -0.07775299, 0.5857787, 1, 1, 1, 1, 1,
0.9829975, -0.1303091, 2.180563, 1, 1, 1, 1, 1,
0.9832824, -0.1641552, 0.6470668, 1, 1, 1, 1, 1,
0.9836144, 2.173851, -0.01139661, 1, 1, 1, 1, 1,
0.9880826, -0.3649297, 0.3838487, 1, 1, 1, 1, 1,
0.9886051, 0.5492004, 1.384231, 0, 0, 1, 1, 1,
0.9887398, -0.5566351, 2.415355, 1, 0, 0, 1, 1,
0.9888116, -0.3173836, 2.314552, 1, 0, 0, 1, 1,
0.9947801, -0.918576, 1.824403, 1, 0, 0, 1, 1,
0.9948248, 0.4296831, -0.03258547, 1, 0, 0, 1, 1,
0.9992895, 0.492025, 0.7228079, 1, 0, 0, 1, 1,
0.9994144, -0.3053256, 0.6244997, 0, 0, 0, 1, 1,
1.002075, 0.2296713, 1.066074, 0, 0, 0, 1, 1,
1.004035, 1.074587, 0.2805141, 0, 0, 0, 1, 1,
1.004282, -0.331406, 3.40034, 0, 0, 0, 1, 1,
1.013546, -1.139788, 2.136201, 0, 0, 0, 1, 1,
1.020218, 0.4780168, 1.807869, 0, 0, 0, 1, 1,
1.020369, 0.8066163, 0.1569979, 0, 0, 0, 1, 1,
1.020508, -0.2579438, 3.309469, 1, 1, 1, 1, 1,
1.022186, 1.47734, -0.1699671, 1, 1, 1, 1, 1,
1.024076, 0.3909498, 2.423203, 1, 1, 1, 1, 1,
1.025278, 0.2840348, 3.043229, 1, 1, 1, 1, 1,
1.034099, -0.4228329, 1.506531, 1, 1, 1, 1, 1,
1.040487, 0.2379038, 1.148662, 1, 1, 1, 1, 1,
1.04628, 1.250924, -0.2405995, 1, 1, 1, 1, 1,
1.046908, -0.09016558, 1.583125, 1, 1, 1, 1, 1,
1.050002, 2.359585, -0.003730284, 1, 1, 1, 1, 1,
1.05437, 0.7709474, 1.697141, 1, 1, 1, 1, 1,
1.055962, -0.3243541, 0.8859753, 1, 1, 1, 1, 1,
1.060471, -0.7815459, 2.693323, 1, 1, 1, 1, 1,
1.061018, -0.1241122, 1.789566, 1, 1, 1, 1, 1,
1.061699, -0.187243, 1.333566, 1, 1, 1, 1, 1,
1.074739, 1.85538, 0.7172171, 1, 1, 1, 1, 1,
1.07684, 0.1729343, 2.179525, 0, 0, 1, 1, 1,
1.079606, -0.864162, 1.979322, 1, 0, 0, 1, 1,
1.079935, 0.9746052, 0.1504832, 1, 0, 0, 1, 1,
1.085091, -0.2850812, 0.7331185, 1, 0, 0, 1, 1,
1.086141, 1.648578, -0.3325181, 1, 0, 0, 1, 1,
1.086933, 2.079157, 1.155203, 1, 0, 0, 1, 1,
1.090211, -0.3231423, 0.2266275, 0, 0, 0, 1, 1,
1.095804, -0.4358322, 2.075806, 0, 0, 0, 1, 1,
1.096351, -0.6379063, 1.905323, 0, 0, 0, 1, 1,
1.106864, 0.8754906, 1.266345, 0, 0, 0, 1, 1,
1.11168, 0.8262094, 1.13265, 0, 0, 0, 1, 1,
1.12092, -0.2938542, 1.183868, 0, 0, 0, 1, 1,
1.124429, -1.047128, 2.765965, 0, 0, 0, 1, 1,
1.127527, 0.7423885, 1.323165, 1, 1, 1, 1, 1,
1.128646, -0.03751009, 2.400845, 1, 1, 1, 1, 1,
1.130755, -0.8553633, 2.340816, 1, 1, 1, 1, 1,
1.132921, 0.8184881, 2.313339, 1, 1, 1, 1, 1,
1.134922, 0.4773447, -0.4409131, 1, 1, 1, 1, 1,
1.139329, -0.2656939, 3.003306, 1, 1, 1, 1, 1,
1.146646, -0.06956221, 3.246419, 1, 1, 1, 1, 1,
1.153765, -0.4258668, 0.729763, 1, 1, 1, 1, 1,
1.15662, -1.369687, 0.7212476, 1, 1, 1, 1, 1,
1.157118, 0.001036428, 1.644803, 1, 1, 1, 1, 1,
1.166724, -0.2077032, 1.484064, 1, 1, 1, 1, 1,
1.166939, -0.4515583, 1.097128, 1, 1, 1, 1, 1,
1.167982, 0.1239887, 0.7907993, 1, 1, 1, 1, 1,
1.188984, -0.3563781, 0.7467255, 1, 1, 1, 1, 1,
1.195974, 1.299534, 0.5884367, 1, 1, 1, 1, 1,
1.19923, -0.1691756, 2.321998, 0, 0, 1, 1, 1,
1.199899, -0.3053899, 1.52553, 1, 0, 0, 1, 1,
1.207744, -1.279891, 2.782236, 1, 0, 0, 1, 1,
1.213545, -0.3254066, 2.058607, 1, 0, 0, 1, 1,
1.216067, 0.6939477, 2.541112, 1, 0, 0, 1, 1,
1.2264, -0.1422504, 0.6690347, 1, 0, 0, 1, 1,
1.233906, -0.1359621, 3.584664, 0, 0, 0, 1, 1,
1.236224, -0.9377626, 3.45936, 0, 0, 0, 1, 1,
1.240856, -1.35414, 2.87158, 0, 0, 0, 1, 1,
1.24381, 0.6898342, 1.566288, 0, 0, 0, 1, 1,
1.246366, -0.7442139, 1.941616, 0, 0, 0, 1, 1,
1.246968, -1.469784, 2.753548, 0, 0, 0, 1, 1,
1.26372, 1.084384, 0.739009, 0, 0, 0, 1, 1,
1.264156, 1.025095, 0.6129928, 1, 1, 1, 1, 1,
1.266907, -0.849268, 2.109272, 1, 1, 1, 1, 1,
1.267293, 0.9517342, -0.2401856, 1, 1, 1, 1, 1,
1.271731, -0.1105709, 0.07158205, 1, 1, 1, 1, 1,
1.277059, -0.4288034, 2.665328, 1, 1, 1, 1, 1,
1.294028, 1.55637, 0.330559, 1, 1, 1, 1, 1,
1.297695, 0.2598253, 1.858139, 1, 1, 1, 1, 1,
1.304127, -1.199412, 1.381448, 1, 1, 1, 1, 1,
1.307806, 0.4208192, -0.548853, 1, 1, 1, 1, 1,
1.308269, 1.330496, 0.009076335, 1, 1, 1, 1, 1,
1.313276, -1.164415, 1.328014, 1, 1, 1, 1, 1,
1.31936, -0.5804843, 1.644126, 1, 1, 1, 1, 1,
1.321294, 0.5537555, 2.231885, 1, 1, 1, 1, 1,
1.330427, -0.9702048, 2.797538, 1, 1, 1, 1, 1,
1.335479, 0.4202409, 2.509743, 1, 1, 1, 1, 1,
1.339296, -1.914549, 2.559155, 0, 0, 1, 1, 1,
1.346112, 1.171966, 1.696479, 1, 0, 0, 1, 1,
1.349017, -0.8730538, 2.117299, 1, 0, 0, 1, 1,
1.349187, -1.621662, 1.821206, 1, 0, 0, 1, 1,
1.364859, 0.08388367, 2.146386, 1, 0, 0, 1, 1,
1.366288, -0.3026684, 2.871224, 1, 0, 0, 1, 1,
1.419643, -0.6699014, 2.176933, 0, 0, 0, 1, 1,
1.423655, 1.315826, 0.1274689, 0, 0, 0, 1, 1,
1.424742, -1.379909, 2.444036, 0, 0, 0, 1, 1,
1.427019, -0.6720812, 0.5433236, 0, 0, 0, 1, 1,
1.429556, 0.2146742, 1.984153, 0, 0, 0, 1, 1,
1.441061, -0.2668507, 2.758269, 0, 0, 0, 1, 1,
1.444293, 0.3353418, -0.6095753, 0, 0, 0, 1, 1,
1.458807, 0.64069, 1.304762, 1, 1, 1, 1, 1,
1.459657, -0.9429382, 2.547061, 1, 1, 1, 1, 1,
1.461723, 0.2955174, 1.539095, 1, 1, 1, 1, 1,
1.480533, -3.397129, 2.761591, 1, 1, 1, 1, 1,
1.482309, -0.8505566, 1.981297, 1, 1, 1, 1, 1,
1.496087, 1.391035, 2.02268, 1, 1, 1, 1, 1,
1.498721, 1.705738, -0.4440803, 1, 1, 1, 1, 1,
1.50366, -1.691018, 0.8734775, 1, 1, 1, 1, 1,
1.507925, 0.1518236, 2.834945, 1, 1, 1, 1, 1,
1.517818, 0.2453957, 0.942935, 1, 1, 1, 1, 1,
1.533194, -1.599153, 3.180326, 1, 1, 1, 1, 1,
1.545231, -1.973542, 3.118166, 1, 1, 1, 1, 1,
1.576724, 0.2197057, 0.6794978, 1, 1, 1, 1, 1,
1.613169, -0.3290716, 1.109825, 1, 1, 1, 1, 1,
1.62414, -0.4357349, 1.039944, 1, 1, 1, 1, 1,
1.625433, 0.2418635, 1.725487, 0, 0, 1, 1, 1,
1.62619, 1.388461, 1.564528, 1, 0, 0, 1, 1,
1.637191, -1.771921, 3.04645, 1, 0, 0, 1, 1,
1.63904, -0.355026, -0.3479585, 1, 0, 0, 1, 1,
1.647267, -2.004948, 2.991885, 1, 0, 0, 1, 1,
1.66256, 1.033013, 1.734255, 1, 0, 0, 1, 1,
1.66988, -0.4194474, 2.435233, 0, 0, 0, 1, 1,
1.679328, -0.5591846, 1.914581, 0, 0, 0, 1, 1,
1.689342, 0.7294589, 1.162317, 0, 0, 0, 1, 1,
1.695137, -0.5625934, 2.849881, 0, 0, 0, 1, 1,
1.707857, -1.744919, 2.60107, 0, 0, 0, 1, 1,
1.774275, -0.04078824, 1.313955, 0, 0, 0, 1, 1,
1.801504, -0.2321554, 2.876625, 0, 0, 0, 1, 1,
1.803656, 0.9844162, 0.5963693, 1, 1, 1, 1, 1,
1.804294, 0.387776, 0.5422121, 1, 1, 1, 1, 1,
1.805748, 0.2421932, 1.948179, 1, 1, 1, 1, 1,
1.817326, -1.385884, 1.280863, 1, 1, 1, 1, 1,
1.823785, -0.6775182, 0.8163124, 1, 1, 1, 1, 1,
1.84228, -0.3922612, 1.607157, 1, 1, 1, 1, 1,
1.843375, -0.3454231, 2.852564, 1, 1, 1, 1, 1,
1.852548, 1.487984, 1.704499, 1, 1, 1, 1, 1,
1.856925, 0.3021475, 2.131614, 1, 1, 1, 1, 1,
1.857796, -2.305654, 2.899113, 1, 1, 1, 1, 1,
1.875441, 1.585699, -1.667762, 1, 1, 1, 1, 1,
1.886584, -0.1203755, 1.770651, 1, 1, 1, 1, 1,
1.903985, -1.507155, 1.323947, 1, 1, 1, 1, 1,
1.914081, -1.170483, 2.966199, 1, 1, 1, 1, 1,
1.914972, -0.176054, 0.802339, 1, 1, 1, 1, 1,
1.944585, -0.6154973, 1.860231, 0, 0, 1, 1, 1,
1.953811, -0.9819272, 3.858637, 1, 0, 0, 1, 1,
1.968639, -0.0710623, 2.729203, 1, 0, 0, 1, 1,
1.977956, 1.031719, 2.658037, 1, 0, 0, 1, 1,
2.060779, -0.6584975, 2.407051, 1, 0, 0, 1, 1,
2.06689, 0.1160444, 2.050625, 1, 0, 0, 1, 1,
2.070371, 0.5559937, 1.355407, 0, 0, 0, 1, 1,
2.101719, 0.113304, 0.219511, 0, 0, 0, 1, 1,
2.11998, 1.034096, 0.3376782, 0, 0, 0, 1, 1,
2.171682, -1.270245, 1.305307, 0, 0, 0, 1, 1,
2.246084, 2.354722, 0.6675521, 0, 0, 0, 1, 1,
2.253426, -0.5395711, 2.600307, 0, 0, 0, 1, 1,
2.311694, 0.88231, 1.625417, 0, 0, 0, 1, 1,
2.32348, 1.510544, 1.515669, 1, 1, 1, 1, 1,
2.361278, 0.08108629, 1.760757, 1, 1, 1, 1, 1,
2.478156, 0.2306905, 0.5003, 1, 1, 1, 1, 1,
2.494801, 0.4301046, 1.318971, 1, 1, 1, 1, 1,
2.510835, -0.4033695, 2.210254, 1, 1, 1, 1, 1,
2.598875, -0.5519834, 3.047127, 1, 1, 1, 1, 1,
2.859433, -0.8042555, 3.022224, 1, 1, 1, 1, 1
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
var radius = 9.67007;
var distance = 33.96571;
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
mvMatrix.translate( 0.1244792, -0.3917465, -0.2794983 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.96571);
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
